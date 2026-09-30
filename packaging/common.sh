#!/usr/bin/env bash
# Shared by packaging/<os>/build_app_<os>.sh — sourced, never run on its own.
#
# Expects, from the caller's environment:
#   APP_VERSION   the release version, YYYY.M.N (e.g. 2026.9.1)
#   APP_DIR       the jar extracted by `java -Djarmode=tools -jar pholio-<version>.jar extract`:
#                 pholio-<version>.jar (thin, Main-Class + Class-Path in its manifest) next to lib/
#   OUT_DIR       where the finished installer and its .sha256 go
#   JAVA_HOME     a JDK 27 that bundles JavaFX, jmods included (actions/setup-java, zulu, jdk+fx)
#
# Produces build/input (the application jars jpackage copies into the app) and build/runtime (a jlink'ed
# Java runtime holding only the modules the application needs), then leaves jpackage to the OS script.
set -euo pipefail

: "${APP_VERSION:?APP_VERSION is required}"
: "${APP_DIR:?APP_DIR is required}"
: "${OUT_DIR:?OUT_DIR is required}"
: "${JAVA_HOME:?JAVA_HOME is required}"

PACKAGING_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BUILD_DIR="build"
INPUT_DIR="${BUILD_DIR}/input"
RUNTIME_DIR="${BUILD_DIR}/runtime"
MAIN_JAR="pholio-${APP_VERSION}.jar"
APP_NAME="Pholio"
APP_VENDOR="Imag-In"
APP_DESCRIPTION="High-volume desktop photo and media library manager"
APP_COPYRIGHT="Copyright © $(date +%Y) ${APP_VENDOR}"

# Git Bash on Windows: JAVA_HOME is a Windows path; turn it into one bash can execute from.
if command -v cygpath >/dev/null 2>&1; then
    JAVA_BIN="$(cygpath -u "${JAVA_HOME}")/bin"
else
    JAVA_BIN="${JAVA_HOME}/bin"
fi

# JVM options baked into the native launcher.
#   --enable-native-access   JavaFX, JNA, ONNX Runtime and the macOS process naming all call native code.
#   EnableDynamicAgentLoading FxThreadAgent self-attaches Byte Buddy at startup.
JAVA_OPTIONS=(
    "--enable-native-access=ALL-UNNAMED,javafx.graphics"
    "-XX:+EnableDynamicAgentLoading"
    "-XX:+UseZGC"
    "-Dspring.jmx.enabled=false"
)

log() { printf '\n[packaging] %s\n' "$*"; }

prepare_input() {
    log "Preparing jpackage input from ${APP_DIR}"
    rm -rf "${BUILD_DIR}"
    mkdir -p "${INPUT_DIR}" "${OUT_DIR}"
    cp "${APP_DIR}/${MAIN_JAR}" "${INPUT_DIR}/"
    cp -R "${APP_DIR}/lib" "${INPUT_DIR}/lib"
    # The OpenJFX jars were resolved for the machine that built the release (their natives are that OS's
    # only). The runtime below carries the right JavaFX for this OS as modules, which win over the class
    # path anyway — so these jars are dead weight at best. ikonli-javafx and the like are not OpenJFX and stay.
    find "${INPUT_DIR}/lib" -maxdepth 1 -name 'javafx-*.jar' -print -delete
}

# ONNX Runtime ships one jar with the native libraries of every platform (~590 MB unpacked, win-x64 alone
# 351 MB). Keeps only $1 — linux-x64, win-x64, osx-aarch64 or osx-x64, the directory names under
# ai/onnxruntime/native/ — and rebuilds the jar in place. Uses only the JDK's own jar tool: Git Bash on
# Windows has no zip.
strip_onnxruntime_natives() {
    local keep="$1" jar work
    jar=$(find "${INPUT_DIR}/lib" -maxdepth 1 -name 'onnxruntime-*.jar' | head -n 1)
    if [ -z "${jar}" ]; then
        log "No onnxruntime jar to strip"
        return 0
    fi
    jar="$(cd "$(dirname "${jar}")" && pwd)/$(basename "${jar}")"
    work="$(pwd)/${BUILD_DIR}/onnxruntime"
    rm -rf "${work}" && mkdir -p "${work}"
    (cd "${work}" && "${JAVA_BIN}/jar" xf "${jar}")
    [ -d "${work}/ai/onnxruntime/native/${keep}" ] || { echo "ONNX Runtime has no native/${keep}" >&2; exit 1; }
    local dir
    for dir in "${work}"/ai/onnxruntime/native/*/; do
        [ "$(basename "${dir}")" = "${keep}" ] || rm -rf "${dir}"
    done
    mv "${work}/META-INF/MANIFEST.MF" "${BUILD_DIR}/onnxruntime.MF"
    rm -f "${jar}"
    "${JAVA_BIN}/jar" --create --file "${jar}" --manifest "${BUILD_DIR}/onnxruntime.MF" -C "${work}" .
    rm -rf "${work}" "${BUILD_DIR}/onnxruntime.MF"
    log "ONNX Runtime natives reduced to ${keep}: $(du -h "${jar}" | cut -f1)"
}

build_runtime() {
    log "Detecting required modules"
    local detected=""
    if detected=$("${JAVA_BIN}/jdeps" \
            --multi-release 27 \
            --ignore-missing-deps \
            --print-module-deps \
            --class-path "${INPUT_DIR}/lib/*" \
            "${INPUT_DIR}/${MAIN_JAR}" 2>/dev/null | tail -n 1); then
        log "jdeps found: ${detected}"
    else
        log "jdeps failed; relying on the explicit module list only"
        detected=""
    fi

    # Always added, whatever jdeps saw: modules reached only reflectively, through services or at
    # runtime by the libraries (Spring, H2, Byte Buddy, JNA), plus JavaFX itself, used from the class path.
    local explicit="java.base,java.desktop,java.logging,java.management,java.naming,java.net.http,java.sql,\
java.instrument,java.scripting,java.xml,jdk.attach,jdk.unsupported,jdk.zipfs,jdk.crypto.ec,jdk.localedata,\
jdk.management,javafx.base,javafx.graphics,javafx.controls,javafx.fxml,javafx.swing"
    local modules="${explicit}"
    [ -n "${detected}" ] && modules="${detected},${explicit}"

    log "Creating runtime image"
    "${JAVA_BIN}/jlink" \
        --no-header-files \
        --no-man-pages \
        --strip-debug \
        --compress=zip-6 \
        --include-locales=en,fr \
        --add-modules "${modules}" \
        --output "${RUNTIME_DIR}"
}

# jpackage options every OS shares; the OS script adds its --type, icon and platform switches.
# JPACKAGE_IMAGE_ARGS holds only what describes the application image itself, for an OS script that builds
# the image first and the installer from it in a second run (macOS); JPACKAGE_ARGS is the one-run set.
common_jpackage_args() {
    local version="$1"
    JPACKAGE_IMAGE_ARGS=(
        --input "${INPUT_DIR}"
        --main-jar "${MAIN_JAR}"
        --runtime-image "${RUNTIME_DIR}"
        --name "${APP_NAME}"
        --app-version "${version}"
        --vendor "${APP_VENDOR}"
        --description "${APP_DESCRIPTION}"
        --copyright "${APP_COPYRIGHT}"
        # Pholio is headless by default and opens its window only with --ui. jpackage bakes these in as the
        # launcher's default arguments, used whenever it gets none — a double-click, the Dock, the Start menu.
        # Any argument given explicitly replaces them, so the installed launcher still runs commands
        # (`Pholio scan <dir>`). An argument, not a -D property: --ui is how the application reads the mode.
        --arguments "--ui"
    )
    local option
    for option in "${JAVA_OPTIONS[@]}"; do
        JPACKAGE_IMAGE_ARGS+=(--java-options "${option}")
    done
    JPACKAGE_ARGS=(
        "${JPACKAGE_IMAGE_ARGS[@]}"
        --dest "${BUILD_DIR}/installer"
        --license-file "${PACKAGING_DIR}/../LICENSE.txt"
    )
}

# Moves the one installer jpackage produced (matching $1) to OUT_DIR as $2, with its .sha256 next to it.
publish_installer() {
    local pattern="$1" target="$2" produced
    produced=$(find "${BUILD_DIR}/installer" -maxdepth 1 -name "${pattern}" | head -n 1)
    [ -n "${produced}" ] || { echo "No installer matching ${pattern} in ${BUILD_DIR}/installer" >&2; ls -la "${BUILD_DIR}/installer" >&2; exit 1; }
    mv "${produced}" "${OUT_DIR}/${target}"
    (cd "${OUT_DIR}" && if command -v sha256sum >/dev/null 2>&1; then sha256sum "${target}"; else shasum -a 256 "${target}"; fi > "${target}.sha256")
    log "Built ${OUT_DIR}/${target}"
}
