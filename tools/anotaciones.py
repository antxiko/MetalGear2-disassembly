#!/usr/bin/env python3
"""Lo que tools/anota.py sabe de Metal Gear 2: Solid Snake: cambios de banco,
RAM y los campos de las fichas. Los nombres de rutina van en src/rutinas.txt.
Solo datos; la maquinaria esta en anota.py.

CADA ENTRADA SALE DE LEER SU RUTINA en el listado (la direccion es la fuente).
Lo que no se sabe no esta en la tabla.
"""

# los bancos de codigo: 0-16 y el 63 (p63:B800, el gancho de la interrupcion)
BANCOS = tuple(range(17)) + (63,)

REGISTROS_MAPPER = {0x5000: "0x4000", 0x7000: "0x6000", 0x9000: "0x8000", 0xB000: "0xA000"}


# Que banco se ve en cada ventana al empezar una rutina del banco b: el propio
# banco en su ranura y 1-2-3 en las demas (p00:40F0); el 16, el del sonido,
# con 17-18-19 (p03:A152). Es una suposicion de partida que corrigen las
# llamadas de CAMBIOS_DE_BANCO; el trazador de cartucho entero (src/pMM.entries)
# manda cuando sabe a que banco va una llamada.
def trio(b):
    if b == 0:
        return {0x6000: 1, 0x8000: 2, 0xA000: 3}
    if b == 16:
        return {0x6000: 17, 0x8000: 18, 0xA000: 19}
    from paginas import ORG
    s = {0x6000: 1, 0x8000: 2, 0xA000: 3}
    s[ORG[b]] = b
    return s


# Las rutinas del banco 0 que cambian lo que se ve (ventana -> banco): las de
# cartucho.REPARTOS, medidas ejecutandolas (work/sonda_repartos.py).
CAMBIOS_DE_BANCO = {
    0x40F0: {0x6000: 1, 0x8000: 2, 0xA000: 3},
    0x4104: {0x6000: 32, 0x8000: 33, 0xA000: 34},
    0x4109: {0x6000: 35, 0x8000: 36, 0xA000: 37},
    0x410E: {0x6000: 24, 0x8000: 25, 0xA000: 26},
    0x4113: {0x8000: 27, 0xA000: 28},
    0x4118: {0x8000: 29, 0xA000: 30},
    0x411D: {0x8000: 48, 0xA000: 49},
    0x4122: {0x8000: 50, 0xA000: 51},
    0x4127: {0x8000: 52, 0xA000: 53},
    0x412C: {0x8000: 57, 0xA000: 58},
    0x4131: {0x8000: 60, 0xA000: 61},
    0x4136: {0x8000: 62, 0xA000: 63},
    0x413B: {0x8000: 0, 0xA000: 1},
    0x413F: {0x6000: 1, 0x8000: 4, 0xA000: 5},
    0x4142: {0x8000: 4, 0xA000: 5},
    0x4158: {0x8000: 36, 0xA000: 37},
    0x415D: {0x8000: 38, 0xA000: 39},
    0x4162: {0x8000: 40, 0xA000: 41},
    0x4167: {0x8000: 42, 0xA000: 43},
    0x416C: {0x8000: 44, 0xA000: 45},
    0x4171: {0x8000: 46, 0xA000: 47},
    0x4176: {0x6000: 1, 0x8000: 13, 0xA000: 14},
    0x4179: {0x8000: 13, 0xA000: 14},
    0x417E: {0xA000: 53},
    0x4183: {0xA000: 54},
    0x4188: {0x6000: 12, 0x8000: 4, 0xA000: 56},
    0x418B: {0x6000: 12, 0xA000: 56},
    0x418E: {0xA000: 56},
    0x4193: {0xA000: 58},
    0x4198: {0xA000: 63},
    0x419D: {0x6000: 1, 0x8000: 2, 0xA000: 6},
    0x41A0: {0xA000: 6},
    0x41AD: {0x6000: 1, 0x8000: 2, 0xA000: 7},
    0x41B0: {0xA000: 7},
    0x41B5: {0x6000: 1, 0x8000: 4, 0xA000: 8},
    0x41BA: {0x6000: 1, 0x8000: 2, 0xA000: 8},
    0x41BD: {0xA000: 8},
    0x41C2: {0x6000: 1, 0x8000: 2, 0xA000: 9},
    0x41C5: {0xA000: 9},
    0x41CA: {0x6000: 1, 0x8000: 2, 0xA000: 10},
    0x41CD: {0xA000: 10},
    0x41D2: {0x6000: 1, 0x8000: 2, 0xA000: 11},
    0x41D5: {0xA000: 11},
    0x41DA: {0x6000: 12, 0x8000: 2, 0xA000: 3},
    0x41DD: {0x6000: 12},
    0x41EA: {0x6000: 1},
    0x41EF: {0xA000: 14},
    0x41F4: {0x6000: 1, 0x8000: 2, 0xA000: 15},
    0x41F7: {0xA000: 15},
    0x41FC: {0xA000: 37},
    0x4201: {0xA000: 47},
    0x4206: {0xA000: 30},
    0x420B: {0xA000: 31},
    0x4210: {0xA000: 49},
    0x4215: {0xA000: 51},
    0x421A: {0x8000: 50},
    0x421F: {0x8000: 57},
    0x4224: {0x8000: 4},
    0x4229: {0x8000: 27},
}

RUTINAS = {}

# RAM: direccion -> (que es, de donde se sabe)
RAM = {
    0xCA00: ("el estado de la partida (p01:729F: 8 estados)", "p01:7292"),
    0xCA01: ("el paso del estado de la partida", "p01:7292, p01:73AC"),
    0xCA03: ("el contador de cuadros (uno mas en cada interrupcion)", "p01:728E"),
    0xCA04: ("la espera del paso del estado", "p01:72DC"),
    0xCA07: ("lo recien pulsado del mando (los bits de 0xCA08 que no estaban)", "p06:B0C1"),
    0xCA08: ("el mando: joystick y teclado juntos (bits 0-3 las direcciones, 4-5 los disparos)", "p06:B0BE, p06:B0C8"),
    0xCA09: ("lo recien pulsado de las teclas de funcion", "p06:B0B9"),
    0xCA0A: ("las teclas de funcion pulsadas (filas 6 y 7 de la matriz)", "p06:B0B9, p06:B109"),
    0xCA0E: ("la direccion en la VRAM de la tabla de atributos de sprites (16 bits)", "p01:68CB"),
    0xC7D0: ("las 6 primeras filas de la matriz del teclado (en el estado 5, paso 8)", "p06:B133"),
    0xC7E0: ("lo recien pulsado de esas 6 filas", "p06:B136"),
    0xDC00: ("la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]", "p01:68D2, p00:4266"),
    0xC380: ("la copia del banco de 0x4000", "p00:40B8, p03:A10B"),
    0xC381: ("la copia del banco de 0x6000", "p00:40F8"),
    0xC382: ("la copia del banco de 0x8000", "p00:40FE"),
    0xC383: ("la copia del banco de 0xA000", "p00:41A4"),
    0xCA42: ("la pagina de la VRAM en la que se dibuja (0/1, se alterna)", "p00:543A"),
    0xCA44: ("el puntero a los bloques de 4 x 4 de la sala", "p00:58D8, p00:58E8"),
    0xCA46: ("la base de la VRAM de la lista de dibujos", "p00:4D94"),
    0xCA48: ("la forma de pintar el mosaico (p00:512C)", "p00:510A"),
    0xCA4A: ("la zona", "p00:4C12, p00:58A0: indice de p24:6000, p32:6000, p35:6000"),
    0xCA4B: ("la sala de la zona", "p00:4E59, p00:5694"),
    0xCA4C: ("los 4 bits altos del byte de la sala (p56:BD28)", "p00:58B7"),
    0xCA4D: ("los 4 bits bajos del byte de la sala (p56:BD28)", "p00:58BC"),
    0xCA76: ("la sala especial (0 = ninguna; indice de p24:64B6)", "p00:56BB, p00:588C"),
    0xCA22: ("la fase de la partida (indice de las listas de p06:B40C)", "p01:7D19"),
    0xCA19: ("la musica pendiente: la rutina que la pide (16 bits)", "p02:8A3D, p04:86CA"),
    0xCA97: ("1 si los mensajes salen de los bancos 50-51 y no de 48-49", "p01:6379, p01:666A"),
    0xCA9C: ("1 si una conversacion ha encontrado su ficha", "p01:60FE, p01:60BF"),
    0xD7B6: ("la espera antes de la siguiente accion de la conversacion", "p01:6194"),
    0xD7B7: ("el mensaje que toca (16 bits)", "p01:60BB"),
    0xD7B9: ("por donde va la conversacion (16 bits)", "p01:60A5"),
    0xE220: ("la velocidad del mensaje en curso (0 = ninguno; 1-3, 4 sin espera)", "p01:6558, p01:658E"),
    0xE221: ("el paso del mensaje en curso (p01:6597)", "p01:6574, p01:6593"),
    0xE222: ("la espera entre letras del mensaje", "p01:657B, p01:66BA"),
    0xE223: ("la letra del mensaje por la que va (16 bits)", "p01:6571, p01:66C4"),
    0xE225: ("el puntero al mensaje en curso (16 bits)", "p01:655F"),
    0xE227: ("donde se escribe la siguiente letra del mensaje (16 bits)", "p01:6562"),
    0xE229: ("donde empieza la linea del mensaje (16 bits)", "p01:6566"),
    0xE22B: ("las lineas de la ventana del mensaje", "p01:656B"),
    0xE22C: ("la espera del final del mensaje", "p01:6755, p01:665A"),
    0xE22D: ("1 si el mensaje se escribe de golpe (sin espera)", "p01:6695"),
    0xDD00: ("el mapa de la sala: 24 x 24 caracteres", "p00:58DD, p00:57BA"),
    0xE780: ("las salas de 0xCA76 deshechas (36 bloques cada una)", "p00:56C4"),
    0xE800: ("los colores de la lista de dibujos en curso (p00:4DB3)", "p00:4DB0"),
    0xE900: ("los caracteres de un dibujo pasados a 4 bits", "p00:4B06"),
    0xC661: ("el ultimo sonido pedido", "p16:4025"),
    0xC68F: ("el banco de 0xA000 de la musica que suena", "p16:4CF5, p16:4D3A"),
    0xC644: ("el canal de sonido que se esta tocando (1, 2, 4...)", "p16:42E1"),
    0xFDA2: ("una copia de cuadros para el sonido (p16:4298)", "p16:42C8"),
}

RAM16 = {}

SCC = {0x9880 + 2 * k: "el periodo del canal %d del SCC (bajo)" % (k + 1) for k in range(5)}
SCC_BANCO = 16

# los canales del motor de sonido: 8 fichas de 0x40 bytes en 0xC400 (p16:42E4)
CAMPOS_CANAL = {
    0x00: "el sonido del canal (0 = callado)",
    0x02: "el puntero de la partitura (bajo)",
    0x03: "el puntero de la partitura (alto)",
    0x04: "lo que le queda a la nota",
}
CARGAS_CANAL = tuple(0xC400 + 0x40 * k for k in range(8))
FICHAS = ((CARGAS_CANAL, {16: ((0x4369, 0x4C19),)}, CAMPOS_CANAL),)


def _rutinas_txt():
    """Las rutinas de src/rutinas.txt: "pNN 0xDIR nombre  que hace"."""
    import os
    ruta = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "src", "rutinas.txt")
    if not os.path.exists(ruta):
        return
    for ln in open(ruta, encoding="utf-8"):
        if not ln.strip() or ln.startswith("#"):
            continue
        cab, _, que = ln.rstrip().partition("  ")
        p, a, nom = cab.split()
        RUTINAS[(int(p[1:]), int(a, 0))] = (nom, que.strip())


_rutinas_txt()
