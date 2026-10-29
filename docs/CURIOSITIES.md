# Curiosities

## A hidden debug monitor

The last bank keeps the programmers' tool: pause, a VRAM viewer and a sprite
viewer, Snake's coordinates and keyboard cheats. It is complete and **two
bytes** switch it off. All of it, with its keys, in
[The debug monitor](THE-DEBUG-MONITOR.html).

## The two eggs: a boa and an owl

There are **two eggs** in the equipment (タマゴ, items 0x0E and 0x0F), and
both hatch on their own, counting game frames:

- **0x0E**: when it is picked up (`p03:BD33` → `p10:A1C1`) it counts 2 x
  0x200 frames (about 87 s on the MSX) and its drawing in F3 changes twice
  (`p10:A204`). At the end the `0xE1D8` record comes out, two sprites
  (`p10:A234`), which goes for the C rations Snake carries, B3, B2 and B1, and
  eats them (`p10:A24D`). It is the boa Norden talks about: «it eats
  anything; it'll love the rations, throw them away when it reaches the
  eggshell» (`p49:A2FD`).
- **0x0F**: it counts 0x600, 0x300, 0x80 and 0x20 frames (about 3 min 30 s)
  changing its drawing, and then alternates two steps forever; in one, if
  Snake has it equipped, sound 0x26 plays (`p11:BC62`). It is the owl: Norden
  says the Zanzibar owl hoots at sunset and they use it as a clock there
  (`p49:A1CD`). With it equipped, in room 0x0E of zone 0x0A an actor changes
  step (`p05:A035`) and the game phase goes to at least 8 (`p05:A0C5`).

## The game runs at 12 frames a second

While playing, the game processes one frame every 5 of the VDP (sometimes
6): in openMSX, the counter `0xCA03` goes up 709 times in 3,600 frames, a
minute (`tools/lanza_ritmo.ps1 -modo partida`). It is the pace of all the
gameplay GIFs on this site.

## VRAM:OIK bytes

In the talk at the end, Snake asks for doctor マルフ's cartridge to be put
into an MSX: «そのままMSXにさしこんでみろ» (`p50:9DB5`). The screen that comes
up is an MSX's start-up screen, with **«VRAM:OIK bytes»**:

![VRAM:OIK bytes](imagenes/vram_oik.png)

Snake: «look closely... doctor マルフ's signature is there... here, KIO MA...»
(`p50:9E6C`); ホーリー: «oh, that's right... it's backwards» (`p50:9EA6`).
«VRAM:OIK» read backwards is **«KIO:MARV»**.

## Konami and the MSX, inside the game

ペトロ tells how マルフ was a games fanatic and hid the OILIX plans on a
microfilm, on the board of a cartridge: «コナミというニホンのゲームメーカーの
MSXカートリッジらしい», an MSX cartridge from a Japanese company called
Konami. Snake answers that the MSX is the computer with the most machines
sold in the world (`p50:8E6D`). The cartridge is in the equipment:
«カートリッジ: マルフののこしたゲームカートリッジ» ([Snake](SNAKE.html)).

## The 140.07 radio

With the **cigarettes** equipped, with no alert, outside the lift and
special rooms 2 and 0x2A, dialling **140.07** on the transceiver
(`p09:BF42`) puts on one of **16 tunes at random** according to the frame
counter (`p09:BFB5`, table `p09:BFC1`): 0xA9, 0xAA, 0x99, 0x9A, 0x9C, 0x9D,
0x9E, 0x9F, 0xA2, 0xA3, 0xA4, 0xA0, 0x73, 0x7A, 0x7B and 0x81. Run in the
cartridge: with the cigarettes, each value of the counter gives its tune;
without them, none. Three of them, 0x7B, 0xA9 and 0xAA, **only play on that
radio**.

And with the cigarettes Snake's portrait carries another piece on top, the
cigarette in his mouth (`p01:70C9`, `p44:95D1`):

![Snake without and with the cigarettes](imagenes/tabaco.png)

## Two tunes nobody asks for

Tunes **0x6B** and **0x6E** have their routine (`p01:6B22`, `p01:6B2E`) and
their score, but nothing in the game reaches them. Checked along every path a
tune is asked for by:

- All the sound routines (172 in `p01` and 5 in `p00`) carry their fixed
  number (`ld a,NN`) and jump to `0xC340`; nothing else reaches `0xC340` or `p16:4003` with another
  number, and the engine never asks itself for a sound.
- No `call`, `jp` or `jr` goes to `p01:6B22` or `p01:6B2E`.
- The tunes asked for by address (`pide_musica_hl`, the pending one at
  `0xCA19`, the one playing at `0xCA20`, `rutina_de_fase` with its lists at
  `p06:B40C`, the radio at `p09:BFC1`) take the address from an `ld hl,` or
  from a table of words; so do the eight indirect jumps (`jp (hl)`).
- The address bytes `22 6B` appear nowhere in the ROM, and `2E 6B` only at
  `p24:1704`, inside the room blocks of zone 2 (`p00:58DD`): block numbers, not
  a pointer.

And running the engine shows what they are: 0x6E reads the same score bytes as
**0x6D** but for 17 (its header), and 0x6B shares 1,393 of its 1,922 with
**0x6A** (`tools/partituras.py`). They are variants of those two that were
left unused. They are in [The music](THE-MUSIC.html).

## A 140.99 that becomes 140.98 on loading

After message `p48:9D50`, the game runs conversation 30 of the list at
`p48:800C` (`p06:B054`): it sets flag 0xA2 and マスター's frequency (140.38)
becomes **140.99**. When the saved game is continued, the list is rebuilt
(`p09:B62F`) and, with that flag, it stays at **140.98** (`p09:B66D`). Run in
the cartridge: 0x38, 0x99 after `p06:B054`, 0x98 after `p09:B62F`.

The message signed by キャンベル but saying it is キャリー («dad has gone
fishing... he took the radio... the frequency is 140.99») is pointed to by no
pointer in the ROM: it only appears in the list of 36 at `p48:800C`, which
serves to recognise it, not to put it on. Whether the game ever shows it has
not been checked by playing.

## SNATCHER

ケスラー tells what happened to BIG BOSS after the fall of OUTER HEAVEN: he
survived without his hands, his legs, his right eye and his right ear; a
tyrant of the East took an interest in him, they hurried on
**«ペトロビッチ・マッドナーのSNATCHERケイカク»**, Pettrovich Madnar's SNATCHER
plan, and chose him for the experiment (`p49:B61E`).

## What Snake picks up and throws away

«を、ニュウシュした。 / しかし、つかいみちが ないのですてよう！»: he has picked it
up, but it is no use and he throws it away (`p51:B1D9`, `p51:B1E4`). There
are ten: fish bones, pigeon droppings, a snake skin, a dummy's right arm, a
dead rat, a **«バグチェックリスト»** (a bug check list), a cigarette end, a
banana skin, **«コナミ　パラダイム»** and an empty bottle (`p51:B1F9-B244`).

## How to use it: unknown

Seven equipment descriptions end with «シヨウホウホウはフメイ», how to use it is
unknown: the lighter (a «100エンライター» from «JR TOKAI»), the cigarettes,
the hang glider («戦場でのリヨウカチはなし», of no use on the battlefield), the
cardboard box, the bin, the egg and the brooch. And the camouflage mat is
«あらゆるVRAMにタイオウできる», **compatible with any VRAM**. All of them in
[Snake](SNAKE.html).

## The cartridge's misprints

- The green card is called «グレーン　カード» (`p51:B38F`) and its description
  says «グリーン・カード» (`p51:BD46`).
- «ボデイ・アーマー» (`p51:B33C`) and, in its description, «ボディ・アーマー»
  (`p51:B8F2`).

## The ending credits, six times slower

The credits over the sun last 40.5 seconds if the code runs without waiting
for the VDP; on the MSX, **249.8**: every frame clears and copies rectangles
with the VDP and the game waits for each command to finish
([The sequences](THE-SEQUENCES.html)).

## The entrance gets lighter

In zone 0, on going up to row 3 and then to row 4, `0xCAAD` becomes 1 and 2
(`p02:8181`) and the palette gets lighter: on the map, the bottom part is
darker ([The maps](THE-MAPS.html)).

## What the listing had wrong

Running the cartridge to draw it brought out errors in the listing, now
corrected:

- In `p12` the colours of Snake's sprites were called «patterns», and the
  other way round: looking at register R#6 with the game running caught it.
- The `0xD800` records were given as 22 kinds: they are **11**, with one
  drawing table by kind (`p04:8A75`) and one logic table by kind minus one
  (`p04:8A8D`).
- The comments of `mira_condiciones` (`p01:6104`) gave the conditions the
  wrong way round; the 3,000 tests of [The texts](THE-TEXTS.html)
  caught it.
- The vertical order of the rooms: the row **goes up** on leaving through
  the top (`p02:8117`).
- The steps of RUNNING MAN's table (`p05:AC48`) were named one or two off from
  0xAD2F on: steps 7 and 8 reuse 1 and 2. Seen when his fight was finished.
  The same with GREY FOX's (`p05:B934`), three off from `0xBBA2` on: steps
  0x0D-0x0F all go to a `ret` (`p05:BA57`).

## Open questions

- **Snake's drawing 7** (turning round while crawling, in state 0x0B) has not
  come out playing: its patterns are of Snake lying down and are painted
  split.
- **Actor kinds 0x03, 0x08, 0x0B, 0x18 and 0x19** are in no room.
- **Special room 0x2D** (its room 1) is not checked: in openMSX Snake dies on
  entering.
- A few dots (4 to 25) of the lift button lights and of the floor number in
  zone 0x10 come out different from openMSX without explanation.
- キャリー's 140.99 message (above).
- The unnumbered conversation at `p48:84B1` chains, one frame after another,
  pieces of ケスラー's messages started in mid-sentence: whether the game uses
  it has not been seen.
- The monitor cheats marked «read» ([The debug monitor](THE-DEBUG-MONITOR.html)).
