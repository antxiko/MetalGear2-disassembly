#!/usr/bin/env python3
"""Las pantallas de cada pelea escogidas para la web, de lo que saca tools/jefes.py.

Por jefe (tipo de la ficha 0xD800), de 2 a 4 pantallas en orden: la llegada,
la pelea y el final; recortadas a la zona de juego (0xC0 x 0xC0, sin el
marcador de la derecha) y puestas en fila. Del 2, las de la pantalla partida
montada (vNNNNN, pantalla_partida). Los nombres de los jefes salen de sus
mensajes (NOMBRES, con donde lo dicen).

Uso: jefes_web.py  -> work/jefes/web_tTT.png
"""
import os
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
RAIZ = os.path.join(AQUI, "..")
JEFES = os.path.join(RAIZ, "work", "jefes")

# los nombres, de sus mensajes (tools/textos.py; work/textos/textos.md)
NOMBRES = {
    0x01: ("HIND D", "p49:AF2E, ケスラー: HIND・D"),
    0x02: ("METAL GEAR (el nuevo, con FOX dentro)", "p49:B9BA... ペトロ: シンガタMETAL GEAR; su mensaje, de FOX"),
    0x03: ("BLACK COLOR (Kyle Schneider)", "p50:8807 y 887B"),
    0x04: ("RUNNING MAN", "p50:8BDA"),
    0x05: ("NIGHT SIGHT", "p49:B233, ケスラー; p49:B9A9"),
    0x06: ("RED BLASTER", "p50:8D64"),
    0x07: ("PREDATOR", "p50:8D95"),
    0x08: ("ペトロビッチ・マッドナー (ペトロ)", "p50:8E35-9182 (mensajes 0x14-0x17); el nombre entero, p49:B61E (ケスラー)"),
    0x09: ("GREY FOX", "p50:990C (mensaje 0x10); GREY FOX, asi, en los textos"),
    0x0A: ("BIG BOSS", "p50:92BB y 92FF (mensajes 0x12 y 7)"),
    0x0B: ("ULTRABOX", "p50:8DE4"),
}

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
