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
        # el juego busca la RAM de 0x8000 (busca_la_ram p01:7243 -> 0xC386) y el
        # slot del cartucho (0xC399); aqui la BIOS no tiene slots y salen los dos
        # a 0: se les da uno distinto para que ENASLT ponga la RAM de la pagina 2
        # (dibujo_a_7000 p12:6F93 lee ahi los dibujos de las salas del radar)
        self.mem[0xC386] = self.slot_ram = 0x8F
        self.mem[0xC399] = 0x01
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

    def partida_nueva(self):
        """La partida nueva (p02:9E2B) con la llamada del principio acabada.
        La partida empieza con 0xCA97 = 1 (los mensajes de los bancos 50-51) y
        por eso empieza_la_partida (p02:9E94) NO carga las rachas de p37:B007 y
        p37:AF4C: los patrones de sprite de los jefes, los enemigos y lo que
        lleva Snake (0xF8C0 y 0xF940...). Las carga el juego al acabar esa
        llamada (p09:B82F -> p02:859E); aqui igual. Sin esto salian sprites con
        letras ("PLA'") en lugar de PREDATOR, NIGHT SIGHT, GREY FOX..."""
        self.llama(0x9E2B)
        self.pon(0xCA97, 0)
        self.bancos_123()
        self.llama(0x85B0)                    # rachas_b007_af4c
        self.bancos_123()
        # y la llegada de Snake acabada: la partida nueva deja 0xCABA = 1 y el
        # radar sin fondo hasta el final de la llegada (p11:A107); las
        # herramientas se la saltan (0xCADF = 0)
        self.pon(0xCABA, 0)
