# omsx_salas.tcl - Lleva a Snake por las salas de la zona 0 en un MSX2
# (C-BIOS_MSX2_JP) y vuelca la VRAM de cada una, para cotejar las salas que
# pinta tools/mapas.py. Se lanza con tools/lanza_salas.ps1 (fuera del
# sandbox, minimizado), sin throttle.
#
#   - a los 30-64 s, espacio cada 2 s: salta la presentacion y empieza.
#   - la llamada inicial (0xCA97 = 1): F1 no la cierra (p09:B7EB); RETURN
#     cada 0,5 s pasa los mensajes hasta que 0xCA97 vuelve a cero.
#   - cada sala: la fila de abajo y la columna a 0xCA50-0xCA51, la Y de
#     Snake a 0xBF (como p02:9606) y 0xCA41 = 1, sale por arriba: el paso 0
#     lo ve (p01:741D) y el 1 entra en la sala de arriba, con la fila uno mas
#     (p02:8117). Por la derecha no: en las zonas 0x0C-0x10 cambia de zona
#     (p02:8174). Andando tampoco: los muros lo paran antes de p02:95D9. Se
#     vuelca al volver al paso 0 (proc espera).
#   - otra zona: en la casilla de destino de la rejilla de 0xD900 un paso a
#     ella (0x80 + la zona, p00:52E7); saliendo por la derecha, la fila y la
#     columna se quedan (p02:825F), y se entra en esa casilla de la zona.
#     Ese paso (p00:5A25) no rehace la pantalla si la zona de antes es una de
#     las 0x0B-0x10 (p00:5A52); cambia_de_zona (p00:59A7), por donde entra el
#     juego, si: la lista pasa antes por otra zona.
#     Al entrar en la zona 0xCACB-0xCACD vuelven a 1 (p00:5A84): la primera
#     sala de cada zona se repite en la lista, para verla con la luz.
#
# Ordenes de la lista: "Z:F:C" una sala de la zona Z; "P:K" cruzar la puerta
# K (hexadecimal) de la zona de ahora; "S:F:C" otra sala de la especial.
# Las especiales se vuelcan como vram-eEE_sSS.bin.
#
# Variables: SALAS_SALIDA (work/omsx_salas), SALAS_LISTA ("zona:fila:col ..."
# en hexadecimal, las casillas de destino), SALAS_DOBLE (no vacia: un segundo
# volcado de cada sala a los 3 s, vram-zZZ_sSS_b.bin).
proc opcion {nombre porDefecto} {
    global env
    if {[info exists env($nombre)]} { return $env($nombre) }
    return $porDefecto
}
set ::SALIDA [opcion SALAS_SALIDA {work/omsx_salas}]
set ::LISTA [opcion SALAS_LISTA {0:2:6 0:2:7 0:2:8}]
file mkdir $::SALIDA
set ::log [open [file join $::SALIDA "salas.txt"] w]
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
    foreach {nombre d} {zona 0xCA4A sala 0xCA4B fila 0xCA50 columna 0xCA51 y 0xCB03 x 0xCB05 alerta 0xCA5F} {
        puts $g [format "%s = 0x%02X" $nombre [debug read memory $d]]
    }
    close $g
    set h [open [file join $::SALIDA "ram-$etiqueta.bin"] wb]
    fconfigure $h -translation binary
    puts -nonewline $h [debug read_block memory 0 65536]
    close $h
}

for {set s 30} {$s <= 64} {incr s 2} {
    after time $s "keymatrixdown 8 0x01; after time 0.15 {keymatrixup 8 0x01}"
}

set ::quieto 0
proc llamada {} {
    if {[debug read memory 0xCA97] != 0} {
        set ::quieto 0
        keymatrixdown 7 0x80
        after time 0.15 {keymatrixup 7 0x80}
    } else {
        incr ::quieto
        if {$::quieto >= 6} {
            puts $::log "llamada acabada"
            flush $::log
            vuelca inicio
            espera siguiente
            return
        }
    }
    after time 0.5 llamada
}
after time 66 llamada

# espera a que se este jugando en el paso 0 (0xCA00 = 5, 0xCA01 = 0, sin
# salida en 0xCA41 ni llamada en 0xCA97) durante 1 s y luego hace cmd; las
# llamadas se pasan con RETURN, la vida se rellena (0xCA53 = 0xCA52) y en el
# game over (0xCA00 = 6) se elige CONTINUE con el espacio
set ::listo 0
proc espera {cmd {vueltas 0}} {
    # tope: 20 s sin llegar al paso 0, se apunta y se sigue
    if {$vueltas > 80} {
        puts $::log "atascado: [format {CA00 %02X CA01 %02X CA41 %02X CA97 %02X} [debug read memory 0xCA00] [debug read memory 0xCA01] [debug read memory 0xCA41] [debug read memory 0xCA97]]"
        flush $::log
        poke 0xCA41 0
        set ::listo 0
        eval $cmd
        return
    }
    poke 0xCA53 [debug read memory 0xCA52]
    # sin la corriente del agua (zona 6), que saca a Snake de la sala (p02:9575)
    poke 0xCA8F 0
    set estado [debug read memory 0xCA00]
    if {$estado == 6} {
        if {$::listo != -1} { puts $::log "game over"; flush $::log }
        set ::listo -1
        keymatrixdown 8 0x01
        after time 0.15 {keymatrixup 8 0x01}
    } elseif {[debug read memory 0xCA97] != 0} {
        set ::listo 0
        keymatrixdown 7 0x80
        after time 0.15 {keymatrixup 7 0x80}
    } elseif {$estado == 5 && [debug read memory 0xCA01] == 0 && [debug read memory 0xCA41] == 0} {
        if {$::listo < 0} { set ::listo 0 }
        incr ::listo
        if {$::listo >= 4} {
            set ::listo 0
            eval $cmd
            return
        }
    } else {
        set ::listo 0
    }
    after time 0.25 [list espera $cmd [expr {$vueltas + 1}]]
}

proc siguiente {} {
    if {[llength $::LISTA] == 0} {
        close $::log
        exit
        return
    }
    set ::LISTA [lassign $::LISTA casilla]
    set partes [split $casilla :]
    foreach d {0xCAC9 0xCACA 0xCACB 0xCACC 0xCACD} { poke $d 0 }
    poke 0xCA5F 0
    if {[lindex $partes 0] eq "P"} {
        # cruzar la puerta K de la zona: una ficha libre de 0xD500 (la 8,
        # 0xD570) de tipo 1 en el estado 3, el de cruzar (p15:A9AB), con su
        # numero; la tabla de la zona (p15:B4B5) dice adonde lleva
        set k [expr "0x[lindex $partes 1]"]
        poke 0xD570 1
        poke 0xD571 3
        poke 0xD575 $k
        after time 0.5 [list espera [list mira P $k 0]]
        return
    }
    if {[lindex $partes 0] eq "S"} {
        # otra sala de la especial: sale por arriba como en las normales
        set fila [expr "0x[lindex $partes 1]"]
        set col [expr "0x[lindex $partes 2]"]
        poke 0xCA50 [expr {($fila - 1) & 0xFF}]
        poke 0xCA51 $col
        poke 0xCB03 0xBF
        poke 0xCA41 1
        after time 0.5 [list espera [list mira S $fila $col]]
        return
    }
    lassign $partes z fila col
    # desde una especial, fuera de ella antes de saltar
    poke 0xCA76 0
    set z [expr "0x$z"]
    set fila [expr "0x$fila"]
    set col [expr "0x$col"]
    set otra [expr {$z != [debug read memory 0xCA4A]}]
    if {$otra} {
        # el paso a la zona z en la casilla de destino de la rejilla de 0xD900
        poke [expr {0xD900 + $fila * 16 + $col}] [expr {0x80 | $z}]
        poke 0xD430 [expr {$z == 7 ? 2 : 0}]
        foreach d {0xD881 0xD888} { poke $d [expr {$z == 0x12 ? 0xFF : 0}] }
    }
    if {$otra} {
        poke 0xCA50 $fila
        poke 0xCA51 [expr {($col - 1) & 0xFF}]
        poke 0xCA41 4
    } else {
        poke 0xCA50 [expr {($fila - 1) & 0xFF}]
        poke 0xCA51 $col
        poke 0xCB03 0xBF
        poke 0xCA41 1
    }
    after time 0.5 [list espera [list mira $z $fila $col]]
}
proc mira {z fila col} {
    set zz [debug read memory 0xCA4A]
    set s [debug read memory 0xCA4B]
    set e [debug read memory 0xCA76]
    if {$e} {
        set et [format "e%02X_s%02X" $e $s]
    } else {
        set et [format "z%02X_s%02X" $zz $s]
    }
    if {[string is integer $z]} { set z [format %02X $z] }
    puts $::log [format "destino %s:%X:%X -> zona %02X sala %02X fila %02X columna %02X especial %02X" $z $fila $col $zz $s         [debug read memory 0xCA50] [debug read memory 0xCA51] $e]
    flush $::log
    vuelca $et
    # SALAS_DOBLE: otro volcado a los 3 s (lo que cambia es animacion)
    if {[opcion SALAS_DOBLE {}] ne ""} {
        after time 3 "vuelca ${et}_b; espera siguiente"
        return
    }
    espera siguiente
}
after time 30000 {puts $::log "tiempo agotado"; close $::log; exit}
