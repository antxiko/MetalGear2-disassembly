#!/usr/bin/env python3
"""Las peleas de las fichas 0xD800 jugadas por el cartucho (tools/mg2run.py).

Las fichas (4 de 0x20 bytes en 0xD800; en las especiales la de 0xD860) son
las peleas: fichas_d800_de_la_zona (p12:6BA5) las pone al entrar en la zona
desde las filas de p56 [tipo][Y][X][fila][columna][vida]; la logica de cada
tipo va por p04:8A8D (tipo - 1) y su dibujo por p04:8A75 (tipo); al quedarse
sin vida (resta_a_d800, p07:B471) pasan a los pasos 0x20 y siguientes
(p04:8AD8).

Aqui: se entra en la zona y en la sala de la ficha (como tools/mapas.py), se
pone a Snake donde la pelea empieza (la Y y la X que mira su primer paso), y
se corre el bucle del juego (p01:741A) cuadro a cuadro: con un mensaje abierto
(0xD8A8 o 0xE221) se pulsa el disparo 1 un cuadro si y otro no (p01:660F),
la vida de Snake (0xCA53) se deja llena, y a los CUADROS cuadros se le quita
al jefe toda la vida con resta_a_d800 para ver como acaba. De cada cuadro se
guardan los sprites 8-31 (los 0-7 son de Snake) si son distintos de los ya
vistos, y cada 16 cuadros la pantalla entera.

Uso: jefes.py TIPO [cuadros]  -> work/jefes/tTT/sNNNN.png (sprites), pNNNN.png (pantalla)
"""
import hashlib
import os
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)
RAIZ = os.path.join(AQUI, "..")
ROM = open(os.path.join(RAIZ, "metalgear2.rom"), "rb").read()
ROSA = (255, 0, 255)

# las filas de p56 que lee fichas_d800_de_la_zona (p12:6C2C-6C8D): zona y direccion
FILAS = {3: 0xA19B, 1: 0xA1A1, 4: 0xA1D2, 7: 0xA1AD, 6: 0xA1A7, 2: 0xA1B3,
         9: 0xA1BF, 0x0A: 0xA1C5, 5: 0xA1B9, 8: 0xA1CB}
ZONA = {3: 3, 1: 7, 4: 7, 7: 0x0A, 6: 0x0E, 2: 0x12, 9: 0x12, 0x0A: 0x12, 5: 0x13, 8: 0x13}
# donde espera a Snake el primer paso de cada tipo (Y, X), leido en su logica
SITIO_DE_SNAKE = {3: (0x60, 0x7C)}


def b56(d):
    return ROM[56 * 0x2000 + d - 0xA000]


def ficha(tipo):
    a = FILAS[tipo]
    t, y, x, f, c, vida = (b56(a + i) for i in range(6))
    assert t == tipo
    return {"zona": ZONA[tipo], "y": y, "x": x, "fila": f, "columna": c, "vida": vida}


def maquina(f):
    import mapas
    from mg2run import Mg2
    m = Mg2()
    m.llama(0x9E2B)
    m.pon(0xCADF, 0)
    z = f["zona"]
    m.pon(0xD430, 2 if z == 7 else 0)
    mapas.entra_en_zona(m, z)
    a_la_sala(m, f["fila"], f["columna"])
    return m


def a_la_sala(m, fila, col):
    """Snake a otra sala de la zona, como tools/mapas.py."""
    m.pon(0xCA50, fila)
    m.pon(0xCA51, col)
    m.bancos_123()
    m.llama(0x7BAA)                           # borra_lo_de_la_sala
    m.pon(0xD44A, 0xFF)
    for d in (0xD42E, 0xD44F, 0xD456, 0xD451):
        m.pon(d, 0)
    m.bancos_123()
    m.llama(0x52CF)                           # entra_en_sala
    for d, v in ((0xCA40, 1), (0xCB00, 0), (0xCA00, 5), (0xCA01, 0), (0xCA97, 0), (0xD8A8, 0)):
        m.pon(d, v)


def sprites(m, desde=8):
    """Los sprites desde el 8 (0xDA00/0xDC00) solos, recortados: (imagen, caja) o None."""
    from PIL import Image, ImageChops
    v = m.vdp
    attr = ((v.r[11] & 3) << 15) | ((v.r[5] & 0xFC) << 7)
    viejo = bytes(v.vram[attr - 0x200:attr + 0x80])
    v.vram[attr - 0x200:attr + 0x80] = m.mem[0xDA00:0xDC80]
    for n in range(desde):
        v.vram[attr + 4 * n] = 0xE0
    im = Image.new("RGB", (256, 212), ROSA)
    v.sprites(im)
    v.vram[attr - 0x200:attr + 0x80] = viejo
    caja = ImageChops.difference(im, Image.new("RGB", im.size, ROSA)).getbbox()
    return (im.crop(caja), caja) if caja else None


def pelea(tipo, cuadros=600):
    """La pelea de la ficha de tipo; si al morir aparece otra (2 -> 9 -> 0x0A
    en la zona 0x12, 5 -> 8 en la 0x13: quita_d800 p04:8C23-8C2D, p04:8CFB),
    se sigue con ella. Los dibujos van a la carpeta del tipo que esta vivo."""
    import mapas
    f = ficha(tipo)
    m = maquina(f)
    raiz = os.path.join(RAIZ, "work", "jefes")
    if tipo in SITIO_DE_SNAKE:
        m.pon(0xCB03, SITIO_DE_SNAKE[tipo][0])
        m.pon(0xCB05, SITIO_DE_SNAKE[tipo][1])
    vistos, antes, antes_f, pasos = set(), 0, 0, []
    vivo, desde, fin, desde24 = None, 0, None, -1
    for k in range(4000):
        # el tipo vivo: la primera ficha ocupada de las 3 de las salas normales
        ahora = next((0xD800 + 0x20 * j for j in range(3) if m.mem[0xD800 + 0x20 * j]), None)
        t = m.mem[ahora] if ahora else None
        if t != vivo:
            vivo, ix, desde = t, ahora, k
            if t and (m.mem[ix + 0x0A], m.mem[ix + 0x0B]) != (m.mem[0xCA50], m.mem[0xCA51]):
                a_la_sala(m, m.mem[ix + 0x0A], m.mem[ix + 0x0B])   # la nueva esta en otra sala
            if t:
                sal = os.path.join(raiz, "t%02X" % t)
                os.makedirs(sal, exist_ok=True)
                for x in os.listdir(sal):
                    os.remove(os.path.join(sal, x))
            elif fin is None:
                fin = k + 120                  # sin ninguna: un rato mas y se acaba
        if fin is not None and k >= fin:
            break
        # un mensaje (0xD8A8, 0xE221) o una llamada (0xE1E8, p03:B11F): el disparo 1
        mensaje = m.mem[0xD8A8] or m.mem[0xE221] or m.mem[0xE1E8]
        teclas = 0x10 if mensaje and k % 2 else 0
        m.pon(0xCA08, teclas)
        m.pon(0xCA07, teclas & ~antes)
        antes = teclas
        # una llamada del transceptor (0xCA97): RETURN, un cuadro si y otro no
        funcion = 0x20 if (m.mem[0xCA97] or m.mem[0xE1E8]) and k % 2 else 0
        m.pon(0xCA0A, funcion)
        m.pon(0xCA09, funcion & ~antes_f)
        antes_f = funcion
        if vivo and k == desde + cuadros and m.mem[ix + 0x10]:
            m.pon_banco(0xA000, 7)
            m.mem[0xC383] = 7
            m.llama(0xB471, ix=ix, c=m.mem[ix + 0x10])   # resta_a_d800: sin vida
        if vivo and m.mem[ix + 1] == 0x24 and k == desde24 + 60:
            # el paso 0x24 espera a Snake en otra sala (p04:8BB6); aqui se sigue
            m.pon(ix + 1, 0x25)
        m.bancos_123()
        m.llama(0x741A)
        m.pon(0xCA53, 0x20)
        if m.mem[0xCA00] != 5:
            print("cuadro %d: la partida pasa al estado %d" % (k, m.mem[0xCA00]))
            break
        if not vivo:
            continue
        paso = (vivo, m.mem[ix + 1])
        if not pasos or pasos[-1][1] != paso:
            pasos.append((k, paso))
            desde24 = k
        r = sprites(m)
        if r:
            h = hashlib.md5(r[0].tobytes() + str(r[0].size).encode()).hexdigest()
            if h not in vistos:
                vistos.add(h)
                r[0].save(os.path.join(sal, "s%05d.png" % k))
        if k % 16 == 0:
            v = m.vdp
            im = v.pagina((v.r[2] >> 5) & 3, 212)
            mapas.sprites_de_ram(v, m.mem, im)
            im.save(os.path.join(sal, "p%05d.png" % k))
    print("zona %02X: %s; %d dibujos distintos" % (
        f["zona"], " ".join("%d:%02X/%02X" % (k, p[0], p[1]) for k, p in pasos), len(vistos)))


if __name__ == "__main__":
    pelea(int(sys.argv[1], 16), int(sys.argv[2]) if len(sys.argv) > 2 else 600)
