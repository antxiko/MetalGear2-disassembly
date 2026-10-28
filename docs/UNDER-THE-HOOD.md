# Under the hood

## Rebuilding the ROM

```
make            # listing, reassembly, checks and tests
make verify     # the 64 reassembled banks give the whole ROM, byte for byte
make sanity     # every byte, explained as code or as data with its reader
```

You need the cartridge image (`metalgear2.rom`, sha256
`43b7fab533abeb87313919ec1fc7bc732d7b0ebfacede1e4f89d8295160384f2`, sha1
`af567ea6e27912d6d5bf1c8e9bc18e9b393fd1ab`), which is not distributed.

## In numbers

| | |
|---|---|
| explained | 100% of the 524,288 bytes |
| code | 118,147 bytes, 57,378 instructions |
| data | 406,141 bytes, each block with the routine that reads it |
| routines | 7,673 |
| commented | 45.9% of the instructions, no routine below 10% |

## The cartridge

Metal Gear 2: Solid Snake (Konami, 1990, RC-767): a **512 KB** MegaROM, 64
banks of 8 KB with Konami's SCC mapper (registers at 0x5000, 0x7000, 0x9000
and 0xB000; 0x3F at 0x9000 opens the SCC). Each bank always runs in the same
window (`tools/paginas.py`), and no write to the mapper in the whole
cartridge contradicts it (`tools/reconocimiento.py`).

- Bank 0 is at 0x4000, except while the sound runs, which puts
  **16-17-18-19** in the four slots (`p03:A0ED`).
- The others are put in by **hand-outs**, 58 routines at `p00:40F0-4229` that
  set one to three banks at once: 1-2-3, 24-25-26, 32-33-34, 48-49 (texts),
  50-51 (texts), 13-14 (the sequences)... `cartucho.REPARTOS` lists them, and
  a test runs them again one by one.
- **The interrupt does not run in the ROM**: start-up copies four pieces of
  bank 3 into the RAM with `ldir` (`p00:4085-40AF`) and `H.KEYI` jumps to the
  copy at `0xC200` (`p00:40D1`); the one at `0xC340` is the call to the sound.
  The tracer follows them from the bytes of bank 3.
- Every frame, the interrupt puts in bank 63 and calls `p63:B800`, which is
  `or a / ret`: the [debug monitor](THE-DEBUG-MONITOR.html), switched off.

## The states

`0xCA00` is the state and `0xCA01` its step (`p01:72A2`):

| State | |
|---:|---|
| 0 | the Konami logo and the round of the intro |
| 1 | the intro (`p13:8000`) and the title (`p14:A196`) |
| 2 | the title goes to white (`p14:A299`) |
| 3 | waits and clears the game |
| 4 | the new game |
| 5 | **the game**: the zone's routine and the step at `0xCA01` (0 play, 2 F2, 3 F3...) |
| 6 | the end of the game, with its window (`p01:7655`) |
| 7 | the ending (`p13:9555`) |

## The RAM

| | |
|---|---|
| `0xC000-0xC37F` | the copies of bank 3 (the interrupt, the call to the sound) |
| `0xC400-0xC69F` | the sound engine |
| `0xCA00` / `0xCA01` | the state and its step |
| `0xCA22` | the game phase (the lists at `p06:B40C`) |
| `0xCA42` | the VRAM page being drawn on (0 or 1, alternating) |
| `0xCA4A` / `0xCA4B` | the zone and the room |
| `0xCA53` | Snake's life |
| `0xCA5F` | the alert |
| `0xCA76` | the special room |
| `0xCB01` | Snake's drawing |
| `0xCE00` | the actors |
| `0xD500` | the room's doors (16-byte records) |
| `0xD600` / `0xD638` | Snake's weapons and equipment |
| `0xD7A0` | the transceiver frequencies |
| `0xD7D0` | the game flags |
| `0xD800` | the boss records (4 x 0x20) |
| `0xD900` | the zone map |
| `0xDC00` | the sprite attributes |

## The VRAM

The V9938's **SCREEN 5** (`p06:B066`): 256 x 212 dots, 16 colours, four 32 KB
pages. The game draws on page 0 or 1 while it shows the other (`0xCA42`);
page 3 keeps the font and the drawings of the weapons and the equipment, and
page 2 the pieces of the rooms, which are copied with HMMM commands. The
sprite patterns go at `0xF800` (R#6 = 0x1F). The fight with METAL GEAR splits
the screen by changing R#23 on one line (`0xCA1C`).

## What the emulator has to do

For the cartridge running (`tools/mg2run.py` on top of `tools/msx2run.py`) to
paint the same as an MSX, three things were needed, each checked against
openMSX:

- **Finishing the opening call.** The game starts with キャンベル's call open
  (`0xCA97` = 1), and meanwhile `empieza_la_partida` (`p02:9E94`) does not
  load the runs at `p37:B007` and `p37:AF4C`, the sprite patterns of the
  bosses, the enemies and what Snake carries: it loads them when the call ends
  (`p09:B82F`). Skipping the call without loading them gave sprites with
  letters instead of PREDATOR, NIGHT SIGHT or GREY FOX.
- **The RAM of page 2.** With `ENASLT` and the slot at `0xC386` the game puts
  its RAM at `0x8000-0xBFFF`, keeps the radar's room drawings there and goes
  back to the cartridge with `WSLREG`. Without it, the radar comes out full of
  noise.
- **The pace.** While playing, one game frame every 5 of the VDP (sometimes
  6): 709 in 3,600 (`tools/omsx_ritmo.tcl`, `partida` mode). The gameplay
  GIFs go at that pace (`tools/gif_juego.py`); those of the intro and the
  ending, at theirs, measured frame by frame.

## How it has been done

- **The trace** follows the code from its entry points with the bank there is
  in each slot (`tools/bancos.py`, `tools/z80trace.py`), with a virtual bank
  for the copies in the RAM. The jump tables through `HL` (`p00:424E`,
  `p01:7CE6`) are measured separately (`tools/tablas_hl.py`).
- **The readers** (`tools/lectores.py`) go through each data format from the
  calls that read it and declare each block (`tools/bloques.py`).
- **The pictures are not redrawn: the cartridge paints them.**
  `tools/mg2run.py` runs the game's code on a Z80 with an emulated V9938
  (`tools/msx2run.py`) and the VRAM is kept: the rooms (`tools/mapas.py`),
  Snake (`tools/snake.py`), the actors (`tools/actores_dibujos.py`), the
  fights (`tools/jefes.py`), F2 and F3 (`tools/equipo.py`), the radar
  (`tools/radar.py`), the portraits (`tools/retratos.py`) and the sequences
  (`tools/secuencias.py`) and the enemies (`tools/enemigos.py`).
  `tools/imagenes_web.py` only puts them together.
- **The check against openMSX** is done by dumping the VRAM at the same
  moment of the game (`tools/omsx_*.tcl`, `tools/lanza_*.ps1`) and comparing
  dot by dot (`tools/coteja_salas.py`, `coteja_sprites.py`,
  `coteja_partida.py`, `coteja_secuencias.py`): the 274 rooms, 74 of the 75 of
  the special rooms, the split screen, the intro and the ending. What comes
  out different has been looked at with two dumps apart in time: the gas
  flicker, the cameras, the belt, the chance of room 6 in zone 4 or an open
  message.
- **The texts** come from the font on page 3, read character by character
  (`tools/textos.py`); the choice of the transceiver records is checked 3,000
  times against the cartridge (`tools/prueba_conversaciones.py`).
- **The music** runs the cartridge's engine (`tools/musica.py`) and is checked
  against openMSX's PSG and SCC frame by frame (`tools/coteja_psg.py`).
- **The long parts of the pages** (the signs, the conversations, the texts and
  the list of tunes) are written by `tools/paginas_web.py` from the ROM.
