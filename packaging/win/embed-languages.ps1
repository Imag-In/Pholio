# Makes one multilingual MSI out of the English one and a language transform per language (Imag-In/pholio-roadmap#284),
# as the Windows SDK's WiSubStg.vbs and WiLangId.vbs do: each transform goes into the package as a sub-storage named by
# its language id, and the package's summary lists every language. Windows Installer then applies, by itself, the
# transform of the user's language; another language falls back to English.
#
#   powershell -File embed-languages.ps1 -Msi Pholio.msi -Transforms 1036=fr.mst,1031=de.mst
param(
    [Parameter(Mandatory)][string]$Msi,
    [Parameter(Mandatory)][string[]]$Transforms
)
$ErrorActionPreference = "Stop"
# From bash, the list arrives as one comma-separated argument.
$Transforms = @($Transforms | ForEach-Object { $_ -split "," } | Where-Object { $_ })

function Invoke($target, [string]$member, [System.Reflection.BindingFlags]$kind, [object[]]$arguments) {
    return $target.GetType().InvokeMember($member, $kind, $null, $target, $arguments)
}
$call = [System.Reflection.BindingFlags]::InvokeMethod
$get  = [System.Reflection.BindingFlags]::GetProperty
$set  = [System.Reflection.BindingFlags]::SetProperty

$installer = New-Object -ComObject WindowsInstaller.Installer
$database  = Invoke $installer "OpenDatabase" $call @((Resolve-Path $Msi).Path, 1)   # msiOpenDatabaseModeTransact

$languages = @()
foreach ($entry in $Transforms) {
    $lcid, $file = $entry -split "=", 2
    $view   = Invoke $database "OpenView" $call @("INSERT INTO ``_Storages`` (``Name``, ``Data``) VALUES (?, ?)")
    $record = Invoke $installer "CreateRecord" $call @(2)
    Invoke $record "StringData" $set @(1, $lcid) | Out-Null
    Invoke $record "SetStream" $call @(2, (Resolve-Path $file).Path) | Out-Null
    Invoke $view "Execute" $call @($record) | Out-Null
    Invoke $view "Close" $call @() | Out-Null
    $languages += $lcid
}

# PID_TEMPLATE (7): "<platform>;<languages>", the package's own language first.
$summary  = Invoke $database "SummaryInformation" $get @(20)
$template = Invoke $summary "Property" $get @(7)
$platform, $own = $template -split ";", 2
$languagesOfPackage = "$platform;" + ((@($own) + $languages) -join ",")
Invoke $summary "Property" $set @(7, $languagesOfPackage) | Out-Null
Invoke $summary "Persist" $call @() | Out-Null
Invoke $database "Commit" $call @() | Out-Null
Write-Output ("{0}: {1}" -f $Msi, $languagesOfPackage)
