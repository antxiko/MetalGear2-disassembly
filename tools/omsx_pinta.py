#!/usr/bin/env python3
"""Un volcado de tools/omsx_vram.tcl (vram-<et>.bin + vdp-<et>.txt) pintado
desde la VRAM, no desde la captura: la pagina de R#2 en SCREEN 5 con la
paleta volcada y los sprites del chip encima.

Uso: omsx_pinta.py <dir> <et> <salida.png> [--sin-sprites] [--escala N]
"""
import os
import re
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)
from msx2run import V9938   # noqa: E402


def carga(dir_, et):
    v = V9938()
    v.vram[:] = open(os.path.join(dir_, "vram-%s.bin" % et), "rb").read()
    var = {}
    for ln in open(os.path.join(dir_, "vdp-%s.txt" % et)):
        m = re.match(r"R(\d+) = 0x([0-9A-F]+)", ln)
        if m:
            v.r[int(m.group(1))] = int(m.group(2), 16)
            continue
        m = re.match(r"P(\d+) = (\d)(\d)(\d)", ln)
        if m:
            v.pal[int(m.group(1))] = (int(m.group(2)), int(m.group(3)), int(m.group(4)))
            continue
        k, _, x = ln.strip().partition(" = ")
        if x:
            var[k] = int(x, 16)
    return v, var


def main(argv):
    dir_, et, salida = argv[:3]
    v, var = carga(dir_, et)
    im = v.pagina((v.r[2] >> 5) & 3, 212)
    if "--sin-sprites" not in argv:
        v.sprites(im)
    if "--escala" in argv:
        n = int(argv[argv.index("--escala") + 1])
        im = im.resize((im.width * n, im.height * n))
    im.save(salida)
    print(salida, var)


if __name__ == "__main__":
    main(sys.argv[1:])
