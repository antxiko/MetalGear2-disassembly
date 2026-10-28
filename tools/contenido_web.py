#!/usr/bin/env python3
"""EL CONTENIDO de la web de este cartucho: lo unico que es de este juego.

jekyll.py y make_web.py son la maquinaria y no llevan dentro el nombre de
ningun juego: lo leen de aqui.

Todas las cifras de aqui estan medidas sobre este cartucho, con las
herramientas de tools/: CODIGO y DATOS los imprime tools/presupuesto.py
(make sanity) y RUTINAS, INSTRUCCIONES y COMENTARIOS los da
tools/densidad_total.py.
"""

NOMBRE = "Metal Gear 2: Solid Snake"
CATALOGO = "RC-767"
ANIO = 1990
REPOSITORIO = "https://github.com/antxiko/MetalGear2-disassembly"

CODIGO = 118147
DATOS = 406141
RUTINAS = 7673
INSTRUCCIONES = 57378
COMENTARIOS = 26326


def densidad(idioma):
    """El porcentaje comentado, con la coma o el punto de cada idioma."""
    d = "%.1f" % (100.0 * COMENTARIOS / INSTRUCCIONES)
    return d.replace(".", ",") if idioma == "es" else d


PIE_LEGAL = {
    "es": "<em>Metal Gear 2: Solid Snake</em> (メタルギア2 ソリッドスネーク) lo "
          "public&oacute; Konami para MSX2 en 1990; su n&uacute;mero de cat&aacute;logo "
          "es RC-767 y son 512 KB. Todos los derechos sobre el juego siguen siendo de sus "
          "titulares. Este trabajo es de preservaci&oacute;n, estudio y "
          "documentaci&oacute;n, y la imagen del cartucho no se distribuye.",
    "en": "<em>Metal Gear 2: Solid Snake</em> (メタルギア2 ソリッドスネーク) was "
          "published by Konami for the MSX2 in 1990; its catalogue number is RC-767 and "
          "it is 512 KB. All rights in the game remain with their holders. This is "
          "preservation, study and documentation work, and the cartridge image is not "
          "distributed.",
}

PORTADA = {
    "es": dict(
        titulo="Metal Gear 2: Solid Snake - desensamblado comentado",
        claim="Las 20 zonas con sus 274 salas y sus 57 especiales, Snake con sus 98 "
              "dibujos, los enemigos, las once peleas, las armas, el equipo y el radar, "
              "el transceptor con todas sus conversaciones, los textos, las 44 "
              "m&uacute;sicas sacadas de su propio motor, la presentaci&oacute;n y el "
              "final, y el monitor de depuraci&oacute;n que esconde el &uacute;ltimo banco.",
        ficha=["Konami - <b>(c) Konami 1990</b>",
               "Cartucho <b>RC-767</b>, MegaROM de 512 KB (Konami con SCC)",
               "<b>MSX2</b>", "Volcado <b>af567ea6...</b>"],
        aviso="<b>Aqu&iacute; no hay capturas del juego.</b> Los mapas, los personajes, "
              "las peleas, las pantallas y las secuencias los <b>pinta el propio "
              "cartucho</b>, ejecutado aqu&iacute; con su c&oacute;digo, y est&aacute;n "
              "cotejados con la VRAM de openMSX punto a punto. Las &uacute;nicas capturas "
              "son las del monitor de depuraci&oacute;n, que sin un parche no se ve.",
    ),
    "en": dict(
        titulo="Metal Gear 2: Solid Snake - commented disassembly",
        claim="The 20 zones with their 274 rooms and 57 special rooms, Snake with his "
              "98 drawings, the enemies, the eleven boss fights, the weapons, the "
              "equipment and the radar, the transceiver with every conversation, the "
              "texts, the 44 tunes taken from its own engine, the intro and the ending, "
              "and the debug monitor hidden in the last bank.",
        ficha=["Konami - <b>(c) Konami 1990</b>",
               "Cartridge <b>RC-767</b>, 512 KB MegaROM (Konami with SCC)",
               "<b>MSX2</b>", "Dump <b>af567ea6...</b>"],
        aviso="<b>There are no screenshots of the game here.</b> The maps, the "
              "characters, the fights, the screens and the sequences are <b>painted by "
              "the cartridge itself</b>, running its own code here, and checked against "
              "openMSX's VRAM point by point. The only screenshots are those of the debug "
              "monitor, which cannot be seen without a patch.",
    ),
}

# Los tres bloques: el juego | curiosidades | por dentro.
# (en, es, titulo en, titulo es, que hay en, que hay es)
PAGINAS = [
    [("THE-MAPS.html", "LOS-MAPAS.html", "The maps", "Los mapas",
      "the 20 zones, room by room, with their doors, special rooms and enemies",
      "las 20 zonas, sala a sala, con sus puertas, sus especiales y sus enemigos"),
     ("SNAKE.html", "SNAKE.html", "Snake", "Snake",
      "his 98 drawings, the weapons (F2), the equipment (F3) and the radar",
      "sus 98 dibujos, las armas (F2), el equipo (F3) y el radar"),
     ("THE-ENEMIES.html", "LOS-ENEMIGOS.html", "The enemies", "Los enemigos",
      "the 17 kinds of actor with all their drawings",
      "los 17 tipos de actor con todos sus dibujos"),
     ("THE-BOSSES.html", "LOS-JEFES.html", "The bosses", "Los jefes",
      "the eleven fights, played by the cartridge",
      "las once peleas, jugadas por el cartucho"),
     ("THE-TRANSCEIVER.html", "EL-TRANSCEPTOR.html", "The transceiver", "El transceptor",
      "the frequencies, who answers, the portraits and every conversation",
      "las frecuencias, qui&eacute;n contesta, los retratos y todas las conversaciones"),
     ("THE-TEXTS.html", "LOS-TEXTOS.html", "The texts", "Los textos",
      "the font, its 128 kanji, the signs and the rest of the messages",
      "la fuente, sus 128 kanji, los letreros y el resto de los mensajes"),
     ("THE-MUSIC.html", "LA-MUSICA.html", "The music", "La m&uacute;sica",
      "the 44 tunes, from its own sound engine, and where each one is asked for",
      "las 44 m&uacute;sicas, de su propio motor de sonido, y d&oacute;nde se pide cada una"),
     ("THE-SEQUENCES.html", "LAS-SECUENCIAS.html", "The sequences", "Las secuencias",
      "the intro, the title and the ending, at the MSX's own pace",
      "la presentaci&oacute;n, el t&iacute;tulo y el final, al ritmo del MSX")],
    [("CURIOSITIES.html", "CURIOSIDADES.html", "Curiosities", "Curiosidades",
      "VRAM:OIK, the 140.07 radio, Konami and the MSX inside the game, SNATCHER, "
      "the open questions",
      "VRAM:OIK, la radio del 140.07, Konami y el MSX dentro del juego, SNATCHER, "
      "las preguntas abiertas"),
     ("THE-DEBUG-MONITOR.html", "EL-MONITOR.html", "The debug monitor", "El monitor",
      "the programmers' tool left in bank 63, switched off by two bytes",
      "la herramienta de los programadores que queda en el banco 63, apagada con dos bytes")],
    [("UNDER-THE-HOOD.html", "POR-DENTRO.html", "Under the hood", "Por dentro",
      "rebuilding the ROM, the mapper, the interrupt in RAM, the states, the RAM, "
      "the VRAM and the tools",
      "rehacer la ROM, el mapper, la interrupci&oacute;n en la RAM, los estados, la RAM, "
      "la VRAM y las herramientas")],
]

# Repositorio nuevo: no hay paginas viejas que redirigir.
VIEJAS = {}

LOGOTIPO = "logotipo.png"
