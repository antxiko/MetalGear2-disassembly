#!/usr/bin/env python3
"""Anota lo que ya esta identificado: rutinas con nombre, RAM y cambios de banco.

Una vez se sabe que 0xC130 es la sala no tiene merito -ni fiabilidad- escribir
a mano "la sala" las cien veces que aparece. Esto lo hace de una vez y sin
equivocarse, en una seccion delimitada de src/pNN.notes que reescribe entera
cada vez.

- RUTINAS: el nombre de cada rutina (directiva L) y, en cada `call`/`jp` que
  va a ella, un comentario con lo que hace.
- RAM: en cada instruccion que nombra una direccion de la tabla, que es.
- CAMPOS: en cada `(ix+n)` de un tramo en el que IX es una ficha conocida
  (los actores, los proyectiles: FICHAS en anotaciones.py).
- Los cambios de banco (`ld (0x6000/0x8000/0xA000),a`).

A QUE BANCO VA UNA LLAMADA. Una `call 0xA123` desde otro banco no dice a cual
de seis bancos va. Se mira, por este orden: el banco 0 (0x4000-0x5FFF, fijo),
el propio banco si cae en su ventana, lo que midio el trazador de cartucho
entero (los comentarios "pNN:XXXX" de src/pMM.entries: esa instruccion va al
banco MM) y, si no, el reparto que hay en ese momento (el trio del banco,
cambiado por las llamadas de CAMBIOS_DE_BANCO).

CADA ENTRADA DE LA TABLA LLEVA DE DONDE SALE. Lo que no se sabe no esta en la
tabla. Donde ya hay un comentario escrito a mano no se pone otro.

Lo propio del juego (rutinas, RAM, campos) esta en tools/anotaciones.py: aqui
solo la maquinaria.

Uso: anota.py              informa de cuantos pondria
     anota.py --escribe    y los escribe
"""
import glob
import os
import re
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
RAIZ = os.path.dirname(AQUI)
sys.path.insert(0, AQUI)

from paginas import ORG                                    # noqa: E402
from anotaciones import (BANCOS, CAMBIOS_DE_BANCO, FICHAS,  # noqa: E402
                         RAM, RAM16, RUTINAS, trio)
try:
    # tramos (banco, desde, hasta) en los que la RAM tiene otro uso y sus
    # nombres no valen
    from anotaciones import RAM_PRESTADA                       # noqa: E402
except ImportError:
    RAM_PRESTADA = ()
try:
    from anotaciones import SCC                                # noqa: E402
except ImportError:
    SCC = {}
try:
    # el banco del motor de sonido, el unico que escribe en el SCC
    from anotaciones import SCC_BANCO                          # noqa: E402
except ImportError:
    SCC_BANCO = 6
try:
    # los campos de las fichas, descritos por su direccion fija
    from anotaciones import FICHAS_FIJAS                       # noqa: E402
except ImportError:
    FICHAS_FIJAS = set()
try:
    # el mapper de cada juego: registro -> ventana que cambia
    from anotaciones import REGISTROS_MAPPER                  # noqa: E402
except ImportError:
    REGISTROS_MAPPER = {0x6000: "0x6000", 0x8000: "0x8000", 0xA000: "0xA000"}

INI = "# --- ANOTACIONES AUTOMATICAS (seccion que reescribe tools/anota.py; no editar a mano) ---"
FIN = "# --- fin de las anotaciones de anota.py ---"

RAM_DESDE = 0xC000


def ruta_listado(b):
    """src/<juego>_pNN.asm: el nombre del juego sale del propio fichero."""
    hallados = glob.glob(os.path.join(RAIZ, "src", "*_p%02d.asm" % b))
    if len(hallados) != 1:
        raise SystemExit("no hay un solo src/*_p%02d.asm: %s" % (b, hallados))
    return hallados[0]


def listado(b):
    filas = []
    for ln in open(ruta_listado(b), encoding="utf-8"):
        m = re.match(r"\t([a-z][^\t;]*?)\s*;([0-9a-f]{4})", ln)
        if m and not ln.startswith(("\tdefb", "\tdefw")):
            filas.append((int(m.group(2), 16), m.group(1).strip()))
    return filas


def medidas():
    """(banco, pc) -> banco de destino, de los comentarios de src/pMM.entries."""
    fuera = {}
    for ruta in glob.glob(os.path.join(RAIZ, "src", "p[0-9][0-9].entries")):
        mm = int(os.path.basename(ruta)[1:3])
        for ln in open(ruta, encoding="utf-8"):
            m = re.match(r"^0x[0-9A-Fa-f]+\s+#\s+p(\d\d):([0-9A-Fa-f]{4}) (?:call|jp|jr)", ln)
            if m:
                fuera.setdefault((int(m.group(1)), int(m.group(2), 16)), set()).add(mm)
    for k, v in medidas_de_la_traza().items():
        fuera.setdefault(k, set()).update(v)
    # una llamada que el trazador vio ir a dos bancos (el banco 0 corre con
    # cualquiera en las ventanas) no se sabe a cual va: fuera
    return {k: v.pop() for k, v in fuera.items() if len(v) == 1}


def medidas_de_la_traza():
    """(banco, pc) -> {bancos de destino} de TODAS las llamadas y saltos del
    trazado de cartucho entero (los .entries solo guardan la primera razon de
    cada entrada). El trazado tarda; se guarda en work/medidas_traza.json y se
    rehace cuando cambia algo de lo que lo hace."""
    import json
    cache = os.path.join(RAIZ, "work", "medidas_traza.json")
    fuentes = [os.path.join(RAIZ, "tools", "bancos.py")] + glob.glob(
        os.path.join(RAIZ, "src", "*.entries")) + [
        os.path.join(RAIZ, "src", n) for n in ("semillas.txt", "sitios.txt", "datos.txt", "tablas.txt")]
    nueva = max(os.path.getmtime(f) for f in fuentes if os.path.exists(f))
    if os.path.exists(cache) and os.path.getmtime(cache) >= nueva:
        return {tuple(int(x, 16) for x in k.split(":")): set(v)
                for k, v in json.load(open(cache, encoding="utf-8")).items()}
    import bloques
    t = bloques.trazador()
    sale = {}
    for d, b, pc, s, *_ in t.llamadas:
        if d is None or not 0x6000 <= d < 0xC000 or s is None:
            continue
        bd = s[(d - 0x6000) >> 13]
        if bd is not None and bd != b:
            sale.setdefault((b, pc), set()).add(bd)
    os.makedirs(os.path.dirname(cache), exist_ok=True)
    json.dump({"%x:%x" % k: sorted(v) for k, v in sale.items()},
              open(cache, "w", encoding="utf-8"))
    return sale


def a_mano(b):
    """Direcciones con C escrita fuera de la seccion, y los L ya puestos."""
    ruta = os.path.join(RAIZ, "src", "p%02d.notes" % b)
    cs, ls, dentro = set(), set(), False
    for ln in open(ruta, encoding="utf-8"):
        if ln.startswith(INI):
            dentro = True
        elif ln.startswith(FIN):
            dentro = False
        elif not dentro and ln.startswith("C "):
            cs.add(int(ln.split()[1], 0))
        elif not dentro and ln.startswith("L "):
            ls.add(int(ln.split()[1], 0))
    return cs, ls


def num(txt):
    txt = txt.strip()
    return int(txt[:-1], 16) if txt.endswith("h") else int(txt, 0)


def fichas_de(filas, b=None):
    """Para cada instruccion, los campos de la ficha a la que apunta IX (o
    None). Cada ficha de FICHAS vale desde un `ld ix,nn` con nn en sus cargas
    hasta el siguiente `ld ix` con otra cosa, un `ret` o un `jp`; un tramo sin
    carga de IX no cuenta, salvo dentro de los tramos de la ficha."""
    fuera = {}
    for cargas, por_banco, campos in FICHAS:
        tramos = por_banco.get(b, ())

        def defecto(a):
            return any(i <= a < f for i, f in tramos)

        # cargado: lo que dejo el ultimo `ld ix`/`pop ix` del tramo; sin el,
        # manda el tramo de la tabla en el que cae cada instruccion
        cargado = None
        for k, (a, t) in enumerate(filas):
            m = re.match(r"ld ix,0([0-9a-f]{4})h$", t)
            if m:
                cargado = int(m.group(1), 16) in cargas
            elif t.startswith(("ld ix", "pop ix")):
                cargado = False
            if (defecto(a) if cargado is None else cargado) and k not in fuera:
                fuera[k] = campos
            if t.startswith(("ret", "jp ")) and not re.match(r"ret [a-z]", t):
                cargado = None
    return fuera


def ventanas_de(filas, b):
    """Para cada instruccion, {ventana: banco} visible: el trio del banco al
    empezar cada tramo (tras `ret` o `jp`), cambiado por las llamadas a las
    rutinas de CAMBIOS_DE_BANCO."""
    # una vez bautizadas, las rutinas del mapper salen en el listado por su
    # nombre (las del banco 0 y las del propio banco), no como L_xxxx
    por_nombre = {nom: aa for (bb, aa), (nom, _) in RUTINAS.items() if bb in (0, b)}
    fuera, ahora = {}, trio(b)
    for k, (a, t) in enumerate(filas):
        fuera[k] = dict(ahora)
        m = re.match(r"(?:call|jp)\s+(?:(?:nz|z|nc|c|po|pe|p|m),)?(?:L_([0-9A-F]{4})|0([0-9a-f]{4})h|([a-z_][a-z0-9_]*))$", t)
        if m:
            d = int(m.group(1) or m.group(2), 16) if not m.group(3) else por_nombre.get(m.group(3))
            ahora.update(CAMBIOS_DE_BANCO.get(d, {}))
        if t == "ret" or (t.startswith("jp ") and "," not in t):
            ahora = trio(b)
    return fuera


def destino_de(b, a, dest, k, ventanas, medido):
    if dest < 0x6000:
        return 16 if b == 16 else 0       # el sonido corre con el 16 en 0x4000
    # lo que hay en la RAM (el BDOS en 0xF37D): RUTINAS lo lleva con banco -1
    if dest >= 0xC000:
        return -1
    if b and ORG[b] <= dest < ORG[b] + 0x2000:
        return b
    if (b, a) in medido:
        return medido[(b, a)]
    return (ventanas or {}).get(k, {}).get(dest & 0xE000)


_BLOQUES = None


def bloques_de_datos():
    """{(banco, inicio): (nombre, texto corto)} de las directivas D de las notas."""
    global _BLOQUES
    if _BLOQUES is None:
        _BLOQUES = {}
        for ruta in glob.glob(os.path.join(RAIZ, "src", "p[0-9][0-9].notes")):
            bb = int(os.path.basename(ruta)[1:3])
            for ln in open(ruta, encoding="utf-8"):
                if ln.startswith("D "):
                    q = ln.rstrip().split(None, 4)
                    if len(q) >= 4 and not q[3].startswith(("resto_", "relleno")):
                        txt = q[4] if len(q) > 4 else ""
                        corto = re.split(r"[(;:]", txt)[0].strip()
                        _BLOQUES[(bb, int(q[1], 0))] = (q[3], corto[:90])
    return _BLOQUES


def a_datos(b, a, t, k, ventanas, medido):
    """`ld hl,nn` y compania con nn en el principio de un bloque de datos."""
    m = re.match(r"ld (hl|de|bc|ix|iy),0([4-9ab][0-9a-f]{3})h$", t)
    if not m:
        return None
    v = int(m.group(2), 16)
    if v < 0x6000:
        cand = [16 if b == 16 else 0]
    else:
        cand = []
        vis = (ventanas or {}).get(k, {}).get(v & 0xE000)
        if b and ORG[b] == (v & 0xE000):
            cand.append(b)
        if vis is not None:
            cand.append(vis)
    for bb in cand:
        if bb is not None and bb < 64:
            org = ORG[bb] if v >= 0x6000 or bb in (0, 16) else None
            if org is None:
                continue
            x = org + (v & 0x1FFF) if v >= 0x6000 else v
            hit = bloques_de_datos().get((bb, x))
            if hit:
                nom, corto = hit
                return "%s: %s" % (nom, corto) if corto else nom
    return None


def comentario(b, filas, k, fichas, ventanas=None, medido=None):
    a, t = filas[k]
    d = a_datos(b, a, t, k, ventanas, medido)
    if d:
        return d
    # llamadas y saltos a rutinas con nombre: si el listado ya lleva el nombre
    # puesto (las del propio banco), basta con decir que hace
    m = re.match(r"(?:call|jp)\s+(?:(?:nz|z|nc|c|po|pe|p|m),)?([a-z_][a-z0-9_]*)$", t)
    if m and not re.match(r"^(?:hl|ix|iy)$", m.group(1)):
        for (bb, aa), (nom, que) in RUTINAS.items():
            if nom == m.group(1) and bb in (0, b):
                return "%s: %s" % (nom, que)
    m = re.match(r"(call|jp)\s+(?:(?:nz|z|nc|c|po|pe|p|m),)?(?:L_([0-9A-F]{4})|0([0-9a-f]{4})h)$", t)
    if m:
        dest = int(m.group(2) or m.group(3), 16)
        banco = destino_de(b, a, dest, k, ventanas, medido or {})
        hecho = RUTINAS.get((banco, dest)) if banco is not None else None
        if hecho:
            return "%s: %s" % hecho
        # sin nombre todavia: el banco al que va, si lo midio el trazador de
        # cartucho entero (no la suposicion de las ventanas)
        if (b, a) in (medido or {}) and banco not in (None, b) and banco >= 0:
            return "p%02d:%04X" % (banco, dest)
    # los campos de la ficha del actor
    if fichas.get(k):
        mm = re.search(r"\(ix\+0?([0-9a-f]+)h?\)", t)
        if mm:
            n = int(mm.group(1), 16)
            que = fichas[k].get(n)
            if que:
                op = t.split()[0]
                if op == "ld" and t.startswith("ld (ix"):
                    v = t.split(",", 1)[1]
                    if re.match(r"^[a-z]$", v):
                        return "guarda %s" % que
                    v = "0x%02X" % num(v) if re.match(r"^[0-9a-f]+h$", v) else v
                    return "%s = %s" % (que, v)
                if op == "ld":
                    return "lee %s" % que
                if op in ("inc", "dec"):
                    return ("sube " if op == "inc" else "baja ") + que
                if op == "bit":
                    return "mira el bit %s de %s" % (t.split()[1].split(",")[0], que)
                if op in ("set", "res"):
                    return "%s el bit %s de %s" % ("pone a uno" if op == "set" else "pone a cero",
                                                   t.split()[1].split(",")[0], que)
                if op in ("cp", "sub", "add", "adc", "sbc", "and", "or", "xor"):
                    return {"cp": "compara con ", "sub": "le resta ", "add": "le suma ",
                            "adc": "le suma ", "sbc": "le resta ", "and": "AND con ", "or": "OR con ",
                            "xor": "XOR con "}[op] + que
    # cambios de banco
    m = re.match(r"ld \(0([0-9a-f]{4})h\),a$", t)
    if m and int(m.group(1), 16) in REGISTROS_MAPPER:
        # 0x3F en 0x9000 no es un banco: abre los registros del SCC en 0x9800
        if int(m.group(1), 16) == 0x9000 and k and filas[k - 1][1] == "ld a,03fh":
            return "0x3F en 0x9000: los registros del SCC en 0x9800"
        return "el mapper: pone en %s el banco de A" % REGISTROS_MAPPER[int(m.group(1), 16)]
    # los registros del SCC
    m = re.match(r"ld \(0(98[89][0-9a-f])h\),a$", t)
    if m and b == SCC_BANCO and int(m.group(1), 16) in SCC:
        return "al SCC: " + SCC[int(m.group(1), 16)]
    # RAM (salvo en los tramos donde el juego la usa para otra cosa)
    if any(bb == b and i <= a < f for bb, i, f in RAM_PRESTADA):
        return None
    m16 = re.match(r"ld (?:(hl|de|bc|ix|iy|sp),\(0([c-f][0-9a-f]{3})h\)|\(0([c-f][0-9a-f]{3})h\),(hl|de|bc|ix|iy))$", t)
    if m16:
        v = int(m16.group(2) or m16.group(3), 16)
        if v in RAM16:
            return ("lee " if m16.group(1) else "guarda ") + RAM16[v]
        if v in RAM:
            # si la descripcion ya dice que es de 16 bits, no se repite
            resto = "" if "16 bits" in RAM[v][0] else " y el byte siguiente (16 bits)"
            return ("lee " if m16.group(1) else "guarda ") + RAM[v][0] + resto
    for x in re.findall(r"\b0([c-f][0-9a-f]{3})h\b", t):
        v = int(x, 16)
        if v in RAM and v >= RAM_DESDE:
            que = RAM[v][0]
            if re.match(r"ld \(0%04xh\)," % v, t):
                return "guarda %s" % que
            if re.match(r"ld [a-z]+,\(0%04xh\)$" % v, t):
                return "lee %s" % que
            if re.match(r"ld (hl|de|bc|ix|iy),0%04xh$" % v, t):
                # un campo suelto de una ficha no se apunta: ese numero
                # suele ser otra cosa (el disco cambia 0xE280-0xF37F)
                if v in FICHAS_FIJAS:
                    return None
                return "apunta a %s" % que
            if v in FICHAS_FIJAS:
                return None
            return que
    return None


def main(argv):
    total = 0
    medido = medidas()
    for b in BANCOS:
        filas = listado(b)
        cs, ls = a_mano(b)
        fichas = fichas_de(filas, b)
        ventanas = ventanas_de(filas, b)
        lineas = []
        for (bb, aa), (nom, que) in sorted(RUTINAS.items()):
            if bb == b and aa not in ls:
                lineas.append("L 0x%04X %s %s" % (aa, nom, que))
        n = 0
        for k, (a, t) in enumerate(filas):
            if a in cs:
                continue
            c = comentario(b, filas, k, fichas, ventanas, medido)
            if c:
                lineas.append("C 0x%04X %s" % (a, c))
                n += 1
        total += n
        print("p%02d: %d comentarios, %d nombres" % (b, n, sum(1 for x in lineas if x.startswith("L "))))
        if "--escribe" in argv:
            ruta = os.path.join(RAIZ, "src", "p%02d.notes" % b)
            viejas = open(ruta, encoding="utf-8").read().split("\n")
            nuevas, dentro = [], False
            for ln in viejas:
                if ln.startswith(INI):
                    dentro = True
                    continue
                if ln.startswith(FIN):
                    dentro = False
                    continue
                if not dentro:
                    nuevas.append(ln)
            while nuevas and not nuevas[-1].strip():
                nuevas.pop()
            nuevas += ["", INI] + lineas + [FIN, ""]
            open(ruta, "w", encoding="utf-8", newline="\n").write("\n".join(nuevas))
    print("en total: %d comentarios" % total)


if __name__ == "__main__":
    main(sys.argv)
