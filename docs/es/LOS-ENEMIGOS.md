# Los enemigos

Los enemigos son **actores** de la zona, no de la sala: cada uno lleva su
fila y su columna y va de sala en sala. Hay 24 fichas de 0x40 bytes en
`0xCE00`; las cuatro últimas (`0xD300`) son las de los que llegan con la
alerta (`p14:B20E`). En los mapas hay **155** en las salas y **52** en las
especiales, en su sitio de salida ([Los mapas](LOS-MAPAS.html)).

Cada tipo tiene su rutina (`p04:815B`, del 1 al 0x18) y su tabla de dibujos
en `p56:A808`: un ancho y, detrás, una fila de parejas [desplazamiento]
[patrón] por dibujo, que `sprites_de_actores` (`p12:7DDC`) pone con los
sprites y los colores que le tocan (`p04:81C5`). Los soldados comparten la
tabla (`p56:A852`): lo que los distingue a la vista son los colores de cada
zona.

## Cómo están hechos

Cada enemigo lo **juega el cartucho ejecutado** (`tools/enemigos.py`): se
entra en su sala y se corren 120 cuadros del juego entero (`p01:728E`); lo
que se ve es la sala entera, como en la pantalla, sin Snake (para llegar a
la sala la herramienta lo deja donde cae, a veces fuera del suelo). Para que
patrullen y no corran tras Snake, la alerta (`0xCA5F`) se pone a cero en cada
cuadro. Los GIF van **al ritmo del MSX** (un cuadro del juego cada 5 del VDP,
medido en openMSX). Sale uno por aspecto distinto: todos los soldados (tipos
1-9, 0x0A y 0x0C) son una clase y los distinguen sus colores, y un soldado
con todos sus colores en los de otro (visto de espaldas) es el mismo. La sala
de cada GIF es aquella en la que más se mueve.

Cotejado con openMSX (`tools/omsx_salas.tcl` con un volcado cada 0,4 s, ocho
salas): las cámaras se deslizan por la pared y los soldados dormidos de la
sala 0x0D de la zona 4 se pintan en sus camas con el fondo, no con sprites.
La primera versión de esta página pintaba cada enemigo en un recuadro que lo
seguía: las cámaras salían quietas, y al soldado dormido se le daban sprites
a la fuerza y salía sin cabeza.

## Todos sus dibujos

Los dibujos distintos del enemigo de cada GIF de abajo, una fila por
enemigo, en el mismo orden y sin repetir:

![Los dibujos de los enemigos, sin repetir](../imagenes/enemigos_hoja.png)

## Uno a uno

<!-- generado:enemigos -->
### 1. Soldado de boina roja

![](../imagenes/enemigos/sala_00_02_02.gif)

La zona 02, sala 02, jugada; tipos 0x01, 0x06, 0x09, 0x0C; sale en 52 salas más.

### 2. Soldado de casco gris

![](../imagenes/enemigos/sala_01_03_03.gif)

La zona 03, sala 03, jugada; tipos 0x01, 0x04, 0x05; sale en 11 salas más.

### 3. Soldados en la sala roja

![](../imagenes/enemigos/sala_02_E2E_00.gif)

La especial 2E, sala 00, jugada; tipo 0x01; sale en una sala más.

Los soldados de siempre, en una sala con la paleta en rojos.

### 4. Soldado de boina verde

![](../imagenes/enemigos/sala_03_01_13.gif)

La zona 01, sala 13, jugada; tipo 0x02; no sale en otra sala.

BLACK COLOR le dice a Snake que siga a un hombre con boina verde que está en el 1F: «男のトクチョウはグリーンベレーをかぶっている。1Fにいるはずだ» (`p50:887B`). Solo sale en esta sala.

### 5. Niño

![](../imagenes/enemigos/sala_04_06_1D.gif)

La zona 06, sala 1D, jugada; tipo 0x10; sale en 18 salas más.

Los mensajes de los niños los firma «こども» (`p50:82E3`). Pegarles quita a Snake 4 de vida: el golpe (`p03:A360`) pasa por `delante_con_actores` (`p07:AED1`).

### 6. Niña con coletas

![](../imagenes/enemigos/sala_05_06_23.gif)

La zona 06, sala 23, jugada; tipo 0x11; sale en 9 salas más.

Una niña: aquí dice «ながれにさからってはいけないって、かた目のおじちゃんが。» (`p50:82E3`). Como a los otros niños, pegarle quita vida a Snake.

### 7. Hámster de Zanzíbar

![](../imagenes/enemigos/sala_06_E39_01.gif)

La especial 39, sala 01, jugada; tipo 0x12; no sale en otra sala.

Norden: «ザンジバーハムスター», que tendría veneno (`p49:A38E`).

### 8. Cúpula azul

![](../imagenes/enemigos/sala_07_06_01.gif)

La zona 06, sala 01, jugada; tipo 0x13; sale en 7 salas más.

### 9. Máquina que recorre su ruta

![](../imagenes/enemigos/sala_08_08_04.gif)

La zona 08, sala 04, jugada; tipo 0x14; sale en 3 salas más.

### 10. Cámara

![](../imagenes/enemigos/sala_09_01_0A.gif)

La zona 01, sala 0A, jugada; tipo 0x15; sale en 11 salas más.

### 11. Paloma

![](../imagenes/enemigos/sala_10_0F_03.gif)

La zona 0F, sala 03, jugada; tipo 0x16; no sale en otra sala.

Norden: una paloma torcaz enseñada como mensajera, «デンショばとにクンレンされたモリバト», que traería Marv (`p49:A024`).
<!-- /generado -->

## Los que no salen en ninguna sala

Los tipos 0x03, 0x08, 0x0B, 0x18 y 0x19 tienen su tabla de dibujos pero no
están en la lista de ninguna sala. El 0x0B lo crea un suceso (`p12:6B0B`: en
`0xD340`, con Y = 0x20 y X = 0xA0); el 8 lo quita `tipo_8_fuera` (`p12:6930`)
salvo con dos banderas de la partida. Los cuatro de la alerta (`0xD300`) llegan
cuando un enemigo ve a Snake; cuántos, lo cuenta `cuantos_pueden_llegar`
(`p14:B233`) por el nivel de Snake y los actores de la sala. Esos no están
jugados aquí.
