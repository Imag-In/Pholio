#!/usr/bin/env bash
# Windows .msi (x64), run with Git Bash — see ../common.sh for the inputs. jpackage needs the WiX Toolset on
# the PATH to build an MSI (preinstalled on GitHub's windows-2022 image).
set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../common.sh"

# MSI ProductVersion caps its first component at 255, so 2026.9.1 cannot go in as is: the installer carries
# 26.9.1 (year minus 2000). The file name keeps the real version.
IFS=. read -r YEAR MONTH BUILD <<<"${APP_VERSION}"
MSI_VERSION="$((YEAR - 2000)).${MONTH}.${BUILD}"

prepare_input
build_runtime
common_jpackage_args "${MSI_VERSION}"

log "Running jpackage (msi, ProductVersion ${MSI_VERSION})"
"${JAVA_BIN}/jpackage" "${JPACKAGE_ARGS[@]}" \
    --type msi \
    --icon "${PACKAGING_DIR}/win/pholio.ico" \
    --win-menu \
    --win-menu-group "${APP_NAME}" \
    --win-shortcut \
    --win-dir-chooser \
    --win-per-user-install \
    --win-upgrade-uuid "8c5f7a3e-2b1d-4e6a-9f0c-7d4b2a1e5c93"

publish_installer "*.msi" "pholio-${APP_VERSION}-windows-x64.msi"
