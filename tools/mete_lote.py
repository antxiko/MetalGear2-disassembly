#!/usr/bin/env python3
"""Mete un lote de notas escritas a mano: las L (nombre de rutina) van a
src/rutinas.txt con la C de su misma direccion como descripcion, y el resto
(C, B, D) a src/pNN.notes por tools/mete_notas.py.

Formato del lote, una por linea: "pNN L 0xDIR nombre", "pNN C 0xDIR texto"...

Uso: mete_lote.py <fichero>
"""
import os
import subprocess
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
RAIZ = os.path.dirname(AQUI)
RUTINAS = os.path.join(RAIZ, "src", "rutinas.txt")
CAB = '# Rutinas con nombre, leidas en el listado: "pNN 0xDIR nombre  que hace" (las carga tools/anotaciones.py)'


def main(argv):
    filas = [l.rstrip("\n") for l in open(argv[1], encoding="utf-8")
             if l.strip() and not l.startswith("#")]
    cs, nombres = {}, {}
    for l in filas:
        p, t, a, txt = l.split(" ", 3)
        if t == "C":
            cs.setdefault((p, int(a, 0)), txt)
        elif t == "L":
            nombres[(p, int(a, 0))] = txt.strip()
    viejas = {}
    if os.path.exists(RUTINAS):
        for ln in open(RUTINAS, encoding="utf-8"):
            if ln.strip() and not ln.startswith("#"):
                cab, _, que = ln.rstrip("\n").partition("  ")
                p, a, nom = cab.split()
                viejas[(p, int(a, 0))] = (nom, que)
    for k, nom in nombres.items():
        viejas[k] = (nom, cs.get(k, viejas.get(k, ("", ""))[1]))
    # pasmo no admite como etiqueta una instruccion ni dos iguales en un banco
    RESERVADAS = {"out", "in", "ld", "jp", "jr", "call", "ret", "push", "pop", "add", "sub",
                  "and", "or", "xor", "cp", "inc", "dec", "nop", "halt", "di", "ei", "rst", "set",
                  "res", "bit", "neg", "daa", "ex", "exx", "djnz", "org", "equ", "defb", "defw"}
    vistos = {}
    for (p, a), (nom, _) in viejas.items():
        if nom.lower() in RESERVADAS:
            sys.exit("nombre reservado %s en %s 0x%04X" % (nom, p, a))
        if (p, nom) in vistos:
            sys.exit("nombre repetido %s en %s: 0x%04X y 0x%04X" % (nom, p, vistos[(p, nom)], a))
        vistos[(p, nom)] = a
    with open(RUTINAS, "w", encoding="utf-8", newline="\n") as f:
        f.write(CAB + "\n")
        for (p, a), (nom, que) in sorted(viejas.items()):
            f.write("%s 0x%04X %s  %s\n" % (p, a, nom, que))
    resto = []
    for l in filas:
        p, t, a, txt = l.split(" ", 3)
        k = (p, int(a, 0))
        if t == "L":
            continue
        if t == "C" and k in nombres and cs.get(k) == txt:
            continue                # es la descripcion de la rutina
        resto.append(l)
    tmp = os.path.join(RAIZ, "work", "lote_resto.txt")
    open(tmp, "w", encoding="utf-8", newline="\n").write("\n".join(resto) + "\n")
    subprocess.run([sys.executable, os.path.join(AQUI, "mete_notas.py"), tmp], check=True)
    print("%d nombres, %d notas" % (len(nombres), len(resto)))


if __name__ == "__main__":
    main(sys.argv)
