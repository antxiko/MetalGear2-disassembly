; ==========================================================================
; METAL GEAR 2 SOLID SNAKE - Konami (1990) - MSX2 - MegaROM RC-767 de 512 KB (Konami SCC) - banco 06 (se ejecuta en 0xa000)
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
L_A97D:	equ 0x0a97d
L_AA80:	equ 0x0aa80
L_AADA:	equ 0x0aada
L_AC28:	equ 0x0ac28
L_AC43:	equ 0x0ac43
L_AC48:	equ 0x0ac48
L_AC4C:	equ 0x0ac4c
L_AC58:	equ 0x0ac58
L_AC90:	equ 0x0ac90
L_AC9F:	equ 0x0ac9f
L_ACDA:	equ 0x0acda
L_ACF6:	equ 0x0acf6
L_AD03:	equ 0x0ad03
L_AD18:	equ 0x0ad18
L_AD29:	equ 0x0ad29
L_B004:	equ 0x0b004
L_B211:	equ 0x0b211

; ======================================================================
; CODIGO 0xa000..0xa19c  (412 bytes)
; ======================================================================


L_A000:
	ld a,(0d800h)		;a000   ; lee 4 fichas de 0x20 bytes de 0xD800 (p04:89C3); sus tipos los lleva p10
	cp 001h		;a003
	ret nz			;a005
	ld a,(0ca50h)		;a006   ; lee la fila de la sala en la zona (uno mas al salir por arriba)
	sub 007h		;a009
	cp 002h		;a00b
	ret nc			;a00d
	ld a,(0d801h)		;a00e
	cp 003h		;a011
	ret c			;a013
	ld a,(0d816h)		;a014
	and a			;a017
	ret z			;a018
	ld a,(0cb80h)		;a019   ; lee las 6 fichas de 16 bytes de lo que lanza Snake ([tipo][..][Y 8.8][X 8.8][velocidades]...)
	cp 005h		;a01c
	ret nz			;a01e
	ld a,(0cb81h)		;a01f
	cp 003h		;a022
	ret nz			;a024
	ld hl,(0caebh)		;a025
	ld a,l			;a028
	call L_A093		;a029
	ld c,b			;a02c
	ld l,a			;a02d
	ld a,h			;a02e
	call L_A07E		;a02f
	ld h,a			;a032
	ld de,(0ca50h)		;a033   ; lee la fila de la sala en la zona (uno mas al salir por arriba) y el byte siguiente (16 bits)
	ld a,d			;a037
	add a,b			;a038
	ld d,a			;a039
	ld a,e			;a03a
	add a,c			;a03b
	ld e,a			;a03c
	ld a,(0d80ah)		;a03d
	cp e			;a040
	ret nz			;a041
	ld a,(0d80bh)		;a042
	cp d			;a045
	ret nz			;a046
	ld a,(0d803h)		;a047
	sub l			;a04a
	cp 040h		;a04b
	ret nc			;a04d
	ld a,(0d805h)		;a04e
	sub h			;a051
	cp 040h		;a052
	ret nc			;a054
	xor a			;a055
	ld (0cb80h),a		;a056   ; guarda las 6 fichas de 16 bytes de lo que lanza Snake ([tipo][..][Y 8.8][X 8.8][velocidades]...)
	ld (0cb52h),a		;a059
	inc a			;a05c
	ld (0caeah),a		;a05d
	ld hl,0dc18h		;a060
	ld (hl),0e0h		;a063
	ld hl,0d810h		;a065
	ld a,(hl)			;a068
	sub 008h		;a069
	ld (hl),a			;a06b
	jr z,L_A070		;a06c
	jr nc,L_A076		;a06e
L_A070:
	ld a,020h		;a070
	ld (0d801h),a		;a072
	ret			;a075
L_A076:
	ld a,008h		;a076
	ld (0d8b7h),a		;a078
	jp 06c17h		;a07b   ; sonido_48: pide el sonido 0x48
L_A07E:
	ld b,0ffh		;a07e
	cp 005h		;a080
	jr c,L_A090		;a082
	sub 005h		;a084
	inc b			;a086
	cp 006h		;a087
	jr c,L_A0A3		;a089
	sub 006h		;a08b
	inc b			;a08d
	jr L_A0A3		;a08e
L_A090:
	inc a			;a090
	jr L_A0A3		;a091
L_A093:
	ld b,001h		;a093
	cp 005h		;a095
	jr c,L_A0A3		;a097
	sub 005h		;a099
	dec b			;a09b
	cp 006h		;a09c
	jr c,L_A0A3		;a09e
	sub 006h		;a0a0
	dec b			;a0a2
L_A0A3:
	add a,a			;a0a3
	add a,a			;a0a4
	add a,a			;a0a5
	add a,a			;a0a6
	add a,a			;a0a7
	sub 010h		;a0a8
	ret			;a0aa
L_A0AB:
	ld hl,0cb00h		;a0ab   ; apunta a el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	ld bc,0003fh		;a0ae
	call 04236h		;a0b1   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	ld hl,0cb40h		;a0b4
	ld bc,0000fh		;a0b7
	call 04236h		;a0ba   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	xor a			;a0bd
	ld (0ca58h),a		;a0be
	inc a			;a0c1
	ld hl,0d638h		;a0c2   ; apunta a la segunda tabla de lo que lleva (fichas de 4 bytes, como 0xD600)
	ld (hl),a			;a0c5
	inc hl			;a0c6
	ld (hl),a			;a0c7
	ld hl,0cb00h		;a0c8   ; apunta a el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	ld (hl),019h		;a0cb
	inc l			;a0cd
	ld (hl),00dh		;a0ce
	ld hl,00303h		;a0d0
	ld (0cb0dh),hl		;a0d3   ; guarda la direccion pedida con el mando (1 arriba, 2 abajo, 3 izquierda, 4 derecha) y el byte siguiente (16 bits)
	ld a,010h		;a0d6
	ld (0cb49h),a		;a0d8
	ld a,020h		;a0db
	ld (0cb29h),a		;a0dd
	ld a,080h		;a0e0
	ld (0cb26h),a		;a0e2
	ld hl,0cb03h		;a0e5   ; apunta a la Y de Snake
	ld a,050h		;a0e8
	ld (hl),06eh		;a0ea
	inc l			;a0ec
	inc l			;a0ed
	ld (hl),0a5h		;a0ee
	ld a,001h		;a0f0
	ld (0ca97h),a		;a0f2   ; guarda 1 si los mensajes salen de los bancos 50-51 y no de 48-49
	ld (0cadfh),a		;a0f5
	ret			;a0f8
L_A0F9:
	ld hl,0e2c0h		;a0f9
	ld de,0dd4dh		;a0fc
	ld bc,0140eh		;a0ff
L_A102:
	push bc			;a102
	ld b,c			;a103
L_A104:
	ld a,(hl)			;a104
	ld (de),a			;a105
	inc hl			;a106
	inc de			;a107
	djnz L_A104		;a108
	ld a,018h		;a10a
	sub c			;a10c
	call 04243h		;a10d   ; suma_a_de: DE = DE + A
	pop bc			;a110
	djnz L_A102		;a111
	ld hl,0def8h		;a113
	ld bc,00047h		;a116
	ld a,045h		;a119
	call 04237h		;a11b   ; llena_bloque: pone A en BC + 1 bytes desde HL
	ld hl,0deabh		;a11e
	call L_A133		;a121
	ld hl,0dec3h		;a124
	call L_A133		;a127
	ld hl,0dedbh		;a12a
	call L_A133		;a12d
	ld hl,0def3h		;a130
L_A133:
	ld a,045h		;a133
	ld (hl),a			;a135
	inc hl			;a136
	ld (hl),a			;a137
	ret			;a138
L_A139:
	ld b,006h		;a139
	ld a,(0ca9bh)		;a13b
	or a			;a13e
	jr nz,L_A147		;a13f
	dec b			;a141
	ld a,(0cb37h)		;a142
	or a			;a145
	ret z			;a146
L_A147:
	ld a,b			;a147
	ld (0cb33h),a		;a148
	jr L_A16B		;a14b
L_A14D:
	ld hl,0d7e1h		;a14d
	res 2,(hl)		;a150
	ld a,(0d8c0h)		;a152
	or a			;a155
	ret nz			;a156
	ld a,(0ca65h)		;a157   ; lee el sitio de 0xCBE0 en el que esta Snake (0 = ninguno)
	or a			;a15a
	ret nz			;a15b
	call L_A1AC		;a15c
	ret nc			;a15f
	push hl			;a160
	ld hl,0d7e1h		;a161
	set 2,(hl)		;a164
	pop hl			;a166
	ld a,c			;a167
	ld (0cb33h),a		;a168
L_A16B:
	ld a,(0cb0fh)		;a16b   ; lee 1 si Snake ha chocado en este cuadro
	or a			;a16e
	ret nz			;a16f
	ld a,(0cb31h)		;a170   ; lee 1 en el estado 2 de Snake
	or a			;a173
	ret nz			;a174
	ld hl,0cb34h		;a175
	ld a,(0cb14h)		;a178   ; lee el dibujo del paso de andar (0, 1, 2, 1: p02:9888)
	or a			;a17b
	jr z,L_A185		;a17c
	cp 002h		;a17e
	jr z,L_A185		;a180
	ld (hl),000h		;a182
	ret			;a184
L_A185:
	ld a,(hl)			;a185
	or a			;a186
	ret nz			;a187
	ld (hl),001h		;a188
	call L_A196		;a18a
	ld a,(0cb33h)		;a18d
	cp 006h		;a190
	ret z			;a192
	jp 08eeah		;a193   ; a_p03_af05: p03:AF05 con el banco 3 en 0xA000
L_A196:
	ld a,(0cb33h)		;a196
	call 0424dh		;a199   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_A19C: 8 destinos del despachador p00:424D (call en p06:A199, el
;   indice en A): 6A21, 6B06, 6B0A, 6B0E, 6A7B, 6A77, 6A73, 6C93; lo leen
;   p06:A199 (16 bytes)
;   0xa19c..0xa1ac  (16 bytes)
DATA_tabla_A19C:
	defw 06a21h,06b06h,06b0ah,06b0eh,06a7bh,06a77h,06a73h,06c93h	; a19c

; ======================================================================
; CODIGO 0xa1ac..0xa4ba  (782 bytes)
; ======================================================================


L_A1AC:
	ld a,(0cb03h)		;a1ac   ; lee la Y de Snake
	ld l,a			;a1af
	ld a,(0cb05h)		;a1b0   ; lee la X de Snake
	ld h,a			;a1b3
	call 07f69h		;a1b4   ; caracter_en: A = el caracter del mapa en (H = X, L = Y)
	ld b,a			;a1b7
	ld a,(0ca76h)		;a1b8   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	or a			;a1bb
	jr nz,L_A1F8		;a1bc
	ld a,(0ca4ah)		;a1be   ; lee la zona
	dec a			;a1c1
	jr z,L_A1FA		;a1c2
	dec a			;a1c4
	jp z,L_A261		;a1c5
	cp 002h		;a1c8
	jr z,L_A20B		;a1ca
	cp 005h		;a1cc
	jr z,L_A223		;a1ce
	cp 008h		;a1d0
	jr z,L_A243		;a1d2
	cp 009h		;a1d4
	jr z,L_A22F		;a1d6
	cp 00ah		;a1d8
	jr z,L_A23A		;a1da
	cp 00bh		;a1dc
	jp z,L_A288		;a1de
	cp 00ch		;a1e1
	jp z,L_A296		;a1e3
	cp 00dh		;a1e6
	jp z,L_A29F		;a1e8
	cp 00eh		;a1eb
	jp z,L_A292		;a1ed
	cp 010h		;a1f0
	jr z,L_A268		;a1f2
	cp 011h		;a1f4
	jr z,L_A26F		;a1f6
L_A1F8:
	and a			;a1f8
	ret			;a1f9
L_A1FA:
	ld c,000h		;a1fa
	ld de,08189h		;a1fc
	ld a,(0ca4bh)		;a1ff   ; lee la sala de la zona
	cp 00bh		;a202
	jr nz,L_A22F		;a204
	ld de,0010dh		;a206
	jr L_A234		;a209
L_A20B:
	ld c,001h		;a20b
	ld de,00810h		;a20d
	ld a,(0ca4bh)		;a210   ; lee la sala de la zona
	cp 017h		;a213
	jr z,L_A234		;a215
	cp 00dh		;a217
	jp z,L_A2A8		;a219
	cp 012h		;a21c
	jp z,L_A2A8		;a21e
	and a			;a221
	ret			;a222
L_A223:
	ld c,004h		;a223
	ld a,(0ca4bh)		;a225   ; lee la sala de la zona
	cp 00eh		;a228
	ccf			;a22a
	ret nc			;a22b
	cp 010h		;a22c
	ret			;a22e
L_A22F:
	ld c,000h		;a22f
	ld de,08189h		;a231
L_A234:
	ld a,b			;a234
	cp d			;a235
	jr c,L_A1F8		;a236
	cp e			;a238
	ret			;a239
L_A23A:
	ld a,(0ca4bh)		;a23a   ; lee la sala de la zona
	cp 004h		;a23d
	ret nc			;a23f
	ld c,000h		;a240
	ret			;a242
L_A243:
	ld a,(0ca50h)		;a243   ; lee la fila de la sala en la zona (uno mas al salir por arriba)
	cp 004h		;a246
	ccf			;a248
	ret nc			;a249
	ld a,(0ca51h)		;a24a   ; lee la columna de la sala en la zona (uno mas al salir por la derecha)
	cp 008h		;a24d
	ccf			;a24f
	ret nc			;a250
	ld c,004h		;a251
	ld de,01119h		;a253
	call L_A234		;a256
	ret c			;a259
	ld c,004h		;a25a
	ld de,00103h		;a25c
	jr L_A234		;a25f
L_A261:
	ld c,000h		;a261
	ld de,00150h		;a263
	jr L_A234		;a266
L_A268:
	ld c,000h		;a268
	ld de,0818dh		;a26a
	jr L_A234		;a26d
L_A26F:
	ld a,(0ca4bh)		;a26f   ; lee la sala de la zona
	cp 004h		;a272
	ret nc			;a274
	ld c,001h		;a275
	or a			;a277
	jr z,L_A286		;a278
	ld c,003h		;a27a
	dec a			;a27c
	jr z,L_A286		;a27d
	ld c,007h		;a27f
	dec a			;a281
	jr z,L_A286		;a282
	ld c,002h		;a284
L_A286:
	scf			;a286
	ret			;a287
L_A288:
	ld a,(0ca4bh)		;a288   ; lee la sala de la zona
	or a			;a28b
	jr z,L_A292		;a28c
	cp 005h		;a28e
	ccf			;a290
	ret nc			;a291
L_A292:
	ld c,000h		;a292
	scf			;a294
	ret			;a295
L_A296:
	ld a,(0ca4bh)		;a296   ; lee la sala de la zona
	cp 004h		;a299
	ret nc			;a29b
	ld c,000h		;a29c
	ret			;a29e
L_A29F:
	ld a,(0ca4bh)		;a29f   ; lee la sala de la zona
	or a			;a2a2
	ret nz			;a2a3
	scf			;a2a4
	ld c,000h		;a2a5
	ret			;a2a7
L_A2A8:
	scf			;a2a8
	ret			;a2a9
L_A2AA:
	ld a,(0cb00h)		;a2aa   ; lee el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	cp 010h		;a2ad
	ret z			;a2af
	ld a,(0dfe8h)		;a2b0
	or a			;a2b3
	ret z			;a2b4
	call L_A2CC		;a2b5
	ld a,(0cb05h)		;a2b8   ; lee la X de Snake
	cp 040h		;a2bb
	ret nc			;a2bd
	cp 020h		;a2be
	ret c			;a2c0
	cp 040h		;a2c1
	ld (0cb05h),a		;a2c3   ; guarda la X de Snake
	ld a,010h		;a2c6
	ld (0cb00h),a		;a2c8   ; guarda el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	ret			;a2cb
L_A2CC:
	ld a,(0dfeah)		;a2cc
	add a,008h		;a2cf
	ld hl,0cb05h		;a2d1   ; apunta a la X de Snake
	cp (hl)			;a2d4
	jr nc,L_A304		;a2d5
	ld a,(0dfe9h)		;a2d7
	dec a			;a2da
	ret z			;a2db
	ld b,018h		;a2dc
	ld a,(0cb01h)		;a2de   ; lee el dibujo de Snake (al darse la vuelta se le suma 1, 3 o 5 segun 0xCB00)
	cp 002h		;a2e1
	jr nz,L_A2F4		;a2e3
	ld a,(0cb16h)		;a2e5   ; lee 1 mientras Snake se da la vuelta
	or a			;a2e8
	jr nz,L_A2F4		;a2e9
	ld a,(0cb0eh)		;a2eb   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	cp 003h		;a2ee
	jr c,L_A2F4		;a2f0
	ld b,020h		;a2f2
L_A2F4:
	ld a,(0dfeah)		;a2f4
	sub (hl)			;a2f7
	neg		;a2f8
	cp b			;a2fa
	ret nc			;a2fb
	ld a,(0dfeah)		;a2fc
	add a,b			;a2ff
	ld (0cb05h),a		;a300   ; guarda la X de Snake
	ret			;a303
L_A304:
	ld a,(0dfe9h)		;a304
	cp 002h		;a307
	ret z			;a309
	ld b,006h		;a30a
	ld a,(0cb01h)		;a30c   ; lee el dibujo de Snake (al darse la vuelta se le suma 1, 3 o 5 segun 0xCB00)
	cp 002h		;a30f
	jr nz,L_A322		;a311
	ld a,(0cb16h)		;a313   ; lee 1 mientras Snake se da la vuelta
	or a			;a316
	jr nz,L_A322		;a317
	ld a,(0cb0eh)		;a319   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	cp 003h		;a31c
	jr c,L_A322		;a31e
	ld b,00eh		;a320
L_A322:
	ld a,(0dfeah)		;a322
	sub (hl)			;a325
	cp b			;a326
	ret nc			;a327
	ld a,(0dfeah)		;a328
	sub b			;a32b
	ld (0cb05h),a		;a32c   ; guarda la X de Snake
	ret			;a32f
L_A330:
	ld hl,0bda4h		;a330
L_A333:
	ld a,(hl)			;a333
	cp 0ffh		;a334
	jr z,L_A385		;a336
	push hl			;a338
	cp 032h		;a339
	jr nz,L_A347		;a33b
	ld a,(0ca76h)		;a33d   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 032h		;a340
	jr nz,L_A37E		;a342
	inc hl			;a344
	jr L_A354		;a345
L_A347:
	ld a,(0ca4ah)		;a347   ; lee la zona
	cp (hl)			;a34a
	jr nz,L_A37E		;a34b
	inc hl			;a34d
	ld a,(0ca4bh)		;a34e   ; lee la sala de la zona
	cp (hl)			;a351
	jr nz,L_A37E		;a352
L_A354:
	inc hl			;a354
	ld a,(0cb03h)		;a355   ; lee la Y de Snake
	cp (hl)			;a358
	jr c,L_A37E		;a359
	inc hl			;a35b
	cp (hl)			;a35c
	jr nc,L_A37E		;a35d
	inc hl			;a35f
	ld a,(0cb05h)		;a360   ; lee la X de Snake
	cp (hl)			;a363
	jr c,L_A37E		;a364
	inc hl			;a366
	cp (hl)			;a367
	jr nc,L_A37E		;a368
	ld a,(hl)			;a36a
	sub 010h		;a36b
	and 0f8h		;a36d
	push af			;a36f
	inc hl			;a370
	ld de,0caa5h		;a371
	ldi		;a374
	ldi		;a376
	ldi		;a378
	pop af			;a37a
	pop hl			;a37b
	scf			;a37c
	ret			;a37d
L_A37E:
	pop hl			;a37e
	ld de,00009h		;a37f
	add hl,de			;a382
	jr L_A333		;a383
L_A385:
	and a			;a385
	ret			;a386
L_A387:
	ld a,(0cb03h)		;a387   ; lee la Y de Snake
	cp 0c0h		;a38a
	ret nc			;a38c
	ld a,(0cb05h)		;a38d   ; lee la X de Snake
	cp 0c0h		;a390
	ret nc			;a392
	xor a			;a393
	ld de,0ca8fh		;a394   ; apunta a hacia donde empuja la zona (1 arriba, 2 abajo, 3 izquierda, 4 derecha; 0 nada)
	ld (de),a			;a397
	ld hl,0bb76h		;a398
L_A39B:
	ld a,(hl)			;a39b
	cp 0ffh		;a39c
	ret z			;a39e
	ld a,(0ca4bh)		;a39f   ; lee la sala de la zona
	cp (hl)			;a3a2
	ret c			;a3a3
	push hl			;a3a4
	call z,L_A3B2		;a3a5
	pop hl			;a3a8
	ld a,(de)			;a3a9
	or a			;a3aa
	ret nz			;a3ab
	ld bc,00006h		;a3ac
	add hl,bc			;a3af
	jr L_A39B		;a3b0
L_A3B2:
	inc hl			;a3b2
	ld a,(0cb03h)		;a3b3   ; lee la Y de Snake
	cp (hl)			;a3b6
	ret c			;a3b7
	inc hl			;a3b8
	cp (hl)			;a3b9
	ret nc			;a3ba
	inc hl			;a3bb
	ld a,(0cb05h)		;a3bc   ; lee la X de Snake
	cp (hl)			;a3bf
	ret c			;a3c0
	inc hl			;a3c1
	cp (hl)			;a3c2
	ret nc			;a3c3
	inc hl			;a3c4
	ld a,(hl)			;a3c5
	ld (de),a			;a3c6
	ret			;a3c7
L_A3C8:
	xor a			;a3c8
	ld hl,0cb4bh		;a3c9   ; apunta a con el puesto, la vida baja un punto cada 16 cuadros
	ld (hl),001h		;a3cc
	inc l			;a3ce
	ld (hl),004h		;a3cf
	inc l			;a3d1
	ld (hl),a			;a3d2
	inc l			;a3d3
	ld (hl),010h		;a3d4
	ld (0cab6h),a		;a3d6
	inc a			;a3d9
	ld (0cb3ch),a		;a3da
	ld hl,0d8d9h		;a3dd
	set 7,(hl)		;a3e0
	ld hl,0d8d8h		;a3e2   ; apunta a las banderas de la sala (se borran al cambiar de sala, p00:59DD)
	ld a,(hl)			;a3e5
	or 0fch		;a3e6
	ld (hl),a			;a3e8
	ld hl,0d600h		;a3e9   ; apunta a lo que lleva Snake: fichas de 4 bytes [la tiene][cuenta en BCD, 2 bytes][...]; las de 0xCB20 desde la 1
	ld bc,0001fh		;a3ec
	call 04236h		;a3ef   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	ld hl,0d624h		;a3f2
	ld bc,00003h		;a3f5
	call 04236h		;a3f8   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	ld hl,0d62ch		;a3fb
	ld bc,0000bh		;a3fe
	call 04236h		;a401   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	ld hl,0d650h		;a404
	ld bc,00003h		;a407
	call 04236h		;a40a   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	ld hl,0d66ch		;a40d
	ld bc,00007h		;a410
	call 04236h		;a413   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	ld hl,0d6a8h		;a416
	ld bc,00007h		;a419
	call 04236h		;a41c   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	ld hl,0d6c0h		;a41f
	ld bc,00003h		;a422
	jp 04236h		;a425   ; borra_bloque: pone a cero BC + 1 bytes desde HL
L_A428:
	ld a,(0ca65h)		;a428   ; lee el sitio de 0xCBE0 en el que esta Snake (0 = ninguno)
	or a			;a42b
	ret nz			;a42c
	ld a,(0ca5fh)		;a42d   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	or a			;a430
	ret nz			;a431
	ld a,(0ca4ah)		;a432   ; lee la zona
	cp 009h		;a435
	jr z,L_A445		;a437
	cp 00bh		;a439
	jr nz,L_A44B		;a43b
	ld a,(0d7d6h)		;a43d
	bit 2,a		;a440
	ret z			;a442
	jr L_A44B		;a443
L_A445:
	ld a,(0d7dch)		;a445
	bit 1,a		;a448
	ret nz			;a44a
L_A44B:
	ld hl,0a4bah		;a44b
L_A44E:
	ld a,(hl)			;a44e
	cp 0ffh		;a44f
	ret z			;a451
	push hl			;a452
	cp 032h		;a453
	jr nz,L_A461		;a455
	ld a,(0ca76h)		;a457   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 032h		;a45a
	jr nz,L_A497		;a45c
	inc hl			;a45e
	jr L_A46E		;a45f
L_A461:
	ld a,(0ca4ah)		;a461   ; lee la zona
	cp (hl)			;a464
	jr nz,L_A497		;a465
	inc hl			;a467
	ld a,(0ca4bh)		;a468   ; lee la sala de la zona
	cp (hl)			;a46b
	jr nz,L_A497		;a46c
L_A46E:
	push hl			;a46e
	call 06a97h		;a46f   ; sonido_27: pide el sonido 0x27
	pop hl			;a472
	inc hl			;a473
	ld e,(hl)			;a474
	inc hl			;a475
	ld d,(hl)			;a476
	inc hl			;a477
	ld a,(hl)			;a478
	and 00fh		;a479
	ld b,a			;a47b
	ld a,(hl)			;a47c
	rra			;a47d
	rra			;a47e
	rra			;a47f
	rra			;a480
	and 00fh		;a481
	ld c,a			;a483
	inc hl			;a484
	ld a,(0ca03h)		;a485   ; lee el contador de cuadros (uno mas en cada interrupcion)
	and 007h		;a488
	jr nz,L_A4AB		;a48a
	ld a,(0ca03h)		;a48c   ; lee el contador de cuadros (uno mas en cada interrupcion)
	bit 3,a		;a48f
	jr z,L_A49E		;a491
	inc hl			;a493
	inc hl			;a494
	jr L_A49E		;a495
L_A497:
	pop hl			;a497
	ld de,00009h		;a498
	add hl,de			;a49b
	jr L_A44E		;a49c
L_A49E:
	push bc			;a49e
	push hl			;a49f
	ld a,c			;a4a0
	ld bc,00102h		;a4a1
	call L_A4AD		;a4a4
	pop hl			;a4a7
	pop bc			;a4a8
	djnz L_A49E		;a4a9
L_A4AB:
	pop hl			;a4ab
	ret			;a4ac
L_A4AD:
	or a			;a4ad
	jp z,05088h		;a4ae   ; mosaico_f2_b0: el mosaico de HL en (D, E), B filas de C caracteres, con la forma 2 de la franja 0 (p00:512C)
	dec a			;a4b1
	jp z,050a0h		;a4b2   ; mosaico_f2_b1: el mosaico de HL en (D, E), B filas de C caracteres, con la forma 2 de la franja 1 (p00:512C)
	dec a			;a4b5
	jp z,050d6h		;a4b6   ; mosaico_f2_b2: el mosaico de HL en (D, E), B filas de C caracteres, con la forma 2 de la franja 2 (p00:512C)
	ret			;a4b9

; ----------------------------------------------------------------------
; DATOS resto_A4BA: lo apuntan con el banco puesto p06:A44B (0xA4BA); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p06:A44B (46 bytes)
;   0xa4ba..0xa4e8  (46 bytes)
DATA_resto_A4BA:
	defb 009h,002h,030h,078h,006h,0fch,0fdh,0feh,0ffh,001h,016h,078h,068h,015h,0c0h,0c1h	; a4ba  ..0x.......xh...
	defb 0c2h,0c3h,00ah,005h,060h,028h,014h,07ah,07bh,07ch,07dh,00ah,009h,030h,088h,014h	; a4ca  ....`(.z{|}..0..
	defb 07ah,07bh,07ch,07dh,032h,0ffh,058h,068h,027h,070h,071h,072h,073h,0ffh	; a4da  z{|}2.Xh'pqrs.

; ======================================================================
; CODIGO 0xa4e8..0xa5a1  (185 bytes)
; ======================================================================


L_A4E8:
	ld a,(0d8c0h)		;a4e8
	or a			;a4eb
	ret nz			;a4ec
	ld a,(0ca76h)		;a4ed   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	or a			;a4f0
	ret nz			;a4f1
	call L_A51F		;a4f2
	ret c			;a4f5
	ld a,(0ca03h)		;a4f6   ; lee el contador de cuadros (uno mas en cada interrupcion)
	and 00fh		;a4f9
	or a			;a4fb
	ret nz			;a4fc
	ld a,(0ca03h)		;a4fd   ; lee el contador de cuadros (uno mas en cada interrupcion)
	rra			;a500
	rra			;a501
	rra			;a502
	rra			;a503
	and 00fh		;a504
	or a			;a506
	jr z,L_A51C		;a507
	cp 001h		;a509
	jr z,L_A51C		;a50b
	cp 004h		;a50d
	jr z,L_A51C		;a50f
	cp 009h		;a511
	jr z,L_A51C		;a513
	cp 00ah		;a515
	jr z,L_A51C		;a517
	cp 00bh		;a519
	ret nz			;a51b
L_A51C:
	jp 06c7fh		;a51c   ; sonido_5e: pide el sonido 0x5E
L_A51F:
	ld a,(0ca4ah)		;a51f   ; lee la zona
	cp 006h		;a522
	jr z,L_A536		;a524
	cp 008h		;a526
	jr z,L_A52C		;a528
L_A52A:
	scf			;a52a
	ret			;a52b
L_A52C:
	ld a,(0ca4bh)		;a52c   ; lee la sala de la zona
	cp 00ah		;a52f
	ret c			;a531
	cp 010h		;a532
	ccf			;a534
	ret			;a535
L_A536:
	ld a,(0ca4bh)		;a536   ; lee la sala de la zona
	cp 007h		;a539
	jr z,L_A52A		;a53b
	cp 010h		;a53d
	jr z,L_A52A		;a53f
	and a			;a541
	ret			;a542
L_A543:
	ld c,a			;a543
	ld b,000h		;a544
	or a			;a546
	jr z,L_A565		;a547
	ld b,020h		;a549
	rlca			;a54b
	rlca			;a54c
	rlca			;a54d
	rlca			;a54e
	add a,b			;a54f
	ld b,a			;a550
	ld a,c			;a551
	cp 009h		;a552
	jr nz,L_A565		;a554
	ld a,(0e040h)		;a556
	cp 005h		;a559
	jr nz,L_A565		;a55b
	ld a,(0cb5bh)		;a55d
	ld hl,0bf30h		;a560
	jr L_A56B		;a563
L_A565:
	ld a,(0cab9h)		;a565
	ld hl,0beech		;a568
L_A56B:
	add a,b			;a56b
	ld b,a			;a56c
	rra			;a56d
	rra			;a56e
	and 03fh		;a56f
	call 0423eh		;a571   ; suma_a_hl: HL = HL + A
	ld a,b			;a574
	and 003h		;a575
	inc a			;a577
	ld b,a			;a578
	ld a,(hl)			;a579
L_A57A:
	rlca			;a57a
	rlca			;a57b
	djnz L_A57A		;a57c
	and 003h		;a57e
	ld b,a			;a580
	ld a,c			;a581
	cp 009h		;a582
	ld a,b			;a584
	ret nz			;a585
	ld a,(0e040h)		;a586
	cp 005h		;a589
	ld a,b			;a58b
	ret nz			;a58c
	ld a,(0d4ech)		;a58d
	or a			;a590
	ld a,b			;a591
	ret z			;a592
	ld a,(0d4ech)		;a593
	dec a			;a596
	ret			;a597
L_A598:
	ld a,(0caa0h)		;a598   ; lee cuantos siguen a Snake por su rastro (1-4)
	or a			;a59b
	ret z			;a59c
	dec a			;a59d
	call 0424dh		;a59e   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_A5A1: 4 destinos del despachador p00:424D (call en p06:A59E, el
;   indice en A): A5A9, A5AE, A5AE, A5B6; lo leen p06:A59E (8 bytes)
;   0xa5a1..0xa5a9  (8 bytes)
DATA_tabla_A5A1:
	defw 0a5a9h,0a5aeh,0a5aeh,0a5b6h	; a5a1  -> L_A5A9 L_A5AE L_A5AE L_A5B6

; ======================================================================
; CODIGO 0xa5a9..0xa61c  (115 bytes)
; ======================================================================


L_A5A9:
	ld hl,0e240h		;a5a9   ; apunta a la ficha del que sigue a Snake 4 posiciones por detras (del rastro de 0xE08C)
	jr L_A5B9		;a5ac
L_A5AE:
	call L_A5A9		;a5ae
	ld hl,0e248h		;a5b1   ; apunta a la ficha del que sigue a Snake 12 posiciones por detras (0xE0A4)
	jr L_A5B9		;a5b4
L_A5B6:
	ld hl,0dfd8h		;a5b6
L_A5B9:
	ld b,000h		;a5b9
	ld (hl),003h		;a5bb
	inc l			;a5bd
	ld (hl),001h		;a5be
	inc l			;a5c0
	ld (hl),b			;a5c1
	inc l			;a5c2
	ld a,(0cb03h)		;a5c3   ; lee la Y de Snake
	ld (hl),a			;a5c6
	inc l			;a5c7
	ld (hl),b			;a5c8
	inc l			;a5c9
	ld a,(0cb05h)		;a5ca   ; lee la X de Snake
	ld (hl),a			;a5cd
	inc l			;a5ce
	ld a,(0cb0eh)		;a5cf   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ld (hl),a			;a5d2
	inc hl			;a5d3
	ld (hl),b			;a5d4
	ret			;a5d5
L_A5D6:
	ld hl,0a61ch		;a5d6
L_A5D9:
	ld d,(hl)			;a5d9
	inc hl			;a5da
	ld e,(hl)			;a5db
	inc hl			;a5dc
L_A5DD:
	ld a,(hl)			;a5dd
	ld c,a			;a5de
	inc a			;a5df
	ret z			;a5e0
	inc a			;a5e1
	jr z,L_A60C		;a5e2
	push hl			;a5e4
	ld a,c			;a5e5
	and a			;a5e6
	ld hl,00000h		;a5e7
	jr z,L_A5FA		;a5ea
	and 01fh		;a5ec
	add a,a			;a5ee
	add a,a			;a5ef
	add a,a			;a5f0
	ld h,a			;a5f1
	ld a,c			;a5f2
	and 0e0h		;a5f3
	rrca			;a5f5
	rrca			;a5f6
	add a,040h		;a5f7
	ld l,a			;a5f9
L_A5FA:
	ld a,0c0h		;a5fa
	call L_A60F		;a5fc
	ld a,0d0h		;a5ff
	call L_A60F		;a601
	ld a,d			;a604
	add a,009h		;a605
	ld d,a			;a607
	pop hl			;a608
	inc hl			;a609
	jr L_A5DD		;a60a
L_A60C:
	inc hl			;a60c
	jr L_A5D9		;a60d
L_A60F:
	push hl			;a60f
	push de			;a610
	push bc			;a611
	ld bc,00808h		;a612
	call 047edh		;a615   ; copia_rectangulo_logica: orden LMMM del VDP con la operacion logica de A
	pop bc			;a618
	pop de			;a619
	pop hl			;a61a
	ret			;a61b

; ----------------------------------------------------------------------
; DATOS resto_A61C: lo apuntan con el banco puesto p06:A5D6 (0xA61C); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p06:A5D6 (24 bytes)
;   0xa61c..0xa634  (24 bytes)
DATA_resto_A61C:
	defb 03ch,038h,00ch,001h,014h,009h,000h,018h,021h,009h,01ah,0feh,03ch,040h,00dh,002h	; a61c  <8......!...<@..
	defb 015h,00ah,000h,019h,022h,00ah,01ch,0ffh	; a62c  ...."...

; ======================================================================
; CODIGO 0xa634..0xa6a8  (116 bytes)
; ======================================================================


L_A634:
	call L_A639		;a634
	jr $+129		;a637
L_A639:
	ld c,00fh		;a639
	ld a,(0ca9bh)		;a63b
	or a			;a63e
	jr nz,L_A65C		;a63f
	ld a,(0cb37h)		;a641
	or a			;a644
	jr nz,L_A65C		;a645
	ld a,(0cb3fh)		;a647   ; lee en la zona 6, lo que hay bajo Snake: 1 con los caracteres 0x90-0xB3, 2 con 0xB8-0xDB (3 con 0xCAAA)
	or a			;a64a
	jr nz,L_A65C		;a64b
	ld a,(0cb28h)		;a64d
	or a			;a650
	jr nz,L_A65A		;a651
	ld a,(0cb00h)		;a653   ; lee el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	cp 00bh		;a656
	jr nz,L_A65C		;a658
L_A65A:
	ld c,003h		;a65a
L_A65C:
	ld a,(0ca07h)		;a65c   ; lee lo recien pulsado del mando (los bits de 0xCA08 que no estaban)
	and c			;a65f
	jr nz,L_A67E		;a660
	ld hl,0cb10h		;a662   ; apunta a la direccion que manda en el mando (un bit de 0xCA08)
	ld a,(0ca08h)		;a665   ; lee el mando: joystick y teclado juntos (bits 0-3 las direcciones, 4-5 los disparos)
	and c			;a668
	ld b,a			;a669
	and (hl)			;a66a
	ld a,b			;a66b
	jr nz,L_A69D		;a66c
	ld hl,0cb11h		;a66e   ; apunta a la direccion que se pulso antes que la de 0xCB10
	ld a,(0ca08h)		;a671   ; lee el mando: joystick y teclado juntos (bits 0-3 las direcciones, 4-5 los disparos)
	and c			;a674
	and (hl)			;a675
	ld a,b			;a676
	jr z,L_A69D		;a677
	ld a,(hl)			;a679
	ld (hl),000h		;a67a
	jr L_A69A		;a67c
L_A67E:
	ld a,(0cb10h)		;a67e   ; lee la direccion que manda en el mando (un bit de 0xCA08)
	ld (0cb11h),a		;a681   ; guarda la direccion que se pulso antes que la de 0xCB10
	ld a,(0ca07h)		;a684   ; lee lo recien pulsado del mando (los bits de 0xCA08 que no estaban)
	and c			;a687
	ld c,a			;a688
	and 001h		;a689
	jr nz,L_A69A		;a68b
	ld a,c			;a68d
	and 002h		;a68e
	jr nz,L_A69A		;a690
	ld a,c			;a692
	and 004h		;a693
	jr nz,L_A69A		;a695
	ld a,c			;a697
	and 008h		;a698
L_A69A:
	ld (0cb10h),a		;a69a   ; guarda la direccion que manda en el mando (un bit de 0xCA08)
L_A69D:
	ld hl,0a6a8h		;a69d
	call 0423eh		;a6a0   ; suma_a_hl: HL = HL + A
	ld a,(hl)			;a6a3
	ld (0cb0ch),a		;a6a4
	ret			;a6a7

; ----------------------------------------------------------------------
; DATOS resto_A6A8: lo apuntan con el banco puesto p06:A69D (0xA6A8); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p06:A69D (16 bytes)
;   0xa6a8..0xa6b8  (16 bytes)
DATA_resto_A6A8:
	defb 000h,001h,002h,000h,003h,000h,000h,000h,004h,000h,000h,000h,000h,000h,000h,000h	; a6a8  ................

; ======================================================================
; CODIGO 0xa6b8..0xa7f0  (312 bytes)
; ======================================================================


L_A6B8:
	ld a,(0cb0eh)		;a6b8   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ld (0cb0dh),a		;a6bb   ; guarda la direccion pedida con el mando (1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ld b,00fh		;a6be
	ld a,(0ca9bh)		;a6c0
	or a			;a6c3
	jr nz,L_A6E1		;a6c4
	ld a,(0cb37h)		;a6c6
	or a			;a6c9
	jr nz,L_A6E1		;a6ca
	ld a,(0cb3fh)		;a6cc   ; lee en la zona 6, lo que hay bajo Snake: 1 con los caracteres 0x90-0xB3, 2 con 0xB8-0xDB (3 con 0xCAAA)
	or a			;a6cf
	jr nz,L_A6E1		;a6d0
	ld a,(0cb28h)		;a6d2
	or a			;a6d5
	jr nz,L_A6DF		;a6d6
	ld a,(0cb00h)		;a6d8   ; lee el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	cp 00bh		;a6db
	jr nz,L_A6E1		;a6dd
L_A6DF:
	ld b,003h		;a6df
L_A6E1:
	ld a,(0ca08h)		;a6e1   ; lee el mando: joystick y teclado juntos (bits 0-3 las direcciones, 4-5 los disparos)
	and b			;a6e4
	jr nz,L_A6EC		;a6e5
	inc a			;a6e7
	ld (0cb0fh),a		;a6e8   ; guarda 1 si Snake ha chocado en este cuadro
	ret			;a6eb
L_A6EC:
	xor a			;a6ec
	ld (0cb0fh),a		;a6ed   ; guarda 1 si Snake ha chocado en este cuadro
	ld a,(0cb0ch)		;a6f0
	and a			;a6f3
	ret z			;a6f4
	ld (0cb0eh),a		;a6f5   ; guarda la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ret			;a6f8
L_A6F9:
	call L_A710		;a6f9
	call L_A7D9		;a6fc
	ld hl,0cb4bh		;a6ff   ; apunta a con el puesto, la vida baja un punto cada 16 cuadros
	ld a,(hl)			;a702
	or a			;a703
	ret z			;a704
	inc l			;a705
	dec (hl)			;a706
	ret nz			;a707
	ld (hl),004h		;a708
	inc l			;a70a
	ld a,(hl)			;a70b
	xor 001h		;a70c
	ld (hl),a			;a70e
	ret			;a70f
L_A710:
	ld hl,0d8e2h		;a710   ; apunta a de paso (en p01:62B5: 0 copia con ldir, 1 caracter a caracter)
	call L_A798		;a713
	ld a,(hl)			;a716
	or a			;a717
	ret nz			;a718
	xor a			;a719
	ld (0cb37h),a		;a71a
	ld a,(0ca41h)		;a71d   ; lee la salida de la sala (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	or a			;a720
	ret nz			;a721
	ld a,(0cb03h)		;a722   ; lee la Y de Snake
	ld l,a			;a725
	ld a,(0cb05h)		;a726   ; lee la X de Snake
	ld h,a			;a729
	call 07f69h		;a72a   ; caracter_en: A = el caracter del mapa en (H = X, L = Y)
	or a			;a72d
	jr z,L_A780		;a72e
	cp 001h		;a730
	jr z,L_A748		;a732
	cp 004h		;a734
	jr c,L_A748		;a736
	cp 006h		;a738
	jr c,L_A792		;a73a
	cp 010h		;a73c
	jr c,L_A748		;a73e
	cp 017h		;a740
	jr c,L_A792		;a742
	cp 02bh		;a744
	jr nc,L_A792		;a746
L_A748:
	ld a,001h		;a748
	ld (0cb37h),a		;a74a
	ld a,002h		;a74d
	ld (0cb28h),a		;a74f
	ld a,(0cb29h)		;a752
	or a			;a755
	ret z			;a756
	cp 011h		;a757
	jr nc,L_A773		;a759
	ld hl,0cb38h		;a75b
	dec (hl)			;a75e
	ret nz			;a75f
	ld (hl),008h		;a760
	ld hl,0cb29h		;a762
	dec (hl)			;a765
	ld a,(hl)			;a766
	or a			;a767
	jp nz,06c6bh		;a768   ; sonido_53: pide el sonido 0x53
	ld hl,0cb00h		;a76b   ; apunta a el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	ld (hl),01bh		;a76e
	jp 06ba0h		;a770   ; sonido_8d: pide el sonido 0x8D (de los que tienen la partitura en un banco de musica, p16:4CE3)
L_A773:
	ld hl,0cb38h		;a773
	ld (hl),001h		;a776
	ld a,010h		;a778
	ld (0cb29h),a		;a77a
	jp 06c6bh		;a77d   ; sonido_53: pide el sonido 0x53
L_A780:
	ld a,001h		;a780
	ld (0cb37h),a		;a782
	ld c,01ah		;a785
	ld b,002h		;a787
	call 09367h		;a789   ; pon_cb28: 0xCB28 = B, 0xCB29 = C
	ld hl,0cb38h		;a78c
	ld (hl),001h		;a78f
	ret			;a791
L_A792:
	ld bc,00020h		;a792
	jp 09367h		;a795   ; pon_cb28: 0xCB28 = B, 0xCB29 = C
L_A798:
	ld (hl),000h		;a798
	ld a,(0ca76h)		;a79a   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	or a			;a79d
	jr nz,L_A7C7		;a79e
	ld a,(0ca4ah)		;a7a0   ; lee la zona
	cp 007h		;a7a3
	jr nz,L_A7C7		;a7a5
	ld a,(0ca4bh)		;a7a7   ; lee la sala de la zona
	cp 002h		;a7aa
	ret z			;a7ac
	cp 003h		;a7ad
	ret z			;a7af
	cp 004h		;a7b0
	jr z,L_A7CA		;a7b2
	cp 008h		;a7b4
	ret z			;a7b6
	cp 009h		;a7b7
	jr nz,L_A7C7		;a7b9
	ld a,(0cb03h)		;a7bb   ; lee la Y de Snake
	cp 0a0h		;a7be
	ret nc			;a7c0
	ld a,(0cb05h)		;a7c1   ; lee la X de Snake
	cp 020h		;a7c4
	ret c			;a7c6
L_A7C7:
	ld (hl),001h		;a7c7
	ret			;a7c9
L_A7CA:
	ld a,(0cb03h)		;a7ca   ; lee la Y de Snake
	cp 08fh		;a7cd
	ret c			;a7cf
	ld a,(0cb05h)		;a7d0   ; lee la X de Snake
	cp 04eh		;a7d3
	ret c			;a7d5
	ld (hl),001h		;a7d6
	ret			;a7d8
L_A7D9:
	ld a,(0cb54h)		;a7d9
	or a			;a7dc
	ret z			;a7dd
	ld hl,0cb56h		;a7de
	dec (hl)			;a7e1
	ret nz			;a7e2
	ld hl,0cb54h		;a7e3
	ld (hl),000h		;a7e6
	ret			;a7e8
L_A7E9:
	ld a,(ix+000h)		;a7e9
	dec a			;a7ec
	call 0424dh		;a7ed   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_A7F0: 8 destinos del despachador p00:424D (call en p06:A7ED, el
;   indice en A): A800, A86F, A885, A86F, A86F, A86F, A8E1, A86F; lo leen
;   p06:A7ED (16 bytes)
;   0xa7f0..0xa800  (16 bytes)
DATA_tabla_A7F0:
	defw 0a800h,0a86fh,0a885h,0a86fh,0a86fh,0a86fh,0a8e1h,0a86fh	; a7f0

; ======================================================================
; CODIGO 0xa800..0xa952  (338 bytes)
; ======================================================================


L_A800:
	call L_A877		;a800
	ret z			;a803
	ld a,(de)			;a804
	inc de			;a805
	cp 00ah		;a806
	jr z,L_A870		;a808
	cp 003h		;a80a
	ld a,(de)			;a80c
	ld c,a			;a80d
	jr z,L_A840		;a80e
	sub 00ah		;a810
	cp 004h		;a812
	jr c,L_A847		;a814
	ld a,(0ca5fh)		;a816   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	dec a			;a819
	jr nz,L_A82A		;a81a
	ld a,c			;a81c
	sub 006h		;a81d
	cp 002h		;a81f
	jr c,L_A847		;a821
	ld a,c			;a823
	sub 00ah		;a824
	cp 002h		;a826
	jr c,L_A847		;a828
L_A82A:
	ld a,c			;a82a
	sub 008h		;a82b
	cp 002h		;a82d
	jp c,L_AA33		;a82f
	ld a,(0ca5fh)		;a832   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	and a			;a835
	jp z,09ca1h		;a836
	ld a,c			;a839
	cp 006h		;a83a
	ret nc			;a83c
	jp 09ca1h		;a83d
L_A840:
	sub 004h		;a840
	cp 002h		;a842
	jp nc,09ca1h		;a844
L_A847:
	dec (ix+00ch)		;a847
	ret nz			;a84a
	ld (ix+00ch),002h		;a84b
	inc (ix+00dh)		;a84f
	ld a,(ix+00dh)		;a852
	cp 004h		;a855
	ret nz			;a857
	call 06a1dh		;a858   ; sonido_0b: pide el sonido 0x0B
	push ix		;a85b
	ld e,(ix+00ah)		;a85d
	ld d,(ix+00bh)		;a860
	push de			;a863
	pop ix		;a864
	ld a,(0ca5fh)		;a866   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	and a			;a869
	call z,09d03h		;a86a   ; aviso_84_18:
	pop ix		;a86d
L_A86F:
	ret			;a86f
L_A870:
	ld a,(de)			;a870
	and a			;a871
	jp z,09ca1h		;a872
	jr L_A847		;a875
L_A877:
	ld e,(ix+00ah)		;a877
	ld d,(ix+00bh)		;a87a
	ld a,(de)			;a87d
	and a			;a87e
	ret nz			;a87f
	call 09ca1h		;a880
	xor a			;a883
	ret			;a884
L_A885:
	ld a,(ix+001h)		;a885
	and a			;a888
	jr nz,L_A8C4		;a889
	call L_A8CB		;a88b
	ld a,(ix+003h)		;a88e
	sub (ix+00dh)		;a891
	cp 010h		;a894
	jr c,L_A8A9		;a896
	ld h,(ix+007h)		;a898
	ld l,(ix+006h)		;a89b
	ld de,000c0h		;a89e
	add hl,de			;a8a1
	ld (ix+007h),h		;a8a2
	ld (ix+006h),l		;a8a5
	ret			;a8a8
L_A8A9:
	inc (ix+001h)		;a8a9
	ld (ix+00ch),010h		;a8ac
	ld (ix+00fh),002h		;a8b0
	xor a			;a8b4
	ld (ix+007h),a		;a8b5
	ld (ix+006h),a		;a8b8
	ld (ix+009h),a		;a8bb
	ld (ix+008h),a		;a8be
	jp 06a44h		;a8c1   ; sonido_14: pide el sonido 0x14
L_A8C4:
	call L_A8CB		;a8c4
	ret nz			;a8c7
	jp 09caah		;a8c8
L_A8CB:
	dec (ix+00ch)		;a8cb
	ret z			;a8ce
	ld a,(ix+00ch)		;a8cf
	and 001h		;a8d2
	ret nz			;a8d4
	ld a,(ix+00fh)		;a8d5
	rra			;a8d8
	ccf			;a8d9
	rla			;a8da
	ld (ix+00fh),a		;a8db
	or 001h		;a8de
	ret			;a8e0
L_A8E1:
	dec (ix+00ch)		;a8e1
	ret nz			;a8e4
	jp 09caah		;a8e5   ; a_p06_aa18_guarda: p06:AA18 guardando el banco de 0xA000
L_A8E8:
	call 06a29h		;a8e8   ; sonido_0e: pide el sonido 0x0E
	ld (hl),001h		;a8eb
	inc hl			;a8ed
	ld (hl),001h		;a8ee
	ld (iy+00eh),c		;a8f0
	ld a,(0cb03h)		;a8f3   ; lee la Y de Snake
	sub 010h		;a8f6
	ld (iy+00dh),a		;a8f8
	ld (iy+008h),030h		;a8fb
	ld (iy+007h),0feh		;a8ff
	ld (iy+000h),003h		;a903
	ld a,(ix+003h)		;a907
	sub 010h		;a90a
	ld (iy+003h),a		;a90c
	ld a,(ix+005h)		;a90f
	sub 010h		;a912
	ld (iy+005h),a		;a914
	ld a,007h		;a917
	push bc			;a919
	call 09c5bh		;a91a
	pop bc			;a91d
	inc c			;a91e
	ld a,048h		;a91f
	jp 09c5bh		;a921
L_A924:
	call 06c2bh		;a924   ; sonido_43: pide el sonido 0x43
	ld (hl),001h		;a927
	ld (iy+00eh),c		;a929
	ld (iy+000h),007h		;a92c
	ld (iy+00ch),006h		;a930
	ld hl,(0d8e6h)		;a934
	ld (iy+003h),h		;a937
	ld (iy+005h),l		;a93a
	ld a,007h		;a93d
	jp 09c5bh		;a93f
L_A942:
	ld a,(ix+00dh)		;a942
	rrca			;a945
	and 003h		;a946
	ld hl,0a952h		;a948
	call 043f6h		;a94b   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld (0d43ch),hl		;a94e
	ret			;a951

; ----------------------------------------------------------------------
; DATOS resto_A952: lo apuntan con el banco puesto p06:A948 (0xA952); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p06:A948 (8 bytes)
;   0xa952..0xa95a  (8 bytes)
DATA_resto_A952:
	defb 0e8h,000h,0f0h,000h,0e8h,0fah,0eah,005h	; a952  ........

; ======================================================================
; CODIGO 0xa95a..0xa969  (15 bytes)
; ======================================================================


L_A95A:
	ld a,(ix+00dh)		;a95a
	and 007h		;a95d
	ld hl,0a969h		;a95f
	call 043f6h		;a962   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld (0d43ch),hl		;a965
	ret			;a968

; ----------------------------------------------------------------------
; DATOS resto_A969: lo apuntan con el banco puesto p06:A95F (0xA969); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p06:A95F (16 bytes)
;   0xa969..0xa979  (16 bytes)
DATA_resto_A969:
	defb 0eah,004h,006h,0fch,0feh,0f2h,0feh,00eh,0f8h,0f2h,0f8h,00eh,002h,0f2h,002h,00eh	; a969  ................

; ======================================================================
; CODIGO 0xa979..0xa9c3  (74 bytes)
; ======================================================================


L_A979:
	ld a,(ix+000h)		;a979
	cp 003h		;a97c
	jr z,L_A9AA		;a97e
	dec a			;a980
	jp z,L_A9DA		;a981
	call 09cb7h		;a984   ; p02:9CB7
	ld a,(ix+000h)		;a987
	cp 005h		;a98a
	ld c,0b8h		;a98c
	jp z,L_A9C7		;a98e
	cp 007h		;a991
	ld c,018h		;a993
	jp nz,L_A9C7		;a995
	ld de,0fef8h		;a998
	ld a,(ix+00ch)		;a99b
	cp 004h		;a99e
	ld c,0f0h		;a9a0
	jp nc,L_A9CA		;a9a2
	ld c,0f4h		;a9a5
	jp L_A9CA		;a9a7
L_A9AA:
	ld a,(ix+00fh)		;a9aa
	ld hl,0a9c3h		;a9ad
	call 0423eh		;a9b0   ; suma_a_hl: HL = HL + A
	ld c,(hl)			;a9b3
	call 09cb7h		;a9b4
	ld b,002h		;a9b7
L_A9B9:
	call L_A9C7		;a9b9
	inc c			;a9bc
	inc c			;a9bd
	inc c			;a9be
	inc c			;a9bf
	djnz L_A9B9		;a9c0
L_A9C2:
	ret			;a9c2

; ----------------------------------------------------------------------
; DATOS resto_A9C3: lo apuntan con el banco puesto p06:A9AD (0xA9C3); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p06:A9AD (4 bytes)
;   0xa9c3..0xa9c7  (4 bytes)
DATA_resto_A9C3:
	defb 080h,088h,030h,038h	; a9c3

; ======================================================================
; CODIGO 0xa9c7..0xab19  (338 bytes)
; ======================================================================


L_A9C7:
	ld de,00000h		;a9c7
L_A9CA:
	ld a,(ix+003h)		;a9ca
	add a,d			;a9cd
	ld (hl),a			;a9ce
	inc hl			;a9cf
	ld a,(ix+005h)		;a9d0
	add a,e			;a9d3
	ld (hl),a			;a9d4
	inc hl			;a9d5
	ld (hl),c			;a9d6
	inc hl			;a9d7
	inc hl			;a9d8
	ret			;a9d9
L_A9DA:
	ld a,(ix+00dh)		;a9da
	and 003h		;a9dd
	ld bc,0f0e0h		;a9df
	jr z,L_A9EC		;a9e2
	ld b,008h		;a9e4
	rra			;a9e6
	jr nc,L_A9EC		;a9e7
	ld bc,0fcd8h		;a9e9
L_A9EC:
	ld d,0e0h		;a9ec
	push de			;a9ee
	call 09cb7h		;a9ef
	ld e,(ix+00ah)		;a9f2
	ld d,(ix+00bh)		;a9f5
	inc de			;a9f8
	inc de			;a9f9
	inc de			;a9fa
	ld a,(de)			;a9fb
	add a,c			;a9fc
	ld c,a			;a9fd
	add a,008h		;a9fe
	cp 0b8h		;aa00
	jr c,L_AA06		;aa02
	ld c,0e0h		;aa04
L_AA06:
	ld (hl),c			;aa06
	inc de			;aa07
	inc de			;aa08
	ld a,(de)			;aa09
	add a,b			;aa0a
	ld b,a			;aa0b
	cp 0b8h		;aa0c
	jr c,L_AA12		;aa0e
	ld (hl),0e0h		;aa10
L_AA12:
	inc hl			;aa12
	ld (hl),b			;aa13
	inc hl			;aa14
	pop af			;aa15
	ld (hl),a			;aa16
	ret			;aa17
L_AA18:
	ld c,(ix+000h)		;aa18
	ld (ix+000h),000h		;aa1b
	call L_AA33		;aa1f
	ld hl,0d400h		;aa22   ; apunta a los 22 sprites que se reparten los actores (1 = ocupado)
	ld a,b			;aa25
	call 0423eh		;aa26   ; suma_a_hl: HL = HL + A
	ld (hl),000h		;aa29
	ld a,c			;aa2b
	cp 003h		;aa2c
	ret nz			;aa2e
	inc hl			;aa2f
	ld (hl),000h		;aa30
	ret			;aa32
L_AA33:
	call 09cb7h		;aa33   ; sprite_de_lanzado: HL = el sprite (byte 0x0E) desde el 10 (0xDC28)
	ld b,(ix+00eh)		;aa36
	ld d,0e0h		;aa39
	ld (ix+003h),d		;aa3b
	ld (hl),d			;aa3e
	ld a,c			;aa3f
	cp 003h		;aa40
	ret nz			;aa42
	inc hl			;aa43
	inc hl			;aa44
	inc hl			;aa45
	inc hl			;aa46
	ld (hl),d			;aa47
	ret			;aa48
L_AA49:
	ld a,(0d881h)		;aa49
	inc a			;aa4c
	jr z,L_AA73		;aa4d
	ld a,(0d88ah)		;aa4f
	inc a			;aa52
	jr nz,L_AA61		;aa53
	ld a,(0d680h)		;aa55
	or a			;aa58
	jr nz,L_AA61		;aa59
	ld a,(0d69ch)		;aa5b
	or a			;aa5e
	jr z,L_AAC6		;aa5f
L_AA61:
	ld a,(0d883h)		;aa61
	inc a			;aa64
	jr nz,L_AA73		;aa65
	ld a,(0d678h)		;aa67
	or a			;aa6a
	jr nz,L_AA73		;aa6b
	ld a,(0d68ch)		;aa6d
	or a			;aa70
	jr z,L_AAC6		;aa71
L_AA73:
	ld a,(0d8c1h)		;aa73
	cp 013h		;aa76
	jr z,L_AAC6		;aa78
	ld a,(0d8c2h)		;aa7a
	cp 005h		;aa7d
	jr nz,L_AA87		;aa7f
	ld a,(0cb5fh)		;aa81
	or a			;aa84
	jr nz,L_AAC6		;aa85
L_AA87:
	ld a,(0caa8h)		;aa87   ; lee 1 mientras se ve el rotulo de la cosa cogida
	or a			;aa8a
	ret nz			;aa8b
	ld a,(0e1d0h)		;aa8c
	or a			;aa8f
	ret nz			;aa90
	ld a,(0e1f0h)		;aa91
	or a			;aa94
	ret nz			;aa95
	ld a,(0e256h)		;aa96   ; lee la direccion en la que se mira la sala de al lado (estado 0x0E)
	or a			;aa99
	ret nz			;aa9a
	ld a,(0cac0h)		;aa9b   ; lee 1 en pausa (F1)
	or a			;aa9e
	ret nz			;aa9f
	ld a,(0cb00h)		;aaa0   ; lee el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	cp 010h		;aaa3
	jr z,L_AAC6		;aaa5
	cp 011h		;aaa7
	jr z,L_AAC6		;aaa9
	cp 018h		;aaab
	jr z,L_AAC4		;aaad
	cp 019h		;aaaf
	jr z,L_AAC4		;aab1
	cp 013h		;aab3
	jr nc,L_AAC6		;aab5
	ld a,(0cb37h)		;aab7
	or a			;aaba
	jr z,L_AAC4		;aabb
	ld a,(0cb28h)		;aabd
	cp 002h		;aac0
	ccf			;aac2
	ret			;aac3
L_AAC4:
	scf			;aac4
	ret			;aac5
L_AAC6:
	and a			;aac6
	ret			;aac7
L_AAC8:
	ld a,(0d8c0h)		;aac8
	or a			;aacb
	ret nz			;aacc
	ld a,(0d7e2h)		;aacd
	bit 5,a		;aad0
	ret z			;aad2
	ld a,(0d8c2h)		;aad3
	cp 005h		;aad6
	ret z			;aad8
	call L_AAE9		;aad9
	ret nz			;aadc
	ld de,02888h		;aadd
	ld bc,00202h		;aae0
	ld hl,0ab19h		;aae3   ; mosaico_AB19: un mosaico de 2 x 2 caracteres, un byte cada uno
	jp 050a0h		;aae6   ; mosaico_f2_b1: el mosaico de HL en (D, E), B filas de C caracteres, con la forma 2 de la franja 1 (p00:512C)
L_AAE9:
	ld a,(0ca4ah)		;aae9   ; lee la zona
	cp 00bh		;aaec
	jr z,L_AB13		;aaee
	cp 00dh		;aaf0
	jr z,L_AB0D		;aaf2
	cp 006h		;aaf4
	ret nz			;aaf6
	ld a,(0ca4bh)		;aaf7   ; lee la sala de la zona
	cp 023h		;aafa
	ret nz			;aafc
	ld de,02888h		;aafd
	ld bc,00202h		;ab00
	ld hl,0ab1dh		;ab03   ; mosaico_AB1D: un mosaico de 2 x 2 caracteres, un byte cada uno
	call 050e8h		;ab06   ; mosaico_f2_b3: el mosaico de HL en (D, E), B filas de C caracteres, con la forma 2 de la franja 3 (p00:512C)
	xor a			;ab09
	sub 0a0h		;ab0a
	ret			;ab0c
L_AB0D:
	ld a,(0ca4bh)		;ab0d   ; lee la sala de la zona
	cp 003h		;ab10
	ret			;ab12
L_AB13:
	ld a,(0ca4bh)		;ab13   ; lee la sala de la zona
	cp 007h		;ab16
	ret			;ab18

; ----------------------------------------------------------------------
; DATOS mosaico_AB19: un mosaico de 2 x 2 caracteres, un byte cada uno
;   (p00:510F; BC = 0x0202 en quien llama); lo leen p06:AAE6 (4 bytes)
;   0xab19..0xab1d  (4 bytes)
DATA_mosaico_AB19:
	defb 0f5h,0f6h	; ab19
	defb 0f7h,0f8h	; ab1b

; ----------------------------------------------------------------------
; DATOS mosaico_AB1D: un mosaico de 2 x 2 caracteres, un byte cada uno
;   (p00:510F; BC = 0x0202 en quien llama); lo leen p06:AB06 (4 bytes)
;   0xab1d..0xab21  (4 bytes)
DATA_mosaico_AB1D:
	defb 0d5h,0d6h	; ab1d
	defb 0d7h,0d8h	; ab1f

; ======================================================================
; CODIGO 0xab21..0xab7d  (92 bytes)
; ======================================================================


L_AB21:
	ld a,(0d7dah)		;ab21
	rra			;ab24
	ret nc			;ab25
	ld a,(0ca65h)		;ab26   ; lee el sitio de 0xCBE0 en el que esta Snake (0 = ninguno)
	or a			;ab29
	ret nz			;ab2a
	ld a,(0ca76h)		;ab2b   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	or a			;ab2e
	ret nz			;ab2f
	ld a,(0ca4ah)		;ab30   ; lee la zona
	cp 00ah		;ab33
	ret nz			;ab35
	ld a,(0ca4bh)		;ab36   ; lee la sala de la zona
	dec a			;ab39
	ret nz			;ab3a
	call L_AB53		;ab3b
	ld hl,0de88h		;ab3e
	ld b,004h		;ab41
	ld a,001h		;ab43
	ld de,00015h		;ab45
L_AB48:
	ld (hl),a			;ab48
	inc hl			;ab49
	ld (hl),a			;ab4a
	inc hl			;ab4b
	ld (hl),a			;ab4c
	inc hl			;ab4d
	ld (hl),a			;ab4e
	add hl,de			;ab4f
	djnz L_AB48		;ab50
	ret			;ab52
L_AB53:
	ld hl,0ab7dh		;ab53   ; mosaico_AB7D: un mosaico de 5 x 4 caracteres, un byte cada uno
	ld de,04080h		;ab56
	ld bc,00504h		;ab59
	call 050a0h		;ab5c   ; mosaico_f2_b1: el mosaico de HL en (D, E), B filas de C caracteres, con la forma 2 de la franja 1 (p00:512C)
	ld hl,040a0h		;ab5f
	ld de,060a0h		;ab62
	call L_AB6E		;ab65
	ld hl,050a0h		;ab68
	ld de,040a0h		;ab6b
L_AB6E:
	ld bc,00808h		;ab6e
	ld a,(0ca42h)		;ab71   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	rlca			;ab74
	rlca			;ab75
	and 00ch		;ab76
	or 002h		;ab78
	jp 04767h		;ab7a   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)

; ----------------------------------------------------------------------
; DATOS mosaico_AB7D: un mosaico de 5 x 4 caracteres, un byte cada uno
;   (p00:510F; BC = 0x0504 en quien llama); lo leen p06:AB5C (20 bytes)
;   0xab7d..0xab91  (20 bytes)
DATA_mosaico_AB7D:
	defb 003h,003h,001h,002h	; ab7d
	defb 003h,002h,003h,003h	; ab81
	defb 002h,001h,002h,002h	; ab85
	defb 003h,002h,003h,001h	; ab89
	defb 000h,003h,002h,001h	; ab8d

; ======================================================================
; CODIGO 0xab91..0xabfe  (109 bytes)
; ======================================================================


L_AB91:
	call L_ABB0		;ab91
	ld hl,0c060h		;ab94
	ld d,074h		;ab97
	ld e,l			;ab99
	call L_ABA3		;ab9a
	ld hl,000c0h		;ab9d
	ld d,010h		;aba0
	ld e,l			;aba2
L_ABA3:
	ld a,(0ca42h)		;aba3   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	and a			;aba6
	ld a,001h		;aba7
	jr nz,L_ABAD		;aba9
	ld a,004h		;abab
L_ABAD:
	jp 047abh		;abad   ; copia_en_y: orden YMMM del VDP
L_ABB0:
	ld hl,080c0h		;abb0
	ld d,h			;abb3
	ld e,l			;abb4
	ld bc,05810h		;abb5
	jp 0474dh		;abb8   ; copia_rectangulo_a_esta: p00:4767 de la otra pagina (0xCA42 ^ 1) a la de 0xCA42
L_ABBB:
	ld a,(0ca4ah)		;abbb   ; lee la zona
	cp 010h		;abbe
	ret nz			;abc0
	ld a,(0ca4bh)		;abc1   ; lee la sala de la zona
	cp 002h		;abc4
	ret c			;abc6
	ld b,004h		;abc7
	ld de,04840h		;abc9
	jr z,L_ABD2		;abcc
	ld b,000h		;abce
	ld d,068h		;abd0
L_ABD2:
	ld hl,00100h		;abd2
	ld (0ca4ch),hl		;abd5   ; guarda los 4 bits altos del byte de la sala (p56:BD28) y el byte siguiente (16 bits)
	ld a,(0ca43h)		;abd8
	add a,a			;abdb
	add a,a			;abdc
	add a,b			;abdd
	ld hl,0abfeh		;abde
	call 0423eh		;abe1   ; suma_a_hl: HL = HL + A
	ld bc,00202h		;abe4
L_ABE7:
	push bc			;abe7
	push de			;abe8
L_ABE9:
	ld a,(hl)			;abe9
	call 049dah		;abea   ; pieza_de_2_a_la_otra: el caracter A de la pagina 2 a la otra
	inc hl			;abed
	ld a,d			;abee
	add a,008h		;abef
	ld d,a			;abf1
	dec c			;abf2
	jr nz,L_ABE9		;abf3
	pop de			;abf5
	ld a,e			;abf6
	add a,008h		;abf7
	ld e,a			;abf9
	pop bc			;abfa
	djnz L_ABE7		;abfb
	ret			;abfd

; ----------------------------------------------------------------------
; DATOS resto_ABFE: lo apuntan con el banco puesto p06:ABDE (0xABFE); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p06:ABDE (40 bytes)
;   0xabfe..0xac26  (40 bytes)
DATA_resto_ABFE:
	defb 0a1h,0a1h,0a4h,0a4h,0a1h,0a2h,0a4h,0a5h,0a1h,0a2h,0a4h,0a6h,0a1h,0a9h,0a4h,0a8h	; abfe  ................
	defb 0a1h,0aah,0a4h,0a6h,0a1h,0aah,0a4h,0a7h,0a1h,0a2h,0a4h,0a4h,0a1h,0a0h,0a4h,0a7h	; ac0e  ................
	defb 0a1h,0a0h,0a4h,0a8h,0a2h,0a0h,0a5h,0a3h	; ac1e  ........

; ======================================================================
; CODIGO 0xac26..0xac82  (92 bytes)
; ======================================================================


L_AC26:
	ld hl,0e000h		;ac26
	ld bc,0003fh		;ac29
	call 04236h		;ac2c   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	ld a,(0ca4ah)		;ac2f   ; lee la zona
	cp 007h		;ac32
	ret nz			;ac34
	ld hl,0ac82h		;ac35
	ld a,(0ca4bh)		;ac38   ; lee la sala de la zona
	cp 002h		;ac3b
	jr z,L_AC53		;ac3d
	ld hl,0ac9ah		;ac3f
	cp 003h		;ac42
	jr z,L_AC53		;ac44
	ld hl,0acb2h		;ac46
	cp 004h		;ac49
	jr z,L_AC53		;ac4b
	ld hl,0accah		;ac4d
	cp 008h		;ac50
	ret nz			;ac52
L_AC53:
	ld ix,0e000h		;ac53
	ld b,008h		;ac57
	ld de,00008h		;ac59
L_AC5C:
	call L_AC64		;ac5c
	add ix,de		;ac5f
	djnz L_AC5C		;ac61
	ret			;ac63
L_AC64:
	xor a			;ac64
	ld (ix+004h),a		;ac65
	ld (ix+001h),a		;ac68
	inc a			;ac6b
	ld (ix+000h),a		;ac6c
	ld a,(hl)			;ac6f
	inc hl			;ac70
	ld (ix+002h),a		;ac71
	ld (ix+003h),a		;ac74
	ld a,(hl)			;ac77
	inc hl			;ac78
	ld (ix+005h),a		;ac79
	ld a,(hl)			;ac7c
	ld (ix+006h),a		;ac7d
	inc hl			;ac80
	ret			;ac81

; ----------------------------------------------------------------------
; DATOS resto_AC82: lo apuntan con el banco puesto p06:AC35 (0xAC82); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p06:AC35 (9 bytes)
;   0xac82..0xac8b  (9 bytes)
DATA_resto_AC82:
	defb 006h,05ah,084h,002h,0a8h,08ch,001h,09ch,042h	; ac82  .Z......B

; ======================================================================
; CODIGO 0xac8b..0xac95  (10 bytes)
; ======================================================================


L_AC8B:
	add hl,bc			;ac8b
	ld c,b			;ac8c
	jr nc,$+18		;ac8d
	jr nc,$-76		;ac8f
	inc b			;ac91
	ld h,h			;ac92
	jr $+10		;ac93

; ----------------------------------------------------------------------
; DATOS resto_AC95: lo apuntan con el banco puesto p06:AC3F (0xAC9A); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p06:AC3F (8 bytes)
;   0xac95..0xac9d  (8 bytes)
DATA_resto_AC95:
	defb 09ch,020h,00ch,070h,094h,006h,09ah,064h	; ac95  . .p...d

; ======================================================================
; CODIGO 0xac9d..0xacca  (45 bytes)
; ======================================================================


L_AC9D:
	ld (bc),a			;ac9d
	jr nz,$-118		;ac9e
	ld bc,09468h		;aca0
	add hl,bc			;aca3
	ld b,d			;aca4
	ld h,d			;aca5
	djnz $-90		;aca6
	inc l			;aca8
	inc b			;aca9
	sub (hl)			;acaa
	ld b,008h		;acab
	ld h,d			;acad
	ld hl,(04c0ch)		;acae
	ld l,(hl)			;acb1
	ld b,028h		;acb2
	ld d,d			;acb4
	ld (bc),a			;acb5
	jr nc,$+98		;acb6
	ld bc,09048h		;acb8
	add hl,bc			;acbb
	jr nc,$+120		;acbc
	djnz $-118		;acbe
	jr nc,L_ACC6		;acc0
	ld l,h			;acc2
	inc c			;acc3
	ex af,af'			;acc4
	and b			;acc5
L_ACC6:
	jr nz,$+14		;acc6
	jr $+46		;acc8

; ----------------------------------------------------------------------
; DATOS resto_ACCA: lo apuntan con el banco puesto p06:AC4D (0xACCA); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p06:AC4D (10 bytes)
;   0xacca..0xacd4  (10 bytes)
DATA_resto_ACCA:
	defb 004h,038h,06ch,002h,048h,094h,006h,09ah,086h,007h	; acca  .8l.H.....

; ======================================================================
; CODIGO 0xacd4..0xad5a  (134 bytes)
; ======================================================================


L_ACD4:
	sbc a,b			;acd4
	jr c,$+5		;acd5
	jr z,$+82		;acd7
	djnz $+42		;acd9
	or h			;acdb
	ex af,af'			;acdc
	ld e,b			;acdd
	ld (08a0ch),a		;acde
	or d			;ace1
L_ACE2:
	ld a,(0ca4ah)		;ace2   ; lee la zona
	cp 007h		;ace5
	ret nz			;ace7
	ld ix,0e000h		;ace8
	ld b,008h		;acec
L_ACEE:
	ld a,(ix+000h)		;acee
	or a			;acf1
	jr z,L_ACF9		;acf2
	push bc			;acf4
	call L_AD01		;acf5
	pop bc			;acf8
L_ACF9:
	ld de,00008h		;acf9
	add ix,de		;acfc
	djnz L_ACEE		;acfe
	ret			;ad00
L_AD01:
	ld a,(ix+001h)		;ad01
	dec a			;ad04
	jr z,L_AD4E		;ad05
	dec (ix+003h)		;ad07
	ret nz			;ad0a
	inc (ix+004h)		;ad0b
	ld a,(ix+004h)		;ad0e
	cp 005h		;ad11
	jr c,L_AD24		;ad13
	ld (ix+004h),000h		;ad15
	inc (ix+001h)		;ad19
	ld a,(ix+002h)		;ad1c
	ld (ix+003h),a		;ad1f
	jr L_AD28		;ad22
L_AD24:
	ld (ix+003h),002h		;ad24
L_AD28:
	ld a,(ix+004h)		;ad28
	ld e,(ix+005h)		;ad2b
	ld d,(ix+006h)		;ad2e
	ld hl,00800h		;ad31
L_AD34:
	rlca			;ad34
	rlca			;ad35
	rlca			;ad36
	or a			;ad37
	jr z,L_AD3F		;ad38
	add a,0d0h		;ad3a
	ld h,a			;ad3c
	ld l,018h		;ad3d
L_AD3F:
	ld a,(0ca42h)		;ad3f   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	rlca			;ad42
	rlca			;ad43
	and 00ch		;ad44
	or 002h		;ad46
	ld bc,00808h		;ad48
	jp 04767h		;ad4b   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
L_AD4E:
	dec (ix+003h)		;ad4e
	ret nz			;ad51
	ld (ix+003h),002h		;ad52
	dec (ix+001h)		;ad56
	ret			;ad59

; ----------------------------------------------------------------------
; DATOS resto_AD5A: lo apuntan con el banco puesto p12:65B5 (0xAD5A); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p12:65B5 (58 bytes)
;   0xad5a..0xad94  (58 bytes)
DATA_resto_AD5A:
	defb 05ch,0adh,0c5h,03ah,099h,0c3h,026h,040h,0cdh,024h,000h,0cdh,0c1h,065h,03eh,001h	; ad5a  \..:..&@.$...e>.
	defb 032h,096h,0c3h,03ah,099h,0c3h,026h,040h,0cdh,024h,000h,0c1h,079h,0e6h,00eh,00fh	; ad6a  2..:..&@.$..y...
	defb 0feh,002h,038h,006h,0feh,006h,038h,00bh,018h,005h,00eh,004h,00fh,030h,006h,00eh	; ad7a  ..8...8......0..
	defb 003h,018h,002h,00eh,000h,0c3h,099h,0adh,00eh,006h	; ad8a  ..........

; ======================================================================
; CODIGO 0xad94..0xadbc  (40 bytes)
; ======================================================================


L_AD94:
	push bc			;ad94
	call 065c1h		;ad95
	pop bc			;ad98
	ld a,c			;ad99
	ld hl,0add7h		;ad9a
	call 043f6h		;ad9d   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	call 04918h		;ada0   ; letrero_con_sitio: [fila][columna] y letras; 0xFE otra posicion, 0xFF acaba
	ld hl,0ade5h		;ada3
	call 04918h		;ada6   ; letrero_con_sitio: [fila][columna] y letras; 0xFE otra posicion, 0xFF acaba
	call 065c6h		;ada9
	ld a,(0c394h)		;adac
	ld (0fd9ah),a		;adaf
	ld a,002h		;adb2
	ld (0c3a1h),a		;adb4
	ld sp,(0c392h)		;adb7
	ret			;adbb

; ----------------------------------------------------------------------
; DATOS sin identificar  0xadbc..0xadc0  (4 bytes)
DATA_ADBC:
	defb 0beh,0adh,0cdh,0c1h	; adbc

; ======================================================================
; CODIGO 0xadc0..0xadd7  (23 bytes)
; ======================================================================


L_ADC0:
	ld h,l			;adc0
	ld a,(0c399h)		;adc1   ; lee el slot del cartucho para ENASLT
	ld h,040h		;adc4
	call 00024h		;adc6   ; BIOS ENASLT - Switches to specified slot and page definitively
	call 065c6h		;adc9   ; p12:65C6
	ld a,(0c394h)		;adcc
	ld (0fd9ah),a		;adcf
	ld sp,(0c392h)		;add2
	ret			;add6

; ----------------------------------------------------------------------
; DATOS resto_ADD7: lo apuntan con el banco puesto p06:AD9A (0xADD7), p06:ADA3
;   (0xADE5); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p06:AD9A, p06:ADA3 (139 bytes)
;   0xadd7..0xae62  (139 bytes)
DATA_resto_ADD7:
	defb 0f2h,0adh,002h,0aeh,013h,0aeh,01fh,0aeh,030h,0aeh,040h,0aeh,052h,0aeh,040h,08ch	; add7  ........0.@.R.@.
	defb 00eh,013h,01dh,015h,000h,00fh,01ch,01ch,019h,01ch,0ffh,038h,09ch,00eh,013h,01dh	; ade7  ...........8....
	defb 015h,000h,013h,019h,000h,00fh,01ch,01ch,019h,01ch,0ffh,038h,09ch,010h,013h,016h	; adf7  ...........8....
	defb 00fh,000h,018h,019h,01eh,000h,010h,019h,01fh,018h,00eh,0ffh,048h,09ch,00eh,013h	; ae07  ............H...
	defb 01dh,015h,000h,010h,01fh,016h,016h,0ffh,030h,09ch,00eh,013h,01dh,015h,000h,018h	; ae17  ........0.......
	defb 019h,01eh,000h,01ch,00fh,00bh,00eh,023h,0ffh,038h,09ch,021h,01ch,013h,01eh,00fh	; ae27  .......#.8.!....
	defb 000h,01ah,01ch,019h,01eh,00fh,00dh,01eh,0ffh,038h,09ch,01eh,019h,019h,000h,017h	; ae37  .........8......
	defb 00bh,018h,018h,023h,000h,010h,013h,016h,00fh,01dh,0ffh,038h,09ch,00eh,00bh,01eh	; ae47  ...#.......8....
	defb 00bh,01eh,023h,01ah,00fh,00fh,01ch,01ch,019h,01ch,0ffh	; ae57  ..#........

; ======================================================================
; CODIGO 0xae62..0xaf02  (160 bytes)
; ======================================================================


L_AE62:
	ld hl,0ca29h		;ae62
	ld a,(0ca07h)		;ae65   ; lee lo recien pulsado del mando (los bits de 0xCA08 que no estaban)
	ld b,a			;ae68
	and 030h		;ae69
	scf			;ae6b
	ret nz			;ae6c
	ld a,b			;ae6d
	rra			;ae6e
	jr c,L_AE7D		;ae6f
	rra			;ae71
	ret nc			;ae72
	ld a,(hl)			;ae73
	inc a			;ae74
	cp 003h		;ae75
	jr c,L_AE7A		;ae77
	xor a			;ae79
L_AE7A:
	ld (hl),a			;ae7a
	jr L_AE86		;ae7b
L_AE7D:
	ld a,(hl)			;ae7d
	dec a			;ae7e
	cp 0ffh		;ae7f
	jr nz,L_AE85		;ae81
	ld a,002h		;ae83
L_AE85:
	ld (hl),a			;ae85
L_AE86:
	call 05f49h		;ae86   ; sonido_11: pide el sonido 0x11
L_AE89:
	xor a			;ae89
	call L_AE8F		;ae8a
	ld a,001h		;ae8d
L_AE8F:
	ld hl,03860h		;ae8f
	ld bc,00828h		;ae92
	push af			;ae95
	ld d,a			;ae96
	xor a			;ae97
	call 046ffh		;ae98   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
	pop af			;ae9b
	push af			;ae9c
	ld a,(0ca29h)		;ae9d
	add a,a			;aea0
	add a,a			;aea1
	add a,a			;aea2
	add a,a			;aea3
	add a,060h		;aea4
	ld e,a			;aea6
	ld d,038h		;aea7
	ld hl,05038h		;aea9
	ld bc,00808h		;aeac
	pop af			;aeaf
	rrca			;aeb0
	rrca			;aeb1
	rrca			;aeb2
	rrca			;aeb3
	or 0c8h		;aeb4
	call 047edh		;aeb6   ; copia_rectangulo_logica: orden LMMM del VDP con la operacion logica de A
	or a			;aeb9
	ret			;aeba
L_AEBB:
	ld hl,0cbe0h		;aebb   ; apunta a 8 sitios de 4 bytes [numero][Y][X][...] en los que se entra yendo hacia arriba
	ld bc,0001fh		;aebe
	call 04236h		;aec1   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	ld hl,0bb13h		;aec4
	ld a,(0ca4ah)		;aec7   ; lee la zona
	call 043f6h		;aeca   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld a,(0ca4bh)		;aecd   ; lee la sala de la zona
	ld c,a			;aed0
L_AED1:
	ld a,(hl)			;aed1
	ld b,a			;aed2
	inc b			;aed3
	ret z			;aed4
	cp c			;aed5
	inc hl			;aed6
	push hl			;aed7
	push bc			;aed8
	call z,L_AEE3		;aed9
	pop bc			;aedc
	pop hl			;aedd
	inc hl			;aede
	inc hl			;aedf
	inc hl			;aee0
	jr L_AED1		;aee1
L_AEE3:
	ld c,(hl)			;aee3
	inc hl			;aee4
	ld d,(hl)			;aee5
	inc hl			;aee6
	ld e,(hl)			;aee7
	ld hl,0cbe0h		;aee8   ; apunta a 8 sitios de 4 bytes [numero][Y][X][...] en los que se entra yendo hacia arriba
	ld b,008h		;aeeb
L_AEED:
	ld a,(hl)			;aeed
	and a			;aeee
	jr z,L_AEF9		;aeef
	ld a,004h		;aef1
	call 0423eh		;aef3   ; suma_a_hl: HL = HL + A
	djnz L_AEED		;aef6
	ret			;aef8
L_AEF9:
	ld (hl),c			;aef9
	inc l			;aefa
	ld (hl),d			;aefb
	inc l			;aefc
	ld (hl),e			;aefd
	ret			;aefe
L_AEFF:
	call 0424dh		;aeff   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_AF02: 36 destinos del despachador p00:424D (call en p06:AEFF, el
;   indice en A): AF4A, AF55, AF60, AF75, AF80, AF92, AF9D, AFAC, AFB7, AFBD,
;   AFC3, AFC9, AFD5, AFE0, AFE6, AFEC, AFFC, B002, B008, B00E, B014, B01A,
;   B020, B028, B031, B037, B03D, B043, 6BFF, B04E, B054, B05F, B060, AFCF,
;   AF54, 6B55; lo leen p06:AEFF (72 bytes)
;   0xaf02..0xaf4a  (72 bytes)
DATA_tabla_AF02:
	defw 0af4ah,0af55h,0af60h,0af75h,0af80h,0af92h,0af9dh,0afach	; af02
	defw 0afb7h,0afbdh,0afc3h,0afc9h,0afd5h,0afe0h,0afe6h,0afech	; af12
	defw 0affch,0b002h,0b008h,0b00eh,0b014h,0b01ah,0b020h,0b028h	; af22
	defw 0b031h,0b037h,0b03dh,0b043h,06bffh,0b04eh,0b054h,0b05fh	; af32
	defw 0b060h,0afcfh,0af54h,06b55h	; af42  -> L_B060 L_AFCF L_AF54 0x6b55

; ======================================================================
; CODIGO 0xaf4a..0xb09d  (339 bytes)
; ======================================================================


L_AF4A:
	ld hl,0d7d0h		;af4a   ; apunta a las banderas de la partida: la n en el bit 7 - n % 8 del byte n / 8 (p03:B0DC, p03:B0F6)
	set 6,(hl)		;af4d
	ld hl,0d7ddh		;af4f
	res 1,(hl)		;af52
L_AF54:
	ret			;af54
L_AF55:
	ld hl,0d7d0h		;af55   ; apunta a las banderas de la partida: la n en el bit 7 - n % 8 del byte n / 8 (p03:B0DC, p03:B0F6)
	set 1,(hl)		;af58
	ld hl,0d7ddh		;af5a
	res 5,(hl)		;af5d
	ret			;af5f
L_AF60:
	ld hl,0d7d1h		;af60
	set 1,(hl)		;af63
	ld hl,0cadeh		;af65
	ld (hl),000h		;af68
	ld hl,0cb7dh		;af6a
	ld (hl),001h		;af6d
	call 06b12h		;af6f   ; sonido_05: pide el sonido 0x05
	jp 06bach		;af72   ; sonido_9c: pide el sonido 0x9C (de los que tienen la partitura en un banco de musica, p16:4CE3)
L_AF75:
	ld hl,0d7d2h		;af75
	res 5,(hl)		;af78
	ld hl,0d7e3h		;af7a
	set 0,(hl)		;af7d
	ret			;af7f
L_AF80:
	ld hl,0d7d3h		;af80
	res 6,(hl)		;af83
	ld hl,0d7e3h		;af85
	set 5,(hl)		;af88
	ld hl,0cb7dh		;af8a
	ld (hl),001h		;af8d
	jp 06b95h		;af8f   ; sonido_81: pide el sonido 0x81 (de los que tienen la partitura en un banco de musica, p16:4CE3)
L_AF92:
	ld hl,0d7d4h		;af92
	set 5,(hl)		;af95
	ld hl,0d7deh		;af97
	res 6,(hl)		;af9a
	ret			;af9c
L_AF9D:
	ld hl,0d7d4h		;af9d
	set 4,(hl)		;afa0
	ld a,004h		;afa2
	ld (0ca22h),a		;afa4   ; guarda la fase de la partida (indice de las listas de p06:B40C)
	xor a			;afa7
	ld (0d4e3h),a		;afa8
	ret			;afab
L_AFAC:
	ld hl,0d7d8h		;afac
	set 0,(hl)		;afaf
	ld hl,0d7deh		;afb1
	res 2,(hl)		;afb4
	ret			;afb6
L_AFB7:
	ld hl,0d7d9h		;afb7
	set 7,(hl)		;afba
	ret			;afbc
L_AFBD:
	ld hl,0d7dbh		;afbd
	res 4,(hl)		;afc0
	ret			;afc2
L_AFC3:
	ld hl,0d7dbh		;afc3
	res 2,(hl)		;afc6
	ret			;afc8
L_AFC9:
	ld hl,0d7dch		;afc9
	res 7,(hl)		;afcc
	ret			;afce
L_AFCF:
	ld hl,0d7dch		;afcf
	res 6,(hl)		;afd2
	ret			;afd4
L_AFD5:
	ld hl,0d7dch		;afd5
	res 4,(hl)		;afd8
	ld hl,0d7e2h		;afda
	res 6,(hl)		;afdd
	ret			;afdf
L_AFE0:
	ld hl,0d7dch		;afe0
	res 3,(hl)		;afe3
	ret			;afe5
L_AFE6:
	ld hl,0d7dch		;afe6
	res 2,(hl)		;afe9
	ret			;afeb
L_AFEC:
	ld hl,0d7dch		;afec
	res 1,(hl)		;afef
	ld hl,0d7e4h		;aff1
	set 3,(hl)		;aff4
	ld hl,0d7a0h		;aff6
	ld (hl),066h		;aff9
	ret			;affb
L_AFFC:
	ld hl,0d7ddh		;affc
	res 7,(hl)		;afff
	ret			;b001
L_B002:
	ld hl,0d7ddh		;b002
	res 6,(hl)		;b005
	ret			;b007
L_B008:
	ld hl,0d7ddh		;b008
	res 4,(hl)		;b00b
	ret			;b00d
L_B00E:
	ld hl,0d7deh		;b00e
	res 7,(hl)		;b011
	ret			;b013
L_B014:
	ld hl,0d7deh		;b014
	res 5,(hl)		;b017
	ret			;b019
L_B01A:
	ld hl,0d7deh		;b01a
	res 1,(hl)		;b01d
	ret			;b01f
L_B020:
	ld hl,0d7dfh		;b020
	set 2,(hl)		;b023
	res 1,(hl)		;b025
	ret			;b027
L_B028:
	ld hl,0d7dfh		;b028
	res 0,(hl)		;b02b
	inc hl			;b02d
	set 7,(hl)		;b02e
	ret			;b030
L_B031:
	ld hl,0d7e1h		;b031
	res 0,(hl)		;b034
	ret			;b036
L_B037:
	ld hl,0d7e2h		;b037
	res 7,(hl)		;b03a
	ret			;b03c
L_B03D:
	ld hl,0d7e3h		;b03d
	set 3,(hl)		;b040
	ret			;b042
L_B043:
	ld hl,0caach		;b043
	ld (hl),001h		;b046
	ld hl,0cabah		;b048
	ld (hl),000h		;b04b
	ret			;b04d
L_B04E:
	ld hl,0d7d4h		;b04e
	set 7,(hl)		;b051
	ret			;b053
L_B054:
	ld hl,0d7e4h		;b054
	set 5,(hl)		;b057
	ld hl,0d7a1h		;b059
	ld (hl),099h		;b05c
	ret			;b05e
L_B05F:
	ret			;b05f
L_B060:
	ld hl,0caach		;b060
	ld (hl),000h		;b063
	ret			;b065
L_B066:
	call 0c000h		;b066
	call 06a0dh		;b069   ; sonido_01: pide el sonido 0x01
	ld a,005h		;b06c
	call 0005fh		;b06e   ; BIOS CHGMOD - Switches to given screen mode
	ld d,000h		;b071
	call 04be4h		;b073   ; borra_toda_la_pagina: p00:46FF desde (0,0) con BC = 0 y A = 0 en la pagina D
	ld d,001h		;b076
	call 04be4h		;b078   ; borra_toda_la_pagina: p00:46FF desde (0,0) con BC = 0 y A = 0 en la pagina D
	ld d,002h		;b07b
	call 04be4h		;b07d   ; borra_toda_la_pagina: p00:46FF desde (0,0) con BC = 0 y A = 0 en la pagina D
	ld d,003h		;b080
	call 04be4h		;b082   ; borra_toda_la_pagina: p00:46FF desde (0,0) con BC = 0 y A = 0 en la pagina D
	call 04650h		;b085   ; espera_vdp: espera a que el VDP acabe la orden en curso (S#2 bit 0)
	ld b,008h		;b088
	ld hl,0b09dh		;b08a
L_B08D:
	push bc			;b08d
	ld c,(hl)			;b08e
	inc hl			;b08f
	ld b,(hl)			;b090
	inc hl			;b091
	push hl			;b092
	call 00047h		;b093   ; BIOS WRTVDP - Writes data in the VDP-register
	pop hl			;b096
	pop bc			;b097
	djnz L_B08D		;b098
	jp 045f6h		;b09a   ; apaga_sprites: R#8 con el bit 1 (SPD) a uno, desde la copia 0xFFE7

; ----------------------------------------------------------------------
; DATOS resto_B09D: lo apuntan con el banco puesto p06:B08A (0xB09D); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p06:B08A (16 bytes)
;   0xb09d..0xb0ad  (16 bytes)
DATA_resto_B09D:
	defb 000h,006h,001h,062h,005h,0efh,006h,01fh,008h,008h,009h,080h,00bh,001h,013h,0b4h	; b09d  ...b............

; ======================================================================
; CODIGO 0xb0ad..0xb155  (168 bytes)
; ======================================================================


lee_mando_y_teclas:		; el mando a 0xCA08/0xCA07 y las teclas de funcion a 0xCA0A/0xCA09
	call matriz_del_teclado		;b0ad   ; matriz_del_teclado: en el estado (5, 8): las filas 0-5 a 0xC7D0 y lo recien pulsado a 0xC7E0
	call mando		;b0b0   ; mando: A = el joystick 1 y el teclado juntos (bits 0-3 direcciones, 4-5 disparos)
	call guarda_mando		;b0b3   ; guarda_mando: (0xCA08) = A y (0xCA07) = lo que no estaba pulsado
	call teclas_de_funcion		;b0b6   ; teclas_de_funcion: A = las filas 6 y 7 de la matriz, en 6 bits
	ld hl,0ca0ah		;b0b9   ; apunta a las teclas de funcion pulsadas: bit 0 F1, 1 F2, 2 F3, 3 F4, 4 F5, 5 RETURN
	jr L_B0C1		;b0bc
guarda_mando:		; (0xCA08) = A y (0xCA07) = lo que no estaba pulsado
	ld hl,0ca08h		;b0be   ; apunta a el mando: joystick y teclado juntos (bits 0-3 las direcciones, 4-5 los disparos)
L_B0C1:
	ld c,(hl)			;b0c1
	ld (hl),a			;b0c2
	xor c			;b0c3
	and (hl)			;b0c4
	dec hl			;b0c5
	ld (hl),a			;b0c6
	ret			;b0c7
mando:		; A = el joystick 1 y el teclado juntos (bits 0-3 direcciones, 4-5 disparos)
	ld e,08fh		;b0c8
	ld a,00fh		;b0ca
	call 00093h		;b0cc   ; BIOS WRTPSG - Writes data to PSG-register
	ld a,00eh		;b0cf
	di			;b0d1
	call 00096h		;b0d2   ; BIOS RDPSG - Reads value from PSG-register
	ei			;b0d5
	cpl			;b0d6
	and 03fh		;b0d7
	push af			;b0d9
	ld a,004h		;b0da
	call 00141h		;b0dc   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;b0df
	rlca			;b0e0
	rlca			;b0e1
	ld b,a			;b0e2
	rlca			;b0e3
	and 020h		;b0e4
	ld e,a			;b0e6
	ld a,b			;b0e7
	and 020h		;b0e8
	or e			;b0ea
	ld e,a			;b0eb
	ld a,008h		;b0ec
	call 00141h		;b0ee   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;b0f1
	rrca			;b0f2
	rrca			;b0f3
	ld b,a			;b0f4
	and 004h		;b0f5
	or e			;b0f7
	ld c,a			;b0f8
	ld a,b			;b0f9
	rrca			;b0fa
	rrca			;b0fb
	ld b,a			;b0fc
	and 018h		;b0fd
	or c			;b0ff
	ld c,a			;b100
	ld a,b			;b101
	rrca			;b102
	and 003h		;b103
	or c			;b105
	pop bc			;b106
	or b			;b107
	ret			;b108
teclas_de_funcion:		; A = las filas 6 y 7 de la matriz, en 6 bits
	ld a,006h		;b109
	call 00141h		;b10b   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;b10e
	and 0e0h		;b10f
	ld e,a			;b111
	ld a,007h		;b112
	call 00141h		;b114   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;b117
	ld b,a			;b118
	and 003h		;b119
	or e			;b11b
	rlca			;b11c
	rlca			;b11d
	rlca			;b11e
	ld e,a			;b11f
	ld a,b			;b120
	and 080h		;b121
	rrca			;b123
	rrca			;b124
	or e			;b125
	and 03fh		;b126
	ret			;b128
matriz_del_teclado:		; en el estado (5, 8): las filas 0-5 a 0xC7D0 y lo recien pulsado a 0xC7E0
	ld hl,(0ca00h)		;b129   ; lee el estado de la partida (p01:729F: 8 estados) y el byte siguiente (16 bits)
	ld de,00805h		;b12c
	call 00020h		;b12f   ; BIOS DCOMPR - Compares HL with DE
	ret nz			;b132
	ld hl,0c7d0h		;b133   ; apunta a las 6 primeras filas de la matriz del teclado (en el estado 5, paso 8)
	ld de,0c7e0h		;b136   ; apunta a lo recien pulsado de esas 6 filas
	ld b,006h		;b139
L_B13B:
	ld a,b			;b13b
	sub 006h		;b13c
	neg		;b13e
	call 00141h		;b140   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;b143
	ld c,(hl)			;b144
	ld (hl),a			;b145
	xor c			;b146
	and (hl)			;b147
	ld (de),a			;b148
	inc hl			;b149
	inc de			;b14a
	djnz L_B13B		;b14b
	ret			;b14d
L_B14E:
	ld a,(ix+000h)		;b14e
	dec a			;b151
	call 0424dh		;b152   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_B155: 11 destinos del despachador p00:424D (call en p06:B152, el
;   indice en A): B16B, B180, B186, B191, B19C, B1A2, B1A8, B1AE, B1B9, B1BF,
;   B1CA; lo leen p06:B152 (22 bytes)
;   0xb155..0xb16b  (22 bytes)
DATA_tabla_B155:
	defw 0b16bh,0b180h,0b186h,0b191h,0b19ch,0b1a2h,0b1a8h,0b1aeh	; b155
	defw 0b1b9h,0b1bfh,0b1cah	; b165  -> L_B1B9 L_B1BF L_B1CA

; ======================================================================
; CODIGO 0xb16b..0xb2ce  (355 bytes)
; ======================================================================


L_B16B:
	ld hl,0d7f1h		;b16b
	set 6,(hl)		;b16e
	ld hl,0d7d2h		;b170
	res 2,(hl)		;b173
	ld hl,0d7e4h		;b175
	set 7,(hl)		;b178
	ld a,003h		;b17a
	ld (0ca22h),a		;b17c   ; guarda la fase de la partida (indice de las listas de p06:B40C)
	ret			;b17f
L_B180:
	ld hl,0d7d9h		;b180
	set 3,(hl)		;b183
	ret			;b185
L_B186:
	ld hl,0d7d1h		;b186
	res 6,(hl)		;b189
	ld a,001h		;b18b
	ld (0ca22h),a		;b18d   ; guarda la fase de la partida (indice de las listas de p06:B40C)
	ret			;b190
L_B191:
	ld hl,0d7d2h		;b191
	res 7,(hl)		;b194
	ld a,002h		;b196
	ld (0ca22h),a		;b198   ; guarda la fase de la partida (indice de las listas de p06:B40C)
	ret			;b19b
L_B19C:
	ld hl,0d7d7h		;b19c
	res 0,(hl)		;b19f
	ret			;b1a1
L_B1A2:
	ld hl,0d7d3h		;b1a2
	res 3,(hl)		;b1a5
	ret			;b1a7
L_B1A8:
	ld hl,0d7d6h		;b1a8
	res 0,(hl)		;b1ab
	ret			;b1ad
L_B1AE:
	ld hl,0d7d8h		;b1ae
	set 2,(hl)		;b1b1
	ld a,009h		;b1b3
	ld (0ca22h),a		;b1b5   ; guarda la fase de la partida (indice de las listas de p06:B40C)
	ret			;b1b8
L_B1B9:
	ld hl,0d7d9h		;b1b9
	res 0,(hl)		;b1bc
	ret			;b1be
L_B1BF:
	ld hl,0d7dah		;b1bf
	set 4,(hl)		;b1c2
	ld hl,0d7dfh		;b1c4
	res 5,(hl)		;b1c7
	ret			;b1c9
L_B1CA:
	ld hl,0d7d6h		;b1ca
	res 4,(hl)		;b1cd
	ld hl,0d7e2h		;b1cf
	set 5,(hl)		;b1d2
	ld a,006h		;b1d4
	ld (0ca22h),a		;b1d6   ; guarda la fase de la partida (indice de las listas de p06:B40C)
	ret			;b1d9
L_B1DA:
	ld a,(0ca4ah)		;b1da   ; lee la zona
	cp 007h		;b1dd
	ret nz			;b1df
	ld a,(0d883h)		;b1e0
	inc a			;b1e3
	ret z			;b1e4
	ld a,(0ca76h)		;b1e5   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 029h		;b1e8
	ret z			;b1ea
	ld hl,0d860h		;b1eb
	ld a,(hl)			;b1ee
	and a			;b1ef
	ret nz			;b1f0
	ld a,(0d7d1h)		;b1f1
	and 002h		;b1f4
	ret z			;b1f6
	ld a,004h		;b1f7
	ld (0d860h),a		;b1f9
	ret			;b1fc
L_B1FD:
	ld h,000h		;b1fd
	ld l,h			;b1ff
	ld d,h			;b200
	ld e,h			;b201
	ld bc,000c0h		;b202
	ld a,004h		;b205
	call 04767h		;b207   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
	ld hl,0c0c0h		;b20a
	ld bc,04014h		;b20d
	ld d,001h		;b210
	xor a			;b212
	call 046ffh		;b213   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
	ld a,(0d501h)		;b216
	cp 002h		;b219
	ret nc			;b21b
	ld hl,0e838h		;b21c
	ld de,048b8h		;b21f
	ld b,006h		;b222
L_B224:
	push bc			;b224
	ld bc,00808h		;b225
	ld a,006h		;b228
	push hl			;b22a
	push de			;b22b
	call 04767h		;b22c   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
	pop de			;b22f
	pop hl			;b230
	ld a,d			;b231
	add a,008h		;b232
	ld d,a			;b234
	pop bc			;b235
	djnz L_B224		;b236
	ret			;b238
L_B239:
	call 045b9h		;b239   ; borra_pagina_0: la pagina 0 a cero y R#23 = 0
	ld c,0b3h		;b23c
	ld de,00000h		;b23e
	call L_B249		;b241
	ld c,0c8h		;b244
	ld de,0b800h		;b246
L_B249:
	ld b,020h		;b249
L_B24B:
	ld a,c			;b24b
	call 04a0bh		;b24c   ; pieza_de_sala_a_la_otra: el caracter A de la sala (p00:4A36) de la pagina 2 a la otra
	ld a,e			;b24f
	add a,008h		;b250
	ld e,a			;b252
	djnz L_B24B		;b253
	ret			;b255
L_B256:
	call L_B267		;b256
	ld a,l			;b259
	cp 008h		;b25a
	jr c,L_B264		;b25c
	cp 0b7h		;b25e
	ret c			;b260
	ld l,0b7h		;b261
	ret			;b263
L_B264:
	ld l,008h		;b264
	ret			;b266
L_B267:
	ld hl,0b2ceh		;b267
	call 043f6h		;b26a   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ex de,hl			;b26d
	ld bc,(0d41ch)		;b26e   ; lee la Y y la X a las que acuden los actores (16 bits)
L_B272:
	ld a,d			;b272
	and a			;b273
	jr z,L_B29B		;b274
	call L_B2C0		;b276
	push bc			;b279
	bit 7,d		;b27a
	ld b,002h		;b27c
	jr z,L_B282		;b27e
	ld b,001h		;b280
L_B282:
	and b			;b282
	pop bc			;b283
	ret nz			;b284
	ld a,h			;b285
	sub 020h		;b286
	cp 098h		;b288
	ret nc			;b28a
	ld a,e			;b28b
	rla			;b28c
	ld a,c			;b28d
	jr c,L_B294		;b28e
	cp h			;b290
	ret c			;b291
	jr L_B296		;b292
L_B294:
	cp h			;b294
	ret nc			;b295
L_B296:
	ld a,h			;b296
	add a,d			;b297
	ld h,a			;b298
	jr L_B272		;b299
L_B29B:
	call L_B2C0		;b29b
	push bc			;b29e
	bit 7,e		;b29f
	ld b,008h		;b2a1
	jr z,L_B2A7		;b2a3
	ld b,004h		;b2a5
L_B2A7:
	and b			;b2a7
	pop bc			;b2a8
	ret nz			;b2a9
	ld a,l			;b2aa
	sub 008h		;b2ab
	cp 0afh		;b2ad
	ret nc			;b2af
	ld a,e			;b2b0
	rla			;b2b1
	ld a,b			;b2b2
	jr c,L_B2B9		;b2b3
	cp l			;b2b5
	ret c			;b2b6
	jr L_B2BB		;b2b7
L_B2B9:
	cp l			;b2b9
	ret nc			;b2ba
L_B2BB:
	ld a,l			;b2bb
	add a,e			;b2bc
	ld l,a			;b2bd
	jr L_B272		;b2be
L_B2C0:
	push hl			;b2c0
	push de			;b2c1
	push bc			;b2c2
	ld a,h			;b2c3
	ld h,l			;b2c4
	ld l,a			;b2c5
	call 090ceh		;b2c6   ; choques_en_hl:
	ld a,c			;b2c9
	pop bc			;b2ca
	pop de			;b2cb
	pop hl			;b2cc
	ret			;b2cd

; ----------------------------------------------------------------------
; DATOS resto_B2CE: lo apuntan con el banco puesto p06:B267 (0xB2CE); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p06:B267 (8 bytes)
;   0xb2ce..0xb2d6  (8 bytes)
DATA_resto_B2CE:
	defb 000h,0feh,000h,002h,0feh,000h,002h,000h	; b2ce  ........

; ======================================================================
; CODIGO 0xb2d6..0xb30b  (53 bytes)
; ======================================================================


L_B2D6:
	ld hl,0d460h		;b2d6   ; apunta a 6 fichas de 16 bytes de lo que lanzan los actores (p04:9B55)
	ld bc,0005fh		;b2d9
	call 04236h		;b2dc   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	ld a,001h		;b2df
	ld (0d445h),a		;b2e1
	ld de,0d460h		;b2e4   ; apunta a 6 fichas de 16 bytes de lo que lanzan los actores (p04:9B55)
	ld hl,0b30bh		;b2e7
	ld b,006h		;b2ea
L_B2EC:
	push de			;b2ec
	push bc			;b2ed
	ld a,001h		;b2ee
	ld (de),a			;b2f0
	inc de			;b2f1
	inc de			;b2f2
	ldi		;b2f3
	ldi		;b2f5
	ldi		;b2f7
	pop bc			;b2f9
	pop de			;b2fa
	ld a,010h		;b2fb
	call 04243h		;b2fd   ; suma_a_de: DE = DE + A
	djnz L_B2EC		;b300
	ld hl,0daa0h		;b302
	ld de,0b3b0h		;b305
	jp 051e0h		;b308   ; rachas_a_ram: deshace las rachas de DE en HL (n < 0x80 repite, n > 0x80 copia, 0 acaba)

; ----------------------------------------------------------------------
; DATOS resto_B30B: lo apuntan con el banco puesto p06:B2E7 (0xB30B); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p06:B2E7 (18 bytes)
;   0xb30b..0xb31d  (18 bytes)
DATA_resto_B30B:
	defb 020h,008h,010h,038h,005h,013h,050h,00eh,008h,068h,009h,00eh,080h,00ch,005h,098h	; b30b   ..8..P..h......
	defb 00bh,00ch	; b31b

; ======================================================================
; CODIGO 0xb31d..0xb3aa  (141 bytes)
; ======================================================================


L_B31D:
	call L_B326		;b31d
	ret nc			;b320
	call L_B33B		;b321
L_B324:
	scf			;b324
	ret			;b325
L_B326:
	ld hl,0d460h		;b326   ; apunta a 6 fichas de 16 bytes de lo que lanzan los actores (p04:9B55)
	ld b,006h		;b329
L_B32B:
	ld a,(hl)			;b32b
	and a			;b32c
	jr nz,L_B324		;b32d
	ld a,010h		;b32f
	call 0423eh		;b331   ; suma_a_hl: HL = HL + A
	djnz L_B32B		;b334
	xor a			;b336
	ld (0d445h),a		;b337
	ret			;b33a
L_B33B:
	ld ix,0d460h		;b33b   ; apunta a 6 fichas de 16 bytes de lo que lanzan los actores (p04:9B55)
	ld bc,00600h		;b33f
L_B342:
	ld a,(ix+000h)		;b342
	and a			;b345
	jr z,L_B34E		;b346
	call L_B357		;b348
	call L_B37E		;b34b
L_B34E:
	ld de,00010h		;b34e
	add ix,de		;b351
	inc c			;b353
	djnz L_B342		;b354
	ret			;b356
L_B357:
	push ix		;b357
	pop hl			;b359
	ld de,0d460h		;b35a   ; apunta a 6 fichas de 16 bytes de lo que lanzan los actores (p04:9B55)
	call 00020h		;b35d   ; BIOS DCOMPR - Compares HL with DE
	jr nz,L_B36A		;b360
	ld a,(ix+004h)		;b362
	cp 004h		;b365
	call z,06c6fh		;b367   ; sonido_54: pide el sonido 0x54
L_B36A:
	dec (ix+004h)		;b36a
	jr z,L_B379		;b36d
	ld a,(ix+001h)		;b36f
	add a,(ix+003h)		;b372
	ld (ix+001h),a		;b375
	ret			;b378
L_B379:
	ld (ix+000h),000h		;b379
	ret			;b37d
L_B37E:
	ld a,c			;b37e
	add a,a			;b37f
L_B380:
	add a,a			;b380
	add a,a			;b381
	ld hl,0dc28h		;b382
	call 0423eh		;b385   ; suma_a_hl: HL = HL + A
	ld d,h			;b388
	ld a,l			;b389
	add a,004h		;b38a
	ld e,a			;b38c
	ld a,(ix+001h)		;b38d
	ld (hl),a			;b390
	ld (de),a			;b391
	inc hl			;b392
	inc de			;b393
	ld a,(ix+002h)		;b394
	ld (hl),a			;b397
	ld (de),a			;b398
	inc hl			;b399
	inc de			;b39a
	ld a,c			;b39b
	push hl			;b39c
	ld hl,0b3aah		;b39d
	call 0423eh		;b3a0   ; suma_a_hl: HL = HL + A
	ld a,(hl)			;b3a3
	pop hl			;b3a4
	ld (hl),a			;b3a5
	add a,004h		;b3a6
	ld (de),a			;b3a8
	ret			;b3a9

; ----------------------------------------------------------------------
; DATOS resto_B3AA: lo apuntan con el banco puesto p06:B39D (0xB3AA), p06:B305
;   (0xB3B0); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p06:B39D, p06:B305 (31 bytes)
;   0xb3aa..0xb3c9  (31 bytes)
DATA_resto_B3AA:
	defb 040h,050h,060h,058h,048h,040h,010h,007h,010h,048h,010h,007h,010h,048h,010h,007h	; b3aa  @P`XH@...H...H..
	defb 010h,048h,010h,007h,010h,048h,010h,007h,010h,048h,010h,007h,010h,048h,000h	; b3ba  .H...H...H...H.

; ======================================================================
; CODIGO 0xb3c9..0xb3ec  (35 bytes)
; ======================================================================


L_B3C9:
	ld a,(0ca76h)		;b3c9   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 02ah		;b3cc
	ret nz			;b3ce
	ld a,(0ca51h)		;b3cf   ; lee la columna de la sala en la zona (uno mas al salir por la derecha)
	cp 008h		;b3d2
	ret nz			;b3d4
	ld de,0d8c0h		;b3d5
	ld hl,0b3ech		;b3d8
	ld bc,00018h		;b3db
	ldir		;b3de
	ld de,0dcb8h		;b3e0
	ld hl,0b404h		;b3e3
	ld bc,00008h		;b3e6
	ldir		;b3e9
	ret			;b3eb

; ----------------------------------------------------------------------
; DATOS resto_B3EC: lo apuntan con el banco puesto p06:B3D8 (0xB3EC), p06:B3E3
;   (0xB404), p01:7D1C (0xB40C); el tamano es lo que hay hasta lo siguiente,
;   no sale de recorrerlo; lo leen p06:B3D8, p06:B3E3, p01:7D1C (326 bytes)
;   0xb3ec..0xb532  (326 bytes)
DATA_resto_B3EC:
	defb 000h,00eh,008h,002h,000h,000h,000h,060h,029h,010h,000h,001h,001h,001h,000h,048h	; b3ec  .......`)......H
	defb 040h,000h,001h,000h,000h,000h,000h,000h,008h,000h,007h,001h,001h,001h,001h,000h	; b3fc  @...............
	defb 022h,0b4h,049h,0b4h,05bh,0b4h,06eh,0b4h,089h,0b4h,0a6h,0b4h,0c2h,0b4h,0dbh,0b4h	; b40c  ".I.[.n.........
	defb 0f8h,0b4h,013h,0b5h,037h,0b4h,000h,0feh,01eh,06bh,001h,0feh,041h,06bh,002h,005h	; b41c  ....7....k..Ak..
	defb 0feh,091h,06bh,003h,004h,0feh,03dh,06bh,0ffh,026h,06bh,000h,001h,0feh,041h,06bh	; b42c  ..k...=k.&k...Ak
	defb 002h,005h,0feh,091h,06bh,003h,004h,0feh,03dh,06bh,0ffh,026h,06bh,000h,001h,003h	; b43c  ....k...=k.&k...
	defb 004h,0feh,039h,06bh,002h,0feh,091h,06bh,006h,0feh,026h,06bh,0ffh,03dh,06bh,000h	; b44c  ..9k...k..&k.=k.
	defb 0feh,039h,06bh,001h,002h,003h,004h,005h,0feh,03dh,06bh,006h,0feh,026h,06bh,0ffh	; b45c  .9k......=k..&k.
	defb 041h,06bh,000h,001h,002h,003h,004h,005h,0feh,039h,06bh,006h,0feh,026h,06bh,008h	; b46c  Ak.......9k..&k.
	defb 00ch,0feh,03dh,06bh,007h,009h,00ah,0feh,041h,06bh,0ffh,02ah,06bh,000h,001h,002h	; b47c  ..=k....Ak.*k...
	defb 005h,0feh,039h,06bh,003h,004h,0feh,035h,06bh,006h,0feh,026h,06bh,007h,009h,0feh	; b48c  ..9k...5k..&k...
	defb 041h,06bh,008h,00ah,0feh,081h,06bh,0ffh,039h,06bh,000h,002h,003h,004h,005h,0feh	; b49c  Ak....k.9k......
	defb 039h,06bh,001h,0feh,01eh,06bh,006h,0feh,026h,06bh,008h,0feh,03dh,06bh,007h,009h	; b4ac  9k...k..&k..=k..
	defb 0feh,041h,06bh,0ffh,035h,06bh,000h,002h,003h,004h,005h,0feh,039h,06bh,006h,0feh	; b4bc  .Ak.5k......9k..
	defb 026h,06bh,008h,0feh,03dh,06bh,001h,007h,009h,0feh,041h,06bh,0ffh,02ah,06bh,000h	; b4cc  &k..=k....Ak.*k.
	defb 001h,002h,003h,004h,005h,0feh,039h,06bh,006h,0feh,026h,06bh,007h,009h,0feh,041h	; b4dc  ......9k..&k...A
	defb 06bh,008h,0feh,085h,06bh,013h,0feh,026h,06bh,0ffh,02ah,06bh,000h,001h,002h,003h	; b4ec  k...k..&k.*k....
	defb 004h,005h,0feh,01eh,06bh,006h,0feh,026h,06bh,008h,0feh,039h,06bh,007h,009h,00ah	; b4fc  ....k..&k..9k...
	defb 013h,0feh,041h,06bh,0ffh,02ah,06bh,000h,001h,002h,003h,005h,0feh,039h,06bh,006h	; b50c  ..Ak.*k......9k.
	defb 0feh,026h,06bh,008h,0feh,03dh,06bh,004h,007h,009h,00ah,012h,0feh,041h,06bh,013h	; b51c  .&k..=k......Ak.
	defb 0feh,02ah,06bh,0ffh,035h,06bh	; b52c

; ======================================================================
; CODIGO 0xb532..0xb552  (32 bytes)
; ======================================================================


L_B532:
	ld a,(0ca5fh)		;b532   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	and a			;b535
	jr z,L_B54F		;b536
	ld b,004h		;b538
	ld de,0b552h		;b53a
L_B53D:
	ld h,d			;b53d
	ld l,e			;b53e
	ld a,(0ca4ah)		;b53f   ; lee la zona
	cp (hl)			;b542
	jr nz,L_B54B		;b543
	inc hl			;b545
	ld a,(0ca4bh)		;b546   ; lee la sala de la zona
	cp (hl)			;b549
	ret z			;b54a
L_B54B:
	inc de			;b54b
	inc de			;b54c
	djnz L_B53D		;b54d
L_B54F:
	or 001h		;b54f
	ret			;b551

; ----------------------------------------------------------------------
; DATOS resto_B552: lo apuntan con el banco puesto p06:B53A (0xB552); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p06:B53A (8 bytes)
;   0xb552..0xb55a  (8 bytes)
DATA_resto_B552:
	defb 004h,005h,007h,008h,00ah,00bh,00ch,007h	; b552  ........

; ======================================================================
; CODIGO 0xb55a..0xb65b  (257 bytes)
; ======================================================================


L_B55A:
	push ix		;b55a
	ld ix,0ce00h		;b55c   ; apunta a los actores: 24 fichas de 0x40 bytes (p04:800D)
	ld b,018h		;b560
L_B562:
	ld a,(ix+000h)		;b562   ; lee el tipo del actor (0 = libre)
	and a			;b565
	jr z,L_B587		;b566
	cp 010h		;b568
	jr nc,L_B587		;b56a
	rla			;b56c
	jr c,L_B587		;b56d
	call 0806fh		;b56f   ; p02:806F
	jr c,L_B587		;b572
L_B574:
	ld a,(ix+000h)		;b574   ; lee el tipo del actor (0 = libre)
	cp 00ah		;b577
	jr nz,L_B581		;b579
	ld a,(ix+001h)		;b57b   ; lee el paso del actor
	and a			;b57e
	jr z,L_B587		;b57f
L_B581:
	call 08100h		;b581   ; p02:8100
	scf			;b584
	jr z,L_B58F		;b585
L_B587:
	ld de,00040h		;b587
	add ix,de		;b58a
	djnz L_B562		;b58c
	or a			;b58e
L_B58F:
	pop ix		;b58f
	ret			;b591
L_B592:
	ld c,a			;b592
	ld a,(0ca5fh)		;b593   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	ld de,0b68bh		;b596
	dec a			;b599
	jr z,L_B5D9		;b59a
	ld de,0b69bh		;b59c
	dec a			;b59f
	jr z,L_B5D9		;b5a0
	dec a			;b5a2
	jr z,L_B5D9		;b5a3
	ld a,(ix+019h)		;b5a5
	ld b,a			;b5a8
	cp 003h		;b5a9
	jr c,L_B5CF		;b5ab
	ld a,(ix+000h)		;b5ad
	cp 003h		;b5b0
	jr z,L_B5CE		;b5b2
	xor a			;b5b4
	ld (ix+006h),a		;b5b5
	ld (ix+007h),a		;b5b8
	ld (ix+008h),a		;b5bb
	ld (ix+009h),a		;b5be
	ld a,(0ca4ah)		;b5c1   ; lee la zona
	cp 00ch		;b5c4
	ld c,001h		;b5c6
	jr nz,L_B5DC		;b5c8
	ld c,003h		;b5ca
	jr L_B5DC		;b5cc
L_B5CE:
	ld a,b			;b5ce
L_B5CF:
	add a,a			;b5cf
	add a,a			;b5d0
	add a,a			;b5d1
	add a,a			;b5d2
	ld de,0b65bh		;b5d3
	call 04243h		;b5d6   ; suma_a_de: DE = DE + A
L_B5D9:
	call 08e40h		;b5d9   ; velocidad_de_tabla: las dos velocidades del actor de la tabla DE (4 bytes por direccion C) y el byte 0x0C (1 vertical, 2 horizontal)
L_B5DC:
	ld a,c			;b5dc
	add a,a			;b5dd
	ld (ix+00dh),a		;b5de
	ret			;b5e1
L_B5E2:
	ld a,(ix+00dh)		;b5e2
	ld hl,0b6bbh		;b5e5
	call 04248h		;b5e8   ; byte_de_tabla: A = el byte A de la tabla de HL (y HL apunta a el)
	inc a			;b5eb
	cp 00ch		;b5ec
	jr c,L_B5F1		;b5ee
	xor a			;b5f0
L_B5F1:
	ld hl,0b6cbh		;b5f1
	call 04248h		;b5f4   ; byte_de_tabla: A = el byte A de la tabla de HL (y HL apunta a el)
	ld (ix+00dh),a		;b5f7
	ret			;b5fa
L_B5FB:
	ld a,(ix+001h)		;b5fb
	ld c,a			;b5fe
	sub 008h		;b5ff
	cp 002h		;b601
	ret c			;b603
	ld (ix+020h),c		;b604
	ld (ix+001h),008h		;b607
	ld a,03ch		;b60b
	ld (ix+01ch),a		;b60d
	ld a,(ix+00ch)		;b610
	ld (ix+022h),a		;b613
	ld a,(ix+00dh)		;b616
	and 007h		;b619
	ld (ix+015h),a		;b61b
	ld (ix+00dh),a		;b61e
	ld (ix+00ch),000h		;b621
	ret			;b625
L_B626:
	dec (ix+01ch)		;b626
	jr z,L_B64B		;b629
	ld a,(ix+000h)		;b62b
	cp 00bh		;b62e
	ret z			;b630
	ld a,(ix+01ch)		;b631
	rra			;b634
	ld b,000h		;b635
	jr nc,L_B63F		;b637
	rra			;b639
	ld b,008h		;b63a
	jr c,L_B63F		;b63c
	inc b			;b63e
L_B63F:
	ld a,(ix+015h)		;b63f
	and 006h		;b642
	add a,b			;b644
	ld (ix+00dh),a		;b645
	or 001h		;b648
	ret			;b64a
L_B64B:
	ld a,(0ca5fh)		;b64b   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	cp 002h		;b64e
	jp nc,08ef2h		;b650
	ld (ix+00eh),048h		;b653
	inc (ix+001h)		;b657
	ret			;b65a

; ----------------------------------------------------------------------
; DATOS resto_B65B: lo apuntan con el banco puesto p06:B5D3 (0xB65B), p06:B596
;   (0xB68B), p06:B59C (0xB69B), p06:B5E5 (0xB6BB), p06:B5F1 (0xB6CB),
;   p02:8FEC (0xB6D7); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p06:B5D3, p06:B596, p06:B59C, p06:B5E5, p06:B5F1,
;   p02:8FEC (2469 bytes)
;   0xb65b..0xc000  (2469 bytes)
DATA_resto_B65B:
	defb 080h,0feh,000h,000h,080h,001h,000h,000h,000h,000h,080h,0feh,000h,000h,080h,001h	; b65b  ................
	defb 040h,0feh,000h,000h,0c0h,001h,000h,000h,000h,000h,040h,0feh,000h,000h,0c0h,001h	; b66b  @.........@.....
	defb 0c0h,0fdh,000h,000h,040h,002h,000h,000h,000h,000h,0c0h,0fdh,000h,000h,040h,002h	; b67b  ....@.........@.
	defb 040h,0fdh,000h,000h,0c0h,002h,000h,000h,000h,000h,040h,0fdh,000h,000h,0c0h,002h	; b68b  @.........@.....
	defb 080h,0fch,000h,000h,080h,003h,000h,000h,000h,000h,080h,0fch,000h,000h,080h,003h	; b69b  ................
	defb 040h,0fbh,000h,000h,0c0h,004h,000h,000h,000h,000h,040h,0fbh,000h,000h,0c0h,004h	; b6ab  @.........@.....
	defb 000h,000h,006h,006h,009h,009h,003h,003h,00fh,001h,005h,007h,008h,00ah,002h,004h	; b6bb  ................
	defb 000h,009h,00eh,006h,00fh,00ah,002h,00bh,00ch,004h,00dh,008h,0a1h,0b7h,0a4h,0b7h	; b6cb  ................
	defb 0a7h,0b7h,0ach,0b7h,0b8h,0b7h,0b9h,0b7h,0beh,0b7h,0c1h,0b7h,0c4h,0b7h,0c7h,0b7h	; b6db  ................
	defb 0cah,0b7h,0d9h,0b7h,0deh,0b7h,0dfh,0b7h,0e1h,0b7h,0e1h,0b7h,0e1h,0b7h,0e2h,0b7h	; b6eb  ................
	defb 0e5h,0b7h,0f1h,0b7h,000h,0b9h,005h,0b9h,00ah,0b9h,013h,0b9h,018h,0b9h,01dh,0b9h	; b6fb  ................
	defb 02ah,0b9h,033h,0b9h,040h,0b9h,049h,0b9h,052h,0b9h,063h,0b9h,070h,0b9h,075h,0b9h	; b70b  *.3.@.I.R.c.p.u.
	defb 07ah,0b9h,07bh,0b9h,081h,0b9h,091h,0b9h,097h,0b9h,0a2h,0b9h,0a8h,0b9h,0adh,0b9h	; b71b  z.{.............
	defb 0aeh,0b9h,0b4h,0b9h,0b9h,0b9h,0bah,0b9h,0c0h,0b9h,0c5h,0b9h,0c5h,0b9h,0c6h,0b9h	; b72b  ................
	defb 0d1h,0b9h,0d6h,0b9h,0d6h,0b9h,0d6h,0b9h,0d6h,0b9h,0d7h,0b9h,0ddh,0b9h,0e3h,0b9h	; b73b  ................
	defb 0eeh,0b9h,0feh,0b9h,004h,0bah,00fh,0bah,01ah,0bah,025h,0bah,035h,0bah,040h,0bah	; b74b  ..........%.5.@.
	defb 046h,0bah,04ch,0bah,05ch,0bah,062h,0bah,06dh,0bah,06eh,0bah,079h,0bah,084h,0bah	; b75b  F.L.\.b.m.n.y...
	defb 085h,0bah,085h,0bah,086h,0bah,096h,0bah,096h,0bah,096h,0bah,096h,0bah,097h,0bah	; b76b  ................
	defb 0a2h,0bah,0a3h,0bah,0b3h,0bah,0c3h,0bah,0d3h,0bah,0d3h,0bah,0d4h,0bah,0fdh,0bah	; b77b  ................
	defb 002h,0bbh,002h,0bbh,002h,0bbh,002h,0bbh,002h,0bbh,002h,0bbh,002h,0bbh,002h,0bbh	; b78b  ................
	defb 002h,0bbh,002h,0bbh,002h,0bbh,00ah,012h,0ffh,004h,015h,0ffh,000h,016h,008h,024h	; b79b  ...............$
	defb 0ffh,000h,01eh,005h,000h,00eh,001h,010h,002h,011h,003h,012h,004h,0ffh,000h,013h	; b7ab  ................
	defb 003h,014h,0ffh,021h,008h,0ffh,013h,020h,0ffh,001h,009h,0ffh,004h,005h,0ffh,00ch	; b7bb  ...!... ........
	defb 007h,011h,006h,008h,00ah,018h,00fh,016h,010h,010h,017h,00bh,018h,0ffh,003h,01ch	; b7cb  ................
	defb 005h,01bh,0ffh,0ffh,005h,01dh,0ffh,000h,023h,0ffh,000h,00ch,004h,00dh,007h,021h	; b7db  ........#......!
	defb 009h,00eh,00bh,022h,011h,019h,0ffh,03ch,0b8h,041h,0b8h,046h,0b8h,04bh,0b8h,050h	; b7eb  ..."...<.A.F.K.P
	defb 0b8h,055h,0b8h,05ah,0b8h,05fh,0b8h,064h,0b8h,069h,0b8h,06eh,0b8h,077h,0b8h,078h	; b7fb  .U.Z._.d.i.n.w.x
	defb 0b8h,089h,0b8h,096h,0b8h,09bh,0b8h,0a0h,0b8h,0a5h,0b8h,0a5h,0b8h,0aah,0b8h,0afh	; b80b  ................
	defb 0b8h,0b4h,0b8h,0b9h,0b8h,0beh,0b8h,0c3h,0b8h,0c8h,0b8h,0cdh,0b8h,0ceh,0b8h,0d3h	; b81b  ................
	defb 0b8h,0d8h,0b8h,0ddh,0b8h,0e2h,0b8h,0e7h,0b8h,0ech,0b8h,0f1h,0b8h,0f6h,0b8h,0fbh	; b82b  ................
	defb 0b8h,071h,000h,0b0h,068h,0ffh,00bh,007h,063h,029h,0ffh,091h,002h,030h,030h,0ffh	; b83b  .q..h...c)...00.
	defb 00bh,008h,053h,029h,0ffh,06eh,001h,028h,028h,0ffh,02fh,000h,080h,08ah,0ffh,0eah	; b84b  ..S).n.((./.....
	defb 008h,050h,0a2h,0ffh,071h,000h,0b0h,0a2h,0ffh,02eh,000h,02eh,02eh,0ffh,031h,000h	; b85b  .P..q.........1.
	defb 028h,08eh,0ffh,06fh,001h,040h,03eh,047h,002h,040h,080h,0ffh,0ffh,06fh,000h,050h	; b86b  (..o.@>G.@...o.P
	defb 02ah,02fh,001h,060h,088h,031h,002h,080h,078h,031h,003h,08eh,058h,0ffh,003h,004h	; b87b  */.`.1..x1..X...
	defb 080h,080h,003h,005h,040h,070h,003h,008h,058h,070h,0ffh,02eh,006h,024h,026h,0ffh	; b88b  ....@p..Xp...$&.
	defb 02eh,003h,04eh,08eh,0ffh,02eh,004h,020h,01ch,0ffh,031h,000h,084h,02eh,0ffh,031h	; b89b  ..N.... ..1....1
	defb 000h,0a8h,010h,0ffh,031h,001h,02eh,010h,0ffh,031h,001h,0a8h,0a4h,0ffh,031h,000h	; b8ab  ....1....1....1.
	defb 07eh,02ch,0ffh,071h,005h,088h,040h,0ffh,043h,006h,090h,014h,0ffh,02eh,007h,02ah	; b8bb  ~,.q..@.C......*
	defb 048h,0ffh,0ffh,06fh,000h,06ah,058h,0ffh,070h,001h,088h,0a6h,0ffh,02fh,003h,0a0h	; b8cb  H..o.jX.p..../..
	defb 010h,0ffh,06eh,006h,056h,082h,0ffh,048h,002h,06fh,052h,0ffh,071h,003h,07eh,08ah	; b8db  ..n.V..H.oR.q.~.
	defb 0ffh,02eh,009h,080h,090h,0ffh,02eh,00ah,036h,044h,0ffh,02eh,000h,090h,050h,0ffh	; b8eb  ........6D....P.
	defb 02fh,001h,030h,080h,0ffh,02eh,001h,050h,058h,0ffh,081h,000h,050h,050h,0ffh,031h	; b8fb  /.0....PX...PP.1
	defb 000h,050h,04ah,031h,001h,080h,070h,0ffh,02eh,004h,050h,058h,0ffh,098h,013h,050h	; b90b  .PJ1..p...PX...P
	defb 058h,0ffh,008h,00ah,050h,046h,008h,00bh,070h,05ah,008h,00ch,050h,076h,0ffh,006h	; b91b  X...PF..pZ..Pv..
	defb 00dh,050h,054h,00ah,00eh,050h,074h,0ffh,031h,00fh,050h,054h,031h,010h,050h,074h	; b92b  .PT..Pt.1.PT1.Pt
	defb 031h,011h,068h,060h,0ffh,003h,012h,050h,046h,003h,013h,070h,05ah,0ffh,007h,014h	; b93b  1.h`...PF..pZ...
	defb 050h,046h,02eh,015h,070h,05ah,0ffh,031h,016h,050h,046h,031h,017h,070h,05ah,031h	; b94b  PF..pZ.1.PF1.pZ1
	defb 01bh,060h,050h,031h,01ch,080h,06ah,0ffh,003h,018h,050h,046h,00ah,019h,070h,05ah	; b95b  .`P1..j...PF..pZ
	defb 02eh,01dh,080h,070h,0ffh,030h,01ah,050h,05eh,0ffh,017h,085h,009h,058h,058h,0ffh	; b96b  ...p.0.P^....XX.
	defb 017h,097h,00ah,058h,058h,0ffh,016h,0a0h,00bh,058h,058h,017h,09fh,00ch,058h,058h	; b97b  ...XX....XX...XX
	defb 018h,0a1h,00dh,058h,058h,0ffh,017h,08eh,007h,058h,058h,0ffh,017h,0a2h,006h,058h	; b98b  ...XX....XX....X
	defb 058h,027h,090h,003h,058h,058h,0ffh,017h,008h,002h,058h,058h,0ffh,017h,006h,003h	; b99b  X'..XX....XX....
	defb 058h,058h,0ffh,017h,030h,004h,058h,058h,0ffh,017h,00ah,005h,058h,058h,0ffh,017h	; b9ab  XX..0.XX....XX..
	defb 092h,004h,068h,058h,0ffh,017h,096h,00eh,068h,058h,0ffh,017h,02fh,000h,04eh,050h	; b9bb  ..hX....hX../.NP
	defb 017h,030h,001h,06ah,068h,0ffh,017h,09ah,00fh,048h,058h,0ffh,017h,09bh,010h,068h	; b9cb  .0.jh....HX....h
	defb 058h,0ffh,017h,099h,005h,08eh,00ch,0ffh,017h,007h,002h,050h,058h,017h,007h,003h	; b9db  X..........PX...
	defb 070h,040h,0ffh,017h,031h,004h,050h,058h,017h,031h,005h,070h,040h,017h,031h,006h	; b9eb  p@..1.PX.1.p@.1.
	defb 070h,080h,0ffh,017h,082h,011h,050h,050h,0ffh,017h,003h,007h,063h,036h,017h,003h	; b9fb  p.....PP....c6..
	defb 008h,054h,080h,0ffh,017h,00bh,009h,050h,058h,017h,095h,01fh,074h,078h,0ffh,017h	; ba0b  .T.....PX...tx..
	defb 006h,00ah,050h,058h,017h,006h,00bh,070h,078h,0ffh,017h,031h,00ch,046h,040h,017h	; ba1b  ..PX...px..1.F@.
	defb 005h,00dh,05ah,060h,017h,031h,00eh,046h,080h,0ffh,017h,00ah,00fh,060h,050h,017h	; ba2b  ..Z`.1.F.....`P.
	defb 00ah,010h,080h,040h,0ffh,017h,009h,011h,064h,054h,0ffh,017h,081h,000h,060h,054h	; ba3b  ...@....dT....`T
	defb 0ffh,017h,031h,012h,070h,034h,017h,031h,013h,070h,074h,017h,031h,014h,080h,058h	; ba4b  ..1.p4.1.pt.1..X
	defb 0ffh,017h,093h,012h,040h,058h,0ffh,017h,003h,015h,054h,044h,017h,003h,016h,060h	; ba5b  ....@X....TD...`
	defb 076h,0ffh,0ffh,017h,007h,001h,060h,044h,017h,007h,002h,07ah,080h,0ffh,017h,031h	; ba6b  v.....`D...z...1
	defb 003h,064h,044h,017h,031h,004h,064h,070h,0ffh,0ffh,0ffh,017h,031h,007h,044h,040h	; ba7b  .dD.1.dp....1.D@
	defb 017h,003h,008h,060h,060h,017h,007h,009h,080h,080h,0ffh,0ffh,026h,09dh,014h,070h	; ba8b  ...``.......&..p
	defb 05ch,028h,09ch,015h,070h,05ch,0ffh,0ffh,017h,003h,000h,064h,044h,017h,003h,001h	; ba9b  \(..p\.....dD...
	defb 064h,070h,017h,003h,005h,078h,048h,0ffh,017h,02fh,002h,080h,040h,017h,007h,003h	; baab  dp...xH../..@...
	defb 054h,044h,017h,031h,004h,064h,080h,0ffh,017h,031h,000h,060h,038h,017h,031h,001h	; babb  TD.1.d...1.`8.1.
	defb 064h,080h,017h,031h,002h,054h,058h,0ffh,0ffh,017h,0e4h,017h,020h,046h,017h,0a7h	; bacb  d..1.TX..... F..
	defb 018h,034h,08ch,017h,0abh,019h,084h,038h,017h,0a2h,01ah,090h,080h,018h,0a6h,01bh	; badb  .4.....8........
	defb 040h,040h,018h,0a3h,01ch,040h,06ch,018h,0a5h,01dh,084h,020h,018h,08ch,01eh,084h	; baeb  @@...@l.... ....
	defb 09eh,0ffh,027h,0adh,016h,030h,05eh,0ffh,051h,031h,000h,078h,08ch,051h,031h,001h	; bafb  ..'..0^.Q1.x.Q1.
	defb 070h,068h,080h,031h,002h,078h,048h,0ffh,03dh,0bbh,045h,0bbh,045h,0bbh,045h,0bbh	; bb0b  ph.1.xH.=.E.E.E.
	defb 045h,0bbh,045h,0bbh,045h,0bbh,046h,0bbh,04eh,0bbh,04fh,0bbh,054h,0bbh,075h,0bbh	; bb1b  E.E.E.F.N.O.T.u.
	defb 075h,0bbh,075h,0bbh,075h,0bbh,075h,0bbh,075h,0bbh,075h,0bbh,075h,0bbh,075h,0bbh	; bb2b  u.u.u.u.u.u.u.u.
	defb 075h,0bbh,003h,001h,078h,048h,009h,002h,098h,0a0h,0ffh,00eh,003h,068h,018h,00eh	; bb3b  u...xH.......h..
	defb 004h,020h,098h,0ffh,002h,005h,0a8h,048h,0ffh,000h,006h,088h,028h,001h,007h,050h	; bb4b  . .....H....(..P
	defb 028h,001h,008h,050h,048h,001h,009h,050h,068h,001h,00ah,050h,088h,008h,00bh,068h	; bb5b  (..PH..Ph..P...h
	defb 038h,008h,00ch,068h,078h,00ah,00dh,088h,068h,0ffh,0ffh,000h,000h,08ch,017h,091h	; bb6b  8..hx...h.......
	defb 002h,000h,08ch,0c0h,017h,0c0h,004h,000h,077h,08ch,091h,0c0h,004h,001h,077h,0c0h	; bb7b  ........w.....w.
	defb 000h,0c0h,004h,002h,077h,0c0h,000h,0c0h,004h,003h,082h,0c0h,000h,0c0h,004h,003h	; bb8b  ....w...........
	defb 077h,082h,000h,030h,004h,003h,000h,082h,030h,031h,001h,003h,077h,082h,031h,070h	; bb9b  w..0....01..w.1p
	defb 004h,003h,000h,082h,070h,071h,001h,003h,077h,082h,071h,0c0h,004h,004h,000h,077h	; bbab  ....pq..w.q....w
	defb 000h,0c0h,001h,004h,077h,0c0h,000h,05fh,004h,004h,077h,0c0h,05fh,0c0h,001h,005h	; bbbb  ....w.._..w._...
	defb 000h,0c0h,000h,0c0h,002h,008h,000h,0c0h,028h,072h,001h,009h,000h,0c0h,000h,0c0h	; bbcb  ........(r......
	defb 001h,00ah,000h,0c0h,000h,0c0h,002h,00dh,060h,0c0h,030h,031h,001h,00dh,057h,060h	; bbdb  ........`.01..W`
	defb 030h,0c0h,004h,00dh,0a0h,0c0h,070h,071h,001h,00dh,097h,0a0h,070h,0c0h,004h,00eh	; bbeb  0.....pq....p...
	defb 057h,060h,000h,03bh,004h,00eh,097h,0a0h,000h,03bh,004h,00eh,000h,057h,000h,03bh	; bbfb  W`...........W..
	defb 001h,00eh,060h,097h,000h,03bh,001h,00eh,0a0h,0c0h,000h,03bh,001h,00eh,000h,0c0h	; bc0b  ..`.............
	defb 03bh,0c0h,001h,00fh,000h,0c0h,000h,0c0h,002h,011h,000h,0c0h,000h,0c0h,001h,012h	; bc1b  ................
	defb 000h,0c0h,000h,0c0h,002h,013h,000h,0c0h,000h,0c0h,001h,014h,000h,0c0h,000h,0c0h	; bc2b  ................
	defb 002h,015h,000h,0c0h,000h,0c0h,001h,016h,000h,0c0h,000h,0c0h,002h,017h,000h,0c0h	; bc3b  ................
	defb 000h,0c0h,001h,018h,000h,0c0h,000h,0c0h,002h,019h,000h,0c0h,000h,0c0h,001h,01ah	; bc4b  ................
	defb 000h,0c0h,000h,0c0h,002h,01bh,000h,0c0h,000h,0c0h,001h,01ch,000h,077h,050h,051h	; bc5b  .............wPQ
	defb 002h,01ch,077h,080h,050h,0c0h,003h,01ch,080h,0c0h,000h,051h,002h,01ch,047h,0c0h	; bc6b  ..w.P......Q..G.
	defb 000h,050h,002h,01ch,0a7h,0c0h,051h,0c0h,003h,01dh,077h,0c0h,0b4h,0c0h,003h,01dh	; bc7b  .P....Q...w.....
	defb 077h,080h,000h,0b4h,003h,01dh,0a7h,0c0h,000h,0b4h,003h,01dh,080h,096h,0b0h,0b4h	; bc8b  w...............
	defb 001h,01dh,096h,0a8h,0b0h,0b4h,002h,01eh,077h,0c0h,000h,071h,003h,01eh,0a7h,0c0h	; bc9b  ........w..q....
	defb 071h,0c0h,003h,01eh,077h,080h,071h,0c0h,003h,01eh,057h,078h,091h,0c0h,003h,01eh	; bcab  q...w.q...Wx....
	defb 063h,078h,090h,091h,002h,01eh,000h,063h,090h,091h,001h,01fh,057h,0c0h,074h,0c0h	; bcbb  cx.....c....W.t.
	defb 003h,01fh,057h,060h,000h,074h,003h,01fh,060h,080h,000h,031h,003h,01fh,0a7h,0c0h	; bccb  ..W`.t..`..1....
	defb 000h,074h,003h,01fh,060h,084h,070h,074h,001h,01fh,084h,0a7h,070h,074h,002h,020h	; bcdb  .t..`.pt....pt.
	defb 084h,0c0h,030h,0c0h,001h,020h,057h,084h,000h,0c0h,003h,020h,057h,0c0h,000h,030h	; bceb  ..0.. W.... W..0
	defb 003h,021h,037h,040h,051h,0c0h,003h,021h,037h,0c0h,050h,051h,002h,022h,037h,040h	; bcfb  .!7@Q..!7.PQ."7@
	defb 000h,0c0h,003h,023h,037h,040h,000h,091h,003h,023h,040h,0c0h,090h,091h,001h,0ffh	; bd0b  ...#7@...#@.....
	defb 027h,0bdh,027h,0bdh,039h,0bdh,047h,0bdh,05dh,0bdh,06fh,0bdh,004h,004h,041h,042h	; bd1b  '.'.9.G.].o...AB
	defb 043h,044h,045h,040h,040h,046h,045h,040h,040h,046h,000h,047h,048h,000h,003h,004h	; bd2b  CDE@@FE@@F.GH...
	defb 041h,042h,043h,044h,045h,040h,040h,046h,000h,047h,048h,000h,004h,005h,049h,04ah	; bd3b  ABCDE@@F.GH...IJ
	defb 04ah,04bh,04ch,045h,040h,040h,040h,046h,045h,040h,040h,040h,046h,000h,047h,040h	; bd4b  JKLE@@@FE@@@F.G@
	defb 048h,000h,004h,004h,049h,04ah,04bh,04ch,045h,040h,040h,046h,045h,040h,040h,046h	; bd5b  H...IJKLE@@FE@@F
	defb 000h,047h,048h,000h,003h,004h,049h,04ah,04bh,04ch,045h,040h,040h,046h,000h,047h	; bd6b  .GH...IJKLE@@F.G
	defb 048h,000h,005h,043h,060h,080h,007h,024h,020h,080h,007h,015h,080h,060h,009h,026h	; bd7b  H..C`..$ ....`.&
	defb 060h,060h,0ffh,004h,030h,020h,090h,004h,041h,040h,040h,004h,052h,0a0h,040h,0ffh	; bd8b  ``..0 ..A@@.R.@.
	defb 001h,027h,030h,020h,001h,028h,090h,080h,0ffh,00ah,005h,076h,08ah,01eh,042h,003h	; bd9b  .'0 .(.....v..B.
	defb 06bh,050h,009h,002h,057h,060h,06eh,092h,000h,040h,024h,001h,016h,08eh,0abh,05eh	; bdab  kP..W`n..@$....^
	defb 082h,001h,082h,06ch,032h,000h,06eh,09bh,05eh,082h,002h,063h,044h,00ah,009h,034h	; bdbb  ...l2.n.^..cD..4
	defb 04fh,07eh,0a2h,004h,01fh,031h,0ffh,0ech,0bdh,0fch,0bdh,00ch,0beh,00ch,0beh,03ch	; bdcb  O~...1.........<
	defb 0beh,02ch,0beh,04ch,0beh,05ch,0beh,09ch,0beh,01ch,0beh,06ch,0beh,09ch,0beh,07ch	; bddb  .,.L.\.....l...|
	defb 0beh,060h,000h,090h,000h,020h,001h,050h,001h,000h,002h,050h,002h,000h,003h,000h	; bdeb  .`... .P...P....
	defb 004h,000h,001h,050h,001h,000h,002h,050h,002h,000h,003h,000h,004h,000h,005h,000h	; bdfb  ...P...P........
	defb 006h,020h,000h,020h,000h,030h,000h,040h,000h,050h,000h,060h,000h,060h,000h,060h	; be0b  . . .0.@.P.`.`.`
	defb 000h,003h,000h,003h,000h,006h,000h,009h,000h,012h,000h,015h,000h,020h,000h,030h	; be1b  ............. .0
	defb 000h,005h,000h,010h,000h,015h,000h,020h,000h,025h,000h,030h,000h,035h,000h,040h	; be2b  ....... .%.0.5.@
	defb 000h,006h,000h,006h,000h,006h,000h,006h,000h,008h,000h,008h,000h,008h,000h,008h	; be3b  ................
	defb 000h,005h,000h,010h,000h,015h,000h,020h,000h,025h,000h,030h,000h,035h,000h,040h	; be4b  ....... .%.0.5.@
	defb 000h,010h,000h,015h,000h,020h,000h,025h,000h,030h,000h,035h,000h,040h,000h,045h	; be5b  ..... .%.0.5.@.E
	defb 000h,010h,000h,010h,000h,015h,000h,020h,000h,025h,000h,030h,000h,035h,000h,040h	; be6b  ....... .%.0.5.@
	defb 000h,000h,000h,000h,000h,005h,000h,010h,000h,015h,000h,020h,000h,025h,000h,030h	; be7b  ........... .%.0
	defb 000h,001h,000h,001h,000h,002h,000h,002h,000h,003h,000h,003h,000h,004h,000h,004h	; be8b  ................
	defb 000h,001h,000h,001h,000h,001h,000h,001h,000h,001h,000h,001h,000h,001h,000h,001h	; be9b  ................
	defb 000h,0e3h,0feh,0f8h,0feh,0e9h,0f9h,0e9h,005h,0e4h,002h,0dch,0f7h,0dch,002h,0dch	; beab  ................
	defb 0fah,000h,0f8h,000h,000h,000h,008h,000h,000h,000h,000h,000h,0f8h,000h,000h,000h	; bebb  ................
	defb 008h,000h,0f8h,000h,000h,000h,008h,000h,000h,000h,000h,000h,0f8h,000h,000h,000h	; becb  ................
	defb 008h,000h,0f8h,000h,000h,000h,008h,000h,000h,000h,000h,000h,0f8h,000h,000h,000h	; bedb  ................
	defb 008h,040h,000h,000h,011h,000h,000h,000h,000h,014h,000h,000h,000h,014h,0a8h,000h	; beeb  .@..............
	defb 000h,000h,000h,000h,000h,014h,000h,000h,000h,000h,000h,004h,000h,000h,010h,000h	; befb  ................
	defb 000h,028h,000h,010h,000h,000h,010h,000h,000h,010h,000h,000h,010h,001h,000h,004h	; bf0b  .(..............
	defb 000h,000h,040h,000h,001h,001h,0a0h,000h,004h,000h,000h,010h,000h,004h,000h,068h	; bf1b  ..@............h
	defb 001h,000h,010h,000h,004h,055h,055h,055h,055h,055h,055h,014h,055h,055h,055h,051h	; bf2b  .....UUUUUU.UUUQ
	defb 055h,055h,055h,055h,000h,055h,055h,055h,055h,055h,055h,055h,044h,055h,055h,055h	; bf3b  UUUU.UUUUUUUDUUU
	defb 055h,014h,045h,055h,051h,055h,055h,045h,055h,055h,055h,055h,005h,055h,054h,055h	; bf4b  U.EUQUUEUUUU.UTU
	defb 055h,051h,055h,045h,055h,055h,055h,055h,055h,055h,055h,044h,055h,054h,055h,055h	; bf5b  UQUEUUUUUUUDUTUU
	defb 055h,051h,055h,015h,050h,055h,055h,055h,055h,020h,008h,0ebh,00eh,00bh,01eh,00bh	; bf6b  UQU.PUUUU ......
	defb 0f0h,01dh,00bh,020h,00fh,0f0h,016h,019h,00bh,00eh,0ebh,0feh,020h,01ch,01dh,00bh	; bf7b  ... ........ ...
	defb 020h,00fh,0feh,020h,028h,016h,019h,00bh,00eh,0ffh,068h,01ch,01ah,00bh,01dh,01dh	; bf8b   .. (.....h.....
	defb 021h,019h,01ch,00eh,0ffh,068h,028h,00eh,013h,01dh,015h,0ffh,068h,054h,01dh,018h	; bf9b  !....h(.....hT..
	defb 00bh,015h,00fh,002h,0feh,068h,064h,01dh,018h,00bh,015h,00fh,003h,0feh,068h,074h	; bfab  .....hd.......ht
	defb 01dh,018h,00bh,015h,00fh,004h,0ffh,038h,09ch,01dh,00bh,020h,00fh,0f0h,00dh,019h	; bfbb  .......8... ....
	defb 017h,01ah,016h,00fh,01eh,00fh,0ffh,0ffh,009h,0ffh,000h,0ffh,009h,0ffh,023h,0ffh	; bfcb  ..............#.
	defb 04bh,0ffh,080h,0ffh,0beh,0ffh,000h,000h,042h,000h,080h,000h,0b5h,000h,0ddh,000h	; bfdb  K.......B.......
	defb 0f7h,000h,000h,001h,0f7h,000h,0ddh,000h,0b5h,000h,080h,000h,042h,000h,0c0h,021h	; bfeb  ............B..!
	defb 0a4h,0d8h,0c3h,0e5h,0b3h	; bffb
