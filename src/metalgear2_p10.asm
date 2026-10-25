; ==========================================================================
; METAL GEAR 2 SOLID SNAKE - Konami (1990) - MSX2 - MegaROM RC-767 de 512 KB (Konami SCC) - banco 10 (se ejecuta en 0xa000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x0a000


; ======================================================================
; CODIGO 0xa000..0xa054  (84 bytes)
; ======================================================================


L_A000:
	xor a			;a000
	ld (0e1d5h),a		;a001
	ld a,(0ca65h)		;a004
	or a			;a007
	jr nz,L_A048		;a008
	ld a,(0d8c0h)		;a00a
	or a			;a00d
	jr nz,L_A04E		;a00e
	ld hl,0cab2h		;a010
	ld (hl),0f0h		;a013
	ld hl,0a054h		;a015
L_A018:
	push hl			;a018
	ld a,(hl)			;a019
	cp 0ffh		;a01a
	jr z,L_A042		;a01c
	ld a,(0ca4ah)		;a01e
	cp (hl)			;a021
	jr nz,L_A03A		;a022
	inc hl			;a024
	ld a,(hl)			;a025
	cp 039h		;a026
	ld a,(0ca76h)		;a028
	jr z,L_A030		;a02b
	ld a,(0ca4bh)		;a02d
L_A030:
	cp (hl)			;a030
	jr nz,L_A03A		;a031
	inc hl			;a033
	ld a,(hl)			;a034
	ld (0cab0h),a		;a035
	pop hl			;a038
	ret			;a039
L_A03A:
	pop hl			;a03a
	ld a,003h		;a03b
	call 0423eh		;a03d
	jr L_A018		;a040
L_A042:
	pop hl			;a042
	ld a,002h		;a043
	ld (0cab0h),a		;a045
L_A048:
	ld hl,0ca61h		;a048
	ld (hl),001h		;a04b
	ret			;a04d
L_A04E:
	ld hl,0ca61h		;a04e
	ld (hl),002h		;a051
	ret			;a053

; ----------------------------------------------------------------------
; DATOS resto_A054: lo apuntan con el banco puesto p10:A015 (0xA054); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p10:A015 (19 bytes)
;   0xa054..0xa067  (19 bytes)
DATA_resto_A054:
	defb 00eh,004h,001h,00eh,005h,001h,013h,039h,001h,012h,008h,001h,001h,008h,001h,00dh	; a054  .......9........
	defb 005h,000h,0ffh	; a064

; ======================================================================
; CODIGO 0xa067..0xa07c  (21 bytes)
; ======================================================================


L_A067:
	ld a,(0ca65h)		;a067
	or a			;a06a
	ret nz			;a06b
	ld a,(0d8c0h)		;a06c
	or a			;a06f
	ret nz			;a070
	ld a,(0dff8h)		;a071
	or a			;a074
	ret nz			;a075
	ld a,(0cab0h)		;a076
	call 0424dh		;a079

; ----------------------------------------------------------------------
; DATOS tabla_A07C: 3 destinos del despachador p00:424D (call en p10:A079, el
;   indice en A): A088, A082, A0BB; lo leen p10:A079 (6 bytes)
;   0xa07c..0xa082  (6 bytes)
DATA_tabla_A07C:
	defw 0a088h,0a082h,0a0bbh	; a07c  -> L_A088 L_A082 L_A0BB

; ======================================================================
; CODIGO 0xa082..0xa08e  (12 bytes)
; ======================================================================


L_A082:
	ld hl,0ca61h		;a082
	ld (hl),002h		;a085
	ret			;a087
L_A088:
	ld a,(0cab1h)		;a088
	call 0424dh		;a08b

; ----------------------------------------------------------------------
; DATOS tabla_A08E: 3 destinos del despachador p00:424D (call en p10:A08B, el
;   indice en A): A094, A0A1, A0B0; lo leen p10:A08B (6 bytes)
;   0xa08e..0xa094  (6 bytes)
DATA_tabla_A08E:
	defw 0a094h,0a0a1h,0a0b0h	; a08e  -> L_A094 L_A0A1 L_A0B0

; ======================================================================
; CODIGO 0xa094..0xa2b3  (543 bytes)
; ======================================================================


L_A094:
	ld hl,0ca61h		;a094
	ld (hl),002h		;a097
	ld hl,0cab1h		;a099
	inc (hl)			;a09c
	inc hl			;a09d
	ld (hl),0ffh		;a09e
	ret			;a0a0
L_A0A1:
	ld hl,0cab2h		;a0a1
	dec (hl)			;a0a4
	ret nz			;a0a5
	ld hl,0cab1h		;a0a6
	inc (hl)			;a0a9
	ld hl,0ca61h		;a0aa
	ld (hl),001h		;a0ad
	ret			;a0af
L_A0B0:
	ld a,(0cb21h)		;a0b0
	dec a			;a0b3
	ret nz			;a0b4
	ld hl,0e1d5h		;a0b5
	ld (hl),001h		;a0b8
	ret			;a0ba
L_A0BB:
	ld hl,0cab2h		;a0bb
	dec (hl)			;a0be
	ret nz			;a0bf
	ld (hl),0f0h		;a0c0
	ld a,(0ca03h)		;a0c2
	rra			;a0c5
	rra			;a0c6
	ld b,a			;a0c7
	ld a,r		;a0c8
	xor b			;a0ca
	rlca			;a0cb
	and 003h		;a0cc
	inc a			;a0ce
	ld (0ca61h),a		;a0cf
	ret			;a0d2
L_A0D3:
	call L_A10F		;a0d3
	ld a,(0cab6h)		;a0d6
	or a			;a0d9
	ret nz			;a0da
L_A0DB:
	ld hl,0ca8eh		;a0db
	ld (hl),000h		;a0de
	ld a,(0ca4ah)		;a0e0
	cp 004h		;a0e3
	ret nz			;a0e5
	ld b,002h		;a0e6
	ld a,(0ca4bh)		;a0e8
	cp 009h		;a0eb
	jr z,L_A108		;a0ed
	ld a,(0ca76h)		;a0ef
	cp 011h		;a0f2
	ret nz			;a0f4
	dec b			;a0f5
	ld a,001h		;a0f6
	ld (0cab6h),a		;a0f8
	push bc			;a0fb
	call L_A168		;a0fc
	push hl			;a0ff
	ld hl,090a0h		;a100
	call L_A19E		;a103
	pop hl			;a106
	pop bc			;a107
L_A108:
	ld (hl),b			;a108
	ld a,040h		;a109
	ld (0ca8ch),a		;a10b
	ret			;a10e
L_A10F:
	ld hl,0ca9bh		;a10f
	ld (hl),000h		;a112
	ld a,(0ca4ah)		;a114
	cp 00ah		;a117
	ret nz			;a119
	ld a,(0ca4bh)		;a11a
	cp 010h		;a11d
	jr z,L_A140		;a11f
	cp 011h		;a121
	jr z,L_A140		;a123
	cp 00bh		;a125
	jr z,L_A140		;a127
	cp 00ch		;a129
	jr z,L_A140		;a12b
	ld a,(0ca50h)		;a12d
	cp 003h		;a130
	jr z,L_A137		;a132
	cp 006h		;a134
	ret nz			;a136
L_A137:
	ld hl,0cb28h		;a137
	ld (hl),000h		;a13a
	inc l			;a13c
	ld (hl),020h		;a13d
	ret			;a13f
L_A140:
	ld (hl),001h		;a140
	ret			;a142
L_A143:
	ld a,(0d7d5h)		;a143
	and 004h		;a146
	ret nz			;a148
	ld a,(0d7d5h)		;a149
	bit 4,a		;a14c
	ret z			;a14e
	ld a,(0cb3fh)		;a14f
	or a			;a152
	ret z			;a153
	ld hl,0cb39h		;a154
	ld a,(hl)			;a157
	or a			;a158
	ret nz			;a159
	ld (hl),001h		;a15a
	ld hl,0d7d5h		;a15c
	set 3,(hl)		;a15f
	ld hl,01000h		;a161
	ld (0cb3ah),hl		;a164
	ret			;a167
L_A168:
	ld de,01000h		;a168
	ld (0cab7h),de		;a16b
	ret			;a16f
L_A170:
	ld a,(0ca76h)		;a170
	cp 011h		;a173
	jr z,L_A168		;a175
	ld a,(0cab6h)		;a177
	or a			;a17a
	ret z			;a17b
	ld a,(0ca4ah)		;a17c
	cp 004h		;a17f
	jr nz,L_A18A		;a181
	ld a,(0ca4bh)		;a183
	cp 009h		;a186
	jr z,L_A194		;a188
L_A18A:
	ld hl,(0cab7h)		;a18a
	dec hl			;a18d
	ld (0cab7h),hl		;a18e
	ld a,h			;a191
	or l			;a192
	ret nz			;a193
L_A194:
	xor a			;a194
	ld (0cab6h),a		;a195
	call L_A0DB		;a198
	ld hl,080a0h		;a19b
L_A19E:
	ld a,(0cb21h)		;a19e
	cp 020h		;a1a1
	ret c			;a1a3
	cp 023h		;a1a4
	ret nc			;a1a6
	push hl			;a1a7
	ld hl,0d8a4h		;a1a8
	call L_B3E5		;a1ab
	pop hl			;a1ae
	ld de,0d8a4h		;a1af
	ld a,(0ca42h)		;a1b2
	rlca			;a1b5
	rlca			;a1b6
	rlca			;a1b7
	rlca			;a1b8
	or 0c8h		;a1b9
	ld bc,01010h		;a1bb
	jp 047edh		;a1be
L_A1C1:
	ld hl,0ca7bh		;a1c1
	ld (hl),001h		;a1c4
	inc hl			;a1c6
	ld (hl),000h		;a1c7
	inc hl			;a1c9
	ld (hl),002h		;a1ca
	ld hl,0d7d7h		;a1cc
	set 7,(hl)		;a1cf
	ret			;a1d1
L_A1D2:
	ld a,(0ca7bh)		;a1d2
	or a			;a1d5
	ret z			;a1d6
	cp 003h		;a1d7
	ret z			;a1d9
	dec a			;a1da
	jr z,L_A1F0		;a1db
	ld hl,(0ca7ch)		;a1dd
	dec hl			;a1e0
	ld (0ca7ch),hl		;a1e1
	ld a,h			;a1e4
	or l			;a1e5
	ret nz			;a1e6
	ld hl,0ca7bh		;a1e7
	inc (hl)			;a1ea
	call L_A204		;a1eb
	jr L_A234		;a1ee
L_A1F0:
	ld hl,(0ca7ch)		;a1f0
	dec hl			;a1f3
	ld (0ca7ch),hl		;a1f4
	ld a,h			;a1f7
	or l			;a1f8
	ret nz			;a1f9
	ld hl,0ca7bh		;a1fa
	inc (hl)			;a1fd
	inc hl			;a1fe
	ld (hl),000h		;a1ff
	inc hl			;a201
	ld (hl),002h		;a202
L_A204:
	ld a,(0cb21h)		;a204
	cp 00eh		;a207
	ret nz			;a209
	call L_A286		;a20a
	ld hl,0b090h		;a20d
	ld a,(0ca7bh)		;a210
	or a			;a213
	jr z,L_A220		;a214
	dec a			;a216
	jr z,L_A220		;a217
	ld h,0c0h		;a219
	dec a			;a21b
	jr z,L_A220		;a21c
	ld h,0d0h		;a21e
L_A220:
	ld de,0d8a4h		;a220
	ld a,(0ca42h)		;a223
	rlca			;a226
	rlca			;a227
	rlca			;a228
	rlca			;a229
	and 0f0h		;a22a
	or 0c8h		;a22c
	ld bc,01010h		;a22e
	jp 047edh		;a231
L_A234:
	ld hl,0e1d8h		;a234
	ld (hl),001h		;a237
	inc hl			;a239
	ld (hl),080h		;a23a
	inc hl			;a23c
	ld (hl),018h		;a23d
	inc hl			;a23f
	ld (hl),018h		;a240
	ld hl,0d7d7h		;a242
	set 5,(hl)		;a245
	ld hl,0d7e2h		;a247
	res 0,(hl)		;a24a
	ret			;a24c
L_A24D:
	ld a,(0e1d8h)		;a24d
	or a			;a250
	ret z			;a251
	ld hl,0e1d9h		;a252
	dec (hl)			;a255
	jr z,L_A28C		;a256
	ld a,(hl)			;a258
	ld hl,0d6bch		;a259
	ld b,022h		;a25c
	dec a			;a25e
	jr z,L_A26E		;a25f
	ld hl,0d6b8h		;a261
	dec b			;a264
	dec a			;a265
	jr z,L_A26E		;a266
	ld hl,0d6b4h		;a268
	dec b			;a26b
	dec a			;a26c
	ret nz			;a26d
L_A26E:
	ld a,(hl)			;a26e
	or a			;a26f
	ret z			;a270
	push hl			;a271
	push bc			;a272
	ld a,b			;a273
	call 092d2h		;a274
	pop af			;a277
	push af			;a278
	call 092dbh		;a279
	pop bc			;a27c
	pop hl			;a27d
	ret nc			;a27e
	ld (hl),000h		;a27f
	ld a,(0cb21h)		;a281
	cp b			;a284
	ret nz			;a285
L_A286:
	ld hl,0d8a4h		;a286
	jp L_B3E5		;a289
L_A28C:
	ld (hl),080h		;a28c
	ret			;a28e
L_A28F:
	ld a,(0e1d8h)		;a28f
	or a			;a292
	ret z			;a293
	call L_A29D		;a294
	call L_A376		;a297
	jp L_A31B		;a29a
L_A29D:
	ld a,(0e1dch)		;a29d
	or a			;a2a0
	jr z,L_A2AC		;a2a1
	ld hl,0e1d9h		;a2a3
	dec (hl)			;a2a6
	ret nz			;a2a7
	xor a			;a2a8
	ld (0e1dch),a		;a2a9
L_A2AC:
	ld a,(0e1d8h)		;a2ac
	dec a			;a2af
	call 0424dh		;a2b0

; ----------------------------------------------------------------------
; DATOS tabla_A2B3: 17 destinos del despachador p00:424D (call en p10:A2B0, el
;   indice en A): A2DB, A2E8, A2E0, A2ED, A2DB, A2F2, A2E0, A2F7, A2DB, A2FC,
;   A2E0, A301, A2DB, A306, A2E0, A30B, A2D5; lo leen p10:A2B0 (34 bytes)
;   0xa2b3..0xa2d5  (34 bytes)
DATA_tabla_A2B3:
	defw 0a2dbh,0a2e8h,0a2e0h,0a2edh,0a2dbh,0a2f2h,0a2e0h,0a2f7h	; a2b3
	defw 0a2dbh,0a2fch,0a2e0h,0a301h,0a2dbh,0a306h,0a2e0h,0a30bh	; a2c3
	defw 0a2d5h	; a2d3  -> L_A2D5

; ======================================================================
; CODIGO 0xa2d5..0xa61b  (838 bytes)
; ======================================================================


L_A2D5:
	ld hl,0e1d8h		;a2d5
	ld (hl),001h		;a2d8
	ret			;a2da
L_A2DB:
	ld bc,00178h		;a2db
	jr L_A2E3		;a2de
L_A2E0:
	ld bc,0ff18h		;a2e0
L_A2E3:
	ld hl,0e1dah		;a2e3
	jr L_A311		;a2e6
L_A2E8:
	ld bc,00138h		;a2e8
	jr L_A30E		;a2eb
L_A2ED:
	ld bc,00158h		;a2ed
	jr L_A30E		;a2f0
L_A2F2:
	ld bc,00178h		;a2f2
	jr L_A30E		;a2f5
L_A2F7:
	ld bc,00198h		;a2f7
	jr L_A30E		;a2fa
L_A2FC:
	ld bc,0ff78h		;a2fc
	jr L_A30E		;a2ff
L_A301:
	ld bc,0ff58h		;a301
	jr L_A30E		;a304
L_A306:
	ld bc,0ff38h		;a306
	jr L_A30E		;a309
L_A30B:
	ld bc,0ff18h		;a30b
L_A30E:
	ld hl,0e1dbh		;a30e
L_A311:
	ld a,(hl)			;a311
	add a,b			;a312
	ld (hl),a			;a313
	cp c			;a314
	ret nz			;a315
	ld hl,0e1d8h		;a316
	inc (hl)			;a319
	ret			;a31a
L_A31B:
	ld a,(0e1d8h)		;a31b
	or a			;a31e
	ret z			;a31f
	call L_A325		;a320
	jr L_A361		;a323
L_A325:
	ld a,(0ca03h)		;a325
	ld c,000h		;a328
	rra			;a32a
	rra			;a32b
	rra			;a32c
	jr c,L_A331		;a32d
	ld c,008h		;a32f
L_A331:
	ld a,(0e1d8h)		;a331
	cp 009h		;a334
	jr c,L_A33C		;a336
	ld a,c			;a338
	add a,010h		;a339
	ld c,a			;a33b
L_A33C:
	ld a,(0e1dbh)		;a33c
	ld d,a			;a33f
	ld a,(0e1dah)		;a340
	ld e,a			;a343
	ld a,(0e1dch)		;a344
	or a			;a347
	jr z,L_A358		;a348
	ld a,(0e1d9h)		;a34a
	rra			;a34d
	rra			;a34e
	rra			;a34f
	ld a,002h		;a350
	jr c,L_A356		;a352
	ld a,0feh		;a354
L_A356:
	add a,d			;a356
	ld d,a			;a357
L_A358:
	ld hl,0dc00h		;a358
	call 05d41h		;a35b
	jp 05d3dh		;a35e
L_A361:
	ld hl,0da00h		;a361
	ld bc,0000fh		;a364
	ld a,00dh		;a367
	call 04237h		;a369
	inc hl			;a36c
	inc de			;a36d
	ld bc,0000fh		;a36e
	ld a,04eh		;a371
	jp 04237h		;a373
L_A376:
	ld a,(0e1dch)		;a376
	or a			;a379
	ret nz			;a37a
	call L_A401		;a37b
	call L_A45D		;a37e
	call L_A467		;a381
	ld a,(0d704h)		;a384
	cp 00eh		;a387
	ret nz			;a389
	ld a,(0ca07h)		;a38a
	and 030h		;a38d
	ret z			;a38f
	ld hl,0ca84h		;a390
	call L_A3D4		;a393
	ret nc			;a396
	xor a			;a397
	ld (0ca7bh),a		;a398
	ld (0e1d8h),a		;a39b
	ld hl,0d66ch		;a39e
	ld (hl),a			;a3a1
	inc hl			;a3a2
	ld (hl),a			;a3a3
	inc hl			;a3a4
	ld (hl),a			;a3a5
	ld hl,0d7d7h		;a3a6
	set 4,(hl)		;a3a9
	ld hl,0d7dfh		;a3ab
	res 7,(hl)		;a3ae
	ld hl,(0ca84h)		;a3b0
	ld bc,01010h		;a3b3
	ld a,(0ca42h)		;a3b6
	ld d,a			;a3b9
	xor a			;a3ba
	call 046ffh		;a3bb
	ld a,00eh		;a3be
	call L_AFF3		;a3c0
	call L_A471		;a3c3
	ld hl,0dc00h		;a3c6
	ld a,0e0h		;a3c9
	ld bc,0000fh		;a3cb
	call 04237h		;a3ce
	jp L_A286		;a3d1
L_A3D4:
	inc hl			;a3d4
	ld a,(0e1dbh)		;a3d5
	cp (hl)			;a3d8
	jr nz,L_A3EF		;a3d9
	dec hl			;a3db
	ld a,(hl)			;a3dc
	sub 008h		;a3dd
	ld b,a			;a3df
	ld a,(0e1dah)		;a3e0
	cp b			;a3e3
	jr c,L_A3EF		;a3e4
	ld a,b			;a3e6
	add a,020h		;a3e7
	ld b,a			;a3e9
	ld a,(0e1dah)		;a3ea
	cp b			;a3ed
	ret c			;a3ee
L_A3EF:
	and a			;a3ef
	ret			;a3f0
L_A3F1:
	inc hl			;a3f1
	ld a,(0e1dbh)		;a3f2
	cp (hl)			;a3f5
	jr nz,L_A3EF		;a3f6
	dec hl			;a3f8
	ld a,(0e1dah)		;a3f9
	cp (hl)			;a3fc
	jr nz,L_A3EF		;a3fd
	scf			;a3ff
	ret			;a400
L_A401:
	ld hl,0ca7eh		;a401
	ld de,0d6b4h		;a404
	ld b,020h		;a407
L_A409:
	ld a,(de)			;a409
	or a			;a40a
	ret z			;a40b
	ld a,b			;a40c
	ld (0d8e5h),a		;a40d
	ld (0d8e1h),hl		;a410
	push de			;a413
	call L_A3F1		;a414
	pop hl			;a417
	ret nc			;a418
	ld a,001h		;a419
	ld (0e1dch),a		;a41b
	ld a,030h		;a41e
	ld (0e1d9h),a		;a420
	push hl			;a423
	ld a,(0d8e5h)		;a424
	call 092d2h		;a427
	pop hl			;a42a
	push hl			;a42b
	ld a,(0d8e5h)		;a42c
	call 092dbh		;a42f
	pop hl			;a432
	ret nc			;a433
	xor a			;a434
	ld (hl),a			;a435
	ld hl,(0d8e1h)		;a436
	ld a,(hl)			;a439
	inc hl			;a43a
	ld h,(hl)			;a43b
	ld l,a			;a43c
	ld bc,01010h		;a43d
	ld a,(0ca42h)		;a440
	ld d,a			;a443
	xor a			;a444
	call 046ffh		;a445
	ld a,(0d8e5h)		;a448
	call L_AFF3		;a44b
	call L_A471		;a44e
	ld a,(0d8e5h)		;a451
	ld b,a			;a454
	ld a,(0d704h)		;a455
	cp b			;a458
	ret nz			;a459
	jp L_A286		;a45a
L_A45D:
	ld hl,0ca80h		;a45d
	ld de,0d6b8h		;a460
	ld b,021h		;a463
	jr L_A409		;a465
L_A467:
	ld hl,0ca82h		;a467
	ld de,0d6bch		;a46a
	ld b,022h		;a46d
	jr L_A409		;a46f
L_A471:
	call L_B172		;a471
	jp L_B8C4		;a474
L_A477:
	ld hl,0e070h		;a477
	ld bc,0000fh		;a47a
	call 04236h		;a47d
	ld hl,0a61bh		;a480
	ld de,0e070h		;a483
	ld a,(0ca4ah)		;a486
	cp 010h		;a489
	jr nz,L_A493		;a48b
	ld a,(0ca43h)		;a48d
	cp 006h		;a490
	ret nz			;a492
L_A493:
	ld a,(hl)			;a493
	inc a			;a494
	ret z			;a495
	ld a,(0ca4ah)		;a496
	cp (hl)			;a499
	inc hl			;a49a
	jr nz,L_A4A6		;a49b
	ld a,(0ca4bh)		;a49d
	cp (hl)			;a4a0
	inc hl			;a4a1
	jr z,L_A4AA		;a4a2
	jr L_A4A7		;a4a4
L_A4A6:
	inc hl			;a4a6
L_A4A7:
	inc hl			;a4a7
	jr L_A493		;a4a8
L_A4AA:
	ld a,001h		;a4aa
	ld (de),a			;a4ac
	inc de			;a4ad
	xor a			;a4ae
	ld (de),a			;a4af
	inc de			;a4b0
	ld a,(hl)			;a4b1
	and 0f0h		;a4b2
	inc a			;a4b4
	ld (de),a			;a4b5
	inc de			;a4b6
	ld a,(hl)			;a4b7
	rlca			;a4b8
	rlca			;a4b9
	rlca			;a4ba
	rlca			;a4bb
	and 0f0h		;a4bc
	ld (de),a			;a4be
	inc de			;a4bf
	ld a,010h		;a4c0
	ld (de),a			;a4c2
	ld de,0e078h		;a4c3
	inc hl			;a4c6
	jr L_A493		;a4c7
L_A4C9:
	ld hl,0e070h		;a4c9
	call L_A4D2		;a4cc
	ld hl,0e078h		;a4cf
L_A4D2:
	ld a,(hl)			;a4d2
	and a			;a4d3
	ret z			;a4d4
	inc hl			;a4d5
	ld a,(hl)			;a4d6
	cp 002h		;a4d7
	ret c			;a4d9
	inc hl			;a4da
	ld e,(hl)			;a4db
	inc hl			;a4dc
	ld d,(hl)			;a4dd
	ld hl,0e0a0h		;a4de
	ld bc,02020h		;a4e1
	ld a,(0ca42h)		;a4e4
	and a			;a4e7
	ld a,003h		;a4e8
	jr z,L_A4EE		;a4ea
	ld a,007h		;a4ec
L_A4EE:
	jp 04767h		;a4ee
L_A4F1:
	ld hl,0e070h		;a4f1
	ld de,0e078h		;a4f4
	push hl			;a4f7
	push de			;a4f8
	call L_A4FE		;a4f9
	pop hl			;a4fc
	pop de			;a4fd
L_A4FE:
	ld a,(hl)			;a4fe
	and a			;a4ff
	ret z			;a500
	ld a,(de)			;a501
	and a			;a502
	jr z,L_A509		;a503
	inc de			;a505
	ld a,(de)			;a506
	dec a			;a507
	ret z			;a508
L_A509:
	inc hl			;a509
	ld a,(hl)			;a50a
	inc hl			;a50b
	cp 001h		;a50c
	jr z,L_A535		;a50e
	jp nc,L_A5C2		;a510
	ld bc,00020h		;a513
	push hl			;a516
	call L_A5EC		;a517
	pop hl			;a51a
	ret nc			;a51b
	push hl			;a51c
	ld e,(hl)			;a51d
	inc hl			;a51e
	ld d,(hl)			;a51f
	ex de,hl			;a520
	ld de,0c090h		;a521
	ld bc,02020h		;a524
	call 0474dh		;a527
	pop hl			;a52a
	call 06c2fh		;a52b
L_A52E:
	ld a,l			;a52e
	and 0f8h		;a52f
	inc a			;a531
	ld l,a			;a532
	inc (hl)			;a533
	ret			;a534
L_A535:
	inc hl			;a535
	inc hl			;a536
	dec (hl)			;a537
	dec (hl)			;a538
	jr z,L_A5A7		;a539
	push hl			;a53b
	ld hl,0e0a0h		;a53c
	ld de,02090h		;a53f
	ld a,(0ca42h)		;a542
	and a			;a545
	ld a,007h		;a546
	jr z,L_A54C		;a548
	ld a,003h		;a54a
L_A54C:
	call 047abh		;a54c
	pop hl			;a54f
	push hl			;a550
	ld b,(hl)			;a551
	ld a,0d0h		;a552
	sub (hl)			;a554
	ld h,a			;a555
	ld d,0e0h		;a556
	call L_A5AE		;a558
	pop hl			;a55b
	ld b,(hl)			;a55c
	push hl			;a55d
	xor a			;a55e
	sub (hl)			;a55f
	ld d,a			;a560
	ld h,0d0h		;a561
	call L_A5AE		;a563
	call L_A578		;a566
	pop hl			;a569
	ret c			;a56a
	dec hl			;a56b
L_A56C:
	ld d,(hl)			;a56c
	dec hl			;a56d
	ld e,(hl)			;a56e
	ld hl,0e090h		;a56f
	ld bc,0201fh		;a572
	jp 0475ah		;a575
L_A578:
	ld a,(0cb21h)		;a578
	cp 003h		;a57b
	jr z,L_A589		;a57d
	ld a,(0ca4ah)		;a57f
	sub 003h		;a582
	jr z,L_A599		;a584
	dec a			;a586
	jr z,L_A58B		;a587
L_A589:
	or a			;a589
	ret			;a58a
L_A58B:
	ld a,(0ca4bh)		;a58b
	cp 005h		;a58e
	jr nz,L_A589		;a590
	ld a,(0cacch)		;a592
	or a			;a595
	ret z			;a596
L_A597:
	scf			;a597
	ret			;a598
L_A599:
	ld a,(0ca4bh)		;a599
	cp 010h		;a59c
	jr nz,L_A589		;a59e
	ld a,(0cacah)		;a5a0
	or a			;a5a3
	ret z			;a5a4
	jr L_A597		;a5a5
L_A5A7:
	jp L_A52E		;a5a7
L_A5AA:
	inc hl			;a5aa
	inc hl			;a5ab
	jr L_A56C		;a5ac
L_A5AE:
	ld a,b			;a5ae
	and a			;a5af
	ret z			;a5b0
	ld e,090h		;a5b1
	ld l,e			;a5b3
	ld c,020h		;a5b4
	ld a,(0ca42h)		;a5b6
	and a			;a5b9
	ld a,050h		;a5ba
	jr z,L_A5BF		;a5bc
	xor a			;a5be
L_A5BF:
	jp 047edh		;a5bf
L_A5C2:
	ld bc,00418h		;a5c2
	call L_A5EC		;a5c5
	ret nc			;a5c8
	ld a,d			;a5c9
	and a			;a5ca
	ret nz			;a5cb
	ld a,(0ca4ah)		;a5cc
	cp 013h		;a5cf
	jr z,L_A5E6		;a5d1
	ld a,01ah		;a5d3
	ld (0cb00h),a		;a5d5
	xor a			;a5d8
	ld (0cb01h),a		;a5d9
	ld (0cb31h),a		;a5dc
	ld a,l			;a5df
	and 0f8h		;a5e0
	ld l,a			;a5e2
	ld (hl),000h		;a5e3
	ret			;a5e5
L_A5E6:
	ld a,020h		;a5e6
	ld (0d821h),a		;a5e8
	ret			;a5eb
L_A5EC:
	push hl			;a5ec
	call L_A609		;a5ed
	pop hl			;a5f0
	ld d,001h		;a5f1
	ret c			;a5f3
	ld a,(0cb05h)		;a5f4
	ld e,a			;a5f7
	ld a,(0cb03h)		;a5f8
	ld d,a			;a5fb
L_A5FC:
	ld a,d			;a5fc
	sub b			;a5fd
	sub (hl)			;a5fe
	cp c			;a5ff
	ld d,000h		;a600
	ret nc			;a602
	inc hl			;a603
	ld a,e			;a604
	sub b			;a605
	sub (hl)			;a606
	cp c			;a607
	ret			;a608
L_A609:
	ld a,(0cb80h)		;a609
	cp 008h		;a60c
	jp nz,L_A589		;a60e
	ld a,(0cb83h)		;a611
	ld d,a			;a614
	ld a,(0cb85h)		;a615
	ld e,a			;a618
	jr L_A5FC		;a619

; ----------------------------------------------------------------------
; DATOS resto_A61B: lo apuntan con el banco puesto p10:A480 (0xA61B); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p10:A480 (67 bytes)
;   0xa61b..0xa65e  (67 bytes)
DATA_resto_A61B:
	defb 003h,010h,042h,003h,010h,082h,003h,011h,068h,004h,005h,094h,004h,005h,099h,005h	; a61b  ..B.....h.......
	defb 000h,034h,005h,001h,042h,005h,003h,091h,005h,005h,033h,005h,007h,021h,005h,008h	; a62b  .4..B.....3..!..
	defb 066h,005h,008h,068h,008h,001h,017h,008h,003h,019h,008h,004h,095h,008h,006h,098h	; a63b  f..h............
	defb 00eh,004h,057h,010h,000h,054h,010h,001h,056h,011h,005h,077h,012h,010h,036h,013h	; a64b  ..W..T..V..w..6.
	defb 005h,074h,0ffh	; a65b

; ======================================================================
; CODIGO 0xa65e..0xa71a  (188 bytes)
; ======================================================================


L_A65E:
	cp 017h		;a65e
	jr z,L_A67B		;a660
	cp 02ah		;a662
	jr z,L_A681		;a664
	cp 02dh		;a666
	jr z,L_A68C		;a668
	cp 00ch		;a66a
	jr z,L_A692		;a66c
	cp 02bh		;a66e
	jr z,L_A69D		;a670
	cp 016h		;a672
	ret nz			;a674
	ld hl,0d7e1h		;a675
	res 6,(hl)		;a678
	ret			;a67a
L_A67B:
	ld hl,0d7d6h		;a67b
	set 6,(hl)		;a67e
	ret			;a680
L_A681:
	ld hl,0d7d8h		;a681
	set 4,(hl)		;a684
	ld hl,0d7d2h		;a686
	res 6,(hl)		;a689
	ret			;a68b
L_A68C:
	ld hl,0d7d9h		;a68c
	set 5,(hl)		;a68f
	ret			;a691
L_A692:
	ld hl,0d7dah		;a692
	set 6,(hl)		;a695
L_A697:
	ld hl,0d7dfh		;a697
	res 4,(hl)		;a69a
	ret			;a69c
L_A69D:
	ld hl,0d7dah		;a69d
	set 5,(hl)		;a6a0
	jr L_A697		;a6a2
L_A6A4:
	xor a			;a6a4
	ld hl,0e1f8h		;a6a5
	ld (hl),001h		;a6a8
	inc l			;a6aa
	ld (hl),a			;a6ab
	inc l			;a6ac
	ld (hl),004h		;a6ad
	inc l			;a6af
	ld (hl),a			;a6b0
	inc l			;a6b1
	ld (hl),e			;a6b2
	inc l			;a6b3
	ld (hl),d			;a6b4
	inc l			;a6b5
	ld (hl),0e0h		;a6b6
	inc l			;a6b8
	ld (hl),0e0h		;a6b9
	ld hl,0e25ch		;a6bb
	ld (hl),e			;a6be
	inc l			;a6bf
	ld (hl),d			;a6c0
	ret			;a6c1
L_A6C2:
	call L_A6C8		;a6c2
	jp L_A72E		;a6c5
L_A6C8:
	ld a,(0e1f8h)		;a6c8
	or a			;a6cb
	ret z			;a6cc
	ld hl,0e1fah		;a6cd
	dec (hl)			;a6d0
	ret nz			;a6d1
	ld (hl),004h		;a6d2
	ld hl,0e1f9h		;a6d4
	inc (hl)			;a6d7
	ld a,(hl)			;a6d8
	cp 002h		;a6d9
	jr z,L_A6F8		;a6db
	cp 004h		;a6dd
	ret c			;a6df
	ld (hl),000h		;a6e0
	ld hl,0e1fbh		;a6e2
	inc (hl)			;a6e5
	ld a,(hl)			;a6e6
	cp 006h		;a6e7
	jr z,L_A6F3		;a6e9
	ld hl,0a71ah		;a6eb
	ld de,0e1fch		;a6ee
	jr L_A6FE		;a6f1
L_A6F3:
	xor a			;a6f3
	ld (0e1f8h),a		;a6f4
	ret			;a6f7
L_A6F8:
	ld hl,0a724h		;a6f8
	ld de,0e1feh		;a6fb
L_A6FE:
	ld a,(0e1fbh)		;a6fe
	cp 005h		;a701
	jr z,L_A714		;a703
	call 043f6h		;a705
	ld a,(0e25ch)		;a708
	add a,l			;a70b
	ld (de),a			;a70c
	inc de			;a70d
	ld a,(0e25dh)		;a70e
	add a,h			;a711
	ld (de),a			;a712
	ret			;a713
L_A714:
	ld a,0e0h		;a714
	ld (de),a			;a716
	inc de			;a717
	ld (de),a			;a718
	ret			;a719

; ----------------------------------------------------------------------
; DATOS resto_A71A: lo apuntan con el banco puesto p10:A6EB (0xA71A), p10:A6F8
;   (0xA724); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p10:A6EB, p10:A6F8 (20 bytes)
;   0xa71a..0xa72e  (20 bytes)
DATA_resto_A71A:
	defb 000h,000h,008h,010h,018h,0f0h,010h,0f8h,008h,010h,0f8h,018h,0f0h,0f0h,000h,004h	; a71a  ................
	defb 015h,008h,008h,0f0h	; a72a

; ======================================================================
; CODIGO 0xa72e..0xa7b5  (135 bytes)
; ======================================================================


L_A72E:
	ld de,0dc29h		;a72e
	ld hl,0dc28h		;a731
	ld (hl),0e0h		;a734
	ld bc,00037h		;a736
	ldir		;a739
	ld a,(0e1f8h)		;a73b
	or a			;a73e
	ret z			;a73f
	call L_A747		;a740
	call L_A793		;a743
	ret			;a746
L_A747:
	ld de,0dc28h		;a747
	exx			;a74a
	ld a,(0e1fch)		;a74b
	ld e,a			;a74e
	ld a,(0e1fdh)		;a74f
	ld d,a			;a752
	exx			;a753
	ld a,(0e1f9h)		;a754
	call L_A76E		;a757
	ld de,0dc44h		;a75a
	exx			;a75d
	ld a,(0e1feh)		;a75e
	ld e,a			;a761
	ld a,(0e1ffh)		;a762
	ld d,a			;a765
	exx			;a766
	ld a,(0e1f9h)		;a767
	add a,002h		;a76a
	and 003h		;a76c
L_A76E:
	ld hl,0a7b5h		;a76e
	call 043f6h		;a771
	ld c,(hl)			;a774
	inc hl			;a775
L_A776:
	ld a,(hl)			;a776
	cp 0ffh		;a777
	ret z			;a779
	ld b,a			;a77a
	exx			;a77b
	ld a,e			;a77c
	exx			;a77d
	add a,b			;a77e
	ld (de),a			;a77f
	inc de			;a780
	inc hl			;a781
	ld b,(hl)			;a782
	exx			;a783
	ld a,d			;a784
	exx			;a785
	add a,b			;a786
	ld (de),a			;a787
	inc hl			;a788
	inc de			;a789
	ld a,c			;a78a
	ld (de),a			;a78b
	add a,004h		;a78c
	ld c,a			;a78e
	inc de			;a78f
	inc de			;a790
	jr L_A776		;a791
L_A793:
	ld a,(0e1f9h)		;a793
	ld hl,0a7f1h		;a796
	call 043f6h		;a799
	ld b,h			;a79c
	ld c,l			;a79d
	ld de,0daa1h		;a79e
	ld hl,0daa0h		;a7a1
L_A7A4:
	ld a,(bc)			;a7a4
	cp 0ffh		;a7a5
	ret z			;a7a7
	push bc			;a7a8
	ld bc,0000fh		;a7a9
	ld (hl),a			;a7ac
	ldir		;a7ad
	inc hl			;a7af
	inc de			;a7b0
	pop bc			;a7b1
	inc bc			;a7b2
	jr L_A7A4		;a7b3

; ----------------------------------------------------------------------
; DATOS resto_A7B5: lo apuntan con el banco puesto p10:A76E (0xA7B5), p10:A796
;   (0xA7F1); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p10:A76E, p10:A796 (122 bytes)
;   0xa7b5..0xa82f  (122 bytes)
DATA_resto_A7B5:
	defb 0bdh,0a7h,0c5h,0a7h,0d5h,0a7h,0e5h,0a7h,078h,008h,0f9h,008h,009h,008h,009h,0ffh	; a7b5  ........x.......
	defb 084h,000h,000h,000h,010h,010h,000h,010h,010h,004h,006h,010h,002h,009h,010h,0ffh	; a7c5  ................
	defb 0a0h,000h,000h,000h,010h,010h,000h,010h,010h,010h,000h,010h,010h,000h,008h,0ffh	; a7d5  ................
	defb 0bch,00ah,003h,000h,008h,00bh,010h,009h,004h,004h,00ch,0ffh,0f9h,0a7h,008h,0a8h	; a7e5  ................
	defb 015h,0a8h,020h,0a8h,00ah,00ah,007h,000h,000h,000h,000h,003h,003h,003h,003h,00ah	; a7f5  .. .............
	defb 00ah,00ah,0ffh,00ah,00ah,00ah,00ah,007h,007h,007h,003h,003h,003h,00ah,00ah,0ffh	; a805  ................
	defb 003h,003h,003h,003h,00ah,00ah,00ah,00ah,00ah,007h,0ffh,003h,003h,003h,00ah,00ah	; a815  ................
	defb 000h,000h,00ah,00ah,00ah,00ah,007h,007h,007h,0ffh	; a825  ..........

; ======================================================================
; CODIGO 0xa82f..0xaa8f  (608 bytes)
; ======================================================================


L_A82F:
	call L_A83B		;a82f
	call L_A877		;a832
	call L_A8AF		;a835
	jp L_AA56		;a838
L_A83B:
	ld hl,0d7d2h		;a83b
	ld a,(hl)			;a83e
	and 0efh		;a83f
	ld (hl),a			;a841
	ld hl,0d7d5h		;a842
	ld a,(hl)			;a845
	and 0fdh		;a846
	ld (hl),a			;a848
	inc hl			;a849
	ld a,(hl)			;a84a
	and 0f7h		;a84b
	ld (hl),a			;a84d
	ld hl,0d7d8h		;a84e
	ld a,(hl)			;a851
	and 07fh		;a852
	ld (hl),a			;a854
	ld hl,0d7dbh		;a855
	ld a,(hl)			;a858
	and 01ch		;a859
	ld (hl),a			;a85b
	ld hl,0d7dch		;a85c
	ld a,(hl)			;a85f
	and 0dfh		;a860
	ld (hl),a			;a862
	ld hl,0d7e0h		;a863
	ld a,(hl)			;a866
	and 0eah		;a867
	ld (hl),a			;a869
	inc hl			;a86a
	ld a,(hl)			;a86b
	and 05dh		;a86c
	ld (hl),a			;a86e
	ld hl,0d7e3h		;a86f
	ld a,(hl)			;a872
	and 0abh		;a873
	ld (hl),a			;a875
	ret			;a876
L_A877:
	ld hl,0d7dbh		;a877
	ld a,(0ca4ah)		;a87a
	cp 001h		;a87d
	ret c			;a87f
	cp 006h		;a880
	jr z,L_A896		;a882
	cp 007h		;a884
	jr c,L_A893		;a886
	cp 008h		;a888
	jr z,L_A8A6		;a88a
	cp 00bh		;a88c
	ret c			;a88e
	cp 010h		;a88f
	jr c,L_A8A3		;a891
L_A893:
	set 6,(hl)		;a893
	ret			;a895
L_A896:
	ld a,(0ca76h)		;a896
	or a			;a899
	jr nz,L_A8A3		;a89a
	ld a,(0ca4bh)		;a89c
	cp 016h		;a89f
	jr c,L_A893		;a8a1
L_A8A3:
	set 5,(hl)		;a8a3
	ret			;a8a5
L_A8A6:
	ld a,(0ca4bh)		;a8a6
	cp 00fh		;a8a9
	jr z,L_A8A3		;a8ab
	jr L_A893		;a8ad
L_A8AF:
	ld a,(0ca4ah)		;a8af
	or a			;a8b2
	jr z,L_A8F1		;a8b3
	cp 001h		;a8b5
	jr z,L_A905		;a8b7
	cp 007h		;a8b9
	jp z,L_A986		;a8bb
	cp 008h		;a8be
	jp z,L_A9E8		;a8c0
	cp 00ah		;a8c3
	jp z,L_A910		;a8c5
	cp 00bh		;a8c8
	jp z,L_A949		;a8ca
	cp 00dh		;a8cd
	jp z,L_A9DC		;a8cf
	cp 00eh		;a8d2
	jp z,L_A95F		;a8d4
	cp 00fh		;a8d7
	jp z,L_A96F		;a8d9
	cp 010h		;a8dc
	jp z,L_A9EE		;a8de
	cp 011h		;a8e1
	jp z,L_A9F4		;a8e3
	cp 012h		;a8e6
	jp z,L_AA00		;a8e8
	cp 013h		;a8eb
	jp z,L_AA28		;a8ed
	ret			;a8f0
L_A8F1:
	ld a,(0ca4bh)		;a8f1
	cp 00ah		;a8f4
	ret c			;a8f6
	cp 00dh		;a8f7
	ret nc			;a8f9
	ld hl,0d7d0h		;a8fa
	set 2,(hl)		;a8fd
	ld hl,0d7ddh		;a8ff
	res 3,(hl)		;a902
	ret			;a904
L_A905:
	ld hl,0d7d0h		;a905
	res 0,(hl)		;a908
	ld hl,0d7e2h		;a90a
	set 3,(hl)		;a90d
	ret			;a90f
L_A910:
	call L_A931		;a910
	ld hl,0d7e0h		;a913
	ld a,(0ca4bh)		;a916
	cp 009h		;a919
	ret c			;a91b
	cp 00bh		;a91c
	ret z			;a91e
	cp 00ch		;a91f
	ret z			;a921
	cp 010h		;a922
	ret z			;a924
	cp 011h		;a925
	ret z			;a927
	cp 015h		;a928
	ret z			;a92a
	cp 019h		;a92b
	ret nc			;a92d
	set 2,(hl)		;a92e
	ret			;a930
L_A931:
	ld hl,0d7e3h		;a931
	ld a,(0ca4bh)		;a934
	cp 00bh		;a937
	jr z,L_A946		;a939
	cp 00ch		;a93b
	jr z,L_A946		;a93d
	cp 010h		;a93f
	jr z,L_A946		;a941
	cp 011h		;a943
	ret nz			;a945
L_A946:
	set 2,(hl)		;a946
	ret			;a948
L_A949:
	ld hl,0d7d2h		;a949
	set 0,(hl)		;a94c
	ld hl,0d7dch		;a94e
	res 0,(hl)		;a951
	ld a,(0ca4bh)		;a953
	cp 005h		;a956
	ret nz			;a958
	ld hl,0d7d3h		;a959
	set 7,(hl)		;a95c
	ret			;a95e
L_A95F:
	ld hl,0d7e0h		;a95f
	ld a,(0ca4bh)		;a962
	cp 004h		;a965
	jr z,L_A96C		;a967
	cp 005h		;a969
	ret nz			;a96b
L_A96C:
	set 0,(hl)		;a96c
	ret			;a96e
L_A96F:
	ld a,(0ca4bh)		;a96f
	or a			;a972
	jr z,L_A980		;a973
	ld hl,0d7e3h		;a975
	set 6,(hl)		;a978
	ld hl,0d7d3h		;a97a
	set 0,(hl)		;a97d
	ret			;a97f
L_A980:
	ld hl,0d7d3h		;a980
	set 2,(hl)		;a983
	ret			;a985
L_A986:
	ld hl,0d7e3h		;a986
	set 4,(hl)		;a989
	call L_A9B5		;a98b
	call L_A9C4		;a98e
	ld hl,0d7dbh		;a991
	ld a,(0ca4bh)		;a994
	cp 00bh		;a997
	jr z,L_A9AD		;a999
	cp 00dh		;a99b
	jr z,L_A9AD		;a99d
	cp 00eh		;a99f
	jr z,L_A9A6		;a9a1
	cp 00fh		;a9a3
	ret nz			;a9a5
L_A9A6:
	ld hl,0d7d2h		;a9a6
	set 4,(hl)		;a9a9
	jr L_A9AF		;a9ab
L_A9AD:
	set 7,(hl)		;a9ad
L_A9AF:
	ld hl,0d7e0h		;a9af
	set 4,(hl)		;a9b2
	ret			;a9b4
L_A9B5:
	ld hl,0d7e1h		;a9b5
	ld a,(0ca4bh)		;a9b8
	cp 010h		;a9bb
	ret c			;a9bd
	cp 014h		;a9be
	ret nc			;a9c0
	set 7,(hl)		;a9c1
	ret			;a9c3
L_A9C4:
	ld a,(0ca4bh)		;a9c4
	cp 002h		;a9c7
	jr c,L_A9D6		;a9c9
	cp 005h		;a9cb
	jr z,L_A9D6		;a9cd
	cp 006h		;a9cf
	jr z,L_A9D6		;a9d1
	cp 00ah		;a9d3
	ret nz			;a9d5
L_A9D6:
	ld hl,0d7e1h		;a9d6
	set 5,(hl)		;a9d9
	ret			;a9db
L_A9DC:
	ld a,(0ca4bh)		;a9dc
	cp 005h		;a9df
	ret nz			;a9e1
	ld hl,0d7d6h		;a9e2
	set 3,(hl)		;a9e5
	ret			;a9e7
L_A9E8:
	ld hl,0d7d4h		;a9e8
	set 0,(hl)		;a9eb
	ret			;a9ed
L_A9EE:
	ld hl,0d8e0h		;a9ee
	res 1,(hl)		;a9f1
	ret			;a9f3
L_A9F4:
	ld a,(0ca4bh)		;a9f4
	cp 005h		;a9f7
	ret nz			;a9f9
	ld hl,0d7dah		;a9fa
	set 1,(hl)		;a9fd
	ret			;a9ff
L_AA00:
	call L_AA14		;aa00
	ld hl,0d7dbh		;aa03
	ld a,(0ca4bh)		;aa06
	cp 00eh		;aa09
	jr nz,L_AA11		;aa0b
	dec hl			;aa0d
	set 2,(hl)		;aa0e
	ret			;aa10
L_AA11:
	set 1,(hl)		;aa11
	ret			;aa13
L_AA14:
	ld a,(0ca4bh)		;aa14
	cp 005h		;aa17
	jr z,L_AA22		;aa19
	cp 007h		;aa1b
	jr z,L_AA22		;aa1d
	cp 009h		;aa1f
	ret nz			;aa21
L_AA22:
	ld hl,0d7d8h		;aa22
	set 7,(hl)		;aa25
	ret			;aa27
L_AA28:
	ld hl,0d7e0h		;aa28
	set 2,(hl)		;aa2b
	call L_AA42		;aa2d
	call L_AA4E		;aa30
	ld hl,0d7dbh		;aa33
	set 0,(hl)		;aa36
	inc hl			;aa38
	ld a,(0ca4bh)		;aa39
	cp 004h		;aa3c
	ret nc			;aa3e
	set 5,(hl)		;aa3f
	ret			;aa41
L_AA42:
	ld a,(0ca4bh)		;aa42
	cp 005h		;aa45
	ret nz			;aa47
	ld hl,0d7d5h		;aa48
	set 1,(hl)		;aa4b
	ret			;aa4d
L_AA4E:
	ld a,(0ca4bh)		;aa4e
	cp 004h		;aa51
	jr z,L_AA22		;aa53
	ret			;aa55
L_AA56:
	ld a,(0ca76h)		;aa56
	cp 039h		;aa59
	jr z,L_AA6C		;aa5b
	cp 029h		;aa5d
	ret nz			;aa5f
	ld a,(0ca4bh)		;aa60
	cp 002h		;aa63
	ret c			;aa65
	ld hl,0d7e1h		;aa66
	set 1,(hl)		;aa69
	ret			;aa6b
L_AA6C:
	ld a,(0ca4bh)		;aa6c
	cp 001h		;aa6f
	ret nz			;aa71
	ld hl,0d7d8h		;aa72
	set 1,(hl)		;aa75
	ret			;aa77
L_AA78:
	ld a,(0d8a4h)		;aa78
	and a			;aa7b
	ret z			;aa7c
	ld hl,06bcch		;aa7d
	call 086d0h		;aa80
	call L_AAA9		;aa83
	ld a,(ix+001h)		;aa86
	ld hl,0aa8fh		;aa89
	call 0424dh		;aa8c

; ----------------------------------------------------------------------
; DATOS tabla_AA8F: 13 destinos del despachador p00:424D (call en p10:AA8C, el
;   indice en A): AAB8, AADB, AAEB, AAFC, AB26, ABA5, ABD4, AC18, ABFE, AC88,
;   ACEA, AD03, AD0C; lo leen p10:AA8C (26 bytes)
;   0xaa8f..0xaaa9  (26 bytes)
DATA_tabla_AA8F:
	defw 0aab8h,0aadbh,0aaebh,0aafch,0ab26h,0aba5h,0abd4h,0ac18h	; aa8f
	defw 0abfeh,0ac88h,0aceah,0ad03h,0ad0ch	; aa9f

; ======================================================================
; CODIGO 0xaaa9..0xab9d  (244 bytes)
; ======================================================================


L_AAA9:
	ld a,(0ca1ch)		;aaa9
	and a			;aaac
	jr z,L_AAB2		;aaad
	ld a,(0d8a5h)		;aaaf
L_AAB2:
	ld b,a			;aab2
	ld c,017h		;aab3
	jp 00047h		;aab5   ; BIOS WRTVDP - Writes data in the VDP-register
L_AAB8:
	xor a			;aab8
	ld (0cb39h),a		;aab9
	ld hl,00000h		;aabc
	ld (0ca19h),hl		;aabf
	ld hl,0d7d5h		;aac2
	set 2,(hl)		;aac5
	ld hl,0d7e0h		;aac7
	res 6,(hl)		;aaca
	inc a			;aacc
	ld (0cb3ch),a		;aacd
	ld de,06060h		;aad0
	call 07a33h		;aad3
	call 06b75h		;aad6
	jr L_AB22		;aad9
L_AADB:
	call 07a38h		;aadb
	ld a,(0e270h)		;aade
	and a			;aae1
	ret nz			;aae2
	ld de,00d10h		;aae3
	call 061ceh		;aae6
	jr L_AB22		;aae9
L_AAEB:
	call 061feh		;aaeb
	ret nz			;aaee
	call 07a3eh		;aaef
	xor a			;aaf2
	ld (0d8a4h),a		;aaf3
L_AAF6:
	xor a			;aaf6
	ld (0cb3ch),a		;aaf7
	jr L_AB22		;aafa
L_AAFC:
	ld a,(0ca4bh)		;aafc
	cp 008h		;aaff
	ret nz			;ab01
	ld a,001h		;ab02
	ld (0cb3ch),a		;ab04
	ld (0ca1ch),a		;ab07
	xor a			;ab0a
	ld (0d8a5h),a		;ab0b
	ld (ix+00dh),a		;ab0e
	inc a			;ab11
	ld (ix+011h),a		;ab12
	ld (ix+00eh),080h		;ab15
	ld (ix+003h),000h		;ab19
	ld a,060h		;ab1d
	ld (ix+005h),a		;ab1f
L_AB22:
	inc (ix+001h)		;ab22
	ret			;ab25
L_AB26:
	dec (ix+00eh)		;ab26
	jr z,L_AB4D		;ab29
	inc (ix+003h)		;ab2b
	ld hl,0d8a5h		;ab2e
	dec (hl)			;ab31
	ld a,(ix+00eh)		;ab32
	ld b,a			;ab35
	add a,040h		;ab36
	ld l,a			;ab38
	ld h,000h		;ab39
	add a,040h		;ab3b
	ld e,a			;ab3d
	ld d,030h		;ab3e
	ld bc,06001h		;ab40
	ld a,002h		;ab43
	call 04767h		;ab45
	ld bc,00501h		;ab48
	jr L_AB58		;ab4b
L_AB4D:
	call 06b75h		;ab4d
	ld de,00ec0h		;ab50
	call 061ceh		;ab53
	jr L_AB22		;ab56
L_AB58:
	dec (ix+011h)		;ab58
	ret nz			;ab5b
	ld (ix+011h),b		;ab5c
	ld a,(ix+00dh)		;ab5f
	add a,c			;ab62
	and 003h		;ab63
	ld (ix+00dh),a		;ab65
	push af			;ab68
	rr a		;ab69
	jr nc,L_AB7C		;ab6b
	ld a,(ix+001h)		;ab6d
	cp 004h		;ab70
	jr nz,L_AB79		;ab72
	call 06cbah		;ab74
	jr L_AB7C		;ab77
L_AB79:
	call 06cb6h		;ab79
L_AB7C:
	pop af			;ab7c
L_AB7D:
	ld hl,0ab9dh		;ab7d
	call 043f6h		;ab80
	ld d,l			;ab83
	ld l,040h		;ab84
	ld e,0c8h		;ab86
	ld b,038h		;ab88
L_AB8A:
	push hl			;ab8a
	push de			;ab8b
	push bc			;ab8c
	ld a,002h		;ab8d
	ld bc,02801h		;ab8f
	call 04767h		;ab92
	pop bc			;ab95
	pop de			;ab96
	pop hl			;ab97
	inc l			;ab98
	inc e			;ab99
	djnz L_AB8A		;ab9a
	ret			;ab9c

; ----------------------------------------------------------------------
; DATOS resto_AB9D: lo apuntan con el banco puesto p10:AB7D (0xAB9D); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p10:AB7D (8 bytes)
;   0xab9d..0xaba5  (8 bytes)
DATA_resto_AB9D:
	defb 030h,060h,068h,088h,030h,0b0h,068h,0d8h	; ab9d  0`h.0.h.

; ======================================================================
; CODIGO 0xaba5..0xad8e  (489 bytes)
; ======================================================================


L_ABA5:
	call 061feh		;aba5
	ret nz			;aba8
	call 07a3eh		;aba9
	ld a,(0d8a5h)		;abac
	add a,0d8h		;abaf
	ld e,a			;abb1
	xor a			;abb2
	ld l,a			;abb3
	ld h,a			;abb4
	ld d,a			;abb5
	ld bc,0c028h		;abb6
	call 04767h		;abb9
	ld (ix+00fh),0a0h		;abbc
	ld a,001h		;abc0
	ld (ix+011h),a		;abc2
	ld (ix+016h),a		;abc5
	ld (ix+016h),a		;abc8
	call L_AAF6		;abcb
	call 06b12h		;abce
	jp 08685h		;abd1
L_ABD4:
	call L_ABE6		;abd4
	ret c			;abd7
L_ABD8:
	ld (ix+00eh),031h		;abd8
	xor a			;abdc
	ld (ix+00fh),a		;abdd
	ld (ix+018h),a		;abe0
	jp L_AB22		;abe3
L_ABE6:
	ld bc,00201h		;abe6
	call L_AB58		;abe9
	inc (ix+003h)		;abec
	inc (ix+003h)		;abef
	ld hl,0d8a5h		;abf2
	dec (hl)			;abf5
	dec (hl)			;abf6
	ld a,(ix+003h)		;abf7
	cp (ix+00fh)		;abfa
	ret			;abfd
L_ABFE:
	call L_AC04		;abfe
	ret nc			;ac01
	jr L_ABD8		;ac02
L_AC04:
	ld bc,004ffh		;ac04
	call L_AB58		;ac07
	dec (ix+003h)		;ac0a
	ld hl,0d8a5h		;ac0d
	inc (hl)			;ac10
	ld a,(ix+003h)		;ac11
	cp (ix+00fh)		;ac14
	ret			;ac17
L_AC18:
	dec (ix+00eh)		;ac18
	jr z,L_AC4B		;ac1b
	ld a,(ix+00eh)		;ac1d
	and 007h		;ac20
	ret nz			;ac22
	ld a,(0cb03h)		;ac23
	ld l,a			;ac26
	ld a,(0cb05h)		;ac27
	ld h,a			;ac2a
	sub 050h		;ac2b
	cp 020h		;ac2d
	jr nc,L_AC3A		;ac2f
	ld a,(ix+003h)		;ac31
	sub l			;ac34
	add a,008h		;ac35
	cp 028h		;ac37
	ret c			;ac39
L_AC3A:
	ld a,(ix+00fh)		;ac3a
	inc (ix+00fh)		;ac3d
	add a,a			;ac40
	add a,a			;ac41
	add a,00ch		;ac42
	add a,h			;ac44
	sub 010h		;ac45
	ld h,a			;ac47
	jp 09b30h		;ac48
L_AC4B:
	ld (ix+011h),001h		;ac4b
	ld a,(ix+001h)		;ac4f
	cp 007h		;ac52
	jr nz,L_AC6E		;ac54
	ld a,(ix+00dh)		;ac56
	dec a			;ac59
	and 003h		;ac5a
	ld (ix+00dh),a		;ac5c
	call 04256h		;ac5f
	and 01fh		;ac62
	add a,060h		;ac64
	ld (ix+00fh),a		;ac66
	ld (ix+001h),008h		;ac69
	ret			;ac6d
L_AC6E:
	ld a,(ix+00dh)		;ac6e
	inc a			;ac71
	and 003h		;ac72
	ld (ix+00dh),a		;ac74
	call 04256h		;ac77
	and 01fh		;ac7a
	neg		;ac7c
	add a,0b4h		;ac7e
	ld (ix+00fh),a		;ac80
	ld (ix+001h),006h		;ac83
	ret			;ac87
L_AC88:
	dec (ix+00eh)		;ac88
	jr z,L_AC4B		;ac8b
	ld a,(ix+00eh)		;ac8d
	add a,004h		;ac90
	and 00fh		;ac92
	ret nz			;ac94
	inc (ix+018h)		;ac95
	ld a,(ix+018h)		;ac98
	cp 003h		;ac9b
	ret nc			;ac9d
	rra			;ac9e
	ld a,(ix+003h)		;ac9f
	jr nc,L_ACAB		;aca2
	sub 058h		;aca4
	ld e,a			;aca6
	ld d,038h		;aca7
	jr L_ACB0		;aca9
L_ACAB:
	sub 048h		;acab
	ld e,a			;acad
	ld d,080h		;acae
L_ACB0:
	ld hl,0d4c0h		;acb0
	ld bc,00200h		;acb3
L_ACB6:
	ld a,(hl)			;acb6
	and a			;acb7
	jr z,L_ACC4		;acb8
	ld a,010h		;acba
	call 0423eh		;acbc
	inc c			;acbf
	inc c			;acc0
	djnz L_ACB6		;acc1
	ret			;acc3
L_ACC4:
	push hl			;acc4
	push de			;acc5
	push bc			;acc6
	ld bc,0000fh		;acc7
	call 04236h		;acca
	pop bc			;accd
	pop de			;acce
	pop hl			;accf
	ld (hl),001h		;acd0
	inc l			;acd2
	inc l			;acd3
	inc l			;acd4
	ld (hl),e			;acd5
	inc l			;acd6
	inc l			;acd7
	ld (hl),d			;acd8
	inc l			;acd9
	inc l			;acda
	dec a			;acdb
	ld a,003h		;acdc
	jr z,L_ACE1		;acde
	inc a			;ace0
L_ACE1:
	ld (hl),a			;ace1
	ld a,007h		;ace2
	add a,l			;ace4
	ld l,a			;ace5
	ld (hl),c			;ace6
	jp 06a6fh		;ace7
L_ACEA:
	ld a,001h		;acea
	ld (0cb3ch),a		;acec
	ld (ix+00fh),088h		;acef
	ld a,(ix+003h)		;acf3
	cp 088h		;acf6
	jr z,L_AD07		;acf8
	ld a,00ch		;acfa
	jp c,L_AB22		;acfc
	ld (ix+001h),a		;acff
	ret			;ad02
L_AD03:
	call L_ABE6		;ad03
	ret c			;ad06
L_AD07:
	ld (ix+001h),020h		;ad07
	ret			;ad0b
L_AD0C:
	call L_AC04		;ad0c
	ret nc			;ad0f
	jr L_AD07		;ad10
L_AD12:
	call L_AD21		;ad12
	inc (ix+00fh)		;ad15
	ld a,(ix+00fh)		;ad18
	and 007h		;ad1b
	ret nz			;ad1d
	jp 06a48h		;ad1e
L_AD21:
	ld a,(ix+00fh)		;ad21
	and 00ch		;ad24
	add a,a			;ad26
	ld hl,0ad8eh		;ad27
	call 0423eh		;ad2a
	ld de,0dc28h		;ad2d
	ldi		;ad30
	ldi		;ad32
	inc de			;ad34
	inc de			;ad35
	dec hl			;ad36
	dec hl			;ad37
	ldi		;ad38
	ldi		;ad3a
	inc de			;ad3c
	inc de			;ad3d
	ldi		;ad3e
	ldi		;ad40
	inc de			;ad42
	inc de			;ad43
	dec hl			;ad44
	dec hl			;ad45
	ldi		;ad46
	ldi		;ad48
	inc de			;ad4a
	inc de			;ad4b
	ldi		;ad4c
	ldi		;ad4e
	inc de			;ad50
	inc de			;ad51
	dec hl			;ad52
	dec hl			;ad53
	ldi		;ad54
	ldi		;ad56
	inc de			;ad58
	inc de			;ad59
	ldi		;ad5a
	ldi		;ad5c
	inc de			;ad5e
	inc de			;ad5f
	dec hl			;ad60
	dec hl			;ad61
	ldi		;ad62
	ldi		;ad64
	ld a,(ix+00fh)		;ad66
	and 003h		;ad69
	ld hl,0adaeh		;ad6b
	call 0423eh		;ad6e
	ld de,0dc2ah		;ad71
	ld b,004h		;ad74
L_AD76:
	ld a,(hl)			;ad76
	ld (de),a			;ad77
	inc de			;ad78
	inc de			;ad79
	inc de			;ad7a
	inc de			;ad7b
	add a,004h		;ad7c
	ld (de),a			;ad7e
	inc de			;ad7f
	inc de			;ad80
	inc de			;ad81
	inc de			;ad82
	djnz L_AD76		;ad83
	ld hl,0daa0h		;ad85
	ld de,0adb2h		;ad88
	jp 051e0h		;ad8b

; ----------------------------------------------------------------------
; DATOS resto_AD8E: lo apuntan con el banco puesto p10:AD27 (0xAD8E), p10:AD6B
;   (0xADAE), p10:AD88 (0xADB2); el tamano es lo que hay hasta lo siguiente,
;   no sale de recorrerlo; lo leen p10:AD27, p10:AD6B, p10:AD88 (53 bytes)
;   0xad8e..0xadc3  (53 bytes)
DATA_resto_AD8E:
	defb 078h,030h,068h,040h,068h,070h,048h,070h,078h,040h,058h,040h,078h,070h,060h,070h	; ad8e  x0h@hpHpx@X@xp`p
	defb 070h,040h,050h,040h,078h,080h,058h,070h,068h,038h,048h,040h,068h,078h,050h,070h	; ad9e  p@P@x.Xph8H@hxPp
	defb 028h,030h,038h,03ch,010h,007h,010h,04ah,010h,007h,010h,04ah,010h,007h,010h,04ah	; adae  (08<...J...J...J
	defb 010h,007h,010h,04ah,000h	; adbe

; ======================================================================
; CODIGO 0xadc3..0xae28  (101 bytes)
; ======================================================================


L_ADC3:
	ld a,(ix+00fh)		;adc3
	rrca			;adc6
	rrca			;adc7
	and 007h		;adc8
	ld hl,0ae8ch		;adca
	call 043f6h		;adcd
	ex de,hl			;add0
	call L_ADE0		;add1
	ld a,(ix+00fh)		;add4
	inc (ix+00fh)		;add7
	and 007h		;adda
	jp z,06a44h		;addc
	ret			;addf
L_ADE0:
	push de			;ade0
	ld hl,0dc28h		;ade1
	ld bc,0001fh		;ade4
	ld a,0e0h		;ade7
	call 04237h		;ade9
	pop de			;adec
	ld a,(ix+00fh)		;aded
	and 003h		;adf0
	ld hl,0ae28h		;adf2
	call 043f6h		;adf5
	ld b,(hl)			;adf8
	inc hl			;adf9
	exx			;adfa
	ld hl,0dc28h		;adfb
	ld de,0daa0h		;adfe
	exx			;ae01
L_AE02:
	ld a,(hl)			;ae02
	add a,e			;ae03
	exx			;ae04
	ld (hl),a			;ae05
	inc hl			;ae06
	exx			;ae07
	inc hl			;ae08
	ld a,(hl)			;ae09
	add a,d			;ae0a
	exx			;ae0b
	ld (hl),a			;ae0c
	inc hl			;ae0d
	exx			;ae0e
	inc hl			;ae0f
	ld a,(hl)			;ae10
	exx			;ae11
	ld (hl),a			;ae12
	inc hl			;ae13
	inc hl			;ae14
	exx			;ae15
	inc hl			;ae16
	ld a,(hl)			;ae17
	exx			;ae18
	push hl			;ae19
	ex de,hl			;ae1a
	ld bc,0000fh		;ae1b
	call 04237h		;ae1e
	pop hl			;ae21
	inc de			;ae22
	exx			;ae23
	inc hl			;ae24
	djnz L_AE02		;ae25
	ret			;ae27

; ----------------------------------------------------------------------
; DATOS resto_AE28: lo apuntan con el banco puesto p10:ADF2 (0xAE28), p10:ADCA
;   (0xAE8C); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p10:ADF2, p10:ADCA (116 bytes)
;   0xae28..0xae9c  (116 bytes)
DATA_resto_AE28:
	defb 030h,0aeh,03dh,0aeh,05ah,0aeh,077h,0aeh,003h,008h,009h,080h,007h,008h,009h,07ch	; ae28  0.=.Z.w........|
	defb 00ah,008h,000h,078h,00ah,007h,009h,010h,09ch,007h,010h,002h,098h,007h,003h,006h	; ae38  ...x............
	defb 094h,007h,010h,010h,090h,00ah,010h,000h,08ch,00ah,000h,010h,088h,00ah,000h,000h	; ae48  ................
	defb 084h,00ah,007h,000h,008h,0b8h,00ah,010h,010h,0b4h,00ah,010h,000h,0b0h,00ah,010h	; ae58  ................
	defb 010h,0ach,003h,010h,000h,0a8h,003h,000h,010h,0a4h,003h,000h,000h,0a0h,003h,005h	; ae68  ................
	defb 009h,004h,0cch,00ah,004h,00ch,0c8h,00ah,00bh,010h,0c4h,003h,000h,008h,0c0h,003h	; ae78  ................
	defb 00ah,003h,0bch,003h,028h,068h,000h,028h,000h,058h,020h,040h,048h,050h,018h,030h	; ae88  ....(h.(.X @HP.0
	defb 020h,058h,030h,040h	; ae98

; ======================================================================
; CODIGO 0xae9c..0xafc2  (294 bytes)
; ======================================================================


L_AE9C:
	ld hl,03080h		;ae9c
	ld c,(ix+00eh)		;ae9f
	srl c		;aea2
	ld b,00bh		;aea4
	xor a			;aea6
L_AEA7:
	add a,c			;aea7
	cp 060h		;aea8
	jr c,L_AEAE		;aeaa
	sub 060h		;aeac
L_AEAE:
	djnz L_AEA7		;aeae
	ld c,h			;aeb0
	add a,h			;aeb1
	ld h,a			;aeb2
	ld a,c			;aeb3
	add a,060h		;aeb4
	ld c,a			;aeb6
	ld b,044h		;aeb7
L_AEB9:
	push hl			;aeb9
	push bc			;aeba
	ld a,(0ca42h)		;aebb
	ld d,a			;aebe
	xor a			;aebf
	ld bc,00202h		;aec0
	call 046ffh		;aec3
	pop bc			;aec6
	pop hl			;aec7
	inc l			;aec8
	inc l			;aec9
	ld a,h			;aeca
	add a,01bh		;aecb
	cp c			;aecd
	jr c,L_AED2		;aece
	sub 060h		;aed0
L_AED2:
	ld h,a			;aed2
	djnz L_AEB9		;aed3
	ret			;aed5
L_AED6:
	call 0642ch		;aed6
	call L_BBDD		;aed9
	ld a,(0d701h)		;aedc
	dec a			;aedf
	jp z,L_B185		;aee0
	ld hl,0cb52h		;aee3
	ld (hl),000h		;aee6
	ld hl,0cb5ch		;aee8
	ld (hl),000h		;aeeb
	call 04650h		;aeed
	call 045f1h		;aef0
	call L_AF27		;aef3
	call 045beh		;aef6
	ld bc,00f07h		;aef9
	call 00047h		;aefc   ; BIOS WRTVDP - Writes data in the VDP-register
	call 0846fh		;aeff
	call 04266h		;af02
	call 045d7h		;af05
	call L_AFB2		;af08
	call L_AF88		;af0b
	ld c,007h		;af0e
	call L_B880		;af10
	ld (0d704h),a		;af13
	call L_B3F9		;af16
	call L_B8C7		;af19
	ld hl,0cabdh		;af1c
	ld (hl),001h		;af1f
	call 04650h		;af21
	jp 04606h		;af24
L_AF27:
	ld hl,0df80h		;af27
	ld bc,0003fh		;af2a
	jp 04236h		;af2d
L_AF30:
	call 0642ch		;af30
	call L_BBDD		;af33
	ld a,(0d701h)		;af36
	dec a			;af39
	jp z,L_B1DF		;af3a
	ld hl,0cb52h		;af3d
	ld (hl),000h		;af40
	call 04650h		;af42
	call 045f1h		;af45
	call L_AF27		;af48
	call 045beh		;af4b
	ld bc,00f07h		;af4e
	call 00047h		;af51   ; BIOS WRTVDP - Writes data in the VDP-register
	call 0846fh		;af54
	call 04266h		;af57
	call 045d7h		;af5a
	call L_AFCD		;af5d
	call L_AFA0		;af60
	ld c,007h		;af63
	call L_B880		;af65
	ld (0d704h),a		;af68
	call L_B401		;af6b
	call L_B926		;af6e
	call L_B17D		;af71
	call 08ed8h		;af74
	ld hl,(0ca50h)		;af77
	ld (0ca70h),hl		;af7a
	ld hl,0cabdh		;af7d
	ld (hl),001h		;af80
	call 04650h		;af82
	jp 04606h		;af85
L_AF88:
	call L_B161		;af88
	call L_B002		;af8b
	call L_B36F		;af8e
	call L_B00E		;af91
	call L_B13A		;af94
	call L_B145		;af97
	call L_B38F		;af9a
	jp L_B150		;af9d
L_AFA0:
	call L_B161		;afa0
	call L_B008		;afa3
	call L_B374		;afa6
	call L_B042		;afa9
	call L_B13A		;afac
	jp L_B3C1		;afaf
L_AFB2:
	ld de,0d700h		;afb2
	ld hl,0afc2h		;afb5
	ld bc,0000bh		;afb8
	ldir		;afbb
	ld hl,0d70bh		;afbd
	jr $+27		;afc0

; ----------------------------------------------------------------------
; DATOS resto_AFC2: lo apuntan con el banco puesto p10:AFB5 (0xAFC2); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p10:AFB5 (11 bytes)
;   0xafc2..0xafcd  (11 bytes)
DATA_resto_AFC2:
	defb 000h,001h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; afc2  ...........

; ======================================================================
; CODIGO 0xafcd..0xafeb  (30 bytes)
; ======================================================================


L_AFCD:
	ld de,0d700h		;afcd
	ld hl,0afebh		;afd0
	ld bc,00008h		;afd3
	ldir		;afd6
	ld hl,0d70dh		;afd8
L_AFDB:
	ld de,0d702h		;afdb
	ldi		;afde
	ldi		;afe0
	ld hl,0d710h		;afe2
	ld bc,0003fh		;afe5
	jp 04236h		;afe8

; ----------------------------------------------------------------------
; DATOS resto_AFEB: lo apuntan con el banco puesto p10:AFD0 (0xAFEB); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p10:AFD0 (8 bytes)
;   0xafeb..0xaff3  (8 bytes)
DATA_resto_AFEB:
	defb 001h,001h,000h,000h,000h,000h,000h,000h	; afeb  ........

; ======================================================================
; CODIGO 0xaff3..0xb119  (294 bytes)
; ======================================================================


L_AFF3:
	ld hl,0d710h		;aff3
	ld b,023h		;aff6
L_AFF8:
	cp (hl)			;aff8
	jr z,L_AFFF		;aff9
	inc hl			;affb
	djnz L_AFF8		;affc
	ret			;affe
L_AFFF:
	ld (hl),000h		;afff
	ret			;b001
L_B002:
	ld hl,08044h		;b002
	jp 064b7h		;b005
L_B008:
	ld hl,0804ah		;b008
	jp 064b7h		;b00b
L_B00E:
	ld ix,0d600h		;b00e
	ld b,00dh		;b012
	ld a,001h		;b014
	ld (0d708h),a		;b016
L_B019:
	push bc			;b019
	ld a,(ix+000h)		;b01a
	or a			;b01d
	call nz,L_B02E		;b01e
	ld de,00004h		;b021
	add ix,de		;b024
	ld hl,0d708h		;b026
	inc (hl)			;b029
	pop bc			;b02a
	djnz L_B019		;b02b
	ret			;b02d
L_B02E:
	ld de,01818h		;b02e
	ld hl,03807h		;b031
	call L_B0A7		;b034
	call L_B0BE		;b037
	call L_B099		;b03a
	ld hl,0d705h		;b03d
	inc (hl)			;b040
	ret			;b041
L_B042:
	ld ix,0d638h		;b042
	ld b,022h		;b046
	ld a,001h		;b048
	ld (0d708h),a		;b04a
L_B04D:
	push bc			;b04d
	ld a,(ix+000h)		;b04e
	or a			;b051
	call nz,L_B062		;b052
	ld de,00004h		;b055
	add ix,de		;b058
	ld hl,0d708h		;b05a
	inc (hl)			;b05d
	pop bc			;b05e
	djnz L_B04D		;b05f
	ret			;b061
L_B062:
	ld de,01818h		;b062
	ld hl,02007h		;b065
	call L_B0A7		;b068
	push de			;b06b
	call L_B0DC		;b06c
	call L_B099		;b06f
	ld hl,0d705h		;b072
	inc (hl)			;b075
	pop de			;b076
	ld hl,0ca84h		;b077
	ld a,(0d708h)		;b07a
	cp 00eh		;b07d
	jr z,L_B095		;b07f
	ld hl,0ca7eh		;b081
	cp 020h		;b084
	jr z,L_B095		;b086
	ld hl,0ca80h		;b088
	cp 021h		;b08b
	jr z,L_B095		;b08d
	ld hl,0ca82h		;b08f
	cp 022h		;b092
	ret nz			;b094
L_B095:
	ld (hl),e			;b095
	inc hl			;b096
	ld (hl),d			;b097
	ret			;b098
L_B099:
	ld a,(0d705h)		;b099
	ld hl,0d710h		;b09c
	call 0423eh		;b09f
	ld a,(0d708h)		;b0a2
	ld (hl),a			;b0a5
	ret			;b0a6
L_B0A7:
	ld a,(0d705h)		;b0a7
L_B0AA:
	sub l			;b0aa
	jr c,L_B0B4		;b0ab
	ld c,a			;b0ad
	ld a,d			;b0ae
	add a,h			;b0af
	ld d,a			;b0b0
	ld a,c			;b0b1
	jr L_B0AA		;b0b2
L_B0B4:
	add a,l			;b0b4
	rla			;b0b5
	rla			;b0b6
	rla			;b0b7
	rla			;b0b8
	and 0f0h		;b0b9
	add a,e			;b0bb
	ld e,a			;b0bc
	ret			;b0bd
L_B0BE:
	call 08813h		;b0be
	push hl			;b0c1
	ld a,(0d708h)		;b0c2
	dec a			;b0c5
	ld bc,01010h		;b0c6
	cp 002h		;b0c9
	jr nc,L_B0CF		;b0cb
	ld b,020h		;b0cd
L_B0CF:
	ld a,b			;b0cf
	cp 010h		;b0d0
	jr nz,L_B0D8		;b0d2
	ld a,d			;b0d4
	add a,008h		;b0d5
	ld d,a			;b0d7
L_B0D8:
	pop hl			;b0d8
	jp 0473bh		;b0d9
L_B0DC:
	ld a,(0d708h)		;b0dc
	cp 00eh		;b0df
	jr z,L_B0F4		;b0e1
	cp 00fh		;b0e3
	jr z,L_B10B		;b0e5
	cp 010h		;b0e7
	jr z,$+60		;b0e9
	call 0881bh		;b0eb
L_B0EE:
	ld bc,01010h		;b0ee
	jp 0473bh		;b0f1
L_B0F4:
	call L_B0F9		;b0f4
	jr L_B0EE		;b0f7
L_B0F9:
	ld hl,0b090h		;b0f9
	ld a,(0ca7bh)		;b0fc
	or a			;b0ff
	ret z			;b100
	dec a			;b101
	ret z			;b102
	dec a			;b103
	ld h,0c0h		;b104
	ret z			;b106
	dec a			;b107
	ld h,0d0h		;b108
	ret			;b10a
L_B10B:
	call L_B110		;b10b
	jr L_B0EE		;b10e
L_B110:
	ld a,(0ca90h)		;b110
	ld hl,0b119h		;b113
	jp 043f6h		;b116

; ----------------------------------------------------------------------
; DATOS resto_B119: lo apuntan con el banco puesto p10:B113 (0xB119); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p10:B113 (12 bytes)
;   0xb119..0xb125  (12 bytes)
DATA_resto_B119:
	defb 090h,0b0h,090h,0b0h,090h,0c0h,090h,0d0h,0a0h,0b0h,0a0h,0c0h	; b119  ............

; ======================================================================
; CODIGO 0xb125..0xb130  (11 bytes)
; ======================================================================


L_B125:
	ld a,(0ca89h)		;b125
	ld hl,0b130h		;b128
	call 043f6h		;b12b
	jr $-64		;b12e

; ----------------------------------------------------------------------
; DATOS resto_B130: lo apuntan con el banco puesto p10:B128 (0xB130); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p10:B128 (10 bytes)
;   0xb130..0xb13a  (10 bytes)
DATA_resto_B130:
	defb 0a0h,010h,090h,0f0h,090h,0e0h,090h,0f0h,0a0h,000h	; b130  ..........

; ======================================================================
; CODIGO 0xb13a..0xb492  (856 bytes)
; ======================================================================


L_B13A:
	call L_B16A		;b13a
	ld hl,0068eh		;b13d
	ld de,L_B42C		;b140
	jr L_B14B		;b143
L_B145:
	ld hl,0886ah		;b145
	ld de,03020h		;b148
L_B14B:
	ld c,007h		;b14b
	jp L_B8BE		;b14d
L_B150:
	ld a,(0d634h)		;b150
	or a			;b153
	ret z			;b154
	ld hl,0e080h		;b155
	ld de,09872h		;b158
	ld bc,01010h		;b15b
	jp 0473bh		;b15e
L_B161:
	ld hl,00000h		;b161
	ld bc,0c0c2h		;b164
	jp 046fah		;b167
L_B16A:
	ld hl,0068eh		;b16a
	ld bc,L_B42C		;b16d
	jr L_B178		;b170
L_B172:
	ld hl,00890h		;b172
	ld bc,0b028h		;b175
L_B178:
	ld a,099h		;b178
	jp 046f2h		;b17a
L_B17D:
	ld a,(0e1d8h)		;b17d
	and a			;b180
	ret z			;b181
	jp 085feh		;b182
L_B185:
	call 08ecdh		;b185
	call L_BA51		;b188
	call L_B191		;b18b
	jp 08ed2h		;b18e
L_B191:
	ld a,(0ca09h)		;b191
	and 01fh		;b194
	jp nz,L_B44D		;b196
	ld de,00106h		;b199
	call L_B2F4		;b19c
	ld a,(0d707h)		;b19f
	or a			;b1a2
	jr z,L_B1C2		;b1a3
	call L_B172		;b1a5
	call L_B33B		;b1a8
	call L_B359		;b1ab
	call L_B36F		;b1ae
	call L_B38F		;b1b1
	ld c,007h		;b1b4
	call L_B880		;b1b6
	ld (0d704h),a		;b1b9
	call L_B3F9		;b1bc
	jp L_B8C7		;b1bf
L_B1C2:
	call L_BB2B		;b1c2
	ld a,(0d704h)		;b1c5
	cp 007h		;b1c8
	ret nz			;b1ca
	ld a,(0ca07h)		;b1cb
	and 010h		;b1ce
	ret z			;b1d0
	ld a,(0d70ah)		;b1d1
	xor 001h		;b1d4
	ld (0d70ah),a		;b1d6
	call L_B8F8		;b1d9
	jp 05f49h		;b1dc
L_B1DF:
	call 08ecdh		;b1df
	ld a,(0d704h)		;b1e2
	cp 00dh		;b1e5
	jr z,L_B1F2		;b1e7
	ld a,(0d443h)		;b1e9
	or a			;b1ec
	jr z,L_B1F2		;b1ed
	call 08ee5h		;b1ef
L_B1F2:
	call L_BAB3		;b1f2
	call L_B204		;b1f5
	ld a,(0d706h)		;b1f8
	or a			;b1fb
	jr nz,L_B201		;b1fc
	call L_A28F		;b1fe
L_B201:
	jp 08ed2h		;b201
L_B204:
	ld a,(0ca09h)		;b204
	and 01fh		;b207
	jp nz,L_B57B		;b209
	ld de,00406h		;b20c
	call L_B2F4		;b20f
	ld a,(0d707h)		;b212
	or a			;b215
	jr z,L_B235		;b216
	call L_B172		;b218
	call L_B340		;b21b
	call L_B359		;b21e
	call L_B374		;b221
	call L_B3C1		;b224
	ld c,007h		;b227
	call L_B880		;b229
	ld (0d704h),a		;b22c
	call L_B401		;b22f
	jp L_B926		;b232
L_B235:
	call L_BB50		;b235
	ld a,(0ca07h)		;b238
	and 010h		;b23b
	ret z			;b23d
	ld a,(0d704h)		;b23e
	cp 00ch		;b241
	jp z,L_B2CB		;b243
	ld hl,0d6b4h		;b246
	ld a,(0d704h)		;b249
	cp 020h		;b24c
	jr z,L_B25D		;b24e
	ld hl,0d6b8h		;b250
	cp 021h		;b253
	jr z,L_B25D		;b255
	ld hl,0d6bch		;b257
	cp 022h		;b25a
	ret nz			;b25c
L_B25D:
	ld a,(0cab6h)		;b25d
	or a			;b260
	jr nz,L_B28E		;b261
	push hl			;b263
	ld hl,0ca52h		;b264
	ld a,(hl)			;b267
	inc hl			;b268
	ld l,(hl)			;b269
	cp l			;b26a
	pop hl			;b26b
	jr z,L_B28E		;b26c
	ld a,(hl)			;b26e
	or a			;b26f
	ret z			;b270
	push hl			;b271
	ld a,(0d704h)		;b272
	call 092d2h		;b275
	ld a,(0d704h)		;b278
	call 092dbh		;b27b
	pop hl			;b27e
	call c,L_B296		;b27f
	ld a,(0ca52h)		;b282
	ld (0ca53h),a		;b285
	call 0429ch		;b288
	jp 06c53h		;b28b
L_B28E:
	ld a,(0cb4bh)		;b28e
	or a			;b291
	ret nz			;b292
L_B293:
	jp 06c77h		;b293
L_B296:
	ld (hl),000h		;b296
	ld de,00e1ch		;b298
	ld bc,02010h		;b29b
	call L_B42C		;b29e
	ld a,e			;b2a1
	sub 004h		;b2a2
	ld l,a			;b2a4
	ld a,d			;b2a5
	add a,00ah		;b2a6
	ld h,a			;b2a8
	ld bc,01010h		;b2a9
	call 046fah		;b2ac
	ld a,(0d8a4h)		;b2af
	or a			;b2b2
	jr nz,L_B2BB		;b2b3
	ld hl,0d8a4h		;b2b5
	call L_B3E5		;b2b8
L_B2BB:
	ld a,(0d704h)		;b2bb
	call L_AFF3		;b2be
	xor a			;b2c1
	ld (0d704h),a		;b2c2
	call L_B172		;b2c5
	jp L_B8C4		;b2c8
L_B2CB:
	ld a,(0cb39h)		;b2cb
	or a			;b2ce
	jr z,L_B293		;b2cf
	ld a,(0d704h)		;b2d1
	call 092d2h		;b2d4
	ld a,(0d704h)		;b2d7
	call 092dbh		;b2da
	ld hl,0d664h		;b2dd
	call c,L_B296		;b2e0
	xor a			;b2e3
	ld (0cb39h),a		;b2e4
	ld hl,0d7d5h		;b2e7
	set 2,(hl)		;b2ea
	ld hl,0d7e0h		;b2ec
	res 6,(hl)		;b2ef
	jp 06a83h		;b2f1
L_B2F4:
	xor a			;b2f4
	ld (0d707h),a		;b2f5
	ld a,(0ca07h)		;b2f8
	and 00fh		;b2fb
	ret z			;b2fd
	rra			;b2fe
	jr c,L_B314		;b2ff
	rra			;b301
	jr c,L_B321		;b302
	rra			;b304
	jr c,L_B32E		;b305
	ld a,(0d703h)		;b307
	cp d			;b30a
	ret nc			;b30b
	ld a,004h		;b30c
	ld (0d707h),a		;b30e
	jp 05f49h		;b311
L_B314:
	ld a,(0d702h)		;b314
	or a			;b317
	ret z			;b318
	ld a,001h		;b319
	ld (0d707h),a		;b31b
	jp 05f49h		;b31e
L_B321:
	ld a,(0d702h)		;b321
	cp e			;b324
	ret nc			;b325
	ld a,002h		;b326
	ld (0d707h),a		;b328
	jp 05f49h		;b32b
L_B32E:
	ld a,(0d703h)		;b32e
	or a			;b331
	ret z			;b332
	ld a,003h		;b333
	ld (0d707h),a		;b335
	jp 05f49h		;b338
L_B33B:
	ld bc,03810h		;b33b
	jr L_B343		;b33e
L_B340:
	ld bc,02010h		;b340
L_B343:
	ld de,00e1ch		;b343
	call L_B42C		;b346
	ld hl,00000h		;b349
	ld a,(0ca42h)		;b34c
	ld b,a			;b34f
	rlca			;b350
	rlca			;b351
	or b			;b352
	ld bc,00808h		;b353
	jp 04767h		;b356
L_B359:
	ld hl,0d702h		;b359
	ld a,(0d707h)		;b35c
	dec a			;b35f
	jr z,L_B36D		;b360
	dec a			;b362
	jr z,L_B36B		;b363
	ld hl,0d703h		;b365
	dec a			;b368
	jr z,L_B36D		;b369
L_B36B:
	inc (hl)			;b36b
	ret			;b36c
L_B36D:
	dec (hl)			;b36d
	ret			;b36e
L_B36F:
	ld bc,03810h		;b36f
	jr L_B377		;b372
L_B374:
	ld bc,02010h		;b374
L_B377:
	ld de,00e1ch		;b377
	call L_B42C		;b37a
L_B37D:
	ld a,(0ca42h)		;b37d
	rlca			;b380
	rlca			;b381
	rlca			;b382
	rlca			;b383
	or 0c8h		;b384
	ld bc,00808h		;b386
	ld hl,05038h		;b389
	jp 047edh		;b38c
L_B38F:
	ld a,(0d8a4h)		;b38f
	or a			;b392
	ret nz			;b393
	ld hl,0d874h		;b394
	call L_B3E5		;b397
	ld de,00e1ch		;b39a
	ld bc,03810h		;b39d
	call L_B42C		;b3a0
	ld a,d			;b3a3
	add a,00ah		;b3a4
	ld h,a			;b3a6
	ld a,e			;b3a7
	sub 004h		;b3a8
	ld l,a			;b3aa
	ld de,0d074h		;b3ab
	ld bc,02010h		;b3ae
L_B3B1:
	push bc			;b3b1
	ld a,(0ca42h)		;b3b2
	rrca			;b3b5
	rrca			;b3b6
	ld b,a			;b3b7
	rrca			;b3b8
	rrca			;b3b9
	or b			;b3ba
	or 008h		;b3bb
	pop bc			;b3bd
	jp 047edh		;b3be
L_B3C1:
	ld a,(0d8a4h)		;b3c1
	or a			;b3c4
	ret nz			;b3c5
	ld hl,0d8a4h		;b3c6
	call L_B3E5		;b3c9
	ld de,00e1ch		;b3cc
	ld bc,02010h		;b3cf
	call L_B42C		;b3d2
	ld a,d			;b3d5
	add a,00ah		;b3d6
	ld h,a			;b3d8
	ld a,e			;b3d9
	sub 004h		;b3da
	ld l,a			;b3dc
	ld de,0d8a4h		;b3dd
	ld bc,01010h		;b3e0
	jr L_B3B1		;b3e3
L_B3E5:
	push hl			;b3e5
	ld bc,01810h		;b3e6
	call L_B3F4		;b3e9
	pop hl			;b3ec
	ld a,h			;b3ed
	sub 008h		;b3ee
	ld h,a			;b3f0
	ld bc,00810h		;b3f1
L_B3F4:
	ld a,099h		;b3f4
	jp 046f2h		;b3f6
L_B3F9:
	ld hl,0d600h		;b3f9
	ld de,0e088h		;b3fc
	jr L_B414		;b3ff
L_B401:
	ld de,0e0b8h		;b401
	ld a,(0d704h)		;b404
	cp 020h		;b407
	jp c,L_B9B4		;b409
	cp 023h		;b40c
	jp nc,L_B9B4		;b40e
	ld hl,0d638h		;b411
L_B414:
	ld a,(0d704h)		;b414
L_B417:
	dec a			;b417
	add a,a			;b418
	add a,a			;b419
	call 0423eh		;b41a
	inc hl			;b41d
	inc hl			;b41e
	push de			;b41f
	call L_B960		;b420
	pop de			;b423
	ld h,d			;b424
	ld l,e			;b425
	ld bc,02008h		;b426
	jp 0474dh		;b429
L_B42C:
	ld a,(0d702h)		;b42c
	ld l,a			;b42f
	ld a,(0d703h)		;b430
	ld h,a			;b433
	call L_B439		;b434
	jr L_B443		;b437
L_B439:
	ld a,h			;b439
	or a			;b43a
	ret z			;b43b
	ld a,d			;b43c
L_B43D:
	add a,b			;b43d
	dec h			;b43e
	jr nz,L_B43D		;b43f
	ld d,a			;b441
	ret			;b442
L_B443:
	ld a,l			;b443
	or a			;b444
	ret z			;b445
	ld a,e			;b446
L_B447:
	add a,c			;b447
	dec l			;b448
	jr nz,L_B447		;b449
	ld e,a			;b44b
	ret			;b44c
L_B44D:
	ld c,007h		;b44d
	call L_B880		;b44f
	ld (0d704h),a		;b452
	call L_B4B1		;b455
	jp c,06c77h		;b458
	call L_B501		;b45b
	jp c,06c77h		;b45e
	call L_B558		;b461
	jp c,06c77h		;b464
	ld de,0d70bh		;b467
	ld hl,0d702h		;b46a
	ldi		;b46d
	ldi		;b46f
	ld de,0cb20h		;b471
	call L_B87B		;b474
	call 0992ah		;b477
	call L_B5C8		;b47a
	ld a,(0d70ah)		;b47d
	ld (0cb24h),a		;b480
	call L_B48C		;b483
	ld a,(0cb20h)		;b486
	jp L_B897		;b489
L_B48C:
	ld a,(0cb20h)		;b48c
	call 0424dh		;b48f

; ----------------------------------------------------------------------
; DATOS tabla_B492: 15 destinos del despachador p00:424D (call en p10:B48F, el
;   indice en A): B4B0, B4B0, B4B0, 85C7, B4B0, 85DD, 85E5, 85D3, 85D8, B4B0,
;   85C7, 85F6, 8615, B4B0, B4B0; lo leen p10:B48F (30 bytes)
;   0xb492..0xb4b0  (30 bytes)
DATA_tabla_B492:
	defw 0b4b0h,0b4b0h,0b4b0h,085c7h,0b4b0h,085ddh,085e5h,085d3h	; b492
	defw 085d8h,0b4b0h,085c7h,085f6h,08615h,0b4b0h,0b4b0h	; b4a2

; ======================================================================
; CODIGO 0xb4b0..0xb919  (1129 bytes)
; ======================================================================


L_B4B0:
	ret			;b4b0
L_B4B1:
	ld a,(0cb4bh)		;b4b1
	or a			;b4b4
	jr nz,L_B517		;b4b5
	ld a,(0cb00h)		;b4b7
	cp 00bh		;b4ba
	jr z,L_B520		;b4bc
	ld a,(0ca9bh)		;b4be
	or a			;b4c1
	jr nz,L_B530		;b4c2
	ld a,(0d8a4h)		;b4c4
	or a			;b4c7
	jp nz,L_B54F		;b4c8
	ld a,(0d8c0h)		;b4cb
	or a			;b4ce
	jr nz,L_B520		;b4cf
	ld a,(0ca65h)		;b4d1
	or a			;b4d4
	jr nz,L_B527		;b4d5
	ld a,(0cb3fh)		;b4d7
	and a			;b4da
	jr nz,L_B53C		;b4db
	ld a,(0cb37h)		;b4dd
	and a			;b4e0
	jr nz,L_B53C		;b4e1
	ld a,(0ca76h)		;b4e3
	cp 039h		;b4e6
	jr z,L_B50E		;b4e8
	ld a,(0ca4ah)		;b4ea
	cp 013h		;b4ed
	jr nz,L_B4FF		;b4ef
	ld a,(0ca4bh)		;b4f1
	cp 005h		;b4f4
	jr nz,L_B4FF		;b4f6
	ld a,(0d821h)		;b4f8
	cp 00dh		;b4fb
	jr z,L_B517		;b4fd
L_B4FF:
	and a			;b4ff
	ret			;b500
L_B501:
	ld a,(0cb21h)		;b501
	cp 00ah		;b504
	jr z,L_B50E		;b506
	cp 00bh		;b508
	jr z,L_B50E		;b50a
	and a			;b50c
	ret			;b50d
L_B50E:
	ld a,(0d704h)		;b50e
	cp 005h		;b511
	jr nz,L_B4FF		;b513
	scf			;b515
	ret			;b516
L_B517:
	ld a,(0d704h)		;b517
	cp 009h		;b51a
	jr nz,L_B4FF		;b51c
	scf			;b51e
	ret			;b51f
L_B520:
	ld a,(0d704h)		;b520
	cp 00ah		;b523
	jr z,L_B54D		;b525
L_B527:
	ld a,(0d704h)		;b527
	cp 005h		;b52a
	jr z,L_B54D		;b52c
	and a			;b52e
	ret			;b52f
L_B530:
	ld a,(0d704h)		;b530
	cp 007h		;b533
	jr c,L_B54B		;b535
	cp 00ah		;b537
	jr nc,L_B54B		;b539
	ret			;b53b
L_B53C:
	ld a,(0d704h)		;b53c
	cp 003h		;b53f
	jr z,L_B54D		;b541
	cp 005h		;b543
	jr z,L_B54D		;b545
	cp 007h		;b547
	jr nc,L_B54D		;b549
L_B54B:
	and a			;b54b
	ret			;b54c
L_B54D:
	scf			;b54d
	ret			;b54e
L_B54F:
	ld a,(0d704h)		;b54f
	cp 004h		;b552
	jr c,L_B54B		;b554
	scf			;b556
	ret			;b557
L_B558:
	ld a,(0cb31h)		;b558
	or a			;b55b
	jr nz,L_B572		;b55c
	ld a,(0cb00h)		;b55e
	cp 002h		;b561
	jr z,L_B572		;b563
	cp 00bh		;b565
	jr z,L_B572		;b567
	ld a,(0cb01h)		;b569
	cp 004h		;b56c
	jr z,L_B572		;b56e
L_B570:
	and a			;b570
	ret			;b571
L_B572:
	ld a,(0d704h)		;b572
	cp 005h		;b575
	jr nz,L_B570		;b577
	scf			;b579
	ret			;b57a
L_B57B:
	ld c,007h		;b57b
	call L_B880		;b57d
	ld (0d704h),a		;b580
	call L_B5D1		;b583
	jp c,06c77h		;b586
	call L_B649		;b589
	jp c,06c77h		;b58c
	call L_B737		;b58f
	jp c,06c77h		;b592
	call L_B75B		;b595
	jp c,06c77h		;b598
	call L_B773		;b59b
	jp c,06c77h		;b59e
	ld de,0d70dh		;b5a1
	ld hl,0d702h		;b5a4
	ldi		;b5a7
	ldi		;b5a9
	ld de,0cb21h		;b5ab
	call L_B87B		;b5ae
	call L_B5C8		;b5b1
	call L_B872		;b5b4
	call L_B78D		;b5b7
	ld a,(0cb20h)		;b5ba
	cp 00ch		;b5bd
	call nz,085aah		;b5bf
	ld a,(0cb21h)		;b5c2
	jp L_B897		;b5c5
L_B5C8:
	ld a,(0cb00h)		;b5c8
	cp 00bh		;b5cb
	ret z			;b5cd
	jp 098bfh		;b5ce
L_B5D1:
	ld a,(0d704h)		;b5d1
	cp 009h		;b5d4
	jp z,L_B6AF		;b5d6
	cp 00dh		;b5d9
	jp z,L_B6BF		;b5db
	ld a,(0ca76h)		;b5de
	cp 039h		;b5e1
	jr nz,L_B5EF		;b5e3
	ld a,(0ca4bh)		;b5e5
	or a			;b5e8
	jp z,L_B6A4		;b5e9
	jp L_B68D		;b5ec
L_B5EF:
	ld a,(0cb4bh)		;b5ef
	or a			;b5f2
	jp nz,L_B682		;b5f3
	ld a,(0cb00h)		;b5f6
	cp 00bh		;b5f9
	jr z,L_B668		;b5fb
	ld a,(0ca64h)		;b5fd
	or a			;b600
	jr nz,L_B661		;b601
	ld a,(0d8c0h)		;b603
	or a			;b606
	jp nz,L_B6A4		;b607
	ld a,(0ca65h)		;b60a
	or a			;b60d
	jp nz,L_B6A4		;b60e
	ld a,(0ca9bh)		;b611
	or a			;b614
	jr nz,L_B675		;b615
	ld a,(0cb3fh)		;b617
	and a			;b61a
	jr nz,L_B66F		;b61b
	ld a,(0cb37h)		;b61d
	and a			;b620
	jr nz,L_B66F		;b621
	ld a,(0ca4ah)		;b623
	cp 012h		;b626
	jr z,L_B69E		;b628
	cp 007h		;b62a
	jr nz,L_B635		;b62c
	ld a,(0d7d1h)		;b62e
	bit 4,a		;b631
	jr z,L_B6A4		;b633
L_B635:
	cp 013h		;b635
	jr nz,L_B647		;b637
	ld a,(0ca4bh)		;b639
	cp 005h		;b63c
	jr nz,L_B647		;b63e
	ld a,(0d821h)		;b640
	cp 00dh		;b643
	jr z,L_B675		;b645
L_B647:
	and a			;b647
	ret			;b648
L_B649:
	ld a,(0cb20h)		;b649
	cp 005h		;b64c
	jr nz,L_B647		;b64e
	ld a,(0d704h)		;b650
	cp 002h		;b653
	jr z,L_B6AD		;b655
	cp 00ah		;b657
	jr z,L_B6AD		;b659
	cp 00bh		;b65b
	jr z,L_B6AD		;b65d
	and a			;b65f
	ret			;b660
L_B661:
	ld a,(0d704h)		;b661
	cp 00dh		;b664
	jr z,L_B6AD		;b666
L_B668:
	ld a,(0d704h)		;b668
	cp 002h		;b66b
	jr z,L_B6AD		;b66d
L_B66F:
	ld a,(0d704h)		;b66f
	dec a			;b672
	jr z,L_B6AD		;b673
L_B675:
	ld a,(0d704h)		;b675
	cp 00ah		;b678
	jr z,L_B6AD		;b67a
	cp 00bh		;b67c
	jr z,L_B6AD		;b67e
	and a			;b680
	ret			;b681
L_B682:
	ld a,(0d704h)		;b682
	cp 001h		;b685
	jr z,L_B6AD		;b687
	cp 00ch		;b689
	jr z,L_B6AD		;b68b
L_B68D:
	ld a,(0d704h)		;b68d
	cp 002h		;b690
	jr z,L_B6AD		;b692
	cp 00ah		;b694
	jr z,L_B6AD		;b696
	cp 00bh		;b698
	jr z,L_B6AD		;b69a
	and a			;b69c
	ret			;b69d
L_B69E:
	ld a,(0d704h)		;b69e
	dec a			;b6a1
	jr z,L_B6AD		;b6a2
L_B6A4:
	ld a,(0d704h)		;b6a4
	cp 002h		;b6a7
	jr z,L_B6AD		;b6a9
	and a			;b6ab
	ret			;b6ac
L_B6AD:
	scf			;b6ad
	ret			;b6ae
L_B6AF:
	ld a,(0ca4ah)		;b6af
	cp 00dh		;b6b2
	jr nz,L_B6AD		;b6b4
	ld a,(0ca4bh)		;b6b6
	cp 005h		;b6b9
	jr nz,L_B6AD		;b6bb
L_B6BD:
	and a			;b6bd
	ret			;b6be
L_B6BF:
	ld a,(0ca64h)		;b6bf
	or a			;b6c2
	jr nz,L_B6AD		;b6c3
	call L_B6DF		;b6c5
	ret c			;b6c8
	ld a,(0caf5h)		;b6c9
	cp 00ah		;b6cc
	jr nc,L_B6AD		;b6ce
	inc a			;b6d0
	ld (0caf5h),a		;b6d1
	xor a			;b6d4
	ld (0caf2h),a		;b6d5
	ld a,001h		;b6d8
	ld (0caf1h),a		;b6da
	and a			;b6dd
	ret			;b6de
L_B6DF:
	ld a,(0caf1h)		;b6df
	or a			;b6e2
	jr nz,L_B6AD		;b6e3
	ld a,(0d8a0h)		;b6e5
	or a			;b6e8
	jr nz,L_B6AD		;b6e9
	ld a,(0ca76h)		;b6eb
	cp 029h		;b6ee
	jr z,L_B6AD		;b6f0
	cp 002h		;b6f2
	jr z,L_B6AD		;b6f4
	ld a,(0ca4ah)		;b6f6
	cp 012h		;b6f9
	jr z,L_B6AD		;b6fb
	cp 013h		;b6fd
	jr z,L_B6AD		;b6ff
	cp 00eh		;b701
	jr z,L_B6AD		;b703
	cp 003h		;b705
	jr z,L_B713		;b707
	cp 007h		;b709
	jr z,L_B71C		;b70b
	cp 00ah		;b70d
	jr z,L_B726		;b70f
	and a			;b711
	ret			;b712
L_B713:
	ld a,(0ca4bh)		;b713
	cp 006h		;b716
	jr z,L_B6AD		;b718
	and a			;b71a
	ret			;b71b
L_B71C:
	ld a,(0ca4bh)		;b71c
	cp 010h		;b71f
	jr c,L_B6BD		;b721
	cp 014h		;b723
	ret			;b725
L_B726:
	ld a,(0ca4bh)		;b726
	cp 00bh		;b729
	jr c,L_B6BD		;b72b
	cp 00dh		;b72d
	ret c			;b72f
	cp 010h		;b730
	jr c,L_B6BD		;b732
	cp 012h		;b734
	ret			;b736
L_B737:
	call L_B6A4		;b737
	ret nc			;b73a
	call 04224h		;b73b
	call 096bah		;b73e
	call 041cah		;b741
	ret c			;b744
	ld b,004h		;b745
	ld a,(0ca4ah)		;b747
	cp 00eh		;b74a
	jr z,L_B756		;b74c
	ld b,001h		;b74e
	cp 00fh		;b750
	jr z,L_B756		;b752
	and a			;b754
	ret			;b755
L_B756:
	ld a,(0ca4bh)		;b756
	cp b			;b759
	ret			;b75a
L_B75B:
	ld a,(0d704h)		;b75b
	cp 002h		;b75e
	jr nz,L_B771		;b760
	ld a,(0ca76h)		;b762
	cp 018h		;b765
	jr nz,L_B771		;b767
	ld a,(0ca4bh)		;b769
	or a			;b76c
	jr z,L_B771		;b76d
L_B76F:
	scf			;b76f
	ret			;b770
L_B771:
	and a			;b771
	ret			;b772
L_B773:
	ld a,(0d7d5h)		;b773
	bit 4,a		;b776
	jr z,L_B771		;b778
	ld a,(0d7dah)		;b77a
	rra			;b77d
	ccf			;b77e
	ret nc			;b77f
	ld a,(0d704h)		;b780
	cp 002h		;b783
	jr z,L_B76F		;b785
	cp 00dh		;b787
	jr z,L_B76F		;b789
	and a			;b78b
	ret			;b78c
L_B78D:
	ld a,(0cb21h)		;b78d
	cp 004h		;b790
	jp z,L_B839		;b792
	cp 007h		;b795
	jr z,L_B7F3		;b797
	ld hl,0cac4h		;b799
	call L_B7C8		;b79c
	ld a,(0dff0h)		;b79f
	or a			;b7a2
	jr nz,L_B7B0		;b7a3
	call L_B7DD		;b7a5
	ld a,(0ca4ah)		;b7a8
	cp 006h		;b7ab
	call z,0431eh		;b7ad
L_B7B0:
	ld hl,0ca54h		;b7b0
	call L_B7C8		;b7b3
	ld a,(0cb3fh)		;b7b6
	cp 002h		;b7b9
	ret nc			;b7bb
	call L_B7DD		;b7bc
	ld a,(0ca4ah)		;b7bf
	cp 006h		;b7c2
	jp nz,04331h		;b7c4
	ret			;b7c7
L_B7C8:
	ld a,(hl)			;b7c8
	cp 020h		;b7c9
	ret z			;b7cb
	ld (hl),020h		;b7cc
	inc hl			;b7ce
	ld a,(hl)			;b7cf
	cp 002h		;b7d0
	ret c			;b7d2
	rra			;b7d3
	and 07eh		;b7d4
	or a			;b7d6
	jr nz,L_B7DB		;b7d7
	ld a,002h		;b7d9
L_B7DB:
	ld (hl),a			;b7db
	ret			;b7dc
L_B7DD:
	call 04309h		;b7dd
	call L_B7E8		;b7e0
	ld a,020h		;b7e3
	jp 042b0h		;b7e5
L_B7E8:
	ld a,(0ca4ah)		;b7e8
	cp 006h		;b7eb
	jp nz,07053h		;b7ed
	jp 07042h		;b7f0
L_B7F3:
	ld a,(0cb3fh)		;b7f3
	cp 002h		;b7f6
	jr c,L_B80C		;b7f8
	ld hl,0cac4h		;b7fa
	call L_B82C		;b7fd
	call 04309h		;b800
	call 07042h		;b803
	call 042a8h		;b806
	jp 0431eh		;b809
L_B80C:
	ld a,040h		;b80c
	ld hl,0cac4h		;b80e
	ld (hl),a			;b811
	inc hl			;b812
	ld (hl),a			;b813
	ld hl,0ca54h		;b814
	ld a,(0dff0h)		;b817
	or a			;b81a
	jr nz,L_B823		;b81b
	ld a,020h		;b81d
	ld (hl),a			;b81f
	inc hl			;b820
	ld (hl),a			;b821
	ret			;b822
L_B823:
	call L_B7C8		;b823
	call L_B7DD		;b826
	jp 04331h		;b829
L_B82C:
	ld a,(hl)			;b82c
	cp 040h		;b82d
	ret z			;b82f
	ld (hl),040h		;b830
	inc hl			;b832
	ld a,(hl)			;b833
	rla			;b834
	and 0feh		;b835
	ld (hl),a			;b837
	ret			;b838
L_B839:
	ld a,(0dff0h)		;b839
	or a			;b83c
	jr z,L_B851		;b83d
	ld hl,0ca54h		;b83f
	call L_B82C		;b842
	call 04309h		;b845
	call 07053h		;b848
	call 042adh		;b84b
	jp 04331h		;b84e
L_B851:
	ld a,040h		;b851
	ld hl,0ca54h		;b853
	ld (hl),a			;b856
	inc hl			;b857
	ld (hl),a			;b858
	ld hl,0cac4h		;b859
	ld a,(0cb3fh)		;b85c
	cp 002h		;b85f
	jr nc,L_B869		;b861
	ld a,020h		;b863
	ld (hl),a			;b865
	inc hl			;b866
	ld (hl),a			;b867
	ret			;b868
L_B869:
	call L_B7C8		;b869
	call L_B7DD		;b86c
	jp 0431eh		;b86f
L_B872:
	ld a,(0cb21h)		;b872
	cp 001h		;b875
	jp z,08593h		;b877
	ret			;b87a
L_B87B:
	ld a,(0d704h)		;b87b
	ld (de),a			;b87e
	ret			;b87f
L_B880:
	ld a,(0d703h)		;b880
	or a			;b883
	jr z,L_B88B		;b884
	ld b,a			;b886
	xor a			;b887
L_B888:
	add a,c			;b888
	djnz L_B888		;b889
L_B88B:
	ld hl,0d702h		;b88b
	add a,(hl)			;b88e
	ld hl,0d710h		;b88f
	call 0423eh		;b892
	ld a,(hl)			;b895
	ret			;b896
L_B897:
	or a			;b897
	call nz,06a83h		;b898
	call 092f3h		;b89b
	call L_B957		;b89e
	xor a			;b8a1
	ld (0d700h),a		;b8a2
	ld (0d701h),a		;b8a5
	ld (0cb16h),a		;b8a8
	inc a			;b8ab
	ld (0d706h),a		;b8ac
	ld (0ca69h),a		;b8af
	ld (0e236h),a		;b8b2
	ld a,(0cb21h)		;b8b5
	cp 002h		;b8b8
	jp z,08ec0h		;b8ba
	ret			;b8bd
L_B8BE:
	ld a,(0ca42h)		;b8be
	jp 046bch		;b8c1
L_B8C4:
	xor a			;b8c4
	jr L_B8CF		;b8c5
L_B8C7:
	call L_B8CC		;b8c7
	jr L_B8D5		;b8ca
L_B8CC:
	ld a,(0d704h)		;b8cc
L_B8CF:
	ld hl,08046h		;b8cf
	jp 064c3h		;b8d2
L_B8D5:
	ld a,(0d704h)		;b8d5
	cp 007h		;b8d8
	ret nz			;b8da
	ld hl,07094h		;b8db
	ld de,04420h		;b8de
	ld c,007h		;b8e1
	call L_B8BE		;b8e3
	ld hl,0b919h		;b8e6
	ld de,0809ah		;b8e9
	call 04950h		;b8ec
	ld hl,0b920h		;b8ef
	ld de,080a6h		;b8f2
	call 04950h		;b8f5
L_B8F8:
	ld a,(0ca42h)		;b8f8
	ld b,a			;b8fb
	rlca			;b8fc
	rlca			;b8fd
	or b			;b8fe
	ld hl,0629ah		;b8ff
	ld de,0749ah		;b902
	ld bc,00818h		;b905
	call 04767h		;b908
	ld a,(0d70ah)		;b90b
	ld de,0749ah		;b90e
	or a			;b911
	jr z,L_B916		;b912
	ld e,0a6h		;b914
L_B916:
	jp L_B37D		;b916

; ----------------------------------------------------------------------
; DATOS resto_B919: lo apuntan con el banco puesto p10:B8E6 (0xB919), p10:B8EF
;   (0xB920); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p10:B8E6, p10:B8EF (13 bytes)
;   0xb919..0xb926  (13 bytes)
DATA_resto_B919:
	defb 01dh,021h,013h,01eh,00dh,012h,0ffh,01eh,013h,017h,00fh,01ch,0ffh	; b919  .!...........

; ======================================================================
; CODIGO 0xb926..0xbcfd  (983 bytes)
; ======================================================================


L_B926:
	call L_B92B		;b926
	jr L_B934		;b929
L_B92B:
	ld a,(0d704h)		;b92b
	ld hl,08048h		;b92e
	jp 064c3h		;b931
L_B934:
	ld a,(0d704h)		;b934
	sub 014h		;b937
	ret c			;b939
	cp 009h		;b93a
	ret nc			;b93c
	ld hl,01000h		;b93d
	rlca			;b940
	rlca			;b941
	rlca			;b942
	add a,h			;b943
	ld h,a			;b944
	ld a,(0ca42h)		;b945
	rlca			;b948
	rlca			;b949
	rlca			;b94a
	rlca			;b94b
	or 0c8h		;b94c
	ld bc,00808h		;b94e
	ld de,03c94h		;b951
	jp 047edh		;b954
L_B957:
	ld hl,0cb80h		;b957
	ld bc,0005fh		;b95a
	jp 04236h		;b95d
L_B960:
	push hl			;b960
	push de			;b961
	dec hl			;b962
	dec hl			;b963
	ld de,0d62ch		;b964
	and a			;b967
	sbc hl,de		;b968
	pop de			;b96a
	pop hl			;b96b
	jr z,L_B9B4		;b96c
	ld a,(0d8a4h)		;b96e
	or a			;b971
	jr nz,L_B9B4		;b972
	ld a,(hl)			;b974
	or a			;b975
	jr nz,L_B97E		;b976
	dec hl			;b978
	ld a,(hl)			;b979
	or a			;b97a
	jr z,L_B9B4		;b97b
	inc hl			;b97d
L_B97E:
	ld a,(hl)			;b97e
	or a			;b97f
	jr nz,L_B9A5		;b980
	push hl			;b982
	push de			;b983
	call L_B9B4		;b984
	pop de			;b987
	pop hl			;b988
	ld a,d			;b989
	add a,008h		;b98a
	ld d,a			;b98c
	dec hl			;b98d
	ld a,(hl)			;b98e
	rra			;b98f
	rra			;b990
	rra			;b991
	rra			;b992
	and 00fh		;b993
	or a			;b995
	jr nz,L_B99F		;b996
	ld a,d			;b998
	add a,008h		;b999
	ld d,a			;b99b
	ld a,(hl)			;b99c
	jr L_B9BB		;b99d
L_B99F:
	call L_B9BB		;b99f
	ld a,(hl)			;b9a2
	jr L_B9BB		;b9a3
L_B9A5:
	call L_B9BB		;b9a5
	dec hl			;b9a8
	ld a,(hl)			;b9a9
	rra			;b9aa
	rra			;b9ab
	rra			;b9ac
	rra			;b9ad
	call L_B9BB		;b9ae
	ld a,(hl)			;b9b1
	jr L_B9BB		;b9b2
L_B9B4:
	ex de,hl			;b9b4
	ld bc,01810h		;b9b5
	jp 046fah		;b9b8
L_B9BB:
	and 00fh		;b9bb
	push hl			;b9bd
	call L_B9C7		;b9be
	pop hl			;b9c1
	ld a,d			;b9c2
	add a,008h		;b9c3
	ld d,a			;b9c5
	ret			;b9c6
L_B9C7:
	push de			;b9c7
	call 071f4h		;b9c8
	call L_B9D0		;b9cb
	pop de			;b9ce
	ret			;b9cf
L_B9D0:
	push hl			;b9d0
	ld h,l			;b9d1
	call L_B9DA		;b9d2
	pop hl			;b9d5
	ld a,e			;b9d6
	add a,008h		;b9d7
	ld e,a			;b9d9
L_B9DA:
	push de			;b9da
	ld l,068h		;b9db
	ld bc,00808h		;b9dd
	call 0473bh		;b9e0
	pop de			;b9e3
	ret			;b9e4
L_B9E5:
	ld a,(0cb20h)		;b9e5
	or a			;b9e8
	jr z,L_BA09		;b9e9
	dec a			;b9eb
	ld hl,0a6afh		;b9ec
	call 0649ch		;b9ef
	call L_BA32		;b9f2
	ld a,(0cb20h)		;b9f5
	ld hl,0d600h		;b9f8
	ld de,0e088h		;b9fb
	call L_B417		;b9fe
	jr L_BA09		;ba01
L_BA03:
	ld hl,0d8a4h		;ba03
	call L_B3E5		;ba06
L_BA09:
	ld a,(0cb21h)		;ba09
	or a			;ba0c
	ret z			;ba0d
	dec a			;ba0e
	ld hl,0a6cbh		;ba0f
	call 0649ch		;ba12
	call L_BA2A		;ba15
	ld a,(0cb21h)		;ba18
	ld de,0e0b8h		;ba1b
	cp 020h		;ba1e
	ret c			;ba20
	cp 023h		;ba21
	ret nc			;ba23
	ld hl,0d638h		;ba24
	jp L_B417		;ba27
L_BA2A:
	ld de,0d8a4h		;ba2a
	ld bc,01010h		;ba2d
	jr L_BA43		;ba30
L_BA32:
	ld de,0d074h		;ba32
	ld bc,02010h		;ba35
	ld a,(0cb20h)		;ba38
	cp 003h		;ba3b
	jr c,L_BA43		;ba3d
	ld b,010h		;ba3f
	ld d,0d8h		;ba41
L_BA43:
	ld a,(0ca42h)		;ba43
	rrca			;ba46
	rrca			;ba47
	rrca			;ba48
	rrca			;ba49
	and 030h		;ba4a
	or 0c8h		;ba4c
	jp 047edh		;ba4e
L_BA51:
	ld hl,0cb4bh		;ba51
	ld a,(hl)			;ba54
	or a			;ba55
	ret z			;ba56
	call L_BAA8		;ba57
	call 04266h		;ba5a
	ld b,002h		;ba5d
	ld de,02410h		;ba5f
	ld hl,0d710h		;ba62
L_BA65:
	push bc			;ba65
	push de			;ba66
	push hl			;ba67
	ld a,(hl)			;ba68
	or a			;ba69
	call nz,L_BA78		;ba6a
	pop hl			;ba6d
	pop de			;ba6e
	pop bc			;ba6f
	inc hl			;ba70
	ld a,e			;ba71
	add a,010h		;ba72
	ld e,a			;ba74
	djnz L_BA65		;ba75
	ret			;ba77
L_BA78:
	cp 009h		;ba78
	ret nz			;ba7a
	ld hl,0dc00h		;ba7b
	call L_BA86		;ba7e
	ld hl,0da00h		;ba81
	jr L_BA96		;ba84
L_BA86:
	ld a,(0cb4dh)		;ba86
	or a			;ba89
	ld c,0f0h		;ba8a
	jr z,L_BA90		;ba8c
	ld c,0f8h		;ba8e
L_BA90:
	call 05d41h		;ba90
	jp 05d3dh		;ba93
L_BA96:
	ld a,00ah		;ba96
	ld bc,0000fh		;ba98
	call 04237h		;ba9b
	inc hl			;ba9e
	inc de			;ba9f
	ld a,00bh		;baa0
	ld bc,0000fh		;baa2
	jp 04237h		;baa5
L_BAA8:
	inc l			;baa8
	dec (hl)			;baa9
	ret nz			;baaa
	ld (hl),004h		;baab
	inc l			;baad
	ld a,(hl)			;baae
	xor 001h		;baaf
	ld (hl),a			;bab1
	ret			;bab2
L_BAB3:
	ld hl,0cb4bh		;bab3
	ld a,(hl)			;bab6
	or a			;bab7
	ret z			;bab8
	call L_BAA8		;bab9
	call 04266h		;babc
	exx			;babf
	ld hl,0dc00h		;bac0
	ld de,0da00h		;bac3
	exx			;bac6
	ld b,000h		;bac7
	ld de,01c10h		;bac9
	ld hl,0d710h		;bacc
L_BACF:
	ld a,(hl)			;bacf
	or a			;bad0
	push bc			;bad1
	push de			;bad2
	push hl			;bad3
	call nz,L_BB00		;bad4
	pop hl			;bad7
	pop de			;bad8
	pop bc			;bad9
	inc hl			;bada
	inc b			;badb
	call L_BAE5		;badc
	ld a,b			;badf
	cp 023h		;bae0
	jr c,L_BACF		;bae2
	ret			;bae4
L_BAE5:
	ld a,e			;bae5
	add a,010h		;bae6
	ld e,a			;bae8
	ld a,b			;bae9
	cp 007h		;baea
	jr z,L_BAF9		;baec
	cp 00eh		;baee
	jr z,L_BAF9		;baf0
	cp 015h		;baf2
	jr z,L_BAF9		;baf4
	cp 01ch		;baf6
	ret nz			;baf8
L_BAF9:
	ld a,d			;baf9
	add a,020h		;bafa
	ld d,a			;bafc
	ld e,010h		;bafd
	ret			;baff
L_BB00:
	cp 002h		;bb00
	ret z			;bb02
	cp 003h		;bb03
	ret z			;bb05
	cp 005h		;bb06
	ret z			;bb08
	cp 008h		;bb09
	ret z			;bb0b
	cp 00bh		;bb0c
	ret z			;bb0e
	cp 010h		;bb0f
	ret z			;bb11
	cp 020h		;bb12
	ret nc			;bb14
	exx			;bb15
	push hl			;bb16
	exx			;bb17
	pop hl			;bb18
	call L_BA86		;bb19
	push hl			;bb1c
	exx			;bb1d
	pop hl			;bb1e
	push de			;bb1f
	exx			;bb20
	pop hl			;bb21
	call L_BA96		;bb22
	inc hl			;bb25
	push hl			;bb26
	exx			;bb27
	pop de			;bb28
	exx			;bb29
	ret			;bb2a
L_BB2B:
	ld a,(0cb4bh)		;bb2b
	or a			;bb2e
	ret z			;bb2f
	ld a,(0ca07h)		;bb30
	and 010h		;bb33
	ret z			;bb35
	ld a,(0d704h)		;bb36
	cp 009h		;bb39
	jr z,L_BB48		;bb3b
	cp 00bh		;bb3d
	ret nz			;bb3f
	call 06a83h		;bb40
	ld hl,0d629h		;bb43
	jr L_BB7D		;bb46
L_BB48:
	call 06a83h		;bb48
	ld hl,0d621h		;bb4b
	jr L_BB7D		;bb4e
L_BB50:
	ld a,(0cb4bh)		;bb50
	or a			;bb53
	ret z			;bb54
	ld a,(0ca07h)		;bb55
	and 010h		;bb58
	ret z			;bb5a
	ld a,(0d704h)		;bb5b
	dec a			;bb5e
	ld hl,0d638h		;bb5f
	add a,a			;bb62
	add a,a			;bb63
	call 0423eh		;bb64
	ld a,(0d704h)		;bb67
	cp 020h		;bb6a
	jr c,L_BB96		;bb6c
	cp 023h		;bb6e
	jr nc,L_BB96		;bb70
	ld a,(0ca53h)		;bb72
	ld b,a			;bb75
	ld a,(0ca52h)		;bb76
	cp b			;bb79
	ret nz			;bb7a
	jr L_BB96		;bb7b
L_BB7D:
	push hl			;bb7d
	ld a,(0d704h)		;bb7e
	call 092e3h		;bb81
	ld a,(0d704h)		;bb84
	call 092ebh		;bb87
	pop hl			;bb8a
	ret nc			;bb8b
	ld (hl),000h		;bb8c
	ld hl,0d874h		;bb8e
	ld bc,03810h		;bb91
	jr L_BBB4		;bb94
L_BB96:
	push hl			;bb96
	ld a,(0d704h)		;bb97
	or a			;bb9a
	call nz,06a83h		;bb9b
	ld a,(0d704h)		;bb9e
	call 092d2h		;bba1
	ld a,(0d704h)		;bba4
	call 092dbh		;bba7
	pop hl			;bbaa
	ret nc			;bbab
	ld (hl),000h		;bbac
	ld hl,0d8a4h		;bbae
	ld bc,02010h		;bbb1
L_BBB4:
	ld de,00e1ch		;bbb4
	push hl			;bbb7
	call L_B42C		;bbb8
	ld a,e			;bbbb
	sub 004h		;bbbc
	ld l,a			;bbbe
	ld a,d			;bbbf
	add a,00ah		;bbc0
	ld h,a			;bbc2
	ld bc,02010h		;bbc3
	call 046fah		;bbc6
	pop hl			;bbc9
	call L_B3E5		;bbca
	ld a,(0d704h)		;bbcd
	call L_AFF3		;bbd0
	xor a			;bbd3
	ld (0d704h),a		;bbd4
	call L_B172		;bbd7
	jp L_B8C4		;bbda
L_BBDD:
	ld a,(0cb4bh)		;bbdd
	or a			;bbe0
	ret z			;bbe1
	ld hl,0d600h		;bbe2
	ld de,00004h		;bbe5
	ld b,031h		;bbe8
L_BBEA:
	ld a,(hl)			;bbea
	or a			;bbeb
	ret nz			;bbec
	add hl,de			;bbed
	djnz L_BBEA		;bbee
	ld hl,0d7d9h		;bbf0
	set 2,(hl)		;bbf3
	ld hl,0d7d5h		;bbf5
	res 0,(hl)		;bbf8
	xor a			;bbfa
	ld (0cb4bh),a		;bbfb
	ld (0e1e8h),a		;bbfe
	ld (0d7bbh),a		;bc01
	ld hl,0d88ch		;bc04
	ld (hl),0ffh		;bc07
	call 04266h		;bc09
	jp 08eddh		;bc0c
L_BC0F:
	ld a,(0ca4ah)		;bc0f
	cp 00ah		;bc12
	ret nz			;bc14
	ld hl,0e1c0h		;bc15
	ld (hl),001h		;bc18
	inc hl			;bc1a
	ld (hl),001h		;bc1b
	ret			;bc1d
L_BC1E:
	call L_BC4D		;bc1e
	ret nz			;bc21
	ld a,(0e1c0h)		;bc22
	and a			;bc25
	ret z			;bc26
L_BC27:
	ld hl,0de70h		;bc27
	ld de,0e1c8h		;bc2a
	ld bc,00008h		;bc2d
	push hl			;bc30
	ldir		;bc31
	pop hl			;bc33
	ld a,080h		;bc34
	ld bc,00007h		;bc36
	call 04237h		;bc39
	ld hl,04068h		;bc3c
	ld de,00000h		;bc3f
	ld bc,04018h		;bc42
	call 0474dh		;bc45
	ld c,00eh		;bc48
	jp L_BC8A		;bc4a
L_BC4D:
	ld a,(0ca4ah)		;bc4d
	cp 00ah		;bc50
	ret nz			;bc52
	ld a,(0ca4bh)		;bc53
	cp 00eh		;bc56
	ret			;bc58
L_BC59:
	call L_BC4D		;bc59
	ret nz			;bc5c
	ld hl,0e1c0h		;bc5d
	ld a,(hl)			;bc60
	cp 001h		;bc61
	ret c			;bc63
	jr z,L_BC7F		;bc64
	ld (hl),000h		;bc66
	ld de,0de70h		;bc68
	ld hl,0e1c8h		;bc6b
	ld bc,00008h		;bc6e
	ldir		;bc71
	ld de,04068h		;bc73
	ld hl,00000h		;bc76
	ld bc,04018h		;bc79
	jp 0475ah		;bc7c
L_BC7F:
	inc hl			;bc7f
	ld a,(hl)			;bc80
	ld c,a			;bc81
	inc a			;bc82
	cp 00fh		;bc83
	jr c,L_BC89		;bc85
	ld a,001h		;bc87
L_BC89:
	ld (hl),a			;bc89
L_BC8A:
	ld l,06ch		;bc8a
	call L_BC96		;bc8c
	ld l,074h		;bc8f
	call L_BC96		;bc91
	ld l,07ch		;bc94
L_BC96:
	ld h,040h		;bc96
	ld b,h			;bc98
	ld a,(0ca42h)		;bc99
	push bc			;bc9c
	call 0467ch		;bc9d
	pop bc			;bca0
	ret			;bca1
L_BCA2:
	ld hl,0e100h		;bca2
	ld bc,000bfh		;bca5
	call 04236h		;bca8
	ld c,000h		;bcab
	ld a,(0ca4ah)		;bcad
	cp 005h		;bcb0
	jr z,L_BCCE		;bcb2
	inc c			;bcb4
	cp 00dh		;bcb5
	jr z,L_BCCE		;bcb7
	inc c			;bcb9
	cp 00eh		;bcba
	jr z,L_BCC9		;bcbc
	inc c			;bcbe
	cp 011h		;bcbf
	jr z,L_BCCE		;bcc1
	inc c			;bcc3
	cp 010h		;bcc4
	jr z,L_BCCE		;bcc6
	ret			;bcc8
L_BCC9:
	ld a,(0d885h)		;bcc9
	inc a			;bccc
	ret z			;bccd
L_BCCE:
	ld a,c			;bcce
	ld hl,0bcfdh		;bccf
	call 043f6h		;bcd2
	ld de,0e100h		;bcd5
L_BCD8:
	ld a,(hl)			;bcd8
	inc a			;bcd9
	ret z			;bcda
	ld bc,0000ah		;bcdb
	ldir		;bcde
	inc de			;bce0
	inc de			;bce1
	jr L_BCD8		;bce2
L_BCE4:
	ld a,(0ca4ah)		;bce4
	cp 00ah		;bce7
	ret nz			;bce9
	ld hl,0e100h		;bcea
	ld bc,000bfh		;bced
	call 04236h		;bcf0
	ld a,(0ca76h)		;bcf3
	cp 031h		;bcf6
	ret nz			;bcf8
	ld c,005h		;bcf9
	jr L_BCCE		;bcfb

; ----------------------------------------------------------------------
; DATOS resto_BCFD: lo apuntan con el banco puesto p10:BCCF (0xBCFD); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p10:BCCF (368 bytes)
;   0xbcfd..0xbe6d  (368 bytes)
DATA_resto_BCFD:
	defb 009h,0bdh,050h,0bdh,083h,0bdh,010h,0beh,039h,0beh,04eh,0beh,001h,098h,090h,002h	; bcfd  ..P.....9.N.....
	defb 006h,020h,004h,004h,000h,000h,001h,018h,050h,003h,006h,028h,004h,004h,000h,000h	; bd0d  . ......P..(....
	defb 001h,058h,090h,003h,006h,028h,004h,004h,000h,002h,001h,018h,050h,004h,006h,028h	; bd1d  .X...(......P..(
	defb 004h,004h,000h,000h,002h,070h,0a8h,004h,006h,018h,004h,004h,000h,002h,002h,080h	; bd2d  .....p..........
	defb 0a8h,004h,006h,018h,004h,004h,002h,002h,002h,090h,0a8h,004h,006h,018h,004h,004h	; bd3d  ................
	defb 004h,002h,0ffh,001h,038h,060h,003h,007h,028h,004h,004h,000h,002h,001h,018h,050h	; bd4d  ....8`..(......P
	defb 004h,006h,028h,004h,004h,000h,002h,001h,098h,058h,004h,006h,020h,004h,004h,000h	; bd5d  ..(......X.. ...
	defb 008h,001h,098h,058h,004h,007h,020h,004h,004h,000h,004h,001h,038h,030h,004h,008h	; bd6d  ...X.. .....80..
	defb 028h,004h,004h,000h,002h,0ffh,001h,038h,018h,003h,007h,028h,004h,004h,000h,000h	; bd7d  (......8...(....
	defb 001h,038h,070h,003h,007h,028h,004h,004h,000h,002h,001h,038h,0b0h,003h,007h,028h	; bd8d  .8p..(.....8...(
	defb 004h,004h,000h,004h,001h,098h,018h,003h,007h,020h,004h,004h,000h,006h,001h,098h	; bd9d  ......... ......
	defb 060h,003h,007h,020h,004h,004h,000h,008h,001h,098h,0b0h,003h,007h,020h,004h,004h	; bdad  `.. ......... ..
	defb 000h,00ah,002h,080h,024h,003h,007h,018h,004h,004h,002h,010h,002h,080h,084h,003h	; bdbd  ....$...........
	defb 007h,018h,004h,004h,004h,010h,001h,038h,040h,003h,006h,028h,004h,004h,000h,000h	; bdcd  .......8@..(....
	defb 001h,038h,0b0h,003h,006h,028h,004h,004h,000h,002h,001h,098h,040h,003h,006h,020h	; bddd  .8...(......@..
	defb 004h,004h,000h,004h,001h,098h,0b0h,003h,006h,020h,004h,004h,000h,006h,002h,080h	; bded  ......... ......
	defb 004h,003h,006h,018h,004h,004h,002h,010h,002h,080h,064h,003h,006h,038h,004h,004h	; bdfd  ..........d..8..
	defb 004h,010h,0ffh,002h,020h,05ch,002h,007h,028h,004h,004h,000h,000h,002h,028h,05ch	; be0d  .... \..(.....(\
	defb 003h,007h,028h,004h,004h,002h,000h,002h,070h,07ch,003h,007h,028h,004h,004h,004h	; be1d  ..(.....p|..(...
	defb 000h,002h,048h,03ch,004h,007h,028h,004h,004h,006h,000h,0ffh,001h,038h,068h,002h	; be2d  ..H<..(......8h.
	defb 005h,058h,004h,004h,000h,000h,002h,050h,040h,002h,006h,060h,004h,004h,002h,000h	; be3d  .X.....P@..`....
	defb 0ffh,001h,018h,030h,002h,007h,028h,004h,004h,000h,000h,001h,018h,060h,002h,007h	; be4d  ...0..(......`..
	defb 028h,004h,004h,000h,002h,001h,018h,090h,002h,007h,028h,004h,004h,000h,004h,0ffh	; be5d  (.........(.....

; ======================================================================
; CODIGO 0xbe6d..0xc000  (403 bytes)
; ======================================================================


L_BE6D:
	ld a,(0ca77h)		;be6d
	and a			;be70
	ret nz			;be71
	ld a,(0cb00h)		;be72
	cp 01ah		;be75
	ret z			;be77
	ld a,(0ca4ah)		;be78
	cp 010h		;be7b
	jr nz,L_BE85		;be7d
	ld a,(0ca43h)		;be7f
	cp 002h		;be82
	ret nz			;be84
L_BE85:
	ld ix,0e100h		;be85
	ld b,010h		;be89
L_BE8B:
	push bc			;be8b
	ld a,(ix+000h)		;be8c
	and a			;be8f
	call nz,L_BE9C		;be90
	ld bc,0000ch		;be93
	add ix,bc		;be96
	pop bc			;be98
	djnz L_BE8B		;be99
	ret			;be9b
L_BE9C:
	ld bc,(0ca50h)		;be9c
	ld a,(ix+004h)		;bea0
	cp b			;bea3
	ret nz			;bea4
	ld a,(ix+003h)		;bea5
	cp c			;bea8
	ret nz			;bea9
	call L_BF7A		;beaa
	ex de,hl			;bead
	ld b,002h		;beae
	ld a,(ix+000h)		;beb0
	dec a			;beb3
	jr z,L_BEB9		;beb4
	ld a,b			;beb6
	ld b,c			;beb7
	ld c,a			;beb8
L_BEB9:
	call 0474dh		;beb9
	ld h,(ix+002h)		;bebc
	ld l,(ix+001h)		;bebf
	ld b,(ix+005h)		;bec2
	ld c,007h		;bec5
	ld a,(ix+000h)		;bec7
	dec a			;beca
	ld a,(0ca42h)		;becb
	jp z,04680h		;bece
	jp 0467ch		;bed1
L_BED4:
	ld a,(0ca41h)		;bed4
	and a			;bed7
	ret nz			;bed8
	ld a,(0ca77h)		;bed9
	and a			;bedc
	ret nz			;bedd
	ld a,(0ca4ah)		;bede
	cp 010h		;bee1
	jr nz,L_BEEB		;bee3
	ld a,(0ca43h)		;bee5
	cp 002h		;bee8
	ret nz			;beea
L_BEEB:
	ld ix,0e100h		;beeb
	ld b,010h		;beef
L_BEF1:
	push bc			;bef1
	ld a,(ix+000h)		;bef2
	and a			;bef5
	jr z,L_BF0B		;bef6
	ld de,(0ca50h)		;bef8
	ld a,(ix+003h)		;befc
	cp e			;beff
	jr nz,L_BF0B		;bf00
	ld a,(ix+004h)		;bf02
	cp d			;bf05
	jr nz,L_BF0B		;bf06
	call L_BF14		;bf08
L_BF0B:
	ld bc,0000ch		;bf0b
	add ix,bc		;bf0e
	pop bc			;bf10
	djnz L_BEF1		;bf11
	ret			;bf13
L_BF14:
	ld a,(ix+000h)		;bf14
	dec a			;bf17
	jp nz,L_BF8A		;bf18
	ld a,(0cb03h)		;bf1b
	sub (ix+001h)		;bf1e
	cp (ix+005h)		;bf21
	ret nc			;bf24
	ld a,(0cb31h)		;bf25
	and a			;bf28
	ld de,0060ch		;bf29
	jr z,L_BF31		;bf2c
	ld de,00e14h		;bf2e
L_BF31:
	ld a,(0cb05h)		;bf31
	ld b,(ix+002h)		;bf34
	cp b			;bf37
	jr nc,L_BF40		;bf38
	add a,d			;bf3a
	cp b			;bf3b
	ret c			;bf3c
	sub e			;bf3d
	jr L_BF44		;bf3e
L_BF40:
	sub d			;bf40
	cp b			;bf41
	ret nc			;bf42
	add a,e			;bf43
L_BF44:
	ld (0cb05h),a		;bf44
L_BF47:
	dec (ix+007h)		;bf47
	ret nz			;bf4a
	ld (ix+007h),004h		;bf4b
	call 06ae6h		;bf4f
	ld a,(0ca5fh)		;bf52
	cp 002h		;bf55
	jr nc,L_BF5E		;bf57
	ld a,002h		;bf59
	ld (0d446h),a		;bf5b
L_BF5E:
	dec (ix+006h)		;bf5e
	ret nz			;bf61
	call 06b49h		;bf62
	ld a,(ix+000h)		;bf65
	ld (ix+000h),000h		;bf68
	call L_BF7A		;bf6c
	ld b,002h		;bf6f
	dec a			;bf71
	jr z,L_BF77		;bf72
	ld a,b			;bf74
	ld b,c			;bf75
	ld c,a			;bf76
L_BF77:
	jp 0475ah		;bf77
L_BF7A:
	ld d,(ix+002h)		;bf7a
	ld e,(ix+001h)		;bf7d
	ld h,(ix+009h)		;bf80
	ld l,(ix+008h)		;bf83
	ld c,(ix+005h)		;bf86
	ret			;bf89
L_BF8A:
	ld a,(0cb05h)		;bf8a
	sub (ix+002h)		;bf8d
	cp (ix+005h)		;bf90
	ret nc			;bf93
	ld a,(0cb31h)		;bf94
	and a			;bf97
	ld de,00c10h		;bf98
	jr z,L_BFA0		;bf9b
	ld de,01c20h		;bf9d
L_BFA0:
	ld a,(0cb03h)		;bfa0
	ld b,(ix+001h)		;bfa3
	cp b			;bfa6
	jr nc,L_BFB1		;bfa7
	add a,004h		;bfa9
	cp b			;bfab
	ret c			;bfac
	sub 00ah		;bfad
	jr L_BFB7		;bfaf
L_BFB1:
	sub 008h		;bfb1
	cp b			;bfb3
	ret nc			;bfb4
	add a,010h		;bfb5
L_BFB7:
	ld (0cb03h),a		;bfb7
	jr L_BF47		;bfba
L_BFBC:
	ld a,(0cab6h)		;bfbc
	or a			;bfbf
	ret nz			;bfc0
	ld a,(0cb21h)		;bfc1
	ld b,020h		;bfc4
	cp b			;bfc6
	ld hl,0d6b4h		;bfc7
	jr z,L_BFD9		;bfca
	ld hl,0d6b8h		;bfcc
	inc b			;bfcf
	cp b			;bfd0
	jr z,L_BFD9		;bfd1
	ld hl,0d6bch		;bfd3
	inc b			;bfd6
	cp b			;bfd7
	ret nz			;bfd8
L_BFD9:
	ld a,(0ca52h)		;bfd9
	ld (0ca53h),a		;bfdc
	ld a,(hl)			;bfdf
	or a			;bfe0
	ret z			;bfe1
	push hl			;bfe2
	push bc			;bfe3
	ld a,b			;bfe4
	call 092d2h		;bfe5
	pop af			;bfe8
	push af			;bfe9
	call 092dbh		;bfea
	pop bc			;bfed
	pop hl			;bfee
	ret nc			;bfef
	xor a			;bff0
	ld (hl),a			;bff1
	ld (0cb21h),a		;bff2
	ld a,(0d8a4h)		;bff5
	or a			;bff8
	ret nz			;bff9
	ld hl,0d8a4h		;bffa
	jp L_B3E5		;bffd
