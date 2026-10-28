# lanza_final.ps1 [-dir omsx_final]: UN openMSX con tools/omsx_final.tcl, fuera del
# sandbox, minimizado, y espera a que acabe.
param([string]$dir = "omsx_final", [string]$cada = "3")
$raiz = Split-Path -Parent $PSScriptRoot
Set-Location $raiz
$env:FINAL_SALIDA = "work/$dir"
$env:FINAL_CADA = $cada
New-Item -ItemType Directory -Force "work/$dir" | Out-Null
Get-ChildItem "work/$dir" -File | Remove-Item -Confirm:$false
$args_ = @("-machine", "C-BIOS_MSX2_JP", "-cart", "metalgear2.rom", "-romtype", "KonamiSCC", "-script", "tools/omsx_final.tcl")
Start-Process -FilePath "C:\Program Files\openMSX\openmsx.exe" -ArgumentList $args_ -Wait -WindowStyle Minimized
