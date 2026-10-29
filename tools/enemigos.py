#!/usr/bin/env python3
"""Los enemigos JUGADOS por el cartucho, en GIF al ritmo del MSX (gif_juego.py).

Por cada actor de cada sala (work/salas/salas.json, de tools/mapas.py): se
entra en su sala como tools/actores_dibujos.py (con la partida nueva de
Mg2.partida_nueva, que carga los patrones de p37), se corre el cuadro entero
del juego (p01:728E, el de la interrupcion) CUADROS veces y se pintan solo sus
sprites (su lista IX + 0x2E, p04:8273: el numero n es el sprite 9 + n) en un
recuadro de 64 x 64 centrado en el (Y = IX + 3, X = IX + 5).

Para que patrullen y no corran tras Snake, la alerta (0xCA5F) se pone a 0
cada cuadro; la vida de Snake (0xCA53), llena.

Un GIF por aspecto distinto: el tipo (sin el bit 7), los patrones de su
primer dibujo y los colores de sus sprites (las 16 lineas de 0xDA00 de cada
uno, p04:81C5). Los soldados comparten tabla de dibujos (p56:A852) y lo que
los distingue a la vista son los colores de cada zona.

Uso: enemigos.py [cuadros] -> work/enemigos/NN_tTT_<sala>.gif y enemigos.json (el de antes)
     enemigos.py agrupa -> work/enemigos/grupos.json; enemigos.py salas -> sala_NN_<sala>.gif
"""
import json
import os
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)
RAIZ = os.path.join(AQUI, "..")
SAL = os.path.join(RAIZ, "work", "enemigos")
LADO = 64


def sprites_suyos(m, suyos):
    """La capa de sprites con solo los de la lista, sobre negro (256 x 212)."""
    from PIL import Image
    v = m.vdp
    attr = ((v.r[11] & 3) << 15) | ((v.r[5] & 0xFC) << 7)
    viejo = bytes(v.vram[attr - 0x200:attr + 0x80])
    v.vram[attr - 0x200:attr + 0x80] = m.mem[0xDA00:0xDC80]
    for n in range(32):
        if n not in suyos:
            v.vram[attr + 4 * n] = 0xE0
    im = Image.new("RGB", (256, 212), (0, 0, 0))
    v.sprites(im)
    v.vram[attr - 0x200:attr + 0x80] = viejo
    return im


def lista_de(m, ix):
    lista = list(m.mem[ix + 0x2E:ix + 0x2E + 18])
    return [9 + n for n in lista[:lista.index(0) if 0 in lista else 18]]


def aspecto(gif, tipo):
    """Lo que se ve de el: el tipo y los colores de todas sus imagenes (los
    patrones no: cambian con la direccion y el paso del mismo soldado)."""
    cols = set()
    for im in gif.imgs:
        cols |= {c for _, c in im.getcolors(4096) or []}
    return (tipo, frozenset(cols - {(0, 0, 0)}))


def juega(clave, k, cuadros):
    from actores_dibujos import a_la_sala
    from gif_juego import Gif
    m = a_la_sala(clave)
    ix = 0xCE00 + 0x40 * k
    tipo = m.mem[ix] & 0x7F
    sala = (m.mem[0xCA50], m.mem[0xCA51])
    if not m.mem[ix + 0x2E]:
        # sin sprites al entrar (el 0x0A no los pide, pinta_actores p04:8199): se
        # los da pinta_actor (p04:8153), como cuando sale
        m.pon_banco(0x8000, 4)
        m.mem[0xC382] = 4
        m.llama(0x8153, ix=ix)
        m.bancos_123()
    gif, visto = Gif(), None
    for c in range(cuadros):
        m.pon(0xCA5F, 0)
        m.bancos_123()
        m.llama(0x728E)
        m.pon(0xCA53, 0x20)
        if m.mem[ix] & 0x7F != tipo or m.mem[0xCA00] != 5:
            break
        if (m.mem[ix + 0x0A], m.mem[ix + 0x0B]) != sala:
            break                                   # se va a otra sala
        suyos = lista_de(m, ix)
        if not suyos:
            continue
        visto = True
        y, x = m.mem[ix + 3], m.mem[ix + 5]
        im = sprites_suyos(m, suyos).crop((x - LADO // 2, y - LADO + 16, x + LADO // 2, y + 16))
        gif.pon(im)
    return tipo, visto, gif


def junta_quietos(info):
    """Uno quieto (una sola imagen) se junta con otro del mismo tipo cuyos
    colores ya tienen los suyos: es el mismo enemigo parado."""
    from PIL import Image, ImageSequence

    def colores(e):
        c = set()
        for f in ImageSequence.Iterator(Image.open(os.path.join(SAL, e["gif"]))):
            c |= {x for _, x in f.convert("RGB").getcolors(4096) or []}
        return c - {(0, 0, 0)}
    cols = {e["gif"]: colores(e) for e in info}
    fuera = set()
    for e in info:
        if e["imagenes"] > 1:
            continue
        otro = next((o for o in info if o is not e and o["gif"] not in fuera and o["tipo"] == e["tipo"]
                     and (o["imagenes"] > 1 or o["n"] < e["n"]) and cols[e["gif"]] <= cols[o["gif"]]), None)
        if otro:
            otro["tambien"] += [e["sala"]] + e["tambien"]
            fuera.add(e["gif"])
            os.remove(os.path.join(SAL, e["gif"]))
    return [e for e in info if e["gif"] not in fuera]


def main(argv):
    cuadros = int(argv[0]) if argv else 120
    # "repite": solo los actores que salieron sin sprites en work/enemigos.log (los
    # demas se reagrupan desde el enemigos.json de antes)
    repite = None
    if argv[1:2] == ["repite"]:
        import re
        repite = {(c, int(k)) for c, k in re.findall(r"^(\S+) actor (\d+) \(tipo [0-9A-F]+\): sin sprites",
                                                      open(os.path.join(RAIZ, "work", "enemigos_v1.log")).read(), re.M)}
    solo = bool(repite)
    os.makedirs(SAL, exist_ok=True)
    salas = json.load(open(os.path.join(RAIZ, "work", "salas", "salas.json")))
    vistos, info = {}, []
    if solo:
        # los de antes, reagrupados por su aspecto (tipo y colores de sus GIF)
        from PIL import Image, ImageSequence
        from gif_juego import Gif
        for e in json.load(open(os.path.join(SAL, "enemigos.json"))):
            g = Gif()
            g.imgs = [f.convert("RGB").copy() for f in
                      ImageSequence.Iterator(Image.open(os.path.join(SAL, e["gif"])))]
            asp = aspecto(g, e["tipo"])
            if asp in vistos:
                vistos[asp]["tambien"] += [e["sala"]] + e["tambien"]
                os.remove(os.path.join(SAL, e["gif"]))
            else:
                vistos[asp] = e
    for clave in sorted(salas):
        for a in salas[clave].get("actores", []):
            k = a[0]
            if repite is not None and (clave, k) not in repite:
                continue
            try:
                tipo, asp, gif = juega(clave, k, cuadros)
            except Exception as e:                  # una sala que no se deja entrar asi
                print("%s actor %d: %s" % (clave, k, e), flush=True)
                continue
            if asp is None or len(gif) < 1:
                print("%s actor %d (tipo %02X): sin sprites" % (clave, k, a[1] & 0x7F), flush=True)
                continue
            asp = aspecto(gif, tipo)
            if asp in vistos:
                vistos[asp]["tambien"].append(clave)
                continue
            n = max([v["n"] for v in vistos.values()] + [-1]) + 1
            nombre = "%02d_t%02X_%s.gif" % (n, tipo, clave)
            gif.guarda(os.path.join(SAL, nombre))
            vistos[asp] = {"n": n, "tipo": tipo, "sala": clave, "actor": k, "gif": nombre,
                           "imagenes": len(gif), "tambien": []}
            print("%s actor %d: tipo %02X nuevo -> %s" % (clave, k, tipo, nombre), flush=True)
    info = junta_quietos(sorted(vistos.values(), key=lambda x: x["n"]))
    for i, e in enumerate(info):                    # numeros seguidos
        e["n"] = i
    json.dump(info, open(os.path.join(SAL, "enemigos.json"), "w"), indent=1)
    print(len(info), "enemigos distintos")


# ---------------------------------------------------------------------------
# 2026-10-29, tras el cotejo con openMSX (work/omsx_enem, tools/omsx_salas.tcl
# con SALAS_VECES): el recuadro que sigue al enemigo esconde su movimiento (las
# camaras de 01_0A y 05_00 se deslizan por la pared y salian quietas, de una
# imagen), y al 0x0A dormido se le daban sprites a la fuerza (el juego lo pinta
# en la cama, con el fondo: salia un soldado sin cabeza). Ahora: la SALA ENTERA
# jugada, con Snake, sin forzar sprites; agrupados por lo que se ve (los
# colores), no por el tipo: los tipos 1, 2 y 4-9 son la misma rutina
# (p04:815B -> p04:9D39) y a la vista solo los distinguen los colores.

def recorre_sala(clave, cuadros):
    """Los actores de la sala con sprites al entrar, jugados `cuadros` cuadros:
    {k: {"tipo", "colores", "sitios", "imagenes"}}."""
    from actores_dibujos import a_la_sala
    m = a_la_sala(clave)
    sala = (m.mem[0xCA50], m.mem[0xCA51])
    vistos = {}
    for c in range(cuadros):
        m.pon(0xCA5F, 0)
        m.bancos_123()
        m.llama(0x728E)
        m.pon(0xCA53, 0x20)
        if m.mem[0xCA00] != 5:
            break
        for k in range(24):
            ix = 0xCE00 + 0x40 * k
            if not m.mem[ix] or (m.mem[ix + 0x0A], m.mem[ix + 0x0B]) != sala:
                continue
            suyos = lista_de(m, ix)
            if not suyos:
                continue
            im = sprites_suyos(m, suyos)
            caja = im.getbbox()
            if not caja:
                continue
            e = vistos.setdefault(k, {"tipo": m.mem[ix] & 0x7F, "colores": set(), "sitios": set(),
                                       "imagenes": set()})
            e["colores"] |= {x for _, x in im.getcolors(4096) or []} - {(0, 0, 0)}
            e["sitios"].add((m.mem[ix + 3], m.mem[ix + 5]))
            e["imagenes"].add(im.crop(caja).tobytes())
    return vistos


def clase(tipo):
    """Lo que es a la vista: los soldados (tipos 1-9 con la misma rutina p04:9D39,
    y el 3, el 0x0A y el 0x0C, soldados con otra) son una clase; los 0x16 y 0x17
    (los pajaros, p08:A401) otra; el resto, cada tipo la suya."""
    if tipo <= 0x0C and tipo != 0x0B:
        return "soldado"
    if tipo in (0x16, 0x17):
        return "pajaro"
    return "t%02X" % tipo


def parecidos(a, b):
    """Dos juegos de colores del mismo enemigo: a sin el blanco de b (visto de
    espaldas), o uno solo cambiado por un tono vecino (la paleta de otra zona:
    0xB66D00 / 0x916D00, 0x919191 / 0x6D6D6D). Distinto gris o rojo de mas no:
    la boina roja y el casco gris solo se distinguen por eso."""
    a, b = set(a.split(",")), set(b.split(","))
    if a <= b and b - a <= {"FFFFFF"}:
        return True
    if "919191" in a and a <= b and b - a <= {"FFFFFF", "FF0000"}:
        return True                         # el de casco gris: el rojo solo se le ve de un lado
    if len(a) == len(b) and len(a - b) == 1:
        x, y = (a - b).pop(), (b - a).pop()
        return all(abs(int(x[k:k + 2], 16) - int(y[k:k + 2], 16)) <= 0x40 for k in (0, 2, 4))
    return False


def junta_subconjuntos(grupos):
    """Dentro de una clase, los grupos con colores parecidos (parecidos()) son el
    mismo enemigo."""
    grupos = sorted(grupos, key=lambda g: (-len(g["colores"].split(",")), -len(g["salas"])))
    fuera = []
    for i, g in enumerate(grupos):
        for o in grupos[:i]:
            if o in fuera or o["clase"] != g["clase"]:
                continue
            if parecidos(g["colores"], o["colores"]):
                o["salas"] += g["salas"]
                o["tipos"] += [x for x in g["tipos"] if x not in o["tipos"]]
                if g["nota"] > o["nota"]:
                    o["mejor"], o["nota"] = g["mejor"], g["nota"]
                fuera.append(g)
                break
    return [g for g in grupos if g not in fuera]


def agrupa(cuadros=60):
    """Primera pasada: cada actor de cada sala por lo que se ve -> work/enemigos/grupos.json."""
    salas = json.load(open(os.path.join(RAIZ, "work", "salas", "salas.json")))
    grupos = {}
    for clave in sorted(salas):
        if not salas[clave].get("actores"):
            continue
        try:
            vistos = recorre_sala(clave, cuadros)
        except Exception as e:                      # una sala que no se deja entrar asi
            print("%s: %s" % (clave, e), flush=True)
            continue
        for k, e in vistos.items():
            asp = "%s:%s" % (clase(e["tipo"]), ",".join("%02X%02X%02X" % c for c in sorted(e["colores"])))
            g = grupos.setdefault(asp, {"clase": clase(e["tipo"]), "colores": asp.split(":")[1], "salas": [],
                                        "tipos": [], "mejor": None, "nota": -1})
            g["salas"].append([clave, k, e["tipo"]])
            if e["tipo"] not in g["tipos"]:
                g["tipos"].append(e["tipo"])
            nota = len(e["sitios"]) + 4 * len(e["imagenes"])   # la que mas se mueve y cambia
            if nota > g["nota"]:
                g["mejor"], g["nota"] = [clave, k], nota
        print(clave, "->", len(grupos), "aspectos", flush=True)
    json.dump(list(grupos.values()), open(os.path.join(SAL, "grupos.json"), "w"), indent=1)
    return grupos


def gif_de_sala(clave, nombre, cuadros=120, actor=None):
    """La sala entera jugada `cuadros` cuadros, con Snake, al ritmo del MSX. Con
    actor, sus dibujos distintos a work/enemigos/<nombre>_dNN.png (para la hoja)."""
    import mapas
    from actores_dibujos import a_la_sala
    from gif_juego import Gif
    m = a_la_sala(clave)
    if m.mem[0xCB01] == 0x0D:                       # Snake a la vista (ver jefes.py)
        m.pon(0xCB01, 0)
        m.pon(0xCB0E, 1)
    sala = (m.mem[0xCA4A], m.mem[0xCA4B], m.mem[0xCA76])
    gif, dibujos = Gif(), []
    for c in range(cuadros):
        m.pon(0xCA5F, 0)
        m.bancos_123()
        m.llama(0x728E)
        m.pon(0xCA53, 0x20)
        if m.mem[0xCA00] != 5 or (m.mem[0xCA4A], m.mem[0xCA4B], m.mem[0xCA76]) != sala:
            break
        if actor is not None:
            ix = 0xCE00 + 0x40 * actor
            suyos = lista_de(m, ix) if m.mem[ix] else []
            if suyos:
                d = sprites_suyos(m, suyos)
                caja = d.getbbox()
                if caja and all(d.crop(caja).tobytes() != o.tobytes() for o in dibujos):
                    dibujos.append(d.crop(caja))
        v = m.vdp
        im = v.pagina((v.r[2] >> 5) & 3, 212)
        mapas.sprites_de_ram(v, m.mem, im, con_snake=True)
        gif.pon(im.convert("RGB").crop((0, 0, 0xC0, 0xC0)))
    gif.guarda(os.path.join(SAL, nombre))
    for i, d in enumerate(dibujos):
        d.save(os.path.join(SAL, "%s_d%02d.png" % (nombre[:-4], i)))
    return len(gif)


def salas_enteras(cuadros=120):
    grupos = junta_subconjuntos(json.load(open(os.path.join(SAL, "grupos.json"))))
    grupos.sort(key=lambda g: (min(g["tipos"]), g["mejor"][0]))
    info = []
    for n, g in enumerate(grupos):
        clave, k = g["mejor"]
        nombre = "sala_%02d_%s.gif" % (n, clave)
        imgs = gif_de_sala(clave, nombre, cuadros, actor=k)
        info.append({"n": n, "clase": g["clase"], "tipos": g["tipos"], "sala": clave, "actor": k,
                     "gif": nombre, "imagenes": imgs, "salas": sorted({s[0] for s in g["salas"]}),
                     "colores": g["colores"]})
    json.dump(info, open(os.path.join(SAL, "enemigos_salas.json"), "w"), indent=1)
    print(len(info), "enemigos distintos")


if __name__ == "__main__":
    if sys.argv[1:2] == ["agrupa"]:
        os.makedirs(SAL, exist_ok=True)
        agrupa()
    elif sys.argv[1:2] == ["salas"]:
        salas_enteras()
    else:
        main(sys.argv[1:])
