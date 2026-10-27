#!/usr/bin/env python3
"""Coteja las salas de tools/mapas.py (work/salas/zZZ_sSS.png y las especiales
eEE_sSS.png) con los volcados de openMSX de tools/omsx_salas.tcl
(vram-zZZ_sSS.bin o vram-eEE_sSS.bin + vdp-...).

Del volcado se pinta la pagina de R#2 con su paleta, sin sprites (los
enemigos y Snake son sprites), y se recortan los 192 x 192 puntos de la sala.
Se cuentan los puntos de color distinto; con --png, una imagen por sala con
las dos y las diferencias en rojo.

Antes, con el salas.txt del guion, que cada destino haya caido en la sala
que dice la rejilla de la zona (mapas.rejilla).

Uso: coteja_salas.py <dir> [--png]
"""
import glob
import os
import re
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)
from omsx_pinta import carga   # noqa: E402
from mapas import rejilla      # noqa: E402

RAIZ = os.path.join(AQUI, "..")
LADO = 192


def destinos(dir_):
    """Los destinos de salas.txt que no cayeron en su sala."""
    ruta = os.path.join(dir_, "salas.txt")
    if not os.path.exists(ruta):
        return
    n = mal = 0
    for ln in open(ruta):
        m = re.match(r"destino (\w+):(\w+):(\w+) -> zona (\w+) sala (\w+) fila (\w+) columna (\w+)", ln)
        if not m:
            if ln.strip() != "llamada acabada":
                print(ln.strip())
            continue
        if m.group(1) in ("P", "S"):            # puertas y salas de especiales
            continue
        z, f, c, zz, s, ff, cc = [int(x, 16) for x in m.groups()]
        n += 1
        if (zz, s, ff, cc) != (z, rejilla(z).get(f * 16 + c), f, c):
            mal += 1
            print("FUERA:", ln.strip())
    print("%d destinos, %d fuera de su sala" % (n, mal))


def main(argv):
    from PIL import Image
    dir_ = argv[0]
    destinos(dir_)
    total = mal = 0
    for ruta in sorted(glob.glob(os.path.join(dir_, "vram-[ze]*.bin"))):
        et = os.path.basename(ruta)[5:-4]
        if not os.path.exists(os.path.join(RAIZ, "work", "salas", et + ".png")):
            print("%s: no es una sala de los mapas" % et)
            continue
        v, var = carga(dir_, et)
        oms = v.pagina((v.r[2] >> 5) & 3, 212).crop((0, 0, LADO, LADO)).convert("RGB")
        mia = Image.open(os.path.join(RAIZ, "work", "salas", et + ".png")).convert("RGB")
        a, b = oms.load(), mia.load()
        dif = [(x, y) for y in range(LADO) for x in range(LADO) if a[x, y] != b[x, y]]
        total += 1
        mal += bool(dif)
        print("%s: %d puntos distintos" % (et, len(dif)))
        if "--png" in argv and dif:
            im = Image.new("RGB", (LADO * 3, LADO))
            im.paste(oms, (0, 0))
            im.paste(mia, (LADO, 0))
            d = mia.copy()
            p = d.load()
            for x, y in dif:
                p[x, y] = (255, 0, 0)
            im.paste(d, (2 * LADO, 0))
            im.save(os.path.join(dir_, "dif-%s.png" % et))
    print("%d salas, %d con diferencias" % (total, mal))


if __name__ == "__main__":
    main(sys.argv[1:])
