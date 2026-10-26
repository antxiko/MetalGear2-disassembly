# omsx_vram.tcl - Vuelca la VRAM (128 KB), los registros, la paleta y unos
# bytes de RAM del Metal Gear 2 en un MSX2 (C-BIOS_MSX2_JP), para cotejar los
# dibujos de tools/vram.py (tools/coteja_vram.py). Se lanza con
# tools/lanza_vram.ps1 (fuera del sandbox, minimizado).
#
#   "C:/Program Files/openMSX/openmsx.exe" -machine C-BIOS_MSX2_JP \
#       -cart metalgear2.rom -romtype KonamiSCC -script tools/omsx_vram.tcl
#
# Variables: VRAM_SALIDA (work/omsx), VRAM_TIEMPOS ("30 45 60": segundos
# emulados de cada volcado; sale despues del ultimo).
proc opcion {nombre porDefecto} {
    global env
    if {[info exists env($nombre)]} { return $env($nombre) }
    return $porDefecto
}
set ::SALIDA [opcion VRAM_SALIDA {work/omsx}]
set ::TIEMPOS [opcion VRAM_TIEMPOS {30 45 60}]
file mkdir $::SALIDA

proc vuelca {etiqueta} {
    set f [open [file join $::SALIDA "vram-$etiqueta.bin"] wb]
    fconfigure $f -translation binary
    puts -nonewline $f [debug read_block VRAM 0 131072]
    close $f
    set g [open [file join $::SALIDA "vdp-$etiqueta.txt"] w]
    for {set i 0} {$i < 47} {incr i} {
        puts $g [format "R%d = 0x%02X" $i [debug read "VDP regs" $i]]
    }
    for {set i 0} {$i < 16} {incr i} {
        puts $g "P$i = [getcolor $i]"
    }
    # el monitor de p63 (0xCA3E), la zona, la sala, la Y y la X de Snake
    foreach {nombre d} {monitor 0xCA3E zona 0xCA4A sala 0xCA4B y 0xCB03 x 0xCB05} {
        puts $g [format "%s = 0x%02X" $nombre [debug read memory $d]]
    }
    close $g
    set h [open [file join $::SALIDA "ram-$etiqueta.bin"] wb]
    fconfigure $h -translation binary
    puts -nonewline $h [debug read_block memory 0 65536]
    close $h
    screenshot [file join $::SALIDA "ver-$etiqueta.png"]
}
# VRAM_TECLAS "t:fila:mascara[:segundos] ...": a los t segundos se pulsa esa
# tecla de la matriz del MSX (fila 8: 0x01 espacio, 0x10 izquierda, 0x20 arriba,
# 0x40 abajo, 0x80 derecha; fila 7: 0x80 RETURN; fila 6: 0x20 F1) durante 0.15 s
# o lo que se diga
foreach k [opcion VRAM_TECLAS {}] {
    lassign [split $k :] t f m d
    if {$d eq ""} { set d 0.15 }
    after time $t "keymatrixdown $f $m; after time $d {keymatrixup $f $m}"
}
# VRAM_POKES "t:direccion:valor ...": a los t segundos se escribe ese byte de la
# RAM (para llegar antes a una pantalla: p. ej. 0xED87 = 1 acaba el partido)
foreach k [opcion VRAM_POKES {}] {
    lassign [split $k :] t d v
    after time $t "poke $d $v"
}
# VRAM_ESTADO (del PR2; aqui sin uso: 0xC300 no es el estado de este juego)
# vuelca a los segundos de VRAM_ESTADO_TIEMPOS (3 5 8 12) y se sale
set ::ESTADO [opcion VRAM_ESTADO {}]
proc mira_estado {} {
    lassign [split $::ESTADO :] e p
    if {[debug read memory 0xC300] == $e && ($p eq "" || [debug read memory 0xC301] == $p)} {
        set throttle on
                set ds [opcion VRAM_ESTADO_TIEMPOS {3 5 8 12}]
        foreach d $ds { after time $d "vuelca fin$d" }
        after time [expr {[lindex $ds end] + 1}] exit
        return
    }
    after time 0.5 mira_estado
}
if {$::ESTADO ne ""} {
    set throttle off
    after time 1 mira_estado
} else {
    # VRAM_RAPIDO "1": sin throttle (los tiempos son de la maquina emulada)
    if {[opcion VRAM_RAPIDO {}] ne ""} { set throttle off }
    foreach t $::TIEMPOS { after time $t "vuelca $t" }
}
if {$::ESTADO eq ""} { after time [expr {[lindex $::TIEMPOS end] + 1}] exit }
