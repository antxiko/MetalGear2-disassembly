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
    0xC380: ("la copia del banco de 0x4000", "p00:40B8, p03:A10B"),
    0xC381: ("la copia del banco de 0x6000", "p00:40F8"),
    0xC382: ("la copia del banco de 0x8000", "p00:40FE"),
    0xC383: ("la copia del banco de 0xA000", "p00:41A4"),
    0xC386: ("el slot de la RAM de 0x8000 (p01:7243)", "p00:4068, p00:5BE0"),
    0xC388: ("el registro de slots primarios del arranque", "p00:4062, p00:5BF2"),
    0xC38A: ("el slot del Game Master 2 (0xFF: no hay)", "p02:9E07, p02:9DF3"),
    0xC38B: ("bit 0: hay disquetera; bit 1: hay Game Master 2", "p02:9DD0"),
    0xC399: ("el slot del cartucho para ENASLT", "p01:6029"),
    0xC644: ("el canal de sonido que se esta tocando (1, 2, 4...)", "p16:42E1"),
    0xC661: ("el ultimo sonido pedido", "p16:4025"),
    0xC68F: ("el banco de 0xA000 de la musica que suena", "p16:4CF5, p16:4D3A"),
    0xC700: ("copia de la zona, la sala especial, la Y y la X de Snake y 0xCA50-0xCA51 (6 bytes)", "p00:5AFE"),
    0xC7D0: ("las 6 primeras filas de la matriz del teclado (en el estado 5, paso 8)", "p06:B133"),
    0xC7E0: ("lo recien pulsado de esas 6 filas", "p06:B136"),
    0xCA00: ("el estado de la partida (p01:729F: 8 estados)", "p01:7292"),
    0xCA01: ("el paso del estado de la partida", "p01:7292, p01:73AC"),
    0xCA03: ("el contador de cuadros (uno mas en cada interrupcion)", "p01:728E"),
    0xCA04: ("la espera del paso del estado", "p01:72DC"),
    0xCA05: ("1 mientras corre el juego de la interrupcion", "p03:A11E"),
    0xCA06: ("1 mientras corre el sonido de la interrupcion", "p03:A0E5"),
    0xCA07: ("lo recien pulsado del mando (los bits de 0xCA08 que no estaban)", "p06:B0C1"),
    0xCA08: ("el mando: joystick y teclado juntos (bits 0-3 las direcciones, 4-5 los disparos)", "p06:B0BE, p06:B0C8"),
    0xCA09: ("lo recien pulsado de las teclas de funcion (bits como 0xCA0A)", "p06:B0B9, p01:7437"),
    0xCA0A: ("las teclas de funcion pulsadas: bit 0 F1, 1 F2, 2 F3, 3 F4, 4 F5, 5 RETURN", "p06:B109"),
    0xCA0C: ("la direccion en la VRAM de la tabla de colores de sprites (16 bits)", "p00:4F9A"),
    0xCA0E: ("la direccion en la VRAM de la tabla de atributos de sprites (16 bits)", "p01:68CB"),
    0xCA18: ("la espera hasta poner la musica pendiente", "p00:5B6C, p00:5553"),
    0xCA19: ("la musica pendiente: la rutina que la pide (16 bits)", "p02:8A3D, p04:86CA"),
    0xCA1B: ("las paginas de la copia de una letra o pieza (bits 0-1 origen, 2-3 destino)", "p00:4976, p00:4983"),
    0xCA1C: ("1: la pantalla partida en la linea 0xB4 (arriba con desplazamiento, abajo la pagina 1 sin sprites)", "p03:A041, p03:A083"),
    0xCA20: ("la rutina de la musica que suena (16 bits; p00:5B50)", "p00:5B50, p00:5B58"),
    0xCA22: ("la fase de la partida (indice de las listas de p06:B40C)", "p01:7D19"),
    0xCA41: ("la salida de la sala (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)", "p02:9602, p02:9699, p02:96F9, p02:9717, p02:80AD"),
    0xCA42: ("la pagina de la VRAM en la que se dibuja (0/1, se alterna)", "p00:543A"),
    0xCA44: ("el puntero a los bloques de 4 x 4 de la sala", "p00:58D8, p00:58E8"),
    0xCA46: ("la base de la VRAM de la lista de dibujos", "p00:4D94"),
    0xCA48: ("la forma de pintar el mosaico (p00:512C)", "p00:510A"),
    0xCA4A: ("la zona", "p00:4C12, p00:58A0: indice de p24:6000, p32:6000, p35:6000"),
    0xCA4B: ("la sala de la zona", "p00:4E59, p00:5694"),
    0xCA4C: ("los 4 bits altos del byte de la sala (p56:BD28)", "p00:58B7"),
    0xCA4D: ("los 4 bits bajos del byte de la sala (p56:BD28)", "p00:58BC"),
    0xCA4E: ("el umbral de los caracteres 0x00-0x80 de la sala (de p56:A727; p00:5C28)", "p02:8386, p00:5C16"),
    0xCA4F: ("el umbral de los caracteres 0x81-0xFF de la sala (de p56:A727)", "p02:839D, p00:5C16"),
    0xCA50: ("la fila de la sala en la zona (uno mas al salir por arriba)", "p02:80AA, p02:8118, p02:8150"),
    0xCA51: ("la columna de la sala en la zona (uno mas al salir por la derecha)", "p02:816B, p02:8173"),
    0xCA52: ("el ancho de la barra de vida (lo maximo)", "p00:42BC, p00:42D4"),
    0xCA53: ("la vida de Snake (lo largo de la barra)", "p00:42E5"),
    0xCA54: ("el ancho de la tercera barra (lo maximo)", "p01:606D, p00:42AD"),
    0xCA55: ("la tercera barra (lo que queda)", "p01:6072, p00:4331"),
    0xCA59: ("el valor de p08:BF7D del angulo complementario", "p02:86A2"),
    0xCA5A: ("1 si el destino de p02:86C3 tiene la Y menor", "p02:86C6"),
    0xCA5B: ("1 si el destino de p02:86C3 tiene la X menor", "p02:86D2"),
    0xCA5C: ("el angulo hacia el destino dentro del octante (p08:BE7D)", "p02:86ED"),
    0xCA5D: ("el angulo hacia el destino entero (0-0xFF)", "p02:8703"),
    0xCA5E: ("la rapidez de p02:8667", "p02:8667"),
    0xCA65: ("el sitio de 0xCBE0 en el que esta Snake (0 = ninguno)", "p02:88DA, p02:8943"),
    0xCA68: ("1 si la sala tiene ficha en la lista de p02:877F", "p02:879A"),
    0xCA69: ("el quinto byte de la ficha de la sala (p02:877F)", "p02:87A8"),
    0xCA6A: ("a cero al encontrar la ficha de la sala", "p02:8796"),
    0xCA6B: ("los bytes 1-4 de la ficha de la sala (p02:877F)", "p02:879F"),
    0xCA70: ("la fila y la columna de la sala desde la que se mira (16 bits)", "p03:AB20, p03:AADA"),
    0xCA75: ("los bits de los juegos de piezas de la zona (p56:A713; p00:4A58)", "p02:8248"),
    0xCA76: ("la sala especial (0 = ninguna; indice de p24:64B6)", "p00:56BB, p00:588C"),
    0xCA8F: ("hacia donde empuja la zona (1 arriba, 2 abajo, 3 izquierda, 4 derecha; 0 nada)", "p02:9BBE, p02:957F"),
    0xCA97: ("1 si los mensajes salen de los bancos 50-51 y no de 48-49", "p01:6379, p01:666A"),
    0xCA98: ("la espera de 16 cuadros de la barra de la derecha", "p02:9B60"),
    0xCA9C: ("1 si una conversacion ha encontrado su ficha", "p01:60FE, p01:60BF"),
    0xCAA0: ("cuantos siguen a Snake por su rastro (1-4)", "p03:B3C7, p03:B4D1"),
    0xCAA1: ("la Y y la X de la ventana del mensaje (16 bits)", "p03:B615, p03:B63E"),
    0xCAA8: ("1 mientras se ve el rotulo de la cosa cogida", "p03:BECE, p03:BF36"),
    0xCAAA: ("en la zona 6: lo ponen los dos disparos (el 2 apretado y el 1 recien pulsado), lo quita cualquiera", "p02:9AB4"),
    0xCAB5: ("el nivel de Snake: la barra de vida llena mide 0x20 + 8 por nivel", "p01:6278, p01:6488"),
    0xCAC0: ("1 en pausa (F1)", "p01:77AD, p03:A0C1"),
    0xCAC4: ("lo largo de la barra de la derecha llena", "p02:9B50, p00:42A8"),
    0xCAC5: ("la barra de la derecha: con 0xCB3F >= 2 baja dos puntos cada 16 cuadros", "p02:9B6E"),
    0xCAC7: ("el rotulo de la cosa cogida: 1 puesto, 2 que se quita con una tecla", "p03:BD9F, p03:BF14"),
    0xCACE: ("distinto de 0: p02:8667 apunta sin azar", "p02:865A"),
    0xCAE2: ("1 mientras se ve la barra de la derecha", "p02:9B3E, p02:9B5C, p00:42B1"),
    0xCAF7: ("otra espera de 16 bits que baja en la interrupcion", "p03:A0DA"),
    0xCB00: ("el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)", "p02:93C5, p02:97E2, p02:96E4"),
    0xCB01: ("el dibujo de Snake (al darse la vuelta se le suma 1, 3 o 5 segun 0xCB00)", "p02:93BC"),
    0xCB02: ("la Y de Snake: la parte fraccionaria (0xCB02-0xCB03 en 8.8)", "p02:9339, p02:94A5"),
    0xCB03: ("la Y de Snake", "p02:9339, p12:7AD2 -> 0xDC10"),
    0xCB04: ("la X de Snake: la parte fraccionaria (0xCB04-0xCB05 en 8.8)", "p02:9341"),
    0xCB05: ("la X de Snake", "p02:9341, p12:7AD2"),
    0xCB06: ("la velocidad de Snake en Y (16 bits, 8.8)", "p02:94C8, p02:9552"),
    0xCB08: ("la velocidad de Snake en X (16 bits, 8.8)", "p02:94CF, p02:9559"),
    0xCB0A: ("la marcha de Snake: el indice de las velocidades de p02:9520", "p02:94B0, p02:94FB"),
    0xCB0D: ("la direccion pedida con el mando (1 arriba, 2 abajo, 3 izquierda, 4 derecha)", "p02:93A0, p06:A6BB"),
    0xCB0E: ("la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)", "p02:94B9, p02:95CA, p02:975C"),
    0xCB0F: ("1 si Snake ha chocado en este cuadro", "p02:973F, p02:94A9, p02:9422"),
    0xCB10: ("la direccion que manda en el mando (un bit de 0xCA08)", "p06:A662, p06:A69A"),
    0xCB11: ("la direccion que se pulso antes que la de 0xCB10", "p06:A66E, p06:A681"),
    0xCB12: ("el dibujo de Snake de antes de darse la vuelta", "p02:93C0, p02:93F2"),
    0xCB13: ("el paso de la animacion de andar (0-3)", "p02:9861"),
    0xCB14: ("el dibujo del paso de andar (0, 1, 2, 1: p02:9888)", "p02:9873, p02:9444"),
    0xCB15: ("la espera hasta el paso siguiente (p02:988A, segun la marcha)", "p02:9846, p02:9860"),
    0xCB16: ("1 mientras Snake se da la vuelta", "p02:93B9, p02:93EF"),
    0xCB18: ("la espera de la vuelta", "p02:93D8, p02:93EA"),
    0xCB1A: ("la espera hasta el dibujo de quieto (4 cuadros)", "p02:9841, p02:9439"),
    0xCB20: ("lo que usa el disparo 1 (0 nada; p02:8001 elige por ello)", "p03:AE9B, p02:8005"),
    0xCB21: ("lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)", "p03:BE22, p03:BD6C"),
    0xCB2A: ("las Y de arriba y abajo de la zona del estado 0x0B (16 bits)", "p02:9A38"),
    0xCB2E: ("el paso del estado 2 de Snake", "p03:A3D8"),
    0xCB30: ("1 si el ultimo choque fue contra la sala (p02:9756)", "p02:971C, p02:9758"),
    0xCB31: ("1 en el estado 2 de Snake", "p03:A38D, p03:A4E8"),
    0xCB3F: ("en la zona 6, lo que hay bajo Snake: 1 con los caracteres 0x90-0xB3, 2 con 0xB8-0xDB (3 con 0xCAAA)", "p02:9AF3, p02:9B29"),
    0xCB4B: ("con el puesto, la vida baja un punto cada 16 cuadros", "p01:642C"),
    0xCB4E: ("la espera de 16 cuadros de 0xCB4B", "p01:6436"),
    0xCB63: ("una espera de 16 bits que baja en la interrupcion", "p03:A0CF, p03:A255"),
    0xCB80: ("las 6 fichas de 16 bytes de lo que lanza Snake ([tipo][..][Y 8.8][X 8.8][velocidades]...)", "p03:AF27, p02:8001"),
    0xCBE0: ("8 sitios de 4 bytes [numero][Y][X][...] en los que se entra yendo hacia arriba", "p02:88A4, p02:8949"),
    0xCC00: ("8 fichas de 16 bytes que mueve p11:B494", "p03:AF5C"),
    0xCC80: ("16 fichas de 8 bytes que mueve p11:B66E", "p03:AF73"),
    0xD600: ("lo que lleva Snake: fichas de 4 bytes [la tiene][cuenta en BCD, 2 bytes][...]; las de 0xCB20 desde la 1", "p03:BE03, p03:BE93, p03:BDAD"),
    0xD638: ("la segunda tabla de lo que lleva (fichas de 4 bytes, como 0xD600)", "p03:BEB2, p03:BEB7"),
    0xD770: ("las cosas dejadas: 0x23 en 0xD770, 0x29 en 0xD775, la de la especial 0x29 en 0xD77A", "p02:90B9, p02:8FB6"),
    0xD780: ("la zona y la sala de la cosa 0x23 de 0xD770 (y en 0xD782 las de la 0x29)", "p02:90C4, p02:9128"),
    0xD7B6: ("la espera antes de la siguiente accion de la conversacion", "p01:6194"),
    0xD7B7: ("el mensaje que toca (16 bits)", "p01:60BB"),
    0xD7B9: ("por donde va la conversacion (16 bits)", "p01:60A5"),
    0xD7C0: ("las 4 cosas de la sala: fichas de 4 bytes [tipo][Y][X][numero]", "p02:8FDF, p02:9084"),
    0xD7D0: ("las banderas de la partida: la n en el bit 7 - n % 8 del byte n / 8 (p03:B0DC, p03:B0F6)", "p03:B0AD, p03:B0E1"),
    0xD7F0: ("otras banderas de la partida (p03:B0D3, p03:B0FE)", "p03:B0D3"),
    0xD8A8: ("1: la ventana del mensaje es estrecha (0xB8 x 0x28)", "p01:61D0, p01:6526"),
    0xD8D8: ("las banderas de la sala (se borran al cambiar de sala, p00:59DD)", "p03:B0CE, p03:B103"),
    0xD8E0: ("1: el juego de dibujos solo pinta sus listas 6 y 7", "p00:4D5A, p00:4D6F"),
    0xD8E2: ("0: p01:62B5 copia con ldir; 1: caracter a caracter", "p01:62A0, p01:62F0"),
    0xDA00: ("la copia de la tabla de colores de sprites: 32 x 16 lineas (va con 0xDC00 detras)", "p00:4F97"),
    0xDC00: ("la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]", "p01:68D2, p00:4266"),
    0xDD00: ("el mapa de la sala: 24 x 24 caracteres", "p00:58DD, p00:57BA"),
    0xDF80: ("8 fichas de 8 bytes [tipo][dibujo][Y][X][fila][columna][espera][grafico] que suenan 0x14 en la sala y 0x15 al lado", "p03:B206, p03:B2BC"),
    0xDFF0: ("1 mientras corre la tercera barra", "p03:BB1E, p03:BBFF"),
    0xDFF2: ("la espera de la tercera barra", "p03:BBCC, p03:BC21"),
    0xE080: ("el rastro de Snake: las ultimas 16 posiciones [Y][X][direccion] (con 0xCAA0)", "p02:9BE4"),
    0xE1E8: ("1 mientras hay una llamada", "p03:B11F, p03:B132"),
    0xE1E9: ("el numero de la llamada", "p03:B11F"),
    0xE1EB: ("los avisos que le quedan a la llamada", "p03:B12F, p03:B171"),
    0xE204: ("la Y de Snake antes de entrar en el sitio - 0x20", "p02:88EC"),
    0xE205: ("la X de Snake antes de entrar en el sitio", "p02:88F2"),
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
    0xE240: ("la ficha del que sigue a Snake 4 posiciones por detras (del rastro de 0xE08C)", "p03:B425, p03:B4E6"),
    0xE248: ("la ficha del que sigue a Snake 12 posiciones por detras (0xE0A4)", "p03:B41A, p03:B563"),
    0xE256: ("la direccion en la que se mira la sala de al lado (estado 0x0E)", "p03:A9F9, p03:AA45"),
    0xE260: ("dos fichas de 8 bytes de los mosaicos de quien habla", "p03:B814, p03:B8AC"),
    0xE270: ("el barrido: 1 por pasos, 2 de 4 en 4 (0 nada)", "p03:B67D, p03:B6C8"),
    0xE740: ("el numero de paleta de cada sala de la zona (p56:B747 deshecha; p02:8488)", "p00:51D7, p02:8488"),
    0xE780: ("las salas de 0xCA76 deshechas (36 bloques cada una)", "p00:56C4"),
    0xE800: ("los colores de la lista de dibujos en curso (p00:4DB3)", "p00:4DB0"),
    0xE900: ("los caracteres de un dibujo pasados a 4 bits", "p00:4B06"),
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
