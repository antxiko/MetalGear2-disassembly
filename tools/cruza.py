#!/usr/bin/env python3
"""Las rutinas de OTRO desensamblado que estan tambien en este, instruccion
por instruccion.

Gekitotsu Pennant Race 2 es la continuacion de The Pro Yakyuu Gekitotsu
Pennant Race (RC-757), y aunque casi no comparten bytes -todo esta en otras
direcciones- muchas rutinas son la misma. Aqui la firma de una rutina es la
lista de sus instrucciones desde la etiqueta hasta el primer `ret`, `jp` o
`jr` sin condicion, con los operandos de 16 bits tapados (en una copia las
direcciones cambian; los registros, los valores de un byte y los saltos
relativos no). Una rutina con nombre del otro listado se da por la misma si
su firma sale UNA sola vez en este y tiene al menos MIN instrucciones, de
las que PROPIAS no son llamadas.

Uso: cruza.py <dir_src_del_otro> <prefijo_del_otro> [--todas]
     escribe en la salida "pNN XXXX nombre  (otro pMM:YYYY) comentario"
"""
import glob
import os
import re
import sys
from collections import defaultdict

AQUI = os.path.dirname(os.path.abspath(__file__))
RAIZ = os.path.dirname(AQUI)

MIN = 6
PROPIAS = 3

LINEA = re.compile(r"^\t(\S[^;]*?)\s*;([0-9a-f]{4})\b(.*)$")
ETIQ = re.compile(r"^([A-Za-z_][A-Za-z0-9_]*):")
H16 = re.compile(r"\b0[0-9a-f]{4}h\b|\b[0-9a-f]{4}h\b")
NOMBRE = re.compile(r"\b(?!L_)[A-Za-z_][A-Za-z0-9_]*\b")


# un comentario que nombra una direccion de ROM o de RAM, o una rutina por su
# banco, no vale en la copia, donde las direcciones son otras
NO_SE_COPIA = re.compile(r"0x[4-9A-Fa-f][0-9A-Fa-f]{3}|p\d\d:")


def lee(ruta):
    """Lista de (direccion, etiqueta o None, instruccion, comentario)."""
    res, etq = [], None
    for ln in open(ruta, encoding="utf-8"):
        m = ETIQ.match(ln)
        if m:
            etq = m.group(1)
            continue
        m = LINEA.match(ln)
        if not m:
            continue
        ins = re.sub(r"\s+", " ", m.group(1).strip())
        com = m.group(3).strip()
        if com.startswith(";"):
            com = com[1:].strip()
        res.append((int(m.group(2), 16), etq, ins, com))
        etq = None
    return res


def tapa(ins):
    """La instruccion con los operandos de 16 bits y las etiquetas tapadas."""
    op, _, arg = ins.partition(" ")
    if op in ("defb", "defw", "defm", "db", "dw"):
        return None
    arg = H16.sub("NN", arg)
    if op in ("jr", "djnz"):
        arg = re.sub(r"[A-Za-z_][A-Za-z0-9_]*$", "R", arg)
    elif op in ("call", "jp"):
        arg = re.sub(r"(?<![(])\b[A-Za-z_][A-Za-z0-9_]*$", "NN", arg) if "(" not in arg else arg
    else:
        arg = re.sub(r"\b(?:L_[0-9A-F]{4}|[a-z_][a-z0-9_]{3,})\b", "NN", arg)
    return op + " " + arg


def firma(ins, k):
    f = []
    for j in range(k, min(k + 80, len(ins))):
        t = tapa(ins[j][2])
        if t is None:
            return None
        f.append(t)
        op, _, arg = ins[j][2].partition(" ")
        if op in ("ret", "reti", "retn") and not arg:
            return tuple(f)
        if op == "jp" and "," not in arg:
            return tuple(f)
        if op == "jr" and "," not in arg:
            return tuple(f)
    return None


def propias(f):
    return sum(1 for t in f if not t.startswith(("call", "jp", "ret")))


def listados(src, prefijo):
    res = {}
    for r in sorted(glob.glob(os.path.join(src, prefijo + "_p??.asm"))):
        b = int(r[-6:-4])
        res[b] = lee(r)
    return res


def main(argv):
    if len(argv) < 3:
        sys.exit(__doc__)
    otro = listados(argv[1], argv[2])
    este = listados(os.path.join(RAIZ, "src"), "metalgear2")
    por_firma = defaultdict(list)
    for b, ins in este.items():
        for k in range(len(ins)):
            f = firma(ins, k)
            if f and len(f) >= MIN and propias(f) >= PROPIAS:
                por_firma[f].append((b, ins[k][0]))
    n = 0
    for b, ins in sorted(otro.items()):
        for k, (a, etq, _, com) in enumerate(ins):
            if not etq or etq.startswith("L_"):
                if "--todas" not in argv or not etq:
                    continue
            f = firma(ins, k)
            if not f or len(f) < MIN or propias(f) < PROPIAS:
                continue
            hay = por_firma.get(f, [])
            if len(hay) == 1:
                b2, a2 = hay[0]
                n += 1
                if "--lote" in argv:
                    # los comentarios de linea, instruccion a instruccion
                    k2 = [x[0] for x in este[b2]].index(a2)
                    for j in range(len(f)):
                        com = ins[k + j][3]
                        if com and not NO_SE_COPIA.search(com):
                            print("p%02d C 0x%04X %s" % (b2, este[b2][k2 + j][0], com))
                else:
                    print("p%02d %04X %s  (otro p%02d:%04X, %d instrucciones)"
                          % (b2, a2, etq, b, a, len(f)))
    print("# %d rutinas" % n, file=sys.stderr)


if __name__ == "__main__":
    main(sys.argv)
