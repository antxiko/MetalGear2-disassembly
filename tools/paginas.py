#!/usr/bin/env python3
"""La regla banco -> direccion del MegaROM, compartida por todas las herramientas.

Metal Gear 2: Solid Snake (Konami, RC-767, 1990, MSX2) es un cartucho de 512 KB
con el mapper Konami CON SCC: 64 bancos de 8 KB que se eligen escribiendo el
numero de banco en 0x5000 (para 0x4000-0x5FFF), 0x7000 (0x6000-0x7FFF), 0x9000
(0x8000-0x9FFF) y 0xB000 (0xA000-0xBFFF). Escribir 0x3F en 0x9000 no pone un
banco: enciende el SCC en 0x9800-0x9FFF.

Lo que dice la ROM (tools/reconocimiento.py lo vuelve a medir cada vez; los
repartos se ejecutaron uno a uno con tools/z80run.py):
  - El arranque (p00:40B4) pone 0-1-2-3, y el banco 0 se queda fijo en 0x4000.
  - Los repartos estan en p00:40F0-4235 (tools/cartucho.py, REPARTOS): de
    tres (1-2-3 en 0x6000-0xBFFF, 24-25-26, 32-33-34, 35-36-37), de dos en
    0x8000 y 0xA000 (pares N, N+1) y de uno.
  - El sonido (p03:A0ED, A152, A18B, y la copia en RAM de 0xC340) pone
    16-17-18-19 en 0x4000-0xBFFF y entra por 0x4000, 0x4003 o 0x4006; despues
    devuelve el reparto guardado en 0xC380-0xC383. Los datos de cada musica
    van en 0xA000: el banco sale de la tabla p16:4CF9 (19-23 y 59) y lo pone
    p16:4D3A.
  - La interrupcion (p03:A127) pone el banco 63 en 0xA000.
  - El banco 55 no lo pone ninguna escritura vista: se le da 0xA000 como a sus
    vecinos 54 y 56 (por medir).
  - p12:66DF escribe en 0x8000 despues de ENASLT: es otro slot.

Uso como programa:
    paginas.py org <n>               imprime el org del banco n
    paginas.py lista                 imprime "n org" para los 64
    paginas.py corta <rom> <dir>     escribe <dir>/pNN.bin con cada banco
"""
import os
import sys

TAM_PAGINA = 0x2000
N_PAGINAS = 64

_6000 = (1, 12, 17, 24, 32, 35)
_8000 = (2, 4, 13, 18, 25, 27, 29, 33, 36, 38, 40, 42, 44, 46, 48, 50, 52, 57, 60, 62)
_A000 = (3, 5, 6, 7, 8, 9, 10, 11, 14, 15, 19, 20, 21, 22, 23, 26, 28, 30, 31, 34,
         37, 39, 41, 43, 45, 47, 49, 51, 53, 54, 55, 56, 58, 59, 61, 63)

# banco -> direccion de ejecucion. Medido, no supuesto: ver reconocimiento.py.
ORG = {0: 0x4000, 16: 0x4000}
ORG.update({b: 0x6000 for b in _6000})
ORG.update({b: 0x8000 for b in _8000})
ORG.update({b: 0xA000 for b in _A000})
assert sorted(ORG) == list(range(N_PAGINAS))

# Registro del mapper -> ranura que gobierna (Konami con SCC).
REGISTROS = {0x5000: 0x4000, 0x7000: 0x6000, 0x9000: 0x8000, 0xB000: 0xA000}

# Los registros del OTRO mapper Konami: nadie de este cartucho escribe en
# ellos, salvo las escrituras de OTRO_SLOT.
AJENOS = (0x6000, 0x8000, 0xA000)

# Escrituras a un registro ajeno que van a otro slot: (banco, pc).
OTRO_SLOT = {(12, 0x66DF)}

# Valores escritos en un registro que no son un banco: (registro, valor).
NO_BANCO = {(0x9000, 0x3F): "enciende el SCC en 0x9800"}

# Escrituras al mapper que ponen un banco fuera de su ranura, medidas en
# reconocimiento.py: (banco, pc de la escritura) -> ranura.
EXCEPCIONES = {}

NUNCA_MAPEADOS = ()


def org(p):
    """Direccion en la que se ejecuta el banco p."""
    return ORG[p]


def nombre(p):
    """Nombre del modulo del banco p: p00..p63."""
    return "p%02d" % p


def main(argv):
    if len(argv) < 2:
        sys.exit(__doc__)
    if argv[1] == "org":
        print("%#06x" % org(int(argv[2], 10)))
    elif argv[1] == "lista":
        for p in range(N_PAGINAS):
            print("%d %#06x" % (p, org(p)))
    elif argv[1] == "corta":
        rom, dst = argv[2], argv[3]
        d = open(rom, "rb").read()
        if len(d) != TAM_PAGINA * N_PAGINAS:
            sys.exit("la ROM mide %d bytes y no %d" % (len(d), TAM_PAGINA * N_PAGINAS))
        os.makedirs(dst, exist_ok=True)
        for p in range(N_PAGINAS):
            with open(os.path.join(dst, nombre(p) + ".bin"), "wb") as f:
                f.write(d[p * TAM_PAGINA:(p + 1) * TAM_PAGINA])
        print("%d bancos de %d bytes en %s/" % (N_PAGINAS, TAM_PAGINA, dst))
    else:
        sys.exit(__doc__)


if __name__ == "__main__":
    main(sys.argv)
