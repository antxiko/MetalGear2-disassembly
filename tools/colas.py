#!/usr/bin/env python3
"""Las subrutinas del banco 0 que vuelven con OTRO reparto de bancos.

El banco 0 tiene decenas de envoltorios del estilo `call p00:4392 / call
0x9xxx / jp p00:438D`: ponen 7-8-9, llaman a una rutina de esos bancos y
SALEN SALTANDO al reparto 1-2-3, cuyo `ret` vuelve a quien llamo. Quien
llama sigue con 1-2-3 puesto aunque antes tuviera 13-14-15, y el trazador
de cartucho entero tiene que saberlo (cartucho.PONE_BANCOS).

Aqui se sigue, desde cada destino de `call` del banco 0, el camino RECTO
(sin saltos condicionales ni `ret` por medio; los `jp`/`jr` sin condicion se
siguen) hasta un `jp` a una de las rutinas de reparto. Las que tienen un
salto condicional o un `ret` antes no se dan: no se sabe con que reparto
vuelven.

Uso: colas.py           lista "destino reparto"
     colas.py --python  las lineas para cartucho.COLAS
"""
import os
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
RAIZ = os.path.dirname(AQUI)
sys.path.insert(0, AQUI)
import bancos                                    # noqa: E402
from cartucho import PONE_BANCOS, REPARTOS       # noqa: E402
from paginas import ORG                          # noqa: E402

ROM = open(os.path.join(RAIZ, "metalgear2.rom"), "rb").read()
RET_CC = {0xC0, 0xC8, 0xD0, 0xD8, 0xE0, 0xE8, 0xF0, 0xF8}
COND = bancos.JP_CC | bancos.JR_CC | {0x10}


def largo(pc):
    op = ROM[pc - 0x4000]
    if op == 0xCB:
        return 2
    if op == 0xED:
        return 4 if ROM[pc - 0x4000 + 1] in bancos.ED_LEN4 else 2
    if op in (0xDD, 0xFD):
        o2 = ROM[pc - 0x4000 + 1]
        return 4 if o2 == 0xCB else 1 + bancos.BASE_LEN[o2] + (1 if o2 in bancos.IDX_DISP else 0)
    return bancos.BASE_LEN[op]


def cola(d):
    """El reparto con el que vuelve la subrutina d, o None."""
    pc = d
    for _ in range(80):
        if not 0x4000 <= pc < 0x6000:
            return None
        op = ROM[pc - 0x4000]
        w = ROM[pc - 0x4000 + 1] | ROM[pc - 0x4000 + 2] << 8
        if op == 0xC3:
            if w in PONE_BANCOS:
                return PONE_BANCOS[w]
            pc = w
            continue
        if op == 0x18:
            pc = pc + 2 + ((ROM[pc - 0x4000 + 1] ^ 0x80) - 0x80)
            continue
        if op in (0xC9, 0xE9) or op in RET_CC or op in COND:
            return None
        pc += largo(pc)
    return None


def main(argv):
    t, _ = bancos.traza_completa(ROM, os.path.join(RAIZ, "src"))
    destinos = set()
    for (dst, b, pc, s, hl, de) in t.llamadas:
        i = b * 0x2000 + pc - ORG[b]
        if (ROM[i] == 0xCD or ROM[i] in bancos.CALL_CC) and 0x4000 <= dst < 0x6000:
            destinos.add(dst)
    # las que ya son de COLAS el trazador no las apunta como llamadas
    destinos |= set(PONE_BANCOS)
    # y los destinos de cualquier `call` del cartucho: una cola es un camino
    # recto que acaba en `jp` a un reparto, y eso no lo cumple un byte suelto
    # que no sea codigo
    for i in range(len(ROM) - 2):
        if ROM[i] == 0xCD or ROM[i] in bancos.CALL_CC:
            dst = ROM[i + 1] | ROM[i + 2] << 8
            if 0x4000 <= dst < 0x6000:
                destinos.add(dst)
    for d in sorted(destinos - set(REPARTOS)):
        r = cola(d)
        if r is None:
            continue
        if "--python" in argv:
            print("    0x%04X: %s," % (d, tuple(r)))
        else:
            print("%04X %s" % (d, r))


if __name__ == "__main__":
    main(sys.argv)
