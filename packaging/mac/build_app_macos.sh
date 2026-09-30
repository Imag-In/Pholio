#!/usr/bin/env bash
# macOS .dmg for the architecture of the machine it runs on (arm64 or x64) — see ../common.sh for the inputs.
set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../common.sh"

case "$(uname -m)" in
    arm64)  ARCH="arm64"; ORT_NATIVE="osx-aarch64" ;;
    x86_64) ARCH="x64";   ORT_NATIVE="osx-x64" ;;
    *)      echo "Unsupported macOS architecture: $(uname -m)" >&2; exit 1 ;;
esac

prepare_input
strip_onnxruntime_natives "${ORT_NATIVE}"
build_runtime
common_jpackage_args "${APP_VERSION}"

# Two jpackage runs instead of one, so the launcher can be patched between them. jpackage's macOS launcher
# (like the JDK's own `java`) declares the macOS 13 SDK in its LC_BUILD_VERSION, and macOS 26 runs any
# process whose main executable predates its SDK in compatibility mode: the window keeps the old, smaller
# traffic lights and corner radius, whatever toolbar style JavaFX asks for. Declaring SDK 26 opts the
# window into the current look (traffic lights the size of Finder's). The minimum OS is left untouched.
IMAGE_DIR="${BUILD_DIR}/app-image"
APP_BUNDLE="${IMAGE_DIR}/${APP_NAME}.app"
LAUNCHER="${APP_BUNDLE}/Contents/MacOS/${APP_NAME}"
MACOS_SDK="26.0"

log "Running jpackage (app-image, ${ARCH})"
"${JAVA_BIN}/jpackage" "${JPACKAGE_IMAGE_ARGS[@]}" \
    --type app-image \
    --dest "${IMAGE_DIR}" \
    --icon "${PACKAGING_DIR}/mac/pholio.icns" \
    --mac-package-name "${APP_NAME}" \
    --mac-package-identifier "org.icroco.pholio"

min_os=$(otool -l "${LAUNCHER}" | awk '/LC_BUILD_VERSION/ { found = 1 } found && $1 == "minos" { print $2; exit }')
log "Declaring macOS SDK ${MACOS_SDK} in the launcher (minimum macOS ${min_os})"
xcrun vtool -set-build-version macos "${min_os}" "${MACOS_SDK}" -replace -output "${LAUNCHER}.patched" "${LAUNCHER}"
mv "${LAUNCHER}.patched" "${LAUNCHER}"
# vtool invalidates the launcher's signature, and an arm64 executable without a valid one is killed on launch.
codesign --force --sign - "${APP_BUNDLE}"

log "Running jpackage (dmg, ${ARCH})"
"${JAVA_BIN}/jpackage" \
    --type dmg \
    --app-image "${APP_BUNDLE}" \
    --dest "${BUILD_DIR}/installer" \
    --name "${APP_NAME}" \
    --app-version "${APP_VERSION}" \
    --vendor "${APP_VENDOR}" \
    --license-file "${PACKAGING_DIR}/../LICENSE.txt"

publish_installer "*.dmg" "pholio-${APP_VERSION}-macos-${ARCH}.dmg"
