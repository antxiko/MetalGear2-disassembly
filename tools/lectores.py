#!/usr/bin/env python3
"""Los lectores de datos de Metal Gear 2: Solid Snake y sus formatos, para
tools/bloques.py.

Cada recorredor hace con los bytes lo mismo que la rutina del cartucho que
lo lee, y devuelve donde acaba. Las rutinas, con su direccion en NUESTRO
listado:

  p00:4D92  una lista de dibujos: fichas de 5 bytes [tipo-cuantos][paleta]
            [sitio][puntero lo hi] hasta un 0xFF. Los bits 7-6 del primero
            dicen a cuantos bits por punto va el dibujo (p00:4DF5: el 7 a
            tres, p00:4B91; el 6 a dos, p00:4B46; ninguno a uno, p00:4B03:
            24, 16 u 8 bytes por caracter) y los 5-0 cuantos caracteres son.
            La paleta es un indice en la tabla de DE: un puntero a 1, 2 o 4
            bytes de dos colores cada uno (p00:4DB3, a 0xE800).
  p00:4D5A  [VRAM lo hi] y 8 punteros a listas de p00:4D92 (0 = ninguna):
            la de la zona sale de p32:6000 + 2 x zona (p00:4BFF).
  p00:4C0F  las piezas de la zona: p32:6E4D + 2 x zona, fichas de 6 bytes
            [bancos][paletas lo hi][lista lo hi][sitio] hasta un 0xFF; el
            primero elige los bancos con la tabla p00:4C6B (p00:4C65).
  p00:453E  rachas a la VRAM: n == 0 acaba; n < 0x80 repite el byte
            siguiente n veces; n == 0x80 trae otro destino de 3 bytes
            [pagina][VRAM lo hi] (p00:4534); n > 0x80 copia n & 0x7F bytes.
  p00:4F55  rachas y, detras del 0, fichas de 4 bytes [orden][n][a][b] hasta
            una orden 0 (p00:5223): la 1 copia n filas de colores de sprite
            de a a b (p00:5238), las demas n patrones volteados (p00:52AB).
  p00:4E44  los sprites de la sala: p35:6000 + 2 x zona, parejas [sala]
            [juego] hasta un 0xFF; el juego da dos numeros en p35:60B7 y
            cada uno un bloque de p00:4F55 en p35:60DB (p00:4F4C).
  p00:589D  la sala (0xCA4B) de la zona (0xCA4A): p24:6000 + 2 x zona da las
            salas de la zona, de 37 bytes cada una (p00:5998: 37 x sala):
            [juego] y 6 x 6 bloques; el juego es un indice en la tabla de
            p24:6028 + 2 x zona, que apunta a los bloques de 16 bytes (4 x 4
            caracteres, p00:58DD). Los bancos de 0x8000 y 0xA000 salen de la
            zona con p00:545C (p00:5444). Cuantas salas tiene cada zona lo
            dice p56:BD28: un byte por sala (p00:58A7).
  p00:569E  las salas de 0xCA76 (cuando no es 0): p24:64B6 + 2 x 0xCA76 da
            unas rachas que p00:51E0 deshace en 0xE780 (n < 0x80 repite el
            siguiente, n > 0x80 copia n & 0x7F, 0 acaba), 36 bytes por sala
            sin juego: los bloques son los de p00:56EF + 2 x zona.
"""
import bloques as B

ROM = B.ROM

# ------------------------------------------------------------- los bancos

# p00:4C6B: los seis cambios de banco que elige el primer byte de una ficha
# de p00:4C0F (y la zona, con p00:4C77). El 0x6000 se queda como este.
JUEGOS = {0: (32, 33, 34), 1: (35, 36, 37), 2: (None, 38, 39), 3: (None, 40, 41),
          4: (None, 42, 43), 5: (None, 44, 45)}
N_ZONAS = 20          # p32:6000 tiene 20 punteros: el primero apunta a 0x6028


def con(s, juego):
    """El reparto s despues de poner el juego de bancos `juego`."""
    j = JUEGOS[juego]
    return tuple(s[i] if j[i] is None else j[i] for i in range(3))


def rom(b, a):
    return ROM[b * 8192 + (a - B.ORG[b])]


# ---------------------------------------------------------------- formatos

BITS = {0: 1, 1: 2, 2: 3, 3: 3}


def dibujos(v, lista, tabla, sitio):
    """p00:4D92: declara la lista, cada dibujo y cada paleta que usa."""
    a = lista
    n = 0
    while v(a) != 0xFF:
        c, ip, ptr = v(a), v(a + 1), v.w(a + 3)
        bits = BITS[c >> 6]
        cuantos = (c & 0x3F) or 64
        tam = 8 * bits * cuantos
        B.declara(v, ptr, ptr + tam, "dibujo_%04X" % ptr,
                  "%d caracteres de 8x8 a %d bit%s por punto (%d bytes cada uno), ficha %d "
                  "de la lista 0x%04X (p00:4D92, p00:4DF5)"
                  % (cuantos, bits, "" if bits == 1 else "s", 8 * bits, n, lista),
                  sitio, F=8 * bits)
        if tabla is not None:
            pal = v.w(tabla + 2 * ip)
            nb = {1: 1, 2: 2, 3: 4}[bits]
            k = (v.banco(pal), pal)
            COLORES.setdefault(k, [v, 0, set()])
            COLORES[k][1] = max(COLORES[k][1], nb)
            COLORES[k][2].add(sitio)
            TABLAS_COLORES.setdefault((v.banco(tabla), tabla), [v, set()])[1].add(ip)
        a += 5
        n += 1
    B.declara(v, lista, a + 1, "lista_%04X" % lista,
              "%d fichas de dibujo de 5 bytes [tipo-cuantos][colores][sitio][puntero lo hi] "
              "y un 0xFF (p00:4D92; colores en la tabla 0x%04X)"
              % (n, tabla if tabla is not None else 0), sitio, F=5)


TABLAS_COLORES = {}   # (banco, tabla) -> [ventana, indices usados]
COLORES = {}          # (banco, puntero) -> [ventana, bytes, sitios]


def colores():
    """Los colores de los dibujos y sus tablas de punteros (tan largas como su
    indice mas alto): se declaran al final, cuando ya se sabe cuantos bytes
    toma cada uno (1, 2 o 4: dos colores por byte)."""
    for (b, t), (v, ips) in sorted(TABLAS_COLORES.items()):
        n = max(ips) + 1
        B.declara(v, t, t + 2 * n, "tabla_colores_%04X" % t,
                  "%d punteros a colores de dibujo (los usa hasta el indice %d; p00:4DA0)"
                  % (n, n - 1), "p00:4DA0", F="w8")
    for (b, a), (v, nb, sitios) in sorted(COLORES.items()):
        B.declara(v, a, a + nb, "colores_%04X" % a,
                  "%d colores de 4 bits, dos por byte, para un dibujo de %d bits por punto "
                  "(p00:4DB3 los pasa a 0xE800)" % (2 * nb, {1: 1, 2: 2, 4: 3}[nb]),
                  sorted(sitios), F=nb)


def por_llamadas():
    """Las listas que llegan a p00:4D92 por sus entradas con la VRAM puesta
    (p00:4D3E..4D58: B = 0xA0, 0xE0, 0x00, 0x20, 0x40, 0x60) con HL y DE
    inmediatos, tal como las ve el trazador de cartucho entero."""
    t = B.trazador()
    vistos = set()
    for (d, b, pc, s, hl, de) in t.llamadas:
        if d not in (0x4D3E, 0x4D46, 0x4D4A, 0x4D4E, 0x4D52, 0x4D56) or hl is None:
            continue
        if (b, pc) == (0, 0x4CA0):
            # p00:4C97 pone los bancos de la zona (p00:4C58) y el trazador no
            # sabe cual es: la lista 0xAE19 solo tiene forma de lista en el 34
            # (02 22 01 8F B1, 47 23 03 9F B1...), el juego 0 (zonas 0, 9, 10, 18)
            s = (32, 33, 34)
        k = (hl, de, s)
        if k in vistos:
            continue
        vistos.add(k)
        dibujos(B.Ventana(s), hl, de, "p%02d:%04X" % (b, pc))


def cabecera_8(v, a, tabla, sitio):
    """p00:4D5A: [VRAM] y 8 listas de p00:4D92 (0 = ninguna)."""
    B.declara(v, a, a + 18, "juego_%04X" % a,
              "la direccion de VRAM y 8 punteros a listas de dibujos (0 = ninguna), "
              "uno por cada tercio de las tablas de patrones (p00:4D5A)", sitio, F="w9")
    for k in range(8):
        p = v.w(a + 2 + 2 * k)
        if p:
            dibujos(v, p, tabla, sitio)


def rachas(v, a):
    """p00:453E. Devuelve el final (detras del 0)."""
    while True:
        n = v(a)
        a += 1
        if n == 0:
            return a
        if n < 0x80:
            a += 1
        elif n == 0x80:
            a += 3
        else:
            a += n & 0x7F


def rachas_y_fichas(v, a):
    """p00:4F55: rachas y fichas de 4 bytes hasta una orden 0."""
    a = rachas(v, a)
    while v(a) != 0:
        a += 4
    return a + 1


def declara_rachas(v, a, sitio, fichas=False):
    if fichas:
        B.declara(v, a, rachas_y_fichas(v, a), "sprites_%04X" % a,
                  "patrones de sprite en rachas a la VRAM (p00:453E: n < 0x80 repite, n > 0x80 "
                  "copia n & 0x7F, 0x80 cambia de destino, 0 acaba) y fichas de 4 bytes "
                  "[orden][n][a][b] hasta una orden 0 (p00:5223: 1 copia colores, otra "
                  "voltea patrones)", sitio, F=16)
    else:
        B.declara(v, a, rachas(v, a), "rachas_%04X" % a,
                  "datos en rachas a la VRAM (p00:453E: n < 0x80 repite, n > 0x80 copia "
                  "n & 0x7F, 0x80 cambia de destino, 0 acaba)", sitio, F=16)


# ------------------------------------------------------------ las zonas

ZONA_JUEGO = 0x4C77   # p00:4C58: el juego de bancos de cada zona


def zonas():
    base = (32, 33, 34)
    B.declara(B.ventana_de(32), 0x6000, 0x6000 + 2 * N_ZONAS, "zonas_dibujos",
              "%d punteros, uno por zona (0xCA4A): la cabecera de p00:4D5A con los "
              "dibujos de la zona (p00:4C05)" % N_ZONAS, "p00:4C08", F="w8")
    B.declara(B.ventana_de(32), 0x6E4D, 0x6E4D + 2 * N_ZONAS, "zonas_piezas",
              "%d punteros, uno por zona (0xCA4A): las piezas de la zona (p00:4C15)"
              % N_ZONAS, "p00:4C18", F="w8")
    for z in range(N_ZONAS):
        s = con(base, rom(0, ZONA_JUEGO + z))
        v = B.Ventana(s)
        cabecera_8(v, v.w(0x6000 + 2 * z), None, "p00:4C0C")
        a = v.w(0x6E4D + 2 * z)
        n = 0
        while v(a) != 0xFF:
            w = B.Ventana(con(base, v(a)))
            dibujos(w, w.w(a + 3), w.w(a + 1), "p00:4C26")
            a += 6
            n += 1
        B.declara(v, v.w(0x6E4D + 2 * z), a + 1, "piezas_zona_%d" % z,
                  "%d fichas de 6 bytes [bancos][colores lo hi][lista lo hi][sitio] y un 0xFF: "
                  "las piezas de la zona %d (p00:4C0F; los bancos con p00:4C6B)" % (n, z),
                  "p00:4C1B", F=6)


N_JUEGOS_SALA = 18      # p35:60B7: 18 palabras, hasta p35:60DB
N_SPRITES = 28          # p35:60DB: 28 punteros, hasta p35:6113 (el 0 no se lee)


def sprites_de_sala():
    """p00:4E44 y las entradas de p00:4F55 con DE inmediato."""
    v = B.Ventana((35, 36, 37))
    B.declara(v, 0x6000, 0x6000 + 2 * N_ZONAS, "zonas_sprites",
              "%d punteros, uno por zona (0xCA4A): las parejas [sala][juego] de los sprites "
              "de la zona (p00:4E4A)" % N_ZONAS, "p00:4E4D", F="w8")
    for z in range(N_ZONAS):
        a0 = a = v.w(0x6000 + 2 * z)
        while v(a) != 0xFF:
            a += 2
        B.declara(v, a0, a + 1, "sprites_zona_%d" % z,
                  "%d parejas [sala (0xCA4B)][juego de sprites] y un 0xFF: la sala que no "
                  "esta lleva el juego 1 (p00:4E52)" % ((a - a0) // 2), "p00:4E55", F=2)
    B.declara(v, 0x60B7, 0x60B7 + 2 * N_JUEGOS_SALA, "juegos_sprites",
              "%d parejas [primero][segundo]: los dos bloques de sprites de cada juego, "
              "numeros de la tabla p35:60DB (p00:4E66; el segundo a 0xFF80, 0 = ninguno)"
              % N_JUEGOS_SALA, "p00:4E69", F=2)
    B.declara(v, 0x60DB, 0x60DB + 2 * N_SPRITES, "bloques_sprites",
              "%d punteros a bloques de sprites (p00:4F4C; el 0 no se lee: 0 es ninguno; el "
              "26 lo pone tambien p00:4EFD y el 1A en p00:4F09 va al banco 58)" % N_SPRITES,
              "p00:4F51", F="w8")
    for k in range(1, N_SPRITES):
        declara_rachas(v, v.w(0x60DB + 2 * k), "p00:4F58", fichas=True)
    t = B.trazador()
    vistos = set()
    for (d, b, pc, s_, hl, de) in t.llamadas:
        if de is None or not 0x6000 <= de < 0xC000:
            continue
        if d in (0x4F55, 0x4F21, 0x5037, 0x503D, 0x5043):
            # p00:5043 pone siempre los bancos 35-36-37 (p00:4109); el trazador
            # llega a 5037 con los de quien la llame
            if d in (0x5037, 0x503D, 0x5043):
                s_ = (35, 36, 37)
            k = (de, s_, True)
        elif d in (0x456E, 0x453E):
            k = (de, s_, False)
        else:
            continue
        if k in vistos:
            continue
        vistos.add(k)
        declara_rachas(B.Ventana(s_), de, "p%02d:%04X" % (b, pc), fichas=k[2])
    # las que solo apunta codigo que el trazador no alcanza (p00:5010 y
    # p00:504C, entre rutinas: `ld de,nn` y `call 5037/503D/5043`)
    for de in (0x7762, 0x670E, 0x6860, 0x858D):
        declara_rachas(v, de, "p00:%s (codigo sin trazar)" % {0x7762: "5010", 0x670E: "504C",
                                                             0x6860: "5066", 0x858D: "506E"}[de],
                       fichas=True)
    declara_rachas(v, 0x6A29, "p00:5055 (codigo sin trazar)")


# p00:5456: 0 = 24-25-26; 1 = 27-28 (p00:4113); 2 = 29-30 (p00:4118);
# 3 = 31 en 0xA000 (p00:420B)
MAPAS = {0: (24, 25, 26), 1: (24, 27, 28), 2: (24, 29, 30), 3: (24, 25, 31)}
ZONA_MAPA = 0x545C


def salas_por_zona():
    """Cuantas salas tiene cada zona: lo largo de cada lista de p56:BD28 (la
    ultima acaba donde empieza p56:BE63)."""
    v = B.Ventana((1, 2, 56))
    t = [v.w(0xBD28 + 2 * z) for z in range(N_ZONAS)]
    fin = sorted(set(t)) + [0xBE62]
    # la zona 19 tiene 6 salas y no 7: sus salas (p31:A3C2) acaban donde
    # empiezan los bloques de la zona 8 (p31:A4A0 = A3C2 + 6 x 37), y la
    # septima saldria con el juego 0x80. p56:BE62 queda fuera.
    return [fin[fin.index(a) + 1] - a for a in t]


def mapas():
    v56 = B.Ventana((1, 2, 56))
    n_salas = salas_por_zona()
    B.declara(v56, 0xBD28, 0xBD28 + 2 * N_ZONAS, "zonas_salas_datos",
              "%d punteros, uno por zona: un byte por sala (p00:58A7; los 4 bits altos a "
              "0xCA4C y los bajos a 0xCA4D)" % N_ZONAS, "p00:58A7", F="w8")
    for z in range(N_ZONAS):
        a = v56.w(0xBD28 + 2 * z)
        B.declara(v56, a, a + n_salas[z], "salas_datos_zona_%d" % z,
                  "%d bytes, uno por sala de la zona %d: los 4 bits altos a 0xCA4C y los "
                  "bajos a 0xCA4D (p00:58AB)" % (n_salas[z], z), "p00:58AB", F=16)
    v = B.Ventana(MAPAS[0])
    B.declara(v, 0x6000, 0x6000 + 2 * N_ZONAS, "zonas_salas",
              "%d punteros, uno por zona: las salas de la zona, de 37 bytes (p00:58C5)"
              % N_ZONAS, "p00:58C8", F="w8")
    B.declara(v, 0x6028, 0x6028 + 2 * N_ZONAS, "zonas_juegos_bloques",
              "%d punteros, uno por zona: la tabla de juegos de bloques de la zona (p00:58CE)"
              % N_ZONAS, "p00:58D1", F="w8")
    juegos = {}
    for z in range(N_ZONAS):
        w = B.Ventana(MAPAS[rom(0, ZONA_MAPA + z)])
        a = w.w(0x6000 + 2 * z)
        n = n_salas[z]
        B.declara(w, a, a + 37 * n, "salas_zona_%d" % z,
                  "%d salas de 37 bytes: [juego de bloques] y 6 x 6 bloques de 4 x 4 "
                  "caracteres (p00:58DD), la zona %d" % (n, z), "p00:58DD", F=37)
        t = w.w(0x6028 + 2 * z)
        for k in range(n):
            j = w(a + 37 * k)
            usados = [w(a + 37 * k + 1 + i) for i in range(36)]
            juegos.setdefault((t, MAPAS[rom(0, ZONA_MAPA + z)]), {}).setdefault(j, set()).update(usados)
    for (t, s_), js in sorted(juegos.items()):
        w = B.Ventana(s_)
        n = max(js) + 1
        B.declara(w, t, t + 2 * n, "juegos_bloques_%04X" % t,
                  "%d punteros a juegos de bloques (p00:58D5; las salas usan hasta el %d)"
                  % (n, n - 1), "p00:58D5", F="w8")
        for j, usados in sorted(js.items()):
            b0 = w.w(t + 2 * j)
            m = max(usados) + 1
            B.declara(w, b0, b0 + 16 * m, "bloques_%04X" % b0,
                      "%d bloques de 4 x 4 caracteres (16 bytes cada uno, p00:58EF; las salas "
                      "usan hasta el %d)" % (m, m - 1), "p00:58F8", F=16)


N_ESPECIALES = 58       # p24:64B6: 58 palabras hasta p24:652A, la primera rachas


def rachas_ram(v, a):
    """p00:51E0: como p00:453E pero sin el 0x80."""
    while True:
        n = v(a)
        a += 1
        if n == 0:
            return a
        a += (n & 0x7F) if n & 0x80 else 1


def salas_especiales():
    v = B.Ventana(MAPAS[0])
    B.declara(v, 0x64B6, 0x64B6 + 2 * N_ESPECIALES, "salas_0xCA76",
              "%d punteros, uno por cada valor de 0xCA76 (el 0 no se lee: con 0 la sala "
              "es de las normales, p00:588C): las salas en rachas (p00:56BE)" % N_ESPECIALES,
              "p00:56C1", F="w8")
    for k in range(1, N_ESPECIALES):
        a = v.w(0x64B6 + 2 * k)
        fin = rachas_ram(v, a)
        B.declara(v, a, fin, "salas_ca76_%04X" % a,
                  "salas en rachas a 0xE780 (p00:51E0: n < 0x80 repite el siguiente, n > 0x80 "
                  "copia n & 0x7F, 0 acaba): 36 bloques por sala, sin juego", "p00:56C8", F=16)
    v56 = B.Ventana((1, 2, 56))
    B.declara(v56, 0xBE63, 0xBE63 + N_ESPECIALES, "salas_0xCA76_datos",
              "%d bytes, uno por cada valor de 0xCA76: los 4 bits altos a L y los bajos a "
              "H (p00:566F)" % N_ESPECIALES, "p00:566F", F=16)
    v0 = B.Ventana((1, 2, 3))
    B.declara(v0, 0x56EF, 0x56EF + 2 * N_ZONAS, "zonas_bloques_0xCA76",
              "%d punteros, uno por zona: los bloques de las salas de 0xCA76 (p00:56D4; 0x56EE, "
              "que es un `ret`, en las zonas sin ellas; la 4 usa 0x89F9 para 0xCA76 = 15, 16, "
              "18-20, p00:56EB)" % N_ZONAS, "p00:56D7", F="w8")
    for z in range(N_ZONAS):
        a = v0.w(0x56EF + 2 * z)
        if a == 0x56EE:
            continue
        w = B.Ventana(MAPAS[rom(0, ZONA_MAPA + z)])
        b = w.banco(a)
        sig = min([x["ini"] for x in B.BLOQUES if x["p"] == b and x["ini"] > a] +
                  [(a & 0xE000) + 0x2000])
        m = (sig - a) // 16
        B.declara(w, a, a + 16 * m, "bloques_%04X" % a,
                  "%d bloques de 4 x 4 caracteres (16 bytes cada uno) de las salas de 0xCA76 de "
                  "la zona %d (p00:56D4): cuantos son no sale de recorrerlos, es lo que hay "
                  "hasta lo siguiente" % (m, z), "p00:58F8", F=16)


def todo():
    mapas()
    salas_especiales()
    zonas()
    sprites_de_sala()
    por_llamadas()
    colores()
