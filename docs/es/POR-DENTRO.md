# Por dentro

## Rehacer la ROM

```
make            # listado, reensamblado, comprobación y tests
make verify     # los 64 bancos reensamblados dan la ROM entera, byte a byte
make sanity     # cada byte, explicado como código o como dato con su lector
```

Hace falta la imagen del cartucho (`metalgear2.rom`, sha256
`43b7fab533abeb87313919ec1fc7bc732d7b0ebfacede1e4f89d8295160384f2`, sha1
`af567ea6e27912d6d5bf1c8e9bc18e9b393fd1ab`), que no se distribuye.

## En cifras

| | |
|---|---|
| explicado | 100 % de los 524.288 bytes |
| código | 118.147 bytes, 57.378 instrucciones |
| datos | 406.141 bytes, cada bloque con la rutina que lo lee |
| rutinas | 7.673 |
| comentado | 45,9 % de las instrucciones, ninguna rutina por debajo del 10 % |

## El cartucho

Metal Gear 2: Solid Snake (Konami, 1990, RC-767): una MegaROM de **512 KB**,
64 bancos de 8 KB con el mapper Konami del SCC (registros en 0x5000, 0x7000,
0x9000 y 0xB000; 0x3F en 0x9000 abre el SCC). Cada banco se ejecuta siempre
en la misma ventana (`tools/paginas.py`), y ninguna escritura al mapper de
todo el cartucho lo contradice (`tools/reconocimiento.py`).

- El banco 0 está en 0x4000, salvo mientras suena el sonido, que pone
  **16-17-18-19** en las cuatro ranuras (`p03:A0ED`).
- Los demás se ponen por **repartos**, 58 rutinas de `p00:40F0-4229` que dejan
  de uno a tres bancos de una vez: 1-2-3, 24-25-26, 32-33-34, 48-49 (textos),
  50-51 (textos), 13-14 (las secuencias)... `cartucho.REPARTOS` los lista, y
  un test los vuelve a ejecutar uno a uno.
- **La interrupción no corre en la ROM**: el arranque copia cuatro trozos del
  banco 3 a la RAM con `ldir` (`p00:4085-40AF`) y `H.KEYI` salta a la copia
  de `0xC200` (`p00:40D1`); la de `0xC340` es la llamada al sonido. El
  trazador las sigue desde los bytes del banco 3.
- Cada cuadro, la interrupción pone el banco 63 y llama a `p63:B800`, que es
  `or a / ret`: el [monitor de depuración](EL-MONITOR.html), apagado.

## Los estados

`0xCA00` es el estado y `0xCA01` su paso (`p01:72A2`):

| Estado | |
|---:|---|
| 0 | el logotipo de Konami y la vuelta de la presentación |
| 1 | la presentación (`p13:8000`) y el título (`p14:A196`) |
| 2 | el título se va a blanco (`p14:A299`) |
| 3 | espera y borra la partida |
| 4 | la partida nueva |
| 5 | **la partida**: la rutina de la zona y el paso de `0xCA01` (0 jugar, 2 F2, 3 F3...) |
| 6 | el fin de la partida, con su ventana (`p01:7655`) |
| 7 | el final (`p13:9555`) |

## La RAM

| | |
|---|---|
| `0xC000-0xC37F` | las copias del banco 3 (la interrupción, la llamada al sonido) |
| `0xC400-0xC69F` | el motor de sonido |
| `0xCA00` / `0xCA01` | el estado y su paso |
| `0xCA22` | la fase de la partida (las listas de `p06:B40C`) |
| `0xCA42` | la página de la VRAM en que se dibuja (0 o 1, se alterna) |
| `0xCA4A` / `0xCA4B` | la zona y la sala |
| `0xCA53` | la vida de Snake |
| `0xCA5F` | la alerta |
| `0xCA76` | la sala especial |
| `0xCB01` | el dibujo de Snake |
| `0xCE00` | los actores |
| `0xD500` | las puertas de la sala (fichas de 16 bytes) |
| `0xD600` / `0xD638` | las armas y el equipo de Snake |
| `0xD7A0` | las frecuencias del transceptor |
| `0xD7D0` | las banderas de la partida |
| `0xD800` | las fichas de los jefes (4 x 0x20) |
| `0xD900` | el mapa de la zona |
| `0xDC00` | los atributos de los sprites |

## La VRAM

**SCREEN 5** del V9938 (`p06:B066`): 256 x 212 puntos, 16 colores, cuatro
páginas de 32 KB. El juego dibuja en la página 0 o la 1 mientras enseña la
otra (`0xCA42`); la página 3 guarda la fuente y los dibujos de las armas y el
equipo, y la 2 las piezas de las salas, que se copian con órdenes HMMM. Los
patrones de los sprites van en `0xF800` (R#6 = 0x1F). La pelea con METAL
GEAR parte la pantalla cambiando R#23 en una línea (`0xCA1C`).

## Lo que tiene que hacer el emulador

Para que el cartucho ejecutado (`tools/mg2run.py` sobre `tools/msx2run.py`)
pinte lo mismo que un MSX han hecho falta tres cosas, cada una cotejada con
openMSX:

- **Acabar la llamada del principio.** La partida empieza con la llamada de
  キャンベル abierta (`0xCA97` = 1), y mientras tanto `empieza_la_partida`
  (`p02:9E94`) no carga las rachas de `p37:B007` y `p37:AF4C`, los patrones
  de sprite de los jefes, los enemigos y lo que lleva Snake: los carga al
  acabar la llamada (`p09:B82F`). Saltarse la llamada sin cargarlos daba
  sprites con letras en lugar de PREDATOR, NIGHT SIGHT o GREY FOX.
- **La RAM de la página 2.** Con `ENASLT` y el slot de `0xC386` el juego pone
  su RAM en `0x8000-0xBFFF`, guarda ahí los dibujos de las salas del radar
  y vuelve al cartucho con `WSLREG`. Sin eso, el radar sale lleno de ruido.
- **El ritmo.** Jugando, un cuadro del juego cada 5 del VDP (a veces 6):
  709 en 3.600 (`tools/omsx_ritmo.tcl`, modo `partida`). Los GIF de la
  partida van a ese ritmo (`tools/gif_juego.py`); los de la presentación y
  el final, al suyo, medido cuadro a cuadro.

## Cómo se ha hecho

- **El trazado** sigue el código desde sus entradas con el banco que hay en
  cada ranura (`tools/bancos.py`, `tools/z80trace.py`), con un banco virtual
  para las copias en la RAM. Las tablas de saltos por `HL` (`p00:424E`,
  `p01:7CE6`) se miden aparte (`tools/tablas_hl.py`).
- **Los lectores** (`tools/lectores.py`) recorren cada formato de datos desde
  las llamadas que lo leen y declaran cada bloque (`tools/bloques.py`).
- **Las imágenes no se redibujan: las pinta el cartucho.** `tools/mg2run.py`
  ejecuta el código del juego en un Z80 con el V9938 emulado
  (`tools/msx2run.py`) y se guarda la VRAM: las salas (`tools/mapas.py`),
  Snake (`tools/snake.py`), los actores (`tools/actores_dibujos.py`), las
  peleas (`tools/jefes.py`), F2 y F3 (`tools/equipo.py`), el radar
  (`tools/radar.py`), los retratos (`tools/retratos.py`) y las secuencias
  (`tools/secuencias.py`) y los enemigos (`tools/enemigos.py`).
  `tools/imagenes_web.py` solo las junta.
- **El cotejo con openMSX** se hace volcando la VRAM en el mismo momento del
  juego (`tools/omsx_*.tcl`, `tools/lanza_*.ps1`) y comparando punto a punto
  (`tools/coteja_salas.py`, `coteja_sprites.py`, `coteja_partida.py`,
  `coteja_secuencias.py`): las 274 salas, 74 de las 75 de las especiales, la
  pantalla partida, la presentación y el final. Lo que sale distinto está
  mirado con dos volcados separados en el tiempo: el parpadeo del gas, las
  cámaras, la cinta, el azar de la sala 6 de la zona 4 o un mensaje abierto.
- **Los textos** salen de la fuente de la página 3, leída carácter a carácter
  (`tools/textos.py`); la elección de las fichas del transceptor está
  contrastada 3.000 veces con el cartucho (`tools/prueba_conversaciones.py`).
- **La música** ejecuta el motor del cartucho (`tools/musica.py`) y se coteja
  con el PSG y el SCC de openMSX cuadro a cuadro (`tools/coteja_psg.py`).
- **Las partes largas de las páginas** (los letreros, las conversaciones, los
  textos y la lista de músicas) las escribe `tools/paginas_web.py` desde la
  ROM.
