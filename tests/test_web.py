"""La web: las cifras de la portada son las del listado, no se nombra otro
juego de la serie y no falta ninguna imagen ni ninguna musica."""
import os
import re
import subprocess
import sys
import unittest

RAIZ = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
DOCS = os.path.join(RAIZ, "docs")
sys.path.insert(0, os.path.join(RAIZ, "tools"))
import contenido_web as C     # noqa: E402

# Los otros juegos de la serie. "Metal Gear" no va: es el nombre de este.
OTROS_JUEGOS = ("Parodius", "Salamander", "Valley", "Usas", "Galious", "Nemesis",
                "Contra", "Goemon", "Shalom", "Knightmare", "Rastan",
                "Synthesizer", "Pennant", "Dunk Shot", "Vampire Killer", "Hinotori",
                "Q*bert", "King Kong", "Circus", "Magical Tree", "Comic Bakery",
                "TwinBee", "F1 Spirit", "Gradius", "Fighter", "Ranger", "Jaguar",
                "Game Master", "Majutsushi", "Mahjong")

# La seccion del codigo compartido con los otros Konami de la serie los
# nombra a proposito: la escribe pon_en_webs.py, de MSX-disassembly-database.
_COMPARTIDO = re.compile(
    r"(?:^## |<h2[^>]*>)(?:Code shared with other Konami cartridges|"
    r"C\u00f3digo compartido con otros cartuchos de Konami)"
    r".*?(?=^## |<h2|</main>|<footer|\Z)", re.S | re.M)


def sin_compartido(texto):
    """El texto sin la seccion del codigo compartido."""
    return _COMPARTIDO.sub("", texto)


def paginas():
    out = []
    for carpeta in (DOCS, os.path.join(DOCS, "es")):
        if os.path.isdir(carpeta):
            out += [os.path.join(carpeta, f) for f in sorted(os.listdir(carpeta))
                    if f.endswith(".md")]
    return out


class TestWeb(unittest.TestCase):
    def test_la_suma_de_bytes_da_el_cartucho(self):
        self.assertEqual(C.CODIGO + C.DATOS, 524288)

    def test_las_cifras_de_la_portada_son_las_del_listado(self):
        r = subprocess.run([sys.executable, os.path.join(RAIZ, "tools", "densidad_total.py")],
                           capture_output=True, text=True, cwd=RAIZ)
        m = re.search(r"TOTAL (\d+) instrucciones, (\d+) comentarios, .*flojas (\d+) de (\d+)",
                      r.stdout)
        self.assertIsNotNone(m, r.stdout[-300:])
        self.assertEqual((int(m.group(1)), int(m.group(2)), int(m.group(4))),
                         (C.INSTRUCCIONES, C.COMENTARIOS, C.RUTINAS))
        self.assertEqual(int(m.group(3)), 0)

    def test_no_se_nombra_otro_juego_de_la_serie(self):
        for p in paginas():
            txt = sin_compartido(open(p, encoding="utf-8").read())
            for j in OTROS_JUEGOS:
                self.assertNotIn(j, txt, "%s nombra %s" % (p, j))

    def test_no_falta_ninguna_imagen(self):
        for p in paginas():
            base = os.path.dirname(p)
            for ruta in re.findall(r"\]\(([^)]+\.(?:png|gif))\)", open(p, encoding="utf-8").read()):
                self.assertTrue(os.path.exists(os.path.join(base, ruta)), "%s: %s" % (p, ruta))

    def test_cada_imagen_sale_en_alguna_pagina_de_cada_idioma(self):
        usadas = {"en": set(), "es": set()}
        for p in paginas():
            idioma = "es" if os.path.basename(os.path.dirname(p)) == "es" else "en"
            usadas[idioma] |= {os.path.basename(r) for r in
                               re.findall(r"\]\(([^)]+\.(?:png|gif))\)",
                                          open(p, encoding="utf-8").read())}
        img = os.path.join(DOCS, "imagenes")
        # el logotipo va en las portadas (make_web.py), no en las paginas
        todas = {f for _, _, fs in os.walk(img) for f in fs} - {C.LOGOTIPO}
        self.assertEqual(todas - usadas["en"], set())
        self.assertEqual(todas - usadas["es"], set())

    def test_las_musicas_estan(self):
        for p in paginas():
            base = os.path.dirname(p)
            for ruta in re.findall(r'src="([^"?]+\.mp3)', open(p, encoding="utf-8").read()):
                self.assertTrue(os.path.exists(os.path.join(base, ruta)), "%s: %s" % (p, ruta))

    def test_nunca_consola(self):
        # el MSX es un ordenador; las pantallas del juego son el ordenador de a bordo
        for p in paginas():
            self.assertNotRegex(open(p, encoding="utf-8").read(), r"(?i)consol", p)


if __name__ == "__main__":
    unittest.main()
