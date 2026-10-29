#!/usr/bin/env python3
"""Snake con todos sus dibujos, pintados por el cartucho ejecutado (tools/mg2run.py).

Como lo pinta el juego (p12):
  - dibuja_snake_b (p12:76E9) copia a la tabla de patrones de sprites (0xF800,
    la fila 0xF0 de la pagina 1; R#6 = 0x1F) una linea de 128 bytes de la
    pagina 3: los 4 patrones de 16 x 16 de Snake. Lo hace al empezar el
    cuadro (p01:778C) con el dibujo del cuadro anterior.
  - dibuja_snake (p12:7688) pone los sprites 0-3 en 0xDC00 (0-1 arriba, 2-3
    0x10 mas abajo; el 1 y el 3 con CC, colores sumados) y deshace en 0xE900
    las rachas de colores de p63:B282 y p63:B620 (16 lineas por sprite), que
    colores_e900 (p12:7B73) pasa a 0xDA00.
  Aqui se llaman los dos seguidos (p00:5DD3) con el mismo dibujo, como se ven
  en pantalla, y se pintan solo los sprites 0-7 (msx2run.V9938.sprites).

El dibujo es 0xCB01 (p12:76CB, 15) y lo que elige dentro, segun las tablas de
p63 que lee cada uno (su tamano es lo que hay hasta la siguiente):
  0, 1, 2   direccion 1-4 (0xCB0E) y paso 0-2 (0xCB14): p63:B1CC, 3 tablas de 12
  3         0xCB17 = 9-0x0C (la direccion + 8, p03:A5C2): p63:B26A, 4
  4         0xCB17 = 5-8 (la vuelta, la direccion + 4, p03:A3B7) y 0x0D-0x10
            (p02:98AB lo mueve 8): p63:B25A, 8
  5, 6      la vuelta (date_la_vuelta p02:93BC: el dibujo + 5, 0xCB17 = 5 - la
            direccion = 1-4) del dibujo 0 en el estado 0 y del 1 en el 1
            (estado_de_snake p02:9915: [estado][dibujo][marcha]); los colores de
            p63:B1D2 por el estado, 3 tablas de 4
  7         la vuelta del dibujo 2 en el estado 0x0B (gateando, solo arriba y
            abajo, p02:9A3C): 0xCB17 = 3-4, p63:B25A. SIN COTEJO: sus patrones
            (las lineas 0xF2-0xF3) son de Snake tumbado de lado y salen partidos
            con los sprites en vertical (p12:7911); no se ha visto en el juego
  8         direccion 1-4 y 0xCB17 = 1 (p63:B272) u otro (p63:B26A), 4 y 4
  9         direccion y paso: p63:B27A, 4
  0x0A      direccion y paso, chocando o no (0xCB0F): p63:B242, 12
  0x0B      uno, con sus colores fijos (p12:7AE5)
  0x0C      0xCB17 = 1-4 y paso: p63:B242
  0x0D      ninguno: los sprites fuera
  0x0E      0xCB4A = 0-4: p63:B1D8, 5 (la llegada, p11:A090)
Se pintan en la sala 0 de la zona 0 (su paleta, cotejada con openMSX).

Cotejo: `snake.py juega` mueve a Snake con el mando (0xCA08/0xCA07, como
lee_mando_y_teclas p06:B0AD) cuadro a cuadro por el bucle (p01:741A): andar,
golpe, disparos, arrastrarse; cada dibujo que sale tiene que estar entre los
del barrido.

Uso: snake.py barre   -> work/snake/NNN_dDD.png y work/snake/snake.json
     snake.py juega   -> cuantos dibujos salen jugando y si estan todos en el barrido
"""
import hashlib
import json
import os
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)
RAIZ = os.path.join(AQUI, "..")
SAL = os.path.join(RAIZ, "work", "snake")
ROSA = (255, 0, 255)                 # el fondo, transparente al guardar


def maquina():
    import mapas
    from mg2run import Mg2
    m = Mg2()
    m.partida_nueva()                  # la partida nueva
    m.pon(0xCADF, 0)                 # sin la llegada (p06:A0F5)
    mapas.entra_en_zona(m, 0)
    mapas.cuadros(m, 1)
    return m


def foto(m):
    return bytes(m.mem), bytes(m.vdp.vram), bytes(m.vdp.r), list(m.vdp.pal)


def vuelve(m, f):
    m.mem[:] = f[0]
    m.vdp.vram[:] = f[1]
    m.vdp.r[:] = f[2]
    m.vdp.pal = list(f[3])


def pinta(m):
    """Los sprites 0-7 de 0xDA00/0xDC00 con los patrones de la VRAM, recortados
    alrededor del sitio de Snake (0xCB03, 0xCB05): (imagen, caja) o None."""
    from PIL import Image, ImageChops
    v = m.vdp
    attr = ((v.r[11] & 3) << 15) | ((v.r[5] & 0xFC) << 7)
    viejo = bytes(v.vram[attr - 0x200:attr + 0x80])
    v.vram[attr - 0x200:attr + 0x80] = m.mem[0xDA00:0xDC80]
    for n in range(8, 32):
        v.vram[attr + 4 * n] = 0xE0
    im = Image.new("RGB", (256, 212), ROSA)    # las 212 lineas: 0xE0 queda fuera
    v.sprites(im)
    v.vram[attr - 0x200:attr + 0x80] = viejo
    y, x = m.mem[0xCB03], m.mem[0xCB05]
    grande = Image.new("RGB", (256 + 128, 256 + 128), ROSA)    # sin salirse al recortar
    grande.paste(im, (64, 64))
    im = grande.crop((x + 32, y + 16, x + 96, y + 88))
    caja = ImageChops.difference(im, Image.new("RGB", im.size, ROSA)).getbbox()
    if not caja:
        return None
    return im.crop(caja), caja


def clave(im):
    return hashlib.md5(im.tobytes() + str(im.size).encode()).hexdigest()


def casos():
    """(dibujo, {direccion de RAM: valor}) de cada dibujo, con los rangos de arriba."""
    for dib in (0, 1, 2):
        for d in (1, 2, 3, 4):
            for p in (0, 1, 2):
                yield dib, {0xCB0E: d, 0xCB14: p}
    for s in range(9, 13):
        yield 3, {0xCB0E: s - 8, 0xCB17: s}
    for s in list(range(5, 9)) + list(range(0x0D, 0x11)):
        yield 4, {0xCB16: 1, 0xCB17: s}
    for dib, e in ((5, 0), (6, 1)):
        for s in (1, 2, 3, 4):
            yield dib, {0xCB00: e, 0xCB17: s}
    for s in (3, 4):
        yield 7, {0xCB00: 0x0B, 0xCB17: s}
    for d in (1, 2, 3, 4):
        for s in (1, 2):
            yield 8, {0xCB0E: d, 0xCB17: s}
    for dib in (9, 0x0A):
        for d in (1, 2, 3, 4):
            for p in (0, 1, 2):
                for ch in ((0, 1) if dib == 0x0A else (0,)):
                    yield dib, {0xCB0E: d, 0xCB14: p, 0xCB0F: ch}
    yield 0x0B, {0xCB0E: 2}
    for s in (1, 2, 3, 4):
        for p in (0, 1, 2):
            yield 0x0C, {0xCB17: s, 0xCB14: p}
    for k in range(5):
        yield 0x0E, {0xCB4A: k}


def transparente(im):
    im = im.convert("RGBA")
    im.putdata([(0, 0, 0, 0) if p[:3] == ROSA else p for p in im.getdata()])
    return im


def barre():
    m = maquina()
    base = foto(m)
    vistos = {}
    for dib, ram in casos():
        vuelve(m, base)
        for a in (0xCB00, 0xCB16, 0xCB0F):
            m.pon(a, 0)
        m.pon(0xCB01, dib)
        m.pon(0xCB03, 0x80)
        m.pon(0xCB05, 0x80)
        for a, x in ram.items():
            m.pon(a, x)
        m.llama(0x5DD3)
        r = pinta(m)
        if r is None:
            continue
        im, caja = r
        k = clave(im)
        if k not in vistos:
            vistos[k] = {"dibujo": dib, "ram": {"%04X" % a: x for a, x in ram.items()},
                         "dy": caja[1] - 48, "dx": caja[0] - 32, "im": im}
    os.makedirs(SAL, exist_ok=True)
    for f in os.listdir(SAL):
        os.remove(os.path.join(SAL, f))
    lista = []
    for i, (k, c) in enumerate(vistos.items()):
        nombre = "%03d_d%02X.png" % (i, c["dibujo"])
        transparente(c.pop("im")).save(os.path.join(SAL, nombre))
        c["fichero"] = nombre
        c["md5"] = k
        lista.append(c)
    json.dump(lista, open(os.path.join(SAL, "snake.json"), "w"), indent=0)
    print(len(lista), "dibujos distintos")
    return lista


ARR, ABA, IZQ, DER, B1, B2 = 1, 2, 4, 8, 16, 32


def juega():
    m = maquina()
    vistos = {}
    visto_estado = set()
    antes = [0]

    def cuadro(teclas):
        m.pon(0xCA08, teclas)
        m.pon(0xCA07, teclas & ~antes[0])
        antes[0] = teclas
        m.bancos_123()
        m.llama(0x741A)
        f = foto(m)
        m.pon(0xCB03, 0x80)          # en el centro: sin cortar por los bordes
        m.pon(0xCB05, 0x80)
        m.llama(0x5DD3)
        r = pinta(m)
        estado = tuple(m.mem[a] for a in (0xCB00, 0xCB01, 0xCB0E, 0xCB14, 0xCB16, 0xCB17))
        vuelve(m, f)
        if r:
            vistos.setdefault(clave(r[0]), (estado, r[0]))
            visto_estado.add(estado[:2])

    def pulsa(seq):
        for teclas, n in seq:
            for _ in range(n):
                cuadro(teclas)
    for d in (ARR, IZQ, ABA, DER):
        pulsa([(d, 12), (0, 4)])
    for d in (ARR, IZQ, ABA, DER):
        pulsa([(d, 2), (0, 2), (B1, 1), (0, 12), (B1, 20), (B1 | d, 12), (0, 6)])
    for d in (ARR, IZQ, ABA, DER):
        pulsa([(d, 2), (0, 2), (B2, 1), (0, 20)])
    pulsa([(B2 | B1, 1), (B2, 3), (0, 30)])
    for d in (ARR, IZQ, ABA, DER, ARR):
        pulsa([(d, 16)])
    pulsa([(B1, 1), (0, 30)])
    # la vuelta: solo con la direccion contraria recien pulsada (p02:93A0)
    for d, c in ((ARR, ABA), (ABA, ARR), (IZQ, DER), (DER, IZQ)):
        pulsa([(d, 6), (c, 6), (0, 4)])
    pulsa([(B2 | B1, 1), (B2, 3), (0, 10)])     # arrastrandose
    for d, c in ((ARR, ABA), (ABA, ARR), (IZQ, DER), (DER, IZQ)):
        pulsa([(d, 6), (c, 6), (0, 4)])
    # con la caja (0xCB21 = 0x0A, estado 0x0A) y con 0x0B (estado 9): estado_que_toca (p02:98BF)
    for cosa in (0x0A, 0x0B):
        m.pon(0xCB21, cosa)
        m.bancos_123()
        m.llama(0x98BF)
        for d in (ARR, IZQ, ABA, DER):
            pulsa([(d, 12), (0, 4)])
        for d, c in ((ARR, ABA), (IZQ, DER)):
            pulsa([(d, 6), (c, 6), (0, 4)])
    barrido = {c["md5"] for c in json.load(open(os.path.join(SAL, "snake.json")))}
    fuera = [(e, im) for k, (e, im) in vistos.items() if k not in barrido]
    print("estado y dibujo jugando:", " ".join("%02X/%02X" % e for e in sorted(visto_estado)))
    print(len(vistos), "dibujos jugando;", len(vistos) - len(fuera), "estan en el barrido")
    os.makedirs(os.path.join(RAIZ, "work", "snake_fuera"), exist_ok=True)
    for i, (e, im) in enumerate(fuera):
        print("  fuera: estado %02X dibujo %02X dir %d paso %d vuelta %d cb17 %02X" % e)
        im.save(os.path.join(RAIZ, "work", "snake_fuera", "%02d.png" % i))
    return not fuera


# Las acciones de Snake para la web, jugadas con el mando emulado: (nombre,
# preparacion, teclas). La preparacion pone lo elegido (0xCB21 en F3, 0xCB20 en
# F2) y llama a estado_que_toca (p02:98BF), como al salir del menu.
ACCIONES = [
    ("andar", {}, [(ARR, 16), (IZQ, 16), (ABA, 16), (DER, 16), (0, 4)]),
    # el golpe es el disparo 2 (estado_0 p03:A290 -> disparo_2 p03:A360: el
    # estado 3, 0xCB17 = la direccion + 8); el 1 usa el arma (p03:A56C)
    ("golpe", {}, sum(([(d, 2), (0, 2), (B2, 1), (0, 10)] for d in (ARR, IZQ, ABA, DER)), [])),
    ("arrastrarse", {}, [(B2 | B1, 1), (B2, 3), (0, 6), (ARR, 16), (IZQ, 16), (ABA, 16),
                         (DER, 16), (0, 4)]),
    ("pistola", {0xCB20: 1, 0xD600: 1, 0xD601: 0x99}, sum(([(d, 2), (0, 2), (B1, 1), (0, 8),
                                                            (B1, 1), (0, 8)]
                                                           for d in (ARR, IZQ, ABA, DER)), [])),
    ("caja", {0xCB21: 0x0A, 0xD65C: 1}, [(ARR, 16), (IZQ, 16), (ABA, 16), (DER, 16), (0, 8)]),
    ("cubo", {0xCB21: 0x0B, 0xD660: 1}, [(ARR, 16), (IZQ, 16), (ABA, 16), (DER, 16), (0, 8)]),
]


def gifs(sal):
    """Una animacion por accion: el cuadro del juego (p01:741A) con las teclas,
    la sala entera (la zona de juego, 0xC0 x 0xC0) con Snake y los enemigos, al
    ritmo del MSX. Antes era un recuadro que seguia a Snake: no se veia que se
    moviera (la caja salia de una sola imagen)."""
    import mapas
    from gif_juego import Gif
    os.makedirs(sal, exist_ok=True)
    for nombre, prepara, teclas in ACCIONES:
        m = maquina()
        # la partida empieza con el dibujo 0x0D (sin sprites) hasta que Snake
        # llega; aqui, a la vista en el centro de la sala
        for d, v in ((0xCB01, 0), (0xCB03, 0x80), (0xCB05, 0x80), (0xCB0E, 1)):
            m.pon(d, v)
        for d, v in prepara.items():
            m.pon(d, v)
        if prepara:
            m.bancos_123()
            m.llama(0x98BF)
        g, antes = Gif(), 0
        for t, n in teclas:
            for _ in range(n):
                m.pon(0xCA08, t)
                m.pon(0xCA07, t & ~antes)
                m.pon(0xCA5F, 0)                 # sin alerta: los soldados patrullan
                antes = t
                m.bancos_123()
                m.llama(0x741A)
                m.pon(0xCB03, max(0x30, min(0xB0, m.mem[0xCB03])))
                m.pon(0xCB05, max(0x30, min(0xB0, m.mem[0xCB05])))
                f = foto(m)
                m.llama(0x5DD3)                  # Snake pintado, como al empezar el cuadro siguiente
                v = m.vdp
                im = v.pagina((v.r[2] >> 5) & 3, 212)
                mapas.sprites_de_ram(v, m.mem, im, con_snake=True)
                g.pon(im.convert("RGB").crop((0, 0, 0xC0, 0xC0)))
                vuelve(m, f)
        g.guarda(os.path.join(sal, "snake_%s.gif" % nombre))


if __name__ == "__main__":
    orden = sys.argv[1] if len(sys.argv) > 1 else "barre"
    if orden == "barre":
        barre()
    elif orden == "gif":
        gifs(os.path.join(RAIZ, "work", "snake_gif"))
    elif orden == "juega":
        sys.exit(0 if juega() else 1)
