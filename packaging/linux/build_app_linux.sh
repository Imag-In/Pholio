#!/usr/bin/env bash
# Linux .deb (x64) — see ../common.sh for the inputs. Needs dpkg-deb and fakeroot, both on ubuntu runners.
set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../common.sh"

prepare_input
strip_onnxruntime_natives linux-x64
strip_sqlite_natives Linux/x86_64
drop_main_jar_natives windows-x64 macos-arm64 macos-x64
build_runtime
common_jpackage_args "${APP_VERSION}"

log "Running jpackage (deb)"
# fonts-noto-cjk: JavaFX bundles no Chinese or Japanese font and a Linux desktop may have none (Imag-In/pholio-roadmap#235).
"${JAVA_BIN}/jpackage" "${JPACKAGE_ARGS[@]}" \
    --type deb \
    --icon "${PACKAGING_DIR}/linux/pholio.png" \
    --linux-package-name pholio \
    --linux-shortcut \
    --linux-menu-group "Graphics" \
    --linux-app-category graphics \
    --linux-package-deps fonts-noto-cjk

publish_installer "*.deb" "pholio-${APP_VERSION}-linux-amd64.deb"
