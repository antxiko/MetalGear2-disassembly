; ==========================================================================
; METAL GEAR 2 SOLID SNAKE - Konami (1990) - MSX2 - MegaROM RC-767 de 512 KB (Konami SCC) - banco 03 (se ejecuta en 0xa000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x0a000


; ----------------------------------------------------------------------
; Direcciones que solo aparecen como VALOR -en un `ld`, no en
; un salto-: son punteros que el codigo se pasa o numeros que
; casualmente coinciden con una direccion. No hay nada que
; trazar en ellas; el equ existe para que el listado ensamble.
; ----------------------------------------------------------------------
lbe8ch:	equ 0x0be8c

; ======================================================================
; CODIGO 0xa000..0xa004  (4 bytes)
; ======================================================================


L_A000:
	dec hl			;a000
	ld (hl),000h		;a001
	ret			;a003

; ----------------------------------------------------------------------
; DATOS resto_A004: lo apuntan con el banco puesto p01:7699 (0xA004), p01:7702
;   (0xA004); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p01:7699, p01:7702 (29 bytes)
;   0xa004..0xa021  (29 bytes)
DATA_resto_A004:
	defb 040h,060h,00dh,019h,018h,01eh,013h,018h,01fh,00fh,0feh,040h,070h,01dh,00bh,020h	; a004  @`.........@p..
	defb 00fh,0f0h,016h,019h,00bh,00eh,0feh,040h,080h,00fh,018h,00eh,0ffh	; a014  .......@.....

; ======================================================================
; CODIGO 0xa021..0xa216  (501 bytes)
; ======================================================================


L_A021:
	ld hl,(00006h)		;a021
	inc h			;a024
	inc l			;a025
	ld c,h			;a026
	ld a,001h		;a027
	out (c),a		;a029
	ld a,08fh		;a02b
	out (c),a		;a02d
	ld c,l			;a02f
	in a,(c)		;a030
	ld b,a			;a032
	xor a			;a033
	ld c,h			;a034
	out (c),a		;a035
	ld a,08fh		;a037
	out (c),a		;a039
	ld c,l			;a03b
	in a,(c)		;a03c
	rla			;a03e
	jr nc,L_A07F		;a03f
	ld a,(0ca1ch)		;a041
	and a			;a044
	ret z			;a045
	ld c,h			;a046
	ld a,(0ffe7h)		;a047
	and 0fdh		;a04a
	out (c),a		;a04c
	ld a,088h		;a04e
	out (c),a		;a050
	ld a,01fh		;a052
	out (c),a		;a054
	ld a,082h		;a056
	out (c),a		;a058
	ld c,h			;a05a
	ld a,(0ca01h)		;a05b
	sub 002h		;a05e
	cp 003h		;a060
	ld a,(0fff6h)		;a062
	ld b,a			;a065
	jr nc,L_A06B		;a066
	xor a			;a068
	ld b,008h		;a069
L_A06B:
	out (c),a		;a06b
	ld a,097h		;a06d
	out (c),a		;a06f
	ld a,0b4h		;a071
	add a,b			;a073
	jr nz,L_A077		;a074
	inc a			;a076
L_A077:
	out (c),a		;a077
	ld a,093h		;a079
	out (c),a		;a07b
	xor a			;a07d
	ret			;a07e
L_A07F:
	ld a,b			;a07f
	rra			;a080
	ccf			;a081
	ret c			;a082
	ld a,(0ca1ch)		;a083
	and a			;a086
	jr z,L_A0B4		;a087
L_A089:
	ld c,h			;a089
	ld a,002h		;a08a
	out (c),a		;a08c
	ld a,08fh		;a08e
	out (c),a		;a090
	ld c,l			;a092
	in a,(c)		;a093
	bit 5,a		;a095
	jr z,L_A089		;a097
	ld c,h			;a099
	ld a,(0ffe7h)		;a09a
	or 002h		;a09d
	out (c),a		;a09f
	ld a,088h		;a0a1
	out (c),a		;a0a3
	ld a,03fh		;a0a5
	out (c),a		;a0a7
	ld a,082h		;a0a9
	out (c),a		;a0ab
	xor a			;a0ad
	out (c),a		;a0ae
	ld a,097h		;a0b0
	out (c),a		;a0b2
L_A0B4:
	scf			;a0b4
	ret			;a0b5
L_A0B6:
	di			;a0b6
	call 0c2a0h		;a0b7
	jr nc,L_A0C1		;a0ba
	call 0013eh		;a0bc   ; BIOS RDVDP - Reads VDP status register
	ei			;a0bf
	ret			;a0c0
L_A0C1:
	ld a,(0cac0h)		;a0c1
	and a			;a0c4
	jr nz,L_A0E5		;a0c5
	ld hl,0ca18h		;a0c7
	ld a,(hl)			;a0ca
	and a			;a0cb
	jr z,L_A0CF		;a0cc
	dec (hl)			;a0ce
L_A0CF:
	ld hl,(0cb63h)		;a0cf
	ld a,l			;a0d2
	or h			;a0d3
	jr z,L_A0DA		;a0d4
	dec hl			;a0d6
	ld (0cb63h),hl		;a0d7
L_A0DA:
	ld hl,(0caf7h)		;a0da
	ld a,h			;a0dd
	or l			;a0de
	jr z,L_A0E2		;a0df
	dec hl			;a0e1
L_A0E2:
	ld (0caf7h),hl		;a0e2
L_A0E5:
	ld hl,0ca06h		;a0e5
	ld a,(hl)			;a0e8
	and a			;a0e9
	jr nz,L_A146		;a0ea
	inc (hl)			;a0ec
	ld a,010h		;a0ed
	ld (05000h),a		;a0ef
	inc a			;a0f2
	ld (07000h),a		;a0f3
	inc a			;a0f6
	ld (09000h),a		;a0f7
	inc a			;a0fa
	ld (0b000h),a		;a0fb
	ei			;a0fe
	call 04006h		;a0ff
	di			;a102
	xor a			;a103
	ld (0ca06h),a		;a104
	di			;a107
	ld hl,0c380h		;a108
	ld a,(hl)			;a10b
	ld (05000h),a		;a10c
	inc hl			;a10f
	ld a,(hl)			;a110
	ld (07000h),a		;a111
	inc hl			;a114
	ld a,(hl)			;a115
	ld (09000h),a		;a116
	inc hl			;a119
	ld a,(hl)			;a11a
	ld (0b000h),a		;a11b
	ld hl,0ca05h		;a11e
	ld a,(hl)			;a121
	and a			;a122
	jr nz,L_A146		;a123
	inc (hl)			;a125
	ei			;a126
	ld a,03fh		;a127
	ld (0b000h),a		;a129
	ld (0c383h),a		;a12c
	call 0b800h		;a12f
	ld a,003h		;a132
	ld (0b000h),a		;a134
	ld (0c383h),a		;a137
	jr c,L_A142		;a13a
	call 08045h		;a13c
	call 0728eh		;a13f
L_A142:
	xor a			;a142
	ld (0ca05h),a		;a143
L_A146:
	call 0013eh		;a146   ; BIOS RDVDP - Reads VDP status register
	ei			;a149
	ret			;a14a
L_A14B:
	di			;a14b
	push hl			;a14c
	push de			;a14d
	push bc			;a14e
	push ix		;a14f
	push af			;a151
	ld a,010h		;a152
	ld (05000h),a		;a154
	inc a			;a157
	ld (07000h),a		;a158
	inc a			;a15b
	ld (09000h),a		;a15c
	inc a			;a15f
	ld (0b000h),a		;a160
	pop af			;a163
	push af			;a164
	call 04003h		;a165
	ld hl,0c380h		;a168
	ld a,(hl)			;a16b
	ld (05000h),a		;a16c
	inc hl			;a16f
	ld a,(hl)			;a170
	ld (07000h),a		;a171
	inc hl			;a174
	ld a,(hl)			;a175
	ld (09000h),a		;a176
	inc hl			;a179
	ld a,(hl)			;a17a
	ld (0b000h),a		;a17b
	pop af			;a17e
	pop ix		;a17f
	pop bc			;a181
	pop de			;a182
	pop hl			;a183
	ei			;a184
	ret			;a185
L_A186:
	di			;a186
	push hl			;a187
	push de			;a188
	push bc			;a189
	push af			;a18a
	ld a,010h		;a18b
	ld (05000h),a		;a18d
	inc a			;a190
	ld (07000h),a		;a191
	inc a			;a194
	ld (09000h),a		;a195
	inc a			;a198
	ld (0b000h),a		;a199
	call 04000h		;a19c
	ld hl,0c380h		;a19f
	ld a,(hl)			;a1a2
	ld (05000h),a		;a1a3
	inc hl			;a1a6
	ld a,(hl)			;a1a7
	ld (07000h),a		;a1a8
	inc hl			;a1ab
	ld a,(hl)			;a1ac
	ld (09000h),a		;a1ad
	inc hl			;a1b0
	ld a,(hl)			;a1b1
	ld (0b000h),a		;a1b2
	pop af			;a1b5
	pop bc			;a1b6
	pop de			;a1b7
	pop hl			;a1b8
	ei			;a1b9
	ret			;a1ba
L_A1BB:
	xor a			;a1bb
	ld (0ca58h),a		;a1bc
	inc a			;a1bf
	ld (0cb1ah),a		;a1c0
	ld (0cb15h),a		;a1c3
	ld (0cb1eh),a		;a1c6
	xor a			;a1c9
	call L_A3A8		;a1ca
	ld hl,00303h		;a1cd
	ld (0cb0dh),hl		;a1d0
	ld a,020h		;a1d3
	ld (0cb29h),a		;a1d5
	ld a,080h		;a1d8
	ld (0cb26h),a		;a1da
	ret			;a1dd
L_A1DE:
	call L_A20B		;a1de
	ld a,(0cb00h)		;a1e1
	cp 014h		;a1e4
	ret z			;a1e6
	cp 01bh		;a1e7
	ret nc			;a1e9
	ld a,(0cb21h)		;a1ea
	cp 002h		;a1ed
	ret z			;a1ef
	call 08bfch		;a1f0
	call 0642ch		;a1f3
	call 09aa5h		;a1f6
	call 09f7dh		;a1f9
	call 09f94h		;a1fc
	call 09ff7h		;a1ff
	call 09c02h		;a202
	call L_AE4A		;a205
	jp 09a96h		;a208
L_A20B:
	ld a,(0cb3ch)		;a20b
	or a			;a20e
	ret nz			;a20f
	ld a,(0cb00h)		;a210
	call 0424dh		;a213

; ----------------------------------------------------------------------
; DATOS tabla_A216: 29 destinos del despachador p00:424D (call en p03:A213, el
;   indice en A): A276, A302, A3BD, A549, A301, A560, A5DF, A5F5, A5FC, A61B,
;   A634, A6AE, A9A4, A9D5, A9ED, AB2B, AB3D, A931, A977, ABAF, AC48, ACAE,
;   ACD8, AD47, AD58, 8B90, ABDA, A250, A260; lo leen p03:A213 (58 bytes)
;   0xa216..0xa250  (58 bytes)
DATA_tabla_A216:
	defw 0a276h,0a302h,0a3bdh,0a549h,0a301h,0a560h,0a5dfh,0a5f5h	; a216
	defw 0a5fch,0a61bh,0a634h,0a6aeh,0a9a4h,0a9d5h,0a9edh,0ab2bh	; a226
	defw 0ab3dh,0a931h,0a977h,0abafh,0ac48h,0acaeh,0acd8h,0ad47h	; a236
	defw 0ad58h,08b90h,0abdah,0a250h,0a260h	; a246

; ======================================================================
; CODIGO 0xa250..0xa3de  (398 bytes)
; ======================================================================


L_A250:
	ld a,0e0h		;a250
	ld (0dc10h),a		;a252
	ld hl,0012ch		;a255
	ld (0cb63h),hl		;a258
	ld hl,0cb00h		;a25b
	inc (hl)			;a25e
	ret			;a25f
L_A260:
	ld a,0e0h		;a260
	ld (0dc10h),a		;a262
	ld hl,(0cb63h)		;a265
	ld a,h			;a268
	or l			;a269
	ret nz			;a26a
	xor a			;a26b
	ld hl,0cb58h		;a26c
	ld (hl),a			;a26f
	ld (0ca40h),a		;a270
	jp 06a0dh		;a273
L_A276:
	ld a,(0ca58h)		;a276
	or a			;a279
	ret nz			;a27a
	call L_A29B		;a27b
	jp c,L_A388		;a27e
	ld a,(0cb16h)		;a281
	or a			;a284
	jp nz,L_A34A		;a285
	ld a,(0ca07h)		;a288
	and 010h		;a28b
	jp nz,L_A56C		;a28d
	ld a,(0ca07h)		;a290
	and 020h		;a293
	jp nz,L_A360		;a295
	jp L_A34A		;a298
L_A29B:
	ld a,(0d820h)		;a29b
	cp 008h		;a29e
	jr nz,L_A2B0		;a2a0
	ld a,(0ca4bh)		;a2a2
	cp 005h		;a2a5
	jr nz,L_A2B0		;a2a7
	ld a,(0d821h)		;a2a9
	cp 00fh		;a2ac
	jr c,L_A2C8		;a2ae
L_A2B0:
	ld a,(0ca4ah)		;a2b0
	cp 012h		;a2b3
	jr nz,L_A2CA		;a2b5
	ld a,(0ca4bh)		;a2b7
	cp 00ch		;a2ba
	jr z,L_A2C8		;a2bc
	cp 002h		;a2be
	jr nz,L_A2CA		;a2c0
	ld a,(0d8aah)		;a2c2
	or a			;a2c5
	jr z,L_A2CA		;a2c6
L_A2C8:
	or a			;a2c8
	ret			;a2c9
L_A2CA:
	ld a,(0ca76h)		;a2ca
	cp 026h		;a2cd
	jr nz,L_A2D3		;a2cf
	or a			;a2d1
	ret			;a2d2
L_A2D3:
	ld a,(0d43bh)		;a2d3
	or a			;a2d6
	jr z,L_A2E0		;a2d7
	ld a,(0d7d9h)		;a2d9
	rla			;a2dc
	rla			;a2dd
	ccf			;a2de
	ret nc			;a2df
L_A2E0:
	ld a,(0cb3fh)		;a2e0
	or a			;a2e3
	ret nz			;a2e4
	ld a,(0cb37h)		;a2e5
	or a			;a2e8
	ret nz			;a2e9
	ld a,(0caa0h)		;a2ea
	or a			;a2ed
	ret nz			;a2ee
	ld a,(0cb4bh)		;a2ef
	or a			;a2f2
	ret nz			;a2f3
	ld a,(0ca08h)		;a2f4
	and 020h		;a2f7
	ret z			;a2f9
	ld a,(0ca07h)		;a2fa
	and 010h		;a2fd
	ret z			;a2ff
	scf			;a300
L_A301:
	ret			;a301
L_A302:
	call L_A29B		;a302
	jp c,L_A388		;a305
	ld a,(0cb16h)		;a308
	or a			;a30b
	jr nz,L_A33C		;a30c
	ld a,(0cb3fh)		;a30e
	or a			;a311
	jr z,L_A31A		;a312
	ld a,(0caaah)		;a314
	or a			;a317
	jr nz,L_A33C		;a318
L_A31A:
	ld a,(0ca08h)		;a31a
	and 010h		;a31d
	jr z,L_A33C		;a31f
	ld a,(0cb37h)		;a321
	or a			;a324
	jr z,L_A32E		;a325
	ld a,(0cb29h)		;a327
	cp 00bh		;a32a
	jr c,L_A33C		;a32c
L_A32E:
	ld a,001h		;a32e
	ld (0cb15h),a		;a330
	ld (0cb13h),a		;a333
	call 0986ah		;a336
	jp L_AE63		;a339
L_A33C:
	xor a			;a33c
	ld (0d750h),a		;a33d
	ld (0d751h),a		;a340
	ld a,(0ca07h)		;a343
	and 020h		;a346
	jr nz,L_A360		;a348
L_A34A:
	ld a,(0cb80h)		;a34a
	cp 006h		;a34d
	jr z,L_A35D		;a34f
	call 0889dh		;a351
	call 0936eh		;a354
	call 09402h		;a357
	call L_AD60		;a35a
L_A35D:
	jp L_ADA6		;a35d
L_A360:
	ld a,(0cb20h)		;a360
	cp 007h		;a363
	ret z			;a365
	ld a,(0cb0eh)		;a366
	add a,008h		;a369
	ld (0cb17h),a		;a36b
	ld a,004h		;a36e
	ld (0cb1dh),a		;a370
	ld a,003h		;a373
	call L_A3A8		;a375
	ld a,(0e220h)		;a378
	or a			;a37b
	call z,09942h		;a37c
	call L_AE14		;a37f
	call 08bc8h		;a382
	jp 08bd0h		;a385
L_A388:
	xor a			;a388
	ld (0cb2eh),a		;a389
	inc a			;a38c
	ld (0cb31h),a		;a38d
	call L_A3AF		;a390
	ld a,002h		;a393
	call L_A3A8		;a395
	ld a,004h		;a398
	ld (0cb1eh),a		;a39a
	ld a,001h		;a39d
	ld (0cb0ah),a		;a39f
	call L_AE04		;a3a2
	jp 06a3ch		;a3a5
L_A3A8:
	ld hl,0cb00h		;a3a8
	ld (hl),a			;a3ab
	inc l			;a3ac
	ld (hl),a			;a3ad
	ret			;a3ae
L_A3AF:
	ld a,001h		;a3af
	ld (0cb16h),a		;a3b1
	ld a,(0cb0eh)		;a3b4
	add a,004h		;a3b7
	ld (0cb17h),a		;a3b9
	ret			;a3bc
L_A3BD:
	ld a,(0cb4bh)		;a3bd
	or a			;a3c0
	jp nz,L_A4C5		;a3c1
	ld a,(0ca4ah)		;a3c4
	cp 012h		;a3c7
	jr nz,L_A3D0		;a3c9
	cp 00ch		;a3cb
	jp z,L_A4C5		;a3cd
L_A3D0:
	ld a,(0ca07h)		;a3d0
	and 030h		;a3d3
	jp nz,L_A4C5		;a3d5
	ld a,(0cb2eh)		;a3d8
	call 0424dh		;a3db

; ----------------------------------------------------------------------
; DATOS tabla_A3DE: 4 destinos del despachador p00:424D (call en p03:A3DB, el
;   indice en A): A3E6, A3F0, A465, A506; lo leen p03:A3DB (8 bytes)
;   0xa3de..0xa3e6  (8 bytes)
DATA_tabla_A3DE:
	defw 0a3e6h,0a3f0h,0a465h,0a506h	; a3de  -> L_A3E6 L_A3F0 L_A465 L_A506

; ======================================================================
; CODIGO 0xa3e6..0xa45a  (116 bytes)
; ======================================================================


L_A3E6:
	ld hl,0cb1eh		;a3e6
	dec (hl)			;a3e9
	ret nz			;a3ea
L_A3EB:
	ld hl,0cb2eh		;a3eb
	inc (hl)			;a3ee
	ret			;a3ef
L_A3F0:
	call 09375h		;a3f0
	call L_A3AF		;a3f3
	ld a,(0cb0eh)		;a3f6
	dec a			;a3f9
	ld hl,0a45ah		;a3fa
	call 0423eh		;a3fd
	ld a,(0ca08h)		;a400
	and (hl)			;a403
	ret z			;a404
	call 09988h		;a405
	ld a,(0cb00h)		;a408
	cp 00bh		;a40b
	jr z,L_A453		;a40d
	ld b,002h		;a40f
	call L_A45E		;a411
	ret c			;a414
	call L_A3EB		;a415
	ld b,003h		;a418
	call L_A45E		;a41a
	jr c,L_A447		;a41d
	ld b,004h		;a41f
	call L_A45E		;a421
	jr c,L_A447		;a424
	ld a,(0cb0eh)		;a426
	cp 003h		;a429
	jr nc,L_A43B		;a42b
	ld b,005h		;a42d
	call L_A45E		;a42f
	jr c,L_A447		;a432
	ld b,006h		;a434
	call L_A45E		;a436
	jr c,L_A447		;a439
L_A43B:
	call L_A453		;a43b
	ld b,007h		;a43e
	call 07eeeh		;a440
	ret nc			;a443
	jp L_A49B		;a444
L_A447:
	call L_A3EB		;a447
	call 09353h		;a44a
	ld a,003h		;a44d
	ld (0cb18h),a		;a44f
	ret			;a452
L_A453:
	xor a			;a453
	ld (0cb16h),a		;a454
	jp 0986ah		;a457

; ----------------------------------------------------------------------
; DATOS resto_A45A: lo apuntan con el banco puesto p03:A3FA (0xA45A); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p03:A3FA (4 bytes)
;   0xa45a..0xa45e  (4 bytes)
DATA_resto_A45A:
	defb 001h,002h,004h,008h	; a45a

; ======================================================================
; CODIGO 0xa45e..0xa4bd  (95 bytes)
; ======================================================================


L_A45E:
	call 07eeeh		;a45e
	ret c			;a461
	jp 08bb0h		;a462
L_A465:
	call 0936eh		;a465
	ld a,(0cb0eh)		;a468
	ld hl,0cb0dh		;a46b
	cp (hl)			;a46e
	jr nz,L_A487		;a46f
	call 09402h		;a471
	call L_A53A		;a474
	call 09988h		;a477
	ld a,(0ca41h)		;a47a
	or a			;a47d
	ret nz			;a47e
	ld hl,0cb30h		;a47f
	ld a,(hl)			;a482
	or a			;a483
	ret z			;a484
	ld (hl),000h		;a485
L_A487:
	ld hl,0cb2eh		;a487
	ld (hl),000h		;a48a
	ld a,(0cb00h)		;a48c
	cp 00bh		;a48f
	ret z			;a491
	call L_A3AF		;a492
	ld a,004h		;a495
	ld (0cb1eh),a		;a497
	ret			;a49a
L_A49B:
	ld hl,0a4bdh		;a49b
	call 09353h		;a49e
	ld a,(0cb0eh)		;a4a1
	dec a			;a4a4
	add a,a			;a4a5
	call 0423eh		;a4a6
	ld a,(0cb03h)		;a4a9
	add a,(hl)			;a4ac
	and 0fch		;a4ad
	ld (0cb03h),a		;a4af
	inc hl			;a4b2
	ld a,(0cb05h)		;a4b3
	add a,(hl)			;a4b6
	and 0fch		;a4b7
	ld (0cb05h),a		;a4b9
	ret			;a4bc

; ----------------------------------------------------------------------
; DATOS resto_A4BD: lo apuntan con el banco puesto p03:A49B (0xA4BD); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p03:A49B (8 bytes)
;   0xa4bd..0xa4c5  (8 bytes)
DATA_resto_A4BD:
	defb 000h,000h,010h,000h,000h,0f8h,000h,008h	; a4bd  ........

; ======================================================================
; CODIGO 0xa4c5..0xa775  (688 bytes)
; ======================================================================


L_A4C5:
	ld a,(0ca9bh)		;a4c5
	or a			;a4c8
	jr nz,L_A4E7		;a4c9
	ld a,(0ca8dh)		;a4cb
	or a			;a4ce
	jr nz,L_A4D6		;a4cf
	ld a,(0cb29h)		;a4d1
	or a			;a4d4
	ret z			;a4d5
L_A4D6:
	ld a,(0ca64h)		;a4d6
	or a			;a4d9
	ret nz			;a4da
	ld a,(0ca76h)		;a4db
	cp 039h		;a4de
	jr nz,L_A4E7		;a4e0
	ld a,(0ca4bh)		;a4e2
	or a			;a4e5
	ret nz			;a4e6
L_A4E7:
	xor a			;a4e7
	ld (0cb31h),a		;a4e8
	call L_A3AF		;a4eb
	ld a,004h		;a4ee
	ld (0cb1eh),a		;a4f0
	ld a,005h		;a4f3
	ld (0cb00h),a		;a4f5
	dec a			;a4f8
	ld (0cb01h),a		;a4f9
	xor a			;a4fc
	ld (0cb28h),a		;a4fd
	ld a,020h		;a500
	ld (0cb29h),a		;a502
	ret			;a505
L_A506:
	call 09375h		;a506
	ld a,(0cb0eh)		;a509
	ld hl,0cb0dh		;a50c
	cp (hl)			;a50f
	jr z,L_A518		;a510
	ld hl,0cb2eh		;a512
	ld (hl),001h		;a515
	ret			;a517
L_A518:
	call 09448h		;a518
	call L_A53A		;a51b
	ld b,002h		;a51e
	call L_A45E		;a520
	ret nc			;a523
	ld a,(0cb0eh)		;a524
	cp 003h		;a527
	jr nc,L_A537		;a529
	ld a,(0cb03h)		;a52b
	sub 002h		;a52e
	and 0f8h		;a530
	add a,007h		;a532
	ld (0cb03h),a		;a534
L_A537:
	jp L_A487		;a537
L_A53A:
	ld a,(0ca65h)		;a53a
	or a			;a53d
	ret z			;a53e
	ld b,0b0h		;a53f
	ld hl,0cb03h		;a541
	ld a,(hl)			;a544
	cp b			;a545
	ret c			;a546
	ld (hl),b			;a547
	ret			;a548
L_A549:
	ld hl,0cb1dh		;a549
	dec (hl)			;a54c
	ret nz			;a54d
	ld a,(0cb75h)		;a54e
	cp 002h		;a551
	jr nz,L_A55A		;a553
	ld a,001h		;a555
	ld (0cb76h),a		;a557
L_A55A:
	call 079b4h		;a55a
	jp 098bfh		;a55d
L_A560:
	ld hl,0cb1eh		;a560
	dec (hl)			;a563
	ret nz			;a564
	xor a			;a565
	ld (0cb16h),a		;a566
	jp 098bfh		;a569
L_A56C:
	ld a,(0e040h)		;a56c
	or a			;a56f
	ret nz			;a570
	ld a,(0cb3ch)		;a571
	or a			;a574
	ret nz			;a575
	call L_AE63		;a576
	ld a,(0d752h)		;a579
	or a			;a57c
	ret z			;a57d
	ld a,(0cb20h)		;a57e
	cp 007h		;a581
	jr z,L_A5CE		;a583
	cp 008h		;a585
	jr z,L_A5CE		;a587
	cp 00bh		;a589
	jr z,L_A5CE		;a58b
	cp 009h		;a58d
	jr z,L_A5CE		;a58f
	cp 00ch		;a591
	jr z,L_A5BD		;a593
	ld a,(0cb80h)		;a595
	cp 003h		;a598
	jr z,L_A5AD		;a59a
	cp 007h		;a59c
	jr z,L_A5AD		;a59e
	ld a,(0cb60h)		;a5a0
	or a			;a5a3
	jr nz,L_A5CE		;a5a4
	ld a,(0cb61h)		;a5a6
	or a			;a5a9
	jr nz,L_A5CE		;a5aa
	ret			;a5ac
L_A5AD:
	ld a,008h		;a5ad
	call L_A3A8		;a5af
	ld a,001h		;a5b2
	ld (0cb17h),a		;a5b4
	ld a,004h		;a5b7
	ld (0cb25h),a		;a5b9
	ret			;a5bc
L_A5BD:
	ld a,(0cb0eh)		;a5bd
	add a,008h		;a5c0
	ld (0cb17h),a		;a5c2
	ld hl,0cb00h		;a5c5
	ld (hl),018h		;a5c8
	inc l			;a5ca
	ld (hl),003h		;a5cb
	ret			;a5cd
L_A5CE:
	call L_A3AF		;a5ce
	ld a,004h		;a5d1
	ld (0cb1eh),a		;a5d3
	ld (0cb01h),a		;a5d6
	ld a,006h		;a5d9
	ld (0cb00h),a		;a5db
	ret			;a5de
L_A5DF:
	ld hl,0cb1eh		;a5df
	dec (hl)			;a5e2
	ret nz			;a5e3
	xor a			;a5e4
	ld hl,00000h		;a5e5
	ld (0cb00h),hl		;a5e8
	ld (0cb16h),a		;a5eb
	ld hl,0cb60h		;a5ee
	ld (hl),a			;a5f1
	inc hl			;a5f2
	ld (hl),a			;a5f3
	ret			;a5f4
L_A5F5:
	xor a			;a5f5
	ld (0cb16h),a		;a5f6
	jp L_AE63		;a5f9
L_A5FC:
	ld hl,0cb25h		;a5fc
	ld a,(hl)			;a5ff
	or a			;a600
	jr z,L_A613		;a601
	dec (hl)			;a603
	cp 002h		;a604
	ret nz			;a606
	ld hl,0cb81h		;a607
	inc (hl)			;a60a
	ld a,002h		;a60b
	ld (0cb17h),a		;a60d
	jp 06a29h		;a610
L_A613:
	xor a			;a613
	ld (0cb01h),a		;a614
	ld (0cb00h),a		;a617
	ret			;a61a
L_A61B:
	call L_A68B		;a61b
	call L_A34A		;a61e
	ld hl,0cabch		;a621
	ld a,(0cb0fh)		;a624
	or a			;a627
	jr z,L_A631		;a628
	ld a,(hl)			;a62a
	or a			;a62b
	ret nz			;a62c
	inc (hl)			;a62d
	jp 06ac6h		;a62e
L_A631:
	ld (hl),000h		;a631
	ret			;a633
L_A634:
	call L_A68B		;a634
	call L_A34A		;a637
	ld a,(0ca5fh)		;a63a
	or a			;a63d
	ret nz			;a63e
	call L_A66C		;a63f
	ret c			;a642
	ld hl,0caf0h		;a643
	ld a,(hl)			;a646
	or a			;a647
	jr z,L_A64E		;a648
	ld (hl),000h		;a64a
	jr L_A65B		;a64c
L_A64E:
	ld a,(0ca4ah)		;a64e
	cp 00ah		;a651
	jr nz,L_A65B		;a653
	ld a,(0ca4bh)		;a655
	cp 009h		;a658
	ret z			;a65a
L_A65B:
	call 09da8h		;a65b
	ret nc			;a65e
	ld hl,0cb04h		;a65f
	ld (hl),000h		;a662
	inc hl			;a664
	ld (hl),a			;a665
	ld a,016h		;a666
	ld (0cb00h),a		;a668
	ret			;a66b
L_A66C:
	ld a,(0ca4ah)		;a66c
	cp 009h		;a66f
	jr nz,L_A67C		;a671
	ld a,(0d7dch)		;a673
	bit 1,a		;a676
	jr z,L_A689		;a678
	scf			;a67a
	ret			;a67b
L_A67C:
	cp 00bh		;a67c
	jr nz,L_A689		;a67e
	ld a,(0d7d6h)		;a680
	bit 2,a		;a683
	jr nz,L_A689		;a685
	scf			;a687
	ret			;a688
L_A689:
	and a			;a689
	ret			;a68a
L_A68B:
	ld a,(0ca4ah)		;a68b
	cp 00ah		;a68e
	ret nz			;a690
	ld a,(0ca4bh)		;a691
	cp 00bh		;a694
	jr z,L_A6A3		;a696
	cp 00ch		;a698
	jr z,L_A6A3		;a69a
	cp 010h		;a69c
	jr z,L_A6A3		;a69e
	cp 011h		;a6a0
	ret nz			;a6a2
L_A6A3:
	ld a,(0cb35h)		;a6a3
	call L_A3A8		;a6a6
	xor a			;a6a9
	ld (0cb0ah),a		;a6aa
	ret			;a6ad
L_A6AE:
	xor a			;a6ae
	ld (0cb16h),a		;a6af
	ld a,(0ca41h)		;a6b2
	or a			;a6b5
	jr z,L_A6BD		;a6b6
	ld a,001h		;a6b8
	ld (0cb50h),a		;a6ba
L_A6BD:
	ld a,(0cb50h)		;a6bd
	or a			;a6c0
	jr z,L_A6CF		;a6c1
	ld a,(0cb32h)		;a6c3
	or a			;a6c6
	jr z,L_A6CF		;a6c7
	call 09364h		;a6c9
	jp L_A7E0		;a6cc
L_A6CF:
	ld a,(0cb0eh)		;a6cf
	dec a			;a6d2
	ld b,01ch		;a6d3
	jr z,L_A6D8		;a6d5
	inc b			;a6d7
L_A6D8:
	ld a,(0cb29h)		;a6d8
	cp b			;a6db
	jr c,L_A6FF		;a6dc
	ld a,(0ca08h)		;a6de
	and 030h		;a6e1
	jr z,L_A6FF		;a6e3
	ld a,(0cb0eh)		;a6e5
	dec a			;a6e8
	jr nz,L_A6F9		;a6e9
	ld a,(0cb29h)		;a6eb
	cp 01fh		;a6ee
	jr nc,L_A6F9		;a6f0
	ld hl,0cb03h		;a6f2
	ld a,(hl)			;a6f5
	sub 003h		;a6f6
	ld (hl),a			;a6f8
L_A6F9:
	call L_A881		;a6f9
	jp L_A4E7		;a6fc
L_A6FF:
	call 0936eh		;a6ff
	call 09402h		;a702
	call L_A713		;a705
	call L_A97E		;a708
	call L_A82F		;a70b
	call L_A8A4		;a70e
	jr L_A72A		;a711
L_A713:
	call L_A746		;a713
	ld a,(0ca41h)		;a716
	or a			;a719
	jp nz,L_A7B8		;a71a
	call L_A76F		;a71d
	ret c			;a720
	ld a,(0cb00h)		;a721
	cp 00bh		;a724
	ret nz			;a726
	jp L_A7E9		;a727
L_A72A:
	ld a,(0ca08h)		;a72a
	and 003h		;a72d
	ret nz			;a72f
	ld a,(0ca08h)		;a730
	and 00ch		;a733
	ret z			;a735
	ld hl,0cb28h		;a736
	ld a,(hl)			;a739
	or a			;a73a
	jp z,L_A7CD		;a73b
	inc l			;a73e
	ld a,(hl)			;a73f
	cp 01ch		;a740
	ret c			;a742
	jp L_A7CD		;a743
L_A746:
	ld b,009h		;a746
	ld a,(0ca4ah)		;a748
	or a			;a74b
	jr z,L_A753		;a74c
	ld b,000h		;a74e
	cp 009h		;a750
	ret nz			;a752
L_A753:
	ld a,(0ca4bh)		;a753
	cp b			;a756
	ret nz			;a757
	ld a,(0cb0eh)		;a758
	dec a			;a75b
	ret nz			;a75c
	ld a,(0cb03h)		;a75d
	cp 03ch		;a760
	ret nc			;a762
	ld a,001h		;a763
	ld (0ca41h),a		;a765
	ld hl,0bf00h		;a768
	ld (0cb02h),hl		;a76b
	ret			;a76e
L_A76F:
	ld a,(0cb2fh)		;a76f
	call 0424dh		;a772

; ----------------------------------------------------------------------
; DATOS tabla_A775: 2 destinos del despachador p00:424D (call en p03:A772, el
;   indice en A): A779, A787; lo leen p03:A772 (4 bytes)
;   0xa775..0xa779  (4 bytes)
DATA_tabla_A775:
	defw 0a779h,0a787h	; a775  -> L_A779 L_A787

; ======================================================================
; CODIGO 0xa779..0xac53  (1242 bytes)
; ======================================================================


L_A779:
	ld hl,(0cb2ah)		;a779
	ld a,(0cb03h)		;a77c
	cp l			;a77f
	jr c,L_A7B8		;a780
	cp h			;a782
	jr nc,L_A7AE		;a783
	and a			;a785
	ret			;a786
L_A787:
	ld hl,(0cb2ah)		;a787
	ld a,(0cb03h)		;a78a
	sub 01ah		;a78d
	jr nz,L_A792		;a78f
	xor a			;a791
L_A792:
	cp l			;a792
	jr c,L_A79D		;a793
	ld a,(0cb03h)		;a795
	cp h			;a798
	jr nc,L_A7AE		;a799
	and a			;a79b
	ret			;a79c
L_A79D:
	ld a,l			;a79d
	add a,01ah		;a79e
	ld h,a			;a7a0
	ld l,000h		;a7a1
	ld (0cb02h),hl		;a7a3
	ld bc,00200h		;a7a6
	call 09367h		;a7a9
	scf			;a7ac
	ret			;a7ad
L_A7AE:
	sub h			;a7ae
	cp 008h		;a7af
	jr nc,L_A7B8		;a7b1
	call 09364h		;a7b3
	scf			;a7b6
	ret			;a7b7
L_A7B8:
	call L_A7E0		;a7b8
	ld a,(0ca4ah)		;a7bb
	or a			;a7be
	ret nz			;a7bf
	ld a,(0ca4bh)		;a7c0
	cp 006h		;a7c3
	ret nz			;a7c5
	ld hl,0d7d0h		;a7c6
	res 5,(hl)		;a7c9
	scf			;a7cb
	ret			;a7cc
L_A7CD:
	call 09364h		;a7cd
	call L_A7E0		;a7d0
	ld a,(0cb0eh)		;a7d3
	dec a			;a7d6
	ret nz			;a7d7
	ld hl,0cb03h		;a7d8
	ld a,(hl)			;a7db
	sub 004h		;a7dc
	ld (hl),a			;a7de
	ret			;a7df
L_A7E0:
	ld a,002h		;a7e0
	call L_A3A8		;a7e2
	ld (0cb2eh),a		;a7e5
	ret			;a7e8
L_A7E9:
	ld hl,(0cb2ah)		;a7e9
	ld a,(0cb03h)		;a7ec
	sub 020h		;a7ef
	jr nc,L_A7F4		;a7f1
	xor a			;a7f3
L_A7F4:
	sub l			;a7f4
	jr nc,L_A80F		;a7f5
	neg		;a7f7
	cp 020h		;a7f9
	jr c,L_A802		;a7fb
	ld bc,00020h		;a7fd
	jr L_A82C		;a800
L_A802:
	ld c,a			;a802
	ld a,(0cb2fh)		;a803
	dec a			;a806
	jr nz,L_A80B		;a807
	ld c,000h		;a809
L_A80B:
	ld b,002h		;a80b
	jr L_A82C		;a80d
L_A80F:
	ld a,h			;a80f
	sub 020h		;a810
	ld b,a			;a812
	ld a,(0cb03h)		;a813
	sub b			;a816
	jr c,L_A829		;a817
	jr z,L_A829		;a819
	cp 020h		;a81b
	jr c,L_A824		;a81d
	ld bc,00020h		;a81f
	jr L_A82C		;a822
L_A824:
	ld c,a			;a824
	ld b,001h		;a825
	jr L_A82C		;a827
L_A829:
	ld bc,00100h		;a829
L_A82C:
	jp 09367h		;a82c
L_A82F:
	call L_A88A		;a82f
	ret c			;a832
	ld a,(0ca41h)		;a833
	or a			;a836
	ret nz			;a837
	ld a,(0cb28h)		;a838
	or a			;a83b
	jr z,L_A857		;a83c
	dec a			;a83e
	ld a,(0cb0eh)		;a83f
	jr nz,L_A84F		;a842
	cp 002h		;a844
	ret nz			;a846
	ld a,(0cb29h)		;a847
	cp 00fh		;a84a
	ret c			;a84c
	jr L_A857		;a84d
L_A84F:
	dec a			;a84f
	ret nz			;a850
	ld a,(0cb29h)		;a851
	cp 010h		;a854
	ret c			;a856
L_A857:
	ld b,001h		;a857
	call 07eeeh		;a859
	ret nc			;a85c
	call 09804h		;a85d
	ld a,(0cb0eh)		;a860
	cp 001h		;a863
	jr nz,L_A86F		;a865
	ld a,(0cb03h)		;a867
	sub 010h		;a86a
	ld (0cb03h),a		;a86c
L_A86F:
	ld a,001h		;a86f
	ld (0cb0fh),a		;a871
	inc a			;a874
	ld (0cb00h),a		;a875
	ld (0cb2eh),a		;a878
	call L_A881		;a87b
	jp L_A487		;a87e
L_A881:
	call 09364h		;a881
	xor a			;a884
	inc hl			;a885
	ld (hl),a			;a886
	inc hl			;a887
	ld (hl),a			;a888
	ret			;a889
L_A88A:
	ld a,(0ca4ah)		;a88a
	or a			;a88d
	jr nz,L_A899		;a88e
	ld a,(0ca4bh)		;a890
	cp 007h		;a893
	jr z,L_A8A2		;a895
L_A897:
	and a			;a897
	ret			;a898
L_A899:
	cp 009h		;a899
	jr nz,L_A897		;a89b
	ld a,(0ca4bh)		;a89d
	or a			;a8a0
	ret nz			;a8a1
L_A8A2:
	scf			;a8a2
	ret			;a8a3
L_A8A4:
	ld a,(0ca4ah)		;a8a4
	cp 001h		;a8a7
	jr z,L_A8B2		;a8a9
	cp 003h		;a8ab
	jr z,L_A8B2		;a8ad
	cp 004h		;a8af
	ret nz			;a8b1
L_A8B2:
	ld a,(0ca50h)		;a8b2
	cp 005h		;a8b5
	ret nz			;a8b7
	ld a,(0ca51h)		;a8b8
	cp 008h		;a8bb
	ret nz			;a8bd
	ld a,(0cb03h)		;a8be
	cp 038h		;a8c1
	ret nc			;a8c3
	ld a,(0cb0eh)		;a8c4
	cp 001h		;a8c7
	ret nz			;a8c9
	ld a,(0ca4ah)		;a8ca
	cp 002h		;a8cd
	ld a,001h		;a8cf
	jr c,L_A8D5		;a8d1
	ld a,002h		;a8d3
L_A8D5:
	ld (0cb5ah),a		;a8d5
L_A8D8:
	ld hl,0cb0dh		;a8d8
	ld a,002h		;a8db
	ld (hl),a			;a8dd
	inc l			;a8de
	ld (hl),a			;a8df
	xor a			;a8e0
	ld (0e230h),a		;a8e1
	ld hl,0ce00h		;a8e4
	ld bc,005ffh		;a8e7
	call 04236h		;a8ea
	call 059efh		;a8ed
	call 04d2bh		;a8f0
	ld a,(0ca42h)		;a8f3
	call 04452h		;a8f6
	call 08511h		;a8f9
	call 08281h		;a8fc
	ld hl,0ca4ch		;a8ff
	ld (hl),000h		;a902
	inc hl			;a904
	ld (hl),001h		;a905
	ld hl,08050h		;a907
	ld de,08eb4h		;a90a
	call 055b1h		;a90d
	call 09364h		;a910
	ld hl,0cb02h		;a913
	xor a			;a916
	ld (hl),a			;a917
	inc hl			;a918
	ld (hl),020h		;a919
	inc hl			;a91b
	ld (hl),a			;a91c
	inc hl			;a91d
	ld (hl),064h		;a91e
	ld hl,0cb00h		;a920
	ld (hl),011h		;a923
	inc hl			;a925
	ld (hl),002h		;a926
	call 07cbbh		;a928
	call 06b12h		;a92b
	jp 06ae2h		;a92e
L_A931:
	ld a,002h		;a931
	ld (0cb01h),a		;a933
	ld hl,0cb03h		;a936
	ld a,(hl)			;a939
	add a,004h		;a93a
	ld (hl),a			;a93c
	cp 0beh		;a93d
	ret c			;a93f
	ld a,(0cb5ah)		;a940
	dec a			;a943
	jr z,L_A94C		;a944
	ld (0cb5ah),a		;a946
	ld (hl),020h		;a949
	ret			;a94b
L_A94C:
	ld (hl),050h		;a94c
	inc hl			;a94e
	inc hl			;a94f
	ld (hl),090h		;a950
	ld hl,0cb00h		;a952
	inc (hl)			;a955
	inc hl			;a956
	ld (hl),000h		;a957
	ld a,(0ca4ah)		;a959
	cp 013h		;a95c
	jr z,L_A972		;a95e
	ld a,005h		;a960
	ld (0ca50h),a		;a962
	ld a,008h		;a965
	ld (0ca51h),a		;a967
	ld a,006h		;a96a
	call 059a7h		;a96c
	jp 06a3ch		;a96f
L_A972:
	ld a,012h		;a972
	jp 059a7h		;a974
L_A977:
	xor a			;a977
	ld (0cb31h),a		;a978
	jp 098b8h		;a97b
L_A97E:
	ld a,(0ca4ah)		;a97e
	or a			;a981
	ret nz			;a982
	ld a,(0ca4bh)		;a983
	cp 007h		;a986
	ret nz			;a988
	ld a,(0cb03h)		;a989
	cp 01ah		;a98c
	ret c			;a98e
	ld a,(0cb0eh)		;a98f
	cp 002h		;a992
	ret nz			;a994
	ld a,00ch		;a995
	ld (0cb00h),a		;a997
	xor a			;a99a
	ld (0cb01h),a		;a99b
	ld (0cb02h),a		;a99e
	jp 09364h		;a9a1
L_A9A4:
	ld a,001h		;a9a4
	ld (0cb14h),a		;a9a6
	ld a,(0cb03h)		;a9a9
	add a,006h		;a9ac
	ld (0cb03h),a		;a9ae
	cp 04ch		;a9b1
	ret c			;a9b3
	ld a,04ch		;a9b4
	ld (0cb03h),a		;a9b6
	ld a,00dh		;a9b9
	ld (0cb00h),a		;a9bb
	ld a,001h		;a9be
	ld (0cb16h),a		;a9c0
	ld a,006h		;a9c3
	ld (0cb17h),a		;a9c5
	ld a,004h		;a9c8
	ld (0cb01h),a		;a9ca
	ld a,008h		;a9cd
	ld (0cb2ch),a		;a9cf
	jp 06a3ch		;a9d2
L_A9D5:
	ld hl,0cb2ch		;a9d5
	dec (hl)			;a9d8
	ret nz			;a9d9
	xor a			;a9da
	ld (0cb16h),a		;a9db
	ld (0cb17h),a		;a9de
	ld (0cb31h),a		;a9e1
	ld (0cb0ah),a		;a9e4
	ld a,(0cb35h)		;a9e7
	jp L_A3A8		;a9ea
L_A9ED:
	ld hl,0cb53h		;a9ed
	ld a,(hl)			;a9f0
	or a			;a9f1
	jr z,L_A9F9		;a9f2
	dec (hl)			;a9f4
	jp z,L_AACF		;a9f5
	ret			;a9f8
L_A9F9:
	ld hl,0e256h		;a9f9
	ld a,(0ca08h)		;a9fc
	and 00fh		;a9ff
	ret z			;aa01
	ld b,a			;aa02
	call L_AA76		;aa03
	ret c			;aa06
	ld a,(hl)			;aa07
	or a			;aa08
	ret nz			;aa09
	ld a,030h		;aa0a
	ld (0cb53h),a		;aa0c
	ld a,b			;aa0f
	ld e,001h		;aa10
	ld bc,00001h		;aa12
	rra			;aa15
	jr c,L_AA28		;aa16
	inc e			;aa18
	ld c,0ffh		;aa19
	rra			;aa1b
	jr c,L_AA28		;aa1c
	inc e			;aa1e
	ld bc,0ff00h		;aa1f
	rra			;aa22
	jr c,L_AA28		;aa23
	inc e			;aa25
	ld b,001h		;aa26
L_AA28:
	ld a,(hl)			;aa28
	cp e			;aa29
	ret z			;aa2a
	ld a,e			;aa2b
	push de			;aa2c
	push bc			;aa2d
	call 07da9h		;aa2e
	pop bc			;aa31
	pop de			;aa32
	jp z,06c77h		;aa33
	cp 081h		;aa36
	jp nc,06c77h		;aa38
	push af			;aa3b
	ld a,001h		;aa3c
	ld (0cb62h),a		;aa3e
	pop af			;aa41
	ld hl,0e256h		;aa42
	ld (hl),e			;aa45
	call L_AB20		;aa46
	push bc			;aa49
	ld a,00dh		;aa4a
	ld (0cb01h),a		;aa4c
	call 04266h		;aa4f
	call 045d7h		;aa52
	call 045f1h		;aa55
	call L_AB10		;aa58
	pop bc			;aa5b
	call 057f2h		;aa5c
	ld a,(0ca4bh)		;aa5f
	push af			;aa62
	call 07bf1h		;aa63
	call 07de2h		;aa66
	pop af			;aa69
	ld (0ca4bh),a		;aa6a
	call L_AA8E		;aa6d
	call 04606h		;aa70
	jp 06afah		;aa73
L_AA76:
	and 001h		;aa76
	ret z			;aa78
	ld a,(0ca4ah)		;aa79
	or a			;aa7c
	jr z,L_AA85		;aa7d
	cp 009h		;aa7f
	jr z,L_AA8C		;aa81
	or a			;aa83
	ret			;aa84
L_AA85:
	ld a,(0ca4bh)		;aa85
	cp 007h		;aa88
	ccf			;aa8a
	ret			;aa8b
L_AA8C:
	scf			;aa8c
	ret			;aa8d
L_AA8E:
	ld hl,0105fh		;aa8e
	call L_AAC3		;aa91
	ld hl,0985fh		;aa94
	call L_AAC3		;aa97
	ld hl,02830h		;aa9a
	call L_AAC3		;aa9d
	ld hl,08030h		;aaa0
	call L_AAC3		;aaa3
	ld hl,0288eh		;aaa6
	call L_AAC3		;aaa9
	ld hl,0808eh		;aaac
	call L_AAC3		;aaaf
	ld hl,02630h		;aab2
	ld bc,00260h		;aab5
	call L_AAC6		;aab8
	ld hl,09830h		;aabb
	ld bc,00260h		;aabe
	jr L_AAC6		;aac1
L_AAC3:
	ld bc,01802h		;aac3
L_AAC6:
	ld a,(0ca42h)		;aac6
	ld d,a			;aac9
	ld a,077h		;aaca
	jp 046ffh		;aacc
L_AACF:
	ld hl,0e256h		;aacf
	ld a,(hl)			;aad2
	or a			;aad3
	ret z			;aad4
	xor a			;aad5
	ld (hl),a			;aad6
	ld (0cb62h),a		;aad7
	ld hl,(0ca70h)		;aada
	ld (0ca50h),hl		;aadd
	call 045f1h		;aae0
	call 04266h		;aae3
	call 045d7h		;aae6
	call L_AB10		;aae9
	call 057e9h		;aaec
	call L_B4E0		;aaef
	call L_B5B5		;aaf2
	ld a,(0cb35h)		;aaf5
	or a			;aaf8
	ld b,000h		;aaf9
	jr z,L_AAFE		;aafb
	inc b			;aafd
L_AAFE:
	ld a,b			;aafe
	ld (0cb01h),a		;aaff
	ld a,030h		;ab02
	ld (0cb53h),a		;ab04
	call 07de2h		;ab07
	call 04650h		;ab0a
	jp 04606h		;ab0d
L_AB10:
	ld a,(0ca76h)		;ab10
	cp 026h		;ab13
	ret nz			;ab15
	call 06f78h		;ab16
	ld a,(0cb21h)		;ab19
	dec a			;ab1c
	jp z,08587h		;ab1d
L_AB20:
	ld a,(0ca70h)		;ab20
	add a,c			;ab23
	ld c,a			;ab24
	ld a,(0ca71h)		;ab25
	add a,b			;ab28
	ld b,a			;ab29
	ret			;ab2a
L_AB2B:
	call 09430h		;ab2b
	ld a,(0cb03h)		;ab2e
	ld h,078h		;ab31
	cp h			;ab33
	ret c			;ab34
	ld l,000h		;ab35
	ld (0cb02h),hl		;ab37
	jp 098bfh		;ab3a
L_AB3D:
	ld a,(0cb21h)		;ab3d
	cp 00ah		;ab40
	jr z,L_AB49		;ab42
	cp 00bh		;ab44
	call nz,L_AB9B		;ab46
L_AB49:
	call L_AB4F		;ab49
	jp L_AB65		;ab4c
L_AB4F:
	ld hl,0cb03h		;ab4f
	inc (hl)			;ab52
	inc (hl)			;ab53
	ld hl,0cb05h		;ab54
	dec (hl)			;ab57
	dec (hl)			;ab58
	ld a,(hl)			;ab59
	cp 010h		;ab5a
	ret nc			;ab5c
	ld hl,0cb00h		;ab5d
	ld (hl),01bh		;ab60
	jp 06ba0h		;ab62
L_AB65:
	ld a,(0cb03h)		;ab65
	cp 0d6h		;ab68
	jr nc,L_AB95		;ab6a
	sub 0b7h		;ab6c
	ret c			;ab6e
	cp 020h		;ab6f
	jr c,L_AB74		;ab71
	xor a			;ab73
L_AB74:
	ld b,a			;ab74
	ld a,020h		;ab75
	sub b			;ab77
	ld c,a			;ab78
	call L_AB81		;ab79
	ld b,002h		;ab7c
	jp 09367h		;ab7e
L_AB81:
	ld a,(0cb21h)		;ab81
	cp 00ah		;ab84
	jr z,L_AB90		;ab86
	cp 00bh		;ab88
	ret nz			;ab8a
	ld a,c			;ab8b
	sub 010h		;ab8c
	ld c,a			;ab8e
	ret			;ab8f
L_AB90:
	ld a,c			;ab90
	sub 008h		;ab91
	ld c,a			;ab93
	ret			;ab94
L_AB95:
	ld bc,00200h		;ab95
	jp 09367h		;ab98
L_AB9B:
	ld b,003h		;ab9b
L_AB9D:
	ld a,(0ca03h)		;ab9d
	and b			;aba0
	ret nz			;aba1
	ld hl,0cb0eh		;aba2
	ld a,(hl)			;aba5
	inc a			;aba6
	cp 005h		;aba7
	jr c,L_ABAD		;aba9
	ld a,001h		;abab
L_ABAD:
	ld (hl),a			;abad
	ret			;abae
L_ABAF:
	call 06c6bh		;abaf
	call L_AB9B		;abb2
	ld a,(0cb29h)		;abb5
	or a			;abb8
	jr z,L_ABCC		;abb9
	ld a,(0ca03h)		;abbb
	rra			;abbe
	ret c			;abbf
	ld hl,0cb28h		;abc0
	ld (hl),002h		;abc3
	inc hl			;abc5
	dec (hl)			;abc6
	ld hl,0cb03h		;abc7
	inc (hl)			;abca
	ret			;abcb
L_ABCC:
	ld hl,001e4h		;abcc
L_ABCF:
	ld (0cb63h),hl		;abcf
	ld hl,0cb00h		;abd2
	ld (hl),01ch		;abd5
	jp 06ba0h		;abd7
L_ABDA:
	ld a,(0cb29h)		;abda
	or a			;abdd
	jr z,L_ABF3		;abde
	ld hl,0cb28h		;abe0
	ld (hl),002h		;abe3
	inc hl			;abe5
	ld a,(hl)			;abe6
	sub 002h		;abe7
	jr nc,L_ABEC		;abe9
	xor a			;abeb
L_ABEC:
	ld (hl),a			;abec
	ld hl,0cb03h		;abed
	inc (hl)			;abf0
	inc (hl)			;abf1
	ret			;abf2
L_ABF3:
	ld a,(0ca4ah)		;abf3
	cp 011h		;abf6
	ld hl,00108h		;abf8
	jr nz,L_ABCF		;abfb
	ld hl,0018ch		;abfd
	jr L_ABCF		;ac00
L_AC02:
	ld a,(0cb00h)		;ac02
	cp 014h		;ac05
	ret z			;ac07
	ld a,0e0h		;ac08
	ld (0dc10h),a		;ac0a
	ld hl,0cb40h		;ac0d
	ld (hl),040h		;ac10
	inc hl			;ac12
	xor a			;ac13
	ld (hl),a			;ac14
	ld (0cb28h),a		;ac15
	ld (0cb01h),a		;ac18
	ld (0cb16h),a		;ac1b
	ld a,014h		;ac1e
	ld (0cb00h),a		;ac20
	ld a,002h		;ac23
	ld (0cb0eh),a		;ac25
	ld a,020h		;ac28
	ld (0cb29h),a		;ac2a
	ld a,(0dfd8h)		;ac2d
	or a			;ac30
	jr z,L_AC42		;ac31
	xor a			;ac33
	ld (0dfd8h),a		;ac34
	ld hl,0dc58h		;ac37
	ld bc,0000fh		;ac3a
	ld a,0e0h		;ac3d
	call 04237h		;ac3f
L_AC42:
	call 06f78h		;ac42
	jp 06ba0h		;ac45
L_AC48:
	ld a,0e0h		;ac48
	ld (0dc10h),a		;ac4a
	ld a,(0cb41h)		;ac4d
	call 0424dh		;ac50

; ----------------------------------------------------------------------
; DATOS tabla_AC53: 3 destinos del despachador p00:424D (call en p03:AC50, el
;   indice en A): AC59, AC7E, AC9D; lo leen p03:AC50 (6 bytes)
;   0xac53..0xac59  (6 bytes)
DATA_tabla_AC53:
	defw 0ac59h,0ac7eh,0ac9dh	; ac53  -> L_AC59 L_AC7E L_AC9D

; ======================================================================
; CODIGO 0xac59..0xad96  (317 bytes)
; ======================================================================


L_AC59:
	ld b,00fh		;ac59
	call L_AB9D		;ac5b
	ld hl,0cb40h		;ac5e
	dec (hl)			;ac61
	ret nz			;ac62
	ld (hl),020h		;ac63
	ld a,004h		;ac65
	ld (0cb01h),a		;ac67
	ld a,001h		;ac6a
	ld (0cb16h),a		;ac6c
	ld a,006h		;ac6f
	ld (0cb17h),a		;ac71
	ld a,002h		;ac74
	ld (0cb0eh),a		;ac76
L_AC79:
	ld hl,0cb41h		;ac79
	inc (hl)			;ac7c
	ret			;ac7d
L_AC7E:
	ld hl,0cb40h		;ac7e
	dec (hl)			;ac81
	ret nz			;ac82
	ld (hl),010h		;ac83
	ld a,002h		;ac85
	ld (0cb01h),a		;ac87
	xor a			;ac8a
	ld (0cb16h),a		;ac8b
	ld a,(0cb3fh)		;ac8e
	or a			;ac91
	jr nz,L_AC9B		;ac92
	ld hl,0cb03h		;ac94
	ld a,(hl)			;ac97
	add a,010h		;ac98
	ld (hl),a			;ac9a
L_AC9B:
	jr L_AC79		;ac9b
L_AC9D:
	ld hl,0cb40h		;ac9d
	dec (hl)			;aca0
	ret nz			;aca1
	ld hl,00090h		;aca2
	ld (0cb63h),hl		;aca5
	ld hl,0cb00h		;aca8
	ld (hl),01ch		;acab
	ret			;acad
L_ACAE:
	call 09430h		;acae
	ld a,(0cb03h)		;acb1
	cp 0b8h		;acb4
	jr nc,L_ACC8		;acb6
	ld hl,0b800h		;acb8
	ld (0cb02h),hl		;acbb
	xor a			;acbe
	ld (0cb28h),a		;acbf
	call 098bfh		;acc2
	jp 05afeh		;acc5
L_ACC8:
	ld a,(0cb03h)		;acc8
	sub 0c0h		;accb
	ret c			;accd
	ld b,a			;acce
	ld a,020h		;accf
	sub b			;acd1
	ld c,a			;acd2
	ld b,002h		;acd3
	jp 09367h		;acd5
L_ACD8:
	ld a,(0ca5fh)		;acd8
	or a			;acdb
	call nz,079a3h		;acdc
	ld hl,0cb03h		;acdf
	dec (hl)			;ace2
	call L_AD32		;ace3
	ld hl,0caa7h		;ace6
	ld a,(0cb03h)		;ace9
	cp (hl)			;acec
	ret nc			;aced
	ld a,(0caa5h)		;acee
	or a			;acf1
	jr z,L_AD10		;acf2
	cp 004h		;acf4
	jr z,L_AD2A		;acf6
	ld a,006h		;acf8
	ld (0ca01h),a		;acfa
	xor a			;acfd
	ld (0e1f1h),a		;acfe
	inc a			;ad01
	ld (0e1f0h),a		;ad02
L_AD05:
	call 09364h		;ad05
	ld a,00ah		;ad08
	ld (0cb00h),a		;ad0a
	jp 05afeh		;ad0d
L_AD10:
	ld hl,0ca50h		;ad10
	ld (hl),002h		;ad13
	inc hl			;ad15
	ld (hl),008h		;ad16
	ld a,00bh		;ad18
	call 059a7h		;ad1a
	ld hl,09f00h		;ad1d
	ld (0cb02h),hl		;ad20
	ld h,068h		;ad23
	ld (0cb04h),hl		;ad25
	jr L_AD05		;ad28
L_AD2A:
	ld hl,02f00h		;ad2a
	ld (0cb02h),hl		;ad2d
	jr L_AD05		;ad30
L_AD32:
	ld a,(hl)			;ad32
	ld hl,0caa6h		;ad33
	sub (hl)			;ad36
	ret nc			;ad37
	ld b,a			;ad38
	ld a,020h		;ad39
	add a,b			;ad3b
	bit 7,a		;ad3c
	jr z,L_AD41		;ad3e
	xor a			;ad40
L_AD41:
	ld c,a			;ad41
	ld b,001h		;ad42
	jp 09367h		;ad44
L_AD47:
	ld hl,0cb42h		;ad47
	ld a,(hl)			;ad4a
	or a			;ad4b
	jp z,09430h		;ad4c
	xor a			;ad4f
	ld (hl),a			;ad50
	inc a			;ad51
	ld (0cb14h),a		;ad52
	jp 098bfh		;ad55
L_AD58:
	ld a,(0cb44h)		;ad58
	or a			;ad5b
	ret nz			;ad5c
	jp 098bfh		;ad5d
L_AD60:
	ld a,(0cb80h)		;ad60
	or a			;ad63
	ret nz			;ad64
	ld a,(0cb20h)		;ad65
	or a			;ad68
	ret z			;ad69
	cp 003h		;ad6a
	jr z,L_AD76		;ad6c
	cp 00ah		;ad6e
	ret nz			;ad70
	ld hl,0ad9eh		;ad71
	jr L_AD79		;ad74
L_AD76:
	ld hl,0ad96h		;ad76
L_AD79:
	ld a,(0cb0eh)		;ad79
	dec a			;ad7c
	add a,a			;ad7d
	call 0423eh		;ad7e
	ld a,(0cb03h)		;ad81
	add a,(hl)			;ad84
	ld (0cb22h),a		;ad85
	inc hl			;ad88
	ld a,(0cb05h)		;ad89
	add a,(hl)			;ad8c
	ld (0cb23h),a		;ad8d
	ld a,001h		;ad90
	ld (0cb5ch),a		;ad92
	ret			;ad95

; ----------------------------------------------------------------------
; DATOS resto_AD96: lo apuntan con el banco puesto p03:AD76 (0xAD96), p03:AD71
;   (0xAD9E); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p03:AD76, p03:AD71 (16 bytes)
;   0xad96..0xada6  (16 bytes)
DATA_resto_AD96:
	defb 0b0h,0f8h,020h,0f8h,0e8h,0c0h,0e8h,030h,0c8h,0f8h,008h,0f8h,0f0h,0d8h,0f0h,018h	; ad96  .. ....0........

; ======================================================================
; CODIGO 0xada6..0xaef3  (333 bytes)
; ======================================================================


L_ADA6:
	ld a,(0dff8h)		;ada6
	or a			;ada9
	ret nz			;adaa
	ld a,(0cb21h)		;adab
	dec a			;adae
	ret nz			;adaf
	ld a,(0cb16h)		;adb0
	or a			;adb3
	ret nz			;adb4
	ld a,(0cb00h)		;adb5
	cp 014h		;adb8
	jr z,L_AE04		;adba
	ld a,(0cb3fh)		;adbc
	or a			;adbf
	jr nz,L_AE04		;adc0
	ld a,(0cb37h)		;adc2
	or a			;adc5
	jr nz,L_AE04		;adc6
	call 08b68h		;adc8
	jr nc,L_AE04		;adcb
	ld hl,0cb26h		;adcd
	dec (hl)			;add0
	jr z,L_AE04		;add1
	ld a,(hl)			;add3
	cp 060h		;add4
	jr z,L_ADE9		;add6
	cp 040h		;add8
	jr z,L_ADF4		;adda
	cp 030h		;addc
	jr z,L_ADF8		;adde
	cp 020h		;ade0
	jr z,L_ADF4		;ade2
	cp 010h		;ade4
	jr z,L_ADF8		;ade6
	ret			;ade8
L_ADE9:
	ld a,001h		;ade9
	ld (0cb27h),a		;adeb
	ld a,009h		;adee
	ld (0cb01h),a		;adf0
	ret			;adf3
L_ADF4:
	ld a,002h		;adf4
	jr L_ADFA		;adf6
L_ADF8:
	ld a,003h		;adf8
L_ADFA:
	ld (0cb27h),a		;adfa
	ld a,(0cb00h)		;adfd
	ld (0cb01h),a		;ae00
	ret			;ae03
L_AE04:
	ld a,(0cb00h)		;ae04
	ld (0cb01h),a		;ae07
	ld a,080h		;ae0a
	ld (0cb26h),a		;ae0c
	xor a			;ae0f
	ld (0cb27h),a		;ae10
	ret			;ae13
L_AE14:
	ld a,(0ca4ah)		;ae14
	cp 00ah		;ae17
	ret nz			;ae19
	ld a,(0ca4bh)		;ae1a
	cp 00eh		;ae1d
	ret nz			;ae1f
	ld a,(0cb03h)		;ae20
	cp 028h		;ae23
	ret c			;ae25
	cp 030h		;ae26
	ret nc			;ae28
	ld a,(0cb0eh)		;ae29
	dec a			;ae2c
	ret nz			;ae2d
	ld a,(0cb05h)		;ae2e
	cp 0a8h		;ae31
	ret c			;ae33
	cp 0b0h		;ae34
	ret nc			;ae36
	ld hl,0e1c0h		;ae37
	ld a,(hl)			;ae3a
	or a			;ae3b
	jr z,L_AE42		;ae3c
	ld (hl),002h		;ae3e
	jr L_AE47		;ae40
L_AE42:
	ld (hl),001h		;ae42
	call 08abeh		;ae44
L_AE47:
	jp 06c33h		;ae47
L_AE4A:
	ld hl,0cb32h		;ae4a
	ld (hl),000h		;ae4d
	ld b,007h		;ae4f
	ld a,(0cb28h)		;ae51
	or a			;ae54
	ret z			;ae55
	dec a			;ae56
	jr z,L_AE5B		;ae57
	ld b,006h		;ae59
L_AE5B:
	ld a,(0cb29h)		;ae5b
	cp b			;ae5e
	ret nc			;ae5f
	ld (hl),001h		;ae60
	ret			;ae62
L_AE63:
	xor a			;ae63
	ld (0d752h),a		;ae64
	call L_AE9B		;ae67
	ld a,(0d752h)		;ae6a
	or a			;ae6d
	ret z			;ae6e
	call L_AE8B		;ae6f
	ld a,(0cb20h)		;ae72
	cp 00ch		;ae75
	ret z			;ae77
	cp 005h		;ae78
	ret z			;ae7a
	ld b,a			;ae7b
	ld a,(0cb75h)		;ae7c
	cp 002h		;ae7f
	ret z			;ae81
	ld a,(0cb55h)		;ae82
	or a			;ae85
	ret nz			;ae86
	ld a,b			;ae87
	jp L_BE60		;ae88
L_AE8B:
	ld hl,0cb52h		;ae8b
	ld (hl),000h		;ae8e
	ld a,(0cb20h)		;ae90
	cp 002h		;ae93
	ret c			;ae95
	cp 00ch		;ae96
	ret z			;ae98
	ld (hl),a			;ae99
	ret			;ae9a
L_AE9B:
	ld a,(0cb16h)		;ae9b
	or a			;ae9e
	ret nz			;ae9f
	ld a,(0cb20h)		;aea0
	or a			;aea3
	ret z			;aea4
	ld a,(0cb20h)		;aea5
	cp 006h		;aea8
	jr nz,L_AEB2		;aeaa
	ld a,(0df80h)		;aeac
	and 07fh		;aeaf
	ret nz			;aeb1
L_AEB2:
	ld a,(0cb3fh)		;aeb2
	cp 002h		;aeb5
	jp nc,06c77h		;aeb7
	ld a,(0cb20h)		;aeba
	cp 00ch		;aebd
	jr z,L_AEE9		;aebf
	ld b,a			;aec1
	ld a,(0cb55h)		;aec2
	or a			;aec5
	jr nz,L_AEE9		;aec6
	ld a,(0cb75h)		;aec8
	cp 002h		;aecb
	jr z,L_AEEC		;aecd
	ld a,b			;aecf
	call L_BE42		;aed0
	jr nc,L_AEE9		;aed3
	ld a,(0cb20h)		;aed5
	cp 003h		;aed8
	jp nc,06c77h		;aeda
	dec a			;aedd
	jr nz,L_AEE6		;aede
	ld a,(0ca07h)		;aee0
	and 010h		;aee3
	ret z			;aee5
L_AEE6:
	jp 06afah		;aee6
L_AEE9:
	jp 07ff0h		;aee9
L_AEEC:
	ld a,001h		;aeec
	ld (0cb76h),a		;aeee
	jr L_AEE6		;aef1

; ----------------------------------------------------------------------
; DATOS sin identificar  0xaef3..0xaf05  (18 bytes)
DATA_AEF3:
	defb 0ddh,0e5h,03ah,05fh,0cah,0a7h,0f5h,0cch,012h,0afh,0f1h,03dh,0cch,0bch,079h,0ddh	; aef3  ..:_.......=..y.
	defb 0e1h,0c9h	; af03

; ======================================================================
; CODIGO 0xaf05..0xb077  (370 bytes)
; ======================================================================


L_AF05:
	push ix		;af05
	ld a,(0ca5fh)		;af07
	cp 002h		;af0a
	call c,L_AF12		;af0c
	pop ix		;af0f
	ret			;af11
L_AF12:
	ld a,004h		;af12
	ld (0d446h),a		;af14
	ret			;af17
L_AF18:
	call L_AF27		;af18
	call L_AF5C		;af1b
	call L_AF73		;af1e
	call 08b2fh		;af21
	jp 08b60h		;af24
L_AF27:
	ld ix,0cb80h		;af27
	ld b,006h		;af2b
L_AF2D:
	push bc			;af2d
	ld a,(ix+000h)		;af2e
	or a			;af31
	call nz,L_AF3E		;af32
	ld de,00010h		;af35
	add ix,de		;af38
	pop bc			;af3a
	djnz L_AF2D		;af3b
	ret			;af3d
L_AF3E:
	call 07ff9h		;af3e
	call L_AF8A		;af41
	call L_B007		;af44
	ld a,(ix+000h)		;af47
	or a			;af4a
	ret z			;af4b
	cp 003h		;af4c
	jp z,L_AFEE		;af4e
	cp 007h		;af51
	jp z,L_AFEE		;af53
	cp 005h		;af56
	ret z			;af58
	jp L_AFDD		;af59
L_AF5C:
	ld ix,0cc00h		;af5c
	ld b,008h		;af60
L_AF62:
	push bc			;af62
	ld a,(ix+000h)		;af63
	or a			;af66
	call nz,08b80h		;af67
	ld de,00010h		;af6a
	add ix,de		;af6d
	pop bc			;af6f
	djnz L_AF62		;af70
	ret			;af72
L_AF73:
	ld ix,0cc80h		;af73
	ld b,010h		;af77
L_AF79:
	push bc			;af79
	ld a,(ix+000h)		;af7a
	or a			;af7d
	call nz,08b88h		;af7e
	ld de,00008h		;af81
	add ix,de		;af84
	pop bc			;af86
	djnz L_AF79		;af87
	ret			;af89
L_AF8A:
	call L_AFB5		;af8a
	ret nc			;af8d
	ld e,(ix+002h)		;af8e
	ld d,(ix+003h)		;af91
	ld l,(ix+006h)		;af94
	ld h,(ix+007h)		;af97
	add hl,de			;af9a
	ld (ix+002h),l		;af9b
	ld (ix+003h),h		;af9e
	ld e,(ix+004h)		;afa1
	ld d,(ix+005h)		;afa4
	ld l,(ix+008h)		;afa7
	ld h,(ix+009h)		;afaa
	add hl,de			;afad
	ld (ix+004h),l		;afae
	ld (ix+005h),h		;afb1
	ret			;afb4
L_AFB5:
	ld a,(ix+000h)		;afb5
	cp 003h		;afb8
	jr z,L_AFD6		;afba
	cp 004h		;afbc
	jr z,L_AFD6		;afbe
	cp 007h		;afc0
	jr z,L_AFD6		;afc2
	cp 008h		;afc4
	jr z,L_AFCA		;afc6
	scf			;afc8
	ret			;afc9
L_AFCA:
	ld a,(ix+00dh)		;afca
	or a			;afcd
	ccf			;afce
	ret z			;afcf
	xor a			;afd0
	ld (ix+00dh),a		;afd1
	and a			;afd4
	ret			;afd5
L_AFD6:
	ld a,(ix+001h)		;afd6
	or a			;afd9
	ret z			;afda
	scf			;afdb
	ret			;afdc
L_AFDD:
	ld a,(ix+003h)		;afdd
	cp 0b8h		;afe0
	jp nc,L_B096		;afe2
	ld a,(ix+005h)		;afe5
	cp 0b8h		;afe8
	jp nc,L_B096		;afea
	ret			;afed
L_AFEE:
	ld a,(0cb22h)		;afee
	cp 0b8h		;aff1
	jr c,L_AFFE		;aff3
	ld a,(ix+003h)		;aff5
	cp 0b8h		;aff8
	jp nc,L_B096		;affa
	ret			;affd
L_AFFE:
	ld a,(ix+005h)		;affe
	cp 0c0h		;b001
	jp nc,L_B096		;b003
	ret			;b006
L_B007:
	call L_B07F		;b007
	ret nc			;b00a
	ld a,(0ca4ah)		;b00b
	cp 003h		;b00e
	jr nz,L_B029		;b010
	ld a,(0ca4bh)		;b012
	cp 006h		;b015
	jr nz,L_B029		;b017
	ld a,(0cb03h)		;b019
	sub 026h		;b01c
	cp 084h		;b01e
	ret c			;b020
	ld a,(0cb05h)		;b021
	sub 010h		;b024
	cp 098h		;b026
	ret c			;b028
L_B029:
	call L_B045		;b029
	call 07f88h		;b02c
	ret nc			;b02f
	ld b,(ix+000h)		;b030
	call L_B0A4		;b033
	ld a,b			;b036
	cp 006h		;b037
	ret nz			;b039
	ld l,(ix+003h)		;b03a
	ld h,(ix+005h)		;b03d
	ld c,000h		;b040
	jp L_B1BA		;b042
L_B045:
	ld a,(ix+000h)		;b045
	cp 006h		;b048
	jr z,L_B053		;b04a
	ld l,(ix+003h)		;b04c
	ld h,(ix+005h)		;b04f
	ret			;b052
L_B053:
	ld hl,0b077h		;b053
	ld a,(ix+00bh)		;b056
	dec a			;b059
	add a,a			;b05a
	call 0423eh		;b05b
	ld a,(ix+003h)		;b05e
	add a,(hl)			;b061
	cp 0c0h		;b062
	jr c,L_B068		;b064
	ld a,0b8h		;b066
L_B068:
	ld b,a			;b068
	inc hl			;b069
	ld a,(ix+005h)		;b06a
	add a,(hl)			;b06d
	cp 0c0h		;b06e
	jr c,L_B074		;b070
	ld a,0b8h		;b072
L_B074:
	ld h,a			;b074
	ld l,b			;b075
	ret			;b076

; ----------------------------------------------------------------------
; DATOS resto_B077: lo apuntan con el banco puesto p03:B053 (0xB077); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p03:B053 (8 bytes)
;   0xb077..0xb07f  (8 bytes)
DATA_resto_B077:
	defb 000h,004h,010h,004h,004h,000h,004h,010h	; b077  ........

; ======================================================================
; CODIGO 0xb07f..0xb0b9  (58 bytes)
; ======================================================================


L_B07F:
	ld a,(ix+000h)		;b07f
	cp 008h		;b082
	jr z,L_B094		;b084
	cp 003h		;b086
	jr z,L_B094		;b088
	cp 007h		;b08a
	jr z,L_B094		;b08c
	cp 005h		;b08e
	jr z,L_B094		;b090
	scf			;b092
	ret			;b093
L_B094:
	or a			;b094
	ret			;b095
L_B096:
	ld a,(ix+000h)		;b096
	cp 008h		;b099
	jr nz,L_B0A4		;b09b
	call 06a6bh		;b09d
	xor a			;b0a0
	ld (0d44fh),a		;b0a1
L_B0A4:
	xor a			;b0a4
	ld (ix+000h),a		;b0a5
	ld hl,0cb52h		;b0a8
	ld (hl),a			;b0ab
	ret			;b0ac
L_B0AD:
	ld de,0d7d0h		;b0ad
	ld hl,0b0b9h		;b0b0
	ld bc,00015h		;b0b3
	ldir		;b0b6
	ret			;b0b8

; ----------------------------------------------------------------------
; DATOS resto_B0B9: lo apuntan con el banco puesto p03:B0B0 (0xB0B9); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p03:B0B0 (21 bytes)
;   0xb0b9..0xb0ce  (21 bytes)
DATA_resto_B0B9:
	defb 021h,048h,0e6h,048h,000h,003h,011h,001h,000h,041h,000h,01ch,0dfh,0ffh,0feh,0fbh	; b0b9  !H.H.....A......
	defb 06ah,041h,0c1h,082h,004h	; b0c9

; ======================================================================
; CODIGO 0xb0ce..0xb3a0  (722 bytes)
; ======================================================================


L_B0CE:
	ld hl,0d8d8h		;b0ce
	jr L_B0D6		;b0d1
L_B0D3:
	ld hl,0d7f0h		;b0d3
L_B0D6:
	call L_B0E1		;b0d6
	or (hl)			;b0d9
	ld (hl),a			;b0da
	ret			;b0db
L_B0DC:
	ld hl,0d7d0h		;b0dc
	jr L_B0D6		;b0df
L_B0E1:
	ld b,a			;b0e1
	rra			;b0e2
	rra			;b0e3
	rra			;b0e4
	and 01fh		;b0e5
	ld e,a			;b0e7
	ld d,000h		;b0e8
	add hl,de			;b0ea
	ld a,b			;b0eb
	and 007h		;b0ec
	or a			;b0ee
	ld a,080h		;b0ef
	ret z			;b0f1
L_B0F2:
	rrca			;b0f2
	djnz L_B0F2		;b0f3
	ret			;b0f5
L_B0F6:
	ld hl,0d7d0h		;b0f6
L_B0F9:
	call L_B0E1		;b0f9
	and (hl)			;b0fc
	ret			;b0fd
L_B0FE:
	ld hl,0d7f0h		;b0fe
	jr L_B0F9		;b101
L_B103:
	ld hl,0d8d8h		;b103
	jr L_B0F9		;b106
L_B108:
	ld a,(0ca97h)		;b108
	or a			;b10b
	jr nz,L_B113		;b10c
	ld hl,0d7bbh		;b10e
	ld (hl),000h		;b111
L_B113:
	call 06361h		;b113
	ld a,(0ca9ch)		;b116
	or a			;b119
	ret z			;b11a
	xor a			;b11b
	jp L_B11F		;b11c
L_B11F:
	push af			;b11f
	call L_B1A3		;b120
	pop af			;b123
	ld hl,0e1e8h		;b124
	ld (hl),001h		;b127
	inc l			;b129
	ld (hl),a			;b12a
	inc l			;b12b
	ld (hl),000h		;b12c
	inc l			;b12e
	ld (hl),00eh		;b12f
	ret			;b131
L_B132:
	ld hl,0e1e8h		;b132
	ld a,(hl)			;b135
	or a			;b136
	ret z			;b137
	inc hl			;b138
	ld a,(hl)			;b139
	or a			;b13a
	jr nz,L_B178		;b13b
	call L_B152		;b13d
	ld a,(0ca97h)		;b140
	or a			;b143
	ret nz			;b144
	ld a,(0ca09h)		;b145
	and 008h		;b148
	ret z			;b14a
	ld hl,0d7bbh		;b14b
	ld (hl),001h		;b14e
	jr L_B19A		;b150
L_B152:
	ld a,(0e1ebh)		;b152
	or a			;b155
	jr z,L_B1A3		;b156
	inc l			;b158
	dec (hl)			;b159
	ld a,(hl)			;b15a
	and 003h		;b15b
	jr nz,L_B1A3		;b15d
	ld a,(hl)			;b15f
	rra			;b160
	bit 3,a		;b161
	jr z,L_B1A3		;b163
	bit 1,a		;b165
	jr nz,L_B1A3		;b167
	push af			;b169
	call 07030h		;b16a
	pop af			;b16d
	and 001h		;b16e
	ret nz			;b170
	ld hl,0e1ebh		;b171
	dec (hl)			;b174
	jp 06a64h		;b175
L_B178:
	ld a,(0e1ebh)		;b178
	or a			;b17b
	jr z,L_B1A3		;b17c
	inc l			;b17e
	dec (hl)			;b17f
	ld a,(hl)			;b180
	rra			;b181
	and 007h		;b182
	cp 004h		;b184
	jr nc,L_B1A3		;b186
	push hl			;b188
	push af			;b189
	call 0702bh		;b18a
	pop af			;b18d
	pop hl			;b18e
	ld a,(hl)			;b18f
	rra			;b190
	ret c			;b191
	and 007h		;b192
	cp 003h		;b194
	jp z,06c5bh		;b196
	ret			;b199
L_B19A:
	call L_B1A3		;b19a
	ld hl,0e1e8h		;b19d
	ld (hl),000h		;b1a0
	ret			;b1a2
L_B1A3:
	ld a,(0ca42h)		;b1a3
	ld d,a			;b1a6
	call L_B1B0		;b1a7
	ld a,(0ca42h)		;b1aa
	xor 001h		;b1ad
	ld d,a			;b1af
L_B1B0:
	ld hl,0d000h		;b1b0
	ld bc,02014h		;b1b3
	xor a			;b1b6
	jp 046ffh		;b1b7
L_B1BA:
	ld de,(0ca50h)		;b1ba
L_B1BE:
	ld a,(0ca4ah)		;b1be
	cp 00ch		;b1c1
	jr z,L_B1FD		;b1c3
	cp 00fh		;b1c5
	jr nz,L_B1DF		;b1c7
	ld a,(0ca4bh)		;b1c9
	or a			;b1cc
	jr nz,L_B1DF		;b1cd
	ld a,h			;b1cf
	cp 048h		;b1d0
	jr c,L_B1DF		;b1d2
	cp 0a0h		;b1d4
	jr nc,L_B1DF		;b1d6
	ld a,l			;b1d8
	cp 060h		;b1d9
	jr nc,L_B1DF		;b1db
	jr L_B1F5		;b1dd
L_B1DF:
	ld a,(0ca50h)		;b1df
	cp e			;b1e2
	jr nz,L_B1F5		;b1e3
	ld a,(0ca51h)		;b1e5
	cp d			;b1e8
	jr nz,L_B1F5		;b1e9
	push bc			;b1eb
	push hl			;b1ec
	push de			;b1ed
	call 07f71h		;b1ee
	pop de			;b1f1
	pop hl			;b1f2
	pop bc			;b1f3
	ret c			;b1f4
L_B1F5:
	push ix		;b1f5
	call L_B206		;b1f7
	pop ix		;b1fa
	ret			;b1fc
L_B1FD:
	ld a,(0ca4bh)		;b1fd
	cp 004h		;b200
	jr c,L_B1DF		;b202
	jr L_B1F5		;b204
L_B206:
	ld ix,0df80h		;b206
	ld a,c			;b20a
	ld b,001h		;b20b
	or a			;b20d
	jr z,L_B212		;b20e
	ld b,008h		;b210
L_B212:
	ld a,(ix+000h)		;b212
	or a			;b215
	jr z,L_B222		;b216
	push de			;b218
	ld de,00008h		;b219
	add ix,de		;b21c
	pop de			;b21e
	djnz L_B212		;b21f
	ret			;b221
L_B222:
	call L_B25A		;b222
	call L_B230		;b225
	push ix		;b228
	call L_AF05		;b22a
	pop ix		;b22d
	ret			;b22f
L_B230:
	ld a,(0ca50h)		;b230
	sub (ix+004h)		;b233
	jr z,L_B247		;b236
	jr nc,L_B23C		;b238
	neg		;b23a
L_B23C:
	cp 002h		;b23c
	ret nc			;b23e
	ld a,(0ca51h)		;b23f
	sub (ix+005h)		;b242
	jr z,L_B250		;b245
L_B247:
	ld a,(0ca51h)		;b247
	sub (ix+005h)		;b24a
	jp z,06a44h		;b24d
L_B250:
	jr nc,L_B254		;b250
	neg		;b252
L_B254:
	cp 002h		;b254
	ret nc			;b256
	jp 06a48h		;b257
L_B25A:
	call L_B26D		;b25a
	call L_B2AE		;b25d
	ret nz			;b260
	ld a,(ix+007h)		;b261
	and 00fh		;b264
	ret z			;b266
	call L_B289		;b267
	jp L_B3A6		;b26a
L_B26D:
	ld (ix+000h),001h		;b26d
	ld (ix+001h),000h		;b271
	ld (ix+002h),l		;b275
	ld (ix+003h),h		;b278
	ld (ix+006h),003h		;b27b
	ld (ix+007h),c		;b27f
	ld (ix+004h),e		;b282
	ld (ix+005h),d		;b285
	ret			;b288
L_B289:
	call L_B28F		;b289
	jp 0474dh		;b28c
L_B28F:
	dec b			;b28f
	ld a,b			;b290
	and 004h		;b291
	ld a,b			;b293
	ld e,090h		;b294
	jr z,L_B29A		;b296
	ld e,0a0h		;b298
L_B29A:
	ld a,b			;b29a
	and 003h		;b29b
	rlca			;b29d
	rlca			;b29e
	rlca			;b29f
	rlca			;b2a0
	add a,0c0h		;b2a1
	ld d,a			;b2a3
	ld l,(ix+002h)		;b2a4
	ld h,(ix+003h)		;b2a7
	ld bc,01010h		;b2aa
	ret			;b2ad
L_B2AE:
	ld a,(0ca50h)		;b2ae
	cp (ix+004h)		;b2b1
	ret nz			;b2b4
	ld a,(0ca51h)		;b2b5
	cp (ix+005h)		;b2b8
	ret			;b2bb
L_B2BC:
	ld ix,0df80h		;b2bc
	ld b,008h		;b2c0
L_B2C2:
	ld a,(ix+000h)		;b2c2
	and 07fh		;b2c5
	jr z,L_B2CE		;b2c7
	push bc			;b2c9
	call L_B2D6		;b2ca
	pop bc			;b2cd
L_B2CE:
	ld de,00008h		;b2ce
	add ix,de		;b2d1
	djnz L_B2C2		;b2d3
	ret			;b2d5
L_B2D6:
	ld a,(0ca41h)		;b2d6
	or a			;b2d9
	jr z,L_B2E1		;b2da
	ld (ix+000h),000h		;b2dc
	ret			;b2e0
L_B2E1:
	dec (ix+006h)		;b2e1
	jr nz,L_B307		;b2e4
	ld (ix+006h),003h		;b2e6
	ld a,(ix+001h)		;b2ea
	inc a			;b2ed
	cp 003h		;b2ee
	jr nc,L_B314		;b2f0
	ld (ix+001h),a		;b2f2
	ld a,(ix+007h)		;b2f5
	and 00fh		;b2f8
	ret z			;b2fa
	call L_B2AE		;b2fb
	ret nz			;b2fe
	push bc			;b2ff
	call L_B322		;b300
	pop bc			;b303
	jp L_B3A6		;b304
L_B307:
	ld a,(ix+007h)		;b307
	and 00fh		;b30a
	ret z			;b30c
	call L_B2AE		;b30d
	ret nz			;b310
	jp L_B3A6		;b311
L_B314:
	ld (ix+000h),000h		;b314
	call L_B2AE		;b318
	ret nz			;b31b
	ld a,(ix+007h)		;b31c
	and 00fh		;b31f
	ret z			;b321
L_B322:
	call L_B28F		;b322
	ex de,hl			;b325
	jp 0475ah		;b326
L_B329:
	ld ix,0df80h		;b329
	ld hl,0dc20h		;b32d
	ld de,0da80h		;b330
	ld b,008h		;b333
L_B335:
	ld a,(ix+000h)		;b335
	and 07fh		;b338
	jr z,L_B34D		;b33a
	ld a,(ix+007h)		;b33c
	and 00fh		;b33f
	jr nz,L_B34D		;b341
	call L_B2AE		;b343
	jr nz,L_B34D		;b346
	push bc			;b348
	call L_B357		;b349
	pop bc			;b34c
L_B34D:
	push de			;b34d
	ld de,00008h		;b34e
	add ix,de		;b351
	pop de			;b353
	djnz L_B335		;b354
	ret			;b356
L_B357:
	call L_B35C		;b357
	jr L_B378		;b35a
L_B35C:
	push de			;b35c
	call L_B36E		;b35d
	ld e,(ix+002h)		;b360
	ld d,(ix+003h)		;b363
	call 05d41h		;b366
	call 05d3dh		;b369
	pop de			;b36c
	ret			;b36d
L_B36E:
	ld a,(ix+001h)		;b36e
	rlca			;b371
	rlca			;b372
	rlca			;b373
	add a,028h		;b374
	ld c,a			;b376
	ret			;b377
L_B378:
	push hl			;b378
	call L_B392		;b379
	push bc			;b37c
	ld h,d			;b37d
	ld l,e			;b37e
	inc de			;b37f
	ld (hl),b			;b380
	ld bc,0000fh		;b381
	ldir		;b384
	inc de			;b386
	inc hl			;b387
	pop bc			;b388
	ld (hl),c			;b389
	ld bc,0000fh		;b38a
	ldir		;b38d
	inc de			;b38f
	pop hl			;b390
	ret			;b391
L_B392:
	ld a,(ix+001h)		;b392
	add a,a			;b395
	ld hl,0b3a0h		;b396
	call 0423eh		;b399
	ld b,(hl)			;b39c
	inc hl			;b39d
	ld c,(hl)			;b39e
	ret			;b39f

; ----------------------------------------------------------------------
; DATOS resto_B3A0: lo apuntan con el banco puesto p03:B396 (0xB3A0); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p03:B396 (6 bytes)
;   0xb3a0..0xb3a6  (6 bytes)
DATA_resto_B3A0:
	defb 007h,04bh,00ah,04bh,003h,04ch	; b3a0

; ======================================================================
; CODIGO 0xb3a6..0xb48b  (229 bytes)
; ======================================================================


L_B3A6:
	ld e,(ix+002h)		;b3a6
	ld d,(ix+003h)		;b3a9
	ld a,(ix+001h)		;b3ac
	rlca			;b3af
	rlca			;b3b0
	rlca			;b3b1
	rlca			;b3b2
	add a,068h		;b3b3
	ld h,a			;b3b5
	ld l,0b0h		;b3b6
	ld bc,01010h		;b3b8
	ld a,(0ca42h)		;b3bb
	rlca			;b3be
	rlca			;b3bf
	rlca			;b3c0
	rlca			;b3c1
	or 0c8h		;b3c2
	jp 047edh		;b3c4
L_B3C7:
	call L_B3E8		;b3c7
	ld a,(0caa0h)		;b3ca
	cp 004h		;b3cd
	jr z,L_B3E2		;b3cf
	ld a,003h		;b3d1
	ld (0e240h),a		;b3d3
	ld a,(0caa0h)		;b3d6
	cp 002h		;b3d9
	ret c			;b3db
	ld a,003h		;b3dc
	ld (0e248h),a		;b3de
	ret			;b3e1
L_B3E2:
	ld a,003h		;b3e2
	ld (0dfd8h),a		;b3e4
	ret			;b3e7
L_B3E8:
	ld hl,0e080h		;b3e8
	ld a,(0cb03h)		;b3eb
	ld (hl),a			;b3ee
	inc l			;b3ef
	ld a,(0cb05h)		;b3f0
	ld (hl),a			;b3f3
	inc l			;b3f4
	ld a,(0cb0eh)		;b3f5
	ld (hl),a			;b3f8
	ld e,l			;b3f9
	ld d,h			;b3fa
	dec l			;b3fb
	dec l			;b3fc
	inc e			;b3fd
	ld bc,0002dh		;b3fe
	ldir		;b401
	ret			;b403
L_B404:
	ld a,(0caa0h)		;b404
	cp 003h		;b407
	jp z,L_B4AF		;b409
	call L_B425		;b40c
	call L_B41A		;b40f
	ld hl,0dfd8h		;b412
	ld de,000c0h		;b415
	jr L_B420		;b418
L_B41A:
	ld hl,0e248h		;b41a
	ld de,00080h		;b41d
L_B420:
	ld bc,0e0a4h		;b420
	jr L_B42E		;b423
L_B425:
	ld hl,0e240h		;b425
	ld de,00100h		;b428
	ld bc,0e08ch		;b42b
L_B42E:
	ld a,(hl)			;b42e
	dec a			;b42f
	jr z,L_B439		;b430
	dec a			;b432
	jr z,L_B457		;b433
	dec a			;b435
	jr z,L_B441		;b436
	ret			;b438
L_B439:
	ld a,007h		;b439
	call 0423eh		;b43b
	xor a			;b43e
	ld (hl),a			;b43f
	ret			;b440
L_B441:
	ld a,(bc)			;b441
	inc l			;b442
	inc l			;b443
	inc l			;b444
	ld (hl),a			;b445
	inc bc			;b446
	ld a,(bc)			;b447
	inc l			;b448
	inc l			;b449
	ld (hl),a			;b44a
	inc bc			;b44b
	ld a,(bc)			;b44c
	inc l			;b44d
	ld (hl),a			;b44e
	inc l			;b44f
	ld a,(0cb14h)		;b450
	and 001h		;b453
	ld (hl),a			;b455
	ret			;b456
L_B457:
	push hl			;b457
	inc l			;b458
	inc l			;b459
	ld c,(hl)			;b45a
	inc l			;b45b
	ld b,(hl)			;b45c
	inc l			;b45d
	push bc			;b45e
	ld c,(hl)			;b45f
	inc l			;b460
	ld b,(hl)			;b461
	inc l			;b462
	ld a,(hl)			;b463
	ld l,c			;b464
	ld h,b			;b465
	pop bc			;b466
	call L_B495		;b467
	pop hl			;b46a
	cp 003h		;b46b
	ld a,002h		;b46d
	jr c,L_B473		;b46f
	ld a,004h		;b471
L_B473:
	push hl			;b473
	call 0423eh		;b474
	ld (hl),e			;b477
	inc l			;b478
	ld (hl),d			;b479
	pop hl			;b47a
	ld a,007h		;b47b
	call 0423eh		;b47d
	ld a,(0ca03h)		;b480
	and 007h		;b483
	ret nz			;b485
	ld a,(hl)			;b486
	xor 001h		;b487
	ld (hl),a			;b489
	ret			;b48a

; ----------------------------------------------------------------------
; DATOS sin identificar  0xb48b..0xb495  (10 bytes)
DATA_B48B:
	defb 021h,047h,0e2h,018h,0f0h,021h,04fh,0e2h,018h,0ebh	; b48b  !G...!O...

; ======================================================================
; CODIGO 0xb495..0xb9ce  (1337 bytes)
; ======================================================================


L_B495:
	push af			;b495
	dec a			;b496
	dec a			;b497
	jr z,L_B4A3		;b498
	dec a			;b49a
	jr z,L_B4A7		;b49b
	dec a			;b49d
	jr z,L_B4AA		;b49e
	call 04442h		;b4a0
L_B4A3:
	ld l,c			;b4a3
	ld h,b			;b4a4
	jr L_B4AA		;b4a5
L_B4A7:
	call 04442h		;b4a7
L_B4AA:
	add hl,de			;b4aa
	ld d,h			;b4ab
	ld e,l			;b4ac
	pop af			;b4ad
	ret			;b4ae
L_B4AF:
	ld a,(0cb0fh)		;b4af
	or a			;b4b2
	ret nz			;b4b3
	ld a,(0cb0eh)		;b4b4
	cp 003h		;b4b7
	ret nc			;b4b9
	ld (0e24eh),a		;b4ba
	ld (0e246h),a		;b4bd
	ld hl,0e248h		;b4c0
	ld de,00080h		;b4c3
	call L_B457		;b4c6
	ld hl,0e240h		;b4c9
	ld de,000c0h		;b4cc
	jr $-120		;b4cf
L_B4D1:
	ld hl,0caa0h		;b4d1
	ld a,(hl)			;b4d4
	or a			;b4d5
	ret z			;b4d6
	cp 003h		;b4d7
	jp nz,L_B3C7		;b4d9
	dec (hl)			;b4dc
	jp L_B3C7		;b4dd
L_B4E0:
	call L_B4E6		;b4e0
	jp L_B563		;b4e3
L_B4E6:
	ld a,(0e240h)		;b4e6
	or a			;b4e9
	ret z			;b4ea
	call L_B4F6		;b4eb
	ld a,(0e241h)		;b4ee
	or a			;b4f1
	call nz,L_B53C		;b4f2
	ret			;b4f5
L_B4F6:
	ld a,(0e241h)		;b4f6
	ld de,0dc70h		;b4f9
	ld hl,0e243h		;b4fc
	ld c,088h		;b4ff
L_B501:
	or a			;b501
	jr z,L_B558		;b502
	ld a,(hl)			;b504
	cp 0c0h		;b505
	jr nc,L_B558		;b507
	push de			;b509
	sub 020h		;b50a
	ld e,a			;b50c
	inc l			;b50d
	inc l			;b50e
	ld a,(hl)			;b50f
	sub 008h		;b510
	ld d,a			;b512
	inc l			;b513
	ld b,(hl)			;b514
	inc l			;b515
	ld a,(hl)			;b516
	ld (0d8e5h),a		;b517
	ld a,c			;b51a
L_B51B:
	add a,018h		;b51b
	djnz L_B51B		;b51d
	ld c,a			;b51f
	pop hl			;b520
	ld b,002h		;b521
L_B523:
	call 05d41h		;b523
	call 05d3dh		;b526
	ld a,e			;b529
	add a,010h		;b52a
	ld e,a			;b52c
	ld a,(0d8e5h)		;b52d
	rra			;b530
	ld a,004h		;b531
	jr nc,L_B537		;b533
	ld a,00ch		;b535
L_B537:
	add a,c			;b537
	ld c,a			;b538
	djnz L_B523		;b539
	ret			;b53b
L_B53C:
	ld de,0bb47h		;b53c
	ld a,(0e040h)		;b53f
	cp 005h		;b542
	jr nz,L_B549		;b544
	ld de,0bb64h		;b546
L_B549:
	ld hl,0dbc0h		;b549
	call 06fd5h		;b54c
	ld hl,0dbe0h		;b54f
	ld de,0bb5fh		;b552
	jp 06fd5h		;b555
L_B558:
	ld h,d			;b558
	ld l,e			;b559
	inc de			;b55a
	ld (hl),0e0h		;b55b
	ld bc,0000fh		;b55d
	ldir		;b560
	ret			;b562
L_B563:
	ld a,(0e248h)		;b563
	or a			;b566
	ret z			;b567
	call L_B573		;b568
	ld a,(0e249h)		;b56b
	or a			;b56e
	call nz,L_B581		;b56f
	ret			;b572
L_B573:
	ld a,(0e249h)		;b573
	ld de,0dc60h		;b576
	ld hl,0e24bh		;b579
	ld c,028h		;b57c
	jp L_B501		;b57e
L_B581:
	ld de,0bb1ah		;b581
	ld hl,0db80h		;b584
	call 06fd5h		;b587
	ld de,0bb2ch		;b58a
	ld hl,0dba0h		;b58d
	jp 06fd5h		;b590
L_B593:
	ld a,(0dfd8h)		;b593
	or a			;b596
	ret z			;b597
	ld a,(0dfd9h)		;b598
	or a			;b59b
	ret z			;b59c
	ld a,(0dfdeh)		;b59d
	dec a			;b5a0
	add a,a			;b5a1
	add a,0e8h		;b5a2
	ld c,a			;b5a4
	ld a,(0dfdfh)		;b5a5
	add a,c			;b5a8
	ld l,a			;b5a9
	ld h,000h		;b5aa
	ld d,001h		;b5ac
	ld e,0feh		;b5ae
	ld a,007h		;b5b0
	jp 047abh		;b5b2
L_B5B5:
	ld a,(0dfd8h)		;b5b5
	or a			;b5b8
	ret z			;b5b9
	ld de,0dc58h		;b5ba
	ld a,(0dfd9h)		;b5bd
	or a			;b5c0
	jr z,L_B558		;b5c1
	call L_B5D8		;b5c3
	ld de,0bb7fh		;b5c6
	ld hl,0db60h		;b5c9
	call 06fd5h		;b5cc
	ld de,0bb9eh		;b5cf
	ld hl,0db80h		;b5d2
	jp 06fd5h		;b5d5
L_B5D8:
	ld a,(0dfdbh)		;b5d8
	cp 0c0h		;b5db
	jp nc,L_B558		;b5dd
	ex de,hl			;b5e0
	ld a,(0dfdbh)		;b5e1
	sub 020h		;b5e4
	ld e,a			;b5e6
	ld a,(0dfddh)		;b5e7
	sub 008h		;b5ea
	ld d,a			;b5ec
	ld c,0e0h		;b5ed
	call 05d41h		;b5ef
	call 05d3dh		;b5f2
	ld a,e			;b5f5
	add a,010h		;b5f6
	ld e,a			;b5f8
	call 05d3dh		;b5f9
	jp 05d3dh		;b5fc
L_B5FF:
	ld l,04ch		;b5ff
	jr L_B612		;b601
L_B603:
	ld l,00ch		;b603
	jr L_B612		;b605
L_B607:
	ld a,(0cb03h)		;b607
	cp 080h		;b60a
	ld l,01ch		;b60c
	jr nc,L_B612		;b60e
L_B610:
	ld l,07ch		;b610
L_B612:
	ld h,004h		;b612
	ld a,l			;b614
	ld (0caa1h),a		;b615
	ld a,h			;b618
	ld (0caa2h),a		;b619
	ld de,000d8h		;b61c
	call L_B633		;b61f
	ld a,(0ca1ch)		;b622
	and a			;b625
	jr z,L_B62D		;b626
	ld a,(0d8a5h)		;b628
	add a,e			;b62b
	ld e,a			;b62c
L_B62D:
	ld a,(0ca42h)		;b62d
	jp 04767h		;b630
L_B633:
	ld a,(0d8a8h)		;b633
	and a			;b636
	ld bc,0b828h		;b637
	ret nz			;b63a
	ld b,0e0h		;b63b
	ret			;b63d
L_B63E:
	ld hl,0caa1h		;b63e
	ld e,(hl)			;b641
	inc hl			;b642
	ld d,(hl)			;b643
	ld hl,000d8h		;b644
	call L_B633		;b647
	ld a,(0ca1ch)		;b64a
	and a			;b64d
	jr z,L_B655		;b64e
	ld a,(0d8a5h)		;b650
	add a,l			;b653
	ld l,a			;b654
L_B655:
	call L_B675		;b655
	xor a			;b658
	ld (0d8a8h),a		;b659
	ret			;b65c
L_B65D:
	ld hl,0caa1h		;b65d
	ld e,(hl)			;b660
	inc hl			;b661
	ld d,(hl)			;b662
	push de			;b663
	ld h,d			;b664
	ld l,e			;b665
	ld bc,0c028h		;b666
	call 046fah		;b669
	pop de			;b66c
	ld hl,0bed8h		;b66d
	ld d,0c2h		;b670
	ld bc,02228h		;b672
L_B675:
	ld a,(0ca42h)		;b675
	rlca			;b678
	rlca			;b679
	jp 04767h		;b67a
L_B67D:
	xor a			;b67d
	ld hl,0e270h		;b67e
	ld (hl),002h		;b681
	inc l			;b683
	ld (hl),e			;b684
	inc l			;b685
	ld (hl),d			;b686
	inc l			;b687
	ld (hl),a			;b688
	inc l			;b689
	ld (hl),a			;b68a
	inc l			;b68b
	ld (hl),a			;b68c
	ret			;b68d
L_B68E:
	ld hl,0e270h		;b68e
	ld (hl),001h		;b691
	inc l			;b693
	ld c,e			;b694
	call L_B69A		;b695
	inc l			;b698
	ld c,d			;b699
L_B69A:
	call L_B6AB		;b69a
	ld (hl),a			;b69d
	inc l			;b69e
	ld (hl),a			;b69f
	inc l			;b6a0
	ld (hl),000h		;b6a1
	inc l			;b6a3
	ld (hl),b			;b6a4
	inc l			;b6a5
	ld (hl),b			;b6a6
	inc l			;b6a7
	ld (hl),0c0h		;b6a8
	ret			;b6aa
L_B6AB:
	ld a,0c0h		;b6ab
	sub c			;b6ad
	cp c			;b6ae
	jr nc,L_B6BA		;b6af
	ld b,a			;b6b1
	ld a,c			;b6b2
	ld c,b			;b6b3
	call L_B6C1		;b6b4
	ld a,001h		;b6b7
	ret			;b6b9
L_B6BA:
	call L_B6C1		;b6ba
	ld a,b			;b6bd
	ld b,001h		;b6be
	ret			;b6c0
L_B6C1:
	ld b,000h		;b6c1
L_B6C3:
	inc b			;b6c3
	sub c			;b6c4
	jr nz,L_B6C3		;b6c5
	ret			;b6c7
L_B6C8:
	ld a,(0e270h)		;b6c8
	dec a			;b6cb
	jp z,L_B7A1		;b6cc
	ld a,(0e274h)		;b6cf
	ld hl,0e275h		;b6d2
	and (hl)			;b6d5
	cp 003h		;b6d6
	jp z,L_B7DC		;b6d8
	ld hl,0e273h		;b6db
	ld a,(hl)			;b6de
	add a,004h		;b6df
	ld (hl),a			;b6e1
	cp 0c0h		;b6e2
	jr c,L_B6E8		;b6e4
	ld (hl),0c0h		;b6e6
L_B6E8:
	call L_B779		;b6e8
	call L_B78D		;b6eb
	ld hl,0e271h		;b6ee
	ld e,(hl)			;b6f1
	inc hl			;b6f2
	ld d,(hl)			;b6f3
	push de			;b6f4
	ld a,(0e274h)		;b6f5
	bit 0,a		;b6f8
	call z,L_B71A		;b6fa
	pop de			;b6fd
	push de			;b6fe
	ld a,(0e274h)		;b6ff
	bit 1,a		;b702
	call z,L_B72F		;b704
	pop de			;b707
	push de			;b708
	ld a,(0e275h)		;b709
	bit 0,a		;b70c
	call z,L_B749		;b70e
	pop de			;b711
	ld a,(0e275h)		;b712
	bit 1,a		;b715
	ret nz			;b717
	jr L_B75F		;b718
L_B71A:
	ld h,d			;b71a
	ld l,e			;b71b
	ld a,(0e273h)		;b71c
	ld b,a			;b71f
	add a,h			;b720
	jr c,L_B727		;b721
	cp 0c0h		;b723
	jr c,L_B72B		;b725
L_B727:
	ld a,0c0h		;b727
	sub h			;b729
	ld b,a			;b72a
L_B72B:
	ld c,002h		;b72b
	jr L_B75C		;b72d
L_B72F:
	ld a,(0e273h)		;b72f
	add a,e			;b732
	sub 002h		;b733
	cp 0beh		;b735
	jr c,L_B743		;b737
	ld a,(0e274h)		;b739
	or 002h		;b73c
	ld (0e274h),a		;b73e
	ld a,0beh		;b741
L_B743:
	ld e,a			;b743
	cp 0c0h		;b744
	ret nc			;b746
	jr L_B71A		;b747
L_B749:
	ld h,d			;b749
	ld l,e			;b74a
	ld a,(0e273h)		;b74b
	ld c,a			;b74e
	add a,l			;b74f
	jr c,L_B756		;b750
	cp 0c1h		;b752
	jr c,L_B75A		;b754
L_B756:
	ld a,0c0h		;b756
	sub l			;b758
	ld c,a			;b759
L_B75A:
	ld b,002h		;b75a
L_B75C:
	jp 0475ah		;b75c
L_B75F:
	ld a,(0e273h)		;b75f
	add a,d			;b762
	sub 002h		;b763
	cp 0beh		;b765
	jr c,L_B773		;b767
	ld a,(0e275h)		;b769
	or 002h		;b76c
	ld (0e275h),a		;b76e
	ld a,0beh		;b771
L_B773:
	ld d,a			;b773
	cp 0c0h		;b774
	ret nc			;b776
	jr L_B749		;b777
L_B779:
	ld a,(0e271h)		;b779
	sub 002h		;b77c
	jr nc,L_B789		;b77e
	ld a,(0e274h)		;b780
	or 001h		;b783
	ld (0e274h),a		;b785
	xor a			;b788
L_B789:
	ld (0e271h),a		;b789
	ret			;b78c
L_B78D:
	ld a,(0e272h)		;b78d
	sub 002h		;b790
	jr nc,L_B79D		;b792
	ld a,(0e275h)		;b794
	or 001h		;b797
	ld (0e275h),a		;b799
	xor a			;b79c
L_B79D:
	ld (0e272h),a		;b79d
	ret			;b7a0
L_B7A1:
	ld hl,0e271h		;b7a1
	ld b,002h		;b7a4
	call L_B7E1		;b7a6
	call c,L_B7EE		;b7a9
	ld hl,0e274h		;b7ac
	ld b,0feh		;b7af
	call L_B7E1		;b7b1
	call c,L_B7F9		;b7b4
	ld hl,0e277h		;b7b7
	ld b,002h		;b7ba
	call L_B7E1		;b7bc
	call c,L_B7FC		;b7bf
	ld hl,0e27ah		;b7c2
	ld b,0feh		;b7c5
	call L_B7E1		;b7c7
	call c,L_B80B		;b7ca
	ld a,(0e276h)		;b7cd
	ld b,a			;b7d0
	ld a,0c0h		;b7d1
	sub b			;b7d3
	ld b,a			;b7d4
	ld a,(0e273h)		;b7d5
	add a,b			;b7d8
	cp 0c0h		;b7d9
	ret c			;b7db
L_B7DC:
	xor a			;b7dc
	ld (0e270h),a		;b7dd
	ret			;b7e0
L_B7E1:
	or a			;b7e1
	dec (hl)			;b7e2
	ret nz			;b7e3
	ld d,h			;b7e4
	ld e,l			;b7e5
	inc l			;b7e6
	ldi		;b7e7
	ld a,(hl)			;b7e9
	add a,b			;b7ea
	ld (hl),a			;b7eb
	scf			;b7ec
	ret			;b7ed
L_B7EE:
	call L_B807		;b7ee
	ld l,a			;b7f1
L_B7F2:
	ld h,000h		;b7f2
	ld bc,0c002h		;b7f4
	jr L_B811		;b7f7
L_B7F9:
	ld l,(hl)			;b7f9
	jr L_B7F2		;b7fa
L_B7FC:
	call L_B807		;b7fc
	ld l,000h		;b7ff
	ld h,a			;b801
	ld bc,002c0h		;b802
	jr L_B811		;b805
L_B807:
	ld a,(hl)			;b807
	dec a			;b808
	dec a			;b809
	ret			;b80a
L_B80B:
	ld h,(hl)			;b80b
	ld l,000h		;b80c
	ld bc,002c0h		;b80e
L_B811:
	jp 046fah		;b811
L_B814:
	cp 004h		;b814
	jr nz,L_B81D		;b816
	ld hl,0d7d2h		;b818
	res 1,(hl)		;b81b
L_B81D:
	inc a			;b81d
	ld c,a			;b81e
	ld a,b			;b81f
	rlca			;b820
	rlca			;b821
	rlca			;b822
	ld hl,0e260h		;b823
	call 0423eh		;b826
	ld (hl),c			;b829
	ld b,000h		;b82a
	ld a,(0cad0h)		;b82c
	or a			;b82f
	jr z,L_B838		;b830
	ld a,d			;b832
	cp 060h		;b833
	jr c,L_B838		;b835
	inc b			;b837
L_B838:
	inc l			;b838
	ld (hl),b			;b839
	push bc			;b83a
	inc l			;b83b
	ld (hl),e			;b83c
	inc l			;b83d
	ld (hl),d			;b83e
	inc l			;b83f
	xor a			;b840
	ld (hl),a			;b841
	inc l			;b842
	ld (hl),a			;b843
	inc l			;b844
	ld (hl),a			;b845
	inc l			;b846
	ld (hl),a			;b847
	pop bc			;b848
	ld a,b			;b849
	or a			;b84a
	jr z,L_B861		;b84b
	ld hl,0cad1h		;b84d
	ld (hl),004h		;b850
	inc l			;b852
	ld (hl),000h		;b853
	inc l			;b855
	ld (hl),e			;b856
	ld a,e			;b857
	add a,02eh		;b858
	inc l			;b85a
	ld (hl),a			;b85b
	inc l			;b85c
	ld (hl),d			;b85d
	inc l			;b85e
	ld (hl),000h		;b85f
L_B861:
	ld a,c			;b861
	dec a			;b862
	jp 070aeh		;b863
L_B866:
	rlca			;b866
	rlca			;b867
	rlca			;b868
	ld hl,0e260h		;b869
	call 0423eh		;b86c
	ld a,(hl)			;b86f
	or a			;b870
	ret z			;b871
	xor a			;b872
	ld (hl),a			;b873
	inc l			;b874
	inc l			;b875
	ld e,(hl)			;b876
	inc l			;b877
	ld d,(hl)			;b878
	ld h,d			;b879
	ld l,e			;b87a
	ld bc,02030h		;b87b
	ld a,(0e040h)		;b87e
	or a			;b881
	jr z,L_B887		;b882
	jp 046fah		;b884
L_B887:
	ld a,(0ca01h)		;b887
	cp 004h		;b88a
	jr z,L_B898		;b88c
	ld a,(0d8aah)		;b88e
	or a			;b891
	ret nz			;b892
	ld a,(0d8a9h)		;b893
	or a			;b896
	ret nz			;b897
L_B898:
	xor a			;b898
	ld d,a			;b899
	push bc			;b89a
	push hl			;b89b
	call 046ffh		;b89c
	pop hl			;b89f
	pop bc			;b8a0
	ld a,(0ca2ch)		;b8a1
	or a			;b8a4
	ret nz			;b8a5
	xor a			;b8a6
	ld d,001h		;b8a7
	jp 046ffh		;b8a9
L_B8AC:
	ld a,(0ca03h)		;b8ac
	and 007h		;b8af
	jr nz,L_B8B7		;b8b1
	ld hl,0cab9h		;b8b3
	inc (hl)			;b8b6
L_B8B7:
	ld hl,0e260h		;b8b7
	ld b,002h		;b8ba
L_B8BC:
	ld a,(hl)			;b8bc
	or a			;b8bd
	push hl			;b8be
	push bc			;b8bf
	call nz,L_B8CC		;b8c0
	pop bc			;b8c3
	pop hl			;b8c4
	ld de,00008h		;b8c5
	add hl,de			;b8c8
	djnz L_B8BC		;b8c9
	ret			;b8cb
L_B8CC:
	inc hl			;b8cc
	ld a,(hl)			;b8cd
	dec a			;b8ce
	jr z,L_B8E8		;b8cf
	dec a			;b8d1
	jp z,L_B94C		;b8d2
	dec hl			;b8d5
	ld a,(hl)			;b8d6
	push af			;b8d7
	push hl			;b8d8
	call L_B9A0		;b8d9
	pop hl			;b8dc
	pop bc			;b8dd
	push bc			;b8de
	push hl			;b8df
	call L_B9DE		;b8e0
	pop hl			;b8e3
	pop af			;b8e4
	jp L_BA39		;b8e5
L_B8E8:
	ld d,h			;b8e8
	ld e,l			;b8e9
	ld hl,0cad1h		;b8ea
	dec (hl)			;b8ed
	ret nz			;b8ee
	ld a,(0cad6h)		;b8ef
	xor 001h		;b8f2
	inc a			;b8f4
	ld (hl),a			;b8f5
	push de			;b8f6
	call L_B935		;b8f7
	pop de			;b8fa
	ld hl,0cad2h		;b8fb
	inc (hl)			;b8fe
	ld a,(hl)			;b8ff
	cp 00ch		;b900
	jr nc,L_B906		;b902
	jr L_B968		;b904
L_B906:
	ld hl,0cad6h		;b906
	ld a,(hl)			;b909
	or a			;b90a
	jr z,L_B924		;b90b
	xor a			;b90d
	ld hl,0cad0h		;b90e
	ld (hl),a			;b911
	ld (de),a			;b912
	inc l			;b913
	ld (hl),002h		;b914
	inc l			;b916
	ld (hl),a			;b917
	inc l			;b918
	ld (hl),018h		;b919
	inc l			;b91b
	ld (hl),046h		;b91c
	inc l			;b91e
	ld (hl),090h		;b91f
	inc l			;b921
	ld (hl),a			;b922
	ret			;b923
L_B924:
	inc (hl)			;b924
	dec l			;b925
	ld (hl),090h		;b926
	dec l			;b928
	ld (hl),047h		;b929
	dec l			;b92b
	ld (hl),019h		;b92c
	dec l			;b92e
	ld (hl),000h		;b92f
	dec l			;b931
	ld (hl),001h		;b932
	ret			;b934
L_B935:
	inc l			;b935
	inc l			;b936
	ld e,(hl)			;b937
	inc l			;b938
	ld a,(hl)			;b939
	inc l			;b93a
	ld d,(hl)			;b93b
	push af			;b93c
	push de			;b93d
	call L_B944		;b93e
	pop de			;b941
	pop af			;b942
	ld e,a			;b943
L_B944:
	ld l,e			;b944
	ld h,d			;b945
	ld bc,02001h		;b946
	jp 0475ah		;b949
L_B94C:
	ld d,h			;b94c
	ld e,l			;b94d
	ld hl,0cad1h		;b94e
	dec (hl)			;b951
	ret nz			;b952
	ld a,(0cad6h)		;b953
	xor 001h		;b956
	inc a			;b958
	ld (hl),a			;b959
	push de			;b95a
	call L_B985		;b95b
	pop de			;b95e
	ld hl,0cad2h		;b95f
	inc (hl)			;b962
	ld a,(hl)			;b963
	cp 00ch		;b964
	jr nc,L_B973		;b966
L_B968:
	inc l			;b968
	ld a,(hl)			;b969
	add a,004h		;b96a
	ld (hl),a			;b96c
	inc l			;b96d
	ld a,(hl)			;b96e
	sub 004h		;b96f
	ld (hl),a			;b971
	ret			;b972
L_B973:
	ld hl,0cad6h		;b973
	ld a,(hl)			;b976
	or a			;b977
	jr z,L_B924		;b978
	xor a			;b97a
	ld hl,0cad0h		;b97b
	ld (hl),a			;b97e
	ld (de),a			;b97f
	ld a,001h		;b980
	jp L_B866		;b982
L_B985:
	inc l			;b985
	inc l			;b986
	ld a,(hl)			;b987
	inc l			;b988
	ld d,(hl)			;b989
	inc l			;b98a
	ld h,(hl)			;b98b
	ld l,a			;b98c
	push de			;b98d
	push hl			;b98e
	call L_B995		;b98f
	pop hl			;b992
	pop de			;b993
	ld l,d			;b994
L_B995:
	ld a,(0ca42h)		;b995
	ld d,a			;b998
	xor a			;b999
	ld bc,02001h		;b99a
	jp 046ffh		;b99d
L_B9A0:
	ld a,(0e040h)		;b9a0
	cp 003h		;b9a3
	jr nz,L_B9B8		;b9a5
	ld a,(0e255h)		;b9a7
	or a			;b9aa
	jr z,L_B9B8		;b9ab
	ld a,(0caa3h)		;b9ad
	cp 07ch		;b9b0
	ld a,00ch		;b9b2
	ret z			;b9b4
	ld a,008h		;b9b5
	ret			;b9b7
L_B9B8:
	ld a,(0caa3h)		;b9b8
	ld b,000h		;b9bb
	ld hl,0b9ceh		;b9bd
L_B9C0:
	cp (hl)			;b9c0
	jr z,L_B9CB		;b9c1
	inc b			;b9c3
	inc hl			;b9c4
	bit 4,b		;b9c5
	jr z,L_B9C0		;b9c7
	ld b,000h		;b9c9
L_B9CB:
	ld a,b			;b9cb
	inc a			;b9cc
	ret			;b9cd

; ----------------------------------------------------------------------
; DATOS resto_B9CE: lo apuntan con el banco puesto p03:B9BD (0xB9CE); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p03:B9BD (16 bytes)
;   0xb9ce..0xb9de  (16 bytes)
DATA_resto_B9CE:
	defb 076h,077h,079h,07ah,078h,07bh,07eh,07dh,07fh,07ch,0d4h,0dbh,0deh,000h,000h,000h	; b9ce  vwyzx{~}.|......

; ======================================================================
; CODIGO 0xb9de..0xbae8  (266 bytes)
; ======================================================================


L_B9DE:
	ld e,a			;b9de
	ld a,b			;b9df
	or a			;b9e0
	ret z			;b9e1
	ld a,e			;b9e2
	ld e,000h		;b9e3
	cp b			;b9e5
	jr z,L_B9EA		;b9e6
	ld e,001h		;b9e8
L_B9EA:
	ld a,e			;b9ea
	ld (0d8e2h),a		;b9eb
	ld a,b			;b9ee
	dec a			;b9ef
	push af			;b9f0
	inc hl			;b9f1
	inc hl			;b9f2
	ld e,(hl)			;b9f3
	inc l			;b9f4
	ld d,(hl)			;b9f5
	ld hl,09535h		;b9f6
	call 06302h		;b9f9
	pop af			;b9fc
	push bc			;b9fd
	ld b,a			;b9fe
	ld a,(0cb21h)		;b9ff
	dec a			;ba02
	ld a,b			;ba03
	ld b,000h		;ba04
	jr nz,L_BA0D		;ba06
	or a			;ba08
	jr nz,L_BA0D		;ba09
	ld b,002h		;ba0b
L_BA0D:
	ld a,(0d8e2h)		;ba0d
	or a			;ba10
	ld a,000h		;ba11
	jr nz,L_BA34		;ba13
	ld a,(0e221h)		;ba15
	or a			;ba18
	ld a,000h		;ba19
	jr nz,L_BA34		;ba1b
	ld a,(0caa3h)		;ba1d
	or a			;ba20
	jr z,L_BA34		;ba21
	ld a,(0e228h)		;ba23
	cp 040h		;ba26
	jr nc,L_BA2D		;ba28
	xor a			;ba2a
	jr L_BA34		;ba2b
L_BA2D:
	ld a,(0ca03h)		;ba2d
	rra			;ba30
	rra			;ba31
	and 001h		;ba32
L_BA34:
	add a,b			;ba34
	pop bc			;ba35
	jp 070e4h		;ba36
L_BA39:
	inc hl			;ba39
	inc hl			;ba3a
	ld e,(hl)			;ba3b
	inc l			;ba3c
	ld d,(hl)			;ba3d
	dec a			;ba3e
	ld (0d8e7h),a		;ba3f
	call 064d4h		;ba42
	push af			;ba45
	ld hl,09611h		;ba46
	ld a,(0d8e7h)		;ba49
	call 06302h		;ba4c
	pop af			;ba4f
	jp 070e4h		;ba50
L_BA53:
	xor a			;ba53
	ld (0e1e8h),a		;ba54
	ld (0dff0h),a		;ba57
	ld a,(0cb3fh)		;ba5a
	or a			;ba5d
	jr nz,L_BA64		;ba5e
	xor a			;ba60
	ld (0cae2h),a		;ba61
L_BA64:
	ld a,(0ca76h)		;ba64
	cp 02eh		;ba67
	jr nz,L_BA76		;ba69
	ld a,(0ca5fh)		;ba6b
	or a			;ba6e
	jr z,L_BA76		;ba6f
	ld a,001h		;ba71
	jp L_BB1B		;ba73
L_BA76:
	ld hl,0bae8h		;ba76
L_BA79:
	ld a,(hl)			;ba79
	cp 0ffh		;ba7a
	jr z,L_BA97		;ba7c
	push hl			;ba7e
	ld a,(0ca4ah)		;ba7f
	cp (hl)			;ba82
	jr nz,L_BA91		;ba83
	inc hl			;ba85
	call L_BAC1		;ba86
	jr c,L_BA91		;ba89
	call L_BACD		;ba8b
	jp z,L_BB16		;ba8e
L_BA91:
	pop hl			;ba91
	inc hl			;ba92
	inc hl			;ba93
	inc hl			;ba94
	jr L_BA79		;ba95
L_BA97:
	ld a,(0ca76h)		;ba97
	cp 031h		;ba9a
	jr nz,L_BAA3		;ba9c
	ld a,(0ca5fh)		;ba9e
	or a			;baa1
	ret nz			;baa2
L_BAA3:
	ld a,(0cb21h)		;baa3
	cp 004h		;baa6
	ld a,020h		;baa8
	jr nz,L_BAAE		;baaa
	ld a,040h		;baac
L_BAAE:
	ld (0ca55h),a		;baae
	ld a,040h		;bab1
	ld (0cae5h),a		;bab3
	call L_B1A3		;bab6
	ld a,(0cb3fh)		;bab9
	or a			;babc
	ret nz			;babd
	jp 04309h		;babe
L_BAC1:
	ld a,(hl)			;bac1
	and 00fh		;bac2
	ret z			;bac4
	ld a,(0ca5fh)		;bac5
	and a			;bac8
	ccf			;bac9
	ret z			;baca
	and a			;bacb
	ret			;bacc
L_BACD:
	ld a,(hl)			;bacd
	inc hl			;bace
	and 0f0h		;bacf
	jr nz,L_BAD8		;bad1
L_BAD3:
	ld a,(0ca4bh)		;bad3
	cp (hl)			;bad6
	ret			;bad7
L_BAD8:
	ld a,(0ca76h)		;bad8
	cp 029h		;badb
	ret nz			;badd
	ld a,(0cae0h)		;bade
	dec a			;bae1
	jr z,L_BAD3		;bae2
	xor a			;bae4
	sub 0a0h		;bae5
	ret			;bae7

; ----------------------------------------------------------------------
; DATOS resto_BAE8: lo apuntan con el banco puesto p03:BA76 (0xBAE8), p03:BBAE
;   (0xBAFD); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p03:BA76, p03:BBAE (46 bytes)
;   0xbae8..0xbb16  (46 bytes)
DATA_resto_BAE8:
	defb 003h,000h,001h,003h,000h,002h,003h,000h,007h,007h,010h,002h,007h,010h,003h,007h	; bae8  ................
	defb 010h,004h,007h,010h,005h,003h,001h,003h,003h,001h,004h,003h,001h,008h,003h,001h	; baf8  ................
	defb 009h,003h,001h,00dh,003h,001h,00eh,003h,001h,011h,003h,001h,012h,0ffh	; bb08  ..............

; ======================================================================
; CODIGO 0xbb16..0xbc25  (271 bytes)
; ======================================================================


L_BB16:
	pop hl			;bb16
	inc hl			;bb17
	ld a,(hl)			;bb18
	and 00fh		;bb19
L_BB1B:
	ld (0cac8h),a		;bb1b
	ld hl,0dff0h		;bb1e
	ld (hl),001h		;bb21
	call 08516h		;bb23
	ld a,001h		;bb26
	ld (0cae2h),a		;bb28
	call L_B11F		;bb2b
	xor a			;bb2e
	ld (0dff1h),a		;bb2f
	ld (0dff3h),a		;bb32
	call L_BC07		;bb35
L_BB38:
	call 07059h		;bb38
	ld a,(0cb21h)		;bb3b
	cp 004h		;bb3e
	ld a,040h		;bb40
	jr z,L_BB46		;bb42
	ld a,020h		;bb44
L_BB46:
	call 042b0h		;bb46
	jp 04331h		;bb49
L_BB4C:
	ld a,(0dff0h)		;bb4c
	or a			;bb4f
	jr z,L_BB91		;bb50
	ld (0cae2h),a		;bb52
	ld a,(0d8c0h)		;bb55
	or a			;bb58
	jr nz,L_BB9A		;bb59
	ld a,(0cac8h)		;bb5b
	or a			;bb5e
	jr z,L_BB76		;bb5f
	ld a,(0ca5fh)		;bb61
	or a			;bb64
	jr nz,L_BB76		;bb65
	ld (0cae2h),a		;bb67
	call 04309h		;bb6a
	call 08475h		;bb6d
	call L_BBFF		;bb70
	jp L_B1A3		;bb73
L_BB76:
	ld a,(0ca53h)		;bb76
	or a			;bb79
	jr z,L_BB87		;bb7a
	call L_BC29		;bb7c
	ld a,(0ca41h)		;bb7f
	or a			;bb82
	jr nz,L_BBFF		;bb83
	jr L_BBC7		;bb85
L_BB87:
	xor a			;bb87
	ld (0dff0h),a		;bb88
	call 08475h		;bb8b
	jp L_AC02		;bb8e
L_BB91:
	ld hl,0e258h		;bb91
	ld a,(hl)			;bb94
	or a			;bb95
	jr z,L_BBA2		;bb96
	ld (hl),000h		;bb98
L_BB9A:
	call 04309h		;bb9a
	call L_B1A3		;bb9d
	jr L_BBFF		;bba0
L_BBA2:
	ld a,(0ca5fh)		;bba2
	cp 002h		;bba5
	ret c			;bba7
	ld a,(0ca76h)		;bba8
	or a			;bbab
	jr nz,L_BBB4		;bbac
	ld hl,0bafdh		;bbae
	jp L_BA79		;bbb1
L_BBB4:
	ld a,(0ca76h)		;bbb4
	cp 00dh		;bbb7
	jr z,L_BBC2		;bbb9
	cp 02eh		;bbbb
	jr z,L_BBC2		;bbbd
	cp 031h		;bbbf
	ret nz			;bbc1
L_BBC2:
	ld a,001h		;bbc2
	jp L_BB1B		;bbc4
L_BBC7:
	ld a,(0cb3ch)		;bbc7
	or a			;bbca
	ret nz			;bbcb
	ld hl,0dff2h		;bbcc
	dec (hl)			;bbcf
	ret nz			;bbd0
	call L_BC07		;bbd1
	ld a,(0ca55h)		;bbd4
	or a			;bbd7
	jr z,L_BBEB		;bbd8
	call L_BBE0		;bbda
	jp 04331h		;bbdd
L_BBE0:
	ld hl,0ca55h		;bbe0
L_BBE3:
	ld a,(hl)			;bbe3
	sub 002h		;bbe4
	jr nc,L_BBE9		;bbe6
	xor a			;bbe8
L_BBE9:
	ld (hl),a			;bbe9
	ret			;bbea
L_BBEB:
	call L_BBF1		;bbeb
	jp 04288h		;bbee
L_BBF1:
	ld hl,0ca53h		;bbf1
	call L_BBE3		;bbf4
	ld a,(0ca53h)		;bbf7
	or a			;bbfa
	ret nz			;bbfb
	jp 08bb8h		;bbfc
L_BBFF:
	xor a			;bbff
	ld (0dff0h),a		;bc00
	ld (0e1e8h),a		;bc03
	ret			;bc06
L_BC07:
	ld b,000h		;bc07
	ld a,(0cb00h)		;bc09
	cp 002h		;bc0c
	jr nz,L_BC12		;bc0e
	ld b,002h		;bc10
L_BC12:
	ld a,(0cb21h)		;bc12
	cp 004h		;bc15
	jr nz,L_BC1A		;bc17
	inc b			;bc19
L_BC1A:
	ld a,b			;bc1a
	ld hl,0bc25h		;bc1b
	call 04248h		;bc1e
	ld (0dff2h),a		;bc21
	ret			;bc24

; ----------------------------------------------------------------------
; DATOS resto_BC25: lo apuntan con el banco puesto p03:BC1B (0xBC25); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p03:BC1B (4 bytes)
;   0xbc25..0xbc29  (4 bytes)
DATA_resto_BC25:
	defb 008h,010h,010h,018h	; bc25

; ======================================================================
; CODIGO 0xbc29..0xbd33  (266 bytes)
; ======================================================================


L_BC29:
	ld a,(0ca03h)		;bc29
	ld b,a			;bc2c
	and 003h		;bc2d
	ret nz			;bc2f
	ld a,b			;bc30
	rra			;bc31
	rra			;bc32
	and 00fh		;bc33
	jp z,08475h		;bc35
	ld b,000h		;bc38
	cp 00ah		;bc3a
	jr z,L_BC47		;bc3c
	inc b			;bc3e
	cp 00ch		;bc3f
	jr z,L_BC47		;bc41
	inc b			;bc43
	cp 00eh		;bc44
	ret nz			;bc46
L_BC47:
	ld a,b			;bc47
	jp 08516h		;bc48
L_BC4B:
	ld a,(0cb21h)		;bc4b
	cp 002h		;bc4e
	ret z			;bc50
	ld a,(0ca41h)		;bc51
	or a			;bc54
	ret nz			;bc55
	call L_BC7C		;bc56
	ret c			;bc59
	ld ix,0d7c0h		;bc5a
	ld b,004h		;bc5e
L_BC60:
	call L_BCB0		;bc60
	jr nz,L_BC72		;bc63
	exx			;bc65
	call L_BCBA		;bc66
	exx			;bc69
	jr nc,L_BC72		;bc6a
	call 08bc0h		;bc6c
	call c,L_BCDF		;bc6f
L_BC72:
	exx			;bc72
	ld de,00004h		;bc73
	add ix,de		;bc76
	exx			;bc78
	djnz L_BC60		;bc79
	ret			;bc7b
L_BC7C:
	ld a,(0ca4ah)		;bc7c
	cp 012h		;bc7f
	jr z,L_BC9B		;bc81
	ld hl,0d7c0h		;bc83
	ld b,004h		;bc86
L_BC88:
	ld a,(hl)			;bc88
	cp 023h		;bc89
	jr z,L_BC9D		;bc8b
	cp 024h		;bc8d
	jr z,L_BC9D		;bc8f
	cp 029h		;bc91
	jr z,L_BC9D		;bc93
	ld de,00004h		;bc95
	add hl,de			;bc98
	djnz L_BC88		;bc99
L_BC9B:
	and a			;bc9b
	ret			;bc9c
L_BC9D:
	ld hl,0df80h		;bc9d
	ld b,008h		;bca0
	ld de,00008h		;bca2
L_BCA5:
	ld a,(hl)			;bca5
	or a			;bca6
	jr nz,L_BCAE		;bca7
	add hl,de			;bca9
	djnz L_BCA5		;bcaa
	and a			;bcac
	ret			;bcad
L_BCAE:
	scf			;bcae
	ret			;bcaf
L_BCB0:
	ld a,(ix+001h)		;bcb0
	rra			;bcb3
	jp nc,08bd8h		;bcb4
	jp 08be0h		;bcb7
L_BCBA:
	ld a,(ix+000h)		;bcba
	and a			;bcbd
	ret z			;bcbe
	ld a,(ix+002h)		;bcbf
	rra			;bcc2
	jr nc,L_BCCA		;bcc3
	ld a,(0cb31h)		;bcc5
	and a			;bcc8
	ret nz			;bcc9
L_BCCA:
	ld a,(ix+001h)		;bcca
	and 0feh		;bccd
	add a,010h		;bccf
	ld l,a			;bcd1
	ld a,(ix+002h)		;bcd2
	and 0feh		;bcd5
	add a,008h		;bcd7
	ld h,a			;bcd9
	ld de,00810h		;bcda
	scf			;bcdd
	ret			;bcde
L_BCDF:
	push bc			;bcdf
	push ix		;bce0
	pop hl			;bce2
	ld a,(hl)			;bce3
	push af			;bce4
	ld e,l			;bce5
	ld d,h			;bce6
	inc de			;bce7
	inc de			;bce8
	inc de			;bce9
	ld a,(de)			;bcea
	rla			;bceb
	push hl			;bcec
	call nc,L_BD7A		;bced
	pop hl			;bcf0
	call L_BCFD		;bcf1
	pop af			;bcf4
	call L_BCFA		;bcf5
	pop bc			;bcf8
	ret			;bcf9
L_BCFA:
	jp 06a38h		;bcfa
L_BCFD:
	ld e,l			;bcfd
	ld d,h			;bcfe
	inc hl			;bcff
	inc hl			;bd00
	inc hl			;bd01
	ld a,(hl)			;bd02
	ex de,hl			;bd03
	bit 6,a		;bd04
	jr nz,L_BD15		;bd06
	and 03fh		;bd08
	cp 03fh		;bd0a
	jr z,L_BD20		;bd0c
	push hl			;bd0e
	call L_B0CE		;bd0f
	pop hl			;bd12
	jr L_BD20		;bd13
L_BD15:
	and 03fh		;bd15
	cp 009h		;bd17
	jr z,L_BD20		;bd19
	push hl			;bd1b
	call L_B0D3		;bd1c
	pop hl			;bd1f
L_BD20:
	ld a,(hl)			;bd20
	ld (hl),000h		;bd21
	call L_BD86		;bd23
	push af			;bd26
	call 08b78h		;bd27
	pop af			;bd2a
	sub 01ch		;bd2b
	cp 006h		;bd2d
	ret nc			;bd2f
	call 0424dh		;bd30

; ----------------------------------------------------------------------
; DATOS tabla_BD33: 6 destinos del despachador p00:424D (call en p03:BD30, el
;   indice en A): 8AEF, 8B27, BDB2, BD3F, BD4C, BD59; lo leen p03:BD30 (12
;   bytes)
;   0xbd33..0xbd3f  (12 bytes)
DATA_tabla_BD33:
	defw 08aefh,08b27h,0bdb2h,0bd3fh,0bd4ch,0bd59h	; bd33

; ======================================================================
; CODIGO 0xbd3f..0xbfd8  (665 bytes)
; ======================================================================


L_BD3F:
	ld hl,0d684h		;bd3f
	call L_BD66		;bd42
	ld bc,01417h		;bd45
	ld e,011h		;bd48
	jr L_BD6C		;bd4a
L_BD4C:
	ld hl,0d690h		;bd4c
	call L_BD66		;bd4f
	ld bc,0171ah		;bd52
	ld e,012h		;bd55
	jr L_BD6C		;bd57
L_BD59:
	ld hl,0d69ch		;bd59
	call L_BD66		;bd5c
	ld bc,01a1dh		;bd5f
	ld e,013h		;bd62
	jr L_BD6C		;bd64
L_BD66:
	ld bc,0000bh		;bd66
	jp 04236h		;bd69
L_BD6C:
	ld a,(0cb21h)		;bd6c
	cp b			;bd6f
	ret c			;bd70
	cp c			;bd71
	ret nc			;bd72
	ld a,e			;bd73
	ld (0cb21h),a		;bd74
	jp 08c1ch		;bd77
L_BD7A:
	push hl			;bd7a
	call L_BF55		;bd7b
	pop hl			;bd7e
	jp 0929ah		;bd7f
L_BD82:
	cp 032h		;bd82
	jr nc,L_BD9B		;bd84
L_BD86:
	push af			;bd86
	dec a			;bd87
	push af			;bd88
	call L_BDAD		;bd89
	pop af			;bd8c
	call L_BDB3		;bd8d
	call L_BE0B		;bd90
	pop af			;bd93
	push af			;bd94
	dec a			;bd95
	call L_BECE		;bd96
	pop af			;bd99
	ret			;bd9a
L_BD9B:
	dec a			;bd9b
	call L_BECE		;bd9c
	ld hl,0cac7h		;bd9f
	ld (hl),001h		;bda2
	ret			;bda4
L_BDA5:
	ld bc,00107h		;bda5
	call L_BDBC		;bda8
	jr L_BE0B		;bdab
L_BDAD:
	call L_BE03		;bdad
	ld (hl),001h		;bdb0
L_BDB2:
	ret			;bdb2
L_BDB3:
	ld c,a			;bdb3
	call 087e9h		;bdb4
	ld b,a			;bdb7
	cp 0ffh		;bdb8
	jr z,L_BDF5		;bdba
L_BDBC:
	ld a,c			;bdbc
L_BDBD:
	call L_BE03		;bdbd
	inc hl			;bdc0
	ld (0d8f0h),hl		;bdc1
	ld a,(hl)			;bdc4
	add a,b			;bdc5
	daa			;bdc6
	ld (hl),a			;bdc7
	inc hl			;bdc8
	ld e,a			;bdc9
	ld d,(hl)			;bdca
	jr nc,L_BDD1		;bdcb
	call L_BEAC		;bdcd
	ld d,a			;bdd0
L_BDD1:
	ld a,c			;bdd1
	cp 00dh		;bdd2
	jr c,L_BDE4		;bdd4
	cp 02dh		;bdd6
	ret c			;bdd8
	cp 030h		;bdd9
	ret nc			;bddb
	ld hl,lbe8ch		;bddc
	call 08847h		;bddf
	jr L_BDE7		;bde2
L_BDE4:
	call 0883ch		;bde4
L_BDE7:
	and a			;bde7
	push hl			;bde8
	sbc hl,de		;bde9
	pop hl			;bdeb
	ret nc			;bdec
	ex de,hl			;bded
	ld hl,(0d8f0h)		;bdee
	ld (hl),e			;bdf1
	inc hl			;bdf2
	ld (hl),d			;bdf3
	ret			;bdf4
L_BDF5:
	xor a			;bdf5
	ld bc,05000h		;bdf6
	call L_BDBD		;bdf9
	ld a,001h		;bdfc
	ld bc,06001h		;bdfe
	jr L_BDBD		;be01
L_BE03:
	ld hl,0d600h		;be03
	add a,a			;be06
	add a,a			;be07
	jp 0423eh		;be08
L_BE0B:
	call L_BE10		;be0b
	jr L_BE22		;be0e
L_BE10:
	ld a,(0ca01h)		;be10
	or a			;be13
	ld a,(0cb20h)		;be14
	jr z,L_BE1C		;be17
	ld a,(0d704h)		;be19
L_BE1C:
	dec a			;be1c
	ld de,0e088h		;be1d
	jr L_BE39		;be20
L_BE22:
	ld a,(0ca01h)		;be22
	or a			;be25
	ld a,(0cb21h)		;be26
	jr z,L_BE2E		;be29
	ld a,(0d704h)		;be2b
L_BE2E:
	cp 020h		;be2e
	ret c			;be30
	cp 023h		;be31
	ret nc			;be33
	add a,00dh		;be34
	ld de,0e0b8h		;be36
L_BE39:
	call L_BE03		;be39
	inc hl			;be3c
	inc hl			;be3d
	call 09331h		;be3e
	ret			;be41
L_BE42:
	ld de,0d600h		;be42
L_BE45:
	call L_BE93		;be45
	ld a,(hl)			;be48
	or a			;be49
	ret nz			;be4a
	inc hl			;be4b
	ld a,(hl)			;be4c
	or a			;be4d
	ret nz			;be4e
	scf			;be4f
	ret			;be50
L_BE51:
	ld de,0d600h		;be51
	call L_BE93		;be54
	dec hl			;be57
	ld (hl),001h		;be58
	inc hl			;be5a
	call L_BEA7		;be5b
	jr L_BE10		;be5e
L_BE60:
	push af			;be60
	ld de,0d600h		;be61
	call L_BE93		;be64
	call L_BE9C		;be67
	call L_BE10		;be6a
	pop af			;be6d
	cp 002h		;be6e
	ret z			;be70
	cp 001h		;be71
	ret z			;be73
	call L_BE42		;be74
	ret nc			;be77
	dec hl			;be78
	dec hl			;be79
	xor a			;be7a
	ld (hl),a			;be7b
	ld (0cb20h),a		;be7c
	ld (0cb00h),a		;be7f
	ld (0cb01h),a		;be82
	ld (0cb35h),a		;be85
	ld a,(0d8a4h)		;be88
	or a			;be8b
L_BE8C:
	ret nz			;be8c
	ld hl,0d874h		;be8d
	jp 09319h		;be90
L_BE93:
	dec a			;be93
	ld l,a			;be94
	ld h,000h		;be95
	add hl,hl			;be97
	add hl,hl			;be98
	add hl,de			;be99
	inc hl			;be9a
	ret			;be9b
L_BE9C:
	call L_BEA1		;be9c
	inc hl			;be9f
	ret nc			;bea0
L_BEA1:
	ld a,(hl)			;bea1
	sub 001h		;bea2
	daa			;bea4
	ld (hl),a			;bea5
	ret			;bea6
L_BEA7:
	call L_BEAC		;bea7
	inc hl			;beaa
	ret nc			;beab
L_BEAC:
	ld a,(hl)			;beac
	add a,001h		;bead
	daa			;beaf
	ld (hl),a			;beb0
	ret			;beb1
L_BEB2:
	ld de,0d638h		;beb2
	jr L_BE45		;beb5
L_BEB7:
	push af			;beb7
	ld de,0d638h		;beb8
	call L_BE93		;bebb
	call L_BE9C		;bebe
	call L_BE22		;bec1
	pop af			;bec4
	call L_BE42		;bec5
	ret nc			;bec8
	dec hl			;bec9
	dec hl			;beca
	ld (hl),000h		;becb
	ret			;becd
L_BECE:
	push af			;bece
	ld hl,0caa8h		;becf
	ld (hl),001h		;bed2
	call L_BEE5		;bed4
	push hl			;bed7
	push bc			;bed8
	call L_BEF4		;bed9
	pop bc			;bedc
	pop hl			;bedd
	call L_BEFF		;bede
	pop af			;bee1
	jp 0631ah		;bee2
L_BEE5:
	ld hl,0300ch		;bee5
	ld bc,06018h		;bee8
	ld a,(0cb03h)		;beeb
	cp 070h		;beee
	ret nc			;bef0
	ld l,09ch		;bef1
	ret			;bef3
L_BEF4:
	ld de,030e0h		;bef4
	ld a,(0ca42h)		;bef7
	and 001h		;befa
	jp 04767h		;befc
L_BEFF:
	ld a,(0ca42h)		;beff
	ld d,a			;bf02
	ld a,099h		;bf03
	push hl			;bf05
	push bc			;bf06
	call 046ffh		;bf07
	pop de			;bf0a
	pop hl			;bf0b
	ld a,(0ca42h)		;bf0c
	ld c,007h		;bf0f
	jp 046bch		;bf11
L_BF14:
	ld hl,0cac7h		;bf14
	ld a,(hl)			;bf17
	cp 002h		;bf18
	jr nz,L_BF24		;bf1a
	ld a,(0ca07h)		;bf1c
	and 03fh		;bf1f
	ret z			;bf21
	jr L_BF31		;bf22
L_BF24:
	ld a,(0ca08h)		;bf24
	and 030h		;bf27
	jr nz,L_BF31		;bf29
	ld a,(0ca07h)		;bf2b
	and 03fh		;bf2e
	ret z			;bf30
L_BF31:
	ld a,(hl)			;bf31
	or a			;bf32
	jr nz,L_BF4A		;bf33
	xor a			;bf35
	ld (0caa8h),a		;bf36
	call L_BEE5		;bf39
	ld de,030e0h		;bf3c
	ex de,hl			;bf3f
	ld a,(0ca42h)		;bf40
	rlca			;bf43
	rlca			;bf44
	and 00ch		;bf45
	jp 04767h		;bf47
L_BF4A:
	ld (hl),000h		;bf4a
	call L_BEE5		;bf4c
	call L_BEFF		;bf4f
	jp 0634ch		;bf52
L_BF55:
	ld a,(0cb21h)		;bf55
	cp 003h		;bf58
	jr z,L_BF86		;bf5a
	ld a,(0ca4ah)		;bf5c
	cp 003h		;bf5f
	jr nz,L_BF88		;bf61
	ld a,(0ca76h)		;bf63
	or a			;bf66
	jr nz,L_BF7F		;bf67
	ld hl,0cac9h		;bf69
	ld a,(0ca4bh)		;bf6c
	or a			;bf6f
	jr z,L_BFAB		;bf70
	cp 005h		;bf72
	jr z,L_BFAB		;bf74
	ld hl,0cacah		;bf76
	cp 010h		;bf79
	jr z,L_BFAB		;bf7b
	or a			;bf7d
	ret			;bf7e
L_BF7F:
	ld hl,0cacbh		;bf7f
	cp 00ch		;bf82
	jr z,L_BFAB		;bf84
L_BF86:
	or a			;bf86
	ret			;bf87
L_BF88:
	ld a,(0ca4ah)		;bf88
	cp 004h		;bf8b
	jr nz,L_BF86		;bf8d
	ld a,(0ca76h)		;bf8f
	or a			;bf92
	ret nz			;bf93
	ld hl,0cacch		;bf94
	ld a,(0ca4bh)		;bf97
	cp 005h		;bf9a
	jr z,L_BFAB		;bf9c
	ld hl,0cacdh		;bf9e
	cp 00eh		;bfa1
	jr z,L_BFAB		;bfa3
	cp 013h		;bfa5
	jr z,L_BFAB		;bfa7
	or a			;bfa9
	ret			;bfaa
L_BFAB:
	ld a,(hl)			;bfab
	or a			;bfac
	ret z			;bfad
	scf			;bfae
	ret			;bfaf
L_BFB0:
	or a			;bfb0
	jr z,$+49		;bfb1
	call 06bdch		;bfb3
	ld a,(0d8a4h)		;bfb6
	or a			;bfb9
	ret nz			;bfba
	call 06de9h		;bfbb
	ld hl,04c58h		;bfbe
	ld de,0c000h		;bfc1
	ld bc,02810h		;bfc4
	push hl			;bfc7
	call 0474dh		;bfc8
	pop de			;bfcb
	ld hl,0bfd8h		;bfcc
	ld bc,00205h		;bfcf
	call 050c4h		;bfd2
	jp 0722ch		;bfd5

; ----------------------------------------------------------------------
; DATOS resto_BFD8: lo apuntan con el banco puesto p03:BFCC (0xBFD8); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p03:BFCC (10 bytes)
;   0xbfd8..0xbfe2  (10 bytes)
DATA_resto_BFD8:
	defb 01ah,001h,00fh,01dh,009h,01bh,002h,019h,01eh,00ah	; bfd8  ..........

; ======================================================================
; CODIGO 0xbfe2..0xc000  (30 bytes)
; ======================================================================


L_BFE2:
	call 06bd8h		;bfe2
	ld a,(0d8a4h)		;bfe5
	or a			;bfe8
	ret nz			;bfe9
	ld hl,0c000h		;bfea
	ld de,04c58h		;bfed
	ld bc,02810h		;bff0
	push hl			;bff3
	call 0475ah		;bff4
	pop hl			;bff7
	ld e,l			;bff8
	ld d,h			;bff9
	ld bc,04010h		;bffa
	jp 0474dh		;bffd
