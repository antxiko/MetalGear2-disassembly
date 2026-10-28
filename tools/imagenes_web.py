#!/usr/bin/env python3
"""Las imagenes y las musicas de la web, montadas con lo que pinta el cartucho
ejecutado. Aqui no se dibuja nada: se juntan, se recortan y se amplian los PNG
que dejan en work/ las herramientas que corren el juego:

  mapas.py rotular        work/mapas/web_zona_ZZ.png   -> zona_ZZ.png
  snake.py barre          work/snake/NNN_dDD.png       -> snake.png
  actores_dibujos.py      work/actores/tTT_dDD.png     -> actores.png
  jefes.py + jefes_web.py work/jefes/web_tTT.png       -> jefe_TT.png
  equipo.py f2 / f3       work/equipo/f2_*, f3_*       -> armas.png, equipo.png
  radar.py                work/radar/*                 -> radar.png
  retratos.py             work/textos/retrato_NN.png   -> retratos.png, tabaco.png
  textos.py fuente        work/textos/fuente_f0/f8.png -> fuente_f0.png, fuente_f8.png
  secuencias.py gif       work/gif/*.gif               -> los GIF; logotipo.png (titulo)
  secuencias.py final     work/final/f07060.png        -> vram_oik.png
  musica.py todas         work/audio/musica_NN.mp3     -> docs/audio/

Uso: imagenes_web.py <docs>   (necesita PIL: el python de Programs)
"""
import json
import os
import shutil
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
WORK = os.path.join(AQUI, "..", "work")
NEGRO = (0, 0, 0)


def w(*p):
    return os.path.join(WORK, *p)


def amplia(im, k):
    from PIL import Image
    return im.resize((im.size[0] * k, im.size[1] * k), Image.NEAREST)


def rejilla(dibujos, por_fila, celda, k=2, fondo=NEGRO):
    """Los dibujos (RGBA) en filas de por_fila, cada uno centrado abajo en su
    celda (ancho, alto), sobre fondo, ampliados k veces."""
    from PIL import Image
    cw, ch = celda
    filas = (len(dibujos) + por_fila - 1) // por_fila
    hoja = Image.new("RGB", (cw * min(por_fila, len(dibujos)), ch * filas), fondo)
    for i, im in enumerate(dibujos):
        x = (i % por_fila) * cw + (cw - im.size[0]) // 2
        y = (i // por_fila) * ch + (ch - im.size[1]) // 2
        hoja.paste(im, (x, y), im if im.mode == "RGBA" else None)
    return amplia(hoja, k)


def guarda(im, docs, nombre):
    ruta = os.path.join(docs, "imagenes", nombre)
    im.save(ruta, optimize=True)
    print("  %-22s %4d x %-4d %4d KB" % (nombre, im.size[0], im.size[1], os.path.getsize(ruta) // 1024))


def main(docs):
    from PIL import Image, ImageSequence
    img = os.path.join(docs, "imagenes")
    os.makedirs(img, exist_ok=True)

    # el titulo, del GIF de la presentacion: la imagen quieta antes del blanco
    fr = [f.convert("RGB").copy() for f in ImageSequence.Iterator(Image.open(w("gif", "titulo.gif")))]
    quieta = max(range(len(fr)), key=lambda i: fr[i].info.get("duration", 0) if i < len(fr) - 1 else 0)
    guarda(amplia(fr[quieta].crop((0, 40, 256, 140)), 2), docs, "logotipo.png")

    for z in range(20):
        guarda(Image.open(w("mapas", "web_zona_%02X.png" % z)), docs, "zona_%02X.png" % z)

    # Snake: los 98 dibujos del barrido, una fila por dibujo de 0xCB01
    snake = json.load(open(w("snake", "snake.json"), encoding="utf-8"))
    porn = {}
    for s in snake:
        porn.setdefault(s["dibujo"], []).append(Image.open(w("snake", s["fichero"])))
    filas = [rejilla(v, 16, (36, 40)) for _, v in sorted(porn.items())]
    hoja = Image.new("RGB", (max(f.size[0] for f in filas), sum(f.size[1] for f in filas)), NEGRO)
    y = 0
    for f in filas:
        hoja.paste(f, (0, y))
        y += f.size[1]
    guarda(hoja, docs, "snake.png")

    # los actores: una fila por tipo
    act = json.load(open(w("actores", "actores.json"), encoding="utf-8"))
    filas = []
    for t in sorted(act):
        ims = [Image.open(w("actores", p["fichero"])) for p in act[t]["pintados"]]
        filas.append(rejilla(ims, 16, (36, 40)))
    hoja = Image.new("RGB", (max(f.size[0] for f in filas), sum(f.size[1] for f in filas)), NEGRO)
    y = 0
    for f in filas:
        hoja.paste(f, (0, y))
        y += f.size[1]
    guarda(hoja, docs, "actores.png")

    for t in range(1, 12):
        guarda(Image.open(w("jefes", "web_t%02X.png" % t)), docs, "jefe_%02X.png" % t)

    guarda(amplia(Image.open(w("equipo", "f2_00_c01.png")).convert("RGB"), 2), docs, "armas.png")
    guarda(amplia(Image.open(w("equipo", "f3_00_c01.png")).convert("RGB"), 2), docs, "equipo.png")

    # el radar: sin alerta (barrido y puntos), alerta 2, alerta 1
    tira = [Image.open(w("radar", n)).convert("RGB") for n in
            ("sin_008.png", "sin_160.png", "alerta2_208.png", "alerta1_304.png")]
    hoja = Image.new("RGB", (len(tira) * 60 - 4, 56), (40, 40, 40))
    for i, im in enumerate(tira):
        hoja.paste(im, (i * 60, 0))
    guarda(amplia(hoja, 3), docs, "radar.png")

    ret = [Image.open(w("textos", "retrato_%02d.png" % i)).convert("RGB") for i in range(12)]
    hoja = Image.new("RGB", (12 * 36 - 4, 48), NEGRO)
    for i, im in enumerate(ret):
        hoja.paste(im, (i * 36, 0))
    guarda(amplia(hoja, 2), docs, "retratos.png")
    dos = [Image.open(w("textos", n)).convert("RGB") for n in ("retrato_00.png", "retrato_00_tabaco.png")]
    hoja = Image.new("RGB", (68, 48), NEGRO)
    for i, im in enumerate(dos):
        hoja.paste(im, (i * 36, 0))
    guarda(amplia(hoja, 3), docs, "tabaco.png")

    for f in ("fuente_f0.png", "fuente_f8.png"):
        guarda(Image.open(w("textos", f)).convert("RGB"), docs, f)

    guarda(amplia(Image.open(w("final", "f07060.png")).convert("RGB"), 2), docs, "vram_oik.png")

    for f in sorted(os.listdir(w("gif"))):
        shutil.copyfile(w("gif", f), os.path.join(img, f))
        print("  %-22s %4d KB" % (f, os.path.getsize(os.path.join(img, f)) // 1024))

    aud = os.path.join(docs, "audio")
    os.makedirs(aud, exist_ok=True)
    for f in sorted(os.listdir(w("audio"))):
        shutil.copyfile(w("audio", f), os.path.join(aud, f))
    print("  audio: %d MP3" % len(os.listdir(aud)))
    return 0


if __name__ == "__main__":
    if len(sys.argv) < 2:
        sys.exit(__doc__)
    sys.exit(main(sys.argv[1]))
