#!/usr/bin/env python3
"""Contraste del lector de conversaciones (tools/textos.py conversacion/cumple)
con el cartucho: 3000 veces, una conversacion del transceptor (sitios 0-6),
sus banderas de 0xD7D0 puestas al azar y una sala (al azar o una de las que
piden las fichas); el cartucho la recorre (conversacion_a, p01:63C0) y se
compara 0xCA9C y el mensaje de 0xD7B7 con lo que dice el lector.

2026-10-28: 3000 de 3000 iguales.

Uso: prueba_conversaciones.py
"""
import os
import sys
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import random, copy  # noqa: E401
import textos as T
from mg2run import Mg2
base = Mg2(); base.llama(0x9E2B)
random.seed(1)
conv = {s: T.conversacion(s)[1] for s in range(8)}
todas_b = sorted({b for fs in conv.values() for f in fs for b in f['banderas']})
sitios = sorted({f['sitio'] for fs in conv.values() for f in fs if f['sitio']})
bien = mal = 0
for prueba in range(3000):
    s = random.randrange(7)
    fs = conv[s]
    # banderas: cada una de las usadas, puesta o no al 50 %
    puestas = {b for b in todas_b if random.random() < 0.5}
    if sitios and random.random() < 0.5:
        z, x = random.choice(sitios)
    else:
        z, x = random.randrange(0x14), random.randrange(0x18)
    zona, sala, esp = (z, x, 0) if z < 0x14 else (3, 0, x)
    m = copy.deepcopy(base)
    for i in range(32): m.mem[0xD7D0 + i] = 0
    for b in puestas: m.mem[0xD7D0 + b // 8] |= 0x80 >> (b % 8)
    m.pon(0xCA4A, zona); m.pon(0xCA4B, sala); m.pon(0xCA76, esp)
    m.pon(0xCA9C, 0); m.mem[0xD7B7] = m.mem[0xD7B8] = 0
    m.bancos_123(); m.llama(0x63C0, a=s)
    real = (m.mem[0xCA9C], m.mem[0xD7B7] | m.mem[0xD7B8] << 8)
    f = next((f for f in fs if T.cumple(f, puestas, zona, sala, esp)), None)
    if f is None:
        esperado = {(0, 0)}
    else:
        e, a, p = f['acciones'][0]
        if a == 0 and p:
            esperado = {(1, p)}
        elif a == 1:
            esperado = {(1, mm) if mm else (0, 0) for mm, u in T.al_azar(p)}
        else:
            esperado = {(0, 0)}
    if real in esperado: bien += 1
    else:
        mal += 1
        if mal < 6: print('MAL sitio', s, 'zona', zona, sala, esp, 'real', real, 'esperado', esperado)
print('bien', bien, 'mal', mal)
