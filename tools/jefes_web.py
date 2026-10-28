#!/usr/bin/env python3
"""Las pantallas de cada pelea escogidas para la web, de lo que saca tools/jefes.py.

Por jefe (tipo de la ficha 0xD800), de 2 a 4 pantallas en orden: la llegada,
la pelea y el final; recortadas a la zona de juego (0xC0 x 0xC0, sin el
marcador de la derecha) y puestas en fila. Del 2, las de la pantalla partida
montada (vNNNNN, pantalla_partida). Los nombres de los jefes salen de sus
mensajes (fase 4): aqui van por tipo.

Uso: jefes_web.py  -> work/jefes/web_tTT.png
"""
import os
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
RAIZ = os.path.join(AQUI, "..")
JEFES = os.path.join(RAIZ, "work", "jefes")

ELEGIDAS = {
    0x01: ["p00000", "p00224", "p00432", "p00656"],
    0x02: ["v00160", "v00272", "v00688", "v00816"],
    0x03: ["p00048", "p00192", "p00704", "p00848"],
    0x04: ["p00000", "p00096", "p00176"],
    0x05: ["p00048", "p00368", "p00608"],
    0x06: ["p00080", "p00400", "p00592"],
    0x07: ["p00032", "p00192", "p00224", "p00656"],
    0x08: ["p00704", "p01008", "p01328"],
    0x09: ["p00832", "p01792", "p03536"],
    0x0A: ["p04192", "p04272", "p04560", "p04752"],
    0x0B: ["p00368", "p00656", "p00944"],
}


def main():
    from PIL import Image
    for t, nombres in ELEGIDAS.items():
        ims = [Image.open(os.path.join(JEFES, "t%02X" % t, n + ".png")).convert("RGB").crop((0, 0, 0xC0, 0xC0))
               for n in nombres]
        hoja = Image.new("RGB", (len(ims) * 0xC4 - 4, 0xC0), (0, 0, 0))
        for k, im in enumerate(ims):
            hoja.paste(im, (k * 0xC4, 0))
        sal = os.path.join(JEFES, "web_t%02X.png" % t)
        hoja.save(sal)
        print(sal, hoja.size)


if __name__ == "__main__":
    main()
