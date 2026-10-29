#!/usr/bin/env python3
"""Las imagenes y las musicas de la web, montadas con lo que pinta el cartucho
ejecutado. Aqui no se dibuja nada: se juntan, se recortan y se amplian los PNG
que dejan en work/ las herramientas que corren el juego:

  mapas.py rotular        work/mapas/web_zona_ZZ.png   -> zona_ZZ.png
  snake.py gif            work/snake_gif/snake_*.gif   -> snake_*.gif (una por accion)
  enemigos.py salas       work/enemigos/sala_*.gif     -> enemigos/ (la sala de cada enemigo distinto)
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


def iguales(a, b, tol=3):
    """Si dos dibujos (RGBA o sobre negro) son el mismo a la vista: alineados
    abajo y al centro, con hasta un punto de desplazamiento, difieren en tol
    puntos o menos."""
    from PIL import Image
    a, b = solido(a), solido(b)
    if abs(a.size[0] - b.size[0]) > 3 or abs(a.size[1] - b.size[1]) > 3:
        return False
    w, h = max(a.size[0], b.size[0]) + 2, max(a.size[1], b.size[1]) + 2
    pa = a.load()
    mejor = None
    for dx in (-1, 0, 1):
        for dy in (-1, 0, 1):
            ca = Image.new("RGB", (w, h))
            cb = Image.new("RGB", (w, h))
            ca.paste(a, ((w - a.size[0]) // 2, h - a.size[1] - 1))
            cb.paste(b, ((w - b.size[0]) // 2 + dx, h - b.size[1] - 1 + dy))
            n = sum(1 for x, y in zip(ca.getdata(), cb.getdata()) if x != y)
            mejor = n if mejor is None else min(mejor, n)
    return mejor <= tol


def solido(im):
    """El dibujo sobre negro, recortado a lo que tiene."""
    from PIL import Image
    if im.mode == "RGBA":
        fondo = Image.new("RGB", im.size)
        fondo.paste(im, (0, 0), im)
        im = fondo
    im = im.convert("RGB")
    caja = im.getbbox()
    return im.crop(caja) if caja else im


def distintos(ims, tol=3):
    """Los dibujos sin los que ya han salido (a la vista, iguales())."""
    r, exactos = [], set()
    for im in ims:
        im = solido(im)
        k = im.tobytes() + bytes(im.size)
        if k in exactos:                      # los iguales del todo, sin mirar mas
            continue
        exactos.add(k)
        if not any(iguales(im, o, tol) for o in r):
            r.append(im)
    return r


def hoja_de(filas, por_fila=16, celda=(36, 40), k=2, fondo=NEGRO):
    """Una fila de rejilla() por grupo, una debajo de otra."""
    from PIL import Image
    filas = [rejilla(f, por_fila, celda, k, fondo) for f in filas if f]
    h = Image.new("RGB", (max(f.size[0] for f in filas), sum(f.size[1] for f in filas) + 8 * (len(filas) - 1)),
                  (40, 40, 40))
    y = 0
    for f in filas:
        h.paste(f, (0, y))
        y += f.size[1] + 8
    return h


def piezas(im, hueco=2):
    """Las piezas sueltas de una imagen sobre negro (lo que tiene puntos a
    menos de `hueco` de distancia es la misma pieza): cada objeto aparte, el
    jefe por un lado y sus balas por otro."""
    im = solido(im)
    w, h = im.size
    px = im.load()
    lleno = {(x, y) for y in range(h) for x in range(w) if px[x, y] != (0, 0, 0)}
    r = []
    while lleno:
        pila = [lleno.pop()]
        pieza = set(pila)
        while pila:
            x, y = pila.pop()
            for dx in range(-hueco, hueco + 1):
                for dy in range(-hueco, hueco + 1):
                    q = (x + dx, y + dy)
                    if q in lleno:
                        lleno.discard(q)
                        pieza.add(q)
                        pila.append(q)
        xs = [x for x, _ in pieza]
        ys = [y for _, y in pieza]
        caja = (min(xs), min(ys), max(xs) + 1, max(ys) + 1)
        if (caja[2] - caja[0]) * (caja[3] - caja[1]) >= 16:   # fuera los puntos sueltos
            r.append(im.crop(caja))
    return r


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

    # LAS HOJAS, sin repetir (iguales(): a la vista, hasta 3 puntos distintos)
    # Snake: los dibujos del barrido (snake.py barre) por su numero, sin el 7
    # (sus patrones son de Snake tumbado y se pintan partidos: no sale jugando)
    import json
    snake = json.load(open(w("snake", "snake.json"), encoding="utf-8"))
    vistos, filas = [], []
    for dib in sorted({x["dibujo"] for x in snake}):
        if dib == 7:
            continue
        fila = []
        for x in snake:
            if x["dibujo"] == dib:
                im = Image.open(w("snake", x["fichero"]))
                if not any(iguales(im, o) for o in vistos):
                    vistos.append(im)
                    fila.append(solido(im))
        filas.append(fila)
    guarda(hoja_de(filas), docs, "snake_hoja.png")
    # los enemigos: los dibujos distintos del de cada GIF de sala (enemigos.py salas
    # deja sala_NN_<sala>_dNN.png), una fila cada uno
    ene = json.load(open(w("enemigos", "enemigos_salas.json")))
    filas = []
    for e in ene:
        pref = e["gif"][:-4] + "_d"
        ims = [solido(Image.open(w("enemigos", f)).convert("RGB"))
               for f in sorted(os.listdir(w("enemigos"))) if f.startswith(pref) and f.endswith(".png")]
        ims = [i for i in ims if i.getbbox()]
        if ims and (e["clase"] == "soldado" or e["clase"] == "t14"):
            # los que salen de la sala o cruzan una puerta se ven partidos: en la
            # hoja, solo los enteros (en el GIF se quedan, asi se ven jugando)
            alto = max(i.getbbox()[3] - i.getbbox()[1] for i in ims)
            ims = [i for i in ims if i.getbbox()[3] - i.getbbox()[1] >= 0.8 * alto]
        filas.append(distintos(ims))
    guarda(hoja_de(filas, celda=(52, 52)), docs, "enemigos_hoja.png")
    # los jefes de sprites (no el HIND D ni METAL GEAR, que son caracteres): las
    # piezas distintas de sus sprites (jefes.py: los 8-31 de cada cuadro)
    os.makedirs(os.path.join(img, "jefes"), exist_ok=True)
    for t in (3, 4, 6, 0x0B, 7, 5, 8, 9, 0x0A):
        d = w("jefes", "t%02X" % t)
        todas = []
        for f in sorted(x for x in os.listdir(d) if x.startswith("s")):
            im = Image.open(os.path.join(d, f)).convert("RGB")
            # el fondo de jefes.py es magenta (ROSA): a negro
            im.putdata([(0, 0, 0) if p == (255, 0, 255) else p for p in im.getdata()])
            todas += piezas(im)
        # fuera las piezas de un solo color: el destello del golpe, el parpadeo al
        # morir (BIG BOSS en rojo, azul y naranja) y el contorno al arder. Son cuadros
        # de verdad (en el GIF estan) pero en la hoja parecen dibujos rotos
        todas = [i for i in todas
                 if len({c for _, c in i.convert("RGB").getcolors(4096) or []} - {(0, 0, 0)}) > 1]
        mios = distintos(todas)
        mios.sort(key=lambda i: -i.size[0] * i.size[1])
        grande = max(i.size[1] for i in mios) + 4
        ancho = max(i.size[0] for i in mios) + 4
        guarda(hoja_de([mios], por_fila=max(4, min(16, 640 // ancho)), celda=(ancho, grande)),
               docs, "jefes/sprites_%02X.png" % t)

    # cada arma y cada cosa: el dibujo de lo elegido, del recuadro de la derecha
    # (F2 arriba, F3 abajo; medido: lo que cambia de una pantalla a otra)
    # las casillas sin letrero (el mismo puntero que la 0, como paginas_web.letreros_de)
    # son recuadros vacios: fuera
    from paginas_web import palabra50
    vacias = set()
    for pref, tabla, n in (("f2", 0x8046, 14), ("f3", 0x8048, 0x23)):
        t0 = palabra50(tabla)
        vacias |= {"%s_c%02X.png" % (pref, i) for i in range(n) if palabra50(t0 + 2 * i) == palabra50(t0)}
    os.makedirs(os.path.join(img, "equipo"), exist_ok=True)
    for f in vacias:
        if os.path.exists(os.path.join(img, "equipo", f)):
            os.remove(os.path.join(img, "equipo", f))
    for f in sorted(os.listdir(w("equipo"))):
        if not f.endswith(".png") or "_c" not in f:
            continue
        if f[:2] + "_c" + f.split("_c")[1] in vacias:
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
        # solo los de sala (enemigos.py salas); los recortes de antes, fuera
        d = os.path.join(img, "enemigos")
        os.makedirs(d, exist_ok=True)
        for f in os.listdir(d):
            os.remove(os.path.join(d, f))
        for f in sorted(os.listdir(w("enemigos"))):
            if f.startswith("sala_") and f.endswith(".gif"):
                shutil.copyfile(w("enemigos", f), os.path.join(d, f))

    # una pantalla de cada parte de las secuencias (las que nombra la pagina): de
    # los GIF por escena de secuencias.py (work/gif), la imagen que mas tiempo se
    # queda en pantalla sin ser negra (la de mas colores cogia dibujos a medias)
    os.makedirs(os.path.join(img, "secuencias"), exist_ok=True)
    for f in sorted(os.listdir(w("gif"))):
        if not f.endswith(".gif") or f == "blanco.gif":     # el fundido a blanco: blanco
            continue
        frs = [(x.convert("RGB"), x.info.get("duration", 0))
               for x in ImageSequence.Iterator(Image.open(w("gif", f)))]
        frs = [(x, d) for x, d in frs if x.getbbox()] or frs
        mejor = max(frs, key=lambda xd: xd[1])[0]
        guarda(amplia(mejor, 2), docs, "secuencias/%s.png" % f[:-4])

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
