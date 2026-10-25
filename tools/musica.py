#!/usr/bin/env python3
"""La musica de Metal Gear 2: Solid Snake (PSG y SCC), ejecutando su motor de
sonido (ver motor_musica.py).

El motor vive en el banco 16, puesto en 0x4000, y sus datos en el 17 (0x6000),
el 18 (0x8000) y el de 0xA000, que cambia con cada musica:
  p16:4000  jp p16:4009   arranque: calla todo
  p16:4003  jp p16:4024   pide el sonido A (la RAM lo llama en 0xC340, copia de
                          p03:A14B, con 16-17-18-19 puestos)
  p16:4006  jp p16:428F   el sonido de cada cuadro (p16:4295 pone en 0xA000 el
                          banco de la musica, 0xC68F)
La cabecera de cada sonido sale de la tabla p17:65A9 + 2 x numero (p16:4063).
Las musicas son 0x6A-0xAA, con su banco en p16:4CF9 (p16:4CE3): 19-23, 55 y 59.
Uso:  musica.py registros 0x6A [cuadros] | mp3 0x6A f.mp3
"""
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import motor_musica  # noqa: E402

PIEZAS = []

CFG = dict(rom="metalgear2.rom", org=0x4000, mapper="konami_scc",
           bancos0=((0x4000, 16), (0x6000, 17), (0x8000, 18), (0xA000, 19)),
           bancos_frame=((0x4000, 16), (0x6000, 17), (0x8000, 18), (0xA000, 19)),
           sp=0xDFF0, ram0=[], init=[(0x4000, {})], frame=0x4006, pide=0x4003,
           banco_frame=16, banco_pide=16, ram=(0xC400, 0xC6A0), hz=60,
           psg0={7: 0xBF}, romtype="KonamiSCC", max_s=90, piezas=PIEZAS,
           pagina=None, excluye=[], juntos={}, cotejado=[], ram_de={},
           maquina="C-BIOS_MSX2_JP")

if __name__ == "__main__":
    sys.exit(motor_musica.main(CFG, sys.argv[1:]))
