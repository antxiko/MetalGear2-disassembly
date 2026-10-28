# lanza_partida.ps1 [-dir omsx_partida] [-tiempos "0.3 1 2"]: UN openMSX con
# tools/omsx_partida.tcl, fuera del sandbox, minimizado, y espera a que acabe.
param([string]$dir = "omsx_partida", [string]$tiempos = "0.3 1 1.7 2.4 3 4 5 6 8 10 12 14", [string]$rom = "metalgear2.rom", [string]$maquina = "C-BIOS_MSX2_JP")
$raiz = Split-Path -Parent $PSScriptRoot
Set-Location $raiz
$env:PARTIDA_SALIDA = "work/$dir"
$env:PARTIDA_TIEMPOS = $tiempos
New-Item -ItemType Directory -Force "work/$dir" | Out-Null
$args_ = @("-machine", $maquina, "-cart", $rom, "-romtype", "KonamiSCC", "-script", "tools/omsx_partida.tcl")
Start-Process -FilePath "C:\Program Files\openMSX\openmsx.exe" -ArgumentList $args_ -Wait -WindowStyle Minimized
"hecho" | Out-File -Encoding ascii "work/$dir/fin.txt"
