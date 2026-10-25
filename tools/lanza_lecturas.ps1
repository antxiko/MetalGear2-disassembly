# lanza_lecturas.ps1 <nombre> <segundos> "<teclas>" "<fotos>": UNA medida de
# tools/omsx_lecturas.tcl en work/omsx/<nombre>.txt, fuera del sandbox, y
# espera a que acabe.
param([string]$nombre, [string]$segs = "300", [string]$teclas = "", [string]$fotos = "30 60 120 200 300", [string]$maquina = "C-BIOS_MSX2_JP", [string]$sinleer = "", [string]$rangos = "")
if ($sinleer -ne "") { $env:MG_SIN_LEER = "1" } else { Remove-Item Env:MG_SIN_LEER -ErrorAction SilentlyContinue }
if ($rangos -ne "") { $env:MG_RANGOS = $rangos } else { Remove-Item Env:MG_RANGOS -ErrorAction SilentlyContinue }
$raiz = Split-Path -Parent $PSScriptRoot
Set-Location $raiz
New-Item -ItemType Directory -Force "work/omsx" | Out-Null
$env:MG_OUT = "work/omsx/$nombre.txt"
$env:MG_SEGS = $segs
$env:MG_TECLAS = $teclas
$env:MG_FOTOS = $fotos
$args_ = @("-machine", $maquina, "-cart", "metalgear2.rom", "-romtype", "KonamiSCC", "-script", "tools/omsx_lecturas.tcl")
Start-Process -FilePath "C:\Program Files\openMSX\openmsx.exe" -ArgumentList $args_ -Wait -WindowStyle Minimized
"hecho" | Out-File -Encoding ascii "work/omsx/$nombre.fin"
