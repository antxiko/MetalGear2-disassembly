#!/usr/bin/env python3
"""Los mapas de Metal Gear 2: cada sala pintada por el cartucho ejecutado.

Nada se dibuja a mano. tools/mg2run.py corre el codigo del juego con un V9938
emulado y aqui solo se le dice a que sala ir, como lo hace el juego:

  - la rejilla de la zona: la lista de p30:B8A5 (p02:804E): casillas
    fila * 16 + columna, numeradas por orden hasta 0xFF; detras, parejas
    [casilla][sala] hasta 0xFF. Una sala de 0x80 o mas es un paso a la zona
    sala & 0x7F (p00:5A25): no se pinta.
  - la partida nueva (p02:9E2B) deja la maquina como al empezar.
  - la primera sala de cada zona entra por cambia_de_zona (p00:59A7, A = la
    zona) con 0xCA4A = 0x3F, para que prepare la zona entera (las piezas de
    la pagina 2, p00:5A52); las demas por entra_en_sala (p00:52CF) con la
    fila y la columna en 0xCA50-0xCA51.
  - la paleta: la partida nueva deja 0xCADF = 1 (p06:A0F5), la llegada de
    Snake: con el, paleta_de_la_sala (p02:8475) pone encima la de p14:AA44
    (los colores 4, 5, 6 y 8 a negro), que se funde hasta que el estado 0x19
    de Snake lo quita (p11:A017). Aqui se quita antes de entrar: la sala 0
    de la zona 0 sale como en openMSX a los 26-32 s (111, 222, 333).
  - el laberinto de la zona 7: en las filas 1-4, columnas 5-7, sin 0xD430 = 2
    el juego pinta la sala de p24:7AF8 y devuelve a Snake a la sala 0 por el
    camino malo (p00:52F0, p00:551D); aqui se pone 0xD430 = 2 y se pintan
    las salas de verdad.
  - la zona 0x12: sin el suceso 0xD881 (banderas de 0xD880, 0xFF = pasado)
    el juego mete a Snake en la sala (2, 9) con la entrada corta (p00:5AD9) y
    tapa las salas 2, 3 y 8 (p00:5734); aqui se pinta con 0xD881 = 0xD888 =
    0xFF, despues de esos sucesos.
  - el montaje: salir por arriba SUMA uno a la fila y por abajo resta
    (p02:8117, p02:814F); por la izquierda la columna uno menos (p02:8169).
    La fila 1 va abajo del todo.
  - la imagen: los 192 x 192 puntos de la sala (24 x 24 caracteres,
    p00:57AE) de la pagina que ensena el VDP (R#2).

Uso: mapas.py salas [zona ...]     las salas a work/salas/zZZ_sSS.png
     mapas.py zonas [zona ...]     las zonas montadas a work/mapas/zona_ZZ.png
"""
import json
import os
import sys
import time

AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)
RAIZ = os.path.join(AQUI, "..")
ROM = open(os.path.join(RAIZ, "metalgear2.rom"), "rb").read()
SALAS = os.path.join(RAIZ, "work", "salas")
MAPAS = os.path.join(RAIZ, "work", "mapas")
N_ZONAS = 20                       # p30:B8A5: 20 punteros hasta la primera lista
LADO = 192                         # 24 caracteres de 8 puntos


def byte(banco, d):
    return ROM[banco * 0x2000 + (d & 0x1FFF)]


def palabra(banco, d):
    return byte(banco, d) | byte(banco, d + 1) << 8


def rejilla(zona, tabla=0xB8A5):
    """{casilla: sala} de la zona, como la deja p02:804E en 0xD900."""
    p = palabra(30, tabla + 2 * zona)
    g, n = {}, 0
    while byte(30, p) != 0xFF:
        g[byte(30, p)] = n
        n += 1
        p += 1
    p += 1
    while byte(30, p) != 0xFF:
        g[byte(30, p)] = byte(30, p + 1)
        p += 2
    return g


def pinta_salas(zonas):
    from mg2run import Mg2
    os.makedirs(SALAS, exist_ok=True)
    m = Mg2()
    m.llama(0x9E2B)                               # la partida nueva
    m.pon(0xCADF, 0)                              # sin la llegada de Snake (p06:A0F5)
    info = {}
    for z in zonas:
        g = rejilla(z)
        primera = True
        for casilla in sorted(g):
            sala = g[casilla]
            if sala >= 0x80:
                continue
            fila, col = casilla >> 4, casilla & 15
            t = time.time()
            m.pon(0xCA50, fila)
            m.pon(0xCA51, col)
            m.pon(0xD430, 2 if z == 7 else 0)         # el laberinto de la zona 7, abierto
            m.pon(0xD8A4, 0)
            for d in (0xD881, 0xD888):                # la zona 0x12 despues de sus sucesos
                m.pon(d, 0xFF if z == 0x12 else 0)
            m.bancos_123()
            if primera:
                m.pon(0xCA4A, 0x3F)
                m.llama(0x59A7, a=z)                  # cambia_de_zona
                primera = False
            else:
                m.llama(0x52CF)                       # entra_en_sala
            assert m.mem[0xCA4A] == z and m.mem[0xCA4B] == sala, (z, sala, m.mem[0xCA4A], m.mem[0xCA4B])
            pag = (m.vdp.r[2] >> 5) & 3
            im = m.vdp.pagina(pag, LADO).crop((0, 0, LADO, LADO))
            nombre = "z%02X_s%02X.png" % (z, sala)
            im.save(os.path.join(SALAS, nombre))
            info["%02X_%02X" % (z, sala)] = {"fila": fila, "columna": col,
                                             "paleta": [list(c) for c in m.vdp.pal]}
            print("zona %02X sala %02X (%X, %X) %.1f s" % (z, sala, fila, col, time.time() - t), flush=True)
    viejo = {}
    ruta = os.path.join(SALAS, "salas.json")
    if os.path.exists(ruta):
        viejo = json.load(open(ruta))
    viejo.update(info)
    json.dump(viejo, open(ruta, "w"), indent=0, sort_keys=True)


def monta_zonas(zonas):
    from PIL import Image
    os.makedirs(MAPAS, exist_ok=True)
    for z in zonas:
        g = {c: s for c, s in rejilla(z).items() if s < 0x80}
        filas = [c >> 4 for c in g]
        cols = [c & 15 for c in g]
        f0, c0 = min(filas), min(cols)
        ancho = (max(cols) - c0 + 1) * LADO
        alto = (max(filas) - f0 + 1) * LADO
        im = Image.new("RGB", (ancho, alto), (0, 0, 0))
        for c, s in g.items():
            sala = Image.open(os.path.join(SALAS, "z%02X_s%02X.png" % (z, s)))
            im.paste(sala, (((c & 15) - c0) * LADO, (max(filas) - (c >> 4)) * LADO))
        im.save(os.path.join(MAPAS, "zona_%02X.png" % z))
        print("zona %02X: %d salas, %d x %d" % (z, len(g), ancho, alto))


def main(argv):
    zonas = [int(a, 16) for a in argv[1:]] or list(range(N_ZONAS))
    if argv[0] == "salas":
        pinta_salas(zonas)
    elif argv[0] == "zonas":
        monta_zonas(zonas)
    else:
        print(__doc__)


if __name__ == "__main__":
    main(sys.argv[1:])
