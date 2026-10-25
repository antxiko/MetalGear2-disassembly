; ==========================================================================
; METAL GEAR 2 SOLID SNAKE - Konami (1990) - MSX2 - MegaROM RC-767 de 512 KB (Konami SCC) - banco 11 (se ejecuta en 0xa000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x0a000


; ----------------------------------------------------------------------
; Etiquetas que no caen en ninguna posicion emitida del listado
; (destinos fuera del binario o dentro de una instruccion).
; ----------------------------------------------------------------------
L_AF05:	equ 0x0af05

; ----------------------------------------------------------------------
; Direcciones que solo aparecen como VALOR -en un `ld`, no en
; un salto-: son punteros que el codigo se pasa o numeros que
; casualmente coinciden con una direccion. No hay nada que
; trazar en ellas; el equ existe para que el listado ensamble.
; ----------------------------------------------------------------------
la08eh:	equ 0x0a08e

; ======================================================================
; CODIGO 0xa000..0xa006  (6 bytes)
; ======================================================================


L_A000:
	ld a,(0cb48h)		;a000
	call 0424dh		;a003

; ----------------------------------------------------------------------
; DATOS tabla_A006: 8 destinos del despachador p00:424D (call en p11:A003, el
;   indice en A): A016, A024, A033, A04B, A098, A0BB, A0D7, A0ED; lo leen
;   p11:A003 (16 bytes)
;   0xa006..0xa016  (16 bytes)
DATA_tabla_A006:
	defw 0a016h,0a024h,0a033h,0a04bh,0a098h,0a0bbh,0a0d7h,0a0edh	; a006

; ======================================================================
; CODIGO 0xa016..0xa090  (122 bytes)
; ======================================================================


L_A016:
	xor a			;a016
	ld (0cadfh),a		;a017
	ld hl,0aa51h		;a01a
	ld c,004h		;a01d
	call 07b24h		;a01f
	jr L_A03F		;a022
L_A024:
	ld de,0aa51h		;a024
	ld c,004h		;a027
	call 07b2dh		;a029
	ld a,(0cadah)		;a02c
	or a			;a02f
	ret nz			;a030
	jr L_A03F		;a031
L_A033:
	ld hl,0cb49h		;a033
	dec (hl)			;a036
	jr nz,L_A044		;a037
	ld (hl),010h		;a039
	ld hl,0cb01h		;a03b
	inc (hl)			;a03e
L_A03F:
	ld hl,0cb48h		;a03f
	inc (hl)			;a042
	ret			;a043
L_A044:
	ld a,(hl)			;a044
	cp 00ch		;a045
	ret nz			;a047
	jp 06ba8h		;a048
L_A04B:
	ld hl,0cb49h		;a04b
	dec (hl)			;a04e
	ret nz			;a04f
	ld (hl),008h		;a050
	inc hl			;a052
	inc (hl)			;a053
	ld a,(hl)			;a054
	cp 005h		;a055
	jr nc,L_A06A		;a057
	ld hl,la08eh		;a059
	add a,a			;a05c
	call 0423eh		;a05d
	ld a,(hl)			;a060
	ld (0cb03h),a		;a061
	inc hl			;a064
	ld a,(hl)			;a065
	ld (0cb05h),a		;a066
	ret			;a069
L_A06A:
	ld a,(0cb03h)		;a06a
	add a,020h		;a06d
	ld (0cb03h),a		;a06f
	ld a,(0cb05h)		;a072
	add a,008h		;a075
	ld (0cb05h),a		;a077
	ld hl,0cb49h		;a07a
	ld (hl),014h		;a07d
L_A07F:
	ld hl,0cb01h		;a07f
	ld (hl),004h		;a082
	ld a,001h		;a084
	ld (0cb16h),a		;a086
	ld a,007h		;a089
	ld (0cb17h),a		;a08b
L_A08E:
	jr L_A03F		;a08e

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa090..0xa098  (8 bytes)
DATA_A090:
	defb 06eh,0a5h,06dh,0a3h,069h,0a1h,060h,0a1h	; a090  n.m.i.`.

; ======================================================================
; CODIGO 0xa098..0xa1d7  (319 bytes)
; ======================================================================


L_A098:
	ld hl,0cb49h		;a098
	dec (hl)			;a09b
	ret nz			;a09c
	ld a,002h		;a09d
	ld hl,0cb01h		;a09f
	ld (hl),a			;a0a2
	xor a			;a0a3
	ld (0cb16h),a		;a0a4
	ld a,001h		;a0a7
	ld (0cb0ah),a		;a0a9
	ld a,002h		;a0ac
	ld (0cb15h),a		;a0ae
	ld a,(0cb05h)		;a0b1
	sub 008h		;a0b4
	ld (0cb05h),a		;a0b6
	jr $-122		;a0b9
L_A0BB:
	call 09430h		;a0bb
	ld hl,0cb05h		;a0be
	ld a,(hl)			;a0c1
	cp 08ah		;a0c2
	ret nc			;a0c4
	ld (hl),08ah		;a0c5
	ld hl,0cb49h		;a0c7
	ld (hl),040h		;a0ca
	ld a,000h		;a0cc
	ld (0cb0ah),a		;a0ce
	jr $-82		;a0d1
L_A0D3:
	xor a			;a0d3
	jp 08f8dh		;a0d4
L_A0D7:
	ld hl,0cb49h		;a0d7
	dec (hl)			;a0da
	ld a,(hl)			;a0db
	cp 022h		;a0dc
	jr z,L_A0D3		;a0de
	cp 022h		;a0e0
	ret nc			;a0e2
	or a			;a0e3
	jp nz,08f85h		;a0e4
	call L_A03F		;a0e7
	jp 08f7dh		;a0ea
L_A0ED:
	ld a,(0e257h)		;a0ed
	or a			;a0f0
	jr nz,L_A106		;a0f1
	call 0640eh		;a0f3
	ld a,002h		;a0f6
	ld (0cb15h),a		;a0f8
	xor a			;a0fb
	ld hl,0cb00h		;a0fc
	ld (hl),a			;a0ff
	inc l			;a100
	ld (hl),a			;a101
	ld (0cb16h),a		;a102
	ret			;a105
L_A106:
	xor a			;a106
	ld hl,0cabah		;a107
	ld (hl),a			;a10a
	ld hl,0cb00h		;a10b
	ld (hl),a			;a10e
	inc l			;a10f
	ld (hl),a			;a110
	ld (0cb16h),a		;a111
	jp 06b1eh		;a114
L_A117:
	ld a,(0ca4bh)		;a117
	ld c,a			;a11a
	call L_A167		;a11b
	ret nc			;a11e
	call L_A1DA		;a11f
	ccf			;a122
	ret			;a123
L_A124:
	ld a,c			;a124
	ld (0d8f3h),a		;a125
	call L_A167		;a128
	ret nc			;a12b
	cp 006h		;a12c
	jr nz,L_A141		;a12e
	push hl			;a130
	ld hl,0d7e2h		;a131
	set 4,(hl)		;a134
	ld hl,0d7e3h		;a136
	res 1,(hl)		;a139
	ld hl,0d7d3h		;a13b
	set 1,(hl)		;a13e
	pop hl			;a140
L_A141:
	call L_A1E2		;a141
	ret c			;a144
	call 06c8fh		;a145
	push hl			;a148
	ld a,(0d8f3h)		;a149
	ld hl,0ca4bh		;a14c
	cp (hl)			;a14f
	pop hl			;a150
	ret nz			;a151
	push hl			;a152
	push de			;a153
	push bc			;a154
	call L_A690		;a155
	call L_A916		;a158
	pop bc			;a15b
	pop de			;a15c
	pop hl			;a15d
	call 071ddh		;a15e
	call L_A6B3		;a161
	jp L_A947		;a164
L_A167:
	ld a,c			;a167
	ld (0d8f3h),a		;a168
	ld hl,0a26fh		;a16b
L_A16E:
	ld a,(0d8f3h)		;a16e
	ld c,a			;a171
	ld a,(hl)			;a172
	cp 0ffh		;a173
	jr z,$+99		;a175
	push hl			;a177
	ld a,(0ca4ah)		;a178
	cp (hl)			;a17b
	jr nz,L_A1CF		;a17c
	inc hl			;a17e
	ld b,(hl)			;a17f
	ld a,(0ca76h)		;a180
	or a			;a183
	jr z,L_A18E		;a184
	cp 026h		;a186
	jr nz,L_A1CF		;a188
	ld a,b			;a18a
	and 07fh		;a18b
	ld b,a			;a18d
L_A18E:
	ld a,c			;a18e
	cp b			;a18f
	jr nz,L_A1CF		;a190
	inc hl			;a192
	ld c,(hl)			;a193
	inc hl			;a194
	ld b,(hl)			;a195
	ld a,e			;a196
	cp c			;a197
	jr c,L_A1CF		;a198
	ld a,d			;a19a
	cp b			;a19b
	jr c,L_A1CF		;a19c
	inc hl			;a19e
	ld a,(hl)			;a19f
	add a,c			;a1a0
	ld c,a			;a1a1
	inc hl			;a1a2
	ld a,(hl)			;a1a3
	add a,b			;a1a4
	ld b,a			;a1a5
	ld a,e			;a1a6
	cp c			;a1a7
	jr nc,L_A1CF		;a1a8
	ld a,d			;a1aa
	cp b			;a1ab
	jr nc,L_A1CF		;a1ac
	pop de			;a1ae
	push hl			;a1af
	ld c,(hl)			;a1b0
	rrc c		;a1b1
	rrc c		;a1b3
	rrc c		;a1b5
	dec hl			;a1b7
	ld b,(hl)			;a1b8
	rrc b		;a1b9
	rrc b		;a1bb
	rrc b		;a1bd
	dec hl			;a1bf
	ld d,(hl)			;a1c0
	dec hl			;a1c1
	ld e,(hl)			;a1c2
	pop hl			;a1c3
	inc hl			;a1c4
	ld a,(hl)			;a1c5
	push af			;a1c6
	inc hl			;a1c7
	ld a,(hl)			;a1c8
	inc hl			;a1c9
	ld h,(hl)			;a1ca
	ld l,a			;a1cb
	pop af			;a1cc
	scf			;a1cd
	ret			;a1ce
L_A1CF:
	pop hl			;a1cf
	ld a,009h		;a1d0
	call 0423eh		;a1d2
	jr L_A16E		;a1d5

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa1d7..0xa1d8  (1 bytes)
DATA_A1D7:
	defb 0e1h	; a1d7

; ======================================================================
; CODIGO 0xa1d8..0xa202  (42 bytes)
; ======================================================================


L_A1D8:
	and a			;a1d8
	ret			;a1d9
L_A1DA:
	ld hl,0dfc0h		;a1da
	call 04248h		;a1dd
	rra			;a1e0
	ret			;a1e1
L_A1E2:
	push hl			;a1e2
	exx			;a1e3
	ld b,a			;a1e4
	exx			;a1e5
	call L_A1DA		;a1e6
	jr c,L_A200		;a1e9
	ld (hl),001h		;a1eb
	exx			;a1ed
	ld a,b			;a1ee
	exx			;a1ef
	ld hl,0a202h		;a1f0
	call 04248h		;a1f3
	cp 0ffh		;a1f6
	jr z,L_A1FF		;a1f8
	call L_A1DA		;a1fa
	ld (hl),001h		;a1fd
L_A1FF:
	and a			;a1ff
L_A200:
	pop hl			;a200
	ret			;a201

; ----------------------------------------------------------------------
; DATOS resto_A202: lo apuntan con el banco puesto p11:A1F0 (0xA202); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p11:A1F0 (11 bytes)
;   0xa202..0xa20d  (11 bytes)
DATA_resto_A202:
	defb 004h,0ffh,003h,002h,000h,0ffh,0ffh,0ffh,0ffh,00ah,009h	; a202  ...........

; ======================================================================
; CODIGO 0xa20d..0xa26f  (98 bytes)
; ======================================================================


L_A20D:
	ld a,(0d8c0h)		;a20d
	or a			;a210
	ret nz			;a211
	ld a,(0ca4ah)		;a212
	cp 00ch		;a215
	jr nz,L_A21E		;a217
	ld a,(0ca76h)		;a219
	or a			;a21c
	ret nz			;a21d
L_A21E:
	ld hl,0a26fh		;a21e
L_A221:
	ld a,(hl)			;a221
	cp 0ffh		;a222
	ret z			;a224
	push hl			;a225
	ld a,(0ca4ah)		;a226
	cp (hl)			;a229
	jr nz,L_A267		;a22a
	inc hl			;a22c
	ld b,(hl)			;a22d
	ld a,(0ca76h)		;a22e
	or a			;a231
	jr z,L_A23C		;a232
	cp 026h		;a234
	jr nz,L_A267		;a236
	ld a,b			;a238
	and 07fh		;a239
	ld b,a			;a23b
L_A23C:
	ld a,(0ca4bh)		;a23c
	cp b			;a23f
	jr nz,L_A267		;a240
	inc hl			;a242
	ld e,(hl)			;a243
	inc hl			;a244
	ld d,(hl)			;a245
	inc hl			;a246
	ld b,(hl)			;a247
	rrc b		;a248
	rrc b		;a24a
	rrc b		;a24c
	inc hl			;a24e
	ld c,(hl)			;a24f
	rrc c		;a250
	rrc c		;a252
	rrc c		;a254
	inc hl			;a256
	ld a,(hl)			;a257
	push hl			;a258
	call L_A1DA		;a259
	pop hl			;a25c
	jr nc,L_A267		;a25d
	inc hl			;a25f
	ld a,(hl)			;a260
	inc hl			;a261
	ld h,(hl)			;a262
	ld l,a			;a263
	call 071ddh		;a264
L_A267:
	pop hl			;a267
	ld a,009h		;a268
	call 0423eh		;a26a
	jr L_A221		;a26d

; ----------------------------------------------------------------------
; DATOS resto_A26F: lo apuntan con el banco puesto p11:A16B (0xA26F), p11:A21E
;   (0xA26F); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p11:A16B, p11:A21E (282 bytes)
;   0xa26f..0xa389  (282 bytes)
DATA_resto_A26F:
	defb 00ch,004h,000h,000h,048h,028h,000h,0c1h,0a2h,00ch,005h,060h,038h,048h,030h,001h	; a26f  ....H(.....`8H0.
	defb 0eeh,0a2h,00ch,006h,020h,0a0h,040h,020h,002h,024h,0a3h,00ch,007h,020h,000h,040h	; a27f  .... .@ .$... .@
	defb 020h,003h,024h,0a3h,00ch,007h,0a0h,000h,020h,028h,004h,044h,0a3h,00ch,008h,060h	; a28f   .$..... (.D...`
	defb 058h,048h,030h,005h,0eeh,0a2h,00fh,000h,000h,060h,020h,020h,006h,058h,0a3h,006h	; a29f  XH0......`  .X..
	defb 081h,060h,0b8h,058h,008h,009h,068h,0a3h,006h,082h,060h,000h,058h,010h,00ah,073h	; a2af  .`.X..h...`.X..s
	defb 0a3h,0ffh,041h,004h,001h,034h,078h,041h,004h,001h,034h,078h,041h,004h,001h,034h	; a2bf  ..A..4xA..4xA..4
	defb 078h,041h,004h,001h,034h,07ah,041h,004h,001h,035h,030h,041h,004h,001h,036h,032h	; a2cf  xA..4zA..50A..62
	defb 041h,004h,001h,037h,032h,041h,004h,001h,052h,050h,041h,004h,001h,003h,004h,077h	; a2df  A..72A..RPA....w
	defb 02eh,001h,001h,02fh,075h,079h,041h,013h,001h,034h,078h,079h,041h,004h,001h,034h	; a2ef  .../uyA..4xyA..4
	defb 078h,07bh,041h,004h,001h,034h,07ah,051h,045h,004h,001h,035h,030h,040h,043h,004h	; a2ff  x{A..4zQE..50@C.
	defb 001h,036h,032h,040h,044h,004h,001h,037h,032h,04ch,04dh,004h,001h,052h,050h,004h	; a30f  .62@D..72LM..RP.
	defb 004h,004h,001h,003h,004h,030h,051h,030h,051h,032h,040h,032h,040h,032h,040h,032h	; a31f  .....0Q0Q2@2@2@2
	defb 040h,050h,04ch,050h,04ch,004h,004h,004h,004h,001h,001h,001h,001h,001h,001h,001h	; a32f  @PLPL...........
	defb 001h,001h,001h,001h,001h,041h,004h,004h,004h,004h,041h,004h,001h,001h,001h,041h	; a33f  .....A....A....A
	defb 004h,001h,001h,001h,041h,004h,001h,02fh,075h,000h,000h,000h,000h,000h,000h,000h	; a34f  ....A../u.......
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,056h,057h,058h,059h,08ah,081h,088h	; a35f  .........VWXY...
	defb 081h,0f1h,062h,062h,049h,082h,04ah,085h,04bh,082h,04ch,082h,085h,085h,081h,081h	; a36f  ..bbI.J.K.L.....
	defb 081h,081h,088h,088h,0f0h,081h,02bh,083h,02bh,085h	; a37f  ......+.+.

; ======================================================================
; CODIGO 0xa389..0xa3e6  (93 bytes)
; ======================================================================


L_A389:
	xor a			;a389
	ld (0dfe8h),a		;a38a
	ld (0e060h),a		;a38d
	ld a,(0ca4ah)		;a390
	cp 006h		;a393
	ret nz			;a395
	ld a,(0ca4bh)		;a396
	cp 010h		;a399
	ret nz			;a39b
	xor a			;a39c
	ld (0dfe9h),a		;a39d
	inc a			;a3a0
	ld (0dfe8h),a		;a3a1
	ld a,0a8h		;a3a4
	ld (0dfeah),a		;a3a6
	call L_A446		;a3a9
	call L_A497		;a3ac
	ld hl,0dd96h		;a3af
	call L_A3BE		;a3b2
	ld hl,0ddaeh		;a3b5
	call L_A3BE		;a3b8
	ld hl,0ddc6h		;a3bb
L_A3BE:
	ld a,09dh		;a3be
	ld (hl),a			;a3c0
	inc hl			;a3c1
	ld (hl),a			;a3c2
	ret			;a3c3
L_A3C4:
	ld a,(0dfe8h)		;a3c4
	or a			;a3c7
	ret z			;a3c8
	call L_A3E0		;a3c9
	call L_A446		;a3cc
	call L_A497		;a3cf
	call L_A4AE		;a3d2
	ld a,(0e060h)		;a3d5
	or a			;a3d8
	ret z			;a3d9
	call L_A4F0		;a3da
	jp L_A583		;a3dd
L_A3E0:
	ld a,(0dfe9h)		;a3e0
	call 0424dh		;a3e3

; ----------------------------------------------------------------------
; DATOS tabla_A3E6: 3 destinos del despachador p00:424D (call en p11:A3E3, el
;   indice en A): A3EC, A3F9, A415; lo leen p11:A3E3 (6 bytes)
;   0xa3e6..0xa3ec  (6 bytes)
DATA_tabla_A3E6:
	defw 0a3ech,0a3f9h,0a415h	; a3e6  -> L_A3EC L_A3F9 L_A415

; ======================================================================
; CODIGO 0xa3ec..0xa4a6  (186 bytes)
; ======================================================================


L_A3EC:
	ld a,(0e060h)		;a3ec
	or a			;a3ef
	ret z			;a3f0
	ld a,(0e067h)		;a3f1
	cp 003h		;a3f4
	ret nc			;a3f6
	jr L_A404		;a3f7
L_A3F9:
	call L_A409		;a3f9
	ld hl,0dfeah		;a3fc
	dec (hl)			;a3ff
	ld a,(hl)			;a400
	cp 041h		;a401
	ret nc			;a403
L_A404:
	ld hl,0dfe9h		;a404
	inc (hl)			;a407
	ret			;a408
L_A409:
	ld a,(0cb00h)		;a409
	cp 014h		;a40c
	ret z			;a40e
	cp 01bh		;a40f
	ret nc			;a411
	jp 06adeh		;a412
L_A415:
	call L_A409		;a415
	ld hl,0dfeah		;a418
	inc (hl)			;a41b
	inc (hl)			;a41c
	ld a,(hl)			;a41d
	cp 0a8h		;a41e
	ret c			;a420
	ld hl,0dfe9h		;a421
	ld (hl),000h		;a424
	ret			;a426
L_A427:
	ld a,(0ca4ah)		;a427
	cp 006h		;a42a
	ret nz			;a42c
	ld a,(0ca50h)		;a42d
	cp 005h		;a430
	ret nz			;a432
	ld a,(0ca51h)		;a433
	cp 008h		;a436
	ret nz			;a438
	ld hl,0dfeah		;a439
	ld a,(hl)			;a43c
	or a			;a43d
	jr nz,L_A442		;a43e
	ld (hl),0a8h		;a440
L_A442:
	xor a			;a442
	call L_A49D		;a443
L_A446:
	call L_A44E		;a446
	call L_A45C		;a449
	jr L_A478		;a44c
L_A44E:
	ld hl,0dfeah		;a44e
	ld d,(hl)			;a451
	ld e,027h		;a452
	ld c,0f0h		;a454
	ld hl,0dc28h		;a456
	jp L_A46C		;a459
L_A45C:
	ld e,037h		;a45c
	ld b,008h		;a45e
L_A460:
	ld c,0f8h		;a460
	call L_A46C		;a462
	ld a,e			;a465
	add a,010h		;a466
	ld e,a			;a468
	djnz L_A460		;a469
	ret			;a46b
L_A46C:
	call 05d41h		;a46c
	ld a,c			;a46f
	add a,004h		;a470
	ld c,a			;a472
	bit 2,a		;a473
	jr nz,L_A46C		;a475
	ret			;a477
L_A478:
	ld hl,0daa0h		;a478
	ld de,0daa1h		;a47b
	ld b,009h		;a47e
L_A480:
	push bc			;a480
	ld (hl),008h		;a481
	ld bc,0000fh		;a483
	ldir		;a486
	inc hl			;a488
	inc de			;a489
	ld (hl),047h		;a48a
	ld bc,0000fh		;a48c
	ldir		;a48f
	inc hl			;a491
	inc de			;a492
	pop bc			;a493
	djnz L_A480		;a494
	ret			;a496
L_A497:
	ld a,(0ca03h)		;a497
	rra			;a49a
	and 003h		;a49b
L_A49D:
	ld hl,0a4a6h		;a49d
	call 043f6h		;a4a0
	jp 0714fh		;a4a3

; ----------------------------------------------------------------------
; DATOS resto_A4A6: lo apuntan con el banco puesto p11:A49D (0xA4A6); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p11:A49D (8 bytes)
;   0xa4a6..0xa4ae  (8 bytes)
DATA_resto_A4A6:
	defb 0c2h,0a3h,0d6h,0a3h,0eah,0a3h,0feh,0a3h	; a4a6  ........

; ======================================================================
; CODIGO 0xa4ae..0xa4e5  (55 bytes)
; ======================================================================


L_A4AE:
	ld a,(0e060h)		;a4ae
	or a			;a4b1
	ret nz			;a4b2
	ld a,(0dfe9h)		;a4b3
	or a			;a4b6
	ret nz			;a4b7
	ld a,(0cb03h)		;a4b8
	cp 078h		;a4bb
	ret c			;a4bd
	ld de,0e060h		;a4be
	ld hl,0a4e5h		;a4c1
	ld bc,0000bh		;a4c4
	ldir		;a4c7
	ld hl,0d4e8h		;a4c9
	ld (hl),000h		;a4cc
	ld a,r		;a4ce
	ld hl,0ca03h		;a4d0
	ld b,(hl)			;a4d3
	rlca			;a4d4
	rlca			;a4d5
	rlca			;a4d6
	xor (hl)			;a4d7
	add a,b			;a4d8
	and 007h		;a4d9
	add a,008h		;a4db
	cp 00fh		;a4dd
	jr nz,L_A4E3		;a4df
	ld a,00ah		;a4e1
L_A4E3:
	ld (de),a			;a4e3
	ret			;a4e4

; ----------------------------------------------------------------------
; DATOS resto_A4E5: lo apuntan con el banco puesto p11:A4C1 (0xA4E5); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p11:A4C1 (11 bytes)
;   0xa4e5..0xa4f0  (11 bytes)
DATA_resto_A4E5:
	defb 001h,000h,000h,022h,000h,088h,000h,004h,000h,000h,000h	; a4e5  ...".......

; ======================================================================
; CODIGO 0xa4f0..0xa4f6  (6 bytes)
; ======================================================================


L_A4F0:
	ld a,(0e061h)		;a4f0
	call 0424dh		;a4f3

; ----------------------------------------------------------------------
; DATOS tabla_A4F6: 4 destinos del despachador p00:424D (call en p11:A4F3, el
;   indice en A): A4FE, A50F, A530, A540; lo leen p11:A4F3 (8 bytes)
;   0xa4f6..0xa4fe  (8 bytes)
DATA_tabla_A4F6:
	defw 0a4feh,0a50fh,0a530h,0a540h	; a4f6  -> L_A4FE L_A50F L_A530 L_A540

; ======================================================================
; CODIGO 0xa4fe..0xa70f  (529 bytes)
; ======================================================================


L_A4FE:
	ld de,0ffd0h		;a4fe
	ld hl,(0e066h)		;a501
	add hl,de			;a504
	ld (0e066h),hl		;a505
	rl h		;a508
	jp nc,L_A54A		;a50a
	jr L_A52B		;a50d
L_A50F:
	ld a,(0dfeah)		;a50f
	cp 094h		;a512
	ret nc			;a514
	sub 00ch		;a515
	ld hl,0e065h		;a517
	ld (hl),a			;a51a
	cp 038h		;a51b
	ret nc			;a51d
	xor a			;a51e
	ld hl,0e066h		;a51f
	ld (hl),a			;a522
	inc hl			;a523
	ld (hl),002h		;a524
	inc hl			;a526
	ld (hl),a			;a527
	inc hl			;a528
	ld (hl),0feh		;a529
L_A52B:
	ld hl,0e061h		;a52b
	inc (hl)			;a52e
	ret			;a52f
L_A530:
	call L_A55E		;a530
	ld a,(0e065h)		;a533
	cp 010h		;a536
	ret nc			;a538
	ld hl,0e06ah		;a539
	ld (hl),008h		;a53c
	jr L_A52B		;a53e
L_A540:
	ld hl,0e06ah		;a540
	dec (hl)			;a543
	ret nz			;a544
	xor a			;a545
	ld (0e060h),a		;a546
	ret			;a549
L_A54A:
	call L_A55E		;a54a
	ld a,(0e063h)		;a54d
	cp 034h		;a550
	ret c			;a552
	ld hl,0d4e8h		;a553
	ld a,(hl)			;a556
	or a			;a557
	ret nz			;a558
	ld (hl),001h		;a559
	jp 06c8bh		;a55b
L_A55E:
	ld hl,(0e066h)		;a55e
	ld d,h			;a561
	ld e,l			;a562
	ld hl,(0e062h)		;a563
	add hl,de			;a566
	ld (0e062h),hl		;a567
	ld hl,(0e068h)		;a56a
	ld d,h			;a56d
	ld e,l			;a56e
	ld hl,(0e064h)		;a56f
	add hl,de			;a572
	ld (0e064h),hl		;a573
	ret			;a576
L_A577:
	ld a,(0ca4ah)		;a577
	cp 006h		;a57a
	ret nz			;a57c
	ld a,(0ca4bh)		;a57d
	cp 018h		;a580
	ret nc			;a582
L_A583:
	ld a,(0e060h)		;a583
	or a			;a586
	jr z,L_A59D		;a587
	ld a,(0ca4ah)		;a589
	cp 006h		;a58c
	ret nz			;a58e
	ld a,(0ca4bh)		;a58f
	cp 010h		;a592
	ret nz			;a594
	call L_A5AB		;a595
	call L_A5BE		;a598
	jr L_A5D9		;a59b
L_A59D:
	ld hl,0dc70h		;a59d
	ld de,0dc71h		;a5a0
	ld (hl),0e0h		;a5a3
	ld bc,00007h		;a5a5
	ldir		;a5a8
	ret			;a5aa
L_A5AB:
	ld hl,0dc70h		;a5ab
	ld a,(0e063h)		;a5ae
	ld e,a			;a5b1
	ld a,(0e065h)		;a5b2
	ld d,a			;a5b5
	ld c,0e8h		;a5b6
	call 05d41h		;a5b8
	jp 05d3dh		;a5bb
L_A5BE:
	ld hl,0dbc0h		;a5be
	ld de,0dbc1h		;a5c1
	ld (hl),007h		;a5c4
	ld bc,0000fh		;a5c6
	ldir		;a5c9
	inc hl			;a5cb
	inc de			;a5cc
	ld a,(0e06bh)		;a5cd
	add a,040h		;a5d0
	ld (hl),a			;a5d2
	ld bc,0000fh		;a5d3
	ldir		;a5d6
	ret			;a5d8
L_A5D9:
	ld a,(0e063h)		;a5d9
	sub 032h		;a5dc
	ret nc			;a5de
	neg		;a5df
	cp 010h		;a5e1
	jr c,L_A5E7		;a5e3
	ld a,010h		;a5e5
L_A5E7:
	ld c,a			;a5e7
	ld b,000h		;a5e8
	push bc			;a5ea
	ld hl,0dbc0h		;a5eb
	ld de,0dbc1h		;a5ee
	ld (hl),000h		;a5f1
	ldir		;a5f3
	pop bc			;a5f5
	ld hl,0dbd0h		;a5f6
	ld de,0dbd1h		;a5f9
	ld (hl),000h		;a5fc
	ldir		;a5fe
	ret			;a600
L_A601:
	call L_A607		;a601
	jp L_AEB2		;a604
L_A607:
	ld ix,0cc00h		;a607
	ld b,008h		;a60b
L_A60D:
	push bc			;a60d
	ld a,(ix+000h)		;a60e
	or a			;a611
	call nz,L_A64E		;a612
	ld de,00010h		;a615
	add ix,de		;a618
	pop bc			;a61a
	djnz L_A60D		;a61b
	ret			;a61d
L_A61E:
	ld ix,0cc00h		;a61e
	ld b,008h		;a622
L_A624:
	ld a,(ix+000h)		;a624
	or a			;a627
	jr z,L_A632		;a628
	push bc			;a62a
	call L_A63A		;a62b
	call z,L_A655		;a62e
	pop bc			;a631
L_A632:
	ld de,00010h		;a632
	add ix,de		;a635
	djnz L_A624		;a637
	ret			;a639
L_A63A:
	push bc			;a63a
	call L_B4F3		;a63b
	pop bc			;a63e
	ret nz			;a63f
	ld a,(0ca50h)		;a640
	cp (ix+004h)		;a643
	ret nz			;a646
	ld a,(0ca51h)		;a647
	cp (ix+005h)		;a64a
	ret			;a64d
L_A64E:
	call L_A63A		;a64e
	ret nz			;a651
L_A652:
	call L_A66D		;a652
L_A655:
	ld e,(ix+002h)		;a655
	ld d,(ix+003h)		;a658
	ld hl,000b0h		;a65b
	ld bc,00808h		;a65e
	ld a,(0ca42h)		;a661
	rlca			;a664
	rlca			;a665
	rlca			;a666
	rlca			;a667
	or 0c8h		;a668
	jp 047edh		;a66a
L_A66D:
	call L_A673		;a66d
	jp 0474dh		;a670
L_A673:
	dec b			;a673
	ld a,b			;a674
	and 004h		;a675
	ld a,b			;a677
	ld e,0b0h		;a678
	jr z,L_A67E		;a67a
	ld e,0b8h		;a67c
L_A67E:
	and 003h		;a67e
	rlca			;a680
	rlca			;a681
	rlca			;a682
	add a,0c0h		;a683
	ld d,a			;a685
	ld l,(ix+002h)		;a686
	ld h,(ix+003h)		;a689
	ld bc,00808h		;a68c
	ret			;a68f
L_A690:
	ld ix,0cc00h		;a690
	ld b,008h		;a694
L_A696:
	ld a,(ix+000h)		;a696
	or a			;a699
	jr z,L_A6A4		;a69a
	push bc			;a69c
	call L_A63A		;a69d
	call z,L_A6AC		;a6a0
	pop bc			;a6a3
L_A6A4:
	ld de,00010h		;a6a4
	add ix,de		;a6a7
	djnz L_A696		;a6a9
	ret			;a6ab
L_A6AC:
	call L_A673		;a6ac
	ex de,hl			;a6af
	jp 0475ah		;a6b0
L_A6B3:
	ld ix,0cc00h		;a6b3
	ld b,008h		;a6b7
L_A6B9:
	ld a,(ix+000h)		;a6b9
	or a			;a6bc
	jr z,L_A6D9		;a6bd
	ld a,(0ca50h)		;a6bf
	cp (ix+004h)		;a6c2
	jr nz,L_A6D9		;a6c5
	ld a,(0ca51h)		;a6c7
	cp (ix+005h)		;a6ca
	jr nz,L_A6D9		;a6cd
	push bc			;a6cf
	push bc			;a6d0
	call L_A66D		;a6d1
	pop bc			;a6d4
	call L_A655		;a6d5
	pop bc			;a6d8
L_A6D9:
	ld de,00010h		;a6d9
	add ix,de		;a6dc
	djnz L_A6B9		;a6de
	ret			;a6e0
L_A6E1:
	ld a,(0cb00h)		;a6e1
	cp 009h		;a6e4
	ret z			;a6e6
	cp 00ah		;a6e7
	ret z			;a6e9
	ld a,(0cb61h)		;a6ea
	or a			;a6ed
	jp nz,L_A85C		;a6ee
	ld a,(0cb44h)		;a6f1
	or a			;a6f4
	call z,L_A88F		;a6f5
	ld a,(0cb20h)		;a6f8
	or a			;a6fb
	jr nz,L_A70B		;a6fc
	ld a,(0cb80h)		;a6fe
	cp 005h		;a701
	jp z,L_A89A		;a703
	ld a,(0cb52h)		;a706
	or a			;a709
	ret z			;a70a
L_A70B:
	dec a			;a70b
	call 0424dh		;a70c

; ----------------------------------------------------------------------
; DATOS tabla_A70F: 13 destinos del despachador p00:424D (call en p11:A70C, el
;   indice en A): A729, A729, A7A8, A747, A89A, A832, A747, A85C, A747, A7A3,
;   A762, A747, A747; lo leen p11:A70C (26 bytes)
;   0xa70f..0xa729  (26 bytes)
DATA_tabla_A70F:
	defw 0a729h,0a729h,0a7a8h,0a747h,0a89ah,0a832h,0a747h,0a85ch	; a70f
	defw 0a747h,0a7a3h,0a762h,0a747h,0a747h	; a71f

; ======================================================================
; CODIGO 0xa729..0xaa40  (791 bytes)
; ======================================================================


L_A729:
	ld ix,0cb80h		;a729
	ld hl,0dc10h		;a72d
	ld de,0da40h		;a730
	ld b,006h		;a733
L_A735:
	push bc			;a735
	ld a,(ix+000h)		;a736
	or a			;a739
	call nz,L_A748		;a73a
	push de			;a73d
	ld de,00010h		;a73e
	add ix,de		;a741
	pop de			;a743
	pop bc			;a744
	djnz L_A735		;a745
L_A747:
	ret			;a747
L_A748:
	push de			;a748
	ld e,(ix+003h)		;a749
	ld d,(ix+005h)		;a74c
	ld c,018h		;a74f
	call 05d41h		;a751
	pop de			;a754
	push hl			;a755
	ld a,007h		;a756
	ld bc,0000fh		;a758
	ld h,d			;a75b
	ld l,e			;a75c
	call 04237h		;a75d
	pop hl			;a760
	ret			;a761
L_A762:
	ld ix,0cb80h		;a762
	ld a,(ix+000h)		;a766
	cp 008h		;a769
	ret nz			;a76b
	call L_A77C		;a76c
	ld a,(ix+00bh)		;a76f
	cp 003h		;a772
	jr c,L_A776		;a774
L_A776:
	call L_A792		;a776
	jp L_A8BC		;a779
L_A77C:
	call L_A782		;a77c
	jp L_A8D4		;a77f
L_A782:
	ld a,(ix+00bh)		;a782
	add a,0bfh		;a785
	ld l,a			;a787
	ld h,000h		;a788
	ld a,(ix+00fh)		;a78a
	or a			;a78d
	ret z			;a78e
	ld h,080h		;a78f
	ret			;a791
L_A792:
	ld e,(ix+003h)		;a792
	ld d,(ix+005h)		;a795
	ld hl,0dc10h		;a798
	ld c,020h		;a79b
	call 05d41h		;a79d
	jp 05d3dh		;a7a0
L_A7A3:
	ld bc,00748h		;a7a3
	jr L_A7B0		;a7a6
L_A7A8:
	ld bc,0034eh		;a7a8
	push bc			;a7ab
	call L_A7E3		;a7ac
	pop bc			;a7af
L_A7B0:
	ld ix,0cb80h		;a7b0
	ld a,(ix+000h)		;a7b4
	cp b			;a7b7
	ret nz			;a7b8
	call L_A7CD		;a7b9
L_A7BC:
	ld hl,0dc10h		;a7bc
	ld e,(ix+003h)		;a7bf
	ld d,(ix+005h)		;a7c2
	ld c,020h		;a7c5
	call 05d41h		;a7c7
	jp 05d3dh		;a7ca
L_A7CD:
	push bc			;a7cd
	ld hl,0da40h		;a7ce
	ld a,007h		;a7d1
	ld bc,0000fh		;a7d3
	call 04237h		;a7d6
	inc hl			;a7d9
	inc de			;a7da
	pop bc			;a7db
	ld a,c			;a7dc
	ld bc,0000fh		;a7dd
	jp 04237h		;a7e0
L_A7E3:
	ld a,(0cb00h)		;a7e3
	cp 002h		;a7e6
	ret z			;a7e8
	cp 005h		;a7e9
	ret z			;a7eb
	cp 00bh		;a7ec
	ret z			;a7ee
	cp 00fh		;a7ef
	ret z			;a7f1
	ld a,(0cb21h)		;a7f2
	cp 002h		;a7f5
	ret z			;a7f7
	call L_A822		;a7f8
	ret nc			;a7fb
	ld a,(0cb80h)		;a7fc
	or a			;a7ff
	ret nz			;a800
	ld a,(0cb22h)		;a801
	cp 0b1h		;a804
	ret nc			;a806
	ld e,a			;a807
	ld a,(0cb23h)		;a808
	cp 0b1h		;a80b
	ret nc			;a80d
	ld d,a			;a80e
	ld hl,0dc18h		;a80f
	ld c,01ch		;a812
	call 05d41h		;a814
	ld hl,0da60h		;a817
	ld a,007h		;a81a
	ld bc,0000fh		;a81c
	jp 04237h		;a81f
L_A822:
	ld hl,0df80h		;a822
	ld b,008h		;a825
	ld de,00008h		;a827
L_A82A:
	ld a,(hl)			;a82a
	or a			;a82b
	ret nz			;a82c
	add hl,de			;a82d
	djnz L_A82A		;a82e
	scf			;a830
	ret			;a831
L_A832:
	ld ix,0cb80h		;a832
	ld a,(ix+000h)		;a836
	cp 006h		;a839
	ret nz			;a83b
	call L_A845		;a83c
	call L_A7BC		;a83f
	jp L_A8BC		;a842
L_A845:
	call L_A84B		;a845
	jp L_A8D4		;a848
L_A84B:
	ld l,0c0h		;a84b
	ld a,(ix+00bh)		;a84d
	cp 003h		;a850
	jr c,L_A855		;a852
L_A854:
	inc l			;a854
L_A855:
	ld h,000h		;a855
	rra			;a857
	ret c			;a858
	ld h,080h		;a859
	ret			;a85b
L_A85C:
	ld ix,0cc80h		;a85c
	ld b,010h		;a860
L_A862:
	push bc			;a862
	ld a,(ix+000h)		;a863
	or a			;a866
	call nz,L_A873		;a867
	ld de,00008h		;a86a
	add ix,de		;a86d
	pop bc			;a86f
	djnz L_A862		;a870
	ret			;a872
L_A873:
	ld a,(ix+001h)		;a873
	or a			;a876
	ret nz			;a877
	call L_A87E		;a878
	jp L_A8BC		;a87b
L_A87E:
	ld hl,0dc10h		;a87e
	ld e,(ix+002h)		;a881
	ld d,(ix+003h)		;a884
	ld c,020h		;a887
	call 05d41h		;a889
	jp 05d3dh		;a88c
L_A88F:
	ld hl,0dc10h		;a88f
	ld a,0e0h		;a892
	ld bc,00017h		;a894
	jp 04237h		;a897
L_A89A:
	ld hl,0caabh		;a89a
	ld a,(hl)			;a89d
	or a			;a89e
	jr z,L_A8A4		;a89f
	ld (hl),000h		;a8a1
	ret			;a8a3
L_A8A4:
	ld ix,0cb80h		;a8a4
	call L_A8EE		;a8a8
	ld a,(ix+003h)		;a8ab
	cp 0c0h		;a8ae
	ret nc			;a8b0
	ld a,(ix+00fh)		;a8b1
	or a			;a8b4
	ret z			;a8b5
	call L_A8D1		;a8b6
	call L_A7BC		;a8b9
L_A8BC:
	ld hl,0da40h		;a8bc
	ld bc,0000fh		;a8bf
	ld a,007h		;a8c2
	call 04237h		;a8c4
	inc de			;a8c7
	inc hl			;a8c8
	ld bc,0000fh		;a8c9
	ld a,048h		;a8cc
	jp 04237h		;a8ce
L_A8D1:
	call L_A8DF		;a8d1
L_A8D4:
	ld de,000f2h		;a8d4
	ld bc,08001h		;a8d7
	ld a,007h		;a8da
	jp 04767h		;a8dc
L_A8DF:
	ld a,(ix+00fh)		;a8df
	or a			;a8e2
	ret z			;a8e3
	ld l,0c0h		;a8e4
	cp 003h		;a8e6
	jp c,L_A855		;a8e8
	jp L_A854		;a8eb
L_A8EE:
	ld hl,0dc18h		;a8ee
	ld a,(ix+00ch)		;a8f1
	sub 007h		;a8f4
	ld e,a			;a8f6
	ld a,(0cb21h)		;a8f7
	cp 002h		;a8fa
	jr nz,L_A900		;a8fc
	ld e,0e0h		;a8fe
L_A900:
	ld a,(ix+00dh)		;a900
	sub 007h		;a903
	ld d,a			;a905
	ld c,01ch		;a906
	call 05d41h		;a908
	ld hl,0da60h		;a90b
	ld a,007h		;a90e
	ld bc,0000fh		;a910
	jp 04237h		;a913
L_A916:
	ld ix,0df80h		;a916
	ld b,008h		;a91a
L_A91C:
	ld a,(ix+000h)		;a91c
	and 07fh		;a91f
	jr z,L_A93F		;a921
	ld a,(ix+007h)		;a923
	and 00fh		;a926
	jr z,L_A93F		;a928
	ld a,(0ca50h)		;a92a
	cp (ix+004h)		;a92d
	jr nz,L_A93F		;a930
	ld a,(0ca51h)		;a932
	cp (ix+005h)		;a935
	jr nz,L_A93F		;a938
	push bc			;a93a
	call 08f3eh		;a93b
	pop bc			;a93e
L_A93F:
	ld de,00008h		;a93f
	add ix,de		;a942
	djnz L_A91C		;a944
	ret			;a946
L_A947:
	ld ix,0df80h		;a947
	ld b,008h		;a94b
L_A94D:
	ld a,(ix+000h)		;a94d
	and 07fh		;a950
	jr z,L_A975		;a952
	ld a,(ix+007h)		;a954
	and 00fh		;a957
	jr z,L_A975		;a959
	ld a,(0ca50h)		;a95b
	cp (ix+004h)		;a95e
	jr nz,L_A975		;a961
	ld a,(0ca51h)		;a963
	cp (ix+005h)		;a966
	jr nz,L_A975		;a969
	push bc			;a96b
	push bc			;a96c
	call 08f36h		;a96d
	pop bc			;a970
	call 08f2eh		;a971
	pop bc			;a974
L_A975:
	ld de,00008h		;a975
	add ix,de		;a978
	djnz L_A94D		;a97a
	ret			;a97c
L_A97D:
	ld a,(0ca07h)		;a97d
	and 010h		;a980
	ret z			;a982
	ld b,006h		;a983
L_A985:
	ld a,(ix+000h)		;a985
	or a			;a988
	jr z,L_A993		;a989
	ld de,00010h		;a98b
	add ix,de		;a98e
	djnz L_A985		;a990
	ret			;a992
L_A993:
	ld a,001h		;a993
	ld (0d752h),a		;a995
	ld (ix+000h),001h		;a998
	ld (ix+001h),000h		;a99c
	call 08f5dh		;a9a0
	ld hl,0bedch		;a9a3
	call 08f4eh		;a9a6
	ld a,(ix+003h)		;a9a9
	ld (ix+00ah),a		;a9ac
	ld a,(ix+005h)		;a9af
	ld (ix+00bh),a		;a9b2
	ld a,(0d634h)		;a9b5
	or a			;a9b8
	call z,08f70h		;a9b9
	jp L_AA11		;a9bc
L_A9BF:
	jp L_AA60		;a9bf
L_A9C2:
	ld hl,0d750h		;a9c2
	ld a,(hl)			;a9c5
	or a			;a9c6
	jr z,L_A9CB		;a9c7
	dec (hl)			;a9c9
	ret			;a9ca
L_A9CB:
	ld (hl),002h		;a9cb
	ld b,006h		;a9cd
L_A9CF:
	ld a,(ix+000h)		;a9cf
	or a			;a9d2
	jr z,L_A9DD		;a9d3
	ld de,00010h		;a9d5
	add ix,de		;a9d8
	djnz L_A9CF		;a9da
	ret			;a9dc
L_A9DD:
	ld a,001h		;a9dd
	ld (0d752h),a		;a9df
	ld (ix+000h),002h		;a9e2
	ld (ix+001h),000h		;a9e6
	call 08f5dh		;a9ea
	call L_AA1B		;a9ed
	ld a,(ix+003h)		;a9f0
	ld (ix+00ah),a		;a9f3
	ld a,(ix+005h)		;a9f6
	ld (ix+00bh),a		;a9f9
	ld a,(0d634h)		;a9fc
	or a			;a9ff
	call z,08f70h		;aa00
	call L_AA11		;aa03
	ld hl,0d751h		;aa06
	inc (hl)			;aa09
	ld a,(hl)			;aa0a
	cp 008h		;aa0b
	ret c			;aa0d
	xor a			;aa0e
	ld (hl),a			;aa0f
	ret			;aa10
L_AA11:
	ld a,(0d634h)		;aa11
	or a			;aa14
	jp z,06a25h		;aa15
	jp 06afeh		;aa18
L_AA1B:
	ld a,(0cb0eh)		;aa1b
	dec a			;aa1e
	add a,a			;aa1f
	add a,a			;aa20
	add a,a			;aa21
	ld b,a			;aa22
	ld a,(0d751h)		;aa23
	add a,b			;aa26
	ld hl,0aa40h		;aa27
	call 0423eh		;aa2a
	ld a,(hl)			;aa2d
	ld b,008h		;aa2e
	call 08f63h		;aa30
	ld (ix+006h),e		;aa33
	ld (ix+007h),d		;aa36
	ld (ix+008h),l		;aa39
	ld (ix+009h),h		;aa3c
	ret			;aa3f

; ----------------------------------------------------------------------
; DATOS resto_AA40: lo apuntan con el banco puesto p11:AA27 (0xAA40), p11:A01A
;   (0xAA51), p11:A024 (0xAA51); el tamano es lo que hay hasta lo siguiente,
;   no sale de recorrerlo; lo leen p11:AA27, p11:A01A, p11:A024 (32 bytes)
;   0xaa40..0xaa60  (32 bytes)
DATA_resto_AA40:
	defb 006h,007h,008h,007h,006h,005h,004h,005h,012h,013h,014h,013h,012h,011h,010h,011h	; aa40  ................
	defb 00ch,00dh,00eh,00dh,00ch,00bh,00ah,00bh,000h,001h,002h,001h,000h,017h,016h,017h	; aa50  ................

; ======================================================================
; CODIGO 0xaa60..0xab83  (291 bytes)
; ======================================================================


L_AA60:
	ld a,(ix+00ah)		;aa60
	sub (ix+003h)		;aa63
	jr nc,L_AA6A		;aa66
	neg		;aa68
L_AA6A:
	cp 040h		;aa6a
	jr nc,L_AA7B		;aa6c
	ld a,(ix+00bh)		;aa6e
	sub (ix+005h)		;aa71
	jr nc,L_AA78		;aa74
	neg		;aa76
L_AA78:
	cp 040h		;aa78
	ret c			;aa7a
L_AA7B:
	xor a			;aa7b
	ld (ix+000h),a		;aa7c
	ret			;aa7f
L_AA80:
	ld a,(0ca4ah)		;aa80
	cp 012h		;aa83
	jr nz,L_AA8F		;aa85
	ld a,(0ca4bh)		;aa87
	cp 008h		;aa8a
	jp z,06c77h		;aa8c
L_AA8F:
	ld a,(ix+000h)		;aa8f
	cp 006h		;aa92
	ret z			;aa94
	ld (ix+000h),006h		;aa95
	xor a			;aa99
	ld (ix+001h),a		;aa9a
	ld (0cacfh),a		;aa9d
	inc a			;aaa0
	ld (0d752h),a		;aaa1
	call 08f5dh		;aaa4
	ld hl,0becch		;aaa7
	ld a,(0cb0eh)		;aaaa
	ld (ix+00bh),a		;aaad
	call 08f4eh		;aab0
	jp 06a7fh		;aab3
L_AAB6:
	ld a,(0ca07h)		;aab6
	and 00fh		;aab9
	ret z			;aabb
	ld b,001h		;aabc
	rra			;aabe
	jr c,L_AACA		;aabf
	inc b			;aac1
	rra			;aac2
	jr c,L_AACA		;aac3
	inc b			;aac5
	rra			;aac6
	jr c,L_AACA		;aac7
	inc b			;aac9
L_AACA:
	ld a,b			;aaca
	ld (ix+00bh),a		;aacb
	ld hl,0becch		;aace
	call 08f53h		;aad1
	ld a,001h		;aad4
	ld (0cacfh),a		;aad6
	ret			;aad9
L_AADA:
	ld a,(0ca4ah)		;aada
	cp 012h		;aadd
	jr nz,L_AAE9		;aadf
	ld a,(0ca4bh)		;aae1
	cp 008h		;aae4
	jp z,06c77h		;aae6
L_AAE9:
	ld ix,0cb80h		;aae9
	ld a,(ix+000h)		;aaed
	cp 008h		;aaf0
	ret z			;aaf2
	ld (ix+000h),008h		;aaf3
	xor a			;aaf7
	ld (ix+001h),a		;aaf8
	ld (ix+002h),a		;aafb
	ld (ix+004h),a		;aafe
	ld (ix+00fh),a		;ab01
	ld (ix+00eh),a		;ab04
	ld (ix+00ch),a		;ab07
	inc a			;ab0a
	ld (0d752h),a		;ab0b
	ld a,(0cb03h)		;ab0e
	ld b,a			;ab11
	ld a,(0cb43h)		;ab12
	add a,b			;ab15
	sub 008h		;ab16
	and 0f8h		;ab18
	ld (ix+003h),a		;ab1a
	ld a,(0cb05h)		;ab1d
	and 0f8h		;ab20
	ld (ix+005h),a		;ab22
	ld a,(0cb0eh)		;ab25
	ld (ix+00ah),a		;ab28
	ld (ix+00bh),a		;ab2b
	ld hl,0bebch		;ab2e
	call 08f4eh		;ab31
	jp 06a8bh		;ab34
L_AB37:
	call L_AC47		;ab37
	ld a,(ix+003h)		;ab3a
	cp 0c0h		;ab3d
	jp nc,L_AC10		;ab3f
	ld a,(ix+005h)		;ab42
	cp 0c0h		;ab45
	jp nc,L_AC10		;ab47
	call L_ABA3		;ab4a
	jr c,$+115		;ab4d
	call L_AC1D		;ab4f
	call 08f46h		;ab52
	jr c,$+107		;ab55
	ret			;ab57
L_AB58:
	ld (ix+00dh),001h		;ab58
	ld a,(ix+00bh)		;ab5c
	ld (ix+00bh),b		;ab5f
	dec a			;ab62
	dec b			;ab63
	rlca			;ab64
	rlca			;ab65
	add a,b			;ab66
	ld hl,0ab83h		;ab67
	call 043f6h		;ab6a
	ld a,(ix+003h)		;ab6d
	add a,l			;ab70
	ld (ix+003h),a		;ab71
	ld a,(ix+005h)		;ab74
	add a,h			;ab77
	ld (ix+005h),a		;ab78
	ld a,b			;ab7b
	inc a			;ab7c
	ld hl,0bebch		;ab7d
	jp 08f53h		;ab80

; ----------------------------------------------------------------------
; DATOS resto_AB83: lo apuntan con el banco puesto p11:AB67 (0xAB83); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p11:AB67 (32 bytes)
;   0xab83..0xaba3  (32 bytes)
DATA_resto_AB83:
	defb 000h,000h,000h,000h,000h,0f8h,000h,000h,000h,000h,000h,000h,008h,0f8h,008h,000h	; ab83  ................
	defb 0f8h,000h,000h,000h,000h,000h,000h,000h,0f8h,008h,000h,008h,000h,000h,000h,000h	; ab93  ................

; ======================================================================
; CODIGO 0xaba3..0xac37  (148 bytes)
; ======================================================================


L_ABA3:
	ld a,(0ca4ah)		;aba3
	cp 006h		;aba6
	jr nz,L_ABBE		;aba8
	ld a,(0ca4bh)		;abaa
	cp 010h		;abad
	jr nz,L_ABBE		;abaf
	ld a,(ix+00bh)		;abb1
	cp 003h		;abb4
	jr nz,L_ABBE		;abb6
	ld a,(ix+005h)		;abb8
	cp 048h		;abbb
	ret			;abbd
L_ABBE:
	or a			;abbe
	ret			;abbf
L_ABC0:
	inc (ix+00ch)		;abc0
	ld a,(ix+00ch)		;abc3
	cp 006h		;abc6
	jr nc,L_AC10		;abc8
	ld a,(ix+00bh)		;abca
	cp 003h		;abcd
	ld b,001h		;abcf
	jr nc,L_ABD5		;abd1
	ld b,003h		;abd3
L_ABD5:
	ld a,b			;abd5
	call L_AC07		;abd6
	ld c,000h		;abd9
	jr c,L_ABDE		;abdb
	inc c			;abdd
L_ABDE:
	inc b			;abde
	ld a,b			;abdf
	call L_AC07		;abe0
	jr c,L_ABE7		;abe3
	set 1,c		;abe5
L_ABE7:
	ld a,c			;abe7
	or a			;abe8
	jr z,L_AC10		;abe9
	cp 003h		;abeb
	jr z,L_ABF8		;abed
	ld a,c			;abef
	rra			;abf0
	jp nc,L_AB58		;abf1
	dec b			;abf4
	jp L_AB58		;abf5
L_ABF8:
	ld hl,0ca03h		;abf8
	ld a,r		;abfb
	xor (hl)			;abfd
	rra			;abfe
	rra			;abff
	jp c,L_AB58		;ac00
	dec b			;ac03
	jp L_AB58		;ac04
L_AC07:
	push bc			;ac07
	call L_AC25		;ac08
	call 08f46h		;ac0b
	pop bc			;ac0e
	ret			;ac0f
L_AC10:
	xor a			;ac10
	ld (ix+000h),a		;ac11
	ld (0cb52h),a		;ac14
	ld (0d44fh),a		;ac17
	jp 06a6bh		;ac1a
L_AC1D:
	ld a,(ix+00bh)		;ac1d
	ld hl,0ac37h		;ac20
	jr L_AC28		;ac23
L_AC25:
	ld hl,0ac3fh		;ac25
L_AC28:
	dec a			;ac28
	call 043f6h		;ac29
	ld a,(ix+003h)		;ac2c
	add a,l			;ac2f
	ld l,a			;ac30
	ld a,(ix+005h)		;ac31
	add a,h			;ac34
	ld h,a			;ac35
	ret			;ac36

; ----------------------------------------------------------------------
; DATOS resto_AC37: lo apuntan con el banco puesto p11:AC20 (0xAC37), p11:AC25
;   (0xAC3F); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p11:AC20, p11:AC25 (16 bytes)
;   0xac37..0xac47  (16 bytes)
DATA_resto_AC37:
	defb 0ffh,000h,010h,000h,000h,0ffh,000h,010h,0f8h,000h,008h,000h,000h,0f8h,000h,008h	; ac37  ................

; ======================================================================
; CODIGO 0xac47..0xacd9  (146 bytes)
; ======================================================================


L_AC47:
	inc (ix+00eh)		;ac47
	ld a,(ix+00eh)		;ac4a
	rra			;ac4d
	ret nc			;ac4e
	ld a,(ix+00fh)		;ac4f
	xor 001h		;ac52
	ld (ix+00fh),a		;ac54
	ret			;ac57
L_AC58:
	ld hl,0cb5ch		;ac58
	ld a,(hl)			;ac5b
	or a			;ac5c
	ret z			;ac5d
	ld (hl),000h		;ac5e
	ld b,003h		;ac60
	call L_AC6C		;ac62
	ld a,(0d752h)		;ac65
	or a			;ac68
	ret z			;ac69
	jr L_ACB6		;ac6a
L_AC6C:
	ld ix,0cb80h		;ac6c
	ld a,(ix+000h)		;ac70
	cp b			;ac73
	ret z			;ac74
	ld a,(0df80h)		;ac75
	or a			;ac78
	ret nz			;ac79
	ld (ix+000h),b		;ac7a
	xor a			;ac7d
	ld (ix+001h),a		;ac7e
	inc a			;ac81
	ld (0d752h),a		;ac82
	ld hl,0beb4h		;ac85
	jp 08f58h		;ac88
L_AC8B:
	ld hl,0cb5ch		;ac8b
	ld a,(hl)			;ac8e
	or a			;ac8f
	ret z			;ac90
	ld (hl),000h		;ac91
	ld a,(0ca4ah)		;ac93
	cp 012h		;ac96
	jr nz,L_ACA2		;ac98
	ld a,(0ca4bh)		;ac9a
	cp 008h		;ac9d
	jp z,06c77h		;ac9f
L_ACA2:
	ld a,(0dff8h)		;aca2
	or a			;aca5
	ret nz			;aca6
	ld b,007h		;aca7
	call L_AC6C		;aca9
	ld a,(0d752h)		;acac
	or a			;acaf
	ret z			;acb0
	ld hl,0acf1h		;acb1
	jr L_ACB9		;acb4
L_ACB6:
	ld hl,0acd9h		;acb6
L_ACB9:
	push hl			;acb9
	call 06406h		;acba
	pop hl			;acbd
	ld a,(0cb0eh)		;acbe
	dec a			;acc1
	add a,a			;acc2
	ld b,a			;acc3
	add a,a			;acc4
	add a,b			;acc5
	call 0423eh		;acc6
	ld bc,00006h		;acc9
	ldir		;accc
	xor a			;acce
	ld (de),a			;accf
	inc de			;acd0
	ld (de),a			;acd1
	ld a,(0cb0eh)		;acd2
	ld (ix+00eh),a		;acd5
	ret			;acd8

; ----------------------------------------------------------------------
; DATOS resto_ACD9: lo apuntan con el banco puesto p11:ACB6 (0xACD9), p11:ACB1
;   (0xACF1); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p11:ACB6, p11:ACB1 (48 bytes)
;   0xacd9..0xad09  (48 bytes)
DATA_resto_ACD9:
	defb 000h,0eeh,090h,0ffh,0a0h,001h,000h,0f7h,060h,000h,0a0h,001h,080h,0f9h,000h,0fah	; acd9  ........`.......
	defb 050h,001h,080h,0f9h,000h,006h,050h,001h,000h,0f8h,000h,0ffh,000h,000h,000h,008h	; ace9  P.....P.........
	defb 000h,001h,000h,000h,000h,004h,000h,0f6h,000h,000h,000h,004h,000h,006h,000h,000h	; acf9  ................

; ======================================================================
; CODIGO 0xad09..0xad44  (59 bytes)
; ======================================================================


L_AD09:
	ld a,(ix+001h)		;ad09
	or a			;ad0c
	ret z			;ad0d
	call L_AD3D		;ad0e
	ld a,(ix+000h)		;ad11
	or a			;ad14
	ret z			;ad15
	ld e,(ix+006h)		;ad16
	ld d,(ix+007h)		;ad19
	ld l,(ix+00ah)		;ad1c
	ld h,(ix+00bh)		;ad1f
	add hl,de			;ad22
	ld (ix+006h),l		;ad23
	ld (ix+007h),h		;ad26
	ld e,(ix+008h)		;ad29
	ld d,(ix+009h)		;ad2c
	ld l,(ix+00ch)		;ad2f
	ld h,(ix+00dh)		;ad32
	add hl,de			;ad35
	ld (ix+008h),l		;ad36
	ld (ix+009h),h		;ad39
	ret			;ad3c
L_AD3D:
	ld a,(ix+00eh)		;ad3d
	dec a			;ad40
	call 0424dh		;ad41

; ----------------------------------------------------------------------
; DATOS tabla_AD44: 4 destinos del despachador p00:424D (call en p11:AD41, el
;   indice en A): AD4C, AD95, ADA4, ADB7; lo leen p11:AD41 (8 bytes)
;   0xad44..0xad4c  (8 bytes)
DATA_tabla_AD44:
	defw 0ad4ch,0ad95h,0ada4h,0adb7h	; ad44  -> L_AD4C L_AD95 L_ADA4 L_ADB7

; ======================================================================
; CODIGO 0xad4c..0xaea0  (340 bytes)
; ======================================================================


L_AD4C:
	ld a,(ix+003h)		;ad4c
	cp 0c8h		;ad4f
	ret nc			;ad51
	ld a,(ix+000h)		;ad52
	cp 007h		;ad55
	jr z,L_AD8C		;ad57
	ld a,(ix+007h)		;ad59
	rla			;ad5c
	ret c			;ad5d
	ld a,(0cb22h)		;ad5e
	cp (ix+003h)		;ad61
	ret nc			;ad64
L_AD65:
	ld b,(ix+000h)		;ad65
	xor a			;ad68
	ld (ix+000h),a		;ad69
	ld (0cb52h),a		;ad6c
	ld a,(0cb22h)		;ad6f
	cp 0b8h		;ad72
	ret nc			;ad74
	ld l,a			;ad75
	ld a,(0cb23h)		;ad76
	cp 0b8h		;ad79
	ret nc			;ad7b
	ld h,a			;ad7c
	ld a,b			;ad7d
	cp 007h		;ad7e
	jr z,L_AD87		;ad80
	ld c,000h		;ad82
	jp 08f68h		;ad84
L_AD87:
	ld e,l			;ad87
	ld d,h			;ad88
	jp L_B885		;ad89
L_AD8C:
	ld a,(0cb22h)		;ad8c
	cp (ix+003h)		;ad8f
	ret c			;ad92
	jr L_AD65		;ad93
L_AD95:
	ld a,(ix+003h)		;ad95
	cp 0c8h		;ad98
	ret nc			;ad9a
	ld a,(0cb22h)		;ad9b
	cp (ix+003h)		;ad9e
	ret nc			;ada1
	jr L_AD65		;ada2
L_ADA4:
	ld a,(0cb23h)		;ada4
	cp 0c8h		;ada7
	ret nc			;ada9
	ld a,(ix+005h)		;adaa
	sub 008h		;adad
	ld c,a			;adaf
	ld a,(0cb23h)		;adb0
	cp c			;adb3
	ret c			;adb4
	jr L_AD65		;adb5
L_ADB7:
	ld a,(0cb23h)		;adb7
	cp (ix+005h)		;adba
	ret nc			;adbd
	jr L_AD65		;adbe
L_ADC0:
	ld a,(0d7d5h)		;adc0
	bit 4,a		;adc3
	jr z,L_ADCE		;adc5
	ld a,(0d7dah)		;adc7
	rra			;adca
	jp nc,06c77h		;adcb
L_ADCE:
	ld a,(0cb0eh)		;adce
	cp 003h		;add1
	jp nc,06c77h		;add3
	ld ix,0d760h		;add6
	ld a,(ix+000h)		;adda
	or a			;addd
	ret nz			;adde
	call L_ADF0		;addf
	jp c,06c77h		;ade2
	call L_AEB6		;ade5
	ld a,001h		;ade8
	ld (0d752h),a		;adea
	jp 06a50h		;aded
L_ADF0:
	call L_AE87		;adf0
	call L_AEA4		;adf3
	ret c			;adf6
	ld a,(ix+002h)		;adf7
	add a,022h		;adfa
	ld l,a			;adfc
	ld a,(ix+003h)		;adfd
	add a,009h		;ae00
	ld h,a			;ae02
	ld de,00a23h		;ae03
	push de			;ae06
	push hl			;ae07
	call 06424h		;ae08
	pop hl			;ae0b
	pop de			;ae0c
	ret c			;ae0d
	call 08fa5h		;ae0e
	ret c			;ae11
	call L_AF20		;ae12
	ret c			;ae15
	call L_AE6E		;ae16
	ret c			;ae19
	call L_B475		;ae1a
	ret c			;ae1d
	call L_AE57		;ae1e
	ret c			;ae21
	ld a,(0ca50h)		;ae22
	ld (ix+004h),a		;ae25
	ld a,(0ca51h)		;ae28
	ld (ix+005h),a		;ae2b
	xor a			;ae2e
	ld (ix+001h),a		;ae2f
	ld (ix+006h),a		;ae32
	inc a			;ae35
	ld (ix+007h),a		;ae36
	ld b,003h		;ae39
	ld a,(0d8c0h)		;ae3b
	or a			;ae3e
	jr nz,L_AE52		;ae3f
	dec b			;ae41
	ld a,(0ca65h)		;ae42
	or a			;ae45
	jr nz,L_AE52		;ae46
	ld b,004h		;ae48
	ld a,(0ca76h)		;ae4a
	or a			;ae4d
	jr nz,L_AE52		;ae4e
	ld b,001h		;ae50
L_AE52:
	ld (ix+000h),b		;ae52
L_AE55:
	and a			;ae55
	ret			;ae56
L_AE57:
	ld a,(0ca4ah)		;ae57
	cp 013h		;ae5a
	jr nz,L_AE55		;ae5c
	ld a,(0ca4bh)		;ae5e
	cp 005h		;ae61
	jr nz,L_AE55		;ae63
	ld a,(0d821h)		;ae65
	cp 00dh		;ae68
	jr nz,L_AE55		;ae6a
	scf			;ae6c
	ret			;ae6d
L_AE6E:
	ld a,(0cb3fh)		;ae6e
	or a			;ae71
	jr nz,L_AE85		;ae72
	ld a,(0d8a4h)		;ae74
	or a			;ae77
	jr nz,L_AE85		;ae78
	ld a,(0cb37h)		;ae7a
	or a			;ae7d
	jr nz,L_AE85		;ae7e
	ld a,(0ca9bh)		;ae80
	or a			;ae83
	ret z			;ae84
L_AE85:
	scf			;ae85
	ret			;ae86
L_AE87:
	ld a,(0cb0eh)		;ae87
	dec a			;ae8a
	ld hl,0aea0h		;ae8b
	call 043f6h		;ae8e
	ld a,(0cb03h)		;ae91
	add a,l			;ae94
	ld (ix+002h),a		;ae95
	ld a,(0cb05h)		;ae98
	add a,h			;ae9b
	ld (ix+003h),a		;ae9c
	ret			;ae9f

; ----------------------------------------------------------------------
; DATOS resto_AEA0: lo apuntan con el banco puesto p11:AE8B (0xAEA0); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p11:AE8B (4 bytes)
;   0xaea0..0xaea4  (4 bytes)
DATA_resto_AEA0:
	defb 0d0h,0f8h,004h,0f8h	; aea0

; ======================================================================
; CODIGO 0xaea4..0xb05c  (440 bytes)
; ======================================================================


L_AEA4:
	ld a,(ix+002h)		;aea4
	cp 09eh		;aea7
	ccf			;aea9
	ret c			;aeaa
	ld a,(ix+003h)		;aeab
	cp 0b0h		;aeae
	ccf			;aeb0
	ret			;aeb1
L_AEB2:
	call L_AEFF		;aeb2
	ret nz			;aeb5
L_AEB6:
	call L_AEF8		;aeb6
	push hl			;aeb9
	call L_AEDB		;aeba
	pop hl			;aebd
	ld de,01020h		;aebe
	ld c,00dh		;aec1
	ld a,(0ca42h)		;aec3
	jp 046bch		;aec6
L_AEC9:
	call L_AEFF		;aec9
	ret nz			;aecc
	call L_AEF8		;aecd
	ld de,01020h		;aed0
	ld c,00dh		;aed3
	ld a,(0ca42h)		;aed5
	jp 046bch		;aed8
L_AEDB:
	ld de,0eeb0h		;aedb
	ld bc,01222h		;aede
	jp 0474dh		;aee1
L_AEE4:
	xor a			;aee4
	ld (ix+000h),a		;aee5
	ld (0cb52h),a		;aee8
	call L_AEF8		;aeeb
	ld de,0eeb0h		;aeee
	ex de,hl			;aef1
	ld bc,01222h		;aef2
	jp 0475ah		;aef5
L_AEF8:
	ld l,(ix+002h)		;aef8
	ld h,(ix+003h)		;aefb
	ret			;aefe
L_AEFF:
	ld ix,0d760h		;aeff
	ld a,(ix+000h)		;af03
	or a			;af06
	jr z,L_AF1B		;af07
	call L_AFC3		;af09
	ret nz			;af0c
	ld a,(0ca50h)		;af0d
	cp (ix+004h)		;af10
	ret nz			;af13
	ld a,(0ca51h)		;af14
	cp (ix+005h)		;af17
	ret			;af1a
L_AF1B:
	ld a,0ffh		;af1b
	sub 050h		;af1d
	ret			;af1f
L_AF20:
	call L_AEF8		;af20
	call 08f16h		;af23
	ret c			;af26
	call L_AF37		;af27
	ret c			;af2a
	ld a,l			;af2b
	sub 018h		;af2c
	ld l,a			;af2e
	ld a,h			;af2f
	add a,00fh		;af30
	ld h,a			;af32
	call 08f16h		;af33
	ret c			;af36
L_AF37:
	ld b,003h		;af37
L_AF39:
	ld a,l			;af39
	add a,008h		;af3a
	ld l,a			;af3c
	push bc			;af3d
	call 08f16h		;af3e
	pop bc			;af41
	ret c			;af42
	djnz L_AF39		;af43
	and a			;af45
	ret			;af46
L_AF47:
	ld ix,0d760h		;af47
	ld a,(ix+000h)		;af4b
	or a			;af4e
	ret z			;af4f
	call L_AFC3		;af50
	ret nz			;af53
	call L_AFE1		;af54
	ret nc			;af57
	call L_AFC3		;af58
	ret nz			;af5b
	ld a,(0cb00h)		;af5c
	cp 00bh		;af5f
	ret z			;af61
	cp 002h		;af62
	jr nz,L_AFB6		;af64
	ld a,(0ca50h)		;af66
	cp (ix+004h)		;af69
	ret nz			;af6c
	ld a,(0ca51h)		;af6d
	cp (ix+005h)		;af70
	ret nz			;af73
	ld a,(0cb05h)		;af74
	sub 008h		;af77
	sub (ix+003h)		;af79
	jr nc,L_AF80		;af7c
	neg		;af7e
L_AF80:
	cp 004h		;af80
	jr nc,L_AFB6		;af82
	ld a,(0cb03h)		;af84
	inc a			;af87
	sub (ix+002h)		;af88
	ret c			;af8b
	cp 020h		;af8c
	jr nc,L_AFA4		;af8e
	ld b,a			;af90
	ld a,020h		;af91
	sub b			;af93
	cp 020h		;af94
	jr nc,L_AFB6		;af96
	ld (0cb29h),a		;af98
	ld a,002h		;af9b
	ld (0cb28h),a		;af9d
	ld (0ca8dh),a		;afa0
	ret			;afa3
L_AFA4:
	sub 020h		;afa4
	cp 020h		;afa6
	jr nc,L_AFB6		;afa8
	ld (0cb29h),a		;afaa
	ld a,001h		;afad
	ld (0cb28h),a		;afaf
	ld (0ca8dh),a		;afb2
	ret			;afb5
L_AFB6:
	xor a			;afb6
	ld (0ca8dh),a		;afb7
	ld (0cb28h),a		;afba
	ld a,020h		;afbd
	ld (0cb29h),a		;afbf
	ret			;afc2
L_AFC3:
	ld b,003h		;afc3
	ld a,(0d8c0h)		;afc5
	or a			;afc8
	jr nz,L_AFDC		;afc9
	dec b			;afcb
	ld a,(0ca65h)		;afcc
	or a			;afcf
	jr nz,L_AFDC		;afd0
	ld b,004h		;afd2
	ld a,(0ca76h)		;afd4
	or a			;afd7
	jr nz,L_AFDC		;afd8
	ld b,001h		;afda
L_AFDC:
	ld a,b			;afdc
	cp (ix+000h)		;afdd
	ret			;afe0
L_AFE1:
	ld a,(0ca50h)		;afe1
	sub (ix+004h)		;afe4
	jr nc,L_AFEB		;afe7
	neg		;afe9
L_AFEB:
	cp 002h		;afeb
	jr nc,L_AFFC		;afed
	ld a,(0ca51h)		;afef
	sub (ix+005h)		;aff2
	jr nc,L_AFF9		;aff5
	neg		;aff7
L_AFF9:
	cp 002h		;aff9
	ret c			;affb
L_AFFC:
	xor a			;affc
	ld (ix+000h),a		;affd
	ld (0cb52h),a		;b000
	ret			;b003
L_B004:
	ld a,(0ca76h)		;b004
	cp 039h		;b007
	ret z			;b009
	ld ix,0cb80h		;b00a
	ld a,(ix+000h)		;b00e
	cp 005h		;b011
	ret z			;b013
	ld a,001h		;b014
	ld (0d752h),a		;b016
	ld (ix+000h),005h		;b019
	xor a			;b01d
	ld (ix+001h),a		;b01e
	ld (ix+002h),a		;b021
	ld (ix+004h),a		;b024
	ld (ix+006h),a		;b027
	ld (ix+007h),a		;b02a
	ld (ix+008h),a		;b02d
	ld (ix+009h),a		;b030
	ld (ix+00fh),a		;b033
	ld a,(0cb03h)		;b036
	ld b,a			;b039
	ld a,(0cb43h)		;b03a
	add a,b			;b03d
	sub 028h		;b03e
	ld (ix+003h),a		;b040
	ld a,(0cb05h)		;b043
	sub 008h		;b046
	ld (ix+005h),a		;b048
	ld (ix+00ah),008h		;b04b
	ld (ix+00bh),008h		;b04f
	jp L_B1E0		;b053
L_B056:
	ld a,(ix+001h)		;b056
	call 0424dh		;b059

; ----------------------------------------------------------------------
; DATOS tabla_B05C: 4 destinos del despachador p00:424D (call en p11:B059, el
;   indice en A): B064, B0AD, B0CF, B173; lo leen p11:B059 (8 bytes)
;   0xb05c..0xb064  (8 bytes)
DATA_tabla_B05C:
	defw 0b064h,0b0adh,0b0cfh,0b173h	; b05c  -> L_B064 L_B0AD L_B0CF L_B173

; ======================================================================
; CODIGO 0xb064..0xb1ff  (411 bytes)
; ======================================================================


L_B064:
	ld a,(0ca07h)		;b064
	bit 4,a		;b067
	jr nz,L_B078		;b069
	ld a,(0ca08h)		;b06b
	and 00fh		;b06e
	ret z			;b070
	call L_B1B1		;b071
	call L_B1E0		;b074
	ret			;b077
L_B078:
	inc (ix+001h)		;b078
	xor a			;b07b
	ld (ix+006h),a		;b07c
	ld (ix+008h),a		;b07f
	ld (ix+009h),a		;b082
	inc a			;b085
	ld (ix+00fh),a		;b086
	ld (ix+007h),0fah		;b089
	ld a,(ix+003h)		;b08d
	ld (ix+00eh),a		;b090
	ld a,(ix+00ah)		;b093
	ld hl,0caebh		;b096
	ld (hl),a			;b099
	inc hl			;b09a
	ld a,(ix+00bh)		;b09b
	ld (hl),a			;b09e
	call 06a7fh		;b09f
	push ix		;b0a2
	ld a,(0cb20h)		;b0a4
	call 08f95h		;b0a7
	pop ix		;b0aa
	ret			;b0ac
L_B0AD:
	ld a,(ix+00eh)		;b0ad
	sub (ix+003h)		;b0b0
	cp 010h		;b0b3
	ret c			;b0b5
	cp 020h		;b0b6
	jr nc,L_B0C0		;b0b8
	ld a,002h		;b0ba
	ld (ix+00fh),a		;b0bc
	ret			;b0bf
L_B0C0:
	ld (ix+00eh),008h		;b0c0
	inc (ix+001h)		;b0c4
	xor a			;b0c7
	ld (ix+00fh),a		;b0c8
	ld (ix+007h),a		;b0cb
	ret			;b0ce
L_B0CF:
	dec (ix+00eh)		;b0cf
	ret nz			;b0d2
	call L_B0F3		;b0d3
	call L_B146		;b0d6
	call L_B12E		;b0d9
	xor a			;b0dc
	ld (ix+006h),a		;b0dd
	ld (ix+007h),006h		;b0e0
	ld (ix+008h),a		;b0e4
	ld (ix+009h),a		;b0e7
	inc (ix+001h)		;b0ea
	ld a,001h		;b0ed
	ld (0caabh),a		;b0ef
	ret			;b0f2
L_B0F3:
	ld a,(ix+00ah)		;b0f3
	cp 006h		;b0f6
	jr c,L_B102		;b0f8
	sub 006h		;b0fa
	cp 006h		;b0fc
	jr c,L_B102		;b0fe
	sub 006h		;b100
L_B102:
	call L_B126		;b102
	ld (ix+00eh),a		;b105
	sub 040h		;b108
	jr nc,L_B10D		;b10a
	xor a			;b10c
L_B10D:
	ld (ix+003h),a		;b10d
	ld a,(ix+00bh)		;b110
	cp 006h		;b113
	jr c,L_B11F		;b115
	sub 006h		;b117
	cp 006h		;b119
	jr c,L_B11F		;b11b
	sub 006h		;b11d
L_B11F:
	call L_B126		;b11f
	ld (ix+005h),a		;b122
	ret			;b125
L_B126:
	rlca			;b126
	rlca			;b127
	rlca			;b128
	rlca			;b129
	rlca			;b12a
	add a,010h		;b12b
	ret			;b12d
L_B12E:
	ld b,000h		;b12e
	ld a,(0ca50h)		;b130
	cp (ix+00ah)		;b133
	jr nz,L_B142		;b136
	ld a,(0ca51h)		;b138
	cp (ix+00bh)		;b13b
	jr nz,L_B142		;b13e
	ld b,003h		;b140
L_B142:
	ld (ix+00fh),b		;b142
	ret			;b145
L_B146:
	ld b,001h		;b146
	ld a,(ix+00ah)		;b148
	cp 006h		;b14b
	jr c,L_B155		;b14d
	dec b			;b14f
	cp 00ch		;b150
	jr c,L_B155		;b152
	dec b			;b154
L_B155:
	ld a,(0ca50h)		;b155
	add a,b			;b158
	ld (ix+00ah),a		;b159
	ld b,0ffh		;b15c
	ld a,(ix+00bh)		;b15e
	cp 006h		;b161
	jr c,L_B16B		;b163
	inc b			;b165
	cp 00ch		;b166
	jr c,L_B16B		;b168
	inc b			;b16a
L_B16B:
	ld a,(0ca51h)		;b16b
	add a,b			;b16e
	ld (ix+00bh),a		;b16f
	ret			;b172
L_B173:
	ld a,(ix+00eh)		;b173
	sub 008h		;b176
	sub (ix+003h)		;b178
	jr c,L_B18B		;b17b
	cp 010h		;b17d
	ret nc			;b17f
	ld a,(ix+00fh)		;b180
	or a			;b183
	ret z			;b184
	ld a,004h		;b185
	ld (ix+00fh),a		;b187
	ret			;b18a
L_B18B:
	xor a			;b18b
	ld (ix+000h),a		;b18c
	ld (0cb52h),a		;b18f
	ld e,(ix+00ah)		;b192
	ld d,(ix+00bh)		;b195
	ld l,(ix+00eh)		;b198
	ld h,(ix+005h)		;b19b
	ld c,000h		;b19e
	ld a,(0ca50h)		;b1a0
	cp e			;b1a3
	jp nz,08f26h		;b1a4
	ld a,(0ca51h)		;b1a7
	cp d			;b1aa
	jp nz,08f26h		;b1ab
	jp 08f1eh		;b1ae
L_B1B1:
	rra			;b1b1
	jr c,L_B1C4		;b1b2
	rra			;b1b4
	jr c,L_B1CD		;b1b5
	rra			;b1b7
	jr c,L_B1D7		;b1b8
	ld a,(ix+00bh)		;b1ba
	cp 011h		;b1bd
	ret nc			;b1bf
	inc (ix+00bh)		;b1c0
	ret			;b1c3
L_B1C4:
	ld a,(ix+00ah)		;b1c4
	or a			;b1c7
	ret z			;b1c8
	dec (ix+00ah)		;b1c9
	ret			;b1cc
L_B1CD:
	ld a,(ix+00ah)		;b1cd
	cp 011h		;b1d0
	ret nc			;b1d2
	inc (ix+00ah)		;b1d3
	ret			;b1d6
L_B1D7:
	ld a,(ix+00bh)		;b1d7
	or a			;b1da
	ret z			;b1db
	dec (ix+00bh)		;b1dc
	ret			;b1df
L_B1E0:
	ld a,(ix+00ah)		;b1e0
	ld hl,0b1ffh		;b1e3
	call 0423eh		;b1e6
	ld a,(hl)			;b1e9
	add a,016h		;b1ea
	ld (ix+00ch),a		;b1ec
	ld a,(ix+00bh)		;b1ef
	ld hl,0b1ffh		;b1f2
	call 0423eh		;b1f5
	ld a,(hl)			;b1f8
	add a,0c4h		;b1f9
	ld (ix+00dh),a		;b1fb
	ret			;b1fe

; ----------------------------------------------------------------------
; DATOS resto_B1FF: lo apuntan con el banco puesto p11:B1E3 (0xB1FF), p11:B1F2
;   (0xB1FF); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p11:B1E3, p11:B1F2 (18 bytes)
;   0xb1ff..0xb211  (18 bytes)
DATA_resto_B1FF:
	defb 001h,004h,007h,00ah,00dh,010h,014h,017h,01ah,01dh,020h,023h,027h,02ah,02dh,030h	; b1ff  .......... #'*-0
	defb 033h,036h	; b20f

; ======================================================================
; CODIGO 0xb211..0xb36c  (347 bytes)
; ======================================================================


L_B211:
	ld a,(0d7dah)		;b211
	bit 4,a		;b214
	ret nz			;b216
	ld hl,0cb44h		;b217
	ld a,(hl)			;b21a
	or a			;b21b
	ret nz			;b21c
	ld a,(0cb21h)		;b21d
	cp 01dh		;b220
	ld a,002h		;b222
	ld b,a			;b224
	jr z,L_B22A		;b225
	dec a			;b227
	ld b,00ch		;b228
L_B22A:
	ld (hl),a			;b22a
	ld c,a			;b22b
	inc l			;b22c
	xor a			;b22d
	ld (hl),a			;b22e
	inc l			;b22f
	ld (hl),a			;b230
	inc l			;b231
	ld (hl),b			;b232
	ld a,001h		;b233
	ld (0d752h),a		;b235
	dec c			;b238
	jp z,06c33h		;b239
	jp 06c87h		;b23c
L_B23F:
	ld a,(0cb44h)		;b23f
	or a			;b242
	ret z			;b243
	call L_B34F		;b244
	call L_B35A		;b247
	ld a,(0cb44h)		;b24a
	dec a			;b24d
	jp z,L_B305		;b24e
	call L_B256		;b251
	jr L_B29B		;b254
L_B256:
	ld a,(0cb45h)		;b256
	dec a			;b259
	jr z,L_B277		;b25a
	dec a			;b25c
	jr z,L_B282		;b25d
	ld hl,0cb47h		;b25f
	dec (hl)			;b262
	ret nz			;b263
	ld (hl),002h		;b264
	ld a,001h		;b266
	call L_B295		;b268
	cp 004h		;b26b
	ret c			;b26d
	ld hl,0cb45h		;b26e
	inc (hl)			;b271
	inc l			;b272
	inc l			;b273
	ld (hl),004h		;b274
	ret			;b276
L_B277:
	ld hl,0cb47h		;b277
	dec (hl)			;b27a
	ret nz			;b27b
	ld (hl),001h		;b27c
	dec l			;b27e
	dec l			;b27f
	inc (hl)			;b280
	ret			;b281
L_B282:
	ld hl,0cb47h		;b282
	dec (hl)			;b285
	ret nz			;b286
	ld (hl),002h		;b287
	ld a,0ffh		;b289
	call L_B295		;b28b
	or a			;b28e
	ret nz			;b28f
	xor a			;b290
	ld (0cb44h),a		;b291
	ret			;b294
L_B295:
	ld hl,0cb46h		;b295
	add a,(hl)			;b298
	ld (hl),a			;b299
	ret			;b29a
L_B29B:
	ld a,(0cb46h)		;b29b
	or a			;b29e
	ret z			;b29f
	ld b,a			;b2a0
	call L_B336		;b2a1
	ld a,e			;b2a4
	cp 0b1h		;b2a5
	ret nc			;b2a7
	ld a,d			;b2a8
	cp 0b1h		;b2a9
	ret nc			;b2ab
	call L_B2BF		;b2ac
	ld hl,0dc10h		;b2af
L_B2B2:
	call L_B326		;b2b2
	ld a,c			;b2b5
	add a,004h		;b2b6
	ld c,a			;b2b8
	call L_B2CB		;b2b9
	djnz L_B2B2		;b2bc
	ret			;b2be
L_B2BF:
	ld a,(0cb0eh)		;b2bf
	dec a			;b2c2
	ld hl,0b36ch		;b2c3
	call 0423eh		;b2c6
	ld c,(hl)			;b2c9
	ret			;b2ca
L_B2CB:
	ld a,(0cb0eh)		;b2cb
	dec a			;b2ce
	jr z,L_B2E1		;b2cf
	dec a			;b2d1
	jr z,L_B2EE		;b2d2
	dec a			;b2d4
	jr z,L_B2FB		;b2d5
	ld a,d			;b2d7
	add a,010h		;b2d8
	ld d,a			;b2da
	cp 0b1h		;b2db
	ret c			;b2dd
	ld e,0e0h		;b2de
	ret			;b2e0
L_B2E1:
	ld a,e			;b2e1
	cp 0e0h		;b2e2
	ret z			;b2e4
	sub 010h		;b2e5
	ld e,a			;b2e7
	cp 0b1h		;b2e8
	ret c			;b2ea
	ld e,0e0h		;b2eb
	ret			;b2ed
L_B2EE:
	ld a,e			;b2ee
	cp 0e0h		;b2ef
	ret z			;b2f1
	add a,010h		;b2f2
	ld e,a			;b2f4
	cp 0b1h		;b2f5
	ret c			;b2f7
	ld e,0e0h		;b2f8
	ret			;b2fa
L_B2FB:
	ld a,d			;b2fb
	sub 010h		;b2fc
	ld d,a			;b2fe
	cp 0b1h		;b2ff
	ret c			;b301
	ld e,0e0h		;b302
	ret			;b304
L_B305:
	ld hl,0cb47h		;b305
	dec (hl)			;b308
	jr z,L_B310		;b309
	call L_B315		;b30b
	jr L_B320		;b30e
L_B310:
	xor a			;b310
	ld (0cb44h),a		;b311
	ret			;b314
L_B315:
	ld a,(0ca03h)		;b315
	rra			;b318
	rra			;b319
	ld c,010h		;b31a
	ret z			;b31c
	ld c,014h		;b31d
	ret			;b31f
L_B320:
	call L_B331		;b320
	ld hl,0dc10h		;b323
L_B326:
	ld a,d			;b326
	cp 0c0h		;b327
	jp c,05d41h		;b329
	ld e,0e0h		;b32c
	jp 05d41h		;b32e
L_B331:
	ld hl,0b370h		;b331
	jr L_B339		;b334
L_B336:
	ld hl,0b378h		;b336
L_B339:
	ld a,(0cb0eh)		;b339
	dec a			;b33c
	add a,a			;b33d
	call 0423eh		;b33e
	ld e,(hl)			;b341
	inc hl			;b342
	ld d,(hl)			;b343
	ld a,(0cb03h)		;b344
	add a,e			;b347
	ld e,a			;b348
	ld a,(0cb05h)		;b349
	add a,d			;b34c
	ld d,a			;b34d
	ret			;b34e
L_B34F:
	ld hl,0dc10h		;b34f
	ld bc,0000fh		;b352
	ld a,0e0h		;b355
	jp 04237h		;b357
L_B35A:
	ld a,(0ca03h)		;b35a
	rra			;b35d
	ld a,00ah		;b35e
	jr c,L_B363		;b360
	dec a			;b362
L_B363:
	ld hl,0da40h		;b363
	ld bc,0003fh		;b366
	jp 04237h		;b369

; ----------------------------------------------------------------------
; DATOS resto_B36C: lo apuntan con el banco puesto p11:B2C3 (0xB36C), p11:B331
;   (0xB370), p11:B336 (0xB378); el tamano es lo que hay hasta lo siguiente,
;   no sale de recorrerlo; lo leen p11:B2C3, p11:B331, p11:B336 (20 bytes)
;   0xb36c..0xb380  (20 bytes)
DATA_resto_B36C:
	defb 020h,0e0h,030h,0f0h,0d0h,0f8h,0deh,0f6h,0d5h,0f0h,0d5h,000h,0d0h,0f8h,0f0h,0f6h	; b36c   .0.............
	defb 0ddh,0e8h,0ddh,008h	; b37c

; ======================================================================
; CODIGO 0xb380..0xb46d  (237 bytes)
; ======================================================================


L_B380:
	ld ix,0cc00h		;b380
	ld b,008h		;b384
L_B386:
	ld a,(ix+000h)		;b386
	or a			;b389
	jr z,L_B396		;b38a
	ld de,00010h		;b38c
	add ix,de		;b38f
	djnz L_B386		;b391
	jp 06c77h		;b393
L_B396:
	push bc			;b396
	call L_B3AD		;b397
	pop bc			;b39a
	ld a,(0d752h)		;b39b
	or a			;b39e
	jp z,06c77h		;b39f
	ld hl,0cb60h		;b3a2
	ld (hl),001h		;b3a5
	call L_A652		;b3a7
	jp 06a50h		;b3aa
L_B3AD:
	call L_B446		;b3ad
	call L_B438		;b3b0
	ld a,e			;b3b3
	cp 0b9h		;b3b4
	ret nc			;b3b6
	ld a,d			;b3b7
	cp 0b9h		;b3b8
	ret nc			;b3ba
	ld (ix+002h),e		;b3bb
	ld (ix+003h),d		;b3be
	ld a,e			;b3c1
	add a,00ch		;b3c2
	ld l,a			;b3c4
	ld a,d			;b3c5
	add a,004h		;b3c6
	ld h,a			;b3c8
	ld de,00810h		;b3c9
	push de			;b3cc
	push hl			;b3cd
	call 06424h		;b3ce
	pop hl			;b3d1
	pop de			;b3d2
	ret c			;b3d3
	call 08fa5h		;b3d4
	ret c			;b3d7
	call L_B475		;b3d8
	ret c			;b3db
	ld a,(0cb3fh)		;b3dc
	or a			;b3df
	ret nz			;b3e0
	ld a,(0d8a4h)		;b3e1
	or a			;b3e4
	ret nz			;b3e5
	ld a,(0cb37h)		;b3e6
	or a			;b3e9
	ret nz			;b3ea
	ld a,(0ca9bh)		;b3eb
	or a			;b3ee
	ret nz			;b3ef
	ld a,001h		;b3f0
	ld (0d752h),a		;b3f2
	ld (ix+001h),000h		;b3f5
	call L_B41B		;b3f9
	ld a,(0cb24h)		;b3fc
	or a			;b3ff
	jr z,L_B40A		;b400
	ld a,(ix+000h)		;b402
	add a,080h		;b405
	ld (ix+000h),a		;b407
L_B40A:
	ld a,(0ca50h)		;b40a
	ld (ix+004h),a		;b40d
	ld a,(0ca51h)		;b410
	ld (ix+005h),a		;b413
	ld (ix+006h),040h		;b416
	ret			;b41a
L_B41B:
	ld b,003h		;b41b
	ld a,(0d8c0h)		;b41d
	or a			;b420
	jr nz,L_B434		;b421
	dec b			;b423
	ld a,(0ca65h)		;b424
	or a			;b427
	jr nz,L_B434		;b428
	ld b,004h		;b42a
	ld a,(0ca76h)		;b42c
	or a			;b42f
	jr nz,L_B434		;b430
	ld b,001h		;b432
L_B434:
	ld (ix+000h),b		;b434
	ret			;b437
L_B438:
	ld a,e			;b438
	cp 004h		;b439
	jr nc,L_B43F		;b43b
	ld e,004h		;b43d
L_B43F:
	ld a,d			;b43f
	cp 004h		;b440
	ret nc			;b442
	ld d,004h		;b443
	ret			;b445
L_B446:
	ld a,(0cb0eh)		;b446
	dec a			;b449
	add a,a			;b44a
	ld hl,0b46dh		;b44b
	call 0423eh		;b44e
	ld a,(0cb03h)		;b451
	add a,(hl)			;b454
	cp 0e0h		;b455
	jr c,L_B45B		;b457
	ld a,002h		;b459
L_B45B:
	and 0feh		;b45b
	ld e,a			;b45d
	inc hl			;b45e
	ld a,(0cb05h)		;b45f
	add a,(hl)			;b462
	cp 0e0h		;b463
	jr c,L_B469		;b465
	ld a,002h		;b467
L_B469:
	and 0feh		;b469
	ld d,a			;b46b
	ret			;b46c

; ----------------------------------------------------------------------
; DATOS resto_B46D: lo apuntan con el banco puesto p11:B44B (0xB46D); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p11:B44B (8 bytes)
;   0xb46d..0xb475  (8 bytes)
DATA_resto_B46D:
	defb 0e8h,0fch,000h,0fch,0fch,0f0h,0fch,008h	; b46d  ........

; ======================================================================
; CODIGO 0xb475..0xb666  (497 bytes)
; ======================================================================


L_B475:
	ld a,(0ca4ah)		;b475
	cp 00ah		;b478
	jr nz,L_B492		;b47a
	ld a,(0ca4bh)		;b47c
	cp 004h		;b47f
	jr nz,L_B492		;b481
	ld a,(0d7dah)		;b483
	rra			;b486
	jr c,L_B492		;b487
	ld a,(0d7d5h)		;b489
	bit 4,a		;b48c
	jr z,L_B492		;b48e
	scf			;b490
	ret			;b491
L_B492:
	or a			;b492
	ret			;b493
L_B494:
	ld a,(0d881h)		;b494
	inc a			;b497
	jr z,L_B4BC		;b498
	ld a,(0d88ah)		;b49a
	inc a			;b49d
	jr nz,L_B4AB		;b49e
	ld a,(0d680h)		;b4a0
	or a			;b4a3
	jr nz,L_B4AB		;b4a4
	ld a,(0d69ch)		;b4a6
	or a			;b4a9
	ret z			;b4aa
L_B4AB:
	ld a,(0d883h)		;b4ab
	inc a			;b4ae
	jr nz,L_B4BC		;b4af
	ld a,(0d678h)		;b4b1
	or a			;b4b4
	jr nz,L_B4BC		;b4b5
	ld a,(0d68ch)		;b4b7
	or a			;b4ba
	ret z			;b4bb
L_B4BC:
	ld a,(0e040h)		;b4bc
	or a			;b4bf
	ret nz			;b4c0
	ld a,(0cb3ch)		;b4c1
	or a			;b4c4
	ret nz			;b4c5
	ld a,(ix+000h)		;b4c6
	bit 7,a		;b4c9
	jr z,L_B4DF		;b4cb
	ld a,(ix+001h)		;b4cd
	dec a			;b4d0
	jr z,L_B513		;b4d1
	call L_B4F3		;b4d3
	ret nz			;b4d6
	dec (ix+006h)		;b4d7
	ret nz			;b4da
	inc (ix+001h)		;b4db
	ret			;b4de
L_B4DF:
	ld a,(ix+001h)		;b4df
	dec a			;b4e2
	jr z,L_B513		;b4e3
	ld a,(0ca07h)		;b4e5
	and 020h		;b4e8
	ret z			;b4ea
	call L_B4F3		;b4eb
	ret nz			;b4ee
	inc (ix+001h)		;b4ef
	ret			;b4f2
L_B4F3:
	ld b,003h		;b4f3
	ld a,(0d8c0h)		;b4f5
	or a			;b4f8
	jr nz,L_B50C		;b4f9
	dec b			;b4fb
	ld a,(0ca65h)		;b4fc
	or a			;b4ff
	jr nz,L_B50C		;b500
	ld b,004h		;b502
	ld a,(0ca76h)		;b504
	or a			;b507
	jr nz,L_B50C		;b508
	ld b,001h		;b50a
L_B50C:
	ld a,(ix+000h)		;b50c
	and 007h		;b50f
	cp b			;b511
	ret			;b512
L_B513:
	xor a			;b513
	ld (ix+000h),a		;b514
	ld (0cb52h),a		;b517
	call L_B563		;b51a
	ld b,(ix+005h)		;b51d
	ld c,(ix+004h)		;b520
	call 07bfch		;b523
	ld c,a			;b526
	ld a,(ix+002h)		;b527
	add a,004h		;b52a
	ld e,a			;b52c
	ld a,(ix+003h)		;b52d
	add a,004h		;b530
	ld d,a			;b532
	push ix		;b533
	call L_A124		;b535
	pop ix		;b538
	ld a,(ix+002h)		;b53a
	sub 004h		;b53d
	jr nc,L_B542		;b53f
	xor a			;b541
L_B542:
	cp 0b0h		;b542
	jr c,L_B548		;b544
	ld a,0b0h		;b546
L_B548:
	ld l,a			;b548
	ld a,(ix+003h)		;b549
	sub 004h		;b54c
	jr nc,L_B551		;b54e
	xor a			;b550
L_B551:
	cp 0b0h		;b551
	jr c,L_B557		;b553
	ld a,0b0h		;b555
L_B557:
	ld h,a			;b557
	ld e,(ix+004h)		;b558
	ld d,(ix+005h)		;b55b
	ld c,001h		;b55e
	jp 08f1eh		;b560
L_B563:
	ld a,(0ca50h)		;b563
	cp (ix+004h)		;b566
	ret nz			;b569
	ld a,(0ca51h)		;b56a
	cp (ix+005h)		;b56d
	ret nz			;b570
	jp L_A6AC		;b571
L_B574:
	ld ix,0cc80h		;b574
	ld b,010h		;b578
L_B57A:
	ld a,(ix+000h)		;b57a
	or a			;b57d
	jr z,L_B58A		;b57e
	ld de,00008h		;b580
	add ix,de		;b583
	djnz L_B57A		;b585
	jp 06c77h		;b587
L_B58A:
	call L_B5A2		;b58a
	ld a,(0d752h)		;b58d
	or a			;b590
	jp z,06c77h		;b591
	push ix		;b594
	pop hl			;b596
	call 08f78h		;b597
	ld hl,0cb61h		;b59a
	ld (hl),001h		;b59d
	jp 06a50h		;b59f
L_B5A2:
	call L_B64B		;b5a2
	ld a,(ix+002h)		;b5a5
	cp 0c0h		;b5a8
	ret nc			;b5aa
	ld a,(ix+003h)		;b5ab
	cp 0c0h		;b5ae
	ret nc			;b5b0
	call L_B438		;b5b1
	ld a,(ix+002h)		;b5b4
	add a,00ch		;b5b7
	ld l,a			;b5b9
	ld a,(ix+003h)		;b5ba
	add a,004h		;b5bd
	ld h,a			;b5bf
	ld de,00810h		;b5c0
	push de			;b5c3
	push hl			;b5c4
	call 06424h		;b5c5
	pop hl			;b5c8
	pop de			;b5c9
	ret c			;b5ca
	call 08fa5h		;b5cb
	ret c			;b5ce
	call L_B475		;b5cf
	ret c			;b5d2
	ld l,(ix+002h)		;b5d3
	ld h,(ix+003h)		;b5d6
	call 07f3dh		;b5d9
	ret c			;b5dc
	ld a,(ix+002h)		;b5dd
	add a,008h		;b5e0
	ld l,a			;b5e2
	ld h,(ix+003h)		;b5e3
	call 07f3dh		;b5e6
	ret c			;b5e9
	ld l,(ix+002h)		;b5ea
	ld a,(ix+003h)		;b5ed
	add a,008h		;b5f0
	ld h,a			;b5f2
	call 07f3dh		;b5f3
	ret c			;b5f6
	ld a,(ix+002h)		;b5f7
	add a,008h		;b5fa
	ld l,a			;b5fc
	ld a,(ix+003h)		;b5fd
	add a,008h		;b600
	ld h,a			;b602
	call 07f3dh		;b603
	ret c			;b606
	ld a,(0cb3fh)		;b607
	or a			;b60a
	ret nz			;b60b
	ld a,(0d8a4h)		;b60c
	or a			;b60f
	ret nz			;b610
	ld a,(0cb37h)		;b611
	or a			;b614
	ret nz			;b615
	ld a,(0ca9bh)		;b616
	or a			;b619
	ret nz			;b61a
	ld a,001h		;b61b
	ld (0d752h),a		;b61d
	ld b,004h		;b620
	ld a,(0ca76h)		;b622
	or a			;b625
	jr nz,L_B637		;b626
	dec b			;b628
	ld a,(0d8c0h)		;b629
	or a			;b62c
	jr nz,L_B637		;b62d
	dec b			;b62f
	ld a,(0ca65h)		;b630
	or a			;b633
	jr nz,L_B637		;b634
	dec b			;b636
L_B637:
	ld (ix+000h),b		;b637
	ld (ix+001h),000h		;b63a
	ld a,(0ca50h)		;b63e
	ld (ix+004h),a		;b641
	ld a,(0ca51h)		;b644
	ld (ix+005h),a		;b647
	ret			;b64a
L_B64B:
	ld a,(0cb0eh)		;b64b
	dec a			;b64e
	add a,a			;b64f
	ld hl,0b666h		;b650
	call 0423eh		;b653
	ld a,(0cb03h)		;b656
	add a,(hl)			;b659
	ld (ix+002h),a		;b65a
	inc hl			;b65d
	ld a,(0cb05h)		;b65e
	add a,(hl)			;b661
	ld (ix+003h),a		;b662
	ret			;b665

; ----------------------------------------------------------------------
; DATOS resto_B666: lo apuntan con el banco puesto p11:B650 (0xB666); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p11:B650 (8 bytes)
;   0xb666..0xb66e  (8 bytes)
DATA_resto_B666:
	defb 0e0h,0fch,004h,0fch,0f8h,0efh,0f8h,008h	; b666  ........

; ======================================================================
; CODIGO 0xb66e..0xb684  (22 bytes)
; ======================================================================


L_B66E:
	ld a,(ix+001h)		;b66e
	dec a			;b671
	ret z			;b672
	ld a,(0cb01h)		;b673
	cp 004h		;b676
	ret z			;b678
	inc (ix+001h)		;b679
	ret			;b67c
L_B67D:
	ld a,(0caa0h)		;b67d
	dec a			;b680
	call 0424dh		;b681

; ----------------------------------------------------------------------
; DATOS tabla_B684: 4 destinos del despachador p00:424D (call en p11:B681, el
;   indice en A): B68C, B6B0, B6B0, B6D8; lo leen p11:B681 (8 bytes)
;   0xb684..0xb68c  (8 bytes)
DATA_tabla_B684:
	defw 0b68ch,0b6b0h,0b6b0h,0b6d8h	; b684  -> L_B68C L_B6B0 L_B6B0 L_B6D8

; ======================================================================
; CODIGO 0xb68c..0xb8ba  (558 bytes)
; ======================================================================


L_B68C:
	ld b,000h		;b68c
	ld hl,0e243h		;b68e
	ld a,(0cb03h)		;b691
	cp (hl)			;b694
	jr nc,L_B699		;b695
	ld b,001h		;b697
L_B699:
	ld hl,0cae3h		;b699
	inc (hl)			;b69c
	ld a,(hl)			;b69d
	rra			;b69e
	jr c,L_B6A8		;b69f
	ld a,b			;b6a1
	or a			;b6a2
	jr z,L_B715		;b6a3
	jp L_B79B		;b6a5
L_B6A8:
	ld a,b			;b6a8
	or a			;b6a9
	jp z,L_B7D5		;b6aa
	jp L_B807		;b6ad
L_B6B0:
	ld a,(0cb03h)		;b6b0
	ld hl,0e243h		;b6b3
	cp (hl)			;b6b6
	jr nc,L_B6C8		;b6b7
	ld a,(0e248h)		;b6b9
	cp (hl)			;b6bc
	jr nc,L_B6E5		;b6bd
	ld hl,0cb03h		;b6bf
	cp (hl)			;b6c2
	jr nc,L_B6FD		;b6c3
	jp L_B79B		;b6c5
L_B6C8:
	ld hl,0e24bh		;b6c8
	cp (hl)			;b6cb
	jp c,L_B747		;b6cc
	ld a,(0e243h)		;b6cf
	cp (hl)			;b6d2
	jp c,04f97h		;b6d3
	jr L_B715		;b6d6
L_B6D8:
	ld hl,0dfdbh		;b6d8
	ld a,(0cb03h)		;b6db
	cp (hl)			;b6de
	jp c,L_B79B		;b6df
	jp 04f97h		;b6e2
L_B6E5:
	ld de,00080h		;b6e5
	ld bc,00480h		;b6e8
	ld hl,0da00h		;b6eb
	call L_B841		;b6ee
	ld de,00020h		;b6f1
	ld bc,00420h		;b6f4
	ld hl,0dc00h		;b6f7
	jp L_B865		;b6fa
L_B6FD:
	ld de,00040h		;b6fd
	ld bc,00840h		;b700
	ld hl,0da00h		;b703
	call L_B841		;b706
	ld de,00010h		;b709
	ld bc,00810h		;b70c
	ld hl,0dc00h		;b70f
	jp L_B865		;b712
L_B715:
	ld de,00200h		;b715
	ld hl,0da00h		;b718
	call L_B856		;b71b
	ld bc,00040h		;b71e
	xor a			;b721
	call 04486h		;b722
	ld de,00040h		;b725
	ld bc,00740h		;b728
	call L_B841		;b72b
	ld de,00080h		;b72e
	ld hl,0dc00h		;b731
	call L_B876		;b734
	ld bc,00010h		;b737
	xor a			;b73a
	call 04486h		;b73b
	ld de,00010h		;b73e
	ld bc,00710h		;b741
	jp L_B865		;b744
L_B747:
	ld de,00080h		;b747
	ld hl,0da00h		;b74a
	call L_B856		;b74d
	ld bc,00040h		;b750
	xor a			;b753
	call 04486h		;b754
	ld de,00200h		;b757
	call L_B856		;b75a
	ld bc,00180h		;b75d
	xor a			;b760
	call 04486h		;b761
	ld de,00040h		;b764
	call L_B856		;b767
	ld bc,00040h		;b76a
	xor a			;b76d
	call 04486h		;b76e
	ld de,00020h		;b771
	ld hl,0dc00h		;b774
	call L_B876		;b777
	ld bc,00010h		;b77a
	xor a			;b77d
	call 04486h		;b77e
	ld de,00080h		;b781
	call L_B876		;b784
	ld bc,00060h		;b787
	xor a			;b78a
	call 04486h		;b78b
	ld de,00010h		;b78e
	call L_B876		;b791
	ld bc,00010h		;b794
	xor a			;b797
	jp 04486h		;b798
L_B79B:
	ld de,00040h		;b79b
	ld hl,0da00h		;b79e
	call L_B856		;b7a1
	ld bc,00040h		;b7a4
	xor a			;b7a7
	call 04486h		;b7a8
	ld de,00200h		;b7ab
	call L_B856		;b7ae
	ld bc,001c0h		;b7b1
	xor a			;b7b4
	call 04486h		;b7b5
	ld de,00010h		;b7b8
	ld hl,0dc00h		;b7bb
	call L_B876		;b7be
	ld bc,00010h		;b7c1
	xor a			;b7c4
	call 04486h		;b7c5
	ld de,00080h		;b7c8
	call L_B876		;b7cb
	ld bc,00070h		;b7ce
	xor a			;b7d1
	jp 04486h		;b7d2
L_B7D5:
	ld de,00080h		;b7d5
	ld bc,00740h		;b7d8
	ld hl,0da00h		;b7db
	call L_B841		;b7de
	ld de,00040h		;b7e1
	call L_B856		;b7e4
	ld bc,00040h		;b7e7
	xor a			;b7ea
	call 04486h		;b7eb
	ld de,00020h		;b7ee
	ld bc,00710h		;b7f1
	ld hl,0dc00h		;b7f4
	call L_B865		;b7f7
	ld de,00010h		;b7fa
	call L_B876		;b7fd
	ld bc,00010h		;b800
	xor a			;b803
	jp 04486h		;b804
L_B807:
	ld de,00160h		;b807
	ld hl,0da00h		;b80a
	call L_B856		;b80d
	ld bc,00160h		;b810
	xor a			;b813
	call 04486h		;b814
	ld de,00200h		;b817
	call L_B856		;b81a
	ld bc,000a0h		;b81d
	xor a			;b820
	call 04486h		;b821
	ld de,00058h		;b824
	ld hl,0dc00h		;b827
	call L_B876		;b82a
	ld bc,00058h		;b82d
	xor a			;b830
	call 04486h		;b831
	ld de,00080h		;b834
	call L_B876		;b837
	ld bc,00028h		;b83a
	xor a			;b83d
	jp 04486h		;b83e
L_B841:
	call L_B856		;b841
L_B844:
	push bc			;b844
	ld b,000h		;b845
	push bc			;b847
	xor a			;b848
	call 04486h		;b849
	or a			;b84c
	ex de,hl			;b84d
	pop bc			;b84e
	sbc hl,bc		;b84f
	ex de,hl			;b851
	pop bc			;b852
	djnz L_B844		;b853
	ret			;b855
L_B856:
	push hl			;b856
	and a			;b857
	ld hl,00200h		;b858
	sbc hl,de		;b85b
	ld de,(0ca0ch)		;b85d
	add hl,de			;b861
	ex de,hl			;b862
	pop hl			;b863
	ret			;b864
L_B865:
	call L_B876		;b865
L_B868:
	push bc			;b868
	ld b,000h		;b869
	xor a			;b86b
	call 04486h		;b86c
	ld a,e			;b86f
	pop bc			;b870
	sub c			;b871
	ld e,a			;b872
	djnz L_B868		;b873
	ret			;b875
L_B876:
	push hl			;b876
	and a			;b877
	ld hl,00080h		;b878
	sbc hl,de		;b87b
	ld de,(0ca0eh)		;b87d
	add hl,de			;b881
	ex de,hl			;b882
	pop hl			;b883
	ret			;b884
L_B885:
	ld hl,0dff8h		;b885
	ld (hl),001h		;b888
	inc hl			;b88a
	ld (hl),000h		;b88b
	inc hl			;b88d
	ld (hl),000h		;b88e
	inc hl			;b890
	ld (hl),e			;b891
	inc hl			;b892
	ld (hl),d			;b893
	call L_B8A3		;b894
	ld hl,0dffdh		;b897
	ld (hl),e			;b89a
	inc hl			;b89b
	ld (hl),d			;b89c
	call 06f27h		;b89d
	jp 06cceh		;b8a0
L_B8A3:
	ld a,(0ca61h)		;b8a3
	dec a			;b8a6
	add a,a			;b8a7
	ld hl,0b8bah		;b8a8
	call 0423eh		;b8ab
	ld a,(0dffbh)		;b8ae
	add a,(hl)			;b8b1
	ld e,a			;b8b2
	inc hl			;b8b3
	ld a,(0dffch)		;b8b4
	add a,(hl)			;b8b7
	ld d,a			;b8b8
	ret			;b8b9

; ----------------------------------------------------------------------
; DATOS resto_B8BA: lo apuntan con el banco puesto p11:B8A8 (0xB8BA); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p11:B8A8 (8 bytes)
;   0xb8ba..0xb8c2  (8 bytes)
DATA_resto_B8BA:
	defb 0f0h,000h,010h,000h,000h,0f0h,000h,010h	; b8ba  ........

; ======================================================================
; CODIGO 0xb8c2..0xb910  (78 bytes)
; ======================================================================


L_B8C2:
	ld a,(0ca41h)		;b8c2
	or a			;b8c5
	jr z,L_B8CE		;b8c6
	ld hl,0dff8h		;b8c8
	ld (hl),000h		;b8cb
	ret			;b8cd
L_B8CE:
	ld hl,0dff8h		;b8ce
	ld a,(hl)			;b8d1
	or a			;b8d2
	ret z			;b8d3
	call L_B8D9		;b8d4
	jr $+97		;b8d7
L_B8D9:
	call L_B8F1		;b8d9
	ld hl,0dff8h		;b8dc
	ld a,(hl)			;b8df
	or a			;b8e0
	ret z			;b8e1
	inc hl			;b8e2
	dec (hl)			;b8e3
	ld a,(hl)			;b8e4
	and 001h		;b8e5
	ret nz			;b8e7
	inc hl			;b8e8
	inc (hl)			;b8e9
	ld a,(hl)			;b8ea
	cp 003h		;b8eb
	ret c			;b8ed
	ld (hl),000h		;b8ee
	ret			;b8f0
L_B8F1:
	call L_B907		;b8f1
	ld hl,0dffdh		;b8f4
	ld a,(hl)			;b8f7
	cp 0c0h		;b8f8
	jr nc,L_B901		;b8fa
	inc hl			;b8fc
	ld a,(hl)			;b8fd
	cp 0c0h		;b8fe
	ret c			;b900
L_B901:
	ld hl,0dff8h		;b901
	ld (hl),000h		;b904
	ret			;b906
L_B907:
	ld a,(0ca61h)		;b907
	or a			;b90a
	ret z			;b90b
	dec a			;b90c
	call 0424dh		;b90d

; ----------------------------------------------------------------------
; DATOS tabla_B910: 4 destinos del despachador p00:424D (call en p11:B90D, el
;   indice en A): B918, B920, B928, B930; lo leen p11:B90D (8 bytes)
;   0xb910..0xb918  (8 bytes)
DATA_tabla_B910:
	defw 0b918h,0b920h,0b928h,0b930h	; b910  -> L_B918 L_B920 L_B928 L_B930

; ======================================================================
; CODIGO 0xb918..0xb998  (128 bytes)
; ======================================================================


L_B918:
	ld hl,0dffdh		;b918
	ld a,(hl)			;b91b
	sub 004h		;b91c
	ld (hl),a			;b91e
	ret			;b91f
L_B920:
	ld hl,0dffdh		;b920
	ld a,(hl)			;b923
	add a,004h		;b924
	ld (hl),a			;b926
	ret			;b927
L_B928:
	ld hl,0dffeh		;b928
	ld a,(hl)			;b92b
	sub 004h		;b92c
	ld (hl),a			;b92e
	ret			;b92f
L_B930:
	ld hl,0dffeh		;b930
	ld a,(hl)			;b933
	add a,004h		;b934
	ld (hl),a			;b936
	ret			;b937
L_B938:
	ld hl,0dc10h		;b938
	ld de,0dc11h		;b93b
	ld (hl),0e0h		;b93e
	ld bc,0000bh		;b940
	ldir		;b943
	ld a,(0dff8h)		;b945
	or a			;b948
	ret z			;b949
	call L_B95A		;b94a
	call L_B974		;b94d
	ld a,(0ca61h)		;b950
	or a			;b953
	ret z			;b954
	call L_B99E		;b955
	jr $+84		;b958
L_B95A:
	ld hl,0dc10h		;b95a
	ld a,(0dffah)		;b95d
	rlca			;b960
	rlca			;b961
	rlca			;b962
	add a,028h		;b963
	ld c,a			;b965
	ld a,(0dffbh)		;b966
	ld e,a			;b969
	ld a,(0dffch)		;b96a
	ld d,a			;b96d
	call 05d41h		;b96e
	jp 05d3dh		;b971
L_B974:
	ld a,(0dffah)		;b974
	add a,a			;b977
	ld hl,0b998h		;b978
	call 0423eh		;b97b
	ld b,(hl)			;b97e
	inc hl			;b97f
	ld c,(hl)			;b980
	push bc			;b981
	ld de,0da40h		;b982
	ld h,d			;b985
	ld l,e			;b986
	inc de			;b987
	ld (hl),b			;b988
	ld bc,0000fh		;b989
	ldir		;b98c
	inc de			;b98e
	inc hl			;b98f
	pop bc			;b990
	ld (hl),c			;b991
	ld bc,0000fh		;b992
	ldir		;b995
	ret			;b997

; ----------------------------------------------------------------------
; DATOS resto_B998: lo apuntan con el banco puesto p11:B978 (0xB998); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p11:B978 (6 bytes)
;   0xb998..0xb99e  (6 bytes)
DATA_resto_B998:
	defb 007h,04bh,00ah,04bh,003h,04ch	; b998

; ======================================================================
; CODIGO 0xb99e..0xb9f5  (87 bytes)
; ======================================================================


L_B99E:
	ld hl,0dffdh		;b99e
	ld e,(hl)			;b9a1
	inc hl			;b9a2
	ld d,(hl)			;b9a3
	ld hl,0dc18h		;b9a4
	ld c,010h		;b9a7
	jp 05d41h		;b9a9
L_B9AC:
	ld a,(0ca03h)		;b9ac
	rra			;b9af
	and 007h		;b9b0
	add a,007h		;b9b2
	ld hl,0da60h		;b9b4
	ld de,0da61h		;b9b7
	ld (hl),a			;b9ba
	ld bc,0000fh		;b9bb
	ldir		;b9be
	ret			;b9c0
L_B9C1:
	ld a,(0d7d1h)		;b9c1
	bit 1,a		;b9c4
	jr nz,$+53		;b9c6
	ld a,(0ca41h)		;b9c8
	or a			;b9cb
	jr nz,L_B9E6		;b9cc
	ld a,(0ca76h)		;b9ce
	cp 02ah		;b9d1
	jr nz,L_B9E6		;b9d3
	ld a,(0ca4bh)		;b9d5
	or a			;b9d8
	jr nz,L_B9E6		;b9d9
	ld hl,0cadeh		;b9db
	ld a,(hl)			;b9de
	or a			;b9df
	ret nz			;b9e0
	ld (hl),001h		;b9e1
	jp 06a9bh		;b9e3
L_B9E6:
	ld hl,0cadeh		;b9e6
	ld a,(hl)			;b9e9
	or a			;b9ea
	ret z			;b9eb
	xor a			;b9ec
	ld (hl),a			;b9ed
	ld hl,0cabfh		;b9ee
	ld (hl),a			;b9f1
	jp 06b12h		;b9f2

; ----------------------------------------------------------------------
; DATOS sin identificar  0xb9f5..0xb9fb  (6 bytes)
DATA_B9F5:
	defb 021h,0bfh,0cah,036h,001h,0c9h	; b9f5

; ======================================================================
; CODIGO 0xb9fb..0xbbeb  (496 bytes)
; ======================================================================


L_B9FB:
	xor a			;b9fb
	ld (0cadeh),a		;b9fc
	ld (0cabfh),a		;b9ff
	ret			;ba02
L_BA03:
	ld hl,0caedh		;ba03
	ld a,(0cb00h)		;ba06
	cp 002h		;ba09
	jr z,L_BA2C		;ba0b
	cp 00bh		;ba0d
	jr z,L_BA2A		;ba0f
	ld a,(0ca4ah)		;ba11
	cp 006h		;ba14
	jr nz,L_BA1F		;ba16
	ld a,(0ca4bh)		;ba18
	cp 010h		;ba1b
	jr z,L_BA2A		;ba1d
L_BA1F:
	ld a,(0cb21h)		;ba1f
	cp 00ah		;ba22
	jr z,L_BA32		;ba24
	cp 00bh		;ba26
	jr z,L_BA3C		;ba28
L_BA2A:
	or a			;ba2a
	ret			;ba2b
L_BA2C:
	call L_BA42		;ba2c
	ret c			;ba2f
	jr L_BAA0		;ba30
L_BA32:
	call L_BA42		;ba32
	ret c			;ba35
	call L_BAF9		;ba36
	ret c			;ba39
	jr L_BAA0		;ba3a
L_BA3C:
	call L_BAF9		;ba3c
	ret c			;ba3f
	jr L_BAA0		;ba40
L_BA42:
	push hl			;ba42
	call L_BA48		;ba43
	pop hl			;ba46
	ret			;ba47
L_BA48:
	ld a,(0ca4ah)		;ba48
	cp 001h		;ba4b
	jr z,L_BA5D		;ba4d
	cp 006h		;ba4f
	jr z,L_BA6C		;ba51
	cp 007h		;ba53
	jr z,L_BA7B		;ba55
	cp 00ah		;ba57
	jr z,L_BA91		;ba59
	or a			;ba5b
	ret			;ba5c
L_BA5D:
	ld b,003h		;ba5d
L_BA5F:
	ld a,(hl)			;ba5f
	cp 02ch		;ba60
	jr c,L_BA67		;ba62
	cp 032h		;ba64
	ret c			;ba66
L_BA67:
	inc hl			;ba67
	djnz L_BA5F		;ba68
	or a			;ba6a
	ret			;ba6b
L_BA6C:
	ld b,003h		;ba6c
L_BA6E:
	ld a,(hl)			;ba6e
	cp 012h		;ba6f
	jr c,L_BA76		;ba71
	cp 014h		;ba73
	ret c			;ba75
L_BA76:
	inc hl			;ba76
	djnz L_BA6E		;ba77
	or a			;ba79
	ret			;ba7a
L_BA7B:
	ld b,003h		;ba7b
L_BA7D:
	ld a,(hl)			;ba7d
	cp 096h		;ba7e
	jr c,L_BA8C		;ba80
	cp 098h		;ba82
	ret c			;ba84
	cp 09ch		;ba85
	jr c,L_BA8C		;ba87
	cp 0a2h		;ba89
	ret c			;ba8b
L_BA8C:
	inc hl			;ba8c
	djnz L_BA7D		;ba8d
	or a			;ba8f
	ret			;ba90
L_BA91:
	ld b,003h		;ba91
L_BA93:
	ld a,(hl)			;ba93
	cp 098h		;ba94
	jr c,L_BA9B		;ba96
	cp 0a0h		;ba98
	ret c			;ba9a
L_BA9B:
	inc hl			;ba9b
	djnz L_BA93		;ba9c
	or a			;ba9e
	ret			;ba9f
L_BAA0:
	push hl			;baa0
	call L_BAA6		;baa1
	pop hl			;baa4
	ret			;baa5
L_BAA6:
	ld a,(0ca4ah)		;baa6
	cp 007h		;baa9
	jr nz,L_BAC6		;baab
	ld a,(0ca76h)		;baad
	or a			;bab0
	jr nz,L_BAC6		;bab1
	ld a,(0ca4bh)		;bab3
	cp 002h		;bab6
	jr c,L_BAC6		;bab8
	cp 005h		;baba
	jr c,L_BAC8		;babc
	cp 008h		;babe
	jr z,L_BAC8		;bac0
	cp 009h		;bac2
	jr z,L_BAC8		;bac4
L_BAC6:
	or a			;bac6
	ret			;bac7
L_BAC8:
	ld b,003h		;bac8
L_BACA:
	ld a,(hl)			;baca
	or a			;bacb
	jr z,L_BAF7		;bacc
	cp 004h		;bace
	ret c			;bad0
	cp 006h		;bad1
	jr c,L_BAF2		;bad3
	cp 010h		;bad5
	ret c			;bad7
	cp 017h		;bad8
	jr c,L_BAF2		;bada
	cp 020h		;badc
	ret c			;bade
	cp 02ah		;badf
	jr z,L_BAF7		;bae1
	cp 030h		;bae3
	jr c,L_BAF2		;bae5
	cp 037h		;bae7
	jr c,L_BAF7		;bae9
	cp 043h		;baeb
	jr c,L_BAF2		;baed
	cp 04bh		;baef
	ret c			;baf1
L_BAF2:
	inc hl			;baf2
	djnz L_BACA		;baf3
	or a			;baf5
	ret			;baf6
L_BAF7:
	scf			;baf7
	ret			;baf8
L_BAF9:
	push hl			;baf9
	call L_BAFF		;bafa
	pop hl			;bafd
	ret			;bafe
L_BAFF:
	ld a,(0ca4ah)		;baff
	cp 006h		;bb02
	jr z,L_BB08		;bb04
	or a			;bb06
	ret			;bb07
L_BB08:
	ld b,003h		;bb08
L_BB0A:
	ld a,(hl)			;bb0a
	cp 090h		;bb0b
	jr c,L_BB19		;bb0d
	cp 0b4h		;bb0f
	ret c			;bb11
	cp 0b8h		;bb12
	jr c,L_BB19		;bb14
	cp 0dch		;bb16
	ret c			;bb18
L_BB19:
	inc hl			;bb19
	djnz L_BB0A		;bb1a
	or a			;bb1c
	ret			;bb1d
L_BB1E:
	ld hl,0caf1h		;bb1e
	ld a,(hl)			;bb21
	or a			;bb22
	ret z			;bb23
	inc hl			;bb24
	ld a,(hl)			;bb25
	dec a			;bb26
	jr z,L_BB33		;bb27
	dec a			;bb29
	ret z			;bb2a
	call 06a0dh		;bb2b
L_BB2E:
	ld hl,0caf2h		;bb2e
	inc (hl)			;bb31
	ret			;bb32
L_BB33:
	call L_BB2E		;bb33
	ld hl,0d443h		;bb36
	ld (hl),001h		;bb39
	call 06c33h		;bb3b
	ld a,(0caf5h)		;bb3e
	cp 00ah		;bb41
	jp z,06c9bh		;bb43
	jp 06abfh		;bb46
L_BB49:
	ld a,(0d674h)		;bb49
	or a			;bb4c
	ret z			;bb4d
	ld a,(0ca8eh)		;bb4e
	or a			;bb51
	jr nz,L_BB8E		;bb52
	ld a,(0ca89h)		;bb54
	cp 002h		;bb57
	jr z,L_BB6C		;bb59
	ld hl,(0ca8ah)		;bb5b
	ld a,h			;bb5e
	or l			;bb5f
	jr z,L_BB74		;bb60
	ld a,(0cb3ch)		;bb62
	or a			;bb65
	ret nz			;bb66
	dec hl			;bb67
	ld (0ca8ah),hl		;bb68
	ret			;bb6b
L_BB6C:
	ld hl,0d7d4h		;bb6c
	ld a,(hl)			;bb6f
	and 0f3h		;bb70
	ld (hl),a			;bb72
	ret			;bb73
L_BB74:
	call L_BB6C		;bb74
	ld hl,0ca8ch		;bb77
	dec (hl)			;bb7a
	ret nz			;bb7b
	ld (hl),008h		;bb7c
	ld hl,0ca89h		;bb7e
	ld a,(hl)			;bb81
	cp 002h		;bb82
	ld b,0ffh		;bb84
	jr nc,L_BB8A		;bb86
	ld b,001h		;bb88
L_BB8A:
	add a,b			;bb8a
	ld (hl),a			;bb8b
	jr L_BBC7		;bb8c
L_BB8E:
	ld bc,000ffh		;bb8e
	ld a,(0ca8eh)		;bb91
	dec a			;bb94
	jr z,L_BB9A		;bb95
	ld bc,00401h		;bb97
L_BB9A:
	ld a,(0ca89h)		;bb9a
	cp b			;bb9d
	ret z			;bb9e
	ld hl,0ca8ch		;bb9f
	dec (hl)			;bba2
	ret nz			;bba3
	ld (hl),010h		;bba4
	ld hl,0ca89h		;bba6
	ld a,(hl)			;bba9
	add a,c			;bbaa
	ld (hl),a			;bbab
	cp b			;bbac
	jr nz,L_BBC7		;bbad
	ld hl,0d7d4h		;bbaf
	or a			;bbb2
	jr z,L_BBBF		;bbb3
	set 2,(hl)		;bbb5
	ld hl,00400h		;bbb7
	ld (0ca8ah),hl		;bbba
	jr L_BBC7		;bbbd
L_BBBF:
	set 3,(hl)		;bbbf
	ld hl,08000h		;bbc1
	ld (0ca8ah),hl		;bbc4
L_BBC7:
	ld a,(0cb21h)		;bbc7
	cp 010h		;bbca
	ret nz			;bbcc
	call L_BBF5		;bbcd
	ld a,(0ca89h)		;bbd0
	ld hl,0bbebh		;bbd3
	call 043f6h		;bbd6
	ld de,0d8a4h		;bbd9
	ld a,(0ca42h)		;bbdc
	rlca			;bbdf
	rlca			;bbe0
	rlca			;bbe1
	rlca			;bbe2
	or 0c8h		;bbe3
	ld bc,01010h		;bbe5
	jp 047edh		;bbe8

; ----------------------------------------------------------------------
; DATOS resto_BBEB: lo apuntan con el banco puesto p11:BBD3 (0xBBEB); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p11:BBD3 (10 bytes)
;   0xbbeb..0xbbf5  (10 bytes)
DATA_resto_BBEB:
	defb 0a0h,010h,090h,0f0h,090h,0e0h,090h,0f0h,0a0h,000h	; bbeb  ..........

; ======================================================================
; CODIGO 0xbbf5..0xbc15  (32 bytes)
; ======================================================================


L_BBF5:
	ld hl,0d8a4h		;bbf5
	jp 08f0eh		;bbf8
L_BBFB:
	ld hl,0ca90h		;bbfb
	ld (hl),001h		;bbfe
	inc hl			;bc00
	ld (hl),000h		;bc01
	inc hl			;bc03
	ld (hl),006h		;bc04
	ld hl,0d7d7h		;bc06
	set 6,(hl)		;bc09
	ret			;bc0b
L_BC0C:
	ld a,(0ca90h)		;bc0c
	or a			;bc0f
	ret z			;bc10
	dec a			;bc11
	call 0424dh		;bc12

; ----------------------------------------------------------------------
; DATOS tabla_BC15: 5 destinos del despachador p00:424D (call en p11:BC12, el
;   indice en A): BC1F, BC34, BC46, BC62, BC8B; lo leen p11:BC12 (10 bytes)
;   0xbc15..0xbc1f  (10 bytes)
DATA_tabla_BC15:
	defw 0bc1fh,0bc34h,0bc46h,0bc62h,0bc8bh	; bc15

; ======================================================================
; CODIGO 0xbc1f..0xbd9d  (382 bytes)
; ======================================================================


L_BC1F:
	call L_BCA0		;bc1f
	ret nz			;bc22
	ld de,00300h		;bc23
	call L_BCAA		;bc26
	ld hl,0c090h		;bc29
	call L_BCB1		;bc2c
L_BC2F:
	ld hl,0ca90h		;bc2f
	inc (hl)			;bc32
	ret			;bc33
L_BC34:
	call L_BCA0		;bc34
	ret nz			;bc37
	ld de,00080h		;bc38
	call L_BCAA		;bc3b
	ld hl,0d090h		;bc3e
	call L_BCB1		;bc41
	jr L_BC2F		;bc44
L_BC46:
	call L_BCA0		;bc46
	ret nz			;bc49
	ld de,00020h		;bc4a
	call L_BCAA		;bc4d
	ld hl,0b0a0h		;bc50
	call L_BCB1		;bc53
	ld hl,0d7d7h		;bc56
	set 3,(hl)		;bc59
	ld hl,0d7e3h		;bc5b
	res 7,(hl)		;bc5e
	jr L_BC2F		;bc60
L_BC62:
	call L_BCA0		;bc62
	ret nz			;bc65
	ld de,00010h		;bc66
	call L_BCAA		;bc69
	ld hl,0c0a0h		;bc6c
	call L_BCB1		;bc6f
	call L_BC2F		;bc72
	ld a,(0cb21h)		;bc75
	cp 00fh		;bc78
	ret nz			;bc7a
	ld hl,0d7d7h		;bc7b
	set 2,(hl)		;bc7e
	ld hl,0d7dfh		;bc80
	res 6,(hl)		;bc83
	call 08f70h		;bc85
	jp 06a93h		;bc88
L_BC8B:
	call L_BCA0		;bc8b
	ret nz			;bc8e
	ld de,00100h		;bc8f
	call L_BCAA		;bc92
	ld hl,0b0a0h		;bc95
	call L_BCB1		;bc98
	ld hl,0ca90h		;bc9b
	dec (hl)			;bc9e
	ret			;bc9f
L_BCA0:
	ld hl,(0ca91h)		;bca0
	dec hl			;bca3
	ld (0ca91h),hl		;bca4
	ld a,l			;bca7
	or h			;bca8
	ret			;bca9
L_BCAA:
	ld hl,0ca91h		;bcaa
	ld (hl),e			;bcad
	inc hl			;bcae
	ld (hl),d			;bcaf
	ret			;bcb0
L_BCB1:
	ld a,(0cb21h)		;bcb1
	cp 00fh		;bcb4
	ret nz			;bcb6
	push hl			;bcb7
	ld hl,0d8a4h		;bcb8
	call 08f0eh		;bcbb
	pop hl			;bcbe
	ld de,0d8a4h		;bcbf
	ld a,(0ca42h)		;bcc2
	rlca			;bcc5
	rlca			;bcc6
	rlca			;bcc7
	rlca			;bcc8
	or 0c8h		;bcc9
	ld bc,01010h		;bccb
	jp 047edh		;bcce
L_BCD1:
	ld a,(0cb00h)		;bcd1
	cp 006h		;bcd4
	ret z			;bcd6
	ld a,(0cb21h)		;bcd7
	dec a			;bcda
	ret nz			;bcdb
	ld a,(0cb00h)		;bcdc
	cp 014h		;bcdf
	jr z,L_BD16		;bce1
	cp 01bh		;bce3
	jr nc,L_BD16		;bce5
	call L_BD31		;bce7
	ret nc			;bcea
	ld a,(0cb00h)		;bceb
	cp 002h		;bcee
	jr z,L_BD1C		;bcf0
	cp 00bh		;bcf2
	jr z,L_BD1C		;bcf4
	ld a,(0ca61h)		;bcf6
	or a			;bcf9
	ret z			;bcfa
	ld a,(0cb27h)		;bcfb
	cp 002h		;bcfe
	jr c,L_BD1C		;bd00
	call L_BD46		;bd02
	call L_BD70		;bd05
	ld hl,0da40h		;bd08
	ld de,0da41h		;bd0b
	ld (hl),007h		;bd0e
	ld bc,0000fh		;bd10
	ldir		;bd13
	ret			;bd15
L_BD16:
	ld a,0e0h		;bd16
	ld (0dc10h),a		;bd18
	ret			;bd1b
L_BD1C:
	ld a,(0cb00h)		;bd1c
	cp 006h		;bd1f
	ret z			;bd21
	ld hl,0dc10h		;bd22
	ld de,0dc11h		;bd25
	ld (hl),0e0h		;bd28
	ldi		;bd2a
	ldi		;bd2c
	ldi		;bd2e
	ret			;bd30
L_BD31:
	ld a,(0cb0fh)		;bd31
	or a			;bd34
	ret z			;bd35
	ld hl,0cb80h		;bd36
	ld de,00010h		;bd39
	ld b,006h		;bd3c
L_BD3E:
	ld a,(hl)			;bd3e
	or a			;bd3f
	ret nz			;bd40
	add hl,de			;bd41
	djnz L_BD3E		;bd42
	scf			;bd44
	ret			;bd45
L_BD46:
	call L_BD54		;bd46
	ld de,040f1h		;bd49
	ld bc,04001h		;bd4c
	ld a,007h		;bd4f
	jp 04767h		;bd51
L_BD54:
	ld l,0c4h		;bd54
	ld a,(0ca61h)		;bd56
	cp 003h		;bd59
	jr c,L_BD5E		;bd5b
	inc l			;bd5d
L_BD5E:
	ld h,000h		;bd5e
	rra			;bd60
	jr c,L_BD65		;bd61
	ld h,080h		;bd63
L_BD65:
	ld a,(0cb27h)		;bd65
	cp 003h		;bd68
	ret nz			;bd6a
	ld a,h			;bd6b
	add a,040h		;bd6c
	ld h,a			;bd6e
	ret			;bd6f
L_BD70:
	ld a,(0cb0eh)		;bd70
	dec a			;bd73
	add a,a			;bd74
	add a,a			;bd75
	add a,a			;bd76
	ld b,a			;bd77
	ld a,(0ca61h)		;bd78
	dec a			;bd7b
	add a,a			;bd7c
	add a,b			;bd7d
	ld hl,0bd9dh		;bd7e
	call 0423eh		;bd81
	ld a,(0cb03h)		;bd84
	add a,(hl)			;bd87
	ld e,a			;bd88
	ld a,(0cb43h)		;bd89
	add a,e			;bd8c
	ld e,a			;bd8d
	inc hl			;bd8e
	ld a,(0cb05h)		;bd8f
	add a,(hl)			;bd92
	ld hl,0dc10h		;bd93
	ld (hl),e			;bd96
	inc l			;bd97
	ld (hl),a			;bd98
	inc l			;bd99
	ld (hl),014h		;bd9a
	ret			;bd9c

; ----------------------------------------------------------------------
; DATOS resto_BD9D: lo apuntan con el banco puesto p11:BD7E (0xBD9D); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p11:BD7E (32 bytes)
;   0xbd9d..0xbdbd  (32 bytes)
DATA_resto_BD9D:
	defb 0d8h,0f8h,0e3h,0f8h,0dfh,0f3h,0deh,003h,0ddh,0f8h,0e8h,0fch,0e1h,0f2h,0e2h,001h	; bd9d  ................
	defb 0dah,0f7h,0e6h,0f9h,0dfh,0f1h,0e0h,0feh,0dah,002h,0e5h,000h,0dfh,0f7h,0dfh,005h	; bdad  ................

; ======================================================================
; CODIGO 0xbdbd..0xbe3d  (128 bytes)
; ======================================================================


L_BDBD:
	push ix		;bdbd
	call L_BDCB		;bdbf
	call L_BDE7		;bdc2
	call L_BE03		;bdc5
	pop ix		;bdc8
	ret			;bdca
L_BDCB:
	ld ix,0cc00h		;bdcb
	ld b,008h		;bdcf
L_BDD1:
	ld a,(ix+000h)		;bdd1
	and 07fh		;bdd4
	jr z,L_BDDF		;bdd6
	cp c			;bdd8
	jr nz,L_BDDF		;bdd9
	ld (ix+000h),000h		;bddb
L_BDDF:
	ld de,00010h		;bddf
	add ix,de		;bde2
	djnz L_BDD1		;bde4
	ret			;bde6
L_BDE7:
	ld ix,0cc80h		;bde7
	ld b,010h		;bdeb
L_BDED:
	ld a,(ix+000h)		;bded
	and 07fh		;bdf0
	jr z,L_BDFB		;bdf2
	cp c			;bdf4
	jr nz,L_BDFB		;bdf5
	ld (ix+000h),000h		;bdf7
L_BDFB:
	ld de,00008h		;bdfb
	add ix,de		;bdfe
	djnz L_BDED		;be00
	ret			;be02
L_BE03:
	ld a,(0d760h)		;be03
	or a			;be06
	ret z			;be07
	cp c			;be08
	ret nz			;be09
	xor a			;be0a
	ld (0d760h),a		;be0b
	ret			;be0e
L_BE0F:
	ld hl,0cb7ch		;be0f
	dec (hl)			;be12
	ret nz			;be13
	ld (hl),002h		;be14
	ld a,(0cb7bh)		;be16
	cp 017h		;be19
	jr z,L_BE37		;be1b
	add a,a			;be1d
	ld hl,0be3dh		;be1e
	call 0423eh		;be21
	ld e,(hl)			;be24
	inc hl			;be25
	ld d,(hl)			;be26
	ld hl,0cb78h		;be27
	ld (hl),001h		;be2a
	inc hl			;be2c
	ld (hl),e			;be2d
	inc hl			;be2e
	ld (hl),d			;be2f
	ld hl,0cb7bh		;be30
	inc (hl)			;be33
	jp 06c2bh		;be34
L_BE37:
	ld hl,0cb78h		;be37
	ld (hl),000h		;be3a
	ret			;be3c

; ----------------------------------------------------------------------
; DATOS resto_BE3D: lo apuntan con el banco puesto p11:BE1E (0xBE3D); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p11:BE1E (46 bytes)
;   0xbe3d..0xbe6b  (46 bytes)
DATA_resto_BE3D:
	defb 034h,030h,034h,040h,044h,030h,044h,040h,054h,030h,054h,040h,064h,030h,064h,040h	; be3d  404@D0D@T0T@d0d@
	defb 074h,030h,074h,040h,074h,050h,074h,060h,074h,070h,074h,080h,074h,090h,064h,080h	; be4d  t0t@tPt`tpt.t.d.
	defb 064h,090h,054h,080h,054h,090h,044h,080h,044h,090h,034h,080h,034h,090h	; be5d  d.T.T.D.D.4.4.

; ======================================================================
; CODIGO 0xbe6b..0xbed4  (105 bytes)
; ======================================================================


L_BE6B:
	ld a,(0cb78h)		;be6b
	or a			;be6e
	ret z			;be6f
	ld hl,0dc10h		;be70
	ld a,(0cb79h)		;be73
	ld (hl),a			;be76
	inc hl			;be77
	ld a,(0cb7ah)		;be78
	ld (hl),a			;be7b
	inc hl			;be7c
	ld a,(0cb7ch)		;be7d
	cp 002h		;be80
	ld c,0f0h		;be82
	jr z,L_BE88		;be84
	ld c,0f4h		;be86
L_BE88:
	ld (hl),c			;be88
	ld hl,0da40h		;be89
	ld bc,0000fh		;be8c
	ld a,007h		;be8f
	jp 04237h		;be91
L_BE94:
	ld hl,0dc10h		;be94
	ld de,0dc11h		;be97
	ld (hl),0e0h		;be9a
	ld bc,0000fh		;be9c
	ldir		;be9f
	ret			;bea1
L_BEA2:
	ld a,(0ca97h)		;bea2
	or a			;bea5
	ret z			;bea6
	ld a,(0caach)		;bea7
	or a			;beaa
	jr z,L_BE94		;beab
	ld hl,0dc10h		;bead
	ld de,0dc11h		;beb0
	ld (hl),0e0h		;beb3
	ld bc,0000fh		;beb5
	ldir		;beb8
	call L_BECB		;beba
	ld hl,0da40h		;bebd
	ld de,0da41h		;bec0
	ld (hl),007h		;bec3
	ld bc,0001fh		;bec5
	ldir		;bec8
	ret			;beca
L_BECB:
	ld a,(0ca03h)		;becb
	rra			;bece
	and 007h		;becf
	call 0424dh		;bed1

; ----------------------------------------------------------------------
; DATOS tabla_BED4: 8 destinos del despachador p00:424D (call en p11:BED1, el
;   indice en A): BEF4, BF04, BEF4, BF04, BEE4, BF04, BEE4, BF04; lo leen
;   p11:BED1 (16 bytes)
;   0xbed4..0xbee4  (16 bytes)
DATA_tabla_BED4:
	defw 0bef4h,0bf04h,0bef4h,0bf04h,0bee4h,0bf04h,0bee4h,0bf04h	; bed4

; ======================================================================
; CODIGO 0xbee4..0xbf4f  (107 bytes)
; ======================================================================


L_BEE4:
	ld hl,0dc10h		;bee4
	ld c,020h		;bee7
	ld de,0c810h		;bee9
	call 05d41h		;beec
	ld d,0d8h		;beef
	jp 05d3dh		;bef1
L_BEF4:
	ld hl,0dc10h		;bef4
	ld c,018h		;bef7
	ld de,0c42eh		;bef9
	call 05d41h		;befc
	ld d,0d4h		;beff
	jp 05d3dh		;bf01
L_BF04:
	ld hl,0dc10h		;bf04
	ld a,0e0h		;bf07
	ld bc,00007h		;bf09
	jp 04237h		;bf0c
L_BF0F:
	call L_BF14		;bf0f
	jr $+75		;bf12
L_BF14:
	ld de,0bf4fh		;bf14
	ld hl,0dc10h		;bf17
	exx			;bf1a
	ld c,00ch		;bf1b
	exx			;bf1d
	ld b,007h		;bf1e
L_BF20:
	push bc			;bf20
	ld a,(0e1d2h)		;bf21
	ld b,a			;bf24
	ld a,(de)			;bf25
	add a,b			;bf26
	ld c,a			;bf27
	inc de			;bf28
	ld (hl),c			;bf29
	inc hl			;bf2a
	ld a,(0e1d3h)		;bf2b
	ld b,a			;bf2e
	ld a,(de)			;bf2f
	add a,b			;bf30
	ld b,a			;bf31
	inc de			;bf32
	ld (hl),b			;bf33
	inc hl			;bf34
	exx			;bf35
	ld a,c			;bf36
	add a,004h		;bf37
	ld c,a			;bf39
	exx			;bf3a
	ld (hl),a			;bf3b
	inc hl			;bf3c
	inc hl			;bf3d
	ld (hl),c			;bf3e
	inc hl			;bf3f
	ld (hl),b			;bf40
	inc hl			;bf41
	exx			;bf42
	ld a,c			;bf43
	add a,004h		;bf44
	ld c,a			;bf46
	exx			;bf47
	ld (hl),a			;bf48
	inc hl			;bf49
	inc hl			;bf4a
	pop bc			;bf4b
	djnz L_BF20		;bf4c
	ret			;bf4e

; ----------------------------------------------------------------------
; DATOS resto_BF4F: lo apuntan con el banco puesto p11:BF14 (0xBF4F); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p11:BF14 (14 bytes)
;   0xbf4f..0xbf5d  (14 bytes)
DATA_resto_BF4F:
	defb 000h,010h,000h,020h,010h,000h,010h,010h,010h,020h,010h,030h,020h,018h	; bf4f  ... ..... .0 .

; ======================================================================
; CODIGO 0xbf5d..0xbff5  (152 bytes)
; ======================================================================


L_BF5D:
	ld a,(0e1d2h)		;bf5d
	cp 0c0h		;bf60
	jr c,L_BF73		;bf62
	cp 0d0h		;bf64
	jr nc,L_BF73		;bf66
	ld hl,0dc10h		;bf68
	ld bc,00037h		;bf6b
	ld a,0e0h		;bf6e
	jp 04237h		;bf70
L_BF73:
	call L_BF78		;bf73
	jr L_BFA0		;bf76
L_BF78:
	ld de,0da41h		;bf78
	ld hl,0da40h		;bf7b
	ld bc,0060ch		;bf7e
	ld a,043h		;bf81
	call L_BF8B		;bf83
	ld bc,00103h		;bf86
	ld a,04eh		;bf89
L_BF8B:
	push bc			;bf8b
	ld (hl),c			;bf8c
	ld bc,0000fh		;bf8d
	ldir		;bf90
	inc hl			;bf92
	inc de			;bf93
	ld (hl),a			;bf94
	ld bc,0000fh		;bf95
	ldir		;bf98
	inc hl			;bf9a
	inc de			;bf9b
	pop bc			;bf9c
	djnz L_BF8B		;bf9d
	ret			;bf9f
L_BFA0:
	ld a,(0e1d2h)		;bfa0
	cp 090h		;bfa3
	ret c			;bfa5
	cp 0a0h		;bfa6
	jr c,L_BFD1		;bfa8
	cp 0b0h		;bfaa
	jr c,L_BFC1		;bfac
	cp 0c0h		;bfae
	ret nc			;bfb0
	ld hl,0da80h		;bfb1
	ld bc,0009fh		;bfb4
	call 04236h		;bfb7
	ld hl,0da40h		;bfba
	ld c,004h		;bfbd
	jr L_BFD6		;bfbf
L_BFC1:
	ld hl,0db00h		;bfc1
	ld bc,0001fh		;bfc4
	call 04236h		;bfc7
	ld hl,0da80h		;bfca
	ld c,008h		;bfcd
	jr L_BFD6		;bfcf
L_BFD1:
	ld hl,0db00h		;bfd1
	ld c,002h		;bfd4
L_BFD6:
	ld a,(0e1d2h)		;bfd6
	and 00fh		;bfd9
	or a			;bfdb
	ret z			;bfdc
	ld b,a			;bfdd
	ld a,010h		;bfde
	sub b			;bfe0
	call 0423eh		;bfe1
L_BFE4:
	push hl			;bfe4
	push bc			;bfe5
L_BFE6:
	ld (hl),000h		;bfe6
	inc hl			;bfe8
	djnz L_BFE6		;bfe9
	pop bc			;bfeb
	pop hl			;bfec
	ld de,00010h		;bfed
	add hl,de			;bff0
	dec c			;bff1
	jr nz,L_BFE4		;bff2
	ret			;bff4

; ----------------------------------------------------------------------
; DATOS sin identificar  0xbff5..0xc000  (11 bytes)
DATA_BFF5:
	defb 002h,001h,002h,003h,001h,003h,004h,002h,004h,005h,073h	; bff5  ..........s
