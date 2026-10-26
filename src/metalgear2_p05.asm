; ==========================================================================
; METAL GEAR 2 SOLID SNAKE - Konami (1990) - MSX2 - MegaROM RC-767 de 512 KB (Konami SCC) - banco 05 (se ejecuta en 0xa000)
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
ladcfh:	equ 0x0adcf

; ----------------------------------------------------------------------
; DATOS partida_A000: los 1 ultimos bytes de la instruccion de p04:9FFE (C3 7B
;   A2), que empieza en el banco 4; lo leen p04:9FFE (1 bytes)
;   0xa000..0xa001  (1 bytes)
DATA_partida_A000:
	defb 0a2h	; a000

; ======================================================================
; CODIGO 0xa001..0xa2bd  (700 bytes)
; ======================================================================


L_A001:
	dec (ix+00eh)		;a001
	ret nz			;a004
	xor a			;a005
	ld (0d441h),a		;a006
	call 08100h		;a009
	jr nz,L_A016		;a00c
	call 08153h		;a00e
	ld a,0ffh		;a011
	ld (0d514h),a		;a013
L_A016:
	jp L_A23A		;a016
L_A019:
	ld a,(0ca4bh)		;a019   ; lee la sala de la zona
	cp 00eh		;a01c
	ret nz			;a01e
	ld a,(0e1c0h)		;a01f
	and a			;a022
	ret z			;a023
	ld a,(ix+000h)		;a024
	cp 007h		;a027
	ret nz			;a029
	ld a,(ix+001h)		;a02a
	cp 029h		;a02d
	ret z			;a02f
	sub 01ch		;a030
	cp 005h		;a032
	ret c			;a034
	ld a,(0ca4bh)		;a035   ; lee la sala de la zona
	cp 00eh		;a038
	ret nz			;a03a
	ld a,(0cb21h)		;a03b
	cp 00fh		;a03e
	ret nz			;a040
	ld a,(0ca90h)		;a041
	cp 005h		;a044
	ret nz			;a046
	xor a			;a047
	ld (ix+00ch),a		;a048
	ld (ix+00eh),010h		;a04b
	ld a,(ix+001h)		;a04f
	cp 021h		;a052
	ld a,01ch		;a054
	jr nz,L_A05E		;a056
	ld (ix+00dh),000h		;a058
	ld a,029h		;a05c
L_A05E:
	ld (ix+001h),a		;a05e
	ret			;a061
L_A062:
	dec (ix+00eh)		;a062
	ret nz			;a065
	call 09d25h		;a066
	ld a,003h		;a069
	call 08e25h		;a06b
	jp L_A27B		;a06e
L_A071:
	dec (ix+00eh)		;a071
	ret nz			;a074
	ld (ix+00eh),010h		;a075
	ld (ix+001h),020h		;a079
	jp 09d25h		;a07d   ; p04:9D25
L_A080:
	ld b,098h		;a080
	call L_A08A		;a082
	ret c			;a085
	xor a			;a086
	jp 08e25h		;a087
L_A08A:
	ld a,(ix+005h)		;a08a
	cp b			;a08d
	jr c,L_A095		;a08e
	call L_A27B		;a090
	or a			;a093
	ret			;a094
L_A095:
	call 0900bh		;a095   ; p04:900B
	scf			;a098
	ret			;a099
L_A09A:
	ld a,(ix+003h)		;a09a
	cp 02ah		;a09d
	jp nc,0900bh		;a09f
	ld a,003h		;a0a2
	call 08e25h		;a0a4   ; p04:8E25
	jp L_A27B		;a0a7
L_A0AA:
	ld b,0aah		;a0aa
	call L_A08A		;a0ac
	ret c			;a0af
	xor a			;a0b0
	ld (ix+00dh),a		;a0b1
	ld (ix+00ch),a		;a0b4
	ld (ix+00eh),010h		;a0b7
	ret			;a0bb
L_A0BC:
	dec (ix+00eh)		;a0bc
	ret nz			;a0bf
	ld a,002h		;a0c0
	ld (0e1c0h),a		;a0c2
	ld hl,0ca22h		;a0c5   ; apunta a la fase de la partida (indice de las listas de p06:B40C)
	ld a,(hl)			;a0c8
	cp 008h		;a0c9
	jr nc,L_A0D5		;a0cb
	ld a,008h		;a0cd
	ld (0ca22h),a		;a0cf   ; guarda la fase de la partida (indice de las listas de p06:B40C)
	call 07a12h		;a0d2
L_A0D5:
	call 06c33h		;a0d5   ; p01:6C33
	jp L_A27B		;a0d8
L_A0DB:
	inc (ix+00eh)		;a0db
	jp 09e51h		;a0de   ; p04:9E51
L_A0E1:
	call 0900bh		;a0e1
	ld a,(ix+003h)		;a0e4
	cp 030h		;a0e7
	ret nc			;a0e9
	jr L_A10A		;a0ea
L_A0EC:
	and a			;a0ec
	ret			;a0ed
L_A0EE:
	ld a,(0d430h)		;a0ee
	cp 002h		;a0f1
	jr z,L_A0EC		;a0f3
	ld a,(ix+000h)		;a0f5
	cp 002h		;a0f8
	jr nz,L_A0EC		;a0fa
	call 08100h		;a0fc
	jr nz,L_A0EC		;a0ff
	ld a,(ix+007h)		;a101
	and a			;a104
	ld bc,00006h		;a105
	jr nz,L_A10D		;a108
L_A10A:
	ld bc,00207h		;a10a
L_A10D:
	ld a,b			;a10d
	push bc			;a10e
	call 08e25h		;a10f
	pop bc			;a112
	ld (ix+001h),c		;a113
	scf			;a116
	ret			;a117
L_A118:
	call 0900bh		;a118
	call 080e6h		;a11b
	ld a,(ix+00bh)		;a11e
	cp 005h		;a121
	ret nz			;a123
	ld a,(ix+005h)		;a124
	cp 090h		;a127
	ret nc			;a129
	ld bc,0001bh		;a12a
	jr L_A10D		;a12d
L_A12F:
	call 0900bh		;a12f
	ld a,(ix+003h)		;a132
	cp 018h		;a135
	ret nc			;a137
	xor a			;a138
	ld (ix+000h),a		;a139
	inc a			;a13c
	ld (0d430h),a		;a13d
	ld a,040h		;a140
	ld (0d431h),a		;a142
	call 08273h		;a145
	jp 080f3h		;a148
L_A14B:
	call 0900bh		;a14b
	ld a,(ix+005h)		;a14e
	cp 070h		;a151
	ret nc			;a153
	ld (ix+001h),017h		;a154
L_A158:
	ld (ix+00dh),002h		;a158
	ld a,001h		;a15c
	jp 08e25h		;a15e
L_A161:
	call 0900bh		;a161
	ld a,(ix+005h)		;a164
	cp 048h		;a167
	ret nc			;a169
	ld hl,0cac9h		;a16a
L_A16D:
	xor a			;a16d
	ld (ix+001h),a		;a16e
	ld (ix+00dh),a		;a171
	ld (ix+00ch),a		;a174
	inc a			;a177
	ld (hl),a			;a178
	ld a,008h		;a179
	ld (ix+01ch),a		;a17b
	call 08100h		;a17e
	ret nz			;a181
	call 06c33h		;a182
	jp 08da8h		;a185   ; p04:8DA8
L_A188:
	ld de,01604h		;a188
	ld c,002h		;a18b
L_A18D:
	call 0900bh		;a18d
	ld a,(ix+003h)		;a190
	cp 0b0h		;a193
	ret c			;a195
	ld (ix+001h),d		;a196
	ld (ix+00dh),e		;a199
	ld a,c			;a19c
	jp 08e25h		;a19d
L_A1A0:
	ld de,01a06h		;a1a0
	ld c,003h		;a1a3
	jr L_A18D		;a1a5
L_A1A7:
	call 0900bh		;a1a7
	ld a,(ix+005h)		;a1aa
	cp 050h		;a1ad
	ret nc			;a1af
	call L_A158		;a1b0
	jp L_A27B		;a1b3
L_A1B6:
	call 0900bh		;a1b6
	ld a,(ix+005h)		;a1b9
	cp 0b0h		;a1bc
	ret c			;a1be
	ld hl,0cacah		;a1bf
	jp L_A16D		;a1c2
L_A1C5:
	dec (ix+00eh)		;a1c5
	ret nz			;a1c8
	ld a,(0d521h)		;a1c9
	and a			;a1cc
	jr nz,L_A1DE		;a1cd
	call 08100h		;a1cf
	ld a,001h		;a1d2
	jr nz,L_A1DB		;a1d4
	ld (0d529h),a		;a1d6
	jr L_A1DE		;a1d9
L_A1DB:
	ld (0d599h),a		;a1db
L_A1DE:
	ld (ix+00eh),008h		;a1de
	jp L_A27B		;a1e2
L_A1E5:
	dec (ix+00eh)		;a1e5
	ret nz			;a1e8
	ld hl,0d2c0h		;a1e9
	ld bc,0003fh		;a1ec
	call 04236h		;a1ef   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	push ix		;a1f2
	ld ix,0d2c0h		;a1f4
	ld (ix+000h),018h		;a1f8
	ld (ix+010h),0ffh		;a1fc
	call 08153h		;a200
	pop ix		;a203
	ld (ix+00eh),008h		;a205
	jp L_A27B		;a209
L_A20C:
	dec (ix+00eh)		;a20c
	ret nz			;a20f
	call L_A23A		;a210
	xor a			;a213
	ld (0d521h),a		;a214
	ld (0d529h),a		;a217
	ld (0d599h),a		;a21a
	call 08100h		;a21d
	ret nz			;a220
	ld hl,04840h		;a221
	ld de,02840h		;a224
	ld bc,01820h		;a227
	ld a,(0ca42h)		;a22a   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	and a			;a22d
	ld a,005h		;a22e
	jr nz,L_A233		;a230
	xor a			;a232
L_A233:
	jp 04767h		;a233   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
L_A236:
	dec (ix+00eh)		;a236
	ret nz			;a239
L_A23A:
	ld (ix+001h),004h		;a23a
	ret			;a23e
L_A23F:
	push ix		;a23f
	ld ix,0d2c0h		;a241
	ld (ix+000h),000h		;a245
	call 0834ch		;a249
	pop ix		;a24c
	jr L_A27B		;a24e
L_A250:
	call L_A0EE		;a250
	ret c			;a253
	call 09f6bh		;a254   ; p04:9F6B
	ret z			;a257
	call 09f22h		;a258   ; p04:9F22
	ret z			;a25b
	call 08e82h		;a25c
	jp c,L_A27B		;a25f
	jp 0900bh		;a262
L_A265:
	ld a,(ix+01ah)		;a265
	and a			;a268
	jr z,L_A2AA		;a269
	ld a,(ix+00dh)		;a26b
	and 0feh		;a26e
	ld (ix+015h),a		;a270
	ld (ix+00ch),000h		;a273
	ld (ix+00eh),080h		;a277
L_A27B:
	inc (ix+001h)		;a27b
	ret			;a27e
L_A27F:
	call L_A285		;a27f
	jr z,L_A27B		;a282
	ret			;a284
L_A285:
	dec (ix+00eh)		;a285
	ret z			;a288
	ld b,000h		;a289
	bit 4,(ix+00eh)		;a28b
	jr z,L_A29A		;a28f
	ld b,008h		;a291
	bit 5,(ix+00eh)		;a293
	jr z,L_A29A		;a297
	inc b			;a299
L_A29A:
	ld a,(ix+015h)		;a29a
	and 0feh		;a29d
	add a,b			;a29f
	ld (ix+00dh),a		;a2a0
	or 001h		;a2a3
	ret			;a2a5
L_A2A6:
	call L_A285		;a2a6
	ret nz			;a2a9
L_A2AA:
	jp L_A23A		;a2aa
L_A2AD:
	ld a,(ix+001h)		;a2ad
	cp 025h		;a2b0
	jp z,09e9ah		;a2b2
	cp 026h		;a2b5
	jp z,09ea4h		;a2b7
	call 0424dh		;a2ba   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_A2BD: 12 destinos del despachador p00:424D (call en p05:A2BA, el
;   indice en A): A2D5, A309, A47B, A49D, A4A9, 900B, 9DB0, A5EA, 8ECD, 8ED9,
;   9E05, A490; lo leen p05:A2BA (24 bytes)
;   0xa2bd..0xa2d5  (24 bytes)
DATA_tabla_A2BD:
	defw 0a2d5h,0a309h,0a47bh,0a49dh,0a4a9h,0900bh,09db0h,0a5eah	; a2bd
	defw 08ecdh,08ed9h,09e05h,0a490h	; a2cd  -> 0x8ecd 0x8ed9 0x9e05 L_A490

; ======================================================================
; CODIGO 0xa2d5..0xa376  (161 bytes)
; ======================================================================


L_A2D5:
	call L_A27B		;a2d5
	xor a			;a2d8
	ld (ix+00fh),a		;a2d9
	ld (ix+02ah),a		;a2dc
	ld a,(0ca76h)		;a2df   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	and a			;a2e2
	ld a,(0d41eh)		;a2e3
	jr z,L_A2EB		;a2e6
	ld a,(0d449h)		;a2e8
L_A2EB:
	dec a			;a2eb
L_A2EC:
	ld (ix+01dh),a		;a2ec
	call 08e25h		;a2ef
	push ix		;a2f2
	pop hl			;a2f4
	ld a,l			;a2f5
	and 010h		;a2f6
	ld bc,03f20h		;a2f8
	jr z,L_A300		;a2fb
	ld bc,01f18h		;a2fd
L_A300:
	call 04256h		;a300   ; azar: A = un numero al azar (0xCA03 rotado mas R)
	and b			;a303
	add a,c			;a304
	ld (ix+00eh),a		;a305
	ret			;a308
L_A309:
	ld a,(0d42ah)		;a309
	and a			;a30c
	jr nz,L_A367		;a30d
	call L_A45D		;a30f
	jr nc,L_A33E		;a312
	call 09038h		;a314
	jr nz,L_A33E		;a317
	call L_A3C0		;a319
	jr c,L_A33E		;a31c
	dec (ix+00eh)		;a31e
	jp nz,0900bh		;a321
	inc (ix+00fh)		;a324
	ld a,(ix+00fh)		;a327
	and 003h		;a32a
	jr z,L_A35C		;a32c
L_A32E:
	ld a,(ix+01dh)		;a32e
	xor 002h		;a331
	and 002h		;a333
	ld b,a			;a335
	call L_A3EA		;a336
	and 001h		;a339
	or b			;a33b
	jr L_A2EC		;a33c
L_A33E:
	call 08f9ah		;a33e
	inc (ix+00fh)		;a341
	ld a,(ix+00fh)		;a344
	and 003h		;a347
	jr z,L_A35C		;a349
	ld a,(ix+01dh)		;a34b
	cp 002h		;a34e
	jr nc,L_A357		;a350
	call L_A3F3		;a352
	jr L_A2EC		;a355
L_A357:
	call L_A442		;a357
	jr L_A2EC		;a35a
L_A35C:
	ld (ix+00ch),000h		;a35c
	ld (ix+00eh),0c0h		;a360
	jp L_A27B		;a364
L_A367:
	call 09d1bh		;a367   ; p04:9D1B
	ld (ix+001h),003h		;a36a
	call 04256h		;a36e   ; azar: A = un numero al azar (0xCA03 rotado mas R)
	and 003h		;a371
	jp 08e25h		;a373

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa376..0xa3c0  (74 bytes)
DATA_A376:
	defb 0ddh,036h,00ch,000h,0ddh,036h,001h,00bh,0ddh,07eh,003h,0d6h,030h,030h,001h,0afh	; a376  .6...6...~..00..
	defb 06fh,0ddh,07eh,005h,0d6h,030h,026h,000h,038h,006h,026h,068h,0bch,030h,001h,067h	; a386  o.~..0&.8.&h.0.g
	defb 022h,039h,0d4h,011h,0e0h,000h,001h,010h,058h,03ah,042h,0cah,0e5h,0cdh,067h,047h	; a396  "9......X:B...gG
	defb 0e1h,001h,00ch,058h,03ah,042h,0cah,057h,03eh,099h,0e5h,0cdh,0ffh,046h,0e1h,011h	; a3a6  ...X:B.W>....F..
	defb 00ch,058h,00eh,007h,03ah,042h,0cah,0c3h,0bch,046h	; a3b6  .X..:B...F

; ======================================================================
; CODIGO 0xa3c0..0xa59b  (475 bytes)
; ======================================================================


L_A3C0:
	ld a,(0d42bh)		;a3c0
	and a			;a3c3
	ret z			;a3c4
	ld hl,0d300h		;a3c5
	ld de,0d340h		;a3c8
	ld a,(de)			;a3cb
	and (hl)			;a3cc
	ret z			;a3cd
	inc hl			;a3ce
	inc hl			;a3cf
	inc hl			;a3d0
	inc de			;a3d1
	inc de			;a3d2
	inc de			;a3d3
	ld a,(de)			;a3d4
	sub (hl)			;a3d5
	jr nc,L_A3DA		;a3d6
	neg		;a3d8
L_A3DA:
	cp 010h		;a3da
	ret nc			;a3dc
	inc hl			;a3dd
	inc hl			;a3de
	inc de			;a3df
	inc de			;a3e0
	ld a,(de)			;a3e1
	sub (hl)			;a3e2
	jr nc,L_A3E7		;a3e3
	neg		;a3e5
L_A3E7:
	cp 00ch		;a3e7
	ret			;a3e9
L_A3EA:
	push ix		;a3ea
	pop hl			;a3ec
	ld a,l			;a3ed
	rrca			;a3ee
	rrca			;a3ef
	rrca			;a3f0
	rrca			;a3f1
	ret			;a3f2
L_A3F3:
	ld c,008h		;a3f3
	call L_A419		;a3f5
	push bc			;a3f8
	ld c,0f8h		;a3f9
	call L_A419		;a3fb
	ld a,b			;a3fe
	ld d,b			;a3ff
	pop bc			;a400
	add a,b			;a401
	cp 004h		;a402
	jr c,L_A40E		;a404
	ld a,d			;a406
	cp b			;a407
	ld a,002h		;a408
	ret nc			;a40a
	ld a,003h		;a40b
	ret			;a40d
L_A40E:
	ld a,(ix+01dh)		;a40e
	rra			;a411
	ccf			;a412
	rla			;a413
	ret			;a414
L_A415:
	ld d,001h		;a415
	jr L_A41B		;a417
L_A419:
	ld d,000h		;a419
L_A41B:
	ld h,(ix+005h)		;a41b
	ld a,(ix+003h)		;a41e
	sub 006h		;a421
	ld l,a			;a423
	ld b,000h		;a424
L_A426:
	push hl			;a426
	push de			;a427
	push bc			;a428
	call 07f3dh		;a429
	pop bc			;a42c
	pop de			;a42d
	pop hl			;a42e
	ret c			;a42f
	ld a,d			;a430
	and a			;a431
	jr nz,L_A439		;a432
	ld a,h			;a434
	add a,c			;a435
	ld h,a			;a436
	jr L_A43C		;a437
L_A439:
	ld a,l			;a439
	add a,c			;a43a
	ld l,a			;a43b
L_A43C:
	cp 0c0h		;a43c
	ret nc			;a43e
	inc b			;a43f
	jr L_A426		;a440
L_A442:
	ld c,008h		;a442
	call L_A415		;a444
	push bc			;a447
	ld c,0f8h		;a448
	call L_A415		;a44a
	ld a,b			;a44d
	ld d,b			;a44e
	pop bc			;a44f
	add a,b			;a450
	cp 004h		;a451
	jr c,L_A40E		;a453
	ld a,d			;a455
	cp b			;a456
	ld a,000h		;a457
	ret nc			;a459
	ld a,001h		;a45a
	ret			;a45c
L_A45D:
	ld a,(ix+00ch)		;a45d
	rra			;a460
	ld bc,010b0h		;a461
	ld a,(ix+003h)		;a464
	jr c,L_A478		;a467
	ld a,(ix+009h)		;a469
	rla			;a46c
	ld a,(ix+005h)		;a46d
	ld bc,000b4h		;a470
	jr nc,L_A478		;a473
	ld bc,010b0h		;a475
L_A478:
	sub b			;a478
	cp c			;a479
	ret			;a47a
L_A47B:
	ld a,(0d42ah)		;a47b
	and a			;a47e
	jp nz,L_A367		;a47f
	dec (ix+00eh)		;a482
	jr z,L_A496		;a485
	ld a,(ix+00eh)		;a487
	and 00fh		;a48a
	ret nz			;a48c
	jp 08f0dh		;a48d
L_A490:
	dec (ix+00eh)		;a490
	jp nz,09e51h		;a493
L_A496:
	ld (ix+001h),001h		;a496
	jp L_A32E		;a49a
L_A49D:
	call 09038h		;a49d   ; p04:9038
	jp z,0900bh		;a4a0
	call L_A27B		;a4a3
	jp L_A57C		;a4a6
L_A4A9:
	ld a,(ix+00ch)		;a4a9
	rra			;a4ac
	jr nc,L_A4C0		;a4ad
	ld a,(ix+007h)		;a4af
	rla			;a4b2
	ld a,000h		;a4b3
	ld de,00101h		;a4b5
	jr c,L_A4CF		;a4b8
	inc a			;a4ba
	ld de,01002h		;a4bb
	jr L_A4CF		;a4be
L_A4C0:
	ld a,(ix+009h)		;a4c0
	rla			;a4c3
	ld a,002h		;a4c4
	ld de,00104h		;a4c6
	jr c,L_A4CF		;a4c9
	inc a			;a4cb
	ld de,01008h		;a4cc
L_A4CF:
	push de			;a4cf
	ld (ix+01dh),a		;a4d0
	ld hl,0a59bh		;a4d3
	call 0424eh		;a4d6   ; salta_por_tabla: salta a la palabra A de la tabla de HL
	pop de			;a4d9
	ld a,c			;a4da
	and 00eh		;a4db
	jr nz,L_A4E3		;a4dd
	ld a,c			;a4df
	and d			;a4e0
	jr nz,L_A4F4		;a4e1
L_A4E3:
	push de			;a4e3
	call 090c8h		;a4e4
	pop de			;a4e7
	ld a,e			;a4e8
	and c			;a4e9
	jp z,0900bh		;a4ea
	xor a			;a4ed
	ld (ix+02ah),a		;a4ee
	jp L_A57C		;a4f1
L_A4F4:
	inc (ix+02ah)		;a4f4
	ld a,(0ca4ah)		;a4f7   ; lee la zona
	cp 00ah		;a4fa
	ld b,005h		;a4fc
	jr nz,L_A509		;a4fe
	ld a,(0ca50h)		;a500
	cp 004h		;a503
	jr nc,L_A509		;a505
	ld b,003h		;a507
L_A509:
	ld a,(ix+02ah)		;a509
	cp b			;a50c
	jp nc,0900bh		;a50d
	ld h,(ix+005h)		;a510
	ld l,(ix+003h)		;a513
	ld a,(ix+00ch)		;a516
	rra			;a519
	jr nc,L_A54B		;a51a
	ld a,(ix+007h)		;a51c
	rla			;a51f
	ld b,008h		;a520
	jr nc,L_A526		;a522
	ld b,0f8h		;a524
L_A526:
	ld a,l			;a526
	cp 0c0h		;a527
	jp nc,L_A27B		;a529
	push hl			;a52c
	push bc			;a52d
	ld a,h			;a52e
	sub 004h		;a52f
	ld h,a			;a531
	call 07f3dh		;a532
	pop bc			;a535
	pop hl			;a536
	jr c,L_A577		;a537
	push hl			;a539
	push bc			;a53a
	ld a,h			;a53b
	add a,003h		;a53c
	ld h,a			;a53e
	call 07f3dh		;a53f
	pop bc			;a542
	pop hl			;a543
	jr c,L_A577		;a544
	ld a,l			;a546
	add a,b			;a547
	ld l,a			;a548
	jr L_A526		;a549
L_A54B:
	ld a,(ix+009h)		;a54b
	rla			;a54e
	ld b,008h		;a54f
	jr nc,L_A555		;a551
	ld b,0f8h		;a553
L_A555:
	ld a,h			;a555
	cp 0c0h		;a556
	jp nc,L_A27B		;a558
	push hl			;a55b
	push bc			;a55c
	dec l			;a55d
	call 07f3dh		;a55e
	pop bc			;a561
	pop hl			;a562
	jr c,L_A577		;a563
	push hl			;a565
	push bc			;a566
	ld a,l			;a567
	sub 004h		;a568
	ld l,a			;a56a
	call 07f3dh		;a56b
	pop bc			;a56e
	pop hl			;a56f
	jr c,L_A577		;a570
	ld a,h			;a572
	add a,b			;a573
	ld h,a			;a574
	jr L_A555		;a575
L_A577:
	ld hl,0a5e6h		;a577
	jr L_A57F		;a57a
L_A57C:
	ld hl,0a5e2h		;a57c
L_A57F:
	ld a,(ix+01dh)		;a57f
	call 04248h		;a582   ; byte_de_tabla: A = el byte A de la tabla de HL (y HL apunta a el)
	ld (ix+01dh),a		;a585
	push af			;a588
	call 090c8h		;a589
	pop af			;a58c
	ld b,a			;a58d
	inc b			;a58e
	ld a,c			;a58f
L_A590:
	rra			;a590
	djnz L_A590		;a591
	jr c,L_A57C		;a593
	ld a,(ix+01dh)		;a595
	jp 08e25h		;a598

; ----------------------------------------------------------------------
; DATOS resto_A59B: lo apuntan con el banco puesto p05:A4D3 (0xA59B); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p05:A4D3 (8 bytes)
;   0xa59b..0xa5a3  (8 bytes)
DATA_resto_A59B:
	defb 0a3h,0a5h,0cah,0a5h,0d2h,0a5h,0dah,0a5h	; a59b  ........

; ======================================================================
; CODIGO 0xa5a3..0xa5e2  (63 bytes)
; ======================================================================


L_A5A3:
	ld de,00006h		;a5a3
	ld bc,00beeh		;a5a6
L_A5A9:
	ld a,(ix+003h)		;a5a9
	add a,c			;a5ac
	ld l,a			;a5ad
	ld a,(ix+005h)		;a5ae
	add a,b			;a5b1
	ld h,a			;a5b2
	ld bc,00500h		;a5b3
L_A5B6:
	push hl			;a5b6
	push de			;a5b7
	push bc			;a5b8
	call 07f3dh		;a5b9
	pop bc			;a5bc
	pop de			;a5bd
	pop hl			;a5be
	rl c		;a5bf
	ld a,h			;a5c1
	add a,d			;a5c2
	ld h,a			;a5c3
	ld a,l			;a5c4
	add a,e			;a5c5
	ld l,a			;a5c6
	djnz L_A5B6		;a5c7
	ret			;a5c9
L_A5CA:
	ld de,00006h		;a5ca
	ld bc,0f3eeh		;a5cd
	jr L_A5A9		;a5d0
L_A5D2:
	ld de,00600h		;a5d2
	ld bc,0f3eeh		;a5d5
	jr L_A5A9		;a5d8
L_A5DA:
	ld de,00600h		;a5da
	ld bc,0f406h		;a5dd
	jr L_A5A9		;a5e0

; ----------------------------------------------------------------------
; DATOS resto_A5E2: lo apuntan con el banco puesto p05:A57C (0xA5E2), p05:A577
;   (0xA5E6); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p05:A57C, p05:A577 (8 bytes)
;   0xa5e2..0xa5ea  (8 bytes)
DATA_resto_A5E2:
	defb 002h,003h,001h,000h,003h,002h,000h,001h	; a5e2  ........

; ======================================================================
; CODIGO 0xa5ea..0xa614  (42 bytes)
; ======================================================================


L_A5EA:
	call 09dceh		;a5ea
	ret nc			;a5ed
	ld (ix+001h),00ah		;a5ee
	ret			;a5f2
L_A5F3:
	call 08100h		;a5f3
	jp nz,086a4h		;a5f6
	ld hl,06bcch		;a5f9
	call 086d5h		;a5fc
	ld a,(ix+001h)		;a5ff
	ld hl,0a614h		;a602
	call 0424eh		;a605   ; salta_por_tabla: salta a la palabra A de la tabla de HL
	call 08082h		;a608
	ld a,(ix+001h)		;a60b
	cp 006h		;a60e
	ret c			;a610
	jp 08671h		;a611

; ----------------------------------------------------------------------
; DATOS resto_A614: lo apuntan con el banco puesto p05:A602 (0xA614); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p05:A602 (36 bytes)
;   0xa614..0xa638  (36 bytes)
DATA_resto_A614:
	defb 038h,0a6h,03ch,0a6h,05fh,0a6h,06ch,0a6h,08ah,0a6h,0fbh,0a6h,004h,0a7h,018h,0a7h	; a614  8.<._.l.........
	defb 0c3h,0a7h,0deh,0a8h,00ah,0a9h,019h,0a9h,019h,0a9h,043h,0a9h,098h,0a9h,0e4h,0a9h	; a624  ..........C.....
	defb 026h,0aah,036h,0aah	; a634

; ======================================================================
; CODIGO 0xa638..0xa6e3  (171 bytes)
; ======================================================================


L_A638:
	inc (ix+001h)		;a638
	ret			;a63b
L_A63C:
	call 08079h		;a63c
	ld a,l			;a63f
	sub 050h		;a640
	cp 030h		;a642
	ret nc			;a644
	ld a,h			;a645
	sub 078h		;a646
	cp 008h		;a648
	ret nc			;a64a
	ld hl,0d7d1h		;a64b
	set 7,(hl)		;a64e
	ld a,001h		;a650
	ld (0cb3ch),a		;a652
	ld (ix+00eh),020h		;a655
	call L_A638		;a659
	jp 086c2h		;a65c
L_A65F:
	dec (ix+00eh)		;a65f
	ret nz			;a662
	ld de,00010h		;a663
L_A666:
	call 061ceh		;a666
	jp L_A638		;a669
L_A66C:
	ld c,040h		;a66c
	call L_A675		;a66e
	ret nc			;a671
	jp 06c47h		;a672   ; p01:6C47
L_A675:
	push bc			;a675
	call 06247h		;a676
	pop bc			;a679
	ret nz			;a67a
	ld (ix+01ch),000h		;a67b
	ld (ix+00eh),c		;a67f
	call 079c7h		;a682
	call L_A638		;a685
	scf			;a688
	ret			;a689
L_A68A:
	call L_A6AF		;a68a
	dec (ix+00eh)		;a68d
	jr z,L_A6A7		;a690
	ld a,(ix+00eh)		;a692
	cp 01dh		;a695
	call z,L_A6A2		;a697
	cp 010h		;a69a
	ret nz			;a69c
	ld (ix+00dh),007h		;a69d
	ret			;a6a1
L_A6A2:
	ld (ix+00dh),002h		;a6a2
	ret			;a6a6
L_A6A7:
	call L_A6F0		;a6a7
	ld de,00110h		;a6aa
	jr L_A666		;a6ad
L_A6AF:
	ld hl,0dc60h		;a6af
	ld b,003h		;a6b2
	ld d,060h		;a6b4
L_A6B6:
	ld (hl),d			;a6b6
	inc hl			;a6b7
	ld (hl),058h		;a6b8
	inc hl			;a6ba
	ld a,(ix+00eh)		;a6bb
	rra			;a6be
	ld a,028h		;a6bf
	ld e,02ch		;a6c1
	jr c,L_A6C9		;a6c3
	ld a,030h		;a6c5
	ld e,034h		;a6c7
L_A6C9:
	ld (hl),a			;a6c9
	inc hl			;a6ca
	inc hl			;a6cb
	ld (hl),d			;a6cc
	inc hl			;a6cd
	ld (hl),058h		;a6ce
	inc hl			;a6d0
	ld (hl),e			;a6d1
	inc hl			;a6d2
	inc hl			;a6d3
	ld a,d			;a6d4
	sub 00ah		;a6d5
	ld d,a			;a6d7
	djnz L_A6B6		;a6d8
	ld hl,0db80h		;a6da
	ld de,0a6e3h		;a6dd
	jp 051e0h		;a6e0   ; rachas_a_ram: deshace las rachas de DE en HL (n < 0x80 repite, n > 0x80 copia, 0 acaba)

; ----------------------------------------------------------------------
; DATOS resto_A6E3: lo apuntan con el banco puesto p05:A6DD (0xA6E3); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p05:A6DD (13 bytes)
;   0xa6e3..0xa6f0  (13 bytes)
DATA_resto_A6E3:
	defb 010h,007h,010h,008h,010h,007h,010h,008h,010h,007h,010h,008h,000h	; a6e3  .............

; ======================================================================
; CODIGO 0xa6f0..0xa75f  (111 bytes)
; ======================================================================


L_A6F0:
	ld hl,0dc60h		;a6f0
	ld bc,0001fh		;a6f3
	ld a,0e0h		;a6f6
	jp 04237h		;a6f8   ; llena_bloque: pone A en BC + 1 bytes desde HL
L_A6FB:
	ld c,000h		;a6fb
	call L_A675		;a6fd
	ret nc			;a700
	jp 08685h		;a701
L_A704:
	xor a			;a704
	ld (0cb3ch),a		;a705
	ld (ix+011h),a		;a708
	ld (ix+00eh),a		;a70b
	ld (ix+00dh),a		;a70e
	inc a			;a711
	ld (ix+016h),a		;a712
	jp L_A638		;a715
L_A718:
	ld a,(ix+017h)		;a718
	dec a			;a71b
	jr z,L_A73C		;a71c
	call L_A767		;a71e
	jr c,L_A73C		;a721
	ld a,(ix+007h)		;a723
	and a			;a726
	jr nz,L_A731		;a727
	ld a,(ix+005h)		;a729
	cp 080h		;a72c
	jp nc,L_A8BF		;a72e
L_A731:
	call L_A803		;a731
	ld a,(ix+00eh)		;a734
	and a			;a737
	ret nz			;a738
	jp L_A7E6		;a739
L_A73C:
	ld (ix+001h),009h		;a73c
	ld hl,0a75fh		;a740
L_A743:
	call 04256h		;a743   ; azar: A = un numero al azar (0xCA03 rotado mas R)
	and 003h		;a746
	call 043f6h		;a748   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld (ix+018h),l		;a74b
	ld (ix+019h),h		;a74e
	xor a			;a751
	ld (ix+00ch),a		;a752
	ld (ix+016h),a		;a755
	ld (ix+00eh),008h		;a758
	jp 06c4bh		;a75c   ; p01:6C4B

; ----------------------------------------------------------------------
; DATOS resto_A75F: lo apuntan con el banco puesto p05:A740 (0xA75F); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p05:A740 (8 bytes)
;   0xa75f..0xa767  (8 bytes)
DATA_resto_A75F:
	defb 030h,018h,030h,070h,0a8h,018h,0a8h,070h	; a75f  0.0p...p

; ======================================================================
; CODIGO 0xa767..0xa79c  (53 bytes)
; ======================================================================


L_A767:
	call 08079h		;a767
	ex de,hl			;a76a
	ld a,d			;a76b
	sub 038h		;a76c
	cp 090h		;a76e
	ret nc			;a770
	ld a,e			;a771
	sub 050h		;a772
	cp 030h		;a774
	ret			;a776
L_A777:
	ld a,(ix+00dh)		;a777
	rrca			;a77a
	and 003h		;a77b
L_A77D:
	ld b,a			;a77d
	ld a,(ix+000h)		;a77e
L_A781:
	ld hl,0a7adh		;a781
	call 043f6h		;a784   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ex de,hl			;a787
	ld a,b			;a788
	ld hl,0a79ch		;a789
	call 0424eh		;a78c   ; salta_por_tabla: salta a la palabra A de la tabla de HL
	call 08097h		;a78f   ; p04:8097
	ex de,hl			;a792
	call 080a7h		;a793   ; p04:80A7
	ld a,003h		;a796
	ld (ix+00ch),a		;a798
	ret			;a79b

; ----------------------------------------------------------------------
; DATOS resto_A79C: lo apuntan con el banco puesto p05:A789 (0xA79C); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p05:A789 (8 bytes)
;   0xa79c..0xa7a4  (8 bytes)
DATA_resto_A79C:
	defb 0a4h,0a7h,0a7h,0a7h,0ach,0a7h,0afh,0a7h	; a79c  ........

; ======================================================================
; CODIGO 0xa7a4..0xa7b3  (15 bytes)
; ======================================================================


L_A7A4:
	call 04442h		;a7a4   ; de_negativo: DE = -DE
L_A7A7:
	ex de,hl			;a7a7
	ld de,00000h		;a7a8
	ret			;a7ab
L_A7AC:
	call 04442h		;a7ac   ; de_negativo: DE = -DE
L_A7AF:
	ld hl,00000h		;a7af
	ret			;a7b2

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa7b3..0xa7c3  (16 bytes)
DATA_A7B3:
	defb 000h,004h,000h,004h,000h,002h,000h,003h,080h,003h,080h,001h,080h,003h,080h,002h	; a7b3  ................

; ======================================================================
; CODIGO 0xa7c3..0xa86d  (170 bytes)
; ======================================================================


L_A7C3:
	ld a,(ix+017h)		;a7c3
	dec a			;a7c6
	jp z,L_A862		;a7c7
	call L_A767		;a7ca
	jp nc,L_A862		;a7cd
	ld a,(ix+007h)		;a7d0
	and a			;a7d3
	jr nz,L_A7DE		;a7d4
	ld a,(ix+005h)		;a7d6
	cp 090h		;a7d9
	jp nc,L_A8BF		;a7db
L_A7DE:
	call L_A803		;a7de
	ld a,(ix+00eh)		;a7e1
	and a			;a7e4
	ret nz			;a7e5
L_A7E6:
	ld a,(ix+00dh)		;a7e6
	ld (ix+01bh),a		;a7e9
	call L_A8D2		;a7ec
	ld bc,00c0bh		;a7ef
	ld (ix+00eh),b		;a7f2
	ld (ix+00ch),000h		;a7f5
	ld a,(ix+001h)		;a7f9
	ld (ix+01ah),a		;a7fc
	ld (ix+001h),c		;a7ff
	ret			;a802
L_A803:
	call 086deh		;a803
	ld (ix+00fh),000h		;a806
	dec (ix+00eh)		;a80a
	ret z			;a80d
	ld a,(ix+003h)		;a80e
	sub 020h		;a811
	cp 0a0h		;a813
	jr nc,L_A82F		;a815
	ld a,(ix+005h)		;a817
	sub 008h		;a81a
	cp 0b0h		;a81c
	jr nc,L_A82F		;a81e
	call 090c8h		;a820
	ld a,(ix+00ch)		;a823
	rra			;a826
	ld a,003h		;a827
	jr c,L_A82D		;a829
	ld a,00ch		;a82b
L_A82D:
	and c			;a82d
	ret z			;a82e
L_A82F:
	ld (ix+00eh),000h		;a82f
	ld (ix+00fh),001h		;a833
	call 0808bh		;a837
	ld a,003h		;a83a
	jp 08085h		;a83c
L_A83F:
	call L_A875		;a83f
	jr L_A847		;a842
L_A844:
	call L_A894		;a844
L_A847:
	call L_A777		;a847
	call 04256h		;a84a   ; azar: A = un numero al azar (0xCA03 rotado mas R)
	and 007h		;a84d
	add a,008h		;a84f
	ld (ix+00eh),a		;a851
	ld c,a			;a854
	ld a,(ix+000h)		;a855
	cp 005h		;a858
	ret nz			;a85a
	ld a,c			;a85b
	add a,010h		;a85c
	ld (ix+00eh),a		;a85e
	ret			;a861
L_A862:
	ld hl,0a86dh		;a862
	call L_A743		;a865
	ld (ix+001h),00ah		;a868
	ret			;a86c

; ----------------------------------------------------------------------
; DATOS resto_A86D: lo apuntan con el banco puesto p05:A862 (0xA86D); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p05:A862 (8 bytes)
;   0xa86d..0xa875  (8 bytes)
DATA_resto_A86D:
	defb 060h,048h,060h,068h,078h,048h,078h,068h	; a86d  `H`hxHxh

; ======================================================================
; CODIGO 0xa875..0xa8bb  (70 bytes)
; ======================================================================


L_A875:
	call 04256h		;a875   ; azar: A = un numero al azar (0xCA03 rotado mas R)
	ld d,a			;a878
	ld a,(ix+00dh)		;a879
	cp 004h		;a87c
	jr nc,L_A88A		;a87e
	ld a,d			;a880
	rra			;a881
	ld d,004h		;a882
	jr c,L_A89C		;a884
	ld d,006h		;a886
	jr L_A89C		;a888
L_A88A:
	ld a,d			;a88a
	rra			;a88b
	ld d,000h		;a88c
	jr c,L_A89C		;a88e
	ld d,002h		;a890
	jr L_A89C		;a892
L_A894:
	call 04256h		;a894   ; azar: A = un numero al azar (0xCA03 rotado mas R)
	rlca			;a897
	rlca			;a898
	and 006h		;a899
	ld d,a			;a89b
L_A89C:
	call L_A8B0		;a89c
	jr nc,L_A8AC		;a89f
	ld a,d			;a8a1
	rrca			;a8a2
	and 003h		;a8a3
	ld hl,0a8bbh		;a8a5
	call 0423eh		;a8a8   ; suma_a_hl: HL = HL + A
	ld d,(hl)			;a8ab
L_A8AC:
	ld (ix+00dh),d		;a8ac
	ret			;a8af
L_A8B0:
	ld a,d			;a8b0
	rrca			;a8b1
	and 003h		;a8b2
	ld b,a			;a8b4
	inc b			;a8b5
	ld a,c			;a8b6
L_A8B7:
	rra			;a8b7
	djnz L_A8B7		;a8b8
	ret			;a8ba

; ----------------------------------------------------------------------
; DATOS resto_A8BB: lo apuntan con el banco puesto p05:A8A5 (0xA8BB); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p05:A8A5 (4 bytes)
;   0xa8bb..0xa8bf  (4 bytes)
DATA_resto_A8BB:
	defb 002h,000h,006h,004h	; a8bb

; ======================================================================
; CODIGO 0xa8bf..0xaa1d  (350 bytes)
; ======================================================================


L_A8BF:
	ld a,(ix+00dh)		;a8bf
	and 0feh		;a8c2
	cp 004h		;a8c4
	ld a,006h		;a8c6
	jr z,L_A8CC		;a8c8
	ld a,004h		;a8ca
L_A8CC:
	ld (ix+00dh),a		;a8cc
	jp L_A777		;a8cf
L_A8D2:
	call L_B4E1		;a8d2
	ld a,b			;a8d5
	add a,a			;a8d6
	add a,008h		;a8d7
	inc a			;a8d9
	ld (ix+00dh),a		;a8da
	ret			;a8dd
L_A8DE:
	call L_A8ED		;a8de
	ret nz			;a8e1
	ld (ix+016h),001h		;a8e2
	ld (ix+001h),008h		;a8e6
	jp L_A777		;a8ea
L_A8ED:
	dec (ix+00eh)		;a8ed
	ret z			;a8f0
	ld a,(ix+003h)		;a8f1
	ld b,(ix+018h)		;a8f4
	ld (ix+003h),b		;a8f7
	ld (ix+018h),a		;a8fa
	ld a,(ix+005h)		;a8fd
	ld b,(ix+019h)		;a900
	ld (ix+005h),b		;a903
	ld (ix+019h),a		;a906
	ret			;a909
L_A90A:
	call L_A8ED		;a90a
	ret nz			;a90d
	ld (ix+016h),001h		;a90e
	ld (ix+001h),007h		;a912
	jp L_A777		;a916
L_A919:
	dec (ix+00eh)		;a919
	jr z,L_A92A		;a91c
	ld a,(ix+00eh)		;a91e
	and 003h		;a921
	ret z			;a923
	cp 002h		;a924
	ret nz			;a926
	jp 09b06h		;a927   ; p04:9B06
L_A92A:
	ld a,(ix+01ah)		;a92a
	ld (ix+001h),a		;a92d
	call 090c8h		;a930
	ld a,(ix+00fh)		;a933
	and a			;a936
	jp z,L_A844		;a937
	ld a,(ix+01bh)		;a93a
	ld (ix+00dh),a		;a93d
	jp L_A83F		;a940
L_A943:
	call L_A638		;a943
	ld a,001h		;a946
	ld (0cb3ch),a		;a948
	ld (ix+00eh),018h		;a94b
	ld de,00100h		;a94f
	ld a,(ix+003h)		;a952
	cp 040h		;a955
	jr c,L_A968		;a957
	cp 090h		;a959
	jr nc,L_A968		;a95b
	ld a,(ix+005h)		;a95d
	cp 028h		;a960
	jr c,L_A980		;a962
	cp 098h		;a964
	jr nc,L_A980		;a966
L_A968:
	ld (ix+00ch),002h		;a968
	ld b,006h		;a96c
	ld a,(ix+005h)		;a96e
	cp 080h		;a971
	jr c,L_A97A		;a973
	call nc,04442h		;a975   ; de_negativo: DE = -DE
	ld b,004h		;a978
L_A97A:
	ld (ix+00dh),b		;a97a
	jp 08097h		;a97d
L_A980:
	ld (ix+00ch),001h		;a980
	ld b,002h		;a984
	ld a,(ix+003h)		;a986
	cp 060h		;a989
	jr c,L_A992		;a98b
	call 04442h		;a98d   ; de_negativo: DE = -DE
	ld b,000h		;a990
L_A992:
	ld (ix+00dh),b		;a992
	jp 080a7h		;a995
L_A998:
	dec (ix+00eh)		;a998
	jp nz,086deh		;a99b
	xor a			;a99e
	ld (ix+00ch),a		;a99f
	ld (ix+00eh),020h		;a9a2
	ld (ix+00dh),010h		;a9a6
	call L_A9B9		;a9aa
	call 06c1bh		;a9ad
	ld hl,06c37h		;a9b0
	call 07c85h		;a9b3
	jp L_A638		;a9b6
L_A9B9:
	ld a,(ix+003h)		;a9b9
	ld b,a			;a9bc
	sub 040h		;a9bd
	cp 058h		;a9bf
	ret nc			;a9c1
	ld a,(ix+005h)		;a9c2
	cp 030h		;a9c5
	ld c,018h		;a9c7
	jr c,L_A9E0		;a9c9
	cp 048h		;a9cb
	ld c,048h		;a9cd
	jr c,L_A9E0		;a9cf
	cp 098h		;a9d1
	ld c,0a8h		;a9d3
	jr nc,L_A9E0		;a9d5
	cp 078h		;a9d7
	ret c			;a9d9
	ld a,b			;a9da
	sub 070h		;a9db
	cp 010h		;a9dd
	ret nc			;a9df
L_A9E0:
	ld (ix+005h),c		;a9e0
	ret			;a9e3
L_A9E4:
	dec (ix+00eh)		;a9e4
	ret nz			;a9e7
	call 06bach		;a9e8   ; p01:6BAC
	ld (ix+011h),000h		;a9eb
	ld b,000h		;a9ef
	ld a,(0cb03h)		;a9f1
	cp 040h		;a9f4
	jr c,L_A9FE		;a9f6
	inc b			;a9f8
	cp 080h		;a9f9
	jr c,L_A9FE		;a9fb
	inc b			;a9fd
L_A9FE:
	ld a,(ix+003h)		;a9fe
	ld c,000h		;aa01
	cp 040h		;aa03
	jr c,L_AA0D		;aa05
	inc c			;aa07
	cp 080h		;aa08
	jr c,L_AA0D		;aa0a
	inc c			;aa0c
L_AA0D:
	ld a,b			;aa0d
	add a,a			;aa0e
	add a,b			;aa0f
	add a,c			;aa10
	ld hl,0aa1dh		;aa11
	call 0423eh		;aa14   ; suma_a_hl: HL = HL + A
	ld e,(hl)			;aa17
	ld d,002h		;aa18
	jp L_A666		;aa1a

; ----------------------------------------------------------------------
; DATOS resto_AA1D: lo apuntan con el banco puesto p05:AA11 (0xAA1D); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p05:AA11 (9 bytes)
;   0xaa1d..0xaa26  (9 bytes)
DATA_resto_AA1D:
	defb 050h,090h,050h,090h,010h,010h,050h,010h,050h	; aa1d  P.P...P.P

; ======================================================================
; CODIGO 0xaa26..0xaa4d  (39 bytes)
; ======================================================================


L_AA26:
	ld c,020h		;aa26
	call L_A675		;aa28
	ret nc			;aa2b
	ld (ix+00eh),010h		;aa2c
	inc (ix+00dh)		;aa30
	jp 06c1bh		;aa33
L_AA36:
	dec (ix+00eh)		;aa36
	ret nz			;aa39
	xor a			;aa3a
	ld (0cb3ch),a		;aa3b
	ld (ix+001h),020h		;aa3e
	ret			;aa42
L_AA43:
	ld de,0d8a0h		;aa43
	ld a,(de)			;aa46
	and a			;aa47
	ret z			;aa48
	dec a			;aa49
	call 0424dh		;aa4a   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_AA4D: 6 destinos del despachador p00:424D (call en p05:AA4A, el
;   indice en A): AA90, AAFB, AB95, AA7B, AA59, AA64; lo leen p05:AA4A (12
;   bytes)
;   0xaa4d..0xaa59  (12 bytes)
DATA_tabla_AA4D:
	defw 0aa90h,0aafbh,0ab95h,0aa7bh,0aa59h,0aa64h	; aa4d

; ======================================================================
; CODIGO 0xaa59..0xaaef  (150 bytes)
; ======================================================================


L_AA59:
	ex de,hl			;aa59
	inc hl			;aa5a
	dec (hl)			;aa5b
	ret nz			;aa5c
	ld (hl),010h		;aa5d
	dec hl			;aa5f
	inc (hl)			;aa60
	jp 08b90h		;aa61
L_AA64:
	ex de,hl			;aa64
	inc hl			;aa65
	dec (hl)			;aa66
	ret nz			;aa67
	dec hl			;aa68
	ld (hl),000h		;aa69
	ld c,028h		;aa6b
	ld de,06070h		;aa6d
	call 07ac0h		;aa70
	ld a,001h		;aa73
	ld (0d4ebh),a		;aa75
	jp 06c3bh		;aa78
L_AA7B:
	ex de,hl			;aa7b
	inc (hl)			;aa7c
	inc hl			;aa7d
	ld (hl),010h		;aa7e
	ld ix,0d800h		;aa80
	ld (ix+000h),00bh		;aa84
	call 08c65h		;aa88
	ld (ix+000h),000h		;aa8b
	ret			;aa8f
L_AA90:
	ex de,hl			;aa90
	inc (hl)			;aa91
	inc hl			;aa92
	ld (hl),040h		;aa93
	inc hl			;aa95
	xor a			;aa96
	ld (hl),a			;aa97
	ld (0d8ach),a		;aa98
	ld hl,0d800h		;aa9b
	ld bc,0007fh		;aa9e
	call 04236h		;aaa1   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	ld hl,0d7d6h		;aaa4
	set 5,(hl)		;aaa7
	ld hl,0aaefh		;aaa9
	ld ix,0d800h		;aaac
	ld bc,00400h		;aab0
L_AAB3:
	ld (ix+000h),00bh		;aab3
	ld a,(hl)			;aab7
	ld (ix+003h),a		;aab8
	inc hl			;aabb
	ld a,(hl)			;aabc
	ld (ix+005h),a		;aabd
	inc hl			;aac0
	ld a,(hl)			;aac1
	ld (ix+00dh),a		;aac2
	inc hl			;aac5
	ld (ix+01ah),c		;aac6
	ld de,(0ca50h)		;aac9
	ld (ix+00ah),e		;aacd
	ld (ix+00bh),d		;aad0
	ld (ix+010h),020h		;aad3
	ld de,00020h		;aad7
	add ix,de		;aada
	inc c			;aadc
	djnz L_AAB3		;aadd
	xor a			;aadf
	ld (0d800h),a		;aae0
	ld (0d820h),a		;aae3
	ld (0d840h),a		;aae6
	ld (0d860h),a		;aae9
	jp 05019h		;aaec   ; sprites_de_8773:

; ----------------------------------------------------------------------
; DATOS resto_AAEF: lo apuntan con el banco puesto p05:AAA9 (0xAAEF); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p05:AAA9 (12 bytes)
;   0xaaef..0xaafb  (12 bytes)
DATA_resto_AAEF:
	defb 01ch,060h,009h,0b0h,060h,008h,070h,024h,00bh,070h,09ch,00ah	; aaef  .`..`.p$.p..

; ======================================================================
; CODIGO 0xaafb..0xab08  (13 bytes)
; ======================================================================


L_AAFB:
	ld hl,06bcch		;aafb
	call 086d5h		;aafe
	ld de,0d8ach		;ab01
	ld a,(de)			;ab04
	call 0424dh		;ab05   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_AB08: 8 destinos del despachador p00:424D (call en p05:AB05, el
;   indice en A): AB18, AB23, AB32, AB4A, AB53, AB68, AB74, AB80; lo leen
;   p05:AB05 (16 bytes)
;   0xab08..0xab18  (16 bytes)
DATA_tabla_AB08:
	defw 0ab18h,0ab23h,0ab32h,0ab4ah,0ab53h,0ab68h,0ab74h,0ab80h	; ab08

; ======================================================================
; CODIGO 0xab18..0xabe7  (207 bytes)
; ======================================================================


L_AB18:
	ex de,hl			;ab18
	ld a,001h		;ab19
	ld (0cb3ch),a		;ab1b
	inc (hl)			;ab1e
	inc hl			;ab1f
	ld (hl),020h		;ab20
	ret			;ab22
L_AB23:
	ex de,hl			;ab23
	inc hl			;ab24
	dec (hl)			;ab25
	ret nz			;ab26
	ld (hl),040h		;ab27
	dec hl			;ab29
	inc (hl)			;ab2a
	call 06b95h		;ab2b
	xor a			;ab2e
	jp 079e9h		;ab2f
L_AB32:
	push de			;ab32
	call 079f1h		;ab33
	pop hl			;ab36
	inc hl			;ab37
	dec (hl)			;ab38
	ret nz			;ab39
	ld (hl),020h		;ab3a
	dec hl			;ab3c
	inc (hl)			;ab3d
	ld a,001h		;ab3e
	ld (0e25ah),a		;ab40
	call 079fah		;ab43
	xor a			;ab46
	jp 06250h		;ab47
L_AB4A:
	ex de,hl			;ab4a
	inc hl			;ab4b
	dec (hl)			;ab4c
	ret nz			;ab4d
	dec hl			;ab4e
	inc (hl)			;ab4f
	jp 06bd0h		;ab50
L_AB53:
	xor a			;ab53
	ld (0e25ah),a		;ab54
	ex de,hl			;ab57
	inc (hl)			;ab58
	inc hl			;ab59
	ld (hl),008h		;ab5a
	ld a,00bh		;ab5c
	ld (0d820h),a		;ab5e
	ld (0d840h),a		;ab61
	ld (0d860h),a		;ab64
	ret			;ab67
L_AB68:
	ex de,hl			;ab68
	inc hl			;ab69
	dec (hl)			;ab6a
	ret nz			;ab6b
	dec hl			;ab6c
	inc (hl)			;ab6d
	ld de,00810h		;ab6e
	jp 061ceh		;ab71
L_AB74:
	call 06247h		;ab74
	ret nz			;ab77
	call 079c7h		;ab78
	ld hl,0d8ach		;ab7b
	inc (hl)			;ab7e
	ret			;ab7f
L_AB80:
	ld a,003h		;ab80
	ld (0d8a0h),a		;ab82
	xor a			;ab85
	ld (0cb3ch),a		;ab86
	ld a,00bh		;ab89
	ld (0d800h),a		;ab8b
	ld ix,0d800h		;ab8e
	jp 08685h		;ab92
L_AB95:
	push de			;ab95
	call L_ABD6		;ab96
	pop hl			;ab99
	ret z			;ab9a
	dec c			;ab9b
	jr nz,L_ABA2		;ab9c
	inc de			;ab9e
	ld a,(de)			;ab9f
	and a			;aba0
	ret nz			;aba1
L_ABA2:
	inc hl			;aba2
	dec (hl)			;aba3
	ret nz			;aba4
	ld (hl),004h		;aba5
	inc hl			;aba7
	inc (hl)			;aba8
	ld a,(hl)			;aba9
	and 01fh		;abaa
	jr z,$+85		;abac
	call 08079h		;abae
	ex de,hl			;abb1
	ld hl,0d800h		;abb2
	ld bc,00400h		;abb5
L_ABB8:
	push bc			;abb8
	push hl			;abb9
	ld a,(hl)			;abba
	and a			;abbb
	jr z,L_ABCC		;abbc
	inc hl			;abbe
	ld a,(hl)			;abbf
	and a			;abc0
	jr nz,L_ABCC		;abc1
	push hl			;abc3
	call L_ABE3		;abc4
	pop hl			;abc7
	jr nc,L_ABCC		;abc8
	ld (hl),001h		;abca
L_ABCC:
	pop hl			;abcc
	ld bc,00020h		;abcd
	add hl,bc			;abd0
	pop bc			;abd1
	inc c			;abd2
	djnz L_ABB8		;abd3
	ret			;abd5
L_ABD6:
	call 08751h		;abd6   ; p04:8751
	ld a,c			;abd9
	and a			;abda
	ret nz			;abdb
	ld a,004h		;abdc
	ld (0d8a0h),a		;abde
	xor a			;abe1
	ret			;abe2
L_ABE3:
	ld a,c			;abe3
	call 0424dh		;abe4   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_ABE7: 4 destinos del despachador p00:424D (call en p05:ABE4, el
;   indice en A): ABEF, ABF4, ABF8, ABFD; lo leen p05:ABE4 (8 bytes)
;   0xabe7..0xabef  (8 bytes)
DATA_tabla_ABE7:
	defw 0abefh,0abf4h,0abf8h,0abfdh	; abe7  -> L_ABEF L_ABF4 L_ABF8 L_ABFD

; ======================================================================
; CODIGO 0xabef..0xac48  (89 bytes)
; ======================================================================


L_ABEF:
	ld a,e			;abef
	cp 060h		;abf0
	ccf			;abf2
	ret			;abf3
L_ABF4:
	ld a,e			;abf4
	cp 080h		;abf5
	ret			;abf7
L_ABF8:
	ld a,d			;abf8
	cp 050h		;abf9
	ccf			;abfb
	ret			;abfc
L_ABFD:
	ld a,d			;abfd
	cp 070h		;abfe
	ret			;ac00
L_AC01:
	ld ix,0d800h		;ac01
	ld b,004h		;ac05
L_AC07:
	ld a,(ix+000h)		;ac07
	and a			;ac0a
	jr z,L_AC17		;ac0b
	ld a,(ix+001h)		;ac0d
	sub 003h		;ac10
	cp 002h		;ac12
	call c,08759h		;ac14   ; p04:8759
L_AC17:
	ld de,00020h		;ac17
	add ix,de		;ac1a
	djnz L_AC07		;ac1c
	ret			;ac1e
L_AC1F:
	ld a,(0ca76h)		;ac1f   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 029h		;ac22
	jp nz,086a4h		;ac24
	ld hl,06bcch		;ac27
	call 086d5h		;ac2a
	ld a,(ix+001h)		;ac2d
	ld hl,0ac48h		;ac30
	call 0424eh		;ac33   ; salta_por_tabla: salta a la palabra A de la tabla de HL
	call 08082h		;ac36
	ld a,(0ca4bh)		;ac39   ; lee la sala de la zona
	cp 002h		;ac3c
	ret c			;ac3e
	ld a,(ix+001h)		;ac3f
	cp 00fh		;ac42
	ret nc			;ac44
	jp 08671h		;ac45

; ----------------------------------------------------------------------
; DATOS resto_AC48: lo apuntan con el banco puesto p05:AC30 (0xAC48); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p05:AC30 (38 bytes)
;   0xac48..0xac6e  (38 bytes)
DATA_resto_AC48:
	defb 06eh,0ach,095h,0ach,0c1h,0ach,0dfh,0ach,0fdh,0ach,00dh,0adh,019h,0adh,095h,0ach	; ac48  n...............
	defb 0c1h,0ach,02fh,0adh,052h,0adh,074h,0adh,084h,0adh,0d9h,0adh,0f4h,0aeh,032h,0afh	; ac58  ../.R.t.......2.
	defb 059h,0afh,086h,0afh,090h,0afh	; ac68

; ======================================================================
; CODIGO 0xac6e..0xadd1  (355 bytes)
; ======================================================================


L_AC6E:
	ld a,(0ca4bh)		;ac6e   ; lee la sala de la zona
	cp 002h		;ac71
	ret c			;ac73
	ld a,001h		;ac74
	ld (0cb3ch),a		;ac76
	inc a			;ac79
	call L_AECB		;ac7a
	ld hl,0d7d1h		;ac7d
	set 0,(hl)		;ac80
	call 086c2h		;ac82
	jp L_AD80		;ac85
L_AC88:
	call 086deh		;ac88
	ret nz			;ac8b
	call 08100h		;ac8c
	jp z,06c63h		;ac8f
	jp 06c67h		;ac92   ; p01:6C67
L_AC95:
	call L_AC88		;ac95
	ld l,007h		;ac98
	ld e,064h		;ac9a
	ld b,001h		;ac9c
L_AC9E:
	ld h,(ix+00bh)		;ac9e
	ld d,(ix+005h)		;aca1
	call L_ACAB		;aca4
	ret nc			;aca7
	jp L_AD80		;aca8
L_ACAB:
	exx			;acab
	call L_AE5C		;acac
	exx			;acaf
	ld a,h			;acb0
	cp l			;acb1
	jr nz,L_ACBF		;acb2
	ld a,d			;acb4
	sub e			;acb5
	cp 008h		;acb6
	ret nc			;acb8
	ld a,b			;acb9
	call L_AECB		;acba
	scf			;acbd
	ret			;acbe
L_ACBF:
	or a			;acbf
	ret			;acc0
L_ACC1:
	call L_AC88		;acc1
	ld h,(ix+00ah)		;acc4
	ld l,002h		;acc7
	ld d,(ix+003h)		;acc9
	ld e,038h		;accc
	ld b,001h		;acce
	call L_ACAB		;acd0
	ret nc			;acd3
	ld (ix+00ch),000h		;acd4
	ld (ix+00eh),010h		;acd8
	jp L_AD80		;acdc
L_ACDF:
	ld a,(ix+00eh)		;acdf
	and a			;ace2
	jr z,L_ACEF		;ace3
	dec (ix+00eh)		;ace5
	ret nz			;ace8
	ld de,00350h		;ace9
	jp 061ceh		;acec
L_ACEF:
	call 06247h		;acef
	ret nz			;acf2
	call 079c7h		;acf3
	ld (ix+00ch),003h		;acf6
	jp L_AD80		;acfa
L_ACFD:
	call L_AC88		;acfd
	ld a,(ix+003h)		;ad00
	cp 070h		;ad03
	ret c			;ad05
	ld a,003h		;ad06
	call L_AECB		;ad08
	jr L_AD80		;ad0b
L_AD0D:
	call L_AC88		;ad0d
	ld l,008h		;ad10
	ld e,064h		;ad12
	ld b,000h		;ad14
	jp L_AC9E		;ad16
L_AD19:
	call L_AC88		;ad19
	ld l,003h		;ad1c
	ld e,064h		;ad1e
	ld b,002h		;ad20
	ld h,(ix+00ah)		;ad22
	ld d,(ix+003h)		;ad25
	call L_ACAB		;ad28
	ret nc			;ad2b
	jp L_AD80		;ad2c
L_AD2F:
	ld a,(ix+00eh)		;ad2f
	and a			;ad32
	jr z,L_AD3F		;ad33
	dec (ix+00eh)		;ad35
	ret nz			;ad38
	ld de,00450h		;ad39
	jp 061ceh		;ad3c
L_AD3F:
	call 06247h		;ad3f
	ret nz			;ad42
	call 079c7h		;ad43
	call 06a87h		;ad46   ; p01:6A87
	ld de,00550h		;ad49
L_AD4C:
	call 061ceh		;ad4c
	jp L_AD80		;ad4f
L_AD52:
	call 06247h		;ad52
	ret nz			;ad55
	call 079c7h		;ad56
	call 08685h		;ad59
	xor a			;ad5c
	ld (0cac8h),a		;ad5d
	inc a			;ad60
	ld (0dff0h),a		;ad61
	ld (0cae0h),a		;ad64
	ld (0cae2h),a		;ad67
	ld a,010h		;ad6a
	ld (0dff2h),a		;ad6c
	call 07a8dh		;ad6f   ; p01:7A8D
	jr L_AD80		;ad72
L_AD74:
	ld (ix+016h),001h		;ad74
	ld a,003h		;ad78
	call L_AECB		;ad7a
	call 05929h		;ad7d   ; sala_especial_a_e500: la sala especial de la ficha IX (sus bytes 10-11) a 0xE500
L_AD80:
	inc (ix+001h)		;ad80
	ret			;ad83
L_AD84:
	call L_ADB2		;ad84
	ld a,b			;ad87
	and a			;ad88
	jr nz,L_AD98		;ad89
	ld hl,0d8a3h		;ad8b
	ld (hl),001h		;ad8e
	push hl			;ad90
	call L_ADAC		;ad91
	pop hl			;ad94
	ld (hl),000h		;ad95
	ret			;ad97
L_AD98:
	ld a,b			;ad98
	ld hl,ladcfh		;ad99
	call 043f6h		;ad9c   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld (ix+019h),l		;ad9f
	ld (ix+01ah),h		;ada2
	ld (ix+001h),00dh		;ada5
	jp L_AE9E		;ada9
L_ADAC:
	call L_AC88		;adac
	jp L_B125		;adaf
L_ADB2:
	ld b,000h		;adb2
	ld a,(0ca51h)		;adb4
	cp (ix+00bh)		;adb7
	jr nz,L_ADC3		;adba
	cp 008h		;adbc
	ld b,003h		;adbe
	ret z			;adc0
	inc b			;adc1
	ret			;adc2
L_ADC3:
	ld a,(0ca50h)		;adc3
	cp (ix+00ah)		;adc6
	ret nz			;adc9
	cp 002h		;adca
	ld b,001h		;adcc
	ret z			;adce
L_ADCF:
	inc b			;adcf
	ret			;add0

; ----------------------------------------------------------------------
; DATOS sin identificar  0xadd1..0xadd9  (8 bytes)
DATA_ADD1:
	defb 000h,06eh,0c0h,06eh,06eh,000h,06eh,0c0h	; add1  .n.nn.n.

; ======================================================================
; CODIGO 0xadd9..0xae54  (123 bytes)
; ======================================================================


L_ADD9:
	call L_AE5C		;add9
	jp nc,L_AD80		;addc
	call L_AC88		;addf
	ld a,(ix+01bh)		;ade2
	call L_AE36		;ade5
	jr c,L_AE11		;ade8
	ld a,(ix+01bh)		;adea
	cp 002h		;aded
	jr c,L_AE06		;adef
	ld a,(ix+00ah)		;adf1
	cp 007h		;adf4
	ld b,03ch		;adf6
	jr z,L_ADFC		;adf8
	ld b,06ch		;adfa
L_ADFC:
	ld a,(ix+005h)		;adfc
	sub b			;adff
	cp 008h		;ae00
	ret nc			;ae02
	jp L_AE9E		;ae03
L_AE06:
	ld a,(ix+003h)		;ae06
	sub 06eh		;ae09
	cp 008h		;ae0b
	ret nc			;ae0d
	jp L_AE9E		;ae0e
L_AE11:
	ld a,(ix+01bh)		;ae11
	cp 002h		;ae14
	jr c,L_AE27		;ae16
	ld a,(ix+003h)		;ae18
	sub (ix+019h)		;ae1b
	ld a,000h		;ae1e
	jp nc,L_AECB		;ae20
	inc a			;ae23
	jp L_AECB		;ae24
L_AE27:
	ld a,(ix+005h)		;ae27
	sub (ix+01ah)		;ae2a
	ld a,002h		;ae2d
	jp nc,L_AECB		;ae2f
	inc a			;ae32
	jp L_AECB		;ae33
L_AE36:
	ld de,0ae54h		;ae36
	ld hl,0d8a3h		;ae39
	ld (hl),001h		;ae3c
	push hl			;ae3e
	ex de,hl			;ae3f
	call 043f6h		;ae40   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld a,(ix+003h)		;ae43
	add a,l			;ae46
	ld l,a			;ae47
	ld a,(ix+005h)		;ae48
	add a,h			;ae4b
	ld h,a			;ae4c
	call 07f3dh		;ae4d
	pop hl			;ae50
	ld (hl),000h		;ae51
	ret			;ae53

; ----------------------------------------------------------------------
; DATOS resto_AE54: lo apuntan con el banco puesto p05:AE36 (0xAE54); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p05:AE36 (8 bytes)
;   0xae54..0xae5c  (8 bytes)
DATA_resto_AE54:
	defb 0f0h,000h,008h,000h,000h,0f5h,000h,00ch	; ae54  ........

; ======================================================================
; CODIGO 0xae5c..0xaeec  (144 bytes)
; ======================================================================


L_AE5C:
	ld de,020c1h		;ae5c
	ld hl,008b9h		;ae5f
	call L_AE6B		;ae62
	ret c			;ae65
	call 05929h		;ae66   ; sala_especial_a_e500: la sala especial de la ficha IX (sus bytes 10-11) a 0xE500
	or a			;ae69
	ret			;ae6a
L_AE6B:
	ld a,(ix+003h)		;ae6b
	cp d			;ae6e
	jr c,L_AE84		;ae6f
	cp e			;ae71
	jr nc,L_AE8D		;ae72
	ld a,(ix+005h)		;ae74
	cp h			;ae77
	jr c,L_AE95		;ae78
	cp l			;ae7a
	ret c			;ae7b
	inc (ix+00bh)		;ae7c
	ld (ix+005h),h		;ae7f
	jr L_AE9C		;ae82
L_AE84:
	inc (ix+00ah)		;ae84
	dec e			;ae87
	ld (ix+003h),e		;ae88
	jr L_AE9C		;ae8b
L_AE8D:
	dec (ix+00ah)		;ae8d
	ld (ix+003h),d		;ae90
	jr L_AE9C		;ae93
L_AE95:
	dec (ix+00bh)		;ae95
	dec l			;ae98
	ld (ix+005h),l		;ae99
L_AE9C:
	or a			;ae9c
	ret			;ae9d
L_AE9E:
	ld de,00000h		;ae9e
	ld a,(ix+003h)		;aea1
	sub (ix+019h)		;aea4
	jr nc,L_AEAC		;aea7
	inc d			;aea9
	neg		;aeaa
L_AEAC:
	ld b,a			;aeac
	ld a,(ix+005h)		;aead
	sub (ix+01ah)		;aeb0
	jr nc,L_AEB8		;aeb3
	inc e			;aeb5
	neg		;aeb6
L_AEB8:
	cp b			;aeb8
	jr nc,L_AEC4		;aeb9
	ld a,d			;aebb
	and a			;aebc
	ld a,000h		;aebd
	jr z,L_AECB		;aebf
	inc a			;aec1
	jr L_AECB		;aec2
L_AEC4:
	ld a,e			;aec4
	and a			;aec5
	ld a,002h		;aec6
	jr z,L_AECB		;aec8
	inc a			;aeca
L_AECB:
	ld (ix+01bh),a		;aecb
	ld b,a			;aece
	add a,a			;aecf
	ld (ix+00dh),a		;aed0
	ld a,b			;aed3
	ld hl,0aeech		;aed4
	call 043f6h		;aed7   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	xor a			;aeda
	ld (ix+007h),l		;aedb
	ld (ix+006h),a		;aede
	ld (ix+009h),h		;aee1
	ld (ix+008h),a		;aee4
	ld (ix+00ch),003h		;aee7
	ret			;aeeb

; ----------------------------------------------------------------------
; DATOS resto_AEEC: lo apuntan con el banco puesto p05:AED4 (0xAEEC); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p05:AED4 (8 bytes)
;   0xaeec..0xaef4  (8 bytes)
DATA_resto_AEEC:
	defb 0fah,000h,006h,000h,000h,0fah,000h,006h	; aeec  ........

; ======================================================================
; CODIGO 0xaef4..0xaf18  (36 bytes)
; ======================================================================


L_AEF4:
	call L_AC88		;aef4
	call L_ADB2		;aef7
	ld a,b			;aefa
	and a			;aefb
	jp nz,L_AD98		;aefc
	ld d,(ix+003h)		;aeff
	ld e,(ix+005h)		;af02
	ld a,(ix+01bh)		;af05
	ld hl,0af18h		;af08
	call 0424eh		;af0b   ; salta_por_tabla: salta a la palabra A de la tabla de HL
	ret nc			;af0e
	xor a			;af0f
	ld (0cb3ch),a		;af10
	ld (ix+001h),00ch		;af13
	ret			;af17

; ----------------------------------------------------------------------
; DATOS resto_AF18: lo apuntan con el banco puesto p05:AF08 (0xAF18); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p05:AF08 (8 bytes)
;   0xaf18..0xaf20  (8 bytes)
DATA_resto_AF18:
	defb 020h,0afh,024h,0afh,029h,0afh,02dh,0afh	; af18   .$.).-.

; ======================================================================
; CODIGO 0xaf20..0xb032  (274 bytes)
; ======================================================================


L_AF20:
	ld a,d			;af20
	cp 070h		;af21
	ret			;af23
L_AF24:
	ld a,d			;af24
	cp 070h		;af25
	ccf			;af27
	ret			;af28
L_AF29:
	ld a,e			;af29
	cp 070h		;af2a
	ret			;af2c
L_AF2D:
	ld a,e			;af2d
	cp 070h		;af2e
	ccf			;af30
	ret			;af31
L_AF32:
	ld (ix+00dh),008h		;af32
	xor a			;af36
	ld (ix+00ch),a		;af37
	ld (0dff0h),a		;af3a
	inc a			;af3d
	ld (0e258h),a		;af3e
	ld (0d4f2h),a		;af41
	inc a			;af44
	ld (0cae0h),a		;af45
	call 07a0ah		;af48
	call 06c1bh		;af4b
	ld (ix+003h),080h		;af4e
	ld (ix+005h),060h		;af52
	jp L_AD80		;af56
L_AF59:
	call 08100h		;af59
	ret nz			;af5c
	ld a,(0cb05h)		;af5d
	sub (ix+005h)		;af60
	jr nc,L_AF67		;af63
	neg		;af65
L_AF67:
	cp 020h		;af67
	ret nc			;af69
	ld a,(0cb03h)		;af6a
	add a,028h		;af6d
	sub (ix+003h)		;af6f
	cp 050h		;af72
	ret nc			;af74
	ld a,001h		;af75
	ld (0cb3ch),a		;af77
	ld hl,06bach		;af7a
	call 07c85h		;af7d
	ld de,00610h		;af80
	jp L_AD4C		;af83
L_AF86:
	call 06247h		;af86
	ret nz			;af89
	call 079c7h		;af8a
	jp L_AD80		;af8d
L_AF90:
	ld (ix+001h),020h		;af90
	xor a			;af94
	ld (0d4f2h),a		;af95
	ld a,(0ca4bh)		;af98   ; lee la sala de la zona
	cp 002h		;af9b
	ret nz			;af9d
	ld a,002h		;af9e
	ld (0d500h),a		;afa0
	ret			;afa3
L_AFA4:
	ld a,(0ca77h)		;afa4
	and a			;afa7
	jp nz,086a4h		;afa8
	ld hl,0d8a7h		;afab
	ld a,(hl)			;afae
	and a			;afaf
	jp z,L_AFCB		;afb0
	cp 002h		;afb3
	jr nz,L_AFBD		;afb5
	dec (hl)			;afb7
	call L_B161		;afb8
	jr L_AFC5		;afbb
L_AFBD:
	ld a,(0ca41h)		;afbd
	and a			;afc0
	jr z,L_AFC5		;afc1
	ld (hl),002h		;afc3
L_AFC5:
	ld a,(ix+018h)		;afc5
	and a			;afc8
	jr nz,L_AFE6		;afc9
L_AFCB:
	ld a,(ix+01fh)		;afcb
	and a			;afce
	jr z,L_AFDA		;afcf
	dec (ix+01fh)		;afd1
	jr nz,L_AFDA		;afd4
	ld (ix+016h),001h		;afd6
L_AFDA:
	ld a,(ix+001h)		;afda
	ld hl,0b032h		;afdd
	call 0424eh		;afe0   ; salta_por_tabla: salta a la palabra A de la tabla de HL
	call 08082h		;afe3
L_AFE6:
	ld a,(ix+001h)		;afe6
	sub 003h		;afe9
	cp 004h		;afeb
	call c,08671h		;afed
	ld a,(ix+001h)		;aff0
	cp 009h		;aff3
	jp nc,08728h		;aff5
	ld a,(ix+018h)		;aff8
	and a			;affb
	jp z,08728h		;affc
	call L_B020		;afff
	dec (ix+018h)		;b002
	call z,L_B00B		;b005
	jp 08739h		;b008
L_B00B:
	ld (ix+01fh),008h		;b00b
	ld (ix+016h),000h		;b00f
	ld a,(ix+015h)		;b013
	ld (ix+00ch),a		;b016
	ld a,(ix+01dh)		;b019
	ld (ix+00dh),a		;b01c
	ret			;b01f
L_B020:
	ld b,(ix+01dh)		;b020
	ld a,(ix+018h)		;b023
	sub 002h		;b026
	cp 003h		;b028
	jr nc,L_B02D		;b02a
	inc b			;b02c
L_B02D:
	ld a,b			;b02d
	ld (ix+00dh),a		;b02e
	ret			;b031

; ----------------------------------------------------------------------
; DATOS resto_B032: lo apuntan con el banco puesto p05:AFDD (0xB032); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p05:AFDD (14 bytes)
;   0xb032..0xb040  (14 bytes)
DATA_resto_B032:
	defb 040h,0b0h,05bh,0b0h,080h,0b0h,08dh,0b0h,002h,0b1h,09fh,0b1h,07dh,0b2h	; b032  @.[.........}.

; ======================================================================
; CODIGO 0xb040..0xb0fa  (186 bytes)
; ======================================================================


L_B040:
	ld (ix+00eh),030h		;b040
	ld a,001h		;b044
	ld (0cb3ch),a		;b046
	ld hl,0d7d7h		;b049
	set 1,(hl)		;b04c
	ld hl,00000h		;b04e
	ld (0ca19h),hl		;b051   ; guarda la musica pendiente: la rutina que la pide (16 bits)
	xor a			;b054
	call 079e9h		;b055
	jp L_B0B5		;b058
L_B05B:
	dec (ix+00eh)		;b05b
	ld a,(ix+00eh)		;b05e
	cp 020h		;b061
	ret nc			;b063
	call 079f1h		;b064
	ld a,(ix+00eh)		;b067
	and a			;b06a
	ret nz			;b06b
	call 079fah		;b06c
	call 06b95h		;b06f
	ld a,001h		;b072
	ld (0d8a7h),a		;b074
	ld (0e25ah),a		;b077
	call 06250h		;b07a
	jp L_B0B5		;b07d
L_B080:
	xor a			;b080
	ld (0e25ah),a		;b081
	ld (0cb3ch),a		;b084
	call 08685h		;b087
	jp L_B0B5		;b08a
L_B08D:
	call L_B0CB		;b08d
	ld a,(ix+01fh)		;b090
	and a			;b093
	jr nz,L_B09A		;b094
	ld (ix+016h),001h		;b096
L_B09A:
	ld (ix+01ch),010h		;b09a
	call L_B161		;b09e
	ld a,(ix+01bh)		;b0a1
	and a			;b0a4
	jr nz,L_B0B9		;b0a5
	call 04256h		;b0a7   ; azar: A = un numero al azar (0xCA03 rotado mas R)
	and 007h		;b0aa
	ld (ix+00dh),a		;b0ac
	call L_A777		;b0af
	call L_B29D		;b0b2
L_B0B5:
	inc (ix+001h)		;b0b5
	ret			;b0b8
L_B0B9:
	call 05955h		;b0b9   ; sala_de_zona_a_e500: la sala de la ficha IX a 0xE500, de una lista y unos bloques que dependen de la zona
L_B0BC:
	ld a,(ix+01bh)		;b0bc
	dec a			;b0bf
	add a,a			;b0c0
	ld (ix+00dh),a		;b0c1
	ld (ix+001h),005h		;b0c4
	jp L_A777		;b0c8
L_B0CB:
	call 04256h		;b0cb   ; azar: A = un numero al azar (0xCA03 rotado mas R)
	and 03fh		;b0ce
	add a,030h		;b0d0
	ld (ix+01eh),a		;b0d2
	ret			;b0d5
L_B0D6:
	dec (ix+01eh)		;b0d6
	jr z,L_B0CB		;b0d9
	ld a,(ix+01eh)		;b0db
	cp 018h		;b0de
	ret c			;b0e0
	ld a,(0ca03h)		;b0e1   ; lee el contador de cuadros (uno mas en cada interrupcion)
	and 003h		;b0e4
	ret nz			;b0e6
	ld a,(ix+00ah)		;b0e7
	dec a			;b0ea
	add a,a			;b0eb
	ld b,a			;b0ec
	ld a,(ix+00bh)		;b0ed
	sub 007h		;b0f0
	add a,b			;b0f2
	ld hl,0b0fah		;b0f3
	call 043f6h		;b0f6   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	jp (hl)			;b0f9

; ----------------------------------------------------------------------
; DATOS resto_B0FA: lo apuntan con el banco puesto p05:B0F3 (0xB0FA); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p05:B0F3 (8 bytes)
;   0xb0fa..0xb102  (8 bytes)
DATA_resto_B0FA:
	defb 006h,06bh,00eh,06bh,093h,06ch,00ah,06bh	; b0fa  .k.k.l.k

; ======================================================================
; CODIGO 0xb102..0xb2e8  (486 bytes)
; ======================================================================


L_B102:
	call L_B0D6		;b102
	ld a,(ix+01bh)		;b105
	and a			;b108
	jr nz,$-77		;b109
	call L_B125		;b10b
	dec (ix+01ch)		;b10e
	ret nz			;b111
	call 08100h		;b112
	jp nz,L_B295		;b115
	ld (ix+00ch),000h		;b118
	ld (ix+01ch),018h		;b11c
	ld (ix+001h),006h		;b120
	ret			;b124
L_B125:
	call L_A803		;b125
	ld a,(ix+000h)		;b128
	cp 005h		;b12b
	jr nz,L_B137		;b12d
	ld a,(ix+00dh)		;b12f
	and 0feh		;b132
	ld (ix+00dh),a		;b134
L_B137:
	ld a,(ix+003h)		;b137
	sub 018h		;b13a
	cp 0a0h		;b13c
	jr nc,L_B159		;b13e
	ld a,(ix+005h)		;b140
	sub 008h		;b143
	cp 0b0h		;b145
	jr nc,L_B159		;b147
	call 090c8h		;b149
	ld a,c			;b14c
	and a			;b14d
	jp nz,L_A844		;b14e
	ld a,(ix+00eh)		;b151
	and a			;b154
	ret nz			;b155
	jp L_A83F		;b156
L_B159:
	call 0808bh		;b159
	ld (ix+00eh),010h		;b15c
	ret			;b160
L_B161:
	ld h,000h		;b161
	ld c,(ix+00ah)		;b163
	ld b,(ix+00bh)		;b166
	ld de,(0ca50h)		;b169
	ld a,e			;b16d
	cp c			;b16e
	jr z,L_B177		;b16f
	call nc,L_B196		;b171
	call c,L_B199		;b174
L_B177:
	ld a,d			;b177
	cp b			;b178
	jr z,L_B181		;b179
	call c,L_B19C		;b17b
	call nc,L_B193		;b17e
L_B181:
	ld a,h			;b181
	and a			;b182
	ld bc,00300h		;b183
	jr z,L_B18F		;b186
	inc c			;b188
L_B189:
	rra			;b189
	jr c,L_B18F		;b18a
	inc c			;b18c
	djnz L_B189		;b18d
L_B18F:
	ld (ix+01bh),c		;b18f
	ret			;b192
L_B193:
	set 3,h		;b193
	ret			;b195
L_B196:
	set 0,h		;b196
	ret			;b198
L_B199:
	set 1,h		;b199
	ret			;b19b
L_B19C:
	set 2,h		;b19c
	ret			;b19e
L_B19F:
	call L_B0D6		;b19f
	ld a,(ix+01bh)		;b1a2
	and a			;b1a5
	jp z,L_B295		;b1a6
	ld a,(ix+003h)		;b1a9
	sub 018h		;b1ac
	cp 0a7h		;b1ae
	jp nc,L_B247		;b1b0
	ld a,(ix+005h)		;b1b3
	sub 008h		;b1b6
	cp 0b0h		;b1b8
	jp nc,L_B25E		;b1ba
	ld a,(ix+007h)		;b1bd
	and a			;b1c0
	ld a,(ix+01bh)		;b1c1
	jr z,L_B1ED		;b1c4
	cp 003h		;b1c6
	jr c,L_B213		;b1c8
	ld a,(ix+00ah)		;b1ca
	dec a			;b1cd
	ld c,048h		;b1ce
	jr z,L_B1D4		;b1d0
	ld c,068h		;b1d2
L_B1D4:
	ld a,(ix+003h)		;b1d4
	sub c			;b1d7
	cp 010h		;b1d8
	jr nc,L_B213		;b1da
	ld a,(ix+00bh)		;b1dc
	cp 007h		;b1df
	ld a,006h		;b1e1
	jr z,L_B1E7		;b1e3
	ld a,004h		;b1e5
L_B1E7:
	ld (ix+00dh),a		;b1e7
	jp L_A777		;b1ea
L_B1ED:
	cp 003h		;b1ed
	jr nc,L_B213		;b1ef
	ld a,(ix+00bh)		;b1f1
	cp 007h		;b1f4
	ld bc,08c08h		;b1f6
	jr z,L_B1FD		;b1f9
	ld b,02ch		;b1fb
L_B1FD:
	ld a,(ix+005h)		;b1fd
	sub b			;b200
	cp c			;b201
	jr nc,L_B213		;b202
	ld a,(ix+00ah)		;b204
	dec a			;b207
	ld a,002h		;b208
	jr nz,L_B20D		;b20a
	xor a			;b20c
L_B20D:
	ld (ix+00dh),a		;b20d
	jp L_A777		;b210
L_B213:
	ld hl,0d8a3h		;b213
	ld (hl),001h		;b216
	push hl			;b218
	call 090c8h		;b219
	pop hl			;b21c
	ld (hl),000h		;b21d
	ld a,c			;b21f
	and a			;b220
	ret z			;b221
	ld a,(ix+007h)		;b222
	and a			;b225
	ld a,003h		;b226
	ld d,(ix+005h)		;b228
	ld e,003h		;b22b
	jr nz,L_B236		;b22d
	ld a,00ch		;b22f
	ld d,(ix+003h)		;b231
	ld e,001h		;b234
L_B236:
	and c			;b236
	ret z			;b237
	ld a,d			;b238
	cp 060h		;b239
	jr nc,L_B23E		;b23b
	inc e			;b23d
L_B23E:
	ld a,e			;b23e
	dec a			;b23f
	add a,a			;b240
	ld (ix+00dh),a		;b241
	jp L_A777		;b244
L_B247:
	ld a,(ix+007h)		;b247
	rla			;b24a
	jr c,L_B254		;b24b
	dec (ix+00ah)		;b24d
	ld a,021h		;b250
	jr L_B259		;b252
L_B254:
	inc (ix+00ah)		;b254
	ld a,0bfh		;b257
L_B259:
	ld (ix+003h),a		;b259
	jr L_B273		;b25c
L_B25E:
	ld a,(ix+009h)		;b25e
	rla			;b261
	jr c,L_B26B		;b262
	inc (ix+00bh)		;b264
	ld a,00ah		;b267
	jr L_B270		;b269
L_B26B:
	dec (ix+00bh)		;b26b
	ld a,0b6h		;b26e
L_B270:
	ld (ix+005h),a		;b270
L_B273:
	ld (ix+00eh),020h		;b273
	call 05955h		;b277   ; sala_de_zona_a_e500: la sala de la ficha IX a 0xE500, de una lista y unos bloques que dependen de la zona
	jp L_B161		;b27a
L_B27D:
	ld a,(ix+018h)		;b27d
	and a			;b280
	ret nz			;b281
	call 08100h		;b282
	jr nz,L_B295		;b285
	ld a,(ix+01ch)		;b287
	dec (ix+01ch)		;b28a
	jr z,L_B295		;b28d
	and 003h		;b28f
	ret nz			;b291
	jp 09b40h		;b292   ; p04:9B40
L_B295:
	ld (ix+001h),003h		;b295
	ld (ix+00ch),003h		;b299
L_B29D:
	call 04256h		;b29d   ; azar: A = un numero al azar (0xCA03 rotado mas R)
	and 01fh		;b2a0
	add a,010h		;b2a2
	ld (ix+01ch),a		;b2a4
	ret			;b2a7
L_B2A8:
	call 08079h		;b2a8
	ld (ix+018h),l		;b2ab
	ld (ix+019h),h		;b2ae
	ret			;b2b1
L_B2B2:
	call L_B2D8		;b2b2
	jp nc,086a4h		;b2b5   ; p04:86A4
	ld hl,06bcch		;b2b8
	call 086d5h		;b2bb
	ld a,(ix+001h)		;b2be
	ld hl,0b2e8h		;b2c1
	call 0424eh		;b2c4   ; salta_por_tabla: salta a la palabra A de la tabla de HL
	call 08082h		;b2c7
	jp 08671h		;b2ca   ; p04:8671
L_B2CD:
	call 08728h		;b2cd
	ld a,(ix+014h)		;b2d0
	and a			;b2d3
	jp z,0873ch		;b2d4   ; p04:873C
	ret			;b2d7
L_B2D8:
	ld a,(0ca50h)		;b2d8
	sub 004h		;b2db
	cp 002h		;b2dd
	ret nc			;b2df
	ld a,(0ca51h)		;b2e0
	sub 004h		;b2e3
	cp 002h		;b2e5
	ret			;b2e7

; ----------------------------------------------------------------------
; DATOS resto_B2E8: lo apuntan con el banco puesto p05:B2C1 (0xB2E8); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p05:B2C1 (16 bytes)
;   0xb2e8..0xb2f8  (16 bytes)
DATA_resto_B2E8:
	defb 0f8h,0b2h,014h,0b3h,04eh,0b3h,05fh,0b3h,089h,0b3h,004h,0b5h,035h,0b5h,046h,0b5h	; b2e8  ....N._.....5.F.

; ======================================================================
; CODIGO 0xb2f8..0xb464  (364 bytes)
; ======================================================================


L_B2F8:
	ld a,001h		;b2f8
	ld (0cb3ch),a		;b2fa
	ld (ix+00dh),008h		;b2fd
	ld hl,0d7d6h		;b301
	set 1,(hl)		;b304
	ld (ix+00ch),a		;b306
	ld (ix+007h),002h		;b309
	call 086c2h		;b30d
L_B310:
	inc (ix+001h)		;b310
	ret			;b313
L_B314:
	call L_B3E3		;b314
	call L_B341		;b317
	ld a,(0ca50h)		;b31a
	cp (ix+00ah)		;b31d
	ret nz			;b320
	ld a,(ix+003h)		;b321
	cp 018h		;b324
	call nc,L_B33C		;b326
	cp 030h		;b329
	ret c			;b32b
	ld (ix+00ch),000h		;b32c
	ld (ix+00dh),001h		;b330
	ld de,00c50h		;b334
	call 061ceh		;b337
	jr L_B310		;b33a
L_B33C:
	ld (ix+014h),000h		;b33c
	ret			;b340
L_B341:
	ld de,010c1h		;b341
	ld hl,00cb5h		;b344
L_B347:
	call L_AE6B		;b347
	ret c			;b34a
	jp 05955h		;b34b   ; sala_de_zona_a_e500: la sala de la ficha IX a 0xE500, de una lista y unos bloques que dependen de la zona
L_B34E:
	call 06247h		;b34e
	ld a,(0e220h)		;b351   ; lee la velocidad del mensaje en curso (0 = ninguno; 1-3, 4 sin espera)
	and a			;b354
	ret nz			;b355
	xor a			;b356
	ld (0cb3ch),a		;b357
	call 079c7h		;b35a
	jr L_B310		;b35d
L_B35F:
	ld a,001h		;b35f
	ld (ix+016h),a		;b361
	call L_A77D		;b364
	ld (ix+00ch),001h		;b367
	call L_B310		;b36b
	call 05955h		;b36e   ; sala_de_zona_a_e500: la sala de la ficha IX a 0xE500, de una lista y unos bloques que dependen de la zona
	call 08685h		;b371
L_B374:
	ld a,(ix+000h)		;b374
	cp 00ah		;b377
	ld b,010h		;b379
	jr nz,L_B37F		;b37b
	ld b,004h		;b37d
L_B37F:
	call 04256h		;b37f   ; azar: A = un numero al azar (0xCA03 rotado mas R)
	and 00fh		;b382
	add a,b			;b384
	ld (ix+00eh),a		;b385
	ret			;b388
L_B389:
	call L_B46C		;b389
	jp c,L_B43B		;b38c
	call L_B3E3		;b38f
	call L_B49C		;b392
	ld a,(ix+00dh)		;b395
	cp 002h		;b398
	ld a,003h		;b39a
	jr c,L_B3A0		;b39c
	ld a,00ch		;b39e
L_B3A0:
	and c			;b3a0
	jr nz,L_B407		;b3a1
	dec (ix+00eh)		;b3a3
	jr z,L_B407		;b3a6
	call L_B42D		;b3a8
	call L_B341		;b3ab
	dec (ix+01ch)		;b3ae
	jr z,L_B3F5		;b3b1
	ld a,(ix+01ch)		;b3b3
	cp 010h		;b3b6
	ret nz			;b3b8
	ld a,(ix+014h)		;b3b9
	and a			;b3bc
	ret z			;b3bd
L_B3BE:
	call L_B563		;b3be
	ld a,001h		;b3c1
L_B3C3:
	ld (ix+01eh),a		;b3c3
	ld a,(ix+00dh)		;b3c6
	ld (ix+01dh),a		;b3c9
	ld (ix+00dh),008h		;b3cc
	ld (ix+00ch),000h		;b3d0
	ld (ix+00eh),004h		;b3d4
	ld (ix+001h),007h		;b3d8
	ret			;b3dc
L_B3DD:
	xor a			;b3dd
	ld (ix+014h),a		;b3de
	jr L_B3C3		;b3e1
L_B3E3:
	call 08100h		;b3e3
	ret nz			;b3e6
	ld a,(ix+014h)		;b3e7
	and a			;b3ea
	ret nz			;b3eb
	ld a,(0ca03h)		;b3ec   ; lee el contador de cuadros (uno mas en cada interrupcion)
	and 003h		;b3ef
	ret nz			;b3f1
	jp 06a73h		;b3f2   ; p01:6A73
L_B3F5:
	call 04256h		;b3f5   ; azar: A = un numero al azar (0xCA03 rotado mas R)
	and 01fh		;b3f8
	add a,010h		;b3fa
	ld (ix+01ch),a		;b3fc
L_B3FF:
	ld a,(ix+014h)		;b3ff
	and a			;b402
	jr z,L_B3BE		;b403
	jr L_B3DD		;b405
L_B407:
	call L_B374		;b407
	ld a,(0cb31h)		;b40a
	and a			;b40d
	jr z,L_B41E		;b40e
	call 04256h		;b410   ; azar: A = un numero al azar (0xCA03 rotado mas R)
	and 003h		;b413
	ld b,a			;b415
	call L_B4AC		;b416
	call L_B426		;b419
	jr L_B3BE		;b41c
L_B41E:
	call L_B4A9		;b41e
	call L_B426		;b421
	jr L_B3FF		;b424
L_B426:
	ld (ix+00dh),c		;b426
	ld a,c			;b429
	jp L_A77D		;b42a
L_B42D:
	ld a,(0ca03h)		;b42d   ; lee el contador de cuadros (uno mas en cada interrupcion)
	and 004h		;b430
	ld a,0ffh		;b432
	jr z,L_B437		;b434
	xor a			;b436
L_B437:
	ld (ix+013h),a		;b437
	ret			;b43a
L_B43B:
	xor a			;b43b
	ld (ix+00ch),a		;b43c
	ld (ix+00eh),020h		;b43f
	call L_B310		;b443
	call L_B450		;b446
	ld a,(ix+014h)		;b449
	and a			;b44c
	ret z			;b44d
	jr L_B3DD		;b44e
L_B450:
	call L_B4F8		;b450
	add a,010h		;b453
	rlca			;b455
	rlca			;b456
	rlca			;b457
	and 007h		;b458
	ld hl,0b464h		;b45a
	call 04248h		;b45d   ; byte_de_tabla: A = el byte A de la tabla de HL (y HL apunta a el)
	ld (ix+00dh),a		;b460
	ret			;b463

; ----------------------------------------------------------------------
; DATOS resto_B464: lo apuntan con el banco puesto p05:B45A (0xB464); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p05:B45A (8 bytes)
;   0xb464..0xb46c  (8 bytes)
DATA_resto_B464:
	defb 003h,007h,001h,006h,002h,004h,000h,005h	; b464  ........

; ======================================================================
; CODIGO 0xb46c..0xb58f  (291 bytes)
; ======================================================================


L_B46C:
	ld a,(ix+01bh)		;b46c
	and a			;b46f
	jr z,L_B477		;b470
	dec (ix+01bh)		;b472
	jr L_B49A		;b475
L_B477:
	call 08100h		;b477
	jr nz,L_B49A		;b47a
	ld a,(0cb31h)		;b47c
	and a			;b47f
	ret nz			;b480
	call 08079h		;b481
	ld a,l			;b484
	sub (ix+003h)		;b485
	jr nc,L_B48C		;b488
	neg		;b48a
L_B48C:
	cp 060h		;b48c
	ret nc			;b48e
	ld a,h			;b48f
	sub (ix+005h)		;b490
	jr nc,L_B497		;b493
	neg		;b495
L_B497:
	cp 060h		;b497
	ret			;b499
L_B49A:
	or a			;b49a
	ret			;b49b
L_B49C:
	ld hl,0d8a3h		;b49c
	ld (hl),001h		;b49f
	push hl			;b4a1
	call 090c8h		;b4a2
	pop hl			;b4a5
	ld (hl),000h		;b4a6
	ret			;b4a8
L_B4A9:
	call L_B4CA		;b4a9
L_B4AC:
	push bc			;b4ac
	call L_B49C		;b4ad
	ld a,c			;b4b0
	pop bc			;b4b1
	ld c,b			;b4b2
	inc b			;b4b3
L_B4B4:
	rra			;b4b4
	djnz L_B4B4		;b4b5
	ret nc			;b4b7
	ld a,c			;b4b8
	add a,002h		;b4b9
	and 003h		;b4bb
	ld b,a			;b4bd
	ld a,r		;b4be
	rra			;b4c0
	jr c,L_B4AC		;b4c1
	rr b		;b4c3
	ccf			;b4c5
	rl b		;b4c6
	jr L_B4AC		;b4c8
L_B4CA:
	ld a,(0ca50h)		;b4ca
	cp (ix+00ah)		;b4cd
	jr z,L_B4D7		;b4d0
	ld b,001h		;b4d2
	ret c			;b4d4
	dec b			;b4d5
	ret			;b4d6
L_B4D7:
	call 08107h		;b4d7
	jr z,L_B4E1		;b4da
	ld b,002h		;b4dc
	ret c			;b4de
	inc b			;b4df
	ret			;b4e0
L_B4E1:
	call L_B4F8		;b4e1
	ld b,003h		;b4e4
	cp 020h		;b4e6
	ret c			;b4e8
	cp 0e0h		;b4e9
	ret nc			;b4eb
	ld b,001h		;b4ec
	cp 060h		;b4ee
	ret c			;b4f0
	inc b			;b4f1
	cp 0a0h		;b4f2
	ret c			;b4f4
	ld b,000h		;b4f5
	ret			;b4f7
L_B4F8:
	ld d,(ix+005h)		;b4f8
	ld e,(ix+003h)		;b4fb
	call 08079h		;b4fe
	jp 079d1h		;b501   ; p01:79D1
L_B504:
	call 08100h		;b504
	jr nz,L_B53F		;b507
	dec (ix+00eh)		;b509
	jr z,L_B52F		;b50c
	call L_B46C		;b50e
	jr nc,L_B528		;b511
	ld a,(ix+017h)		;b513
	and a			;b516
	jr nz,L_B52F		;b517
	call L_B450		;b519
	call L_B2A8		;b51c
L_B51F:
	ld a,(0ca03h)		;b51f   ; lee el contador de cuadros (uno mas en cada interrupcion)
	and 003h		;b522
	ret nz			;b524
	jp 09b19h		;b525   ; p04:9B19
L_B528:
	ld (ix+00eh),020h		;b528
	jp L_B310		;b52c
L_B52F:
	ld (ix+01bh),010h		;b52f
	jr L_B53F		;b533
L_B535:
	call 08100h		;b535
	jr nz,L_B53F		;b538
	dec (ix+00eh)		;b53a
	jr nz,L_B51F		;b53d
L_B53F:
	ld (ix+001h),004h		;b53f
	jp L_B41E		;b543
L_B546:
	dec (ix+00eh)		;b546
	ret nz			;b549
	ld (ix+00ch),003h		;b54a
	ld a,(ix+01dh)		;b54e
	ld (ix+00dh),a		;b551
	ld (ix+001h),004h		;b554
	ld a,(ix+01eh)		;b558
	and a			;b55b
	jr z,L_B563		;b55c
	ld (ix+014h),001h		;b55e
	ret			;b562
L_B563:
	call 08100h		;b563
	ret nz			;b566
	jp 06cd2h		;b567   ; p01:6CD2
L_B56A:
	ld a,(ix+001h)		;b56a
	cp 005h		;b56d
	ret c			;b56f
	jp 08739h		;b570
L_B573:
	ld a,(0d8a9h)		;b573
	and a			;b576
	ret z			;b577
	ld hl,06bcch		;b578
	call 086d5h		;b57b   ; p04:86D5
	ld a,(0ca76h)		;b57e   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	and a			;b581
	ret nz			;b582
	ld a,(ix+001h)		;b583
	ld hl,0b58fh		;b586
	call 0424eh		;b589   ; salta_por_tabla: salta a la palabra A de la tabla de HL
	jp 08082h		;b58c   ; p04:8082

; ----------------------------------------------------------------------
; DATOS resto_B58F: lo apuntan con el banco puesto p05:B586 (0xB58F); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p05:B586 (38 bytes)
;   0xb58f..0xb5b5  (38 bytes)
DATA_resto_B58F:
	defb 0b5h,0b5h,0c8h,0b5h,0e3h,0b5h,0d4h,0b5h,008h,0b6h,034h,0b6h,049h,0b6h,09bh,0b6h	; b58f  ..........4.I...
	defb 0d8h,0b6h,061h,0b7h,097h,0b7h,0c6h,0b7h,0e1h,0b7h,011h,0b8h,01dh,0b8h,082h,0b8h	; b59f  ..a.............
	defb 0eah,0b8h,00ah,0b9h,01ah,0b9h	; b5af

; ======================================================================
; CODIGO 0xb5b5..0xb751  (412 bytes)
; ======================================================================


L_B5B5:
	ld a,(0d6b0h)		;b5b5
	and a			;b5b8
	ret z			;b5b9
	call 06ca6h		;b5ba   ; p01:6CA6
	ld (ix+00eh),008h		;b5bd
	ld a,001h		;b5c1
	ld (0cb3ch),a		;b5c3
	jr L_B5DF		;b5c6
L_B5C8:
	ld a,(ix+00eh)		;b5c8
	and a			;b5cb
	jr z,L_B5D4		;b5cc
	dec (ix+00eh)		;b5ce
	ret nz			;b5d1
	jr L_B5F0		;b5d2
L_B5D4:
	call L_B5F6		;b5d4
	ret nz			;b5d7
	ld (0cb3ch),a		;b5d8
	inc a			;b5db
	ld (0d509h),a		;b5dc
L_B5DF:
	inc (ix+001h)		;b5df
	ret			;b5e2
L_B5E3:
	ld a,(0ca4bh)		;b5e3   ; lee la sala de la zona
	dec a			;b5e6
	ret nz			;b5e7
	ld a,001h		;b5e8
	ld (0cb3ch),a		;b5ea
	call L_B5DF		;b5ed
L_B5F0:
	ld de,01110h		;b5f0
	jp 061ceh		;b5f3
L_B5F6:
	call 06247h		;b5f6
	ret nz			;b5f9
	call 079c7h		;b5fa
	xor a			;b5fd
	ret			;b5fe
L_B5FF:
	call 06247h		;b5ff
	ret nz			;b602
	call 079c4h		;b603   ; p01:79C4
	xor a			;b606
	ret			;b607
L_B608:
	ld a,(0ca4bh)		;b608   ; lee la sala de la zona
	cp 006h		;b60b
	ret nz			;b60d
	ld (ix+00dh),004h		;b60e
	ld a,001h		;b612
	ld (0cb3ch),a		;b614
	ld (ix+016h),a		;b617
	ld hl,0d7dah		;b61a
	set 7,(hl)		;b61d
	ld (ix+00eh),020h		;b61f
	ld (ix+00ch),002h		;b623
	ld (ix+009h),0ffh		;b627
	ld (ix+008h),000h		;b62b
	call 06bd0h		;b62f
	jr L_B5DF		;b632
L_B634:
	call 086deh		;b634
	dec (ix+00eh)		;b637
	ret nz			;b63a
	ld (ix+00ch),000h		;b63b
	ld (ix+00dh),002h		;b63f
	ld (ix+00eh),020h		;b643
	jr L_B5DF		;b647
L_B649:
	ld a,(ix+00eh)		;b649
	and a			;b64c
	jr z,L_B659		;b64d
	dec (ix+00eh)		;b64f
	ret nz			;b652
	ld de,0126ch		;b653
	jp 061d3h		;b656
L_B659:
	call L_B5FF		;b659
	ret nz			;b65c
	call 07a9bh		;b65d
	ld a,00ah		;b660
	call 07a9bh		;b662
	ld hl,00000h		;b665
	ld de,00000h		;b668
	ld bc,0c0c0h		;b66b
	call 0474dh		;b66e   ; copia_rectangulo_a_esta: p00:4767 de la otra pagina (0xCA42 ^ 1) a la de 0xCA42
	ld a,(0ca42h)		;b671   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	call 04452h		;b674   ; borra_pantalla_de: 0xC0 x 0xC0 puntos a 0 en la pagina A
	call 04650h		;b677   ; espera_vdp: espera a que el VDP acabe la orden en curso (S#2 bit 0)
	call 07ab8h		;b67a
	ld de,02020h		;b67d
	xor a			;b680
	ld b,a			;b681
	call 07aa0h		;b682
	ld de,08020h		;b685
	ld a,00ah		;b688
	ld b,001h		;b68a
	call 07aa0h		;b68c
	call 045f6h		;b68f   ; apaga_sprites: R#8 con el bit 1 (SPD) a uno, desde la copia 0xFFE7
	ld de,00770h		;b692
	call 061d3h		;b695
	jp L_B5DF		;b698
L_B69B:
	call 07aa8h		;b69b
	call L_B5FF		;b69e
	ret nz			;b6a1
	call 045f1h		;b6a2   ; apaga_pantalla_y_sprites: p00:45CC y p00:45F6
	xor a			;b6a5
	ld (0cb3ch),a		;b6a6
	ld (ix+00fh),a		;b6a9
	call 07ab0h		;b6ac
	ld a,001h		;b6af
	call 07ab0h		;b6b1
	call 07a1fh		;b6b4
	ld hl,00000h		;b6b7
	ld de,00000h		;b6ba
	ld bc,0c0c0h		;b6bd
	call 0475ah		;b6c0   ; copia_rectangulo_a_la_otra: p00:4767 de la pagina 0xCA42 a la otra
	call 04650h		;b6c3   ; espera_vdp: espera a que el VDP acabe la orden en curso (S#2 bit 0)
	call 04606h		;b6c6   ; enciende_todo: la pantalla y los sprites encendidos
	call 05955h		;b6c9   ; sala_de_zona_a_e500: la sala de la ficha IX a 0xE500, de una lista y unos bloques que dependen de la zona
	call L_B374		;b6cc
	call L_A777		;b6cf
	call 08685h		;b6d2
	jp L_B5DF		;b6d5
L_B6D8:
	call L_B73D		;b6d8
	jp nc,L_B736		;b6db
	call 086deh		;b6de
	call L_B49C		;b6e1
	ld a,(ix+00dh)		;b6e4
	rrca			;b6e7
	and 003h		;b6e8
	inc a			;b6ea
	ld b,a			;b6eb
L_B6EC:
	rr c		;b6ec
	djnz L_B6EC		;b6ee
	jr c,L_B700		;b6f0
	dec (ix+00eh)		;b6f2
	jr z,L_B700		;b6f5
	ld de,020c1h		;b6f7
	ld hl,008b9h		;b6fa
	jp L_B347		;b6fd
L_B700:
	call L_B728		;b700
	call 08100h		;b703
	ret nz			;b706
	inc (ix+00fh)		;b707
	ld a,(ix+00fh)		;b70a
	and 003h		;b70d
	ret nz			;b70f
	xor a			;b710
	ld (ix+00ch),a		;b711
	ld (ix+018h),a		;b714
	ld (ix+00eh),020h		;b717
	ld (ix+001h),00ah		;b71b
	ld a,(ix+00dh)		;b71f
	and 0feh		;b722
	ld (ix+01bh),a		;b724
	ret			;b727
L_B728:
	call L_B4A9		;b728
	ld a,c			;b72b
	add a,a			;b72c
	ld (ix+00dh),a		;b72d
L_B730:
	call L_B374		;b730
	jp L_A777		;b733
L_B736:
	ld (ix+00ch),000h		;b736
	jp L_B5DF		;b73a
L_B73D:
	call 08100h		;b73d
	jr nz,L_B74F		;b740
	ld a,(ix+00dh)		;b742
	ld hl,0b751h		;b745
	call 0423eh		;b748   ; suma_a_hl: HL = HL + A
	ld b,(hl)			;b74b
	jp 084a4h		;b74c   ; p04:84A4
L_B74F:
	scf			;b74f
	ret			;b750

; ----------------------------------------------------------------------
; DATOS resto_B751: lo apuntan con el banco puesto p05:B745 (0xB751); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p05:B745 (16 bytes)
;   0xb751..0xb761  (16 bytes)
DATA_resto_B751:
	defb 006h,006h,002h,002h,004h,004h,000h,000h,005h,007h,003h,001h,005h,003h,001h,007h	; b751  ................

; ======================================================================
; CODIGO 0xb761..0xb87a  (281 bytes)
; ======================================================================


L_B761:
	ld a,(ix+017h)		;b761
	and a			;b764
	jr z,L_B781		;b765
L_B767:
	ld a,(ix+00dh)		;b767
	and 007h		;b76a
	ld b,004h		;b76c
	cp b			;b76e
	jr c,L_B773		;b76f
	ld b,000h		;b771
L_B773:
	call 04256h		;b773   ; azar: A = un numero al azar (0xCA03 rotado mas R)
	and 002h		;b776
	add a,b			;b778
	ld (ix+00dh),a		;b779
	call L_B730		;b77c
	jr L_B78F		;b77f
L_B781:
	call L_B73D		;b781
	jr c,L_B78F		;b784
	ld a,(0ca03h)		;b786   ; lee el contador de cuadros (uno mas en cada interrupcion)
	and 003h		;b789
	ret nz			;b78b
	jp 09b0dh		;b78c
L_B78F:
	ld (ix+00ch),003h		;b78f
	dec (ix+001h)		;b793
	ret			;b796
L_B797:
	ld a,(ix+017h)		;b797
	and a			;b79a
	jr nz,L_B767		;b79b
	call L_B73D		;b79d
	jr nc,$-106		;b7a0
	dec (ix+00eh)		;b7a2
	jr z,L_B7DA		;b7a5
	ld a,(ix+00eh)		;b7a7
	and 007h		;b7aa
	ret nz			;b7ac
	ld a,(ix+018h)		;b7ad
	inc (ix+018h)		;b7b0
	rra			;b7b3
	ld b,000h		;b7b4
	jr nc,L_B7BE		;b7b6
	rra			;b7b8
	ld b,008h		;b7b9
	jr nc,L_B7BE		;b7bb
	inc b			;b7bd
L_B7BE:
	ld a,(ix+01bh)		;b7be
	add a,b			;b7c1
	ld (ix+00dh),a		;b7c2
	ret			;b7c5
L_B7C6:
	ld a,(ix+017h)		;b7c6
	and a			;b7c9
	jr nz,L_B767		;b7ca
	call L_B73D		;b7cc
	jr c,L_B7DA		;b7cf
	ld a,(0ca03h)		;b7d1   ; lee el contador de cuadros (uno mas en cada interrupcion)
	and 003h		;b7d4
	ret nz			;b7d6
	jp 09b0dh		;b7d7   ; p04:9B0D
L_B7DA:
	ld (ix+001h),008h		;b7da
	jp L_B728		;b7de
L_B7E1:
	xor a			;b7e1
	ld (ix+00ch),a		;b7e2
	ld (ix+016h),a		;b7e5
	ld (0cb01h),a		;b7e8
	ld (0cb00h),a		;b7eb
	ld (0cb16h),a		;b7ee
	ld (0cb44h),a		;b7f1
	inc a			;b7f4
	ld (0cb3ch),a		;b7f5
	ld (0cb14h),a		;b7f8
	ld (ix+00eh),00ch		;b7fb
	ld (ix+00dh),080h		;b7ff
	ld hl,0dc10h		;b803
	ld bc,00010h		;b806
	ld a,0e0h		;b809
	call 04237h		;b80b   ; llena_bloque: pone A en BC + 1 bytes desde HL
	jp L_B5DF		;b80e
L_B811:
	call 06faeh		;b811
	call 06a44h		;b814
	call L_B5DF		;b817
	jp 05dd3h		;b81a
L_B81D:
	dec (ix+00eh)		;b81d
	jr z,L_B82C		;b820
	ld a,(ix+00eh)		;b822
	and 003h		;b825
	ret nz			;b827
	inc (ix+00dh)		;b828
	ret			;b82b
L_B82C:
	push ix		;b82c
	call 0506eh		;b82e   ; sprites_de_858d: p36:858D...
	pop ix		;b831
	call 090c8h		;b833
	call L_B84E		;b836
	ld (ix+00ch),003h		;b839
	ld (ix+00dh),014h		;b83d
	ld (ix+00eh),0c0h		;b841
	call L_B5DF		;b845
	call 06caeh		;b848   ; p01:6CAE
	jp 09d2ah		;b84b   ; p04:9D2A
L_B84E:
	call 04256h		;b84e   ; azar: A = un numero al azar (0xCA03 rotado mas R)
	rrca			;b851
	rrca			;b852
	and 003h		;b853
	ld d,a			;b855
L_B856:
	ld b,a			;b856
	inc b			;b857
	ld a,c			;b858
L_B859:
	rra			;b859
	djnz L_B859		;b85a
	jr nc,L_B865		;b85c
	ld a,d			;b85e
	inc a			;b85f
	and 003h		;b860
	ld d,a			;b862
	jr L_B856		;b863
L_B865:
	ld a,d			;b865
	ld hl,0b87ah		;b866
	call 043f6h		;b869   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	xor a			;b86c
	ld (ix+008h),a		;b86d
	ld (ix+009h),l		;b870
	ld (ix+006h),a		;b873
	ld (ix+007h),h		;b876
	ret			;b879

; ----------------------------------------------------------------------
; DATOS resto_B87A: lo apuntan con el banco puesto p05:B866 (0xB87A); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p05:B866 (8 bytes)
;   0xb87a..0xb882  (8 bytes)
DATA_resto_B87A:
	defb 0ffh,000h,001h,000h,000h,0ffh,000h,001h	; b87a  ........

; ======================================================================
; CODIGO 0xb882..0xb934  (178 bytes)
; ======================================================================


L_B882:
	call 086deh		;b882
	ld a,(ix+007h)		;b885
	and a			;b888
	jr z,L_B897		;b889
	ld a,(ix+003h)		;b88b
	sub 018h		;b88e
	cp 0a4h		;b890
	jp nc,0809eh		;b892
	jr L_B8A1		;b895
L_B897:
	ld a,(ix+005h)		;b897
	sub 00ch		;b89a
	cp 0a8h		;b89c
	jp nc,0808eh		;b89e
L_B8A1:
	call 090c8h		;b8a1
	ld a,(ix+007h)		;b8a4
	and a			;b8a7
	jr z,L_B8B5		;b8a8
	rla			;b8aa
	ld a,001h		;b8ab
	jr c,L_B8B1		;b8ad
	ld a,002h		;b8af
L_B8B1:
	ld b,00ch		;b8b1
	jr L_B8C1		;b8b3
L_B8B5:
	ld a,(ix+009h)		;b8b5
	rla			;b8b8
	ld a,004h		;b8b9
	jr c,L_B8BF		;b8bb
	ld a,008h		;b8bd
L_B8BF:
	ld b,003h		;b8bf
L_B8C1:
	and c			;b8c1
	jr nz,L_B8D1		;b8c2
	ld a,(ix+00eh)		;b8c4
	and 01fh		;b8c7
	jr nz,L_B8D4		;b8c9
	ld c,b			;b8cb
	call L_B84E		;b8cc
	jr L_B8D4		;b8cf
L_B8D1:
	call 0808bh		;b8d1
L_B8D4:
	dec (ix+00eh)		;b8d4
	ld a,(ix+00eh)		;b8d7
	cp 060h		;b8da
	jp z,09d2fh		;b8dc   ; p04:9D2F
	and a			;b8df
	ret nz			;b8e0
	call 09d2fh		;b8e1
	ld (ix+00ch),000h		;b8e4
	jr L_B8FF		;b8e8
L_B8EA:
	dec (ix+00eh)		;b8ea
	jr z,L_B8FF		;b8ed
	ld a,(ix+00eh)		;b8ef
	and 007h		;b8f2
	ret nz			;b8f4
	ld a,(ix+00dh)		;b8f5
	rra			;b8f8
	ccf			;b8f9
	rla			;b8fa
	ld (ix+00dh),a		;b8fb
	ret			;b8fe
L_B8FF:
	ld (ix+00dh),016h		;b8ff
	ld (ix+00eh),040h		;b903
	jp L_B5DF		;b907
L_B90A:
	dec (ix+00eh)		;b90a
	ld a,(ix+00eh)		;b90d
	cp 020h		;b910
	jp z,09d34h		;b912   ; p04:9D34
	and a			;b915
	ret nz			;b916
	jp L_B5DF		;b917
L_B91A:
	xor a			;b91a
	ld (0cb3ch),a		;b91b
	ld (ix+001h),020h		;b91e
	ret			;b922
L_B923:
	ld a,(0d8aah)		;b923
	and a			;b926
	ret z			;b927
	ld a,(ix+001h)		;b928
	ld hl,0b934h		;b92b
	call 0424eh		;b92e   ; salta_por_tabla: salta a la palabra A de la tabla de HL
	jp 08082h		;b931

; ----------------------------------------------------------------------
; DATOS resto_B934: lo apuntan con el banco puesto p05:B92B (0xB934); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p05:B92B (44 bytes)
;   0xb934..0xb960  (44 bytes)
DATA_resto_B934:
	defb 060h,0b9h,06fh,0b9h,078h,0b9h,090h,0b9h,0b8h,0b9h,0f3h,0b9h,00ch,0bah,025h,0bah	; b934  `.o.x.........%.
	defb 045h,0bah,058h,0bah,090h,0bah,038h,0bbh,063h,0bbh,057h,0bah,057h,0bah,057h,0bah	; b944  E.X...8.c.W.W.W.
	defb 0a2h,0bbh,0c1h,0bbh,0d9h,0bbh,04ah,0bch,0b5h,0bch,0e8h,0bch	; b954  ......J.....

; ======================================================================
; CODIGO 0xb960..0xbb83  (547 bytes)
; ======================================================================


L_B960:
	xor a			;b960
	ld (ix+00dh),a		;b961
	inc a			;b964
	ld (0cb3ch),a		;b965
	ld (ix+00eh),018h		;b968
	jp L_BA54		;b96c
L_B96F:
	dec (ix+00eh)		;b96f
	ret nz			;b972
	ld d,009h		;b973
	jp L_BA4F		;b975
L_B978:
	call L_B5F6		;b978
	ret nz			;b97b
	ld (ix+00eh),a		;b97c
	inc a			;b97f
	ld (0d509h),a		;b980
	ld (0cb3ch),a		;b983
	ld (ix+00dh),002h		;b986
	call L_A777		;b98a
	jp L_BA54		;b98d
L_B990:
	call L_B9DA		;b990
	call 086deh		;b993
	call L_B9AF		;b996
	ld a,(ix+00ah)		;b999
	cp 002h		;b99c
	ret nz			;b99e
	ld a,(ix+003h)		;b99f
	cp 05eh		;b9a2
	ret c			;b9a4
	ld (ix+00dh),004h		;b9a5
	call L_A777		;b9a9
	jp L_BA54		;b9ac
L_B9AF:
	ld de,020c1h		;b9af
	ld hl,008b9h		;b9b2
	jp L_AE6B		;b9b5
L_B9B8:
	call L_B9DA		;b9b8
	call L_B9AF		;b9bb
	ld a,(ix+00bh)		;b9be
	cp 008h		;b9c1
	ret nz			;b9c3
	ld a,(ix+005h)		;b9c4
	cp 050h		;b9c7
	ret nc			;b9c9
	xor a			;b9ca
	ld (ix+00ch),a		;b9cb
	ld (0cb3ch),a		;b9ce
	ld (ix+00dh),006h		;b9d1
	call 07a70h		;b9d5
	jr L_BA54		;b9d8
L_B9DA:
	ld a,(0d88ch)		;b9da
	inc a			;b9dd
	jr z,L_B9ED		;b9de
	inc (ix+00eh)		;b9e0
	ld a,(ix+00eh)		;b9e3
	and 007h		;b9e6
	ld bc,00a07h		;b9e8
	jr z,L_B9F0		;b9eb
L_B9ED:
	ld bc,00f07h		;b9ed
L_B9F0:
	jp 00047h		;b9f0   ; BIOS WRTVDP - Writes data in the VDP-register
L_B9F3:
	call L_B9DA		;b9f3
	ld a,(0d88ch)		;b9f6
	inc a			;b9f9
	ret nz			;b9fa
	ld a,(0ca4bh)		;b9fb   ; lee la sala de la zona
	cp 003h		;b9fe
	ret nz			;ba00
	ld a,001h		;ba01
	ld (0d509h),a		;ba03
	ld (ix+00dh),006h		;ba06
	jr L_BA54		;ba0a
L_BA0C:
	ld a,(0ca4bh)		;ba0c   ; lee la sala de la zona
	cp 002h		;ba0f
	ret nz			;ba11
	ld a,001h		;ba12
	ld (0cb3ch),a		;ba14
	ld hl,0d7d9h		;ba17
	set 1,(hl)		;ba1a
	call 06b95h		;ba1c
	ld (ix+00eh),010h		;ba1f
	jr L_BA54		;ba23
L_BA25:
	ld a,(ix+00eh)		;ba25
	and a			;ba28
	jr z,L_BA35		;ba29
	dec (ix+00eh)		;ba2b
	ret nz			;ba2e
	ld de,00f10h		;ba2f
	jp 061ceh		;ba32
L_BA35:
	call L_B5F6		;ba35
	ret nz			;ba38
	ld (ix+016h),001h		;ba39
	ld de,06060h		;ba3d
	call 079d9h		;ba40
	jr L_BA54		;ba43
L_BA45:
	call 079e1h		;ba45
	ld a,(0e270h)		;ba48
	and a			;ba4b
	ret nz			;ba4c
	ld d,013h		;ba4d
L_BA4F:
	ld e,010h		;ba4f
	call 061ceh		;ba51
L_BA54:
	inc (ix+001h)		;ba54
L_BA57:
	ret			;ba57
L_BA58:
	call L_B5F6		;ba58
	ret nz			;ba5b
	ld (0cb3ch),a		;ba5c
	ld (ix+011h),a		;ba5f
	ld (ix+00fh),a		;ba62
	call 08685h		;ba65
	call 07a70h		;ba68   ; p01:7A70
	call L_BA54		;ba6b
L_BA6E:
	xor a			;ba6e
	jr L_BA73		;ba6f
L_BA71:
	ld a,001h		;ba71
L_BA73:
	call L_BA7A		;ba73
	ld a,b			;ba76
	jp L_A77D		;ba77
L_BA7A:
	push af			;ba7a
	call L_B4E1		;ba7b
	pop af			;ba7e
	and a			;ba7f
	jr z,L_BA87		;ba80
	rr b		;ba82
	ccf			;ba84
	rl b		;ba85
L_BA87:
	ld (ix+018h),b		;ba87
	ld a,b			;ba8a
	add a,a			;ba8b
	ld (ix+00dh),a		;ba8c
	ret			;ba8f
L_BA90:
	call L_BB08		;ba90
	ret nz			;ba93
	call 090c8h		;ba94
	ld a,(ix+007h)		;ba97
	and a			;ba9a
	ld a,003h		;ba9b
	jr nz,L_BAA1		;ba9d
	ld a,00ch		;ba9f
L_BAA1:
	and c			;baa1
	jr nz,L_BA6E		;baa2
	call 086deh		;baa4
	call L_BAF1		;baa7
	ld a,(ix+007h)		;baaa
	and a			;baad
	ld bc,00c06h		;baae
	jr nz,L_BAB7		;bab1
	ex de,hl			;bab3
	ld bc,0060ch		;bab4
L_BAB7:
	ld a,h			;bab7
	sub l			;bab8
	jr nc,L_BABD		;bab9
	neg		;babb
L_BABD:
	cp b			;babd
	jr nc,L_BAC9		;babe
	ld a,d			;bac0
	sub e			;bac1
	jr nc,L_BAC6		;bac2
	neg		;bac4
L_BAC6:
	cp c			;bac6
	jr c,L_BAE3		;bac7
L_BAC9:
	call L_BAF1		;bac9
	ld a,(ix+018h)		;bacc
	cp 002h		;bacf
	jr c,L_BAD7		;bad1
	ld a,h			;bad3
	sub l			;bad4
	jr L_BAD9		;bad5
L_BAD7:
	ld a,d			;bad7
	sub e			;bad8
L_BAD9:
	jr nc,L_BADD		;bad9
	neg		;badb
L_BADD:
	cp 004h		;badd
	ret nc			;badf
	jp L_BA6E		;bae0
L_BAE3:
	xor a			;bae3
	ld (ix+00ch),a		;bae4
	ld (ix+00fh),a		;bae7
	ld (ix+00eh),018h		;baea
	jp L_BA54		;baee
L_BAF1:
	call 08079h		;baf1
	ld d,l			;baf4
	ld l,(ix+005h)		;baf5
	ld e,(ix+003h)		;baf8
	ret			;bafb
L_BAFC:
	call L_B4E1		;bafc
	ld a,008h		;baff
	add a,b			;bb01
	ld (ix+00dh),a		;bb02
	jp 06a15h		;bb05   ; p01:6A15
L_BB08:
	ld a,(ix+017h)		;bb08
	and a			;bb0b
	ret z			;bb0c
	ld (ix+001h),00ch		;bb0d
	call L_BB2E		;bb11
	ld a,(ix+00dh)		;bb14
	cp 008h		;bb17
	jr nc,L_BB2A		;bb19
	srl a		;bb1b
L_BB1D:
	add a,002h		;bb1d
	and 003h		;bb1f
	ld b,a			;bb21
	add a,a			;bb22
	ld (ix+00dh),a		;bb23
	ld a,b			;bb26
	jp L_A77D		;bb27
L_BB2A:
	sub 008h		;bb2a
	jr L_BB1D		;bb2c
L_BB2E:
	call 04256h		;bb2e   ; azar: A = un numero al azar (0xCA03 rotado mas R)
	and 003h		;bb31
	inc a			;bb33
	ld (ix+00fh),a		;bb34
	ret			;bb37
L_BB38:
	call L_BB08		;bb38
	ret nz			;bb3b
	dec (ix+00eh)		;bb3c
	jr z,L_BB54		;bb3f
	ld a,(ix+00eh)		;bb41
	and 003h		;bb44
	ret nz			;bb46
	ld a,(ix+00fh)		;bb47
	inc (ix+00fh)		;bb4a
	rra			;bb4d
	jr nc,L_BAFC		;bb4e
	xor a			;bb50
	jp L_BA7A		;bb51
L_BB54:
	call 04256h		;bb54   ; azar: A = un numero al azar (0xCA03 rotado mas R)
	rra			;bb57
	jr c,$+47		;bb58
	call L_BA71		;bb5a
	call L_BB2E		;bb5d
	jp L_BA54		;bb60
L_BB63:
	call 086deh		;bb63
	call L_BB8E		;bb66
	ret c			;bb69
	dec (ix+00fh)		;bb6a
	jr z,$+26		;bb6d
	ld a,(ix+00dh)		;bb6f
	rrca			;bb72
	and 003h		;bb73
	ld hl,0bb83h		;bb75
	call 04248h		;bb78   ; byte_de_tabla: A = el byte A de la tabla de HL (y HL apunta a el)
	add a,a			;bb7b
	ld (ix+00dh),a		;bb7c
	ld a,(hl)			;bb7f
	jp L_A77D		;bb80

; ----------------------------------------------------------------------
; DATOS resto_BB83: lo apuntan con el banco puesto p05:BB75 (0xBB83); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p05:BB75 (4 bytes)
;   0xbb83..0xbb87  (4 bytes)
DATA_resto_BB83:
	defb 002h,003h,001h,000h	; bb83

; ======================================================================
; CODIGO 0xbb87..0xbd58  (465 bytes)
; ======================================================================


L_BB87:
	ld (ix+001h),00ah		;bb87
	jp L_BA6E		;bb8b
L_BB8E:
	ld a,(ix+007h)		;bb8e
	and a			;bb91
	ld a,(ix+003h)		;bb92
	ld b,058h		;bb95
	jr nz,L_BB9E		;bb97
	ld b,048h		;bb99
	ld a,(ix+005h)		;bb9b
L_BB9E:
	sub b			;bb9e
	cp 030h		;bb9f
	ret			;bba1
L_BBA2:
	xor a			;bba2
	ld (ix+00ch),a		;bba3
	ld (0e1e8h),a		;bba6
	ld (0d7bbh),a		;bba9
	inc a			;bbac
	ld (0cb3ch),a		;bbad
	ld (ix+00dh),00ch		;bbb0
	ld (ix+00eh),020h		;bbb4
	call 07a0ah		;bbb8   ; p01:7A0A
	call 06c1bh		;bbbb
	jp L_BA54		;bbbe
L_BBC1:
	dec (ix+00eh)		;bbc1
	ret nz			;bbc4
	ld h,000h		;bbc5
	ld l,h			;bbc7
	ld d,h			;bbc8
	ld e,h			;bbc9
	ld bc,0c0c0h		;bbca
	call 0474dh		;bbcd   ; copia_rectangulo_a_esta: p00:4767 de la otra pagina (0xCA42 ^ 1) a la de 0xCA42
	ld de,06060h		;bbd0
	call 07a02h		;bbd3   ; p01:7A02
	jp L_BA54		;bbd6
L_BBD9:
	call 079e1h		;bbd9
	ld a,(0e270h)		;bbdc
	and a			;bbdf
	ret nz			;bbe0
	call 06cc2h		;bbe1   ; p01:6CC2
	call 045f6h		;bbe4   ; apaga_sprites: R#8 con el bit 1 (SPD) a uno, desde la copia 0xFFE7
	ld a,002h		;bbe7
	ld (0d8aah),a		;bbe9
	call 045d7h		;bbec   ; esconde_sprites_vram: llena con 0xE0 128 bytes de la VRAM en 0xF600 y otros 128 en 0xF200
	call 06f6ah		;bbef   ; p01:6F6A
	ld a,0d8h		;bbf2
	ld (0dc70h),a		;bbf4
	ld hl,0dc78h		;bbf7
	ld (hl),027h		;bbfa
	inc hl			;bbfc
	ld (hl),088h		;bbfd
	inc hl			;bbff
	ld (hl),0f8h		;bc00
	inc hl			;bc02
	inc hl			;bc03
	ld (hl),037h		;bc04
	inc hl			;bc06
	ld (hl),090h		;bc07
	inc hl			;bc09
	ld (hl),0fch		;bc0a
	ld hl,0dbe0h		;bc0c
	ld bc,0001fh		;bc0f
	ld a,00ah		;bc12
	call 04237h		;bc14   ; llena_bloque: pone A en BC + 1 bytes desde HL
	xor a			;bc17
	call 07a9bh		;bc18   ; p01:7A9B
	ld a,008h		;bc1b
	call 07a9bh		;bc1d
	ld a,(0ca42h)		;bc20   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	call 04452h		;bc23   ; borra_pantalla_de: 0xC0 x 0xC0 puntos a 0 en la pagina A
	call 04650h		;bc26   ; espera_vdp: espera a que el VDP acabe la orden en curso (S#2 bit 0)
	call 07ab8h		;bc29   ; p01:7AB8
	call 04609h		;bc2c   ; enciende_sprites: R#8 con el bit 1 (SPD) a cero, desde la copia 0xFFE7
	ld de,02020h		;bc2f
	xor a			;bc32
	ld b,a			;bc33
	call 07aa0h		;bc34   ; p01:7AA0
	ld de,08020h		;bc37
	ld a,008h		;bc3a
	ld b,001h		;bc3c
	call 07aa0h		;bc3e
	ld de,01070h		;bc41
	call 061d3h		;bc44   ; p01:61D3
	jp L_BA54		;bc47
L_BC4A:
	call 07aa8h		;bc4a   ; p01:7AA8
	call L_B5FF		;bc4d
	ret nz			;bc50
	call 045f1h		;bc51   ; apaga_pantalla_y_sprites: p00:45CC y p00:45F6
	ld hl,0cd00h		;bc54
	ld bc,000ffh		;bc57
	call 04236h		;bc5a   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	xor a			;bc5d
	call L_BC9F		;bc5e
	ld a,001h		;bc61
	call L_BC9F		;bc63
	xor a			;bc66
	ld (ix+00fh),a		;bc67
	ld (0cb01h),a		;bc6a
	ld (0cb00h),a		;bc6d
	ld (0cb16h),a		;bc70
	inc a			;bc73
	ld (0cb14h),a		;bc74
	call 05dd3h		;bc77   ; p00:5DD3
	call 07ab0h		;bc7a   ; p01:7AB0
	ld a,001h		;bc7d
	call 07ab0h		;bc7f
	call 07a1fh		;bc82   ; p01:7A1F
	call 0444fh		;bc85   ; borra_pantalla_negro: 0xC0 x 0xC0 puntos a 0 en la pagina de dibujar
	ld de,06060h		;bc88
	call 079d9h		;bc8b   ; p01:79D9
	call 045c5h		;bc8e   ; enciende_pantalla: R#1 con el bit 6 (BL) a uno, desde la copia 0xF3E0
	ld hl,0dc70h		;bc91
	ld bc,0000fh		;bc94
	ld a,0e0h		;bc97
	call 04237h		;bc99   ; llena_bloque: pone A en BC + 1 bytes desde HL
	jp L_BA54		;bc9c
L_BC9F:
	ld d,a			;bc9f
	push af			;bca0
	ld hl,0dc30h		;bca1
	ld bc,00a08h		;bca4
	xor a			;bca7
	call 046ffh		;bca8   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
	pop af			;bcab
	ld hl,0db30h		;bcac
	ld bc,00800h		;bcaf
	jp 04680h		;bcb2   ; linea_vertical: orden LINE del VDP con el lado largo en Y (ARG = 1)
L_BCB5:
	call 079e1h		;bcb5   ; p01:79E1
	ld a,(0e270h)		;bcb8
	and a			;bcbb
	ret nz			;bcbc
	ld a,068h		;bcbd
	ld (0cb03h),a		;bcbf
	ld (ix+003h),a		;bcc2
	ld a,070h		;bcc5
	ld (0cb05h),a		;bcc7
	ld a,003h		;bcca
	ld (0cb0eh),a		;bccc
	ld (ix+005h),050h		;bccf
	ld (ix+00eh),010h		;bcd3
	ld a,001h		;bcd7
	ld (0d8aah),a		;bcd9
	call 045d7h		;bcdc   ; esconde_sprites_vram: llena con 0xE0 128 bytes de la VRAM en 0xF600 y otros 128 en 0xF200
	call 04266h		;bcdf   ; esconde_sprites_ram: llena 0xDC00-0xDC7F con 0xE0
	call 04609h		;bce2   ; enciende_sprites: R#8 con el bit 1 (SPD) a cero, desde la copia 0xFFE7
	jp L_BA54		;bce5
L_BCE8:
	dec (ix+00eh)		;bce8
	ret nz			;bceb
	xor a			;bcec
	ld (0d8aah),a		;bced
	ld (ix+001h),020h		;bcf0
	ret			;bcf4
L_BCF5:
	ld a,(0ca4ah)		;bcf5   ; lee la zona
	cp 013h		;bcf8
	ret nz			;bcfa
	ld a,(0ca4bh)		;bcfb   ; lee la sala de la zona
	cp 005h		;bcfe
	ret nz			;bd00
	call 041ddh		;bd01   ; bancos_12: pone el 12 en 0x6000 (con su copia en 0xC381-0xC383)
	ld hl,00706h		;bd04
	ld (0ca4ch),hl		;bd07   ; guarda los 4 bits altos del byte de la sala (p56:BD28) y el byte siguiente (16 bits)
	ld hl,07435h		;bd0a
	ld de,08418h		;bd0d
	call 0741bh		;bd10
	ld a,(0d821h)		;bd13
	cp 00fh		;bd16
	push ix		;bd18
	ld ix,0d820h		;bd1a
	call nc,L_BD26		;bd1e
	pop ix		;bd21
	jp 0413fh		;bd23   ; bancos_1_4_5: pone el 1 en 0x6000, el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
L_BD26:
	ld a,(ix+005h)		;bd26
	sub 010h		;bd29
	ld d,a			;bd2b
	ld a,(ix+003h)		;bd2c
	sub 010h		;bd2f
	ld e,a			;bd31
	ld hl,0743dh		;bd32
	ld bc,00402h		;bd35
	jp 0741eh		;bd38
L_BD3B:
	ld a,(ix+001h)		;bd3b
	cp 00fh		;bd3e
	jp nc,08728h		;bd40
	jp 08739h		;bd43
L_BD46:
	ld a,(0ca4bh)		;bd46   ; lee la sala de la zona
	cp 005h		;bd49
	ret nz			;bd4b
	ld a,(ix+001h)		;bd4c
	ld hl,0bd58h		;bd4f
	call 0424eh		;bd52   ; salta_por_tabla: salta a la palabra A de la tabla de HL
	jp 08082h		;bd55

; ----------------------------------------------------------------------
; DATOS resto_BD58: lo apuntan con el banco puesto p05:BD4F (0xBD58); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p05:BD4F (44 bytes)
;   0xbd58..0xbd84  (44 bytes)
DATA_resto_BD58:
	defb 084h,0bdh,0ach,0bdh,0bah,0bdh,0d9h,0bdh,0fdh,0bdh,00ah,0beh,01ch,0beh,028h,0beh	; bd58  ..............(.
	defb 03bh,0beh,04fh,0beh,064h,0beh,06ch,0beh,0c6h,0beh,008h,0bfh,041h,0bfh,048h,0bfh	; bd68  ..O.d.l.....A.H.
	defb 086h,0bfh,09ch,0bfh,0b8h,0bfh,0d4h,0bfh,0dah,0bfh,0ebh,0bfh	; bd78  ............

; ======================================================================
; CODIGO 0xbd84..0xbf39  (437 bytes)
; ======================================================================


L_BD84:
	xor a			;bd84
	ld (0e070h),a		;bd85
	ld (0d500h),a		;bd88
	ld (0d510h),a		;bd8b
	inc a			;bd8e
	ld (0cb3ch),a		;bd8f
	ld hl,0d7d8h		;bd92
	set 3,(hl)		;bd95
	ld (ix+00eh),010h		;bd97
	ld (ix+00dh),004h		;bd9b
	ld hl,06bb8h		;bd9f
	call 07c85h		;bda2
	ld a,0b4h		;bda5
	ld (0ca18h),a		;bda7
	jr L_BDF9		;bdaa
L_BDAC:
	dec (ix+00eh)		;bdac
	ret nz			;bdaf
	ld (ix+00eh),009h		;bdb0
	ld (ix+00fh),000h		;bdb4
	jr L_BDF9		;bdb8
L_BDBA:
	dec (ix+00eh)		;bdba
	jr z,L_BDD0		;bdbd
	ld a,(ix+00eh)		;bdbf
	and 007h		;bdc2
	ret nz			;bdc4
	inc (ix+00fh)		;bdc5
	ld a,(ix+00fh)		;bdc8
	add a,a			;bdcb
	ld (ix+00dh),a		;bdcc
	ret			;bdcf
L_BDD0:
	ld d,014h		;bdd0
L_BDD2:
	ld e,060h		;bdd2
L_BDD4:
	call 061ceh		;bdd4
	jr L_BDF9		;bdd7
L_BDD9:
	call 06247h		;bdd9
	ret nz			;bddc
	call 079c7h		;bddd
	ld a,017h		;bde0
	ld (0cb00h),a		;bde2
	xor a			;bde5
	ld (0cb3ch),a		;bde6
	inc a			;bde9
	ld (0d8abh),a		;bdea
	inc a			;bded
	ld (ix+00dh),a		;bdee
	call L_A777		;bdf1
	ld a,004h		;bdf4
L_BDF6:
	ld (0cb0eh),a		;bdf6
L_BDF9:
	inc (ix+001h)		;bdf9
	ret			;bdfc
L_BDFD:
	call L_BE95		;bdfd
	ld a,(0cb05h)		;be00
	cp 098h		;be03
	ret c			;be05
	ld a,001h		;be06
	jr L_BDF6		;be08
L_BE0A:
	call L_BE95		;be0a
	ld a,(0cb03h)		;be0d
	cp 038h		;be10
	ret nc			;be12
	ld a,001h		;be13
	ld (0cb42h),a		;be15
	ld a,003h		;be18
	jr L_BDF6		;be1a
L_BE1C:
	call L_BE95		;be1c
	ld a,001h		;be1f
	ld (0cb3ch),a		;be21
	ld d,015h		;be24
	jr L_BDD2		;be26
L_BE28:
	call L_BE95		;be28
	call 06247h		;be2b
	ret nz			;be2e
	call 079c7h		;be2f
	ld (ix+00eh),05ah		;be32
	call 06be8h		;be36
	jr L_BDF9		;be39
L_BE3B:
	dec (ix+00eh)		;be3b
	ret nz			;be3e
	xor a			;be3f
	call 079e9h		;be40   ; p01:79E9
	call 06b12h		;be43
	call 06b95h		;be46   ; p01:6B95
	ld (ix+00eh),020h		;be49
	jr L_BDF9		;be4d
L_BE4F:
	call 079f1h		;be4f   ; p01:79F1
	dec (ix+00eh)		;be52
	ret nz			;be55
	call 079fah		;be56   ; p01:79FA
	ld a,001h		;be59
	ld (0e25ah),a		;be5b
	inc a			;be5e
	call 06250h		;be5f   ; p01:6250
	jr L_BDF9		;be62
L_BE64:
	call 06bcch		;be64
	ld d,016h		;be67
	jp L_BDD2		;be69
L_BE6C:
	call 06247h		;be6c
	ret nz			;be6f
	call 079c7h		;be70
	ld (ix+00eh),020h		;be73
	ld a,017h		;be77
	ld (0cb00h),a		;be79
	xor a			;be7c
	ld (0cb3ch),a		;be7d
	ld (ix+00dh),006h		;be80
	ld a,003h		;be84
	ld b,a			;be86
	call L_A781		;be87
	ld a,002h		;be8a
	call L_BDF6		;be8c
	call 06b12h		;be8f
	jp 08685h		;be92
L_BE95:
	ld a,(0d8abh)		;be95
	and a			;be98
	ret z			;be99
	dec a			;be9a
	jr nz,L_BEB1		;be9b
	call 086deh		;be9d
	ld a,(ix+003h)		;bea0
	cp 050h		;bea3
	ret c			;bea5
	ld hl,0d8abh		;bea6
	inc (hl)			;bea9
	ld (ix+00dh),004h		;beaa
	jp L_A777		;beae
L_BEB1:
	call 086deh		;beb1
	ld a,(ix+005h)		;beb4
	cp 070h		;beb7
	ret nc			;beb9
	ld (ix+00dh),006h		;beba
	xor a			;bebe
	ld (ix+00ch),a		;bebf
	ld (0d8abh),a		;bec2
	ret			;bec5
L_BEC6:
	ld a,(0cb05h)		;bec6
	sub (ix+005h)		;bec9
	jr nc,L_BED0		;becc
	neg		;bece
L_BED0:
	cp 005h		;bed0
	ret nc			;bed2
	xor a			;bed3
	ld (ix+011h),a		;bed4
	ld (0cb3ch),a		;bed7
	inc a			;beda
	ld (0cb42h),a		;bedb
	ld (ix+016h),a		;bede
	call L_BEE7		;bee1
	jp L_BDF9		;bee4
L_BEE7:
	ld hl,0cb21h		;bee7
	ld a,(hl)			;beea
	sub 00ah		;beeb
	cp 002h		;beed
	ret nc			;beef
	ld (hl),000h		;bef0
	ld a,(0cb35h)		;bef2
	and 001h		;bef5
	ld (0cb00h),a		;bef7
	ld (0cb01h),a		;befa
	ld hl,0d8a4h		;befd
	ld bc,01810h		;bf00
	ld a,099h		;bf03
	jp 046f2h		;bf05   ; borra_bloque_pagina: p00:46FF en la pagina en la que se dibuja (0xCA42)
L_BF08:
	ld a,(ix+011h)		;bf08
	inc (ix+011h)		;bf0b
	and 03fh		;bf0e
	jr nz,L_BF19		;bf10
	ld a,(0ca53h)		;bf12
	and a			;bf15
	call nz,09d20h		;bf16   ; p04:9D20
L_BF19:
	ld a,(0cb0eh)		;bf19
	ld b,a			;bf1c
	ld hl,0bf37h		;bf1d
	call 043f6h		;bf20   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ex de,hl			;bf23
	call 08079h		;bf24
	ld a,e			;bf27
	add a,l			;bf28
	ld (ix+003h),a		;bf29
	ld a,d			;bf2c
	add a,h			;bf2d
	ld (ix+005h),a		;bf2e
	ld a,b			;bf31
	dec a			;bf32
	add a,008h		;bf33
	ld (ix+00dh),a		;bf35
	ret			;bf38

; ----------------------------------------------------------------------
; DATOS sin identificar  0xbf39..0xbf41  (8 bytes)
DATA_BF39:
	defb 000h,0fah,0fch,000h,0feh,003h,0feh,0f6h	; bf39  ........

; ======================================================================
; CODIGO 0xbf41..0xc000  (191 bytes)
; ======================================================================


L_BF41:
	call 08100h		;bf41
	ret nz			;bf44
	jp L_BDF9		;bf45
L_BF48:
	xor a			;bf48
	ld (ix+00ch),a		;bf49
	ld (ix+016h),a		;bf4c
	ld (ix+00eh),018h		;bf4f
	ld a,002h		;bf53
	ld (0d500h),a		;bf55
	ld a,00dh		;bf58
	ld (0d510h),a		;bf5a
	ld hl,0d7d6h		;bf5d
	set 7,(hl)		;bf60
	jp L_BDF9		;bf62
L_BF65:
	ld hl,00706h		;bf65
	ld (0ca4ch),hl		;bf68   ; guarda los 4 bits altos del byte de la sala (p56:BD28) y el byte siguiente (16 bits)
	ld hl,0ca42h		;bf6b   ; apunta a la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	ld a,(hl)			;bf6e
	push hl			;bf6f
	push af			;bf70
	xor 001h		;bf71
	ld (hl),a			;bf73
	call 041ddh		;bf74   ; bancos_12: pone el 12 en 0x6000 (con su copia en 0xC381-0xC383)
	call L_BD26		;bf77
	call 0413fh		;bf7a   ; bancos_1_4_5: pone el 1 en 0x6000, el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	pop af			;bf7d
	pop hl			;bf7e
	ld (hl),a			;bf7f
	ld a,0ffh		;bf80
	ld (0d88bh),a		;bf82
	ret			;bf85
L_BF86:
	dec (ix+00eh)		;bf86
	ret nz			;bf89
	call 06c1bh		;bf8a   ; p01:6C1B
	call 07a88h		;bf8d
	call 07c85h		;bf90
	call 08728h		;bf93
	call L_BF65		;bf96
	jp L_BDF9		;bf99
L_BF9C:
	xor a			;bf9c
	ld (0e070h),a		;bf9d
	ld a,(0d7d9h)		;bfa0
	and 020h		;bfa3
	ret z			;bfa5
	ld hl,0d7d9h		;bfa6
	set 4,(hl)		;bfa9
	ld a,002h		;bfab
	ld (0cb0eh),a		;bfad
	ld a,017h		;bfb0
	ld (0cb00h),a		;bfb2
	jp L_BDF9		;bfb5
L_BFB8:
	ld a,(0cb03h)		;bfb8
	cp 080h		;bfbb
	ret c			;bfbd
	ld a,001h		;bfbe
	ld (0cb3ch),a		;bfc0
	ld (0cb42h),a		;bfc3
	ld a,004h		;bfc6
	ld (0cb0eh),a		;bfc8
	ld hl,06bb0h		;bfcb
	call 07c85h		;bfce
	jp L_BDF9		;bfd1
L_BFD4:
	ld de,01718h		;bfd4
	jp L_BDD4		;bfd7
L_BFDA:
	call 06247h		;bfda
	ret nz			;bfdd
	call 079c7h		;bfde
	call 06be8h		;bfe1   ; p01:6BE8
	ld (ix+00eh),020h		;bfe4
	jp L_BDF9		;bfe8
L_BFEB:
	ld a,(ix+00eh)		;bfeb
	and a			;bfee
	jr z,L_BFF8		;bfef
	dec (ix+00eh)		;bff1
	ret nz			;bff4
	jp 06b12h		;bff5
L_BFF8:
	ld a,001h		;bff8
	ld (0e070h),a		;bffa
	jp 08c65h		;bffd   ; p04:8C65
