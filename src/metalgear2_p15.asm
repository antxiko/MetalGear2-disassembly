; ==========================================================================
; METAL GEAR 2 SOLID SNAKE - Konami (1990) - MSX2 - MegaROM RC-767 de 512 KB (Konami SCC) - banco 15 (se ejecuta en 0xa000)
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
lbe54h:	equ 0x0be54

; ======================================================================
; CODIGO 0xa000..0xa16d  (365 bytes)
; ======================================================================


L_A000:
	call L_A04C		;a000
	jr L_A008		;a003
L_A005:
	call L_A049		;a005
L_A008:
	ld a,(0ca1ch)		;a008   ; lee 1: la pantalla partida en la linea 0xB4 (arriba con desplazamiento, abajo la pagina 1 sin sprites)
	and a			;a00b
	ret nz			;a00c
	ld ix,0d500h		;a00d   ; apunta a 8 fichas de 16 bytes [activa][..][Y][X][..][..][..][alto][ancho * 2] (p07:BC95)
	ld b,008h		;a011
L_A013:
	push bc			;a013
	ld a,(ix+000h)		;a014
	and a			;a017
	jr z,L_A035		;a018
	ld a,(ix+001h)		;a01a
	cp 002h		;a01d
	jr z,L_A02E		;a01f
	ld a,(ix+005h)		;a021
	ld hl,0d580h		;a024
	call 0423eh		;a027   ; suma_a_hl: HL = HL + A
	ld a,(hl)			;a02a
	and a			;a02b
	jr z,L_A035		;a02c
L_A02E:
	call L_A1F3		;a02e
	ld a,002h		;a031
	jr L_A03D		;a033
L_A035:
	ld (ix+001h),a		;a035
	call L_A12B		;a038
	jr L_A040		;a03b
L_A03D:
	ld (ix+001h),a		;a03d
L_A040:
	ld bc,00010h		;a040
	add ix,bc		;a043
	pop bc			;a045
	djnz L_A013		;a046
	ret			;a048
L_A049:
	call L_A1E2		;a049
L_A04C:
	ld hl,0d500h		;a04c   ; apunta a 8 fichas de 16 bytes [activa][..][Y][X][..][..][..][alto][ancho * 2] (p07:BC95)
	ld bc,0007fh		;a04f
	call 04236h		;a052   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	ld a,(0ca76h)		;a055   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	and a			;a058
	ld hl,0b1feh		;a059
	jr nz,L_A064		;a05c
	ld hl,0ad0ch		;a05e
	ld a,(0ca4ah)		;a061   ; lee la zona
L_A064:
	call 043f6h		;a064   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld ix,0d500h		;a067   ; apunta a 8 fichas de 16 bytes [activa][..][Y][X][..][..][..][alto][ancho * 2] (p07:BC95)
L_A06B:
	ld a,(hl)			;a06b
	inc a			;a06c
	ret z			;a06d
	ld a,(0ca4bh)		;a06e   ; lee la sala de la zona
	cp (hl)			;a071
	jp nz,L_A123		;a072
	push hl			;a075
	inc hl			;a076
	push ix		;a077
	pop de			;a079
	ldi		;a07a
	inc de			;a07c
	ldi		;a07d
	ldi		;a07f
	ldi		;a081
	ldi		;a083
	call L_A1A8		;a085
	pop hl			;a088
	ld a,(0ca4ah)		;a089   ; lee la zona
	cp 008h		;a08c
	jr nz,L_A0A1		;a08e
	ld a,(ix+005h)		;a090
	and a			;a093
	jr nz,L_A0A1		;a094
	ld a,(0d7dah)		;a096
	and 001h		;a099
	jr nz,L_A0A1		;a09b
	ld (ix+001h),002h		;a09d
L_A0A1:
	ld a,(0ca76h)		;a0a1   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	ld b,a			;a0a4
	cp 018h		;a0a5
	jr nz,L_A0B7		;a0a7
	ld a,(ix+005h)		;a0a9
	cp 01ch		;a0ac
	jr nz,L_A0B7		;a0ae
	ld a,(0d7dah)		;a0b0
	and 001h		;a0b3
	jr nz,L_A0CB		;a0b5
L_A0B7:
	ld a,(ix+000h)		;a0b7
	cp 00ch		;a0ba
	jr nz,L_A0CF		;a0bc
	ld a,(0d7dah)		;a0be
	and 001h		;a0c1
	jr nz,L_A0CB		;a0c3
	ld a,(0d441h)		;a0c5
	and a			;a0c8
	jr z,L_A0CF		;a0c9
L_A0CB:
	ld (ix+004h),000h		;a0cb
L_A0CF:
	ld a,b			;a0cf
	cp 029h		;a0d0
	jr nz,L_A0E5		;a0d2
	ld a,(0ca4bh)		;a0d4   ; lee la sala de la zona
	cp 002h		;a0d7
	jr nz,L_A0E5		;a0d9
	ld a,(0d4f2h)		;a0db
	and a			;a0de
	jr z,L_A0E5		;a0df
	ld (ix+000h),000h		;a0e1
L_A0E5:
	ld a,(0ca4ah)		;a0e5   ; lee la zona
	cp 00eh		;a0e8
	jr z,L_A0F6		;a0ea
	cp 013h		;a0ec
	jr z,L_A0FE		;a0ee
	cp 012h		;a0f0
	jr z,L_A10D		;a0f2
	jr L_A11E		;a0f4
L_A0F6:
	ld a,(0d885h)		;a0f6
	inc a			;a0f9
	jr nz,L_A11E		;a0fa
	jr L_A11A		;a0fc
L_A0FE:
	ld a,(0d884h)		;a0fe
	inc a			;a101
	jr nz,L_A11E		;a102
	ld a,(ix+005h)		;a104
	cp 002h		;a107
	jr nc,L_A11E		;a109
	jr L_A11A		;a10b
L_A10D:
	ld a,(0d889h)		;a10d
	inc a			;a110
	jr nz,L_A11E		;a111
	ld a,(ix+005h)		;a113
	cp 013h		;a116
	jr nz,L_A11E		;a118
L_A11A:
	ld (ix+004h),000h		;a11a
L_A11E:
	ld de,00010h		;a11e
	add ix,de		;a121
L_A123:
	ld a,006h		;a123
	call 0423eh		;a125   ; suma_a_hl: HL = HL + A
	jp L_A06B		;a128
L_A12B:
	call L_A17B		;a12b
	ret c			;a12e
	ld a,(ix+000h)		;a12f
	sub 003h		;a132
	cp 002h		;a134
	ret nc			;a136
	and a			;a137
	ld hl,0a16dh		;a138
	jr z,L_A140		;a13b
	ld hl,0a174h		;a13d
L_A140:
	ld e,(ix+002h)		;a140
	ld a,(ix+003h)		;a143
	and 0f8h		;a146
	ld d,a			;a148
	ld b,007h		;a149
L_A14B:
	push hl			;a14b
	push de			;a14c
	push bc			;a14d
	ld h,(hl)			;a14e
	ld l,078h		;a14f
	ld bc,00808h		;a151
	ld a,(0ca42h)		;a154   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	xor 001h		;a157
	rlca			;a159
	rlca			;a15a
	rlca			;a15b
	rlca			;a15c
	or 0c8h		;a15d
	call 047edh		;a15f   ; copia_rectangulo_logica: orden LMMM del VDP con la operacion logica de A
	pop bc			;a162
	pop de			;a163
	pop hl			;a164
	inc hl			;a165
	ld a,e			;a166
	add a,008h		;a167
	ld e,a			;a169
	djnz L_A14B		;a16a
	ret			;a16c

; ----------------------------------------------------------------------
; DATOS resto_A16D: lo apuntan con el banco puesto p15:A138 (0xA16D), p15:A13D
;   (0xA174); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p15:A138, p15:A13D (14 bytes)
;   0xa16d..0xa17b  (14 bytes)
DATA_resto_A16D:
	defb 088h,098h,0e8h,0d8h,0a8h,0b8h,0c8h,080h,090h,0e0h,0d0h,0a0h,0b0h,0c0h	; a16d  ..............

; ======================================================================
; CODIGO 0xa17b..0xa1b8  (61 bytes)
; ======================================================================


L_A17B:
	ld a,(0cb21h)		;a17b   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	cp 003h		;a17e
	jr z,L_A1A6		;a180
	ld a,(0ca4bh)		;a182   ; lee la sala de la zona
	ld b,a			;a185
	ld a,(0ca4ah)		;a186   ; lee la zona
	sub 003h		;a189
	jr z,L_A19C		;a18b
	dec a			;a18d
	jr nz,L_A1A6		;a18e
	ld a,b			;a190
	cp 00eh		;a191
	jr nz,L_A1A6		;a193
	ld a,(0cacdh)		;a195
	and a			;a198
	ret z			;a199
	scf			;a19a
	ret			;a19b
L_A19C:
	ld a,b			;a19c
	and a			;a19d
	ret nz			;a19e
	ld a,(0cac9h)		;a19f
	and a			;a1a2
	ret z			;a1a3
	scf			;a1a4
	ret			;a1a5
L_A1A6:
	or a			;a1a6
	ret			;a1a7
L_A1A8:
	ld a,(ix+000h)		;a1a8
	ld hl,0a1b6h		;a1ab
	call 043f6h		;a1ae   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld (ix+007h),l		;a1b1
	ld (ix+008h),h		;a1b4
	ret			;a1b7

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa1b8..0xa1e2  (42 bytes)
DATA_A1B8:
	defb 020h,018h,008h,018h,020h,008h,020h,008h,020h,030h,008h,030h,01ah,018h,008h,020h	; a1b8   ... . . 0.0...
	defb 01eh,018h,01ch,020h,020h,018h,020h,018h,020h,018h,008h,050h,008h,028h,008h,020h	; a1c8  ...  . . ..P.(.
	defb 020h,020h,010h,020h,020h,018h,008h,070h,01eh,019h	; a1d8    .  ..p..

; ======================================================================
; CODIGO 0xa1e2..0xa1fa  (24 bytes)
; ======================================================================


L_A1E2:
	ld hl,0d580h		;a1e2
	ld b,080h		;a1e5
L_A1E7:
	ld a,(hl)			;a1e7
	and a			;a1e8
	jr z,L_A1EF		;a1e9
	inc a			;a1eb
	jr z,L_A1EF		;a1ec
	dec (hl)			;a1ee
L_A1EF:
	inc hl			;a1ef
	djnz L_A1E7		;a1f0
	ret			;a1f2
L_A1F3:
	ld a,(ix+000h)		;a1f3
	dec a			;a1f6
	call 0424dh		;a1f7   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_A1FA: 21 destinos del despachador p00:424D (call en p15:A1F7, el
;   indice en A): A238, A238, A26A, A2AD, A238, A238, A2BA, A238, A238, A238,
;   A238, A238, A224, A2A4, A238, A238, A238, A238, A238, A2A4, A238; lo leen
;   p15:A1F7 (42 bytes)
;   0xa1fa..0xa224  (42 bytes)
DATA_tabla_A1FA:
	defw 0a238h,0a238h,0a26ah,0a2adh,0a238h,0a238h,0a2bah,0a238h	; a1fa
	defw 0a238h,0a238h,0a238h,0a238h,0a224h,0a2a4h,0a238h,0a238h	; a20a
	defw 0a238h,0a238h,0a238h,0a2a4h,0a238h	; a21a

; ======================================================================
; CODIGO 0xa224..0xa2a5  (129 bytes)
; ======================================================================


L_A224:
	ld hl,0ca42h		;a224   ; apunta a la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	ld a,(hl)			;a227
	push hl			;a228
	push af			;a229
	xor 001h		;a22a
	ld (hl),a			;a22c
	call L_A263		;a22d
	ex de,hl			;a230
	call 07d66h		;a231   ; copia_7d95_a_3: 4 filas de 3 caracteres de 8 x 8 de la pagina de dibujar (X de la lista de p01:7D95, Y = 0x78; 0xFF: X = 0, Y = 0x60) a la pagina 3
	pop af			;a234
	pop hl			;a235
	ld (hl),a			;a236
	ret			;a237
L_A238:
	ld c,(ix+007h)		;a238
	ld b,(ix+008h)		;a23b
	call L_A255		;a23e
L_A241:
	call L_A263		;a241
	ld a,(ix+008h)		;a244
	rrca			;a247
	rrca			;a248
	rrca			;a249
	and 01fh		;a24a
	ld b,a			;a24c
	ld a,(ix+007h)		;a24d
	sub 008h		;a250
	jp L_A890		;a252
L_A255:
	call L_A263		;a255
L_A258:
	ld a,(0ca42h)		;a258   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	xor 001h		;a25b
	ld d,a			;a25d
	ld a,0ffh		;a25e
	jp 046ffh		;a260   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
L_A263:
	ld l,(ix+002h)		;a263
	ld h,(ix+003h)		;a266
	ret			;a269
L_A26A:
	ld e,001h		;a26a
	call L_A276		;a26c
	call L_A263		;a26f
	xor a			;a272
	jp L_A6EB		;a273
L_A276:
	call L_A263		;a276
	ld c,00fh		;a279
	ld d,008h		;a27b
L_A27D:
	push hl			;a27d
	push de			;a27e
	push bc			;a27f
	ld a,d			;a280
	dec a			;a281
	ld de,0a2a5h		;a282
	call 04243h		;a285   ; suma_a_de: DE = DE + A
	ld a,(de)			;a288
	ld b,a			;a289
	ld a,(0ca42h)		;a28a   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	xor 001h		;a28d
	call 04680h		;a28f   ; linea_vertical: orden LINE del VDP con el lado largo en Y (ARG = 1)
	pop bc			;a292
	pop de			;a293
	pop hl			;a294
	ld a,h			;a295
	add a,e			;a296
	ld h,a			;a297
	ld a,d			;a298
	cp 007h		;a299
	jr nc,L_A2A1		;a29b
	inc l			;a29d
	inc l			;a29e
	inc l			;a29f
	inc l			;a2a0
L_A2A1:
	dec d			;a2a1
	jr nz,L_A27D		;a2a2
L_A2A4:
	ret			;a2a4

; ----------------------------------------------------------------------
; DATOS resto_A2A5: lo apuntan con el banco puesto p15:A282 (0xA2A5); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p15:A282 (8 bytes)
;   0xa2a5..0xa2ad  (8 bytes)
DATA_resto_A2A5:
	defb 024h,028h,02ch,02ch,02ch,02ch,028h,024h	; a2a5  $(,,,,($

; ======================================================================
; CODIGO 0xa2ad..0xa36f  (194 bytes)
; ======================================================================


L_A2AD:
	ld e,0ffh		;a2ad
	call L_A276		;a2af
	call L_A263		;a2b2
	ld a,0ffh		;a2b5
	jp L_A6EB		;a2b7
L_A2BA:
	call L_A263		;a2ba
	ld a,h			;a2bd
	add a,003h		;a2be
	ld h,a			;a2c0
	ld bc,0110fh		;a2c1
	ld d,004h		;a2c4
	ld a,(0ca42h)		;a2c6   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	xor 001h		;a2c9
L_A2CB:
	call 046e6h		;a2cb   ; linea_horizontal_guarda: p00:467C guardando AF, HL, DE y BC
	inc l			;a2ce
	dec h			;a2cf
	inc b			;a2d0
	inc b			;a2d1
	dec d			;a2d2
	jr nz,L_A2CB		;a2d3
	ld a,(ix+007h)		;a2d5
	sub 003h		;a2d8
	ld c,a			;a2da
	ld b,(ix+008h)		;a2db
	call L_A263		;a2de
	ld a,l			;a2e1
	add a,003h		;a2e2
	ld l,a			;a2e4
	call L_A258		;a2e5
	jp L_A241		;a2e8
L_A2EB:
	ld hl,0d580h		;a2eb
	ld bc,0007fh		;a2ee
	call 04236h		;a2f1   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	ld a,(0ca4ah)		;a2f4   ; lee la zona
	cp 002h		;a2f7
	ld hl,0d584h		;a2f9
	ld de,0d581h		;a2fc
	jr z,L_A311		;a2ff
	cp 003h		;a301
	ld de,0d5a5h		;a303
	jr z,L_A311		;a306
	cp 005h		;a308
	ld hl,0d58eh		;a30a
	ld de,0d59bh		;a30d
	ret nz			;a310
L_A311:
	ld a,0ffh		;a311
	ld (hl),a			;a313
	ld (de),a			;a314
	ret			;a315
L_A316:
	ld a,(0d4e9h)		;a316
	and a			;a319
	ret nz			;a31a
	ld a,(0ca41h)		;a31b   ; lee la salida de la sala (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	and a			;a31e
	ret nz			;a31f
	ld ix,0d500h		;a320   ; apunta a 8 fichas de 16 bytes [activa][..][Y][X][..][..][..][alto][ancho * 2] (p07:BC95)
	ld bc,00800h		;a324
L_A327:
	ld a,(ix+000h)		;a327
	and a			;a32a
	jr z,L_A340		;a32b
	push bc			;a32d
	push ix		;a32e
	call L_A368		;a330
	pop ix		;a333
	pop bc			;a335
	ld a,(ix+001h)		;a336
	dec a			;a339
	jr z,L_A348		;a33a
	cp 003h		;a33c
	jr z,L_A348		;a33e
L_A340:
	ld de,00010h		;a340
	add ix,de		;a343
	djnz L_A327		;a345
	ret			;a347
L_A348:
	ld a,001h		;a348
	ld (0cae7h),a		;a34a
	push ix		;a34d
	pop hl			;a34f
	ld (0cae8h),hl		;a350
	ret			;a353
L_A354:
	ld ix,(0cae8h)		;a354
	call L_A368		;a358
	ld a,(ix+001h)		;a35b
	dec a			;a35e
	ret z			;a35f
	cp 003h		;a360
	ret z			;a362
	xor a			;a363
	ld (0cae7h),a		;a364
	ret			;a367
L_A368:
	ld a,(ix+000h)		;a368
	dec a			;a36b
	call 0424dh		;a36c   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_A36F: 21 destinos del despachador p00:424D (call en p15:A36C, el
;   indice en A): A41C, A5A1, A651, A71C, A7D4, A8BF, A920, A8BF, A41C, A41C,
;   A41C, A41C, A3C4, A582, A5A1, A5A1, A7D4, A7D4, A41C, A582, A41C; lo leen
;   p15:A36C (42 bytes)
;   0xa36f..0xa399  (42 bytes)
DATA_tabla_A36F:
	defw 0a41ch,0a5a1h,0a651h,0a71ch,0a7d4h,0a8bfh,0a920h,0a8bfh	; a36f
	defw 0a41ch,0a41ch,0a41ch,0a41ch,0a3c4h,0a582h,0a5a1h,0a5a1h	; a37f
	defw 0a7d4h,0a7d4h,0a41ch,0a582h,0a41ch	; a38f

; ======================================================================
; CODIGO 0xa399..0xa3ca  (49 bytes)
; ======================================================================


L_A399:
	ld a,(0cb4bh)		;a399   ; lee con el puesto, la vida baja un punto cada 16 cuadros
	and a			;a39c
	ret nz			;a39d
	ld a,(ix+004h)		;a39e
	ld c,a			;a3a1
	and a			;a3a2
	jr nz,L_A3A7		;a3a3
	scf			;a3a5
	ret			;a3a6
L_A3A7:
	ld a,(0cb21h)		;a3a7   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	sub 011h		;a3aa
	cp 00ch		;a3ac
	ret nc			;a3ae
	cp 003h		;a3af
	jr c,L_A3BC		;a3b1
	sub 002h		;a3b3
	cp c			;a3b5
	jr nz,L_A3BA		;a3b6
	scf			;a3b8
	ret			;a3b9
L_A3BA:
	or a			;a3ba
	ret			;a3bb
L_A3BC:
	inc a			;a3bc
	ld b,a			;a3bd
	add a,a			;a3be
	add a,b			;a3bf
	sub c			;a3c0
	cp 003h		;a3c1
	ret			;a3c3
L_A3C4:
	ld a,(ix+001h)		;a3c4
	call 0424dh		;a3c7   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_A3CA: 4 destinos del despachador p00:424D (call en p15:A3C7, el
;   indice en A): A3D2, A40F, A4F4, A9AB; lo leen p15:A3C7 (8 bytes)
;   0xa3ca..0xa3d2  (8 bytes)
DATA_tabla_A3CA:
	defw 0a3d2h,0a40fh,0a4f4h,0a9abh	; a3ca  -> L_A3D2 L_A40F L_A4F4 L_A9AB

; ======================================================================
; CODIGO 0xa3d2..0xa422  (80 bytes)
; ======================================================================


L_A3D2:
	call L_A44B		;a3d2
	ret nc			;a3d5
	ld a,(0ca4ah)		;a3d6   ; lee la zona
	ld b,01ah		;a3d9
	cp 004h		;a3db
	jr z,L_A3E1		;a3dd
	ld b,004h		;a3df
L_A3E1:
	ld a,(ix+005h)		;a3e1
	cp b			;a3e4
	jr nz,L_A406		;a3e5
	ld a,(0cb21h)		;a3e7   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	cp 010h		;a3ea
	ret nz			;a3ec
	ld a,(0ca4ah)		;a3ed   ; lee la zona
	cp 004h		;a3f0
	ld b,004h		;a3f2
	jr z,L_A3F8		;a3f4
	ld b,000h		;a3f6
L_A3F8:
	ld a,(0ca89h)		;a3f8
	cp b			;a3fb
	ret nz			;a3fc
	ld a,b			;a3fd
	and a			;a3fe
	jr nz,L_A406		;a3ff
	ld hl,0d7ddh		;a401
	res 0,(hl)		;a404
L_A406:
	ld a,(ix+005h)		;a406
	call L_ACDE		;a409
	jp L_A887		;a40c
L_A40F:
	call L_A263		;a40f
	ex de,hl			;a412
	call 07d66h		;a413   ; copia_7d95_a_3: 4 filas de 3 caracteres de 8 x 8 de la pagina de dibujar (X de la lista de p01:7D95, Y = 0x78; 0xFF: X = 0, Y = 0x60) a la pagina 3
	call 06c33h		;a416   ; sonido_46: pide el sonido 0x46
	jp L_A85F		;a419
L_A41C:
	ld a,(ix+001h)		;a41c
	call 0424dh		;a41f   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_A422: 5 destinos del despachador p00:424D (call en p15:A41F, el
;   indice en A): A42C, A488, A4C3, A9AB, A483; lo leen p15:A41F (10 bytes)
;   0xa422..0xa42c  (10 bytes)
DATA_tabla_A422:
	defw 0a42ch,0a488h,0a4c3h,0a9abh,0a483h	; a422

; ======================================================================
; CODIGO 0xa42c..0xa572  (326 bytes)
; ======================================================================


L_A42C:
	call L_A44B		;a42c
	ret nc			;a42f
	ld (ix+00ah),014h		;a430
	call L_A5C6		;a434
	call L_A263		;a437
	ld c,(ix+007h)		;a43a
	ld b,(ix+008h)		;a43d
	ld de,0c8d8h		;a440
L_A443:
	ld a,(0ca42h)		;a443   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	and 003h		;a446
	jp 04767h		;a448   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
L_A44B:
	ld a,(ix+009h)		;a44b
	and a			;a44e
	scf			;a44f
	ret nz			;a450
	ld a,(0cb31h)		;a451   ; lee 1 en el estado 2 de Snake
	and a			;a454
	ret nz			;a455
	call L_A399		;a456
	ret nc			;a459
	call L_A514		;a45a
	ret nz			;a45d
	call L_A263		;a45e
	ld a,(ix+000h)		;a461
	cp 00ah		;a464
	ld b,00ah		;a466
	jr nz,L_A46C		;a468
	ld b,00eh		;a46a
L_A46C:
	ld a,(0cb03h)		;a46c   ; lee la Y de Snake
	sub l			;a46f
	sub (ix+007h)		;a470
	cp b			;a473
	ret nc			;a474
	ld a,(ix+008h)		;a475
	sub 008h		;a478
	ld b,a			;a47a
	ld a,(0cb05h)		;a47b   ; lee la X de Snake
	sub h			;a47e
	sub 004h		;a47f
	cp b			;a481
	ret			;a482
L_A483:
	ld a,(0c697h)		;a483
	and a			;a486
	ret nz			;a487
L_A488:
	ld a,(ix+006h)		;a488
	add a,a			;a48b
	ld b,a			;a48c
	cp (ix+008h)		;a48d
	jp nc,L_A85F		;a490
	inc (ix+006h)		;a493
	ld a,(ix+001h)		;a496
	cp 004h		;a499
	ld a,b			;a49b
	jr nz,L_A4A2		;a49c
	sub 018h		;a49e
	neg		;a4a0
L_A4A2:
	ld b,a			;a4a2
	ret z			;a4a3
	call L_A263		;a4a4
	add a,h			;a4a7
	ld d,a			;a4a8
	ld e,l			;a4a9
	ld a,(ix+008h)		;a4aa
	sub b			;a4ad
	ret z			;a4ae
	ret c			;a4af
	ld b,a			;a4b0
	ld c,(ix+007h)		;a4b1
	ld hl,0c6d8h		;a4b4
	ld a,(0ca42h)		;a4b7   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	rrca			;a4ba
	rrca			;a4bb
	rrca			;a4bc
	rrca			;a4bd
	and 030h		;a4be
	jp 047edh		;a4c0   ; copia_rectangulo_logica: orden LMMM del VDP con la operacion logica de A
L_A4C3:
	ld a,(ix+000h)		;a4c3
	cp 00bh		;a4c6
	jr z,L_A4D8		;a4c8
	cp 00ch		;a4ca
	jr z,L_A4D8		;a4cc
	cp 013h		;a4ce
	jr nz,L_A4F4		;a4d0
	ld a,(0ca5fh)		;a4d2   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	and a			;a4d5
	jr nz,L_A4F4		;a4d6
L_A4D8:
	dec (ix+00ah)		;a4d8
	jr nz,L_A4F4		;a4db
	ld (ix+006h),000h		;a4dd
	call L_A537		;a4e1
	ld (ix+001h),004h		;a4e4
	ld a,(ix+005h)		;a4e8
	ld hl,0d580h		;a4eb
	call 0423eh		;a4ee   ; suma_a_hl: HL = HL + A
	ld (hl),000h		;a4f1
	ret			;a4f3
L_A4F4:
	call L_A514		;a4f4
	ret nz			;a4f7
	call L_A263		;a4f8
	ld a,(ix+007h)		;a4fb
	sub 008h		;a4fe
	ld b,a			;a500
	ld a,(0cb03h)		;a501   ; lee la Y de Snake
	sub l			;a504
	sub b			;a505
	cp 00ah		;a506
	ret nc			;a508
	ld a,(0cb05h)		;a509   ; lee la X de Snake
	sub h			;a50c
	cp (ix+008h)		;a50d
	ret nc			;a510
	jp L_A887		;a511
L_A514:
	ld bc,00101h		;a514
L_A517:
	ld a,(0cb0eh)		;a517   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	sub b			;a51a
	ret nz			;a51b
	ld a,(0ca08h)		;a51c   ; lee el mando: joystick y teclado juntos (bits 0-3 las direcciones, 4-5 los disparos)
	and c			;a51f
	jr z,L_A524		;a520
	xor a			;a522
	ret			;a523
L_A524:
	ld a,001h		;a524
	and a			;a526
	ret			;a527
L_A528:
	ld bc,00202h		;a528
	jr L_A517		;a52b
L_A52D:
	ld bc,00304h		;a52d
	jr L_A517		;a530
L_A532:
	ld bc,00408h		;a532
	jr L_A517		;a535
L_A537:
	call 04229h		;a537   ; bancos_27: pone el 27 en 0x8000 (con su copia en 0xC381-0xC383)
	ld a,(ix+000h)		;a53a
	cp 00bh		;a53d
	ld hl,092b9h		;a53f
	jr z,L_A54E		;a542
	cp 00ch		;a544
	ld hl,092c9h		;a546
	jr z,L_A54E		;a549
	ld hl,0a572h		;a54b
L_A54E:
	ld bc,00404h		;a54e
	ld a,002h		;a551
	ld (0ca1bh),a		;a553   ; guarda las paginas de la copia de una letra o pieza (bits 0-1 origen, 2-3 destino)
	ld de,0c0d8h		;a556
L_A559:
	push de			;a559
	ld c,004h		;a55a
L_A55C:
	ld a,(hl)			;a55c
	call 04a19h		;a55d   ; p00:4A19
	ld a,d			;a560
	add a,008h		;a561
	ld d,a			;a563
	inc hl			;a564
	dec c			;a565
	jr nz,L_A55C		;a566
	pop de			;a568
	ld a,e			;a569
	add a,008h		;a56a
	ld e,a			;a56c
	djnz L_A559		;a56d
	jp 041f4h		;a56f   ; bancos_1_2_15: pone el 1 en 0x6000, el 2 en 0x8000, el 15 en 0xA000 (con su copia en 0xC381-0xC383)

; ----------------------------------------------------------------------
; DATOS resto_A572: lo apuntan con el banco puesto p15:A54B (0xA572); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p15:A54B (16 bytes)
;   0xa572..0xa582  (16 bytes)
DATA_resto_A572:
	defb 0d8h,09fh,0a0h,0d9h,0dah,0deh,0dfh,0dch,0dah,0cfh,090h,0dch,0dbh,0adh,0aeh,0ddh	; a572  ................

; ======================================================================
; CODIGO 0xa582..0xa588  (6 bytes)
; ======================================================================


L_A582:
	ld a,(ix+001h)		;a582
	call 0424dh		;a585   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_A588: 4 destinos del despachador p00:424D (call en p15:A585, el
;   indice en A): A590, A628, A635, A9AB; lo leen p15:A585 (8 bytes)
;   0xa588..0xa590  (8 bytes)
DATA_tabla_A588:
	defw 0a590h,0a628h,0a635h,0a9abh	; a588  -> L_A590 L_A628 L_A635 L_A9AB

; ======================================================================
; CODIGO 0xa590..0xa5a7  (23 bytes)
; ======================================================================


L_A590:
	call L_A528		;a590
	ret nz			;a593
	call L_A5E6		;a594
	ret nc			;a597
	ld a,(ix+005h)		;a598
	call L_ACDE		;a59b
	jp L_A887		;a59e
L_A5A1:
	ld a,(ix+001h)		;a5a1
	call 0424dh		;a5a4   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_A5A7: 4 destinos del despachador p00:424D (call en p15:A5A4, el
;   indice en A): A5AF, A600, A635, A9AB; lo leen p15:A5A4 (8 bytes)
;   0xa5a7..0xa5af  (8 bytes)
DATA_tabla_A5A7:
	defw 0a5afh,0a600h,0a635h,0a9abh	; a5a7  -> L_A5AF L_A600 L_A635 L_A9AB

; ======================================================================
; CODIGO 0xa5af..0xa657  (168 bytes)
; ======================================================================


L_A5AF:
	ld a,(ix+009h)		;a5af
	and a			;a5b2
	jr nz,L_A5C6		;a5b3
	ld a,(0cb31h)		;a5b5   ; lee 1 en el estado 2 de Snake
	and a			;a5b8
	ret nz			;a5b9
	call L_A528		;a5ba
	ret nz			;a5bd
	call L_A399		;a5be
	ret nc			;a5c1
	call L_A5E6		;a5c2
	ret nc			;a5c5
L_A5C6:
	ld a,(ix+005h)		;a5c6
	call L_ACDE		;a5c9
	xor a			;a5cc
	ld (ix+006h),a		;a5cd
	ld (ix+009h),a		;a5d0
	call L_A5DC		;a5d3
	call L_A887		;a5d6
	jp 06a4ch		;a5d9   ; sonido_16: pide el sonido 0x16
L_A5DC:
	ld hl,0c0d4h		;a5dc
	ld bc,0402ch		;a5df
	ld d,000h		;a5e2
	jr L_A624		;a5e4
L_A5E6:
	call L_A263		;a5e6
	ld a,(0cb03h)		;a5e9   ; lee la Y de Snake
	sub l			;a5ec
	neg		;a5ed
	cp 008h		;a5ef
	ret nc			;a5f1
	ld a,(ix+008h)		;a5f2
	sub 008h		;a5f5
	ld b,a			;a5f7
	ld a,(0cb05h)		;a5f8   ; lee la X de Snake
	sub h			;a5fb
	sub 004h		;a5fc
	cp b			;a5fe
	ret			;a5ff
L_A600:
	ld a,(ix+006h)		;a600
	cp (ix+008h)		;a603
	jr nc,L_A628		;a606
	inc (ix+006h)		;a608
	inc (ix+006h)		;a60b
	call L_A263		;a60e
	ld a,(ix+006h)		;a611
L_A614:
	ld b,a			;a614
	ld c,(ix+007h)		;a615
	ld a,(0ca1ch)		;a618   ; lee 1: la pantalla partida en la linea 0xB4 (arriba con desplazamiento, abajo la pagina 1 sin sprites)
	and a			;a61b
	ld d,001h		;a61c
	jr nz,L_A624		;a61e
	ld a,(0ca42h)		;a620   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	ld d,a			;a623
L_A624:
	xor a			;a624
	jp 046ffh		;a625   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
L_A628:
	ld a,(ix+008h)		;a628
	rrca			;a62b
	rrca			;a62c
	rrca			;a62d
	and 01fh		;a62e
	ld b,a			;a630
	xor a			;a631
	jp L_A86D		;a632
L_A635:
	call L_A528		;a635
	ret nz			;a638
	call L_A263		;a639
	ld a,(0cb03h)		;a63c   ; lee la Y de Snake
	sub 002h		;a63f
	sub l			;a641
	cp (ix+007h)		;a642
	ret nc			;a645
	ld a,(0cb05h)		;a646   ; lee la X de Snake
	sub h			;a649
	cp (ix+008h)		;a64a
	ret nc			;a64d
	jp L_A887		;a64e
L_A651:
	ld a,(ix+001h)		;a651
	call 0424dh		;a654   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_A657: 4 destinos del despachador p00:424D (call en p15:A654, el
;   indice en A): A65F, A6B1, A702, A9AB; lo leen p15:A654 (8 bytes)
;   0xa657..0xa65f  (8 bytes)
DATA_tabla_A657:
	defw 0a65fh,0a6b1h,0a702h,0a9abh	; a657  -> L_A65F L_A6B1 L_A702 L_A9AB

; ======================================================================
; CODIGO 0xa65f..0xa722  (195 bytes)
; ======================================================================


L_A65F:
	ld a,(ix+009h)		;a65f
	and a			;a662
	jr nz,L_A687		;a663
	ld a,(0cb31h)		;a665   ; lee 1 en el estado 2 de Snake
	and a			;a668
	ret nz			;a669
	call L_A52D		;a66a
	ret nz			;a66d
	call L_A399		;a66e
	ret nc			;a671
	call L_A263		;a672
	ld a,(0cb03h)		;a675   ; lee la Y de Snake
	sub l			;a678
	sub 020h		;a679
	cp 020h		;a67b
	ret nc			;a67d
	ld a,(0cb05h)		;a67e   ; lee la X de Snake
	sub h			;a681
	sub 00ch		;a682
	cp 008h		;a684
	ret nc			;a686
L_A687:
	call L_A5C6		;a687
	ld b,006h		;a68a
	ld de,0c8d8h		;a68c
	call L_A263		;a68f
	inc h			;a692
	ld a,(0ca42h)		;a693   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	and 003h		;a696
	rrca			;a698
	rrca			;a699
L_A69A:
	push af			;a69a
	push bc			;a69b
	push de			;a69c
	push hl			;a69d
	ld bc,00120h		;a69e
	call 047edh		;a6a1   ; copia_rectangulo_logica: orden LMMM del VDP con la operacion logica de A
	pop hl			;a6a4
	pop de			;a6a5
	pop bc			;a6a6
	pop af			;a6a7
	inc d			;a6a8
	inc h			;a6a9
	inc l			;a6aa
	inc l			;a6ab
	inc l			;a6ac
	inc l			;a6ad
	djnz L_A69A		;a6ae
	ret			;a6b0
L_A6B1:
	ld a,(ix+006h)		;a6b1
	add a,a			;a6b4
	ld c,a			;a6b5
	cp 020h		;a6b6
	jr nc,L_A6E1		;a6b8
	inc (ix+006h)		;a6ba
	call L_A263		;a6bd
	ld d,h			;a6c0
	inc d			;a6c1
	add a,l			;a6c2
	ld e,a			;a6c3
	ld hl,0c8d6h		;a6c4
	ld b,006h		;a6c7
L_A6C9:
	push bc			;a6c9
	push de			;a6ca
	push hl			;a6cb
	ld b,001h		;a6cc
	ld a,020h		;a6ce
	sub c			;a6d0
	ld c,a			;a6d1
	call L_A853		;a6d2
	pop hl			;a6d5
	pop de			;a6d6
	pop bc			;a6d7
	inc h			;a6d8
	inc d			;a6d9
	inc e			;a6da
	inc e			;a6db
	inc e			;a6dc
	inc e			;a6dd
	djnz L_A6C9		;a6de
	ret			;a6e0
L_A6E1:
	call L_A263		;a6e1
	xor a			;a6e4
	call L_A6EB		;a6e5
	jp L_A887		;a6e8
L_A6EB:
	add a,h			;a6eb
	ld h,a			;a6ec
	ld a,l			;a6ed
	add a,020h		;a6ee
	ld l,a			;a6f0
	call 04411h		;a6f1   ; punto_a_mapa: H = X, L = Y en puntos; A = X / 8, la columna
	ld b,003h		;a6f4
L_A6F6:
	ld (hl),000h		;a6f6
	ld a,018h		;a6f8
	call 0423eh		;a6fa   ; suma_a_hl: HL = HL + A
	djnz L_A6F6		;a6fd
	jp L_A8A6		;a6ff
L_A702:
	call L_A52D		;a702
	ret nz			;a705
	call L_A263		;a706
	ld a,(0cb03h)		;a709   ; lee la Y de Snake
	sub l			;a70c
	sub 020h		;a70d
	cp 020h		;a70f
	ret nc			;a711
	ld a,(0cb05h)		;a712   ; lee la X de Snake
	sub h			;a715
	cp 00fh		;a716
	ret nc			;a718
	jp L_A887		;a719
L_A71C:
	ld a,(ix+001h)		;a71c
	call 0424dh		;a71f   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_A722: 4 destinos del despachador p00:424D (call en p15:A71F, el
;   indice en A): A72A, A77C, A7B8, A9AB; lo leen p15:A71F (8 bytes)
;   0xa722..0xa72a  (8 bytes)
DATA_tabla_A722:
	defw 0a72ah,0a77ch,0a7b8h,0a9abh	; a722  -> L_A72A L_A77C L_A7B8 L_A9AB

; ======================================================================
; CODIGO 0xa72a..0xa7da  (176 bytes)
; ======================================================================


L_A72A:
	ld a,(ix+009h)		;a72a
	and a			;a72d
	jr nz,L_A752		;a72e
	ld a,(0cb31h)		;a730   ; lee 1 en el estado 2 de Snake
	and a			;a733
	ret nz			;a734
	call L_A532		;a735
	ret nz			;a738
	call L_A399		;a739
	ret nc			;a73c
	call L_A263		;a73d
	ld a,(0cb03h)		;a740   ; lee la Y de Snake
	sub l			;a743
	sub 020h		;a744
	cp 020h		;a746
	ret nc			;a748
	ld a,(0cb05h)		;a749   ; lee la X de Snake
	sub h			;a74c
	add a,010h		;a74d
	cp 008h		;a74f
	ret nc			;a751
L_A752:
	call L_A5C6		;a752
	call L_A263		;a755
	dec h			;a758
	ld a,(0ca42h)		;a759   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	and 003h		;a75c
	rrca			;a75e
	rrca			;a75f
	ld b,006h		;a760
	ld de,0c8d8h		;a762
L_A765:
	push af			;a765
	push bc			;a766
	push de			;a767
	push hl			;a768
	ld bc,00120h		;a769
	call 047edh		;a76c   ; copia_rectangulo_logica: orden LMMM del VDP con la operacion logica de A
	pop hl			;a76f
	pop de			;a770
	pop bc			;a771
	pop af			;a772
	inc d			;a773
	dec h			;a774
	inc l			;a775
	inc l			;a776
	inc l			;a777
	inc l			;a778
	djnz L_A765		;a779
	ret			;a77b
L_A77C:
	ld a,(ix+006h)		;a77c
	add a,a			;a77f
	ld c,a			;a780
	cp 020h		;a781
	jr nc,L_A7AC		;a783
	inc (ix+006h)		;a785
	call L_A263		;a788
	ld d,h			;a78b
	dec d			;a78c
	add a,l			;a78d
	ld e,a			;a78e
	ld hl,0c8d6h		;a78f
	ld b,006h		;a792
L_A794:
	push bc			;a794
	push de			;a795
	push hl			;a796
	ld b,001h		;a797
	ld a,020h		;a799
	sub c			;a79b
	ld c,a			;a79c
	call L_A853		;a79d
	pop hl			;a7a0
	pop de			;a7a1
	pop bc			;a7a2
	inc h			;a7a3
	dec d			;a7a4
	inc e			;a7a5
	inc e			;a7a6
	inc e			;a7a7
	inc e			;a7a8
	djnz L_A794		;a7a9
	ret			;a7ab
L_A7AC:
	call L_A263		;a7ac
	dec h			;a7af
	ld a,0ffh		;a7b0
	call L_A6EB		;a7b2
	jp L_A887		;a7b5
L_A7B8:
	call L_A532		;a7b8
	ret nz			;a7bb
	call L_A263		;a7bc
	ld a,(0cb03h)		;a7bf   ; lee la Y de Snake
	sub l			;a7c2
	sub 020h		;a7c3
	cp 020h		;a7c5
	ret nc			;a7c7
	ld a,(0cb05h)		;a7c8   ; lee la X de Snake
	sub h			;a7cb
	add a,00ch		;a7cc
	cp 008h		;a7ce
	ret nc			;a7d0
	jp L_A887		;a7d1
L_A7D4:
	ld a,(ix+001h)		;a7d4
	call 0424dh		;a7d7   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_A7DA: 4 destinos del despachador p00:424D (call en p15:A7D7, el
;   indice en A): A7E2, A807, A4F4, A9AB; lo leen p15:A7D7 (8 bytes)
;   0xa7da..0xa7e2  (8 bytes)
DATA_tabla_A7DA:
	defw 0a7e2h,0a807h,0a4f4h,0a9abh	; a7da  -> L_A7E2 L_A807 L_A4F4 L_A9AB

; ======================================================================
; CODIGO 0xa7e2..0xa8c5  (227 bytes)
; ======================================================================


L_A7E2:
	call L_A44B		;a7e2
	ret nc			;a7e5
	call L_A5C6		;a7e6
L_A7E9:
	call L_A263		;a7e9
	ld b,(ix+008h)		;a7ec
	srl b		;a7ef
	ld c,(ix+007h)		;a7f1
	push hl			;a7f4
	push bc			;a7f5
	ld de,0c8d8h		;a7f6
	call L_A443		;a7f9
	pop bc			;a7fc
	pop hl			;a7fd
	ld a,h			;a7fe
	add a,b			;a7ff
	ld h,a			;a800
	ld de,0e8d8h		;a801
	jp L_A443		;a804
L_A807:
	ld a,(ix+008h)		;a807
	srl a		;a80a
	ld c,a			;a80c
	ld a,(ix+006h)		;a80d
	add a,a			;a810
	ld b,a			;a811
	cp c			;a812
	jr nc,L_A85F		;a813
	inc (ix+006h)		;a815
	ld h,0d8h		;a818
	ld l,(ix+007h)		;a81a
	ld e,(ix+002h)		;a81d
	ld a,0cah		;a820
L_A822:
	ld (0d8e0h),hl		;a822   ; guarda de paso (en p00:4D5A: 1 = el juego de dibujos solo pinta las listas 6 y 7) y el byte siguiente (16 bits)
	ld (0d8e2h),a		;a825   ; guarda de paso (en p01:62B5: 0 copia con ldir, 1 caracter a caracter)
	ld d,(ix+003h)		;a828
	push de			;a82b
	push bc			;a82c
	ld a,d			;a82d
	add a,c			;a82e
	add a,b			;a82f
	ld d,a			;a830
	ld a,(0d8e2h)		;a831   ; lee de paso (en p01:62B5: 0 copia con ldir, 1 caracter a caracter)
	rra			;a834
	ld h,0e6h		;a835
	jr nc,L_A83A		;a837
	inc h			;a839
L_A83A:
	ld a,(0d8e1h)		;a83a
	ld l,a			;a83d
	call L_A84C		;a83e
	pop bc			;a841
	pop de			;a842
	ld a,(0d8e1h)		;a843
	ld l,a			;a846
	ld a,(0d8e2h)		;a847   ; lee de paso (en p01:62B5: 0 copia con ldir, 1 caracter a caracter)
	add a,b			;a84a
	ld h,a			;a84b
L_A84C:
	ld a,c			;a84c
	sub b			;a84d
	ld b,a			;a84e
	ld a,(0d8e0h)		;a84f   ; lee de paso (en p00:4D5A: 1 = el juego de dibujos solo pinta las listas 6 y 7)
	ld c,a			;a852
L_A853:
	ld a,(0ca42h)		;a853   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	and 003h		;a856
	rlca			;a858
	rlca			;a859
	rlca			;a85a
	rlca			;a85b
	jp 047edh		;a85c   ; copia_rectangulo_logica: orden LMMM del VDP con la operacion logica de A
L_A85F:
	ld a,(ix+008h)		;a85f
	rrca			;a862
	rrca			;a863
	rrca			;a864
	and 01fh		;a865
	ld b,a			;a867
	ld a,(ix+007h)		;a868
	sub 004h		;a86b
L_A86D:
	call L_A263		;a86d
	call L_A890		;a870
	ld a,(ix+001h)		;a873
	cp 004h		;a876
	jr nz,L_A887		;a878
	ld a,(ix+000h)		;a87a
	cp 013h		;a87d
	jr z,L_A88B		;a87f
	sub 00bh		;a881
	cp 002h		;a883
	jr c,L_A88B		;a885
L_A887:
	inc (ix+001h)		;a887
	ret			;a88a
L_A88B:
	ld (ix+001h),000h		;a88b
	ret			;a88f
L_A890:
	add a,l			;a890
	sub 008h		;a891
	ld l,a			;a893
	call 04411h		;a894   ; punto_a_mapa: H = X, L = Y en puntos; A = X / 8, la columna
	push hl			;a897
	push bc			;a898
	call L_A8B0		;a899
	pop bc			;a89c
	pop hl			;a89d
	ld a,018h		;a89e
	call 0423eh		;a8a0   ; suma_a_hl: HL = HL + A
	call L_A8B0		;a8a3
L_A8A6:
	ld a,(ix+009h)		;a8a6
	and a			;a8a9
	ret z			;a8aa
	xor a			;a8ab
	ld (0cb3ch),a		;a8ac
	ret			;a8af
L_A8B0:
	ld a,(ix+001h)		;a8b0
	cp 004h		;a8b3
	ld a,080h		;a8b5
	jr z,L_A8BA		;a8b7
	xor a			;a8b9
L_A8BA:
	ld (hl),a			;a8ba
	inc hl			;a8bb
	djnz L_A8B0		;a8bc
	ret			;a8be
L_A8BF:
	ld a,(ix+001h)		;a8bf
	call 0424dh		;a8c2   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_A8C5: 4 destinos del despachador p00:424D (call en p15:A8C2, el
;   indice en A): A8CD, A8FE, A635, A9AB; lo leen p15:A8C2 (8 bytes)
;   0xa8c5..0xa8cd  (8 bytes)
DATA_tabla_A8C5:
	defw 0a8cdh,0a8feh,0a635h,0a9abh	; a8c5  -> L_A8CD L_A8FE L_A635 L_A9AB

; ======================================================================
; CODIGO 0xa8cd..0xa926  (89 bytes)
; ======================================================================


L_A8CD:
	ld a,(ix+009h)		;a8cd
	and a			;a8d0
	jp nz,L_A5C6		;a8d1
	ld a,(0cb31h)		;a8d4   ; lee 1 en el estado 2 de Snake
	and a			;a8d7
	ret nz			;a8d8
	call L_A528		;a8d9
	ret nz			;a8dc
	call L_A399		;a8dd
	ret nc			;a8e0
	call L_A263		;a8e1
	ld a,(0cb03h)		;a8e4   ; lee la Y de Snake
	sub l			;a8e7
	neg		;a8e8
	cp 008h		;a8ea
	ret nc			;a8ec
	ld a,(ix+008h)		;a8ed
	sub 010h		;a8f0
	ld b,a			;a8f2
	ld a,(0cb05h)		;a8f3   ; lee la X de Snake
	sub h			;a8f6
	sub 008h		;a8f7
	cp b			;a8f9
	ret nc			;a8fa
	jp L_A5C6		;a8fb
L_A8FE:
	ld b,(ix+008h)		;a8fe
	srl b		;a901
	ld a,(ix+006h)		;a903
	cp b			;a906
	jp nc,L_A628		;a907
	inc (ix+006h)		;a90a
	inc (ix+006h)		;a90d
	ld a,b			;a910
	sub (ix+006h)		;a911
	call L_A263		;a914
	add a,h			;a917
	ld h,a			;a918
	ld a,(ix+006h)		;a919
	add a,a			;a91c
	jp L_A614		;a91d
L_A920:
	ld a,(ix+001h)		;a920
	call 0424dh		;a923   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_A926: 4 destinos del despachador p00:424D (call en p15:A923, el
;   indice en A): A92E, A938, A4F4, A9AB; lo leen p15:A923 (8 bytes)
;   0xa926..0xa92e  (8 bytes)
DATA_tabla_A926:
	defw 0a92eh,0a938h,0a4f4h,0a9abh	; a926  -> L_A92E L_A938 L_A4F4 L_A9AB

; ======================================================================
; CODIGO 0xa92e..0xa9d4  (166 bytes)
; ======================================================================


L_A92E:
	call L_A44B		;a92e
	ret nc			;a931
	call L_A5C6		;a932
	jp L_A7E9		;a935
L_A938:
	ld a,(ix+008h)		;a938
	srl a		;a93b
	ld c,a			;a93d
	ld a,(ix+006h)		;a93e
	ld b,a			;a941
	cp c			;a942
	jp nc,L_A85F		;a943
	inc (ix+006h)		;a946
	push bc			;a949
	call L_A961		;a94a
	pop bc			;a94d
	ld a,(ix+002h)		;a94e
	add a,003h		;a951
	ld e,a			;a953
	ld a,(ix+007h)		;a954
	sub 003h		;a957
	ld l,a			;a959
	ld h,0dbh		;a95a
	ld a,0c9h		;a95c
	jp L_A822		;a95e
L_A961:
	push bc			;a961
	call L_A263		;a962
	push hl			;a965
	ld e,l			;a966
	ld a,h			;a967
	add a,003h		;a968
	ld d,a			;a96a
	ld a,0cch		;a96b
	add a,b			;a96d
	ld h,a			;a96e
	ld l,0d8h		;a96f
	ld b,008h		;a971
	ld c,003h		;a973
L_A975:
	call L_A99A		;a975
	inc b			;a978
	dec h			;a979
	inc l			;a97a
	dec d			;a97b
	inc e			;a97c
	dec c			;a97d
	jr nz,L_A975		;a97e
	pop hl			;a980
	pop bc			;a981
	ld e,l			;a982
	ld a,h			;a983
	add a,c			;a984
	add a,b			;a985
	ld d,a			;a986
	ld hl,0e7d8h		;a987
	ld a,008h		;a98a
	sub b			;a98c
	ld b,a			;a98d
	ld c,003h		;a98e
L_A990:
	call L_A99A		;a990
	inc b			;a993
	inc l			;a994
	inc e			;a995
	dec c			;a996
	jr nz,L_A990		;a997
	ret			;a999
L_A99A:
	ld a,b			;a99a
	and a			;a99b
	ret z			;a99c
	rla			;a99d
	ret c			;a99e
	push hl			;a99f
	push de			;a9a0
	push bc			;a9a1
	ld c,001h		;a9a2
	call L_A853		;a9a4
	pop bc			;a9a7
	pop de			;a9a8
	pop hl			;a9a9
	ret			;a9aa
L_A9AB:
	xor a			;a9ab
	ld (0d444h),a		;a9ac
	inc a			;a9af
	ld (0d4f1h),a		;a9b0
	call L_A9DC		;a9b3
	ld a,(0ca4ah)		;a9b6   ; lee la zona
	ld hl,0b4b5h		;a9b9
	call 043f6h		;a9bc   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ex de,hl			;a9bf
	ld l,(ix+005h)		;a9c0
	ld h,000h		;a9c3
	ld c,l			;a9c5
	ld b,h			;a9c6
	add hl,hl			;a9c7
	add hl,bc			;a9c8
	add hl,de			;a9c9
	ld a,(hl)			;a9ca
	rlca			;a9cb
	rlca			;a9cc
	and 003h		;a9cd
	inc hl			;a9cf
	ex de,hl			;a9d0
	call 0424dh		;a9d1   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_A9D4: 4 destinos del despachador p00:424D (call en p15:A9D1, el
;   indice en A): A9ED, AB4F, AC5E, ACCD; lo leen p15:A9D1 (8 bytes)
;   0xa9d4..0xa9dc  (8 bytes)
DATA_tabla_A9D4:
	defw 0a9edh,0ab4fh,0ac5eh,0accdh	; a9d4  -> L_A9ED L_AB4F L_AC5E L_ACCD

; ======================================================================
; CODIGO 0xa9dc..0xac11  (565 bytes)
; ======================================================================


L_A9DC:
	ld hl,0dc00h		;a9dc   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	ld bc,0000fh		;a9df
	ld a,0e0h		;a9e2
	call 04237h		;a9e4   ; llena_bloque: pone A en BC + 1 bytes desde HL
	call 067efh		;a9e7   ; sprites_a_vram_bancos_15:
	jp 067cdh		;a9ea   ; cambia_tablas_de_sprites: alterna las tablas de sprites de la VRAM: atributos en 0xF600 o 0xF200, colores en 0xF400 o 0xF000
L_A9ED:
	call L_AAF6		;a9ed
	push af			;a9f0
	push bc			;a9f1
	ld a,(hl)			;a9f2
	and 03fh		;a9f3
	ld hl,0ca4ah		;a9f5   ; apunta a la zona
	cp (hl)			;a9f8
	jr z,L_AA08		;a9f9
	push bc			;a9fb
	call 08d5bh		;a9fc   ; cambia_de_zona_b_1_2_15: cambia_de_zona y deja los bancos 1, 2 y 15
	pop bc			;a9ff
	call L_ABB9		;aa00
	call 05afeh		;aa03   ; copia_a_c700: copia en 0xC700 la zona, la sala especial, la Y y la X de Snake y 0xCA50-0xCA51 (salvo en la zona 0x10)
	jr L_AA0B		;aa06
L_AA08:
	call L_ABB9		;aa08
L_AA0B:
	call 07baah		;aa0b   ; borra_lo_de_la_sala: borra 0xD400-0xD415, las 24 fichas de 0x40 bytes desde 0xCE2E (18 bytes de cada una), 0xD460-0xD4BF y 0xD4C0-0xD4DF
	call 08d4bh		;aa0e
	pop bc			;aa11
	pop af			;aa12
	call L_AAA2		;aa13
	call 08d37h		;aa16   ; entra_en_sala_b_1_2_15: entra_en_sala y deja los bancos 1, 2 y 15
	ld a,(0ca4ah)		;aa19   ; lee la zona
	cp 00ch		;aa1c
	jr z,L_AA6C		;aa1e
	cp 00dh		;aa20
	jr z,L_AA7C		;aa22
	cp 004h		;aa24
	jr nz,L_AA5C		;aa26
	ld a,(0ca4bh)		;aa28   ; lee la sala de la zona
	cp 009h		;aa2b
	jr z,L_AA5F		;aa2d
	ld bc,00000h		;aa2f
	cp 011h		;aa32
	jr z,L_AA4D		;aa34
	cp 006h		;aa36
	jr z,L_AA85		;aa38
	ld bc,00001h		;aa3a
	cp 016h		;aa3d
	jr z,L_AA4D		;aa3f
	ld bc,00100h		;aa41
	cp 007h		;aa44
	jr nz,L_AA5C		;aa46
	call L_AA8C		;aa48
	jr nz,L_AA5C		;aa4b
L_AA4D:
	ld a,b			;aa4d
	ld (0d4e4h),a		;aa4e
	ld a,c			;aa51
	ld (0d4e2h),a		;aa52
	ld a,(0ca5fh)		;aa55   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	and a			;aa58
	call z,07a43h		;aa59   ; musica_de_la_zona_bancos_15:
L_AA5C:
	jp 04606h		;aa5c   ; enciende_todo: la pantalla y los sprites encendidos
L_AA5F:
	ld a,(0ca5fh)		;aa5f   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	and a			;aa62
	ret z			;aa63
	call 059efh		;aa64   ; limpia_sprites_y_d300:
	call 07ba1h		;aa67   ; a_p04_924c_3: p04:924C con el banco 4 en 0x8000
	jr L_AA5C		;aa6a
L_AA6C:
	ld a,(0ca4bh)		;aa6c   ; lee la sala de la zona
	cp 006h		;aa6f
	jr z,L_AA5F		;aa71
	cp 003h		;aa73
	jr nz,L_AA5C		;aa75
	call 06b99h		;aa77   ; sonido_8c: pide el sonido 0x8C (de los que tienen la partitura en un banco de musica, p16:4CE3) (antes, L_6CDA)
	jr L_AA5C		;aa7a
L_AA7C:
	ld a,(0ca4bh)		;aa7c   ; lee la sala de la zona
	cp 002h		;aa7f
	jr nz,L_AA5C		;aa81
	jr L_AA5F		;aa83
L_AA85:
	call L_AA8C		;aa85
	jr nz,L_AA5C		;aa88
	jr L_AA4D		;aa8a
L_AA8C:
	ld a,(0d694h)		;aa8c
	and a			;aa8f
	ret nz			;aa90
	ld a,(0d67ch)		;aa91
	and a			;aa94
	ret nz			;aa95
	ld a,(0d7d4h)		;aa96
	and 010h		;aa99
	jr z,L_AA9F		;aa9b
	xor a			;aa9d
	ret			;aa9e
L_AA9F:
	or 001h		;aa9f
	ret			;aaa1
L_AAA2:
	ld b,a			;aaa2
	ld a,(0d881h)		;aaa3
	inc a			;aaa6
	ret z			;aaa7
	ld a,(0ca4ah)		;aaa8   ; lee la zona
	cp 012h		;aaab
	ret nz			;aaad
	ld a,b			;aaae
	cp 005h		;aaaf
	jr z,L_AADF		;aab1
	cp 006h		;aab3
	ret nz			;aab5
	call 045f1h		;aab6   ; apaga_pantalla_y_sprites: p00:45CC y p00:45F6
	ld hl,0ca1ch		;aab9   ; apunta a 1: la pantalla partida en la linea 0xB4 (arriba con desplazamiento, abajo la pagina 1 sin sprites)
	ld a,(hl)			;aabc
	ld (0ca1dh),a		;aabd
	xor a			;aac0
	ld (0d8a4h),a		;aac1
	ld (hl),a			;aac4
	call 06077h		;aac5   ; borra_marcador_abajo_en: la franja de abajo (X = 0, Y = 0xC0, 0xE0 x 0x14) a 0 en la pagina A
	ld a,001h		;aac8
	call 06077h		;aaca   ; borra_marcador_abajo_en: la franja de abajo (X = 0, Y = 0xC0, 0xE0 x 0x14) a 0 en la pagina A
	call 08d56h		;aacd   ; rehace_marcador_b_1_2_15: rehace_marcador y deja los bancos 1, 2 y 15
	call 08d6dh		;aad0   ; a_p10_b9e5: p10:B9E5 con el banco 10 en 0xA000
	ld bc,00600h		;aad3
	call 00047h		;aad6   ; BIOS WRTVDP - Writes data in the VDP-register
	ld bc,00017h		;aad9
	jp 00047h		;aadc   ; BIOS WRTVDP - Writes data in the VDP-register
L_AADF:
	ld a,001h		;aadf
	ld (0d8a4h),a		;aae1
	ld (0ca42h),a		;aae4   ; guarda la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	ld a,(0ca1dh)		;aae7
	ld (0ca1ch),a		;aaea   ; guarda 1: la pantalla partida en la linea 0xB4 (arriba con desplazamiento, abajo la pagina 1 sin sprites)
	ld bc,01600h		;aaed
	call 00047h		;aaf0   ; BIOS WRTVDP - Writes data in the VDP-register
	jp 045f1h		;aaf3   ; apaga_pantalla_y_sprites: p00:45CC y p00:45F6
L_AAF6:
	ex de,hl			;aaf6
	push hl			;aaf7
	ld a,(hl)			;aaf8
	rrca			;aaf9
	rrca			;aafa
	rrca			;aafb
	rrca			;aafc
	and 00fh		;aafd
	ld (0ca50h),a		;aaff   ; guarda la fila de la sala en la zona (uno mas al salir por arriba)
	ld a,(hl)			;ab02
	and 00fh		;ab03
	ld (0ca51h),a		;ab05   ; guarda la columna de la sala en la zona (uno mas al salir por la derecha)
	inc hl			;ab08
	ld a,(hl)			;ab09
	ld (0d44ah),a		;ab0a
	push af			;ab0d
	call L_ACDE		;ab0e
	pop bc			;ab11
	pop hl			;ab12
	dec hl			;ab13
	ld a,001h		;ab14
	ld (0d8ceh),a		;ab16   ; guarda con 1, lo de 0xD8C2 se acaba (p07:A03A)
	ld (0cb14h),a		;ab19   ; guarda el dibujo del paso de andar (0, 1, 2, 1: p02:9888)
	ld d,(ix+000h)		;ab1c
	ld (ix+000h),000h		;ab1f
	ld a,(0cb00h)		;ab23   ; lee el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	cp 002h		;ab26
	jr z,L_AB2E		;ab28
	cp 00bh		;ab2a
	ld a,d			;ab2c
	ret nz			;ab2d
L_AB2E:
	ld a,(0cb35h)		;ab2e
	ld (0cb00h),a		;ab31   ; guarda el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	ld (0cb01h),a		;ab34   ; guarda el dibujo de Snake (al darse la vuelta se le suma 1, 3 o 5 segun 0xCB00)
	xor a			;ab37
	ld (0cb28h),a		;ab38
	ld (0cb0ah),a		;ab3b   ; guarda la marcha de Snake: el indice de las velocidades de p02:9520
	ld (0cb16h),a		;ab3e   ; guarda 1 mientras Snake se da la vuelta
	ld (0cb31h),a		;ab41   ; guarda 1 en el estado 2 de Snake
	inc a			;ab44
	ld (0cb14h),a		;ab45   ; guarda el dibujo del paso de andar (0, 1, 2, 1: p02:9888)
	ld a,020h		;ab48
	ld (0cb29h),a		;ab4a
	ld a,d			;ab4d
	ret			;ab4e
L_AB4F:
	call L_AAF6		;ab4f
	ld a,(hl)			;ab52
	and 03fh		;ab53
	ld (0ca76h),a		;ab55   ; guarda la sala especial (0 = ninguna; indice de p24:64B6)
	push de			;ab58
	push bc			;ab59
	call 07baah		;ab5a   ; borra_lo_de_la_sala: borra 0xD400-0xD415, las 24 fichas de 0x40 bytes desde 0xCE2E (18 bytes de cada una), 0xD460-0xD4BF y 0xD4C0-0xD4DF
	call 08d4bh		;ab5d
	call 08d50h		;ab60   ; mapas_de_bits_especiales_b_1_2_15: mapas_de_bits_especiales y deja los bancos 1, 2 y 15
	call 08d46h		;ab63   ; lineas_c3_en_la_otra_b_1_2_15: lineas_c3_en_la_otra y deja los bancos 1, 2 y 15
	xor a			;ab66
	ld (0d44ch),a		;ab67
	ld (0d44dh),a		;ab6a
	ld (0d44eh),a		;ab6d
	ld (0e070h),a		;ab70   ; guarda 2 fichas de 8 bytes [activa][..][Y][X] (cajas en p07:BE2D)
	ld (0e078h),a		;ab73
	pop bc			;ab76
	call L_ABB9		;ab77
	pop de			;ab7a
	call L_AC3B		;ab7b
	call 05f0ah		;ab7e   ; a_p12_69e0: p12:69E0 con el banco 12 en 0x6000
	call 08d2ah		;ab81   ; a_p10_bce4: p10:BCE4 con el banco 10 en 0xA000
	call 08d41h		;ab84   ; entra_en_sala_especial_1_b_1_2_15: entra_en_sala_especial_1 y deja los bancos 1, 2 y 15
	call 05f01h		;ab87   ; a_p12_67e1: p12:67E1 con el banco 12 en 0x6000
	ld a,(0ca76h)		;ab8a   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 002h		;ab8d
	jr z,L_ABA4		;ab8f
	cp 026h		;ab91
	jr z,L_ABB0		;ab93
	cp 031h		;ab95
	jr z,L_AB9C		;ab97
	cp 039h		;ab99
	ret nz			;ab9b
L_AB9C:
	ld a,001h		;ab9c
	ld (0d4e2h),a		;ab9e
	jp 08d60h		;aba1
L_ABA4:
	ld hl,0012ch		;aba4
	ld (0caf7h),hl		;aba7   ; guarda otra espera de 16 bits que baja en la interrupcion
	ld a,001h		;abaa
	ld (0caf6h),a		;abac
	ret			;abaf
L_ABB0:
	ld a,(0ca51h)		;abb0   ; lee la columna de la sala en la zona (uno mas al salir por la derecha)
	cp 007h		;abb3
	ret nz			;abb5
	jp 06aeah		;abb6   ; sonido_35: pide el sonido 0x35
L_ABB9:
	ld a,(0ca4ah)		;abb9   ; lee la zona
	ld c,a			;abbc
	cp 012h		;abbd
	jr nz,L_ABD9		;abbf
	ld hl,(0ca50h)		;abc1   ; lee la fila de la sala en la zona (uno mas al salir por arriba) y el byte siguiente (16 bits)
	ld a,l			;abc4
	cp 002h		;abc5
	jr nz,L_ABD9		;abc7
	ld a,h			;abc9
	cp 008h		;abca
	jr nz,L_ABD9		;abcc
	ld a,060h		;abce
	ld (0cb03h),a		;abd0   ; guarda la Y de Snake
	ld a,070h		;abd3
	ld (0cb05h),a		;abd5   ; guarda la X de Snake
	ret			;abd8
L_ABD9:
	ld a,(0ca76h)		;abd9   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	and a			;abdc
	ld hl,0b1feh		;abdd
	jr nz,L_ABE6		;abe0
	ld a,c			;abe2
	ld hl,0ad0ch		;abe3
L_ABE6:
	call 043f6h		;abe6   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld a,005h		;abe9
	call 0423eh		;abeb   ; suma_a_hl: HL = HL + A
L_ABEE:
	ld a,(hl)			;abee
	cp b			;abef
	jr z,L_ABF9		;abf0
	ld a,006h		;abf2
	call 0423eh		;abf4   ; suma_a_hl: HL = HL + A
	jr L_ABEE		;abf7
L_ABF9:
	dec hl			;abf9
	dec hl			;abfa
	ld e,(hl)			;abfb
	dec hl			;abfc
	ld d,(hl)			;abfd
	dec hl			;abfe
	ld a,(hl)			;abff
	ld hl,0ac0fh		;ac00
	call 043f6h		;ac03   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld a,h			;ac06
	add a,d			;ac07
	ld (0cb03h),a		;ac08   ; guarda la Y de Snake
	ld a,l			;ac0b
	add a,e			;ac0c
	ld (0cb05h),a		;ac0d   ; guarda la X de Snake
	ret			;ac10

; ----------------------------------------------------------------------
; DATOS sin identificar  0xac11..0xac3b  (42 bytes)
DATA_AC11:
	defb 00ch,024h,00ch,000h,00ch,02ch,0f4h,02ch,018h,024h,018h,000h,00ch,020h,010h,000h	; ac11  .$...,.,.$... ..
	defb 00ch,022h,010h,024h,00ch,024h,00ch,024h,00ch,024h,028h,000h,014h,000h,010h,000h	; ac21  .".$.$.$.$(.....
	defb 010h,020h,010h,010h,00ch,024h,038h,000h,00dh,022h	; ac31  . ...$8.."

; ======================================================================
; CODIGO 0xac3b..0xad0c  (209 bytes)
; ======================================================================


L_AC3B:
	ld a,(0ca5fh)		;ac3b   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	and a			;ac3e
	ret z			;ac3f
	ld a,(0ca76h)		;ac40   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 002h		;ac43
	jp z,07ba1h		;ac45   ; a_p04_924c_3: p04:924C con el banco 4 en 0x8000
	cp 029h		;ac48
	jp z,07ba1h		;ac4a   ; a_p04_924c_3: p04:924C con el banco 4 en 0x8000
	cp 02dh		;ac4d
	jp z,07ba1h		;ac4f   ; a_p04_924c_3: p04:924C con el banco 4 en 0x8000
	cp 031h		;ac52
	jp z,07ba1h		;ac54   ; a_p04_924c_3: p04:924C con el banco 4 en 0x8000
	ld a,d			;ac57
	cp 00ch		;ac58
	ret nz			;ac5a
	jp 07ba1h		;ac5b   ; a_p04_924c_3: p04:924C con el banco 4 en 0x8000
L_AC5E:
	call L_AAF6		;ac5e
	ld a,(hl)			;ac61
	and 03fh		;ac62
	ld (0ca4ah),a		;ac64   ; guarda la zona
	ld a,(0ca76h)		;ac67   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	push af			;ac6a
	push bc			;ac6b
	call 08d3ch		;ac6c   ; p02:8D3C
	xor a			;ac6f
	ld (0ca76h),a		;ac70   ; guarda la sala especial (0 = ninguna; indice de p24:64B6)
	call 07baah		;ac73   ; borra_lo_de_la_sala: borra 0xD400-0xD415, las 24 fichas de 0x40 bytes desde 0xCE2E (18 bytes de cada una), 0xD460-0xD4BF y 0xD4C0-0xD4DF
	call 08d4bh		;ac76
	pop bc			;ac79
	call L_ABB9		;ac7a
	ld hl,0d300h		;ac7d   ; apunta a las 4 fichas de actor de los que llegan con la alerta (los actores 20-23)
	ld bc,000ffh		;ac80
	call 04236h		;ac83   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	ld a,(0d820h)		;ac86
	cp 008h		;ac89
	jr nz,L_AC97		;ac8b
	ld a,080h		;ac8d
	ld (0d823h),a		;ac8f
	ld a,078h		;ac92
	ld (0d825h),a		;ac94
L_AC97:
	call 08d37h		;ac97   ; entra_en_sala_b_1_2_15: entra_en_sala y deja los bancos 1, 2 y 15
	call 05f01h		;ac9a   ; a_p12_67e1: p12:67E1 con el banco 12 en 0x6000
	ld c,004h		;ac9d
	call 08d65h		;ac9f   ; a_p11_bdbd_2: p11:BDBD con el banco 11 en 0xA000
	pop af			;aca2
	cp 002h		;aca3
	jr z,L_ACB9		;aca5
	cp 031h		;aca7
	jr z,L_ACB2		;aca9
	cp 039h		;acab
	ret nz			;acad
	xor a			;acae
	ld (0d43bh),a		;acaf
L_ACB2:
	xor a			;acb2
	ld (0d4e2h),a		;acb3
	jp 07a43h		;acb6   ; musica_de_la_zona_bancos_15:
L_ACB9:
	ld a,(0caf6h)		;acb9
	dec a			;acbc
	dec a			;acbd
	jp z,06be0h		;acbe   ; orden_sonido_f3: la orden 0xF3 al sonido
	dec a			;acc1
	ret nz			;acc2
	xor a			;acc3
	ld (0c690h),a		;acc4
	ld (0d443h),a		;acc7
	jp 08d60h		;acca   ; p02:8D60
L_ACCD:
	call L_AAF6		;accd
	push bc			;acd0
	call 07baah		;acd1   ; borra_lo_de_la_sala: borra 0xD400-0xD415, las 24 fichas de 0x40 bytes desde 0xCE2E (18 bytes de cada una), 0xD460-0xD4BF y 0xD4C0-0xD4DF
	call 08d4bh		;acd4   ; p02:8D4B
	pop bc			;acd7
	call L_ABB9		;acd8
	jp 08d41h		;acdb   ; entra_en_sala_especial_1_b_1_2_15: entra_en_sala_especial_1 y deja los bancos 1, 2 y 15
L_ACDE:
	ld b,a			;acde
	rla			;acdf
	ret c			;ace0
	ld a,(0ca4ah)		;ace1   ; lee la zona
	ld hl,0b153h		;ace4
	call 043f6h		;ace7   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld a,b			;acea
	ld de,0d580h		;aceb
	call 04243h		;acee   ; suma_a_de: DE = DE + A
L_ACF1:
	ld a,(hl)			;acf1
	cp 0ffh		;acf2
	jr z,L_AD08		;acf4
	and 07fh		;acf6
	cp b			;acf8
	jr z,L_ACFE		;acf9
	inc hl			;acfb
	jr L_ACF1		;acfc
L_ACFE:
	ld a,(hl)			;acfe
	rla			;acff
	ld a,0ffh		;ad00
	jr c,L_AD06		;ad02
	ld a,004h		;ad04
L_AD06:
	ld (de),a			;ad06
	ret			;ad07
L_AD08:
	ld a,001h		;ad08
	ld (de),a			;ad0a
	ret			;ad0b

; ----------------------------------------------------------------------
; DATOS resto_AD0C: lo apuntan con el banco puesto p15:A05E (0xAD0C), p15:ABE3
;   (0xAD0C), p00:4151 (0xB000), p00:41A7 (0xB000), p03:A160 (0xB000),
;   p15:ACE4 (0xB153); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p15:A05E, p15:ABE3, p00:4151, p00:41A7, p03:A160,
;   p15:ACE4 (2804 bytes)
;   0xad0c..0xb800  (2804 bytes)
DATA_resto_AD0C:
	defb 034h,0adh,03bh,0adh,08ah,0adh,09dh,0adh,088h,0aeh,02bh,0afh,092h,0afh,0cfh,0afh	; ad0c  4.........+.....
	defb 0e2h,0afh,0fbh,0afh,002h,0b0h,057h,0b0h,06ah,0b0h,083h,0b0h,0a2h,0b0h,089h,0adh	; ad1c  ......W.j.......
	defb 089h,0adh,089h,0adh,0afh,0b0h,034h,0b1h,008h,00ah,01ah,050h,001h,000h,0ffh,001h	; ad2c  ......4....P....
	defb 010h,0b8h,050h,001h,000h,003h,005h,010h,028h,006h,001h,004h,003h,068h,020h,003h	; ad3c  ..P.....(....h .
	defb 002h,006h,007h,046h,044h,000h,003h,008h,006h,0b8h,028h,006h,004h,00dh,007h,046h	; ad4c  ...FD.....(....F
	defb 034h,006h,005h,00eh,007h,006h,064h,003h,006h,00fh,007h,006h,064h,002h,007h,010h	; ad5c  4.....d.....d...
	defb 007h,006h,054h,003h,008h,012h,002h,0b8h,064h,003h,009h,013h,002h,0b8h,064h,002h	; ad6c  ..T.....d.....d.
	defb 00ah,014h,002h,0a0h,054h,003h,00bh,016h,007h,006h,064h,004h,00ch,0ffh,003h,003h	; ad7c  ....T.....d.....
	defb 068h,040h,002h,000h,005h,004h,020h,07fh,001h,001h,008h,004h,080h,07fh,001h,002h	; ad8c  h@.... .........
	defb 0ffh,000h,004h,078h,0bfh,002h,000h,000h,004h,028h,0bfh,001h,001h,001h,003h,078h	; ad9c  ...x.....(.....x
	defb 000h,002h,002h,001h,003h,028h,000h,001h,003h,003h,001h,020h,054h,001h,004h,004h	; adac  .....(..... T...
	defb 001h,020h,054h,003h,005h,005h,001h,000h,044h,001h,006h,006h,004h,048h,0bfh,001h	; adbc  . T.....D....H..
	defb 007h,006h,001h,000h,044h,002h,008h,007h,003h,048h,000h,001h,009h,007h,001h,020h	; adcc  ....D....H.....
	defb 024h,004h,00ah,007h,001h,020h,084h,004h,00bh,008h,001h,080h,054h,004h,00ch,009h	; addc  $.... ......T...
	defb 001h,080h,054h,004h,00dh,009h,004h,060h,0bfh,004h,00eh,009h,001h,000h,024h,002h	; adec  ..T....`......$.
	defb 00fh,009h,001h,000h,084h,004h,010h,00ah,002h,0b8h,044h,001h,011h,00ah,003h,048h	; adfc  ..........D....H
	defb 000h,004h,012h,00ah,001h,000h,084h,001h,013h,00bh,002h,0b8h,044h,002h,014h,00bh	; ae0c  ............D...
	defb 001h,040h,084h,001h,015h,00ch,002h,0b8h,084h,004h,016h,00dh,002h,0b8h,024h,002h	; ae1c  .@............$.
	defb 017h,00dh,002h,0b8h,084h,004h,018h,00dh,001h,000h,024h,001h,019h,00dh,001h,000h	; ae2c  ..........$.....
	defb 084h,001h,01ah,00eh,002h,0b8h,084h,001h,01bh,00eh,001h,000h,024h,002h,01ch,011h	; ae3c  ............$...
	defb 002h,0b8h,024h,001h,01dh,011h,002h,0b8h,084h,001h,01eh,011h,004h,048h,0bfh,003h	; ae4c  ..$..........H..
	defb 01fh,012h,002h,0b8h,024h,002h,020h,012h,003h,048h,000h,003h,021h,012h,004h,048h	; ae5c  ....$. ..H..!..H
	defb 0bfh,001h,022h,013h,003h,048h,000h,001h,023h,014h,004h,050h,09fh,002h,024h,00ch	; ae6c  .."..H..#..P..$.
	defb 001h,000h,064h,001h,02eh,010h,002h,0b8h,064h,001h,02fh,0ffh,000h,001h,000h,024h	; ae7c  ..d.....d./....$
	defb 003h,000h,000h,004h,060h,0bfh,003h,001h,001h,003h,060h,000h,003h,002h,004h,00bh	; ae8c  ....`.....`.....
	defb 040h,024h,000h,003h,004h,00ch,040h,064h,0ffh,004h,005h,002h,0b8h,024h,003h,005h	; ae9c  @$....@d.....$..
	defb 005h,001h,020h,054h,004h,006h,006h,004h,028h,0bfh,004h,007h,007h,003h,028h,000h	; aeac  .. T....(.....(.
	defb 004h,008h,008h,004h,048h,09fh,001h,009h,009h,013h,000h,094h,001h,00ah,00ah,004h	; aebc  ....H...........
	defb 068h,03fh,001h,00bh,00ah,003h,068h,080h,001h,00ch,00bh,004h,048h,0bfh,004h,00dh	; aecc  h?....h.....H...
	defb 00ch,003h,048h,000h,004h,00eh,00dh,004h,068h,0bfh,003h,00fh,00eh,003h,068h,000h	; aedc  ..H.....h.....h.
	defb 003h,010h,00eh,002h,0b8h,094h,001h,011h,00fh,004h,068h,03fh,002h,012h,011h,001h	; aeec  ..........h?....
	defb 080h,024h,005h,013h,011h,001h,000h,084h,006h,014h,013h,001h,040h,064h,006h,015h	; aefc  .$..........@d..
	defb 014h,001h,080h,094h,006h,016h,016h,002h,0b8h,084h,006h,017h,016h,00dh,080h,028h	; af0c  ...............(
	defb 000h,018h,016h,00dh,040h,028h,000h,019h,016h,00dh,040h,088h,000h,01ah,0ffh,000h	; af1c  ....@(....@.....
	defb 003h,048h,020h,004h,000h,000h,004h,048h,0bfh,005h,001h,001h,009h,082h,034h,001h	; af2c  .H ....H......4.
	defb 002h,001h,003h,048h,000h,005h,003h,001h,009h,062h,094h,004h,004h,001h,009h,002h	; af3c  ...H.....b......
	defb 054h,002h,005h,002h,009h,082h,034h,002h,006h,002h,009h,002h,094h,004h,007h,003h	; af4c  T.....4.........
	defb 004h,060h,03fh,005h,008h,004h,002h,0b8h,054h,002h,009h,005h,009h,062h,074h,003h	; af5c  .`?.....T....bt.
	defb 00ah,005h,009h,002h,034h,005h,00bh,006h,003h,040h,020h,005h,00ch,006h,003h,028h	; af6c  ....4....@ ....(
	defb 0a0h,006h,00dh,007h,009h,082h,010h,001h,00eh,007h,002h,040h,094h,001h,00fh,008h	; af7c  ...........@....
	defb 009h,022h,074h,004h,010h,0ffh,002h,001h,000h,064h,001h,000h,007h,002h,0b8h,064h	; af8c  ."t......d.....d
	defb 001h,001h,007h,001h,000h,064h,004h,002h,00ch,002h,0b8h,064h,004h,003h,00dh,001h	; af9c  .....d.....d....
	defb 000h,054h,001h,004h,010h,002h,0b8h,054h,001h,005h,01dh,001h,020h,024h,003h,006h	; afac  .T.....T.... $..
	defb 01dh,001h,020h,084h,002h,007h,021h,001h,080h,094h,003h,008h,022h,001h,080h,024h	; afbc  .. ...!....."..$
	defb 001h,009h,0ffh,004h,002h,0b8h,064h,004h,000h,009h,009h,042h,064h,002h,001h,00ch	; afcc  ......d....Bd...
	defb 009h,042h,044h,002h,002h,0ffh,000h,015h,002h,014h,006h,000h,002h,002h,0b8h,014h	; afdc  .BD.............
	defb 006h,001h,009h,015h,002h,054h,005h,002h,00ah,002h,0b8h,054h,005h,003h,0ffh,001h	; afec  .....T.....T....
	defb 00ah,01ah,050h,004h,000h,0ffh,000h,002h,0b8h,044h,006h,000h,005h,011h,000h,060h	; affc  ..P......D.....`
	defb 007h,001h,00bh,008h,0b8h,060h,007h,002h,010h,012h,000h,060h,008h,003h,015h,008h	; b00c  .....`.....`....
	defb 0b8h,060h,008h,004h,015h,009h,042h,044h,008h,005h,00dh,009h,082h,054h,008h,006h	; b01c  .`....BD.....T..
	defb 00dh,009h,002h,094h,001h,007h,00fh,009h,002h,014h,002h,008h,012h,009h,002h,074h	; b02c  ...............t
	defb 008h,009h,014h,009h,022h,014h,004h,00ah,016h,004h,060h,05fh,004h,00bh,016h,002h	; b03c  ....".....`_....
	defb 030h,084h,001h,00ch,017h,009h,042h,074h,008h,00dh,0ffh,001h,002h,0b8h,054h,004h	; b04c  0.....Bt......T.
	defb 000h,006h,001h,000h,044h,006h,001h,008h,001h,040h,064h,007h,002h,0ffh,003h,001h	; b05c  ....D....@d.....
	defb 000h,064h,007h,000h,004h,001h,080h,024h,004h,001h,005h,001h,080h,084h,001h,002h	; b06c  .d.....$........
	defb 006h,002h,0b8h,064h,007h,003h,0ffh,000h,001h,000h,064h,007h,000h,001h,001h,080h	; b07c  ...d......d.....
	defb 084h,006h,001h,002h,002h,0b8h,064h,007h,002h,002h,001h,080h,034h,003h,003h,004h	; b08c  ......d.....4...
	defb 001h,080h,024h,006h,004h,0ffh,003h,001h,000h,064h,0ffh,000h,004h,002h,0b8h,064h	; b09c  ..$......d.....d
	defb 0ffh,001h,0ffh,000h,001h,020h,054h,003h,000h,001h,001h,000h,034h,0ffh,001h,001h	; b0ac  ..... T.....4...
	defb 004h,040h,0bfh,0ffh,002h,002h,003h,040h,020h,0ffh,003h,002h,004h,040h,09fh,0ffh	; b0bc  .@.....@ ....@..
	defb 004h,003h,003h,040h,020h,0ffh,005h,003h,002h,0a0h,054h,003h,006h,003h,004h,040h	; b0cc  ...@ .....T....@
	defb 09fh,001h,007h,003h,005h,000h,048h,004h,008h,004h,003h,050h,020h,001h,009h,005h	; b0dc  ......H....P ...
	defb 001h,040h,084h,005h,00ah,006h,002h,0b8h,034h,0ffh,00bh,006h,001h,040h,024h,000h	; b0ec  .@......4....@$.
	defb 00ch,006h,001h,040h,084h,003h,00dh,007h,001h,040h,024h,004h,00eh,008h,006h,0b8h	; b0fc  ...@.....@$.....
	defb 048h,004h,00fh,009h,002h,0b8h,084h,002h,010h,00ah,002h,0b8h,024h,000h,011h,00ah	; b10c  H...........$...
	defb 002h,0b8h,084h,004h,012h,00ah,001h,000h,044h,0ffh,013h,00bh,002h,0b8h,024h,001h	; b11c  ........D.....$.
	defb 014h,00ch,002h,0b8h,044h,0ffh,015h,0ffh,003h,001h,000h,084h,0ffh,000h,004h,002h	; b12c  ....D...........
	defb 0b8h,084h,0ffh,001h,004h,001h,000h,094h,009h,002h,005h,002h,0b8h,094h,009h,003h	; b13c  ................
	defb 005h,00dh,010h,048h,000h,004h,0ffh,080h,0b1h,07bh,0b1h,081h,0b1h,088h,0b1h,0a0h	; b14c  ...H.....{......
	defb 0b1h,0a7h,0b1h,0c6h,0b1h,080h,0b1h,0cbh,0b1h,0cfh,0b1h,0d0h,0b1h,0d9h,0b1h,0dch	; b15c  ................
	defb 0b1h,0e1h,0b1h,0e4h,0b1h,0e6h,0b1h,0e6h,0b1h,0e6h,0b1h,0eah,0b1h,0e7h,0b1h,006h	; b16c  ................
	defb 007h,009h,00ah,00ch,0ffh,000h,081h,002h,003h,084h,005h,0ffh,084h,005h,088h,00ah	; b17c  ................
	defb 00dh,013h,094h,099h,09ah,01bh,09ch,09dh,09eh,09fh,0a0h,0a1h,022h,023h,0a4h,0a5h	; b18c  ............"#..
	defb 026h,028h,0adh,0ffh,00dh,00eh,014h,095h,017h,0a4h,0ffh,000h,001h,002h,003h,004h	; b19c  &(..............
	defb 005h,086h,007h,008h,009h,00ah,00bh,00ch,00dh,08eh,00fh,010h,011h,012h,013h,014h	; b1ac  ................
	defb 015h,016h,017h,018h,019h,01ah,09bh,01ch,01dh,0ffh,000h,001h,002h,003h,0ffh,080h	; b1bc  ................
	defb 081h,082h,083h,0ffh,008h,089h,08bh,08ch,017h,098h,099h,09ah,0ffh,002h,003h,0ffh	; b1cc  ................
	defb 001h,002h,004h,005h,0ffh,001h,005h,0ffh,080h,081h,0ffh,080h,081h,0ffh,080h,085h	; b1dc  ................
	defb 086h,087h,089h,08ah,08ch,08dh,08eh,090h,091h,092h,094h,096h,097h,098h,099h,09ah	; b1ec  ................
	defb 09bh,09ch,09dh,0ffh,072h,0b2h,079h,0b2h,080h,0b2h,087h,0b2h,0ach,0b2h,0b3h,0b2h	; b1fc  ....r.y.........
	defb 0c0h,0b2h,0c7h,0b2h,0ceh,0b2h,0d5h,0b2h,0dch,0b2h,0e3h,0b2h,0f0h,0b2h,0f7h,0b2h	; b20c  ................
	defb 0feh,0b2h,011h,0b3h,018h,0b3h,01fh,0b3h,026h,0b3h,02dh,0b3h,034h,0b3h,03bh,0b3h	; b21c  ........&.-.4...
	defb 042h,0b3h,049h,0b3h,056h,0b3h,05dh,0b3h,064h,0b3h,06bh,0b3h,072h,0b3h,079h,0b3h	; b22c  B.I.V.].d.k.r.y.
	defb 080h,0b3h,087h,0b3h,08eh,0b3h,095h,0b3h,09ch,0b3h,0a3h,0b3h,0aah,0b3h,0b1h,0b3h	; b23c  ................
	defb 0beh,0b3h,0c5h,0b3h,0cch,0b3h,0ebh,0b3h,0f2h,0b3h,0f9h,0b3h,000h,0b4h,013h,0b4h	; b24c  ................
	defb 01ah,0b4h,021h,0b4h,028h,0b4h,053h,0b4h,05ah,0b4h,061h,0b4h,068h,0b4h,06fh,0b4h	; b25c  ..!.(.S.Z.a.h.o.
	defb 076h,0b4h,07dh,0b4h,0aeh,0b4h,000h,004h,048h,09fh,003h,00dh,0ffh,000h,002h,0b8h	; b26c  v.}.....H.......
	defb 044h,000h,00eh,0ffh,000h,002h,098h,054h,006h,00fh,0ffh,000h,004h,048h,09fh,006h	; b27c  D......T.....H..
	defb 010h,001h,002h,098h,054h,003h,011h,001h,003h,048h,020h,006h,012h,001h,004h,048h	; b28c  ....T....H ....H
	defb 09fh,009h,013h,001h,007h,026h,054h,003h,014h,002h,003h,048h,020h,009h,015h,0ffh	; b29c  .....&T....H ...
	defb 000h,004h,048h,09fh,002h,003h,0ffh,000h,003h,048h,020h,001h,004h,001h,003h,048h	; b2ac  ..H......H ....H
	defb 020h,001h,005h,0ffh,000h,002h,098h,054h,001h,025h,0ffh,000h,002h,098h,054h,003h	; b2bc   ......T.%....T.
	defb 026h,0ffh,000h,002h,098h,054h,004h,027h,0ffh,000h,002h,098h,054h,004h,028h,0ffh	; b2cc  &....T.'....T.(.
	defb 000h,002h,098h,054h,004h,029h,0ffh,000h,002h,098h,054h,004h,02ah,000h,001h,020h	; b2dc  ...T.)....T.*..
	defb 054h,004h,02bh,0ffh,000h,002h,0b8h,054h,001h,02ch,0ffh,000h,003h,048h,020h,002h	; b2ec  T.+....T.,...H .
	defb 02dh,0ffh,000h,002h,0b8h,044h,004h,01fh,000h,003h,048h,000h,001h,020h,000h,004h	; b2fc  -....D....H.. ..
	defb 048h,0bfh,001h,021h,0ffh,000h,003h,048h,020h,002h,022h,0ffh,000h,003h,048h,020h	; b30c  H..!...H ."...H
	defb 001h,023h,0ffh,000h,002h,098h,064h,006h,024h,0ffh,000h,002h,098h,064h,006h,025h	; b31c  .#....d.$....d.%
	defb 0ffh,000h,002h,098h,064h,005h,026h,0ffh,000h,00eh,07ch,028h,000h,027h,0ffh,000h	; b32c  ....d.&...|(.'..
	defb 00eh,07ch,028h,000h,028h,0ffh,000h,00eh,07ch,028h,000h,029h,0ffh,000h,002h,0b8h	; b33c  .|(.(...|(.)....
	defb 064h,000h,01bh,001h,002h,0b8h,064h,0ffh,01ch,0ffh,000h,002h,098h,054h,001h,012h	; b34c  d.....d......T..
	defb 0ffh,000h,002h,098h,054h,004h,013h,0ffh,000h,002h,098h,054h,002h,014h,0ffh,000h	; b35c  ....T......T....
	defb 002h,098h,054h,004h,015h,0ffh,000h,003h,048h,020h,005h,016h,0ffh,000h,002h,098h	; b36c  ..T.....H ......
	defb 054h,003h,017h,0ffh,000h,002h,098h,054h,005h,018h,0ffh,000h,004h,048h,09fh,005h	; b37c  T......T.....H..
	defb 019h,0ffh,000h,004h,048h,09fh,006h,01ah,0ffh,000h,002h,098h,054h,001h,01bh,0ffh	; b38c  ....H.......T...
	defb 000h,001h,020h,054h,001h,01ch,0ffh,000h,002h,098h,054h,004h,01dh,0ffh,000h,004h	; b39c  .. T......T.....
	defb 048h,09fh,005h,011h,0ffh,000h,002h,0b8h,054h,003h,00ah,001h,002h,0b8h,054h,001h	; b3ac  H.......T.....T.
	defb 00bh,0ffh,000h,002h,098h,054h,003h,00ch,0ffh,000h,002h,098h,054h,002h,00dh,0ffh	; b3bc  .....T......T...
	defb 000h,002h,0b8h,074h,002h,003h,000h,004h,068h,0bfh,003h,004h,000h,001h,000h,054h	; b3cc  ...t....h......T
	defb 001h,005h,001h,003h,068h,000h,003h,006h,002h,002h,0b8h,054h,001h,007h,0ffh,000h	; b3dc  ....h......T....
	defb 002h,0b8h,054h,002h,008h,0ffh,000h,002h,098h,054h,001h,016h,0ffh,000h,002h,098h	; b3ec  ..T......T......
	defb 054h,002h,017h,0ffh,000h,002h,0b8h,054h,008h,018h,001h,003h,048h,000h,004h,019h	; b3fc  T......T....H...
	defb 001h,001h,000h,054h,001h,01ah,0ffh,000h,002h,0b8h,054h,008h,01bh,0ffh,000h,002h	; b40c  ...T......T.....
	defb 098h,054h,004h,01ch,0ffh,000h,002h,098h,054h,008h,015h,0ffh,000h,002h,0b8h,054h	; b41c  .T......T......T
	defb 008h,00eh,000h,001h,000h,054h,008h,00fh,001h,004h,060h,0bfh,006h,010h,002h,002h	; b42c  .....T....`.....
	defb 0b8h,054h,008h,011h,002h,003h,060h,000h,006h,012h,002h,004h,060h,0bfh,007h,013h	; b43c  .T....`.....`...
	defb 003h,003h,060h,000h,007h,014h,0ffh,000h,002h,0b8h,054h,007h,003h,0ffh,000h,002h	; b44c  ..`.......T.....
	defb 098h,054h,004h,004h,0ffh,000h,002h,098h,054h,001h,005h,0ffh,000h,002h,098h,054h	; b45c  .T......T......T
	defb 006h,005h,0ffh,000h,002h,098h,054h,003h,006h,0ffh,000h,002h,098h,054h,006h,007h	; b46c  ......T......T..
	defb 0ffh,000h,002h,0b8h,024h,005h,016h,000h,002h,0b8h,084h,000h,017h,000h,001h,000h	; b47c  ....$...........
	defb 024h,002h,018h,000h,001h,000h,084h,000h,019h,001h,002h,0b8h,024h,003h,01ah,001h	; b48c  $...........$...
	defb 002h,0b8h,084h,004h,01bh,001h,001h,000h,024h,004h,01ch,001h,001h,000h,084h,001h	; b49c  ........$.......
	defb 01dh,0ffh,000h,014h,098h,028h,000h,005h,0ffh,0ddh,0b4h,0e1h,0b4h,024h,0b5h,037h	; b4ac  .....(.......$.7
	defb 0b5h,0c8h,0b5h,047h,0b6h,0a2h,0b6h,0cdh,0b6h,0e9h,0b6h,0f6h,0b6h,0fah,0b6h,052h	; b4bc  ...G...........R
	defb 0b7h,05fh,0b7h,072h,0b7h,08bh,0b7h,023h,0b5h,023h,0b5h,023h,0b5h,092h,0b7h,0edh	; b4cc  ._.r...#.#.#....
	defb 0b7h,001h,017h,000h,0ffh,000h,047h,000h,001h,029h,004h,041h,017h,00dh,042h,017h	; b4dc  ......G..).A..B.
	defb 00eh,001h,019h,001h,043h,017h,00fh,001h,055h,009h,001h,056h,00ah,044h,017h,011h	; b4ec  ....C...U..V.D..
	defb 001h,045h,006h,001h,046h,007h,044h,017h,014h,007h,019h,000h,081h,025h,002h,081h	; b4fc  .E..F.D......%..
	defb 027h,003h,081h,039h,005h,0c4h,017h,012h,081h,047h,008h,0c4h,016h,010h,0c4h,018h	; b50c  '..9.....G......
	defb 015h,081h,057h,00bh,0c4h,017h,013h,0ffh,045h,017h,003h,046h,017h,004h,046h,027h	; b51c  ..W.....E..F..F'
	defb 005h,082h,036h,000h,082h,038h,001h,082h,048h,002h,0ffh,003h,018h,002h,003h,018h	; b52c  ..6..8..H.......
	defb 003h,003h,017h,000h,003h,017h,001h,047h,017h,025h,048h,017h,026h,003h,037h,011h	; b53c  .......G.%H.&.7.
	defb 003h,029h,009h,003h,038h,014h,003h,028h,007h,04bh,017h,029h,04ch,017h,02ah,049h	; b54c  .)..8..(.K.)L.*I
	defb 017h,027h,04ah,017h,028h,003h,037h,012h,003h,046h,017h,003h,046h,018h,003h,027h	; b55c  .'J.(.7..F..F..'
	defb 006h,003h,036h,00eh,003h,047h,01bh,003h,028h,008h,04dh,017h,02ch,04ch,017h,02bh	; b56c  ..6..G..(.M.,L.+
	defb 003h,036h,00fh,003h,036h,010h,003h,056h,01dh,003h,056h,01eh,003h,037h,013h,003h	; b57c  .6..6..V..V..7..
	defb 057h,020h,003h,046h,019h,003h,046h,01ah,003h,057h,021h,003h,047h,01ch,003h,056h	; b58c  W .F..F..W!.G..V
	defb 01fh,003h,058h,023h,003h,057h,022h,04eh,017h,02dh,083h,025h,004h,083h,026h,005h	; b59c  ..X#.W"N.-.%..&.
	defb 083h,035h,00ch,083h,036h,00dh,083h,029h,00ah,083h,029h,00bh,083h,039h,016h,083h	; b5ac  .5..6..)..)..9..
	defb 038h,015h,083h,059h,024h,003h,049h,02fh,003h,039h,02eh,0ffh,004h,025h,005h,004h	; b5bc  8..Y$.I/.9...%..
	defb 016h,002h,004h,015h,001h,058h,017h,01bh,058h,018h,01ch,004h,015h,000h,04fh,017h	; b5cc  .....X..X.....O.
	defb 01fh,004h,027h,008h,004h,026h,007h,051h,017h,023h,004h,039h,011h,04fh,017h,020h	; b5dc  ..'..&.Q.#.9.O.
	defb 04fh,017h,021h,004h,037h,00eh,004h,036h,00dh,004h,039h,010h,004h,038h,00fh,004h	; b5ec  O.!.7..6..9..8..
	defb 029h,00ah,050h,017h,022h,054h,017h,026h,004h,057h,017h,052h,017h,024h,053h,017h	; b5fc  ).P."T.&.W.R.$S.
	defb 025h,004h,047h,014h,055h,017h,027h,056h,017h,028h,057h,017h,029h,084h,019h,003h	; b60c  %.G.U.'V.(W.)...
	defb 084h,019h,004h,084h,025h,006h,0cfh,027h,01fh,084h,025h,006h,084h,035h,00bh,084h	; b61c  ....%..'..%..5..
	defb 035h,00ch,084h,045h,012h,084h,028h,009h,084h,049h,015h,084h,055h,016h,084h,047h	; b62c  5..E..(..I..U..G
	defb 013h,084h,057h,018h,084h,057h,019h,084h,057h,01ah,0ffh,065h,017h,011h,005h,027h	; b63c  ..W..W..W..e...'
	defb 003h,059h,017h,012h,005h,026h,001h,05ah,017h,013h,005h,037h,009h,05bh,017h,014h	; b64c  .Y...&.Z...7.[..
	defb 05ch,017h,015h,05dh,017h,016h,005h,027h,005h,05eh,017h,017h,05fh,017h,018h,060h	; b65c  \..]...'.^.._..`
	defb 017h,019h,061h,017h,01ah,062h,017h,01bh,063h,017h,01ch,064h,017h,01dh,085h,026h	; b66c  ..a..b..c..d...&
	defb 000h,085h,027h,002h,085h,027h,004h,085h,028h,006h,085h,028h,007h,085h,036h,008h	; b67c  ..'..'..(..(..6.
	defb 085h,038h,00ah,085h,038h,00bh,085h,046h,00ch,085h,046h,00dh,085h,047h,00eh,085h	; b68c  .8..8..F..F..G..
	defb 047h,00fh,085h,048h,010h,0ffh,006h,037h,001h,006h,027h,000h,006h,047h,003h,006h	; b69c  G..H...7..'..G..
	defb 037h,002h,006h,058h,005h,006h,048h,004h,067h,017h,00ch,068h,017h,00dh,066h,016h	; b6ac  7..X..H.g..h..f.
	defb 00ah,066h,017h,00bh,086h,0c5h,008h,086h,0c6h,009h,086h,0b6h,006h,086h,0b6h,007h	; b6bc  .f..............
	defb 0ffh,001h,059h,00ch,069h,017h,003h,06ah,017h,008h,087h,029h,001h,0e9h,018h,006h	; b6cc  ..Y.i..j...)....
	defb 0e9h,027h,007h,0e9h,017h,004h,0e9h,017h,005h,087h,045h,002h,0ffh,008h,027h,001h	; b6dc  .'........E...'.
	defb 008h,017h,000h,008h,067h,003h,008h,057h,002h,0ffh,00bh,027h,000h,0ffh,00bh,046h	; b6ec  ....g..W...'...F
	defb 001h,00ah,044h,002h,00ah,034h,001h,00ah,064h,004h,00ah,054h,003h,071h,017h,00eh	; b6fc  ..D..4..d..T.q..
	defb 070h,017h,015h,06bh,017h,016h,06ch,017h,017h,06dh,017h,018h,06fh,017h,01ch,06dh	; b70c  p..k..l..m..o..m
	defb 027h,019h,06dh,027h,01ah,06eh,017h,01bh,08ah,064h,005h,0f1h,027h,011h,0f1h,027h	; b71c  '.m'.n...d..'..'
	defb 012h,0f1h,017h,00fh,0f1h,026h,010h,0f1h,028h,014h,0f1h,027h,013h,08ah,048h,006h	; b72c  .....&..(..'..H.
	defb 08ah,048h,007h,08ah,04ah,008h,08ah,058h,009h,08ah,068h,00bh,08ah,068h,00ch,08ah	; b73c  .H..J..X..h..h..
	defb 069h,00dh,08ah,05ah,00ah,0ffh,009h,017h,000h,00ah,016h,000h,072h,017h,003h,08bh	; b74c  i..Z........r...
	defb 048h,002h,0ffh,00ch,046h,003h,073h,017h,004h,074h,017h,005h,00ch,036h,000h,08ch	; b75c  H...F.s..t...6..
	defb 037h,001h,08ch,038h,002h,0ffh,00dh,046h,002h,075h,017h,005h,00dh,036h,000h,076h	; b76c  7..8...F.u...6.v
	defb 017h,006h,077h,017h,007h,08dh,037h,001h,08dh,046h,003h,08dh,048h,004h,0ffh,00eh	; b77c  ..w...7..F..H...
	defb 036h,001h,00eh,026h,000h,0ffh,012h,029h,006h,012h,037h,00bh,012h,028h,003h,012h	; b78c  6..&...)..7..(..
	defb 027h,002h,012h,029h,005h,012h,028h,004h,012h,019h,000h,012h,02ah,009h,012h,039h	; b79c  '..)..(.....*..9
	defb 00fh,012h,029h,007h,078h,017h,016h,012h,027h,001h,078h,017h,017h,078h,018h,01ah	; b7ac  ..).x...'.x..x..
	defb 078h,018h,01bh,012h,029h,008h,078h,017h,018h,078h,017h,019h,078h,018h,01ch,012h	; b7bc  x...).x..x..x...
	defb 057h,015h,078h,018h,01dh,012h,047h,013h,092h,036h,00ah,092h,037h,00ch,092h,046h	; b7cc  W.x...G..6..7..F
	defb 010h,092h,047h,011h,092h,037h,00dh,092h,038h,00eh,092h,047h,012h,092h,048h,014h	; b7dc  ..G..7..8..G..H.
	defb 0ffh,013h,038h,001h,013h,028h,000h,013h,048h,003h,013h,038h,002h,079h,017h,005h	; b7ec  ..8..(..H..8.y..
	defb 093h,048h,004h,0ffh	; b7fc

; ======================================================================
; CODIGO 0xb800..0xb919  (281 bytes)
; ======================================================================


L_B800:
	ld a,(ix+001h)		;b800
	cp 002h		;b803
	ret c			;b805
	jr nz,L_B80D		;b806
	ld a,(ix+01fh)		;b808
	and a			;b80b
	ret nz			;b80c
L_B80D:
	cp 004h		;b80d
	jp nc,L_B870		;b80f
	ld bc,00040h		;b812
	call 0872bh		;b815
	ld a,(ix+00dh)		;b818
	ld hl,0bc0ah		;b81b
	call 043f6h		;b81e   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	exx			;b821
	ld a,(ix+00fh)		;b822
	sub 028h		;b825
	ld d,a			;b827
	ld e,0c0h		;b828
	ld c,080h		;b82a
	exx			;b82c
	call L_B833		;b82d
	jp L_B8B9		;b830
L_B833:
	ld de,0dc28h		;b833
L_B836:
	ld c,(hl)			;b836
	inc hl			;b837
	ld b,(hl)			;b838
	inc hl			;b839
L_B83A:
	ld a,(hl)			;b83a
	add a,(ix+003h)		;b83b
	exx			;b83e
	add a,d			;b83f
	cp c			;b840
	exx			;b841
	jr c,L_B846		;b842
	ld a,0e0h		;b844
L_B846:
	ld (de),a			;b846
	inc hl			;b847
	ld a,(hl)			;b848
	add a,(ix+005h)		;b849
	exx			;b84c
	add a,e			;b84d
	exx			;b84e
	cp 0b0h		;b84f
	jr c,L_B858		;b851
	push af			;b853
	ld a,0e0h		;b854
	ld (de),a			;b856
	pop af			;b857
L_B858:
	inc de			;b858
	ld (de),a			;b859
	inc hl			;b85a
	inc de			;b85b
	ld a,c			;b85c
	ld (de),a			;b85d
	inc de			;b85e
	inc de			;b85f
	inc c			;b860
	inc c			;b861
	inc c			;b862
	inc c			;b863
	djnz L_B83A		;b864
	ret			;b866
L_B867:
	ld hl,0daa0h		;b867
	ld bc,0007fh		;b86a
	jp 04237h		;b86d   ; llena_bloque: pone A en BC + 1 bytes desde HL
L_B870:
	ld a,(0ca50h)		;b870   ; lee la fila de la sala en la zona (uno mas al salir por arriba)
	sub 007h		;b873
	cp 002h		;b875
	ld bc,0001fh		;b877
	call c,0872bh		;b87a
	call 08100h		;b87d
	ret nz			;b880
	ld a,(ix+00dh)		;b881
	ld hl,0bc40h		;b884
	call 043f6h		;b887   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	exx			;b88a
	ld de,00000h		;b88b
	ld c,0c0h		;b88e
	exx			;b890
	call L_B833		;b891
	ld a,(ix+018h)		;b894
	and a			;b897
	ld hl,0bca0h		;b898
	jr z,L_B8A0		;b89b
	ld hl,0bcaah		;b89d
L_B8A0:
	exx			;b8a0
	ld a,(ix+00dh)		;b8a1
	ld hl,0bbfah		;b8a4
	call 043f6h		;b8a7   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ex de,hl			;b8aa
	ld c,0c0h		;b8ab
	exx			;b8ad
	ld de,0dc38h		;b8ae
	call L_B836		;b8b1
	ld a,00fh		;b8b4
	call L_B867		;b8b6
L_B8B9:
	ld hl,0dc28h		;b8b9
	ld de,0daa0h		;b8bc
	ld b,008h		;b8bf
L_B8C1:
	push bc			;b8c1
	push hl			;b8c2
	push de			;b8c3
	ld a,(hl)			;b8c4
	sub 0b0h		;b8c5
	cp 010h		;b8c7
	jr nc,L_B8DC		;b8c9
	inc a			;b8cb
	ld c,a			;b8cc
	sub 010h		;b8cd
	neg		;b8cf
	call 04243h		;b8d1   ; suma_a_de: DE = DE + A
	ld h,d			;b8d4
	ld l,e			;b8d5
	inc de			;b8d6
	ld b,000h		;b8d7
	ld (hl),b			;b8d9
	ldir		;b8da
L_B8DC:
	pop de			;b8dc
	pop hl			;b8dd
	ld a,004h		;b8de
	call 0423eh		;b8e0   ; suma_a_hl: HL = HL + A
	ld a,010h		;b8e3
	call 04243h		;b8e5   ; suma_a_de: DE = DE + A
	pop bc			;b8e8
	djnz L_B8C1		;b8e9
	ret			;b8eb
L_B8EC:
	call L_B925		;b8ec
	jp nc,086a4h		;b8ef
	ld hl,06aeeh		;b8f2
	call 086d5h		;b8f5
	ld a,(ix+001h)		;b8f8
	ld hl,0b919h		;b8fb
	call 0424eh		;b8fe   ; salta_por_tabla: salta a la palabra A de la tabla de HL
	ld a,(ix+001h)		;b901
	cp 004h		;b904
	ret c			;b906
	call L_B925		;b907
	ld a,(ix+00ch)		;b90a
	call 08085h		;b90d
	ld a,(ix+001h)		;b910
	cp 004h		;b913
	ret c			;b915
	jp 08671h		;b916

; ----------------------------------------------------------------------
; DATOS resto_B919: lo apuntan con el banco puesto p15:B8FB (0xB919); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p15:B8FB (12 bytes)
;   0xb919..0xb925  (12 bytes)
DATA_resto_B919:
	defb 02dh,0b9h,059h,0b9h,07fh,0b9h,097h,0b9h,0d5h,0b9h,051h,0bah	; b919  -.Y.......Q.

; ======================================================================
; CODIGO 0xb925..0xba94  (367 bytes)
; ======================================================================


L_B925:
	ld a,(0ca4bh)		;b925   ; lee la sala de la zona
	sub 010h		;b928
	cp 004h		;b92a
	ret			;b92c
L_B92D:
	call 08100h		;b92d
	ret nz			;b930
	ld hl,0d7d2h		;b931
	set 3,(hl)		;b934
	ld a,001h		;b936
	ld (0cb3ch),a		;b938
	ld l,000h		;b93b
	ld c,060h		;b93d
	call L_B9C1		;b93f
	xor a			;b942
	ld (ix+00dh),a		;b943
	ld (ix+00fh),060h		;b946
	call 05065h		;b94a   ; sprites_de_6860:
	ld a,007h		;b94d
	call L_B867		;b94f
	ld (ix+00eh),010h		;b952
	jp L_B968		;b956
L_B959:
	dec (ix+00eh)		;b959
	ret nz			;b95c
	call 086c2h		;b95d   ; pon_musica_a6: 0xCA26 = 1, ninguna pendiente y el sonido 0xA6
	ld (ix+00eh),000h		;b960
	ld (ix+01fh),014h		;b964
L_B968:
	inc (ix+001h)		;b968
	ret			;b96b
L_B96C:
	ld a,(0ca42h)		;b96c   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	and a			;b96f
	ld a,048h		;b970
	jr z,L_B976		;b972
	ld a,018h		;b974
L_B976:
	ld b,030h		;b976
	ld h,b			;b978
	ld de,04800h		;b979
	jp 047edh		;b97c   ; copia_rectangulo_logica: orden LMMM del VDP con la operacion logica de A
L_B97F:
	ld a,(ix+01fh)		;b97f
	and a			;b982
	jr z,L_B989		;b983
	dec (ix+01fh)		;b985
	ret nz			;b988
L_B989:
	ld c,003h		;b989
	call L_B9FA		;b98b
	ld a,(ix+00eh)		;b98e
	cp 040h		;b991
	ret c			;b993
	jp L_B968		;b994
L_B997:
	ld a,(ix+00fh)		;b997
	cp 050h		;b99a
	ld c,001h		;b99c
	jr nc,L_B9A1		;b99e
	dec c			;b9a0
L_B9A1:
	call L_B9FA		;b9a1
	dec (ix+00fh)		;b9a4
	ld a,(ix+00fh)		;b9a7
	ld l,a			;b9aa
	ld e,a			;b9ab
	push af			;b9ac
	ld h,000h		;b9ad
	ld d,048h		;b9af
	ld bc,03001h		;b9b1
	call 0475ah		;b9b4   ; copia_rectangulo_a_la_otra: p00:4767 de la pagina 0xCA42 a la otra
	pop af			;b9b7
	jr z,L_B9CB		;b9b8
	ld c,(ix+00fh)		;b9ba
	ld a,060h		;b9bd
	sub c			;b9bf
	ld l,a			;b9c0
L_B9C1:
	ld de,04800h		;b9c1
	ld h,030h		;b9c4
	ld b,030h		;b9c6
	jp 0475ah		;b9c8   ; copia_rectangulo_a_la_otra: p00:4767 de la pagina 0xCA42 a la otra
L_B9CB:
	xor a			;b9cb
	ld (0cb3ch),a		;b9cc
	call 0504ch		;b9cf   ; sprites_de_670e: p35:670E a 0xFA00
	jp L_B968		;b9d2
L_B9D5:
	xor a			;b9d5
	ld (ix+00fh),a		;b9d6
	ld (ix+00dh),a		;b9d9
	ld (ix+018h),a		;b9dc
	ld (ix+009h),a		;b9df
	inc a			;b9e2
	ld (ix+016h),a		;b9e3
	ld (ix+007h),004h		;b9e6
	ld (ix+00ch),003h		;b9ea
	call L_BB99		;b9ee
	call 06b6dh		;b9f1   ; sonido_77: pide el sonido 0x77 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	call 06b12h		;b9f4   ; sonido_05: pide el sonido 0x05
	jp L_B968		;b9f7
L_B9FA:
	push bc			;b9fa
	call L_BA14		;b9fb
	pop bc			;b9fe
	inc (ix+00eh)		;b9ff
	ld a,(ix+00eh)		;ba02
	and c			;ba05
	ret nz			;ba06
	ld a,(ix+00dh)		;ba07
	inc a			;ba0a
	cp 003h		;ba0b
	jr c,L_BA10		;ba0d
	xor a			;ba0f
L_BA10:
	ld (ix+00dh),a		;ba10
	ret			;ba13
L_BA14:
	ld a,(ix+00eh)		;ba14
	and 008h		;ba17
	ld hl,02038h		;ba19
	jr z,L_BA21		;ba1c
	ld hl,05058h		;ba1e
L_BA21:
	push hl			;ba21
	ld e,018h		;ba22
	call L_BA2B		;ba24
	pop hl			;ba27
	ld h,l			;ba28
	ld e,030h		;ba29
L_BA2B:
	ld l,070h		;ba2b
	ld bc,00808h		;ba2d
	ld a,(ix+001h)		;ba30
	cp 002h		;ba33
	jr z,L_BA45		;ba35
	ld d,040h		;ba37
	ld a,(0ca42h)		;ba39   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	xor 001h		;ba3c
	rlca			;ba3e
	rlca			;ba3f
	or 002h		;ba40
	jp 04767h		;ba42   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
L_BA45:
	ld d,058h		;ba45
	ld a,(0ca42h)		;ba47   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	rlca			;ba4a
	rlca			;ba4b
	or 002h		;ba4c
	jp 04767h		;ba4e   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
L_BA51:
	call L_BB33		;ba51
	call L_BB42		;ba54
	call L_BBA4		;ba57
	call L_BAF1		;ba5a
	ld a,(ix+00dh)		;ba5d
	ld b,(ix+003h)		;ba60
	ld c,(ix+005h)		;ba63
	ld d,(ix+00ah)		;ba66
	ld e,(ix+00bh)		;ba69
	ld hl,0baa4h		;ba6c
	call 0424eh		;ba6f   ; salta_por_tabla: salta a la palabra A de la tabla de HL
	call c,L_BA7E		;ba72
	ld a,(ix+018h)		;ba75
	xor 001h		;ba78
	ld (ix+018h),a		;ba7a
	ret			;ba7d
L_BA7E:
	ld a,(ix+00dh)		;ba7e
	inc a			;ba81
	and 007h		;ba82
	ld (ix+00dh),a		;ba84
	ld hl,0ba94h		;ba87
	call 043f6h		;ba8a   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld (ix+009h),h		;ba8d
	ld (ix+007h),l		;ba90
	ret			;ba93

; ----------------------------------------------------------------------
; DATOS resto_BA94: lo apuntan con el banco puesto p15:BA87 (0xBA94), p15:BA6C
;   (0xBAA4); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p15:BA87, p15:BA6C (32 bytes)
;   0xba94..0xbab4  (32 bytes)
DATA_resto_BA94:
	defb 004h,000h,004h,004h,000h,004h,0fch,004h,0fch,000h,0fch,0fch,000h,0fch,004h,0fch	; ba94  ................
	defb 0b4h,0bah,0c1h,0bah,0c6h,0bah,0cdh,0bah,0d4h,0bah,0deh,0bah,0e3h,0bah,0eah,0bah	; baa4  ................

; ======================================================================
; CODIGO 0xbab4..0xbbfa  (326 bytes)
; ======================================================================


L_BAB4:
	ld hl,00740h		;bab4
L_BAB7:
	ld a,d			;bab7
	cp h			;bab8
	jr nz,L_BABF		;bab9
	ld a,b			;babb
	cp l			;babc
	ccf			;babd
	ret			;babe
L_BABF:
	or a			;babf
	ret			;bac0
L_BAC1:
	ld hl,00780h		;bac1
	jr L_BAB7		;bac4
L_BAC6:
	ld hl,00840h		;bac6
	ld d,e			;bac9
	ld b,c			;baca
	jr L_BAB7		;bacb
L_BACD:
	ld hl,00880h		;bacd
	ld d,e			;bad0
	ld b,c			;bad1
	jr L_BAB7		;bad2
L_BAD4:
	ld hl,00880h		;bad4
L_BAD7:
	ld a,d			;bad7
	cp h			;bad8
	jr nz,L_BABF		;bad9
	ld a,b			;badb
	cp l			;badc
	ret			;badd
L_BADE:
	ld hl,00840h		;bade
	jr L_BAD7		;bae1
L_BAE3:
	ld hl,00780h		;bae3
	ld d,e			;bae6
	ld b,c			;bae7
	jr L_BAD7		;bae8
L_BAEA:
	ld hl,00740h		;baea
	ld d,e			;baed
	ld b,c			;baee
	jr L_BAD7		;baef
L_BAF1:
	ld a,(ix+007h)		;baf1
	and a			;baf4
	jr nz,L_BB15		;baf5
	ld a,(ix+005h)		;baf7
	sub 0c0h		;bafa
	cp 040h		;bafc
	ret nc			;bafe
	ld a,(ix+009h)		;baff
	rla			;bb02
	jr c,L_BB0D		;bb03
	inc (ix+00bh)		;bb05
	ld (ix+005h),000h		;bb08
	ret			;bb0c
L_BB0D:
	dec (ix+00bh)		;bb0d
	ld (ix+005h),0c0h		;bb10
	ret			;bb14
L_BB15:
	ld a,(ix+003h)		;bb15
	sub 0c0h		;bb18
	cp 040h		;bb1a
	ret nc			;bb1c
	ld a,(ix+007h)		;bb1d
	rla			;bb20
	jr c,L_BB2B		;bb21
	dec (ix+00ah)		;bb23
	ld (ix+003h),000h		;bb26
	ret			;bb2a
L_BB2B:
	inc (ix+00ah)		;bb2b
	ld (ix+003h),0c0h		;bb2e
	ret			;bb32
L_BB33:
	ld a,(0ca4bh)		;bb33   ; lee la sala de la zona
	cp 010h		;bb36
	ret c			;bb38
	call 08100h		;bb39
	jp z,06af2h		;bb3c   ; sonido_36: pide el sonido 0x36
	jp 06c13h		;bb3f   ; sonido_37: pide el sonido 0x37
L_BB42:
	ld hl,0d8b7h		;bb42
	ld a,(hl)			;bb45
	and a			;bb46
	ret z			;bb47
	dec (hl)			;bb48
	rra			;bb49
	ld bc,00f07h		;bb4a
	jr c,L_BB51		;bb4d
	ld b,007h		;bb4f
L_BB51:
	jp 00047h		;bb51   ; BIOS WRTVDP - Writes data in the VDP-register
L_BB54:
	dec (ix+01fh)		;bb54
	ret nz			;bb57
	call 08100h		;bb58
	jr nz,L_BB99		;bb5b
	ld a,(ix+00fh)		;bb5d
	and a			;bb60
	jr nz,L_BB99		;bb61
	ld (ix+00fh),00ch		;bb63
	call 08079h		;bb67
	ld a,l			;bb6a
	sub 010h		;bb6b
	ld l,a			;bb6d
	ld d,(ix+005h)		;bb6e
	ld e,(ix+003h)		;bb71
	ld a,0f0h		;bb74
	ld b,001h		;bb76
	call 07a4eh		;bb78   ; apunta_con_b_bancos_15:
	ld (ix+01eh),h		;bb7b
	ld (ix+01dh),l		;bb7e
	ld (ix+01ch),d		;bb81
	ld (ix+01bh),e		;bb84
	ld h,(ix+005h)		;bb87
	ld l,(ix+004h)		;bb8a
	ld (0d8b5h),hl		;bb8d
	ld h,(ix+003h)		;bb90
	ld l,(ix+002h)		;bb93
	ld (0d8b3h),hl		;bb96
L_BB99:
	call 04256h		;bb99   ; azar: A = un numero al azar (0xCA03 rotado mas R)
	and 007h		;bb9c
	add a,004h		;bb9e
	ld (ix+01fh),a		;bba0
	ret			;bba3
L_BBA4:
	call 08100h		;bba4
	jr z,L_BBAD		;bba7
	ld (ix+00fh),000h		;bba9
L_BBAD:
	ld a,(ix+00fh)		;bbad
	and a			;bbb0
	jr z,L_BB54		;bbb1
	dec (ix+00fh)		;bbb3
	ld h,(ix+01eh)		;bbb6
	ld l,(ix+01dh)		;bbb9
	call L_BBE8		;bbbc
	ld bc,(0d8b5h)		;bbbf
	add hl,bc			;bbc3
	ex de,hl			;bbc4
	ld h,(ix+01ch)		;bbc5
	ld l,(ix+01bh)		;bbc8
	call L_BBE8		;bbcb
	ld bc,(0d8b3h)		;bbce
	add hl,bc			;bbd2
	ld l,d			;bbd3
	ld a,h			;bbd4
	sub 008h		;bbd5
	cp 0a8h		;bbd7
	jr nc,L_BBE3		;bbd9
	ld a,l			;bbdb
	sub 008h		;bbdc
	cp 0a8h		;bbde
	jp c,09af4h		;bbe0   ; lanza_7: lo lanzado de tipo 7
L_BBE3:
	ld (ix+00fh),000h		;bbe3
	ret			;bbe7
L_BBE8:
	ld a,(ix+00fh)		;bbe8
	sub 00ch		;bbeb
	ret z			;bbed
	neg		;bbee
	ld b,a			;bbf0
	add hl,hl			;bbf1
	push de			;bbf2
	ld d,h			;bbf3
	ld e,l			;bbf4
L_BBF5:
	add hl,de			;bbf5
	djnz L_BBF5		;bbf6
	pop de			;bbf8
	ret			;bbf9

; ----------------------------------------------------------------------
; DATOS resto_BBFA: lo apuntan con el banco puesto p15:B8A4 (0xBBFA), p15:B81B
;   (0xBC0A), p15:B884 (0xBC40), p15:B898 (0xBCA0), p15:B89D (0xBCAA); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p15:B8A4, p15:B81B, p15:B884, p15:B898, p15:B89D (186 bytes)
;   0xbbfa..0xbcb4  (186 bytes)
DATA_resto_BBFA:
	defb 000h,004h,004h,004h,004h,000h,004h,0fch,000h,0fch,0fch,0fch,0fch,000h,0fch,004h	; bbfa  ................
	defb 010h,0bch,022h,0bch,032h,0bch,040h,008h,0f8h,028h,0e8h,020h,0e8h,030h,0d8h,038h	; bc0a  ..".2.@..(. .0.8
	defb 0f8h,088h,0e8h,078h,0e8h,088h,0d8h,078h,060h,007h,000h,040h,000h,050h,0f0h,048h	; bc1a  ...x...x`..@.P.H
	defb 0e0h,050h,0e0h,08ah,0d0h,08ah,0d0h,07ah,07ch,006h,0c8h,020h,000h,04ah,000h,05ah	; bc2a  .P.....z|.. .J.Z
	defb 0f0h,052h,0e0h,052h,0c8h,090h,050h,0bch,05ah,0bch,064h,0bch,06eh,0bch,078h,0bch	; bc3a  .R.R..P.Z.d.n.x.
	defb 082h,0bch,08ch,0bch,096h,0bch,090h,004h,004h,0f8h,0f4h,0f0h,0f4h,000h,0e4h,0f8h	; bc4a  ................
	defb 080h,004h,0fch,004h,0fch,0f4h,0ech,0fch,0ech,0ech,060h,004h,0f9h,004h,0f1h,0f4h	; bc5a  ..........`.....
	defb 001h,0f4h,0f9h,0e4h,050h,004h,0f5h,004h,0f5h,0f4h,005h,0fch,005h,0ech,040h,004h	; bc6a  ....P.........@.
	defb 0ech,0f9h,0fch,0f1h,0fch,001h,00ch,0f9h,0c0h,004h,0f5h,0edh,0f5h,0fdh,005h,0f5h	; bc7a  ................
	defb 005h,005h,0b0h,004h,0f9h,0edh,0f1h,0fdh,001h,0fdh,0f9h,00dh,0a0h,004h,0fch,0edh	; bc8a  ................
	defb 0fch,0fdh,0ech,0f5h,0ech,005h,0d0h,004h,0e9h,0f8h,0f9h,0e8h,009h,0f8h,0f9h,008h	; bc9a  ................
	defb 0e0h,004h,0f1h,0f1h,001h,0f1h,0f1h,000h,001h,001h	; bcaa  ..........

; ======================================================================
; CODIGO 0xbcb4..0xbdd8  (292 bytes)
; ======================================================================


L_BCB4:
	ld a,(0ca4ah)		;bcb4   ; lee la zona
	cp 007h		;bcb7
	ret nz			;bcb9
	ld a,(0ca4bh)		;bcba   ; lee la sala de la zona
	cp 002h		;bcbd
	jr z,L_BCD5		;bcbf
	cp 003h		;bcc1
	jr z,L_BD0A		;bcc3
	cp 004h		;bcc5
	jp z,L_BD43		;bcc7
	cp 008h		;bcca
	jp z,L_BD81		;bccc
	cp 009h		;bccf
	jp z,L_BDAA		;bcd1
	ret			;bcd4
L_BCD5:
	ld de,03040h		;bcd5
	ld bc,00206h		;bcd8
	call L_BDB2		;bcdb
	ld de,05030h		;bcde
	call L_BDB2		;bce1
	ld de,09040h		;bce4
	call 062a5h		;bce7   ; copia_al_mapa_0: p01:62B5 caracter a caracter, sin sumar
	ld de,03050h		;bcea
	ld bc,00602h		;bced
	call L_BDB2		;bcf0
	ld de,04070h		;bcf3
	call 062a5h		;bcf6   ; copia_al_mapa_0: p01:62B5 caracter a caracter, sin sumar
	ld de,08030h		;bcf9
	ld bc,00802h		;bcfc
	call 062a5h		;bcff   ; copia_al_mapa_0: p01:62B5 caracter a caracter, sin sumar
	ld de,05090h		;bd02
	ld bc,0020eh		;bd05
	jr L_BD40		;bd08
L_BD0A:
	ld de,00040h		;bd0a
	ld bc,00206h		;bd0d
	call L_BDB2		;bd10
	ld de,09060h		;bd13
	call 062a5h		;bd16   ; copia_al_mapa_0: p01:62B5 caracter a caracter, sin sumar
	ld de,09000h		;bd19
	ld bc,00402h		;bd1c
	call L_BDB2		;bd1f
	ld de,09070h		;bd22
	call 062a5h		;bd25   ; copia_al_mapa_0: p01:62B5 caracter a caracter, sin sumar
	ld de,03020h		;bd28
	ld bc,00602h		;bd2b
	call 062a5h		;bd2e   ; copia_al_mapa_0: p01:62B5 caracter a caracter, sin sumar
	ld de,04020h		;bd31
	ld bc,0020ch		;bd34
	call 062a5h		;bd37   ; copia_al_mapa_0: p01:62B5 caracter a caracter, sin sumar
	ld de,00090h		;bd3a
	ld bc,00218h		;bd3d
L_BD40:
	jp 062a5h		;bd40   ; copia_al_mapa_0: p01:62B5 caracter a caracter, sin sumar
L_BD43:
	ld de,06030h		;bd43
	ld bc,00206h		;bd46
	call L_BDB2		;bd49
	ld de,00060h		;bd4c
	call 062a5h		;bd4f   ; copia_al_mapa_0: p01:62B5 caracter a caracter, sin sumar
	ld de,03060h		;bd52
	ld bc,00602h		;bd55
	call L_BDB2		;bd58
	ld de,06050h		;bd5b
	call L_BDB2		;bd5e
	ld de,09030h		;bd61
	call 062a5h		;bd64   ; copia_al_mapa_0: p01:62B5 caracter a caracter, sin sumar
	ld de,04000h		;bd67
	ld bc,00804h		;bd6a
	call 062a5h		;bd6d   ; copia_al_mapa_0: p01:62B5 caracter a caracter, sin sumar
	ld de,07050h		;bd70
	ld bc,00204h		;bd73
	call 062a5h		;bd76   ; copia_al_mapa_0: p01:62B5 caracter a caracter, sin sumar
	ld bc,00202h		;bd79
	ld de,00090h		;bd7c
	jr L_BD40		;bd7f
L_BD81:
	ld de,04050h		;bd81
	ld bc,00206h		;bd84
	call L_BDB2		;bd87
	ld de,06080h		;bd8a
	call 062a5h		;bd8d   ; copia_al_mapa_0: p01:62B5 caracter a caracter, sin sumar
	ld bc,00802h		;bd90
	ld de,09080h		;bd93
	call 062a5h		;bd96   ; copia_al_mapa_0: p01:62B5 caracter a caracter, sin sumar
	ld de,02040h		;bd99
	ld bc,00404h		;bd9c
	call 062a5h		;bd9f   ; copia_al_mapa_0: p01:62B5 caracter a caracter, sin sumar
	ld de,02080h		;bda2
	ld bc,00408h		;bda5
	jr L_BD40		;bda8
L_BDAA:
	ld de,00020h		;bdaa
	ld bc,00204h		;bdad
	jr L_BD40		;bdb0
L_BDB2:
	push bc			;bdb2
	call 062a5h		;bdb3   ; copia_al_mapa_0: p01:62B5 caracter a caracter, sin sumar
	pop bc			;bdb6
	ret			;bdb7
L_BDB8:
	ld ix,0d800h		;bdb8   ; apunta a 4 fichas de 0x20 bytes de 0xD800 (p04:89C3); sus tipos los lleva p10
	ld b,004h		;bdbc
L_BDBE:
	call L_BDCE		;bdbe
	ld a,c			;bdc1
	and a			;bdc2
	jr nz,L_BDCC		;bdc3
	ld de,00020h		;bdc5
	add ix,de		;bdc8
	djnz L_BDBE		;bdca
L_BDCC:
	ld b,c			;bdcc
	ret			;bdcd
L_BDCE:
	ld a,(ix+000h)		;bdce
	and a			;bdd1
	jr z,$+58		;bdd2
	dec a			;bdd4
	call 0424dh		;bdd5   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_BDD8: 11 destinos del despachador p00:424D (call en p15:BDD5, el
;   indice en A): BE0F, BDFD, BDEE, BE05, BE22, BE2B, BE35, BDFD, BDFD, BDFD,
;   BE0C; lo leen p15:BDD5 (22 bytes)
;   0xbdd8..0xbdee  (22 bytes)
DATA_tabla_BDD8:
	defw 0be0fh,0bdfdh,0bdeeh,0be05h,0be22h,0be2bh,0be35h,0bdfdh	; bdd8
	defw 0bdfdh,0bdfdh,0be0ch	; bde8  -> L_BDFD L_BDFD L_BE0C

; ======================================================================
; CODIGO 0xbdee..0xbe9e  (176 bytes)
; ======================================================================


L_BDEE:
	call 08100h		;bdee
	jr nz,L_BE0C		;bdf1
	ld a,(ix+001h)		;bdf3
	cp 002h		;bdf6
	ld c,001h		;bdf8
	ret c			;bdfa
	jr L_BE1F		;bdfb
L_BDFD:
	call 08100h		;bdfd
	jr nz,L_BE0C		;be00
L_BE02:
	ld c,002h		;be02
	ret			;be04
L_BE05:
	ld a,(0ca76h)		;be05   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 029h		;be08
	jr z,L_BE02		;be0a
L_BE0C:
	ld c,000h		;be0c
	ret			;be0e
L_BE0F:
	ld a,(0ca4bh)		;be0f   ; lee la sala de la zona
	sub 010h		;be12
	cp 004h		;be14
	jr nc,L_BE0C		;be16
L_BE18:
	ld a,(ix+001h)		;be18
	and a			;be1b
	ld c,001h		;be1c
	ret z			;be1e
L_BE1F:
	ld c,003h		;be1f
	ret			;be21
L_BE22:
	ld a,(0ca4ah)		;be22   ; lee la zona
	cp 00eh		;be25
	jr z,L_BE02		;be27
	jr L_BE0C		;be29
L_BE2B:
	ld a,(0ca4ah)		;be2b   ; lee la zona
	cp 00eh		;be2e
	jr nz,L_BE0C		;be30
	ld c,001h		;be32
	ret			;be34
L_BE35:
	ld hl,(0ca50h)		;be35   ; lee la fila de la sala en la zona (uno mas al salir por arriba) y el byte siguiente (16 bits)
	ld a,l			;be38
	sub 004h		;be39
	cp 002h		;be3b
	jr nc,L_BE0C		;be3d
	ld a,h			;be3f
	sub 004h		;be40
	cp 002h		;be42
	jr nc,L_BE0C		;be44
	jr L_BE18		;be46
L_BE48:
	ld a,(0cab5h)		;be48   ; lee el nivel de Snake: la barra de vida llena mide 0x20 + 8 por nivel
	ld hl,lbe54h		;be4b
	call 043f6h		;be4e   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld (0d42bh),hl		;be51   ; guarda la cuenta de la alerta 1 (16 bits; se ve / 8 en la ventana); a cero se acaba
L_BE54:
	ld a,b			;be54
	nop			;be55
	ld a,b			;be56
	nop			;be57
	sub b			;be58
	nop			;be59
	and b			;be5a
	nop			;be5b
	and b			;be5c
	nop			;be5d
	and b			;be5e
	nop			;be5f
	ret z			;be60
	nop			;be61
	ret z			;be62
	nop			;be63
L_BE64:
	ld a,(0ca77h)		;be64
	and a			;be67
	ret nz			;be68
	ld a,(0ca76h)		;be69   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	and a			;be6c
	ret nz			;be6d
	ld de,0be9eh		;be6e
L_BE71:
	ld h,d			;be71
	ld l,e			;be72
	ld a,(hl)			;be73
	inc a			;be74
	jr z,L_BE9C		;be75
	ld a,(0ca4ah)		;be77   ; lee la zona
	cp (hl)			;be7a
	jr nz,L_BE95		;be7b
	inc hl			;be7d
	ld a,(0ca4bh)		;be7e   ; lee la sala de la zona
	cp (hl)			;be81
	jr nz,L_BE95		;be82
	inc hl			;be84
	ld a,(0d418h)		;be85
	sub (hl)			;be88
	cp 010h		;be89
	jr nc,L_BE95		;be8b
	inc hl			;be8d
	ld a,(0d419h)		;be8e
	sub (hl)			;be91
	cp 020h		;be92
	ret c			;be94
L_BE95:
	ld a,004h		;be95
	call 04243h		;be97   ; suma_a_de: DE = DE + A
	jr L_BE71		;be9a
L_BE9C:
	or a			;be9c
	ret			;be9d

; ----------------------------------------------------------------------
; DATOS resto_BE9E: lo apuntan con el banco puesto p15:BE6E (0xBE9E); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p15:BE6E (57 bytes)
;   0xbe9e..0xbed7  (57 bytes)
DATA_resto_BE9E:
	defb 000h,008h,02fh,050h,001h,00bh,09fh,070h,001h,016h,01fh,060h,002h,004h,09fh,030h	; be9e  ../P...p...`...0
	defb 002h,004h,09fh,070h,007h,004h,0a7h,060h,009h,001h,02fh,050h,00ah,000h,0a7h,040h	; beae  ...p...`../P...@
	defb 00bh,001h,0a7h,050h,00bh,004h,03fh,040h,00bh,007h,09fh,020h,00bh,006h,01fh,040h	; bebe  ...P..?@... ...@
	defb 00bh,007h,03fh,080h,00dh,003h,09fh,020h,0ffh	; bece  ..?.... .

; ======================================================================
; CODIGO 0xbed7..0xbf89  (178 bytes)
; ======================================================================


L_BED7:
	ld a,(0caa0h)		;bed7   ; lee cuantos siguen a Snake por su rastro (1-4)
	cp 004h		;beda
	jr z,L_BF0A		;bedc
	ld a,(0ca5fh)		;bede   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	and a			;bee1
	jr z,L_BF0A		;bee2
	ld hl,0d7dah		;bee4
	and 008h		;bee7
	ret nz			;bee9
	ld a,(0d444h)		;beea
	and a			;beed
	jr nz,L_BEF6		;beee
	ld a,(0ca77h)		;bef0
	cp 002h		;bef3
	ret nz			;bef5
L_BEF6:
	ld ix,0d300h		;bef6   ; apunta a las 4 fichas de actor de los que llegan con la alerta (los actores 20-23)
	ld b,004h		;befa
L_BEFC:
	ld a,(ix+000h)		;befc   ; lee el tipo del actor (0 = libre)
	and a			;beff
	ret nz			;bf00
	ld de,00040h		;bf01
	add ix,de		;bf04
	djnz L_BEFC		;bf06
	xor a			;bf08
	ret			;bf09
L_BF0A:
	or 001h		;bf0a
	ret			;bf0c
L_BF0D:
	exx			;bf0d
	push ix		;bf0e
	pop hl			;bf10
	ld bc,0003fh		;bf11
	call 04236h		;bf14   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	exx			;bf17
	ld (ix+000h),001h		;bf18
	ld (ix+003h),d		;bf1c
	ld (ix+005h),e		;bf1f
	ld de,(0ca50h)		;bf22   ; lee la fila de la sala en la zona (uno mas al salir por arriba) y el byte siguiente (16 bits)
	ld (ix+00ah),e		;bf26
	ld (ix+00bh),d		;bf29
	ld (ix+010h),003h		;bf2c
	xor a			;bf30
	ld (ix+001h),a		;bf31
	ld (ix+01ch),a		;bf34
	ld (ix+01fh),a		;bf37
	ld (ix+01bh),c		;bf3a
	ld hl,0d41eh		;bf3d
	ld a,c			;bf40
	and a			;bf41
	jr z,L_BF53		;bf42
	dec a			;bf44
	ld hl,0d449h		;bf45
	jr z,L_BF53		;bf48
	dec a			;bf4a
	ld c,000h		;bf4b
	jr z,L_BF57		;bf4d
	ld c,002h		;bf4f
	jr L_BF57		;bf51
L_BF53:
	ld a,(hl)			;bf53
	dec a			;bf54
	add a,a			;bf55
	ld c,a			;bf56
L_BF57:
	ld (ix+00dh),c		;bf57
	ret			;bf5a
L_BF5B:
	ld bc,(0ca50h)		;bf5b   ; lee la fila de la sala en la zona (uno mas al salir por arriba) y el byte siguiente (16 bits)
	ld a,c			;bf5f
	sub 002h		;bf60
	add a,a			;bf62
	ld c,a			;bf63
	ld a,b			;bf64
	sub 005h		;bf65
	add a,c			;bf67
	ld c,a			;bf68
	cp 003h		;bf69
	jr c,L_BF77		;bf6b
	ld a,(0ca4ah)		;bf6d   ; lee la zona
	cp 00ch		;bf70
	ld a,c			;bf72
	jr nz,L_BF77		;bf73
	ld a,004h		;bf75
L_BF77:
	ld c,a			;bf77
	add a,a			;bf78
	add a,c			;bf79
	ld hl,0bf89h		;bf7a
	call 0423eh		;bf7d   ; suma_a_hl: HL = HL + A
	ld d,(hl)			;bf80
	inc hl			;bf81
	ld e,(hl)			;bf82
	inc hl			;bf83
	ld a,(hl)			;bf84
	ld (0d41eh),a		;bf85
	ret			;bf88

; ----------------------------------------------------------------------
; DATOS resto_BF89: lo apuntan con el banco puesto p15:BF7A (0xBF89); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p15:BF7A (15 bytes)
;   0xbf89..0xbf98  (15 bytes)
DATA_resto_BF89:
	defb 06ch,0b8h,003h,018h,070h,002h,0c0h,050h,001h,048h,008h,004h,0c0h,070h,001h	; bf89  l...p..P.H...p.

; ======================================================================
; CODIGO 0xbf98..0xbfd7  (63 bytes)
; ======================================================================


L_BF98:
	ld b,000h		;bf98
L_BF9A:
	cp 00ah		;bf9a
	jr c,L_BFA3		;bf9c
	sub 00ah		;bf9e
	inc b			;bfa0
	jr L_BF9A		;bfa1
L_BFA3:
	sla b		;bfa3
	sla b		;bfa5
	sla b		;bfa7
	sla b		;bfa9
	or b			;bfab
	push af			;bfac
	rrca			;bfad
	rrca			;bfae
	rrca			;bfaf
	rrca			;bfb0
	and 00fh		;bfb1
	ld de,0cf40h		;bfb3
	call L_BFBF		;bfb6
	pop af			;bfb9
	and 00fh		;bfba
	ld de,0d540h		;bfbc
L_BFBF:
	add a,a			;bfbf
	add a,a			;bfc0
	add a,a			;bfc1
	add a,068h		;bfc2
	ld h,a			;bfc4
	ld l,068h		;bfc5
	ld bc,00808h		;bfc7
	ld a,(0ca42h)		;bfca   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	and a			;bfcd
	ld a,0c8h		;bfce
	jr z,L_BFD4		;bfd0
	ld a,0d8h		;bfd2
L_BFD4:
	jp 047edh		;bfd4   ; copia_rectangulo_logica: orden LMMM del VDP con la operacion logica de A

; ----------------------------------------------------------------------
; DATOS sin identificar  0xbfd7..0xc000  (41 bytes)
DATA_BFD7:
	defb 080h,060h,080h,07fh,080h,060h,080h,040h,080h,020h,080h,000h,080h,0e0h,080h,0c0h	; bfd7  .`...`.@. ......
	defb 080h,0a0h,080h,0a0h,080h,0c0h,080h,0e0h,080h,000h,080h,080h,080h,080h,080h,080h	; bfe7  ................
	defb 080h,010h,080h,080h,080h,080h,080h,080h,080h	; bff7  .........
