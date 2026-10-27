# lanza_salas.ps1 -dir omsx_salas -lista "0:2:6 1:1:5" [-rom metalgear2.rom] [-doble 1]:
# UN openMSX con tools/omsx_salas.tcl, fuera del sandbox, minimizado, y espera
# a que acabe.
param([string]$dir = "omsx_salas", [string]$lista = "0:2:6 0:2:7 0:2:8", [string]$rom = "metalgear2.rom", [string]$maquina = "C-BIOS_MSX2_JP", [string]$doble = "")
$raiz = Split-Path -Parent $PSScriptRoot
Set-Location $raiz
$env:SALAS_SALIDA = "work/$dir"
$env:SALAS_LISTA = $lista
$env:SALAS_DOBLE = $doble
New-Item -ItemType Directory -Force "work/$dir" | Out-Null
$args_ = @("-machine", $maquina, "-cart", $rom, "-romtype", "KonamiSCC", "-script", "tools/omsx_salas.tcl")
Start-Process -FilePath "C:\Program Files\openMSX\openmsx.exe" -ArgumentList $args_ -Wait -WindowStyle Minimized
"hecho" | Out-File -Encoding ascii "work/$dir/fin.txt"
