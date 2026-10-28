#!/usr/bin/env python3
"""La pantalla partida de tools/jefes.py (pantalla_partida) contra openMSX.

Cada volcado de tools/omsx_partida.tcl (vram-, vdp-, ram-<et>) se monta como la
interrupcion de linea y se compara con las capturas (ver-<et>.png, 320 x 240;
la pantalla en (32, 14)). Los colores, por el indice de la paleta volcada (el
RGB de openMSX y el de msx2run no son el mismo).

La captura de openMSX minimizado va SEGUNDOS por detras de la VRAM (no repinta):
ver-t012 ensena el desplazamiento 0x81 del volcado t008, ver-t014 el 0x5F de
t010/t012. Por eso cada captura se compara con todos los volcados y se da el
que mejor casa.

2026-10-28 (work/omsx_partida3, por la puerta 8 de tipo 5 como el juego): ver-t014
contra t010 (R#23 = 0x5F), 175 puntos de 54272; ver-t008 contra t004 (0xB1), 526;
lo distinto, sprites que se mueven (Snake, chispas). Y tools/jefes.py contra
openMSX en el mismo paso (v00320 contra mio-t012, los dos 0x5F): 224 puntos, un
objeto lanzado (sprite) y la barra de vida (jefes.py deja 0xCA53 = 0x20, el
guion la llena hasta 0xCA52).

Uso: coteja_partida.py <dir> [--png]  -> <dir>/mio-<et>.png y dif-<cap>.png
"""
import glob
import os
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)
import jefes          # noqa: E402
import omsx_pinta     # noqa: E402


def main(argv):
    from PIL import Image
    d = argv[0]
    ets = [os.path.basename(f)[4:-4] for f in sorted(glob.glob(os.path.join(d, "ver-*.png")))]
    mios = {}
    for et in ets:
        v, _ = omsx_pinta.carga(d, et)
        mem = open(os.path.join(d, "ram-%s.bin" % et), "rb").read()
        im = jefes.pantalla_partida(v, mem)
        pal = [v.rgb(i) for i in range(16)]
        mios[et] = (im, pal, mem[0xFFF6])
        if "--png" in argv:
            im.save(os.path.join(d, "mio-%s.png" % et))
    pal = mios[ets[-1]][1]
    cache = {}

    def indice(c):
        if c not in cache:
            cache[c] = min(range(16), key=lambda i: sum((a - b) ** 2 for a, b in zip(c, pal[i])))
        return cache[c]

    def indices(im):
        return [indice(c) for c in im.getdata()]
    ind = {et: indices(mios[et][0]) for et in ets}
    for cap in ets:
        ver = Image.open(os.path.join(d, "ver-%s.png" % cap)).convert("RGB").crop((32, 14, 288, 226))
        iv = indices(ver)
        n, et = min((sum(1 for a, b in zip(iv, ind[e]) if a != b), e) for e in ets)
        malas = [k for k, (a, b) in enumerate(zip(iv, ind[et])) if a != b]
        print("ver-%s: mejor el volcado %s (R#23 0x%02X), %d puntos distintos, filas %s" % (
            cap, et, mios[et][2], n, resumen(sorted({k // 256 for k in malas}))))
        if "--png" in argv:
            px = ver.load()
            for k in malas:
                px[k % 256, k // 256] = (255, 0, 255)
            ver.save(os.path.join(d, "dif-%s.png" % cap))


def resumen(filas):
    if not filas:
        return "-"
    tramos, ini, ant = [], filas[0], filas[0]
    for y in filas[1:] + [None]:
        if y is None or y != ant + 1:
            tramos.append("%d" % ini if ini == ant else "%d-%d" % (ini, ant))
            ini = y
        ant = y if y is not None else ant
    return " ".join(tramos)


if __name__ == "__main__":
    main(sys.argv[1:])
