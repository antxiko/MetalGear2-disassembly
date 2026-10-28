#!/usr/bin/env python3
"""Los dibujos de cada tipo de actor, pintados por el cartucho ejecutado.

Como los pinta el juego: sprites_de_actores (p12:7DDC) toma la tabla del tipo
de p56:A808 (palabra_de_tabla: tipo * 2): [ancho] y detras una fila de ancho
parejas [desplazamiento][patron] por dibujo; el dibujo es el byte 0x0D del
actor. El desplazamiento es una palabra de p56:A7EE (Y en el byte bajo, X en
el alto) que se suma al sitio del actor (bytes 3 y 5); los sprites son los que
se le repartieron (su lista, p12:8273) desde 0xDC28, con los colores que les
puso el reparto (p04:81C5) y los patrones que cargo la sala (sprites_de_sala,
p00:4F18). Por eso cada tipo se pinta en una sala donde esta (work/salas/
salas.json, de tools/mapas.py): se entra como alli, se corren los cuadros, se
dejan solo el, en el centro y quieto (sin temblor: byte 0x1F = 0), y por cada
dibujo se llama a sprites_de_actores.

Cuantos dibujos tiene cada tabla: lo que hay hasta la siguiente (la ultima,
p56:A9DC, 4 dibujos, acaba en A9ED: detras ya no son filas de [0-12][patron]).

Uso: actores_dibujos.py [tipo ...]  -> work/actores/tTT_dDD.png y work/actores/actores.json
"""
import copy
import json
import os
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)
RAIZ = os.path.join(AQUI, "..")
ROM = open(os.path.join(RAIZ, "metalgear2.rom"), "rb").read()
SAL = os.path.join(RAIZ, "work", "actores")
ROSA = (255, 0, 255)
FIN_A808 = 0xA9ED


def b56(d):
    return ROM[56 * 0x2000 + d - 0xA000]


def tablas():
    """{tipo: (direccion, ancho, dibujos)} de p56:A808, los tipos 1-0x19 con tabla."""
    p = {t: b56(0xA808 + 2 * t) | b56(0xA809 + 2 * t) << 8 for t in range(1, 0x1A)}
    p = {t: d for t, d in p.items() if d}
    inicios = sorted(set(p.values())) + [FIN_A808]
    r = {}
    for t, d in p.items():
        fin = inicios[inicios.index(d) + 1]
        ancho = b56(d)
        r[t] = (d, ancho, (fin - d - 1) // (2 * ancho))
    return r


def donde_esta():
    """{tipo: (sala, numero de actor)}: la primera sala de salas.json con el."""
    d = json.load(open(os.path.join(RAIZ, "work", "salas", "salas.json")))
    r = {}
    for k in sorted(d):
        for a in d[k].get("actores", []):
            r.setdefault(a[1] & 0x7F, (k, a[0]))
    return r


def a_la_sala(clave):
    """Una maquina en la sala de clave ("ZZ_SS" o "EEE_SS"), como tools/mapas.py,
    con los cuadros corridos."""
    import mapas
    from mg2run import Mg2
    m = Mg2()
    m.partida_nueva()
    m.pon(0xCADF, 0)
    if clave.startswith("E"):
        e, sala = int(clave[1:3], 16), int(clave[4:], 16)
        z = mapas.zona_de_especial()[e]
        m.pon(0xD430, 2 if z == 7 else 0)
        for d in (0xD881, 0xD888):
            m.pon(d, 0xFF if z == 0x12 else 0)
        mapas.entra_en_zona(m, z)
        casilla = [c for c, s in mapas.rejilla(e - 1, 0xBA18).items() if s == sala][0]
        mapas.luces(m)
        m.pon(0xCA76, e)
        m.pon(0xCA50, casilla >> 4)
        m.pon(0xCA51, casilla & 15)
        # la entrada de mapas.pinta_especiales (p15:AB4F)
        for d in (0x7BAA, 0x804E, 0x804E, 0x5CAE):
            m.bancos_123()
            m.llama(d)
        for d in (0xD44C, 0xD44D, 0xD44E, 0xE070, 0xE078):
            m.pon(d, 0)
        for d in (0x5F0A, 0x8D2A, 0x55CF, 0x5F01):
            m.bancos_123()
            m.llama(d)
    else:
        z, sala = int(clave[:2], 16), int(clave[3:], 16)
        m.pon(0xD430, 2 if z == 7 else 0)
        for d in (0xD881, 0xD888):
            m.pon(d, 0xFF if z == 0x12 else 0)
        m.pon(0xCAAD, 0)
        mapas.entra_en_zona(m, z)
        if m.mem[0xCA4B] != sala:
            casilla = [c for c, s in mapas.rejilla(z).items() if s == sala][0]
            m.pon(0xCA50, casilla >> 4)
            m.pon(0xCA51, casilla & 15)
            m.pon(0xCAAD, {3: 1, 4: 2}.get(casilla >> 4, 0) if z == 0 else 0)
            m.bancos_123()
            m.llama(0x7BAA)                       # borra_lo_de_la_sala
            m.pon(0xD44A, 0xFF)
            for d in (0xD42E, 0xD44F, 0xD456, 0xD451):
                m.pon(d, 0)
            mapas.luces(m)
            m.bancos_123()
            m.llama(0x52CF)                       # entra_en_sala
    assert m.mem[0xCA4B] == sala, (clave, m.mem[0xCA4B])
    mapas.cuadros(m)
    return m


def pinta(m, suyos):
    """Los sprites de la lista suyos de 0xDA00/0xDC00, los demas fuera."""
    from PIL import Image, ImageChops
    v = m.vdp
    attr = ((v.r[11] & 3) << 15) | ((v.r[5] & 0xFC) << 7)
    viejo = bytes(v.vram[attr - 0x200:attr + 0x80])
    v.vram[attr - 0x200:attr + 0x80] = m.mem[0xDA00:0xDC80]
    for n in range(32):
        if n not in suyos:
            v.vram[attr + 4 * n] = 0xE0
    im = Image.new("RGB", (256, 212), ROSA)    # las 212 lineas: 0xE0 queda fuera
    v.sprites(im)
    v.vram[attr - 0x200:attr + 0x80] = viejo
    caja = ImageChops.difference(im, Image.new("RGB", im.size, ROSA)).getbbox()
    if not caja:
        return None
    return im.crop(caja), caja


def transparente(im):
    im = im.convert("RGBA")
    im.putdata([(0, 0, 0, 0) if p[:3] == ROSA else p for p in im.getdata()])
    return im


def dibujos(tipo, sala, k, n):
    m = a_la_sala(sala)
    ix = 0xCE00 + 0x40 * k
    assert m.mem[ix] & 0x7F == tipo, (sala, k, m.mem[ix])
    for j in range(24):                          # solo el
        if j != k:
            m.pon(0xCE00 + 0x40 * j, 0)
    if not m.mem[ix + 0x2E]:
        # sin sprites: el 0x0A no los pide al entrar (pinta_actores p04:8199),
        # se los da pinta_actor (p04:8153) cuando sale; aqui igual
        m.pon_banco(0x8000, 4)
        m.mem[0xC382] = 4
        m.llama(0x8153, ix=ix)
        m.bancos_123()
    m.pon(ix + 3, 0x60)
    m.pon(ix + 5, 0x60)
    m.pon(ix + 0x1F, 0)
    m.pon(0xCA50, m.mem[ix + 0x0A])
    m.pon(0xCA51, m.mem[ix + 0x0B])
    r = []
    for d in range(n):
        c = copy.deepcopy(m)
        for s in range(10, 32):
            c.pon(0xDC00 + 4 * s, 0xE0)
        c.pon(ix + 0x0D, d)
        c.llama(0x5DAB)                          # bancos 12, 4, 56 y sprites_de_actores
        # los suyos: su lista (IX + 0x2E, p04:8273), numeros desde 1 = el sprite 10
        lista = c.mem[ix + 0x2E:ix + 0x2E + 18]
        suyos = [9 + n for n in lista[:list(lista).index(0) if 0 in lista else 18]]
        x = pinta(c, suyos)
        r.append((d, x, list(c.vdp.pal)))
    return r


def main(argv):
    tt = tablas()
    sitio = donde_esta()
    pedidos = [int(x, 16) for x in argv] or sorted(tt)
    os.makedirs(SAL, exist_ok=True)
    ruta = os.path.join(SAL, "actores.json")
    info = json.load(open(ruta)) if os.path.exists(ruta) else {}
    for t in pedidos:
        d, ancho, n = tt[t]
        if t not in sitio:
            print("tipo %02X: tabla p56:%04X, %d sprites, %d dibujos; en ninguna sala de salas.json" % (t, d, ancho, n))
            continue
        sala, k = sitio[t]
        hechos, vacios = [], []
        for dib, x, pal in dibujos(t, sala, k, n):
            if x is None:                        # sus patrones no estan en esta sala
                vacios.append(dib)
                continue
            nombre = "t%02X_d%02X.png" % (t, dib)
            transparente(x[0]).save(os.path.join(SAL, nombre))
            hechos.append({"dibujo": dib, "fichero": nombre, "dy": x[1][1] - 0x60, "dx": x[1][0] - 0x60})
        info["%02X" % t] = {"tabla": "p56:%04X" % d, "sprites": ancho, "dibujos": n, "sala": sala,
                            "actor": k, "pintados": hechos, "vacios": vacios}
        print("tipo %02X: sala %s, %d de %d dibujos" % (t, sala, len(hechos), n), flush=True)
    json.dump(info, open(ruta, "w"), indent=0, sort_keys=True)


if __name__ == "__main__":
    main(sys.argv[1:])
