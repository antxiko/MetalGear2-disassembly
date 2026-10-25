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


LISTAS_FASE = 0xB40C    # p06: 11 punteros, uno por cada valor de 0xCA22
N_FASES = 11


def listas_fase():
    """p01:7D19: p06:B40C + 2 x 0xCA22 da una lista de grupos [zona, zona...,
    0xFE][destino lo hi] que acaba en [0xFF][destino]: el destino es el de
    la zona 0xCA4A, o el de detras del 0xFF (p01:7D22). Devuelve
    [(fase, ini, fin, [destinos])]."""
    def r(a):
        return ROM[6 * TAM_PAGINA + a - 0xA000]
    out = []
    for k in range(N_FASES):
        a = x = r(LISTAS_FASE + 2 * k) | r(LISTAS_FASE + 2 * k + 1) << 8
        dest = []
        while r(x) != 0xFF:
            while r(x) != 0xFE:
                x += 1
            dest.append(r(x + 1) | r(x + 2) << 8)
            x += 3
        dest.append(r(x + 1) | r(x + 2) << 8)
        out.append((k, a, x + 3, dest))
    return out


def listas_7ce6():
    """Los destinos de las listas de p06:B40C. p01:7CE6 los devuelve en HL con
    los bancos 1-2-3 (p01:7CEC) y p01:73C7 salta con `jp (hl)`; p02:8EB9 pone
    antes el 9 en 0xA000 (p00:41C2) y salta en p02:8EBF."""
    vistos, lineas = set(), []
    for k, a, f, dest in listas_fase():
        for w in dest:
            for s_ in ((1, 2, 3), (1, 2, 9)):
                if (w, s_) in vistos:
                    continue
                vistos.add((w, s_))
                lineas.append("p01 0x%04X %d %d %d  # destino de la lista de 0xCA22 = %d (p06:%04X; "
                              "p01:7CE6 y jp (hl) en %s)" % (w, s_[0], s_[1], s_[2], k, a,
                                                              "p01:73C7" if s_[2] == 3 else "p02:8EBF"))
    return lineas


def saltos_por_parametro():
    """Los `jp (hl)` con la rutina que les pasan en HL, que el trazador no
    sigue:
      - p04:86DD: p04:86D0/86D5 saltan al HL de quien las llama si 0xC692 /
        0xC693 no es 0 (la musica pendiente): `ld hl,6BCC` en p05:A5F9,
        AAFB, AC27, B2B8, B578, p10:AA7D y p14:ABA5; `ld hl,6AEE` en p15:B8F2.
      - p02:8A7A: la musica que espera en 0xCA19 (p02:8A3D). La guardan con
        un inmediato p00:554B (6B85), p02:8A2A (6B89), p09:A049 (6B45),
        p09:A68A (6B41), p09:BB20 (6B6D); p02:8A4F la cambia por 6B89 si es
        6A11, y p02:8AA8/8AAD/8ABC entran con 6B61, 6B79 y 6B3D. Las otras
        (p00:5B5C, p01:7C91, p04:94C0) la sacan de p01:7CE6: las listas de
        p06:B40C, ya puestas."""
    out = []
    for w, s_, por in ((0x6BCC, (1, 4, 5), "p05:A5F9"), (0x6BCC, (1, 4, 10), "p10:AA7D"),
                       (0x6BCC, (1, 4, 14), "p14:ABA5"), (0x6AEE, (1, 4, 15), "p15:B8F2")):
        out.append("p01 0x%04X %d %d %d  # el HL de %s, jp (hl) en p04:86DD" % (w, s_[0], s_[1], s_[2], por))
    for w, por in ((0x6B85, "p00:554B"), (0x6B89, "p02:8A2A"), (0x6B45, "p09:A049"),
                   (0x6B41, "p09:A68A"), (0x6B6D, "p09:BB20"), (0x6B61, "p02:8AA8"),
                   (0x6B79, "p02:8AAD"), (0x6B3D, "p02:8ABC"), (0x6A11, "p02:8A47")):
        out.append("p01 0x%04X 1 2 3  # la musica pendiente de 0xCA19 (%s), jp (hl) en p02:8A7A"
                   % (w, por))
    # p16:4D41: las ordenes 0xD0-0xFE de la partitura saltan por la tabla de
    # p16:4D52 (HL = 4D52 + 2 x (orden - 0xD0); jp (hl) en p16:4D51): 47
    # palabras, hasta el codigo de la primera (p16:4DB0). El sonido corre con
    # 16-17-18-19 (el 16 en 0x4000: cartucho.BANCO_4000).
    for k in range(47):
        a = 16 * TAM_PAGINA + 0xD52 + 2 * k
        w = ROM[a] | ROM[a + 1] << 8
        out.append("p16 0x%04X 17 18 19  # orden 0x%02X de la partitura: tabla p16:4D52 (jp (hl) "
                   "en p16:4D51)" % (w, 0xD0 + k))
    return out


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
        lineas += listas_7ce6()
        lineas += saltos_por_parametro()
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
