# omsx_ritmo.tcl - El ritmo de verdad de las secuencias del Metal Gear 2 en
# openMSX (C-BIOS_MSX2_JP, 60 Hz): en cada cuadro del VDP apunta 0xCA00 (estado),
# 0xCA01 (paso), 0xCA2C (paso de la presentacion), 0xD701 (paso del final) y
# 0xCA03, el contador que sube una vez por cada cuadro que el juego procesa
# (p01:728E). Donde el juego espera al VDP, pasan cuadros sin que suba: con eso
# tools/secuencias.py da a cada cuadro del cartucho ejecutado su duracion real.
#   RITMO_MODO pres: desde el arranque, RITMO_CUADROS cuadros (por defecto 20000)
#   RITMO_MODO final: empieza la partida, pasa la llamada (RETURN hasta 0xCA97 = 0),
#     pone 0xCAAF = 1 y apunta desde el estado 7 hasta que sale de el
#   RITMO_MODO partida: empieza la partida, pasa la llamada y apunta RITMO_CUADROS
#     cuadros jugando en la primera sala (Snake quieto, los soldados andando)
#   RITMO_SALIDA: el fichero (work/ritmo_<modo>.txt)
proc opcion {nombre porDefecto} {
    global env
    if {[info exists env($nombre)]} { return $env($nombre) }
    return $porDefecto
}
set ::MODO [opcion RITMO_MODO pres]
set ::CUADROS [opcion RITMO_CUADROS 20000]
set ::f [open [opcion RITMO_SALIDA "work/ritmo_$::MODO.txt"] w]
set throttle off
set ::n 0
set ::visto7 0

proc apunta {} {
    set e [debug read memory 0xCA00]
    if {$::MODO eq "final"} {
        if {$e == 7} { set ::visto7 1 } elseif {$::visto7} { close $::f; exit }
        if {!$::visto7} { after frame apunta; return }
    }
    puts $::f [format "%d %d %d %d %d" $e [debug read memory 0xCA01] [debug read memory 0xCA2C] \
        [debug read memory 0xD701] [debug read memory 0xCA03]]
    incr ::n
    if {$::MODO ne "final" && $::n >= $::CUADROS} { close $::f; exit }
    after frame apunta
}

proc pulsa {f m} {
    keymatrixdown $f $m
    after time 0.15 "keymatrixup $f $m"
}
set ::quieto 0
proc empieza {} {
    if {[debug read memory 0xCA00] != 5} {
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
            if {$::MODO eq "final"} { poke 0xCAAF 1 }
            after frame apunta
            return
        }
    }
    after time 0.5 empieza
}
if {$::MODO eq "pres"} { after frame apunta } else { after time 20 empieza }
after time 1500 {close $::f; exit}
