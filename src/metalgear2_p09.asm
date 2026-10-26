; ==========================================================================
; METAL GEAR 2 SOLID SNAKE - Konami (1990) - MSX2 - MegaROM RC-767 de 512 KB (Konami SCC) - banco 09 (se ejecuta en 0xa000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x0a000


; ======================================================================
; CODIGO 0xa000..0xa09d  (157 bytes)
; ======================================================================


L_A000:
	ld a,(0cb21h)		;a000   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	cp 009h		;a003
	ret nz			;a005
	ld a,(0ca4ah)		;a006   ; lee la zona
	cp 00dh		;a009
	ret nz			;a00b
	ld a,(0ca4bh)		;a00c   ; lee la sala de la zona
	cp 005h		;a00f
	ret nz			;a011
	ld a,(0e1d5h)		;a012
	or a			;a015
	ret z			;a016
	ld a,(0ca61h)		;a017
	dec a			;a01a
	ret nz			;a01b
	ld a,(0cb03h)		;a01c   ; lee la Y de Snake
	cp 028h		;a01f
	ret nc			;a021
	ld a,(0ca08h)		;a022   ; lee el mando: joystick y teclado juntos (bits 0-3 las direcciones, 4-5 los disparos)
	and 001h		;a025
	ret z			;a027
	call 07cb5h		;a028   ; quita_ca5f_bancos_9:
	call 06cc6h		;a02b   ; sonido_8b: pide el sonido 0x8B (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld hl,0ca50h		;a02e   ; apunta a la fila de la sala en la zona (uno mas al salir por arriba)
	ld (hl),001h		;a031
	inc hl			;a033
	ld (hl),006h		;a034
	ld hl,0d7ddh		;a036
	res 2,(hl)		;a039
	xor a			;a03b
	ld (0cb39h),a		;a03c
	ld a,00ah		;a03f
	call 08e11h		;a041   ; cambia_de_zona_b_1_2_9: cambia_de_zona y deja los bancos 1, 2 y 9
	ld a,001h		;a044
	ld (0ca18h),a		;a046   ; guarda la espera hasta poner la musica pendiente
	ld hl,06b45h		;a049
	ld (0ca19h),hl		;a04c   ; guarda la musica pendiente: la rutina que la pide (16 bits)
	ld a,004h		;a04f
	ld (0cb00h),a		;a051   ; guarda el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	xor a			;a054
	ld (0d4eah),a		;a055
	call L_A070		;a058
	call L_A061		;a05b
	jp 06f56h		;a05e   ; rachas_ba0f: las rachas de p41:BA0F
L_A061:
	ld hl,0e1d0h		;a061
	ld (hl),001h		;a064
	inc hl			;a066
	ld (hl),000h		;a067
	inc hl			;a069
	ld (hl),0c4h		;a06a
	inc hl			;a06c
	ld (hl),040h		;a06d
L_A06F:
	ret			;a06f
L_A070:
	ld hl,0dc00h		;a070   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	ld a,0e0h		;a073
	ld bc,0000fh		;a075
	jp 04237h		;a078   ; llena_bloque: pone A en BC + 1 bytes desde HL
L_A07B:
	ld a,(0ca4ah)		;a07b   ; lee la zona
	cp 00ah		;a07e
	ret nz			;a080
	ld a,(0e1d0h)		;a081
	or a			;a084
	ret z			;a085
	call L_A093		;a086
	ld a,(0e1d0h)		;a089
	or a			;a08c
	call nz,L_A06F		;a08d
	jp 08eaeh		;a090   ; a_p11_bf0f: p11:BF0F con el banco 11 en 0xA000
L_A093:
	ld hl,0d4eah		;a093
	inc (hl)			;a096
	ld a,(0e1d1h)		;a097
	call 0424dh		;a09a   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_A09D: 4 destinos del despachador p00:424D (call en p09:A09A, el
;   indice en A): A0A5, A0F2, A0FE, A110; lo leen p09:A09A (8 bytes)
;   0xa09d..0xa0a5  (8 bytes)
DATA_tabla_A09D:
	defw 0a0a5h,0a0f2h,0a0feh,0a110h	; a09d  -> L_A0A5 L_A0F2 L_A0FE L_A110

; ======================================================================
; CODIGO 0xa0a5..0xa5d4  (1327 bytes)
; ======================================================================


L_A0A5:
	ld a,(0ca4bh)		;a0a5   ; lee la sala de la zona
	cp 007h		;a0a8
	jr z,L_A0C1		;a0aa
	call L_A0C6		;a0ac
	call L_A0E4		;a0af
	ld a,(hl)			;a0b2
	cp 0cch		;a0b3
	ret c			;a0b5
	cp 0d1h		;a0b6
	ret nc			;a0b8
	ld (hl),0c8h		;a0b9
	ld a,001h		;a0bb
	ld (0ca41h),a		;a0bd   ; guarda la salida de la sala (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ret			;a0c0
L_A0C1:
	ld hl,0e1d1h		;a0c1
	inc (hl)			;a0c4
	ret			;a0c5
L_A0C6:
	ld hl,0e1d3h		;a0c6
	ld a,(0d4eah)		;a0c9
	rla			;a0cc
	rla			;a0cd
	rla			;a0ce
	jr c,L_A0D5		;a0cf
	ld b,004h		;a0d1
	jr L_A0E9		;a0d3
L_A0D5:
	ld b,0fch		;a0d5
	jr L_A0E9		;a0d7
L_A0D9:
	ld b,0feh		;a0d9
	ld hl,0e1d3h		;a0db
	jr L_A0E9		;a0de
L_A0E0:
	ld b,003h		;a0e0
	jr L_A0E6		;a0e2
L_A0E4:
	ld b,0fdh		;a0e4
L_A0E6:
	ld hl,0e1d2h		;a0e6
L_A0E9:
	ld a,(0d4eah)		;a0e9
	rra			;a0ec
	ret c			;a0ed
	ld a,(hl)			;a0ee
	add a,b			;a0ef
	ld (hl),a			;a0f0
	ret			;a0f1
L_A0F2:
	call L_A0C6		;a0f2
	call L_A0E4		;a0f5
	ld a,(hl)			;a0f8
	cp 078h		;a0f9
	ret nc			;a0fb
	jr L_A0C1		;a0fc
L_A0FE:
	call L_A0E0		;a0fe
	call L_A0D9		;a101
	ld a,(0e1d2h)		;a104
	cp 0c0h		;a107
	ret c			;a109
	call L_A0C1		;a10a
	jp 06b5dh		;a10d   ; sonido_5b: pide el sonido 0x5B
L_A110:
	ld hl,0c696h		;a110
	ld a,(hl)			;a113
	or a			;a114
	ret z			;a115
	xor a			;a116
	ld (hl),a			;a117
	ld hl,0d658h		;a118
	ld (hl),a			;a11b
	inc hl			;a11c
	ld (hl),a			;a11d
	inc hl			;a11e
	ld (hl),a			;a11f
	ld hl,0e1d0h		;a120
	ld (hl),a			;a123
	ld hl,0cb02h		;a124   ; apunta a la Y de Snake: la parte fraccionaria (0xCB02-0xCB03 en 8.8)
	ld (hl),a			;a127
	inc hl			;a128
	ld (hl),0ffh		;a129
	ld hl,0cb00h		;a12b   ; apunta a el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	ld (hl),015h		;a12e
	ld hl,0cb0dh		;a130   ; apunta a la direccion pedida con el mando (1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ld a,001h		;a133
	ld (hl),a			;a135
	inc hl			;a136
	ld (hl),a			;a137
	ld hl,0d7d5h		;a138
	set 2,(hl)		;a13b
	inc hl			;a13d
	set 2,(hl)		;a13e
	ld hl,0d7dbh		;a140
	res 3,(hl)		;a143
	ld hl,0d7e0h		;a145
	res 6,(hl)		;a148
	ld hl,0d7ddh		;a14a
	set 2,(hl)		;a14d
	call 04e1ch		;a14f   ; sprites_de_sala_bancos_9:
	call 085a4h		;a152   ; rachas_b007_af4c_bancos_1_2_9:
	ld hl,0d8a4h		;a155
	call 08c42h		;a158   ; p02:8C42
	ld hl,0ca22h		;a15b   ; apunta a la fase de la partida (indice de las listas de p06:B40C)
	ld (hl),007h		;a15e
	jp 06b85h		;a160   ; sonido_7d: pide el sonido 0x7D (de los que tienen la partitura en un banco de musica, p16:4CE3)
L_A163:
	ld a,(0e040h)		;a163
	or a			;a166
	ret nz			;a167
	call L_A258		;a168
	call L_A2EB		;a16b
	ld a,(0d7d3h)		;a16e
	and 060h		;a171
	ret nz			;a173
	ld a,(0dfd8h)		;a174
	or a			;a177
	call nz,L_A196		;a178
	ld hl,0dfd8h		;a17b
	ld (hl),000h		;a17e
	call L_A434		;a180
	ret nz			;a183
	ld hl,0dfd8h		;a184
	ld de,06070h		;a187
	ld bc,00201h		;a18a
	call L_A4CD		;a18d
	call 0864ah		;a190   ; rachas_b3a6:
	jp 08c5ah		;a193   ; a_p03_b5b5: p03:B5B5 con el banco 3 en 0xA000
L_A196:
	call 06f72h		;a196   ; rachas_9638_bancos_9:
	ld a,(0cb21h)		;a199   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	dec a			;a19c
	jp z,0858dh		;a19d   ; rachas_b34a_bancos_9:
	ret			;a1a0
L_A1A1:
	ld a,(0e040h)		;a1a1
	or a			;a1a4
	ret nz			;a1a5
	call L_A27C		;a1a6
	call L_A2BC		;a1a9
	call L_A304		;a1ac
	call L_A353		;a1af
	call L_A3B1		;a1b2
	call L_A3F2		;a1b5
	call L_A440		;a1b8
	call L_A47D		;a1bb
	ld a,(0d7d0h)		;a1be   ; lee las banderas de la partida: la n en el bit 7 - n % 8 del byte n / 8 (p03:B0DC, p03:B0F6)
	bit 4,a		;a1c1
	ret z			;a1c3
	ld a,(0e040h)		;a1c4
	or a			;a1c7
	ret nz			;a1c8
	ld a,(0d7d1h)		;a1c9
	bit 5,a		;a1cc
	ret nz			;a1ce
	ld a,(0ca4ah)		;a1cf   ; lee la zona
	cp 011h		;a1d2
	ret nz			;a1d4
	ld a,(0ca4bh)		;a1d5   ; lee la sala de la zona
	cp 005h		;a1d8
	ret nz			;a1da
	ld hl,(0cad8h)		;a1db
	ld a,h			;a1de
	or l			;a1df
	jr z,L_A1E7		;a1e0
	dec hl			;a1e2
	ld (0cad8h),hl		;a1e3
	ret			;a1e6
L_A1E7:
	ld hl,0cb75h		;a1e7
	ld a,(hl)			;a1ea
	or a			;a1eb
	jr nz,L_A1F0		;a1ec
	ld (hl),001h		;a1ee
L_A1F0:
	call 07b7fh		;a1f0   ; a_p04_92eb: p04:92EB con el banco 4 en 0x8000
	ld hl,0cb75h		;a1f3
	ld a,(hl)			;a1f6
	cp 002h		;a1f7
	jr nz,L_A1FF		;a1f9
	xor a			;a1fb
	ld (0cb55h),a		;a1fc
L_A1FF:
	ld a,(0cb76h)		;a1ff
	or a			;a202
	ret z			;a203
	call L_A239		;a204
	ret c			;a207
	xor a			;a208
	ld (0cb16h),a		;a209   ; guarda 1 mientras Snake se da la vuelta
	inc a			;a20c
	ld (0cb14h),a		;a20d   ; guarda el dibujo del paso de andar (0, 1, 2, 1: p02:9888)
	ld (0d8a8h),a		;a210   ; guarda 1: la ventana del mensaje es estrecha (0xB8 x 0x28)
	ld hl,0cb00h		;a213   ; apunta a el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	ld (hl),a			;a216
	inc hl			;a217
	ld (hl),a			;a218
	ld a,00ah		;a219
	call 08c7ah		;a21b   ; a_p03_b0dc: p03:B0DC con el banco 3 en 0xA000
	ld c,009h		;a21e
	call L_A4A6		;a220
	ld hl,0dc68h		;a223
	ld a,0e0h		;a226
	ld bc,00017h		;a228
	call 04237h		;a22b   ; llena_bloque: pone A en BC + 1 bytes desde HL
	ld hl,0e043h		;a22e
	ld (hl),020h		;a231
	call 06b12h		;a233   ; sonido_05: pide el sonido 0x05
	jp 08c92h		;a236   ; a_p03_b603: p03:B603 con el banco 3 en 0xA000
L_A239:
	push ix		;a239
	call L_A241		;a23b
	pop ix		;a23e
	ret			;a240
L_A241:
	ld ix,0cb80h		;a241   ; apunta a las 6 fichas de 16 bytes de lo que lanza Snake ([tipo][..][Y 8.8][X 8.8][velocidades]...)
	ld b,006h		;a245
L_A247:
	ld a,(ix+000h)		;a247
	or a			;a24a
	jr z,L_A24F		;a24b
	scf			;a24d
	ret			;a24e
L_A24F:
	ld de,00010h		;a24f
	add ix,de		;a252
	djnz L_A247		;a254
	or a			;a256
	ret			;a257
L_A258:
	ld a,(0cb21h)		;a258   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	cp 002h		;a25b
	ret nz			;a25d
	ld a,(0d7d5h)		;a25e
	bit 7,a		;a261
	ret nz			;a263
	ld hl,0e248h		;a264   ; apunta a la ficha del que sigue a Snake 12 posiciones por detras (0xE0A4)
	ld (hl),000h		;a267
	call L_A2B0		;a269
	ret nz			;a26c
	ld hl,0e248h		;a26d   ; apunta a la ficha del que sigue a Snake 12 posiciones por detras (0xE0A4)
	ld de,01060h		;a270
	ld bc,00301h		;a273
	call L_A4CD		;a276
	jp 08c4ah		;a279   ; a_p03_b563: p03:B563 con el banco 3 en 0xA000
L_A27C:
	ld a,(0d7d5h)		;a27c
	bit 7,a		;a27f
	ret nz			;a281
	call L_A2B0		;a282
	ret nz			;a285
	ld a,028h		;a286
	call 08c7ah		;a288   ; a_p03_b0dc: p03:B0DC con el banco 3 en 0xA000
	ld hl,0d7deh		;a28b
	res 3,(hl)		;a28e
	ld hl,0e248h		;a290   ; apunta a la ficha del que sigue a Snake 12 posiciones por detras (0xE0A4)
	ld de,01060h		;a293
	ld bc,00301h		;a296
	call L_A4CD		;a299
	call 08c4ah		;a29c   ; a_p03_b563: p03:B563 con el banco 3 en 0xA000
	ld a,002h		;a29f
	ld (0cb0eh),a		;a2a1   ; guarda la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	dec a			;a2a4
	ld hl,0d8a8h		;a2a5   ; apunta a 1: la ventana del mensaje es estrecha (0xB8 x 0x28)
	ld (hl),a			;a2a8
	ld c,a			;a2a9
	call L_A4A6		;a2aa
	jp 08c82h		;a2ad   ; a_p03_b607: p03:B607 con el banco 3 en 0xA000
L_A2B0:
	ld a,(0ca76h)		;a2b0   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 02ah		;a2b3
	ret nz			;a2b5
	ld a,(0ca51h)		;a2b6   ; lee la columna de la sala en la zona (uno mas al salir por la derecha)
	cp 008h		;a2b9
	ret			;a2bb
L_A2BC:
	ld a,(0d7d5h)		;a2bc
	rla			;a2bf
	rla			;a2c0
	ret c			;a2c1
	ld a,(0caa0h)		;a2c2   ; lee cuantos siguen a Snake por su rastro (1-4)
	cp 002h		;a2c5
	ret nz			;a2c7
	ld a,(0ca4ah)		;a2c8   ; lee la zona
	cp 008h		;a2cb
	ret nz			;a2cd
	ld a,(0ca4bh)		;a2ce   ; lee la sala de la zona
	cp 00ch		;a2d1
	ret nz			;a2d3
	ld a,029h		;a2d4
	call 08c7ah		;a2d6   ; a_p03_b0dc: p03:B0DC con el banco 3 en 0xA000
	ld a,001h		;a2d9
	ld (0cb0eh),a		;a2db   ; guarda la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ld c,002h		;a2de
	call L_A4A6		;a2e0
	ld a,001h		;a2e3
	ld (0d8a8h),a		;a2e5   ; guarda 1: la ventana del mensaje es estrecha (0xB8 x 0x28)
	jp 08c8ah		;a2e8   ; a_p03_b610: p03:B610 con el banco 3 en 0xA000
L_A2EB:
	ld a,(0cb21h)		;a2eb   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	cp 002h		;a2ee
	ret z			;a2f0
	call L_A341		;a2f1
	ret nz			;a2f4
	ld hl,0e240h		;a2f5   ; apunta a la ficha del que sigue a Snake 4 posiciones por detras (del rastro de 0xE08C)
	ld de,04d9dh		;a2f8
	ld bc,00201h		;a2fb
	call L_A4CD		;a2fe
	jp 08c52h		;a301   ; a_p03_b4e6: p03:B4E6 con el banco 3 en 0xA000
L_A304:
	ld a,(0d4f3h)		;a304
	or a			;a307
	ret nz			;a308
	call L_A341		;a309
	ret nz			;a30c
	ld a,(0cb03h)		;a30d   ; lee la Y de Snake
	cp 094h		;a310
	ret c			;a312
	cp 0a4h		;a313
	ret nc			;a315
	ld a,(0cb05h)		;a316   ; lee la X de Snake
	cp 03ch		;a319
	ret c			;a31b
	cp 065h		;a31c
	ret nc			;a31e
	xor a			;a31f
	ld (0d4e4h),a		;a320
	ld c,003h		;a323
	call L_A4A6		;a325
	ld a,(0cb0eh)		;a328   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	dec a			;a32b
	xor 001h		;a32c
	inc a			;a32e
	ld hl,0e246h		;a32f
	ld (hl),a			;a332
	ld a,001h		;a333
	ld (0d4f3h),a		;a335
	call 08c9ah		;a338   ; a_p03_b5ff: p03:B5FF con el banco 3 en 0xA000
	call L_A4B9		;a33b
	jp L_A571		;a33e
L_A341:
	ld a,(0d7d4h)		;a341
	bit 1,a		;a344
	ret nz			;a346
	ld a,(0ca76h)		;a347   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 018h		;a34a
	ret nz			;a34c
	ld a,(0ca51h)		;a34d   ; lee la columna de la sala en la zona (uno mas al salir por la derecha)
	cp 008h		;a350
	ret			;a352
L_A353:
	ld a,(0d7d5h)		;a353
	bit 6,a		;a356
	ret z			;a358
	bit 4,a		;a359
	ret nz			;a35b
	ld a,(0ca4ah)		;a35c   ; lee la zona
	cp 00ah		;a35f
	ret nz			;a361
	ld a,(0ca4bh)		;a362   ; lee la sala de la zona
	cp 004h		;a365
	ret nz			;a367
	ld hl,0e240h		;a368   ; apunta a la ficha del que sigue a Snake 4 posiciones por detras (del rastro de 0xE08C)
	ld de,064bch		;a36b
	ld bc,00101h		;a36e
	call L_A4CD		;a371
	ld hl,0e248h		;a374   ; apunta a la ficha del que sigue a Snake 12 posiciones por detras (0xE0A4)
	ld d,084h		;a377
	call L_A4CD		;a379
	ld a,e			;a37c
	push af			;a37d
	call 05f51h		;a37e   ; a_p12_6d78_b_9: a_p12_6d78 y deja el banco 9
	pop af			;a381
	ld (0cb03h),a		;a382   ; guarda la Y de Snake
	ld a,074h		;a385
	ld (0cb05h),a		;a387   ; guarda la X de Snake
	ld a,001h		;a38a
	ld (0cb0eh),a		;a38c   ; guarda la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ld (0cb14h),a		;a38f   ; guarda el dibujo del paso de andar (0, 1, 2, 1: p02:9888)
	ld (0d8a8h),a		;a392   ; guarda 1: la ventana del mensaje es estrecha (0xB8 x 0x28)
	call 05f2bh		;a395   ; a_p12_7688_2: p12:7688 con el banco 12 en 0x6000
	call 08c52h		;a398   ; a_p03_b4e6: p03:B4E6 con el banco 3 en 0xA000
	call 08c4ah		;a39b   ; a_p03_b563: p03:B563 con el banco 3 en 0xA000
	ld a,02bh		;a39e
	call 08c7ah		;a3a0   ; a_p03_b0dc: p03:B0DC con el banco 3 en 0xA000
	ld c,004h		;a3a3
	call L_A4A6		;a3a5
	call 08c92h		;a3a8   ; a_p03_b603: p03:B603 con el banco 3 en 0xA000
	call L_A4B9		;a3ab
	jp 06a11h		;a3ae   ; sonido_07: pide el sonido 0x07
L_A3B1:
	ld a,(0d7d5h)		;a3b1
	bit 4,a		;a3b4
	ret z			;a3b6
	ld a,(0d7dah)		;a3b7
	bit 0,a		;a3ba
	ret nz			;a3bc
	ld a,(0ca4ah)		;a3bd   ; lee la zona
	cp 00ah		;a3c0
	ret nz			;a3c2
	ld a,(0ca4bh)		;a3c3   ; lee la sala de la zona
	cp 004h		;a3c6
	ret nz			;a3c8
	ld a,(0cb03h)		;a3c9   ; lee la Y de Snake
	cp 0a0h		;a3cc
	ret nc			;a3ce
	ld a,(0cb05h)		;a3cf   ; lee la X de Snake
	cp 068h		;a3d2
	ret c			;a3d4
	cp 080h		;a3d5
	ret nc			;a3d7
	ld a,057h		;a3d8
	call 08c7ah		;a3da   ; a_p03_b0dc: p03:B0DC con el banco 3 en 0xA000
	ld c,005h		;a3dd
	call L_A4A6		;a3df
	ld a,003h		;a3e2
	ld (0e246h),a		;a3e4
	ld hl,0cb5bh		;a3e7
	ld (hl),000h		;a3ea
	call L_A4B9		;a3ec
	jp 06a6bh		;a3ef   ; sonido_04: pide el sonido 0x04
L_A3F2:
	ld a,(0d7d3h)		;a3f2
	and 060h		;a3f5
	ret nz			;a3f7
	bit 6,a		;a3f8
	ret nz			;a3fa
	bit 5,a		;a3fb
	ret nz			;a3fd
	call L_A434		;a3fe
	ret nz			;a401
	ld a,(0cb03h)		;a402   ; lee la Y de Snake
	cp 060h		;a405
	ret c			;a407
	cp 090h		;a408
	ret nc			;a40a
	ld a,(0cb05h)		;a40b   ; lee la X de Snake
	cp 050h		;a40e
	ret c			;a410
	cp 070h		;a411
	ret nc			;a413
	ld a,01ah		;a414
	call 08c7ah		;a416   ; a_p03_b0dc: p03:B0DC con el banco 3 en 0xA000
	ld hl,0d7e0h		;a419
	res 3,(hl)		;a41c
	ld c,006h		;a41e
	call L_A4A6		;a420
	ld a,(0cb0eh)		;a423   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	dec a			;a426
	xor 001h		;a427
	inc a			;a429
	ld hl,0dfdeh		;a42a
	ld (hl),a			;a42d
	call L_A4B9		;a42e
	jp 08c9ah		;a431   ; a_p03_b5ff: p03:B5FF con el banco 3 en 0xA000
L_A434:
	ld a,(0ca76h)		;a434   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 026h		;a437
	ret nz			;a439
	ld a,(0ca4bh)		;a43a   ; lee la sala de la zona
	cp 002h		;a43d
	ret			;a43f
L_A440:
	ld a,(0d7dah)		;a440
	bit 3,a		;a443
	ret nz			;a445
	ld a,(0ca4ah)		;a446   ; lee la zona
	cp 012h		;a449
	ret nz			;a44b
	ld a,(0ca4bh)		;a44c   ; lee la sala de la zona
	cp 00ch		;a44f
	ret nz			;a451
	ld a,(0cb03h)		;a452   ; lee la Y de Snake
	cp 091h		;a455
	ret nc			;a457
	ld a,001h		;a458
	ld (0cb14h),a		;a45a   ; guarda el dibujo del paso de andar (0, 1, 2, 1: p02:9888)
	call 04e01h		;a45d   ; rachas_6517_a_fc00:
	ld hl,0dfd0h		;a460
	ld (hl),0beh		;a463
	inc l			;a465
	ld a,(0cb05h)		;a466   ; lee la X de Snake
	ld (hl),a			;a469
	inc l			;a46a
	ld (hl),000h		;a46b
	inc l			;a46d
	ld (hl),001h		;a46e
	ld a,054h		;a470
	call 08c7ah		;a472   ; a_p03_b0dc: p03:B0DC con el banco 3 en 0xA000
	call L_A4B9		;a475
	ld c,007h		;a478
	jp L_A4A6		;a47a
L_A47D:
	ld a,(0ca41h)		;a47d   ; lee la salida de la sala (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	or a			;a480
	ret nz			;a481
	ld a,(0d7d0h)		;a482   ; lee las banderas de la partida: la n en el bit 7 - n % 8 del byte n / 8 (p03:B0DC, p03:B0F6)
	bit 4,a		;a485
	ret nz			;a487
	ld a,(0ca4ah)		;a488   ; lee la zona
	cp 011h		;a48b
	ret nz			;a48d
	ld a,(0ca4bh)		;a48e   ; lee la sala de la zona
	cp 005h		;a491
	ret nz			;a493
	ld a,(0cb03h)		;a494   ; lee la Y de Snake
	cp 09eh		;a497
	ret nc			;a499
	ld a,001h		;a49a
	ld (0cb14h),a		;a49c   ; guarda el dibujo del paso de andar (0, 1, 2, 1: p02:9888)
	ld a,003h		;a49f
	call 08c7ah		;a4a1   ; a_p03_b0dc: p03:B0DC con el banco 3 en 0xA000
	ld c,008h		;a4a4
L_A4A6:
	xor a			;a4a6
	ld hl,0e040h		;a4a7
	ld (hl),c			;a4aa
	inc hl			;a4ab
	ld (hl),a			;a4ac
	inc hl			;a4ad
	ld (hl),a			;a4ae
	inc hl			;a4af
	ld (hl),a			;a4b0
	inc hl			;a4b1
	ld (hl),a			;a4b2
	ld a,005h		;a4b3
	ld (0ca01h),a		;a4b5   ; guarda el paso del estado de la partida
	ret			;a4b8
L_A4B9:
	ld hl,0cb80h		;a4b9   ; apunta a las 6 fichas de 16 bytes de lo que lanza Snake ([tipo][..][Y 8.8][X 8.8][velocidades]...)
	ld bc,0005fh		;a4bc
	call 04236h		;a4bf   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	ld hl,0dc04h		;a4c2
	ld bc,00017h		;a4c5
	ld a,0e0h		;a4c8
	jp 04237h		;a4ca   ; llena_bloque: pone A en BC + 1 bytes desde HL
L_A4CD:
	xor a			;a4cd
	ld (hl),c			;a4ce
	inc l			;a4cf
	ld (hl),001h		;a4d0
	inc l			;a4d2
	ld (hl),a			;a4d3
	inc l			;a4d4
	ld (hl),e			;a4d5
	inc l			;a4d6
	ld (hl),a			;a4d7
	inc l			;a4d8
	ld (hl),d			;a4d9
	inc l			;a4da
	ld (hl),b			;a4db
	inc hl			;a4dc
	ld (hl),a			;a4dd
	ret			;a4de
L_A4DF:
	call secuencia_de_mensajes		;a4df   ; secuencia_de_mensajes: los mensajes de una secuencia del banco 50, uno tras otro con su espera
	ld hl,0e042h		;a4e2
	ld a,(hl)			;a4e5
	cp 004h		;a4e6
	ret c			;a4e8
	ld (hl),000h		;a4e9
	ld hl,0e041h		;a4eb
	inc (hl)			;a4ee
	ret			;a4ef
secuencia_de_mensajes:		; los mensajes de una secuencia del banco 50, uno tras otro con su espera
	ld a,(0e042h)		;a4f0
	dec a			;a4f3
	jr z,L_A51C		;a4f4
	dec a			;a4f6
	jr z,L_A557		;a4f7
	dec a			;a4f9
	jr z,L_A562		;a4fa
	dec a			;a4fc
	ret z			;a4fd
	ld a,(0e044h)		;a4fe
	ld b,a			;a501
	add a,a			;a502
	add a,b			;a503
	call 0421ah		;a504   ; bancos_50: pone el 50 en 0x8000 (con su copia en 0xC381-0xC383)
	call 043fch		;a507   ; lee_palabra: HL = la palabra que hay en HL
	call 0423eh		;a50a   ; suma_a_hl: HL = HL + A
	ld a,(hl)			;a50d
	inc hl			;a50e
	ld h,(hl)			;a50f
	ld l,a			;a510
	call 041c2h		;a511   ; bancos_1_2_9: pone el 1 en 0x6000, el 2 en 0x8000, el 9 en 0xA000 (con su copia en 0xC381-0xC383)
	call 064feh		;a514   ; mensaje_con_ventana_bancos_9:
L_A517:
	ld hl,0e042h		;a517
	inc (hl)			;a51a
	ret			;a51b
L_A51C:
	push hl			;a51c
	call 0657fh		;a51d   ; mensaje_cada_cuadro_b_9: mensaje_cada_cuadro y deja el banco 9
	pop hl			;a520
	ld a,(0e220h)		;a521   ; lee la velocidad del mensaje en curso (0 = ninguno; 1-3, 4 sin espera)
	or a			;a524
	ret nz			;a525
	ld a,(0e044h)		;a526
	ld b,a			;a529
	add a,a			;a52a
	add a,b			;a52b
	call 0421ah		;a52c   ; bancos_50: pone el 50 en 0x8000 (con su copia en 0xC381-0xC383)
	call 043fch		;a52f   ; lee_palabra: HL = la palabra que hay en HL
	call 0423eh		;a532   ; suma_a_hl: HL = HL + A
	inc hl			;a535
	inc hl			;a536
	ld a,(hl)			;a537
	cp 0ffh		;a538
	jr z,L_A549		;a53a
	ld (0e043h),a		;a53c
	ld hl,0e044h		;a53f
	inc (hl)			;a542
	call 041c2h		;a543   ; bancos_1_2_9: pone el 1 en 0x6000, el 2 en 0x8000, el 9 en 0xA000 (con su copia en 0xC381-0xC383)
	jp L_A517		;a546
L_A549:
	inc hl			;a549
	ld a,(hl)			;a54a
	ld (0e043h),a		;a54b
	call 041c2h		;a54e   ; bancos_1_2_9: pone el 1 en 0x6000, el 2 en 0x8000, el 9 en 0xA000 (con su copia en 0xC381-0xC383)
	call L_A517		;a551
	jp L_A517		;a554
L_A557:
	ld hl,0e043h		;a557
	dec (hl)			;a55a
	ret nz			;a55b
	ld hl,0e042h		;a55c
	ld (hl),000h		;a55f
	ret			;a561
L_A562:
	ld hl,0e043h		;a562
	dec (hl)			;a565
	ret nz			;a566
	xor a			;a567
	ld (0e044h),a		;a568
	ld a,004h		;a56b
	ld (0e042h),a		;a56d
	ret			;a570
L_A571:
	ld hl,0cb80h		;a571   ; apunta a las 6 fichas de 16 bytes de lo que lanza Snake ([tipo][..][Y 8.8][X 8.8][velocidades]...)
	ld bc,0005fh		;a574
	call 04236h		;a577   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	jp 04266h		;a57a   ; esconde_sprites_ram: llena 0xDC00-0xDC7F con 0xE0
L_A57D:
	ld h,000h		;a57d
	ld l,h			;a57f
	ld d,h			;a580
	ld e,l			;a581
	ld bc,0c0c0h		;a582
	jp 0474dh		;a585   ; copia_rectangulo_a_esta: p00:4767 de la otra pagina (0xCA42 ^ 1) a la de 0xCA42
L_A588:
	call L_A59A		;a588
	ld a,(0d7d5h)		;a58b
	bit 7,a		;a58e
	ret nz			;a590
	ld hl,0e248h		;a591   ; apunta a la ficha del que sigue a Snake 12 posiciones por detras (0xE0A4)
	ld bc,00007h		;a594
	jp 04236h		;a597   ; borra_bloque: pone a cero BC + 1 bytes desde HL
L_A59A:
	ld a,(0d7d3h)		;a59a
	and 060h		;a59d
	ret nz			;a59f
	ld hl,0dfd8h		;a5a0
	ld bc,00007h		;a5a3
	jp 04236h		;a5a6   ; borra_bloque: pone a cero BC + 1 bytes desde HL
L_A5A9:
	call 067cdh		;a5a9   ; cambia_tablas_de_sprites: alterna las tablas de sprites de la VRAM: atributos en 0xF600 o 0xF200, colores en 0xF400 o 0xF000
	call 05f34h		;a5ac   ; a_p12_76e9_2: p12:76E9 con el banco 12 en 0x6000
	call 04650h		;a5af   ; espera_vdp: espera a que el VDP acabe la orden en curso (S#2 bit 0)
	call 08c62h		;a5b2   ; a_p03_b593: p03:B593 con el banco 3 en 0xA000
	call 04650h		;a5b5   ; espera_vdp: espera a que el VDP acabe la orden en curso (S#2 bit 0)
	call L_A5C1		;a5b8
	call 08c5ah		;a5bb   ; a_p03_b5b5: p03:B5B5 con el banco 3 en 0xA000
	jp 067f5h		;a5be   ; sprites_a_vram_turnos: los sprites a la VRAM, cambiando el orden cada cuadro para que no desaparezcan
L_A5C1:
	call L_A5CD		;a5c1
	call 08c72h		;a5c4   ; a_p03_b404: p03:B404 con el banco 3 en 0xA000
	call 05f2bh		;a5c7   ; a_p12_7688_2: p12:7688 con el banco 12 en 0x6000
	jp 08c6ah		;a5ca   ; a_p03_b4e0: p03:B4E0 con el banco 3 en 0xA000
L_A5CD:
	ld a,(0e040h)		;a5cd
	dec a			;a5d0
	call 0424dh		;a5d1   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_A5D4: 9 destinos del despachador p00:424D (call en p09:A5D1, el
;   indice en A): A5E6, A696, A863, A961, AA69, AF76, B0B4, B2E8, B315; lo
;   leen p09:A5D1 (18 bytes)
;   0xa5d4..0xa5e6  (18 bytes)
DATA_tabla_A5D4:
	defw 0a5e6h,0a696h,0a863h,0a961h,0aa69h,0af76h,0b0b4h,0b2e8h	; a5d4
	defw 0b315h	; a5e4  -> L_B315

; ======================================================================
; CODIGO 0xa5e6..0xa5ec  (6 bytes)
; ======================================================================


L_A5E6:
	ld a,(0e041h)		;a5e6
	call 0424dh		;a5e9   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_A5EC: 8 destinos del despachador p00:424D (call en p09:A5E9, el
;   indice en A): A5FC, A606, A61E, A639, A63E, A644, A658, A66D; lo leen
;   p09:A5E9 (16 bytes)
;   0xa5ec..0xa5fc  (16 bytes)
DATA_tabla_A5EC:
	defw 0a5fch,0a606h,0a61eh,0a639h,0a63eh,0a644h,0a658h,0a66dh	; a5ec

; ======================================================================
; CODIGO 0xa5fc..0xa69c  (160 bytes)
; ======================================================================


L_A5FC:
	ld a,002h		;a5fc
	ld (0cb0eh),a		;a5fe   ; guarda la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	call 06be4h		;a601   ; orden_sonido_f4: la orden 0xF4 al sonido
	jr L_A653		;a604
L_A606:
	ld a,(0ca03h)		;a606   ; lee el contador de cuadros (uno mas en cada interrupcion)
	rra			;a609
	ret c			;a60a
	call 08cb3h		;a60b
	ld b,060h		;a60e
	ld hl,0cb03h		;a610   ; apunta a la Y de Snake
	ld a,(hl)			;a613
	cp b			;a614
	ret c			;a615
	ld (hl),b			;a616
	ld a,003h		;a617
	ld (0cb0eh),a		;a619   ; guarda la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	jr L_A653		;a61c
L_A61E:
	ld a,(0ca03h)		;a61e   ; lee el contador de cuadros (uno mas en cada interrupcion)
	rra			;a621
	ret c			;a622
	call 08cb3h		;a623
	ld b,020h		;a626
	ld hl,0cb05h		;a628   ; apunta a la X de Snake
	ld a,(hl)			;a62b
	cp b			;a62c
	ret nc			;a62d
	ld (hl),b			;a62e
	ld a,004h		;a62f
	ld (0e24eh),a		;a631
	call 06a0dh		;a634   ; sonido_01: pide el sonido 0x01
	jr L_A653		;a637
L_A639:
	call 06bb4h		;a639   ; sonido_9e: pide el sonido 0x9E (de los que tienen la partitura en un banco de musica, p16:4CE3)
	jr L_A653		;a63c
L_A63E:
	ld hl,0800ch		;a63e   ; tabla_800C: 14 destinos del despachador p00
	jp L_A4DF		;a641
L_A644:
	call 08caah		;a644   ; a_p03_b63e: p03:B63E con el banco 3 en 0xA000
	ld a,001h		;a647
	ld hl,0d694h		;a649
	ld (hl),a			;a64c
	inc hl			;a64d
	ld (hl),a			;a64e
	inc a			;a64f
	ld (0e248h),a		;a650   ; guarda la ficha del que sigue a Snake 12 posiciones por detras (0xE0A4)
L_A653:
	ld hl,0e041h		;a653
	inc (hl)			;a656
	ret			;a657
L_A658:
	ld a,(0e24dh)		;a658
	ld b,a			;a65b
	ld a,(0cb05h)		;a65c   ; lee la X de Snake
	add a,020h		;a65f
	cp b			;a661
	ret nc			;a662
	ld a,003h		;a663
	ld (0e24eh),a		;a665
	ld (0e248h),a		;a668   ; guarda la ficha del que sigue a Snake 12 posiciones por detras (0xE0A4)
	jr L_A653		;a66b
L_A66D:
	xor a			;a66d
	ld (0e040h),a		;a66e
	ld (0d8a8h),a		;a671   ; guarda 1: la ventana del mensaje es estrecha (0xB8 x 0x28)
	ld a,002h		;a674
	ld (0caa0h),a		;a676   ; guarda cuantos siguen a Snake por su rastro (1-4)
	ld hl,0c0d4h		;a679
	ld bc,0402ch		;a67c
	xor a			;a67f
	ld d,a			;a680
	call 046ffh		;a681   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
	call 06b12h		;a684   ; sonido_05: pide el sonido 0x05
	call 08e81h		;a687
	ld hl,06b41h		;a68a
	ld (0ca19h),hl		;a68d   ; guarda la musica pendiente: la rutina que la pide (16 bits)
	ld hl,0ca18h		;a690   ; apunta a la espera hasta poner la musica pendiente
	ld (hl),0ffh		;a693
	ret			;a695
L_A696:
	ld a,(0e041h)		;a696
	call 0424dh		;a699   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_A69C: 15 destinos del despachador p00:424D (call en p09:A699, el
;   indice en A): A6BA, A6D2, A6D8, A6F1, A73C, A77B, A78C, A7B3, A7BC, A7CA,
;   A7D3, A7F6, A811, A842, A848; lo leen p09:A699 (30 bytes)
;   0xa69c..0xa6ba  (30 bytes)
DATA_tabla_A69C:
	defw 0a6bah,0a6d2h,0a6d8h,0a6f1h,0a73ch,0a77bh,0a78ch,0a7b3h	; a69c
	defw 0a7bch,0a7cah,0a7d3h,0a7f6h,0a811h,0a842h,0a848h	; a6ac

; ======================================================================
; CODIGO 0xa6ba..0xa869  (431 bytes)
; ======================================================================


L_A6BA:
	ld a,001h		;a6ba
	ld (0cb0eh),a		;a6bc   ; guarda la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ld a,(0ca03h)		;a6bf   ; lee el contador de cuadros (uno mas en cada interrupcion)
	rra			;a6c2
	ret c			;a6c3
	call 08cb3h		;a6c4
	ld a,(0cb03h)		;a6c7   ; lee la Y de Snake
	cp 03eh		;a6ca
	ret nc			;a6cc
L_A6CD:
	ld hl,0e041h		;a6cd
	inc (hl)			;a6d0
	ret			;a6d1
L_A6D2:
	ld hl,08014h		;a6d2
	jp L_A4DF		;a6d5
L_A6D8:
	ld a,002h		;a6d8
	ld (0e240h),a		;a6da   ; guarda la ficha del que sigue a Snake 4 posiciones por detras (del rastro de 0xE08C)
	ld (0e248h),a		;a6dd   ; guarda la ficha del que sigue a Snake 12 posiciones por detras (0xE0A4)
	ld (0e24eh),a		;a6e0
	inc a			;a6e3
	ld (0cb0eh),a		;a6e4   ; guarda la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	inc a			;a6e7
	ld (0e246h),a		;a6e8
	call L_A6CD		;a6eb
	jp 08caah		;a6ee   ; a_p03_b63e: p03:B63E con el banco 3 en 0xA000
L_A6F1:
	call L_A714		;a6f1
	ld a,(0e245h)		;a6f4
	cp 070h		;a6f7
	jr c,L_A705		;a6f9
	ld a,001h		;a6fb
	ld (0e240h),a		;a6fd   ; guarda la ficha del que sigue a Snake 4 posiciones por detras (del rastro de 0xE08C)
	ld hl,0e246h		;a700
	ld (hl),003h		;a703
L_A705:
	ld a,(0e24bh)		;a705
	cp 0e0h		;a708
	ret nz			;a70a
	xor a			;a70b
	ld (0e248h),a		;a70c   ; guarda la ficha del que sigue a Snake 12 posiciones por detras (0xE0A4)
	ld (0e249h),a		;a70f
	jr L_A6CD		;a712
L_A714:
	ld a,(0cb05h)		;a714   ; lee la X de Snake
	cp 050h		;a717
	ret z			;a719
	ld a,(0ca03h)		;a71a   ; lee el contador de cuadros (uno mas en cada interrupcion)
	and 003h		;a71d
	ret nz			;a71f
	call 08cb3h		;a720
	ld a,(0cb05h)		;a723   ; lee la X de Snake
	cp 051h		;a726
	ret nc			;a728
	ld hl,05000h		;a729
	ld (0cb04h),hl		;a72c   ; guarda la X de Snake: la parte fraccionaria (0xCB04-0xCB05 en 8.8) y el byte siguiente (16 bits)
	ld a,001h		;a72f
	ld (0cb14h),a		;a731   ; guarda el dibujo del paso de andar (0, 1, 2, 1: p02:9888)
	ld a,004h		;a734
	ld (0cb0eh),a		;a736   ; guarda la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	jp 06be8h		;a739   ; orden_sonido_f6: la orden 0xF6 al sonido
L_A73C:
	ld hl,0e043h		;a73c
	ld (hl),080h		;a73f
	xor a			;a741
	ld (0e241h),a		;a742
	call L_A764		;a745
	call 06fa3h		;a748   ; dibujos_b9e1: los dibujos de p45:B9E1
	call 0713eh		;a74b   ; mosaico_b9e7: el mosaico de p45:B9E7 en X = 0x68, Y = 0x37 (2 x 2)
	call L_A754		;a74e
	jp L_A6CD		;a751
L_A754:
	ld a,004h		;a754
	ld (0cb01h),a		;a756   ; guarda el dibujo de Snake (al darse la vuelta se le suma 1, 3 o 5 segun 0xCB00)
	ld a,001h		;a759
	ld (0cb16h),a		;a75b   ; guarda 1 mientras Snake se da la vuelta
	ld a,008h		;a75e
	ld (0cb17h),a		;a760
	ret			;a763
L_A764:
	call L_A771		;a764
	jp 0474dh		;a767   ; copia_rectangulo_a_esta: p00:4767 de la otra pagina (0xCA42 ^ 1) a la de 0xCA42
L_A76A:
	call L_A771		;a76a
	ex de,hl			;a76d
	jp 0475ah		;a76e   ; copia_rectangulo_a_la_otra: p00:4767 de la pagina 0xCA42 a la otra
L_A771:
	ld hl,06837h		;a771
	ld de,0dcc0h		;a774
	ld bc,01010h		;a777
	ret			;a77a
L_A77B:
	ld hl,0e043h		;a77b
	dec (hl)			;a77e
	ret nz			;a77f
	call L_A6CD		;a780
	call L_A89A		;a783
	call L_A57D		;a786
	jp 0444fh		;a789   ; borra_pantalla_negro: 0xC0 x 0xC0 puntos a 0 en la pagina de dibujar
L_A78C:
	call 08ccbh		;a78c   ; paleta_b914_b_9: paleta_b914 y deja el banco 9
	xor a			;a78f
	call 08e2eh		;a790
	ld a,009h		;a793
	call 08e2eh		;a795
	xor a			;a798
	ld b,a			;a799
	ld de,01018h		;a79a
	call 08e16h		;a79d   ; a_p03_b814: p03:B814 con el banco 3 en 0xA000
	ld a,009h		;a7a0
	ld b,001h		;a7a2
	ld de,09018h		;a7a4
	call 08e16h		;a7a7   ; a_p03_b814: p03:B814 con el banco 3 en 0xA000
	call 06bb0h		;a7aa   ; sonido_9d: pide el sonido 0x9D (de los que tienen la partitura en un banco de musica, p16:4CE3)
	call 08c82h		;a7ad   ; a_p03_b607: p03:B607 con el banco 3 en 0xA000
	jp L_A6CD		;a7b0
L_A7B3:
	call 08e1eh		;a7b3   ; a_p03_b8ac: p03:B8AC con el banco 3 en 0xA000
	ld hl,0800eh		;a7b6
	jp L_A4DF		;a7b9
L_A7BC:
	call 08e1eh		;a7bc   ; a_p03_b8ac: p03:B8AC con el banco 3 en 0xA000
	call 08ce8h		;a7bf   ; a_p03_b65d: p03:B65D con el banco 3 en 0xA000
	ld a,001h		;a7c2
	ld (0d8a8h),a		;a7c4   ; guarda 1: la ventana del mensaje es estrecha (0xB8 x 0x28)
	jp L_A6CD		;a7c7
L_A7CA:
	call 08e1eh		;a7ca   ; a_p03_b8ac: p03:B8AC con el banco 3 en 0xA000
	ld hl,08012h		;a7cd
	jp L_A4DF		;a7d0
L_A7D3:
	xor a			;a7d3
	call 08e26h		;a7d4   ; a_p03_b866: p03:B866 con el banco 3 en 0xA000
	ld a,001h		;a7d7
	call 08e26h		;a7d9   ; a_p03_b866: p03:B866 con el banco 3 en 0xA000
	call 08ce8h		;a7dc   ; a_p03_b65d: p03:B65D con el banco 3 en 0xA000
	call 08c29h		;a7df
	call L_A754		;a7e2
	call L_A7EB		;a7e5
	jp L_A6CD		;a7e8
L_A7EB:
	ld hl,00000h		;a7eb
	ld e,l			;a7ee
	ld d,h			;a7ef
	ld bc,0c0c0h		;a7f0
	jp 0475ah		;a7f3   ; copia_rectangulo_a_la_otra: p00:4767 de la pagina 0xCA42 a la otra
L_A7F6:
	ld a,001h		;a7f6
	ld (0d8a8h),a		;a7f8   ; guarda 1: la ventana del mensaje es estrecha (0xB8 x 0x28)
	ld (0e249h),a		;a7fb
	ld (0e24eh),a		;a7fe
	inc a			;a801
	ld (0e248h),a		;a802   ; guarda la ficha del que sigue a Snake 12 posiciones por detras (0xE0A4)
	ld hl,0e24bh		;a805
	ld (hl),0beh		;a808
	inc l			;a80a
	inc l			;a80b
	ld (hl),060h		;a80c
	jp L_A6CD		;a80e
L_A811:
	ld a,(0e24bh)		;a811
	cp 060h		;a814
	ret nc			;a816
	ld a,001h		;a817
	ld (0e248h),a		;a819   ; guarda la ficha del que sigue a Snake 12 posiciones por detras (0xE0A4)
	call L_A76A		;a81c
	ld a,(0cb35h)		;a81f
	ld (0cb00h),a		;a822   ; guarda el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	ld (0cb01h),a		;a825   ; guarda el dibujo de Snake (al darse la vuelta se le suma 1, 3 o 5 segun 0xCB00)
	xor a			;a828
	ld (0cb16h),a		;a829   ; guarda 1 mientras Snake se da la vuelta
	inc a			;a82c
	ld (0cb14h),a		;a82d   ; guarda el dibujo del paso de andar (0, 1, 2, 1: p02:9888)
	ld (0e241h),a		;a830
	inc a			;a833
	ld (0cb0eh),a		;a834   ; guarda la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ld hl,0d7d5h		;a837
	set 5,(hl)		;a83a
	call 08c82h		;a83c   ; a_p03_b607: p03:B607 con el banco 3 en 0xA000
	jp L_A6CD		;a83f
L_A842:
	ld hl,08010h		;a842
	jp L_A4DF		;a845
L_A848:
	call 08caah		;a848   ; a_p03_b63e: p03:B63E con el banco 3 en 0xA000
	xor a			;a84b
	ld (0e040h),a		;a84c
	ld (0d8a8h),a		;a84f   ; guarda 1: la ventana del mensaje es estrecha (0xB8 x 0x28)
	ld a,003h		;a852
	ld (0caa0h),a		;a854   ; guarda cuantos siguen a Snake por su rastro (1-4)
	call 098bfh		;a857   ; estado_que_toca: el estado que toca (p02:98F0) a 0xCB00
	call 08cf0h		;a85a   ; dibujos_de_sala_b_9: dibujos_de_sala y deja el banco 9
	call 08e81h		;a85d
	jp 06be8h		;a860   ; orden_sonido_f6: la orden 0xF6 al sonido
L_A863:
	ld a,(0e041h)		;a863
	call 0424dh		;a866   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_A869: 13 destinos del despachador p00:424D (call en p09:A866, el
;   indice en A): A883, A889, A8B5, A8D8, A8E1, A8FF, A907, A90D, A924, A932,
;   A940, A948, A94E; lo leen p09:A866 (26 bytes)
;   0xa869..0xa883  (26 bytes)
DATA_tabla_A869:
	defw 0a883h,0a889h,0a8b5h,0a8d8h,0a8e1h,0a8ffh,0a907h,0a90dh	; a869
	defw 0a924h,0a932h,0a940h,0a948h,0a94eh	; a879

; ======================================================================
; CODIGO 0xa883..0xa967  (228 bytes)
; ======================================================================


L_A883:
	ld hl,08016h		;a883
	jp L_A4DF		;a886
L_A889:
	call 08caah		;a889   ; a_p03_b63e: p03:B63E con el banco 3 en 0xA000
	call L_A57D		;a88c
	call 0444fh		;a88f   ; borra_pantalla_negro: 0xC0 x 0xC0 puntos a 0 en la pagina de dibujar
	call L_A89A		;a892
L_A895:
	ld hl,0e041h		;a895
	inc (hl)			;a898
	ret			;a899
L_A89A:
	xor a			;a89a
	ld (0e241h),a		;a89b
L_A89E:
	ld hl,0cb01h		;a89e   ; apunta a el dibujo de Snake (al darse la vuelta se le suma 1, 3 o 5 segun 0xCB00)
	ld a,(hl)			;a8a1
	ld (0e254h),a		;a8a2
	ld (hl),00dh		;a8a5
	ret			;a8a7
L_A8A8:
	ld a,001h		;a8a8
	ld (0e241h),a		;a8aa
L_A8AD:
	ld a,(0e254h)		;a8ad
	ld hl,0cb01h		;a8b0   ; apunta a el dibujo de Snake (al darse la vuelta se le suma 1, 3 o 5 segun 0xCB00)
	ld (hl),a			;a8b3
	ret			;a8b4
L_A8B5:
	call 08ccbh		;a8b5   ; paleta_b914_b_9: paleta_b914 y deja el banco 9
	xor a			;a8b8
	call 08e2eh		;a8b9
	ld a,009h		;a8bc
	call 08e2eh		;a8be
	xor a			;a8c1
	ld b,a			;a8c2
	ld de,01018h		;a8c3
	call 08e16h		;a8c6   ; a_p03_b814: p03:B814 con el banco 3 en 0xA000
	ld a,009h		;a8c9
	ld b,001h		;a8cb
	ld de,09018h		;a8cd
	call 08e16h		;a8d0   ; a_p03_b814: p03:B814 con el banco 3 en 0xA000
	call 06bach		;a8d3   ; sonido_9c: pide el sonido 0x9C (de los que tienen la partitura en un banco de musica, p16:4CE3)
	jr L_A895		;a8d6
L_A8D8:
	call 08e1eh		;a8d8   ; a_p03_b8ac: p03:B8AC con el banco 3 en 0xA000
	ld hl,08018h		;a8db
	jp L_A4DF		;a8de
L_A8E1:
	xor a			;a8e1
	call 08e26h		;a8e2   ; a_p03_b866: p03:B866 con el banco 3 en 0xA000
	ld a,001h		;a8e5
	call 08e26h		;a8e7   ; a_p03_b866: p03:B866 con el banco 3 en 0xA000
	call 08ce8h		;a8ea   ; a_p03_b65d: p03:B65D con el banco 3 en 0xA000
	call 063ddh		;a8ed   ; conversacion_8002:
	ld a,001h		;a8f0
	ld (0d7bbh),a		;a8f2
	call L_B68E		;a8f5
	ld a,004h		;a8f8
	ld (0ca01h),a		;a8fa   ; guarda el paso del estado de la partida
	jr L_A895		;a8fd
L_A8FF:
	call L_A8A8		;a8ff
	call 08c9ah		;a902   ; a_p03_b5ff: p03:B5FF con el banco 3 en 0xA000
	jr L_A895		;a905
L_A907:
	ld hl,0801ah		;a907
	jp L_A4DF		;a90a
L_A90D:
	call 08caah		;a90d   ; a_p03_b63e: p03:B63E con el banco 3 en 0xA000
	ld a,004h		;a910
	ld (0cb0eh),a		;a912   ; guarda la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ld (0e246h),a		;a915
	ld a,001h		;a918
	ld (0cb14h),a		;a91a   ; guarda el dibujo del paso de andar (0, 1, 2, 1: p02:9888)
	inc a			;a91d
	ld (0e240h),a		;a91e   ; guarda la ficha del que sigue a Snake 4 posiciones por detras (del rastro de 0xE08C)
	jp L_A895		;a921
L_A924:
	ld a,(0e245h)		;a924
	cp 0adh		;a927
	ret c			;a929
	ld a,001h		;a92a
	ld (0e246h),a		;a92c
	jp L_A895		;a92f
L_A932:
	ld a,(0e243h)		;a932
	cp 04dh		;a935
	ret nc			;a937
	ld a,001h		;a938
	ld (0e240h),a		;a93a   ; guarda la ficha del que sigue a Snake 4 posiciones por detras (del rastro de 0xE08C)
	jp L_A895		;a93d
L_A940:
	ld a,002h		;a940
	ld (0e246h),a		;a942
	jp L_A895		;a945
L_A948:
	ld hl,0801ch		;a948
	jp L_A4DF		;a94b
L_A94E:
	call 08caah		;a94e   ; a_p03_b63e: p03:B63E con el banco 3 en 0xA000
	xor a			;a951
	ld (0e040h),a		;a952
	call 06b12h		;a955   ; sonido_05: pide el sonido 0x05
	call 08e81h		;a958
	ld hl,0ca18h		;a95b   ; apunta a la espera hasta poner la musica pendiente
	ld (hl),0ffh		;a95e
	ret			;a960
L_A961:
	ld a,(0e041h)		;a961
	call 0424dh		;a964   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_A967: 16 destinos del despachador p00:424D (call en p09:A964, el
;   indice en A): A987, A991, A99B, A9A1, A9AE, A9BB, A9C8, A9DE, A9EE, AA06,
;   AA0C, AA16, AA23, AA31, AA4F, AA55; lo leen p09:A964 (32 bytes)
;   0xa967..0xa987  (32 bytes)
DATA_tabla_A967:
	defw 0a987h,0a991h,0a99bh,0a9a1h,0a9aeh,0a9bbh,0a9c8h,0a9deh	; a967
	defw 0a9eeh,0aa06h,0aa0ch,0aa16h,0aa23h,0aa31h,0aa4fh,0aa55h	; a977

; ======================================================================
; CODIGO 0xa987..0xaa7a  (243 bytes)
; ======================================================================


L_A987:
	call 06be4h		;a987   ; orden_sonido_f4: la orden 0xF4 al sonido
	ld hl,0e043h		;a98a
	ld (hl),0b4h		;a98d
	jr L_A9A9		;a98f
L_A991:
	ld hl,0e043h		;a991
	dec (hl)			;a994
	ret nz			;a995
	call 06b85h		;a996   ; sonido_7d: pide el sonido 0x7D (de los que tienen la partitura en un banco de musica, p16:4CE3)
	jr L_A9A9		;a999
L_A99B:
	ld hl,08022h		;a99b
	jp L_A4DF		;a99e
L_A9A1:
	call 08caah		;a9a1   ; a_p03_b63e: p03:B63E con el banco 3 en 0xA000
	ld a,002h		;a9a4
	ld (0e248h),a		;a9a6   ; guarda la ficha del que sigue a Snake 12 posiciones por detras (0xE0A4)
L_A9A9:
	ld hl,0e041h		;a9a9
	inc (hl)			;a9ac
	ret			;a9ad
L_A9AE:
	ld a,(0e24bh)		;a9ae
	cp 0a1h		;a9b1
	ret nc			;a9b3
	ld a,003h		;a9b4
	ld (0e24eh),a		;a9b6
	jr L_A9A9		;a9b9
L_A9BB:
	ld a,(0e24dh)		;a9bb
	cp 075h		;a9be
	ret nc			;a9c0
	ld a,001h		;a9c1
	ld (0e24eh),a		;a9c3
	jr L_A9A9		;a9c6
L_A9C8:
	ld a,(0e24bh)		;a9c8
	cp 068h		;a9cb
	ret nc			;a9cd
	ld a,002h		;a9ce
	ld (0e24eh),a		;a9d0
	dec a			;a9d3
	ld (0e248h),a		;a9d4   ; guarda la ficha del que sigue a Snake 12 posiciones por detras (0xE0A4)
	ld hl,0e043h		;a9d7
	ld (hl),030h		;a9da
	jr L_A9A9		;a9dc
L_A9DE:
	ld hl,0e043h		;a9de
	dec (hl)			;a9e1
	ret nz			;a9e2
	ld a,001h		;a9e3
	ld (0e24eh),a		;a9e5
	inc a			;a9e8
	ld (0e248h),a		;a9e9   ; guarda la ficha del que sigue a Snake 12 posiciones por detras (0xE0A4)
	jr L_A9A9		;a9ec
L_A9EE:
	ld a,(0e24bh)		;a9ee
	cp 025h		;a9f1
	ret nc			;a9f3
	ld a,002h		;a9f4
	ld (0e24eh),a		;a9f6
	dec a			;a9f9
	ld (0e248h),a		;a9fa   ; guarda la ficha del que sigue a Snake 12 posiciones por detras (0xE0A4)
	ld (0d8a8h),a		;a9fd   ; guarda 1: la ventana del mensaje es estrecha (0xB8 x 0x28)
	call L_A9A9		;aa00
	jp 08c9ah		;aa03   ; a_p03_b5ff: p03:B5FF con el banco 3 en 0xA000
L_AA06:
	ld hl,0801eh		;aa06
	jp L_A4DF		;aa09
L_AA0C:
	call 08caah		;aa0c   ; a_p03_b63e: p03:B63E con el banco 3 en 0xA000
	ld a,002h		;aa0f
	ld (0e240h),a		;aa11   ; guarda la ficha del que sigue a Snake 4 posiciones por detras (del rastro de 0xE08C)
	jr L_A9A9		;aa14
L_AA16:
	ld a,(0e243h)		;aa16
	cp 0a1h		;aa19
	ret nc			;aa1b
	ld a,004h		;aa1c
	ld (0e246h),a		;aa1e
	jr L_A9A9		;aa21
L_AA23:
	ld a,(0e245h)		;aa23
	cp 074h		;aa26
	ret c			;aa28
	ld a,001h		;aa29
	ld (0e246h),a		;aa2b
	jp L_A9A9		;aa2e
L_AA31:
	ld a,(0e243h)		;aa31
	cp 068h		;aa34
	ret nc			;aa36
	ld a,002h		;aa37
	ld (0e246h),a		;aa39
	dec a			;aa3c
	ld (0e240h),a		;aa3d   ; guarda la ficha del que sigue a Snake 4 posiciones por detras (del rastro de 0xE08C)
	xor a			;aa40
	ld (0e249h),a		;aa41
	call L_A9A9		;aa44
	ld a,001h		;aa47
	ld (0d8a8h),a		;aa49   ; guarda 1: la ventana del mensaje es estrecha (0xB8 x 0x28)
	jp 08c92h		;aa4c   ; a_p03_b603: p03:B603 con el banco 3 en 0xA000
L_AA4F:
	ld hl,08020h		;aa4f
	jp L_A4DF		;aa52
L_AA55:
	call 08caah		;aa55   ; a_p03_b63e: p03:B63E con el banco 3 en 0xA000
	xor a			;aa58
	ld (0caa0h),a		;aa59   ; guarda cuantos siguen a Snake por su rastro (1-4)
	ld (0e040h),a		;aa5c
	ld (0d8a8h),a		;aa5f   ; guarda 1: la ventana del mensaje es estrecha (0xB8 x 0x28)
	inc a			;aa62
	ld (0e249h),a		;aa63
	jp 098bfh		;aa66   ; estado_que_toca: el estado que toca (p02:98F0) a 0xCB00
L_AA69:
	ld a,(0ca03h)		;aa69   ; lee el contador de cuadros (uno mas en cada interrupcion)
	and 007h		;aa6c
	jr nz,L_AA74		;aa6e
	ld hl,0cb5bh		;aa70
	inc (hl)			;aa73
L_AA74:
	ld a,(0e041h)		;aa74
	call 0424dh		;aa77   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_AA7A: 32 destinos del despachador p00:424D (call en p09:AA77, el
;   indice en A): AABA, AAC6, AAD8, AB05, AB4D, AB5C, AB66, AB6C, AB75, ABA2,
;   ABB3, ABE1, AC07, AC35, AC4F, AC55, AC69, AC9A, ACA7, ACC8, ACEE, AD1A,
;   AD28, AD2E, AD37, AD5B, AD64, AD82, AD9A, ADB0, ADC1, ADC7; lo leen
;   p09:AA77 (64 bytes)
;   0xaa7a..0xaaba  (64 bytes)
DATA_tabla_AA7A:
	defw 0aabah,0aac6h,0aad8h,0ab05h,0ab4dh,0ab5ch,0ab66h,0ab6ch	; aa7a
	defw 0ab75h,0aba2h,0abb3h,0abe1h,0ac07h,0ac35h,0ac4fh,0ac55h	; aa8a
	defw 0ac69h,0ac9ah,0aca7h,0acc8h,0aceeh,0ad1ah,0ad28h,0ad2eh	; aa9a
	defw 0ad37h,0ad5bh,0ad64h,0ad82h,0ad9ah,0adb0h,0adc1h,0adc7h	; aaaa

; ======================================================================
; CODIGO 0xaaba..0xaf7c  (1218 bytes)
; ======================================================================


L_AABA:
	call 04e11h		;aaba   ; rachas_935d_a_ff00:
	xor a			;aabd
	ld (0e25bh),a		;aabe
	call 06a6fh		;aac1   ; sonido_1d: pide el sonido 0x1D
	jr L_AB00		;aac4
L_AAC6:
	ld hl,0e25bh		;aac6
	inc (hl)			;aac9
	inc (hl)			;aaca
	inc (hl)			;aacb
	inc (hl)			;aacc
	ld a,(0e243h)		;aacd
	sub 010h		;aad0
	cp (hl)			;aad2
	jr c,L_AB00		;aad3
	jp L_AF4C		;aad5
L_AAD8:
	call 06f94h		;aad8   ; dibujos_b9c8: los dibujos de p45:B9C8 con los colores de p45:B9B2 en la VRAM de 0x6000
	call 06f4ah		;aadb   ; rachas_a81b: las rachas de p47:A81B
	ld de,06050h		;aade
	call 08cd8h		;aae1   ; a_p10_a6a4: p10:A6A4 con el banco 10 en 0xA000
	call 06c43h		;aae4   ; sonido_94: pide el sonido 0x94 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	call 08535h		;aae7   ; mosaico_ae3b_bancos_9:
	call 08c9ah		;aaea   ; a_p03_b5ff: p03:B5FF con el banco 3 en 0xA000
	ld a,001h		;aaed
	ld (0d8a8h),a		;aaef   ; guarda 1: la ventana del mensaje es estrecha (0xB8 x 0x28)
	ld (0cb14h),a		;aaf2   ; guarda el dibujo del paso de andar (0, 1, 2, 1: p02:9888)
	ld hl,0fc00h		;aaf5
	ld (0e250h),hl		;aaf8
	ld h,001h		;aafb
	ld (0e252h),hl		;aafd
L_AB00:
	ld hl,0e041h		;ab00
	inc (hl)			;ab03
	ret			;ab04
L_AB05:
	ld c,007h		;ab05
	ld a,(0ca03h)		;ab07   ; lee el contador de cuadros (uno mas en cada interrupcion)
	ld b,000h		;ab0a
	rra			;ab0c
	rra			;ab0d
	jr c,L_AB12		;ab0e
	ld b,007h		;ab10
L_AB12:
	call 00047h		;ab12   ; BIOS WRTVDP - Writes data in the VDP-register
	call 08ce0h		;ab15   ; a_p10_a6c2: p10:A6C2 con el banco 10 en 0xA000
	ld bc,00080h		;ab18
	ld hl,(0e250h)		;ab1b
	add hl,bc			;ab1e
	ld (0e250h),hl		;ab1f
	ld de,(0e242h)		;ab22
	add hl,de			;ab26
	ld (0e242h),hl		;ab27
	ld a,h			;ab2a
	ld de,(0e252h)		;ab2b
	ld hl,(0e244h)		;ab2f
	add hl,de			;ab32
	ld (0e244h),hl		;ab33
	cp 0a8h		;ab36
	ret c			;ab38
	xor a			;ab39
	ld (0e241h),a		;ab3a
	ld a,004h		;ab3d
	ld (0cb0eh),a		;ab3f   ; guarda la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ld bc,00007h		;ab42
	call 00047h		;ab45   ; BIOS WRTVDP - Writes data in the VDP-register
	call 07121h		;ab48   ; mosaico_b9d8_f8: el mosaico de p45:B9D8 con la forma 8 de la franja 3
	jr L_AB00		;ab4b
L_AB4D:
	call 08ce0h		;ab4d   ; a_p10_a6c2: p10:A6C2 con el banco 10 en 0xA000
	ld a,(0e1f8h)		;ab50
	or a			;ab53
	ret nz			;ab54
	ld hl,0e043h		;ab55
	ld (hl),080h		;ab58
	jr L_AB00		;ab5a
L_AB5C:
	ld hl,0e043h		;ab5c
	dec (hl)			;ab5f
	ret nz			;ab60
	call 06bd4h		;ab61   ; sonido_a7: pide el sonido 0xA7 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	jr L_AB00		;ab64
L_AB66:
	ld hl,08024h		;ab66
	jp L_A4DF		;ab69
L_AB6C:
	call 08caah		;ab6c   ; a_p03_b63e: p03:B63E con el banco 3 en 0xA000
	xor a			;ab6f
	ld (0d8a8h),a		;ab70   ; guarda 1: la ventana del mensaje es estrecha (0xB8 x 0x28)
	jr L_AB00		;ab73
L_AB75:
	ld a,(0ca03h)		;ab75   ; lee el contador de cuadros (uno mas en cada interrupcion)
	rra			;ab78
	ret c			;ab79
	ld hl,0cae4h		;ab7a
	ld (hl),03ch		;ab7d
	call 08cb3h		;ab7f
	ld a,(0cb05h)		;ab82   ; lee la X de Snake
	cp 088h		;ab85
	ret c			;ab87
	ld a,004h		;ab88
	ld (0cb01h),a		;ab8a   ; guarda el dibujo de Snake (al darse la vuelta se le suma 1, 3 o 5 segun 0xCB00)
	ld a,001h		;ab8d
	ld (0cb16h),a		;ab8f   ; guarda 1 mientras Snake se da la vuelta
	ld a,008h		;ab92
	ld (0cb17h),a		;ab94
	ld hl,0e043h		;ab97
	ld (hl),0f0h		;ab9a
	call 04e01h		;ab9c   ; rachas_6517_a_fc00:
	jp L_AB00		;ab9f
L_ABA2:
	ld hl,0e043h		;aba2
	dec (hl)			;aba5
	ret nz			;aba6
	call L_A57D		;aba7
	call 04266h		;abaa   ; esconde_sprites_ram: llena 0xDC00-0xDC7F con 0xE0
	call 045d7h		;abad   ; esconde_sprites_vram: llena con 0xE0 128 bytes de la VRAM en 0xF600 y otros 128 en 0xF200
	jp L_AB00		;abb0
L_ABB3:
	call 0444fh		;abb3   ; borra_pantalla_negro: 0xC0 x 0xC0 puntos a 0 en la pagina de dibujar
	call L_A89A		;abb6
	xor a			;abb9
	ld (0e249h),a		;abba
	call 08ccbh		;abbd   ; paleta_b914_b_9: paleta_b914 y deja el banco 9
	xor a			;abc0
	call 08e2eh		;abc1
	ld a,009h		;abc4
	call 08e2eh		;abc6
	xor a			;abc9
	ld (0d4ech),a		;abca
	ld b,a			;abcd
	ld de,01018h		;abce
	call 08e16h		;abd1   ; a_p03_b814: p03:B814 con el banco 3 en 0xA000
	ld a,009h		;abd4
	ld b,001h		;abd6
	ld de,09018h		;abd8
	call 08e16h		;abdb   ; a_p03_b814: p03:B814 con el banco 3 en 0xA000
	jp L_AB00		;abde
L_ABE1:
	ld hl,0cae4h		;abe1
	ld a,(hl)			;abe4
	or a			;abe5
	jr z,L_ABEC		;abe6
	dec (hl)			;abe8
	call z,06bb8h		;abe9   ; sonido_9f: pide el sonido 0x9F (de los que tienen la partitura en un banco de musica, p16:4CE3)
L_ABEC:
	call 08e1eh		;abec   ; a_p03_b8ac: p03:B8AC con el banco 3 en 0xA000
	ld hl,08026h		;abef
	call L_A4DF		;abf2
	ld b,001h		;abf5
	ld a,(0e044h)		;abf7
	cp 009h		;abfa
	jr z,L_AC02		;abfc
	inc b			;abfe
	cp 00ah		;abff
	ret nz			;ac01
L_AC02:
	ld a,b			;ac02
	ld (0d4ech),a		;ac03
	ret			;ac06
L_AC07:
	xor a			;ac07
	call 08e26h		;ac08   ; a_p03_b866: p03:B866 con el banco 3 en 0xA000
	ld a,001h		;ac0b
	call 08e26h		;ac0d   ; a_p03_b866: p03:B866 con el banco 3 en 0xA000
	call 08ce8h		;ac10   ; a_p03_b65d: p03:B65D con el banco 3 en 0xA000
	call 08c29h		;ac13
	call L_A7EB		;ac16
	xor a			;ac19
	ld (0cab6h),a		;ac1a
	ld (0ca8eh),a		;ac1d
	inc a			;ac20
	ld hl,0d698h		;ac21
	ld (hl),a			;ac24
	inc hl			;ac25
	ld (hl),a			;ac26
	ld hl,0d674h		;ac27
	ld (hl),a			;ac2a
	inc hl			;ac2b
	ld (hl),a			;ac2c
	ld hl,0ca89h		;ac2d
	ld (hl),002h		;ac30
	jp L_AB00		;ac32
L_AC35:
	ld a,(0cb35h)		;ac35
	ld (0cb00h),a		;ac38   ; guarda el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	ld (0cb01h),a		;ac3b   ; guarda el dibujo de Snake (al darse la vuelta se le suma 1, 3 o 5 segun 0xCB00)
	xor a			;ac3e
	ld (0cb16h),a		;ac3f   ; guarda 1 mientras Snake se da la vuelta
	inc a			;ac42
	ld (0e249h),a		;ac43
	ld (0cb0eh),a		;ac46   ; guarda la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ld (0cb14h),a		;ac49   ; guarda el dibujo del paso de andar (0, 1, 2, 1: p02:9888)
	jp L_AB00		;ac4c
L_AC4F:
	ld hl,08028h		;ac4f
	jp L_A4DF		;ac52
L_AC55:
	call 08caah		;ac55   ; a_p03_b63e: p03:B63E con el banco 3 en 0xA000
	ld a,010h		;ac58
	ld (0dfd0h),a		;ac5a
	xor a			;ac5d
	ld (0dfd2h),a		;ac5e
	ld a,002h		;ac61
	ld (0dfd3h),a		;ac63
	jp L_AB00		;ac66
L_AC69:
	ld a,(0ca03h)		;ac69   ; lee el contador de cuadros (uno mas en cada interrupcion)
	and 003h		;ac6c
	ret nz			;ac6e
	ld hl,0dfd0h		;ac6f
	inc (hl)			;ac72
	call L_AC89		;ac73
	call L_AE8E		;ac76
	ld a,(0dfd0h)		;ac79
	ld hl,0e24bh		;ac7c
	cp (hl)			;ac7f
	ret nz			;ac80
	ld hl,0e043h		;ac81
	ld (hl),040h		;ac84
	jp L_AB00		;ac86
L_AC89:
	ld a,(0ca03h)		;ac89   ; lee el contador de cuadros (uno mas en cada interrupcion)
	rra			;ac8c
	rra			;ac8d
	and 003h		;ac8e
	ret nz			;ac90
	ld a,(0dfd2h)		;ac91
	xor 001h		;ac94
	ld (0dfd2h),a		;ac96
	ret			;ac99
L_AC9A:
	ld hl,0e043h		;ac9a
	dec (hl)			;ac9d
	ret nz			;ac9e
	ld a,001h		;ac9f
	ld (0dfd3h),a		;aca1
	jp L_AB00		;aca4
L_ACA7:
	ld a,(0ca03h)		;aca7   ; lee el contador de cuadros (uno mas en cada interrupcion)
	and 003h		;acaa
	ret nz			;acac
	ld hl,0dfd0h		;acad
	dec (hl)			;acb0
	call L_AC89		;acb1
	call L_AE8E		;acb4
	ld hl,0e24bh		;acb7
	dec (hl)			;acba
	ld a,(hl)			;acbb
	rla			;acbc
	ret nc			;acbd
	xor a			;acbe
	ld (0e249h),a		;acbf
	call L_ADEA		;acc2
	jp L_AB00		;acc5
L_ACC8:
	ld a,(0e044h)		;acc8
	ld l,a			;accb
	ld h,000h		;accc
	ld bc,0c001h		;acce
	ld a,(0ca42h)		;acd1   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	ld d,a			;acd4
	xor a			;acd5
	call 046ffh		;acd6   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
	ld hl,0e044h		;acd9
	inc (hl)			;acdc
	ld a,(hl)			;acdd
	cp 061h		;acde
	ret c			;ace0
	dec (hl)			;ace1
	call 04c8bh		;ace2   ; colores_ae19_bancos_9:
	call 08566h		;ace5   ; mosaico_ae59:
	call L_AB00		;ace8
	jp 06c23h		;aceb   ; sonido_92: pide el sonido 0x92 (de los que tienen la partitura en un banco de musica, p16:4CE3)
L_ACEE:
	call L_AD01		;acee
	ld hl,0e044h		;acf1
	dec (hl)			;acf4
	ld a,(hl)			;acf5
	cp 0ffh		;acf6
	ret nz			;acf8
	ld (hl),000h		;acf9
	call 06b75h		;acfb   ; sonido_a1: pide el sonido 0xA1 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	jp L_AB00		;acfe
L_AD01:
	ld a,(0e044h)		;ad01
	ld l,a			;ad04
	ld e,a			;ad05
	ld h,000h		;ad06
	ld d,h			;ad08
	ld a,(0ca42h)		;ad09   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	xor 001h		;ad0c
	ld b,a			;ad0e
	xor 001h		;ad0f
	rlca			;ad11
	rlca			;ad12
	or b			;ad13
	ld bc,0c001h		;ad14
	jp 04767h		;ad17   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
L_AD1A:
	ld hl,0c692h		;ad1a
	ld a,(hl)			;ad1d
	or a			;ad1e
	ret z			;ad1f
	ld (hl),000h		;ad20
	call 06bcch		;ad22   ; sonido_84: pide el sonido 0x84 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	jp L_AB00		;ad25
L_AD28:
	ld hl,0802ah		;ad28
	jp L_A4DF		;ad2b
L_AD2E:
	call 08caah		;ad2e   ; a_p03_b63e: p03:B63E con el banco 3 en 0xA000
	call 0444fh		;ad31   ; borra_pantalla_negro: 0xC0 x 0xC0 puntos a 0 en la pagina de dibujar
	jp L_AB00		;ad34
L_AD37:
	call L_A89A		;ad37
	call 08ccbh		;ad3a   ; paleta_b914_b_9: paleta_b914 y deja el banco 9
	xor a			;ad3d
	call 08e2eh		;ad3e
	ld a,008h		;ad41
	call 08e2eh		;ad43
	xor a			;ad46
	ld b,a			;ad47
	ld de,01018h		;ad48
	call 08e16h		;ad4b   ; a_p03_b814: p03:B814 con el banco 3 en 0xA000
	ld a,008h		;ad4e
	ld b,001h		;ad50
	ld de,09018h		;ad52
	call 08e16h		;ad55   ; a_p03_b814: p03:B814 con el banco 3 en 0xA000
	jp L_AB00		;ad58
L_AD5B:
	call 08e1eh		;ad5b   ; a_p03_b8ac: p03:B8AC con el banco 3 en 0xA000
	ld hl,0802ch		;ad5e   ; tabla_802C: 8 destinos del despachador p00
	jp L_A4DF		;ad61
L_AD64:
	xor a			;ad64
	call 08e26h		;ad65   ; a_p03_b866: p03:B866 con el banco 3 en 0xA000
	ld a,001h		;ad68
	call 08e26h		;ad6a   ; a_p03_b866: p03:B866 con el banco 3 en 0xA000
	call 08ce8h		;ad6d   ; a_p03_b65d: p03:B65D con el banco 3 en 0xA000
	call 08c29h		;ad70
	call 08d1dh		;ad73   ; p02:8D1D
	call 08547h		;ad76   ; mosaico_ae3b_b_bancos_9:
	call 07129h		;ad79   ; mosaico_b9d8_f7: el mosaico de p45:B9D8 con la forma 7 de la franja 3
	call L_A7EB		;ad7c
	jp L_AB00		;ad7f
L_AD82:
	call 08c92h		;ad82   ; a_p03_b603: p03:B603 con el banco 3 en 0xA000
	ld a,(0e254h)		;ad85
	ld hl,0cb01h		;ad88   ; apunta a el dibujo de Snake (al darse la vuelta se le suma 1, 3 o 5 segun 0xCB00)
	ld (hl),a			;ad8b
	ld a,003h		;ad8c
	ld (0cb0eh),a		;ad8e   ; guarda la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	call L_AB00		;ad91
	call 06cbeh		;ad94   ; sonido_96: pide el sonido 0x96 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	jp 05f51h		;ad97   ; a_p12_6d78_b_9: a_p12_6d78 y deja el banco 9
L_AD9A:
	ld a,(0ca03h)		;ad9a   ; lee el contador de cuadros (uno mas en cada interrupcion)
	rra			;ad9d
	ret c			;ad9e
	call 08cb3h		;ad9f
	ld a,(0cb05h)		;ada2   ; lee la X de Snake
	cp 074h		;ada5
	ret nc			;ada7
	ld a,001h		;ada8
	ld (0cb0eh),a		;adaa   ; guarda la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	jp L_AB00		;adad
L_ADB0:
	ld a,(0ca03h)		;adb0   ; lee el contador de cuadros (uno mas en cada interrupcion)
	rra			;adb3
	ret c			;adb4
	call 08cb3h		;adb5
	ld a,(0cb03h)		;adb8   ; lee la Y de Snake
	cp 080h		;adbb
	ret nc			;adbd
	jp L_AB00		;adbe
L_ADC1:
	ld hl,0802eh		;adc1
	jp L_A4DF		;adc4
L_ADC7:
	call 08caah		;adc7   ; a_p03_b63e: p03:B63E con el banco 3 en 0xA000
	call 08cf0h		;adca   ; dibujos_de_sala_b_9: dibujos_de_sala y deja el banco 9
	xor a			;adcd
	ld (0e040h),a		;adce
	ld (0caa0h),a		;add1   ; guarda cuantos siguen a Snake por su rastro (1-4)
	ld (0e248h),a		;add4   ; guarda la ficha del que sigue a Snake 12 posiciones por detras (0xE0A4)
	ld (0e240h),a		;add7   ; guarda la ficha del que sigue a Snake 4 posiciones por detras (del rastro de 0xE08C)
	ld a,005h		;adda
	ld (0ca22h),a		;addc   ; guarda la fase de la partida (indice de las listas de p06:B40C)
	ld hl,0d7dah		;addf
	set 0,(hl)		;ade2
	call 098bfh		;ade4   ; estado_que_toca: el estado que toca (p02:98F0) a 0xCB00
	jp 08e81h		;ade7
L_ADEA:
	ld a,(0ca42h)		;adea   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	ld b,a			;aded
	xor 001h		;adee
	rlca			;adf0
	rlca			;adf1
	or b			;adf2
	ld hl,00000h		;adf3
	ld d,h			;adf6
	ld e,l			;adf7
	ld bc,0c062h		;adf8
	jp 04767h		;adfb   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
L_ADFE:
	ld bc,0dc28h		;adfe
	ld hl,0e050h		;ae01
	call L_AEA6		;ae04
	ld bc,0dc38h		;ae07
	ld hl,0e054h		;ae0a
	call L_AEA6		;ae0d
	ld bc,0dc48h		;ae10
	ld hl,0e058h		;ae13
	call L_AEA6		;ae16
	ld de,0ba97h		;ae19
	ld hl,0daa0h		;ae1c
	call 08e3bh		;ae1f   ; a_p01_6fd5_2: p01:6FD5 con el banco 1 en 0x6000
	ld de,0baa4h		;ae22
	ld hl,0dab0h		;ae25
	call 08e3bh		;ae28   ; a_p01_6fd5_2: p01:6FD5 con el banco 1 en 0x6000
	ld de,0bab2h		;ae2b
	ld hl,0dac0h		;ae2e
	call 08e3bh		;ae31   ; a_p01_6fd5_2: p01:6FD5 con el banco 1 en 0x6000
	ld de,0bab5h		;ae34
	ld hl,0dad0h		;ae37
	call 08e3bh		;ae3a   ; a_p01_6fd5_2: p01:6FD5 con el banco 1 en 0x6000
	ld de,0ba97h		;ae3d
	ld hl,0dae0h		;ae40
	call 08e3bh		;ae43   ; a_p01_6fd5_2: p01:6FD5 con el banco 1 en 0x6000
	ld de,0baa4h		;ae46
	ld hl,0daf0h		;ae49
	call 08e3bh		;ae4c   ; a_p01_6fd5_2: p01:6FD5 con el banco 1 en 0x6000
	ld de,0bab2h		;ae4f
	ld hl,0db00h		;ae52
	call 08e3bh		;ae55   ; a_p01_6fd5_2: p01:6FD5 con el banco 1 en 0x6000
	ld de,0bab5h		;ae58
	ld hl,0db10h		;ae5b
	call 08e3bh		;ae5e   ; a_p01_6fd5_2: p01:6FD5 con el banco 1 en 0x6000
	ld de,0ba97h		;ae61
	ld hl,0db20h		;ae64
	call 08e3bh		;ae67   ; a_p01_6fd5_2: p01:6FD5 con el banco 1 en 0x6000
	ld de,0baa4h		;ae6a
	ld hl,0db30h		;ae6d
	call 08e3bh		;ae70   ; a_p01_6fd5_2: p01:6FD5 con el banco 1 en 0x6000
	ld de,0bab2h		;ae73
	ld hl,0db40h		;ae76
	call 08e3bh		;ae79   ; a_p01_6fd5_2: p01:6FD5 con el banco 1 en 0x6000
	ld de,0bab5h		;ae7c
	ld hl,0db50h		;ae7f
	jp 08e3bh		;ae82   ; a_p01_6fd5_2: p01:6FD5 con el banco 1 en 0x6000
L_AE85:
	ld hl,0dc50h		;ae85
	call L_AED4		;ae88
	jp L_AF28		;ae8b
L_AE8E:
	ld hl,0dc40h		;ae8e
	ld a,068h		;ae91
	ld (0dfd1h),a		;ae93
	call L_AED4		;ae96
	ld hl,0dc50h		;ae99
	ld a,080h		;ae9c
	ld (0dfd1h),a		;ae9e
	call L_AED4		;aea1
	jr L_AF04		;aea4
L_AEA6:
	push bc			;aea6
	ld de,0dfd0h		;aea7
	ld bc,00004h		;aeaa
	ldir		;aead
	pop hl			;aeaf
	ld a,(0dfd0h)		;aeb0
	sub 020h		;aeb3
	ld e,a			;aeb5
	ld a,(0dfd1h)		;aeb6
	sub 008h		;aeb9
	ld d,a			;aebb
	ld a,(0dfd3h)		;aebc
	dec a			;aebf
	ld c,040h		;aec0
	jr z,L_AEEA		;aec2
	dec a			;aec4
	ld c,058h		;aec5
	jr z,L_AEEA		;aec7
	dec a			;aec9
	ld c,070h		;aeca
	jr z,L_AEEA		;aecc
	dec a			;aece
	ld c,088h		;aecf
	jr z,L_AEEA		;aed1
	ret			;aed3
L_AED4:
	ld a,(0dfd0h)		;aed4
	sub 020h		;aed7
	ld e,a			;aed9
	ld a,(0dfd1h)		;aeda
	sub 008h		;aedd
	ld d,a			;aedf
	ld a,(0dfd3h)		;aee0
	dec a			;aee3
	ld c,080h		;aee4
	jr z,L_AEEA		;aee6
	ld c,098h		;aee8
L_AEEA:
	call 05d41h		;aeea   ; pon_sprite: [E][D][C] en (HL): la Y, la X y el patron de un sprite de 0xDC00
	call 05d3dh		;aeed   ; pon_sprite_mas_4: p00:5D41 con el patron C + 4
	ld a,e			;aef0
	add a,010h		;aef1
	ld e,a			;aef3
	ld a,(0dfd2h)		;aef4
	or a			;aef7
	jr z,L_AEFC		;aef8
	ld a,008h		;aefa
L_AEFC:
	add a,c			;aefc
	ld c,a			;aefd
	call 05d3dh		;aefe   ; pon_sprite_mas_4: p00:5D41 con el patron C + 4
	jp 05d3dh		;af01   ; pon_sprite_mas_4: p00:5D41 con el patron C + 4
L_AF04:
	ld de,0ba97h		;af04
	ld hl,0db00h		;af07
	call 08e3bh		;af0a   ; a_p01_6fd5_2: p01:6FD5 con el banco 1 en 0x6000
	ld de,0baa4h		;af0d
	ld hl,0db10h		;af10
	call 08e3bh		;af13   ; a_p01_6fd5_2: p01:6FD5 con el banco 1 en 0x6000
	ld de,0bab2h		;af16
	ld hl,0db20h		;af19
	call 08e3bh		;af1c   ; a_p01_6fd5_2: p01:6FD5 con el banco 1 en 0x6000
	ld de,0bab5h		;af1f
	ld hl,0db30h		;af22
	call 08e3bh		;af25   ; a_p01_6fd5_2: p01:6FD5 con el banco 1 en 0x6000
L_AF28:
	ld de,0ba97h		;af28
	ld hl,0db40h		;af2b
	call 08e3bh		;af2e   ; a_p01_6fd5_2: p01:6FD5 con el banco 1 en 0x6000
	ld de,0baa4h		;af31
	ld hl,0db50h		;af34
	call 08e3bh		;af37   ; a_p01_6fd5_2: p01:6FD5 con el banco 1 en 0x6000
	ld de,0bab2h		;af3a
	ld hl,0db60h		;af3d
	call 08e3bh		;af40   ; a_p01_6fd5_2: p01:6FD5 con el banco 1 en 0x6000
	ld de,0bab5h		;af43
	ld hl,0db70h		;af46
	jp 08e3bh		;af49   ; a_p01_6fd5_2: p01:6FD5 con el banco 1 en 0x6000
L_AF4C:
	call L_AF51		;af4c
	jr L_AF62		;af4f
L_AF51:
	ld hl,0dc28h		;af51
	ld a,(0e25bh)		;af54
	ld e,a			;af57
	ld d,06ch		;af58
	ld c,0e0h		;af5a
	call 05d41h		;af5c   ; pon_sprite: [E][D][C] en (HL): la Y, la X y el patron de un sprite de 0xDC00
	jp 05d3dh		;af5f   ; pon_sprite_mas_4: p00:5D41 con el patron C + 4
L_AF62:
	ld hl,0daa0h		;af62
	ld a,008h		;af65
	ld bc,0000fh		;af67
	call 04237h		;af6a   ; llena_bloque: pone A en BC + 1 bytes desde HL
	inc hl			;af6d
	ld a,04ah		;af6e
	ld bc,0000fh		;af70
	jp 04237h		;af73   ; llena_bloque: pone A en BC + 1 bytes desde HL
L_AF76:
	ld a,(0e041h)		;af76
	call 0424dh		;af79   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_AF7C: 14 destinos del despachador p00:424D (call en p09:AF79, el
;   indice en A): AF98, AFA8, AFBF, AFE2, AFEB, AFFF, B023, B029, B03F, B04D,
;   B06C, B078, B088, B095; lo leen p09:AF79 (28 bytes)
;   0xaf7c..0xaf98  (28 bytes)
DATA_tabla_AF7C:
	defw 0af98h,0afa8h,0afbfh,0afe2h,0afebh,0afffh,0b023h,0b029h	; af7c
	defw 0b03fh,0b04dh,0b06ch,0b078h,0b088h,0b095h	; af8c

; ======================================================================
; CODIGO 0xaf98..0xb0bd  (293 bytes)
; ======================================================================


L_AF98:
	ld a,001h		;af98
	ld (0cb14h),a		;af9a   ; guarda el dibujo del paso de andar (0, 1, 2, 1: p02:9888)
	ld hl,0e043h		;af9d
	ld (hl),080h		;afa0
	call L_AFBA		;afa2
	jp 06be4h		;afa5   ; orden_sonido_f4: la orden 0xF4 al sonido
L_AFA8:
	ld hl,0e043h		;afa8
	dec (hl)			;afab
	ret nz			;afac
	call L_A57D		;afad
	call 0444fh		;afb0   ; borra_pantalla_negro: 0xC0 x 0xC0 puntos a 0 en la pagina de dibujar
	xor a			;afb3
	ld (0dfd9h),a		;afb4
	call L_A89E		;afb7
L_AFBA:
	ld hl,0e041h		;afba
	inc (hl)			;afbd
	ret			;afbe
L_AFBF:
	call 08ccbh		;afbf   ; paleta_b914_b_9: paleta_b914 y deja el banco 9
	xor a			;afc2
	call 08e2eh		;afc3
	ld a,004h		;afc6
	call 08e2eh		;afc8
	xor a			;afcb
	ld b,a			;afcc
	ld de,01018h		;afcd
	call 08e16h		;afd0   ; a_p03_b814: p03:B814 con el banco 3 en 0xA000
	ld a,004h		;afd3
	ld b,001h		;afd5
	ld de,09018h		;afd7
	call 08e16h		;afda   ; a_p03_b814: p03:B814 con el banco 3 en 0xA000
	call 06bb4h		;afdd   ; sonido_9e: pide el sonido 0x9E (de los que tienen la partitura en un banco de musica, p16:4CE3)
	jr L_AFBA		;afe0
L_AFE2:
	call 08e1eh		;afe2   ; a_p03_b8ac: p03:B8AC con el banco 3 en 0xA000
	ld hl,08034h		;afe5
	jp L_A4DF		;afe8
L_AFEB:
	xor a			;afeb
	call 08e26h		;afec   ; a_p03_b866: p03:B866 con el banco 3 en 0xA000
	ld a,001h		;afef
	call 08e26h		;aff1   ; a_p03_b866: p03:B866 con el banco 3 en 0xA000
	call 08ce8h		;aff4   ; a_p03_b65d: p03:B65D con el banco 3 en 0xA000
	call 08c29h		;aff7   ; p02:8C29
	call L_A7EB		;affa
	jr L_AFBA		;affd
L_AFFF:
	call 05f51h		;afff   ; a_p12_6d78_b_9: a_p12_6d78 y deja el banco 9
	ld a,070h		;b002
	ld (0cb03h),a		;b004   ; guarda la Y de Snake
	ld a,050h		;b007
	ld (0cb05h),a		;b009   ; guarda la X de Snake
	ld a,004h		;b00c
	ld (0cb0eh),a		;b00e   ; guarda la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ld a,003h		;b011
	ld (0dfdeh),a		;b013
	ld a,001h		;b016
	ld (0dfd9h),a		;b018
	call L_A8AD		;b01b
	call 08c92h		;b01e   ; a_p03_b603: p03:B603 con el banco 3 en 0xA000
	jr L_AFBA		;b021
L_B023:
	ld hl,08030h		;b023
	jp L_A4DF		;b026
L_B029:
	call 08caah		;b029   ; a_p03_b63e: p03:B63E con el banco 3 en 0xA000
	ld a,001h		;b02c
	ld hl,0d690h		;b02e
	ld (hl),a			;b031
	inc hl			;b032
	ld (hl),a			;b033
	ld a,002h		;b034
	ld (0dfdeh),a		;b036
	ld (0dfd8h),a		;b039
	jp L_AFBA		;b03c
L_B03F:
	ld a,(0dfdbh)		;b03f
	cp 098h		;b042
	ret c			;b044
	ld a,003h		;b045
	ld (0dfdeh),a		;b047
	jp L_AFBA		;b04a
L_B04D:
	ld a,(0dfddh)		;b04d
	cp 019h		;b050
	jr c,L_B064		;b052
	cp 050h		;b054
	ret nc			;b056
	ld b,002h		;b057
	cp 020h		;b059
	jr nc,L_B05F		;b05b
	ld b,003h		;b05d
L_B05F:
	ld a,b			;b05f
	ld (0cb0eh),a		;b060   ; guarda la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ret			;b063
L_B064:
	ld a,001h		;b064
	ld (0dfd8h),a		;b066
	jp L_AFBA		;b069
L_B06C:
	ld hl,08032h		;b06c
	call L_A4DF		;b06f
	ld a,004h		;b072
	ld (0dfdeh),a		;b074
	ret			;b077
L_B078:
	call 08caah		;b078   ; a_p03_b63e: p03:B63E con el banco 3 en 0xA000
	ld a,003h		;b07b
	ld (0dfdeh),a		;b07d
	ld a,002h		;b080
	ld (0dfd8h),a		;b082
	jp L_AFBA		;b085
L_B088:
	ld a,(0dfddh)		;b088
	cp 00ah		;b08b
	ret nc			;b08d
	xor a			;b08e
	ld (0dfd9h),a		;b08f
	jp L_AFBA		;b092
L_B095:
	xor a			;b095
	ld (0dfd8h),a		;b096
	ld (0e040h),a		;b099
	call L_A196		;b09c
	ld hl,0d7e4h		;b09f
	set 4,(hl)		;b0a2
	ld hl,0d7a3h		;b0a4
	ld (hl),076h		;b0a7
	call 08e81h		;b0a9   ; p02:8E81
	ld hl,0ca18h		;b0ac   ; apunta a la espera hasta poner la musica pendiente
	ld (hl),0ffh		;b0af
	jp 06be8h		;b0b1   ; orden_sonido_f6: la orden 0xF6 al sonido
L_B0B4:
	call 08e33h		;b0b4   ; a_p15_a316: p15:A316 con el banco 15 en 0xA000
	ld a,(0e041h)		;b0b7
	call 0424dh		;b0ba   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_B0BD: 14 destinos del despachador p00:424D (call en p09:B0BA, el
;   indice en A): B0D9, B0E0, B153, B163, B169, B17B, B1A2, B1B7, B1DB, B1E4,
;   B20D, B223, B22C, B256; lo leen p09:B0BA (28 bytes)
;   0xb0bd..0xb0d9  (28 bytes)
DATA_tabla_B0BD:
	defw 0b0d9h,0b0e0h,0b153h,0b163h,0b169h,0b17bh,0b1a2h,0b1b7h	; b0bd
	defw 0b1dbh,0b1e4h,0b20dh,0b223h,0b22ch,0b256h	; b0cd

; ======================================================================
; CODIGO 0xb0d9..0xb14d  (116 bytes)
; ======================================================================


L_B0D9:
	ld a,001h		;b0d9
	ld (0d509h),a		;b0db
	jr L_B10A		;b0de
L_B0E0:
	ld a,(0d501h)		;b0e0
	cp 002h		;b0e3
	ret nz			;b0e5
	ld a,(0ca03h)		;b0e6   ; lee el contador de cuadros (uno mas en cada interrupcion)
	and 007h		;b0e9
	jr nz,L_B0F5		;b0eb
	ld a,(0dfd2h)		;b0ed
	xor 001h		;b0f0
	ld (0dfd2h),a		;b0f2
L_B0F5:
	ld hl,0dfd0h		;b0f5
	dec (hl)			;b0f8
	ld a,(hl)			;b0f9
	cp 0b0h		;b0fa
	jp nc,L_AE85		;b0fc
	call 06b99h		;b0ff   ; sonido_8c: pide el sonido 0x8C (de los que tienen la partitura en un banco de musica, p16:4CE3) (antes, L_6CDA)
	call L_B10F		;b102
	ld hl,0e043h		;b105
	ld (hl),080h		;b108
L_B10A:
	ld hl,0e041h		;b10a
	inc (hl)			;b10d
	ret			;b10e
L_B10F:
	ld hl,04448h		;b10f
	ld bc,03810h		;b112
	push hl			;b115
	push bc			;b116
	call L_B128		;b117
	pop bc			;b11a
	pop hl			;b11b
	call L_B138		;b11c
	ld hl,0b14dh		;b11f
	ld de,0484ch		;b122
	jp 04950h		;b125   ; letrero: pinta las letras de HL en DE hasta 0xFF (0xFE salta de linea)
L_B128:
	ld d,h			;b128
	ld e,l			;b129
	jp 0474dh		;b12a   ; copia_rectangulo_a_esta: p00:4767 de la otra pagina (0xCA42 ^ 1) a la de 0xCA42
L_B12D:
	ld hl,04448h		;b12d
	ld d,h			;b130
	ld e,l			;b131
	ld bc,03810h		;b132
	jp 0475ah		;b135   ; copia_rectangulo_a_la_otra: p00:4767 de la pagina 0xCA42 a la otra
L_B138:
	ld a,(0ca42h)		;b138   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	ld d,a			;b13b
	ld a,099h		;b13c
	push hl			;b13e
	push bc			;b13f
	call 046ffh		;b140   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
	pop de			;b143
	pop hl			;b144
	ld a,(0ca42h)		;b145   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	ld c,007h		;b148
	jp 046bch		;b14a   ; marco: cuatro lineas: un marco de D x E desde HL

; ----------------------------------------------------------------------
; DATOS resto_B14D: lo apuntan con el banco puesto p09:B11F (0xB14D); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p09:B11F (6 bytes)
;   0xb14d..0xb153  (6 bytes)
DATA_resto_B14D:
	defb 027h,057h,02ch,039h,0e0h,0ffh	; b14d

; ======================================================================
; CODIGO 0xb153..0xb2ee  (411 bytes)
; ======================================================================


L_B153:
	ld hl,0e043h		;b153
	dec (hl)			;b156
	ret nz			;b157
	call L_B2D4		;b158
	call L_B12D		;b15b
	call 08c92h		;b15e   ; a_p03_b603: p03:B603 con el banco 3 en 0xA000
	jr $-87		;b161
L_B163:
	ld hl,08036h		;b163
	jp L_A4DF		;b166
L_B169:
	call 08caah		;b169   ; a_p03_b63e: p03:B63E con el banco 3 en 0xA000
	call 08c9ah		;b16c   ; a_p03_b5ff: p03:B5FF con el banco 3 en 0xA000
	ld a,002h		;b16f
	ld (0cb0eh),a		;b171   ; guarda la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ld hl,0e043h		;b174
	ld (hl),008h		;b177
	jr $-111		;b179
L_B17B:
	ld hl,0e043h		;b17b
	dec (hl)			;b17e
	ret nz			;b17f
	ld (hl),030h		;b180
	ld hl,0dc50h		;b182
	ld a,0e0h		;b185
	ld bc,0000fh		;b187
	call 04237h		;b18a   ; llena_bloque: pone A en BC + 1 bytes desde HL
	ld hl,0dfd0h		;b18d
	ld e,(hl)			;b190
	inc l			;b191
	ld d,(hl)			;b192
	ld hl,0dfd8h		;b193
	ld bc,00101h		;b196
	call L_A4CD		;b199
	call 0864ah		;b19c   ; rachas_b3a6:
	jp L_B10A		;b19f
L_B1A2:
	ld hl,0e043h		;b1a2
	dec (hl)			;b1a5
	ret nz			;b1a6
	call L_A57D		;b1a7
	call 0444fh		;b1aa   ; borra_pantalla_negro: 0xC0 x 0xC0 puntos a 0 en la pagina de dibujar
	xor a			;b1ad
	ld (0dfd9h),a		;b1ae
	call L_A89E		;b1b1
	jp L_B10A		;b1b4
L_B1B7:
	call 08ccbh		;b1b7   ; paleta_b914_b_9: paleta_b914 y deja el banco 9
	xor a			;b1ba
	call 08e2eh		;b1bb
	ld a,004h		;b1be
	call 08e2eh		;b1c0
	xor a			;b1c3
	ld b,a			;b1c4
	ld de,01018h		;b1c5
	call 08e16h		;b1c8   ; a_p03_b814: p03:B814 con el banco 3 en 0xA000
	ld a,004h		;b1cb
	ld b,001h		;b1cd
	ld de,09018h		;b1cf
	call 08e16h		;b1d2   ; a_p03_b814: p03:B814 con el banco 3 en 0xA000
	call 06bb4h		;b1d5   ; sonido_9e: pide el sonido 0x9E (de los que tienen la partitura en un banco de musica, p16:4CE3)
	jp L_B10A		;b1d8
L_B1DB:
	call 08e1eh		;b1db   ; a_p03_b8ac: p03:B8AC con el banco 3 en 0xA000
	ld hl,08038h		;b1de
	jp L_A4DF		;b1e1
L_B1E4:
	xor a			;b1e4
	call 08e26h		;b1e5   ; a_p03_b866: p03:B866 con el banco 3 en 0xA000
	ld a,001h		;b1e8
	call 08e26h		;b1ea   ; a_p03_b866: p03:B866 con el banco 3 en 0xA000
	call 08ce8h		;b1ed   ; a_p03_b65d: p03:B65D con el banco 3 en 0xA000
	call 063d8h		;b1f0   ; conversacion_800a:
	ld a,001h		;b1f3
	ld (0d7bbh),a		;b1f5
	call L_B68E		;b1f8
	xor a			;b1fb
	ld (0c68eh),a		;b1fc
	ld (0d501h),a		;b1ff
	ld (0d595h),a		;b202
	ld a,004h		;b205
	ld (0ca01h),a		;b207   ; guarda el paso del estado de la partida
	jp L_B10A		;b20a
L_B20D:
	call 06be8h		;b20d   ; orden_sonido_f6: la orden 0xF6 al sonido
	ld hl,0cae4h		;b210
	ld (hl),096h		;b213
	ld a,001h		;b215
	ld (0dfd9h),a		;b217
	call L_A8AD		;b21a
	call 08c92h		;b21d   ; a_p03_b603: p03:B603 con el banco 3 en 0xA000
	jp L_B10A		;b220
L_B223:
	call L_B2C6		;b223
	ld hl,0803ah		;b226
	jp L_A4DF		;b229
L_B22C:
	call L_B2C6		;b22c
	call 08caah		;b22f   ; a_p03_b63e: p03:B63E con el banco 3 en 0xA000
	ld a,001h		;b232
	ld (0cb0eh),a		;b234   ; guarda la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ld (0cb00h),a		;b237   ; guarda el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	ld (0cb01h),a		;b23a   ; guarda el dibujo de Snake (al darse la vuelta se le suma 1, 3 o 5 segun 0xCB00)
	ld (0cb35h),a		;b23d
	ld a,003h		;b240
	ld (0dfd8h),a		;b242
	inc a			;b245
	ld (0caa0h),a		;b246   ; guarda cuantos siguen a Snake por su rastro (1-4)
	ld de,0e088h		;b249
	ex de,hl			;b24c
	ld bc,01810h		;b24d
	call 046fah		;b250   ; borra_bloque_pagina_0: p00:46FF con A = 0 en la pagina en la que se dibuja
	jp L_B10A		;b253
L_B256:
	call L_B2C6		;b256
	ld a,(0cae4h)		;b259
	or a			;b25c
	ret nz			;b25d
	ld a,001h		;b25e
	ld (0cb20h),a		;b260   ; guarda lo que usa el disparo 1 (0 nada; p02:8001 elige por ello)
	ld hl,0d874h		;b263
	call L_B2BA		;b266
	ld hl,0d8a4h		;b269
	ld a,(0cb21h)		;b26c   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	cp 01dh		;b26f
	call z,L_B2BA		;b271
	ld hl,00080h		;b274
	ld de,0d074h		;b277
	ld bc,02010h		;b27a
	ld a,(0ca42h)		;b27d   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	rlca			;b280
	rlca			;b281
	rlca			;b282
	rlca			;b283
	and 030h		;b284
	or 0c8h		;b286
	call 047edh		;b288   ; copia_rectangulo_logica: orden LMMM del VDP con la operacion logica de A
	ld hl,0df30h		;b28b
	ld bc,00003h		;b28e
	ld a,080h		;b291
	call 04237h		;b293   ; llena_bloque: pone A en BC + 1 bytes desde HL
	call 06a83h		;b296   ; sonido_22: pide el sonido 0x22
	xor a			;b299
	ld (0e040h),a		;b29a
	inc a			;b29d
	ld (0cb55h),a		;b29e
	ld hl,0d600h		;b2a1   ; apunta a lo que lleva Snake: fichas de 4 bytes [la tiene][cuenta en BCD, 2 bytes][...]; las de 0xCB20 desde la 1
	ld bc,00000h		;b2a4
	call L_B2B4		;b2a7
	ld hl,0d6a8h		;b2aa
	xor a			;b2ad
	call L_B2B4		;b2ae
	ld hl,0d62ch		;b2b1
L_B2B4:
	ld (hl),a			;b2b4
	inc hl			;b2b5
	ld (hl),c			;b2b6
	inc hl			;b2b7
	ld (hl),b			;b2b8
	ret			;b2b9
L_B2BA:
	ld bc,01010h		;b2ba
	ld a,(0ca42h)		;b2bd   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	ld d,a			;b2c0
	ld a,099h		;b2c1
	jp 046ffh		;b2c3   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
L_B2C6:
	ld hl,0cae4h		;b2c6
	ld a,(hl)			;b2c9
	or a			;b2ca
	ret z			;b2cb
	dec (hl)			;b2cc
	ret nz			;b2cd
	call 06b12h		;b2ce   ; sonido_05: pide el sonido 0x05
	jp 06b41h		;b2d1   ; sonido_72: pide el sonido 0x72 (de los que tienen la partitura en un banco de musica, p16:4CE3)
L_B2D4:
	ld hl,0e080h		;b2d4   ; apunta a el rastro de Snake: las ultimas 16 posiciones [Y][X][direccion] (con 0xCAA0)
	ld b,010h		;b2d7
	ld a,08fh		;b2d9
L_B2DB:
	ld (hl),a			;b2db
	inc a			;b2dc
	inc a			;b2dd
	inc hl			;b2de
	ld (hl),050h		;b2df
	inc hl			;b2e1
	ld (hl),001h		;b2e2
	inc hl			;b2e4
	djnz L_B2DB		;b2e5
	ret			;b2e7
L_B2E8:
	ld a,(0e041h)		;b2e8
	call 0424dh		;b2eb   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_B2EE: 2 destinos del despachador p00:424D (call en p09:B2EB, el
;   indice en A): B2F2, B307; lo leen p09:B2EB (4 bytes)
;   0xb2ee..0xb2f2  (4 bytes)
DATA_tabla_B2EE:
	defw 0b2f2h,0b307h	; b2ee  -> L_B2F2 L_B307

; ======================================================================
; CODIGO 0xb2f2..0xb31b  (41 bytes)
; ======================================================================


L_B2F2:
	call 063ceh		;b2f2   ; conversacion_8004:
	ld a,001h		;b2f5
	ld (0d7bbh),a		;b2f7
	call L_B68E		;b2fa
	ld a,004h		;b2fd
	ld (0ca01h),a		;b2ff   ; guarda el paso del estado de la partida
	ld hl,0e041h		;b302
	inc (hl)			;b305
	ret			;b306
L_B307:
	ld hl,00384h		;b307
	ld (0cad8h),hl		;b30a
	xor a			;b30d
	ld (0e040h),a		;b30e
	ld (0cb76h),a		;b311
	ret			;b314
L_B315:
	ld a,(0e041h)		;b315
	call 0424dh		;b318   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_B31B: 14 destinos del despachador p00:424D (call en p09:B318, el
;   indice en A): B337, B344, B34A, B357, B3A3, B56C, B57F, B5C1, B5D6, B5DC,
;   B5EA, B602, B612, B618; lo leen p09:B318 (28 bytes)
;   0xb31b..0xb337  (28 bytes)
DATA_tabla_B31B:
	defw 0b337h,0b344h,0b34ah,0b357h,0b3a3h,0b56ch,0b57fh,0b5c1h	; b31b
	defw 0b5d6h,0b5dch,0b5eah,0b602h,0b612h,0b618h	; b32b

; ======================================================================
; CODIGO 0xb337..0xb397  (96 bytes)
; ======================================================================


L_B337:
	ld hl,0e043h		;b337
	dec (hl)			;b33a
	jr z,L_B352		;b33b
	ld a,(hl)			;b33d
	and 007h		;b33e
	jp z,06afah		;b340   ; sonido_39: pide el sonido 0x39
	ret			;b343
L_B344:
	ld hl,0803ch		;b344
	jp L_A4DF		;b347
L_B34A:
	call 08caah		;b34a   ; a_p03_b63e: p03:B63E con el banco 3 en 0xA000
	ld hl,0e043h		;b34d
	ld (hl),010h		;b350
L_B352:
	ld hl,0e041h		;b352
	inc (hl)			;b355
	ret			;b356
L_B357:
	xor a			;b357
	ld (0cb7eh),a		;b358
	inc a			;b35b
	inc a			;b35c
	ld (0dfd8h),a		;b35d
	call L_B389		;b360
	call L_B368		;b363
	jr L_B352		;b366
L_B368:
	ld a,(0dfdbh)		;b368
	cp 058h		;b36b
	jr z,L_B378		;b36d
	ld a,001h		;b36f
	jr nc,L_B374		;b371
	inc a			;b373
L_B374:
	ld (0dfdeh),a		;b374
	ret			;b377
L_B378:
	ld a,(0dfddh)		;b378
	cp 060h		;b37b
	jp z,L_B44A		;b37d
	ld a,003h		;b380
	jr nc,L_B385		;b382
	inc a			;b384
L_B385:
	ld (0dfdeh),a		;b385
	ret			;b388
L_B389:
	ld de,0e050h		;b389
	ld hl,0b397h		;b38c
	ld bc,0000ch		;b38f
	ldir		;b392
	jp L_ADFE		;b394

; ----------------------------------------------------------------------
; DATOS resto_B397: lo apuntan con el banco puesto p09:B38C (0xB397); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p09:B38C (12 bytes)
;   0xb397..0xb3a3  (12 bytes)
DATA_resto_B397:
	defb 0bfh,050h,000h,001h,000h,050h,000h,001h,000h,050h,000h,001h	; b397  .P...P...P..

; ======================================================================
; CODIGO 0xb3a3..0xb67e  (731 bytes)
; ======================================================================


L_B3A3:
	call L_B3C4		;b3a3
	call L_B436		;b3a6
	call L_B48F		;b3a9
	call L_B4EF		;b3ac
	call L_B549		;b3af
	call L_ADFE		;b3b2
	ld a,(0cb7eh)		;b3b5
	and 01fh		;b3b8
	cp 01fh		;b3ba
	ret nz			;b3bc
	ld hl,0e043h		;b3bd
	ld (hl),020h		;b3c0
	jr $-112		;b3c2
L_B3C4:
	ld a,(0cb7eh)		;b3c4
	rra			;b3c7
	ret c			;b3c8
	ld a,(0ca03h)		;b3c9   ; lee el contador de cuadros (uno mas en cada interrupcion)
	and 003h		;b3cc
	ret nz			;b3ce
	ld a,(0cb03h)		;b3cf   ; lee la Y de Snake
	cp 058h		;b3d2
	jr z,L_B3FB		;b3d4
	ld a,001h		;b3d6
	jr nc,L_B3E9		;b3d8
	inc a			;b3da
	ld (0cb0eh),a		;b3db   ; guarda la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	call 08cb3h		;b3de   ; p02:8CB3
	ld a,(0cb03h)		;b3e1   ; lee la Y de Snake
	cp 058h		;b3e4
	ret c			;b3e6
	jr L_B3F5		;b3e7
L_B3E9:
	ld (0cb0eh),a		;b3e9   ; guarda la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	call 08cb3h		;b3ec
	ld a,(0cb03h)		;b3ef   ; lee la Y de Snake
	cp 059h		;b3f2
	ret nc			;b3f4
L_B3F5:
	ld a,058h		;b3f5
	ld (0cb03h),a		;b3f7   ; guarda la Y de Snake
	ret			;b3fa
L_B3FB:
	ld a,(0cb05h)		;b3fb   ; lee la X de Snake
	cp 050h		;b3fe
	jr z,L_B426		;b400
	ld a,003h		;b402
	jr nc,L_B415		;b404
	inc a			;b406
	ld (0cb0eh),a		;b407   ; guarda la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	call 08cb3h		;b40a
	ld a,(0cb05h)		;b40d   ; lee la X de Snake
	cp 050h		;b410
	ret c			;b412
	jr L_B421		;b413
L_B415:
	ld (0cb0eh),a		;b415   ; guarda la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	call 08cb3h		;b418
	ld a,(0cb05h)		;b41b   ; lee la X de Snake
	cp 051h		;b41e
	ret nc			;b420
L_B421:
	ld a,050h		;b421
	ld (0cb05h),a		;b423   ; guarda la X de Snake
L_B426:
	ld hl,0cb7eh		;b426
	set 0,(hl)		;b429
	ld a,002h		;b42b
	ld (0cb0eh),a		;b42d   ; guarda la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ld a,001h		;b430
	ld (0cb14h),a		;b432   ; guarda el dibujo del paso de andar (0, 1, 2, 1: p02:9888)
	ret			;b435
L_B436:
	ld a,(0cb7eh)		;b436
	bit 1,a		;b439
	ret nz			;b43b
	ld a,(0dfdbh)		;b43c
	cp 058h		;b43f
	jr nz,L_B459		;b441
	ld a,(0dfddh)		;b443
	cp 060h		;b446
	jr nz,L_B472		;b448
L_B44A:
	ld hl,0cb7eh		;b44a
	set 1,(hl)		;b44d
	ld a,001h		;b44f
	ld (0dfd8h),a		;b451
	inc a			;b454
	ld (0dfdeh),a		;b455
	ret			;b458
L_B459:
	ld a,(0dfdeh)		;b459
	dec a			;b45c
	ld a,(0dfdbh)		;b45d
	jr z,L_B46D		;b460
	cp 058h		;b462
	ret c			;b464
L_B465:
	ld a,058h		;b465
	ld (0dfdbh),a		;b467
	jp L_B378		;b46a
L_B46D:
	cp 059h		;b46d
	ret nc			;b46f
	jr L_B465		;b470
L_B472:
	ld a,(0dfdeh)		;b472
	cp 003h		;b475
	ld a,(0dfddh)		;b477
	jr z,L_B48A		;b47a
	cp 060h		;b47c
	ret c			;b47e
L_B47F:
	ld a,060h		;b47f
	ld (0dfddh),a		;b481
	ld a,001h		;b484
	ld (0dfd8h),a		;b486
	ret			;b489
L_B48A:
	cp 061h		;b48a
	ret nc			;b48c
	jr L_B47F		;b48d
L_B48F:
	ld a,(0cb7eh)		;b48f
	bit 2,a		;b492
	ret nz			;b494
	ld ix,0e050h		;b495
	call a_p12_7fa0		;b499   ; a_p12_7fa0: p12:7FA0 con el banco 12 en 0x6000
	ld a,(0e050h)		;b49c
	cp 080h		;b49f
	jr z,L_B4A6		;b4a1
	jr c,L_B4A6		;b4a3
	ret			;b4a5
L_B4A6:
	ld a,(0e051h)		;b4a6
	cp 050h		;b4a9
	jr nz,L_B4BC		;b4ab
	ld a,080h		;b4ad
	ld (0e050h),a		;b4af
	ld a,003h		;b4b2
	ld (0e053h),a		;b4b4
	ld a,0bfh		;b4b7
	ld (0e054h),a		;b4b9
L_B4BC:
	ld a,(0e051h)		;b4bc
	cp 034h		;b4bf
	jr z,L_B4C6		;b4c1
	jr c,L_B4C6		;b4c3
	ret			;b4c5
L_B4C6:
	ld a,034h		;b4c6
	ld (0e051h),a		;b4c8
	ld a,001h		;b4cb
	ld (0e053h),a		;b4cd
	ld a,(0e050h)		;b4d0
	cp 058h		;b4d3
	ret nc			;b4d5
	ld a,058h		;b4d6
	ld (0e050h),a		;b4d8
	ld a,004h		;b4db
	ld (0e053h),a		;b4dd
	ld hl,0cb7eh		;b4e0
	set 2,(hl)		;b4e3
	ret			;b4e5
a_p12_7fa0:		; p12:7FA0 con el banco 12 en 0x6000
	call 041ddh		;b4e6   ; bancos_12: pone el 12 en 0x6000 (con su copia en 0xC381-0xC383)
	call 07fa0h		;b4e9   ; p12:7FA0
	jp 041c2h		;b4ec   ; bancos_1_2_9: pone el 1 en 0x6000, el 2 en 0x8000, el 9 en 0xA000 (con su copia en 0xC381-0xC383)
L_B4EF:
	ld a,(0cb7eh)		;b4ef
	bit 3,a		;b4f2
	ret nz			;b4f4
	ld a,(0e054h)		;b4f5
	or a			;b4f8
	ret z			;b4f9
	ld ix,0e054h		;b4fa
	call a_p12_7fa0		;b4fe   ; a_p12_7fa0: p12:7FA0 con el banco 12 en 0x6000
	ld a,(0e054h)		;b501
	cp 070h		;b504
	jr z,L_B50B		;b506
	jr c,L_B50B		;b508
	ret			;b50a
L_B50B:
	ld a,(0e055h)		;b50b
	cp 050h		;b50e
	jr nz,L_B521		;b510
	ld a,070h		;b512
	ld (0e054h),a		;b514
	ld a,004h		;b517
	ld (0e057h),a		;b519
	ld a,0bfh		;b51c
	ld (0e058h),a		;b51e
L_B521:
	ld a,(0e055h)		;b521
	cp 088h		;b524
	jr nc,L_B529		;b526
	ret			;b528
L_B529:
	ld a,088h		;b529
	ld (0e055h),a		;b52b
	ld a,001h		;b52e
	ld (0e057h),a		;b530
	ld a,(0e054h)		;b533
	cp 058h		;b536
	ret nc			;b538
	ld a,058h		;b539
	ld (0e054h),a		;b53b
	ld a,003h		;b53e
	ld (0e057h),a		;b540
	ld hl,0cb7eh		;b543
	set 3,(hl)		;b546
	ret			;b548
L_B549:
	ld a,(0cb7eh)		;b549
	bit 4,a		;b54c
	ret nz			;b54e
	ld a,(0e058h)		;b54f
	or a			;b552
	ret z			;b553
	ld ix,0e058h		;b554
	call a_p12_7fa0		;b558   ; a_p12_7fa0: p12:7FA0 con el banco 12 en 0x6000
	ld a,(0e058h)		;b55b
	cp 091h		;b55e
	ret nc			;b560
	ld a,090h		;b561
	ld (0e058h),a		;b563
	ld hl,0cb7eh		;b566
	set 4,(hl)		;b569
	ret			;b56b
L_B56C:
	call L_ADFE		;b56c
	ld hl,0e043h		;b56f
	dec (hl)			;b572
	ret nz			;b573
	ld hl,0cb7bh		;b574
	ld (hl),000h		;b577
	inc hl			;b579
	ld (hl),001h		;b57a
	jp L_B352		;b57c
L_B57F:
	call L_ADFE		;b57f
	call 08e8eh		;b582   ; a_p11_be0f: p11:BE0F con el banco 11 en 0xA000
	call 08e96h		;b585   ; a_p11_be6b: p11:BE6B con el banco 11 en 0xA000
	call L_B5A5		;b588
	ld a,(0cb78h)		;b58b
	or a			;b58e
	ret nz			;b58f
	ld hl,0dc10h		;b590
	ld (hl),0e0h		;b593
	ld hl,0e043h		;b595
	ld (hl),000h		;b598
	ld a,001h		;b59a
	ld (0dfdeh),a		;b59c
	call L_B352		;b59f
	jp 06aeeh		;b5a2   ; sonido_91: pide el sonido 0x91 (de los que tienen la partitura en un banco de musica, p16:4CE3)
L_B5A5:
	ld a,(0cb7bh)		;b5a5
	ld hl,0e050h		;b5a8
	cp 004h		;b5ab
	jr z,L_B5BC		;b5ad
	ld hl,0e058h		;b5af
	cp 00ah		;b5b2
	jr z,L_B5BC		;b5b4
	ld hl,0e054h		;b5b6
	cp 011h		;b5b9
	ret nz			;b5bb
L_B5BC:
	ld (hl),000h		;b5bc
	jp 06a2dh		;b5be   ; sonido_0f: pide el sonido 0x0F
L_B5C1:
	ld hl,0e043h		;b5c1
	dec (hl)			;b5c4
	ret nz			;b5c5
	ld a,003h		;b5c6
	ld (0dfdeh),a		;b5c8
	call L_B352		;b5cb
	ld a,001h		;b5ce
	ld (0d8a8h),a		;b5d0   ; guarda 1: la ventana del mensaje es estrecha (0xB8 x 0x28)
	jp 06be8h		;b5d3   ; orden_sonido_f6: la orden 0xF6 al sonido
L_B5D6:
	ld hl,0803eh		;b5d6
	jp L_A4DF		;b5d9
L_B5DC:
	call 08caah		;b5dc   ; a_p03_b63e: p03:B63E con el banco 3 en 0xA000
	ld a,004h		;b5df
	ld (0cb0eh),a		;b5e1   ; guarda la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	call L_B352		;b5e4
	jp 06bbch		;b5e7   ; sonido_a2: pide el sonido 0xA2 (de los que tienen la partitura en un banco de musica, p16:4CE3)
L_B5EA:
	call 063d3h		;b5ea   ; conversacion_8006:
	ld a,001h		;b5ed
	ld (0d7bbh),a		;b5ef
	call L_B68E		;b5f2
	ld a,004h		;b5f5
	ld (0ca01h),a		;b5f7   ; guarda el paso del estado de la partida
	ld hl,0e043h		;b5fa
	ld (hl),0b4h		;b5fd
	jp L_B352		;b5ff
L_B602:
	ld hl,0e043h		;b602
	dec (hl)			;b605
	ret nz			;b606
	ld a,001h		;b607
	ld (0d8a8h),a		;b609   ; guarda 1: la ventana del mensaje es estrecha (0xB8 x 0x28)
	call 08c92h		;b60c   ; a_p03_b603: p03:B603 con el banco 3 en 0xA000
	jp L_B352		;b60f
L_B612:
	ld hl,08040h		;b612
	jp L_A4DF		;b615
L_B618:
	call 08caah		;b618   ; a_p03_b63e: p03:B63E con el banco 3 en 0xA000
	xor a			;b61b
	ld (0e040h),a		;b61c
	ld (0d8a8h),a		;b61f   ; guarda 1: la ventana del mensaje es estrecha (0xB8 x 0x28)
	inc a			;b622
	ld (0caafh),a		;b623
	ld hl,0d700h		;b626
	ld bc,0001fh		;b629
	jp 04236h		;b62c   ; borra_bloque: pone a cero BC + 1 bytes desde HL
L_B62F:
	ld hl,0d790h		;b62f
	ld (hl),000h		;b632
	inc hl			;b634
	ld (hl),040h		;b635
	inc hl			;b637
	ld (hl),001h		;b638
	ld hl,0b67eh		;b63a
	ld de,0d7a0h		;b63d
	ld bc,00010h		;b640
	ldir		;b643
	ld hl,0d79ch		;b645
	ld bc,00003h		;b648
	call 04236h		;b64b   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	ld a,(0d7e4h)		;b64e
	and 078h		;b651
	ret z			;b653
	ld hl,0d7a0h		;b654
	ld b,066h		;b657
	bit 3,a		;b659
	call nz,L_B67C		;b65b
	bit 6,a		;b65e
	jr z,L_B66A		;b660
	ld hl,0d7a0h		;b662
	ld b,024h		;b665
	call L_B67C		;b667
L_B66A:
	ld hl,0d7a1h		;b66a
	ld b,098h		;b66d
	bit 5,a		;b66f
	call nz,L_B67C		;b671
	ld hl,0d7a3h		;b674
	ld b,076h		;b677
	bit 4,a		;b679
	ret z			;b67b
L_B67C:
	ld (hl),b			;b67c
	ret			;b67d

; ----------------------------------------------------------------------
; DATOS resto_B67E: lo apuntan con el banco puesto p09:B63A (0xB67E); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p09:B63A (16 bytes)
;   0xb67e..0xb68e  (16 bytes)
DATA_resto_B67E:
	defb 085h,038h,040h,015h,093h,082h,051h,027h,0a0h,007h,0a1h,0a2h,000h,0ffh,0ffh,0ffh	; b67e  .8@...Q'........

; ======================================================================
; CODIGO 0xb68e..0xb891  (515 bytes)
; ======================================================================


L_B68E:
	call 06f3ch		;b68e   ; dibujos_9eb2: los dibujos de p46:9EB2 en la VRAM de 0x6000
	call L_B75F		;b691
	ld bc,00f07h		;b694
	call 00047h		;b697   ; BIOS WRTVDP - Writes data in the VDP-register
	ld hl,0df80h		;b69a   ; apunta a 8 fichas de 8 bytes [tipo][dibujo][Y][X][fila][columna][espera][grafico] que suenan 0x14 en la sala y 0x15 al lado
	ld bc,0003fh		;b69d
	call 04236h		;b6a0   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	xor a			;b6a3
	ld (0d793h),a		;b6a4
	ld (0dfech),a		;b6a7
	ld (0d79ah),a		;b6aa
	ld (0d79bh),a		;b6ad
	ld (0d7b4h),a		;b6b0
	ld (0d7b5h),a		;b6b3
	ld (0cabeh),a		;b6b6
	ld (0caddh),a		;b6b9
	ld (0ca86h),a		;b6bc
	ld (0cb71h),a		;b6bf
	ld (0cb77h),a		;b6c2
	ld (0cb52h),a		;b6c5
	inc a			;b6c8
	ld (0cabdh),a		;b6c9
	ld (0e255h),a		;b6cc
	ld (0d8a8h),a		;b6cf   ; guarda 1: la ventana del mensaje es estrecha (0xB8 x 0x28)
	ld a,(0ca22h)		;b6d2   ; lee la fase de la partida (indice de las listas de p06:B40C)
	ld (0cb7fh),a		;b6d5
	ld hl,0cb5dh		;b6d8
	ld b,000h		;b6db
	ld a,(0e040h)		;b6dd
	cp 009h		;b6e0
	jr nz,L_B6EB		;b6e2
	ld a,0c0h		;b6e4
	ld (0cb5eh),a		;b6e6
	ld b,001h		;b6e9
L_B6EB:
	ld (hl),b			;b6eb
	ld a,003h		;b6ec
	ld (0d795h),a		;b6ee
	ld (0d7b6h),a		;b6f1   ; guarda la espera antes de la siguiente accion de la conversacion
	ld de,0d797h		;b6f4
	ld hl,0d796h		;b6f7
	ld bc,00003h		;b6fa
	ld (hl),000h		;b6fd
	ldir		;b6ff
	ld a,(0d7bbh)		;b701
	or a			;b704
	call nz,L_BEB5		;b705
	call 04266h		;b708   ; esconde_sprites_ram: llena 0xDC00-0xDC7F con 0xE0
	call 045d7h		;b70b   ; esconde_sprites_vram: llena con 0xE0 128 bytes de la VRAM en 0xF600 y otros 128 en 0xF200
	ld a,(0ca42h)		;b70e   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	call 04452h		;b711   ; borra_pantalla_de: 0xC0 x 0xC0 puntos a 0 en la pagina A
	ld hl,000d8h		;b714
	ld bc,0c028h		;b717
	xor a			;b71a
	ld d,a			;b71b
	call 046ffh		;b71c   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
	ld a,(0ca42h)		;b71f   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	xor 001h		;b722
	call L_B754		;b724
	ld a,(0ca42h)		;b727   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	call L_B754		;b72a
	call 070fch		;b72d   ; mosaico_a719: el mosaico de p47:A719 en X = 0x40, Y = 0, 0x13 filas de 8
	call L_BD91		;b730
	call L_B74A		;b733
	call 08ccbh		;b736   ; paleta_b914_b_9: paleta_b914 y deja el banco 9
	call L_BA1E		;b739
	call L_BA35		;b73c
	call 08e1eh		;b73f   ; a_p03_b8ac: p03:B8AC con el banco 3 en 0xA000
	ld a,(0ca97h)		;b742   ; lee 1 si los mensajes salen de los bancos 50-51 y no de 48-49
	or a			;b745
	ret z			;b746
	jp 06a0dh		;b747   ; sonido_01: pide el sonido 0x01
L_B74A:
	ld a,(0ca97h)		;b74a   ; lee 1 si los mensajes salen de los bancos 50-51 y no de 48-49
	or a			;b74d
	jp z,045f6h		;b74e   ; apaga_sprites: R#8 con el bit 1 (SPD) a uno, desde la copia 0xFFE7
	jp 04266h		;b751   ; esconde_sprites_ram: llena 0xDC00-0xDC7F con 0xE0
L_B754:
	ld d,a			;b754
	ld hl,09018h		;b755
	ld bc,02030h		;b758
	xor a			;b75b
	jp 046ffh		;b75c   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
L_B75F:
	ld a,(0e040h)		;b75f
	cp 003h		;b762
	ld a,00bh		;b764
	jp z,08e2eh		;b766   ; p02:8E2E
	xor a			;b769
	jp 08e2eh		;b76a
L_B76D:
	ld a,(0ca97h)		;b76d   ; lee 1 si los mensajes salen de los bancos 50-51 y no de 48-49
	or a			;b770
	jr z,L_B782		;b771
	call 08e77h		;b773   ; p02:8E77
	call 04266h		;b776   ; esconde_sprites_ram: llena 0xDC00-0xDC7F con 0xE0
	call L_B782		;b779
	call 08ea6h		;b77c   ; a_p11_bea2: p11:BEA2 con el banco 11 en 0xA000
	jp 08e7ch		;b77f   ; p02:8E7C
L_B782:
	call L_B888		;b782
	call L_BF42		;b785
	call L_BF10		;b788
	call L_BD89		;b78b
	call L_BDD7		;b78e
	call L_BEDF		;b791
	ld a,(0d79ah)		;b794
	cp 009h		;b797
	jr c,L_B7A7		;b799
	ld a,(0cad0h)		;b79b
	or a			;b79e
	jr nz,L_B7A7		;b79f
	call L_BDFA		;b7a1
	call L_BE14		;b7a4
L_B7A7:
	call 08e1eh		;b7a7   ; a_p03_b8ac: p03:B8AC con el banco 3 en 0xA000
	call L_B85D		;b7aa
	ld a,(0d79ah)		;b7ad
	cp 009h		;b7b0
	jr c,L_B7BD		;b7b2
	ld a,(0cad0h)		;b7b4
	or a			;b7b7
	jr nz,L_B7BD		;b7b8
	call L_BE29		;b7ba
L_B7BD:
	call L_B84B		;b7bd
	ld a,(0d7bbh)		;b7c0
	or a			;b7c3
	ret nz			;b7c4
	ld a,(0e220h)		;b7c5   ; lee la velocidad del mensaje en curso (0 = ninguno; 1-3, 4 sin espera)
	or a			;b7c8
	ret nz			;b7c9
	ld a,(0d793h)		;b7ca
	or a			;b7cd
	ret nz			;b7ce
	ld a,(0e25ah)		;b7cf
	or a			;b7d2
	jr nz,L_B7E1		;b7d3
	ld a,(0ca97h)		;b7d5   ; lee 1 si los mensajes salen de los bancos 50-51 y no de 48-49
	or a			;b7d8
	jr nz,L_B7E1		;b7d9
	ld a,(0e040h)		;b7db
	or a			;b7de
	jr z,L_B7E7		;b7df
L_B7E1:
	ld a,(0e255h)		;b7e1
	or a			;b7e4
	jr z,L_B7F2		;b7e5
L_B7E7:
	ld a,(0ca97h)		;b7e7   ; lee 1 si los mensajes salen de los bancos 50-51 y no de 48-49
	or a			;b7ea
	ret nz			;b7eb
	ld a,(0ca09h)		;b7ec   ; lee lo recien pulsado de las teclas de funcion (bits como 0xCA0A)
	and 01fh		;b7ef
	ret z			;b7f1
L_B7F2:
	xor a			;b7f2
	ld (0e260h),a		;b7f3   ; guarda dos fichas de 8 bytes de los mosaicos de quien habla
	ld (0e268h),a		;b7f6
	ld (0d8a8h),a		;b7f9   ; guarda 1: la ventana del mensaje es estrecha (0xB8 x 0x28)
	ld (0cad0h),a		;b7fc
	ld (0e25ah),a		;b7ff
	ld (0c696h),a		;b802
	inc a			;b805
	ld (0d7b4h),a		;b806
	ld (0cabbh),a		;b809
	ld (0ca69h),a		;b80c   ; guarda el quinto byte de la ficha de la sala (p02:877F)
	ld (0e236h),a		;b80f
	call 08cf0h		;b812   ; dibujos_de_sala_b_9: dibujos_de_sala y deja el banco 9
	call 05f23h		;b815   ; p00:5F23
	call L_B843		;b818
	ld hl,0ca22h		;b81b   ; apunta a la fase de la partida (indice de las listas de p06:B40C)
	ld a,(0cb7fh)		;b81e
	cp (hl)			;b821
	jp nz,L_BF8B		;b822
	ld hl,0cabeh		;b825
	ld a,(hl)			;b828
	or a			;b829
	ld (hl),000h		;b82a
	jp nz,L_BF8B		;b82c
	ld hl,0ca97h		;b82f   ; apunta a 1 si los mensajes salen de los bancos 50-51 y no de 48-49
	ld a,(hl)			;b832
	or a			;b833
	ret z			;b834
	ld (hl),000h		;b835
	call 08e9eh		;b837   ; a_p11_be94: p11:BE94 con el banco 11 en 0xA000
	call 0859eh		;b83a   ; rachas_b007_af4c_bancos_9:
	call 06b12h		;b83d   ; sonido_05: pide el sonido 0x05
	jp 06b1eh		;b840   ; sonido_6a: pide el sonido 0x6A (de los que tienen la partitura en un banco de musica, p16:4CE3)
L_B843:
	ld a,(0ca64h)		;b843
	or a			;b846
	ret z			;b847
	jp 06a11h		;b848   ; sonido_07: pide el sonido 0x07
L_B84B:
	ld a,(0cabbh)		;b84b
	or a			;b84e
	ret nz			;b84f
	ld a,(0cabah)		;b850
	or a			;b853
	ret nz			;b854
	ld hl,0cab4h		;b855
	ld (hl),001h		;b858
	jp 08e63h		;b85a   ; p02:8E63
L_B85D:
	ld hl,0d7bfh		;b85d
	ld a,(0d79ah)		;b860
	cp 009h		;b863
	ld a,(0caa3h)		;b865
	jr c,L_B86C		;b868
	cp (hl)			;b86a
	ret z			;b86b
L_B86C:
	ld (hl),a			;b86c
	ld hl,0ca86h		;b86d
	cp 076h		;b870
	jr z,L_B880		;b872
	cp 07ch		;b874
	jr z,L_B880		;b876
	ld a,(hl)			;b878
	or a			;b879
	ret z			;b87a
	ld (hl),000h		;b87b
	jp 0710ah		;b87d   ; mosaico_a818: el mosaico de p47:A818 en X = 0x60, Y = 0x40 (1 x 3)
L_B880:
	ld a,(hl)			;b880
	dec a			;b881
	ret z			;b882
	ld (hl),001h		;b883
	jp 0710fh		;b885   ; mosaico_a815: el mosaico de p47:A815 en X = 0x60, Y = 0x40 (1 x 3)
L_B888:
	call L_BE60		;b888
	ld a,(0d793h)		;b88b
	call 0424dh		;b88e   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_B891: 13 destinos del despachador p00:424D (call en p09:B88E, el
;   indice en A): B8AB, B962, B97D, BA66, BAB0, BBA3, BBD1, BBE1, BC35, BC5A,
;   BC7E, BC92, BCC4; lo leen p09:B88E (26 bytes)
;   0xb891..0xb8ab  (26 bytes)
DATA_tabla_B891:
	defw 0b8abh,0b962h,0b97dh,0ba66h,0bab0h,0bba3h,0bbd1h,0bbe1h	; b891
	defw 0bc35h,0bc5ah,0bc7eh,0bc92h,0bcc4h	; b8a1

; ======================================================================
; CODIGO 0xb8ab..0xb911  (102 bytes)
; ======================================================================


L_B8AB:
	ld a,(0d7bbh)		;b8ab
	or a			;b8ae
	jr nz,L_B8DF		;b8af
	ld hl,0d796h		;b8b1
	ld a,(hl)			;b8b4
	inc hl			;b8b5
	or (hl)			;b8b6
	jr nz,$+94		;b8b7
	call L_BCE6		;b8b9
	ld a,(0ca08h)		;b8bc   ; lee el mando: joystick y teclado juntos (bits 0-3 las direcciones, 4-5 los disparos)
	and 003h		;b8bf
	jr z,L_B8CC		;b8c1
	call L_B8F6		;b8c3
	ld hl,0d793h		;b8c6
	ld (hl),005h		;b8c9
	ret			;b8cb
L_B8CC:
	ld a,(0d79ah)		;b8cc
	cp 009h		;b8cf
	ret c			;b8d1
	ld a,(0cabeh)		;b8d2
	or a			;b8d5
	ret nz			;b8d6
	ld a,(0ca08h)		;b8d7   ; lee el mando: joystick y teclado juntos (bits 0-3 las direcciones, 4-5 los disparos)
	and 00ch		;b8da
	ret nz			;b8dc
	jr L_B8ED		;b8dd
L_B8DF:
	ld hl,0d7b6h		;b8df   ; apunta a la espera antes de la siguiente accion de la conversacion
	dec (hl)			;b8e2
	ret nz			;b8e3
	ld (hl),003h		;b8e4
	ld a,(0ca97h)		;b8e6   ; lee 1 si los mensajes salen de los bancos 50-51 y no de 48-49
	or a			;b8e9
	call nz,06bfbh		;b8ea   ; sonido_83: pide el sonido 0x83 (de los que tienen la partitura en un banco de musica, p16:4CE3)
L_B8ED:
	call L_B8F6		;b8ed
	ld hl,0d793h		;b8f0
	ld (hl),002h		;b8f3
	ret			;b8f5
L_B8F6:
	ld hl,04088h		;b8f6
	ld de,000d8h		;b8f9
	ld bc,04020h		;b8fc
	ld a,(0ca42h)		;b8ff   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	call 04767h		;b902   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
	ld de,0d7b0h		;b905
	ld hl,0b911h		;b908
	ld bc,00004h		;b90b
	ldir		;b90e
	ret			;b910

; ----------------------------------------------------------------------
; DATOS resto_B911: lo apuntan con el banco puesto p09:B908 (0xB911), p02:8507
;   (0xB914); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p09:B908, p02:8507 (4 bytes)
;   0xb911..0xb915  (4 bytes)
DATA_resto_B911:
	defb 093h,05ch,000h,008h	; b911

; ======================================================================
; CODIGO 0xb915..0xb94e  (57 bytes)
; ======================================================================


L_B915:
	call L_B931		;b915
	ld a,0a0h		;b918
	or b			;b91a
	ld (0d790h),a		;b91b
	ld hl,0d79ah		;b91e
	xor a			;b921
	ld (hl),a			;b922
	inc hl			;b923
	ld (hl),a			;b924
	call 051fdh		;b925   ; rotulos_a7b1:
	xor a			;b928
	ld (0d7b5h),a		;b929
	ld hl,0d793h		;b92c
	inc (hl)			;b92f
	ret			;b930
L_B931:
	ld b,000h		;b931
	ld a,(0d796h)		;b933
	or a			;b936
	jr nz,L_B93E		;b937
	ld b,008h		;b939
	ld a,(0d797h)		;b93b
L_B93E:
	rra			;b93e
	jr c,L_B944		;b93f
	inc b			;b941
	jr L_B93E		;b942
L_B944:
	push bc			;b944
	call L_B94A		;b945
	pop bc			;b948
	ret			;b949
L_B94A:
	ld a,b			;b94a
	call 0424dh		;b94b   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_B94E: 10 destinos del despachador p00:424D (call en p09:B94B, el
;   indice en A): 6AA7, 6AA7, 6AAB, 6AAF, 6AA7, 6AAB, 6AAF, 6AA7, 6AAB, 6AAF;
;   lo leen p09:B94B (20 bytes)
;   0xb94e..0xb962  (20 bytes)
DATA_tabla_B94E:
	defw 06aa7h,06aa7h,06aabh,06aafh,06aa7h,06aabh,06aafh,06aa7h	; b94e
	defw 06aabh,06aafh	; b95e

; ======================================================================
; CODIGO 0xb962..0xbdc1  (1119 bytes)
; ======================================================================


L_B962:
	ld hl,0d796h		;b962
	ld a,(hl)			;b965
	inc hl			;b966
	or (hl)			;b967
	ret z			;b968
	call L_B931		;b969
	ld hl,0d790h		;b96c
	ld a,(hl)			;b96f
	rla			;b970
	rla			;b971
	rla			;b972
	rla			;b973
	and 0f0h		;b974
	or b			;b976
	ld (hl),a			;b977
	ld hl,0d793h		;b978
	dec (hl)			;b97b
	ret			;b97c
L_B97D:
	call L_B99A		;b97d
	ld a,(0d793h)		;b980
	cp 002h		;b983
	ret nz			;b985
	call L_B9C1		;b986
	ld a,(0d7b2h)		;b989
	cp 02ah		;b98c
	ret c			;b98e
	ld hl,0d793h		;b98f
	ld (hl),009h		;b992
	ld hl,(0d7b7h)		;b994   ; lee el mensaje que toca (16 bits)
	jp L_BE53		;b997
L_B99A:
	ld hl,0dfech		;b99a
	ld a,(hl)			;b99d
	or a			;b99e
	ret nz			;b99f
	ld hl,(0d7b7h)		;b9a0   ; lee el mensaje que toca (16 bits)
	call 063afh		;b9a3   ; byte_del_mensaje: A = el byte siguiente de HL en el banco de los mensajes
	ld b,a			;b9a6
	cp 076h		;b9a7
	ret z			;b9a9
	ld a,(0e040h)		;b9aa
	cp 003h		;b9ad
	jr nz,L_B9B5		;b9af
	ld a,b			;b9b1
	cp 07ch		;b9b2
	ret z			;b9b4
L_B9B5:
	ld a,(0d793h)		;b9b5
	ld (0dfedh),a		;b9b8
	ld a,00ch		;b9bb
	ld (0d793h),a		;b9bd
	ret			;b9c0
L_B9C1:
	call L_B9C6		;b9c1
	jr L_B9E6		;b9c4
L_B9C6:
	ld a,(0d7b2h)		;b9c6
	or a			;b9c9
	ret z			;b9ca
	call L_B9DB		;b9cb
	dec l			;b9ce
	ld a,099h		;b9cf
	jp 046ffh		;b9d1   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
L_B9D4:
	call L_B9DB		;b9d4
	xor a			;b9d7
	jp 046ffh		;b9d8   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
L_B9DB:
	call L_BA0E		;b9db
	ld b,d			;b9de
	ld d,a			;b9df
	ld a,l			;b9e0
	add a,e			;b9e1
	ld l,a			;b9e2
	ld c,002h		;b9e3
	ret			;b9e5
L_B9E6:
	ld hl,0d7b1h		;b9e6
	ld a,(hl)			;b9e9
	cp 004h		;b9ea
	jr c,L_BA01		;b9ec
	ld a,(hl)			;b9ee
	sub 004h		;b9ef
	ld (hl),a			;b9f1
	inc hl			;b9f2
	inc hl			;b9f3
	ld a,(hl)			;b9f4
	add a,008h		;b9f5
	ld (hl),a			;b9f7
	call L_BA0E		;b9f8
	ld b,d			;b9fb
	ld c,007h		;b9fc
	jp 0467ch		;b9fe   ; linea_horizontal: orden LINE del VDP (R#36-R#46) con el lado largo en X
L_BA01:
	inc hl			;ba01
	ld a,(hl)			;ba02
	add a,002h		;ba03
	ld (hl),a			;ba05
	call L_BA0E		;ba06
	ld c,007h		;ba09
	jp 046bch		;ba0b   ; marco: cuatro lineas: un marco de D x E desde HL
L_BA0E:
	ld hl,0d7b0h		;ba0e
	ld c,(hl)			;ba11
	inc hl			;ba12
	ld b,(hl)			;ba13
	inc hl			;ba14
	ld e,(hl)			;ba15
	inc hl			;ba16
	ld d,(hl)			;ba17
	ld l,c			;ba18
	ld h,b			;ba19
	ld a,(0ca42h)		;ba1a   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	ret			;ba1d
L_BA1E:
	ld hl,00e16h		;ba1e
	ld de,02434h		;ba21
	call L_BA2D		;ba24
	ld hl,08e16h		;ba27
	ld de,02434h		;ba2a
L_BA2D:
	ld a,(0ca42h)		;ba2d   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	ld c,00dh		;ba30
	jp 046bch		;ba32   ; marco: cuatro lineas: un marco de D x E desde HL
L_BA35:
	ld a,(0e040h)		;ba35
	cp 003h		;ba38
	ld a,00bh		;ba3a
	jr z,L_BA3F		;ba3c
	xor a			;ba3e
L_BA3F:
	ld b,000h		;ba3f
	ld de,01018h		;ba41
	jp 08e16h		;ba44   ; a_p03_b814: p03:B814 con el banco 3 en 0xA000
L_BA47:
	call L_BC0B		;ba47
	ret nc			;ba4a
	ld hl,0cad0h		;ba4b
	ld (hl),001h		;ba4e
	inc a			;ba50
	push af			;ba51
	call 08e2eh		;ba52
	pop af			;ba55
	ld de,09018h		;ba56
	ld b,001h		;ba59
	call 08e16h		;ba5b   ; a_p03_b814: p03:B814 con el banco 3 en 0xA000
	xor a			;ba5e
	ld hl,0d7bch		;ba5f
	ld (hl),a			;ba62
	inc a			;ba63
	ld (hl),a			;ba64
	ret			;ba65
L_BA66:
	ld a,(0cad0h)		;ba66
	cp 001h		;ba69
	ret z			;ba6b
	call 0657fh		;ba6c   ; mensaje_cada_cuadro_b_9: mensaje_cada_cuadro y deja el banco 9
	ld a,(0caddh)		;ba6f
	cp 002h		;ba72
	jr z,L_BA7B		;ba74
	ld a,(0e220h)		;ba76   ; lee la velocidad del mensaje en curso (0 = ninguno; 1-3, 4 sin espera)
	or a			;ba79
	ret nz			;ba7a
L_BA7B:
	call L_BA9B		;ba7b
	ld a,(0caddh)		;ba7e
	cp 003h		;ba81
	jr nc,L_BA93		;ba83
	ld a,(0ca07h)		;ba85   ; lee lo recien pulsado del mando (los bits de 0xCA08 que no estaban)
	and 030h		;ba88
	jr nz,L_BA96		;ba8a
	ld a,007h		;ba8c
	call 00141h		;ba8e   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	rla			;ba91
	ret c			;ba92
L_BA93:
	call L_BAA8		;ba93
L_BA96:
	ld hl,0d793h		;ba96
	inc (hl)			;ba99
	ret			;ba9a
L_BA9B:
	ld a,(0caddh)		;ba9b
	cp 002h		;ba9e
	jr nz,L_BAA8		;baa0
	ld a,003h		;baa2
	ld (0caddh),a		;baa4
	ret			;baa7
L_BAA8:
	xor a			;baa8
	ld (0caddh),a		;baa9
	ld (0e220h),a		;baac   ; guarda la velocidad del mensaje en curso (0 = ninguno; 1-3, 4 sin espera)
	ret			;baaf
L_BAB0:
	xor a			;bab0
	ld (0cb71h),a		;bab1
	ld a,(0cb70h)		;bab4
	or a			;bab7
	jr z,L_BAC1		;bab8
	xor a			;baba
	ld (0cb70h),a		;babb
	call 06b12h		;babe   ; sonido_05: pide el sonido 0x05
L_BAC1:
	call L_BB27		;bac1
	ld a,(0d7b1h)		;bac4
	cp 05ch		;bac7
	ret nz			;bac9
	call L_BB95		;baca
	call L_BB5B		;bacd
	xor a			;bad0
	ld (0d793h),a		;bad1
	ld (0d7bbh),a		;bad4
	ld (0e255h),a		;bad7
	inc a			;bada
	ld (0d7b5h),a		;badb
	ld (0d795h),a		;bade
	ld hl,0cb7dh		;bae1
	ld a,(hl)			;bae4
	or a			;bae5
	ret z			;bae6
	ld (hl),000h		;bae7
	ld a,(0d790h)		;bae9
	cp 051h		;baec
	jr z,L_BAFE		;baee
	cp 082h		;baf0
	jr z,L_BAFE		;baf2
L_BAF4:
	ld a,(0ca5fh)		;baf4   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	or a			;baf7
	jp nz,08c24h		;baf8
	jp 08e81h		;bafb
L_BAFE:
	call 06b12h		;bafe   ; sonido_05: pide el sonido 0x05
	call L_BAF4		;bb01
	call L_BB12		;bb04
	ld a,(0ca5fh)		;bb07   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	or a			;bb0a
	ret nz			;bb0b
	ld hl,0ca18h		;bb0c   ; apunta a la espera hasta poner la musica pendiente
	ld (hl),0ffh		;bb0f
	ret			;bb11
L_BB12:
	ld a,(0d800h)		;bb12   ; lee 4 fichas de 0x20 bytes de 0xD800 (p04:89C3); sus tipos los lleva p10
	cp 001h		;bb15
	ret nz			;bb17
	ld a,(0ca50h)		;bb18   ; lee la fila de la sala en la zona (uno mas al salir por arriba)
	sub 007h		;bb1b
	cp 002h		;bb1d
	ret nc			;bb1f
	ld hl,06b6dh		;bb20
	ld (0ca19h),hl		;bb23   ; guarda la musica pendiente: la rutina que la pide (16 bits)
	ret			;bb26
L_BB27:
	call L_BB32		;bb27
	ld a,(0d7b2h)		;bb2a
	or a			;bb2d
	ret z			;bb2e
	jp L_B9D4		;bb2f
L_BB32:
	ld a,(0d7b2h)		;bb32
	or a			;bb35
	jr nz,L_BB7E		;bb36
	call L_BA0E		;bb38
	ld b,d			;bb3b
	ld c,000h		;bb3c
	call 0467ch		;bb3e   ; linea_horizontal: orden LINE del VDP (R#36-R#46) con el lado largo en X
	ld hl,0d7b0h		;bb41
	inc hl			;bb44
	ld a,(hl)			;bb45
	add a,004h		;bb46
	ld (hl),a			;bb48
	inc hl			;bb49
	inc hl			;bb4a
	ld a,(hl)			;bb4b
	sub 008h		;bb4c
	ld (hl),a			;bb4e
	call L_BB5B		;bb4f
	call L_BA0E		;bb52
	ld b,d			;bb55
	ld c,007h		;bb56
	jp 0467ch		;bb58   ; linea_horizontal: orden LINE del VDP (R#36-R#46) con el lado largo en X
L_BB5B:
	xor a			;bb5b
	ld c,002h		;bb5c
	jr L_BB69		;bb5e
L_BB60:
	ld a,(0d7b2h)		;bb60
	cp 016h		;bb63
	ret nc			;bb65
	inc a			;bb66
	ld c,004h		;bb67
L_BB69:
	add a,0e3h		;bb69
	ld l,a			;bb6b
	sub 050h		;bb6c
	ld e,a			;bb6e
	ld h,000h		;bb6f
	ld d,040h		;bb71
	ld b,d			;bb73
	ld a,(0ca42h)		;bb74   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	rla			;bb77
	rla			;bb78
	and 00ch		;bb79
	jp 04767h		;bb7b   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
L_BB7E:
	ld hl,0d7b2h		;bb7e
	ld a,(hl)			;bb81
	sub 002h		;bb82
	ld (hl),a			;bb84
	ld a,(hl)			;bb85
	or a			;bb86
	jp z,L_B9D4		;bb87
	call L_BA0E		;bb8a
	ld c,007h		;bb8d
	call 046bch		;bb8f   ; marco: cuatro lineas: un marco de D x E desde HL
	jp L_BB60		;bb92
L_BB95:
	ld a,(0e268h)		;bb95
	or a			;bb98
	ret z			;bb99
	ld a,002h		;bb9a
	ld (0cad0h),a		;bb9c
	ld (0e269h),a		;bb9f
	ret			;bba2
L_BBA3:
	call L_B9C1		;bba3
	ld a,(0d7b2h)		;bba6
	cp 02ah		;bba9
	ret c			;bbab
	ld hl,0d793h		;bbac
	inc (hl)			;bbaf
	call L_BBB6		;bbb0
	jp 064e8h		;bbb3   ; mensaje_8016: el mensaje de p48:8016 abajo
L_BBB6:
	ld a,(0d790h)		;bbb6
	cp 024h		;bbb9
	ret nz			;bbbb
	ld hl,0d7e4h		;bbbc
	bit 6,(hl)		;bbbf
	ret nz			;bbc1
	ld a,(0cb72h)		;bbc2
	or a			;bbc5
	ret z			;bbc6
	set 6,(hl)		;bbc7
	res 2,(hl)		;bbc9
	ld hl,0d7a0h		;bbcb
	ld (hl),024h		;bbce
	ret			;bbd0
L_BBD1:
	call 0657fh		;bbd1   ; mensaje_cada_cuadro_b_9: mensaje_cada_cuadro y deja el banco 9
	ld a,(0e220h)		;bbd4   ; lee la velocidad del mensaje en curso (0 = ninguno; 1-3, 4 sin espera)
	or a			;bbd7
	ret nz			;bbd8
	ld hl,0d7b6h		;bbd9   ; apunta a la espera antes de la siguiente accion de la conversacion
	ld (hl),030h		;bbdc
	jp L_BA96		;bbde
L_BBE1:
	ld hl,0d7b6h		;bbe1   ; apunta a la espera antes de la siguiente accion de la conversacion
	dec (hl)			;bbe4
	ret nz			;bbe5
	call L_BC00		;bbe6
	ld a,(0ca9ch)		;bbe9   ; lee 1 si una conversacion ha encontrado su ficha
	or a			;bbec
	jr z,L_BBFA		;bbed
	call L_BDEB		;bbef
	ld hl,0d7b6h		;bbf2   ; apunta a la espera antes de la siguiente accion de la conversacion
	ld (hl),003h		;bbf5
	jp L_BA96		;bbf7
L_BBFA:
	ld hl,0d793h		;bbfa
	ld (hl),004h		;bbfd
	ret			;bbff
L_BC00:
	xor a			;bc00
	ld (0ca9ch),a		;bc01   ; guarda 1 si una conversacion ha encontrado su ficha
	call L_BC0B		;bc04
	ret nc			;bc07
	jp 063c0h		;bc08   ; conversacion_a: la conversacion A del banco 48
L_BC0B:
	ld a,(0e040h)		;bc0b
	cp 008h		;bc0e
	jr z,L_BC29		;bc10
	ld a,(0e040h)		;bc12
	cp 009h		;bc15
	jr z,L_BC29		;bc17
	ld a,(0d790h)		;bc19
	ld c,a			;bc1c
	ld b,010h		;bc1d
	ld hl,0d7a0h		;bc1f
L_BC22:
	ld a,(hl)			;bc22
	cp c			;bc23
	jr z,L_BC2B		;bc24
	inc hl			;bc26
	djnz L_BC22		;bc27
L_BC29:
	or a			;bc29
	ret			;bc2a
L_BC2B:
	or a			;bc2b
	ret z			;bc2c
	ld a,010h		;bc2d
	sub b			;bc2f
	ld (0d7beh),a		;bc30
	scf			;bc33
	ret			;bc34
L_BC35:
	ld hl,0d7b6h		;bc35   ; apunta a la espera antes de la siguiente accion de la conversacion
	dec (hl)			;bc38
	ret nz			;bc39
	ld (hl),003h		;bc3a
	call L_BD60		;bc3c
	ld a,(0d79ah)		;bc3f
	cp 009h		;bc42
	ret c			;bc44
	inc a			;bc45
	ld (0cb71h),a		;bc46
	ld hl,(0d7b7h)		;bc49   ; lee el mensaje que toca (16 bits)
	call L_BE53		;bc4c
	call L_BA96		;bc4f
	ld hl,0dfech		;bc52
	ld (hl),001h		;bc55
	jp L_BA47		;bc57
L_BC5A:
	call L_B99A		;bc5a
	ld a,(0d793h)		;bc5d
	cp 009h		;bc60
	ret nz			;bc62
	ld a,(0cad0h)		;bc63
	cp 001h		;bc66
	ret z			;bc68
	call 0657fh		;bc69   ; mensaje_cada_cuadro_b_9: mensaje_cada_cuadro y deja el banco 9
	ld a,(0caddh)		;bc6c
	cp 002h		;bc6f
	jr z,L_BC78		;bc71
	ld a,(0e220h)		;bc73   ; lee la velocidad del mensaje en curso (0 = ninguno; 1-3, 4 sin espera)
	or a			;bc76
	ret nz			;bc77
L_BC78:
	call L_BA9B		;bc78
	jp 06182h		;bc7b   ; siguiente_accion: la accion que sigue en la conversacion (0xFE [espera]...) o acaba
L_BC7E:
	ld hl,0d7b6h		;bc7e   ; apunta a la espera antes de la siguiente accion de la conversacion
	dec (hl)			;bc81
	ret nz			;bc82
	call L_BDEB		;bc83
	ld hl,(0d7b7h)		;bc86   ; lee el mensaje que toca (16 bits)
	call L_BE53		;bc89
	ld hl,0d793h		;bc8c
	ld (hl),009h		;bc8f
	ret			;bc91
L_BC92:
	ld a,(0caddh)		;bc92
	cp 003h		;bc95
	jr z,L_BCB4		;bc97
	ld a,(0cb5dh)		;bc99
	or a			;bc9c
	jr z,L_BCA6		;bc9d
	ld hl,0cb5eh		;bc9f
	dec (hl)			;bca2
	jr z,L_BCB4		;bca3
	ret			;bca5
L_BCA6:
	ld a,(0ca07h)		;bca6   ; lee lo recien pulsado del mando (los bits de 0xCA08 que no estaban)
	and 030h		;bca9
	jr nz,L_BCB4		;bcab
	ld a,007h		;bcad
	call 00141h		;bcaf   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	rla			;bcb2
	ret c			;bcb3
L_BCB4:
	call L_BAA8		;bcb4
	ld a,(0ca97h)		;bcb7   ; lee 1 si los mensajes salen de los bancos 50-51 y no de 48-49
	or a			;bcba
	call nz,06be8h		;bcbb   ; orden_sonido_f6: la orden 0xF6 al sonido
	ld hl,0d793h		;bcbe
	ld (hl),004h		;bcc1
	ret			;bcc3
L_BCC4:
	ld hl,0dfech		;bcc4
	ld a,(hl)			;bcc7
	or a			;bcc8
	jr z,L_BCE1		;bcc9
	call L_BD60		;bccb
	ld a,(0cad0h)		;bcce
	cp 001h		;bcd1
	ret z			;bcd3
	ld a,(0d79ah)		;bcd4
	cp 009h		;bcd7
	ret c			;bcd9
	ld a,(0dfedh)		;bcda
	ld (0d793h),a		;bcdd
	ret			;bce0
L_BCE1:
	ld (hl),001h		;bce1
	jp L_BA47		;bce3
L_BCE6:
	ld hl,0d795h		;bce6
	dec (hl)			;bce9
	ret nz			;bcea
	ld (hl),003h		;bceb
	call L_BCF2		;bced
	jr L_BD14		;bcf0
L_BCF2:
	ld a,(0ca08h)		;bcf2   ; lee el mando: joystick y teclado juntos (bits 0-3 las direcciones, 4-5 los disparos)
	and 00ch		;bcf5
	or a			;bcf7
	ret z			;bcf8
	cp 00ch		;bcf9
	ret z			;bcfb
	xor a			;bcfc
	ld (0d7b5h),a		;bcfd
	ld a,(0ca08h)		;bd00   ; lee el mando: joystick y teclado juntos (bits 0-3 las direcciones, 4-5 los disparos)
	bit 3,a		;bd03
	ld hl,0d790h		;bd05
	ld a,(hl)			;bd08
	jr nz,L_BD10		;bd09
	sub 001h		;bd0b
L_BD0D:
	daa			;bd0d
	ld (hl),a			;bd0e
	ret			;bd0f
L_BD10:
	add a,001h		;bd10
	jr L_BD0D		;bd12
L_BD14:
	ld hl,0d79ah		;bd14
	ld a,(hl)			;bd17
	ld (0d79bh),a		;bd18
	call L_BD36		;bd1b
	ld hl,0d79ah		;bd1e
	jr nc,L_BD30		;bd21
	ld a,(0d7b5h)		;bd23
	or a			;bd26
	jr nz,L_BD30		;bd27
	ld a,(hl)			;bd29
	cp 009h		;bd2a
	ret nc			;bd2c
	inc a			;bd2d
	ld (hl),a			;bd2e
	ret			;bd2f
L_BD30:
	ld a,(hl)			;bd30
	or a			;bd31
	ret z			;bd32
	dec a			;bd33
	ld (hl),a			;bd34
	ret			;bd35
L_BD36:
	ld a,(0d790h)		;bd36
	ld c,a			;bd39
	ld b,010h		;bd3a
	ld hl,0d7a0h		;bd3c
L_BD3F:
	ld a,(hl)			;bd3f
	cp c			;bd40
	jr z,L_BD48		;bd41
	inc hl			;bd43
	djnz L_BD3F		;bd44
	or a			;bd46
	ret			;bd47
L_BD48:
	ld a,010h		;bd48
	sub b			;bd4a
	inc a			;bd4b
	cp 009h		;bd4c
	ld hl,0d79ch		;bd4e
	jr c,L_BD56		;bd51
	sub 008h		;bd53
	inc hl			;bd55
L_BD56:
	ld b,a			;bd56
	ld a,(hl)			;bd57
L_BD58:
	rra			;bd58
	rr c		;bd59
	djnz L_BD58		;bd5b
	rl c		;bd5d
	ret			;bd5f
L_BD60:
	ld hl,0d79ah		;bd60
	ld a,(hl)			;bd63
	cp 009h		;bd64
	ret nc			;bd66
	ld (0d79bh),a		;bd67
	ld a,(0e040h)		;bd6a
	or a			;bd6d
	ld a,009h		;bd6e
	jr nz,L_BD77		;bd70
	ld hl,0d79ah		;bd72
	ld a,(hl)			;bd75
	inc a			;bd76
L_BD77:
	cp 009h		;bd77
	jr c,L_BD7D		;bd79
	ld a,009h		;bd7b
L_BD7D:
	ld (hl),a			;bd7d
	ld hl,0cb77h		;bd7e
	ld a,(hl)			;bd81
	or a			;bd82
	ret nz			;bd83
	ld (hl),001h		;bd84
	jp 06aa3h		;bd86   ; sonido_2a: pide el sonido 0x2A
L_BD89:
	ld hl,0d790h		;bd89
	ld de,07048h		;bd8c
	jr L_BDA0		;bd8f
L_BD91:
	call L_BD89		;bd91
	inc hl			;bd94
	ld a,d			;bd95
	sub 008h		;bd96
	ld d,a			;bd98
	call L_BDA0		;bd99
	inc hl			;bd9c
	ld a,(hl)			;bd9d
	jr L_BDA9		;bd9e
L_BDA0:
	ld a,(hl)			;bda0
	call L_BDA9		;bda1
	ld a,(hl)			;bda4
	rra			;bda5
	rra			;bda6
	rra			;bda7
	rra			;bda8
L_BDA9:
	push hl			;bda9
	push de			;bdaa
	and 00fh		;bdab
	add a,a			;bdad
	ld hl,0bdc1h		;bdae
	call 0423eh		;bdb1   ; suma_a_hl: HL = HL + A
	ld bc,00201h		;bdb4
	call 08d25h		;bdb7   ; p02:8D25
	pop de			;bdba
	pop hl			;bdbb
	ld a,d			;bdbc
	sub 008h		;bdbd
	ld d,a			;bdbf
	ret			;bdc0

; ----------------------------------------------------------------------
; DATOS resto_BDC1: lo apuntan con el banco puesto p09:BDAE (0xBDC1); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p09:BDAE (22 bytes)
;   0xbdc1..0xbdd7  (22 bytes)
DATA_resto_BDC1:
	defb 008h,009h,00ah,00bh,00ch,00dh,00eh,00fh,010h,011h,012h,013h,014h,015h,016h,017h	; bdc1  ................
	defb 018h,019h,018h,013h,01bh,01bh	; bdd1

; ======================================================================
; CODIGO 0xbdd7..0xbe50  (121 bytes)
; ======================================================================


L_BDD7:
	ld a,(0d79bh)		;bdd7
	ld b,a			;bdda
	ld a,(0d79ah)		;bddb
	cp b			;bdde
	ret z			;bddf
	cp 009h		;bde0
	jp c,051fdh		;bde2   ; rotulos_a7b1:
	ld (0d79bh),a		;bde5
	jp 051fdh		;bde8   ; rotulos_a7b1:
L_BDEB:
	ld hl,00898h		;bdeb
	ld bc,0b020h		;bdee
	ld a,(0ca42h)		;bdf1   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	ld d,a			;bdf4
	ld a,099h		;bdf5
	jp 046ffh		;bdf7   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
L_BDFA:
	ld a,(0cabeh)		;bdfa
	or a			;bdfd
	ret nz			;bdfe
	ld a,(0ca03h)		;bdff   ; lee el contador de cuadros (uno mas en cada interrupcion)
	rra			;be02
	ret c			;be03
	ld a,(0d7bch)		;be04
	ld de,09018h		;be07
	add a,e			;be0a
	ld e,a			;be0b
	ld h,d			;be0c
	ld l,e			;be0d
	ld bc,02001h		;be0e
	jp 0475ah		;be11   ; copia_rectangulo_a_la_otra: p00:4767 de la pagina 0xCA42 a la otra
L_BE14:
	ld a,(0cabeh)		;be14
	or a			;be17
	ret nz			;be18
	ld a,(0ca03h)		;be19   ; lee el contador de cuadros (uno mas en cada interrupcion)
	rra			;be1c
	ret c			;be1d
	ld hl,0d7bch		;be1e
	inc (hl)			;be21
	ld a,(hl)			;be22
	cp 030h		;be23
	ret c			;be25
	ld (hl),000h		;be26
	ret			;be28
L_BE29:
	ld a,(0cabeh)		;be29
	or a			;be2c
	ret nz			;be2d
	ld a,(0ca03h)		;be2e   ; lee el contador de cuadros (uno mas en cada interrupcion)
	rra			;be31
	ret c			;be32
	ld a,(0d7bch)		;be33
	ld de,09018h		;be36
	add a,e			;be39
	ld e,a			;be3a
	ld a,(0d7bch)		;be3b
	ld hl,0d0d0h		;be3e
	add a,l			;be41
	ld l,a			;be42
	ld a,(0ca42h)		;be43   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	rlca			;be46
	rlca			;be47
	or 003h		;be48
	ld bc,02001h		;be4a
	jp 04767h		;be4d   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)

; ----------------------------------------------------------------------
; DATOS sin identificar  0xbe50..0xbe53  (3 bytes)
DATA_BE50:
	defb 0cdh,053h,0beh	; be50

; ======================================================================
; CODIGO 0xbe53..0xbfa5  (338 bytes)
; ======================================================================


L_BE53:
	push hl			;be53
	call 06383h		;be54   ; numero_de_conversacion: A = el numero de la conversacion BC en la lista de p48:800C (acarreo si esta)
	jr nc,L_BE5C		;be57
	call 08e43h		;be59   ; a_p06_aeff: p06:AEFF con el banco 6 en 0xA000
L_BE5C:
	pop hl			;be5c
	jp 064f4h		;be5d   ; mensaje_abajo_bancos_9:
L_BE60:
	call L_BE7D		;be60
	call L_BE6B		;be63
	call L_BE9E		;be66
	jr L_BE70		;be69
L_BE6B:
	ld hl,0d798h		;be6b
	jr L_BE75		;be6e
L_BE70:
	ld hl,0d799h		;be70
	jr L_BE75		;be73
L_BE75:
	ld c,(hl)			;be75
	ld (hl),a			;be76
	xor c			;be77
	and (hl)			;be78
	dec hl			;be79
	dec hl			;be7a
	ld (hl),a			;be7b
	ret			;be7c
L_BE7D:
	xor a			;be7d
	call 00141h		;be7e   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;be81
	push af			;be82
	ld a,009h		;be83
	call 00141h		;be85   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;be88
	push af			;be89
	ld a,00ah		;be8a
	call 00141h		;be8c   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;be8f
	pop bc			;be90
	rra			;be91
	rr b		;be92
	rra			;be94
	rr b		;be95
	rra			;be97
	rr b		;be98
	ld a,b			;be9a
	pop bc			;be9b
	or b			;be9c
	ret			;be9d
L_BE9E:
	ld a,001h		;be9e
	call 00141h		;bea0   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;bea3
	and 003h		;bea4
	push af			;bea6
	ld a,00ah		;bea7
	call 00141h		;bea9   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;beac
	rra			;bead
	rra			;beae
	rra			;beaf
	and 003h		;beb0
	pop bc			;beb2
	or b			;beb3
	ret			;beb4
L_BEB5:
	ld a,(0e040h)		;beb5
	cp 007h		;beb8
	jr nc,L_BEDA		;beba
	call 063b6h		;bebc   ; byte_del_mensaje_d7b7: A = el segundo byte del mensaje que toca
	cp 0d0h		;bebf
	ld b,076h		;bec1
	jr c,L_BEC7		;bec3
	ld b,0cah		;bec5
L_BEC7:
	sub b			;bec7
	ld hl,0bfe1h		;bec8
	call 0423eh		;becb   ; suma_a_hl: HL = HL + A
	ld a,(hl)			;bece
	ld hl,0d7a0h		;becf
	call 0423eh		;bed2   ; suma_a_hl: HL = HL + A
	ld a,(hl)			;bed5
	ld (0d790h),a		;bed6
	ret			;bed9
L_BEDA:
	xor a			;beda
	ld (0d790h),a		;bedb
	ret			;bede
L_BEDF:
	ld a,(0cb70h)		;bedf
	or a			;bee2
	ret nz			;bee3
	ld a,(0cabeh)		;bee4
	or a			;bee7
	ret nz			;bee8
	ld hl,0cb77h		;bee9
	ld a,(0d79ah)		;beec
	or a			;beef
	jr z,L_BF0D		;bef0
	cp 009h		;bef2
	jr z,L_BF0D		;bef4
	cp 001h		;bef6
	jr z,L_BF05		;bef8
	cp 008h		;befa
	ret nz			;befc
	ld a,(hl)			;befd
	or a			;befe
	ret nz			;beff
	ld (hl),001h		;bf00
	jp 06ab3h		;bf02   ; sonido_2e: pide el sonido 0x2E
L_BF05:
	ld a,(hl)			;bf05
	or a			;bf06
	ret nz			;bf07
	ld (hl),001h		;bf08
	jp 06aa3h		;bf0a   ; sonido_2a: pide el sonido 0x2A
L_BF0D:
	ld (hl),000h		;bf0d
	ret			;bf0f
L_BF10:
	ld a,(0d7e4h)		;bf10
	bit 3,a		;bf13
	ret z			;bf15
	ld a,(0d7d6h)		;bf16
	bit 2,a		;bf19
	ret z			;bf1b
	ld a,(0cb71h)		;bf1c
	or a			;bf1f
	ret z			;bf20
	ld hl,0cb70h		;bf21
	ld a,(0d790h)		;bf24
	cp 066h		;bf27
	jr z,L_BF36		;bf29
	cp 007h		;bf2b
	ret z			;bf2d
	ld a,(hl)			;bf2e
	or a			;bf2f
	ret z			;bf30
	ld (hl),000h		;bf31
	jp 06b12h		;bf33   ; sonido_05: pide el sonido 0x05
L_BF36:
	ld a,(hl)			;bf36
	or a			;bf37
	ret nz			;bf38
	ld a,001h		;bf39
	ld (hl),a			;bf3b
	ld (0cb72h),a		;bf3c
	jp 06a9fh		;bf3f   ; sonido_29: pide el sonido 0x29
L_BF42:
	call 07b8dh		;bf42   ; a_p15_bdb8: p15:BDB8 con el banco 15 en 0xA000
	ld hl,0cabeh		;bf45
	ld a,b			;bf48
	or a			;bf49
	jr nz,L_BF86		;bf4a
	ld a,(0ca64h)		;bf4c
	or a			;bf4f
	jr nz,L_BF86		;bf50
	ld a,(0ca76h)		;bf52   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 02ah		;bf55
	jr z,L_BF86		;bf57
	cp 002h		;bf59
	jr z,L_BF86		;bf5b
	ld a,(0cb21h)		;bf5d   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	dec a			;bf60
	jr nz,L_BF86		;bf61
	ld a,(0ca5fh)		;bf63   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	or a			;bf66
	jr nz,L_BF86		;bf67
	ld a,(0d8c0h)		;bf69   ; lee 1 con Snake dentro de lo de 0xD8C2 (p07:A40D; 0 al salir, p07:A69A)
	or a			;bf6c
	jr nz,L_BF86		;bf6d
	ld a,(0d790h)		;bf6f
	cp 007h		;bf72
	jr z,L_BF7B		;bf74
	cp 066h		;bf76
	jr nz,L_BF86		;bf78
	ret			;bf7a
L_BF7B:
	ld a,(hl)			;bf7b
	or a			;bf7c
	jr nz,L_BF98		;bf7d
	ld (hl),001h		;bf7f
	call L_BFB5		;bf81
	jr L_BF98		;bf84
L_BF86:
	ld a,(hl)			;bf86
	or a			;bf87
	ret z			;bf88
	ld (hl),000h		;bf89
L_BF8B:
	call 06c0fh		;bf8b   ; sonido_02: pide el sonido 0x02
	ld a,(0ca5fh)		;bf8e   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	or a			;bf91
	jp nz,08c24h		;bf92   ; p02:8C24
	jp 08eb6h		;bf95   ; p02:8EB6
L_BF98:
	ld a,(0c58eh)		;bf98
	ld hl,0bfa5h		;bf9b
	call 04248h		;bf9e   ; byte_de_tabla: A = el byte A de la tabla de HL (y HL apunta a el)
	ld (0d79ah),a		;bfa1
	ret			;bfa4

; ----------------------------------------------------------------------
; DATOS resto_BFA5: lo apuntan con el banco puesto p09:BF9B (0xBFA5); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p09:BF9B (16 bytes)
;   0xbfa5..0xbfb5  (16 bytes)
DATA_resto_BFA5:
	defb 001h,001h,001h,001h,001h,001h,002h,002h,003h,003h,004h,005h,006h,007h,008h,009h	; bfa5  ................

; ======================================================================
; CODIGO 0xbfb5..0xbfc1  (12 bytes)
; ======================================================================


L_BFB5:
	call 06c0fh		;bfb5   ; sonido_02: pide el sonido 0x02
	ld a,(0ca03h)		;bfb8   ; lee el contador de cuadros (uno mas en cada interrupcion)
	rra			;bfbb
	and 00fh		;bfbc
	call 0424dh		;bfbe   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_BFC1: 16 destinos del despachador p00:424D (call en p09:BFBE, el
;   indice en A): 6C03, 6C07, 6BA4, 6C27, 6BAC, 6BB0, 6BB4, 6BB8, 6BBC, 6BC0,
;   6BC4, 6CC2, 6B45, 6B79, 6B7D, 6B95; lo leen p09:BFBE (32 bytes)
;   0xbfc1..0xbfe1  (32 bytes)
DATA_tabla_BFC1:
	defw 06c03h,06c07h,06ba4h,06c27h,06bach,06bb0h,06bb4h,06bb8h	; bfc1
	defw 06bbch,06bc0h,06bc4h,06cc2h,06b45h,06b79h,06b7dh,06b95h	; bfd1

; ----------------------------------------------------------------------
; DATOS resto_BFE1: lo apuntan con el banco puesto p09:BEC8 (0xBFE1); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p09:BEC8 (31 bytes)
;   0xbfe1..0xc000  (31 bytes)
DATA_resto_BFE1:
	defb 000h,000h,003h,001h,002h,004h,006h,006h,005h,007h,00ch,00ch,00ch,00ch,00ch,00ch	; bfe1  ................
	defb 00ch,00ch,00ch,00ch,00ch,000h,000h,000h,0c0h,021h,0a4h,0d8h,0c3h,0e5h,0b3h	; bff1  .........!.....
