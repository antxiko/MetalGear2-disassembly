#!/usr/bin/env python3
"""Que bytes de la ROM lee el motor de sonido al tocar cada sonido.

Se ejecuta el motor del cartucho (tools/motor_musica.py, con la
configuracion de tools/musica.py): se pide el sonido y se corren sus cuadros
hasta que se calla o vuelve sobre si mismo, apuntando cada lectura de la ROM
que NO es una instruccion (lo que el motor lee como datos: cabeceras,
partituras, tablas de envolventes).

La tabla de sonidos es p17:65A9 (p16:4063: 0x65A9 + 2 x numero, con acarreo
al byte alto: llega hasta el 0xEF). Los numeros 0xF0-0xFF son ordenes
(p16:402C: callar, fundir...), no sonidos.

Uso: partituras.py resumen          cuantos bytes lee cada sonido
     partituras.py json fichero     {sonido: [[banco, ini, fin], ...]}
"""
import json
import os
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
RAIZ = os.path.dirname(AQUI)
sys.path.insert(0, AQUI)
import motor_musica                      # noqa: E402
from musica import CFG                   # noqa: E402

ROM = open(os.path.join(RAIZ, CFG["rom"]), "rb").read()
TABLA = 0x65A9
N_SONIDOS = 0xF0
CUADROS = 60 * 75


class Lector(motor_musica.Cartucho):
    """El cartucho del motor, apuntando las lecturas de datos de la ROM."""

    def __init__(self, cfg, rom):
        super().__init__(cfg, rom)
        self.leidos = set()
        self._en_instruccion = False

    def _leer(self, d):
        d &= 0xFFFF
        if 0x4000 <= d < 0xC000 and not self._en_instruccion:
            b = self.bancos.get(d & 0xE000)
            b = None if b is None else b % 64      # el mapper solo mira 6 bits
            self.leidos.add((b, d))
        return super()._leer(d)


def instrucciones():
    """{(banco, direccion de ejecucion)} de cada byte trazado como codigo."""
    from paginas import N_PAGINAS, nombre
    out = set()
    for p in range(N_PAGINAS):
        ruta = os.path.join(RAIZ, "work", nombre(p) + ".trace.json")
        with open(ruta) as f:
            for k, a, b in json.load(f)["blocks"]:
                if k == "c":
                    out.update((p, x) for x in range(a, b))
    return out


def toca(n, codigo):
    """Las lecturas de datos del sonido n, en direcciones de la ranura."""
    motor_musica.Cartucho = Lector
    z = motor_musica.arranca(CFG, ROM, n)
    vistos = set()
    a, b = CFG["ram"]
    for _ in range(CUADROS):
        motor_musica.corre_frame(z)
        h = bytes(z.mem[a:b])
        if h in vistos:
            break
        vistos.add(h)
    from paginas import ORG
    return sorted(x for x in z.leidos
                  if x[0] is not None and (x[0], ORG[x[0]] + (x[1] & 0x1FFF)) not in codigo)


def tramos(leidos):
    out = []
    for b, d in leidos:
        if out and out[-1][0] == b and out[-1][2] == d:
            out[-1][2] = d + 1
        else:
            out.append([b, d, d + 1])
    return out


def main(argv):
    codigo = instrucciones()
    todos = {}
    for n in range(N_SONIDOS):
        todos[n] = tramos(toca(n, codigo))
    if argv[1:2] == ["json"]:
        with open(argv[2], "w") as f:
            json.dump(todos, f, indent=0)
    else:
        for n, ts in todos.items():
            print("0x%02X  %5d bytes en %d tramos" % (n, sum(f - i for _, i, f in ts), len(ts)))


if __name__ == "__main__":
    main(sys.argv)
