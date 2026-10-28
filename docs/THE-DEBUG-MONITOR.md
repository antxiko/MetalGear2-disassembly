# The debug monitor

The cartridge keeps, in its last bank, a tool of the programmers' that never
gets to run: a debug monitor with pause, a VRAM viewer, a sprite viewer,
Snake's coordinates and keyboard cheats. It is complete, but disconnected by
just two bytes.

## Where it is and why it does not run

Every frame's interrupt (`p03:A127`) puts bank 63 at 0xA000 and calls
`p63:B800`. If that call returns with carry, the game does not run that frame
(`p03:A13A`). At `p63:B800` there are just two instructions:

```
B800  or a     ; no carry...
B801  ret      ; ...and back
```

Behind them, from 0xB802 to 0xBF6B (1,897 bytes, 952 instructions), is the
whole monitor. No path of the game reaches it: it is disassembled from a
seed at 0xB802.

To switch it on it is enough to change those two bytes into two `nop`s. They
are at offset 0x7F800 of the ROM (bank 63 × 0x2000 + 0x1800): `B7 C9` becomes
`00 00`. `tools/rom_monitor.py` makes that copy in `work/` without touching
the original ROM. The screenshots below are from openMSX (Japanese C-BIOS
MSX2 machine) with that copy.

![The game with the monitor on and nothing pressed](imagenes/monitor/00-sin-tocar.png)

With the monitor on, the game starts and plays the same: the monitor only
reads the keyboard every frame.

## How it is made

- It reads the keyboard directly with the BIOS (`SNSMAT`, 0x0141), row by
  row, and not with the game's joystick routines.
- It brings its own VDP routines: write a register, wait for a command to
  finish, HMMM, HMMV, LINE, a frame, dump to the VRAM with `otir` and read a
  status register. To talk to the VDP it uses the ports the BIOS announces at
  0x0006-0x0007. The game's, which are in bank 0, are not used here.
- It writes numbers in hexadecimal with the font the game has on page 3 of
  the VRAM.
- Its state goes in 0xCA3E: 0 nothing, 1 pause, 2 sprite viewer, 3 cursor.

## The keys

"Seen" means checked in openMSX with the patched ROM. "Read" means it only
comes from the listing.

### At any moment

| Key | What it does | |
|---|---|---|
| P | Writes Snake's Y and X in hexadecimal in the two boxes on the right, every frame | seen |
| Z | All the equipment: copies `p63:BE1D` (0xC4 bytes) over what Snake carries (0xD600), with 999 in what has a count | seen in the RAM |
| X | 0xD678-0xD6A7 to 1 | read |
| R | 0xD6B4, 0xD6B8 and 0xD6BC to 1, with 0x20, 0x40 and 0x60 behind | read |
| INS / DEL | 0xCA3C to 1 / to 0 | read |
| BS | 0xD430 = 2 and bit 4 of 0xD7D1 | read |
| T | 0xCA8E = 1 | read |
| ^ | 0xD700-0xD71F to 0 and 0xCAAF = 1 | read |
| . (numeric keypad) | 0xE257 = 1 | read |
| STOP | The pause: the game stops running | seen |

![P: Snake's Y (0x80) and X (0xA9), the same as in the RAM](imagenes/monitor/01-p-posicion.png)

### Without pause: moving around the map

| Key | What it does | |
|---|---|---|
| 8, 2, 4, 6 (numeric keypad) | Snake leaves through the top, bottom, left or right, if the map at 0xD900 has a room there | seen (the 8) |
| 0-9, A-J | Puts zone 0x00-0x13 in the square above on the map and leaves through the top | seen (the 5): does not work cleanly |
| ; and ] | Raise and lower the game phase (0xCA22, from 0 to 8) | read |

![With 8 on the numeric keypad, Snake appears in the room above](imagenes/monitor/09-numerico-8-sala-de-arriba.png)

With the 5, the zone becomes 5 but the room stays at 0x85 and then 0xFF, and
the screen is not redrawn. In this test the zone jump does not reach a valid
room; whether something is missing in the finished game, or it expects
another game state, is not checked.

![Key 5: the zone changes, but the room is not valid](imagenes/monitor/10-tecla-5-zona-rota.png)

### In the pause

| Key | What it does | |
|---|---|---|
| 0, 1, 2, 3 | Shows that VRAM page | seen |
| up / down | Scrolls the screen vertically (R#23) | seen |
| TAB | Sprite viewer | seen |
| HOME | Cursor with its coordinates | seen |
| ESC | Leaves the pause and leaves everything as it was | seen |

Page 3 has the font and the drawings of the weapons and the equipment. Page
2, pieces of the drawings of the rooms. Page 0 still keeps the intro screen:

![Pause, key 3: VRAM page 3](imagenes/monitor/02-pausa-pagina-3.png)

![Pause, key 2: page 2](imagenes/monitor/03-pausa-pagina-2.png)

![Pause, key 0: page 0](imagenes/monitor/04-pausa-pagina-0.png)

![Pause, down: the screen scrolled](imagenes/monitor/05-pausa-desplazada.png)

**TAB, the sprite viewer.** It sets the sprites to 16 × 16 doubled (R#1 =
0x63), puts sprites 0 and 1 inside two frames and writes their patterns
beside them. With up and down the patterns go forward or back 8 at a time.

![TAB: patterns 00 and 00](imagenes/monitor/06-tab-visor.png)

![TAB and up: patterns 08 and 0C](imagenes/monitor/07-tab-visor-mas-8.png)

**HOME, the cursor.** A sprite (number 4, pattern 0x18) that moves with the
arrows and changes colour every frame. Its Y + 1 and its X are written in the
boxes on the right, so the coordinates of any point on the screen can be
read.

![HOME: the cursor moved down with the arrow, at Y = 0x7D](imagenes/monitor/08-home-cursor.png)

## What is not checked

- What the cheats marked "read" do in the game: the listing says which bytes
  they touch, but what changes has not been looked at by playing.
- F2 and F3 (the game's weapon and equipment screens) were not opened in the
  first room before the transceiver call. That is why Z has been checked in
  the RAM and not on screen.
- The zone jump with 0-9 and A-J (see above).

The routines are commented in `src/metalgear2_p63.asm`, from
`depuracion_apagada` (0xB800) and `monitor` (0xB802).
