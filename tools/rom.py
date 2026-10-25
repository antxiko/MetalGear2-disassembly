#!/usr/bin/env python3
"""Leer la ROM como la lee el cartucho: con el mapper.

Una direccion de 0x6000-0xBFFF no dice nada sin el reparto de bancos puesto
(tools/paginas.py): con 1-2-3 (p00:438D), 0x6000 es el banco 1, 0x8000 el 2
y 0xA000 el 3. 0x4000-0x5FFF es siempre el banco 0.
"""
import os

AQUI = os.path.dirname(os.path.abspath(__file__))
RAIZ = os.path.dirname(AQUI)
RUTA_ROM = os.environ.get("METALGEAR2_ROM", os.path.join(RAIZ, "metalgear2.rom"))
ROM = open(RUTA_ROM, "rb").read()

# Los repartos que ponen las rutinas de cambio de banco (tools/cartucho.py).
T123 = (1, 2, 3)        # p00:438D, y el de encendido
T456 = (4, 5, 6)        # el sonido: p00:41BC, p00:5806, p00:5CAC
T789 = (7, 8, 9)        # p00:4392
T101112 = (10, 11, 12)  # p00:4397
T131415 = (13, 14, 15)  # p00:439F


def banco(trio, a):
    """El banco que hay en la direccion a con el reparto puesto."""
    if 0x4000 <= a < 0x6000:
        return 0
    return trio[(a - 0x6000) >> 13]


def desplazamiento(trio, a):
    """La posicion en el fichero de la ROM del byte a."""
    return banco(trio, a) * 0x2000 + (a & 0x1FFF)


def leer(trio, a):
    return ROM[desplazamiento(trio, a)]


def palabra(trio, a):
    return leer(trio, a) | (leer(trio, a + 1) << 8)


def bytes_de(trio, a, n):
    return bytes(leer(trio, a + i) for i in range(n))
