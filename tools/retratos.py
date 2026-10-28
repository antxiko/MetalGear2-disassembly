#!/usr/bin/env python3
"""Los 12 retratos de quien habla, pintados por el cartucho (tools/jefes.py).

pon_mosaico_de_quien_habla (p03:B814) pone el mosaico A de p44:93FD, de 6
filas de 4 caracteres (32 x 48), con mosaico_de_93fd (p01:70AE); antes, la
pantalla de conversacion carga sus dibujos, la lista A de p44:93E5, en la VRAM
de 0x6000 (dibujos_de_93e5, p01:6E18; mosaico_de_la_derecha p09:BA47 lo hace
con el sitio del numero + 1). Aqui: la pelea del 5 empieza con una llamada (la
pantalla de conversacion y su paleta puestas); cada retrato se carga, se pinta
en (0x90, 0x18), el sitio del de la derecha, y se recorta.

Quien es cada uno: el 0, Snake (mosaico_de_la_izquierda, p09:BA2E); del 1 al 8,
el sitio del numero + 1 (p09:BA50): 1 キャンベル (140.85), 2 マスター (.38),
3 ノルデン (.40), 4 ホーリー (.15), 5 ケスラー (.93), 6 ペトロ (.82), 7 マルフ
(.51), 8 FOX (.27; tambien con su mensaje p50:990C, p05:BC0D); 9 ナターシャ (la
escena 2, p09:A8B4, con la secuencia p50:806B de ペトロ y ナターシャ); 10 BIG
BOSS (con sus mensajes p50:92BB y 92FF, p05:D8A9); 11, igual que el 9 punto por
punto (a la izquierda en la escena 3, p09:BA2E).

Uso: retratos.py  -> work/textos/retrato_NN.png y retratos.png
"""
import os
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)
SAL = os.path.join(AQUI, "..", "work", "textos")


QUIEN = ["SNAKE", "キャンベル", "マスター", "ノルデン", "ホーリー", "ケスラー", "ペトロ",
         "マルフ", "FOX", "ナターシャ", "BIG BOSS", "ナターシャ (= 9)"]


def main():
    import jefes
    from PIL import Image
    os.makedirs(SAL, exist_ok=True)
    m = jefes.maquina(jefes.ficha(5))
    for k in range(60):                       # hasta la pantalla de conversacion (paso 4)
        m.pon(0xCA08, 0)
        m.pon(0xCA07, 0)
        m.bancos_123()
        m.llama(0x728E)
        if m.mem[0xCA01] == 4 and k > 20:
            break
    v, pag = m.vdp, m.mem[0xCA42]
    hoja = Image.new("RGB", (12 * 36, 52), (0, 0, 0))
    for a in range(12):
        m.bancos_123()
        m.llama(0x6E18, a=a)                  # dibujos_de_93e5
        m.bancos_123()
        m.llama(0x70AE, a=a, d=0x90, e=0x18, b=0)   # mosaico_de_93fd
        r = v.pagina(pag, 212).crop((0x90, 0x18, 0x90 + 32, 0x18 + 48))
        r.save(os.path.join(SAL, "retrato_%02d.png" % a))
        hoja.paste(r, (a * 36 + 2, 2))
    hoja.save(os.path.join(SAL, "retratos.png"))
    print("12 retratos ->", SAL)


if __name__ == "__main__":
    main()
