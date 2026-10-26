; ==========================================================================
; METAL GEAR 2 SOLID SNAKE - Konami (1990) - MSX2 - MegaROM RC-767 de 512 KB (Konami SCC) - banco 15 (se ejecuta en 0xa000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x0a000


; ======================================================================
; CODIGO 0xa000..0xa16d  (365 bytes)
; ======================================================================


puertas_sin_cuentas:		; carga las puertas de la sala (p15:A04C) y las pinta (p15:A008), sin bajar las cuentas de 0xD580
	call carga_puertas		;a000   ; cargar
	jr pinta_puertas		;a003   ; y pintar
puertas_de_la_sala:		; baja las cuentas de 0xD580 (p15:A1E2), carga las puertas de la sala y las pinta
	call cuentas_y_puertas		;a005   ; cuentas_y_puertas: baja las cuentas de 0xD580 y carga las puertas (p15:A04C)
pinta_puertas:		; con la pantalla partida, nada; cada ficha activa de 0xD500: en el estado 2 o con su cuenta de 0xD580, abierta (p15:A1F3, estado 2); si no, estado 0 y cerrada (p15:A12B)
	ld a,(0ca1ch)		;a008   ; lee 1: la pantalla partida en la linea 0xB4 (arriba con desplazamiento, abajo la pagina 1 sin sprites)
	and a			;a00b
	ret nz			;a00c   ; con la pantalla partida, nada
	ld ix,0d500h		;a00d   ; apunta a 8 fichas de puerta de 16 bytes [tipo][estado][Y][X][pide][numero][paso][alto][ancho][abre][cuenta] (p15:A04C; el choque en p07:BC95)
	ld b,008h		;a011   ; 8 fichas
puerta_al_pintar:
	push bc			;a013
	ld a,(ix+000h)		;a014   ; el tipo: 0, libre
	and a			;a017
	jr z,puerta_cerrada_al_entrar		;a018
	ld a,(ix+001h)		;a01a   ; el estado 2...
	cp 002h		;a01d
	jr z,puerta_ya_abierta		;a01f
	ld a,(ix+005h)		;a021   ; ...o su cuenta en 0xD580 (por su numero)
	ld hl,0d580h		;a024   ; apunta a 0x80 cuentas de las puertas por su numero: 0 cerrada, 0xFF siempre abierta; si no, cuantas entradas de sala le quedan abierta (p15:ACDE, p15:A1E2)
	call 0423eh		;a027   ; suma_a_hl: HL = HL + A
	ld a,(hl)			;a02a
	and a			;a02b
	jr z,puerta_cerrada_al_entrar		;a02c   ; sin cuenta: cerrada
puerta_ya_abierta:		; pintada abierta y en el estado 2
	call pinta_puerta_abierta		;a02e   ; pintada abierta...
	ld a,002h		;a031   ; ...y el estado 2
	jr pon_estado_puerta		;a033
puerta_cerrada_al_entrar:		; el estado 0 y pintada cerrada
	ld (ix+001h),a		;a035   ; el estado 0
	call pinta_puerta_cerrada		;a038   ; pintada cerrada
	jr puerta_siguiente		;a03b
pon_estado_puerta:
	ld (ix+001h),a		;a03d
puerta_siguiente:		; la ficha siguiente (16 bytes)
	ld bc,00010h		;a040
	add ix,bc		;a043
	pop bc			;a045
	djnz puerta_al_pintar		;a046   ; 8
	ret			;a048
cuentas_y_puertas:		; baja las cuentas de 0xD580 y carga las puertas (p15:A04C)
	call baja_cuentas_d580		;a049   ; baja_cuentas_d580: las 0x80 cuentas de 0xD580 uno menos (las de 0 y las de 0xFF no)
carga_puertas:		; 0xD500 a cero y las puertas de la sala de la lista de la zona (p15:AD0C) o de la sala especial (p15:B1FE): 6 bytes [sala][tipo][Y][X][pide][numero], 0xFF al final; cada una con su alto y ancho (p15:A1A8) y los casos de algunas zonas
	ld hl,0d500h		;a04c   ; las 8 fichas a cero
	ld bc,0007fh		;a04f
	call 04236h		;a052   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	ld a,(0ca76h)		;a055   ; sala especial...
	and a			;a058
	ld hl,0b1feh		;a059   ; ...su lista de p15:B1FE
	jr nz,lista_de_puertas		;a05c
	ld hl,0ad0ch		;a05e   ; si no, la de la zona en p15:AD0C
	ld a,(0ca4ah)		;a061   ; lee la zona
lista_de_puertas:		; HL = la lista; desde la primera ficha
	call 043f6h		;a064   ; HL = la lista
	ld ix,0d500h		;a067   ; desde la primera ficha
puerta_de_la_lista:
	ld a,(hl)			;a06b
	inc a			;a06c   ; 0xFF: se acaba
	ret z			;a06d
	ld a,(0ca4bh)		;a06e   ; solo las de esta sala
	cp (hl)			;a071
	jp nz,puerta_lista_siguiente		;a072   ; puerta_lista_siguiente: la siguiente de la lista (6 bytes)
	push hl			;a075
	inc hl			;a076   ; desde el tipo
	push ix		;a077
	pop de			;a079
	ldi		;a07a   ; el tipo al byte 0...
	inc de			;a07c   ; ...el byte 1 (estado) se salta...
	ldi		;a07d   ; ...Y, X, lo que pide y el numero a los bytes 2-5
	ldi		;a07f
	ldi		;a081
	ldi		;a083
	call alto_y_ancho		;a085   ; su alto y su ancho
	pop hl			;a088
	ld a,(0ca4ah)		;a089   ; en la zona 8, la de numero 0...
	cp 008h		;a08c
	jr nz,puerta_sala_18		;a08e
	ld a,(ix+005h)		;a090
	and a			;a093
	jr nz,puerta_sala_18		;a094
	ld a,(0d7dah)		;a096   ; ...sin el bit 0 de 0xD7DA...
	and 001h		;a099
	jr nz,puerta_sala_18		;a09b
	ld (ix+001h),002h		;a09d   ; ...entra en el estado 2
puerta_sala_18:		; en la sala especial 0x18, la de numero 0x1C con el bit 0 de 0xD7DA: no pide nada
	ld a,(0ca76h)		;a0a1   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	ld b,a			;a0a4
	cp 018h		;a0a5
	jr nz,puerta_tipo_0c		;a0a7
	ld a,(ix+005h)		;a0a9
	cp 01ch		;a0ac
	jr nz,puerta_tipo_0c		;a0ae
	ld a,(0d7dah)		;a0b0
	and 001h		;a0b3
	jr nz,puerta_no_pide		;a0b5
puerta_tipo_0c:		; las de tipo 0x0C con el bit 0 de 0xD7DA o con 0xD441 no piden nada
	ld a,(ix+000h)		;a0b7   ; las de tipo 0x0C...
	cp 00ch		;a0ba
	jr nz,puerta_sala_29		;a0bc
	ld a,(0d7dah)		;a0be   ; ...con el bit 0 de 0xD7DA...
	and 001h		;a0c1
	jr nz,puerta_no_pide		;a0c3
	ld a,(0d441h)		;a0c5   ; ...o con 0xD441: no piden nada
	and a			;a0c8
	jr z,puerta_sala_29		;a0c9
puerta_no_pide:		; lo que pide (byte 4) a 0
	ld (ix+004h),000h		;a0cb   ; lo que pide: nada
puerta_sala_29:		; en la sala especial 0x29, sala 2, con 0xD4F2: la ficha libre
	ld a,b			;a0cf
	cp 029h		;a0d0
	jr nz,puerta_por_zona		;a0d2
	ld a,(0ca4bh)		;a0d4   ; lee la sala de la zona
	cp 002h		;a0d7
	jr nz,puerta_por_zona		;a0d9
	ld a,(0d4f2h)		;a0db
	and a			;a0de
	jr z,puerta_por_zona		;a0df
	ld (ix+000h),000h		;a0e1
puerta_por_zona:		; las zonas 0x0E, 0x13 y 0x12
	ld a,(0ca4ah)		;a0e5   ; zona 0x0E...
	cp 00eh		;a0e8
	jr z,puerta_zona_0e		;a0ea
	cp 013h		;a0ec   ; ...0x13...
	jr z,puerta_zona_13		;a0ee
	cp 012h		;a0f0   ; ...0x12
	jr z,puerta_zona_12		;a0f2
	jr ficha_d500_siguiente		;a0f4
puerta_zona_0e:		; con 0xD885 = 0xFF, no pide nada
	ld a,(0d885h)		;a0f6   ; 0xD885 = 0xFF?
	inc a			;a0f9
	jr nz,ficha_d500_siguiente		;a0fa   ; no: pide lo suyo
	jr puerta_sin_pedir		;a0fc
puerta_zona_13:		; con 0xD884 = 0xFF, las de numero 0 y 1 no piden nada
	ld a,(0d884h)		;a0fe   ; 0xD884 = 0xFF?
	inc a			;a101
	jr nz,ficha_d500_siguiente		;a102   ; no: pide lo suyo
	ld a,(ix+005h)		;a104   ; la 0 y la 1...
	cp 002h		;a107
	jr nc,ficha_d500_siguiente		;a109
	jr puerta_sin_pedir		;a10b   ; ...no piden nada
puerta_zona_12:		; con 0xD889 = 0xFF, la de numero 0x13 no pide nada
	ld a,(0d889h)		;a10d   ; 0xD889 = 0xFF?
	inc a			;a110
	jr nz,ficha_d500_siguiente		;a111   ; no: pide lo suyo
	ld a,(ix+005h)		;a113   ; la 0x13...
	cp 013h		;a116
	jr nz,ficha_d500_siguiente		;a118   ; ...no pide nada
puerta_sin_pedir:		; lo que pide (byte 4) a 0
	ld (ix+004h),000h		;a11a   ; lo que pide: nada
ficha_d500_siguiente:		; la ficha siguiente (16 bytes)
	ld de,00010h		;a11e   ; la ficha siguiente
	add ix,de		;a121
puerta_lista_siguiente:		; la siguiente de la lista (6 bytes)
	ld a,006h		;a123
	call 0423eh		;a125   ; suma_a_hl: HL = HL + A
	jp puerta_de_la_lista		;a128   ; puerta_de_la_lista:
pinta_puerta_cerrada:		; salvo p15:A17B, las de tipo 3 y 4: 7 piezas de 8 x 8 en columna (X de p15:A16D o p15:A174, Y = 0x78) desde su sitio con la X de 8 en 8, en la otra pagina con la operacion 0xC8
	call puerta_no_se_pinta		;a12b   ; puerta_no_se_pinta: acarreo (no se pinta): en la zona 3 sala 0 con 0xCAC9, en la zona 4 sala 0x0E con 0xCACD; con lo elegido 3, nunca
	ret c			;a12e   ; acarreo: no se pinta
	ld a,(ix+000h)		;a12f   ; tipo 3 o 4
	sub 003h		;a132
	cp 002h		;a134
	ret nc			;a136
	and a			;a137
	ld hl,0a16dh		;a138   ; tipo 3: las X de p15:A16D
	jr z,piezas_de_puerta		;a13b
	ld hl,0a174h		;a13d   ; tipo 4: las de p15:A174
piezas_de_puerta:		; DE = (X de 8 en 8, Y) y 7 piezas
	ld e,(ix+002h)		;a140   ; E = su Y
	ld a,(ix+003h)		;a143   ; D = su X de 8 en 8
	and 0f8h		;a146
	ld d,a			;a148
	ld b,007h		;a149   ; 7 piezas
pieza_de_puerta:
	push hl			;a14b
	push de			;a14c
	push bc			;a14d
	ld h,(hl)			;a14e   ; de (X de la lista, 0x78)...
	ld l,078h		;a14f
	ld bc,00808h		;a151   ; ...8 x 8
	ld a,(0ca42h)		;a154   ; en la otra pagina...
	xor 001h		;a157
	rlca			;a159
	rlca			;a15a
	rlca			;a15b
	rlca			;a15c
	or 0c8h		;a15d   ; ...con la operacion 0xC8
	call 047edh		;a15f   ; copia_rectangulo_logica: orden LMMM del VDP con la operacion logica de A
	pop bc			;a162
	pop de			;a163
	pop hl			;a164
	inc hl			;a165   ; la X siguiente de la lista
	ld a,e			;a166   ; 8 mas abajo
	add a,008h		;a167
	ld e,a			;a169
	djnz pieza_de_puerta		;a16a   ; 7
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


puerta_no_se_pinta:		; acarreo (no se pinta): en la zona 3 sala 0 con 0xCAC9, en la zona 4 sala 0x0E con 0xCACD; con lo elegido 3, nunca
	ld a,(0cb21h)		;a17b   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	cp 003h		;a17e   ; con lo elegido 3, se pinta
	jr z,puerta_se_pinta		;a180
	ld a,(0ca4bh)		;a182   ; lee la sala de la zona
	ld b,a			;a185
	ld a,(0ca4ah)		;a186   ; lee la zona
	sub 003h		;a189   ; la zona 3...
	jr z,zona_3_sala_0		;a18b
	dec a			;a18d   ; ...o la 4...
	jr nz,puerta_se_pinta		;a18e
	ld a,b			;a190   ; ...sala 0x0E...
	cp 00eh		;a191
	jr nz,puerta_se_pinta		;a193
	ld a,(0cacdh)		;a195   ; ...con 0xCACD: acarreo
	and a			;a198
	ret z			;a199
	scf			;a19a
	ret			;a19b
zona_3_sala_0:		; en la zona 3, la sala 0 con 0xCAC9: acarreo
	ld a,b			;a19c   ; sala 0...
	and a			;a19d
	ret nz			;a19e
	ld a,(0cac9h)		;a19f   ; ...con 0xCAC9: acarreo
	and a			;a1a2
	ret z			;a1a3
	scf			;a1a4
	ret			;a1a5
puerta_se_pinta:		; sin acarreo: se pinta
	or a			;a1a6   ; sin acarreo
	ret			;a1a7
alto_y_ancho:		; el alto (byte 7) y el ancho (byte 8) de su tipo, de la tabla de p15:A1B8
	ld a,(ix+000h)		;a1a8   ; por su tipo...
	ld hl,0a1b6h		;a1ab
	call 043f6h		;a1ae   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld (ix+007h),l		;a1b1   ; ...el alto...
	ld (ix+008h),h		;a1b4   ; ...y el ancho
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


baja_cuentas_d580:		; las 0x80 cuentas de 0xD580 uno menos (las de 0 y las de 0xFF no)
	ld hl,0d580h		;a1e2   ; apunta a 0x80 cuentas de las puertas por su numero: 0 cerrada, 0xFF siempre abierta; si no, cuantas entradas de sala le quedan abierta (p15:ACDE, p15:A1E2)
	ld b,080h		;a1e5   ; 0x80 cuentas
cuenta_d580:
	ld a,(hl)			;a1e7
	and a			;a1e8
	jr z,cuenta_d580_siguiente		;a1e9   ; 0, nada
	inc a			;a1eb
	jr z,cuenta_d580_siguiente		;a1ec   ; 0xFF, nada
	dec (hl)			;a1ee   ; uno menos
cuenta_d580_siguiente:
	inc hl			;a1ef
	djnz cuenta_d580		;a1f0
	ret			;a1f2
pinta_puerta_abierta:		; por su tipo (tabla p15:A1FA)
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


pinta_abierta_0d:		; las 4 filas de 3 piezas (p01:7D66) en su sitio, con la pagina de dibujar cambiada a la otra mientras
	ld hl,0ca42h		;a224   ; apunta a la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	ld a,(hl)			;a227
	push hl			;a228
	push af			;a229
	xor 001h		;a22a   ; la otra pagina...
	ld (hl),a			;a22c
	call sitio_de_puerta		;a22d   ; ...su sitio a DE
	ex de,hl			;a230
	call 07d66h		;a231   ; copia_7d95_a_3: 4 filas de 3 caracteres de 8 x 8 de la pagina de dibujar (X de la lista de p01:7D95, Y = 0x78; 0xFF: X = 0, Y = 0x60) a la pagina 3
	pop af			;a234
	pop hl			;a235
	ld (hl),a			;a236   ; la pagina de antes
	ret			;a237
pinta_abierta:		; su rectangulo (alto x ancho) a 0xFF en la otra pagina (p15:A255) y sus casillas del mapa libres (p15:A241)
	ld c,(ix+007h)		;a238   ; C = el alto, B = el ancho
	ld b,(ix+008h)		;a23b
	call puerta_a_ff		;a23e   ; puerta_a_ff: BC desde su sitio a 0xFF en la otra pagina
casillas_de_puerta:		; las casillas del mapa de la puerta (p15:A890): ancho / 8 desde la Y + el alto - 0x10
	call sitio_de_puerta		;a241   ; sitio_de_puerta: HL = su sitio: L = la Y (byte 2), H = la X (byte 3)
	ld a,(ix+008h)		;a244   ; B = el ancho / 8
	rrca			;a247
	rrca			;a248
	rrca			;a249
	and 01fh		;a24a
	ld b,a			;a24c
	ld a,(ix+007h)		;a24d   ; A = el alto - 8
	sub 008h		;a250
	jp casillas_de_puerta_a		;a252   ; casillas_de_puerta_a: B casillas en dos filas del mapa desde (H, L + A - 8): 0x80 (cerradas) en el estado 4, 0 en los demas; con el byte 9, 0xCB3C = 0
puerta_a_ff:		; BC desde su sitio a 0xFF en la otra pagina
	call sitio_de_puerta		;a255   ; sitio_de_puerta: HL = su sitio: L = la Y (byte 2), H = la X (byte 3)
rellena_otra_ff:		; BC desde HL a 0xFF en la otra pagina (p00:46FF)
	ld a,(0ca42h)		;a258   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	xor 001h		;a25b   ; la otra pagina
	ld d,a			;a25d
	ld a,0ffh		;a25e   ; color 0xFF
	jp 046ffh		;a260   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
sitio_de_puerta:		; HL = su sitio: L = la Y (byte 2), H = la X (byte 3)
	ld l,(ix+002h)		;a263
	ld h,(ix+003h)		;a266
	ret			;a269
pinta_abierta_3:		; las 8 rayas hacia la derecha (p15:A276, E = 1) y sus casillas del mapa desde su X (p15:A6EB)
	ld e,001h		;a26a   ; de 1 en 1 hacia la derecha
	call rayas_de_a2a5		;a26c   ; rayas_de_a2a5: 8 rayas verticales de color 0x0F en la otra pagina desde su sitio, con los largos de p15:A2A5 (del ultimo al primero), cada una E mas a la X y, desde la tercera, 4 mas abajo
	call sitio_de_puerta		;a26f   ; sitio_de_puerta: HL = su sitio: L = la Y (byte 2), H = la X (byte 3)
	xor a			;a272
	jp casillas_de_lado		;a273   ; casillas_de_lado: 3 casillas en columna del mapa a 0 desde (X + A, Y + 0x20); con el byte 9, 0xCB3C = 0 (p15:A8A6)
rayas_de_a2a5:		; 8 rayas verticales de color 0x0F en la otra pagina desde su sitio, con los largos de p15:A2A5 (del ultimo al primero), cada una E mas a la X y, desde la tercera, 4 mas abajo
	call sitio_de_puerta		;a276   ; sitio_de_puerta: HL = su sitio: L = la Y (byte 2), H = la X (byte 3)
	ld c,00fh		;a279   ; color 0x0F
	ld d,008h		;a27b   ; 8 rayas
raya_de_a2a5:
	push hl			;a27d
	push de			;a27e
	push bc			;a27f
	ld a,d			;a280   ; su largo de p15:A2A5
	dec a			;a281
	ld de,0a2a5h		;a282
	call 04243h		;a285   ; suma_a_de: DE = DE + A
	ld a,(de)			;a288
	ld b,a			;a289
	ld a,(0ca42h)		;a28a   ; en la otra pagina
	xor 001h		;a28d
	call 04680h		;a28f   ; linea_vertical: orden LINE del VDP con el lado largo en Y (ARG = 1)
	pop bc			;a292
	pop de			;a293
	pop hl			;a294
	ld a,h			;a295   ; la X + E
	add a,e			;a296
	ld h,a			;a297
	ld a,d			;a298   ; las dos primeras a la misma Y...
	cp 007h		;a299
	jr nc,raya_siguiente_a2a5		;a29b
	inc l			;a29d   ; ...las demas, 4 mas abajo
	inc l			;a29e
	inc l			;a29f
	inc l			;a2a0
raya_siguiente_a2a5:		; la raya siguiente, hasta 8
	dec d			;a2a1   ; 8 rayas
	jr nz,raya_de_a2a5		;a2a2
tipo_sin_nada:		; nada (los tipos 0x0E y 0x14)
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


pinta_abierta_4:		; las 8 rayas hacia la izquierda (E = -1) y sus casillas desde la X - 1
	ld e,0ffh		;a2ad   ; de 1 en 1 hacia la izquierda
	call rayas_de_a2a5		;a2af   ; rayas_de_a2a5: 8 rayas verticales de color 0x0F en la otra pagina desde su sitio, con los largos de p15:A2A5 (del ultimo al primero), cada una E mas a la X y, desde la tercera, 4 mas abajo
	call sitio_de_puerta		;a2b2   ; sitio_de_puerta: HL = su sitio: L = la Y (byte 2), H = la X (byte 3)
	ld a,0ffh		;a2b5
	jp casillas_de_lado		;a2b7   ; casillas_de_lado: 3 casillas en columna del mapa a 0 desde (X + A, Y + 0x20); con el byte 9, 0xCB3C = 0 (p15:A8A6)
pinta_abierta_7:		; 4 rayas horizontales de color 0x0F desde (X + 3, Y), de 0x11 y 2 mas cada una, una mas abajo y una a la izquierda; luego (alto - 3) x ancho desde (X, Y + 3) a 0xFF y sus casillas
	call sitio_de_puerta		;a2ba   ; desde la X + 3
	ld a,h			;a2bd
	add a,003h		;a2be
	ld h,a			;a2c0
	ld bc,0110fh		;a2c1   ; 0x11 de largo, color 0x0F
	ld d,004h		;a2c4   ; 4 rayas
	ld a,(0ca42h)		;a2c6   ; en la otra pagina
	xor 001h		;a2c9
raya_tipo_7:
	call 046e6h		;a2cb   ; linea_horizontal_guarda: p00:467C guardando AF, HL, DE y BC
	inc l			;a2ce   ; una mas abajo...
	dec h			;a2cf   ; ...una a la izquierda...
	inc b			;a2d0   ; ...2 mas larga
	inc b			;a2d1
	dec d			;a2d2
	jr nz,raya_tipo_7		;a2d3
	ld a,(ix+007h)		;a2d5   ; C = el alto - 3...
	sub 003h		;a2d8
	ld c,a			;a2da
	ld b,(ix+008h)		;a2db   ; ...B = el ancho
	call sitio_de_puerta		;a2de   ; sitio_de_puerta: HL = su sitio: L = la Y (byte 2), H = la X (byte 3)
	ld a,l			;a2e1   ; desde la Y + 3
	add a,003h		;a2e2
	ld l,a			;a2e4
	call rellena_otra_ff		;a2e5   ; a 0xFF
	jp casillas_de_puerta		;a2e8   ; y sus casillas
abre_las_fijas:		; 0xD580 a cero y las que estan siempre abiertas (0xFF): zona 2 las 4 y 1, zona 3 las 4 y 0x25, zona 5 las 0x0E y 0x1B
	ld hl,0d580h		;a2eb   ; las 0x80 cuentas a 0
	ld bc,0007fh		;a2ee
	call 04236h		;a2f1   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	ld a,(0ca4ah)		;a2f4   ; zona 2: la 4 y la 1
	cp 002h		;a2f7
	ld hl,0d584h		;a2f9
	ld de,0d581h		;a2fc
	jr z,abre_dos		;a2ff
	cp 003h		;a301   ; zona 3: la 4 y la 0x25
	ld de,0d5a5h		;a303
	jr z,abre_dos		;a306
	cp 005h		;a308   ; zona 5: la 0x0E y la 0x1B
	ld hl,0d58eh		;a30a
	ld de,0d59bh		;a30d
	ret nz			;a310   ; las demas, ninguna
abre_dos:		; las cuentas de HL y DE a 0xFF
	ld a,0ffh		;a311   ; las dos a 0xFF
	ld (hl),a			;a313
	ld (de),a			;a314
	ret			;a315
puertas_cada_cuadro:		; sin 0xD4E9 ni salida de la sala: cada puerta activa por su tipo (p15:A368); la primera que queda abriendose o cerrandose (estado 1 o 4) va a 0xCAE8 con 0xCAE7 = 1 y se deja
	ld a,(0d4e9h)		;a316
	and a			;a319
	ret nz			;a31a   ; con 0xD4E9, nada
	ld a,(0ca41h)		;a31b   ; lee la salida de la sala (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	and a			;a31e
	ret nz			;a31f   ; saliendo de la sala, nada
	ld ix,0d500h		;a320   ; apunta a 8 fichas de puerta de 16 bytes [tipo][estado][Y][X][pide][numero][paso][alto][ancho][abre][cuenta] (p15:A04C; el choque en p07:BC95)
	ld bc,00800h		;a324   ; 8 fichas
puerta_cada_cuadro:		; la ficha por su tipo; si queda en el estado 1 o 4, se deja
	ld a,(ix+000h)		;a327   ; el tipo: 0, libre
	and a			;a32a
	jr z,puerta_siguiente_cuadro		;a32b
	push bc			;a32d
	push ix		;a32e
	call puerta_por_tipo		;a330   ; por su tipo
	pop ix		;a333
	pop bc			;a335
	ld a,(ix+001h)		;a336   ; en el estado 1...
	dec a			;a339
	jr z,puerta_en_marcha		;a33a
	cp 003h		;a33c   ; ...o 4: se queda
	jr z,puerta_en_marcha		;a33e
puerta_siguiente_cuadro:		; la ficha siguiente (16 bytes), hasta 8
	ld de,00010h		;a340   ; la ficha siguiente
	add ix,de		;a343
	djnz puerta_cada_cuadro		;a345   ; 8
	ret			;a347
puerta_en_marcha:		; 0xCAE7 = 1 y la ficha en 0xCAE8
	ld a,001h		;a348   ; 0xCAE7 = 1...
	ld (0cae7h),a		;a34a   ; guarda 1 mientras una puerta se abre o se cierra (p15:A348; p01:75F6)
	push ix		;a34d   ; ...y la ficha en 0xCAE8
	pop hl			;a34f
	ld (0cae8h),hl		;a350   ; guarda la ficha de 0xD500 de la puerta que se mueve (p15:A350) y el byte siguiente (16 bits)
	ret			;a353
sigue_puerta_en_marcha:		; la puerta de 0xCAE8 por su tipo (p15:A368); fuera del estado 1 o 4, 0xCAE7 = 0
	ld ix,(0cae8h)		;a354   ; lee la ficha de 0xD500 de la puerta que se mueve (p15:A350) y el byte siguiente (16 bits)
	call puerta_por_tipo		;a358   ; por su tipo
	ld a,(ix+001h)		;a35b   ; en el estado 1...
	dec a			;a35e
	ret z			;a35f
	cp 003h		;a360   ; ...o 4, sigue
	ret z			;a362
	xor a			;a363   ; si no, 0xCAE7 = 0
	ld (0cae7h),a		;a364   ; guarda 1 mientras una puerta se abre o se cierra (p15:A348; p01:75F6)
	ret			;a367
puerta_por_tipo:		; salta por su tipo (tabla p15:A36F)
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


lo_que_pide:		; acarreo si se abre: sin 0xCB4B y sin nada que pedir (byte 4 = 0) o con lo elegido (0xCB21) que sirve: 0x11, 0x12 y 0x13 abren las 1-3, 4-6 y 7-9; 0x14-0x1C, una de la 1 a la 9
	ld a,(0cb4bh)		;a399   ; lee con el puesto, la vida baja un punto cada 16 cuadros
	and a			;a39c
	ret nz			;a39d   ; con 0xCB4B, no
	ld a,(ix+004h)		;a39e   ; C = lo que pide
	ld c,a			;a3a1
	and a			;a3a2   ; nada: se abre
	jr nz,mira_lo_elegido		;a3a3
	scf			;a3a5
	ret			;a3a6
mira_lo_elegido:		; con lo elegido 0x11-0x1C
	ld a,(0cb21h)		;a3a7   ; lo elegido - 0x11...
	sub 011h		;a3aa
	cp 00ch		;a3ac   ; ...de 0 a 0x0B, si no, no
	ret nc			;a3ae
	cp 003h		;a3af   ; 0x11-0x13: de tres en tres
	jr c,sirve_de_tres		;a3b1
	sub 002h		;a3b3   ; 0x14-0x1C: 1-9...
	cp c			;a3b5   ; ...justo lo que pide: acarreo
	jr nz,no_sirve		;a3b6
	scf			;a3b8
	ret			;a3b9
no_sirve:		; sin acarreo: no se abre
	or a			;a3ba   ; sin acarreo
	ret			;a3bb
sirve_de_tres:		; (n + 1) * 3 - lo que pide...
	inc a			;a3bc
	ld b,a			;a3bd
	add a,a			;a3be
	add a,b			;a3bf
	sub c			;a3c0
	cp 003h		;a3c1   ; ...acarreo si da 0-2: lo que pide es 3n+1 a 3n+3
	ret			;a3c3
tipo_0d:		; por su estado (tabla p15:A3CA)
	ld a,(ix+001h)		;a3c4
	call 0424dh		;a3c7   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_A3CA: 4 destinos del despachador p00:424D (call en p15:A3C7, el
;   indice en A): A3D2, A40F, A4F4, A9AB; lo leen p15:A3C7 (8 bytes)
;   0xa3ca..0xa3d2  (8 bytes)
DATA_tabla_A3CA:
	defw 0a3d2h,0a40fh,0a4f4h,0a9abh	; a3ca  -> tipo_0d_cerrada tipo_0d_abierta pasa_tipo_1 cruza_puerta

; ======================================================================
; CODIGO 0xa3d2..0xa422  (80 bytes)
; ======================================================================


tipo_0d_cerrada:		; si Snake entra (p15:A44B): la de numero 0x1A en la zona 4 (4 en las demas) pide lo elegido 0x10 con 0xCA89 = 4 (0 fuera de la zona 4, y entonces fuera el bit 0 de 0xD7DD); se abre: su cuenta (p15:ACDE) y el estado siguiente (p15:A887)
	call snake_entra		;a3d2   ; snake_entra: acarreo si Snake entra por ella: con el byte 9, siempre; si no, sin el estado 2 de Snake, empujando hacia arriba (p15:A514), con lo que pide (p15:A399) y dentro de su caja: la Y de Snake - Y - alto por debajo de 0x0A (0x0E en el tipo 0x0A) y su X - X - 4 por debajo del ancho - 8
	ret nc			;a3d5   ; Snake no entra: nada
	ld a,(0ca4ah)		;a3d6   ; en la zona 4, la 0x1A...
	ld b,01ah		;a3d9
	cp 004h		;a3db
	jr z,tipo_0d_numero		;a3dd
	ld b,004h		;a3df   ; ...en las demas, la 4
tipo_0d_numero:
	ld a,(ix+005h)		;a3e1
	cp b			;a3e4
	jr nz,tipo_0d_abre		;a3e5   ; las demas se abren
	ld a,(0cb21h)		;a3e7   ; con lo elegido 0x10...
	cp 010h		;a3ea
	ret nz			;a3ec
	ld a,(0ca4ah)		;a3ed   ; ...y 0xCA89 = 4 en la zona 4...
	cp 004h		;a3f0
	ld b,004h		;a3f2
	jr z,tipo_0d_mira_ca89		;a3f4
	ld b,000h		;a3f6   ; ...o 0 en las demas
tipo_0d_mira_ca89:
	ld a,(0ca89h)		;a3f8   ; lee 0-4: lo de la cosa 0x10 (p11:BB49; su dibujo en p11:BBEB)
	cp b			;a3fb
	ret nz			;a3fc
	ld a,b			;a3fd   ; con 0: fuera el bit 0 de 0xD7DD
	and a			;a3fe
	jr nz,tipo_0d_abre		;a3ff
	ld hl,0d7ddh		;a401
	res 0,(hl)		;a404
tipo_0d_abre:		; su cuenta en 0xD580...
	ld a,(ix+005h)		;a406
	call cuenta_de_puerta		;a409   ; cuenta_de_puerta: la cuenta en 0xD580 de la puerta A (con el bit 7, nada): en la lista de la zona (p15:B153, 0xFF al final), 0xFF (siempre) si alli lleva el bit 7 o 4; fuera de la lista, 1
	jp estado_siguiente		;a40c   ; ...y el estado siguiente
tipo_0d_abierta:		; las 4 filas de 3 piezas (p01:7D66) en su sitio, el sonido 0x46 y sus casillas (p15:A85F)
	call sitio_de_puerta		;a40f   ; sitio_de_puerta: HL = su sitio: L = la Y (byte 2), H = la X (byte 3)
	ex de,hl			;a412
	call 07d66h		;a413   ; copia_7d95_a_3: 4 filas de 3 caracteres de 8 x 8 de la pagina de dibujar (X de la lista de p01:7D95, Y = 0x78; 0xFF: X = 0, Y = 0x60) a la pagina 3
	call 06c33h		;a416   ; el sonido 0x46
	jp casillas_y_estado		;a419   ; casillas_y_estado: sus casillas (ancho / 8 desde la Y + el alto - 0x0C, p15:A86D) y el estado siguiente; acabando de cerrar (estado 4): el estado 0 en los tipos 0x0B, 0x0C y 0x13
tipo_1:		; por su estado (tabla p15:A422): los tipos 1, 9-0x0C, 0x13 y 0x15
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


tipo_1_cerrada:		; si Snake entra (p15:A44B): la cuenta de 0x14 (byte 0x0A), se abre (p15:A5C6) y su rectangulo se guarda en (0xC8, 0xD8) de la pagina 0
	call snake_entra		;a42c   ; snake_entra: acarreo si Snake entra por ella: con el byte 9, siempre; si no, sin el estado 2 de Snake, empujando hacia arriba (p15:A514), con lo que pide (p15:A399) y dentro de su caja: la Y de Snake - Y - alto por debajo de 0x0A (0x0E en el tipo 0x0A) y su X - X - 4 por debajo del ancho - 8
	ret nc			;a42f   ; Snake no entra: nada
	ld (ix+00ah),014h		;a430   ; la cuenta 0x14
	call se_abre		;a434   ; se abre
	call sitio_de_puerta		;a437   ; desde su sitio...
	ld c,(ix+007h)		;a43a   ; ...alto x ancho...
	ld b,(ix+008h)		;a43d
	ld de,0c8d8h		;a440   ; ...a (0xC8, 0xD8)
copia_a_la_0:		; BC de HL a DE, de la pagina de dibujar a la 0 (p00:4767)
	ld a,(0ca42h)		;a443   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	and 003h		;a446
	jp 04767h		;a448   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
snake_entra:		; acarreo si Snake entra por ella: con el byte 9, siempre; si no, sin el estado 2 de Snake, empujando hacia arriba (p15:A514), con lo que pide (p15:A399) y dentro de su caja: la Y de Snake - Y - alto por debajo de 0x0A (0x0E en el tipo 0x0A) y su X - X - 4 por debajo del ancho - 8
	ld a,(ix+009h)		;a44b   ; con el byte 9: acarreo
	and a			;a44e
	scf			;a44f
	ret nz			;a450
	ld a,(0cb31h)		;a451   ; en el estado 2 de Snake, no
	and a			;a454
	ret nz			;a455
	call lo_que_pide		;a456   ; sin lo que pide, no
	ret nc			;a459
	call empuja_arriba		;a45a   ; sin empujar hacia arriba, no
	ret nz			;a45d
	call sitio_de_puerta		;a45e   ; sitio_de_puerta: HL = su sitio: L = la Y (byte 2), H = la X (byte 3)
	ld a,(ix+000h)		;a461   ; 0x0A de fondo...
	cp 00ah		;a464
	ld b,00ah		;a466
	jr nz,L_A46C		;a468
	ld b,00eh		;a46a   ; ...0x0E en el tipo 0x0A
L_A46C:
	ld a,(0cb03h)		;a46c   ; la Y de Snake - Y - alto
	sub l			;a46f
	sub (ix+007h)		;a470
	cp b			;a473
	ret nc			;a474
	ld a,(ix+008h)		;a475   ; el ancho - 8
	sub 008h		;a478
	ld b,a			;a47a
	ld a,(0cb05h)		;a47b   ; la X de Snake - X - 4
	sub h			;a47e
	sub 004h		;a47f
	cp b			;a481
	ret			;a482
cerrando_tipo_1:		; sin 0xC697, el paso (p15:A488)
	ld a,(0c697h)		;a483
	and a			;a486   ; con 0xC697, espera
	ret nz			;a487
desliza_tipo_1:		; un paso mas (byte 6, de 2 en 2 hasta el ancho; luego p15:A85F): lo guardado en (0xC6, 0xD8) se pinta con la operacion 0 corrido 2 * paso (0x18 - eso cerrando, estado 4), del ancho que queda
	ld a,(ix+006h)		;a488   ; 2 * el paso
	add a,a			;a48b
	ld b,a			;a48c
	cp (ix+008h)		;a48d   ; hasta el ancho: se acaba
	jp nc,casillas_y_estado		;a490   ; casillas_y_estado: sus casillas (ancho / 8 desde la Y + el alto - 0x0C, p15:A86D) y el estado siguiente; acabando de cerrar (estado 4): el estado 0 en los tipos 0x0B, 0x0C y 0x13
	inc (ix+006h)		;a493   ; uno mas
	ld a,(ix+001h)		;a496   ; en el estado 4 (cerrando)...
	cp 004h		;a499
	ld a,b			;a49b
	jr nz,L_A4A2		;a49c
	sub 018h		;a49e   ; ...0x18 - eso
	neg		;a4a0
L_A4A2:
	ld b,a			;a4a2
	ret z			;a4a3   ; 0: nada
	call sitio_de_puerta		;a4a4   ; a (X + eso, Y)...
	add a,h			;a4a7
	ld d,a			;a4a8
	ld e,l			;a4a9
	ld a,(ix+008h)		;a4aa   ; ...del ancho - eso...
	sub b			;a4ad
	ret z			;a4ae
	ret c			;a4af
	ld b,a			;a4b0
	ld c,(ix+007h)		;a4b1   ; ...por el alto...
	ld hl,0c6d8h		;a4b4   ; ...desde (0xC6, 0xD8)
	ld a,(0ca42h)		;a4b7   ; la pagina de dibujar (bits 4-5), operacion 0
	rrca			;a4ba
	rrca			;a4bb
	rrca			;a4bc
	rrca			;a4bd
	and 030h		;a4be
	jp 047edh		;a4c0   ; copia_rectangulo_logica: orden LMMM del VDP con la operacion logica de A
abierta_tipo_1:		; los tipos 0x0B y 0x0C (y el 0x13 sin alerta) bajan la cuenta del byte 0x0A: a 0, se cierran (paso 0, su dibujo de p15:A537, estado 4, su cuenta de 0xD580 a 0); si no, con Snake empujando dentro de la caja, el estado siguiente (pasa)
	ld a,(ix+000h)		;a4c3   ; 0x0B...
	cp 00bh		;a4c6
	jr z,cuenta_tipo_1		;a4c8
	cp 00ch		;a4ca   ; ...0x0C...
	jr z,cuenta_tipo_1		;a4cc
	cp 013h		;a4ce   ; ...o 0x13...
	jr nz,pasa_tipo_1		;a4d0
	ld a,(0ca5fh)		;a4d2   ; ...sin alerta
	and a			;a4d5
	jr nz,pasa_tipo_1		;a4d6
cuenta_tipo_1:		; la cuenta del byte 0x0A: a 0, se cierra
	dec (ix+00ah)		;a4d8   ; la cuenta: a 0...
	jr nz,pasa_tipo_1		;a4db
	ld (ix+006h),000h		;a4dd   ; ...el paso 0...
	call dibujo_tipo_1		;a4e1   ; ...su dibujo...
	ld (ix+001h),004h		;a4e4   ; ...el estado 4...
	ld a,(ix+005h)		;a4e8   ; ...y su cuenta de 0xD580 a 0
	ld hl,0d580h		;a4eb   ; apunta a 0x80 cuentas de las puertas por su numero: 0 cerrada, 0xFF siempre abierta; si no, cuantas entradas de sala le quedan abierta (p15:ACDE, p15:A1E2)
	call 0423eh		;a4ee   ; suma_a_hl: HL = HL + A
	ld (hl),000h		;a4f1
	ret			;a4f3
pasa_tipo_1:		; empujando hacia arriba...
	call empuja_arriba		;a4f4   ; empuja_arriba: Z si Snake va hacia arriba (0xCB0E = 1) con el mando hacia arriba (bit 0)
	ret nz			;a4f7
	call sitio_de_puerta		;a4f8   ; sitio_de_puerta: HL = su sitio: L = la Y (byte 2), H = la X (byte 3)
	ld a,(ix+007h)		;a4fb   ; ...dentro: la Y de Snake - Y - (alto - 8) por debajo de 0x0A...
	sub 008h		;a4fe
	ld b,a			;a500
	ld a,(0cb03h)		;a501   ; lee la Y de Snake
	sub l			;a504
	sub b			;a505
	cp 00ah		;a506
	ret nc			;a508
	ld a,(0cb05h)		;a509   ; ...y la X de Snake - X por debajo del ancho
	sub h			;a50c
	cp (ix+008h)		;a50d
	ret nc			;a510
	jp estado_siguiente		;a511   ; el estado siguiente
empuja_arriba:		; Z si Snake va hacia arriba (0xCB0E = 1) con el mando hacia arriba (bit 0)
	ld bc,00101h		;a514   ; B = la direccion, C = el bit del mando
empuja_hacia:		; Z si Snake va hacia B con el bit C del mando
	ld a,(0cb0eh)		;a517   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	sub b			;a51a   ; otra direccion: NZ
	ret nz			;a51b
	ld a,(0ca08h)		;a51c   ; el mando
	and c			;a51f
	jr z,no_empuja		;a520
	xor a			;a522   ; Z
	ret			;a523
no_empuja:		; NZ: no empuja
	ld a,001h		;a524   ; NZ
	and a			;a526
	ret			;a527
empuja_abajo:		; hacia abajo (2, bit 1)
	ld bc,00202h		;a528
	jr empuja_hacia		;a52b
empuja_izquierda:		; hacia la izquierda (3, bit 2)
	ld bc,00304h		;a52d
	jr empuja_hacia		;a530
empuja_derecha:		; hacia la derecha (4, bit 3)
	ld bc,00408h		;a532
	jr empuja_hacia		;a535
dibujo_tipo_1:		; con el banco 27: su dibujo de 4 x 4 piezas (p27:92B9 el tipo 0x0B, p27:92C9 el 0x0C, p15:A572 los demas) en (0xC0, 0xD8) de la pagina 0 por p00:4A19; vuelve a los bancos 1, 2 y 15
	call 04229h		;a537   ; bancos_27: pone el 27 en 0x8000 (con su copia en 0xC381-0xC383)
	ld a,(ix+000h)		;a53a   ; tipo 0x0B: p27:92B9
	cp 00bh		;a53d
	ld hl,092b9h		;a53f
	jr z,dibujo_de_4x4		;a542
	cp 00ch		;a544   ; tipo 0x0C: p27:92C9
	ld hl,092c9h		;a546
	jr z,dibujo_de_4x4		;a549
	ld hl,0a572h		;a54b   ; los demas: p15:A572
dibujo_de_4x4:		; 4 filas de 4 piezas desde (0xC0, 0xD8)
	ld bc,00404h		;a54e   ; 4 filas de 4
	ld a,002h		;a551   ; las paginas 2
	ld (0ca1bh),a		;a553   ; guarda las paginas de la copia de una letra o pieza (bits 0-1 origen, 2-3 destino)
	ld de,0c0d8h		;a556   ; desde (0xC0, 0xD8)
fila_de_dibujo:
	push de			;a559
	ld c,004h		;a55a
pieza_de_dibujo:		; una pieza a DE y 8 a la derecha
	ld a,(hl)			;a55c   ; la pieza...
	call 04a19h		;a55d   ; ...a DE
	ld a,d			;a560   ; 8 a la derecha
	add a,008h		;a561
	ld d,a			;a563
	inc hl			;a564
	dec c			;a565
	jr nz,pieza_de_dibujo		;a566
	pop de			;a568
	ld a,e			;a569   ; la fila siguiente, 8 mas abajo
	add a,008h		;a56a
	ld e,a			;a56c
	djnz fila_de_dibujo		;a56d
	jp 041f4h		;a56f   ; los bancos 1, 2 y 15

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


tipo_0e:		; por su estado (tabla p15:A588): los tipos 0x0E y 0x14
	ld a,(ix+001h)		;a582
	call 0424dh		;a585   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_A588: 4 destinos del despachador p00:424D (call en p15:A585, el
;   indice en A): A590, A628, A635, A9AB; lo leen p15:A585 (8 bytes)
;   0xa588..0xa590  (8 bytes)
DATA_tabla_A588:
	defw 0a590h,0a628h,0a635h,0a9abh	; a588  -> tipo_0e_cerrada abierta_tipo_2 pasa_tipo_2 cruza_puerta

; ======================================================================
; CODIGO 0xa590..0xa5a7  (23 bytes)
; ======================================================================


tipo_0e_cerrada:		; empujando hacia abajo dentro de la caja de abajo (p15:A5E6): su cuenta (p15:ACDE) y el estado siguiente
	call empuja_abajo		;a590   ; empuja_abajo: hacia abajo (2, bit 1)
	ret nz			;a593
	call caja_de_abajo		;a594   ; dentro?
	ret nc			;a597
	ld a,(ix+005h)		;a598   ; su cuenta
	call cuenta_de_puerta		;a59b   ; cuenta_de_puerta: la cuenta en 0xD580 de la puerta A (con el bit 7, nada): en la lista de la zona (p15:B153, 0xFF al final), 0xFF (siempre) si alli lleva el bit 7 o 4; fuera de la lista, 1
	jp estado_siguiente		;a59e   ; estado_siguiente: el estado siguiente (byte 1 + 1)
tipo_2:		; por su estado (tabla p15:A5A7): los tipos 2, 0x0F y 0x10
	ld a,(ix+001h)		;a5a1
	call 0424dh		;a5a4   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_A5A7: 4 destinos del despachador p00:424D (call en p15:A5A4, el
;   indice en A): A5AF, A600, A635, A9AB; lo leen p15:A5A4 (8 bytes)
;   0xa5a7..0xa5af  (8 bytes)
DATA_tabla_A5A7:
	defw 0a5afh,0a600h,0a635h,0a9abh	; a5a7  -> tipo_2_cerrada abre_tipo_2 pasa_tipo_2 cruza_puerta

; ======================================================================
; CODIGO 0xa5af..0xa657  (168 bytes)
; ======================================================================


tipo_2_cerrada:		; con el byte 9, se abre; si no, sin el estado 2 de Snake, empujando hacia abajo, con lo que pide y dentro de la caja de abajo
	ld a,(ix+009h)		;a5af
	and a			;a5b2
	jr nz,se_abre		;a5b3   ; con el byte 9, se abre
	ld a,(0cb31h)		;a5b5   ; lee 1 en el estado 2 de Snake
	and a			;a5b8
	ret nz			;a5b9   ; en el estado 2 de Snake, no
	call empuja_abajo		;a5ba   ; empuja_abajo: hacia abajo (2, bit 1)
	ret nz			;a5bd
	call lo_que_pide		;a5be   ; lo_que_pide: acarreo si se abre: sin 0xCB4B y sin nada que pedir (byte 4 = 0) o con lo elegido (0xCB21) que sirve: 0x11, 0x12 y 0x13 abren las 1-3, 4-6 y 7-9; 0x14-0x1C, una de la 1 a la 9
	ret nc			;a5c1
	call caja_de_abajo		;a5c2   ; caja_de_abajo: acarreo si Snake esta bajo la puerta: su sitio - la Y de Snake por debajo de 8 y la X de Snake - X - 4 por debajo del ancho - 8
	ret nc			;a5c5
se_abre:		; su cuenta en 0xD580 (p15:ACDE), el paso y el byte 9 a 0, el rectangulo de (0xC0, 0xD4) de la pagina 0 a 0 (p15:A5DC), el estado siguiente y el sonido 0x16
	ld a,(ix+005h)		;a5c6   ; su cuenta
	call cuenta_de_puerta		;a5c9   ; cuenta_de_puerta: la cuenta en 0xD580 de la puerta A (con el bit 7, nada): en la lista de la zona (p15:B153, 0xFF al final), 0xFF (siempre) si alli lleva el bit 7 o 4; fuera de la lista, 1
	xor a			;a5cc   ; el paso y el byte 9 a 0
	ld (ix+006h),a		;a5cd
	ld (ix+009h),a		;a5d0
	call borra_lo_guardado		;a5d3   ; borra lo guardado
	call estado_siguiente		;a5d6   ; el estado siguiente
	jp 06a4ch		;a5d9   ; el sonido 0x16
borra_lo_guardado:		; 0x40 x 0x2C desde (0xC0, 0xD4) de la pagina 0 a 0
	ld hl,0c0d4h		;a5dc
	ld bc,0402ch		;a5df
	ld d,000h		;a5e2
	jr rectangulo_a_0		;a5e4
caja_de_abajo:		; acarreo si Snake esta bajo la puerta: su sitio - la Y de Snake por debajo de 8 y la X de Snake - X - 4 por debajo del ancho - 8
	call sitio_de_puerta		;a5e6   ; sitio_de_puerta: HL = su sitio: L = la Y (byte 2), H = la X (byte 3)
	ld a,(0cb03h)		;a5e9   ; su Y - la de Snake
	sub l			;a5ec
	neg		;a5ed
	cp 008h		;a5ef
	ret nc			;a5f1
	ld a,(ix+008h)		;a5f2   ; el ancho - 8
	sub 008h		;a5f5
	ld b,a			;a5f7
	ld a,(0cb05h)		;a5f8   ; la X de Snake - X - 4
	sub h			;a5fb
	sub 004h		;a5fc
	cp b			;a5fe
	ret			;a5ff
abre_tipo_2:		; el paso de 2 en 2 hasta el ancho (luego p15:A628): ancho del paso por alto a 0 desde su sitio
	ld a,(ix+006h)		;a600
	cp (ix+008h)		;a603   ; hasta el ancho...
	jr nc,abierta_tipo_2		;a606
	inc (ix+006h)		;a608   ; ...2 mas
	inc (ix+006h)		;a60b
	call sitio_de_puerta		;a60e   ; sitio_de_puerta: HL = su sitio: L = la Y (byte 2), H = la X (byte 3)
	ld a,(ix+006h)		;a611
hueco_a_0:		; B (ancho) x el alto desde HL a 0 en la pagina de dibujar (la 1 con la pantalla partida)
	ld b,a			;a614
	ld c,(ix+007h)		;a615   ; C = el alto
	ld a,(0ca1ch)		;a618   ; con la pantalla partida, la pagina 1
	and a			;a61b
	ld d,001h		;a61c
	jr nz,rectangulo_a_0		;a61e
	ld a,(0ca42h)		;a620   ; si no, la de dibujar
	ld d,a			;a623
rectangulo_a_0:		; BC desde HL a 0 en la pagina D
	xor a			;a624   ; color 0
	jp 046ffh		;a625   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
abierta_tipo_2:		; sus casillas libres (p15:A86D, desde su Y) y el estado siguiente
	ld a,(ix+008h)		;a628   ; B = el ancho / 8
	rrca			;a62b
	rrca			;a62c
	rrca			;a62d
	and 01fh		;a62e
	ld b,a			;a630
	xor a			;a631   ; desde su Y
	jp casillas_y_estado_a		;a632   ; casillas_y_estado_a: las casillas desde su sitio + A y el estado
pasa_tipo_2:		; empujando hacia abajo dentro de la caja (la Y de Snake - 2 - Y por debajo del alto, la X de Snake - X por debajo del ancho): el estado siguiente
	call empuja_abajo		;a635   ; empuja_abajo: hacia abajo (2, bit 1)
	ret nz			;a638
	call sitio_de_puerta		;a639   ; sitio_de_puerta: HL = su sitio: L = la Y (byte 2), H = la X (byte 3)
	ld a,(0cb03h)		;a63c   ; la Y de Snake - 2 - Y
	sub 002h		;a63f
	sub l			;a641
	cp (ix+007h)		;a642
	ret nc			;a645
	ld a,(0cb05h)		;a646   ; la X de Snake - X
	sub h			;a649
	cp (ix+008h)		;a64a
	ret nc			;a64d
	jp estado_siguiente		;a64e   ; el estado siguiente
tipo_3:		; por su estado (tabla p15:A657)
	ld a,(ix+001h)		;a651
	call 0424dh		;a654   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_A657: 4 destinos del despachador p00:424D (call en p15:A654, el
;   indice en A): A65F, A6B1, A702, A9AB; lo leen p15:A654 (8 bytes)
;   0xa657..0xa65f  (8 bytes)
DATA_tabla_A657:
	defw 0a65fh,0a6b1h,0a702h,0a9abh	; a657  -> tipo_3_cerrada baja_tipo_3 pasa_tipo_3 cruza_puerta

; ======================================================================
; CODIGO 0xa65f..0xa722  (195 bytes)
; ======================================================================


tipo_3_cerrada:		; con el byte 9, se abre; si no, sin el estado 2 de Snake, empujando hacia la izquierda, con lo que pide y dentro (la Y de Snake - Y - 0x20 por debajo de 0x20, la X de Snake - X - 0x0C por debajo de 8): se abre y sus 6 columnas de 1 x 0x20 (cada una 4 mas abajo) se guardan en (0xC8, 0xD8)
	ld a,(ix+009h)		;a65f
	and a			;a662
	jr nz,abre_tipo_3		;a663   ; con el byte 9, se abre
	ld a,(0cb31h)		;a665   ; lee 1 en el estado 2 de Snake
	and a			;a668
	ret nz			;a669   ; en el estado 2 de Snake, no
	call empuja_izquierda		;a66a   ; sin empujar hacia la izquierda, no
	ret nz			;a66d
	call lo_que_pide		;a66e   ; sin lo que pide, no
	ret nc			;a671
	call sitio_de_puerta		;a672   ; sitio_de_puerta: HL = su sitio: L = la Y (byte 2), H = la X (byte 3)
	ld a,(0cb03h)		;a675   ; la Y de Snake - Y - 0x20
	sub l			;a678
	sub 020h		;a679
	cp 020h		;a67b
	ret nc			;a67d
	ld a,(0cb05h)		;a67e   ; la X de Snake - X - 0x0C
	sub h			;a681
	sub 00ch		;a682
	cp 008h		;a684
	ret nc			;a686
abre_tipo_3:		; se abre y guarda sus 6 columnas
	call se_abre		;a687   ; se abre
	ld b,006h		;a68a   ; 6 columnas...
	ld de,0c8d8h		;a68c   ; ...a (0xC8, 0xD8)...
	call sitio_de_puerta		;a68f   ; ...desde la X + 1
	inc h			;a692
	ld a,(0ca42h)		;a693   ; de la pagina de dibujar
	and 003h		;a696
	rrca			;a698
	rrca			;a699
columna_tipo_3:
	push af			;a69a
	push bc			;a69b
	push de			;a69c
	push hl			;a69d
	ld bc,00120h		;a69e   ; 1 x 0x20
	call 047edh		;a6a1   ; copia_rectangulo_logica: orden LMMM del VDP con la operacion logica de A
	pop hl			;a6a4
	pop de			;a6a5
	pop bc			;a6a6
	pop af			;a6a7
	inc d			;a6a8   ; la siguiente: una a la derecha...
	inc h			;a6a9
	inc l			;a6aa   ; ...4 mas abajo
	inc l			;a6ab
	inc l			;a6ac
	inc l			;a6ad
	djnz columna_tipo_3		;a6ae   ; 6
	ret			;a6b0
baja_tipo_3:		; un paso (byte 6, hasta 0x10; luego p15:A6E1): las 6 columnas guardadas de (0xC8, 0xD6), 2 * paso mas abajo y otro tanto mas cortas
	ld a,(ix+006h)		;a6b1   ; 2 * el paso
	add a,a			;a6b4
	ld c,a			;a6b5
	cp 020h		;a6b6   ; hasta 0x20
	jr nc,acaba_tipo_3		;a6b8
	inc (ix+006h)		;a6ba   ; uno mas
	call sitio_de_puerta		;a6bd   ; a la X + 1...
	ld d,h			;a6c0
	inc d			;a6c1
	add a,l			;a6c2   ; ...y la Y + 2 * paso
	ld e,a			;a6c3
	ld hl,0c8d6h		;a6c4   ; desde (0xC8, 0xD6)
	ld b,006h		;a6c7   ; 6 columnas
columna_baja_3:
	push bc			;a6c9
	push de			;a6ca
	push hl			;a6cb
	ld b,001h		;a6cc   ; 1 de ancho...
	ld a,020h		;a6ce   ; ...0x20 - 2 * paso de alto
	sub c			;a6d0
	ld c,a			;a6d1
	call copia_a_la_de_dibujar		;a6d2   ; copia_a_la_de_dibujar: B x C de HL a DE con la operacion 0 (p00:47ED), la pagina de dibujar en los bits 4-5
	pop hl			;a6d5
	pop de			;a6d6
	pop bc			;a6d7
	inc h			;a6d8   ; la siguiente: una a la derecha...
	inc d			;a6d9
	inc e			;a6da   ; ...4 mas abajo
	inc e			;a6db
	inc e			;a6dc
	inc e			;a6dd
	djnz columna_baja_3		;a6de   ; 6
	ret			;a6e0
acaba_tipo_3:		; sus casillas libres desde su X (p15:A6EB) y el estado siguiente
	call sitio_de_puerta		;a6e1   ; sitio_de_puerta: HL = su sitio: L = la Y (byte 2), H = la X (byte 3)
	xor a			;a6e4
	call casillas_de_lado		;a6e5   ; casillas_de_lado: 3 casillas en columna del mapa a 0 desde (X + A, Y + 0x20); con el byte 9, 0xCB3C = 0 (p15:A8A6)
	jp estado_siguiente		;a6e8   ; estado_siguiente: el estado siguiente (byte 1 + 1)
casillas_de_lado:		; 3 casillas en columna del mapa a 0 desde (X + A, Y + 0x20); con el byte 9, 0xCB3C = 0 (p15:A8A6)
	add a,h			;a6eb   ; la X + A...
	ld h,a			;a6ec
	ld a,l			;a6ed   ; ...la Y + 0x20
	add a,020h		;a6ee
	ld l,a			;a6f0
	call 04411h		;a6f1   ; su casilla
	ld b,003h		;a6f4   ; 3
casilla_de_lado:		; una casilla a 0 y la fila siguiente
	ld (hl),000h		;a6f6   ; libre
	ld a,018h		;a6f8   ; la fila siguiente (0x18 casillas)
	call 0423eh		;a6fa   ; suma_a_hl: HL = HL + A
	djnz casilla_de_lado		;a6fd   ; 3
	jp byte_9_y_cb3c		;a6ff   ; byte_9_y_cb3c: con el byte 9, 0xCB3C = 0
pasa_tipo_3:		; empujando hacia la izquierda dentro (la Y de Snake - Y - 0x20 por debajo de 0x20, la X de Snake - X por debajo de 0x0F): el estado siguiente
	call empuja_izquierda		;a702   ; empuja_izquierda: hacia la izquierda (3, bit 2)
	ret nz			;a705
	call sitio_de_puerta		;a706   ; sitio_de_puerta: HL = su sitio: L = la Y (byte 2), H = la X (byte 3)
	ld a,(0cb03h)		;a709   ; la Y de Snake - Y - 0x20
	sub l			;a70c
	sub 020h		;a70d
	cp 020h		;a70f
	ret nc			;a711
	ld a,(0cb05h)		;a712   ; la X de Snake - X
	sub h			;a715
	cp 00fh		;a716
	ret nc			;a718
	jp estado_siguiente		;a719   ; el estado siguiente
tipo_4:		; por su estado (tabla p15:A722): el de p15:A651 de espejo
	ld a,(ix+001h)		;a71c
	call 0424dh		;a71f   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_A722: 4 destinos del despachador p00:424D (call en p15:A71F, el
;   indice en A): A72A, A77C, A7B8, A9AB; lo leen p15:A71F (8 bytes)
;   0xa722..0xa72a  (8 bytes)
DATA_tabla_A722:
	defw 0a72ah,0a77ch,0a7b8h,0a9abh	; a722  -> tipo_4_cerrada baja_tipo_4 pasa_tipo_4 cruza_puerta

; ======================================================================
; CODIGO 0xa72a..0xa7da  (176 bytes)
; ======================================================================


tipo_4_cerrada:		; como p15:A65F empujando hacia la derecha: la X de Snake - X + 0x10 por debajo de 8; las 6 columnas desde la X - 1 hacia la izquierda
	ld a,(ix+009h)		;a72a
	and a			;a72d
	jr nz,abre_tipo_4		;a72e   ; con el byte 9, se abre
	ld a,(0cb31h)		;a730   ; lee 1 en el estado 2 de Snake
	and a			;a733
	ret nz			;a734   ; en el estado 2 de Snake, no
	call empuja_derecha		;a735   ; sin empujar hacia la derecha, no
	ret nz			;a738
	call lo_que_pide		;a739   ; sin lo que pide, no
	ret nc			;a73c
	call sitio_de_puerta		;a73d   ; sitio_de_puerta: HL = su sitio: L = la Y (byte 2), H = la X (byte 3)
	ld a,(0cb03h)		;a740   ; la Y de Snake - Y - 0x20
	sub l			;a743
	sub 020h		;a744
	cp 020h		;a746
	ret nc			;a748
	ld a,(0cb05h)		;a749   ; la X de Snake - X + 0x10
	sub h			;a74c
	add a,010h		;a74d
	cp 008h		;a74f
	ret nc			;a751
abre_tipo_4:		; se abre y guarda sus 6 columnas hacia la izquierda
	call se_abre		;a752   ; se abre
	call sitio_de_puerta		;a755   ; desde la X - 1
	dec h			;a758
	ld a,(0ca42h)		;a759   ; de la pagina de dibujar
	and 003h		;a75c
	rrca			;a75e
	rrca			;a75f
	ld b,006h		;a760   ; 6 columnas a (0xC8, 0xD8)
	ld de,0c8d8h		;a762
columna_tipo_4:
	push af			;a765
	push bc			;a766
	push de			;a767
	push hl			;a768
	ld bc,00120h		;a769   ; 1 x 0x20
	call 047edh		;a76c   ; copia_rectangulo_logica: orden LMMM del VDP con la operacion logica de A
	pop hl			;a76f
	pop de			;a770
	pop bc			;a771
	pop af			;a772
	inc d			;a773   ; la siguiente: una a la izquierda...
	dec h			;a774
	inc l			;a775   ; ...4 mas abajo
	inc l			;a776
	inc l			;a777
	inc l			;a778
	djnz columna_tipo_4		;a779   ; 6
	ret			;a77b
baja_tipo_4:		; un paso como p15:A6B1, desde la X - 1 hacia la izquierda
	ld a,(ix+006h)		;a77c   ; 2 * el paso
	add a,a			;a77f
	ld c,a			;a780
	cp 020h		;a781   ; hasta 0x20
	jr nc,acaba_tipo_4		;a783
	inc (ix+006h)		;a785   ; uno mas
	call sitio_de_puerta		;a788   ; a la X - 1...
	ld d,h			;a78b
	dec d			;a78c
	add a,l			;a78d   ; ...y la Y + 2 * paso
	ld e,a			;a78e
	ld hl,0c8d6h		;a78f   ; desde (0xC8, 0xD6)
	ld b,006h		;a792
columna_baja_4:
	push bc			;a794
	push de			;a795
	push hl			;a796
	ld b,001h		;a797   ; 1 de ancho...
	ld a,020h		;a799   ; ...0x20 - 2 * paso de alto
	sub c			;a79b
	ld c,a			;a79c
	call copia_a_la_de_dibujar		;a79d   ; copia_a_la_de_dibujar: B x C de HL a DE con la operacion 0 (p00:47ED), la pagina de dibujar en los bits 4-5
	pop hl			;a7a0
	pop de			;a7a1
	pop bc			;a7a2
	inc h			;a7a3   ; la siguiente: una a la izquierda...
	dec d			;a7a4
	inc e			;a7a5   ; ...4 mas abajo
	inc e			;a7a6
	inc e			;a7a7
	inc e			;a7a8
	djnz columna_baja_4		;a7a9
	ret			;a7ab
acaba_tipo_4:		; sus casillas libres desde la X - 1 y el estado siguiente
	call sitio_de_puerta		;a7ac   ; sitio_de_puerta: HL = su sitio: L = la Y (byte 2), H = la X (byte 3)
	dec h			;a7af
	ld a,0ffh		;a7b0
	call casillas_de_lado		;a7b2   ; casillas_de_lado: 3 casillas en columna del mapa a 0 desde (X + A, Y + 0x20); con el byte 9, 0xCB3C = 0 (p15:A8A6)
	jp estado_siguiente		;a7b5   ; estado_siguiente: el estado siguiente (byte 1 + 1)
pasa_tipo_4:		; empujando hacia la derecha dentro (la Y de Snake - Y - 0x20 por debajo de 0x20, la X de Snake - X + 0x0C por debajo de 8): el estado siguiente
	call empuja_derecha		;a7b8   ; empuja_derecha: hacia la derecha (4, bit 3)
	ret nz			;a7bb
	call sitio_de_puerta		;a7bc   ; sitio_de_puerta: HL = su sitio: L = la Y (byte 2), H = la X (byte 3)
	ld a,(0cb03h)		;a7bf   ; la Y de Snake - Y - 0x20
	sub l			;a7c2
	sub 020h		;a7c3
	cp 020h		;a7c5
	ret nc			;a7c7
	ld a,(0cb05h)		;a7c8   ; la X de Snake - X + 0x0C
	sub h			;a7cb
	add a,00ch		;a7cc
	cp 008h		;a7ce
	ret nc			;a7d0
	jp estado_siguiente		;a7d1   ; el estado siguiente
tipo_5:		; por su estado (tabla p15:A7DA): los tipos 5, 0x11 y 0x12
	ld a,(ix+001h)		;a7d4
	call 0424dh		;a7d7   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_A7DA: 4 destinos del despachador p00:424D (call en p15:A7D7, el
;   indice en A): A7E2, A807, A4F4, A9AB; lo leen p15:A7D7 (8 bytes)
;   0xa7da..0xa7e2  (8 bytes)
DATA_tabla_A7DA:
	defw 0a7e2h,0a807h,0a4f4h,0a9abh	; a7da  -> tipo_5_cerrada abre_tipo_5 pasa_tipo_1 cruza_puerta

; ======================================================================
; CODIGO 0xa7e2..0xa8c5  (227 bytes)
; ======================================================================


tipo_5_cerrada:		; si Snake entra (p15:A44B): se abre y guarda sus mitades (p15:A7E9)
	call snake_entra		;a7e2   ; snake_entra: acarreo si Snake entra por ella: con el byte 9, siempre; si no, sin el estado 2 de Snake, empujando hacia arriba (p15:A514), con lo que pide (p15:A399) y dentro de su caja: la Y de Snake - Y - alto por debajo de 0x0A (0x0E en el tipo 0x0A) y su X - X - 4 por debajo del ancho - 8
	ret nc			;a7e5
	call se_abre		;a7e6   ; se_abre: su cuenta en 0xD580 (p15:ACDE), el paso y el byte 9 a 0, el rectangulo de (0xC0, 0xD4) de la pagina 0 a 0 (p15:A5DC), el estado siguiente y el sonido 0x16
guarda_mitades:		; la mitad izquierda (ancho / 2 x alto) a (0xC8, 0xD8) y la derecha a (0xE8, 0xD8), de la pagina de dibujar a la 0
	call sitio_de_puerta		;a7e9   ; sitio_de_puerta: HL = su sitio: L = la Y (byte 2), H = la X (byte 3)
	ld b,(ix+008h)		;a7ec   ; B = el ancho / 2
	srl b		;a7ef
	ld c,(ix+007h)		;a7f1   ; C = el alto
	push hl			;a7f4
	push bc			;a7f5
	ld de,0c8d8h		;a7f6   ; la izquierda a (0xC8, 0xD8)
	call copia_a_la_0		;a7f9   ; copia_a_la_0: BC de HL a DE, de la pagina de dibujar a la 0 (p00:4767)
	pop bc			;a7fc
	pop hl			;a7fd
	ld a,h			;a7fe   ; la X + el ancho / 2...
	add a,b			;a7ff
	ld h,a			;a800
	ld de,0e8d8h		;a801   ; ...a (0xE8, 0xD8)
	jp copia_a_la_0		;a804   ; copia_a_la_0: BC de HL a DE, de la pagina de dibujar a la 0 (p00:4767)
abre_tipo_5:		; un paso (byte 6, 2 * paso hasta el ancho / 2; luego p15:A85F): las dos mitades guardadas se apartan 2 * paso (p15:A822)
	ld a,(ix+008h)		;a807   ; C = el ancho / 2
	srl a		;a80a
	ld c,a			;a80c
	ld a,(ix+006h)		;a80d   ; B = 2 * el paso
	add a,a			;a810
	ld b,a			;a811
	cp c			;a812   ; hasta la mitad
	jr nc,casillas_y_estado		;a813
	inc (ix+006h)		;a815   ; uno mas
	ld h,0d8h		;a818   ; la Y de lo guardado 0xD8...
	ld l,(ix+007h)		;a81a   ; ...el alto...
	ld e,(ix+002h)		;a81d   ; ...a su Y
	ld a,0cah		;a820   ; la izquierda desde la X 0xCA
mitades_apartadas:		; las dos mitades guardadas apartadas B (C la mitad): la derecha desde (0xE6, L) a la X + C + B, la izquierda desde (A + B, L) a la X, cada una de C - B de ancho y H de alto (H, L y A pasan por 0xD8E0-0xD8E2)
	ld (0d8e0h),hl		;a822   ; el alto y la Y de lo guardado
	ld (0d8e2h),a		;a825   ; la X de la izquierda guardada
	ld d,(ix+003h)		;a828   ; su X
	push de			;a82b
	push bc			;a82c
	ld a,d			;a82d   ; la derecha a la X + C + B...
	add a,c			;a82e
	add a,b			;a82f
	ld d,a			;a830
	ld a,(0d8e2h)		;a831   ; ...desde la X 0xE6...
	rra			;a834
	ld h,0e6h		;a835
	jr nc,L_A83A		;a837
	inc h			;a839
L_A83A:
	ld a,(0d8e1h)		;a83a   ; ...y la Y guardada
	ld l,a			;a83d
	call mitad_apartada		;a83e   ; la copia
	pop bc			;a841
	pop de			;a842
	ld a,(0d8e1h)		;a843   ; la izquierda desde la Y guardada...
	ld l,a			;a846
	ld a,(0d8e2h)		;a847   ; ...y la X guardada + B
	add a,b			;a84a
	ld h,a			;a84b
mitad_apartada:		; B = C - B de ancho, C = el alto (0xD8E0); la copia
	ld a,c			;a84c   ; C - B de ancho...
	sub b			;a84d
	ld b,a			;a84e
	ld a,(0d8e0h)		;a84f   ; ...y el alto
	ld c,a			;a852
copia_a_la_de_dibujar:		; B x C de HL a DE con la operacion 0 (p00:47ED), la pagina de dibujar en los bits 4-5
	ld a,(0ca42h)		;a853   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	and 003h		;a856
	rlca			;a858
	rlca			;a859
	rlca			;a85a
	rlca			;a85b
	jp 047edh		;a85c   ; copia_rectangulo_logica: orden LMMM del VDP con la operacion logica de A
casillas_y_estado:		; sus casillas (ancho / 8 desde la Y + el alto - 0x0C, p15:A86D) y el estado siguiente; acabando de cerrar (estado 4): el estado 0 en los tipos 0x0B, 0x0C y 0x13
	ld a,(ix+008h)		;a85f   ; B = el ancho / 8
	rrca			;a862
	rrca			;a863
	rrca			;a864
	and 01fh		;a865
	ld b,a			;a867
	ld a,(ix+007h)		;a868   ; A = el alto - 4
	sub 004h		;a86b
casillas_y_estado_a:		; las casillas desde su sitio + A y el estado
	call sitio_de_puerta		;a86d   ; desde su sitio + A
	call casillas_de_puerta_a		;a870   ; casillas_de_puerta_a: B casillas en dos filas del mapa desde (H, L + A - 8): 0x80 (cerradas) en el estado 4, 0 en los demas; con el byte 9, 0xCB3C = 0
	ld a,(ix+001h)		;a873   ; cerrando (estado 4)...
	cp 004h		;a876
	jr nz,estado_siguiente		;a878
	ld a,(ix+000h)		;a87a   ; ...el tipo 0x13...
	cp 013h		;a87d
	jr z,estado_0		;a87f
	sub 00bh		;a881   ; ...o 0x0B-0x0C: el estado 0
	cp 002h		;a883
	jr c,estado_0		;a885
estado_siguiente:		; el estado siguiente (byte 1 + 1)
	inc (ix+001h)		;a887   ; un estado mas
	ret			;a88a
estado_0:		; vuelve al estado 0
	ld (ix+001h),000h		;a88b   ; el estado 0
	ret			;a88f
casillas_de_puerta_a:		; B casillas en dos filas del mapa desde (H, L + A - 8): 0x80 (cerradas) en el estado 4, 0 en los demas; con el byte 9, 0xCB3C = 0
	add a,l			;a890   ; la Y + A - 8
	sub 008h		;a891
	ld l,a			;a893
	call 04411h		;a894   ; su casilla
	push hl			;a897
	push bc			;a898
	call fila_de_casillas		;a899   ; la fila...
	pop bc			;a89c
	pop hl			;a89d
	ld a,018h		;a89e   ; ...y la de debajo (0x18 casillas)
	call 0423eh		;a8a0   ; suma_a_hl: HL = HL + A
	call fila_de_casillas		;a8a3   ; fila_de_casillas: B casillas: 0x80 en el estado 4, si no 0
byte_9_y_cb3c:		; con el byte 9, 0xCB3C = 0
	ld a,(ix+009h)		;a8a6   ; con el byte 9...
	and a			;a8a9
	ret z			;a8aa
	xor a			;a8ab   ; ...0xCB3C = 0
	ld (0cb3ch),a		;a8ac
	ret			;a8af
fila_de_casillas:		; B casillas: 0x80 en el estado 4, si no 0
	ld a,(ix+001h)		;a8b0   ; en el estado 4...
	cp 004h		;a8b3
	ld a,080h		;a8b5   ; ...0x80
	jr z,L_A8BA		;a8b7
	xor a			;a8b9   ; si no, 0
L_A8BA:
	ld (hl),a			;a8ba
	inc hl			;a8bb
	djnz fila_de_casillas		;a8bc   ; B casillas
	ret			;a8be
tipo_6:		; por su estado (tabla p15:A8C5): los tipos 6 y 8
	ld a,(ix+001h)		;a8bf
	call 0424dh		;a8c2   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_A8C5: 4 destinos del despachador p00:424D (call en p15:A8C2, el
;   indice en A): A8CD, A8FE, A635, A9AB; lo leen p15:A8C2 (8 bytes)
;   0xa8c5..0xa8cd  (8 bytes)
DATA_tabla_A8C5:
	defw 0a8cdh,0a8feh,0a635h,0a9abh	; a8c5  -> tipo_6_cerrada abre_tipo_6 pasa_tipo_2 cruza_puerta

; ======================================================================
; CODIGO 0xa8cd..0xa926  (89 bytes)
; ======================================================================


tipo_6_cerrada:		; con el byte 9, se abre; si no, sin el estado 2 de Snake, empujando hacia abajo, con lo que pide y debajo (su Y - la de Snake por debajo de 8, la X de Snake - X - 8 por debajo del ancho - 0x10)
	ld a,(ix+009h)		;a8cd
	and a			;a8d0
	jp nz,se_abre		;a8d1   ; con el byte 9, se abre
	ld a,(0cb31h)		;a8d4   ; lee 1 en el estado 2 de Snake
	and a			;a8d7
	ret nz			;a8d8   ; en el estado 2 de Snake, no
	call empuja_abajo		;a8d9   ; sin empujar hacia abajo, no
	ret nz			;a8dc
	call lo_que_pide		;a8dd   ; sin lo que pide, no
	ret nc			;a8e0
	call sitio_de_puerta		;a8e1   ; sitio_de_puerta: HL = su sitio: L = la Y (byte 2), H = la X (byte 3)
	ld a,(0cb03h)		;a8e4   ; su Y - la de Snake
	sub l			;a8e7
	neg		;a8e8
	cp 008h		;a8ea
	ret nc			;a8ec
	ld a,(ix+008h)		;a8ed   ; el ancho - 0x10
	sub 010h		;a8f0
	ld b,a			;a8f2
	ld a,(0cb05h)		;a8f3   ; la X de Snake - X - 8
	sub h			;a8f6
	sub 008h		;a8f7
	cp b			;a8f9
	ret nc			;a8fa
	jp se_abre		;a8fb   ; se abre
abre_tipo_6:		; un paso (byte 6, de 2 en 2 hasta el ancho / 2; luego p15:A628): el hueco de 2 * paso a 0 desde el medio - el paso
	ld b,(ix+008h)		;a8fe   ; B = el ancho / 2
	srl b		;a901
	ld a,(ix+006h)		;a903   ; hasta la mitad
	cp b			;a906
	jp nc,abierta_tipo_2		;a907   ; abierta_tipo_2: sus casillas libres (p15:A86D, desde su Y) y el estado siguiente
	inc (ix+006h)		;a90a   ; 2 mas
	inc (ix+006h)		;a90d
	ld a,b			;a910   ; el medio - el paso...
	sub (ix+006h)		;a911
	call sitio_de_puerta		;a914   ; ...+ su X
	add a,h			;a917
	ld h,a			;a918
	ld a,(ix+006h)		;a919   ; 2 * paso de ancho
	add a,a			;a91c
	jp hueco_a_0		;a91d   ; hueco_a_0: B (ancho) x el alto desde HL a 0 en la pagina de dibujar (la 1 con la pantalla partida)
tipo_7:		; por su estado (tabla p15:A926)
	ld a,(ix+001h)		;a920
	call 0424dh		;a923   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_A926: 4 destinos del despachador p00:424D (call en p15:A923, el
;   indice en A): A92E, A938, A4F4, A9AB; lo leen p15:A923 (8 bytes)
;   0xa926..0xa92e  (8 bytes)
DATA_tabla_A926:
	defw 0a92eh,0a938h,0a4f4h,0a9abh	; a926  -> tipo_7_cerrada abre_tipo_7 pasa_tipo_1 cruza_puerta

; ======================================================================
; CODIGO 0xa92e..0xa9d4  (166 bytes)
; ======================================================================


tipo_7_cerrada:		; si Snake entra (p15:A44B): se abre y guarda sus mitades (p15:A7E9)
	call snake_entra		;a92e   ; snake_entra: acarreo si Snake entra por ella: con el byte 9, siempre; si no, sin el estado 2 de Snake, empujando hacia arriba (p15:A514), con lo que pide (p15:A399) y dentro de su caja: la Y de Snake - Y - alto por debajo de 0x0A (0x0E en el tipo 0x0A) y su X - X - 4 por debajo del ancho - 8
	ret nc			;a931
	call se_abre		;a932   ; se_abre: su cuenta en 0xD580 (p15:ACDE), el paso y el byte 9 a 0, el rectangulo de (0xC0, 0xD4) de la pagina 0 a 0 (p15:A5DC), el estado siguiente y el sonido 0x16
	jp guarda_mitades		;a935   ; guarda_mitades: la mitad izquierda (ancho / 2 x alto) a (0xC8, 0xD8) y la derecha a (0xE8, 0xD8), de la pagina de dibujar a la 0
abre_tipo_7:		; un paso (byte 6, hasta el ancho / 2; luego p15:A85F): sus bordes (p15:A961) y las mitades apartadas (p15:A822) desde (Y + 3) con el alto - 3, la izquierda desde la X 0xC9
	ld a,(ix+008h)		;a938   ; C = el ancho / 2
	srl a		;a93b
	ld c,a			;a93d
	ld a,(ix+006h)		;a93e   ; B = el paso
	ld b,a			;a941
	cp c			;a942   ; hasta la mitad
	jp nc,casillas_y_estado		;a943   ; casillas_y_estado: sus casillas (ancho / 8 desde la Y + el alto - 0x0C, p15:A86D) y el estado siguiente; acabando de cerrar (estado 4): el estado 0 en los tipos 0x0B, 0x0C y 0x13
	inc (ix+006h)		;a946   ; uno mas
	push bc			;a949
	call bordes_tipo_7		;a94a   ; los bordes
	pop bc			;a94d
	ld a,(ix+002h)		;a94e   ; la Y + 3
	add a,003h		;a951
	ld e,a			;a953
	ld a,(ix+007h)		;a954   ; el alto - 3
	sub 003h		;a957
	ld l,a			;a959
	ld h,0dbh		;a95a   ; la Y guardada 0xDB
	ld a,0c9h		;a95c   ; la X 0xC9
	jp mitades_apartadas		;a95e   ; mitades_apartadas: las dos mitades guardadas apartadas B (C la mitad): la derecha desde (0xE6, L) a la X + C + B, la izquierda desde (A + B, L) a la X, cada una de C - B de ancho y H de alto (H, L y A pasan por 0xD8E0-0xD8E2)
bordes_tipo_7:		; dos bordes en diagonal de 3 lineas de 1 de alto: desde (0xCC + paso, 0xD8) a (X + 3, Y), cada linea una a la izquierda y una mas abajo y una mas larga (desde 8); y desde (0xE7, 0xD8) a (X + C + paso, Y), de 8 - paso y una mas larga cada linea
	push bc			;a961
	call sitio_de_puerta		;a962   ; sitio_de_puerta: HL = su sitio: L = la Y (byte 2), H = la X (byte 3)
	push hl			;a965
	ld e,l			;a966   ; a (X + 3, Y)...
	ld a,h			;a967
	add a,003h		;a968
	ld d,a			;a96a
	ld a,0cch		;a96b   ; ...desde (0xCC + el paso, 0xD8)
	add a,b			;a96d
	ld h,a			;a96e
	ld l,0d8h		;a96f
	ld b,008h		;a971   ; 8 de largo
	ld c,003h		;a973   ; 3 lineas
borde_izquierdo_7:
	call linea_de_borde		;a975   ; linea_de_borde: B x 1 de HL a DE (p15:A853); con B = 0 o desde 0x80, nada
	inc b			;a978   ; una mas larga...
	dec h			;a979   ; ...una a la izquierda...
	inc l			;a97a   ; ...una mas abajo
	dec d			;a97b
	inc e			;a97c
	dec c			;a97d   ; 3
	jr nz,borde_izquierdo_7		;a97e
	pop hl			;a980
	pop bc			;a981
	ld e,l			;a982   ; a (X + C + paso, Y)...
	ld a,h			;a983
	add a,c			;a984
	add a,b			;a985
	ld d,a			;a986
	ld hl,0e7d8h		;a987   ; ...desde (0xE7, 0xD8)
	ld a,008h		;a98a   ; 8 - el paso de largo
	sub b			;a98c
	ld b,a			;a98d
	ld c,003h		;a98e   ; 3 lineas
borde_derecho_7:
	call linea_de_borde		;a990   ; linea_de_borde: B x 1 de HL a DE (p15:A853); con B = 0 o desde 0x80, nada
	inc b			;a993   ; una mas larga...
	inc l			;a994   ; ...una mas abajo
	inc e			;a995
	dec c			;a996
	jr nz,borde_derecho_7		;a997   ; 3
	ret			;a999
linea_de_borde:		; B x 1 de HL a DE (p15:A853); con B = 0 o desde 0x80, nada
	ld a,b			;a99a
	and a			;a99b   ; 0: nada
	ret z			;a99c
	rla			;a99d   ; desde 0x80: nada
	ret c			;a99e
	push hl			;a99f
	push de			;a9a0
	push bc			;a9a1
	ld c,001h		;a9a2   ; 1 de alto
	call copia_a_la_de_dibujar		;a9a4   ; copia_a_la_de_dibujar: B x C de HL a DE con la operacion 0 (p00:47ED), la pagina de dibujar en los bits 4-5
	pop bc			;a9a7
	pop de			;a9a8
	pop hl			;a9a9
	ret			;a9aa
cruza_puerta:		; el estado 3 de todas: Snake cruza la puerta: 0xD444 = 0, 0xD4F1 = 1, sprites fuera (p15:A9DC) y adonde lleva su numero en la tabla de la zona (p15:B4B5, 3 bytes [como y donde][fila y columna][puerta de llegada]): por los bits 7-6 del primero (tabla p15:A9D4) 0 una sala de una zona, 1 una sala especial, 2 de la sala especial a una zona, 3 otra sala sin cambiar de zona
	xor a			;a9ab
	ld (0d444h),a		;a9ac
	inc a			;a9af   ; 0xD4F1 = 1
	ld (0d4f1h),a		;a9b0
	call sprites_fuera		;a9b3   ; los sprites fuera
	ld a,(0ca4ah)		;a9b6   ; la tabla de la zona...
	ld hl,0b4b5h		;a9b9
	call 043f6h		;a9bc   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ex de,hl			;a9bf   ; ...+ su numero * 3
	ld l,(ix+005h)		;a9c0
	ld h,000h		;a9c3
	ld c,l			;a9c5
	ld b,h			;a9c6
	add hl,hl			;a9c7
	add hl,bc			;a9c8
	add hl,de			;a9c9
	ld a,(hl)			;a9ca   ; los bits 7-6: como
	rlca			;a9cb
	rlca			;a9cc
	and 003h		;a9cd
	inc hl			;a9cf   ; DE = el byte de la fila y la columna
	ex de,hl			;a9d0
	call 0424dh		;a9d1   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_A9D4: 4 destinos del despachador p00:424D (call en p15:A9D1, el
;   indice en A): A9ED, AB4F, AC5E, ACCD; lo leen p15:A9D1 (8 bytes)
;   0xa9d4..0xa9dc  (8 bytes)
DATA_tabla_A9D4:
	defw 0a9edh,0ab4fh,0ac5eh,0accdh	; a9d4  -> a_otra_sala a_sala_especial a_una_zona otra_sala_misma

; ======================================================================
; CODIGO 0xa9dc..0xac11  (565 bytes)
; ======================================================================


sprites_fuera:		; los 16 primeros bytes de la copia de los atributos (4 sprites) a 0xE0, a la VRAM, y las tablas cambiadas
	ld hl,0dc00h		;a9dc   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	ld bc,0000fh		;a9df   ; 16 bytes...
	ld a,0e0h		;a9e2   ; ...a 0xE0
	call 04237h		;a9e4   ; llena_bloque: pone A en BC + 1 bytes desde HL
	call 067efh		;a9e7   ; a la VRAM
	jp 067cdh		;a9ea   ; cambia_tablas_de_sprites: alterna las tablas de sprites de la VRAM: atributos en 0xF600 o 0xF200, colores en 0xF400 o 0xF000
a_otra_sala:		; la sala de la fila y la columna (p15:AAF6); si la zona (bits 5-0) es otra, cambia de zona y copia en 0xC700; Snake en la puerta de llegada (p15:ABB9); la sala nueva, lo del tipo cruzado en la zona 0x12 (p15:AAA2) y lo de algunas salas de las zonas 4, 0x0C y 0x0D (la musica, p04:924C con la alerta, el sonido 0x8C)
	call fila_columna_llegada		;a9ed   ; la fila, la columna y la puerta de llegada
	push af			;a9f0
	push bc			;a9f1
	ld a,(hl)			;a9f2   ; la zona...
	and 03fh		;a9f3
	ld hl,0ca4ah		;a9f5   ; apunta a la zona
	cp (hl)			;a9f8   ; ...es la misma?
	jr z,misma_zona		;a9f9
	push bc			;a9fb
	call 08d5bh		;a9fc   ; otra zona
	pop bc			;a9ff
	call snake_en_la_llegada		;aa00   ; Snake en la puerta de llegada
	call 05afeh		;aa03   ; copia en 0xC700
	jr sala_nueva		;aa06
misma_zona:		; Snake en la puerta de llegada
	call snake_en_la_llegada		;aa08   ; snake_en_la_llegada: Snake en la puerta de numero B de la lista de la sala especial o de la zona: su Y y su X + lo de su tipo (p15:AC11, [X][Y]); en la zona 0x12, la sala (2, 8) lo pone en (0x70, 0x60)
sala_nueva:		; fuera lo de la sala, la sala nueva y lo de cada zona
	call 07baah		;aa0b   ; fuera lo de la sala
	call 08d4bh		;aa0e   ; p02:8D4B
	pop bc			;aa11
	pop af			;aa12
	call tipo_cruzado_12		;aa13   ; A = el tipo cruzado
	call 08d37h		;aa16   ; la sala nueva
	ld a,(0ca4ah)		;aa19   ; zona 0x0C...
	cp 00ch		;aa1c
	jr z,llega_zona_0c		;aa1e
	cp 00dh		;aa20   ; ...0x0D...
	jr z,llega_zona_0d		;aa22
	cp 004h		;aa24   ; ...4
	jr nz,enciende_al_llegar		;aa26
	ld a,(0ca4bh)		;aa28   ; sala 9
	cp 009h		;aa2b
	jr z,llega_con_alerta		;aa2d
	ld bc,00000h		;aa2f   ; sala 0x11: 0, 0
	cp 011h		;aa32
	jr z,pon_d4e4_d4e2		;aa34
	cp 006h		;aa36   ; sala 6
	jr z,llega_zona_4_sala_6		;aa38
	ld bc,00001h		;aa3a   ; sala 0x16: 0, 1
	cp 016h		;aa3d
	jr z,pon_d4e4_d4e2		;aa3f
	ld bc,00100h		;aa41   ; sala 7: 1, 0 (con p15:AA8C)
	cp 007h		;aa44
	jr nz,enciende_al_llegar		;aa46
	call mira_d7d4		;aa48   ; mira_d7d4: Z con 0xD694 = 0, 0xD67C = 0 y el bit 4 de 0xD7D4
	jr nz,enciende_al_llegar		;aa4b
pon_d4e4_d4e2:		; 0xD4E4 = B, 0xD4E2 = C y, sin alerta, la musica de la zona
	ld a,b			;aa4d
	ld (0d4e4h),a		;aa4e
	ld a,c			;aa51
	ld (0d4e2h),a		;aa52
	ld a,(0ca5fh)		;aa55   ; sin alerta...
	and a			;aa58
	call z,07a43h		;aa59   ; ...la musica de la zona
enciende_al_llegar:		; la pantalla y los sprites encendidos
	jp 04606h		;aa5c   ; enciende_todo: la pantalla y los sprites encendidos
llega_con_alerta:		; con la alerta: fuera los sprites y 0xD300, y p04:924C
	ld a,(0ca5fh)		;aa5f   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	and a			;aa62
	ret z			;aa63   ; sin alerta, nada
	call 059efh		;aa64   ; limpia_sprites_y_d300:
	call 07ba1h		;aa67   ; a_p04_924c_3: p04:924C con el banco 4 en 0x8000
	jr enciende_al_llegar		;aa6a
llega_zona_0c:		; sala 6: con la alerta, p15:AA5F
	ld a,(0ca4bh)		;aa6c   ; lee la sala de la zona
	cp 006h		;aa6f
	jr z,llega_con_alerta		;aa71
	cp 003h		;aa73   ; sala 3: el sonido 0x8C
	jr nz,enciende_al_llegar		;aa75
	call 06b99h		;aa77   ; sonido_8c: pide el sonido 0x8C (de los que tienen la partitura en un banco de musica, p16:4CE3) (antes, L_6CDA)
	jr enciende_al_llegar		;aa7a
llega_zona_0d:		; sala 2: con la alerta, p15:AA5F
	ld a,(0ca4bh)		;aa7c   ; lee la sala de la zona
	cp 002h		;aa7f
	jr nz,enciende_al_llegar		;aa81
	jr llega_con_alerta		;aa83
llega_zona_4_sala_6:		; con p15:AA8C, 0xD4E4 = 0xD4E2 = 0
	call mira_d7d4		;aa85   ; con p15:AA8C: 0, 0
	jr nz,enciende_al_llegar		;aa88
	jr pon_d4e4_d4e2		;aa8a
mira_d7d4:		; Z con 0xD694 = 0, 0xD67C = 0 y el bit 4 de 0xD7D4
	ld a,(0d694h)		;aa8c
	and a			;aa8f
	ret nz			;aa90   ; con 0xD694: NZ
	ld a,(0d67ch)		;aa91
	and a			;aa94
	ret nz			;aa95   ; con 0xD67C: NZ
	ld a,(0d7d4h)		;aa96
	and 010h		;aa99   ; bit 4...
	jr z,sin_d7d4		;aa9b
	xor a			;aa9d   ; ...Z
	ret			;aa9e
sin_d7d4:		; NZ: sin el bit 4 de 0xD7D4
	or 001h		;aa9f   ; NZ
	ret			;aaa1
tipo_cruzado_12:		; en la zona 0x12 sin 0xD881 = 0xFF: por el tipo 6, la pantalla sin partir (0xCA1C a 0xCA1D), el marcador rehecho, p10:B9E5, R#0 = 6 y R#23 = 0; por el tipo 5, 0xD8A4 = 1, la pagina 1, 0xCA1C de vuelta y R#0 = 0x16
	ld b,a			;aaa2
	ld a,(0d881h)		;aaa3   ; con 0xD881 = 0xFF, nada
	inc a			;aaa6
	ret z			;aaa7
	ld a,(0ca4ah)		;aaa8   ; solo en la zona 0x12
	cp 012h		;aaab
	ret nz			;aaad
	ld a,b			;aaae   ; tipo 5...
	cp 005h		;aaaf
	jr z,tipo_cruzado_5		;aab1
	cp 006h		;aab3   ; ...o 6
	ret nz			;aab5
	call 045f1h		;aab6   ; todo apagado
	ld hl,0ca1ch		;aab9   ; la pantalla partida...
	ld a,(hl)			;aabc
	ld (0ca1dh),a		;aabd   ; ...guardada en 0xCA1D...
	xor a			;aac0   ; ...y a 0, con 0xD8A4
	ld (0d8a4h),a		;aac1
	ld (hl),a			;aac4
	call 06077h		;aac5   ; la franja de abajo en las dos paginas
	ld a,001h		;aac8
	call 06077h		;aaca   ; borra_marcador_abajo_en: la franja de abajo (X = 0, Y = 0xC0, 0xE0 x 0x14) a 0 en la pagina A
	call 08d56h		;aacd   ; el marcador
	call 08d6dh		;aad0   ; a_p10_b9e5: p10:B9E5 con el banco 10 en 0xA000
	ld bc,00600h		;aad3   ; R#0 = 6: sin la interrupcion de linea
	call 00047h		;aad6   ; BIOS WRTVDP - Writes data in the VDP-register
	ld bc,00017h		;aad9   ; R#23 = 0
	jp 00047h		;aadc   ; BIOS WRTVDP - Writes data in the VDP-register
tipo_cruzado_5:		; por el tipo 5: 0xD8A4 = 1, la pagina 1, la pantalla partida de vuelta y R#0 = 0x16
	ld a,001h		;aadf   ; 0xD8A4 = 1...
	ld (0d8a4h),a		;aae1
	ld (0ca42h),a		;aae4   ; ...la pagina 1...
	ld a,(0ca1dh)		;aae7   ; ...la pantalla partida de vuelta
	ld (0ca1ch),a		;aaea   ; guarda 1: la pantalla partida en la linea 0xB4 (arriba con desplazamiento, abajo la pagina 1 sin sprites)
	ld bc,01600h		;aaed   ; R#0 = 0x16: con la interrupcion de linea
	call 00047h		;aaf0   ; BIOS WRTVDP - Writes data in the VDP-register
	jp 045f1h		;aaf3   ; todo apagado
fila_columna_llegada:		; de DE: la fila (nibble alto) y la columna de la sala (0xCA50-0xCA51), la puerta de llegada a 0xD44A con su cuenta (p15:ACDE); 0xD8CE = 1, la ficha cruzada libre y Snake de vuelta a su estado 0xCB35 si estaba en el 2 o el 0x0B; vuelve con A = D = el tipo cruzado, B = la puerta de llegada y HL en el primer byte
	ex de,hl			;aaf6
	push hl			;aaf7
	ld a,(hl)			;aaf8   ; la fila...
	rrca			;aaf9
	rrca			;aafa
	rrca			;aafb
	rrca			;aafc
	and 00fh		;aafd
	ld (0ca50h),a		;aaff   ; guarda la fila de la sala en la zona (uno mas al salir por arriba)
	ld a,(hl)			;ab02   ; ...y la columna
	and 00fh		;ab03
	ld (0ca51h),a		;ab05   ; guarda la columna de la sala en la zona (uno mas al salir por la derecha)
	inc hl			;ab08   ; la puerta de llegada...
	ld a,(hl)			;ab09
	ld (0d44ah),a		;ab0a   ; guarda el numero de la puerta por la que llega Snake (p15:AB0A)
	push af			;ab0d
	call cuenta_de_puerta		;ab0e   ; ...con su cuenta
	pop bc			;ab11
	pop hl			;ab12
	dec hl			;ab13
	ld a,001h		;ab14
	ld (0d8ceh),a		;ab16   ; 0xD8CE = 1
	ld (0cb14h),a		;ab19   ; guarda el dibujo del paso de andar (0, 1, 2, 1: p02:9888)
	ld d,(ix+000h)		;ab1c   ; D = el tipo cruzado...
	ld (ix+000h),000h		;ab1f   ; ...y la ficha libre
	ld a,(0cb00h)		;ab23   ; Snake en el estado 2...
	cp 002h		;ab26
	jr z,snake_a_su_estado		;ab28
	cp 00bh		;ab2a   ; ...o 0x0B
	ld a,d			;ab2c
	ret nz			;ab2d
snake_a_su_estado:		; el estado de 0xCB35 y su dibujo
	ld a,(0cb35h)		;ab2e
	ld (0cb00h),a		;ab31   ; guarda el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	ld (0cb01h),a		;ab34   ; guarda el dibujo de Snake (al darse la vuelta se le suma 1, 3 o 5 segun 0xCB00)
	xor a			;ab37   ; fuera la marcha, la vuelta y el estado 2
	ld (0cb28h),a		;ab38
	ld (0cb0ah),a		;ab3b   ; guarda la marcha de Snake: el indice de las velocidades de p02:9520
	ld (0cb16h),a		;ab3e   ; guarda 1 mientras Snake se da la vuelta
	ld (0cb31h),a		;ab41   ; guarda 1 en el estado 2 de Snake
	inc a			;ab44
	ld (0cb14h),a		;ab45   ; el paso de andar 1
	ld a,020h		;ab48   ; 0xCB29 = 0x20
	ld (0cb29h),a		;ab4a
	ld a,d			;ab4d
	ret			;ab4e
a_sala_especial:		; la sala especial de los bits 5-0 (0xCA76): fuera lo de la sala, sus mapas de bits, las lineas 0xC3, Snake en la puerta de llegada (p15:ABB9), lo de la alerta (p15:AC3B), la sala; en la 2, la espera 0x12C con 0xCAF6 = 1; en la 0x26 por la columna 7, el sonido 0x35; en las 0x31 y 0x39, 0xD4E2 = 1 y p02:8D60
	call fila_columna_llegada		;ab4f   ; fila_columna_llegada: de DE: la fila (nibble alto) y la columna de la sala (0xCA50-0xCA51), la puerta de llegada a 0xD44A con su cuenta (p15:ACDE); 0xD8CE = 1, la ficha cruzada libre y Snake de vuelta a su estado 0xCB35 si estaba en el 2 o el 0x0B; vuelve con A = D = el tipo cruzado, B = la puerta de llegada y HL en el primer byte
	ld a,(hl)			;ab52   ; la sala especial
	and 03fh		;ab53
	ld (0ca76h),a		;ab55   ; guarda la sala especial (0 = ninguna; indice de p24:64B6)
	push de			;ab58
	push bc			;ab59
	call 07baah		;ab5a   ; borra_lo_de_la_sala: borra 0xD400-0xD415, las 24 fichas de 0x40 bytes desde 0xCE2E (18 bytes de cada una), 0xD460-0xD4BF y 0xD4C0-0xD4DF
	call 08d4bh		;ab5d   ; p02:8D4B
	call 08d50h		;ab60   ; mapas_de_bits_especiales_b_1_2_15: mapas_de_bits_especiales y deja los bancos 1, 2 y 15
	call 08d46h		;ab63   ; lineas_c3_en_la_otra_b_1_2_15: lineas_c3_en_la_otra y deja los bancos 1, 2 y 15
	xor a			;ab66   ; 0xD44C-0xD44E a 0...
	ld (0d44ch),a		;ab67
	ld (0d44dh),a		;ab6a
	ld (0d44eh),a		;ab6d
	ld (0e070h),a		;ab70   ; ...y las dos fichas de 0xE070 libres
	ld (0e078h),a		;ab73
	pop bc			;ab76
	call snake_en_la_llegada		;ab77   ; Snake en la puerta de llegada
	pop de			;ab7a
	call alerta_al_llegar		;ab7b   ; lo de la alerta
	call 05f0ah		;ab7e   ; a_p12_69e0: p12:69E0 con el banco 12 en 0x6000
	call 08d2ah		;ab81   ; a_p10_bce4: p10:BCE4 con el banco 10 en 0xA000
	call 08d41h		;ab84   ; entra_en_sala_especial_1_b_1_2_15: entra_en_sala_especial_1 y deja los bancos 1, 2 y 15
	call 05f01h		;ab87   ; a_p12_67e1: p12:67E1 con el banco 12 en 0x6000
	ld a,(0ca76h)		;ab8a   ; la sala especial 2...
	cp 002h		;ab8d
	jr z,sala_especial_2		;ab8f
	cp 026h		;ab91   ; ...0x26...
	jr z,sala_especial_26		;ab93
	cp 031h		;ab95   ; ...0x31 o 0x39
	jr z,sala_31_o_39		;ab97
	cp 039h		;ab99
	ret nz			;ab9b
sala_31_o_39:		; 0xD4E2 = 1 y p02:8D60
	ld a,001h		;ab9c
	ld (0d4e2h),a		;ab9e
	jp 08d60h		;aba1   ; p02:8D60
sala_especial_2:		; la espera de 0x12C con 0xCAF6 = 1
	ld hl,0012ch		;aba4   ; la espera de 0x12C...
	ld (0caf7h),hl		;aba7   ; guarda otra espera de 16 bits que baja en la interrupcion
	ld a,001h		;abaa   ; ...con 0xCAF6 = 1
	ld (0caf6h),a		;abac
	ret			;abaf
sala_especial_26:		; por la columna 7, el sonido 0x35
	ld a,(0ca51h)		;abb0   ; lee la columna de la sala en la zona (uno mas al salir por la derecha)
	cp 007h		;abb3
	ret nz			;abb5
	jp 06aeah		;abb6   ; sonido_35: pide el sonido 0x35
snake_en_la_llegada:		; Snake en la puerta de numero B de la lista de la sala especial o de la zona: su Y y su X + lo de su tipo (p15:AC11, [X][Y]); en la zona 0x12, la sala (2, 8) lo pone en (0x70, 0x60)
	ld a,(0ca4ah)		;abb9   ; lee la zona
	ld c,a			;abbc
	cp 012h		;abbd   ; la zona 0x12...
	jr nz,busca_la_llegada		;abbf
	ld hl,(0ca50h)		;abc1   ; ...fila 2...
	ld a,l			;abc4
	cp 002h		;abc5
	jr nz,busca_la_llegada		;abc7
	ld a,h			;abc9   ; ...columna 8
	cp 008h		;abca
	jr nz,busca_la_llegada		;abcc
	ld a,060h		;abce   ; Y = 0x60
	ld (0cb03h),a		;abd0   ; guarda la Y de Snake
	ld a,070h		;abd3   ; X = 0x70
	ld (0cb05h),a		;abd5   ; guarda la X de Snake
	ret			;abd8
busca_la_llegada:		; la lista de la sala especial...
	ld a,(0ca76h)		;abd9   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	and a			;abdc
	ld hl,0b1feh		;abdd
	jr nz,L_ABE6		;abe0
	ld a,c			;abe2   ; ...o de la zona
	ld hl,0ad0ch		;abe3
L_ABE6:
	call 043f6h		;abe6   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld a,005h		;abe9   ; desde el byte 5 (su numero)
	call 0423eh		;abeb   ; suma_a_hl: HL = HL + A
puerta_de_llegada:
	ld a,(hl)			;abee
	cp b			;abef   ; la de numero B
	jr z,pon_en_la_llegada		;abf0
	ld a,006h		;abf2   ; la siguiente (6 bytes)
	call 0423eh		;abf4   ; suma_a_hl: HL = HL + A
	jr puerta_de_llegada		;abf7
pon_en_la_llegada:
	dec hl			;abf9
	dec hl			;abfa
	ld e,(hl)			;abfb   ; E = su X
	dec hl			;abfc
	ld d,(hl)			;abfd   ; D = su Y
	dec hl			;abfe
	ld a,(hl)			;abff   ; su tipo...
	ld hl,0ac0fh		;ac00   ; ...lo suyo de p15:AC11
	call 043f6h		;ac03   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld a,h			;ac06   ; la Y + H
	add a,d			;ac07
	ld (0cb03h),a		;ac08   ; guarda la Y de Snake
	ld a,l			;ac0b   ; la X + L
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


alerta_al_llegar:		; con la alerta, en las salas especiales 2, 0x29, 0x2D y 0x31 o por una puerta de tipo 0x0C (D): p04:924C
	ld a,(0ca5fh)		;ac3b   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	and a			;ac3e
	ret z			;ac3f   ; sin alerta, nada
	ld a,(0ca76h)		;ac40   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 002h		;ac43
	jp z,07ba1h		;ac45   ; a_p04_924c_3: p04:924C con el banco 4 en 0x8000
	cp 029h		;ac48
	jp z,07ba1h		;ac4a   ; a_p04_924c_3: p04:924C con el banco 4 en 0x8000
	cp 02dh		;ac4d
	jp z,07ba1h		;ac4f   ; a_p04_924c_3: p04:924C con el banco 4 en 0x8000
	cp 031h		;ac52
	jp z,07ba1h		;ac54   ; a_p04_924c_3: p04:924C con el banco 4 en 0x8000
	ld a,d			;ac57   ; el tipo 0x0C
	cp 00ch		;ac58
	ret nz			;ac5a
	jp 07ba1h		;ac5b   ; a_p04_924c_3: p04:924C con el banco 4 en 0x8000
a_una_zona:		; de la sala especial a la zona de los bits 5-0: p02:8D3C, sin sala especial, fuera lo de la sala, Snake en la llegada, 0xD300 a cero, la sala, p12:67E1, p11:BDBD; al salir de la 2, por 0xCAF6 (2 la orden 0xF3, 3 p02:8D60); de la 0x39, 0xD43B = 0; de las 0x31 y 0x39, 0xD4E2 = 0 y la musica de la zona
	call fila_columna_llegada		;ac5e   ; fila_columna_llegada: de DE: la fila (nibble alto) y la columna de la sala (0xCA50-0xCA51), la puerta de llegada a 0xD44A con su cuenta (p15:ACDE); 0xD8CE = 1, la ficha cruzada libre y Snake de vuelta a su estado 0xCB35 si estaba en el 2 o el 0x0B; vuelve con A = D = el tipo cruzado, B = la puerta de llegada y HL en el primer byte
	ld a,(hl)			;ac61   ; la zona
	and 03fh		;ac62
	ld (0ca4ah),a		;ac64   ; guarda la zona
	ld a,(0ca76h)		;ac67   ; la sala especial de antes
	push af			;ac6a
	push bc			;ac6b
	call 08d3ch		;ac6c   ; p02:8D3C
	xor a			;ac6f   ; sin sala especial
	ld (0ca76h),a		;ac70   ; guarda la sala especial (0 = ninguna; indice de p24:64B6)
	call 07baah		;ac73   ; borra_lo_de_la_sala: borra 0xD400-0xD415, las 24 fichas de 0x40 bytes desde 0xCE2E (18 bytes de cada una), 0xD460-0xD4BF y 0xD4C0-0xD4DF
	call 08d4bh		;ac76   ; p02:8D4B
	pop bc			;ac79
	call snake_en_la_llegada		;ac7a   ; Snake en la llegada
	ld hl,0d300h		;ac7d   ; las 4 fichas de 0xD300 a 0
	ld bc,000ffh		;ac80
	call 04236h		;ac83   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	ld a,(0d820h)		;ac86   ; con 0xD820 = 8...
	cp 008h		;ac89
	jr nz,entra_en_la_zona		;ac8b
	ld a,080h		;ac8d   ; ...0xD823 = 0x80...
	ld (0d823h),a		;ac8f
	ld a,078h		;ac92   ; ...y 0xD825 = 0x78
	ld (0d825h),a		;ac94
entra_en_la_zona:		; la sala nueva y lo de la sala especial de la que sale
	call 08d37h		;ac97   ; la sala
	call 05f01h		;ac9a   ; a_p12_67e1: p12:67E1 con el banco 12 en 0x6000
	ld c,004h		;ac9d
	call 08d65h		;ac9f   ; a_p11_bdbd_2: p11:BDBD con el banco 11 en 0xA000
	pop af			;aca2   ; la sala especial de antes: 2...
	cp 002h		;aca3
	jr z,sale_de_la_2		;aca5
	cp 031h		;aca7   ; ...0x31...
	jr z,sale_de_31_o_39		;aca9
	cp 039h		;acab   ; ...0x39
	ret nz			;acad
	xor a			;acae
	ld (0d43bh),a		;acaf
sale_de_31_o_39:		; 0xD4E2 = 0 y la musica de la zona
	xor a			;acb2
	ld (0d4e2h),a		;acb3
	jp 07a43h		;acb6   ; musica_de_la_zona_bancos_15:
sale_de_la_2:		; 0xCAF6 = 2: la orden 0xF3
	ld a,(0caf6h)		;acb9
	dec a			;acbc
	dec a			;acbd
	jp z,06be0h		;acbe   ; orden_sonido_f3: la orden 0xF3 al sonido
	dec a			;acc1   ; 0xCAF6 = 3: 0xC690 = 0xD443 = 0 y p02:8D60
	ret nz			;acc2
	xor a			;acc3
	ld (0c690h),a		;acc4
	ld (0d443h),a		;acc7
	jp 08d60h		;acca   ; p02:8D60
otra_sala_misma:		; la sala de la fila y la columna sin cambiar de zona: fuera lo de la sala, Snake en la llegada y la sala (p02:8D41)
	call fila_columna_llegada		;accd   ; fila_columna_llegada: de DE: la fila (nibble alto) y la columna de la sala (0xCA50-0xCA51), la puerta de llegada a 0xD44A con su cuenta (p15:ACDE); 0xD8CE = 1, la ficha cruzada libre y Snake de vuelta a su estado 0xCB35 si estaba en el 2 o el 0x0B; vuelve con A = D = el tipo cruzado, B = la puerta de llegada y HL en el primer byte
	push bc			;acd0
	call 07baah		;acd1   ; borra_lo_de_la_sala: borra 0xD400-0xD415, las 24 fichas de 0x40 bytes desde 0xCE2E (18 bytes de cada una), 0xD460-0xD4BF y 0xD4C0-0xD4DF
	call 08d4bh		;acd4   ; p02:8D4B
	pop bc			;acd7
	call snake_en_la_llegada		;acd8   ; snake_en_la_llegada: Snake en la puerta de numero B de la lista de la sala especial o de la zona: su Y y su X + lo de su tipo (p15:AC11, [X][Y]); en la zona 0x12, la sala (2, 8) lo pone en (0x70, 0x60)
	jp 08d41h		;acdb   ; entra_en_sala_especial_1_b_1_2_15: entra_en_sala_especial_1 y deja los bancos 1, 2 y 15
cuenta_de_puerta:		; la cuenta en 0xD580 de la puerta A (con el bit 7, nada): en la lista de la zona (p15:B153, 0xFF al final), 0xFF (siempre) si alli lleva el bit 7 o 4; fuera de la lista, 1
	ld b,a			;acde
	rla			;acdf   ; con el bit 7, nada
	ret c			;ace0
	ld a,(0ca4ah)		;ace1   ; la lista de la zona
	ld hl,0b153h		;ace4
	call 043f6h		;ace7   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld a,b			;acea   ; su cuenta en 0xD580
	ld de,0d580h		;aceb   ; apunta a 0x80 cuentas de las puertas por su numero: 0 cerrada, 0xFF siempre abierta; si no, cuantas entradas de sala le quedan abierta (p15:ACDE, p15:A1E2)
	call 04243h		;acee   ; suma_a_de: DE = DE + A
busca_cuenta:
	ld a,(hl)			;acf1
	cp 0ffh		;acf2   ; 0xFF: no esta
	jr z,cuenta_1		;acf4
	and 07fh		;acf6   ; es esta?
	cp b			;acf8
	jr z,cuenta_de_lista		;acf9
	inc hl			;acfb
	jr busca_cuenta		;acfc
cuenta_de_lista:
	ld a,(hl)			;acfe
	rla			;acff   ; con el bit 7...
	ld a,0ffh		;ad00   ; ...0xFF...
	jr c,L_AD06		;ad02
	ld a,004h		;ad04   ; ...si no, 4
L_AD06:
	ld (de),a			;ad06
	ret			;ad07
cuenta_1:		; fuera de la lista, 1
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


sprites_d800_tipo_1:		; los sprites de la ficha de 0xD800 de tipo 1 (IX): en los pasos 2-3 (el 2 sin el byte 0x1F), los 16 sprites desde el 10 fuera y los de la lista p15:BC0A por su dibujo (byte 0x0D) desde la Y + el byte 0x0F - 0x28 y la X + 0xC0; desde el paso 4, en su sala, la lista p15:BC40 y la de p15:BBFA con el color 0x0F; recortados por encima de 0xC0 (p15:B8B9)
	ld a,(ix+001h)		;b800
	cp 002h		;b803   ; los pasos 0-1, nada
	ret c			;b805
	jr nz,sprites_tipo_1_a		;b806   ; el paso 2...
	ld a,(ix+01fh)		;b808   ; ...con el byte 0x1F, nada
	and a			;b80b
	ret nz			;b80c
sprites_tipo_1_a:		; en los pasos 2-3: los sprites desde el 10 fuera y los de su lista
	cp 004h		;b80d   ; desde el paso 4, p15:B870
	jp nc,sprites_tipo_1_b		;b80f   ; sprites_tipo_1_b: desde el paso 4: en las filas 7-8, los 8 sprites desde el 10 fuera; en su sala, la lista de p15:BC40 por el byte 0x0D, la de p15:BBFA desde el sprite 14 con los patrones de p15:BCA0 o p15:BCAA (byte 0x18) y el color 0x0F
	ld bc,00040h		;b812   ; los sprites desde el 10 fuera
	call 0872bh		;b815   ; esconde_desde_10: BC + 1 bytes de sprites desde el 10 fuera (Y = 0xE0)
	ld a,(ix+00dh)		;b818   ; su lista por el byte 0x0D
	ld hl,0bc0ah		;b81b
	call 043f6h		;b81e   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	exx			;b821
	ld a,(ix+00fh)		;b822   ; D' = el byte 0x0F - 0x28 (a la Y)...
	sub 028h		;b825
	ld d,a			;b827
	ld e,0c0h		;b828   ; ...E' = 0xC0 (a la X)...
	ld c,080h		;b82a   ; ...C' = 0x80 (la Y maxima)
	exx			;b82c
	call sprites_de_lista		;b82d   ; los sprites...
	jp recorta_sprites		;b830   ; ...y recortados
sprites_de_lista:		; desde el sprite 10 (0xDC28) los de la lista de HL: [patron][cuantos] y por cada uno [Y][X] sumados a los bytes 3 y 5 de la ficha + D' y E'; con la Y desde C' o la X desde 0xB0, la Y 0xE0 (fuera); el patron de 4 en 4
	ld de,0dc28h		;b833
sprites_de_lista_de:		; C = el primer patron, B = cuantos y los sprites
	ld c,(hl)			;b836   ; C = el primer patron...
	inc hl			;b837
	ld b,(hl)			;b838   ; ...B = cuantos
	inc hl			;b839
sprite_de_lista:		; un sprite: Y, X y patron
	ld a,(hl)			;b83a   ; la Y + el byte 3 + D'...
	add a,(ix+003h)		;b83b
	exx			;b83e
	add a,d			;b83f
	cp c			;b840   ; ...desde C', fuera
	exx			;b841
	jr c,L_B846		;b842
	ld a,0e0h		;b844
L_B846:
	ld (de),a			;b846
	inc hl			;b847
	ld a,(hl)			;b848   ; la X + el byte 5 + E'...
	add a,(ix+005h)		;b849
	exx			;b84c
	add a,e			;b84d
	exx			;b84e
	cp 0b0h		;b84f   ; ...desde 0xB0...
	jr c,L_B858		;b851
	push af			;b853
	ld a,0e0h		;b854   ; ...la Y 0xE0
	ld (de),a			;b856
	pop af			;b857
L_B858:
	inc de			;b858
	ld (de),a			;b859   ; la X
	inc hl			;b85a
	inc de			;b85b
	ld a,c			;b85c   ; el patron
	ld (de),a			;b85d
	inc de			;b85e   ; se salta el cuarto byte
	inc de			;b85f
	inc c			;b860   ; el patron siguiente (4 mas)
	inc c			;b861
	inc c			;b862
	inc c			;b863
	djnz sprite_de_lista		;b864   ; B sprites
	ret			;b866
colores_daa0:		; los colores de 8 sprites (0x80 bytes de 0xDAA0) a A
	ld hl,0daa0h		;b867
	ld bc,0007fh		;b86a
	jp 04237h		;b86d   ; llena_bloque: pone A en BC + 1 bytes desde HL
sprites_tipo_1_b:		; desde el paso 4: en las filas 7-8, los 8 sprites desde el 10 fuera; en su sala, la lista de p15:BC40 por el byte 0x0D, la de p15:BBFA desde el sprite 14 con los patrones de p15:BCA0 o p15:BCAA (byte 0x18) y el color 0x0F
	ld a,(0ca50h)		;b870   ; en las filas 7-8...
	sub 007h		;b873
	cp 002h		;b875
	ld bc,0001fh		;b877   ; ...8 sprites fuera
	call c,0872bh		;b87a   ; esconde_desde_10: BC + 1 bytes de sprites desde el 10 fuera (Y = 0xE0)
	call 08100h		;b87d   ; fuera de su sala, nada
	ret nz			;b880
	ld a,(ix+00dh)		;b881   ; su lista de p15:BC40...
	ld hl,0bc40h		;b884
	call 043f6h		;b887   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	exx			;b88a
	ld de,00000h		;b88b   ; ...sin sumar nada...
	ld c,0c0h		;b88e   ; ...hasta la Y 0xC0
	exx			;b890
	call sprites_de_lista		;b891   ; sprites_de_lista: desde el sprite 10 (0xDC28) los de la lista de HL: [patron][cuantos] y por cada uno [Y][X] sumados a los bytes 3 y 5 de la ficha + D' y E'; con la Y desde C' o la X desde 0xB0, la Y 0xE0 (fuera); el patron de 4 en 4
	ld a,(ix+018h)		;b894   ; con el byte 0x18...
	and a			;b897
	ld hl,0bca0h		;b898   ; ...los patrones de p15:BCA0...
	jr z,sprites_tipo_1_c		;b89b
	ld hl,0bcaah		;b89d   ; ...o de p15:BCAA
sprites_tipo_1_c:
	exx			;b8a0
	ld a,(ix+00dh)		;b8a1   ; las posiciones de p15:BBFA por el byte 0x0D
	ld hl,0bbfah		;b8a4
	call 043f6h		;b8a7   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ex de,hl			;b8aa
	ld c,0c0h		;b8ab
	exx			;b8ad
	ld de,0dc38h		;b8ae   ; desde el sprite 14
	call sprites_de_lista_de		;b8b1   ; sprites_de_lista_de: C = el primer patron, B = cuantos y los sprites
	ld a,00fh		;b8b4   ; color 0x0F
	call colores_daa0		;b8b6   ; colores_daa0: los colores de 8 sprites (0x80 bytes de 0xDAA0) a A
recorta_sprites:		; de los 8 sprites desde el 10: con la Y entre 0xB0 y 0xBF, las lineas que pasan de 0xC0 a color 0 en 0xDAA0 (no tapan el marcador)
	ld hl,0dc28h		;b8b9
	ld de,0daa0h		;b8bc   ; sus colores
	ld b,008h		;b8bf   ; 8 sprites
recorta_sprite:
	push bc			;b8c1
	push hl			;b8c2
	push de			;b8c3
	ld a,(hl)			;b8c4   ; la Y entre 0xB0 y 0xBF?
	sub 0b0h		;b8c5
	cp 010h		;b8c7
	jr nc,recorta_siguiente		;b8c9
	inc a			;b8cb   ; C = las lineas que pasan de 0xC0
	ld c,a			;b8cc
	sub 010h		;b8cd   ; desde la linea 0x0F - C...
	neg		;b8cf
	call 04243h		;b8d1   ; suma_a_de: DE = DE + A
	ld h,d			;b8d4   ; ...a 0
	ld l,e			;b8d5
	inc de			;b8d6
	ld b,000h		;b8d7
	ld (hl),b			;b8d9
	ldir		;b8da   ; C + 1 bytes a 0: el ultimo es la linea 0 del sprite siguiente
recorta_siguiente:
	pop de			;b8dc
	pop hl			;b8dd
	ld a,004h		;b8de   ; el sprite siguiente (4 bytes)...
	call 0423eh		;b8e0   ; suma_a_hl: HL = HL + A
	ld a,010h		;b8e3   ; ...y sus colores (16)
	call 04243h		;b8e5   ; suma_a_de: DE = DE + A
	pop bc			;b8e8
	djnz recorta_sprite		;b8e9   ; 8
	ret			;b8eb
d800_tipo_0c:		; la ficha de 0xD800 de tipo 0x0C (IX): solo en las salas 0x10-0x13 (si no, fuera su musica); con 0xC693, p00:6AEE; su paso por p15:B919 (6) y, desde el paso 4, p06:BA36 con su byte 0x0C y su musica
	call salas_10_a_13		;b8ec   ; fuera de las salas 0x10-0x13...
	jp nc,086a4h		;b8ef   ; ...fuera su musica
	ld hl,06aeeh		;b8f2   ; con 0xC693, p00:6AEE
	call 086d5h		;b8f5   ; si_c693: con 0xC693, lo borra y salta a HL
	ld a,(ix+001h)		;b8f8   ; por su paso
	ld hl,0b919h		;b8fb
	call 0424eh		;b8fe   ; salta_por_tabla: salta a la palabra A de la tabla de HL
	ld a,(ix+001h)		;b901   ; desde el paso 4...
	cp 004h		;b904
	ret c			;b906
	call salas_10_a_13		;b907   ; ...en las salas 0x10-0x13...
	ld a,(ix+00ch)		;b90a   ; ...p06:BA36 con el byte 0x0C
	call 08085h		;b90d   ; llama_ba36_a:
	ld a,(ix+001h)		;b910   ; desde el paso 4...
	cp 004h		;b913
	ret c			;b915
	jp 08671h		;b916   ; ...su musica

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


salas_10_a_13:		; acarreo en las salas 0x10-0x13
	ld a,(0ca4bh)		;b925   ; lee la sala de la zona
	sub 010h		;b928
	cp 004h		;b92a
	ret			;b92c
tipo_0c_paso_0:		; en su sala: el bit 3 de 0xD7D2, 0xCB3C = 1, (0x30, 0) de 0x30 x 0x60 copiado a (0x48, 0) de la otra pagina (p15:B9C1), el dibujo 0, el byte 0x0F = 0x60, los sprites de p35:6860, el color 7, la espera 0x10 y el paso siguiente
	call 08100h		;b92d   ; fuera de su sala, nada
	ret nz			;b930
	ld hl,0d7d2h		;b931   ; el bit 3 de 0xD7D2
	set 3,(hl)		;b934
	ld a,001h		;b936   ; 0xCB3C = 1
	ld (0cb3ch),a		;b938
	ld l,000h		;b93b   ; de la Y 0...
	ld c,060h		;b93d   ; ...0x60 de alto
	call copia_0c_a_48		;b93f   ; copia_0c_a_48: de (0x30, L) 0x30 x C a (0x48, 0) de la otra pagina
	xor a			;b942   ; el dibujo 0...
	ld (ix+00dh),a		;b943
	ld (ix+00fh),060h		;b946   ; ...y el byte 0x0F = 0x60
	call 05065h		;b94a   ; los sprites
	ld a,007h		;b94d   ; el color 7
	call colores_daa0		;b94f   ; colores_daa0: los colores de 8 sprites (0x80 bytes de 0xDAA0) a A
	ld (ix+00eh),010h		;b952   ; la espera 0x10
	jp paso_siguiente_0c		;b956   ; paso_siguiente_0c: el paso siguiente (byte 1 + 1)
tipo_0c_paso_1:		; la espera; a 0, la musica 0xA6, el byte 0x0E = 0, el 0x1F = 0x14 y el paso siguiente
	dec (ix+00eh)		;b959   ; la espera
	ret nz			;b95c
	call 086c2h		;b95d   ; la musica 0xA6
	ld (ix+00eh),000h		;b960
	ld (ix+01fh),014h		;b964   ; la espera 0x14
paso_siguiente_0c:		; el paso siguiente (byte 1 + 1)
	inc (ix+001h)		;b968   ; un paso mas
	ret			;b96b
copia_0c_48:		; de (0x30, L) 0x30 x C a (0x48, 0) por p00:47ED, con A = 0x48 en la pagina 0 y 0x18 en la 1
	ld a,(0ca42h)		;b96c   ; en la pagina 0...
	and a			;b96f
	ld a,048h		;b970   ; ...la operacion 0x48...
	jr z,copia_0c_48_a		;b972
	ld a,018h		;b974   ; ...en la 1, 0x18
copia_0c_48_a:		; 0x30 de ancho, desde la X 0x30
	ld b,030h		;b976
	ld h,b			;b978
	ld de,04800h		;b979   ; a (0x48, 0)
	jp 047edh		;b97c   ; copia_rectangulo_logica: orden LMMM del VDP con la operacion logica de A
tipo_0c_paso_2:		; tras la espera del byte 0x1F, las dos piezas (p15:B9FA, el dibujo cada 4); con el byte 0x0E desde 0x40, el paso siguiente
	ld a,(ix+01fh)		;b97f   ; la espera
	and a			;b982
	jr z,tipo_0c_piezas		;b983
	dec (ix+01fh)		;b985
	ret nz			;b988
tipo_0c_piezas:		; las piezas con el dibujo cada 4 y, desde 0x40, el paso siguiente
	ld c,003h		;b989   ; el dibujo cada 4
	call dos_piezas		;b98b   ; dos_piezas: las dos piezas (p15:BA14), el byte 0x0E uno mas y, cada C + 1, el dibujo (byte 0x0D) uno mas de 0 a 2
	ld a,(ix+00eh)		;b98e   ; desde 0x40...
	cp 040h		;b991
	ret c			;b993
	jp paso_siguiente_0c		;b994   ; ...el paso siguiente
tipo_0c_paso_3:		; las piezas (el dibujo cada 2 desde 0x50, cada 1 por debajo); el byte 0x0F uno menos: la linea 0x0F de (0, Y) a (0x48, Y) de la otra pagina y (0x30, 0x60 - Y) de alto Y a (0x48, 0); a 0, 0xCB3C = 0, los sprites de p35:670E y el paso siguiente
	ld a,(ix+00fh)		;b997   ; desde 0x50...
	cp 050h		;b99a
	ld c,001h		;b99c   ; ...cada 2...
	jr nc,tipo_0c_baja		;b99e
	dec c			;b9a0   ; ...si no, cada 1
tipo_0c_baja:
	call dos_piezas		;b9a1   ; dos_piezas: las dos piezas (p15:BA14), el byte 0x0E uno mas y, cada C + 1, el dibujo (byte 0x0D) uno mas de 0 a 2
	dec (ix+00fh)		;b9a4   ; el byte 0x0F uno menos
	ld a,(ix+00fh)		;b9a7
	ld l,a			;b9aa   ; la linea de su Y...
	ld e,a			;b9ab
	push af			;b9ac
	ld h,000h		;b9ad   ; ...desde la X 0...
	ld d,048h		;b9af   ; ...a la X 0x48...
	ld bc,03001h		;b9b1   ; ...0x30 x 1
	call 0475ah		;b9b4   ; copia_rectangulo_a_la_otra: p00:4767 de la pagina 0xCA42 a la otra
	pop af			;b9b7
	jr z,tipo_0c_arriba		;b9b8   ; a 0: se acaba
	ld c,(ix+00fh)		;b9ba   ; de la Y 0x60 - el byte 0x0F
	ld a,060h		;b9bd
	sub c			;b9bf
	ld l,a			;b9c0
copia_0c_a_48:		; de (0x30, L) 0x30 x C a (0x48, 0) de la otra pagina
	ld de,04800h		;b9c1   ; a (0x48, 0)
	ld h,030h		;b9c4   ; desde la X 0x30
	ld b,030h		;b9c6   ; 0x30 de ancho
	jp 0475ah		;b9c8   ; copia_rectangulo_a_la_otra: p00:4767 de la pagina 0xCA42 a la otra
tipo_0c_arriba:		; 0xCB3C = 0, los sprites de p35:670E y el paso siguiente
	xor a			;b9cb   ; 0xCB3C = 0
	ld (0cb3ch),a		;b9cc
	call 0504ch		;b9cf   ; los sprites de p35:670E
	jp paso_siguiente_0c		;b9d2   ; paso_siguiente_0c: el paso siguiente (byte 1 + 1)
tipo_0c_paso_4:		; los bytes 0x0F, 0x0D, 0x18 y 9 a 0, el 0x16 = 1, el 7 = 4, el 0x0C = 3, la espera al azar (p15:BB99), los sonidos 0x77 y 5 y el paso siguiente
	xor a			;b9d5
	ld (ix+00fh),a		;b9d6
	ld (ix+00dh),a		;b9d9
	ld (ix+018h),a		;b9dc
	ld (ix+009h),a		;b9df
	inc a			;b9e2   ; el byte 0x16 = 1
	ld (ix+016h),a		;b9e3
	ld (ix+007h),004h		;b9e6   ; el byte 7 = 4
	ld (ix+00ch),003h		;b9ea   ; el byte 0x0C = 3
	call espera_al_azar		;b9ee   ; la espera al azar
	call 06b6dh		;b9f1   ; el sonido 0x77...
	call 06b12h		;b9f4   ; ...y el 5
	jp paso_siguiente_0c		;b9f7   ; paso_siguiente_0c: el paso siguiente (byte 1 + 1)
dos_piezas:		; las dos piezas (p15:BA14), el byte 0x0E uno mas y, cada C + 1, el dibujo (byte 0x0D) uno mas de 0 a 2
	push bc			;b9fa
	call dos_piezas_a		;b9fb   ; las piezas
	pop bc			;b9fe
	inc (ix+00eh)		;b9ff   ; uno mas
	ld a,(ix+00eh)		;ba02
	and c			;ba05   ; cada C + 1...
	ret nz			;ba06
	ld a,(ix+00dh)		;ba07   ; ...el dibujo uno mas...
	inc a			;ba0a
	cp 003h		;ba0b   ; ...hasta 2
	jr c,pon_dibujo_0c		;ba0d
	xor a			;ba0f
pon_dibujo_0c:
	ld (ix+00dh),a		;ba10
	ret			;ba13
dos_piezas_a:		; por el bit 3 del byte 0x0E, las piezas de 8 x 8 de (0x20, 0x70) y (0x38, 0x70) o de (0x50, 0x70) y (0x58, 0x70) a las Y 0x18 y 0x30
	ld a,(ix+00eh)		;ba14   ; por el bit 3...
	and 008h		;ba17
	ld hl,02038h		;ba19   ; ...las X 0x20 y 0x38...
	jr z,L_BA21		;ba1c
	ld hl,05058h		;ba1e   ; ...o 0x50 y 0x58
L_BA21:
	push hl			;ba21
	ld e,018h		;ba22   ; la primera a la Y 0x18
	call pieza_0c		;ba24   ; pieza_0c: una pieza de 8 x 8 de (H, 0x70) a (0x40, E) de la otra pagina, o a (0x58, E) de esta en el paso 2
	pop hl			;ba27
	ld h,l			;ba28   ; la segunda...
	ld e,030h		;ba29   ; ...a la Y 0x30
pieza_0c:		; una pieza de 8 x 8 de (H, 0x70) a (0x40, E) de la otra pagina, o a (0x58, E) de esta en el paso 2
	ld l,070h		;ba2b   ; desde la Y 0x70...
	ld bc,00808h		;ba2d   ; ...8 x 8
	ld a,(ix+001h)		;ba30   ; en el paso 2, p15:BA45
	cp 002h		;ba33
	jr z,pieza_0c_aqui		;ba35
	ld d,040h		;ba37   ; a la X 0x40...
	ld a,(0ca42h)		;ba39   ; ...de la pagina 2 a la otra
	xor 001h		;ba3c
	rlca			;ba3e
	rlca			;ba3f
	or 002h		;ba40
	jp 04767h		;ba42   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
pieza_0c_aqui:		; a (0x58, E) de la pagina de dibujar
	ld d,058h		;ba45   ; a la X 0x58...
	ld a,(0ca42h)		;ba47   ; ...de la pagina 2 a la de dibujar
	rlca			;ba4a
	rlca			;ba4b
	or 002h		;ba4c
	jp 04767h		;ba4e   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
tipo_0c_paso_5:		; su sonido (p15:BB33), el borde (p15:BB42), sus disparos (p15:BBA4), el paso de sala (p15:BAF1); con su tramo (byte 0x0D) mira si llega al final (tabla p15:BAA4, con B = el byte 3, C = el 5, D = el 0x0A, E = el 0x0B) y pasa al siguiente (p15:BA7E); el byte 0x18 cambia de 0 a 1
	call sonido_0c		;ba51   ; el sonido
	call borde_d8b7		;ba54   ; el borde
	call disparo_0c		;ba57   ; los disparos
	call paso_de_sala_0c		;ba5a   ; el paso de sala
	ld a,(ix+00dh)		;ba5d   ; el tramo
	ld b,(ix+003h)		;ba60   ; B = el byte 3
	ld c,(ix+005h)		;ba63   ; C = el byte 5
	ld d,(ix+00ah)		;ba66   ; D = la fila (byte 0x0A)
	ld e,(ix+00bh)		;ba69   ; E = la columna (byte 0x0B)
	ld hl,0baa4h		;ba6c
	call 0424eh		;ba6f   ; se acaba el tramo?
	call c,tramo_siguiente		;ba72   ; si, el siguiente
	ld a,(ix+018h)		;ba75   ; el byte 0x18...
	xor 001h		;ba78   ; ...de 0 a 1 y vuelta
	ld (ix+018h),a		;ba7a
	ret			;ba7d
tramo_siguiente:		; el tramo siguiente (0-7) y sus velocidades de p15:BA94: el byte 7 y el 9
	ld a,(ix+00dh)		;ba7e   ; el tramo...
	inc a			;ba81   ; ...uno mas, de 0 a 7
	and 007h		;ba82
	ld (ix+00dh),a		;ba84
	ld hl,0ba94h		;ba87   ; sus velocidades
	call 043f6h		;ba8a   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld (ix+009h),h		;ba8d   ; el byte 9...
	ld (ix+007h),l		;ba90   ; ...y el 7
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


tramo_0:		; acarreo con la fila 7 y el byte 3 desde 0x40
	ld hl,00740h		;bab4   ; 0x40 en la fila 7
llega_desde:		; acarreo con D = H y B desde L
	ld a,d			;bab7
	cp h			;bab8   ; D distinta: no
	jr nz,no_llega		;bab9
	ld a,b			;babb
	cp l			;babc   ; B desde L...
	ccf			;babd   ; ...acarreo
	ret			;babe
no_llega:		; sin acarreo: no llega
	or a			;babf   ; sin acarreo
	ret			;bac0
tramo_1:		; la fila 7 y el byte 3 desde 0x80
	ld hl,00780h		;bac1
	jr llega_desde		;bac4
tramo_2:		; la columna 8 y el byte 5 desde 0x40
	ld hl,00840h		;bac6
	ld d,e			;bac9   ; la columna...
	ld b,c			;baca   ; ...y el byte 5
	jr llega_desde		;bacb
tramo_3:		; la columna 8 y el byte 5 desde 0x80
	ld hl,00880h		;bacd
	ld d,e			;bad0
	ld b,c			;bad1
	jr llega_desde		;bad2
tramo_4:		; la fila 8 y el byte 3 por debajo de 0x80
	ld hl,00880h		;bad4
llega_antes:		; acarreo con D = H y B por debajo de L
	ld a,d			;bad7
	cp h			;bad8   ; D distinta: no
	jr nz,no_llega		;bad9
	ld a,b			;badb
	cp l			;badc   ; B por debajo de L: acarreo
	ret			;badd
tramo_5:		; la fila 8 y el byte 3 por debajo de 0x40
	ld hl,00840h		;bade
	jr llega_antes		;bae1
tramo_6:		; la columna 7 y el byte 5 por debajo de 0x80
	ld hl,00780h		;bae3
	ld d,e			;bae6
	ld b,c			;bae7
	jr llega_antes		;bae8
tramo_7:		; la columna 7 y el byte 5 por debajo de 0x40
	ld hl,00740h		;baea
	ld d,e			;baed
	ld b,c			;baee
	jr llega_antes		;baef
paso_de_sala_0c:		; con el byte 7 a 0, el byte 5 de 0xC0 a 0xFF pasa de columna (byte 0x0B; uno mas y 0 con el byte 9 positivo, uno menos y 0xC0 con el negativo); si no, el byte 3 pasa de fila (byte 0x0A; uno menos y 0 con el byte 7 positivo, uno mas y 0xC0 con el negativo)
	ld a,(ix+007h)		;baf1
	and a			;baf4   ; con el byte 7, p15:BB15
	jr nz,paso_de_fila_0c		;baf5
	ld a,(ix+005h)		;baf7   ; el byte 5 de 0xC0 a 0xFF?
	sub 0c0h		;bafa
	cp 040h		;bafc
	ret nc			;bafe
	ld a,(ix+009h)		;baff   ; el byte 9 negativo?
	rla			;bb02
	jr c,columna_menos		;bb03
	inc (ix+00bh)		;bb05   ; la columna uno mas...
	ld (ix+005h),000h		;bb08   ; ...y el byte 5 a 0
	ret			;bb0c
columna_menos:		; la columna uno menos y el byte 5 a 0xC0
	dec (ix+00bh)		;bb0d   ; la columna uno menos...
	ld (ix+005h),0c0h		;bb10   ; ...y el byte 5 a 0xC0
	ret			;bb14
paso_de_fila_0c:		; el byte 3 de 0xC0 a 0xFF pasa de fila
	ld a,(ix+003h)		;bb15   ; el byte 3 de 0xC0 a 0xFF?
	sub 0c0h		;bb18
	cp 040h		;bb1a
	ret nc			;bb1c
	ld a,(ix+007h)		;bb1d   ; el byte 7 negativo?
	rla			;bb20
	jr c,fila_mas		;bb21
	dec (ix+00ah)		;bb23   ; la fila uno menos...
	ld (ix+003h),000h		;bb26   ; ...y el byte 3 a 0
	ret			;bb2a
fila_mas:		; la fila uno mas y el byte 3 a 0xC0
	inc (ix+00ah)		;bb2b   ; la fila uno mas...
	ld (ix+003h),0c0h		;bb2e   ; ...y el byte 3 a 0xC0
	ret			;bb32
sonido_0c:		; en las salas desde la 0x10: el sonido 0x36 en su sala, el 0x37 fuera
	ld a,(0ca4bh)		;bb33   ; lee la sala de la zona
	cp 010h		;bb36   ; por debajo de la 0x10, nada
	ret c			;bb38
	call 08100h		;bb39   ; en su sala, el 0x36
	jp z,06af2h		;bb3c   ; sonido_36: pide el sonido 0x36
	jp 06c13h		;bb3f   ; si no, el 0x37
borde_d8b7:		; con 0xD8B7: uno menos y el color del borde (R#7) 0x0F con la cuenta impar, 7 con la par
	ld hl,0d8b7h		;bb42   ; apunta a la cuenta del borde que parpadea, R#7 = 0x0F / 7 (p15:BB42)
	ld a,(hl)			;bb45
	and a			;bb46
	ret z			;bb47   ; sin la cuenta, nada
	dec (hl)			;bb48   ; uno menos
	rra			;bb49
	ld bc,00f07h		;bb4a   ; R#7 = 0x0F...
	jr c,pon_borde		;bb4d
	ld b,007h		;bb4f   ; ...o 7
pon_borde:
	jp 00047h		;bb51   ; BIOS WRTVDP - Writes data in the VDP-register
dispara_0c:		; la espera del byte 0x1F; a 0, en su sala y sin disparo: el disparo dura 0x0C (byte 0x0F), los pasos hacia Snake (16 por encima) en los bytes 0x1B-0x1E (p01:7A4E) y su sitio en 0xD8B3-0xD8B6; otra espera al azar
	dec (ix+01fh)		;bb54   ; la espera
	ret nz			;bb57
	call 08100h		;bb58   ; en_esta_sala: Z si el actor esta en la sala de ahora (fila y columna)
	jr nz,espera_al_azar		;bb5b
	ld a,(ix+00fh)		;bb5d   ; con un disparo, nada
	and a			;bb60
	jr nz,espera_al_azar		;bb61
	ld (ix+00fh),00ch		;bb63   ; 0x0C cuadros
	call 08079h		;bb67   ; hacia Snake...
	ld a,l			;bb6a   ; ...16 mas arriba
	sub 010h		;bb6b
	ld l,a			;bb6d
	ld d,(ix+005h)		;bb6e   ; desde su X...
	ld e,(ix+003h)		;bb71   ; ...y su Y
	ld a,0f0h		;bb74
	ld b,001h		;bb76
	call 07a4eh		;bb78   ; los pasos...
	ld (ix+01eh),h		;bb7b   ; ...a los bytes 0x1E-0x1B
	ld (ix+01dh),l		;bb7e
	ld (ix+01ch),d		;bb81
	ld (ix+01bh),e		;bb84
	ld h,(ix+005h)		;bb87   ; la X (16 bits)...
	ld l,(ix+004h)		;bb8a
	ld (0d8b5h),hl		;bb8d   ; ...a 0xD8B5
	ld h,(ix+003h)		;bb90   ; la Y (16 bits)...
	ld l,(ix+002h)		;bb93
	ld (0d8b3h),hl		;bb96   ; ...a 0xD8B3
espera_al_azar:		; el byte 0x1F = 4-0x0B al azar
	call 04256h		;bb99   ; azar: A = un numero al azar (0xCA03 rotado mas R)
	and 007h		;bb9c   ; 0-7...
	add a,004h		;bb9e   ; ...+ 4
	ld (ix+01fh),a		;bba0
	ret			;bba3
disparo_0c:		; fuera de su sala, sin disparo; sin el, p15:BB54; con el, uno menos y el disparo en su sitio + los pasos por lo que lleva (p15:BBE8): dentro de 8-0xAF, lo lanzado de tipo 7 (p02:9AF4); si no, se acaba
	call 08100h		;bba4   ; en_esta_sala: Z si el actor esta en la sala de ahora (fila y columna)
	jr z,disparo_0c_a		;bba7
	ld (ix+00fh),000h		;bba9   ; fuera: sin disparo
disparo_0c_a:
	ld a,(ix+00fh)		;bbad
	and a			;bbb0
	jr z,dispara_0c		;bbb1   ; sin disparo, p15:BB54
	dec (ix+00fh)		;bbb3   ; uno menos
	ld h,(ix+01eh)		;bbb6   ; el paso en X por lo que lleva...
	ld l,(ix+01dh)		;bbb9
	call por_lo_que_lleva		;bbbc   ; por_lo_que_lleva: HL = HL * 2 * (0x0D - el byte 0x0F); con 0x0C, HL
	ld bc,(0d8b5h)		;bbbf   ; ...+ la X de salida
	add hl,bc			;bbc3
	ex de,hl			;bbc4
	ld h,(ix+01ch)		;bbc5   ; el paso en Y por lo que lleva...
	ld l,(ix+01bh)		;bbc8
	call por_lo_que_lleva		;bbcb   ; por_lo_que_lleva: HL = HL * 2 * (0x0D - el byte 0x0F); con 0x0C, HL
	ld bc,(0d8b3h)		;bbce   ; ...+ la Y de salida
	add hl,bc			;bbd2
	ld l,d			;bbd3   ; L = la X, H = la Y
	ld a,h			;bbd4   ; dentro de 8-0xAF...
	sub 008h		;bbd5
	cp 0a8h		;bbd7
	jr nc,se_acaba_disparo		;bbd9
	ld a,l			;bbdb
	sub 008h		;bbdc
	cp 0a8h		;bbde
	jp c,09af4h		;bbe0   ; ...lo lanzado de tipo 7
se_acaba_disparo:		; el byte 0x0F a 0: sin disparo
	ld (ix+00fh),000h		;bbe3   ; sin disparo
	ret			;bbe7
por_lo_que_lleva:		; HL = HL * 2 * (0x0D - el byte 0x0F); con 0x0C, HL
	ld a,(ix+00fh)		;bbe8   ; lo que lleva: 0x0C - el byte 0x0F
	sub 00ch		;bbeb
	ret z			;bbed
	neg		;bbee
	ld b,a			;bbf0
	add hl,hl			;bbf1   ; * 2
	push de			;bbf2
	ld d,h			;bbf3
	ld e,l			;bbf4
suma_veces:
	add hl,de			;bbf5
	djnz suma_veces		;bbf6   ; B veces mas
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


mapa_zona_7:		; en la zona 7, las salas 2, 3, 4, 8 y 9: trozos de mapa copiados a 0xDD00 (p01:62A5, B filas de C caracteres en (D, E))
	ld a,(0ca4ah)		;bcb4   ; lee la zona
	cp 007h		;bcb7   ; solo la zona 7
	ret nz			;bcb9
	ld a,(0ca4bh)		;bcba   ; sala 2...
	cp 002h		;bcbd
	jr z,mapa_zona_7_sala_2		;bcbf
	cp 003h		;bcc1   ; ...3...
	jr z,mapa_zona_7_sala_3		;bcc3
	cp 004h		;bcc5   ; ...4...
	jp z,mapa_zona_7_sala_4		;bcc7   ; mapa_zona_7_sala_4: la sala 4: 9 trozos
	cp 008h		;bcca   ; ...8...
	jp z,mapa_zona_7_sala_8		;bccc   ; mapa_zona_7_sala_8: la sala 8: 5 trozos
	cp 009h		;bccf   ; ...9
	jp z,mapa_zona_7_sala_9		;bcd1   ; mapa_zona_7_sala_9: (0, 0x20), 2 filas de 4
	ret			;bcd4
mapa_zona_7_sala_2:		; la sala 2: 8 trozos
	ld de,03040h		;bcd5   ; (0x30, 0x40)...
	ld bc,00206h		;bcd8   ; ...2 filas de 6
	call copia_trozo_guarda		;bcdb   ; copia_trozo_guarda: p01:62A5 guardando BC
	ld de,05030h		;bcde   ; (0x50, 0x30)
	call copia_trozo_guarda		;bce1   ; copia_trozo_guarda: p01:62A5 guardando BC
	ld de,09040h		;bce4   ; (0x90, 0x40)
	call 062a5h		;bce7   ; copia_al_mapa_0: p01:62B5 caracter a caracter, sin sumar
	ld de,03050h		;bcea   ; (0x30, 0x50)...
	ld bc,00602h		;bced   ; ...6 filas de 2
	call copia_trozo_guarda		;bcf0   ; copia_trozo_guarda: p01:62A5 guardando BC
	ld de,04070h		;bcf3   ; (0x40, 0x70)
	call 062a5h		;bcf6   ; copia_al_mapa_0: p01:62B5 caracter a caracter, sin sumar
	ld de,08030h		;bcf9   ; (0x80, 0x30)...
	ld bc,00802h		;bcfc   ; ...8 filas de 2
	call 062a5h		;bcff   ; copia_al_mapa_0: p01:62B5 caracter a caracter, sin sumar
	ld de,05090h		;bd02   ; (0x50, 0x90)...
	ld bc,0020eh		;bd05   ; ...2 filas de 0x0E
	jr copia_trozo		;bd08
mapa_zona_7_sala_3:		; la sala 3: 8 trozos
	ld de,00040h		;bd0a   ; (0, 0x40)...
	ld bc,00206h		;bd0d   ; ...2 filas de 6
	call copia_trozo_guarda		;bd10   ; copia_trozo_guarda: p01:62A5 guardando BC
	ld de,09060h		;bd13   ; (0x90, 0x60)
	call 062a5h		;bd16   ; copia_al_mapa_0: p01:62B5 caracter a caracter, sin sumar
	ld de,09000h		;bd19   ; (0x90, 0)...
	ld bc,00402h		;bd1c   ; ...4 filas de 2
	call copia_trozo_guarda		;bd1f   ; copia_trozo_guarda: p01:62A5 guardando BC
	ld de,09070h		;bd22   ; (0x90, 0x70)
	call 062a5h		;bd25   ; copia_al_mapa_0: p01:62B5 caracter a caracter, sin sumar
	ld de,03020h		;bd28   ; (0x30, 0x20)...
	ld bc,00602h		;bd2b   ; ...6 filas de 2
	call 062a5h		;bd2e   ; copia_al_mapa_0: p01:62B5 caracter a caracter, sin sumar
	ld de,04020h		;bd31   ; (0x40, 0x20)...
	ld bc,0020ch		;bd34   ; ...2 filas de 0x0C
	call 062a5h		;bd37   ; copia_al_mapa_0: p01:62B5 caracter a caracter, sin sumar
	ld de,00090h		;bd3a   ; (0, 0x90)...
	ld bc,00218h		;bd3d   ; ...2 filas de 0x18
copia_trozo:		; B filas de C en (D, E)
	jp 062a5h		;bd40   ; copia_al_mapa_0: p01:62B5 caracter a caracter, sin sumar
mapa_zona_7_sala_4:		; la sala 4: 9 trozos
	ld de,06030h		;bd43   ; (0x60, 0x30)...
	ld bc,00206h		;bd46   ; ...2 filas de 6
	call copia_trozo_guarda		;bd49   ; copia_trozo_guarda: p01:62A5 guardando BC
	ld de,00060h		;bd4c   ; (0, 0x60)
	call 062a5h		;bd4f   ; copia_al_mapa_0: p01:62B5 caracter a caracter, sin sumar
	ld de,03060h		;bd52   ; (0x30, 0x60)...
	ld bc,00602h		;bd55   ; ...6 filas de 2
	call copia_trozo_guarda		;bd58   ; copia_trozo_guarda: p01:62A5 guardando BC
	ld de,06050h		;bd5b   ; (0x60, 0x50)
	call copia_trozo_guarda		;bd5e   ; copia_trozo_guarda: p01:62A5 guardando BC
	ld de,09030h		;bd61   ; (0x90, 0x30)
	call 062a5h		;bd64   ; copia_al_mapa_0: p01:62B5 caracter a caracter, sin sumar
	ld de,04000h		;bd67   ; (0x40, 0)...
	ld bc,00804h		;bd6a   ; ...8 filas de 4
	call 062a5h		;bd6d   ; copia_al_mapa_0: p01:62B5 caracter a caracter, sin sumar
	ld de,07050h		;bd70   ; (0x70, 0x50)...
	ld bc,00204h		;bd73   ; ...2 filas de 4
	call 062a5h		;bd76   ; copia_al_mapa_0: p01:62B5 caracter a caracter, sin sumar
	ld bc,00202h		;bd79   ; 2 filas de 2...
	ld de,00090h		;bd7c   ; ...en (0, 0x90)
	jr copia_trozo		;bd7f
mapa_zona_7_sala_8:		; la sala 8: 5 trozos
	ld de,04050h		;bd81   ; (0x40, 0x50)...
	ld bc,00206h		;bd84   ; ...2 filas de 6
	call copia_trozo_guarda		;bd87   ; copia_trozo_guarda: p01:62A5 guardando BC
	ld de,06080h		;bd8a   ; (0x60, 0x80)
	call 062a5h		;bd8d   ; copia_al_mapa_0: p01:62B5 caracter a caracter, sin sumar
	ld bc,00802h		;bd90   ; 8 filas de 2...
	ld de,09080h		;bd93   ; ...en (0x90, 0x80)
	call 062a5h		;bd96   ; copia_al_mapa_0: p01:62B5 caracter a caracter, sin sumar
	ld de,02040h		;bd99   ; (0x20, 0x40)...
	ld bc,00404h		;bd9c   ; ...4 filas de 4
	call 062a5h		;bd9f   ; copia_al_mapa_0: p01:62B5 caracter a caracter, sin sumar
	ld de,02080h		;bda2   ; (0x20, 0x80)...
	ld bc,00408h		;bda5   ; ...4 filas de 8
	jr copia_trozo		;bda8
mapa_zona_7_sala_9:		; (0, 0x20), 2 filas de 4
	ld de,00020h		;bdaa
	ld bc,00204h		;bdad
	jr copia_trozo		;bdb0
copia_trozo_guarda:		; p01:62A5 guardando BC
	push bc			;bdb2
	call 062a5h		;bdb3   ; copia_al_mapa_0: p01:62B5 caracter a caracter, sin sumar
	pop bc			;bdb6
	ret			;bdb7
mira_alerta_d800:		; de las 4 fichas de 0xD800, la primera que da algo por su tipo (p15:BDCE): B = 0 nada, 1 se acaba la alerta, 2 o 3 (p04:9278)
	ld ix,0d800h		;bdb8   ; apunta a 4 fichas de 0x20 bytes de 0xD800 (p04:89C3); sus tipos los lleva p10
	ld b,004h		;bdbc   ; 4 fichas
mira_ficha_d800:
	call por_tipo_d800		;bdbe   ; por_tipo_d800: C por su tipo (tabla p15:BDD8; libre, 0)
	ld a,c			;bdc1   ; algo: se deja
	and a			;bdc2
	jr nz,b_de_bdb8		;bdc3
	ld de,00020h		;bdc5   ; la ficha siguiente (0x20 bytes)
	add ix,de		;bdc8
	djnz mira_ficha_d800		;bdca   ; 4
b_de_bdb8:		; B = C
	ld b,c			;bdcc
	ret			;bdcd
por_tipo_d800:		; C por su tipo (tabla p15:BDD8; libre, 0)
	ld a,(ix+000h)		;bdce
	and a			;bdd1
	jr z,$+58		;bdd2   ; libre: 0
	dec a			;bdd4
	call 0424dh		;bdd5   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_BDD8: 11 destinos del despachador p00:424D (call en p15:BDD5, el
;   indice en A): BE0F, BDFD, BDEE, BE05, BE22, BE2B, BE35, BDFD, BDFD, BDFD,
;   BE0C; lo leen p15:BDD5 (22 bytes)
;   0xbdd8..0xbdee  (22 bytes)
DATA_tabla_BDD8:
	defw 0be0fh,0bdfdh,0bdeeh,0be05h,0be22h,0be2bh,0be35h,0bdfdh	; bdd8
	defw 0bdfdh,0bdfdh,0be0ch	; bde8  -> d800_mira_2 d800_mira_2 da_0

; ======================================================================
; CODIGO 0xbdee..0xbe9e  (176 bytes)
; ======================================================================


d800_mira_3:		; el tipo 3: en su sala, 1 en los pasos 0-1 y 3 desde el 2; fuera, 0
	call 08100h		;bdee   ; en_esta_sala: Z si el actor esta en la sala de ahora (fila y columna)
	jr nz,da_0		;bdf1   ; fuera de su sala: 0
	ld a,(ix+001h)		;bdf3   ; en los pasos 0-1...
	cp 002h		;bdf6
	ld c,001h		;bdf8   ; ...1
	ret c			;bdfa
	jr da_3		;bdfb
d800_mira_2:		; los tipos 2, 8, 9 y 0x0A: en su sala, 2; fuera, 0
	call 08100h		;bdfd   ; en_esta_sala: Z si el actor esta en la sala de ahora (fila y columna)
	jr nz,da_0		;be00
da_2:		; C = 2
	ld c,002h		;be02   ; 2
	ret			;be04
d800_mira_4:		; el tipo 4: en la sala especial 0x29, 2; si no, 0
	ld a,(0ca76h)		;be05   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 029h		;be08
	jr z,da_2		;be0a
da_0:		; C = 0
	ld c,000h		;be0c   ; 0
	ret			;be0e
d800_mira_1:		; el tipo 1: en las salas 0x10-0x13, 1 en el paso 0 y 3 en los demas; si no, 0
	ld a,(0ca4bh)		;be0f   ; lee la sala de la zona
	sub 010h		;be12   ; las salas 0x10-0x13
	cp 004h		;be14
	jr nc,da_0		;be16
da_1_o_3:		; 1 en el paso 0, 3 en los demas
	ld a,(ix+001h)		;be18   ; en el paso 0...
	and a			;be1b
	ld c,001h		;be1c   ; ...1
	ret z			;be1e
da_3:		; C = 3
	ld c,003h		;be1f   ; 3
	ret			;be21
d800_mira_5:		; el tipo 5: en la zona 0x0E, 2; si no, 0
	ld a,(0ca4ah)		;be22   ; lee la zona
	cp 00eh		;be25
	jr z,da_2		;be27
	jr da_0		;be29
d800_mira_6:		; el tipo 6: en la zona 0x0E, 1; si no, 0
	ld a,(0ca4ah)		;be2b   ; lee la zona
	cp 00eh		;be2e
	jr nz,da_0		;be30
	ld c,001h		;be32   ; 1
	ret			;be34
d800_mira_7:		; el tipo 7: en las filas 4-5 y columnas 4-5, 1 en el paso 0 y 3 en los demas; si no, 0
	ld hl,(0ca50h)		;be35   ; lee la fila de la sala en la zona (uno mas al salir por arriba) y el byte siguiente (16 bits)
	ld a,l			;be38   ; la fila 4-5...
	sub 004h		;be39
	cp 002h		;be3b
	jr nc,da_0		;be3d
	ld a,h			;be3f   ; ...la columna 4-5
	sub 004h		;be40
	cp 002h		;be42
	jr nc,da_0		;be44
	jr da_1_o_3		;be46
cuenta_alerta_1:		; la cuenta de la alerta 1 (0xD42B) por el nivel de Snake: la palabra de 0xBE54 (0x78, 0x78, 0x90, 0xA0, 0xA0, 0xA0, 0xC8, 0xC8); la rutina no lleva ret y sigue por esa tabla como instrucciones: sub b deja Z y el ret z del byte 0xC8 vuelve
	ld a,(0cab5h)		;be48   ; por el nivel...
	ld hl,tabla_alerta_1		;be4b   ; ...la palabra de la tabla de 0xBE54...
	call 043f6h		;be4e   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld (0d42bh),hl		;be51   ; ...a la cuenta; sin ret: sigue por la tabla
tabla_alerta_1:		; tabla de 8 palabras (la cuenta por nivel) que tambien se ejecuta: ld a,b / nop / ld a,b / nop / sub b (Z) / ... / ret z
	ld a,b			;be54   ; nivel 0: 0x0078 (tambien ld a,b)
	nop			;be55
	ld a,b			;be56   ; nivel 1: 0x0078
	nop			;be57
	sub b			;be58   ; nivel 2: 0x0090 (sub b: A = 0 y Z)
	nop			;be59
	and b			;be5a   ; nivel 3: 0x00A0 (and b: sigue Z)
	nop			;be5b
	and b			;be5c   ; nivel 4: 0x00A0
	nop			;be5d
	and b			;be5e   ; nivel 5: 0x00A0
	nop			;be5f
	ret z			;be60   ; nivel 6: 0x00C8 (ret z: aqui vuelve)
	nop			;be61
	ret z			;be62   ; nivel 7: 0x00C8
	nop			;be63
sitio_de_d418:		; sin 0xCA77 ni sala especial: acarreo si 0xD418-0xD419 cae cerca (16 en el primero, 0x20 en el segundo) de un sitio de la lista de p15:BE9E de esta zona y sala ([zona][sala][..][..], 0xFF al final)
	ld a,(0ca77h)		;be64
	and a			;be67
	ret nz			;be68   ; con 0xCA77, nada
	ld a,(0ca76h)		;be69   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	and a			;be6c
	ret nz			;be6d   ; en una sala especial, nada
	ld de,0be9eh		;be6e   ; la lista
sitio_de_lista:
	ld h,d			;be71
	ld l,e			;be72
	ld a,(hl)			;be73
	inc a			;be74   ; 0xFF: se acaba
	jr z,ningun_sitio		;be75
	ld a,(0ca4ah)		;be77   ; la zona...
	cp (hl)			;be7a
	jr nz,sitio_siguiente		;be7b
	inc hl			;be7d
	ld a,(0ca4bh)		;be7e   ; ...la sala...
	cp (hl)			;be81
	jr nz,sitio_siguiente		;be82
	inc hl			;be84
	ld a,(0d418h)		;be85   ; ...0xD418 - el byte 2 por debajo de 0x10...
	sub (hl)			;be88
	cp 010h		;be89
	jr nc,sitio_siguiente		;be8b
	inc hl			;be8d
	ld a,(0d419h)		;be8e   ; ...y 0xD419 - el byte 3 por debajo de 0x20: acarreo
	sub (hl)			;be91
	cp 020h		;be92
	ret c			;be94
sitio_siguiente:		; el sitio siguiente de la lista (4 bytes)
	ld a,004h		;be95   ; el siguiente (4 bytes)
	call 04243h		;be97   ; suma_a_de: DE = DE + A
	jr sitio_de_lista		;be9a
ningun_sitio:		; sin acarreo: ninguno
	or a			;be9c   ; sin acarreo
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


se_acaba_alerta:		; Z si se acaba la alerta: con 0xCAA0 por debajo de 4, con la alerta sin su bit 3 y con 0xD444 (o 0xCA77 = 2), las 4 fichas de 0xD300 libres
	ld a,(0caa0h)		;bed7   ; lee cuantos siguen a Snake por su rastro (1-4)
	cp 004h		;beda   ; con 4 que siguen a Snake, no
	jr z,no_se_acaba		;bedc
	ld a,(0ca5fh)		;bede   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	and a			;bee1
	jr z,no_se_acaba		;bee2   ; sin alerta, no
	ld hl,0d7dah		;bee4   ; HL = 0xD7DA (aqui no se lee)
	and 008h		;bee7   ; el bit 3 de la alerta: no
	ret nz			;bee9
	ld a,(0d444h)		;beea   ; con 0xD444...
	and a			;beed
	jr nz,d300_libres		;beee
	ld a,(0ca77h)		;bef0   ; ...o 0xCA77 = 2
	cp 002h		;bef3
	ret nz			;bef5
d300_libres:		; Z si las 4 fichas de 0xD300 estan libres
	ld ix,0d300h		;bef6   ; 4 fichas de 0xD300
	ld b,004h		;befa
d300_libre:
	ld a,(ix+000h)		;befc   ; lee el tipo del actor (0 = libre)
	and a			;beff
	ret nz			;bf00   ; una ocupada: NZ
	ld de,00040h		;bf01   ; la siguiente (0x40 bytes)
	add ix,de		;bf04
	djnz d300_libre		;bf06   ; 4
	xor a			;bf08   ; todas libres: Z
	ret			;bf09
no_se_acaba:		; NZ: no se acaba
	or 001h		;bf0a   ; NZ
	ret			;bf0c
actor_de_alerta:		; la ficha de IX (0x40 bytes) a cero y un actor de tipo 1 en (X = E, Y = D) de esta sala: el byte 0x10 = 3, el 0x1B = C y su direccion (byte 0x0D): con C = 0 (0xD41E - 1) * 2, con 1 (0xD449 - 1) * 2, con 2 0, con mas 2
	exx			;bf0d   ; la ficha...
	push ix		;bf0e
	pop hl			;bf10
	ld bc,0003fh		;bf11   ; ...a cero
	call 04236h		;bf14   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	exx			;bf17
	ld (ix+000h),001h		;bf18   ; el tipo 1
	ld (ix+003h),d		;bf1c   ; la Y = D
	ld (ix+005h),e		;bf1f   ; la X = E
	ld de,(0ca50h)		;bf22   ; la fila...
	ld (ix+00ah),e		;bf26
	ld (ix+00bh),d		;bf29   ; ...y la columna de la sala
	ld (ix+010h),003h		;bf2c   ; el byte 0x10 = 3
	xor a			;bf30   ; el paso y los bytes 0x1C y 0x1F a 0
	ld (ix+001h),a		;bf31
	ld (ix+01ch),a		;bf34
	ld (ix+01fh),a		;bf37
	ld (ix+01bh),c		;bf3a   ; el byte 0x1B = C
	ld hl,0d41eh		;bf3d   ; con C = 0, 0xD41E
	ld a,c			;bf40
	and a			;bf41
	jr z,direccion_de		;bf42
	dec a			;bf44   ; con 1, 0xD449
	ld hl,0d449h		;bf45
	jr z,direccion_de		;bf48
	dec a			;bf4a   ; con 2, 0
	ld c,000h		;bf4b
	jr z,pon_direccion		;bf4d
	ld c,002h		;bf4f   ; con mas, 2
	jr pon_direccion		;bf51
direccion_de:		; la direccion: (el byte de HL - 1) * 2
	ld a,(hl)			;bf53   ; (el byte - 1) * 2
	dec a			;bf54
	add a,a			;bf55
	ld c,a			;bf56
pon_direccion:
	ld (ix+00dh),c		;bf57
	ret			;bf5a
llegada_de_alerta:		; por la sala ((fila - 2) * 2 + columna - 5; desde 3, 4 en la zona 0x0C), 3 bytes de p15:BF89: D = la Y, E = la X y 0xD41E
	ld bc,(0ca50h)		;bf5b   ; lee la fila de la sala en la zona (uno mas al salir por arriba) y el byte siguiente (16 bits)
	ld a,c			;bf5f   ; (fila - 2) * 2...
	sub 002h		;bf60
	add a,a			;bf62
	ld c,a			;bf63
	ld a,b			;bf64   ; ...+ columna - 5
	sub 005h		;bf65
	add a,c			;bf67
	ld c,a			;bf68
	cp 003h		;bf69   ; desde 3...
	jr c,llegada_n		;bf6b
	ld a,(0ca4ah)		;bf6d   ; ...en la zona 0x0C, 4
	cp 00ch		;bf70
	ld a,c			;bf72
	jr nz,llegada_n		;bf73
	ld a,004h		;bf75
llegada_n:		; los 3 bytes de la entrada A de p15:BF89
	ld c,a			;bf77   ; * 3
	add a,a			;bf78
	add a,c			;bf79
	ld hl,0bf89h		;bf7a
	call 0423eh		;bf7d   ; suma_a_hl: HL = HL + A
	ld d,(hl)			;bf80   ; D = la Y
	inc hl			;bf81
	ld e,(hl)			;bf82   ; E = la X
	inc hl			;bf83
	ld a,(hl)			;bf84   ; y 0xD41E
	ld (0d41eh),a		;bf85   ; guarda la direccion de llegada de los actores de la alerta + 1 (p15:BF85)
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


numero_a_cifras:		; A (0-99) en dos cifras de 8 x 8 de (0x68 + 8 * cifra, 0x68): las decenas en (0xCF, 0x40) y las unidades en (0xD5, 0x40), con la operacion 0xC8 (0xD8 en la pagina 1)
	ld b,000h		;bf98
cuenta_decenas:		; B = las decenas, A = las unidades
	cp 00ah		;bf9a   ; las decenas a B
	jr c,en_bcd		;bf9c
	sub 00ah		;bf9e
	inc b			;bfa0
	jr cuenta_decenas		;bfa1
en_bcd:		; las decenas al nibble alto
	sla b		;bfa3
	sla b		;bfa5
	sla b		;bfa7
	sla b		;bfa9
	or b			;bfab
	push af			;bfac
	rrca			;bfad   ; las decenas...
	rrca			;bfae
	rrca			;bfaf
	rrca			;bfb0
	and 00fh		;bfb1
	ld de,0cf40h		;bfb3   ; ...en (0xCF, 0x40)
	call cifra_8x8		;bfb6   ; cifra_8x8: la cifra A de (0x68 + 8 * A, 0x68)...
	pop af			;bfb9
	and 00fh		;bfba   ; las unidades...
	ld de,0d540h		;bfbc   ; ...en (0xD5, 0x40)
cifra_8x8:		; la cifra A de (0x68 + 8 * A, 0x68)...
	add a,a			;bfbf
	add a,a			;bfc0
	add a,a			;bfc1
	add a,068h		;bfc2
	ld h,a			;bfc4
	ld l,068h		;bfc5
	ld bc,00808h		;bfc7   ; ...8 x 8
	ld a,(0ca42h)		;bfca   ; en la pagina 0, la operacion 0xC8...
	and a			;bfcd
	ld a,0c8h		;bfce
	jr z,L_BFD4		;bfd0
	ld a,0d8h		;bfd2   ; ...en la 1, 0xD8
L_BFD4:
	jp 047edh		;bfd4   ; copia_rectangulo_logica: orden LMMM del VDP con la operacion logica de A

; ----------------------------------------------------------------------
; DATOS sin identificar  0xbfd7..0xc000  (41 bytes)
DATA_BFD7:
	defb 080h,060h,080h,07fh,080h,060h,080h,040h,080h,020h,080h,000h,080h,0e0h,080h,0c0h	; bfd7  .`...`.@. ......
	defb 080h,0a0h,080h,0a0h,080h,0c0h,080h,0e0h,080h,000h,080h,080h,080h,080h,080h,080h	; bfe7  ................
	defb 080h,010h,080h,080h,080h,080h,080h,080h,080h	; bff7  .........
