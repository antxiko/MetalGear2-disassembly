#!/usr/bin/env python3
"""Las imagenes y las musicas de la web, montadas con lo que pinta el cartucho
ejecutado. Aqui no se dibuja nada: se juntan, se recortan y se amplian los PNG
que dejan en work/ las herramientas que corren el juego:

  mapas.py rotular        work/mapas/web_zona_ZZ.png   -> zona_ZZ.png
  snake.py gif            work/snake_gif/snake_*.gif   -> snake_*.gif (una por accion)
  enemigos.py             work/enemigos/*.gif          -> enemigos/ (uno por enemigo distinto)
  jefes.py                work/jefes/pelea_TT.gif      -> jefes/ (cada pelea entera)
  equipo.py f2 / f3       work/equipo/f2_*, f3_*       -> armas.png, equipo.png, equipo/ (cada cosa)
  radar.py                work/radar/radar.gif         -> radar.gif
  retratos.py             work/textos/retrato_NN.png   -> retratos.png, tabaco.png
  textos.py fuente        work/textos/fuente_f0/f8.png -> fuente_f0.png, fuente_f8.png
  secuencias.py gif       work/gif/*.gif               -> presentacion.gif, final.gif; logotipo.png
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

    # cada arma y cada cosa: el dibujo de lo elegido, del recuadro de la derecha
    # (F2 arriba, F3 abajo; medido: lo que cambia de una pantalla a otra)
    os.makedirs(os.path.join(img, "equipo"), exist_ok=True)
    for f in sorted(os.listdir(w("equipo"))):
        if not f.endswith(".png") or "_c" not in f:
            continue
        caja = (208, 114, 248, 132) if f.startswith("f2") else (214, 162, 248, 180)
        cosa = f[:2] + "_c" + f.split("_c")[1]         # f2_c01.png ...
        im = amplia(Image.open(w("equipo", f)).convert("RGB").crop(caja), 2)
        im.save(os.path.join(img, "equipo", cosa), optimize=True)
    guarda(amplia(Image.open(w("equipo", "f2_00_c01.png")).convert("RGB"), 2), docs, "armas.png")
    guarda(amplia(Image.open(w("equipo", "f3_00_c01.png")).convert("RGB"), 2), docs, "equipo.png")

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

    # la presentacion y el final, cada uno en UN GIF: las escenas de
    # secuencias.py seguidas, cada imagen con su duracion (al ritmo del MSX)
    for nombre, escenas in (("presentacion.gif", ("konami", "creditos_1", "creditos_2", "titulo",
                                                  "historia_1", "historia_2")),
                            ("final.gif", ("zanzibar", "sol", "charla", "reparto", "blanco"))):
        imgs, durs = [], []
        for e in escenas:
            for f in ImageSequence.Iterator(Image.open(w("gif", e + ".gif"))):
                imgs.append(f.convert("RGB").copy())
                durs.append(f.info.get("duration", 100))
        ruta = os.path.join(img, nombre)
        imgs[0].save(ruta, save_all=True, append_images=imgs[1:], duration=durs, loop=0, optimize=True)
        print("  %-22s %4d imagenes, %.1f s, %d KB" % (nombre, len(imgs), sum(durs) / 1000,
                                                     os.path.getsize(ruta) // 1024))
    for f in ("radar.gif",):
        shutil.copyfile(w("radar", f), os.path.join(img, f))
    for f in sorted(os.listdir(w("snake_gif"))):
        shutil.copyfile(w("snake_gif", f), os.path.join(img, f))
    os.makedirs(os.path.join(img, "jefes"), exist_ok=True)
    for f in sorted(os.listdir(w("jefes"))):
        if f.startswith("pelea_") and f.endswith(".gif"):
            shutil.copyfile(w("jefes", f), os.path.join(img, "jefes", f))
    if os.path.isdir(w("enemigos")):
        os.makedirs(os.path.join(img, "enemigos"), exist_ok=True)
        for f in sorted(os.listdir(w("enemigos"))):
            if f.endswith(".gif"):
                shutil.copyfile(w("enemigos", f), os.path.join(img, "enemigos", f))

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
