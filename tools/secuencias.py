#!/usr/bin/env python3
"""Las secuencias del cartucho ejecutadas cuadro a cuadro (tools/mg2run.py,
el cuadro entero p01:728E, el de la interrupcion):

  pres   la presentacion desde el arranque: el estado 0 (p01:72B2: el logotipo
         de Konami de p56, pantalla_de_56) y el 1 (p13:8000, los pasos 1-0x41
         de 0xCA2C: los creditos sobre los planos); despues el ciclo sigue
  final  el estado 7 (p13:9555, 31 pasos de 0xD701), como lo pone p01:7473 con
         0xCAAF: la partida nueva (p02:9E2B), la pagina 0 (0xCA42) y el estado 7

Lo que se ve: la pagina de R#2 desplazada R#23 lineas (el final sube los
dibujos con R#23, p13:9655) y los sprites del chip encima.

Las escenas de la web (cuadros del cartucho ejecutado, 60 por segundo):
  pres  konami 0-354 (estado 0), creditos 354-9147 (pasos 1-0x41), titulo
        9147-9804 (estado 1 paso 1, p14:A196, y estado 2), historia 10159-18631
        (la segunda vuelta, 0xCA2A = 1: pasos 0x80 y siguientes de p14:A2CF)
  final zanzibar 7-1322 (pasos 2-8), sol 1322-3748 (9-17: los creditos),
        charla 3748-9757 (18-21: los mensajes de p50:8042), reparto 9757-15364
        (22-27), blanco 15364-15634 (28-30)
Ojo: el cartucho ejecutado no espera al VDP; en el MSX (openMSX) las copias de
cada cuadro del paso 15 del final hacen que los creditos sobre el sol duren
unas diez veces mas (231 s contra 22 s).

Uso: secuencias.py pres|final cuadros dir [cada]  -> dir/fNNNNN.png (los distintos)
     secuencias.py gif pres|final dir [cada] [escala]  -> dir/<escena>.gif
"""
import hashlib
import os
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)


def cuadros(cual, n=None):
    """Genera (k, maquina) tras cada cuadro."""
    from mg2run import Mg2
    m = Mg2()
    if cual == "final":
        m.llama(0x9E2B)                       # la partida nueva
        for d, v in ((0xCAAF, 1), (0xCA42, 0), (0xCA00, 7), (0xCA01, 0), (0xD701, 0), (0xD705, 0)):
            m.pon(d, v)
        n = n or 15700
    else:
        m.pon(0xCA00, 0)
        m.pon(0xCA01, 0)
        n = n or 36000
    for k in range(n):
        m.bancos_123()
        m.llama(0x728E)
        yield k, m
        if cual == "final" and m.mem[0xCA00] != 7:
            break


def pinta(v):
    """La pantalla: la pagina de R#2 con R#23 y los sprites."""
    from PIL import Image
    pag = v.pagina((v.r[2] >> 5) & 3, 256)
    d = v.r[23]
    im = Image.new("RGB", (256, 212))
    im.paste(pag.crop((0, d, 256, 256)), (0, 0))
    if d:
        im.paste(pag.crop((0, 0, 256, d)), (0, 256 - d))
    v.sprites(im)
    return im


ESCENAS = {
    "pres": [("konami", 0, 354), ("creditos_1", 354, 4776), ("creditos_2", 4776, 9147),
             ("titulo", 9147, 9804), ("historia_1", 10159, 14300), ("historia_2", 14300, 18631)],
    "final": [("zanzibar", 7, 1322), ("sol", 1322, 3748), ("charla", 3748, 9757),
              ("reparto", 9757, 15364), ("blanco", 15364, 15634)],
}


def gifs(cual, sal, cada=4, escala=1):
    """Cada escena en un GIF: un cuadro de cada CADA; los iguales seguidos, uno
    solo con su duracion (en milisegundos, 60 cuadros por segundo)."""
    os.makedirs(sal, exist_ok=True)
    esc = ESCENAS[cual]
    fin = max(h for _, _, h in esc)
    imgs, durs, clave = [], [], None
    actual = None
    for k, m in cuadros(cual, fin):
        e = next((x for x in esc if x[1] <= k < x[2]), None)
        if e is not actual:
            if actual and imgs:
                guarda(imgs, durs, os.path.join(sal, actual[0] + ".gif"))
            actual, imgs, durs, clave = e, [], [], None
        if not e or (k - e[1]) % cada:
            continue
        v = m.vdp
        a = ((v.r[11] & 3) << 15) | ((v.r[5] & 0xFC) << 7)
        p = (v.r[2] >> 5) & 3
        c = hashlib.md5(bytes(v.vram[p * 0x8000:(p + 1) * 0x8000]) + bytes(v.vram[a - 0x200:a + 0x80])
                        + bytes(v.r[:24]) + str(v.pal).encode()).digest()
        ms = cada * 1000 / 60
        if c == clave:
            durs[-1] += ms
            continue
        clave = c
        im = pinta(v)
        if escala > 1:
            im = im.resize((256 * escala, 212 * escala))
        imgs.append(im)
        durs.append(ms)
    if actual and imgs:
        guarda(imgs, durs, os.path.join(sal, actual[0] + ".gif"))


def guarda(imgs, durs, ruta):
    imgs[0].save(ruta, save_all=True, append_images=imgs[1:], duration=[round(d) for d in durs],
                 loop=0, optimize=True)
    print("%s: %d imagenes, %.1f s, %d KB" % (ruta, len(imgs), sum(durs) / 1000, os.path.getsize(ruta) // 1024))


def main(argv):
    if argv[0] == "gif":
        gifs(argv[1], argv[2], int(argv[3]) if len(argv) > 3 else 4, int(argv[4]) if len(argv) > 4 else 1)
        return
    cual, n, sal = argv[0], int(argv[1]), argv[2]
    cada = int(argv[3]) if len(argv) > 3 else 4
    os.makedirs(sal, exist_ok=True)
    vistos = set()
    for k, m in cuadros(cual, n):
        if k % cada:
            continue
        im = pinta(m.vdp)
        h = hashlib.md5(im.tobytes()).hexdigest()
        if h not in vistos:
            vistos.add(h)
            im.save(os.path.join(sal, "f%05d.png" % k))
    print(len(vistos), "pantallas distintas")


if __name__ == "__main__":
    main(sys.argv[1:])
