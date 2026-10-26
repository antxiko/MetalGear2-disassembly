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


actor_0a_espera:		; al acabar la espera: 0xD441 = 0; en esta sala, sus sprites y 0xD514 = 0xFF; y el paso 4
	dec (ix+00eh)		;a001   ; baja la espera del actor
	ret nz			;a004
	xor a			;a005
	ld (0d441h),a		;a006
	call 08100h		;a009   ; en_esta_sala: Z si el actor esta en la sala de ahora (fila y columna)
	jr nz,L_A016		;a00c
	call 08153h		;a00e   ; pinta_actor: sus sprites (p04:81C5) con el banco 8
	ld a,0ffh		;a011
	ld (0d514h),a		;a013
L_A016:
	jp al_paso_4		;a016   ; al_paso_4: el paso 4
cambia_al_ver_e1c0:		; en la sala 0x0E con 0xE1C0, el tipo 7 (salvo en los pasos 0x1C-0x20 y 0x29) con 0xCB21 = 0x0F y 0xCA90 = 5: al paso 0x1C (0x29 desde el 0x21)
	ld a,(0ca4bh)		;a019   ; lee la sala de la zona
	cp 00eh		;a01c
	ret nz			;a01e
	ld a,(0e1c0h)		;a01f   ; lee 1-2: el estado de lo de la zona 0x0A sala 0x0E (p10:BC0F)
	and a			;a022
	ret z			;a023
	ld a,(ix+000h)		;a024   ; lee el tipo del actor (0 = libre)
	cp 007h		;a027
	ret nz			;a029
	ld a,(ix+001h)		;a02a   ; lee el paso del actor
	cp 029h		;a02d
	ret z			;a02f
	sub 01ch		;a030
	cp 005h		;a032
	ret c			;a034
	ld a,(0ca4bh)		;a035   ; lee la sala de la zona
	cp 00eh		;a038
	ret nz			;a03a
	ld a,(0cb21h)		;a03b   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	cp 00fh		;a03e
	ret nz			;a040
	ld a,(0ca90h)		;a041   ; lee el paso de lo de la cosa 0x0F (1-5, p11:BC0C)
	cp 005h		;a044
	ret nz			;a046
	xor a			;a047
	ld (ix+00ch),a		;a048
	ld (ix+00eh),010h		;a04b   ; la espera del actor = 0x10
	ld a,(ix+001h)		;a04f   ; lee el paso del actor
	cp 021h		;a052
	ld a,01ch		;a054
	jr nz,L_A05E		;a056
	ld (ix+00dh),000h		;a058   ; el dibujo del actor (bit 0: el paso) = 0x00
	ld a,029h		;a05c
L_A05E:
	ld (ix+001h),a		;a05e   ; guarda el paso del actor
	ret			;a061
espera_aviso_y_3:		; al acabar la espera: el aviso 0x8B, la direccion 3 y el paso siguiente
	dec (ix+00eh)		;a062   ; baja la espera del actor
	ret nz			;a065
	call 09d25h		;a066   ; aviso_8b_20:
	ld a,003h		;a069
	call 08e25h		;a06b   ; a_p06_b592_b_4_5: a_p06_b592 y deja los bancos 4 y 5
	jp paso_siguiente		;a06e   ; paso_siguiente: el paso siguiente del actor
espera_y_paso_20:		; al acabar la espera: otra de 16, el paso 0x20 y el aviso 0x8B
	dec (ix+00eh)		;a071   ; baja la espera del actor
	ret nz			;a074
	ld (ix+00eh),010h		;a075   ; la espera del actor = 0x10
	ld (ix+001h),020h		;a079   ; el paso del actor = 0x20
	jp 09d25h		;a07d   ; aviso_8b_20:
hasta_x_98:		; anda hasta X = 0x98 y la direccion 0
	ld b,098h		;a080
	call hasta_x_b		;a082   ; hasta_x_b: desde la X de B, el paso siguiente (sin acarreo); antes, anda (acarreo)
	ret c			;a085
	xor a			;a086
	jp 08e25h		;a087   ; a_p06_b592_b_4_5: a_p06_b592 y deja los bancos 4 y 5
hasta_x_b:		; desde la X de B, el paso siguiente (sin acarreo); antes, anda (acarreo)
	ld a,(ix+005h)		;a08a   ; lee la X del actor
	cp b			;a08d
	jr c,L_A095		;a08e
	call paso_siguiente		;a090   ; paso_siguiente: el paso siguiente del actor
	or a			;a093
	ret			;a094
L_A095:
	call 0900bh		;a095   ; p04:900B
	scf			;a098
	ret			;a099
hasta_y_2a:		; hasta Y = 0x2A anda; despues la direccion 3 y el paso siguiente
	ld a,(ix+003h)		;a09a   ; lee la Y del actor
	cp 02ah		;a09d
	jp nc,0900bh		;a09f   ; p04:900B
	ld a,003h		;a0a2
	call 08e25h		;a0a4   ; a_p06_b592_b_4_5: a_p06_b592 y deja los bancos 4 y 5
	jp paso_siguiente		;a0a7   ; paso_siguiente: el paso siguiente del actor
hasta_x_aa:		; hasta X = 0xAA; despues parado 16 cuadros
	ld b,0aah		;a0aa
	call hasta_x_b		;a0ac   ; hasta_x_b: desde la X de B, el paso siguiente (sin acarreo); antes, anda (acarreo)
	ret c			;a0af
	xor a			;a0b0
	ld (ix+00dh),a		;a0b1   ; guarda el dibujo del actor (bit 0: el paso)
	ld (ix+00ch),a		;a0b4
	ld (ix+00eh),010h		;a0b7   ; la espera del actor = 0x10
	ret			;a0bb
e1c0_a_2:		; al acabar la espera: 0xE1C0 = 2, la fase al menos 8 (y la musica), el sonido 0x46 y el paso siguiente
	dec (ix+00eh)		;a0bc   ; baja la espera del actor
	ret nz			;a0bf
	ld a,002h		;a0c0
	ld (0e1c0h),a		;a0c2   ; guarda 1-2: el estado de lo de la zona 0x0A sala 0x0E (p10:BC0F)
	ld hl,0ca22h		;a0c5   ; apunta a la fase de la partida (indice de las listas de p06:B40C)
	ld a,(hl)			;a0c8
	cp 008h		;a0c9
	jr nc,L_A0D5		;a0cb
	ld a,008h		;a0cd
	ld (0ca22h),a		;a0cf   ; guarda la fase de la partida (indice de las listas de p06:B40C)
	call 07a12h		;a0d2   ; p01:7A12
L_A0D5:
	call 06c33h		;a0d5   ; sonido_46: pide el sonido 0x46
	jp paso_siguiente		;a0d8   ; paso_siguiente: el paso siguiente del actor
espera_mas:		; la espera uno mas y p04:9E51
	inc (ix+00eh)		;a0db   ; sube la espera del actor
	jp 09e51h		;a0de   ; mira_cada_16: cada 16 cuadros, p06:B5E2
hasta_y_30:		; anda; por encima de Y = 0x30, la direccion 2 y el paso 7
	call 0900bh		;a0e1   ; p04:900B
	ld a,(ix+003h)		;a0e4   ; lee la Y del actor
	cp 030h		;a0e7
	ret nc			;a0e9
	jr L_A10A		;a0ea
sin_acarreo:
	and a			;a0ec
	ret			;a0ed
tipo_2_en_la_sala:		; fuera de 0xD430 = 2, el tipo 2 en esta sala: parado (la direccion 0, el paso 6) o hacia abajo (2, el paso 7), con acarreo
	ld a,(0d430h)		;a0ee
	cp 002h		;a0f1
	jr z,sin_acarreo		;a0f3
	ld a,(ix+000h)		;a0f5   ; lee el tipo del actor (0 = libre)
	cp 002h		;a0f8
	jr nz,sin_acarreo		;a0fa
	call 08100h		;a0fc   ; en_esta_sala: Z si el actor esta en la sala de ahora (fila y columna)
	jr nz,sin_acarreo		;a0ff
	ld a,(ix+007h)		;a101   ; lee la velocidad del actor en Y (alta)
	and a			;a104
	ld bc,00006h		;a105
	jr nz,direccion_y_paso		;a108
L_A10A:
	ld bc,00207h		;a10a
direccion_y_paso:		; la direccion B, el paso C y acarreo
	ld a,b			;a10d
	push bc			;a10e
	call 08e25h		;a10f   ; a_p06_b592_b_4_5: a_p06_b592 y deja los bancos 4 y 5
	pop bc			;a112
	ld (ix+001h),c		;a113   ; guarda el paso del actor
	scf			;a116
	ret			;a117
hasta_columna_5:		; anda; en la columna 5 por debajo de X = 0x90, la direccion 0 y el paso 0x1B
	call 0900bh		;a118   ; p04:900B
	call 080e6h		;a11b   ; a_p14_b88f_guarda: p14:B88F guardando el banco de 0xA000
	ld a,(ix+00bh)		;a11e   ; lee la columna de la sala del actor
	cp 005h		;a121
	ret nz			;a123
	ld a,(ix+005h)		;a124   ; lee la X del actor
	cp 090h		;a127
	ret nc			;a129
	ld bc,0001bh		;a12a
	jr direccion_y_paso		;a12d
se_va_por_arriba:		; anda; por encima de Y = 0x18, fuera, 0xD430 = 1 y 0xD431 = 0x40
	call 0900bh		;a12f   ; p04:900B
	ld a,(ix+003h)		;a132   ; lee la Y del actor
	cp 018h		;a135
	ret nc			;a137
	xor a			;a138
	ld (ix+000h),a		;a139   ; guarda el tipo del actor (0 = libre)
	inc a			;a13c
	ld (0d430h),a		;a13d
	ld a,040h		;a140
	ld (0d431h),a		;a142
	call 08273h		;a145   ; lista_de_sprites: DE = IX + 0x2E: la lista de sprites del actor
	jp 080f3h		;a148   ; a_p14_ba17_guarda: p14:BA17 guardando el banco de 0xA000
hasta_x_70:		; anda; por debajo de X = 0x70, el paso 0x17 con el dibujo 2 y la direccion 1
	call 0900bh		;a14b   ; p04:900B
	ld a,(ix+005h)		;a14e   ; lee la X del actor
	cp 070h		;a151
	ret nc			;a153
	ld (ix+001h),017h		;a154   ; el paso del actor = 0x17
dibujo_2_dir_1:
	ld (ix+00dh),002h		;a158   ; el dibujo del actor (bit 0: el paso) = 0x02
	ld a,001h		;a15c
	jp 08e25h		;a15e   ; a_p06_b592_b_4_5: a_p06_b592 y deja los bancos 4 y 5
hasta_x_48:		; anda; por debajo de X = 0x48: parado, 0xCAC9 = 1, la espera de 8 y, en esta sala, el sonido 0x46 y p08:A13B
	call 0900bh		;a161   ; p04:900B
	ld a,(ix+005h)		;a164   ; lee la X del actor
	cp 048h		;a167
	ret nc			;a169
	ld hl,0cac9h		;a16a
parado_con_bandera:
	xor a			;a16d
	ld (ix+001h),a		;a16e   ; guarda el paso del actor
	ld (ix+00dh),a		;a171   ; guarda el dibujo del actor (bit 0: el paso)
	ld (ix+00ch),a		;a174
	inc a			;a177
	ld (hl),a			;a178
	ld a,008h		;a179
	ld (ix+01ch),a		;a17b
	call 08100h		;a17e   ; en_esta_sala: Z si el actor esta en la sala de ahora (fila y columna)
	ret nz			;a181
	call 06c33h		;a182   ; sonido_46: pide el sonido 0x46
	jp 08da8h		;a185   ; a_p08_a13b: p08:A13B con el banco 8 en 0xA000
hasta_y_b0_16:		; anda; desde Y = 0xB0, el paso 0x16, el dibujo 4 y la direccion 2
	ld de,01604h		;a188
	ld c,002h		;a18b
hasta_y_b0:
	call 0900bh		;a18d   ; p04:900B
	ld a,(ix+003h)		;a190   ; lee la Y del actor
	cp 0b0h		;a193
	ret c			;a195
	ld (ix+001h),d		;a196   ; guarda el paso del actor
	ld (ix+00dh),e		;a199   ; guarda el dibujo del actor (bit 0: el paso)
	ld a,c			;a19c
	jp 08e25h		;a19d   ; a_p06_b592_b_4_5: a_p06_b592 y deja los bancos 4 y 5
hasta_y_b0_1a:		; como p05:A188 con el paso 0x1A, el dibujo 6 y la direccion 3
	ld de,01a06h		;a1a0
	ld c,003h		;a1a3
	jr hasta_y_b0		;a1a5
hasta_x_50:		; anda; por debajo de X = 0x50, el dibujo 2, la direccion 1 y el paso siguiente
	call 0900bh		;a1a7   ; p04:900B
	ld a,(ix+005h)		;a1aa   ; lee la X del actor
	cp 050h		;a1ad
	ret nc			;a1af
	call dibujo_2_dir_1		;a1b0   ; dibujo_2_dir_1:
	jp paso_siguiente		;a1b3   ; paso_siguiente: el paso siguiente del actor
hasta_x_b0:		; anda; desde X = 0xB0, parado con 0xCACA = 1
	call 0900bh		;a1b6   ; p04:900B
	ld a,(ix+005h)		;a1b9   ; lee la X del actor
	cp 0b0h		;a1bc
	ret c			;a1be
	ld hl,0cacah		;a1bf
	jp parado_con_bandera		;a1c2   ; parado_con_bandera:
bandera_d529_o_d599:		; al acabar la espera, sin 0xD521: 0xD529 = 1 en esta sala o 0xD599 = 1 fuera; 8 cuadros y el paso siguiente
	dec (ix+00eh)		;a1c5   ; baja la espera del actor
	ret nz			;a1c8
	ld a,(0d521h)		;a1c9
	and a			;a1cc
	jr nz,L_A1DE		;a1cd
	call 08100h		;a1cf   ; en_esta_sala: Z si el actor esta en la sala de ahora (fila y columna)
	ld a,001h		;a1d2
	jr nz,L_A1DB		;a1d4
	ld (0d529h),a		;a1d6
	jr L_A1DE		;a1d9
L_A1DB:
	ld (0d599h),a		;a1db
L_A1DE:
	ld (ix+00eh),008h		;a1de   ; la espera del actor = 0x08
	jp paso_siguiente		;a1e2   ; paso_siguiente: el paso siguiente del actor
actor_19_tipo_18:		; al acabar la espera: el actor 19 (0xD2C0) a cero
	dec (ix+00eh)		;a1e5   ; baja la espera del actor
	ret nz			;a1e8
	ld hl,0d2c0h		;a1e9
	ld bc,0003fh		;a1ec
	call 04236h		;a1ef   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	push ix		;a1f2   ; el actor 19 (0xD2C0) de tipo 0x18 con el byte 0x10 = 0xFF, y sus sprites
	ld ix,0d2c0h		;a1f4
	ld (ix+000h),018h		;a1f8   ; el tipo del actor (0 = libre) = 0x18
	ld (ix+010h),0ffh		;a1fc
	call 08153h		;a200   ; pinta_actor: sus sprites (p04:81C5) con el banco 8
	pop ix		;a203
	ld (ix+00eh),008h		;a205   ; 8 cuadros y el paso siguiente
	jp paso_siguiente		;a209   ; paso_siguiente: el paso siguiente del actor
quita_el_19:		; al acabar la espera: el paso 4, 0xD521 = 0xD529 = 0xD599 = 0 y, en esta sala, un rectangulo de la pagina 1 o 0
	dec (ix+00eh)		;a20c   ; baja la espera del actor
	ret nz			;a20f
	call al_paso_4		;a210   ; al_paso_4: el paso 4
	xor a			;a213
	ld (0d521h),a		;a214
	ld (0d529h),a		;a217
	ld (0d599h),a		;a21a
	call 08100h		;a21d   ; en_esta_sala: Z si el actor esta en la sala de ahora (fila y columna)
	ret nz			;a220
	ld hl,04840h		;a221   ; de X = 0x48, Y = 0x40...
	ld de,02840h		;a224   ; ...a X = 0x28, Y = 0x40...
	ld bc,01820h		;a227   ; ...0x18 x 0x20
	ld a,(0ca42h)		;a22a   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	and a			;a22d
	ld a,005h		;a22e
	jr nz,L_A233		;a230
	xor a			;a232
L_A233:
	jp 04767h		;a233   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
espera_y_paso_4:		; al acabar la espera, el paso 4
	dec (ix+00eh)		;a236   ; baja la espera del actor
	ret nz			;a239
al_paso_4:		; el paso 4
	ld (ix+001h),004h		;a23a   ; el paso del actor = 0x04
	ret			;a23e
quita_el_19_b:		; el actor 19 libre, sin sprites, y el paso siguiente
	push ix		;a23f
	ld ix,0d2c0h		;a241
	ld (ix+000h),000h		;a245   ; el tipo del actor (0 = libre) = 0x00
	call 0834ch		;a249   ; quita_actor: sus sprites libres y fuera; el 0x13 apunta en 0xD4F8, el 0x0B con alerta 0xCA67 = 0
	pop ix		;a24c
	jr paso_siguiente		;a24e
sigue_el_tramo:		; p05:A0EE; los tipos 8 y 9 en su sitio; si no ha llegado, anda; si ha llegado, el paso siguiente
	call tipo_2_en_la_sala		;a250   ; tipo_2_en_la_sala: fuera de 0xD430 = 2, el tipo 2 en esta sala: parado (la direccion 0, el paso 6) o hacia abajo (2, el paso 7), con acarreo
	ret c			;a253
	call 09f6bh		;a254   ; llega_a_64: el tipo 8 en la fila 1 columna 9: al llegar a Y = 0x64, el paso 0x22 con 8 cuadros y, con 0xD510 = 0x0C, la bandera de 0xD519
	ret z			;a257
	call 09f22h		;a258   ; llega_a_b4: el tipo 9 en la fila 1 columna 7: al llegar a Y = 0xB4, el paso 0x28 y (en la sala 4 o la especial 0x18) la bandera de 0xD509
	ret z			;a25b
	call 08e82h		;a25c   ; llega_al_destino: en la sala del destino, acarreo si aun no ha llegado al punto (segun hacia donde va)
	jp c,paso_siguiente		;a25f   ; paso_siguiente: el paso siguiente del actor
	jp 0900bh		;a262   ; p04:900B
parada_si:		; con el byte 0x1A, parado 0x80 cuadros con el dibujo de antes; si no, el paso 4
	ld a,(ix+01ah)		;a265
	and a			;a268
	jr z,L_A2AA		;a269
	ld a,(ix+00dh)		;a26b   ; lee el dibujo del actor (bit 0: el paso)
	and 0feh		;a26e
	ld (ix+015h),a		;a270
	ld (ix+00ch),000h		;a273
	ld (ix+00eh),080h		;a277   ; la espera del actor = 0x80
paso_siguiente:		; el paso siguiente del actor
	inc (ix+001h)		;a27b   ; sube el paso del actor
	ret			;a27e
mira_alrededor:		; mira a los lados (p05:A285); al acabar, el paso siguiente
	call mira_a_los_lados		;a27f   ; mira_a_los_lados: la espera; segun sus bits 4 y 5, el dibujo de frente, + 8 o + 9 (Z al acabar)
	jr z,paso_siguiente		;a282
	ret			;a284
mira_a_los_lados:		; la espera; segun sus bits 4 y 5, el dibujo de frente, + 8 o + 9 (Z al acabar)
	dec (ix+00eh)		;a285   ; baja la espera del actor
	ret z			;a288
	ld b,000h		;a289
	bit 4,(ix+00eh)		;a28b   ; mira el bit 4 de la espera del actor
	jr z,L_A29A		;a28f
	ld b,008h		;a291
	bit 5,(ix+00eh)		;a293   ; mira el bit 5 de la espera del actor
	jr z,L_A29A		;a297
	inc b			;a299
L_A29A:
	ld a,(ix+015h)		;a29a
	and 0feh		;a29d
	add a,b			;a29f
	ld (ix+00dh),a		;a2a0   ; guarda el dibujo del actor (bit 0: el paso)
	or 001h		;a2a3
	ret			;a2a5
mira_y_paso_4:		; mira a los lados; al acabar, el paso 4
	call mira_a_los_lados		;a2a6   ; mira_a_los_lados: la espera; segun sus bits 4 y 5, el dibujo de frente, + 8 o + 9 (Z al acabar)
	ret nz			;a2a9
L_A2AA:
	jp al_paso_4		;a2aa   ; al_paso_4: el paso 4
actor_en_alerta_1:		; la alerta 1: los pasos 0x25 y 0x26 (lanzar), los demas por p05:A2BD
	ld a,(ix+001h)		;a2ad   ; lee el paso del actor
	cp 025h		;a2b0
	jp z,09e9ah		;a2b2   ; aviso_y_espera: el aviso 5, 0x20 cuadros (byte 0x1C) y p05:A27B
	cp 026h		;a2b5
	jp z,09ea4h		;a2b7   ; lanza_cada_4: durante 0x1C cuadros, cada 4 lanza hacia Snake; al acabar, lo de antes y el aviso 6
	call 0424dh		;a2ba   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_A2BD: 12 destinos del despachador p00:424D (call en p05:A2BA, el
;   indice en A): A2D5, A309, A47B, A49D, A4A9, 900B, 9DB0, A5EA, 8ECD, 8ED9,
;   9E05, A490; lo leen p05:A2BA (24 bytes)
;   0xa2bd..0xa2d5  (24 bytes)
DATA_tabla_A2BD:
	defw 0a2d5h,0a309h,0a47bh,0a49dh,0a4a9h,0900bh,09db0h,0a5eah	; a2bd
	defw 08ecdh,08ed9h,09e05h,0a490h	; a2cd  -> 0x8ecd 0x8ed9 0x9e05 busca_paso_3

; ======================================================================
; CODIGO 0xa2d5..0xa376  (161 bytes)
; ======================================================================


busca_paso_0:		; buscar: el paso siguiente, la direccion de la entrada (0xD41E o 0xD449) y una espera al azar
	call paso_siguiente		;a2d5   ; paso_siguiente: el paso siguiente del actor
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
busca_en_direccion:		; la direccion A a 0x1D, su velocidad...
	ld (ix+01dh),a		;a2ec
	call 08e25h		;a2ef   ; a_p06_b592_b_4_5: a_p06_b592 y deja los bancos 4 y 5
	push ix		;a2f2   ; ...y una espera al azar: 0x20-0x5F o 0x18-0x37 segun el actor
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
	ld (ix+00eh),a		;a305   ; guarda la espera del actor
	ret			;a308
busca_paso_1:		; con 0xD42A, el aviso y el paso 3
	ld a,(0d42ah)		;a309
	and a			;a30c
	jr nz,aviso_y_paso_3		;a30d
	call al_borde		;a30f   ; al borde (p05:A45D), chocando de frente o cerca de los que llegan: otra direccion
	jr nc,L_A33E		;a312
	call 09038h		;a314   ; choca_de_frente: A = los choques (C) en su eje: 3 vertical, 0x0C horizontal
	jr nz,L_A33E		;a317
	call cerca_de_los_que_llegan		;a319   ; cerca_de_los_que_llegan: con la alerta 1 contando, acarreo si los actores 20 y 21 estan juntos (a menos de 0x10 en Y y 0x0C en X)
	jr c,L_A33E		;a31c
	dec (ix+00eh)		;a31e   ; la espera; mientras, anda
	jp nz,0900bh		;a321   ; p04:900B
	inc (ix+00fh)		;a324   ; cada 4 vueltas, parado 0xC0 cuadros
	ld a,(ix+00fh)		;a327
	and 003h		;a32a
	jr z,parado_c0		;a32c
gira_al_otro_eje:		; al otro eje, al azar segun el actor
	ld a,(ix+01dh)		;a32e
	xor 002h		;a331
	and 002h		;a333
	ld b,a			;a335
	call numero_del_actor		;a336   ; numero_del_actor: A = el byte bajo de IX / 16
	and 001h		;a339
	or b			;a33b
	jr busca_en_direccion		;a33c
L_A33E:
	call 08f9ah		;a33e   ; da la vuelta
	inc (ix+00fh)		;a341
	ld a,(ix+00fh)		;a344
	and 003h		;a347
	jr z,parado_c0		;a349
	ld a,(ix+01dh)		;a34b   ; en su eje, hacia el lado mas abierto (p05:A3F3, p05:A442)
	cp 002h		;a34e
	jr nc,L_A357		;a350
	call lado_mas_abierto_x		;a352   ; lado_mas_abierto_x: cuanto hay libre a la derecha y a la izquierda (p05:A419): 2 o 3 hacia el mas abierto
	jr busca_en_direccion		;a355
L_A357:
	call lado_mas_abierto_y		;a357   ; lado_mas_abierto_y: lo mismo arriba y abajo: 0 o 1 hacia el mas abierto
	jr busca_en_direccion		;a35a
parado_c0:		; parado 0xC0 cuadros y el paso siguiente
	ld (ix+00ch),000h		;a35c
	ld (ix+00eh),0c0h		;a360   ; la espera del actor = 0xC0
	jp paso_siguiente		;a364   ; paso_siguiente: el paso siguiente del actor
aviso_y_paso_3:		; el aviso 0x82, el paso 3 y una direccion al azar
	call 09d1bh		;a367   ; aviso_82_20:
	ld (ix+001h),003h		;a36a   ; el paso del actor = 0x03
	call 04256h		;a36e   ; azar: A = un numero al azar (0xCA03 rotado mas R)
	and 003h		;a371
	jp 08e25h		;a373   ; a_p06_b592_b_4_5: a_p06_b592 y deja los bancos 4 y 5

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


cerca_de_los_que_llegan:		; con la alerta 1 contando, acarreo si los actores 20 y 21 estan juntos (a menos de 0x10 en Y y 0x0C en X)
	ld a,(0d42bh)		;a3c0   ; lee la cuenta de la alerta 1 (16 bits; se ve / 8 en la ventana); a cero se acaba
	and a			;a3c3
	ret z			;a3c4
	ld hl,0d300h		;a3c5   ; apunta a las 4 fichas de actor de los que llegan con la alerta (los actores 20-23)
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
	cp 010h		;a3da   ; a menos de 0x10 en Y...
	ret nc			;a3dc
	inc hl			;a3dd   ; ...y la X...
	inc hl			;a3de
	inc de			;a3df
	inc de			;a3e0
	ld a,(de)			;a3e1   ; ...a menos de 0x0C
	sub (hl)			;a3e2
	jr nc,L_A3E7		;a3e3
	neg		;a3e5
L_A3E7:
	cp 00ch		;a3e7
	ret			;a3e9
numero_del_actor:		; A = el byte bajo de IX / 16
	push ix		;a3ea   ; IX...
	pop hl			;a3ec
	ld a,l			;a3ed   ; .../ 16
	rrca			;a3ee
	rrca			;a3ef
	rrca			;a3f0
	rrca			;a3f1
	ret			;a3f2
lado_mas_abierto_x:		; cuanto hay libre a la derecha y a la izquierda (p05:A419): 2 o 3 hacia el mas abierto
	ld c,008h		;a3f3
	call libre_en_x		;a3f5   ; libre_en_x: B = cuantos pasos de C hay libres desde el actor (Y - 6)
	push bc			;a3f8
	ld c,0f8h		;a3f9
	call libre_en_x		;a3fb   ; libre_en_x: B = cuantos pasos de C hay libres desde el actor (Y - 6)
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
libre_en_y:		; D = 1: en vertical
	ld d,001h		;a415
	jr L_A41B		;a417
libre_en_x:		; B = cuantos pasos de C hay libres desde el actor (Y - 6)
	ld d,000h		;a419
L_A41B:
	ld h,(ix+005h)		;a41b   ; lee la X del actor
	ld a,(ix+003h)		;a41e   ; lee la Y del actor
	sub 006h		;a421
	ld l,a			;a423
	ld b,000h		;a424
L_A426:
	push hl			;a426   ; solido? se acabo
	push de			;a427
	push bc			;a428
	call 07f3dh		;a429   ; es_solido_si: acarreo si el caracter del mapa en (H = X, L = Y) llega al umbral de 0xCA4E (0xCA4F desde 0x81)
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
	inc b			;a43f   ; un paso mas
	jr L_A426		;a440
lado_mas_abierto_y:		; lo mismo arriba y abajo: 0 o 1 hacia el mas abierto
	ld c,008h		;a442
	call libre_en_y		;a444   ; libre_en_y: D = 1: en vertical
	push bc			;a447
	ld c,0f8h		;a448
	call libre_en_y		;a44a   ; libre_en_y: D = 1: en vertical
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
al_borde:		; acarreo si esta dentro: en vertical Y 0x10-0xBF, en horizontal X 0-0xB3 (0x10-0xBF hacia la izquierda)
	ld a,(ix+00ch)		;a45d
	rra			;a460
	ld bc,010b0h		;a461
	ld a,(ix+003h)		;a464   ; lee la Y del actor
	jr c,L_A478		;a467
	ld a,(ix+009h)		;a469   ; lee la velocidad del actor en X (alta)
	rla			;a46c
	ld a,(ix+005h)		;a46d   ; lee la X del actor
	ld bc,000b4h		;a470
	jr nc,L_A478		;a473
	ld bc,010b0h		;a475
L_A478:
	sub b			;a478
	cp c			;a479
	ret			;a47a
busca_paso_2:		; con 0xD42A, el aviso; la espera mirando (p06:B5E2 cada 16); al acabar, otra direccion
	ld a,(0d42ah)		;a47b
	and a			;a47e
	jp nz,aviso_y_paso_3		;a47f   ; aviso_y_paso_3: el aviso 0x82, el paso 3 y una direccion al azar
	dec (ix+00eh)		;a482   ; baja la espera del actor
	jr z,L_A496		;a485
	ld a,(ix+00eh)		;a487   ; lee la espera del actor
	and 00fh		;a48a
	ret nz			;a48c
	jp 08f0dh		;a48d   ; a_p06_b5e2: p06:B5E2 con el banco 6 en 0xA000
busca_paso_3:		; la espera mirando; al acabar, el paso 1 y otra direccion
	dec (ix+00eh)		;a490   ; baja la espera del actor
	jp nz,09e51h		;a493   ; mira_cada_16: cada 16 cuadros, p06:B5E2
L_A496:
	ld (ix+001h),001h		;a496   ; el paso del actor = 0x01
	jp gira_al_otro_eje		;a49a   ; gira_al_otro_eje: al otro eje, al azar segun el actor
anda_hasta_chocar:		; sin chocar de frente, anda; si choca, el paso siguiente y gira
	call 09038h		;a49d   ; choca_de_frente: A = los choques (C) en su eje: 3 vertical, 0x0C horizontal
	jp z,0900bh		;a4a0   ; p04:900B
	call paso_siguiente		;a4a3   ; paso_siguiente: el paso siguiente del actor
	jp gira_izquierda		;a4a6   ; gira_izquierda: gira a la izquierda (p05:A5E2) hasta una direccion libre
busca_por_el_pasillo:		; la direccion de ahora (0-3) con sus bits de lado (D) y de frente (E) y su tabla (p05:A59B)
	ld a,(ix+00ch)		;a4a9   ; el eje...
	rra			;a4ac
	jr nc,L_A4C0		;a4ad
	ld a,(ix+007h)		;a4af   ; lee la velocidad del actor en Y (alta)
	rla			;a4b2   ; en vertical: hacia arriba (0) o abajo (1)
	ld a,000h		;a4b3
	ld de,00101h		;a4b5
	jr c,L_A4CF		;a4b8
	inc a			;a4ba
	ld de,01002h		;a4bb
	jr L_A4CF		;a4be
L_A4C0:
	ld a,(ix+009h)		;a4c0   ; lee la velocidad del actor en X (alta)
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
	ld a,c			;a4da   ; lo de los lados...
	and 00eh		;a4db
	jr nz,L_A4E3		;a4dd
	ld a,c			;a4df
	and d			;a4e0
	jr nz,L_A4F4		;a4e1
L_A4E3:
	push de			;a4e3   ; ...si no hay salida, mira de frente: libre, anda; si no, gira
	call 090c8h		;a4e4   ; choques_del_actor: C = por donde choca el actor (bits 0-3), con los puntos de p04:915C (o p04:9164 desde 0xD800)
	pop de			;a4e7
	ld a,e			;a4e8
	and c			;a4e9
	jp z,0900bh		;a4ea   ; p04:900B
	xor a			;a4ed
	ld (ix+02ah),a		;a4ee
	jp gira_izquierda		;a4f1   ; gira_izquierda: gira a la izquierda (p05:A5E2) hasta una direccion libre
L_A4F4:
	inc (ix+02ah)		;a4f4   ; cuenta las salidas (como mucho 5, o 3 en la zona 0x0A filas 0-3)
	ld a,(0ca4ah)		;a4f7   ; lee la zona
	cp 00ah		;a4fa
	ld b,005h		;a4fc
	jr nz,L_A509		;a4fe
	ld a,(0ca50h)		;a500   ; lee la fila de la sala en la zona (uno mas al salir por arriba)
	cp 004h		;a503
	jr nc,L_A509		;a505
	ld b,003h		;a507
L_A509:
	ld a,(ix+02ah)		;a509
	cp b			;a50c
	jp nc,0900bh		;a50d   ; p04:900B
	ld h,(ix+005h)		;a510   ; recorre la linea hasta el borde: dos puntos a los lados
	ld l,(ix+003h)		;a513   ; lee la Y del actor
	ld a,(ix+00ch)		;a516
	rra			;a519
	jr nc,L_A54B		;a51a
	ld a,(ix+007h)		;a51c   ; lee la velocidad del actor en Y (alta)
	rla			;a51f
	ld b,008h		;a520
	jr nc,L_A526		;a522
	ld b,0f8h		;a524
L_A526:
	ld a,l			;a526
	cp 0c0h		;a527
	jp nc,paso_siguiente		;a529   ; paso_siguiente: el paso siguiente del actor
	push hl			;a52c
	push bc			;a52d
	ld a,h			;a52e
	sub 004h		;a52f
	ld h,a			;a531
	call 07f3dh		;a532   ; es_solido_si: acarreo si el caracter del mapa en (H = X, L = Y) llega al umbral de 0xCA4E (0xCA4F desde 0x81)
	pop bc			;a535
	pop hl			;a536
	jr c,L_A577		;a537
	push hl			;a539
	push bc			;a53a
	ld a,h			;a53b
	add a,003h		;a53c
	ld h,a			;a53e
	call 07f3dh		;a53f   ; es_solido_si: acarreo si el caracter del mapa en (H = X, L = Y) llega al umbral de 0xCA4E (0xCA4F desde 0x81)
	pop bc			;a542
	pop hl			;a543
	jr c,L_A577		;a544
	ld a,l			;a546
	add a,b			;a547
	ld l,a			;a548
	jr L_A526		;a549
L_A54B:
	ld a,(ix+009h)		;a54b   ; lee la velocidad del actor en X (alta)
	rla			;a54e
	ld b,008h		;a54f
	jr nc,L_A555		;a551
	ld b,0f8h		;a553
L_A555:
	ld a,h			;a555
	cp 0c0h		;a556
	jp nc,paso_siguiente		;a558   ; paso_siguiente: el paso siguiente del actor
	push hl			;a55b
	push bc			;a55c
	dec l			;a55d
	call 07f3dh		;a55e   ; es_solido_si: acarreo si el caracter del mapa en (H = X, L = Y) llega al umbral de 0xCA4E (0xCA4F desde 0x81)
	pop bc			;a561
	pop hl			;a562
	jr c,L_A577		;a563
	push hl			;a565
	push bc			;a566
	ld a,l			;a567
	sub 004h		;a568
	ld l,a			;a56a
	call 07f3dh		;a56b   ; es_solido_si: acarreo si el caracter del mapa en (H = X, L = Y) llega al umbral de 0xCA4E (0xCA4F desde 0x81)
	pop bc			;a56e
	pop hl			;a56f
	jr c,L_A577		;a570
	ld a,h			;a572
	add a,b			;a573
	ld h,a			;a574
	jr L_A555		;a575
L_A577:
	ld hl,0a5e6h		;a577   ; da con algo: gira a la derecha (p05:A5E6)
	jr gira_segun_tabla		;a57a
gira_izquierda:		; gira a la izquierda (p05:A5E2) hasta una direccion libre
	ld hl,0a5e2h		;a57c
gira_segun_tabla:		; la direccion nueva de la tabla de HL...
	ld a,(ix+01dh)		;a57f
	call 04248h		;a582   ; byte_de_tabla: A = el byte A de la tabla de HL (y HL apunta a el)
	ld (ix+01dh),a		;a585
	push af			;a588
	call 090c8h		;a589   ; ...libre? si no, otra vez
	pop af			;a58c
	ld b,a			;a58d
	inc b			;a58e
	ld a,c			;a58f
L_A590:
	rra			;a590
	djnz L_A590		;a591
	jr c,gira_izquierda		;a593
	ld a,(ix+01dh)		;a595   ; su velocidad
	jp 08e25h		;a598   ; a_p06_b592_b_4_5: a_p06_b592 y deja los bancos 4 y 5

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


cinco_puntos_abajo:		; C = los 5 puntos solidos (un bit cada uno) desde (Y - 0x12, X + 0x0B), de 6 en 6 hacia abajo
	ld de,00006h		;a5a3
	ld bc,00beeh		;a5a6
cinco_puntos:		; desde la Y + C y la X + B...
	ld a,(ix+003h)		;a5a9   ; lee la Y del actor
	add a,c			;a5ac
	ld l,a			;a5ad
	ld a,(ix+005h)		;a5ae   ; lee la X del actor
	add a,b			;a5b1
	ld h,a			;a5b2
	ld bc,00500h		;a5b3
L_A5B6:
	push hl			;a5b6
	push de			;a5b7
	push bc			;a5b8
	call 07f3dh		;a5b9   ; ...solido? al bit
	pop bc			;a5bc
	pop de			;a5bd
	pop hl			;a5be
	rl c		;a5bf
	ld a,h			;a5c1   ; el siguiente, D y E mas alla
	add a,d			;a5c2
	ld h,a			;a5c3
	ld a,l			;a5c4
	add a,e			;a5c5
	ld l,a			;a5c6
	djnz L_A5B6		;a5c7
	ret			;a5c9
cinco_puntos_abajo_b:
	ld de,00006h		;a5ca
	ld bc,0f3eeh		;a5cd
	jr cinco_puntos		;a5d0
cinco_puntos_lado:
	ld de,00600h		;a5d2
	ld bc,0f3eeh		;a5d5
	jr cinco_puntos		;a5d8
cinco_puntos_lado_b:
	ld de,00600h		;a5da
	ld bc,0f406h		;a5dd
	jr cinco_puntos		;a5e0

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


vuelve_al_camino:		; p04:9DCE: con acarreo, el paso 0x0A
	call 09dceh		;a5ea   ; p04:9DCE
	ret nc			;a5ed
	ld (ix+001h),00ah		;a5ee   ; el paso del actor = 0x0A
	ret			;a5f2
actor_de_a5f3:		; fuera de esta sala, sin musica; con 0xC693, el sonido 0x84; los pasos de p05:A614
	call 08100h		;a5f3   ; en_esta_sala: Z si el actor esta en la sala de ahora (fila y columna)
	jp nz,086a4h		;a5f6   ; acaba_musica_del_actor: con 0xCA26: lo quita, p01:7A12 y el banco del tipo (1 el 15, 2 y 6 el 10)
	ld hl,06bcch		;a5f9
	call 086d5h		;a5fc   ; si_c693: con 0xC693, lo borra y salta a HL
	ld a,(ix+001h)		;a5ff   ; lee el paso del actor
	ld hl,0a614h		;a602
	call 0424eh		;a605   ; salta_por_tabla: salta a la palabra A de la tabla de HL
	call 08082h		;a608   ; p14:BA36
	ld a,(ix+001h)		;a60b   ; desde el paso 6, la musica del actor
	cp 006h		;a60e
	ret c			;a610
	jp 08671h		;a611   ; musica_del_actor: la primera vez (0xCA26): ninguna pendiente y por el tipo (p04:8698)

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


paso_siguiente_b:		; el paso siguiente
	inc (ix+001h)		;a638   ; sube el paso del actor
	ret			;a63b
espera_a_snake:		; con Snake en Y 0x50-0x7F, X 0x78-0x7F: el bit 7 de 0xD7D1, 0xCB3C = 1, 0x20 cuadros y la musica 0xA6
	call 08079h		;a63c   ; y_x_de_snake_en_hl: L = la Y, H = la X de Snake
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
	ld (ix+00eh),020h		;a655   ; la espera del actor = 0x20
	call paso_siguiente_b		;a659   ; paso_siguiente_b: el paso siguiente
	jp 086c2h		;a65c   ; pon_musica_a6: 0xCA26 = 1, ninguna pendiente y el sonido 0xA6
mensaje_10:		; al acabar la espera, el mensaje 0x10 del banco 50
	dec (ix+00eh)		;a65f   ; baja la espera del actor
	ret nz			;a662
	ld de,00010h		;a663
mensaje_y_paso:		; el mensaje D del banco 50 en ventana estrecha y el paso siguiente
	call 061ceh		;a666   ; mensaje_de_50: 0xD8A8 = 1: la ventana estrecha
	jp paso_siguiente_b		;a669   ; paso_siguiente_b: el paso siguiente
fin_del_mensaje_40:		; al acabar el mensaje: 0x40 cuadros, p01:7A27 y el sonido 0x4A
	ld c,040h		;a66c
	call fin_del_mensaje		;a66e   ; fin_del_mensaje: al acabar el mensaje (Z): el byte 0x1C = 0, la espera C, p01:7A27 y el paso siguiente (acarreo)
	ret nc			;a671
	jp 06c47h		;a672   ; sonido_4a: pide el sonido 0x4A
fin_del_mensaje:		; al acabar el mensaje (Z): el byte 0x1C = 0, la espera C, p01:7A27 y el paso siguiente (acarreo)
	push bc			;a675
	call 06247h		;a676   ; mensaje_cada_cuadro_bancos_5:
	pop bc			;a679
	ret nz			;a67a
	ld (ix+01ch),000h		;a67b
	ld (ix+00eh),c		;a67f   ; guarda la espera del actor
	call 079c7h		;a682   ; llama_7a27_1: p01:7A27 con A = 1 y los bancos 4 y 5
	call paso_siguiente_b		;a685   ; paso_siguiente_b: el paso siguiente
	scf			;a688
	ret			;a689
sprites_en_escena:		; los sprites de p05:A6AF y la espera: en 0x1D el dibujo 2, en 0x10 el 7; al acabar, el mensaje 0x110
	call tres_pares_de_sprites		;a68a   ; tres_pares_de_sprites: los sprites 24-29 en tres pares de Y = 0x60, 0x56, 0x4C y X = 0x58, con los patrones 0x28/0x2C o 0x30/0x34
	dec (ix+00eh)		;a68d   ; baja la espera del actor
	jr z,escena_fin		;a690
	ld a,(ix+00eh)		;a692   ; lee la espera del actor
	cp 01dh		;a695
	call z,dibujo_2		;a697   ; dibujo_2:
	cp 010h		;a69a
	ret nz			;a69c
	ld (ix+00dh),007h		;a69d   ; el dibujo del actor (bit 0: el paso) = 0x07
	ret			;a6a1
dibujo_2:
	ld (ix+00dh),002h		;a6a2   ; el dibujo del actor (bit 0: el paso) = 0x02
	ret			;a6a6
escena_fin:
	call sin_sprites_24		;a6a7   ; sin_sprites_24: los sprites 24-31 fuera
	ld de,00110h		;a6aa
	jr mensaje_y_paso		;a6ad
tres_pares_de_sprites:		; los sprites 24-29 en tres pares de Y = 0x60, 0x56, 0x4C y X = 0x58, con los patrones 0x28/0x2C o 0x30/0x34
	ld hl,0dc60h		;a6af
	ld b,003h		;a6b2
	ld d,060h		;a6b4
L_A6B6:
	ld (hl),d			;a6b6   ; la Y del par
	inc hl			;a6b7
	ld (hl),058h		;a6b8   ; X = 0x58
	inc hl			;a6ba
	ld a,(ix+00eh)		;a6bb   ; lee la espera del actor
	rra			;a6be   ; segun la espera, los patrones 0x28/0x2C o 0x30/0x34
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
	ld hl,0db80h		;a6da   ; y sus colores de p05:A6E3
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


sin_sprites_24:		; los sprites 24-31 fuera
	ld hl,0dc60h		;a6f0
	ld bc,0001fh		;a6f3
	ld a,0e0h		;a6f6
	jp 04237h		;a6f8   ; llena_bloque: pone A en BC + 1 bytes desde HL
fin_del_mensaje_y_musica:		; al acabar el mensaje, la musica del actor
	ld c,000h		;a6fb
	call fin_del_mensaje		;a6fd   ; fin_del_mensaje: al acabar el mensaje (Z): el byte 0x1C = 0, la espera C, p01:7A27 y el paso siguiente (acarreo)
	ret nc			;a700
	jp 08685h		;a701   ; por_el_tipo_8698: por el byte del tipo en p04:8698 (p04:8691)
actor_suelto:		; 0xCB3C = 0, los bytes 0x11, 0x0E, 0x0D a 0, el 0x16 a 1 y el paso siguiente
	xor a			;a704
	ld (0cb3ch),a		;a705
	ld (ix+011h),a		;a708
	ld (ix+00eh),a		;a70b   ; guarda la espera del actor
	ld (ix+00dh),a		;a70e   ; guarda el dibujo del actor (bit 0: el paso)
	inc a			;a711
	ld (ix+016h),a		;a712
	jp paso_siguiente_b		;a715   ; paso_siguiente_b: el paso siguiente
actor_5_paso:		; con el byte 0x17 = 1 o Snake en el recuadro (p05:A767): el paso 9 y un salto (p05:A75F); si no, anda y, al acabar, gira
	ld a,(ix+017h)		;a718
	dec a			;a71b
	jr z,L_A73C		;a71c
	call snake_en_el_recuadro		;a71e   ; snake_en_el_recuadro: acarreo si Snake esta en X 0x38-0xC7 e Y 0x50-0x7F
	jr c,L_A73C		;a721
	ld a,(ix+007h)		;a723   ; parado en Y y por la derecha (X >= 0x80): p05:A8BF
	and a			;a726
	jr nz,L_A731		;a727
	ld a,(ix+005h)		;a729   ; lee la X del actor
	cp 080h		;a72c
	jp nc,dibujo_de_lado		;a72e   ; dibujo_de_lado: el dibujo 4 o 6 (el contrario) y su velocidad
L_A731:
	call anda_en_recuadro		;a731   ; anda_en_recuadro: el paso del dibujo, y fuera del recuadro (Y 0x20-0xBF, X 8-0xB7) o chocando: da la vuelta
	ld a,(ix+00eh)		;a734   ; lee la espera del actor
	and a			;a737
	ret nz			;a738
	jp para_y_gira		;a739   ; para_y_gira: guarda el dibujo (0x1B), p05:A8D2, 0x0C cuadros, sin eje, guarda el paso (0x1A) y al 0x0B
L_A73C:
	ld (ix+001h),009h		;a73c   ; el paso 9
	ld hl,0a75fh		;a740
salto_al_azar:		; una de las 4 palabras de HL a los bytes 0x18-0x19, sin eje, 8 cuadros y el sonido 0x4B
	call 04256h		;a743   ; azar: A = un numero al azar (0xCA03 rotado mas R)
	and 003h		;a746
	call 043f6h		;a748   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld (ix+018h),l		;a74b
	ld (ix+019h),h		;a74e
	xor a			;a751
	ld (ix+00ch),a		;a752
	ld (ix+016h),a		;a755
	ld (ix+00eh),008h		;a758   ; la espera del actor = 0x08
	jp 06c4bh		;a75c   ; sonido_4b: pide el sonido 0x4B

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


snake_en_el_recuadro:		; acarreo si Snake esta en X 0x38-0xC7 e Y 0x50-0x7F
	call 08079h		;a767   ; la Y y la X de Snake
	ex de,hl			;a76a
	ld a,d			;a76b   ; la X en 0x38-0xC7...
	sub 038h		;a76c
	cp 090h		;a76e
	ret nc			;a770
	ld a,e			;a771   ; ...y la Y en 0x50-0x7F
	sub 050h		;a772
	cp 030h		;a774
	ret			;a776
velocidad_del_dibujo:		; la velocidad de la direccion del dibujo (p05:A7AD por el tipo)
	ld a,(ix+00dh)		;a777   ; lee el dibujo del actor (bit 0: el paso)
	rrca			;a77a
	and 003h		;a77b
velocidad_de_b:
	ld b,a			;a77d
	ld a,(ix+000h)		;a77e   ; lee el tipo del actor (0 = libre)
velocidad_de_tipo:		; la velocidad del tipo A (p05:A7AD) en la direccion B (p05:A79C), y el byte 0x0C = 3
	ld hl,0a7adh		;a781
	call 043f6h		;a784   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ex de,hl			;a787
	ld a,b			;a788
	ld hl,0a79ch		;a789
	call 0424eh		;a78c   ; salta_por_tabla: salta a la palabra A de la tabla de HL
	call 08097h		;a78f   ; pon_velocidad_x: la velocidad en X = DE
	ex de,hl			;a792
	call 080a7h		;a793   ; pon_velocidad_y: la velocidad en Y = DE
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


velocidad_y_menos:
	call 04442h		;a7a4   ; de_negativo: DE = -DE
velocidad_y_mas:
	ex de,hl			;a7a7
	ld de,00000h		;a7a8
	ret			;a7ab
velocidad_x_menos:
	call 04442h		;a7ac   ; de_negativo: DE = -DE
velocidad_x_mas:
	ld hl,00000h		;a7af
	ret			;a7b2

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa7b3..0xa7c3  (16 bytes)
DATA_A7B3:
	defb 000h,004h,000h,004h,000h,002h,000h,003h,080h,003h,080h,001h,080h,003h,080h,002h	; a7b3  ................

; ======================================================================
; CODIGO 0xa7c3..0xa86d  (170 bytes)
; ======================================================================


actor_5_paso_b:		; como p05:A718 al reves: fuera del recuadro, p05:A862
	ld a,(ix+017h)		;a7c3
	dec a			;a7c6
	jp z,salta_y_paso_0a		;a7c7   ; salta_y_paso_0a: un salto al azar de p05:A86D y el paso 0x0A
	call snake_en_el_recuadro		;a7ca   ; snake_en_el_recuadro: acarreo si Snake esta en X 0x38-0xC7 e Y 0x50-0x7F
	jp nc,salta_y_paso_0a		;a7cd   ; salta_y_paso_0a: un salto al azar de p05:A86D y el paso 0x0A
	ld a,(ix+007h)		;a7d0   ; lee la velocidad del actor en Y (alta)
	and a			;a7d3
	jr nz,L_A7DE		;a7d4
	ld a,(ix+005h)		;a7d6   ; lee la X del actor
	cp 090h		;a7d9
	jp nc,dibujo_de_lado		;a7db   ; dibujo_de_lado: el dibujo 4 o 6 (el contrario) y su velocidad
L_A7DE:
	call anda_en_recuadro		;a7de   ; anda_en_recuadro: el paso del dibujo, y fuera del recuadro (Y 0x20-0xBF, X 8-0xB7) o chocando: da la vuelta
	ld a,(ix+00eh)		;a7e1   ; lee la espera del actor
	and a			;a7e4
	ret nz			;a7e5
para_y_gira:		; guarda el dibujo (0x1B), p05:A8D2, 0x0C cuadros, sin eje, guarda el paso (0x1A) y al 0x0B
	ld a,(ix+00dh)		;a7e6   ; lee el dibujo del actor (bit 0: el paso)
	ld (ix+01bh),a		;a7e9
	call dibujo_por_b4e1		;a7ec   ; dibujo_por_b4e1: el dibujo 9 + 2 * B (p05:B4E1)
	ld bc,00c0bh		;a7ef
	ld (ix+00eh),b		;a7f2   ; guarda la espera del actor
	ld (ix+00ch),000h		;a7f5
	ld a,(ix+001h)		;a7f9   ; lee el paso del actor
	ld (ix+01ah),a		;a7fc
	ld (ix+001h),c		;a7ff   ; guarda el paso del actor
	ret			;a802
anda_en_recuadro:		; el paso del dibujo, y fuera del recuadro (Y 0x20-0xBF, X 8-0xB7) o chocando: da la vuelta
	call 086deh		;a803   ; cambia_paso_cada_2: el byte 0x11 uno mas; cada 2, el paso del dibujo
	ld (ix+00fh),000h		;a806
	dec (ix+00eh)		;a80a   ; baja la espera del actor
	ret z			;a80d
	ld a,(ix+003h)		;a80e   ; lee la Y del actor
	sub 020h		;a811
	cp 0a0h		;a813
	jr nc,L_A82F		;a815
	ld a,(ix+005h)		;a817   ; lee la X del actor
	sub 008h		;a81a
	cp 0b0h		;a81c
	jr nc,L_A82F		;a81e
	call 090c8h		;a820   ; choques_del_actor: C = por donde choca el actor (bits 0-3), con los puntos de p04:915C (o p04:9164 desde 0xD800)
	ld a,(ix+00ch)		;a823
	rra			;a826
	ld a,003h		;a827
	jr c,L_A82D		;a829
	ld a,00ch		;a82b
L_A82D:
	and c			;a82d
	ret z			;a82e
L_A82F:
	ld (ix+00eh),000h		;a82f   ; la espera del actor = 0x00
	ld (ix+00fh),001h		;a833
	call 0808bh		;a837   ; da_la_vuelta_al_actor: las dos velocidades del actor cambiadas de signo
	ld a,003h		;a83a
	jp 08085h		;a83c   ; llama_ba36_a:
gira_a_snake_x:		; hacia Snake en X (p05:A875) con una espera de 8-15
	call dibujo_hacia_x		;a83f   ; dibujo_hacia_x: el dibujo de lado o del otro eje, al azar, sin chocar
	jr L_A847		;a842
gira_a_snake_y:		; hacia Snake en Y (p05:A894) con una espera de 8-15
	call dibujo_al_azar		;a844   ; dibujo_al_azar: un dibujo de direccion al azar (0, 2, 4, 6)
L_A847:
	call velocidad_del_dibujo		;a847   ; velocidad_del_dibujo: la velocidad de la direccion del dibujo (p05:A7AD por el tipo)
	call 04256h		;a84a   ; azar: A = un numero al azar (0xCA03 rotado mas R)
	and 007h		;a84d
	add a,008h		;a84f
	ld (ix+00eh),a		;a851   ; guarda la espera del actor
	ld c,a			;a854
	ld a,(ix+000h)		;a855   ; lee el tipo del actor (0 = libre)
	cp 005h		;a858
	ret nz			;a85a
	ld a,c			;a85b   ; el tipo 5, 16 cuadros mas
	add a,010h		;a85c
	ld (ix+00eh),a		;a85e   ; guarda la espera del actor
	ret			;a861
salta_y_paso_0a:		; un salto al azar de p05:A86D y el paso 0x0A
	ld hl,0a86dh		;a862
	call salto_al_azar		;a865   ; salto_al_azar: una de las 4 palabras de HL a los bytes 0x18-0x19, sin eje, 8 cuadros y el sonido 0x4B
	ld (ix+001h),00ah		;a868   ; el paso del actor = 0x0A
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


dibujo_hacia_x:		; el dibujo de lado o del otro eje, al azar, sin chocar
	call 04256h		;a875   ; azar: A = un numero al azar (0xCA03 rotado mas R)
	ld d,a			;a878
	ld a,(ix+00dh)		;a879   ; lee el dibujo del actor (bit 0: el paso)
	cp 004h		;a87c
	jr nc,L_A88A		;a87e
	ld a,d			;a880
	rra			;a881
	ld d,004h		;a882
	jr c,dibujo_libre		;a884
	ld d,006h		;a886
	jr dibujo_libre		;a888
L_A88A:
	ld a,d			;a88a   ; en vertical: 0 o 2 al azar
	rra			;a88b
	ld d,000h		;a88c
	jr c,dibujo_libre		;a88e
	ld d,002h		;a890
	jr dibujo_libre		;a892
dibujo_al_azar:		; un dibujo de direccion al azar (0, 2, 4, 6)
	call 04256h		;a894   ; azar: A = un numero al azar (0xCA03 rotado mas R)
	rlca			;a897
	rlca			;a898
	and 006h		;a899
	ld d,a			;a89b
dibujo_libre:		; si choca por alli, el de p05:A8BB
	call choca_por_d		;a89c   ; choca_por_d: acarreo si C tiene el bit de la direccion D
	jr nc,L_A8AC		;a89f
	ld a,d			;a8a1
	rrca			;a8a2
	and 003h		;a8a3
	ld hl,0a8bbh		;a8a5
	call 0423eh		;a8a8   ; suma_a_hl: HL = HL + A
	ld d,(hl)			;a8ab
L_A8AC:
	ld (ix+00dh),d		;a8ac   ; guarda el dibujo del actor (bit 0: el paso)
	ret			;a8af
choca_por_d:		; acarreo si C tiene el bit de la direccion D
	ld a,d			;a8b0   ; la direccion del dibujo...
	rrca			;a8b1
	and 003h		;a8b2
	ld b,a			;a8b4
	inc b			;a8b5
	ld a,c			;a8b6   ; ...el bit de C
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


dibujo_de_lado:		; el dibujo 4 o 6 (el contrario) y su velocidad
	ld a,(ix+00dh)		;a8bf   ; lee el dibujo del actor (bit 0: el paso)
	and 0feh		;a8c2
	cp 004h		;a8c4
	ld a,006h		;a8c6
	jr z,L_A8CC		;a8c8
	ld a,004h		;a8ca
L_A8CC:
	ld (ix+00dh),a		;a8cc   ; guarda el dibujo del actor (bit 0: el paso)
	jp velocidad_del_dibujo		;a8cf   ; velocidad_del_dibujo: la velocidad de la direccion del dibujo (p05:A7AD por el tipo)
dibujo_por_b4e1:		; el dibujo 9 + 2 * B (p05:B4E1)
	call direccion_por_angulo		;a8d2   ; direccion_por_angulo: B = el cuarto del angulo hacia Snake: 3 (0xE0-0x1F), 1 (0x20-0x5F), 2 (0x60-0x9F), 0 (0xA0-0xDF)
	ld a,b			;a8d5
	add a,a			;a8d6
	add a,008h		;a8d7
	inc a			;a8d9
	ld (ix+00dh),a		;a8da   ; guarda el dibujo del actor (bit 0: el paso)
	ret			;a8dd
salto_paso_8:		; el salto (p05:A8ED); al acabar, el paso 8 con su velocidad
	call salto		;a8de   ; salto: la espera; cambia la Y y la X con los bytes 0x18-0x19 (el sitio de destino)
	ret nz			;a8e1
	ld (ix+016h),001h		;a8e2
	ld (ix+001h),008h		;a8e6   ; el paso del actor = 0x08
	jp velocidad_del_dibujo		;a8ea   ; velocidad_del_dibujo: la velocidad de la direccion del dibujo (p05:A7AD por el tipo)
salto:		; la espera; cambia la Y y la X con los bytes 0x18-0x19 (el sitio de destino)
	dec (ix+00eh)		;a8ed   ; baja la espera del actor
	ret z			;a8f0
	ld a,(ix+003h)		;a8f1   ; lee la Y del actor
	ld b,(ix+018h)		;a8f4
	ld (ix+003h),b		;a8f7   ; guarda la Y del actor
	ld (ix+018h),a		;a8fa
	ld a,(ix+005h)		;a8fd   ; lee la X del actor
	ld b,(ix+019h)		;a900
	ld (ix+005h),b		;a903   ; guarda la X del actor
	ld (ix+019h),a		;a906
	ret			;a909
salto_paso_7:		; el salto; al acabar, el paso 7 con su velocidad
	call salto		;a90a   ; salto: la espera; cambia la Y y la X con los bytes 0x18-0x19 (el sitio de destino)
	ret nz			;a90d
	ld (ix+016h),001h		;a90e
	ld (ix+001h),007h		;a912   ; el paso del actor = 0x07
	jp velocidad_del_dibujo		;a916   ; velocidad_del_dibujo: la velocidad de la direccion del dibujo (p05:A7AD por el tipo)
lanza_cada_4_b:		; la espera; cada 4 cuadros (en el 2), lanza el 5; al acabar, el paso de antes y gira
	dec (ix+00eh)		;a919   ; baja la espera del actor
	jr z,L_A92A		;a91c
	ld a,(ix+00eh)		;a91e   ; lee la espera del actor
	and 003h		;a921
	ret z			;a923
	cp 002h		;a924
	ret nz			;a926
	jp 09b06h		;a927   ; lanza_5: p06:A942 y lo lanzado de tipo 5
L_A92A:
	ld a,(ix+01ah)		;a92a
	ld (ix+001h),a		;a92d   ; guarda el paso del actor
	call 090c8h		;a930   ; choques_del_actor: C = por donde choca el actor (bits 0-3), con los puntos de p04:915C (o p04:9164 desde 0xD800)
	ld a,(ix+00fh)		;a933
	and a			;a936
	jp z,gira_a_snake_y		;a937   ; gira_a_snake_y: hacia Snake en Y (p05:A894) con una espera de 8-15
	ld a,(ix+01bh)		;a93a
	ld (ix+00dh),a		;a93d   ; guarda el dibujo del actor (bit 0: el paso)
	jp gira_a_snake_x		;a940   ; gira_a_snake_x: hacia Snake en X (p05:A875) con una espera de 8-15
entra_en_escena:		; el paso siguiente, 0xCB3C = 1, 0x18 cuadros y hacia el centro por el eje que toca
	call paso_siguiente_b		;a943   ; paso_siguiente_b: el paso siguiente
	ld a,001h		;a946
	ld (0cb3ch),a		;a948
	ld (ix+00eh),018h		;a94b   ; la espera del actor = 0x18
	ld de,00100h		;a94f
	ld a,(ix+003h)		;a952   ; lee la Y del actor
	cp 040h		;a955
	jr c,L_A968		;a957
	cp 090h		;a959
	jr nc,L_A968		;a95b
	ld a,(ix+005h)		;a95d   ; lee la X del actor
	cp 028h		;a960
	jr c,L_A980		;a962
	cp 098h		;a964
	jr nc,L_A980		;a966
L_A968:
	ld (ix+00ch),002h		;a968   ; en horizontal: hacia la izquierda si esta a la derecha
	ld b,006h		;a96c
	ld a,(ix+005h)		;a96e   ; lee la X del actor
	cp 080h		;a971
	jr c,L_A97A		;a973
	call nc,04442h		;a975   ; de_negativo: DE = -DE
	ld b,004h		;a978
L_A97A:
	ld (ix+00dh),b		;a97a   ; guarda el dibujo del actor (bit 0: el paso)
	jp 08097h		;a97d   ; pon_velocidad_x: la velocidad en X = DE
L_A980:
	ld (ix+00ch),001h		;a980   ; en vertical: hacia arriba si esta abajo
	ld b,002h		;a984
	ld a,(ix+003h)		;a986   ; lee la Y del actor
	cp 060h		;a989
	jr c,L_A992		;a98b
	call 04442h		;a98d   ; de_negativo: DE = -DE
	ld b,000h		;a990
L_A992:
	ld (ix+00dh),b		;a992   ; guarda el dibujo del actor (bit 0: el paso)
	jp 080a7h		;a995   ; pon_velocidad_y: la velocidad en Y = DE
llega_a_escena:		; anda; al acabar, parado con el dibujo 0x10, en su sitio (p05:A9B9), el sonido 0x93 y la musica de p01:6C37
	dec (ix+00eh)		;a998   ; baja la espera del actor
	jp nz,086deh		;a99b   ; cambia_paso_cada_2: el byte 0x11 uno mas; cada 2, el paso del dibujo
	xor a			;a99e
	ld (ix+00ch),a		;a99f
	ld (ix+00eh),020h		;a9a2   ; la espera del actor = 0x20
	ld (ix+00dh),010h		;a9a6   ; el dibujo del actor (bit 0: el paso) = 0x10
	call sitio_en_escena		;a9aa   ; sitio_en_escena: con la Y 0x40-0x97: la X a 0x18, 0x48 o 0xA8 segun donde este
	call 06c1bh		;a9ad   ; sonido_93: pide el sonido 0x93 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld hl,06c37h		;a9b0
	call 07c85h		;a9b3   ; pide_musica_hl: la musica de la rutina HL: si no es la pendiente, pendiente dentro de 0x78 cuadros
	jp paso_siguiente_b		;a9b6   ; paso_siguiente_b: el paso siguiente
sitio_en_escena:		; con la Y 0x40-0x97: la X a 0x18, 0x48 o 0xA8 segun donde este
	ld a,(ix+003h)		;a9b9   ; lee la Y del actor
	ld b,a			;a9bc   ; B = la Y
	sub 040h		;a9bd   ; en 0x40-0x97...
	cp 058h		;a9bf
	ret nc			;a9c1
	ld a,(ix+005h)		;a9c2   ; lee la X del actor
	cp 030h		;a9c5   ; ...la X: por debajo de 0x30, 0x18...
	ld c,018h		;a9c7
	jr c,L_A9E0		;a9c9
	cp 048h		;a9cb   ; ...de 0x48, 0x48...
	ld c,048h		;a9cd
	jr c,L_A9E0		;a9cf
	cp 098h		;a9d1   ; ...desde 0x98, 0xA8...
	ld c,0a8h		;a9d3
	jr nc,L_A9E0		;a9d5
	cp 078h		;a9d7   ; ...desde 0x78 con la Y en 0x70-0x7F, 0xA8
	ret c			;a9d9
	ld a,b			;a9da
	sub 070h		;a9db
	cp 010h		;a9dd
	ret nc			;a9df
L_A9E0:
	ld (ix+005h),c		;a9e0   ; guarda la X del actor
	ret			;a9e3
mensaje_por_sitio:		; al acabar la espera: el sonido 0x9C y el mensaje de p05:AA1D segun la fila de Snake y la suya (3 x 3)
	dec (ix+00eh)		;a9e4   ; baja la espera del actor
	ret nz			;a9e7
	call 06bach		;a9e8   ; sonido_9c: pide el sonido 0x9C (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld (ix+011h),000h		;a9eb
	ld b,000h		;a9ef
	ld a,(0cb03h)		;a9f1   ; lee la Y de Snake
	cp 040h		;a9f4
	jr c,L_A9FE		;a9f6
	inc b			;a9f8
	cp 080h		;a9f9
	jr c,L_A9FE		;a9fb
	inc b			;a9fd
L_A9FE:
	ld a,(ix+003h)		;a9fe   ; lee la Y del actor
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
	jp mensaje_y_paso		;aa1a   ; mensaje_y_paso: el mensaje D del banco 50 en ventana estrecha y el paso siguiente

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


tras_el_mensaje:		; al acabar el mensaje, 0x10 cuadros, el dibujo siguiente y el sonido 0x93
	ld c,020h		;aa26
	call fin_del_mensaje		;aa28   ; fin_del_mensaje: al acabar el mensaje (Z): el byte 0x1C = 0, la espera C, p01:7A27 y el paso siguiente (acarreo)
	ret nc			;aa2b
	ld (ix+00eh),010h		;aa2c   ; la espera del actor = 0x10
	inc (ix+00dh)		;aa30   ; sube el dibujo del actor (bit 0: el paso)
	jp 06c1bh		;aa33   ; sonido_93: pide el sonido 0x93 (de los que tienen la partitura en un banco de musica, p16:4CE3)
al_paso_20:		; al acabar la espera, 0xCB3C = 0 y el paso 0x20
	dec (ix+00eh)		;aa36   ; baja la espera del actor
	ret nz			;aa39
	xor a			;aa3a
	ld (0cb3ch),a		;aa3b
	ld (ix+001h),020h		;aa3e   ; el paso del actor = 0x20
	ret			;aa42
pasos_de_d8a0:		; con 0xD8A0, por su paso (p05:AA4D)
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


d8a0_cuenta:		; la espera de 0xD8A1; cada 16, el paso siguiente y p11:A000
	ex de,hl			;aa59
	inc hl			;aa5a
	dec (hl)			;aa5b
	ret nz			;aa5c
	ld (hl),010h		;aa5d
	dec hl			;aa5f
	inc (hl)			;aa60
	jp 08b90h		;aa61   ; vida_al_acabar: los tipos con 0 en p04:8BAA suben el nivel de Snake (y el sonido 0x4D); todos llenan la vida
d8a0_deja_cosa:		; al acabar la espera: 0xD8A0 = 0, la cosa 0x28 en (0x70, 0x60), 0xD4EB = 1 y el sonido 0x42
	ex de,hl			;aa64
	inc hl			;aa65
	dec (hl)			;aa66
	ret nz			;aa67
	dec hl			;aa68
	ld (hl),000h		;aa69
	ld c,028h		;aa6b
	ld de,06070h		;aa6d
	call 07ac0h		;aa70   ; a_p02_905e: p02:905E con el banco 2 en 0x8000
	ld a,001h		;aa73
	ld (0d4ebh),a		;aa75
	jp 06c3bh		;aa78   ; sonido_42: pide el sonido 0x42
d8a0_quita_0b:		; el paso siguiente, 0x10 cuadros y fuera la ficha 0xD800 de tipo 0x0B
	ex de,hl			;aa7b
	inc (hl)			;aa7c
	inc hl			;aa7d
	ld (hl),010h		;aa7e
	ld ix,0d800h		;aa80   ; apunta a 4 fichas de 0x20 bytes de 0xD800 (p04:89C3); sus tipos los lleva p10
	ld (ix+000h),00bh		;aa84   ; el tipo de la ficha de 0xD800 = 0x0B
	call 08c65h		;aa88   ; bandera_y_b14e:
	ld (ix+000h),000h		;aa8b   ; el tipo de la ficha de 0xD800 = 0x00
	ret			;aa8f
d8a0_cuatro_0b:		; el paso siguiente, 0x40 cuadros, las 4 fichas de 0xD800 de tipo 0x0B desde p05:AAEF y el bit 5 de 0xD7D6
	ex de,hl			;aa90
	inc (hl)			;aa91
	inc hl			;aa92
	ld (hl),040h		;aa93
	inc hl			;aa95
	xor a			;aa96
	ld (hl),a			;aa97
	ld (0d8ach),a		;aa98
	ld hl,0d800h		;aa9b   ; apunta a 4 fichas de 0x20 bytes de 0xD800 (p04:89C3); sus tipos los lleva p10
	ld bc,0007fh		;aa9e
	call 04236h		;aaa1   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	ld hl,0d7d6h		;aaa4
	set 5,(hl)		;aaa7
	ld hl,0aaefh		;aaa9
	ld ix,0d800h		;aaac   ; apunta a 4 fichas de 0x20 bytes de 0xD800 (p04:89C3); sus tipos los lleva p10
	ld bc,00400h		;aab0
L_AAB3:
	ld (ix+000h),00bh		;aab3   ; [tipo 0x0B]...
	ld a,(hl)			;aab7   ; ...la Y, la X y el dibujo de la lista...
	ld (ix+003h),a		;aab8   ; guarda la Y de la ficha de 0xD800
	inc hl			;aabb
	ld a,(hl)			;aabc
	ld (ix+005h),a		;aabd   ; guarda la X de la ficha de 0xD800
	inc hl			;aac0
	ld a,(hl)			;aac1
	ld (ix+00dh),a		;aac2   ; guarda el dibujo de la ficha de 0xD800
	inc hl			;aac5
	ld (ix+01ah),c		;aac6   ; ...su numero (0x1A)...
	ld de,(0ca50h)		;aac9   ; ...en esta sala...
	ld (ix+00ah),e		;aacd
	ld (ix+00bh),d		;aad0
	ld (ix+010h),020h		;aad3   ; ...con el byte 0x10 = 0x20
	ld de,00020h		;aad7
	add ix,de		;aada
	inc c			;aadc
	djnz L_AAB3		;aadd
	xor a			;aadf   ; los tipos a 0 (aun no estan)
	ld (0d800h),a		;aae0   ; guarda 4 fichas de 0x20 bytes de 0xD800 (p04:89C3); sus tipos los lleva p10
	ld (0d820h),a		;aae3
	ld (0d840h),a		;aae6
	ld (0d860h),a		;aae9
	jp 05019h		;aaec   ; los sprites de p35:8773

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


escena_d8ac:		; con 0xC693, el sonido 0x84; los pasos de 0xD8AC (p05:AB08)
	ld hl,06bcch		;aafb
	call 086d5h		;aafe   ; si_c693: con 0xC693, lo borra y salta a HL
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


escena_d8ac_0:		; 0xCB3C = 1, el paso siguiente y 0x20 cuadros
	ex de,hl			;ab18
	ld a,001h		;ab19   ; 0xCB3C = 1
	ld (0cb3ch),a		;ab1b
	inc (hl)			;ab1e   ; el paso siguiente...
	inc hl			;ab1f
	ld (hl),020h		;ab20   ; ...y 0x20 cuadros
	ret			;ab22
escena_d8ac_1:		; al acabar la espera: 0x40 cuadros, el paso siguiente, el sonido 0x81 y p03:B11F con 0
	ex de,hl			;ab23
	inc hl			;ab24
	dec (hl)			;ab25
	ret nz			;ab26
	ld (hl),040h		;ab27
	dec hl			;ab29
	inc (hl)			;ab2a
	call 06b95h		;ab2b   ; sonido_81: pide el sonido 0x81 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	xor a			;ab2e
	jp 079e9h		;ab2f   ; a_p03_b11f: p03:B11F con el banco 3 en 0xA000
escena_d8ac_2:		; p03:B132; al acabar la espera, 0x20 cuadros, 0xE25A = 1, p03:B19A y la conversacion 0
	push de			;ab32
	call 079f1h		;ab33   ; a_p03_b132: p03:B132 con el banco 3 en 0xA000
	pop hl			;ab36
	inc hl			;ab37
	dec (hl)			;ab38
	ret nz			;ab39
	ld (hl),020h		;ab3a
	dec hl			;ab3c
	inc (hl)			;ab3d
	ld a,001h		;ab3e
	ld (0e25ah),a		;ab40
	call 079fah		;ab43   ; a_p03_b19a: p03:B19A con el banco 3 en 0xA000
	xor a			;ab46
	jp 06250h		;ab47   ; conversacion_de_a: la conversacion de p48:8010 (A = 0), p48:8012 (1) o p48:8014 (2)
escena_d8ac_3:		; al acabar la espera, el paso siguiente y el sonido 0xA6
	ex de,hl			;ab4a
	inc hl			;ab4b
	dec (hl)			;ab4c
	ret nz			;ab4d
	dec hl			;ab4e
	inc (hl)			;ab4f
	jp 06bd0h		;ab50   ; sonido_a6: pide el sonido 0xA6 (de los que tienen la partitura en un banco de musica, p16:4CE3)
escena_d8ac_4:		; 0xE25A = 0, 8 cuadros y las fichas 0xD820-0xD860 de tipo 0x0B
	xor a			;ab53
	ld (0e25ah),a		;ab54   ; 0xE25A = 0
	ex de,hl			;ab57
	inc (hl)			;ab58   ; el paso siguiente, 8 cuadros
	inc hl			;ab59
	ld (hl),008h		;ab5a
	ld a,00bh		;ab5c   ; las tres fichas de tipo 0x0B
	ld (0d820h),a		;ab5e
	ld (0d840h),a		;ab61
	ld (0d860h),a		;ab64
	ret			;ab67
escena_d8ac_5:		; al acabar la espera, el mensaje 0x810 del banco 50
	ex de,hl			;ab68
	inc hl			;ab69
	dec (hl)			;ab6a
	ret nz			;ab6b
	dec hl			;ab6c
	inc (hl)			;ab6d
	ld de,00810h		;ab6e
	jp 061ceh		;ab71   ; mensaje_de_50: 0xD8A8 = 1: la ventana estrecha
escena_d8ac_6:		; al acabar el mensaje, p01:7A27 y el paso siguiente
	call 06247h		;ab74   ; mensaje_cada_cuadro_bancos_5:
	ret nz			;ab77
	call 079c7h		;ab78   ; llama_7a27_1: p01:7A27 con A = 1 y los bancos 4 y 5
	ld hl,0d8ach		;ab7b
	inc (hl)			;ab7e
	ret			;ab7f
escena_d8ac_7:		; 0xD8A0 = 3, 0xCB3C = 0, la ficha 0xD800 de tipo 0x0B y su musica
	ld a,003h		;ab80
	ld (0d8a0h),a		;ab82
	xor a			;ab85
	ld (0cb3ch),a		;ab86
	ld a,00bh		;ab89
	ld (0d800h),a		;ab8b   ; guarda 4 fichas de 0x20 bytes de 0xD800 (p04:89C3); sus tipos los lleva p10
	ld ix,0d800h		;ab8e   ; apunta a 4 fichas de 0x20 bytes de 0xD800 (p04:89C3); sus tipos los lleva p10
	jp 08685h		;ab92   ; por_el_tipo_8698: por el byte del tipo en p04:8698 (p04:8691)
escena_d8ac_8:		; p14:AF96: sin ninguno, 0xD8A0 = 4; cada 4 cuadros, las fichas de 0xD800 paradas en el lado de Snake se ponen en marcha
	push de			;ab95
	call quedan_fichas		;ab96   ; quedan_fichas: p14:AF96: C = cuantas quedan; con 0, 0xD8A0 = 4 y Z
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
	call 08079h		;abae   ; cada 32 vueltas, nada
	ex de,hl			;abb1
	ld hl,0d800h		;abb2   ; las 4 fichas de 0xD800
	ld bc,00400h		;abb5
L_ABB8:
	push bc			;abb8
	push hl			;abb9
	ld a,(hl)			;abba
	and a			;abbb
	jr z,L_ABCC		;abbc
	inc hl			;abbe   ; paradas (paso 0)...
	ld a,(hl)			;abbf
	and a			;abc0
	jr nz,L_ABCC		;abc1
	push hl			;abc3
	call snake_de_su_lado		;abc4   ; ...si Snake esta de su lado (p05:ABE3), el paso 1
	pop hl			;abc7
	jr nc,L_ABCC		;abc8
	ld (hl),001h		;abca
L_ABCC:
	pop hl			;abcc   ; la ficha siguiente
	ld bc,00020h		;abcd
	add hl,bc			;abd0
	pop bc			;abd1
	inc c			;abd2
	djnz L_ABB8		;abd3
	ret			;abd5
quedan_fichas:		; p14:AF96: C = cuantas quedan; con 0, 0xD8A0 = 4 y Z
	call 08751h		;abd6   ; a_p14_af96: p14:AF96 con el banco 14 en 0xA000
	ld a,c			;abd9
	and a			;abda
	ret nz			;abdb
	ld a,004h		;abdc
	ld (0d8a0h),a		;abde
	xor a			;abe1
	ret			;abe2
snake_de_su_lado:		; por el numero de ficha C: Snake por debajo de Y = 0x60, por encima de 0x80, a la derecha de X = 0x50, a la izquierda de 0x70
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
fichas_d800_en_3_4:		; las fichas de 0xD800 en los pasos 3-4: p14:AE76
	ld ix,0d800h		;ac01   ; apunta a 4 fichas de 0x20 bytes de 0xD800 (p04:89C3); sus tipos los lleva p10
	ld b,004h		;ac05
L_AC07:
	ld a,(ix+000h)		;ac07   ; lee el tipo de la ficha de 0xD800
	and a			;ac0a
	jr z,L_AC17		;ac0b
	ld a,(ix+001h)		;ac0d   ; lee el paso de la ficha de 0xD800
	sub 003h		;ac10
	cp 002h		;ac12
	call c,08759h		;ac14   ; a_p14_ae76: p14:AE76 con el banco 14 en 0xA000
L_AC17:
	ld de,00020h		;ac17
	add ix,de		;ac1a
	djnz L_AC07		;ac1c
	ret			;ac1e
actor_de_la_especial_29:		; solo en la especial 0x29 (si no, sin musica); con 0xC693 el sonido 0x84; los pasos de p05:AC48
	ld a,(0ca76h)		;ac1f   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 029h		;ac22
	jp nz,086a4h		;ac24   ; acaba_musica_del_actor: con 0xCA26: lo quita, p01:7A12 y el banco del tipo (1 el 15, 2 y 6 el 10)
	ld hl,06bcch		;ac27
	call 086d5h		;ac2a   ; si_c693: con 0xC693, lo borra y salta a HL
	ld a,(ix+001h)		;ac2d   ; lee el paso del actor
	ld hl,0ac48h		;ac30
	call 0424eh		;ac33   ; salta_por_tabla: salta a la palabra A de la tabla de HL
	call 08082h		;ac36   ; llama_ba36: p14:BA36 con el byte 0x0C del actor
	ld a,(0ca4bh)		;ac39   ; desde la sala 2 y en los pasos 0-0x0E, la musica del actor
	cp 002h		;ac3c
	ret c			;ac3e
	ld a,(ix+001h)		;ac3f   ; lee el paso del actor
	cp 00fh		;ac42
	ret nc			;ac44
	jp 08671h		;ac45   ; musica_del_actor: la primera vez (0xCA26): ninguna pendiente y por el tipo (p04:8698)

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


especial_29_paso_0:		; desde la sala 2: 0xCB3C = 1, la direccion 2, el bit 0 de 0xD7D1, la musica 0xA6 y el paso siguiente
	ld a,(0ca4bh)		;ac6e   ; lee la sala de la zona
	cp 002h		;ac71
	ret c			;ac73
	ld a,001h		;ac74
	ld (0cb3ch),a		;ac76
	inc a			;ac79
	call pon_direccion		;ac7a   ; pon_direccion: la direccion A (0-3) a 0x1B, el dibujo 2 * A, la velocidad de p05:AEEC y el byte 0x0C = 3
	ld hl,0d7d1h		;ac7d
	set 0,(hl)		;ac80
	call 086c2h		;ac82   ; pon_musica_a6: 0xCA26 = 1, ninguna pendiente y el sonido 0xA6
	jp paso_siguiente_c		;ac85   ; paso_siguiente_c: el paso siguiente
anda_y_suena:		; cada 2 cuadros el paso del dibujo; en esta sala el sonido 0x51, si no el 0x52
	call 086deh		;ac88   ; cambia_paso_cada_2: el byte 0x11 uno mas; cada 2, el paso del dibujo
	ret nz			;ac8b
	call 08100h		;ac8c   ; en_esta_sala: Z si el actor esta en la sala de ahora (fila y columna)
	jp z,06c63h		;ac8f   ; sonido_51: pide el sonido 0x51
	jp 06c67h		;ac92   ; sonido_52: pide el sonido 0x52
especial_29_paso_1:		; anda hasta la columna 7, X = 0x64, y gira a la direccion 1
	call anda_y_suena		;ac95   ; anda_y_suena: cada 2 cuadros el paso del dibujo; en esta sala el sonido 0x51, si no el 0x52
	ld l,007h		;ac98
	ld e,064h		;ac9a
	ld b,001h		;ac9c
llega_en_x:		; la columna (H) y la X (D) del actor contra L y E
	ld h,(ix+00bh)		;ac9e   ; lee la columna de la sala del actor
	ld d,(ix+005h)		;aca1   ; lee la X del actor
	call llega_a		;aca4   ; llega_a: cambia de sala si sale (p05:AE5C); si H = L y D esta a menos de 8 de E, la direccion B y acarreo
	ret nc			;aca7
	jp paso_siguiente_c		;aca8   ; paso_siguiente_c: el paso siguiente
llega_a:		; cambia de sala si sale (p05:AE5C); si H = L y D esta a menos de 8 de E, la direccion B y acarreo
	exx			;acab
	call cambia_de_sala_si_sale		;acac   ; cambia_de_sala_si_sale: fuera de Y 0x20-0xC0 o X 8-0xB8: a la sala de al lado (p05:AE6B) y su sala especial a 0xE500 (sin acarreo)
	exx			;acaf
	ld a,h			;acb0
	cp l			;acb1
	jr nz,L_ACBF		;acb2
	ld a,d			;acb4
	sub e			;acb5
	cp 008h		;acb6
	ret nc			;acb8
	ld a,b			;acb9
	call pon_direccion		;acba   ; pon_direccion: la direccion A (0-3) a 0x1B, el dibujo 2 * A, la velocidad de p05:AEEC y el byte 0x0C = 3
	scf			;acbd
	ret			;acbe
L_ACBF:
	or a			;acbf
	ret			;acc0
especial_29_paso_2:		; anda hasta la fila 2, Y = 0x38: direccion 1, parado 0x10 cuadros
	call anda_y_suena		;acc1   ; anda_y_suena: cada 2 cuadros el paso del dibujo; en esta sala el sonido 0x51, si no el 0x52
	ld h,(ix+00ah)		;acc4   ; lee la fila de la sala del actor
	ld l,002h		;acc7
	ld d,(ix+003h)		;acc9   ; lee la Y del actor
	ld e,038h		;accc
	ld b,001h		;acce
	call llega_a		;acd0   ; llega_a: cambia de sala si sale (p05:AE5C); si H = L y D esta a menos de 8 de E, la direccion B y acarreo
	ret nc			;acd3
	ld (ix+00ch),000h		;acd4
	ld (ix+00eh),010h		;acd8   ; la espera del actor = 0x10
	jp paso_siguiente_c		;acdc   ; paso_siguiente_c: el paso siguiente
especial_29_paso_3:		; al acabar la espera, el mensaje 0x350; al acabar el mensaje, p01:7A27, el eje 3 y el paso siguiente
	ld a,(ix+00eh)		;acdf   ; lee la espera del actor
	and a			;ace2
	jr z,L_ACEF		;ace3
	dec (ix+00eh)		;ace5   ; baja la espera del actor
	ret nz			;ace8
	ld de,00350h		;ace9
	jp 061ceh		;acec   ; mensaje_de_50: 0xD8A8 = 1: la ventana estrecha
L_ACEF:
	call 06247h		;acef   ; mensaje_cada_cuadro_bancos_5:
	ret nz			;acf2
	call 079c7h		;acf3   ; llama_7a27_1: p01:7A27 con A = 1 y los bancos 4 y 5
	ld (ix+00ch),003h		;acf6
	jp paso_siguiente_c		;acfa   ; paso_siguiente_c: el paso siguiente
especial_29_paso_4:		; anda hasta Y = 0x70 y gira a la direccion 3
	call anda_y_suena		;acfd   ; anda_y_suena: cada 2 cuadros el paso del dibujo; en esta sala el sonido 0x51, si no el 0x52
	ld a,(ix+003h)		;ad00   ; lee la Y del actor
	cp 070h		;ad03
	ret c			;ad05
	ld a,003h		;ad06
	call pon_direccion		;ad08   ; pon_direccion: la direccion A (0-3) a 0x1B, el dibujo 2 * A, la velocidad de p05:AEEC y el byte 0x0C = 3
	jr paso_siguiente_c		;ad0b
especial_29_paso_5:		; anda hasta la columna 8, X = 0x64, y gira a la direccion 0
	call anda_y_suena		;ad0d   ; anda_y_suena: cada 2 cuadros el paso del dibujo; en esta sala el sonido 0x51, si no el 0x52
	ld l,008h		;ad10
	ld e,064h		;ad12
	ld b,000h		;ad14
	jp llega_en_x		;ad16   ; llega_en_x: la columna (H) y la X (D) del actor contra L y E
especial_29_paso_6:		; anda hasta la fila 3, Y = 0x64, y gira a la direccion 2
	call anda_y_suena		;ad19   ; anda_y_suena: cada 2 cuadros el paso del dibujo; en esta sala el sonido 0x51, si no el 0x52
	ld l,003h		;ad1c
	ld e,064h		;ad1e
	ld b,002h		;ad20
	ld h,(ix+00ah)		;ad22   ; lee la fila de la sala del actor
	ld d,(ix+003h)		;ad25   ; lee la Y del actor
	call llega_a		;ad28   ; llega_a: cambia de sala si sale (p05:AE5C); si H = L y D esta a menos de 8 de E, la direccion B y acarreo
	ret nc			;ad2b
	jp paso_siguiente_c		;ad2c   ; paso_siguiente_c: el paso siguiente
especial_29_paso_7:		; al acabar la espera, el mensaje 0x450; despues p01:7A27, el sonido 0x23 y el mensaje 0x550
	ld a,(ix+00eh)		;ad2f   ; lee la espera del actor
	and a			;ad32
	jr z,L_AD3F		;ad33
	dec (ix+00eh)		;ad35   ; baja la espera del actor
	ret nz			;ad38
	ld de,00450h		;ad39
	jp 061ceh		;ad3c   ; mensaje_de_50: 0xD8A8 = 1: la ventana estrecha
L_AD3F:
	call 06247h		;ad3f   ; mensaje_cada_cuadro_bancos_5:
	ret nz			;ad42
	call 079c7h		;ad43   ; llama_7a27_1: p01:7A27 con A = 1 y los bancos 4 y 5
	call 06a87h		;ad46   ; sonido_23: pide el sonido 0x23
	ld de,00550h		;ad49
mensaje_y_paso_c:		; el mensaje DE y el paso siguiente
	call 061ceh		;ad4c   ; mensaje_de_50: 0xD8A8 = 1: la ventana estrecha
	jp paso_siguiente_c		;ad4f   ; paso_siguiente_c: el paso siguiente
especial_29_paso_9:		; al acabar el mensaje: p01:7A27, la musica, y la tercera barra con 0xCAE0 = 1 (p03:BB38)
	call 06247h		;ad52   ; mensaje_cada_cuadro_bancos_5:
	ret nz			;ad55
	call 079c7h		;ad56   ; llama_7a27_1: p01:7A27 con A = 1 y los bancos 4 y 5
	call 08685h		;ad59   ; por_el_tipo_8698: por el byte del tipo en p04:8698 (p04:8691)
	xor a			;ad5c
	ld (0cac8h),a		;ad5d
	inc a			;ad60
	ld (0dff0h),a		;ad61   ; guarda 1 mientras corre la tercera barra
	ld (0cae0h),a		;ad64
	ld (0cae2h),a		;ad67   ; guarda 1 mientras se ve la barra de la derecha
	ld a,010h		;ad6a
	ld (0dff2h),a		;ad6c   ; guarda la espera de la tercera barra
	call 07a8dh		;ad6f   ; a_p03_bb38: p03:BB38 con el banco 3 en 0xA000
	jr paso_siguiente_c		;ad72
especial_29_paso_a:		; el byte 0x16 = 1, la direccion 3, su sala especial a 0xE500 y el paso siguiente
	ld (ix+016h),001h		;ad74
	ld a,003h		;ad78
	call pon_direccion		;ad7a   ; pon_direccion: la direccion A (0-3) a 0x1B, el dibujo 2 * A, la velocidad de p05:AEEC y el byte 0x0C = 3
	call 05929h		;ad7d   ; sala_especial_a_e500: la sala especial de la ficha IX (sus bytes 10-11) a 0xE500
paso_siguiente_c:		; el paso siguiente
	inc (ix+001h)		;ad80   ; sube el paso del actor
	ret			;ad83
especial_29_paso_b:		; segun la sala de Snake (p05:ADB2): 0, anda (p05:ADAC) con 0xD8A3 = 1; si no, el destino de p05:ADCF y el paso 0x0D
	call lado_de_snake		;ad84   ; lado_de_snake: B = donde esta Snake respecto al actor: 3 o 4 en su columna (la 8 o no), 1 o 2 en su fila (la 2 o no); 0 si no
	ld a,b			;ad87
	and a			;ad88
	jr nz,L_AD98		;ad89
	ld hl,0d8a3h		;ad8b
	ld (hl),001h		;ad8e
	push hl			;ad90
	call anda_especial		;ad91   ; anda_especial: anda y p05:B125
	pop hl			;ad94
	ld (hl),000h		;ad95
	ret			;ad97
L_AD98:
	ld a,b			;ad98
	ld hl,ladcfh		;ad99
	call 043f6h		;ad9c   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld (ix+019h),l		;ad9f
	ld (ix+01ah),h		;ada2
	ld (ix+001h),00dh		;ada5   ; el paso del actor = 0x0D
	jp hacia_el_destino		;ada9   ; hacia_el_destino: la direccion hacia el destino (bytes 0x19-0x1A) por el eje mas largo
anda_especial:		; anda y p05:B125
	call anda_y_suena		;adac   ; anda_y_suena: cada 2 cuadros el paso del dibujo; en esta sala el sonido 0x51, si no el 0x52
	jp anda_en_recuadro_b		;adaf   ; anda_en_recuadro_b: anda; el 5 sin el paso del dibujo; dentro del recuadro, gira hacia Snake al chocar o al acabar la espera
lado_de_snake:		; B = donde esta Snake respecto al actor: 3 o 4 en su columna (la 8 o no), 1 o 2 en su fila (la 2 o no); 0 si no
	ld b,000h		;adb2
	ld a,(0ca51h)		;adb4   ; lee la columna de la sala en la zona (uno mas al salir por la derecha)
	cp (ix+00bh)		;adb7   ; compara con la columna de la sala del actor
	jr nz,L_ADC3		;adba
	cp 008h		;adbc
	ld b,003h		;adbe
	ret z			;adc0
	inc b			;adc1
	ret			;adc2
L_ADC3:
	ld a,(0ca50h)		;adc3   ; lee la fila de la sala en la zona (uno mas al salir por arriba)
	cp (ix+00ah)		;adc6   ; compara con la fila de la sala del actor
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


especial_29_paso_c:		; cambia de sala si sale; si no, anda y, con lo solido delante, gira hacia el destino
	call cambia_de_sala_si_sale		;add9   ; cambia_de_sala_si_sale: fuera de Y 0x20-0xC0 o X 8-0xB8: a la sala de al lado (p05:AE6B) y su sala especial a 0xE500 (sin acarreo)
	jp nc,paso_siguiente_c		;addc   ; paso_siguiente_c: el paso siguiente
	call anda_y_suena		;addf   ; anda_y_suena: cada 2 cuadros el paso del dibujo; en esta sala el sonido 0x51, si no el 0x52
	ld a,(ix+01bh)		;ade2
	call solido_delante		;ade5   ; solido_delante: acarreo si delante (p05:AE54 por la direccion A) hay algo solido, con 0xD8A3 = 1 mientras
	jr c,L_AE11		;ade8
	ld a,(ix+01bh)		;adea   ; hacia los lados: hasta X = 0x3C (fila 7) o 0x6C
	cp 002h		;aded
	jr c,L_AE06		;adef
	ld a,(ix+00ah)		;adf1   ; lee la fila de la sala del actor
	cp 007h		;adf4
	ld b,03ch		;adf6
	jr z,L_ADFC		;adf8
	ld b,06ch		;adfa
L_ADFC:
	ld a,(ix+005h)		;adfc   ; lee la X del actor
	sub b			;adff
	cp 008h		;ae00
	ret nc			;ae02
	jp hacia_el_destino		;ae03   ; hacia_el_destino: la direccion hacia el destino (bytes 0x19-0x1A) por el eje mas largo
L_AE06:
	ld a,(ix+003h)		;ae06   ; hacia arriba o abajo: hasta Y = 0x6E
	sub 06eh		;ae09
	cp 008h		;ae0b
	ret nc			;ae0d
	jp hacia_el_destino		;ae0e   ; hacia_el_destino: la direccion hacia el destino (bytes 0x19-0x1A) por el eje mas largo
L_AE11:
	ld a,(ix+01bh)		;ae11   ; lo solido: gira hacia el destino (bytes 0x19-0x1A)
	cp 002h		;ae14
	jr c,L_AE27		;ae16
	ld a,(ix+003h)		;ae18   ; lee la Y del actor
	sub (ix+019h)		;ae1b
	ld a,000h		;ae1e
	jp nc,pon_direccion		;ae20   ; pon_direccion: la direccion A (0-3) a 0x1B, el dibujo 2 * A, la velocidad de p05:AEEC y el byte 0x0C = 3
	inc a			;ae23
	jp pon_direccion		;ae24   ; pon_direccion: la direccion A (0-3) a 0x1B, el dibujo 2 * A, la velocidad de p05:AEEC y el byte 0x0C = 3
L_AE27:
	ld a,(ix+005h)		;ae27   ; lee la X del actor
	sub (ix+01ah)		;ae2a
	ld a,002h		;ae2d
	jp nc,pon_direccion		;ae2f   ; pon_direccion: la direccion A (0-3) a 0x1B, el dibujo 2 * A, la velocidad de p05:AEEC y el byte 0x0C = 3
	inc a			;ae32
	jp pon_direccion		;ae33   ; pon_direccion: la direccion A (0-3) a 0x1B, el dibujo 2 * A, la velocidad de p05:AEEC y el byte 0x0C = 3
solido_delante:		; acarreo si delante (p05:AE54 por la direccion A) hay algo solido, con 0xD8A3 = 1 mientras
	ld de,0ae54h		;ae36
	ld hl,0d8a3h		;ae39
	ld (hl),001h		;ae3c
	push hl			;ae3e
	ex de,hl			;ae3f
	call 043f6h		;ae40   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld a,(ix+003h)		;ae43   ; lee la Y del actor
	add a,l			;ae46
	ld l,a			;ae47
	ld a,(ix+005h)		;ae48   ; lee la X del actor
	add a,h			;ae4b
	ld h,a			;ae4c
	call 07f3dh		;ae4d   ; es_solido_si: acarreo si el caracter del mapa en (H = X, L = Y) llega al umbral de 0xCA4E (0xCA4F desde 0x81)
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


cambia_de_sala_si_sale:		; fuera de Y 0x20-0xC0 o X 8-0xB8: a la sala de al lado (p05:AE6B) y su sala especial a 0xE500 (sin acarreo)
	ld de,020c1h		;ae5c
	ld hl,008b9h		;ae5f
	call sale_a_la_de_al_lado		;ae62   ; sale_a_la_de_al_lado: por arriba: fila + 1 y abajo; por abajo: fila - 1 y arriba; por los lados, la columna y al otro lado
	ret c			;ae65
	call 05929h		;ae66   ; sala_especial_a_e500: la sala especial de la ficha IX (sus bytes 10-11) a 0xE500
	or a			;ae69
	ret			;ae6a
sale_a_la_de_al_lado:		; por arriba: fila + 1 y abajo; por abajo: fila - 1 y arriba; por los lados, la columna y al otro lado
	ld a,(ix+003h)		;ae6b   ; lee la Y del actor
	cp d			;ae6e
	jr c,L_AE84		;ae6f
	cp e			;ae71
	jr nc,L_AE8D		;ae72
	ld a,(ix+005h)		;ae74   ; lee la X del actor
	cp h			;ae77
	jr c,L_AE95		;ae78
	cp l			;ae7a
	ret c			;ae7b
	inc (ix+00bh)		;ae7c   ; sube la columna de la sala del actor
	ld (ix+005h),h		;ae7f   ; guarda la X del actor
	jr L_AE9C		;ae82
L_AE84:
	inc (ix+00ah)		;ae84   ; sube la fila de la sala del actor
	dec e			;ae87
	ld (ix+003h),e		;ae88   ; guarda la Y del actor
	jr L_AE9C		;ae8b
L_AE8D:
	dec (ix+00ah)		;ae8d   ; baja la fila de la sala del actor
	ld (ix+003h),d		;ae90   ; guarda la Y del actor
	jr L_AE9C		;ae93
L_AE95:
	dec (ix+00bh)		;ae95   ; baja la columna de la sala del actor
	dec l			;ae98
	ld (ix+005h),l		;ae99   ; guarda la X del actor
L_AE9C:
	or a			;ae9c
	ret			;ae9d
hacia_el_destino:		; la direccion hacia el destino (bytes 0x19-0x1A) por el eje mas largo
	ld de,00000h		;ae9e
	ld a,(ix+003h)		;aea1   ; lee la Y del actor
	sub (ix+019h)		;aea4
	jr nc,L_AEAC		;aea7
	inc d			;aea9
	neg		;aeaa
L_AEAC:
	ld b,a			;aeac   ; B = la distancia en Y
	ld a,(ix+005h)		;aead   ; la X contra el destino...
	sub (ix+01ah)		;aeb0
	jr nc,L_AEB8		;aeb3
	inc e			;aeb5
	neg		;aeb6
L_AEB8:
	cp b			;aeb8   ; ...la mayor manda
	jr nc,L_AEC4		;aeb9
	ld a,d			;aebb
	and a			;aebc
	ld a,000h		;aebd
	jr z,pon_direccion		;aebf
	inc a			;aec1
	jr pon_direccion		;aec2
L_AEC4:
	ld a,e			;aec4
	and a			;aec5
	ld a,002h		;aec6
	jr z,pon_direccion		;aec8
	inc a			;aeca
pon_direccion:		; la direccion A (0-3) a 0x1B, el dibujo 2 * A, la velocidad de p05:AEEC y el byte 0x0C = 3
	ld (ix+01bh),a		;aecb
	ld b,a			;aece
	add a,a			;aecf
	ld (ix+00dh),a		;aed0   ; guarda el dibujo del actor (bit 0: el paso)
	ld a,b			;aed3
	ld hl,0aeech		;aed4
	call 043f6h		;aed7   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	xor a			;aeda
	ld (ix+007h),l		;aedb   ; guarda la velocidad del actor en Y (alta)
	ld (ix+006h),a		;aede   ; guarda la velocidad del actor en Y (baja)
	ld (ix+009h),h		;aee1   ; guarda la velocidad del actor en X (alta)
	ld (ix+008h),a		;aee4   ; guarda la velocidad del actor en X (baja)
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


especial_29_paso_d:		; anda; si Snake esta en otra sala, otro destino; al pasar del centro (0x70, p05:AF18), 0xCB3C = 0 y el paso 0x0C
	call anda_y_suena		;aef4   ; anda_y_suena: cada 2 cuadros el paso del dibujo; en esta sala el sonido 0x51, si no el 0x52
	call lado_de_snake		;aef7   ; lado_de_snake: B = donde esta Snake respecto al actor: 3 o 4 en su columna (la 8 o no), 1 o 2 en su fila (la 2 o no); 0 si no
	ld a,b			;aefa
	and a			;aefb
	jp nz,L_AD98		;aefc
	ld d,(ix+003h)		;aeff   ; lee la Y del actor
	ld e,(ix+005h)		;af02   ; lee la X del actor
	ld a,(ix+01bh)		;af05
	ld hl,0af18h		;af08
	call 0424eh		;af0b   ; salta_por_tabla: salta a la palabra A de la tabla de HL
	ret nc			;af0e
	xor a			;af0f
	ld (0cb3ch),a		;af10
	ld (ix+001h),00ch		;af13   ; el paso del actor = 0x0C
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


por_encima_de_70:
	ld a,d			;af20
	cp 070h		;af21
	ret			;af23
por_debajo_de_70:
	ld a,d			;af24
	cp 070h		;af25
	ccf			;af27
	ret			;af28
izquierda_de_70:
	ld a,e			;af29
	cp 070h		;af2a
	ret			;af2c
derecha_de_70:
	ld a,e			;af2d
	cp 070h		;af2e
	ccf			;af30
	ret			;af31
especial_29_paso_e:		; el dibujo 8, 0xDFF0 = 0, 0xE258 = 0xD4F2 = 1, 0xCAE0 = 2, p03:B1A3, el sonido 0x93 y a Y = 0x80, X = 0x60
	ld (ix+00dh),008h		;af32   ; el dibujo del actor (bit 0: el paso) = 0x08
	xor a			;af36
	ld (ix+00ch),a		;af37
	ld (0dff0h),a		;af3a   ; guarda 1 mientras corre la tercera barra
	inc a			;af3d
	ld (0e258h),a		;af3e
	ld (0d4f2h),a		;af41
	inc a			;af44
	ld (0cae0h),a		;af45
	call 07a0ah		;af48   ; a_p03_b1a3: p03:B1A3 con el banco 3 en 0xA000
	call 06c1bh		;af4b   ; sonido_93: pide el sonido 0x93 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld (ix+003h),080h		;af4e   ; la Y del actor = 0x80
	ld (ix+005h),060h		;af52   ; la X del actor = 0x60
	jp paso_siguiente_c		;af56   ; paso_siguiente_c: el paso siguiente
especial_29_paso_f:		; con Snake cerca (0x20 en X, 0x50 en Y): 0xCB3C = 1, la musica de p01:6BAC y el mensaje 0x610
	call 08100h		;af59   ; en_esta_sala: Z si el actor esta en la sala de ahora (fila y columna)
	ret nz			;af5c
	ld a,(0cb05h)		;af5d   ; lee la X de Snake
	sub (ix+005h)		;af60   ; le resta la X del actor
	jr nc,L_AF67		;af63
	neg		;af65
L_AF67:
	cp 020h		;af67
	ret nc			;af69
	ld a,(0cb03h)		;af6a   ; lee la Y de Snake
	add a,028h		;af6d
	sub (ix+003h)		;af6f   ; le resta la Y del actor
	cp 050h		;af72
	ret nc			;af74
	ld a,001h		;af75
	ld (0cb3ch),a		;af77
	ld hl,06bach		;af7a
	call 07c85h		;af7d   ; pide_musica_hl: la musica de la rutina HL: si no es la pendiente, pendiente dentro de 0x78 cuadros
	ld de,00610h		;af80
	jp mensaje_y_paso_c		;af83   ; mensaje_y_paso_c: el mensaje DE y el paso siguiente
especial_29_paso_10:		; al acabar el mensaje, p01:7A27 y el paso siguiente
	call 06247h		;af86   ; mensaje_cada_cuadro_bancos_5:
	ret nz			;af89
	call 079c7h		;af8a   ; llama_7a27_1: p01:7A27 con A = 1 y los bancos 4 y 5
	jp paso_siguiente_c		;af8d   ; paso_siguiente_c: el paso siguiente
especial_29_paso_11:		; el paso 0x20, 0xD4F2 = 0 y, en la sala 2, 0xD500 = 2
	ld (ix+001h),020h		;af90   ; el paso del actor = 0x20
	xor a			;af94
	ld (0d4f2h),a		;af95
	ld a,(0ca4bh)		;af98   ; lee la sala de la zona
	cp 002h		;af9b
	ret nz			;af9d
	ld a,002h		;af9e
	ld (0d500h),a		;afa0   ; guarda 8 fichas de 16 bytes [activa][..][Y][X][..][..][..][alto][ancho * 2] (p07:BC95)
	ret			;afa3
actor_de_d8a7:		; con 0xCA77, sin musica; con 0xD8A7 = 2, la sala de Snake (p05:B161); al salir de la sala, 0xD8A7 = 2
	ld a,(0ca77h)		;afa4   ; con 0xCA77, sin musica
	and a			;afa7
	jp nz,086a4h		;afa8   ; acaba_musica_del_actor: con 0xCA26: lo quita, p01:7A12 y el banco del tipo (1 el 15, 2 y 6 el 10)
	ld hl,0d8a7h		;afab   ; 0xD8A7...
	ld a,(hl)			;afae
	and a			;afaf
	jp z,L_AFCB		;afb0   ; ...0: sus pasos
	cp 002h		;afb3   ; ...2: uno menos y la sala de Snake
	jr nz,L_AFBD		;afb5
	dec (hl)			;afb7
	call sala_de_snake		;afb8   ; sala_de_snake: 0x1B = hacia donde esta la sala de Snake (1-4; 0 la misma)
	jr L_AFC5		;afbb
L_AFBD:
	ld a,(0ca41h)		;afbd   ; lee la salida de la sala (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	and a			;afc0
	jr z,L_AFC5		;afc1
	ld (hl),002h		;afc3
L_AFC5:
	ld a,(ix+018h)		;afc5   ; mientras el byte 0x18 cuenta, solo eso
	and a			;afc8
	jr nz,L_AFE6		;afc9
L_AFCB:
	ld a,(ix+01fh)		;afcb   ; la espera de 0x1F; al acabar, el byte 0x16 = 1
	and a			;afce
	jr z,L_AFDA		;afcf
	dec (ix+01fh)		;afd1
	jr nz,L_AFDA		;afd4
	ld (ix+016h),001h		;afd6
L_AFDA:
	ld a,(ix+001h)		;afda   ; por su paso (p05:B032)
	ld hl,0b032h		;afdd
	call 0424eh		;afe0   ; salta_por_tabla: salta a la palabra A de la tabla de HL
	call 08082h		;afe3   ; llama_ba36: p14:BA36 con el byte 0x0C del actor
L_AFE6:
	ld a,(ix+001h)		;afe6   ; en los pasos 3-6, su musica
	sub 003h		;afe9
	cp 004h		;afeb
	call c,08671h		;afed   ; musica_del_actor: la primera vez (0xCA26): ninguna pendiente y por el tipo (p04:8698)
	ld a,(ix+001h)		;aff0   ; desde el paso 9, o sin la cuenta de 0x18, los sprites 10-13 fuera
	cp 009h		;aff3
	jp nc,08728h		;aff5   ; esconde_sprites_10_13: los sprites 10-13 fuera
	ld a,(ix+018h)		;aff8
	and a			;affb
	jp z,08728h		;affc   ; esconde_sprites_10_13: los sprites 10-13 fuera
	call dibujo_de_la_cuenta		;afff   ; el dibujo de la cuenta...
	dec (ix+018h)		;b002   ; ...que baja; al acabar, lo de antes (p05:B00B)
	call z,fin_de_la_cuenta		;b005   ; fin_de_la_cuenta: 8 cuadros en 0x1F, el byte 0x16 = 0, el eje (0x15) y el dibujo (0x1D) de antes
	jp 08739h		;b008   ; sus sprites
fin_de_la_cuenta:		; 8 cuadros en 0x1F, el byte 0x16 = 0, el eje (0x15) y el dibujo (0x1D) de antes
	ld (ix+01fh),008h		;b00b
	ld (ix+016h),000h		;b00f
	ld a,(ix+015h)		;b013
	ld (ix+00ch),a		;b016
	ld a,(ix+01dh)		;b019
	ld (ix+00dh),a		;b01c   ; guarda el dibujo del actor (bit 0: el paso)
	ret			;b01f
dibujo_de_la_cuenta:		; el dibujo de 0x1D, + 1 con la cuenta de 0x18 entre 2 y 4
	ld b,(ix+01dh)		;b020   ; el dibujo de 0x1D...
	ld a,(ix+018h)		;b023   ; ...+ 1 con la cuenta entre 2 y 4
	sub 002h		;b026
	cp 003h		;b028
	jr nc,L_B02D		;b02a
	inc b			;b02c
L_B02D:
	ld a,b			;b02d
	ld (ix+00dh),a		;b02e   ; guarda el dibujo del actor (bit 0: el paso)
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


d8a7_paso_0:		; 0x30 cuadros, 0xCB3C = 1, el bit 1 de 0xD7D7, sin musica pendiente y p03:B11F con 0
	ld (ix+00eh),030h		;b040   ; la espera del actor = 0x30
	ld a,001h		;b044
	ld (0cb3ch),a		;b046
	ld hl,0d7d7h		;b049
	set 1,(hl)		;b04c
	ld hl,00000h		;b04e
	ld (0ca19h),hl		;b051   ; guarda la musica pendiente: la rutina que la pide (16 bits)
	xor a			;b054
	call 079e9h		;b055   ; a_p03_b11f: p03:B11F con el banco 3 en 0xA000
	jp paso_siguiente_d		;b058   ; paso_siguiente_d: el paso siguiente
d8a7_paso_1:		; la espera; desde 0x20, p03:B132; al acabar, p03:B19A, el sonido 0x81, 0xD8A7 = 0xE25A = 1 y la conversacion
	dec (ix+00eh)		;b05b   ; baja la espera del actor
	ld a,(ix+00eh)		;b05e   ; lee la espera del actor
	cp 020h		;b061
	ret nc			;b063
	call 079f1h		;b064   ; a_p03_b132: p03:B132 con el banco 3 en 0xA000
	ld a,(ix+00eh)		;b067   ; lee la espera del actor
	and a			;b06a
	ret nz			;b06b
	call 079fah		;b06c   ; a_p03_b19a: p03:B19A con el banco 3 en 0xA000
	call 06b95h		;b06f   ; sonido_81: pide el sonido 0x81 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld a,001h		;b072
	ld (0d8a7h),a		;b074
	ld (0e25ah),a		;b077
	call 06250h		;b07a   ; conversacion_de_a: la conversacion de p48:8010 (A = 0), p48:8012 (1) o p48:8014 (2)
	jp paso_siguiente_d		;b07d   ; paso_siguiente_d: el paso siguiente
d8a7_paso_2:		; 0xE25A = 0xCB3C = 0 y la musica del actor
	xor a			;b080
	ld (0e25ah),a		;b081
	ld (0cb3ch),a		;b084
	call 08685h		;b087   ; por_el_tipo_8698: por el byte del tipo en p04:8698 (p04:8691)
	jp paso_siguiente_d		;b08a   ; paso_siguiente_d: el paso siguiente
d8a7_paso_3:		; una cuenta al azar (p05:B0CB), 16 cuadros, la sala de Snake; en ella, una direccion al azar; si no, hacia ella
	call cuenta_al_azar		;b08d   ; cuenta_al_azar: 0x1E = 0x30-0x6F al azar
	ld a,(ix+01fh)		;b090
	and a			;b093
	jr nz,L_B09A		;b094
	ld (ix+016h),001h		;b096
L_B09A:
	ld (ix+01ch),010h		;b09a
	call sala_de_snake		;b09e   ; sala_de_snake: 0x1B = hacia donde esta la sala de Snake (1-4; 0 la misma)
	ld a,(ix+01bh)		;b0a1
	and a			;b0a4
	jr nz,va_a_otra_sala		;b0a5
	call 04256h		;b0a7   ; azar: A = un numero al azar (0xCA03 rotado mas R)
	and 007h		;b0aa
	ld (ix+00dh),a		;b0ac   ; guarda el dibujo del actor (bit 0: el paso)
	call velocidad_del_dibujo		;b0af   ; velocidad_del_dibujo: la velocidad de la direccion del dibujo (p05:A7AD por el tipo)
	call cuenta_1c_al_azar		;b0b2   ; cuenta_1c_al_azar: el byte 0x1C = 0x10-0x2F al azar
paso_siguiente_d:		; el paso siguiente
	inc (ix+001h)		;b0b5   ; sube el paso del actor
	ret			;b0b8
va_a_otra_sala:		; la sala de la ficha a 0xE500 y hacia la de Snake: el paso 5
	call 05955h		;b0b9   ; sala_de_zona_a_e500: la sala de la ficha IX a 0xE500, de una lista y unos bloques que dependen de la zona
hacia_la_sala:		; la direccion de 0x1B, el paso 5 y su velocidad
	ld a,(ix+01bh)		;b0bc
	dec a			;b0bf
	add a,a			;b0c0
	ld (ix+00dh),a		;b0c1   ; guarda el dibujo del actor (bit 0: el paso)
	ld (ix+001h),005h		;b0c4   ; el paso del actor = 0x05
	jp velocidad_del_dibujo		;b0c8   ; velocidad_del_dibujo: la velocidad de la direccion del dibujo (p05:A7AD por el tipo)
cuenta_al_azar:		; 0x1E = 0x30-0x6F al azar
	call 04256h		;b0cb   ; azar: A = un numero al azar (0xCA03 rotado mas R)
	and 03fh		;b0ce
	add a,030h		;b0d0
	ld (ix+01eh),a		;b0d2
	ret			;b0d5
cuenta_y_lanza:		; la cuenta de 0x1E; desde 0x18 y cada 4 cuadros, segun su sala (p05:B0FA)
	dec (ix+01eh)		;b0d6
	jr z,cuenta_al_azar		;b0d9
	ld a,(ix+01eh)		;b0db
	cp 018h		;b0de
	ret c			;b0e0
	ld a,(0ca03h)		;b0e1   ; lee el contador de cuadros (uno mas en cada interrupcion)
	and 003h		;b0e4
	ret nz			;b0e6
	ld a,(ix+00ah)		;b0e7   ; lee la fila de la sala del actor
	dec a			;b0ea
	add a,a			;b0eb
	ld b,a			;b0ec
	ld a,(ix+00bh)		;b0ed   ; lee la columna de la sala del actor
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


d8a7_paso_4:		; la cuenta; en la sala de Snake anda en el recuadro y, tras 0x1C, si esta en esta sala, el paso 6
	call cuenta_y_lanza		;b102   ; cuenta_y_lanza: la cuenta de 0x1E; desde 0x18 y cada 4 cuadros, segun su sala (p05:B0FA)
	ld a,(ix+01bh)		;b105
	and a			;b108
	jr nz,$-77		;b109
	call anda_en_recuadro_b		;b10b   ; anda_en_recuadro_b: anda; el 5 sin el paso del dibujo; dentro del recuadro, gira hacia Snake al chocar o al acabar la espera
	dec (ix+01ch)		;b10e
	ret nz			;b111
	call 08100h		;b112   ; en_esta_sala: Z si el actor esta en la sala de ahora (fila y columna)
	jp nz,al_paso_3		;b115   ; al_paso_3: el paso 3, el eje 3 y una cuenta al azar
	ld (ix+00ch),000h		;b118
	ld (ix+01ch),018h		;b11c
	ld (ix+001h),006h		;b120   ; el paso del actor = 0x06
	ret			;b124
anda_en_recuadro_b:		; anda; el 5 sin el paso del dibujo; dentro del recuadro, gira hacia Snake al chocar o al acabar la espera
	call anda_en_recuadro		;b125   ; anda_en_recuadro: el paso del dibujo, y fuera del recuadro (Y 0x20-0xBF, X 8-0xB7) o chocando: da la vuelta
	ld a,(ix+000h)		;b128   ; lee el tipo del actor (0 = libre)
	cp 005h		;b12b
	jr nz,L_B137		;b12d
	ld a,(ix+00dh)		;b12f   ; lee el dibujo del actor (bit 0: el paso)
	and 0feh		;b132
	ld (ix+00dh),a		;b134   ; guarda el dibujo del actor (bit 0: el paso)
L_B137:
	ld a,(ix+003h)		;b137   ; lee la Y del actor
	sub 018h		;b13a
	cp 0a0h		;b13c
	jr nc,L_B159		;b13e
	ld a,(ix+005h)		;b140   ; lee la X del actor
	sub 008h		;b143
	cp 0b0h		;b145
	jr nc,L_B159		;b147
	call 090c8h		;b149   ; choques_del_actor: C = por donde choca el actor (bits 0-3), con los puntos de p04:915C (o p04:9164 desde 0xD800)
	ld a,c			;b14c
	and a			;b14d
	jp nz,gira_a_snake_y		;b14e   ; gira_a_snake_y: hacia Snake en Y (p05:A894) con una espera de 8-15
	ld a,(ix+00eh)		;b151   ; lee la espera del actor
	and a			;b154
	ret nz			;b155
	jp gira_a_snake_x		;b156   ; gira_a_snake_x: hacia Snake en X (p05:A875) con una espera de 8-15
L_B159:
	call 0808bh		;b159   ; fuera: da la vuelta y 16 cuadros
	ld (ix+00eh),010h		;b15c   ; la espera del actor = 0x10
	ret			;b160
sala_de_snake:		; 0x1B = hacia donde esta la sala de Snake (1-4; 0 la misma)
	ld h,000h		;b161
	ld c,(ix+00ah)		;b163   ; lee la fila de la sala del actor
	ld b,(ix+00bh)		;b166   ; lee la columna de la sala del actor
	ld de,(0ca50h)		;b169   ; lee la fila de la sala en la zona (uno mas al salir por arriba) y el byte siguiente (16 bits)
	ld a,e			;b16d
	cp c			;b16e
	jr z,L_B177		;b16f
	call nc,mas_fila		;b171   ; mas_fila:
	call c,menos_fila		;b174   ; menos_fila:
L_B177:
	ld a,d			;b177
	cp b			;b178
	jr z,L_B181		;b179
	call c,menos_columna		;b17b   ; menos_columna:
	call nc,mas_columna		;b17e   ; mas_columna:
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
mas_columna:
	set 3,h		;b193
	ret			;b195
mas_fila:
	set 0,h		;b196
	ret			;b198
menos_fila:
	set 1,h		;b199
	ret			;b19b
menos_columna:
	set 2,h		;b19c
	ret			;b19e
d8a7_paso_5:		; la cuenta; en la sala de Snake, p05:B295; al borde, a la sala de al lado (p05:B247, p05:B25E)
	call cuenta_y_lanza		;b19f   ; cuenta_y_lanza: la cuenta de 0x1E; desde 0x18 y cada 4 cuadros, segun su sala (p05:B0FA)
	ld a,(ix+01bh)		;b1a2
	and a			;b1a5
	jp z,al_paso_3		;b1a6   ; al_paso_3: el paso 3, el eje 3 y una cuenta al azar
	ld a,(ix+003h)		;b1a9   ; lee la Y del actor
	sub 018h		;b1ac
	cp 0a7h		;b1ae
	jp nc,sale_por_arriba_o_abajo		;b1b0   ; sale_por_arriba_o_abajo: hacia abajo: fila - 1, Y = 0x21; hacia arriba: fila + 1, Y = 0xBF
	ld a,(ix+005h)		;b1b3   ; lee la X del actor
	sub 008h		;b1b6
	cp 0b0h		;b1b8
	jp nc,sale_por_un_lado		;b1ba   ; sale_por_un_lado: hacia la derecha: columna + 1, X = 0x0A; hacia la izquierda: columna - 1, X = 0xB6
	ld a,(ix+007h)		;b1bd   ; por el pasillo de su sala, gira a la puerta
	and a			;b1c0
	ld a,(ix+01bh)		;b1c1
	jr z,L_B1ED		;b1c4
	cp 003h		;b1c6
	jr c,L_B213		;b1c8
	ld a,(ix+00ah)		;b1ca   ; lee la fila de la sala del actor
	dec a			;b1cd
	ld c,048h		;b1ce
	jr z,L_B1D4		;b1d0
	ld c,068h		;b1d2
L_B1D4:
	ld a,(ix+003h)		;b1d4   ; lee la Y del actor
	sub c			;b1d7
	cp 010h		;b1d8
	jr nc,L_B213		;b1da
	ld a,(ix+00bh)		;b1dc   ; lee la columna de la sala del actor
	cp 007h		;b1df
	ld a,006h		;b1e1
	jr z,L_B1E7		;b1e3
	ld a,004h		;b1e5
L_B1E7:
	ld (ix+00dh),a		;b1e7   ; guarda el dibujo del actor (bit 0: el paso)
	jp velocidad_del_dibujo		;b1ea   ; velocidad_del_dibujo: la velocidad de la direccion del dibujo (p05:A7AD por el tipo)
L_B1ED:
	cp 003h		;b1ed
	jr nc,L_B213		;b1ef
	ld a,(ix+00bh)		;b1f1   ; lee la columna de la sala del actor
	cp 007h		;b1f4
	ld bc,08c08h		;b1f6
	jr z,L_B1FD		;b1f9
	ld b,02ch		;b1fb
L_B1FD:
	ld a,(ix+005h)		;b1fd   ; lee la X del actor
	sub b			;b200
	cp c			;b201
	jr nc,L_B213		;b202
	ld a,(ix+00ah)		;b204   ; lee la fila de la sala del actor
	dec a			;b207
	ld a,002h		;b208
	jr nz,L_B20D		;b20a
	xor a			;b20c
L_B20D:
	ld (ix+00dh),a		;b20d   ; guarda el dibujo del actor (bit 0: el paso)
	jp velocidad_del_dibujo		;b210   ; velocidad_del_dibujo: la velocidad de la direccion del dibujo (p05:A7AD por el tipo)
L_B213:
	ld hl,0d8a3h		;b213
	ld (hl),001h		;b216
	push hl			;b218
	call 090c8h		;b219   ; choques_del_actor: C = por donde choca el actor (bits 0-3), con los puntos de p04:915C (o p04:9164 desde 0xD800)
	pop hl			;b21c
	ld (hl),000h		;b21d
	ld a,c			;b21f   ; sin choque, nada
	and a			;b220
	ret z			;b221
	ld a,(ix+007h)		;b222   ; en vertical mira la X; en horizontal, la Y
	and a			;b225
	ld a,003h		;b226
	ld d,(ix+005h)		;b228   ; lee la X del actor
	ld e,003h		;b22b
	jr nz,L_B236		;b22d
	ld a,00ch		;b22f
	ld d,(ix+003h)		;b231   ; lee la Y del actor
	ld e,001h		;b234
L_B236:
	and c			;b236
	ret z			;b237
	ld a,d			;b238   ; de la mitad (0x60) hacia el otro lado
	cp 060h		;b239
	jr nc,L_B23E		;b23b
	inc e			;b23d
L_B23E:
	ld a,e			;b23e   ; el dibujo de la direccion y su velocidad
	dec a			;b23f
	add a,a			;b240
	ld (ix+00dh),a		;b241   ; guarda el dibujo del actor (bit 0: el paso)
	jp velocidad_del_dibujo		;b244   ; velocidad_del_dibujo: la velocidad de la direccion del dibujo (p05:A7AD por el tipo)
sale_por_arriba_o_abajo:		; hacia abajo: fila - 1, Y = 0x21; hacia arriba: fila + 1, Y = 0xBF
	ld a,(ix+007h)		;b247   ; lee la velocidad del actor en Y (alta)
	rla			;b24a
	jr c,L_B254		;b24b
	dec (ix+00ah)		;b24d   ; baja la fila de la sala del actor
	ld a,021h		;b250
	jr L_B259		;b252
L_B254:
	inc (ix+00ah)		;b254   ; sube la fila de la sala del actor
	ld a,0bfh		;b257
L_B259:
	ld (ix+003h),a		;b259   ; guarda la Y del actor
	jr en_la_sala_nueva		;b25c
sale_por_un_lado:		; hacia la derecha: columna + 1, X = 0x0A; hacia la izquierda: columna - 1, X = 0xB6
	ld a,(ix+009h)		;b25e   ; lee la velocidad del actor en X (alta)
	rla			;b261
	jr c,L_B26B		;b262
	inc (ix+00bh)		;b264   ; sube la columna de la sala del actor
	ld a,00ah		;b267
	jr L_B270		;b269
L_B26B:
	dec (ix+00bh)		;b26b   ; baja la columna de la sala del actor
	ld a,0b6h		;b26e
L_B270:
	ld (ix+005h),a		;b270   ; guarda la X del actor
en_la_sala_nueva:		; 0x20 cuadros, su sala a 0xE500 y otra vez hacia la de Snake
	ld (ix+00eh),020h		;b273   ; la espera del actor = 0x20
	call 05955h		;b277   ; sala_de_zona_a_e500: la sala de la ficha IX a 0xE500, de una lista y unos bloques que dependen de la zona
	jp sala_de_snake		;b27a   ; sala_de_snake: 0x1B = hacia donde esta la sala de Snake (1-4; 0 la misma)
lanza_al_cruzarse:		; sin la cuenta de 0x18, en esta sala: 0x1C cuadros lanzando el 6 cada 4; al acabar o fuera, el paso 3
	ld a,(ix+018h)		;b27d   ; con la cuenta de 0x18, nada
	and a			;b280
	ret nz			;b281
	call 08100h		;b282   ; fuera de la sala, el paso 3
	jr nz,al_paso_3		;b285
	ld a,(ix+01ch)		;b287   ; la cuenta de 0x1C...
	dec (ix+01ch)		;b28a
	jr z,al_paso_3		;b28d
	and 003h		;b28f   ; ...cada 4, lanza
	ret nz			;b291
	jp 09b40h		;b292   ; lanza_6_f0: tipo 6 con el desplazamiento 0x00F0
al_paso_3:		; el paso 3, el eje 3 y una cuenta al azar
	ld (ix+001h),003h		;b295   ; el paso del actor = 0x03
	ld (ix+00ch),003h		;b299
cuenta_1c_al_azar:		; el byte 0x1C = 0x10-0x2F al azar
	call 04256h		;b29d   ; azar: A = un numero al azar (0xCA03 rotado mas R)
	and 01fh		;b2a0
	add a,010h		;b2a2
	ld (ix+01ch),a		;b2a4
	ret			;b2a7
guarda_snake_en_18:		; los bytes 0x18-0x19 = la Y y la X de Snake
	call 08079h		;b2a8   ; y_x_de_snake_en_hl: L = la Y, H = la X de Snake
	ld (ix+018h),l		;b2ab
	ld (ix+019h),h		;b2ae
	ret			;b2b1
actor_de_las_salas_4_5:		; en las filas y columnas 4-5 (si no, sin musica): con 0xC693 el sonido 0x84, sus pasos (p05:B2E8) y su musica
	call en_4_5		;b2b2   ; en_4_5: acarreo con la fila y la columna de Snake entre 4 y 5
	jp nc,086a4h		;b2b5   ; acaba_musica_del_actor: con 0xCA26: lo quita, p01:7A12 y el banco del tipo (1 el 15, 2 y 6 el 10)
	ld hl,06bcch		;b2b8
	call 086d5h		;b2bb   ; si_c693: con 0xC693, lo borra y salta a HL
	ld a,(ix+001h)		;b2be   ; lee el paso del actor
	ld hl,0b2e8h		;b2c1
	call 0424eh		;b2c4   ; salta_por_tabla: salta a la palabra A de la tabla de HL
	call 08082h		;b2c7   ; llama_ba36: p14:BA36 con el byte 0x0C del actor
	jp 08671h		;b2ca   ; musica_del_actor: la primera vez (0xCA26): ninguna pendiente y por el tipo (p04:8698)
sprites_si_14:		; los sprites 10-13 fuera y, sin el byte 0x14, los suyos
	call 08728h		;b2cd   ; esconde_sprites_10_13: los sprites 10-13 fuera
	ld a,(ix+014h)		;b2d0
	and a			;b2d3
	jp z,0873ch		;b2d4   ; p04:873C
	ret			;b2d7
en_4_5:		; acarreo con la fila y la columna de Snake entre 4 y 5
	ld a,(0ca50h)		;b2d8   ; lee la fila de la sala en la zona (uno mas al salir por arriba)
	sub 004h		;b2db
	cp 002h		;b2dd
	ret nc			;b2df
	ld a,(0ca51h)		;b2e0   ; lee la columna de la sala en la zona (uno mas al salir por la derecha)
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


salas_4_5_paso_0:		; 0xCB3C = 1, el dibujo 8, el bit 1 de 0xD7D6, hacia abajo y la musica 0xA6
	ld a,001h		;b2f8
	ld (0cb3ch),a		;b2fa
	ld (ix+00dh),008h		;b2fd   ; el dibujo del actor (bit 0: el paso) = 0x08
	ld hl,0d7d6h		;b301
	set 1,(hl)		;b304
	ld (ix+00ch),a		;b306
	ld (ix+007h),002h		;b309   ; la velocidad del actor en Y (alta) = 0x02
	call 086c2h		;b30d   ; pon_musica_a6: 0xCA26 = 1, ninguna pendiente y el sonido 0xA6
paso_siguiente_e:		; el paso siguiente
	inc (ix+001h)		;b310   ; sube el paso del actor
	ret			;b313
salas_4_5_paso_1:		; baja; en la fila de Snake, desde Y = 0x30 se para (dibujo 1) con el mensaje 0xC50
	call suena_1e		;b314   ; suena_1e: en esta sala, sin el byte 0x14, el sonido 0x1E cada 4 cuadros
	call cambia_de_sala_en_4_5		;b317   ; cambia_de_sala_en_4_5: fuera de Y 0x10-0xC0 o X 0x0C-0xB4: a la sala de al lado con su sala a 0xE500
	ld a,(0ca50h)		;b31a   ; lee la fila de la sala en la zona (uno mas al salir por arriba)
	cp (ix+00ah)		;b31d   ; compara con la fila de la sala del actor
	ret nz			;b320
	ld a,(ix+003h)		;b321   ; lee la Y del actor
	cp 018h		;b324
	call nc,sin_byte_14		;b326   ; sin_byte_14:
	cp 030h		;b329
	ret c			;b32b
	ld (ix+00ch),000h		;b32c
	ld (ix+00dh),001h		;b330   ; el dibujo del actor (bit 0: el paso) = 0x01
	ld de,00c50h		;b334
	call 061ceh		;b337   ; mensaje_de_50: 0xD8A8 = 1: la ventana estrecha
	jr paso_siguiente_e		;b33a
sin_byte_14:
	ld (ix+014h),000h		;b33c
	ret			;b340
cambia_de_sala_en_4_5:		; fuera de Y 0x10-0xC0 o X 0x0C-0xB4: a la sala de al lado con su sala a 0xE500
	ld de,010c1h		;b341
	ld hl,00cb5h		;b344
L_B347:
	call sale_a_la_de_al_lado		;b347   ; sale_a_la_de_al_lado: por arriba: fila + 1 y abajo; por abajo: fila - 1 y arriba; por los lados, la columna y al otro lado
	ret c			;b34a
	jp 05955h		;b34b   ; sala_de_zona_a_e500: la sala de la ficha IX a 0xE500, de una lista y unos bloques que dependen de la zona
salas_4_5_paso_2:		; al acabar el mensaje: 0xCB3C = 0, p01:7A27 y el paso siguiente
	call 06247h		;b34e   ; mensaje_cada_cuadro_bancos_5:
	ld a,(0e220h)		;b351   ; lee la velocidad del mensaje en curso (0 = ninguno; 1-3, 4 sin espera)
	and a			;b354
	ret nz			;b355
	xor a			;b356
	ld (0cb3ch),a		;b357
	call 079c7h		;b35a   ; llama_7a27_1: p01:7A27 con A = 1 y los bancos 4 y 5
	jr paso_siguiente_e		;b35d
salas_4_5_paso_3:		; el byte 0x16 = 1, su velocidad, el eje 1, el paso siguiente, su sala a 0xE500 y su musica
	ld a,001h		;b35f
	ld (ix+016h),a		;b361
	call velocidad_de_b		;b364   ; velocidad_de_b:
	ld (ix+00ch),001h		;b367
	call paso_siguiente_e		;b36b   ; paso_siguiente_e: el paso siguiente
	call 05955h		;b36e   ; sala_de_zona_a_e500: la sala de la ficha IX a 0xE500, de una lista y unos bloques que dependen de la zona
	call 08685h		;b371   ; por_el_tipo_8698: por el byte del tipo en p04:8698 (p04:8691)
espera_al_azar:		; una espera de 0x10-0x1F (4-0x13 el 0x0A)
	ld a,(ix+000h)		;b374   ; lee el tipo del actor (0 = libre)
	cp 00ah		;b377
	ld b,010h		;b379
	jr nz,L_B37F		;b37b
	ld b,004h		;b37d
L_B37F:
	call 04256h		;b37f   ; azar: A = un numero al azar (0xCA03 rotado mas R)
	and 00fh		;b382
	add a,b			;b384
	ld (ix+00eh),a		;b385   ; guarda la espera del actor
	ret			;b388
salas_4_5_paso_4:		; cerca de Snake (p05:B46C): p05:B43B; si choca o se acaba la espera, gira (p05:B407); el bit 0x13 parpadea
	call snake_a_menos_de_60		;b389   ; snake_a_menos_de_60: acarreo con Snake en esta sala a menos de 0x60 en Y y en X (salvo en el estado 2); con el byte 0x1B contando, no
	jp c,cerca_de_snake		;b38c   ; cerca_de_snake: para 0x20 cuadros mirando a Snake (p05:B450) y el paso siguiente
	call suena_1e		;b38f   ; suena_1e: en esta sala, sin el byte 0x14, el sonido 0x1E cada 4 cuadros
	call choques_con_d8a3		;b392   ; choques_con_d8a3: los choques del actor con 0xD8A3 = 1 mientras
	ld a,(ix+00dh)		;b395   ; lee el dibujo del actor (bit 0: el paso)
	cp 002h		;b398
	ld a,003h		;b39a
	jr c,L_B3A0		;b39c
	ld a,00ch		;b39e
L_B3A0:
	and c			;b3a0
	jr nz,gira_al_azar		;b3a1
	dec (ix+00eh)		;b3a3   ; baja la espera del actor
	jr z,gira_al_azar		;b3a6
	call parpadeo_13		;b3a8   ; parpadeo_13: el byte 0x13 = 0xFF o 0 cada 4 cuadros
	call cambia_de_sala_en_4_5		;b3ab   ; cambia_de_sala_en_4_5: fuera de Y 0x10-0xC0 o X 0x0C-0xB4: a la sala de al lado con su sala a 0xE500
	dec (ix+01ch)		;b3ae   ; cada 0x1C cuadros, al azar; a los 0x10, lanza
	jr z,otra_cuenta		;b3b1
	ld a,(ix+01ch)		;b3b3
	cp 010h		;b3b6
	ret nz			;b3b8
	ld a,(ix+014h)		;b3b9
	and a			;b3bc
	ret z			;b3bd
lanza_y_para:		; p05:B563 y para 4 cuadros con el dibujo 8 (el paso 7)
	call suena_68		;b3be   ; suena_68: en esta sala, el sonido 0x68
	ld a,001h		;b3c1
para_con_dibujo_8:
	ld (ix+01eh),a		;b3c3
	ld a,(ix+00dh)		;b3c6   ; lee el dibujo del actor (bit 0: el paso)
	ld (ix+01dh),a		;b3c9
	ld (ix+00dh),008h		;b3cc   ; el dibujo del actor (bit 0: el paso) = 0x08
	ld (ix+00ch),000h		;b3d0
	ld (ix+00eh),004h		;b3d4   ; la espera del actor = 0x04
	ld (ix+001h),007h		;b3d8   ; el paso del actor = 0x07
	ret			;b3dc
para_sin_14:
	xor a			;b3dd
	ld (ix+014h),a		;b3de
	jr para_con_dibujo_8		;b3e1
suena_1e:		; en esta sala, sin el byte 0x14, el sonido 0x1E cada 4 cuadros
	call 08100h		;b3e3   ; en_esta_sala: Z si el actor esta en la sala de ahora (fila y columna)
	ret nz			;b3e6
	ld a,(ix+014h)		;b3e7
	and a			;b3ea
	ret nz			;b3eb
	ld a,(0ca03h)		;b3ec   ; lee el contador de cuadros (uno mas en cada interrupcion)
	and 003h		;b3ef
	ret nz			;b3f1
	jp 06a73h		;b3f2   ; sonido_1e: pide el sonido 0x1E
otra_cuenta:		; otra cuenta de 0x10-0x2F y lanza
	call 04256h		;b3f5   ; azar: A = un numero al azar (0xCA03 rotado mas R)
	and 01fh		;b3f8
	add a,010h		;b3fa
	ld (ix+01ch),a		;b3fc
L_B3FF:
	ld a,(ix+014h)		;b3ff
	and a			;b402
	jr z,lanza_y_para		;b403
	jr para_sin_14		;b405
gira_al_azar:		; una espera; con Snake en el estado 2 una direccion al azar, si no hacia Snake (p05:B4A9)
	call espera_al_azar		;b407   ; espera_al_azar: una espera de 0x10-0x1F (4-0x13 el 0x0A)
	ld a,(0cb31h)		;b40a   ; lee 1 en el estado 2 de Snake
	and a			;b40d
	jr z,L_B41E		;b40e
	call 04256h		;b410   ; azar: A = un numero al azar (0xCA03 rotado mas R)
	and 003h		;b413
	ld b,a			;b415
	call direccion_que_no_choca		;b416   ; direccion_que_no_choca: si la direccion B choca, otra (la contraria o una al azar)
	call pon_dibujo_c		;b419   ; pon_dibujo_c: el dibujo C y su velocidad
	jr lanza_y_para		;b41c
L_B41E:
	call hacia_la_sala_de_snake		;b41e   ; hacia_la_sala_de_snake: la direccion hacia la sala de Snake (p05:B4CA), y si choca, otra
	call pon_dibujo_c		;b421   ; pon_dibujo_c: el dibujo C y su velocidad
	jr L_B3FF		;b424
pon_dibujo_c:		; el dibujo C y su velocidad
	ld (ix+00dh),c		;b426   ; guarda el dibujo del actor (bit 0: el paso)
	ld a,c			;b429
	jp velocidad_de_b		;b42a   ; velocidad_de_b:
parpadeo_13:		; el byte 0x13 = 0xFF o 0 cada 4 cuadros
	ld a,(0ca03h)		;b42d   ; lee el contador de cuadros (uno mas en cada interrupcion)
	and 004h		;b430
	ld a,0ffh		;b432
	jr z,L_B437		;b434
	xor a			;b436
L_B437:
	ld (ix+013h),a		;b437
	ret			;b43a
cerca_de_snake:		; para 0x20 cuadros mirando a Snake (p05:B450) y el paso siguiente
	xor a			;b43b
	ld (ix+00ch),a		;b43c
	ld (ix+00eh),020h		;b43f   ; la espera del actor = 0x20
	call paso_siguiente_e		;b443   ; paso_siguiente_e: el paso siguiente
	call mira_a_snake		;b446   ; mira_a_snake: el dibujo de la direccion de 8 hacia Snake (p05:B464)
	ld a,(ix+014h)		;b449
	and a			;b44c
	ret z			;b44d
	jr para_sin_14		;b44e
mira_a_snake:		; el dibujo de la direccion de 8 hacia Snake (p05:B464)
	call angulo_a_snake		;b450   ; angulo_a_snake: el angulo del actor a Snake (p02:86C3)
	add a,010h		;b453
	rlca			;b455
	rlca			;b456
	rlca			;b457
	and 007h		;b458
	ld hl,0b464h		;b45a
	call 04248h		;b45d   ; byte_de_tabla: A = el byte A de la tabla de HL (y HL apunta a el)
	ld (ix+00dh),a		;b460   ; guarda el dibujo del actor (bit 0: el paso)
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


snake_a_menos_de_60:		; acarreo con Snake en esta sala a menos de 0x60 en Y y en X (salvo en el estado 2); con el byte 0x1B contando, no
	ld a,(ix+01bh)		;b46c
	and a			;b46f
	jr z,L_B477		;b470
	dec (ix+01bh)		;b472
	jr L_B49A		;b475
L_B477:
	call 08100h		;b477   ; en_esta_sala: Z si el actor esta en la sala de ahora (fila y columna)
	jr nz,L_B49A		;b47a
	ld a,(0cb31h)		;b47c   ; lee 1 en el estado 2 de Snake
	and a			;b47f
	ret nz			;b480
	call 08079h		;b481   ; y_x_de_snake_en_hl: L = la Y, H = la X de Snake
	ld a,l			;b484
	sub (ix+003h)		;b485   ; le resta la Y del actor
	jr nc,L_B48C		;b488
	neg		;b48a
L_B48C:
	cp 060h		;b48c
	ret nc			;b48e
	ld a,h			;b48f
	sub (ix+005h)		;b490   ; le resta la X del actor
	jr nc,L_B497		;b493
	neg		;b495
L_B497:
	cp 060h		;b497
	ret			;b499
L_B49A:
	or a			;b49a
	ret			;b49b
choques_con_d8a3:		; los choques del actor con 0xD8A3 = 1 mientras
	ld hl,0d8a3h		;b49c   ; 0xD8A3 = 1 mientras...
	ld (hl),001h		;b49f
	push hl			;b4a1
	call 090c8h		;b4a2   ; ...los choques
	pop hl			;b4a5
	ld (hl),000h		;b4a6
	ret			;b4a8
hacia_la_sala_de_snake:		; la direccion hacia la sala de Snake (p05:B4CA), y si choca, otra
	call direccion_a_la_sala		;b4a9   ; direccion_a_la_sala: B = hacia la fila de Snake (0, 1) o su columna (2, 3); en su sala, p05:B4E1
direccion_que_no_choca:		; si la direccion B choca, otra (la contraria o una al azar)
	push bc			;b4ac
	call choques_con_d8a3		;b4ad   ; choques_con_d8a3: los choques del actor con 0xD8A3 = 1 mientras
	ld a,c			;b4b0
	pop bc			;b4b1
	ld c,b			;b4b2
	inc b			;b4b3
L_B4B4:
	rra			;b4b4   ; el bit de la direccion...
	djnz L_B4B4		;b4b5
	ret nc			;b4b7   ; ...libre: ya esta
	ld a,c			;b4b8   ; la contraria...
	add a,002h		;b4b9
	and 003h		;b4bb
	ld b,a			;b4bd
	ld a,r		;b4be   ; ...o, al azar, la del otro eje
	rra			;b4c0
	jr c,direccion_que_no_choca		;b4c1
	rr b		;b4c3
	ccf			;b4c5
	rl b		;b4c6
	jr direccion_que_no_choca		;b4c8
direccion_a_la_sala:		; B = hacia la fila de Snake (0, 1) o su columna (2, 3); en su sala, p05:B4E1
	ld a,(0ca50h)		;b4ca   ; lee la fila de la sala en la zona (uno mas al salir por arriba)
	cp (ix+00ah)		;b4cd   ; compara con la fila de la sala del actor
	jr z,L_B4D7		;b4d0
	ld b,001h		;b4d2
	ret c			;b4d4
	dec b			;b4d5
	ret			;b4d6
L_B4D7:
	call 08107h		;b4d7   ; la misma columna: por el angulo
	jr z,direccion_por_angulo		;b4da
	ld b,002h		;b4dc   ; la columna de Snake a la izquierda (2) o a la derecha (3)
	ret c			;b4de
	inc b			;b4df
	ret			;b4e0
direccion_por_angulo:		; B = el cuarto del angulo hacia Snake: 3 (0xE0-0x1F), 1 (0x20-0x5F), 2 (0x60-0x9F), 0 (0xA0-0xDF)
	call angulo_a_snake		;b4e1   ; angulo_a_snake: el angulo del actor a Snake (p02:86C3)
	ld b,003h		;b4e4   ; 3 por debajo de 0x20 o desde 0xE0
	cp 020h		;b4e6
	ret c			;b4e8
	cp 0e0h		;b4e9
	ret nc			;b4eb
	ld b,001h		;b4ec   ; 1 por debajo de 0x60
	cp 060h		;b4ee
	ret c			;b4f0
	inc b			;b4f1   ; 2 por debajo de 0xA0
	cp 0a0h		;b4f2
	ret c			;b4f4
	ld b,000h		;b4f5   ; 0 los demas
	ret			;b4f7
angulo_a_snake:		; el angulo del actor a Snake (p02:86C3)
	ld d,(ix+005h)		;b4f8   ; lee la X del actor
	ld e,(ix+003h)		;b4fb   ; lee la Y del actor
	call 08079h		;b4fe   ; y_x_de_snake_en_hl: L = la Y, H = la X de Snake
	jp 079d1h		;b501   ; a_p02_86c3: angulo_hacia (p02:86C3) con el banco 2
salas_4_5_paso_5:		; fuera de la sala, el paso 4; la espera; cerca de Snake mira y lanza el 8 cada 4; si no, 0x20 cuadros y el paso siguiente
	call 08100h		;b504   ; en_esta_sala: Z si el actor esta en la sala de ahora (fila y columna)
	jr nz,al_paso_4_y_gira		;b507
	dec (ix+00eh)		;b509   ; baja la espera del actor
	jr z,cuenta_1b_10		;b50c
	call snake_a_menos_de_60		;b50e   ; snake_a_menos_de_60: acarreo con Snake en esta sala a menos de 0x60 en Y y en X (salvo en el estado 2); con el byte 0x1B contando, no
	jr nc,espera_20_y_paso		;b511
	ld a,(ix+017h)		;b513
	and a			;b516
	jr nz,cuenta_1b_10		;b517
	call mira_a_snake		;b519   ; mira_a_snake: el dibujo de la direccion de 8 hacia Snake (p05:B464)
	call guarda_snake_en_18		;b51c   ; guarda_snake_en_18: los bytes 0x18-0x19 = la Y y la X de Snake
lanza_8_cada_4:		; cada 4 cuadros, lanza el 8
	ld a,(0ca03h)		;b51f   ; lee el contador de cuadros (uno mas en cada interrupcion)
	and 003h		;b522
	ret nz			;b524
	jp 09b19h		;b525   ; lanza_8_b: p06:A95A y lo lanzado de tipo 8
espera_20_y_paso:
	ld (ix+00eh),020h		;b528   ; la espera del actor = 0x20
	jp paso_siguiente_e		;b52c   ; paso_siguiente_e: el paso siguiente
cuenta_1b_10:		; 0x10 cuadros en 0x1B y el paso 4
	ld (ix+01bh),010h		;b52f
	jr al_paso_4_y_gira		;b533
salas_4_5_paso_6:		; la espera lanzando; al acabar o fuera, el paso 4
	call 08100h		;b535   ; en_esta_sala: Z si el actor esta en la sala de ahora (fila y columna)
	jr nz,al_paso_4_y_gira		;b538
	dec (ix+00eh)		;b53a   ; baja la espera del actor
	jr nz,lanza_8_cada_4		;b53d
al_paso_4_y_gira:		; el paso 4 y hacia Snake
	ld (ix+001h),004h		;b53f   ; el paso del actor = 0x04
	jp L_B41E		;b543
salas_4_5_paso_7:		; al acabar la espera, el eje 3 y el dibujo de antes
	dec (ix+00eh)		;b546   ; baja la espera del actor
	ret nz			;b549
	ld (ix+00ch),003h		;b54a
	ld a,(ix+01dh)		;b54e   ; el dibujo de antes...
	ld (ix+00dh),a		;b551   ; guarda el dibujo del actor (bit 0: el paso)
	ld (ix+001h),004h		;b554   ; ...el paso 4...
	ld a,(ix+01eh)		;b558   ; ...y con el byte 0x1E, el byte 0x14 = 1
	and a			;b55b
	jr z,suena_68		;b55c
	ld (ix+014h),001h		;b55e
	ret			;b562
suena_68:		; en esta sala, el sonido 0x68
	call 08100h		;b563   ; en_esta_sala: Z si el actor esta en la sala de ahora (fila y columna)
	ret nz			;b566
	jp 06cd2h		;b567   ; sonido_68: pide el sonido 0x68
sprites_desde_paso_5:		; desde el paso 5, sus sprites
	ld a,(ix+001h)		;b56a   ; lee el paso del actor
	cp 005h		;b56d
	ret c			;b56f
	jp 08739h		;b570   ; sprites_de_la_ficha: los sprites 10-13 fuera y, si la ficha de IX esta en esta sala, sus sprites y colores
actor_de_d8a9:		; con 0xD8A9 y fuera de las especiales: con 0xC693 el sonido 0x84 y sus pasos (p05:B58F)
	ld a,(0d8a9h)		;b573
	and a			;b576
	ret z			;b577
	ld hl,06bcch		;b578
	call 086d5h		;b57b   ; si_c693: con 0xC693, lo borra y salta a HL
	ld a,(0ca76h)		;b57e   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	and a			;b581
	ret nz			;b582
	ld a,(ix+001h)		;b583   ; lee el paso del actor
	ld hl,0b58fh		;b586
	call 0424eh		;b589   ; salta_por_tabla: salta a la palabra A de la tabla de HL
	jp 08082h		;b58c   ; llama_ba36: p14:BA36 con el byte 0x0C del actor

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


d8a9_paso_0:		; con 0xD6B0: el sonido 0x89, 8 cuadros, 0xCB3C = 1 y el paso siguiente
	ld a,(0d6b0h)		;b5b5
	and a			;b5b8
	ret z			;b5b9
	call 06ca6h		;b5ba   ; sonido_89: pide el sonido 0x89 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld (ix+00eh),008h		;b5bd   ; la espera del actor = 0x08
	ld a,001h		;b5c1
	ld (0cb3ch),a		;b5c3
	jr paso_siguiente_f		;b5c6
d8a9_paso_1:		; tras la espera, el mensaje 0x1110; al acabar, 0xCB3C = 0, 0xD509 = 1 y el paso siguiente
	ld a,(ix+00eh)		;b5c8   ; lee la espera del actor
	and a			;b5cb
	jr z,L_B5D4		;b5cc
	dec (ix+00eh)		;b5ce   ; baja la espera del actor
	ret nz			;b5d1
	jr mensaje_1110		;b5d2
L_B5D4:
	call acaba_mensaje_1		;b5d4   ; acaba_mensaje_1: Z al acabar el mensaje, con p01:7A27 (A = 1)
	ret nz			;b5d7
	ld (0cb3ch),a		;b5d8
	inc a			;b5db
	ld (0d509h),a		;b5dc
paso_siguiente_f:		; el paso siguiente
	inc (ix+001h)		;b5df   ; sube el paso del actor
	ret			;b5e2
d8a9_paso_sala_1:		; en la sala 1: 0xCB3C = 1, el paso siguiente y el mensaje 0x1110
	ld a,(0ca4bh)		;b5e3   ; lee la sala de la zona
	dec a			;b5e6
	ret nz			;b5e7
	ld a,001h		;b5e8
	ld (0cb3ch),a		;b5ea
	call paso_siguiente_f		;b5ed   ; paso_siguiente_f: el paso siguiente
mensaje_1110:
	ld de,01110h		;b5f0
	jp 061ceh		;b5f3   ; mensaje_de_50: 0xD8A8 = 1: la ventana estrecha
acaba_mensaje_1:		; Z al acabar el mensaje, con p01:7A27 (A = 1)
	call 06247h		;b5f6   ; mensaje_cada_cuadro_bancos_5:
	ret nz			;b5f9
	call 079c7h		;b5fa   ; llama_7a27_1: p01:7A27 con A = 1 y los bancos 4 y 5
	xor a			;b5fd
	ret			;b5fe
acaba_mensaje_0:		; Z al acabar el mensaje, con p01:7A27 (A = 0)
	call 06247h		;b5ff   ; mensaje_cada_cuadro_bancos_5:
	ret nz			;b602
	call 079c4h		;b603   ; llama_7a27_0: p01:7A27 con A = 0 y los bancos 4 y 5
	xor a			;b606
	ret			;b607
d8a9_en_sala_6:		; en la sala 6: el dibujo 4, 0xCB3C = 1, el byte 0x16 = 1, el bit 7 de 0xD7DA, 0x20 cuadros hacia la izquierda y la musica 0xA6
	ld a,(0ca4bh)		;b608   ; lee la sala de la zona
	cp 006h		;b60b
	ret nz			;b60d
	ld (ix+00dh),004h		;b60e   ; el dibujo del actor (bit 0: el paso) = 0x04
	ld a,001h		;b612
	ld (0cb3ch),a		;b614
	ld (ix+016h),a		;b617
	ld hl,0d7dah		;b61a
	set 7,(hl)		;b61d
	ld (ix+00eh),020h		;b61f   ; la espera del actor = 0x20
	ld (ix+00ch),002h		;b623
	ld (ix+009h),0ffh		;b627   ; la velocidad del actor en X (alta) = 0xFF
	ld (ix+008h),000h		;b62b   ; la velocidad del actor en X (baja) = 0x00
	call 06bd0h		;b62f   ; sonido_a6: pide el sonido 0xA6 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	jr paso_siguiente_f		;b632
d8a9_anda:		; anda; al acabar la espera, parado con el dibujo 2 otros 0x20
	call 086deh		;b634   ; cambia_paso_cada_2: el byte 0x11 uno mas; cada 2, el paso del dibujo
	dec (ix+00eh)		;b637   ; baja la espera del actor
	ret nz			;b63a
	ld (ix+00ch),000h		;b63b
	ld (ix+00dh),002h		;b63f   ; el dibujo del actor (bit 0: el paso) = 0x02
	ld (ix+00eh),020h		;b643   ; la espera del actor = 0x20
	jr paso_siguiente_f		;b647
d8a9_mensajes:		; tras la espera, el mensaje 0x126C; al acabar, dos mosaicos de quien habla (0 y 0x0A), la pantalla limpia, la paleta de p56:B914 y el mensaje 0x770
	ld a,(ix+00eh)		;b649   ; lee la espera del actor
	and a			;b64c
	jr z,L_B659		;b64d
	dec (ix+00eh)		;b64f   ; baja la espera del actor
	ret nz			;b652
	ld de,0126ch		;b653
	jp 061d3h		;b656   ; mensaje_de_50_en: p03:B612 con DE
L_B659:
	call acaba_mensaje_0		;b659   ; acaba_mensaje_0: Z al acabar el mensaje, con p01:7A27 (A = 0)
	ret nz			;b65c
	call 07a9bh		;b65d   ; dibujos_de_93e5_bancos_5:
	ld a,00ah		;b660
	call 07a9bh		;b662   ; dibujos_de_93e5_bancos_5:
	ld hl,00000h		;b665
	ld de,00000h		;b668
	ld bc,0c0c0h		;b66b
	call 0474dh		;b66e   ; copia_rectangulo_a_esta: p00:4767 de la otra pagina (0xCA42 ^ 1) a la de 0xCA42
	ld a,(0ca42h)		;b671   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	call 04452h		;b674   ; borra_pantalla_de: 0xC0 x 0xC0 puntos a 0 en la pagina A
	call 04650h		;b677   ; espera_vdp: espera a que el VDP acabe la orden en curso (S#2 bit 0)
	call 07ab8h		;b67a   ; a_p02_8507: paleta_b914 (p02:8507) con el banco 2
	ld de,02020h		;b67d
	xor a			;b680
	ld b,a			;b681
	call 07aa0h		;b682   ; a_p03_b814: p03:B814 con el banco 3 en 0xA000
	ld de,08020h		;b685
	ld a,00ah		;b688
	ld b,001h		;b68a
	call 07aa0h		;b68c   ; a_p03_b814: p03:B814 con el banco 3 en 0xA000
	call 045f6h		;b68f   ; apaga_sprites: R#8 con el bit 1 (SPD) a uno, desde la copia 0xFFE7
	ld de,00770h		;b692
	call 061d3h		;b695   ; mensaje_de_50_en: p03:B612 con DE
	jp paso_siguiente_f		;b698   ; paso_siguiente_f: el paso siguiente
d8a9_fin_mensajes:		; p03:B8AC; al acabar el mensaje, quita los mosaicos, la sala otra vez y en marcha con su musica
	call 07aa8h		;b69b   ; a_p03_b8ac: p03:B8AC con el banco 3 en 0xA000
	call acaba_mensaje_0		;b69e   ; acaba_mensaje_0: Z al acabar el mensaje, con p01:7A27 (A = 0)
	ret nz			;b6a1
	call 045f1h		;b6a2   ; apaga_pantalla_y_sprites: p00:45CC y p00:45F6
	xor a			;b6a5
	ld (0cb3ch),a		;b6a6
	ld (ix+00fh),a		;b6a9
	call 07ab0h		;b6ac   ; a_p03_b866: p03:B866 con el banco 3 en 0xA000
	ld a,001h		;b6af
	call 07ab0h		;b6b1   ; a_p03_b866: p03:B866 con el banco 3 en 0xA000
	call 07a1fh		;b6b4   ; a_p02_8475: paleta_de_la_sala (p02:8475) con el banco 2
	ld hl,00000h		;b6b7
	ld de,00000h		;b6ba
	ld bc,0c0c0h		;b6bd
	call 0475ah		;b6c0   ; copia_rectangulo_a_la_otra: p00:4767 de la pagina 0xCA42 a la otra
	call 04650h		;b6c3   ; espera_vdp: espera a que el VDP acabe la orden en curso (S#2 bit 0)
	call 04606h		;b6c6   ; enciende_todo: la pantalla y los sprites encendidos
	call 05955h		;b6c9   ; sala_de_zona_a_e500: la sala de la ficha IX a 0xE500, de una lista y unos bloques que dependen de la zona
	call espera_al_azar		;b6cc   ; espera_al_azar: una espera de 0x10-0x1F (4-0x13 el 0x0A)
	call velocidad_del_dibujo		;b6cf   ; velocidad_del_dibujo: la velocidad de la direccion del dibujo (p05:A7AD por el tipo)
	call 08685h		;b6d2   ; por_el_tipo_8698: por el byte del tipo en p04:8698 (p04:8691)
	jp paso_siguiente_f		;b6d5   ; paso_siguiente_f: el paso siguiente
d8a9_busca:		; si no ve a Snake delante (p05:B73D), el paso siguiente; si no, anda y, al chocar o acabar la espera, gira hacia Snake
	call ve_delante		;b6d8   ; ve_delante: en esta sala, acarreo si Snake no esta en la direccion de su dibujo (p05:B751); fuera, acarreo
	jp nc,sin_eje_y_paso		;b6db   ; sin_eje_y_paso:
	call 086deh		;b6de   ; cambia_paso_cada_2: el byte 0x11 uno mas; cada 2, el paso del dibujo
	call choques_con_d8a3		;b6e1   ; choques_con_d8a3: los choques del actor con 0xD8A3 = 1 mientras
	ld a,(ix+00dh)		;b6e4   ; lee el dibujo del actor (bit 0: el paso)
	rrca			;b6e7
	and 003h		;b6e8
	inc a			;b6ea
	ld b,a			;b6eb
L_B6EC:
	rr c		;b6ec
	djnz L_B6EC		;b6ee
	jr c,L_B700		;b6f0
	dec (ix+00eh)		;b6f2   ; baja la espera del actor
	jr z,L_B700		;b6f5
	ld de,020c1h		;b6f7
	ld hl,008b9h		;b6fa
	jp L_B347		;b6fd
L_B700:
	call gira_hacia_snake		;b700   ; gira_hacia_snake: la direccion hacia Snake, una espera y su velocidad
	call 08100h		;b703   ; en_esta_sala: Z si el actor esta en la sala de ahora (fila y columna)
	ret nz			;b706
	inc (ix+00fh)		;b707   ; cada 4 giros, parado 0x20 cuadros mirando (el paso 0x0A)
	ld a,(ix+00fh)		;b70a
	and 003h		;b70d
	ret nz			;b70f
	xor a			;b710
	ld (ix+00ch),a		;b711
	ld (ix+018h),a		;b714
	ld (ix+00eh),020h		;b717   ; la espera del actor = 0x20
	ld (ix+001h),00ah		;b71b   ; el paso del actor = 0x0A
	ld a,(ix+00dh)		;b71f   ; lee el dibujo del actor (bit 0: el paso)
	and 0feh		;b722
	ld (ix+01bh),a		;b724
	ret			;b727
gira_hacia_snake:		; la direccion hacia Snake, una espera y su velocidad
	call hacia_la_sala_de_snake		;b728   ; hacia_la_sala_de_snake: la direccion hacia la sala de Snake (p05:B4CA), y si choca, otra
	ld a,c			;b72b
	add a,a			;b72c
	ld (ix+00dh),a		;b72d   ; guarda el dibujo del actor (bit 0: el paso)
espera_y_velocidad:
	call espera_al_azar		;b730   ; espera_al_azar: una espera de 0x10-0x1F (4-0x13 el 0x0A)
	jp velocidad_del_dibujo		;b733   ; velocidad_del_dibujo: la velocidad de la direccion del dibujo (p05:A7AD por el tipo)
sin_eje_y_paso:
	ld (ix+00ch),000h		;b736
	jp paso_siguiente_f		;b73a   ; paso_siguiente_f: el paso siguiente
ve_delante:		; en esta sala, acarreo si Snake no esta en la direccion de su dibujo (p05:B751); fuera, acarreo
	call 08100h		;b73d   ; en_esta_sala: Z si el actor esta en la sala de ahora (fila y columna)
	jr nz,L_B74F		;b740
	ld a,(ix+00dh)		;b742   ; lee el dibujo del actor (bit 0: el paso)
	ld hl,0b751h		;b745
	call 0423eh		;b748   ; suma_a_hl: HL = HL + A
	ld b,(hl)			;b74b
	jp 084a4h		;b74c   ; lo_tiene_delante: acarreo si Snake no esta en la direccion B del actor; si esta, mira si le ve (p04:8518)
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


d8a9_lanza:		; con el byte 0x17, otra direccion al azar; si ve a Snake, lanza el 8 cada 4 cuadros; si no, vuelve al paso de antes
	ld a,(ix+017h)		;b761
	and a			;b764
	jr z,L_B781		;b765
otra_direccion:		; la direccion contraria en su eje, o la de al lado, al azar
	ld a,(ix+00dh)		;b767   ; lee el dibujo del actor (bit 0: el paso)
	and 007h		;b76a
	ld b,004h		;b76c
	cp b			;b76e
	jr c,L_B773		;b76f
	ld b,000h		;b771
L_B773:
	call 04256h		;b773   ; azar: A = un numero al azar (0xCA03 rotado mas R)
	and 002h		;b776
	add a,b			;b778
	ld (ix+00dh),a		;b779   ; guarda el dibujo del actor (bit 0: el paso)
	call espera_y_velocidad		;b77c   ; espera_y_velocidad:
	jr vuelve_al_paso_de_antes		;b77f
L_B781:
	call ve_delante		;b781   ; ve_delante: en esta sala, acarreo si Snake no esta en la direccion de su dibujo (p05:B751); fuera, acarreo
	jr c,vuelve_al_paso_de_antes		;b784
	ld a,(0ca03h)		;b786   ; lee el contador de cuadros (uno mas en cada interrupcion)
	and 003h		;b789
	ret nz			;b78b
	jp 09b0dh		;b78c   ; lanza_8: p06:A942, su desplazamiento en 0xD43C y lo lanzado de tipo 8
vuelve_al_paso_de_antes:
	ld (ix+00ch),003h		;b78f
	dec (ix+001h)		;b793   ; baja el paso del actor
	ret			;b796
d8a9_mira:		; sin verle, mira a los lados cada 8 cuadros; al acabar, el paso 8
	ld a,(ix+017h)		;b797
	and a			;b79a
	jr nz,otra_direccion		;b79b
	call ve_delante		;b79d   ; ve_delante: en esta sala, acarreo si Snake no esta en la direccion de su dibujo (p05:B751); fuera, acarreo
	jr nc,$-106		;b7a0
	dec (ix+00eh)		;b7a2   ; baja la espera del actor
	jr z,al_paso_8_y_gira		;b7a5
	ld a,(ix+00eh)		;b7a7   ; lee la espera del actor
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
	ld (ix+00dh),a		;b7c2   ; guarda el dibujo del actor (bit 0: el paso)
	ret			;b7c5
d8a9_lanza_b:		; si le ve, lanza el 8 cada 4 cuadros; si no, el paso 8
	ld a,(ix+017h)		;b7c6
	and a			;b7c9
	jr nz,otra_direccion		;b7ca
	call ve_delante		;b7cc   ; ve_delante: en esta sala, acarreo si Snake no esta en la direccion de su dibujo (p05:B751); fuera, acarreo
	jr c,al_paso_8_y_gira		;b7cf
	ld a,(0ca03h)		;b7d1   ; lee el contador de cuadros (uno mas en cada interrupcion)
	and 003h		;b7d4
	ret nz			;b7d6
	jp 09b0dh		;b7d7   ; lanza_8: p06:A942, su desplazamiento en 0xD43C y lo lanzado de tipo 8
al_paso_8_y_gira:
	ld (ix+001h),008h		;b7da   ; el paso del actor = 0x08
	jp gira_hacia_snake		;b7de   ; gira_hacia_snake: la direccion hacia Snake, una espera y su velocidad
escena_de_b7e1:		; Snake en el estado 0 quieto, 0xCB3C = 1, 0x0C cuadros, el dibujo 0x80 y los sprites 4-7 fuera
	xor a			;b7e1
	ld (ix+00ch),a		;b7e2
	ld (ix+016h),a		;b7e5
	ld (0cb01h),a		;b7e8   ; guarda el dibujo de Snake (al darse la vuelta se le suma 1, 3 o 5 segun 0xCB00)
	ld (0cb00h),a		;b7eb   ; guarda el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	ld (0cb16h),a		;b7ee   ; guarda 1 mientras Snake se da la vuelta
	ld (0cb44h),a		;b7f1   ; guarda 1-2: el arma 0x0C en marcha (2 con 0xCB21 = 0x1D; p11:B211)
	inc a			;b7f4
	ld (0cb3ch),a		;b7f5
	ld (0cb14h),a		;b7f8   ; guarda el dibujo del paso de andar (0, 1, 2, 1: p02:9888)
	ld (ix+00eh),00ch		;b7fb   ; la espera del actor = 0x0C
	ld (ix+00dh),080h		;b7ff   ; el dibujo del actor (bit 0: el paso) = 0x80
	ld hl,0dc10h		;b803
	ld bc,00010h		;b806
	ld a,0e0h		;b809
	call 04237h		;b80b   ; llena_bloque: pone A en BC + 1 bytes desde HL
	jp paso_siguiente_f		;b80e   ; paso_siguiente_f: el paso siguiente
escena_de_b811:		; las rachas de p41:BC6E, el sonido 0x14, el paso siguiente y p00:5DD3
	call 06faeh		;b811   ; rachas_bc6e: las rachas de p41:BC6E a la VRAM de 0xFE00
	call 06a44h		;b814   ; sonido_14: pide el sonido 0x14
	call paso_siguiente_f		;b817   ; paso_siguiente_f: el paso siguiente
	jp 05dd3h		;b81a
escena_de_b81d:		; cada 4 cuadros el dibujo siguiente; al acabar: los sprites de p36:858D, una direccion libre, el dibujo 0x14, 0xC0 cuadros, el sonido 0x64 y el aviso 0x0A
	dec (ix+00eh)		;b81d   ; baja la espera del actor
	jr z,L_B82C		;b820
	ld a,(ix+00eh)		;b822   ; lee la espera del actor
	and 003h		;b825
	ret nz			;b827
	inc (ix+00dh)		;b828   ; sube el dibujo del actor (bit 0: el paso)
	ret			;b82b
L_B82C:
	push ix		;b82c
	call 0506eh		;b82e   ; sprites_de_858d: p36:858D...
	pop ix		;b831
	call 090c8h		;b833   ; choques_del_actor: C = por donde choca el actor (bits 0-3), con los puntos de p04:915C (o p04:9164 desde 0xD800)
	call direccion_libre_azar		;b836   ; direccion_libre_azar: una direccion al azar sin choque (C), con su velocidad de p05:B87A
	ld (ix+00ch),003h		;b839
	ld (ix+00dh),014h		;b83d
	ld (ix+00eh),0c0h		;b841
	call paso_siguiente_f		;b845   ; paso_siguiente_f: el paso siguiente
	call 06caeh		;b848   ; sonido_64: pide el sonido 0x64
	jp 09d2ah		;b84b   ; aviso_0a_30:
direccion_libre_azar:		; una direccion al azar sin choque (C), con su velocidad de p05:B87A
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
	rra			;b859   ; su bit en C
	djnz L_B859		;b85a
	jr nc,L_B865		;b85c   ; libre: esa
	ld a,d			;b85e   ; si no, la siguiente
	inc a			;b85f
	and 003h		;b860
	ld d,a			;b862
	jr L_B856		;b863
L_B865:
	ld a,d			;b865
	ld hl,0b87ah		;b866
	call 043f6h		;b869   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	xor a			;b86c
	ld (ix+008h),a		;b86d   ; guarda la velocidad del actor en X (baja)
	ld (ix+009h),l		;b870   ; guarda la velocidad del actor en X (alta)
	ld (ix+006h),a		;b873   ; guarda la velocidad del actor en Y (baja)
	ld (ix+007h),h		;b876   ; guarda la velocidad del actor en Y (alta)
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


rebota:		; anda; al borde (Y 0x18-0xBB, X 0x0C-0xB3) da la vuelta; al chocar, otra direccion libre; a 0x60 y al acabar, el aviso 0x8C
	call 086deh		;b882   ; cambia_paso_cada_2: el byte 0x11 uno mas; cada 2, el paso del dibujo
	ld a,(ix+007h)		;b885   ; lee la velocidad del actor en Y (alta)
	and a			;b888
	jr z,L_B897		;b889
	ld a,(ix+003h)		;b88b   ; lee la Y del actor
	sub 018h		;b88e
	cp 0a4h		;b890
	jp nc,0809eh		;b892   ; vuelve_en_y: la velocidad en Y cambiada de signo
	jr L_B8A1		;b895
L_B897:
	ld a,(ix+005h)		;b897   ; lee la X del actor
	sub 00ch		;b89a
	cp 0a8h		;b89c
	jp nc,0808eh		;b89e   ; vuelve_en_x: la velocidad en X cambiada de signo
L_B8A1:
	call 090c8h		;b8a1   ; choques_del_actor: C = por donde choca el actor (bits 0-3), con los puntos de p04:915C (o p04:9164 desde 0xD800)
	ld a,(ix+007h)		;b8a4   ; lee la velocidad del actor en Y (alta)
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
	ld a,(ix+009h)		;b8b5   ; lee la velocidad del actor en X (alta)
	rla			;b8b8
	ld a,004h		;b8b9
	jr c,L_B8BF		;b8bb
	ld a,008h		;b8bd
L_B8BF:
	ld b,003h		;b8bf
L_B8C1:
	and c			;b8c1
	jr nz,L_B8D1		;b8c2
	ld a,(ix+00eh)		;b8c4   ; lee la espera del actor
	and 01fh		;b8c7
	jr nz,L_B8D4		;b8c9
	ld c,b			;b8cb
	call direccion_libre_azar		;b8cc   ; direccion_libre_azar: una direccion al azar sin choque (C), con su velocidad de p05:B87A
	jr L_B8D4		;b8cf
L_B8D1:
	call 0808bh		;b8d1   ; da_la_vuelta_al_actor: las dos velocidades del actor cambiadas de signo
L_B8D4:
	dec (ix+00eh)		;b8d4   ; baja la espera del actor
	ld a,(ix+00eh)		;b8d7   ; lee la espera del actor
	cp 060h		;b8da
	jp z,09d2fh		;b8dc   ; aviso_8c_30:
	and a			;b8df
	ret nz			;b8e0
	call 09d2fh		;b8e1   ; aviso_8c_30:
	ld (ix+00ch),000h		;b8e4
	jr dibujo_16_y_40		;b8e8
parpadea_dibujo:		; cada 8 cuadros cambia el paso del dibujo; al acabar, p05:B8FF
	dec (ix+00eh)		;b8ea   ; baja la espera del actor
	jr z,dibujo_16_y_40		;b8ed
	ld a,(ix+00eh)		;b8ef   ; lee la espera del actor
	and 007h		;b8f2
	ret nz			;b8f4
	ld a,(ix+00dh)		;b8f5   ; lee el dibujo del actor (bit 0: el paso)
	rra			;b8f8
	ccf			;b8f9
	rla			;b8fa
	ld (ix+00dh),a		;b8fb   ; guarda el dibujo del actor (bit 0: el paso)
	ret			;b8fe
dibujo_16_y_40:		; el dibujo 0x16, 0x40 cuadros y el paso siguiente
	ld (ix+00dh),016h		;b8ff   ; el dibujo del actor (bit 0: el paso) = 0x16
	ld (ix+00eh),040h		;b903   ; la espera del actor = 0x40
	jp paso_siguiente_f		;b907   ; paso_siguiente_f: el paso siguiente
espera_y_aviso_8d:		; la espera; a 0x20, el aviso 0x8D; al acabar, el paso siguiente
	dec (ix+00eh)		;b90a   ; baja la espera del actor
	ld a,(ix+00eh)		;b90d   ; lee la espera del actor
	cp 020h		;b910
	jp z,09d34h		;b912   ; aviso_8d_30:
	and a			;b915
	ret nz			;b916
	jp paso_siguiente_f		;b917   ; paso_siguiente_f: el paso siguiente
suelta_y_paso_20:		; 0xCB3C = 0 y el paso 0x20
	xor a			;b91a
	ld (0cb3ch),a		;b91b
	ld (ix+001h),020h		;b91e   ; el paso del actor = 0x20
	ret			;b922
actor_de_d8aa:		; con 0xD8AA, sus pasos (p05:B934)
	ld a,(0d8aah)		;b923
	and a			;b926
	ret z			;b927
	ld a,(ix+001h)		;b928   ; lee el paso del actor
	ld hl,0b934h		;b92b
	call 0424eh		;b92e   ; salta_por_tabla: salta a la palabra A de la tabla de HL
	jp 08082h		;b931   ; llama_ba36: p14:BA36 con el byte 0x0C del actor

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


d8aa_paso_0:		; el dibujo 0, 0xCB3C = 1, 0x18 cuadros y el paso siguiente
	xor a			;b960
	ld (ix+00dh),a		;b961   ; guarda el dibujo del actor (bit 0: el paso)
	inc a			;b964
	ld (0cb3ch),a		;b965
	ld (ix+00eh),018h		;b968   ; la espera del actor = 0x18
	jp paso_siguiente_g		;b96c   ; paso_siguiente_g: el paso siguiente
d8aa_paso_1:		; al acabar la espera, el mensaje 0x910
	dec (ix+00eh)		;b96f   ; baja la espera del actor
	ret nz			;b972
	ld d,009h		;b973
	jp mensaje_d10		;b975   ; mensaje_d10: el mensaje (D, 0x10)
d8aa_paso_2:		; al acabar el mensaje: 0xD509 = 0xCB3C = 1, hacia abajo y el paso siguiente
	call acaba_mensaje_1		;b978   ; acaba_mensaje_1: Z al acabar el mensaje, con p01:7A27 (A = 1)
	ret nz			;b97b
	ld (ix+00eh),a		;b97c   ; guarda la espera del actor
	inc a			;b97f
	ld (0d509h),a		;b980
	ld (0cb3ch),a		;b983
	ld (ix+00dh),002h		;b986   ; el dibujo del actor (bit 0: el paso) = 0x02
	call velocidad_del_dibujo		;b98a   ; velocidad_del_dibujo: la velocidad de la direccion del dibujo (p05:A7AD por el tipo)
	jp paso_siguiente_g		;b98d   ; paso_siguiente_g: el paso siguiente
d8aa_paso_3:		; el borde, anda y cambia de sala; en la fila 2 desde Y = 0x5E, hacia la izquierda
	call borde_con_d88c		;b990   ; borde_con_d88c: con 0xD88C a 0xFF, R#7 = 0x0F; si no, cada 8 cuadros R#7 = 0x0A (parpadea)
	call 086deh		;b993   ; cambia_paso_cada_2: el byte 0x11 uno mas; cada 2, el paso del dibujo
	call cambia_de_sala_b		;b996   ; cambia_de_sala_b: a la sala de al lado si sale (p05:AE6B)
	ld a,(ix+00ah)		;b999   ; lee la fila de la sala del actor
	cp 002h		;b99c
	ret nz			;b99e
	ld a,(ix+003h)		;b99f   ; lee la Y del actor
	cp 05eh		;b9a2
	ret c			;b9a4
	ld (ix+00dh),004h		;b9a5   ; el dibujo del actor (bit 0: el paso) = 0x04
	call velocidad_del_dibujo		;b9a9   ; velocidad_del_dibujo: la velocidad de la direccion del dibujo (p05:A7AD por el tipo)
	jp paso_siguiente_g		;b9ac   ; paso_siguiente_g: el paso siguiente
cambia_de_sala_b:		; a la sala de al lado si sale (p05:AE6B)
	ld de,020c1h		;b9af
	ld hl,008b9h		;b9b2
	jp sale_a_la_de_al_lado		;b9b5   ; sale_a_la_de_al_lado: por arriba: fila + 1 y abajo; por abajo: fila - 1 y arriba; por los lados, la columna y al otro lado
d8aa_paso_4:		; en la columna 8 a la izquierda de X = 0x50: parado, 0xCB3C = 0, el dibujo 6 y p03:B108
	call borde_con_d88c		;b9b8   ; borde_con_d88c: con 0xD88C a 0xFF, R#7 = 0x0F; si no, cada 8 cuadros R#7 = 0x0A (parpadea)
	call cambia_de_sala_b		;b9bb   ; cambia_de_sala_b: a la sala de al lado si sale (p05:AE6B)
	ld a,(ix+00bh)		;b9be   ; lee la columna de la sala del actor
	cp 008h		;b9c1
	ret nz			;b9c3
	ld a,(ix+005h)		;b9c4   ; lee la X del actor
	cp 050h		;b9c7
	ret nc			;b9c9
	xor a			;b9ca
	ld (ix+00ch),a		;b9cb
	ld (0cb3ch),a		;b9ce
	ld (ix+00dh),006h		;b9d1   ; el dibujo del actor (bit 0: el paso) = 0x06
	call 07a70h		;b9d5   ; a_p03_b108: p03:B108 con el banco 3 en 0xA000
	jr paso_siguiente_g		;b9d8
borde_con_d88c:		; con 0xD88C a 0xFF, R#7 = 0x0F; si no, cada 8 cuadros R#7 = 0x0A (parpadea)
	ld a,(0d88ch)		;b9da
	inc a			;b9dd
	jr z,L_B9ED		;b9de
	inc (ix+00eh)		;b9e0   ; sube la espera del actor
	ld a,(ix+00eh)		;b9e3   ; lee la espera del actor
	and 007h		;b9e6
	ld bc,00a07h		;b9e8
	jr z,L_B9F0		;b9eb
L_B9ED:
	ld bc,00f07h		;b9ed
L_B9F0:
	jp 00047h		;b9f0   ; BIOS WRTVDP - Writes data in the VDP-register
d8aa_paso_5:		; el borde; con 0xD88C a 0xFF en la sala 3, 0xD509 = 1, el dibujo 6 y el paso siguiente
	call borde_con_d88c		;b9f3   ; borde_con_d88c: con 0xD88C a 0xFF, R#7 = 0x0F; si no, cada 8 cuadros R#7 = 0x0A (parpadea)
	ld a,(0d88ch)		;b9f6
	inc a			;b9f9
	ret nz			;b9fa
	ld a,(0ca4bh)		;b9fb   ; lee la sala de la zona
	cp 003h		;b9fe
	ret nz			;ba00
	ld a,001h		;ba01
	ld (0d509h),a		;ba03
	ld (ix+00dh),006h		;ba06   ; el dibujo del actor (bit 0: el paso) = 0x06
	jr paso_siguiente_g		;ba0a
d8aa_paso_6:		; en la sala 2: 0xCB3C = 1, el bit 1 de 0xD7D9, el sonido 0x81 y 16 cuadros
	ld a,(0ca4bh)		;ba0c   ; lee la sala de la zona
	cp 002h		;ba0f
	ret nz			;ba11
	ld a,001h		;ba12
	ld (0cb3ch),a		;ba14
	ld hl,0d7d9h		;ba17
	set 1,(hl)		;ba1a
	call 06b95h		;ba1c   ; sonido_81: pide el sonido 0x81 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld (ix+00eh),010h		;ba1f   ; la espera del actor = 0x10
	jr paso_siguiente_g		;ba23
d8aa_paso_7:		; tras la espera, el mensaje 0xF10; al acabar, el byte 0x16 = 1 y el barrido desde (0x60, 0x60)
	ld a,(ix+00eh)		;ba25   ; lee la espera del actor
	and a			;ba28
	jr z,L_BA35		;ba29
	dec (ix+00eh)		;ba2b   ; baja la espera del actor
	ret nz			;ba2e
	ld de,00f10h		;ba2f
	jp 061ceh		;ba32   ; mensaje_de_50: 0xD8A8 = 1: la ventana estrecha
L_BA35:
	call acaba_mensaje_1		;ba35   ; acaba_mensaje_1: Z al acabar el mensaje, con p01:7A27 (A = 1)
	ret nz			;ba38
	ld (ix+016h),001h		;ba39
	ld de,06060h		;ba3d
	call 079d9h		;ba40   ; a_p03_b67d: p03:B67D con el banco 3 en 0xA000
	jr paso_siguiente_g		;ba43
d8aa_paso_8:		; el barrido; al acabar, el mensaje 0x1310
	call 079e1h		;ba45   ; a_p03_b6c8: p03:B6C8 con el banco 3 en 0xA000
	ld a,(0e270h)		;ba48   ; lee el barrido: 1 por pasos, 2 de 4 en 4 (0 nada)
	and a			;ba4b
	ret nz			;ba4c
	ld d,013h		;ba4d
mensaje_d10:		; el mensaje (D, 0x10)
	ld e,010h		;ba4f
	call 061ceh		;ba51   ; mensaje_de_50: 0xD8A8 = 1: la ventana estrecha
paso_siguiente_g:		; el paso siguiente
	inc (ix+001h)		;ba54   ; sube el paso del actor
L_BA57:
	ret			;ba57
d8aa_paso_9:		; al acabar el mensaje: 0xCB3C = 0, su musica, p03:B108, el paso siguiente y hacia Snake
	call acaba_mensaje_1		;ba58   ; acaba_mensaje_1: Z al acabar el mensaje, con p01:7A27 (A = 1)
	ret nz			;ba5b
	ld (0cb3ch),a		;ba5c
	ld (ix+011h),a		;ba5f
	ld (ix+00fh),a		;ba62
	call 08685h		;ba65   ; por_el_tipo_8698: por el byte del tipo en p04:8698 (p04:8691)
	call 07a70h		;ba68   ; a_p03_b108: p03:B108 con el banco 3 en 0xA000
	call paso_siguiente_g		;ba6b   ; paso_siguiente_g: el paso siguiente
hacia_snake_0:		; hacia Snake (A = 0) con su velocidad
	xor a			;ba6e
	jr L_BA73		;ba6f
hacia_snake_1:		; hacia Snake por el otro eje (A = 1)
	ld a,001h		;ba71
L_BA73:
	call direccion_a_snake_18		;ba73   ; direccion_a_snake_18: B = la direccion hacia Snake (p05:B4E1; con A, la del otro eje); a 0x18 y el dibujo
	ld a,b			;ba76
	jp velocidad_de_b		;ba77   ; velocidad_de_b:
direccion_a_snake_18:		; B = la direccion hacia Snake (p05:B4E1; con A, la del otro eje); a 0x18 y el dibujo
	push af			;ba7a
	call direccion_por_angulo		;ba7b   ; direccion_por_angulo: B = el cuarto del angulo hacia Snake: 3 (0xE0-0x1F), 1 (0x20-0x5F), 2 (0x60-0x9F), 0 (0xA0-0xDF)
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
	ld (ix+00dh),a		;ba8c   ; guarda el dibujo del actor (bit 0: el paso)
	ret			;ba8f
d8aa_paso_a:		; si choca, hacia Snake; cerca en su eje (0x0C y 6), parado 0x18 cuadros y el paso siguiente; cerca del eje de Snake, hacia el
	call dando_la_vuelta_17		;ba90   ; dando_la_vuelta_17: con el byte 0x17: el paso 0x0C, una cuenta al azar y la direccion contraria (Z si no)
	ret nz			;ba93
	call 090c8h		;ba94   ; choques_del_actor: C = por donde choca el actor (bits 0-3), con los puntos de p04:915C (o p04:9164 desde 0xD800)
	ld a,(ix+007h)		;ba97   ; lee la velocidad del actor en Y (alta)
	and a			;ba9a
	ld a,003h		;ba9b
	jr nz,L_BAA1		;ba9d
	ld a,00ch		;ba9f
L_BAA1:
	and c			;baa1
	jr nz,hacia_snake_0		;baa2
	call 086deh		;baa4   ; cambia_paso_cada_2: el byte 0x11 uno mas; cada 2, el paso del dibujo
	call de_y_hl_con_snake		;baa7   ; de_y_hl_con_snake: D = la Y de Snake, H = su X, E = la Y del actor, L = su X
	ld a,(ix+007h)		;baaa   ; lee la velocidad del actor en Y (alta)
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
	cp b			;babd   ; a menos de B...
	jr nc,L_BAC9		;babe
	ld a,d			;bac0   ; ...y a menos de C
	sub e			;bac1
	jr nc,L_BAC6		;bac2
	neg		;bac4
L_BAC6:
	cp c			;bac6
	jr c,L_BAE3		;bac7
L_BAC9:
	call de_y_hl_con_snake		;bac9   ; de_y_hl_con_snake: D = la Y de Snake, H = su X, E = la Y del actor, L = su X
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
	jp hacia_snake_0		;bae0   ; hacia_snake_0: hacia Snake (A = 0) con su velocidad
L_BAE3:
	xor a			;bae3
	ld (ix+00ch),a		;bae4
	ld (ix+00fh),a		;bae7
	ld (ix+00eh),018h		;baea   ; la espera del actor = 0x18
	jp paso_siguiente_g		;baee   ; paso_siguiente_g: el paso siguiente
de_y_hl_con_snake:		; D = la Y de Snake, H = su X, E = la Y del actor, L = su X
	call 08079h		;baf1   ; y_x_de_snake_en_hl: L = la Y, H = la X de Snake
	ld d,l			;baf4
	ld l,(ix+005h)		;baf5   ; lee la X del actor
	ld e,(ix+003h)		;baf8   ; lee la Y del actor
	ret			;bafb
mira_y_suena_09:		; el dibujo 8 + la direccion hacia Snake y el sonido 9
	call direccion_por_angulo		;bafc   ; direccion_por_angulo: B = el cuarto del angulo hacia Snake: 3 (0xE0-0x1F), 1 (0x20-0x5F), 2 (0x60-0x9F), 0 (0xA0-0xDF)
	ld a,008h		;baff
	add a,b			;bb01
	ld (ix+00dh),a		;bb02   ; guarda el dibujo del actor (bit 0: el paso)
	jp 06a15h		;bb05   ; sonido_09: pide el sonido 0x09
dando_la_vuelta_17:		; con el byte 0x17: el paso 0x0C, una cuenta al azar y la direccion contraria (Z si no)
	ld a,(ix+017h)		;bb08
	and a			;bb0b
	ret z			;bb0c
	ld (ix+001h),00ch		;bb0d   ; el paso del actor = 0x0C
	call cuenta_0f_azar		;bb11   ; cuenta_0f_azar: el byte 0x0F = 1-4 al azar
	ld a,(ix+00dh)		;bb14   ; lee el dibujo del actor (bit 0: el paso)
	cp 008h		;bb17
	jr nc,L_BB2A		;bb19
	srl a		;bb1b
L_BB1D:
	add a,002h		;bb1d
	and 003h		;bb1f
	ld b,a			;bb21
	add a,a			;bb22
	ld (ix+00dh),a		;bb23   ; guarda el dibujo del actor (bit 0: el paso)
	ld a,b			;bb26
	jp velocidad_de_b		;bb27   ; velocidad_de_b:
L_BB2A:
	sub 008h		;bb2a
	jr L_BB1D		;bb2c
cuenta_0f_azar:		; el byte 0x0F = 1-4 al azar
	call 04256h		;bb2e   ; azar: A = un numero al azar (0xCA03 rotado mas R)
	and 003h		;bb31
	inc a			;bb33
	ld (ix+00fh),a		;bb34
	ret			;bb37
d8aa_paso_b:		; parado; cada 4 cuadros, mira (p05:BAFC) o hacia Snake; al acabar, al azar, otra vuelta o el paso siguiente
	call dando_la_vuelta_17		;bb38   ; dando_la_vuelta_17: con el byte 0x17: el paso 0x0C, una cuenta al azar y la direccion contraria (Z si no)
	ret nz			;bb3b
	dec (ix+00eh)		;bb3c   ; baja la espera del actor
	jr z,L_BB54		;bb3f
	ld a,(ix+00eh)		;bb41   ; lee la espera del actor
	and 003h		;bb44
	ret nz			;bb46
	ld a,(ix+00fh)		;bb47
	inc (ix+00fh)		;bb4a
	rra			;bb4d
	jr nc,mira_y_suena_09		;bb4e
	xor a			;bb50
	jp direccion_a_snake_18		;bb51   ; direccion_a_snake_18: B = la direccion hacia Snake (p05:B4E1; con A, la del otro eje); a 0x18 y el dibujo
L_BB54:
	call 04256h		;bb54   ; azar: A = un numero al azar (0xCA03 rotado mas R)
	rra			;bb57
	jr c,$+47		;bb58
	call hacia_snake_1		;bb5a   ; hacia_snake_1: hacia Snake por el otro eje (A = 1)
	call cuenta_0f_azar		;bb5d   ; cuenta_0f_azar: el byte 0x0F = 1-4 al azar
	jp paso_siguiente_g		;bb60   ; paso_siguiente_g: el paso siguiente
d8aa_paso_c:		; anda en el pasillo central (p05:BB8E); fuera, el giro de p05:BB83 hasta acabar la cuenta, y el paso 0x0A
	call 086deh		;bb63   ; cambia_paso_cada_2: el byte 0x11 uno mas; cada 2, el paso del dibujo
	call en_el_pasillo		;bb66   ; en_el_pasillo: acarreo en el pasillo: en vertical Y 0x58-0x87, en horizontal X 0x48-0x77
	ret c			;bb69
	dec (ix+00fh)		;bb6a
	jr z,$+26		;bb6d
	ld a,(ix+00dh)		;bb6f   ; lee el dibujo del actor (bit 0: el paso)
	rrca			;bb72
	and 003h		;bb73
	ld hl,0bb83h		;bb75
	call 04248h		;bb78   ; byte_de_tabla: A = el byte A de la tabla de HL (y HL apunta a el)
	add a,a			;bb7b
	ld (ix+00dh),a		;bb7c   ; guarda el dibujo del actor (bit 0: el paso)
	ld a,(hl)			;bb7f
	jp velocidad_de_b		;bb80   ; velocidad_de_b:

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


al_paso_0a_hacia_snake:
	ld (ix+001h),00ah		;bb87   ; el paso del actor = 0x0A
	jp hacia_snake_0		;bb8b   ; hacia_snake_0: hacia Snake (A = 0) con su velocidad
en_el_pasillo:		; acarreo en el pasillo: en vertical Y 0x58-0x87, en horizontal X 0x48-0x77
	ld a,(ix+007h)		;bb8e   ; lee la velocidad del actor en Y (alta)
	and a			;bb91
	ld a,(ix+003h)		;bb92   ; lee la Y del actor
	ld b,058h		;bb95
	jr nz,L_BB9E		;bb97
	ld b,048h		;bb99
	ld a,(ix+005h)		;bb9b   ; lee la X del actor
L_BB9E:
	sub b			;bb9e
	cp 030h		;bb9f
	ret			;bba1
d8aa_paso_d:		; sin llamada, 0xCB3C = 1, el dibujo 0x0C, 0x20 cuadros, p03:B1A3 y el sonido 0x93
	xor a			;bba2
	ld (ix+00ch),a		;bba3
	ld (0e1e8h),a		;bba6   ; guarda 1 mientras hay una llamada
	ld (0d7bbh),a		;bba9   ; guarda 1: la pantalla de conversacion la abre una escena (llama sola, p09:B8AB)
	inc a			;bbac
	ld (0cb3ch),a		;bbad
	ld (ix+00dh),00ch		;bbb0   ; el dibujo del actor (bit 0: el paso) = 0x0C
	ld (ix+00eh),020h		;bbb4   ; la espera del actor = 0x20
	call 07a0ah		;bbb8   ; a_p03_b1a3: p03:B1A3 con el banco 3 en 0xA000
	call 06c1bh		;bbbb   ; sonido_93: pide el sonido 0x93 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	jp paso_siguiente_g		;bbbe   ; paso_siguiente_g: el paso siguiente
d8aa_paso_e:		; al acabar la espera, la otra pagina entera a esta y el barrido desde (0x60, 0x60)
	dec (ix+00eh)		;bbc1   ; baja la espera del actor
	ret nz			;bbc4
	ld h,000h		;bbc5
	ld l,h			;bbc7
	ld d,h			;bbc8
	ld e,h			;bbc9
	ld bc,0c0c0h		;bbca
	call 0474dh		;bbcd   ; copia_rectangulo_a_esta: p00:4767 de la otra pagina (0xCA42 ^ 1) a la de 0xCA42
	ld de,06060h		;bbd0
	call 07a02h		;bbd3   ; a_p03_b68e: p03:B68E con el banco 3 en 0xA000
	jp paso_siguiente_g		;bbd6   ; paso_siguiente_g: el paso siguiente
d8aa_paso_f:		; al acabar el barrido: el sonido 0xA0, 0xD8AA = 2, sin sprites, las rachas de p43:BE79, dos sprites, dos mosaicos de quien habla (0 y 8) y el mensaje 0x1070
	call 079e1h		;bbd9   ; a_p03_b6c8: p03:B6C8 con el banco 3 en 0xA000
	ld a,(0e270h)		;bbdc   ; lee el barrido: 1 por pasos, 2 de 4 en 4 (0 nada)
	and a			;bbdf
	ret nz			;bbe0
	call 06cc2h		;bbe1   ; sonido_a0: pide el sonido 0xA0 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	call 045f6h		;bbe4   ; apaga_sprites: R#8 con el bit 1 (SPD) a uno, desde la copia 0xFFE7
	ld a,002h		;bbe7
	ld (0d8aah),a		;bbe9
	call 045d7h		;bbec   ; esconde_sprites_vram: llena con 0xE0 128 bytes de la VRAM en 0xF600 y otros 128 en 0xF200
	call 06f6ah		;bbef   ; rachas_be79: las rachas de p43:BE79
	ld a,0d8h		;bbf2   ; el sprite 28 con Y = 0xD8 (los que siguen no se ven)
	ld (0dc70h),a		;bbf4
	ld hl,0dc78h		;bbf7   ; los sprites 30 y 31 en (0x27, 0x88) y (0x37, 0x90), patrones 0xF8 y 0xFC
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
	ld hl,0dbe0h		;bc0c   ; sus colores al 0x0A
	ld bc,0001fh		;bc0f
	ld a,00ah		;bc12
	call 04237h		;bc14   ; llena_bloque: pone A en BC + 1 bytes desde HL
	xor a			;bc17
	call 07a9bh		;bc18   ; dibujos_de_93e5_bancos_5:
	ld a,008h		;bc1b
	call 07a9bh		;bc1d   ; dibujos_de_93e5_bancos_5:
	ld a,(0ca42h)		;bc20   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	call 04452h		;bc23   ; borra_pantalla_de: 0xC0 x 0xC0 puntos a 0 en la pagina A
	call 04650h		;bc26   ; espera_vdp: espera a que el VDP acabe la orden en curso (S#2 bit 0)
	call 07ab8h		;bc29   ; a_p02_8507: paleta_b914 (p02:8507) con el banco 2
	call 04609h		;bc2c   ; enciende_sprites: R#8 con el bit 1 (SPD) a cero, desde la copia 0xFFE7
	ld de,02020h		;bc2f
	xor a			;bc32
	ld b,a			;bc33
	call 07aa0h		;bc34   ; a_p03_b814: p03:B814 con el banco 3 en 0xA000
	ld de,08020h		;bc37
	ld a,008h		;bc3a
	ld b,001h		;bc3c
	call 07aa0h		;bc3e   ; a_p03_b814: p03:B814 con el banco 3 en 0xA000
	ld de,01070h		;bc41
	call 061d3h		;bc44   ; mensaje_de_50_en: p03:B612 con DE
	jp paso_siguiente_g		;bc47   ; paso_siguiente_g: el paso siguiente
d8aa_paso_10:		; p03:B8AC; al acabar el mensaje, la pantalla apagada, 0xCD00-0xCDFF a cero, quita los dos mosaicos y Snake quieto en el estado 0
	call 07aa8h		;bc4a   ; a_p03_b8ac: p03:B8AC con el banco 3 en 0xA000
	call acaba_mensaje_0		;bc4d   ; acaba_mensaje_0: Z al acabar el mensaje, con p01:7A27 (A = 0)
	ret nz			;bc50
	call 045f1h		;bc51   ; apaga_pantalla_y_sprites: p00:45CC y p00:45F6
	ld hl,0cd00h		;bc54
	ld bc,000ffh		;bc57
	call 04236h		;bc5a   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	xor a			;bc5d
	call hueco_de_mosaico		;bc5e   ; hueco_de_mosaico: en la pagina A: (0x30, 0xDC) 0x0A x 8 a 0 y una linea vertical en (0x30, 0xDB)
	ld a,001h		;bc61
	call hueco_de_mosaico		;bc63   ; hueco_de_mosaico: en la pagina A: (0x30, 0xDC) 0x0A x 8 a 0 y una linea vertical en (0x30, 0xDB)
	xor a			;bc66
	ld (ix+00fh),a		;bc67
	ld (0cb01h),a		;bc6a   ; guarda el dibujo de Snake (al darse la vuelta se le suma 1, 3 o 5 segun 0xCB00)
	ld (0cb00h),a		;bc6d   ; guarda el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	ld (0cb16h),a		;bc70   ; guarda 1 mientras Snake se da la vuelta
	inc a			;bc73
	ld (0cb14h),a		;bc74   ; guarda el dibujo del paso de andar (0, 1, 2, 1: p02:9888)
	call 05dd3h		;bc77   ; p00:5DD3
	call 07ab0h		;bc7a   ; quita los dos mosaicos de quien habla
	ld a,001h		;bc7d
	call 07ab0h		;bc7f   ; a_p03_b866: p03:B866 con el banco 3 en 0xA000
	call 07a1fh		;bc82   ; la paleta de la sala y la pagina en negro
	call 0444fh		;bc85   ; borra_pantalla_negro: 0xC0 x 0xC0 puntos a 0 en la pagina de dibujar
	ld de,06060h		;bc88   ; el barrido desde (0x60, 0x60)
	call 079d9h		;bc8b   ; a_p03_b67d: p03:B67D con el banco 3 en 0xA000
	call 045c5h		;bc8e   ; enciende_pantalla: R#1 con el bit 6 (BL) a uno, desde la copia 0xF3E0
	ld hl,0dc70h		;bc91   ; los sprites 28-31 fuera
	ld bc,0000fh		;bc94
	ld a,0e0h		;bc97
	call 04237h		;bc99   ; llena_bloque: pone A en BC + 1 bytes desde HL
	jp paso_siguiente_g		;bc9c   ; paso_siguiente_g: el paso siguiente
hueco_de_mosaico:		; en la pagina A: (0x30, 0xDC) 0x0A x 8 a 0 y una linea vertical en (0x30, 0xDB)
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
d8aa_paso_11:		; al acabar el barrido: Snake y el actor en Y = 0x68 (Snake en X = 0x70 mirando a la izquierda, el actor en 0x50), 0xD8AA = 1 y los sprites limpios
	call 079e1h		;bcb5   ; a_p03_b6c8: p03:B6C8 con el banco 3 en 0xA000
	ld a,(0e270h)		;bcb8   ; lee el barrido: 1 por pasos, 2 de 4 en 4 (0 nada)
	and a			;bcbb
	ret nz			;bcbc
	ld a,068h		;bcbd
	ld (0cb03h),a		;bcbf   ; guarda la Y de Snake
	ld (ix+003h),a		;bcc2   ; guarda la Y del actor
	ld a,070h		;bcc5
	ld (0cb05h),a		;bcc7   ; guarda la X de Snake
	ld a,003h		;bcca
	ld (0cb0eh),a		;bccc   ; guarda la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ld (ix+005h),050h		;bccf   ; la X del actor = 0x50
	ld (ix+00eh),010h		;bcd3   ; la espera del actor = 0x10
	ld a,001h		;bcd7
	ld (0d8aah),a		;bcd9
	call 045d7h		;bcdc   ; esconde_sprites_vram: llena con 0xE0 128 bytes de la VRAM en 0xF600 y otros 128 en 0xF200
	call 04266h		;bcdf   ; esconde_sprites_ram: llena 0xDC00-0xDC7F con 0xE0
	call 04609h		;bce2   ; enciende_sprites: R#8 con el bit 1 (SPD) a cero, desde la copia 0xFFE7
	jp paso_siguiente_g		;bce5   ; paso_siguiente_g: el paso siguiente
d8aa_paso_12:		; al acabar la espera, 0xD8AA = 0 y el paso 0x20
	dec (ix+00eh)		;bce8   ; baja la espera del actor
	ret nz			;bceb
	xor a			;bcec
	ld (0d8aah),a		;bced
	ld (ix+001h),020h		;bcf0   ; el paso del actor = 0x20
	ret			;bcf4
mosaico_de_13_5:		; en la zona 0x13 sala 5: con los juegos 6-7, el mosaico de p12:7435 en (0x18, 0x84) y, con 0xD821 >= 0x0F, el de la ficha 0xD820
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
	call 0741bh		;bd10   ; pieza_b_x_c: B x C caracteres de HL en (E, D), de 8 en 8
	ld a,(0d821h)		;bd13
	cp 00fh		;bd16
	push ix		;bd18
	ld ix,0d820h		;bd1a
	call nc,mosaico_de_la_ficha		;bd1e   ; mosaico_de_la_ficha: el mosaico de p12:743D (2 x 4) en la X - 16, la Y - 16 de la ficha de IX
	pop ix		;bd21
	jp 0413fh		;bd23   ; bancos_1_4_5: pone el 1 en 0x6000, el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
mosaico_de_la_ficha:		; el mosaico de p12:743D (2 x 4) en la X - 16, la Y - 16 de la ficha de IX
	ld a,(ix+005h)		;bd26   ; lee la X de la ficha de 0xD800
	sub 010h		;bd29
	ld d,a			;bd2b
	ld a,(ix+003h)		;bd2c   ; lee la Y de la ficha de 0xD800
	sub 010h		;bd2f
	ld e,a			;bd31
	ld hl,0743dh		;bd32
	ld bc,00402h		;bd35
	jp 0741eh		;bd38   ; fila_de_pieza:
sprites_hasta_paso_0f:		; hasta el paso 0x0F, sus sprites; desde el, fuera
	ld a,(ix+001h)		;bd3b   ; lee el paso del actor
	cp 00fh		;bd3e
	jp nc,08728h		;bd40   ; esconde_sprites_10_13: los sprites 10-13 fuera
	jp 08739h		;bd43   ; sprites_de_la_ficha: los sprites 10-13 fuera y, si la ficha de IX esta en esta sala, sus sprites y colores
actor_de_la_sala_5:		; en la sala 5, sus pasos (p05:BD58)
	ld a,(0ca4bh)		;bd46   ; lee la sala de la zona
	cp 005h		;bd49
	ret nz			;bd4b
	ld a,(ix+001h)		;bd4c   ; lee el paso del actor
	ld hl,0bd58h		;bd4f
	call 0424eh		;bd52   ; salta_por_tabla: salta a la palabra A de la tabla de HL
	jp 08082h		;bd55   ; llama_ba36: p14:BA36 con el byte 0x0C del actor

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


sala_5_paso_0:		; 0xE070 = 0xD500 = 0xD510 = 0, 0xCB3C = 1, el bit 3 de 0xD7D8, 0x10 cuadros, el dibujo 4 y la musica de p01:6BB8 en 0xB4 cuadros
	xor a			;bd84
	ld (0e070h),a		;bd85   ; guarda 2 fichas de 8 bytes [activa][paso][Y][X][..] de p10:A61B (se abren al acercarse Snake, p10:A4F1)
	ld (0d500h),a		;bd88   ; guarda 8 fichas de 16 bytes [activa][..][Y][X][..][..][..][alto][ancho * 2] (p07:BC95)
	ld (0d510h),a		;bd8b
	inc a			;bd8e
	ld (0cb3ch),a		;bd8f
	ld hl,0d7d8h		;bd92
	set 3,(hl)		;bd95
	ld (ix+00eh),010h		;bd97   ; la espera del actor = 0x10
	ld (ix+00dh),004h		;bd9b   ; el dibujo del actor (bit 0: el paso) = 0x04
	ld hl,06bb8h		;bd9f
	call 07c85h		;bda2   ; pide_musica_hl: la musica de la rutina HL: si no es la pendiente, pendiente dentro de 0x78 cuadros
	ld a,0b4h		;bda5
	ld (0ca18h),a		;bda7   ; guarda la espera hasta poner la musica pendiente
	jr paso_siguiente_h		;bdaa
sala_5_paso_1:		; al acabar la espera, 9 cuadros y el paso siguiente
	dec (ix+00eh)		;bdac   ; baja la espera del actor
	ret nz			;bdaf
	ld (ix+00eh),009h		;bdb0   ; la espera del actor = 0x09
	ld (ix+00fh),000h		;bdb4
	jr paso_siguiente_h		;bdb8
sala_5_paso_2:		; cada 8 cuadros el dibujo siguiente; al acabar, el mensaje 0x1460
	dec (ix+00eh)		;bdba   ; baja la espera del actor
	jr z,L_BDD0		;bdbd
	ld a,(ix+00eh)		;bdbf   ; lee la espera del actor
	and 007h		;bdc2
	ret nz			;bdc4
	inc (ix+00fh)		;bdc5
	ld a,(ix+00fh)		;bdc8
	add a,a			;bdcb
	ld (ix+00dh),a		;bdcc   ; guarda el dibujo del actor (bit 0: el paso)
	ret			;bdcf
L_BDD0:
	ld d,014h		;bdd0
mensaje_d60:
	ld e,060h		;bdd2
mensaje_de_y_paso:
	call 061ceh		;bdd4   ; mensaje_de_50: 0xD8A8 = 1: la ventana estrecha
	jr paso_siguiente_h		;bdd7
sala_5_paso_3:		; al acabar el mensaje: Snake en el estado 0x17, 0xD8AB = 1, el dibujo 2, y Snake hacia la derecha
	call 06247h		;bdd9   ; mensaje_cada_cuadro_bancos_5:
	ret nz			;bddc
	call 079c7h		;bddd   ; llama_7a27_1: p01:7A27 con A = 1 y los bancos 4 y 5
	ld a,017h		;bde0
	ld (0cb00h),a		;bde2   ; guarda el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	xor a			;bde5
	ld (0cb3ch),a		;bde6
	inc a			;bde9
	ld (0d8abh),a		;bdea
	inc a			;bded
	ld (ix+00dh),a		;bdee   ; guarda el dibujo del actor (bit 0: el paso)
	call velocidad_del_dibujo		;bdf1   ; velocidad_del_dibujo: la velocidad de la direccion del dibujo (p05:A7AD por el tipo)
	ld a,004h		;bdf4
snake_hacia_a:		; la direccion de Snake = A y el paso siguiente
	ld (0cb0eh),a		;bdf6   ; guarda la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
paso_siguiente_h:
	inc (ix+001h)		;bdf9   ; sube el paso del actor
	ret			;bdfc
sala_5_paso_4:		; cuando Snake llega a X = 0x98, hacia arriba
	call anda_d8ab		;bdfd   ; anda_d8ab: con 0xD8AB = 1 baja hasta Y = 0x50 y gira a la izquierda; con 2, hasta X = 0x70, y para
	ld a,(0cb05h)		;be00   ; lee la X de Snake
	cp 098h		;be03
	ret c			;be05
	ld a,001h		;be06
	jr snake_hacia_a		;be08
sala_5_paso_5:		; cuando llega a Y = 0x38, 0xCB42 = 1 y hacia la izquierda
	call anda_d8ab		;be0a   ; anda_d8ab: con 0xD8AB = 1 baja hasta Y = 0x50 y gira a la izquierda; con 2, hasta X = 0x70, y para
	ld a,(0cb03h)		;be0d   ; lee la Y de Snake
	cp 038h		;be10
	ret nc			;be12
	ld a,001h		;be13
	ld (0cb42h),a		;be15
	ld a,003h		;be18
	jr snake_hacia_a		;be1a
sala_5_paso_6:		; 0xCB3C = 1 y el mensaje 0x1560
	call anda_d8ab		;be1c   ; anda_d8ab: con 0xD8AB = 1 baja hasta Y = 0x50 y gira a la izquierda; con 2, hasta X = 0x70, y para
	ld a,001h		;be1f
	ld (0cb3ch),a		;be21
	ld d,015h		;be24
	jr mensaje_d60		;be26
sala_5_paso_7:		; al acabar el mensaje, 0x5A cuadros y la orden 0xF6
	call anda_d8ab		;be28   ; anda_d8ab: con 0xD8AB = 1 baja hasta Y = 0x50 y gira a la izquierda; con 2, hasta X = 0x70, y para
	call 06247h		;be2b   ; mensaje_cada_cuadro_bancos_5:
	ret nz			;be2e
	call 079c7h		;be2f   ; llama_7a27_1: p01:7A27 con A = 1 y los bancos 4 y 5
	ld (ix+00eh),05ah		;be32   ; la espera del actor = 0x5A
	call 06be8h		;be36   ; orden_sonido_f6: la orden 0xF6 al sonido
	jr paso_siguiente_h		;be39
sala_5_paso_8:		; al acabar la espera: p03:B11F con 0, los sonidos 5 y 0x81 y 0x20 cuadros
	dec (ix+00eh)		;be3b   ; baja la espera del actor
	ret nz			;be3e
	xor a			;be3f
	call 079e9h		;be40   ; a_p03_b11f: p03:B11F con el banco 3 en 0xA000
	call 06b12h		;be43   ; sonido_05: pide el sonido 0x05
	call 06b95h		;be46   ; sonido_81: pide el sonido 0x81 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld (ix+00eh),020h		;be49   ; la espera del actor = 0x20
	jr paso_siguiente_h		;be4d
sala_5_paso_9:		; p03:B132; al acabar, p03:B19A, 0xE25A = 1 y la conversacion 2
	call 079f1h		;be4f   ; a_p03_b132: p03:B132 con el banco 3 en 0xA000
	dec (ix+00eh)		;be52   ; baja la espera del actor
	ret nz			;be55
	call 079fah		;be56   ; a_p03_b19a: p03:B19A con el banco 3 en 0xA000
	ld a,001h		;be59
	ld (0e25ah),a		;be5b
	inc a			;be5e
	call 06250h		;be5f   ; conversacion_de_a: la conversacion de p48:8010 (A = 0), p48:8012 (1) o p48:8014 (2)
	jr paso_siguiente_h		;be62
sala_5_paso_a:		; el sonido 0x84 y el mensaje 0x1660
	call 06bcch		;be64   ; sonido_84: pide el sonido 0x84 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld d,016h		;be67
	jp mensaje_d60		;be69   ; mensaje_d60:
sala_5_paso_b:		; al acabar el mensaje: 0x20 cuadros, Snake en el estado 0x17 hacia abajo, el actor hacia la izquierda, el sonido 5 y su musica
	call 06247h		;be6c   ; mensaje_cada_cuadro_bancos_5:
	ret nz			;be6f
	call 079c7h		;be70   ; llama_7a27_1: p01:7A27 con A = 1 y los bancos 4 y 5
	ld (ix+00eh),020h		;be73   ; la espera del actor = 0x20
	ld a,017h		;be77
	ld (0cb00h),a		;be79   ; guarda el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	xor a			;be7c
	ld (0cb3ch),a		;be7d
	ld (ix+00dh),006h		;be80   ; el dibujo del actor (bit 0: el paso) = 0x06
	ld a,003h		;be84
	ld b,a			;be86
	call velocidad_de_tipo		;be87   ; velocidad_de_tipo: la velocidad del tipo A (p05:A7AD) en la direccion B (p05:A79C), y el byte 0x0C = 3
	ld a,002h		;be8a
	call snake_hacia_a		;be8c   ; snake_hacia_a: la direccion de Snake = A y el paso siguiente
	call 06b12h		;be8f   ; sonido_05: pide el sonido 0x05
	jp 08685h		;be92   ; por_el_tipo_8698: por el byte del tipo en p04:8698 (p04:8691)
anda_d8ab:		; con 0xD8AB = 1 baja hasta Y = 0x50 y gira a la izquierda; con 2, hasta X = 0x70, y para
	ld a,(0d8abh)		;be95
	and a			;be98
	ret z			;be99
	dec a			;be9a
	jr nz,L_BEB1		;be9b
	call 086deh		;be9d   ; cambia_paso_cada_2: el byte 0x11 uno mas; cada 2, el paso del dibujo
	ld a,(ix+003h)		;bea0   ; lee la Y del actor
	cp 050h		;bea3
	ret c			;bea5
	ld hl,0d8abh		;bea6
	inc (hl)			;bea9
	ld (ix+00dh),004h		;beaa   ; el dibujo del actor (bit 0: el paso) = 0x04
	jp velocidad_del_dibujo		;beae   ; velocidad_del_dibujo: la velocidad de la direccion del dibujo (p05:A7AD por el tipo)
L_BEB1:
	call 086deh		;beb1   ; cambia_paso_cada_2: el byte 0x11 uno mas; cada 2, el paso del dibujo
	ld a,(ix+005h)		;beb4   ; lee la X del actor
	cp 070h		;beb7
	ret nc			;beb9
	ld (ix+00dh),006h		;beba   ; el dibujo del actor (bit 0: el paso) = 0x06
	xor a			;bebe
	ld (ix+00ch),a		;bebf
	ld (0d8abh),a		;bec2
	ret			;bec5
sala_5_junto_a_snake:		; a menos de 5 en X de Snake: 0xCB3C = 0, 0xCB42 = 1, el byte 0x16 = 1, p05:BEE7 y el paso siguiente
	ld a,(0cb05h)		;bec6   ; lee la X de Snake
	sub (ix+005h)		;bec9   ; le resta la X del actor
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
	call quita_cb21_0a		;bee1   ; quita_cb21_0a: con 0xCB21 = 0x0A u 0x0B: lo quita, el estado de 0xCB35 y el hueco de 0xD8A4 (0x18 x 0x10) al color 9
	jp paso_siguiente_h		;bee4   ; paso_siguiente_h:
quita_cb21_0a:		; con 0xCB21 = 0x0A u 0x0B: lo quita, el estado de 0xCB35 y el hueco de 0xD8A4 (0x18 x 0x10) al color 9
	ld hl,0cb21h		;bee7   ; apunta a lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	ld a,(hl)			;beea
	sub 00ah		;beeb
	cp 002h		;beed
	ret nc			;beef
	ld (hl),000h		;bef0
	ld a,(0cb35h)		;bef2
	and 001h		;bef5
	ld (0cb00h),a		;bef7   ; guarda el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	ld (0cb01h),a		;befa   ; guarda el dibujo de Snake (al darse la vuelta se le suma 1, 3 o 5 segun 0xCB00)
	ld hl,0d8a4h		;befd
	ld bc,01810h		;bf00
	ld a,099h		;bf03
	jp 046f2h		;bf05   ; borra_bloque_pagina: p00:46FF en la pagina en la que se dibuja (0xCA42)
sigue_a_snake:		; cada 64 cuadros (con vida) el aviso 9; el actor en el sitio de Snake mas lo de su direccion (p05:BF37), con el dibujo 8 + la direccion
	ld a,(ix+011h)		;bf08
	inc (ix+011h)		;bf0b
	and 03fh		;bf0e
	jr nz,L_BF19		;bf10
	ld a,(0ca53h)		;bf12   ; lee la vida de Snake (lo largo de la barra)
	and a			;bf15
	call nz,09d20h		;bf16   ; aviso_09_18:
L_BF19:
	ld a,(0cb0eh)		;bf19   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ld b,a			;bf1c
	ld hl,0bf37h		;bf1d
	call 043f6h		;bf20   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ex de,hl			;bf23
	call 08079h		;bf24   ; y_x_de_snake_en_hl: L = la Y, H = la X de Snake
	ld a,e			;bf27
	add a,l			;bf28
	ld (ix+003h),a		;bf29   ; guarda la Y del actor
	ld a,d			;bf2c
	add a,h			;bf2d
	ld (ix+005h),a		;bf2e   ; guarda la X del actor
	ld a,b			;bf31
	dec a			;bf32
	add a,008h		;bf33
	ld (ix+00dh),a		;bf35   ; guarda el dibujo del actor (bit 0: el paso)
	ret			;bf38

; ----------------------------------------------------------------------
; DATOS sin identificar  0xbf39..0xbf41  (8 bytes)
DATA_BF39:
	defb 000h,0fah,0fch,000h,0feh,003h,0feh,0f6h	; bf39  ........

; ======================================================================
; CODIGO 0xbf41..0xc000  (191 bytes)
; ======================================================================


paso_si_en_sala:		; en esta sala, el paso siguiente
	call 08100h		;bf41   ; en_esta_sala: Z si el actor esta en la sala de ahora (fila y columna)
	ret nz			;bf44
	jp paso_siguiente_h		;bf45   ; paso_siguiente_h:
sala_5_suelta:		; sin eje, 0x18 cuadros, 0xD500 = 2, 0xD510 = 0x0D, el bit 7 de 0xD7D6 y el paso siguiente
	xor a			;bf48
	ld (ix+00ch),a		;bf49
	ld (ix+016h),a		;bf4c
	ld (ix+00eh),018h		;bf4f   ; la espera del actor = 0x18
	ld a,002h		;bf53
	ld (0d500h),a		;bf55   ; guarda 8 fichas de 16 bytes [activa][..][Y][X][..][..][..][alto][ancho * 2] (p07:BC95)
	ld a,00dh		;bf58
	ld (0d510h),a		;bf5a
	ld hl,0d7d6h		;bf5d
	set 7,(hl)		;bf60
	jp paso_siguiente_h		;bf62   ; paso_siguiente_h:
mosaico_en_la_otra:		; con los juegos 6-7, el mosaico de la ficha en la otra pagina y 0xD88B = 0xFF
	ld hl,00706h		;bf65
	ld (0ca4ch),hl		;bf68   ; guarda los 4 bits altos del byte de la sala (p56:BD28) y el byte siguiente (16 bits)
	ld hl,0ca42h		;bf6b   ; apunta a la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	ld a,(hl)			;bf6e
	push hl			;bf6f
	push af			;bf70
	xor 001h		;bf71
	ld (hl),a			;bf73
	call 041ddh		;bf74   ; bancos_12: pone el 12 en 0x6000 (con su copia en 0xC381-0xC383)
	call mosaico_de_la_ficha		;bf77   ; mosaico_de_la_ficha: el mosaico de p12:743D (2 x 4) en la X - 16, la Y - 16 de la ficha de IX
	call 0413fh		;bf7a   ; bancos_1_4_5: pone el 1 en 0x6000, el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	pop af			;bf7d
	pop hl			;bf7e
	ld (hl),a			;bf7f
	ld a,0ffh		;bf80
	ld (0d88bh),a		;bf82
	ret			;bf85
sala_5_fin:		; al acabar la espera: el sonido 0x93, la musica de la zona, sin sprites y el mosaico
	dec (ix+00eh)		;bf86   ; baja la espera del actor
	ret nz			;bf89
	call 06c1bh		;bf8a   ; sonido_93: pide el sonido 0x93 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	call 07a88h		;bf8d   ; rutina_de_fase_b_1_4_5: rutina_de_fase y deja los bancos 1, 4 y 5
	call 07c85h		;bf90   ; pide_musica_hl: la musica de la rutina HL: si no es la pendiente, pendiente dentro de 0x78 cuadros
	call 08728h		;bf93   ; esconde_sprites_10_13: los sprites 10-13 fuera
	call mosaico_en_la_otra		;bf96   ; mosaico_en_la_otra: con los juegos 6-7, el mosaico de la ficha en la otra pagina y 0xD88B = 0xFF
	jp paso_siguiente_h		;bf99   ; paso_siguiente_h:
sala_5_snake_baja:		; 0xE070 = 0; con el bit 5 de 0xD7D9, el bit 4, Snake hacia abajo en el estado 0x17
	xor a			;bf9c
	ld (0e070h),a		;bf9d   ; guarda 2 fichas de 8 bytes [activa][paso][Y][X][..] de p10:A61B (se abren al acercarse Snake, p10:A4F1)
	ld a,(0d7d9h)		;bfa0
	and 020h		;bfa3
	ret z			;bfa5
	ld hl,0d7d9h		;bfa6
	set 4,(hl)		;bfa9
	ld a,002h		;bfab
	ld (0cb0eh),a		;bfad   ; guarda la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ld a,017h		;bfb0
	ld (0cb00h),a		;bfb2   ; guarda el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	jp paso_siguiente_h		;bfb5   ; paso_siguiente_h:
sala_5_snake_llega:		; con Snake desde Y = 0x80: 0xCB3C = 0xCB42 = 1, Snake hacia la derecha y la musica de p01:6BB0
	ld a,(0cb03h)		;bfb8   ; lee la Y de Snake
	cp 080h		;bfbb
	ret c			;bfbd
	ld a,001h		;bfbe
	ld (0cb3ch),a		;bfc0
	ld (0cb42h),a		;bfc3
	ld a,004h		;bfc6
	ld (0cb0eh),a		;bfc8   ; guarda la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ld hl,06bb0h		;bfcb
	call 07c85h		;bfce   ; pide_musica_hl: la musica de la rutina HL: si no es la pendiente, pendiente dentro de 0x78 cuadros
	jp paso_siguiente_h		;bfd1   ; paso_siguiente_h:
mensaje_1718:
	ld de,01718h		;bfd4
	jp mensaje_de_y_paso		;bfd7   ; mensaje_de_y_paso:
sala_5_tras_mensaje:		; al acabar el mensaje, la orden 0xF6 y 0x20 cuadros
	call 06247h		;bfda   ; mensaje_cada_cuadro_bancos_5:
	ret nz			;bfdd
	call 079c7h		;bfde   ; llama_7a27_1: p01:7A27 con A = 1 y los bancos 4 y 5
	call 06be8h		;bfe1   ; orden_sonido_f6: la orden 0xF6 al sonido
	ld (ix+00eh),020h		;bfe4   ; la espera del actor = 0x20
	jp paso_siguiente_h		;bfe8   ; paso_siguiente_h:
sala_5_espera_y_sonido:		; tras la espera, el sonido 5; despues 0xE070 = 1 y su bandera de 0xD87F con p06:B14E
	ld a,(ix+00eh)		;bfeb   ; lee la espera del actor
	and a			;bfee
	jr z,L_BFF8		;bfef
	dec (ix+00eh)		;bff1   ; baja la espera del actor
	ret nz			;bff4
	jp 06b12h		;bff5   ; sonido_05: pide el sonido 0x05
L_BFF8:
	ld a,001h		;bff8
	ld (0e070h),a		;bffa   ; guarda 2 fichas de 8 bytes [activa][paso][Y][X][..] de p10:A61B (se abren al acercarse Snake, p10:A4F1)
	jp 08c65h		;bffd   ; bandera_y_b14e:
