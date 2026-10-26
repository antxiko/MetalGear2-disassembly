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


cb21_9_sube:		; con 0xCB21 = 9 en la zona 0x0D sala 5, con 0xE1D5 y 0xCA61 = 1, Snake por encima de Y = 0x28 y arriba pulsado: sin alerta, el sonido 0x8B, a la zona 0x0A (fila 1, columna 6), fuera el bit 2 de 0xD7DD, 0xCB39 = 0, la musica de p01:6B45 al cuadro siguiente, Snake en el estado 4, 0xD4EA = 0, los sprites 0-3 fuera, la ficha 0xE1D0 (p09:A061) y las rachas de p41:BA0F
	ld a,(0cb21h)		;a000   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	cp 009h		;a003   ; solo con 9 en 0xCB21...
	ret nz			;a005
	ld a,(0ca4ah)		;a006   ; lee la zona
	cp 00dh		;a009   ; ...en la zona 0x0D...
	ret nz			;a00b
	ld a,(0ca4bh)		;a00c   ; lee la sala de la zona
	cp 005h		;a00f   ; ...sala 5...
	ret nz			;a011
	ld a,(0e1d5h)		;a012
	or a			;a015   ; ...con 0xE1D5...
	ret z			;a016
	ld a,(0ca61h)		;a017   ; lee 1-4: elige las rachas de p01:6F27 y la caja de p07:B889 (al azar cada 0xF0 cuadros en la mayoria de salas, p10:A0BB)
	dec a			;a01a
	ret nz			;a01b   ; ...y 0xCA61 = 1
	ld a,(0cb03h)		;a01c   ; lee la Y de Snake
	cp 028h		;a01f
	ret nc			;a021   ; desde Y = 0x28, nada
	ld a,(0ca08h)		;a022   ; lee el mando: joystick y teclado juntos (bits 0-3 las direcciones, 4-5 los disparos)
	and 001h		;a025
	ret z			;a027   ; sin arriba, nada
	call 07cb5h		;a028   ; sin alerta
	call 06cc6h		;a02b   ; el sonido 0x8B
	ld hl,0ca50h		;a02e   ; fila 1...
	ld (hl),001h		;a031
	inc hl			;a033
	ld (hl),006h		;a034   ; ...columna 6
	ld hl,0d7ddh		;a036
	res 2,(hl)		;a039   ; fuera el bit 2 de 0xD7DD
	xor a			;a03b
	ld (0cb39h),a		;a03c   ; 0xCB39 = 0
	ld a,00ah		;a03f   ; a la zona 0x0A
	call 08e11h		;a041   ; cambia_de_zona_b_1_2_9: cambia_de_zona y deja los bancos 1, 2 y 9
	ld a,001h		;a044   ; la musica al cuadro siguiente...
	ld (0ca18h),a		;a046   ; guarda la espera hasta poner la musica pendiente
	ld hl,06b45h		;a049   ; ...la de p01:6B45
	ld (0ca19h),hl		;a04c   ; guarda la musica pendiente: la rutina que la pide (16 bits)
	ld a,004h		;a04f   ; Snake en el estado 4
	ld (0cb00h),a		;a051   ; guarda el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	xor a			;a054
	ld (0d4eah),a		;a055   ; 0xD4EA = 0
	call sin_sprites_0_3		;a058   ; sin sprites
	call ficha_e1d0		;a05b   ; la ficha 0xE1D0
	jp 06f56h		;a05e   ; rachas_ba0f: las rachas de p41:BA0F
ficha_e1d0:		; 0xE1D0 = 1, 0xE1D1 = 0 (el paso), 0xE1D2 = 0xC4, 0xE1D3 = 0x40
	ld hl,0e1d0h		;a061   ; apunta a 1 con la ficha de p09:A061 en marcha (zona 0x0A; 0xE1D1 paso, 0xE1D2-0xE1D3 su sitio)
	ld (hl),001h		;a064
	inc hl			;a066
	ld (hl),000h		;a067
	inc hl			;a069
	ld (hl),0c4h		;a06a
	inc hl			;a06c
	ld (hl),040h		;a06d
nada_p09:
	ret			;a06f
sin_sprites_0_3:		; los 4 primeros sprites (0xDC00-0xDC0F) a 0xE0
	ld hl,0dc00h		;a070   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	ld a,0e0h		;a073
	ld bc,0000fh		;a075
	jp 04237h		;a078   ; llena_bloque: pone A en BC + 1 bytes desde HL
e1d0_cada_cuadro:		; en la zona 0x0A con 0xE1D0: su paso (p09:A093) y p11:BF0F
	ld a,(0ca4ah)		;a07b   ; lee la zona
	cp 00ah		;a07e
	ret nz			;a080   ; solo en la zona 0x0A
	ld a,(0e1d0h)		;a081   ; lee 1 con la ficha de p09:A061 en marcha (zona 0x0A; 0xE1D1 paso, 0xE1D2-0xE1D3 su sitio)
	or a			;a084
	ret z			;a085   ; sin 0xE1D0, nada
	call e1d0_paso		;a086   ; e1d0_paso: 0xD4EA uno mas y el paso de 0xE1D1 (p09:A09D)
	ld a,(0e1d0h)		;a089   ; lee 1 con la ficha de p09:A061 en marcha (zona 0x0A; 0xE1D1 paso, 0xE1D2-0xE1D3 su sitio)
	or a			;a08c
	call nz,nada_p09		;a08d   ; nada_p09:
	jp 08eaeh		;a090   ; a_p11_bf0f: p11:BF0F con el banco 11 en 0xA000
e1d0_paso:		; 0xD4EA uno mas y el paso de 0xE1D1 (p09:A09D)
	ld hl,0d4eah		;a093   ; apunta a la cuenta de cuadros de la ficha 0xE1D0
	inc (hl)			;a096
	ld a,(0e1d1h)		;a097   ; lee el paso de la ficha 0xE1D0 (p09:A09D)
	call 0424dh		;a09a   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_A09D: 4 destinos del despachador p00:424D (call en p09:A09A, el
;   indice en A): A0A5, A0F2, A0FE, A110; lo leen p09:A09A (8 bytes)
;   0xa09d..0xa0a5  (8 bytes)
DATA_tabla_A09D:
	defw 0a0a5h,0a0f2h,0a0feh,0a110h	; a09d  -> e1d0_paso_0 e1d0_paso_1 e1d0_paso_2 e1d0_paso_3

; ======================================================================
; CODIGO 0xa0a5..0xa5d4  (1327 bytes)
; ======================================================================


e1d0_paso_0:		; en la sala 7, el paso siguiente; si no, 0xE1D3 sube y baja 4 (p09:A0C6) y 0xE1D2 baja 3; con 0xE1D2 en 0xCC-0xD0, a 0xC8 y la salida 1
	ld a,(0ca4bh)		;a0a5   ; lee la sala de la zona
	cp 007h		;a0a8
	jr z,e1d1_siguiente		;a0aa   ; la sala 7: el paso siguiente
	call e1d3_arriba_abajo		;a0ac   ; 0xE1D3 arriba y abajo
	call e1d2_menos_3		;a0af   ; 0xE1D2 baja 3
	ld a,(hl)			;a0b2
	cp 0cch		;a0b3   ; en 0xCC-0xD0...
	ret c			;a0b5
	cp 0d1h		;a0b6
	ret nc			;a0b8
	ld (hl),0c8h		;a0b9   ; ...a 0xC8...
	ld a,001h		;a0bb   ; ...y sale por arriba
	ld (0ca41h),a		;a0bd   ; guarda la salida de la sala (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ret			;a0c0
e1d1_siguiente:		; el paso siguiente de 0xE1D1
	ld hl,0e1d1h		;a0c1   ; apunta a el paso de la ficha 0xE1D0 (p09:A09D)
	inc (hl)			;a0c4
	ret			;a0c5
e1d3_arriba_abajo:		; 0xE1D3 + 4 o - 4 segun el bit 5 de 0xD4EA (cada 0x20 cuadros), en los cuadros pares
	ld hl,0e1d3h		;a0c6   ; apunta a la Y de la ficha 0xE1D0
	ld a,(0d4eah)		;a0c9   ; lee la cuenta de cuadros de la ficha 0xE1D0
	rla			;a0cc
	rla			;a0cd
	rla			;a0ce
	jr c,e1d3_menos_4		;a0cf   ; el bit 5...
	ld b,004h		;a0d1   ; ...a cero, + 4
	jr suma_si_par		;a0d3
e1d3_menos_4:
	ld b,0fch		;a0d5
	jr suma_si_par		;a0d7
e1d3_menos_2:		; 0xE1D3 - 2
	ld b,0feh		;a0d9
	ld hl,0e1d3h		;a0db   ; apunta a la Y de la ficha 0xE1D0
	jr suma_si_par		;a0de
e1d2_mas_3:		; 0xE1D2 + 3
	ld b,003h		;a0e0
	jr suma_e1d2		;a0e2
e1d2_menos_3:		; 0xE1D2 - 3
	ld b,0fdh		;a0e4
suma_e1d2:
	ld hl,0e1d2h		;a0e6   ; apunta a la X de la ficha 0xE1D0
suma_si_par:		; en los cuadros pares (de 0xD4EA), (HL) + B
	ld a,(0d4eah)		;a0e9   ; lee la cuenta de cuadros de la ficha 0xE1D0
	rra			;a0ec
	ret c			;a0ed
	ld a,(hl)			;a0ee
	add a,b			;a0ef
	ld (hl),a			;a0f0
	ret			;a0f1
e1d0_paso_1:		; 0xE1D3 arriba y abajo, 0xE1D2 baja 3; por debajo de 0x78, el paso siguiente
	call e1d3_arriba_abajo		;a0f2   ; e1d3_arriba_abajo: 0xE1D3 + 4 o - 4 segun el bit 5 de 0xD4EA (cada 0x20 cuadros), en los cuadros pares
	call e1d2_menos_3		;a0f5   ; e1d2_menos_3: 0xE1D2 - 3
	ld a,(hl)			;a0f8
	cp 078h		;a0f9   ; desde 0x78, sigue
	ret nc			;a0fb
	jr e1d1_siguiente		;a0fc
e1d0_paso_2:		; 0xE1D2 sube 3 y 0xE1D3 baja 2; desde 0xC0, el paso siguiente y el sonido 0x5B
	call e1d2_mas_3		;a0fe   ; e1d2_mas_3: 0xE1D2 + 3
	call e1d3_menos_2		;a101   ; e1d3_menos_2: 0xE1D3 - 2
	ld a,(0e1d2h)		;a104   ; lee la X de la ficha 0xE1D0
	cp 0c0h		;a107   ; por debajo de 0xC0, sigue
	ret c			;a109
	call e1d1_siguiente		;a10a   ; e1d1_siguiente: el paso siguiente de 0xE1D1
	jp 06b5dh		;a10d   ; sonido_5b: pide el sonido 0x5B
e1d0_paso_3:		; con 0xC696: a cero, 0xD658-0xD65A y 0xE1D0 a cero, Snake en Y = 0xFF en el estado 0x15 hacia arriba, los bits 2 de 0xD7D5 y 0xD7D6, fuera el 3 de 0xD7DB y el 6 de 0xD7E0, el 2 de 0xD7DD, los sprites de la sala, las rachas, p02:8C42 con 0xD8A4, la fase 7 y el sonido 0x7D
	ld hl,0c696h		;a110
	ld a,(hl)			;a113
	or a			;a114
	ret z			;a115   ; sin 0xC696, nada
	xor a			;a116
	ld (hl),a			;a117
	ld hl,0d658h		;a118   ; 0xD658-0xD65A a cero
	ld (hl),a			;a11b
	inc hl			;a11c
	ld (hl),a			;a11d
	inc hl			;a11e
	ld (hl),a			;a11f
	ld hl,0e1d0h		;a120   ; 0xE1D0 = 0
	ld (hl),a			;a123
	ld hl,0cb02h		;a124   ; Snake en Y = 0xFF
	ld (hl),a			;a127
	inc hl			;a128
	ld (hl),0ffh		;a129
	ld hl,0cb00h		;a12b   ; el estado 0x15
	ld (hl),015h		;a12e
	ld hl,0cb0dh		;a130   ; hacia arriba
	ld a,001h		;a133
	ld (hl),a			;a135
	inc hl			;a136
	ld (hl),a			;a137
	ld hl,0d7d5h		;a138   ; los bits 2 de 0xD7D5...
	set 2,(hl)		;a13b
	inc hl			;a13d
	set 2,(hl)		;a13e   ; ...y 0xD7D6
	ld hl,0d7dbh		;a140
	res 3,(hl)		;a143   ; fuera el bit 3 de 0xD7DB
	ld hl,0d7e0h		;a145
	res 6,(hl)		;a148   ; fuera el 6 de 0xD7E0
	ld hl,0d7ddh		;a14a
	set 2,(hl)		;a14d   ; el bit 2 de 0xD7DD
	call 04e1ch		;a14f   ; los sprites de la sala
	call 085a4h		;a152   ; las rachas
	ld hl,0d8a4h		;a155
	call 08c42h		;a158   ; p02:8C42 con 0xD8A4
	ld hl,0ca22h		;a15b   ; la fase 7
	ld (hl),007h		;a15e
	jp 06b85h		;a160   ; sonido_7d: pide el sonido 0x7D (de los que tienen la partitura en un banco de musica, p16:4CE3)
dfd8_cada_cuadro:		; sin 0xE040: p09:A258 y p09:A2EB; sin los bits 5-6 de 0xD7D3: con 0xDFD8 p09:A196, 0xDFD8 = 0 y, si p09:A434 da Z, la ficha 0xDFD8 en (0x60, 0x70) de 2 x 1 (p09:A4CD), las rachas de p01:864A y p03:B5B5
	ld a,(0e040h)		;a163   ; lee la escena en curso (1-9, 0 = ninguna; p09:A4A6, guiones en p09:A5D4)
	or a			;a166
	ret nz			;a167   ; con 0xE040, nada
	call e248_con_cb21_2		;a168   ; e248_con_cb21_2: con 0xCB21 = 2 y sin el bit 7 de 0xD7D5: la ficha 0xE248 libre y, en la sala especial 0x2A columna 8, en (0x60, 0x10) de 3 x 1 con su dibujo
	call e240_sala_18		;a16b   ; e240_sala_18: salvo con 0xCB21 = 2: en la sala especial 0x18 columna 8 sin el bit 1 de 0xD7D4, la ficha 0xE240 en (0x9D, 0x4D) de 2 x 1 y su dibujo
	ld a,(0d7d3h)		;a16e
	and 060h		;a171
	ret nz			;a173   ; con los bits 5-6 de 0xD7D3, nada mas
	ld a,(0dfd8h)		;a174
	or a			;a177
	call nz,rachas_9638_y_b34a		;a178   ; con 0xDFD8, p09:A196
	ld hl,0dfd8h		;a17b
	ld (hl),000h		;a17e   ; 0xDFD8 = 0
	call especial_26_sala_2		;a180   ; especial_26_sala_2: Z en la sala especial 0x26 sala 2
	ret nz			;a183   ; NZ: nada mas
	ld hl,0dfd8h		;a184   ; la ficha 0xDFD8...
	ld de,06070h		;a187   ; ...en (0x60, 0x70)...
	ld bc,00201h		;a18a   ; ...2 x 1
	call pon_ficha_c		;a18d   ; pon_ficha_c: la ficha de HL: [C][1][0][E][0][D][B][0]
	call 0864ah		;a190   ; rachas_b3a6:
	jp 08c5ah		;a193   ; a_p03_b5b5: p03:B5B5 con el banco 3 en 0xA000
rachas_9638_y_b34a:		; las rachas de p37:9638 y, con 0xCB21 = 1, las de p37:B34A
	call 06f72h		;a196   ; rachas_9638_bancos_9:
	ld a,(0cb21h)		;a199   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	dec a			;a19c
	jp z,0858dh		;a19d   ; rachas_b34a_bancos_9:
	ret			;a1a0
escenas_que_empiezan:		; sin escena (0xE040): las que pueden empezar en esta sala (p09:A27C, A2BC, A304, A353, A3B1, A3F2, A440, A47D); con el bit 4 de 0xD7D0 y sin el 5 de 0xD7D1, en la zona 0x11 sala 5, la cuenta de 0xCAD8; a cero, 0xCB75 al menos 1 y p04:92EB; y con 0xCB76 y nada lanzado por Snake, la escena 9 (Snake quieto, la bandera 0x0A, el sonido 5...)
	ld a,(0e040h)		;a1a1   ; lee la escena en curso (1-9, 0 = ninguna; p09:A4A6, guiones en p09:A5D4)
	or a			;a1a4
	ret nz			;a1a5   ; con escena, nada
	call escena_1		;a1a6   ; escena_1: sin el bit 7 de 0xD7D5, en la sala especial 0x2A columna 8: la bandera 0x28, fuera el bit 3 de 0xD7DE, la ficha 0xE248 en (0x60, 0x10) con su dibujo, Snake hacia abajo, la ventana estrecha, la escena 1 y la ventana segun Snake
	call escena_2		;a1a9   ; escena_2: sin el bit 6 de 0xD7D5, con dos detras (0xCAA0 = 2), en la zona 8 sala 0x0C: la bandera 0x29, Snake hacia arriba, la escena 2, la ventana estrecha y abajo
	call escena_3		;a1ac   ; escena_3: sin 0xD4F3, en la sala especial 0x18 columna 8 (sin el bit 1 de 0xD7D4), con Snake en Y 0x94-0xA3 y X 0x3C-0x64: 0xD4E4 = 0, la escena 3, la direccion contraria a la de Snake en 0xE246, 0xD4F3 = 1, la ventana en 0x4C, sin lo lanzado y p09:A571
	call escena_4		;a1af   ; escena_4: con el bit 6 de 0xD7D5 y sin el 4, en la zona 0x0A sala 4: las fichas 0xE240 en (0xBC, 0x64) y 0xE248 en (0xBC, 0x84) de 1 x 1, p12:6D78, Snake en (0xBC, 0x74) hacia arriba, la ventana estrecha, p12:7688, sus dibujos, la bandera 0x2B, la escena 4, la ventana arriba, sin lo lanzado y el sonido 7
	call escena_5		;a1b2   ; escena_5: con el bit 4 de 0xD7D5 y sin el 0 de 0xD7DA, en la zona 0x0A sala 4 con Snake por encima de Y = 0xA0 y en X 0x68-0x7F: la bandera 0x57, la escena 5, 0xE246 = 3, 0xCB5B = 0, sin lo lanzado y el sonido 4
	call escena_6		;a1b5   ; escena_6: sin los bits 5-6 de 0xD7D3, en la sala especial 0x26 sala 2 con Snake en Y 0x60-0x8F y X 0x50-0x6F: la bandera 0x1A, fuera el bit 3 de 0xD7E0, la escena 6, la direccion contraria en 0xDFDE, sin lo lanzado y la ventana en 0x4C
	call escena_7		;a1b8   ; escena_7: sin el bit 3 de 0xD7DA, en la zona 0x12 sala 0x0C con Snake por encima de Y = 0x91: 0xCB14 = 1, las rachas de p00:4E01 a 0xFC00, la ficha 0xDFD0 (Y = 0xBE, la X de Snake, 0, 1), la bandera 0x54, sin lo lanzado y la escena 7
	call escena_8		;a1bb   ; escena_8: sin salir y sin el bit 4 de 0xD7D0, en la zona 0x11 sala 5 con Snake por encima de Y = 0x9E: 0xCB14 = 1, la bandera 3 y la escena 8
	ld a,(0d7d0h)		;a1be   ; lee las banderas de la partida: la n en el bit 7 - n % 8 del byte n / 8 (p03:B0DC, p03:B0F6)
	bit 4,a		;a1c1
	ret z			;a1c3   ; sin el bit 4 de 0xD7D0, nada mas
	ld a,(0e040h)		;a1c4   ; lee la escena en curso (1-9, 0 = ninguna; p09:A4A6, guiones en p09:A5D4)
	or a			;a1c7
	ret nz			;a1c8   ; con escena, nada mas
	ld a,(0d7d1h)		;a1c9
	bit 5,a		;a1cc
	ret nz			;a1ce   ; con el bit 5 de 0xD7D1, nada mas
	ld a,(0ca4ah)		;a1cf   ; lee la zona
	cp 011h		;a1d2
	ret nz			;a1d4   ; solo en la zona 0x11...
	ld a,(0ca4bh)		;a1d5   ; lee la sala de la zona
	cp 005h		;a1d8
	ret nz			;a1da   ; ...sala 5
	ld hl,(0cad8h)		;a1db   ; la cuenta de 0xCAD8...
	ld a,h			;a1de
	or l			;a1df
	jr z,cad8_a_cero		;a1e0
	dec hl			;a1e2   ; ...uno menos
	ld (0cad8h),hl		;a1e3   ; guarda una cuenta de 16 bits que baja en la zona 0x11 sala 5 (p09:A1DB)
	ret			;a1e6
cad8_a_cero:
	ld hl,0cb75h		;a1e7
	ld a,(hl)			;a1ea
	or a			;a1eb
	jr nz,L_A1F0		;a1ec
	ld (hl),001h		;a1ee   ; 0xCB75 al menos 1
L_A1F0:
	call 07b7fh		;a1f0   ; p04:92EB
	ld hl,0cb75h		;a1f3
	ld a,(hl)			;a1f6
	cp 002h		;a1f7   ; con 2 en 0xCB75...
	jr nz,mira_cb76		;a1f9
	xor a			;a1fb   ; ...0xCB55 = 0
	ld (0cb55h),a		;a1fc
mira_cb76:
	ld a,(0cb76h)		;a1ff
	or a			;a202
	ret z			;a203   ; sin 0xCB76, nada
	call algo_lanzado		;a204   ; con algo lanzado, nada
	ret c			;a207
	xor a			;a208
	ld (0cb16h),a		;a209   ; sin darse la vuelta
	inc a			;a20c
	ld (0cb14h),a		;a20d   ; 0xCB14 = 1
	ld (0d8a8h),a		;a210   ; la ventana estrecha
	ld hl,0cb00h		;a213   ; apunta a el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	ld (hl),a			;a216   ; Snake en el estado 1...
	inc hl			;a217
	ld (hl),a			;a218   ; ...dibujo 1
	ld a,00ah		;a219   ; la bandera 0x0A
	call 08c7ah		;a21b   ; a_p03_b0dc: p03:B0DC con el banco 3 en 0xA000
	ld c,009h		;a21e   ; la escena 9
	call empieza_escena		;a220   ; empieza_escena: la escena C: 0xE040 = C, 0xE041-0xE044 a cero y el estado de la partida al paso 5
	ld hl,0dc68h		;a223   ; los sprites 13-18 fuera
	ld a,0e0h		;a226
	ld bc,00017h		;a228
	call 04237h		;a22b   ; llena_bloque: pone A en BC + 1 bytes desde HL
	ld hl,0e043h		;a22e   ; 0xE043 = 0x20
	ld (hl),020h		;a231
	call 06b12h		;a233   ; sonido_05: pide el sonido 0x05
	jp 08c92h		;a236   ; la ventana arriba
algo_lanzado:		; acarreo si alguna de las 6 fichas de lo que lanza Snake esta activa (guardando IX)
	push ix		;a239
	call algo_lanzado_b		;a23b   ; algo_lanzado_b:
	pop ix		;a23e
	ret			;a240
algo_lanzado_b:
	ld ix,0cb80h		;a241   ; apunta a las 6 fichas de 16 bytes de lo que lanza Snake ([tipo][..][Y 8.8][X 8.8][velocidades]...)
	ld b,006h		;a245
ficha_lanzada:
	ld a,(ix+000h)		;a247
	or a			;a24a
	jr z,siguiente_lanzada		;a24b   ; libre: la siguiente
	scf			;a24d   ; activa: acarreo
	ret			;a24e
siguiente_lanzada:
	ld de,00010h		;a24f
	add ix,de		;a252
	djnz ficha_lanzada		;a254
	or a			;a256
	ret			;a257
e248_con_cb21_2:		; con 0xCB21 = 2 y sin el bit 7 de 0xD7D5: la ficha 0xE248 libre y, en la sala especial 0x2A columna 8, en (0x60, 0x10) de 3 x 1 con su dibujo
	ld a,(0cb21h)		;a258   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	cp 002h		;a25b
	ret nz			;a25d   ; sin 0xCB21 = 2, nada
	ld a,(0d7d5h)		;a25e
	bit 7,a		;a261
	ret nz			;a263   ; con el bit 7 de 0xD7D5, nada
	ld hl,0e248h		;a264   ; apunta a la ficha del que sigue a Snake 12 posiciones por detras (0xE0A4)
	ld (hl),000h		;a267   ; libre
	call sala_2a_columna_8		;a269   ; sala_2a_columna_8: Z en la sala especial 0x2A columna 8
	ret nz			;a26c   ; fuera de esa sala, nada
	ld hl,0e248h		;a26d   ; apunta a la ficha del que sigue a Snake 12 posiciones por detras (0xE0A4)
	ld de,01060h		;a270   ; en (0x60, 0x10)...
	ld bc,00301h		;a273   ; ...3 x 1
	call pon_ficha_c		;a276   ; pon_ficha_c: la ficha de HL: [C][1][0][E][0][D][B][0]
	jp 08c4ah		;a279   ; su dibujo
escena_1:		; sin el bit 7 de 0xD7D5, en la sala especial 0x2A columna 8: la bandera 0x28, fuera el bit 3 de 0xD7DE, la ficha 0xE248 en (0x60, 0x10) con su dibujo, Snake hacia abajo, la ventana estrecha, la escena 1 y la ventana segun Snake
	ld a,(0d7d5h)		;a27c
	bit 7,a		;a27f
	ret nz			;a281   ; con el bit 7, nada
	call sala_2a_columna_8		;a282   ; sala_2a_columna_8: Z en la sala especial 0x2A columna 8
	ret nz			;a285   ; fuera de esa sala, nada
	ld a,028h		;a286   ; la bandera 0x28
	call 08c7ah		;a288   ; a_p03_b0dc: p03:B0DC con el banco 3 en 0xA000
	ld hl,0d7deh		;a28b
	res 3,(hl)		;a28e   ; fuera el bit 3 de 0xD7DE
	ld hl,0e248h		;a290   ; la ficha 0xE248...
	ld de,01060h		;a293
	ld bc,00301h		;a296
	call pon_ficha_c		;a299   ; ...pintada
	call 08c4ah		;a29c   ; a_p03_b563: p03:B563 con el banco 3 en 0xA000
	ld a,002h		;a29f   ; Snake hacia abajo
	ld (0cb0eh),a		;a2a1   ; guarda la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	dec a			;a2a4
	ld hl,0d8a8h		;a2a5   ; apunta a 1: la ventana del mensaje es estrecha (0xB8 x 0x28)
	ld (hl),a			;a2a8   ; la ventana estrecha
	ld c,a			;a2a9
	call empieza_escena		;a2aa   ; la escena 1
	jp 08c82h		;a2ad   ; la ventana
sala_2a_columna_8:		; Z en la sala especial 0x2A columna 8
	ld a,(0ca76h)		;a2b0   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 02ah		;a2b3
	ret nz			;a2b5
	ld a,(0ca51h)		;a2b6   ; lee la columna de la sala en la zona (uno mas al salir por la derecha)
	cp 008h		;a2b9
	ret			;a2bb
escena_2:		; sin el bit 6 de 0xD7D5, con dos detras (0xCAA0 = 2), en la zona 8 sala 0x0C: la bandera 0x29, Snake hacia arriba, la escena 2, la ventana estrecha y abajo
	ld a,(0d7d5h)		;a2bc
	rla			;a2bf
	rla			;a2c0
	ret c			;a2c1   ; con el bit 6, nada
	ld a,(0caa0h)		;a2c2   ; lee cuantos siguen a Snake por su rastro (1-4)
	cp 002h		;a2c5
	ret nz			;a2c7   ; sin dos detras, nada
	ld a,(0ca4ah)		;a2c8   ; lee la zona
	cp 008h		;a2cb
	ret nz			;a2cd   ; solo en la zona 8...
	ld a,(0ca4bh)		;a2ce   ; lee la sala de la zona
	cp 00ch		;a2d1
	ret nz			;a2d3   ; ...sala 0x0C
	ld a,029h		;a2d4   ; la bandera 0x29
	call 08c7ah		;a2d6   ; a_p03_b0dc: p03:B0DC con el banco 3 en 0xA000
	ld a,001h		;a2d9   ; Snake hacia arriba
	ld (0cb0eh),a		;a2db   ; guarda la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ld c,002h		;a2de   ; la escena 2
	call empieza_escena		;a2e0   ; empieza_escena: la escena C: 0xE040 = C, 0xE041-0xE044 a cero y el estado de la partida al paso 5
	ld a,001h		;a2e3   ; la ventana estrecha
	ld (0d8a8h),a		;a2e5   ; guarda 1: la ventana del mensaje es estrecha (0xB8 x 0x28)
	jp 08c8ah		;a2e8   ; a_p03_b610: p03:B610 con el banco 3 en 0xA000
e240_sala_18:		; salvo con 0xCB21 = 2: en la sala especial 0x18 columna 8 sin el bit 1 de 0xD7D4, la ficha 0xE240 en (0x9D, 0x4D) de 2 x 1 y su dibujo
	ld a,(0cb21h)		;a2eb   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	cp 002h		;a2ee
	ret z			;a2f0   ; con 0xCB21 = 2, nada
	call sala_18_columna_8		;a2f1   ; sala_18_columna_8: Z en la sala especial 0x18 columna 8 sin el bit 1 de 0xD7D4
	ret nz			;a2f4   ; fuera de esa sala, nada
	ld hl,0e240h		;a2f5   ; apunta a la ficha del que sigue a Snake 4 posiciones por detras (del rastro de 0xE08C)
	ld de,04d9dh		;a2f8   ; en (0x9D, 0x4D)...
	ld bc,00201h		;a2fb   ; ...2 x 1
	call pon_ficha_c		;a2fe   ; pon_ficha_c: la ficha de HL: [C][1][0][E][0][D][B][0]
	jp 08c52h		;a301   ; su dibujo
escena_3:		; sin 0xD4F3, en la sala especial 0x18 columna 8 (sin el bit 1 de 0xD7D4), con Snake en Y 0x94-0xA3 y X 0x3C-0x64: 0xD4E4 = 0, la escena 3, la direccion contraria a la de Snake en 0xE246, 0xD4F3 = 1, la ventana en 0x4C, sin lo lanzado y p09:A571
	ld a,(0d4f3h)		;a304
	or a			;a307
	ret nz			;a308   ; con 0xD4F3, nada
	call sala_18_columna_8		;a309   ; sala_18_columna_8: Z en la sala especial 0x18 columna 8 sin el bit 1 de 0xD7D4
	ret nz			;a30c   ; fuera de esa sala, nada
	ld a,(0cb03h)		;a30d   ; lee la Y de Snake
	cp 094h		;a310
	ret c			;a312   ; Y 0x94...
	cp 0a4h		;a313
	ret nc			;a315   ; ...a 0xA3
	ld a,(0cb05h)		;a316   ; lee la X de Snake
	cp 03ch		;a319
	ret c			;a31b   ; X 0x3C...
	cp 065h		;a31c
	ret nc			;a31e   ; ...a 0x64
	xor a			;a31f
	ld (0d4e4h),a		;a320   ; 0xD4E4 = 0
	ld c,003h		;a323   ; la escena 3
	call empieza_escena		;a325   ; empieza_escena: la escena C: 0xE040 = C, 0xE041-0xE044 a cero y el estado de la partida al paso 5
	ld a,(0cb0eh)		;a328   ; la direccion contraria...
	dec a			;a32b
	xor 001h		;a32c
	inc a			;a32e
	ld hl,0e246h		;a32f   ; ...en 0xE246
	ld (hl),a			;a332
	ld a,001h		;a333
	ld (0d4f3h),a		;a335   ; 0xD4F3 = 1
	call 08c9ah		;a338   ; la ventana en 0x4C
	call sin_lanzados		;a33b   ; sin lo lanzado
	jp sin_lanzados_ni_sprites		;a33e   ; sin_lanzados_ni_sprites: lo lanzado por Snake a cero y todos los sprites fuera
sala_18_columna_8:		; Z en la sala especial 0x18 columna 8 sin el bit 1 de 0xD7D4
	ld a,(0d7d4h)		;a341
	bit 1,a		;a344
	ret nz			;a346   ; con el bit 1, NZ
	ld a,(0ca76h)		;a347   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 018h		;a34a
	ret nz			;a34c
	ld a,(0ca51h)		;a34d   ; lee la columna de la sala en la zona (uno mas al salir por la derecha)
	cp 008h		;a350
	ret			;a352
escena_4:		; con el bit 6 de 0xD7D5 y sin el 4, en la zona 0x0A sala 4: las fichas 0xE240 en (0xBC, 0x64) y 0xE248 en (0xBC, 0x84) de 1 x 1, p12:6D78, Snake en (0xBC, 0x74) hacia arriba, la ventana estrecha, p12:7688, sus dibujos, la bandera 0x2B, la escena 4, la ventana arriba, sin lo lanzado y el sonido 7
	ld a,(0d7d5h)		;a353
	bit 6,a		;a356
	ret z			;a358   ; sin el bit 6, nada
	bit 4,a		;a359
	ret nz			;a35b   ; con el 4, nada
	ld a,(0ca4ah)		;a35c   ; lee la zona
	cp 00ah		;a35f
	ret nz			;a361   ; solo en la zona 0x0A...
	ld a,(0ca4bh)		;a362   ; lee la sala de la zona
	cp 004h		;a365
	ret nz			;a367   ; ...sala 4
	ld hl,0e240h		;a368   ; la ficha 0xE240 en (0xBC, 0x64)...
	ld de,064bch		;a36b
	ld bc,00101h		;a36e
	call pon_ficha_c		;a371   ; pon_ficha_c: la ficha de HL: [C][1][0][E][0][D][B][0]
	ld hl,0e248h		;a374   ; ...la 0xE248 en (0xBC, 0x84)
	ld d,084h		;a377
	call pon_ficha_c		;a379   ; pon_ficha_c: la ficha de HL: [C][1][0][E][0][D][B][0]
	ld a,e			;a37c
	push af			;a37d
	call 05f51h		;a37e   ; p12:6D78
	pop af			;a381
	ld (0cb03h),a		;a382   ; Snake en Y = 0xBC...
	ld a,074h		;a385
	ld (0cb05h),a		;a387   ; ...X = 0x74...
	ld a,001h		;a38a
	ld (0cb0eh),a		;a38c   ; ...hacia arriba
	ld (0cb14h),a		;a38f   ; guarda el dibujo del paso de andar (0, 1, 2, 1: p02:9888)
	ld (0d8a8h),a		;a392   ; la ventana estrecha
	call 05f2bh		;a395   ; p12:7688
	call 08c52h		;a398   ; los dibujos
	call 08c4ah		;a39b   ; a_p03_b563: p03:B563 con el banco 3 en 0xA000
	ld a,02bh		;a39e   ; la bandera 0x2B
	call 08c7ah		;a3a0   ; a_p03_b0dc: p03:B0DC con el banco 3 en 0xA000
	ld c,004h		;a3a3   ; la escena 4
	call empieza_escena		;a3a5   ; empieza_escena: la escena C: 0xE040 = C, 0xE041-0xE044 a cero y el estado de la partida al paso 5
	call 08c92h		;a3a8   ; la ventana arriba
	call sin_lanzados		;a3ab   ; sin lo lanzado
	jp 06a11h		;a3ae   ; sonido_07: pide el sonido 0x07
escena_5:		; con el bit 4 de 0xD7D5 y sin el 0 de 0xD7DA, en la zona 0x0A sala 4 con Snake por encima de Y = 0xA0 y en X 0x68-0x7F: la bandera 0x57, la escena 5, 0xE246 = 3, 0xCB5B = 0, sin lo lanzado y el sonido 4
	ld a,(0d7d5h)		;a3b1
	bit 4,a		;a3b4
	ret z			;a3b6   ; sin el bit 4, nada
	ld a,(0d7dah)		;a3b7
	bit 0,a		;a3ba
	ret nz			;a3bc   ; con el bit 0 de 0xD7DA, nada
	ld a,(0ca4ah)		;a3bd   ; lee la zona
	cp 00ah		;a3c0
	ret nz			;a3c2   ; solo en la zona 0x0A...
	ld a,(0ca4bh)		;a3c3   ; lee la sala de la zona
	cp 004h		;a3c6
	ret nz			;a3c8   ; ...sala 4
	ld a,(0cb03h)		;a3c9   ; lee la Y de Snake
	cp 0a0h		;a3cc
	ret nc			;a3ce   ; desde Y = 0xA0, nada
	ld a,(0cb05h)		;a3cf   ; lee la X de Snake
	cp 068h		;a3d2
	ret c			;a3d4   ; X 0x68...
	cp 080h		;a3d5
	ret nc			;a3d7   ; ...a 0x7F
	ld a,057h		;a3d8   ; la bandera 0x57
	call 08c7ah		;a3da   ; a_p03_b0dc: p03:B0DC con el banco 3 en 0xA000
	ld c,005h		;a3dd   ; la escena 5
	call empieza_escena		;a3df   ; empieza_escena: la escena C: 0xE040 = C, 0xE041-0xE044 a cero y el estado de la partida al paso 5
	ld a,003h		;a3e2
	ld (0e246h),a		;a3e4   ; 0xE246 = 3
	ld hl,0cb5bh		;a3e7
	ld (hl),000h		;a3ea   ; 0xCB5B = 0
	call sin_lanzados		;a3ec   ; sin lo lanzado
	jp 06a6bh		;a3ef   ; sonido_04: pide el sonido 0x04
escena_6:		; sin los bits 5-6 de 0xD7D3, en la sala especial 0x26 sala 2 con Snake en Y 0x60-0x8F y X 0x50-0x6F: la bandera 0x1A, fuera el bit 3 de 0xD7E0, la escena 6, la direccion contraria en 0xDFDE, sin lo lanzado y la ventana en 0x4C
	ld a,(0d7d3h)		;a3f2
	and 060h		;a3f5
	ret nz			;a3f7   ; con los bits 5-6, nada
	bit 6,a		;a3f8
	ret nz			;a3fa
	bit 5,a		;a3fb
	ret nz			;a3fd
	call especial_26_sala_2		;a3fe   ; especial_26_sala_2: Z en la sala especial 0x26 sala 2
	ret nz			;a401   ; fuera de esa sala, nada
	ld a,(0cb03h)		;a402   ; lee la Y de Snake
	cp 060h		;a405
	ret c			;a407   ; Y 0x60...
	cp 090h		;a408
	ret nc			;a40a   ; ...a 0x8F
	ld a,(0cb05h)		;a40b   ; lee la X de Snake
	cp 050h		;a40e
	ret c			;a410   ; X 0x50...
	cp 070h		;a411
	ret nc			;a413   ; ...a 0x6F
	ld a,01ah		;a414   ; la bandera 0x1A
	call 08c7ah		;a416   ; a_p03_b0dc: p03:B0DC con el banco 3 en 0xA000
	ld hl,0d7e0h		;a419   ; fuera el bit 3 de 0xD7E0
	res 3,(hl)		;a41c
	ld c,006h		;a41e   ; la escena 6
	call empieza_escena		;a420   ; empieza_escena: la escena C: 0xE040 = C, 0xE041-0xE044 a cero y el estado de la partida al paso 5
	ld a,(0cb0eh)		;a423   ; la direccion contraria...
	dec a			;a426
	xor 001h		;a427
	inc a			;a429
	ld hl,0dfdeh		;a42a   ; ...en 0xDFDE
	ld (hl),a			;a42d
	call sin_lanzados		;a42e   ; sin lo lanzado
	jp 08c9ah		;a431   ; a_p03_b5ff: p03:B5FF con el banco 3 en 0xA000
especial_26_sala_2:		; Z en la sala especial 0x26 sala 2
	ld a,(0ca76h)		;a434   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 026h		;a437
	ret nz			;a439
	ld a,(0ca4bh)		;a43a   ; lee la sala de la zona
	cp 002h		;a43d
	ret			;a43f
escena_7:		; sin el bit 3 de 0xD7DA, en la zona 0x12 sala 0x0C con Snake por encima de Y = 0x91: 0xCB14 = 1, las rachas de p00:4E01 a 0xFC00, la ficha 0xDFD0 (Y = 0xBE, la X de Snake, 0, 1), la bandera 0x54, sin lo lanzado y la escena 7
	ld a,(0d7dah)		;a440
	bit 3,a		;a443
	ret nz			;a445   ; con el bit 3, nada
	ld a,(0ca4ah)		;a446   ; lee la zona
	cp 012h		;a449
	ret nz			;a44b   ; solo en la zona 0x12...
	ld a,(0ca4bh)		;a44c   ; lee la sala de la zona
	cp 00ch		;a44f
	ret nz			;a451   ; ...sala 0x0C
	ld a,(0cb03h)		;a452   ; lee la Y de Snake
	cp 091h		;a455
	ret nc			;a457   ; desde Y = 0x91, nada
	ld a,001h		;a458
	ld (0cb14h),a		;a45a   ; guarda el dibujo del paso de andar (0, 1, 2, 1: p02:9888)
	call 04e01h		;a45d   ; las rachas
	ld hl,0dfd0h		;a460   ; la ficha 0xDFD0: Y = 0xBE...
	ld (hl),0beh		;a463
	inc l			;a465
	ld a,(0cb05h)		;a466   ; ...la X de Snake...
	ld (hl),a			;a469
	inc l			;a46a
	ld (hl),000h		;a46b
	inc l			;a46d
	ld (hl),001h		;a46e   ; ...activa
	ld a,054h		;a470   ; la bandera 0x54
	call 08c7ah		;a472   ; a_p03_b0dc: p03:B0DC con el banco 3 en 0xA000
	call sin_lanzados		;a475   ; sin lo lanzado
	ld c,007h		;a478   ; la escena 7
	jp empieza_escena		;a47a   ; empieza_escena: la escena C: 0xE040 = C, 0xE041-0xE044 a cero y el estado de la partida al paso 5
escena_8:		; sin salir y sin el bit 4 de 0xD7D0, en la zona 0x11 sala 5 con Snake por encima de Y = 0x9E: 0xCB14 = 1, la bandera 3 y la escena 8
	ld a,(0ca41h)		;a47d   ; lee la salida de la sala (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	or a			;a480
	ret nz			;a481   ; saliendo, nada
	ld a,(0d7d0h)		;a482   ; lee las banderas de la partida: la n en el bit 7 - n % 8 del byte n / 8 (p03:B0DC, p03:B0F6)
	bit 4,a		;a485
	ret nz			;a487   ; con el bit 4, nada
	ld a,(0ca4ah)		;a488   ; lee la zona
	cp 011h		;a48b
	ret nz			;a48d   ; solo en la zona 0x11...
	ld a,(0ca4bh)		;a48e   ; lee la sala de la zona
	cp 005h		;a491
	ret nz			;a493   ; ...sala 5
	ld a,(0cb03h)		;a494   ; lee la Y de Snake
	cp 09eh		;a497
	ret nc			;a499   ; desde Y = 0x9E, nada
	ld a,001h		;a49a
	ld (0cb14h),a		;a49c   ; guarda el dibujo del paso de andar (0, 1, 2, 1: p02:9888)
	ld a,003h		;a49f   ; la bandera 3
	call 08c7ah		;a4a1   ; a_p03_b0dc: p03:B0DC con el banco 3 en 0xA000
	ld c,008h		;a4a4   ; la escena 8
empieza_escena:		; la escena C: 0xE040 = C, 0xE041-0xE044 a cero y el estado de la partida al paso 5
	xor a			;a4a6
	ld hl,0e040h		;a4a7   ; apunta a la escena en curso (1-9, 0 = ninguna; p09:A4A6, guiones en p09:A5D4)
	ld (hl),c			;a4aa   ; la escena
	inc hl			;a4ab
	ld (hl),a			;a4ac
	inc hl			;a4ad
	ld (hl),a			;a4ae
	inc hl			;a4af
	ld (hl),a			;a4b0
	inc hl			;a4b1
	ld (hl),a			;a4b2
	ld a,005h		;a4b3   ; el paso 5 del estado de la partida
	ld (0ca01h),a		;a4b5   ; guarda el paso del estado de la partida
	ret			;a4b8
sin_lanzados:		; lo lanzado por Snake a cero y los sprites 1-6 (0xDC04-0xDC1B) fuera
	ld hl,0cb80h		;a4b9   ; apunta a las 6 fichas de 16 bytes de lo que lanza Snake ([tipo][..][Y 8.8][X 8.8][velocidades]...)
	ld bc,0005fh		;a4bc
	call 04236h		;a4bf   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	ld hl,0dc04h		;a4c2   ; los sprites 1-6...
	ld bc,00017h		;a4c5
	ld a,0e0h		;a4c8   ; ...a 0xE0
	jp 04237h		;a4ca   ; llena_bloque: pone A en BC + 1 bytes desde HL
pon_ficha_c:		; la ficha de HL: [C][1][0][E][0][D][B][0]
	xor a			;a4cd
	ld (hl),c			;a4ce   ; el tipo C
	inc l			;a4cf
	ld (hl),001h		;a4d0   ; el paso 1
	inc l			;a4d2
	ld (hl),a			;a4d3
	inc l			;a4d4
	ld (hl),e			;a4d5   ; la Y = E
	inc l			;a4d6
	ld (hl),a			;a4d7
	inc l			;a4d8
	ld (hl),d			;a4d9   ; la X = D
	inc l			;a4da
	ld (hl),b			;a4db   ; la direccion B
	inc hl			;a4dc
	ld (hl),a			;a4dd
	ret			;a4de
secuencia_y_paso:		; la secuencia de mensajes; con 0xE042 desde 4, 0xE042 = 0 y 0xE041 uno mas
	call secuencia_de_mensajes		;a4df   ; secuencia_de_mensajes: los mensajes de una secuencia del banco 50, uno tras otro con su espera
	ld hl,0e042h		;a4e2   ; apunta a el paso de la secuencia de mensajes (0-4, p09:A4F0)
	ld a,(hl)			;a4e5
	cp 004h		;a4e6
	ret c			;a4e8   ; por debajo de 4, nada
	ld (hl),000h		;a4e9   ; 0xE042 = 0...
	ld hl,0e041h		;a4eb   ; apunta a el paso de la escena en curso
	inc (hl)			;a4ee   ; ...el paso siguiente
	ret			;a4ef
secuencia_de_mensajes:		; los mensajes de una secuencia del banco 50, uno tras otro con su espera
	ld a,(0e042h)		;a4f0   ; el paso de la secuencia (0xE042)
	dec a			;a4f3
	jr z,secuencia_paso_1		;a4f4   ; el 1: esperar el mensaje
	dec a			;a4f6
	jr z,secuencia_paso_2		;a4f7   ; el 2: la espera
	dec a			;a4f9
	jr z,secuencia_paso_3		;a4fa   ; el 3: la espera final
	dec a			;a4fc
	ret z			;a4fd   ; el 4: acabada
	ld a,(0e044h)		;a4fe   ; el 0: el mensaje 0xE044 de la secuencia de HL (3 bytes: el mensaje y su espera)
	ld b,a			;a501
	add a,a			;a502
	add a,b			;a503
	call 0421ah		;a504   ; bancos_50: pone el 50 en 0x8000 (con su copia en 0xC381-0xC383)
	call 043fch		;a507   ; la lista de la secuencia
	call 0423eh		;a50a   ; suma_a_hl: HL = HL + A
	ld a,(hl)			;a50d   ; el mensaje
	inc hl			;a50e
	ld h,(hl)			;a50f
	ld l,a			;a510
	call 041c2h		;a511   ; bancos_1_2_9: pone el 1 en 0x6000, el 2 en 0x8000, el 9 en 0xA000 (con su copia en 0xC381-0xC383)
	call 064feh		;a514   ; a la ventana
e042_siguiente:		; el paso siguiente de la secuencia
	ld hl,0e042h		;a517   ; apunta a el paso de la secuencia de mensajes (0-4, p09:A4F0)
	inc (hl)			;a51a
	ret			;a51b
secuencia_paso_1:		; el mensaje cada cuadro; al acabar, la espera de su entrada a 0xE043 y el mensaje siguiente; con 0xFF, la espera final
	push hl			;a51c
	call 0657fh		;a51d   ; mensaje_cada_cuadro_b_9: mensaje_cada_cuadro y deja el banco 9
	pop hl			;a520
	ld a,(0e220h)		;a521   ; lee la velocidad del mensaje en curso (0 = ninguno; 1-3, 4 sin espera)
	or a			;a524
	ret nz			;a525   ; sin acabar, nada
	ld a,(0e044h)		;a526   ; la entrada 0xE044...
	ld b,a			;a529
	add a,a			;a52a
	add a,b			;a52b
	call 0421ah		;a52c   ; bancos_50: pone el 50 en 0x8000 (con su copia en 0xC381-0xC383)
	call 043fch		;a52f   ; lee_palabra: HL = la palabra que hay en HL
	call 0423eh		;a532   ; suma_a_hl: HL = HL + A
	inc hl			;a535   ; ...su tercer byte
	inc hl			;a536
	ld a,(hl)			;a537
	cp 0ffh		;a538
	jr z,secuencia_ultimo		;a53a   ; 0xFF: el ultimo
	ld (0e043h),a		;a53c   ; la espera
	ld hl,0e044h		;a53f   ; el mensaje siguiente
	inc (hl)			;a542
	call 041c2h		;a543   ; bancos_1_2_9: pone el 1 en 0x6000, el 2 en 0x8000, el 9 en 0xA000 (con su copia en 0xC381-0xC383)
	jp e042_siguiente		;a546   ; e042_siguiente: el paso siguiente de la secuencia
secuencia_ultimo:
	inc hl			;a549
	ld a,(hl)			;a54a   ; la espera final...
	ld (0e043h),a		;a54b   ; guarda la cuenta de cuadros de la escena
	call 041c2h		;a54e   ; bancos_1_2_9: pone el 1 en 0x6000, el 2 en 0x8000, el 9 en 0xA000 (con su copia en 0xC381-0xC383)
	call e042_siguiente		;a551   ; ...y el paso 3
	jp e042_siguiente		;a554   ; e042_siguiente: el paso siguiente de la secuencia
secuencia_paso_2:		; al acabar la espera, el paso 0 (el mensaje siguiente)
	ld hl,0e043h		;a557   ; apunta a la cuenta de cuadros de la escena
	dec (hl)			;a55a
	ret nz			;a55b
	ld hl,0e042h		;a55c   ; apunta a el paso de la secuencia de mensajes (0-4, p09:A4F0)
	ld (hl),000h		;a55f
	ret			;a561
secuencia_paso_3:		; al acabar la espera final: 0xE044 = 0 y el paso 4 (acabada)
	ld hl,0e043h		;a562   ; apunta a la cuenta de cuadros de la escena
	dec (hl)			;a565
	ret nz			;a566
	xor a			;a567
	ld (0e044h),a		;a568   ; guarda el mensaje de la secuencia en curso (p09:A4FE)
	ld a,004h		;a56b
	ld (0e042h),a		;a56d   ; guarda el paso de la secuencia de mensajes (0-4, p09:A4F0)
	ret			;a570
sin_lanzados_ni_sprites:		; lo lanzado por Snake a cero y todos los sprites fuera
	ld hl,0cb80h		;a571   ; apunta a las 6 fichas de 16 bytes de lo que lanza Snake ([tipo][..][Y 8.8][X 8.8][velocidades]...)
	ld bc,0005fh		;a574
	call 04236h		;a577   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	jp 04266h		;a57a   ; esconde_sprites_ram: llena 0xDC00-0xDC7F con 0xE0
otra_pagina_a_esta:		; la otra pagina entera (0xC0 x 0xC0) a esta
	ld h,000h		;a57d
	ld l,h			;a57f
	ld d,h			;a580
	ld e,l			;a581
	ld bc,0c0c0h		;a582
	jp 0474dh		;a585   ; copia_rectangulo_a_esta: p00:4767 de la otra pagina (0xCA42 ^ 1) a la de 0xCA42
sin_dfd8_ni_e248:		; sin los bits 5-6 de 0xD7D3, la ficha 0xDFD8 a cero; sin el bit 7 de 0xD7D5, la 0xE248 a cero
	call sin_dfd8		;a588   ; sin_dfd8: sin los bits 5-6 de 0xD7D3, la ficha 0xDFD8 a cero
	ld a,(0d7d5h)		;a58b
	bit 7,a		;a58e
	ret nz			;a590
	ld hl,0e248h		;a591   ; apunta a la ficha del que sigue a Snake 12 posiciones por detras (0xE0A4)
	ld bc,00007h		;a594
	jp 04236h		;a597   ; borra_bloque: pone a cero BC + 1 bytes desde HL
sin_dfd8:		; sin los bits 5-6 de 0xD7D3, la ficha 0xDFD8 a cero
	ld a,(0d7d3h)		;a59a
	and 060h		;a59d
	ret nz			;a59f
	ld hl,0dfd8h		;a5a0
	ld bc,00007h		;a5a3
	jp 04236h		;a5a6   ; borra_bloque: pone a cero BC + 1 bytes desde HL
escena_cada_cuadro:		; en una escena: las tablas de sprites alternadas, p12:76E9, la franja de 0xDFD8, el paso de la escena (p09:A5C1), el de 0xDFD8 pintado y los sprites a la VRAM
	call 067cdh		;a5a9   ; cambia_tablas_de_sprites: alterna las tablas de sprites de la VRAM: atributos en 0xF600 o 0xF200, colores en 0xF400 o 0xF000
	call 05f34h		;a5ac   ; a_p12_76e9_2: p12:76E9 con el banco 12 en 0x6000
	call 04650h		;a5af   ; espera_vdp: espera a que el VDP acabe la orden en curso (S#2 bit 0)
	call 08c62h		;a5b2   ; a_p03_b593: p03:B593 con el banco 3 en 0xA000
	call 04650h		;a5b5   ; espera_vdp: espera a que el VDP acabe la orden en curso (S#2 bit 0)
	call paso_de_escena		;a5b8   ; paso_de_escena: el paso de la escena (p09:A5CD), los que siguen por el rastro, p12:7688 y sus dibujos
	call 08c5ah		;a5bb   ; a_p03_b5b5: p03:B5B5 con el banco 3 en 0xA000
	jp 067f5h		;a5be   ; sprites_a_vram_turnos: los sprites a la VRAM, cambiando el orden cada cuadro para que no desaparezcan
paso_de_escena:		; el paso de la escena (p09:A5CD), los que siguen por el rastro, p12:7688 y sus dibujos
	call escena_por_numero		;a5c1   ; escena_por_numero: la escena 0xE040 (p09:A5D4, 9 escenas)
	call 08c72h		;a5c4   ; a_p03_b404: p03:B404 con el banco 3 en 0xA000
	call 05f2bh		;a5c7   ; a_p12_7688_2: p12:7688 con el banco 12 en 0x6000
	jp 08c6ah		;a5ca   ; a_p03_b4e0: p03:B4E0 con el banco 3 en 0xA000
escena_por_numero:		; la escena 0xE040 (p09:A5D4, 9 escenas)
	ld a,(0e040h)		;a5cd   ; lee la escena en curso (1-9, 0 = ninguna; p09:A4A6, guiones en p09:A5D4)
	dec a			;a5d0
	call 0424dh		;a5d1   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_A5D4: 9 destinos del despachador p00:424D (call en p09:A5D1, el
;   indice en A): A5E6, A696, A863, A961, AA69, AF76, B0B4, B2E8, B315; lo
;   leen p09:A5D1 (18 bytes)
;   0xa5d4..0xa5e6  (18 bytes)
DATA_tabla_A5D4:
	defw 0a5e6h,0a696h,0a863h,0a961h,0aa69h,0af76h,0b0b4h,0b2e8h	; a5d4
	defw 0b315h	; a5e4  -> guion_9

; ======================================================================
; CODIGO 0xa5e6..0xa5ec  (6 bytes)
; ======================================================================


guion_1:		; la escena 1 por su paso 0xE041 (p09:A5EC)
	ld a,(0e041h)		;a5e6   ; lee el paso de la escena en curso
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


guion_1_paso_0:		; Snake hacia abajo, la orden 0xF4 al sonido y el paso siguiente
	ld a,002h		;a5fc
	ld (0cb0eh),a		;a5fe   ; guarda la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	call 06be4h		;a601   ; orden_sonido_f4: la orden 0xF4 al sonido
	jr e041_siguiente		;a604
guion_1_paso_1:		; cada 2 cuadros Snake anda (p02:8CB3) hasta Y = 0x60; alli, hacia la izquierda y el paso siguiente
	ld a,(0ca03h)		;a606   ; lee el contador de cuadros (uno mas en cada interrupcion)
	rra			;a609
	ret c			;a60a
	call 08cb3h		;a60b   ; p02:8CB3
	ld b,060h		;a60e
	ld hl,0cb03h		;a610   ; apunta a la Y de Snake
	ld a,(hl)			;a613   ; por encima, sigue
	cp b			;a614
	ret c			;a615
	ld (hl),b			;a616   ; Y = 0x60...
	ld a,003h		;a617   ; ...hacia la izquierda
	ld (0cb0eh),a		;a619   ; guarda la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	jr e041_siguiente		;a61c
guion_1_paso_2:		; cada 2 cuadros anda hasta X = 0x20; alli, 0xE24E = 4, el sonido 1 y el paso siguiente
	ld a,(0ca03h)		;a61e   ; lee el contador de cuadros (uno mas en cada interrupcion)
	rra			;a621
	ret c			;a622
	call 08cb3h		;a623   ; p02:8CB3
	ld b,020h		;a626
	ld hl,0cb05h		;a628   ; apunta a la X de Snake
	ld a,(hl)			;a62b
	cp b			;a62c
	ret nc			;a62d   ; a la derecha, sigue
	ld (hl),b			;a62e   ; X = 0x20
	ld a,004h		;a62f   ; 0xE24E = 4
	ld (0e24eh),a		;a631   ; guarda la direccion del que sigue a Snake de 0xE248
	call 06a0dh		;a634   ; sonido_01: pide el sonido 0x01
	jr e041_siguiente		;a637
guion_1_paso_3:		; el sonido 0x9E y el paso siguiente
	call 06bb4h		;a639   ; sonido_9e: pide el sonido 0x9E (de los que tienen la partitura en un banco de musica, p16:4CE3)
	jr e041_siguiente		;a63c
guion_1_paso_4:		; la secuencia de p50:800C
	ld hl,0800ch		;a63e   ; tabla_800C: 14 destinos del despachador p00
	jp secuencia_y_paso		;a641   ; secuencia_y_paso: la secuencia de mensajes; con 0xE042 desde 4, 0xE042 = 0 y 0xE041 uno mas
guion_1_paso_5:		; quita la ventana, 0xD694 = 0xD695 = 1, la ficha 0xE248 = 2 y el paso siguiente
	call 08caah		;a644   ; a_p03_b63e: p03:B63E con el banco 3 en 0xA000
	ld a,001h		;a647
	ld hl,0d694h		;a649   ; 0xD694...
	ld (hl),a			;a64c
	inc hl			;a64d   ; ...y 0xD695 a 1
	ld (hl),a			;a64e
	inc a			;a64f
	ld (0e248h),a		;a650   ; la ficha 0xE248 = 2
e041_siguiente:		; el paso siguiente de la escena
	ld hl,0e041h		;a653   ; apunta a el paso de la escena en curso
	inc (hl)			;a656
	ret			;a657
guion_1_paso_6:		; cuando Snake + 0x20 llega a la X de 0xE24D: 0xE24E = 3, la ficha 0xE248 = 3 y el paso siguiente
	ld a,(0e24dh)		;a658   ; lee la X del que sigue a Snake de 0xE248
	ld b,a			;a65b
	ld a,(0cb05h)		;a65c   ; lee la X de Snake
	add a,020h		;a65f
	cp b			;a661
	ret nc			;a662   ; aun no
	ld a,003h		;a663
	ld (0e24eh),a		;a665   ; guarda la direccion del que sigue a Snake de 0xE248
	ld (0e248h),a		;a668   ; guarda la ficha del que sigue a Snake 12 posiciones por detras (0xE0A4)
	jr e041_siguiente		;a66b
guion_1_paso_7:		; fin: 0xE040 = 0, la ventana normal, dos detras (0xCAA0 = 2), 0x40 x 0x2C a 0 en (0xC0, 0xD4), el sonido 5, p02:8E81 y la musica de p01:6B41 pendiente
	xor a			;a66d
	ld (0e040h),a		;a66e   ; guarda la escena en curso (1-9, 0 = ninguna; p09:A4A6, guiones en p09:A5D4)
	ld (0d8a8h),a		;a671   ; guarda 1: la ventana del mensaje es estrecha (0xB8 x 0x28)
	ld a,002h		;a674   ; dos detras
	ld (0caa0h),a		;a676   ; guarda cuantos siguen a Snake por su rastro (1-4)
	ld hl,0c0d4h		;a679   ; 0x40 x 0x2C...
	ld bc,0402ch		;a67c
	xor a			;a67f   ; ...al color 0
	ld d,a			;a680
	call 046ffh		;a681   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
	call 06b12h		;a684   ; sonido_05: pide el sonido 0x05
	call 08e81h		;a687   ; p02:8E81
	ld hl,06b41h		;a68a   ; la musica de p01:6B41...
	ld (0ca19h),hl		;a68d   ; guarda la musica pendiente: la rutina que la pide (16 bits)
	ld hl,0ca18h		;a690   ; ...pendiente
	ld (hl),0ffh		;a693
	ret			;a695
guion_2:		; la escena 2 por su paso 0xE041 (p09:A69C)
	ld a,(0e041h)		;a696   ; lee el paso de la escena en curso
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


guion_2_paso_0:		; Snake hacia arriba, cada 2 cuadros anda hasta Y = 0x3E; alli, el paso siguiente
	ld a,001h		;a6ba
	ld (0cb0eh),a		;a6bc   ; guarda la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ld a,(0ca03h)		;a6bf   ; lee el contador de cuadros (uno mas en cada interrupcion)
	rra			;a6c2
	ret c			;a6c3
	call 08cb3h		;a6c4   ; p02:8CB3
	ld a,(0cb03h)		;a6c7   ; lee la Y de Snake
	cp 03eh		;a6ca
	ret nc			;a6cc   ; por debajo, sigue
e041_siguiente_b:
	ld hl,0e041h		;a6cd   ; apunta a el paso de la escena en curso
	inc (hl)			;a6d0
	ret			;a6d1
guion_2_paso_1:		; la secuencia de p50:8014
	ld hl,08014h		;a6d2
	jp secuencia_y_paso		;a6d5   ; secuencia_y_paso: la secuencia de mensajes; con 0xE042 desde 4, 0xE042 = 0 y 0xE041 uno mas
guion_2_paso_2:		; las fichas 0xE240 y 0xE248 = 2, 0xE24E = 2, Snake hacia la izquierda, 0xE246 = 4, el paso siguiente y quita la ventana
	ld a,002h		;a6d8
	ld (0e240h),a		;a6da   ; guarda la ficha del que sigue a Snake 4 posiciones por detras (del rastro de 0xE08C)
	ld (0e248h),a		;a6dd   ; guarda la ficha del que sigue a Snake 12 posiciones por detras (0xE0A4)
	ld (0e24eh),a		;a6e0   ; guarda la direccion del que sigue a Snake de 0xE248
	inc a			;a6e3   ; Snake hacia la izquierda
	ld (0cb0eh),a		;a6e4   ; guarda la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	inc a			;a6e7   ; 0xE246 = 4
	ld (0e246h),a		;a6e8   ; guarda la direccion del que sigue a Snake de 0xE240
	call e041_siguiente_b		;a6eb   ; e041_siguiente_b:
	jp 08caah		;a6ee   ; a_p03_b63e: p03:B63E con el banco 3 en 0xA000
guion_2_paso_3:		; Snake a X = 0x50 (p09:A714); el de 0xE240 desde X = 0x70 se para mirando a la izquierda; con el de 0xE248 en Y = 0xE0, fuera y el paso siguiente
	call snake_a_x_50		;a6f1   ; snake_a_x_50: cada 4 cuadros Snake anda; al pasar de X = 0x50, en 0x50 mirando a la derecha y la orden 0xF6 al sonido
	ld a,(0e245h)		;a6f4   ; lee la X del que sigue a Snake de 0xE240
	cp 070h		;a6f7
	jr c,mira_e248_fuera		;a6f9   ; por debajo de 0x70, sigue
	ld a,001h		;a6fb   ; el de 0xE240 parado...
	ld (0e240h),a		;a6fd   ; guarda la ficha del que sigue a Snake 4 posiciones por detras (del rastro de 0xE08C)
	ld hl,0e246h		;a700   ; ...mirando a la izquierda
	ld (hl),003h		;a703
mira_e248_fuera:
	ld a,(0e24bh)		;a705   ; lee la Y del que sigue a Snake de 0xE248
	cp 0e0h		;a708
	ret nz			;a70a   ; aun no
	xor a			;a70b   ; el de 0xE248 fuera
	ld (0e248h),a		;a70c   ; guarda la ficha del que sigue a Snake 12 posiciones por detras (0xE0A4)
	ld (0e249h),a		;a70f   ; guarda la Y baja del que sigue a Snake de 0xE248
	jr e041_siguiente_b		;a712
snake_a_x_50:		; cada 4 cuadros Snake anda; al pasar de X = 0x50, en 0x50 mirando a la derecha y la orden 0xF6 al sonido
	ld a,(0cb05h)		;a714   ; lee la X de Snake
	cp 050h		;a717
	ret z			;a719   ; ya en 0x50, nada
	ld a,(0ca03h)		;a71a   ; lee el contador de cuadros (uno mas en cada interrupcion)
	and 003h		;a71d   ; cada 4 cuadros
	ret nz			;a71f
	call 08cb3h		;a720   ; p02:8CB3
	ld a,(0cb05h)		;a723   ; lee la X de Snake
	cp 051h		;a726
	ret nc			;a728   ; a la derecha, sigue
	ld hl,05000h		;a729   ; X = 0x50
	ld (0cb04h),hl		;a72c   ; guarda la X de Snake: la parte fraccionaria (0xCB04-0xCB05 en 8.8) y el byte siguiente (16 bits)
	ld a,001h		;a72f
	ld (0cb14h),a		;a731   ; guarda el dibujo del paso de andar (0, 1, 2, 1: p02:9888)
	ld a,004h		;a734   ; a la derecha
	ld (0cb0eh),a		;a736   ; guarda la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	jp 06be8h		;a739   ; orden_sonido_f6: la orden 0xF6 al sonido
guion_2_paso_4:		; 0x80 cuadros, 0xE241 = 0, guarda el fondo de (0x68, 0x37) en (0xC0, 0xDC), los dibujos de p45:B9E1, el mosaico de p45:B9E7, Snake de espaldas (p09:A754) y el paso siguiente
	ld hl,0e043h		;a73c   ; apunta a la cuenta de cuadros de la escena
	ld (hl),080h		;a73f   ; 0x80 cuadros
	xor a			;a741
	ld (0e241h),a		;a742   ; 0xE241 = 0
	call fondo_de_6837		;a745   ; guarda el fondo
	call 06fa3h		;a748   ; los dibujos
	call 0713eh		;a74b   ; el mosaico
	call snake_dibujo_4		;a74e   ; Snake de espaldas
	jp e041_siguiente_b		;a751   ; e041_siguiente_b:
snake_dibujo_4:		; Snake con el dibujo 4, dandose la vuelta, y 0xCB17 = 8
	ld a,004h		;a754
	ld (0cb01h),a		;a756   ; guarda el dibujo de Snake (al darse la vuelta se le suma 1, 3 o 5 segun 0xCB00)
	ld a,001h		;a759
	ld (0cb16h),a		;a75b   ; guarda 1 mientras Snake se da la vuelta
	ld a,008h		;a75e
	ld (0cb17h),a		;a760
	ret			;a763
fondo_de_6837:		; 0x10 x 0x10 de (0x68, 0x37) de la otra pagina a (0xC0, 0xDC) de esta
	call sitio_6837		;a764   ; sitio_6837: HL = (0x68, 0x37), DE = (0xC0, 0xDC), 0x10 x 0x10
	jp 0474dh		;a767   ; copia_rectangulo_a_esta: p00:4767 de la otra pagina (0xCA42 ^ 1) a la de 0xCA42
fondo_a_6837:		; los 0x10 x 0x10 guardados de vuelta a (0x68, 0x37) en la otra pagina
	call sitio_6837		;a76a   ; sitio_6837: HL = (0x68, 0x37), DE = (0xC0, 0xDC), 0x10 x 0x10
	ex de,hl			;a76d
	jp 0475ah		;a76e   ; copia_rectangulo_a_la_otra: p00:4767 de la pagina 0xCA42 a la otra
sitio_6837:		; HL = (0x68, 0x37), DE = (0xC0, 0xDC), 0x10 x 0x10
	ld hl,06837h		;a771
	ld de,0dcc0h		;a774
	ld bc,01010h		;a777
	ret			;a77a
guion_2_paso_5:		; al acabar la espera: el paso siguiente, Snake de frente (p09:A89A), la otra pagina a esta y esta en negro
	ld hl,0e043h		;a77b   ; apunta a la cuenta de cuadros de la escena
	dec (hl)			;a77e
	ret nz			;a77f
	call e041_siguiente_b		;a780   ; e041_siguiente_b:
	call snake_de_frente		;a783   ; snake_de_frente: 0xE241 = 0 y Snake con el dibujo 0x0D (el suyo a 0xE254)
	call otra_pagina_a_esta		;a786   ; otra_pagina_a_esta: la otra pagina entera (0xC0 x 0xC0) a esta
	jp 0444fh		;a789   ; borra_pantalla_negro: 0xC0 x 0xC0 puntos a 0 en la pagina de dibujar
guion_2_paso_6:		; la paleta de p56:B914, p02:8E2E con 0 y 9, los mosaicos de quien habla (0 en (0x10, 0x18) y 9 en (0x90, 0x18), p03:B814), el sonido 0x9D, la ventana segun Snake y el paso siguiente
	call 08ccbh		;a78c   ; paleta_b914_b_9: paleta_b914 y deja el banco 9
	xor a			;a78f
	call 08e2eh		;a790   ; p02:8E2E con 0
	ld a,009h		;a793
	call 08e2eh		;a795   ; y con 9
	xor a			;a798
	ld b,a			;a799
	ld de,01018h		;a79a   ; el 0 en (0x10, 0x18)
	call 08e16h		;a79d   ; a_p03_b814: p03:B814 con el banco 3 en 0xA000
	ld a,009h		;a7a0
	ld b,001h		;a7a2
	ld de,09018h		;a7a4   ; el 9 en (0x90, 0x18)
	call 08e16h		;a7a7   ; a_p03_b814: p03:B814 con el banco 3 en 0xA000
	call 06bb0h		;a7aa   ; sonido_9d: pide el sonido 0x9D (de los que tienen la partitura en un banco de musica, p16:4CE3)
	call 08c82h		;a7ad   ; a_p03_b607: p03:B607 con el banco 3 en 0xA000
	jp e041_siguiente_b		;a7b0   ; e041_siguiente_b:
guion_2_paso_7:		; p03:B8AC y la secuencia de p50:800E
	call 08e1eh		;a7b3   ; a_p03_b8ac: p03:B8AC con el banco 3 en 0xA000
	ld hl,0800eh		;a7b6
	jp secuencia_y_paso		;a7b9   ; secuencia_y_paso: la secuencia de mensajes; con 0xE042 desde 4, 0xE042 = 0 y 0xE041 uno mas
guion_2_paso_8:		; p03:B8AC, p03:B65D, la ventana estrecha y el paso siguiente
	call 08e1eh		;a7bc   ; a_p03_b8ac: p03:B8AC con el banco 3 en 0xA000
	call 08ce8h		;a7bf   ; a_p03_b65d: p03:B65D con el banco 3 en 0xA000
	ld a,001h		;a7c2
	ld (0d8a8h),a		;a7c4   ; guarda 1: la ventana del mensaje es estrecha (0xB8 x 0x28)
	jp e041_siguiente_b		;a7c7   ; e041_siguiente_b:
guion_2_paso_9:		; p03:B8AC y la secuencia de p50:8012
	call 08e1eh		;a7ca   ; a_p03_b8ac: p03:B8AC con el banco 3 en 0xA000
	ld hl,08012h		;a7cd
	jp secuencia_y_paso		;a7d0   ; secuencia_y_paso: la secuencia de mensajes; con 0xE042 desde 4, 0xE042 = 0 y 0xE041 uno mas
guion_2_paso_10:		; quita los mosaicos 0 y 1 (p03:B866), p03:B65D, p02:8C29, Snake de espaldas, la pagina a la otra y el paso siguiente
	xor a			;a7d3
	call 08e26h		;a7d4   ; a_p03_b866: p03:B866 con el banco 3 en 0xA000
	ld a,001h		;a7d7
	call 08e26h		;a7d9   ; a_p03_b866: p03:B866 con el banco 3 en 0xA000
	call 08ce8h		;a7dc   ; a_p03_b65d: p03:B65D con el banco 3 en 0xA000
	call 08c29h		;a7df   ; p02:8C29
	call snake_dibujo_4		;a7e2   ; snake_dibujo_4: Snake con el dibujo 4, dandose la vuelta, y 0xCB17 = 8
	call pagina_a_la_otra		;a7e5   ; pagina_a_la_otra: esta pagina entera (0xC0 x 0xC0) a la otra
	jp e041_siguiente_b		;a7e8   ; e041_siguiente_b:
pagina_a_la_otra:		; esta pagina entera (0xC0 x 0xC0) a la otra
	ld hl,00000h		;a7eb
	ld e,l			;a7ee
	ld d,h			;a7ef
	ld bc,0c0c0h		;a7f0
	jp 0475ah		;a7f3   ; copia_rectangulo_a_la_otra: p00:4767 de la pagina 0xCA42 a la otra
guion_2_paso_11:		; la ventana estrecha, 0xE249 = 0xE24E = 1, la ficha 0xE248 = 2 en (0xBE, 0x60) y el paso siguiente
	ld a,001h		;a7f6
	ld (0d8a8h),a		;a7f8   ; guarda 1: la ventana del mensaje es estrecha (0xB8 x 0x28)
	ld (0e249h),a		;a7fb   ; guarda la Y baja del que sigue a Snake de 0xE248
	ld (0e24eh),a		;a7fe   ; guarda la direccion del que sigue a Snake de 0xE248
	inc a			;a801
	ld (0e248h),a		;a802   ; guarda la ficha del que sigue a Snake 12 posiciones por detras (0xE0A4)
	ld hl,0e24bh		;a805   ; apunta a la Y del que sigue a Snake de 0xE248
	ld (hl),0beh		;a808   ; Y = 0xBE
	inc l			;a80a
	inc l			;a80b
	ld (hl),060h		;a80c   ; X = 0x60
	jp e041_siguiente_b		;a80e   ; e041_siguiente_b:
guion_2_paso_12:		; cuando el de 0xE248 sube de Y = 0x60: la ficha = 1, el fondo de vuelta, Snake en el estado de 0xCB35, sin darse la vuelta, 0xCB14 = 1, 0xE241 = 1, hacia abajo, el bit 5 de 0xD7D5, la ventana y el paso siguiente
	ld a,(0e24bh)		;a811   ; lee la Y del que sigue a Snake de 0xE248
	cp 060h		;a814
	ret nc			;a816   ; aun no
	ld a,001h		;a817
	ld (0e248h),a		;a819   ; guarda la ficha del que sigue a Snake 12 posiciones por detras (0xE0A4)
	call fondo_a_6837		;a81c   ; el fondo de vuelta
	ld a,(0cb35h)		;a81f   ; el estado de 0xCB35
	ld (0cb00h),a		;a822   ; guarda el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	ld (0cb01h),a		;a825   ; guarda el dibujo de Snake (al darse la vuelta se le suma 1, 3 o 5 segun 0xCB00)
	xor a			;a828
	ld (0cb16h),a		;a829   ; guarda 1 mientras Snake se da la vuelta
	inc a			;a82c
	ld (0cb14h),a		;a82d   ; guarda el dibujo del paso de andar (0, 1, 2, 1: p02:9888)
	ld (0e241h),a		;a830   ; guarda 0 mientras Snake esta de frente en la escena (p09:A89A)
	inc a			;a833
	ld (0cb0eh),a		;a834   ; hacia abajo
	ld hl,0d7d5h		;a837
	set 5,(hl)		;a83a   ; el bit 5 de 0xD7D5
	call 08c82h		;a83c   ; a_p03_b607: p03:B607 con el banco 3 en 0xA000
	jp e041_siguiente_b		;a83f   ; e041_siguiente_b:
guion_2_paso_13:		; la secuencia de p50:8010
	ld hl,08010h		;a842
	jp secuencia_y_paso		;a845   ; secuencia_y_paso: la secuencia de mensajes; con 0xE042 desde 4, 0xE042 = 0 y 0xE041 uno mas
guion_2_paso_14:		; fin: quita la ventana, 0xE040 = 0, la ventana normal, tres detras (0xCAA0 = 3), el estado que toca, los dibujos de la sala, p02:8E81 y la orden 0xF6
	call 08caah		;a848   ; a_p03_b63e: p03:B63E con el banco 3 en 0xA000
	xor a			;a84b
	ld (0e040h),a		;a84c   ; guarda la escena en curso (1-9, 0 = ninguna; p09:A4A6, guiones en p09:A5D4)
	ld (0d8a8h),a		;a84f   ; guarda 1: la ventana del mensaje es estrecha (0xB8 x 0x28)
	ld a,003h		;a852
	ld (0caa0h),a		;a854   ; tres detras
	call 098bfh		;a857   ; estado_que_toca: el estado que toca (p02:98F0) a 0xCB00
	call 08cf0h		;a85a   ; dibujos_de_sala_b_9: dibujos_de_sala y deja el banco 9
	call 08e81h		;a85d   ; p02:8E81
	jp 06be8h		;a860   ; orden_sonido_f6: la orden 0xF6 al sonido
guion_3:		; la escena 3 por su paso 0xE041 (p09:A869)
	ld a,(0e041h)		;a863   ; lee el paso de la escena en curso
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


guion_3_paso_0:		; la secuencia de p50:8016
	ld hl,08016h		;a883
	jp secuencia_y_paso		;a886   ; secuencia_y_paso: la secuencia de mensajes; con 0xE042 desde 4, 0xE042 = 0 y 0xE041 uno mas
guion_3_paso_1:		; quita la ventana, la otra pagina a esta, esta en negro, Snake de frente y el paso siguiente
	call 08caah		;a889   ; a_p03_b63e: p03:B63E con el banco 3 en 0xA000
	call otra_pagina_a_esta		;a88c   ; otra_pagina_a_esta: la otra pagina entera (0xC0 x 0xC0) a esta
	call 0444fh		;a88f   ; borra_pantalla_negro: 0xC0 x 0xC0 puntos a 0 en la pagina de dibujar
	call snake_de_frente		;a892   ; snake_de_frente: 0xE241 = 0 y Snake con el dibujo 0x0D (el suyo a 0xE254)
e041_siguiente_c:
	ld hl,0e041h		;a895   ; apunta a el paso de la escena en curso
	inc (hl)			;a898
	ret			;a899
snake_de_frente:		; 0xE241 = 0 y Snake con el dibujo 0x0D (el suyo a 0xE254)
	xor a			;a89a
	ld (0e241h),a		;a89b   ; guarda 0 mientras Snake esta de frente en la escena (p09:A89A)
dibujo_0d:
	ld hl,0cb01h		;a89e   ; apunta a el dibujo de Snake (al darse la vuelta se le suma 1, 3 o 5 segun 0xCB00)
	ld a,(hl)			;a8a1
	ld (0e254h),a		;a8a2   ; el de antes a 0xE254
	ld (hl),00dh		;a8a5   ; el dibujo 0x0D
	ret			;a8a7
snake_como_antes:		; 0xE241 = 1 y Snake con el dibujo de 0xE254
	ld a,001h		;a8a8
	ld (0e241h),a		;a8aa   ; guarda 0 mientras Snake esta de frente en la escena (p09:A89A)
dibujo_de_e254:
	ld a,(0e254h)		;a8ad   ; lee el dibujo de Snake de antes de ponerlo de frente (p09:A89A)
	ld hl,0cb01h		;a8b0   ; apunta a el dibujo de Snake (al darse la vuelta se le suma 1, 3 o 5 segun 0xCB00)
	ld (hl),a			;a8b3
	ret			;a8b4
guion_3_paso_2:		; la paleta de p56:B914, los mosaicos de quien habla 0 y 9, el sonido 0x9C y el paso siguiente
	call 08ccbh		;a8b5   ; paleta_b914_b_9: paleta_b914 y deja el banco 9
	xor a			;a8b8
	call 08e2eh		;a8b9   ; p02:8E2E
	ld a,009h		;a8bc
	call 08e2eh		;a8be   ; p02:8E2E
	xor a			;a8c1
	ld b,a			;a8c2
	ld de,01018h		;a8c3
	call 08e16h		;a8c6   ; a_p03_b814: p03:B814 con el banco 3 en 0xA000
	ld a,009h		;a8c9
	ld b,001h		;a8cb
	ld de,09018h		;a8cd
	call 08e16h		;a8d0   ; a_p03_b814: p03:B814 con el banco 3 en 0xA000
	call 06bach		;a8d3   ; sonido_9c: pide el sonido 0x9C (de los que tienen la partitura en un banco de musica, p16:4CE3)
	jr e041_siguiente_c		;a8d6
guion_3_paso_3:		; p03:B8AC y la secuencia de p50:8018
	call 08e1eh		;a8d8   ; a_p03_b8ac: p03:B8AC con el banco 3 en 0xA000
	ld hl,08018h		;a8db
	jp secuencia_y_paso		;a8de   ; secuencia_y_paso: la secuencia de mensajes; con 0xE042 desde 4, 0xE042 = 0 y 0xE041 uno mas
guion_3_paso_4:		; quita los mosaicos, p03:B65D, la conversacion de p01:63DD, 0xD7BB = 1, p09:B68E, el estado de la partida al paso 4 y el paso siguiente
	xor a			;a8e1
	call 08e26h		;a8e2   ; a_p03_b866: p03:B866 con el banco 3 en 0xA000
	ld a,001h		;a8e5
	call 08e26h		;a8e7   ; a_p03_b866: p03:B866 con el banco 3 en 0xA000
	call 08ce8h		;a8ea   ; a_p03_b65d: p03:B65D con el banco 3 en 0xA000
	call 063ddh		;a8ed   ; conversacion_8002:
	ld a,001h		;a8f0   ; 0xD7BB = 1
	ld (0d7bbh),a		;a8f2   ; guarda 1: la pantalla de conversacion la abre una escena (llama sola, p09:B8AB)
	call pantalla_de_conversacion		;a8f5   ; pantalla_de_conversacion: la pantalla de la conversacion: los dibujos de p46:9EB2, los mosaicos de quien habla (p09:B75F), R#7 = 0x0F, 0xDF80 a cero, a cero 0xD793, 0xDFEC, 0xD79A-0xD79B, 0xD7B4-0xD7B5, 0xCABE, 0xCADD, 0xCA86, 0xCB71, 0xCB77 y 0xCB52; 0xCABD = 0xE255 = 1, la ventana estrecha, la fase a 0xCB7F, 0xCB5D (1 con la escena 9 y 0xCB5E = 0xC0), 0xD795 = 0xD7B6 = 3, 0xD796-0xD799 a cero, con 0xD7BB p09:BEB5; sin sprites, la pantalla en negro, el mosaico de p47:A719 y lo demas de p09:BD91, BA1E y BA35
	ld a,004h		;a8f8   ; el paso 4 del estado de la partida
	ld (0ca01h),a		;a8fa   ; guarda el paso del estado de la partida
	jr e041_siguiente_c		;a8fd
guion_3_paso_5:		; Snake como antes, la ventana en 0x4C y el paso siguiente
	call snake_como_antes		;a8ff   ; snake_como_antes: 0xE241 = 1 y Snake con el dibujo de 0xE254
	call 08c9ah		;a902   ; a_p03_b5ff: p03:B5FF con el banco 3 en 0xA000
	jr e041_siguiente_c		;a905
guion_3_paso_6:		; la secuencia de p50:801A
	ld hl,0801ah		;a907
	jp secuencia_y_paso		;a90a   ; secuencia_y_paso: la secuencia de mensajes; con 0xE042 desde 4, 0xE042 = 0 y 0xE041 uno mas
guion_3_paso_7:		; quita la ventana, Snake y el de 0xE240 hacia la derecha, 0xCB14 = 1, la ficha 0xE240 = 2 y el paso siguiente
	call 08caah		;a90d   ; a_p03_b63e: p03:B63E con el banco 3 en 0xA000
	ld a,004h		;a910
	ld (0cb0eh),a		;a912   ; guarda la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ld (0e246h),a		;a915   ; guarda la direccion del que sigue a Snake de 0xE240
	ld a,001h		;a918
	ld (0cb14h),a		;a91a   ; guarda el dibujo del paso de andar (0, 1, 2, 1: p02:9888)
	inc a			;a91d
	ld (0e240h),a		;a91e   ; guarda la ficha del que sigue a Snake 4 posiciones por detras (del rastro de 0xE08C)
	jp e041_siguiente_c		;a921   ; e041_siguiente_c:
guion_3_paso_8:		; cuando el de 0xE240 llega a X = 0xAD, hacia arriba y el paso siguiente
	ld a,(0e245h)		;a924   ; lee la X del que sigue a Snake de 0xE240
	cp 0adh		;a927
	ret c			;a929
	ld a,001h		;a92a
	ld (0e246h),a		;a92c   ; guarda la direccion del que sigue a Snake de 0xE240
	jp e041_siguiente_c		;a92f   ; e041_siguiente_c:
guion_3_paso_9:		; cuando sube de Y = 0x4D, la ficha 0xE240 = 1 y el paso siguiente
	ld a,(0e243h)		;a932   ; lee la Y del que sigue a Snake de 0xE240
	cp 04dh		;a935
	ret nc			;a937
	ld a,001h		;a938
	ld (0e240h),a		;a93a   ; guarda la ficha del que sigue a Snake 4 posiciones por detras (del rastro de 0xE08C)
	jp e041_siguiente_c		;a93d   ; e041_siguiente_c:
guion_3_paso_10:		; el de 0xE240 hacia abajo y el paso siguiente
	ld a,002h		;a940
	ld (0e246h),a		;a942   ; guarda la direccion del que sigue a Snake de 0xE240
	jp e041_siguiente_c		;a945   ; e041_siguiente_c:
guion_3_paso_11:		; la secuencia de p50:801C
	ld hl,0801ch		;a948
	jp secuencia_y_paso		;a94b   ; secuencia_y_paso: la secuencia de mensajes; con 0xE042 desde 4, 0xE042 = 0 y 0xE041 uno mas
guion_3_paso_12:		; fin: quita la ventana, 0xE040 = 0, el sonido 5, p02:8E81 y la musica pendiente ya
	call 08caah		;a94e   ; a_p03_b63e: p03:B63E con el banco 3 en 0xA000
	xor a			;a951
	ld (0e040h),a		;a952   ; guarda la escena en curso (1-9, 0 = ninguna; p09:A4A6, guiones en p09:A5D4)
	call 06b12h		;a955   ; sonido_05: pide el sonido 0x05
	call 08e81h		;a958   ; p02:8E81
	ld hl,0ca18h		;a95b   ; apunta a la espera hasta poner la musica pendiente
	ld (hl),0ffh		;a95e
	ret			;a960
guion_4:		; la escena 4 por su paso 0xE041 (p09:A967)
	ld a,(0e041h)		;a961   ; lee el paso de la escena en curso
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


guion_4_paso_0:		; la orden 0xF4 al sonido, 0xB4 cuadros y el paso siguiente
	call 06be4h		;a987   ; orden_sonido_f4: la orden 0xF4 al sonido
	ld hl,0e043h		;a98a   ; apunta a la cuenta de cuadros de la escena
	ld (hl),0b4h		;a98d
	jr e041_siguiente_d		;a98f
guion_4_paso_1:		; al acabar la espera, el sonido 0x7D y el paso siguiente
	ld hl,0e043h		;a991   ; apunta a la cuenta de cuadros de la escena
	dec (hl)			;a994
	ret nz			;a995
	call 06b85h		;a996   ; sonido_7d: pide el sonido 0x7D (de los que tienen la partitura en un banco de musica, p16:4CE3)
	jr e041_siguiente_d		;a999
guion_4_paso_2:		; la secuencia de p50:8022
	ld hl,08022h		;a99b
	jp secuencia_y_paso		;a99e   ; secuencia_y_paso: la secuencia de mensajes; con 0xE042 desde 4, 0xE042 = 0 y 0xE041 uno mas
guion_4_paso_3:		; quita la ventana, la ficha 0xE248 = 2 y el paso siguiente
	call 08caah		;a9a1   ; a_p03_b63e: p03:B63E con el banco 3 en 0xA000
	ld a,002h		;a9a4
	ld (0e248h),a		;a9a6   ; guarda la ficha del que sigue a Snake 12 posiciones por detras (0xE0A4)
e041_siguiente_d:
	ld hl,0e041h		;a9a9   ; apunta a el paso de la escena en curso
	inc (hl)			;a9ac
	ret			;a9ad
guion_4_paso_4:		; cuando el de 0xE248 sube de Y = 0xA1, hacia la izquierda y el paso siguiente
	ld a,(0e24bh)		;a9ae   ; lee la Y del que sigue a Snake de 0xE248
	cp 0a1h		;a9b1
	ret nc			;a9b3
	ld a,003h		;a9b4
	ld (0e24eh),a		;a9b6   ; guarda la direccion del que sigue a Snake de 0xE248
	jr e041_siguiente_d		;a9b9
guion_4_paso_5:		; cuando pasa a la izquierda de X = 0x75, hacia arriba y el paso siguiente
	ld a,(0e24dh)		;a9bb   ; lee la X del que sigue a Snake de 0xE248
	cp 075h		;a9be
	ret nc			;a9c0
	ld a,001h		;a9c1
	ld (0e24eh),a		;a9c3   ; guarda la direccion del que sigue a Snake de 0xE248
	jr e041_siguiente_d		;a9c6
guion_4_paso_6:		; cuando sube de Y = 0x68: hacia abajo, la ficha = 1, 0x30 cuadros y el paso siguiente
	ld a,(0e24bh)		;a9c8   ; lee la Y del que sigue a Snake de 0xE248
	cp 068h		;a9cb
	ret nc			;a9cd
	ld a,002h		;a9ce
	ld (0e24eh),a		;a9d0   ; guarda la direccion del que sigue a Snake de 0xE248
	dec a			;a9d3
	ld (0e248h),a		;a9d4   ; guarda la ficha del que sigue a Snake 12 posiciones por detras (0xE0A4)
	ld hl,0e043h		;a9d7   ; apunta a la cuenta de cuadros de la escena
	ld (hl),030h		;a9da
	jr e041_siguiente_d		;a9dc
guion_4_paso_7:		; al acabar la espera: hacia arriba, la ficha = 2 y el paso siguiente
	ld hl,0e043h		;a9de   ; apunta a la cuenta de cuadros de la escena
	dec (hl)			;a9e1
	ret nz			;a9e2
	ld a,001h		;a9e3
	ld (0e24eh),a		;a9e5   ; guarda la direccion del que sigue a Snake de 0xE248
	inc a			;a9e8
	ld (0e248h),a		;a9e9   ; guarda la ficha del que sigue a Snake 12 posiciones por detras (0xE0A4)
	jr e041_siguiente_d		;a9ec
guion_4_paso_8:		; cuando sube de Y = 0x25: hacia abajo, la ficha = 1, la ventana estrecha, el paso siguiente y la ventana en 0x4C
	ld a,(0e24bh)		;a9ee   ; lee la Y del que sigue a Snake de 0xE248
	cp 025h		;a9f1
	ret nc			;a9f3
	ld a,002h		;a9f4
	ld (0e24eh),a		;a9f6   ; guarda la direccion del que sigue a Snake de 0xE248
	dec a			;a9f9
	ld (0e248h),a		;a9fa   ; guarda la ficha del que sigue a Snake 12 posiciones por detras (0xE0A4)
	ld (0d8a8h),a		;a9fd   ; guarda 1: la ventana del mensaje es estrecha (0xB8 x 0x28)
	call e041_siguiente_d		;aa00   ; e041_siguiente_d:
	jp 08c9ah		;aa03   ; a_p03_b5ff: p03:B5FF con el banco 3 en 0xA000
guion_4_paso_9:		; la secuencia de p50:801E
	ld hl,0801eh		;aa06
	jp secuencia_y_paso		;aa09   ; secuencia_y_paso: la secuencia de mensajes; con 0xE042 desde 4, 0xE042 = 0 y 0xE041 uno mas
guion_4_paso_10:		; quita la ventana, la ficha 0xE240 = 2 y el paso siguiente
	call 08caah		;aa0c   ; a_p03_b63e: p03:B63E con el banco 3 en 0xA000
	ld a,002h		;aa0f
	ld (0e240h),a		;aa11   ; guarda la ficha del que sigue a Snake 4 posiciones por detras (del rastro de 0xE08C)
	jr e041_siguiente_d		;aa14
guion_4_paso_11:		; cuando el de 0xE240 sube de Y = 0xA1, hacia la derecha y el paso siguiente
	ld a,(0e243h)		;aa16   ; lee la Y del que sigue a Snake de 0xE240
	cp 0a1h		;aa19
	ret nc			;aa1b
	ld a,004h		;aa1c
	ld (0e246h),a		;aa1e   ; guarda la direccion del que sigue a Snake de 0xE240
	jr e041_siguiente_d		;aa21
guion_4_paso_12:		; cuando llega a X = 0x74, hacia arriba y el paso siguiente
	ld a,(0e245h)		;aa23   ; lee la X del que sigue a Snake de 0xE240
	cp 074h		;aa26
	ret c			;aa28
	ld a,001h		;aa29
	ld (0e246h),a		;aa2b   ; guarda la direccion del que sigue a Snake de 0xE240
	jp e041_siguiente_d		;aa2e   ; e041_siguiente_d:
guion_4_paso_13:		; cuando sube de Y = 0x68: hacia abajo, la ficha = 1, 0xE249 = 0, el paso siguiente, la ventana estrecha y arriba
	ld a,(0e243h)		;aa31   ; lee la Y del que sigue a Snake de 0xE240
	cp 068h		;aa34
	ret nc			;aa36
	ld a,002h		;aa37
	ld (0e246h),a		;aa39   ; guarda la direccion del que sigue a Snake de 0xE240
	dec a			;aa3c
	ld (0e240h),a		;aa3d   ; guarda la ficha del que sigue a Snake 4 posiciones por detras (del rastro de 0xE08C)
	xor a			;aa40
	ld (0e249h),a		;aa41   ; guarda la Y baja del que sigue a Snake de 0xE248
	call e041_siguiente_d		;aa44   ; e041_siguiente_d:
	ld a,001h		;aa47
	ld (0d8a8h),a		;aa49   ; guarda 1: la ventana del mensaje es estrecha (0xB8 x 0x28)
	jp 08c92h		;aa4c   ; a_p03_b603: p03:B603 con el banco 3 en 0xA000
guion_4_paso_14:		; la secuencia de p50:8020
	ld hl,08020h		;aa4f
	jp secuencia_y_paso		;aa52   ; secuencia_y_paso: la secuencia de mensajes; con 0xE042 desde 4, 0xE042 = 0 y 0xE041 uno mas
guion_4_paso_15:		; fin: quita la ventana, nadie detras, 0xE040 = 0, la ventana normal, 0xE249 = 1 y el estado que toca
	call 08caah		;aa55   ; a_p03_b63e: p03:B63E con el banco 3 en 0xA000
	xor a			;aa58
	ld (0caa0h),a		;aa59   ; guarda cuantos siguen a Snake por su rastro (1-4)
	ld (0e040h),a		;aa5c   ; guarda la escena en curso (1-9, 0 = ninguna; p09:A4A6, guiones en p09:A5D4)
	ld (0d8a8h),a		;aa5f   ; guarda 1: la ventana del mensaje es estrecha (0xB8 x 0x28)
	inc a			;aa62
	ld (0e249h),a		;aa63   ; guarda la Y baja del que sigue a Snake de 0xE248
	jp 098bfh		;aa66   ; estado_que_toca: el estado que toca (p02:98F0) a 0xCB00
guion_5:		; la escena 5: cada 8 cuadros 0xCB5B uno mas y su paso 0xE041 (p09:AA7A, 32 pasos)
	ld a,(0ca03h)		;aa69   ; lee el contador de cuadros (uno mas en cada interrupcion)
	and 007h		;aa6c
	jr nz,guion_5_por_paso		;aa6e   ; cada 8 cuadros...
	ld hl,0cb5bh		;aa70   ; ...0xCB5B uno mas
	inc (hl)			;aa73
guion_5_por_paso:
	ld a,(0e041h)		;aa74   ; lee el paso de la escena en curso
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


guion_5_paso_0:		; las rachas de p00:4E11 a 0xFF00, 0xE25B = 0, el sonido 0x1D y el paso siguiente
	call 04e11h		;aaba   ; rachas_935d_a_ff00:
	xor a			;aabd
	ld (0e25bh),a		;aabe   ; 0xE25B = 0
	call 06a6fh		;aac1   ; sonido_1d: pide el sonido 0x1D
	jr e041_siguiente_e		;aac4
guion_5_paso_1:		; 0xE25B sube 4 hasta la Y del de 0xE240 - 0x10; despues, p09:AF4C
	ld hl,0e25bh		;aac6
	inc (hl)			;aac9
	inc (hl)			;aaca
	inc (hl)			;aacb
	inc (hl)			;aacc
	ld a,(0e243h)		;aacd   ; la Y del de 0xE240 - 0x10...
	sub 010h		;aad0
	cp (hl)			;aad2
	jr c,e041_siguiente_e		;aad3   ; ...por debajo, sigue
	jp sprite_e25b		;aad5   ; sprite_e25b: dos sprites en (0xE25B, 0x6C) con el patron 0xE0 (0xDC28) y sus colores 8 y 0x4A
guion_5_paso_2:		; los dibujos de p45:B9C8, las rachas de p47:A81B, p10:A6A4 en (0x50, 0x60), el sonido 0x94, el mosaico de p56:AE3B, la ventana en 0x4C y estrecha, 0xCB14 = 1, 0xE250 = 0xFC00 y 0xE252 = 0x0100
	call 06f94h		;aad8   ; dibujos_b9c8: los dibujos de p45:B9C8 con los colores de p45:B9B2 en la VRAM de 0x6000
	call 06f4ah		;aadb   ; rachas_a81b: las rachas de p47:A81B
	ld de,06050h		;aade   ; en (0x50, 0x60)
	call 08cd8h		;aae1   ; a_p10_a6a4: p10:A6A4 con el banco 10 en 0xA000
	call 06c43h		;aae4   ; el sonido 0x94
	call 08535h		;aae7   ; el mosaico
	call 08c9ah		;aaea   ; la ventana en 0x4C
	ld a,001h		;aaed
	ld (0d8a8h),a		;aaef   ; guarda 1: la ventana del mensaje es estrecha (0xB8 x 0x28)
	ld (0cb14h),a		;aaf2   ; guarda el dibujo del paso de andar (0, 1, 2, 1: p02:9888)
	ld hl,0fc00h		;aaf5   ; 0xE250 = 0xFC00 (la velocidad en Y)
	ld (0e250h),hl		;aaf8
	ld h,001h		;aafb   ; 0xE252 = 0x0100 (la de X)
	ld (0e252h),hl		;aafd
e041_siguiente_e:
	ld hl,0e041h		;ab00   ; apunta a el paso de la escena en curso
	inc (hl)			;ab03
	ret			;ab04
guion_5_paso_3:		; R#7 (el borde) parpadea 0/7 cada 4 cuadros; p10:A6C2; el de 0xE240 se mueve: su velocidad en Y sube 0x80 por cuadro (cae) y en X 0xE252; al pasar de X = 0xA8: 0xE241 = 0, Snake a la derecha, R#7 = 0, el mosaico de p45:B9D8 y el paso siguiente
	ld c,007h		;ab05   ; el registro 7 (el borde)...
	ld a,(0ca03h)		;ab07   ; lee el contador de cuadros (uno mas en cada interrupcion)
	ld b,000h		;ab0a
	rra			;ab0c
	rra			;ab0d
	jr c,L_AB12		;ab0e   ; ...0 o 7 cada 4 cuadros
	ld b,007h		;ab10
L_AB12:
	call 00047h		;ab12   ; BIOS WRTVDP - Writes data in the VDP-register
	call 08ce0h		;ab15   ; p10:A6C2
	ld bc,00080h		;ab18   ; 0x80 mas a la velocidad en Y
	ld hl,(0e250h)		;ab1b
	add hl,bc			;ab1e
	ld (0e250h),hl		;ab1f
	ld de,(0e242h)		;ab22   ; la Y + la velocidad
	add hl,de			;ab26
	ld (0e242h),hl		;ab27
	ld a,h			;ab2a
	ld de,(0e252h)		;ab2b   ; la X + 0xE252
	ld hl,(0e244h)		;ab2f
	add hl,de			;ab32
	ld (0e244h),hl		;ab33
	cp 0a8h		;ab36   ; hasta X = 0xA8
	ret c			;ab38
	xor a			;ab39   ; 0xE241 = 0
	ld (0e241h),a		;ab3a   ; guarda 0 mientras Snake esta de frente en la escena (p09:A89A)
	ld a,004h		;ab3d   ; Snake a la derecha
	ld (0cb0eh),a		;ab3f   ; guarda la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ld bc,00007h		;ab42   ; el borde a 0
	call 00047h		;ab45   ; BIOS WRTVDP - Writes data in the VDP-register
	call 07121h		;ab48   ; el mosaico
	jr e041_siguiente_e		;ab4b
guion_5_paso_4:		; p10:A6C2; sin 0xE1F8, 0x80 cuadros y el paso siguiente
	call 08ce0h		;ab4d   ; a_p10_a6c2: p10:A6C2 con el banco 10 en 0xA000
	ld a,(0e1f8h)		;ab50   ; lee 1 con la ficha de p10:A6A4 en marcha (0xE1F9-0xE1FF)
	or a			;ab53
	ret nz			;ab54   ; con 0xE1F8, sigue
	ld hl,0e043h		;ab55   ; apunta a la cuenta de cuadros de la escena
	ld (hl),080h		;ab58
	jr e041_siguiente_e		;ab5a
guion_5_paso_5:		; al acabar la espera, el sonido 0xA7 y el paso siguiente
	ld hl,0e043h		;ab5c   ; apunta a la cuenta de cuadros de la escena
	dec (hl)			;ab5f
	ret nz			;ab60
	call 06bd4h		;ab61   ; sonido_a7: pide el sonido 0xA7 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	jr e041_siguiente_e		;ab64
guion_5_paso_6:		; la secuencia de p50:8024
	ld hl,08024h		;ab66
	jp secuencia_y_paso		;ab69   ; secuencia_y_paso: la secuencia de mensajes; con 0xE042 desde 4, 0xE042 = 0 y 0xE041 uno mas
guion_5_paso_7:		; quita la ventana, la ventana normal y el paso siguiente
	call 08caah		;ab6c   ; a_p03_b63e: p03:B63E con el banco 3 en 0xA000
	xor a			;ab6f
	ld (0d8a8h),a		;ab70   ; guarda 1: la ventana del mensaje es estrecha (0xB8 x 0x28)
	jr e041_siguiente_e		;ab73
guion_5_paso_8:		; cada 2 cuadros: 0xCAE4 = 0x3C y Snake anda hasta X = 0x88; alli, Snake de espaldas dandose la vuelta, 0xF0 cuadros, las rachas de p00:4E01 y el paso siguiente
	ld a,(0ca03h)		;ab75   ; lee el contador de cuadros (uno mas en cada interrupcion)
	rra			;ab78
	ret c			;ab79
	ld hl,0cae4h		;ab7a   ; 0xCAE4 = 0x3C
	ld (hl),03ch		;ab7d
	call 08cb3h		;ab7f   ; p02:8CB3
	ld a,(0cb05h)		;ab82   ; lee la X de Snake
	cp 088h		;ab85
	ret c			;ab87   ; a la izquierda, sigue
	ld a,004h		;ab88   ; de espaldas
	ld (0cb01h),a		;ab8a   ; guarda el dibujo de Snake (al darse la vuelta se le suma 1, 3 o 5 segun 0xCB00)
	ld a,001h		;ab8d
	ld (0cb16h),a		;ab8f   ; guarda 1 mientras Snake se da la vuelta
	ld a,008h		;ab92
	ld (0cb17h),a		;ab94
	ld hl,0e043h		;ab97   ; 0xF0 cuadros
	ld (hl),0f0h		;ab9a
	call 04e01h		;ab9c   ; rachas_6517_a_fc00:
	jp e041_siguiente_e		;ab9f   ; e041_siguiente_e:
guion_5_paso_9:		; al acabar la espera, la otra pagina a esta, sin sprites y el paso siguiente
	ld hl,0e043h		;aba2   ; apunta a la cuenta de cuadros de la escena
	dec (hl)			;aba5
	ret nz			;aba6
	call otra_pagina_a_esta		;aba7   ; otra_pagina_a_esta: la otra pagina entera (0xC0 x 0xC0) a esta
	call 04266h		;abaa   ; esconde_sprites_ram: llena 0xDC00-0xDC7F con 0xE0
	call 045d7h		;abad   ; esconde_sprites_vram: llena con 0xE0 128 bytes de la VRAM en 0xF600 y otros 128 en 0xF200
	jp e041_siguiente_e		;abb0   ; e041_siguiente_e:
guion_5_paso_10:		; en negro, Snake de frente, 0xE249 = 0, la paleta de p56:B914, p02:8E2E con 0 y 9, 0xD4EC = 0, los mosaicos 0 y 9 de quien habla y el paso siguiente
	call 0444fh		;abb3   ; borra_pantalla_negro: 0xC0 x 0xC0 puntos a 0 en la pagina de dibujar
	call snake_de_frente		;abb6   ; snake_de_frente: 0xE241 = 0 y Snake con el dibujo 0x0D (el suyo a 0xE254)
	xor a			;abb9
	ld (0e249h),a		;abba   ; 0xE249 = 0
	call 08ccbh		;abbd   ; paleta_b914_b_9: paleta_b914 y deja el banco 9
	xor a			;abc0
	call 08e2eh		;abc1   ; p02:8E2E
	ld a,009h		;abc4
	call 08e2eh		;abc6   ; p02:8E2E
	xor a			;abc9
	ld (0d4ech),a		;abca   ; 0xD4EC = 0
	ld b,a			;abcd
	ld de,01018h		;abce
	call 08e16h		;abd1   ; a_p03_b814: p03:B814 con el banco 3 en 0xA000
	ld a,009h		;abd4
	ld b,001h		;abd6
	ld de,09018h		;abd8
	call 08e16h		;abdb   ; a_p03_b814: p03:B814 con el banco 3 en 0xA000
	jp e041_siguiente_e		;abde   ; e041_siguiente_e:
guion_5_paso_11:		; la cuenta de 0xCAE4 (a cero, el sonido 0x9F), p03:B8AC, la secuencia de p50:8026 y, en sus mensajes 9 y 0x0A, 0xD4EC = 1 o 2
	ld hl,0cae4h		;abe1
	ld a,(hl)			;abe4
	or a			;abe5
	jr z,secuencia_8026		;abe6
	dec (hl)			;abe8   ; la cuenta...
	call z,06bb8h		;abe9   ; ...a cero, el sonido 0x9F
secuencia_8026:
	call 08e1eh		;abec   ; a_p03_b8ac: p03:B8AC con el banco 3 en 0xA000
	ld hl,08026h		;abef
	call secuencia_y_paso		;abf2   ; secuencia_y_paso: la secuencia de mensajes; con 0xE042 desde 4, 0xE042 = 0 y 0xE041 uno mas
	ld b,001h		;abf5
	ld a,(0e044h)		;abf7   ; el mensaje 9: 1...
	cp 009h		;abfa
	jr z,pon_d4ec		;abfc
	inc b			;abfe   ; ...el 0x0A: 2
	cp 00ah		;abff
	ret nz			;ac01
pon_d4ec:
	ld a,b			;ac02
	ld (0d4ech),a		;ac03
	ret			;ac06
guion_5_paso_12:		; quita los mosaicos, p03:B65D, p02:8C29, la pagina a la otra, 0xCAB6 = 0xCA8E = 0, 0xD698-0xD699 y 0xD674-0xD675 a 1, 0xCA89 = 2 y el paso siguiente
	xor a			;ac07
	call 08e26h		;ac08   ; a_p03_b866: p03:B866 con el banco 3 en 0xA000
	ld a,001h		;ac0b
	call 08e26h		;ac0d   ; a_p03_b866: p03:B866 con el banco 3 en 0xA000
	call 08ce8h		;ac10   ; a_p03_b65d: p03:B65D con el banco 3 en 0xA000
	call 08c29h		;ac13   ; p02:8C29
	call pagina_a_la_otra		;ac16   ; pagina_a_la_otra: esta pagina entera (0xC0 x 0xC0) a la otra
	xor a			;ac19
	ld (0cab6h),a		;ac1a   ; 0xCAB6 = 0...
	ld (0ca8eh),a		;ac1d   ; ...0xCA8E = 0
	inc a			;ac20
	ld hl,0d698h		;ac21   ; 0xD698-0xD699 a 1
	ld (hl),a			;ac24
	inc hl			;ac25
	ld (hl),a			;ac26
	ld hl,0d674h		;ac27   ; 0xD674-0xD675 a 1
	ld (hl),a			;ac2a
	inc hl			;ac2b
	ld (hl),a			;ac2c
	ld hl,0ca89h		;ac2d   ; 0xCA89 = 2
	ld (hl),002h		;ac30
	jp e041_siguiente_e		;ac32   ; e041_siguiente_e:
guion_5_paso_13:		; Snake en el estado de 0xCB35, sin darse la vuelta, 0xE249 = 1, hacia arriba, 0xCB14 = 1 y el paso siguiente
	ld a,(0cb35h)		;ac35
	ld (0cb00h),a		;ac38   ; guarda el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	ld (0cb01h),a		;ac3b   ; guarda el dibujo de Snake (al darse la vuelta se le suma 1, 3 o 5 segun 0xCB00)
	xor a			;ac3e
	ld (0cb16h),a		;ac3f   ; guarda 1 mientras Snake se da la vuelta
	inc a			;ac42
	ld (0e249h),a		;ac43   ; guarda la Y baja del que sigue a Snake de 0xE248
	ld (0cb0eh),a		;ac46   ; guarda la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ld (0cb14h),a		;ac49   ; guarda el dibujo del paso de andar (0, 1, 2, 1: p02:9888)
	jp e041_siguiente_e		;ac4c   ; e041_siguiente_e:
guion_5_paso_14:		; la secuencia de p50:8028
	ld hl,08028h		;ac4f
	jp secuencia_y_paso		;ac52   ; secuencia_y_paso: la secuencia de mensajes; con 0xE042 desde 4, 0xE042 = 0 y 0xE041 uno mas
guion_5_paso_15:		; quita la ventana, la ficha 0xDFD0 (Y 0x10, 0, 2) y el paso siguiente
	call 08caah		;ac55   ; a_p03_b63e: p03:B63E con el banco 3 en 0xA000
	ld a,010h		;ac58
	ld (0dfd0h),a		;ac5a   ; Y = 0x10
	xor a			;ac5d
	ld (0dfd2h),a		;ac5e
	ld a,002h		;ac61
	ld (0dfd3h),a		;ac63
	jp e041_siguiente_e		;ac66   ; e041_siguiente_e:
guion_5_paso_16:		; cada 4 cuadros 0xDFD0 baja uno (cambiando 0xDFD2, p09:AC89, y pintado, p09:AE8E) hasta la Y del de 0xE248; alli, 0x40 cuadros y el paso siguiente
	ld a,(0ca03h)		;ac69   ; lee el contador de cuadros (uno mas en cada interrupcion)
	and 003h		;ac6c
	ret nz			;ac6e
	ld hl,0dfd0h		;ac6f
	inc (hl)			;ac72   ; baja uno
	call cambia_dfd2_b		;ac73   ; cambia_dfd2_b: cada 16 cuadros el bit 0 de 0xDFD2 cambia
	call sprites_dfd0		;ac76   ; sprites_dfd0: los sprites de 0xDFD0 dos veces (X = 0x68 en 0xDC40 y X = 0x80 en 0xDC50) y los colores de los sprites 16-23
	ld a,(0dfd0h)		;ac79   ; hasta la Y del de 0xE248
	ld hl,0e24bh		;ac7c   ; apunta a la Y del que sigue a Snake de 0xE248
	cp (hl)			;ac7f
	ret nz			;ac80
	ld hl,0e043h		;ac81   ; apunta a la cuenta de cuadros de la escena
	ld (hl),040h		;ac84
	jp e041_siguiente_e		;ac86   ; e041_siguiente_e:
cambia_dfd2_b:		; cada 16 cuadros el bit 0 de 0xDFD2 cambia
	ld a,(0ca03h)		;ac89   ; lee el contador de cuadros (uno mas en cada interrupcion)
	rra			;ac8c
	rra			;ac8d
	and 003h		;ac8e
	ret nz			;ac90
	ld a,(0dfd2h)		;ac91
	xor 001h		;ac94
	ld (0dfd2h),a		;ac96
	ret			;ac99
guion_5_paso_17:		; al acabar la espera, 0xDFD3 = 1 y el paso siguiente
	ld hl,0e043h		;ac9a   ; apunta a la cuenta de cuadros de la escena
	dec (hl)			;ac9d
	ret nz			;ac9e
	ld a,001h		;ac9f
	ld (0dfd3h),a		;aca1
	jp e041_siguiente_e		;aca4   ; e041_siguiente_e:
guion_5_paso_18:		; cada 4 cuadros 0xDFD0 sube uno (pintado) y la Y del de 0xE248 tambien; al pasar de 0: 0xE249 = 0, la franja de la otra pagina (p09:ADEA) y el paso siguiente
	ld a,(0ca03h)		;aca7   ; lee el contador de cuadros (uno mas en cada interrupcion)
	and 003h		;acaa
	ret nz			;acac
	ld hl,0dfd0h		;acad
	dec (hl)			;acb0   ; sube uno
	call cambia_dfd2_b		;acb1   ; cambia_dfd2_b: cada 16 cuadros el bit 0 de 0xDFD2 cambia
	call sprites_dfd0		;acb4   ; sprites_dfd0: los sprites de 0xDFD0 dos veces (X = 0x68 en 0xDC40 y X = 0x80 en 0xDC50) y los colores de los sprites 16-23
	ld hl,0e24bh		;acb7   ; apunta a la Y del que sigue a Snake de 0xE248
	dec (hl)			;acba   ; el de 0xE248 sube
	ld a,(hl)			;acbb
	rla			;acbc   ; por encima de 0...
	ret nc			;acbd
	xor a			;acbe   ; ...0xE249 = 0
	ld (0e249h),a		;acbf   ; guarda la Y baja del que sigue a Snake de 0xE248
	call franja_de_la_otra_b		;acc2   ; franja_de_la_otra_b: la otra pagina (0xC0 x 0x62 desde (0, 0)) a esta
	jp e041_siguiente_e		;acc5   ; e041_siguiente_e:
guion_5_paso_19:		; cada cuadro una columna de 1 x 0xC0 en X = 0xE044 a negro (hasta 0x60); alli, los colores de p00:4C8B, el mosaico de p56:AE59, el paso siguiente y el sonido 0x92
	ld a,(0e044h)		;acc8   ; lee el mensaje de la secuencia en curso (p09:A4FE)
	ld l,a			;accb
	ld h,000h		;accc
	ld bc,0c001h		;acce   ; 1 x 0xC0...
	ld a,(0ca42h)		;acd1   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	ld d,a			;acd4
	xor a			;acd5   ; ...al color 0
	call 046ffh		;acd6   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
	ld hl,0e044h		;acd9   ; la columna siguiente
	inc (hl)			;acdc
	ld a,(hl)			;acdd
	cp 061h		;acde   ; hasta 0x60
	ret c			;ace0
	dec (hl)			;ace1
	call 04c8bh		;ace2   ; colores_ae19_bancos_9:
	call 08566h		;ace5   ; mosaico_ae59:
	call e041_siguiente_e		;ace8   ; e041_siguiente_e:
	jp 06c23h		;aceb   ; sonido_92: pide el sonido 0x92 (de los que tienen la partitura en un banco de musica, p16:4CE3)
guion_5_paso_20:		; cada cuadro una columna de la otra pagina de vuelta (p09:AD01), de 0x60 a 0; alli, el sonido 0xA1 y el paso siguiente
	call columna_de_la_otra		;acee   ; columna_de_la_otra: la columna 0xE044 (1 x 0xC0) de la otra pagina a esta
	ld hl,0e044h		;acf1   ; apunta a el mensaje de la secuencia en curso (p09:A4FE)
	dec (hl)			;acf4
	ld a,(hl)			;acf5   ; hasta pasar de 0
	cp 0ffh		;acf6
	ret nz			;acf8
	ld (hl),000h		;acf9
	call 06b75h		;acfb   ; sonido_a1: pide el sonido 0xA1 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	jp e041_siguiente_e		;acfe   ; e041_siguiente_e:
columna_de_la_otra:		; la columna 0xE044 (1 x 0xC0) de la otra pagina a esta
	ld a,(0e044h)		;ad01   ; lee el mensaje de la secuencia en curso (p09:A4FE)
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
guion_5_paso_21:		; con 0xC692: a cero, el sonido 0x84 y el paso siguiente
	ld hl,0c692h		;ad1a
	ld a,(hl)			;ad1d
	or a			;ad1e
	ret z			;ad1f   ; sin 0xC692, nada
	ld (hl),000h		;ad20
	call 06bcch		;ad22   ; sonido_84: pide el sonido 0x84 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	jp e041_siguiente_e		;ad25   ; e041_siguiente_e:
guion_5_paso_22:		; la secuencia de p50:802A
	ld hl,0802ah		;ad28
	jp secuencia_y_paso		;ad2b   ; secuencia_y_paso: la secuencia de mensajes; con 0xE042 desde 4, 0xE042 = 0 y 0xE041 uno mas
guion_5_paso_23:		; quita la ventana, en negro y el paso siguiente
	call 08caah		;ad2e   ; a_p03_b63e: p03:B63E con el banco 3 en 0xA000
	call 0444fh		;ad31   ; borra_pantalla_negro: 0xC0 x 0xC0 puntos a 0 en la pagina de dibujar
	jp e041_siguiente_e		;ad34   ; e041_siguiente_e:
guion_5_paso_24:		; Snake de frente, la paleta de p56:B914, p02:8E2E con 0 y 8, los mosaicos 0 y 8 de quien habla y el paso siguiente
	call snake_de_frente		;ad37   ; snake_de_frente: 0xE241 = 0 y Snake con el dibujo 0x0D (el suyo a 0xE254)
	call 08ccbh		;ad3a   ; paleta_b914_b_9: paleta_b914 y deja el banco 9
	xor a			;ad3d
	call 08e2eh		;ad3e   ; p02:8E2E
	ld a,008h		;ad41
	call 08e2eh		;ad43   ; p02:8E2E
	xor a			;ad46
	ld b,a			;ad47
	ld de,01018h		;ad48
	call 08e16h		;ad4b   ; a_p03_b814: p03:B814 con el banco 3 en 0xA000
	ld a,008h		;ad4e
	ld b,001h		;ad50
	ld de,09018h		;ad52
	call 08e16h		;ad55   ; a_p03_b814: p03:B814 con el banco 3 en 0xA000
	jp e041_siguiente_e		;ad58   ; e041_siguiente_e:
guion_5_paso_25:		; p03:B8AC y la secuencia de p50:802C
	call 08e1eh		;ad5b   ; a_p03_b8ac: p03:B8AC con el banco 3 en 0xA000
	ld hl,0802ch		;ad5e   ; la secuencia de p50:802C
	jp secuencia_y_paso		;ad61   ; secuencia_y_paso: la secuencia de mensajes; con 0xE042 desde 4, 0xE042 = 0 y 0xE041 uno mas
guion_5_paso_26:		; quita los mosaicos, p03:B65D, p02:8C29, p02:8D1D, los mosaicos de p56:AE3B y p45:B9D8, la pagina a la otra y el paso siguiente
	xor a			;ad64
	call 08e26h		;ad65   ; a_p03_b866: p03:B866 con el banco 3 en 0xA000
	ld a,001h		;ad68
	call 08e26h		;ad6a   ; a_p03_b866: p03:B866 con el banco 3 en 0xA000
	call 08ce8h		;ad6d   ; a_p03_b65d: p03:B65D con el banco 3 en 0xA000
	call 08c29h		;ad70   ; p02:8C29
	call 08d1dh		;ad73   ; p02:8D1D
	call 08547h		;ad76   ; mosaico_ae3b_b_bancos_9:
	call 07129h		;ad79   ; mosaico_b9d8_f7: el mosaico de p45:B9D8 con la forma 7 de la franja 3
	call pagina_a_la_otra		;ad7c   ; pagina_a_la_otra: esta pagina entera (0xC0 x 0xC0) a la otra
	jp e041_siguiente_e		;ad7f   ; e041_siguiente_e:
guion_5_paso_27:		; la ventana arriba, Snake con el dibujo de 0xE254 hacia la izquierda, el paso siguiente, el sonido 0x96 y p12:6D78
	call 08c92h		;ad82   ; a_p03_b603: p03:B603 con el banco 3 en 0xA000
	ld a,(0e254h)		;ad85   ; lee el dibujo de Snake de antes de ponerlo de frente (p09:A89A)
	ld hl,0cb01h		;ad88   ; apunta a el dibujo de Snake (al darse la vuelta se le suma 1, 3 o 5 segun 0xCB00)
	ld (hl),a			;ad8b
	ld a,003h		;ad8c
	ld (0cb0eh),a		;ad8e   ; guarda la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	call e041_siguiente_e		;ad91   ; e041_siguiente_e:
	call 06cbeh		;ad94   ; sonido_96: pide el sonido 0x96 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	jp 05f51h		;ad97   ; a_p12_6d78_b_9: a_p12_6d78 y deja el banco 9
guion_5_paso_28:		; cada 2 cuadros Snake anda hasta X = 0x74; alli, hacia arriba y el paso siguiente
	ld a,(0ca03h)		;ad9a   ; lee el contador de cuadros (uno mas en cada interrupcion)
	rra			;ad9d
	ret c			;ad9e
	call 08cb3h		;ad9f   ; p02:8CB3
	ld a,(0cb05h)		;ada2   ; lee la X de Snake
	cp 074h		;ada5
	ret nc			;ada7
	ld a,001h		;ada8
	ld (0cb0eh),a		;adaa   ; guarda la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	jp e041_siguiente_e		;adad   ; e041_siguiente_e:
guion_5_paso_29:		; cada 2 cuadros Snake anda hasta Y = 0x80; alli, el paso siguiente
	ld a,(0ca03h)		;adb0   ; lee el contador de cuadros (uno mas en cada interrupcion)
	rra			;adb3
	ret c			;adb4
	call 08cb3h		;adb5   ; p02:8CB3
	ld a,(0cb03h)		;adb8   ; lee la Y de Snake
	cp 080h		;adbb
	ret nc			;adbd
	jp e041_siguiente_e		;adbe   ; e041_siguiente_e:
guion_5_paso_30:		; la secuencia de p50:802E
	ld hl,0802eh		;adc1
	jp secuencia_y_paso		;adc4   ; secuencia_y_paso: la secuencia de mensajes; con 0xE042 desde 4, 0xE042 = 0 y 0xE041 uno mas
guion_5_paso_31:		; fin: quita la ventana, los dibujos de la sala, 0xE040 = 0, nadie detras (0xCAA0, 0xE248 y 0xE240 a cero), la fase 5, el bit 0 de 0xD7DA, el estado que toca y p02:8E81
	call 08caah		;adc7   ; a_p03_b63e: p03:B63E con el banco 3 en 0xA000
	call 08cf0h		;adca   ; dibujos_de_sala_b_9: dibujos_de_sala y deja el banco 9
	xor a			;adcd
	ld (0e040h),a		;adce   ; guarda la escena en curso (1-9, 0 = ninguna; p09:A4A6, guiones en p09:A5D4)
	ld (0caa0h),a		;add1   ; guarda cuantos siguen a Snake por su rastro (1-4)
	ld (0e248h),a		;add4   ; guarda la ficha del que sigue a Snake 12 posiciones por detras (0xE0A4)
	ld (0e240h),a		;add7   ; guarda la ficha del que sigue a Snake 4 posiciones por detras (del rastro de 0xE08C)
	ld a,005h		;adda   ; la fase 5
	ld (0ca22h),a		;addc   ; guarda la fase de la partida (indice de las listas de p06:B40C)
	ld hl,0d7dah		;addf   ; el bit 0 de 0xD7DA
	set 0,(hl)		;ade2
	call 098bfh		;ade4   ; estado_que_toca: el estado que toca (p02:98F0) a 0xCB00
	jp 08e81h		;ade7   ; p02:8E81
franja_de_la_otra_b:		; la otra pagina (0xC0 x 0x62 desde (0, 0)) a esta
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
sprites_e050:		; los sprites de las fichas de 0xE050, 0xE054 y 0xE058 (p09:AEA6) en 0xDC28, 0xDC38 y 0xDC48 y los colores de los sprites 10-21 de las rachas de p08:BA97, p08:BAA4, p08:BAB2 y p08:BAB5
	ld bc,0dc28h		;adfe
	ld hl,0e050h		;ae01   ; la ficha 0xE050...
	call sprite_de_ficha		;ae04   ; sprite_de_ficha: la ficha de HL (4 bytes) a 0xDFD0 y sus cuatro sprites en BC: Y - 0x20, X - 8, patrones de 0x40, 0x58, 0x70 u 0x88 segun 0xDFD3 (1-4)
	ld bc,0dc38h		;ae07
	ld hl,0e054h		;ae0a   ; ...la 0xE054...
	call sprite_de_ficha		;ae0d   ; sprite_de_ficha: la ficha de HL (4 bytes) a 0xDFD0 y sus cuatro sprites en BC: Y - 0x20, X - 8, patrones de 0x40, 0x58, 0x70 u 0x88 segun 0xDFD3 (1-4)
	ld bc,0dc48h		;ae10
	ld hl,0e058h		;ae13   ; ...la 0xE058
	call sprite_de_ficha		;ae16   ; sprite_de_ficha: la ficha de HL (4 bytes) a 0xDFD0 y sus cuatro sprites en BC: Y - 0x20, X - 8, patrones de 0x40, 0x58, 0x70 u 0x88 segun 0xDFD3 (1-4)
	ld de,0ba97h		;ae19   ; sus colores
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
sprites_dfd0_b:		; los cuatro sprites de 0xDFD0 en 0xDC50 (p09:AED4) y los colores de los sprites 20-23 (p09:AF28)
	ld hl,0dc50h		;ae85
	call sprites_de_dfd0		;ae88   ; sprites_de_dfd0: los cuatro sprites de 0xDFD0 en HL: Y - 0x20, X - 8, patrones 0x80 (0xDFD3 = 1) o 0x98
	jp colores_20_23		;ae8b   ; colores_20_23: los colores de los sprites 20-23 (0xDB40-0xDB7F)
sprites_dfd0:		; los sprites de 0xDFD0 dos veces (X = 0x68 en 0xDC40 y X = 0x80 en 0xDC50) y los colores de los sprites 16-23
	ld hl,0dc40h		;ae8e
	ld a,068h		;ae91   ; X = 0x68
	ld (0dfd1h),a		;ae93
	call sprites_de_dfd0		;ae96   ; sprites_de_dfd0: los cuatro sprites de 0xDFD0 en HL: Y - 0x20, X - 8, patrones 0x80 (0xDFD3 = 1) o 0x98
	ld hl,0dc50h		;ae99
	ld a,080h		;ae9c   ; X = 0x80
	ld (0dfd1h),a		;ae9e
	call sprites_de_dfd0		;aea1   ; sprites_de_dfd0: los cuatro sprites de 0xDFD0 en HL: Y - 0x20, X - 8, patrones 0x80 (0xDFD3 = 1) o 0x98
	jr colores_16_23		;aea4
sprite_de_ficha:		; la ficha de HL (4 bytes) a 0xDFD0 y sus cuatro sprites en BC: Y - 0x20, X - 8, patrones de 0x40, 0x58, 0x70 u 0x88 segun 0xDFD3 (1-4)
	push bc			;aea6
	ld de,0dfd0h		;aea7   ; a 0xDFD0
	ld bc,00004h		;aeaa
	ldir		;aead
	pop hl			;aeaf
	ld a,(0dfd0h)		;aeb0   ; la Y - 0x20
	sub 020h		;aeb3
	ld e,a			;aeb5
	ld a,(0dfd1h)		;aeb6   ; la X - 8
	sub 008h		;aeb9
	ld d,a			;aebb
	ld a,(0dfd3h)		;aebc   ; segun 0xDFD3...
	dec a			;aebf
	ld c,040h		;aec0   ; ...1: 0x40...
	jr z,cuatro_sprites		;aec2
	dec a			;aec4
	ld c,058h		;aec5   ; ...2: 0x58...
	jr z,cuatro_sprites		;aec7
	dec a			;aec9
	ld c,070h		;aeca   ; ...3: 0x70...
	jr z,cuatro_sprites		;aecc
	dec a			;aece
	ld c,088h		;aecf   ; ...4: 0x88
	jr z,cuatro_sprites		;aed1
	ret			;aed3
sprites_de_dfd0:		; los cuatro sprites de 0xDFD0 en HL: Y - 0x20, X - 8, patrones 0x80 (0xDFD3 = 1) o 0x98
	ld a,(0dfd0h)		;aed4
	sub 020h		;aed7   ; la Y - 0x20
	ld e,a			;aed9
	ld a,(0dfd1h)		;aeda
	sub 008h		;aedd   ; la X - 8
	ld d,a			;aedf
	ld a,(0dfd3h)		;aee0
	dec a			;aee3
	ld c,080h		;aee4   ; 0xDFD3 = 1: el patron 0x80...
	jr z,cuatro_sprites		;aee6
	ld c,098h		;aee8   ; ...si no, 0x98
cuatro_sprites:		; dos sprites (C y C + 4) y, 0x10 mas abajo, otros dos (C + 8 + 4 con 0xDFD2 y C + 0x0C...)
	call 05d41h		;aeea   ; pon_sprite: [E][D][C] en (HL): la Y, la X y el patron de un sprite de 0xDC00
	call 05d3dh		;aeed   ; pon_sprite_mas_4: p00:5D41 con el patron C + 4
	ld a,e			;aef0   ; 0x10 mas abajo
	add a,010h		;aef1
	ld e,a			;aef3
	ld a,(0dfd2h)		;aef4   ; con 0xDFD2...
	or a			;aef7
	jr z,patron_de_abajo		;aef8
	ld a,008h		;aefa   ; ...8 patrones mas
patron_de_abajo:
	add a,c			;aefc
	ld c,a			;aefd
	call 05d3dh		;aefe   ; pon_sprite_mas_4: p00:5D41 con el patron C + 4
	jp 05d3dh		;af01   ; pon_sprite_mas_4: p00:5D41 con el patron C + 4
colores_16_23:		; los colores de los sprites 16-23 (0xDB00-0xDB7F)
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
colores_20_23:		; los colores de los sprites 20-23 (0xDB40-0xDB7F)
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
sprite_e25b:		; dos sprites en (0xE25B, 0x6C) con el patron 0xE0 (0xDC28) y sus colores 8 y 0x4A
	call sprite_e25b_b		;af4c   ; sprite_e25b_b:
	jr colores_8_4a		;af4f
sprite_e25b_b:
	ld hl,0dc28h		;af51
	ld a,(0e25bh)		;af54
	ld e,a			;af57
	ld d,06ch		;af58
	ld c,0e0h		;af5a
	call 05d41h		;af5c   ; pon_sprite: [E][D][C] en (HL): la Y, la X y el patron de un sprite de 0xDC00
	jp 05d3dh		;af5f   ; pon_sprite_mas_4: p00:5D41 con el patron C + 4
colores_8_4a:		; los colores del sprite 10 al 8 y los del 11 al 0x4A
	ld hl,0daa0h		;af62
	ld a,008h		;af65
	ld bc,0000fh		;af67
	call 04237h		;af6a   ; llena_bloque: pone A en BC + 1 bytes desde HL
	inc hl			;af6d
	ld a,04ah		;af6e
	ld bc,0000fh		;af70
	jp 04237h		;af73   ; llena_bloque: pone A en BC + 1 bytes desde HL
guion_6:		; la escena 6 por su paso 0xE041 (p09:AF7C, 14 pasos)
	ld a,(0e041h)		;af76   ; lee el paso de la escena en curso
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


guion_6_paso_0:		; 0xCB14 = 1, 0x80 cuadros, el paso siguiente y la orden 0xF4
	ld a,001h		;af98
	ld (0cb14h),a		;af9a   ; guarda el dibujo del paso de andar (0, 1, 2, 1: p02:9888)
	ld hl,0e043h		;af9d   ; apunta a la cuenta de cuadros de la escena
	ld (hl),080h		;afa0
	call e041_siguiente_f		;afa2   ; e041_siguiente_f:
	jp 06be4h		;afa5   ; orden_sonido_f4: la orden 0xF4 al sonido
guion_6_paso_1:		; al acabar la espera: la otra pagina a esta, en negro, 0xDFD9 = 0, Snake de frente y el paso siguiente
	ld hl,0e043h		;afa8   ; apunta a la cuenta de cuadros de la escena
	dec (hl)			;afab
	ret nz			;afac
	call otra_pagina_a_esta		;afad   ; otra_pagina_a_esta: la otra pagina entera (0xC0 x 0xC0) a esta
	call 0444fh		;afb0   ; borra_pantalla_negro: 0xC0 x 0xC0 puntos a 0 en la pagina de dibujar
	xor a			;afb3
	ld (0dfd9h),a		;afb4
	call dibujo_0d		;afb7   ; dibujo_0d:
e041_siguiente_f:
	ld hl,0e041h		;afba   ; apunta a el paso de la escena en curso
	inc (hl)			;afbd
	ret			;afbe
guion_6_paso_2:		; la paleta de p56:B914, los mosaicos de quien habla 0 y 4, el sonido 0x9E y el paso siguiente
	call 08ccbh		;afbf   ; paleta_b914_b_9: paleta_b914 y deja el banco 9
	xor a			;afc2
	call 08e2eh		;afc3   ; p02:8E2E
	ld a,004h		;afc6
	call 08e2eh		;afc8   ; p02:8E2E
	xor a			;afcb
	ld b,a			;afcc
	ld de,01018h		;afcd
	call 08e16h		;afd0   ; a_p03_b814: p03:B814 con el banco 3 en 0xA000
	ld a,004h		;afd3
	ld b,001h		;afd5
	ld de,09018h		;afd7
	call 08e16h		;afda   ; a_p03_b814: p03:B814 con el banco 3 en 0xA000
	call 06bb4h		;afdd   ; sonido_9e: pide el sonido 0x9E (de los que tienen la partitura en un banco de musica, p16:4CE3)
	jr e041_siguiente_f		;afe0
guion_6_paso_3:		; p03:B8AC y la secuencia de p50:8034
	call 08e1eh		;afe2   ; a_p03_b8ac: p03:B8AC con el banco 3 en 0xA000
	ld hl,08034h		;afe5
	jp secuencia_y_paso		;afe8   ; secuencia_y_paso: la secuencia de mensajes; con 0xE042 desde 4, 0xE042 = 0 y 0xE041 uno mas
guion_6_paso_4:		; quita los mosaicos, p03:B65D, p02:8C29, la pagina a la otra y el paso siguiente
	xor a			;afeb
	call 08e26h		;afec   ; a_p03_b866: p03:B866 con el banco 3 en 0xA000
	ld a,001h		;afef
	call 08e26h		;aff1   ; a_p03_b866: p03:B866 con el banco 3 en 0xA000
	call 08ce8h		;aff4   ; a_p03_b65d: p03:B65D con el banco 3 en 0xA000
	call 08c29h		;aff7   ; p02:8C29
	call pagina_a_la_otra		;affa   ; pagina_a_la_otra: esta pagina entera (0xC0 x 0xC0) a la otra
	jr e041_siguiente_f		;affd
guion_6_paso_5:		; p12:6D78, Snake en (0x70, 0x50) a la derecha, 0xDFDE = 3, 0xDFD9 = 1, Snake como antes, la ventana arriba y el paso siguiente
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
	call dibujo_de_e254		;b01b   ; dibujo_de_e254:
	call 08c92h		;b01e   ; a_p03_b603: p03:B603 con el banco 3 en 0xA000
	jr e041_siguiente_f		;b021
guion_6_paso_6:		; la secuencia de p50:8030
	ld hl,08030h		;b023
	jp secuencia_y_paso		;b026   ; secuencia_y_paso: la secuencia de mensajes; con 0xE042 desde 4, 0xE042 = 0 y 0xE041 uno mas
guion_6_paso_7:		; quita la ventana, 0xD690-0xD691 a 1, 0xDFDE = 0xDFD8 = 2 y el paso siguiente
	call 08caah		;b029   ; a_p03_b63e: p03:B63E con el banco 3 en 0xA000
	ld a,001h		;b02c
	ld hl,0d690h		;b02e
	ld (hl),a			;b031
	inc hl			;b032
	ld (hl),a			;b033
	ld a,002h		;b034
	ld (0dfdeh),a		;b036
	ld (0dfd8h),a		;b039
	jp e041_siguiente_f		;b03c   ; e041_siguiente_f:
guion_6_paso_8:		; cuando la Y de 0xDFDB llega a 0x98, 0xDFDE = 3 y el paso siguiente
	ld a,(0dfdbh)		;b03f
	cp 098h		;b042
	ret c			;b044
	ld a,003h		;b045
	ld (0dfdeh),a		;b047
	jp e041_siguiente_f		;b04a   ; e041_siguiente_f:
guion_6_paso_9:		; Snake mira al de 0xDFDD (hacia abajo con su X en 0x20-0x4F, a la izquierda en 0x19-0x1F); por debajo de 0x19, 0xDFD8 = 1 y el paso siguiente
	ld a,(0dfddh)		;b04d
	cp 019h		;b050   ; por debajo de 0x19: llegado
	jr c,dfd8_a_1		;b052
	cp 050h		;b054
	ret nc			;b056   ; desde 0x50, nada
	ld b,002h		;b057   ; 0x20-0x4F: hacia abajo...
	cp 020h		;b059
	jr nc,pon_direccion_snake		;b05b
	ld b,003h		;b05d   ; ...0x19-0x1F: a la izquierda
pon_direccion_snake:
	ld a,b			;b05f
	ld (0cb0eh),a		;b060   ; guarda la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ret			;b063
dfd8_a_1:
	ld a,001h		;b064
	ld (0dfd8h),a		;b066
	jp e041_siguiente_f		;b069   ; e041_siguiente_f:
guion_6_paso_10:		; la secuencia de p50:8032 y 0xDFDE = 4
	ld hl,08032h		;b06c
	call secuencia_y_paso		;b06f   ; secuencia_y_paso: la secuencia de mensajes; con 0xE042 desde 4, 0xE042 = 0 y 0xE041 uno mas
	ld a,004h		;b072
	ld (0dfdeh),a		;b074
	ret			;b077
guion_6_paso_11:		; quita la ventana, 0xDFDE = 3, 0xDFD8 = 2 y el paso siguiente
	call 08caah		;b078   ; a_p03_b63e: p03:B63E con el banco 3 en 0xA000
	ld a,003h		;b07b
	ld (0dfdeh),a		;b07d
	ld a,002h		;b080
	ld (0dfd8h),a		;b082
	jp e041_siguiente_f		;b085   ; e041_siguiente_f:
guion_6_paso_12:		; cuando 0xDFDD baja de 0x0A, 0xDFD9 = 0 y el paso siguiente
	ld a,(0dfddh)		;b088
	cp 00ah		;b08b
	ret nc			;b08d
	xor a			;b08e
	ld (0dfd9h),a		;b08f
	jp e041_siguiente_f		;b092   ; e041_siguiente_f:
guion_6_paso_13:		; fin: 0xDFD8 = 0xE040 = 0, las rachas, el bit 4 de 0xD7E4, 0xD7A3 = 0x76, p02:8E81, la musica pendiente ya y la orden 0xF6
	xor a			;b095
	ld (0dfd8h),a		;b096
	ld (0e040h),a		;b099   ; guarda la escena en curso (1-9, 0 = ninguna; p09:A4A6, guiones en p09:A5D4)
	call rachas_9638_y_b34a		;b09c   ; rachas_9638_y_b34a: las rachas de p37:9638 y, con 0xCB21 = 1, las de p37:B34A
	ld hl,0d7e4h		;b09f
	set 4,(hl)		;b0a2
	ld hl,0d7a3h		;b0a4
	ld (hl),076h		;b0a7
	call 08e81h		;b0a9   ; p02:8E81
	ld hl,0ca18h		;b0ac   ; apunta a la espera hasta poner la musica pendiente
	ld (hl),0ffh		;b0af
	jp 06be8h		;b0b1   ; orden_sonido_f6: la orden 0xF6 al sonido
guion_7:		; la escena 7: p15:A316 y su paso 0xE041 (p09:B0BD, 14 pasos)
	call 08e33h		;b0b4   ; a_p15_a316: p15:A316 con el banco 15 en 0xA000
	ld a,(0e041h)		;b0b7   ; lee el paso de la escena en curso
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


guion_7_paso_0:		; 0xD509 = 1 y el paso siguiente
	ld a,001h		;b0d9
	ld (0d509h),a		;b0db
	jr e041_siguiente_g		;b0de
guion_7_paso_1:		; con 0xD501 = 2: cada 8 cuadros cambia 0xDFD2 y 0xDFD0 baja uno, pintado (p09:AE85), hasta 0xB0; alli, el sonido 0x8C, el recuadro de p09:B10F, 0x80 cuadros y el paso siguiente
	ld a,(0d501h)		;b0e0
	cp 002h		;b0e3
	ret nz			;b0e5
	ld a,(0ca03h)		;b0e6   ; lee el contador de cuadros (uno mas en cada interrupcion)
	and 007h		;b0e9
	jr nz,dfd0_baja		;b0eb
	ld a,(0dfd2h)		;b0ed
	xor 001h		;b0f0
	ld (0dfd2h),a		;b0f2
dfd0_baja:
	ld hl,0dfd0h		;b0f5
	dec (hl)			;b0f8
	ld a,(hl)			;b0f9
	cp 0b0h		;b0fa
	jp nc,sprites_dfd0_b		;b0fc   ; sprites_dfd0_b: los cuatro sprites de 0xDFD0 en 0xDC50 (p09:AED4) y los colores de los sprites 20-23 (p09:AF28)
	call 06b99h		;b0ff   ; sonido_8c: pide el sonido 0x8C (de los que tienen la partitura en un banco de musica, p16:4CE3) (antes, L_6CDA)
	call recuadro_b14d		;b102   ; recuadro_b14d: guarda 0x38 x 0x10 de (0x44, 0x48), un recuadro (0x99, marco 7) y el letrero de p09:B14D en (0x48, 0x4C)
	ld hl,0e043h		;b105   ; apunta a la cuenta de cuadros de la escena
	ld (hl),080h		;b108
e041_siguiente_g:
	ld hl,0e041h		;b10a   ; apunta a el paso de la escena en curso
	inc (hl)			;b10d
	ret			;b10e
recuadro_b14d:		; guarda 0x38 x 0x10 de (0x44, 0x48), un recuadro (0x99, marco 7) y el letrero de p09:B14D en (0x48, 0x4C)
	ld hl,04448h		;b10f
	ld bc,03810h		;b112
	push hl			;b115
	push bc			;b116
	call de_la_otra_aqui		;b117   ; de_la_otra_aqui: el rectangulo de HL de la otra pagina a esta
	pop bc			;b11a
	pop hl			;b11b
	call recuadro_b		;b11c   ; recuadro_b: el rectangulo de HL (BC) al color 0x99 y un marco de color 7
	ld hl,0b14dh		;b11f
	ld de,0484ch		;b122
	jp 04950h		;b125   ; letrero: pinta las letras de HL en DE hasta 0xFF (0xFE salta de linea)
de_la_otra_aqui:		; el rectangulo de HL de la otra pagina a esta
	ld d,h			;b128
	ld e,l			;b129
	jp 0474dh		;b12a   ; copia_rectangulo_a_esta: p00:4767 de la otra pagina (0xCA42 ^ 1) a la de 0xCA42
recuadro_de_vuelta:		; 0x38 x 0x10 de (0x44, 0x48) de esta pagina a la otra
	ld hl,04448h		;b12d
	ld d,h			;b130
	ld e,l			;b131
	ld bc,03810h		;b132
	jp 0475ah		;b135   ; copia_rectangulo_a_la_otra: p00:4767 de la pagina 0xCA42 a la otra
recuadro_b:		; el rectangulo de HL (BC) al color 0x99 y un marco de color 7
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


guion_7_paso_2:		; al acabar la espera: el rastro de Snake rehecho (p09:B2D4), el recuadro de vuelta, la ventana arriba y el paso siguiente
	ld hl,0e043h		;b153   ; apunta a la cuenta de cuadros de la escena
	dec (hl)			;b156
	ret nz			;b157
	call rastro_rehecho		;b158   ; el rastro
	call recuadro_de_vuelta		;b15b   ; el recuadro de vuelta
	call 08c92h		;b15e   ; a_p03_b603: p03:B603 con el banco 3 en 0xA000
	jr $-87		;b161
guion_7_paso_3:		; la secuencia de p50:8036
	ld hl,08036h		;b163
	jp secuencia_y_paso		;b166   ; secuencia_y_paso: la secuencia de mensajes; con 0xE042 desde 4, 0xE042 = 0 y 0xE041 uno mas
guion_7_paso_4:		; quita la ventana, la ventana en 0x4C, Snake hacia abajo, 8 cuadros y el paso siguiente
	call 08caah		;b169   ; a_p03_b63e: p03:B63E con el banco 3 en 0xA000
	call 08c9ah		;b16c   ; a_p03_b5ff: p03:B5FF con el banco 3 en 0xA000
	ld a,002h		;b16f
	ld (0cb0eh),a		;b171   ; guarda la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ld hl,0e043h		;b174   ; apunta a la cuenta de cuadros de la escena
	ld (hl),008h		;b177
	jr $-111		;b179
guion_7_paso_5:		; al acabar la espera: 0x30 cuadros, los sprites 20-23 fuera, la ficha 0xDFD8 en el sitio de 0xDFD0 (1 x 1), las rachas de p01:864A y el paso siguiente
	ld hl,0e043h		;b17b   ; apunta a la cuenta de cuadros de la escena
	dec (hl)			;b17e
	ret nz			;b17f
	ld (hl),030h		;b180   ; 0x30 cuadros
	ld hl,0dc50h		;b182   ; los sprites 20-23 fuera
	ld a,0e0h		;b185
	ld bc,0000fh		;b187
	call 04237h		;b18a   ; llena_bloque: pone A en BC + 1 bytes desde HL
	ld hl,0dfd0h		;b18d   ; el sitio de 0xDFD0
	ld e,(hl)			;b190
	inc l			;b191
	ld d,(hl)			;b192
	ld hl,0dfd8h		;b193
	ld bc,00101h		;b196   ; la ficha 0xDFD8
	call pon_ficha_c		;b199   ; pon_ficha_c: la ficha de HL: [C][1][0][E][0][D][B][0]
	call 0864ah		;b19c   ; rachas_b3a6:
	jp e041_siguiente_g		;b19f   ; e041_siguiente_g:
guion_7_paso_6:		; al acabar la espera: la otra pagina a esta, en negro, 0xDFD9 = 0, Snake de frente y el paso siguiente
	ld hl,0e043h		;b1a2   ; apunta a la cuenta de cuadros de la escena
	dec (hl)			;b1a5
	ret nz			;b1a6
	call otra_pagina_a_esta		;b1a7   ; otra_pagina_a_esta: la otra pagina entera (0xC0 x 0xC0) a esta
	call 0444fh		;b1aa   ; borra_pantalla_negro: 0xC0 x 0xC0 puntos a 0 en la pagina de dibujar
	xor a			;b1ad
	ld (0dfd9h),a		;b1ae
	call dibujo_0d		;b1b1   ; dibujo_0d:
	jp e041_siguiente_g		;b1b4   ; e041_siguiente_g:
guion_7_paso_7:		; la paleta de p56:B914, los mosaicos de quien habla 0 y 4, el sonido 0x9E y el paso siguiente
	call 08ccbh		;b1b7   ; paleta_b914_b_9: paleta_b914 y deja el banco 9
	xor a			;b1ba
	call 08e2eh		;b1bb   ; p02:8E2E
	ld a,004h		;b1be
	call 08e2eh		;b1c0   ; p02:8E2E
	xor a			;b1c3
	ld b,a			;b1c4
	ld de,01018h		;b1c5
	call 08e16h		;b1c8   ; a_p03_b814: p03:B814 con el banco 3 en 0xA000
	ld a,004h		;b1cb
	ld b,001h		;b1cd
	ld de,09018h		;b1cf
	call 08e16h		;b1d2   ; a_p03_b814: p03:B814 con el banco 3 en 0xA000
	call 06bb4h		;b1d5   ; sonido_9e: pide el sonido 0x9E (de los que tienen la partitura en un banco de musica, p16:4CE3)
	jp e041_siguiente_g		;b1d8   ; e041_siguiente_g:
guion_7_paso_8:		; p03:B8AC y la secuencia de p50:8038
	call 08e1eh		;b1db   ; a_p03_b8ac: p03:B8AC con el banco 3 en 0xA000
	ld hl,08038h		;b1de
	jp secuencia_y_paso		;b1e1   ; secuencia_y_paso: la secuencia de mensajes; con 0xE042 desde 4, 0xE042 = 0 y 0xE041 uno mas
guion_7_paso_9:		; quita los mosaicos, p03:B65D, la conversacion de p01:63D8, 0xD7BB = 1, p09:B68E, 0xC68E = 0xD501 = 0xD595 = 0, el estado de la partida al paso 4 y el paso siguiente
	xor a			;b1e4
	call 08e26h		;b1e5   ; a_p03_b866: p03:B866 con el banco 3 en 0xA000
	ld a,001h		;b1e8
	call 08e26h		;b1ea   ; a_p03_b866: p03:B866 con el banco 3 en 0xA000
	call 08ce8h		;b1ed   ; a_p03_b65d: p03:B65D con el banco 3 en 0xA000
	call 063d8h		;b1f0   ; conversacion_800a:
	ld a,001h		;b1f3
	ld (0d7bbh),a		;b1f5   ; guarda 1: la pantalla de conversacion la abre una escena (llama sola, p09:B8AB)
	call pantalla_de_conversacion		;b1f8   ; pantalla_de_conversacion: la pantalla de la conversacion: los dibujos de p46:9EB2, los mosaicos de quien habla (p09:B75F), R#7 = 0x0F, 0xDF80 a cero, a cero 0xD793, 0xDFEC, 0xD79A-0xD79B, 0xD7B4-0xD7B5, 0xCABE, 0xCADD, 0xCA86, 0xCB71, 0xCB77 y 0xCB52; 0xCABD = 0xE255 = 1, la ventana estrecha, la fase a 0xCB7F, 0xCB5D (1 con la escena 9 y 0xCB5E = 0xC0), 0xD795 = 0xD7B6 = 3, 0xD796-0xD799 a cero, con 0xD7BB p09:BEB5; sin sprites, la pantalla en negro, el mosaico de p47:A719 y lo demas de p09:BD91, BA1E y BA35
	xor a			;b1fb   ; 0xC68E...
	ld (0c68eh),a		;b1fc
	ld (0d501h),a		;b1ff   ; ...0xD501...
	ld (0d595h),a		;b202   ; ...y 0xD595 a cero
	ld a,004h		;b205
	ld (0ca01h),a		;b207   ; guarda el paso del estado de la partida
	jp e041_siguiente_g		;b20a   ; e041_siguiente_g:
guion_7_paso_10:		; la orden 0xF6, 0xCAE4 = 0x96, 0xDFD9 = 1, Snake como antes, la ventana arriba y el paso siguiente
	call 06be8h		;b20d   ; orden_sonido_f6: la orden 0xF6 al sonido
	ld hl,0cae4h		;b210   ; 0xCAE4 = 0x96
	ld (hl),096h		;b213
	ld a,001h		;b215
	ld (0dfd9h),a		;b217
	call dibujo_de_e254		;b21a   ; dibujo_de_e254:
	call 08c92h		;b21d   ; a_p03_b603: p03:B603 con el banco 3 en 0xA000
	jp e041_siguiente_g		;b220   ; e041_siguiente_g:
guion_7_paso_11:		; la cuenta de 0xCAE4 y la secuencia de p50:803A
	call cuenta_cae4		;b223   ; cuenta_cae4: con 0xCAE4, uno menos; a cero, los sonidos 5 y 0x72
	ld hl,0803ah		;b226
	jp secuencia_y_paso		;b229   ; secuencia_y_paso: la secuencia de mensajes; con 0xE042 desde 4, 0xE042 = 0 y 0xE041 uno mas
guion_7_paso_12:		; la cuenta, quita la ventana, Snake en el estado 1 hacia arriba (tambien 0xCB35), 0xDFD8 = 3, cuatro detras (0xCAA0 = 4), 0x18 x 0x10 en (0xE0, 0x88) a 0 y el paso siguiente
	call cuenta_cae4		;b22c   ; cuenta_cae4: con 0xCAE4, uno menos; a cero, los sonidos 5 y 0x72
	call 08caah		;b22f   ; a_p03_b63e: p03:B63E con el banco 3 en 0xA000
	ld a,001h		;b232
	ld (0cb0eh),a		;b234   ; guarda la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ld (0cb00h),a		;b237   ; guarda el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	ld (0cb01h),a		;b23a   ; guarda el dibujo de Snake (al darse la vuelta se le suma 1, 3 o 5 segun 0xCB00)
	ld (0cb35h),a		;b23d
	ld a,003h		;b240   ; 0xDFD8 = 3
	ld (0dfd8h),a		;b242
	inc a			;b245   ; cuatro detras
	ld (0caa0h),a		;b246   ; guarda cuantos siguen a Snake por su rastro (1-4)
	ld de,0e088h		;b249   ; (0xE0, 0x88)...
	ex de,hl			;b24c
	ld bc,01810h		;b24d   ; ...0x18 x 0x10 a 0
	call 046fah		;b250   ; borra_bloque_pagina_0: p00:46FF con A = 0 en la pagina en la que se dibuja
	jp e041_siguiente_g		;b253   ; e041_siguiente_g:
guion_7_paso_13:		; fin, al acabar la cuenta de 0xCAE4: 0xCB20 = 1, 0x10 x 0x10 a 0x99 en el sitio de 0xD874 (y de 0xD8A4 con 0xCB21 = 0x1D), una copia de (0x80, 0) a (0x74, 0xD0) de 0x20 x 0x10, 0xDF30-0xDF33 a 0x80, el sonido 0x22, 0xE040 = 0, 0xCB55 = 1 y a cero las cosas 0, 0x2A y 0x0B (0xD600, 0xD6A8, 0xD62C)
	call cuenta_cae4		;b256   ; cuenta_cae4: con 0xCAE4, uno menos; a cero, los sonidos 5 y 0x72
	ld a,(0cae4h)		;b259
	or a			;b25c
	ret nz			;b25d   ; sin acabar la cuenta, nada
	ld a,001h		;b25e   ; 0xCB20 = 1
	ld (0cb20h),a		;b260   ; guarda lo que usa el disparo 1 (0 nada; p02:8001 elige por ello)
	ld hl,0d874h		;b263
	call cuadro_99		;b266   ; cuadro_99: 0x10 x 0x10 en HL al color 0x99
	ld hl,0d8a4h		;b269   ; con 0xCB21 = 0x1D...
	ld a,(0cb21h)		;b26c   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	cp 01dh		;b26f
	call z,cuadro_99		;b271   ; ...tambien el de 0xD8A4
	ld hl,00080h		;b274   ; de (0x80, 0)...
	ld de,0d074h		;b277   ; ...a (0x74, 0xD0)...
	ld bc,02010h		;b27a   ; ...0x20 x 0x10
	ld a,(0ca42h)		;b27d   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	rlca			;b280
	rlca			;b281
	rlca			;b282
	rlca			;b283
	and 030h		;b284
	or 0c8h		;b286   ; con la operacion 0xC8
	call 047edh		;b288   ; copia_rectangulo_logica: orden LMMM del VDP con la operacion logica de A
	ld hl,0df30h		;b28b   ; 0xDF30-0xDF33 a 0x80
	ld bc,00003h		;b28e
	ld a,080h		;b291
	call 04237h		;b293   ; llena_bloque: pone A en BC + 1 bytes desde HL
	call 06a83h		;b296   ; sonido_22: pide el sonido 0x22
	xor a			;b299   ; sin escena
	ld (0e040h),a		;b29a   ; guarda la escena en curso (1-9, 0 = ninguna; p09:A4A6, guiones en p09:A5D4)
	inc a			;b29d
	ld (0cb55h),a		;b29e   ; 0xCB55 = 1
	ld hl,0d600h		;b2a1   ; la cosa 0 a cero
	ld bc,00000h		;b2a4
	call cosa_a		;b2a7   ; cosa_a: la ficha de HL: A y la cuenta BC
	ld hl,0d6a8h		;b2aa   ; la de 0xD6A8
	xor a			;b2ad
	call cosa_a		;b2ae   ; cosa_a: la ficha de HL: A y la cuenta BC
	ld hl,0d62ch		;b2b1   ; la de 0xD62C
cosa_a:		; la ficha de HL: A y la cuenta BC
	ld (hl),a			;b2b4
	inc hl			;b2b5
	ld (hl),c			;b2b6   ; la cuenta baja...
	inc hl			;b2b7
	ld (hl),b			;b2b8   ; ...y alta
	ret			;b2b9
cuadro_99:		; 0x10 x 0x10 en HL al color 0x99
	ld bc,01010h		;b2ba
	ld a,(0ca42h)		;b2bd   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	ld d,a			;b2c0
	ld a,099h		;b2c1
	jp 046ffh		;b2c3   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
cuenta_cae4:		; con 0xCAE4, uno menos; a cero, los sonidos 5 y 0x72
	ld hl,0cae4h		;b2c6
	ld a,(hl)			;b2c9
	or a			;b2ca
	ret z			;b2cb
	dec (hl)			;b2cc
	ret nz			;b2cd
	call 06b12h		;b2ce   ; sonido_05: pide el sonido 0x05
	jp 06b41h		;b2d1   ; sonido_72: pide el sonido 0x72 (de los que tienen la partitura en un banco de musica, p16:4CE3)
rastro_rehecho:		; las 16 posiciones del rastro de Snake (0xE080): X = 0x50, Y de 0x8F de 2 en 2, hacia arriba
	ld hl,0e080h		;b2d4   ; apunta a el rastro de Snake: las ultimas 16 posiciones [Y][X][direccion] (con 0xCAA0)
	ld b,010h		;b2d7
	ld a,08fh		;b2d9
posicion_de_rastro:
	ld (hl),a			;b2db
	inc a			;b2dc   ; la Y siguiente (2 mas)
	inc a			;b2dd
	inc hl			;b2de
	ld (hl),050h		;b2df   ; la X 0x50
	inc hl			;b2e1
	ld (hl),001h		;b2e2   ; hacia arriba
	inc hl			;b2e4
	djnz posicion_de_rastro		;b2e5   ; las 16
	ret			;b2e7
guion_8:		; la escena 8 por su paso 0xE041 (p09:B2EE)
	ld a,(0e041h)		;b2e8   ; lee el paso de la escena en curso
	call 0424dh		;b2eb   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_B2EE: 2 destinos del despachador p00:424D (call en p09:B2EB, el
;   indice en A): B2F2, B307; lo leen p09:B2EB (4 bytes)
;   0xb2ee..0xb2f2  (4 bytes)
DATA_tabla_B2EE:
	defw 0b2f2h,0b307h	; b2ee  -> guion_8_paso_0 guion_8_paso_1

; ======================================================================
; CODIGO 0xb2f2..0xb31b  (41 bytes)
; ======================================================================


guion_8_paso_0:		; la conversacion de p01:63CE, 0xD7BB = 1, p09:B68E, el estado de la partida al paso 4 y el paso siguiente
	call 063ceh		;b2f2   ; conversacion_8004:
	ld a,001h		;b2f5
	ld (0d7bbh),a		;b2f7   ; guarda 1: la pantalla de conversacion la abre una escena (llama sola, p09:B8AB)
	call pantalla_de_conversacion		;b2fa   ; pantalla_de_conversacion: la pantalla de la conversacion: los dibujos de p46:9EB2, los mosaicos de quien habla (p09:B75F), R#7 = 0x0F, 0xDF80 a cero, a cero 0xD793, 0xDFEC, 0xD79A-0xD79B, 0xD7B4-0xD7B5, 0xCABE, 0xCADD, 0xCA86, 0xCB71, 0xCB77 y 0xCB52; 0xCABD = 0xE255 = 1, la ventana estrecha, la fase a 0xCB7F, 0xCB5D (1 con la escena 9 y 0xCB5E = 0xC0), 0xD795 = 0xD7B6 = 3, 0xD796-0xD799 a cero, con 0xD7BB p09:BEB5; sin sprites, la pantalla en negro, el mosaico de p47:A719 y lo demas de p09:BD91, BA1E y BA35
	ld a,004h		;b2fd
	ld (0ca01h),a		;b2ff   ; guarda el paso del estado de la partida
	ld hl,0e041h		;b302   ; apunta a el paso de la escena en curso
	inc (hl)			;b305
	ret			;b306
guion_8_paso_1:		; fin: 0xCAD8 = 0x384, 0xE040 = 0 y 0xCB76 = 0
	ld hl,00384h		;b307
	ld (0cad8h),hl		;b30a   ; guarda una cuenta de 16 bits que baja en la zona 0x11 sala 5 (p09:A1DB)
	xor a			;b30d
	ld (0e040h),a		;b30e   ; guarda la escena en curso (1-9, 0 = ninguna; p09:A4A6, guiones en p09:A5D4)
	ld (0cb76h),a		;b311
	ret			;b314
guion_9:		; la escena 9 por su paso 0xE041 (p09:B31B, 14 pasos)
	ld a,(0e041h)		;b315   ; lee el paso de la escena en curso
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


guion_9_paso_0:		; la espera con el sonido 0x39 cada 8 cuadros; al acabar, el paso siguiente
	ld hl,0e043h		;b337   ; apunta a la cuenta de cuadros de la escena
	dec (hl)			;b33a
	jr z,e041_siguiente_h		;b33b
	ld a,(hl)			;b33d
	and 007h		;b33e
	jp z,06afah		;b340   ; sonido_39: pide el sonido 0x39
	ret			;b343
guion_9_paso_1:		; la secuencia de p50:803C
	ld hl,0803ch		;b344
	jp secuencia_y_paso		;b347   ; secuencia_y_paso: la secuencia de mensajes; con 0xE042 desde 4, 0xE042 = 0 y 0xE041 uno mas
guion_9_paso_2:		; quita la ventana, 0x10 cuadros y el paso siguiente
	call 08caah		;b34a   ; a_p03_b63e: p03:B63E con el banco 3 en 0xA000
	ld hl,0e043h		;b34d   ; apunta a la cuenta de cuadros de la escena
	ld (hl),010h		;b350
e041_siguiente_h:
	ld hl,0e041h		;b352   ; apunta a el paso de la escena en curso
	inc (hl)			;b355
	ret			;b356
guion_9_paso_3:		; 0xCB7E = 0, 0xDFD8 = 2, las fichas de p09:B397, su direccion (p09:B368) y el paso siguiente
	xor a			;b357
	ld (0cb7eh),a		;b358   ; guarda los 5 bits de lo que ya llego en la escena 9 (p09:B3A3)
	inc a			;b35b
	inc a			;b35c
	ld (0dfd8h),a		;b35d
	call fichas_de_b397		;b360   ; fichas_de_b397: los 12 bytes de p09:B397 a 0xE050 (tres fichas) y sus sprites
	call dfd8_hacia_58_60		;b363   ; dfd8_hacia_58_60: la direccion del de 0xDFD8 hacia Y = 0x58 (1 arriba, 2 abajo) y despues hacia X = 0x60 (3, 4); alli, p09:B44A
	jr e041_siguiente_h		;b366
dfd8_hacia_58_60:		; la direccion del de 0xDFD8 hacia Y = 0x58 (1 arriba, 2 abajo) y despues hacia X = 0x60 (3, 4); alli, p09:B44A
	ld a,(0dfdbh)		;b368
	cp 058h		;b36b   ; en Y = 0x58: hacia la X
	jr z,dfd8_hacia_x_60		;b36d
	ld a,001h		;b36f   ; por debajo: hacia arriba...
	jr nc,pon_dfde		;b371
	inc a			;b373   ; ...por encima: hacia abajo
pon_dfde:
	ld (0dfdeh),a		;b374
	ret			;b377
dfd8_hacia_x_60:
	ld a,(0dfddh)		;b378
	cp 060h		;b37b
	jp z,dfd8_llego		;b37d   ; dfd8_llego:
	ld a,003h		;b380
	jr nc,pon_dfde_b		;b382
	inc a			;b384
pon_dfde_b:
	ld (0dfdeh),a		;b385
	ret			;b388
fichas_de_b397:		; los 12 bytes de p09:B397 a 0xE050 (tres fichas) y sus sprites
	ld de,0e050h		;b389
	ld hl,0b397h		;b38c
	ld bc,0000ch		;b38f
	ldir		;b392
	jp sprites_e050		;b394   ; sprites_e050: los sprites de las fichas de 0xE050, 0xE054 y 0xE058 (p09:AEA6) en 0xDC28, 0xDC38 y 0xDC48 y los colores de los sprites 10-21 de las rachas de p08:BA97, p08:BAA4, p08:BAB2 y p08:BAB5

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


guion_9_paso_4:		; Snake a (0x58, 0x50) (p09:B3C4), el de 0xDFD8 a (0x58, 0x60) (p09:B436), las fichas de 0xE050 (p09:B48F, B4EF, B549) y sus sprites; con los 5 bits de 0xCB7E, 0x20 cuadros y el paso siguiente
	call snake_a_58_50		;b3a3   ; snake_a_58_50: sin el bit 0 de 0xCB7E, cada 4 cuadros Snake anda hacia Y = 0x58 y despues hacia X = 0x50; alli, el bit 0, mirando abajo
	call dfd8_a_58_60		;b3a6   ; dfd8_a_58_60: sin el bit 1 de 0xCB7E: el de 0xDFD8 hasta Y = 0x58 y X = 0x60; alli, el bit 1, 0xDFD8 = 1 y mirando abajo
	call ficha_e050_a		;b3a9   ; ficha_e050_a: sin el bit 2 de 0xCB7E: la ficha 0xE050 por p12:7FA0
	call ficha_e054_b		;b3ac   ; ficha_e054_b: sin el bit 3 de 0xCB7E y con la ficha 0xE054: p12:7FA0; hasta Y = 0x70 en X = 0x50 (alli hacia la derecha y la ficha 0xE058 a 0xBF), hasta X = 0x88 (hacia arriba), hasta Y = 0x58 (hacia la izquierda y el bit 3)
	call ficha_e058_b		;b3af   ; ficha_e058_b: sin el bit 4 de 0xCB7E y con la ficha 0xE058: p12:7FA0 hasta Y = 0x90 y el bit 4
	call sprites_e050		;b3b2   ; sprites_e050: los sprites de las fichas de 0xE050, 0xE054 y 0xE058 (p09:AEA6) en 0xDC28, 0xDC38 y 0xDC48 y los colores de los sprites 10-21 de las rachas de p08:BA97, p08:BAA4, p08:BAB2 y p08:BAB5
	ld a,(0cb7eh)		;b3b5   ; los cinco hechos...
	and 01fh		;b3b8
	cp 01fh		;b3ba
	ret nz			;b3bc
	ld hl,0e043h		;b3bd   ; ...0x20 cuadros
	ld (hl),020h		;b3c0
	jr $-112		;b3c2
snake_a_58_50:		; sin el bit 0 de 0xCB7E, cada 4 cuadros Snake anda hacia Y = 0x58 y despues hacia X = 0x50; alli, el bit 0, mirando abajo
	ld a,(0cb7eh)		;b3c4   ; lee los 5 bits de lo que ya llego en la escena 9 (p09:B3A3)
	rra			;b3c7
	ret c			;b3c8   ; ya llego, nada
	ld a,(0ca03h)		;b3c9   ; lee el contador de cuadros (uno mas en cada interrupcion)
	and 003h		;b3cc
	ret nz			;b3ce
	ld a,(0cb03h)		;b3cf   ; lee la Y de Snake
	cp 058h		;b3d2
	jr z,snake_hacia_x_50		;b3d4   ; en Y = 0x58: en X
	ld a,001h		;b3d6   ; por debajo: hacia arriba...
	jr nc,snake_sube		;b3d8
	inc a			;b3da   ; ...por encima: hacia abajo
	ld (0cb0eh),a		;b3db   ; guarda la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	call 08cb3h		;b3de   ; anda
	ld a,(0cb03h)		;b3e1   ; lee la Y de Snake
	cp 058h		;b3e4
	ret c			;b3e6
	jr snake_en_y_58		;b3e7
snake_sube:
	ld (0cb0eh),a		;b3e9   ; guarda la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	call 08cb3h		;b3ec   ; p02:8CB3
	ld a,(0cb03h)		;b3ef   ; lee la Y de Snake
	cp 059h		;b3f2
	ret nc			;b3f4
snake_en_y_58:
	ld a,058h		;b3f5
	ld (0cb03h),a		;b3f7   ; guarda la Y de Snake
	ret			;b3fa
snake_hacia_x_50:
	ld a,(0cb05h)		;b3fb   ; lee la X de Snake
	cp 050h		;b3fe   ; en X = 0x50: llegado
	jr z,snake_llego		;b400
	ld a,003h		;b402
	jr nc,snake_a_la_izquierda		;b404
	inc a			;b406
	ld (0cb0eh),a		;b407   ; guarda la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	call 08cb3h		;b40a   ; p02:8CB3
	ld a,(0cb05h)		;b40d   ; lee la X de Snake
	cp 050h		;b410
	ret c			;b412
	jr snake_en_x_50		;b413
snake_a_la_izquierda:
	ld (0cb0eh),a		;b415   ; guarda la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	call 08cb3h		;b418   ; p02:8CB3
	ld a,(0cb05h)		;b41b   ; lee la X de Snake
	cp 051h		;b41e
	ret nc			;b420
snake_en_x_50:
	ld a,050h		;b421
	ld (0cb05h),a		;b423   ; guarda la X de Snake
snake_llego:		; el bit 0 de 0xCB7E...
	ld hl,0cb7eh		;b426   ; apunta a los 5 bits de lo que ya llego en la escena 9 (p09:B3A3)
	set 0,(hl)		;b429
	ld a,002h		;b42b   ; ...mirando abajo
	ld (0cb0eh),a		;b42d   ; guarda la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ld a,001h		;b430
	ld (0cb14h),a		;b432   ; guarda el dibujo del paso de andar (0, 1, 2, 1: p02:9888)
	ret			;b435
dfd8_a_58_60:		; sin el bit 1 de 0xCB7E: el de 0xDFD8 hasta Y = 0x58 y X = 0x60; alli, el bit 1, 0xDFD8 = 1 y mirando abajo
	ld a,(0cb7eh)		;b436   ; lee los 5 bits de lo que ya llego en la escena 9 (p09:B3A3)
	bit 1,a		;b439
	ret nz			;b43b   ; ya llego, nada
	ld a,(0dfdbh)		;b43c
	cp 058h		;b43f
	jr nz,dfd8_en_y		;b441   ; fuera de la Y, a ella
	ld a,(0dfddh)		;b443
	cp 060h		;b446
	jr nz,dfd8_en_x		;b448   ; fuera de la X, a ella
dfd8_llego:
	ld hl,0cb7eh		;b44a   ; apunta a los 5 bits de lo que ya llego en la escena 9 (p09:B3A3)
	set 1,(hl)		;b44d
	ld a,001h		;b44f
	ld (0dfd8h),a		;b451
	inc a			;b454
	ld (0dfdeh),a		;b455
	ret			;b458
dfd8_en_y:
	ld a,(0dfdeh)		;b459
	dec a			;b45c   ; hacia arriba...
	ld a,(0dfdbh)		;b45d
	jr z,dfd8_y_baja		;b460
	cp 058h		;b462
	ret c			;b464
dfd8_y_58:
	ld a,058h		;b465
	ld (0dfdbh),a		;b467
	jp dfd8_hacia_x_60		;b46a   ; dfd8_hacia_x_60:
dfd8_y_baja:
	cp 059h		;b46d
	ret nc			;b46f
	jr dfd8_y_58		;b470
dfd8_en_x:
	ld a,(0dfdeh)		;b472
	cp 003h		;b475   ; hacia la izquierda...
	ld a,(0dfddh)		;b477
	jr z,dfd8_x_sube		;b47a
	cp 060h		;b47c   ; ...hacia la derecha: por debajo de 0x60, sigue
	ret c			;b47e
dfd8_x_60:
	ld a,060h		;b47f
	ld (0dfddh),a		;b481
	ld a,001h		;b484
	ld (0dfd8h),a		;b486
	ret			;b489
dfd8_x_sube:
	cp 061h		;b48a
	ret nc			;b48c
	jr dfd8_x_60		;b48d
ficha_e050_a:		; sin el bit 2 de 0xCB7E: la ficha 0xE050 por p12:7FA0
	ld a,(0cb7eh)		;b48f   ; lee los 5 bits de lo que ya llego en la escena 9 (p09:B3A3)
	bit 2,a		;b492
	ret nz			;b494
	ld ix,0e050h		;b495
	call a_p12_7fa0		;b499   ; a_p12_7fa0: p12:7FA0 con el banco 12 en 0x6000
	ld a,(0e050h)		;b49c   ; la Y de la ficha...
	cp 080h		;b49f
	jr z,e050_en_y_80		;b4a1   ; ...hasta 0x80
	jr c,e050_en_y_80		;b4a3
	ret			;b4a5
e050_en_y_80:		; en X = 0x50: Y = 0x80, hacia la izquierda y la ficha 0xE054 a 0xBF
	ld a,(0e051h)		;b4a6
	cp 050h		;b4a9
	jr nz,e050_en_x_34		;b4ab   ; fuera de 0x50, sigue
	ld a,080h		;b4ad
	ld (0e050h),a		;b4af
	ld a,003h		;b4b2   ; hacia la izquierda
	ld (0e053h),a		;b4b4
	ld a,0bfh		;b4b7   ; la ficha 0xE054 empieza
	ld (0e054h),a		;b4b9
e050_en_x_34:		; hasta X = 0x34: alli, hacia arriba; por encima de Y = 0x58, Y = 0x58, hacia la derecha y el bit 2 de 0xCB7E
	ld a,(0e051h)		;b4bc
	cp 034h		;b4bf
	jr z,e050_sube		;b4c1
	jr c,e050_sube		;b4c3
	ret			;b4c5
e050_sube:
	ld a,034h		;b4c6
	ld (0e051h),a		;b4c8
	ld a,001h		;b4cb   ; hacia arriba
	ld (0e053h),a		;b4cd
	ld a,(0e050h)		;b4d0
	cp 058h		;b4d3
	ret nc			;b4d5   ; aun no
	ld a,058h		;b4d6
	ld (0e050h),a		;b4d8
	ld a,004h		;b4db   ; hacia la derecha
	ld (0e053h),a		;b4dd
	ld hl,0cb7eh		;b4e0   ; el bit 2: hecho
	set 2,(hl)		;b4e3
	ret			;b4e5
a_p12_7fa0:		; p12:7FA0 con el banco 12 en 0x6000
	call 041ddh		;b4e6   ; bancos_12: pone el 12 en 0x6000 (con su copia en 0xC381-0xC383)
	call 07fa0h		;b4e9   ; p12:7FA0
	jp 041c2h		;b4ec   ; bancos_1_2_9: pone el 1 en 0x6000, el 2 en 0x8000, el 9 en 0xA000 (con su copia en 0xC381-0xC383)
ficha_e054_b:		; sin el bit 3 de 0xCB7E y con la ficha 0xE054: p12:7FA0; hasta Y = 0x70 en X = 0x50 (alli hacia la derecha y la ficha 0xE058 a 0xBF), hasta X = 0x88 (hacia arriba), hasta Y = 0x58 (hacia la izquierda y el bit 3)
	ld a,(0cb7eh)		;b4ef   ; lee los 5 bits de lo que ya llego en la escena 9 (p09:B3A3)
	bit 3,a		;b4f2
	ret nz			;b4f4
	ld a,(0e054h)		;b4f5
	or a			;b4f8
	ret z			;b4f9   ; sin ficha, nada
	ld ix,0e054h		;b4fa
	call a_p12_7fa0		;b4fe   ; a_p12_7fa0: p12:7FA0 con el banco 12 en 0x6000
	ld a,(0e054h)		;b501
	cp 070h		;b504
	jr z,e054_en_y_70		;b506
	jr c,e054_en_y_70		;b508
	ret			;b50a
e054_en_y_70:
	ld a,(0e055h)		;b50b
	cp 050h		;b50e   ; en X = 0x50...
	jr nz,e054_en_x_88		;b510
	ld a,070h		;b512   ; ...Y = 0x70...
	ld (0e054h),a		;b514
	ld a,004h		;b517   ; ...hacia la derecha...
	ld (0e057h),a		;b519
	ld a,0bfh		;b51c   ; ...y la ficha 0xE058 empieza
	ld (0e058h),a		;b51e
e054_en_x_88:
	ld a,(0e055h)		;b521
	cp 088h		;b524
	jr nc,e054_sube		;b526
	ret			;b528
e054_sube:
	ld a,088h		;b529   ; X = 0x88...
	ld (0e055h),a		;b52b
	ld a,001h		;b52e   ; ...hacia arriba
	ld (0e057h),a		;b530
	ld a,(0e054h)		;b533
	cp 058h		;b536   ; por debajo de 0x58, sigue
	ret nc			;b538
	ld a,058h		;b539   ; Y = 0x58...
	ld (0e054h),a		;b53b
	ld a,003h		;b53e   ; ...hacia la izquierda
	ld (0e057h),a		;b540
	ld hl,0cb7eh		;b543   ; apunta a los 5 bits de lo que ya llego en la escena 9 (p09:B3A3)
	set 3,(hl)		;b546   ; el bit 3: hecho
	ret			;b548
ficha_e058_b:		; sin el bit 4 de 0xCB7E y con la ficha 0xE058: p12:7FA0 hasta Y = 0x90 y el bit 4
	ld a,(0cb7eh)		;b549   ; lee los 5 bits de lo que ya llego en la escena 9 (p09:B3A3)
	bit 4,a		;b54c
	ret nz			;b54e
	ld a,(0e058h)		;b54f
	or a			;b552
	ret z			;b553   ; sin ficha, nada
	ld ix,0e058h		;b554
	call a_p12_7fa0		;b558   ; a_p12_7fa0: p12:7FA0 con el banco 12 en 0x6000
	ld a,(0e058h)		;b55b
	cp 091h		;b55e
	ret nc			;b560   ; aun no
	ld a,090h		;b561   ; Y = 0x90...
	ld (0e058h),a		;b563
	ld hl,0cb7eh		;b566   ; ...el bit 4: hecho
	set 4,(hl)		;b569
	ret			;b56b
guion_9_paso_5:		; sus sprites; al acabar la espera, 0xCB7B = 0, 0xCB7C = 1 y el paso siguiente
	call sprites_e050		;b56c   ; sprites_e050: los sprites de las fichas de 0xE050, 0xE054 y 0xE058 (p09:AEA6) en 0xDC28, 0xDC38 y 0xDC48 y los colores de los sprites 10-21 de las rachas de p08:BA97, p08:BAA4, p08:BAB2 y p08:BAB5
	ld hl,0e043h		;b56f   ; apunta a la cuenta de cuadros de la escena
	dec (hl)			;b572
	ret nz			;b573
	ld hl,0cb7bh		;b574
	ld (hl),000h		;b577
	inc hl			;b579
	ld (hl),001h		;b57a
	jp e041_siguiente_h		;b57c   ; e041_siguiente_h:
guion_9_paso_6:		; sus sprites, p11:BE0F, p11:BE6B y las fichas que se van (p09:B5A5); sin 0xCB78: el sprite 4 fuera, 0xDFDE = 1, el paso siguiente y el sonido 0x91
	call sprites_e050		;b57f   ; sprites_e050: los sprites de las fichas de 0xE050, 0xE054 y 0xE058 (p09:AEA6) en 0xDC28, 0xDC38 y 0xDC48 y los colores de los sprites 10-21 de las rachas de p08:BA97, p08:BAA4, p08:BAB2 y p08:BAB5
	call 08e8eh		;b582   ; a_p11_be0f: p11:BE0F con el banco 11 en 0xA000
	call 08e96h		;b585   ; a_p11_be6b: p11:BE6B con el banco 11 en 0xA000
	call fichas_se_van		;b588   ; fichas_se_van: con 0xCB7B en 4 la ficha 0xE050, en 0x0A la 0xE058, en 0x11 la 0xE054: a cero y el sonido 0x0F
	ld a,(0cb78h)		;b58b
	or a			;b58e
	ret nz			;b58f   ; con 0xCB78, sigue
	ld hl,0dc10h		;b590   ; el sprite 4 fuera
	ld (hl),0e0h		;b593
	ld hl,0e043h		;b595   ; apunta a la cuenta de cuadros de la escena
	ld (hl),000h		;b598
	ld a,001h		;b59a
	ld (0dfdeh),a		;b59c
	call e041_siguiente_h		;b59f   ; e041_siguiente_h:
	jp 06aeeh		;b5a2   ; sonido_91: pide el sonido 0x91 (de los que tienen la partitura en un banco de musica, p16:4CE3)
fichas_se_van:		; con 0xCB7B en 4 la ficha 0xE050, en 0x0A la 0xE058, en 0x11 la 0xE054: a cero y el sonido 0x0F
	ld a,(0cb7bh)		;b5a5
	ld hl,0e050h		;b5a8   ; en 4, la 0xE050
	cp 004h		;b5ab
	jr z,ficha_a_cero		;b5ad
	ld hl,0e058h		;b5af   ; en 0x0A, la 0xE058
	cp 00ah		;b5b2
	jr z,ficha_a_cero		;b5b4
	ld hl,0e054h		;b5b6   ; en 0x11, la 0xE054
	cp 011h		;b5b9
	ret nz			;b5bb
ficha_a_cero:
	ld (hl),000h		;b5bc
	jp 06a2dh		;b5be   ; sonido_0f: pide el sonido 0x0F
guion_9_paso_7:		; al acabar la espera: 0xDFDE = 3, el paso siguiente, la ventana estrecha y la orden 0xF6
	ld hl,0e043h		;b5c1   ; apunta a la cuenta de cuadros de la escena
	dec (hl)			;b5c4
	ret nz			;b5c5
	ld a,003h		;b5c6
	ld (0dfdeh),a		;b5c8
	call e041_siguiente_h		;b5cb   ; e041_siguiente_h:
	ld a,001h		;b5ce
	ld (0d8a8h),a		;b5d0   ; guarda 1: la ventana del mensaje es estrecha (0xB8 x 0x28)
	jp 06be8h		;b5d3   ; orden_sonido_f6: la orden 0xF6 al sonido
guion_9_paso_8:		; la secuencia de p50:803E
	ld hl,0803eh		;b5d6
	jp secuencia_y_paso		;b5d9   ; secuencia_y_paso: la secuencia de mensajes; con 0xE042 desde 4, 0xE042 = 0 y 0xE041 uno mas
guion_9_paso_9:		; quita la ventana, Snake a la derecha, el paso siguiente y el sonido 0xA2
	call 08caah		;b5dc   ; a_p03_b63e: p03:B63E con el banco 3 en 0xA000
	ld a,004h		;b5df
	ld (0cb0eh),a		;b5e1   ; guarda la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	call e041_siguiente_h		;b5e4   ; e041_siguiente_h:
	jp 06bbch		;b5e7   ; sonido_a2: pide el sonido 0xA2 (de los que tienen la partitura en un banco de musica, p16:4CE3)
guion_9_paso_10:		; la conversacion de p01:63D3, 0xD7BB = 1, p09:B68E, el estado de la partida al paso 4, 0xB4 cuadros y el paso siguiente
	call 063d3h		;b5ea   ; conversacion_8006:
	ld a,001h		;b5ed
	ld (0d7bbh),a		;b5ef   ; guarda 1: la pantalla de conversacion la abre una escena (llama sola, p09:B8AB)
	call pantalla_de_conversacion		;b5f2   ; pantalla_de_conversacion: la pantalla de la conversacion: los dibujos de p46:9EB2, los mosaicos de quien habla (p09:B75F), R#7 = 0x0F, 0xDF80 a cero, a cero 0xD793, 0xDFEC, 0xD79A-0xD79B, 0xD7B4-0xD7B5, 0xCABE, 0xCADD, 0xCA86, 0xCB71, 0xCB77 y 0xCB52; 0xCABD = 0xE255 = 1, la ventana estrecha, la fase a 0xCB7F, 0xCB5D (1 con la escena 9 y 0xCB5E = 0xC0), 0xD795 = 0xD7B6 = 3, 0xD796-0xD799 a cero, con 0xD7BB p09:BEB5; sin sprites, la pantalla en negro, el mosaico de p47:A719 y lo demas de p09:BD91, BA1E y BA35
	ld a,004h		;b5f5
	ld (0ca01h),a		;b5f7   ; guarda el paso del estado de la partida
	ld hl,0e043h		;b5fa   ; apunta a la cuenta de cuadros de la escena
	ld (hl),0b4h		;b5fd
	jp e041_siguiente_h		;b5ff   ; e041_siguiente_h:
guion_9_paso_11:		; al acabar la espera, la ventana estrecha y arriba y el paso siguiente
	ld hl,0e043h		;b602   ; apunta a la cuenta de cuadros de la escena
	dec (hl)			;b605
	ret nz			;b606
	ld a,001h		;b607
	ld (0d8a8h),a		;b609   ; guarda 1: la ventana del mensaje es estrecha (0xB8 x 0x28)
	call 08c92h		;b60c   ; a_p03_b603: p03:B603 con el banco 3 en 0xA000
	jp e041_siguiente_h		;b60f   ; e041_siguiente_h:
guion_9_paso_12:		; la secuencia de p50:8040
	ld hl,08040h		;b612
	jp secuencia_y_paso		;b615   ; secuencia_y_paso: la secuencia de mensajes; con 0xE042 desde 4, 0xE042 = 0 y 0xE041 uno mas
guion_9_paso_13:		; fin: quita la ventana, 0xE040 = 0, la ventana normal, 0xCAAF = 1 y 0xD700-0xD71F a cero
	call 08caah		;b618   ; a_p03_b63e: p03:B63E con el banco 3 en 0xA000
	xor a			;b61b
	ld (0e040h),a		;b61c   ; guarda la escena en curso (1-9, 0 = ninguna; p09:A4A6, guiones en p09:A5D4)
	ld (0d8a8h),a		;b61f   ; guarda 1: la ventana del mensaje es estrecha (0xB8 x 0x28)
	inc a			;b622
	ld (0caafh),a		;b623   ; 0xCAAF = 1
	ld hl,0d700h		;b626   ; 0xD700-0xD71F a cero
	ld bc,0001fh		;b629
	jp 04236h		;b62c   ; borra_bloque: pone a cero BC + 1 bytes desde HL
d790_al_empezar:		; 0xD790-0xD792 = 0, 0x40, 1; 0xD7A0-0xD7AF de p09:B67E y 0xD79C-0xD79F a cero; segun los bits 3-6 de 0xD7E4, 0xD7A0 = 0x66 o 0x24, 0xD7A1 = 0x98 y 0xD7A3 = 0x76
	ld hl,0d790h		;b62f   ; apunta a el numero de la pantalla de conversacion (BCD; sube y baja con derecha e izquierda, p09:BCF2; 0xD791-0xD792 las cifras altas)
	ld (hl),000h		;b632
	inc hl			;b634
	ld (hl),040h		;b635
	inc hl			;b637
	ld (hl),001h		;b638
	ld hl,0b67eh		;b63a   ; 16 bytes de p09:B67E a 0xD7A0
	ld de,0d7a0h		;b63d   ; apunta a la lista de 16 numeros de la conversacion (de p09:B67E; p09:BC0B)
	ld bc,00010h		;b640
	ldir		;b643
	ld hl,0d79ch		;b645   ; apunta a 16 bits: que numeros de la lista 0xD7A0 suben 0xD79A (p09:BD36)
	ld bc,00003h		;b648
	call 04236h		;b64b   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	ld a,(0d7e4h)		;b64e
	and 078h		;b651   ; sin los bits 3-6, ya esta
	ret z			;b653
	ld hl,0d7a0h		;b654   ; apunta a la lista de 16 numeros de la conversacion (de p09:B67E; p09:BC0B)
	ld b,066h		;b657   ; el bit 3: 0xD7A0 = 0x66
	bit 3,a		;b659
	call nz,pon_b		;b65b   ; pon_b:
	bit 6,a		;b65e   ; el bit 6: 0xD7A0 = 0x24
	jr z,d7a1_98		;b660
	ld hl,0d7a0h		;b662   ; apunta a la lista de 16 numeros de la conversacion (de p09:B67E; p09:BC0B)
	ld b,024h		;b665
	call pon_b		;b667   ; pon_b:
d7a1_98:
	ld hl,0d7a1h		;b66a
	ld b,098h		;b66d   ; el bit 5: 0xD7A1 = 0x98
	bit 5,a		;b66f
	call nz,pon_b		;b671   ; pon_b:
	ld hl,0d7a3h		;b674
	ld b,076h		;b677   ; el bit 4: 0xD7A3 = 0x76
	bit 4,a		;b679
	ret z			;b67b
pon_b:
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


pantalla_de_conversacion:		; la pantalla de la conversacion: los dibujos de p46:9EB2, los mosaicos de quien habla (p09:B75F), R#7 = 0x0F, 0xDF80 a cero, a cero 0xD793, 0xDFEC, 0xD79A-0xD79B, 0xD7B4-0xD7B5, 0xCABE, 0xCADD, 0xCA86, 0xCB71, 0xCB77 y 0xCB52; 0xCABD = 0xE255 = 1, la ventana estrecha, la fase a 0xCB7F, 0xCB5D (1 con la escena 9 y 0xCB5E = 0xC0), 0xD795 = 0xD7B6 = 3, 0xD796-0xD799 a cero, con 0xD7BB p09:BEB5; sin sprites, la pantalla en negro, el mosaico de p47:A719 y lo demas de p09:BD91, BA1E y BA35
	call 06f3ch		;b68e   ; dibujos_9eb2: los dibujos de p46:9EB2 en la VRAM de 0x6000
	call mosaico_de_quien_llama		;b691   ; mosaico_de_quien_llama: p02:8E2E con 0x0B en la escena 3; si no, con 0
	ld bc,00f07h		;b694   ; el borde al 0x0F
	call 00047h		;b697   ; BIOS WRTVDP - Writes data in the VDP-register
	ld hl,0df80h		;b69a   ; 0xDF80 a cero
	ld bc,0003fh		;b69d
	call 04236h		;b6a0   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	xor a			;b6a3
	ld (0d793h),a		;b6a4   ; guarda el paso de la pantalla de conversacion (p09:B891, 13 pasos)
	ld (0dfech),a		;b6a7   ; guarda 1 con el mosaico de quien contesta ya puesto (p09:BCC4)
	ld (0d79ah),a		;b6aa   ; guarda 0-9: sube mientras el numero esta en la lista con su bit (p09:BD14)
	ld (0d79bh),a		;b6ad   ; guarda 0xD79A de antes (p09:BDD7)
	ld (0d7b4h),a		;b6b0
	ld (0d7b5h),a		;b6b3
	ld (0cabeh),a		;b6b6   ; guarda 1 con el numero 7 en su sitio (p09:BF42)
	ld (0caddh),a		;b6b9   ; guarda 2-3: el mensaje se salta (p09:BA9B)
	ld (0ca86h),a		;b6bc
	ld (0cb71h),a		;b6bf   ; guarda 10 al contestar (p09:BC46)
	ld (0cb77h),a		;b6c2   ; guarda 1 tras el sonido de 0xD79A (p09:BEDF)
	ld (0cb52h),a		;b6c5
	inc a			;b6c8
	ld (0cabdh),a		;b6c9   ; 0xCABD = 1
	ld (0e255h),a		;b6cc
	ld (0d8a8h),a		;b6cf   ; guarda 1: la ventana del mensaje es estrecha (0xB8 x 0x28)
	ld a,(0ca22h)		;b6d2   ; la fase...
	ld (0cb7fh),a		;b6d5   ; ...a 0xCB7F
	ld hl,0cb5dh		;b6d8
	ld b,000h		;b6db
	ld a,(0e040h)		;b6dd   ; lee la escena en curso (1-9, 0 = ninguna; p09:A4A6, guiones en p09:A5D4)
	cp 009h		;b6e0   ; con la escena 9...
	jr nz,pon_cb5d		;b6e2
	ld a,0c0h		;b6e4   ; ...0xCB5E = 0xC0 y 0xCB5D = 1
	ld (0cb5eh),a		;b6e6
	ld b,001h		;b6e9
pon_cb5d:
	ld (hl),b			;b6eb
	ld a,003h		;b6ec
	ld (0d795h),a		;b6ee   ; 0xD795 = 3
	ld (0d7b6h),a		;b6f1   ; guarda la espera antes de la siguiente accion de la conversacion
	ld de,0d797h		;b6f4   ; 0xD796-0xD799 a cero
	ld hl,0d796h		;b6f7   ; apunta a las teclas de numero recien pulsadas (filas 0, 9 y 10; p09:BE60)
	ld bc,00003h		;b6fa
	ld (hl),000h		;b6fd
	ldir		;b6ff
	ld a,(0d7bbh)		;b701   ; con 0xD7BB, p09:BEB5
	or a			;b704
	call nz,numero_del_mensaje		;b705   ; numero_del_mensaje: antes de la escena 7: el numero de la lista 0xD7A0 que toca al mensaje (su segundo byte - 0x76, o - 0xCA desde 0xD0, en p09:BFE1); desde la 7, 0xD790 = 0
	call 04266h		;b708   ; esconde_sprites_ram: llena 0xDC00-0xDC7F con 0xE0
	call 045d7h		;b70b   ; esconde_sprites_vram: llena con 0xE0 128 bytes de la VRAM en 0xF600 y otros 128 en 0xF200
	ld a,(0ca42h)		;b70e   ; la pagina en negro
	call 04452h		;b711   ; borra_pantalla_de: 0xC0 x 0xC0 puntos a 0 en la pagina A
	ld hl,000d8h		;b714   ; 0xC0 x 0x28 en (0, 0xD8) a cero
	ld bc,0c028h		;b717
	xor a			;b71a
	ld d,a			;b71b
	call 046ffh		;b71c   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
	ld a,(0ca42h)		;b71f   ; (0x90, 0x18) a cero en las dos paginas
	xor 001h		;b722
	call borra_9018		;b724   ; borra_9018: 0x20 x 0x30 en (0x90, 0x18) de la pagina A a cero
	ld a,(0ca42h)		;b727   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	call borra_9018		;b72a   ; borra_9018: 0x20 x 0x30 en (0x90, 0x18) de la pagina A a cero
	call 070fch		;b72d   ; el mosaico
	call pinta_numero_entero		;b730   ; pinta_numero_entero: las seis cifras de 0xD790-0xD792 desde (0x48, 0x70) hacia la izquierda
	call sprites_de_conversacion		;b733   ; los sprites
	call 08ccbh		;b736   ; la paleta
	call marcos_de_quien_habla		;b739   ; marcos_de_quien_habla: los dos marcos de color 0x0D de 0x24 x 0x34 en (0x0E, 0x16) y (0x8E, 0x16)
	call mosaico_de_la_izquierda		;b73c   ; mosaico_de_la_izquierda: el mosaico de quien habla 0 (0x0B en la escena 3) en (0x10, 0x18)
	call 08e1eh		;b73f   ; a_p03_b8ac: p03:B8AC con el banco 3 en 0xA000
	ld a,(0ca97h)		;b742   ; con los mensajes de los bancos 50-51...
	or a			;b745
	ret z			;b746
	jp 06a0dh		;b747   ; ...el sonido 1
sprites_de_conversacion:		; sin 0xCA97, los sprites apagados; con el, todos escondidos
	ld a,(0ca97h)		;b74a   ; lee 1 si los mensajes salen de los bancos 50-51 y no de 48-49
	or a			;b74d
	jp z,045f6h		;b74e   ; apaga_sprites: R#8 con el bit 1 (SPD) a uno, desde la copia 0xFFE7
	jp 04266h		;b751   ; esconde_sprites_ram: llena 0xDC00-0xDC7F con 0xE0
borra_9018:		; 0x20 x 0x30 en (0x90, 0x18) de la pagina A a cero
	ld d,a			;b754
	ld hl,09018h		;b755
	ld bc,02030h		;b758
	xor a			;b75b
	jp 046ffh		;b75c   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
mosaico_de_quien_llama:		; p02:8E2E con 0x0B en la escena 3; si no, con 0
	ld a,(0e040h)		;b75f   ; lee la escena en curso (1-9, 0 = ninguna; p09:A4A6, guiones en p09:A5D4)
	cp 003h		;b762
	ld a,00bh		;b764
	jp z,08e2eh		;b766   ; p02:8E2E
	xor a			;b769
	jp 08e2eh		;b76a   ; p02:8E2E
conversacion_cada_cuadro:		; la pantalla de la conversacion en cada cuadro (p09:B782); con los mensajes de los bancos 50-51, ademas p02:8E77, sin sprites, p11:BEA2 y p02:8E7C
	ld a,(0ca97h)		;b76d   ; lee 1 si los mensajes salen de los bancos 50-51 y no de 48-49
	or a			;b770
	jr z,conversacion_normal		;b771   ; sin 0xCA97, solo lo normal
	call 08e77h		;b773   ; p02:8E77
	call 04266h		;b776   ; esconde_sprites_ram: llena 0xDC00-0xDC7F con 0xE0
	call conversacion_normal		;b779   ; conversacion_normal: el paso 0xD793 (p09:B888), p09:BF42, p09:BF10, el numero (p09:BD89), los rotulos (p09:BDD7), p09:BEDF; con 0xD79A desde 9 y sin 0xCAD0, p09:BDFA y p09:BE14; p03:B8AC, el mosaico de 0xCAA3 (p09:B85D) y, desde 9, p09:BE29; p09:B84B; sin 0xD7BB, sin mensaje y con 0xD793 = 0: con una tecla de funcion (o sin 0xE25A, 0xCA97 ni escena, o con 0xE255 a cero) se sale (p09:B7F2)
	call 08ea6h		;b77c   ; a_p11_bea2: p11:BEA2 con el banco 11 en 0xA000
	jp 08e7ch		;b77f   ; p02:8E7C
conversacion_normal:		; el paso 0xD793 (p09:B888), p09:BF42, p09:BF10, el numero (p09:BD89), los rotulos (p09:BDD7), p09:BEDF; con 0xD79A desde 9 y sin 0xCAD0, p09:BDFA y p09:BE14; p03:B8AC, el mosaico de 0xCAA3 (p09:B85D) y, desde 9, p09:BE29; p09:B84B; sin 0xD7BB, sin mensaje y con 0xD793 = 0: con una tecla de funcion (o sin 0xE25A, 0xCA97 ni escena, o con 0xE255 a cero) se sale (p09:B7F2)
	call paso_de_conversacion		;b782   ; paso_de_conversacion: p09:BE60 y el paso 0xD793 (p09:B891, 13 pasos)
	call numero_7_o_66		;b785   ; numero_7_o_66: p15:BDB8 (B); con el numero 7 sin nada de lo de abajo, 0xCABE = 1, una vez p09:BFB5, y 0xD79A segun 0xC58E (p09:BFA5); con el 0x66, nada; con B, 0xCA64, las salas especiales 0x2A o 2, 0xCB21 distinto de 1, alerta o 0xD8C0, 0xCABE a cero con el sonido 2 y la musica
	call numero_66		;b788   ; numero_66: con el bit 3 de 0xD7E4, el 2 de 0xD7D6 y 0xCB71: con el numero 0x66, una vez (0xCB70) 0xCB72 = 1 y el sonido 0x29; con otro (salvo 7), 0xCB70 a cero y el sonido 5
	call pinta_el_numero		;b78b   ; pinta_el_numero: las dos cifras de 0xD790 en (0x48, 0x70)
	call rotulos_d79a		;b78e   ; rotulos_d79a: con 0xD79A cambiado, los rotulos de p00:51FD
	call sonido_de_d79a		;b791   ; sonido_de_d79a: sin 0xCB70 ni 0xCABE: con 0xD79A en 8, una vez (0xCB77) el sonido 0x2E; en 1, el 0x2A; en 0 y 9, 0xCB77 = 0
	ld a,(0d79ah)		;b794   ; desde 9 en 0xD79A...
	cp 009h		;b797
	jr c,sigue_conversacion		;b799
	ld a,(0cad0h)		;b79b   ; ...sin 0xCAD0...
	or a			;b79e
	jr nz,sigue_conversacion		;b79f
	call onda_a_la_otra		;b7a1   ; onda_a_la_otra: sin 0xCABE, cada 2 cuadros: una columna de 2 x 0x20 de (0x18 + 0xD7BC, 0x90) de esta pagina a la otra
	call d7bc_siguiente		;b7a4   ; d7bc_siguiente: sin 0xCABE, cada 2 cuadros 0xD7BC uno mas (0-0x2F)
sigue_conversacion:
	call 08e1eh		;b7a7   ; a_p03_b8ac: p03:B8AC con el banco 3 en 0xA000
	call mosaico_de_caa3		;b7aa   ; el mosaico
	ld a,(0d79ah)		;b7ad   ; lee 0-9: sube mientras el numero esta en la lista con su bit (p09:BD14)
	cp 009h		;b7b0
	jr c,mira_si_se_sale		;b7b2
	ld a,(0cad0h)		;b7b4   ; lee 1-2: el mosaico de la derecha puesto (p09:BA47)
	or a			;b7b7
	jr nz,mira_si_se_sale		;b7b8
	call onda_de_d0d0		;b7ba   ; onda_de_d0d0: sin 0xCABE, cada 2 cuadros: la columna 0xD7BC de (0xD0 + 0xD7BC, 0xD0) de la pagina 3 a (0x18 + 0xD7BC, 0x90)
mira_si_se_sale:
	call cab4_si		;b7bd   ; cab4_si: sin 0xCABB ni 0xCABA: 0xCAB4 = 1 y p02:8E63
	ld a,(0d7bbh)		;b7c0   ; lee 1: la pantalla de conversacion la abre una escena (llama sola, p09:B8AB)
	or a			;b7c3
	ret nz			;b7c4   ; con 0xD7BB, nada
	ld a,(0e220h)		;b7c5   ; lee la velocidad del mensaje en curso (0 = ninguno; 1-3, 4 sin espera)
	or a			;b7c8
	ret nz			;b7c9   ; con mensaje, nada
	ld a,(0d793h)		;b7ca   ; lee el paso de la pantalla de conversacion (p09:B891, 13 pasos)
	or a			;b7cd
	ret nz			;b7ce   ; fuera del paso 0, nada
	ld a,(0e25ah)		;b7cf
	or a			;b7d2
	jr nz,mira_e255		;b7d3   ; con 0xE25A...
	ld a,(0ca97h)		;b7d5   ; lee 1 si los mensajes salen de los bancos 50-51 y no de 48-49
	or a			;b7d8
	jr nz,mira_e255		;b7d9   ; ...0xCA97...
	ld a,(0e040h)		;b7db   ; lee la escena en curso (1-9, 0 = ninguna; p09:A4A6, guiones en p09:A5D4)
	or a			;b7de
	jr z,tecla_para_salir		;b7df   ; ...o escena, mira 0xE255
mira_e255:
	ld a,(0e255h)		;b7e1
	or a			;b7e4
	jr z,sale_de_la_conversacion		;b7e5   ; a cero: se sale
tecla_para_salir:
	ld a,(0ca97h)		;b7e7   ; lee 1 si los mensajes salen de los bancos 50-51 y no de 48-49
	or a			;b7ea
	ret nz			;b7eb   ; con 0xCA97, nada
	ld a,(0ca09h)		;b7ec   ; una tecla de funcion recien pulsada...
	and 01fh		;b7ef
	ret z			;b7f1   ; ...ninguna, nada
sale_de_la_conversacion:		; a cero los mosaicos de quien habla, la ventana normal, 0xCAD0, 0xE25A y 0xC696; 0xD7B4 = 0xCABB = 0xCA69 = 0xE236 = 1, los dibujos de la sala, p00:5F23, el sonido 7 con 0xCA64; con otra fase o con 0xCABE, p09:BF8B; con 0xCA97: a cero, p11:BE94, las rachas y los sonidos 5 y 0x6A
	xor a			;b7f2
	ld (0e260h),a		;b7f3   ; guarda dos fichas de 8 bytes de los mosaicos de quien habla
	ld (0e268h),a		;b7f6
	ld (0d8a8h),a		;b7f9   ; guarda 1: la ventana del mensaje es estrecha (0xB8 x 0x28)
	ld (0cad0h),a		;b7fc   ; guarda 1-2: el mosaico de la derecha puesto (p09:BA47)
	ld (0e25ah),a		;b7ff
	ld (0c696h),a		;b802
	inc a			;b805
	ld (0d7b4h),a		;b806
	ld (0cabbh),a		;b809
	ld (0ca69h),a		;b80c   ; guarda el quinto byte de la ficha de la sala (p02:877F)
	ld (0e236h),a		;b80f
	call 08cf0h		;b812   ; los dibujos de la sala
	call 05f23h		;b815   ; p00:5F23
	call sonido_7_ca64		;b818   ; sonido_7_ca64: con 0xCA64, el sonido 7
	ld hl,0ca22h		;b81b   ; la fase de antes...
	ld a,(0cb7fh)		;b81e
	cp (hl)			;b821
	jp nz,sonido_2_y_musica		;b822   ; ...distinta: p09:BF8B
	ld hl,0cabeh		;b825   ; con 0xCABE...
	ld a,(hl)			;b828
	or a			;b829
	ld (hl),000h		;b82a
	jp nz,sonido_2_y_musica		;b82c   ; ...tambien
	ld hl,0ca97h		;b82f   ; apunta a 1 si los mensajes salen de los bancos 50-51 y no de 48-49
	ld a,(hl)			;b832
	or a			;b833
	ret z			;b834   ; sin 0xCA97, ya esta
	ld (hl),000h		;b835   ; 0xCA97 = 0
	call 08e9eh		;b837   ; a_p11_be94: p11:BE94 con el banco 11 en 0xA000
	call 0859eh		;b83a   ; rachas_b007_af4c_bancos_9:
	call 06b12h		;b83d   ; sonido_05: pide el sonido 0x05
	jp 06b1eh		;b840   ; sonido_6a: pide el sonido 0x6A (de los que tienen la partitura en un banco de musica, p16:4CE3)
sonido_7_ca64:		; con 0xCA64, el sonido 7
	ld a,(0ca64h)		;b843
	or a			;b846
	ret z			;b847
	jp 06a11h		;b848   ; sonido_07: pide el sonido 0x07
cab4_si:		; sin 0xCABB ni 0xCABA: 0xCAB4 = 1 y p02:8E63
	ld a,(0cabbh)		;b84b
	or a			;b84e
	ret nz			;b84f
	ld a,(0cabah)		;b850
	or a			;b853
	ret nz			;b854
	ld hl,0cab4h		;b855
	ld (hl),001h		;b858
	jp 08e63h		;b85a   ; p02:8E63
mosaico_de_caa3:		; con 0xCAA3 nuevo (o 0xD79A por debajo de 9): a 0xD7BF; con 0x76 o 0x7C, el mosaico de p47:A815 (0xCA86 = 1); si no, con 0xCA86, el de p47:A818 (0xCA86 = 0)
	ld hl,0d7bfh		;b85d
	ld a,(0d79ah)		;b860   ; lee 0-9: sube mientras el numero esta en la lista con su bit (p09:BD14)
	cp 009h		;b863
	ld a,(0caa3h)		;b865
	jr c,pon_d7bf		;b868
	cp (hl)			;b86a   ; el mismo de antes, nada
	ret z			;b86b
pon_d7bf:
	ld (hl),a			;b86c
	ld hl,0ca86h		;b86d
	cp 076h		;b870   ; 0x76...
	jr z,mosaico_a815		;b872
	cp 07ch		;b874   ; ...o 0x7C
	jr z,mosaico_a815		;b876
	ld a,(hl)			;b878
	or a			;b879   ; sin 0xCA86, nada
	ret z			;b87a
	ld (hl),000h		;b87b
	jp 0710ah		;b87d   ; mosaico_a818: el mosaico de p47:A818 en X = 0x60, Y = 0x40 (1 x 3)
mosaico_a815:
	ld a,(hl)			;b880
	dec a			;b881
	ret z			;b882   ; ya puesto, nada
	ld (hl),001h		;b883
	jp 0710fh		;b885   ; mosaico_a815: el mosaico de p47:A815 en X = 0x60, Y = 0x40 (1 x 3)
paso_de_conversacion:		; p09:BE60 y el paso 0xD793 (p09:B891, 13 pasos)
	call teclas_de_conversacion		;b888   ; teclas_de_conversacion: 0xD796/0xD798 = las teclas de las filas 0, 9 y 10 recien pulsadas y 0xD797/0xD799 las de las filas 1 y 10
	ld a,(0d793h)		;b88b   ; lee el paso de la pantalla de conversacion (p09:B891, 13 pasos)
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


conversacion_paso_0:		; con 0xD7BB, cada 3 cuadros (con 0xCA97 el sonido 0x83) a llamar (p09:B8ED); si no, sin 0xD796-0xD797: el numero con izquierda y derecha (p09:BCE6); arriba o abajo, a llamar (paso 5); con 0xD79A desde 9, sin 0xCABE y sin izquierda ni derecha, a llamar (paso 2)
	ld a,(0d7bbh)		;b8ab   ; lee 1: la pantalla de conversacion la abre una escena (llama sola, p09:B8AB)
	or a			;b8ae
	jr nz,llama_con_d7bb		;b8af
	ld hl,0d796h		;b8b1   ; apunta a las teclas de numero recien pulsadas (filas 0, 9 y 10; p09:BE60)
	ld a,(hl)			;b8b4
	inc hl			;b8b5
	or (hl)			;b8b6   ; con 0xD796-0xD797, aparte
	jr nz,$+94		;b8b7
	call numero_con_el_mando		;b8b9   ; el numero
	ld a,(0ca08h)		;b8bc   ; lee el mando: joystick y teclado juntos (bits 0-3 las direcciones, 4-5 los disparos)
	and 003h		;b8bf   ; arriba o abajo...
	jr z,mira_d79a		;b8c1
	call recuadro_de_llamar		;b8c3   ; ...el recuadro...
	ld hl,0d793h		;b8c6   ; ...y el paso 5
	ld (hl),005h		;b8c9
	ret			;b8cb
mira_d79a:
	ld a,(0d79ah)		;b8cc   ; lee 0-9: sube mientras el numero esta en la lista con su bit (p09:BD14)
	cp 009h		;b8cf
	ret c			;b8d1   ; por debajo de 9, nada
	ld a,(0cabeh)		;b8d2   ; lee 1 con el numero 7 en su sitio (p09:BF42)
	or a			;b8d5
	ret nz			;b8d6   ; con 0xCABE, nada
	ld a,(0ca08h)		;b8d7   ; lee el mando: joystick y teclado juntos (bits 0-3 las direcciones, 4-5 los disparos)
	and 00ch		;b8da
	ret nz			;b8dc   ; con izquierda o derecha, nada
	jr a_llamar		;b8dd
llama_con_d7bb:
	ld hl,0d7b6h		;b8df   ; apunta a la espera antes de la siguiente accion de la conversacion
	dec (hl)			;b8e2   ; cada 3 cuadros
	ret nz			;b8e3
	ld (hl),003h		;b8e4
	ld a,(0ca97h)		;b8e6   ; lee 1 si los mensajes salen de los bancos 50-51 y no de 48-49
	or a			;b8e9
	call nz,06bfbh		;b8ea   ; con 0xCA97, el sonido 0x83
a_llamar:		; el recuadro y el paso 2
	call recuadro_de_llamar		;b8ed   ; recuadro_de_llamar: 0x40 x 0x20 de (0x40, 0x88) de la pagina de dibujo a (0, 0xD8) y 0xD7B0-0xD7B3 de p09:B911
	ld hl,0d793h		;b8f0   ; apunta a el paso de la pantalla de conversacion (p09:B891, 13 pasos)
	ld (hl),002h		;b8f3
	ret			;b8f5
recuadro_de_llamar:		; 0x40 x 0x20 de (0x40, 0x88) de la pagina de dibujo a (0, 0xD8) y 0xD7B0-0xD7B3 de p09:B911
	ld hl,04088h		;b8f6
	ld de,000d8h		;b8f9
	ld bc,04020h		;b8fc
	ld a,(0ca42h)		;b8ff   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	call 04767h		;b902   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
	ld de,0d7b0h		;b905   ; el recuadro que crece: sitio y tamano
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


conversacion_paso_1:		; la tecla (p09:B931): 0xD790 = 0xA0 + la tecla, 0xD79A-0xD79B a cero, los rotulos, 0xD7B5 = 0 y el paso siguiente
	call tecla_de_d796		;b915   ; tecla_de_d796: B = el primer bit de 0xD796 (0-7) o de 0xD797 (8-0x0F) y su sonido (p09:B94E)
	ld a,0a0h		;b918   ; 0xA0 + la tecla
	or b			;b91a
	ld (0d790h),a		;b91b   ; guarda el numero de la pantalla de conversacion (BCD; sube y baja con derecha e izquierda, p09:BCF2; 0xD791-0xD792 las cifras altas)
	ld hl,0d79ah		;b91e   ; 0xD79A-0xD79B a cero
	xor a			;b921
	ld (hl),a			;b922
	inc hl			;b923
	ld (hl),a			;b924
	call 051fdh		;b925   ; los rotulos
	xor a			;b928
	ld (0d7b5h),a		;b929
	ld hl,0d793h		;b92c   ; apunta a el paso de la pantalla de conversacion (p09:B891, 13 pasos)
	inc (hl)			;b92f
	ret			;b930
tecla_de_d796:		; B = el primer bit de 0xD796 (0-7) o de 0xD797 (8-0x0F) y su sonido (p09:B94E)
	ld b,000h		;b931
	ld a,(0d796h)		;b933   ; lee las teclas de numero recien pulsadas (filas 0, 9 y 10; p09:BE60)
	or a			;b936
	jr nz,busca_el_bit		;b937
	ld b,008h		;b939
	ld a,(0d797h)		;b93b   ; lee las teclas 8-9 recien pulsadas (p09:BE60)
busca_el_bit:
	rra			;b93e
	jr c,sonido_de_la_tecla		;b93f
	inc b			;b941
	jr busca_el_bit		;b942
sonido_de_la_tecla:
	push bc			;b944
	call sonido_b94e		;b945   ; sonido_b94e: el sonido de la tecla B (p09:B94E: 0x28, 0x29 o 0x2A)
	pop bc			;b948
	ret			;b949
sonido_b94e:		; el sonido de la tecla B (p09:B94E: 0x28, 0x29 o 0x2A)
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


conversacion_paso_2_teclas:		; con 0xD796-0xD797: la tecla (p09:B931), 0xD790 = 0xD790 * 16 + la tecla y el paso de antes
	ld hl,0d796h		;b962   ; apunta a las teclas de numero recien pulsadas (filas 0, 9 y 10; p09:BE60)
	ld a,(hl)			;b965
	inc hl			;b966
	or (hl)			;b967
	ret z			;b968   ; sin teclas, nada
	call tecla_de_d796		;b969   ; tecla_de_d796: B = el primer bit de 0xD796 (0-7) o de 0xD797 (8-0x0F) y su sonido (p09:B94E)
	ld hl,0d790h		;b96c   ; apunta a el numero de la pantalla de conversacion (BCD; sube y baja con derecha e izquierda, p09:BCF2; 0xD791-0xD792 las cifras altas)
	ld a,(hl)			;b96f   ; el numero * 16...
	rla			;b970
	rla			;b971
	rla			;b972
	rla			;b973
	and 0f0h		;b974
	or b			;b976   ; ...+ la tecla
	ld (hl),a			;b977
	ld hl,0d793h		;b978   ; apunta a el paso de la pantalla de conversacion (p09:B891, 13 pasos)
	dec (hl)			;b97b   ; el paso de antes
	ret			;b97c
conversacion_paso_2:		; mira el mensaje (p09:B99A); en el paso 2, el recuadro crece (p09:B9C1) hasta 0x2A de alto; alli, el paso 9 y el mensaje de 0xD7B7 (p09:BE53)
	call mira_el_mensaje		;b97d   ; mira_el_mensaje: sin 0xDFEC: si el byte siguiente del mensaje de 0xD7B7 no es 0x76 (ni 0x7C en la escena 3), guarda el paso en 0xDFED y el paso 0x0C
	ld a,(0d793h)		;b980   ; lee el paso de la pantalla de conversacion (p09:B891, 13 pasos)
	cp 002h		;b983
	ret nz			;b985   ; fuera del paso 2, nada
	call crece_el_recuadro		;b986   ; crece
	ld a,(0d7b2h)		;b989
	cp 02ah		;b98c
	ret c			;b98e   ; aun no
	ld hl,0d793h		;b98f   ; apunta a el paso de la pantalla de conversacion (p09:B891, 13 pasos)
	ld (hl),009h		;b992
	ld hl,(0d7b7h)		;b994   ; lee el mensaje que toca (16 bits)
	jp mensaje_de_conversacion		;b997   ; mensaje_de_conversacion: si el mensaje de HL es de una conversacion de la lista, lo que deja hecho (p06:AEFF); y el mensaje abajo
mira_el_mensaje:		; sin 0xDFEC: si el byte siguiente del mensaje de 0xD7B7 no es 0x76 (ni 0x7C en la escena 3), guarda el paso en 0xDFED y el paso 0x0C
	ld hl,0dfech		;b99a   ; apunta a 1 con el mosaico de quien contesta ya puesto (p09:BCC4)
	ld a,(hl)			;b99d
	or a			;b99e   ; con 0xDFEC, nada
	ret nz			;b99f
	ld hl,(0d7b7h)		;b9a0   ; lee el mensaje que toca (16 bits)
	call 063afh		;b9a3   ; byte_del_mensaje: A = el byte siguiente de HL en el banco de los mensajes
	ld b,a			;b9a6
	cp 076h		;b9a7   ; 0x76: nada
	ret z			;b9a9
	ld a,(0e040h)		;b9aa   ; lee la escena en curso (1-9, 0 = ninguna; p09:A4A6, guiones en p09:A5D4)
	cp 003h		;b9ad
	jr nz,al_paso_0c		;b9af   ; fuera de la escena 3, al paso 0x0C
	ld a,b			;b9b1
	cp 07ch		;b9b2   ; 0x7C en la escena 3: nada
	ret z			;b9b4
al_paso_0c:
	ld a,(0d793h)		;b9b5   ; lee el paso de la pantalla de conversacion (p09:B891, 13 pasos)
	ld (0dfedh),a		;b9b8   ; guarda el paso al que vuelve tras el 0x0C (p09:B99A)
	ld a,00ch		;b9bb
	ld (0d793h),a		;b9bd   ; guarda el paso de la pantalla de conversacion (p09:B891, 13 pasos)
	ret			;b9c0
crece_el_recuadro:		; borra lo de antes (p09:B9C6) y lo pinta mas grande (p09:B9E6)
	call borra_recuadro_99		;b9c1   ; borra_recuadro_99: con alto, el recuadro de 0xD7B0 al color 0x99
	jr recuadro_crece		;b9c4
borra_recuadro_99:		; con alto, el recuadro de 0xD7B0 al color 0x99
	ld a,(0d7b2h)		;b9c6
	or a			;b9c9
	ret z			;b9ca
	call caja_del_recuadro		;b9cb   ; caja_del_recuadro: HL, BC y D del recuadro de 0xD7B0 para borrarlo
	dec l			;b9ce
	ld a,099h		;b9cf
	jp 046ffh		;b9d1   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
borra_recuadro_0:		; el recuadro de 0xD7B0 al color 0
	call caja_del_recuadro		;b9d4   ; caja_del_recuadro: HL, BC y D del recuadro de 0xD7B0 para borrarlo
	xor a			;b9d7
	jp 046ffh		;b9d8   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
caja_del_recuadro:		; HL, BC y D del recuadro de 0xD7B0 para borrarlo
	call recuadro_d7b0		;b9db   ; recuadro_d7b0: HL = (0xD7B0, 0xD7B1), D = 0xD7B3 (ancho), E = 0xD7B2 (alto), A = la pagina
	ld b,d			;b9de
	ld d,a			;b9df
	ld a,l			;b9e0
	add a,e			;b9e1
	ld l,a			;b9e2
	ld c,002h		;b9e3
	ret			;b9e5
recuadro_crece:		; primero a lo ancho (0xD7B1 baja 4 y 0xD7B3 sube 8, una linea de color 7) y luego a lo alto (0xD7B2 sube 2, un marco de color 7)
	ld hl,0d7b1h		;b9e6
	ld a,(hl)			;b9e9
	cp 004h		;b9ea   ; hasta 4...
	jr c,recuadro_alto		;b9ec
	ld a,(hl)			;b9ee   ; ...4 menos a la izquierda...
	sub 004h		;b9ef
	ld (hl),a			;b9f1
	inc hl			;b9f2
	inc hl			;b9f3
	ld a,(hl)			;b9f4   ; ...8 mas de ancho
	add a,008h		;b9f5
	ld (hl),a			;b9f7
	call recuadro_d7b0		;b9f8   ; recuadro_d7b0: HL = (0xD7B0, 0xD7B1), D = 0xD7B3 (ancho), E = 0xD7B2 (alto), A = la pagina
	ld b,d			;b9fb
	ld c,007h		;b9fc   ; una linea de color 7
	jp 0467ch		;b9fe   ; linea_horizontal: orden LINE del VDP (R#36-R#46) con el lado largo en X
recuadro_alto:
	inc hl			;ba01
	ld a,(hl)			;ba02   ; 2 mas de alto...
	add a,002h		;ba03
	ld (hl),a			;ba05
	call recuadro_d7b0		;ba06   ; recuadro_d7b0: HL = (0xD7B0, 0xD7B1), D = 0xD7B3 (ancho), E = 0xD7B2 (alto), A = la pagina
	ld c,007h		;ba09   ; ...un marco de color 7
	jp 046bch		;ba0b   ; marco: cuatro lineas: un marco de D x E desde HL
recuadro_d7b0:		; HL = (0xD7B0, 0xD7B1), D = 0xD7B3 (ancho), E = 0xD7B2 (alto), A = la pagina
	ld hl,0d7b0h		;ba0e   ; apunta a el recuadro de los mensajes: X, Y, alto, ancho (de p09:B911, p09:BA0E)
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
marcos_de_quien_habla:		; los dos marcos de color 0x0D de 0x24 x 0x34 en (0x0E, 0x16) y (0x8E, 0x16)
	ld hl,00e16h		;ba1e
	ld de,02434h		;ba21
	call marco_0d		;ba24   ; marco_0d:
	ld hl,08e16h		;ba27
	ld de,02434h		;ba2a
marco_0d:
	ld a,(0ca42h)		;ba2d   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	ld c,00dh		;ba30
	jp 046bch		;ba32   ; marco: cuatro lineas: un marco de D x E desde HL
mosaico_de_la_izquierda:		; el mosaico de quien habla 0 (0x0B en la escena 3) en (0x10, 0x18)
	ld a,(0e040h)		;ba35   ; lee la escena en curso (1-9, 0 = ninguna; p09:A4A6, guiones en p09:A5D4)
	cp 003h		;ba38
	ld a,00bh		;ba3a
	jr z,pon_mosaico_izquierda		;ba3c
	xor a			;ba3e
pon_mosaico_izquierda:
	ld b,000h		;ba3f
	ld de,01018h		;ba41
	jp 08e16h		;ba44   ; a_p03_b814: p03:B814 con el banco 3 en 0xA000
mosaico_de_la_derecha:		; si el numero esta en la lista (p09:BC0B): 0xCAD0 = 1, el mosaico de quien habla de la entrada + 1 en (0x90, 0x18) y 0xD7BC = 1
	call numero_en_la_lista		;ba47   ; numero_en_la_lista: acarreo si 0xD790 esta en los 16 de 0xD7A0 (no en las escenas 8 y 9; el 0 no vale), con su sitio en 0xD7BE
	ret nc			;ba4a   ; no esta, nada
	ld hl,0cad0h		;ba4b   ; apunta a 1-2: el mosaico de la derecha puesto (p09:BA47)
	ld (hl),001h		;ba4e
	inc a			;ba50
	push af			;ba51
	call 08e2eh		;ba52   ; p02:8E2E
	pop af			;ba55
	ld de,09018h		;ba56
	ld b,001h		;ba59
	call 08e16h		;ba5b   ; a_p03_b814: p03:B814 con el banco 3 en 0xA000
	xor a			;ba5e
	ld hl,0d7bch		;ba5f   ; 0xD7BC = 1
	ld (hl),a			;ba62
	inc a			;ba63
	ld (hl),a			;ba64
	ret			;ba65
conversacion_paso_3:		; salvo con 0xCAD0 = 1: el mensaje cada cuadro; al acabar (o con 0xCADD = 2), con un disparo, con RETURN o con 0xCADD desde 3, el paso siguiente
	ld a,(0cad0h)		;ba66   ; lee 1-2: el mosaico de la derecha puesto (p09:BA47)
	cp 001h		;ba69
	ret z			;ba6b   ; con 0xCAD0 = 1, nada
	call 0657fh		;ba6c   ; mensaje_cada_cuadro_b_9: mensaje_cada_cuadro y deja el banco 9
	ld a,(0caddh)		;ba6f   ; lee 2-3: el mensaje se salta (p09:BA9B)
	cp 002h		;ba72
	jr z,mensaje_acabado		;ba74   ; con 0xCADD = 2, ya
	ld a,(0e220h)		;ba76   ; lee la velocidad del mensaje en curso (0 = ninguno; 1-3, 4 sin espera)
	or a			;ba79
	ret nz			;ba7a   ; con mensaje, nada
mensaje_acabado:
	call cadd_2_a_3		;ba7b   ; cadd_2_a_3: con 0xCADD = 2, 3; si no, 0xCADD y 0xE220 a cero
	ld a,(0caddh)		;ba7e   ; lee 2-3: el mensaje se salta (p09:BA9B)
	cp 003h		;ba81
	jr nc,cadd_a_cero		;ba83   ; desde 3, ya
	ld a,(0ca07h)		;ba85   ; un disparo...
	and 030h		;ba88
	jr nz,d793_siguiente		;ba8a
	ld a,007h		;ba8c   ; ...o la fila 7 del teclado...
	call 00141h		;ba8e   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	rla			;ba91   ; ...RETURN
	ret c			;ba92
cadd_a_cero:
	call cadd_y_mensaje_a_cero		;ba93   ; cadd_y_mensaje_a_cero:
d793_siguiente:		; el paso siguiente de la conversacion
	ld hl,0d793h		;ba96   ; apunta a el paso de la pantalla de conversacion (p09:B891, 13 pasos)
	inc (hl)			;ba99
	ret			;ba9a
cadd_2_a_3:		; con 0xCADD = 2, 3; si no, 0xCADD y 0xE220 a cero
	ld a,(0caddh)		;ba9b   ; lee 2-3: el mensaje se salta (p09:BA9B)
	cp 002h		;ba9e
	jr nz,cadd_y_mensaje_a_cero		;baa0
	ld a,003h		;baa2
	ld (0caddh),a		;baa4   ; guarda 2-3: el mensaje se salta (p09:BA9B)
	ret			;baa7
cadd_y_mensaje_a_cero:
	xor a			;baa8
	ld (0caddh),a		;baa9   ; guarda 2-3: el mensaje se salta (p09:BA9B)
	ld (0e220h),a		;baac   ; guarda la velocidad del mensaje en curso (0 = ninguno; 1-3, 4 sin espera)
	ret			;baaf
conversacion_paso_4:		; 0xCB71 = 0; con 0xCB70, a cero y el sonido 5; el recuadro se cierra (p09:BB27); con 0xD7B1 = 0x5C: p09:BB95, el recuadro de vuelta, el paso 0, 0xD7BB = 0xE255 = 0, 0xD7B5 = 0xD795 = 1; con 0xCB7D (a cero), con el numero 0x51 o 0x82 el sonido 5 y la musica; con alerta p02:8C24, si no p02:8E81
	xor a			;bab0
	ld (0cb71h),a		;bab1   ; guarda 10 al contestar (p09:BC46)
	ld a,(0cb70h)		;bab4   ; lee 1 con el numero 0x66 sonando (p09:BF10)
	or a			;bab7
	jr z,cierra_el_recuadro		;bab8   ; sin 0xCB70, sigue
	xor a			;baba
	ld (0cb70h),a		;babb   ; guarda 1 con el numero 0x66 sonando (p09:BF10)
	call 06b12h		;babe   ; sonido_05: pide el sonido 0x05
cierra_el_recuadro:
	call cierra_recuadro		;bac1   ; cierra_recuadro: el recuadro se cierra (p09:BB32); con alto, borrado
	ld a,(0d7b1h)		;bac4
	cp 05ch		;bac7   ; aun no cerrado
	ret nz			;bac9
	call cad0_2		;baca   ; cad0_2: con el mosaico de la derecha, 0xCAD0 = 2 y 0xE269 = 2
	call fondo_e3		;bacd   ; fondo_e3: la linea de fondo 0 de (0, 0xE3) a (0x40, 0x93)
	xor a			;bad0
	ld (0d793h),a		;bad1   ; guarda el paso de la pantalla de conversacion (p09:B891, 13 pasos)
	ld (0d7bbh),a		;bad4   ; guarda 1: la pantalla de conversacion la abre una escena (llama sola, p09:B8AB)
	ld (0e255h),a		;bad7
	inc a			;bada
	ld (0d7b5h),a		;badb
	ld (0d795h),a		;bade   ; guarda la cuenta de 3 cuadros del numero (p09:BCE6)
	ld hl,0cb7dh		;bae1
	ld a,(hl)			;bae4
	or a			;bae5
	ret z			;bae6   ; sin 0xCB7D, ya esta
	ld (hl),000h		;bae7
	ld a,(0d790h)		;bae9   ; el numero...
	cp 051h		;baec   ; ...0x51...
	jr z,numero_51_82		;baee
	cp 082h		;baf0   ; ...o 0x82
	jr z,numero_51_82		;baf2
musica_tras_conversacion:		; con alerta, p02:8C24; si no, p02:8E81
	ld a,(0ca5fh)		;baf4   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	or a			;baf7
	jp nz,08c24h		;baf8   ; p02:8C24
	jp 08e81h		;bafb   ; p02:8E81
numero_51_82:
	call 06b12h		;bafe   ; sonido_05: pide el sonido 0x05
	call musica_tras_conversacion		;bb01   ; musica_tras_conversacion: con alerta, p02:8C24; si no, p02:8E81
	call musica_de_d800		;bb04   ; la musica de la ficha 0xD800
	ld a,(0ca5fh)		;bb07   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	or a			;bb0a
	ret nz			;bb0b   ; con alerta, nada mas
	ld hl,0ca18h		;bb0c   ; la musica pendiente ya
	ld (hl),0ffh		;bb0f
	ret			;bb11
musica_de_d800:		; con la ficha 0xD800 de tipo 1 en las filas 7-8, la musica pendiente la de p01:6B6D
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
cierra_recuadro:		; el recuadro se cierra (p09:BB32); con alto, borrado
	call cierra_recuadro_b		;bb27   ; cierra_recuadro_b: sin alto: la linea a 0, 4 mas a la derecha y 8 menos de ancho, p09:BB5B y la linea a 7; con alto, p09:BB7E
	ld a,(0d7b2h)		;bb2a
	or a			;bb2d
	ret z			;bb2e
	jp borra_recuadro_0		;bb2f   ; borra_recuadro_0: el recuadro de 0xD7B0 al color 0
cierra_recuadro_b:		; sin alto: la linea a 0, 4 mas a la derecha y 8 menos de ancho, p09:BB5B y la linea a 7; con alto, p09:BB7E
	ld a,(0d7b2h)		;bb32
	or a			;bb35
	jr nz,recuadro_baja		;bb36
	call recuadro_d7b0		;bb38   ; recuadro_d7b0: HL = (0xD7B0, 0xD7B1), D = 0xD7B3 (ancho), E = 0xD7B2 (alto), A = la pagina
	ld b,d			;bb3b
	ld c,000h		;bb3c
	call 0467ch		;bb3e   ; linea_horizontal: orden LINE del VDP (R#36-R#46) con el lado largo en X
	ld hl,0d7b0h		;bb41   ; apunta a el recuadro de los mensajes: X, Y, alto, ancho (de p09:B911, p09:BA0E)
	inc hl			;bb44
	ld a,(hl)			;bb45
	add a,004h		;bb46
	ld (hl),a			;bb48
	inc hl			;bb49
	inc hl			;bb4a
	ld a,(hl)			;bb4b
	sub 008h		;bb4c
	ld (hl),a			;bb4e
	call fondo_e3		;bb4f   ; fondo_e3: la linea de fondo 0 de (0, 0xE3) a (0x40, 0x93)
	call recuadro_d7b0		;bb52   ; recuadro_d7b0: HL = (0xD7B0, 0xD7B1), D = 0xD7B3 (ancho), E = 0xD7B2 (alto), A = la pagina
	ld b,d			;bb55
	ld c,007h		;bb56
	jp 0467ch		;bb58   ; linea_horizontal: orden LINE del VDP (R#36-R#46) con el lado largo en X
fondo_e3:		; la linea de fondo 0 de (0, 0xE3) a (0x40, 0x93)
	xor a			;bb5b
	ld c,002h		;bb5c
	jr linea_de_fondo		;bb5e
fondo_e3_mas:		; hasta 0x16 de alto, la linea siguiente del fondo
	ld a,(0d7b2h)		;bb60
	cp 016h		;bb63
	ret nc			;bb65
	inc a			;bb66
	ld c,004h		;bb67
linea_de_fondo:		; la linea 0xE3 + A de la pagina 3 a (0x40, 0x93 + A), 0x40 x C
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
recuadro_baja:		; 2 menos de alto; a 0, borrado; si no, el marco y el fondo
	ld hl,0d7b2h		;bb7e
	ld a,(hl)			;bb81
	sub 002h		;bb82
	ld (hl),a			;bb84
	ld a,(hl)			;bb85
	or a			;bb86
	jp z,borra_recuadro_0		;bb87   ; borra_recuadro_0: el recuadro de 0xD7B0 al color 0
	call recuadro_d7b0		;bb8a   ; recuadro_d7b0: HL = (0xD7B0, 0xD7B1), D = 0xD7B3 (ancho), E = 0xD7B2 (alto), A = la pagina
	ld c,007h		;bb8d
	call 046bch		;bb8f   ; marco: cuatro lineas: un marco de D x E desde HL
	jp fondo_e3_mas		;bb92   ; fondo_e3_mas: hasta 0x16 de alto, la linea siguiente del fondo
cad0_2:		; con el mosaico de la derecha, 0xCAD0 = 2 y 0xE269 = 2
	ld a,(0e268h)		;bb95
	or a			;bb98
	ret z			;bb99
	ld a,002h		;bb9a
	ld (0cad0h),a		;bb9c   ; guarda 1-2: el mosaico de la derecha puesto (p09:BA47)
	ld (0e269h),a		;bb9f
	ret			;bba2
conversacion_paso_5:		; el recuadro crece hasta 0x2A; alli, el paso siguiente, p09:BBB6 y el mensaje de p48:8016 abajo
	call crece_el_recuadro		;bba3   ; crece_el_recuadro: borra lo de antes (p09:B9C6) y lo pinta mas grande (p09:B9E6)
	ld a,(0d7b2h)		;bba6
	cp 02ah		;bba9
	ret c			;bbab
	ld hl,0d793h		;bbac   ; apunta a el paso de la pantalla de conversacion (p09:B891, 13 pasos)
	inc (hl)			;bbaf
	call numero_24		;bbb0   ; numero_24: con el numero 0x24, sin el bit 6 de 0xD7E4 y con 0xCB72: el bit 6, fuera el 2 y 0xD7A0 = 0x24
	jp 064e8h		;bbb3   ; mensaje_8016: el mensaje de p48:8016 abajo
numero_24:		; con el numero 0x24, sin el bit 6 de 0xD7E4 y con 0xCB72: el bit 6, fuera el 2 y 0xD7A0 = 0x24
	ld a,(0d790h)		;bbb6   ; lee el numero de la pantalla de conversacion (BCD; sube y baja con derecha e izquierda, p09:BCF2; 0xD791-0xD792 las cifras altas)
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
	ld hl,0d7a0h		;bbcb   ; apunta a la lista de 16 numeros de la conversacion (de p09:B67E; p09:BC0B)
	ld (hl),024h		;bbce
	ret			;bbd0
conversacion_paso_6:		; el mensaje cada cuadro; al acabar, 0x30 cuadros y el paso siguiente
	call 0657fh		;bbd1   ; mensaje_cada_cuadro_b_9: mensaje_cada_cuadro y deja el banco 9
	ld a,(0e220h)		;bbd4   ; lee la velocidad del mensaje en curso (0 = ninguno; 1-3, 4 sin espera)
	or a			;bbd7
	ret nz			;bbd8
	ld hl,0d7b6h		;bbd9   ; apunta a la espera antes de la siguiente accion de la conversacion
	ld (hl),030h		;bbdc
	jp d793_siguiente		;bbde   ; d793_siguiente: el paso siguiente de la conversacion
conversacion_paso_7:		; al acabar la espera: la conversacion del numero (p09:BC00); si encontro su ficha, el recuadro de mensajes borrado, 3 cuadros y el paso siguiente; si no, el paso 4
	ld hl,0d7b6h		;bbe1   ; apunta a la espera antes de la siguiente accion de la conversacion
	dec (hl)			;bbe4
	ret nz			;bbe5
	call conversacion_del_numero		;bbe6   ; conversacion_del_numero: 0xCA9C = 0 y, si el numero esta en la lista, su conversacion (p01:63C0)
	ld a,(0ca9ch)		;bbe9   ; lee 1 si una conversacion ha encontrado su ficha
	or a			;bbec
	jr z,al_paso_4		;bbed
	call borra_mensajes		;bbef   ; borra_mensajes: 0xB0 x 0x20 en (8, 0x98) al color 0x99
	ld hl,0d7b6h		;bbf2   ; apunta a la espera antes de la siguiente accion de la conversacion
	ld (hl),003h		;bbf5
	jp d793_siguiente		;bbf7   ; d793_siguiente: el paso siguiente de la conversacion
al_paso_4:
	ld hl,0d793h		;bbfa   ; apunta a el paso de la pantalla de conversacion (p09:B891, 13 pasos)
	ld (hl),004h		;bbfd
	ret			;bbff
conversacion_del_numero:		; 0xCA9C = 0 y, si el numero esta en la lista, su conversacion (p01:63C0)
	xor a			;bc00
	ld (0ca9ch),a		;bc01   ; guarda 1 si una conversacion ha encontrado su ficha
	call numero_en_la_lista		;bc04   ; numero_en_la_lista: acarreo si 0xD790 esta en los 16 de 0xD7A0 (no en las escenas 8 y 9; el 0 no vale), con su sitio en 0xD7BE
	ret nc			;bc07
	jp 063c0h		;bc08   ; conversacion_a: la conversacion A del banco 48
numero_en_la_lista:		; acarreo si 0xD790 esta en los 16 de 0xD7A0 (no en las escenas 8 y 9; el 0 no vale), con su sitio en 0xD7BE
	ld a,(0e040h)		;bc0b   ; lee la escena en curso (1-9, 0 = ninguna; p09:A4A6, guiones en p09:A5D4)
	cp 008h		;bc0e
	jr z,no_esta		;bc10
	ld a,(0e040h)		;bc12   ; lee la escena en curso (1-9, 0 = ninguna; p09:A4A6, guiones en p09:A5D4)
	cp 009h		;bc15
	jr z,no_esta		;bc17
	ld a,(0d790h)		;bc19   ; lee el numero de la pantalla de conversacion (BCD; sube y baja con derecha e izquierda, p09:BCF2; 0xD791-0xD792 las cifras altas)
	ld c,a			;bc1c
	ld b,010h		;bc1d   ; 16 numeros
	ld hl,0d7a0h		;bc1f   ; apunta a la lista de 16 numeros de la conversacion (de p09:B67E; p09:BC0B)
mira_numero:
	ld a,(hl)			;bc22
	cp c			;bc23
	jr z,esta		;bc24
	inc hl			;bc26
	djnz mira_numero		;bc27
no_esta:
	or a			;bc29
	ret			;bc2a
esta:
	or a			;bc2b
	ret z			;bc2c   ; el 0, no
	ld a,010h		;bc2d   ; su sitio
	sub b			;bc2f
	ld (0d7beh),a		;bc30   ; guarda el sitio del numero en la lista 0xD7A0 (p09:BC2D)
	scf			;bc33
	ret			;bc34
conversacion_paso_8:		; cada 3 cuadros, 0xD79A sube (p09:BD60); desde 9: 0xCB71 = 10, el mensaje de 0xD7B7, el paso siguiente, 0xDFEC = 1 y el mosaico de la derecha
	ld hl,0d7b6h		;bc35   ; apunta a la espera antes de la siguiente accion de la conversacion
	dec (hl)			;bc38
	ret nz			;bc39
	ld (hl),003h		;bc3a
	call d79a_sube		;bc3c   ; d79a_sube: por debajo de 9: 0xD79B = 0xD79A y sube uno (en una escena, a 9); la primera vez (0xCB77), el sonido 0x2A
	ld a,(0d79ah)		;bc3f   ; lee 0-9: sube mientras el numero esta en la lista con su bit (p09:BD14)
	cp 009h		;bc42
	ret c			;bc44
	inc a			;bc45
	ld (0cb71h),a		;bc46   ; guarda 10 al contestar (p09:BC46)
	ld hl,(0d7b7h)		;bc49   ; lee el mensaje que toca (16 bits)
	call mensaje_de_conversacion		;bc4c   ; mensaje_de_conversacion: si el mensaje de HL es de una conversacion de la lista, lo que deja hecho (p06:AEFF); y el mensaje abajo
	call d793_siguiente		;bc4f   ; d793_siguiente: el paso siguiente de la conversacion
	ld hl,0dfech		;bc52   ; apunta a 1 con el mosaico de quien contesta ya puesto (p09:BCC4)
	ld (hl),001h		;bc55
	jp mosaico_de_la_derecha		;bc57   ; mosaico_de_la_derecha: si el numero esta en la lista (p09:BC0B): 0xCAD0 = 1, el mosaico de quien habla de la entrada + 1 en (0x90, 0x18) y 0xD7BC = 1
conversacion_paso_9:		; mira el mensaje; en el paso 9 (salvo con 0xCAD0 = 1) el mensaje cada cuadro; al acabar, la accion siguiente de la conversacion (p01:6182)
	call mira_el_mensaje		;bc5a   ; mira_el_mensaje: sin 0xDFEC: si el byte siguiente del mensaje de 0xD7B7 no es 0x76 (ni 0x7C en la escena 3), guarda el paso en 0xDFED y el paso 0x0C
	ld a,(0d793h)		;bc5d   ; lee el paso de la pantalla de conversacion (p09:B891, 13 pasos)
	cp 009h		;bc60
	ret nz			;bc62
	ld a,(0cad0h)		;bc63   ; lee 1-2: el mosaico de la derecha puesto (p09:BA47)
	cp 001h		;bc66
	ret z			;bc68
	call 0657fh		;bc69   ; mensaje_cada_cuadro_b_9: mensaje_cada_cuadro y deja el banco 9
	ld a,(0caddh)		;bc6c   ; lee 2-3: el mensaje se salta (p09:BA9B)
	cp 002h		;bc6f
	jr z,accion_siguiente		;bc71
	ld a,(0e220h)		;bc73   ; lee la velocidad del mensaje en curso (0 = ninguno; 1-3, 4 sin espera)
	or a			;bc76
	ret nz			;bc77
accion_siguiente:
	call cadd_2_a_3		;bc78   ; cadd_2_a_3: con 0xCADD = 2, 3; si no, 0xCADD y 0xE220 a cero
	jp 06182h		;bc7b   ; siguiente_accion: la accion que sigue en la conversacion (0xFE [espera]...) o acaba
conversacion_paso_10:		; al acabar la espera, el recuadro borrado, el mensaje de 0xD7B7 y el paso 9
	ld hl,0d7b6h		;bc7e   ; apunta a la espera antes de la siguiente accion de la conversacion
	dec (hl)			;bc81
	ret nz			;bc82
	call borra_mensajes		;bc83   ; borra_mensajes: 0xB0 x 0x20 en (8, 0x98) al color 0x99
	ld hl,(0d7b7h)		;bc86   ; lee el mensaje que toca (16 bits)
	call mensaje_de_conversacion		;bc89   ; mensaje_de_conversacion: si el mensaje de HL es de una conversacion de la lista, lo que deja hecho (p06:AEFF); y el mensaje abajo
	ld hl,0d793h		;bc8c   ; apunta a el paso de la pantalla de conversacion (p09:B891, 13 pasos)
	ld (hl),009h		;bc8f
	ret			;bc91
conversacion_paso_11:		; con 0xCADD = 3 (o la cuenta de 0xCB5E acabada con 0xCB5D, o un disparo o RETURN): 0xCADD y el mensaje a cero, con 0xCA97 la orden 0xF6, y el paso 4
	ld a,(0caddh)		;bc92   ; lee 2-3: el mensaje se salta (p09:BA9B)
	cp 003h		;bc95
	jr z,fin_de_mensajes		;bc97
	ld a,(0cb5dh)		;bc99
	or a			;bc9c
	jr z,espera_disparo		;bc9d
	ld hl,0cb5eh		;bc9f
	dec (hl)			;bca2
	jr z,fin_de_mensajes		;bca3
	ret			;bca5
espera_disparo:
	ld a,(0ca07h)		;bca6   ; lee lo recien pulsado del mando (los bits de 0xCA08 que no estaban)
	and 030h		;bca9
	jr nz,fin_de_mensajes		;bcab
	ld a,007h		;bcad
	call 00141h		;bcaf   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	rla			;bcb2
	ret c			;bcb3
fin_de_mensajes:
	call cadd_y_mensaje_a_cero		;bcb4   ; cadd_y_mensaje_a_cero:
	ld a,(0ca97h)		;bcb7   ; lee 1 si los mensajes salen de los bancos 50-51 y no de 48-49
	or a			;bcba
	call nz,06be8h		;bcbb   ; orden_sonido_f6: la orden 0xF6 al sonido
	ld hl,0d793h		;bcbe   ; apunta a el paso de la pantalla de conversacion (p09:B891, 13 pasos)
	ld (hl),004h		;bcc1
	ret			;bcc3
conversacion_paso_12:		; con 0xDFEC: 0xD79A sube y, salvo con 0xCAD0 = 1, desde 9 vuelve al paso de 0xDFED; sin el, 0xDFEC = 1 y el mosaico de la derecha
	ld hl,0dfech		;bcc4   ; apunta a 1 con el mosaico de quien contesta ya puesto (p09:BCC4)
	ld a,(hl)			;bcc7
	or a			;bcc8
	jr z,pon_dfec		;bcc9
	call d79a_sube		;bccb   ; d79a_sube: por debajo de 9: 0xD79B = 0xD79A y sube uno (en una escena, a 9); la primera vez (0xCB77), el sonido 0x2A
	ld a,(0cad0h)		;bcce   ; lee 1-2: el mosaico de la derecha puesto (p09:BA47)
	cp 001h		;bcd1
	ret z			;bcd3
	ld a,(0d79ah)		;bcd4   ; lee 0-9: sube mientras el numero esta en la lista con su bit (p09:BD14)
	cp 009h		;bcd7
	ret c			;bcd9
	ld a,(0dfedh)		;bcda   ; lee el paso al que vuelve tras el 0x0C (p09:B99A)
	ld (0d793h),a		;bcdd   ; guarda el paso de la pantalla de conversacion (p09:B891, 13 pasos)
	ret			;bce0
pon_dfec:
	ld (hl),001h		;bce1
	jp mosaico_de_la_derecha		;bce3   ; mosaico_de_la_derecha: si el numero esta en la lista (p09:BC0B): 0xCAD0 = 1, el mosaico de quien habla de la entrada + 1 en (0x90, 0x18) y 0xD7BC = 1
numero_con_el_mando:		; cada 3 cuadros: el numero con izquierda y derecha (p09:BCF2) y 0xD79A (p09:BD14)
	ld hl,0d795h		;bce6   ; apunta a la cuenta de 3 cuadros del numero (p09:BCE6)
	dec (hl)			;bce9
	ret nz			;bcea
	ld (hl),003h		;bceb
	call numero_mas_menos		;bced   ; numero_mas_menos: con izquierda o derecha (no las dos): 0xD7B5 = 0 y 0xD790 uno menos (izquierda) o uno mas (derecha), en BCD
	jr d79a_segun_numero		;bcf0
numero_mas_menos:		; con izquierda o derecha (no las dos): 0xD7B5 = 0 y 0xD790 uno menos (izquierda) o uno mas (derecha), en BCD
	ld a,(0ca08h)		;bcf2   ; lee el mando: joystick y teclado juntos (bits 0-3 las direcciones, 4-5 los disparos)
	and 00ch		;bcf5
	or a			;bcf7
	ret z			;bcf8   ; ninguna, nada
	cp 00ch		;bcf9
	ret z			;bcfb   ; las dos, nada
	xor a			;bcfc
	ld (0d7b5h),a		;bcfd
	ld a,(0ca08h)		;bd00   ; lee el mando: joystick y teclado juntos (bits 0-3 las direcciones, 4-5 los disparos)
	bit 3,a		;bd03   ; la derecha...
	ld hl,0d790h		;bd05   ; apunta a el numero de la pantalla de conversacion (BCD; sube y baja con derecha e izquierda, p09:BCF2; 0xD791-0xD792 las cifras altas)
	ld a,(hl)			;bd08
	jr nz,uno_mas_bcd		;bd09
	sub 001h		;bd0b   ; ...si no, uno menos
bcd:
	daa			;bd0d
	ld (hl),a			;bd0e
	ret			;bd0f
uno_mas_bcd:
	add a,001h		;bd10
	jr bcd		;bd12
d79a_segun_numero:		; 0xD79B = 0xD79A; con el numero en la lista y su bit de 0xD79C (p09:BD36) y sin 0xD7B5, 0xD79A sube hasta 9; si no, baja hasta 0
	ld hl,0d79ah		;bd14   ; apunta a 0-9: sube mientras el numero esta en la lista con su bit (p09:BD14)
	ld a,(hl)			;bd17
	ld (0d79bh),a		;bd18   ; guarda 0xD79A de antes (p09:BDD7)
	call bit_de_d79c		;bd1b   ; bit_de_d79c: acarreo si el numero esta en los 16 de 0xD7A0 y su bit de 0xD79C-0xD79D esta puesto
	ld hl,0d79ah		;bd1e   ; apunta a 0-9: sube mientras el numero esta en la lista con su bit (p09:BD14)
	jr nc,d79a_baja		;bd21
	ld a,(0d7b5h)		;bd23
	or a			;bd26
	jr nz,d79a_baja		;bd27
	ld a,(hl)			;bd29
	cp 009h		;bd2a
	ret nc			;bd2c
	inc a			;bd2d
	ld (hl),a			;bd2e
	ret			;bd2f
d79a_baja:
	ld a,(hl)			;bd30
	or a			;bd31
	ret z			;bd32   ; en 0, nada
	dec a			;bd33   ; uno menos
	ld (hl),a			;bd34
	ret			;bd35
bit_de_d79c:		; acarreo si el numero esta en los 16 de 0xD7A0 y su bit de 0xD79C-0xD79D esta puesto
	ld a,(0d790h)		;bd36   ; lee el numero de la pantalla de conversacion (BCD; sube y baja con derecha e izquierda, p09:BCF2; 0xD791-0xD792 las cifras altas)
	ld c,a			;bd39
	ld b,010h		;bd3a
	ld hl,0d7a0h		;bd3c   ; apunta a la lista de 16 numeros de la conversacion (de p09:B67E; p09:BC0B)
mira_d7a0:
	ld a,(hl)			;bd3f
	cp c			;bd40
	jr z,bit_del_numero		;bd41   ; es este
	inc hl			;bd43
	djnz mira_d7a0		;bd44   ; los 16
	or a			;bd46   ; no esta: sin acarreo
	ret			;bd47
bit_del_numero:
	ld a,010h		;bd48
	sub b			;bd4a
	inc a			;bd4b
	cp 009h		;bd4c
	ld hl,0d79ch		;bd4e   ; apunta a 16 bits: que numeros de la lista 0xD7A0 suben 0xD79A (p09:BD36)
	jr c,gira_bit		;bd51
	sub 008h		;bd53
	inc hl			;bd55
gira_bit:
	ld b,a			;bd56
	ld a,(hl)			;bd57
gira_c:
	rra			;bd58
	rr c		;bd59
	djnz gira_c		;bd5b
	rl c		;bd5d
	ret			;bd5f
d79a_sube:		; por debajo de 9: 0xD79B = 0xD79A y sube uno (en una escena, a 9); la primera vez (0xCB77), el sonido 0x2A
	ld hl,0d79ah		;bd60   ; apunta a 0-9: sube mientras el numero esta en la lista con su bit (p09:BD14)
	ld a,(hl)			;bd63
	cp 009h		;bd64
	ret nc			;bd66
	ld (0d79bh),a		;bd67   ; guarda 0xD79A de antes (p09:BDD7)
	ld a,(0e040h)		;bd6a   ; lee la escena en curso (1-9, 0 = ninguna; p09:A4A6, guiones en p09:A5D4)
	or a			;bd6d
	ld a,009h		;bd6e
	jr nz,d79a_hasta_9		;bd70
	ld hl,0d79ah		;bd72   ; apunta a 0-9: sube mientras el numero esta en la lista con su bit (p09:BD14)
	ld a,(hl)			;bd75
	inc a			;bd76
d79a_hasta_9:
	cp 009h		;bd77
	jr c,pon_d79a		;bd79
	ld a,009h		;bd7b
pon_d79a:
	ld (hl),a			;bd7d
	ld hl,0cb77h		;bd7e   ; apunta a 1 tras el sonido de 0xD79A (p09:BEDF)
	ld a,(hl)			;bd81
	or a			;bd82
	ret nz			;bd83
	ld (hl),001h		;bd84
	jp 06aa3h		;bd86   ; sonido_2a: pide el sonido 0x2A
pinta_el_numero:		; las dos cifras de 0xD790 en (0x48, 0x70)
	ld hl,0d790h		;bd89   ; apunta a el numero de la pantalla de conversacion (BCD; sube y baja con derecha e izquierda, p09:BCF2; 0xD791-0xD792 las cifras altas)
	ld de,07048h		;bd8c
	jr dos_cifras		;bd8f
pinta_numero_entero:		; las seis cifras de 0xD790-0xD792 desde (0x48, 0x70) hacia la izquierda
	call pinta_el_numero		;bd91   ; pinta_el_numero: las dos cifras de 0xD790 en (0x48, 0x70)
	inc hl			;bd94
	ld a,d			;bd95
	sub 008h		;bd96
	ld d,a			;bd98
	call dos_cifras		;bd99   ; dos_cifras: las dos cifras del byte de HL
	inc hl			;bd9c
	ld a,(hl)			;bd9d
	jr una_cifra		;bd9e
dos_cifras:		; las dos cifras del byte de HL
	ld a,(hl)			;bda0
	call una_cifra		;bda1   ; una_cifra: la cifra A (p09:BDC1, 2 x 1) en (D, E) con p02:8D25 y 8 a la izquierda
	ld a,(hl)			;bda4
	rra			;bda5
	rra			;bda6
	rra			;bda7
	rra			;bda8
una_cifra:		; la cifra A (p09:BDC1, 2 x 1) en (D, E) con p02:8D25 y 8 a la izquierda
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


rotulos_d79a:		; con 0xD79A cambiado, los rotulos de p00:51FD
	ld a,(0d79bh)		;bdd7   ; lee 0xD79A de antes (p09:BDD7)
	ld b,a			;bdda
	ld a,(0d79ah)		;bddb   ; lee 0-9: sube mientras el numero esta en la lista con su bit (p09:BD14)
	cp b			;bdde
	ret z			;bddf
	cp 009h		;bde0
	jp c,051fdh		;bde2   ; rotulos_a7b1:
	ld (0d79bh),a		;bde5   ; guarda 0xD79A de antes (p09:BDD7)
	jp 051fdh		;bde8   ; rotulos_a7b1:
borra_mensajes:		; 0xB0 x 0x20 en (8, 0x98) al color 0x99
	ld hl,00898h		;bdeb
	ld bc,0b020h		;bdee
	ld a,(0ca42h)		;bdf1   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	ld d,a			;bdf4
	ld a,099h		;bdf5
	jp 046ffh		;bdf7   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
onda_a_la_otra:		; sin 0xCABE, cada 2 cuadros: una columna de 2 x 0x20 de (0x18 + 0xD7BC, 0x90) de esta pagina a la otra
	ld a,(0cabeh)		;bdfa   ; lee 1 con el numero 7 en su sitio (p09:BF42)
	or a			;bdfd
	ret nz			;bdfe   ; con 0xCABE, nada
	ld a,(0ca03h)		;bdff   ; lee el contador de cuadros (uno mas en cada interrupcion)
	rra			;be02
	ret c			;be03   ; cada 2 cuadros
	ld a,(0d7bch)		;be04   ; la columna 0xD7BC...
	ld de,09018h		;be07
	add a,e			;be0a
	ld e,a			;be0b
	ld h,d			;be0c
	ld l,e			;be0d
	ld bc,02001h		;be0e   ; ...2 x 0x20
	jp 0475ah		;be11   ; copia_rectangulo_a_la_otra: p00:4767 de la pagina 0xCA42 a la otra
d7bc_siguiente:		; sin 0xCABE, cada 2 cuadros 0xD7BC uno mas (0-0x2F)
	ld a,(0cabeh)		;be14   ; lee 1 con el numero 7 en su sitio (p09:BF42)
	or a			;be17
	ret nz			;be18
	ld a,(0ca03h)		;be19   ; lee el contador de cuadros (uno mas en cada interrupcion)
	rra			;be1c
	ret c			;be1d
	ld hl,0d7bch		;be1e   ; apunta a la columna de la onda (0-0x2F, p09:BE14)
	inc (hl)			;be21
	ld a,(hl)			;be22
	cp 030h		;be23   ; hasta 0x30
	ret c			;be25
	ld (hl),000h		;be26
	ret			;be28
onda_de_d0d0:		; sin 0xCABE, cada 2 cuadros: la columna 0xD7BC de (0xD0 + 0xD7BC, 0xD0) de la pagina 3 a (0x18 + 0xD7BC, 0x90)
	ld a,(0cabeh)		;be29   ; lee 1 con el numero 7 en su sitio (p09:BF42)
	or a			;be2c
	ret nz			;be2d
	ld a,(0ca03h)		;be2e   ; lee el contador de cuadros (uno mas en cada interrupcion)
	rra			;be31
	ret c			;be32
	ld a,(0d7bch)		;be33   ; lee la columna de la onda (0-0x2F, p09:BE14)
	ld de,09018h		;be36
	add a,e			;be39
	ld e,a			;be3a
	ld a,(0d7bch)		;be3b   ; lee la columna de la onda (0-0x2F, p09:BE14)
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


mensaje_de_conversacion:		; si el mensaje de HL es de una conversacion de la lista, lo que deja hecho (p06:AEFF); y el mensaje abajo
	push hl			;be53
	call 06383h		;be54   ; numero_de_conversacion: A = el numero de la conversacion BC en la lista de p48:800C (acarreo si esta)
	jr nc,mensaje_abajo_9		;be57
	call 08e43h		;be59   ; a_p06_aeff: p06:AEFF con el banco 6 en 0xA000
mensaje_abajo_9:
	pop hl			;be5c
	jp 064f4h		;be5d   ; mensaje_abajo_bancos_9:
teclas_de_conversacion:		; 0xD796/0xD798 = las teclas de las filas 0, 9 y 10 recien pulsadas y 0xD797/0xD799 las de las filas 1 y 10
	call teclas_0_9_10		;be60   ; teclas_0_9_10: A = la fila 0 (los numeros 0-7) mas los bits de las filas 9 y 10 (el teclado numerico)
	call guarda_d798		;be63   ; guarda_d798:
	call teclas_1_10		;be66   ; teclas_1_10: A = los bits 0-1 de la fila 1 (8 y 9) y los 3-4 de la fila 10
	jr guarda_d799		;be69
guarda_d798:
	ld hl,0d798h		;be6b
	jr guarda_teclas		;be6e
guarda_d799:
	ld hl,0d799h		;be70
	jr guarda_teclas		;be73
guarda_teclas:		; (HL) = A y (HL - 2) = lo que no estaba pulsado
	ld c,(hl)			;be75   ; lo de antes...
	ld (hl),a			;be76   ; ...lo de ahora...
	xor c			;be77   ; ...lo que no estaba...
	and (hl)			;be78
	dec hl			;be79
	dec hl			;be7a
	ld (hl),a			;be7b   ; ...dos bytes antes
	ret			;be7c
teclas_0_9_10:		; A = la fila 0 (los numeros 0-7) mas los bits de las filas 9 y 10 (el teclado numerico)
	xor a			;be7d
	call 00141h		;be7e   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix | la fila 0
	cpl			;be81
	push af			;be82
	ld a,009h		;be83
	call 00141h		;be85   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix | la fila 9
	cpl			;be88
	push af			;be89
	ld a,00ah		;be8a
	call 00141h		;be8c   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix | la fila 10
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
teclas_1_10:		; A = los bits 0-1 de la fila 1 (8 y 9) y los 3-4 de la fila 10
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
numero_del_mensaje:		; antes de la escena 7: el numero de la lista 0xD7A0 que toca al mensaje (su segundo byte - 0x76, o - 0xCA desde 0xD0, en p09:BFE1); desde la 7, 0xD790 = 0
	ld a,(0e040h)		;beb5   ; lee la escena en curso (1-9, 0 = ninguna; p09:A4A6, guiones en p09:A5D4)
	cp 007h		;beb8
	jr nc,numero_a_cero		;beba
	call 063b6h		;bebc   ; el segundo byte del mensaje
	cp 0d0h		;bebf
	ld b,076h		;bec1   ; por debajo de 0xD0, - 0x76...
	jr c,sitio_en_bfe1		;bec3
	ld b,0cah		;bec5   ; ...si no, - 0xCA
sitio_en_bfe1:
	sub b			;bec7
	ld hl,0bfe1h		;bec8
	call 0423eh		;becb   ; suma_a_hl: HL = HL + A
	ld a,(hl)			;bece
	ld hl,0d7a0h		;becf   ; apunta a la lista de 16 numeros de la conversacion (de p09:B67E; p09:BC0B)
	call 0423eh		;bed2   ; el numero
	ld a,(hl)			;bed5
	ld (0d790h),a		;bed6   ; guarda el numero de la pantalla de conversacion (BCD; sube y baja con derecha e izquierda, p09:BCF2; 0xD791-0xD792 las cifras altas)
	ret			;bed9
numero_a_cero:
	xor a			;beda
	ld (0d790h),a		;bedb   ; guarda el numero de la pantalla de conversacion (BCD; sube y baja con derecha e izquierda, p09:BCF2; 0xD791-0xD792 las cifras altas)
	ret			;bede
sonido_de_d79a:		; sin 0xCB70 ni 0xCABE: con 0xD79A en 8, una vez (0xCB77) el sonido 0x2E; en 1, el 0x2A; en 0 y 9, 0xCB77 = 0
	ld a,(0cb70h)		;bedf   ; lee 1 con el numero 0x66 sonando (p09:BF10)
	or a			;bee2
	ret nz			;bee3
	ld a,(0cabeh)		;bee4   ; lee 1 con el numero 7 en su sitio (p09:BF42)
	or a			;bee7
	ret nz			;bee8
	ld hl,0cb77h		;bee9   ; apunta a 1 tras el sonido de 0xD79A (p09:BEDF)
	ld a,(0d79ah)		;beec   ; lee 0-9: sube mientras el numero esta en la lista con su bit (p09:BD14)
	or a			;beef
	jr z,cb77_a_cero		;bef0   ; en 0...
	cp 009h		;bef2
	jr z,cb77_a_cero		;bef4   ; ...o 9, a cero
	cp 001h		;bef6
	jr z,sonido_2a_una_vez		;bef8   ; en 1, el 0x2A
	cp 008h		;befa
	ret nz			;befc   ; en 8, el 0x2E
	ld a,(hl)			;befd
	or a			;befe
	ret nz			;beff
	ld (hl),001h		;bf00
	jp 06ab3h		;bf02   ; sonido_2e: pide el sonido 0x2E
sonido_2a_una_vez:
	ld a,(hl)			;bf05
	or a			;bf06
	ret nz			;bf07
	ld (hl),001h		;bf08
	jp 06aa3h		;bf0a   ; sonido_2a: pide el sonido 0x2A
cb77_a_cero:
	ld (hl),000h		;bf0d
	ret			;bf0f
numero_66:		; con el bit 3 de 0xD7E4, el 2 de 0xD7D6 y 0xCB71: con el numero 0x66, una vez (0xCB70) 0xCB72 = 1 y el sonido 0x29; con otro (salvo 7), 0xCB70 a cero y el sonido 5
	ld a,(0d7e4h)		;bf10
	bit 3,a		;bf13
	ret z			;bf15
	ld a,(0d7d6h)		;bf16
	bit 2,a		;bf19
	ret z			;bf1b
	ld a,(0cb71h)		;bf1c   ; lee 10 al contestar (p09:BC46)
	or a			;bf1f
	ret z			;bf20
	ld hl,0cb70h		;bf21   ; apunta a 1 con el numero 0x66 sonando (p09:BF10)
	ld a,(0d790h)		;bf24   ; lee el numero de la pantalla de conversacion (BCD; sube y baja con derecha e izquierda, p09:BCF2; 0xD791-0xD792 las cifras altas)
	cp 066h		;bf27   ; el 0x66
	jr z,cb72_a_1		;bf29
	cp 007h		;bf2b   ; el 7, nada
	ret z			;bf2d
	ld a,(hl)			;bf2e
	or a			;bf2f
	ret z			;bf30
	ld (hl),000h		;bf31
	jp 06b12h		;bf33   ; sonido_05: pide el sonido 0x05
cb72_a_1:
	ld a,(hl)			;bf36
	or a			;bf37
	ret nz			;bf38
	ld a,001h		;bf39
	ld (hl),a			;bf3b
	ld (0cb72h),a		;bf3c
	jp 06a9fh		;bf3f   ; sonido_29: pide el sonido 0x29
numero_7_o_66:		; p15:BDB8 (B); con el numero 7 sin nada de lo de abajo, 0xCABE = 1, una vez p09:BFB5, y 0xD79A segun 0xC58E (p09:BFA5); con el 0x66, nada; con B, 0xCA64, las salas especiales 0x2A o 2, 0xCB21 distinto de 1, alerta o 0xD8C0, 0xCABE a cero con el sonido 2 y la musica
	call 07b8dh		;bf42   ; a_p15_bdb8: p15:BDB8 con el banco 15 en 0xA000
	ld hl,0cabeh		;bf45   ; apunta a 1 con el numero 7 en su sitio (p09:BF42)
	ld a,b			;bf48
	or a			;bf49
	jr nz,cabe_a_cero		;bf4a   ; con B, no
	ld a,(0ca64h)		;bf4c
	or a			;bf4f
	jr nz,cabe_a_cero		;bf50   ; con 0xCA64, no
	ld a,(0ca76h)		;bf52   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 02ah		;bf55
	jr z,cabe_a_cero		;bf57   ; la especial 0x2A...
	cp 002h		;bf59
	jr z,cabe_a_cero		;bf5b   ; ...y la 2, no
	ld a,(0cb21h)		;bf5d   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	dec a			;bf60
	jr nz,cabe_a_cero		;bf61   ; sin 0xCB21 = 1, no
	ld a,(0ca5fh)		;bf63   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	or a			;bf66
	jr nz,cabe_a_cero		;bf67   ; con alerta, no
	ld a,(0d8c0h)		;bf69   ; lee 1 con Snake dentro de lo de 0xD8C2 (p07:A40D; 0 al salir, p07:A69A)
	or a			;bf6c
	jr nz,cabe_a_cero		;bf6d   ; con 0xD8C0, no
	ld a,(0d790h)		;bf6f   ; lee el numero de la pantalla de conversacion (BCD; sube y baja con derecha e izquierda, p09:BCF2; 0xD791-0xD792 las cifras altas)
	cp 007h		;bf72   ; el 7...
	jr z,numero_7		;bf74
	cp 066h		;bf76   ; ...el 0x66, nada
	jr nz,cabe_a_cero		;bf78
	ret			;bf7a
numero_7:
	ld a,(hl)			;bf7b
	or a			;bf7c
	jr nz,d79a_de_c58e		;bf7d   ; ya puesto
	ld (hl),001h		;bf7f   ; 0xCABE = 1
	call sonido_al_azar		;bf81   ; sonido_al_azar: el sonido 2 y otro segun el contador de cuadros (p09:BFC1)
	jr d79a_de_c58e		;bf84
cabe_a_cero:
	ld a,(hl)			;bf86
	or a			;bf87
	ret z			;bf88   ; ya a cero, nada
	ld (hl),000h		;bf89
sonido_2_y_musica:		; el sonido 2; con alerta p02:8C24, si no p02:8EB6
	call 06c0fh		;bf8b   ; sonido_02: pide el sonido 0x02
	ld a,(0ca5fh)		;bf8e   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	or a			;bf91
	jp nz,08c24h		;bf92   ; p02:8C24
	jp 08eb6h		;bf95   ; p02:8EB6
d79a_de_c58e:		; 0xD79A = el valor de p09:BFA5 por 0xC58E
	ld a,(0c58eh)		;bf98
	ld hl,0bfa5h		;bf9b
	call 04248h		;bf9e   ; byte_de_tabla: A = el byte A de la tabla de HL (y HL apunta a el)
	ld (0d79ah),a		;bfa1   ; guarda 0-9: sube mientras el numero esta en la lista con su bit (p09:BD14)
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


sonido_al_azar:		; el sonido 2 y otro segun el contador de cuadros (p09:BFC1)
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
