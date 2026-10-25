#!/usr/bin/env python3
"""Lo que el trazador de cartucho entero (tools/bancos.py) necesita saber de
ESTE cartucho: donde esta el despachador, como cambia de banco y por donde
arranca. bancos.py es maquinaria y no lleva direcciones de ningun juego; las
lee de aqui.

Metal Gear 2: Solid Snake (Konami, RC-767, 1990), mapper Konami con SCC. Todo medido sobre los bytes (tools/reconocimiento.py repasa cada
escritura al mapper).
"""

# El despachador: `pop hl / add a,a / call p00:4248 (HL += A con p00:423E y
# A = (HL)) / inc hl / ld h,(hl) / ld l,a / jp (hl)`, con la tabla de destinos
# pegada detras del `call`.
DESPACHADOR = 0x424D
DESPACHADORES = (0x424D,)

RANURA_REG = {0x7000: 0, 0x9000: 1, 0xB000: 2}

# la copia en RAM de cada registro: 0xC380 (0x5000, siempre 0) y 0xC381-0xC383
SOMBRA = {0xC381: 0, 0xC382: 1, 0xC383: 2}
SOMBRA_RANURA = {0: 0, 1: 1, 2: 2}
PONE_ZONA = ()
DEVUELVE_ZONA = ()

# (banco en 0x6000, 0x8000, 0xA000) que deja cada entrada de p00:40F0-4235.
# Medido EJECUTANDO cada una con tools/z80run.py (work/sonda_repartos.py), no
# leido a ojo. p00:413B pone la pareja A, A+1 en 0x8000 y 0xA000 con el A que
# trae: no tiene valor fijo y no va aqui.
REPARTOS = {
    0x40F0: (1, 2, 3),
    0x4104: (32, 33, 34),
    0x4109: (35, 36, 37),
    0x410E: (24, 25, 26),
    0x4113: (None, 27, 28),
    0x4118: (None, 29, 30),
    0x411D: (None, 48, 49),
    0x4122: (None, 50, 51),
    0x4127: (None, 52, 53),
    0x412C: (None, 57, 58),
    0x4131: (None, 60, 61),
    0x4136: (None, 62, 63),
    0x413F: (1, 4, 5),
    0x4142: (None, 4, 5),
    0x4158: (None, 36, 37),
    0x415D: (None, 38, 39),
    0x4162: (None, 40, 41),
    0x4167: (None, 42, 43),
    0x416C: (None, 44, 45),
    0x4171: (None, 46, 47),
    0x4176: (1, 13, 14),
    0x4179: (None, 13, 14),
    0x417E: (None, None, 53),
    0x4183: (None, None, 54),
    0x4188: (12, 4, 56),
    0x418B: (12, None, 56),
    0x418E: (None, None, 56),
    0x4193: (None, None, 58),
    0x4198: (None, None, 63),
    0x419D: (1, 2, 6),
    0x41A0: (None, None, 6),
    0x41AD: (1, 2, 7),
    0x41B0: (None, None, 7),
    0x41B5: (1, 4, 8),
    0x41BA: (1, 2, 8),
    0x41BD: (None, None, 8),
    0x41C2: (1, 2, 9),
    0x41C5: (None, None, 9),
    0x41CA: (1, 2, 10),
    0x41CD: (None, None, 10),
    0x41D2: (1, 2, 11),
    0x41D5: (None, None, 11),
    0x41DA: (12, 2, 3),
    0x41DD: (12, None, None),
    0x41EA: (1, None, None),
    0x41EF: (None, None, 14),
    0x41F4: (1, 2, 15),
    0x41F7: (None, None, 15),
    0x41FC: (None, None, 37),
    0x4201: (None, None, 47),
    0x4206: (None, None, 30),
    0x420B: (None, None, 31),
    0x4210: (None, None, 49),
    0x4215: (None, None, 51),
    0x421A: (None, 50, None),
    0x421F: (None, 57, None),
    0x4224: (None, 4, None),
    0x4229: (None, 27, None),
}

COLAS = {
}

PONE_BANCOS = {**REPARTOS, **COLAS}

# El banco de 0x4000 no es siempre el 0: el sonido (p03:A0ED, A152, A18B y la
# copia de 0xC340) pone 16-17-18-19 en las cuatro ranuras. Es el unico sitio
# que pone el 17 en 0x6000, asi que con el 17 ahi el 16 esta en 0x4000 (aunque
# 0x8000 cambie: el sonido enciende el SCC escribiendo 0x3F en 0x9000).
# banco en 0x6000 -> banco en 0x4000
BANCO_4000 = {17: 16}

# Codigo que se ejecuta COPIADO en la RAM: (direccion en RAM, bytes, banco,
# direccion de la ROM con ese banco puesto). Lo copia el arranque con cuatro
# `ldir` (p00:4085-40AF) mientras 0-1-2-3 son los bancos de encendido. El
# trazador sigue esas direcciones por los bytes del banco 3.
#   0xC200  la interrupcion (H.KEYI apunta aqui: p00:40D1)
#   0xC2A0  p03:A021
#   0xC340  la llamada al sonido (pone 16-17-18-19 y entra en 0x4003)
#   0xC000  p03:A186
COPIAS_RAM = ((0xC200, 0xA0, 3, 0xA0B6),
              (0xC2A0, 0xA0, 3, 0xA021),
              (0xC340, 0x40, 3, 0xA14B),
              (0xC000, 0x40, 3, 0xA186))


def semillas_iniciales(rom):
    """Los puntos de entrada que el hardware garantiza.

    - INIT de la cabecera "AB" (0x402E): lo llama la BIOS al arrancar, con el
      mapper en su estado de encendido (bancos 1, 2 y 3 en 0x6000, 0x8000 y
      0xA000).
    - 0x4040: lo que INIT deja en el gancho H.STKE: `ld h,a / ld l,0xF7 /
      ld (0xFEDA),hl / ld hl,0x4040 / ld (0xFEDC),hl` (p00:4033-403C) es un
      `rst 0x30` con el slot del cartucho y esta direccion.
    La interrupcion no esta en la ROM: p00:4085 copia p03:A0B6 a la RAM en
    0xC200 y p00:40D1 pone `jp 0xC200` en H.KEYI. Ese codigo se traza desde el
    banco 3 (src/p03.entries).
    """
    init = rom[2] | (rom[3] << 8)
    return [(init, (1, 2, 3), "cabecera AB: INIT"),
            (0x4040, (1, 2, 3),
             "gancho H.STKE: INIT escribe rst 0x30 + slot en 0xFEDA y esta"
             " direccion en 0xFEDC (p00:4033-p00:403C)"),
            (0xC200, (1, 2, 3),
             "la interrupcion: p00:40D1 pone jp 0xC200 en H.KEYI; es la copia"
             " de p03:A0B6 (cartucho.COPIAS_RAM)")]
