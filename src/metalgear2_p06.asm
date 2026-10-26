; ==========================================================================
; METAL GEAR 2 SOLID SNAKE - Konami (1990) - MSX2 - MegaROM RC-767 de 512 KB (Konami SCC) - banco 06 (se ejecuta en 0xa000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x0a000


; ======================================================================
; CODIGO 0xa000..0xa19c  (412 bytes)
; ======================================================================


golpe_a_d800:		; con la ficha 0xD800 de tipo 1 (filas 7-8 de la zona, paso 3 o mas, 0xD816) y lo lanzado por Snake de tipo 5 en el paso 3: si su casilla 0xCAEB cae en la sala de la ficha a menos de 0x40, lo quita, 0xCAEA = 1 y 8 menos a 0xD810 (a 0, el paso 0x20; si no, 0xD8B7 = 8 y el sonido 0x48)
	ld a,(0d800h)		;a000   ; lee 4 fichas de 0x20 bytes de 0xD800 (p04:89C3); sus tipos los lleva p10
	cp 001h		;a003   ; tipo 1...
	ret nz			;a005
	ld a,(0ca50h)		;a006   ; ...en las filas 7-8...
	sub 007h		;a009
	cp 002h		;a00b   ; fila 7 u 8
	ret nc			;a00d
	ld a,(0d801h)		;a00e   ; ...desde el paso 3...
	cp 003h		;a011   ; su paso
	ret c			;a013
	ld a,(0d816h)		;a014   ; ...y con 0xD816
	and a			;a017   ; 0xD816 a cero, nada
	ret z			;a018
	ld a,(0cb80h)		;a019   ; lo lanzado de tipo 5...
	cp 005h		;a01c   ; el tipo 5
	ret nz			;a01e
	ld a,(0cb81h)		;a01f   ; ...en el paso 3
	cp 003h		;a022   ; el paso 3
	ret nz			;a024
	ld hl,(0caebh)		;a025   ; L = la Y de 0xCAEB y B = la fila de mas o de menos
	ld a,l			;a028
	call fila_de_casilla		;a029   ; la fila en casillas...
	ld c,b			;a02c
	ld l,a			;a02d
	ld a,h			;a02e   ; H = la X y C = la columna de mas o de menos
	call columna_de_casilla		;a02f   ; ...y la columna
	ld h,a			;a032
	ld de,(0ca50h)		;a033   ; la sala de al lado que toque...
	ld a,d			;a037   ; la columna de la sala + C...
	add a,b			;a038
	ld d,a			;a039
	ld a,e			;a03a   ; ...y la fila + B
	add a,c			;a03b
	ld e,a			;a03c
	ld a,(0d80ah)		;a03d   ; ...es la de la ficha...
	cp e			;a040   ; la fila de la ficha
	ret nz			;a041
	ld a,(0d80bh)		;a042
	cp d			;a045   ; su columna
	ret nz			;a046
	ld a,(0d803h)		;a047   ; ...a menos de 0x40 en Y...
	sub l			;a04a   ; la Y de la ficha - L
	cp 040h		;a04b
	ret nc			;a04d
	ld a,(0d805h)		;a04e   ; ...y en X
	sub h			;a051   ; la X de la ficha - H
	cp 040h		;a052
	ret nc			;a054
	xor a			;a055   ; lo lanzado fuera
	ld (0cb80h),a		;a056   ; guarda las 6 fichas de 16 bytes de lo que lanza Snake ([tipo][..][Y 8.8][X 8.8][velocidades]...)
	ld (0cb52h),a		;a059   ; 0xCB52 = 0
	inc a			;a05c
	ld (0caeah),a		;a05d   ; 0xCAEA = 1
	ld hl,0dc18h		;a060   ; 0xDC18 = 0xE0
	ld (hl),0e0h		;a063
	ld hl,0d810h		;a065   ; 8 menos a 0xD810
	ld a,(hl)			;a068   ; la vida de la ficha...
	sub 008h		;a069   ; ...8 menos
	ld (hl),a			;a06b
	jr z,L_A070		;a06c   ; justo a cero o por debajo...
	jr nc,L_A076		;a06e   ; ...si queda, el golpe
L_A070:
	ld a,020h		;a070   ; a cero: el paso 0x20
	ld (0d801h),a		;a072   ; al paso 0x20
	ret			;a075
L_A076:
	ld a,008h		;a076   ; 0xD8B7 = 8 y el sonido 0x48
	ld (0d8b7h),a		;a078   ; 0xD8B7 = 8
	jp 06c17h		;a07b   ; sonido_48: pide el sonido 0x48
columna_de_casilla:		; A (0-15) en columnas de 5, 6 y 5: B = -1, 0 o +1 y A = la X (A * 32 - 16)
	ld b,0ffh		;a07e
	cp 005h		;a080   ; hasta 4, la primera columna (B = -1)
	jr c,primera_columna		;a082
	sub 005h		;a084   ; 5-10: B = 0
	inc b			;a086
	cp 006h		;a087
	jr c,por_32_menos_16		;a089   ; 11-15: B = +1
	sub 006h		;a08b
	inc b			;a08d
	jr por_32_menos_16		;a08e
primera_columna:
	inc a			;a090   ; uno mas (0-4 empiezan en 1)
	jr por_32_menos_16		;a091
fila_de_casilla:		; A (0-15) en filas de 5, 6 y 5: B = +1, 0 o -1 y A = la Y (A * 32 - 16)
	ld b,001h		;a093
	cp 005h		;a095   ; hasta 4: B = +1
	jr c,por_32_menos_16		;a097
	sub 005h		;a099   ; 5-10: B = 0
	dec b			;a09b
	cp 006h		;a09c
	jr c,por_32_menos_16		;a09e   ; 11-15: B = -1
	sub 006h		;a0a0
	dec b			;a0a2
por_32_menos_16:		; A = A * 32 - 16
	add a,a			;a0a3   ; A * 32...
	add a,a			;a0a4
	add a,a			;a0a5
	add a,a			;a0a6
	add a,a			;a0a7
	sub 010h		;a0a8   ; ...menos 16
	ret			;a0aa
snake_de_nuevo:		; 0xCB00-0xCB3F y 0xCB40-0xCB4F a cero; el primero de 0xD638 a 1, Snake en el estado 0x19 con el dibujo 0x0D, la direccion 3, en (0x6E, 0xA5), 0xCA97 = 1 y 0xCADF = 1
	ld hl,0cb00h		;a0ab   ; apunta a el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	ld bc,0003fh		;a0ae   ; 0x40 bytes
	call 04236h		;a0b1   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	ld hl,0cb40h		;a0b4   ; 0xCB40-0xCB4F
	ld bc,0000fh		;a0b7   ; 16 bytes
	call 04236h		;a0ba   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	xor a			;a0bd   ; 0xCA58 = 0
	ld (0ca58h),a		;a0be
	inc a			;a0c1
	ld hl,0d638h		;a0c2   ; 0xD638 y 0xD639 a 1
	ld (hl),a			;a0c5   ; 0xD638 = 1...
	inc hl			;a0c6
	ld (hl),a			;a0c7   ; ...y 0xD639 = 1
	ld hl,0cb00h		;a0c8   ; el estado 0x19...
	ld (hl),019h		;a0cb
	inc l			;a0cd   ; ...y el dibujo 0x0D
	ld (hl),00dh		;a0ce
	ld hl,00303h		;a0d0   ; la direccion 3 pedida y la de marcha
	ld (0cb0dh),hl		;a0d3   ; guarda la direccion pedida con el mando (1 arriba, 2 abajo, 3 izquierda, 4 derecha) y el byte siguiente (16 bits)
	ld a,010h		;a0d6   ; 0xCB49 = 0x10
	ld (0cb49h),a		;a0d8   ; 0xCB49 = 0x10
	ld a,020h		;a0db   ; 0xCB29 = 0x20
	ld (0cb29h),a		;a0dd   ; 0xCB29 = 0x20
	ld a,080h		;a0e0   ; 0xCB26 = 0x80
	ld (0cb26h),a		;a0e2   ; 0xCB26 = 0x80
	ld hl,0cb03h		;a0e5   ; Y = 0x6E...
	ld a,050h		;a0e8
	ld (hl),06eh		;a0ea   ; la Y = 0x6E
	inc l			;a0ec   ; a la X
	inc l			;a0ed
	ld (hl),0a5h		;a0ee   ; ...X = 0xA5
	ld a,001h		;a0f0   ; los mensajes de los bancos 50-51...
	ld (0ca97h),a		;a0f2   ; guarda 1 si los mensajes salen de los bancos 50-51 y no de 48-49
	ld (0cadfh),a		;a0f5   ; ...y 0xCADF = 1
	ret			;a0f8
mosaico_a_dd4d:		; el mosaico de 0xE2C0 (0x14 filas de 0x0E) a 0xDD4D en filas de 0x18; 0xDEF8-0xDF3F al 0x45 y dos 0x45 en 0xDEAB, 0xDEC3, 0xDEDB y 0xDEF3
	ld hl,0e2c0h		;a0f9
	ld de,0dd4dh		;a0fc   ; el destino: 0xDD4D, en el mapa de la sala
	ld bc,0140eh		;a0ff   ; 0x14 filas de 0x0E bytes
fila_a_dd4d:
	push bc			;a102
	ld b,c			;a103   ; B = 0x0E bytes de la fila
copia_fila:
	ld a,(hl)			;a104
	ld (de),a			;a105   ; al mapa
	inc hl			;a106
	inc de			;a107
	djnz copia_fila		;a108
	ld a,018h		;a10a   ; 0x18 - 0x0E...
	sub c			;a10c
	call 04243h		;a10d   ; ...para la fila siguiente del mapa
	pop bc			;a110
	djnz fila_a_dd4d		;a111   ; 0x14 filas
	ld hl,0def8h		;a113   ; 0xDEF8-0xDF3F al 0x45
	ld bc,00047h		;a116   ; 0x48 bytes
	ld a,045h		;a119   ; el caracter 0x45
	call 04237h		;a11b   ; llena_bloque: pone A en BC + 1 bytes desde HL
	ld hl,0deabh		;a11e   ; dos 0x45 en cada sitio
	call dos_45		;a121   ; dos_45: dos 0x45 en HL
	ld hl,0dec3h		;a124
	call dos_45		;a127   ; dos_45: dos 0x45 en HL
	ld hl,0dedbh		;a12a
	call dos_45		;a12d   ; dos_45: dos 0x45 en HL
	ld hl,0def3h		;a130
dos_45:		; dos 0x45 en HL
	ld a,045h		;a133
	ld (hl),a			;a135   ; en HL...
	inc hl			;a136
	ld (hl),a			;a137   ; ...y HL + 1
	ret			;a138
suelo_5_o_6:		; con 0xCA9B, 0xCB33 = 6; si no, con 0xCB37, 5; y el sonido del paso (p06:A16B)
	ld b,006h		;a139
	ld a,(0ca9bh)		;a13b   ; con 0xCA9B...
	or a			;a13e
	jr nz,pon_cb33		;a13f
	dec b			;a141   ; ...si no, 5 con 0xCB37
	ld a,(0cb37h)		;a142
	or a			;a145
	ret z			;a146   ; ninguno: nada
pon_cb33:
	ld a,b			;a147
	ld (0cb33h),a		;a148   ; 0xCB33 = B
	jr sonido_del_paso		;a14b
suelo_bajo_snake:		; el bit 2 de 0xD7E1 si Snake pisa un caracter de los de la zona (p06:A1AC; sin 0xD8C0 ni 0xCA65), con 0xCB33 = su numero; y el sonido del paso
	ld hl,0d7e1h		;a14d
	res 2,(hl)		;a150   ; el bit 2 de 0xD7E1 a cero
	ld a,(0d8c0h)		;a152   ; con 0xD8C0, nada
	or a			;a155
	ret nz			;a156
	ld a,(0ca65h)		;a157   ; lee el sitio de 0xCBE0 en el que esta Snake (0 = ninguno)
	or a			;a15a
	ret nz			;a15b
	call caracter_especial		;a15c   ; el caracter bajo Snake es de los de la zona...
	ret nc			;a15f
	push hl			;a160
	ld hl,0d7e1h		;a161
	set 2,(hl)		;a164   ; ...el bit 2 de 0xD7E1
	pop hl			;a166
	ld a,c			;a167
	ld (0cb33h),a		;a168   ; 0xCB33 = C
sonido_del_paso:		; sin choque ni el estado 2: en los dibujos 0 y 2 de andar, una vez (0xCB34), el sonido de 0xCB33 (p06:A19C) y, salvo con el 6, p03:AF05
	ld a,(0cb0fh)		;a16b   ; lee 1 si Snake ha chocado en este cuadro
	or a			;a16e   ; chocando, nada
	ret nz			;a16f
	ld a,(0cb31h)		;a170   ; lee 1 en el estado 2 de Snake
	or a			;a173
	ret nz			;a174   ; en el estado 2, nada
	ld hl,0cb34h		;a175   ; 0xCB34 = 1 tras sonar
	ld a,(0cb14h)		;a178   ; lee el dibujo del paso de andar (0, 1, 2, 1: p02:9888)
	or a			;a17b
	jr z,L_A185		;a17c   ; dibujo 0...
	cp 002h		;a17e
	jr z,L_A185		;a180   ; ...o 2
	ld (hl),000h		;a182   ; en los dibujos 1, a cero
	ret			;a184   ; dibujo 1: a cero hasta el siguiente
L_A185:
	ld a,(hl)			;a185
	or a			;a186
	ret nz			;a187   ; ya sono en este dibujo
	ld (hl),001h		;a188   ; 0xCB34 = 1...
	call sonido_de_cb33		;a18a   ; ...y el sonido
	ld a,(0cb33h)		;a18d
	cp 006h		;a190   ; con el 6...
	ret z			;a192   ; ...nada mas
	jp 08eeah		;a193   ; salvo el 6, p03:AF05 (0xD446 = 4)
sonido_de_cb33:		; el sonido de 0xCB33 en p06:A19C: 0x0C, 0x3C, 0x3D, 0x3E, 0x20, 0x1F, 0x1E o 0x63
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


caracter_especial:		; B = el caracter bajo Snake; acarreo si en esta zona y sala es de los de C (con D <= B < E, o fijo)
	ld a,(0cb03h)		;a1ac   ; lee la Y de Snake
	ld l,a			;a1af   ; L = la Y
	ld a,(0cb05h)		;a1b0   ; lee la X de Snake
	ld h,a			;a1b3   ; H = la X
	call 07f69h		;a1b4   ; caracter_en: A = el caracter del mapa en (H = X, L = Y)
	ld b,a			;a1b7   ; B = el caracter
	ld a,(0ca76h)		;a1b8   ; en salas especiales, nada
	or a			;a1bb
	jr nz,no_especial		;a1bc
	ld a,(0ca4ah)		;a1be   ; segun la zona
	dec a			;a1c1
	jr z,zona_1		;a1c2   ; zona 1
	dec a			;a1c4
	jp z,zona_2		;a1c5   ; zona 2
	cp 002h		;a1c8
	jr z,zona_3		;a1ca   ; zona 3
	cp 005h		;a1cc
	jr z,zona_6		;a1ce   ; zona 6
	cp 008h		;a1d0
	jr z,zona_9		;a1d2   ; zona 9
	cp 009h		;a1d4
	jr z,rango_89_81		;a1d6   ; zona 0x0A
	cp 00ah		;a1d8
	jr z,zona_0b		;a1da   ; zona 0x0B
	cp 00bh		;a1dc
	jp z,zona_0c		;a1de   ; zona 0x0C
	cp 00ch		;a1e1
	jp z,zona_0d		;a1e3   ; zona 0x0D
	cp 00dh		;a1e6
	jp z,zona_0e		;a1e8   ; zona 0x0E
	cp 00eh		;a1eb
	jp z,c_0_si		;a1ed   ; zona 0x0F
	cp 010h		;a1f0
	jr z,zona_11		;a1f2   ; zona 0x11
	cp 011h		;a1f4
	jr z,zona_12		;a1f6   ; zona 0x12
no_especial:
	and a			;a1f8   ; no: sin acarreo
	ret			;a1f9
zona_1:		; zona 1: C = 0, los caracteres 0x89-0x80 (0x0D-0x01 en la sala 0x0B)
	ld c,000h		;a1fa   ; C = 0...
	ld de,08189h		;a1fc   ; ...con los caracteres 0x81-0x88
	ld a,(0ca4bh)		;a1ff   ; lee la sala de la zona
	cp 00bh		;a202
	jr nz,rango_89_81		;a204   ; fuera de la sala 0x0B, esos
	ld de,0010dh		;a206   ; en la 0x0B, los 0x01-0x0C
	jr entre_d_y_e		;a209
zona_3:		; zona 3: C = 1, en la sala 0x17 los 0x10-0x07; en las 0x0D y 0x12, todos
	ld c,001h		;a20b   ; C = 1
	ld de,00810h		;a20d   ; los caracteres 0x08-0x0F
	ld a,(0ca4bh)		;a210   ; lee la sala de la zona
	cp 017h		;a213
	jr z,entre_d_y_e		;a215   ; en la sala 0x17
	cp 00dh		;a217
	jp z,todos		;a219   ; en la 0x0D, todos
	cp 012h		;a21c
	jp z,todos		;a21e   ; en la 0x12, todos
	and a			;a221   ; en las demas, ninguno
	ret			;a222
zona_6:		; zona 6: C = 4 en las salas 0x0E y 0x0F
	ld c,004h		;a223   ; C = 4
	ld a,(0ca4bh)		;a225   ; lee la sala de la zona
	cp 00eh		;a228   ; acarreo con la sala 0x0E o 0x0F...
	ccf			;a22a   ; ...(ccf: no por debajo de 0x0E)
	ret nc			;a22b
	cp 010h		;a22c   ; ...y por debajo de 0x10
	ret			;a22e
rango_89_81:		; C = 0 con los caracteres 0x81-0x88
	ld c,000h		;a22f
	ld de,08189h		;a231   ; los caracteres 0x81-0x88
entre_d_y_e:		; acarreo con D <= B < E
	ld a,b			;a234
	cp d			;a235   ; por debajo de D...
	jr c,no_especial		;a236   ; ...no
	cp e			;a238   ; acarreo por debajo de E
	ret			;a239
zona_0b:		; zona 0x0B: en las salas 0-3, C = 0 (con el acarreo de la comparacion)
	ld a,(0ca4bh)		;a23a   ; lee la sala de la zona
	cp 004h		;a23d   ; en las salas 0-3...
	ret nc			;a23f
	ld c,000h		;a240   ; ...C = 0, con acarreo
	ret			;a242
zona_9:		; zona 9: en las filas 4 o mas y columnas 8 o mas, C = 4 con los caracteres 0x19-0x10 o 0x03-0x00
	ld a,(0ca50h)		;a243   ; lee la fila de la sala en la zona (uno mas al salir por arriba)
	cp 004h		;a246   ; desde la fila 4...
	ccf			;a248   ; ...(si no, sin acarreo)
	ret nc			;a249
	ld a,(0ca51h)		;a24a   ; lee la columna de la sala en la zona (uno mas al salir por la derecha)
	cp 008h		;a24d   ; ...y desde la columna 8
	ccf			;a24f
	ret nc			;a250
	ld c,004h		;a251   ; C = 4 con los caracteres 0x11-0x18...
	ld de,01119h		;a253
	call entre_d_y_e		;a256   ; entre_d_y_e: acarreo con D <= B < E
	ret c			;a259   ; ...o
	ld c,004h		;a25a
	ld de,00103h		;a25c   ; ...con los 0x01-0x02
	jr entre_d_y_e		;a25f
zona_2:		; zona 2: C = 0 con los caracteres 0x50-0x00
	ld c,000h		;a261
	ld de,00150h		;a263   ; los caracteres 0x01-0x4F
	jr entre_d_y_e		;a266
zona_11:		; zona 0x11: C = 0 con los caracteres 0x8D-0x80
	ld c,000h		;a268
	ld de,0818dh		;a26a   ; los caracteres 0x81-0x8C
	jr entre_d_y_e		;a26d
zona_12:		; zona 0x12: en las salas 0-3, C = 1, 3, 7 o 2 segun la sala
	ld a,(0ca4bh)		;a26f   ; lee la sala de la zona
	cp 004h		;a272   ; desde la sala 4, no
	ret nc			;a274
	ld c,001h		;a275   ; la sala 0: C = 1
	or a			;a277
	jr z,si_especial		;a278
	ld c,003h		;a27a   ; la 1: C = 3
	dec a			;a27c
	jr z,si_especial		;a27d
	ld c,007h		;a27f   ; la 2: C = 7
	dec a			;a281
	jr z,si_especial		;a282
	ld c,002h		;a284   ; la 3: C = 2
si_especial:
	scf			;a286   ; si
	ret			;a287
zona_0c:		; zona 0x0C: en las salas 0 y 5 o mas, C = 0
	ld a,(0ca4bh)		;a288   ; lee la sala de la zona
	or a			;a28b
	jr z,c_0_si		;a28c   ; la sala 0, si
	cp 005h		;a28e   ; desde la 5, si; 1-4 no
	ccf			;a290
	ret nc			;a291
c_0_si:
	ld c,000h		;a292   ; C = 0 y si
	scf			;a294
	ret			;a295
zona_0d:		; zona 0x0D: en las salas 0-3, C = 0
	ld a,(0ca4bh)		;a296   ; lee la sala de la zona
	cp 004h		;a299   ; en las salas 0-3...
	ret nc			;a29b
	ld c,000h		;a29c   ; ...C = 0, con acarreo
	ret			;a29e
zona_0e:		; zona 0x0E: en la sala 0, C = 0
	ld a,(0ca4bh)		;a29f   ; lee la sala de la zona
	or a			;a2a2
	ret nz			;a2a3   ; solo en la sala 0
	scf			;a2a4
	ld c,000h		;a2a5
	ret			;a2a7
todos:
	scf			;a2a8   ; si (todos los caracteres)
	ret			;a2a9
tope_dfea:		; con 0xDFE8 (zona 6 sala 0x10, p11:A389) y Snake fuera del estado 0x10: no pasa de la X de 0xDFEA; con la X en 0x20-0x3F, el estado 0x10
	ld a,(0cb00h)		;a2aa   ; lee el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	cp 010h		;a2ad   ; ya en el estado 0x10, nada
	ret z			;a2af
	ld a,(0dfe8h)		;a2b0   ; lee 1 con lo de la zona 6 sala 0x10 (p11:A389; 0xDFE9 paso, 0xDFEA X)
	or a			;a2b3
	ret z			;a2b4   ; sin 0xDFE8, nada
	call no_cruza_dfea		;a2b5   ; no pasa de 0xDFEA
	ld a,(0cb05h)		;a2b8   ; lee la X de Snake
	cp 040h		;a2bb   ; desde X = 0x40, nada
	ret nc			;a2bd
	cp 020h		;a2be
	ret c			;a2c0   ; por debajo de 0x20, nada
	cp 040h		;a2c1
	ld (0cb05h),a		;a2c3   ; guarda la X de Snake
	ld a,010h		;a2c6   ; al estado 0x10
	ld (0cb00h),a		;a2c8   ; guarda el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	ret			;a2cb
no_cruza_dfea:		; Snake no se acerca a la X de 0xDFEA: por la izquierda (salvo 0xDFE9 = 1) a 0x18 (0x20 parado de lado) y por la derecha (salvo 0xDFE9 = 2) a 6 (0x0E)
	ld a,(0dfeah)		;a2cc   ; la X de 0xDFEA + 8...
	add a,008h		;a2cf
	ld hl,0cb05h		;a2d1   ; apunta a la X de Snake
	cp (hl)			;a2d4   ; ...a la derecha de Snake: por la izquierda
	jr nc,por_la_derecha		;a2d5
	ld a,(0dfe9h)		;a2d7   ; con 0xDFE9 = 1, nada
	dec a			;a2da
	ret z			;a2db
	ld b,018h		;a2dc   ; el margen: 0x18
	ld a,(0cb01h)		;a2de   ; lee el dibujo de Snake (al darse la vuelta se le suma 1, 3 o 5 segun 0xCB00)
	cp 002h		;a2e1
	jr nz,aparta_a_la_izquierda		;a2e3   ; con el dibujo 2...
	ld a,(0cb16h)		;a2e5   ; lee 1 mientras Snake se da la vuelta
	or a			;a2e8
	jr nz,aparta_a_la_izquierda		;a2e9   ; ...sin darse la vuelta...
	ld a,(0cb0eh)		;a2eb   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	cp 003h		;a2ee   ; ...y andando a los lados...
	jr c,aparta_a_la_izquierda		;a2f0
	ld b,020h		;a2f2   ; ...0x20
aparta_a_la_izquierda:
	ld a,(0dfeah)		;a2f4   ; lo que hay de Snake a 0xDFEA
	sub (hl)			;a2f7
	neg		;a2f8
	cp b			;a2fa
	ret nc			;a2fb   ; lejos: nada
	ld a,(0dfeah)		;a2fc   ; Snake a 0xDFEA + el margen
	add a,b			;a2ff
	ld (0cb05h),a		;a300   ; guarda la X de Snake
	ret			;a303
por_la_derecha:
	ld a,(0dfe9h)		;a304   ; con 0xDFE9 = 2, nada
	cp 002h		;a307
	ret z			;a309
	ld b,006h		;a30a   ; el margen: 6
	ld a,(0cb01h)		;a30c   ; lee el dibujo de Snake (al darse la vuelta se le suma 1, 3 o 5 segun 0xCB00)
	cp 002h		;a30f
	jr nz,aparta_a_la_derecha		;a311   ; con el dibujo 2...
	ld a,(0cb16h)		;a313   ; lee 1 mientras Snake se da la vuelta
	or a			;a316
	jr nz,aparta_a_la_derecha		;a317   ; ...sin darse la vuelta...
	ld a,(0cb0eh)		;a319   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	cp 003h		;a31c   ; ...y a los lados...
	jr c,aparta_a_la_derecha		;a31e
	ld b,00eh		;a320   ; ...0x0E
aparta_a_la_derecha:
	ld a,(0dfeah)		;a322   ; lo que hay de 0xDFEA a Snake
	sub (hl)			;a325
	cp b			;a326
	ret nc			;a327   ; lejos: nada
	ld a,(0dfeah)		;a328   ; Snake a 0xDFEA - el margen
	sub b			;a32b
	ld (0cb05h),a		;a32c   ; guarda la X de Snake
	ret			;a32f
caja_de_bda4:		; busca en p06:BDA4 (fichas de 9 bytes: zona, sala, Y de-hasta, X de-hasta y 3 bytes; zona 0x32 = la sala especial 0x32) la caja en la que esta Snake: copia sus 3 bytes a 0xCAA5, A = la X final - 0x10 (en multiplos de 8) y acarreo
	ld hl,0bda4h		;a330
caja_siguiente_bda4:
	ld a,(hl)			;a333
	cp 0ffh		;a334   ; 0xFF: se acaba
	jr z,en_ninguna		;a336
	push hl			;a338
	cp 032h		;a339   ; la zona 0x32...
	jr nz,caja_de_la_zona		;a33b
	ld a,(0ca76h)		;a33d   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 032h		;a340   ; ...vale en la sala especial 0x32
	jr nz,otra_caja		;a342
	inc hl			;a344
	jr snake_en_la_caja		;a345
caja_de_la_zona:
	ld a,(0ca4ah)		;a347   ; lee la zona
	cp (hl)			;a34a   ; su zona...
	jr nz,otra_caja		;a34b
	inc hl			;a34d
	ld a,(0ca4bh)		;a34e   ; lee la sala de la zona
	cp (hl)			;a351   ; ...y su sala
	jr nz,otra_caja		;a352
snake_en_la_caja:
	inc hl			;a354
	ld a,(0cb03h)		;a355   ; lee la Y de Snake
	cp (hl)			;a358   ; la Y desde...
	jr c,otra_caja		;a359
	inc hl			;a35b
	cp (hl)			;a35c   ; ...y hasta
	jr nc,otra_caja		;a35d
	inc hl			;a35f
	ld a,(0cb05h)		;a360   ; lee la X de Snake
	cp (hl)			;a363   ; la X desde...
	jr c,otra_caja		;a364
	inc hl			;a366
	cp (hl)			;a367   ; ...y hasta
	jr nc,otra_caja		;a368
	ld a,(hl)			;a36a   ; A = la X final - 0x10
	sub 010h		;a36b
	and 0f8h		;a36d
	push af			;a36f
	inc hl			;a370
	ld de,0caa5h		;a371   ; los tres bytes a 0xCAA5
	ldi		;a374
	ldi		;a376
	ldi		;a378
	pop af			;a37a
	pop hl			;a37b
	scf			;a37c
	ret			;a37d
otra_caja:
	pop hl			;a37e
	ld de,00009h		;a37f   ; la ficha siguiente (9 bytes)
	add hl,de			;a382
	jr caja_siguiente_bda4		;a383
en_ninguna:
	and a			;a385   ; en ninguna
	ret			;a386
empuje_de_la_sala:		; con Snake dentro (Y y X por debajo de 0xC0): 0xCA8F = 0 y, en p06:BB76 (fichas de 6 bytes ordenadas por sala), las de esta sala (p06:A3B2) hasta que una empuja
	ld a,(0cb03h)		;a387   ; lee la Y de Snake
	cp 0c0h		;a38a   ; Y desde 0xC0, nada
	ret nc			;a38c
	ld a,(0cb05h)		;a38d   ; lee la X de Snake
	cp 0c0h		;a390
	ret nc			;a392   ; X desde 0xC0, nada
	xor a			;a393
	ld de,0ca8fh		;a394   ; apunta a hacia donde empuja la zona (1 arriba, 2 abajo, 3 izquierda, 4 derecha; 0 nada)
	ld (de),a			;a397   ; sin empuje
	ld hl,0bb76h		;a398
ficha_bb76:
	ld a,(hl)			;a39b
	cp 0ffh		;a39c
	ret z			;a39e   ; 0xFF: se acaba
	ld a,(0ca4bh)		;a39f   ; lee la sala de la zona
	cp (hl)			;a3a2
	ret c			;a3a3   ; de una sala mayor: se acaba (van ordenadas)
	push hl			;a3a4
	call z,empuje_si_dentro		;a3a5   ; la de esta sala (p06:A3B2)
	pop hl			;a3a8
	ld a,(de)			;a3a9   ; hasta que una empuja
	or a			;a3aa
	ret nz			;a3ab
	ld bc,00006h		;a3ac   ; la ficha siguiente (6 bytes)
	add hl,bc			;a3af
	jr ficha_bb76		;a3b0   ; la siguiente
empuje_si_dentro:		; con Snake entre la Y de-hasta y la X de-hasta de la ficha de HL, su sexto byte a (DE)
	inc hl			;a3b2
	ld a,(0cb03h)		;a3b3   ; lee la Y de Snake
	cp (hl)			;a3b6   ; por encima: nada
	ret c			;a3b7
	inc hl			;a3b8
	cp (hl)			;a3b9
	ret nc			;a3ba   ; por debajo: nada
	inc hl			;a3bb
	ld a,(0cb05h)		;a3bc   ; lee la X de Snake
	cp (hl)			;a3bf
	ret c			;a3c0   ; a la izquierda: nada
	inc hl			;a3c1
	cp (hl)			;a3c2
	ret nc			;a3c3   ; a la derecha: nada
	inc hl			;a3c4
	ld a,(hl)			;a3c5   ; el empuje...
	ld (de),a			;a3c6   ; ...a 0xCA8F
	ret			;a3c7
sin_equipo:		; 0xCB4B-0xCB4E = 1, 4, 0, 0x10; 0xCAB6 = 0, 0xCB3C = 1, el bit 7 de 0xD8D9 y los bits 2-7 de 0xD8D8; a cero partes de lo que lleva (0xD600-0xD61F, 0xD624-0xD627, 0xD62C-0xD637, 0xD650-0xD653, 0xD66C-0xD673, 0xD6A8-0xD6AF y 0xD6C0-0xD6C3)
	xor a			;a3c8
	ld hl,0cb4bh		;a3c9   ; apunta a con el puesto, la vida baja un punto cada 16 cuadros
	ld (hl),001h		;a3cc   ; 0xCB4B = 1
	inc l			;a3ce
	ld (hl),004h		;a3cf   ; 0xCB4C = 4
	inc l			;a3d1
	ld (hl),a			;a3d2   ; 0xCB4D = 0
	inc l			;a3d3
	ld (hl),010h		;a3d4   ; 0xCB4E = 0x10
	ld (0cab6h),a		;a3d6   ; 0xCAB6 = 0
	inc a			;a3d9   ; 0xCB3C = 1
	ld (0cb3ch),a		;a3da
	ld hl,0d8d9h		;a3dd   ; el bit 7 de 0xD8D9
	set 7,(hl)		;a3e0
	ld hl,0d8d8h		;a3e2   ; los bits 2-7 de 0xD8D8
	ld a,(hl)			;a3e5
	or 0fch		;a3e6
	ld (hl),a			;a3e8   ; los bits 2-7
	ld hl,0d600h		;a3e9   ; 0xD600-0xD61F a cero
	ld bc,0001fh		;a3ec   ; 0x20 bytes
	call 04236h		;a3ef   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	ld hl,0d624h		;a3f2   ; 0xD624-0xD627
	ld bc,00003h		;a3f5
	call 04236h		;a3f8   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	ld hl,0d62ch		;a3fb   ; 0xD62C-0xD637
	ld bc,0000bh		;a3fe
	call 04236h		;a401   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	ld hl,0d650h		;a404   ; 0xD650-0xD653
	ld bc,00003h		;a407
	call 04236h		;a40a   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	ld hl,0d66ch		;a40d   ; 0xD66C-0xD673
	ld bc,00007h		;a410
	call 04236h		;a413   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	ld hl,0d6a8h		;a416   ; 0xD6A8-0xD6AF
	ld bc,00007h		;a419
	call 04236h		;a41c   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	ld hl,0d6c0h		;a41f   ; 0xD6C0-0xD6C3
	ld bc,00003h		;a422
	jp 04236h		;a425   ; borra_bloque: pone a cero BC + 1 bytes desde HL
mosaicos_que_cambian:		; sin 0xCA65 ni alerta (en la zona 9 sin el bit 1 de 0xD7DC; en la 0x0B con el bit 2 de 0xD7D6): las fichas de p06:A4BA de esta sala (9 bytes: zona, sala, D, E, B y C en nibbles, dos mosaicos) con el sonido 0x27; cada 8 cuadros, uno u otro mosaico
	ld a,(0ca65h)		;a428   ; lee el sitio de 0xCBE0 en el que esta Snake (0 = ninguno)
	or a			;a42b
	ret nz			;a42c   ; dentro de un sitio, nada
	ld a,(0ca5fh)		;a42d   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	or a			;a430
	ret nz			;a431   ; con alerta, nada
	ld a,(0ca4ah)		;a432   ; lee la zona
	cp 009h		;a435
	jr z,zona_9_d7dc		;a437   ; zona 9
	cp 00bh		;a439
	jr nz,fichas_a4ba		;a43b   ; zona 0x0B...
	ld a,(0d7d6h)		;a43d
	bit 2,a		;a440
	ret z			;a442   ; ...sin el bit 2 de 0xD7D6, nada
	jr fichas_a4ba		;a443
zona_9_d7dc:
	ld a,(0d7dch)		;a445
	bit 1,a		;a448
	ret nz			;a44a   ; en la 9, con el bit 1 de 0xD7DC, nada
fichas_a4ba:
	ld hl,0a4bah		;a44b   ; la lista de p06:A4BA
ficha_a4ba:
	ld a,(hl)			;a44e
	cp 0ffh		;a44f
	ret z			;a451   ; 0xFF: se acaba
	push hl			;a452
	cp 032h		;a453   ; la zona 0x32...
	jr nz,ficha_de_la_zona		;a455
	ld a,(0ca76h)		;a457   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 032h		;a45a
	jr nz,ficha_siguiente_a4ba		;a45c   ; ...vale en la sala especial 0x32
	inc hl			;a45e
	jr pinta_la_ficha		;a45f
ficha_de_la_zona:
	ld a,(0ca4ah)		;a461   ; lee la zona
	cp (hl)			;a464
	jr nz,ficha_siguiente_a4ba		;a465   ; su zona...
	inc hl			;a467
	ld a,(0ca4bh)		;a468   ; lee la sala de la zona
	cp (hl)			;a46b
	jr nz,ficha_siguiente_a4ba		;a46c   ; ...y su sala
pinta_la_ficha:
	push hl			;a46e
	call 06a97h		;a46f   ; el sonido 0x27
	pop hl			;a472
	inc hl			;a473
	ld e,(hl)			;a474   ; DE = el sitio
	inc hl			;a475
	ld d,(hl)			;a476
	inc hl			;a477
	ld a,(hl)			;a478   ; B = las veces (nibble bajo)...
	and 00fh		;a479
	ld b,a			;a47b
	ld a,(hl)			;a47c   ; ...C = la forma (nibble alto)
	rra			;a47d
	rra			;a47e
	rra			;a47f
	rra			;a480
	and 00fh		;a481
	ld c,a			;a483
	inc hl			;a484
	ld a,(0ca03h)		;a485   ; solo cada 8 cuadros...
	and 007h		;a488   ; cada 8 cuadros
	jr nz,fin_de_ficha		;a48a
	ld a,(0ca03h)		;a48c   ; ...con el bit 3, el segundo mosaico
	bit 3,a		;a48f
	jr z,pinta_b_veces		;a491   ; el bit 3 a cero: el primer mosaico
	inc hl			;a493   ; a uno: el segundo
	inc hl			;a494
	jr pinta_b_veces		;a495
ficha_siguiente_a4ba:
	pop hl			;a497
	ld de,00009h		;a498   ; la ficha siguiente (9 bytes)
	add hl,de			;a49b
	jr ficha_a4ba		;a49c
pinta_b_veces:
	push bc			;a49e
	push hl			;a49f
	ld a,c			;a4a0   ; la forma
	ld bc,00102h		;a4a1   ; 1 x 2 caracteres
	call mosaico_forma_a		;a4a4   ; mosaico_forma_a: el mosaico de HL en (D, E) con la forma A (0, 1 o 2) de la franja 2
	pop hl			;a4a7
	pop bc			;a4a8
	djnz pinta_b_veces		;a4a9   ; B veces
fin_de_ficha:
	pop hl			;a4ab
	ret			;a4ac
mosaico_forma_a:		; el mosaico de HL en (D, E) con la forma A (0, 1 o 2) de la franja 2
	or a			;a4ad
	jp z,05088h		;a4ae   ; la forma 0
	dec a			;a4b1
	jp z,050a0h		;a4b2   ; la 1
	dec a			;a4b5
	jp z,050d6h		;a4b6   ; la 2
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


sonido_5e_de_fondo:		; sin 0xD8C0 ni sala especial, en la zona 6 (salvo las salas 7 y 0x10) y en la 8 (salas 0x0A-0x0F): cada 16 cuadros, en los tiempos 0, 1, 4, 9, 0x0A y 0x0B de 16, el sonido 0x5E
	ld a,(0d8c0h)		;a4e8   ; lee 1 con Snake dentro de lo de 0xD8C2 (p07:A40D; 0 al salir, p07:A69A)
	or a			;a4eb
	ret nz			;a4ec   ; con 0xD8C0, nada
	ld a,(0ca76h)		;a4ed   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	or a			;a4f0
	ret nz			;a4f1   ; en una sala especial, nada
	call sin_sonido_5e		;a4f2   ; sin_sonido_5e: acarreo (sin el sonido) salvo en la zona 6 (no en las salas 7 y 0x10) y en la 8 salas 0x0A-0x0F
	ret c			;a4f5   ; fuera de esas salas, nada
	ld a,(0ca03h)		;a4f6   ; cada 16 cuadros...
	and 00fh		;a4f9
	or a			;a4fb
	ret nz			;a4fc   ; solo cada 16 cuadros
	ld a,(0ca03h)		;a4fd   ; ...el tiempo (de 16)
	rra			;a500
	rra			;a501
	rra			;a502
	rra			;a503
	and 00fh		;a504   ; el tiempo (cuadros / 16, de 0 a 15)
	or a			;a506
	jr z,suena_5e		;a507   ; el 0...
	cp 001h		;a509
	jr z,suena_5e		;a50b   ; ...el 1...
	cp 004h		;a50d
	jr z,suena_5e		;a50f   ; ...el 4...
	cp 009h		;a511
	jr z,suena_5e		;a513   ; ...el 9...
	cp 00ah		;a515
	jr z,suena_5e		;a517   ; ...el 0x0A...
	cp 00bh		;a519
	ret nz			;a51b   ; ...y el 0x0B
suena_5e:
	jp 06c7fh		;a51c   ; sonido_5e: pide el sonido 0x5E
sin_sonido_5e:		; acarreo (sin el sonido) salvo en la zona 6 (no en las salas 7 y 0x10) y en la 8 salas 0x0A-0x0F
	ld a,(0ca4ah)		;a51f   ; lee la zona
	cp 006h		;a522
	jr z,zona_6_a51f		;a524   ; zona 6
	cp 008h		;a526
	jr z,zona_8_a51f		;a528   ; zona 8
acarreo_a51f:
	scf			;a52a   ; las demas: acarreo
	ret			;a52b
zona_8_a51f:
	ld a,(0ca4bh)		;a52c   ; lee la sala de la zona
	cp 00ah		;a52f
	ret c			;a531   ; por debajo de la sala 0x0A: acarreo
	cp 010h		;a532
	ccf			;a534   ; 0x0A-0x0F: sin acarreo
	ret			;a535
zona_6_a51f:
	ld a,(0ca4bh)		;a536   ; lee la sala de la zona
	cp 007h		;a539
	jr z,acarreo_a51f		;a53b   ; la sala 7: acarreo
	cp 010h		;a53d
	jr z,acarreo_a51f		;a53f   ; la 0x10: acarreo
	and a			;a541   ; las demas: sin acarreo
	ret			;a542
dos_bits_de_beec:		; A = el valor de 2 bits del elemento 0xCAB9 de la fila A de p06:BEEC (fila 0 en 0, fila A en (A + 2) * 16); para el 9 con 0xE040 = 5, el elemento 0xCB5B de p06:BF30, y con 0xD4EC, 0xD4EC - 1
	ld c,a			;a543
	ld b,000h		;a544   ; la fila 0...
	or a			;a546
	jr z,fila_de_beec		;a547   ; ...empieza en 0
	ld b,020h		;a549   ; B = A * 16 + 0x20
	rlca			;a54b   ; A * 16...
	rlca			;a54c
	rlca			;a54d
	rlca			;a54e
	add a,b			;a54f   ; ...+ 0x20
	ld b,a			;a550
	ld a,c			;a551
	cp 009h		;a552
	jr nz,fila_de_beec		;a554   ; la fila 9...
	ld a,(0e040h)		;a556   ; lee la escena en curso (1-9, 0 = ninguna; p09:A4A6, guiones en p09:A5D4)
	cp 005h		;a559
	jr nz,fila_de_beec		;a55b   ; ...con 0xE040 = 5...
	ld a,(0cb5bh)		;a55d   ; ...el elemento 0xCB5B de p06:BF30
	ld hl,0bf30h		;a560
	jr elemento_2_bits		;a563
fila_de_beec:
	ld a,(0cab9h)		;a565   ; el elemento 0xCAB9...
	ld hl,0beech		;a568   ; ...de p06:BEEC
elemento_2_bits:
	add a,b			;a56b
	ld b,a			;a56c   ; B = el numero del elemento
	rra			;a56d   ; el byte (elemento / 4)...
	rra			;a56e
	and 03fh		;a56f
	call 0423eh		;a571   ; su byte
	ld a,b			;a574   ; ...y la pareja de bits (elemento & 3, desde arriba)
	and 003h		;a575
	inc a			;a577   ; los giros: 1-4 veces 2 bits
	ld b,a			;a578
	ld a,(hl)			;a579
gira_2_bits:
	rlca			;a57a   ; dos bits a la izquierda
	rlca			;a57b
	djnz gira_2_bits		;a57c
	and 003h		;a57e   ; A = esos 2 bits
	ld b,a			;a580
	ld a,c			;a581
	cp 009h		;a582   ; fuera de la fila 9...
	ld a,b			;a584
	ret nz			;a585   ; ...ese valor
	ld a,(0e040h)		;a586   ; lee la escena en curso (1-9, 0 = ninguna; p09:A4A6, guiones en p09:A5D4)
	cp 005h		;a589   ; sin 0xE040 = 5, ese
	ld a,b			;a58b
	ret nz			;a58c
	ld a,(0d4ech)		;a58d
	or a			;a590   ; con 0xD4EC a cero, ese
	ld a,b			;a591
	ret z			;a592
	ld a,(0d4ech)		;a593
	dec a			;a596   ; si no, 0xD4EC - 1
	ret			;a597
siguen_a_snake_aqui:		; los 1-4 que siguen a Snake (0xCAA0) puestos donde esta Snake (p06:A5A1)
	ld a,(0caa0h)		;a598   ; lee cuantos siguen a Snake por su rastro (1-4)
	or a			;a59b
	ret z			;a59c   ; sin ninguno, nada
	dec a			;a59d   ; segun cuantos (p06:A5A1)
	call 0424dh		;a59e   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_A5A1: 4 destinos del despachador p00:424D (call en p06:A59E, el
;   indice en A): A5A9, A5AE, A5AE, A5B6; lo leen p06:A59E (8 bytes)
;   0xa5a1..0xa5a9  (8 bytes)
DATA_tabla_A5A1:
	defw 0a5a9h,0a5aeh,0a5aeh,0a5b6h	; a5a1  -> sigue_e240 sigue_e240_e248 sigue_e240_e248 sigue_dfd8

; ======================================================================
; CODIGO 0xa5a9..0xa61c  (115 bytes)
; ======================================================================


sigue_e240:		; la ficha 0xE240 donde Snake
	ld hl,0e240h		;a5a9   ; apunta a la ficha del que sigue a Snake 4 posiciones por detras (del rastro de 0xE08C)
	jr ficha_donde_snake		;a5ac
sigue_e240_e248:		; las fichas 0xE240 y 0xE248 donde Snake
	call sigue_e240		;a5ae   ; sigue_e240: la ficha 0xE240 donde Snake
	ld hl,0e248h		;a5b1   ; apunta a la ficha del que sigue a Snake 12 posiciones por detras (0xE0A4)
	jr ficha_donde_snake		;a5b4   ; y la ficha
sigue_dfd8:		; la ficha 0xDFD8 donde Snake
	ld hl,0dfd8h		;a5b6
ficha_donde_snake:		; la ficha de HL: 3, 1, la Y y la X de Snake (8.8) y su direccion
	ld b,000h		;a5b9
	ld (hl),003h		;a5bb   ; tipo 3
	inc l			;a5bd
	ld (hl),001h		;a5be   ; paso 1
	inc l			;a5c0
	ld (hl),b			;a5c1   ; Y baja = 0
	inc l			;a5c2
	ld a,(0cb03h)		;a5c3   ; lee la Y de Snake
	ld (hl),a			;a5c6   ; la Y
	inc l			;a5c7
	ld (hl),b			;a5c8   ; X baja = 0
	inc l			;a5c9
	ld a,(0cb05h)		;a5ca   ; lee la X de Snake
	ld (hl),a			;a5cd   ; la X
	inc l			;a5ce
	ld a,(0cb0eh)		;a5cf   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ld (hl),a			;a5d2   ; la direccion
	inc hl			;a5d3
	ld (hl),b			;a5d4   ; el byte 7 = 0
	ret			;a5d5
letras_de_a61c:		; los caracteres de p06:A61C: tras cada sitio (D, E), los numeros de caracter (0xFE otro sitio, 0xFF acaba), cada uno de 8 x 8 copiado dos veces (A = 0xC0 y 0xD0) desde (X = (n & 0x1F) * 8, Y = 0x40 + (n & 0xE0) / 4), 9 a la derecha cada vez
	ld hl,0a61ch		;a5d6
sitio_a61c:
	ld d,(hl)			;a5d9   ; D y E: el sitio
	inc hl			;a5da
	ld e,(hl)			;a5db
	inc hl			;a5dc
caracter_a61c:
	ld a,(hl)			;a5dd
	ld c,a			;a5de   ; C = el caracter
	inc a			;a5df
	ret z			;a5e0   ; 0xFF: se acaba
	inc a			;a5e1
	jr z,otro_sitio_a61c		;a5e2   ; 0xFE: otro sitio
	push hl			;a5e4
	ld a,c			;a5e5
	and a			;a5e6
	ld hl,00000h		;a5e7   ; el 0: desde (0, 0)
	jr z,L_A5FA		;a5ea
	and 01fh		;a5ec   ; H = (n & 0x1F) * 8
	add a,a			;a5ee   ; * 8
	add a,a			;a5ef
	add a,a			;a5f0
	ld h,a			;a5f1
	ld a,c			;a5f2   ; L = 0x40 + (n & 0xE0) / 4
	and 0e0h		;a5f3   ; los 3 bits altos...
	rrca			;a5f5
	rrca			;a5f6
	add a,040h		;a5f7   ; .../ 4 + 0x40
	ld l,a			;a5f9
L_A5FA:
	ld a,0c0h		;a5fa   ; con la operacion 0xC0...
	call copia_8x8		;a5fc   ; copia_8x8: el rectangulo de 8 x 8 de (H, L) a (D, E) con la operacion A
	ld a,0d0h		;a5ff   ; ...y otra con la 0xD0
	call copia_8x8		;a601   ; copia_8x8: el rectangulo de 8 x 8 de (H, L) a (D, E) con la operacion A
	ld a,d			;a604   ; 9 a la derecha
	add a,009h		;a605   ; 9 a la derecha
	ld d,a			;a607
	pop hl			;a608
	inc hl			;a609   ; el caracter siguiente
	jr caracter_a61c		;a60a
otro_sitio_a61c:
	inc hl			;a60c
	jr sitio_a61c		;a60d   ; tras el 0xFE, el sitio nuevo
copia_8x8:		; el rectangulo de 8 x 8 de (H, L) a (D, E) con la operacion A
	push hl			;a60f
	push de			;a610
	push bc			;a611
	ld bc,00808h		;a612   ; 8 x 8
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


direccion_del_mando:		; la direccion pedida con el mando (p06:A639) y la de marcha (p06:A6B8)
	call direccion_pedida		;a634   ; direccion_pedida: 0xCB0C = la direccion del mando (p06:A6A8: 1 arriba, 2 abajo, 3 izquierda, 4 derecha); manda la recien pulsada y, al soltarla, la de antes (0xCB11); con 0xCB28 o el estado 0x0B, solo arriba y abajo (salvo con 0xCA9B, 0xCB37 o 0xCB3F)
	jr $+129		;a637   ; y la direccion de marcha
direccion_pedida:		; 0xCB0C = la direccion del mando (p06:A6A8: 1 arriba, 2 abajo, 3 izquierda, 4 derecha); manda la recien pulsada y, al soltarla, la de antes (0xCB11); con 0xCB28 o el estado 0x0B, solo arriba y abajo (salvo con 0xCA9B, 0xCB37 o 0xCB3F)
	ld c,00fh		;a639   ; las cuatro direcciones
	ld a,(0ca9bh)		;a63b   ; con 0xCA9B...
	or a			;a63e
	jr nz,mira_el_mando		;a63f
	ld a,(0cb37h)		;a641   ; ...0xCB37...
	or a			;a644
	jr nz,mira_el_mando		;a645
	ld a,(0cb3fh)		;a647   ; ...o 0xCB3F: las cuatro
	or a			;a64a
	jr nz,mira_el_mando		;a64b
	ld a,(0cb28h)		;a64d   ; con 0xCB28...
	or a			;a650
	jr nz,solo_arriba_abajo		;a651
	ld a,(0cb00h)		;a653   ; ...o en el estado 0x0B...
	cp 00bh		;a656
	jr nz,mira_el_mando		;a658
solo_arriba_abajo:
	ld c,003h		;a65a   ; ...solo arriba y abajo
mira_el_mando:		; recien pulsada: manda esa
	ld a,(0ca07h)		;a65c   ; lee lo recien pulsado del mando (los bits de 0xCA08 que no estaban)
	and c			;a65f   ; algo recien pulsado: manda eso
	jr nz,manda_la_nueva		;a660
	ld hl,0cb10h		;a662   ; sigue pulsada la que manda: esa
	ld a,(0ca08h)		;a665   ; lee el mando: joystick y teclado juntos (bits 0-3 las direcciones, 4-5 los disparos)
	and c			;a668   ; de lo pulsado...
	ld b,a			;a669
	and (hl)			;a66a   ; ...la que manda sigue pulsada: esa
	ld a,b			;a66b
	jr nz,numero_de_direccion		;a66c
	ld hl,0cb11h		;a66e   ; si no, la de antes, si sigue
	ld a,(0ca08h)		;a671   ; lee el mando: joystick y teclado juntos (bits 0-3 las direcciones, 4-5 los disparos)
	and c			;a674
	and (hl)			;a675   ; la de antes sigue pulsada...
	ld a,b			;a676
	jr z,numero_de_direccion		;a677
	ld a,(hl)			;a679   ; ...pasa a mandar y la de antes, ninguna
	ld (hl),000h		;a67a
	jr pon_cb10		;a67c
manda_la_nueva:		; la que mandaba pasa a ser la de antes
	ld a,(0cb10h)		;a67e   ; lee la direccion que manda en el mando (un bit de 0xCA08)
	ld (0cb11h),a		;a681   ; guarda la direccion que se pulso antes que la de 0xCB10
	ld a,(0ca07h)		;a684   ; de las recien pulsadas, la primera de arriba, abajo, izquierda y derecha
	and c			;a687   ; de lo recien pulsado...
	ld c,a			;a688
	and 001h		;a689   ; ...arriba...
	jr nz,pon_cb10		;a68b
	ld a,c			;a68d   ; ...abajo...
	and 002h		;a68e
	jr nz,pon_cb10		;a690
	ld a,c			;a692   ; ...izquierda...
	and 004h		;a693
	jr nz,pon_cb10		;a695
	ld a,c			;a697   ; ...o derecha
	and 008h		;a698
pon_cb10:
	ld (0cb10h),a		;a69a   ; guarda la direccion que manda en el mando (un bit de 0xCA08)
numero_de_direccion:		; el bit a numero (p06:A6A8)
	ld hl,0a6a8h		;a69d
	call 0423eh		;a6a0   ; suma_a_hl: HL = HL + A
	ld a,(hl)			;a6a3   ; el numero de la direccion...
	ld (0cb0ch),a		;a6a4   ; ...a 0xCB0C
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


direccion_de_marcha:		; 0xCB0D = la direccion de antes; sin direccion pulsada (las mismas de p06:A639), 0xCB0F = 1; con ella, 0xCB0F = 0 y la de marcha = 0xCB0C
	ld a,(0cb0eh)		;a6b8   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ld (0cb0dh),a		;a6bb   ; guarda la direccion pedida con el mando (1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ld b,00fh		;a6be   ; las cuatro direcciones...
	ld a,(0ca9bh)		;a6c0   ; ...con 0xCA9B...
	or a			;a6c3
	jr nz,hay_direccion		;a6c4
	ld a,(0cb37h)		;a6c6   ; ...0xCB37...
	or a			;a6c9
	jr nz,hay_direccion		;a6ca
	ld a,(0cb3fh)		;a6cc   ; ...o 0xCB3F
	or a			;a6cf
	jr nz,hay_direccion		;a6d0
	ld a,(0cb28h)		;a6d2   ; con 0xCB28...
	or a			;a6d5
	jr nz,solo_arriba_abajo_b		;a6d6
	ld a,(0cb00h)		;a6d8   ; ...o en el estado 0x0B...
	cp 00bh		;a6db
	jr nz,hay_direccion		;a6dd
solo_arriba_abajo_b:
	ld b,003h		;a6df   ; ...solo arriba y abajo
hay_direccion:
	ld a,(0ca08h)		;a6e1   ; lee el mando: joystick y teclado juntos (bits 0-3 las direcciones, 4-5 los disparos)
	and b			;a6e4   ; alguna pulsada
	jr nz,con_direccion		;a6e5
	inc a			;a6e7   ; A = 1
	ld (0cb0fh),a		;a6e8   ; guarda 1 si Snake ha chocado en este cuadro
	ret			;a6eb
con_direccion:
	xor a			;a6ec
	ld (0cb0fh),a		;a6ed   ; guarda 1 si Snake ha chocado en este cuadro
	ld a,(0cb0ch)		;a6f0   ; la direccion pedida...
	and a			;a6f3
	ret z			;a6f4   ; ...ninguna: la de antes
	ld (0cb0eh),a		;a6f5   ; ...a la de marcha
	ret			;a6f8
cuentas_de_snake:		; el suelo de la zona 7 (p06:A710), la cuenta de 0xCB54 y, con 0xCB4B, cada 4 cuadros el bit 0 de 0xCB4D
	call suelo_zona_7		;a6f9   ; suelo_zona_7: con 0xD8E2 a 0 (zona 7, p06:A798) y sin salir: 0xCB37 = 1 y la cuenta de 0xCB29 segun el caracter bajo Snake; con los caracteres 4-5, 0x10-0x16 o 0x2B en adelante, 0xCB28 = 0 y 0xCB29 = 0x20
	call cuenta_cb54		;a6fc   ; la cuenta de 0xCB54
	ld hl,0cb4bh		;a6ff   ; apunta a con el puesto, la vida baja un punto cada 16 cuadros
	ld a,(hl)			;a702
	or a			;a703   ; sin 0xCB4B, nada
	ret z			;a704
	inc l			;a705   ; la espera de 4 de 0xCB4C
	dec (hl)			;a706
	ret nz			;a707
	ld (hl),004h		;a708   ; otros 4
	inc l			;a70a   ; ...cambia el bit 0 de 0xCB4D
	ld a,(hl)			;a70b
	xor 001h		;a70c   ; el bit 0 de 0xCB4D cambia
	ld (hl),a			;a70e
	ret			;a70f
suelo_zona_7:		; con 0xD8E2 a 0 (zona 7, p06:A798) y sin salir: 0xCB37 = 1 y la cuenta de 0xCB29 segun el caracter bajo Snake; con los caracteres 4-5, 0x10-0x16 o 0x2B en adelante, 0xCB28 = 0 y 0xCB29 = 0x20
	ld hl,0d8e2h		;a710   ; apunta a de paso (en p01:62B5: 0 copia con ldir, 1 caracter a caracter)
	call d8e2_zona_7		;a713   ; 0xD8E2 segun la sala
	ld a,(hl)			;a716
	or a			;a717
	ret nz			;a718   ; con 0xD8E2, nada mas
	xor a			;a719
	ld (0cb37h),a		;a71a   ; 0xCB37 = 0
	ld a,(0ca41h)		;a71d   ; lee la salida de la sala (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	or a			;a720
	ret nz			;a721   ; saliendo de la sala, nada
	ld a,(0cb03h)		;a722   ; lee la Y de Snake
	ld l,a			;a725   ; L = la Y
	ld a,(0cb05h)		;a726   ; lee la X de Snake
	ld h,a			;a729   ; H = la X
	call 07f69h		;a72a   ; caracter_en: A = el caracter del mapa en (H = X, L = Y)
	or a			;a72d   ; el caracter bajo Snake
	jr z,caracter_0_zona_7		;a72e   ; el 0
	cp 001h		;a730
	jr z,cuenta_cb29		;a732   ; el 1
	cp 004h		;a734
	jr c,cuenta_cb29		;a736   ; el 2-3
	cp 006h		;a738
	jr c,cb28_a_cero		;a73a   ; el 4-5: a cero
	cp 010h		;a73c
	jr c,cuenta_cb29		;a73e   ; el 6-0x0F
	cp 017h		;a740
	jr c,cb28_a_cero		;a742   ; el 0x10-0x16: a cero
	cp 02bh		;a744
	jr nc,cb28_a_cero		;a746   ; desde el 0x2B: a cero; 0x17-0x2A, la cuenta
cuenta_cb29:		; 0xCB37 = 1, 0xCB28 = 2 y, cada 8 cuadros (0xCB38), uno menos a 0xCB29 con el sonido 0x53; a 0, Snake en el estado 0x1B y el sonido 0x8D; por encima de 0x10, a 0x10
	ld a,001h		;a748
	ld (0cb37h),a		;a74a   ; 0xCB37 = 1
	ld a,002h		;a74d
	ld (0cb28h),a		;a74f   ; 0xCB28 = 2
	ld a,(0cb29h)		;a752
	or a			;a755
	ret z			;a756   ; a cero, nada
	cp 011h		;a757
	jr nc,cb29_a_10		;a759   ; por encima de 0x10, a 0x10
	ld hl,0cb38h		;a75b
	dec (hl)			;a75e
	ret nz			;a75f   ; cada 8 cuadros...
	ld (hl),008h		;a760   ; ...otros 8...
	ld hl,0cb29h		;a762
	dec (hl)			;a765   ; ...uno menos a 0xCB29
	ld a,(hl)			;a766
	or a			;a767
	jp nz,06c6bh		;a768   ; queda: el sonido 0x53
	ld hl,0cb00h		;a76b   ; apunta a el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	ld (hl),01bh		;a76e   ; a cero: el estado 0x1B...
	jp 06ba0h		;a770   ; ...y el sonido 0x8D
cb29_a_10:
	ld hl,0cb38h		;a773
	ld (hl),001h		;a776   ; 0xCB38 = 1
	ld a,010h		;a778
	ld (0cb29h),a		;a77a   ; 0xCB29 = 0x10
	jp 06c6bh		;a77d   ; sonido_53: pide el sonido 0x53
caracter_0_zona_7:		; el caracter 0: 0xCB37 = 1, 0xCB28 = 2, 0xCB29 = 0x1A y 0xCB38 = 1
	ld a,001h		;a780
	ld (0cb37h),a		;a782   ; 0xCB37 = 1
	ld c,01ah		;a785   ; 0xCB29 = 0x1A...
	ld b,002h		;a787   ; ...0xCB28 = 2
	call 09367h		;a789   ; pon_cb28: 0xCB28 = B, 0xCB29 = C
	ld hl,0cb38h		;a78c
	ld (hl),001h		;a78f   ; 0xCB38 = 1
	ret			;a791
cb28_a_cero:
	ld bc,00020h		;a792   ; 0xCB28 = 0, 0xCB29 = 0x20
	jp 09367h		;a795   ; pon_cb28: 0xCB28 = B, 0xCB29 = C
d8e2_zona_7:		; 0xD8E2 = 1 salvo en la zona 7 (sin sala especial): salas 2, 3 y 8 enteras, la 4 con Y >= 0x8F y X >= 0x4E y la 9 con Y < 0xA0 y X >= 0x20
	ld (hl),000h		;a798   ; 0xD8E2 = 0 de entrada
	ld a,(0ca76h)		;a79a   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	or a			;a79d
	jr nz,d8e2_a_1		;a79e   ; en una sala especial, 1
	ld a,(0ca4ah)		;a7a0   ; lee la zona
	cp 007h		;a7a3
	jr nz,d8e2_a_1		;a7a5   ; fuera de la zona 7, 1
	ld a,(0ca4bh)		;a7a7   ; lee la sala de la zona
	cp 002h		;a7aa
	ret z			;a7ac   ; la sala 2: 0
	cp 003h		;a7ad
	ret z			;a7af   ; la 3: 0
	cp 004h		;a7b0
	jr z,sala_4_zona_7		;a7b2   ; la 4: segun el sitio
	cp 008h		;a7b4
	ret z			;a7b6   ; la 8: 0
	cp 009h		;a7b7
	jr nz,d8e2_a_1		;a7b9   ; la 9: segun el sitio; las demas, 1
	ld a,(0cb03h)		;a7bb   ; lee la Y de Snake
	cp 0a0h		;a7be
	ret nc			;a7c0   ; desde Y = 0xA0: 0
	ld a,(0cb05h)		;a7c1   ; lee la X de Snake
	cp 020h		;a7c4
	ret c			;a7c6   ; a la izquierda de X = 0x20: 0
d8e2_a_1:
	ld (hl),001h		;a7c7
	ret			;a7c9   ; 1
sala_4_zona_7:
	ld a,(0cb03h)		;a7ca   ; lee la Y de Snake
	cp 08fh		;a7cd
	ret c			;a7cf   ; por encima de Y = 0x8F: 0
	ld a,(0cb05h)		;a7d0   ; lee la X de Snake
	cp 04eh		;a7d3
	ret c			;a7d5   ; a la izquierda de X = 0x4E: 0
	ld (hl),001h		;a7d6   ; si no, 1
	ret			;a7d8
cuenta_cb54:		; con 0xCB54, la cuenta de 0xCB56; a 0, 0xCB54 = 0
	ld a,(0cb54h)		;a7d9
	or a			;a7dc
	ret z			;a7dd   ; sin 0xCB54, nada
	ld hl,0cb56h		;a7de
	dec (hl)			;a7e1   ; la cuenta de 0xCB56...
	ret nz			;a7e2
	ld hl,0cb54h		;a7e3
	ld (hl),000h		;a7e6   ; ...a cero, 0xCB54 = 0
	ret			;a7e8
lanzado_por_tipo:		; lo lanzado de IX segun su tipo (p06:A7F0): el 1 p06:A800, el 3 p06:A885, el 7 p06:A8E1; los demas, nada
	ld a,(ix+000h)		;a7e9
	dec a			;a7ec   ; desde el tipo 1
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


lanzado_1:		; el tipo 1 va con su actor (bytes 0x0A-0x0B): se acaba si el actor se va o deja ciertos pasos (segun su tipo y la alerta); si no, cada 2 cuadros el dibujo siguiente y, al 4, el sonido 0x0B y, sin alerta, el aviso 0x84 del actor
	call actor_del_lanzado		;a800   ; actor_del_lanzado: DE = su actor (bytes 0x0A-0x0B); con el actor libre, se acaba (Z)
	ret z			;a803   ; el actor se fue: ya esta
	ld a,(de)			;a804   ; el tipo del actor...
	inc de			;a805
	cp 00ah		;a806   ; tipo 0x0A
	jr z,actor_tipo_0a		;a808
	cp 003h		;a80a   ; tipo 3
	ld a,(de)			;a80c   ; ...y su paso
	ld c,a			;a80d   ; C = el paso del actor
	jr z,actor_tipo_3		;a80e
	sub 00ah		;a810   ; los tipos 0x0A-0x0D, sigue
	cp 004h		;a812
	jr c,lanzado_1_dibujo		;a814   ; 0x0A-0x0D: sigue
	ld a,(0ca5fh)		;a816   ; con la alerta 1, en los pasos 6-7 y 0x0A-0x0B sigue
	dec a			;a819
	jr nz,lanzado_1_pasos		;a81a   ; sin la alerta 1...
	ld a,c			;a81c
	sub 006h		;a81d
	cp 002h		;a81f   ; con el paso 6-7...
	jr c,lanzado_1_dibujo		;a821
	ld a,c			;a823
	sub 00ah		;a824
	cp 002h		;a826   ; ...o 0x0A-0x0B, sigue
	jr c,lanzado_1_dibujo		;a828
lanzado_1_pasos:		; en los pasos 8-9, sin sprite
	ld a,c			;a82a
	sub 008h		;a82b
	cp 002h		;a82d   ; en los pasos 8-9, el sprite fuera
	jp c,lanzado_sin_sprite		;a82f   ; lanzado_sin_sprite: Y = 0xE0 en la ficha y el sprite (los dos para el 3); B = el sprite
	ld a,(0ca5fh)		;a832   ; sin alerta, se acaba; con ella, desde el paso 6 sigue
	and a			;a835
	jp z,09ca1h		;a836   ; sin alerta, se acaba
	ld a,c			;a839
	cp 006h		;a83a
	ret nc			;a83c   ; desde el paso 6, nada
	jp 09ca1h		;a83d   ; por debajo, se acaba
actor_tipo_3:		; el tipo 3 en los pasos 4-5 sigue
	sub 004h		;a840
	cp 002h		;a842
	jp nc,09ca1h		;a844   ; fuera de los pasos 4-5, se acaba
lanzado_1_dibujo:		; cada 2 cuadros el dibujo siguiente...
	dec (ix+00ch)		;a847
	ret nz			;a84a
	ld (ix+00ch),002h		;a84b   ; otros 2 cuadros
	inc (ix+00dh)		;a84f   ; el dibujo siguiente
	ld a,(ix+00dh)		;a852
	cp 004h		;a855   ; ...al 4, el sonido 0x0B...
	ret nz			;a857   ; hasta el 4, nada mas
	call 06a1dh		;a858   ; sonido_0b: pide el sonido 0x0B
	push ix		;a85b   ; ...y sin alerta, el aviso 0x84 de su actor
	ld e,(ix+00ah)		;a85d   ; IX = su actor
	ld d,(ix+00bh)		;a860
	push de			;a863
	pop ix		;a864
	ld a,(0ca5fh)		;a866   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	and a			;a869
	call z,09d03h		;a86a   ; sin alerta, el aviso 0x84
	pop ix		;a86d   ; IX otra vez lo lanzado
nada_lanzado:
	ret			;a86f
actor_tipo_0a:		; el tipo 0x0A, en el paso 0 se acaba
	ld a,(de)			;a870
	and a			;a871   ; su actor en el paso 0...
	jp z,09ca1h		;a872   ; ...se acaba
	jr lanzado_1_dibujo		;a875
actor_del_lanzado:		; DE = su actor (bytes 0x0A-0x0B); con el actor libre, se acaba (Z)
	ld e,(ix+00ah)		;a877
	ld d,(ix+00bh)		;a87a
	ld a,(de)			;a87d   ; el tipo del actor
	and a			;a87e
	ret nz			;a87f   ; ocupado: NZ
	call 09ca1h		;a880   ; libre: se acaba (salvo el 3 y el 7)
	xor a			;a883   ; Z
	ret			;a884
lanzado_3:		; el tipo 3: en el paso 0 sube y cae (0xC0 mas a la velocidad en Y) hasta 0x10 de la Y del byte 0x0D; despues, el paso 1 parado con el sonido 0x14 y 0x10 cuadros parpadeando; al acabar, fuera
	ld a,(ix+001h)		;a885
	and a			;a888
	jr nz,lanzado_3_paso_1		;a889   ; desde el paso 1
	call cuenta_y_parpadeo		;a88b   ; la cuenta y el parpadeo
	ld a,(ix+003h)		;a88e   ; lejos de su Y final...
	sub (ix+00dh)		;a891   ; la Y - la Y final...
	cp 010h		;a894
	jr c,lanzado_3_llega		;a896   ; ...a menos de 0x10: llega
	ld h,(ix+007h)		;a898   ; ...la velocidad en Y sube 0xC0
	ld l,(ix+006h)		;a89b   ; la velocidad en Y...
	ld de,000c0h		;a89e   ; ...0xC0 mas (cae)
	add hl,de			;a8a1
	ld (ix+007h),h		;a8a2
	ld (ix+006h),l		;a8a5
	ret			;a8a8
lanzado_3_llega:		; el paso 1, 0x10 cuadros, el byte 0x0F = 2, parado y el sonido 0x14
	inc (ix+001h)		;a8a9
	ld (ix+00ch),010h		;a8ac   ; 0x10 cuadros
	ld (ix+00fh),002h		;a8b0   ; el byte 0x0F = 2
	xor a			;a8b4
	ld (ix+007h),a		;a8b5   ; parado en Y...
	ld (ix+006h),a		;a8b8
	ld (ix+009h),a		;a8bb   ; ...y en X
	ld (ix+008h),a		;a8be
	jp 06a44h		;a8c1   ; sonido_14: pide el sonido 0x14
lanzado_3_paso_1:		; al acabar la cuenta, fuera
	call cuenta_y_parpadeo		;a8c4   ; cuenta_y_parpadeo: un cuadro menos al byte 0x0C (Z al acabar); cada 2, el bit 0 del byte 0x0F cambia (NZ)
	ret nz			;a8c7   ; hasta el final de la cuenta, nada
	jp 09caah		;a8c8   ; fuera
cuenta_y_parpadeo:		; un cuadro menos al byte 0x0C (Z al acabar); cada 2, el bit 0 del byte 0x0F cambia (NZ)
	dec (ix+00ch)		;a8cb
	ret z			;a8ce   ; a cero: Z
	ld a,(ix+00ch)		;a8cf
	and 001h		;a8d2   ; los cuadros impares, NZ sin mas
	ret nz			;a8d4
	ld a,(ix+00fh)		;a8d5   ; el bit 0 del byte 0x0F...
	rra			;a8d8
	ccf			;a8d9   ; ...cambia
	rla			;a8da
	ld (ix+00fh),a		;a8db
	or 001h		;a8de   ; NZ
	ret			;a8e0
lanzado_7:		; el tipo 7: al acabar la cuenta, fuera
	dec (ix+00ch)		;a8e1
	ret nz			;a8e4   ; hasta el final de la cuenta, nada
	jp 09caah		;a8e5   ; a_p06_aa18_guarda: p06:AA18 guardando el banco de 0xA000
lanza_el_3:		; lo lanzado de tipo 3 (IY) desde el actor IX: el sonido 0x0E, dos sprites (C y C + 1, colores 7 y 0x48), la Y final la de Snake - 0x10, velocidades 0xFE00 en Y y 0x30 en X, en la Y y la X del actor - 0x10
	call 06a29h		;a8e8   ; sonido_0e: pide el sonido 0x0E
	ld (hl),001h		;a8eb   ; los dos sprites ocupados
	inc hl			;a8ed   ; y el sprite siguiente
	ld (hl),001h		;a8ee
	ld (iy+00eh),c		;a8f0   ; el sprite del lanzado
	ld a,(0cb03h)		;a8f3   ; la Y final
	sub 010h		;a8f6   ; la Y final: 0x10 por encima de Snake
	ld (iy+00dh),a		;a8f8
	ld (iy+008h),030h		;a8fb   ; la velocidad en X: 0x0030...
	ld (iy+007h),0feh		;a8ff   ; ...la de Y: 0xFE00 (sube)
	ld (iy+000h),003h		;a903   ; el tipo 3
	ld a,(ix+003h)		;a907   ; la Y del actor - 0x10
	sub 010h		;a90a
	ld (iy+003h),a		;a90c
	ld a,(ix+005h)		;a90f   ; la X del actor - 0x10
	sub 010h		;a912
	ld (iy+005h),a		;a914
	ld a,007h		;a917   ; el color 7 al sprite C...
	push bc			;a919
	call 09c5bh		;a91a   ; color_de_sprite: las 16 lineas de colores del sprite C (0xDAA0 + C * 16) con el color A
	pop bc			;a91d
	inc c			;a91e   ; ...y el 0x48 al siguiente
	ld a,048h		;a91f
	jp 09c5bh		;a921   ; color_de_sprite: las 16 lineas de colores del sprite C (0xDAA0 + C * 16) con el color A
lanza_el_7:		; lo lanzado de tipo 7 (IY): el sonido 0x43, el sprite C (color 7), 6 cuadros, en (H, L) de 0xD8E6
	call 06c2bh		;a924   ; sonido_43: pide el sonido 0x43
	ld (hl),001h		;a927   ; su sprite ocupado
	ld (iy+00eh),c		;a929   ; el sprite
	ld (iy+000h),007h		;a92c   ; el tipo 7
	ld (iy+00ch),006h		;a930   ; 6 cuadros
	ld hl,(0d8e6h)		;a934   ; el sitio de 0xD8E6...
	ld (iy+003h),h		;a937
	ld (iy+005h),l		;a93a
	ld a,007h		;a93d   ; ...y el color 7
	jp 09c5bh		;a93f   ; color_de_sprite: las 16 lineas de colores del sprite C (0xDAA0 + C * 16) con el color A
desplazamiento_de_4:		; 0xD43C = el desplazamiento de p06:A952 segun el dibujo del actor ((byte 0x0D / 2) & 3)
	ld a,(ix+00dh)		;a942
	rrca			;a945   ; (dibujo / 2) & 3
	and 003h		;a946
	ld hl,0a952h		;a948
	call 043f6h		;a94b   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld (0d43ch),hl		;a94e   ; el desplazamiento
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


desplazamiento_de_8:		; 0xD43C = el desplazamiento de p06:A969 segun el dibujo del actor (byte 0x0D & 7)
	ld a,(ix+00dh)		;a95a
	and 007h		;a95d   ; dibujo & 7
	ld hl,0a969h		;a95f
	call 043f6h		;a962   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld (0d43ch),hl		;a965   ; el desplazamiento
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


sprite_del_lanzado:		; el sprite de lo lanzado en su sitio: el 1 por p06:A9DA, el 3 dos (p06:A9C3 por el byte 0x0F), el 5 con el patron 0xB8, el 7 con 0xF0/0xF4 (segun la cuenta) 2 arriba y 8 a la izquierda; los demas, 0x18
	ld a,(ix+000h)		;a979
	cp 003h		;a97c   ; el 3: dos sprites
	jr z,sprite_de_3		;a97e
	dec a			;a980   ; el 1: sobre su actor
	jp z,sprite_de_1		;a981   ; sprite_de_1: el tipo 1, patron 0xE0, sobre su actor: segun el dibujo (byte 0x0D & 3), Y - 0x20 y X - 0x10, Y - 0x20 y X + 8, o Y - 0x28 y X - 4; fuera de la pantalla, Y = 0xE0
	call 09cb7h		;a984   ; HL = su sprite
	ld a,(ix+000h)		;a987
	cp 005h		;a98a   ; el 5: el patron 0xB8
	ld c,0b8h		;a98c
	jp z,sprite_en_su_sitio		;a98e   ; sprite_en_su_sitio: el sprite de HL: la Y + D, la X + E y el patron C
	cp 007h		;a991   ; los que no son el 7: el 0x18
	ld c,018h		;a993
	jp nz,sprite_en_su_sitio		;a995   ; sprite_en_su_sitio: el sprite de HL: la Y + D, la X + E y el patron C
	ld de,0fef8h		;a998   ; el 7: 2 arriba y 8 a la izquierda...
	ld a,(ix+00ch)		;a99b   ; ...con la cuenta desde 4, el patron 0xF0...
	cp 004h		;a99e
	ld c,0f0h		;a9a0
	jp nc,sprite_desplazado		;a9a2   ; sprite_desplazado:
	ld c,0f4h		;a9a5   ; ...si no, el 0xF4
	jp sprite_desplazado		;a9a7   ; sprite_desplazado:
sprite_de_3:		; el patron de p06:A9C3; dos sprites, patron y patron + 4
	ld a,(ix+00fh)		;a9aa
	ld hl,0a9c3h		;a9ad   ; el patron segun el byte 0x0F
	call 0423eh		;a9b0   ; suma_a_hl: HL = HL + A
	ld c,(hl)			;a9b3
	call 09cb7h		;a9b4   ; HL = su sprite
	ld b,002h		;a9b7   ; dos sprites
dos_sprites:
	call sprite_en_su_sitio		;a9b9   ; sprite_en_su_sitio: el sprite de HL: la Y + D, la X + E y el patron C
	inc c			;a9bc   ; el patron + 4 para el segundo
	inc c			;a9bd
	inc c			;a9be
	inc c			;a9bf
	djnz dos_sprites		;a9c0
fin_sprite_lanzado:
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


sprite_en_su_sitio:		; el sprite de HL: la Y + D, la X + E y el patron C
	ld de,00000h		;a9c7   ; sin desplazamiento
sprite_desplazado:
	ld a,(ix+003h)		;a9ca   ; la Y + D
	add a,d			;a9cd
	ld (hl),a			;a9ce
	inc hl			;a9cf
	ld a,(ix+005h)		;a9d0   ; la X + E
	add a,e			;a9d3
	ld (hl),a			;a9d4
	inc hl			;a9d5
	ld (hl),c			;a9d6   ; el patron
	inc hl			;a9d7
	inc hl			;a9d8   ; el color, sin tocar
	ret			;a9d9
sprite_de_1:		; el tipo 1, patron 0xE0, sobre su actor: segun el dibujo (byte 0x0D & 3), Y - 0x20 y X - 0x10, Y - 0x20 y X + 8, o Y - 0x28 y X - 4; fuera de la pantalla, Y = 0xE0
	ld a,(ix+00dh)		;a9da
	and 003h		;a9dd   ; el dibujo & 3
	ld bc,0f0e0h		;a9df   ; 0: Y - 0x20, X - 0x10
	jr z,sobre_el_actor		;a9e2
	ld b,008h		;a9e4   ; 2: X + 8
	rra			;a9e6
	jr nc,sobre_el_actor		;a9e7
	ld bc,0fcd8h		;a9e9   ; 1 y 3: Y - 0x28, X - 4
sobre_el_actor:
	ld d,0e0h		;a9ec   ; el patron 0xE0
	push de			;a9ee
	call 09cb7h		;a9ef   ; HL = su sprite
	ld e,(ix+00ah)		;a9f2   ; DE = su actor
	ld d,(ix+00bh)		;a9f5
	inc de			;a9f8
	inc de			;a9f9
	inc de			;a9fa
	ld a,(de)			;a9fb   ; la Y del actor...
	add a,c			;a9fc   ; ...+ el desplazamiento
	ld c,a			;a9fd
	add a,008h		;a9fe   ; fuera por abajo...
	cp 0b8h		;aa00
	jr c,pon_y_sprite		;aa02
	ld c,0e0h		;aa04   ; ...Y = 0xE0
pon_y_sprite:
	ld (hl),c			;aa06
	inc de			;aa07   ; la X del actor...
	inc de			;aa08
	ld a,(de)			;aa09   ; la X del actor...
	add a,b			;aa0a   ; ...+ el desplazamiento
	ld b,a			;aa0b
	cp 0b8h		;aa0c   ; fuera por la derecha...
	jr c,pon_x_sprite		;aa0e
	ld (hl),0e0h		;aa10   ; ...Y = 0xE0
pon_x_sprite:
	inc hl			;aa12
	ld (hl),b			;aa13
	inc hl			;aa14
	pop af			;aa15
	ld (hl),a			;aa16   ; el patron
	ret			;aa17
fin_del_lanzado:		; lo lanzado se acaba: tipo 0, el sprite fuera y libre su sitio de 0xD400 (dos para el 3)
	ld c,(ix+000h)		;aa18
	ld (ix+000h),000h		;aa1b   ; el tipo a cero
	call lanzado_sin_sprite		;aa1f   ; el sprite fuera (B = el sprite)
	ld hl,0d400h		;aa22   ; apunta a los 22 sprites que se reparten los actores (1 = ocupado)
	ld a,b			;aa25
	call 0423eh		;aa26   ; suma_a_hl: HL = HL + A
	ld (hl),000h		;aa29   ; su sitio de 0xD400 libre
	ld a,c			;aa2b
	cp 003h		;aa2c
	ret nz			;aa2e   ; el 3 tiene dos
	inc hl			;aa2f
	ld (hl),000h		;aa30   ; el segundo libre
	ret			;aa32
lanzado_sin_sprite:		; Y = 0xE0 en la ficha y el sprite (los dos para el 3); B = el sprite
	call 09cb7h		;aa33   ; sprite_de_lanzado: HL = el sprite (byte 0x0E) desde el 10 (0xDC28)
	ld b,(ix+00eh)		;aa36   ; B = el sprite
	ld d,0e0h		;aa39   ; Y = 0xE0...
	ld (ix+003h),d		;aa3b   ; ...en la ficha...
	ld (hl),d			;aa3e   ; ...y en el sprite
	ld a,c			;aa3f
	cp 003h		;aa40
	ret nz			;aa42   ; el 3...
	inc hl			;aa43
	inc hl			;aa44
	inc hl			;aa45
	inc hl			;aa46
	ld (hl),d			;aa47   ; ...tambien el sprite siguiente
	ret			;aa48
teclas_f_permitidas:		; acarreo si se pueden las teclas F2-F5: no con ciertas cosas de 0xD881-0xD883 sin lo de 0xD678-0xD69C, 0xD8C1 = 0x13, 0xD8C2 = 5 con 0xCB5F, ni en los estados 0x10, 0x11 o 0x13 en adelante salvo 0x18-0x19; nada (NC sin tocar) con el rotulo, 0xE1D0, 0xE1F0, mirando la sala de al lado o en pausa; con 0xCB37, solo con 0xCB28 < 2
	ld a,(0d881h)		;aa49
	inc a			;aa4c
	jr z,mira_d8c1		;aa4d   ; 0xD881 a 0xFF: mira 0xD8C1
	ld a,(0d88ah)		;aa4f
	inc a			;aa52
	jr nz,mira_d883		;aa53   ; 0xD88A distinto de 0xFF: mira 0xD883
	ld a,(0d680h)		;aa55
	or a			;aa58
	jr nz,mira_d883		;aa59   ; con 0xD680 tambien...
	ld a,(0d69ch)		;aa5b
	or a			;aa5e
	jr z,no_se_puede		;aa5f   ; ...o 0xD69C; sin ninguno, no se puede
mira_d883:
	ld a,(0d883h)		;aa61
	inc a			;aa64
	jr nz,mira_d8c1		;aa65   ; 0xD883 distinto de 0xFF: mira 0xD8C1
	ld a,(0d678h)		;aa67
	or a			;aa6a
	jr nz,mira_d8c1		;aa6b   ; con 0xD678...
	ld a,(0d68ch)		;aa6d
	or a			;aa70
	jr z,no_se_puede		;aa71   ; ...o 0xD68C; sin ninguno, no se puede
mira_d8c1:
	ld a,(0d8c1h)		;aa73   ; lee el paso de lo de 0xD8C2 (20 pasos, p07:A012)
	cp 013h		;aa76
	jr z,no_se_puede		;aa78   ; 0xD8C1 = 0x13: no se puede
	ld a,(0d8c2h)		;aa7a   ; lee la entrada de p07:AA83 junto a la que esta Snake (su numero, p07:A543)
	cp 005h		;aa7d
	jr nz,mira_rotulos		;aa7f   ; 0xD8C2 = 5...
	ld a,(0cb5fh)		;aa81
	or a			;aa84
	jr nz,no_se_puede		;aa85   ; ...con 0xCB5F: no se puede
mira_rotulos:
	ld a,(0caa8h)		;aa87   ; lee 1 mientras se ve el rotulo de la cosa cogida
	or a			;aa8a
	ret nz			;aa8b   ; con el rotulo, nada
	ld a,(0e1d0h)		;aa8c   ; lee 1 con la ficha de p09:A061 en marcha (zona 0x0A; 0xE1D1 paso, 0xE1D2-0xE1D3 su sitio)
	or a			;aa8f
	ret nz			;aa90   ; con 0xE1D0, nada
	ld a,(0e1f0h)		;aa91
	or a			;aa94
	ret nz			;aa95   ; con 0xE1F0, nada
	ld a,(0e256h)		;aa96   ; lee la direccion en la que se mira la sala de al lado (estado 0x0E)
	or a			;aa99
	ret nz			;aa9a   ; mirando la sala de al lado, nada
	ld a,(0cac0h)		;aa9b   ; lee 1 en pausa (F1)
	or a			;aa9e
	ret nz			;aa9f   ; en pausa, nada
	ld a,(0cb00h)		;aaa0   ; lee el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	cp 010h		;aaa3
	jr z,no_se_puede		;aaa5   ; el estado 0x10: no
	cp 011h		;aaa7
	jr z,no_se_puede		;aaa9   ; el 0x11: no
	cp 018h		;aaab
	jr z,si_se_puede		;aaad   ; el 0x18: si
	cp 019h		;aaaf
	jr z,si_se_puede		;aab1   ; el 0x19: si
	cp 013h		;aab3
	jr nc,no_se_puede		;aab5   ; desde el 0x13: no
	ld a,(0cb37h)		;aab7
	or a			;aaba
	jr z,si_se_puede		;aabb   ; sin 0xCB37: si
	ld a,(0cb28h)		;aabd
	cp 002h		;aac0
	ccf			;aac2   ; con 0xCB28 por debajo de 2: si
	ret			;aac3
si_se_puede:
	scf			;aac4
	ret			;aac5
no_se_puede:
	and a			;aac6
	ret			;aac7
mosaico_de_d7e2:		; sin 0xD8C0, con el bit 5 de 0xD7E2 y 0xD8C2 distinto de 5: en la zona 6 sala 0x23 el mosaico de p06:AB1D (forma 3); en la 0x0B sala 7 y la 0x0D sala 3, el de p06:AB19 (forma 1); los dos de 2 x 2 en (0x28, 0x88)
	ld a,(0d8c0h)		;aac8   ; lee 1 con Snake dentro de lo de 0xD8C2 (p07:A40D; 0 al salir, p07:A69A)
	or a			;aacb
	ret nz			;aacc   ; con 0xD8C0, nada
	ld a,(0d7e2h)		;aacd
	bit 5,a		;aad0
	ret z			;aad2   ; sin el bit 5 de 0xD7E2, nada
	ld a,(0d8c2h)		;aad3   ; lee la entrada de p07:AA83 junto a la que esta Snake (su numero, p07:A543)
	cp 005h		;aad6
	ret z			;aad8   ; con 0xD8C2 = 5, nada
	call sala_del_mosaico		;aad9   ; sala_del_mosaico: Z en la zona 0x0B sala 7 y en la 0x0D sala 3; en la 6 sala 0x23 pinta p06:AB1D y NZ
	ret nz			;aadc   ; NZ: nada (o ya pintado)
	ld de,02888h		;aadd   ; en (0x28, 0x88)...
	ld bc,00202h		;aae0   ; ...2 x 2
	ld hl,0ab19h		;aae3   ; mosaico_AB19: un mosaico de 2 x 2 caracteres, un byte cada uno
	jp 050a0h		;aae6   ; mosaico_f2_b1: el mosaico de HL en (D, E), B filas de C caracteres, con la forma 2 de la franja 1 (p00:512C)
sala_del_mosaico:		; Z en la zona 0x0B sala 7 y en la 0x0D sala 3; en la 6 sala 0x23 pinta p06:AB1D y NZ
	ld a,(0ca4ah)		;aae9   ; lee la zona
	cp 00bh		;aaec
	jr z,zona_0b_sala_7		;aaee   ; zona 0x0B
	cp 00dh		;aaf0
	jr z,zona_0d_sala_3		;aaf2   ; zona 0x0D
	cp 006h		;aaf4
	ret nz			;aaf6   ; las demas, salvo la 6: NZ
	ld a,(0ca4bh)		;aaf7   ; lee la sala de la zona
	cp 023h		;aafa
	ret nz			;aafc   ; en la 6, salvo la sala 0x23: NZ
	ld de,02888h		;aafd   ; en (0x28, 0x88)...
	ld bc,00202h		;ab00   ; ...2 x 2
	ld hl,0ab1dh		;ab03   ; mosaico_AB1D: un mosaico de 2 x 2 caracteres, un byte cada uno
	call 050e8h		;ab06   ; mosaico_f2_b3: el mosaico de HL en (D, E), B filas de C caracteres, con la forma 2 de la franja 3 (p00:512C)
	xor a			;ab09   ; NZ
	sub 0a0h		;ab0a
	ret			;ab0c
zona_0d_sala_3:
	ld a,(0ca4bh)		;ab0d   ; lee la sala de la zona
	cp 003h		;ab10
	ret			;ab12   ; Z en la sala 3
zona_0b_sala_7:
	ld a,(0ca4bh)		;ab13   ; lee la sala de la zona
	cp 007h		;ab16
	ret			;ab18   ; Z en la sala 7

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


sala_1_zona_0a:		; con el bit 0 de 0xD7DA, fuera de sitios y salas especiales, en la zona 0x0A sala 1: el mosaico de p06:AB53 y 4 x 4 bytes a 1 desde 0xDE88 en el mapa de la sala (filas de 0x18)
	ld a,(0d7dah)		;ab21
	rra			;ab24
	ret nc			;ab25   ; sin el bit 0 de 0xD7DA, nada
	ld a,(0ca65h)		;ab26   ; lee el sitio de 0xCBE0 en el que esta Snake (0 = ninguno)
	or a			;ab29
	ret nz			;ab2a   ; dentro de un sitio, nada
	ld a,(0ca76h)		;ab2b   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	or a			;ab2e
	ret nz			;ab2f   ; en una sala especial, nada
	ld a,(0ca4ah)		;ab30   ; lee la zona
	cp 00ah		;ab33
	ret nz			;ab35   ; solo la zona 0x0A...
	ld a,(0ca4bh)		;ab36   ; lee la sala de la zona
	dec a			;ab39
	ret nz			;ab3a   ; ...sala 1
	call mosaico_ab7d		;ab3b   ; mosaico_ab7d: el mosaico de p06:AB7D (5 x 4) en (0x40, 0x80) y dos trozos de 8 x 8 en la pagina: (0x40, 0xA0) a (0x60, 0xA0) y (0x50, 0xA0) a (0x40, 0xA0)
	ld hl,0de88h		;ab3e   ; desde 0xDE88 del mapa
	ld b,004h		;ab41   ; 4 filas...
	ld a,001h		;ab43
	ld de,00015h		;ab45   ; ...de 0x18 bytes
fila_a_1:
	ld (hl),a			;ab48
	inc hl			;ab49
	ld (hl),a			;ab4a
	inc hl			;ab4b
	ld (hl),a			;ab4c
	inc hl			;ab4d
	ld (hl),a			;ab4e
	add hl,de			;ab4f   ; la fila siguiente
	djnz fila_a_1		;ab50
	ret			;ab52
mosaico_ab7d:		; el mosaico de p06:AB7D (5 x 4) en (0x40, 0x80) y dos trozos de 8 x 8 en la pagina: (0x40, 0xA0) a (0x60, 0xA0) y (0x50, 0xA0) a (0x40, 0xA0)
	ld hl,0ab7dh		;ab53   ; mosaico_AB7D: un mosaico de 5 x 4 caracteres, un byte cada uno
	ld de,04080h		;ab56   ; en (0x40, 0x80)...
	ld bc,00504h		;ab59   ; ...5 x 4
	call 050a0h		;ab5c   ; mosaico_f2_b1: el mosaico de HL en (D, E), B filas de C caracteres, con la forma 2 de la franja 1 (p00:512C)
	ld hl,040a0h		;ab5f   ; (0x40, 0xA0)...
	ld de,060a0h		;ab62   ; ...a (0x60, 0xA0)
	call copia_8x8_pagina		;ab65   ; copia_8x8_pagina: el rectangulo de 8 x 8 de (H, L) a (D, E) de la pagina 2 a la de dibujo
	ld hl,050a0h		;ab68   ; (0x50, 0xA0)...
	ld de,040a0h		;ab6b   ; ...a (0x40, 0xA0)
copia_8x8_pagina:		; el rectangulo de 8 x 8 de (H, L) a (D, E) de la pagina 2 a la de dibujo
	ld bc,00808h		;ab6e   ; 8 x 8
	ld a,(0ca42h)		;ab71   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	rlca			;ab74   ; la pagina de dibujo de destino...
	rlca			;ab75
	and 00ch		;ab76
	or 002h		;ab78   ; ...y la 2 de origen
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


franjas_de_la_otra:		; 0x58 x 0x10 de (0x80, 0xC0) de la otra pagina a esta y dos copias en Y (YMMM): (0xC0, 0x60) a (0x74, 0x60) y (0, 0xC0) a (0x10, 0xC0)
	call franja_de_la_otra		;ab91   ; franja_de_la_otra:
	ld hl,0c060h		;ab94   ; de (0xC0, 0x60)...
	ld d,074h		;ab97   ; ...a (0x74, 0x60)
	ld e,l			;ab99
	call copia_y_pagina		;ab9a   ; copia_y_pagina: la copia en Y con A = 1 en la pagina 1 o 4 en la 0
	ld hl,000c0h		;ab9d   ; de (0, 0xC0)...
	ld d,010h		;aba0   ; ...a (0x10, 0xC0)
	ld e,l			;aba2
copia_y_pagina:		; la copia en Y con A = 1 en la pagina 1 o 4 en la 0
	ld a,(0ca42h)		;aba3   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	and a			;aba6
	ld a,001h		;aba7   ; en la pagina 1, A = 1...
	jr nz,L_ABAD		;aba9
	ld a,004h		;abab   ; ...en la 0, A = 4
L_ABAD:
	jp 047abh		;abad   ; copia_en_y: orden YMMM del VDP
franja_de_la_otra:
	ld hl,080c0h		;abb0   ; de (0x80, 0xC0)...
	ld d,h			;abb3   ; ...al mismo sitio...
	ld e,l			;abb4
	ld bc,05810h		;abb5   ; ...0x58 x 0x10
	jp 0474dh		;abb8   ; copia_rectangulo_a_esta: p00:4767 de la otra pagina (0xCA42 ^ 1) a la de 0xCA42
piezas_zona_10:		; en la zona 0x10 desde la sala 2: 0xCA4C = 0x0100 y 2 x 2 caracteres de p06:ABFE (segun 0xCA43; 4 mas en la sala 2) de la pagina 2 a la otra, en (0x48, 0x40) en la sala 2 o en (0x68, 0x40)
	ld a,(0ca4ah)		;abbb   ; lee la zona
	cp 010h		;abbe
	ret nz			;abc0   ; solo la zona 0x10...
	ld a,(0ca4bh)		;abc1   ; lee la sala de la zona
	cp 002h		;abc4
	ret c			;abc6   ; ...desde la sala 2
	ld b,004h		;abc7   ; la sala 2: 4 mas en la tabla...
	ld de,04840h		;abc9   ; ...y en (0x48, 0x40)
	jr z,piezas_abfe		;abcc
	ld b,000h		;abce   ; las demas: desde 0...
	ld d,068h		;abd0   ; ...y en (0x68, 0x40)
piezas_abfe:
	ld hl,00100h		;abd2   ; 0xCA4C = 0, 0xCA4D = 1
	ld (0ca4ch),hl		;abd5   ; guarda los 4 bits altos del byte de la sala (p56:BD28) y el byte siguiente (16 bits)
	ld a,(0ca43h)		;abd8   ; 0xCA43 * 4...
	add a,a			;abdb
	add a,a			;abdc
	add a,b			;abdd   ; ...+ B
	ld hl,0abfeh		;abde
	call 0423eh		;abe1   ; suma_a_hl: HL = HL + A
	ld bc,00202h		;abe4   ; 2 filas de 2
fila_de_piezas:
	push bc			;abe7
	push de			;abe8
pieza_abfe:
	ld a,(hl)			;abe9
	call 049dah		;abea   ; el caracter de la pagina 2 a la otra
	inc hl			;abed
	ld a,d			;abee   ; 8 a la derecha
	add a,008h		;abef
	ld d,a			;abf1
	dec c			;abf2
	jr nz,pieza_abfe		;abf3
	pop de			;abf5
	ld a,e			;abf6   ; 8 mas abajo
	add a,008h		;abf7
	ld e,a			;abf9
	pop bc			;abfa
	djnz fila_de_piezas		;abfb
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


fichas_e000:		; 0xE000-0xE03F a cero; en la zona 7, salas 2, 3, 4 y 8, las 8 fichas de 0xE000 desde p06:AC82, p06:AC9A, p06:ACB2 o p06:ACCA (3 bytes cada una)
	ld hl,0e000h		;ac26
	ld bc,0003fh		;ac29   ; 0x40 bytes
	call 04236h		;ac2c   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	ld a,(0ca4ah)		;ac2f   ; lee la zona
	cp 007h		;ac32
	ret nz			;ac34   ; solo en la zona 7
	ld hl,0ac82h		;ac35   ; la sala 2: p06:AC82
	ld a,(0ca4bh)		;ac38   ; lee la sala de la zona
	cp 002h		;ac3b
	jr z,ocho_fichas_e000		;ac3d
	ld hl,0ac9ah		;ac3f   ; la 3: p06:AC9A
	cp 003h		;ac42
	jr z,ocho_fichas_e000		;ac44
	ld hl,0acb2h		;ac46   ; la 4: p06:ACB2
	cp 004h		;ac49
	jr z,ocho_fichas_e000		;ac4b
	ld hl,0accah		;ac4d   ; la 8: p06:ACCA
	cp 008h		;ac50
	ret nz			;ac52   ; las demas, ninguna
ocho_fichas_e000:
	ld ix,0e000h		;ac53
	ld b,008h		;ac57   ; 8 fichas...
	ld de,00008h		;ac59   ; ...de 8 bytes
ficha_e000:
	call pon_ficha_e000		;ac5c   ; pon_ficha_e000: la ficha de IX: activa (1), paso 0, la cuenta y su valor inicial (bytes 2-3) y el sitio (bytes 5-6) de HL
	add ix,de		;ac5f
	djnz ficha_e000		;ac61
	ret			;ac63
pon_ficha_e000:		; la ficha de IX: activa (1), paso 0, la cuenta y su valor inicial (bytes 2-3) y el sitio (bytes 5-6) de HL
	xor a			;ac64
	ld (ix+004h),a		;ac65   ; el dibujo 0...
	ld (ix+001h),a		;ac68   ; ...el paso 0...
	inc a			;ac6b
	ld (ix+000h),a		;ac6c   ; ...activa
	ld a,(hl)			;ac6f
	inc hl			;ac70
	ld (ix+002h),a		;ac71   ; la cuenta inicial...
	ld (ix+003h),a		;ac74   ; ...y la cuenta
	ld a,(hl)			;ac77
	inc hl			;ac78
	ld (ix+005h),a		;ac79   ; el sitio: X...
	ld a,(hl)			;ac7c
	ld (ix+006h),a		;ac7d   ; ...e Y
	inc hl			;ac80
	ret			;ac81

; ----------------------------------------------------------------------
; DATOS resto_AC82: lo apuntan con el banco puesto p06:AC35 (0xAC82); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p06:AC35 (9 bytes)
;   0xac82..0xac8b  (9 bytes)
DATA_resto_AC82:
	defb 006h,05ah,084h,002h,0a8h,08ch,001h,09ch,042h	; ac82  .Z......B

; ----------------------------------------------------------------------
; DATOS sin identificar  0xac8b..0xac95  (10 bytes)
DATA_AC8B:
	defb 009h,048h,030h,010h,030h,0b2h,004h,064h,018h,008h	; ac8b  .H0.0..d..

; ----------------------------------------------------------------------
; DATOS resto_AC95: lo apuntan con el banco puesto p06:AC3F (0xAC9A); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p06:AC3F (8 bytes)
;   0xac95..0xac9d  (8 bytes)
DATA_resto_AC95:
	defb 09ch,020h,00ch,070h,094h,006h,09ah,064h	; ac95  . .p...d

; ----------------------------------------------------------------------
; DATOS sin identificar  0xac9d..0xacca  (45 bytes)
DATA_AC9D:
	defb 002h,020h,088h,001h,068h,094h,009h,042h,062h,010h,0a4h,02ch,004h,096h,006h,008h	; ac9d  . ..h..Bb..,....
	defb 062h,02ah,00ch,04ch,06eh,006h,028h,052h,002h,030h,060h,001h,048h,090h,009h,030h	; acad  b*.Ln.(R.0`.H..0
	defb 076h,010h,088h,030h,004h,06ch,00ch,008h,0a0h,020h,00ch,018h,02ch	; acbd  v..0.l... ..,

; ----------------------------------------------------------------------
; DATOS resto_ACCA: lo apuntan con el banco puesto p06:AC4D (0xACCA); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p06:AC4D (10 bytes)
;   0xacca..0xacd4  (10 bytes)
DATA_resto_ACCA:
	defb 004h,038h,06ch,002h,048h,094h,006h,09ah,086h,007h	; acca  .8l.H.....

; ----------------------------------------------------------------------
; DATOS sin identificar  0xacd4..0xace2  (14 bytes)
DATA_ACD4:
	defb 098h,038h,003h,028h,050h,010h,028h,0b4h,008h,058h,032h,00ch,08ah,0b2h	; acd4  .8.(P.(..X2...

; ======================================================================
; CODIGO 0xace2..0xad5a  (120 bytes)
; ======================================================================


fichas_e000_cada_cuadro:		; en la zona 7, las fichas activas de 0xE000 (p06:AD01)
	ld a,(0ca4ah)		;ace2   ; lee la zona
	cp 007h		;ace5
	ret nz			;ace7   ; solo en la zona 7
	ld ix,0e000h		;ace8
	ld b,008h		;acec   ; 8 fichas
ficha_e000_activa:
	ld a,(ix+000h)		;acee
	or a			;acf1
	jr z,siguiente_e000		;acf2   ; libre: la siguiente
	push bc			;acf4
	call anima_ficha_e000		;acf5   ; la anima
	pop bc			;acf8
siguiente_e000:
	ld de,00008h		;acf9
	add ix,de		;acfc
	djnz ficha_e000_activa		;acfe
	ret			;ad00
anima_ficha_e000:		; en el paso 0, cada 2 cuadros el dibujo siguiente (byte 4) hasta el 5; al llegar, el dibujo 0, el paso 1 y la cuenta inicial; en el paso 1, al acabar la cuenta, otra vez el 0; cada dibujo 8 x 8 en la pagina desde (8, 0) o (0xD0 + dibujo * 8, 0x18)
	ld a,(ix+001h)		;ad01
	dec a			;ad04
	jr z,ficha_e000_paso_1		;ad05   ; el paso 1
	dec (ix+003h)		;ad07
	ret nz			;ad0a   ; cada tantos cuadros...
	inc (ix+004h)		;ad0b   ; ...el dibujo siguiente
	ld a,(ix+004h)		;ad0e
	cp 005h		;ad11
	jr c,espera_2		;ad13   ; hasta el 4...
	ld (ix+004h),000h		;ad15   ; ...al 5: el dibujo 0...
	inc (ix+001h)		;ad19   ; ...el paso 1...
	ld a,(ix+002h)		;ad1c   ; ...y la cuenta inicial
	ld (ix+003h),a		;ad1f
	jr dibujo_e000		;ad22
espera_2:
	ld (ix+003h),002h		;ad24   ; 2 cuadros por dibujo
dibujo_e000:
	ld a,(ix+004h)		;ad28
	ld e,(ix+005h)		;ad2b   ; DE = el sitio
	ld d,(ix+006h)		;ad2e
	ld hl,00800h		;ad31   ; el dibujo 0: desde (8, 0)
x_del_dibujo:
	rlca			;ad34   ; * 8
	rlca			;ad35
	rlca			;ad36
	or a			;ad37
	jr z,copia_dibujo_e000		;ad38
	add a,0d0h		;ad3a   ; los demas: (0xD0 + dibujo * 8, 0x18)
	ld h,a			;ad3c
	ld l,018h		;ad3d
copia_dibujo_e000:
	ld a,(0ca42h)		;ad3f   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	rlca			;ad42   ; la pagina de dibujo de destino...
	rlca			;ad43
	and 00ch		;ad44
	or 002h		;ad46   ; ...y la 2 de origen
	ld bc,00808h		;ad48   ; 8 x 8
	jp 04767h		;ad4b   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
ficha_e000_paso_1:		; al acabar la cuenta, cada 2 cuadros, el paso 0
	dec (ix+003h)		;ad4e
	ret nz			;ad51
	ld (ix+003h),002h		;ad52   ; otros 2 cuadros
	dec (ix+001h)		;ad56   ; al paso 0
	ret			;ad59

; ----------------------------------------------------------------------
; DATOS resto_AD5A (tramo): lo apuntan con el banco puesto p12:65B5 (0xAD5A);
;   el tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p12:65B5 (58 bytes)
;   0xad5a..0xad5c  (2 bytes)  de 0xad5a..0xad94 (58 bytes)
DATA_resto_AD5A:
	defb 05ch,0adh	; ad5a

; ======================================================================
; CODIGO 0xad5c..0xad92  (54 bytes)
; ======================================================================


error_del_disco:		; el gancho de DISKVE: el cartucho en 0x4000, p12:65C1, 0xC396 = 1 y, del codigo de error (C), el mensaje 0 (codigos 2-5 de C / 2), 3 o 4; y p06:AD99
	push bc			;ad5c
	ld a,(0c399h)		;ad5d   ; el slot del cartucho...
	ld h,040h		;ad60   ; ...en 0x4000
	call 00024h		;ad62   ; BIOS ENASLT - Switches to specified slot and page definitively
	call 065c1h		;ad65   ; ram_de_vuelta: deja correr el H.TIMI de la BIOS (p12:65C6) y cambia otra vez 0x9600 con 0xDD00
	ld a,001h		;ad68   ; 0xC396 = 1
	ld (0c396h),a		;ad6a
	ld a,(0c399h)		;ad6d   ; el cartucho otra vez en 0x4000
	ld h,040h		;ad70
	call 00024h		;ad72   ; BIOS ENASLT - Switches to specified slot and page definitively
	pop bc			;ad75   ; C = el codigo de error
	ld a,c			;ad76   ; el codigo de error / 2
	and 00eh		;ad77
	rrca			;ad79
	cp 002h		;ad7a
	jr c,error_0_1		;ad7c   ; 0 y 1...
	cp 006h		;ad7e
	jr c,error_0		;ad80   ; 2-5: el mensaje 0
	jr error_3		;ad82   ; 6 y 7: el 3
error_0_1:
	ld c,004h		;ad84   ; 0: el 4...
	rrca			;ad86
	jr nc,al_mensaje_de_error		;ad87   ; ...1: el 3
error_3:
	ld c,003h		;ad89
	jr al_mensaje_de_error		;ad8b
error_0:
	ld c,000h		;ad8d
al_mensaje_de_error:
	jp mensaje_de_error		;ad8f   ; mensaje_de_error: el mensaje C de p06:ADD7 (DISK I/O ERROR, FILE NOT FOUND, DISK FULL, NOT READY, WRITE PROTECTED...) y DISK ERROR; p12:65C6, 0xFD9A = 0xC394, 0xC3A1 = 2 y vuelta a la pila de 0xC392

; ----------------------------------------------------------------------
; DATOS resto_AD5A (tramo): lo apuntan con el banco puesto p12:65B5 (0xAD5A);
;   el tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p12:65B5 (58 bytes)
;   0xad92..0xad94  (2 bytes)  de 0xad5a..0xad94 (58 bytes)
DATA_resto_AD5A_AD92:
	defb 00eh,006h	; ad92

; ======================================================================
; CODIGO 0xad94..0xadbc  (40 bytes)
; ======================================================================


error_de_disco:		; p12:65C1 y el mensaje de error C; sale a la pila de 0xC392 con 0xC3A1 = 2
	push bc			;ad94
	call 065c1h		;ad95   ; ram_de_vuelta: deja correr el H.TIMI de la BIOS (p12:65C6) y cambia otra vez 0x9600 con 0xDD00
	pop bc			;ad98
mensaje_de_error:		; el mensaje C de p06:ADD7 (DISK I/O ERROR, FILE NOT FOUND, DISK FULL, NOT READY, WRITE PROTECTED...) y DISK ERROR; p12:65C6, 0xFD9A = 0xC394, 0xC3A1 = 2 y vuelta a la pila de 0xC392
	ld a,c			;ad99
	ld hl,0add7h		;ad9a   ; la tabla de mensajes
	call 043f6h		;ad9d   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	call 04918h		;ada0   ; el mensaje
	ld hl,0ade5h		;ada3   ; DISK ERROR
	call 04918h		;ada6   ; letrero_con_sitio: [fila][columna] y letras; 0xFE otra posicion, 0xFF acaba
	call 065c6h		;ada9   ; htimi_256: 256 veces el H.TIMI que habia al arrancar (copiado en 0xC39A)
	ld a,(0c394h)		;adac   ; 0xFD9A = 0xC394
	ld (0fd9ah),a		;adaf
	ld a,002h		;adb2   ; 0xC3A1 = 2
	ld (0c3a1h),a		;adb4   ; guarda el resultado del disco o del Game Master 2 (2 = error)
	ld sp,(0c392h)		;adb7   ; la pila guardada al empezar con el disco
	ret			;adbb   ; vuelve a quien guardo la pila

; ----------------------------------------------------------------------
; DATOS sin identificar  0xadbc..0xadd7  (27 bytes)
DATA_ADBC:
	defb 0beh,0adh,0cdh,0c1h,065h,03ah,099h,0c3h,026h,040h,0cdh,024h,000h,0cdh,0c6h,065h	; adbc  ....e:..&@.$...e	0xADBE y, detras, el codigo de p06:ADA9-ADBB tras p12:65C1 (sin llamada vista)
	defb 03ah,094h,0c3h,032h,09ah,0fdh,0edh,07bh,092h,0c3h,0c9h	; adcc  :..2...{...

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


cursor_de_3:		; 0xCA29 (0-2) con arriba y abajo (da la vuelta), el sonido 0x11 y el cursor; con un disparo, acarreo
	ld hl,0ca29h		;ae62
	ld a,(0ca07h)		;ae65   ; lee lo recien pulsado del mando (los bits de 0xCA08 que no estaban)
	ld b,a			;ae68   ; B = lo recien pulsado
	and 030h		;ae69   ; un disparo: acarreo
	scf			;ae6b
	ret nz			;ae6c
	ld a,b			;ae6d
	rra			;ae6e   ; abajo: uno mas...
	jr c,uno_menos_ca29		;ae6f   ; arriba
	rra			;ae71
	ret nc			;ae72   ; sin abajo, nada
	ld a,(hl)			;ae73
	inc a			;ae74
	cp 003h		;ae75   ; de 2 pasa a 0
	jr c,pon_ca29		;ae77
	xor a			;ae79
pon_ca29:
	ld (hl),a			;ae7a
	jr suena_y_cursor		;ae7b
uno_menos_ca29:		; arriba: uno menos
	ld a,(hl)			;ae7d
	dec a			;ae7e
	cp 0ffh		;ae7f   ; de 0 pasa a 2
	jr nz,L_AE85		;ae81
	ld a,002h		;ae83
L_AE85:
	ld (hl),a			;ae85
suena_y_cursor:
	call 05f49h		;ae86   ; sonido_11: pide el sonido 0x11
cursor_en_las_dos:		; el cursor en las dos paginas
	xor a			;ae89
	call cursor_en_pagina		;ae8a   ; en la pagina 0...
	ld a,001h		;ae8d   ; ...y en la 1
cursor_en_pagina:		; en la pagina A: borra 8 x 0x28 en (0x38, 0x60) y copia el cursor (8 x 8 de (0x50, 0x38)) a (0x38, 0x60 + 0xCA29 * 16)
	ld hl,03860h		;ae8f
	ld bc,00828h		;ae92   ; 8 x 0x28...
	push af			;ae95
	ld d,a			;ae96   ; ...en la pagina A...
	xor a			;ae97   ; ...al color 0
	call 046ffh		;ae98   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
	pop af			;ae9b
	push af			;ae9c
	ld a,(0ca29h)		;ae9d   ; 0xCA29 * 16...
	add a,a			;aea0
	add a,a			;aea1
	add a,a			;aea2
	add a,a			;aea3
	add a,060h		;aea4   ; ...+ 0x60: la Y del cursor
	ld e,a			;aea6
	ld d,038h		;aea7   ; la X: 0x38
	ld hl,05038h		;aea9   ; el cursor, de (0x50, 0x38)...
	ld bc,00808h		;aeac   ; ...8 x 8
	pop af			;aeaf
	rrca			;aeb0   ; la pagina A de destino...
	rrca			;aeb1
	rrca			;aeb2
	rrca			;aeb3
	or 0c8h		;aeb4   ; ...con la operacion 0xC8
	call 047edh		;aeb6   ; copia_rectangulo_logica: orden LMMM del VDP con la operacion logica de A
	or a			;aeb9   ; sin acarreo
	ret			;aeba
sitios_de_la_sala:		; 0xCBE0 a cero y los sitios de esta sala de la lista de la zona (p06:BB13; fichas [sala][numero][Y][X], 0xFF acaba) en los huecos de 0xCBE0
	ld hl,0cbe0h		;aebb   ; apunta a 8 sitios de 4 bytes [numero][Y][X][...] en los que se entra yendo hacia arriba
	ld bc,0001fh		;aebe   ; 0x20 bytes
	call 04236h		;aec1   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	ld hl,0bb13h		;aec4   ; la lista de la zona
	ld a,(0ca4ah)		;aec7   ; lee la zona
	call 043f6h		;aeca   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld a,(0ca4bh)		;aecd   ; lee la sala de la zona
	ld c,a			;aed0   ; C = la sala
sitio_de_bb13:
	ld a,(hl)			;aed1
	ld b,a			;aed2
	inc b			;aed3
	ret z			;aed4   ; 0xFF: se acaba
	cp c			;aed5   ; la sala del sitio
	inc hl			;aed6
	push hl			;aed7
	push bc			;aed8
	call z,pon_sitio		;aed9   ; la de ahora: a 0xCBE0
	pop bc			;aedc
	pop hl			;aedd
	inc hl			;aede   ; la ficha siguiente (4 bytes)
	inc hl			;aedf
	inc hl			;aee0
	jr sitio_de_bb13		;aee1
pon_sitio:		; C, D y E en el primer hueco de 0xCBE0
	ld c,(hl)			;aee3   ; C = el numero...
	inc hl			;aee4
	ld d,(hl)			;aee5   ; ...D la Y...
	inc hl			;aee6
	ld e,(hl)			;aee7   ; ...E la X
	ld hl,0cbe0h		;aee8   ; apunta a 8 sitios de 4 bytes [numero][Y][X][...] en los que se entra yendo hacia arriba
	ld b,008h		;aeeb   ; 8 huecos
hueco_cbe0:
	ld a,(hl)			;aeed
	and a			;aeee
	jr z,en_el_hueco		;aeef   ; libre: aqui
	ld a,004h		;aef1   ; el siguiente (4 bytes)
	call 0423eh		;aef3   ; suma_a_hl: HL = HL + A
	djnz hueco_cbe0		;aef6
	ret			;aef8   ; todos ocupados: nada
en_el_hueco:
	ld (hl),c			;aef9   ; el numero...
	inc l			;aefa
	ld (hl),d			;aefb   ; ...la Y...
	inc l			;aefc
	ld (hl),e			;aefd   ; ...y la X
	ret			;aefe
tras_la_conversacion:		; lo que deja hecho la conversacion A (p06:AF02; desde p09:BE53): banderas de 0xD7D0-0xD7E3, sonidos...
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
	defw 0b060h,0afcfh,0af54h,06b55h	; af42  -> conversacion_32 conversacion_33 nada_conversacion 0x6b55

; ======================================================================
; CODIGO 0xaf4a..0xb09d  (339 bytes)
; ======================================================================


conversacion_0:		; el bit 6 de 0xD7D0 y fuera el 1 de 0xD7DD
	ld hl,0d7d0h		;af4a   ; apunta a las banderas de la partida: la n en el bit 7 - n % 8 del byte n / 8 (p03:B0DC, p03:B0F6)
	set 6,(hl)		;af4d
	ld hl,0d7ddh		;af4f
	res 1,(hl)		;af52
nada_conversacion:
	ret			;af54
conversacion_1:		; el bit 1 de 0xD7D0 y fuera el 5 de 0xD7DD
	ld hl,0d7d0h		;af55   ; apunta a las banderas de la partida: la n en el bit 7 - n % 8 del byte n / 8 (p03:B0DC, p03:B0F6)
	set 1,(hl)		;af58
	ld hl,0d7ddh		;af5a
	res 5,(hl)		;af5d
	ret			;af5f
conversacion_2:		; el bit 1 de 0xD7D1, 0xCADE = 0, 0xCB7D = 1 y los sonidos 5 y 0x9C
	ld hl,0d7d1h		;af60
	set 1,(hl)		;af63
	ld hl,0cadeh		;af65   ; 0xCADE = 0
	ld (hl),000h		;af68
	ld hl,0cb7dh		;af6a   ; 0xCB7D = 1
	ld (hl),001h		;af6d
	call 06b12h		;af6f   ; el sonido 5...
	jp 06bach		;af72   ; ...y el 0x9C
conversacion_3:		; fuera el bit 5 de 0xD7D2 y el 0 de 0xD7E3
	ld hl,0d7d2h		;af75
	res 5,(hl)		;af78
	ld hl,0d7e3h		;af7a
	set 0,(hl)		;af7d
	ret			;af7f
conversacion_4:		; fuera el bit 6 de 0xD7D3, el 5 de 0xD7E3, 0xCB7D = 1 y el sonido 0x81
	ld hl,0d7d3h		;af80
	res 6,(hl)		;af83
	ld hl,0d7e3h		;af85
	set 5,(hl)		;af88
	ld hl,0cb7dh		;af8a   ; 0xCB7D = 1
	ld (hl),001h		;af8d
	jp 06b95h		;af8f   ; sonido_81: pide el sonido 0x81 (de los que tienen la partitura en un banco de musica, p16:4CE3)
conversacion_5:		; el bit 5 de 0xD7D4 y fuera el 6 de 0xD7DE
	ld hl,0d7d4h		;af92
	set 5,(hl)		;af95
	ld hl,0d7deh		;af97
	res 6,(hl)		;af9a
	ret			;af9c
conversacion_6:		; el bit 4 de 0xD7D4, la fase 4 y 0xD4E3 = 0
	ld hl,0d7d4h		;af9d
	set 4,(hl)		;afa0
	ld a,004h		;afa2   ; la fase 4
	ld (0ca22h),a		;afa4   ; guarda la fase de la partida (indice de las listas de p06:B40C)
	xor a			;afa7
	ld (0d4e3h),a		;afa8   ; 0xD4E3 = 0
	ret			;afab
conversacion_7:		; el bit 0 de 0xD7D8 y fuera el 2 de 0xD7DE
	ld hl,0d7d8h		;afac
	set 0,(hl)		;afaf
	ld hl,0d7deh		;afb1
	res 2,(hl)		;afb4
	ret			;afb6
conversacion_8:		; el bit 7 de 0xD7D9
	ld hl,0d7d9h		;afb7
	set 7,(hl)		;afba
	ret			;afbc
conversacion_9:		; fuera el bit 4 de 0xD7DB
	ld hl,0d7dbh		;afbd
	res 4,(hl)		;afc0
	ret			;afc2
conversacion_10:		; fuera el bit 2 de 0xD7DB
	ld hl,0d7dbh		;afc3
	res 2,(hl)		;afc6
	ret			;afc8
conversacion_11:		; fuera el bit 7 de 0xD7DC
	ld hl,0d7dch		;afc9
	res 7,(hl)		;afcc
	ret			;afce
conversacion_33:		; fuera el bit 6 de 0xD7DC
	ld hl,0d7dch		;afcf
	res 6,(hl)		;afd2
	ret			;afd4
conversacion_12:		; fuera el bit 4 de 0xD7DC y el 6 de 0xD7E2
	ld hl,0d7dch		;afd5
	res 4,(hl)		;afd8
	ld hl,0d7e2h		;afda
	res 6,(hl)		;afdd
	ret			;afdf
conversacion_13:		; fuera el bit 3 de 0xD7DC
	ld hl,0d7dch		;afe0
	res 3,(hl)		;afe3
	ret			;afe5
conversacion_14:		; fuera el bit 2 de 0xD7DC
	ld hl,0d7dch		;afe6
	res 2,(hl)		;afe9
	ret			;afeb
conversacion_15:		; fuera el bit 1 de 0xD7DC, el bit 3 de 0xD7E4 y 0xD7A0 = 0x66
	ld hl,0d7dch		;afec
	res 1,(hl)		;afef
	ld hl,0d7e4h		;aff1
	set 3,(hl)		;aff4
	ld hl,0d7a0h		;aff6   ; 0xD7A0 = 0x66
	ld (hl),066h		;aff9
	ret			;affb
conversacion_16:		; fuera el bit 7 de 0xD7DD
	ld hl,0d7ddh		;affc
	res 7,(hl)		;afff
	ret			;b001
conversacion_17:		; fuera el bit 6 de 0xD7DD
	ld hl,0d7ddh		;b002
	res 6,(hl)		;b005
	ret			;b007
conversacion_18:		; fuera el bit 4 de 0xD7DD
	ld hl,0d7ddh		;b008
	res 4,(hl)		;b00b
	ret			;b00d
conversacion_19:		; fuera el bit 7 de 0xD7DE
	ld hl,0d7deh		;b00e
	res 7,(hl)		;b011
	ret			;b013
conversacion_20:		; fuera el bit 5 de 0xD7DE
	ld hl,0d7deh		;b014
	res 5,(hl)		;b017
	ret			;b019
conversacion_21:		; fuera el bit 1 de 0xD7DE
	ld hl,0d7deh		;b01a
	res 1,(hl)		;b01d
	ret			;b01f
conversacion_22:		; el bit 2 de 0xD7DF y fuera el 1
	ld hl,0d7dfh		;b020
	set 2,(hl)		;b023
	res 1,(hl)		;b025
	ret			;b027
conversacion_23:		; fuera el bit 0 de 0xD7DF y el bit 7 de 0xD7E0
	ld hl,0d7dfh		;b028
	res 0,(hl)		;b02b
	inc hl			;b02d   ; el byte siguiente, 0xD7E0
	set 7,(hl)		;b02e
	ret			;b030
conversacion_24:		; fuera el bit 0 de 0xD7E1
	ld hl,0d7e1h		;b031
	res 0,(hl)		;b034
	ret			;b036
conversacion_25:		; fuera el bit 7 de 0xD7E2
	ld hl,0d7e2h		;b037
	res 7,(hl)		;b03a
	ret			;b03c
conversacion_26:		; el bit 3 de 0xD7E3
	ld hl,0d7e3h		;b03d
	set 3,(hl)		;b040
	ret			;b042
conversacion_27:		; 0xCAAC = 1 y 0xCABA = 0
	ld hl,0caach		;b043
	ld (hl),001h		;b046   ; 0xCAAC = 1
	ld hl,0cabah		;b048
	ld (hl),000h		;b04b   ; 0xCABA = 0
	ret			;b04d
conversacion_29:		; el bit 7 de 0xD7D4
	ld hl,0d7d4h		;b04e
	set 7,(hl)		;b051
	ret			;b053
conversacion_30:		; el bit 5 de 0xD7E4 y 0xD7A1 = 0x99
	ld hl,0d7e4h		;b054
	set 5,(hl)		;b057
	ld hl,0d7a1h		;b059   ; 0xD7A1 = 0x99
	ld (hl),099h		;b05c
	ret			;b05e
conversacion_31:
	ret			;b05f
conversacion_32:		; 0xCAAC = 0
	ld hl,0caach		;b060
	ld (hl),000h		;b063   ; 0xCAAC = 0
	ret			;b065
pantalla_5_limpia:		; 0xC000, el sonido 1, SCREEN 5, las 4 paginas a 0, los 8 registros del VDP de p06:B09D y los sprites apagados
	call 0c000h		;b066   ; la rutina de 0xC000
	call 06a0dh		;b069   ; sonido_01: pide el sonido 0x01
	ld a,005h		;b06c   ; SCREEN 5
	call 0005fh		;b06e   ; BIOS CHGMOD - Switches to given screen mode
	ld d,000h		;b071   ; la pagina 0 a cero...
	call 04be4h		;b073   ; borra_toda_la_pagina: p00:46FF desde (0,0) con BC = 0 y A = 0 en la pagina D
	ld d,001h		;b076   ; ...la 1...
	call 04be4h		;b078   ; borra_toda_la_pagina: p00:46FF desde (0,0) con BC = 0 y A = 0 en la pagina D
	ld d,002h		;b07b   ; ...la 2...
	call 04be4h		;b07d   ; borra_toda_la_pagina: p00:46FF desde (0,0) con BC = 0 y A = 0 en la pagina D
	ld d,003h		;b080   ; ...y la 3
	call 04be4h		;b082   ; borra_toda_la_pagina: p00:46FF desde (0,0) con BC = 0 y A = 0 en la pagina D
	call 04650h		;b085   ; hasta que acabe el VDP
	ld b,008h		;b088   ; 8 registros...
	ld hl,0b09dh		;b08a   ; ...de p06:B09D: [registro][valor]
registro_b09d:
	push bc			;b08d
	ld c,(hl)			;b08e   ; C = el registro...
	inc hl			;b08f
	ld b,(hl)			;b090   ; ...B = el valor
	inc hl			;b091
	push hl			;b092
	call 00047h		;b093   ; BIOS WRTVDP - Writes data in the VDP-register
	pop hl			;b096
	pop bc			;b097
	djnz registro_b09d		;b098
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
	jr L_B0C1		;b0bc   ; lo recien pulsado a 0xCA09
guarda_mando:		; (0xCA08) = A y (0xCA07) = lo que no estaba pulsado
	ld hl,0ca08h		;b0be   ; apunta a el mando: joystick y teclado juntos (bits 0-3 las direcciones, 4-5 los disparos)
L_B0C1:
	ld c,(hl)			;b0c1   ; C = lo de antes...
	ld (hl),a			;b0c2   ; ...lo de ahora en su sitio...
	xor c			;b0c3   ; ...y lo que no estaba...
	and (hl)			;b0c4
	dec hl			;b0c5
	ld (hl),a			;b0c6   ; ...en el byte de antes
	ret			;b0c7
mando:		; A = el joystick 1 y el teclado juntos (bits 0-3 direcciones, 4-5 disparos)
	ld e,08fh		;b0c8   ; el registro 15 del PSG a 0x8F: lee el puerto del joystick 1
	ld a,00fh		;b0ca
	call 00093h		;b0cc   ; BIOS WRTPSG - Writes data to PSG-register
	ld a,00eh		;b0cf   ; el registro 14...
	di			;b0d1
	call 00096h		;b0d2   ; BIOS RDPSG - Reads value from PSG-register
	ei			;b0d5
	cpl			;b0d6   ; ...a uno lo pulsado...
	and 03fh		;b0d7   ; ...las direcciones y los dos botones
	push af			;b0d9
	ld a,004h		;b0da   ; la fila 4 del teclado (M y N)
	call 00141h		;b0dc   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;b0df
	rlca			;b0e0
	rlca			;b0e1
	ld b,a			;b0e2
	rlca			;b0e3   ; la M...
	and 020h		;b0e4
	ld e,a			;b0e6
	ld a,b			;b0e7   ; ...o la N: el disparo 2 (bit 5)
	and 020h		;b0e8
	or e			;b0ea
	ld e,a			;b0eb
	ld a,008h		;b0ec   ; la fila 8 (cursores y espacio)
	call 00141h		;b0ee   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;b0f1
	rrca			;b0f2
	rrca			;b0f3
	ld b,a			;b0f4
	and 004h		;b0f5   ; la izquierda al bit 2
	or e			;b0f7
	ld c,a			;b0f8
	ld a,b			;b0f9
	rrca			;b0fa
	rrca			;b0fb
	ld b,a			;b0fc
	and 018h		;b0fd   ; la derecha al bit 3 y el espacio al 4 (disparo 1)
	or c			;b0ff
	ld c,a			;b100
	ld a,b			;b101
	rrca			;b102
	and 003h		;b103   ; arriba al bit 0 y abajo al 1
	or c			;b105
	pop bc			;b106   ; con el joystick
	or b			;b107
	ret			;b108
teclas_de_funcion:		; A = las filas 6 y 7 de la matriz, en 6 bits
	ld a,006h		;b109   ; la fila 6: F1, F2 y F3 en los bits 5-7
	call 00141h		;b10b   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;b10e
	and 0e0h		;b10f   ; F1-F3
	ld e,a			;b111
	ld a,007h		;b112   ; la fila 7: F4, F5 y RETURN
	call 00141h		;b114   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;b117
	ld b,a			;b118
	and 003h		;b119   ; F4 y F5 en los bits 0-1
	or e			;b11b
	rlca			;b11c   ; F1-F3 a los bits 0-2 y F4-F5 a los 3-4
	rlca			;b11d
	rlca			;b11e
	ld e,a			;b11f
	ld a,b			;b120
	and 080h		;b121   ; RETURN (bit 7)...
	rrca			;b123
	rrca			;b124
	or e			;b125   ; ...al bit 5
	and 03fh		;b126
	ret			;b128
matriz_del_teclado:		; en el estado (5, 8): las filas 0-5 a 0xC7D0 y lo recien pulsado a 0xC7E0
	ld hl,(0ca00h)		;b129   ; lee el estado de la partida (p01:729F: 8 estados) y el byte siguiente (16 bits)
	ld de,00805h		;b12c   ; solo en el estado 5, paso 8
	call 00020h		;b12f   ; BIOS DCOMPR - Compares HL with DE
	ret nz			;b132
	ld hl,0c7d0h		;b133   ; apunta a las 6 primeras filas de la matriz del teclado (en el estado 5, paso 8)
	ld de,0c7e0h		;b136   ; apunta a lo recien pulsado de esas 6 filas
	ld b,006h		;b139   ; las filas 0-5
L_B13B:
	ld a,b			;b13b
	sub 006h		;b13c   ; la fila 6 - B
	neg		;b13e
	call 00141h		;b140   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;b143   ; a uno lo pulsado
	ld c,(hl)			;b144   ; lo de antes...
	ld (hl),a			;b145   ; ...lo de ahora...
	xor c			;b146   ; ...y lo recien pulsado
	and (hl)			;b147
	ld (de),a			;b148
	inc hl			;b149
	inc de			;b14a
	djnz L_B13B		;b14b
	ret			;b14d
fin_de_ficha_d800:		; lo que deja hecho la ficha de 0xD800 (IX) al acabar, segun su tipo (p06:B155; tras p04:8C59): banderas de la partida y la fase
	ld a,(ix+000h)		;b14e
	dec a			;b151   ; desde el tipo 1
	call 0424dh		;b152   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_B155: 11 destinos del despachador p00:424D (call en p06:B152, el
;   indice en A): B16B, B180, B186, B191, B19C, B1A2, B1A8, B1AE, B1B9, B1BF,
;   B1CA; lo leen p06:B152 (22 bytes)
;   0xb155..0xb16b  (22 bytes)
DATA_tabla_B155:
	defw 0b16bh,0b180h,0b186h,0b191h,0b19ch,0b1a2h,0b1a8h,0b1aeh	; b155
	defw 0b1b9h,0b1bfh,0b1cah	; b165  -> fin_d800_tipo_9 fin_d800_tipo_0a fin_d800_tipo_0b

; ======================================================================
; CODIGO 0xb16b..0xb2ce  (355 bytes)
; ======================================================================


fin_d800_tipo_1:		; el bit 6 de 0xD7F1, fuera el 2 de 0xD7D2, el bit 7 de 0xD7E4 y la fase 3
	ld hl,0d7f1h		;b16b
	set 6,(hl)		;b16e
	ld hl,0d7d2h		;b170
	res 2,(hl)		;b173
	ld hl,0d7e4h		;b175
	set 7,(hl)		;b178
	ld a,003h		;b17a   ; la fase 3
	ld (0ca22h),a		;b17c   ; guarda la fase de la partida (indice de las listas de p06:B40C)
	ret			;b17f
fin_d800_tipo_2:		; el bit 3 de 0xD7D9
	ld hl,0d7d9h		;b180
	set 3,(hl)		;b183
	ret			;b185
fin_d800_tipo_3:		; fuera el bit 6 de 0xD7D1 y la fase 1
	ld hl,0d7d1h		;b186
	res 6,(hl)		;b189
	ld a,001h		;b18b   ; la fase 1
	ld (0ca22h),a		;b18d   ; guarda la fase de la partida (indice de las listas de p06:B40C)
	ret			;b190
fin_d800_tipo_4:		; fuera el bit 7 de 0xD7D2 y la fase 2
	ld hl,0d7d2h		;b191
	res 7,(hl)		;b194
	ld a,002h		;b196   ; la fase 2
	ld (0ca22h),a		;b198   ; guarda la fase de la partida (indice de las listas de p06:B40C)
	ret			;b19b
fin_d800_tipo_5:		; fuera el bit 0 de 0xD7D7
	ld hl,0d7d7h		;b19c
	res 0,(hl)		;b19f
	ret			;b1a1
fin_d800_tipo_6:		; fuera el bit 3 de 0xD7D3
	ld hl,0d7d3h		;b1a2
	res 3,(hl)		;b1a5
	ret			;b1a7
fin_d800_tipo_7:		; fuera el bit 0 de 0xD7D6
	ld hl,0d7d6h		;b1a8
	res 0,(hl)		;b1ab
	ret			;b1ad
fin_d800_tipo_8:		; el bit 2 de 0xD7D8 y la fase 9
	ld hl,0d7d8h		;b1ae
	set 2,(hl)		;b1b1
	ld a,009h		;b1b3   ; la fase 9
	ld (0ca22h),a		;b1b5   ; guarda la fase de la partida (indice de las listas de p06:B40C)
	ret			;b1b8
fin_d800_tipo_9:		; fuera el bit 0 de 0xD7D9
	ld hl,0d7d9h		;b1b9
	res 0,(hl)		;b1bc
	ret			;b1be
fin_d800_tipo_0a:		; el bit 4 de 0xD7DA y fuera el 5 de 0xD7DF
	ld hl,0d7dah		;b1bf
	set 4,(hl)		;b1c2
	ld hl,0d7dfh		;b1c4
	res 5,(hl)		;b1c7
	ret			;b1c9
fin_d800_tipo_0b:		; fuera el bit 4 de 0xD7D6, el bit 5 de 0xD7E2 y la fase 6
	ld hl,0d7d6h		;b1ca
	res 4,(hl)		;b1cd
	ld hl,0d7e2h		;b1cf
	set 5,(hl)		;b1d2
	ld a,006h		;b1d4   ; la fase 6
	ld (0ca22h),a		;b1d6   ; guarda la fase de la partida (indice de las listas de p06:B40C)
	ret			;b1d9
d860_tipo_4:		; en la zona 7, con 0xD883 distinto de 0xFF, fuera de la sala especial 0x29, la ficha 0xD860 libre y el bit 1 de 0xD7D1: la ficha 0xD860 de tipo 4
	ld a,(0ca4ah)		;b1da   ; lee la zona
	cp 007h		;b1dd
	ret nz			;b1df   ; solo en la zona 7
	ld a,(0d883h)		;b1e0
	inc a			;b1e3
	ret z			;b1e4   ; con 0xD883 a 0xFF, nada
	ld a,(0ca76h)		;b1e5   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 029h		;b1e8
	ret z			;b1ea   ; en la sala especial 0x29, nada
	ld hl,0d860h		;b1eb   ; la ficha 0xD860...
	ld a,(hl)			;b1ee
	and a			;b1ef
	ret nz			;b1f0   ; ...ocupada: nada
	ld a,(0d7d1h)		;b1f1
	and 002h		;b1f4
	ret z			;b1f6   ; sin el bit 1 de 0xD7D1, nada
	ld a,004h		;b1f7   ; de tipo 4
	ld (0d860h),a		;b1f9
	ret			;b1fc
pagina_0_a_la_1:		; la pagina 0 entera (256 x 0xC0) a la 1, borra 0x40 x 0x14 en (0xC0, 0xC0) de la 1 y, con 0xD501 < 2, 6 caracteres de 8 x 8 de (0xE8, 0x38) de la pagina 2 a (0x48, 0xB8) de la 1
	ld h,000h		;b1fd   ; de (0, 0)...
	ld l,h			;b1ff
	ld d,h			;b200   ; ...a (0, 0)...
	ld e,h			;b201
	ld bc,000c0h		;b202   ; ...256 x 0xC0...
	ld a,004h		;b205   ; ...de la pagina 0 a la 1
	call 04767h		;b207   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
	ld hl,0c0c0h		;b20a   ; en (0xC0, 0xC0)...
	ld bc,04014h		;b20d   ; ...0x40 x 0x14...
	ld d,001h		;b210   ; ...de la pagina 1...
	xor a			;b212   ; ...al color 0
	call 046ffh		;b213   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
	ld a,(0d501h)		;b216
	cp 002h		;b219
	ret nc			;b21b   ; desde 2 en 0xD501, nada mas
	ld hl,0e838h		;b21c   ; de (0xE8, 0x38)...
	ld de,048b8h		;b21f   ; ...a (0x48, 0xB8)...
	ld b,006h		;b222   ; ...6 caracteres
caracter_de_e838:
	push bc			;b224
	ld bc,00808h		;b225   ; 8 x 8...
	ld a,006h		;b228   ; ...de la pagina 2 a la 1
	push hl			;b22a
	push de			;b22b
	call 04767h		;b22c   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
	pop de			;b22f
	pop hl			;b230
	ld a,d			;b231   ; 8 a la derecha
	add a,008h		;b232
	ld d,a			;b234
	pop bc			;b235
	djnz caracter_de_e838		;b236
	ret			;b238
bordes_b3_c8:		; la pagina 0 a cero y dos columnas de 0x20 caracteres de la sala: el 0xB3 en X = 0 y el 0xC8 en X = 0xB8
	call 045b9h		;b239   ; borra_pagina_0: la pagina 0 a cero y R#23 = 0
	ld c,0b3h		;b23c   ; el caracter 0xB3...
	ld de,00000h		;b23e   ; ...en X = 0
	call columna_de_caracteres		;b241   ; columna_de_caracteres: 0x20 veces el caracter C, de 8 en 8 hacia abajo
	ld c,0c8h		;b244   ; el 0xC8...
	ld de,0b800h		;b246   ; ...en X = 0xB8
columna_de_caracteres:		; 0x20 veces el caracter C, de 8 en 8 hacia abajo
	ld b,020h		;b249   ; 0x20 caracteres
caracter_de_columna:
	ld a,c			;b24b
	call 04a0bh		;b24c   ; el caracter C de la sala a la otra pagina
	ld a,e			;b24f   ; 8 mas abajo
	add a,008h		;b250
	ld e,a			;b252
	djnz caracter_de_columna		;b253
	ret			;b255
avanza_hasta_choque_en:		; p06:B267 con la Y (L) entre 8 y 0xB7
	call avanza_hasta_choque		;b256   ; avanza_hasta_choque: (H, L) avanza de 2 en 2 en la direccion A (p06:B2CE: X - 2, X + 2, Y - 2, Y + 2) mientras no choca (p04:90CE), no sale de X 0x20-0xB7 ni Y 8-0xB6 y no pasa del sitio de 0xD41C
	ld a,l			;b259   ; la Y...
	cp 008h		;b25a
	jr c,y_minima		;b25c   ; ...por debajo de 8: 8
	cp 0b7h		;b25e   ; ...desde 0xB7: 0xB7
	ret c			;b260
	ld l,0b7h		;b261
	ret			;b263
y_minima:
	ld l,008h		;b264
	ret			;b266
avanza_hasta_choque:		; (H, L) avanza de 2 en 2 en la direccion A (p06:B2CE: X - 2, X + 2, Y - 2, Y + 2) mientras no choca (p04:90CE), no sale de X 0x20-0xB7 ni Y 8-0xB6 y no pasa del sitio de 0xD41C
	ld hl,0b2ceh		;b267
	call 043f6h		;b26a   ; D, E = el paso
	ex de,hl			;b26d   ; BC = el sitio al que acuden
	ld bc,(0d41ch)		;b26e   ; lee la Y y la X a las que acuden los actores (16 bits)
paso_de_2:		; en X...
	ld a,d			;b272
	and a			;b273   ; sin paso en X: en Y
	jr z,paso_en_y		;b274
	call choques_de_hl		;b276   ; los choques de (H, L)
	push bc			;b279
	bit 7,d		;b27a   ; hacia la izquierda, el bit 1...
	ld b,002h		;b27c   ; ...hacia la derecha, el 2
	jr z,choque_en_x		;b27e
	ld b,001h		;b280
choque_en_x:
	and b			;b282
	pop bc			;b283
	ret nz			;b284   ; choca: ya esta
	ld a,h			;b285   ; ...dentro de X 0x20-0xB7...
	sub 020h		;b286   ; fuera de X 0x20-0xB7: ya esta
	cp 098h		;b288
	ret nc			;b28a
	ld a,e			;b28b   ; ...sin pasar de la X de 0xD41C
	rla			;b28c   ; hacia la derecha...
	ld a,c			;b28d
	jr c,hacia_la_izquierda		;b28e
	cp h			;b290   ; ...por debajo de la X de 0xD41C, sigue
	ret c			;b291
	jr suma_x		;b292
hacia_la_izquierda:
	cp h			;b294   ; hacia la izquierda, por encima
	ret nc			;b295
suma_x:
	ld a,h			;b296
	add a,d			;b297   ; un paso en X
	ld h,a			;b298
	jr paso_de_2		;b299
paso_en_y:		; en Y, igual con los bits 8 y 4, Y 8-0xB6 y la Y de 0xD41C
	call choques_de_hl		;b29b   ; los choques de (H, L)
	push bc			;b29e
	bit 7,e		;b29f   ; hacia arriba, el bit 3...
	ld b,008h		;b2a1   ; ...hacia abajo, el 4
	jr z,choque_en_y		;b2a3
	ld b,004h		;b2a5
choque_en_y:
	and b			;b2a7
	pop bc			;b2a8
	ret nz			;b2a9   ; choca: ya esta
	ld a,l			;b2aa
	sub 008h		;b2ab   ; fuera de Y 8-0xB6: ya esta
	cp 0afh		;b2ad
	ret nc			;b2af
	ld a,e			;b2b0
	rla			;b2b1   ; hacia abajo...
	ld a,b			;b2b2
	jr c,hacia_arriba		;b2b3
	cp l			;b2b5   ; ...por debajo de la Y de 0xD41C, sigue
	ret c			;b2b6
	jr suma_y		;b2b7
hacia_arriba:
	cp l			;b2b9   ; hacia arriba, por encima
	ret nc			;b2ba
suma_y:
	ld a,l			;b2bb
	add a,e			;b2bc   ; un paso en Y
	ld l,a			;b2bd
	jr paso_de_2		;b2be
choques_de_hl:		; A = los choques en (H, L) (p04:90CE con H y L cambiados), sin tocar los registros
	push hl			;b2c0
	push de			;b2c1
	push bc			;b2c2
	ld a,h			;b2c3   ; H y L cambiados...
	ld h,l			;b2c4
	ld l,a			;b2c5
	call 090ceh		;b2c6   ; ...los choques
	ld a,c			;b2c9   ; en A
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


seis_lanzados_1:		; 0xD460-0xD4BF a cero, 0xD445 = 1, las 6 fichas de tipo 1 con los bytes 2-4 de p06:B30B y los colores de 0xDAA0 de las rachas de p06:B3B0
	ld hl,0d460h		;b2d6   ; apunta a 6 fichas de 16 bytes de lo que lanzan los actores (p04:9B55)
	ld bc,0005fh		;b2d9   ; 0x60 bytes
	call 04236h		;b2dc   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	ld a,001h		;b2df   ; 0xD445 = 1: lo lanzado no se mueve como siempre
	ld (0d445h),a		;b2e1   ; guarda 1 mientras las 6 fichas de 0xD460 son las de p06:B2D6 (sin choques, p07:AD5C)
	ld de,0d460h		;b2e4   ; apunta a 6 fichas de 16 bytes de lo que lanzan los actores (p04:9B55)
	ld hl,0b30bh		;b2e7   ; los sitios de p06:B30B
	ld b,006h		;b2ea   ; 6 fichas
ficha_lanzado_1:
	push de			;b2ec
	push bc			;b2ed
	ld a,001h		;b2ee   ; el tipo 1
	ld (de),a			;b2f0
	inc de			;b2f1   ; los bytes 2-4 de la tabla
	inc de			;b2f2
	ldi		;b2f3
	ldi		;b2f5
	ldi		;b2f7
	pop bc			;b2f9
	pop de			;b2fa
	ld a,010h		;b2fb   ; la ficha siguiente
	call 04243h		;b2fd   ; suma_a_de: DE = DE + A
	djnz ficha_lanzado_1		;b300
	ld hl,0daa0h		;b302   ; los colores de 0xDAA0...
	ld de,0b3b0h		;b305   ; ...de las rachas de p06:B3B0
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


seis_lanzados_1_cada_cuadro:		; con alguna de las 6 fichas de 0xD460 activa, sus cuentas y sprites (p06:B33B) y acarreo; si no, 0xD445 = 0 y NC
	call alguna_d460		;b31d   ; alguna_d460: acarreo si alguna ficha de 0xD460 esta activa; si no, 0xD445 = 0
	ret nc			;b320   ; ninguna activa: NC
	call lanzados_1_activos		;b321   ; sus cuentas y sprites
acarreo_b324:
	scf			;b324
	ret			;b325
alguna_d460:		; acarreo si alguna ficha de 0xD460 esta activa; si no, 0xD445 = 0
	ld hl,0d460h		;b326   ; apunta a 6 fichas de 16 bytes de lo que lanzan los actores (p04:9B55)
	ld b,006h		;b329   ; 6 fichas
mira_ficha_d460:
	ld a,(hl)			;b32b
	and a			;b32c
	jr nz,acarreo_b324		;b32d   ; activa: acarreo
	ld a,010h		;b32f   ; la siguiente
	call 0423eh		;b331   ; suma_a_hl: HL = HL + A
	djnz mira_ficha_d460		;b334
	xor a			;b336
	ld (0d445h),a		;b337   ; 0xD445 = 0
	ret			;b33a
lanzados_1_activos:		; cada ficha activa de 0xD460 (C = su numero): su cuenta (p06:B357) y sus dos sprites (p06:B37E)
	ld ix,0d460h		;b33b   ; apunta a 6 fichas de 16 bytes de lo que lanzan los actores (p04:9B55)
	ld bc,00600h		;b33f   ; B = 6, C = 0
ficha_d460:
	ld a,(ix+000h)		;b342   ; lee el tipo de lo lanzado
	and a			;b345
	jr z,siguiente_d460		;b346   ; libre: la siguiente
	call cuenta_de_lanzado_1		;b348   ; cuenta_de_lanzado_1: un cuadro menos al byte 4 (a 0, se acaba) y el byte 3 sumado al 1; la primera ficha, con la cuenta en 4, el sonido 0x54
	call sprites_de_lanzado_1		;b34b   ; sprites_de_lanzado_1: los sprites 2C y 2C + 1 desde el 10 (0xDC28 + C * 8): en (byte 1, byte 2) con el patron de p06:B3AA y ese + 4
siguiente_d460:
	ld de,00010h		;b34e   ; la siguiente (16 bytes)
	add ix,de		;b351
	inc c			;b353   ; su numero
	djnz ficha_d460		;b354
	ret			;b356
cuenta_de_lanzado_1:		; un cuadro menos al byte 4 (a 0, se acaba) y el byte 3 sumado al 1; la primera ficha, con la cuenta en 4, el sonido 0x54
	push ix		;b357   ; HL = la ficha
	pop hl			;b359
	ld de,0d460h		;b35a   ; apunta a 6 fichas de 16 bytes de lo que lanzan los actores (p04:9B55)
	call 00020h		;b35d   ; BIOS DCOMPR - Compares HL with DE
	jr nz,baja_la_cuenta		;b360   ; solo la primera...
	ld a,(ix+004h)		;b362
	cp 004h		;b365   ; ...con la cuenta en 4...
	call z,06c6fh		;b367   ; ...el sonido 0x54
baja_la_cuenta:
	dec (ix+004h)		;b36a
	jr z,se_acaba_d460		;b36d   ; a cero, se acaba
	ld a,(ix+001h)		;b36f   ; el byte 1 sube el 3
	add a,(ix+003h)		;b372
	ld (ix+001h),a		;b375
	ret			;b378
se_acaba_d460:
	ld (ix+000h),000h		;b379   ; libre
	ret			;b37d
sprites_de_lanzado_1:		; los sprites 2C y 2C + 1 desde el 10 (0xDC28 + C * 8): en (byte 1, byte 2) con el patron de p06:B3AA y ese + 4
	ld a,c			;b37e   ; C * 8...
	add a,a			;b37f
	add a,a			;b380
	add a,a			;b381
	ld hl,0dc28h		;b382   ; ...desde el sprite 10 (0xDC28)
	call 0423eh		;b385   ; suma_a_hl: HL = HL + A
	ld d,h			;b388   ; DE = el sprite siguiente
	ld a,l			;b389
	add a,004h		;b38a
	ld e,a			;b38c
	ld a,(ix+001h)		;b38d   ; la Y (byte 1)...
	ld (hl),a			;b390
	ld (de),a			;b391   ; ...en los dos
	inc hl			;b392
	inc de			;b393
	ld a,(ix+002h)		;b394   ; la X (byte 2)...
	ld (hl),a			;b397
	ld (de),a			;b398   ; ...en los dos
	inc hl			;b399
	inc de			;b39a
	ld a,c			;b39b
	push hl			;b39c
	ld hl,0b3aah		;b39d   ; el patron de p06:B3AA...
	call 0423eh		;b3a0   ; suma_a_hl: HL = HL + A
	ld a,(hl)			;b3a3
	pop hl			;b3a4
	ld (hl),a			;b3a5   ; ...en el primero...
	add a,004h		;b3a6   ; ...y ese + 4 en el segundo
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


datos_sala_2a:		; en la sala especial 0x2A columna 8: 0x18 bytes de p06:B3EC a 0xD8C0 y 8 de p06:B404 a 0xDCB8
	ld a,(0ca76h)		;b3c9   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 02ah		;b3cc
	ret nz			;b3ce   ; fuera de la sala especial 0x2A, nada
	ld a,(0ca51h)		;b3cf   ; lee la columna de la sala en la zona (uno mas al salir por la derecha)
	cp 008h		;b3d2
	ret nz			;b3d4   ; solo en la columna 8
	ld de,0d8c0h		;b3d5   ; 0x18 bytes...
	ld hl,0b3ech		;b3d8   ; ...de p06:B3EC a 0xD8C0
	ld bc,00018h		;b3db
	ldir		;b3de
	ld de,0dcb8h		;b3e0   ; 8 bytes...
	ld hl,0b404h		;b3e3   ; ...de p06:B404 a 0xDCB8
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


alerta_en_b552:		; Z con alerta en las zonas y salas de p06:B552 (4 parejas); NZ en las demas o sin alerta
	ld a,(0ca5fh)		;b532   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	and a			;b535
	jr z,nz_b532		;b536   ; sin alerta: NZ
	ld b,004h		;b538   ; 4 parejas...
	ld de,0b552h		;b53a   ; ...[zona][sala] de p06:B552
pareja_b552:
	ld h,d			;b53d
	ld l,e			;b53e
	ld a,(0ca4ah)		;b53f   ; lee la zona
	cp (hl)			;b542
	jr nz,otra_pareja		;b543   ; su zona...
	inc hl			;b545
	ld a,(0ca4bh)		;b546   ; lee la sala de la zona
	cp (hl)			;b549
	ret z			;b54a   ; ...y su sala: Z
otra_pareja:
	inc de			;b54b   ; la pareja siguiente
	inc de			;b54c
	djnz pareja_b552		;b54d
nz_b532:
	or 001h		;b54f   ; NZ
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


alguien_ve_a_snake:		; acarreo si alguno de los 24 actores de tipo 1-0x0F se ve (p04:806F) y esta en esta sala (el 0x0A no en el paso 0)
	push ix		;b55a
	ld ix,0ce00h		;b55c   ; apunta a los actores: 24 fichas de 0x40 bytes (p04:800D)
	ld b,018h		;b560   ; 24 actores
actor_b55a:
	ld a,(ix+000h)		;b562   ; lee el tipo del actor (0 = libre)
	and a			;b565
	jr z,siguiente_b55a		;b566   ; libre: el siguiente
	cp 010h		;b568
	jr nc,siguiente_b55a		;b56a   ; desde el tipo 0x10, no
	rla			;b56c
	jr c,siguiente_b55a		;b56d
	call 0806fh		;b56f   ; si no se ve, no
	jr c,siguiente_b55a		;b572
	ld a,(ix+000h)		;b574   ; lee el tipo del actor (0 = libre)
	cp 00ah		;b577
	jr nz,L_B581		;b579   ; el tipo 0x0A...
	ld a,(ix+001h)		;b57b   ; lee el paso del actor
	and a			;b57e
	jr z,siguiente_b55a		;b57f   ; ...en el paso 0, no
L_B581:
	call 08100h		;b581   ; en esta sala: acarreo
	scf			;b584   ; acarreo...
	jr z,fin_b55a		;b585   ; ...si esta en la sala
siguiente_b55a:
	ld de,00040h		;b587   ; el actor siguiente (0x40 bytes)
	add ix,de		;b58a
	djnz actor_b55a		;b58c
	or a			;b58e   ; ninguno: sin acarreo
fin_b55a:
	pop ix		;b58f
	ret			;b591
velocidad_del_tramo:		; las velocidades del actor para la direccion A: con alerta 1 de p06:B68B, 2-3 de p06:B69B; sin ella, de p06:B65B segun el byte 0x19 (16 bytes cada uno); con el byte 0x19 >= 3 (salvo el tipo 3), parado y la direccion 1 (3 en la zona 0x0C); el dibujo, la direccion * 2
	ld c,a			;b592   ; C = la direccion
	ld a,(0ca5fh)		;b593   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	ld de,0b68bh		;b596   ; con la alerta 1, p06:B68B
	dec a			;b599
	jr z,pon_velocidad		;b59a
	ld de,0b69bh		;b59c   ; con la 2 o la 3, p06:B69B
	dec a			;b59f
	jr z,pon_velocidad		;b5a0
	dec a			;b5a2
	jr z,pon_velocidad		;b5a3
	ld a,(ix+019h)		;b5a5   ; sin alerta, segun el byte 0x19
	ld b,a			;b5a8
	cp 003h		;b5a9
	jr c,tabla_b65b		;b5ab   ; por debajo de 3, su tabla
	ld a,(ix+000h)		;b5ad
	cp 003h		;b5b0
	jr z,tipo_3_b592		;b5b2   ; el tipo 3, tambien
	xor a			;b5b4   ; los demas, parados
	ld (ix+006h),a		;b5b5
	ld (ix+007h),a		;b5b8
	ld (ix+008h),a		;b5bb
	ld (ix+009h),a		;b5be
	ld a,(0ca4ah)		;b5c1   ; lee la zona
	cp 00ch		;b5c4
	ld c,001h		;b5c6   ; la direccion 1...
	jr nz,dibujo_de_direccion		;b5c8
	ld c,003h		;b5ca   ; ...o 3 en la zona 0x0C
	jr dibujo_de_direccion		;b5cc
tipo_3_b592:
	ld a,b			;b5ce
tabla_b65b:
	add a,a			;b5cf   ; el byte 0x19 * 16...
	add a,a			;b5d0
	add a,a			;b5d1
	add a,a			;b5d2
	ld de,0b65bh		;b5d3   ; ...en p06:B65B
	call 04243h		;b5d6   ; suma_a_de: DE = DE + A
pon_velocidad:
	call 08e40h		;b5d9   ; velocidad_de_tabla: las dos velocidades del actor de la tabla DE (4 bytes por direccion C) y el byte 0x0C (1 vertical, 2 horizontal)
dibujo_de_direccion:
	ld a,c			;b5dc   ; la direccion * 2...
	add a,a			;b5dd
	ld (ix+00dh),a		;b5de   ; ...al dibujo
	ret			;b5e1
dibujo_siguiente_b6bb:		; el dibujo siguiente: su orden en p06:B6BB, uno mas (de 0 a 0x0B, en vuelta) y el dibujo de p06:B6CB
	ld a,(ix+00dh)		;b5e2
	ld hl,0b6bbh		;b5e5   ; su orden en p06:B6BB
	call 04248h		;b5e8   ; byte_de_tabla: A = el byte A de la tabla de HL (y HL apunta a el)
	inc a			;b5eb   ; uno mas...
	cp 00ch		;b5ec
	jr c,dibujo_b6cb		;b5ee   ; ...de 0x0B pasa a 0
	xor a			;b5f0
dibujo_b6cb:
	ld hl,0b6cbh		;b5f1   ; el dibujo de ese orden
	call 04248h		;b5f4   ; byte_de_tabla: A = el byte A de la tabla de HL (y HL apunta a el)
	ld (ix+00dh),a		;b5f7
	ret			;b5fa
actor_al_paso_8:		; salvo en los pasos 8-9: el paso al byte 0x20 y el paso 8, 0x3C cuadros (byte 0x1C), el byte 0x0C al 0x22 y a 0, y el dibujo & 7 (tambien al byte 0x15)
	ld a,(ix+001h)		;b5fb
	ld c,a			;b5fe   ; C = el paso
	sub 008h		;b5ff   ; en los pasos 8-9, nada
	cp 002h		;b601
	ret c			;b603
	ld (ix+020h),c		;b604   ; el paso al byte 0x20
	ld (ix+001h),008h		;b607   ; el paso 8
	ld a,03ch		;b60b   ; 0x3C cuadros
	ld (ix+01ch),a		;b60d
	ld a,(ix+00ch)		;b610   ; el byte 0x0C al 0x22
	ld (ix+022h),a		;b613
	ld a,(ix+00dh)		;b616   ; el dibujo & 7...
	and 007h		;b619
	ld (ix+015h),a		;b61b   ; ...al byte 0x15...
	ld (ix+00dh),a		;b61e   ; ...y al dibujo
	ld (ix+00ch),000h		;b621   ; el byte 0x0C a cero
	ret			;b625
paso_8_cuenta:		; la cuenta del byte 0x1C: el dibujo segun la cuenta (+0, +1 u +8 sobre el byte 0x15 & 6; no en el tipo 0x0B) y NZ; al acabar, con alerta 2 o mas p04:8EF2, si no, 0x48 cuadros y el paso siguiente
	dec (ix+01ch)		;b626
	jr z,fin_cuenta_b626		;b629   ; al acabar la cuenta...
	ld a,(ix+000h)		;b62b
	cp 00bh		;b62e   ; el tipo 0x0B no cambia de dibujo
	ret z			;b630
	ld a,(ix+01ch)		;b631
	rra			;b634   ; cuenta par: +0
	ld b,000h		;b635
	jr nc,pon_dibujo_b626		;b637
	rra			;b639   ; cuenta impar: +8 o +1
	ld b,008h		;b63a
	jr c,pon_dibujo_b626		;b63c
	inc b			;b63e
pon_dibujo_b626:
	ld a,(ix+015h)		;b63f
	and 006h		;b642   ; la direccion del dibujo...
	add a,b			;b644   ; ...+ B
	ld (ix+00dh),a		;b645
	or 001h		;b648   ; NZ
	ret			;b64a
fin_cuenta_b626:
	ld a,(0ca5fh)		;b64b   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	cp 002h		;b64e
	jp nc,08ef2h		;b650   ; con alerta 2 o mas, p04:8EF2
	ld (ix+00eh),048h		;b653   ; si no, 0x48 cuadros...
	inc (ix+001h)		;b657   ; ...y el paso siguiente
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
