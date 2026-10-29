# omsx_bigboss.tcl - La pelea con BIG BOSS en un MSX2 (C-BIOS_MSX2_JP), por el
# camino del juego, para cotejar lo que pinta tools/jefes.py. Se lanza con
# tools/lanza_bigboss.ps1 (fuera del sandbox, minimizado), sin throttle.
#
#   - la partida y la llamada del principio, como tools/omsx_salas.tcl;
#   - a la zona 0x12 con el paso de zona de la rejilla de 0xD900 (p00:52E7) y
#     0xD881 = 0xD888 = 0xFF (las peleas de antes hechas), 0xD889 = 0;
#   - Snake muerto (0xCB00 = 0x14): el game over (estado 6) y CONTINUE con el espacio. Al
#     seguir, zona_al_seguir (p14:B06B) lleva a zona_12_con_d889 (p14:B104):
#     Snake sin nada, 0xD8A9 = 0xD6B0 = 1, la ficha 0xD840 de tipo 0x0A y Snake
#     en la fila 2 columna 8;
#   - a la sala 1 (por la izquierda) y a la 6 (por arriba), como omsx_salas;
#   - un volcado (vram/ram/vdp) cada segundo durante BB_SEGS segundos, con el
#     espacio cada medio segundo para pasar los mensajes.
# Variables: BB_SALIDA (work/omsx_bigboss), BB_SEGS (90), BB_JEFE (bigboss o fox:
# con 0xD888 = 0 el CONTINUE va a zona_12_con_d888, p14:B0BA: GREY FOX, la ficha
# 0xD820 de tipo 9, y se graba desde ahi sin moverse de sala).
proc opcion {nombre porDefecto} {
    global env
    if {[info exists env($nombre)]} { return $env($nombre) }
    return $porDefecto
}
set ::SALIDA [opcion BB_SALIDA {work/omsx_bigboss}]
set ::SEGS [opcion BB_SEGS 90]
set ::JEFE [opcion BB_JEFE bigboss]
set ::D888 [expr {$::JEFE eq "fox" ? 0 : 0xFF}]
file mkdir $::SALIDA
set ::log [open [file join $::SALIDA "bigboss.txt"] w]
set throttle off

proc apunta {texto} {
    puts $::log [format "%s | CA00 %02X CA01 %02X zona %02X sala %02X fila %02X col %02X D8A9 %02X D6B0 %02X D840 %02X D841 %02X" \
        $texto [debug read memory 0xCA00] [debug read memory 0xCA01] [debug read memory 0xCA4A] \
        [debug read memory 0xCA4B] [debug read memory 0xCA50] [debug read memory 0xCA51] \
        [debug read memory 0xD8A9] [debug read memory 0xD6B0] [debug read memory 0xD840] [debug read memory 0xD841]]
    flush $::log
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
}

proc pulsa {f m} {
    keymatrixdown $f $m
    after time 0.15 "keymatrixup $f $m"
}

for {set s 30} {$s <= 64} {incr s 2} { after time $s {pulsa 8 0x01} }

set ::quieto 0
proc llamada {} {
    if {[debug read memory 0xCA97] != 0} {
        set ::quieto 0
        pulsa 7 0x80
    } else {
        incr ::quieto
        if {$::quieto >= 6} {
            apunta "llamada acabada"
            a_la_zona_12
            return
        }
    }
    after time 0.5 llamada
}
after time 66 llamada

# jugando en el paso 0 un segundo seguido (como omsx_salas: RETURN en las
# llamadas, la vida llena salvo cuando se quiere el game over)
set ::listo 0
proc espera {cmd {vida 1} {vueltas 0}} {
    if {$vueltas > 120} { apunta "atascado"; set ::listo 0; eval $cmd; return }
    if {$vida} { poke 0xCA53 [debug read memory 0xCA52] }
    set e [debug read memory 0xCA00]
    if {[debug read memory 0xCA97] != 0} {
        set ::listo 0
        pulsa 7 0x80
    } elseif {$e == 5 && [debug read memory 0xCA01] == 0 && [debug read memory 0xCA41] == 0} {
        incr ::listo
        if {$::listo >= 4} { set ::listo 0; eval $cmd; return }
    } else {
        set ::listo 0
    }
    after time 0.25 [list espera $cmd $vida [expr {$vueltas + 1}]]
}

proc a_la_zona_12 {} {
    # el paso a la zona 0x12 en la casilla 3:7 de la rejilla, saliendo por la derecha
    poke [expr {0xD900 + 3 * 16 + 7}] [expr {0x80 | 0x12}]
    poke 0xD430 0
    poke 0xD881 0xFF
    poke 0xD888 $::D888
    poke 0xD889 0
    poke 0xCA76 0
    poke 0xCA50 3
    poke 0xCA51 6
    poke 0xCA41 4
    after time 0.5 {espera en_la_zona_12}
}

proc en_la_zona_12 {} {
    apunta "en la zona 0x12"
    poke 0xD881 0xFF
    poke 0xD888 $::D888
    poke 0xD889 0
    # muerto: el estado de Snake 0x14 hace que el paso 0 pase al 0x0B
    # (p01:745E) y de ahi al game over (estado 6)
    poke 0xCA53 0
    poke 0xCB00 0x14
    after time 0.5 game_over
}

set ::vistas 0
proc game_over {} {
    incr ::vistas
    if {$::vistas > 200} { apunta "sin game over"; close $::log; exit }
    set e [debug read memory 0xCA00]
    if {$e == 6} {
        apunta "game over"
        pulsa 8 0x01
        after time 0.5 continua
        return
    }
    if {$e == 5 && [debug read memory 0xCA01] == 0} { poke 0xCB00 0x14 }
    after time 0.25 game_over
}

set ::vueltas_c 0
proc continua {} {
    incr ::vueltas_c
    if {$::vueltas_c > 200} { apunta "sin seguir"; close $::log; exit }
    if {[debug read memory 0xCA00] == 6} {
        pulsa 8 0x01
        after time 0.5 continua
        return
    }
    after time 1 {espera seguido}
}

proc seguido {} {
    apunta "tras CONTINUE"
    vuelca "seguido"
    if {$::JEFE eq "fox"} { graba; return }
    # a la sala 1, por la izquierda desde la 2:8
    poke 0xCA50 2
    poke 0xCA51 8
    poke 0xCA41 3
    after time 0.5 {espera en_sala_1}
}

set ::esperas 0
proc en_sala_1 {} {
    apunta "sala 1"
    vuelca "sala1"
    espera_paso_4
}

# en la sala 1 la ficha dice su mensaje (pasos 1-3): se pasa con el espacio
# hasta su paso 4 (d8a9_en_sala_6, p05:B608), que espera a Snake en la sala 6
proc espera_paso_4 {} {
    incr ::esperas
    if {[debug read memory 0xD841] >= 4 || $::esperas > 240} {
        apunta "paso 4"
        a_sala_6
        return
    }
    poke 0xCA53 [debug read memory 0xCA52]
    pulsa 8 0x01
    after time 0.5 espera_paso_4
}

proc a_sala_6 {} {
    # a la sala 6, por arriba (la fila sube): de la 2:7 a la 3:7
    poke 0xCA50 2
    poke 0xCA51 7
    poke 0xCB03 0xBF
    poke 0xCA41 1
    after time 0.5 {espera en_sala_6}
}

set ::n 0
proc en_sala_6 {} {
    apunta "sala 6"
    graba
}

proc graba {} {
    vuelca [format "b%03d" $::n]
    apunta [format "volcado %d" $::n]
    poke 0xCA53 [debug read memory 0xCA52]
    pulsa 8 0x01
    after time 0.5 {pulsa 8 0x01}
    incr ::n
    if {$::n >= $::SEGS} { close $::log; exit }
    after time 1 graba
}
