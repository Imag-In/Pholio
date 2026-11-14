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
strip_onnxruntime_natives win-x64
strip_sqlite_natives Windows/x86_64
drop_main_jar_natives linux-x64 macos-arm64 macos-x64
build_runtime
common_jpackage_args "${MSI_VERSION}"

# Imag-In/pholio-roadmap#280. The program goes to %LOCALAPPDATA%\Pholio App, never to %LOCALAPPDATA%\Pholio
# where Pholio keeps its data (AppDirectories): jpackage's installer removes its whole installation folder when
# it is uninstalled, and an upgrade uninstalls the previous version. For the same reason the user does not
# choose that folder (no --win-dir-chooser): a folder of their own would be wiped with it. resources/main.wxs
# disarms the cleaner of the versions installed before.
IMAGE_DIR="${BUILD_DIR}/app-image"
log "Running jpackage (app-image)"
"${JAVA_BIN}/jpackage" "${JPACKAGE_IMAGE_ARGS[@]}" \
    --type app-image \
    --dest "${IMAGE_DIR}" \
    --icon "${PACKAGING_DIR}/win/pholio.ico"

# Imag-In/pholio-roadmap#284. One MSI per language of Pholio, from the same image; the others are then folded into
# the English one as language transforms (embed-languages.ps1), which Windows applies by the user's language.
# jpackage ships its texts in en, de, ja and zh, and picks them by its own JVM's language. Ours (fr, es: l10n/) go in
# under the English file's name: given under their own, jpackage hands them to WiX next to the English one
# (-cultures:fr-fr;en-us), which WiX 3 refuses (LGHT0100, every string declared twice). The pictures are read from
# PHOLIO_MSI_RESOURCES (resources/main.wxs).
export PHOLIO_MSI_RESOURCES
PHOLIO_MSI_RESOURCES="$(cygpath -w "${PACKAGING_DIR}/win/resources")"
LANGUAGES=(
    # language  LCID  jpackage's JVM locale  the last page's check box
    "en 1033 en-US Launch Pholio"
    "fr 1036 en-US Lancer Pholio"
    "de 1031 de-DE Pholio starten"
    "es 1034 en-US Iniciar Pholio"
    "ja 1041 ja-JP Pholio を起動"
    "zh 2052 zh-CN 启动 Pholio"
)

build_msi() {
    local lang="$1" lcid="$2" locale="$3" launch="$4"
    local resources="${BUILD_DIR}/msi-resources/${lang}"
    mkdir -p "${resources}"
    cp "${PACKAGING_DIR}/win/resources/main.wxs" "${resources}/"
    printf '<?xml version="1.0" encoding="utf-8"?>\n<Include xmlns="http://schemas.microsoft.com/wix/2006/wi">\n  <?undef JpProductLanguage?>\n  <?define JpProductLanguage=%s ?>\n  <?define PholioLaunchText="%s" ?>\n</Include>\n' \
        "${lcid}" "${launch}" > "${resources}/overrides.wxi"
    if [ -f "${PACKAGING_DIR}/win/l10n/MsiInstallerStrings_${lang}.wxl" ]; then
        cp "${PACKAGING_DIR}/win/l10n/MsiInstallerStrings_${lang}.wxl" "${resources}/MsiInstallerStrings_en.wxl"
    fi
    log "Running jpackage (msi, ${lang}, ProductVersion ${MSI_VERSION})"
    "${JAVA_BIN}/jpackage" \
        "-J-Duser.language=${locale%-*}" "-J-Duser.country=${locale#*-}" \
        --type msi \
        --app-image "${IMAGE_DIR}/${APP_NAME}" \
        --dest "${BUILD_DIR}/msi/${lang}" \
        --name "${APP_NAME}" \
        --app-version "${MSI_VERSION}" \
        --vendor "${APP_VENDOR}" \
        --description "${APP_DESCRIPTION}" \
        --copyright "${APP_COPYRIGHT}" \
        --resource-dir "${resources}" \
        --install-dir 'Pholio App' \
        --win-with-ui \
        --win-shortcut-prompt \
        --win-menu \
        --win-menu-group "${APP_NAME}" \
        --win-shortcut \
        --win-per-user-install \
        --win-upgrade-uuid "8c5f7a3e-2b1d-4e6a-9f0c-7d4b2a1e5c93"
}

# WiX's own tools: on the PATH, or in the folder its installer records (GitHub's image sets WIX).
TORCH="torch.exe"
if [ -n "${WIX:-}" ]; then
    TORCH="$(cygpath -u "${WIX}")/bin/torch.exe"
fi

transforms=()
for entry in "${LANGUAGES[@]}"; do
    read -r lang lcid locale launch <<<"${entry}"
    build_msi "${lang}" "${lcid}" "${locale}" "${launch}"
    if [ "${lang}" != "en" ]; then
        log "Language transform ${lang} (${lcid})"
        "${TORCH}" -nologo -t language "${BUILD_DIR}/msi/en/${APP_NAME}-${MSI_VERSION}.msi" \
            "${BUILD_DIR}/msi/${lang}/${APP_NAME}-${MSI_VERSION}.msi" -out "${BUILD_DIR}/msi/${lang}.mst"
        transforms+=("${lcid}=$(cygpath -w "${BUILD_DIR}/msi/${lang}.mst")")
    fi
done

mkdir -p "${BUILD_DIR}/installer"
cp "${BUILD_DIR}/msi/en/${APP_NAME}-${MSI_VERSION}.msi" "${BUILD_DIR}/installer/"
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "$(cygpath -w "${PACKAGING_DIR}/win/embed-languages.ps1")" \
    -Msi "$(cygpath -w "${BUILD_DIR}/installer/${APP_NAME}-${MSI_VERSION}.msi")" \
    -Transforms "$(IFS=,; echo "${transforms[*]}")"

publish_installer "*.msi" "pholio-${APP_VERSION}-windows-x64.msi"
