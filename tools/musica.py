#!/usr/bin/env python3
"""La musica de Metal Gear 2: Solid Snake (PSG y SCC), ejecutando su motor de
sonido (ver motor_musica.py).

El motor vive en el banco 16, puesto en 0x4000, y sus datos en el 17 (0x6000),
el 18 (0x8000) y el de 0xA000, que cambia con cada musica:
  p16:4000  jp p16:4009   arranque: calla todo
  p16:4003  jp p16:4024   pide el sonido A (la RAM lo llama en 0xC340, copia de
                          p03:A14B, con 16-17-18-19 puestos)
  p16:4006  jp p16:428F   el sonido de cada cuadro (p16:4295 pone en 0xA000 el
                          banco de la musica, 0xC68F)
La cabecera de cada sonido sale de la tabla p17:65A9 + 2 x numero (p16:4063).
Las musicas son 0x6A-0xAA, con su banco en p16:4CF9 (p16:4CE3): 19-23, 55 y 59.
Uso:  musica.py registros 0x6A [cuadros] | mp3 0x6A f.mp3
"""
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import motor_musica  # noqa: E402
from motor_musica import P  # noqa: E402

K = "Konami"
# Las 44 musicas: de los sonidos 0x6A-0xAA (con su partitura en un banco de
# musica, p16:4CE3), los que vuelven a empezar o duran mas de 12 s; los golpes
# cortos (0x85-0x97, 0x9B, 0xA1, 0xA5-0xA7) y los de 2 cuadros (0x75, 0x8F,
# 0x95) son efectos. Medidas: work/medidas_sonidos.json. Cada una dice de donde
# la pide el codigo: la rutina sonido_NN (p01:6B1E...), la musica de la zona en
# cada fase (las listas de p06:B40C), la pendiente de 0xCA19 o una tabla.
# La radio: con el 140.07 en el transceptor suena una de 16 al azar (sonido_al_azar
# p09:BFB5, tabla p09:BFC1).
# Cotejadas las 44 con openMSX (tools/lanza_psg.ps1 -siempre 0xNN -solo 1,
# tools/coteja_psg.py): el PSG y el SCC iguales en todos los cuadros y las
# escrituras identicas. La 0x8A, igual salvo el cuadro 0, en el que el juego
# recarga las cinco ondas del SCC y musica.py solo una (lo mas probable: la
# recarga de p16:42A2 cuando 0xFDA2 no casa con 0xC660; quitada esa recarga
# de la grabacion, los 10035 cuadros iguales).
PIEZAS = [
    P(0x6A, "Zona 0 en la fase 0 y zona 1 en la 5 (p06:B40C); al salir de una conversación (p09:B840) y al acabar la llegada de Snake (p11:A114)",
      "Zone 0 in phase 0 and zone 1 in phase 5 (p06:B40C); after a conversation (p09:B840) and at the end of Snake's arrival (p11:A114)", K),
    P(0x6B, "No la pide nadie: ni una rutina ni una tabla de la ROM", "Nobody asks for it: no routine or table in the ROM", K),
    P(0x6C, "Zona 6 en todas las fases, y las zonas sin otra en la fase 0 (p06:B40C)", "Zone 6 in every phase, and the zones without another one in phase 0 (p06:B40C)", K),
    P(0x6D, "Las zonas sin otra en las fases 3, 6 y 7 (p06:B40C)", "The zones without another one in phases 3, 6 and 7 (p06:B40C)", K),
    P(0x6E, "No la pide nadie: ni una rutina ni una tabla de la ROM", "Nobody asks for it: no routine or table in the ROM", K),
    P(0x6F, "Zonas 3 y 4 en la fase 4; las demás en la 5 (p06:B40C)", "Zones 3 and 4 in phase 4; the rest in phase 5 (p06:B40C)", K),
    P(0x70, "La zona 0 y sus vecinas (0-5) desde la fase 1 (p06:B40C)", "Zone 0 and its neighbours (0-5) from phase 1 on (p06:B40C)", K),
    P(0x71, "Zonas 3-4 en la fase 0, 1-5 en la 2, 8 en las 3, 5 y 6 (p06:B40C); y la pendiente de p02:8AB9",
      "Zones 3-4 in phase 0, 1-5 in phase 2, 8 in phases 3, 5 and 6 (p06:B40C); and the pending one of p02:8AB9", K),
    P(0x72, "Zona 1 en la fase 0; zonas 7 y 9 desde la 3 (p06:B40C); tras la escena 1 (p09:A68A)",
      "Zone 1 in phase 0; zones 7 and 9 from phase 3 (p06:B40C); after scene 1 (p09:A68A)", K),
    P(0x73, "Al subir con 0xCB21 = 9 (p09:A049); en la radio del 140.07", "Going up with 0xCB21 = 9 (p09:A049); on the 140.07 radio", K),
    P(0x74, "La pendiente de p02:8AA3", "The pending one of p02:8AA3", K),
    P(0x76, "La música de un actor, la primera de p04:8691 (musica_del_actor, p04:8671)", "An actor's tune, the first of p04:8691 (musica_del_actor, p04:8671)", K),
    P(0x77, "La música de un actor, la segunda de p04:8691; y con la ficha 0xD800 de tipo 1 (p09:BB20)",
      "An actor's tune, the second of p04:8691; and with the 0xD800 record of type 1 (p09:BB20)", K),
    P(0x78, "La música de un actor, la tercera de p04:8691", "An actor's tune, the third of p04:8691", K),
    P(0x79, "La música de un actor, la cuarta de p04:8691", "An actor's tune, the fourth of p04:8691", K),
    P(0x7A, "La pendiente de p02:8AAA; en la radio del 140.07", "The pending one of p02:8AAA; on the 140.07 radio", K),
    P(0x7B, "Solo en la radio del 140.07 (p09:BFC1)", "Only on the 140.07 radio (p09:BFC1)", K),
    P(0x7C, "Zonas 8 y 0x0A en la fase 4 (p06:B40C)", "Zones 8 and 0x0A in phase 4 (p06:B40C)", K),
    P(0x7D, "Zona 8 en la fase 7 (p06:B40C), la sala de la zona 7 (p00:554B), con 0xD4E3 (p01:7D0C) y en la escena 4 (p09:A996)",
      "Zone 8 in phase 7 (p06:B40C), the zone 7 room (p00:554B), with 0xD4E3 (p01:7D0C) and in scene 4 (p09:A996)", K),
    P(0x7E, "Las pendientes de p02:8A2A y p02:8A4F", "The pending ones of p02:8A2A and p02:8A4F", K),
    P(0x7F, "Con 0xD430 = 1 o con 0xD4E4 (musica_6b8d, p01:7CF9 y p01:7D14)", "With 0xD430 = 1 or with 0xD4E4 (musica_6b8d, p01:7CF9 and p01:7D14)", K),
    P(0x80, "Zonas 2 y 5 en la fase 0, la 2 en la 1 (p06:B40C); con 0xD4E2 (p01:7D04)", "Zones 2 and 5 in phase 0, zone 2 in phase 1 (p06:B40C); with 0xD4E2 (p01:7D04)", K),
    P(0x81, "Escenas de las fichas 0xD8A7-0xD8AC y la sala 5 (p05:AB2B, B06F, BA1C, BE46); en la radio del 140.07",
      "Scenes of the 0xD8A7-0xD8AC records and room 5 (p05:AB2B, B06F, BA1C, BE46); on the 140.07 radio", K),
    P(0x82, "Con 0xCAF2 o 0xCAF6 (p11:BB46, p14:BA8E); mientras suena, 0xC697 no deja cambiar la de la zona",
      "With 0xCAF2 or 0xCAF6 (p11:BB46, p14:BA8E); while it plays, 0xC697 keeps the zone tune from changing", K),
    P(0x83, "Al empezar una llamada del transceptor (p09:B8EA)", "When a transceiver call starts (p09:B8EA)", K),
    P(0x84, "Las peleas: las fichas 0xD800 de los tipos 2, 3, 4, 6, 7 y 0x0A (p05:A5F9...) y la escena de 0xD8AC",
      "The boss fights: the 0xD800 records of types 2, 3, 4, 6, 7 and 0x0A (p05:A5F9...) and the 0xD8AC scene", K),
    P(0x88, "Con 0xCAF2 (p11:BB43), como la 0x82", "With 0xCAF2 (p11:BB43), like 0x82", K),
    P(0x89, "p01:73CF y la ficha 0xD8A9 (p05:B5BA)", "p01:73CF and the 0xD8A9 record (p05:B5BA)", K),
    P(0x8A, "p07:A36D", "p07:A36D", K),
    P(0x91, "La pelea del tipo 1, el helicóptero (p15:B8F2), y la escena 9 (p09:B5A2)", "The type 1 fight, the helicopter (p15:B8F2), and scene 9 (p09:B5A2)", K),
    P(0x98, "El final, mientras sube Zanzibar (p13:961C), hasta que la corta la 0xA3: 29,3 s en el MSX",
      "The ending, while Zanzibar rises (p13:961C), until 0xA3 cuts it: 29.3 s on the MSX", K),
    P(0x99, "La presentación (p13:808F); en la radio del 140.07", "The intro (p13:808F); on the 140.07 radio", K),
    P(0x9A, "La presentación (p14:A336); en la radio del 140.07", "The intro (p14:A336); on the 140.07 radio", K),
    P(0x9C, "La escena 3 (p09:A8D3) y el mensaje por sitio (p05:A9E8); en la radio del 140.07", "Scene 3 (p09:A8D3) and the message by place (p05:A9E8); on the 140.07 radio", K),
    P(0x9D, "La escena 2 (p09:A7AA) y la llegada a la sala 5 (p05:BFCB); en la radio del 140.07", "Scene 2 (p09:A7AA) and arriving in room 5 (p05:BFCB); on the 140.07 radio", K),
    P(0x9E, "Las escenas 1, 6 y 7 (p09:A639, AFDD, B1D5); en la radio del 140.07", "Scenes 1, 6 and 7 (p09:A639, AFDD, B1D5); on the 140.07 radio", K),
    P(0x9F, "La sala 5 (p05:BD9F); en la radio del 140.07", "Room 5 (p05:BD9F); on the 140.07 radio", K),
    P(0xA0, "La ficha 0xD8AA (p05:BBE1); en la radio del 140.07", "The 0xD8AA record (p05:BBE1); on the 140.07 radio", K),
    P(0xA2, "La escena 9 (p09:B5E7); en la radio del 140.07", "Scene 9 (p09:B5E7); on the 140.07 radio", K),
    P(0xA3, "El final, estado 7 (p13:9731); en la radio del 140.07", "The ending, state 7 (p13:9731); on the 140.07 radio", K),
    P(0xA4, "El final, estado 7 (p13:99FE); en la radio del 140.07", "The ending, state 7 (p13:99FE); on the 140.07 radio", K),
    P(0xA8, "Tras una conversación de la lista (p06:AF02)", "After a conversation of the list (p06:AF02)", K),
    P(0xA9, "Solo en la radio del 140.07 (p09:BFC1)", "Only on the 140.07 radio (p09:BFC1)", K),
    P(0xAA, "Solo en la radio del 140.07 (p09:BFC1)", "Only on the 140.07 radio (p09:BFC1)", K),
]

CFG = dict(rom="metalgear2.rom", org=0x4000, mapper="konami_scc",
           bancos0=((0x4000, 16), (0x6000, 17), (0x8000, 18), (0xA000, 19)),
           bancos_frame=((0x4000, 16), (0x6000, 17), (0x8000, 18), (0xA000, 19)),
           sp=0xDFF0, ram0=[], init=[(0x4000, {})], frame=0x4006, pide=0x4003,
           banco_frame=16, banco_pide=16, ram=(0xC400, 0xC6A0), hz=60,
           psg0={7: 0xBF}, romtype="KonamiSCC", max_s=90, piezas=PIEZAS,
           pagina=None,
           # la 0x98 no vuelve a empezar ni se calla: en el final (p13:961C, el
           # cuadro 248 del estado 7) suena hasta que el paso 9 pide la 0xA3
           # (p13:9731, el cuadro 1322): 1756 cuadros reales del MSX
           # (work/ritmo_final.txt), 29,3 s
           corte={0x98: 1756},
           # 0xC660 cuenta los cuadros (p16:42C6): no cierra el bucle
           excluye=[0xC660], juntos={}, cotejado=[n for n, *_ in PIEZAS], ram_de={},
           maquina="C-BIOS_MSX2_JP")

if __name__ == "__main__":
    sys.exit(motor_musica.main(CFG, sys.argv[1:]))
