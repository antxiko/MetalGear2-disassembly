#!/usr/bin/env python3
"""El radar pintado por el cartucho (tools/mg2run.py).

El radar es el recuadro de 0x38 x 0x38 en (0xC4, 0x17) (pon_radar, p12:6F49):
las 3 x 3 salas alrededor de la de Snake desde el mapa de 0xD900
(fondo_del_radar, p12:6EC8), la raya que lo barre (radar_entre_cuadros,
p12:6D78) y, al acabar cada barrido, los puntos (radar_cada_cuadro, p12:6CE0;
cada uno en su sitio por sitio_en_el_radar, p12:6DE2). Con la alerta parpadea
(radar_en_alerta).

Aqui: la sala 2 de la zona 6 (cuatro soldados), el cuadro entero (p01:728E)
y el recuadro guardado cada 8 cuadros; despues, lo mismo con la alerta puesta
como la pone un actor que ve a Snake (alerta_sin_musica, p04:9955 -> p14:B176,
que pone 0xCA5F y el marcador: 0xE208 = 0x0800). Con 0xCA5F solo no basta: la
cuenta 0xE209 empieza en 0 y el parpadeo tardaria 256 cuadros.

Despues, la alerta 1 (a_alerta_1, p04:934C). En el recuadro (rotulos_de_alerta,
p04:984C): LEVEL = alerta + 1 (tope 3) y el numero, con la 2 la vida de Snake
(0xCA53) y con la 1 la cuenta 0xD42B / 8.

Uso: radar.py  -> work/radar/sin_NNN.png, alerta2_NNN.png, alerta1_NNN.png y
la sala entera (sala_160, sala_260, sala_460)
"""
import os
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)
RAIZ = os.path.join(AQUI, "..")
SAL = os.path.join(RAIZ, "work", "radar")
ZONA, SALA = 6, 2


def main():
    import mapas
    import jefes
    from mg2run import Mg2
    os.makedirs(SAL, exist_ok=True)
    m = Mg2()
    m.partida_nueva()
    m.pon(0xCADF, 0)
    mapas.entra_en_zona(m, ZONA)
    g = {v: k for k, v in mapas.rejilla(ZONA).items()}
    jefes.a_la_sala(m, g[SALA] >> 4, g[SALA] & 15)
    # la partida nueva lo deja apagado (0xCABA = 1, p02:9E6F) hasta el final de
    # la llegada de Snake (estado 0x19, p11:A107) o la conversacion 0x27
    # (p06:B048); aqui no hay llegada (0xCADF = 0): se enciende como p11:A107
    m.pon(0xCABA, 0)
    vistos = set()
    aviso = 0
    from gif_juego import Gif
    gif = Gif()                               # el radar entero, cuadro a cuadro, al ritmo del MSX
    for k in range(500):
        if k == 200:                          # la alerta como la pone un actor:
            m.bancos_123()                    # alerta_sin_musica (p04:9955 ->
            m.pon_banco(0x8000, 4)            # p14:B176), con su marcador
            m.mem[0xC382] = 4                 # (p04:9814: 0xE208 = 0x0800)
            m.llama(0x9955)
            print("alerta", m.mem[0xCA5F], "E208/9 %02X %02X" % (m.mem[0xE208], m.mem[0xE209]))
        if k == 300:                          # la alerta 1, la de despues
            m.bancos_123()                    # (a_alerta_1, p04:934C: la cuenta
            m.pon_banco(0x8000, 4)            # 0xD42B de p15:BE48 y sus rotulos)
            m.mem[0xC382] = 4
            m.llama(0x934C)
            print("alerta", m.mem[0xCA5F], "cuenta", m.mem[0xD42B] | m.mem[0xD42C] << 8)
        m.pon(0xCA08, 0)
        m.pon(0xCA07, 0)
        m.bancos_123()
        m.llama(0x728E)
        m.pon(0xCA53, 0x20)
        if m.mem[0xCA00] != 5 or m.mem[0xCA01] != 0:
            print("cuadro %d: estado %d paso %d" % (k, m.mem[0xCA00], m.mem[0xCA01]))
            if m.mem[0xCA01] == 9 and k - (aviso or k) < 6:  # el aviso sobre el actor que ve
                aviso = aviso or k                 # a Snake (0xD458, p12:74BC)
                v = m.vdp
                im = v.pagina((v.r[2] >> 5) & 3, 212)
                mapas.sprites_de_ram(v, m.mem, im)
                im.save(os.path.join(SAL, "aviso_%03d.png" % k))
        v = m.vdp
        rad = v.pagina((v.r[2] >> 5) & 3, 212).convert("RGB").crop((0xC4, 0x17, 0xC4 + 0x38, 0x17 + 0x38))
        gif.pon(rad.resize((0x38 * 3, 0x38 * 3)))
        if k % 4 == 0:
            v = m.vdp
            im = v.pagina((v.r[2] >> 5) & 3, 212)
            r = im.crop((0xC4, 0x17, 0xC4 + 0x38, 0x17 + 0x38))
            h = r.tobytes()
            if h not in vistos:
                vistos.add(h)
                r.save(os.path.join(SAL, "%s_%03d.png" % ("sin" if k < 200 else "alerta2" if k < 300 else "alerta1", k)))
            if k in (160, 260, 460):
                mapas.sprites_de_ram(v, m.mem, im)
                im.save(os.path.join(SAL, "sala_%03d.png" % k))
    gif.guarda(os.path.join(SAL, "radar.gif"))
    print(len(vistos), "radares distintos")


if __name__ == "__main__":
    main()
