# lanza_psg.ps1 -nombre psg_6A -siempre 0x6A [-segs 90]: UN openMSX con
# tools/omsx_psg.tcl (cotejo del PSG y del SCC) en work/<nombre>/psg.txt,
# fuera del sandbox, minimizado, y espera a que acabe. Con -siempre, todas las
# peticiones de sonido del juego se cambian por ese numero (la pieza entera).
param([string]$nombre = "psg", [string]$segs = "90", [string]$siempre = "", [string]$teclas = "0:0x00", [string]$maquina = "C-BIOS_MSX2_JP", [string]$solo = "")
$raiz = Split-Path -Parent $PSScriptRoot
Set-Location $raiz
New-Item -ItemType Directory -Force "work/$nombre" | Out-Null
$env:PSG_OUT = "work/$nombre"
$env:PSG_FIN = $segs
$env:PSG_SIEMPRE = $siempre
# los puntos del motor (banco 16 en 0x4000, puesto por el puente de 0xC340): el
# cuadro p16:428F (su primer byte, 0x3A) y la peticion p16:4024 (0x4F); en 0x4000
# va casi siempre el banco 0, de ahi el byte
$env:PSG_FRAME = "0x428F"
$env:PSG_FRAME_BYTE = "58"
$env:PSG_PIDE = "0x4024"
$env:PSG_PIDE_BYTE = "79"
# la RAM del motor, 0xC600-0xC69F
$env:PSG_MRAM = "50688 160"
# el motor no se pide sonidos a si mismo
$env:PSG_PIDE_NO = ""
$env:PSG_TECLAS = $teclas
# -solo: desde la segunda peticion (y el arranque del motor, p16:4009) se desvian
# al `ret` de p16:413C: la primera pieza suena entera
if ($solo -ne "") { $env:PSG_SOLO = "0x413C"; $env:PSG_INIT = "0x4009 33" } else { Remove-Item Env:PSG_SOLO -ErrorAction SilentlyContinue; Remove-Item Env:PSG_INIT -ErrorAction SilentlyContinue }
$args_ = @("-machine", $maquina, "-cart", "metalgear2.rom", "-romtype", "KonamiSCC", "-script", "tools/omsx_psg.tcl")
Start-Process -FilePath "C:\Program Files\openMSX\openmsx.exe" -ArgumentList $args_ -Wait -WindowStyle Minimized
"hecho" | Out-File -Encoding ascii "work/$nombre/fin.txt"
