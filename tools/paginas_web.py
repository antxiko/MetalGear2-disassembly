#!/usr/bin/env python3
"""Las partes largas de las paginas de la web, sacadas de la ROM: se escriben
entre las marcas <!-- generado:NOMBRE --> y <!-- /generado --> de cada .md, en
los dos idiomas. Lo de fuera de las marcas se escribe a mano.

  armas, equipo   los letreros de F2 (p50:8046) y F3 (p50:8048), por casilla
  musica          las 44 musicas de tools/musica.py, con de donde las pide el codigo
  conversaciones  el transceptor: cada numero con sus fichas en orden (tools/textos.py)
  textos          los mensajes de p48-51 que no salen en ninguna conversacion
  letreros        los letreros de p51 (sin los de F2 y F3, que van en la de Snake)

Uso: paginas_web.py <docs>
"""
import os
import re
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)
import textos as T                                   # noqa: E402
import musica as MU                                  # noqa: E402
import traducciones as TR                            # noqa: E402

# las paginas de cada idioma donde va cada parte
DONDE = {
    "en": {"enemigos": "THE-ENEMIES.md", "armas": "SNAKE.md", "equipo": "SNAKE.md", "musica": "THE-MUSIC.md",
           "conversaciones": "THE-TRANSCEIVER.md", "textos": "THE-TEXTS.md",
           "letreros": "THE-TEXTS.md"},
    "es": {"enemigos": "LOS-ENEMIGOS.md", "armas": "SNAKE.md", "equipo": "SNAKE.md", "musica": "LA-MUSICA.md",
           "conversaciones": "EL-TRANSCEPTOR.md", "textos": "LOS-TEXTOS.md",
           "letreros": "LOS-TEXTOS.md"},
}

PAL = {
    "es": dict(casilla="Casilla", texto="Letrero", nada="(ninguna)", donde="Dónde",
               ficha="Ficha", todas="con todas puestas", ultima="con la última puesta y las demás no",
               sin="siempre", banderas="banderas", zona="en la zona %02X, sala %02X",
               especial="en la especial %02X", azar="al azar, hasta %d de 100",
               tras="%d cuadros después",
               cabeza="Hablan: %s. La conversación de `p48:%04X`, con %d fichas.", conv="Conversación de p48:%04X",
               sinmsg="(sin mensaje)", original="Original", traduccion="Traducción"),
    "en": dict(casilla="Slot", texto="Sign", nada="(none)", donde="Where",
               ficha="Record", todas="with all of them set", ultima="with the last one set and the others not",
               sin="always", banderas="flags", zona="in zone %02X, room %02X",
               especial="in special room %02X", azar="at random, up to %d out of 100",
               tras="%d frames later",
               cabeza="Speaking: %s. The conversation at `p48:%04X`, with %d records.", conv="Conversation at p48:%04X",
               sinmsg="(no message)", original="Original", traduccion="Translation"),
}


def banco(esp, d):
    """El banco del byte d en el espacio 48 (48-49) o 50 (50-51)."""
    return esp + (d >= 0xA000)


def palabra50(d):
    return T.byte(50, d) | T.byte(50, d + 1) << 8


def letrero(esp, p):
    s = ""
    while T.byte(esp, p) != 0xFF:
        if T.byte(esp, p) == 0xFE:
            s += "\n"
            p += 1
            continue
        c, n = T.letra(esp, p)
        s += c
        p += n
    return s


def bloque(texto):
    """El texto del juego tal cual, en un bloque de codigo (los saltos de linea son los del juego)."""
    return ["```", texto.rstrip(), "```", ""]


def letreros_de(tabla, idioma):
    p = PAL[idioma]
    pref = "f2" if tabla == 0x8046 else "f3"
    raiz_img = "../imagenes/equipo/" if idioma == "es" else "imagenes/equipo/"
    docs = os.path.join(T.RAIZ, "docs", "imagenes", "equipo")
    t = palabra50(tabla)
    out, vistos = [], {}
    n = 0
    while True:
        d = palabra50(t + 2 * n)
        if not 0x8000 <= d < 0xC000:
            break
        n += 1
    out.append("| %s | | | %s |" % (p["casilla"], p["texto"]))
    out.append("|---:|---|---|---|")
    for i in range(n):
        d = palabra50(t + 2 * i)
        txt = letrero(50, d).split("\n")
        fich = "%s_c%02X.png" % (pref, i)
        dib = ("![](%s%s)" % (raiz_img, fich)) if os.path.exists(os.path.join(docs, fich)) else ""
        if d == palabra50(t):
            out.append("| %d | %s | | %s |" % (i, dib, p["nada"]))
            continue
        cabeza = re.sub(r"\s+", " ", txt[0].replace("　", " ")).strip()
        resto = "".join(txt[1:])
        igual = vistos.get(d)
        vistos.setdefault(d, i)
        out.append("| %d | %s | `p%02d:%04X` | **%s**%s |" % (
            i, dib, banco(50, d), d, cabeza,
            (" " + resto) if resto and igual is None else
            (" (= %d)" % igual if igual is not None else "")))
    return out + [""]


def musica(idioma):
    p = PAL[idioma]
    out = []
    for n, fichero, _g, es, en, *_ in MU.PIEZAS:
        out.append("### 0x%02X" % n)
        out.append("")
        out.append("*%s: %s.*" % (p["donde"], es if idioma == "es" else en))
        out.append("")
        out.append('<audio controls preload="none" src="%saudio/%s"></audio>' % (
            "../" if idioma == "es" else "", fichero))
        out.append("")
    return out


def mensajes_de(fs):
    """Las direcciones de los mensajes de unas fichas."""
    r = []
    for f in fs:
        for e, a, m in f["acciones"]:
            if a == 0 and m:
                r.append(m)
            elif a == 1:
                r += [mm for mm, u in T.al_azar(m) if mm]
    return r


def fichas(fs, idioma):
    p = PAL[idioma]
    out = []
    for i, f in enumerate(fs):
        if f["banderas"]:
            cond = "%s %s, %s" % (p["banderas"], " ".join("%02X" % b for b in f["banderas"]),
                                  p["todas"] if f["modo"] == "todas" else p["ultima"])
        else:
            cond = p["sin"]
        if f["sitio"]:
            z, x = f["sitio"]
            cond += ", " + (p["especial"] % x if z >= 0x14 else p["zona"] % (z, x))
        out.append("**%s %d** (%s)" % (p["ficha"], i, cond))
        out.append("")
        filas = []
        for e, a, m in f["acciones"]:
            lista = [(m, None)] if a == 0 else T.al_azar(m) if a == 1 else []
            for mm, u in lista:
                notas = []
                if e:
                    notas.append(p["tras"] % e)
                if u is not None:
                    notas.append(p["azar"] % u)
                if not mm:
                    filas.append("| | %s%s | |" % (p["sinmsg"], (" (" + ", ".join(notas) + ")") if notas else ""))
                    continue
                t, _ = T.mensaje(48, mm)
                filas.append("| `p%02d:%04X`%s | %s | %s |" % (
                    banco(48, mm), mm, ("<br>" + ", ".join(notas)) if notas else "",
                    celda(t), traduccion(mm, idioma)))
        if filas:
            out += ["| | %s | %s |" % (p["original"], p["traduccion"]), "|---|---|---|"] + filas + [""]
    return out


def celda(texto):
    """El texto del juego en una celda: los saltos de linea del juego, <br>."""
    return texto.rstrip().replace("|", "\\|").replace("\n", "<br>")


def traduccion(mm, idioma):
    i = 0 if idioma == "en" else 1
    if mm in TR.T:
        return TR.T[mm][i].replace(" / ", "<br>")
    entero = TR.COLAS[mm]
    return (("(starts in the middle of `p%02d:%04X`)" if i == 0 else
             "(empieza a media frase de `p%02d:%04X`)") % (banco(48, entero), entero))


def conversaciones(idioma):
    p = PAL[idioma]
    nums = T.numeros()
    out = []
    for k in range(8):
        t, fs = T.conversacion(k)
        quienes = []
        for mm in mensajes_de(fs):
            for q in T.quien_habla(48, mm):
                if q not in quienes:
                    quienes.append(q)
        out.append("### 140.%02X" % nums[k])
        out.append("")
        out.append(p["cabeza"] % (", ".join(T.nombre(q) for q in quienes) or "-", t, len(fs)))
        out.append("")
        out += fichas(fs, idioma)
    for c in T.OTRAS:
        t = T.byte(48, c) | T.byte(48, c + 1) << 8
        out.append("### " + p["conv"] % t)
        out.append("")
        out += fichas(T.conversacion_en(t), idioma)
    return out


def en_conversaciones():
    r = set()
    for k in range(8):
        r |= set(mensajes_de(T.conversacion(k)[1]))
    for c in T.OTRAS:
        r |= set(mensajes_de(T.conversacion_en(T.byte(48, c) | T.byte(48, c + 1) << 8)))
    return r


def textos(idioma):
    usados = en_conversaciones()
    out = []
    for b, ini, fin, nom in T.bloques():
        if nom.endswith("_cola"):
            continue
        esp = 48 if b in (48, 49) else 50
        d = ini
        while d < fin:
            t, largo = T.mensaje(esp, d)
            if not (esp == 48 and d in usados):
                out.append("`p%02d:%04X`" % (banco(esp, d), d))
                out.append("")
                out += bloque(t)
            d += largo
    return out


def de_las_tablas():
    """Los letreros de F2 y F3 (ya en la pagina de Snake)."""
    r = set()
    for tabla in (0x8046, 0x8048):
        t = palabra50(tabla)
        n = 0
        while 0x8000 <= palabra50(t + 2 * n) < 0xC000:
            r.add(palabra50(t + 2 * n))
            n += 1
    return r


def letreros(idioma):
    fuera = de_las_tablas()
    txt = open(os.path.join(T.RAIZ, "src", "metalgear2_p51.asm"), encoding="utf-8").read()
    out = ["| | |", "|---|---|"]
    for m in re.finditer(r"^; DATOS (letrero_[0-9A-F]+): letrero \((p00:49[0-9A-F]+)\).*?\n;   0x([0-9a-f]+)\.\.0x([0-9a-f]+)",
                         txt, re.M | re.S):
        d, fin, con_sitio = int(m.group(3), 16), int(m.group(4), 16), m.group(2) == "p00:4918"
        if d in fuera:
            continue
        lineas, linea = [], ""
        if con_sitio:
            d += 2
        while d < fin and T.byte(50, d) != 0xFF:
            if T.byte(50, d) == 0xFE:
                lineas.append(linea)
                linea = ""
                d += 3 if con_sitio else 1
                continue
            c, k = T.letra(50, d)
            linea += c
            d += k
        lineas.append(linea)
        out.append("| `p51:%s` | %s |" % (m.group(1)[8:], " / ".join(x.replace("|", "\\|") for x in lineas)))
    return out + [""]


# lo que es cada tipo de actor, a la vista (actores_dibujos.py y los mapas)
QUE = {
    0x01: ("soldado", "soldier"), 0x02: ("soldado", "soldier"), 0x04: ("soldado", "soldier"),
    0x05: ("soldado", "soldier"), 0x06: ("soldado", "soldier"), 0x07: ("soldado", "soldier"),
    0x09: ("soldado", "soldier"), 0x0A: ("soldado", "soldier"), 0x0C: ("soldado", "soldier"),
    0x10: ("figura pequeña de gorra roja", "small figure in a red cap"),
    0x11: ("figura pequeña con coletas", "small figure with pigtails"),
    0x12: ("animal pequeño", "small animal"), 0x13: ("cúpula azul", "blue dome"),
    0x14: ("máquina de 48 x 48 puntos", "48 x 48 dot machine"), 0x15: ("cámara", "camera"),
    0x16: ("pájaro", "bird"), 0x17: ("un punto de 4 x 4, con los pájaros", "a 4 x 4 dot, with the birds"),
}


def enemigos(idioma):
    import json
    ruta = os.path.join(T.RAIZ, "work", "enemigos", "enemigos.json")
    lista = json.load(open(ruta)) if os.path.exists(ruta) else []
    i = 0 if idioma == "es" else 1
    raiz_img = "../imagenes/enemigos/" if idioma == "es" else "imagenes/enemigos/"
    out = []
    for e in lista:
        sala = e["sala"]
        donde = (("especial %s, sala %s" if i == 0 else "special room %s, room %s") % (sala[1:3], sala[4:])
                 if sala.startswith("E") else
                 ("zona %s, sala %s" if i == 0 else "zone %s, room %s") % (sala[:2], sala[3:]))
        mas = len(e["tambien"])
        out.append("### %d. %s (%s 0x%02X)" % (e["n"] + 1, QUE.get(e["tipo"], ("?", "?"))[i].capitalize(),
                                               "tipo" if i == 0 else "kind", e["tipo"]))
        out.append("")
        out.append("![](%s%s)" % (raiz_img, e["gif"]))
        out.append("")
        out.append(("Jugado en la %s%s." if i == 0 else "Played in %s%s.") % (
            donde, ("; igual en %d salas más" % mas if i == 0 else "; the same in %d more rooms" % mas)
            if mas else ""))
        out.append("")
    return out


PARTES = {
    "enemigos": enemigos,
    "armas": lambda i: letreros_de(0x8046, i),
    "equipo": lambda i: letreros_de(0x8048, i),
    "musica": musica,
    "conversaciones": conversaciones,
    "textos": textos,
    "letreros": letreros,
}


def pon(ruta, nombre, lineas):
    s = open(ruta, encoding="utf-8").read()
    pat = re.compile(r"(<!-- generado:%s -->\n).*?(<!-- /generado -->)" % nombre, re.S)
    if not pat.search(s):
        sys.exit("%s: faltan las marcas de %s" % (ruta, nombre))
    s = pat.sub(lambda m: m.group(1) + "\n".join(lineas).rstrip() + "\n" + m.group(2), s)
    with open(ruta, "w", encoding="utf-8", newline="\n") as f:
        f.write(s)


def main(docs):
    for idioma, paginas in DONDE.items():
        base = docs if idioma == "en" else os.path.join(docs, "es")
        for nombre, pagina in paginas.items():
            lineas = PARTES[nombre](idioma)
            pon(os.path.join(base, pagina), nombre, lineas)
            print("  %s/%s: %s, %d lineas" % (idioma, pagina, nombre, len(lineas)))
    return 0


if __name__ == "__main__":
    if len(sys.argv) < 2:
        sys.exit(__doc__)
    sys.exit(main(sys.argv[1]))
