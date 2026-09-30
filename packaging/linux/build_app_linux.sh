#!/usr/bin/env bash
# Linux .deb (x64) — see ../common.sh for the inputs. Needs dpkg-deb and fakeroot, both on ubuntu runners.
set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../common.sh"

prepare_input
build_runtime
common_jpackage_args "${APP_VERSION}"

log "Running jpackage (deb)"
"${JAVA_BIN}/jpackage" "${JPACKAGE_ARGS[@]}" \
    --type deb \
    --icon "${PACKAGING_DIR}/linux/pholio.png" \
    --linux-package-name pholio \
    --linux-shortcut \
    --linux-menu-group "Graphics" \
    --linux-app-category graphics

publish_installer "*.deb" "pholio-${APP_VERSION}-linux-amd64.deb"
