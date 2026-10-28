#!/usr/bin/env python3
"""Los textos del cartucho: la fuente de la pagina 3 leida letra a letra y los
mensajes de los bancos 48-51 decodificados como los escribe el juego.

Lo leido en el listado:
- siguiente_letra (p01:66C4): un primer byte < 4 es la velocidad (p01:654F),
  y tambien el que va detras de un 0xFC (su paso 2, espera_tecla_de_ventana p01:65E9);
  0xFF el final, 0xFE salto de linea, 0xFD espera una tecla, 0xFC espera y
  el paso siguiente, 0xFB espera y el paso 4; 0x76-0x7F y 0xD4-0xDF dicen
  quien habla (0-9 y 0x0A-0x15: su nombre de la tabla de p50:8004, pinta_quien_habla
  p01:6723, seguido del caracter 0xE2); lo demas son letras.
- pinta_letra (p00:5D18): la letra c es el caracter 8 x 8 de la pagina 3 en
  ((c & 0x1F) * 8, (c >> 5) * 8) (sitio_de_caracter_c, p00:4AEA); con 0xF8
  delante, la letra del byte siguiente en la franja de Y = 0x40.
- Los mensajes van en los bancos 48-49 (0x8000-0xBFFF) o 50-51 con 0xCA97
  (bancos_del_mensaje, p01:666A): un mensaje que acaba un banco sigue en el
  otro (las "colas" de p49:A000 y p51:A000).

La fuente: volcada de la pagina 3 tras el arranque (tools/mg2run.py) y leida
mirando cada caracter (work/textos/fuente_*.png); los kanji dudosos llevan '?'
en DUDOSOS y se confirman con las frases en que salen.

Uso: textos.py fuente    -> work/textos/fuente_f0.png, fuente_f8.png
     textos.py todos     -> work/textos/textos.md (cada mensaje del listado)
     textos.py transceptor -> work/textos/transceptor.md (por numero, sus fichas)
     textos.py letreros  -> work/textos/letreros.md (los de p51)
"""
import os
import re
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)
RAIZ = os.path.join(AQUI, "..")
SAL = os.path.join(RAIZ, "work", "textos")
ROM = open(os.path.join(RAIZ, "metalgear2.rom"), "rb").read()

# franja 0 (sin 0xF8)
F0 = {0x00: "　"}
for _i, _c in enumerate("0123456789"):
    F0[0x01 + _i] = _c
for _i in range(26):
    F0[0x0B + _i] = chr(ord("A") + _i)
for _i, _c in enumerate("あいうえおかきくけこさしすせそたちつてとなにぬねのはひ"
                        "ふへほまみむめもやゆよらりるれろわをんがぎぐげござじずぜぞだぢづ"
                        "でどばびぶべぼぱぴぷぺぽぁぃぅぇぉっゃゅょ"):
    F0[0x25 + _i] = _c
for _i, _c in enumerate("アイウエオカキクケコサシスセソタチツテトナニヌネノハヒフヘホマミ"
                        "ムメモヤユヨラリルレロワヲンガギグゲゴザジズゼゾダヂヅデドバビブ"
                        "ベボヴパピプペポァィゥェォヵヶッャュョヮ"):
    F0[0x80 + _i] = _c
F0.update({0xE0: "！", 0xE1: "？", 0xE2: "『", 0xE3: "』", 0xE4: "・", 0xE5: "、",
           0xE6: "。", 0xE7: "’", 0xE8: "［", 0xE9: "］", 0xEA: "→", 0xEB: "ー",
           0xEC: "↵", 0xED: "々"})

# franja 0xF8: 128 kanji (lo de 0x80 en adelante son piezas del marcador)
F8 = {}
for _i, _c in enumerate("左供意以右央音下化火面会界外各学"
                        "分危兵気救基軍計見言者合今国空作"
                        "止私指士死次事自時治室社収所上場"
                        "出心真身水世西制生政戦潜専子前全"
                        "狙足多体大地中注的入東道特得内男"
                        "南女人年博小発動表同武部物文歩保"
                        "方法北味民命名目百間門夜野有容用"
                        "来絡本理力当立略令冷恋連路通氷安"):
    F8[_i] = _c
# sin frase en los bancos 48-51 que los confirme (los demas, leidos y confirmados
# por sus frases: 意 de 注意/意外/意味, 得 de 得意, 間 de 空間/人間, 氷 de 東西の氷...)
DUDOSOS = {0x0A, 0x1D, 0x58, 0x68}


def byte(espacio, d):
    """El byte d (0x8000-0xBFFF) de los bancos 48-49 (espacio 48) o 50-51 (50)."""
    b = espacio + (d >= 0xA000)
    return ROM[b * 0x2000 + (d & 0x1FFF)]


def nombre(n):
    """El nombre n de quien habla (p50:8004 -> su tabla)."""
    t = byte(50, 0x8004) | byte(50, 0x8005) << 8
    p = byte(50, t + 2 * n) | byte(50, t + 2 * n + 1) << 8
    s = ""
    while byte(50, p) != 0xFF:
        s += letra(50, p)[0]
        p += 1 + (byte(50, p) == 0xF8)
    return s


def letra(espacio, d):
    c = byte(espacio, d)
    if c == 0xF8:
        k = byte(espacio, d + 1)
        s = F8.get(k, "{F8 %02X}" % k)
        return (s + "?" if k in DUDOSOS else s), 2
    return F0.get(c, "{%02X}" % c), 1


def mensaje(espacio, d, nombres=True):
    """(texto, bytes): el mensaje de d como lo escribe siguiente_letra."""
    ini = d
    out = []
    if byte(espacio, d) < 4:
        d += 1                                 # la velocidad
    while True:
        c = byte(espacio, d)
        if c == 0xFF:
            d += 1
            break
        if c == 0xFE:
            out.append("\n")
        elif c in (0xFD, 0xFC):
            out.append(" ▼\n" if c == 0xFD else " ▼▼\n")
            if c == 0xFC and byte(espacio, d + 1) < 4:
                d += 1                         # una velocidad nueva (paso 2, p01:65E9)
        elif c == 0xFB:
            out.append(" ▽")
            d += 1
            break
        elif 0x76 <= c <= 0x7F or 0xD4 <= c <= 0xDF:
            n = c - 0x76 if c < 0x80 else c - 0xD4 + 0x0A
            out.append("\n" if out and out[-1] != "\n" else "")
            out.append("%s『" % (nombre(n) if nombres else "[%d]" % n))
        else:
            s, n = letra(espacio, d)
            out.append(s)
            d += n
            continue
        d += 1
    return "".join(out), d - ini


def bloques():
    """Los bloques de mensajes del listado: (banco, desde, hasta, nombre)."""
    r = []
    for b in (48, 49, 50, 51):
        txt = open(os.path.join(RAIZ, "src", "metalgear2_p%02d.asm" % b), encoding="utf-8").read()
        for m in re.finditer(r"^; DATOS (mensajes?_[0-9A-F]+(?:_cola)?):.*?\n;   0x([0-9a-f]+)\.\.0x([0-9a-f]+)",
                             txt, re.M | re.S):
            r.append((b, int(m.group(2), 16), int(m.group(3), 16), m.group(1)))
    return r


def todos():
    os.makedirs(SAL, exist_ok=True)
    out = ["# Los textos de Metal Gear 2 (bancos 48-51), decodificados con tools/textos.py", ""]
    n = 0
    for b, ini, fin, nom in bloques():
        if nom.endswith("_cola"):
            continue
        esp = 48 if b in (48, 49) else 50
        d = ini
        while d < fin:
            t, largo = mensaje(esp, d)
            out.append("## p%02d:%04X (%s)" % (b if d < 0xA000 or b in (49, 51) else b + 1, d, nom))
            out.append("")
            out.append(t)
            out.append("")
            n += 1
            d += largo
    open(os.path.join(SAL, "textos.md"), "w", encoding="utf-8").write("\n".join(out))
    print(n, "mensajes ->", os.path.join(SAL, "textos.md"))


def fuente():
    from mg2run import Mg2
    from PIL import Image, ImageDraw
    os.makedirs(SAL, exist_ok=True)
    m = Mg2()
    m.llama(0x9E2B)
    pg = m.vdp.pagina(3, 256)
    for nom, y0 in (("f0", 0), ("f8", 0x40)):
        E = 4
        H = Image.new("RGB", (32 * (8 * E + 6) + 20, 8 * (8 * E + 16)), (40, 40, 40))
        d = ImageDraw.Draw(H)
        for c in range(256):
            x, y = (c & 31) * 8, y0 + (c >> 5) * 8
            X, Y = 20 + (c & 31) * (8 * E + 6), (c >> 5) * (8 * E + 16) + 12
            H.paste(pg.crop((x, y, x + 8, y + 8)).resize((8 * E, 8 * E), Image.NEAREST), (X, Y))
            d.text((X, Y - 11), "%02X" % c, fill=(255, 255, 0))
        H.save(os.path.join(SAL, "fuente_%s.png" % nom))


# ----------------------------------------------------------------- transceptor
# La lista de 16 numeros de 0xD7A0 sale de p09:B67E (d790_al_empezar, p09:B62F)
# y la pantalla los marca como 140.xx (0xD790, BCD). El sitio del numero en la
# lista es la conversacion de p48:8037 (conversacion_del_numero p09:BC00 ->
# conversacion_a p01:63C0); quien habla en un mensaje da su sitio por p09:BFE1
# (numero_del_mensaje, p09:BEB5). Con los bits 3-6 de 0xD7E4 (la partida
# guardada) el sitio 0 pasa a 0x66 o 0x24, el 1 a 0x98 y el 3 a 0x76.
def numeros():
    return [ROM[9 * 0x2000 + 0xB67E - 0xA000 + i] for i in range(16)]


def sitio_de_quien(n):
    """El sitio de la lista 0xD7A0 de quien habla n (p09:BFE1)."""
    return ROM[9 * 0x2000 + 0xBFE1 - 0xA000 + n]


def conversacion(sitio):
    """Las fichas de la conversacion del sitio (p48:8037): recorre_conversacion
    (p01:608B). Cada ficha [cabeza][banderas...][zona sala si bit 7][accion][mensaje]
    y detras 0xFE [espera][accion][mensaje] las que siguen; 0xFE en la cabeza, una
    ficha vacia de 5 bytes; 0xFF acaba. La cabeza: bits 0-3 cuantas banderas
    (0xD7D0, mira_bandera p03:B0F6); sin el bit 4 vale con todas puestas; con el
    bit 4, con la ultima puesta y las demas no (la primera puesta que encuentra
    mira_condiciones, p01:6104, tiene que ser la ultima); el bit 7: ademas la zona
    y la sala (zona 0x14 o mas: la especial del byte siguiente). Accion 0: el
    mensaje; 1: uno al azar de una lista [n][n mensajes][n umbrales 0-99]."""
    t = byte(48, 0x8037 + 2 * sitio) | byte(48, 0x8038 + 2 * sitio) << 8
    return t, conversacion_en(t)


# las otras conversaciones de la cabecera de p48 (sin numero): 800E las llamadas
# (llamada_800e, p03:B108) y 8002-800A, 8010-8014
OTRAS = (0x8002, 0x8004, 0x8006, 0x8008, 0x800A, 0x800E, 0x8010, 0x8012, 0x8014)


def conversacion_en(t):
    """Las fichas de la conversacion de t (p48), como conversacion()."""
    fichas = []
    d = t
    while byte(48, d) != 0xFF:
        c = byte(48, d)
        if c == 0xFE:
            d += 5
            continue
        n = c & 15
        banderas = [byte(48, d + 1 + i) for i in range(n)]
        d += 1 + n
        sitio_ = None
        if c & 0x80:
            sitio_ = (byte(48, d), byte(48, d + 1))
            d += 2
        acciones = []
        espera = 0
        while True:
            a = byte(48, d)
            m = byte(48, d + 1) | byte(48, d + 2) << 8
            acciones.append((espera, a, m))
            d += 3
            if byte(48, d) == 0xFE:
                espera = byte(48, d + 1)
                d += 2
                continue
            break
        fichas.append({"cabeza": c, "banderas": banderas, "sitio": sitio_, "acciones": acciones,
                       "modo": "ultima" if c & 0x10 else "todas"})
    return fichas


def cumple(f, puestas, zona, sala, especial):
    """Si la ficha f vale con las banderas puestas (set) en esa sala."""
    b = f["banderas"]
    if not b:
        ok = True
    elif f["modo"] == "todas":
        ok = all(x in puestas for x in b)
    else:
        primera = next((k for k, x in enumerate(b) if x in puestas), None)
        ok = primera == len(b) - 1
    if not ok:
        return False
    if f["sitio"]:
        z, s = f["sitio"]
        return (especial == s) if z >= 0x14 else (z == zona and s == sala)
    return True


def al_azar(m):
    """Los mensajes de una lista al azar (mensaje_al_azar, p01:6142)."""
    n = byte(48, m)
    ms = [byte(48, m + 1 + 2 * i) | byte(48, m + 2 + 2 * i) << 8 for i in range(n)]
    um = [byte(48, m + 1 + 2 * n + i) for i in range(n)]
    return list(zip(ms, um))


def quien_habla(esp, d):
    """Los que hablan en el mensaje de d (sus numeros de p50:8004)."""
    r = []
    if byte(esp, d) < 4:
        d += 1
    while byte(esp, d) not in (0xFF, 0xFB):
        c = byte(esp, d)
        if 0x76 <= c <= 0x7F or 0xD4 <= c <= 0xDF:
            n = c - 0x76 if c < 0x80 else c - 0xD4 + 0x0A
            if n not in r:
                r.append(n)
        d += 2 if c == 0xF8 else 1
    return r


def transceptor():
    """work/textos/transceptor.md: por numero, quien contesta y sus fichas en orden."""
    os.makedirs(SAL, exist_ok=True)
    nums = numeros()
    out = ["# El transceptor de Metal Gear 2 (tools/textos.py transceptor)", "",
           "La lista de 0xD7A0 (p09:B67E): " + " ".join("%02X" % x for x in nums), "",
           "Quien habla -> sitio (p09:BFE1): " + ", ".join(
               "%s %d" % (nombre(n), sitio_de_quien(n)) for n in range(0x14)), ""]
    def fichas_md(fs):
        for i, f in enumerate(fs):
            cond = ("banderas %s (%s)" % (" ".join("%02X" % b for b in f["banderas"]), f["modo"])
                    if f["banderas"] else "sin banderas")
            if f["sitio"]:
                z, x = f["sitio"]
                cond += (", especial %02X" % x) if z >= 0x14 else (", zona %02X sala %02X" % (z, x))
            out.append("### ficha %d: %s" % (i, cond))
            out.append("")
            for e, a, p in f["acciones"]:
                if a == 0:
                    lista = [(p, None)]
                elif a == 1:
                    lista = al_azar(p)
                else:
                    out.append("(accion %d: nada)" % a)
                    continue
                for mm, u in lista:
                    if not mm:
                        out.append("- (sin mensaje%s)" % ("" if u is None else ", hasta %d" % u))
                        continue
                    t, _ = mensaje(48, mm)
                    out.append("- p%02d:%04X%s%s:" % (48 if mm < 0xA000 else 49, mm,
                                                     " tras %d" % e if e else "",
                                                     "" if u is None else ", al azar hasta %d" % u))
                    out.append("")
                    out.append("    " + t.replace("\n", "\n    "))
                    out.append("")
    for k in range(8):
        t, fs = conversacion(k)
        quienes = []
        for f in fs:
            for e, a, p in f["acciones"]:
                ms = [p] if a == 0 else [mm for mm, u in al_azar(p)] if a == 1 else []
                for mm in ms:
                    if mm:
                        for q in quien_habla(48, mm):
                            if q not in quienes:
                                quienes.append(q)
        out.append("## 140.%02X: sitio %d, conversacion p48:%04X (%d fichas)" % (nums[k], k, t, len(fs)))
        out.append("")
        out.append("Hablan: " + ", ".join(nombre(q) for q in quienes))
        out.append("")
        fichas_md(fs)
    for c in OTRAS:
        t = byte(48, c) | byte(48, c + 1) << 8
        out.append("## La conversacion de p48:%04X (p48:%04X)" % (c, t))
        out.append("")
        fichas_md(conversacion_en(t))
    open(os.path.join(SAL, "transceptor.md"), "w", encoding="utf-8").write("\n".join(out))
    print("->", os.path.join(SAL, "transceptor.md"))


def letreros():
    """work/textos/letreros.md: los letreros de p51 (letrero p00:4950: letras
    hasta 0xFF, 0xFE salta de linea; los de p00:4918 llevan [fila][columna]
    delante de cada linea)."""
    txt = open(os.path.join(RAIZ, "src", "metalgear2_p51.asm"), encoding="utf-8").read()
    out = ["# Los letreros de p51 (tools/textos.py letreros)", ""]
    n = 0
    for m in re.finditer(r"^; DATOS (letrero_[0-9A-F]+): letrero \((p00:49[0-9A-F]+)\).*?\n;   0x([0-9a-f]+)\.\.0x([0-9a-f]+)",
                         txt, re.M | re.S):
        d, fin, con_sitio = int(m.group(3), 16), int(m.group(4), 16), m.group(2) == "p00:4918"
        lineas, linea = [], ""
        if con_sitio:
            d += 2
        while d < fin:
            c = byte(50, d)
            if c == 0xFF:
                break
            if c == 0xFE:
                lineas.append(linea)
                linea = ""
                d += 3 if con_sitio else 1
                continue
            t, k = letra(50, d)
            linea += t
            d += k
        lineas.append(linea)
        out.append("- p51:%s: %s" % (m.group(1)[8:], " / ".join(lineas)))
        n += 1
    open(os.path.join(SAL, "letreros.md"), "w", encoding="utf-8").write("\n".join(out))
    print(n, "letreros ->", os.path.join(SAL, "letreros.md"))


if __name__ == "__main__":
    {"fuente": fuente, "todos": todos, "transceptor": transceptor, "letreros": letreros}[sys.argv[1]]()
