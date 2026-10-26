# lanza_vram.ps1 -dir omsx_x [-rom work/metalgear2_monitor.rom] [-tiempos "10 20"] [-teclas ...] [-pokes ...]:
# UN openMSX con tools/omsx_vram.tcl, fuera del sandbox, minimizado, y espera a
# que acabe. Las opciones, las de omsx_vram.tcl.
param([string]$dir, [string]$rom = "metalgear2.rom", [string]$tiempos = "10 20", [string]$teclas = "", [string]$pokes = "", [string]$maquina = "C-BIOS_MSX2_JP", [string]$rapido = "")
$raiz = Split-Path -Parent $PSScriptRoot
Set-Location $raiz
$env:VRAM_SALIDA = "work/$dir"
$env:VRAM_ESTADO = ""
$env:VRAM_TIEMPOS = $tiempos
$env:VRAM_TECLAS = $teclas
$env:VRAM_POKES = $pokes
$env:VRAM_RAPIDO = $rapido
New-Item -ItemType Directory -Force "work/$dir" | Out-Null
$args_ = @("-machine", $maquina, "-cart", $rom, "-romtype", "KonamiSCC", "-script", "tools/omsx_vram.tcl")
Start-Process -FilePath "C:\Program Files\openMSX\openmsx.exe" -ArgumentList $args_ -Wait -WindowStyle Minimized
"hecho" | Out-File -Encoding ascii "work/$dir/fin.txt"
