# omsx_final.tcl - El final del Metal Gear 2 en openMSX (C-BIOS_MSX2_JP), para
# cotejarlo con tools/secuencias.py final (tools/coteja_secuencias.py).
# Se empieza la partida (espacio), se pasa la llamada inicial con RETURN hasta
# que 0xCA97 vuelve a cero y, jugando (0xCA00 = 5, paso 0), se pone 0xCAAF = 1:
# el paso 0 (p01:7473) pasa solo al estado 7. Desde ahi vuelca la VRAM, los
# registros, la paleta y la RAM cada FINAL_CADA segundos (por defecto 3) hasta
# que el juego sale del estado 7. Sin throttle.
#   Variables: FINAL_SALIDA (work/omsx_final)
proc opcion {nombre porDefecto} {
    global env
    if {[info exists env($nombre)]} { return $env($nombre) }
    return $porDefecto
}
set ::SALIDA [opcion FINAL_SALIDA {work/omsx_final}]
set ::CADA [opcion FINAL_CADA 3]
file mkdir $::SALIDA
set ::log [open [file join $::SALIDA log.txt] w]
set throttle off

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
    close $g
    set h [open [file join $::SALIDA "ram-$etiqueta.bin"] wb]
    fconfigure $h -translation binary
    puts -nonewline $h [debug read_block memory 0 65536]
    close $h
}

proc pulsa {f m} {
    keymatrixdown $f $m
    after time 0.15 "keymatrixup $f $m"
}

# hasta jugar: espacio cada 2 s mientras no se juega; RETURN con la llamada
set ::quieto 0
proc empieza {} {
    set e [debug read memory 0xCA00]
    if {$e != 5} {
        pulsa 8 0x01
        after time 2 empieza
        return
    }
    if {[debug read memory 0xCA97] != 0} {
        set ::quieto 0
        pulsa 7 0x80
    } elseif {[debug read memory 0xCA01] == 0} {
        incr ::quieto
        if {$::quieto >= 6} {
            puts $::log "jugando: 0xCAAF = 1"
            poke 0xCAAF 1
            after time 0.5 mira
            return
        }
    }
    after time 0.5 empieza
}

set ::n 0
proc mira {} {
    if {[debug read memory 0xCA00] != 7} {
        if {$::n > 0} {
            puts $::log "fuera del estado 7 tras $::n volcados"
            close $::log
            exit
        }
        after time 0.5 mira
        return
    }
    vuelca [format "%03d" $::n]
    incr ::n
    after time $::CADA mira
}
after time 20 empieza
after time 1200 {puts $::log "tiempo agotado"; close $::log; exit}
