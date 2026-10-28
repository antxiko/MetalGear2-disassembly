# Curiosidades de la musica (fase 5)

## La radio del 140.07

Con el tabaco equipado (0xCB21 = 1), sin alerta, fuera del ascensor y de las
especiales 2 y 0x2A, marcar 140.07 en el transceptor (numero_7_o_66, p09:BF42)
pide el sonido 2 y una musica de las 16 de p09:BFC1 segun el contador de
cuadros (sonido_al_azar, p09:BFB5): A9 AA 99 9A 9C 9D 9E 9F A2 A3 A4 A0 73 7A
7B 81. Ejecutado en el cartucho: con el tabaco, cada valor del contador da su
musica; sin el, ninguna. Con el tabaco, ademas, el retrato de Snake lleva otra
pieza de 2 x 2 encima: el cigarro en la boca (p01:70C9, p44:95D1; pintado por el cartucho: work/textos/retrato_00_tabaco.png).

## Dos musicas que no pide nadie

0x6B y 0x6E tienen su rutina (sonido_6b p01:6B22, sonido_6e p01:6B2E) y su
partitura, pero ni una llamada, ni una tabla, ni un `ld a,` las piden: la
direccion de su rutina no sale en ningun banco (la de 0x6E, solo como byte de
una sala en p24). Medido por barrido de la ROM, no jugando.
