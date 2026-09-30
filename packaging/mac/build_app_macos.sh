#!/usr/bin/env bash
# macOS .dmg for the architecture of the machine it runs on (arm64 or x64) — see ../common.sh for the inputs.
set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../common.sh"

case "$(uname -m)" in
    arm64)  ARCH="arm64" ;;
    x86_64) ARCH="x64" ;;
    *)      echo "Unsupported macOS architecture: $(uname -m)" >&2; exit 1 ;;
esac

prepare_input
build_runtime
common_jpackage_args "${APP_VERSION}"

log "Running jpackage (dmg, ${ARCH})"
"${JAVA_BIN}/jpackage" "${JPACKAGE_ARGS[@]}" \
    --type dmg \
    --icon "${PACKAGING_DIR}/mac/pholio.icns" \
    --mac-package-name "${APP_NAME}" \
    --mac-package-identifier "org.icroco.pholio"

publish_installer "*.dmg" "pholio-${APP_VERSION}-macos-${ARCH}.dmg"
