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


actor_tipo_0b:		; el actor de tipo 0x0B: 0xD422 uno mas y su paso (p08:A00A, 14 pasos)
	ld hl,0d422h		;a000
	inc (hl)			;a003   ; 0xD422 uno mas
	ld a,(ix+001h)		;a004   ; lee el paso del actor
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


tipo_0b_paso_0:		; 0xD422 = 0, la direccion 1 y el paso siguiente
	xor a			;a026
	ld (0d422h),a		;a027
	inc a			;a02a   ; la direccion 1
	call 08e37h		;a02b   ; a_p06_b592: p06:B592 con el banco 6 en 0xA000
paso_siguiente_p08:		; el paso siguiente
	inc (ix+001h)		;a02e   ; sube el paso del actor
	ret			;a031
tipo_0b_paso_1:		; el byte 0x0C = 1, sus sprites y el paso siguiente
	ld (ix+00ch),001h		;a032
	call 081c5h		;a036   ; sus sprites
	jp paso_siguiente_p08		;a039   ; paso_siguiente_p08: el paso siguiente
tipo_0b_paso_2:		; desde Y = 0x70, el paso de p08:A044; por encima, anda (p04:9022)
	ld a,(ix+003h)		;a03c   ; lee la Y del actor
	cp 070h		;a03f
	jp c,anda_p08		;a041   ; anda_p08: anda (p04:9022 con B = 6)
tipo_0b_paso_0a:		; el dibujo 4, 0x30 cuadros, parado y el paso siguiente
	ld (ix+00dh),004h		;a044   ; el dibujo del actor (bit 0: el paso) = 0x04
	ld (ix+00eh),030h		;a048   ; la espera del actor = 0x30
	xor a			;a04c
	ld (ix+00ch),a		;a04d
	ld (ix+00fh),a		;a050
	jr paso_siguiente_p08		;a053
tipo_0b_paso_4:		; anda (p04:9022) hasta la Y 0x2C (0x30 con alerta) subiendo; alli, en la sala 9, 0xD509 = 1; y el paso siguiente
	ld a,(0ca5fh)		;a055   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	and a			;a058
	ld b,02ch		;a059   ; sin alerta, 0x2C...
	jr z,mira_la_y_0b		;a05b
	ld b,030h		;a05d   ; ...con ella, 0x30
mira_la_y_0b:		; bajando (velocidad positiva)...
	ld a,(ix+007h)		;a05f   ; lee la velocidad del actor en Y (alta)
	rla			;a062
	jr nc,anda_p08		;a063
	ld a,(ix+003h)		;a065   ; ...o por debajo de B, anda
	cp b			;a068
	jr nc,anda_p08		;a069
	ld a,(0ca4bh)		;a06b   ; lee la sala de la zona
	cp 009h		;a06e   ; solo en la sala 9...
	jr nz,paso_siguiente_p08		;a070
	ld a,001h		;a072   ; ...0xD509 = 1
	ld (0d509h),a		;a074
	jr paso_siguiente_p08		;a077
anda_p08:		; anda (p04:9022 con B = 6)
	ld b,006h		;a079
	jp 09022h		;a07b   ; p04:9022
tipo_0b_paso_7:		; el paso 4 con la direccion 0
	ld (ix+001h),004h		;a07e   ; el paso del actor = 0x04
	xor a			;a082
	jp 08e37h		;a083   ; a_p06_b592: p06:B592 con el banco 6 en 0xA000
tipo_0b_paso_3:		; la espera: cada 8 cuadros, el dibujo siguiente de p08:A0AC (4, 5, 4, 6); al acabar, la direccion 0 y el paso siguiente
	dec (ix+00eh)		;a086   ; baja la espera del actor
	jr z,tipo_0b_fin_espera		;a089
	ld a,(ix+00eh)		;a08b   ; lee la espera del actor
	and 007h		;a08e   ; cada 8 cuadros
	ret nz			;a090
	ld a,(ix+00fh)		;a091   ; el siguiente de 4...
	inc a			;a094
	and 003h		;a095
	ld (ix+00fh),a		;a097
	ld hl,0a0ach		;a09a   ; ...su dibujo
	call 0423eh		;a09d   ; suma_a_hl: HL = HL + A
	ld a,(hl)			;a0a0
	ld (ix+00dh),a		;a0a1   ; guarda el dibujo del actor (bit 0: el paso)
	ret			;a0a4
tipo_0b_fin_espera:
	xor a			;a0a5
	call 08e37h		;a0a6   ; a_p06_b592: p06:B592 con el banco 6 en 0xA000
tipo_0b_paso_5:		; el paso siguiente
	jp paso_siguiente_p08		;a0a9   ; paso_siguiente_p08: el paso siguiente

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


tipo_0b_paso_6:		; la lista de sprites, p14:BA17 y el paso 0x0D
	call 08273h		;a0b0   ; lista_de_sprites: DE = IX + 0x2E: la lista de sprites del actor
	call 080f3h		;a0b3   ; a_p14_ba17_guarda: p14:BA17 guardando el banco de 0xA000
	ld (ix+001h),00dh		;a0b6   ; el paso del actor = 0x0D
	ret			;a0ba
tipo_0b_paso_0d:		; 0xD416 = 0, 0xD417 = 0x20 y fuera (p04:834C)
	xor a			;a0bb
	ld (0d416h),a		;a0bc   ; guarda cuantos actores han llegado con la alerta
	ld a,020h		;a0bf
	ld (0d417h),a		;a0c1
	jp 0834ch		;a0c4   ; quita_actor: sus sprites libres y fuera; el 0x13 apunta en 0xD4F8, el 0x0B con alerta 0xCA67 = 0
tipo_0b_paso_0c:		; la direccion del byte 0x1E y lo guardado: la Y y la X (bytes 0x24-0x25), el paso (0x21) y el byte 0x0C (0x23)
	ld a,(ix+01eh)		;a0c7
	call 08e37h		;a0ca   ; a_p06_b592: p06:B592 con el banco 6 en 0xA000
	ld a,(ix+024h)		;a0cd   ; la Y guardada
	ld (ix+003h),a		;a0d0   ; guarda la Y del actor
	ld a,(ix+025h)		;a0d3   ; la X guardada
	ld (ix+005h),a		;a0d6   ; guarda la X del actor
	ld a,(ix+021h)		;a0d9   ; el paso guardado
	ld (ix+001h),a		;a0dc   ; guarda el paso del actor
	ld a,(ix+023h)		;a0df   ; el byte 0x0C guardado
	ld (ix+00ch),a		;a0e2
	ret			;a0e5
paleta_en_la_otra:		; fuera el bit 3 de 0xD7E1 y p08:A0FB en la otra pagina
	ld hl,0d7e1h		;a0e6
	res 3,(hl)		;a0e9
	ld hl,0ca42h		;a0eb   ; la pagina de dibujo...
	ld a,(hl)			;a0ee
	push af			;a0ef
	push hl			;a0f0
	xor 001h		;a0f1   ; ...cambiada mientras...
	ld (hl),a			;a0f3
	call paleta_de_cac9		;a0f4   ; paleta_de_cac9: en las zonas 3 y 4, segun la sala, con su bandera de 0xCAC9-0xCACD a cero, la paleta de la sala; si no, p08:A13B
	pop hl			;a0f7
	pop af			;a0f8
	ld (hl),a			;a0f9   ; ...y de vuelta
	ret			;a0fa
paleta_de_cac9:		; en las zonas 3 y 4, segun la sala, con su bandera de 0xCAC9-0xCACD a cero, la paleta de la sala; si no, p08:A13B
	ld a,(0ca4bh)		;a0fb   ; lee la sala de la zona
	ld b,a			;a0fe
	ld a,(0ca4ah)		;a0ff   ; lee la zona
	cp 003h		;a102
	jr z,paleta_zona_3		;a104   ; zona 3
	cp 004h		;a106
	ret nz			;a108   ; zona 4...
	ld a,b			;a109
	ld hl,0cacch		;a10a   ; ...sala 5: 0xCACC
	cp 005h		;a10d
	jr z,mira_bandera_cac9		;a10f
	inc hl			;a111   ; sala 0x0E: 0xCACD...
	cp 00eh		;a112
	jr z,mira_bandera_cac9		;a114
	cp 013h		;a116   ; ...y la 0x13
	ret nz			;a118
	jr mira_bandera_cac9		;a119
paleta_zona_3:		; la sala especial 0x0C: 0xCACB
	ld hl,0cacbh		;a11b
	ld a,(0ca76h)		;a11e   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 00ch		;a121
	jr z,mira_bandera_cac9		;a123
	and a			;a125
	ret nz			;a126   ; otras especiales, nada
	ld a,b			;a127
	ld hl,0cac9h		;a128   ; la sala 0 y la 5: 0xCAC9...
	and a			;a12b
	jr z,mira_bandera_cac9		;a12c
	cp 005h		;a12e
	jr z,mira_bandera_cac9		;a130
	cp 010h		;a132   ; ...la 0x10: 0xCACA
	ret nz			;a134
	inc hl			;a135
mira_bandera_cac9:
	ld a,(hl)			;a136
	and a			;a137
	jp z,07a5fh		;a138   ; a cero: la paleta de la sala
a_oscuras:		; en las zonas 3-4: con 0xCB21 = 3, la paleta de p56:BCCF; si no, la pagina a cero, el bit 3 de 0xD7E1 y el caracter 0x53 de la sala en un sitio (zona 3: (0x88, 0x28) en la especial 0x0C, (0x48, 0x88) en la sala 0, (0xA8, 0x88) en la 0x10; zona 4: (0x10, 0x48) en la sala 0x0E)
	ld a,(0ca4ah)		;a13b   ; lee la zona
	sub 003h		;a13e
	cp 002h		;a140   ; solo las zonas 3 y 4
	ret nc			;a142
	ld b,a			;a143
	ld a,(0cb21h)		;a144   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	cp 003h		;a147   ; con 0xCB21 = 3...
	jr nz,pagina_a_cero		;a149
	jp 071fah		;a14b   ; ...la paleta de p56:BCCF
pagina_a_cero:
	ld a,(0ca42h)		;a14e   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	push bc			;a151
	call 04452h		;a152   ; la pagina a cero
	pop bc			;a155
	ld hl,0d7e1h		;a156
	set 3,(hl)		;a159   ; el bit 3 de 0xD7E1
	ld a,b			;a15b
	and a			;a15c
	jr nz,zona_4_a_oscuras		;a15d   ; zona 4, aparte
	ld a,(0ca76h)		;a15f   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 00ch		;a162
	ld de,08828h		;a164   ; la especial 0x0C: (0x88, 0x28)
	jr z,caracter_53		;a167
	ld a,(0ca4bh)		;a169   ; lee la sala de la zona
	and a			;a16c
	ld de,04888h		;a16d   ; la sala 0: (0x48, 0x88)
	jr z,caracter_53		;a170
	cp 010h		;a172
	ld d,0a8h		;a174   ; la 0x10: (0xA8, 0x88); las demas, nada
	ret nz			;a176
caracter_53:		; el caracter 0x53 de la sala en (D, E)
	ld a,053h		;a177
	jp 04a2ch		;a179   ; pieza_de_sala_a_esta: el caracter A de la sala de la pagina 2 a la pagina en la que se dibuja
zona_4_a_oscuras:
	ld a,(0ca4bh)		;a17c   ; lee la sala de la zona
	cp 00eh		;a17f
	ld de,01048h		;a181   ; la sala 0x0E: (0x10, 0x48)
	jr z,caracter_53		;a184
	ret			;a186
parpadeo_de_pantalla:		; fuera el bit 3 de 0xD7E1, el mapa guardado, p00:5DEB con la pantalla apagada y la pantalla apagada y encendida dos veces mas (con esperas); en la zona 4 columna 9 sin alerta, si algun actor ve a Snake, la alerta
	ld hl,0d7e1h		;a187
	res 3,(hl)		;a18a
	call 07c0eh		;a18c   ; guarda el mapa
	call 045cch		;a18f   ; apaga_pantalla: R#1 con el bit 6 (BL) a cero, desde la copia 0xF3E0
	call 05debh		;a192   ; p00:5DEB
	call 045c5h		;a195   ; enciende_pantalla: R#1 con el bit 6 (BL) a uno, desde la copia 0xF3E0
	call 07c1ah		;a198   ; el mapa de vuelta
	call espera_1000		;a19b   ; espera...
	call 045cch		;a19e   ; ...apagada...
	call espera_1000		;a1a1   ; espera_1000: espera 0x1000 vueltas
	call 045c5h		;a1a4   ; ...encendida...
	call espera_1000		;a1a7   ; espera_1000: espera 0x1000 vueltas
	call 045cch		;a1aa   ; ...apagada...
	call espera_1000		;a1ad   ; espera_1000: espera 0x1000 vueltas
	call 045c5h		;a1b0   ; ...encendida
	ld a,(0ca4ah)		;a1b3   ; lee la zona
	cp 004h		;a1b6
	ret nz			;a1b8   ; solo en la zona 4...
	ld a,(0ca51h)		;a1b9   ; lee la columna de la sala en la zona (uno mas al salir por la derecha)
	cp 009h		;a1bc
	ret nz			;a1be   ; ...columna 9...
	ld a,(0ca5fh)		;a1bf   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	and a			;a1c2
	ret nz			;a1c3   ; ...sin alerta
	call 0929ah		;a1c4   ; alguien la ve?
	ret nc			;a1c7
	jp 09949h		;a1c8   ; la alerta
espera_1000:		; espera 0x1000 vueltas
	ld bc,01000h		;a1cb
vuelta_de_espera:
	push bc			;a1ce   ; solo para gastar tiempo
	pop bc			;a1cf
	dec bc			;a1d0   ; una vuelta menos
	ld a,b			;a1d1
	or c			;a1d2
	jr nz,vuelta_de_espera		;a1d3   ; hasta 0
	ret			;a1d5
actor_tipo_0c:		; el actor de tipo 0x0C: en el paso 8, p06:B626; en el 9, p04:8ED9; con el bit 7 del tipo, nada; con la alerta 2, por su paso (p04:8F16)
	ld a,(ix+001h)		;a1d6   ; lee el paso del actor
	sub 008h		;a1d9
	jp z,08ecdh		;a1db   ; el paso 8
	jp z,08ed9h		;a1de   ; el paso 9
	ld a,(ix+000h)		;a1e1   ; lee el tipo del actor (0 = libre)
	rla			;a1e4
	ret c			;a1e5   ; con el bit 7, nada
	ld a,(0ca5fh)		;a1e6   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	cp 002h		;a1e9
	ret nz			;a1eb   ; sin la alerta 2, nada
	ld c,(ix+001h)		;a1ec   ; lee el paso del actor
	jp 08f16h		;a1ef   ; actor_por_paso: si no se ve, nada; el paso 8 p06:B626, el 9 p04:8ED9, los demas por p04:8F2A
actor_tipo_3:		; el actor de tipo 3: en el paso 8, p06:B626; en el 9, p04:8ED9; si no, su paso (p08:A202)
	ld a,(ix+001h)		;a1f2   ; lee el paso del actor
	cp 008h		;a1f5
	jp z,08ecdh		;a1f7   ; a_p06_b626_guarda: p06:B626 guardando el banco de 0xA000
	cp 009h		;a1fa
	jp z,08ed9h		;a1fc   ; actor_paso_9: el paso 9: los tipos 0x0B y 0x0C, o al acabar la espera, vuelven a lo de antes (bytes 0x20, 0x22, 0x15)
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


tipo_3_paso_0:		; la direccion 3, el byte 0x0F = 0, 0xD431 = 0, el byte 0x2C = 1, la sala de la ficha (p00:591D) y el paso siguiente
	ld a,003h		;a20e
	call 08e37h		;a210   ; la direccion 3
	xor a			;a213
	ld (ix+00fh),a		;a214
	ld (0d431h),a		;a217
	inc a			;a21a   ; el byte 0x2C = 1
	ld (ix+02ch),a		;a21b
	call 0591dh		;a21e   ; bloques_de_77ef: la sala de la ficha IX de p24:77EF con los bloques de p25:9EE4, a 0xE500
paso_siguiente_3:
	inc (ix+001h)		;a221   ; sube el paso del actor
	ret			;a224
tipo_3_paso_1:		; en esta sala (o con 0xD431): anda (p04:900B), el sonido de p08:A2C7 y, si delante (2 puntos de p08:A305 segun el dibujo) hay algo solido o pasa del limite del byte 0x2B (p08:A2D5), otra direccion (p08:A281); si no, p14:B88F, 0xD432 = la direccion + 1, 0xD431 = 0x2D (1 con el byte 0x19 = 5) y la sala de la ficha; fuera de la sala sin 0xD431, 0xD300 = 0
	call 08100h		;a225   ; en_esta_sala: Z si el actor esta en la sala de ahora (fila y columna)
	jr z,tipo_3_anda		;a228
	ld a,(0d431h)		;a22a
	and a			;a22d
	jr z,d300_a_cero		;a22e   ; fuera y sin 0xD431: 0xD300 = 0
tipo_3_anda:		; anda
	call 0900bh		;a230   ; p04:900B
	call sonido_de_tipo_3		;a233   ; el sonido
	ld c,(ix+003h)		;a236   ; C = la Y, B = la X
	ld b,(ix+005h)		;a239   ; lee la X del actor
	ld a,(ix+00dh)		;a23c   ; los dos puntos de delante (p08:A305, 4 bytes por direccion)
	add a,a			;a23f
	and 00ch		;a240
	ld hl,0a305h		;a242
	call 0423eh		;a245   ; suma_a_hl: HL = HL + A
	call solido_delante		;a248   ; el primero...
	jr c,tipo_3_otra_direccion		;a24b   ; ...solido: otra direccion
	call solido_delante		;a24d   ; el segundo
	jr c,tipo_3_otra_direccion		;a250
	ld a,(ix+02bh)		;a252   ; con el limite del byte 0x2B...
	and a			;a255
	jr z,tipo_3_sigue		;a256
	call limite_del_2b		;a258   ; ...pasado, otra direccion
	jr nc,tipo_3_otra_direccion		;a25b
tipo_3_sigue:		; p14:B88F
	call 080e6h		;a25d   ; a_p14_b88f_guarda: p14:B88F guardando el banco de 0xA000
	ret c			;a260
	ld a,(ix+00dh)		;a261   ; 0xD432 = la direccion + 1
	rrca			;a264
	and 003h		;a265
	inc a			;a267
	ld (0d432h),a		;a268
	ld a,(ix+019h)		;a26b   ; 0xD431 = 0x2D...
	cp 005h		;a26e
	ld a,02dh		;a270
	jr nz,pon_d431		;a272
	ld a,001h		;a274   ; ...o 1 con el byte 0x19 = 5
pon_d431:
	ld (0d431h),a		;a276
	jp 0591dh		;a279   ; la sala de la ficha
d300_a_cero:
	xor a			;a27c
	ld (0d300h),a		;a27d   ; guarda las 4 fichas de actor de los que llegan con la alerta (los actores 20-23)
	ret			;a280
tipo_3_otra_direccion:		; con el byte 0x19 desde 5 o con el byte 0x2C, la siguiente de la lista (p08:A355); si no, parado y el paso 2 (p08:A33E)
	ld a,(ix+019h)		;a281
	cp 005h		;a284
	jp nc,tipo_3_siguiente		;a286   ; tipo_3_siguiente: al centro del bloque, el paso 1 y la entrada siguiente (byte 0x0F, hasta 0x33 y vuelta a 0x32) de p08:A39D: los bits 5-7 al byte 0x2B, el bit 4 al 0x2C, el 3 al 0x19 (4 o 0; salvo con 5) y los bits 0-1 la direccion
	ld a,(ix+02ch)		;a289
	and a			;a28c
	jp nz,tipo_3_siguiente		;a28d   ; tipo_3_siguiente: al centro del bloque, el paso 1 y la entrada siguiente (byte 0x0F, hasta 0x33 y vuelta a 0x32) de p08:A39D: los bits 5-7 al byte 0x2B, el bit 4 al 0x2C, el 3 al 0x19 (4 o 0; salvo con 5) y los bits 0-1 la direccion
	ld (ix+00ch),000h		;a290
	jp espera_10_y_paso		;a294   ; espera_10_y_paso:
al_centro_del_bloque:		; la Y a 8 * n + 0x0A y la X a 8 * n + 8
	ld a,(ix+003h)		;a297   ; lee la Y del actor
	and 0f8h		;a29a
	or 00ah		;a29c
	ld (ix+003h),a		;a29e   ; guarda la Y del actor
	ld a,(ix+005h)		;a2a1   ; lee la X del actor
	and 0f8h		;a2a4
	or 008h		;a2a6
	ld (ix+005h),a		;a2a8   ; guarda la X del actor
	ret			;a2ab
solido_delante:		; acarreo si es solido el punto (B + dX, C + dY) de los dos bytes de HL (con 0xD8A3 = 1 mientras)
	ld a,001h		;a2ac
	ld (0d8a3h),a		;a2ae
	ld a,c			;a2b1   ; C + dY...
	add a,(hl)			;a2b2
	ld e,a			;a2b3
	inc hl			;a2b4
	ld a,b			;a2b5   ; ...B + dX
	add a,(hl)			;a2b6
	ld d,a			;a2b7
	inc hl			;a2b8
	push hl			;a2b9
	push bc			;a2ba
	ex de,hl			;a2bb
	call 07f3dh		;a2bc   ; solido?
	pop bc			;a2bf
	pop hl			;a2c0
	ld a,000h		;a2c1
	ld (0d8a3h),a		;a2c3
	ret			;a2c6
sonido_de_tipo_3:		; con el byte 0x19 = 4, cada 2 cuadros, el sonido 0x51
	ld a,(ix+019h)		;a2c7
	cp 004h		;a2ca
	ret nz			;a2cc
	ld a,(0ca03h)		;a2cd   ; lee el contador de cuadros (uno mas en cada interrupcion)
	rra			;a2d0
	ret nc			;a2d1
	jp 06c63h		;a2d2   ; sonido_51: pide el sonido 0x51
limite_del_2b:		; segun el byte 0x2B (1-6, p08:A2DF), acarreo si sigue dentro: X < 0xA4, Y >= 0x5C, X < 0x84, X < 0x44, Y < 0x8C o Y >= 0x44
	ld d,(ix+005h)		;a2d5   ; lee la X del actor
	ld e,(ix+003h)		;a2d8   ; lee la Y del actor
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


limite_1:
	ld a,d			;a2eb
	cp 0a4h		;a2ec
	ret			;a2ee
limite_2:
	ld a,e			;a2ef
	cp 05ch		;a2f0
	ccf			;a2f2
	ret			;a2f3
limite_3:
	ld a,d			;a2f4
	cp 084h		;a2f5
	ret			;a2f7
limite_4:
	ld a,d			;a2f8
	cp 044h		;a2f9
	ret			;a2fb
limite_5:
	ld a,e			;a2fc
	cp 08ch		;a2fd
	ret			;a2ff
limite_6:
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


tipo_3_paso_2:		; al acabar la espera: desde el byte 0x19 = 5, la siguiente de la lista; si no, da la vuelta al dibujo (p08:A345), al centro del bloque, en esta sala el sonido 0x50, 0x10 cuadros y el paso siguiente
	dec (ix+00eh)		;a315   ; baja la espera del actor
	ret nz			;a318
	ld a,(ix+019h)		;a319
	cp 005h		;a31c
	jp nc,tipo_3_siguiente		;a31e   ; tipo_3_siguiente: al centro del bloque, el paso 1 y la entrada siguiente (byte 0x0F, hasta 0x33 y vuelta a 0x32) de p08:A39D: los bits 5-7 al byte 0x2B, el bit 4 al 0x2C, el 3 al 0x19 (4 o 0; salvo con 5) y los bits 0-1 la direccion
	call dibujo_al_reves		;a321   ; dibujo_al_reves: el bit 1 del dibujo cambiado
	ld a,(ix+003h)		;a324   ; la Y a 4 * n + 0x0C
	or 00ch		;a327
	and 0fch		;a329
	ld (ix+003h),a		;a32b   ; guarda la Y del actor
	ld a,(ix+005h)		;a32e   ; la X a 8 * n + 8
	or 008h		;a331
	and 0f8h		;a333
	ld (ix+005h),a		;a335   ; guarda la X del actor
	call 08100h		;a338   ; en_esta_sala: Z si el actor esta en la sala de ahora (fila y columna)
	call z,06c5fh		;a33b   ; sonido_50: pide el sonido 0x50
espera_10_y_paso:
	ld (ix+00eh),010h		;a33e   ; la espera del actor = 0x10
	jp paso_siguiente_3		;a342   ; paso_siguiente_3:
dibujo_al_reves:		; el bit 1 del dibujo cambiado
	ld a,(ix+00dh)		;a345   ; lee el dibujo del actor (bit 0: el paso)
	rra			;a348
	rra			;a349
	ccf			;a34a
	rla			;a34b
	rla			;a34c
	ld (ix+00dh),a		;a34d   ; guarda el dibujo del actor (bit 0: el paso)
	ret			;a350
tipo_3_paso_3:		; al acabar la espera, la siguiente de la lista
	dec (ix+00eh)		;a351   ; baja la espera del actor
	ret nz			;a354
tipo_3_siguiente:		; al centro del bloque, el paso 1 y la entrada siguiente (byte 0x0F, hasta 0x33 y vuelta a 0x32) de p08:A39D: los bits 5-7 al byte 0x2B, el bit 4 al 0x2C, el 3 al 0x19 (4 o 0; salvo con 5) y los bits 0-1 la direccion
	call al_centro_del_bloque		;a355   ; al_centro_del_bloque: la Y a 8 * n + 0x0A y la X a 8 * n + 8
	ld (ix+001h),001h		;a358   ; el paso del actor = 0x01
	ld b,(ix+00fh)		;a35c
	inc (ix+00fh)		;a35f   ; la siguiente
	ld a,(ix+00fh)		;a362
	cp 034h		;a365   ; hasta 0x33...
	jr c,entrada_a39d		;a367
	ld (ix+00fh),032h		;a369   ; ...y se queda en 0x32
entrada_a39d:
	ld a,b			;a36d
	ld hl,0a39dh		;a36e
	call 0423eh		;a371   ; suma_a_hl: HL = HL + A
	ld a,(hl)			;a374
	rlca			;a375
	rlca			;a376
	rlca			;a377
	ld b,a			;a378
	and 007h		;a379   ; los bits 5-7: el byte 0x2B
	ld (ix+02bh),a		;a37b
	ld a,b			;a37e
	rlca			;a37f
	ld b,a			;a380
	and 001h		;a381   ; el bit 4: el byte 0x2C
	ld (ix+02ch),a		;a383
	ld a,(ix+019h)		;a386
	cp 005h		;a389   ; con el 5 se queda
	jr z,direccion_de_a39d		;a38b
	ld a,b			;a38d   ; el bit 3: 4...
	rlca			;a38e
	ld a,004h		;a38f
	jr c,pon_byte_19		;a391
	xor a			;a393   ; ...o 0
pon_byte_19:
	ld (ix+019h),a		;a394
direccion_de_a39d:		; los bits 0-1: la direccion
	ld a,(hl)			;a397
	and 003h		;a398
	jp 08e37h		;a39a   ; a_p06_b592: p06:B592 con el banco 6 en 0xA000

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


tipo_3_paso_4:		; da la vuelta al dibujo, el byte 0x0C al 0x23 y a cero, 0x20 cuadros y el paso siguiente
	call dibujo_al_reves		;a3d1   ; dibujo_al_reves: el bit 1 del dibujo cambiado
	ld a,(ix+00ch)		;a3d4
	ld (ix+023h),a		;a3d7
	ld (ix+00ch),000h		;a3da
	ld (ix+00eh),020h		;a3de   ; la espera del actor = 0x20
	jp paso_siguiente_3		;a3e2   ; paso_siguiente_3:
tipo_3_paso_5:		; al acabar la espera: el byte 0x0C y el paso guardados (bytes 0x23 y 0x21), da la vuelta al dibujo y la direccion del dibujo
	dec (ix+00eh)		;a3e5   ; baja la espera del actor
	ret nz			;a3e8
	ld a,(ix+023h)		;a3e9
	ld (ix+00ch),a		;a3ec
	ld a,(ix+021h)		;a3ef
	ld (ix+001h),a		;a3f2   ; guarda el paso del actor
	call dibujo_al_reves		;a3f5   ; dibujo_al_reves: el bit 1 del dibujo cambiado
	ld a,(ix+00dh)		;a3f8   ; lee el dibujo del actor (bit 0: el paso)
	rrca			;a3fb
	and 003h		;a3fc
	jp 08e37h		;a3fe   ; a_p06_b592: p06:B592 con el banco 6 en 0xA000
actor_tipo_16:		; los actores de tipo 0x16 y 0x17 (los dos de 0xCE00 y 0xCE40): su paso (p08:A407)
	ld a,(ix+001h)		;a401   ; lee el paso del actor
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


tipo_16_paso_0:		; 0xD43F = 0, a cero los bytes 0x0C-0x0F, 0x18, 0x22, 0x25 y 0x27, la cuenta del 0x29 (p08:A7CF); el 0x17 con 0x20 y 0x10 en los 0x25 y 0x27; el centro (p08:A51C) y el paso siguiente
	xor a			;a413
	ld (0d43fh),a		;a414
	ld (ix+00eh),a		;a417   ; guarda la espera del actor
	ld (ix+00fh),a		;a41a
	ld (ix+00ch),a		;a41d
	ld (ix+00dh),a		;a420   ; guarda el dibujo del actor (bit 0: el paso)
	ld (ix+022h),a		;a423
	ld (ix+018h),a		;a426
	ld (ix+025h),a		;a429
	ld (ix+027h),a		;a42c
	call cuenta_29		;a42f   ; la cuenta
	ld a,(ix+000h)		;a432   ; lee el tipo del actor (0 = libre)
	cp 017h		;a435   ; el 0x17...
	jr nz,centro_y_paso		;a437
	ld (ix+025h),020h		;a439   ; ...0x20 en el byte 0x25...
	ld (ix+027h),010h		;a43d   ; ...0x10 en el 0x27
centro_y_paso:
	call centro_del_circulo		;a441   ; centro_del_circulo: el byte 0x22 = el cuarto de la zona segun su fila (4 o mas) y columna (7 o mas): 0-3; el centro (bytes 0x12-0x13) de p08:A552 mas los bytes 0x25 y 0x27
sube_paso_16:
	inc (ix+001h)		;a444   ; sube el paso del actor
	ret			;a447
snake_cerca_de_ix:		; acarreo si en esta sala Snake esta a menos de B en X y de B + 0x10 en Y
	call 08100h		;a448   ; en_esta_sala: Z si el actor esta en la sala de ahora (fila y columna)
	jr nz,no_cerca		;a44b
	ld a,(0cb05h)		;a44d   ; lee la X de Snake
	sub (ix+005h)		;a450   ; le resta la X del actor
	jr nc,L_A457		;a453
	neg		;a455
L_A457:
	cp b			;a457
	ret nc			;a458   ; lejos en X: no
	ld a,010h		;a459   ; B + 0x10
	add a,b			;a45b
	ld b,a			;a45c
	ld a,(0cb03h)		;a45d   ; lee la Y de Snake
	sub (ix+003h)		;a460   ; le resta la Y del actor
	jr nc,L_A467		;a463
	neg		;a465
L_A467:
	cp b			;a467
	ret			;a468
no_cerca:
	or a			;a469
	ret			;a46a
tipo_16_paso_1:		; el 0x16 con la espera en 0x20 y sin Snake cerca (0x30): al acabar la cuenta del 0x29 (sin 0xD43F), el paso siguiente de los dos, 0x20 en sus bytes 0x23; si no, da vueltas (p08:A499)
	ld a,(ix+000h)		;a46b   ; lee el tipo del actor (0 = libre)
	cp 017h		;a46e
	jr z,da_vueltas		;a470   ; el 0x17, a dar vueltas
	ld a,(ix+00eh)		;a472   ; lee la espera del actor
	cp 020h		;a475
	jr nz,da_vueltas		;a477   ; fuera de 0x20, a dar vueltas
	ld b,030h		;a479
	call snake_cerca_de_ix		;a47b   ; Snake cerca?
	jr c,da_vueltas		;a47e
	dec (ix+029h)		;a480   ; la cuenta
	jr nz,da_vueltas		;a483
	ld a,(0d43fh)		;a485
	and a			;a488
	ret nz			;a489   ; con 0xD43F, nada
	ld hl,0ce41h		;a48a   ; el paso del 0x17 uno mas
	inc (hl)			;a48d
	ld a,020h		;a48e
	ld (ix+023h),a		;a490   ; 0x20 en los dos bytes 0x23
	ld (0ce63h),a		;a493
	jp sube_paso_16		;a496   ; sube_paso_16:
da_vueltas:		; el dibujo (p08:A567; el 0x17 no); cada 4 cuadros (2 en otros pasos) anda (p04:902E) con el sonido (p08:A55A); cada 2, su sitio sobre el circulo de p08:BF7D (Y del byte 0x12 y X del 0x13, con la espera como angulo, 0-0x3F) que gira segun el byte 0x0F; p14:B88F y el centro (p08:A51C)
	ld a,(0ca03h)		;a499   ; lee el contador de cuadros (uno mas en cada interrupcion)
	ld b,a			;a49c
	ld a,(ix+000h)		;a49d   ; lee el tipo del actor (0 = libre)
	cp 017h		;a4a0
	jr z,sitio_en_el_circulo		;a4a2
	call dibujo_de_vueltas		;a4a4   ; su dibujo
	ld a,(ix+001h)		;a4a7   ; lee el paso del actor
	dec a			;a4aa
	ld c,004h		;a4ab   ; en el paso 1, cada 4 cuadros...
	jr z,cada_c_cuadros		;a4ad
	ld c,002h		;a4af   ; ...si no, cada 2
cada_c_cuadros:
	ld a,b			;a4b1
	and c			;a4b2
	jr nz,sitio_en_el_circulo		;a4b3
	call 0902eh		;a4b5   ; anda
	ld a,(0ca4bh)		;a4b8   ; lee la sala de la zona
	and a			;a4bb
	call nz,sonido_de_vueltas		;a4bc   ; fuera de la sala 0, el sonido
sitio_en_el_circulo:		; solo los cuadros pares
	rr b		;a4bf
	ret c			;a4c1
	ld a,(ix+00eh)		;a4c2   ; el seno de la espera...
	ld hl,0bf7dh		;a4c5
	call 0423eh		;a4c8   ; suma_a_hl: HL = HL + A
	ld a,(hl)			;a4cb
	srl a		;a4cc   ; .../ 2
	ld b,a			;a4ce
	ld a,(ix+00fh)		;a4cf   ; el cuarto (byte 0x0F & 3)...
	and 003h		;a4d2
	ld c,a			;a4d4
	cp 002h		;a4d5   ; ...0 y 1 hacia arriba
	ld a,b			;a4d7
	jr nc,y_del_circulo		;a4d8
	neg		;a4da
y_del_circulo:		; + el centro en Y
	add a,(ix+012h)		;a4dc
	ld (ix+003h),a		;a4df   ; guarda la Y del actor
	ld hl,0bf7dh		;a4e2   ; el coseno (0x3F - la espera)...
	ld a,03fh		;a4e5
	sub (ix+00eh)		;a4e7   ; le resta la espera del actor
	call 0423eh		;a4ea   ; suma_a_hl: HL = HL + A
	ld a,(hl)			;a4ed
	srl a		;a4ee
	ld b,a			;a4f0
	ld a,c			;a4f1
	dec a			;a4f2   ; ...1 y 2 hacia la izquierda
	cp 002h		;a4f3
	ld a,b			;a4f5
	jr c,x_del_circulo		;a4f6
	neg		;a4f8
x_del_circulo:		; + el centro en X
	add a,(ix+013h)		;a4fa
	ld (ix+005h),a		;a4fd   ; guarda la X del actor
	ld a,c			;a500   ; en los cuartos pares, la espera sube hasta 0x3F...
	rra			;a501
	jr c,baja_el_angulo		;a502
	inc (ix+00eh)		;a504   ; sube la espera del actor
	ld a,(ix+00eh)		;a507   ; lee la espera del actor
	cp 03fh		;a50a
	jr c,fin_vuelta		;a50c
	jr cuarto_siguiente		;a50e
baja_el_angulo:		; ...en los impares baja hasta 0
	dec (ix+00eh)		;a510   ; baja la espera del actor
	jr nz,fin_vuelta		;a513
cuarto_siguiente:		; el cuarto siguiente
	inc (ix+00fh)		;a515
fin_vuelta:
	call 080e6h		;a518   ; a_p14_b88f_guarda: p14:B88F guardando el banco de 0xA000
	ret c			;a51b
centro_del_circulo:		; el byte 0x22 = el cuarto de la zona segun su fila (4 o mas) y columna (7 o mas): 0-3; el centro (bytes 0x12-0x13) de p08:A552 mas los bytes 0x25 y 0x27
	ld a,(ix+00ah)		;a51c   ; lee la fila de la sala del actor
	cp 004h		;a51f   ; fila 4 o mas: 0...
	ld b,000h		;a521
	ld a,(ix+00bh)		;a523   ; lee la columna de la sala del actor
	jr nc,columna_7		;a526
	ld b,002h		;a528   ; ...si no, 2
	cp 007h		;a52a
	jr nc,pon_cuarto		;a52c
	jr cuarto_mas_1		;a52e
columna_7:
	cp 007h		;a530
	jr c,pon_cuarto		;a532
cuarto_mas_1:
	inc b			;a534
pon_cuarto:
	ld (ix+022h),b		;a535
	ld a,b			;a538   ; su centro de p08:A552
	and 003h		;a539
	add a,a			;a53b
	ld hl,0a552h		;a53c
	call 0423eh		;a53f   ; suma_a_hl: HL = HL + A
	ld a,(hl)			;a542
	add a,(ix+025h)		;a543   ; Y + el byte 0x25
	ld (ix+012h),a		;a546
	inc hl			;a549
	ld a,(hl)			;a54a
	add a,(ix+027h)		;a54b   ; X + el byte 0x27
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


sonido_de_vueltas:		; cada C - 1 cuadros: el sonido 0x3B en esta sala o el 0x5D en otra
	dec c			;a55a
	ld a,b			;a55b
	and c			;a55c
	ret nz			;a55d
	call 08100h		;a55e   ; en_esta_sala: Z si el actor esta en la sala de ahora (fila y columna)
	jp nz,06c7bh		;a561   ; sonido_5d: pide el sonido 0x5D
	jp 06b02h		;a564   ; sonido_3b: pide el sonido 0x3B
dibujo_de_vueltas:		; el dibujo: con la espera desde 0x20, 4 (fila 4) o 6; por debajo, 0 (columna 6) o 2
	ld a,(ix+00eh)		;a567   ; lee la espera del actor
	cp 020h		;a56a
	jr c,dibujo_0_2		;a56c
	ld c,004h		;a56e
	ld a,(ix+00ah)		;a570   ; lee la fila de la sala del actor
	cp 004h		;a573
	jr z,pon_dibujo_vueltas		;a575
	ld c,006h		;a577
	jr pon_dibujo_vueltas		;a579
dibujo_0_2:
	ld c,000h		;a57b
	ld a,(ix+00bh)		;a57d   ; lee la columna de la sala del actor
	cp 006h		;a580
	jr z,pon_dibujo_vueltas		;a582
	ld c,002h		;a584
pon_dibujo_vueltas:
	ld (ix+00dh),c		;a586   ; guarda el dibujo del actor (bit 0: el paso)
	ret			;a589
tipo_16_paso_2:		; la cuenta del byte 0x23: el 0x16 aparta el centro (byte 0x25 uno mas y el 0x27 cada 2) y da vueltas; el 0x17 con el dibujo de p08:A5FB; al acabar, el paso siguiente y p08:A5B0
	dec (ix+023h)		;a58a
	jr z,tipo_16_fin_2		;a58d
	ld a,(ix+000h)		;a58f   ; lee el tipo del actor (0 = libre)
	cp 017h		;a592
	jp z,dibujo_del_17		;a594   ; el 0x17, aparte
	inc (ix+025h)		;a597   ; el centro en Y uno mas...
	ld a,(ix+023h)		;a59a
	rra			;a59d
	jr nc,centro_y_vueltas		;a59e
	inc (ix+027h)		;a5a0   ; ...y en X cada 2
centro_y_vueltas:
	call centro_del_circulo		;a5a3   ; centro_del_circulo: el byte 0x22 = el cuarto de la zona segun su fila (4 o mas) y columna (7 o mas): 0-3; el centro (bytes 0x12-0x13) de p08:A552 mas los bytes 0x25 y 0x27
	jp da_vueltas		;a5a6   ; da_vueltas: el dibujo (p08:A567; el 0x17 no); cada 4 cuadros (2 en otros pasos) anda (p04:902E) con el sonido (p08:A55A); cada 2, su sitio sobre el circulo de p08:BF7D (Y del byte 0x12 y X del 0x13, con la espera como angulo, 0-0x3F) que gira segun el byte 0x0F; p14:B88F y el centro (p08:A51C)
tipo_16_fin_2:
	call sube_paso_16		;a5a9   ; sube_paso_16:
	ld (ix+023h),000h		;a5ac
tipo_16_suelto:		; en esta sala el sonido 0x57; el 0x17 se va (p08:A5E9); el 0x16: el byte 0x0C = 3, una direccion al azar de p08:A610 (velocidad 1 en un eje), su dibujo (8 + direccion * 2) y 0x10 cuadros en el byte 0x28
	call 08100h		;a5b0   ; en_esta_sala: Z si el actor esta en la sala de ahora (fila y columna)
	call z,06b4dh		;a5b3   ; sonido_57: pide el sonido 0x57
	ld a,(ix+000h)		;a5b6   ; lee el tipo del actor (0 = libre)
	cp 017h		;a5b9
	jr z,tipo_17_se_va		;a5bb
	ld (ix+00ch),003h		;a5bd
	call 04256h		;a5c1   ; una direccion al azar
	and 003h		;a5c4
	ld b,a			;a5c6
	ld hl,0a610h		;a5c7
	call 043f6h		;a5ca   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld (ix+007h),l		;a5cd   ; la velocidad en Y...
	ld (ix+009h),h		;a5d0   ; ...y en X
	xor a			;a5d3
	ld (ix+006h),a		;a5d4   ; guarda la velocidad del actor en Y (baja)
	ld (ix+008h),a		;a5d7   ; guarda la velocidad del actor en X (baja)
	ld a,b			;a5da
pon_direccion_16:		; la direccion al byte 0x1D
	ld (ix+01dh),a		;a5db
	add a,a			;a5de
	add a,008h		;a5df
	ld (ix+00dh),a		;a5e1   ; guarda el dibujo del actor (bit 0: el paso)
	ld (ix+028h),010h		;a5e4   ; 0x10 cuadros
	ret			;a5e8
tipo_17_se_va:		; el actor libre y su sprite (0xDC24 + byte 0x2E * 4) fuera
	ld (ix+000h),000h		;a5e9   ; el tipo del actor (0 = libre) = 0x00
	ld a,(ix+02eh)		;a5ed
	add a,a			;a5f0
	add a,a			;a5f1
	ld hl,0dc24h		;a5f2
	call 0423eh		;a5f5   ; suma_a_hl: HL = HL + A
	ld (hl),0e0h		;a5f8
	ret			;a5fa
dibujo_del_17:		; el dibujo segun la cuenta del byte 0x23: 0 desde 0x16, 1 desde 0x0C, 2 por debajo
	ld a,(ix+023h)		;a5fb
	ld b,000h		;a5fe   ; desde 0x16, el 0
	cp 016h		;a600
	jr nc,pon_dibujo_17		;a602
	cp 00ch		;a604   ; desde 0x0C, el 1
	inc b			;a606
	jr nc,pon_dibujo_17		;a607
	inc b			;a609   ; por debajo, el 2
pon_dibujo_17:
	ld (ix+00dh),b		;a60a   ; guarda el dibujo del actor (bit 0: el paso)
	jp da_vueltas		;a60d   ; da_vueltas: el dibujo (p08:A567; el 0x17 no); cada 4 cuadros (2 en otros pasos) anda (p04:902E) con el sonido (p08:A55A); cada 2, su sitio sobre el circulo de p08:BF7D (Y del byte 0x12 y X del 0x13, con la espera como angulo, 0-0x3F) que gira segun el byte 0x0F; p14:B88F y el centro (p08:A51C)

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


tipo_16_paso_3:		; el 0x16 andando: con 0xD43F, al acabar la cuenta, o con Snake cerca (salvo con 0xCB21 = 0x21 sin 0xCAB6), se junta con el 0x17 (p08:A6A0); si sale de su franja o choca, da la vuelta (p08:A690); cada 0x10 cuadros otra direccion (p08:A5B0)
	ld a,(ix+000h)		;a618   ; lee el tipo del actor (0 = libre)
	cp 017h		;a61b
	jp z,sube_paso_16		;a61d   ; el 0x17, al paso siguiente
	ld a,(0d43fh)		;a620
	and a			;a623
	jr nz,se_juntan		;a624   ; con 0xD43F, se juntan
	dec (ix+023h)		;a626
	jr z,se_juntan		;a629   ; al acabar la cuenta, tambien
	ld a,(0cab6h)		;a62b   ; lee 1 con la cuenta de 0xCAB7 en marcha (sala especial 0x11, p10:A0F8)
	and a			;a62e
	jr nz,cerca_20		;a62f   ; con 0xCAB6, mira si esta cerca
	ld a,(0cb21h)		;a631   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	cp 021h		;a634
	jr z,franja_de_16		;a636   ; con 0xCB21 = 0x21 no mira
cerca_20:
	ld b,020h		;a638
	call snake_cerca_de_ix		;a63a   ; snake_cerca_de_ix: acarreo si en esta sala Snake esta a menos de B en X y de B + 0x10 en Y
	jr c,se_juntan		;a63d   ; Snake cerca: se juntan
franja_de_16:
	ld a,(ix+007h)		;a63f   ; lee la velocidad del actor en Y (alta)
	and a			;a642
	jr nz,franja_vertical		;a643   ; en horizontal: la X en 0x20-0xBF
	ld c,(ix+005h)		;a645   ; C = la X
	ld de,020a0h		;a648
	jr dentro_de_la_franja		;a64b
franja_vertical:		; en vertical: la Y en 0x38-0xE7 (columna 7), 0x60-0xAF (fila 3) o 0x38-0x97
	ld a,(ix+00bh)		;a64d   ; lee la columna de la sala del actor
	cp 007h		;a650
	ld de,038b0h		;a652
	ld c,(ix+003h)		;a655   ; lee la Y del actor
	jr nz,dentro_de_la_franja		;a658
	ld a,(ix+00ah)		;a65a   ; lee la fila de la sala del actor
	cp 003h		;a65d
	ld de,06050h		;a65f
	jr z,dentro_de_la_franja		;a662
	ld de,03860h		;a664
dentro_de_la_franja:
	ld a,c			;a667
	sub d			;a668
	cp e			;a669
	jr nc,da_la_vuelta_16		;a66a   ; fuera: da la vuelta
	call 08100h		;a66c   ; en_esta_sala: Z si el actor esta en la sala de ahora (fila y columna)
	jr nz,cuenta_28		;a66f   ; en otra sala, sin choques
	call 090c8h		;a671   ; los choques
	ld a,(ix+007h)		;a674   ; lee la velocidad del actor en Y (alta)
	and a			;a677
	ld a,003h		;a678   ; en vertical, arriba y abajo...
	jr nz,L_A67E		;a67a
	ld a,00ch		;a67c   ; ...si no, los lados
L_A67E:
	and c			;a67e
	jr nz,da_la_vuelta_16		;a67f   ; choca: da la vuelta
cuenta_28:		; la cuenta de 0x10: al acabar, otra direccion
	dec (ix+028h)		;a681
	jp z,tipo_16_suelto		;a684   ; tipo_16_suelto: en esta sala el sonido 0x57; el 0x17 se va (p08:A5E9); el 0x16: el byte 0x0C = 3, una direccion al azar de p08:A610 (velocidad 1 en un eje), su dibujo (8 + direccion * 2) y 0x10 cuadros en el byte 0x28
	ld a,(ix+028h)		;a687
	and 003h		;a68a   ; cada 4 cuadros, anda
	ret nz			;a68c
	jp 0902eh		;a68d   ; p04:902E
da_la_vuelta_16:		; las velocidades al reves, 8 cuadros y la direccion contraria
	call 0808bh		;a690   ; da_la_vuelta_al_actor: las dos velocidades del actor cambiadas de signo
	ld (ix+028h),008h		;a693
	ld a,(ix+01dh)		;a697
	rra			;a69a
	ccf			;a69b
	rla			;a69c
	jp pon_direccion_16		;a69d   ; pon_direccion_16: la direccion al byte 0x1D
se_juntan:		; el 0x17 (0xCE40) al paso 3 en el sitio del 0x16, los dos con la distancia de antes + (0x20, 0x10) en los bytes 0x25 y 0x27, el dibujo 2, la espera y el cuarto del 0x16, su sala; la primera vez, su sprite 3, 0xD402 = 1 y los colores de 0xDAC0 al 0x0F; y el paso siguiente
	ld iy,0ce40h		;a6a0
	ld (iy+000h),017h		;a6a4   ; tipo 0x17...
	ld (iy+001h),003h		;a6a8   ; ...paso 3
	ld a,(ix+003h)		;a6ac   ; la Y del 0x16 al 0x17...
	ld b,(iy+003h)		;a6af
	ld (iy+003h),a		;a6b2
	sub b			;a6b5   ; ...y lo que habia entre los dos + 0x20 a los bytes 0x25
	add a,020h		;a6b6
	ld (iy+025h),a		;a6b8
	ld (ix+025h),a		;a6bb
	ld a,(ix+005h)		;a6be   ; la X igual...
	ld c,(iy+005h)		;a6c1
	ld (iy+005h),a		;a6c4
	sub c			;a6c7   ; ...+ 0x10 a los bytes 0x27
	add a,010h		;a6c8
	ld (iy+027h),a		;a6ca
	ld (ix+027h),a		;a6cd
	ld a,002h		;a6d0   ; el dibujo 2
	ld (iy+00dh),a		;a6d2
	ld a,(ix+00eh)		;a6d5   ; la espera...
	ld (iy+00eh),a		;a6d8
	ld a,(ix+00fh)		;a6db   ; ...el cuarto...
	ld (iy+00fh),a		;a6de
	ld a,(ix+00ah)		;a6e1   ; ...y la sala
	ld (iy+00ah),a		;a6e4
	ld a,(ix+00bh)		;a6e7   ; lee la columna de la sala del actor
	ld (iy+00bh),a		;a6ea
	xor a			;a6ed   ; parado
	ld (ix+00ch),a		;a6ee
	ld a,(iy+02eh)		;a6f1   ; la primera vez...
	and a			;a6f4
	jr nz,paso_16_b		;a6f5
	ld (iy+02eh),003h		;a6f7   ; ...el sprite 3...
	ld a,001h		;a6fb   ; ...0xD402 = 1...
	ld (0d402h),a		;a6fd
	ld hl,0dac0h		;a700   ; ...y 16 colores al 0x0F
	ld bc,0000fh		;a703
	ld a,00fh		;a706
	call 04237h		;a708   ; llena_bloque: pone A en BC + 1 bytes desde HL
paso_16_b:
	jp sube_paso_16		;a70b   ; sube_paso_16:
tipo_16_paso_4:		; las velocidades para llevar los bytes 0x25 y 0x27 a 0 (el 0x16) o a 0x20 y 0x10 (el 0x17) en 0x20 cuadros (p08:A742), parado y el paso siguiente
	ld a,(ix+000h)		;a70e   ; lee el tipo del actor (0 = libre)
	cp 016h		;a711
	ld bc,00000h		;a713
	jr z,velocidades_al_sitio		;a716   ; el 0x16: a (0, 0)
	ld bc,02010h		;a718   ; el 0x17: a (0x20, 0x10)
velocidades_al_sitio:		; lo que falta en Y...
	ld a,(ix+025h)		;a71b
	sub b			;a71e
	push bc			;a71f
	call entre_32		;a720   ; entre_32: DE = A / 32 en 8.8 con su signo (la velocidad para recorrer A en 0x20 cuadros)
	pop bc			;a723
	ld (ix+007h),d		;a724   ; ...su velocidad
	ld (ix+006h),e		;a727   ; guarda la velocidad del actor en Y (baja)
	ld a,(ix+027h)		;a72a   ; lo que falta en X...
	sub c			;a72d
	call entre_32		;a72e   ; entre_32: DE = A / 32 en 8.8 con su signo (la velocidad para recorrer A en 0x20 cuadros)
	ld (ix+009h),d		;a731   ; ...su velocidad
	ld (ix+008h),e		;a734   ; guarda la velocidad del actor en X (baja)
	ld (ix+023h),020h		;a737   ; 0x20 cuadros
	ld (ix+00ch),000h		;a73b
	jp sube_paso_16		;a73f   ; sube_paso_16:
entre_32:		; DE = A / 32 en 8.8 con su signo (la velocidad para recorrer A en 0x20 cuadros)
	ld b,005h		;a742
	ld de,00000h		;a744
	and a			;a747
	ret z			;a748
	ld c,e			;a749
	bit 7,a		;a74a   ; negativo...
	jr z,divide_32		;a74c
	neg		;a74e
	ld c,001h		;a750
divide_32:
	ld d,a			;a752
L_A753:
	srl d		;a753   ; / 32
	rr e		;a755
	djnz L_A753		;a757
	ld a,c			;a759
	and a			;a75a
	call z,04442h		;a75b   ; el signo
	ret			;a75e
tipo_16_paso_5:		; la cuenta del byte 0x23: el 0x16 anda cada 2 cuadros, el 0x17 cambia de dibujo; los bytes 0x24-0x25 y 0x26-0x27 suben sus velocidades y da vueltas; al acabar, p08:A7B1
	dec (ix+023h)		;a75f
	jr z,tipo_16_fin_5		;a762
	ld a,(ix+000h)		;a764   ; lee el tipo del actor (0 = libre)
	cp 017h		;a767
	jr z,dibujo_17_b		;a769   ; el 0x17, aparte
	ld a,(0ca03h)		;a76b   ; lee el contador de cuadros (uno mas en cada interrupcion)
	rra			;a76e
	call c,0902eh		;a76f   ; cada 2 cuadros, anda
	jr acerca_el_centro		;a772
dibujo_17_b:		; el dibujo segun la cuenta: 2, 1 o 0
	ld a,(ix+023h)		;a774
	ld b,002h		;a777   ; desde 0x16, el 2
	cp 016h		;a779
	jr nc,pon_dibujo_17_b		;a77b
	cp 00ch		;a77d   ; desde 0x0C, el 1
	dec b			;a77f
	jr nc,pon_dibujo_17_b		;a780
	dec b			;a782   ; por debajo, el 0
pon_dibujo_17_b:
	ld (ix+00dh),b		;a783   ; guarda el dibujo del actor (bit 0: el paso)
acerca_el_centro:		; da vueltas
	call centro_y_vueltas		;a786   ; centro_y_vueltas:
	ld l,(ix+024h)		;a789   ; los bytes 0x24-0x25...
	ld h,(ix+025h)		;a78c
	ld e,(ix+006h)		;a78f   ; lee la velocidad del actor en Y (baja)
	ld d,(ix+007h)		;a792   ; lee la velocidad del actor en Y (alta)
	add hl,de			;a795   ; ...+ la velocidad en Y
	ld (ix+024h),l		;a796
	ld (ix+025h),h		;a799
	ex de,hl			;a79c
	ld l,(ix+026h)		;a79d   ; los bytes 0x26-0x27...
	ld h,(ix+027h)		;a7a0
	ld c,(ix+008h)		;a7a3   ; lee la velocidad del actor en X (baja)
	ld b,(ix+009h)		;a7a6   ; lee la velocidad del actor en X (alta)
	add hl,bc			;a7a9   ; ...+ la velocidad en X
	ld (ix+026h),l		;a7aa
	ld (ix+027h),h		;a7ad
	ret			;a7b0
tipo_16_fin_5:		; los bytes 0x24-0x27 exactos (0 y 0 el 0x16; 0x20 y 0x10 el 0x17), el paso 1 y la cuenta
	ld a,(ix+000h)		;a7b1   ; lee el tipo del actor (0 = libre)
	cp 016h		;a7b4
	ld bc,00000h		;a7b6
	jr z,pon_bytes_24_27		;a7b9
	ld bc,02010h		;a7bb
pon_bytes_24_27:
	xor a			;a7be
	ld (ix+025h),b		;a7bf
	ld (ix+024h),a		;a7c2
	ld (ix+027h),c		;a7c5
	ld (ix+026h),a		;a7c8
	ld (ix+001h),001h		;a7cb   ; el paso del actor = 0x01
cuenta_29:		; el byte 0x29 = 2-5 al azar
	call 04256h		;a7cf   ; azar: A = un numero al azar (0xCA03 rotado mas R)
	and 003h		;a7d2
	add a,002h		;a7d4
	ld (ix+029h),a		;a7d6
	ret			;a7d9
d43b_sala_39:		; en la sala especial 0x39, sala 1: 0xD43B = 1
	ld a,(0ca76h)		;a7da   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 039h		;a7dd
	ret nz			;a7df   ; fuera de la especial 0x39, nada
	ld hl,0d43bh		;a7e0
	ld a,(0ca4bh)		;a7e3   ; lee la sala de la zona
	dec a			;a7e6
	ret nz			;a7e7   ; fuera de la sala 1, nada
	ld (hl),001h		;a7e8
	ret			;a7ea
sonido_de_los_12:		; con algun actor de tipo 0x12 en esta sala, el sonido 0x24
	ld ix,0ce00h		;a7eb   ; apunta a los actores: 24 fichas de 0x40 bytes (p04:800D)
	ld b,018h		;a7ef   ; 24 actores
busca_12:
	ld a,(ix+000h)		;a7f1   ; lee el tipo del actor (0 = libre)
	cp 012h		;a7f4
	jr nz,siguiente_12		;a7f6   ; otro tipo, el siguiente
	call 08100h		;a7f8   ; en_esta_sala: Z si el actor esta en la sala de ahora (fila y columna)
	jp z,06a8bh		;a7fb   ; en esta sala: el sonido
siguiente_12:
	ld de,00040h		;a7fe
	add ix,de		;a801   ; el siguiente (0x40 bytes)
	djnz busca_12		;a803
	ret			;a805
los_12_al_paso_4:		; en la sala 0, sin 0xCAB6, fuera del estado 2, con 0xCB21 = 0x22 y 0xD43B = 1: 0xD43B = 2, 0xD44C-0xD44E a cero y todos los actores de tipo 0x12 al paso 4
	ld a,(0ca4bh)		;a806   ; lee la sala de la zona
	and a			;a809
	ret nz			;a80a   ; fuera de la sala 0, nada
	ld a,(0cab6h)		;a80b   ; lee 1 con la cuenta de 0xCAB7 en marcha (sala especial 0x11, p10:A0F8)
	and a			;a80e
	ret nz			;a80f   ; con 0xCAB6, nada
	ld a,(0cb31h)		;a810   ; lee 1 en el estado 2 de Snake
	and a			;a813
	ret nz			;a814   ; en el estado 2, nada
	ld a,(0cb21h)		;a815   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	cp 022h		;a818
	ret nz			;a81a   ; sin 0xCB21 = 0x22, nada
	ld hl,0d43bh		;a81b
	ld a,(hl)			;a81e
	dec a			;a81f
	ret nz			;a820   ; sin 0xD43B = 1, nada
	inc (hl)			;a821   ; 0xD43B = 2
	xor a			;a822
	ld (0d44ch),a		;a823
	ld (0d44dh),a		;a826
	ld (0d44eh),a		;a829
	ld hl,0ce00h		;a82c   ; apunta a los actores: 24 fichas de 0x40 bytes (p04:800D)
	ld b,018h		;a82f   ; 24 actores
actor_12_paso_4:
	ld a,(hl)			;a831
	cp 012h		;a832
	jr nz,siguiente_12_b		;a834   ; otro tipo, el siguiente
	inc hl			;a836
	ld (hl),004h		;a837   ; el paso 4
	dec hl			;a839
siguiente_12_b:
	ld a,040h		;a83a
	call 0423eh		;a83c   ; suma_a_hl: HL = HL + A
	djnz actor_12_paso_4		;a83f
	ret			;a841
sala_39_cada_cuadro:		; en la sala especial 0x39: el sonido de los 0x12; con 0xD43B, en la sala 0 y fuera del estado 2: el bit 6 de 0xD7D9 fuera si no queda ningun actor (p08:A8BB); con 0xD44C desde 0x0B, cada 0x10 cuadros (0xD44D) entra el actor 0xD44E (hasta el 0x0B): paso 8, una fila arriba, en (0x4C, 0x60) bajando a 3, el byte 0x0C = 3, los bytes 0x20-0x21 = 0x48 y 0x30, sus sprites y una espera de 0x10-0x1F
	ld a,(0ca76h)		;a842   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 039h		;a845
	ret nz			;a847
	call sonido_de_los_12		;a848   ; el sonido
	ld a,(0d43bh)		;a84b
	and a			;a84e
	ret z			;a84f   ; sin 0xD43B, nada
	ld a,(0ca4bh)		;a850   ; lee la sala de la zona
	and a			;a853
	ret nz			;a854   ; fuera de la sala 0, nada
	ld a,(0cb31h)		;a855   ; lee 1 en el estado 2 de Snake
	and a			;a858
	ret nz			;a859   ; en el estado 2, nada
	call ninguno_queda		;a85a   ; ninguno: fuera el bit 6 de 0xD7D9
	ld a,(0d44ch)		;a85d
	cp 00bh		;a860
	ret c			;a862   ; por debajo de 0x0B en 0xD44C, nada
	ld hl,0d44dh		;a863   ; cada 0x10 cuadros
	inc (hl)			;a866
	ld a,(hl)			;a867
	cp 010h		;a868
	ret c			;a86a
	ld (hl),000h		;a86b
	inc hl			;a86d
	ld a,(hl)			;a86e   ; hasta el actor 0x0B
	cp 00bh		;a86f
	ret nc			;a871
	inc (hl)			;a872   ; el siguiente
	ld l,a			;a873   ; * 0x40
	ld h,000h		;a874
	add hl,hl			;a876
	add hl,hl			;a877
	add hl,hl			;a878
	add hl,hl			;a879
	add hl,hl			;a87a
	add hl,hl			;a87b
	ex de,hl			;a87c
	ld ix,0ce00h		;a87d   ; apunta a los actores: 24 fichas de 0x40 bytes (p04:800D)
	add ix,de		;a881   ; su ficha
	ld (ix+001h),008h		;a883   ; el paso del actor = 0x08
	dec (ix+00ah)		;a887   ; una fila arriba
	ld (ix+003h),04ch		;a88a   ; la Y del actor = 0x4C
	ld (ix+005h),060h		;a88e   ; la X del actor = 0x60
	xor a			;a892
	ld (ix+006h),a		;a893   ; guarda la velocidad del actor en Y (baja)
	ld (ix+007h),003h		;a896   ; bajando a 3
	ld (ix+008h),a		;a89a   ; guarda la velocidad del actor en X (baja)
	ld (ix+009h),a		;a89d   ; guarda la velocidad del actor en X (alta)
	ld (ix+00ch),003h		;a8a0
	ld (ix+020h),048h		;a8a4   ; los bytes 0x20...
	ld (ix+021h),030h		;a8a8   ; ...y 0x21
	call 081c5h		;a8ac   ; sprites_del_actor: sus sprites libres (p04:820A) y sus colores de p08:B9FB (p08:BA2F para el 1 con 0xD437)
	ld bc,0100fh		;a8af   ; una espera de 0x10-0x1F
espera_al_azar:		; la espera = B + (azar & C)
	call 04256h		;a8b2   ; azar: A = un numero al azar (0xCA03 rotado mas R)
	and c			;a8b5
	add a,b			;a8b6
	ld (ix+00eh),a		;a8b7   ; guarda la espera del actor
	ret			;a8ba
ninguno_queda:		; con algun actor, NZ; sin ninguno, fuera el bit 6 de 0xD7D9
	ld hl,0ce00h		;a8bb   ; apunta a los actores: 24 fichas de 0x40 bytes (p04:800D)
	ld b,018h		;a8be   ; 24 actores
actor_queda:
	ld a,(hl)			;a8c0
	and a			;a8c1
	ret nz			;a8c2   ; alguno: nada
	ld a,040h		;a8c3
	call 0423eh		;a8c5   ; suma_a_hl: HL = HL + A
	djnz actor_queda		;a8c8
	ld hl,0d7d9h		;a8ca
	res 6,(hl)		;a8cd
	ret			;a8cf
actor_tipo_12:		; el actor de tipo 0x12: p08:A806 y su paso (p08:A8D9)
	call los_12_al_paso_4		;a8d0   ; los_12_al_paso_4: en la sala 0, sin 0xCAB6, fuera del estado 2, con 0xCB21 = 0x22 y 0xD43B = 1: 0xD43B = 2, 0xD44C-0xD44E a cero y todos los actores de tipo 0x12 al paso 4
	ld a,(ix+001h)		;a8d3   ; lee el paso del actor
	call 0424dh		;a8d6   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_A8D9: 9 destinos del despachador p00:424D (call en p08:A8D6, el
;   indice en A): A937, A991, A9F5, A90C, A8EB, A90D, A927, A90C, A9F5; lo
;   leen p08:A8D6 (18 bytes)
;   0xa8d9..0xa8eb  (18 bytes)
DATA_tabla_A8D9:
	defw 0a937h,0a991h,0a9f5h,0a90ch,0a8ebh,0a90dh,0a927h,0a90ch	; a8d9
	defw 0a9f5h	; a8e9  -> tipo_12_paso_2

; ======================================================================
; CODIGO 0xa8eb..0xaa52  (359 bytes)
; ======================================================================


tipo_12_paso_4:		; hacia el centro en X (0x60): velocidad 4 a la derecha (dibujo 6) o a la izquierda (dibujo 4), el byte 0x0C = 2 y el paso siguiente
	ld a,(ix+005h)		;a8eb   ; lee la X del actor
	cp 060h		;a8ee   ; a la izquierda de 0x60...
	ld de,00400h		;a8f0   ; ...hacia la derecha
	ld b,006h		;a8f3
	jr c,pon_velocidad_x		;a8f5
	call 04442h		;a8f7   ; si no, hacia la izquierda
	ld b,004h		;a8fa
pon_velocidad_x:
	ld (ix+009h),d		;a8fc   ; guarda la velocidad del actor en X (alta)
	ld (ix+008h),e		;a8ff   ; guarda la velocidad del actor en X (baja)
	ld (ix+00dh),b		;a902   ; guarda el dibujo del actor (bit 0: el paso)
	ld (ix+00ch),002h		;a905
paso_siguiente_12:
	inc (ix+001h)		;a909   ; sube el paso del actor
nada_12:
	ret			;a90c
tipo_12_paso_5:		; al llegar a X 0x5C-0x63: hacia abajo a 4, el dibujo 2, el byte 0x0C = 1 y el paso siguiente
	ld a,(ix+005h)		;a90d   ; lee la X del actor
	sub 05ch		;a910
	cp 008h		;a912
	ret nc			;a914   ; aun no
	ld (ix+007h),004h		;a915   ; la velocidad del actor en Y (alta) = 0x04
	ld (ix+006h),000h		;a919   ; la velocidad del actor en Y (baja) = 0x00
	ld (ix+00dh),002h		;a91d   ; el dibujo del actor (bit 0: el paso) = 0x02
	ld (ix+00ch),001h		;a921
	jr paso_siguiente_12		;a925
tipo_12_paso_6:		; al llegar a Y = 0xB8: parado, 0xD44C uno mas y el paso siguiente
	ld a,(ix+003h)		;a927   ; lee la Y del actor
	cp 0b8h		;a92a
	ret c			;a92c   ; aun no
	ld (ix+00ch),000h		;a92d
	ld hl,0d44ch		;a931   ; uno mas en 0xD44C
	inc (hl)			;a934
	jr paso_siguiente_12		;a935
tipo_12_paso_0:		; el paso siguiente, su sitio menos (0x10, 0x14) a los bytes 0x20-0x21 y una direccion al azar (p08:A94A)
	inc (ix+001h)		;a937   ; sube el paso del actor
	ld a,(ix+003h)		;a93a   ; lee la Y del actor
	sub 010h		;a93d   ; Y - 0x10...
	ld (ix+020h),a		;a93f
	ld a,(ix+005h)		;a942   ; lee la X del actor
	sub 014h		;a945   ; X - 0x14
	ld (ix+021h),a		;a947
direccion_al_azar_12:		; un dibujo al azar (0, 2, 4, 6) y su velocidad (0x0180, o 0x0300 al azar; con el signo de la direccion), el byte 0x0C = 3, el 0x19 = 1 (y el 0x18), y una espera de 4-11
	call 04256h		;a94a   ; azar: A = un numero al azar (0xCA03 rotado mas R)
	and 006h		;a94d   ; 0, 2, 4 o 6
	ld (ix+00dh),a		;a94f   ; guarda el dibujo del actor (bit 0: el paso)
	srl a		;a952   ; la direccion (0-3)
	ld c,a			;a954
	rra			;a955   ; las pares, en negativo
	ld hl,00180h		;a956
	call nc,0443ah		;a959   ; hl_negativo: HL = -HL (PR2 p00:5BBD)
	ld (ix+019h),001h		;a95c
	call 04256h		;a960   ; al azar...
	rra			;a963
	jr c,velocidad_12		;a964
	add hl,hl			;a966   ; ...el doble
velocidad_12:
	call velocidad_en_eje		;a967   ; velocidad_en_eje: HL a la velocidad en Y (direcciones 0-1) o en X (2-3), la otra a cero
	ld (ix+00ch),003h		;a96a
	ld bc,00407h		;a96e   ; una espera de 4-11
	call espera_al_azar		;a971   ; espera_al_azar: la espera = B + (azar & C)
byte_19_a_18:
	ld a,(ix+019h)		;a974
	ld (ix+018h),a		;a977
	ret			;a97a
velocidad_en_eje:		; HL a la velocidad en Y (direcciones 0-1) o en X (2-3), la otra a cero
	ld de,00000h		;a97b
	ld a,c			;a97e
	cp 002h		;a97f   ; en X...
	jr c,pon_velocidades		;a981
	ex de,hl			;a983   ; ...cambiadas
pon_velocidades:
	ld (ix+006h),l		;a984   ; guarda la velocidad del actor en Y (baja)
	ld (ix+007h),h		;a987   ; guarda la velocidad del actor en Y (alta)
	ld (ix+008h),e		;a98a   ; guarda la velocidad del actor en X (baja)
	ld (ix+009h),d		;a98d   ; guarda la velocidad del actor en X (alta)
	ret			;a990
tipo_12_paso_1:		; en esta sala con Snake en Y 0x20-0x8F, o con 0xCB21 = 0x22 (sin 0xCAB6), p08:A9FC; si no, anda (p08:A9EB) y, si se aleja de su sitio (0x20 en Y o 0x28 en X), da la vuelta; al acabar la espera, otra direccion
	call 08100h		;a991   ; en_esta_sala: Z si el actor esta en la sala de ahora (fila y columna)
	jr nz,anda_12		;a994   ; en otra sala, a andar
	ld a,(0cb03h)		;a996   ; Snake en Y 0x20-0x8F...
	sub 020h		;a999
	cp 070h		;a99b
	jp c,tipo_12_ve		;a99d   ; ...p08:A9FC
	ld a,(0cab6h)		;a9a0   ; lee 1 con la cuenta de 0xCAB7 en marcha (sala especial 0x11, p10:A0F8)
	and a			;a9a3
	jr nz,anda_12		;a9a4   ; con 0xCAB6, a andar
	ld a,(0cb21h)		;a9a6   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	cp 022h		;a9a9
	jp z,tipo_12_ve		;a9ab   ; con 0xCB21 = 0x22, p08:A9FC
anda_12:
	call anda_cada_19		;a9ae   ; anda_cada_19: cada tantos cuadros como el byte 0x19, anda (p04:902E)
	ld bc,02028h		;a9b1   ; los limites: 0x20 en Y, 0x28 en X
	ld a,(ix+007h)		;a9b4   ; en vertical...
	or (ix+006h)		;a9b7   ; OR con la velocidad del actor en Y (baja)
	jr z,aleja_en_x		;a9ba
	ld a,(ix+003h)		;a9bc   ; ...lo que se aleja en Y
	sub (ix+020h)		;a9bf
	cp b			;a9c2
	jr nc,vuelta_12		;a9c3
	jr espera_12		;a9c5
aleja_en_x:		; en horizontal, lo que se aleja en X
	ld a,(ix+005h)		;a9c7   ; lee la X del actor
	sub (ix+021h)		;a9ca
	cp c			;a9cd
	jr nc,vuelta_12		;a9ce
espera_12:
	dec (ix+00eh)		;a9d0   ; baja la espera del actor
	ret nz			;a9d3
	jp direccion_al_azar_12		;a9d4   ; al acabar, otra direccion
vuelta_12:		; las velocidades al reves...
	call 0808bh		;a9d7   ; da_la_vuelta_al_actor: las dos velocidades del actor cambiadas de signo
	ld a,(ix+00dh)		;a9da   ; ...el dibujo al reves...
	rra			;a9dd
	rra			;a9de
	ccf			;a9df
	rla			;a9e0
	rla			;a9e1
	ld (ix+00dh),a		;a9e2   ; guarda el dibujo del actor (bit 0: el paso)
	ld bc,00407h		;a9e5   ; ...y una espera de 4-11
	jp espera_al_azar		;a9e8   ; espera_al_azar: la espera = B + (azar & C)
anda_cada_19:		; cada tantos cuadros como el byte 0x19, anda (p04:902E)
	dec (ix+018h)		;a9eb
	ret nz			;a9ee
	call byte_19_a_18		;a9ef   ; byte_19_a_18:
anda_902e:
	jp 0902eh		;a9f2   ; p04:902E
tipo_12_paso_2:		; anda; al acabar la espera, hacia Snake (p08:AA07)
	dec (ix+00eh)		;a9f5   ; baja la espera del actor
	jr nz,anda_902e		;a9f8
	jr hacia_snake_12		;a9fa
tipo_12_ve:		; solo el actor de la ficha 0xCE00 (los demas siguen andando): el paso siguiente y hacia Snake
	push ix		;a9fc
	pop hl			;a9fe
	ld a,l			;a9ff
	and a			;aa00
	jp nz,anda_12		;aa01   ; anda_12:
	inc (ix+001h)		;aa04   ; sube el paso del actor
hacia_snake_12:		; el dibujo hacia Snake (p08:AA24), 4 cuadros, el byte 0x18 = 1 y velocidad 4 en esa direccion
	call dibujo_hacia_snake		;aa07   ; dibujo_hacia_snake: el dibujo (direccion * 2) del primer lado de Snake (p04:90A9) en el eje mas lejano (p04:908C); ninguno, 2
	ld (ix+00eh),004h		;aa0a   ; 4 cuadros
	ld (ix+018h),001h		;aa0e
	ld a,(ix+00dh)		;aa12   ; la direccion del dibujo...
	and 007h		;aa15
	srl a		;aa17
	ld c,a			;aa19
	ld hl,00400h		;aa1a   ; ...velocidad 0x0400
	rra			;aa1d
	call nc,0443ah		;aa1e   ; hl_negativo: HL = -HL (PR2 p00:5BBD)
	jp velocidad_en_eje		;aa21   ; velocidad_en_eje: HL a la velocidad en Y (direcciones 0-1) o en X (2-3), la otra a cero
dibujo_hacia_snake:		; el dibujo (direccion * 2) del primer lado de Snake (p04:90A9) en el eje mas lejano (p04:908C); ninguno, 2
	call 090a9h		;aa24   ; lados_de_snake: B = los lados en los que esta Snake: bit 0 arriba, 1 abajo, 2 izquierda, 3 derecha
	call 0908ch		;aa27   ; eje_hacia_snake: A = 3 si Snake esta mas lejos en Y, 0x0C si en X
	and b			;aa2a
	ld bc,00400h		;aa2b
lado_de_snake:
	rra			;aa2e   ; el lado siguiente...
	jr c,pon_dibujo_hacia		;aa2f   ; ...ese: su dibujo
	inc c			;aa31   ; el dibujo de la direccion siguiente (+ 2)
	inc c			;aa32
	djnz lado_de_snake		;aa33
	ld c,002h		;aa35   ; ninguno: el 2
pon_dibujo_hacia:
	ld (ix+00dh),c		;aa37   ; guarda el dibujo del actor (bit 0: el paso)
	ret			;aa3a
actor_tipo_10:		; los actores de tipo 0x10 y 0x11: el byte 0x21 baja hasta 0; con la ruta (byte 0x11) por debajo de 0x10, sus pasos (p08:AA52); desde 0x10, en esta sala, los de p08:AAAF
	ld a,(ix+021h)		;aa3b
	and a			;aa3e
	jr z,ruta_del_10		;aa3f
	dec (ix+021h)		;aa41   ; uno menos al byte 0x21
ruta_del_10:
	ld a,(ix+011h)		;aa44
	cp 010h		;aa47   ; desde la ruta 0x10, aparte
	jp nc,actor_10_suelto		;aa49   ; actor_10_suelto: desde la ruta 0x10, en esta sala, por su paso (p08:AAAF); fuera, parado
	ld a,(ix+001h)		;aa4c   ; lee el paso del actor
	call 0424dh		;aa4f   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_AA52: 2 destinos del despachador p00:424D (call en p08:AA4F, el
;   indice en A): AA56, AA75; lo leen p08:AA4F (4 bytes)
;   0xaa52..0xaa56  (4 bytes)
DATA_tabla_AA52:
	defw 0aa56h,0aa75h	; aa52  -> tipo_10_paso_0 tipo_10_paso_1

; ======================================================================
; CODIGO 0xaa56..0xaaaf  (89 bytes)
; ======================================================================


tipo_10_paso_0:		; el primer tramo de su ruta (p08:B976 por el byte 0x11): su direccion y su destino; el byte 0x0F = el 0x21 + 1 y el paso siguiente
	call ruta_del_actor		;aa56   ; ruta_del_actor: HL = la ruta del byte 0x11 en p08:B976
	call direccion_del_tramo_b		;aa59   ; la direccion
	inc hl			;aa5c
	call 08e65h		;aa5d   ; el destino
	xor a			;aa60
	ld a,(ix+021h)		;aa61
	inc a			;aa64
	ld (ix+00fh),a		;aa65
paso_siguiente_10:
	inc (ix+001h)		;aa68   ; sube el paso del actor
	ret			;aa6b
ruta_del_actor:		; HL = la ruta del byte 0x11 en p08:B976
	ld a,(ix+011h)		;aa6c
	ld hl,0b976h		;aa6f
	jp 043f6h		;aa72   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
tipo_10_paso_1:		; hasta el destino del tramo, anda cada 2 cuadros; al llegar, el tramo siguiente (byte 0x0F, 3 bytes cada uno; 0xFF vuelve al primero)
	call 08e82h		;aa75   ; llega_al_destino: en la sala del destino, acarreo si aun no ha llegado al punto (segun hacia donde va)
	jr c,tramo_siguiente_10		;aa78   ; llegado: el siguiente
	ld a,(0ca03h)		;aa7a   ; lee el contador de cuadros (uno mas en cada interrupcion)
	rra			;aa7d
	ret c			;aa7e   ; cada 2 cuadros...
	jp 0902eh		;aa7f   ; ...anda
tramo_siguiente_10:
	call ruta_del_actor		;aa82   ; ruta_del_actor: HL = la ruta del byte 0x11 en p08:B976
	ld a,(ix+00fh)		;aa85   ; el tramo del byte 0x0F...
	ld b,a			;aa88
	inc (ix+00fh)		;aa89
	add a,a			;aa8c   ; ...* 3
	add a,b			;aa8d
	call 0423eh		;aa8e   ; suma_a_hl: HL = HL + A
	ld a,(hl)			;aa91
	inc a			;aa92   ; 0xFF: al primero
	call z,primer_tramo		;aa93   ; primer_tramo:
	call direccion_del_tramo_b		;aa96   ; la direccion...
	inc hl			;aa99
	jp 08e65h		;aa9a   ; ...y el destino
primer_tramo:
	ld (ix+00fh),001h		;aa9d
	jp ruta_del_actor		;aaa1   ; ruta_del_actor: HL = la ruta del byte 0x11 en p08:B976
actor_10_suelto:		; desde la ruta 0x10, en esta sala, por su paso (p08:AAAF); fuera, parado
	call 08100h		;aaa4   ; en_esta_sala: Z si el actor esta en la sala de ahora (fila y columna)
	jr nz,$+14		;aaa7
	ld a,(ix+001h)		;aaa9   ; lee el paso del actor
	call 0424dh		;aaac   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_AAAF: 3 destinos del despachador p00:424D (call en p08:AAAC, el
;   indice en A): AABA, AB09, AB74; lo leen p08:AAAC (6 bytes)
;   0xaaaf..0xaab5  (6 bytes)
DATA_tabla_AAAF:
	defw 0aabah,0ab09h,0ab74h	; aaaf  -> tipo_10_paso_libre_0 tipo_10_paso_libre_1 tipo_10_paso_libre_2

; ======================================================================
; CODIGO 0xaab5..0xaaf9  (68 bytes)
; ======================================================================


parado_10:
	ld (ix+00ch),000h		;aab5
	ret			;aab9
tipo_10_paso_libre_0:		; una direccion al azar sin choque (p08:AAE1), su velocidad, una espera de 0x40-0x7F y el paso siguiente
	call 090c8h		;aaba   ; choques_del_actor: C = por donde choca el actor (bits 0-3), con los puntos de p04:915C (o p04:9164 desde 0xD800)
	call 04256h		;aabd   ; al azar
	rra			;aac0
	and 003h		;aac1
prueba_direccion:
	call choca_en_a		;aac3   ; choca_en_a: acarreo si choca en la direccion A (el bit A de C)
	jr nc,direccion_libre_10		;aac6   ; sin choque: esa
	inc a			;aac8   ; si no, la siguiente
	and 003h		;aac9
	jr prueba_direccion		;aacb
direccion_libre_10:
	call velocidad_10		;aacd   ; velocidad_10: ...su velocidad de p08:AAF9 y el dibujo (direccion * 2)
	call 04256h		;aad0   ; la espera: 0x40-0x7F
	res 7,a		;aad3
	set 6,a		;aad5
	ld (ix+00eh),a		;aad7   ; guarda la espera del actor
	xor a			;aada
	ld a,(ix+021h)		;aadb
	jp paso_siguiente_10		;aade   ; paso_siguiente_10:
choca_en_a:		; acarreo si choca en la direccion A (el bit A de C)
	ld d,c			;aae1
	ld b,a			;aae2
	inc b			;aae3
bit_de_choque:
	rr d		;aae4
	djnz bit_de_choque		;aae6
	ret			;aae8
direccion_del_tramo_b:		; la direccion (bits 0-1) de HL...
	ld a,(hl)			;aae9
	and 003h		;aaea
velocidad_10:		; ...su velocidad de p08:AAF9 y el dibujo (direccion * 2)
	ld c,a			;aaec
	ld de,0aaf9h		;aaed
	call 08e40h		;aaf0   ; velocidad_de_tabla: las dos velocidades del actor de la tabla DE (4 bytes por direccion C) y el byte 0x0C (1 vertical, 2 horizontal)
	ld a,c			;aaf3
	add a,a			;aaf4
	ld (ix+00dh),a		;aaf5   ; guarda el dibujo del actor (bit 0: el paso)
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


tipo_10_paso_libre_1:		; si choca en su eje (arriba-abajo con el byte 0x0C impar, si no los lados), otra espera de 0x10-0x3F parado y el paso siguiente; si sale de Y 0x20-0xBF, da la vuelta en Y, de X 8-0xB7 en X; al acabar la espera, igual; cada 8 cuadros anda
	call 090c8h		;ab09   ; choques_del_actor: C = por donde choca el actor (bits 0-3), con los puntos de p04:915C (o p04:9164 desde 0xD800)
	ld a,(ix+00ch)		;ab0c
	rra			;ab0f   ; en vertical, los bits 0-1...
	ld a,003h		;ab10
	jr c,L_AB16		;ab12
	ld a,00ch		;ab14   ; ...en horizontal, los 2-3
L_AB16:
	and c			;ab16
	jr nz,tipo_10_para		;ab17   ; choca: parado
	ld a,(ix+003h)		;ab19   ; fuera de Y 0x20-0xBF...
	sub 020h		;ab1c
	cp 0a0h		;ab1e
	jr nc,vuelta_en_y_10		;ab20   ; ...da la vuelta en Y
	ld a,(ix+005h)		;ab22   ; fuera de X 8-0xB7...
	sub 008h		;ab25
	cp 0b0h		;ab27
	jr nc,vuelta_en_x_10		;ab29   ; ...en X
	dec (ix+00eh)		;ab2b   ; baja la espera del actor
	jr z,tipo_10_para		;ab2e   ; al acabar la espera, parado
	ld a,(0ca03h)		;ab30   ; lee el contador de cuadros (uno mas en cada interrupcion)
	and 007h		;ab33   ; cada 8 cuadros...
	ret nz			;ab35
	jp 0902eh		;ab36   ; ...anda
tipo_10_para:		; una espera de 0x10-0x3F...
	call 04256h		;ab39   ; azar: A = un numero al azar (0xCA03 rotado mas R)
	srl a		;ab3c
	srl a		;ab3e
	cp 010h		;ab40
	jr nc,pon_espera_10		;ab42
	ld a,010h		;ab44
pon_espera_10:
	ld (ix+00eh),a		;ab46   ; guarda la espera del actor
	ld (ix+00ch),000h		;ab49   ; ...parado y el paso siguiente
	jp paso_siguiente_10		;ab4d   ; paso_siguiente_10:
vuelta_en_y_10:
	call 0809eh		;ab50   ; vuelve_en_y: la velocidad en Y cambiada de signo
	jr espera_y_dibujo_al_reves		;ab53
vuelta_en_x_10:
	call 0808eh		;ab55   ; vuelve_en_x: la velocidad en X cambiada de signo
espera_y_dibujo_al_reves:		; una espera de 0x10-0x3F y el dibujo al reves
	call 04256h		;ab58   ; azar: A = un numero al azar (0xCA03 rotado mas R)
	srl a		;ab5b
	srl a		;ab5d
	cp 010h		;ab5f
	jr nc,pon_espera_10_b		;ab61
	ld a,010h		;ab63
pon_espera_10_b:
	ld (ix+00eh),a		;ab65   ; guarda la espera del actor
	ld a,(ix+00dh)		;ab68   ; lee el dibujo del actor (bit 0: el paso)
	rra			;ab6b
	rra			;ab6c
	ccf			;ab6d
	rla			;ab6e
	rla			;ab6f
	ld (ix+00dh),a		;ab70   ; guarda el dibujo del actor (bit 0: el paso)
	ret			;ab73
tipo_10_paso_libre_2:		; al acabar la espera, el paso 0
	dec (ix+00eh)		;ab74   ; baja la espera del actor
	ret nz			;ab77
	ld (ix+001h),000h		;ab78   ; el paso del actor = 0x00
	ret			;ab7c
actor_toca_a_snake:		; el actor de 0xD435 que toco a Snake, por el paso de 0xD434 (p08:AB88): su mensaje, esperarlo y, con algo pulsado, acabar
	ld ix,(0d435h)		;ab7d   ; lee el actor de 0xD434 (16 bits)
	ld a,(0d434h)		;ab81   ; lee 1 cuando un actor 0x10-0x16 toca a Snake (p07:AD0E)
	dec a			;ab84
	call 0424dh		;ab85   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_AB88: 3 destinos del despachador p00:424D (call en p08:AB85, el
;   indice en A): AB8E, ABA4, ABAA; lo leen p08:AB85 (6 bytes)
;   0xab88..0xab8e  (6 bytes)
DATA_tabla_AB88:
	defw 0ab8eh,0aba4h,0abaah	; ab88  -> toca_paso_1 toca_paso_2 toca_paso_3

; ======================================================================
; CODIGO 0xab8e..0xacdb  (333 bytes)
; ======================================================================


toca_paso_1:		; el dibujo al byte 0x15, salvo el 0x16 mirando a Snake (p08:ABBD), su mensaje (p01:6211) y el paso siguiente
	ld a,(ix+00dh)		;ab8e
	ld (ix+015h),a		;ab91
	ld a,(ix+000h)		;ab94
	cp 016h		;ab97
	call nz,mira_a_snake		;ab99   ; salvo el 0x16, mira a Snake
	call 06211h		;ab9c   ; su mensaje
d434_siguiente:		; el paso siguiente de 0xD434
	ld hl,0d434h		;ab9f   ; apunta a 1 cuando un actor 0x10-0x16 toca a Snake (p07:AD0E)
	inc (hl)			;aba2
	ret			;aba3
toca_paso_2:		; al acabar el mensaje, el paso siguiente
	call 0620bh		;aba4   ; mensaje_cada_cuadro_bancos_8:
	ret nz			;aba7
	jr d434_siguiente		;aba8
toca_paso_3:		; con algo recien pulsado: p01:7A2D, el dibujo de antes y 0xD434 = 0
	ld a,(0ca07h)		;abaa   ; lee lo recien pulsado del mando (los bits de 0xCA08 que no estaban)
	and a			;abad
	ret z			;abae   ; nada pulsado, nada
	call 07a2dh		;abaf   ; llama_7a27_1_bancos_8:
	ld a,(ix+015h)		;abb2   ; el dibujo de antes
	ld (ix+00dh),a		;abb5   ; guarda el dibujo del actor (bit 0: el paso)
	xor a			;abb8
	ld (0d434h),a		;abb9   ; guarda 1 cuando un actor 0x10-0x16 toca a Snake (p07:AD0E)
	ret			;abbc
mira_a_snake:		; el dibujo hacia Snake por el eje mas lejano: 4 + 2 (derecha) o 4 + 0 (izquierda); 0 + 2 (abajo) o 0 (arriba)
	ld bc,00202h		;abbd
	ld a,(0cb03h)		;abc0   ; lee la Y de Snake
	sub (ix+003h)		;abc3   ; Snake por debajo: 2...
	jr nc,dy_a_snake		;abc6
	ld b,000h		;abc8   ; ...por encima: 0
	neg		;abca
dy_a_snake:
	ld d,a			;abcc
	ld a,(0cb05h)		;abcd   ; lee la X de Snake
	sub (ix+005h)		;abd0   ; a la derecha: 2...
	jr nc,eje_a_snake		;abd3
	ld c,000h		;abd5   ; ...a la izquierda: 0
	neg		;abd7
eje_a_snake:		; mas lejos en X: 4 + C...
	cp d			;abd9
	ld a,004h		;abda
	jr nc,pon_dibujo_a_snake		;abdc
	xor a			;abde   ; ...en Y: 0 + B
	ld c,b			;abdf
pon_dibujo_a_snake:
	add a,c			;abe0
	ld (ix+00dh),a		;abe1   ; guarda el dibujo del actor (bit 0: el paso)
	ret			;abe4
actor_tipo_18:		; el actor de tipo 0x18, sin alerta: si el actor de 0xCFC0 (el 7) no esta en los pasos 8-0x0F, en su sitio (Y, X + 0x10 hasta 0xB8) y su sala; con sprites en esta sala o sin ellos fuera
	ld a,(0ca5fh)		;abe5   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	and a			;abe8
	ret nz			;abe9   ; con alerta, nada
	ld hl,0cfc0h		;abea
	inc l			;abed
	ld a,(hl)			;abee   ; su paso...
	sub 008h		;abef
	cp 008h		;abf1
	ret c			;abf3   ; ...en 8-0x0F, nada
	ld a,002h		;abf4
	add a,l			;abf6
	ld l,a			;abf7
	ld a,(hl)			;abf8   ; su Y
	ld (ix+003h),a		;abf9   ; guarda la Y del actor
	inc hl			;abfc
	inc hl			;abfd
	ld a,(hl)			;abfe   ; su X + 0x10...
	add a,010h		;abff
	cp 0b8h		;ac01   ; ...hasta 0xB8
	jr c,pon_x_18		;ac03
	ld a,0b8h		;ac05
pon_x_18:
	ld (ix+005h),a		;ac07   ; guarda la X del actor
	ld a,005h		;ac0a
	add a,l			;ac0c
	ld l,a			;ac0d
	ld a,(hl)			;ac0e   ; su fila...
	ld (ix+00ah),a		;ac0f   ; guarda la fila de la sala del actor
	inc hl			;ac12
	ld a,(hl)			;ac13   ; ...y columna
	ld (ix+00bh),a		;ac14   ; guarda la columna de la sala del actor
	call 08100h		;ac17   ; en_esta_sala: Z si el actor esta en la sala de ahora (fila y columna)
	jr nz,sin_sprites_18		;ac1a   ; en otra sala, fuera los sprites
	ld a,(ix+02eh)		;ac1c
	and a			;ac1f
	ret nz			;ac20   ; ya con sprites, nada
	jp 081c5h		;ac21   ; sprites_del_actor: sus sprites libres (p04:820A) y sus colores de p08:B9FB (p08:BA2F para el 1 con 0xD437)
sin_sprites_18:
	call 08273h		;ac24   ; lista_de_sprites: DE = IX + 0x2E: la lista de sprites del actor
	jp 080f3h		;ac27   ; a_p14_ba17_guarda: p14:BA17 guardando el banco de 0xA000
actor_tipo_14:		; el actor de tipo 0x14: en esta sala el sonido 0x32; paso 0: el tramo 0; paso 1: el tramo del byte 0x0F de su ruta (p08:ACE3 por el byte 0x11; 3 bytes: direccion con el bit 7 al byte 0x20, y el destino; 0xFF vuelve al 0), con su velocidad de p08:ACDB; paso 2: anda (p14:B88F) hasta el punto y otra vez el paso 1 con el tramo siguiente
	call 08100h		;ac2a   ; en_esta_sala: Z si el actor esta en la sala de ahora (fila y columna)
	jr nz,L_AC32		;ac2d
	call 06adah		;ac2f   ; el sonido 0x32
L_AC32:
	ld a,(ix+001h)		;ac32   ; lee el paso del actor
	cp 001h		;ac35
	jr z,tramo_del_14		;ac37   ; el paso 1
	jr nc,tipo_14_paso_2		;ac39   ; el 2 en adelante
	ld (ix+00fh),000h		;ac3b   ; el paso 0: el tramo 0
	jr paso_siguiente_14		;ac3f
tramo_del_14:		; con el byte 0x20...
	ld a,(ix+020h)		;ac41
	and a			;ac44
	jr z,tramo_de_la_ruta		;ac45
	call 08100h		;ac47   ; en_esta_sala: Z si el actor esta en la sala de ahora (fila y columna)
	call z,06c73h		;ac4a   ; ...en esta sala el sonido 0x55
tramo_de_la_ruta:
	ld a,(ix+011h)		;ac4d
	ld hl,0ace3h		;ac50   ; su ruta
	call 043f6h		;ac53   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld a,(ix+00fh)		;ac56   ; el tramo * 3
	ld b,a			;ac59
	add a,a			;ac5a
	add a,b			;ac5b
	call 0423eh		;ac5c   ; suma_a_hl: HL = HL + A
	ld a,(hl)			;ac5f
	cp 0ffh		;ac60
	jr nz,pon_tramo_14		;ac62   ; 0xFF: al primero
	ld (ix+00fh),000h		;ac64
	jr tramo_del_14		;ac68
pon_tramo_14:		; la direccion al byte 0x1D
	ld a,(hl)			;ac6a
	and 07fh		;ac6b
	ld (ix+01dh),a		;ac6d
	ld a,(hl)			;ac70   ; el bit 7: el byte 0x20
	rla			;ac71
	ld a,001h		;ac72
	jr c,pon_byte_20		;ac74
	xor a			;ac76
pon_byte_20:
	ld (ix+020h),a		;ac77
	inc hl			;ac7a
	ld a,(ix+01dh)		;ac7b
	push af			;ac7e
	call 08e65h		;ac7f   ; el destino
	pop af			;ac82
	ld hl,0acdbh		;ac83   ; su velocidad de p08:ACDB
	call 043f6h		;ac86   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld (ix+007h),l		;ac89   ; guarda la velocidad del actor en Y (alta)
	ld (ix+009h),h		;ac8c   ; guarda la velocidad del actor en X (alta)
	xor a			;ac8f
	ld (ix+006h),a		;ac90   ; guarda la velocidad del actor en Y (baja)
	ld (ix+008h),a		;ac93   ; guarda la velocidad del actor en X (baja)
	ld a,l			;ac96   ; en vertical, el byte 0x0C = 1...
	and a			;ac97
	ld a,001h		;ac98
	jr nz,pon_eje_14		;ac9a
	ld a,002h		;ac9c   ; ...en horizontal, 2
pon_eje_14:
	ld (ix+00ch),a		;ac9e
paso_siguiente_14:
	inc (ix+001h)		;aca1   ; sube el paso del actor
	ret			;aca4
tipo_14_paso_2:		; anda; en la sala del destino, al pasar el punto (byte 0x14) en su eje, el tramo siguiente y el paso 1
	call 080e6h		;aca5   ; a_p14_b88f_guarda: p14:B88F guardando el banco de 0xA000
	ld a,(ix+00ah)		;aca8   ; lee la fila de la sala del actor
	cp (ix+012h)		;acab   ; en otra sala, nada
	ret nz			;acae
	ld a,(ix+00bh)		;acaf   ; lee la columna de la sala del actor
	cp (ix+013h)		;acb2
	ret nz			;acb5
	ld a,(ix+00ch)		;acb6   ; en vertical, la Y y su velocidad...
	rra			;acb9
	ld b,(ix+003h)		;acba   ; lee la Y del actor
	ld a,(ix+007h)		;acbd   ; lee la velocidad del actor en Y (alta)
	jr c,pasa_el_punto		;acc0
	ld b,(ix+005h)		;acc2   ; ...en horizontal, la X
	ld a,(ix+009h)		;acc5   ; lee la velocidad del actor en X (alta)
pasa_el_punto:
	rla			;acc8
	ld a,(ix+014h)		;acc9   ; el punto
	jr c,pasa_hacia_abajo		;accc
	cp b			;acce   ; hacia arriba o la izquierda: por encima del punto, nada
	ret nc			;accf
	jr tramo_siguiente_14		;acd0
pasa_hacia_abajo:
	cp b			;acd2
	ret c			;acd3
tramo_siguiente_14:
	inc (ix+00fh)		;acd4
	dec (ix+001h)		;acd7   ; baja el paso del actor
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


actor_tipo_15:		; el actor de tipo 0x15: con el byte 0x19, los pasos de p08:AE58; si no, los de p08:AD50
	ld a,(ix+019h)		;ad43
	and a			;ad46
	jp nz,tipo_15_horizontal		;ad47   ; tipo_15_horizontal: con el byte 0x19, sus pasos (p08:AE58)
	ld a,(ix+001h)		;ad4a   ; lee el paso del actor
	call 0424dh		;ad4d   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_AD50: 4 destinos del despachador p00:424D (call en p08:AD4D, el
;   indice en A): AE21, AE1D, AE25, AE03; lo leen p08:AD4D (8 bytes)
;   0xad50..0xad58  (8 bytes)
DATA_tabla_AD50:
	defw 0ae21h,0ae1dh,0ae25h,0ae03h	; ad50  -> paso_siguiente_15 tipo_15_paso_1 tipo_15_paso_2 tipo_15_paso_3

; ======================================================================
; CODIGO 0xad58..0xae58  (256 bytes)
; ======================================================================


empiezan_los_15:		; los actores de tipo 0x15 en el paso 0 toman su sitio (p08:AD78)
	ld ix,0ce00h		;ad58   ; apunta a los actores: 24 fichas de 0x40 bytes (p04:800D)
	ld b,018h		;ad5c   ; 24 actores
actor_15:
	ld a,(ix+000h)		;ad5e   ; lee el tipo del actor (0 = libre)
	and 07fh		;ad61
	cp 015h		;ad63   ; el 0x15...
	push bc			;ad65
	jr nz,siguiente_15		;ad66
	ld a,(ix+001h)		;ad68   ; lee el paso del actor
	and a			;ad6b   ; ...en el paso 0
	call z,sitio_del_15		;ad6c   ; sitio_del_15: de la lista de la zona (p08:BBA9) la entrada del byte 0x11 (10 bytes): Y, X, fila, columna (tambien a los bytes 0x20-0x23), los dos puntos (0x24-0x25), el destino (fila y columna a 0x26-0x27 y 0x12-0x13), la direccion (con su velocidad de p08:AE6B y el punto en el byte 0x14) y el dibujo; el byte 0x0C al 0x16; con alerta, el paso 3
siguiente_15:
	ld bc,00040h		;ad6f
	add ix,bc		;ad72
	pop bc			;ad74
	djnz actor_15		;ad75
	ret			;ad77
sitio_del_15:		; de la lista de la zona (p08:BBA9) la entrada del byte 0x11 (10 bytes): Y, X, fila, columna (tambien a los bytes 0x20-0x23), los dos puntos (0x24-0x25), el destino (fila y columna a 0x26-0x27 y 0x12-0x13), la direccion (con su velocidad de p08:AE6B y el punto en el byte 0x14) y el dibujo; el byte 0x0C al 0x16; con alerta, el paso 3
	ld (ix+00fh),000h		;ad78
	ld a,(0ca4ah)		;ad7c   ; la lista de la zona
	ld hl,0bba9h		;ad7f
	call 043f6h		;ad82   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld a,(ix+011h)		;ad85   ; la entrada * 10
	and 03fh		;ad88
	add a,a			;ad8a
	ld b,a			;ad8b
	add a,a			;ad8c
	add a,a			;ad8d
	add a,b			;ad8e
	call 0423eh		;ad8f   ; suma_a_hl: HL = HL + A
	ld a,(hl)			;ad92   ; la Y
	ld (ix+003h),a		;ad93   ; guarda la Y del actor
	ld (ix+020h),a		;ad96
	ld (ix+002h),000h		;ad99   ; la Y del actor (fraccion) = 0x00
	inc hl			;ad9d
	ld a,(hl)			;ad9e   ; la X
	ld (ix+005h),a		;ad9f   ; guarda la X del actor
	ld (ix+021h),a		;ada2
	ld (ix+004h),000h		;ada5   ; la X del actor (fraccion) = 0x00
	inc hl			;ada9
	ld a,(hl)			;adaa   ; la fila
	ld (ix+00ah),a		;adab   ; guarda la fila de la sala del actor
	ld (ix+022h),a		;adae
	inc hl			;adb1
	ld a,(hl)			;adb2   ; la columna
	ld (ix+00bh),a		;adb3   ; guarda la columna de la sala del actor
	ld (ix+023h),a		;adb6
	inc hl			;adb9
	ld a,(hl)			;adba   ; un punto...
	ld (ix+024h),a		;adbb
	inc hl			;adbe
	ld a,(hl)			;adbf   ; ...el otro
	ld (ix+025h),a		;adc0
	inc hl			;adc3
	ld a,(hl)			;adc4   ; la fila del destino...
	ld (ix+026h),a		;adc5
	ld (ix+012h),a		;adc8
	inc hl			;adcb
	ld a,(hl)			;adcc   ; ...y su columna
	ld (ix+027h),a		;adcd
	ld (ix+013h),a		;add0
	inc hl			;add3
	ld a,(hl)			;add4   ; la direccion
	ld c,a			;add5
	cp 002h		;add6   ; en vertical el primer punto...
	ld b,(ix+024h)		;add8
	jr c,punto_del_15		;addb
	ld b,(ix+025h)		;addd   ; ...en horizontal el segundo
punto_del_15:
	ld (ix+014h),b		;ade0
	ld de,0ae6bh		;ade3   ; su velocidad
	push hl			;ade6
	call 08e40h		;ade7   ; velocidad_de_tabla: las dos velocidades del actor de la tabla DE (4 bytes por direccion C) y el byte 0x0C (1 vertical, 2 horizontal)
	pop hl			;adea
	inc hl			;adeb
	ld a,(hl)			;adec   ; el dibujo
	ld (ix+00dh),a		;aded   ; guarda el dibujo del actor (bit 0: el paso)
	ld a,(ix+00ch)		;adf0   ; el byte 0x0C al 0x16
	ld (ix+016h),a		;adf3
	ld a,(0ca5fh)		;adf6   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	and a			;adf9
	ret z			;adfa   ; sin alerta, ya esta
	ld a,(ix+000h)		;adfb   ; lee el tipo del actor (0 = libre)
	ld (ix+001h),003h		;adfe   ; con ella, el paso 3
	ret			;ae02
tipo_15_paso_3:		; parado; sin alerta y fuera de esta sala, el paso del byte 0x28 y el byte 0x0C del 0x16
	ld (ix+00ch),000h		;ae03
	ld a,(0ca5fh)		;ae07   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	and a			;ae0a
	ret nz			;ae0b   ; con alerta, nada
	call 08100h		;ae0c   ; en_esta_sala: Z si el actor esta en la sala de ahora (fila y columna)
	ret z			;ae0f   ; en esta sala, nada
	ld a,(ix+028h)		;ae10   ; el paso guardado
	ld (ix+001h),a		;ae13   ; guarda el paso del actor
	ld a,(ix+016h)		;ae16   ; el byte 0x0C guardado
	ld (ix+00ch),a		;ae19
	ret			;ae1c
tipo_15_paso_1:		; al llegar al destino, el paso siguiente
	call 08e82h		;ae1d   ; llega_al_destino: en la sala del destino, acarreo si aun no ha llegado al punto (segun hacia donde va)
	ret nc			;ae20
paso_siguiente_15:
	inc (ix+001h)		;ae21   ; sube el paso del actor
	ret			;ae24
tipo_15_paso_2:		; da la vuelta en Y y va al otro extremo (p08:AE2E con la Y de antes y el primer punto)
	call 0809eh		;ae25   ; vuelve_en_y: la velocidad en Y cambiada de signo
	ld b,(ix+020h)		;ae28
	ld c,(ix+024h)		;ae2b
otro_extremo:		; el paso 1 y, alternando (byte 0x0F), el destino de salida (bytes 0x22-0x23 con B) o el de llegada (0x26-0x27 con C)
	ld (ix+001h),001h		;ae2e   ; el paso del actor = 0x01
	ld a,(ix+00fh)		;ae32   ; alterna
	inc (ix+00fh)		;ae35
	rra			;ae38
	ld d,(ix+022h)		;ae39   ; la sala de salida...
	ld e,(ix+023h)		;ae3c
	jr nc,pon_destino_15		;ae3f
	ld b,c			;ae41   ; ...o la de llegada
	ld d,(ix+026h)		;ae42
	ld e,(ix+027h)		;ae45
pon_destino_15:
	ld (ix+014h),b		;ae48
	ld (ix+012h),d		;ae4b
	ld (ix+013h),e		;ae4e
	ret			;ae51
tipo_15_horizontal:		; con el byte 0x19, sus pasos (p08:AE58)
	ld a,(ix+001h)		;ae52   ; lee el paso del actor
	call 0424dh		;ae55   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_AE58: 4 destinos del despachador p00:424D (call en p08:AE55, el
;   indice en A): AE21, AE1D, AE60, AE03; lo leen p08:AE55 (8 bytes)
;   0xae58..0xae60  (8 bytes)
DATA_tabla_AE58:
	defw 0ae21h,0ae1dh,0ae60h,0ae03h	; ae58  -> paso_siguiente_15 tipo_15_paso_1 tipo_15_vuelta_x tipo_15_paso_3

; ======================================================================
; CODIGO 0xae60..0xae6b  (11 bytes)
; ======================================================================


tipo_15_vuelta_x:		; da la vuelta en X y va al otro extremo (con la X de antes y el segundo punto)
	call 0808eh		;ae60   ; vuelve_en_x: la velocidad en X cambiada de signo
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


actores_0a_pintados:		; en la zona 4, los actores de tipo 0x0A de esta sala pintados con el dibujo 0 (p08:AEE2); en la columna 9, solo con 0xCB21 = 3 o sin 0xCACD
	ld a,(0ca4ah)		;ae7b   ; lee la zona
	cp 004h		;ae7e
	ret nz			;ae80   ; solo en la zona 4
	ld ix,0ce00h		;ae81   ; apunta a los actores: 24 fichas de 0x40 bytes (p04:800D)
	ld b,018h		;ae85   ; 24 actores
actor_0a_b:
	push bc			;ae87
	ld a,(ix+000h)		;ae88   ; lee el tipo del actor (0 = libre)
	cp 00ah		;ae8b
	jr nz,siguiente_0a		;ae8d   ; solo el 0x0A...
	call 08100h		;ae8f   ; en_esta_sala: Z si el actor esta en la sala de ahora (fila y columna)
	jr nz,siguiente_0a		;ae92   ; ...de esta sala
	ld a,(ix+00bh)		;ae94   ; lee la columna de la sala del actor
	cp 009h		;ae97
	jr nz,pinta_0a_dibujo_0		;ae99   ; fuera de la columna 9, pintado
	ld a,(0cb21h)		;ae9b   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	cp 003h		;ae9e
	jr z,pinta_0a_dibujo_0		;aea0   ; con 0xCB21 = 3, pintado
	ld a,(0cacdh)		;aea2
	and a			;aea5
	jr nz,siguiente_0a		;aea6   ; con 0xCACD, no
pinta_0a_dibujo_0:		; el dibujo 0...
	ld (ix+00dh),000h		;aea8   ; el dibujo del actor (bit 0: el paso) = 0x00
	call pinta_0a		;aeac   ; ...pintado
siguiente_0a:
	ld bc,00040h		;aeaf
	add ix,bc		;aeb2
	pop bc			;aeb4
	djnz actor_0a_b		;aeb5
	ret			;aeb7
pinta_0a_en_la_otra:		; en esta sala (y en la columna 9 con 0xCB21 = 3 o sin 0xCACD), el dibujo del actor en la otra pagina con 0xCA4C = 0x0706
	ld de,00706h		;aeb8
pinta_0a_de:		; lo mismo con DE en 0xCA4C
	call 08100h		;aebb   ; en_esta_sala: Z si el actor esta en la sala de ahora (fila y columna)
	ret nz			;aebe
pinta_0a_si:
	ld a,(ix+00bh)		;aebf   ; lee la columna de la sala del actor
	cp 009h		;aec2
	jr nz,pinta_en_la_otra		;aec4   ; fuera de la columna 9, si
	ld a,(0cb21h)		;aec6   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	cp 003h		;aec9
	jr z,pinta_en_la_otra		;aecb   ; con 0xCB21 = 3, si
	ld a,(0cacdh)		;aecd
	and a			;aed0
	ret nz			;aed1   ; con 0xCACD, no
pinta_en_la_otra:		; la pagina de dibujo cambiada...
	ld hl,0ca42h		;aed2   ; apunta a la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	ld a,(hl)			;aed5
	push af			;aed6
	xor 001h		;aed7
	ld (hl),a			;aed9
	push hl			;aeda
	call pinta_dibujo_0a		;aedb   ; ...pinta...
	pop hl			;aede
	pop af			;aedf   ; ...y de vuelta
	ld (hl),a			;aee0
	ret			;aee1
pinta_0a:		; el dibujo con 0xCA4C = 0x0706
	ld de,00706h		;aee2
pinta_dibujo_0a:		; 0xCA4C = DE y el mosaico del dibujo del actor (p08:AFA7: B filas de C, desplazamiento en X y en Y) en su X e Y menos eso (p12:741E)
	ld (0ca4ch),de		;aee5   ; guarda los 4 bits altos del byte de la sala (p56:BD28) y el byte siguiente (16 bits)
	ld a,(ix+00dh)		;aee9   ; el dibujo...
	ld hl,0afa7h		;aeec
	call 043f6h		;aeef   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld b,(hl)			;aef2   ; ...B filas...
	inc hl			;aef3
	ld c,(hl)			;aef4   ; ...de C
	inc hl			;aef5
	ld a,(ix+005h)		;aef6   ; la X - el desplazamiento
	sub (hl)			;aef9
	ld d,a			;aefa
	inc hl			;aefb
	ld a,(ix+003h)		;aefc   ; la Y - el suyo
	sub (hl)			;aeff
	ld e,a			;af00
	inc hl			;af01
	call 041ddh		;af02   ; bancos_12: pone el 12 en 0x6000 (con su copia en 0xC381-0xC383)
	call 0741eh		;af05   ; pintado (p12:741E)
	jp 041b5h		;af08   ; bancos_1_4_8: pone el 1 en 0x6000, el 4 en 0x8000, el 8 en 0xA000 (con su copia en 0xC381-0xC383)
actor_tipo_0a:		; el actor de tipo 0x0A: sus pasos (p08:AF11)
	ld a,(ix+001h)		;af0b   ; lee el paso del actor
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


tipo_0a_paso_1:		; una espera de 4-11 y el paso siguiente
	call espera_4_11		;af1d   ; espera_4_11: la espera = 4-11 al azar
	jr espera_y_paso_0a		;af20
tipo_0a_paso_2:		; al acabar la espera: el dibujo 1 pintado, 8 cambios (byte 0x0F), otra espera y el paso siguiente
	dec (ix+00eh)		;af22   ; baja la espera del actor
	ret nz			;af25
	ld (ix+00dh),001h		;af26   ; el dibujo 1...
	call pinta_0a_en_la_otra		;af2a   ; ...pintado
	ld (ix+00fh),008h		;af2d   ; 8 cambios
espera_y_paso_0a:
	call espera_4_11		;af31   ; espera_4_11: la espera = 4-11 al azar
paso_siguiente_0a:
	inc (ix+001h)		;af34   ; sube el paso del actor
nada_0a:
	ret			;af37
espera_4_11:		; la espera = 4-11 al azar
	call 04256h		;af38   ; azar: A = un numero al azar (0xCA03 rotado mas R)
	and 007h		;af3b
	add a,004h		;af3d
	ld (ix+00eh),a		;af3f   ; guarda la espera del actor
	ret			;af42
tipo_0a_paso_3:		; al acabar cada espera, el dibujo siguiente de p08:AF6B (2, 3, 2, 4) pintado; tras 8, el paso 0 con el dibujo 0
	dec (ix+00eh)		;af43   ; baja la espera del actor
	ret nz			;af46
	dec (ix+00fh)		;af47   ; un cambio menos
	jr z,tipo_0a_fin_3		;af4a
	call espera_4_11		;af4c   ; otra espera
	ld a,(ix+00fh)		;af4f   ; su dibujo de p08:AF6B
	and 003h		;af52
	ld hl,0af6bh		;af54
	call 0423eh		;af57   ; suma_a_hl: HL = HL + A
	ld a,(hl)			;af5a
	ld (ix+00dh),a		;af5b   ; guarda el dibujo del actor (bit 0: el paso)
	jp pinta_0a_en_la_otra		;af5e   ; pintado
tipo_0a_fin_3:		; el paso 0...
	xor a			;af61
	ld (ix+001h),a		;af62   ; guarda el paso del actor
	ld (ix+00dh),a		;af65   ; ...el dibujo 0...
	jp pinta_0a_en_la_otra		;af68   ; ...pintado

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


tipo_0a_paso_4:		; en esta sala: con alerta 2 o mas, el paso siguiente; si no, el paso 0
	call 08100h		;af6f   ; en_esta_sala: Z si el actor esta en la sala de ahora (fila y columna)
	ret nz			;af72   ; en otra sala, nada
	ld a,(0ca5fh)		;af73   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	cp 002h		;af76
	jr nc,$-68		;af78   ; alerta: el paso siguiente
	ld (ix+001h),000h		;af7a   ; el paso del actor = 0x00
	ret			;af7e
tipo_0a_paso_5:		; el dibujo 5 pintado con 0xCA4C = 0x0100 y el actor pasa a tipo 1 (Y + 8, X - 0x14), paso 0, dibujo 0, con sus sprites
	ld (ix+00dh),005h		;af7f   ; el dibujo del actor (bit 0: el paso) = 0x05
	ld de,00100h		;af83   ; 0xCA4C = 0x0100
	call pinta_0a_de		;af86   ; pinta_0a_de: lo mismo con DE en 0xCA4C
	ld a,(ix+003h)		;af89   ; Y + 8
	add a,008h		;af8c
	ld (ix+003h),a		;af8e   ; guarda la Y del actor
	ld a,(ix+005h)		;af91   ; X - 0x14
	sub 014h		;af94
	ld (ix+005h),a		;af96   ; guarda la X del actor
	ld (ix+000h),001h		;af99   ; al tipo 1
	xor a			;af9d
	ld (ix+001h),a		;af9e   ; guarda el paso del actor
	ld (ix+00dh),a		;afa1   ; guarda el dibujo del actor (bit 0: el paso)
	jp 081c5h		;afa4   ; sus sprites

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


actor_tipo_13:		; el actor de tipo 0x13: sus pasos (p08:AFF2)
	ld a,(ix+001h)		;afec   ; lee el paso del actor
	call 0424dh		;afef   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_AFF2: 4 destinos del despachador p00:424D (call en p08:AFEF, el
;   indice en A): B003, AFFA, B011, B032; lo leen p08:AFEF (8 bytes)
;   0xaff2..0xaffa  (8 bytes)
DATA_tabla_AFF2:
	defw 0b003h,0affah,0b011h,0b032h	; aff2  -> tipo_13_paso_0 tipo_13_paso_1 tipo_13_paso_2 tipo_13_paso_3

; ======================================================================
; CODIGO 0xaffa..0xb050  (86 bytes)
; ======================================================================


tipo_13_paso_1:		; cada 4-11 cuadros, anda
	dec (ix+00eh)		;affa   ; baja la espera del actor
	ret nz			;affd
	call 0902eh		;affe   ; p04:902E
	jr espera_4_11_b		;b001
tipo_13_paso_0:		; el paso siguiente y una espera de 4-11
	call paso_siguiente_13		;b003   ; paso_siguiente_13:
espera_4_11_b:
	call 04256h		;b006   ; azar: A = un numero al azar (0xCA03 rotado mas R)
	and 007h		;b009
	add a,004h		;b00b
	ld (ix+00eh),a		;b00d   ; guarda la espera del actor
	ret			;b010
tipo_13_paso_2:		; el dibujo 2, 0x10 cuadros, el sonido 0x15 y el paso siguiente
	ld (ix+00dh),002h		;b011   ; el dibujo del actor (bit 0: el paso) = 0x02
	ld (ix+00eh),010h		;b015   ; la espera del actor = 0x10
	call 06a48h		;b019   ; sonido_15: pide el sonido 0x15
paso_siguiente_13:
	inc (ix+001h)		;b01c   ; sube el paso del actor
	ret			;b01f
colores_del_sprite:		; los 16 colores del sprite A - 1 (0xDAA0 + 16 * (A - 1)) al color C
	dec a			;b020
	ld hl,0daa0h		;b021
	add a,a			;b024   ; * 16
	add a,a			;b025
	add a,a			;b026
	add a,a			;b027
	call 0423eh		;b028   ; suma_a_hl: HL = HL + A
	ld a,c			;b02b   ; el color
	ld bc,0000fh		;b02c
	jp 04237h		;b02f   ; llena_bloque: pone A en BC + 1 bytes desde HL
tipo_13_paso_3:		; la espera: los dos sprites (bytes 0x2E y 0x2F) a los colores 7 y 0x0A y, en los cuadros impares, anda; al acabar, fuera (p04:834C)
	dec (ix+00eh)		;b032   ; baja la espera del actor
	jp z,0834ch		;b035   ; al acabar, fuera
	ld a,(ix+02eh)		;b038   ; el primer sprite al 7
	ld c,007h		;b03b
	call colores_del_sprite		;b03d   ; colores_del_sprite: los 16 colores del sprite A - 1 (0xDAA0 + 16 * (A - 1)) al color C
	ld a,(ix+02fh)		;b040   ; el segundo al 0x0A
	ld c,00ah		;b043
	call colores_del_sprite		;b045   ; colores_del_sprite: los 16 colores del sprite A - 1 (0xDAA0 + 16 * (A - 1)) al color C
	ld a,(ix+00eh)		;b048   ; lee la espera del actor
	rra			;b04b   ; los impares...
	jp c,0902eh		;b04c   ; ...anda
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


escena_e1f0:		; la escena de 0xE1F0 por su paso 0xE1F1 (p08:BC64, 9 pasos) y, mientras dura, sus sprites (p08:BE09)
	call escena_e1f0_paso		;bc53   ; escena_e1f0_paso:
	ld a,(0e1f0h)		;bc56   ; sin 0xE1F0, sin sprites
	or a			;bc59
	ret z			;bc5a
	jp sprites_e1f0		;bc5b   ; sprites_e1f0: los sprites de la escena (p08:BE0E) y sus colores (p08:BE35)
escena_e1f0_paso:
	ld a,(0e1f1h)		;bc5e
	call 0424dh		;bc61   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_BC64: 9 destinos del despachador p00:424D (call en p08:BC61, el
;   indice en A): BC76, BCBB, BCC2, BD1F, BD32, BD53, BD7A, BD85, BDA7; lo
;   leen p08:BC61 (18 bytes)
;   0xbc64..0xbc76  (18 bytes)
DATA_tabla_BC64:
	defw 0bc76h,0bcbbh,0bcc2h,0bd1fh,0bd32h,0bd53h,0bd7ah,0bd85h	; bc64
	defw 0bda7h	; bc74  -> escena_e1f0_paso_8

; ======================================================================
; CODIGO 0xbc76..0xbd14  (158 bytes)
; ======================================================================


escena_e1f0_paso_0:		; 0xE1F3 = 0xFF, 0xCAF0 = 1; con la pantalla apagada: los dibujos de p00:4D16, sin sprites, el mapa y la paleta de la escena, la pagina copiada a la otra, Snake en (0xA8, 0x60), p12:6F41, las lineas y el marcador; todo encendido y el paso siguiente
	ld a,0ffh		;bc76
	ld (0e1f3h),a		;bc78
	ld hl,0caf0h		;bc7b   ; 0xCAF0 = 1
	ld (hl),001h		;bc7e
	call 045f1h		;bc80   ; pantalla apagada
	call 04d16h		;bc83   ; los dibujos
	call 04266h		;bc86   ; sin sprites
	call 045d7h		;bc89   ; esconde_sprites_vram: llena con 0xE0 128 bytes de la VRAM en 0xF600 y otros 128 en 0xF200
	call 07072h		;bc8c   ; el mapa
	call 084f4h		;bc8f   ; la paleta
	ld hl,00000h		;bc92   ; la pagina entera...
	ld d,h			;bc95
	ld e,l			;bc96
	ld bc,0c0c0h		;bc97
	call 0475ah		;bc9a   ; ...a la otra
	ld de,060a8h		;bc9d   ; Snake en Y = 0xA8...
	ld hl,0cb03h		;bca0   ; apunta a la Y de Snake
	ld (hl),e			;bca3
	inc hl			;bca4
	inc hl			;bca5
	ld (hl),d			;bca6   ; ...X = 0x60
	call 05febh		;bca7   ; a_p12_6f41_b_8: a_p12_6f41 y deja el banco 8
	call 0439dh		;bcaa   ; las lineas
	call 0437eh		;bcad   ; el marcador
	call 04650h		;bcb0   ; espera_vdp: espera a que el VDP acabe la orden en curso (S#2 bit 0)
	call 04606h		;bcb3   ; todo encendido
e1f1_siguiente:		; el paso siguiente de 0xE1F1
	ld hl,0e1f1h		;bcb6
	inc (hl)			;bcb9
	ret			;bcba
escena_e1f0_paso_1:		; 0xE1F3 = 0x70 y el paso siguiente
	ld a,070h		;bcbb
	ld (0e1f3h),a		;bcbd
	jr e1f1_siguiente		;bcc0
escena_e1f0_paso_2:		; guarda 0x60 x 0x10 de (0x30, 0x24) en (0x30, 0xE0), un recuadro (color 0x99, marco 7) con el letrero de p08:BD14 en (0x38, 0x28), 0x40 cuadros y el paso siguiente
	ld hl,03024h		;bcc2
	ld bc,06010h		;bcc5
	push hl			;bcc8
	push bc			;bcc9
	call guarda_recuadro		;bcca   ; guarda el fondo
	pop bc			;bccd
	pop hl			;bcce
	call recuadro		;bccf   ; el recuadro
	ld hl,0bd14h		;bcd2
	ld de,03828h		;bcd5
	call 04950h		;bcd8   ; el letrero
	ld hl,0e1f2h		;bcdb
	ld (hl),040h		;bcde   ; 0x40 cuadros
	jr e1f1_siguiente		;bce0
guarda_recuadro:		; HL (BC) a (0x30, 0xE0) en la pagina de dibujo
	ld de,030e0h		;bce2
	ld a,(0ca42h)		;bce5   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	and 001h		;bce8
copia_bcea:
	jp 04767h		;bcea   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
repone_recuadro:		; 0x60 x 0x10 de (0x30, 0xE0) de vuelta a (0x30, 0x24)
	ld de,03024h		;bced
	ld hl,030e0h		;bcf0
	ld bc,06010h		;bcf3
	ld a,(0ca42h)		;bcf6   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	rlca			;bcf9
	rlca			;bcfa
	and 00ch		;bcfb
	jr copia_bcea		;bcfd
recuadro:		; el rectangulo de HL (BC) al color 0x99 y un marco de color 7
	ld a,(0ca42h)		;bcff   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	ld d,a			;bd02
	ld a,099h		;bd03   ; relleno 0x99
	push hl			;bd05
	push bc			;bd06
	call 046ffh		;bd07   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
	pop de			;bd0a
	pop hl			;bd0b
	ld a,(0ca42h)		;bd0c   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	ld c,007h		;bd0f   ; marco 7
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


escena_e1f0_paso_3:		; al acabar la cuenta: 0xF0 cuadros, el fondo repuesto, el sonido 0x2F y el paso siguiente
	ld hl,0e1f2h		;bd1f
	dec (hl)			;bd22
	ret nz			;bd23
	ld hl,0e1f2h		;bd24
	ld (hl),0f0h		;bd27   ; 0xF0 cuadros
	call repone_recuadro		;bd29   ; el fondo
	call 06ab7h		;bd2c   ; sonido_2f: pide el sonido 0x2F
	jp e1f1_siguiente		;bd2f   ; e1f1_siguiente: el paso siguiente de 0xE1F1
escena_e1f0_paso_4:		; R#18 tiembla (p08:BD45) toda la cuenta; al acabar, R#18 a 0, el sonido 0x30 y el paso siguiente
	call tiembla_bd45		;bd32   ; tiembla_bd45: R#18 = 0 o 0x40 cada 2 cuadros
	ld hl,0e1f2h		;bd35
	dec (hl)			;bd38
	ret nz			;bd39
	ld b,000h		;bd3a   ; R#18 a 0
	call pon_r18_p08		;bd3c   ; pon_r18_p08: el registro 18 del VDP = B
	call 06abbh		;bd3f   ; sonido_30: pide el sonido 0x30
	jp e1f1_siguiente		;bd42   ; e1f1_siguiente: el paso siguiente de 0xE1F1
tiembla_bd45:		; R#18 = 0 o 0x40 cada 2 cuadros
	ld a,(0ca03h)		;bd45   ; lee el contador de cuadros (uno mas en cada interrupcion)
	rra			;bd48
	and 001h		;bd49
	rrca			;bd4b
	rrca			;bd4c
	ld b,a			;bd4d
pon_r18_p08:		; el registro 18 del VDP = B
	ld c,012h		;bd4e
	jp 00047h		;bd50   ; BIOS WRTVDP - Writes data in the VDP-register
escena_e1f0_paso_5:		; otro recuadro con el letrero de p08:BD74 en (0x48, 0x28), 0x40 cuadros y el paso siguiente
	ld hl,03024h		;bd53
	ld bc,06010h		;bd56
	push hl			;bd59
	push bc			;bd5a
	call guarda_recuadro		;bd5b   ; guarda el fondo
	pop bc			;bd5e
	pop hl			;bd5f
	call recuadro		;bd60   ; el recuadro
	ld hl,0bd74h		;bd63
	ld de,04828h		;bd66
	call 04950h		;bd69   ; el letrero
	ld hl,0e1f2h		;bd6c
	ld (hl),040h		;bd6f
	jp e1f1_siguiente		;bd71   ; e1f1_siguiente: el paso siguiente de 0xE1F1

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


escena_e1f0_paso_6:		; al acabar la cuenta, el fondo repuesto y el paso siguiente
	ld hl,0e1f2h		;bd7a
	dec (hl)			;bd7d
	ret nz			;bd7e
	call repone_recuadro		;bd7f   ; repone_recuadro: 0x60 x 0x10 de (0x30, 0xE0) de vuelta a (0x30, 0x24)
	jp e1f1_siguiente		;bd82   ; e1f1_siguiente: el paso siguiente de 0xE1F1
escena_e1f0_paso_7:		; cada 8 cuadros cambia 0xDFD2; 0xE1F3 baja uno por cuadro y empuja a Snake hacia abajo (p08:BD9B); al llegar a 0xB8, 0x40 cuadros y el paso siguiente
	call cambia_dfd2		;bd85   ; cambia_dfd2: cada 8 cuadros, el bit 0 de 0xDFD2 cambia
	ld hl,0e1f3h		;bd88   ; 0xE1F3 uno mas
	inc (hl)			;bd8b
	call empuja_a_snake		;bd8c   ; empuja_a_snake: si la Y de Snake - 0x16 esta por encima de 0xE1F3, Snake baja uno
	ld a,(hl)			;bd8f
	cp 0b8h		;bd90   ; hasta 0xB8
	ret c			;bd92
	ld hl,0e1f2h		;bd93
	ld (hl),040h		;bd96
	jp e1f1_siguiente		;bd98   ; e1f1_siguiente: el paso siguiente de 0xE1F1
empuja_a_snake:		; si la Y de Snake - 0x16 esta por encima de 0xE1F3, Snake baja uno
	ld a,(0cb03h)		;bd9b   ; lee la Y de Snake
	sub 016h		;bd9e
	cp (hl)			;bda0
	ret nc			;bda1
	ld hl,0cb03h		;bda2   ; apunta a la Y de Snake
	inc (hl)			;bda5
	ret			;bda6
escena_e1f0_paso_8:		; al acabar la cuenta: 0xE1F0 = 0, 0xE1F3 = 0xFF y a la zona 9 (fila 1, columna 8, Snake en (0x5F, 0x80)); desde la sala especial 0x32, a la zona 0x0A (fila 3, columna 8, Snake en (0x40, 0x90)) con 0xD418 = 0x0C30 y 0xD41E = 4
	ld hl,0e1f2h		;bda7
	dec (hl)			;bdaa
	ret nz			;bdab
	xor a			;bdac   ; 0xE1F0 = 0
	ld (0e1f0h),a		;bdad
	ld a,0ffh		;bdb0
	ld (0e1f3h),a		;bdb2
	ld a,(0ca76h)		;bdb5   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 032h		;bdb8
	jr z,a_la_zona_0a		;bdba   ; desde la especial 0x32, aparte
	ld hl,0ca50h		;bdbc   ; fila 1...
	ld (hl),001h		;bdbf
	inc l			;bdc1
	ld (hl),008h		;bdc2   ; ...columna 8
	ld a,05fh		;bdc4   ; Snake en Y = 0x5F...
	ld (0cb03h),a		;bdc6   ; guarda la Y de Snake
	ld a,080h		;bdc9   ; ...X = 0x80
	ld (0cb05h),a		;bdcb   ; guarda la X de Snake
	ld a,009h		;bdce   ; a la zona 9
	jp 08de3h		;bdd0   ; cambia_de_zona_b_1_2_8: cambia_de_zona y deja los bancos 1, 2 y 8
a_la_zona_0a:		; sin sala especial
	xor a			;bdd3
	ld (0ca76h),a		;bdd4   ; guarda la sala especial (0 = ninguna; indice de p24:64B6)
	ld hl,0ca50h		;bdd7   ; fila 3...
	ld (hl),003h		;bdda
	inc l			;bddc
	ld (hl),008h		;bddd   ; ...columna 8
	ld a,040h		;bddf   ; Snake en Y = 0x40...
	ld (0cb03h),a		;bde1   ; guarda la Y de Snake
	ld a,090h		;bde4   ; ...X = 0x90
	ld (0cb05h),a		;bde6   ; guarda la X de Snake
	ld a,00ah		;bde9   ; a la zona 0x0A
	call 08de3h		;bdeb   ; cambia_de_zona_b_1_2_8: cambia_de_zona y deja los bancos 1, 2 y 8
	ld hl,00c30h		;bdee   ; 0xD418 = 0x0C30
	ld (0d418h),hl		;bdf1
	ld a,004h		;bdf4   ; 0xD41E = 4
	ld (0d41eh),a		;bdf6
	ret			;bdf9
cambia_dfd2:		; cada 8 cuadros, el bit 0 de 0xDFD2 cambia
	ld a,(0ca03h)		;bdfa   ; lee el contador de cuadros (uno mas en cada interrupcion)
	and 007h		;bdfd
	ret nz			;bdff
	ld a,(0dfd2h)		;be00
	xor 001h		;be03
	ld (0dfd2h),a		;be05
	ret			;be08
sprites_e1f0:		; los sprites de la escena (p08:BE0E) y sus colores (p08:BE35)
	call sprites_de_e1f3		;be09   ; sprites_de_e1f3: desde el sprite 8 (0xDC40): dos en (0xE1F3 - 0x20, 0x58) con los patrones 0x58 y 0x5C, y dos 0x10 mas abajo con 0x60 y 0x64 (u 0x68 y 0x6C con 0xDFD2)
	jr colores_e1f0		;be0c
sprites_de_e1f3:		; desde el sprite 8 (0xDC40): dos en (0xE1F3 - 0x20, 0x58) con los patrones 0x58 y 0x5C, y dos 0x10 mas abajo con 0x60 y 0x64 (u 0x68 y 0x6C con 0xDFD2)
	ld hl,0dc40h		;be0e
	ld a,(0e1f3h)		;be11   ; la Y: 0xE1F3 - 0x20
	sub 020h		;be14
	ld e,a			;be16
	ld d,058h		;be17   ; la X 0x58
	ld c,058h		;be19   ; el patron 0x58
	call 05d41h		;be1b   ; pon_sprite: [E][D][C] en (HL): la Y, la X y el patron de un sprite de 0xDC00
	call 05d3dh		;be1e   ; pon_sprite_mas_4: p00:5D41 con el patron C + 4
	ld a,e			;be21   ; 0x10 mas abajo
	add a,010h		;be22
	ld e,a			;be24
	ld a,(0dfd2h)		;be25   ; con 0xDFD2...
	or a			;be28
	jr z,patron_dfd2		;be29
	ld a,008h		;be2b   ; ...8 patrones mas
patron_dfd2:
	add a,c			;be2d
	ld c,a			;be2e
	call 05d3dh		;be2f   ; pon_sprite_mas_4: p00:5D41 con el patron C + 4
	jp 05d3dh		;be32   ; pon_sprite_mas_4: p00:5D41 con el patron C + 4
colores_e1f0:		; los colores de los sprites 8-15 (0xDB00-0xDB7F) de las rachas de p08:BA97, p08:BAA4, p08:BAB2 y p08:BAB5 (dos veces)
	ld de,0ba97h		;be35
	ld hl,0db00h		;be38
	call 08de8h		;be3b   ; a_p01_6fd5: p01:6FD5 con el banco 1 en 0x6000
	ld de,0baa4h		;be3e
	ld hl,0db10h		;be41
	call 08de8h		;be44   ; a_p01_6fd5: p01:6FD5 con el banco 1 en 0x6000
	ld de,0bab2h		;be47
	ld hl,0db20h		;be4a
	call 08de8h		;be4d   ; a_p01_6fd5: p01:6FD5 con el banco 1 en 0x6000
	ld de,0bab5h		;be50
	ld hl,0db30h		;be53
	call 08de8h		;be56   ; a_p01_6fd5: p01:6FD5 con el banco 1 en 0x6000
	ld de,0ba97h		;be59
	ld hl,0db40h		;be5c
	call 08de8h		;be5f   ; a_p01_6fd5: p01:6FD5 con el banco 1 en 0x6000
	ld de,0baa4h		;be62
	ld hl,0db50h		;be65
	call 08de8h		;be68   ; a_p01_6fd5: p01:6FD5 con el banco 1 en 0x6000
	ld de,0bab2h		;be6b
	ld hl,0db60h		;be6e
	call 08de8h		;be71   ; a_p01_6fd5: p01:6FD5 con el banco 1 en 0x6000
	ld de,0bab5h		;be74
	ld hl,0db70h		;be77
	jp 08de8h		;be7a   ; a_p01_6fd5: p01:6FD5 con el banco 1 en 0x6000

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
