# The music

**44 tunes**, taken **by running the cartridge's own sound engine**
(`tools/musica.py` on top of `tools/motor_musica.py`): its code runs on a
Z80, its writes to the PSG and the SCC are logged frame by frame and
synthesised. There are no recordings.

The engine lives in **bank 16**, which the sound puts at `0x4000` in place
of bank 0 (`p03:A0ED`), with its data in banks 17 (`0x6000`) and 18
(`0x8000`). `p16:4000` silences it, `p16:4003` starts a sound (the game asks
for it through the copy at `0xC340`) and `p16:4006` runs on every interrupt.
Each sound's header comes from `p17:65A9`; the tunes are 0x6A-0xAA, with the
score in bank 19, 20, 21, 22, 23, 55 or 59 (`p16:4CE3`), which is put at
`0xA000` while it plays.

Here are the ones that loop or last more than 12 seconds; the short hits in
that range are sound effects and are not here. Each one says where the code
asks for it from: a routine, the zone's tune in each phase of the game (the
lists at `p06:B40C`), the pending one at `0xCA19` or a table.

All 44 are **checked against openMSX**: the game, asking for that tune,
writes to the PSG and the SCC the same thing, frame by frame, as the engine
run here (`tools/coteja_psg.py`). Tune 0x8A, the same except for the first
frame, in which the game reloads the five SCC waves and here one is loaded.

Three pairs are very alike (comparing the PSG and SCC notes of the first
60 seconds, `work/compara_musicas.py`): **0x6E** with **0x6D** (67 % of the
notes in the same order) and **0x6B** with **0x6A** (in the first 10 seconds
the SCC notes match in 453 of 600 frames; 0x6B lasts 145 s and 0x6A 171).
Nobody asks for 0x6B or 0x6E: they look like earlier versions left in the
cartridge. **0x98** and **0x91** share 53 %.

**0x98** never loops or stops: the engine goes on reading past its score. In
the ending it plays while Zanzibar rises and 0xA3 (`p13:9731`) cuts it 29.3 s
later (measured with openMSX's pace); here it is cut there.

<!-- generado:musica -->
### 0x6A

*Where: Zone 0 in phase 0 and zone 1 in phase 5 (p06:B40C); after a conversation (p09:B840) and at the end of Snake's arrival (p11:A114).*

<audio controls preload="none" src="audio/musica_6A.mp3"></audio>

### 0x6B

*Where: Nobody asks for it: no routine or table in the ROM.*

<audio controls preload="none" src="audio/musica_6B.mp3"></audio>

### 0x6C

*Where: Zone 6 in every phase, and the zones without another one in phase 0 (p06:B40C).*

<audio controls preload="none" src="audio/musica_6C.mp3"></audio>

### 0x6D

*Where: The zones without another one in phases 3, 6 and 7 (p06:B40C).*

<audio controls preload="none" src="audio/musica_6D.mp3"></audio>

### 0x6E

*Where: Nobody asks for it: no routine or table in the ROM.*

<audio controls preload="none" src="audio/musica_6E.mp3"></audio>

### 0x6F

*Where: Zones 3 and 4 in phase 4; the rest in phase 5 (p06:B40C).*

<audio controls preload="none" src="audio/musica_6F.mp3"></audio>

### 0x70

*Where: Zone 0 and its neighbours (0-5) from phase 1 on (p06:B40C).*

<audio controls preload="none" src="audio/musica_70.mp3"></audio>

### 0x71

*Where: Zones 3-4 in phase 0, 1-5 in phase 2, 8 in phases 3, 5 and 6 (p06:B40C); and the pending one of p02:8AB9.*

<audio controls preload="none" src="audio/musica_71.mp3"></audio>

### 0x72

*Where: Zone 1 in phase 0; zones 7 and 9 from phase 3 (p06:B40C); after scene 1 (p09:A68A).*

<audio controls preload="none" src="audio/musica_72.mp3"></audio>

### 0x73

*Where: Going up with 0xCB21 = 9 (p09:A049); on the 140.07 radio.*

<audio controls preload="none" src="audio/musica_73.mp3"></audio>

### 0x74

*Where: The pending one of p02:8AA3.*

<audio controls preload="none" src="audio/musica_74.mp3"></audio>

### 0x76

*Where: An actor's tune, the first of p04:8691 (musica_del_actor, p04:8671).*

<audio controls preload="none" src="audio/musica_76.mp3"></audio>

### 0x77

*Where: An actor's tune, the second of p04:8691; and with the 0xD800 record of type 1 (p09:BB20).*

<audio controls preload="none" src="audio/musica_77.mp3"></audio>

### 0x78

*Where: An actor's tune, the third of p04:8691.*

<audio controls preload="none" src="audio/musica_78.mp3"></audio>

### 0x79

*Where: An actor's tune, the fourth of p04:8691.*

<audio controls preload="none" src="audio/musica_79.mp3"></audio>

### 0x7A

*Where: The pending one of p02:8AAA; on the 140.07 radio.*

<audio controls preload="none" src="audio/musica_7A.mp3"></audio>

### 0x7B

*Where: Only on the 140.07 radio (p09:BFC1).*

<audio controls preload="none" src="audio/musica_7B.mp3"></audio>

### 0x7C

*Where: Zones 8 and 0x0A in phase 4 (p06:B40C).*

<audio controls preload="none" src="audio/musica_7C.mp3"></audio>

### 0x7D

*Where: Zone 8 in phase 7 (p06:B40C), the zone 7 room (p00:554B), with 0xD4E3 (p01:7D0C) and in scene 4 (p09:A996).*

<audio controls preload="none" src="audio/musica_7D.mp3"></audio>

### 0x7E

*Where: The pending ones of p02:8A2A and p02:8A4F.*

<audio controls preload="none" src="audio/musica_7E.mp3"></audio>

### 0x7F

*Where: With 0xD430 = 1 or with 0xD4E4 (musica_6b8d, p01:7CF9 and p01:7D14).*

<audio controls preload="none" src="audio/musica_7F.mp3"></audio>

### 0x80

*Where: Zones 2 and 5 in phase 0, zone 2 in phase 1 (p06:B40C); with 0xD4E2 (p01:7D04).*

<audio controls preload="none" src="audio/musica_80.mp3"></audio>

### 0x81

*Where: Scenes of the 0xD8A7-0xD8AC records and room 5 (p05:AB2B, B06F, BA1C, BE46); on the 140.07 radio.*

<audio controls preload="none" src="audio/musica_81.mp3"></audio>

### 0x82

*Where: With 0xCAF2 or 0xCAF6 (p11:BB46, p14:BA8E); while it plays, 0xC697 keeps the zone tune from changing.*

<audio controls preload="none" src="audio/musica_82.mp3"></audio>

### 0x83

*Where: When a transceiver call starts (p09:B8EA).*

<audio controls preload="none" src="audio/musica_83.mp3"></audio>

### 0x84

*Where: The boss fights: the 0xD800 records of types 2, 3, 4, 6, 7 and 0x0A (p05:A5F9...) and the 0xD8AC scene.*

<audio controls preload="none" src="audio/musica_84.mp3"></audio>

### 0x88

*Where: With 0xCAF2 (p11:BB43), like 0x82.*

<audio controls preload="none" src="audio/musica_88.mp3"></audio>

### 0x89

*Where: p01:73CF and the 0xD8A9 record (p05:B5BA).*

<audio controls preload="none" src="audio/musica_89.mp3"></audio>

### 0x8A

*Where: p07:A36D.*

<audio controls preload="none" src="audio/musica_8A.mp3"></audio>

### 0x91

*Where: The type 1 fight, the helicopter (p15:B8F2), and scene 9 (p09:B5A2).*

<audio controls preload="none" src="audio/musica_91.mp3"></audio>

### 0x98

*Where: The ending, while Zanzibar rises (p13:961C), until 0xA3 cuts it: 29.3 s on the MSX.*

<audio controls preload="none" src="audio/musica_98.mp3"></audio>

### 0x99

*Where: The intro (p13:808F); on the 140.07 radio.*

<audio controls preload="none" src="audio/musica_99.mp3"></audio>

### 0x9A

*Where: The intro (p14:A336); on the 140.07 radio.*

<audio controls preload="none" src="audio/musica_9A.mp3"></audio>

### 0x9C

*Where: Scene 3 (p09:A8D3) and the message by place (p05:A9E8); on the 140.07 radio.*

<audio controls preload="none" src="audio/musica_9C.mp3"></audio>

### 0x9D

*Where: Scene 2 (p09:A7AA) and arriving in room 5 (p05:BFCB); on the 140.07 radio.*

<audio controls preload="none" src="audio/musica_9D.mp3"></audio>

### 0x9E

*Where: Scenes 1, 6 and 7 (p09:A639, AFDD, B1D5); on the 140.07 radio.*

<audio controls preload="none" src="audio/musica_9E.mp3"></audio>

### 0x9F

*Where: Room 5 (p05:BD9F); on the 140.07 radio.*

<audio controls preload="none" src="audio/musica_9F.mp3"></audio>

### 0xA0

*Where: The 0xD8AA record (p05:BBE1); on the 140.07 radio.*

<audio controls preload="none" src="audio/musica_A0.mp3"></audio>

### 0xA2

*Where: Scene 9 (p09:B5E7); on the 140.07 radio.*

<audio controls preload="none" src="audio/musica_A2.mp3"></audio>

### 0xA3

*Where: The ending, state 7 (p13:9731); on the 140.07 radio.*

<audio controls preload="none" src="audio/musica_A3.mp3"></audio>

### 0xA4

*Where: The ending, state 7 (p13:99FE); on the 140.07 radio.*

<audio controls preload="none" src="audio/musica_A4.mp3"></audio>

### 0xA8

*Where: After a conversation of the list (p06:AF02).*

<audio controls preload="none" src="audio/musica_A8.mp3"></audio>

### 0xA9

*Where: Only on the 140.07 radio (p09:BFC1).*

<audio controls preload="none" src="audio/musica_A9.mp3"></audio>

### 0xAA

*Where: Only on the 140.07 radio (p09:BFC1).*

<audio controls preload="none" src="audio/musica_AA.mp3"></audio>
<!-- /generado -->
