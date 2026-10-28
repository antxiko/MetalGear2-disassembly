# The sequences

The intro, the title and the ending, **painted by the cartridge running**
frame by frame (`tools/secuencias.py`, with the interrupt's whole frame,
`p01:728E`) and checked against openMSX's VRAM: of 100 dumps of the intro,
**96** identical dot for dot; of the ending, **163 out of 169**. The others
are drawings half done at the moment of the dump (a strip of the shot being
painted, a bird at another point of its flight, a fade halfway through).

The GIFs go **at the MSX's pace**, not the pace of the cartridge running: the
game waits for the VDP on each copy and on the MSX it drops frames. The pace
is measured in openMSX, logging on every real frame the game's count of
processed frames (`0xCA03`, `tools/omsx_ritmo.tcl`); each picture lasts what
it lasts on the MSX.

## The intro

![The whole intro, at the MSX's pace](imagenes/presentacion.gif)

State 0 (`p01:72B2`) paints the Konami logo (`p13:92D1`) and chooses one of
**two rounds** according to `0xCA2A`, which alternates: the credits one and
the story one.

**The credits** (state 1, `p13:8000`, steps 1-0x41 of `0xCA2C`): each one
with its shot drawn line by line, its sprites and its letters written one at
a time. 178.9 s on the MSX (147 s in the cartridge running).

**The title** (`p14:A196` and state 2, `p14:A299`): METAL GEAR 2 SOLID
SNAKE, which ends **in white**: state 2 takes the palette one step every two
frames towards the one at `p13:9278`, which is 16 colours of (7, 7, 7).

**The story** (the other round, steps 0x80 and on, `p14:A2CF`): the text in
Japanese over the drawings.

## The ending

![The whole ending, at the MSX's pace](imagenes/final.gif)

State 7 (`p13:9555`, 31 steps of `0xD701`), which the game moves to with
`0xCAAF` (`p01:7473`).

**Zanzibar** (steps 2-8), rising with the vertical scroll (R#23).

**The credits over the sun** (steps 9-17). Step 15 changes page every frame
and on each one it clears a 0x90 x 0x60 rectangle, copies on top the drawing
from page 2 and the letters (`p13:9871`): on the MSX it lasts **249.8 s**;
in the cartridge running, without waiting for the VDP, 40.5.

**The talk** (steps 18-21): the 19 messages of `p50:8042`
(`p50:9D2C-9F7D`), with the MSX screen [Curiosities](CURIOSITIES.html)
talks about.

**The cast** (steps 22-27), with the portraits: 115 s on the MSX.

**The fade to white** (steps 28-30).

