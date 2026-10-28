# lanza_ritmo.ps1 -modo pres|final: UN openMSX con tools/omsx_ritmo.tcl, fuera del
# sandbox, minimizado; deja work/ritmo_<modo>.txt
param([string]$modo = "pres", [string]$cuadros = "20000")
$raiz = Split-Path -Parent $PSScriptRoot
Set-Location $raiz
$env:RITMO_MODO = $modo
$env:RITMO_CUADROS = $cuadros
$env:RITMO_SALIDA = "work/ritmo_$modo.txt"
$args_ = @("-machine", "C-BIOS_MSX2_JP", "-cart", "metalgear2.rom", "-romtype", "KonamiSCC", "-script", "tools/omsx_ritmo.tcl")
Start-Process -FilePath "C:\Program Files\openMSX\openmsx.exe" -ArgumentList $args_ -Wait -WindowStyle Minimized
