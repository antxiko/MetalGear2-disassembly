#!/usr/bin/env python3
"""Coteja los sprites de los mapas (work/salas/zZZ_sSS_spr.png, eEE_sSS_spr.png)
con los volcados de openMSX de tools/omsx_salas.tcl.

Del volcado se pinta la pagina con los sprites de su RAM (0xDA00 y 0xDC00, sin
los 8 de Snake; mapas.sprites_de_ram) y se comparan solo los puntos que tocan
los sprites en alguna de las dos (donde el fondo ya es distinto no se cuenta).
Los actores que patrullan no estan donde al entrar: cuentan los quietos. Se
dice tambien cuantos actores hay en la sala en cada una (0xCE00, fila y
columna en los bytes 0x0A-0x0B).

Uso: coteja_sprites.py <dir> [--png]
"""
import glob
import os
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)
from omsx_pinta import carga                  # noqa: E402
from mapas import sprites_de_ram, LADO        # noqa: E402

RAIZ = os.path.join(AQUI, "..")


def actores(mem):
    f, c = mem[0xCA50], mem[0xCA51]
    return sorted((mem[0xCE00 + 0x40 * k], mem[0xCE03 + 0x40 * k], mem[0xCE05 + 0x40 * k])
                  for k in range(24) if mem[0xCE00 + 0x40 * k]
                  and mem[0xCE0A + 0x40 * k] == f and mem[0xCE0B + 0x40 * k] == c)


def main(argv):
    from PIL import Image
    dir_ = argv[0]
    salas = os.path.join(RAIZ, "work", "salas")
    total = iguales = 0
    for ruta in sorted(glob.glob(os.path.join(dir_, "vram-[ze]*.bin"))):
        et = os.path.basename(ruta)[5:-4]
        ram = os.path.join(dir_, "ram-%s.bin" % et)
        if not os.path.exists(os.path.join(salas, et + "_spr.png")) or not os.path.exists(ram):
            continue
        mem = bytearray(open(ram, "rb").read())
        v, _ = carga(dir_, et)
        pag = (v.r[2] >> 5) & 3
        o_f = v.pagina(pag, 212).crop((0, 0, LADO, LADO)).convert("RGB")
        o_s = sprites_de_ram(v, mem, v.pagina(pag, 212)).crop((0, 0, LADO, LADO)).convert("RGB")
        m_f = Image.open(os.path.join(salas, et + ".png")).convert("RGB")
        m_s = Image.open(os.path.join(salas, et + "_spr.png")).convert("RGB")
        a, b, c, d = o_f.load(), o_s.load(), m_f.load(), m_s.load()
        tocan = [(x, y) for y in range(LADO) for x in range(LADO)
                 if (a[x, y] != b[x, y] or c[x, y] != d[x, y]) and a[x, y] == c[x, y]]
        dif = [p for p in tocan if b[p] != d[p]]
        total += 1
        iguales += not dif
        print("%s: %d puntos de sprites, %d distintos; actores openMSX %d" % (
            et, len(tocan), len(dif), len(actores(mem))))
        if "--png" in argv and dif:
            im = Image.new("RGB", (LADO * 2, LADO))
            im.paste(o_s, (0, 0))
            im.paste(m_s, (LADO, 0))
            im.save(os.path.join(dir_, "spr-%s.png" % et))
    print("%d salas, %d con los sprites iguales" % (total, iguales))


if __name__ == "__main__":
    main(sys.argv[1:])
