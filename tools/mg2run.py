#!/usr/bin/env python3
"""Metal Gear 2 ejecutado para pintar: el cartucho en tools/msx2run.py.

El arranque se corre desde p00:407C (la RAM borrada, las rutinas copiadas a
0xC200-0xC3FF, los bancos 0-3 y la SCREEN 5 de p06:B066) hasta el bucle
eterno de p00:40EE; despues se llaman las rutinas del juego una a una con
los bancos 1-2-3 puestos, como las llama la interrupcion.

Uso (como modulo): m = Mg2(); m.llama(0x4BEC)
"""
import os
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)
from msx2run import Msx   # noqa: E402

ROM = os.path.join(AQUI, "..", "metalgear2.rom")


class Mg2(Msx):
    def __init__(self, rom=None):
        super().__init__(rom or open(ROM, "rb").read(), msx2=True)
        self.tolera_bios = True
        self.sp = 0xC200
        self.mem[0xFFA7] = 0xC9               # sin disquetera
        self.corre(0x407C, hasta=0x40EE)
        self.bancos_123()

    def bancos_123(self):
        for v, b in ((0x6000, 1), (0x8000, 2), (0xA000, 3)):
            self.pon_banco(v, b)
            self.mem[0xC380 + (v >> 13) - 2] = b

    def llama(self, donde, **regs):
        for k, x in regs.items():
            setattr(self, k, x)
        self.sp = 0xC1F0
        self.corre(donde)

    def pon(self, d, v):
        self.mem[d] = v & 0xFF
