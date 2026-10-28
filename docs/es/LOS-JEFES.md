# Los jefes

Las peleas no son actores: son **fichas de 0x20 bytes en `0xD800`** (cuatro;
en las salas especiales, la de `0xD860`). Al entrar en una zona,
`fichas_d800_de_la_zona` (`p12:6BA5`) las rellena desde las filas de `p56`
[tipo] [Y] [X] [fila] [columna] [vida]. Hay **11 tipos**: el dibujo de cada
uno va por la tabla de `p04:8A75` y su lógica por la de `p04:8A8D`; cuando se
queda sin vida (`resta_a_d800`, `p07:B471`) pasa a los pasos 0x20 y
siguientes (`p04:8AD8`).

Cada pelea se ha **jugado con el cartucho ejecutado** (`tools/jefes.py`):
se entra en su zona y su sala, se pone a Snake donde la pelea empieza y se
corre el cuadro entero del juego, el de la interrupción (`p01:728E`), con los
mensajes pasados con el disparo y la vida de Snake llena; al final se le
quita al jefe toda la vida para ver cómo acaba. Las imágenes son la zona de
juego (0xC0 x 0xC0 puntos), en orden: la llegada, la pelea y el final.

El nombre de cada uno sale de sus mensajes ([Los textos](LOS-TEXTOS.html)).

## 0x01, HIND D (zona 0x07)

![HIND D](../imagenes/jefe_01.png)

El helicóptero de la pista. Está hecho de caracteres de la pantalla, no de
sprites, con su sombra; al morir acaba como los misiles (pasos 0x20 y
0x2A-0x2D). Lo nombra ケスラー: «HIND・D» (`p49:AF2E`).

## 0x02, METAL GEAR (zona 0x12)

![METAL GEAR](../imagenes/jefe_02.png)

El robot, de caracteres, en **pantalla partida**: arriba la pelea con su
desplazamiento vertical y abajo el marcador, cambiando el registro R#23 a
media pantalla. En esta zona el juego pone a Snake en la sala 3
(`p00:5ADF`), y a la pelea se entra en la sala 8 por la puerta 8, de tipo 5;
el robot se dibuja una sola vez (`p04:88B7`). La pantalla partida, montada como la monta
la interrupción de línea, está cotejada con openMSX: 224 puntos distintos de
54.272, un objeto lanzado y la barra de vida. Snake lo llama
«シンガタMETAL GEAR», el METAL GEAR nuevo (`p50:9182`).

## 0x03, BLACK COLOR (zona 0x03)

![BLACK COLOR](../imagenes/jefe_03.png)

El científico que se transforma. Sus mensajes lo firman
«BLACK COLOR» (`p50:8807`), y `p50:887B` dice quién es: Kyle Schneider.

## 0x04, RUNNING MAN (especial 0x29)

![RUNNING MAN](../imagenes/jefe_04.png)

«オレはRUNNING MAN» (`p50:8BDA`). En el cartucho ejecutado la pelea se
queda en el mensaje de su paso 0x10, «見てろっ！！».

## 0x05, NIGHT SIGHT (zona 0x13)

![NIGHT SIGHT](../imagenes/jefe_05.png)

Empieza con una llamada del transceptor. Lo nombra ケスラー (`p49:B233`).
Al morir saca a la ficha de tipo 8.

## 0x06, RED BLASTER (zona 0x0E)

![RED BLASTER](../imagenes/jefe_06.png)

«おれはRED BLASTER» (`p50:8D64`).

## 0x07, PREDATOR (zona 0x0A)

![PREDATOR](../imagenes/jefe_07.png)

«プレデター『本物のヘビかどうかためしてやる』» (`p50:8D95`).

## 0x08, Pettrovich (zona 0x13)

![Pettrovich](../imagenes/jefe_08.png)

ペトロビッチ・マッドナー, el doctor: sus mensajes son los 0x14-0x17 de
`p50:8E35-9182` y el nombre entero lo da ケスラー (`p49:B61E`). La ficha se
queda en su paso 0x11, que espera un suceso de la partida (el bit 5 de
`0xD7D9`, `p05:BFA0`).

## 0x09, GREY FOX (zona 0x12)

![GREY FOX](../imagenes/jefe_09.png)

Con su conversación (`p50:990C`). Así, «GREY FOX», en los textos. Sus pasos
5 a 0x10 esperan sucesos de las salas 2 y 3 (`0xD88C`).

## 0x0A, BIG BOSS (zona 0x12)

![BIG BOSS](../imagenes/jefe_0A.png)

Sus mensajes, `p50:92BB` y `p50:92FF`. El paso 0 espera `0xD6B0`: en el
cartucho ejecutado se ve desde que se le quita la vida.

## 0x0B, ULTRABOX (zona 0x0B)

![ULTRABOX](../imagenes/jefe_0B.png)

Cuatro a la vez, dentro del ascensor: al llegar a la planta 0x13 (`p07:A248`)
el paso 0x0F pone `0xD8A0` y salen las cuatro fichas (`p05:AA90`) con su
escena (`p05:AB08`). «BOX『おれたちにリョウリされることをホコリにおもえ』»
(`p50:8DE4`). Arden al morir.

## La música

Las peleas de los tipos 2, 3, 4, 6, 7 y 0x0A y la de los ULTRABOX suenan con
la **0x84**; la del HIND D, con la **0x91** ([La música](LA-MUSICA.html)).
