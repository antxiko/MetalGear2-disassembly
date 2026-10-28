# Las secuencias: presentacion, titulo y final (fase 6)

Todo pintado por el cartucho ejecutado cuadro a cuadro (`tools/secuencias.py`:
el cuadro entero p01:728E, el de la interrupcion) y cotejado con openMSX
(`tools/coteja_secuencias.py`: cada volcado con el cuadro de pagina igual byte a
byte; a igualdad, la paleta y los sprites mas cercanos).

## Lo que corre

- Estado 0 (p01:72B2): el logotipo de Konami (pantalla_de_56, p13:92D1) y, segun
  0xCA2A, una de las dos vueltas: sin el, la pantalla de los bancos 52-53 y la
  presentacion desde el paso 1; con el, la de los bancos 60-63 y desde el 0x80.
- Estado 1 paso 0: la presentacion de p13:8000 (pasos 1-0x41 de 0xCA2C): los
  creditos, cada uno con su plano dibujado linea a linea, sus sprites y sus letras
  escritas una a una. En la segunda vuelta (pasos 0x80 y siguientes, p14:A2CF), la
  historia en japones sobre dibujos (la pistola, los cigarrillos sobre el mapa...).
- Estado 1 paso 1 (p14:A196) y estado 2 (p14:A299): el titulo METAL GEAR 2 SOLID
  SNAKE, que se aclara hasta la paleta de p13:9278, toda blanca (0x77 0x07 x 16).
- Estado 7 (p13:9555, 31 pasos de 0xD701): el final. Se llega desde el paso 0 de
  la partida con 0xCAAF (p01:7473). Zanzibar subiendo con R#23 (pasos 2-8), los
  creditos sobre el sol (9-17), la charla (18-21: los 19 mensajes de p50:8042, en
  p50:9D2C-9F7D), el reparto con retratos (22-27) y el fundido a blanco (28-30).

## Cotejo con openMSX

- Presentacion: `tools/lanza_vram.ps1 -dir omsx_pres -tiempos "6 12 ... 600" -rapido 1`
  y `python tools/coteja_secuencias.py pres work/omsx_pres 37000 --png`: 96 de 100
  volcados iguales punto por punto. Los 4 restantes, dibujos a medio hacer: una
  franja del plano pintandose (396), la mira en otro punto de su vuelta (486), el
  logotipo del titulo apareciendo (564) y 16 puntos (420).
- Final: `tools/lanza_final.ps1` (tools/omsx_final.tcl: empieza la partida, pasa
  la llamada con RETURN hasta 0xCA97 = 0 y, jugando, pone 0xCAAF = 1; vuelca cada
  3 s hasta salir del estado 7) y `python tools/coteja_secuencias.py final
  work/omsx_final 16000 --png`: 163 de 169 iguales. Los 6 restantes: el primero (la
  sala de la partida antes del fundido: en el cartucho ejecutado la partida es la
  nueva), los pajaros (sprites) en otro punto de su vuelo (004, 005, 011) y dos
  fundidos de los retratos a medio paso (144, 163).

## Curiosidades con prueba

### VRAM:OIK bytes

En la charla del final, Snake pide meter en un MSX el cartucho del doctor Marv
(mensaje 04, p50:9DB5: «そのままMSXにさしこんでみろ»). La pantalla que sale
(paso 20; work/final/f07060.png) es la de arranque de un MSX con «VRAM:OIK
bytes». Snake: «mira bien... esta la firma del doctor Marv... aqui, el nombre
entero de KIO MARV» (09, p50:9E6C); Holly: «ah, es verdad... esta al reves»
(0A, p50:9EA6). «VRAM:OIK» leido al reves es «KIO:MARV».

### Los creditos sobre el sol, diez veces mas lentos en el MSX

El paso 15 del final cambia de pagina en cada cuadro y, en cada una, borra un
rectangulo de 0x90 x 0x60, copia encima el dibujo de la pagina 2 y las letras con
la operacion 0x88 (p13:9871). En el cartucho ejecutado (sin esperas del VDP) dura
1360 cuadros, 22,7 s; en openMSX (work/omsx_final, 0xD701 de cada volcado) va del
segundo 48 al 279: unos 231 s. El juego espera al VDP en cada copia y pierde
cuadros. Tambien el reparto (pasos 22-27) va mas lento: 88 s ejecutado, 108 s en
openMSX.

### El titulo acaba en blanco

El estado 2 (p14:A2AD) lleva la paleta un paso cada 2 cuadros hacia la de
p13:9278, que son 16 colores (7, 7, 7): la pantalla del titulo se va a blanco
antes de volver al logotipo de Konami.

## Al ritmo del MSX

El cartucho ejecutado no espera al VDP: cada cuadro procesado (p01:728E) es 1/60
s. En el MSX no: `tools/lanza_ritmo.ps1 -modo pres|final` (tools/omsx_ritmo.tcl)
apunta en cada cuadro real de openMSX el contador 0xCA03, que sube una vez por
cuadro procesado, y deja work/ritmo_pres.txt (40000 cuadros) y ritmo_final.txt
(30324). Los pasos caen en el mismo cuadro procesado que en el cartucho ejecutado
(k + 2 en la presentacion, en las dos vueltas; k + 1 en el final), asi que cada
cuadro ejecutado recibe su momento real. Lo que se ve tras el cuadro k sale cuando
empieza el siguiente: tras el logotipo, montar la pantalla de los bancos 52-53
(p01:72ED) ya ha subido 0xCA03 y tarda 252 cuadros reales.

- Creditos de la presentacion: 147 s ejecutados, 178,9 s en el MSX.
- Creditos sobre el sol: 40,5 s ejecutados, 249,8 s en el MSX.
- Reparto: 93,5 s ejecutados, 115,0 s en el MSX.

## Para la web

`python tools/secuencias.py gif pres work/gif` y `gif final work/gif`: 11 GIF
al ritmo medido (un cuadro cada 4 reales, 15 por segundo; los iguales seguidos,
uno con su duracion; el GIF cuenta en centesimas y se redondea el tiempo
acumulado). Duraciones cotejadas con work/ritmo_*.txt: creditos 178,92 s contra
178,92 s; el sol 249,1 s contra 249,8 s (la carga de su pantalla queda en la
ultima imagen de zanzibar). Escenas: konami, creditos_1, creditos_2, titulo,
historia_1, historia_2, zanzibar, sol, charla, reparto, blanco (2,2 MB). Los
mensajes de la charla, en work/charla_final.txt.
