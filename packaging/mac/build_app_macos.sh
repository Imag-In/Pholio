#!/usr/bin/env bash
# macOS .dmg for the architecture of the machine it runs on (arm64 or x64) — see ../common.sh for the inputs.
set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../common.sh"

case "$(uname -m)" in
    arm64)  ARCH="arm64"; ORT_NATIVE="osx-aarch64"; SQLITE_NATIVE="Mac/aarch64"; OTHER_ARCH="macos-x64";   BYTEDECO_NATIVE="macosx-arm64" ;;
    x86_64) ARCH="x64";   ORT_NATIVE="osx-x64";     SQLITE_NATIVE="Mac/x86_64"; OTHER_ARCH="macos-arm64"; BYTEDECO_NATIVE="macosx-x86_64" ;;
    *)      echo "Unsupported macOS architecture: $(uname -m)" >&2; exit 1 ;;
esac

prepare_input
strip_onnxruntime_natives "${ORT_NATIVE}"
strip_sqlite_natives "${SQLITE_NATIVE}"
keep_bytedeco_natives "${BYTEDECO_NATIVE}"
drop_main_jar_natives windows-x64 linux-x64 "${OTHER_ARCH}"
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
# macOS asks the user before an application hears the microphone — the chat's dictation (Imag-In/pholio-roadmap#381) —
# and refuses it, or kills the application, when its Info.plist gives no reason to show. Before the signature: it
# covers the Info.plist.
plutil -replace NSMicrophoneUsageDescription \
    -string "Pholio listens only while you dictate a prompt to its chat. What you say is turned into text on this computer and never sent." \
    "${APP_BUNDLE}/Contents/Info.plist"
# vtool invalidates the launcher's signature, and an arm64 executable without a valid one is killed on launch.
codesign --force --sign - "${APP_BUNDLE}"

# The window of the mounted image (Imag-In/pholio-roadmap#298): background, volume icon and layout, from
# resources/ (Pholio-background.tiff, Pholio-volume.icns, Pholio-dmg-setup.scpt — see the script's header).
log "Running jpackage (dmg, ${ARCH})"
"${JAVA_BIN}/jpackage" \
    --type dmg \
    --app-image "${APP_BUNDLE}" \
    --dest "${BUILD_DIR}/installer" \
    --name "${APP_NAME}" \
    --app-version "${APP_VERSION}" \
    --vendor "${APP_VENDOR}" \
    --resource-dir "${PACKAGING_DIR}/mac/resources"

# jpackage ignores a failure of the layout script, and the image then opens as a bare folder with no link to
# Applications: refuse it.
DMG_CHECK="${BUILD_DIR}/dmg-check"
mkdir -p "${DMG_CHECK}"
hdiutil attach -nobrowse -readonly -quiet -mountpoint "${DMG_CHECK}" "${BUILD_DIR}"/installer/*.dmg
dmg_laid_out=true
[[ -f "${DMG_CHECK}/.DS_Store" && -L "${DMG_CHECK}/Applications" ]] || dmg_laid_out=false
hdiutil detach -quiet "${DMG_CHECK}"
if [[ "${dmg_laid_out}" != true ]]; then
    echo "The dmg has no Finder layout (Pholio-dmg-setup.scpt failed)" >&2
    exit 1
fi

publish_installer "*.dmg" "pholio-${APP_VERSION}-macos-${ARCH}.dmg"
