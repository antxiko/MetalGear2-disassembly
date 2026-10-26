; ==========================================================================
; METAL GEAR 2 SOLID SNAKE - Konami (1990) - MSX2 - MegaROM RC-767 de 512 KB (Konami SCC) - banco 08 (se ejecuta en 0xa000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x0a000


; ======================================================================
; CODIGO 0xa000..0xa00a  (10 bytes)
; ======================================================================


L_A000:
	ld hl,0d422h		;a000
	inc (hl)			;a003
	ld a,(ix+001h)		;a004
	call 0424dh		;a007   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_A00A: 14 destinos del despachador p00:424D (call en p08:A007, el
;   indice en A): A026, A032, A03C, A086, A055, A0A9, A0B0, A07E, 8ECD, 8ED9,
;   A044, A086, A0C7, A0BB; lo leen p08:A007 (28 bytes)
;   0xa00a..0xa026  (28 bytes)
DATA_tabla_A00A:
	defw 0a026h,0a032h,0a03ch,0a086h,0a055h,0a0a9h,0a0b0h,0a07eh	; a00a
	defw 08ecdh,08ed9h,0a044h,0a086h,0a0c7h,0a0bbh	; a01a

; ======================================================================
; CODIGO 0xa026..0xa0ac  (134 bytes)
; ======================================================================


L_A026:
	xor a			;a026
	ld (0d422h),a		;a027
	inc a			;a02a
	call 08e37h		;a02b
L_A02E:
	inc (ix+001h)		;a02e
	ret			;a031
L_A032:
	ld (ix+00ch),001h		;a032
	call 081c5h		;a036
	jp L_A02E		;a039
L_A03C:
	ld a,(ix+003h)		;a03c
	cp 070h		;a03f
	jp c,L_A079		;a041
L_A044:
	ld (ix+00dh),004h		;a044
	ld (ix+00eh),030h		;a048
	xor a			;a04c
	ld (ix+00ch),a		;a04d
	ld (ix+00fh),a		;a050
	jr L_A02E		;a053
L_A055:
	ld a,(0ca5fh)		;a055
	and a			;a058
	ld b,02ch		;a059
	jr z,L_A05F		;a05b
	ld b,030h		;a05d
L_A05F:
	ld a,(ix+007h)		;a05f
	rla			;a062
	jr nc,L_A079		;a063
	ld a,(ix+003h)		;a065
	cp b			;a068
	jr nc,L_A079		;a069
	ld a,(0ca4bh)		;a06b   ; lee la sala de la zona
	cp 009h		;a06e
	jr nz,L_A02E		;a070
	ld a,001h		;a072
	ld (0d509h),a		;a074
	jr L_A02E		;a077
L_A079:
	ld b,006h		;a079
	jp 09022h		;a07b
L_A07E:
	ld (ix+001h),004h		;a07e
	xor a			;a082
	jp 08e37h		;a083
L_A086:
	dec (ix+00eh)		;a086
	jr z,L_A0A5		;a089
	ld a,(ix+00eh)		;a08b
	and 007h		;a08e
	ret nz			;a090
	ld a,(ix+00fh)		;a091
	inc a			;a094
	and 003h		;a095
	ld (ix+00fh),a		;a097
	ld hl,0a0ach		;a09a
	call 0423eh		;a09d   ; suma_a_hl: HL = HL + A
	ld a,(hl)			;a0a0
	ld (ix+00dh),a		;a0a1
	ret			;a0a4
L_A0A5:
	xor a			;a0a5
	call 08e37h		;a0a6
L_A0A9:
	jp L_A02E		;a0a9

; ----------------------------------------------------------------------
; DATOS resto_A0AC: lo apuntan con el banco puesto p08:A09A (0xA0AC); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p08:A09A (4 bytes)
;   0xa0ac..0xa0b0  (4 bytes)
DATA_resto_A0AC:
	defb 004h,005h,004h,006h	; a0ac

; ======================================================================
; CODIGO 0xa0b0..0xa202  (338 bytes)
; ======================================================================


L_A0B0:
	call 08273h		;a0b0
	call 080f3h		;a0b3
	ld (ix+001h),00dh		;a0b6
	ret			;a0ba
L_A0BB:
	xor a			;a0bb
	ld (0d416h),a		;a0bc
	ld a,020h		;a0bf
	ld (0d417h),a		;a0c1
	jp 0834ch		;a0c4
L_A0C7:
	ld a,(ix+01eh)		;a0c7
	call 08e37h		;a0ca
	ld a,(ix+024h)		;a0cd
	ld (ix+003h),a		;a0d0
	ld a,(ix+025h)		;a0d3
	ld (ix+005h),a		;a0d6
	ld a,(ix+021h)		;a0d9
	ld (ix+001h),a		;a0dc
	ld a,(ix+023h)		;a0df
	ld (ix+00ch),a		;a0e2
	ret			;a0e5
L_A0E6:
	ld hl,0d7e1h		;a0e6
	res 3,(hl)		;a0e9
	ld hl,0ca42h		;a0eb   ; apunta a la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	ld a,(hl)			;a0ee
	push af			;a0ef
	push hl			;a0f0
	xor 001h		;a0f1
	ld (hl),a			;a0f3
	call L_A0FB		;a0f4
	pop hl			;a0f7
	pop af			;a0f8
	ld (hl),a			;a0f9
	ret			;a0fa
L_A0FB:
	ld a,(0ca4bh)		;a0fb   ; lee la sala de la zona
	ld b,a			;a0fe
	ld a,(0ca4ah)		;a0ff   ; lee la zona
	cp 003h		;a102
	jr z,L_A11B		;a104
	cp 004h		;a106
	ret nz			;a108
	ld a,b			;a109
	ld hl,0cacch		;a10a
	cp 005h		;a10d
	jr z,L_A136		;a10f
	inc hl			;a111
	cp 00eh		;a112
	jr z,L_A136		;a114
	cp 013h		;a116
	ret nz			;a118
	jr L_A136		;a119
L_A11B:
	ld hl,0cacbh		;a11b
	ld a,(0ca76h)		;a11e   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 00ch		;a121
	jr z,L_A136		;a123
	and a			;a125
	ret nz			;a126
	ld a,b			;a127
	ld hl,0cac9h		;a128
	and a			;a12b
	jr z,L_A136		;a12c
	cp 005h		;a12e
	jr z,L_A136		;a130
	cp 010h		;a132
	ret nz			;a134
	inc hl			;a135
L_A136:
	ld a,(hl)			;a136
	and a			;a137
	jp z,07a5fh		;a138   ; p01:7A5F
L_A13B:
	ld a,(0ca4ah)		;a13b   ; lee la zona
	sub 003h		;a13e
	cp 002h		;a140
	ret nc			;a142
	ld b,a			;a143
	ld a,(0cb21h)		;a144
	cp 003h		;a147
	jr nz,L_A14E		;a149
	jp 071fah		;a14b   ; p01:71FA
L_A14E:
	ld a,(0ca42h)		;a14e   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	push bc			;a151
	call 04452h		;a152   ; borra_pantalla_de: 0xC0 x 0xC0 puntos a 0 en la pagina A
	pop bc			;a155
	ld hl,0d7e1h		;a156
	set 3,(hl)		;a159
	ld a,b			;a15b
	and a			;a15c
	jr nz,L_A17C		;a15d
	ld a,(0ca76h)		;a15f   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 00ch		;a162
	ld de,08828h		;a164
	jr z,L_A177		;a167
	ld a,(0ca4bh)		;a169   ; lee la sala de la zona
	and a			;a16c
	ld de,04888h		;a16d
	jr z,L_A177		;a170
	cp 010h		;a172
	ld d,0a8h		;a174
	ret nz			;a176
L_A177:
	ld a,053h		;a177
	jp 04a2ch		;a179   ; pieza_de_sala_a_esta: el caracter A de la sala de la pagina 2 a la pagina en la que se dibuja
L_A17C:
	ld a,(0ca4bh)		;a17c   ; lee la sala de la zona
	cp 00eh		;a17f
	ld de,01048h		;a181
	jr z,L_A177		;a184
	ret			;a186
L_A187:
	ld hl,0d7e1h		;a187
	res 3,(hl)		;a18a
	call 07c0eh		;a18c
	call 045cch		;a18f   ; apaga_pantalla: R#1 con el bit 6 (BL) a cero, desde la copia 0xF3E0
	call 05debh		;a192   ; p00:5DEB
	call 045c5h		;a195   ; enciende_pantalla: R#1 con el bit 6 (BL) a uno, desde la copia 0xF3E0
	call 07c1ah		;a198   ; p01:7C1A
	call L_A1CB		;a19b
	call 045cch		;a19e   ; apaga_pantalla: R#1 con el bit 6 (BL) a cero, desde la copia 0xF3E0
	call L_A1CB		;a1a1
	call 045c5h		;a1a4   ; enciende_pantalla: R#1 con el bit 6 (BL) a uno, desde la copia 0xF3E0
	call L_A1CB		;a1a7
	call 045cch		;a1aa   ; apaga_pantalla: R#1 con el bit 6 (BL) a cero, desde la copia 0xF3E0
	call L_A1CB		;a1ad
	call 045c5h		;a1b0   ; enciende_pantalla: R#1 con el bit 6 (BL) a uno, desde la copia 0xF3E0
	ld a,(0ca4ah)		;a1b3   ; lee la zona
	cp 004h		;a1b6
	ret nz			;a1b8
	ld a,(0ca51h)		;a1b9
	cp 009h		;a1bc
	ret nz			;a1be
	ld a,(0ca5fh)		;a1bf
	and a			;a1c2
	ret nz			;a1c3
	call 0929ah		;a1c4   ; p04:929A
	ret nc			;a1c7
	jp 09949h		;a1c8
L_A1CB:
	ld bc,01000h		;a1cb
L_A1CE:
	push bc			;a1ce
	pop bc			;a1cf
	dec bc			;a1d0
	ld a,b			;a1d1
	or c			;a1d2
	jr nz,L_A1CE		;a1d3
	ret			;a1d5
L_A1D6:
	ld a,(ix+001h)		;a1d6
	sub 008h		;a1d9
	jp z,08ecdh		;a1db   ; p04:8ECD
	jp z,08ed9h		;a1de   ; p04:8ED9
	ld a,(ix+000h)		;a1e1
	rla			;a1e4
	ret c			;a1e5
	ld a,(0ca5fh)		;a1e6
	cp 002h		;a1e9
	ret nz			;a1eb
	ld c,(ix+001h)		;a1ec
	jp 08f16h		;a1ef   ; p04:8F16
L_A1F2:
	ld a,(ix+001h)		;a1f2
	cp 008h		;a1f5
	jp z,08ecdh		;a1f7
	cp 009h		;a1fa
	jp z,08ed9h		;a1fc
	call 0424dh		;a1ff   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_A202: 6 destinos del despachador p00:424D (call en p08:A1FF, el
;   indice en A): A20E, A225, A315, A351, A3D1, A3E5; lo leen p08:A1FF (12
;   bytes)
;   0xa202..0xa20e  (12 bytes)
DATA_tabla_A202:
	defw 0a20eh,0a225h,0a315h,0a351h,0a3d1h,0a3e5h	; a202

; ======================================================================
; CODIGO 0xa20e..0xa2df  (209 bytes)
; ======================================================================


L_A20E:
	ld a,003h		;a20e
	call 08e37h		;a210
	xor a			;a213
	ld (ix+00fh),a		;a214
	ld (0d431h),a		;a217
	inc a			;a21a
	ld (ix+02ch),a		;a21b
	call 0591dh		;a21e   ; bloques_de_77ef: la sala de la ficha IX de p24:77EF con los bloques de p25:9EE4, a 0xE500
L_A221:
	inc (ix+001h)		;a221
	ret			;a224
L_A225:
	call 08100h		;a225
	jr z,L_A230		;a228
	ld a,(0d431h)		;a22a
	and a			;a22d
	jr z,L_A27C		;a22e
L_A230:
	call 0900bh		;a230
	call L_A2C7		;a233
	ld c,(ix+003h)		;a236
	ld b,(ix+005h)		;a239
	ld a,(ix+00dh)		;a23c
	add a,a			;a23f
	and 00ch		;a240
	ld hl,0a305h		;a242
	call 0423eh		;a245   ; suma_a_hl: HL = HL + A
	call L_A2AC		;a248
	jr c,L_A281		;a24b
	call L_A2AC		;a24d
	jr c,L_A281		;a250
	ld a,(ix+02bh)		;a252
	and a			;a255
	jr z,L_A25D		;a256
	call L_A2D5		;a258
	jr nc,L_A281		;a25b
L_A25D:
	call 080e6h		;a25d
	ret c			;a260
	ld a,(ix+00dh)		;a261
	rrca			;a264
	and 003h		;a265
	inc a			;a267
	ld (0d432h),a		;a268
	ld a,(ix+019h)		;a26b
	cp 005h		;a26e
	ld a,02dh		;a270
	jr nz,L_A276		;a272
	ld a,001h		;a274
L_A276:
	ld (0d431h),a		;a276
	jp 0591dh		;a279   ; bloques_de_77ef: la sala de la ficha IX de p24:77EF con los bloques de p25:9EE4, a 0xE500
L_A27C:
	xor a			;a27c
	ld (0d300h),a		;a27d
	ret			;a280
L_A281:
	ld a,(ix+019h)		;a281
	cp 005h		;a284
	jp nc,L_A355		;a286
	ld a,(ix+02ch)		;a289
	and a			;a28c
	jp nz,L_A355		;a28d
	ld (ix+00ch),000h		;a290
	jp L_A33E		;a294
L_A297:
	ld a,(ix+003h)		;a297
	and 0f8h		;a29a
	or 00ah		;a29c
	ld (ix+003h),a		;a29e
	ld a,(ix+005h)		;a2a1
	and 0f8h		;a2a4
	or 008h		;a2a6
	ld (ix+005h),a		;a2a8
	ret			;a2ab
L_A2AC:
	ld a,001h		;a2ac
	ld (0d8a3h),a		;a2ae
	ld a,c			;a2b1
	add a,(hl)			;a2b2
	ld e,a			;a2b3
	inc hl			;a2b4
	ld a,b			;a2b5
	add a,(hl)			;a2b6
	ld d,a			;a2b7
	inc hl			;a2b8
	push hl			;a2b9
	push bc			;a2ba
	ex de,hl			;a2bb
	call 07f3dh		;a2bc
	pop bc			;a2bf
	pop hl			;a2c0
	ld a,000h		;a2c1
	ld (0d8a3h),a		;a2c3
	ret			;a2c6
L_A2C7:
	ld a,(ix+019h)		;a2c7
	cp 004h		;a2ca
	ret nz			;a2cc
	ld a,(0ca03h)		;a2cd   ; lee el contador de cuadros (uno mas en cada interrupcion)
	rra			;a2d0
	ret nc			;a2d1
	jp 06c63h		;a2d2   ; p01:6C63
L_A2D5:
	ld d,(ix+005h)		;a2d5
	ld e,(ix+003h)		;a2d8
	dec a			;a2db
	call 0424dh		;a2dc   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_A2DF: 6 destinos del despachador p00:424D (call en p08:A2DC, el
;   indice en A): A2EB, A2EF, A2F4, A2F8, A2FC, A300; lo leen p08:A2DC (12
;   bytes)
;   0xa2df..0xa2eb  (12 bytes)
DATA_tabla_A2DF:
	defw 0a2ebh,0a2efh,0a2f4h,0a2f8h,0a2fch,0a300h	; a2df

; ======================================================================
; CODIGO 0xa2eb..0xa305  (26 bytes)
; ======================================================================


L_A2EB:
	ld a,d			;a2eb
	cp 0a4h		;a2ec
	ret			;a2ee
L_A2EF:
	ld a,e			;a2ef
	cp 05ch		;a2f0
	ccf			;a2f2
	ret			;a2f3
L_A2F4:
	ld a,d			;a2f4
	cp 084h		;a2f5
	ret			;a2f7
L_A2F8:
	ld a,d			;a2f8
	cp 044h		;a2f9
	ret			;a2fb
L_A2FC:
	ld a,e			;a2fc
	cp 08ch		;a2fd
	ret			;a2ff
L_A300:
	ld a,e			;a300
	cp 044h		;a301
	ccf			;a303
	ret			;a304

; ----------------------------------------------------------------------
; DATOS resto_A305: lo apuntan con el banco puesto p08:A242 (0xA305); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p08:A242 (16 bytes)
;   0xa305..0xa315  (16 bytes)
DATA_resto_A305:
	defb 0f4h,0fch,0f4h,003h,004h,0fch,004h,003h,0fah,0f8h,003h,0f8h,0fah,007h,003h,007h	; a305  ................

; ======================================================================
; CODIGO 0xa315..0xa39d  (136 bytes)
; ======================================================================


L_A315:
	dec (ix+00eh)		;a315
	ret nz			;a318
	ld a,(ix+019h)		;a319
	cp 005h		;a31c
	jp nc,L_A355		;a31e
	call L_A345		;a321
	ld a,(ix+003h)		;a324
	or 00ch		;a327
	and 0fch		;a329
	ld (ix+003h),a		;a32b
	ld a,(ix+005h)		;a32e
	or 008h		;a331
	and 0f8h		;a333
	ld (ix+005h),a		;a335
	call 08100h		;a338
	call z,06c5fh		;a33b   ; p01:6C5F
L_A33E:
	ld (ix+00eh),010h		;a33e
	jp L_A221		;a342
L_A345:
	ld a,(ix+00dh)		;a345
	rra			;a348
	rra			;a349
	ccf			;a34a
	rla			;a34b
	rla			;a34c
	ld (ix+00dh),a		;a34d
	ret			;a350
L_A351:
	dec (ix+00eh)		;a351
	ret nz			;a354
L_A355:
	call L_A297		;a355
	ld (ix+001h),001h		;a358
	ld b,(ix+00fh)		;a35c
	inc (ix+00fh)		;a35f
	ld a,(ix+00fh)		;a362
	cp 034h		;a365
	jr c,L_A36D		;a367
	ld (ix+00fh),032h		;a369
L_A36D:
	ld a,b			;a36d
	ld hl,0a39dh		;a36e
	call 0423eh		;a371   ; suma_a_hl: HL = HL + A
	ld a,(hl)			;a374
	rlca			;a375
	rlca			;a376
	rlca			;a377
	ld b,a			;a378
	and 007h		;a379
	ld (ix+02bh),a		;a37b
	ld a,b			;a37e
	rlca			;a37f
	ld b,a			;a380
	and 001h		;a381
	ld (ix+02ch),a		;a383
	ld a,(ix+019h)		;a386
	cp 005h		;a389
	jr z,L_A397		;a38b
	ld a,b			;a38d
	rlca			;a38e
	ld a,004h		;a38f
	jr c,L_A394		;a391
	xor a			;a393
L_A394:
	ld (ix+019h),a		;a394
L_A397:
	ld a,(hl)			;a397
	and 003h		;a398
	jp 08e37h		;a39a

; ----------------------------------------------------------------------
; DATOS resto_A39D: lo apuntan con el banco puesto p08:A36E (0xA39D); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p08:A36E (52 bytes)
;   0xa39d..0xa3d1  (52 bytes)
DATA_resto_A39D:
	defb 010h,003h,001h,003h,010h,002h,010h,033h,000h,002h,000h,002h,001h,012h,050h,002h	; a39d  .......3......P.
	defb 000h,002h,001h,013h,001h,003h,011h,063h,011h,012h,010h,002h,001h,083h,0a1h,013h	; a3ad  .......c........
	defb 000h,003h,009h,003h,008h,002h,010h,012h,000h,012h,011h,002h,000h,003h,010h,002h	; a3bd  ................
	defb 0c8h,010h,013h,012h	; a3cd

; ======================================================================
; CODIGO 0xa3d1..0xa407  (54 bytes)
; ======================================================================


L_A3D1:
	call L_A345		;a3d1
	ld a,(ix+00ch)		;a3d4
	ld (ix+023h),a		;a3d7
	ld (ix+00ch),000h		;a3da
	ld (ix+00eh),020h		;a3de
	jp L_A221		;a3e2
L_A3E5:
	dec (ix+00eh)		;a3e5
	ret nz			;a3e8
	ld a,(ix+023h)		;a3e9
	ld (ix+00ch),a		;a3ec
	ld a,(ix+021h)		;a3ef
	ld (ix+001h),a		;a3f2
	call L_A345		;a3f5
	ld a,(ix+00dh)		;a3f8
	rrca			;a3fb
	and 003h		;a3fc
	jp 08e37h		;a3fe
L_A401:
	ld a,(ix+001h)		;a401
	call 0424dh		;a404   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_A407: 6 destinos del despachador p00:424D (call en p08:A404, el
;   indice en A): A413, A46B, A58A, A618, A70E, A75F; lo leen p08:A404 (12
;   bytes)
;   0xa407..0xa413  (12 bytes)
DATA_tabla_A407:
	defw 0a413h,0a46bh,0a58ah,0a618h,0a70eh,0a75fh	; a407

; ======================================================================
; CODIGO 0xa413..0xa552  (319 bytes)
; ======================================================================


L_A413:
	xor a			;a413
	ld (0d43fh),a		;a414
	ld (ix+00eh),a		;a417
	ld (ix+00fh),a		;a41a
	ld (ix+00ch),a		;a41d
	ld (ix+00dh),a		;a420
	ld (ix+022h),a		;a423
	ld (ix+018h),a		;a426
	ld (ix+025h),a		;a429
	ld (ix+027h),a		;a42c
	call L_A7CF		;a42f
	ld a,(ix+000h)		;a432
	cp 017h		;a435
	jr nz,L_A441		;a437
	ld (ix+025h),020h		;a439
	ld (ix+027h),010h		;a43d
L_A441:
	call L_A51C		;a441
L_A444:
	inc (ix+001h)		;a444
	ret			;a447
L_A448:
	call 08100h		;a448
	jr nz,L_A469		;a44b
	ld a,(0cb05h)		;a44d
	sub (ix+005h)		;a450
	jr nc,L_A457		;a453
	neg		;a455
L_A457:
	cp b			;a457
	ret nc			;a458
	ld a,010h		;a459
	add a,b			;a45b
	ld b,a			;a45c
	ld a,(0cb03h)		;a45d
	sub (ix+003h)		;a460
	jr nc,L_A467		;a463
	neg		;a465
L_A467:
	cp b			;a467
	ret			;a468
L_A469:
	or a			;a469
	ret			;a46a
L_A46B:
	ld a,(ix+000h)		;a46b
	cp 017h		;a46e
	jr z,L_A499		;a470
	ld a,(ix+00eh)		;a472
	cp 020h		;a475
	jr nz,L_A499		;a477
	ld b,030h		;a479
	call L_A448		;a47b
	jr c,L_A499		;a47e
	dec (ix+029h)		;a480
	jr nz,L_A499		;a483
	ld a,(0d43fh)		;a485
	and a			;a488
	ret nz			;a489
	ld hl,0ce41h		;a48a
	inc (hl)			;a48d
	ld a,020h		;a48e
	ld (ix+023h),a		;a490
	ld (0ce63h),a		;a493
	jp L_A444		;a496
L_A499:
	ld a,(0ca03h)		;a499   ; lee el contador de cuadros (uno mas en cada interrupcion)
	ld b,a			;a49c
	ld a,(ix+000h)		;a49d
	cp 017h		;a4a0
	jr z,L_A4BF		;a4a2
	call L_A567		;a4a4
	ld a,(ix+001h)		;a4a7
	dec a			;a4aa
	ld c,004h		;a4ab
	jr z,L_A4B1		;a4ad
	ld c,002h		;a4af
L_A4B1:
	ld a,b			;a4b1
	and c			;a4b2
	jr nz,L_A4BF		;a4b3
	call 0902eh		;a4b5
	ld a,(0ca4bh)		;a4b8   ; lee la sala de la zona
	and a			;a4bb
	call nz,L_A55A		;a4bc
L_A4BF:
	rr b		;a4bf
	ret c			;a4c1
	ld a,(ix+00eh)		;a4c2
	ld hl,0bf7dh		;a4c5
	call 0423eh		;a4c8   ; suma_a_hl: HL = HL + A
	ld a,(hl)			;a4cb
	srl a		;a4cc
	ld b,a			;a4ce
	ld a,(ix+00fh)		;a4cf
	and 003h		;a4d2
	ld c,a			;a4d4
	cp 002h		;a4d5
	ld a,b			;a4d7
	jr nc,L_A4DC		;a4d8
	neg		;a4da
L_A4DC:
	add a,(ix+012h)		;a4dc
	ld (ix+003h),a		;a4df
	ld hl,0bf7dh		;a4e2
	ld a,03fh		;a4e5
	sub (ix+00eh)		;a4e7
	call 0423eh		;a4ea   ; suma_a_hl: HL = HL + A
	ld a,(hl)			;a4ed
	srl a		;a4ee
	ld b,a			;a4f0
	ld a,c			;a4f1
	dec a			;a4f2
	cp 002h		;a4f3
	ld a,b			;a4f5
	jr c,L_A4FA		;a4f6
	neg		;a4f8
L_A4FA:
	add a,(ix+013h)		;a4fa
	ld (ix+005h),a		;a4fd
	ld a,c			;a500
	rra			;a501
	jr c,L_A510		;a502
	inc (ix+00eh)		;a504
	ld a,(ix+00eh)		;a507
	cp 03fh		;a50a
	jr c,L_A518		;a50c
	jr L_A515		;a50e
L_A510:
	dec (ix+00eh)		;a510
	jr nz,L_A518		;a513
L_A515:
	inc (ix+00fh)		;a515
L_A518:
	call 080e6h		;a518   ; p04:80E6
	ret c			;a51b
L_A51C:
	ld a,(ix+00ah)		;a51c
	cp 004h		;a51f
	ld b,000h		;a521
	ld a,(ix+00bh)		;a523
	jr nc,L_A530		;a526
	ld b,002h		;a528
	cp 007h		;a52a
	jr nc,L_A535		;a52c
	jr L_A534		;a52e
L_A530:
	cp 007h		;a530
	jr c,L_A535		;a532
L_A534:
	inc b			;a534
L_A535:
	ld (ix+022h),b		;a535
	ld a,b			;a538
	and 003h		;a539
	add a,a			;a53b
	ld hl,0a552h		;a53c
	call 0423eh		;a53f   ; suma_a_hl: HL = HL + A
	ld a,(hl)			;a542
	add a,(ix+025h)		;a543
	ld (ix+012h),a		;a546
	inc hl			;a549
	ld a,(hl)			;a54a
	add a,(ix+027h)		;a54b
	ld (ix+013h),a		;a54e
	ret			;a551

; ----------------------------------------------------------------------
; DATOS resto_A552: lo apuntan con el banco puesto p08:A53C (0xA552); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p08:A53C (8 bytes)
;   0xa552..0xa55a  (8 bytes)
DATA_resto_A552:
	defb 09fh,098h,09fh,0e9h,0f0h,0e9h,0f0h,098h	; a552  ........

; ======================================================================
; CODIGO 0xa55a..0xa610  (182 bytes)
; ======================================================================


L_A55A:
	dec c			;a55a
	ld a,b			;a55b
	and c			;a55c
	ret nz			;a55d
	call 08100h		;a55e
	jp nz,06c7bh		;a561   ; p01:6C7B
	jp 06b02h		;a564   ; p01:6B02
L_A567:
	ld a,(ix+00eh)		;a567
	cp 020h		;a56a
	jr c,L_A57B		;a56c
	ld c,004h		;a56e
	ld a,(ix+00ah)		;a570
	cp 004h		;a573
	jr z,L_A586		;a575
	ld c,006h		;a577
	jr L_A586		;a579
L_A57B:
	ld c,000h		;a57b
	ld a,(ix+00bh)		;a57d
	cp 006h		;a580
	jr z,L_A586		;a582
	ld c,002h		;a584
L_A586:
	ld (ix+00dh),c		;a586
	ret			;a589
L_A58A:
	dec (ix+023h)		;a58a
	jr z,L_A5A9		;a58d
	ld a,(ix+000h)		;a58f
	cp 017h		;a592
	jp z,L_A5FB		;a594
	inc (ix+025h)		;a597
	ld a,(ix+023h)		;a59a
	rra			;a59d
	jr nc,L_A5A3		;a59e
	inc (ix+027h)		;a5a0
L_A5A3:
	call L_A51C		;a5a3
	jp L_A499		;a5a6
L_A5A9:
	call L_A444		;a5a9
	ld (ix+023h),000h		;a5ac
L_A5B0:
	call 08100h		;a5b0
	call z,06b4dh		;a5b3   ; p01:6B4D
	ld a,(ix+000h)		;a5b6
	cp 017h		;a5b9
	jr z,L_A5E9		;a5bb
	ld (ix+00ch),003h		;a5bd
	call 04256h		;a5c1   ; azar: A = un numero al azar (0xCA03 rotado mas R)
	and 003h		;a5c4
	ld b,a			;a5c6
	ld hl,0a610h		;a5c7
	call 043f6h		;a5ca   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld (ix+007h),l		;a5cd
	ld (ix+009h),h		;a5d0
	xor a			;a5d3
	ld (ix+006h),a		;a5d4
	ld (ix+008h),a		;a5d7
	ld a,b			;a5da
L_A5DB:
	ld (ix+01dh),a		;a5db
	add a,a			;a5de
	add a,008h		;a5df
	ld (ix+00dh),a		;a5e1
	ld (ix+028h),010h		;a5e4
	ret			;a5e8
L_A5E9:
	ld (ix+000h),000h		;a5e9
	ld a,(ix+02eh)		;a5ed
	add a,a			;a5f0
	add a,a			;a5f1
	ld hl,0dc24h		;a5f2
	call 0423eh		;a5f5   ; suma_a_hl: HL = HL + A
	ld (hl),0e0h		;a5f8
	ret			;a5fa
L_A5FB:
	ld a,(ix+023h)		;a5fb
	ld b,000h		;a5fe
	cp 016h		;a600
	jr nc,L_A60A		;a602
	cp 00ch		;a604
	inc b			;a606
	jr nc,L_A60A		;a607
	inc b			;a609
L_A60A:
	ld (ix+00dh),b		;a60a
	jp L_A499		;a60d

; ----------------------------------------------------------------------
; DATOS resto_A610: lo apuntan con el banco puesto p08:A5C7 (0xA610); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p08:A5C7 (8 bytes)
;   0xa610..0xa618  (8 bytes)
DATA_resto_A610:
	defb 0ffh,000h,001h,000h,000h,0ffh,000h,001h	; a610  ........

; ======================================================================
; CODIGO 0xa618..0xa8d9  (705 bytes)
; ======================================================================


L_A618:
	ld a,(ix+000h)		;a618
	cp 017h		;a61b
	jp z,L_A444		;a61d
	ld a,(0d43fh)		;a620
	and a			;a623
	jr nz,L_A6A0		;a624
	dec (ix+023h)		;a626
	jr z,L_A6A0		;a629
	ld a,(0cab6h)		;a62b
	and a			;a62e
	jr nz,L_A638		;a62f
	ld a,(0cb21h)		;a631
	cp 021h		;a634
	jr z,L_A63F		;a636
L_A638:
	ld b,020h		;a638
	call L_A448		;a63a
	jr c,L_A6A0		;a63d
L_A63F:
	ld a,(ix+007h)		;a63f
	and a			;a642
	jr nz,L_A64D		;a643
	ld c,(ix+005h)		;a645
	ld de,020a0h		;a648
	jr L_A667		;a64b
L_A64D:
	ld a,(ix+00bh)		;a64d
	cp 007h		;a650
	ld de,038b0h		;a652
	ld c,(ix+003h)		;a655
	jr nz,L_A667		;a658
	ld a,(ix+00ah)		;a65a
	cp 003h		;a65d
	ld de,06050h		;a65f
	jr z,L_A667		;a662
	ld de,03860h		;a664
L_A667:
	ld a,c			;a667
	sub d			;a668
	cp e			;a669
	jr nc,L_A690		;a66a
	call 08100h		;a66c
	jr nz,L_A681		;a66f
	call 090c8h		;a671   ; p04:90C8
	ld a,(ix+007h)		;a674
	and a			;a677
	ld a,003h		;a678
	jr nz,L_A67E		;a67a
	ld a,00ch		;a67c
L_A67E:
	and c			;a67e
	jr nz,L_A690		;a67f
L_A681:
	dec (ix+028h)		;a681
	jp z,L_A5B0		;a684
	ld a,(ix+028h)		;a687
	and 003h		;a68a
	ret nz			;a68c
	jp 0902eh		;a68d
L_A690:
	call 0808bh		;a690   ; p04:808B
	ld (ix+028h),008h		;a693
	ld a,(ix+01dh)		;a697
	rra			;a69a
	ccf			;a69b
	rla			;a69c
	jp L_A5DB		;a69d
L_A6A0:
	ld iy,0ce40h		;a6a0
	ld (iy+000h),017h		;a6a4
	ld (iy+001h),003h		;a6a8
	ld a,(ix+003h)		;a6ac
	ld b,(iy+003h)		;a6af
	ld (iy+003h),a		;a6b2
	sub b			;a6b5
	add a,020h		;a6b6
	ld (iy+025h),a		;a6b8
	ld (ix+025h),a		;a6bb
	ld a,(ix+005h)		;a6be
	ld c,(iy+005h)		;a6c1
	ld (iy+005h),a		;a6c4
	sub c			;a6c7
	add a,010h		;a6c8
	ld (iy+027h),a		;a6ca
	ld (ix+027h),a		;a6cd
	ld a,002h		;a6d0
	ld (iy+00dh),a		;a6d2
	ld a,(ix+00eh)		;a6d5
	ld (iy+00eh),a		;a6d8
	ld a,(ix+00fh)		;a6db
	ld (iy+00fh),a		;a6de
	ld a,(ix+00ah)		;a6e1
	ld (iy+00ah),a		;a6e4
	ld a,(ix+00bh)		;a6e7
	ld (iy+00bh),a		;a6ea
	xor a			;a6ed
	ld (ix+00ch),a		;a6ee
	ld a,(iy+02eh)		;a6f1
	and a			;a6f4
	jr nz,L_A70B		;a6f5
	ld (iy+02eh),003h		;a6f7
	ld a,001h		;a6fb
	ld (0d402h),a		;a6fd
	ld hl,0dac0h		;a700
	ld bc,0000fh		;a703
	ld a,00fh		;a706
	call 04237h		;a708   ; llena_bloque: pone A en BC + 1 bytes desde HL
L_A70B:
	jp L_A444		;a70b
L_A70E:
	ld a,(ix+000h)		;a70e
	cp 016h		;a711
	ld bc,00000h		;a713
	jr z,L_A71B		;a716
	ld bc,02010h		;a718
L_A71B:
	ld a,(ix+025h)		;a71b
	sub b			;a71e
	push bc			;a71f
	call L_A742		;a720
	pop bc			;a723
	ld (ix+007h),d		;a724
	ld (ix+006h),e		;a727
	ld a,(ix+027h)		;a72a
	sub c			;a72d
	call L_A742		;a72e
	ld (ix+009h),d		;a731
	ld (ix+008h),e		;a734
	ld (ix+023h),020h		;a737
	ld (ix+00ch),000h		;a73b
	jp L_A444		;a73f
L_A742:
	ld b,005h		;a742
	ld de,00000h		;a744
	and a			;a747
	ret z			;a748
	ld c,e			;a749
	bit 7,a		;a74a
	jr z,L_A752		;a74c
	neg		;a74e
	ld c,001h		;a750
L_A752:
	ld d,a			;a752
L_A753:
	srl d		;a753
	rr e		;a755
	djnz L_A753		;a757
	ld a,c			;a759
	and a			;a75a
	call z,04442h		;a75b   ; de_negativo: DE = -DE
	ret			;a75e
L_A75F:
	dec (ix+023h)		;a75f
	jr z,L_A7B1		;a762
	ld a,(ix+000h)		;a764
	cp 017h		;a767
	jr z,L_A774		;a769
	ld a,(0ca03h)		;a76b   ; lee el contador de cuadros (uno mas en cada interrupcion)
	rra			;a76e
	call c,0902eh		;a76f   ; p04:902E
	jr L_A786		;a772
L_A774:
	ld a,(ix+023h)		;a774
	ld b,002h		;a777
	cp 016h		;a779
	jr nc,L_A783		;a77b
	cp 00ch		;a77d
	dec b			;a77f
	jr nc,L_A783		;a780
	dec b			;a782
L_A783:
	ld (ix+00dh),b		;a783
L_A786:
	call L_A5A3		;a786
	ld l,(ix+024h)		;a789
	ld h,(ix+025h)		;a78c
	ld e,(ix+006h)		;a78f
	ld d,(ix+007h)		;a792
	add hl,de			;a795
	ld (ix+024h),l		;a796
	ld (ix+025h),h		;a799
	ex de,hl			;a79c
	ld l,(ix+026h)		;a79d
	ld h,(ix+027h)		;a7a0
	ld c,(ix+008h)		;a7a3
	ld b,(ix+009h)		;a7a6
	add hl,bc			;a7a9
	ld (ix+026h),l		;a7aa
	ld (ix+027h),h		;a7ad
	ret			;a7b0
L_A7B1:
	ld a,(ix+000h)		;a7b1
	cp 016h		;a7b4
	ld bc,00000h		;a7b6
	jr z,L_A7BE		;a7b9
	ld bc,02010h		;a7bb
L_A7BE:
	xor a			;a7be
	ld (ix+025h),b		;a7bf
	ld (ix+024h),a		;a7c2
	ld (ix+027h),c		;a7c5
	ld (ix+026h),a		;a7c8
	ld (ix+001h),001h		;a7cb
L_A7CF:
	call 04256h		;a7cf   ; azar: A = un numero al azar (0xCA03 rotado mas R)
	and 003h		;a7d2
	add a,002h		;a7d4
	ld (ix+029h),a		;a7d6
	ret			;a7d9
L_A7DA:
	ld a,(0ca76h)		;a7da   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 039h		;a7dd
	ret nz			;a7df
	ld hl,0d43bh		;a7e0
	ld a,(0ca4bh)		;a7e3   ; lee la sala de la zona
	dec a			;a7e6
	ret nz			;a7e7
	ld (hl),001h		;a7e8
	ret			;a7ea
L_A7EB:
	ld ix,0ce00h		;a7eb
	ld b,018h		;a7ef
L_A7F1:
	ld a,(ix+000h)		;a7f1
	cp 012h		;a7f4
	jr nz,L_A7FE		;a7f6
	call 08100h		;a7f8
	jp z,06a8bh		;a7fb
L_A7FE:
	ld de,00040h		;a7fe
	add ix,de		;a801
	djnz L_A7F1		;a803
	ret			;a805
L_A806:
	ld a,(0ca4bh)		;a806   ; lee la sala de la zona
	and a			;a809
	ret nz			;a80a
	ld a,(0cab6h)		;a80b
	and a			;a80e
	ret nz			;a80f
	ld a,(0cb31h)		;a810
	and a			;a813
	ret nz			;a814
	ld a,(0cb21h)		;a815
	cp 022h		;a818
	ret nz			;a81a
	ld hl,0d43bh		;a81b
	ld a,(hl)			;a81e
	dec a			;a81f
	ret nz			;a820
	inc (hl)			;a821
	xor a			;a822
	ld (0d44ch),a		;a823
	ld (0d44dh),a		;a826
	ld (0d44eh),a		;a829
	ld hl,0ce00h		;a82c
	ld b,018h		;a82f
L_A831:
	ld a,(hl)			;a831
	cp 012h		;a832
	jr nz,L_A83A		;a834
	inc hl			;a836
	ld (hl),004h		;a837
	dec hl			;a839
L_A83A:
	ld a,040h		;a83a
	call 0423eh		;a83c   ; suma_a_hl: HL = HL + A
	djnz L_A831		;a83f
	ret			;a841
L_A842:
	ld a,(0ca76h)		;a842   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 039h		;a845
	ret nz			;a847
	call L_A7EB		;a848
	ld a,(0d43bh)		;a84b
	and a			;a84e
	ret z			;a84f
	ld a,(0ca4bh)		;a850   ; lee la sala de la zona
	and a			;a853
	ret nz			;a854
	ld a,(0cb31h)		;a855
	and a			;a858
	ret nz			;a859
	call L_A8BB		;a85a
	ld a,(0d44ch)		;a85d
	cp 00bh		;a860
	ret c			;a862
	ld hl,0d44dh		;a863
	inc (hl)			;a866
	ld a,(hl)			;a867
	cp 010h		;a868
	ret c			;a86a
	ld (hl),000h		;a86b
	inc hl			;a86d
	ld a,(hl)			;a86e
	cp 00bh		;a86f
	ret nc			;a871
	inc (hl)			;a872
	ld l,a			;a873
	ld h,000h		;a874
	add hl,hl			;a876
	add hl,hl			;a877
	add hl,hl			;a878
	add hl,hl			;a879
	add hl,hl			;a87a
	add hl,hl			;a87b
	ex de,hl			;a87c
	ld ix,0ce00h		;a87d
	add ix,de		;a881
	ld (ix+001h),008h		;a883
	dec (ix+00ah)		;a887
	ld (ix+003h),04ch		;a88a
	ld (ix+005h),060h		;a88e
	xor a			;a892
	ld (ix+006h),a		;a893
	ld (ix+007h),003h		;a896
	ld (ix+008h),a		;a89a
	ld (ix+009h),a		;a89d
	ld (ix+00ch),003h		;a8a0
	ld (ix+020h),048h		;a8a4
	ld (ix+021h),030h		;a8a8
	call 081c5h		;a8ac
	ld bc,0100fh		;a8af
L_A8B2:
	call 04256h		;a8b2   ; azar: A = un numero al azar (0xCA03 rotado mas R)
	and c			;a8b5
	add a,b			;a8b6
	ld (ix+00eh),a		;a8b7
	ret			;a8ba
L_A8BB:
	ld hl,0ce00h		;a8bb
	ld b,018h		;a8be
L_A8C0:
	ld a,(hl)			;a8c0
	and a			;a8c1
	ret nz			;a8c2
	ld a,040h		;a8c3
	call 0423eh		;a8c5   ; suma_a_hl: HL = HL + A
	djnz L_A8C0		;a8c8
	ld hl,0d7d9h		;a8ca
	res 6,(hl)		;a8cd
	ret			;a8cf
L_A8D0:
	call L_A806		;a8d0
	ld a,(ix+001h)		;a8d3
	call 0424dh		;a8d6   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_A8D9: 9 destinos del despachador p00:424D (call en p08:A8D6, el
;   indice en A): A937, A991, A9F5, A90C, A8EB, A90D, A927, A90C, A9F5; lo
;   leen p08:A8D6 (18 bytes)
;   0xa8d9..0xa8eb  (18 bytes)
DATA_tabla_A8D9:
	defw 0a937h,0a991h,0a9f5h,0a90ch,0a8ebh,0a90dh,0a927h,0a90ch	; a8d9
	defw 0a9f5h	; a8e9  -> L_A9F5

; ======================================================================
; CODIGO 0xa8eb..0xaa52  (359 bytes)
; ======================================================================


L_A8EB:
	ld a,(ix+005h)		;a8eb
	cp 060h		;a8ee
	ld de,00400h		;a8f0
	ld b,006h		;a8f3
	jr c,L_A8FC		;a8f5
	call 04442h		;a8f7   ; de_negativo: DE = -DE
	ld b,004h		;a8fa
L_A8FC:
	ld (ix+009h),d		;a8fc
	ld (ix+008h),e		;a8ff
	ld (ix+00dh),b		;a902
	ld (ix+00ch),002h		;a905
L_A909:
	inc (ix+001h)		;a909
L_A90C:
	ret			;a90c
L_A90D:
	ld a,(ix+005h)		;a90d
	sub 05ch		;a910
	cp 008h		;a912
	ret nc			;a914
	ld (ix+007h),004h		;a915
	ld (ix+006h),000h		;a919
	ld (ix+00dh),002h		;a91d
	ld (ix+00ch),001h		;a921
	jr L_A909		;a925
L_A927:
	ld a,(ix+003h)		;a927
	cp 0b8h		;a92a
	ret c			;a92c
	ld (ix+00ch),000h		;a92d
	ld hl,0d44ch		;a931
	inc (hl)			;a934
	jr L_A909		;a935
L_A937:
	inc (ix+001h)		;a937
	ld a,(ix+003h)		;a93a
	sub 010h		;a93d
	ld (ix+020h),a		;a93f
	ld a,(ix+005h)		;a942
	sub 014h		;a945
	ld (ix+021h),a		;a947
L_A94A:
	call 04256h		;a94a   ; azar: A = un numero al azar (0xCA03 rotado mas R)
	and 006h		;a94d
	ld (ix+00dh),a		;a94f
	srl a		;a952
	ld c,a			;a954
	rra			;a955
	ld hl,00180h		;a956
	call nc,0443ah		;a959   ; hl_negativo: HL = -HL (PR2 p00:5BBD)
	ld (ix+019h),001h		;a95c
	call 04256h		;a960   ; azar: A = un numero al azar (0xCA03 rotado mas R)
	rra			;a963
	jr c,L_A967		;a964
	add hl,hl			;a966
L_A967:
	call L_A97B		;a967
	ld (ix+00ch),003h		;a96a
	ld bc,00407h		;a96e
	call L_A8B2		;a971
L_A974:
	ld a,(ix+019h)		;a974
	ld (ix+018h),a		;a977
	ret			;a97a
L_A97B:
	ld de,00000h		;a97b
	ld a,c			;a97e
	cp 002h		;a97f
	jr c,L_A984		;a981
	ex de,hl			;a983
L_A984:
	ld (ix+006h),l		;a984
	ld (ix+007h),h		;a987
	ld (ix+008h),e		;a98a
	ld (ix+009h),d		;a98d
	ret			;a990
L_A991:
	call 08100h		;a991
	jr nz,L_A9AE		;a994
	ld a,(0cb03h)		;a996
	sub 020h		;a999
	cp 070h		;a99b
	jp c,L_A9FC		;a99d
	ld a,(0cab6h)		;a9a0
	and a			;a9a3
	jr nz,L_A9AE		;a9a4
	ld a,(0cb21h)		;a9a6
	cp 022h		;a9a9
	jp z,L_A9FC		;a9ab
L_A9AE:
	call L_A9EB		;a9ae
	ld bc,02028h		;a9b1
	ld a,(ix+007h)		;a9b4
	or (ix+006h)		;a9b7
	jr z,L_A9C7		;a9ba
	ld a,(ix+003h)		;a9bc
	sub (ix+020h)		;a9bf
	cp b			;a9c2
	jr nc,L_A9D7		;a9c3
	jr L_A9D0		;a9c5
L_A9C7:
	ld a,(ix+005h)		;a9c7
	sub (ix+021h)		;a9ca
	cp c			;a9cd
	jr nc,L_A9D7		;a9ce
L_A9D0:
	dec (ix+00eh)		;a9d0
	ret nz			;a9d3
	jp L_A94A		;a9d4
L_A9D7:
	call 0808bh		;a9d7
	ld a,(ix+00dh)		;a9da
	rra			;a9dd
	rra			;a9de
	ccf			;a9df
	rla			;a9e0
	rla			;a9e1
	ld (ix+00dh),a		;a9e2
	ld bc,00407h		;a9e5
	jp L_A8B2		;a9e8
L_A9EB:
	dec (ix+018h)		;a9eb
	ret nz			;a9ee
	call L_A974		;a9ef
L_A9F2:
	jp 0902eh		;a9f2
L_A9F5:
	dec (ix+00eh)		;a9f5
	jr nz,L_A9F2		;a9f8
	jr L_AA07		;a9fa
L_A9FC:
	push ix		;a9fc
	pop hl			;a9fe
	ld a,l			;a9ff
	and a			;aa00
	jp nz,L_A9AE		;aa01
	inc (ix+001h)		;aa04
L_AA07:
	call L_AA24		;aa07
	ld (ix+00eh),004h		;aa0a
	ld (ix+018h),001h		;aa0e
	ld a,(ix+00dh)		;aa12
	and 007h		;aa15
	srl a		;aa17
	ld c,a			;aa19
	ld hl,00400h		;aa1a
	rra			;aa1d
	call nc,0443ah		;aa1e   ; hl_negativo: HL = -HL (PR2 p00:5BBD)
	jp L_A97B		;aa21
L_AA24:
	call 090a9h		;aa24   ; p04:90A9
	call 0908ch		;aa27   ; p04:908C
	and b			;aa2a
	ld bc,00400h		;aa2b
L_AA2E:
	rra			;aa2e
	jr c,L_AA37		;aa2f
	inc c			;aa31
	inc c			;aa32
	djnz L_AA2E		;aa33
	ld c,002h		;aa35
L_AA37:
	ld (ix+00dh),c		;aa37
	ret			;aa3a
L_AA3B:
	ld a,(ix+021h)		;aa3b
	and a			;aa3e
	jr z,L_AA44		;aa3f
	dec (ix+021h)		;aa41
L_AA44:
	ld a,(ix+011h)		;aa44
	cp 010h		;aa47
	jp nc,L_AAA4		;aa49
	ld a,(ix+001h)		;aa4c
	call 0424dh		;aa4f   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_AA52: 2 destinos del despachador p00:424D (call en p08:AA4F, el
;   indice en A): AA56, AA75; lo leen p08:AA4F (4 bytes)
;   0xaa52..0xaa56  (4 bytes)
DATA_tabla_AA52:
	defw 0aa56h,0aa75h	; aa52  -> L_AA56 L_AA75

; ======================================================================
; CODIGO 0xaa56..0xaaaf  (89 bytes)
; ======================================================================


L_AA56:
	call L_AA6C		;aa56
	call L_AAE9		;aa59
	inc hl			;aa5c
	call 08e65h		;aa5d
	xor a			;aa60
	ld a,(ix+021h)		;aa61
	inc a			;aa64
	ld (ix+00fh),a		;aa65
L_AA68:
	inc (ix+001h)		;aa68
	ret			;aa6b
L_AA6C:
	ld a,(ix+011h)		;aa6c
	ld hl,0b976h		;aa6f
	jp 043f6h		;aa72   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
L_AA75:
	call 08e82h		;aa75
	jr c,L_AA82		;aa78
	ld a,(0ca03h)		;aa7a   ; lee el contador de cuadros (uno mas en cada interrupcion)
	rra			;aa7d
	ret c			;aa7e
	jp 0902eh		;aa7f
L_AA82:
	call L_AA6C		;aa82
	ld a,(ix+00fh)		;aa85
	ld b,a			;aa88
	inc (ix+00fh)		;aa89
	add a,a			;aa8c
	add a,b			;aa8d
	call 0423eh		;aa8e   ; suma_a_hl: HL = HL + A
	ld a,(hl)			;aa91
	inc a			;aa92
	call z,L_AA9D		;aa93
	call L_AAE9		;aa96
	inc hl			;aa99
	jp 08e65h		;aa9a
L_AA9D:
	ld (ix+00fh),001h		;aa9d
	jp L_AA6C		;aaa1
L_AAA4:
	call 08100h		;aaa4
	jr nz,$+14		;aaa7
	ld a,(ix+001h)		;aaa9
	call 0424dh		;aaac   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_AAAF: 3 destinos del despachador p00:424D (call en p08:AAAC, el
;   indice en A): AABA, AB09, AB74; lo leen p08:AAAC (6 bytes)
;   0xaaaf..0xaab5  (6 bytes)
DATA_tabla_AAAF:
	defw 0aabah,0ab09h,0ab74h	; aaaf  -> L_AABA L_AB09 L_AB74

; ======================================================================
; CODIGO 0xaab5..0xaaf9  (68 bytes)
; ======================================================================


L_AAB5:
	ld (ix+00ch),000h		;aab5
	ret			;aab9
L_AABA:
	call 090c8h		;aaba
	call 04256h		;aabd   ; azar: A = un numero al azar (0xCA03 rotado mas R)
	rra			;aac0
	and 003h		;aac1
L_AAC3:
	call L_AAE1		;aac3
	jr nc,L_AACD		;aac6
	inc a			;aac8
	and 003h		;aac9
	jr L_AAC3		;aacb
L_AACD:
	call L_AAEC		;aacd
	call 04256h		;aad0   ; azar: A = un numero al azar (0xCA03 rotado mas R)
	res 7,a		;aad3
	set 6,a		;aad5
	ld (ix+00eh),a		;aad7
	xor a			;aada
	ld a,(ix+021h)		;aadb
	jp L_AA68		;aade
L_AAE1:
	ld d,c			;aae1
	ld b,a			;aae2
	inc b			;aae3
L_AAE4:
	rr d		;aae4
	djnz L_AAE4		;aae6
	ret			;aae8
L_AAE9:
	ld a,(hl)			;aae9
	and 003h		;aaea
L_AAEC:
	ld c,a			;aaec
	ld de,0aaf9h		;aaed
	call 08e40h		;aaf0
	ld a,c			;aaf3
	add a,a			;aaf4
	ld (ix+00dh),a		;aaf5
	ret			;aaf8

; ----------------------------------------------------------------------
; DATOS resto_AAF9: lo apuntan con el banco puesto p08:AAED (0xAAF9); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p08:AAED (16 bytes)
;   0xaaf9..0xab09  (16 bytes)
DATA_resto_AAF9:
	defb 0e0h,0feh,000h,000h,020h,001h,000h,000h,000h,000h,0e0h,0feh,000h,000h,020h,001h	; aaf9  .... ......... .

; ======================================================================
; CODIGO 0xab09..0xab88  (127 bytes)
; ======================================================================


L_AB09:
	call 090c8h		;ab09
	ld a,(ix+00ch)		;ab0c
	rra			;ab0f
	ld a,003h		;ab10
	jr c,L_AB16		;ab12
	ld a,00ch		;ab14
L_AB16:
	and c			;ab16
	jr nz,L_AB39		;ab17
	ld a,(ix+003h)		;ab19
	sub 020h		;ab1c
	cp 0a0h		;ab1e
	jr nc,L_AB50		;ab20
	ld a,(ix+005h)		;ab22
	sub 008h		;ab25
	cp 0b0h		;ab27
	jr nc,L_AB55		;ab29
	dec (ix+00eh)		;ab2b
	jr z,L_AB39		;ab2e
	ld a,(0ca03h)		;ab30   ; lee el contador de cuadros (uno mas en cada interrupcion)
	and 007h		;ab33
	ret nz			;ab35
	jp 0902eh		;ab36
L_AB39:
	call 04256h		;ab39   ; azar: A = un numero al azar (0xCA03 rotado mas R)
	srl a		;ab3c
	srl a		;ab3e
	cp 010h		;ab40
	jr nc,L_AB46		;ab42
	ld a,010h		;ab44
L_AB46:
	ld (ix+00eh),a		;ab46
	ld (ix+00ch),000h		;ab49
	jp L_AA68		;ab4d
L_AB50:
	call 0809eh		;ab50
	jr L_AB58		;ab53
L_AB55:
	call 0808eh		;ab55
L_AB58:
	call 04256h		;ab58   ; azar: A = un numero al azar (0xCA03 rotado mas R)
	srl a		;ab5b
	srl a		;ab5d
	cp 010h		;ab5f
	jr nc,L_AB65		;ab61
	ld a,010h		;ab63
L_AB65:
	ld (ix+00eh),a		;ab65
	ld a,(ix+00dh)		;ab68
	rra			;ab6b
	rra			;ab6c
	ccf			;ab6d
	rla			;ab6e
	rla			;ab6f
	ld (ix+00dh),a		;ab70
	ret			;ab73
L_AB74:
	dec (ix+00eh)		;ab74
	ret nz			;ab77
	ld (ix+001h),000h		;ab78
	ret			;ab7c
L_AB7D:
	ld ix,(0d435h)		;ab7d
	ld a,(0d434h)		;ab81
	dec a			;ab84
	call 0424dh		;ab85   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_AB88: 3 destinos del despachador p00:424D (call en p08:AB85, el
;   indice en A): AB8E, ABA4, ABAA; lo leen p08:AB85 (6 bytes)
;   0xab88..0xab8e  (6 bytes)
DATA_tabla_AB88:
	defw 0ab8eh,0aba4h,0abaah	; ab88  -> L_AB8E L_ABA4 L_ABAA

; ======================================================================
; CODIGO 0xab8e..0xacdb  (333 bytes)
; ======================================================================


L_AB8E:
	ld a,(ix+00dh)		;ab8e
	ld (ix+015h),a		;ab91
	ld a,(ix+000h)		;ab94
	cp 016h		;ab97
	call nz,L_ABBD		;ab99
	call 06211h		;ab9c   ; p01:6211
L_AB9F:
	ld hl,0d434h		;ab9f
	inc (hl)			;aba2
	ret			;aba3
L_ABA4:
	call 0620bh		;aba4   ; p01:620B
	ret nz			;aba7
	jr L_AB9F		;aba8
L_ABAA:
	ld a,(0ca07h)		;abaa   ; lee lo recien pulsado del mando (los bits de 0xCA08 que no estaban)
	and a			;abad
	ret z			;abae
	call 07a2dh		;abaf   ; p01:7A2D
	ld a,(ix+015h)		;abb2
	ld (ix+00dh),a		;abb5
	xor a			;abb8
	ld (0d434h),a		;abb9
	ret			;abbc
L_ABBD:
	ld bc,00202h		;abbd
	ld a,(0cb03h)		;abc0
	sub (ix+003h)		;abc3
	jr nc,L_ABCC		;abc6
	ld b,000h		;abc8
	neg		;abca
L_ABCC:
	ld d,a			;abcc
	ld a,(0cb05h)		;abcd
	sub (ix+005h)		;abd0
	jr nc,L_ABD9		;abd3
	ld c,000h		;abd5
	neg		;abd7
L_ABD9:
	cp d			;abd9
	ld a,004h		;abda
	jr nc,L_ABE0		;abdc
	xor a			;abde
	ld c,b			;abdf
L_ABE0:
	add a,c			;abe0
	ld (ix+00dh),a		;abe1
	ret			;abe4
L_ABE5:
	ld a,(0ca5fh)		;abe5
	and a			;abe8
	ret nz			;abe9
	ld hl,0cfc0h		;abea
	inc l			;abed
	ld a,(hl)			;abee
	sub 008h		;abef
	cp 008h		;abf1
	ret c			;abf3
	ld a,002h		;abf4
	add a,l			;abf6
	ld l,a			;abf7
	ld a,(hl)			;abf8
	ld (ix+003h),a		;abf9
	inc hl			;abfc
	inc hl			;abfd
	ld a,(hl)			;abfe
	add a,010h		;abff
	cp 0b8h		;ac01
	jr c,L_AC07		;ac03
	ld a,0b8h		;ac05
L_AC07:
	ld (ix+005h),a		;ac07
	ld a,005h		;ac0a
	add a,l			;ac0c
	ld l,a			;ac0d
	ld a,(hl)			;ac0e
	ld (ix+00ah),a		;ac0f
	inc hl			;ac12
	ld a,(hl)			;ac13
	ld (ix+00bh),a		;ac14
	call 08100h		;ac17
	jr nz,L_AC24		;ac1a
	ld a,(ix+02eh)		;ac1c
	and a			;ac1f
	ret nz			;ac20
	jp 081c5h		;ac21
L_AC24:
	call 08273h		;ac24
	jp 080f3h		;ac27
L_AC2A:
	call 08100h		;ac2a
	jr nz,L_AC32		;ac2d
	call 06adah		;ac2f   ; p01:6ADA
L_AC32:
	ld a,(ix+001h)		;ac32
	cp 001h		;ac35
	jr z,L_AC41		;ac37
	jr nc,L_ACA5		;ac39
	ld (ix+00fh),000h		;ac3b
	jr L_ACA1		;ac3f
L_AC41:
	ld a,(ix+020h)		;ac41
	and a			;ac44
	jr z,L_AC4D		;ac45
	call 08100h		;ac47
	call z,06c73h		;ac4a   ; p01:6C73
L_AC4D:
	ld a,(ix+011h)		;ac4d
	ld hl,0ace3h		;ac50
	call 043f6h		;ac53   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld a,(ix+00fh)		;ac56
	ld b,a			;ac59
	add a,a			;ac5a
	add a,b			;ac5b
	call 0423eh		;ac5c   ; suma_a_hl: HL = HL + A
	ld a,(hl)			;ac5f
	cp 0ffh		;ac60
	jr nz,L_AC6A		;ac62
	ld (ix+00fh),000h		;ac64
	jr L_AC41		;ac68
L_AC6A:
	ld a,(hl)			;ac6a
	and 07fh		;ac6b
	ld (ix+01dh),a		;ac6d
	ld a,(hl)			;ac70
	rla			;ac71
	ld a,001h		;ac72
	jr c,L_AC77		;ac74
	xor a			;ac76
L_AC77:
	ld (ix+020h),a		;ac77
	inc hl			;ac7a
	ld a,(ix+01dh)		;ac7b
	push af			;ac7e
	call 08e65h		;ac7f   ; p04:8E65
	pop af			;ac82
	ld hl,0acdbh		;ac83
	call 043f6h		;ac86   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld (ix+007h),l		;ac89
	ld (ix+009h),h		;ac8c
	xor a			;ac8f
	ld (ix+006h),a		;ac90
	ld (ix+008h),a		;ac93
	ld a,l			;ac96
	and a			;ac97
	ld a,001h		;ac98
	jr nz,L_AC9E		;ac9a
	ld a,002h		;ac9c
L_AC9E:
	ld (ix+00ch),a		;ac9e
L_ACA1:
	inc (ix+001h)		;aca1
	ret			;aca4
L_ACA5:
	call 080e6h		;aca5
	ld a,(ix+00ah)		;aca8
	cp (ix+012h)		;acab
	ret nz			;acae
	ld a,(ix+00bh)		;acaf
	cp (ix+013h)		;acb2
	ret nz			;acb5
	ld a,(ix+00ch)		;acb6
	rra			;acb9
	ld b,(ix+003h)		;acba
	ld a,(ix+007h)		;acbd
	jr c,L_ACC8		;acc0
	ld b,(ix+005h)		;acc2
	ld a,(ix+009h)		;acc5
L_ACC8:
	rla			;acc8
	ld a,(ix+014h)		;acc9
	jr c,L_ACD2		;accc
	cp b			;acce
	ret nc			;accf
	jr L_ACD4		;acd0
L_ACD2:
	cp b			;acd2
	ret c			;acd3
L_ACD4:
	inc (ix+00fh)		;acd4
	dec (ix+001h)		;acd7
	ret			;acda

; ----------------------------------------------------------------------
; DATOS resto_ACDB: lo apuntan con el banco puesto p08:AC83 (0xACDB), p08:AC50
;   (0xACE3); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p08:AC83, p08:AC50 (104 bytes)
;   0xacdb..0xad43  (104 bytes)
DATA_resto_ACDB:
	defb 0fch,000h,004h,000h,000h,0fch,000h,004h,0ebh,0ach,013h,0adh,026h,0adh,03ch,0adh	; acdb  ............&.<.
	defb 083h,057h,058h,002h,056h,0a4h,001h,046h,054h,082h,046h,028h,083h,046h,098h,001h	; aceb  .WX.V..FT.F(.F..
	defb 046h,090h,083h,047h,098h,082h,046h,0a6h,000h,046h,058h,082h,046h,024h,083h,046h	; acfb  F..G..F..FX.F$.F
	defb 098h,000h,056h,080h,082h,055h,026h,0ffh,081h,036h,094h,083h,036h,038h,081h,026h	; ad0b  ..V..U&..6..68.&
	defb 094h,080h,036h,0a0h,082h,036h,026h,000h,036h,020h,0ffh,081h,037h,094h,083h,037h	; ad1b  ..6..6&.6 ..7..7
	defb 098h,081h,027h,094h,082h,027h,026h,080h,037h,098h,003h,037h,058h,000h,037h,020h	; ad2b  ..'..'&.7..7X.7
	defb 0ffh,081h,017h,094h,080h,027h,040h,0ffh	; ad3b  .....'@.

; ======================================================================
; CODIGO 0xad43..0xad50  (13 bytes)
; ======================================================================


L_AD43:
	ld a,(ix+019h)		;ad43
	and a			;ad46
	jp nz,L_AE52		;ad47
	ld a,(ix+001h)		;ad4a
	call 0424dh		;ad4d   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_AD50: 4 destinos del despachador p00:424D (call en p08:AD4D, el
;   indice en A): AE21, AE1D, AE25, AE03; lo leen p08:AD4D (8 bytes)
;   0xad50..0xad58  (8 bytes)
DATA_tabla_AD50:
	defw 0ae21h,0ae1dh,0ae25h,0ae03h	; ad50  -> L_AE21 L_AE1D L_AE25 L_AE03

; ======================================================================
; CODIGO 0xad58..0xae58  (256 bytes)
; ======================================================================


L_AD58:
	ld ix,0ce00h		;ad58
	ld b,018h		;ad5c
L_AD5E:
	ld a,(ix+000h)		;ad5e
	and 07fh		;ad61
	cp 015h		;ad63
	push bc			;ad65
	jr nz,L_AD6F		;ad66
	ld a,(ix+001h)		;ad68
	and a			;ad6b
	call z,L_AD78		;ad6c
L_AD6F:
	ld bc,00040h		;ad6f
	add ix,bc		;ad72
	pop bc			;ad74
	djnz L_AD5E		;ad75
	ret			;ad77
L_AD78:
	ld (ix+00fh),000h		;ad78
	ld a,(0ca4ah)		;ad7c   ; lee la zona
	ld hl,0bba9h		;ad7f
	call 043f6h		;ad82   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld a,(ix+011h)		;ad85
	and 03fh		;ad88
	add a,a			;ad8a
	ld b,a			;ad8b
	add a,a			;ad8c
	add a,a			;ad8d
	add a,b			;ad8e
	call 0423eh		;ad8f   ; suma_a_hl: HL = HL + A
	ld a,(hl)			;ad92
	ld (ix+003h),a		;ad93
	ld (ix+020h),a		;ad96
	ld (ix+002h),000h		;ad99
	inc hl			;ad9d
	ld a,(hl)			;ad9e
	ld (ix+005h),a		;ad9f
	ld (ix+021h),a		;ada2
	ld (ix+004h),000h		;ada5
	inc hl			;ada9
	ld a,(hl)			;adaa
	ld (ix+00ah),a		;adab
	ld (ix+022h),a		;adae
	inc hl			;adb1
	ld a,(hl)			;adb2
	ld (ix+00bh),a		;adb3
	ld (ix+023h),a		;adb6
	inc hl			;adb9
	ld a,(hl)			;adba
	ld (ix+024h),a		;adbb
	inc hl			;adbe
	ld a,(hl)			;adbf
	ld (ix+025h),a		;adc0
	inc hl			;adc3
	ld a,(hl)			;adc4
	ld (ix+026h),a		;adc5
	ld (ix+012h),a		;adc8
	inc hl			;adcb
	ld a,(hl)			;adcc
	ld (ix+027h),a		;adcd
	ld (ix+013h),a		;add0
	inc hl			;add3
	ld a,(hl)			;add4
	ld c,a			;add5
	cp 002h		;add6
	ld b,(ix+024h)		;add8
	jr c,L_ADE0		;addb
	ld b,(ix+025h)		;addd
L_ADE0:
	ld (ix+014h),b		;ade0
	ld de,0ae6bh		;ade3
	push hl			;ade6
	call 08e40h		;ade7
	pop hl			;adea
	inc hl			;adeb
	ld a,(hl)			;adec
	ld (ix+00dh),a		;aded
	ld a,(ix+00ch)		;adf0
	ld (ix+016h),a		;adf3
	ld a,(0ca5fh)		;adf6
	and a			;adf9
	ret z			;adfa
	ld a,(ix+000h)		;adfb
	ld (ix+001h),003h		;adfe
	ret			;ae02
L_AE03:
	ld (ix+00ch),000h		;ae03
	ld a,(0ca5fh)		;ae07
	and a			;ae0a
	ret nz			;ae0b
	call 08100h		;ae0c
	ret z			;ae0f
	ld a,(ix+028h)		;ae10
	ld (ix+001h),a		;ae13
	ld a,(ix+016h)		;ae16
	ld (ix+00ch),a		;ae19
	ret			;ae1c
L_AE1D:
	call 08e82h		;ae1d   ; p04:8E82
	ret nc			;ae20
L_AE21:
	inc (ix+001h)		;ae21
	ret			;ae24
L_AE25:
	call 0809eh		;ae25
	ld b,(ix+020h)		;ae28
	ld c,(ix+024h)		;ae2b
L_AE2E:
	ld (ix+001h),001h		;ae2e
	ld a,(ix+00fh)		;ae32
	inc (ix+00fh)		;ae35
	rra			;ae38
	ld d,(ix+022h)		;ae39
	ld e,(ix+023h)		;ae3c
	jr nc,L_AE48		;ae3f
	ld b,c			;ae41
	ld d,(ix+026h)		;ae42
	ld e,(ix+027h)		;ae45
L_AE48:
	ld (ix+014h),b		;ae48
	ld (ix+012h),d		;ae4b
	ld (ix+013h),e		;ae4e
	ret			;ae51
L_AE52:
	ld a,(ix+001h)		;ae52
	call 0424dh		;ae55   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_AE58: 4 destinos del despachador p00:424D (call en p08:AE55, el
;   indice en A): AE21, AE1D, AE60, AE03; lo leen p08:AE55 (8 bytes)
;   0xae58..0xae60  (8 bytes)
DATA_tabla_AE58:
	defw 0ae21h,0ae1dh,0ae60h,0ae03h	; ae58  -> L_AE21 L_AE1D L_AE60 L_AE03

; ======================================================================
; CODIGO 0xae60..0xae6b  (11 bytes)
; ======================================================================


L_AE60:
	call 0808eh		;ae60   ; p04:808E
	ld b,(ix+021h)		;ae63
	ld c,(ix+025h)		;ae66
	jr $-59		;ae69

; ----------------------------------------------------------------------
; DATOS resto_AE6B: lo apuntan con el banco puesto p08:ADE3 (0xAE6B); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p08:ADE3 (16 bytes)
;   0xae6b..0xae7b  (16 bytes)
DATA_resto_AE6B:
	defb 000h,0ffh,000h,000h,000h,001h,000h,000h,000h,000h,000h,0ffh,000h,000h,000h,001h	; ae6b  ................

; ======================================================================
; CODIGO 0xae7b..0xaf11  (150 bytes)
; ======================================================================


L_AE7B:
	ld a,(0ca4ah)		;ae7b   ; lee la zona
	cp 004h		;ae7e
	ret nz			;ae80
	ld ix,0ce00h		;ae81
	ld b,018h		;ae85
L_AE87:
	push bc			;ae87
	ld a,(ix+000h)		;ae88
	cp 00ah		;ae8b
	jr nz,L_AEAF		;ae8d
	call 08100h		;ae8f
	jr nz,L_AEAF		;ae92
	ld a,(ix+00bh)		;ae94
	cp 009h		;ae97
	jr nz,L_AEA8		;ae99
	ld a,(0cb21h)		;ae9b
	cp 003h		;ae9e
	jr z,L_AEA8		;aea0
	ld a,(0cacdh)		;aea2
	and a			;aea5
	jr nz,L_AEAF		;aea6
L_AEA8:
	ld (ix+00dh),000h		;aea8
	call L_AEE2		;aeac
L_AEAF:
	ld bc,00040h		;aeaf
	add ix,bc		;aeb2
	pop bc			;aeb4
	djnz L_AE87		;aeb5
	ret			;aeb7
L_AEB8:
	ld de,00706h		;aeb8
L_AEBB:
	call 08100h		;aebb
	ret nz			;aebe
L_AEBF:
	ld a,(ix+00bh)		;aebf
	cp 009h		;aec2
	jr nz,L_AED2		;aec4
	ld a,(0cb21h)		;aec6
	cp 003h		;aec9
	jr z,L_AED2		;aecb
	ld a,(0cacdh)		;aecd
	and a			;aed0
	ret nz			;aed1
L_AED2:
	ld hl,0ca42h		;aed2   ; apunta a la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	ld a,(hl)			;aed5
	push af			;aed6
	xor 001h		;aed7
	ld (hl),a			;aed9
	push hl			;aeda
	call L_AEE5		;aedb
	pop hl			;aede
	pop af			;aedf
	ld (hl),a			;aee0
	ret			;aee1
L_AEE2:
	ld de,00706h		;aee2
L_AEE5:
	ld (0ca4ch),de		;aee5   ; guarda los 4 bits altos del byte de la sala (p56:BD28) y el byte siguiente (16 bits)
	ld a,(ix+00dh)		;aee9
	ld hl,0afa7h		;aeec
	call 043f6h		;aeef   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld b,(hl)			;aef2
	inc hl			;aef3
	ld c,(hl)			;aef4
	inc hl			;aef5
	ld a,(ix+005h)		;aef6
	sub (hl)			;aef9
	ld d,a			;aefa
	inc hl			;aefb
	ld a,(ix+003h)		;aefc
	sub (hl)			;aeff
	ld e,a			;af00
	inc hl			;af01
	call 041ddh		;af02   ; bancos_12: pone el 12 en 0x6000 (con su copia en 0xC381-0xC383)
	call 0741eh		;af05
	jp 041b5h		;af08   ; bancos_1_4_8: pone el 1 en 0x6000, el 4 en 0x8000, el 8 en 0xA000 (con su copia en 0xC381-0xC383)
L_AF0B:
	ld a,(ix+001h)		;af0b
	call 0424dh		;af0e   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_AF11: 6 destinos del despachador p00:424D (call en p08:AF0E, el
;   indice en A): AF37, AF1D, AF22, AF43, AF6F, AF7F; lo leen p08:AF0E (12
;   bytes)
;   0xaf11..0xaf1d  (12 bytes)
DATA_tabla_AF11:
	defw 0af37h,0af1dh,0af22h,0af43h,0af6fh,0af7fh	; af11

; ======================================================================
; CODIGO 0xaf1d..0xaf6b  (78 bytes)
; ======================================================================


L_AF1D:
	call L_AF38		;af1d
	jr L_AF31		;af20
L_AF22:
	dec (ix+00eh)		;af22
	ret nz			;af25
	ld (ix+00dh),001h		;af26
	call L_AEB8		;af2a
	ld (ix+00fh),008h		;af2d
L_AF31:
	call L_AF38		;af31
L_AF34:
	inc (ix+001h)		;af34
L_AF37:
	ret			;af37
L_AF38:
	call 04256h		;af38   ; azar: A = un numero al azar (0xCA03 rotado mas R)
	and 007h		;af3b
	add a,004h		;af3d
	ld (ix+00eh),a		;af3f
	ret			;af42
L_AF43:
	dec (ix+00eh)		;af43
	ret nz			;af46
	dec (ix+00fh)		;af47
	jr z,L_AF61		;af4a
	call L_AF38		;af4c
	ld a,(ix+00fh)		;af4f
	and 003h		;af52
	ld hl,0af6bh		;af54
	call 0423eh		;af57   ; suma_a_hl: HL = HL + A
	ld a,(hl)			;af5a
	ld (ix+00dh),a		;af5b
	jp L_AEB8		;af5e
L_AF61:
	xor a			;af61
	ld (ix+001h),a		;af62
	ld (ix+00dh),a		;af65
	jp L_AEB8		;af68

; ----------------------------------------------------------------------
; DATOS resto_AF6B: lo apuntan con el banco puesto p08:AF54 (0xAF6B); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p08:AF54 (4 bytes)
;   0xaf6b..0xaf6f  (4 bytes)
DATA_resto_AF6B:
	defb 002h,003h,002h,004h	; af6b

; ======================================================================
; CODIGO 0xaf6f..0xafa7  (56 bytes)
; ======================================================================


L_AF6F:
	call 08100h		;af6f
	ret nz			;af72
	ld a,(0ca5fh)		;af73
	cp 002h		;af76
	jr nc,$-68		;af78
	ld (ix+001h),000h		;af7a
	ret			;af7e
L_AF7F:
	ld (ix+00dh),005h		;af7f
	ld de,00100h		;af83
	call L_AEBB		;af86
	ld a,(ix+003h)		;af89
	add a,008h		;af8c
	ld (ix+003h),a		;af8e
	ld a,(ix+005h)		;af91
	sub 014h		;af94
	ld (ix+005h),a		;af96
	ld (ix+000h),001h		;af99
	xor a			;af9d
	ld (ix+001h),a		;af9e
	ld (ix+00dh),a		;afa1
	jp 081c5h		;afa4

; ----------------------------------------------------------------------
; DATOS resto_AFA7: lo apuntan con el banco puesto p08:AEEC (0xAFA7); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p08:AEEC (69 bytes)
;   0xafa7..0xafec  (69 bytes)
DATA_resto_AFA7:
	defb 0b3h,0afh,0c3h,0afh,0cdh,0afh,0d2h,0afh,0d7h,0afh,0dch,0afh,003h,004h,00ch,00fh	; afa7  ................
	defb 00fh,011h,010h,001h,002h,003h,004h,005h,006h,007h,008h,009h,003h,002h,00ch,00fh	; afb7  ................
	defb 00dh,012h,00eh,00ah,00bh,00ch,001h,001h,004h,00fh,012h,001h,001h,004h,00fh,014h	; afc7  ................
	defb 001h,001h,004h,00fh,013h,003h,004h,00ch,00fh,0bch,0bdh,0beh,095h,087h,096h,086h	; afd7  ................
	defb 086h,088h,086h,086h,088h	; afe7

; ======================================================================
; CODIGO 0xafec..0xaff2  (6 bytes)
; ======================================================================


L_AFEC:
	ld a,(ix+001h)		;afec
	call 0424dh		;afef   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_AFF2: 4 destinos del despachador p00:424D (call en p08:AFEF, el
;   indice en A): B003, AFFA, B011, B032; lo leen p08:AFEF (8 bytes)
;   0xaff2..0xaffa  (8 bytes)
DATA_tabla_AFF2:
	defw 0b003h,0affah,0b011h,0b032h	; aff2  -> L_B003 L_AFFA L_B011 L_B032

; ======================================================================
; CODIGO 0xaffa..0xb050  (86 bytes)
; ======================================================================


L_AFFA:
	dec (ix+00eh)		;affa
	ret nz			;affd
	call 0902eh		;affe
	jr L_B006		;b001
L_B003:
	call L_B01C		;b003
L_B006:
	call 04256h		;b006   ; azar: A = un numero al azar (0xCA03 rotado mas R)
	and 007h		;b009
	add a,004h		;b00b
	ld (ix+00eh),a		;b00d
	ret			;b010
L_B011:
	ld (ix+00dh),002h		;b011
	ld (ix+00eh),010h		;b015
	call 06a48h		;b019
L_B01C:
	inc (ix+001h)		;b01c
	ret			;b01f
L_B020:
	dec a			;b020
	ld hl,0daa0h		;b021
	add a,a			;b024
	add a,a			;b025
	add a,a			;b026
	add a,a			;b027
	call 0423eh		;b028   ; suma_a_hl: HL = HL + A
	ld a,c			;b02b
	ld bc,0000fh		;b02c
	jp 04237h		;b02f   ; llena_bloque: pone A en BC + 1 bytes desde HL
L_B032:
	dec (ix+00eh)		;b032
	jp z,0834ch		;b035   ; p04:834C
	ld a,(ix+02eh)		;b038
	ld c,007h		;b03b
	call L_B020		;b03d
	ld a,(ix+02fh)		;b040
	ld c,00ah		;b043
	call L_B020		;b045
	ld a,(ix+00eh)		;b048
	rra			;b04b
	jp c,0902eh		;b04c
	ret			;b04f

; ----------------------------------------------------------------------
; DATOS resto_B050: lo apuntan con el banco puesto p04:8D9C (0xB050), p08:AA6F
;   (0xB976), p02:84FA (0xB98A), p04:81CC (0xB9FB), p04:81DD (0xBA2F),
;   p08:BE35 (0xBA97); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p04:8D9C, p08:AA6F, p02:84FA, p04:81CC, p04:81DD,
;   p08:BE35 (3075 bytes)
;   0xb050..0xbc53  (3075 bytes)
DATA_resto_B050:
	defb 06ch,0b0h,080h,0b0h,0a0h,0b0h,0aah,0b0h,0beh,0b0h,0ceh,0b0h,0e2h,0b0h,0e2h,0b0h	; b050  l...............
	defb 06ch,0b0h,0ech,0b0h,0f6h,0b0h,014h,0b1h,06ch,0b0h,01eh,0b1h,026h,0b1h,047h,0b1h	; b060  l.......l...&.G.
	defb 061h,0b1h,09dh,0b1h,0c7h,0b1h,0dah,0b1h,0f2h,0b1h,005h,0b2h,00ch,0b2h,01fh,0b2h	; b070  a...............
	defb 035h,0b2h,04eh,0b2h,05fh,0b2h,07ch,0b2h,0abh,0b2h,0e2h,0b2h,007h,0b3h,007h,0b3h	; b080  5.N._.|.........
	defb 014h,0b3h,02ah,0b3h,032h,0b3h,03fh,0b3h,053h,0b3h,053h,0b3h,05ch,0b3h,065h,0b3h	; b090  ..*.2.?.S.S.\.e.
	defb 07eh,0b3h,09ch,0b3h,0b0h,0b3h,0cah,0b3h,0e3h,0b3h,007h,0b4h,01ch,0b4h,02bh,0b4h	; b0a0  ~.............+.
	defb 03ah,0b4h,047h,0b4h,054h,0b4h,061h,0b4h,074h,0b4h,07bh,0b4h,082h,0b4h,089h,0b4h	; b0b0  :.G.T.a.t.{.....
	defb 0a5h,0b4h,0a5h,0b4h,0b8h,0b4h,0cdh,0b4h,0ffh,0b4h,055h,0b5h,063h,0b5h,08ah,0b5h	; b0c0  ..........U.c...
	defb 0a7h,0b5h,0b7h,0b5h,0beh,0b5h,0d5h,0b5h,0e0h,0b5h,0f8h,0b5h,00dh,0b6h,01eh,0b6h	; b0d0  ................
	defb 028h,0b6h,03eh,0b6h,055h,0b6h,066h,0b6h,07eh,0b6h,08fh,0b6h,0a3h,0b6h,0b4h,0b6h	; b0e0  (.>.U.f.~.......
	defb 0c2h,0b6h,0d6h,0b6h,0edh,0b6h,0f5h,0b6h,002h,0b7h,00bh,0b7h,016h,0b7h,02bh,0b7h	; b0f0  ..............+.
	defb 03fh,0b7h,050h,0b7h,060h,0b7h,076h,0b7h,093h,0b7h,0a8h,0b7h,0bfh,0b7h,0c7h,0b7h	; b100  ?.P.`.v.........
	defb 0ceh,0b7h,0e2h,0b7h,0ebh,0b7h,001h,0b8h,05ch,0b8h,0b1h,0b8h,000h,0b9h,021h,0b9h	; b110  ........\.....!.
	defb 02ch,0b9h,045h,0b9h,064h,0b9h,001h,028h,0a4h,002h,027h,074h,080h,042h,027h,017h	; b120  ,.E.d..(..'t.B'.
	defb 000h,027h,06fh,003h,027h,06ch,081h,003h,028h,030h,001h,028h,080h,043h,028h,069h	; b130  .'o.'l..(0.(.C(i
	defb 040h,038h,0adh,002h,038h,02bh,0ffh,041h,026h,07ah,043h,027h,073h,041h,027h,0a9h	; b140  @8..8+.A&zC'sA'.
	defb 002h,026h,09ch,000h,036h,0adh,002h,036h,06ah,001h,026h,02bh,083h,042h,026h,029h	; b150  .&..6..6j.&+.B&)
	defb 0ffh,001h,036h,0b0h,003h,036h,04ch,000h,036h,07bh,003h,036h,0abh,001h,026h,038h	; b160  ..6..6L.6{.6..&8
	defb 003h,028h,00bh,000h,038h,070h,003h,038h,088h,000h,038h,030h,001h,038h,069h,002h	; b170  .(..8p.8..80.8i.
	defb 038h,016h,001h,028h,036h,002h,026h,0b5h,000h,036h,080h,002h,036h,050h,083h,001h	; b180  8..(6.&..6..6P..
	defb 036h,0b0h,002h,036h,030h,080h,002h,036h,017h,000h,036h,060h,0ffh,002h,037h,0afh	; b190  6..60..6..6`..7.
	defb 001h,037h,0aeh,002h,037h,06fh,080h,002h,037h,015h,000h,037h,03ah,002h,036h,036h	; b1a0  .7..7o..7..7:.66
	defb 041h,036h,060h,000h,036h,03ah,003h,037h,012h,001h,037h,0a9h,003h,037h,0aah,000h	; b1b0  A6`.6:.7..7..7..
	defb 037h,02ch,003h,038h,06ch,081h,0ffh,002h,037h,036h,083h,001h,037h,074h,003h,037h	; b1c0  7,.8l...76..7t.7
	defb 074h,081h,003h,037h,08ah,082h,000h,037h,033h,0ffh,002h,048h,070h,080h,002h,048h	; b1d0  t..7...73..Hp..H
	defb 013h,001h,048h,0ach,003h,048h,0a5h,080h,002h,048h,013h,000h,048h,054h,003h,048h	; b1e0  ..H..H...H..HT.H
	defb 08ch,0ffh,042h,047h,05fh,003h,047h,0a7h,001h,047h,0aah,002h,047h,06fh,003h,047h	; b1f0  ..BG_.G..G..Go.G
	defb 0a6h,000h,047h,079h,0ffh,043h,047h,083h,042h,047h,034h,0ffh,002h,046h,07bh,040h	; b200  ..Gy.CG.BG4..F{@
	defb 046h,058h,043h,047h,058h,002h,046h,09ah,041h,046h,0abh,003h,046h,0a3h,0ffh,000h	; b210  FXCGX.F.AF..F...
	defb 046h,05ah,081h,002h,046h,016h,083h,041h,046h,099h,000h,046h,05ah,003h,046h,043h	; b220  FZ..F..AF..FZ.FC
	defb 082h,041h,046h,0a5h,0ffh,002h,016h,020h,000h,016h,020h,003h,016h,0a0h,081h,003h	; b230  .AF.... .. .....
	defb 017h,09eh,081h,003h,018h,0a7h,001h,018h,076h,002h,017h,059h,080h,0ffh,041h,016h	; b240  ........v..Y..A.
	defb 093h,043h,017h,09ch,000h,017h,020h,002h,017h,05ah,081h,042h,016h,09dh,0ffh,000h	; b250  .C.... ..Z.B....
	defb 025h,03ah,082h,000h,035h,034h,042h,035h,026h,003h,035h,0a9h,040h,045h,099h,001h	; b260  %:..54B5&.5.@E..
	defb 025h,02eh,002h,025h,06bh,003h,025h,0a9h,041h,025h,05dh,0ffh,000h,045h,031h,002h	; b270  %..%k.%.A%]..E1.
	defb 045h,035h,001h,045h,0aah,002h,045h,016h,001h,035h,076h,003h,035h,02ch,041h,025h	; b280  E5.E..E..5v.5,A%
	defb 06dh,000h,035h,079h,002h,035h,015h,000h,035h,036h,083h,000h,045h,0b0h,003h,045h	; b290  m.5y.5..56..E..E
	defb 02bh,000h,045h,031h,003h,045h,0a8h,041h,045h,05dh,0ffh,002h,027h,092h,040h,027h	; b2a0  +.E1.E.AE]..'.@'
	defb 0a0h,002h,026h,0b5h,001h,026h,0b6h,002h,026h,04ch,000h,026h,080h,002h,026h,013h	; b2b0  ..&..&..&L.&..&.
	defb 000h,046h,061h,003h,047h,010h,001h,047h,077h,003h,047h,06ah,000h,047h,061h,003h	; b2c0  .Fa.G..Gw.Gj.Ga.
	defb 048h,00bh,000h,048h,03eh,003h,048h,0ach,001h,028h,058h,002h,028h,096h,001h,028h	; b2d0  H..H>.H..(X.(..(
	defb 0b5h,0ffh,003h,027h,0abh,001h,027h,08fh,003h,028h,06ch,000h,028h,019h,002h,028h	; b2e0  ...'..'..(l.(..(
	defb 055h,040h,048h,099h,002h,046h,0b4h,000h,046h,07bh,002h,046h,056h,001h,036h,035h	; b2f0  U@H..F..F{.FV.65
	defb 003h,036h,069h,041h,026h,070h,0ffh,002h,048h,059h,001h,038h,05ch,003h,038h,08bh	; b300  .6iA&p..HY.8\.8.
	defb 000h,048h,059h,0ffh,002h,037h,0b4h,000h,037h,033h,002h,037h,015h,001h,037h,0ach	; b310  .HY..7..73.7..7.
	defb 003h,037h,0aah,000h,037h,073h,043h,038h,050h,0ffh,042h,046h,02ah,003h,046h,093h	; b320  .7..7sC8P.BF*.F.
	defb 080h,0ffh,042h,047h,031h,041h,047h,05dh,000h,047h,02eh,043h,047h,08fh,0ffh,001h	; b330  ..BG1AG].G.CG...
	defb 059h,0a6h,042h,059h,053h,040h,059h,046h,001h,059h,0a6h,003h,059h,088h,082h,000h	; b340  Y.BYS@YF.Y..Y...
	defb 059h,059h,0ffh,043h,017h,057h,080h,042h,017h,01bh,080h,0ffh,042h,017h,06bh,080h	; b350  YY.C.W.B....B.k.
	defb 043h,017h,0aah,080h,0ffh,002h,056h,05bh,001h,056h,090h,002h,055h,098h,000h,055h	; b360  C.....V[.V..U..U
	defb 030h,003h,056h,056h,001h,056h,090h,003h,056h,098h,000h,056h,030h,0ffh,000h,038h	; b370  0.VV.V..V..V0..8
	defb 0ach,002h,038h,078h,000h,038h,04dh,083h,002h,037h,0b6h,001h,037h,0a8h,042h,037h	; b380  ..8x.8M..7..7.B7
	defb 08fh,001h,027h,081h,003h,028h,069h,080h,003h,028h,08bh,0ffh,043h,027h,02ah,000h	; b390  ..'..(i..(..C'*.
	defb 037h,0ach,083h,002h,037h,00eh,040h,037h,08ah,042h,036h,053h,041h,026h,070h,0ffh	; b3a0  7...7.@7.B6SA&p.
	defb 001h,036h,034h,003h,036h,050h,041h,036h,086h,003h,037h,009h,000h,037h,02fh,043h	; b3b0  .64.6PA6..7..7/C
	defb 037h,028h,000h,047h,08dh,083h,002h,046h,031h,0ffh,042h,047h,04fh,001h,047h,085h	; b3c0  7(.G...F1.BGO.G.
	defb 002h,047h,033h,001h,037h,02ch,003h,037h,0aah,001h,037h,047h,043h,038h,06ah,000h	; b3d0  .G3.7,.7..7GC8j.
	defb 048h,04dh,0ffh,003h,047h,050h,081h,003h,048h,069h,080h,001h,028h,018h,003h,028h	; b3e0  HM..GP..Hi..(..(
	defb 084h,001h,028h,082h,002h,026h,056h,000h,036h,033h,002h,036h,032h,040h,046h,07eh	; b3f0  ..(..&V.63.62@F~
	defb 003h,046h,04ah,000h,046h,04dh,0ffh,001h,035h,0abh,083h,001h,025h,093h,003h,026h	; b400  .FJ.FM..5...%..&
	defb 089h,000h,036h,0b2h,082h,000h,036h,032h,002h,035h,035h,0ffh,000h,035h,0b2h,082h	; b410  ..6...62.55..5..
	defb 040h,035h,03fh,001h,035h,0afh,0c3h,001h,025h,07ch,0ffh,001h,036h,0aeh,083h,041h	; b420  @5?.5...%|..6..A
	defb 026h,079h,000h,036h,0b2h,082h,040h,036h,03dh,0ffh,041h,056h,0aah,042h,056h,073h	; b430  &y.6..@6=.AV.BVs
	defb 040h,056h,04fh,043h,056h,0abh,0ffh,000h,057h,032h,002h,056h,02fh,001h,046h,093h	; b440  @VOCV...W2.V/.F.
	defb 003h,047h,08eh,0ffh,003h,017h,0aah,000h,017h,032h,002h,017h,076h,001h,017h,0ach	; b450  .G.......2..v...
	defb 0ffh,002h,049h,054h,001h,049h,0ach,003h,049h,080h,002h,049h,054h,000h,049h,034h	; b460  ..IT.I..I..IT.I4
	defb 003h,049h,0ach,0ffh,041h,039h,060h,040h,039h,050h,0ffh,041h,039h,080h,040h,039h	; b470  .I..A9`@9P.A9.@9
	defb 070h,0ffh,041h,039h,0a0h,040h,039h,090h,0ffh,000h,055h,050h,003h,056h,06bh,001h	; b480  p.A9.@9...UP.Vk.
	defb 056h,091h,083h,041h,046h,03bh,000h,056h,050h,002h,055h,015h,001h,035h,033h,083h	; b490  V..AF..VP.U..53.
	defb 001h,035h,08bh,083h,0ffh,001h,036h,0adh,002h,036h,073h,040h,046h,067h,001h,036h	; b4a0  .5....6..6s@Fg.6
	defb 0adh,003h,036h,0adh,000h,036h,049h,0ffh,003h,047h,0aah,082h,040h,047h,050h,042h	; b4b0  ..6..6I..G..@GPB
	defb 046h,07bh,003h,047h,0aah,080h,001h,047h,0aeh,002h,047h,011h,0ffh,003h,017h,090h	; b4c0  F{.G...G..G.....
	defb 000h,027h,02fh,003h,028h,02fh,001h,018h,092h,003h,018h,094h,001h,018h,0a8h,003h	; b4d0  .'/.(/..........
	defb 019h,050h,000h,019h,070h,002h,019h,02eh,080h,003h,019h,06fh,000h,019h,05fh,001h	; b4e0  .P..p......o.._.
	defb 019h,072h,002h,018h,08ch,000h,028h,030h,002h,027h,02eh,001h,017h,08eh,0ffh,002h	; b4f0  .r....(0.'......
	defb 028h,030h,081h,002h,027h,090h,081h,002h,027h,030h,001h,027h,0a0h,002h,027h,03bh	; b500  (0..'...'0.'..'.
	defb 082h,001h,017h,08dh,003h,017h,08fh,080h,003h,018h,08ah,080h,000h,018h,071h,003h	; b510  ..............q.
	defb 019h,06fh,080h,003h,019h,0ach,001h,019h,0a8h,002h,019h,04dh,000h,019h,074h,002h	; b520  .o.........M..t.
	defb 019h,030h,000h,019h,060h,000h,017h,090h,002h,017h,017h,000h,017h,034h,003h,017h	; b530  .0..`........4..
	defb 0a8h,001h,017h,098h,002h,017h,074h,001h,017h,0b8h,001h,019h,06eh,002h,018h,08eh	; b540  ......t.....n...
	defb 000h,028h,034h,081h,0ffh,041h,018h,06ah,002h,018h,03bh,081h,000h,028h,07dh,003h	; b550  .(4..A.j.....(}.
	defb 028h,035h,0ffh,003h,057h,0aah,000h,057h,02eh,002h,057h,016h,001h,057h,064h,003h	; b560  (5..W..W..W..Wd.
	defb 057h,02ch,080h,003h,058h,020h,000h,058h,04ch,003h,058h,07bh,080h,002h,057h,0b0h	; b570  W,..X .XL.X{..W.
	defb 000h,057h,02dh,002h,057h,016h,001h,057h,0ach,0ffh,001h,036h,036h,082h,083h,001h	; b580  .W-.W..W...66...
	defb 026h,027h,003h,026h,06ch,000h,036h,078h,083h,000h,046h,036h,082h,001h,026h,059h	; b590  &'.&l.6x..F6..&Y
	defb 002h,026h,034h,000h,046h,036h,0ffh,041h,027h,053h,001h,027h,0b0h,043h,027h,030h	; b5a0  .&4.F6.A'S.'.C'0
	defb 002h,027h,015h,000h,027h,029h,0ffh,042h,037h,060h,043h,037h,079h,0ffh,002h,027h	; b5b0  .'..').B7`C7y..'
	defb 074h,000h,027h,059h,082h,000h,027h,031h,003h,027h,0adh,002h,027h,074h,041h,027h	; b5c0  t.'Y..'1.'..'tA'
	defb 08eh,003h,027h,0b0h,0ffh,002h,047h,064h,081h,002h,047h,018h,043h,047h,08dh,0ffh	; b5d0  ..'...Gd..G.CG..
	defb 003h,028h,06bh,000h,028h,060h,082h,001h,028h,093h,003h,028h,09fh,080h,002h,028h	; b5e0  .(k.(`..(..(...(
	defb 076h,001h,028h,0ach,002h,028h,015h,0ffh,002h,028h,075h,041h,028h,057h,002h,028h	; b5f0  v.(..(...(uA(W.(
	defb 016h,081h,003h,028h,06ch,081h,000h,028h,031h,003h,028h,0b1h,0ffh,003h,038h,0abh	; b600  ...(l..(1.(...8.
	defb 000h,038h,031h,042h,038h,054h,001h,038h,0abh,082h,000h,038h,091h,0ffh,002h,048h	; b610  .81B8T.8...8...H
	defb 071h,042h,048h,025h,003h,048h,0aah,0ffh,003h,048h,04ah,041h,048h,047h,003h,048h	; b620  qBH%.H...HJAHG.H
	defb 0abh,080h,081h,002h,048h,056h,081h,000h,048h,031h,002h,048h,016h,0ffh,041h,029h	; b630  ....HV..H1.H..A)
	defb 068h,002h,029h,090h,081h,002h,029h,032h,000h,029h,02fh,041h,029h,068h,003h,029h	; b640  h.)...)2.)/A)h.)
	defb 0aeh,000h,029h,033h,0ffh,042h,057h,06eh,001h,057h,0abh,083h,002h,057h,03bh,040h	; b650  ..)3.BWn.W...W.@
	defb 057h,038h,003h,057h,0aah,0ffh,003h,057h,035h,081h,000h,057h,02ch,043h,057h,066h	; b660  W8.W...W5..W,CWf
	defb 001h,057h,0afh,083h,002h,057h,037h,000h,057h,077h,002h,057h,017h,0ffh,000h,067h	; b670  .W...W7.Ww.W...g
	defb 090h,082h,083h,040h,067h,021h,001h,067h,072h,083h,082h,041h,067h,0a7h,0ffh,001h	; b680  ...@g!.gr..Ag...
	defb 067h,073h,082h,041h,067h,08eh,003h,067h,066h,002h,067h,03dh,001h,067h,0b1h,000h	; b690  gs.Ag..gf.g=.g..
	defb 067h,020h,0ffh,000h,016h,05dh,003h,016h,03eh,080h,003h,016h,071h,041h,016h,09ch	; b6a0  g ...]..>...qA..
	defb 002h,016h,017h,0ffh,003h,017h,04fh,041h,017h,074h,000h,017h,059h,083h,002h,016h	; b6b0  ......OA.t..Y...
	defb 0a7h,0ffh,041h,018h,073h,000h,018h,05ah,083h,042h,017h,077h,041h,017h,078h,000h	; b6c0  ..A.s..Z.B.wA.x.
	defb 017h,05ah,003h,018h,032h,0ffh,001h,018h,0aeh,042h,018h,06bh,000h,018h,088h,001h	; b6d0  .Z..2....B.k....
	defb 018h,0aeh,042h,018h,036h,003h,018h,0a7h,000h,018h,05fh,082h,0ffh,041h,018h,061h	; b6e0  ..B.6....._..A.a
	defb 000h,018h,05ch,083h,0ffh,002h,037h,05ch,040h,037h,03eh,041h,037h,07bh,043h,037h	; b6f0  ..\...7\@7>A7{C7
	defb 098h,0ffh,003h,037h,055h,080h,002h,037h,023h,080h,0ffh,003h,049h,056h,080h,043h	; b700  ...7U..7#...IV.C
	defb 04ah,085h,042h,048h,01dh,0ffh,001h,05ah,06ch,082h,001h,04ah,091h,042h,04ah,06bh	; b710  J.BH...Zl..J.BJk
	defb 003h,04ah,0a9h,000h,05ah,033h,082h,000h,06ah,039h,0ffh,003h,068h,032h,001h,058h	; b720  .J..Z3..j9..h2.X
	defb 056h,003h,058h,052h,001h,048h,053h,083h,002h,048h,017h,000h,068h,05fh,0ffh,001h	; b730  V.XR.HS..H..h_..
	defb 049h,026h,002h,049h,026h,081h,002h,048h,072h,040h,058h,075h,003h,059h,02eh,0ffh	; b740  I&.I&..Hr@Xu.Y..
	defb 002h,059h,072h,081h,000h,069h,092h,082h,003h,06ah,06fh,080h,041h,05ah,073h,0ffh	; b750  .Yr..i...jo.AZs.
	defb 002h,069h,094h,041h,059h,048h,003h,05ah,041h,041h,05ah,073h,000h,05ah,050h,003h	; b760  .i.AYH.ZAAZs.ZP.
	defb 05ah,04eh,000h,06ah,0b4h,0ffh,001h,059h,028h,002h,058h,072h,081h,002h,058h,050h	; b770  ZN.j...Y(.Xr..XP
	defb 000h,068h,02ch,002h,068h,01dh,003h,068h,04dh,001h,058h,027h,003h,059h,00dh,000h	; b780  .h,.h..hM.X'.Y..
	defb 069h,079h,0ffh,001h,069h,068h,003h,06ah,02eh,000h,06ah,03dh,083h,001h,06ah,068h	; b790  iy..ih.j..j=..jh
	defb 002h,069h,051h,000h,069h,02ch,082h,0ffh,001h,064h,068h,002h,064h,029h,081h,002h	; b7a0  .iQ.i,...dh.d)..
	defb 064h,013h,000h,064h,02eh,001h,064h,068h,003h,064h,08fh,000h,064h,020h,0ffh,003h	; b7b0  d..d..dh.d..d ..
	defb 064h,0a3h,080h,002h,064h,019h,0ffh,043h,017h,0a0h,042h,017h,020h,0ffh,001h,017h	; b7c0  d...d..C..B. ...
	defb 079h,080h,002h,017h,019h,041h,017h,0a0h,000h,017h,079h,003h,017h,0adh,000h,017h	; b7d0  y....A....y.....
	defb 050h,0ffh,003h,049h,080h,081h,002h,049h,050h,081h,0ffh,000h,038h,095h,003h,038h	; b7e0  P..I...IP...8..8
	defb 08bh,000h,048h,075h,042h,048h,034h,001h,038h,095h,003h,038h,064h,041h,028h,03ah	; b7f0  ..HuBH4.8..8dA(:
	defb 0ffh,002h,048h,033h,000h,048h,051h,002h,046h,017h,001h,026h,0a8h,003h,027h,0aah	; b800  ..H3.HQ.F..&..'.
	defb 000h,047h,0afh,002h,046h,057h,001h,026h,047h,003h,027h,06bh,000h,037h,0afh,002h	; b810  .G..FW.&G.'k.7..
	defb 036h,093h,000h,036h,030h,003h,037h,00ah,001h,037h,047h,003h,037h,06ah,002h,037h	; b820  6..60.7..7G.7j.7
	defb 015h,000h,037h,02eh,002h,036h,095h,001h,036h,0a3h,003h,037h,06bh,001h,027h,047h	; b830  ..7..6..6..7k.'G
	defb 002h,026h,054h,000h,046h,0aeh,003h,047h,0ach,001h,027h,0a8h,002h,026h,015h,000h	; b840  .&T.F..G..'..&..
	defb 046h,04eh,003h,048h,02ch,001h,048h,063h,003h,048h,08fh,0ffh,001h,047h,04fh,002h	; b850  FN.H,.Hc.H...GO.
	defb 046h,016h,001h,026h,0adh,003h,027h,0aah,000h,047h,0b0h,002h,046h,056h,001h,026h	; b860  F..&..'..G..FV.&
	defb 052h,003h,027h,06bh,000h,037h,0b2h,002h,036h,094h,000h,036h,032h,003h,037h,00bh	; b870  R.'k.7..6..62.7.
	defb 001h,037h,050h,003h,037h,05eh,002h,037h,015h,000h,037h,034h,002h,036h,096h,001h	; b880  .7P.7^.7..74.6..
	defb 036h,0aeh,003h,037h,06bh,001h,027h,052h,002h,026h,055h,000h,046h,0afh,003h,047h	; b890  6..7k.'R.&U.F..G
	defb 0ach,001h,027h,0adh,002h,026h,013h,000h,046h,053h,003h,047h,02eh,000h,047h,02ch	; b8a0  ..'..&..FS.G..G,
	defb 0ffh,002h,046h,017h,001h,026h,0b0h,003h,027h,0ach,000h,047h,0b5h,002h,046h,056h	; b8b0  ..F..&..'..G..FV
	defb 001h,026h,04dh,003h,027h,06bh,000h,037h,0b7h,002h,036h,096h,000h,036h,03ch,003h	; b8c0  .&M.'k.7..6..6<.
	defb 037h,00ah,001h,037h,057h,003h,037h,041h,002h,037h,013h,000h,037h,03ch,002h,036h	; b8d0  7..7W.7A.7..7<.6
	defb 096h,001h,036h,0afh,003h,037h,06bh,001h,027h,048h,002h,026h,055h,000h,046h,0b5h	; b8e0  ..6..7k.'H.&U.F.
	defb 003h,047h,0abh,001h,027h,0afh,002h,026h,015h,000h,046h,05bh,003h,046h,040h,0ffh	; b8f0  .G..'..&..F[.F@.
	defb 003h,017h,0adh,080h,001h,017h,0b0h,002h,017h,013h,000h,017h,079h,043h,017h,050h	; b900  ............yC.P
	defb 002h,017h,013h,080h,001h,017h,0b0h,003h,017h,0afh,000h,017h,079h,042h,017h,088h	; b910  ............yB..
	defb 0ffh,002h,037h,014h,080h,003h,037h,0aeh,002h,037h,070h,0ffh,001h,047h,054h,082h	; b920  ..7...7..7p..GT.
	defb 043h,047h,08ch,001h,047h,0afh,082h,001h,037h,053h,082h,000h,047h,054h,002h,047h	; b930  CG..G...7S..GT.G
	defb 053h,040h,057h,0aah,0ffh,000h,057h,04fh,003h,058h,054h,041h,058h,089h,002h,058h	; b940  S@W...WO.XTAX..X
	defb 097h,001h,058h,0adh,002h,058h,02eh,000h,058h,065h,002h,057h,019h,001h,057h,089h	; b950  ..X..X..Xe.W..W.
	defb 002h,057h,010h,0ffh,001h,048h,0ach,080h,042h,047h,0a2h,003h,048h,06ch,000h,048h	; b960  .W...H..BG..Hl.H
	defb 05bh,082h,001h,048h,080h,0ffh,095h,0b9h,0a8h,0b9h,0b5h,0b9h,0c5h,0b9h,0cch,0b9h	; b970  [..H............
	defb 0d3h,0b9h,0dah,0b9h,0e1h,0b9h,0e8h,0b9h,0efh,0b9h,0f6h,0b9h,08eh,0b9h,002h,025h	; b980  ...............%
	defb 069h,003h,025h,0a6h,0ffh,001h,027h,055h,002h,026h,0abh,000h,036h,04bh,001h,026h	; b990  i.%...'U.&..6K.&
	defb 055h,003h,027h,015h,000h,027h,02ch,0ffh,002h,046h,076h,001h,046h,0afh,000h,046h	; b9a0  U.'..',..Fv.F..F
	defb 06eh,003h,047h,04eh,0ffh,002h,0b5h,07eh,000h,0b5h,025h,003h,0b5h,0a5h,001h,0b5h	; b9b0  n.GN...~..%.....
	defb 04dh,003h,0b6h,05dh,0ffh,001h,0c7h,0ach,000h,0c7h,029h,0ffh,002h,0b9h,013h,003h	; b9c0  M..]......).....
	defb 0b9h,08ch,0ffh,001h,028h,056h,000h,028h,04ah,0ffh,002h,019h,07ch,003h,019h,0a1h	; b9d0  ....(V.(J...|...
	defb 0ffh,002h,038h,019h,003h,038h,0a9h,0ffh,003h,038h,08ch,002h,037h,010h,0ffh,002h	; b9e0  ..8..8...8..7...
	defb 047h,010h,003h,048h,0ach,0ffh,003h,048h,0a8h,002h,047h,010h,0ffh,037h,0bah,047h	; b9f0  G..H...H..G..7.G
	defb 0bah,047h,0bah,03fh,0bah,03fh,0bah,037h,0bah,03fh,0bah,037h,0bah,037h,0bah,037h	; ba00  .G.?.?.7.?.7.7.7
	defb 0bah,05fh,0bah,037h,0bah,000h,000h,000h,000h,000h,000h,057h,0bah,05bh,0bah,06fh	; ba10  ._.7.......W.[.o
	defb 0bah,053h,0bah,073h,0bah,06bh,0bah,06bh,0bah,069h,0bah,04fh,0bah,04fh,0bah,035h	; ba20  .S.s.k.k.i.O.O.5
	defb 0bbh,03eh,0bbh,0b2h,0bah,0b5h,0bah,097h,0bah,0a4h,0bah,0b2h,0bah,0b5h,0bah,035h	; ba30  .>.............5
	defb 0bbh,03eh,0bbh,0b2h,0bah,0b5h,0bah,097h,0bah,0abh,0bah,0b2h,0bah,0b5h,0bah,0b8h	; ba40  .>..............
	defb 0bah,017h,0bbh,0b8h,0bah,0bbh,0bah,0c1h,0bah,0d2h,0bah,0e4h,0bah,0f2h,0bah,0ffh	; ba50  ................
	defb 0bah,00ah,0bbh,014h,0bbh,0b5h,0bah,0beh,0bah,0beh,0bah,0b8h,0bah,017h,0bbh,0b2h	; ba60  ................
	defb 0bah,0b5h,0bah,0b8h,0bah,017h,0bbh,0b8h,0bah,017h,0bbh,0b8h,0bah,017h,0bbh,014h	; ba70  ................
	defb 0bbh,0b5h,0bah,014h,0bbh,0b5h,0bah,014h,0bbh,0b5h,0bah,014h,0bbh,0b5h,0bah,014h	; ba80  ................
	defb 0bbh,0b5h,0bah,014h,0bbh,0b5h,0bah,081h,003h,003h,007h,002h,00bh,004h,003h,003h	; ba90  ................
	defb 00bh,003h,003h,000h,081h,04ch,003h,04ah,00ch,04ch,000h,081h,04ch,003h,04eh,00ch	; baa0  .....L.J.L..L.N.
	defb 04ch,000h,010h,003h,000h,010h,04ch,000h,010h,007h,000h,010h,049h,000h,010h,00fh	; bab0  L.....L.....I...
	defb 000h,003h,00dh,08dh,003h,00bh,003h,007h,007h,00bh,009h,00ch,00ch,00bh,00dh,00dh	; bac0  ................
	defb 000h,000h,083h,04eh,04ah,04ah,003h,04ch,002h,04bh,084h,04ch,04eh,04bh,04bh,003h	; bad0  ...NJJ.L.K.LNKK.
	defb 04eh,081h,040h,000h,005h,00bh,003h,007h,002h,00ah,086h,003h,00bh,00bh,00ah,00bh	; bae0  N.@.............
	defb 000h,000h,006h,04ch,002h,04ah,002h,047h,003h,04ch,083h,04dh,04ch,040h,000h,081h	; baf0  ...L.J.G.L.ML@..
	defb 00bh,003h,007h,002h,00bh,002h,007h,008h,00bh,000h,081h,04ch,003h,04ah,082h,04ch	; bb00  ...........L.J.L
	defb 047h,00ah,04ch,000h,010h,00bh,000h,010h,048h,000h,085h,007h,00bh,007h,007h,00bh	; bb10  G.L.....H.......
	defb 00bh,007h,086h,048h,04ch,04bh,04ch,04ch,04bh,00ah,048h,000h,00ah,007h,006h,003h	; bb20  ...HLKLLK.H.....
	defb 00ah,048h,006h,04ch,000h,008h,007h,002h,003h,003h,00bh,003h,003h,000h,004h,048h	; bb30  .H.L...........H
	defb 081h,04ah,003h,048h,008h,04ch,000h,008h,00bh,083h,007h,00bh,007h,003h,00bh,002h	; bb40  .J.H.L..........
	defb 003h,004h,04ch,081h,04eh,004h,04ch,084h,047h,048h,047h,047h,003h,04ch,000h,010h	; bb50  ..L.N.L.GHGG.L..
	defb 003h,010h,04ch,000h,003h,000h,006h,00bh,002h,007h,085h,00bh,007h,00bh,007h,007h	; bb60  ..L.............
	defb 003h,040h,003h,04ch,081h,04eh,004h,04ch,085h,047h,04ch,04ch,048h,048h,000h,088h	; bb70  .@.L.N.L.GLLHH..
	defb 00dh,00bh,00bh,00dh,00dh,00bh,003h,00bh,003h,00dh,004h,00bh,08ah,00dh,04eh,04ch	; bb80  ..............NL
	defb 04ch,04bh,04bh,04ch,04ch,04eh,04bh,004h,04eh,083h,04ch,04eh,04bh,000h,008h,00dh	; bb90  LKKLLNK.N.LNK...
	defb 008h,003h,003h,043h,006h,04eh,007h,04ch,000h,0d1h,0bbh,0d1h,0bbh,0e5h,0bbh,0e5h	; bba0  ...C.N.L........
	defb 0bbh,0f9h,0bbh,00dh,0bch,02bh,0bch,02bh,0bch,02bh,0bch,02bh,0bch,02bh,0bch,03fh	; bbb0  .....+.+.+.+.+.?
	defb 0bch,03fh,0bch,03fh,0bch,053h,0bch,053h,0bch,053h,0bch,053h,0bch,053h,0bch,053h	; bbc0  .?.?.S.S.S.S.S.S
	defb 0bch,079h,01ch,004h,005h,040h,01ch,004h,005h,000h,003h,029h,083h,003h,006h,03ah	; bbd0  .y...@.....)...:
	defb 083h,002h,006h,001h,002h,01eh,010h,002h,009h,01eh,0b0h,002h,009h,003h,001h,020h	; bbe0  ...............
	defb 0a7h,005h,009h,0b0h,0a7h,005h,009h,001h,002h,050h,087h,005h,006h,018h,087h,005h	; bbf0  .........P......
	defb 006h,000h,002h,0b0h,01bh,003h,008h,018h,01bh,004h,008h,000h,003h,01bh,09bh,004h	; bc00  ................
	defb 006h,03bh,09bh,003h,006h,001h,003h,012h,01bh,002h,006h,079h,01bh,002h,006h,001h	; bc10  ...........y....
	defb 003h,090h,09bh,003h,006h,070h,09bh,002h,006h,001h,003h,015h,01ah,001h,007h,07ah	; bc20  .....p.........z
	defb 01ah,001h,007h,001h,003h,05ah,0a9h,001h,007h,015h,0a9h,001h,007h,000h,002h,01eh	; bc30  .....Z..........
	defb 089h,004h,006h,01eh,039h,004h,007h,003h,001h,07eh,020h,004h,008h,07eh,0a9h,004h	; bc40  ....9....~ ..~..
	defb 007h,002h,001h	; bc50

; ======================================================================
; CODIGO 0xbc53..0xbc64  (17 bytes)
; ======================================================================


L_BC53:
	call L_BC5E		;bc53
	ld a,(0e1f0h)		;bc56
	or a			;bc59
	ret z			;bc5a
	jp L_BE09		;bc5b
L_BC5E:
	ld a,(0e1f1h)		;bc5e
	call 0424dh		;bc61   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_BC64: 9 destinos del despachador p00:424D (call en p08:BC61, el
;   indice en A): BC76, BCBB, BCC2, BD1F, BD32, BD53, BD7A, BD85, BDA7; lo
;   leen p08:BC61 (18 bytes)
;   0xbc64..0xbc76  (18 bytes)
DATA_tabla_BC64:
	defw 0bc76h,0bcbbh,0bcc2h,0bd1fh,0bd32h,0bd53h,0bd7ah,0bd85h	; bc64
	defw 0bda7h	; bc74  -> L_BDA7

; ======================================================================
; CODIGO 0xbc76..0xbd14  (158 bytes)
; ======================================================================


L_BC76:
	ld a,0ffh		;bc76
	ld (0e1f3h),a		;bc78
	ld hl,0caf0h		;bc7b
	ld (hl),001h		;bc7e
	call 045f1h		;bc80   ; apaga_pantalla_y_sprites: p00:45CC y p00:45F6
	call 04d16h		;bc83   ; dibujos_7118_bancos_8:
	call 04266h		;bc86   ; esconde_sprites_ram: llena 0xDC00-0xDC7F con 0xE0
	call 045d7h		;bc89   ; esconde_sprites_vram: llena con 0xE0 128 bytes de la VRAM en 0xF600 y otros 128 en 0xF200
	call 07072h		;bc8c   ; p01:7072
	call 084f4h		;bc8f   ; p02:84F4
	ld hl,00000h		;bc92
	ld d,h			;bc95
	ld e,l			;bc96
	ld bc,0c0c0h		;bc97
	call 0475ah		;bc9a   ; copia_rectangulo_a_la_otra: p00:4767 de la pagina 0xCA42 a la otra
	ld de,060a8h		;bc9d
	ld hl,0cb03h		;bca0
	ld (hl),e			;bca3
	inc hl			;bca4
	inc hl			;bca5
	ld (hl),d			;bca6
	call 05febh		;bca7   ; p00:5FEB
	call 0439dh		;bcaa   ; lineas_c3: las lineas de las listas de p00:43C8 (verticales) y p00:43E3 (horizontales), de 0x3A de largo en el color 0x0D
	call 0437eh		;bcad   ; copia_marcador_a_la_otra: copia las lineas 0x16-0x51 de la pagina en la que se dibuja a la otra (YMMM)
	call 04650h		;bcb0   ; espera_vdp: espera a que el VDP acabe la orden en curso (S#2 bit 0)
	call 04606h		;bcb3   ; enciende_todo: la pantalla y los sprites encendidos
L_BCB6:
	ld hl,0e1f1h		;bcb6
	inc (hl)			;bcb9
	ret			;bcba
L_BCBB:
	ld a,070h		;bcbb
	ld (0e1f3h),a		;bcbd
	jr L_BCB6		;bcc0
L_BCC2:
	ld hl,03024h		;bcc2
	ld bc,06010h		;bcc5
	push hl			;bcc8
	push bc			;bcc9
	call L_BCE2		;bcca
	pop bc			;bccd
	pop hl			;bcce
	call L_BCFF		;bccf
	ld hl,0bd14h		;bcd2
	ld de,03828h		;bcd5
	call 04950h		;bcd8   ; letrero: pinta las letras de HL en DE hasta 0xFF (0xFE salta de linea)
	ld hl,0e1f2h		;bcdb
	ld (hl),040h		;bcde
	jr L_BCB6		;bce0
L_BCE2:
	ld de,030e0h		;bce2
	ld a,(0ca42h)		;bce5   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	and 001h		;bce8
L_BCEA:
	jp 04767h		;bcea   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
L_BCED:
	ld de,03024h		;bced
	ld hl,030e0h		;bcf0
	ld bc,06010h		;bcf3
	ld a,(0ca42h)		;bcf6   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	rlca			;bcf9
	rlca			;bcfa
	and 00ch		;bcfb
	jr L_BCEA		;bcfd
L_BCFF:
	ld a,(0ca42h)		;bcff   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	ld d,a			;bd02
	ld a,099h		;bd03
	push hl			;bd05
	push bc			;bd06
	call 046ffh		;bd07   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
	pop de			;bd0a
	pop hl			;bd0b
	ld a,(0ca42h)		;bd0c   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	ld c,007h		;bd0f
	jp 046bch		;bd11   ; marco: cuatro lineas: un marco de D x E desde HL

; ----------------------------------------------------------------------
; DATOS resto_BD14: lo apuntan con el banco puesto p08:BCD2 (0xBD14); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p08:BCD2 (11 bytes)
;   0xbd14..0xbd1f  (11 bytes)
DATA_resto_BD14:
	defb 026h,026h,05ch,0e6h,026h,071h,037h,02ch,04eh,0e0h,0ffh	; bd14  &&\.&q7,N..

; ======================================================================
; CODIGO 0xbd1f..0xbd74  (85 bytes)
; ======================================================================


L_BD1F:
	ld hl,0e1f2h		;bd1f
	dec (hl)			;bd22
	ret nz			;bd23
	ld hl,0e1f2h		;bd24
	ld (hl),0f0h		;bd27
	call L_BCED		;bd29
	call 06ab7h		;bd2c   ; p01:6AB7
	jp L_BCB6		;bd2f
L_BD32:
	call L_BD45		;bd32
	ld hl,0e1f2h		;bd35
	dec (hl)			;bd38
	ret nz			;bd39
	ld b,000h		;bd3a
	call L_BD4E		;bd3c
	call 06abbh		;bd3f   ; p01:6ABB
	jp L_BCB6		;bd42
L_BD45:
	ld a,(0ca03h)		;bd45   ; lee el contador de cuadros (uno mas en cada interrupcion)
	rra			;bd48
	and 001h		;bd49
	rrca			;bd4b
	rrca			;bd4c
	ld b,a			;bd4d
L_BD4E:
	ld c,012h		;bd4e
	jp 00047h		;bd50   ; BIOS WRTVDP - Writes data in the VDP-register
L_BD53:
	ld hl,03024h		;bd53
	ld bc,06010h		;bd56
	push hl			;bd59
	push bc			;bd5a
	call L_BCE2		;bd5b
	pop bc			;bd5e
	pop hl			;bd5f
	call L_BCFF		;bd60
	ld hl,0bd74h		;bd63
	ld de,04828h		;bd66
	call 04950h		;bd69   ; letrero: pinta las letras de HL en DE hasta 0xFF (0xFE salta de linea)
	ld hl,0e1f2h		;bd6c
	ld (hl),040h		;bd6f
	jp L_BCB6		;bd71

; ----------------------------------------------------------------------
; DATOS resto_BD74: lo apuntan con el banco puesto p08:BD63 (0xBD74); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p08:BD63 (6 bytes)
;   0xbd74..0xbd7a  (6 bytes)
DATA_resto_BD74:
	defb 036h,026h,034h,05ch,0e0h,0ffh	; bd74

; ======================================================================
; CODIGO 0xbd7a..0xbe7d  (259 bytes)
; ======================================================================


L_BD7A:
	ld hl,0e1f2h		;bd7a
	dec (hl)			;bd7d
	ret nz			;bd7e
	call L_BCED		;bd7f
	jp L_BCB6		;bd82
L_BD85:
	call L_BDFA		;bd85
	ld hl,0e1f3h		;bd88
	inc (hl)			;bd8b
	call L_BD9B		;bd8c
	ld a,(hl)			;bd8f
	cp 0b8h		;bd90
	ret c			;bd92
	ld hl,0e1f2h		;bd93
	ld (hl),040h		;bd96
	jp L_BCB6		;bd98
L_BD9B:
	ld a,(0cb03h)		;bd9b
	sub 016h		;bd9e
	cp (hl)			;bda0
	ret nc			;bda1
	ld hl,0cb03h		;bda2
	inc (hl)			;bda5
	ret			;bda6
L_BDA7:
	ld hl,0e1f2h		;bda7
	dec (hl)			;bdaa
	ret nz			;bdab
	xor a			;bdac
	ld (0e1f0h),a		;bdad
	ld a,0ffh		;bdb0
	ld (0e1f3h),a		;bdb2
	ld a,(0ca76h)		;bdb5   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 032h		;bdb8
	jr z,L_BDD3		;bdba
	ld hl,0ca50h		;bdbc
	ld (hl),001h		;bdbf
	inc l			;bdc1
	ld (hl),008h		;bdc2
	ld a,05fh		;bdc4
	ld (0cb03h),a		;bdc6
	ld a,080h		;bdc9
	ld (0cb05h),a		;bdcb
	ld a,009h		;bdce
	jp 08de3h		;bdd0   ; p02:8DE3
L_BDD3:
	xor a			;bdd3
	ld (0ca76h),a		;bdd4   ; guarda la sala especial (0 = ninguna; indice de p24:64B6)
	ld hl,0ca50h		;bdd7
	ld (hl),003h		;bdda
	inc l			;bddc
	ld (hl),008h		;bddd
	ld a,040h		;bddf
	ld (0cb03h),a		;bde1
	ld a,090h		;bde4
	ld (0cb05h),a		;bde6
	ld a,00ah		;bde9
	call 08de3h		;bdeb
	ld hl,00c30h		;bdee
	ld (0d418h),hl		;bdf1
	ld a,004h		;bdf4
	ld (0d41eh),a		;bdf6
	ret			;bdf9
L_BDFA:
	ld a,(0ca03h)		;bdfa   ; lee el contador de cuadros (uno mas en cada interrupcion)
	and 007h		;bdfd
	ret nz			;bdff
	ld a,(0dfd2h)		;be00
	xor 001h		;be03
	ld (0dfd2h),a		;be05
	ret			;be08
L_BE09:
	call L_BE0E		;be09
	jr L_BE35		;be0c
L_BE0E:
	ld hl,0dc40h		;be0e
	ld a,(0e1f3h)		;be11
	sub 020h		;be14
	ld e,a			;be16
	ld d,058h		;be17
	ld c,058h		;be19
	call 05d41h		;be1b   ; pon_sprite: [E][D][C] en (HL): la Y, la X y el patron de un sprite de 0xDC00
	call 05d3dh		;be1e   ; pon_sprite_mas_4: p00:5D41 con el patron C + 4
	ld a,e			;be21
	add a,010h		;be22
	ld e,a			;be24
	ld a,(0dfd2h)		;be25
	or a			;be28
	jr z,L_BE2D		;be29
	ld a,008h		;be2b
L_BE2D:
	add a,c			;be2d
	ld c,a			;be2e
	call 05d3dh		;be2f   ; pon_sprite_mas_4: p00:5D41 con el patron C + 4
	jp 05d3dh		;be32   ; pon_sprite_mas_4: p00:5D41 con el patron C + 4
L_BE35:
	ld de,0ba97h		;be35
	ld hl,0db00h		;be38
	call 08de8h		;be3b   ; p02:8DE8
	ld de,0baa4h		;be3e
	ld hl,0db10h		;be41
	call 08de8h		;be44
	ld de,0bab2h		;be47
	ld hl,0db20h		;be4a
	call 08de8h		;be4d
	ld de,0bab5h		;be50
	ld hl,0db30h		;be53
	call 08de8h		;be56
	ld de,0ba97h		;be59
	ld hl,0db40h		;be5c
	call 08de8h		;be5f
	ld de,0baa4h		;be62
	ld hl,0db50h		;be65
	call 08de8h		;be68
	ld de,0bab2h		;be6b
	ld hl,0db60h		;be6e
	call 08de8h		;be71
	ld de,0bab5h		;be74
	ld hl,0db70h		;be77
	jp 08de8h		;be7a

; ----------------------------------------------------------------------
; DATOS resto_BE7D: lo apuntan con el banco puesto p02:86E7 (0xBE7D), p02:8698
;   (0xBF7D), p08:A4C5 (0xBF7D), p08:A4E2 (0xBF7D), p02:8735 (0xBFBD),
;   p02:8745 (0xBFC9); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p02:86E7, p02:8698, p08:A4C5, p08:A4E2, p02:8735,
;   p02:8745 (387 bytes)
;   0xbe7d..0xc000  (387 bytes)
DATA_resto_BE7D:
	defb 020h,00dh,008h,006h,004h,004h,003h,003h,002h,002h,002h,002h,001h,001h,001h,001h	; be7d   ...............
	defb 033h,020h,016h,010h,00dh,00bh,009h,008h,007h,006h,006h,005h,005h,004h,004h,004h	; be8d  3 ..............
	defb 038h,02ah,020h,019h,015h,011h,00fh,00dh,00ch,00ah,009h,009h,008h,007h,007h,006h	; be9d  8* .............
	defb 03ah,02fh,027h,020h,01bh,017h,014h,012h,010h,00eh,00dh,00ch,00bh,00ah,00ah,009h	; bead  :/' ............
	defb 03bh,033h,02bh,025h,020h,01ch,019h,016h,014h,012h,010h,00fh,00eh,00dh,00ch,00bh	; bebd  .3+% ...........
	defb 03ch,035h,02eh,029h,024h,020h,01ch,01ah,017h,015h,014h,012h,011h,010h,00fh,00eh	; becd  <5.)$ ..........
	defb 03dh,037h,031h,02ch,027h,023h,020h,01dh,01ah,018h,016h,015h,013h,012h,011h,010h	; bedd  =71,'# .........
	defb 03dh,038h,033h,02eh,02ah,026h,023h,020h,01dh,01bh,019h,017h,016h,015h,013h,012h	; beed  =83.*&# ........
	defb 03dh,039h,034h,030h,02ch,028h,025h,022h,020h,01eh,01ch,01ah,018h,017h,015h,014h	; befd  =940,(%" .......
	defb 03eh,039h,035h,031h,02eh,02ah,027h,025h,022h,020h,01eh,01ch,01ah,019h,017h,016h	; bf0d  >951.*'%" ......
	defb 03eh,03ah,036h,033h,02fh,02ch,029h,027h,024h,022h,020h,01eh,01ch,01bh,019h,018h	; bf1d  >:63/,)'$" .....
	defb 03eh,03bh,037h,034h,031h,02eh,02bh,028h,026h,024h,022h,020h,01eh,01dh,01bh,01ah	; bf2d  >.741.+(&$" ....
	defb 03eh,03bh,038h,035h,032h,02fh,02ch,02ah,028h,025h,023h,022h,020h,01eh,01dh,01ch	; bf3d  >.852/,*(%#" ...
	defb 03eh,03bh,038h,036h,033h,030h,02eh,02bh,029h,027h,025h,023h,021h,020h,01eh,01dh	; bf4d  >.8630.+)'%#! ..
	defb 03eh,03ch,039h,036h,034h,031h,02fh,02ch,02ah,028h,026h,025h,023h,021h,020h,01eh	; bf5d  ><9641/,*(&%#! .
	defb 03fh,03ch,039h,037h,034h,032h,030h,02dh,02bh,029h,028h,026h,024h,023h,021h,020h	; bf6d  ?<97420-+)(&$#!
	defb 000h,006h,00ch,012h,019h,01fh,026h,02ch,032h,038h,03eh,044h,04ah,050h,056h,05ch	; bf7d  ......&,28>DJPV\
	defb 062h,068h,06dh,073h,079h,07eh,084h,089h,08eh,093h,099h,09eh,0a2h,0a7h,0ach,0b1h	; bf8d  bhmsy~..........
	defb 0b5h,0b9h,0beh,0c2h,0c6h,0cah,0ceh,0d1h,0d5h,0d8h,0dch,0dfh,0e2h,0e5h,0e7h,0eah	; bf9d  ................
	defb 0edh,0efh,0f1h,0f3h,0f5h,0f7h,0f8h,0fah,0fbh,0fch,0fdh,0feh,0feh,0ffh,0ffh,0ffh	; bfad  ................
	defb 000h,001h,0f7h,000h,0ddh,000h,0b5h,000h,080h,000h,042h,000h,000h,000h,0beh,0ffh	; bfbd  ..........B.....
	defb 080h,0ffh,04bh,0ffh,023h,0ffh,009h,0ffh,000h,0ffh,009h,0ffh,023h,0ffh,04bh,0ffh	; bfcd  ..K.#.......#.K.
	defb 080h,0ffh,0beh,0ffh,000h,000h,042h,000h,080h,000h,0b5h,000h,0ddh,000h,0f7h,000h	; bfdd  ......B.........
	defb 000h,001h,0f7h,000h,0ddh,000h,0b5h,000h,080h,000h,042h,000h,0c0h,021h,0a4h,0d8h	; bfed  ..........B..!..
	defb 0c3h,0e5h,0b3h	; bffd
