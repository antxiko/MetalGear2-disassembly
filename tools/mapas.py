#!/usr/bin/env python3
"""Los mapas de Metal Gear 2: cada sala pintada por el cartucho ejecutado.

Nada se dibuja a mano. tools/mg2run.py corre el codigo del juego con un V9938
emulado y aqui solo se le dice a que sala ir, como lo hace el juego:

  - la rejilla de la zona: la lista de p30:B8A5 (p02:804E): casillas
    fila * 16 + columna, numeradas por orden hasta 0xFF; detras, parejas
    [casilla][sala] hasta 0xFF. Una sala de 0x80 o mas es un paso a la zona
    sala & 0x7F (p00:5A25): no se pinta.
  - la partida nueva (p02:9E2B) deja la maquina como al empezar.
  - la primera sala de cada zona entra por cambia_de_zona (p00:59A7, A = la
    zona) con 0xCA4A = 0x3F, para que prepare la zona entera (las piezas de
    la pagina 2, p00:5A52); las demas por entra_en_sala (p00:52CF) con la
    fila y la columna en 0xCA50-0xCA51.
  - la paleta: la partida nueva deja 0xCADF = 1 (p06:A0F5), la llegada de
    Snake: con el, paleta_de_la_sala (p02:8475) pone encima la de p14:AA44
    (los colores 4, 5, 6 y 8 a negro), que se funde hasta que el estado 0x19
    de Snake lo quita (p11:A017). Aqui se quita antes de entrar: la sala 0
    de la zona 0 sale como en openMSX a los 26-32 s (111, 222, 333).
  - el laberinto de la zona 7: en las filas 1-4, columnas 5-7, sin 0xD430 = 2
    el juego pinta la sala de p24:7AF8 y devuelve a Snake a la sala 0 por el
    camino malo (p00:52F0, p00:551D); aqui se pone 0xD430 = 2 y se pintan
    las salas de verdad.
  - la zona 0x12: sin el suceso 0xD881 (banderas de 0xD880, 0xFF = pasado)
    el juego mete a Snake en la sala (2, 9) con la entrada corta (p00:5AD9) y
    tapa las salas 2, 3 y 8 (p00:5734); aqui se pinta con 0xD881 = 0xD888 =
    0xFF, despues de esos sucesos.
  - las salas a oscuras (zona 3: la especial 0x0C y las salas 0, 5 y 0x10;
    zona 4: las 5, 0x0E y 0x13): con su bandera de 0xCAC9-0xCACD puesta el
    juego deja la pagina en negro con un solo caracter, el 0x53 (p08:A13B),
    o, con las gafas (0xCB21 = 3), la paleta de p56:BCCF. Al entrar en la
    zona 0xCACB-0xCACD valen 1 (p00:5A84). Aqui se pintan con la luz: las
    banderas a cero antes de cada sala.
  - la zona 0: al subir a la fila 3 0xCAAD pasa a 1 y a la 4 a 2 (p02:8181)
    y ya no baja; con el, las salas 0-9 llevan la paleta de p56:B9A4 o B9B7
    (p02:84AA). Se pinta la de la primera visita (filas 1-2 con 0, la 3 con
    1, la 4 con 2), la que sale en openMSX (tools/omsx_salas.tcl).
  - despues, 5 cuadros del bucle del juego (p01:741A): hay cosas que se
    pintan en la pagina cada cuadro y no al entrar (el misil de la sala 0x12
    de la zona 7); cotejado con openMSX. Si el juego deja el paso 0 o abre
    un mensaje (0xD8A8), se deshace ese cuadro.
  - las salas del gas (las ternas de p03:BAE8: zona 3 salas 1, 2 y 7; las
    demas de la zona 3 con alerta): al entrar, la tercera barra pone una
    paleta roja de p02:851E (p03:BB23) y despues la paleta parpadea
    (p03:BC29) entre la de la sala y las rojas, con el contador 0xCA03; se
    pinta la de la sala (p02:8475).
  - la sala 6 de la zona 4: sus soldados salen en una de 4 colocaciones al
    azar (p12:6A28, 0xD42D, los sitios de p56:B709).
  - el montaje: salir por arriba SUMA uno a la fila y por abajo resta
    (p02:8117, p02:814F); por la izquierda la columna uno menos (p02:8169).
    La fila 1 va abajo del todo.
  - la imagen: los 192 x 192 puntos de la sala (24 x 24 caracteres,
    p00:57AE) de la pagina que ensena el VDP (R#2).
  - los actores: son de la zona y van de sala en sala (su fila y columna en
    los bytes 0x0A-0x0B de cada ficha de 0xCE00). Se pintan como al entrar en
    la zona: la maquina va de sala en sala sin cuadros (los actores no se
    mueven) y los cuadros de cada sala se corren en una copia. Al pasar a una sala, borra_lo_de_la_sala (p01:7BAA, como sala_de_al_lado
    p02:8096) suelta los 22 sprites que se reparten (0xD400); sin eso se
    acaban. Sus sprites salen de las copias 0xDA00 (colores) y 0xDC00
    (atributos) del ultimo cuadro, con los dibujos de la VRAM (R#6), sin los
    de Snake (los 8 primeros: p01:7C7D, p11:BCD1): zZZ_sSS_spr.png.
    Los colores se ponen al repartirle los sprites (p04:81C5): los de
    p08:B9FB por el tipo, o, en la zona 3 y la 0x0A desde la fila 4 (0xD437,
    p00:4ECC), los de p08:BA2F para el tipo 1. Con alerta el tipo lleva el
    bit 7 (p12:6925, p14:B2F6) y palabra_de_tabla lo dobla en 8 bits: el 0x81
    toma los de B9FB como el 1 y no los de BA2F. Aqui no hay alerta (0xCA5F
    a 0 en todas): como openMSX sin alerta (work/omsx_difs, zona 3).

Las salas especiales (0xCA76 = 1-0x39, los interiores tras las puertas): su
rejilla en p30:BA18 y su dibujo con las piezas de la zona desde la que se
entra. La zona sale de las tablas de puertas (p15:B4B5, fichas de 3 bytes
[como y donde][fila y columna][puerta de llegada]; como = 1, una especial,
p15:A9D4). Se entra en esa zona y luego en la especial como p15:AB4F: su
rejilla a 0xD900 (p02:804E), sus mapas de bits (p00:5CAE), sus actores
(p12:69E0), las rayas de la 0x31 (p10:BCE4), entra_en_sala_especial (p00:55CF;
el juego entra por la puerta con 55D2 y la deja abierta) y p12:67E1.

Uso: mapas.py salas [zona ...]     las salas a work/salas/zZZ_sSS.png
     mapas.py especiales           las especiales a work/salas/eEE_sSS.png
     mapas.py zonas [zona ...]     las zonas montadas a work/mapas/zona_ZZ.png (y _spr)
     mapas.py montar_especiales    cada especial montada a work/mapas/especial_EE.png (y _spr)
     mapas.py rotular [zona ...]   la zona con enemigos, rotulos y sus especiales: work/mapas/web_zona_ZZ.png
"""
import copy
import json
import os
import sys
import time

AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)
RAIZ = os.path.join(AQUI, "..")
ROM = open(os.path.join(RAIZ, "metalgear2.rom"), "rb").read()
SALAS = os.path.join(RAIZ, "work", "salas")
MAPAS = os.path.join(RAIZ, "work", "mapas")
N_ZONAS = 20                       # p30:B8A5: 20 punteros hasta la primera lista
LADO = 192                         # 24 caracteres de 8 puntos


def byte(banco, d):
    return ROM[banco * 0x2000 + (d & 0x1FFF)]


def palabra(banco, d):
    return byte(banco, d) | byte(banco, d + 1) << 8


def rejilla(zona, tabla=0xB8A5):
    """{casilla: sala} de la zona, como la deja p02:804E en 0xD900."""
    p = palabra(30, tabla + 2 * zona)
    g, n = {}, 0
    while byte(30, p) != 0xFF:
        g[byte(30, p)] = n
        n += 1
        p += 1
    p += 1
    while byte(30, p) != 0xFF:
        g[byte(30, p)] = byte(30, p + 1)
        p += 2
    return g


def zona_de_especial():
    """{especial: zona} de las tablas de puertas de p15:B4B5. La de la zona 0x13
    es la ultima y no se sabe donde acaba: solo se le da la 0x39 (las demas
    que saldrian de leer de mas ya tienen zona)."""
    ptrs = [palabra(15, 0xB4B5 + 2 * z) for z in range(N_ZONAS)]
    dueno = {}
    for z, p in enumerate(ptrs[:-1]):
        fin = min([q for q in ptrs if q > p] or [p])
        for k in range((fin - p) // 3):
            a = byte(15, p + 3 * k)
            if a >> 6 == 1:
                dueno.setdefault(a & 0x3F, z)
    dueno.setdefault(0x39, 0x13)
    return dueno


def luces(m):
    """Las salas a oscuras con la luz puesta: 0xCAC9-0xCACD a cero (p08:A0FB)."""
    for d in range(0xCAC9, 0xCACE):
        m.pon(d, 0)


CUADROS = 5                        # cuadros del bucle del juego tras entrar


def cuadros(m, n=CUADROS):
    """n cuadros del juego en el paso 0 (p01:741A): lo que se pinta en la
    pagina cada cuadro y no al entrar (el rojo de la sala 7 de la zona 3, el
    misil de la sala 0x12 de la zona 7). La sala no debe cambiar."""
    antes = m.mem[0xCA4A], m.mem[0xCA4B], m.mem[0xCA76]
    # el estado 4 deja 0xCA40 = 1 tras la partida nueva (p01:739E); sin el,
    # fin_del_paso (p01:7485) pasa al estado 6 en el primer cuadro
    m.pon(0xCA40, 1)
    # Snake ya llegado: en el estado 0x19, el de la llegada, la paleta se
    # funde a negro (p11:A017); jugando vale 0 (openMSX)
    m.pon(0xCB00, 0)
    m.pon(0xCA00, 5)
    m.pon(0xCA01, 0)
    # jugando, 0xCA97 vale 0 (la partida nueva lo deja a 1 para la llamada
    # del principio, y con el el paso 0 se para en p01:7428)
    m.pon(0xCA97, 0)
    m.pon(0xD8A8, 0)
    for _ in range(n):
        copia = bytes(m.mem), bytes(m.vdp.vram), bytes(m.vdp.r), list(m.vdp.pal)
        m.bancos_123()
        m.llama(0x741A)
        if m.mem[0xCA00] != 5 or m.mem[0xCA01] or m.mem[0xD8A8]:
            # otro paso, o un mensaje que se abre (0xD8A8, la ventana; las
            # salas 0x10 y 0x11 de la zona 0x0A): el cuadro de antes
            m.mem[:] = copia[0]
            m.vdp.vram[:] = copia[1]
            m.vdp.r[:] = copia[2]
            m.vdp.pal = copia[3]
            break
    if m.mem[0xDFF0]:
        # la tercera barra: la paleta de la sala, como paleta_parpadea
        # (p03:BC35) con el contador en 0 (empieza_tercera_barra la deja roja)
        m.bancos_123()
        m.llama(0x8475)
    assert (m.mem[0xCA4A], m.mem[0xCA4B], m.mem[0xCA76]) == antes, (antes, m.mem[0xCA4A], m.mem[0xCA4B])


SNAKE = 8                          # los sprites 0-7 son de Snake


def con_sprites(m, im):
    """im con los sprites del ultimo cuadro encima, salvo los de Snake."""
    return sprites_de_ram(m.vdp, m.mem, im)


def sprites_de_ram(v, mem, im):
    """Las copias 0xDA00 y 0xDC00 de mem puestas en la tabla de la VRAM que
    se ve (R#5, R#11) y pintadas como el chip (msx2run.V9938.sprites), sin
    los 8 primeros (Snake). Vale para un volcado de openMSX."""
    attr = ((v.r[11] & 3) << 15) | ((v.r[5] & 0xFC) << 7)
    viejo = bytes(v.vram[attr - 0x200:attr + 0x80])
    v.vram[attr - 0x200:attr + 0x80] = mem[0xDA00:0xDC80]
    for n in range(SNAKE):
        v.vram[attr + 4 * n] = 0xE0
    v.sprites(im)
    v.vram[attr - 0x200:attr + 0x80] = viejo
    return im


def actores_aqui(m):
    """Los actores de la sala de ahora: [numero, tipo, Y, X]."""
    f, c = m.mem[0xCA50], m.mem[0xCA51]
    return [[k, m.mem[0xCE00 + 0x40 * k], m.mem[0xCE03 + 0x40 * k], m.mem[0xCE05 + 0x40 * k]]
            for k in range(24) if m.mem[0xCE00 + 0x40 * k]
            and m.mem[0xCE0A + 0x40 * k] == f and m.mem[0xCE0B + 0x40 * k] == c]


def puertas_aqui(m):
    """Las fichas de puerta de la sala (8 de 16 bytes en 0xD500, p15:A320):
    [numero, tipo, Y, X]."""
    return [[m.mem[0xD505 + 16 * k], m.mem[0xD500 + 16 * k], m.mem[0xD502 + 16 * k], m.mem[0xD503 + 16 * k]]
            for k in range(8) if m.mem[0xD500 + 16 * k]]


def destino(zona, n):
    """Adonde lleva la puerta n de la zona (cruza_puerta, p15:A9AB): la ficha
    de 3 bytes de p15:B4B5 [como y donde][fila y columna][puerta de llegada].
    como 0: una sala de la zona donde; 1: la especial donde; 2: de la especial
    a la zona donde; 3: otra sala sin cambiar de zona."""
    p = palabra(15, 0xB4B5 + 2 * zona) + 3 * n
    a, b = byte(15, p), byte(15, p + 1)
    return {"como": a >> 6, "donde": a & 0x3F, "fila": b >> 4, "columna": b & 15,
            "llegada": byte(15, p + 2)}


def entra_en_zona(m, z):
    """La primera sala de la zona z por cambia_de_zona (p00:59A7)."""
    casilla = min(c for c, s in rejilla(z).items() if s < 0x80)
    m.pon(0xCA76, 0)
    m.pon(0xCA50, casilla >> 4)
    m.pon(0xCA51, casilla & 15)
    m.pon(0xCA4A, 0x3F)
    m.bancos_123()
    m.llama(0x59A7, a=z)


def pinta_especiales():
    from mg2run import Mg2
    os.makedirs(SALAS, exist_ok=True)
    m = Mg2()
    m.partida_nueva()
    m.pon(0xCADF, 0)
    dueno = zona_de_especial()
    info = {}
    for z in sorted(set(dueno.values())):
        m.pon(0xD430, 2 if z == 7 else 0)
        for d in (0xD881, 0xD888):
            m.pon(d, 0xFF if z == 0x12 else 0)
        entra_en_zona(m, z)
        zona = m
        for e in sorted(k for k, v in dueno.items() if v == z):
            # cada especial desde la zona, como por su puerta: sin los
            # actores de la especial anterior (0xD300, byte 0x1B = 1)
            m = copy.deepcopy(zona)
            g = rejilla(e - 1, 0xBA18)
            for casilla in sorted(g):
                sala = g[casilla]
                luces(m)
                m.pon(0xCA76, e)
                m.pon(0xCA50, casilla >> 4)
                m.pon(0xCA51, casilla & 15)
                m.bancos_123()
                m.llama(0x7BAA)                       # borra_lo_de_la_sala (p15:AB5A)
                m.bancos_123()
                m.llama(0x804E)                       # su rejilla a 0xD900 (p15:AB5D)
                m.bancos_123()
                m.llama(0x804E)                       # su rejilla a 0xD900 (p15:AB5D)
                m.bancos_123()
                m.llama(0x5CAE)                       # mapas_de_bits_especiales
                for d in (0xD44C, 0xD44D, 0xD44E, 0xE070, 0xE078):
                    m.pon(d, 0)                       # p15:AB66
                m.bancos_123()
                m.llama(0x5F0A)                       # actores_de_la_especial (p15:AB7E)
                m.bancos_123()
                m.llama(0x8D2A)                       # fichas_e100_especial_31 (p15:AB81)
                m.bancos_123()
                m.llama(0x55CF)                       # entra_en_sala_especial
                m.bancos_123()
                m.llama(0x5F01)                       # fichas_cd00_56 (p15:AB87)
                assert m.mem[0xCA4B] == sala, (e, sala, m.mem[0xCA4B])
                c = copy.deepcopy(m)                  # los cuadros, en una copia
                cuadros(c)
                pag = (c.vdp.r[2] >> 5) & 3
                c.vdp.pagina(pag, LADO).crop((0, 0, LADO, LADO)).save(
                    os.path.join(SALAS, "e%02X_s%02X.png" % (e, sala)))
                con_sprites(c, c.vdp.pagina(pag, LADO)).crop((0, 0, LADO, LADO)).save(
                    os.path.join(SALAS, "e%02X_s%02X_spr.png" % (e, sala)))
                info["E%02X_%02X" % (e, sala)] = {"zona": z, "fila": casilla >> 4,
                                                  "columna": casilla & 15,
                                                  "paleta": [list(x) for x in c.vdp.pal],
                                                  "actores": actores_aqui(c), "alerta": c.mem[0xCA5F],
                                                  "puertas": puertas_aqui(c)}
                print("especial %02X (zona %02X) sala %02X" % (e, z, sala), flush=True)
        m = zona
        m.pon(0xCA76, 0)
    ruta = os.path.join(SALAS, "salas.json")
    viejo = json.load(open(ruta)) if os.path.exists(ruta) else {}
    viejo.update(info)
    json.dump(viejo, open(ruta, "w"), indent=0, sort_keys=True)


def pinta_salas(zonas):
    from mg2run import Mg2
    os.makedirs(SALAS, exist_ok=True)
    m = Mg2()
    m.partida_nueva()                               # la partida nueva
    m.pon(0xCADF, 0)                              # sin la llegada de Snake (p06:A0F5)
    info = {}
    for z in zonas:
        g = rejilla(z)
        primera = True
        for casilla in sorted(g):
            sala = g[casilla]
            if sala >= 0x80:
                continue
            fila, col = casilla >> 4, casilla & 15
            t = time.time()
            m.pon(0xCA50, fila)
            m.pon(0xCA51, col)
            m.pon(0xD430, 2 if z == 7 else 0)         # el laberinto de la zona 7, abierto
            m.pon(0xD8A4, 0)
            # la zona 0: 0xCAAD sube a 1 al llegar a la fila 3 y a 2 a la 4
            # (p02:8181) y no baja; con el, las salas 0-9 llevan la paleta
            # de p56:B9A4 o B9B7 (p02:84AA). La de la primera visita.
            m.pon(0xCAAD, {3: 1, 4: 2}.get(fila, 0) if z == 0 else 0)
            for d in (0xD881, 0xD888):                # la zona 0x12 despues de sus sucesos
                m.pon(d, 0xFF if z == 0x12 else 0)
            m.bancos_123()
            if primera:
                m.pon(0xCA4A, 0x3F)
                m.llama(0x59A7, a=z)                  # cambia_de_zona
                primera = False
            else:
                m.llama(0x7BAA)                       # borra_lo_de_la_sala
                m.pon(0xD44A, 0xFF)                   # como sala_de_al_lado (p02:8099)
                for d in (0xD42E, 0xD44F, 0xD456, 0xD451):
                    m.pon(d, 0)
                luces(m)
                m.bancos_123()
                m.llama(0x52CF)                       # entra_en_sala
            assert m.mem[0xCA4A] == z and m.mem[0xCA4B] == sala, (z, sala, m.mem[0xCA4A], m.mem[0xCA4B])
            # los cuadros, en una copia: la maquina sigue de sala en sala sin
            # ellos y los actores quedan donde empiezan
            c = copy.deepcopy(m)
            cuadros(c)
            pag = (c.vdp.r[2] >> 5) & 3
            im = c.vdp.pagina(pag, LADO).crop((0, 0, LADO, LADO))
            nombre = "z%02X_s%02X.png" % (z, sala)
            im.save(os.path.join(SALAS, nombre))
            con_sprites(c, c.vdp.pagina(pag, LADO)).crop((0, 0, LADO, LADO)).save(
                os.path.join(SALAS, "z%02X_s%02X_spr.png" % (z, sala)))
            info["%02X_%02X" % (z, sala)] = {"fila": fila, "columna": col,
                                             "paleta": [list(x) for x in c.vdp.pal],
                                             "actores": actores_aqui(c), "alerta": c.mem[0xCA5F],
                                             "puertas": puertas_aqui(c)}
            print("zona %02X sala %02X (%X, %X) %.1f s" % (z, sala, fila, col, time.time() - t), flush=True)
    viejo = {}
    ruta = os.path.join(SALAS, "salas.json")
    if os.path.exists(ruta):
        viejo = json.load(open(ruta))
    viejo.update(info)
    json.dump(viejo, open(ruta, "w"), indent=0, sort_keys=True)


def monta_zonas(zonas):
    from PIL import Image
    os.makedirs(MAPAS, exist_ok=True)
    for z in zonas:
        g = {c: s for c, s in rejilla(z).items() if s < 0x80}
        filas = [c >> 4 for c in g]
        cols = [c & 15 for c in g]
        f0, c0 = min(filas), min(cols)
        ancho = (max(cols) - c0 + 1) * LADO
        alto = (max(filas) - f0 + 1) * LADO
        for cola in ("", "_spr"):
            im = Image.new("RGB", (ancho, alto), (0, 0, 0))
            for c, s in g.items():
                sala = Image.open(os.path.join(SALAS, "z%02X_s%02X%s.png" % (z, s, cola)))
                im.paste(sala, (((c & 15) - c0) * LADO, (max(filas) - (c >> 4)) * LADO))
            im.save(os.path.join(MAPAS, "zona_%02X%s.png" % (z, cola)))
        print("zona %02X: %d salas, %d x %d" % (z, len(g), ancho, alto))


def monta_especiales():
    """Cada especial con su rejilla (p30:BA18), la fila 1 abajo como en las
    zonas: work/mapas/especial_EE.png."""
    from PIL import Image
    os.makedirs(MAPAS, exist_ok=True)
    for e in sorted(zona_de_especial()):
        g = rejilla(e - 1, 0xBA18)
        filas = [c >> 4 for c in g]
        cols = [c & 15 for c in g]
        c0 = min(cols)
        for cola in ("", "_spr"):
            im = Image.new("RGB", ((max(cols) - c0 + 1) * LADO, (max(filas) - min(filas) + 1) * LADO))
            for c, sala in g.items():
                im.paste(Image.open(os.path.join(SALAS, "e%02X_s%02X%s.png" % (e, sala, cola))),
                         (((c & 15) - c0) * LADO, (max(filas) - (c >> 4)) * LADO))
            im.save(os.path.join(MAPAS, "especial_%02X%s.png" % (e, cola)))
    print("%d especiales montadas" % len(zona_de_especial()))


def rotula_zonas(zonas):
    """La zona montada con enemigos y rotulos, como los mapas de Metal Gear
    (METALGEAR_DISAM): el numero de cada sala en su esquina; en las puertas
    que no se ven en el mapa, adonde llevan (Exx una especial, Zzz:ss otra
    zona, ->ss una sala de la zona que no es vecina; Zzz en el borde, el paso
    andando a otra zona); debajo, las especiales
    a las que se entra desde la zona, con "Exx <- sala #puerta".
    work/mapas/web_zona_ZZ.png."""
    from PIL import Image, ImageDraw, ImageFont
    info = json.load(open(os.path.join(SALAS, "salas.json")))
    letra = ImageFont.load_default()
    AMARILLO, VERDE, FONDO = (255, 255, 0), (80, 255, 80), (24, 24, 24)

    def rotulo(d, x, y, texto, color, ancho=None, alto=None):
        caja = d.textbbox((0, 0), texto, font=letra)
        w, h = caja[2] - caja[0] + 4, caja[3] - caja[1] + 4
        if ancho is not None:
            x, y = max(0, min(x, ancho - w)), max(0, min(y, alto - h))
        d.rectangle((x, y, x + w - 1, y + h - 1), fill=(0, 0, 0))
        d.text((x + 2 - caja[0], y + 2 - caja[1]), texto, font=letra, fill=color)

    def lleva(z, n, casilla):
        """El rotulo de la puerta n de la zona z en la casilla, o None."""
        t = destino(z, n)
        if t["como"] == 1:
            return "E%02X" % t["donde"]
        if t["como"] == 2 or (t["como"] == 0 and t["donde"] != z):
            zd = t["donde"]
            sd = rejilla(zd).get(t["fila"] << 4 | t["columna"])
            return "Z%02X:%02X" % (zd, sd) if sd is not None and sd < 0x80 else "Z%02X" % zd
        f, c = t["fila"], t["columna"]
        if casilla is not None and abs(f - (casilla >> 4)) + abs(c - (casilla & 15)) == 1:
            return None
        sd = rejilla(z).get(f << 4 | c)
        return "->%02X" % sd if sd is not None else None

    def pinta_puertas(d, ox, oy, z, puertas, casilla, salida_de=None):
        for n, _tipo, y, x in puertas:
            t = lleva(z, n, casilla)
            if t and not (salida_de is not None and t.startswith("Z%02X" % salida_de)):
                rotulo(d, ox + min(x, LADO - 1), oy + min(y, LADO - 1), t, VERDE,
                       ox + LADO, oy + LADO)

    # de donde se entra a cada especial: puertas de las salas de la zona y de
    # sus especiales con como = 1
    entradas = {}
    for k, v in sorted(info.items()):
        z = v["zona"] if k.startswith("E") else int(k[:2], 16)
        origen = ("E%s:%s" % (k[1:3], k[4:6])) if k.startswith("E") else k[3:5]
        for n, _t, _y, _x in v.get("puertas", []):
            t = destino(z, n)
            if t["como"] == 1:
                entradas.setdefault(t["donde"], []).append((z, "%s #%d" % (origen, n)))
    dueno = zona_de_especial()
    for z in zonas:
        g = {c: s for c, s in rejilla(z).items() if s < 0x80}
        filas = [c >> 4 for c in g]
        c0 = min(c & 15 for c in g)
        im = Image.open(os.path.join(MAPAS, "zona_%02X_spr.png" % z)).convert("RGB")
        d = ImageDraw.Draw(im)
        for c, s in g.items():
            ox, oy = ((c & 15) - c0) * LADO, (max(filas) - (c >> 4)) * LADO
            pinta_puertas(d, ox, oy, z, info["%02X_%02X" % (z, s)].get("puertas", []), c)
            rotulo(d, ox + 1, oy + 1, "%02X" % s, AMARILLO)
        # los pasos andando a otra zona: casillas 0x80 + Z de la rejilla
        # (p00:5A25), rotuladas en el borde de la sala vecina
        for c, paso in rejilla(z).items():
            if paso < 0x80:
                continue
            for df, dc, bx, by in ((1, 0, LADO // 2, 0), (-1, 0, LADO // 2, LADO - 1),
                                   (0, 1, LADO - 1, LADO // 2), (0, -1, 0, LADO // 2)):
                v = c - (df << 4) - dc            # la sala de la que se sale hacia c
                if v in g:
                    ox, oy = ((v & 15) - c0) * LADO, (max(filas) - (v >> 4)) * LADO
                    rotulo(d, ox + bx, oy + by, "Z%02X" % (paso & 0x7F), VERDE, ox + LADO, oy + LADO)
        # las especiales de la zona: las que tienen entrada desde ella, o, sin
        # ninguna, las suyas por las tablas de puertas
        mias = sorted(e for e in dueno
                      if any(zz == z for zz, _ in entradas.get(e, []))
                      or (not entradas.get(e) and dueno[e] == z))
        bloques = []
        for e in mias:
            esp = Image.open(os.path.join(MAPAS, "especial_%02X_spr.png" % e)).convert("RGB")
            de = ImageDraw.Draw(esp)
            ge = rejilla(e - 1, 0xBA18)
            fe = [c >> 4 for c in ge]
            ce0 = min(c & 15 for c in ge)
            for c, s in ge.items():
                ox, oy = ((c & 15) - ce0) * LADO, (max(fe) - (c >> 4)) * LADO
                pinta_puertas(de, ox, oy, z, info["E%02X_%02X" % (e, s)].get("puertas", []), None, z)
                if len(ge) > 1:
                    rotulo(de, ox + 1, oy + 1, "%02X" % s, AMARILLO)
            texto = "E%02X <- %s" % (e, ", ".join(o for zz, o in entradas.get(e, []) if zz == z) or "?")
            bloques.append((esp, texto))
        if bloques:
            ancho = max(im.width, 4 * LADO)
            x = y = 0
            alto_fila = 0
            sitios = []
            for esp, texto in bloques:
                w, h = esp.width, esp.height + 16
                if x and x + w > ancho:
                    x, y = 0, y + alto_fila + 8
                    alto_fila = 0
                sitios.append((x, y))
                x += w + 8
                alto_fila = max(alto_fila, h)
            todo = Image.new("RGB", (ancho, im.height + 20 + y + alto_fila), FONDO)
            todo.paste(im, (0, 0))
            dt = ImageDraw.Draw(todo)
            for (esp, texto), (x, y) in zip(bloques, sitios):
                rotulo(dt, x, im.height + 20 + y, texto, VERDE)
                todo.paste(esp, (x, im.height + 20 + y + 16))
            im = todo
        im.save(os.path.join(MAPAS, "web_zona_%02X.png" % z))
        print("zona %02X: %d salas, %d especiales, %d x %d" % (z, len(g), len(bloques), im.width, im.height))


def main(argv):
    zonas = [int(a, 16) for a in argv[1:]] or list(range(N_ZONAS))
    if not argv:
        argv = [""]
    if argv[0] == "salas":
        pinta_salas(zonas)
    elif argv[0] == "especiales":
        pinta_especiales()
    elif argv[0] == "zonas":
        monta_zonas(zonas)
    elif argv[0] == "montar_especiales":
        monta_especiales()
    elif argv[0] == "rotular":
        rotula_zonas(zonas)
    else:
        print(__doc__)


if __name__ == "__main__":
    main(sys.argv[1:])
