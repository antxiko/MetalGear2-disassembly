# Las secuencias

La presentación, el título y el final, **pintados por el cartucho
ejecutado** cuadro a cuadro (`tools/secuencias.py`, con el cuadro entero de
la interrupción, `p01:728E`) y cotejados con la VRAM de openMSX: de 100
volcados de la presentación, **96** iguales punto por punto; del final,
**163 de 169**. Los que no, son dibujos a medio hacer en el instante del
volcado (una franja del plano pintándose, un pájaro en otro punto de su
vuelo, un fundido a medio paso).

Los GIF van **al ritmo del MSX**, no al del cartucho ejecutado: el juego
espera al VDP en cada copia y en el MSX pierde cuadros. El ritmo está medido
en openMSX, apuntando en cada cuadro real el contador de cuadros procesados
del juego (`0xCA03`, `tools/omsx_ritmo.tcl`); cada imagen dura lo que dura
en el MSX.

## La presentación

![La presentación entera, al ritmo del MSX](../imagenes/presentacion.gif)

El estado 0 (`p01:72B2`) pinta el logotipo de Konami (`p13:92D1`) y elige una
de **dos vueltas** según `0xCA2A`, que se alterna: la de los créditos y la de
la historia.

**Los créditos** (estado 1, `p13:8000`, pasos 1-0x41 de `0xCA2C`): cada uno
con su plano dibujado línea a línea, sus sprites y sus letras escritas una a
una. 178,9 s en el MSX (147 s en el cartucho ejecutado).

**El título** (`p14:A196` y el estado 2, `p14:A299`): METAL GEAR 2 SOLID
SNAKE, que acaba **en blanco**: el estado 2 lleva la paleta un paso cada dos
cuadros hacia la de `p13:9278`, que son 16 colores (7, 7, 7).

**La historia** (la otra vuelta, pasos 0x80 y siguientes, `p14:A2CF`): el
texto en japonés sobre los dibujos.

## El final

![El final entero, al ritmo del MSX](../imagenes/final.gif)

El estado 7 (`p13:9555`, 31 pasos de `0xD701`), al que la partida pasa con
`0xCAAF` (`p01:7473`).

**Zanzibar** (pasos 2-8), subiendo con el desplazamiento vertical (R#23).

**Los créditos sobre el sol** (pasos 9-17). El paso 15 cambia de página cada
cuadro y en cada una borra un rectángulo de 0x90 x 0x60, copia encima el
dibujo de la página 2 y las letras (`p13:9871`): en el MSX dura **249,8 s**;
en el cartucho ejecutado, sin esperar al VDP, 40,5.

**La charla** (pasos 18-21): los 19 mensajes de `p50:8042`
(`p50:9D2C-9F7D`), con la pantalla del MSX de la que habla
[Curiosidades](CURIOSIDADES.html).

**El reparto** (pasos 22-27), con los retratos: 115 s en el MSX.

**El fundido a blanco** (pasos 28-30).

