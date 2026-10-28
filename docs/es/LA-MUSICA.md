# La música

**44 músicas**, sacadas **ejecutando el motor de sonido del propio
cartucho** (`tools/musica.py` sobre `tools/motor_musica.py`): su código corre
en un Z80, se apuntan sus escrituras al PSG y al SCC cuadro a cuadro y se
sintetizan. No hay grabaciones.

El motor vive en el **banco 16**, que el sonido pone en `0x4000` en lugar del
banco 0 (`p03:A0ED`), con sus datos en el 17 (`0x6000`) y el 18 (`0x8000`). `p16:4000` lo calla, `p16:4003` arranca un
sonido (el juego lo pide por la copia de `0xC340`) y `p16:4006` va en cada
interrupción. La cabecera de cada sonido sale de `p17:65A9`; las músicas son
las 0x6A-0xAA, con la partitura en el banco 19, 20, 21, 22, 23, 55 o 59
(`p16:4CE3`), que se pone en `0xA000` mientras suena.

Aquí van las que vuelven a empezar o duran más de 12 segundos; los golpes
cortos de ese tramo son efectos y no están. Cada una dice desde dónde la pide
el código: una rutina, la música de la zona en cada fase de la partida (las
listas de `p06:B40C`), la pendiente de `0xCA19` o una tabla.

Las 44 están **cotejadas con openMSX**: el juego, pidiendo esa música, escribe
en el PSG y el SCC lo mismo, cuadro a cuadro, que el motor ejecutado aquí
(`tools/coteja_psg.py`). La 0x8A, igual salvo el primer cuadro, en el que el
juego vuelve a cargar las cinco ondas del SCC y aquí se carga una.

<!-- generado:musica -->
### 0x6A

*Dónde: Zona 0 en la fase 0 y zona 1 en la 5 (p06:B40C); al salir de una conversación (p09:B840) y al acabar la llegada de Snake (p11:A114).*

<audio controls preload="none" src="../audio/musica_6A.mp3"></audio>

### 0x6B

*Dónde: No la pide nadie: ni una rutina ni una tabla de la ROM.*

<audio controls preload="none" src="../audio/musica_6B.mp3"></audio>

### 0x6C

*Dónde: Zona 6 en todas las fases, y las zonas sin otra en la fase 0 (p06:B40C).*

<audio controls preload="none" src="../audio/musica_6C.mp3"></audio>

### 0x6D

*Dónde: Las zonas sin otra en las fases 3, 6 y 7 (p06:B40C).*

<audio controls preload="none" src="../audio/musica_6D.mp3"></audio>

### 0x6E

*Dónde: No la pide nadie: ni una rutina ni una tabla de la ROM.*

<audio controls preload="none" src="../audio/musica_6E.mp3"></audio>

### 0x6F

*Dónde: Zonas 3 y 4 en la fase 4; las demás en la 5 (p06:B40C).*

<audio controls preload="none" src="../audio/musica_6F.mp3"></audio>

### 0x70

*Dónde: La zona 0 y sus vecinas (0-5) desde la fase 1 (p06:B40C).*

<audio controls preload="none" src="../audio/musica_70.mp3"></audio>

### 0x71

*Dónde: Zonas 3-4 en la fase 0, 1-5 en la 2, 8 en las 3, 5 y 6 (p06:B40C); y la pendiente de p02:8AB9.*

<audio controls preload="none" src="../audio/musica_71.mp3"></audio>

### 0x72

*Dónde: Zona 1 en la fase 0; zonas 7 y 9 desde la 3 (p06:B40C); tras la escena 1 (p09:A68A).*

<audio controls preload="none" src="../audio/musica_72.mp3"></audio>

### 0x73

*Dónde: Al subir con 0xCB21 = 9 (p09:A049); en la radio del 140.07.*

<audio controls preload="none" src="../audio/musica_73.mp3"></audio>

### 0x74

*Dónde: La pendiente de p02:8AA3.*

<audio controls preload="none" src="../audio/musica_74.mp3"></audio>

### 0x76

*Dónde: La música de un actor, la primera de p04:8691 (musica_del_actor, p04:8671).*

<audio controls preload="none" src="../audio/musica_76.mp3"></audio>

### 0x77

*Dónde: La música de un actor, la segunda de p04:8691; y con la ficha 0xD800 de tipo 1 (p09:BB20).*

<audio controls preload="none" src="../audio/musica_77.mp3"></audio>

### 0x78

*Dónde: La música de un actor, la tercera de p04:8691.*

<audio controls preload="none" src="../audio/musica_78.mp3"></audio>

### 0x79

*Dónde: La música de un actor, la cuarta de p04:8691.*

<audio controls preload="none" src="../audio/musica_79.mp3"></audio>

### 0x7A

*Dónde: La pendiente de p02:8AAA; en la radio del 140.07.*

<audio controls preload="none" src="../audio/musica_7A.mp3"></audio>

### 0x7B

*Dónde: Solo en la radio del 140.07 (p09:BFC1).*

<audio controls preload="none" src="../audio/musica_7B.mp3"></audio>

### 0x7C

*Dónde: Zonas 8 y 0x0A en la fase 4 (p06:B40C).*

<audio controls preload="none" src="../audio/musica_7C.mp3"></audio>

### 0x7D

*Dónde: Zona 8 en la fase 7 (p06:B40C), la sala de la zona 7 (p00:554B), con 0xD4E3 (p01:7D0C) y en la escena 4 (p09:A996).*

<audio controls preload="none" src="../audio/musica_7D.mp3"></audio>

### 0x7E

*Dónde: Las pendientes de p02:8A2A y p02:8A4F.*

<audio controls preload="none" src="../audio/musica_7E.mp3"></audio>

### 0x7F

*Dónde: Con 0xD430 = 1 o con 0xD4E4 (musica_6b8d, p01:7CF9 y p01:7D14).*

<audio controls preload="none" src="../audio/musica_7F.mp3"></audio>

### 0x80

*Dónde: Zonas 2 y 5 en la fase 0, la 2 en la 1 (p06:B40C); con 0xD4E2 (p01:7D04).*

<audio controls preload="none" src="../audio/musica_80.mp3"></audio>

### 0x81

*Dónde: Escenas de las fichas 0xD8A7-0xD8AC y la sala 5 (p05:AB2B, B06F, BA1C, BE46); en la radio del 140.07.*

<audio controls preload="none" src="../audio/musica_81.mp3"></audio>

### 0x82

*Dónde: Con 0xCAF2 o 0xCAF6 (p11:BB46, p14:BA8E); mientras suena, 0xC697 no deja cambiar la de la zona.*

<audio controls preload="none" src="../audio/musica_82.mp3"></audio>

### 0x83

*Dónde: Al empezar una llamada del transceptor (p09:B8EA).*

<audio controls preload="none" src="../audio/musica_83.mp3"></audio>

### 0x84

*Dónde: Las peleas: las fichas 0xD800 de los tipos 2, 3, 4, 6, 7 y 0x0A (p05:A5F9...) y la escena de 0xD8AC.*

<audio controls preload="none" src="../audio/musica_84.mp3"></audio>

### 0x88

*Dónde: Con 0xCAF2 (p11:BB43), como la 0x82.*

<audio controls preload="none" src="../audio/musica_88.mp3"></audio>

### 0x89

*Dónde: p01:73CF y la ficha 0xD8A9 (p05:B5BA).*

<audio controls preload="none" src="../audio/musica_89.mp3"></audio>

### 0x8A

*Dónde: p07:A36D.*

<audio controls preload="none" src="../audio/musica_8A.mp3"></audio>

### 0x91

*Dónde: La pelea del tipo 1, el helicóptero (p15:B8F2), y la escena 9 (p09:B5A2).*

<audio controls preload="none" src="../audio/musica_91.mp3"></audio>

### 0x98

*Dónde: p13:961C.*

<audio controls preload="none" src="../audio/musica_98.mp3"></audio>

### 0x99

*Dónde: La presentación (p13:808F); en la radio del 140.07.*

<audio controls preload="none" src="../audio/musica_99.mp3"></audio>

### 0x9A

*Dónde: La presentación (p14:A336); en la radio del 140.07.*

<audio controls preload="none" src="../audio/musica_9A.mp3"></audio>

### 0x9C

*Dónde: La escena 3 (p09:A8D3) y el mensaje por sitio (p05:A9E8); en la radio del 140.07.*

<audio controls preload="none" src="../audio/musica_9C.mp3"></audio>

### 0x9D

*Dónde: La escena 2 (p09:A7AA) y la llegada a la sala 5 (p05:BFCB); en la radio del 140.07.*

<audio controls preload="none" src="../audio/musica_9D.mp3"></audio>

### 0x9E

*Dónde: Las escenas 1, 6 y 7 (p09:A639, AFDD, B1D5); en la radio del 140.07.*

<audio controls preload="none" src="../audio/musica_9E.mp3"></audio>

### 0x9F

*Dónde: La sala 5 (p05:BD9F); en la radio del 140.07.*

<audio controls preload="none" src="../audio/musica_9F.mp3"></audio>

### 0xA0

*Dónde: La ficha 0xD8AA (p05:BBE1); en la radio del 140.07.*

<audio controls preload="none" src="../audio/musica_A0.mp3"></audio>

### 0xA2

*Dónde: La escena 9 (p09:B5E7); en la radio del 140.07.*

<audio controls preload="none" src="../audio/musica_A2.mp3"></audio>

### 0xA3

*Dónde: El final, estado 7 (p13:9731); en la radio del 140.07.*

<audio controls preload="none" src="../audio/musica_A3.mp3"></audio>

### 0xA4

*Dónde: El final, estado 7 (p13:99FE); en la radio del 140.07.*

<audio controls preload="none" src="../audio/musica_A4.mp3"></audio>

### 0xA8

*Dónde: Tras una conversación de la lista (p06:AF02).*

<audio controls preload="none" src="../audio/musica_A8.mp3"></audio>

### 0xA9

*Dónde: Solo en la radio del 140.07 (p09:BFC1).*

<audio controls preload="none" src="../audio/musica_A9.mp3"></audio>

### 0xAA

*Dónde: Solo en la radio del 140.07 (p09:BFC1).*

<audio controls preload="none" src="../audio/musica_AA.mp3"></audio>
<!-- /generado -->
