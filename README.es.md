# Metal Gear 2: Solid Snake - desensamblado comentado

*(Also [in English](README.md).)*

El desensamblado comentado de **Metal Gear 2: Solid Snake** (メタルギア2 ソリッドスネーク; Konami, 1990, RC-767) para MSX2: una MegaROM de 512 KB con el mapper de Konami con SCC, sesenta y cuatro bancos de 8 KB.

- **100 %** del binario explicado: 118.147 bytes de código y 406.141 de datos con nombre, ni un byte sin asignar.
- **45,9 %** del listado comentado, 7.673 rutinas, ninguna por debajo del 10 % de comentarios.
- El listado se reensambla en la ROM original **byte a byte**.
- Las 274 salas y las especiales, Snake, los enemigos, las once peleas, las armas, el equipo, el radar, los retratos y las secuencias los **pinta el propio cartucho**, con su código ejecutado, y están cotejados con la VRAM de openMSX; los textos y las conversaciones del transceptor salen de la ROM; las 44 músicas salen de ejecutar su propio motor de sonido.

La web: <https://antxiko.github.io/MetalGear2-disassembly/es/>
(en inglés: <https://antxiko.github.io/MetalGear2-disassembly/>).

## Reproducirlo

La imagen del cartucho no se distribuye. Pon la tuya en la raíz como `metalgear2.rom` (sha256 `43b7fab5...`) y ejecuta `make`. El detalle, en [POR DENTRO](docs/es/POR-DENTRO.md).

## Legal

El juego es de Konami y de sus titulares. La licencia de `LICENSE` cubre solo las herramientas, los comentarios, el análisis y la documentación de aquí. Mira [AVISO-LEGAL.md](AVISO-LEGAL.md).
