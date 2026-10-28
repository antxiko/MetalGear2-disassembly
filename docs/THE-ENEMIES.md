# The enemies

The enemies are **actors** of the zone, not of the room: each one carries its
row and its column and goes from room to room. On the maps there are **155**
in the rooms and **52** in the special rooms, all in their starting place and
none on alert ([The maps](THE-MAPS.html)).

![The 17 kinds of actor with all their drawings](imagenes/actores.png)

Each kind has its table at `p56:A808` (by kind): a width and, behind it, a
row of [offset] [pattern] pairs per drawing; the offsets are words at
`p56:A7EE` (Y in the low byte, X in the high one) added to the actor's
position, and `sprites_de_actores` (`p12:7DDC`) puts them with the sprites
it was handed and the colours of the hand-out (`p04:81C5`). As the patterns
are loaded by each room, each kind is painted in a room where it is
(`tools/actores_dibujos.py`), alone, in the middle and still.

One row per kind, top to bottom:

| Kind | Drawings | Painted in | What it is |
|---|---:|---|---|
| 0x01 | 16 | zone 0x00, room 1 | soldier |
| 0x02 | 16 | zone 0x01, room 0x13 | soldier |
| 0x04 | 16 | zone 0x03, room 0 | soldier |
| 0x05 | 16 | zone 0x03, room 0x10 | soldier |
| 0x06 | 16 | zone 0x04, room 0x16 | soldier |
| 0x07 | 16 | zone 0x0A, room 0x0E | soldier |
| 0x09 | 16 | zone 0x04, room 8 | soldier |
| 0x0A | 16 | zone 0x04, room 0x0D | soldier |
| 0x0C | 16 | zone 0x01, room 0x0D | soldier |
| 0x10 | 8 | zone 0x06, room 2 | small figure in a red cap |
| 0x11 | 8 | zone 0x04, room 5 | small figure with pigtails |
| 0x12 | 8 | special room 0x39, room 1 | small animal: the room is full of them |
| 0x13 | 2 | zone 0x06, room 1 | blue dome |
| 0x14 | 1 | zone 0x08, room 3 | machine of 48 x 48 dots |
| 0x15 | 4 | zone 0x01, room 0x0A | camera |
| 0x16 | 16 | zone 0x0F, room 3 | bird |
| 0x17 | 3 | zone 0x0F, room 3 | a 4 x 4 dot, with the birds |

The soldiers share the table (`p56:A852`): what changes between them is what
they do (each kind's routine, `p04:815B`) and the colours. In zone 3, with no
alert, the colours are those of `p08:BA2F` (the white head); with the alert,
the kind carries bit 7 and the usual ones come back.

Kinds 0x03, 0x08, 0x0B, 0x18 and 0x19 have their drawing table but are in no
room, so there are no loaded patterns to paint them with.
