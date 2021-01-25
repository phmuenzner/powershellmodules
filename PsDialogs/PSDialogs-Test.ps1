# Test für PsDialogs
# Aufruf: powershell -Executionpolicy bypass -File PSDialogs-Test.ps1

$ScriptDir = Split-Path -parent $MyInvocation.MyCommand.Path
Import-Module $ScriptDir\PsDialogs.psm1


showHinweisBox "Das ist eine wichtige information"

showFehlerBox "Das ist eine wichtige information"

showWarnungBox "Das ist eine wichtige information"


$ret1 = showWarnungBoxWithCancelOption "Das ist eine wichtige information. Weitermachen?!"
if ($ret1 -eq [System.Windows.Forms.DialogResult]::OK) {
  showHinweisBox "OK"
} else {
  showHinweisBox "Abbruch"
}


$ret2 = showAuswahlliste "Bitte auswählen" "1","2","drei","zweiund40"
$ret2

