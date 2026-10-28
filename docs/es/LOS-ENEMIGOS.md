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

Cada enemigo de cada sala lo **juega el cartucho ejecutado**
(`tools/enemigos.py`): se entra en su sala, se corren 120 cuadros del juego
entero (`p01:728E`) y se pintan solo sus sprites, en un recuadro de 64 x 64
puntos que lo sigue. Para que patrullen y no corran tras Snake, la alerta
(`0xCA5F`) se pone a cero en cada cuadro. Los GIF van **al ritmo del MSX**
(un cuadro del juego cada 5 del VDP, medido en openMSX). Sale uno por cada
aspecto distinto (tipo, patrones y colores); los iguales se cuentan.

## Todos sus dibujos

Las imágenes distintas de cada GIF de abajo, una fila por enemigo, en el
mismo orden y sin repetir:

![Los dibujos de los enemigos, sin repetir](../imagenes/enemigos_hoja.png)

## Uno a uno

<!-- generado:enemigos -->
### 1. Soldado (tipo 0x01)

![](../imagenes/enemigos/00_t01_00_01.gif)

Jugado en la zona 00, sala 01; igual en 66 salas más.

### 2. Soldado (tipo 0x02)

![](../imagenes/enemigos/06_t02_01_13.gif)

Jugado en la zona 01, sala 13.

### 3. Soldado (tipo 0x04)

![](../imagenes/enemigos/08_t04_03_00.gif)

Jugado en la zona 03, sala 00; igual en 8 salas más.

### 4. Soldado (tipo 0x01)

![](../imagenes/enemigos/09_t01_03_03.gif)

Jugado en la zona 03, sala 03.

### 5. Soldado (tipo 0x01)

![](../imagenes/enemigos/10_t01_03_08.gif)

Jugado en la zona 03, sala 08; igual en 7 salas más.

### 6. Soldado (tipo 0x05)

![](../imagenes/enemigos/12_t05_03_10.gif)

Jugado en la zona 03, sala 10.

### 7. Figura pequeña con coletas (tipo 0x11)

![](../imagenes/enemigos/13_t11_04_05.gif)

Jugado en la zona 04, sala 05; igual en 10 salas más.

### 8. Soldado (tipo 0x09)

![](../imagenes/enemigos/14_t09_04_08.gif)

Jugado en la zona 04, sala 08.

### 9. Soldado (tipo 0x06)

![](../imagenes/enemigos/16_t06_04_16.gif)

Jugado en la zona 04, sala 16.

### 10. Cúpula azul (tipo 0x13)

![](../imagenes/enemigos/17_t13_06_01.gif)

Jugado en la zona 06, sala 01; igual en 31 salas más.

### 11. Figura pequeña de gorra roja (tipo 0x10)

![](../imagenes/enemigos/18_t10_06_02.gif)

Jugado en la zona 06, sala 02; igual en 20 salas más.

### 12. Máquina de 48 x 48 puntos (tipo 0x14)

![](../imagenes/enemigos/21_t14_08_03.gif)

Jugado en la zona 08, sala 03; igual en 3 salas más.

### 13. Soldado (tipo 0x01)

![](../imagenes/enemigos/22_t01_0A_14.gif)

Jugado en la zona 0A, sala 14; igual en 2 salas más.

### 14. Pájaro (tipo 0x16)

![](../imagenes/enemigos/25_t16_0F_03.gif)

Jugado en la zona 0F, sala 03.

### 15. Animal pequeño (tipo 0x12)

![](../imagenes/enemigos/28_t12_E39_01.gif)

Jugado en la especial 39, sala 01; igual en 10 salas más.

### 16. Cámara (tipo 0x15)

![](../imagenes/enemigos/30_t15_01_0A.gif)

Jugado en la zona 01, sala 0A; igual en 9 salas más.

### 17. Soldado (tipo 0x0C)

![](../imagenes/enemigos/31_t0C_01_0D.gif)

Jugado en la zona 01, sala 0D; igual en 4 salas más.

### 18. Soldado (tipo 0x01)

![](../imagenes/enemigos/32_t01_03_11.gif)

Jugado en la zona 03, sala 11; igual en 2 salas más.

### 19. Soldado (tipo 0x0A)

![](../imagenes/enemigos/33_t0A_04_0D.gif)

Jugado en la zona 04, sala 0D; igual en 2 salas más.

### 20. Soldado (tipo 0x0A)

![](../imagenes/enemigos/34_t0A_04_0D.gif)

Jugado en la zona 04, sala 0D; igual en 5 salas más.

### 21. Cámara (tipo 0x15)

![](../imagenes/enemigos/35_t15_05_00.gif)

Jugado en la zona 05, sala 00; igual en 2 salas más.

### 22. Un punto de 4 x 4, con los pájaros (tipo 0x17)

![](../imagenes/enemigos/36_t17_0F_03.gif)

Jugado en la zona 0F, sala 03.
<!-- /generado -->

## Los que no salen en ninguna sala

Los tipos 0x03, 0x08, 0x0B, 0x18 y 0x19 tienen su tabla de dibujos pero no
están en la lista de ninguna sala. El 0x0B lo crea un suceso (`p12:6B0B`: en
`0xD340`, con Y = 0x20 y X = 0xA0); el 8 lo quita `tipo_8_fuera` (`p12:6930`)
salvo con dos banderas de la partida. Los cuatro de la alerta (`0xD300`) llegan
cuando un enemigo ve a Snake; cuántos, lo cuenta `cuantos_pueden_llegar`
(`p14:B233`) por el nivel de Snake y los actores de la sala. Esos no están
jugados aquí.
