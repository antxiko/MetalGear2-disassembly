#!/usr/bin/env python3
"""Una COPIA de la ROM con el monitor de depuracion de p63:B802 encendido.

p63:B800 es 'or a / ret' (0xB7 0xC9): la interrupcion lo llama cada cuadro
(p03:A12F) y vuelve sin hacer nada. Con dos 'nop' en su lugar se sigue por
p63:B802, el monitor. La ROM base no se toca: la copia va a work/.

Uso: rom_monitor.py [salida]   (por defecto work/metalgear2_monitor.rom)
"""
import os
import sys

RAIZ = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
DONDE = 63 * 0x2000 + (0xB800 - 0xA000)


def main(argv):
    salida = argv[1] if len(argv) > 1 else os.path.join(RAIZ, "work", "metalgear2_monitor.rom")
    rom = bytearray(open(os.path.join(RAIZ, "metalgear2.rom"), "rb").read())
    if rom[DONDE:DONDE + 2] != b"\xB7\xC9":
        sys.exit("p63:B800 no es 'or a / ret': %s" % rom[DONDE:DONDE + 2].hex())
    rom[DONDE:DONDE + 2] = b"\x00\x00"
    os.makedirs(os.path.dirname(salida), exist_ok=True)
    open(salida, "wb").write(rom)
    print("%s: p63:B800 = nop nop (offset 0x%05X)" % (salida, DONDE))


if __name__ == "__main__":
    main(sys.argv)
