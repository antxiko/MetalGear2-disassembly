#!/usr/bin/env python3
"""Las secuencias ejecutadas (tools/secuencias.py) contra los volcados de
openMSX (tools/omsx_vram.tcl): cada volcado se empareja con el cuadro del
cartucho ejecutado que tiene la pagina a la vista (R#2) mas parecida byte a
byte, y los dos se pintan (pagina con R#23, paleta y sprites) y se cuentan los
puntos distintos.

A igualdad de pagina se escoge el cuadro de paleta mas cercana (los
fundidos) y despues el de sprites mas parecidos.

Uso: coteja_secuencias.py pres|final <dir de volcados> [cuadros] [--png]
     -> <dir>/cotejo.txt (y cmp-<et>.png con --png: openMSX | cartucho | diferencias)
"""
import os
import re
import sys

import numpy as np

AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)
from msx2run import V9938          # noqa: E402
import omsx_pinta                  # noqa: E402
import secuencias                  # noqa: E402


def sprites_sat(v):
    """La tabla de atributos y la de colores de los sprites (R#5/R#11)."""
    a = ((v.r[11] & 3) << 15) | ((v.r[5] & 0xFC) << 7)
    return np.frombuffer(bytes(v.vram[a - 0x200:a + 0x80]), dtype=np.uint8)


def distancia_paleta(a, b):
    return sum(abs(x - y) for c, d in zip(a, b) for x, y in zip(c, d))


def visible(vram, r2):
    p = (r2 >> 5) & 3
    return np.frombuffer(bytes(vram[p * 0x8000:(p + 1) * 0x8000]), dtype=np.uint8)


def main(argv):
    cual, dir_ = argv[0], argv[1]
    cuadros = int(argv[2]) if len(argv) > 2 and argv[2].isdigit() else None
    ets = sorted({re.match(r"vram-(.+)\.bin", x).group(1) for x in os.listdir(dir_) if x.startswith("vram-")},
                 key=lambda e: float(e) if e.replace(".", "").isdigit() else 0)
    vol = {}
    for et in ets:
        v, _ = omsx_pinta.carga(dir_, et)
        vol[et] = (v, visible(v.vram, v.r[2]), sprites_sat(v))
    mejor = {et: ((1 << 30,), None, None) for et in ets}
    for k, m in secuencias.cuadros(cual, cuadros):
        v = m.vdp
        mio = visible(v.vram, v.r[2])
        sat = sprites_sat(v)
        for et in ets:
            # primero la pagina byte a byte; a igualdad, la paleta (fundidos) y los sprites
            d = (int(np.count_nonzero(mio != vol[et][1])),)
            if d[0] > mejor[et][0][0]:
                continue
            d += (distancia_paleta(v.pal, vol[et][0].pal), int(np.count_nonzero(sat != vol[et][2])))
            if d < mejor[et][0]:
                mejor[et] = (d, k, (bytes(v.vram), list(v.r), [tuple(c) for c in v.pal]))
    lineas = []
    from PIL import Image, ImageChops
    for et in ets:
        d, k, copia = mejor[et]
        ov = vol[et][0]
        a = secuencias.pinta(ov)
        mv = V9938()
        mv.vram[:] = copia[0]
        mv.r[:] = copia[1]
        mv.pal[:] = copia[2]
        b = secuencias.pinta(mv)
        dif = ImageChops.difference(a, b)
        n = sum(1 for p in dif.getdata() if p != (0, 0, 0))
        lineas.append("%-6s cuadro %5d  bytes %5d  paleta %3d  sprites %4d  puntos %5d" % ((et, k) + d + (n,)))
        if "--png" in argv:
            h = Image.new("RGB", (768, 212))
            h.paste(a, (0, 0))
            h.paste(b, (256, 0))
            h.paste(dif.point(lambda x: 255 if x else 0), (512, 0))
            h.save(os.path.join(dir_, "cmp-%s.png" % et))
    open(os.path.join(dir_, "cotejo.txt"), "w", encoding="utf-8").write("\n".join(lineas) + "\n")
    print("\n".join(lineas))


if __name__ == "__main__":
    main(sys.argv[1:])
