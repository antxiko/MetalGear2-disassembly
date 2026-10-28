# omsx_partida.tcl - La pelea de la ficha 0xD800 de tipo 2 (zona 0x12, sala 8)
# en un MSX2 (C-BIOS_MSX2_JP), para cotejar la pantalla partida que monta
# tools/jefes.py (pantalla_partida) con la de openMSX: VRAM, registros,
# paleta, RAM y captura de cada volcado. Se lanza con tools/lanza_partida.ps1
# (fuera del sandbox, minimizado).
#
#   - la presentacion y la llamada inicial, como tools/omsx_salas.tcl.
#   - a la zona 0x12 por la casilla (3, 9) de la rejilla de 0xD900 (el paso
#     0x92 y salir por la derecha), con 0xD881 = 0xD888 = 0: la pelea viva.
#   - cada 0,1 s: la vida llena; RETURN con una llamada (0xCA97, 0xE1E8) y
#     el espacio (el disparo 1) con un mensaje (0xD8A8, 0xE221).
#   - entra en la sala 3 (casilla 0x29, p00:5ADF) y en ella corren los pasos
#     0-2; el 3 espera en la sala 8 (0x39) con 0xD8A4, que pone la puerta 8 de
#     la sala 3, de tipo 5 (tipo_cruzado_5, p15:AADF: 0xD8A4 = 1, la pagina 1,
#     la pantalla partida, R#0 = 0x16): se cruza con la ficha libre 0xD570 en
#     el estado 3 (p15:A9AB) y su tipo, 5.
#   - con la pantalla partida (0xCA1C = 1), throttle on y un volcado en cada
#     uno de PARTIDA_TIEMPOS (segundos desde entonces); despues se sale.
#
# Variables: PARTIDA_SALIDA (work/omsx_partida), PARTIDA_TIEMPOS.
proc opcion {nombre porDefecto} {
    global env
    if {[info exists env($nombre)]} { return $env($nombre) }
    return $porDefecto
}
set ::SALIDA [opcion PARTIDA_SALIDA {work/omsx_partida}]
set ::TIEMPOS [opcion PARTIDA_TIEMPOS {0.3 1 1.7 2.4 3 4 5 6 8 10 12 14}]
file mkdir $::SALIDA
set ::log [open [file join $::SALIDA "partida.txt"] w]
set throttle off

proc ficha2 {} {
    foreach d {0xD800 0xD820 0xD840} {
        if {[debug read memory $d] == 2} { return $d }
    }
    return 0
}

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
    screenshot -raw [file join $::SALIDA "ver-$etiqueta.png"]
    set ix [ficha2]
    set paso [expr {$ix ? [debug read memory [expr {$ix + 1}]] : -1}]
    puts $::log [format "%s: CA01 %02X ficha %04X paso %d D8A5 %02X FFF6 %02X CA1C %d" $etiqueta \
        [debug read memory 0xCA01] $ix $paso [debug read memory 0xD8A5] [debug read memory 0xFFF6] \
        [debug read memory 0xCA1C]]
    flush $::log
}

proc pulsa {f m} {
    keymatrixdown $f $m
    after time 0.05 "keymatrixup $f $m"
}

for {set s 30} {$s <= 64} {incr s 2} {
    after time $s "pulsa 8 0x01"
}

set ::quieto 0
proc llamada {} {
    if {[debug read memory 0xCA97] != 0} {
        set ::quieto 0
        pulsa 7 0x80
    } else {
        incr ::quieto
        if {$::quieto >= 6} {
            puts $::log "llamada acabada"
            flush $::log
            a_la_zona
            return
        }
    }
    after time 0.5 llamada
}
after time 66 llamada

proc a_la_zona {} {
    poke [expr {0xD900 + 3 * 16 + 9}] 0x92
    poke 0xD881 0
    poke 0xD888 0
    poke 0xCA5F 0
    poke 0xCA50 3
    poke 0xCA51 8
    poke 0xCA41 4
    after time 0.5 {pelea 0}
}

set ::partida 0
proc pelea {n} {
    poke 0xCA53 [debug read memory 0xCA52]
    if {$n % 2 == 0} {
        if {[debug read memory 0xCA97] || [debug read memory 0xE1E8]} {
            pulsa 7 0x80
        } elseif {[debug read memory 0xD8A8] || [debug read memory 0xE221]} {
            pulsa 8 0x01
        }
    }
    if {[debug read memory 0xCA00] == 6} {
        puts $::log "game over"
        flush $::log
    }
    set ix [ficha2]
    if {$n % 50 == 0} {
        puts $::log [format "t %d: zona %02X sala %02X CA00 %02X CA01 %02X ficha %04X paso %s D8A4 %d CA1C %d" $n \
            [debug read memory 0xCA4A] [debug read memory 0xCA4B] [debug read memory 0xCA00] \
            [debug read memory 0xCA01] $ix [expr {$ix ? [debug read memory [expr {$ix + 1}]] : "-"}] \
            [debug read memory 0xD8A4] [debug read memory 0xCA1C]]
        flush $::log
    }
    if {$ix && [debug read memory [expr {$ix + 1}]] == 3 && [debug read memory 0xCA4B] != 8 \
            && ![debug read memory 0xD570] && $n % 20 == 0} {
        # a la sala 8 por la puerta 8 de la sala 3, de tipo 5 (p15:AADF)
        puts $::log "puerta 8 (tipo 5)"
        flush $::log
        poke 0xD570 5
        poke 0xD571 3
        poke 0xD575 8
    }
    if {!$::partida && [debug read memory 0xCA1C]} {
        set ::partida 1
        set throttle on
        puts $::log "pantalla partida"
        flush $::log
        foreach t $::TIEMPOS { after time $t [list vuelca [format "t%05.1f" $t]] }
        after time [expr {[lindex $::TIEMPOS end] + 0.5}] {close $::log; exit}
    }
    if {$n > 3000} {
        puts $::log "tiempo agotado"
        close $::log
        exit
    }
    after time 0.1 [list pelea [expr {$n + 1}]]
}
after time 600 {exit}
