#!/usr/bin/env python3
"""GIF de lo que pinta el cartucho ejecutado JUGANDO, al ritmo del MSX.

El ritmo esta medido en openMSX (tools/lanza_ritmo.ps1 -modo partida ->
work/ritmo_partida.txt): jugando, el contador de cuadros procesados 0xCA03
sube 709 veces en 3.600 cuadros del VDP, uno cada 5 (a veces 6). Asi que cada
cuadro del cartucho ejecutado dura 3600 / 709 = 5,08 cuadros de 1/60 s (unos
85 ms): el juego se mueve a unos 12 cuadros por segundo.

Uso (modulo): g = Gif(); g.pon(imagen) tras cada cuadro; g.guarda(ruta)
"""
import os

REALES, PROCESADOS = 3600, 709                 # work/ritmo_partida.txt
MS_POR_CUADRO = 1000.0 * REALES / PROCESADOS / 60


class Gif:
    def __init__(self, ms=MS_POR_CUADRO):
        self.ms = ms
        self.imgs, self.durs, self.ultima = [], [], None

    def pon(self, im, cuadros=1):
        """La imagen que se ve tras un cuadro (o tras `cuadros` cuadros)."""
        b = im.tobytes()
        if b == self.ultima:
            self.durs[-1] += self.ms * cuadros
            return
        self.ultima = b
        self.imgs.append(im.copy())
        self.durs.append(self.ms * cuadros)

    def __len__(self):
        return len(self.imgs)

    def guarda(self, ruta, tope_ms=None):
        """tope_ms: una imagen quieta mas larga se deja en eso (las esperas de
        un mensaje sin cerrar); se dice en la pagina."""
        if not self.imgs:
            return
        if tope_ms:
            self.durs = [min(d, tope_ms) for d in self.durs]
        # el GIF cuenta en centesimas: se redondea el tiempo acumulado
        acum, ms = 0.0, []
        for d in self.durs:
            ms.append(max(10, round((acum + d) / 10) * 10 - round(acum / 10) * 10))
            acum += d
        self.imgs[0].save(ruta, save_all=True, append_images=self.imgs[1:], duration=ms,
                          loop=0, optimize=True)
        print("%s: %d imagenes, %.1f s, %d KB" % (ruta, len(self.imgs), sum(ms) / 1000,
                                                 os.path.getsize(ruta) // 1024))
