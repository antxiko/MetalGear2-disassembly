#!/usr/bin/env python3
"""El radar pintado por el cartucho (tools/mg2run.py).

El radar es el recuadro de 0x38 x 0x38 en (0xC4, 0x17) (pon_radar, p12:6F49):
las 3 x 3 salas alrededor de la de Snake desde el mapa de 0xD900
(fondo_del_radar, p12:6EC8), la raya que lo barre (radar_entre_cuadros,
p12:6D78) y, al acabar cada barrido, los puntos (radar_cada_cuadro, p12:6CE0;
cada uno en su sitio por sitio_en_el_radar, p12:6DE2). Con la alerta parpadea
(radar_en_alerta).

Aqui: la sala 2 de la zona 6 (cuatro soldados), el cuadro entero (p01:728E)
y el recuadro guardado cada 8 cuadros; despues, lo mismo con la alerta
(0xCA5F = 2, como cuando un actor ve a Snake, p04:8455).

Uso: radar.py  -> work/radar/sin_NNN.png, alerta_NNN.png y la sala entera
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
    m.llama(0x9E2B)
    m.pon(0xCADF, 0)
    mapas.entra_en_zona(m, ZONA)
    g = {v: k for k, v in mapas.rejilla(ZONA).items()}
    jefes.a_la_sala(m, g[SALA] >> 4, g[SALA] & 15)
    # la partida nueva lo deja apagado (0xCABA = 1, p02:9E6F) hasta el final de
    # la llegada de Snake (estado 0x19, p11:A107) o la conversacion 0x27
    # (p06:B048); aqui no hay llegada (0xCADF = 0): se enciende como p11:A107
    m.pon(0xCABA, 0)
    vistos = set()
    for k in range(400):
        if k == 200:
            m.pon(0xCA5F, 2)                  # la alerta
        m.pon(0xCA08, 0)
        m.pon(0xCA07, 0)
        m.bancos_123()
        m.llama(0x728E)
        m.pon(0xCA53, 0x20)
        if m.mem[0xCA00] != 5 or m.mem[0xCA01] != 0:
            print("cuadro %d: estado %d paso %d" % (k, m.mem[0xCA00], m.mem[0xCA01]))
        if k % 8 == 0:
            v = m.vdp
            im = v.pagina((v.r[2] >> 5) & 3, 212)
            r = im.crop((0xC4, 0x17, 0xC4 + 0x38, 0x17 + 0x38))
            h = r.tobytes()
            if h not in vistos:
                vistos.add(h)
                r.save(os.path.join(SAL, "%s_%03d.png" % ("alerta" if k >= 200 else "sin", k)))
            if k in (160, 360):
                mapas.sprites_de_ram(v, m.mem, im)
                im.save(os.path.join(SAL, "sala_%03d.png" % k))
    print(len(vistos), "radares distintos")


if __name__ == "__main__":
    main()
