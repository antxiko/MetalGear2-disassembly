; ==========================================================================
; METAL GEAR 2 SOLID SNAKE - Konami (1990) - MSX2 - MegaROM RC-767 de 512 KB (Konami SCC) - banco 07 (se ejecuta en 0xa000)
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
lb520h:	equ 0x0b520
lb534h:	equ 0x0b534
lb55ah:	equ 0x0b55a

; ======================================================================
; CODIGO 0xa000..0xa012  (18 bytes)
; ======================================================================


L_A000:
	ld hl,0d8c0h		;a000
	ld bc,0000dh		;a003
	jp 04236h		;a006
L_A009:
	call L_A03A		;a009
	ld a,(0d8c1h)		;a00c
	call 0424dh		;a00f

; ----------------------------------------------------------------------
; DATOS tabla_A012: 20 destinos del despachador p00:424D (call en p07:A00F, el
;   indice en A): A054, A07B, A0B0, A0C6, A0E2, A15A, A17B, A19C, A1C1, A1D4,
;   A276, A29D, A2C3, A2E9, A315, A329, A356, A3A9, A3CE, A3F3; lo leen
;   p07:A00F (40 bytes)
;   0xa012..0xa03a  (40 bytes)
DATA_tabla_A012:
	defw 0a054h,0a07bh,0a0b0h,0a0c6h,0a0e2h,0a15ah,0a17bh,0a19ch	; a012
	defw 0a1c1h,0a1d4h,0a276h,0a29dh,0a2c3h,0a2e9h,0a315h,0a329h	; a022
	defw 0a356h,0a3a9h,0a3ceh,0a3f3h	; a032  -> L_A356 L_A3A9 L_A3CE L_A3F3

; ======================================================================
; CODIGO 0xa03a..0xa686  (1612 bytes)
; ======================================================================


L_A03A:
	ld a,(0d8c2h)		;a03a
	or a			;a03d
	ret z			;a03e
	ld a,(0d8ceh)		;a03f
	or a			;a042
	jr nz,L_A04A		;a043
	ld a,(0ca41h)		;a045
	or a			;a048
	ret z			;a049
L_A04A:
	xor a			;a04a
	ld (0d8c9h),a		;a04b
	ld (0d4e9h),a		;a04e
	jp L_A2FF		;a051
L_A054:
	call L_A667		;a054
	call L_A50A		;a057
	ld a,(0d8c2h)		;a05a
	or a			;a05d
	ret z			;a05e
	xor a			;a05f
	ld (0d8ceh),a		;a060
	call L_A5D7		;a063
	ld b,006h		;a066
	call L_A0A2		;a068
	ld (hl),001h		;a06b
	call L_A076		;a06d
	call L_A83A		;a070
	jp 06c33h		;a073
L_A076:
	ld hl,0d8c1h		;a076
	inc (hl)			;a079
	ret			;a07a
L_A07B:
	ld b,005h		;a07b
	call L_A0A2		;a07d
	ld a,(0d8cdh)		;a080
	cp (hl)			;a083
	ret nz			;a084
	call L_A093		;a085
	call L_A076		;a088
	ld hl,0d8c3h		;a08b
	ld (hl),020h		;a08e
	jp 06a58h		;a090
L_A093:
	ld b,003h		;a093
	call L_A0A2		;a095
	ld de,0d8cbh		;a098
	ldi		;a09b
	ldi		;a09d
	ldi		;a09f
	ret			;a0a1
L_A0A2:
	ld a,(0d8c2h)		;a0a2
	dec a			;a0a5
	add a,a			;a0a6
	add a,a			;a0a7
	add a,a			;a0a8
	add a,b			;a0a9
	ld hl,0dc80h		;a0aa
	jp 0423eh		;a0ad
L_A0B0:
	ld hl,0d8c3h		;a0b0
	dec (hl)			;a0b3
	ret nz			;a0b4
	call L_A5C3		;a0b5
	call L_A076		;a0b8
	ld a,001h		;a0bb
	ld (0d4e9h),a		;a0bd
	call L_A83A		;a0c0
	jp 06a4ch		;a0c3
L_A0C6:
	ld a,(0d8c9h)		;a0c6
	add a,002h		;a0c9
	ld (0d8c9h),a		;a0cb
	call L_A8D1		;a0ce
	ld a,(0d8c9h)		;a0d1
	cp 010h		;a0d4
	ret nz			;a0d6
	ld a,040h		;a0d7
	ld (0d8c3h),a		;a0d9
	xor a			;a0dc
	ld (0d4e9h),a		;a0dd
	jr L_A076		;a0e0
L_A0E2:
	call L_A129		;a0e2
	jr nc,L_A116		;a0e5
	call L_A40D		;a0e7
	ld a,(0caa0h)		;a0ea
	or a			;a0ed
	jr nz,L_A10D		;a0ee
	ld a,(0ca76h)		;a0f0
	cp 018h		;a0f3
	jr nz,L_A10D		;a0f5
	ld a,027h		;a0f7
	call 08d7dh		;a0f9
	jr nz,L_A10D		;a0fc
	ld a,001h		;a0fe
	ld (0caa0h),a		;a100
	ld hl,0d7d4h		;a103
	set 1,(hl)		;a106
	ld hl,0d7deh		;a108
	res 4,(hl)		;a10b
L_A10D:
	call 08d75h		;a10d
	call L_A076		;a110
	jp L_A076		;a113
L_A116:
	ld hl,0d8c3h		;a116
	dec (hl)			;a119
	ret nz			;a11a
	call L_A076		;a11b
	ld a,001h		;a11e
	ld (0d4e9h),a		;a120
	call L_A862		;a123
	jp 06a4ch		;a126
L_A129:
	ld a,(0cb0eh)		;a129
	dec a			;a12c
	jr nz,L_A158		;a12d
	ld a,(0cb21h)		;a12f
	cp 00ah		;a132
	jr z,L_A158		;a134
	cp 00bh		;a136
	jr z,L_A158		;a138
	ld a,(0d8c8h)		;a13a
	ld b,a			;a13d
	sub 004h		;a13e
	ld c,a			;a140
	ld a,(0cb03h)		;a141
	cp b			;a144
	ret nc			;a145
	cp c			;a146
	jr c,L_A158		;a147
	ld a,(0d8c7h)		;a149
	ld b,a			;a14c
	add a,020h		;a14d
	ld c,a			;a14f
	ld a,(0cb05h)		;a150
	cp b			;a153
	jr c,L_A158		;a154
	cp c			;a156
	ret			;a157
L_A158:
	and a			;a158
	ret			;a159
L_A15A:
	ld a,(0d8c9h)		;a15a
	sub 002h		;a15d
	ld (0d8c9h),a		;a15f
	call L_A8D1		;a162
	ld a,(0d8c9h)		;a165
	or a			;a168
	ret nz			;a169
	ld b,006h		;a16a
	call L_A0A2		;a16c
	xor a			;a16f
	ld (hl),a			;a170
	ld (0d4e9h),a		;a171
	ld (0d8c1h),a		;a174
	ld (0d8c2h),a		;a177
	ret			;a17a
L_A17B:
	call L_A69A		;a17b
	ld a,(0d8c1h)		;a17e
	cp 00dh		;a181
	ret nc			;a183
	call L_A61D		;a184
	ld a,(0d8c4h)		;a187
	or a			;a18a
	ret z			;a18b
	ld a,010h		;a18c
	ld (0d8c9h),a		;a18e
	ld a,002h		;a191
	ld (0d8c3h),a		;a193
	call L_A076		;a196
	jp 06c33h		;a199
L_A19C:
	ld hl,0d8c3h		;a19c
	dec (hl)			;a19f
	ret nz			;a1a0
	ld a,002h		;a1a1
	ld (hl),a			;a1a3
	ld a,(0d8c9h)		;a1a4
	sub 002h		;a1a7
	ld (0d8c9h),a		;a1a9
	call L_A8D1		;a1ac
	ld a,(0d8c9h)		;a1af
	or a			;a1b2
	ret nz			;a1b3
	ld a,010h		;a1b4
	ld (0d8c3h),a		;a1b6
	ld a,002h		;a1b9
	ld (0ca77h),a		;a1bb
	jp L_A076		;a1be
L_A1C1:
	ld hl,0d8c3h		;a1c1
	dec (hl)			;a1c4
	ret nz			;a1c5
	ld hl,0d8c3h		;a1c6
	ld (hl),018h		;a1c9
	call L_A918		;a1cb
	call 06b1ah		;a1ce
	jp L_A076		;a1d1
L_A1D4:
	ld a,(0d8a0h)		;a1d4
	or a			;a1d7
	ret nz			;a1d8
	call L_ABA2		;a1d9
	call L_A95D		;a1dc
	ld hl,0d8c3h		;a1df
	dec (hl)			;a1e2
	jr z,L_A203		;a1e3
	ld a,(hl)			;a1e5
	cp 008h		;a1e6
	ret nz			;a1e8
	ld a,(0d8c4h)		;a1e9
	ld b,0ffh		;a1ec
	dec a			;a1ee
	jr z,L_A1F3		;a1ef
	ld b,001h		;a1f1
L_A1F3:
	ld a,(0d8d2h)		;a1f3
	add a,b			;a1f6
	or a			;a1f7
	jr nz,L_A1FB		;a1f8
	add a,b			;a1fa
L_A1FB:
	ld hl,0d8cdh		;a1fb
	cp (hl)			;a1fe
	jp z,06a58h		;a1ff
	ret			;a202
L_A203:
	ld a,(0d8c4h)		;a203
	ld b,001h		;a206
	dec a			;a208
	jr z,L_A20D		;a209
	ld b,0ffh		;a20b
L_A20D:
	ld hl,0d8cdh		;a20d
	ld a,(hl)			;a210
	add a,b			;a211
	or a			;a212
	jr nz,L_A216		;a213
	add a,b			;a215
L_A216:
	ld (hl),a			;a216
	call 071c2h		;a217
	call L_A248		;a21a
	ld a,(0d8a0h)		;a21d
	or a			;a220
	ret nz			;a221
	ld b,018h		;a222
	ld a,(0d8c2h)		;a224
	cp 004h		;a227
	jr c,L_A231		;a229
	cp 007h		;a22b
	jr nc,L_A231		;a22d
	ld b,00ch		;a22f
L_A231:
	ld hl,0d8c3h		;a231
	ld (hl),b			;a234
	ld a,(0d8cdh)		;a235
	ld hl,0d8d2h		;a238
	cp (hl)			;a23b
	ret nz			;a23c
	ld hl,0d8c3h		;a23d
	ld (hl),008h		;a240
	call L_AB9B		;a242
	jp L_A076		;a245
L_A248:
	ld a,(0d8cdh)		;a248
	cp 013h		;a24b
	ret nz			;a24d
	ld a,(0d658h)		;a24e
	or a			;a251
	ret z			;a252
	ld a,(0d8c2h)		;a253
	cp 005h		;a256
	ret nz			;a258
	ld a,(0d8c4h)		;a259
	dec a			;a25c
	ret nz			;a25d
	ld a,002h		;a25e
	ld (0d8c4h),a		;a260
	call L_A918		;a263
	ld a,00fh		;a266
	ld (0d8c1h),a		;a268
	call L_AB96		;a26b
	ld hl,0d8c3h		;a26e
	ld (hl),010h		;a271
	jp 06a58h		;a273
L_A276:
	ld hl,0d8c3h		;a276
	dec (hl)			;a279
	jr z,L_A282		;a27a
	ld a,(hl)			;a27c
	cp 005h		;a27d
	ret nc			;a27f
	jr L_A28D		;a280
L_A282:
	ld (hl),020h		;a282
	call L_A076		;a284
	call L_A296		;a287
	jp 06a54h		;a28a
L_A28D:
	ld a,(0d8c3h)		;a28d
	dec a			;a290
	ld b,0e0h		;a291
	rra			;a293
	jr c,L_A298		;a294
L_A296:
	ld b,000h		;a296
L_A298:
	ld c,012h		;a298
	jp 00047h		;a29a   ; BIOS WRTVDP - Writes data in the VDP-register
L_A29D:
	ld hl,0d8c3h		;a29d
	dec (hl)			;a2a0
	jr z,L_A2B8		;a2a1
	call L_A61D		;a2a3
	ld a,(0d8c4h)		;a2a6
	or a			;a2a9
	ret z			;a2aa
	ld a,008h		;a2ab
	ld (0d8c1h),a		;a2ad
	ld a,010h		;a2b0
	ld (0d8c3h),a		;a2b2
	jp 06c33h		;a2b5
L_A2B8:
	ld a,002h		;a2b8
	ld (0d8c3h),a		;a2ba
	call L_A076		;a2bd
	jp 06a4ch		;a2c0
L_A2C3:
	ld hl,0d8c3h		;a2c3
	dec (hl)			;a2c6
	ret nz			;a2c7
	ld a,002h		;a2c8
	ld (0d8c3h),a		;a2ca
	ld a,(0d8c9h)		;a2cd
	add a,002h		;a2d0
	ld (0d8c9h),a		;a2d2
	call L_A8D1		;a2d5
	ld a,(0d8c9h)		;a2d8
	cp 010h		;a2db
	ret nz			;a2dd
	ld a,001h		;a2de
	ld (0ca77h),a		;a2e0
	ld a,006h		;a2e3
	ld (0d8c1h),a		;a2e5
	ret			;a2e8
L_A2E9:
	ld a,(0ca41h)		;a2e9
	or a			;a2ec
	jr nz,L_A2FF		;a2ed
	ld a,(0d8c9h)		;a2ef
	sub 002h		;a2f2
	ld (0d8c9h),a		;a2f4
	call L_A8D1		;a2f7
	ld a,(0d8c9h)		;a2fa
	or a			;a2fd
	ret nz			;a2fe
L_A2FF:
	ld b,006h		;a2ff
	call L_A0A2		;a301
	xor a			;a304
	ld (hl),a			;a305
	ld (0d8c1h),a		;a306
	ld (0d8c2h),a		;a309
	inc a			;a30c
	ld (0d456h),a		;a30d
	ld c,003h		;a310
	jp 08ddbh		;a312
L_A315:
	call L_A129		;a315
	ret nc			;a318
	call L_A40D		;a319
	ld a,(0caa0h)		;a31c
	or a			;a31f
	call nz,08d75h		;a320
	ld a,006h		;a323
	ld (0d8c1h),a		;a325
	ret			;a328
L_A329:
	ld hl,0d8c3h		;a329
	dec (hl)			;a32c
	jr z,L_A33E		;a32d
	ld a,(hl)			;a32f
	cp 004h		;a330
	ld b,0e0h		;a332
	jr z,L_A351		;a334
	cp 002h		;a336
	ld b,020h		;a338
	jr z,L_A351		;a33a
	or a			;a33c
	ret nz			;a33d
L_A33E:
	call L_A296		;a33e
	xor a			;a341
	ld (0cb5fh),a		;a342
	inc a			;a345
	ld (0d8a0h),a		;a346
	ld hl,0d8c3h		;a349
	ld (hl),002h		;a34c
	jp L_A076		;a34e
L_A351:
	ld c,012h		;a351
	jp 00047h		;a353   ; BIOS WRTVDP - Writes data in the VDP-register
L_A356:
	ld a,(0d88ah)		;a356
	cp 0ffh		;a359
	ret nz			;a35b
	ld a,(0d69ch)		;a35c
	or a			;a35f
	ret z			;a360
	ld hl,0cb5fh		;a361
	ld a,(hl)			;a364
	or a			;a365
	jr nz,L_A370		;a366
	ld (hl),001h		;a368
	call 06b12h		;a36a
	call 06caah		;a36d
L_A370:
	call L_A39D		;a370
	call L_ABA2		;a373
	ld hl,0d8c3h		;a376
	dec (hl)			;a379
	ret nz			;a37a
	ld (hl),002h		;a37b
	ld hl,0d8cdh		;a37d
	dec (hl)			;a380
	call 071c2h		;a381
	ld hl,0d8cdh		;a384
	ld a,(0d8d2h)		;a387
	cp (hl)			;a38a
	ret nz			;a38b
	call L_A296		;a38c
	call L_AB9B		;a38f
	ld hl,0d8c3h		;a392
	ld (hl),008h		;a395
	call 06c97h		;a397
	jp L_A076		;a39a
L_A39D:
	ld a,(0d8c3h)		;a39d
	ld b,0f0h		;a3a0
	rra			;a3a2
	jp c,L_A298		;a3a3
	jp L_A296		;a3a6
L_A3A9:
	call L_A3BF		;a3a9
	ld hl,0d8c3h		;a3ac
	dec (hl)			;a3af
	ret nz			;a3b0
	call L_A296		;a3b1
	ld hl,0d8c3h		;a3b4
	ld (hl),020h		;a3b7
	call 045f1h		;a3b9
	jp L_A076		;a3bc
L_A3BF:
	ld a,(0d8c3h)		;a3bf
	rra			;a3c2
	ld b,0e0h		;a3c3
	jr c,L_A3C9		;a3c5
	ld b,020h		;a3c7
L_A3C9:
	ld c,012h		;a3c9
	jp 00047h		;a3cb   ; BIOS WRTVDP - Writes data in the VDP-register
L_A3CE:
	call 045f1h		;a3ce
	ld hl,0d8c3h		;a3d1
	dec (hl)			;a3d4
	ret nz			;a3d5
	ld a,010h		;a3d6
	ld (0d8c9h),a		;a3d8
	call L_A8D1		;a3db
	ld hl,0cabdh		;a3de
	ld (hl),000h		;a3e1
	call 08529h		;a3e3
	call 04606h		;a3e6
	call 06cd6h		;a3e9
	xor a			;a3ec
	ld (0cb5fh),a		;a3ed
	jp L_A076		;a3f0
L_A3F3:
	ld hl,0cabdh		;a3f3
	ld a,(hl)			;a3f6
	or a			;a3f7
	jr z,L_A3FF		;a3f8
	ld (hl),000h		;a3fa
	call 08529h		;a3fc
L_A3FF:
	ld hl,0cb57h		;a3ff
	ld (hl),000h		;a402
	ld a,(0d69ch)		;a404
	or a			;a407
	jp nz,L_A69A		;a408
	inc (hl)			;a40b
	ret			;a40c
L_A40D:
	xor a			;a40d
	ld (0dff8h),a		;a40e
	ld (0d8c4h),a		;a411
	ld (0cb16h),a		;a414
	inc a			;a417
	ld (0d8c0h),a		;a418
	ld (0ca77h),a		;a41b
	ld hl,0d7c0h		;a41e
	ld bc,0000fh		;a421
	call 04236h		;a424
	call L_A49D		;a427
	ld hl,0cb80h		;a42a
	ld bc,0005fh		;a42d
	call 04236h		;a430
	call L_A470		;a433
	call 08578h		;a436
	call 0875dh		;a439
	call 059efh		;a43c
	call L_A4A6		;a43f
	call L_AB96		;a442
	ld hl,0ca4eh		;a445
	ld (hl),040h		;a448
	inc hl			;a44a
	ld (hl),081h		;a44b
	ld a,050h		;a44d
	ld (0cb03h),a		;a44f
	ld a,060h		;a452
	ld (0cb05h),a		;a454
	ld a,00fh		;a457
	ld (0cb00h),a		;a459
	ld a,(0cb31h)		;a45c
	or a			;a45f
	jr z,L_A464		;a460
	ld a,002h		;a462
L_A464:
	ld (0cb01h),a		;a464
	ld a,002h		;a467
	ld (0cb0eh),a		;a469
	ld (0cb0dh),a		;a46c
	ret			;a46f
L_A470:
	ld a,(0d8c2h)		;a470
	cp 005h		;a473
	jr nz,L_A48D		;a475
	ld a,(0d658h)		;a477
	or a			;a47a
	ret z			;a47b
	ld a,(0ca4ah)		;a47c
	cp 00dh		;a47f
	ret z			;a481
	ld a,(0ca5fh)		;a482
	or a			;a485
	ret z			;a486
L_A487:
	call 07cafh		;a487
	jp 08d8bh		;a48a
L_A48D:
	cp 009h		;a48d
	ret nz			;a48f
	ld a,(0ca4ah)		;a490
	cp 00ah		;a493
	ret nz			;a495
	ld a,(0ca5fh)		;a496
	or a			;a499
	ret z			;a49a
	jr L_A487		;a49b
L_A49D:
	ld hl,0df80h		;a49d
	ld bc,0003fh		;a4a0
	jp 04236h		;a4a3
L_A4A6:
	call 045f6h		;a4a6
	xor a			;a4a9
	call 04452h		;a4aa
	ld a,001h		;a4ad
	call 04452h		;a4af
	call 08281h		;a4b2
	call 05470h		;a4b5
	ld a,(0ca42h)		;a4b8
	xor 001h		;a4bb
	ld (0ca42h),a		;a4bd
	call 0547ch		;a4c0
	call 08524h		;a4c3
	call 071a2h		;a4c6
	call L_A83A		;a4c9
	ld a,(0d8a0h)		;a4cc
	or a			;a4cf
	call z,L_A8C3		;a4d0
	call 071c2h		;a4d3
	ld a,(0ca42h)		;a4d6
	call 04879h		;a4d9
	ld a,(0d7d5h)		;a4dc
	bit 7,a		;a4df
	jr nz,L_A4E8		;a4e1
	ld hl,0e248h		;a4e3
	ld (hl),000h		;a4e6
L_A4E8:
	jp 04609h		;a4e8
L_A4EB:
	ld a,(0cb21h)		;a4eb
	cp 002h		;a4ee
	jr nz,L_A4FD		;a4f0
	ld a,(0ca76h)		;a4f2
	cp 02ah		;a4f5
	ret z			;a4f7
	ld a,(0cb62h)		;a4f8
	or a			;a4fb
	ret nz			;a4fc
L_A4FD:
	ld a,(0d8c1h)		;a4fd
	or a			;a500
	ret z			;a501
	cp 001h		;a502
	call z,L_A5D7		;a504
	jp L_A8D1		;a507
L_A50A:
	ld a,(0cb00h)		;a50a
	cp 003h		;a50d
	ret nz			;a50f
	ld a,(0cb0eh)		;a510
	dec a			;a513
	ret nz			;a514
	ld hl,0aa83h		;a515
L_A518:
	ld a,(hl)			;a518
	cp 0ffh		;a519
	ret z			;a51b
	push hl			;a51c
	call L_A543		;a51d
	pop hl			;a520
	ld a,(0d8c2h)		;a521
	or a			;a524
	jr nz,L_A52D		;a525
	ld de,00008h		;a527
	add hl,de			;a52a
	jr L_A518		;a52b
L_A52D:
	ld a,(0d8c2h)		;a52d
	cp 003h		;a530
	ret nz			;a532
	ld a,(0d4f3h)		;a533
	or a			;a536
	ret nz			;a537
	ld a,(0d7d4h)		;a538
	bit 1,a		;a53b
	ret nz			;a53d
	xor a			;a53e
	ld (0d8c2h),a		;a53f
	ret			;a542
L_A543:
	ld a,(0ca4ah)		;a543
	cp (hl)			;a546
	ret nz			;a547
	inc hl			;a548
	ld a,(hl)			;a549
	cp 0ffh		;a54a
	jr z,L_A554		;a54c
	cp 0feh		;a54e
	jr z,L_A561		;a550
	jr L_A569		;a552
L_A554:
	ld a,(0ca76h)		;a554
	cp 018h		;a557
	ret nz			;a559
	ld a,(0ca4bh)		;a55a
	dec a			;a55d
	ret nz			;a55e
	jr L_A56E		;a55f
L_A561:
	ld a,(0ca76h)		;a561
	cp 02eh		;a564
	ret nz			;a566
	jr L_A56E		;a567
L_A569:
	ld a,(0ca4bh)		;a569
	cp (hl)			;a56c
	ret nz			;a56d
L_A56E:
	inc hl			;a56e
	ld a,(0d8c2h)		;a56f
	cp (hl)			;a572
	ret z			;a573
	ld b,(hl)			;a574
	inc hl			;a575
	ld a,(hl)			;a576
	ld (0d8cfh),a		;a577
	ld a,(0cb03h)		;a57a
	sub 01ch		;a57d
	cp (hl)			;a57f
	ret c			;a580
	ld a,(hl)			;a581
	add a,010h		;a582
	ld c,a			;a584
	ld a,(0cb03h)		;a585
	sub 01ch		;a588
	cp c			;a58a
	ret nc			;a58b
	inc hl			;a58c
	ld a,(hl)			;a58d
	ld (0d8d0h),a		;a58e
	ld a,(0cb05h)		;a591
	add a,004h		;a594
	cp (hl)			;a596
	ret c			;a597
	ld a,(hl)			;a598
	add a,010h		;a599
	ld c,a			;a59b
	ld a,(0cb05h)		;a59c
	add a,004h		;a59f
	cp c			;a5a1
	ret nc			;a5a2
	ld a,b			;a5a3
	ld (0d8c2h),a		;a5a4
	ld a,(0d7e2h)		;a5a7
	bit 5,a		;a5aa
	jr z,L_A5B8		;a5ac
	ld a,b			;a5ae
	cp 005h		;a5af
	jr nz,L_A5B8		;a5b1
	xor a			;a5b3
	ld (0d8c2h),a		;a5b4
	ret			;a5b7
L_A5B8:
	inc hl			;a5b8
	ld de,0d8c6h		;a5b9
	ldi		;a5bc
	ldi		;a5be
	ldi		;a5c0
	ret			;a5c2
L_A5C3:
	call L_A5E9		;a5c3
L_A5C6:
	ld de,(0d8cfh)		;a5c6
	ld a,(0ca42h)		;a5ca
	rlca			;a5cd
	rlca			;a5ce
	or 002h		;a5cf
	ld bc,00808h		;a5d1
	jp 04767h		;a5d4
L_A5D7:
	call L_A5E9		;a5d7
	ld a,(0ca4ah)		;a5da
	cp 007h		;a5dd
	ld a,010h		;a5df
	jr c,L_A5E5		;a5e1
	ld a,008h		;a5e3
L_A5E5:
	add a,h			;a5e5
	ld h,a			;a5e6
	jr L_A5C6		;a5e7
L_A5E9:
	ld a,(0ca4ah)		;a5e9
	ld hl,07028h		;a5ec
	cp 012h		;a5ef
	ret z			;a5f1
	cp 013h		;a5f2
	ret z			;a5f4
	ld hl,0e878h		;a5f5
	cp 00ch		;a5f8
	ret z			;a5fa
	cp 00dh		;a5fb
	ret z			;a5fd
	cp 00eh		;a5fe
	ret z			;a600
	ld hl,070a8h		;a601
	cp 00bh		;a604
	ret z			;a606
	ld l,0f8h		;a607
	cp 00ah		;a609
	ret z			;a60b
	ld hl,0a830h		;a60c
	cp 008h		;a60f
	ret z			;a611
	ld hl,0c8f0h		;a612
	ld a,(0d8c2h)		;a615
	dec a			;a618
	ret z			;a619
	ld h,0d0h		;a61a
	ret			;a61c
L_A61D:
	xor a			;a61d
	ld (0d8c4h),a		;a61e
	ld a,(0cb00h)		;a621
	cp 003h		;a624
	ret nz			;a626
	ld a,(0cb0eh)		;a627
	dec a			;a62a
	ret nz			;a62b
	ld a,(0cb03h)		;a62c
	cp 040h		;a62f
	ret c			;a631
	cp 05ch		;a632
	ret nc			;a634
	ld a,(0cb05h)		;a635
	cp 03ch		;a638
	ret c			;a63a
	cp 048h		;a63b
	jr c,L_A653		;a63d
	cp 077h		;a63f
	ret c			;a641
	cp 080h		;a642
	ret nc			;a644
	ld hl,0d8cbh		;a645
	ld a,(0d8cch)		;a648
	cp (hl)			;a64b
	ret nc			;a64c
	ld a,001h		;a64d
	ld (0d8c4h),a		;a64f
	ret			;a652
L_A653:
	ld a,(0ca4ah)		;a653
	cp 012h		;a656
	ret z			;a658
	cp 011h		;a659
	ret z			;a65b
	ld a,(0d8cch)		;a65c
	or a			;a65f
	ret z			;a660
	ld a,002h		;a661
	ld (0d8c4h),a		;a663
	ret			;a666
L_A667:
	ld a,(0ca4ah)		;a667
	cp 006h		;a66a
	jr z,L_A678		;a66c
	ld hl,0a686h		;a66e
	call 04248h		;a671
	ld (0d8cdh),a		;a674
	ret			;a677
L_A678:
	ld a,(0ca4bh)		;a678
	cp 023h		;a67b
	ld a,0ffh		;a67d
	jr z,L_A682		;a67f
	dec a			;a681
L_A682:
	ld (0d8cdh),a		;a682
	ret			;a685

; ----------------------------------------------------------------------
; DATOS resto_A686: lo apuntan con el banco puesto p07:A66E (0xA686); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p07:A66E (20 bytes)
;   0xa686..0xa69a  (20 bytes)
DATA_resto_A686:
	defb 000h,001h,002h,003h,004h,0ffh,0feh,001h,0fdh,001h,001h,001h,00ah,014h,01eh,01fh	; a686  ................
	defb 001h,001h,0fdh,0ffh	; a696

; ======================================================================
; CODIGO 0xa69a..0xaa0f  (885 bytes)
; ======================================================================


L_A69A:
	ld a,(0cb0eh)		;a69a
	dec a			;a69d
	ret nz			;a69e
	ld a,(0cb03h)		;a69f
	cp 050h		;a6a2
	ret nc			;a6a4
	ld a,(0cb05h)		;a6a5
	cp 058h		;a6a8
	ret c			;a6aa
	cp 069h		;a6ab
	ret nc			;a6ad
	xor a			;a6ae
	ld (0d8c0h),a		;a6af
	call L_A49D		;a6b2
	ld hl,0aa0fh		;a6b5
	ld a,(0d8c2h)		;a6b8
	dec a			;a6bb
	call 043f6h		;a6bc
	ld a,(0d8cch)		;a6bf
	add a,a			;a6c2
	add a,a			;a6c3
	inc a			;a6c4
	call 0423eh		;a6c5
	ld b,(hl)			;a6c8
	inc hl			;a6c9
	ld a,(hl)			;a6ca
	ld (0cb03h),a		;a6cb
	inc hl			;a6ce
	ld a,(hl)			;a6cf
	ld (0cb05h),a		;a6d0
	ld a,002h		;a6d3
	ld (0cb0eh),a		;a6d5
	ld (0cb0dh),a		;a6d8
	xor a			;a6db
	ld (0ca77h),a		;a6dc
	push bc			;a6df
	call 059efh		;a6e0
	call 08d75h		;a6e3
	pop bc			;a6e6
	call L_A731		;a6e7
	call L_A80B		;a6ea
	ld a,010h		;a6ed
	ld (0d8c9h),a		;a6ef
	call L_A83A		;a6f2
	call L_A8D1		;a6f5
	call L_A70F		;a6f8
	ld b,001h		;a6fb
	call L_A0A2		;a6fd
	ld (hl),000h		;a700
	inc hl			;a702
	inc hl			;a703
	ex de,hl			;a704
	ld hl,0d8cbh		;a705
	ldi		;a708
	ldi		;a70a
	ldi		;a70c
	ret			;a70e
L_A70F:
	ld a,(0d8c2h)		;a70f
	cp 008h		;a712
	jr nz,L_A72B		;a714
	ld a,(0d8cdh)		;a716
	cp 001h		;a719
	jr nz,L_A72B		;a71b
	ld a,00eh		;a71d
	ld (0d8c1h),a		;a71f
	ld hl,0d8c7h		;a722
	ld (hl),060h		;a725
	inc hl			;a727
	ld (hl),029h		;a728
	ret			;a72a
L_A72B:
	ld a,00dh		;a72b
	ld (0d8c1h),a		;a72d
	ret			;a730
L_A731:
	ld a,(0ca4ah)		;a731
	sub 00bh		;a734
	cp 006h		;a736
	push bc			;a738
	call c,08d86h		;a739
	pop bc			;a73c
	ld a,(0d8c2h)		;a73d
	cp 003h		;a740
	jp z,L_A7D6		;a742
	cp 005h		;a745
	jr z,L_A782		;a747
	cp 007h		;a749
	jr z,L_A771		;a74b
	cp 008h		;a74d
	jr z,L_A794		;a74f
	cp 009h		;a751
	jr z,L_A7B5		;a753
	cp 00ah		;a755
	jp nz,L_A7E1		;a757
	ld hl,0ca50h		;a75a
	push bc			;a75d
	ld a,(0d8cdh)		;a75e
	cp 001h		;a761
	ld bc,00106h		;a763
	jr z,L_A76B		;a766
	ld bc,00c07h		;a768
L_A76B:
	ld (hl),b			;a76b
	inc hl			;a76c
	ld (hl),c			;a76d
	pop bc			;a76e
	jr L_A7E1		;a76f
L_A771:
	ld a,(0d8cdh)		;a771
	cp 001h		;a774
	jr nz,L_A7E1		;a776
	ld hl,0ca50h		;a778
	ld (hl),001h		;a77b
	inc hl			;a77d
	ld (hl),009h		;a77e
	jr L_A7E1		;a780
L_A782:
	ld hl,0ca50h		;a782
	ld (hl),004h		;a785
	ld a,(0d8cdh)		;a787
	rla			;a78a
	jr nc,L_A78F		;a78b
	ld (hl),00ch		;a78d
L_A78F:
	inc hl			;a78f
	ld (hl),007h		;a790
	jr L_A7E1		;a792
L_A794:
	ld a,(0d8cdh)		;a794
	rla			;a797
	jr nc,L_A7A4		;a798
	ld hl,0ca50h		;a79a
	ld (hl),005h		;a79d
	inc hl			;a79f
	ld (hl),005h		;a7a0
	jr L_A7E1		;a7a2
L_A7A4:
	ld hl,0ca50h		;a7a4
	ld (hl),001h		;a7a7
	inc hl			;a7a9
	ld (hl),008h		;a7aa
	ld a,02ah		;a7ac
	ld (0ca76h),a		;a7ae
	ld a,b			;a7b1
	jp 08d98h		;a7b2
L_A7B5:
	ld a,(0d8cdh)		;a7b5
	rla			;a7b8
	jr nc,L_A7C5		;a7b9
	ld hl,0ca50h		;a7bb
	ld (hl),002h		;a7be
	inc hl			;a7c0
	ld (hl),007h		;a7c1
	jr L_A7E1		;a7c3
L_A7C5:
	ld hl,0ca50h		;a7c5
	ld (hl),001h		;a7c8
	inc hl			;a7ca
	ld (hl),007h		;a7cb
	ld a,02eh		;a7cd
	ld (0ca76h),a		;a7cf
	ld a,b			;a7d2
	jp 08d98h		;a7d3
L_A7D6:
	ld a,(0d8cdh)		;a7d6
	rla			;a7d9
	jr nc,L_A7FD		;a7da
	ld a,007h		;a7dc
	ld (0ca51h),a		;a7de
L_A7E1:
	xor a			;a7e1
	ld (0ca76h),a		;a7e2
	ld a,(0ca5fh)		;a7e5
	and a			;a7e8
	ld a,b			;a7e9
	jr z,L_A7FA		;a7ea
	push af			;a7ec
	cp 00ch		;a7ed
	call z,07ad0h		;a7ef
	pop af			;a7f2
	push af			;a7f3
	cp 006h		;a7f4
	call z,07ad0h		;a7f6
	pop af			;a7f9
L_A7FA:
	jp 08d98h		;a7fa
L_A7FD:
	ld a,008h		;a7fd
	ld (0ca51h),a		;a7ff
	ld a,018h		;a802
	ld (0ca76h),a		;a804
	ld a,b			;a807
	jp 08d98h		;a808
L_A80B:
	ld hl,0aa83h		;a80b
L_A80E:
	ld a,(hl)			;a80e
	cp 0ffh		;a80f
	ret z			;a811
	push hl			;a812
	call L_A81E		;a813
	pop hl			;a816
	ret c			;a817
	ld de,00008h		;a818
	add hl,de			;a81b
	jr L_A80E		;a81c
L_A81E:
	ld a,(0ca4ah)		;a81e
	cp (hl)			;a821
	jr nz,L_A838		;a822
	inc hl			;a824
	inc hl			;a825
	ld a,(0d8c2h)		;a826
	cp (hl)			;a829
	jr nz,L_A838		;a82a
	inc hl			;a82c
	inc hl			;a82d
	inc hl			;a82e
	ld de,0d8c6h		;a82f
	ldi		;a832
	ldi		;a834
	scf			;a836
	ret			;a837
L_A838:
	or a			;a838
	ret			;a839
L_A83A:
	call L_A896		;a83a
	ld hl,0c0e0h		;a83d
	ld de,0a0b0h		;a840
	call L_A85E		;a843
	ld hl,0c0f0h		;a846
	ld de,0b0b0h		;a849
	call L_A85E		;a84c
	ld hl,0f0e0h		;a84f
	ld de,0c0b0h		;a852
	call L_A85E		;a855
	ld hl,0f0f0h		;a858
	ld de,0d0b0h		;a85b
L_A85E:
	ld a,00ch		;a85e
	jr L_A890		;a860
L_A862:
	ld hl,0c0e0h		;a862
	ld bc,04020h		;a865
	xor a			;a868
	ld d,a			;a869
	call 046ffh		;a86a
	ld de,0c0e0h		;a86d
	ld hl,0a0b0h		;a870
	call L_A88E		;a873
	ld de,0c0f0h		;a876
	ld hl,0b0b0h		;a879
	call L_A88E		;a87c
	ld de,0f0e0h		;a87f
	ld hl,0c0b0h		;a882
	call L_A88E		;a885
	ld de,0f0f0h		;a888
	ld hl,0d0b0h		;a88b
L_A88E:
	ld a,003h		;a88e
L_A890:
	ld bc,01010h		;a890
L_A893:
	jp 04767h		;a893
L_A896:
	call L_A8B9		;a896
	ld b,000h		;a899
	call L_A8FF		;a89b
	ex de,hl			;a89e
	ld de,0c0e5h		;a89f
	push de			;a8a2
	push hl			;a8a3
	call L_A8B1		;a8a4
	pop hl			;a8a7
	pop de			;a8a8
	ld a,h			;a8a9
	add a,010h		;a8aa
	ld h,a			;a8ac
	ld a,d			;a8ad
	add a,030h		;a8ae
	ld d,a			;a8b0
L_A8B1:
	ld bc,0101ah		;a8b1
	ld a,(0ca42h)		;a8b4
	jr L_A893		;a8b7
L_A8B9:
	ld hl,0c0d4h		;a8b9
	ld bc,0402ch		;a8bc
	xor a			;a8bf
	ld d,a			;a8c0
	jr L_A8CE		;a8c1
L_A8C3:
	ld hl,0502dh		;a8c3
	ld bc,02019h		;a8c6
	ld a,(0ca42h)		;a8c9
	ld d,a			;a8cc
	xor a			;a8cd
L_A8CE:
	jp 046ffh		;a8ce
L_A8D1:
	call L_A8D6		;a8d1
	jr L_A8F0		;a8d4
L_A8D6:
	ld a,(0d8c9h)		;a8d6
	ld b,a			;a8d9
	ld a,0f0h		;a8da
	sub b			;a8dc
	ld h,a			;a8dd
	ld l,0e5h		;a8de
	ld b,010h		;a8e0
	call L_A8FF		;a8e2
L_A8E5:
	ld bc,0101ah		;a8e5
	ld a,(0ca42h)		;a8e8
	rlca			;a8eb
	rlca			;a8ec
	jp 04767h		;a8ed
L_A8F0:
	ld a,(0d8c9h)		;a8f0
	add a,0c0h		;a8f3
	ld h,a			;a8f5
	ld l,0e5h		;a8f6
	ld b,000h		;a8f8
	call L_A8FF		;a8fa
	jr L_A8E5		;a8fd
L_A8FF:
	ld a,(0d8c7h)		;a8ff
	ld d,a			;a902
	ld a,(0d8c6h)		;a903
	ld e,a			;a906
	ld a,(0d8c0h)		;a907
	or a			;a90a
	jr z,L_A910		;a90b
	ld de,05028h		;a90d
L_A910:
	ld a,d			;a910
	add a,b			;a911
	ld d,a			;a912
	ld a,e			;a913
	add a,005h		;a914
	ld e,a			;a916
	ret			;a917
L_A918:
	call L_A931		;a918
	ld hl,0aa0fh		;a91b
	ld a,(0d8c2h)		;a91e
	dec a			;a921
	call 043f6h		;a922
	ld a,(0d8cch)		;a925
	add a,a			;a928
	add a,a			;a929
	call 04248h		;a92a
	ld (0d8d2h),a		;a92d
	ret			;a930
L_A931:
	ld a,(0d8c4h)		;a931
	or a			;a934
	ret z			;a935
	ld b,001h		;a936
	dec a			;a938
	ld a,(0d8cch)		;a939
	jr z,L_A940		;a93c
	ld b,0ffh		;a93e
L_A940:
	add a,b			;a940
	ld (0d8cch),a		;a941
	ret			;a944
L_A945:
	ld a,(0d8c2h)		;a945
	or a			;a948
	ret z			;a949
	dec a			;a94a
	ld hl,0aa0fh		;a94b
	call 043f6h		;a94e
	ld a,(0d8cch)		;a951
	add a,a			;a954
	add a,a			;a955
	call 04248h		;a956
	ld (0d8cdh),a		;a959
	ret			;a95c
L_A95D:
	ld hl,0e8d0h		;a95d
	ld de,07830h		;a960
	ld a,(0d8c4h)		;a963
	dec a			;a966
	jr z,L_A96D		;a967
	ld h,0e0h		;a969
	ld d,040h		;a96b
L_A96D:
	ld a,(0d8c3h)		;a96d
	rra			;a970
	rra			;a971
	jr nc,L_A978		;a972
	ld bc,01000h		;a974
	add hl,bc			;a977
L_A978:
	ld bc,00808h		;a978
	ld a,(0ca42h)		;a97b
	rlca			;a97e
	rlca			;a97f
	or 002h		;a980
	jp 04767h		;a982
L_A985:
	call 0421fh		;a985
	ld de,0dc80h		;a988
	ld hl,08000h		;a98b
	ld bc,00050h		;a98e
	ldir		;a991
	jp 041adh		;a993
L_A996:
	ld ix,0dc80h		;a996
	ld b,010h		;a99a
L_A99C:
	ld a,(ix+000h)		;a99c
	or a			;a99f
	jr z,L_A9B2		;a9a0
	cp 00ah		;a9a2
	jr nz,L_A9AD		;a9a4
	ld a,(0d8c2h)		;a9a6
	cp 00ah		;a9a9
	jr nz,L_A9B2		;a9ab
L_A9AD:
	push bc			;a9ad
	call L_A9BA		;a9ae
	pop bc			;a9b1
L_A9B2:
	ld de,00008h		;a9b2
	add ix,de		;a9b5
	djnz L_A99C		;a9b7
	ret			;a9b9
L_A9BA:
	dec (ix+002h)		;a9ba
	ret nz			;a9bd
	ld (ix+002h),020h		;a9be
	call L_A9C9		;a9c2
	call L_A9F9		;a9c5
	ret			;a9c8
L_A9C9:
	ld a,(ix+006h)		;a9c9
	or a			;a9cc
	jr z,L_A9E0		;a9cd
	ld a,(ix+005h)		;a9cf
	add a,010h		;a9d2
	ld b,a			;a9d4
	ld a,(0d8cdh)		;a9d5
	add a,010h		;a9d8
	cp b			;a9da
	ret z			;a9db
	jr c,L_A9E5		;a9dc
	jr L_A9EE		;a9de
L_A9E0:
	ld a,r		;a9e0
	rra			;a9e2
	jr c,L_A9EE		;a9e3
L_A9E5:
	ld a,(ix+004h)		;a9e5
	or a			;a9e8
	ret z			;a9e9
	dec (ix+004h)		;a9ea
	ret			;a9ed
L_A9EE:
	ld a,(ix+004h)		;a9ee
	cp (ix+003h)		;a9f1
	ret z			;a9f4
	inc (ix+004h)		;a9f5
	ret			;a9f8
L_A9F9:
	ld a,(ix+000h)		;a9f9
	dec a			;a9fc
	ld hl,0aa0fh		;a9fd
	call 043f6h		;aa00
	ld a,(ix+004h)		;aa03
	add a,a			;aa06
	add a,a			;aa07
	call 04248h		;aa08
	ld (ix+005h),a		;aa0b
	ret			;aa0e

; ----------------------------------------------------------------------
; DATOS resto_AA0F: lo apuntan con el banco puesto p07:A6B5 (0xAA0F), p07:A91B
;   (0xAA0F), p07:A94B (0xAA0F), p07:A9FD (0xAA0F), p07:A515 (0xAA83),
;   p07:A80B (0xAA83); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p07:A6B5, p07:A91B, p07:A94B, p07:A9FD, p07:A515,
;   p07:A80B (309 bytes)
;   0xaa0f..0xab44  (309 bytes)
DATA_resto_AA0F:
	defb 023h,0aah,02fh,0aah,03fh,0aah,047h,0aah,04fh,0aah,05bh,0aah,063h,0aah,06bh,0aah	; aa0f  #./.?.G.O.[.c.k.
	defb 073h,0aah,07bh,0aah,0feh,006h,0ach,040h,0ffh,005h,0ach,040h,002h,002h,0ach,040h	; aa1f  s.{....@...@...@
	defb 001h,001h,0ach,080h,002h,002h,0ach,080h,003h,003h,0ach,080h,004h,004h,0ach,080h	; aa2f  ................
	defb 0fdh,008h,06ch,080h,004h,004h,04ch,090h,001h,00bh,04ch,050h,01eh,00eh,04ch,050h	; aa3f  ..l...L...LP..LP
	defb 0ffh,006h,0ach,030h,001h,00bh,0ach,030h,014h,00dh,0ach,030h,001h,00bh,04ch,090h	; aa4f  ...0...0...0..L.
	defb 00ah,00ch,04ch,090h,0fdh,008h,06ch,060h,001h,00ah,08ch,060h,0fdh,008h,06ch,060h	; aa5f  ..L...l`...`..l`
	defb 001h,007h,029h,070h,0ffh,013h,02ch,060h,001h,00ah,02ch,060h,0fdh,012h,070h,050h	; aa6f  ..)p..,`..,`..pP
	defb 001h,011h,070h,050h,001h,00bh,002h,088h,090h,07fh,070h,0a8h,002h,004h,001h,088h	; aa7f  ..pP......p.....
	defb 028h,07fh,030h,0a8h,002h,004h,002h,088h,090h,07fh,070h,0a8h,003h,00ah,002h,088h	; aa8f  (.0.......p.....
	defb 090h,07fh,070h,0a8h,004h,00ch,002h,088h,090h,07fh,070h,0a8h,004h,0ffh,003h,028h	; aa9f  ..p.......p....(
	defb 0a0h,01fh,080h,048h,005h,004h,001h,088h,028h,07fh,030h,0a8h,006h,007h,001h,088h	; aaaf  ...H....(.0.....
	defb 028h,07fh,030h,0a8h,006h,023h,005h,088h,040h,07fh,020h,0a8h,007h,0d0h,008h,0e0h	; aabf  (.0..#..@. .....
	defb 0e0h,000h,060h,029h,008h,007h,008h,048h,040h,03fh,050h,068h,008h,00fh,007h,048h	; aacf  ..`)...H@?Ph...H
	defb 040h,03fh,050h,068h,008h,000h,003h,048h,060h,03fh,070h,068h,00ah,0d0h,007h,0e0h	; aadf  @?Ph...H`?ph....
	defb 0e0h,05fh,050h,088h,00ah,0feh,009h,008h,070h,000h,050h,028h,00bh,004h,004h,028h	; aaef  ._P.....p.P(...(
	defb 068h,01fh,040h,048h,00bh,007h,005h,088h,048h,07fh,020h,0a8h,00bh,007h,006h,028h	; aaff  h.@H....H. ....(
	defb 0a8h,01fh,080h,048h,00ch,007h,006h,028h,0a0h,01fh,080h,048h,00dh,003h,005h,088h	; ab0f  ...H...(...H....
	defb 040h,07fh,020h,0a8h,00eh,005h,004h,028h,060h,01fh,040h,048h,011h,0d0h,00ah,0e0h	; ab1f  @. ....(`.@H....
	defb 0e0h,03fh,040h,068h,012h,013h,00ah,048h,078h,03fh,050h,068h,013h,002h,009h,008h	; ab2f  .?@h...Hx?Ph....
	defb 078h,000h,050h,028h,0ffh	; ab3f

; ======================================================================
; CODIGO 0xab44..0xb2e9  (1957 bytes)
; ======================================================================


L_AB44:
	ld a,(0d8c0h)		;ab44
	or a			;ab47
	ret nz			;ab48
	ld a,(0ca4ah)		;ab49
	or a			;ab4c
	ret z			;ab4d
	cp 007h		;ab4e
	ret nc			;ab50
	ld a,(0ca50h)		;ab51
	cp 003h		;ab54
	ret nz			;ab56
	ld a,(0ca51h)		;ab57
	cp 007h		;ab5a
	ret nz			;ab5c
	call 0421fh		;ab5d
	call L_AB66		;ab60
	jp 041adh		;ab63
L_AB66:
	ld a,(0dc85h)		;ab66
	or a			;ab69
	jr z,L_AB75		;ab6a
	call L_AB86		;ab6c
	ld de,0307ch		;ab6f
	call L_AB80		;ab72
L_AB75:
	ld a,(0dc8dh)		;ab75
	or a			;ab78
	ret z			;ab79
	call L_AB86		;ab7a
	ld de,0707ch		;ab7d
L_AB80:
	ld bc,00104h		;ab80
	jp 050e8h		;ab83
L_AB86:
	bit 7,a		;ab86
	ld b,001h		;ab88
	jr z,L_AB8D		;ab8a
	inc b			;ab8c
L_AB8D:
	add a,b			;ab8d
	ld hl,08080h		;ab8e
	add a,a			;ab91
	add a,a			;ab92
	jp 0423eh		;ab93
L_AB96:
	xor a			;ab96
	ld (0d8d1h),a		;ab97
	ret			;ab9a
L_AB9B:
	ld a,(0d8d1h)		;ab9b
	ld c,000h		;ab9e
	jr L_ABAB		;aba0
L_ABA2:
	call L_AB9B		;aba2
	call L_AC0C		;aba5
	ld a,(hl)			;aba8
	ld c,002h		;aba9
L_ABAB:
	call 0421fh		;abab
	call L_ABB4		;abae
	jp 041adh		;abb1
L_ABB4:
	add a,a			;abb4
	add a,a			;abb5
	add a,a			;abb6
	ld hl,08050h		;abb7
	call 0423eh		;abba
	push hl			;abbd
	call L_AC33		;abbe
	ld b,018h		;abc1
	call L_AC01		;abc3
	ld b,02ch		;abc6
	call L_ABF7		;abc8
	pop hl			;abcb
	inc hl			;abcc
	inc hl			;abcd
	push hl			;abce
	call L_AC33		;abcf
	ld b,018h		;abd2
	ld a,h			;abd4
	sub b			;abd5
	ld h,a			;abd6
	call L_AC01		;abd7
	ld b,02ch		;abda
	ld a,h			;abdc
	add a,018h		;abdd
	ld h,a			;abdf
	call L_ABF7		;abe0
	pop hl			;abe3
	inc hl			;abe4
	inc hl			;abe5
	push hl			;abe6
	call L_AC33		;abe7
	ld b,020h		;abea
	call L_ABF7		;abec
	pop hl			;abef
	inc hl			;abf0
	inc hl			;abf1
	call L_AC33		;abf2
	ld b,020h		;abf5
L_ABF7:
	ld a,(0ca42h)		;abf7
	push bc			;abfa
	push hl			;abfb
	call 04680h		;abfc
	jr L_AC09		;abff
L_AC01:
	ld a,(0ca42h)		;ac01
	push bc			;ac04
	push hl			;ac05
	call 0467ch		;ac06
L_AC09:
	pop hl			;ac09
	pop bc			;ac0a
	ret			;ac0b
L_AC0C:
	ld hl,0d8d1h		;ac0c
	ld a,(0d8c1h)		;ac0f
	cp 00fh		;ac12
	jr c,L_AC19		;ac14
	ld a,(hl)			;ac16
	jr L_AC22		;ac17
L_AC19:
	ld a,(0d8c4h)		;ac19
	or a			;ac1c
	ret z			;ac1d
	dec a			;ac1e
	ld a,(hl)			;ac1f
	jr z,L_AC2A		;ac20
L_AC22:
	inc a			;ac22
	cp 006h		;ac23
	jr c,L_AC28		;ac25
	xor a			;ac27
L_AC28:
	ld (hl),a			;ac28
	ret			;ac29
L_AC2A:
	dec a			;ac2a
	cp 0ffh		;ac2b
	jr nz,L_AC28		;ac2d
	ld a,005h		;ac2f
	ld (hl),a			;ac31
	ret			;ac32
L_AC33:
	ld a,(hl)			;ac33
	inc hl			;ac34
	ld h,(hl)			;ac35
	ld l,a			;ac36
	ret			;ac37
L_AC38:
	ld a,(0ca41h)		;ac38
	or a			;ac3b
	ret nz			;ac3c
	call L_AC6A		;ac3d
	call L_AD57		;ac40
	call L_AD8C		;ac43
	call L_AE07		;ac46
	call L_AE57		;ac49
	call L_AE84		;ac4c
	call L_AF64		;ac4f
	call L_AF8A		;ac52
	call L_AFF7		;ac55
	call L_B037		;ac58
	call L_B085		;ac5b
	call L_B0E5		;ac5e
	call L_B258		;ac61
	call L_B149		;ac64
	jp L_B1E0		;ac67
L_AC6A:
	ld a,(0ca8dh)		;ac6a
	or a			;ac6d
	jp nz,L_AD1E		;ac6e
	ld a,(0ca4ah)		;ac71
	cp 00fh		;ac74
	jr nz,L_AC7E		;ac76
	call L_B5CC		;ac78
	ret nz			;ac7b
	jr L_AC82		;ac7c
L_AC7E:
	call L_B670		;ac7e
	ret nz			;ac81
L_AC82:
	ld ix,0ce00h		;ac82
	ld b,018h		;ac86
L_AC88:
	exx			;ac88
	call L_B8C5		;ac89
	exx			;ac8c
	jr nz,L_ACD9		;ac8d
	call L_B5AF		;ac8f
	jr nc,L_ACD9		;ac92
	ld a,(ix+000h)		;ac94
	and 07fh		;ac97
	ld c,a			;ac99
	cp 018h		;ac9a
	jr z,L_ACD9		;ac9c
	cp 016h		;ac9e
	jr z,L_ACE3		;aca0
	cp 00ah		;aca2
	jr z,L_ACD9		;aca4
	sub 010h		;aca6
	cp 002h		;aca8
	jr c,L_AD08		;acaa
	ld a,c			;acac
	cp 013h		;acad
	ld c,004h		;acaf
	jr nz,L_ACB9		;acb1
	ld (ix+001h),002h		;acb3
	ld c,00ch		;acb7
L_ACB9:
	xor a			;acb9
	call L_B377		;acba
	ld a,(ix+000h)		;acbd
	and 07fh		;acc0
	cp 010h		;acc2
	jr nc,L_ACD9		;acc4
	ld a,(0ca5fh)		;acc6
	cp 002h		;acc9
	jr nc,L_ACD9		;accb
	ld a,(0cb21h)		;accd
	sub 00ah		;acd0
	cp 002h		;acd2
	push bc			;acd4
	call nc,07ad8h		;acd5
	pop bc			;acd8
L_ACD9:
	exx			;acd9
	ld de,00040h		;acda
	add ix,de		;acdd
	exx			;acdf
	djnz L_AC88		;ace0
	ret			;ace2
L_ACE3:
	ld a,(0cb21h)		;ace3
	cp 021h		;ace6
	jr nz,L_ACD9		;ace8
	ld a,(ix+001h)		;acea
	cp 003h		;aced
	jr nz,L_ACD9		;acef
	ld a,(ix+021h)		;acf1
	and a			;acf4
	jr nz,L_ACD9		;acf5
	ld a,001h		;acf7
	ld (0d43fh),a		;acf9
	ld hl,0d7d4h		;acfc
	set 6,(hl)		;acff
	ld hl,0d7e0h		;ad01
	res 5,(hl)		;ad04
	jr L_AD0E		;ad06
L_AD08:
	ld a,(ix+021h)		;ad08
	and a			;ad0b
	jr nz,L_ACD9		;ad0c
L_AD0E:
	ld a,001h		;ad0e
	ld (0d434h),a		;ad10
	push ix		;ad13
	pop hl			;ad15
	ld (0d435h),hl		;ad16
	ld (ix+021h),03ch		;ad19
	ret			;ad1d
L_AD1E:
	call L_B5CC		;ad1e
	ret nz			;ad21
	ld ix,0ce00h		;ad22
	ld b,018h		;ad26
L_AD28:
	exx			;ad28
	call L_B90A		;ad29
	exx			;ad2c
	jr nz,L_AD4D		;ad2d
	call L_B5AF		;ad2f
	jr nc,L_AD4D		;ad32
	ld a,(ix+000h)		;ad34
	and 07fh		;ad37
	cp 016h		;ad39
	jr z,L_AD4D		;ad3b
	cp 00ah		;ad3d
	jr z,L_AD4D		;ad3f
	sub 010h		;ad41
	cp 002h		;ad43
	jr c,L_AD4D		;ad45
	ld c,004h		;ad47
	xor a			;ad49
	call L_B377		;ad4a
L_AD4D:
	exx			;ad4d
	ld de,00040h		;ad4e
	add ix,de		;ad51
	exx			;ad53
	djnz L_AD28		;ad54
	ret			;ad56
L_AD57:
	ld a,(0ca8dh)		;ad57
	or a			;ad5a
	ret nz			;ad5b
	ld a,(0d445h)		;ad5c
	and a			;ad5f
	ret nz			;ad60
	call L_B5CC		;ad61
	ret nz			;ad64
	ld ix,0d460h		;ad65
	ld b,006h		;ad69
L_AD6B:
	exx			;ad6b
	call L_BA3A		;ad6c
	exx			;ad6f
	jr nz,L_AD82		;ad70
	call L_B5AF		;ad72
	jr nc,L_AD82		;ad75
	call L_B53D		;ad77
	ld a,001h		;ad7a
	call L_B377		;ad7c
	call L_B44E		;ad7f
L_AD82:
	exx			;ad82
	ld de,00010h		;ad83
	add ix,de		;ad86
	exx			;ad88
	djnz L_AD6B		;ad89
	ret			;ad8b
L_AD8C:
	ld iy,0cb80h		;ad8c
	exx			;ad90
	ld b,006h		;ad91
L_AD93:
	exx			;ad93
	call L_B734		;ad94
	jr nz,L_ADFD		;ad97
	ld ix,0ce00h		;ad99
	ld b,018h		;ad9d
L_AD9F:
	ld a,(ix+000h)		;ad9f
	cp 014h		;ada2
	jr z,L_ADAD		;ada4
	ld a,(iy+000h)		;ada6
	cp 008h		;ada9
	jr z,L_ADF4		;adab
L_ADAD:
	exx			;adad
	call L_B90A		;adae
	exx			;adb1
	jr nz,L_ADF4		;adb2
	call L_B5AF		;adb4
	jr nc,L_ADF4		;adb7
	ld a,(iy+000h)		;adb9
	cp 006h		;adbc
	jr nz,L_ADCC		;adbe
	xor a			;adc0
	ld (iy+000h),a		;adc1
	ld (0cb52h),a		;adc4
	call L_AE3D		;adc7
	jr L_ADFD		;adca
L_ADCC:
	ld a,(ix+000h)		;adcc
	and 07fh		;adcf
	sub 016h		;add1
	cp 002h		;add3
	jr c,L_ADF4		;add5
	xor a			;add7
	ld (iy+000h),a		;add8
	ld (0cb52h),a		;addb
	ld a,(ix+000h)		;adde
	and 07fh		;ade1
	sub 010h		;ade3
	cp 002h		;ade5
	jr nc,L_ADEF		;ade7
	ld c,010h		;ade9
	xor a			;adeb
	call L_B377		;adec
L_ADEF:
	call L_B456		;adef
	jr L_ADFD		;adf2
L_ADF4:
	exx			;adf4
	ld de,00040h		;adf5
	add ix,de		;adf8
	exx			;adfa
	djnz L_AD9F		;adfb
L_ADFD:
	ld de,00010h		;adfd
	add iy,de		;ae00
	exx			;ae02
	djnz L_AD93		;ae03
	exx			;ae05
	ret			;ae06
L_AE07:
	ld a,(0cacfh)		;ae07
	or a			;ae0a
	ret z			;ae0b
	call L_B5CC		;ae0c
	ret nz			;ae0f
	ld iy,0cb80h		;ae10
	ld b,006h		;ae14
L_AE16:
	exx			;ae16
	call L_B734		;ae17
	exx			;ae1a
	jr nz,L_AE33		;ae1b
	call L_B5AF		;ae1d
	jr nc,L_AE33		;ae20
	ld a,(iy+000h)		;ae22
	cp 006h		;ae25
	jr nz,L_AE33		;ae27
	xor a			;ae29
	ld (iy+000h),a		;ae2a
	ld (0cb52h),a		;ae2d
	call L_AE3D		;ae30
L_AE33:
	exx			;ae33
	ld de,00010h		;ae34
	add iy,de		;ae37
	exx			;ae39
	djnz L_AE16		;ae3a
	ret			;ae3c
L_AE3D:
	push de			;ae3d
	push bc			;ae3e
	push hl			;ae3f
	ld a,(0ca50h)		;ae40
	ld e,a			;ae43
	ld a,(0ca51h)		;ae44
	ld d,a			;ae47
	ld c,080h		;ae48
	ld l,(iy+003h)		;ae4a
	ld h,(iy+005h)		;ae4d
	call 08db5h		;ae50
	pop hl			;ae53
	pop bc			;ae54
	pop de			;ae55
	ret			;ae56
L_AE57:
	call L_B5CC		;ae57
	ret nz			;ae5a
	ld ix,0d800h		;ae5b
	ld b,004h		;ae5f
L_AE61:
	exx			;ae61
	call L_B97A		;ae62
	exx			;ae65
	jr nz,L_AE7A		;ae66
	ld a,(ix+000h)		;ae68
	cp 009h		;ae6b
	jr z,L_AE7A		;ae6d
	call L_B5AF		;ae6f
	jr nc,L_AE7A		;ae72
	ld c,004h		;ae74
	xor a			;ae76
	call L_B377		;ae77
L_AE7A:
	exx			;ae7a
	ld de,00020h		;ae7b
	add ix,de		;ae7e
	exx			;ae80
	djnz L_AE61		;ae81
	ret			;ae83
L_AE84:
	ld iy,0cb80h		;ae84
	exx			;ae88
	ld b,006h		;ae89
L_AE8B:
	exx			;ae8b
	call L_B734		;ae8c
	jr nz,L_AEC7		;ae8f
	ld ix,0d800h		;ae91
	ld b,020h		;ae95
L_AE97:
	exx			;ae97
	call L_B9B5		;ae98
	exx			;ae9b
	jr nz,L_AEBE		;ae9c
	call L_B5AF		;ae9e
	jr nc,L_AEBE		;aea1
	ld a,(iy+000h)		;aea3
	ld c,a			;aea6
	xor a			;aea7
	ld (iy+000h),a		;aea8
	ld (0cb52h),a		;aeab
	ld a,c			;aeae
	cp 006h		;aeaf
	jr nz,L_AEB8		;aeb1
	call L_AE3D		;aeb3
	jr L_AEBE		;aeb6
L_AEB8:
	call L_B52C		;aeb8
	call L_B469		;aebb
L_AEBE:
	exx			;aebe
	ld de,00020h		;aebf
	add ix,de		;aec2
	exx			;aec4
	djnz L_AE97		;aec5
L_AEC7:
	ld de,00010h		;aec7
	add iy,de		;aeca
	exx			;aecc
	djnz L_AE8B		;aecd
	exx			;aecf
	ret			;aed0
L_AED1:
	call L_B70F		;aed1
	ret nz			;aed4
	ld ix,0ce00h		;aed5
	ld b,018h		;aed9
L_AEDB:
	exx			;aedb
	call L_B90A		;aedc
	exx			;aedf
	jr nz,L_AF03		;aee0
	call L_B5AF		;aee2
	jr nc,L_AF03		;aee5
	ld a,(ix+000h)		;aee7
	and 07fh		;aeea
	cp 00ah		;aeec
	jr z,L_AF03		;aeee
	cp 010h		;aef0
	jr c,L_AF00		;aef2
	sub 010h		;aef4
	cp 002h		;aef6
	jr nc,L_AF03		;aef8
	ld c,004h		;aefa
	xor a			;aefc
	call L_B377		;aefd
L_AF00:
	call L_B3DA		;af00
L_AF03:
	exx			;af03
	ld de,00040h		;af04
	add ix,de		;af07
	exx			;af09
	djnz L_AEDB		;af0a
	ret			;af0c
L_AF0D:
	call L_B70F		;af0d
	ret nz			;af10
	ld ix,0d800h		;af11
	ld b,004h		;af15
L_AF17:
	ld a,(ix+000h)		;af17
	cp 00ah		;af1a
	jr z,L_AF2F		;af1c
	exx			;af1e
	call L_B9B5		;af1f
	exx			;af22
	jr nz,L_AF2F		;af23
	call L_B5AF		;af25
	jr nc,L_AF2F		;af28
	ld c,001h		;af2a
	call L_B469		;af2c
L_AF2F:
	exx			;af2f
	ld de,00020h		;af30
	add ix,de		;af33
	exx			;af35
	djnz L_AF17		;af36
	ret			;af38
L_AF39:
	ld a,(0ca4ah)		;af39
	cp 012h		;af3c
	ret nz			;af3e
	call L_B84A		;af3f
	ret nz			;af42
	ld ix,0d800h		;af43
	ld b,004h		;af47
L_AF49:
	exx			;af49
	call L_B9B5		;af4a
	exx			;af4d
	jr nz,L_AF5A		;af4e
	call L_B5AF		;af50
	jr nc,L_AF5A		;af53
	ld c,006h		;af55
	call L_B469		;af57
L_AF5A:
	exx			;af5a
	ld de,00020h		;af5b
	add ix,de		;af5e
	exx			;af60
	djnz L_AF49		;af61
	ret			;af63
L_AF64:
	call L_B6CC		;af64
	ret nz			;af67
	ld iy,0df80h		;af68
	ld b,008h		;af6c
L_AF6E:
	exx			;af6e
	call L_B790		;af6f
	exx			;af72
	jr nz,L_AF80		;af73
	call L_B5AF		;af75
	jr nc,L_AF80		;af78
	ld c,012h		;af7a
	xor a			;af7c
	call L_B377		;af7d
L_AF80:
	exx			;af80
	ld de,00008h		;af81
	add iy,de		;af84
	exx			;af86
	djnz L_AF6E		;af87
	ret			;af89
L_AF8A:
	ld iy,0df80h		;af8a
	exx			;af8e
	ld b,008h		;af8f
L_AF91:
	exx			;af91
	call L_B787		;af92
	jr nz,L_AFED		;af95
	ld ix,0ce00h		;af97
	ld b,018h		;af9b
L_AF9D:
	exx			;af9d
	call L_B8E4		;af9e
	exx			;afa1
	jr nz,L_AFE4		;afa2
	ld a,(0ca4ah)		;afa4
	cp 00ch		;afa7
	jr nz,L_AFC0		;afa9
	ld a,(ix+00ah)		;afab
	cp 003h		;afae
	jr nz,L_AFC0		;afb0
	ld a,(ix+00bh)		;afb2
	cp 006h		;afb5
	jr nz,L_AFC0		;afb7
	ld a,(0ca4bh)		;afb9
	cp 003h		;afbc
	jr nz,L_AFE4		;afbe
L_AFC0:
	call L_B5AF		;afc0
	jr nc,L_AFE4		;afc3
	ld a,(ix+000h)		;afc5
	and 07fh		;afc8
	sub 016h		;afca
	cp 002h		;afcc
	jr c,L_AFE4		;afce
	ld a,(ix+000h)		;afd0
	and 07fh		;afd3
	sub 010h		;afd5
	cp 002h		;afd7
	jr nc,L_AFE1		;afd9
	ld c,010h		;afdb
	xor a			;afdd
	call L_B377		;afde
L_AFE1:
	call L_B456		;afe1
L_AFE4:
	exx			;afe4
	ld de,00040h		;afe5
	add ix,de		;afe8
	exx			;afea
	djnz L_AF9D		;afeb
L_AFED:
	ld de,00008h		;afed
	add iy,de		;aff0
	exx			;aff2
	djnz L_AF91		;aff3
	exx			;aff5
	ret			;aff6
L_AFF7:
	ld iy,0df80h		;aff7
	exx			;affb
	ld b,008h		;affc
L_AFFE:
	exx			;affe
	call L_B787		;afff
	jr nz,L_B02D		;b002
	ld ix,0d800h		;b004
	ld b,004h		;b008
L_B00A:
	exx			;b00a
	call L_B991		;b00b
	exx			;b00e
	jr nz,L_B024		;b00f
	call L_B5AF		;b011
	jr nc,L_B024		;b014
	ld a,(ix+007h)		;b016
	ld c,003h		;b019
	and 080h		;b01b
	jr nz,L_B021		;b01d
	ld c,006h		;b01f
L_B021:
	call L_B469		;b021
L_B024:
	exx			;b024
	ld de,00020h		;b025
	add ix,de		;b028
	exx			;b02a
	djnz L_B00A		;b02b
L_B02D:
	ld de,00008h		;b02d
	add iy,de		;b030
	exx			;b032
	djnz L_AFFE		;b033
	exx			;b035
	ret			;b036
L_B037:
	ld a,(0e1d0h)		;b037
	or a			;b03a
	ret nz			;b03b
	call L_B6CC		;b03c
	ret nz			;b03f
	ld iy,0cc80h		;b040
	ld b,030h		;b044
L_B046:
	exx			;b046
	call L_B7BF		;b047
	exx			;b04a
	jr nz,L_B060		;b04b
	call L_B5AF		;b04d
	jr nc,L_B060		;b050
	ld a,(0cb00h)		;b052
	cp 002h		;b055
	jr z,L_B06A		;b057
	cp 00bh		;b059
	jr z,L_B06A		;b05b
	call L_B563		;b05d
L_B060:
	exx			;b060
	ld de,00008h		;b061
	add iy,de		;b064
	exx			;b066
	djnz L_B046		;b067
	ret			;b069
L_B06A:
	call L_B5A4		;b06a
	xor a			;b06d
	ld (iy+000h),a		;b06e
	ld (0cb52h),a		;b071
	push bc			;b074
	push hl			;b075
	push de			;b076
	ld hl,0d61ch		;b077
	ld (hl),001h		;b07a
	call 08d90h		;b07c
	pop de			;b07f
	pop hl			;b080
	pop bc			;b081
	jp 06a38h		;b082
L_B085:
	ld iy,0cc80h		;b085
	exx			;b089
	ld b,030h		;b08a
L_B08C:
	exx			;b08c
	call L_B7B6		;b08d
	jr nz,L_B0DB		;b090
	ld ix,0ce00h		;b092
	ld b,018h		;b096
L_B098:
	ld a,(iy+000h)		;b098
	cp 001h		;b09b
	jr z,L_B0A8		;b09d
	cp 004h		;b09f
	jr z,L_B0A8		;b0a1
	cp (ix+01bh)		;b0a3
	jr z,L_B0D2		;b0a6
L_B0A8:
	ld a,(ix+00ah)		;b0a8
	cp (iy+004h)		;b0ab
	jr nz,L_B0D2		;b0ae
	ld a,(ix+00bh)		;b0b0
	cp (iy+005h)		;b0b3
	jr nz,L_B0D2		;b0b6
	exx			;b0b8
	call L_B8EC		;b0b9
	exx			;b0bc
	jr nz,L_B0D2		;b0bd
	call L_B5AF		;b0bf
	jr nc,L_B0D2		;b0c2
	ld a,(ix+000h)		;b0c4
	and 07fh		;b0c7
	sub 016h		;b0c9
	cp 002h		;b0cb
	jr c,L_B0D2		;b0cd
	call L_B563		;b0cf
L_B0D2:
	exx			;b0d2
	ld de,00040h		;b0d3
	add ix,de		;b0d6
	exx			;b0d8
	djnz L_B098		;b0d9
L_B0DB:
	ld de,00008h		;b0db
	add iy,de		;b0de
	exx			;b0e0
	djnz L_B08C		;b0e1
	exx			;b0e3
	ret			;b0e4
L_B0E5:
	ld iy,0cc80h		;b0e5
	exx			;b0e9
	ld b,010h		;b0ea
L_B0EC:
	exx			;b0ec
	call L_B7B6		;b0ed
	jr nz,L_B13F		;b0f0
	ld ix,0d800h		;b0f2
	ld b,004h		;b0f6
L_B0F8:
	exx			;b0f8
	call L_B999		;b0f9
	exx			;b0fc
	jr nz,L_B136		;b0fd
	ld a,(iy+000h)		;b0ff
	cp 001h		;b102
	jr z,L_B117		;b104
	cp 004h		;b106
	jr z,L_B117		;b108
	cp 002h		;b10a
	jr z,L_B136		;b10c
	ld a,(ix+000h)		;b10e
	cp 00bh		;b111
	jr nz,L_B136		;b113
	jr L_B11E		;b115
L_B117:
	ld a,(ix+000h)		;b117
	cp 00bh		;b11a
	jr z,L_B136		;b11c
L_B11E:
	ld a,(ix+00ah)		;b11e
	cp (iy+004h)		;b121
	jr nz,L_B136		;b124
	ld a,(ix+00bh)		;b126
	cp (iy+005h)		;b129
	jr nz,L_B136		;b12c
	call L_B5AF		;b12e
	jr nc,L_B136		;b131
	call L_B563		;b133
L_B136:
	exx			;b136
	ld de,00020h		;b137
	add ix,de		;b13a
	exx			;b13c
	djnz L_B0F8		;b13d
L_B13F:
	ld de,00008h		;b13f
	add iy,de		;b142
	exx			;b144
	djnz L_B0EC		;b145
	exx			;b147
	ret			;b148
L_B149:
	ld a,(0dff8h)		;b149
	or a			;b14c
	ret z			;b14d
	call L_B156		;b14e
	call L_B170		;b151
	jr L_B1B1		;b154
L_B156:
	ld a,(0cb21h)		;b156
	cp 004h		;b159
	ret z			;b15b
	call L_B5CC		;b15c
	ret nz			;b15f
	exx			;b160
	call L_B889		;b161
	exx			;b164
	ret nz			;b165
	call L_B5AF		;b166
	ret nc			;b169
	ld c,010h		;b16a
	xor a			;b16c
	jp L_B377		;b16d
L_B170:
	ld a,(0d437h)		;b170
	or a			;b173
	ret nz			;b174
	call L_B889		;b175
	ld ix,0ce00h		;b178
	ld b,018h		;b17c
L_B17E:
	exx			;b17e
	call L_B90A		;b17f
	exx			;b182
	jr nz,L_B1A7		;b183
	call L_B5AF		;b185
	jr nc,L_B1A7		;b188
	ld a,(ix+000h)		;b18a
	and 07fh		;b18d
	cp 013h		;b18f
	jr nc,L_B1A7		;b191
	ld a,(ix+000h)		;b193
	and 07fh		;b196
	sub 010h		;b198
	cp 002h		;b19a
	jr nc,L_B1A4		;b19c
	ld c,006h		;b19e
	xor a			;b1a0
	call L_B377		;b1a1
L_B1A4:
	call L_B456		;b1a4
L_B1A7:
	exx			;b1a7
	ld de,00040h		;b1a8
	add ix,de		;b1ab
	exx			;b1ad
	djnz L_B17E		;b1ae
	ret			;b1b0
L_B1B1:
	call L_B889		;b1b1
	ld ix,0d800h		;b1b4
	ld b,004h		;b1b8
L_B1BA:
	exx			;b1ba
	call L_B9B5		;b1bb
	exx			;b1be
	jr nz,L_B1D6		;b1bf
	ld a,(ix+000h)		;b1c1
	cp 008h		;b1c4
	jr z,L_B1CC		;b1c6
	cp 005h		;b1c8
	jr nz,L_B1D6		;b1ca
L_B1CC:
	call L_B5AF		;b1cc
	jr nc,L_B1D6		;b1cf
	ld c,003h		;b1d1
	call L_B469		;b1d3
L_B1D6:
	exx			;b1d6
	ld de,00020h		;b1d7
	add ix,de		;b1da
	exx			;b1dc
	djnz L_B1BA		;b1dd
	ret			;b1df
L_B1E0:
	ld a,(0d881h)		;b1e0
	inc a			;b1e3
	jr z,L_B208		;b1e4
	ld a,(0d88ah)		;b1e6
	inc a			;b1e9
	jr nz,L_B1F7		;b1ea
	ld a,(0d680h)		;b1ec
	or a			;b1ef
	jr nz,L_B1F7		;b1f0
	ld a,(0d69ch)		;b1f2
	or a			;b1f5
	ret z			;b1f6
L_B1F7:
	ld a,(0d883h)		;b1f7
	inc a			;b1fa
	jr nz,L_B208		;b1fb
	ld a,(0d678h)		;b1fd
	or a			;b200
	jr nz,L_B208		;b201
	ld a,(0d68ch)		;b203
	or a			;b206
	ret z			;b207
L_B208:
	ld a,(0ca8dh)		;b208
	or a			;b20b
	ret nz			;b20c
	call L_B23A		;b20d
	ret nz			;b210
	ld a,(0cb00h)		;b211
	cp 00bh		;b214
	ret z			;b216
	cp 002h		;b217
	jr nz,L_B221		;b219
	ld a,(0cb0eh)		;b21b
	cp 003h		;b21e
	ret c			;b220
L_B221:
	call L_B6CC		;b221
	ret nz			;b224
	exx			;b225
	call L_B804		;b226
	exx			;b229
	ret nz			;b22a
	call L_B5AF		;b22b
	ret nc			;b22e
	call 06a38h		;b22f
	call 08d9dh		;b232
	ld a,009h		;b235
	jp 08da5h		;b237
L_B23A:
	ld b,003h		;b23a
	ld a,(0d8c0h)		;b23c
	or a			;b23f
	jr nz,L_B253		;b240
	dec b			;b242
	ld a,(0ca65h)		;b243
	or a			;b246
	jr nz,L_B253		;b247
	ld b,004h		;b249
	ld a,(0ca76h)		;b24b
	or a			;b24e
	jr nz,L_B253		;b24f
	ld b,001h		;b251
L_B253:
	ld a,(0d760h)		;b253
	cp b			;b256
	ret			;b257
L_B258:
	call L_B25D		;b258
	jr L_B29A		;b25b
L_B25D:
	call L_B6CC		;b25d
	ret nz			;b260
	ld ix,0ce00h		;b261
	ld b,018h		;b265
L_B267:
	exx			;b267
	call L_B90A		;b268
	exx			;b26b
	jr nz,L_B290		;b26c
	ld a,(ix+000h)		;b26e
	and 07fh		;b271
	cp 018h		;b273
	jr nz,L_B290		;b275
	call L_B5AF		;b277
	jr nc,L_B290		;b27a
	push ix		;b27c
	push de			;b27e
	push bc			;b27f
	push hl			;b280
	call 06a38h		;b281
	call 07ae8h		;b284
	call L_B2C0		;b287
	pop hl			;b28a
	pop bc			;b28b
	pop de			;b28c
	pop ix		;b28d
	ret			;b28f
L_B290:
	exx			;b290
	ld de,00040h		;b291
	add ix,de		;b294
	exx			;b296
	djnz L_B267		;b297
	ret			;b299
L_B29A:
	ld a,(0e060h)		;b29a
	or a			;b29d
	ret z			;b29e
	call L_B6CC		;b29f
	ret nz			;b2a2
	exx			;b2a3
	call L_B2F9		;b2a4
	exx			;b2a7
	call L_B5AF		;b2a8
	ret nc			;b2ab
	call 06a38h		;b2ac
	xor a			;b2af
	ld (0e060h),a		;b2b0
	ld hl,0dc70h		;b2b3
	ld de,0dc71h		;b2b6
	ld (hl),0e0h		;b2b9
	ld bc,00007h		;b2bb
	ldir		;b2be
L_B2C0:
	ld l,00fh		;b2c0
	ld a,(0cb73h)		;b2c2
	cp 003h		;b2c5
	jr c,L_B2CB		;b2c7
	ld l,007h		;b2c9
L_B2CB:
	ld a,r		;b2cb
	and l			;b2cd
	ld hl,0b2e9h		;b2ce
	call 0423eh		;b2d1
	ld a,(hl)			;b2d4
	push af			;b2d5
	cp 031h		;b2d6
	jr nc,L_B2E5		;b2d8
	ld a,(0cb73h)		;b2da
	cp 003h		;b2dd
	jr nc,L_B2E5		;b2df
	inc a			;b2e1
	ld (0cb73h),a		;b2e2
L_B2E5:
	pop af			;b2e5
	jp 08dd3h		;b2e6

; ----------------------------------------------------------------------
; DATOS resto_B2E9: lo apuntan con el banco puesto p07:B2CE (0xB2E9); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p07:B2CE (16 bytes)
;   0xb2e9..0xb2f9  (16 bytes)
DATA_resto_B2E9:
	defb 032h,037h,033h,034h,035h,03bh,035h,036h,02eh,02eh,038h,03ah,02fh,039h,02fh,030h	; b2e9  27345.56..8:/9/0

; ======================================================================
; CODIGO 0xb2f9..0xb447  (334 bytes)
; ======================================================================


L_B2F9:
	ld a,(0e063h)		;b2f9
	add a,010h		;b2fc
	ld l,a			;b2fe
	ld a,(0e065h)		;b2ff
	add a,008h		;b302
	ld h,a			;b304
	ld de,00810h		;b305
	ret			;b308
L_B309:
	call L_B5CC		;b309
	ret nz			;b30c
	ld ix,0d4c0h		;b30d
	ld b,002h		;b311
L_B313:
	exx			;b313
	call L_BA1D		;b314
	exx			;b317
	jr nz,L_B32E		;b318
	call L_B5AF		;b31a
	jr nc,L_B32E		;b31d
	ld c,018h		;b31f
	xor a			;b321
	call L_B393		;b322
	push hl			;b325
	push de			;b326
	push bc			;b327
	call 07b09h		;b328
	pop bc			;b32b
	pop de			;b32c
	pop hl			;b32d
L_B32E:
	exx			;b32e
	ld de,00010h		;b32f
	add ix,de		;b332
	exx			;b334
	djnz L_B313		;b335
	ret			;b337
L_B338:
	ld a,(0ca4bh)		;b338
	cp 002h		;b33b
	ret nz			;b33d
	ld ix,0d820h		;b33e
	ld a,(ix+000h)		;b342
	cp 009h		;b345
	ret nz			;b347
	ld a,(ix+00dh)		;b348
	sub 008h		;b34b
	cp 004h		;b34d
	ret nc			;b34f
	call L_B5CC		;b350
	exx			;b353
	call L_BA71		;b354
	exx			;b357
	call L_B5AF		;b358
	ret nc			;b35b
	ld c,004h		;b35c
	call L_B371		;b35e
	ld a,(0cb54h)		;b361
	or a			;b364
	ret nz			;b365
	ld a,001h		;b366
	ld (0cb54h),a		;b368
	ld a,009h		;b36b
	ld (0cb56h),a		;b36d
	ret			;b370
L_B371:
	xor a			;b371
	ld (0d4e7h),a		;b372
	jr L_B393		;b375
L_B377:
	ld (0d4e7h),a		;b377
	ld a,(0ca41h)		;b37a
	and a			;b37d
	ret nz			;b37e
	ld a,(0cb3ch)		;b37f
	or a			;b382
	ret nz			;b383
	ld a,(ix+000h)		;b384
	and 07fh		;b387
	cp 014h		;b389
	jp z,08dbdh		;b38b
	cp 012h		;b38e
	jp z,08dbdh		;b390
L_B393:
	push hl			;b393
	push de			;b394
	push bc			;b395
	call L_B3A5		;b396
	call 08dc6h		;b399
	call 08dcbh		;b39c
	pop bc			;b39f
	pop de			;b3a0
	pop hl			;b3a1
	jp 06b16h		;b3a2
L_B3A5:
	ld a,(0cb3dh)		;b3a5
	or a			;b3a8
	ret nz			;b3a9
	ld a,(0cb00h)		;b3aa
	cp 014h		;b3ad
	ret z			;b3af
	ld a,(0d4e7h)		;b3b0
	or a			;b3b3
	jr z,L_B3C2		;b3b4
	ld a,(0cb21h)		;b3b6
	cp 005h		;b3b9
	jr nz,L_B3C2		;b3bb
	ld a,c			;b3bd
	rra			;b3be
	and 07fh		;b3bf
	ld c,a			;b3c1
L_B3C2:
	ld hl,0ca53h		;b3c2
	ld a,(hl)			;b3c5
	sub c			;b3c6
	jr z,L_B3CD		;b3c7
	jr c,L_B3CD		;b3c9
	ld (hl),a			;b3cb
	ret			;b3cc
L_B3CD:
	ld (hl),000h		;b3cd
	call 08dadh		;b3cf
	ld a,(0ca53h)		;b3d2
	or a			;b3d5
	jp z,08dbdh		;b3d6
	ret			;b3d9
L_B3DA:
	push hl			;b3da
	push de			;b3db
	push bc			;b3dc
	call L_B3E3		;b3dd
	jp L_B465		;b3e0
L_B3E3:
	ld a,(ix+010h)		;b3e3
	cp 0ffh		;b3e6
	ret z			;b3e8
	call 06a40h		;b3e9
	ld (ix+01fh),004h		;b3ec
	dec (ix+010h)		;b3f0
	jr z,L_B3F8		;b3f3
	jp 07af9h		;b3f5
L_B3F8:
	call L_B401		;b3f8
	call 07af0h		;b3fb
	jp 07ae0h		;b3fe
L_B401:
	ld a,(0ca5fh)		;b401
	and a			;b404
	ret nz			;b405
	ld a,(ix+000h)		;b406
	and 07fh		;b409
	cp 00ah		;b40b
	ret nc			;b40d
	ld a,(0cab5h)		;b40e
	ld hl,0b447h		;b411
	call 0423eh		;b414
	ld a,(0ca03h)		;b417
	ld b,a			;b41a
	add a,a			;b41b
	add a,a			;b41c
	cp (hl)			;b41d
	ret c			;b41e
	ld a,b			;b41f
	and 00fh		;b420
	ld c,000h		;b422
	cp 004h		;b424
	jr c,L_B433		;b426
	inc c			;b428
	cp 008h		;b429
	jr c,L_B433		;b42b
	inc c			;b42d
	cp 00ch		;b42e
	jr c,L_B433		;b430
	inc c			;b432
L_B433:
	ld a,c			;b433
	add a,02eh		;b434
	ld c,a			;b436
	cp 031h		;b437
	jr nz,L_B444		;b439
	ld a,(0d600h)		;b43b
	ld b,a			;b43e
	ld a,(0d604h)		;b43f
	or b			;b442
	ret z			;b443
L_B444:
	jp 07b01h		;b444

; ----------------------------------------------------------------------
; DATOS resto_B447: lo apuntan con el banco puesto p07:B411 (0xB447); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p07:B411 (7 bytes)
;   0xb447..0xb44e  (7 bytes)
DATA_resto_B447:
	defb 0b0h,0b8h,0c8h,0d0h,0d8h,0e0h,0e8h	; b447

; ======================================================================
; CODIGO 0xb44e..0xb521  (211 bytes)
; ======================================================================


L_B44E:
	push hl			;b44e
	push de			;b44f
	push bc			;b450
	call 07ac8h		;b451
	jr L_B465		;b454
L_B456:
	ld a,(ix+010h)		;b456
	cp 0ffh		;b459
	ret z			;b45b
	push hl			;b45c
	push de			;b45d
	push bc			;b45e
	call 07af0h		;b45f
	call 07ae0h		;b462
L_B465:
	pop bc			;b465
	pop de			;b466
	pop hl			;b467
	ret			;b468
L_B469:
	push hl			;b469
	push de			;b46a
	push bc			;b46b
	call L_B471		;b46c
	jr L_B465		;b46f
L_B471:
	push bc			;b471
	call L_B502		;b472
	pop bc			;b475
	ld a,(ix+010h)		;b476
	sub c			;b479
	jr nc,L_B47D		;b47a
	xor a			;b47c
L_B47D:
	ld (ix+010h),a		;b47d
	and a			;b480
	jr z,L_B4C0		;b481
	push bc			;b483
	call L_B4A3		;b484
	pop bc			;b487
	ld (ix+016h),000h		;b488
	ld a,c			;b48c
	add a,a			;b48d
	add a,a			;b48e
	cp 00ah		;b48f
	jr nc,L_B495		;b491
	ld a,00ah		;b493
L_B495:
	ld (ix+017h),a		;b495
	ld a,(ix+000h)		;b498
	cp 009h		;b49b
	ret nz			;b49d
	ld (ix+013h),0fdh		;b49e
	ret			;b4a2
L_B4A3:
	ld a,(ix+000h)		;b4a3
	ld c,018h		;b4a6
	cp 006h		;b4a8
	jr z,L_B4B6		;b4aa
	cp 00ah		;b4ac
	jr z,L_B4B6		;b4ae
	cp 008h		;b4b0
	jr z,L_B4B6		;b4b2
	ld c,008h		;b4b4
L_B4B6:
	ld a,(ix+010h)		;b4b6
	cp c			;b4b9
	jp nc,06c17h		;b4ba
	jp 06c57h		;b4bd
L_B4C0:
	ld hl,lb520h		;b4c0
	ld a,(ix+000h)		;b4c3
	call 0423eh		;b4c6
	ld a,(hl)			;b4c9
	ld (ix+001h),a		;b4ca
	ld (ix+016h),000h		;b4cd
	ld (ix+017h),004h		;b4d1
L_B4D5:
	ld hl,0d460h		;b4d5
	ld bc,0005fh		;b4d8
	call 04236h		;b4db
	ld hl,0d4c0h		;b4de
	ld bc,0001fh		;b4e1
	call 04236h		;b4e4
	ld hl,0dc68h		;b4e7
	ld bc,00017h		;b4ea
	ld a,0e0h		;b4ed
	call 04237h		;b4ef
	ld a,(0d8a4h)		;b4f2
	and a			;b4f5
	ret z			;b4f6
	ld hl,0dc28h		;b4f7
	ld bc,0000fh		;b4fa
	ld a,0e0h		;b4fd
	jp 04237h		;b4ff
L_B502:
	ld a,(ix+000h)		;b502
	cp 005h		;b505
	ret nz			;b507
	ld (ix+018h),006h		;b508
	ld a,(ix+00ch)		;b50c
	ld (ix+015h),a		;b50f
	ld a,(ix+00dh)		;b512
	ld (ix+01dh),a		;b515
	xor a			;b518
	ld (ix+00ch),a		;b519
	ld (ix+016h),a		;b51c
	or a			;b51f
L_B520:
	ret			;b520

; ----------------------------------------------------------------------
; DATOS sin identificar  0xb521..0xb52c  (11 bytes)
DATA_B521:
	defb 000h,000h,00dh,00fh,020h,020h,020h,00fh,010h,00ch,006h	; b521  ....   ....

; ======================================================================
; CODIGO 0xb52c..0xb535  (9 bytes)
; ======================================================================


L_B52C:
	ld a,c			;b52c
	ld hl,lb534h		;b52d
	call 0423eh		;b530
	ld c,(hl)			;b533
L_B534:
	ret			;b534

; ----------------------------------------------------------------------
; DATOS sin identificar  0xb535..0xb53d  (8 bytes)
DATA_B535:
	defb 002h,002h,004h,000h,004h,004h,000h,000h	; b535  ........

; ======================================================================
; CODIGO 0xb53d..0xb55b  (30 bytes)
; ======================================================================


L_B53D:
	ld a,(0d8a0h)		;b53d
	and a			;b540
	ld c,00ah		;b541
	ld a,001h		;b543
	ret nz			;b545
	ld a,(0d840h)		;b546
	cp 00ah		;b549
	ld c,010h		;b54b
	ld a,001h		;b54d
	ret z			;b54f
	ld a,(ix+000h)		;b550
	ld hl,lb55ah		;b553
	call 0423eh		;b556
	ld c,(hl)			;b559
L_B55A:
	ret			;b55a

; ----------------------------------------------------------------------
; DATOS sin identificar  0xb55b..0xb563  (8 bytes)
DATA_B55B:
	defb 000h,000h,012h,006h,006h,006h,018h,00ah	; b55b  ........

; ======================================================================
; CODIGO 0xb563..0xb62e  (203 bytes)
; ======================================================================


L_B563:
	push hl			;b563
	push de			;b564
	push bc			;b565
	push iy		;b566
	pop hl			;b568
	call 05fe0h		;b569
	xor a			;b56c
	ld (iy+000h),a		;b56d
	ld (0cb52h),a		;b570
	ld a,c			;b573
	ld e,(iy+004h)		;b574
	ld d,(iy+005h)		;b577
	ld c,001h		;b57a
	ld a,(iy+002h)		;b57c
	sub 004h		;b57f
	jr nc,L_B584		;b581
	xor a			;b583
L_B584:
	and 0feh		;b584
	cp 0b0h		;b586
	jr c,L_B58C		;b588
	ld a,0b0h		;b58a
L_B58C:
	ld l,a			;b58c
	ld a,(iy+003h)		;b58d
	sub 004h		;b590
	jr nc,L_B595		;b592
	xor a			;b594
L_B595:
	and 0feh		;b595
	cp 0b0h		;b597
	jr c,L_B59D		;b599
	ld a,0b0h		;b59b
L_B59D:
	ld h,a			;b59d
	call 08db5h		;b59e
L_B5A1:
	jp L_B465		;b5a1
L_B5A4:
	push hl			;b5a4
	push de			;b5a5
	push bc			;b5a6
	push iy		;b5a7
	pop hl			;b5a9
	call 05fe0h		;b5aa
	jr L_B5A1		;b5ad
L_B5AF:
	exx			;b5af
	ld a,d			;b5b0
	exx			;b5b1
	add a,d			;b5b2
	ld c,a			;b5b3
	exx			;b5b4
	ld a,h			;b5b5
	exx			;b5b6
	sub h			;b5b7
	jr nc,L_B5BC		;b5b8
	neg		;b5ba
L_B5BC:
	cp c			;b5bc
	ret nc			;b5bd
	exx			;b5be
	ld a,l			;b5bf
	exx			;b5c0
	sub l			;b5c1
	jr c,L_B5C8		;b5c2
	exx			;b5c4
	cp e			;b5c5
	exx			;b5c6
	ret			;b5c7
L_B5C8:
	neg		;b5c8
	cp e			;b5ca
	ret			;b5cb
L_B5CC:
	ld a,(0ca4ah)		;b5cc
	cp 00ah		;b5cf
	jr nz,L_B5E6		;b5d1
	ld a,(0ca4bh)		;b5d3
	cp 00bh		;b5d6
	jr z,L_B5F2		;b5d8
	cp 00ch		;b5da
	jr z,L_B5F2		;b5dc
	cp 010h		;b5de
	jr z,L_B5F2		;b5e0
	cp 011h		;b5e2
	jr z,L_B5F2		;b5e4
L_B5E6:
	ld a,(0ca8dh)		;b5e6
	or a			;b5e9
	jr nz,L_B5F2		;b5ea
	ld a,(0cb32h)		;b5ec
	or a			;b5ef
	jr nz,$+86		;b5f0
L_B5F2:
	call L_B624		;b5f2
	ld a,(0ca8dh)		;b5f5
	or a			;b5f8
	jr z,L_B5FD		;b5f9
	xor a			;b5fb
	ret			;b5fc
L_B5FD:
	push af			;b5fd
	ld a,(0cb43h)		;b5fe
	add a,l			;b601
	ld l,a			;b602
	call L_B608		;b603
	pop af			;b606
	ret			;b607
L_B608:
	ld a,(0cb28h)		;b608
	or a			;b60b
	ret z			;b60c
	dec a			;b60d
	jr z,L_B61F		;b60e
	ld a,(0cb29h)		;b610
	ld c,a			;b613
	sub 004h		;b614
	ld e,a			;b616
	ld a,020h		;b617
	sub c			;b619
	ld c,a			;b61a
	ld a,l			;b61b
	sub c			;b61c
	ld l,a			;b61d
	ret			;b61e
L_B61F:
	ld a,(0cb29h)		;b61f
	ld e,a			;b622
	ret			;b623
L_B624:
	ld a,(0cb01h)		;b624
	cp 00ch		;b627
	jr nc,$+29		;b629
	call 0424dh		;b62b

; ----------------------------------------------------------------------
; DATOS tabla_B62E: 12 destinos del despachador p00:424D (call en p07:B62B, el
;   indice en A): B649, B649, B650, B649, B662, B649, B649, B662, B649, B649,
;   B649, B669; lo leen p07:B62B (24 bytes)
;   0xb62e..0xb646  (24 bytes)
DATA_tabla_B62E:
	defw 0b649h,0b649h,0b650h,0b649h,0b662h,0b649h,0b649h,0b662h	; b62e
	defw 0b649h,0b649h,0b649h,0b669h	; b63e  -> L_B649 L_B649 L_B649 L_B669

; ======================================================================
; CODIGO 0xb646..0xb6a5  (95 bytes)
; ======================================================================


L_B646:
	or 001h		;b646
	ret			;b648
L_B649:
	call L_B8BB		;b649
	ld de,0061ch		;b64c
	ret			;b64f
L_B650:
	call L_B8BB		;b650
	ld de,00e06h		;b653
	ld a,(0cb0eh)		;b656
	cp 003h		;b659
	jr nc,L_B660		;b65b
	ld de,0080dh		;b65d
L_B660:
	xor a			;b660
	ret			;b661
L_B662:
	call L_B8BB		;b662
	ld de,00614h		;b665
	ret			;b668
L_B669:
	call L_B8BB		;b669
	ld de,00810h		;b66c
	ret			;b66f
L_B670:
	ld a,(0ca4ah)		;b670
	cp 00ah		;b673
	jr nz,L_B68A		;b675
	ld a,(0ca4bh)		;b677
	cp 00bh		;b67a
	jr z,L_B690		;b67c
	cp 00ch		;b67e
	jr z,L_B690		;b680
	cp 010h		;b682
	jr z,L_B690		;b684
	cp 011h		;b686
	jr z,L_B690		;b688
L_B68A:
	ld a,(0cb32h)		;b68a
	or a			;b68d
	jr nz,L_B646		;b68e
L_B690:
	call L_B69B		;b690
	push af			;b693
	ld a,(0cb43h)		;b694
	add a,l			;b697
	ld l,a			;b698
	pop af			;b699
	ret			;b69a
L_B69B:
	ld a,(0cb01h)		;b69b
	cp 00ch		;b69e
	jr nc,L_B646		;b6a0
	call 0424dh		;b6a2

; ----------------------------------------------------------------------
; DATOS tabla_B6A5: 12 destinos del despachador p00:424D (call en p07:B6A2, el
;   indice en A): B6BD, B6BD, B650, B6BD, B662, B6BD, B6BD, B662, B6BD, B6BD,
;   B6BD, B669; lo leen p07:B6A2 (24 bytes)
;   0xb6a5..0xb6bd  (24 bytes)
DATA_tabla_B6A5:
	defw 0b6bdh,0b6bdh,0b650h,0b6bdh,0b662h,0b6bdh,0b6bdh,0b662h	; b6a5
	defw 0b6bdh,0b6bdh,0b6bdh,0b669h	; b6b5  -> L_B6BD L_B6BD L_B6BD L_B669

; ======================================================================
; CODIGO 0xb6bd..0xb6e9  (44 bytes)
; ======================================================================


L_B6BD:
	ld a,(0cb03h)		;b6bd
	sub 00ch		;b6c0
	ld l,a			;b6c2
	ld a,(0cb05h)		;b6c3
	ld h,a			;b6c6
	ld de,00508h		;b6c7
	xor a			;b6ca
	ret			;b6cb
L_B6CC:
	ld a,(0cb32h)		;b6cc
	or a			;b6cf
	jp nz,L_B646		;b6d0
	call L_B6DE		;b6d3
	push af			;b6d6
	ld a,(0cb43h)		;b6d7
	add a,l			;b6da
	ld l,a			;b6db
	pop af			;b6dc
	ret			;b6dd
L_B6DE:
	ld a,(0cb01h)		;b6de
	cp 00ch		;b6e1
	jp nc,L_B646		;b6e3
	call 0424dh		;b6e6

; ----------------------------------------------------------------------
; DATOS tabla_B6E9: 12 destinos del despachador p00:424D (call en p07:B6E6, el
;   indice en A): B701, B701, B650, B701, B701, B701, B701, B701, B701, B701,
;   B701, B708; lo leen p07:B6E6 (24 bytes)
;   0xb6e9..0xb701  (24 bytes)
DATA_tabla_B6E9:
	defw 0b701h,0b701h,0b650h,0b701h,0b701h,0b701h,0b701h,0b701h	; b6e9
	defw 0b701h,0b701h,0b701h,0b708h	; b6f9  -> L_B701 L_B701 L_B701 L_B708

; ======================================================================
; CODIGO 0xb701..0xb72c  (43 bytes)
; ======================================================================


L_B701:
	call L_B8BB		;b701
	ld de,00604h		;b704
	ret			;b707
L_B708:
	call L_B8BB		;b708
	ld de,00808h		;b70b
	ret			;b70e
L_B70F:
	ld de,00204h		;b70f
	ld a,(0cb0eh)		;b712
	dec a			;b715
	ld hl,0b72ch		;b716
	add a,a			;b719
	call 0423eh		;b71a
	call L_AC33		;b71d
	ld a,(0cb03h)		;b720
	add a,l			;b723
	ld l,a			;b724
	ld a,(0cb05h)		;b725
	add a,h			;b728
	ld h,a			;b729
	xor a			;b72a
	ret			;b72b

; ----------------------------------------------------------------------
; DATOS resto_B72C: lo apuntan con el banco puesto p07:B716 (0xB72C); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p07:B716 (8 bytes)
;   0xb72c..0xb734  (8 bytes)
DATA_resto_B72C:
	defb 0e0h,000h,000h,000h,0e4h,0f6h,0e4h,00ah	; b72c  ........

; ======================================================================
; CODIGO 0xb734..0xb73a  (6 bytes)
; ======================================================================


L_B734:
	ld a,(iy+000h)		;b734
	call 0424dh		;b737

; ----------------------------------------------------------------------
; DATOS tabla_B73A: 10 destinos del despachador p00:424D (call en p07:B737, el
;   indice en A): B646, B74E, B74E, B646, B646, B646, B75E, B646, B646, B74E;
;   lo leen p07:B737 (20 bytes)
;   0xb73a..0xb74e  (20 bytes)
DATA_tabla_B73A:
	defw 0b646h,0b74eh,0b74eh,0b646h,0b646h,0b646h,0b75eh,0b646h	; b73a
	defw 0b646h,0b74eh	; b74a  -> L_B646 L_B74E

; ======================================================================
; CODIGO 0xb74e..0xb879  (299 bytes)
; ======================================================================


L_B74E:
	ld a,(iy+003h)		;b74e
	add a,002h		;b751
	ld l,a			;b753
	ld a,(iy+005h)		;b754
	inc a			;b757
	ld h,a			;b758
	ld de,00102h		;b759
	xor a			;b75c
	ret			;b75d
L_B75E:
	ld a,(iy+00bh)		;b75e
	cp 002h		;b761
	jr c,L_B776		;b763
	ld de,00806h		;b765
	ld a,(iy+003h)		;b768
	add a,006h		;b76b
	ld l,a			;b76d
	ld a,(iy+005h)		;b76e
	add a,008h		;b771
	ld h,a			;b773
	xor a			;b774
	ret			;b775
L_B776:
	ld de,00310h		;b776
	ld a,(iy+003h)		;b779
	add a,010h		;b77c
	ld l,a			;b77e
	ld a,(iy+005h)		;b77f
	add a,003h		;b782
	ld h,a			;b784
	xor a			;b785
	ret			;b786
L_B787:
	ld a,(iy+000h)		;b787
	or a			;b78a
	jp z,L_B646		;b78b
	jr L_B7A5		;b78e
L_B790:
	ld a,(iy+000h)		;b790
	or a			;b793
	jp z,L_B646		;b794
	ld a,(0ca50h)		;b797
	cp (iy+004h)		;b79a
	ret nz			;b79d
	ld a,(0ca51h)		;b79e
	cp (iy+005h)		;b7a1
	ret nz			;b7a4
L_B7A5:
	ld a,(iy+002h)		;b7a5
	add a,020h		;b7a8
	ld l,a			;b7aa
	ld a,(iy+003h)		;b7ab
	add a,008h		;b7ae
	ld h,a			;b7b0
	ld de,01830h		;b7b1
	xor a			;b7b4
	ret			;b7b5
L_B7B6:
	ld a,(iy+000h)		;b7b6
	or a			;b7b9
	jp z,L_B646		;b7ba
	jr L_B7F3		;b7bd
L_B7BF:
	ld a,(iy+000h)		;b7bf
	ld e,a			;b7c2
	or a			;b7c3
	jp z,L_B646		;b7c4
	ld d,004h		;b7c7
	ld a,(0ca76h)		;b7c9
	or a			;b7cc
	jr nz,L_B7E0		;b7cd
	dec d			;b7cf
	ld a,(0ca77h)		;b7d0
	and a			;b7d3
	jr nz,L_B7E0		;b7d4
	dec d			;b7d6
	ld a,(0ca65h)		;b7d7
	ld d,002h		;b7da
	and a			;b7dc
	jr nz,L_B7E0		;b7dd
	dec d			;b7df
L_B7E0:
	ld a,e			;b7e0
	cp d			;b7e1
	jp nz,L_B646		;b7e2
	ld de,(0ca50h)		;b7e5
	ld a,e			;b7e9
	cp (iy+004h)		;b7ea
	ret nz			;b7ed
	ld a,d			;b7ee
	cp (iy+005h)		;b7ef
	ret nz			;b7f2
L_B7F3:
	ld a,(iy+002h)		;b7f3
	add a,00ah		;b7f6
	ld l,a			;b7f8
	ld a,(iy+003h)		;b7f9
	add a,004h		;b7fc
	ld h,a			;b7fe
	ld de,0060ch		;b7ff
	xor a			;b802
	ret			;b803
L_B804:
	ld ix,0d760h		;b804
	ld a,(ix+000h)		;b808
	or a			;b80b
	jp z,L_B646		;b80c
	ld b,004h		;b80f
	ld a,(0ca76h)		;b811
	or a			;b814
	jr nz,L_B826		;b815
	dec b			;b817
	ld a,(0d8c0h)		;b818
	or a			;b81b
	jr nz,L_B826		;b81c
	dec b			;b81e
	ld a,(0ca65h)		;b81f
	or a			;b822
	jr nz,L_B826		;b823
	dec b			;b825
L_B826:
	ld a,b			;b826
	cp (ix+000h)		;b827
	ret nz			;b82a
	ld a,(0ca50h)		;b82b
	cp (ix+004h)		;b82e
	ret nz			;b831
	ld a,(0ca51h)		;b832
	cp (ix+005h)		;b835
	ret nz			;b838
	ld a,(ix+002h)		;b839
	add a,020h		;b83c
	ld l,a			;b83e
	ld a,(ix+003h)		;b83f
	add a,008h		;b842
	ld h,a			;b844
	ld de,00820h		;b845
	xor a			;b848
	ret			;b849
L_B84A:
	ld a,(0cb44h)		;b84a
	or a			;b84d
	jp z,L_B646		;b84e
	ld a,(0cb46h)		;b851
	cp 004h		;b854
	jp c,L_B646		;b856
	ld a,(0cb0eh)		;b859
	dec a			;b85c
	add a,a			;b85d
	add a,a			;b85e
	ld hl,0b879h		;b85f
	call 0423eh		;b862
	ld e,(hl)			;b865
	inc hl			;b866
	ld d,(hl)			;b867
	inc hl			;b868
	ld a,(hl)			;b869
	inc hl			;b86a
	ld h,(hl)			;b86b
	ld l,a			;b86c
	ld a,(0cb03h)		;b86d
	add a,l			;b870
	ld l,a			;b871
	ld a,(0cb05h)		;b872
	add a,h			;b875
	ld h,a			;b876
	xor a			;b877
	ret			;b878

; ----------------------------------------------------------------------
; DATOS resto_B879: lo apuntan con el banco puesto p07:B85F (0xB879); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p07:B85F (16 bytes)
;   0xb879..0xb889  (16 bytes)
DATA_resto_B879:
	defb 040h,004h,0e0h,000h,040h,004h,030h,0feh,010h,020h,0eah,0d8h,010h,020h,0eah,028h	; b879  @...@.0.. ... .(

; ======================================================================
; CODIGO 0xb889..0xb89b  (18 bytes)
; ======================================================================


L_B889:
	ld a,(0dff8h)		;b889
	or a			;b88c
	jp z,L_B646		;b88d
	ld a,(0ca61h)		;b890
	or a			;b893
	jp z,L_B646		;b894
	dec a			;b897
	call 0424dh		;b898

; ----------------------------------------------------------------------
; DATOS tabla_B89B: 4 destinos del despachador p00:424D (call en p07:B898, el
;   indice en A): B8A3, B8A3, B8AE, B8AE; lo leen p07:B898 (8 bytes)
;   0xb89b..0xb8a3  (8 bytes)
DATA_tabla_B89B:
	defw 0b8a3h,0b8a3h,0b8aeh,0b8aeh	; b89b  -> L_B8A3 L_B8A3 L_B8AE L_B8AE

; ======================================================================
; CODIGO 0xb8a3..0xba8a  (487 bytes)
; ======================================================================


L_B8A3:
	ld a,(0dffdh)		;b8a3
	ld l,a			;b8a6
	ld h,060h		;b8a7
	ld de,06010h		;b8a9
	xor a			;b8ac
	ret			;b8ad
L_B8AE:
	ld a,(0dffeh)		;b8ae
	add a,008h		;b8b1
	ld h,a			;b8b3
	ld l,0c0h		;b8b4
	ld de,008c0h		;b8b6
	xor a			;b8b9
	ret			;b8ba
L_B8BB:
	ld a,(0cb03h)		;b8bb
	ld l,a			;b8be
	ld a,(0cb05h)		;b8bf
	ld h,a			;b8c2
	xor a			;b8c3
	ret			;b8c4
L_B8C5:
	ld de,(0ca50h)		;b8c5
	ld a,(ix+000h)		;b8c9
	and 07fh		;b8cc
	cp 010h		;b8ce
	ld hl,0ba95h		;b8d0
	jr nc,L_B91D		;b8d3
	ld a,(ix+001h)		;b8d5
	sub 008h		;b8d8
	cp 002h		;b8da
	jp c,L_B977		;b8dc
	ld hl,0ba92h		;b8df
	jr L_B91D		;b8e2
L_B8E4:
	ld d,(iy+005h)		;b8e4
	ld e,(iy+004h)		;b8e7
	jr L_B90E		;b8ea
L_B8EC:
	ld d,(iy+005h)		;b8ec
	ld e,(iy+004h)		;b8ef
	ld a,(ix+000h)		;b8f2
	and 07fh		;b8f5
	cp 014h		;b8f7
	ld hl,0babfh		;b8f9
	jr z,L_B91D		;b8fc
	cp 010h		;b8fe
	ld hl,0bad1h		;b900
	jr nc,L_B91D		;b903
	ld hl,0baceh		;b905
	jr L_B91D		;b908
L_B90A:
	ld de,(0ca50h)		;b90a
L_B90E:
	ld a,(ix+000h)		;b90e
	and 07fh		;b911
	cp 010h		;b913
	ld hl,0bab3h		;b915
	jr nc,L_B91D		;b918
	ld hl,0bab0h		;b91a
L_B91D:
	ld a,(ix+000h)		;b91d
	and 07fh		;b920
	ld c,a			;b922
	and a			;b923
	jr z,L_B977		;b924
	cp 008h		;b926
	jr nz,L_B930		;b928
	ld a,(0d441h)		;b92a
	and a			;b92d
	jr nz,L_B977		;b92e
L_B930:
	call 041ddh		;b930
	push de			;b933
	call 07e35h		;b934
	pop de			;b937
	call 041adh		;b938
	jr c,L_B977		;b93b
	ld a,e			;b93d
	cp (ix+00ah)		;b93e
	jr nz,L_B977		;b941
	ld a,d			;b943
	cp (ix+00bh)		;b944
	jr nz,L_B977		;b947
	ld a,(ix+000h)		;b949
	and 07fh		;b94c
	ld c,a			;b94e
	cp 013h		;b94f
	jr nz,L_B95A		;b951
	ld a,(ix+001h)		;b953
	cp 002h		;b956
	jr nc,L_B977		;b958
L_B95A:
	ld a,c			;b95a
	sub 010h		;b95b
	jr c,L_B965		;b95d
	ld c,a			;b95f
	add a,a			;b960
	add a,c			;b961
	call 0423eh		;b962
L_B965:
	ld a,(hl)			;b965
	and a			;b966
	jr z,L_B977		;b967
	ld e,a			;b969
	inc hl			;b96a
	ld d,(hl)			;b96b
	inc hl			;b96c
	ld a,(hl)			;b96d
	add a,(ix+003h)		;b96e
	ld l,a			;b971
	ld h,(ix+005h)		;b972
	xor a			;b975
	ret			;b976
L_B977:
	or 001h		;b977
	ret			;b979
L_B97A:
	ld de,(0ca50h)		;b97a
	ld a,(ix+000h)		;b97e
	sub 003h		;b981
	jr c,L_B977		;b983
	cp 007h		;b985
	ld hl,0ba92h		;b987
	jr nz,L_B9CA		;b98a
	ld hl,0ba95h		;b98c
	jr L_B9CA		;b98f
L_B991:
	ld d,(iy+005h)		;b991
	ld e,(iy+004h)		;b994
	jr L_B9B9		;b997
L_B999:
	ld d,(iy+005h)		;b999
	ld e,(iy+004h)		;b99c
	ld a,(ix+000h)		;b99f
	and a			;b9a2
	jr z,L_B977		;b9a3
	cp 003h		;b9a5
	jr c,L_B977		;b9a7
	cp 007h		;b9a9
	ld hl,0baceh		;b9ab
	jr nz,L_B9CA		;b9ae
	ld hl,0bad1h		;b9b0
	jr L_B9CA		;b9b3
L_B9B5:
	ld de,(0ca50h)		;b9b5
L_B9B9:
	ld a,(ix+000h)		;b9b9
	cp 003h		;b9bc
	jr c,L_B977		;b9be
	cp 007h		;b9c0
	ld hl,0bab0h		;b9c2
	jr nz,L_B9CA		;b9c5
	ld hl,0bab3h		;b9c7
L_B9CA:
	ld a,(ix+016h)		;b9ca
	and a			;b9cd
	jr z,L_B977		;b9ce
	ld a,(0ca76h)		;b9d0
	and a			;b9d3
	jr z,L_B9DD		;b9d4
	ld a,(ix+012h)		;b9d6
	cp 029h		;b9d9
	jr nz,L_B977		;b9db
L_B9DD:
	ld a,e			;b9dd
	cp (ix+00ah)		;b9de
	jr nz,L_B977		;b9e1
	ld a,d			;b9e3
	cp (ix+00bh)		;b9e4
	jr nz,L_B977		;b9e7
	ld a,(ix+000h)		;b9e9
	cp 007h		;b9ec
	jr nz,L_B9FF		;b9ee
	ld a,(ix+014h)		;b9f0
	and a			;b9f3
	jp nz,L_B977		;b9f4
	ld a,(ix+00dh)		;b9f7
	cp 008h		;b9fa
	jp z,L_B977		;b9fc
L_B9FF:
	ld a,(ix+000h)		;b9ff
	cp 00bh		;ba02
	jr z,L_BA0D		;ba04
	ld a,(0ca77h)		;ba06
	and a			;ba09
	jp nz,L_B977		;ba0a
L_BA0D:
	ld a,(hl)			;ba0d
	ld e,a			;ba0e
	inc hl			;ba0f
	ld d,(hl)			;ba10
	inc hl			;ba11
	ld a,(hl)			;ba12
	add a,(ix+003h)		;ba13
	ld c,a			;ba16
	ld h,(ix+005h)		;ba17
	ld l,c			;ba1a
	xor a			;ba1b
	ret			;ba1c
L_BA1D:
	ld a,(ix+000h)		;ba1d
	and a			;ba20
	jp z,L_B977		;ba21
	ld a,(ix+001h)		;ba24
	cp 003h		;ba27
	jp nc,L_B977		;ba29
	ld a,(ix+00fh)		;ba2c
	cp 003h		;ba2f
	jr c,L_BA35		;ba31
	sub 003h		;ba33
L_BA35:
	ld hl,0bb04h		;ba35
	jr L_BA4D		;ba38
L_BA3A:
	ld a,(ix+000h)		;ba3a
	and a			;ba3d
	jp z,L_B977		;ba3e
	cp 003h		;ba41
	jp c,L_B977		;ba43
	jr z,L_BA65		;ba46
	sub 004h		;ba48
	ld hl,0baech		;ba4a
L_BA4D:
	add a,a			;ba4d
	add a,a			;ba4e
	call 0423eh		;ba4f
L_BA52:
	ld a,(hl)			;ba52
	ld e,a			;ba53
	inc hl			;ba54
	ld d,(hl)			;ba55
	inc hl			;ba56
	ld a,(hl)			;ba57
	add a,(ix+003h)		;ba58
	ld c,a			;ba5b
	inc hl			;ba5c
	ld a,(hl)			;ba5d
	add a,(ix+005h)		;ba5e
	ld h,a			;ba61
	ld l,c			;ba62
	xor a			;ba63
	ret			;ba64
L_BA65:
	ld a,(ix+001h)		;ba65
	and a			;ba68
	jp z,L_B977		;ba69
	ld hl,0bb00h		;ba6c
	jr L_BA52		;ba6f
L_BA71:
	ld a,(ix+00dh)		;ba71
	sub 008h		;ba74
	ld hl,0ba8ah		;ba76
	call 043f6h		;ba79
	ld a,(ix+005h)		;ba7c
	add a,h			;ba7f
	ld h,a			;ba80
	ld a,(ix+003h)		;ba81
	add a,l			;ba84
	ld l,a			;ba85
	ld de,00204h		;ba86
	ret			;ba89

; ----------------------------------------------------------------------
; DATOS resto_BA8A: lo apuntan con el banco puesto p07:BA76 (0xBA8A), p07:B8DF
;   (0xBA92), p07:B987 (0xBA92), p07:B8D0 (0xBA95), p07:B98C (0xBA95),
;   p07:B91A (0xBAB0); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p07:BA76, p07:B8DF, p07:B987, p07:B8D0, p07:B98C,
;   p07:B91A (134 bytes)
;   0xba8a..0xbb10  (134 bytes)
DATA_resto_BA8A:
	defb 0e2h,000h,0f2h,000h,0eeh,0f5h,0eeh,00ah,008h,005h,0f4h,006h,005h,0fbh,006h,005h	; ba8a  ................
	defb 0fbh,006h,005h,0fbh,006h,005h,0fbh,020h,014h,010h,000h,000h,000h,006h,005h,0fbh	; ba9a  ....... ........
	defb 000h,000h,000h,006h,005h,0fbh,01ch,005h,0fch,018h,005h,0feh,018h,005h,0feh,00eh	; baaa  ................
	defb 005h,0feh,00eh,005h,0feh,030h,018h,018h,000h,000h,000h,018h,005h,0feh,000h,000h	; baba  .....0..........
	defb 000h,00eh,005h,0feh,004h,006h,000h,004h,005h,000h,004h,005h,000h,004h,005h,000h	; baca  ................
	defb 004h,005h,000h,018h,010h,0f8h,000h,000h,000h,004h,005h,000h,000h,000h,000h,004h	; bada  ................
	defb 005h,000h,002h,001h,002h,001h,003h,003h,003h,001h,002h,001h,002h,001h,004h,002h	; baea  ................
	defb 004h,001h,002h,001h,002h,001h,010h,008h,010h,004h,008h,002h,00ch,008h,008h,008h	; bafa  ................
	defb 00ch,008h,004h,004h,006h,008h	; bb0a

; ======================================================================
; CODIGO 0xbb10..0xbcfc  (492 bytes)
; ======================================================================


L_BB10:
	push ix		;bb10
	call L_BBC5		;bb12
	jr c,L_BB52		;bb15
	call L_BB55		;bb17
	jr c,L_BB52		;bb1a
	call L_BB71		;bb1c
	jr c,L_BB52		;bb1f
	call L_BB8D		;bb21
	jr c,L_BB52		;bb24
	call L_BC03		;bb26
	jr c,L_BB52		;bb29
	call L_BC1C		;bb2b
	jr c,L_BB52		;bb2e
	call L_BC2C		;bb30
	jr c,L_BB52		;bb33
	call L_BC95		;bb35
	jr c,L_BB52		;bb38
	call L_BCD1		;bb3a
	jr c,L_BB52		;bb3d
	call L_BD08		;bb3f
	jr c,L_BB52		;bb42
	ld a,(0ca76h)		;bb44
	or a			;bb47
	jr nz,L_BB4F		;bb48
	call L_BBE1		;bb4a
	jr c,L_BB52		;bb4d
L_BB4F:
	call L_BBA9		;bb4f
L_BB52:
	pop ix		;bb52
	ret			;bb54
L_BB55:
	ld ix,0cc00h		;bb55
	ld b,008h		;bb59
L_BB5B:
	exx			;bb5b
	call L_BD78		;bb5c
	exx			;bb5f
	jr nc,L_BB66		;bb60
	call L_B5AF		;bb62
	ret c			;bb65
L_BB66:
	exx			;bb66
	ld de,00010h		;bb67
	add ix,de		;bb6a
	exx			;bb6c
	djnz L_BB5B		;bb6d
	or a			;bb6f
	ret			;bb70
L_BB71:
	ld ix,0cc80h		;bb71
	ld b,030h		;bb75
L_BB77:
	exx			;bb77
	call L_BDA1		;bb78
	exx			;bb7b
	jr nc,L_BB82		;bb7c
	call L_B5AF		;bb7e
	ret c			;bb81
L_BB82:
	exx			;bb82
	ld de,00008h		;bb83
	add ix,de		;bb86
	exx			;bb88
	djnz L_BB77		;bb89
	or a			;bb8b
	ret			;bb8c
L_BB8D:
	ld ix,0d760h		;bb8d
	ld b,001h		;bb91
L_BB93:
	exx			;bb93
	call L_BDC8		;bb94
	exx			;bb97
	jr nc,L_BB9E		;bb98
	call L_B5AF		;bb9a
	ret c			;bb9d
L_BB9E:
	exx			;bb9e
	ld de,00010h		;bb9f
	add ix,de		;bba2
	exx			;bba4
	djnz L_BB93		;bba5
	or a			;bba7
	ret			;bba8
L_BBA9:
	ld ix,0df80h		;bba9
	ld b,008h		;bbad
L_BBAF:
	exx			;bbaf
	call L_BDEF		;bbb0
	exx			;bbb3
	jr nc,L_BBBA		;bbb4
	call L_B5AF		;bbb6
	ret c			;bbb9
L_BBBA:
	exx			;bbba
	ld de,00008h		;bbbb
	add ix,de		;bbbe
	exx			;bbc0
	djnz L_BBAF		;bbc1
	or a			;bbc3
	ret			;bbc4
L_BBC5:
	ld ix,0d7c0h		;bbc5
	ld b,004h		;bbc9
L_BBCB:
	exx			;bbcb
	call L_BE16		;bbcc
	exx			;bbcf
	jr nc,L_BBD6		;bbd0
	call L_B5AF		;bbd2
	ret c			;bbd5
L_BBD6:
	exx			;bbd6
	ld de,00004h		;bbd7
	add ix,de		;bbda
	exx			;bbdc
	djnz L_BBCB		;bbdd
	or a			;bbdf
	ret			;bbe0
L_BBE1:
	ld ix,0e070h		;bbe1
	ld b,002h		;bbe5
L_BBE7:
	ld a,(ix+000h)		;bbe7
	or a			;bbea
	jr z,L_BBF8		;bbeb
	exx			;bbed
	call L_BE2D		;bbee
	exx			;bbf1
	jr nc,L_BBF8		;bbf2
	call L_B5AF		;bbf4
	ret c			;bbf7
L_BBF8:
	exx			;bbf8
	ld de,00008h		;bbf9
	add ix,de		;bbfc
	exx			;bbfe
	djnz L_BBE7		;bbff
L_BC01:
	or a			;bc01
	ret			;bc02
L_BC03:
	ld a,(0ca4ah)		;bc03
	cp 00ah		;bc06
	jr nz,L_BC01		;bc08
	ld a,(0ca4bh)		;bc0a
	cp 00eh		;bc0d
	jr nz,L_BC01		;bc0f
	exx			;bc11
	ld de,02018h		;bc12
	ld hl,06080h		;bc15
	exx			;bc18
	jp L_B5AF		;bc19
L_BC1C:
	ld a,(0d8c0h)		;bc1c
	or a			;bc1f
	ret z			;bc20
	exx			;bc21
	ld de,01218h		;bc22
	ld hl,06046h		;bc25
	exx			;bc28
	jp L_B5AF		;bc29
L_BC2C:
	ld a,(0d8c0h)		;bc2c
	or a			;bc2f
	ret nz			;bc30
	call L_BC38		;bc31
	ret nc			;bc34
	jp L_B5AF		;bc35
L_BC38:
	exx			;bc38
	push bc			;bc39
	ld hl,0aa83h		;bc3a
L_BC3D:
	push hl			;bc3d
	ld a,(0ca4ah)		;bc3e
	cp (hl)			;bc41
	jr nz,L_BC87		;bc42
	inc hl			;bc44
	ld a,(hl)			;bc45
	cp 0d0h		;bc46
	jr z,L_BC87		;bc48
	cp 0ffh		;bc4a
	jr nz,L_BC5D		;bc4c
	ld a,(0ca76h)		;bc4e
	cp 018h		;bc51
	jr nz,L_BC87		;bc53
	ld a,(0ca4bh)		;bc55
	dec a			;bc58
	jr nz,L_BC87		;bc59
	jr L_BC70		;bc5b
L_BC5D:
	cp 0feh		;bc5d
	jr nz,L_BC6A		;bc5f
	ld a,(0ca76h)		;bc61
	cp 02eh		;bc64
	jr nz,L_BC87		;bc66
	jr L_BC70		;bc68
L_BC6A:
	ld a,(0ca4bh)		;bc6a
	cp (hl)			;bc6d
	jr nz,L_BC87		;bc6e
L_BC70:
	pop hl			;bc70
	inc hl			;bc71
	inc hl			;bc72
	inc hl			;bc73
	inc hl			;bc74
	inc hl			;bc75
	ld a,(hl)			;bc76
	add a,020h		;bc77
	ld c,a			;bc79
	inc hl			;bc7a
	ld a,(hl)			;bc7b
	add a,010h		;bc7c
	ld h,a			;bc7e
	ld l,c			;bc7f
	ld de,01220h		;bc80
	pop bc			;bc83
	exx			;bc84
	scf			;bc85
	ret			;bc86
L_BC87:
	pop hl			;bc87
	ld de,00008h		;bc88
	add hl,de			;bc8b
	ld a,(hl)			;bc8c
	cp 0ffh		;bc8d
	jr nz,L_BC3D		;bc8f
	pop bc			;bc91
	exx			;bc92
	and a			;bc93
	ret			;bc94
L_BC95:
	ld ix,0d500h		;bc95
	ld b,008h		;bc99
L_BC9B:
	ld a,(ix+000h)		;bc9b
	or a			;bc9e
	jr z,L_BCBA		;bc9f
	exx			;bca1
	ld a,(ix+008h)		;bca2
	rra			;bca5
	and 07fh		;bca6
	ld d,a			;bca8
	add a,(ix+003h)		;bca9
	ld h,a			;bcac
	call L_BCC5		;bcad
	ld e,a			;bcb0
	add a,(ix+002h)		;bcb1
	ld l,a			;bcb4
	exx			;bcb5
	call L_B5AF		;bcb6
	ret c			;bcb9
L_BCBA:
	exx			;bcba
	ld de,00010h		;bcbb
	add ix,de		;bcbe
	exx			;bcc0
	djnz L_BC9B		;bcc1
	and a			;bcc3
	ret			;bcc4
L_BCC5:
	ld a,(ix+008h)		;bcc5
	cp 008h		;bcc8
	ld a,(ix+007h)		;bcca
	ret nz			;bccd
	add a,012h		;bcce
	ret			;bcd0
L_BCD1:
	ld a,(0ca4ah)		;bcd1
	cp 013h		;bcd4
	jr nz,L_BCFA		;bcd6
	ld a,(0ca4bh)		;bcd8
	cp 004h		;bcdb
	jr nz,L_BCFA		;bcdd
	ld b,003h		;bcdf
L_BCE1:
	ld a,b			;bce1
	exx			;bce2
	dec a			;bce3
	add a,a			;bce4
	add a,a			;bce5
	ld hl,0bcfch		;bce6
	call 0423eh		;bce9
	ld e,(hl)			;bcec
	inc hl			;bced
	ld d,(hl)			;bcee
	inc hl			;bcef
	call L_AC33		;bcf0
	exx			;bcf3
	call L_B5AF		;bcf4
	ret c			;bcf7
	djnz L_BCE1		;bcf8
L_BCFA:
	and a			;bcfa
	ret			;bcfb

; ----------------------------------------------------------------------
; DATOS resto_BCFC: lo apuntan con el banco puesto p07:BCE6 (0xBCFC); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p07:BCE6 (12 bytes)
;   0xbcfc..0xbd08  (12 bytes)
DATA_resto_BCFC:
	defb 024h,012h,040h,0a2h,024h,010h,060h,050h,01ch,010h,0b8h,04ch	; bcfc  $.@.$.`P...L

; ======================================================================
; CODIGO 0xbd08..0xbd5e  (86 bytes)
; ======================================================================


L_BD08:
	ld a,(0ca4ah)		;bd08
	cp 004h		;bd0b
	jr nz,$-19		;bd0d
	call L_BD2F		;bd0f
	jr nz,$-24		;bd12
L_BD14:
	ld a,b			;bd14
	exx			;bd15
	dec a			;bd16
	add a,a			;bd17
	call 0423eh		;bd18
	call L_AC33		;bd1b
	ld de,00c38h		;bd1e
	exx			;bd21
	call L_B5AF		;bd22
	ret c			;bd25
	push bc			;bd26
	call L_BD2F		;bd27
	pop bc			;bd2a
	djnz L_BD14		;bd2b
	and a			;bd2d
	ret			;bd2e
L_BD2F:
	ld b,002h		;bd2f
	exx			;bd31
	ld hl,0bd62h		;bd32
	exx			;bd35
	ld a,(0ca4bh)		;bd36
	cp 017h		;bd39
	ret z			;bd3b
	exx			;bd3c
	ld hl,0bd6ch		;bd3d
	exx			;bd40
	cp 013h		;bd41
	ret z			;bd43
	ld b,004h		;bd44
	exx			;bd46
	ld hl,0bd66h		;bd47
	exx			;bd4a
	cp 012h		;bd4b
	ret z			;bd4d
	exx			;bd4e
	ld hl,0bd5eh		;bd4f
	exx			;bd52
	cp 00dh		;bd53
	ret z			;bd55
	exx			;bd56
	ld hl,0bd70h		;bd57
	exx			;bd5a
	cp 00eh		;bd5b
	ret			;bd5d

; ----------------------------------------------------------------------
; DATOS resto_BD5E: lo apuntan con el banco puesto p07:BD4F (0xBD5E), p07:BD32
;   (0xBD62), p07:BD47 (0xBD66), p07:BD3D (0xBD6C), p07:BD57 (0xBD70); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p07:BD4F, p07:BD32, p07:BD47, p07:BD3D, p07:BD57 (26 bytes)
;   0xbd5e..0xbd78  (26 bytes)
DATA_resto_BD5E:
	defb 038h,04ch,038h,074h,098h,04ch,098h,074h,058h,04ch,058h,074h,0c8h,074h,0c8h,04ch	; bd5e  8L8t.L.tXLXt.t.L
	defb 0c8h,08ch,038h,04ch,038h,08ch,098h,04ch,098h,08ch	; bd6e  ..8L8..L..

; ======================================================================
; CODIGO 0xbd78..0xbf2c  (436 bytes)
; ======================================================================


L_BD78:
	ld a,(ix+000h)		;bd78
	or a			;bd7b
	jr z,L_BD9F		;bd7c
	ld a,(0ca50h)		;bd7e
	cp (ix+004h)		;bd81
	jr nz,L_BD9F		;bd84
	ld a,(0ca51h)		;bd86
	cp (ix+005h)		;bd89
	jr nz,L_BD9F		;bd8c
	ld a,(ix+002h)		;bd8e
	add a,00ch		;bd91
	ld l,a			;bd93
	ld a,(ix+003h)		;bd94
	add a,004h		;bd97
	ld h,a			;bd99
	ld de,00810h		;bd9a
	scf			;bd9d
	ret			;bd9e
L_BD9F:
	or a			;bd9f
	ret			;bda0
L_BDA1:
	ld a,(ix+000h)		;bda1
	or a			;bda4
	jr z,L_BD9F		;bda5
	ld a,(0ca50h)		;bda7
	cp (ix+004h)		;bdaa
	jr nz,L_BD9F		;bdad
	ld a,(0ca51h)		;bdaf
	cp (ix+005h)		;bdb2
	jr nz,L_BD9F		;bdb5
	ld a,(ix+002h)		;bdb7
	add a,00ch		;bdba
	ld l,a			;bdbc
	ld a,(ix+003h)		;bdbd
	add a,004h		;bdc0
	ld h,a			;bdc2
	ld de,00810h		;bdc3
	scf			;bdc6
	ret			;bdc7
L_BDC8:
	ld a,(ix+000h)		;bdc8
	or a			;bdcb
	jr z,L_BD9F		;bdcc
	ld a,(0ca50h)		;bdce
	cp (ix+004h)		;bdd1
	jr nz,L_BD9F		;bdd4
	ld a,(0ca51h)		;bdd6
	cp (ix+005h)		;bdd9
	jr nz,L_BD9F		;bddc
	ld a,(ix+002h)		;bdde
	add a,022h		;bde1
	ld l,a			;bde3
	ld a,(ix+003h)		;bde4
	add a,009h		;bde7
	ld h,a			;bde9
	ld de,00a23h		;bdea
	scf			;bded
	ret			;bdee
L_BDEF:
	ld a,(ix+000h)		;bdef
	or a			;bdf2
	jr z,L_BD9F		;bdf3
	ld a,(0ca50h)		;bdf5
	cp (ix+004h)		;bdf8
	jr nz,L_BD9F		;bdfb
	ld a,(0ca51h)		;bdfd
	cp (ix+005h)		;be00
	jr nz,L_BD9F		;be03
	ld a,(ix+002h)		;be05
	add a,010h		;be08
	ld l,a			;be0a
	ld a,(ix+003h)		;be0b
	add a,008h		;be0e
	ld h,a			;be10
	ld de,00a12h		;be11
	scf			;be14
	ret			;be15
L_BE16:
	ld a,(ix+000h)		;be16
	or a			;be19
	jr z,L_BD9F		;be1a
	ld a,(ix+001h)		;be1c
	add a,010h		;be1f
	ld l,a			;be21
	ld a,(ix+002h)		;be22
	add a,008h		;be25
	ld h,a			;be27
	ld de,00a12h		;be28
	scf			;be2b
	ret			;be2c
L_BE2D:
	ld a,(ix+002h)		;be2d
	add a,020h		;be30
	ld l,a			;be32
	ld a,(ix+003h)		;be33
	add a,010h		;be36
	ld h,a			;be38
	ld de,01020h		;be39
	scf			;be3c
	ret			;be3d
L_BE3E:
	and a			;be3e
	ret			;be3f
L_BE40:
	ld a,(0d800h)		;be40
	cp 002h		;be43
	ret nz			;be45
	ld a,(0ca4bh)		;be46
	cp 008h		;be49
	ret nz			;be4b
	ld a,(0d816h)		;be4c
	and a			;be4f
	ret z			;be50
	ld a,(0d801h)		;be51
	cp 00ah		;be54
	ret nc			;be56
	call L_BE8E		;be57
	call L_BED8		;be5a
	ld ix,0cb80h		;be5d
	ld b,006h		;be61
L_BE63:
	push bc			;be63
	ld a,(ix+000h)		;be64
	and a			;be67
	jr z,L_BE79		;be68
	ld b,(ix+005h)		;be6a
	ld c,(ix+003h)		;be6d
	call L_BE82		;be70
	jr nc,L_BE79		;be73
	ld (ix+000h),000h		;be75
L_BE79:
	ld bc,00010h		;be79
	add ix,bc		;be7c
	pop bc			;be7e
	djnz L_BE63		;be7f
	ret			;be81
L_BE82:
	ld a,(ix+000h)		;be82
	cp 006h		;be85
	jr z,L_BE9F		;be87
	cp 003h		;be89
	jr c,L_BE9F		;be8b
	ret			;be8d
L_BE8E:
	ld a,(0cb05h)		;be8e
	sub 004h		;be91
	ld b,a			;be93
	ld a,(0cb03h)		;be94
	ld c,a			;be97
	call L_BE9F		;be98
	ret nc			;be9b
	jp 08dbdh		;be9c
L_BE9F:
	ld a,(0d803h)		;be9f
	sub c			;bea2
	cp 080h		;bea3
	ret nc			;bea5
	srl a		;bea6
	srl a		;bea8
	srl a		;beaa
	sub 00fh		;beac
	neg		;beae
	cp 00ch		;beb0
	jr nc,L_BEBE		;beb2
	ld hl,0bf2ch		;beb4
	call 043f6h		;beb7
L_BEBA:
	ld a,b			;beba
	sub l			;bebb
	cp h			;bebc
	ret			;bebd
L_BEBE:
	sub 00ch		;bebe
	add a,a			;bec0
	add a,a			;bec1
	ld hl,0bf4ch		;bec2
L_BEC5:
	call 0423eh		;bec5
	ld e,(hl)			;bec8
	inc hl			;bec9
	ld d,(hl)			;beca
	inc hl			;becb
	ld a,(hl)			;becc
	inc hl			;becd
	ld h,(hl)			;bece
	ld l,a			;becf
	push de			;bed0
	call L_BEBA		;bed1
	pop hl			;bed4
	ret c			;bed5
	jr L_BEBA		;bed6
L_BED8:
	ld a,(0d816h)		;bed8
	and a			;bedb
	ret z			;bedc
	ld a,(0df80h)		;bedd
	and a			;bee0
	ret z			;bee1
	ld a,(0df87h)		;bee2
	and a			;bee5
	ret nz			;bee6
	ld hl,(0df82h)		;bee7
	ld bc,00808h		;beea
	add hl,bc			;beed
	ld b,h			;beee
	ld c,l			;beef
	ld a,(0d803h)		;bef0
	sub c			;bef3
	cp 080h		;bef4
	ret nc			;bef6
	srl a		;bef7
	srl a		;bef9
	srl a		;befb
	sub 00fh		;befd
	neg		;beff
	cp 00ah		;bf01
	ret c			;bf03
	push bc			;bf04
	sub 00ah		;bf05
	add a,a			;bf07
	add a,a			;bf08
	ld hl,0bf44h		;bf09
	call L_BEC5		;bf0c
	pop bc			;bf0f
	ret nc			;bf10
	call 06c17h		;bf11
	ld hl,0d810h		;bf14
	dec (hl)			;bf17
	jr nz,L_BF22		;bf18
	ld a,00ah		;bf1a
	ld (0d801h),a		;bf1c
	jp L_B4D5		;bf1f
L_BF22:
	xor a			;bf22
	ld (0d816h),a		;bf23
	ld a,010h		;bf26
	ld (0d817h),a		;bf28
	ret			;bf2b

; ----------------------------------------------------------------------
; DATOS resto_BF2C: lo apuntan con el banco puesto p07:BEB4 (0xBF2C), p07:BF09
;   (0xBF44), p07:BEC2 (0xBF4C); el tamano es lo que hay hasta lo siguiente,
;   no sale de recorrerlo; lo leen p07:BEB4, p07:BF09, p07:BEC2 (48 bytes)
;   0xbf2c..0xbf5c  (48 bytes)
DATA_resto_BF2C:
	defb 030h,055h,030h,055h,030h,050h,030h,048h,030h,055h,030h,060h,030h,055h,040h,045h	; bf2c  0U0U0P0H0U0`0U@E
	defb 040h,040h,040h,040h,040h,040h,040h,040h,040h,020h,070h,018h,040h,020h,070h,018h	; bf3c  @@@@@@@@@ p.@ p.
	defb 040h,020h,070h,018h,038h,020h,070h,018h,038h,018h,070h,020h,040h,008h,078h,018h	; bf4c  @ p.8 p.8.p @.x.

; ======================================================================
; CODIGO 0xbf5c..0xbfc3  (103 bytes)
; ======================================================================


L_BF5C:
	push ix		;bf5c
	call L_BF64		;bf5e
	pop ix		;bf61
	ret			;bf63
L_BF64:
	push de			;bf64
	push hl			;bf65
	call L_BF94		;bf66
	pop hl			;bf69
	pop de			;bf6a
	ret c			;bf6b
	push de			;bf6c
	push hl			;bf6d
	call L_BFAA		;bf6e
	pop hl			;bf71
	pop de			;bf72
	ret c			;bf73
	call 041ddh		;bf74
	call L_BF7D		;bf77
	jp 041adh		;bf7a
L_BF7D:
	ld hl,0cb74h		;bf7d
	ld (hl),000h		;bf80
L_BF82:
	call 07f25h		;bf82
	ld a,(0cb74h)		;bf85
	cp 0ffh		;bf88
	jr nz,L_BF8E		;bf8a
L_BF8C:
	or a			;bf8c
	ret			;bf8d
L_BF8E:
	call L_B5AF		;bf8e
	jr nc,L_BF82		;bf91
	ret			;bf93
L_BF94:
	ld a,(0e230h)		;bf94
	or a			;bf97
	ret z			;bf98
	exx			;bf99
	ld a,(0e233h)		;bf9a
	add a,032h		;bf9d
	ld l,a			;bf9f
	ld e,034h		;bfa0
	ld a,(0e234h)		;bfa2
	ld h,a			;bfa5
	ld d,032h		;bfa6
	jr L_BFBF		;bfa8
L_BFAA:
	ld a,(0ca4ah)		;bfaa
	cp 00ch		;bfad
	jr nz,L_BF8C		;bfaf
	ld a,(0ca4bh)		;bfb1
	cp 006h		;bfb4
	jr nz,L_BF8C		;bfb6
	exx			;bfb8
	ld de,030b0h		;bfb9
	ld hl,040b8h		;bfbc
L_BFBF:
	exx			;bfbf
	jp L_B5AF		;bfc0

; ----------------------------------------------------------------------
; DATOS sin identificar  0xbfc3..0xc000  (61 bytes)
DATA_BFC3:
	defb 0b5h,000h,080h,000h,042h,000h,000h,000h,0beh,0ffh,080h,0ffh,04bh,0ffh,023h,0ffh	; bfc3  ....B.......K.#.
	defb 009h,0ffh,000h,0ffh,009h,0ffh,023h,0ffh,04bh,0ffh,080h,0ffh,0beh,0ffh,000h,000h	; bfd3  ......#.K.......
	defb 042h,000h,080h,000h,0b5h,000h,0ddh,000h,0f7h,000h,000h,001h,0f7h,000h,0ddh,000h	; bfe3  B...............
	defb 0b5h,000h,080h,000h,042h,000h,0c0h,021h,0a4h,0d8h,0c3h,0e5h,0b3h	; bff3  ....B..!.....
