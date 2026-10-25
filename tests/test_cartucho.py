"""Lo medido del cartucho: la regla banco -> org, los repartos de banco y el
codigo que se ejecuta copiado en la RAM. Sin la ROM, los tests que la
necesitan se saltan."""
import os
import re
import subprocess
import sys
import unittest

AQUI = os.path.dirname(os.path.abspath(__file__))
RAIZ = os.path.dirname(AQUI)
sys.path.insert(0, os.path.join(RAIZ, "tools"))

import cartucho                                   # noqa: E402
import paginas                                    # noqa: E402

RUTA_ROM = os.path.join(RAIZ, "metalgear2.rom")
ROM = open(RUTA_ROM, "rb").read() if os.path.exists(RUTA_ROM) else None
REG = {0x5000: 0, 0x7000: 1, 0x9000: 2, 0xB000: 3}


def con_rom(f):
    return unittest.skipIf(ROM is None, "falta metalgear2.rom")(f)


class Paginas(unittest.TestCase):
    def test_los_64_bancos_tienen_org(self):
        self.assertEqual(sorted(paginas.ORG), list(range(64)))
        self.assertTrue(set(paginas.ORG.values()) <= {0x4000, 0x6000, 0x8000, 0xA000})

    def test_el_makefile_lleva_la_misma_tabla(self):
        mk = open(os.path.join(RAIZ, "Makefile"), encoding="utf-8").read()
        en_mk = {int(n): int(o, 16) for n, o in re.findall(r"^ORG_(\d\d) = (0x[0-9a-f]+)$", mk, re.M)}
        self.assertEqual(en_mk, paginas.ORG)

    @con_rom
    def test_el_reconocimiento_no_ve_ninguna_escritura_que_contradiga_la_regla(self):
        r = subprocess.run([sys.executable, os.path.join(RAIZ, "tools", "reconocimiento.py"), RUTA_ROM],
                           capture_output=True, text=True)
        self.assertEqual(r.returncode, 0, r.stdout[-2000:])
        self.assertIn("OK: la regla banco -> org", r.stdout)


class Repartos(unittest.TestCase):
    """Cada entrada de cartucho.REPARTOS, ejecutada otra vez con z80run."""

    @con_rom
    def test_cada_reparto_pone_los_bancos_que_dice(self):
        from z80run import Z80

        class Z(Z80):
            def _escribir(self, a, v):
                a &= 0xFFFF
                if a in REG:
                    self.escr.append((REG[a], v & 0xFF))
                    return
                self.mem[a] = v & 0xFF

        for dir_, esperado in cartucho.REPARTOS.items():
            z = Z()
            z.escr = []
            z.carga(ROM[0:0x2000], 0x4000)
            z.sp = 0xF000
            z.corre(dir_, tope=2000)
            ranuras = [None] * 4
            for r, v in z.escr:
                ranuras[r] = v
            self.assertEqual(tuple(ranuras[1:]), esperado, "p00:%04X" % dir_)


class CopiasEnRam(unittest.TestCase):
    """Los cuatro `ldir` del arranque copian lo que dice cartucho.COPIAS_RAM."""

    @con_rom
    def test_los_ldir_del_arranque(self):
        b0 = ROM[0:0x2000]
        vistos = set()
        # ld hl,origen / ld de,destino / ld bc,largo / ldir
        for m in re.finditer(rb"\x21(..)\x11(..)\x01(..)\xed\xb0", b0, re.S):
            o, d, n = (int.from_bytes(m.group(k), "little") for k in (1, 2, 3))
            vistos.add((d, n, o))
        for ram, largo, banco, rom in cartucho.COPIAS_RAM:
            self.assertEqual(banco, 3)
            self.assertIn((ram, largo, rom), vistos, "0x%04X" % ram)

    def test_las_copias_no_se_pisan_en_la_ram(self):
        ocupado = set()
        for ram, largo, _, _ in cartucho.COPIAS_RAM:
            r = set(range(ram, ram + largo))
            self.assertFalse(r & ocupado, "0x%04X" % ram)
            ocupado |= r
            self.assertTrue(0xC000 <= ram and ram + largo <= 0xE000)


class Reensamblado(unittest.TestCase):
    @con_rom
    def test_la_rom_reensamblada_es_la_original(self):
        out = os.path.join(RAIZ, "work", "reensamblada.rom")
        if not os.path.exists(out):
            self.skipTest("falta make verify")
        self.assertEqual(open(out, "rb").read(), ROM)


if __name__ == "__main__":
    unittest.main()
