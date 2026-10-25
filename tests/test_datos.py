"""Los formatos de datos que declara tools/lectores.py, comprobados contra la
ROM: que cada recorrido acaba donde el siguiente empieza y que las cuentas
salen de las tablas del cartucho. Sin la ROM, se saltan."""
import json
import os
import sys
import unittest

AQUI = os.path.dirname(os.path.abspath(__file__))
RAIZ = os.path.dirname(AQUI)
sys.path.insert(0, os.path.join(RAIZ, "tools"))

RUTA_ROM = os.path.join(RAIZ, "metalgear2.rom")
HAY_ROM = os.path.exists(RUTA_ROM)

if HAY_ROM:
    import bloques as B                           # noqa: E402
    sys.modules.setdefault("bloques", B)
    import lectores as L                          # noqa: E402
    from paginas import ORG                       # noqa: E402


def con_rom(clase):
    return unittest.skipIf(not HAY_ROM, "falta metalgear2.rom")(clase)


@con_rom
class Mapas(unittest.TestCase):
    def test_las_salas_de_cada_zona_van_seguidas(self):
        """Las salas de una zona acaban donde empiezan las de la siguiente que
        este en el mismo banco (p24:6000), con 37 bytes por sala."""
        n = L.salas_por_zona()
        self.assertEqual(len(n), 20)
        self.assertEqual(n[19], 6)
        self.assertEqual(sum(n), 274)
        tramos = {}
        for z in range(20):
            w = B.Ventana(L.MAPAS[L.rom(0, L.ZONA_MAPA + z)])
            a = w.w(0x6000 + 2 * z)
            tramos.setdefault(w.banco(a), []).append((a, a + 37 * n[z]))
        # zona 0 -> 2 -> 7 en el banco 24, 1 -> 4 -> 18 en el 27, 3 -> 5 -> 6 -> 12... en el 29
        for b, ts in tramos.items():
            ts.sort()
            for (a0, f0), (a1, f1) in zip(ts, ts[1:]):
                self.assertLessEqual(f0, a1, "banco %d: %04X-%04X pisa %04X" % (b, a0, f0, a1))
        self.assertIn((0x74C1, 0x76A2), tramos[24])
        self.assertIn((0x76A2, 0x77EF), tramos[24])

    def test_las_salas_de_0xca76_son_36_bloques_por_sala(self):
        v = B.Ventana(L.MAPAS[0])
        for k in range(1, L.N_ESPECIALES):
            a = v.w(0x64B6 + 2 * k)
            out, x = 0, a
            while True:
                c = v(x)
                x += 1
                if c == 0:
                    break
                if c & 0x80:
                    out += c & 0x7F
                    x += c & 0x7F
                else:
                    out += c
                    x += 1
            self.assertEqual(out % 36, 0, "0xCA76 = %d" % k)
            self.assertEqual(x, L.rachas_ram(v, a))


@con_rom
class Dibujos(unittest.TestCase):
    def test_las_20_zonas_tienen_cabecera_de_dibujos(self):
        v = B.ventana_de(32)
        t = [v.w(0x6000 + 2 * z) for z in range(20)]
        self.assertEqual(min(t), 0x6028)        # la tabla acaba donde empieza la primera

    def test_los_sprites_de_sala_acaban_en_una_orden_0(self):
        v = B.Ventana((35, 36, 37))
        for k in range(1, L.N_SPRITES):
            a = v.w(0x60DB + 2 * k)
            fin = L.rachas_y_fichas(v, a)
            self.assertEqual(v(fin - 1), 0)
        self.assertEqual(v.w(0x60DB + 2 * L.N_SPRITES - 2), 0x6A29)


@con_rom
class TablasHL(unittest.TestCase):
    def test_cada_tabla_en_hl_acaba_donde_empieza_codigo(self):
        """Lo que sigue a cada tabla de src/tablas_hl.txt es codigo trazado (o
        el final del banco)."""
        with open(os.path.join(RAIZ, "src", "tablas_hl.txt"), encoding="utf-8") as f:
            filas = f.read().splitlines()
        for ln in filas:
            if ln.startswith("#") or not ln.strip():
                continue
            p = ln.split()
            b, t, n = int(p[0][1:]), int(p[1], 16), int(p[2])
            if (b, t) == (1, 0x65AA):
                continue                         # se mete en el codigo a proposito
            fin = t + 2 * n
            with open(os.path.join(RAIZ, "work", "p%02d.trace.json" % b)) as f:
                traza = json.load(f)
            cod = any(k == "c" and a <= fin < z for k, a, z in traza["blocks"])
            self.assertTrue(cod, "p%02d:%04X + %d palabras" % (b, t, n))


if __name__ == "__main__":
    unittest.main()
