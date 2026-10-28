# lanza_bigboss.ps1 [-dir omsx_bigboss] [-segs 90]: UN openMSX con tools/omsx_bigboss.tcl,
# fuera del sandbox, minimizado: la pelea con BIG BOSS por el camino del juego
param([string]$dir = "omsx_bigboss", [string]$segs = "90")
$raiz = Split-Path -Parent $PSScriptRoot
Set-Location $raiz
$env:BB_SALIDA = "work/$dir"
$env:BB_SEGS = $segs
New-Item -ItemType Directory -Force "work/$dir" | Out-Null
$args_ = @("-machine", "C-BIOS_MSX2_JP", "-cart", "metalgear2.rom", "-romtype", "KonamiSCC", "-script", "tools/omsx_bigboss.tcl")
Start-Process -FilePath "C:\Program Files\openMSX\openmsx.exe" -ArgumentList $args_ -Wait -WindowStyle Minimized
"hecho" | Out-File -Encoding ascii "work/$dir/fin.txt"
