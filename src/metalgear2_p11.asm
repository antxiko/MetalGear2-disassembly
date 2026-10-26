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

; ======================================================================
; CODIGO 0xa000..0xa006  (6 bytes)
; ======================================================================


snake_estado_19:		; el estado 0x19 de Snake (p03:A216; lo pone p06:A0AB): por su paso 0xCB48 (p11:A006, 8 pasos)
	ld a,(0cb48h)		;a000   ; lee el paso del estado 0x19 de Snake (p11:A006)
	call 0424dh		;a003   ; despachador: salta a la palabra A de la tabla que va detras del call

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


estado_19_paso_0:		; 0xCADF = 0, p13:93F7 con p11:AA51 (4) y el paso siguiente
	xor a			;a016
	ld (0cadfh),a		;a017   ; 0xCADF = 0
	ld hl,0aa51h		;a01a   ; la lista de p11:AA51...
	ld c,004h		;a01d   ; ...4
	call 07b24h		;a01f   ; a_p13_93f7: p13:93F7 con el banco 13 en 0x8000
	jr cb48_siguiente		;a022
estado_19_paso_1:		; p13:941A con p11:AA51 (4); sin 0xCADA, el paso siguiente
	ld de,0aa51h		;a024   ; la lista de p11:AA51...
	ld c,004h		;a027   ; ...4
	call 07b2dh		;a029   ; a_p13_941a: p13:941A con el banco 13 en 0x8000
	ld a,(0cadah)		;a02c   ; con 0xCADA...
	or a			;a02f
	ret nz			;a030   ; con 0xCADA, sigue
	jr cb48_siguiente		;a031
estado_19_paso_2:		; la cuenta de 0xCB49: a 0xC el sonido 0x9B; al acabar, 0x10 cuadros, el dibujo de Snake uno mas y el paso siguiente
	ld hl,0cb49h		;a033   ; apunta a la cuenta del estado 0x19 de Snake
	dec (hl)			;a036   ; la cuenta
	jr nz,sonido_9b_en_0c		;a037
	ld (hl),010h		;a039   ; 0x10 cuadros
	ld hl,0cb01h		;a03b   ; apunta a el dibujo de Snake (al darse la vuelta se le suma 1, 3 o 5 segun 0xCB00)
	inc (hl)			;a03e   ; el dibujo siguiente
cb48_siguiente:		; el paso siguiente de 0xCB48
	ld hl,0cb48h		;a03f   ; apunta a el paso del estado 0x19 de Snake (p11:A006)
	inc (hl)			;a042   ; uno mas
	ret			;a043
sonido_9b_en_0c:
	ld a,(hl)			;a044
	cp 00ch		;a045   ; solo a 0x0C
	ret nz			;a047
	jp 06ba8h		;a048   ; sonido_9b: pide el sonido 0x9B (de los que tienen la partitura en un banco de musica, p16:4CE3)
estado_19_paso_3:		; cada 8 cuadros 0xCB4A uno mas: Snake en los sitios de p11:A090 (4); al quinto, Snake 0x20 abajo y 8 a la derecha, 0x14 cuadros, de espaldas dandose la vuelta y el paso siguiente
	ld hl,0cb49h		;a04b   ; apunta a la cuenta del estado 0x19 de Snake
	dec (hl)			;a04e   ; la cuenta
	ret nz			;a04f
	ld (hl),008h		;a050   ; otros 8
	inc hl			;a052
	inc (hl)			;a053   ; el sitio siguiente
	ld a,(hl)			;a054
	cp 005h		;a055   ; hasta 5
	jr nc,estado_19_baja		;a057   ; desde el 5, aparte
	ld hl,cb48_siguiente_b		;a059   ; los sitios
	add a,a			;a05c   ; 2 bytes cada uno
	call 0423eh		;a05d   ; suma_a_hl: HL = HL + A
	ld a,(hl)			;a060   ; la Y...
	ld (0cb03h),a		;a061   ; guarda la Y de Snake
	inc hl			;a064
	ld a,(hl)			;a065   ; ...y la X
	ld (0cb05h),a		;a066   ; guarda la X de Snake
	ret			;a069
estado_19_baja:
	ld a,(0cb03h)		;a06a   ; lee la Y de Snake
	add a,020h		;a06d   ; 0x20 mas abajo
	ld (0cb03h),a		;a06f   ; guarda la Y de Snake
	ld a,(0cb05h)		;a072   ; lee la X de Snake
	add a,008h		;a075   ; 8 mas a la derecha
	ld (0cb05h),a		;a077   ; guarda la X de Snake
	ld hl,0cb49h		;a07a   ; apunta a la cuenta del estado 0x19 de Snake
	ld (hl),014h		;a07d   ; 0x14 cuadros
snake_de_espaldas:		; el dibujo 4, dandose la vuelta, 0xCB17 = 7, y el paso siguiente
	ld hl,0cb01h		;a07f   ; apunta a el dibujo de Snake (al darse la vuelta se le suma 1, 3 o 5 segun 0xCB00)
	ld (hl),004h		;a082   ; el dibujo 4
	ld a,001h		;a084   ; dandose la vuelta
	ld (0cb16h),a		;a086   ; guarda 1 mientras Snake se da la vuelta
	ld a,007h		;a089
	ld (0cb17h),a		;a08b   ; 0xCB17 = 7
cb48_siguiente_b:
	jr cb48_siguiente		;a08e

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa090..0xa098  (8 bytes)
DATA_A090:
	defb 06eh,0a5h,06dh,0a3h,069h,0a1h,060h,0a1h	; a090  n.m.i.`.

; ======================================================================
; CODIGO 0xa098..0xa1d7  (319 bytes)
; ======================================================================


estado_19_paso_4:		; al acabar la espera: el dibujo 2, sin darse la vuelta, la marcha 1, 0xCB15 = 2, Snake 8 a la izquierda y el paso siguiente
	ld hl,0cb49h		;a098   ; apunta a la cuenta del estado 0x19 de Snake
	dec (hl)			;a09b   ; la cuenta...
	ret nz			;a09c   ; ...aun no
	ld a,002h		;a09d
	ld hl,0cb01h		;a09f   ; apunta a el dibujo de Snake (al darse la vuelta se le suma 1, 3 o 5 segun 0xCB00)
	ld (hl),a			;a0a2   ; el dibujo 2
	xor a			;a0a3
	ld (0cb16h),a		;a0a4   ; guarda 1 mientras Snake se da la vuelta
	ld a,001h		;a0a7
	ld (0cb0ah),a		;a0a9   ; la marcha 1
	ld a,002h		;a0ac
	ld (0cb15h),a		;a0ae   ; la espera del paso
	ld a,(0cb05h)		;a0b1   ; lee la X de Snake
	sub 008h		;a0b4   ; 8 a la izquierda
	ld (0cb05h),a		;a0b6   ; guarda la X de Snake
	jr $-122		;a0b9
estado_19_paso_5:		; anda (p02:9430) hasta X = 0x8A; alli, 0x40 cuadros, la marcha 0 y el paso siguiente
	call 09430h		;a0bb   ; p02:9430
	ld hl,0cb05h		;a0be   ; apunta a la X de Snake
	ld a,(hl)			;a0c1
	cp 08ah		;a0c2   ; hasta 0x8A
	ret nc			;a0c4   ; desde 0x8A, sigue
	ld (hl),08ah		;a0c5   ; X = 0x8A
	ld hl,0cb49h		;a0c7   ; apunta a la cuenta del estado 0x19 de Snake
	ld (hl),040h		;a0ca   ; 0x40 cuadros
	ld a,000h		;a0cc   ; la marcha 0
	ld (0cb0ah),a		;a0ce   ; la marcha 0
	jr $-82		;a0d1
llamada_0:		; la llamada 0 (p03:B11F)
	xor a			;a0d3
	jp 08f8dh		;a0d4   ; a_p03_b11f: p03:B11F con el banco 3 en 0xA000
estado_19_paso_6:		; la cuenta: a 0x22 la llamada 0; por debajo, p03:B132 hasta 0; a 0, el paso siguiente y p03:B19A
	ld hl,0cb49h		;a0d7   ; apunta a la cuenta del estado 0x19 de Snake
	dec (hl)			;a0da   ; la cuenta
	ld a,(hl)			;a0db
	cp 022h		;a0dc   ; en 0x22...
	jr z,llamada_0		;a0de   ; en 0x22
	cp 022h		;a0e0   ; por encima, nada
	ret nc			;a0e2   ; por encima, nada
	or a			;a0e3
	jp nz,08f85h		;a0e4   ; por debajo, p03:B132
	call cb48_siguiente		;a0e7   ; a 0, el paso siguiente...
	jp 08f7dh		;a0ea   ; ...y p03:B19A
estado_19_paso_7:		; sin 0xE257: la conversacion de p48:8008, 0xCB15 = 2 y Snake en el estado 0 con el dibujo 0; con el, 0xCABA = 0, el estado 0 y el sonido 0x6A
	ld a,(0e257h)		;a0ed   ; lee 1 con el punto del teclado numerico en el monitor de p63
	or a			;a0f0
	jr nz,estado_19_fin		;a0f1   ; con 0xE257, aparte
	call 0640eh		;a0f3   ; la conversacion
	ld a,002h		;a0f6   ; 0xCB15 = 2
	ld (0cb15h),a		;a0f8   ; guarda la espera hasta el paso siguiente (p02:988A, segun la marcha)
	xor a			;a0fb
	ld hl,0cb00h		;a0fc   ; Snake en el estado 0...
	ld (hl),a			;a0ff
	inc l			;a100
	ld (hl),a			;a101   ; ...con el dibujo 0
	ld (0cb16h),a		;a102   ; guarda 1 mientras Snake se da la vuelta
	ret			;a105
estado_19_fin:
	xor a			;a106
	ld hl,0cabah		;a107   ; 0xCABA = 0
	ld (hl),a			;a10a   ; 0xCABA = 0
	ld hl,0cb00h		;a10b   ; apunta a el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	ld (hl),a			;a10e
	inc l			;a10f
	ld (hl),a			;a110
	ld (0cb16h),a		;a111   ; guarda 1 mientras Snake se da la vuelta
	jp 06b1eh		;a114   ; sonido_6a: pide el sonido 0x6A (de los que tienen la partitura en un banco de musica, p16:4CE3)
golpe_en_la_sala:		; acarreo si (D, E) cae en una caja de p11:A26F de esta sala sin su bandera de 0xDFC0
	ld a,(0ca4bh)		;a117   ; lee la sala de la zona
	ld c,a			;a11a   ; C = la sala
	call caja_de_a26f		;a11b   ; caja_de_a26f: busca en p11:A26F (9 bytes: zona, sala, X, Y, ancho y alto * 8, bandera, mosaico) la caja de la sala C que contiene (D, E): acarreo con A = la bandera, HL = el mosaico, DE = su sitio y BC = su tamano / 8
	ret nc			;a11e   ; fuera de las cajas: sin acarreo
	call bandera_dfc0		;a11f   ; bandera_dfc0: acarreo si la bandera A de 0xDFC0 (un byte cada una) esta puesta; HL = ella
	ccf			;a122   ; acarreo sin la bandera
	ret			;a123
golpe_en_sala_c:		; si (D, E) cae en una caja de p11:A26F de la sala C sin su bandera (la 6, con los bits 4 de 0xD7E2, fuera el 1 de 0xD7E3 y el 1 de 0xD7D3): su bandera (p11:A1E2), el sonido 0x62 y, en esta sala, p11:A690, p11:A916, el mosaico en la pantalla y en el mapa, p11:A6B3 y p11:A947
	ld a,c			;a124
	ld (0d8f3h),a		;a125   ; la sala a 0xD8F3
	call caja_de_a26f		;a128   ; caja_de_a26f: busca en p11:A26F (9 bytes: zona, sala, X, Y, ancho y alto * 8, bandera, mosaico) la caja de la sala C que contiene (D, E): acarreo con A = la bandera, HL = el mosaico, DE = su sitio y BC = su tamano / 8
	ret nc			;a12b   ; fuera, nada
	cp 006h		;a12c   ; la bandera 6...
	jr nz,bandera_y_mosaico		;a12e   ; la 6...
	push hl			;a130
	ld hl,0d7e2h		;a131
	set 4,(hl)		;a134   ; ...el bit 4 de 0xD7E2...
	ld hl,0d7e3h		;a136
	res 1,(hl)		;a139   ; ...fuera el 1 de 0xD7E3...
	ld hl,0d7d3h		;a13b
	set 1,(hl)		;a13e   ; ...y el 1 de 0xD7D3
	pop hl			;a140
bandera_y_mosaico:		; ya puesta, nada
	call pon_bandera_dfc0		;a141   ; pon_bandera_dfc0: si la bandera A no estaba, la pone y tambien la de p11:A202 que va con ella (0xFF ninguna); acarreo si ya estaba
	ret c			;a144   ; ya estaba, nada
	call 06c8fh		;a145   ; el sonido 0x62
	push hl			;a148
	ld a,(0d8f3h)		;a149   ; la sala...
	ld hl,0ca4bh		;a14c   ; apunta a la sala de la zona
	cp (hl)			;a14f   ; otra sala, nada mas
	pop hl			;a150
	ret nz			;a151   ; ...otra: nada mas
	push hl			;a152
	push de			;a153
	push bc			;a154
	call guarda_fondos_cc00		;a155   ; guarda_fondos_cc00: el fondo de cada ficha de 0xCC00 de esta sala guardado en la otra pagina
	call df80_de_la_sala_b322		;a158   ; df80_de_la_sala_b322: las fichas activas de 0xDF80 de esta sala con algo en el byte 7: p03:B322
	pop bc			;a15b
	pop de			;a15c
	pop hl			;a15d
	call 071ddh		;a15e   ; el mosaico en la pantalla y el mapa
	call repinta_cc00		;a161   ; repinta_cc00: las fichas de 0xCC00 de esta sala: el fondo y el dibujo
	jp df80_de_la_sala_b289		;a164   ; df80_de_la_sala_b289: las fichas activas de 0xDF80 de esta sala con algo en el byte 7: p03:B289 y p03:B3A6
caja_de_a26f:		; busca en p11:A26F (9 bytes: zona, sala, X, Y, ancho y alto * 8, bandera, mosaico) la caja de la sala C que contiene (D, E): acarreo con A = la bandera, HL = el mosaico, DE = su sitio y BC = su tamano / 8
	ld a,c			;a167
	ld (0d8f3h),a		;a168
	ld hl,0a26fh		;a16b   ; la lista de p11:A26F
caja_a26f:
	ld a,(0d8f3h)		;a16e
	ld c,a			;a171
	ld a,(hl)			;a172   ; 0xFF: se acaba
	cp 0ffh		;a173   ; 0xFF: ninguna
	jr z,$+99		;a175
	push hl			;a177
	ld a,(0ca4ah)		;a178   ; lee la zona
	cp (hl)			;a17b   ; su zona
	jr nz,otra_caja		;a17c   ; otra zona
	inc hl			;a17e
	ld b,(hl)			;a17f   ; la sala de la caja
	ld a,(0ca76h)		;a180   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	or a			;a183   ; sin sala especial...
	jr z,sala_de_la_caja		;a184   ; sin sala especial, la sala
	cp 026h		;a186   ; en la especial 0x26...
	jr nz,otra_caja		;a188   ; ...otra especial, no
	ld a,b			;a18a   ; ...la sala sin el bit 7
	and 07fh		;a18b   ; sin el bit 7
	ld b,a			;a18d
sala_de_la_caja:
	ld a,c			;a18e
	cp b			;a18f   ; la sala?
	jr nz,otra_caja		;a190
	inc hl			;a192
	ld c,(hl)			;a193   ; su X...
	inc hl			;a194
	ld b,(hl)			;a195   ; ...su Y
	ld a,e			;a196   ; por la izquierda...
	cp c			;a197   ; a la izquierda, no
	jr c,otra_caja		;a198
	ld a,d			;a19a   ; ...y por arriba
	cp b			;a19b   ; por encima, no
	jr c,otra_caja		;a19c
	inc hl			;a19e
	ld a,(hl)			;a19f   ; + el ancho
	add a,c			;a1a0   ; + el ancho
	ld c,a			;a1a1
	inc hl			;a1a2
	ld a,(hl)			;a1a3   ; + el alto
	add a,b			;a1a4   ; + el alto
	ld b,a			;a1a5
	ld a,e			;a1a6   ; por la derecha...
	cp c			;a1a7   ; a la derecha, no
	jr nc,otra_caja		;a1a8
	ld a,d			;a1aa   ; ...y por abajo
	cp b			;a1ab   ; por debajo, no
	jr nc,otra_caja		;a1ac
	pop de			;a1ae
	push hl			;a1af
	ld c,(hl)			;a1b0
	rrc c		;a1b1   ; el ancho / 8
	rrc c		;a1b3   ; / 8
	rrc c		;a1b5
	dec hl			;a1b7
	ld b,(hl)			;a1b8
	rrc b		;a1b9   ; el alto / 8
	rrc b		;a1bb   ; / 8
	rrc b		;a1bd
	dec hl			;a1bf
	ld d,(hl)			;a1c0   ; su sitio
	dec hl			;a1c1
	ld e,(hl)			;a1c2
	pop hl			;a1c3
	inc hl			;a1c4
	ld a,(hl)			;a1c5   ; la bandera
	push af			;a1c6
	inc hl			;a1c7
	ld a,(hl)			;a1c8   ; el mosaico
	inc hl			;a1c9
	ld h,(hl)			;a1ca
	ld l,a			;a1cb
	pop af			;a1cc
	scf			;a1cd   ; encontrada
	ret			;a1ce
otra_caja:
	pop hl			;a1cf
	ld a,009h		;a1d0   ; la siguiente (9 bytes)
	call 0423eh		;a1d2   ; suma_a_hl: HL = HL + A
	jr caja_a26f		;a1d5

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa1d7..0xa1d8  (1 bytes)
DATA_A1D7:
	defb 0e1h	; a1d7

; ======================================================================
; CODIGO 0xa1d8..0xa202  (42 bytes)
; ======================================================================


sin_caja:
	and a			;a1d8   ; sin acarreo
	ret			;a1d9
bandera_dfc0:		; acarreo si la bandera A de 0xDFC0 (un byte cada una) esta puesta; HL = ella
	ld hl,0dfc0h		;a1da   ; apunta a las banderas de las cajas de p11:A26F (un byte cada una; p11:A1DA)
	call 04248h		;a1dd   ; byte_de_tabla: A = el byte A de la tabla de HL (y HL apunta a el)
	rra			;a1e0   ; acarreo con la bandera
	ret			;a1e1
pon_bandera_dfc0:		; si la bandera A no estaba, la pone y tambien la de p11:A202 que va con ella (0xFF ninguna); acarreo si ya estaba
	push hl			;a1e2
	exx			;a1e3
	ld b,a			;a1e4   ; guarda la bandera
	exx			;a1e5
	call bandera_dfc0		;a1e6   ; bandera_dfc0: acarreo si la bandera A de 0xDFC0 (un byte cada una) esta puesta; HL = ella
	jr c,fin_bandera		;a1e9   ; ya estaba
	ld (hl),001h		;a1eb   ; puesta
	exx			;a1ed
	ld a,b			;a1ee
	exx			;a1ef
	ld hl,0a202h		;a1f0   ; la que va con ella
	call 04248h		;a1f3   ; byte_de_tabla: A = el byte A de la tabla de HL (y HL apunta a el)
	cp 0ffh		;a1f6   ; 0xFF: ninguna
	jr z,bandera_nueva		;a1f8
	call bandera_dfc0		;a1fa   ; bandera_dfc0: acarreo si la bandera A de 0xDFC0 (un byte cada una) esta puesta; HL = ella
	ld (hl),001h		;a1fd   ; puesta tambien
bandera_nueva:
	and a			;a1ff   ; sin acarreo
fin_bandera:
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


mosaicos_de_banderas:		; sin 0xD8C0 (en la zona 0x0C sin sala especial): los mosaicos de las cajas de p11:A26F de esta sala con su bandera puesta
	ld a,(0d8c0h)		;a20d   ; lee 1 con Snake dentro de lo de 0xD8C2 (p07:A40D; 0 al salir, p07:A69A)
	or a			;a210   ; con 0xD8C0, nada
	ret nz			;a211   ; con 0xD8C0, nada
	ld a,(0ca4ah)		;a212   ; lee la zona
	cp 00ch		;a215   ; la zona 0x0C...
	jr nz,mosaicos_a26f		;a217
	ld a,(0ca76h)		;a219   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	or a			;a21c   ; ...con sala especial, nada
	ret nz			;a21d   ; en la zona 0x0C con sala especial, nada
mosaicos_a26f:
	ld hl,0a26fh		;a21e   ; la lista de p11:A26F
caja_a26f_b:
	ld a,(hl)			;a221
	cp 0ffh		;a222   ; 0xFF: se acaba
	ret z			;a224   ; 0xFF: se acaba
	push hl			;a225
	ld a,(0ca4ah)		;a226   ; lee la zona
	cp (hl)			;a229   ; su zona?
	jr nz,siguiente_a26f		;a22a   ; otra zona
	inc hl			;a22c
	ld b,(hl)			;a22d   ; la sala
	ld a,(0ca76h)		;a22e   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	or a			;a231   ; sin especial, la sala
	jr z,sala_a26f		;a232
	cp 026h		;a234   ; la especial 0x26...
	jr nz,siguiente_a26f		;a236
	ld a,b			;a238
	and 07fh		;a239   ; ...sin el bit 7
	ld b,a			;a23b
sala_a26f:
	ld a,(0ca4bh)		;a23c   ; lee la sala de la zona
	cp b			;a23f   ; esta sala?
	jr nz,siguiente_a26f		;a240   ; otra sala
	inc hl			;a242
	ld e,(hl)			;a243   ; su sitio
	inc hl			;a244
	ld d,(hl)			;a245   ; su sitio
	inc hl			;a246
	ld b,(hl)			;a247   ; su tamano / 8
	rrc b		;a248   ; / 8
	rrc b		;a24a
	rrc b		;a24c
	inc hl			;a24e
	ld c,(hl)			;a24f
	rrc c		;a250   ; / 8
	rrc c		;a252
	rrc c		;a254
	inc hl			;a256
	ld a,(hl)			;a257   ; la bandera...
	push hl			;a258
	call bandera_dfc0		;a259   ; bandera_dfc0: acarreo si la bandera A de 0xDFC0 (un byte cada una) esta puesta; HL = ella
	pop hl			;a25c
	jr nc,siguiente_a26f		;a25d   ; ...sin ella, nada
	inc hl			;a25f
	ld a,(hl)			;a260   ; el mosaico
	inc hl			;a261
	ld h,(hl)			;a262
	ld l,a			;a263
	call 071ddh		;a264   ; a la pantalla y al mapa
siguiente_a26f:
	pop hl			;a267
	ld a,009h		;a268   ; la siguiente (9 bytes)
	call 0423eh		;a26a   ; suma_a_hl: HL = HL + A
	jr caja_a26f_b		;a26d

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


ficha_dfe8:		; 0xDFE8 = 0xE060 = 0; en la zona 6 sala 0x10: 0xDFE9 = 0, 0xDFE8 = 1, 0xDFEA = 0xA8, p11:A446, p11:A497 y el caracter 0x9D en dos sitios de 0xDD96, 0xDDAE y 0xDDC6 del mapa
	xor a			;a389   ; 0xDFE8 = 0...
	ld (0dfe8h),a		;a38a   ; guarda 1 con lo de la zona 6 sala 0x10 (p11:A389; 0xDFE9 paso, 0xDFEA X)
	ld (0e060h),a		;a38d   ; guarda 1 con la ficha de 0xE063/0xE065 en la sala (p07:B29A; se coge)
	ld a,(0ca4ah)		;a390   ; lee la zona
	cp 006h		;a393   ; la zona 6...
	ret nz			;a395   ; solo en la zona 6...
	ld a,(0ca4bh)		;a396   ; lee la sala de la zona
	cp 010h		;a399   ; ...sala 0x10
	ret nz			;a39b   ; ...sala 0x10
	xor a			;a39c   ; 0xDFE9 = 0
	ld (0dfe9h),a		;a39d   ; guarda el paso de lo de 0xDFE8 (p11:A3E6)
	inc a			;a3a0
	ld (0dfe8h),a		;a3a1   ; 0xDFE8 = 1
	ld a,0a8h		;a3a4
	ld (0dfeah),a		;a3a6   ; 0xDFEA = 0xA8
	call sprites_dfea		;a3a9   ; sprites_dfea: los sprites de lo de 0xDFEA: uno en Y = 0x27 (p11:A44E), 8 en columna desde 0x37 (p11:A45C), y sus colores (p11:A478)
	call mosaico_que_cambia		;a3ac   ; mosaico_que_cambia: el mosaico (cuadros / 2 & 3) de p11:A4A6 (p56, 10 x 2 en X = 0x10)
	ld hl,0dd96h		;a3af   ; el 0x9D en el mapa
	call dos_9d		;a3b2   ; dos_9d: dos caracteres 0x9D en HL
	ld hl,0ddaeh		;a3b5   ; 0xDDAE
	call dos_9d		;a3b8   ; dos_9d: dos caracteres 0x9D en HL
	ld hl,0ddc6h		;a3bb   ; 0xDDC6
dos_9d:		; dos caracteres 0x9D en HL
	ld a,09dh		;a3be   ; el caracter 0x9D...
	ld (hl),a			;a3c0
	inc hl			;a3c1
	ld (hl),a			;a3c2   ; ...en los dos
	ret			;a3c3
dfe8_cada_cuadro:		; con 0xDFE8: su paso (p11:A3E0), p11:A446, p11:A497, p11:A4AE y, con 0xE060, p11:A4F0 y p11:A583
	ld a,(0dfe8h)		;a3c4   ; lee 1 con lo de la zona 6 sala 0x10 (p11:A389; 0xDFE9 paso, 0xDFEA X)
	or a			;a3c7
	ret z			;a3c8   ; sin 0xDFE8, nada
	call dfe9_paso		;a3c9   ; dfe9_paso: el paso 0xDFE9 (p11:A3E6)
	call sprites_dfea		;a3cc   ; sprites_dfea: los sprites de lo de 0xDFEA: uno en Y = 0x27 (p11:A44E), 8 en columna desde 0x37 (p11:A45C), y sus colores (p11:A478)
	call mosaico_que_cambia		;a3cf   ; mosaico_que_cambia: el mosaico (cuadros / 2 & 3) de p11:A4A6 (p56, 10 x 2 en X = 0x10)
	call e060_empieza		;a3d2   ; e060_empieza: sin 0xE060 ni 0xDFE9, con Snake desde Y = 0x78: la ficha 0xE060 de p11:A4E5 (11 bytes), 0xD4E8 = 0 y el byte 0 = 8-0x0E al azar (0x0F pasa a 0x0A)
	ld a,(0e060h)		;a3d5   ; lee 1 con la ficha de 0xE063/0xE065 en la sala (p07:B29A; se coge)
	or a			;a3d8   ; sin 0xE060, nada mas
	ret z			;a3d9   ; sin 0xE060, nada mas
	call e060_paso		;a3da   ; e060_paso: el paso 0xE061 (p11:A4F6)
	jp e060_sprites		;a3dd   ; e060_sprites: con 0xE060 en la zona 6 sala 0x10: su sprite (p11:A5AB), sus colores (p11:A5BE) y lo de arriba oculto (p11:A5D9); sin el, los sprites 28-29 fuera
dfe9_paso:		; el paso 0xDFE9 (p11:A3E6)
	ld a,(0dfe9h)		;a3e0   ; lee el paso de lo de 0xDFE8 (p11:A3E6)
	call 0424dh		;a3e3   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_A3E6: 3 destinos del despachador p00:424D (call en p11:A3E3, el
;   indice en A): A3EC, A3F9, A415; lo leen p11:A3E3 (6 bytes)
;   0xa3e6..0xa3ec  (6 bytes)
DATA_tabla_A3E6:
	defw 0a3ech,0a3f9h,0a415h	; a3e6  -> dfe9_paso_0 dfe9_paso_1 dfe9_paso_2

; ======================================================================
; CODIGO 0xa3ec..0xa4a6  (186 bytes)
; ======================================================================


dfe9_paso_0:		; con 0xE060 y 0xE067 por debajo de 3, el paso siguiente
	ld a,(0e060h)		;a3ec   ; lee 1 con la ficha de 0xE063/0xE065 en la sala (p07:B29A; se coge)
	or a			;a3ef
	ret z			;a3f0   ; sin 0xE060, nada
	ld a,(0e067h)		;a3f1   ; 0xE067...
	cp 003h		;a3f4
	ret nc			;a3f6   ; desde 3, nada
	jr dfe9_siguiente		;a3f7
dfe9_paso_1:		; el sonido (p11:A409) y 0xDFEA baja; por debajo de 0x41, el paso siguiente
	call sonido_33_si		;a3f9   ; sonido_33_si: salvo en el estado 0x14 y desde el 0x1B, el sonido 0x33
	ld hl,0dfeah		;a3fc   ; apunta a la X de lo de 0xDFE8 (no se pasa, p06:A2AA)
	dec (hl)			;a3ff   ; uno menos
	ld a,(hl)			;a400
	cp 041h		;a401   ; hasta 0x41
	ret nc			;a403   ; aun no
dfe9_siguiente:
	ld hl,0dfe9h		;a404   ; apunta a el paso de lo de 0xDFE8 (p11:A3E6)
	inc (hl)			;a407
	ret			;a408
sonido_33_si:		; salvo en el estado 0x14 y desde el 0x1B, el sonido 0x33
	ld a,(0cb00h)		;a409   ; lee el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	cp 014h		;a40c   ; el estado 0x14...
	ret z			;a40e
	cp 01bh		;a40f   ; ...y desde el 0x1B, nada
	ret nc			;a411
	jp 06adeh		;a412   ; sonido_33: pide el sonido 0x33
dfe9_paso_2:		; el sonido y 0xDFEA sube 2; desde 0xA8, el paso 0
	call sonido_33_si		;a415   ; sonido_33_si: salvo en el estado 0x14 y desde el 0x1B, el sonido 0x33
	ld hl,0dfeah		;a418   ; apunta a la X de lo de 0xDFE8 (no se pasa, p06:A2AA)
	inc (hl)			;a41b   ; 2 mas
	inc (hl)			;a41c
	ld a,(hl)			;a41d
	cp 0a8h		;a41e   ; hasta 0xA8
	ret c			;a420
	ld hl,0dfe9h		;a421   ; el paso 0
	ld (hl),000h		;a424   ; el paso 0
	ret			;a426
dfe8_sala_5_8:		; en la zona 6 fila 5 columna 8: 0xDFEA = 0xA8 si estaba a 0, el mosaico 0 (p11:A49D) y los sprites (p11:A446)
	ld a,(0ca4ah)		;a427   ; lee la zona
	cp 006h		;a42a
	ret nz			;a42c   ; solo en la zona 6...
	ld a,(0ca50h)		;a42d   ; lee la fila de la sala en la zona (uno mas al salir por arriba)
	cp 005h		;a430
	ret nz			;a432   ; ...fila 5...
	ld a,(0ca51h)		;a433   ; lee la columna de la sala en la zona (uno mas al salir por la derecha)
	cp 008h		;a436
	ret nz			;a438   ; ...columna 8
	ld hl,0dfeah		;a439   ; apunta a la X de lo de 0xDFE8 (no se pasa, p06:A2AA)
	ld a,(hl)			;a43c
	or a			;a43d   ; ya puesta, se queda
	jr nz,mosaico_0_a49d		;a43e   ; ya puesto, se queda
	ld (hl),0a8h		;a440   ; 0xA8
mosaico_0_a49d:
	xor a			;a442   ; el mosaico 0
	call mosaico_a4a6		;a443   ; mosaico_a4a6:
sprites_dfea:		; los sprites de lo de 0xDFEA: uno en Y = 0x27 (p11:A44E), 8 en columna desde 0x37 (p11:A45C), y sus colores (p11:A478)
	call sprite_dfea_arriba		;a446   ; sprite_dfea_arriba: en X = 0xDFEA, Y = 0x27 con el patron 0xF0 desde el sprite 10
	call sprites_dfea_columna		;a449   ; sprites_dfea_columna: 8 parejas con el patron 0xF8 desde Y = 0x37, de 0x10 en 0x10
	jr colores_dfea		;a44c
sprite_dfea_arriba:		; en X = 0xDFEA, Y = 0x27 con el patron 0xF0 desde el sprite 10
	ld hl,0dfeah		;a44e   ; apunta a la X de lo de 0xDFE8 (no se pasa, p06:A2AA)
	ld d,(hl)			;a451   ; la X de 0xDFEA
	ld e,027h		;a452   ; Y = 0x27
	ld c,0f0h		;a454   ; el patron 0xF0
	ld hl,0dc28h		;a456   ; desde el sprite 10
	jp pareja_de_sprites		;a459   ; pareja_de_sprites: los sprites C y C + 4 en (E, D)
sprites_dfea_columna:		; 8 parejas con el patron 0xF8 desde Y = 0x37, de 0x10 en 0x10
	ld e,037h		;a45c   ; desde Y = 0x37
	ld b,008h		;a45e   ; 8 parejas
pareja_f8:
	ld c,0f8h		;a460   ; el patron 0xF8
	call pareja_de_sprites		;a462   ; pareja_de_sprites: los sprites C y C + 4 en (E, D)
	ld a,e			;a465
	add a,010h		;a466   ; 0x10 mas abajo
	ld e,a			;a468
	djnz pareja_f8		;a469
	ret			;a46b
pareja_de_sprites:		; los sprites C y C + 4 en (E, D)
	call 05d41h		;a46c   ; pon_sprite: [E][D][C] en (HL): la Y, la X y el patron de un sprite de 0xDC00
	ld a,c			;a46f
	add a,004h		;a470   ; el patron siguiente
	ld c,a			;a472
	bit 2,a		;a473   ; hasta el bit 2
	jr nz,pareja_de_sprites		;a475   ; dos
	ret			;a477
colores_dfea:		; 9 parejas de colores: 16 de 8 y 16 de 0x47
	ld hl,0daa0h		;a478   ; desde el sprite 10
	ld de,0daa1h		;a47b
	ld b,009h		;a47e   ; 9 parejas
colores_8_47:
	push bc			;a480
	ld (hl),008h		;a481   ; 8...
	ld bc,0000fh		;a483   ; 16 lineas
	ldir		;a486
	inc hl			;a488
	inc de			;a489
	ld (hl),047h		;a48a   ; ...y 0x47
	ld bc,0000fh		;a48c
	ldir		;a48f
	inc hl			;a491
	inc de			;a492
	pop bc			;a493
	djnz colores_8_47		;a494
	ret			;a496
mosaico_que_cambia:		; el mosaico (cuadros / 2 & 3) de p11:A4A6 (p56, 10 x 2 en X = 0x10)
	ld a,(0ca03h)		;a497   ; lee el contador de cuadros (uno mas en cada interrupcion)
	rra			;a49a
	and 003h		;a49b   ; 0-3
mosaico_a4a6:
	ld hl,0a4a6h		;a49d   ; la tabla de p11:A4A6
	call 043f6h		;a4a0   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	jp 0714fh		;a4a3   ; mosaico_de_56_10x2: el mosaico de HL del banco 56 en X = 0x10, Y = 0x68, 10 x 2

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


e060_empieza:		; sin 0xE060 ni 0xDFE9, con Snake desde Y = 0x78: la ficha 0xE060 de p11:A4E5 (11 bytes), 0xD4E8 = 0 y el byte 0 = 8-0x0E al azar (0x0F pasa a 0x0A)
	ld a,(0e060h)		;a4ae   ; lee 1 con la ficha de 0xE063/0xE065 en la sala (p07:B29A; se coge)
	or a			;a4b1
	ret nz			;a4b2   ; con 0xE060, nada
	ld a,(0dfe9h)		;a4b3   ; lee el paso de lo de 0xDFE8 (p11:A3E6)
	or a			;a4b6   ; con 0xDFE9, nada
	ret nz			;a4b7   ; con 0xDFE9, nada
	ld a,(0cb03h)		;a4b8   ; lee la Y de Snake
	cp 078h		;a4bb   ; por encima de 0x78, nada
	ret c			;a4bd   ; por encima de 0x78, nada
	ld de,0e060h		;a4be   ; apunta a 1 con la ficha de 0xE063/0xE065 en la sala (p07:B29A; se coge)
	ld hl,0a4e5h		;a4c1   ; 11 bytes de p11:A4E5
	ld bc,0000bh		;a4c4   ; 11 bytes
	ldir		;a4c7
	ld hl,0d4e8h		;a4c9   ; 0xD4E8 = 0
	ld (hl),000h		;a4cc   ; 0xD4E8 = 0
	ld a,r		;a4ce   ; al azar...
	ld hl,0ca03h		;a4d0   ; apunta a el contador de cuadros (uno mas en cada interrupcion)
	ld b,(hl)			;a4d3
	rlca			;a4d4   ; R...
	rlca			;a4d5
	rlca			;a4d6
	xor (hl)			;a4d7   ; ...con los cuadros
	add a,b			;a4d8
	and 007h		;a4d9   ; ...8-0x0F...
	add a,008h		;a4db   ; 8-0x0F
	cp 00fh		;a4dd   ; el 0x0F...
	jr nz,pon_e060		;a4df   ; ...el 0x0F pasa a 0x0A
	ld a,00ah		;a4e1   ; ...pasa a 0x0A
pon_e060:
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


e060_paso:		; el paso 0xE061 (p11:A4F6)
	ld a,(0e061h)		;a4f0   ; lee el paso de la ficha 0xE060 (p11:A4F6)
	call 0424dh		;a4f3   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_A4F6: 4 destinos del despachador p00:424D (call en p11:A4F3, el
;   indice en A): A4FE, A50F, A530, A540; lo leen p11:A4F3 (8 bytes)
;   0xa4f6..0xa4fe  (8 bytes)
DATA_tabla_A4F6:
	defw 0a4feh,0a50fh,0a530h,0a540h	; a4f6  -> e060_paso_0 e060_paso_1 e060_paso_2 e060_paso_3

; ======================================================================
; CODIGO 0xa4fe..0xa70f  (529 bytes)
; ======================================================================


e060_paso_0:		; la velocidad en Y (0xE066) baja 0x30; mientras sea positiva, se mueve (p11:A54A); al pasar a negativa, el paso siguiente
	ld de,0ffd0h		;a4fe   ; 0x30 menos
	ld hl,(0e066h)		;a501   ; lee la velocidad en Y de la ficha 0xE060 y el byte siguiente (16 bits)
	add hl,de			;a504
	ld (0e066h),hl		;a505   ; guarda la velocidad en Y de la ficha 0xE060 y el byte siguiente (16 bits)
	rl h		;a508   ; negativa?
	jp nc,e060_sube		;a50a   ; e060_sube: se mueve; desde Y = 0x34, una vez (0xD4E8) el sonido 0x61
	jr e061_siguiente		;a50d
e060_paso_1:		; con 0xDFEA por debajo de 0x94: su X = 0xDFEA - 0x0C; por debajo de 0x38, velocidades 0x0200 en Y y 0xFE00 en X, y el paso siguiente
	ld a,(0dfeah)		;a50f   ; lee la X de lo de 0xDFE8 (no se pasa, p06:A2AA)
	cp 094h		;a512   ; desde 0x94, nada
	ret nc			;a514   ; desde 0x94, nada
	sub 00ch		;a515   ; 0xDFEA - 0x0C
	ld hl,0e065h		;a517
	ld (hl),a			;a51a
	cp 038h		;a51b   ; desde 0x38, nada mas
	ret nc			;a51d   ; desde 0x38, nada mas
	xor a			;a51e
	ld hl,0e066h		;a51f   ; la velocidad en Y...
	ld (hl),a			;a522
	inc hl			;a523
	ld (hl),002h		;a524   ; 0x0200 en Y
	inc hl			;a526   ; ...y en X
	ld (hl),a			;a527
	inc hl			;a528
	ld (hl),0feh		;a529   ; 0xFE00 en X
e061_siguiente:
	ld hl,0e061h		;a52b   ; apunta a el paso de la ficha 0xE060 (p11:A4F6)
	inc (hl)			;a52e
	ret			;a52f
e060_paso_2:		; se mueve; por debajo de X = 0x10, 8 cuadros y el paso siguiente
	call mueve_e060		;a530   ; mueve_e060: la Y (0xE062-0xE063) + la velocidad 0xE066 y la X (0xE064-0xE065) + 0xE068, en 8.8
	ld a,(0e065h)		;a533
	cp 010h		;a536   ; hasta X = 0x10
	ret nc			;a538
	ld hl,0e06ah		;a539
	ld (hl),008h		;a53c   ; 8 cuadros
	jr e061_siguiente		;a53e
e060_paso_3:		; al acabar la espera, 0xE060 = 0
	ld hl,0e06ah		;a540
	dec (hl)			;a543
	ret nz			;a544
	xor a			;a545   ; 0xE060 = 0
	ld (0e060h),a		;a546   ; guarda 1 con la ficha de 0xE063/0xE065 en la sala (p07:B29A; se coge)
	ret			;a549
e060_sube:		; se mueve; desde Y = 0x34, una vez (0xD4E8) el sonido 0x61
	call mueve_e060		;a54a   ; mueve_e060: la Y (0xE062-0xE063) + la velocidad 0xE066 y la X (0xE064-0xE065) + 0xE068, en 8.8
	ld a,(0e063h)		;a54d
	cp 034h		;a550   ; desde Y = 0x34
	ret c			;a552
	ld hl,0d4e8h		;a553
	ld a,(hl)			;a556
	or a			;a557
	ret nz			;a558   ; ya sono, nada
	ld (hl),001h		;a559   ; una vez
	jp 06c8bh		;a55b   ; sonido_61: pide el sonido 0x61
mueve_e060:		; la Y (0xE062-0xE063) + la velocidad 0xE066 y la X (0xE064-0xE065) + 0xE068, en 8.8
	ld hl,(0e066h)		;a55e   ; lee la velocidad en Y de la ficha 0xE060 y el byte siguiente (16 bits)
	ld d,h			;a561
	ld e,l			;a562
	ld hl,(0e062h)		;a563   ; lee la Y de la ficha 0xE060 (8.8) y el byte siguiente (16 bits)
	add hl,de			;a566   ; la Y + la velocidad
	ld (0e062h),hl		;a567   ; guarda la Y de la ficha 0xE060 (8.8) y el byte siguiente (16 bits)
	ld hl,(0e068h)		;a56a   ; lee la velocidad en X de la ficha 0xE060 y el byte siguiente (16 bits)
	ld d,h			;a56d
	ld e,l			;a56e
	ld hl,(0e064h)		;a56f   ; lee la X de la ficha 0xE060 (8.8) y el byte siguiente (16 bits)
	add hl,de			;a572   ; la X + la velocidad
	ld (0e064h),hl		;a573   ; guarda la X de la ficha 0xE060 (8.8) y el byte siguiente (16 bits)
	ret			;a576
e060_sprites_si:		; en la zona 6 por debajo de la sala 0x18, los sprites de 0xE060 (p11:A583)
	ld a,(0ca4ah)		;a577   ; lee la zona
	cp 006h		;a57a
	ret nz			;a57c   ; solo la zona 6...
	ld a,(0ca4bh)		;a57d   ; lee la sala de la zona
	cp 018h		;a580
	ret nc			;a582   ; ...por debajo de la sala 0x18
e060_sprites:		; con 0xE060 en la zona 6 sala 0x10: su sprite (p11:A5AB), sus colores (p11:A5BE) y lo de arriba oculto (p11:A5D9); sin el, los sprites 28-29 fuera
	ld a,(0e060h)		;a583   ; lee 1 con la ficha de 0xE063/0xE065 en la sala (p07:B29A; se coge)
	or a			;a586
	jr z,sin_sprites_e060		;a587   ; sin 0xE060, sin sprites
	ld a,(0ca4ah)		;a589   ; lee la zona
	cp 006h		;a58c
	ret nz			;a58e
	ld a,(0ca4bh)		;a58f   ; lee la sala de la zona
	cp 010h		;a592
	ret nz			;a594   ; solo la sala 0x10
	call sprite_e060		;a595   ; sprite_e060: los sprites 28-29 en su Y y X con el patron 0xE8
	call colores_e060		;a598   ; colores_e060: 16 lineas de color 7 y 16 del 0x40 + 0xE06B
	jr e060_oculto		;a59b
sin_sprites_e060:
	ld hl,0dc70h		;a59d   ; los sprites 28-29...
	ld de,0dc71h		;a5a0
	ld (hl),0e0h		;a5a3   ; ...a 0xE0
	ld bc,00007h		;a5a5
	ldir		;a5a8
	ret			;a5aa
sprite_e060:		; los sprites 28-29 en su Y y X con el patron 0xE8
	ld hl,0dc70h		;a5ab   ; el sprite 28
	ld a,(0e063h)		;a5ae
	ld e,a			;a5b1
	ld a,(0e065h)		;a5b2
	ld d,a			;a5b5
	ld c,0e8h		;a5b6   ; el patron 0xE8
	call 05d41h		;a5b8   ; pon_sprite: [E][D][C] en (HL): la Y, la X y el patron de un sprite de 0xDC00
	jp 05d3dh		;a5bb   ; pon_sprite_mas_4: p00:5D41 con el patron C + 4
colores_e060:		; 16 lineas de color 7 y 16 del 0x40 + 0xE06B
	ld hl,0dbc0h		;a5be   ; los colores del sprite 28...
	ld de,0dbc1h		;a5c1
	ld (hl),007h		;a5c4   ; ...al 7
	ld bc,0000fh		;a5c6
	ldir		;a5c9
	inc hl			;a5cb
	inc de			;a5cc
	ld a,(0e06bh)		;a5cd   ; los del 29: 0x40 + 0xE06B
	add a,040h		;a5d0
	ld (hl),a			;a5d2
	ld bc,0000fh		;a5d3
	ldir		;a5d6
	ret			;a5d8
e060_oculto:		; por encima de Y = 0x32, las lineas de mas arriba de sus colores a 0 (hasta 0x10)
	ld a,(0e063h)		;a5d9
	sub 032h		;a5dc   ; por encima de 0x32...
	ret nc			;a5de   ; ...si no, nada
	neg		;a5df
	cp 010h		;a5e1   ; hasta 0x10 lineas
	jr c,lineas_a_0		;a5e3
	ld a,010h		;a5e5
lineas_a_0:
	ld c,a			;a5e7
	ld b,000h		;a5e8
	push bc			;a5ea
	ld hl,0dbc0h		;a5eb   ; los colores del 28...
	ld de,0dbc1h		;a5ee
	ld (hl),000h		;a5f1
	ldir		;a5f3
	pop bc			;a5f5
	ld hl,0dbd0h		;a5f6   ; ...y del 29 a 0
	ld de,0dbd1h		;a5f9
	ld (hl),000h		;a5fc
	ldir		;a5fe
	ret			;a600
cc00_y_aeb2:		; las fichas de 0xCC00 pintadas (p11:A607) y p11:AEB2
	call pinta_cc00		;a601   ; pinta_cc00: las 8 fichas activas de 0xCC00 de esta sala (p11:A63A): el fondo y su dibujo (p11:A652)
	jp marco_d760_si		;a604   ; marco_d760_si: con la ficha 0xD760 aqui (p11:AEFF), su marco (p11:AEB6)
pinta_cc00:		; las 8 fichas activas de 0xCC00 de esta sala (p11:A63A): el fondo y su dibujo (p11:A652)
	ld ix,0cc00h		;a607   ; apunta a 8 fichas de 16 bytes del arma 7 [sitio][paso][Y][X][fila][columna][cuenta] (p11:B380)
	ld b,008h		;a60b   ; 8 fichas
ficha_cc00_b:
	push bc			;a60d
	ld a,(ix+000h)		;a60e
	or a			;a611   ; libre: la siguiente
	call nz,pinta_ficha_cc00		;a612   ; pinta_ficha_cc00:
	ld de,00010h		;a615
	add ix,de		;a618
	pop bc			;a61a
	djnz ficha_cc00_b		;a61b
	ret			;a61d
cc00_cada_cuadro:		; las fichas activas de 0xCC00 de esta sala, su dibujo (p11:A655)
	ld ix,0cc00h		;a61e   ; apunta a 8 fichas de 16 bytes del arma 7 [sitio][paso][Y][X][fila][columna][cuenta] (p11:B380)
	ld b,008h		;a622   ; 8 fichas
ficha_cc00_c:
	ld a,(ix+000h)		;a624
	or a			;a627   ; libre: la siguiente
	jr z,siguiente_cc00		;a628
	push bc			;a62a
	call cc00_aqui		;a62b   ; cc00_aqui: Z si la ficha (p11:B4F3 da Z) esta en esta sala (bytes 4-5)
	call z,dibujo_cc00		;a62e   ; dibujo_cc00: 8 x 8 de (0, 0xB0) en su sitio (bytes 2-3) con la operacion 0xC8
	pop bc			;a631
siguiente_cc00:
	ld de,00010h		;a632
	add ix,de		;a635
	djnz ficha_cc00_c		;a637
	ret			;a639
cc00_aqui:		; Z si la ficha (p11:B4F3 da Z) esta en esta sala (bytes 4-5)
	push bc			;a63a
	call sitio_cc00		;a63b   ; sitio_cc00: Z si el byte 0 (sin el bit 7) es el sitio de Snake
	pop bc			;a63e
	ret nz			;a63f
	ld a,(0ca50h)		;a640   ; lee la fila de la sala en la zona (uno mas al salir por arriba)
	cp (ix+004h)		;a643   ; su fila...
	ret nz			;a646
	ld a,(0ca51h)		;a647   ; lee la columna de la sala en la zona (uno mas al salir por la derecha)
	cp (ix+005h)		;a64a   ; ...y columna
	ret			;a64d
pinta_ficha_cc00:
	call cc00_aqui		;a64e   ; cc00_aqui: Z si la ficha (p11:B4F3 da Z) esta en esta sala (bytes 4-5)
	ret nz			;a651
fondo_y_dibujo_cc00:
	call fondo_cc00		;a652   ; fondo_cc00: el fondo guardado (p11:A673) de la otra pagina a su sitio
dibujo_cc00:		; 8 x 8 de (0, 0xB0) en su sitio (bytes 2-3) con la operacion 0xC8
	ld e,(ix+002h)		;a655   ; su sitio
	ld d,(ix+003h)		;a658
	ld hl,000b0h		;a65b   ; el dibujo de (0, 0xB0)
	ld bc,00808h		;a65e   ; 8 x 8
	ld a,(0ca42h)		;a661   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	rlca			;a664
	rlca			;a665
	rlca			;a666
	rlca			;a667
	or 0c8h		;a668   ; con la operacion 0xC8
	jp 047edh		;a66a   ; copia_rectangulo_logica: orden LMMM del VDP con la operacion logica de A
fondo_cc00:		; el fondo guardado (p11:A673) de la otra pagina a su sitio
	call sitio_del_fondo		;a66d   ; sitio_del_fondo: HL = su sitio, DE = (0xC0 + (B - 1 & 3) * 8, 0xB0 o 0xB8), 8 x 8
	jp 0474dh		;a670   ; copia_rectangulo_a_esta: p00:4767 de la otra pagina (0xCA42 ^ 1) a la de 0xCA42
sitio_del_fondo:		; HL = su sitio, DE = (0xC0 + (B - 1 & 3) * 8, 0xB0 o 0xB8), 8 x 8
	dec b			;a673   ; la ficha B - 1...
	ld a,b			;a674
	and 004h		;a675
	ld a,b			;a677
	ld e,0b0h		;a678   ; ...las 0-3 en 0xB0...
	jr z,fondo_columna		;a67a
	ld e,0b8h		;a67c   ; ...las 4-7 en 0xB8
fondo_columna:
	and 003h		;a67e
	rlca			;a680
	rlca			;a681
	rlca			;a682
	add a,0c0h		;a683   ; X = 0xC0 + (B - 1 & 3) * 8
	ld d,a			;a685
	ld l,(ix+002h)		;a686   ; su sitio
	ld h,(ix+003h)		;a689
	ld bc,00808h		;a68c
	ret			;a68f
guarda_fondos_cc00:		; el fondo de cada ficha de 0xCC00 de esta sala guardado en la otra pagina
	ld ix,0cc00h		;a690   ; apunta a 8 fichas de 16 bytes del arma 7 [sitio][paso][Y][X][fila][columna][cuenta] (p11:B380)
	ld b,008h		;a694   ; 8 fichas
ficha_cc00_d:
	ld a,(ix+000h)		;a696
	or a			;a699
	jr z,siguiente_cc00_b		;a69a
	push bc			;a69c
	call cc00_aqui		;a69d   ; cc00_aqui: Z si la ficha (p11:B4F3 da Z) esta en esta sala (bytes 4-5)
	call z,guarda_fondo_cc00		;a6a0   ; guarda_fondo_cc00:
	pop bc			;a6a3
siguiente_cc00_b:
	ld de,00010h		;a6a4
	add ix,de		;a6a7
	djnz ficha_cc00_d		;a6a9
	ret			;a6ab
guarda_fondo_cc00:
	call sitio_del_fondo		;a6ac   ; sitio_del_fondo: HL = su sitio, DE = (0xC0 + (B - 1 & 3) * 8, 0xB0 o 0xB8), 8 x 8
	ex de,hl			;a6af
	jp 0475ah		;a6b0   ; copia_rectangulo_a_la_otra: p00:4767 de la pagina 0xCA42 a la otra
repinta_cc00:		; las fichas de 0xCC00 de esta sala: el fondo y el dibujo
	ld ix,0cc00h		;a6b3   ; apunta a 8 fichas de 16 bytes del arma 7 [sitio][paso][Y][X][fila][columna][cuenta] (p11:B380)
	ld b,008h		;a6b7   ; 8 fichas
ficha_cc00_e:
	ld a,(ix+000h)		;a6b9
	or a			;a6bc
	jr z,siguiente_cc00_c		;a6bd
	ld a,(0ca50h)		;a6bf   ; lee la fila de la sala en la zona (uno mas al salir por arriba)
	cp (ix+004h)		;a6c2   ; su fila...
	jr nz,siguiente_cc00_c		;a6c5
	ld a,(0ca51h)		;a6c7   ; lee la columna de la sala en la zona (uno mas al salir por la derecha)
	cp (ix+005h)		;a6ca   ; ...y columna
	jr nz,siguiente_cc00_c		;a6cd
	push bc			;a6cf
	push bc			;a6d0
	call fondo_cc00		;a6d1   ; fondo_cc00: el fondo guardado (p11:A673) de la otra pagina a su sitio
	pop bc			;a6d4
	call dibujo_cc00		;a6d5   ; dibujo_cc00: 8 x 8 de (0, 0xB0) en su sitio (bytes 2-3) con la operacion 0xC8
	pop bc			;a6d8
siguiente_cc00_c:
	ld de,00010h		;a6d9
	add ix,de		;a6dc
	djnz ficha_cc00_e		;a6de
	ret			;a6e0
disparo_cada_cuadro:		; fuera de los estados 9 y 0x0A: con 0xCB61, p11:A85C; sin 0xCB44, p11:A88F; lo de 0xCB20 (p11:A70F) o, sin el, con lo lanzado de tipo 5, p11:A89A, o lo de 0xCB52
	ld a,(0cb00h)		;a6e1   ; lee el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	cp 009h		;a6e4   ; el 9...
	ret z			;a6e6   ; el 9...
	cp 00ah		;a6e7   ; ...y el 0x0A
	ret z			;a6e9   ; ...y el 0x0A, nada
	ld a,(0cb61h)		;a6ea   ; lee 1 con una ficha de 0xCC80 puesta (p11:B59A)
	or a			;a6ed
	jp nz,sprites_cc80		;a6ee   ; con 0xCB61
	ld a,(0cb44h)		;a6f1   ; lee 1-2: el arma 0x0C en marcha (2 con 0xCB21 = 0x1D; p11:B211)
	or a			;a6f4
	call z,sin_sprites_4_9		;a6f5   ; sin 0xCB44
	ld a,(0cb20h)		;a6f8   ; lee lo que usa el disparo 1 (0 nada; p02:8001 elige por ello)
	or a			;a6fb
	jr nz,por_cb20		;a6fc   ; con 0xCB20, por el
	ld a,(0cb80h)		;a6fe   ; lee las 6 fichas de 16 bytes de lo que lanza Snake ([tipo][..][Y 8.8][X 8.8][velocidades]...)
	cp 005h		;a701   ; el 5
	jp z,sprites_lanzado_5		;a703   ; lo lanzado de tipo 5
	ld a,(0cb52h)		;a706   ; lo de 0xCB52
	or a			;a709
	ret z			;a70a   ; sin 0xCB52, nada
por_cb20:		; por 0xCB20 - 1 (p11:A70F)
	dec a			;a70b
	call 0424dh		;a70c   ; despachador: salta a la palabra A de la tabla que va detras del call

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


sprites_lanzado_1:		; las armas 1, 2, 4, 7, 9, 0x0C y 0x0D: un sprite por ficha de 0xCB80 activa (p11:A748) desde el 4 (0xDC10), patron 0x18, color 7
	ld ix,0cb80h		;a729   ; apunta a las 6 fichas de 16 bytes de lo que lanza Snake ([tipo][..][Y 8.8][X 8.8][velocidades]...)
	ld hl,0dc10h		;a72d   ; desde el sprite 4...
	ld de,0da40h		;a730   ; ...y sus colores
	ld b,006h		;a733   ; 6 fichas
ficha_cb80:
	push bc			;a735
	ld a,(ix+000h)		;a736   ; lee el tipo de lo lanzado por Snake
	or a			;a739   ; libre: la siguiente
	call nz,sprite_cb80		;a73a   ; activa: su sprite
	push de			;a73d
	ld de,00010h		;a73e
	add ix,de		;a741
	pop de			;a743
	pop bc			;a744
	djnz ficha_cb80		;a745
nada_a747:
	ret			;a747
sprite_cb80:		; el sprite de HL en su Y y X con el patron 0x18 y sus 16 colores al 7
	push de			;a748
	ld e,(ix+003h)		;a749   ; lee la Y de lo lanzado por Snake
	ld d,(ix+005h)		;a74c   ; lee la X de lo lanzado por Snake
	ld c,018h		;a74f   ; el patron 0x18
	call 05d41h		;a751   ; pon_sprite: [E][D][C] en (HL): la Y, la X y el patron de un sprite de 0xDC00
	pop de			;a754
	push hl			;a755
	ld a,007h		;a756   ; color 7
	ld bc,0000fh		;a758   ; 16 lineas
	ld h,d			;a75b
	ld l,e			;a75c
	call 04237h		;a75d   ; llena_bloque: pone A en BC + 1 bytes desde HL
	pop hl			;a760
	ret			;a761
sprites_lanzado_0b:		; el arma 0x0B: con la ficha 0 de tipo 8, su dibujo (p11:A77C), dos sprites en su sitio (p11:A792) y los colores (p11:A8BC)
	ld ix,0cb80h		;a762   ; apunta a las 6 fichas de 16 bytes de lo que lanza Snake ([tipo][..][Y 8.8][X 8.8][velocidades]...)
	ld a,(ix+000h)		;a766   ; lee el tipo de lo lanzado por Snake
	cp 008h		;a769   ; el tipo 8
	ret nz			;a76b   ; otro tipo, nada
	call dibujo_tipo_8		;a76c   ; dibujo_tipo_8: el dibujo (p11:A782) a (0, 0xF2) de la pagina 3 (p11:A8D4)
	ld a,(ix+00bh)		;a76f
	cp 003h		;a772
	jr c,sprites_tipo_8		;a774
sprites_tipo_8:
	call dos_sprites_20		;a776   ; dos_sprites_20: los sprites 4-5 en su sitio con el patron 0x20
	jp colores_7_48		;a779   ; colores_7_48: los colores del sprite 4 al 7 y los del 5 al 0x48
dibujo_tipo_8:		; el dibujo (p11:A782) a (0, 0xF2) de la pagina 3 (p11:A8D4)
	call sitio_dibujo_8		;a77c   ; sitio_dibujo_8: HL = (0 u 0x80 con el byte 0x0F, 0xBF + el byte 0x0B)
	jp dibujo_a_la_3		;a77f   ; dibujo_a_la_3: 0x80 x 1 de HL a (0, 0xF2) de la pagina 3 (desde la 1)
sitio_dibujo_8:		; HL = (0 u 0x80 con el byte 0x0F, 0xBF + el byte 0x0B)
	ld a,(ix+00bh)		;a782
	add a,0bfh		;a785   ; + 0xBF
	ld l,a			;a787
	ld h,000h		;a788
	ld a,(ix+00fh)		;a78a
	or a			;a78d
	ret z			;a78e   ; sin el byte 0x0F, de la izquierda
	ld h,080h		;a78f   ; con el, X = 0x80
	ret			;a791
dos_sprites_20:		; los sprites 4-5 en su sitio con el patron 0x20
	ld e,(ix+003h)		;a792   ; lee la Y de lo lanzado por Snake
	ld d,(ix+005h)		;a795   ; lee la X de lo lanzado por Snake
	ld hl,0dc10h		;a798
	ld c,020h		;a79b   ; el patron 0x20
	call 05d41h		;a79d   ; pon_sprite: [E][D][C] en (HL): la Y, la X y el patron de un sprite de 0xDC00
	jp 05d3dh		;a7a0   ; pon_sprite_mas_4: p00:5D41 con el patron C + 4
sprites_lanzado_0a:		; el arma 0x0A: con la ficha 0 de tipo 7, colores 7 y 0x48, y los sprites con el patron 0x20
	ld bc,00748h		;a7a3   ; el tipo 7, color 0x48
	jr ficha_0_tipo_b		;a7a6
sprites_lanzado_3:		; el arma 3: la mira (p11:A7E3) y, con la ficha 0 de tipo 3, colores 7 y 0x4E, y los sprites
	ld bc,0034eh		;a7a8   ; el tipo 3, color 0x4E
	push bc			;a7ab
	call mira		;a7ac   ; mira: fuera de los estados 2, 5, 0x0B y 0x0F, sin 0xCB21 = 2, sin fichas de 0xDF80 y sin nada lanzado: el sprite 6 en X = 0xCB23, Y = 0xCB22 con el patron 0x1C y color 7 (con las dos por debajo de 0xB1)
	pop bc			;a7af
ficha_0_tipo_b:
	ld ix,0cb80h		;a7b0   ; apunta a las 6 fichas de 16 bytes de lo que lanza Snake ([tipo][..][Y 8.8][X 8.8][velocidades]...)
	ld a,(ix+000h)		;a7b4   ; la ficha 0 de tipo B...
	cp b			;a7b7   ; su tipo?
	ret nz			;a7b8
	call colores_7_c		;a7b9   ; ...sus colores
sprites_patron_20:		; los sprites 4-5 en el sitio de la ficha con el patron 0x20
	ld hl,0dc10h		;a7bc
	ld e,(ix+003h)		;a7bf   ; lee la Y de lo lanzado por Snake
	ld d,(ix+005h)		;a7c2   ; lee la X de lo lanzado por Snake
	ld c,020h		;a7c5   ; el patron 0x20
	call 05d41h		;a7c7   ; pon_sprite: [E][D][C] en (HL): la Y, la X y el patron de un sprite de 0xDC00
	jp 05d3dh		;a7ca   ; pon_sprite_mas_4: p00:5D41 con el patron C + 4
colores_7_c:		; los colores del sprite 4 al 7 y los del 5 al C
	push bc			;a7cd
	ld hl,0da40h		;a7ce
	ld a,007h		;a7d1   ; el 7...
	ld bc,0000fh		;a7d3
	call 04237h		;a7d6   ; llena_bloque: pone A en BC + 1 bytes desde HL
	inc hl			;a7d9
	inc de			;a7da
	pop bc			;a7db
	ld a,c			;a7dc   ; ...y C
	ld bc,0000fh		;a7dd
	jp 04237h		;a7e0   ; llena_bloque: pone A en BC + 1 bytes desde HL
mira:		; fuera de los estados 2, 5, 0x0B y 0x0F, sin 0xCB21 = 2, sin fichas de 0xDF80 y sin nada lanzado: el sprite 6 en X = 0xCB23, Y = 0xCB22 con el patron 0x1C y color 7 (con las dos por debajo de 0xB1)
	ld a,(0cb00h)		;a7e3   ; lee el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	cp 002h		;a7e6
	ret z			;a7e8   ; el 2...
	cp 005h		;a7e9
	ret z			;a7eb   ; ...el 5...
	cp 00bh		;a7ec
	ret z			;a7ee   ; ...el 0x0B...
	cp 00fh		;a7ef
	ret z			;a7f1   ; ...y el 0x0F, nada
	ld a,(0cb21h)		;a7f2   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	cp 002h		;a7f5
	ret z			;a7f7   ; con 2 en 0xCB21, nada
	call sin_df80		;a7f8   ; sin_df80: acarreo si las 8 fichas de 0xDF80 estan libres
	ret nc			;a7fb   ; con fichas de 0xDF80, nada
	ld a,(0cb80h)		;a7fc   ; lee las 6 fichas de 16 bytes de lo que lanza Snake ([tipo][..][Y 8.8][X 8.8][velocidades]...)
	or a			;a7ff   ; con algo lanzado, nada
	ret nz			;a800   ; con algo lanzado, nada
	ld a,(0cb22h)		;a801   ; la Y de 0xCB22...
	cp 0b1h		;a804   ; fuera, nada
	ret nc			;a806
	ld e,a			;a807
	ld a,(0cb23h)		;a808   ; ...la X de 0xCB23
	cp 0b1h		;a80b   ; fuera, nada
	ret nc			;a80d
	ld d,a			;a80e
	ld hl,0dc18h		;a80f   ; el sprite 6
	ld c,01ch		;a812   ; el patron 0x1C
	call 05d41h		;a814   ; pon_sprite: [E][D][C] en (HL): la Y, la X y el patron de un sprite de 0xDC00
	ld hl,0da60h		;a817   ; su color 7
	ld a,007h		;a81a
	ld bc,0000fh		;a81c
	jp 04237h		;a81f   ; llena_bloque: pone A en BC + 1 bytes desde HL
sin_df80:		; acarreo si las 8 fichas de 0xDF80 estan libres
	ld hl,0df80h		;a822   ; apunta a 8 fichas de 8 bytes [tipo][dibujo][Y][X][fila][columna][espera][grafico] que suenan 0x14 en la sala y 0x15 al lado
	ld b,008h		;a825   ; 8 fichas
	ld de,00008h		;a827
mira_df80:
	ld a,(hl)			;a82a
	or a			;a82b
	ret nz			;a82c   ; alguna: sin acarreo
	add hl,de			;a82d
	djnz mira_df80		;a82e
	scf			;a830   ; ninguna: acarreo
	ret			;a831
sprites_lanzado_6:		; el arma 6: con la ficha 0 de tipo 6, su dibujo (p11:A845), los sprites y los colores
	ld ix,0cb80h		;a832   ; apunta a las 6 fichas de 16 bytes de lo que lanza Snake ([tipo][..][Y 8.8][X 8.8][velocidades]...)
	ld a,(ix+000h)		;a836   ; lee el tipo de lo lanzado por Snake
	cp 006h		;a839   ; el tipo 6
	ret nz			;a83b   ; otro tipo, nada
	call dibujo_tipo_6		;a83c   ; dibujo_tipo_6:
	call sprites_patron_20		;a83f   ; sprites_patron_20: los sprites 4-5 en el sitio de la ficha con el patron 0x20
	jp colores_7_48		;a842   ; colores_7_48: los colores del sprite 4 al 7 y los del 5 al 0x48
dibujo_tipo_6:
	call sitio_dibujo_6		;a845   ; sitio_dibujo_6: HL = (0 u 0x80 segun el bit 0 del byte 0x0B, 0xC0 o 0xC1 desde 3)
	jp dibujo_a_la_3		;a848   ; dibujo_a_la_3: 0x80 x 1 de HL a (0, 0xF2) de la pagina 3 (desde la 1)
sitio_dibujo_6:		; HL = (0 u 0x80 segun el bit 0 del byte 0x0B, 0xC0 o 0xC1 desde 3)
	ld l,0c0h		;a84b
	ld a,(ix+00bh)		;a84d   ; desde 3...
	cp 003h		;a850
	jr c,mitad_dibujo		;a852
sitio_c1:
	inc l			;a854   ; ...0xC1
mitad_dibujo:
	ld h,000h		;a855
	rra			;a857   ; el bit 0...
	ret c			;a858
	ld h,080h		;a859   ; ...X = 0x80
	ret			;a85b
sprites_cc80:		; el arma 8 (y con 0xCB61): las 16 fichas de 0xCC80 activas en el paso 0, sus sprites (patron 0x20) y colores
	ld ix,0cc80h		;a85c   ; apunta a 16 fichas de 8 bytes del arma 8 [sitio][paso][Y][X][fila][columna] (p11:B574)
	ld b,010h		;a860   ; 16 fichas
ficha_cc80_b:
	push bc			;a862
	ld a,(ix+000h)		;a863
	or a			;a866   ; libre: la siguiente
	call nz,sprite_cc80		;a867   ; sprite_cc80: en el paso 0: los sprites (p11:A87E) y los colores
	ld de,00008h		;a86a
	add ix,de		;a86d   ; la siguiente (8 bytes)
	pop bc			;a86f
	djnz ficha_cc80_b		;a870
	ret			;a872
sprite_cc80:		; en el paso 0: los sprites (p11:A87E) y los colores
	ld a,(ix+001h)		;a873
	or a			;a876
	ret nz			;a877   ; fuera del paso 0, nada
	call sprite_cc80_b		;a878   ; sprite_cc80_b: los sprites 4-5 en su sitio (bytes 2-3) con el patron 0x20
	jp colores_7_48		;a87b   ; colores_7_48: los colores del sprite 4 al 7 y los del 5 al 0x48
sprite_cc80_b:		; los sprites 4-5 en su sitio (bytes 2-3) con el patron 0x20
	ld hl,0dc10h		;a87e
	ld e,(ix+002h)		;a881   ; su sitio
	ld d,(ix+003h)		;a884
	ld c,020h		;a887   ; el patron 0x20
	call 05d41h		;a889   ; pon_sprite: [E][D][C] en (HL): la Y, la X y el patron de un sprite de 0xDC00
	jp 05d3dh		;a88c   ; pon_sprite_mas_4: p00:5D41 con el patron C + 4
sin_sprites_4_9:		; los sprites 4-9 (0xDC10-0xDC27) fuera
	ld hl,0dc10h		;a88f
	ld a,0e0h		;a892
	ld bc,00017h		;a894   ; 24 bytes
	jp 04237h		;a897   ; llena_bloque: pone A en BC + 1 bytes desde HL
sprites_lanzado_5:		; el arma 5 (o lo lanzado de tipo 5): con 0xCAAB, a cero y nada; si no, la mira (p11:A8EE) y, con la ficha 0 por encima de Y = 0xC0 y su byte 0x0F, su dibujo, los sprites y los colores 7 y 0x48
	ld hl,0caabh		;a89a   ; apunta a 1 al soltar lo lanzado de tipo 5 (p11:B0ED)
	ld a,(hl)			;a89d
	or a			;a89e
	jr z,lanzado_5		;a89f   ; con 0xCAAB...
	ld (hl),000h		;a8a1   ; ...a cero y nada
	ret			;a8a3
lanzado_5:
	ld ix,0cb80h		;a8a4   ; apunta a las 6 fichas de 16 bytes de lo que lanza Snake ([tipo][..][Y 8.8][X 8.8][velocidades]...)
	call mira_de_5		;a8a8   ; la mira
	ld a,(ix+003h)		;a8ab   ; lee la Y de lo lanzado por Snake
	cp 0c0h		;a8ae   ; fuera por abajo, nada
	ret nc			;a8b0   ; fuera por abajo, nada
	ld a,(ix+00fh)		;a8b1
	or a			;a8b4   ; sin el byte 0x0F, nada
	ret z			;a8b5   ; sin el byte 0x0F, nada
	call dibujo_tipo_5		;a8b6   ; dibujo_tipo_5:
	call sprites_patron_20		;a8b9   ; sprites_patron_20: los sprites 4-5 en el sitio de la ficha con el patron 0x20
colores_7_48:		; los colores del sprite 4 al 7 y los del 5 al 0x48
	ld hl,0da40h		;a8bc
	ld bc,0000fh		;a8bf
	ld a,007h		;a8c2   ; el sprite 4 al 7...
	call 04237h		;a8c4   ; llena_bloque: pone A en BC + 1 bytes desde HL
	inc de			;a8c7
	inc hl			;a8c8
	ld bc,0000fh		;a8c9
	ld a,048h		;a8cc   ; ...el 5 al 0x48
	jp 04237h		;a8ce   ; llena_bloque: pone A en BC + 1 bytes desde HL
dibujo_tipo_5:
	call sitio_dibujo_5		;a8d1   ; sitio_dibujo_5: con el byte 0x0F, HL segun el (p11:A855 o A854)
dibujo_a_la_3:		; 0x80 x 1 de HL a (0, 0xF2) de la pagina 3 (desde la 1)
	ld de,000f2h		;a8d4   ; a (0, 0xF2)...
	ld bc,08001h		;a8d7   ; ...0x80 x 1...
	ld a,007h		;a8da   ; ...de la pagina 1 a la 3
	jp 04767h		;a8dc   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
sitio_dibujo_5:		; con el byte 0x0F, HL segun el (p11:A855 o A854)
	ld a,(ix+00fh)		;a8df
	or a			;a8e2
	ret z			;a8e3   ; sin el, nada
	ld l,0c0h		;a8e4
	cp 003h		;a8e6   ; por debajo de 3, 0xC0; si no, 0xC1
	jp c,mitad_dibujo		;a8e8   ; mitad_dibujo:
	jp sitio_c1		;a8eb   ; sitio_c1:
mira_de_5:		; el sprite 6 en (byte 0x0C - 7, byte 0x0D - 7) (Y = 0xE0 con 0xCB21 = 2) con el patron 0x1C y color 7
	ld hl,0dc18h		;a8ee
	ld a,(ix+00ch)		;a8f1   ; la Y de la mira - 7
	sub 007h		;a8f4
	ld e,a			;a8f6
	ld a,(0cb21h)		;a8f7   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	cp 002h		;a8fa
	jr nz,x_de_la_mira		;a8fc   ; sin 0xCB21 = 2, sigue
	ld e,0e0h		;a8fe   ; con 2, fuera
x_de_la_mira:
	ld a,(ix+00dh)		;a900   ; la X - 7
	sub 007h		;a903
	ld d,a			;a905
	ld c,01ch		;a906   ; el patron 0x1C
	call 05d41h		;a908   ; pon_sprite: [E][D][C] en (HL): la Y, la X y el patron de un sprite de 0xDC00
	ld hl,0da60h		;a90b
	ld a,007h		;a90e   ; su color 7
	ld bc,0000fh		;a910
	jp 04237h		;a913   ; llena_bloque: pone A en BC + 1 bytes desde HL
df80_de_la_sala_b322:		; las fichas activas de 0xDF80 de esta sala con algo en el byte 7: p03:B322
	ld ix,0df80h		;a916   ; apunta a 8 fichas de 8 bytes [tipo][dibujo][Y][X][fila][columna][espera][grafico] que suenan 0x14 en la sala y 0x15 al lado
	ld b,008h		;a91a   ; 8 fichas
ficha_df80_b322:
	ld a,(ix+000h)		;a91c
	and 07fh		;a91f
	jr z,siguiente_df80_b322		;a921   ; libre: la siguiente
	ld a,(ix+007h)		;a923
	and 00fh		;a926
	jr z,siguiente_df80_b322		;a928   ; sin el byte 7, la siguiente
	ld a,(0ca50h)		;a92a   ; lee la fila de la sala en la zona (uno mas al salir por arriba)
	cp (ix+004h)		;a92d   ; su fila...
	jr nz,siguiente_df80_b322		;a930
	ld a,(0ca51h)		;a932   ; lee la columna de la sala en la zona (uno mas al salir por la derecha)
	cp (ix+005h)		;a935   ; ...y columna
	jr nz,siguiente_df80_b322		;a938
	push bc			;a93a
	call 08f3eh		;a93b   ; a_p03_b322: p03:B322 con el banco 3 en 0xA000
	pop bc			;a93e
siguiente_df80_b322:
	ld de,00008h		;a93f
	add ix,de		;a942
	djnz ficha_df80_b322		;a944
	ret			;a946
df80_de_la_sala_b289:		; las fichas activas de 0xDF80 de esta sala con algo en el byte 7: p03:B289 y p03:B3A6
	ld ix,0df80h		;a947   ; apunta a 8 fichas de 8 bytes [tipo][dibujo][Y][X][fila][columna][espera][grafico] que suenan 0x14 en la sala y 0x15 al lado
	ld b,008h		;a94b   ; 8 fichas
ficha_df80_b289:
	ld a,(ix+000h)		;a94d
	and 07fh		;a950
	jr z,siguiente_df80_b289		;a952   ; libre: la siguiente
	ld a,(ix+007h)		;a954
	and 00fh		;a957
	jr z,siguiente_df80_b289		;a959   ; sin el byte 7, la siguiente
	ld a,(0ca50h)		;a95b   ; lee la fila de la sala en la zona (uno mas al salir por arriba)
	cp (ix+004h)		;a95e   ; su fila...
	jr nz,siguiente_df80_b289		;a961
	ld a,(0ca51h)		;a963   ; lee la columna de la sala en la zona (uno mas al salir por la derecha)
	cp (ix+005h)		;a966   ; ...y columna
	jr nz,siguiente_df80_b289		;a969
	push bc			;a96b
	push bc			;a96c
	call 08f36h		;a96d   ; a_p03_b289: p03:B289 con el banco 3 en 0xA000
	pop bc			;a970
	call 08f2eh		;a971   ; a_p03_b3a6: p03:B3A6 con el banco 3 en 0xA000
	pop bc			;a974
siguiente_df80_b289:
	ld de,00008h		;a975
	add ix,de		;a978
	djnz ficha_df80_b289		;a97a
	ret			;a97c
arma_1:		; el arma 1: con el disparo 1 recien pulsado, en la primera ficha libre de 0xCB80: 0xD752 = 1, el tipo 1, el paso 0, p02:8F5D, p02:8F4E con p11:BEDC, su sitio de salida (bytes 0x0A-0x0B), con la cosa 0x0D a cero p03:AF05, y el sonido (p11:AA11)
	ld a,(0ca07h)		;a97d   ; lee lo recien pulsado del mando (los bits de 0xCA08 que no estaban)
	and 010h		;a980   ; el disparo 1
	ret z			;a982   ; sin disparo, nada
	ld b,006h		;a983   ; 6 fichas
libre_cb80:
	ld a,(ix+000h)		;a985   ; lee el tipo de lo lanzado por Snake
	or a			;a988
	jr z,pon_arma_1		;a989   ; libre: esa
	ld de,00010h		;a98b   ; la siguiente
	add ix,de		;a98e   ; la siguiente (16 bytes)
	djnz libre_cb80		;a990
	ret			;a992   ; ninguna libre, nada
pon_arma_1:
	ld a,001h		;a993
	ld (0d752h),a		;a995   ; 0xD752 = 1
	ld (ix+000h),001h		;a998   ; el tipo de lo lanzado por Snake = 0x01
	ld (ix+001h),000h		;a99c   ; el paso de lo lanzado por Snake = 0x00
	call 08f5dh		;a9a0   ; su sitio
	ld hl,0bedch		;a9a3   ; su velocidad de p11:BEDC
	call 08f4eh		;a9a6   ; p02:8F4E
	ld a,(ix+003h)		;a9a9   ; la Y de salida...
	ld (ix+00ah),a		;a9ac   ; la Y de salida
	ld a,(ix+005h)		;a9af   ; ...y la X
	ld (ix+00bh),a		;a9b2   ; la X de salida
	ld a,(0d634h)		;a9b5   ; la cosa 0x0D...
	or a			;a9b8
	call z,08f70h		;a9b9   ; sin la 0x0D, los actores acuden
	jp sonido_de_disparo		;a9bc   ; sonido_de_disparo: el sonido 0x0D; con la cosa 0x0D, el 0x3A
lanzado_1_paso:		; lo lanzado de tipo 1: p11:AA60
	jp lanzado_1_lejos		;a9bf   ; lanzado_1_lejos: lo lanzado de tipo 1 se acaba a 0x40 de su salida (bytes 0x0A-0x0B) en Y o en X
arma_2:		; el arma 2: cada 3 cuadros (0xD750) en la primera ficha libre: 0xD752 = 1, el tipo 2, su sitio, su velocidad (p11:AA1B, 8 por direccion), la salida, con la cosa 0x0D a cero p03:AF05, el sonido y 0xD751 de 0 a 7
	ld hl,0d750h		;a9c2   ; apunta a la cuenta de 3 cuadros del arma 2
	ld a,(hl)			;a9c5
	or a			;a9c6   ; la cuenta...
	jr z,L_A9CB		;a9c7   ; la cuenta...
	dec (hl)			;a9c9   ; ...uno menos
	ret			;a9ca
L_A9CB:
	ld (hl),002h		;a9cb   ; otros 2
	ld b,006h		;a9cd   ; 6 fichas
libre_cb80_b:
	ld a,(ix+000h)		;a9cf   ; lee el tipo de lo lanzado por Snake
	or a			;a9d2
	jr z,pon_arma_2		;a9d3   ; libre: esa
	ld de,00010h		;a9d5
	add ix,de		;a9d8
	djnz libre_cb80_b		;a9da
	ret			;a9dc
pon_arma_2:
	ld a,001h		;a9dd
	ld (0d752h),a		;a9df   ; guarda 1 al disparar algo (p11:A995)
	ld (ix+000h),002h		;a9e2   ; el tipo de lo lanzado por Snake = 0x02
	ld (ix+001h),000h		;a9e6   ; el paso de lo lanzado por Snake = 0x00
	call 08f5dh		;a9ea   ; p02:8F5D
	call velocidad_arma_2		;a9ed   ; su velocidad
	ld a,(ix+003h)		;a9f0   ; lee la Y de lo lanzado por Snake
	ld (ix+00ah),a		;a9f3   ; la Y de salida
	ld a,(ix+005h)		;a9f6   ; lee la X de lo lanzado por Snake
	ld (ix+00bh),a		;a9f9   ; la X de salida
	ld a,(0d634h)		;a9fc
	or a			;a9ff
	call z,08f70h		;aa00   ; a_p03_af05_2: p03:AF05 con el banco 3 en 0xA000
	call sonido_de_disparo		;aa03   ; sonido_de_disparo: el sonido 0x0D; con la cosa 0x0D, el 0x3A
	ld hl,0d751h		;aa06   ; apunta a el disparo del arma 2 (0-7, su velocidad en p11:AA40)
	inc (hl)			;aa09   ; 0xD751 uno mas...
	ld a,(hl)			;aa0a
	cp 008h		;aa0b   ; hasta 8...
	ret c			;aa0d
	xor a			;aa0e   ; ...de 8 a 0
	ld (hl),a			;aa0f   ; ...de 8 a 0
	ret			;aa10
sonido_de_disparo:		; el sonido 0x0D; con la cosa 0x0D, el 0x3A
	ld a,(0d634h)		;aa11
	or a			;aa14   ; sin la 0x0D, el 0x0D
	jp z,06a25h		;aa15   ; sonido_0d: pide el sonido 0x0D
	jp 06afeh		;aa18   ; sonido_3a: pide el sonido 0x3A
velocidad_arma_2:		; la velocidad de p11:AA40 (8 por direccion de Snake, por 0xD751) en los bytes 6-9 (p02:8F63 con B = 8)
	ld a,(0cb0eh)		;aa1b   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	dec a			;aa1e
	add a,a			;aa1f   ; direccion * 8
	add a,a			;aa20
	add a,a			;aa21
	ld b,a			;aa22   ; la direccion * 8...
	ld a,(0d751h)		;aa23   ; lee el disparo del arma 2 (0-7, su velocidad en p11:AA40)
	add a,b			;aa26   ; ...+ 0xD751
	ld hl,0aa40h		;aa27
	call 0423eh		;aa2a   ; suma_a_hl: HL = HL + A
	ld a,(hl)			;aa2d
	ld b,008h		;aa2e   ; la velocidad 8
	call 08f63h		;aa30   ; dos_palabras_por_b_b_1_2_11: dos_palabras_por_b y deja los bancos 1, 2 y 11
	ld (ix+006h),e		;aa33   ; guarda la velocidad en Y de lo lanzado por Snake (baja)
	ld (ix+007h),d		;aa36   ; guarda la velocidad en Y de lo lanzado por Snake (alta)
	ld (ix+008h),l		;aa39   ; guarda la velocidad en X de lo lanzado por Snake (baja)
	ld (ix+009h),h		;aa3c   ; guarda la velocidad en X de lo lanzado por Snake (alta)
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


lanzado_1_lejos:		; lo lanzado de tipo 1 se acaba a 0x40 de su salida (bytes 0x0A-0x0B) en Y o en X
	ld a,(ix+00ah)		;aa60   ; la Y de salida...
	sub (ix+003h)		;aa63   ; lo que se aleja en Y...
	jr nc,lejos_en_y		;aa66
	neg		;aa68   ; en positivo
lejos_en_y:		; ...desde 0x40, fuera
	cp 040h		;aa6a
	jr nc,fuera_lanzado_1		;aa6c   ; lejos: fuera
	ld a,(ix+00bh)		;aa6e   ; en X...
	sub (ix+005h)		;aa71   ; le resta la X de lo lanzado por Snake
	jr nc,lejos_en_x		;aa74
	neg		;aa76   ; en positivo
lejos_en_x:		; ...por debajo de 0x40, sigue
	cp 040h		;aa78
	ret c			;aa7a   ; cerca: sigue
fuera_lanzado_1:
	xor a			;aa7b   ; fuera
	ld (ix+000h),a		;aa7c   ; guarda el tipo de lo lanzado por Snake
	ret			;aa7f
arma_6:		; el arma 6: en la zona 0x12 sala 8, el sonido 0x5C; si no, si la ficha no es ya de tipo 6: el tipo 6, el paso 0, 0xCACF = 0, 0xD752 = 1, su sitio, la direccion de Snake al byte 0x0B, su velocidad de p11:BECC y el sonido 0x21
	ld a,(0ca4ah)		;aa80   ; lee la zona
	cp 012h		;aa83   ; la zona 0x12...
	jr nz,pon_arma_6		;aa85
	ld a,(0ca4bh)		;aa87   ; lee la sala de la zona
	cp 008h		;aa8a   ; en la zona 0x12 sala 8, no
	jp z,06c77h		;aa8c   ; sonido_5c: pide el sonido 0x5C
pon_arma_6:
	ld a,(ix+000h)		;aa8f   ; lee el tipo de lo lanzado por Snake
	cp 006h		;aa92   ; el tipo 6...
	ret z			;aa94   ; ya puesta, nada
	ld (ix+000h),006h		;aa95   ; el tipo de lo lanzado por Snake = 0x06
	xor a			;aa99
	ld (ix+001h),a		;aa9a   ; guarda el paso de lo lanzado por Snake
	ld (0cacfh),a		;aa9d   ; 0xCACF = 0
	inc a			;aaa0
	ld (0d752h),a		;aaa1   ; 0xD752 = 1
	call 08f5dh		;aaa4   ; su sitio
	ld hl,0becch		;aaa7   ; la tabla de p11:BECC
	ld a,(0cb0eh)		;aaaa   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ld (ix+00bh),a		;aaad   ; la direccion al byte 0x0B
	call 08f4eh		;aab0   ; su velocidad
	jp 06a7fh		;aab3   ; sonido_21: pide el sonido 0x21
lanzado_6_mando:		; lo lanzado de tipo 6 cambia de direccion con el mando (1 arriba, 2 abajo, 3 izquierda, 4 derecha) con su velocidad de p11:BECC y 0xCACF = 1
	ld a,(0ca07h)		;aab6   ; lee lo recien pulsado del mando (los bits de 0xCA08 que no estaban)
	and 00fh		;aab9   ; las direcciones recien pulsadas
	ret z			;aabb   ; sin direccion, nada
	ld b,001h		;aabc   ; 1 arriba...
	rra			;aabe
	jr c,direccion_lanzado_6		;aabf
	inc b			;aac1   ; ...2 abajo...
	rra			;aac2
	jr c,direccion_lanzado_6		;aac3
	inc b			;aac5   ; ...3 izquierda...
	rra			;aac6
	jr c,direccion_lanzado_6		;aac7
	inc b			;aac9   ; ...4 derecha
direccion_lanzado_6:
	ld a,b			;aaca
	ld (ix+00bh),a		;aacb   ; la direccion
	ld hl,0becch		;aace   ; su velocidad
	call 08f53h		;aad1   ; p02:8F53
	ld a,001h		;aad4
	ld (0cacfh),a		;aad6   ; 0xCACF = 1
	ret			;aad9
arma_0b:		; el arma 0x0B: en la zona 0x12 sala 8, el sonido 0x5C; si no, si la ficha 0 no es de tipo 8: el tipo 8 a cero (paso, partes bajas, bytes 0x0C, 0x0E y 0x0F), 0xD752 = 1, en el sitio de Snake (Y + 0xCB43 - 8 y X, de 8 en 8), su direccion (bytes 0x0A-0x0B), la velocidad de p11:BEBC y el sonido 0x24
	ld a,(0ca4ah)		;aada   ; lee la zona
	cp 012h		;aadd   ; la zona 0x12...
	jr nz,pon_arma_0b		;aadf
	ld a,(0ca4bh)		;aae1   ; lee la sala de la zona
	cp 008h		;aae4   ; ...sala 8
	jp z,06c77h		;aae6   ; sonido_5c: pide el sonido 0x5C
pon_arma_0b:
	ld ix,0cb80h		;aae9   ; apunta a las 6 fichas de 16 bytes de lo que lanza Snake ([tipo][..][Y 8.8][X 8.8][velocidades]...)
	ld a,(ix+000h)		;aaed   ; lee el tipo de lo lanzado por Snake
	cp 008h		;aaf0   ; el tipo 8...
	ret z			;aaf2   ; ya puesta, nada
	ld (ix+000h),008h		;aaf3   ; el tipo de lo lanzado por Snake = 0x08
	xor a			;aaf7
	ld (ix+001h),a		;aaf8   ; guarda el paso de lo lanzado por Snake
	ld (ix+002h),a		;aafb
	ld (ix+004h),a		;aafe
	ld (ix+00fh),a		;ab01
	ld (ix+00eh),a		;ab04
	ld (ix+00ch),a		;ab07
	inc a			;ab0a
	ld (0d752h),a		;ab0b   ; 0xD752 = 1
	ld a,(0cb03h)		;ab0e   ; la Y de Snake...
	ld b,a			;ab11
	ld a,(0cb43h)		;ab12   ; ...+ 0xCB43 - 8...
	add a,b			;ab15
	sub 008h		;ab16   ; - 8
	and 0f8h		;ab18   ; ...de 8 en 8
	ld (ix+003h),a		;ab1a   ; guarda la Y de lo lanzado por Snake
	ld a,(0cb05h)		;ab1d   ; la X, de 8 en 8
	and 0f8h		;ab20   ; de 8 en 8
	ld (ix+005h),a		;ab22   ; guarda la X de lo lanzado por Snake
	ld a,(0cb0eh)		;ab25   ; la direccion
	ld (ix+00ah),a		;ab28   ; la direccion (bytes 0x0A...
	ld (ix+00bh),a		;ab2b   ; ...y 0x0B)
	ld hl,0bebch		;ab2e   ; su velocidad
	call 08f4eh		;ab31   ; p02:8F4E
	jp 06a8bh		;ab34   ; sonido_24: pide el sonido 0x24
lanzado_8_paso:		; lo lanzado de tipo 8: el parpadeo (p11:AC47); fuera de la pantalla, se acaba (p11:AC10); en la zona 6 sala 0x10 hacia la izquierda por debajo de X = 0x48, gira; si delante (p11:AC1D) es solido, gira (p11:ABC0)
	call parpadeo_de_8		;ab37   ; parpadeo_de_8: el byte 0x0E uno mas; cada 2, el bit 0 del byte 0x0F cambia
	ld a,(ix+003h)		;ab3a   ; lee la Y de lo lanzado por Snake
	cp 0c0h		;ab3d   ; fuera por abajo...
	jp nc,fin_lanzado_snake		;ab3f   ; fin_lanzado_snake: la ficha se acaba: tipo 0, 0xCB52 = 0, 0xD44F = 0 y el sonido 4
	ld a,(ix+005h)		;ab42   ; lee la X de lo lanzado por Snake
	cp 0c0h		;ab45   ; ...o por la derecha, se acaba
	jp nc,fin_lanzado_snake		;ab47   ; fin_lanzado_snake: la ficha se acaba: tipo 0, 0xCB52 = 0, 0xD44F = 0 y el sonido 4
	call sala_6_10_izquierda		;ab4a   ; esa sala: gira
	jr c,$+115		;ab4d   ; gira
	call delante_de_8		;ab4f   ; delante...
	call 08f46h		;ab52   ; ...solido: gira
	jr c,$+107		;ab55   ; gira
	ret			;ab57
gira_lanzado_8:		; el byte 0x0D = 1, la direccion B, el ajuste de la vuelta de p11:AB83 (de la vieja a la nueva) en su sitio y su velocidad
	ld (ix+00dh),001h		;ab58   ; el byte 0x0D = 1
	ld a,(ix+00bh)		;ab5c   ; la vieja...
	ld (ix+00bh),b		;ab5f   ; ...la nueva
	dec a			;ab62   ; vieja - 1...
	dec b			;ab63   ; ...nueva - 1
	rlca			;ab64   ; vieja * 4 + nueva
	rlca			;ab65
	add a,b			;ab66
	ld hl,0ab83h		;ab67   ; el ajuste de p11:AB83
	call 043f6h		;ab6a   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld a,(ix+003h)		;ab6d   ; la Y + el ajuste
	add a,l			;ab70
	ld (ix+003h),a		;ab71   ; guarda la Y de lo lanzado por Snake
	ld a,(ix+005h)		;ab74   ; la X + el ajuste
	add a,h			;ab77
	ld (ix+005h),a		;ab78   ; guarda la X de lo lanzado por Snake
	ld a,b			;ab7b   ; la nueva direccion
	inc a			;ab7c
	ld hl,0bebch		;ab7d   ; su velocidad
	jp 08f53h		;ab80   ; p02:8F53

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


sala_6_10_izquierda:		; acarreo en la zona 6 sala 0x10 yendo a la izquierda por debajo de X = 0x48
	ld a,(0ca4ah)		;aba3   ; lee la zona
	cp 006h		;aba6   ; la zona 6...
	jr nz,no_abbe		;aba8
	ld a,(0ca4bh)		;abaa   ; lee la sala de la zona
	cp 010h		;abad   ; ...sala 0x10...
	jr nz,no_abbe		;abaf
	ld a,(ix+00bh)		;abb1
	cp 003h		;abb4   ; ...hacia la izquierda...
	jr nz,no_abbe		;abb6
	ld a,(ix+005h)		;abb8   ; lee la X de lo lanzado por Snake
	cp 048h		;abbb   ; ...por debajo de 0x48
	ret			;abbd
no_abbe:
	or a			;abbe   ; sin acarreo
	ret			;abbf
gira_8:		; el byte 0x0C uno mas (a 6, se acaba); prueba las dos direcciones del otro eje (p11:AC07): si las dos estan libres, una al azar; si una, esa; si ninguna, se acaba
	inc (ix+00ch)		;abc0   ; un giro mas
	ld a,(ix+00ch)		;abc3
	cp 006h		;abc6   ; a 6, se acaba
	jr nc,fin_lanzado_snake		;abc8   ; a 6, se acaba
	ld a,(ix+00bh)		;abca
	cp 003h		;abcd   ; en horizontal, prueba arriba-abajo...
	ld b,001h		;abcf   ; las direcciones 1 y 2...
	jr nc,prueba_la_primera		;abd1
	ld b,003h		;abd3   ; ...o 3 y 4
prueba_la_primera:
	ld a,b			;abd5
	call solido_en_direccion		;abd6   ; solido_en_direccion: acarreo si es solido el punto de p11:AC3F en la direccion A
	ld c,000h		;abd9
	jr c,prueba_la_segunda		;abdb   ; solida: no
	inc c			;abdd   ; libre: el bit 0
prueba_la_segunda:
	inc b			;abde
	ld a,b			;abdf
	call solido_en_direccion		;abe0   ; solido_en_direccion: acarreo si es solido el punto de p11:AC3F en la direccion A
	jr c,elige_giro		;abe3
	set 1,c		;abe5   ; libre: el bit 1
elige_giro:
	ld a,c			;abe7
	or a			;abe8   ; ninguna libre
	jr z,fin_lanzado_snake		;abe9   ; ninguna: se acaba
	cp 003h		;abeb   ; las dos libres
	jr z,giro_al_azar		;abed   ; las dos: al azar
	ld a,c			;abef
	rra			;abf0   ; solo la primera...
	jp nc,gira_lanzado_8		;abf1   ; gira_lanzado_8: el byte 0x0D = 1, la direccion B, el ajuste de la vuelta de p11:AB83 (de la vieja a la nueva) en su sitio y su velocidad
	dec b			;abf4   ; ...solo la segunda
	jp gira_lanzado_8		;abf5   ; gira_lanzado_8: el byte 0x0D = 1, la direccion B, el ajuste de la vuelta de p11:AB83 (de la vieja a la nueva) en su sitio y su velocidad
giro_al_azar:
	ld hl,0ca03h		;abf8   ; apunta a el contador de cuadros (uno mas en cada interrupcion)
	ld a,r		;abfb   ; al azar
	xor (hl)			;abfd
	rra			;abfe
	rra			;abff
	jp c,gira_lanzado_8		;ac00   ; gira_lanzado_8: el byte 0x0D = 1, la direccion B, el ajuste de la vuelta de p11:AB83 (de la vieja a la nueva) en su sitio y su velocidad
	dec b			;ac03
	jp gira_lanzado_8		;ac04   ; gira_lanzado_8: el byte 0x0D = 1, la direccion B, el ajuste de la vuelta de p11:AB83 (de la vieja a la nueva) en su sitio y su velocidad
solido_en_direccion:		; acarreo si es solido el punto de p11:AC3F en la direccion A
	push bc			;ac07
	call punto_ac3f		;ac08   ; punto_ac3f:
	call 08f46h		;ac0b   ; a_p01_7f3d: p01:7F3D con el banco 1 en 0x6000
	pop bc			;ac0e
	ret			;ac0f
fin_lanzado_snake:		; la ficha se acaba: tipo 0, 0xCB52 = 0, 0xD44F = 0 y el sonido 4
	xor a			;ac10   ; tipo 0
	ld (ix+000h),a		;ac11   ; guarda el tipo de lo lanzado por Snake
	ld (0cb52h),a		;ac14   ; 0xCB52 = 0
	ld (0d44fh),a		;ac17   ; 0xD44F = 0
	jp 06a6bh		;ac1a   ; sonido_04: pide el sonido 0x04
delante_de_8:		; el punto de delante (p11:AC37) en su direccion
	ld a,(ix+00bh)		;ac1d
	ld hl,0ac37h		;ac20   ; la tabla de p11:AC37
	jr punto_en_direccion		;ac23
punto_ac3f:
	ld hl,0ac3fh		;ac25   ; la tabla de p11:AC3F
punto_en_direccion:		; HL = su sitio + la palabra A - 1 de HL
	dec a			;ac28
	call 043f6h		;ac29   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld a,(ix+003h)		;ac2c   ; lee la Y de lo lanzado por Snake
	add a,l			;ac2f   ; la Y + el desplazamiento
	ld l,a			;ac30
	ld a,(ix+005h)		;ac31   ; lee la X de lo lanzado por Snake
	add a,h			;ac34   ; la X + el desplazamiento
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


parpadeo_de_8:		; el byte 0x0E uno mas; cada 2, el bit 0 del byte 0x0F cambia
	inc (ix+00eh)		;ac47   ; uno mas
	ld a,(ix+00eh)		;ac4a
	rra			;ac4d
	ret nc			;ac4e   ; en los impares, nada
	ld a,(ix+00fh)		;ac4f
	xor 001h		;ac52   ; el bit 0 cambia
	ld (ix+00fh),a		;ac54
	ret			;ac57
arma_3:		; el arma 3: con 0xCB5C (a cero): la ficha 0 de tipo 3 (p11:AC6C) y, puesta, su velocidad (p11:ACB6)
	ld hl,0cb5ch		;ac58
	ld a,(hl)			;ac5b
	or a			;ac5c   ; sin 0xCB5C, nada
	ret z			;ac5d   ; sin 0xCB5C, nada
	ld (hl),000h		;ac5e   ; a cero
	ld b,003h		;ac60   ; el tipo 3
	call pon_lanzado_b		;ac62   ; pon_lanzado_b: si la ficha 0 no es ya de tipo B y no hay fichas de 0xDF80: el tipo B, el paso 0, 0xD752 = 1 y su sitio (p02:8F58 con p11:BEB4)
	ld a,(0d752h)		;ac65   ; lee 1 al disparar algo (p11:A995)
	or a			;ac68
	ret z			;ac69   ; sin ponerla, nada
	jr velocidad_de_3		;ac6a
pon_lanzado_b:		; si la ficha 0 no es ya de tipo B y no hay fichas de 0xDF80: el tipo B, el paso 0, 0xD752 = 1 y su sitio (p02:8F58 con p11:BEB4)
	ld ix,0cb80h		;ac6c   ; apunta a las 6 fichas de 16 bytes de lo que lanza Snake ([tipo][..][Y 8.8][X 8.8][velocidades]...)
	ld a,(ix+000h)		;ac70   ; lee el tipo de lo lanzado por Snake
	cp b			;ac73   ; ya es de ese tipo?
	ret z			;ac74   ; ya puesta, nada
	ld a,(0df80h)		;ac75   ; lee 8 fichas de 8 bytes [tipo][dibujo][Y][X][fila][columna][espera][grafico] que suenan 0x14 en la sala y 0x15 al lado
	or a			;ac78   ; con 0xDF80?
	ret nz			;ac79   ; con 0xDF80, nada
	ld (ix+000h),b		;ac7a   ; guarda el tipo de lo lanzado por Snake
	xor a			;ac7d
	ld (ix+001h),a		;ac7e   ; guarda el paso de lo lanzado por Snake
	inc a			;ac81
	ld (0d752h),a		;ac82   ; 0xD752 = 1
	ld hl,0beb4h		;ac85   ; la tabla de p11:BEB4
	jp 08f58h		;ac88   ; p02:8F58
arma_0a:		; el arma 0x0A: con 0xCB5C (a cero), fuera de la zona 0x12 sala 8 y sin 0xDFF8: la ficha 0 de tipo 7 y su velocidad de p11:ACF1
	ld hl,0cb5ch		;ac8b
	ld a,(hl)			;ac8e
	or a			;ac8f
	ret z			;ac90   ; sin 0xCB5C, nada
	ld (hl),000h		;ac91   ; a cero
	ld a,(0ca4ah)		;ac93   ; lee la zona
	cp 012h		;ac96   ; la zona 0x12...
	jr nz,arma_0a_b		;ac98
	ld a,(0ca4bh)		;ac9a   ; lee la sala de la zona
	cp 008h		;ac9d   ; ...sala 8
	jp z,06c77h		;ac9f   ; en la zona 0x12 sala 8, no
arma_0a_b:
	ld a,(0dff8h)		;aca2   ; lee con el, la caja de 0xDFFD/0xDFFE choca (p07:B149)
	or a			;aca5
	ret nz			;aca6   ; con 0xDFF8, nada
	ld b,007h		;aca7   ; el tipo 7
	call pon_lanzado_b		;aca9   ; pon_lanzado_b: si la ficha 0 no es ya de tipo B y no hay fichas de 0xDF80: el tipo B, el paso 0, 0xD752 = 1 y su sitio (p02:8F58 con p11:BEB4)
	ld a,(0d752h)		;acac   ; lee 1 al disparar algo (p11:A995)
	or a			;acaf
	ret z			;acb0   ; sin ponerla, nada
	ld hl,0acf1h		;acb1   ; la tabla de p11:ACF1
	jr velocidad_por_direccion		;acb4
velocidad_de_3:		; la velocidad de p11:ACD9
	ld hl,0acd9h		;acb6   ; la tabla de p11:ACD9
velocidad_por_direccion:		; los 6 bytes de la direccion de Snake de HL a los bytes 6-0x0B, los 0x0C-0x0D a cero y la direccion al byte 0x0E
	push hl			;acb9
	call 06406h		;acba   ; de_ix_mas_6: DE = IX + 6
	pop hl			;acbd
	ld a,(0cb0eh)		;acbe   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	dec a			;acc1   ; 6 bytes por direccion
	add a,a			;acc2   ; * 6
	ld b,a			;acc3
	add a,a			;acc4
	add a,b			;acc5
	call 0423eh		;acc6   ; suma_a_hl: HL = HL + A
	ld bc,00006h		;acc9   ; 6 bytes
	ldir		;accc
	xor a			;acce   ; los bytes 0x0C-0x0D a cero
	ld (de),a			;accf
	inc de			;acd0
	ld (de),a			;acd1
	ld a,(0cb0eh)		;acd2   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ld (ix+00eh),a		;acd5   ; la direccion al byte 0x0E
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


lanzado_3_7_paso:		; lo lanzado de tipo 3 y 7, desde el paso 1: si llega a la mira (p11:AD3D) se acaba; las velocidades (bytes 6-9) suben lo de los bytes 0x0A-0x0D
	ld a,(ix+001h)		;ad09   ; lee el paso de lo lanzado por Snake
	or a			;ad0c
	ret z			;ad0d   ; en el paso 0, nada
	call llega_a_la_mira		;ad0e   ; la mira
	ld a,(ix+000h)		;ad11   ; lee el tipo de lo lanzado por Snake
	or a			;ad14
	ret z			;ad15   ; acabado, nada
	ld e,(ix+006h)		;ad16   ; la velocidad en Y...
	ld d,(ix+007h)		;ad19   ; lee la velocidad en Y de lo lanzado por Snake (alta)
	ld l,(ix+00ah)		;ad1c   ; + lo del byte 0x0A
	ld h,(ix+00bh)		;ad1f
	add hl,de			;ad22   ; ...+ el byte 0x0A-0x0B
	ld (ix+006h),l		;ad23   ; guarda la velocidad en Y de lo lanzado por Snake (baja)
	ld (ix+007h),h		;ad26   ; guarda la velocidad en Y de lo lanzado por Snake (alta)
	ld e,(ix+008h)		;ad29   ; la velocidad en X...
	ld d,(ix+009h)		;ad2c   ; lee la velocidad en X de lo lanzado por Snake (alta)
	ld l,(ix+00ch)		;ad2f   ; + lo del byte 0x0C
	ld h,(ix+00dh)		;ad32
	add hl,de			;ad35   ; ...+ el byte 0x0C-0x0D
	ld (ix+008h),l		;ad36   ; guarda la velocidad en X de lo lanzado por Snake (baja)
	ld (ix+009h),h		;ad39   ; guarda la velocidad en X de lo lanzado por Snake (alta)
	ret			;ad3c
llega_a_la_mira:		; por su direccion (byte 0x0E, p11:AD44): si pasa de la mira (Y 0xCB22, X 0xCB23) se acaba
	ld a,(ix+00eh)		;ad3d
	dec a			;ad40   ; la direccion - 1
	call 0424dh		;ad41   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_AD44: 4 destinos del despachador p00:424D (call en p11:AD41, el
;   indice en A): AD4C, AD95, ADA4, ADB7; lo leen p11:AD41 (8 bytes)
;   0xad44..0xad4c  (8 bytes)
DATA_tabla_AD44:
	defw 0ad4ch,0ad95h,0ada4h,0adb7h	; ad44  -> mira_arriba mira_abajo mira_izquierda mira_derecha

; ======================================================================
; CODIGO 0xad4c..0xaea0  (340 bytes)
; ======================================================================


mira_arriba:		; hacia arriba: por debajo de Y = 0xC8, el 7 por p11:AD8C; los demas subiendo, al pasar de la Y de la mira
	ld a,(ix+003h)		;ad4c   ; lee la Y de lo lanzado por Snake
	cp 0c8h		;ad4f   ; desde 0xC8, nada
	ret nc			;ad51
	ld a,(ix+000h)		;ad52   ; lee el tipo de lo lanzado por Snake
	cp 007h		;ad55   ; el tipo 7
	jr z,mira_arriba_7		;ad57
	ld a,(ix+007h)		;ad59   ; lee la velocidad en Y de lo lanzado por Snake (alta)
	rla			;ad5c   ; bajando?
	ret c			;ad5d   ; bajando, nada
	ld a,(0cb22h)		;ad5e   ; lee la Y de la mira (p11:A7E3)
	cp (ix+003h)		;ad61   ; compara con la Y de lo lanzado por Snake
	ret nc			;ad64   ; por debajo, nada
en_la_mira:		; se acaba (0xCB52 = 0) y, con la mira dentro (0xB8), el 7 p11:B885 en ella; los demas p03:B1BA con C = 0
	ld b,(ix+000h)		;ad65   ; lee el tipo de lo lanzado por Snake
	xor a			;ad68   ; se acaba
	ld (ix+000h),a		;ad69   ; guarda el tipo de lo lanzado por Snake
	ld (0cb52h),a		;ad6c
	ld a,(0cb22h)		;ad6f   ; lee la Y de la mira (p11:A7E3)
	cp 0b8h		;ad72   ; la mira fuera, nada
	ret nc			;ad74
	ld l,a			;ad75
	ld a,(0cb23h)		;ad76   ; lee la X de la mira
	cp 0b8h		;ad79   ; la Y de la mira
	ret nc			;ad7b
	ld h,a			;ad7c
	ld a,b			;ad7d   ; el tipo
	cp 007h		;ad7e   ; el 7...
	jr z,en_la_mira_7		;ad80
	ld c,000h		;ad82   ; ...los demas
	jp 08f68h		;ad84   ; a_p03_b1ba: p03:B1BA con el banco 3 en 0xA000
en_la_mira_7:
	ld e,l			;ad87   ; E y D = la mira
	ld d,h			;ad88
	jp ficha_dff8		;ad89   ; ficha_dff8: la ficha 0xDFF8 en (E, D): activa, cuenta y paso a 0, su sitio en 0xDFFB-0xDFFC, el de su caja (p11:B8A3) en 0xDFFD-0xDFFE, las rachas de 0xCA61 y el sonido 0x67
mira_arriba_7:
	ld a,(0cb22h)		;ad8c   ; lee la Y de la mira (p11:A7E3)
	cp (ix+003h)		;ad8f   ; compara con la Y de lo lanzado por Snake
	ret c			;ad92
	jr en_la_mira		;ad93
mira_abajo:		; hacia abajo: al pasar de la Y de la mira
	ld a,(ix+003h)		;ad95   ; lee la Y de lo lanzado por Snake
	cp 0c8h		;ad98   ; desde 0xC8, nada
	ret nc			;ad9a
	ld a,(0cb22h)		;ad9b   ; lee la Y de la mira (p11:A7E3)
	cp (ix+003h)		;ad9e   ; compara con la Y de lo lanzado por Snake
	ret nc			;ada1   ; por encima, nada
	jr en_la_mira		;ada2
mira_izquierda:		; hacia la izquierda: al pasar de la X de la mira + 8
	ld a,(0cb23h)		;ada4   ; lee la X de la mira
	cp 0c8h		;ada7   ; desde 0xC8, nada
	ret nc			;ada9
	ld a,(ix+005h)		;adaa   ; lee la X de lo lanzado por Snake
	sub 008h		;adad   ; su X - 8
	ld c,a			;adaf
	ld a,(0cb23h)		;adb0   ; lee la X de la mira
	cp c			;adb3
	ret c			;adb4   ; a la izquierda, nada
	jr en_la_mira		;adb5
mira_derecha:		; hacia la derecha: al pasar de la X de la mira
	ld a,(0cb23h)		;adb7   ; lee la X de la mira
	cp (ix+005h)		;adba   ; compara con la X de lo lanzado por Snake
	ret nc			;adbd   ; a la derecha, nada
	jr en_la_mira		;adbe
arma_9:		; el arma 9: con el bit 4 de 0xD7D5 sin el 0 de 0xD7DA, o mirando a los lados, el sonido 0x5C; si no, con la ficha 0xD760 libre y sitio para ella (p11:ADF0), su marco (p11:AEB6), 0xD752 = 1 y el sonido 0x17; si no cabe, el 0x5C
	ld a,(0d7d5h)		;adc0
	bit 4,a		;adc3
	jr z,arma_9_direccion		;adc5   ; sin el bit 4, sigue
	ld a,(0d7dah)		;adc7
	rra			;adca
	jp nc,06c77h		;adcb   ; sin el bit 0 de 0xD7DA, no
arma_9_direccion:
	ld a,(0cb0eh)		;adce   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	cp 003h		;add1   ; desde la izquierda
	jp nc,06c77h		;add3   ; a los lados, no
	ld ix,0d760h		;add6   ; apunta a una ficha de 16 bytes [sitio][..][Y][X][fila][columna]; la toca Snake en p07:B1E0
	ld a,(ix+000h)		;adda
	or a			;addd   ; ocupada, nada
	ret nz			;adde   ; ocupada, nada
	call sitio_para_d760		;addf   ; cabe?
	jp c,06c77h		;ade2   ; sonido_5c: pide el sonido 0x5C
	call marco_d760		;ade5   ; su marco
	ld a,001h		;ade8
	ld (0d752h),a		;adea   ; 0xD752 = 1
	jp 06a50h		;aded   ; sonido_17: pide el sonido 0x17
sitio_para_d760:		; la ficha 0xD760 delante de Snake (p11:AE87); acarreo si no cabe: fuera de la pantalla, otra cosa (p07:BB10, p07:BF5C), algo solido (p11:AF20), con 0xCB3F, 0xD8A4, 0xCB37 o 0xCA9B, p11:B475 o la zona 0x13 sala 5 con 0xD821 = 0x0D; si cabe, su sala, el paso 0, 0x0100 en los bytes 6-7 y el sitio de Snake en el byte 0 (1-4)
	call d760_delante		;adf0   ; d760_delante: la Y y la X de la ficha: las de Snake + el desplazamiento de su direccion (p11:AEA0)
	call d760_fuera		;adf3   ; fuera de la pantalla?
	ret c			;adf6   ; fuera, no cabe
	ld a,(ix+002h)		;adf7   ; su caja: Y + 0x22...
	add a,022h		;adfa
	ld l,a			;adfc
	ld a,(ix+003h)		;adfd   ; ...X + 9...
	add a,009h		;ae00
	ld h,a			;ae02
	ld de,00a23h		;ae03   ; ...0x0A x 0x23
	push de			;ae06
	push hl			;ae07
	call 06424h		;ae08   ; otra cosa en el sitio?
	pop hl			;ae0b
	pop de			;ae0c
	ret c			;ae0d
	call 08fa5h		;ae0e   ; o de p07:BF5C?
	ret c			;ae11
	call solido_en_d760		;ae12   ; solido?
	ret c			;ae15
	call no_con_cb3f		;ae16   ; 0xCB3F y los demas?
	ret c			;ae19
	call no_en_0a_4		;ae1a   ; p11:B475?
	ret c			;ae1d
	call no_en_13_5		;ae1e   ; la zona 0x13 sala 5?
	ret c			;ae21
	ld a,(0ca50h)		;ae22   ; su fila...
	ld (ix+004h),a		;ae25   ; su fila
	ld a,(0ca51h)		;ae28   ; ...y columna
	ld (ix+005h),a		;ae2b   ; su columna
	xor a			;ae2e
	ld (ix+001h),a		;ae2f   ; el paso 0
	ld (ix+006h),a		;ae32   ; el byte 6 = 0
	inc a			;ae35   ; el byte 7 = 1
	ld (ix+007h),a		;ae36
	ld b,003h		;ae39   ; 3 con 0xD8C0...
	ld a,(0d8c0h)		;ae3b   ; lee 1 con Snake dentro de lo de 0xD8C2 (p07:A40D; 0 al salir, p07:A69A)
	or a			;ae3e
	jr nz,pon_sitio_d760		;ae3f   ; con 0xD8C0: 3
	dec b			;ae41   ; ...2 en un sitio...
	ld a,(0ca65h)		;ae42   ; lee el sitio de 0xCBE0 en el que esta Snake (0 = ninguno)
	or a			;ae45
	jr nz,pon_sitio_d760		;ae46   ; en un sitio: 2
	ld b,004h		;ae48   ; ...4 en una sala especial...
	ld a,(0ca76h)		;ae4a   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	or a			;ae4d
	jr nz,pon_sitio_d760		;ae4e   ; en una especial: 4
	ld b,001h		;ae50   ; ...1 en las demas
pon_sitio_d760:
	ld (ix+000h),b		;ae52   ; el sitio
cabe_d760:
	and a			;ae55   ; cabe
	ret			;ae56
no_en_13_5:		; acarreo en la zona 0x13 sala 5 con 0xD821 = 0x0D
	ld a,(0ca4ah)		;ae57   ; lee la zona
	cp 013h		;ae5a
	jr nz,cabe_d760		;ae5c   ; otra zona, cabe
	ld a,(0ca4bh)		;ae5e   ; lee la sala de la zona
	cp 005h		;ae61
	jr nz,cabe_d760		;ae63   ; otra sala, cabe
	ld a,(0d821h)		;ae65
	cp 00dh		;ae68
	jr nz,cabe_d760		;ae6a   ; sin 0x0D, cabe
	scf			;ae6c   ; no cabe
	ret			;ae6d
no_con_cb3f:		; acarreo con 0xCB3F, 0xD8A4, 0xCB37 o 0xCA9B
	ld a,(0cb3fh)		;ae6e   ; lee en la zona 6, lo que hay bajo Snake: 1 con los caracteres 0x90-0xB3, 2 con 0xB8-0xDB (3 con 0xCAAA)
	or a			;ae71
	jr nz,no_cabe_ae85		;ae72   ; con 0xCB3F, no
	ld a,(0d8a4h)		;ae74
	or a			;ae77
	jr nz,no_cabe_ae85		;ae78   ; con 0xD8A4, no
	ld a,(0cb37h)		;ae7a
	or a			;ae7d
	jr nz,no_cabe_ae85		;ae7e   ; con 0xCB37, no
	ld a,(0ca9bh)		;ae80
	or a			;ae83
	ret z			;ae84   ; sin 0xCA9B, cabe
no_cabe_ae85:
	scf			;ae85   ; no
	ret			;ae86
d760_delante:		; la Y y la X de la ficha: las de Snake + el desplazamiento de su direccion (p11:AEA0)
	ld a,(0cb0eh)		;ae87   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	dec a			;ae8a
	ld hl,0aea0h		;ae8b   ; la tabla de p11:AEA0
	call 043f6h		;ae8e   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld a,(0cb03h)		;ae91   ; lee la Y de Snake
	add a,l			;ae94
	ld (ix+002h),a		;ae95   ; la Y
	ld a,(0cb05h)		;ae98   ; lee la X de Snake
	add a,h			;ae9b
	ld (ix+003h),a		;ae9c   ; la X
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


d760_fuera:		; acarreo con la Y desde 0x9E o la X desde 0xB0
	ld a,(ix+002h)		;aea4
	cp 09eh		;aea7
	ccf			;aea9   ; desde 0x9E: acarreo
	ret c			;aeaa
	ld a,(ix+003h)		;aeab
	cp 0b0h		;aeae
	ccf			;aeb0   ; desde 0xB0: acarreo
	ret			;aeb1
marco_d760_si:		; con la ficha 0xD760 aqui (p11:AEFF), su marco (p11:AEB6)
	call d760_aqui_b		;aeb2   ; d760_aqui_b: Z con la ficha 0xD760 activa, del sitio de Snake (p11:AFC3) y en esta sala
	ret nz			;aeb5   ; sin ella, nada
marco_d760:		; su fondo guardado en (0xEE, 0xB0) (p11:AEDB) y el marco de 0x10 x 0x20, color 0x0D, en su sitio
	call sitio_d760		;aeb6   ; sitio_d760: L = la Y, H = la X de la ficha
	push hl			;aeb9
	call guarda_fondo_d760		;aeba   ; guarda_fondo_d760: 0x12 x 0x22 de su sitio a (0xEE, 0xB0)
	pop hl			;aebd
	ld de,01020h		;aebe   ; 0x10 x 0x20...
	ld c,00dh		;aec1   ; ...color 0x0D
	ld a,(0ca42h)		;aec3   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	jp 046bch		;aec6   ; marco: cuatro lineas: un marco de D x E desde HL
solo_marco_d760:		; con la ficha aqui, solo el marco
	call d760_aqui_b		;aec9   ; d760_aqui_b: Z con la ficha 0xD760 activa, del sitio de Snake (p11:AFC3) y en esta sala
	ret nz			;aecc
	call sitio_d760		;aecd   ; sitio_d760: L = la Y, H = la X de la ficha
	ld de,01020h		;aed0
	ld c,00dh		;aed3
	ld a,(0ca42h)		;aed5   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	jp 046bch		;aed8   ; marco: cuatro lineas: un marco de D x E desde HL
guarda_fondo_d760:		; 0x12 x 0x22 de su sitio a (0xEE, 0xB0)
	ld de,0eeb0h		;aedb   ; a (0xEE, 0xB0)...
	ld bc,01222h		;aede   ; ...0x12 x 0x22
	jp 0474dh		;aee1   ; copia_rectangulo_a_esta: p00:4767 de la otra pagina (0xCA42 ^ 1) a la de 0xCA42
quita_d760:		; la ficha 0xD760 fuera: tipo 0, 0xCB52 = 0 y el fondo de vuelta a su sitio en la otra pagina
	xor a			;aee4
	ld (ix+000h),a		;aee5   ; tipo 0
	ld (0cb52h),a		;aee8   ; 0xCB52 = 0
	call sitio_d760		;aeeb   ; sitio_d760: L = la Y, H = la X de la ficha
	ld de,0eeb0h		;aeee   ; de (0xEE, 0xB0)...
	ex de,hl			;aef1
	ld bc,01222h		;aef2   ; ...0x12 x 0x22
	jp 0475ah		;aef5   ; copia_rectangulo_a_la_otra: p00:4767 de la pagina 0xCA42 a la otra
sitio_d760:		; L = la Y, H = la X de la ficha
	ld l,(ix+002h)		;aef8
	ld h,(ix+003h)		;aefb
	ret			;aefe
d760_aqui_b:		; Z con la ficha 0xD760 activa, del sitio de Snake (p11:AFC3) y en esta sala
	ld ix,0d760h		;aeff   ; apunta a una ficha de 16 bytes [sitio][..][Y][X][fila][columna]; la toca Snake en p07:B1E0
	ld a,(ix+000h)		;af03
	or a			;af06
	jr z,nz_af1b		;af07   ; libre: NZ
	call sitio_de_snake_d760		;af09   ; sitio_de_snake_d760: Z si el byte 0 de la ficha es el sitio de Snake (3 con 0xD8C0, 2 en un sitio, 4 en una sala especial, 1)
	ret nz			;af0c   ; de otro sitio: NZ
	ld a,(0ca50h)		;af0d   ; lee la fila de la sala en la zona (uno mas al salir por arriba)
	cp (ix+004h)		;af10   ; su fila...
	ret nz			;af13
	ld a,(0ca51h)		;af14   ; lee la columna de la sala en la zona (uno mas al salir por la derecha)
	cp (ix+005h)		;af17   ; ...y columna
	ret			;af1a
nz_af1b:
	ld a,0ffh		;af1b
	sub 050h		;af1d   ; NZ
	ret			;af1f
solido_en_d760:		; acarreo si es solido algun punto de la caja: el sitio, 3 de 8 en 8 hacia abajo (p11:AF37) y otros tantos 0x18 arriba y 0x0F a la derecha
	call sitio_d760		;af20   ; sitio_d760: L = la Y, H = la X de la ficha
	call 08f16h		;af23   ; a_p01_7f37: p01:7F37 con el banco 1 en 0x6000
	ret c			;af26   ; solido: acarreo
	call tres_puntos		;af27   ; tres_puntos:
	ret c			;af2a
	ld a,l			;af2b
	sub 018h		;af2c   ; 0x18 arriba...
	ld l,a			;af2e
	ld a,h			;af2f
	add a,00fh		;af30   ; ...0x0F a la derecha
	ld h,a			;af32
	call 08f16h		;af33   ; a_p01_7f37: p01:7F37 con el banco 1 en 0x6000
	ret c			;af36
tres_puntos:
	ld b,003h		;af37   ; 3 puntos
punto_8_abajo:
	ld a,l			;af39
	add a,008h		;af3a   ; 8 mas abajo
	ld l,a			;af3c
	push bc			;af3d
	call 08f16h		;af3e   ; a_p01_7f37: p01:7F37 con el banco 1 en 0x6000
	pop bc			;af41
	ret c			;af42   ; solido: acarreo
	djnz punto_8_abajo		;af43
	and a			;af45   ; libres: sin acarreo
	ret			;af46
snake_sobre_d760:		; con la ficha 0xD760 de su sitio a menos de 2 salas (si no, fuera, p11:AFE1) y fuera del estado 0x0B: en el estado 2, en su sala, con Snake a menos de 4 de su X + 8: segun la Y, 0xCB28 = 2 (0xCB29 = 0x20 - lo que entra) o 1 (0xCB29 = lo que pasa), y 0xCA8D igual; si no, 0xCA8D = 0xCB28 = 0 y 0xCB29 = 0x20
	ld ix,0d760h		;af47   ; apunta a una ficha de 16 bytes [sitio][..][Y][X][fila][columna]; la toca Snake en p07:B1E0
	ld a,(ix+000h)		;af4b
	or a			;af4e   ; libre, nada
	ret z			;af4f   ; sin ficha, nada
	call sitio_de_snake_d760		;af50   ; sitio_de_snake_d760: Z si el byte 0 de la ficha es el sitio de Snake (3 con 0xD8C0, 2 en un sitio, 4 en una sala especial, 1)
	ret nz			;af53   ; de otro sitio, nada
	call d760_cerca		;af54   ; lejos: fuera
	ret nc			;af57   ; cerca? (si no, fuera)
	call sitio_de_snake_d760		;af58   ; sitio_de_snake_d760: Z si el byte 0 de la ficha es el sitio de Snake (3 con 0xD8C0, 2 en un sitio, 4 en una sala especial, 1)
	ret nz			;af5b
	ld a,(0cb00h)		;af5c   ; lee el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	cp 00bh		;af5f   ; el 0x0B...
	ret z			;af61   ; en el estado 0x0B, nada
	cp 002h		;af62   ; ...el 2...
	jr nz,cb28_a_cero_d760		;af64   ; fuera del estado 2, a cero
	ld a,(0ca50h)		;af66   ; lee la fila de la sala en la zona (uno mas al salir por arriba)
	cp (ix+004h)		;af69   ; su fila...
	ret nz			;af6c
	ld a,(0ca51h)		;af6d   ; lee la columna de la sala en la zona (uno mas al salir por la derecha)
	cp (ix+005h)		;af70   ; ...y columna
	ret nz			;af73
	ld a,(0cb05h)		;af74   ; la X de Snake - 8 - la suya...
	sub 008h		;af77
	sub (ix+003h)		;af79
	jr nc,cerca_en_x		;af7c
	neg		;af7e
cerca_en_x:		; ...a menos de 4
	cp 004h		;af80
	jr nc,cb28_a_cero_d760		;af82
	ld a,(0cb03h)		;af84   ; la Y de Snake + 1 - la suya...
	inc a			;af87
	sub (ix+002h)		;af88
	ret c			;af8b   ; ...por encima, nada
	cp 020h		;af8c
	jr nc,debajo_de_d760		;af8e   ; desde 0x20, aparte
	ld b,a			;af90
	ld a,020h		;af91   ; 0x20 - lo que entra
	sub b			;af93
	cp 020h		;af94
	jr nc,cb28_a_cero_d760		;af96
	ld (0cb29h),a		;af98   ; lo que falta...
	ld a,002h		;af9b   ; 0xCB28 = 2
	ld (0cb28h),a		;af9d   ; ...0xCB28 = 2
	ld (0ca8dh),a		;afa0   ; guarda con el, otros choques de Snake con los actores (p07:AD1E)
	ret			;afa3
debajo_de_d760:		; lo que pasa de 0x20...
	sub 020h		;afa4
	cp 020h		;afa6
	jr nc,cb28_a_cero_d760		;afa8
	ld (0cb29h),a		;afaa   ; lo que sobra...
	ld a,001h		;afad   ; ...0xCB28 = 1
	ld (0cb28h),a		;afaf   ; ...0xCB28 = 1
	ld (0ca8dh),a		;afb2   ; guarda con el, otros choques de Snake con los actores (p07:AD1E)
	ret			;afb5
cb28_a_cero_d760:
	xor a			;afb6
	ld (0ca8dh),a		;afb7   ; guarda con el, otros choques de Snake con los actores (p07:AD1E)
	ld (0cb28h),a		;afba   ; 0xCB28 = 0...
	ld a,020h		;afbd
	ld (0cb29h),a		;afbf   ; ...0xCB29 = 0x20
	ret			;afc2
sitio_de_snake_d760:		; Z si el byte 0 de la ficha es el sitio de Snake (3 con 0xD8C0, 2 en un sitio, 4 en una sala especial, 1)
	ld b,003h		;afc3
	ld a,(0d8c0h)		;afc5   ; lee 1 con Snake dentro de lo de 0xD8C2 (p07:A40D; 0 al salir, p07:A69A)
	or a			;afc8
	jr nz,compara_sitio_b		;afc9   ; con 0xD8C0: 3
	dec b			;afcb
	ld a,(0ca65h)		;afcc   ; lee el sitio de 0xCBE0 en el que esta Snake (0 = ninguno)
	or a			;afcf
	jr nz,compara_sitio_b		;afd0   ; en un sitio: 2
	ld b,004h		;afd2
	ld a,(0ca76h)		;afd4   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	or a			;afd7
	jr nz,compara_sitio_b		;afd8   ; en una especial: 4
	ld b,001h		;afda   ; 1
compara_sitio_b:
	ld a,b			;afdc
	cp (ix+000h)		;afdd   ; el suyo?
	ret			;afe0
d760_cerca:		; acarreo con la ficha a menos de 2 salas en fila y columna; si no, fuera (tipo 0, 0xCB52 = 0)
	ld a,(0ca50h)		;afe1   ; lee la fila de la sala en la zona (uno mas al salir por arriba)
	sub (ix+004h)		;afe4   ; las filas...
	jr nc,fila_cerca		;afe7
	neg		;afe9
fila_cerca:
	cp 002h		;afeb
	jr nc,d760_lejos		;afed   ; lejos: fuera
	ld a,(0ca51h)		;afef   ; lee la columna de la sala en la zona (uno mas al salir por la derecha)
	sub (ix+005h)		;aff2   ; las columnas...
	jr nc,columna_cerca		;aff5
	neg		;aff7
columna_cerca:
	cp 002h		;aff9
	ret c			;affb   ; cerca: acarreo
d760_lejos:
	xor a			;affc
	ld (ix+000h),a		;affd
	ld (0cb52h),a		;b000
	ret			;b003
arma_5:		; el arma 5 (salvo en la sala especial 0x39): si la ficha 0 no es ya de tipo 5: el tipo 5 a cero, 0xD752 = 1, en Y = la de Snake + 0xCB43 - 0x28 y X = la de Snake - 8, la casilla 8, 8 (bytes 0x0A-0x0B) y su sitio (p11:B1E0)
	ld a,(0ca76h)		;b004   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 039h		;b007
	ret z			;b009   ; en la especial 0x39, nada
	ld ix,0cb80h		;b00a   ; apunta a las 6 fichas de 16 bytes de lo que lanza Snake ([tipo][..][Y 8.8][X 8.8][velocidades]...)
	ld a,(ix+000h)		;b00e   ; lee el tipo de lo lanzado por Snake
	cp 005h		;b011
	ret z			;b013   ; ya puesta, nada
	ld a,001h		;b014
	ld (0d752h),a		;b016   ; 0xD752 = 1
	ld (ix+000h),005h		;b019   ; el tipo de lo lanzado por Snake = 0x05
	xor a			;b01d
	ld (ix+001h),a		;b01e   ; guarda el paso de lo lanzado por Snake
	ld (ix+002h),a		;b021
	ld (ix+004h),a		;b024
	ld (ix+006h),a		;b027   ; guarda la velocidad en Y de lo lanzado por Snake (baja)
	ld (ix+007h),a		;b02a   ; guarda la velocidad en Y de lo lanzado por Snake (alta)
	ld (ix+008h),a		;b02d   ; guarda la velocidad en X de lo lanzado por Snake (baja)
	ld (ix+009h),a		;b030   ; guarda la velocidad en X de lo lanzado por Snake (alta)
	ld (ix+00fh),a		;b033
	ld a,(0cb03h)		;b036   ; la Y de Snake...
	ld b,a			;b039
	ld a,(0cb43h)		;b03a   ; ...+ 0xCB43 - 0x28
	add a,b			;b03d
	sub 028h		;b03e
	ld (ix+003h),a		;b040   ; guarda la Y de lo lanzado por Snake
	ld a,(0cb05h)		;b043   ; la X - 8
	sub 008h		;b046
	ld (ix+005h),a		;b048   ; guarda la X de lo lanzado por Snake
	ld (ix+00ah),008h		;b04b   ; la casilla 8...
	ld (ix+00bh),008h		;b04f   ; ...8
	jp mira_de_la_casilla		;b053   ; mira_de_la_casilla: el sitio de la mira de la casilla: byte 0x0C = p11:B1FF por la fila + 0x16, byte 0x0D = p11:B1FF por la columna + 0xC4
lanzado_5_paso:		; lo lanzado de tipo 5 por su paso (p11:B05C)
	ld a,(ix+001h)		;b056   ; lee el paso de lo lanzado por Snake
	call 0424dh		;b059   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_B05C: 4 destinos del despachador p00:424D (call en p11:B059, el
;   indice en A): B064, B0AD, B0CF, B173; lo leen p11:B059 (8 bytes)
;   0xb05c..0xb064  (8 bytes)
DATA_tabla_B05C:
	defw 0b064h,0b0adh,0b0cfh,0b173h	; b05c  -> lanzado_5_paso_0 lanzado_5_paso_1 lanzado_5_paso_2 lanzado_5_paso_3

; ======================================================================
; CODIGO 0xb064..0xb1ff  (411 bytes)
; ======================================================================


lanzado_5_paso_0:		; con el mando, la casilla se mueve (p11:B1B1) y su sitio (p11:B1E0); con el disparo 1: el paso siguiente, parado, el byte 0x0F = 1, sube a 0xFA00, la Y al byte 0x0E, la casilla a 0xCAEB, el sonido 0x21 y una menos de lo de 0xCB20
	ld a,(0ca07h)		;b064   ; lee lo recien pulsado del mando (los bits de 0xCA08 que no estaban)
	bit 4,a		;b067
	jr nz,lanzado_5_sale		;b069   ; el disparo 1
	ld a,(0ca08h)		;b06b   ; lee el mando: joystick y teclado juntos (bits 0-3 las direcciones, 4-5 los disparos)
	and 00fh		;b06e
	ret z			;b070   ; sin mando, nada
	call casilla_con_el_mando		;b071   ; la casilla
	call mira_de_la_casilla		;b074   ; su sitio
	ret			;b077
lanzado_5_sale:		; el paso siguiente
	inc (ix+001h)		;b078   ; sube el paso de lo lanzado por Snake
	xor a			;b07b
	ld (ix+006h),a		;b07c   ; guarda la velocidad en Y de lo lanzado por Snake (baja)
	ld (ix+008h),a		;b07f   ; guarda la velocidad en X de lo lanzado por Snake (baja)
	ld (ix+009h),a		;b082   ; guarda la velocidad en X de lo lanzado por Snake (alta)
	inc a			;b085
	ld (ix+00fh),a		;b086   ; el byte 0x0F = 1
	ld (ix+007h),0fah		;b089   ; sube a 0xFA00
	ld a,(ix+003h)		;b08d   ; la Y al byte 0x0E
	ld (ix+00eh),a		;b090
	ld a,(ix+00ah)		;b093   ; la casilla...
	ld hl,0caebh		;b096   ; apunta a la casilla de lo lanzado de tipo 5 (2 bytes, p11:B093)
	ld (hl),a			;b099   ; ...a 0xCAEB
	inc hl			;b09a
	ld a,(ix+00bh)		;b09b
	ld (hl),a			;b09e
	call 06a7fh		;b09f   ; sonido_21: pide el sonido 0x21
	push ix		;b0a2
	ld a,(0cb20h)		;b0a4   ; una menos de lo de 0xCB20
	call 08f95h		;b0a7   ; a_p03_be60: p03:BE60 con el banco 3 en 0xA000
	pop ix		;b0aa
	ret			;b0ac
lanzado_5_paso_1:		; sube: a 0x10-0x1F de su Y de salida, el byte 0x0F = 2; desde 0x20, 8 cuadros, el paso siguiente, el byte 0x0F = 0 y parado
	ld a,(ix+00eh)		;b0ad
	sub (ix+003h)		;b0b0   ; le resta la Y de lo lanzado por Snake
	cp 010h		;b0b3
	ret c			;b0b5   ; por debajo de 0x10, nada
	cp 020h		;b0b6
	jr nc,lanzado_5_arriba		;b0b8   ; desde 0x20, aparte
	ld a,002h		;b0ba
	ld (ix+00fh),a		;b0bc
	ret			;b0bf
lanzado_5_arriba:
	ld (ix+00eh),008h		;b0c0
	inc (ix+001h)		;b0c4   ; sube el paso de lo lanzado por Snake
	xor a			;b0c7
	ld (ix+00fh),a		;b0c8
	ld (ix+007h),a		;b0cb   ; guarda la velocidad en Y de lo lanzado por Snake (alta)
	ret			;b0ce
lanzado_5_paso_2:		; al acabar la espera: sobre su casilla (p11:B0F3), su sala (p11:B146), el byte 0x0F (p11:B12E), baja a 0x0600, el paso siguiente y 0xCAAB = 1
	dec (ix+00eh)		;b0cf
	ret nz			;b0d2
	call sitio_de_la_casilla		;b0d3   ; sitio_de_la_casilla: la casilla (bytes 0x0A-0x0B, 0-17 en tres salas de 6) a la Y (byte 0x0E, y la Y - 0x40 desde 0) y la X: (casilla mod 6) * 32 + 0x10
	call sala_de_la_casilla		;b0d6   ; sala_de_la_casilla: la fila y la columna de la sala de la casilla: la de ahora + 1, 0 o - 1 en fila (casilla 0-5, 6-11, 12-17) y - 1, 0, + 1 en columna
	call byte_0f_casilla		;b0d9   ; byte_0f_casilla: el byte 0x0F = 3 si la sala es la de ahora, 0 si no
	xor a			;b0dc
	ld (ix+006h),a		;b0dd   ; guarda la velocidad en Y de lo lanzado por Snake (baja)
	ld (ix+007h),006h		;b0e0   ; baja a 0x0600
	ld (ix+008h),a		;b0e4   ; guarda la velocidad en X de lo lanzado por Snake (baja)
	ld (ix+009h),a		;b0e7   ; guarda la velocidad en X de lo lanzado por Snake (alta)
	inc (ix+001h)		;b0ea   ; sube el paso de lo lanzado por Snake
	ld a,001h		;b0ed   ; 0xCAAB = 1
	ld (0caabh),a		;b0ef   ; guarda 1 al soltar lo lanzado de tipo 5 (p11:B0ED)
	ret			;b0f2
sitio_de_la_casilla:		; la casilla (bytes 0x0A-0x0B, 0-17 en tres salas de 6) a la Y (byte 0x0E, y la Y - 0x40 desde 0) y la X: (casilla mod 6) * 32 + 0x10
	ld a,(ix+00ah)		;b0f3   ; la fila de la casilla...
	cp 006h		;b0f6   ; ...0-5...
	jr c,y_de_casilla		;b0f8
	sub 006h		;b0fa   ; ...6-11...
	cp 006h		;b0fc
	jr c,y_de_casilla		;b0fe
	sub 006h		;b100   ; ...12-17
y_de_casilla:
	call por_32_mas_16		;b102   ; por_32_mas_16: A * 32 + 0x10
	ld (ix+00eh),a		;b105
	sub 040h		;b108
	jr nc,pon_y_casilla		;b10a
	xor a			;b10c
pon_y_casilla:
	ld (ix+003h),a		;b10d   ; guarda la Y de lo lanzado por Snake
	ld a,(ix+00bh)		;b110
	cp 006h		;b113
	jr c,x_de_casilla		;b115
	sub 006h		;b117
	cp 006h		;b119
	jr c,x_de_casilla		;b11b
	sub 006h		;b11d
x_de_casilla:
	call por_32_mas_16		;b11f   ; por_32_mas_16: A * 32 + 0x10
	ld (ix+005h),a		;b122   ; guarda la X de lo lanzado por Snake
	ret			;b125
por_32_mas_16:		; A * 32 + 0x10
	rlca			;b126   ; * 32...
	rlca			;b127
	rlca			;b128
	rlca			;b129
	rlca			;b12a
	add a,010h		;b12b   ; ...+ 0x10
	ret			;b12d
byte_0f_casilla:		; el byte 0x0F = 3 si la sala es la de ahora, 0 si no
	ld b,000h		;b12e
	ld a,(0ca50h)		;b130   ; lee la fila de la sala en la zona (uno mas al salir por arriba)
	cp (ix+00ah)		;b133
	jr nz,pon_byte_0f		;b136
	ld a,(0ca51h)		;b138   ; lee la columna de la sala en la zona (uno mas al salir por la derecha)
	cp (ix+00bh)		;b13b
	jr nz,pon_byte_0f		;b13e
	ld b,003h		;b140
pon_byte_0f:
	ld (ix+00fh),b		;b142
	ret			;b145
sala_de_la_casilla:		; la fila y la columna de la sala de la casilla: la de ahora + 1, 0 o - 1 en fila (casilla 0-5, 6-11, 12-17) y - 1, 0, + 1 en columna
	ld b,001h		;b146   ; 0-5: una fila arriba
	ld a,(ix+00ah)		;b148
	cp 006h		;b14b
	jr c,fila_casilla		;b14d
	dec b			;b14f   ; 6-11: la misma
	cp 00ch		;b150
	jr c,fila_casilla		;b152
	dec b			;b154   ; 12-17: una abajo
fila_casilla:
	ld a,(0ca50h)		;b155   ; + la fila de ahora
	add a,b			;b158
	ld (ix+00ah),a		;b159
	ld b,0ffh		;b15c   ; 0-5: una columna a la izquierda
	ld a,(ix+00bh)		;b15e
	cp 006h		;b161
	jr c,columna_casilla		;b163
	inc b			;b165   ; 6-11: la misma
	cp 00ch		;b166
	jr c,columna_casilla		;b168
	inc b			;b16a   ; 12-17: una a la derecha
columna_casilla:
	ld a,(0ca51h)		;b16b   ; lee la columna de la sala en la zona (uno mas al salir por la derecha)
	add a,b			;b16e
	ld (ix+00bh),a		;b16f
	ret			;b172
lanzado_5_paso_3:		; baja hasta 8 por encima de su Y final (byte 0x0E): a menos de 0x10, con el byte 0x0F, el 4; al llegar, se acaba: en su sala p03:B1BE, en otra p03:B1F5, con la casilla (bytes 0x0A-0x0B), su Y final y su X
	ld a,(ix+00eh)		;b173
	sub 008h		;b176
	sub (ix+003h)		;b178   ; le resta la Y de lo lanzado por Snake
	jr c,lanzado_5_llega		;b17b   ; llegado
	cp 010h		;b17d
	ret nc			;b17f   ; lejos, nada
	ld a,(ix+00fh)		;b180
	or a			;b183
	ret z			;b184   ; sin el byte 0x0F, nada
	ld a,004h		;b185   ; el 4
	ld (ix+00fh),a		;b187
	ret			;b18a
lanzado_5_llega:		; se acaba
	xor a			;b18b
	ld (ix+000h),a		;b18c   ; guarda el tipo de lo lanzado por Snake
	ld (0cb52h),a		;b18f
	ld e,(ix+00ah)		;b192   ; la sala (bytes 0x0A-0x0B)...
	ld d,(ix+00bh)		;b195
	ld l,(ix+00eh)		;b198   ; ...su Y final y su X
	ld h,(ix+005h)		;b19b   ; lee la X de lo lanzado por Snake
	ld c,000h		;b19e
	ld a,(0ca50h)		;b1a0   ; otra fila...
	cp e			;b1a3
	jp nz,08f26h		;b1a4   ; a_p03_b1f5: p03:B1F5 con el banco 3 en 0xA000
	ld a,(0ca51h)		;b1a7   ; ...u otra columna: p03:B1F5
	cp d			;b1aa
	jp nz,08f26h		;b1ab   ; a_p03_b1f5: p03:B1F5 con el banco 3 en 0xA000
	jp 08f1eh		;b1ae   ; la de ahora: p03:B1BE
casilla_con_el_mando:		; la casilla con el mando: arriba la fila - 1, abajo + 1, izquierda la columna - 1, derecha + 1 (0-0x11)
	rra			;b1b1
	jr c,casilla_arriba		;b1b2
	rra			;b1b4
	jr c,casilla_abajo		;b1b5
	rra			;b1b7
	jr c,casilla_izquierda		;b1b8
	ld a,(ix+00bh)		;b1ba   ; derecha...
	cp 011h		;b1bd   ; ...hasta 0x11
	ret nc			;b1bf
	inc (ix+00bh)		;b1c0
	ret			;b1c3
casilla_arriba:
	ld a,(ix+00ah)		;b1c4
	or a			;b1c7
	ret z			;b1c8
	dec (ix+00ah)		;b1c9
	ret			;b1cc
casilla_abajo:
	ld a,(ix+00ah)		;b1cd
	cp 011h		;b1d0
	ret nc			;b1d2
	inc (ix+00ah)		;b1d3
	ret			;b1d6
casilla_izquierda:
	ld a,(ix+00bh)		;b1d7
	or a			;b1da
	ret z			;b1db
	dec (ix+00bh)		;b1dc
	ret			;b1df
mira_de_la_casilla:		; el sitio de la mira de la casilla: byte 0x0C = p11:B1FF por la fila + 0x16, byte 0x0D = p11:B1FF por la columna + 0xC4
	ld a,(ix+00ah)		;b1e0
	ld hl,0b1ffh		;b1e3
	call 0423eh		;b1e6   ; suma_a_hl: HL = HL + A
	ld a,(hl)			;b1e9
	add a,016h		;b1ea
	ld (ix+00ch),a		;b1ec
	ld a,(ix+00bh)		;b1ef
	ld hl,0b1ffh		;b1f2
	call 0423eh		;b1f5   ; suma_a_hl: HL = HL + A
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


arma_0c:		; el arma 0x0C, sin el bit 4 de 0xD7DA y sin 0xCB44: 0xCB44 = 2 (con 0xCB21 = 0x1D, la cuenta 2) o 1 (la cuenta 0x0C), 0xCB45-0xCB46 a cero, 0xD752 = 1 y el sonido 0x46 (2) o 0x60 (1)
	ld a,(0d7dah)		;b211
	bit 4,a		;b214
	ret nz			;b216   ; con el bit 4, nada
	ld hl,0cb44h		;b217   ; apunta a 1-2: el arma 0x0C en marcha (2 con 0xCB21 = 0x1D; p11:B211)
	ld a,(hl)			;b21a
	or a			;b21b
	ret nz			;b21c   ; con 0xCB44, nada
	ld a,(0cb21h)		;b21d   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	cp 01dh		;b220   ; con 0x1D en 0xCB21: 2...
	ld a,002h		;b222
	ld b,a			;b224
	jr z,pon_cb44		;b225
	dec a			;b227   ; ...si no, 1 con 0x0C
	ld b,00ch		;b228
pon_cb44:
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
	ld (0d752h),a		;b235   ; 0xD752 = 1
	dec c			;b238
	jp z,06c33h		;b239   ; el 1: el sonido 0x46
	jp 06c87h		;b23c   ; sonido_60: pide el sonido 0x60
cb44_cada_cuadro:		; con 0xCB44: sin sprites 4-7, sus colores (p11:B35A); con 1, p11:B305; con 2, p11:B256 y los sprites (p11:B29B)
	ld a,(0cb44h)		;b23f   ; lee 1-2: el arma 0x0C en marcha (2 con 0xCB21 = 0x1D; p11:B211)
	or a			;b242
	ret z			;b243   ; sin 0xCB44, nada
	call sin_sprites_4_7		;b244   ; sin_sprites_4_7: los sprites 4-7 fuera
	call colores_cb44		;b247   ; colores_cb44: los colores de los sprites 4-7 al 0x0A (o 9 en los cuadros pares)
	ld a,(0cb44h)		;b24a   ; lee 1-2: el arma 0x0C en marcha (2 con 0xCB21 = 0x1D; p11:B211)
	dec a			;b24d
	jp z,cb44_1		;b24e   ; el 1
	call cb44_2		;b251   ; cb44_2: por 0xCB45: 0 crece (0xCB46 + 1 cada 2 cuadros hasta 4, despues 0xCB45 = 1 con 4 cuadros); 1 espera; 2 mengua hasta 0 y 0xCB44 = 0
	jr sprites_de_cb44		;b254
cb44_2:		; por 0xCB45: 0 crece (0xCB46 + 1 cada 2 cuadros hasta 4, despues 0xCB45 = 1 con 4 cuadros); 1 espera; 2 mengua hasta 0 y 0xCB44 = 0
	ld a,(0cb45h)		;b256   ; lee el paso del arma 0x0C con 2 (crece, espera, mengua; p11:B256)
	dec a			;b259
	jr z,cb44_espera		;b25a   ; el 1
	dec a			;b25c
	jr z,cb44_mengua		;b25d   ; el 2
	ld hl,0cb47h		;b25f   ; apunta a la cuenta del arma 0x0C
	dec (hl)			;b262   ; cada 2 cuadros...
	ret nz			;b263
	ld (hl),002h		;b264
	ld a,001h		;b266
	call suma_cb46		;b268   ; ...uno mas
	cp 004h		;b26b
	ret c			;b26d   ; hasta 4
	ld hl,0cb45h		;b26e   ; apunta a el paso del arma 0x0C con 2 (crece, espera, mengua; p11:B256)
	inc (hl)			;b271
	inc l			;b272
	inc l			;b273
	ld (hl),004h		;b274
	ret			;b276
cb44_espera:
	ld hl,0cb47h		;b277   ; apunta a la cuenta del arma 0x0C
	dec (hl)			;b27a
	ret nz			;b27b
	ld (hl),001h		;b27c
	dec l			;b27e
	dec l			;b27f
	inc (hl)			;b280
	ret			;b281
cb44_mengua:
	ld hl,0cb47h		;b282   ; apunta a la cuenta del arma 0x0C
	dec (hl)			;b285
	ret nz			;b286
	ld (hl),002h		;b287
	ld a,0ffh		;b289
	call suma_cb46		;b28b   ; uno menos
	or a			;b28e
	ret nz			;b28f   ; hasta 0
	xor a			;b290
	ld (0cb44h),a		;b291   ; guarda 1-2: el arma 0x0C en marcha (2 con 0xCB21 = 0x1D; p11:B211)
	ret			;b294
suma_cb46:
	ld hl,0cb46h		;b295   ; apunta a lo largo del arma 0x0C (0-4 sprites, p11:B295)
	add a,(hl)			;b298
	ld (hl),a			;b299
	ret			;b29a
sprites_de_cb44:		; 0xCB46 sprites desde el 4 delante de Snake (p11:B336), con el patron de su direccion (p11:B2BF) + 4 cada uno, de 0x10 en 0x10 en su direccion (p11:B2CB)
	ld a,(0cb46h)		;b29b   ; lee lo largo del arma 0x0C (0-4 sprites, p11:B295)
	or a			;b29e
	ret z			;b29f   ; sin largo, nada
	ld b,a			;b2a0
	call delante_b378		;b2a1   ; delante_b378: E, D = el sitio de Snake + el de p11:B378 por su direccion
	ld a,e			;b2a4
	cp 0b1h		;b2a5   ; fuera, nada
	ret nc			;b2a7
	ld a,d			;b2a8
	cp 0b1h		;b2a9
	ret nc			;b2ab
	call patron_cb44		;b2ac   ; el patron
	ld hl,0dc10h		;b2af
sprite_cb44:
	call pon_sprite_dentro		;b2b2   ; pon_sprite_dentro: el sprite en (E, D); con la X desde 0xC0, fuera (Y = 0xE0)
	ld a,c			;b2b5
	add a,004h		;b2b6
	ld c,a			;b2b8
	call siguiente_cb44		;b2b9   ; siguiente_cb44: 0x10 mas en la direccion de Snake (fuera de la pantalla, Y = 0xE0)
	djnz sprite_cb44		;b2bc
	ret			;b2be
patron_cb44:		; C = el patron de p11:B36C por la direccion de Snake
	ld a,(0cb0eh)		;b2bf   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	dec a			;b2c2
	ld hl,0b36ch		;b2c3
	call 0423eh		;b2c6   ; suma_a_hl: HL = HL + A
	ld c,(hl)			;b2c9
	ret			;b2ca
siguiente_cb44:		; 0x10 mas en la direccion de Snake (fuera de la pantalla, Y = 0xE0)
	ld a,(0cb0eh)		;b2cb   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	dec a			;b2ce
	jr z,cb44_arriba		;b2cf   ; arriba
	dec a			;b2d1
	jr z,cb44_abajo		;b2d2   ; abajo
	dec a			;b2d4
	jr z,cb44_izquierda		;b2d5   ; izquierda
	ld a,d			;b2d7   ; derecha: X + 0x10
	add a,010h		;b2d8
	ld d,a			;b2da
	cp 0b1h		;b2db
	ret c			;b2dd   ; dentro, ya esta
	ld e,0e0h		;b2de   ; fuera: Y = 0xE0
	ret			;b2e0
cb44_arriba:
	ld a,e			;b2e1
	cp 0e0h		;b2e2   ; ya fuera, nada
	ret z			;b2e4
	sub 010h		;b2e5   ; Y - 0x10
	ld e,a			;b2e7
	cp 0b1h		;b2e8
	ret c			;b2ea   ; dentro, ya esta
	ld e,0e0h		;b2eb   ; fuera
	ret			;b2ed
cb44_abajo:
	ld a,e			;b2ee
	cp 0e0h		;b2ef   ; ya fuera, nada
	ret z			;b2f1
	add a,010h		;b2f2   ; Y + 0x10
	ld e,a			;b2f4
	cp 0b1h		;b2f5
	ret c			;b2f7   ; dentro, ya esta
	ld e,0e0h		;b2f8   ; fuera
	ret			;b2fa
cb44_izquierda:
	ld a,d			;b2fb
	sub 010h		;b2fc   ; X - 0x10
	ld d,a			;b2fe
	cp 0b1h		;b2ff
	ret c			;b301   ; dentro, ya esta
	ld e,0e0h		;b302   ; fuera
	ret			;b304
cb44_1:		; la cuenta; al acabar, 0xCB44 = 0; si no, un sprite delante de Snake (p11:B331) con el patron 0x10 o 0x14 cada 4 cuadros
	ld hl,0cb47h		;b305   ; apunta a la cuenta del arma 0x0C
	dec (hl)			;b308
	jr z,cb44_acaba		;b309
	call patron_10_14		;b30b   ; patron_10_14:
	jr sprite_cb44_1		;b30e
cb44_acaba:
	xor a			;b310
	ld (0cb44h),a		;b311   ; guarda 1-2: el arma 0x0C en marcha (2 con 0xCB21 = 0x1D; p11:B211)
	ret			;b314
patron_10_14:
	ld a,(0ca03h)		;b315   ; lee el contador de cuadros (uno mas en cada interrupcion)
	rra			;b318
	rra			;b319
	ld c,010h		;b31a
	ret z			;b31c
	ld c,014h		;b31d
	ret			;b31f
sprite_cb44_1:
	call delante_b370		;b320   ; delante_b370: E, D = el sitio de Snake + el de p11:B370 por su direccion
	ld hl,0dc10h		;b323
pon_sprite_dentro:		; el sprite en (E, D); con la X desde 0xC0, fuera (Y = 0xE0)
	ld a,d			;b326
	cp 0c0h		;b327
	jp c,05d41h		;b329   ; pon_sprite: [E][D][C] en (HL): la Y, la X y el patron de un sprite de 0xDC00
	ld e,0e0h		;b32c
	jp 05d41h		;b32e   ; pon_sprite: [E][D][C] en (HL): la Y, la X y el patron de un sprite de 0xDC00
delante_b370:		; E, D = el sitio de Snake + el de p11:B370 por su direccion
	ld hl,0b370h		;b331
	jr delante_de_snake		;b334
delante_b378:		; E, D = el sitio de Snake + el de p11:B378 por su direccion
	ld hl,0b378h		;b336
delante_de_snake:
	ld a,(0cb0eh)		;b339   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	dec a			;b33c
	add a,a			;b33d
	call 0423eh		;b33e   ; suma_a_hl: HL = HL + A
	ld e,(hl)			;b341
	inc hl			;b342
	ld d,(hl)			;b343
	ld a,(0cb03h)		;b344   ; lee la Y de Snake
	add a,e			;b347
	ld e,a			;b348
	ld a,(0cb05h)		;b349   ; lee la X de Snake
	add a,d			;b34c
	ld d,a			;b34d
	ret			;b34e
sin_sprites_4_7:		; los sprites 4-7 fuera
	ld hl,0dc10h		;b34f
	ld bc,0000fh		;b352
	ld a,0e0h		;b355
	jp 04237h		;b357   ; llena_bloque: pone A en BC + 1 bytes desde HL
colores_cb44:		; los colores de los sprites 4-7 al 0x0A (o 9 en los cuadros pares)
	ld a,(0ca03h)		;b35a   ; lee el contador de cuadros (uno mas en cada interrupcion)
	rra			;b35d
	ld a,00ah		;b35e
	jr c,pon_colores_cb44		;b360
	dec a			;b362
pon_colores_cb44:
	ld hl,0da40h		;b363
	ld bc,0003fh		;b366
	jp 04237h		;b369   ; llena_bloque: pone A en BC + 1 bytes desde HL

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


arma_7:		; el arma 7: la primera ficha libre de 0xCC00 (sin ninguna, el sonido 0x5C) en el sitio de delante (p11:B3AD); si cabe, 0xCB60 = 1, su dibujo (p11:A652) y el sonido 0x17; si no, el 0x5C
	ld ix,0cc00h		;b380   ; apunta a 8 fichas de 16 bytes del arma 7 [sitio][paso][Y][X][fila][columna][cuenta] (p11:B380)
	ld b,008h		;b384   ; 8 fichas
libre_cc00:
	ld a,(ix+000h)		;b386
	or a			;b389
	jr z,pon_arma_7		;b38a   ; libre: esa
	ld de,00010h		;b38c
	add ix,de		;b38f
	djnz libre_cc00		;b391
	jp 06c77h		;b393   ; sonido_5c: pide el sonido 0x5C
pon_arma_7:
	push bc			;b396
	call cc00_delante		;b397   ; cc00_delante: el sitio delante de Snake (p11:B446, al menos 4); dentro de 0xB9, sin otra cosa ni algo solido (p07:BB10, p07:BF5C, p11:B475) y sin 0xCB3F, 0xD8A4, 0xCB37 ni 0xCA9B: 0xD752 = 1, el paso 0, el sitio de Snake en el byte 0 (con 0xCB24, + 0x80), su sala y 0x40 en el byte 6
	pop bc			;b39a
	ld a,(0d752h)		;b39b   ; lee 1 al disparar algo (p11:A995)
	or a			;b39e
	jp z,06c77h		;b39f   ; no cabe: el sonido 0x5C
	ld hl,0cb60h		;b3a2   ; 0xCB60 = 1
	ld (hl),001h		;b3a5
	call fondo_y_dibujo_cc00		;b3a7   ; su dibujo
	jp 06a50h		;b3aa   ; sonido_17: pide el sonido 0x17
cc00_delante:		; el sitio delante de Snake (p11:B446, al menos 4); dentro de 0xB9, sin otra cosa ni algo solido (p07:BB10, p07:BF5C, p11:B475) y sin 0xCB3F, 0xD8A4, 0xCB37 ni 0xCA9B: 0xD752 = 1, el paso 0, el sitio de Snake en el byte 0 (con 0xCB24, + 0x80), su sala y 0x40 en el byte 6
	call delante_b46d		;b3ad   ; delante_b46d: E, D = el sitio de Snake + el de p11:B46D por su direccion (desde 0xE0, 2), pares
	call al_menos_4		;b3b0   ; al_menos_4: E y D al menos 4
	ld a,e			;b3b3
	cp 0b9h		;b3b4
	ret nc			;b3b6   ; fuera, nada
	ld a,d			;b3b7
	cp 0b9h		;b3b8
	ret nc			;b3ba
	ld (ix+002h),e		;b3bb   ; su sitio
	ld (ix+003h),d		;b3be
	ld a,e			;b3c1   ; la caja: Y + 0x0C...
	add a,00ch		;b3c2
	ld l,a			;b3c4
	ld a,d			;b3c5   ; ...X + 4...
	add a,004h		;b3c6
	ld h,a			;b3c8
	ld de,00810h		;b3c9   ; ...8 x 0x10
	push de			;b3cc
	push hl			;b3cd
	call 06424h		;b3ce   ; a_p07_bb10: p07:BB10 con el banco 7 en 0xA000
	pop hl			;b3d1
	pop de			;b3d2
	ret c			;b3d3
	call 08fa5h		;b3d4   ; a_p07_bf5c: p07:BF5C con el banco 7 en 0xA000
	ret c			;b3d7
	call no_en_0a_4		;b3d8   ; no_en_0a_4: acarreo en la zona 0x0A sala 4 sin el bit 0 de 0xD7DA y con el 4 de 0xD7D5
	ret c			;b3db
	ld a,(0cb3fh)		;b3dc   ; lee en la zona 6, lo que hay bajo Snake: 1 con los caracteres 0x90-0xB3, 2 con 0xB8-0xDB (3 con 0xCAAA)
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
	ld (0d752h),a		;b3f2   ; 0xD752 = 1
	ld (ix+001h),000h		;b3f5
	call sitio_de_snake_cc00		;b3f9   ; el sitio de Snake
	ld a,(0cb24h)		;b3fc   ; lee 0xD70A al salir de F2 (p10:B480)
	or a			;b3ff
	jr z,sala_de_cc00		;b400   ; sin 0xCB24, asi
	ld a,(ix+000h)		;b402   ; con el, + 0x80
	add a,080h		;b405
	ld (ix+000h),a		;b407
sala_de_cc00:
	ld a,(0ca50h)		;b40a   ; lee la fila de la sala en la zona (uno mas al salir por arriba)
	ld (ix+004h),a		;b40d
	ld a,(0ca51h)		;b410   ; lee la columna de la sala en la zona (uno mas al salir por la derecha)
	ld (ix+005h),a		;b413
	ld (ix+006h),040h		;b416   ; el byte 6 = 0x40
	ret			;b41a
sitio_de_snake_cc00:		; el byte 0 = el sitio de Snake (3 con 0xD8C0, 2 en un sitio, 4 en una especial, 1)
	ld b,003h		;b41b
	ld a,(0d8c0h)		;b41d   ; lee 1 con Snake dentro de lo de 0xD8C2 (p07:A40D; 0 al salir, p07:A69A)
	or a			;b420
	jr nz,pon_sitio_cc00		;b421
	dec b			;b423
	ld a,(0ca65h)		;b424   ; lee el sitio de 0xCBE0 en el que esta Snake (0 = ninguno)
	or a			;b427
	jr nz,pon_sitio_cc00		;b428
	ld b,004h		;b42a
	ld a,(0ca76h)		;b42c   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	or a			;b42f
	jr nz,pon_sitio_cc00		;b430
	ld b,001h		;b432
pon_sitio_cc00:
	ld (ix+000h),b		;b434
	ret			;b437
al_menos_4:		; E y D al menos 4
	ld a,e			;b438
	cp 004h		;b439
	jr nc,d_al_menos_4		;b43b
	ld e,004h		;b43d
d_al_menos_4:
	ld a,d			;b43f
	cp 004h		;b440
	ret nc			;b442
	ld d,004h		;b443
	ret			;b445
delante_b46d:		; E, D = el sitio de Snake + el de p11:B46D por su direccion (desde 0xE0, 2), pares
	ld a,(0cb0eh)		;b446   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	dec a			;b449
	add a,a			;b44a
	ld hl,0b46dh		;b44b
	call 0423eh		;b44e   ; suma_a_hl: HL = HL + A
	ld a,(0cb03h)		;b451   ; lee la Y de Snake
	add a,(hl)			;b454
	cp 0e0h		;b455
	jr c,y_par		;b457
	ld a,002h		;b459
y_par:
	and 0feh		;b45b
	ld e,a			;b45d
	inc hl			;b45e
	ld a,(0cb05h)		;b45f   ; lee la X de Snake
	add a,(hl)			;b462
	cp 0e0h		;b463
	jr c,x_par		;b465
	ld a,002h		;b467
x_par:
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


no_en_0a_4:		; acarreo en la zona 0x0A sala 4 sin el bit 0 de 0xD7DA y con el 4 de 0xD7D5
	ld a,(0ca4ah)		;b475   ; lee la zona
	cp 00ah		;b478
	jr nz,si_b492		;b47a
	ld a,(0ca4bh)		;b47c   ; lee la sala de la zona
	cp 004h		;b47f
	jr nz,si_b492		;b481
	ld a,(0d7dah)		;b483
	rra			;b486
	jr c,si_b492		;b487
	ld a,(0d7d5h)		;b489
	bit 4,a		;b48c
	jr z,si_b492		;b48e
	scf			;b490
	ret			;b491
si_b492:
	or a			;b492
	ret			;b493
ficha_cc00_paso:		; con lo de p06:AA49 (0xD881-0xD883, 0xD678-0xD69C), sin escena ni 0xCB3C: la ficha de 0xCC00 (IX): con el bit 7 (la cuenta del byte 6) o, sin el, con el disparo 2 recien pulsado, del sitio de Snake: el paso siguiente; en el paso 1, p11:B513
	ld a,(0d881h)		;b494
	inc a			;b497   ; 0xD881 a 0xFF: vale
	jr z,sin_escena_cc00		;b498
	ld a,(0d88ah)		;b49a
	inc a			;b49d
	jr nz,mira_d883_c		;b49e   ; 0xD88A distinto de 0xFF: mira 0xD883
	ld a,(0d680h)		;b4a0
	or a			;b4a3
	jr nz,mira_d883_c		;b4a4   ; con 0xD680...
	ld a,(0d69ch)		;b4a6
	or a			;b4a9
	ret z			;b4aa   ; ...o 0xD69C; sin ninguno, nada
mira_d883_c:
	ld a,(0d883h)		;b4ab
	inc a			;b4ae
	jr nz,sin_escena_cc00		;b4af   ; 0xD883 distinto de 0xFF: vale
	ld a,(0d678h)		;b4b1
	or a			;b4b4
	jr nz,sin_escena_cc00		;b4b5   ; con 0xD678...
	ld a,(0d68ch)		;b4b7
	or a			;b4ba
	ret z			;b4bb   ; ...o 0xD68C; sin ninguno, nada
sin_escena_cc00:
	ld a,(0e040h)		;b4bc   ; lee la escena en curso (1-9, 0 = ninguna; p09:A4A6, guiones en p09:A5D4)
	or a			;b4bf
	ret nz			;b4c0   ; con escena, nada
	ld a,(0cb3ch)		;b4c1
	or a			;b4c4
	ret nz			;b4c5   ; con 0xCB3C, nada
	ld a,(ix+000h)		;b4c6
	bit 7,a		;b4c9   ; con el bit 7...
	jr z,ficha_cc00_disparo		;b4cb
	ld a,(ix+001h)		;b4cd
	dec a			;b4d0
	jr z,ficha_cc00_estalla		;b4d1   ; ...en el paso 1, aparte
	call sitio_cc00		;b4d3   ; sitio_cc00: Z si el byte 0 (sin el bit 7) es el sitio de Snake
	ret nz			;b4d6   ; de otro sitio, nada
	dec (ix+006h)		;b4d7   ; la cuenta...
	ret nz			;b4da
	inc (ix+001h)		;b4db   ; ...al acabar, el paso siguiente
	ret			;b4de
ficha_cc00_disparo:
	ld a,(ix+001h)		;b4df
	dec a			;b4e2
	jr z,ficha_cc00_estalla		;b4e3   ; en el paso 1, aparte
	ld a,(0ca07h)		;b4e5   ; el disparo 2...
	and 020h		;b4e8
	ret z			;b4ea   ; ...sin el, nada
	call sitio_cc00		;b4eb   ; sitio_cc00: Z si el byte 0 (sin el bit 7) es el sitio de Snake
	ret nz			;b4ee   ; de otro sitio, nada
	inc (ix+001h)		;b4ef
	ret			;b4f2
sitio_cc00:		; Z si el byte 0 (sin el bit 7) es el sitio de Snake
	ld b,003h		;b4f3   ; 3 con 0xD8C0...
	ld a,(0d8c0h)		;b4f5   ; lee 1 con Snake dentro de lo de 0xD8C2 (p07:A40D; 0 al salir, p07:A69A)
	or a			;b4f8
	jr nz,compara_sitio_cc00		;b4f9
	dec b			;b4fb   ; ...2 en un sitio...
	ld a,(0ca65h)		;b4fc   ; lee el sitio de 0xCBE0 en el que esta Snake (0 = ninguno)
	or a			;b4ff
	jr nz,compara_sitio_cc00		;b500
	ld b,004h		;b502   ; ...4 en una especial...
	ld a,(0ca76h)		;b504   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	or a			;b507
	jr nz,compara_sitio_cc00		;b508
	ld b,001h		;b50a   ; ...1 en las demas
compara_sitio_cc00:
	ld a,(ix+000h)		;b50c
	and 007h		;b50f   ; sin el bit 7, los 3 bits bajos
	cp b			;b511
	ret			;b512
ficha_cc00_estalla:		; la ficha de 0xCC00 se acaba: fuera, en su sala el fondo de vuelta (p11:B563), en su casilla (p01:7BFC) el golpe de p11:A124 en su sitio + 4, y p03:B1BE con C = 1 en su sitio - 4 (de 0 a 0xB0) y su sala
	xor a			;b513
	ld (ix+000h),a		;b514
	ld (0cb52h),a		;b517
	call fondo_si_aqui		;b51a   ; fondo_si_aqui: en esta sala, el fondo de vuelta (p11:A6AC)
	ld b,(ix+005h)		;b51d   ; su sala...
	ld c,(ix+004h)		;b520
	call 07bfch		;b523   ; ...la sala de la zona
	ld c,a			;b526
	ld a,(ix+002h)		;b527   ; su sitio + 4
	add a,004h		;b52a
	ld e,a			;b52c
	ld a,(ix+003h)		;b52d
	add a,004h		;b530
	ld d,a			;b532
	push ix		;b533
	call golpe_en_sala_c		;b535   ; el golpe
	pop ix		;b538
	ld a,(ix+002h)		;b53a   ; la Y - 4...
	sub 004h		;b53d
	jr nc,y_hasta_b0		;b53f
	xor a			;b541   ; ...no menos de 0...
y_hasta_b0:
	cp 0b0h		;b542
	jr c,pon_y_estalla		;b544   ; ...ni mas de 0xB0
	ld a,0b0h		;b546
pon_y_estalla:
	ld l,a			;b548
	ld a,(ix+003h)		;b549   ; la X igual
	sub 004h		;b54c
	jr nc,x_hasta_b0		;b54e
	xor a			;b550
x_hasta_b0:
	cp 0b0h		;b551
	jr c,pon_x_estalla		;b553
	ld a,0b0h		;b555
pon_x_estalla:
	ld h,a			;b557
	ld e,(ix+004h)		;b558   ; su sala
	ld d,(ix+005h)		;b55b
	ld c,001h		;b55e   ; C = 1
	jp 08f1eh		;b560   ; a_p03_b1be_2: p03:B1BE con el banco 3 en 0xA000
fondo_si_aqui:		; en esta sala, el fondo de vuelta (p11:A6AC)
	ld a,(0ca50h)		;b563   ; lee la fila de la sala en la zona (uno mas al salir por arriba)
	cp (ix+004h)		;b566
	ret nz			;b569
	ld a,(0ca51h)		;b56a   ; lee la columna de la sala en la zona (uno mas al salir por la derecha)
	cp (ix+005h)		;b56d
	ret nz			;b570
	jp guarda_fondo_cc00		;b571   ; guarda_fondo_cc00:
arma_8:		; el arma 8: la primera de las 16 fichas libres de 0xCC80 (sin ninguna, el sonido 0x5C) delante (p11:B5A2); si cabe, p12:6E70 con ella, 0xCB61 = 1 y el sonido 0x17; si no, el 0x5C
	ld ix,0cc80h		;b574   ; apunta a 16 fichas de 8 bytes del arma 8 [sitio][paso][Y][X][fila][columna] (p11:B574)
	ld b,010h		;b578   ; 16 fichas
libre_cc80:
	ld a,(ix+000h)		;b57a
	or a			;b57d
	jr z,pon_arma_8		;b57e   ; libre: esa
	ld de,00008h		;b580
	add ix,de		;b583
	djnz libre_cc80		;b585
	jp 06c77h		;b587   ; sonido_5c: pide el sonido 0x5C
pon_arma_8:
	call cc80_delante		;b58a   ; cc80_delante: el sitio delante (p11:B64B, al menos 4); dentro de 0xC0, sin otra cosa (p07:BB10, BF5C, p11:B475), sin algo solido en sus 4 esquinas de 8 x 8 y sin 0xCB3F, 0xD8A4, 0xCB37 ni 0xCA9B: 0xD752 = 1, el sitio de Snake en el byte 0 (1-4), el paso 0 y su sala
	ld a,(0d752h)		;b58d   ; lee 1 al disparar algo (p11:A995)
	or a			;b590
	jp z,06c77h		;b591   ; no cabe: el 0x5C
	push ix		;b594
	pop hl			;b596
	call 08f78h		;b597   ; p12:6E70
	ld hl,0cb61h		;b59a   ; 0xCB61 = 1
	ld (hl),001h		;b59d
	jp 06a50h		;b59f   ; sonido_17: pide el sonido 0x17
cc80_delante:		; el sitio delante (p11:B64B, al menos 4); dentro de 0xC0, sin otra cosa (p07:BB10, BF5C, p11:B475), sin algo solido en sus 4 esquinas de 8 x 8 y sin 0xCB3F, 0xD8A4, 0xCB37 ni 0xCA9B: 0xD752 = 1, el sitio de Snake en el byte 0 (1-4), el paso 0 y su sala
	call cc80_sitio_delante		;b5a2   ; cc80_sitio_delante: los bytes 2-3 = el sitio de Snake + el de p11:B666 por su direccion
	ld a,(ix+002h)		;b5a5
	cp 0c0h		;b5a8
	ret nc			;b5aa   ; fuera, nada
	ld a,(ix+003h)		;b5ab
	cp 0c0h		;b5ae
	ret nc			;b5b0
	call al_menos_4		;b5b1   ; al_menos_4: E y D al menos 4
	ld a,(ix+002h)		;b5b4   ; la caja: Y + 0x0C...
	add a,00ch		;b5b7
	ld l,a			;b5b9
	ld a,(ix+003h)		;b5ba   ; ...X + 4...
	add a,004h		;b5bd
	ld h,a			;b5bf
	ld de,00810h		;b5c0   ; ...8 x 0x10
	push de			;b5c3
	push hl			;b5c4
	call 06424h		;b5c5   ; a_p07_bb10: p07:BB10 con el banco 7 en 0xA000
	pop hl			;b5c8
	pop de			;b5c9
	ret c			;b5ca
	call 08fa5h		;b5cb   ; a_p07_bf5c: p07:BF5C con el banco 7 en 0xA000
	ret c			;b5ce
	call no_en_0a_4		;b5cf   ; no_en_0a_4: acarreo en la zona 0x0A sala 4 sin el bit 0 de 0xD7DA y con el 4 de 0xD7D5
	ret c			;b5d2
	ld l,(ix+002h)		;b5d3   ; las cuatro esquinas...
	ld h,(ix+003h)		;b5d6
	call 07f3dh		;b5d9   ; es_solido_si: acarreo si el caracter del mapa en (H = X, L = Y) llega al umbral de 0xCA4E (0xCA4F desde 0x81)
	ret c			;b5dc
	ld a,(ix+002h)		;b5dd   ; ...Y + 8...
	add a,008h		;b5e0
	ld l,a			;b5e2
	ld h,(ix+003h)		;b5e3
	call 07f3dh		;b5e6   ; es_solido_si: acarreo si el caracter del mapa en (H = X, L = Y) llega al umbral de 0xCA4E (0xCA4F desde 0x81)
	ret c			;b5e9
	ld l,(ix+002h)		;b5ea
	ld a,(ix+003h)		;b5ed   ; ...X + 8...
	add a,008h		;b5f0
	ld h,a			;b5f2
	call 07f3dh		;b5f3   ; es_solido_si: acarreo si el caracter del mapa en (H = X, L = Y) llega al umbral de 0xCA4E (0xCA4F desde 0x81)
	ret c			;b5f6
	ld a,(ix+002h)		;b5f7   ; ...las dos
	add a,008h		;b5fa
	ld l,a			;b5fc
	ld a,(ix+003h)		;b5fd
	add a,008h		;b600
	ld h,a			;b602
	call 07f3dh		;b603   ; es_solido_si: acarreo si el caracter del mapa en (H = X, L = Y) llega al umbral de 0xCA4E (0xCA4F desde 0x81)
	ret c			;b606
	ld a,(0cb3fh)		;b607   ; lee en la zona 6, lo que hay bajo Snake: 1 con los caracteres 0x90-0xB3, 2 con 0xB8-0xDB (3 con 0xCAAA)
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
	ld (0d752h),a		;b61d   ; 0xD752 = 1
	ld b,004h		;b620   ; 4 en una especial...
	ld a,(0ca76h)		;b622   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	or a			;b625
	jr nz,pon_sitio_cc80		;b626
	dec b			;b628   ; ...3 con 0xD8C0...
	ld a,(0d8c0h)		;b629   ; lee 1 con Snake dentro de lo de 0xD8C2 (p07:A40D; 0 al salir, p07:A69A)
	or a			;b62c
	jr nz,pon_sitio_cc80		;b62d
	dec b			;b62f   ; ...2 en un sitio...
	ld a,(0ca65h)		;b630   ; lee el sitio de 0xCBE0 en el que esta Snake (0 = ninguno)
	or a			;b633
	jr nz,pon_sitio_cc80		;b634
	dec b			;b636   ; ...1 en las demas
pon_sitio_cc80:
	ld (ix+000h),b		;b637
	ld (ix+001h),000h		;b63a   ; el paso 0
	ld a,(0ca50h)		;b63e   ; su sala
	ld (ix+004h),a		;b641
	ld a,(0ca51h)		;b644   ; lee la columna de la sala en la zona (uno mas al salir por la derecha)
	ld (ix+005h),a		;b647
	ret			;b64a
cc80_sitio_delante:		; los bytes 2-3 = el sitio de Snake + el de p11:B666 por su direccion
	ld a,(0cb0eh)		;b64b   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	dec a			;b64e
	add a,a			;b64f
	ld hl,0b666h		;b650
	call 0423eh		;b653   ; suma_a_hl: HL = HL + A
	ld a,(0cb03h)		;b656   ; lee la Y de Snake
	add a,(hl)			;b659
	ld (ix+002h),a		;b65a
	inc hl			;b65d
	ld a,(0cb05h)		;b65e   ; lee la X de Snake
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


cc80_paso:		; fuera del paso 1, salvo con Snake con el dibujo 4, el paso siguiente
	ld a,(ix+001h)		;b66e
	dec a			;b671
	ret z			;b672   ; en el paso 1, nada
	ld a,(0cb01h)		;b673   ; lee el dibujo de Snake (al darse la vuelta se le suma 1, 3 o 5 segun 0xCB00)
	cp 004h		;b676
	ret z			;b678   ; con el dibujo 4, nada
	inc (ix+001h)		;b679
	ret			;b67c
sprites_por_orden:		; los sprites a la VRAM en el orden de los que estan delante segun su Y, por cuantos siguen a Snake (p11:B684)
	ld a,(0caa0h)		;b67d   ; lee cuantos siguen a Snake por su rastro (1-4)
	dec a			;b680
	call 0424dh		;b681   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_B684: 4 destinos del despachador p00:424D (call en p11:B681, el
;   indice en A): B68C, B6B0, B6B0, B6D8; lo leen p11:B681 (8 bytes)
;   0xb684..0xb68c  (8 bytes)
DATA_tabla_B684:
	defw 0b68ch,0b6b0h,0b6b0h,0b6d8h	; b684  -> orden_con_1 orden_con_2 orden_con_2 orden_con_dfd8

; ======================================================================
; CODIGO 0xb68c..0xb8ba  (558 bytes)
; ======================================================================


orden_con_1:		; uno detras: segun si Snake esta por encima del de 0xE240 y los cuadros pares o impares, uno de los cuatro repartos
	ld b,000h		;b68c
	ld hl,0e243h		;b68e   ; apunta a la Y del que sigue a Snake de 0xE240
	ld a,(0cb03h)		;b691   ; Snake por debajo: B = 0
	cp (hl)			;b694
	jr nc,L_B699		;b695
	ld b,001h		;b697
L_B699:
	ld hl,0cae3h		;b699   ; los cuadros...
	inc (hl)			;b69c
	ld a,(hl)			;b69d
	rra			;b69e   ; ...pares...
	jr c,orden_impar		;b69f
	ld a,b			;b6a1
	or a			;b6a2
	jr z,reparto_b715		;b6a3
	jp reparto_b79b		;b6a5   ; reparto_b79b: los colores: 0x40 desde 0x40 y 0x1C0 desde 0x200; los atributos: 0x10 desde 0x10 y 0x70 desde 0x80
orden_impar:
	ld a,b			;b6a8
	or a			;b6a9
	jp z,reparto_b7d5		;b6aa   ; reparto_b7d5: los colores en 7 trozos de 0x40 desde 0x80 y 0x40 desde 0x40; los atributos en 7 de 0x10 desde 0x20 y 0x10 desde 0x10
	jp reparto_b807		;b6ad   ; reparto_b807: los colores: 0x160 desde 0x160 y 0xA0 desde 0x200; los atributos: 0x58 desde 0x58 y 0x28 desde 0x80
orden_con_2:		; dos detras: por las Y de Snake, el de 0xE240 y el de 0xE248, uno de los repartos (o el normal, p00:4F97)
	ld a,(0cb03h)		;b6b0   ; lee la Y de Snake
	ld hl,0e243h		;b6b3   ; apunta a la Y del que sigue a Snake de 0xE240
	cp (hl)			;b6b6
	jr nc,snake_debajo_e240		;b6b7
	ld a,(0e248h)		;b6b9   ; lee la ficha del que sigue a Snake 12 posiciones por detras (0xE0A4)
	cp (hl)			;b6bc
	jr nc,reparto_80_20		;b6bd
	ld hl,0cb03h		;b6bf   ; apunta a la Y de Snake
	cp (hl)			;b6c2
	jr nc,reparto_40_10		;b6c3
	jp reparto_b79b		;b6c5   ; reparto_b79b: los colores: 0x40 desde 0x40 y 0x1C0 desde 0x200; los atributos: 0x10 desde 0x10 y 0x70 desde 0x80
snake_debajo_e240:
	ld hl,0e24bh		;b6c8   ; apunta a la Y del que sigue a Snake de 0xE248
	cp (hl)			;b6cb
	jp c,reparto_b747		;b6cc   ; reparto_b747: los colores: 0x40 desde 0x80, 0x180 desde 0x200, 0x40 desde 0x40; los atributos: 0x10 desde 0x20, 0x60 desde 0x80, 0x10 desde 0x10
	ld a,(0e243h)		;b6cf   ; lee la Y del que sigue a Snake de 0xE240
	cp (hl)			;b6d2
	jp c,04f97h		;b6d3   ; sprites_a_vram: los colores de los sprites (0xDA00) y detras sus atributos (0xDC00)...
	jr reparto_b715		;b6d6
orden_con_dfd8:		; con el de 0xDFD8: Snake por encima, p11:B79B; si no, el normal
	ld hl,0dfdbh		;b6d8
	ld a,(0cb03h)		;b6db   ; lee la Y de Snake
	cp (hl)			;b6de
	jp c,reparto_b79b		;b6df   ; reparto_b79b: los colores: 0x40 desde 0x40 y 0x1C0 desde 0x200; los atributos: 0x10 desde 0x10 y 0x70 desde 0x80
	jp 04f97h		;b6e2   ; sprites_a_vram: los colores de los sprites (0xDA00) y detras sus atributos (0xDC00)...
reparto_80_20:		; los colores de 0x80 bytes en 4 trozos y los atributos de 0x20 en 4
	ld de,00080h		;b6e5
	ld bc,00480h		;b6e8
	ld hl,0da00h		;b6eb   ; apunta a la copia de la tabla de colores de sprites: 32 x 16 lineas (va con 0xDC00 detras)
	call colores_en_trozos		;b6ee   ; colores_en_trozos: B trozos de C bytes de colores, cada uno C mas abajo en la VRAM (desde la tabla de 0xCA0C + 0x200 - DE)
	ld de,00020h		;b6f1
	ld bc,00420h		;b6f4
	ld hl,0dc00h		;b6f7   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	jp atributos_en_trozos		;b6fa   ; atributos_en_trozos: B trozos de C bytes de atributos, cada uno C mas abajo (desde la tabla de 0xCA0E + 0x80 - DE)
reparto_40_10:		; los colores de 0x40 bytes en 8 trozos y los atributos de 0x10 en 8
	ld de,00040h		;b6fd
	ld bc,00840h		;b700
	ld hl,0da00h		;b703   ; apunta a la copia de la tabla de colores de sprites: 32 x 16 lineas (va con 0xDC00 detras)
	call colores_en_trozos		;b706   ; colores_en_trozos: B trozos de C bytes de colores, cada uno C mas abajo en la VRAM (desde la tabla de 0xCA0C + 0x200 - DE)
	ld de,00010h		;b709
	ld bc,00810h		;b70c
	ld hl,0dc00h		;b70f   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	jp atributos_en_trozos		;b712   ; atributos_en_trozos: B trozos de C bytes de atributos, cada uno C mas abajo (desde la tabla de 0xCA0E + 0x80 - DE)
reparto_b715:		; los colores: 0x40 desde 0x200 y 7 trozos de 0x40; los atributos: 0x10 desde 0x80 y 7 de 0x10
	ld de,00200h		;b715
	ld hl,0da00h		;b718   ; apunta a la copia de la tabla de colores de sprites: 32 x 16 lineas (va con 0xDC00 detras)
	call sitio_de_colores		;b71b   ; sitio_de_colores: DE = la tabla de colores de 0xCA0C + 0x200 - DE
	ld bc,00040h		;b71e
	xor a			;b721
	call 04486h		;b722   ; copia_a_vram_espera: espera al VDP (p00:4650) y copia BC bytes de HL a la VRAM de DE
	ld de,00040h		;b725
	ld bc,00740h		;b728
	call colores_en_trozos		;b72b   ; colores_en_trozos: B trozos de C bytes de colores, cada uno C mas abajo en la VRAM (desde la tabla de 0xCA0C + 0x200 - DE)
	ld de,00080h		;b72e
	ld hl,0dc00h		;b731   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	call sitio_de_atributos		;b734   ; sitio_de_atributos: DE = la tabla de atributos de 0xCA0E + 0x80 - DE
	ld bc,00010h		;b737
	xor a			;b73a
	call 04486h		;b73b   ; copia_a_vram_espera: espera al VDP (p00:4650) y copia BC bytes de HL a la VRAM de DE
	ld de,00010h		;b73e
	ld bc,00710h		;b741
	jp atributos_en_trozos		;b744   ; atributos_en_trozos: B trozos de C bytes de atributos, cada uno C mas abajo (desde la tabla de 0xCA0E + 0x80 - DE)
reparto_b747:		; los colores: 0x40 desde 0x80, 0x180 desde 0x200, 0x40 desde 0x40; los atributos: 0x10 desde 0x20, 0x60 desde 0x80, 0x10 desde 0x10
	ld de,00080h		;b747
	ld hl,0da00h		;b74a   ; apunta a la copia de la tabla de colores de sprites: 32 x 16 lineas (va con 0xDC00 detras)
	call sitio_de_colores		;b74d   ; sitio_de_colores: DE = la tabla de colores de 0xCA0C + 0x200 - DE
	ld bc,00040h		;b750
	xor a			;b753
	call 04486h		;b754   ; copia_a_vram_espera: espera al VDP (p00:4650) y copia BC bytes de HL a la VRAM de DE
	ld de,00200h		;b757
	call sitio_de_colores		;b75a   ; sitio_de_colores: DE = la tabla de colores de 0xCA0C + 0x200 - DE
	ld bc,00180h		;b75d
	xor a			;b760
	call 04486h		;b761   ; copia_a_vram_espera: espera al VDP (p00:4650) y copia BC bytes de HL a la VRAM de DE
	ld de,00040h		;b764
	call sitio_de_colores		;b767   ; sitio_de_colores: DE = la tabla de colores de 0xCA0C + 0x200 - DE
	ld bc,00040h		;b76a
	xor a			;b76d
	call 04486h		;b76e   ; copia_a_vram_espera: espera al VDP (p00:4650) y copia BC bytes de HL a la VRAM de DE
	ld de,00020h		;b771
	ld hl,0dc00h		;b774   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	call sitio_de_atributos		;b777   ; sitio_de_atributos: DE = la tabla de atributos de 0xCA0E + 0x80 - DE
	ld bc,00010h		;b77a
	xor a			;b77d
	call 04486h		;b77e   ; copia_a_vram_espera: espera al VDP (p00:4650) y copia BC bytes de HL a la VRAM de DE
	ld de,00080h		;b781
	call sitio_de_atributos		;b784   ; sitio_de_atributos: DE = la tabla de atributos de 0xCA0E + 0x80 - DE
	ld bc,00060h		;b787
	xor a			;b78a
	call 04486h		;b78b   ; copia_a_vram_espera: espera al VDP (p00:4650) y copia BC bytes de HL a la VRAM de DE
	ld de,00010h		;b78e
	call sitio_de_atributos		;b791   ; sitio_de_atributos: DE = la tabla de atributos de 0xCA0E + 0x80 - DE
	ld bc,00010h		;b794
	xor a			;b797
	jp 04486h		;b798   ; copia_a_vram_espera: espera al VDP (p00:4650) y copia BC bytes de HL a la VRAM de DE
reparto_b79b:		; los colores: 0x40 desde 0x40 y 0x1C0 desde 0x200; los atributos: 0x10 desde 0x10 y 0x70 desde 0x80
	ld de,00040h		;b79b
	ld hl,0da00h		;b79e   ; apunta a la copia de la tabla de colores de sprites: 32 x 16 lineas (va con 0xDC00 detras)
	call sitio_de_colores		;b7a1   ; sitio_de_colores: DE = la tabla de colores de 0xCA0C + 0x200 - DE
	ld bc,00040h		;b7a4
	xor a			;b7a7
	call 04486h		;b7a8   ; copia_a_vram_espera: espera al VDP (p00:4650) y copia BC bytes de HL a la VRAM de DE
	ld de,00200h		;b7ab
	call sitio_de_colores		;b7ae   ; sitio_de_colores: DE = la tabla de colores de 0xCA0C + 0x200 - DE
	ld bc,001c0h		;b7b1
	xor a			;b7b4
	call 04486h		;b7b5   ; copia_a_vram_espera: espera al VDP (p00:4650) y copia BC bytes de HL a la VRAM de DE
	ld de,00010h		;b7b8
	ld hl,0dc00h		;b7bb   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	call sitio_de_atributos		;b7be   ; sitio_de_atributos: DE = la tabla de atributos de 0xCA0E + 0x80 - DE
	ld bc,00010h		;b7c1
	xor a			;b7c4
	call 04486h		;b7c5   ; copia_a_vram_espera: espera al VDP (p00:4650) y copia BC bytes de HL a la VRAM de DE
	ld de,00080h		;b7c8
	call sitio_de_atributos		;b7cb   ; sitio_de_atributos: DE = la tabla de atributos de 0xCA0E + 0x80 - DE
	ld bc,00070h		;b7ce
	xor a			;b7d1
	jp 04486h		;b7d2   ; copia_a_vram_espera: espera al VDP (p00:4650) y copia BC bytes de HL a la VRAM de DE
reparto_b7d5:		; los colores en 7 trozos de 0x40 desde 0x80 y 0x40 desde 0x40; los atributos en 7 de 0x10 desde 0x20 y 0x10 desde 0x10
	ld de,00080h		;b7d5
	ld bc,00740h		;b7d8
	ld hl,0da00h		;b7db   ; apunta a la copia de la tabla de colores de sprites: 32 x 16 lineas (va con 0xDC00 detras)
	call colores_en_trozos		;b7de   ; colores_en_trozos: B trozos de C bytes de colores, cada uno C mas abajo en la VRAM (desde la tabla de 0xCA0C + 0x200 - DE)
	ld de,00040h		;b7e1
	call sitio_de_colores		;b7e4   ; sitio_de_colores: DE = la tabla de colores de 0xCA0C + 0x200 - DE
	ld bc,00040h		;b7e7
	xor a			;b7ea
	call 04486h		;b7eb   ; copia_a_vram_espera: espera al VDP (p00:4650) y copia BC bytes de HL a la VRAM de DE
	ld de,00020h		;b7ee
	ld bc,00710h		;b7f1
	ld hl,0dc00h		;b7f4   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	call atributos_en_trozos		;b7f7   ; atributos_en_trozos: B trozos de C bytes de atributos, cada uno C mas abajo (desde la tabla de 0xCA0E + 0x80 - DE)
	ld de,00010h		;b7fa
	call sitio_de_atributos		;b7fd   ; sitio_de_atributos: DE = la tabla de atributos de 0xCA0E + 0x80 - DE
	ld bc,00010h		;b800
	xor a			;b803
	jp 04486h		;b804   ; copia_a_vram_espera: espera al VDP (p00:4650) y copia BC bytes de HL a la VRAM de DE
reparto_b807:		; los colores: 0x160 desde 0x160 y 0xA0 desde 0x200; los atributos: 0x58 desde 0x58 y 0x28 desde 0x80
	ld de,00160h		;b807
	ld hl,0da00h		;b80a   ; apunta a la copia de la tabla de colores de sprites: 32 x 16 lineas (va con 0xDC00 detras)
	call sitio_de_colores		;b80d   ; sitio_de_colores: DE = la tabla de colores de 0xCA0C + 0x200 - DE
	ld bc,00160h		;b810
	xor a			;b813
	call 04486h		;b814   ; copia_a_vram_espera: espera al VDP (p00:4650) y copia BC bytes de HL a la VRAM de DE
	ld de,00200h		;b817
	call sitio_de_colores		;b81a   ; sitio_de_colores: DE = la tabla de colores de 0xCA0C + 0x200 - DE
	ld bc,000a0h		;b81d
	xor a			;b820
	call 04486h		;b821   ; copia_a_vram_espera: espera al VDP (p00:4650) y copia BC bytes de HL a la VRAM de DE
	ld de,00058h		;b824
	ld hl,0dc00h		;b827   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	call sitio_de_atributos		;b82a   ; sitio_de_atributos: DE = la tabla de atributos de 0xCA0E + 0x80 - DE
	ld bc,00058h		;b82d
	xor a			;b830
	call 04486h		;b831   ; copia_a_vram_espera: espera al VDP (p00:4650) y copia BC bytes de HL a la VRAM de DE
	ld de,00080h		;b834
	call sitio_de_atributos		;b837   ; sitio_de_atributos: DE = la tabla de atributos de 0xCA0E + 0x80 - DE
	ld bc,00028h		;b83a
	xor a			;b83d
	jp 04486h		;b83e   ; copia_a_vram_espera: espera al VDP (p00:4650) y copia BC bytes de HL a la VRAM de DE
colores_en_trozos:		; B trozos de C bytes de colores, cada uno C mas abajo en la VRAM (desde la tabla de 0xCA0C + 0x200 - DE)
	call sitio_de_colores		;b841   ; sitio_de_colores: DE = la tabla de colores de 0xCA0C + 0x200 - DE
trozo_de_colores:
	push bc			;b844
	ld b,000h		;b845   ; C bytes
	push bc			;b847
	xor a			;b848
	call 04486h		;b849   ; a la VRAM
	or a			;b84c
	ex de,hl			;b84d
	pop bc			;b84e
	sbc hl,bc		;b84f   ; el trozo siguiente, C mas abajo
	ex de,hl			;b851
	pop bc			;b852
	djnz trozo_de_colores		;b853   ; B trozos
	ret			;b855
sitio_de_colores:		; DE = la tabla de colores de 0xCA0C + 0x200 - DE
	push hl			;b856
	and a			;b857
	ld hl,00200h		;b858
	sbc hl,de		;b85b
	ld de,(0ca0ch)		;b85d   ; lee la direccion en la VRAM de la tabla de colores de sprites (16 bits)
	add hl,de			;b861
	ex de,hl			;b862
	pop hl			;b863
	ret			;b864
atributos_en_trozos:		; B trozos de C bytes de atributos, cada uno C mas abajo (desde la tabla de 0xCA0E + 0x80 - DE)
	call sitio_de_atributos		;b865   ; sitio_de_atributos: DE = la tabla de atributos de 0xCA0E + 0x80 - DE
trozo_de_atributos:
	push bc			;b868
	ld b,000h		;b869
	xor a			;b86b
	call 04486h		;b86c   ; copia_a_vram_espera: espera al VDP (p00:4650) y copia BC bytes de HL a la VRAM de DE
	ld a,e			;b86f
	pop bc			;b870
	sub c			;b871
	ld e,a			;b872
	djnz trozo_de_atributos		;b873
	ret			;b875
sitio_de_atributos:		; DE = la tabla de atributos de 0xCA0E + 0x80 - DE
	push hl			;b876
	and a			;b877
	ld hl,00080h		;b878
	sbc hl,de		;b87b
	ld de,(0ca0eh)		;b87d   ; lee la direccion en la VRAM de la tabla de atributos de sprites (16 bits)
	add hl,de			;b881
	ex de,hl			;b882
	pop hl			;b883
	ret			;b884
ficha_dff8:		; la ficha 0xDFF8 en (E, D): activa, cuenta y paso a 0, su sitio en 0xDFFB-0xDFFC, el de su caja (p11:B8A3) en 0xDFFD-0xDFFE, las rachas de 0xCA61 y el sonido 0x67
	ld hl,0dff8h		;b885   ; apunta a con el, la caja de 0xDFFD/0xDFFE choca (p07:B149)
	ld (hl),001h		;b888
	inc hl			;b88a
	ld (hl),000h		;b88b
	inc hl			;b88d
	ld (hl),000h		;b88e
	inc hl			;b890
	ld (hl),e			;b891
	inc hl			;b892
	ld (hl),d			;b893
	call caja_dff8_sitio		;b894   ; caja_dff8_sitio: E, D = 0xDFFB-0xDFFC + el desplazamiento de p11:B8BA por 0xCA61
	ld hl,0dffdh		;b897   ; el de la caja
	ld (hl),e			;b89a
	inc hl			;b89b
	ld (hl),d			;b89c
	call 06f27h		;b89d   ; las rachas
	jp 06cceh		;b8a0   ; sonido_67: pide el sonido 0x67
caja_dff8_sitio:		; E, D = 0xDFFB-0xDFFC + el desplazamiento de p11:B8BA por 0xCA61
	ld a,(0ca61h)		;b8a3   ; lee 1-4: elige las rachas de p01:6F27 y la caja de p07:B889 (al azar cada 0xF0 cuadros en la mayoria de salas, p10:A0BB)
	dec a			;b8a6
	add a,a			;b8a7
	ld hl,0b8bah		;b8a8
	call 0423eh		;b8ab   ; suma_a_hl: HL = HL + A
	ld a,(0dffbh)		;b8ae   ; lee la Y de la ficha 0xDFF8
	add a,(hl)			;b8b1
	ld e,a			;b8b2
	inc hl			;b8b3
	ld a,(0dffch)		;b8b4   ; lee la X de la ficha 0xDFF8
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


dff8_cada_cuadro:		; saliendo de la sala, 0xDFF8 = 0; con 0xDFF8, su paso (p11:B8D9) y sus sprites (p11:B938)
	ld a,(0ca41h)		;b8c2   ; lee la salida de la sala (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	or a			;b8c5
	jr z,dff8_activa		;b8c6
	ld hl,0dff8h		;b8c8   ; apunta a con el, la caja de 0xDFFD/0xDFFE choca (p07:B149)
	ld (hl),000h		;b8cb
	ret			;b8cd
dff8_activa:
	ld hl,0dff8h		;b8ce   ; apunta a con el, la caja de 0xDFFD/0xDFFE choca (p07:B149)
	ld a,(hl)			;b8d1
	or a			;b8d2
	ret z			;b8d3
	call dff8_paso		;b8d4   ; dff8_paso: la caja se mueve (p11:B8F1); cada 2 cuadros (0xDFF9), 0xDFFA uno mas (0-2)
	jr $+97		;b8d7
dff8_paso:		; la caja se mueve (p11:B8F1); cada 2 cuadros (0xDFF9), 0xDFFA uno mas (0-2)
	call dff8_mueve		;b8d9   ; dff8_mueve: la caja 4 en la direccion de 0xCA61 (p11:B907); fuera de 0xC0, 0xDFF8 = 0
	ld hl,0dff8h		;b8dc   ; apunta a con el, la caja de 0xDFFD/0xDFFE choca (p07:B149)
	ld a,(hl)			;b8df
	or a			;b8e0
	ret z			;b8e1
	inc hl			;b8e2
	dec (hl)			;b8e3   ; la cuenta...
	ld a,(hl)			;b8e4
	and 001h		;b8e5
	ret nz			;b8e7   ; ...cada 2...
	inc hl			;b8e8
	inc (hl)			;b8e9   ; ...el dibujo siguiente...
	ld a,(hl)			;b8ea
	cp 003h		;b8eb
	ret c			;b8ed
	ld (hl),000h		;b8ee   ; ...de 3 a 0
	ret			;b8f0
dff8_mueve:		; la caja 4 en la direccion de 0xCA61 (p11:B907); fuera de 0xC0, 0xDFF8 = 0
	call dff8_direccion		;b8f1   ; dff8_direccion: por 0xCA61 (p11:B910): 1 arriba, 2 abajo, 3 izquierda, 4 derecha
	ld hl,0dffdh		;b8f4   ; apunta a la Y de la caja de 0xDFF8 (se mueve por 0xCA61)
	ld a,(hl)			;b8f7
	cp 0c0h		;b8f8   ; fuera por abajo...
	jr nc,dff8_fuera		;b8fa
	inc hl			;b8fc
	ld a,(hl)			;b8fd
	cp 0c0h		;b8fe   ; ...o la derecha: se acaba
	ret c			;b900
dff8_fuera:
	ld hl,0dff8h		;b901   ; apunta a con el, la caja de 0xDFFD/0xDFFE choca (p07:B149)
	ld (hl),000h		;b904
	ret			;b906
dff8_direccion:		; por 0xCA61 (p11:B910): 1 arriba, 2 abajo, 3 izquierda, 4 derecha
	ld a,(0ca61h)		;b907   ; lee 1-4: elige las rachas de p01:6F27 y la caja de p07:B889 (al azar cada 0xF0 cuadros en la mayoria de salas, p10:A0BB)
	or a			;b90a
	ret z			;b90b
	dec a			;b90c
	call 0424dh		;b90d   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_B910: 4 destinos del despachador p00:424D (call en p11:B90D, el
;   indice en A): B918, B920, B928, B930; lo leen p11:B90D (8 bytes)
;   0xb910..0xb918  (8 bytes)
DATA_tabla_B910:
	defw 0b918h,0b920h,0b928h,0b930h	; b910  -> dffd_menos_4 dffd_mas_4 dffe_menos_4 dffe_mas_4

; ======================================================================
; CODIGO 0xb918..0xb998  (128 bytes)
; ======================================================================


dffd_menos_4:
	ld hl,0dffdh		;b918   ; apunta a la Y de la caja de 0xDFF8 (se mueve por 0xCA61)
	ld a,(hl)			;b91b
	sub 004h		;b91c
	ld (hl),a			;b91e
	ret			;b91f
dffd_mas_4:
	ld hl,0dffdh		;b920   ; apunta a la Y de la caja de 0xDFF8 (se mueve por 0xCA61)
	ld a,(hl)			;b923
	add a,004h		;b924
	ld (hl),a			;b926
	ret			;b927
dffe_menos_4:
	ld hl,0dffeh		;b928   ; apunta a la X de la caja de 0xDFF8
	ld a,(hl)			;b92b
	sub 004h		;b92c
	ld (hl),a			;b92e
	ret			;b92f
dffe_mas_4:
	ld hl,0dffeh		;b930   ; apunta a la X de la caja de 0xDFF8
	ld a,(hl)			;b933
	add a,004h		;b934
	ld (hl),a			;b936
	ret			;b937
sprites_dff8:		; los sprites 4-6 fuera; con 0xDFF8: el de su sitio (p11:B95A), sus colores (p11:B974) y, con 0xCA61, el de la caja (p11:B99E) y su color (p11:B9AC)
	ld hl,0dc10h		;b938
	ld de,0dc11h		;b93b
	ld (hl),0e0h		;b93e
	ld bc,0000bh		;b940
	ldir		;b943
	ld a,(0dff8h)		;b945   ; lee con el, la caja de 0xDFFD/0xDFFE choca (p07:B149)
	or a			;b948
	ret z			;b949
	call sprite_dff8		;b94a   ; sprite_dff8: los sprites 4-5 en 0xDFFB-0xDFFC con el patron 0x28 + 0xDFFA * 8
	call colores_dff8		;b94d   ; colores_dff8: los colores de los sprites 4 y 5 de p11:B998 por 0xDFFA
	ld a,(0ca61h)		;b950   ; lee 1-4: elige las rachas de p01:6F27 y la caja de p07:B889 (al azar cada 0xF0 cuadros en la mayoria de salas, p10:A0BB)
	or a			;b953
	ret z			;b954
	call sprite_de_la_caja		;b955   ; sprite_de_la_caja: el sprite 6 en 0xDFFD-0xDFFE con el patron 0x10
	jr $+84		;b958
sprite_dff8:		; los sprites 4-5 en 0xDFFB-0xDFFC con el patron 0x28 + 0xDFFA * 8
	ld hl,0dc10h		;b95a
	ld a,(0dffah)		;b95d   ; lee el dibujo de la ficha 0xDFF8 (0-2)
	rlca			;b960
	rlca			;b961
	rlca			;b962
	add a,028h		;b963
	ld c,a			;b965
	ld a,(0dffbh)		;b966   ; lee la Y de la ficha 0xDFF8
	ld e,a			;b969
	ld a,(0dffch)		;b96a   ; lee la X de la ficha 0xDFF8
	ld d,a			;b96d
	call 05d41h		;b96e   ; pon_sprite: [E][D][C] en (HL): la Y, la X y el patron de un sprite de 0xDC00
	jp 05d3dh		;b971   ; pon_sprite_mas_4: p00:5D41 con el patron C + 4
colores_dff8:		; los colores de los sprites 4 y 5 de p11:B998 por 0xDFFA
	ld a,(0dffah)		;b974   ; el dibujo...
	add a,a			;b977
	ld hl,0b998h		;b978   ; ...los colores de p11:B998
	call 0423eh		;b97b   ; suma_a_hl: HL = HL + A
	ld b,(hl)			;b97e
	inc hl			;b97f
	ld c,(hl)			;b980
	push bc			;b981
	ld de,0da40h		;b982
	ld h,d			;b985
	ld l,e			;b986
	inc de			;b987
	ld (hl),b			;b988   ; 16 lineas del primero...
	ld bc,0000fh		;b989
	ldir		;b98c
	inc de			;b98e
	inc hl			;b98f
	pop bc			;b990
	ld (hl),c			;b991   ; ...16 del segundo
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
; CODIGO 0xb99e..0xbbeb  (589 bytes)
; ======================================================================


sprite_de_la_caja:		; el sprite 6 en 0xDFFD-0xDFFE con el patron 0x10
	ld hl,0dffdh		;b99e   ; apunta a la Y de la caja de 0xDFF8 (se mueve por 0xCA61)
	ld e,(hl)			;b9a1
	inc hl			;b9a2
	ld d,(hl)			;b9a3
	ld hl,0dc18h		;b9a4
	ld c,010h		;b9a7
	jp 05d41h		;b9a9   ; pon_sprite: [E][D][C] en (HL): la Y, la X y el patron de un sprite de 0xDC00
color_de_la_caja:		; los colores del sprite 6 a 7-0x0E segun los cuadros
	ld a,(0ca03h)		;b9ac   ; lee el contador de cuadros (uno mas en cada interrupcion)
	rra			;b9af
	and 007h		;b9b0
	add a,007h		;b9b2
	ld hl,0da60h		;b9b4
	ld de,0da61h		;b9b7
	ld (hl),a			;b9ba
	ld bc,0000fh		;b9bb
	ldir		;b9be
	ret			;b9c0
especial_2a_sonido:		; sin el bit 1 de 0xD7D1: sin salir, en la sala especial 0x2A sala 0, una vez (0xCADE) el sonido 0x28; fuera de ella, con 0xCADE, a cero, 0xCABF = 0 y el sonido 5
	ld a,(0d7d1h)		;b9c1
	bit 1,a		;b9c4
	jr nz,cade_y_cabf_a_cero		;b9c6   ; con el bit 1, a cero
	ld a,(0ca41h)		;b9c8   ; lee la salida de la sala (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	or a			;b9cb
	jr nz,cade_a_cero		;b9cc   ; saliendo, aparte
	ld a,(0ca76h)		;b9ce   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 02ah		;b9d1
	jr nz,cade_a_cero		;b9d3   ; fuera de la especial 0x2A, aparte
	ld a,(0ca4bh)		;b9d5   ; lee la sala de la zona
	or a			;b9d8
	jr nz,cade_a_cero		;b9d9   ; fuera de la sala 0, aparte
	ld hl,0cadeh		;b9db
	ld a,(hl)			;b9de
	or a			;b9df
	ret nz			;b9e0   ; ya sono, nada
	ld (hl),001h		;b9e1
	jp 06a9bh		;b9e3   ; sonido_28: pide el sonido 0x28
cade_a_cero:
	ld hl,0cadeh		;b9e6
	ld a,(hl)			;b9e9
	or a			;b9ea
	ret z			;b9eb
	xor a			;b9ec
	ld (hl),a			;b9ed
	ld hl,0cabfh		;b9ee
	ld (hl),a			;b9f1
	jp 06b12h		;b9f2   ; sonido_05: pide el sonido 0x05
cabf_a_1:		; 0xCABF = 1
	ld hl,0cabfh		;b9f5
	ld (hl),001h		;b9f8
	ret			;b9fa
cade_y_cabf_a_cero:
	xor a			;b9fb
	ld (0cadeh),a		;b9fc
	ld (0cabfh),a		;b9ff
	ret			;ba02
se_puede_por_el_suelo:		; acarreo si Snake no puede hacer lo suyo por los 3 caracteres de HL: en el estado 2, por p11:BA42 y p11:BAA0; con 0xCB21 = 0x0A, p11:BA42, p11:BAF9 y p11:BAA0; con 0x0B, p11:BAF9 y p11:BAA0; en el 0x0B o en la zona 6 sala 0x10, se puede
	ld hl,0caedh		;ba03
	ld a,(0cb00h)		;ba06   ; lee el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	cp 002h		;ba09
	jr z,suelo_estado_2		;ba0b   ; el estado 2
	cp 00bh		;ba0d
	jr z,se_puede_ba2a		;ba0f   ; el 0x0B: se puede
	ld a,(0ca4ah)		;ba11   ; lee la zona
	cp 006h		;ba14
	jr nz,por_cb21		;ba16
	ld a,(0ca4bh)		;ba18   ; lee la sala de la zona
	cp 010h		;ba1b
	jr z,se_puede_ba2a		;ba1d   ; la zona 6 sala 0x10: se puede
por_cb21:
	ld a,(0cb21h)		;ba1f   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	cp 00ah		;ba22
	jr z,suelo_cb21_0a		;ba24   ; 0x0A
	cp 00bh		;ba26
	jr z,suelo_cb21_0b		;ba28   ; 0x0B
se_puede_ba2a:
	or a			;ba2a
	ret			;ba2b
suelo_estado_2:
	call suelo_de_la_zona		;ba2c   ; suelo_de_la_zona: acarreo si alguno de los 3 caracteres de HL es de los de la zona: la 1 0x2C-0x31, la 6 0x12-0x13, la 7 0x96-0x97 y 0x9C-0xA1, la 0x0A 0x98-0x9F
	ret c			;ba2f
	jr suelo_zona_7_b		;ba30
suelo_cb21_0a:
	call suelo_de_la_zona		;ba32   ; suelo_de_la_zona: acarreo si alguno de los 3 caracteres de HL es de los de la zona: la 1 0x2C-0x31, la 6 0x12-0x13, la 7 0x96-0x97 y 0x9C-0xA1, la 0x0A 0x98-0x9F
	ret c			;ba35
	call suelo_zona_6_b		;ba36   ; suelo_zona_6_b: acarreo en la zona 6 si alguno de los 3 caracteres es de 0x90-0xB3 o 0xB8-0xDB
	ret c			;ba39
	jr suelo_zona_7_b		;ba3a
suelo_cb21_0b:
	call suelo_zona_6_b		;ba3c   ; suelo_zona_6_b: acarreo en la zona 6 si alguno de los 3 caracteres es de 0x90-0xB3 o 0xB8-0xDB
	ret c			;ba3f
	jr suelo_zona_7_b		;ba40
suelo_de_la_zona:		; acarreo si alguno de los 3 caracteres de HL es de los de la zona: la 1 0x2C-0x31, la 6 0x12-0x13, la 7 0x96-0x97 y 0x9C-0xA1, la 0x0A 0x98-0x9F
	push hl			;ba42
	call suelo_por_zona		;ba43   ; suelo_por_zona:
	pop hl			;ba46
	ret			;ba47
suelo_por_zona:
	ld a,(0ca4ah)		;ba48   ; lee la zona
	cp 001h		;ba4b
	jr z,suelo_zona_1		;ba4d   ; la zona 1
	cp 006h		;ba4f
	jr z,suelo_zona_6		;ba51   ; la 6
	cp 007h		;ba53
	jr z,suelo_zona_7		;ba55   ; la 7
	cp 00ah		;ba57
	jr z,suelo_zona_0a		;ba59   ; la 0x0A
	or a			;ba5b   ; las demas: no
	ret			;ba5c
suelo_zona_1:
	ld b,003h		;ba5d
caracter_zona_1:
	ld a,(hl)			;ba5f
	cp 02ch		;ba60
	jr c,siguiente_zona_1		;ba62
	cp 032h		;ba64
	ret c			;ba66
siguiente_zona_1:
	inc hl			;ba67
	djnz caracter_zona_1		;ba68
	or a			;ba6a
	ret			;ba6b
suelo_zona_6:
	ld b,003h		;ba6c
caracter_zona_6:
	ld a,(hl)			;ba6e
	cp 012h		;ba6f
	jr c,siguiente_zona_6		;ba71
	cp 014h		;ba73
	ret c			;ba75
siguiente_zona_6:
	inc hl			;ba76
	djnz caracter_zona_6		;ba77
	or a			;ba79
	ret			;ba7a
suelo_zona_7:
	ld b,003h		;ba7b
caracter_zona_7:
	ld a,(hl)			;ba7d
	cp 096h		;ba7e   ; 0x96-0x97...
	jr c,siguiente_zona_7		;ba80
	cp 098h		;ba82
	ret c			;ba84
	cp 09ch		;ba85   ; ...o 0x9C-0xA1: acarreo
	jr c,siguiente_zona_7		;ba87
	cp 0a2h		;ba89
	ret c			;ba8b
siguiente_zona_7:
	inc hl			;ba8c
	djnz caracter_zona_7		;ba8d
	or a			;ba8f
	ret			;ba90
suelo_zona_0a:
	ld b,003h		;ba91
caracter_zona_0a:
	ld a,(hl)			;ba93
	cp 098h		;ba94
	jr c,siguiente_zona_0a		;ba96
	cp 0a0h		;ba98
	ret c			;ba9a
siguiente_zona_0a:
	inc hl			;ba9b
	djnz caracter_zona_0a		;ba9c
	or a			;ba9e
	ret			;ba9f
suelo_zona_7_b:		; acarreo en la zona 7 (salas 2-4, 8 y 9) si alguno de los 3 caracteres es 0, 0x2A, 0x30-0x36 o no es de 1-3, 6-0x0F, 0x17-0x1F, 0x43-0x4A
	push hl			;baa0
	call suelo_7_b		;baa1   ; suelo_7_b:
	pop hl			;baa4
	ret			;baa5
suelo_7_b:
	ld a,(0ca4ah)		;baa6   ; lee la zona
	cp 007h		;baa9
	jr nz,no_bac6		;baab
	ld a,(0ca76h)		;baad   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	or a			;bab0
	jr nz,no_bac6		;bab1
	ld a,(0ca4bh)		;bab3   ; lee la sala de la zona
	cp 002h		;bab6
	jr c,no_bac6		;bab8
	cp 005h		;baba
	jr c,caracteres_7_b		;babc
	cp 008h		;babe
	jr z,caracteres_7_b		;bac0
	cp 009h		;bac2
	jr z,caracteres_7_b		;bac4
no_bac6:
	or a			;bac6
	ret			;bac7
caracteres_7_b:
	ld b,003h		;bac8
caracter_7_b:
	ld a,(hl)			;baca
	or a			;bacb
	jr z,si_baf7		;bacc   ; el 0: acarreo
	cp 004h		;bace
	ret c			;bad0   ; 1-3: no
	cp 006h		;bad1
	jr c,siguiente_7_b		;bad3   ; 4-5: acarreo
	cp 010h		;bad5
	ret c			;bad7   ; 6-0x0F: no
	cp 017h		;bad8
	jr c,siguiente_7_b		;bada   ; 0x10-0x16: acarreo
	cp 020h		;badc
	ret c			;bade   ; 0x17-0x1F: no
	cp 02ah		;badf
	jr z,si_baf7		;bae1   ; 0x2A: acarreo
	cp 030h		;bae3
	jr c,siguiente_7_b		;bae5   ; 0x20-0x2F: acarreo
	cp 037h		;bae7
	jr c,si_baf7		;bae9   ; 0x30-0x36: acarreo
	cp 043h		;baeb
	jr c,siguiente_7_b		;baed   ; 0x37-0x42: acarreo
	cp 04bh		;baef
	ret c			;baf1   ; 0x43-0x4A: no
siguiente_7_b:
	inc hl			;baf2
	djnz caracter_7_b		;baf3
	or a			;baf5
	ret			;baf6
si_baf7:
	scf			;baf7
	ret			;baf8
suelo_zona_6_b:		; acarreo en la zona 6 si alguno de los 3 caracteres es de 0x90-0xB3 o 0xB8-0xDB
	push hl			;baf9
	call suelo_6_b		;bafa   ; suelo_6_b:
	pop hl			;bafd
	ret			;bafe
suelo_6_b:
	ld a,(0ca4ah)		;baff   ; lee la zona
	cp 006h		;bb02
	jr z,caracteres_6_b		;bb04
	or a			;bb06
	ret			;bb07
caracteres_6_b:
	ld b,003h		;bb08
caracter_6_b:
	ld a,(hl)			;bb0a
	cp 090h		;bb0b   ; 0x90-0xB3...
	jr c,siguiente_6_b		;bb0d
	cp 0b4h		;bb0f
	ret c			;bb11
	cp 0b8h		;bb12   ; ...o 0xB8-0xDB: acarreo
	jr c,siguiente_6_b		;bb14
	cp 0dch		;bb16
	ret c			;bb18
siguiente_6_b:
	inc hl			;bb19
	djnz caracter_6_b		;bb1a
	or a			;bb1c
	ret			;bb1d
caf1_paso:		; con 0xCAF1, por 0xCAF2: el 0 suena 1 y pasa; el 1 pasa, 0xD443 = 1, el sonido 0x46 y el 0x88 (con 0xCAF5 = 10) o el 0x82; el 2, nada
	ld hl,0caf1h		;bb1e   ; apunta a 1 con lo de la cosa 0x0D en marcha (p10:B6BF)
	ld a,(hl)			;bb21
	or a			;bb22
	ret z			;bb23
	inc hl			;bb24
	ld a,(hl)			;bb25
	dec a			;bb26
	jr z,caf2_1		;bb27
	dec a			;bb29
	ret z			;bb2a
	call 06a0dh		;bb2b   ; sonido_01: pide el sonido 0x01
caf2_siguiente:
	ld hl,0caf2h		;bb2e   ; apunta a el paso de lo de 0xCAF1 (p11:BB1E)
	inc (hl)			;bb31
	ret			;bb32
caf2_1:
	call caf2_siguiente		;bb33   ; caf2_siguiente:
	ld hl,0d443h		;bb36
	ld (hl),001h		;bb39
	call 06c33h		;bb3b   ; sonido_46: pide el sonido 0x46
	ld a,(0caf5h)		;bb3e   ; lee cuantas veces se uso la cosa 0x0D (hasta 10)
	cp 00ah		;bb41
	jp z,06c9bh		;bb43   ; sonido_88: pide el sonido 0x88 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	jp 06abfh		;bb46   ; sonido_82: pide el sonido 0x82 (de los que tienen la partitura en un banco de musica, p16:4CE3) (antes, L_6CDA)
ca89_cada_cuadro:		; con la cosa 0x10 (0xD674): sin 0xCA8E, 0xCA89 baja o sube hacia 2 cada 8 cuadros cuando acaba la cuenta 0xCA8A (que baja salvo en escena), y en 2 fuera los bits 2-3 de 0xD7D4; con 0xCA8E, hacia 0 (1) o 4 (2) cada 0x10 cuadros, y al llegar el bit 2 (cuenta 0x400) o el 3 (0x8000) de 0xD7D4; con la cosa 0x10 elegida, su dibujo (p11:BBEB) en el sitio de 0xD8A4
	ld a,(0d674h)		;bb49
	or a			;bb4c
	ret z			;bb4d   ; sin la cosa, nada
	ld a,(0ca8eh)		;bb4e   ; lee 1-2: hacia donde va 0xCA89 (0 o 4; p10:A0DB)
	or a			;bb51
	jr nz,ca89_con_ca8e		;bb52   ; con 0xCA8E, aparte
	ld a,(0ca89h)		;bb54   ; lee 0-4: lo de la cosa 0x10 (p11:BB49; su dibujo en p11:BBEB)
	cp 002h		;bb57
	jr z,quita_d7d4_2_3		;bb59   ; en 2, aparte
	ld hl,(0ca8ah)		;bb5b   ; la cuenta...
	ld a,h			;bb5e
	or l			;bb5f
	jr z,ca89_hacia_2		;bb60
	ld a,(0cb3ch)		;bb62
	or a			;bb65
	ret nz			;bb66   ; ...en escena no baja
	dec hl			;bb67
	ld (0ca8ah),hl		;bb68   ; guarda la cuenta de 16 bits de 0xCA89
	ret			;bb6b
quita_d7d4_2_3:		; fuera los bits 2 y 3 de 0xD7D4
	ld hl,0d7d4h		;bb6c
	ld a,(hl)			;bb6f
	and 0f3h		;bb70
	ld (hl),a			;bb72
	ret			;bb73
ca89_hacia_2:
	call quita_d7d4_2_3		;bb74   ; quita_d7d4_2_3: fuera los bits 2 y 3 de 0xD7D4
	ld hl,0ca8ch		;bb77   ; apunta a la cuenta de 8/16 cuadros de 0xCA89
	dec (hl)			;bb7a   ; cada 8 cuadros...
	ret nz			;bb7b
	ld (hl),008h		;bb7c
	ld hl,0ca89h		;bb7e   ; apunta a 0-4: lo de la cosa 0x10 (p11:BB49; su dibujo en p11:BBEB)
	ld a,(hl)			;bb81
	cp 002h		;bb82   ; ...desde 2 baja...
	ld b,0ffh		;bb84
	jr nc,pon_ca89		;bb86
	ld b,001h		;bb88   ; ...por debajo sube
pon_ca89:
	add a,b			;bb8a
	ld (hl),a			;bb8b
	jr dibujo_de_ca89		;bb8c
ca89_con_ca8e:		; con 0xCA8E = 1, hacia 0; con 2, hacia 4
	ld bc,000ffh		;bb8e
	ld a,(0ca8eh)		;bb91   ; lee 1-2: hacia donde va 0xCA89 (0 o 4; p10:A0DB)
	dec a			;bb94
	jr z,ca89_hacia_b		;bb95
	ld bc,00401h		;bb97
ca89_hacia_b:
	ld a,(0ca89h)		;bb9a   ; lee 0-4: lo de la cosa 0x10 (p11:BB49; su dibujo en p11:BBEB)
	cp b			;bb9d
	ret z			;bb9e   ; ya llego, nada
	ld hl,0ca8ch		;bb9f   ; apunta a la cuenta de 8/16 cuadros de 0xCA89
	dec (hl)			;bba2
	ret nz			;bba3   ; cada 0x10 cuadros
	ld (hl),010h		;bba4
	ld hl,0ca89h		;bba6   ; apunta a 0-4: lo de la cosa 0x10 (p11:BB49; su dibujo en p11:BBEB)
	ld a,(hl)			;bba9
	add a,c			;bbaa
	ld (hl),a			;bbab
	cp b			;bbac
	jr nz,dibujo_de_ca89		;bbad   ; llega...
	ld hl,0d7d4h		;bbaf
	or a			;bbb2
	jr z,ca89_a_0		;bbb3
	set 2,(hl)		;bbb5   ; ...a 4: el bit 2 y 0x400
	ld hl,00400h		;bbb7
	ld (0ca8ah),hl		;bbba   ; guarda la cuenta de 16 bits de 0xCA89
	jr dibujo_de_ca89		;bbbd
ca89_a_0:		; a 0: el bit 3 y 0x8000
	set 3,(hl)		;bbbf
	ld hl,08000h		;bbc1
	ld (0ca8ah),hl		;bbc4   ; guarda la cuenta de 16 bits de 0xCA89
dibujo_de_ca89:
	ld a,(0cb21h)		;bbc7   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	cp 010h		;bbca
	ret nz			;bbcc   ; sin la 0x10 elegida, nada
	call borra_d8a4_c		;bbcd   ; borra el sitio
	ld a,(0ca89h)		;bbd0   ; el dibujo de 0xCA89...
	ld hl,0bbebh		;bbd3
	call 043f6h		;bbd6   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld de,0d8a4h		;bbd9
	ld a,(0ca42h)		;bbdc   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	rlca			;bbdf
	rlca			;bbe0
	rlca			;bbe1
	rlca			;bbe2
	or 0c8h		;bbe3
	ld bc,01010h		;bbe5   ; ...16 x 16
	jp 047edh		;bbe8   ; copia_rectangulo_logica: orden LMMM del VDP con la operacion logica de A

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


borra_d8a4_c:
	ld hl,0d8a4h		;bbf5
	jp 08f0eh		;bbf8   ; p02:8F0E
ca90_empieza:		; 0xCA90 = 1, 0xCA91-0xCA92 = 0x0600 y el bit 6 de 0xD7D7
	ld hl,0ca90h		;bbfb   ; apunta a el paso de lo de la cosa 0x0F (1-5, p11:BC0C)
	ld (hl),001h		;bbfe
	inc hl			;bc00
	ld (hl),000h		;bc01
	inc hl			;bc03
	ld (hl),006h		;bc04
	ld hl,0d7d7h		;bc06
	set 6,(hl)		;bc09   ; el bit 6 de 0xD7D7
	ret			;bc0b
ca90_cada_cuadro:		; con 0xCA90, su paso (p11:BC15, 5): al acabar cada cuenta (p11:BCA0), la siguiente y el dibujo de la cosa 0x0F (p11:BCB1)
	ld a,(0ca90h)		;bc0c   ; lee el paso de lo de la cosa 0x0F (1-5, p11:BC0C)
	or a			;bc0f
	ret z			;bc10
	dec a			;bc11
	call 0424dh		;bc12   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_BC15: 5 destinos del despachador p00:424D (call en p11:BC12, el
;   indice en A): BC1F, BC34, BC46, BC62, BC8B; lo leen p11:BC12 (10 bytes)
;   0xbc15..0xbc1f  (10 bytes)
DATA_tabla_BC15:
	defw 0bc1fh,0bc34h,0bc46h,0bc62h,0bc8bh	; bc15

; ======================================================================
; CODIGO 0xbc1f..0xbd9d  (382 bytes)
; ======================================================================


ca90_paso_1:		; al acabar la cuenta: 0x0300, el dibujo de (0xC0, 0x90) y el paso siguiente
	call cuenta_ca91		;bc1f   ; cuenta_ca91: 0xCA91-0xCA92 uno menos; Z a cero
	ret nz			;bc22
	ld de,00300h		;bc23
	call pon_ca91		;bc26   ; pon_ca91: 0xCA91-0xCA92 = DE
	ld hl,0c090h		;bc29
	call dibujo_de_0f		;bc2c   ; dibujo_de_0f: con la cosa 0x0F elegida: borra el sitio de 0xD8A4 y copia ahi 16 x 16 de HL
ca90_siguiente:
	ld hl,0ca90h		;bc2f   ; apunta a el paso de lo de la cosa 0x0F (1-5, p11:BC0C)
	inc (hl)			;bc32
	ret			;bc33
ca90_paso_2:		; al acabar: 0x80, el dibujo de (0xD0, 0x90) y el paso siguiente
	call cuenta_ca91		;bc34   ; cuenta_ca91: 0xCA91-0xCA92 uno menos; Z a cero
	ret nz			;bc37
	ld de,00080h		;bc38
	call pon_ca91		;bc3b   ; pon_ca91: 0xCA91-0xCA92 = DE
	ld hl,0d090h		;bc3e
	call dibujo_de_0f		;bc41   ; dibujo_de_0f: con la cosa 0x0F elegida: borra el sitio de 0xD8A4 y copia ahi 16 x 16 de HL
	jr ca90_siguiente		;bc44
ca90_paso_3:		; al acabar: 0x20, el dibujo de (0xB0, 0xA0), el bit 3 de 0xD7D7, fuera el 7 de 0xD7E3 y el paso siguiente
	call cuenta_ca91		;bc46   ; cuenta_ca91: 0xCA91-0xCA92 uno menos; Z a cero
	ret nz			;bc49
	ld de,00020h		;bc4a
	call pon_ca91		;bc4d   ; pon_ca91: 0xCA91-0xCA92 = DE
	ld hl,0b0a0h		;bc50
	call dibujo_de_0f		;bc53   ; dibujo_de_0f: con la cosa 0x0F elegida: borra el sitio de 0xD8A4 y copia ahi 16 x 16 de HL
	ld hl,0d7d7h		;bc56
	set 3,(hl)		;bc59
	ld hl,0d7e3h		;bc5b
	res 7,(hl)		;bc5e
	jr ca90_siguiente		;bc60
ca90_paso_4:		; al acabar: 0x10, el dibujo de (0xC0, 0xA0), el paso siguiente y, con la cosa 0x0F elegida, el bit 2 de 0xD7D7, fuera el 6 de 0xD7DF, p03:AF05 y el sonido 0x26
	call cuenta_ca91		;bc62   ; cuenta_ca91: 0xCA91-0xCA92 uno menos; Z a cero
	ret nz			;bc65
	ld de,00010h		;bc66
	call pon_ca91		;bc69   ; pon_ca91: 0xCA91-0xCA92 = DE
	ld hl,0c0a0h		;bc6c
	call dibujo_de_0f		;bc6f   ; dibujo_de_0f: con la cosa 0x0F elegida: borra el sitio de 0xD8A4 y copia ahi 16 x 16 de HL
	call ca90_siguiente		;bc72   ; ca90_siguiente:
	ld a,(0cb21h)		;bc75   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	cp 00fh		;bc78
	ret nz			;bc7a
	ld hl,0d7d7h		;bc7b
	set 2,(hl)		;bc7e
	ld hl,0d7dfh		;bc80
	res 6,(hl)		;bc83
	call 08f70h		;bc85   ; a_p03_af05_2: p03:AF05 con el banco 3 en 0xA000
	jp 06a93h		;bc88   ; sonido_26: pide el sonido 0x26
ca90_paso_5:		; al acabar: 0x100, el dibujo de (0xB0, 0xA0) y el paso de antes (se alternan)
	call cuenta_ca91		;bc8b   ; cuenta_ca91: 0xCA91-0xCA92 uno menos; Z a cero
	ret nz			;bc8e
	ld de,00100h		;bc8f
	call pon_ca91		;bc92   ; pon_ca91: 0xCA91-0xCA92 = DE
	ld hl,0b0a0h		;bc95
	call dibujo_de_0f		;bc98   ; dibujo_de_0f: con la cosa 0x0F elegida: borra el sitio de 0xD8A4 y copia ahi 16 x 16 de HL
	ld hl,0ca90h		;bc9b   ; apunta a el paso de lo de la cosa 0x0F (1-5, p11:BC0C)
	dec (hl)			;bc9e
	ret			;bc9f
cuenta_ca91:		; 0xCA91-0xCA92 uno menos; Z a cero
	ld hl,(0ca91h)		;bca0   ; lee la cuenta de 16 bits de 0xCA90
	dec hl			;bca3
	ld (0ca91h),hl		;bca4   ; guarda la cuenta de 16 bits de 0xCA90
	ld a,l			;bca7
	or h			;bca8
	ret			;bca9
pon_ca91:		; 0xCA91-0xCA92 = DE
	ld hl,0ca91h		;bcaa   ; apunta a la cuenta de 16 bits de 0xCA90
	ld (hl),e			;bcad
	inc hl			;bcae
	ld (hl),d			;bcaf
	ret			;bcb0
dibujo_de_0f:		; con la cosa 0x0F elegida: borra el sitio de 0xD8A4 y copia ahi 16 x 16 de HL
	ld a,(0cb21h)		;bcb1   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	cp 00fh		;bcb4
	ret nz			;bcb6
	push hl			;bcb7
	ld hl,0d8a4h		;bcb8
	call 08f0eh		;bcbb   ; p02:8F0E
	pop hl			;bcbe
	ld de,0d8a4h		;bcbf
	ld a,(0ca42h)		;bcc2   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	rlca			;bcc5
	rlca			;bcc6
	rlca			;bcc7
	rlca			;bcc8
	or 0c8h		;bcc9
	ld bc,01010h		;bccb
	jp 047edh		;bcce   ; copia_rectangulo_logica: orden LMMM del VDP con la operacion logica de A
sombra_de_cb21_1:		; con 0xCB21 = 1 y fuera del estado 6: en el estado 0x14 o desde el 0x1B, el sprite 4 fuera; parado sin nada lanzado (p11:BD31): en los estados 2 y 0x0B (o 0xCB27 < 2, o sin 0xCA61), los sprites 4-7 fuera; si no, el dibujo de 0xCA61 (p11:BD46), el sprite delante (p11:BD70) y su color 7
	ld a,(0cb00h)		;bcd1   ; lee el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	cp 006h		;bcd4
	ret z			;bcd6   ; en el estado 6, nada
	ld a,(0cb21h)		;bcd7   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	dec a			;bcda
	ret nz			;bcdb   ; sin 0xCB21 = 1, nada
	ld a,(0cb00h)		;bcdc   ; lee el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	cp 014h		;bcdf
	jr z,sprite_4_fuera		;bce1   ; el 0x14...
	cp 01bh		;bce3
	jr nc,sprite_4_fuera		;bce5   ; ...y desde el 0x1B
	call parado_sin_lanzar		;bce7   ; parado_sin_lanzar: acarreo si Snake no avanza (0xCB0F) y no hay nada lanzado
	ret nc			;bcea   ; moviendose, nada
	ld a,(0cb00h)		;bceb   ; lee el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	cp 002h		;bcee
	jr z,sprites_4_7_fuera		;bcf0
	cp 00bh		;bcf2
	jr z,sprites_4_7_fuera		;bcf4
	ld a,(0ca61h)		;bcf6   ; lee 1-4: elige las rachas de p01:6F27 y la caja de p07:B889 (al azar cada 0xF0 cuadros en la mayoria de salas, p10:A0BB)
	or a			;bcf9
	ret z			;bcfa   ; sin 0xCA61, nada
	ld a,(0cb27h)		;bcfb
	cp 002h		;bcfe
	jr c,sprites_4_7_fuera		;bd00   ; 0xCB27 por debajo de 2
	call dibujo_de_ca61		;bd02   ; dibujo_de_ca61: el dibujo de p11:BD54 a (0x40, 0xF1) de la pagina 3, 0x40 x 1
	call sprite_de_ca61		;bd05   ; el sprite
	ld hl,0da40h		;bd08   ; su color 7
	ld de,0da41h		;bd0b
	ld (hl),007h		;bd0e
	ld bc,0000fh		;bd10
	ldir		;bd13
	ret			;bd15
sprite_4_fuera:
	ld a,0e0h		;bd16
	ld (0dc10h),a		;bd18
	ret			;bd1b
sprites_4_7_fuera:		; salvo en el estado 6, los sprites 4-7 fuera
	ld a,(0cb00h)		;bd1c   ; lee el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	cp 006h		;bd1f
	ret z			;bd21
	ld hl,0dc10h		;bd22
	ld de,0dc11h		;bd25
	ld (hl),0e0h		;bd28
	ldi		;bd2a
	ldi		;bd2c
	ldi		;bd2e
	ret			;bd30
parado_sin_lanzar:		; acarreo si Snake no avanza (0xCB0F) y no hay nada lanzado
	ld a,(0cb0fh)		;bd31   ; lee 1 si Snake ha chocado en este cuadro
	or a			;bd34
	ret z			;bd35
	ld hl,0cb80h		;bd36   ; apunta a las 6 fichas de 16 bytes de lo que lanza Snake ([tipo][..][Y 8.8][X 8.8][velocidades]...)
	ld de,00010h		;bd39
	ld b,006h		;bd3c
mira_cb80:
	ld a,(hl)			;bd3e
	or a			;bd3f
	ret nz			;bd40   ; alguna activa: NC
	add hl,de			;bd41   ; la siguiente
	djnz mira_cb80		;bd42
	scf			;bd44   ; ninguna: acarreo
	ret			;bd45
dibujo_de_ca61:		; el dibujo de p11:BD54 a (0x40, 0xF1) de la pagina 3, 0x40 x 1
	call sitio_de_ca61		;bd46   ; sitio_de_ca61: HL = (0 u 0x80 por el bit 0 de 0xCA61, 0xC4 o 0xC5 desde el 3), 0x40 mas con 0xCB27 = 3
	ld de,040f1h		;bd49
	ld bc,04001h		;bd4c
	ld a,007h		;bd4f
	jp 04767h		;bd51   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
sitio_de_ca61:		; HL = (0 u 0x80 por el bit 0 de 0xCA61, 0xC4 o 0xC5 desde el 3), 0x40 mas con 0xCB27 = 3
	ld l,0c4h		;bd54
	ld a,(0ca61h)		;bd56   ; lee 1-4: elige las rachas de p01:6F27 y la caja de p07:B889 (al azar cada 0xF0 cuadros en la mayoria de salas, p10:A0BB)
	cp 003h		;bd59
	jr c,mitad_de_ca61		;bd5b
	inc l			;bd5d
mitad_de_ca61:
	ld h,000h		;bd5e
	rra			;bd60
	jr c,mas_40		;bd61
	ld h,080h		;bd63
mas_40:
	ld a,(0cb27h)		;bd65
	cp 003h		;bd68   ; con 0xCB27 = 3...
	ret nz			;bd6a
	ld a,h			;bd6b   ; ...0x40 mas
	add a,040h		;bd6c
	ld h,a			;bd6e
	ret			;bd6f
sprite_de_ca61:		; el sprite 4 en el sitio de Snake (+ 0xCB43) mas el de p11:BD9D por su direccion y 0xCA61, con el patron 0x14
	ld a,(0cb0eh)		;bd70   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	dec a			;bd73
	add a,a			;bd74
	add a,a			;bd75
	add a,a			;bd76
	ld b,a			;bd77
	ld a,(0ca61h)		;bd78   ; lee 1-4: elige las rachas de p01:6F27 y la caja de p07:B889 (al azar cada 0xF0 cuadros en la mayoria de salas, p10:A0BB)
	dec a			;bd7b
	add a,a			;bd7c
	add a,b			;bd7d
	ld hl,0bd9dh		;bd7e
	call 0423eh		;bd81   ; suma_a_hl: HL = HL + A
	ld a,(0cb03h)		;bd84   ; lee la Y de Snake
	add a,(hl)			;bd87
	ld e,a			;bd88
	ld a,(0cb43h)		;bd89   ; lee lo que baja la caja de Snake en los choques (p07:B5FE)
	add a,e			;bd8c
	ld e,a			;bd8d
	inc hl			;bd8e
	ld a,(0cb05h)		;bd8f   ; lee la X de Snake
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


quita_de_sitio_c:		; a cero las fichas de 0xCC00, 0xCC80 y 0xD760 del sitio C (sin el bit 7)
	push ix		;bdbd
	call quita_cc00_c		;bdbf   ; quita_cc00_c:
	call quita_cc80_c		;bdc2   ; quita_cc80_c:
	call quita_d760_c		;bdc5   ; quita_d760_c:
	pop ix		;bdc8
	ret			;bdca
quita_cc00_c:
	ld ix,0cc00h		;bdcb   ; apunta a 8 fichas de 16 bytes del arma 7 [sitio][paso][Y][X][fila][columna][cuenta] (p11:B380)
	ld b,008h		;bdcf
ficha_cc00_c_b:
	ld a,(ix+000h)		;bdd1
	and 07fh		;bdd4   ; sin el bit 7
	jr z,siguiente_cc00_c_b		;bdd6
	cp c			;bdd8   ; del sitio C...
	jr nz,siguiente_cc00_c_b		;bdd9
	ld (ix+000h),000h		;bddb   ; ...fuera
siguiente_cc00_c_b:
	ld de,00010h		;bddf
	add ix,de		;bde2
	djnz ficha_cc00_c_b		;bde4
	ret			;bde6
quita_cc80_c:
	ld ix,0cc80h		;bde7   ; apunta a 16 fichas de 8 bytes del arma 8 [sitio][paso][Y][X][fila][columna] (p11:B574)
	ld b,010h		;bdeb
ficha_cc80_c:
	ld a,(ix+000h)		;bded
	and 07fh		;bdf0   ; sin el bit 7
	jr z,siguiente_cc80_c_b		;bdf2
	cp c			;bdf4   ; del sitio C...
	jr nz,siguiente_cc80_c_b		;bdf5
	ld (ix+000h),000h		;bdf7   ; ...fuera
siguiente_cc80_c_b:
	ld de,00008h		;bdfb
	add ix,de		;bdfe
	djnz ficha_cc80_c		;be00
	ret			;be02
quita_d760_c:
	ld a,(0d760h)		;be03   ; lee una ficha de 16 bytes [sitio][..][Y][X][fila][columna]; la toca Snake en p07:B1E0
	or a			;be06
	ret z			;be07
	cp c			;be08
	ret nz			;be09
	xor a			;be0a
	ld (0d760h),a		;be0b   ; guarda una ficha de 16 bytes [sitio][..][Y][X][fila][columna]; la toca Snake en p07:B1E0
	ret			;be0e
cb78_cada_2:		; cada 2 cuadros (0xCB7C), hasta el 0x17 de 0xCB7B: 0xCB78 = 1, su sitio de p11:BE3D a 0xCB79-0xCB7A, 0xCB7B uno mas y el sonido 0x43; al 0x17, 0xCB78 = 0
	ld hl,0cb7ch		;be0f   ; apunta a la cuenta de 2 cuadros de 0xCB78
	dec (hl)			;be12
	ret nz			;be13
	ld (hl),002h		;be14
	ld a,(0cb7bh)		;be16   ; lee el sitio de 0xCB78 en p11:BE3D (hasta 0x17)
	cp 017h		;be19
	jr z,cb78_acaba		;be1b
	add a,a			;be1d
	ld hl,0be3dh		;be1e
	call 0423eh		;be21   ; suma_a_hl: HL = HL + A
	ld e,(hl)			;be24
	inc hl			;be25
	ld d,(hl)			;be26
	ld hl,0cb78h		;be27   ; apunta a 1 con el sprite de 0xCB79-0xCB7A en marcha (p11:BE0F)
	ld (hl),001h		;be2a
	inc hl			;be2c
	ld (hl),e			;be2d
	inc hl			;be2e
	ld (hl),d			;be2f
	ld hl,0cb7bh		;be30   ; apunta a el sitio de 0xCB78 en p11:BE3D (hasta 0x17)
	inc (hl)			;be33
	jp 06c2bh		;be34   ; sonido_43: pide el sonido 0x43
cb78_acaba:
	ld hl,0cb78h		;be37   ; apunta a 1 con el sprite de 0xCB79-0xCB7A en marcha (p11:BE0F)
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


sprite_cb78:		; con 0xCB78, el sprite 4 en 0xCB79-0xCB7A con el patron 0xF0 (0xF4 a medias) y color 7
	ld a,(0cb78h)		;be6b   ; lee 1 con el sprite de 0xCB79-0xCB7A en marcha (p11:BE0F)
	or a			;be6e
	ret z			;be6f
	ld hl,0dc10h		;be70
	ld a,(0cb79h)		;be73
	ld (hl),a			;be76
	inc hl			;be77
	ld a,(0cb7ah)		;be78
	ld (hl),a			;be7b
	inc hl			;be7c
	ld a,(0cb7ch)		;be7d   ; lee la cuenta de 2 cuadros de 0xCB78
	cp 002h		;be80
	ld c,0f0h		;be82
	jr z,pon_patron_cb78		;be84
	ld c,0f4h		;be86
pon_patron_cb78:
	ld (hl),c			;be88
	ld hl,0da40h		;be89
	ld bc,0000fh		;be8c
	ld a,007h		;be8f
	jp 04237h		;be91   ; llena_bloque: pone A en BC + 1 bytes desde HL
sin_sprites_4_7_b:		; los sprites 4-7 fuera
	ld hl,0dc10h		;be94   ; los sprites 4-7...
	ld de,0dc11h		;be97
	ld (hl),0e0h		;be9a   ; ...a 0xE0
	ld bc,0000fh		;be9c
	ldir		;be9f
	ret			;bea1
sprites_de_caac:		; con los mensajes de los bancos 50-51: sin 0xCAAC, los sprites 4-7 fuera; con el, fuera y los de p11:BECB con color 7
	ld a,(0ca97h)		;bea2   ; lee 1 si los mensajes salen de los bancos 50-51 y no de 48-49
	or a			;bea5
	ret z			;bea6
	ld a,(0caach)		;bea7
	or a			;beaa
	jr z,sin_sprites_4_7_b		;beab
	ld hl,0dc10h		;bead
	ld de,0dc11h		;beb0
	ld (hl),0e0h		;beb3
	ld bc,0000fh		;beb5
	ldir		;beb8
	call sprites_bed4		;beba   ; sprites_bed4: por los cuadros / 2 & 7 (p11:BED4)
	ld hl,0da40h		;bebd
	ld de,0da41h		;bec0
	ld (hl),007h		;bec3
	ld bc,0001fh		;bec5
	ldir		;bec8
	ret			;beca
sprites_bed4:		; por los cuadros / 2 & 7 (p11:BED4)
	ld a,(0ca03h)		;becb   ; lee el contador de cuadros (uno mas en cada interrupcion)
	rra			;bece
	and 007h		;becf
	call 0424dh		;bed1   ; despachador: salta a la palabra A de la tabla que va detras del call

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


sprites_c810:		; los sprites 4-5 en (0xC8, 0x10) y (0xD8, 0x10) con el patron 0x20
	ld hl,0dc10h		;bee4
	ld c,020h		;bee7
	ld de,0c810h		;bee9
	call 05d41h		;beec   ; pon_sprite: [E][D][C] en (HL): la Y, la X y el patron de un sprite de 0xDC00
	ld d,0d8h		;beef
	jp 05d3dh		;bef1   ; pon_sprite_mas_4: p00:5D41 con el patron C + 4
sprites_c42e:		; los sprites 4-5 en (0xC4, 0x2E) y (0xD4, 0x2E) con el patron 0x18
	ld hl,0dc10h		;bef4
	ld c,018h		;bef7
	ld de,0c42eh		;bef9
	call 05d41h		;befc   ; pon_sprite: [E][D][C] en (HL): la Y, la X y el patron de un sprite de 0xDC00
	ld d,0d4h		;beff
	jp 05d3dh		;bf01   ; pon_sprite_mas_4: p00:5D41 con el patron C + 4
sin_sprites_4_5:
	ld hl,0dc10h		;bf04
	ld a,0e0h		;bf07
	ld bc,00007h		;bf09
	jp 04237h		;bf0c   ; llena_bloque: pone A en BC + 1 bytes desde HL
sprites_e1d0:		; los 14 sprites de la ficha 0xE1D0 (p11:BF14) y sus colores (p11:BF5D)
	call sprites_de_e1d0		;bf0f   ; sprites_de_e1d0: 7 parejas desde el sprite 4: en su sitio (0xE1D2, 0xE1D3) + los de p11:BF4F, patrones desde 0x0C de 4 en 4
	jr $+75		;bf12
sprites_de_e1d0:		; 7 parejas desde el sprite 4: en su sitio (0xE1D2, 0xE1D3) + los de p11:BF4F, patrones desde 0x0C de 4 en 4
	ld de,0bf4fh		;bf14   ; los desplazamientos de p11:BF4F
	ld hl,0dc10h		;bf17
	exx			;bf1a
	ld c,00ch		;bf1b   ; el patron 0x0C
	exx			;bf1d
	ld b,007h		;bf1e   ; 7 parejas
pareja_e1d0:
	push bc			;bf20
	ld a,(0e1d2h)		;bf21   ; lee la X de la ficha 0xE1D0
	ld b,a			;bf24
	ld a,(de)			;bf25   ; la Y + el suyo
	add a,b			;bf26
	ld c,a			;bf27
	inc de			;bf28
	ld (hl),c			;bf29
	inc hl			;bf2a
	ld a,(0e1d3h)		;bf2b   ; lee la Y de la ficha 0xE1D0
	ld b,a			;bf2e
	ld a,(de)			;bf2f   ; la X + el suyo
	add a,b			;bf30
	ld b,a			;bf31
	inc de			;bf32
	ld (hl),b			;bf33
	inc hl			;bf34
	exx			;bf35
	ld a,c			;bf36
	add a,004h		;bf37   ; el patron siguiente
	ld c,a			;bf39
	exx			;bf3a
	ld (hl),a			;bf3b
	inc hl			;bf3c
	inc hl			;bf3d
	ld (hl),c			;bf3e   ; el segundo en el mismo sitio...
	inc hl			;bf3f
	ld (hl),b			;bf40
	inc hl			;bf41
	exx			;bf42
	ld a,c			;bf43
	add a,004h		;bf44   ; ...con el patron siguiente
	ld c,a			;bf46
	exx			;bf47
	ld (hl),a			;bf48
	inc hl			;bf49
	inc hl			;bf4a
	pop bc			;bf4b
	djnz pareja_e1d0		;bf4c
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


colores_e1d0:		; con la X de 0xE1D2 en 0xC0-0xCF, los sprites fuera; si no, 6 parejas de colores 0x0C / 0x43 y una de 3 / 0x4E (p11:BF78) y lo que sale por la derecha a 0 (p11:BFA0)
	ld a,(0e1d2h)		;bf5d   ; lee la X de la ficha 0xE1D0
	cp 0c0h		;bf60
	jr c,colores_e1d0_b		;bf62
	cp 0d0h		;bf64
	jr nc,colores_e1d0_b		;bf66
	ld hl,0dc10h		;bf68
	ld bc,00037h		;bf6b
	ld a,0e0h		;bf6e
	jp 04237h		;bf70   ; llena_bloque: pone A en BC + 1 bytes desde HL
colores_e1d0_b:
	call colores_43_4e		;bf73   ; colores_43_4e:
	jr e1d0_por_la_derecha		;bf76
colores_43_4e:
	ld de,0da41h		;bf78
	ld hl,0da40h		;bf7b
	ld bc,0060ch		;bf7e
	ld a,043h		;bf81
	call pareja_de_colores		;bf83   ; pareja_de_colores:
	ld bc,00103h		;bf86
	ld a,04eh		;bf89
pareja_de_colores:
	push bc			;bf8b
	ld (hl),c			;bf8c   ; 16 lineas de C...
	ld bc,0000fh		;bf8d
	ldir		;bf90
	inc hl			;bf92
	inc de			;bf93
	ld (hl),a			;bf94   ; ...16 de A
	ld bc,0000fh		;bf95
	ldir		;bf98
	inc hl			;bf9a
	inc de			;bf9b
	pop bc			;bf9c
	djnz pareja_de_colores		;bf9d   ; B parejas
	ret			;bf9f
e1d0_por_la_derecha:		; con la X desde 0x90: segun la franja (0x90, 0xA0, 0xB0), las lineas de los colores de los sprites que ya salen a 0
	ld a,(0e1d2h)		;bfa0   ; lee la X de la ficha 0xE1D0
	cp 090h		;bfa3
	ret c			;bfa5
	cp 0a0h		;bfa6
	jr c,e1d0_franja_90		;bfa8
	cp 0b0h		;bfaa
	jr c,e1d0_franja_a0		;bfac
	cp 0c0h		;bfae
	ret nc			;bfb0
	ld hl,0da80h		;bfb1
	ld bc,0009fh		;bfb4
	call 04236h		;bfb7   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	ld hl,0da40h		;bfba
	ld c,004h		;bfbd
	jr lineas_que_salen		;bfbf
e1d0_franja_a0:
	ld hl,0db00h		;bfc1
	ld bc,0001fh		;bfc4
	call 04236h		;bfc7   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	ld hl,0da80h		;bfca
	ld c,008h		;bfcd
	jr lineas_que_salen		;bfcf
e1d0_franja_90:
	ld hl,0db00h		;bfd1
	ld c,002h		;bfd4
lineas_que_salen:
	ld a,(0e1d2h)		;bfd6   ; lee la X de la ficha 0xE1D0
	and 00fh		;bfd9
	or a			;bfdb
	ret z			;bfdc
	ld b,a			;bfdd
	ld a,010h		;bfde
	sub b			;bfe0
	call 0423eh		;bfe1   ; suma_a_hl: HL = HL + A
columna_que_sale:
	push hl			;bfe4
	push bc			;bfe5
linea_a_0:
	ld (hl),000h		;bfe6   ; a 0
	inc hl			;bfe8
	djnz linea_a_0		;bfe9   ; B lineas
	pop bc			;bfeb
	pop hl			;bfec
	ld de,00010h		;bfed   ; la fila siguiente
	add hl,de			;bff0
	dec c			;bff1
	jr nz,columna_que_sale		;bff2   ; C veces
	ret			;bff4

; ----------------------------------------------------------------------
; DATOS sin identificar  0xbff5..0xc000  (11 bytes)
DATA_BFF5:
	defb 002h,001h,002h,003h,001h,003h,004h,002h,004h,005h,073h	; bff5  ..........s
