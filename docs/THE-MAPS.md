# The maps

The game has **20 zones** with **274 rooms** and **57 special rooms** (what
lies behind a door: stores, offices, lifts), which add up to another 75
rooms. Each zone is a grid of rooms (`p30:B8A5`, which `p02:804E` unpacks into
`0xD900`); a room of 0x80 or more in the grid is the way into zone 0x80 less
that. The special rooms have their grid at `p30:BA18` and are drawn with the
pieces of the zone they are entered from (`p15:B4B5`).

Everything on this page is **painted by the cartridge running**: each room is
entered the way the game enters it (`tools/mapas.py`), five frames of the
game loop are run and the screen is kept, with the room's palette. The 274
rooms and 74 of the 75 of the special rooms are **checked against openMSX's
VRAM** in games taken room by room; what comes out different is animation
(cameras, belts), chance or an open message, and is explained in
[Under the hood](UNDER-THE-HOOD.html).

On top go each room's enemies, painted by their own routines (`p12:7DDC`),
and the labels:

- in yellow, the room number;
- `Exx`, the door to special room xx; `Zzz`, the way into zone zz (`Zzz:ss`,
  into its room ss); `->ss`, the door to room ss;
- under each zone, its special rooms: `Exx <- ss #n` is special room xx,
  entered from room ss through door n.

The rows go **up**: leaving through the top adds one row (`p02:8117`).

## Zone 0x00 (13 rooms)

The entrance, with the lorries, the stores below and the way into zone 1.
On going up to row 3 and to row 4 the palette gets lighter (`0xCAAD`,
`p02:8181`): the bottom part comes out darker.

![Zone 0x00](imagenes/zona_00.png)

## Zone 0x01, floor 1F (23 rooms, 4 special)

The lift carries the sign **1F**.

![Zone 0x01](imagenes/zona_01.png)

## Zone 0x02, floor 2F (9 rooms, 2 special)

![Zone 0x02](imagenes/zona_02.png)

## Zone 0x03, floor 3F (21 rooms, 8 special)

BLACK COLOR is fought here. Rooms 1, 2 and 7 have gas: on entering, the
palette flickers (`p03:BAE8`, `p03:BC29`).

![Zone 0x03](imagenes/zona_03.png)

## Zone 0x04, floor 4F (24 rooms, 10 special)

The dormitories, the canteen and the toilets. The soldiers of room 6 come out
in one of **four placings at random** (`p12:6A28`): the one on the map is one
of them.

![Zone 0x04](imagenes/zona_04.png)

## Zone 0x05, floor B1 (9 rooms, 13 special)

The weapon stores.

![Zone 0x05](imagenes/zona_05.png)

## Zone 0x06, floor B2 (36 rooms, 3 special)

The water channel.

![Zone 0x06](imagenes/zona_06.png)

## Zone 0x07 (21 rooms, 2 special)

The jungle, the swamp and the helicopter pad: the HIND D is fought here, and
RUNNING MAN in special room 0x29.

![Zone 0x07](imagenes/zona_07.png)

## Zone 0x08 (16 rooms)

![Zone 0x08](imagenes/zona_08.png)

## Zone 0x09 (5 rooms)

![Zone 0x09](imagenes/zona_09.png)

## Zone 0x0A (25 rooms, 7 special)

The outside: the field, the huts and the stores. The stripes of room 0x0E
change colour every frame (`p10:BC59`). PREDATOR is fought here.

![Zone 0x0A](imagenes/zona_0A.png)

## Zone 0x0B (9 rooms, 1 special)

The four ULTRABOX wait in its lift.

![Zone 0x0B](imagenes/zona_0B.png)

## Zone 0x0C (9 rooms, 2 special)

![Zone 0x0C](imagenes/zona_0C.png)

## Zone 0x0D (7 rooms, 3 special)

![Zone 0x0D](imagenes/zona_0D.png)

## Zone 0x0E (6 rooms)

RED BLASTER is fought here.

![Zone 0x0E](imagenes/zona_0E.png)

## Zone 0x0F (5 rooms)

![Zone 0x0F](imagenes/zona_0F.png)

## Zone 0x10 (4 rooms)

![Zone 0x10](imagenes/zona_10.png)

## Zone 0x11 (6 rooms)

![Zone 0x11](imagenes/zona_11.png)

## Zone 0x12 (20 rooms, 1 special)

The one of the fights with METAL GEAR, GREY FOX and BIG BOSS.

![Zone 0x12](imagenes/zona_12.png)

## Zone 0x13 (6 rooms, 1 special)

NIGHT SIGHT is fought here, and Pettrovich is here.

![Zone 0x13](imagenes/zona_13.png)
