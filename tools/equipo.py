#!/usr/bin/env python3
"""Las pantallas de armas (F2) y equipo (F3) pintadas por el cartucho (tools/mg2run.py).

Lo que lleva Snake son fichas de 4 bytes [la tiene][cuenta en BCD, 2 bytes][...]:
13 armas en 0xD600 (las pinta cosas_de_d600, p10:B00E) y 0x22 cosas de equipo
en 0xD638 (cosas_de_d638, p10:B042). Aqui se le dan todas con la cuenta 1, se
abre la pantalla por el paso 2 (F2, p01:74F7 -> p10:AED6) o 3 (F3, p01:7505 ->
p10:AF30) de la partida y se corre el cuadro entero (p01:728E). El cursor se
mueve con el mando (cursor_con_el_mando, en columnas); de cada cosa se guarda
la pantalla con su letrero (p50:8046 en F2, p50:8048 en F3) y su dibujo.

Uso: equipo.py [f2|f3]  -> work/equipo/f2_NN.png, f3_NN.png
"""
import os
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)
RAIZ = os.path.join(AQUI, "..")
SAL = os.path.join(RAIZ, "work", "equipo")
ARR, ABA, IZQ, DER = 1, 2, 4, 8


def maquina():
    import mapas
    from mg2run import Mg2
    m = Mg2()
    m.partida_nueva()                           # la partida nueva
    m.pon(0xCADF, 0)
    mapas.entra_en_zona(m, 0)
    for d, v in ((0xCA40, 1), (0xCB00, 0), (0xCA00, 5), (0xCA01, 0), (0xCA97, 0), (0xD8A8, 0)):
        m.pon(d, v)
    return m


def cuadro(m, teclas, antes):
    m.pon(0xCA08, teclas)
    m.pon(0xCA07, teclas & ~antes)
    m.pon(0xCA0A, 0)
    m.pon(0xCA09, 0)
    m.bancos_123()
    m.llama(0x728E)
    m.pon(0xCA53, 0x20)
    return teclas


def foto(m, nombre):
    import mapas
    v = m.vdp
    im = v.pagina((v.r[2] >> 5) & 3, 212)
    mapas.sprites_de_ram(v, m.mem, im)
    im.save(os.path.join(SAL, nombre))


def pantalla(cual):
    m = maquina()
    for i in range(13):                       # las 13 armas
        m.pon(0xD600 + 4 * i, 1)
        m.pon(0xD601 + 4 * i, 1)
        m.pon(0xD602 + 4 * i, 0)
    for i in range(0x22):                     # las 0x22 cosas de equipo
        m.pon(0xD638 + 4 * i, 1)
        m.pon(0xD639 + 4 * i, 1)
        m.pon(0xD63A + 4 * i, 0)
    m.pon(0xD701, 0)
    m.pon(0xCA01, 2 if cual == "f2" else 3)
    antes = 0
    for _ in range(4):
        antes = cuadro(m, 0, antes)
    n = m.mem[0xD705]                         # cuantas hay en la pantalla
    print(cual, "paso", m.mem[0xCA01], "cosas", n)
    vistas = {}
    # en columnas: abajo hasta el final, a la derecha, arriba... (cursor_con_el_mando)
    camino = []
    for c in range(8):
        camino += [ABA if c % 2 == 0 else ARR] * 7 + [DER]
    pos = 0
    for t in [0] + camino:
        if t:
            antes = cuadro(m, t, antes)
            for _ in range(3):
                antes = cuadro(m, 0, antes)
        c = m.mem[0xD704]
        if c and c not in vistas:            # 0: casilla vacia
            vistas[c] = pos
            foto(m, "%s_%02d_c%02X.png" % (cual, pos, c))
            pos += 1
        if len(vistas) == n:
            break
    print(cual, "vistas", len(vistas), " ".join("%02X" % c for c in vistas))
    return n


if __name__ == "__main__":
    os.makedirs(SAL, exist_ok=True)
    for c in (sys.argv[1:] or ["f2", "f3"]):
        pantalla(c)
