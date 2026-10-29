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
se corre el cuadro del juego (p01:728E, el de la interrupcion) cuadro a cuadro: con un mensaje abierto
(la ventana 0xD8A8, o la llamada 0xE1E8) se pulsa el disparo 1 cada 30 cuadros, para que se lea (p01:660F),
la vida de Snake (0xCA53) se deja llena (y si lo aplastan, de vuelta al
estado 0), y a los CUADROS cuadros se le quita
al jefe toda la vida con resta_a_d800 para ver como acaba. De cada cuadro se
guardan los sprites 8-31 (los 0-7 son de Snake) si son distintos de los ya
vistos, y cada 16 cuadros la pantalla entera.

Lo que sale (2026-10-28), todo con el cartucho ejecutado:
  1 zona 7: helicoptero de mosaicos y su sombra; acaba como con los misiles (paso 0x20 -> 0x2A-0x2D)
  2 zona 0x12: empieza en la sala 3 (p00:5ADF) y entra en la 8 por la puerta 8, de tipo 5
    (p15:AADF); el robot de mosaicos
    (p04:88B7, una vez, en la pagina contraria a 0xCA42); sus piezas en la pagina 2, montadas por la
    pantalla partida (R#23 por lineas, que msx2run no hace): vNNNNN.png la monta como la
    interrupcion de linea (pantalla_partida), cotejada con openMSX (tools/omsx_partida.tcl,
    coteja_partida.py: v00320 contra openMSX en el mismo paso, 224 puntos de 54272: un
    objeto lanzado y la barra de vida)
  3 zona 3: el cientifico que se transforma, sus estrellas, la muerte
  4 especial 0x29: "Running" (en katakana) en su mensaje; se queda en el mensaje del paso 0x10
  5 zona 0x13: empieza con una llamada del transceptor (antes, con p01:741A suelto, la
    pantalla del transceptor se quedaba: la cierran los pasos de p01:728E); al morir saca al 8
  6 zona 0x0E, 7 zona 0x0A: enteros. 8 zona 0x13: hasta su paso 0x11, que espera el bit 5 de
    0xD7D9 (p05:BFA0) para lo de despues (Snake al estado 0x17, el mensaje 0x1718)
  9 zona 0x12: "FOX" en su conversacion; sus pasos 5-0x10 esperan sucesos (0xD88C, salas
    2 y 3): se ven los de antes y los del final
  0x0A zona 0x12: el paso 0 espera 0xD6B0: solo se ve desde que se le quita la vida
  0x0B zona 0x0B: cuatro a la vez dentro del ascensor de la entrada 5, en la planta 0x13
    (p07:A248 -> 0xD8A0 = 1 -> p05:AA90 y la escena de 0xD8AC, p05:AB08); arden al morir

Uso: jefes.py TIPO [cuadros]  -> work/jefes/tTT/sNNNN.png (sprites), pNNNN.png (pantalla),
     vNNNN.png (la pantalla partida montada, con 0xCA1C)
"""
import hashlib
import os
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)
from gif_juego import Gif   # noqa: E402
RAIZ = os.path.join(AQUI, "..")
ROM = open(os.path.join(RAIZ, "metalgear2.rom"), "rb").read()
ROSA = (255, 0, 255)

# las filas de p56 que lee fichas_d800_de_la_zona (p12:6C2C-6C8D): zona y direccion
FILAS = {3: 0xA19B, 1: 0xA1A1, 4: 0xA1D2, 7: 0xA1AD, 6: 0xA1A7, 2: 0xA1B3,
         9: 0xA1BF, 0x0A: 0xA1C5, 5: 0xA1B9, 8: 0xA1CB}
ZONA = {3: 3, 1: 7, 4: 7, 7: 0x0A, 6: 0x0E, 2: 0x12, 9: 0x12, 0x0A: 0x12, 5: 0x13, 8: 0x13}
# donde espera a Snake el primer paso de cada tipo (Y, X), leido en su logica
SITIO_DE_SNAKE = {3: (0x60, 0x7C), 6: (0xA0, 0x60)}   # el 6: Snake a la vista, abajo en el centro


def b56(d):
    return ROM[56 * 0x2000 + d - 0xA000]


def ficha(tipo):
    if tipo == 0x0B:
        # el ascensor de la entrada 5 (p07:AA83, la ficha 16: zona 0x0B, sala 7,
        # Y 0x88, X 0x48 y 7F 20 A8): al pasar por la planta 0x13 con 0xD658 el
        # paso 0x0F (p07:A248), que pone 0xD8A0 = 1 (p07:A346): las cuatro
        # fichas de tipo 0x0B (p05:AA90) y la escena de 0xD8AC (p05:AB08)
        return {"zona": 0x0B, "sala": 7, "ascensor": (5, 0x88, 0x48, 0x7F, 0x20, 0xA8)}
    a = FILAS[tipo]
    t, y, x, f, c, vida = (b56(a + i) for i in range(6))
    assert t == tipo
    r = {"zona": ZONA[tipo], "y": y, "x": x, "fila": f, "columna": c, "vida": vida}
    if tipo == 4:                             # la ficha 0xD860: su byte 0x12 (p56:A1D1) es la especial
        r["especial"] = b56(0xA1D1)
    return r


def maquina(f):
    import mapas
    from mg2run import Mg2
    m = Mg2()
    m.partida_nueva()
    m.pon(0xCADF, 0)
    z = f["zona"]
    m.pon(0xD430, 2 if z == 7 else 0)
    if f.get("especial"):
        m.pon(0xD7D1, m.mem[0xD7D1] | 2)      # sin el bit 1, la ficha 0xD860 libre (p12:6C44)
    mapas.entra_en_zona(m, z)
    if f.get("especial"):
        # la especial, como mapas.pinta_especiales (p15:AB4F)
        e = f["especial"]
        mapas.luces(m)
        m.pon(0xCA76, e)
        m.pon(0xCA50, f["fila"])
        m.pon(0xCA51, f["columna"])
        for d in (0x7BAA, 0x804E, 0x804E, 0x5CAE):
            m.bancos_123()
            m.llama(d)
        for d in (0xD44C, 0xD44D, 0xD44E, 0xE070, 0xE078):
            m.pon(d, 0)
        for d in (0x5F0A, 0x8D2A, 0x55CF, 0x5F01):
            m.bancos_123()
            m.llama(d)
        for d, v in ((0xCA40, 1), (0xCB00, 0), (0xCA00, 5), (0xCA01, 0), (0xCA97, 0), (0xD8A8, 0)):
            m.pon(d, v)
        return m
    if f.get("ascensor"):
        g = {v: k for k, v in mapas.rejilla(z).items()}
        a_la_sala(m, g[f["sala"]] >> 4, g[f["sala"]] & 15)
        n, y, x, a, b, c = f["ascensor"]
        for d, v in ((0xD8C2, n), (0xD8CF, y), (0xD8D0, x), (0xD8C6, a), (0xD8C7, b), (0xD8C8, c), (0xD658, 1)):
            m.pon(d, v)
        m.pon_banco(0xA000, 7)
        m.mem[0xC383] = 7
        m.llama(0xA40D)                       # snake_entra_en_d8c0: Snake dentro
        # bajando, en la planta 0x13: el paso 0x0F con su cuenta (p07:A266)
        for d, v in ((0xD8CD, 0x13), (0xD8C4, 2), (0xD8C1, 0x0F), (0xD8C3, 0x10)):
            m.pon(d, v)
        return m
    if z == 0x12 and m.mem[0xD881] != 0xFF:
        # en la zona 0x12 el juego mismo pone a Snake en la sala 3 (0xCA50 = 2,
        # 0xCA51 = 9, p00:5ADF): ahi corren los pasos 0-2 del 2 y el 3 lo
        # espera en la sala 8, a la que se entra por la puerta 8 (pelea). Llevarlo
        # derecho a la 8 pinta el robot en la pagina que no es: pantalla_de_d800
        # (p04:88B7) lo monta una sola vez (0xD8A6) en la otra (0xCA42 ^ 1) y
        # copia la pagina 1 a la 2
        a_la_sala(m, m.mem[0xCA50], m.mem[0xCA51])
        return m
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


def sala_por_arriba(m, fila, col):
    """Snake a la sala (fila, col) por el camino del juego: sale por arriba y la
    fila sube (p02:8117), como tools/omsx_salas.tcl. a_la_sala, en una especial,
    pintaba la sala de la zona normal."""
    m.pon(0xCA50, (fila - 1) & 0xFF)
    m.pon(0xCA51, col)
    m.pon(0xCB03, 0xBF)
    m.pon(0xCA41, 1)
    for _ in range(40):
        m.bancos_123()
        m.llama(0x728E)
        if not m.mem[0xCA41] and m.mem[0xCA01] == 0:
            break


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


def pantalla_partida(v, mem):
    """La pantalla como la parte la interrupcion de linea con 0xCA1C (p03:A041-A0B4):
    arriba la pagina 0 (R#2 = 0x1F) con sprites y el desplazamiento R#23 de su copia
    0xFFF6 (r23_de_d8a5, p10:AAA9: 0xD8A5; en los pasos 2-4 de la partida, 0); la
    interrupcion en la linea R#19 = 0xB4 + el desplazamiento (en los pasos 2-4, 0xBC)
    y, pasado el borde (HR), abajo la pagina 1 sin sprites y R#23 = 0. Las lineas de
    la VRAM: la del aparato es R#19 - R#23 (como openMSX) y el cambio, la siguiente.
    Los sprites, de la tabla que el juego ha subido (la Y ya con + 0xD8A5, p01:6880),
    se mueven con R#23 como el fondo."""
    from PIL import Image
    d = mem[0xFFF6]
    b = d
    if 2 <= mem[0xCA01] <= 4:
        d, b = 0, 8
    corte = ((0xB4 + b - d) & 0xFF) + 1
    arriba = v.pagina(0, 256)
    v.sprites(arriba)
    abajo = v.pagina(1, 212)
    im = Image.new("RGB", (256, 212))
    for y in range(212):
        if y < corte:
            im.paste(arriba.crop((0, (y + d) & 0xFF, 256, ((y + d) & 0xFF) + 1)), (0, y))
        else:
            im.paste(abajo.crop((0, y, 256, y + 1)), (0, y))
    return im


TOPE_GIF = 4000                                 # imagenes distintas por pelea, como mucho


def pelea(tipo, cuadros=600):
    """Deja tambien work/jefes/pelea_TT.gif, la pelea entera al ritmo del MSX.
    La pelea de la ficha de tipo; si al morir aparece otra (2 -> 9 -> 0x0A
    en la zona 0x12, 5 -> 8 en la 0x13: quita_d800 p04:8C23-8C2D, p04:8CFB),
    se sigue con ella. Los dibujos van a la carpeta del tipo que esta vivo."""
    import mapas
    f = ficha(tipo)
    m = maquina(f)
    if m.mem[0xCB01] == 0x0D:
        # la partida empieza con Snake en el dibujo 0x0D (sin sprites) hasta su
        # llegada, que aqui no hay: a la vista, como al acabar la llegada
        m.pon(0xCB01, 0)
        m.pon(0xCB0E, 1)
    raiz = os.path.join(RAIZ, "work", "jefes")
    if tipo in SITIO_DE_SNAKE:
        m.pon(0xCB03, SITIO_DE_SNAKE[tipo][0])
        m.pon(0xCB05, SITIO_DE_SNAKE[tipo][1])
    vistos, antes, antes_f, pasos = set(), 0, 0, []
    vivo, desde, fin, desde24, desde_ini = None, 0, None, -1, 0
    gif = None                                  # la pelea entera, al ritmo del MSX (gif_juego.py)
    for k in range(14000):                       # la cadena 2 -> 9 -> 0x0A pasa de 9000
        # el tipo vivo: la primera ficha ocupada de las 3 de las salas normales
        # (en las especiales, solo la de 0xD860: fichas_d800 p04:89E8)
        fichas = [0xD860] if m.mem[0xCA76] else [0xD800, 0xD820, 0xD840]
        ahora = next((d for d in fichas if m.mem[d]), None)
        t = m.mem[ahora] if ahora else None
        if t != vivo:
            if gif is not None:
                gif.guarda(os.path.join(raiz, "pelea_%02X.gif" % vivo), tope_ms=4000)
            gif = Gif() if t else None
            vivo, ix, desde = t, ahora, k
            desde_ini = k
            if t == 0x0A:
                # BIG BOSS: su paso 0 espera 0xD6B0 (p05:B5B5), que solo pone
                # zona_12_con_d889 (p14:B104), por donde el juego vuelve a la
                # zona 0x12 tras GREY FOX: Snake sin nada de lo que lleva,
                # 0xD8A9 = 0xD6B0 = 1 y en la fila 2 columna 8 mirando a la
                # izquierda; el paso 2 le espera en la sala 1 (p05:B5E3), la de
                # la izquierda: aqui se le pone ya en ella, entrando por la derecha
                for d in range(0xD600, 0xD700):
                    m.pon(d, 0)
                for d in range(0xD7F0, 0xD800):
                    m.pon(d, 0)
                m.pon(0xD8A9, 1)
                m.pon(0xD6B0, 1)
                # sin nada elegido (como p04:8CDA) y sin arder: 0xCB4B pone la llama
                # sobre Snake (sprites_del_puesto, p12:7DA0); le queda de la pelea
                # de antes y el CONTINUE del juego lo borra (en openMSX no esta)
                for d in (0xCB20, 0xCB21, 0xCB4B, 0xCB4C, 0xCB4D):
                    m.pon(d, 0)
                # y la ficha como la deja p14:B11E: en 0xD840, solo el tipo
                # (cotejado con openMSX: tools/omsx_bigboss.tcl, por CONTINUE)
                for d in range(0xD800, 0xD880):
                    m.pon(d, 0)
                # el tipo lo pone p14:B11E y, al entrar en la zona, el resto sale
                # de su fila de p56 (fichas_d800_de_la_zona): [tipo][Y][X][fila]
                # [columna][vida] a los bytes 0, 3, 5, 0x0A, 0x0B y 0x10 (asi en openMSX)
                fila = [ROM[56 * 0x2000 + FILAS[0x0A] - 0xA000 + i] for i in range(6)]
                for o, v in zip((0, 3, 5, 0x0A, 0x0B, 0x10), fila):
                    m.pon(0xD840 + o, v)
                ix = 0xD840
                a_la_sala(m, 2, 7)
                m.pon(0xCB03, 0x68)
                m.pon(0xCB05, 0xB0)
                m.pon(0xCB0E, 3)
            elif t and t != 2 and (m.mem[ix + 0x0A], m.mem[ix + 0x0B]) != (m.mem[0xCA50], m.mem[0xCA51]):
                a_la_sala(m, m.mem[ix + 0x0A], m.mem[ix + 0x0B])   # la nueva esta en otra sala
            if t:
                sal = os.path.join(raiz, "t%02X" % t)
                os.makedirs(sal, exist_ok=True)
                for x in os.listdir(sal):
                    os.remove(os.path.join(sal, x))
            elif fin is None:
                fin = k + 120                  # sin ninguna: un rato mas y se acaba
                if os.environ.get("TRAZA_JEFE"):
                    print(k, "sin ficha: CA76 %02X D800 %s CA4A %02X CA4B %02X" % (
                        m.mem[0xCA76], bytes(m.mem[0xD800:0xD880:0x20]).hex(), m.mem[0xCA4A], m.mem[0xCA4B]),
                        flush=True)
        if fin is not None and k >= fin:
            break
        # un mensaje (0xD8A8) o una llamada (0xE1E8, p03:B11F): el disparo 1
        # (0xE221, el paso del mensaje, se queda a 3 tras acabarlo: la ventana es 0xD8A8)
        mensaje = m.mem[0xD8A8] or m.mem[0xE1E8]
        # (0xE221 no: se queda a 3 en peleas enteras, la de RUNNING MAN)
        if vivo and (m.mem[0xD8A8] or m.mem[0xE1E8] or m.mem[0xCA97]) and desde < 10 ** 9                 and desde - desde_ini < 1500:
            # (como mucho 1500: en la pelea de GREY FOX 0xD8A8 se queda puesto)
            # los cuadros con un mensaje o una llamada abiertos no cuentan para
            # quitarle la vida: con la llamada de Holly abierta, Pettrovich moria
            # sin que se viera la pelea
            desde += 1
        # cada 30 cuadros (2,5 s en el MSX): antes, un cuadro si y otro no, y el
        # mensaje se pasaba sin llegar a escribirse (ventanas vacias en los GIF)
        # para pulsar si vale 0xE221 (el paso del mensaje): la charla final de GREY
        # FOX (p05:BC4A) no abre 0xD8A8; en la pelea de RUNNING MAN se queda a 3 y
        # Snake dispara cada 30 cuadros
        teclas = 0x10 if (mensaje or m.mem[0xE221]) and k % 30 == 0 else 0
        m.pon(0xCA08, teclas)
        m.pon(0xCA07, teclas & ~antes)
        antes = teclas
        # una llamada del transceptor (0xCA97): RETURN, un cuadro si y otro no
        funcion = 0x20 if (m.mem[0xCA97] or m.mem[0xE1E8]) and k % 30 == 15 else 0
        m.pon(0xCA0A, funcion)
        m.pon(0xCA09, funcion & ~antes_f)
        antes_f = funcion
        if vivo == 0x0A and m.mem[ix + 1] == 4 and m.mem[0xCA4B] != 6:
            # su paso 4 (d8a9_en_sala_6, p05:B608) espera a Snake en la sala 6:
            # entra ahi, y alli llegan BIG BOSS, los mensajes y la pelea
            a_la_sala(m, 3, 7)
            m.pon(0xCB03, 0x9F)                 # entrando por abajo, como en openMSX
            m.pon(0xCB05, 0x58)
            m.pon(0xCB0E, 1)
            desde = 10 ** 9                     # la vida, cuando empiece a buscarle
        if vivo == 0x0A and m.mem[ix + 1] == 6 and not os.path.exists(os.path.join(raiz, "mi_0A_paso6.ram")):
            # para cotejar con openMSX (work/omsx_bigboss, el volcado del paso 6)
            open(os.path.join(raiz, "mi_0A_paso6.ram"), "wb").write(bytes(m.mem))
            open(os.path.join(raiz, "mi_0A_paso6.vram"), "wb").write(bytes(m.vdp.vram))
        if vivo == 0x0A and m.mem[ix + 1] >= 8 and desde == 10 ** 9:
            desde = k                           # d8a9_busca (paso 8): la pelea
        if vivo and k == desde + cuadros and m.mem[ix + 0x10]:
            # el final: los tipos 1 y 2 vuelven al paso 0 con resta_a_d800
            # (p07:B521) y acaban por lo suyo: el 1 con los misiles (vida a
            # cero: el paso 0x20, p06:A065-A072), el 2 con las fichas de
            # 0xDF80 (a cero: el paso 0x0A, p07:BF14-BF1C)
            if vivo == 0x0B:                    # las cuatro a la vez
                for d in (0xD800, 0xD820, 0xD840, 0xD860):
                    if m.mem[d] == 0x0B and m.mem[d + 0x10]:
                        m.pon_banco(0xA000, 7)
                        m.mem[0xC383] = 7
                        m.llama(0xB471, ix=d, c=m.mem[d + 0x10])
            elif vivo in (1, 2):
                m.pon(ix + 0x10, 0)
                m.pon(ix + 1, 0x20 if vivo == 1 else 0x0A)
            else:
                m.pon_banco(0xA000, 7)
                m.mem[0xC383] = 7
                m.llama(0xB471, ix=ix, c=m.mem[ix + 0x10])   # resta_a_d800: sin vida
        if vivo == 2 and m.mem[ix + 1] == 3 and m.mem[0xCA4B] != 8 and not m.mem[0xD570] and k % 20 == 0:
            # el 3 espera en la sala 8 con 0xD8A4: se entra por la puerta 8 de la
            # sala 3, de tipo 5 (tipo_cruzado_5, p15:AADF: 0xD8A4 = 1, la pagina 1,
            # la pantalla partida, R#0 = 0x16); cruzada como tools/omsx_salas.tcl
            # (la ficha libre 0xD570 en el estado 3, p15:A9AB) pero con su tipo
            m.pon(0xD570, 5)
            m.pon(0xD571, 3)
            m.pon(0xD575, 8)
        if os.environ.get("TRAZA_JEFE") and vivo and k % 25 == 0 and k >= desde + cuadros:
            print(k, "paso %02X D8A8 %02X E221 %02X snake %02X,%02X jefe %02X,%02X sala jefe %02X,%02X snake %02X,%02X" % (
                m.mem[ix + 1], m.mem[0xD8A8], m.mem[0xE221], m.mem[0xCB03], m.mem[0xCB05], m.mem[ix + 3],
                m.mem[ix + 5], m.mem[ix + 0x0A], m.mem[ix + 0x0B], m.mem[0xCA50], m.mem[0xCA51]), flush=True)
        if vivo == 4 and m.mem[ix + 1] == 0x10 and m.mem[0xD8A8] == 0:
            # RUNNING MAN rendido (paso 0x10, p05:AF59) espera a que Snake se le
            # acerque (0x20 en X; en Y, de 0x28 por encima a 0x28 por debajo) para
            # decir su mensaje (0x610) y acabar (pasos 0x11, 0x12 -> 0x20): aqui
            # Snake va a su sala y a su lado, como iria el jugador. A la sala, por
            # el camino del juego (sale por arriba: la fila sube, p02:8117), no con
            # a_la_sala: en la especial 0x29 pintaba la sala de la zona normal
            if (m.mem[ix + 0x0A], m.mem[ix + 0x0B]) != (m.mem[0xCA50], m.mem[0xCA51]):
                sala_por_arriba(m, m.mem[ix + 0x0A], m.mem[ix + 0x0B])
            m.pon(0xCB03, m.mem[ix + 3])
            m.pon(0xCB05, min(0xB0, m.mem[ix + 5] + 0x18))
            m.pon(0xCB0E, 3)
        if vivo == 8 and m.mem[ix + 1] == 0x11 and not m.mem[0xD7D9] & 0x20 and m.mem[0xD8A8] == 0:
            # Pettrovich (paso 0x11, p05:BFA0) espera el bit 5 de 0xD7D9, que pone
            # coger la cosa 0x2D (bandera_por_cosa p10:A68C): el cartucho de Marv
            # (casilla 0x1F de F3, ficha 0xD6B0). Aqui, cogido como al abrir la taquilla
            m.pon(0xD6B0, 1)
            m.pon(0xD7D9, m.mem[0xD7D9] | 0x20)
        if os.environ.get("TRAZA_JEFE") and vivo == 9 and m.mem[ix + 1] in (5, 6) and k % 20 == 0:
            print(k, "fox %02X D8A8 %02X E1E8 %02X D88C %02X sala %02X CB4B %02X CA97 %02X D600 %s" % (
                m.mem[ix + 1], m.mem[0xD8A8], m.mem[0xE1E8], m.mem[0xD88C], m.mem[0xCA4B], m.mem[0xCB4B],
                m.mem[0xCA97], bytes(m.mem[0xD600:0xD610]).hex()), flush=True)
        if vivo == 9 and m.mem[ix + 1] == 5 and not m.mem[0xD8A8] and not m.mem[0xE1E8]:
            # GREY FOX, paso 5 (p05:B9F3): espera 0xD88C = 0xFF y a Snake en la sala 3.
            # 0xD88C lo pone el juego (cb4b_sin_cosas, p10:BBDD, al abrir F2 o F3) cuando
            # Snake, ardiendo, ya no lleva ninguna de las 0x31 cosas: aqui se tiran todas,
            # se mira como al abrir el menu, y a la sala 3
            if m.mem[0xD88C] != 0xFF:
                for d in range(0xD600, 0xD600 + 4 * 0x31):
                    m.pon(d, 0)
                m.pon(0xCB20, 0)
                m.pon(0xCB21, 0)
                m.pon_banco(0xA000, 10)             # lo que mira el juego al abrir F2 o F3 (p10:AED9, AF33)
                m.mem[0xC383] = 10
                m.llama(0xBBDD)
                m.bancos_123()
            elif m.mem[0xCA4B] != 3:
                sala_por_arriba(m, 2, 9)
        if vivo == 9 and m.mem[ix + 1] == 6 and m.mem[0xCA4B] != 2:
            sala_por_arriba(m, 2, 8)                # el paso 6 (p05:BA0C) le espera en la sala 2
        if vivo == 9 and not m.mem[0xD8AA] and k == desde + 30:
            m.pon(0xD8AA, 1)                    # como p14:B0BA (y p01:73C8): sin el, el 9 espera
        if vivo and m.mem[ix + 1] == 0x24 and k == desde24 + 60:
            # el paso 0x24 espera a Snake en otra sala (p04:8BB6); aqui se sigue
            m.pon(ix + 1, 0x25)
        m.bancos_123()
        m.llama(0x728E)                       # el cuadro entero, como la interrupcion (p03:A13F)
        m.pon(0xCA53, 0x20)
        if m.mem[0xCB00] == 0x14:
            # Snake aplastado (el 2: dentro de su forma, p07:BE9C -> p03:AC02) o
            # sin vida: el paso 0 lo pasa al 0x0B (p01:745E), donde las fichas ya
            # no corren. Como con la vida, se deshace
            for d in (0xCB00, 0xCA01, 0xCB40, 0xCB41):
                m.pon(d, 0)
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
        abierto = m.mem[0xD8A8] or m.mem[0xE1E8]
        if gif is not None and len(gif) < TOPE_GIF and (not abierto or k % 8 == 0):
            v = m.vdp
            if m.mem[0xCA1C]:
                im = pantalla_partida(v, m.mem)
            else:
                im = v.pagina((v.r[2] >> 5) & 3, 212)
                mapas.sprites_de_ram(v, m.mem, im, con_snake=True)
            gif.pon(im.convert("RGB").crop((0, 0, 0xC0, 0xC0)), 8 if abierto else 1)
        if k % 16 == 0:
            v = m.vdp
            im = v.pagina((v.r[2] >> 5) & 3, 212)
            mapas.sprites_de_ram(v, m.mem, im)
            im.save(os.path.join(sal, "p%05d.png" % k))
            if vivo == 2:                       # su figura, en la pagina 2
                v.pagina(2, 256).save(os.path.join(sal, "g%05d.png" % k))
            if m.mem[0xCA1C]:                   # y la pantalla partida montada
                pantalla_partida(m.vdp, m.mem).save(os.path.join(sal, "v%05d.png" % k))
    if gif is not None:
        gif.guarda(os.path.join(raiz, "pelea_%02X.gif" % vivo), tope_ms=4000)
    print("zona %02X: %s; %d dibujos distintos" % (
        f["zona"], " ".join("%d:%02X/%02X" % (k, p[0], p[1]) for k, p in pasos), len(vistos)))


if __name__ == "__main__":
    pelea(int(sys.argv[1], 16), int(sys.argv[2]) if len(sys.argv) > 2 else 600)
