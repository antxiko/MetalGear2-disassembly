#!/usr/bin/env python3
"""Las tablas de saltos que llegan en HL: `ld hl,tabla` y `call/jp 0x424E`.

p00:424D es el despachador de Konami con la tabla pegada detras del `call`
(tools/bancos.py lo sigue solo). Pero su segunda entrada, p00:424E, salta por
la tabla que haya en HL (p00:424E: add a,a; HL + A; ld a,(hl)... jp (hl)), y
este cartucho la usa con la tabla en otro sitio: p04:8A57 `ld hl,8AD8` y
`jp nc,424E`. El trazador no ve esos destinos, y el codigo que hay detras
salia como datos (p01:6683-6787, que es la entrada 4 de la tabla de p01:65AA).

Aqui se buscan, en lo trazado, los `call`/`jp` a 0x424E con HL cargado de un
inmediato (el trazador lo apunta en sus llamadas), se mide cada tabla con el
mismo criterio que las del despachador (tools/bancos.calcula_tam: palabras
que son direcciones del cartucho, hasta el destino mas bajo de la misma
ranura o el primer byte que ya es codigo) y se escriben sus destinos como
semillas en una seccion de src/semillas.txt. Como el codigo nuevo puede
traer tablas nuevas, se repite hasta que no sale ninguna.

Las tablas se apuntan en src/tablas_hl.txt (tools/lectores.py las declara).

Uso: tablas_hl.py [--escribe]
"""
import os
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
RAIZ = os.path.dirname(AQUI)
sys.path.insert(0, AQUI)
import bancos                                    # noqa: E402
from paginas import ORG, TAM_PAGINA, nombre      # noqa: E402

ROM = open(os.path.join(RAIZ, "metalgear2.rom"), "rb").read()
SALTO_HL = 0x424E
CAB = "# --- TABLAS EN HL (seccion que reescribe tools/tablas_hl.py; no editar a mano) ---"
FIN = "# --- fin de las tablas en HL ---"
# Tablas cuyo tamano no sale del criterio: (banco, tabla) -> palabras, con
# la instruccion que lo acota
FORZADAS = {
    # p01:65A5: el indice es 0xE220 (1-4, p01:658E); la entrada 0 no se usa
    # y la 1 cae en el operando del `jp 40F0` de p01:65AB
    (1, 0x65AA): 5,
}


def tablas(t):
    """{(banco, tabla, reparto): [(banco_call, pc_call), ...]}"""
    out = {}
    for (d, b, pc, s, hl, de) in t.llamadas:
        if d != SALTO_HL or hl is None or not 0x4000 <= hl < 0xC000:
            continue
        if (b, pc) == (4, 0x8142):
            continue          # a mano, abajo
        bt = bancos.Cartucho.banco(hl, s)
        if bt is None or bt >= 64:
            continue
        out.setdefault((bt, hl, s), []).append((b, pc))
    return out


def mide(t, bt, tab, s):
    if (bt, tab) in FORZADAS:
        n = FORZADAS[(bt, tab)]
        return [bancos.Cartucho(ROM).leer(tab + 2 * k, s) | bancos.Cartucho(ROM).leer(tab + 2 * k + 1, s) << 8
                for k in range(n)]
    c = bancos.Cartucho(ROM)
    base = tab & 0xE000
    limite = base + TAM_PAGINA
    for x in range(tab, base + TAM_PAGINA):
        if (bt, ORG[bt] + (x - base)) in t.arranques:
            limite = x
            break
    dest = []
    while tab + 2 * len(dest) + 1 < limite:
        a = tab + 2 * len(dest)
        w = c.leer(a, s) | (c.leer(a + 1, s) << 8)
        if not 0x4000 <= w < 0xC000:
            break
        if (w & 0xE000) == base and tab < w < limite:
            limite = w
        dest.append(w)
        if tab + 2 * len(dest) >= limite:
            break
    return dest


def main(argv):
    escribe = "--escribe" in argv
    ruta = os.path.join(RAIZ, "src", "semillas.txt")
    vistas = {}
    for vuelta in range(8):
        t = bancos.traza_completa(ROM, os.path.join(RAIZ, "src"))[0]
        t.pliega_ram()
        # se miden todas otra vez en cada vuelta: el codigo nuevo puede
        # acortar una tabla que antes llegaba hasta el
        antes = {k: len(v[0]) for k, v in vistas.items()}
        vistas = {}
        for (bt, tab, s), sitios in sorted(tablas(t).items()):
            vistas[(bt, tab, s)] = (mide(t, bt, tab, s), sitios)
        nuevas = sum(1 for k, v in vistas.items() if antes.get(k) != len(v[0]))
        lineas, tabs = [CAB], []
        for (bt, tab, s), (dest, sitios) in sorted(vistas.items()):
            q = ", ".join("%s:%04X" % (nombre(b), pc) for b, pc in sorted(set(sitios)))
            tabs.append("%s 0x%04X %d %d %d %d  # %s" % (nombre(bt), tab, len(dest), s[0], s[1], s[2], q))
            for k, w in enumerate(dest):
                if k == 0 and (bt, tab) == (1, 0x65AA):
                    continue
                lineas.append("%s 0x%04X %d %d %d  # entrada %d de la tabla 0x%04X en HL (%s, "
                              "p00:424E)" % (nombre(bancos.Cartucho.banco(w, s) or 0), w, s[0], s[1],
                                             s[2], k, tab, q))
        # p04:813F: `ld hl,8159` y `call 424E` con A = C & 0x7F, y antes
        # p04:8148 pone el banco 8 en 0xA000 si A es 3 o pasa de 9 (los
        # demas, el 5 de quien llama). La entrada 0 es el `jr` de p04:8159 y
        # las 13-18 valen 0: no son destinos. Acaba donde empieza el codigo
        # de p04:818B: 25 palabras.
        dest = []
        for k in range(25):
            w = ROM[4 * TAM_PAGINA + 0x159 + 2 * k] | ROM[4 * TAM_PAGINA + 0x15A + 2 * k] << 8
            dest.append(w)
            if k == 0 or w == 0:
                continue
            s_ = (1, 4, 8) if k == 3 or k >= 10 else (1, 4, 5)
            lineas.append("%s 0x%04X %d %d %d  # entrada %d de la tabla 0x8159 en HL (p04:8142, "
                          "p00:424E; banco de 0xA000 de p04:8148)"
                          % (nombre(bancos.Cartucho.banco(w, s_)), w, s_[0], s_[1], s_[2], k))
        tabs.append("p04 0x8159 25 1 4 5  # p04:8142 (el banco 8 en 0xA000 para 3 y 10-24, p04:8148)")
        lineas.append(FIN)
        print("vuelta %d: %d tablas nuevas o cambiadas, %d en total" % (vuelta, nuevas, len(vistas)))
        filas = open(ruta, encoding="utf-8").read().split("\n") if os.path.exists(ruta) else \
            ["# Semillas a mano: 'pNN 0xADDR b6000 b8000 bA000  # por que'.", ""]
        if CAB in filas:
            i, f = filas.index(CAB), filas.index(FIN)
            filas[i:f + 1] = lineas
        else:
            filas += lineas + [""]
        open(ruta, "w", encoding="utf-8", newline="\n").write("\n".join(filas))
        open(os.path.join(RAIZ, "src", "tablas_hl.txt"), "w", encoding="utf-8", newline="\n").write(
            "# Tablas de saltos con la tabla en HL (p00:424E): 'pNN 0xTABLA palabras b6000 "
            "b8000 bA000  # quien salta'.\n# La escribe tools/tablas_hl.py.\n" + "\n".join(tabs) + "\n")
        if not nuevas:
            break
    for x in tabs:
        print(" ", x)
    if not escribe:
        print("(semillas escritas: con make semillas se rehacen los .entries)")
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
