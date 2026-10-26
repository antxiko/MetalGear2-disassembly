; ==========================================================================
; METAL GEAR 2 SOLID SNAKE - Konami (1990) - MSX2 - MegaROM RC-767 de 512 KB (Konami SCC) - banco 10 (se ejecuta en 0xa000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x0a000


; ======================================================================
; CODIGO 0xa000..0xa054  (84 bytes)
; ======================================================================


ca61_de_la_sala:		; 0xE1D5 = 0; en un sitio, 0xCA61 = 1; con 0xD8C0, 2; si no, 0xCAB2 = 0xF0 y 0xCAB0 = el modo de esta sala en p10:A054 ([zona][sala][modo], la sala 0x39 es la especial; 0xFF acaba), 2 si no esta
	xor a			;a000
	ld (0e1d5h),a		;a001   ; 0xE1D5 = 0
	ld a,(0ca65h)		;a004   ; en un sitio...
	or a			;a007
	jr nz,ca61_1		;a008   ; en un sitio: 1
	ld a,(0d8c0h)		;a00a   ; con 0xD8C0...
	or a			;a00d
	jr nz,ca61_2		;a00e   ; con 0xD8C0: 2
	ld hl,0cab2h		;a010   ; la cuenta de 0xF0
	ld (hl),0f0h		;a013
	ld hl,0a054h		;a015   ; la lista de p10:A054
modo_de_a054:
	push hl			;a018
	ld a,(hl)			;a019
	cp 0ffh		;a01a   ; 0xFF: no esta
	jr z,modo_2		;a01c   ; 0xFF: ninguna
	ld a,(0ca4ah)		;a01e   ; lee la zona
	cp (hl)			;a021   ; la zona...
	jr nz,siguiente_a054		;a022   ; su zona...
	inc hl			;a024
	ld a,(hl)			;a025   ; ...y la sala (o la especial)
	cp 039h		;a026   ; ...la 0x39 es la sala especial...
	ld a,(0ca76h)		;a028   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	jr z,sala_de_a054		;a02b
	ld a,(0ca4bh)		;a02d   ; ...si no, la sala
sala_de_a054:
	cp (hl)			;a030
	jr nz,siguiente_a054		;a031   ; otra: la siguiente
	inc hl			;a033
	ld a,(hl)			;a034   ; su modo
	ld (0cab0h),a		;a035   ; el modo
	pop hl			;a038
	ret			;a039
siguiente_a054:
	pop hl			;a03a
	ld a,003h		;a03b   ; la siguiente (3 bytes)
	call 0423eh		;a03d   ; suma_a_hl: HL = HL + A
	jr modo_de_a054		;a040
modo_2:
	pop hl			;a042
	ld a,002h		;a043   ; el modo 2
	ld (0cab0h),a		;a045   ; guarda el modo de 0xCA61 en esta sala (0-2, p10:A054)
ca61_1:		; 0xCA61 = 1
	ld hl,0ca61h		;a048   ; apunta a 1-4: elige las rachas de p01:6F27 y la caja de p07:B889 (al azar cada 0xF0 cuadros en la mayoria de salas, p10:A0BB)
	ld (hl),001h		;a04b   ; 1
	ret			;a04d
ca61_2:		; 0xCA61 = 2
	ld hl,0ca61h		;a04e   ; apunta a 1-4: elige las rachas de p01:6F27 y la caja de p07:B889 (al azar cada 0xF0 cuadros en la mayoria de salas, p10:A0BB)
	ld (hl),002h		;a051   ; 2
	ret			;a053

; ----------------------------------------------------------------------
; DATOS resto_A054: lo apuntan con el banco puesto p10:A015 (0xA054); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p10:A015 (19 bytes)
;   0xa054..0xa067  (19 bytes)
DATA_resto_A054:
	defb 00eh,004h,001h,00eh,005h,001h,013h,039h,001h,012h,008h,001h,001h,008h,001h,00dh	; a054  .......9........
	defb 005h,000h,0ffh	; a064

; ======================================================================
; CODIGO 0xa067..0xa07c  (21 bytes)
; ======================================================================


ca61_cada_cuadro:		; fuera de los sitios, de 0xD8C0 y sin 0xDFF8: por el modo 0xCAB0 (p10:A07C)
	ld a,(0ca65h)		;a067   ; lee el sitio de 0xCBE0 en el que esta Snake (0 = ninguno)
	or a			;a06a   ; en un sitio, nada
	ret nz			;a06b   ; en un sitio, nada
	ld a,(0d8c0h)		;a06c   ; lee 1 con Snake dentro de lo de 0xD8C2 (p07:A40D; 0 al salir, p07:A69A)
	or a			;a06f   ; con 0xD8C0, nada
	ret nz			;a070   ; con 0xD8C0, nada
	ld a,(0dff8h)		;a071   ; lee con el, la caja de 0xDFFD/0xDFFE choca (p07:B149)
	or a			;a074   ; con 0xDFF8, nada
	ret nz			;a075   ; con 0xDFF8, nada
	ld a,(0cab0h)		;a076   ; lee el modo de 0xCA61 en esta sala (0-2, p10:A054)
	call 0424dh		;a079   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_A07C: 3 destinos del despachador p00:424D (call en p10:A079, el
;   indice en A): A088, A082, A0BB; lo leen p10:A079 (6 bytes)
;   0xa07c..0xa082  (6 bytes)
DATA_tabla_A07C:
	defw 0a088h,0a082h,0a0bbh	; a07c  -> modo_0 modo_1 modo_2_cada_cuadro

; ======================================================================
; CODIGO 0xa082..0xa08e  (12 bytes)
; ======================================================================


modo_1:		; el modo 1: 0xCA61 = 2
	ld hl,0ca61h		;a082   ; apunta a 1-4: elige las rachas de p01:6F27 y la caja de p07:B889 (al azar cada 0xF0 cuadros en la mayoria de salas, p10:A0BB)
	ld (hl),002h		;a085   ; 2
	ret			;a087
modo_0:		; el modo 0: por su paso 0xCAB1 (p10:A08E)
	ld a,(0cab1h)		;a088   ; lee el paso del modo 0 de 0xCA61
	call 0424dh		;a08b   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_A08E: 3 destinos del despachador p00:424D (call en p10:A08B, el
;   indice en A): A094, A0A1, A0B0; lo leen p10:A08B (6 bytes)
;   0xa08e..0xa094  (6 bytes)
DATA_tabla_A08E:
	defw 0a094h,0a0a1h,0a0b0h	; a08e  -> modo_0_paso_0 modo_0_paso_1 modo_0_paso_2

; ======================================================================
; CODIGO 0xa094..0xa2b3  (543 bytes)
; ======================================================================


modo_0_paso_0:		; 0xCA61 = 2, el paso siguiente y 0xCAB2 = 0xFF
	ld hl,0ca61h		;a094   ; apunta a 1-4: elige las rachas de p01:6F27 y la caja de p07:B889 (al azar cada 0xF0 cuadros en la mayoria de salas, p10:A0BB)
	ld (hl),002h		;a097   ; 2
	ld hl,0cab1h		;a099   ; apunta a el paso del modo 0 de 0xCA61
	inc (hl)			;a09c   ; el paso siguiente...
	inc hl			;a09d
	ld (hl),0ffh		;a09e   ; ...0xCAB2 = 0xFF
	ret			;a0a0
modo_0_paso_1:		; al acabar la cuenta, el paso siguiente y 0xCA61 = 1
	ld hl,0cab2h		;a0a1   ; apunta a la cuenta del modo de 0xCA61
	dec (hl)			;a0a4   ; la cuenta...
	ret nz			;a0a5
	ld hl,0cab1h		;a0a6   ; apunta a el paso del modo 0 de 0xCA61
	inc (hl)			;a0a9   ; ...el paso siguiente...
	ld hl,0ca61h		;a0aa   ; apunta a 1-4: elige las rachas de p01:6F27 y la caja de p07:B889 (al azar cada 0xF0 cuadros en la mayoria de salas, p10:A0BB)
	ld (hl),001h		;a0ad   ; ...0xCA61 = 1
	ret			;a0af
modo_0_paso_2:		; con 0xCB21 = 1, 0xE1D5 = 1
	ld a,(0cb21h)		;a0b0   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	dec a			;a0b3
	ret nz			;a0b4   ; sin 0xCB21 = 1, nada
	ld hl,0e1d5h		;a0b5
	ld (hl),001h		;a0b8   ; 0xE1D5 = 1
	ret			;a0ba
modo_2_cada_cuadro:		; cada 0xF0 cuadros, 0xCA61 = 1-4 al azar (los cuadros / 4 con R)
	ld hl,0cab2h		;a0bb   ; apunta a la cuenta del modo de 0xCA61
	dec (hl)			;a0be   ; la cuenta...
	ret nz			;a0bf   ; ...cada 0xF0 cuadros
	ld (hl),0f0h		;a0c0   ; otros 0xF0
	ld a,(0ca03h)		;a0c2   ; el contador / 4...
	rra			;a0c5
	rra			;a0c6
	ld b,a			;a0c7   ; B = los cuadros / 4
	ld a,r		;a0c8   ; ...con R...
	xor b			;a0ca   ; con R
	rlca			;a0cb
	and 003h		;a0cc
	inc a			;a0ce   ; ...1-4
	ld (0ca61h),a		;a0cf   ; guarda 1-4: elige las rachas de p01:6F27 y la caja de p07:B889 (al azar cada 0xF0 cuadros en la mayoria de salas, p10:A0BB)
	ret			;a0d2
cab6_de_la_sala:		; p10:A10F y, sin 0xCAB6, p10:A0DB
	call ca9b_de_la_sala		;a0d3   ; ca9b_de_la_sala: 0xCA9B = 0; en la zona 0x0A: en las salas 0x0B, 0x0C, 0x10 y 0x11, 0xCA9B = 1; en las filas 3 y 6, 0xCB28 = 0 y 0xCB29 = 0x20
	ld a,(0cab6h)		;a0d6   ; lee 1 con la cuenta de 0xCAB7 en marcha (sala especial 0x11, p10:A0F8)
	or a			;a0d9
	ret nz			;a0da   ; con 0xCAB6, nada mas
ca8e_de_la_sala:		; 0xCA8E = 0; en la zona 4: en la sala 9, 0xCA8E = 2; en la sala especial 0x11, 0xCA8E = 1, 0xCAB6 = 1 con su cuenta de 0x1000 y p10:A19E en (0xA0, 0x90); y 0xCA8C = 0x40
	ld hl,0ca8eh		;a0db   ; apunta a 1-2: hacia donde va 0xCA89 (0 o 4; p10:A0DB)
	ld (hl),000h		;a0de   ; 0xCA8E = 0
	ld a,(0ca4ah)		;a0e0   ; lee la zona
	cp 004h		;a0e3
	ret nz			;a0e5   ; solo en la zona 4
	ld b,002h		;a0e6   ; 2...
	ld a,(0ca4bh)		;a0e8   ; lee la sala de la zona
	cp 009h		;a0eb   ; sala 9
	jr z,pon_ca8e		;a0ed   ; ...en la sala 9
	ld a,(0ca76h)		;a0ef   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 011h		;a0f2   ; la especial 0x11
	ret nz			;a0f4   ; fuera de la especial 0x11, nada
	dec b			;a0f5   ; 1
	ld a,001h		;a0f6   ; 0xCAB6 = 1
	ld (0cab6h),a		;a0f8   ; guarda 1 con la cuenta de 0xCAB7 en marcha (sala especial 0x11, p10:A0F8)
	push bc			;a0fb
	call cuenta_cab7		;a0fc   ; su cuenta
	push hl			;a0ff
	ld hl,090a0h		;a100   ; en (0xA0, 0x90)
	call mosaico_de_d8a4		;a103   ; mosaico_de_d8a4: con 0xCB21 = 0x20-0x22: borra el sitio de 0xD8A4 (p10:B3E5) y copia 0x10 x 0x10 de HL ahi (operacion 0xC8)
	pop hl			;a106
	pop bc			;a107
pon_ca8e:
	ld (hl),b			;a108   ; 0xCA8E
	ld a,040h		;a109   ; 0xCA8C = 0x40
	ld (0ca8ch),a		;a10b   ; guarda la cuenta de 8/16 cuadros de 0xCA89
	ret			;a10e
ca9b_de_la_sala:		; 0xCA9B = 0; en la zona 0x0A: en las salas 0x0B, 0x0C, 0x10 y 0x11, 0xCA9B = 1; en las filas 3 y 6, 0xCB28 = 0 y 0xCB29 = 0x20
	ld hl,0ca9bh		;a10f
	ld (hl),000h		;a112   ; 0xCA9B = 0
	ld a,(0ca4ah)		;a114   ; lee la zona
	cp 00ah		;a117
	ret nz			;a119   ; solo en la zona 0x0A
	ld a,(0ca4bh)		;a11a   ; lee la sala de la zona
	cp 010h		;a11d   ; las salas 0x10...
	jr z,ca9b_a_1		;a11f
	cp 011h		;a121   ; ...0x11...
	jr z,ca9b_a_1		;a123
	cp 00bh		;a125   ; ...0x0B...
	jr z,ca9b_a_1		;a127
	cp 00ch		;a129   ; ...0x0C: 0xCA9B = 1
	jr z,ca9b_a_1		;a12b
	ld a,(0ca50h)		;a12d   ; las filas 3...
	cp 003h		;a130
	jr z,cb28_cb29_20		;a132
	cp 006h		;a134   ; ...y 6
	ret nz			;a136
cb28_cb29_20:
	ld hl,0cb28h		;a137
	ld (hl),000h		;a13a   ; 0xCB28 = 0...
	inc l			;a13c
	ld (hl),020h		;a13d   ; ...0xCB29 = 0x20
	ret			;a13f
ca9b_a_1:
	ld (hl),001h		;a140   ; 0xCA9B = 1
	ret			;a142
cb39_cb3f:		; sin el bit 2 de 0xD7D5 y con el 4, con 0xCB3F y sin 0xCB39: 0xCB39 = 1, el bit 3 de 0xD7D5 y 0xCB3A = 0x1000
	ld a,(0d7d5h)		;a143
	and 004h		;a146
	ret nz			;a148   ; con el bit 2, nada
	ld a,(0d7d5h)		;a149
	bit 4,a		;a14c
	ret z			;a14e   ; sin el 4, nada
	ld a,(0cb3fh)		;a14f   ; lee en la zona 6, lo que hay bajo Snake: 1 con los caracteres 0x90-0xB3, 2 con 0xB8-0xDB (3 con 0xCAAA)
	or a			;a152
	ret z			;a153   ; sin 0xCB3F, nada
	ld hl,0cb39h		;a154
	ld a,(hl)			;a157   ; 0xCB39...
	or a			;a158
	ret nz			;a159   ; ya con 0xCB39, nada
	ld (hl),001h		;a15a   ; ...= 1
	ld hl,0d7d5h		;a15c
	set 3,(hl)		;a15f   ; el bit 3 de 0xD7D5
	ld hl,01000h		;a161   ; 0xCB3A = 0x1000
	ld (0cb3ah),hl		;a164
	ret			;a167
cuenta_cab7:		; 0xCAB7 = 0x1000
	ld de,01000h		;a168
	ld (0cab7h),de		;a16b   ; guarda cuenta de 16 bits de 0xCAB6
	ret			;a16f
cab6_cuenta:		; en la sala especial 0x11, 0xCAB7 = 0x1000; con 0xCAB6 (salvo en la zona 4 sala 9), la cuenta de 0xCAB7; al acabar, 0xCAB6 = 0, p10:A0DB y p10:A19E en (0xA0, 0x80)
	ld a,(0ca76h)		;a170   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 011h		;a173   ; la especial 0x11
	jr z,cuenta_cab7		;a175
	ld a,(0cab6h)		;a177   ; lee 1 con la cuenta de 0xCAB7 en marcha (sala especial 0x11, p10:A0F8)
	or a			;a17a
	ret z			;a17b   ; sin 0xCAB6, nada
	ld a,(0ca4ah)		;a17c   ; lee la zona
	cp 004h		;a17f   ; zona 4...
	jr nz,baja_cab7		;a181
	ld a,(0ca4bh)		;a183   ; lee la sala de la zona
	cp 009h		;a186   ; ...sala 9: se acaba
	jr z,cab6_acaba		;a188
baja_cab7:
	ld hl,(0cab7h)		;a18a   ; lee cuenta de 16 bits de 0xCAB6
	dec hl			;a18d   ; uno menos
	ld (0cab7h),hl		;a18e   ; guarda cuenta de 16 bits de 0xCAB6
	ld a,h			;a191
	or l			;a192
	ret nz			;a193   ; aun no
cab6_acaba:
	xor a			;a194
	ld (0cab6h),a		;a195   ; 0xCAB6 = 0
	call ca8e_de_la_sala		;a198   ; ca8e_de_la_sala: 0xCA8E = 0; en la zona 4: en la sala 9, 0xCA8E = 2; en la sala especial 0x11, 0xCA8E = 1, 0xCAB6 = 1 con su cuenta de 0x1000 y p10:A19E en (0xA0, 0x90); y 0xCA8C = 0x40
	ld hl,080a0h		;a19b   ; en (0xA0, 0x80)
mosaico_de_d8a4:		; con 0xCB21 = 0x20-0x22: borra el sitio de 0xD8A4 (p10:B3E5) y copia 0x10 x 0x10 de HL ahi (operacion 0xC8)
	ld a,(0cb21h)		;a19e   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	cp 020h		;a1a1
	ret c			;a1a3   ; por debajo de 0x20, nada
	cp 023h		;a1a4
	ret nc			;a1a6   ; desde 0x23, nada
	push hl			;a1a7
	ld hl,0d8a4h		;a1a8   ; el sitio de 0xD8A4...
	call borra_sitio_de_hl		;a1ab   ; ...borrado
	pop hl			;a1ae
	ld de,0d8a4h		;a1af   ; a 0xD8A4
	ld a,(0ca42h)		;a1b2   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	rlca			;a1b5
	rlca			;a1b6
	rlca			;a1b7
	rlca			;a1b8
	or 0c8h		;a1b9   ; con la operacion 0xC8
	ld bc,01010h		;a1bb   ; 0x10 x 0x10
	jp 047edh		;a1be   ; copia_rectangulo_logica: orden LMMM del VDP con la operacion logica de A
ca7b_empieza:		; 0xCA7B = 1, 0xCA7C-0xCA7D = 0x0200 y el bit 7 de 0xD7D7
	ld hl,0ca7bh		;a1c1   ; apunta a 0-3: el paso de la cosa 0x0E (p10:A1D2)
	ld (hl),001h		;a1c4   ; 0xCA7B = 1
	inc hl			;a1c6
	ld (hl),000h		;a1c7   ; 0xCA7C-0xCA7D = 0x0200
	inc hl			;a1c9
	ld (hl),002h		;a1ca
	ld hl,0d7d7h		;a1cc
	set 7,(hl)		;a1cf   ; el bit 7 de 0xD7D7
	ret			;a1d1
ca7b_cada_cuadro:		; con 0xCA7B en 1 o 2: la cuenta de 0xCA7C-0xCA7D; al acabar, 0xCA7B uno mas (en el 1, otra cuenta de 0x200) y el mosaico de 0xD8A4 segun 0xCA7B (p10:A204); al acabar el 2, ademas la ficha 0xE1D8 (p10:A234)
	ld a,(0ca7bh)		;a1d2   ; lee 0-3: el paso de la cosa 0x0E (p10:A1D2)
	or a			;a1d5
	ret z			;a1d6   ; sin 0xCA7B, nada
	cp 003h		;a1d7
	ret z			;a1d9   ; en el 3, nada
	dec a			;a1da
	jr z,ca7b_1		;a1db   ; en el 1, aparte
	ld hl,(0ca7ch)		;a1dd   ; la cuenta
	dec hl			;a1e0   ; uno menos
	ld (0ca7ch),hl		;a1e1   ; guarda la cuenta de 16 bits de 0xCA7B
	ld a,h			;a1e4
	or l			;a1e5
	ret nz			;a1e6
	ld hl,0ca7bh		;a1e7   ; al acabar, el 3...
	inc (hl)			;a1ea
	call mosaico_de_ca7b		;a1eb   ; ...el mosaico...
	jr ficha_e1d8		;a1ee   ; ...y la ficha 0xE1D8
ca7b_1:		; la cuenta
	ld hl,(0ca7ch)		;a1f0   ; lee la cuenta de 16 bits de 0xCA7B
	dec hl			;a1f3   ; uno menos
	ld (0ca7ch),hl		;a1f4   ; guarda la cuenta de 16 bits de 0xCA7B
	ld a,h			;a1f7
	or l			;a1f8
	ret nz			;a1f9   ; aun no
	ld hl,0ca7bh		;a1fa   ; al acabar, el 2...
	inc (hl)			;a1fd   ; al 2
	inc hl			;a1fe   ; ...y otra cuenta de 0x200
	ld (hl),000h		;a1ff   ; otros 0x200
	inc hl			;a201
	ld (hl),002h		;a202
mosaico_de_ca7b:		; con 0xCB21 = 0x0E: borra el sitio de 0xD8A4 y copia ahi el de (0x90, 0xB0) (0xCA7B 0-1), (0x90, 0xC0) (2) o (0x90, 0xD0) (3)
	ld a,(0cb21h)		;a204   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	cp 00eh		;a207
	ret nz			;a209   ; sin 0x0E, nada
	call borra_d8a4		;a20a   ; borra
	ld hl,0b090h		;a20d   ; (0x90, 0xB0)...
	ld a,(0ca7bh)		;a210   ; lee 0-3: el paso de la cosa 0x0E (p10:A1D2)
	or a			;a213
	jr z,copia_a_d8a4		;a214
	dec a			;a216
	jr z,copia_a_d8a4		;a217
	ld h,0c0h		;a219   ; ...(0x90, 0xC0)...
	dec a			;a21b
	jr z,copia_a_d8a4		;a21c
	ld h,0d0h		;a21e   ; ...(0x90, 0xD0)
copia_a_d8a4:
	ld de,0d8a4h		;a220
	ld a,(0ca42h)		;a223   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	rlca			;a226
	rlca			;a227
	rlca			;a228
	rlca			;a229
	and 0f0h		;a22a
	or 0c8h		;a22c
	ld bc,01010h		;a22e   ; 16 x 16
	jp 047edh		;a231   ; copia_rectangulo_logica: orden LMMM del VDP con la operacion logica de A
ficha_e1d8:		; la ficha 0xE1D8: 1, 0x80, 0x18, 0x18; el bit 5 de 0xD7D7 y fuera el 0 de 0xD7E2
	ld hl,0e1d8h		;a234   ; apunta a el tramo de la ficha de p10:A234 (0 = ninguna; 0xE1DA-0xE1DB su sitio)
	ld (hl),001h		;a237   ; activa
	inc hl			;a239
	ld (hl),080h		;a23a   ; la cuenta 0x80
	inc hl			;a23c
	ld (hl),018h		;a23d   ; Y = 0x18
	inc hl			;a23f
	ld (hl),018h		;a240   ; X = 0x18
	ld hl,0d7d7h		;a242
	set 5,(hl)		;a245   ; el bit 5 de 0xD7D7
	ld hl,0d7e2h		;a247
	res 0,(hl)		;a24a   ; fuera el 0 de 0xD7E2
	ret			;a24c
e1d8_cada_cuadro:		; con 0xE1D8, la cuenta de 0xE1D9 (a 0, 0x80); en 3, 2 y 1, si se tiene la cosa 0x22 (0xD6BC), 0x21 (0xD6B8) o 0x20 (0xD6B4), p03:BEB7 y p03:BEB2; si se acaba, a cero y, con ella en 0xCB21, borra el sitio de 0xD8A4
	ld a,(0e1d8h)		;a24d   ; lee el tramo de la ficha de p10:A234 (0 = ninguna; 0xE1DA-0xE1DB su sitio)
	or a			;a250
	ret z			;a251   ; sin ficha, nada
	ld hl,0e1d9h		;a252   ; la cuenta
	dec (hl)			;a255
	jr z,cuenta_80		;a256   ; a 0, otra vuelta
	ld a,(hl)			;a258   ; en 3: la 0x22...
	ld hl,0d6bch		;a259
	ld b,022h		;a25c
	dec a			;a25e
	jr z,cosa_e1d8		;a25f
	ld hl,0d6b8h		;a261   ; ...en 2: la 0x21...
	dec b			;a264
	dec a			;a265
	jr z,cosa_e1d8		;a266
	ld hl,0d6b4h		;a268   ; ...en 1: la 0x20
	dec b			;a26b
	dec a			;a26c
	ret nz			;a26d
cosa_e1d8:
	ld a,(hl)			;a26e
	or a			;a26f   ; sin ella, nada
	ret z			;a270   ; sin ella, nada
	push hl			;a271
	push bc			;a272
	ld a,b			;a273
	call 092d2h		;a274   ; p03:BEB7
	pop af			;a277
	push af			;a278
	call 092dbh		;a279   ; p03:BEB2
	pop bc			;a27c
	pop hl			;a27d
	ret nc			;a27e   ; sin acarreo, nada
	ld (hl),000h		;a27f   ; se acaba
	ld a,(0cb21h)		;a281   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	cp b			;a284   ; en uso...
	ret nz			;a285
borra_d8a4:		; borra el sitio de 0xD8A4
	ld hl,0d8a4h		;a286
	jp borra_sitio_de_hl		;a289   ; borra_sitio_de_hl: 0x18 x 0x10 en HL y 8 x 0x10 en HL - 8 al color 0x99
cuenta_80:
	ld (hl),080h		;a28c   ; 0x80
	ret			;a28e
e1d8_paso:		; con 0xE1D8: p10:A29D, p10:A376 y p10:A31B
	ld a,(0e1d8h)		;a28f   ; lee el tramo de la ficha de p10:A234 (0 = ninguna; 0xE1DA-0xE1DB su sitio)
	or a			;a292
	ret z			;a293   ; sin ficha, nada
	call e1dc_cuenta		;a294   ; e1dc_cuenta: con 0xE1DC, la cuenta de 0xE1D9; al acabar, 0xE1DC = 0 y el paso de 0xE1D8 (p10:A2B3)
	call e1d8_toca_cosas		;a297   ; e1d8_toca_cosas: sin 0xE1DC: las cosas 0x20, 0x21 y 0x22 (p10:A401, A45D, A467); con 0xD704 = 0x0E y un disparo, si esta en el sitio de 0xCA84 (p10:A3D4): 0xCA7B = 0xE1D8 = 0, la cosa 0x0E a cero, el bit 4 de 0xD7D7, fuera el 7 de 0xD7DF, el sitio de 0xCA84 borrado, p10:AFF3 con 0x0E, p10:A471, los sprites 0-3 fuera y el sitio de 0xD8A4 borrado
	jp e1d8_sprites		;a29a   ; e1d8_sprites: con 0xE1D8, sus dos sprites (p10:A325) y sus colores 0x0D y 0x4E (p10:A361)
e1dc_cuenta:		; con 0xE1DC, la cuenta de 0xE1D9; al acabar, 0xE1DC = 0 y el paso de 0xE1D8 (p10:A2B3)
	ld a,(0e1dch)		;a29d   ; lee 1 mientras la ficha 0xE1D8 tiembla (p10:A419)
	or a			;a2a0
	jr z,e1d8_tramo		;a2a1   ; sin 0xE1DC, el tramo
	ld hl,0e1d9h		;a2a3   ; apunta a la cuenta de la ficha 0xE1D8
	dec (hl)			;a2a6   ; la cuenta...
	ret nz			;a2a7
	xor a			;a2a8   ; ...a cero, 0xE1DC = 0
	ld (0e1dch),a		;a2a9   ; guarda 1 mientras la ficha 0xE1D8 tiembla (p10:A419)
e1d8_tramo:		; el tramo 0xE1D8 - 1 (p10:A2B3, 17): mueve 0xE1DA o 0xE1DB de uno en uno hasta un valor y pasa al siguiente; el 17 vuelve al 1
	ld a,(0e1d8h)		;a2ac   ; lee el tramo de la ficha de p10:A234 (0 = ninguna; 0xE1DA-0xE1DB su sitio)
	dec a			;a2af   ; el tramo - 1
	call 0424dh		;a2b0   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_A2B3: 17 destinos del despachador p00:424D (call en p10:A2B0, el
;   indice en A): A2DB, A2E8, A2E0, A2ED, A2DB, A2F2, A2E0, A2F7, A2DB, A2FC,
;   A2E0, A301, A2DB, A306, A2E0, A30B, A2D5; lo leen p10:A2B0 (34 bytes)
;   0xa2b3..0xa2d5  (34 bytes)
DATA_tabla_A2B3:
	defw 0a2dbh,0a2e8h,0a2e0h,0a2edh,0a2dbh,0a2f2h,0a2e0h,0a2f7h	; a2b3
	defw 0a2dbh,0a2fch,0a2e0h,0a301h,0a2dbh,0a306h,0a2e0h,0a30bh	; a2c3
	defw 0a2d5h	; a2d3  -> e1d8_al_1

; ======================================================================
; CODIGO 0xa2d5..0xa61b  (838 bytes)
; ======================================================================


e1d8_al_1:		; 0xE1D8 = 1
	ld hl,0e1d8h		;a2d5   ; apunta a el tramo de la ficha de p10:A234 (0 = ninguna; 0xE1DA-0xE1DB su sitio)
	ld (hl),001h		;a2d8   ; 0xE1D8 = 1
	ret			;a2da
e1da_a_78:		; 0xE1DA + 1 hasta 0x78
	ld bc,00178h		;a2db
	jr mueve_e1da		;a2de
e1da_a_18:		; 0xE1DA - 1 hasta 0x18
	ld bc,0ff18h		;a2e0
mueve_e1da:
	ld hl,0e1dah		;a2e3   ; apunta a la Y de la ficha 0xE1D8
	jr mueve_hasta_c		;a2e6
e1db_a_38:		; 0xE1DB + 1 hasta 0x38
	ld bc,00138h		;a2e8
	jr mueve_e1db		;a2eb
e1db_a_58:		; 0xE1DB + 1 hasta 0x58
	ld bc,00158h		;a2ed
	jr mueve_e1db		;a2f0
e1db_a_78:		; 0xE1DB + 1 hasta 0x78
	ld bc,00178h		;a2f2
	jr mueve_e1db		;a2f5
e1db_a_98:		; 0xE1DB + 1 hasta 0x98
	ld bc,00198h		;a2f7
	jr mueve_e1db		;a2fa
e1db_baja_78:		; 0xE1DB - 1 hasta 0x78
	ld bc,0ff78h		;a2fc
	jr mueve_e1db		;a2ff
e1db_baja_58:		; 0xE1DB - 1 hasta 0x58
	ld bc,0ff58h		;a301
	jr mueve_e1db		;a304
e1db_baja_38:		; 0xE1DB - 1 hasta 0x38
	ld bc,0ff38h		;a306
	jr mueve_e1db		;a309
e1db_baja_18:		; 0xE1DB - 1 hasta 0x18
	ld bc,0ff18h		;a30b
mueve_e1db:
	ld hl,0e1dbh		;a30e   ; apunta a la X de la ficha 0xE1D8
mueve_hasta_c:		; (HL) + B; al llegar a C, el tramo siguiente
	ld a,(hl)			;a311
	add a,b			;a312   ; + B
	ld (hl),a			;a313
	cp c			;a314   ; hasta C
	ret nz			;a315
	ld hl,0e1d8h		;a316   ; apunta a el tramo de la ficha de p10:A234 (0 = ninguna; 0xE1DA-0xE1DB su sitio)
	inc (hl)			;a319   ; el tramo siguiente
	ret			;a31a
e1d8_sprites:		; con 0xE1D8, sus dos sprites (p10:A325) y sus colores 0x0D y 0x4E (p10:A361)
	ld a,(0e1d8h)		;a31b   ; lee el tramo de la ficha de p10:A234 (0 = ninguna; 0xE1DA-0xE1DB su sitio)
	or a			;a31e
	ret z			;a31f   ; sin ficha, nada
	call sprites_de_e1d8		;a320   ; sprites_de_e1d8: los sprites 0 y 1 en (0xE1DA, 0xE1DB) con el patron 0 u 8 cada 8 cuadros (+ 0x10 desde el tramo 9); con 0xE1DC, la X tiembla 2 a cada lado
	jr colores_e1d8		;a323
sprites_de_e1d8:		; los sprites 0 y 1 en (0xE1DA, 0xE1DB) con el patron 0 u 8 cada 8 cuadros (+ 0x10 desde el tramo 9); con 0xE1DC, la X tiembla 2 a cada lado
	ld a,(0ca03h)		;a325   ; lee el contador de cuadros (uno mas en cada interrupcion)
	ld c,000h		;a328   ; 0...
	rra			;a32a
	rra			;a32b
	rra			;a32c
	jr c,L_A331		;a32d   ; cada 8 cuadros...
	ld c,008h		;a32f   ; ...u 8
L_A331:
	ld a,(0e1d8h)		;a331   ; lee el tramo de la ficha de p10:A234 (0 = ninguna; 0xE1DA-0xE1DB su sitio)
	cp 009h		;a334   ; desde el tramo 9...
	jr c,sitio_de_e1d8		;a336
	ld a,c			;a338   ; ...0x10 mas
	add a,010h		;a339
	ld c,a			;a33b
sitio_de_e1d8:		; D = la X (0xE1DB), E = la Y (0xE1DA)
	ld a,(0e1dbh)		;a33c   ; lee la X de la ficha 0xE1D8
	ld d,a			;a33f
	ld a,(0e1dah)		;a340   ; lee la Y de la ficha 0xE1D8
	ld e,a			;a343   ; E = la Y
	ld a,(0e1dch)		;a344   ; lee 1 mientras la ficha 0xE1D8 tiembla (p10:A419)
	or a			;a347
	jr z,pon_sprites_e1d8		;a348   ; sin 0xE1DC, quieto
	ld a,(0e1d9h)		;a34a   ; lee la cuenta de la ficha 0xE1D8
	rra			;a34d
	rra			;a34e
	rra			;a34f
	ld a,002h		;a350   ; + 2...
	jr c,tiembla_x		;a352
	ld a,0feh		;a354   ; ...o - 2
tiembla_x:
	add a,d			;a356
	ld d,a			;a357
pon_sprites_e1d8:
	ld hl,0dc00h		;a358   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	call 05d41h		;a35b   ; pon_sprite: [E][D][C] en (HL): la Y, la X y el patron de un sprite de 0xDC00
	jp 05d3dh		;a35e   ; pon_sprite_mas_4: p00:5D41 con el patron C + 4
colores_e1d8:		; los 16 colores del sprite 0 al 0x0D y los del 1 al 0x4E
	ld hl,0da00h		;a361   ; apunta a la copia de la tabla de colores de sprites: 32 x 16 lineas (va con 0xDC00 detras)
	ld bc,0000fh		;a364   ; 16 lineas...
	ld a,00dh		;a367   ; ...del color 0x0D
	call 04237h		;a369   ; llena_bloque: pone A en BC + 1 bytes desde HL
	inc hl			;a36c
	inc de			;a36d
	ld bc,0000fh		;a36e
	ld a,04eh		;a371   ; ...y del 0x4E
	jp 04237h		;a373   ; llena_bloque: pone A en BC + 1 bytes desde HL
e1d8_toca_cosas:		; sin 0xE1DC: las cosas 0x20, 0x21 y 0x22 (p10:A401, A45D, A467); con 0xD704 = 0x0E y un disparo, si esta en el sitio de 0xCA84 (p10:A3D4): 0xCA7B = 0xE1D8 = 0, la cosa 0x0E a cero, el bit 4 de 0xD7D7, fuera el 7 de 0xD7DF, el sitio de 0xCA84 borrado, p10:AFF3 con 0x0E, p10:A471, los sprites 0-3 fuera y el sitio de 0xD8A4 borrado
	ld a,(0e1dch)		;a376   ; lee 1 mientras la ficha 0xE1D8 tiembla (p10:A419)
	or a			;a379
	ret nz			;a37a   ; con 0xE1DC, nada
	call e1d8_con_cosa_20		;a37b   ; e1d8_con_cosa_20: con la cosa 0x20 (0xD6B4) y la ficha en su sitio de 0xCA7E: 0xE1DC = 1, 0x30 cuadros, p03:BEB7 y p03:BEB2; si se acaba, a cero, el sitio borrado, p10:AFF3 y p10:A471 y, con ella elegida, el sitio de 0xD8A4 borrado
	call e1d8_con_cosa_21		;a37e   ; e1d8_con_cosa_21: lo mismo con la cosa 0x21 (0xD6B8) y su sitio de 0xCA80
	call e1d8_con_cosa_22		;a381   ; e1d8_con_cosa_22: lo mismo con la cosa 0x22 (0xD6BC) y su sitio de 0xCA82
	ld a,(0d704h)		;a384   ; lee la cosa en el cursor de F2/F3 (de la lista 0xD710, p10:B880)
	cp 00eh		;a387   ; sin 0x0E en 0xD704, nada
	ret nz			;a389   ; sin 0x0E, nada
	ld a,(0ca07h)		;a38a   ; lee lo recien pulsado del mando (los bits de 0xCA08 que no estaban)
	and 030h		;a38d   ; el disparo 1 o 2
	ret z			;a38f   ; sin disparo, nada
	ld hl,0ca84h		;a390
	call e1d8_en_el_sitio		;a393   ; en su sitio?
	ret nc			;a396   ; fuera, nada
	xor a			;a397   ; 0xCA7B = 0...
	ld (0ca7bh),a		;a398   ; guarda 0-3: el paso de la cosa 0x0E (p10:A1D2)
	ld (0e1d8h),a		;a39b   ; ...0xE1D8 = 0
	ld hl,0d66ch		;a39e   ; la cosa 0x0E a cero
	ld (hl),a			;a3a1   ; 0xD66C-0xD66E a cero
	inc hl			;a3a2
	ld (hl),a			;a3a3
	inc hl			;a3a4
	ld (hl),a			;a3a5
	ld hl,0d7d7h		;a3a6
	set 4,(hl)		;a3a9   ; el bit 4 de 0xD7D7
	ld hl,0d7dfh		;a3ab
	res 7,(hl)		;a3ae   ; fuera el 7 de 0xD7DF
	ld hl,(0ca84h)		;a3b0   ; el sitio de 0xCA84...
	ld bc,01010h		;a3b3
	ld a,(0ca42h)		;a3b6   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	ld d,a			;a3b9
	xor a			;a3ba
	call 046ffh		;a3bb   ; ...borrado
	ld a,00eh		;a3be   ; la 0x0E
	call quita_de_d710		;a3c0   ; quita_de_d710: la cosa A fuera de la lista 0xD710 (0x23 sitios)
	call b172_y_b8c4		;a3c3   ; b172_y_b8c4: p10:B172 y p10:B8C4
	ld hl,0dc00h		;a3c6   ; los sprites 0-3 fuera
	ld a,0e0h		;a3c9   ; 0xDC00-0xDC0F a 0xE0
	ld bc,0000fh		;a3cb
	call 04237h		;a3ce   ; llena_bloque: pone A en BC + 1 bytes desde HL
	jp borra_d8a4		;a3d1   ; borra_d8a4: borra el sitio de 0xD8A4
e1d8_en_el_sitio:		; acarreo si 0xE1DB es el segundo byte de HL y 0xE1DA esta entre el primero - 8 y ese + 0x18
	inc hl			;a3d4
	ld a,(0e1dbh)		;a3d5   ; lee la X de la ficha 0xE1D8
	cp (hl)			;a3d8   ; la X
	jr nz,no_en_el_sitio		;a3d9
	dec hl			;a3db
	ld a,(hl)			;a3dc
	sub 008h		;a3dd   ; Y - 8
	ld b,a			;a3df
	ld a,(0e1dah)		;a3e0   ; lee la Y de la ficha 0xE1D8
	cp b			;a3e3
	jr c,no_en_el_sitio		;a3e4
	ld a,b			;a3e6
	add a,020h		;a3e7   ; + 0x20
	ld b,a			;a3e9
	ld a,(0e1dah)		;a3ea   ; lee la Y de la ficha 0xE1D8
	cp b			;a3ed
	ret c			;a3ee   ; dentro: acarreo
no_en_el_sitio:
	and a			;a3ef   ; fuera: sin acarreo
	ret			;a3f0
e1d8_justo_en_el_sitio:		; acarreo si 0xE1DB y 0xE1DA son los dos bytes de HL
	inc hl			;a3f1
	ld a,(0e1dbh)		;a3f2   ; lee la X de la ficha 0xE1D8
	cp (hl)			;a3f5   ; la X...
	jr nz,no_en_el_sitio		;a3f6
	dec hl			;a3f8
	ld a,(0e1dah)		;a3f9   ; lee la Y de la ficha 0xE1D8
	cp (hl)			;a3fc   ; ...y la Y
	jr nz,no_en_el_sitio		;a3fd
	scf			;a3ff   ; acarreo
	ret			;a400
e1d8_con_cosa_20:		; con la cosa 0x20 (0xD6B4) y la ficha en su sitio de 0xCA7E: 0xE1DC = 1, 0x30 cuadros, p03:BEB7 y p03:BEB2; si se acaba, a cero, el sitio borrado, p10:AFF3 y p10:A471 y, con ella elegida, el sitio de 0xD8A4 borrado
	ld hl,0ca7eh		;a401
	ld de,0d6b4h		;a404
	ld b,020h		;a407
e1d8_con_cosa:
	ld a,(de)			;a409
	or a			;a40a   ; sin la cosa, nada
	ret z			;a40b   ; sin la cosa, nada
	ld a,b			;a40c
	ld (0d8e5h),a		;a40d   ; la cosa...
	ld (0d8e1h),hl		;a410   ; ...y su sitio
	push de			;a413
	call e1d8_justo_en_el_sitio		;a414   ; en el sitio?
	pop hl			;a417
	ret nc			;a418   ; fuera del sitio, nada
	ld a,001h		;a419   ; 0xE1DC = 1
	ld (0e1dch),a		;a41b   ; guarda 1 mientras la ficha 0xE1D8 tiembla (p10:A419)
	ld a,030h		;a41e   ; 0x30 cuadros
	ld (0e1d9h),a		;a420   ; guarda la cuenta de la ficha 0xE1D8
	push hl			;a423
	ld a,(0d8e5h)		;a424
	call 092d2h		;a427   ; a_p03_beb7: p03:BEB7 con el banco 3 en 0xA000
	pop hl			;a42a
	push hl			;a42b
	ld a,(0d8e5h)		;a42c
	call 092dbh		;a42f   ; a_p03_beb2: p03:BEB2 con el banco 3 en 0xA000
	pop hl			;a432
	ret nc			;a433   ; sin acarreo, nada mas
	xor a			;a434   ; la cosa a cero
	ld (hl),a			;a435   ; a cero
	ld hl,(0d8e1h)		;a436   ; su sitio...
	ld a,(hl)			;a439   ; el sitio guardado
	inc hl			;a43a
	ld h,(hl)			;a43b
	ld l,a			;a43c
	ld bc,01010h		;a43d
	ld a,(0ca42h)		;a440   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	ld d,a			;a443
	xor a			;a444   ; al color 0
	call 046ffh		;a445   ; ...borrado
	ld a,(0d8e5h)		;a448
	call quita_de_d710		;a44b   ; quita_de_d710: la cosa A fuera de la lista 0xD710 (0x23 sitios)
	call b172_y_b8c4		;a44e   ; b172_y_b8c4: p10:B172 y p10:B8C4
	ld a,(0d8e5h)		;a451
	ld b,a			;a454
	ld a,(0d704h)		;a455   ; elegida...
	cp b			;a458   ; elegida?
	ret nz			;a459
	jp borra_d8a4		;a45a   ; ...el sitio de 0xD8A4 borrado
e1d8_con_cosa_21:		; lo mismo con la cosa 0x21 (0xD6B8) y su sitio de 0xCA80
	ld hl,0ca80h		;a45d   ; el sitio de la 0x21...
	ld de,0d6b8h		;a460   ; ...la cosa...
	ld b,021h		;a463   ; ...su numero
	jr e1d8_con_cosa		;a465
e1d8_con_cosa_22:		; lo mismo con la cosa 0x22 (0xD6BC) y su sitio de 0xCA82
	ld hl,0ca82h		;a467   ; el sitio de la 0x22...
	ld de,0d6bch		;a46a   ; ...la cosa...
	ld b,022h		;a46d   ; ...su numero
	jr e1d8_con_cosa		;a46f
b172_y_b8c4:		; p10:B172 y p10:B8C4
	call fondo_de_mensajes		;a471   ; fondo_de_mensajes: 0xB0 x 0x28 en (0x90, 8) al color 0x99
	jp letrero_f2_0		;a474   ; letrero_f2_0: el letrero 0 de p50:8046 (ninguno)
fichas_e070_de_la_sala:		; 0xE070-0xE07F a cero y, de p10:A61B ([zona][sala][Y y X en nibbles], 0xFF acaba; en la zona 0x10 solo con 0xCA43 = 6), las dos fichas de esta sala: [1][0][Y * 16 + 1][X * 16][0x10]
	ld hl,0e070h		;a477   ; apunta a 2 fichas de 8 bytes [activa][paso][Y][X][..] de p10:A61B (se abren al acercarse Snake, p10:A4F1)
	ld bc,0000fh		;a47a   ; 16 bytes
	call 04236h		;a47d   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	ld hl,0a61bh		;a480   ; la lista de p10:A61B
	ld de,0e070h		;a483   ; apunta a 2 fichas de 8 bytes [activa][paso][Y][X][..] de p10:A61B (se abren al acercarse Snake, p10:A4F1)
	ld a,(0ca4ah)		;a486   ; lee la zona
	cp 010h		;a489
	jr nz,ficha_a61b		;a48b   ; fuera de la zona 0x10, sigue
	ld a,(0ca43h)		;a48d
	cp 006h		;a490
	ret nz			;a492   ; en ella, solo con 0xCA43 = 6
ficha_a61b:
	ld a,(hl)			;a493
	inc a			;a494   ; 0xFF?
	ret z			;a495   ; 0xFF: se acaba
	ld a,(0ca4ah)		;a496   ; lee la zona
	cp (hl)			;a499   ; su zona...
	inc hl			;a49a
	jr nz,otra_a61b		;a49b
	ld a,(0ca4bh)		;a49d   ; lee la sala de la zona
	cp (hl)			;a4a0   ; ...y su sala
	inc hl			;a4a1
	jr z,pon_ficha_e070		;a4a2
	jr siguiente_a61b		;a4a4
otra_a61b:
	inc hl			;a4a6
siguiente_a61b:
	inc hl			;a4a7
	jr ficha_a61b		;a4a8
pon_ficha_e070:		; activa...
	ld a,001h		;a4aa
	ld (de),a			;a4ac
	inc de			;a4ad
	xor a			;a4ae   ; ...paso 0...
	ld (de),a			;a4af
	inc de			;a4b0
	ld a,(hl)			;a4b1   ; ...la Y: nibble alto * 16 + 1...
	and 0f0h		;a4b2   ; la Y...
	inc a			;a4b4
	ld (de),a			;a4b5
	inc de			;a4b6
	ld a,(hl)			;a4b7   ; ...la X: nibble bajo * 16...
	rlca			;a4b8   ; ...la X
	rlca			;a4b9
	rlca			;a4ba
	rlca			;a4bb
	and 0f0h		;a4bc
	ld (de),a			;a4be
	inc de			;a4bf
	ld a,010h		;a4c0   ; ...0x10
	ld (de),a			;a4c2   ; 0x10
	ld de,0e078h		;a4c3   ; la segunda ficha
	inc hl			;a4c6
	jr ficha_a61b		;a4c7
pinta_fichas_e070:		; las dos fichas de 0xE070 desde el paso 2: 0x20 x 0x20 de (0xA0, 0xE0) de la pagina 3 (o la 1) a su sitio
	ld hl,0e070h		;a4c9   ; apunta a 2 fichas de 8 bytes [activa][paso][Y][X][..] de p10:A61B (se abren al acercarse Snake, p10:A4F1)
	call pinta_e070		;a4cc   ; pinta_e070:
	ld hl,0e078h		;a4cf   ; la segunda
pinta_e070:
	ld a,(hl)			;a4d2
	and a			;a4d3   ; libre, nada
	ret z			;a4d4   ; libre, nada
	inc hl			;a4d5
	ld a,(hl)			;a4d6
	cp 002h		;a4d7   ; desde el paso 2
	ret c			;a4d9   ; por debajo del paso 2, nada
	inc hl			;a4da
	ld e,(hl)			;a4db   ; su sitio
	inc hl			;a4dc
	ld d,(hl)			;a4dd
	ld hl,0e0a0h		;a4de   ; de (0xA0, 0xE0)...
	ld bc,02020h		;a4e1   ; ...0x20 x 0x20
	ld a,(0ca42h)		;a4e4   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	and a			;a4e7
	ld a,003h		;a4e8   ; de la pagina 0 a la 3...
	jr z,copia_e070		;a4ea
	ld a,007h		;a4ec   ; ...o de la 1 a la 3
copia_e070:
	jp 04767h		;a4ee   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
fichas_e070_cada_cuadro:		; las dos fichas de 0xE070 (la segunda espera a que la primera deje el paso 1): paso 0 con Snake cerca (p10:A5EC) guarda el fondo y el sonido 0x45; paso 1 se abre de 2 en 2 (p10:A535); paso 2 en adelante, p10:A5C2
	ld hl,0e070h		;a4f1   ; apunta a 2 fichas de 8 bytes [activa][paso][Y][X][..] de p10:A61B (se abren al acercarse Snake, p10:A4F1)
	ld de,0e078h		;a4f4   ; la segunda
	push hl			;a4f7
	push de			;a4f8
	call ficha_e070_paso		;a4f9   ; ficha_e070_paso:
	pop hl			;a4fc
	pop de			;a4fd
ficha_e070_paso:
	ld a,(hl)			;a4fe
	and a			;a4ff
	ret z			;a500   ; libre, nada
	ld a,(de)			;a501
	and a			;a502   ; la otra libre: sigue
	jr z,paso_de_e070		;a503   ; la otra libre, sigue
	inc de			;a505
	ld a,(de)			;a506
	dec a			;a507   ; en el paso 1: espera
	ret z			;a508   ; la otra en el paso 1, espera
paso_de_e070:
	inc hl			;a509
	ld a,(hl)			;a50a   ; el paso
	inc hl			;a50b
	cp 001h		;a50c
	jr z,e070_paso_1		;a50e   ; el paso 1
	jp nc,e070_abierta		;a510   ; el 2 en adelante
	ld bc,00020h		;a513   ; a menos de 0x20
	push hl			;a516
	call cerca_de_e070		;a517   ; cerca_de_e070: acarreo con lo lanzado de tipo 8 (D = 1) o con Snake (D = 0) a menos de C del sitio de HL + B, en Y y en X
	pop hl			;a51a
	ret nc			;a51b   ; lejos, nada
	push hl			;a51c   ; su sitio...
	ld e,(hl)			;a51d
	inc hl			;a51e
	ld d,(hl)			;a51f
	ex de,hl			;a520
	ld de,0c090h		;a521   ; ...a (0x90, 0xC0)...
	ld bc,02020h		;a524   ; ...0x20 x 0x20 de la otra pagina
	call 0474dh		;a527   ; copia_rectangulo_a_esta: p00:4767 de la otra pagina (0xCA42 ^ 1) a la de 0xCA42
	pop hl			;a52a
	call 06c2fh		;a52b   ; el sonido 0x45
e070_paso_siguiente:		; el paso de la ficha (byte 1) uno mas
	ld a,l			;a52e
	and 0f8h		;a52f   ; el byte 1 de la ficha...
	inc a			;a531
	ld l,a			;a532
	inc (hl)			;a533   ; ...uno mas
	ret			;a534
e070_paso_1:		; el byte 4 baja 2; a cero, el paso siguiente; si no, la franja guardada en (0x90, 0x20) y las dos mitades separadas (p10:A5AE) con ese hueco; sin la luz (p10:A578), el resultado a la otra pagina
	inc hl			;a535
	inc hl			;a536
	dec (hl)			;a537   ; 2 menos
	dec (hl)			;a538
	jr z,e070_paso_siguiente_b		;a539   ; a cero: el paso siguiente
	push hl			;a53b
	ld hl,0e0a0h		;a53c   ; de (0xE0, 0xA0)...
	ld de,02090h		;a53f   ; ...a (0x90, 0x20)
	ld a,(0ca42h)		;a542   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	and a			;a545   ; en la pagina 0, de la 1...
	ld a,007h		;a546
	jr z,L_A54C		;a548
	ld a,003h		;a54a   ; ...en la 1, de la 0
L_A54C:
	call 047abh		;a54c   ; copia en Y
	pop hl			;a54f
	push hl			;a550
	ld b,(hl)			;a551   ; la mitad de la izquierda
	ld a,0d0h		;a552   ; 0xD0 - el hueco
	sub (hl)			;a554
	ld h,a			;a555
	ld d,0e0h		;a556   ; a 0xE0
	call mitad_e070		;a558   ; mitad_e070: con B, una mitad de B x 0x20 de (H, 0x90) a (D, 0x90) con la operacion 0x50 (o 0 en la pagina 1)
	pop hl			;a55b
	ld b,(hl)			;a55c   ; la de la derecha
	push hl			;a55d
	xor a			;a55e   ; - el hueco
	sub (hl)			;a55f
	ld d,a			;a560
	ld h,0d0h		;a561   ; desde 0xD0
	call mitad_e070		;a563   ; mitad_e070: con B, una mitad de B x 0x20 de (H, 0x90) a (D, 0x90) con la operacion 0x50 (o 0 en la pagina 1)
	call sala_con_luz		;a566   ; con luz, no a la otra
	pop hl			;a569
	ret c			;a56a   ; con luz, ya esta
	dec hl			;a56b
e070_a_la_otra:		; 0x20 x 0x1F de (0x90, 0xE0) a su sitio en la otra pagina
	ld d,(hl)			;a56c   ; su sitio
	dec hl			;a56d
	ld e,(hl)			;a56e
	ld hl,0e090h		;a56f
	ld bc,0201fh		;a572   ; 0x20 x 0x1F
	jp 0475ah		;a575   ; copia_rectangulo_a_la_otra: p00:4767 de la pagina 0xCA42 a la otra
sala_con_luz:		; acarreo (salvo con 0xCB21 = 3) en la zona 4 sala 5 con 0xCACC o en la zona 3 sala 0x10 con 0xCACA
	ld a,(0cb21h)		;a578   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	cp 003h		;a57b
	jr z,sin_luz		;a57d   ; con 3 en 0xCB21, no
	ld a,(0ca4ah)		;a57f   ; lee la zona
	sub 003h		;a582
	jr z,zona_3_luz		;a584   ; zona 3
	dec a			;a586
	jr z,zona_4_luz		;a587   ; zona 4
sin_luz:
	or a			;a589
	ret			;a58a
zona_4_luz:
	ld a,(0ca4bh)		;a58b   ; lee la sala de la zona
	cp 005h		;a58e
	jr nz,sin_luz		;a590
	ld a,(0cacch)		;a592   ; con 0xCACC
	or a			;a595
	ret z			;a596
con_luz:
	scf			;a597
	ret			;a598
zona_3_luz:
	ld a,(0ca4bh)		;a599   ; lee la sala de la zona
	cp 010h		;a59c
	jr nz,sin_luz		;a59e
	ld a,(0cacah)		;a5a0   ; con 0xCACA
	or a			;a5a3
	ret z			;a5a4
	jr con_luz		;a5a5
e070_paso_siguiente_b:
	jp e070_paso_siguiente		;a5a7   ; e070_paso_siguiente: el paso de la ficha (byte 1) uno mas
e070_a_la_otra_b:
	inc hl			;a5aa
	inc hl			;a5ab
	jr e070_a_la_otra		;a5ac
mitad_e070:		; con B, una mitad de B x 0x20 de (H, 0x90) a (D, 0x90) con la operacion 0x50 (o 0 en la pagina 1)
	ld a,b			;a5ae
	and a			;a5af
	ret z			;a5b0   ; sin ancho, nada
	ld e,090h		;a5b1   ; Y = 0x90
	ld l,e			;a5b3
	ld c,020h		;a5b4
	ld a,(0ca42h)		;a5b6   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	and a			;a5b9
	ld a,050h		;a5ba   ; en la pagina 0, la operacion 0x50...
	jr z,copia_logica_e070		;a5bc
	xor a			;a5be   ; ...en la 1, 0
copia_logica_e070:
	jp 047edh		;a5bf   ; copia_rectangulo_logica: orden LMMM del VDP con la operacion logica de A
e070_abierta:		; la ficha abierta: con Snake (o lo lanzado de tipo 8) a menos de 0x18 de su sitio + 4: en la zona 0x13, 0xD821 = 0x20; si no, Snake al estado 0x1A con el dibujo 0, 0xCB31 = 0 y la ficha libre
	ld bc,00418h		;a5c2   ; 0x18 de cerca, 4 de mas
	call cerca_de_e070		;a5c5   ; cerca?
	ret nc			;a5c8   ; lejos, nada
	ld a,d			;a5c9
	and a			;a5ca
	ret nz			;a5cb   ; con lo lanzado, nada
	ld a,(0ca4ah)		;a5cc   ; lee la zona
	cp 013h		;a5cf
	jr z,e070_zona_13		;a5d1   ; la zona 0x13, aparte
	ld a,01ah		;a5d3   ; Snake al estado 0x1A
	ld (0cb00h),a		;a5d5   ; guarda el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	xor a			;a5d8   ; el dibujo 0
	ld (0cb01h),a		;a5d9   ; guarda el dibujo de Snake (al darse la vuelta se le suma 1, 3 o 5 segun 0xCB00)
	ld (0cb31h),a		;a5dc   ; 0xCB31 = 0
	ld a,l			;a5df   ; la ficha...
	and 0f8h		;a5e0
	ld l,a			;a5e2
	ld (hl),000h		;a5e3   ; libre
	ret			;a5e5
e070_zona_13:		; 0xD821 = 0x20
	ld a,020h		;a5e6
	ld (0d821h),a		;a5e8   ; 0xD821 = 0x20
	ret			;a5eb
cerca_de_e070:		; acarreo con lo lanzado de tipo 8 (D = 1) o con Snake (D = 0) a menos de C del sitio de HL + B, en Y y en X
	push hl			;a5ec
	call lanzado_8_cerca		;a5ed   ; lo lanzado?
	pop hl			;a5f0
	ld d,001h		;a5f1   ; lo lanzado: D = 1
	ret c			;a5f3
	ld a,(0cb05h)		;a5f4   ; E = la X de Snake...
	ld e,a			;a5f7
	ld a,(0cb03h)		;a5f8   ; ...D = su Y
	ld d,a			;a5fb
cerca_en_y_x:		; la Y - B - la de la ficha...
	ld a,d			;a5fc
	sub b			;a5fd
	sub (hl)			;a5fe
	cp c			;a5ff   ; - el sitio
	ld d,000h		;a600
	ret nc			;a602   ; lejos en Y: no
	inc hl			;a603
	ld a,e			;a604   ; ...y la X igual
	sub b			;a605
	sub (hl)			;a606   ; - el sitio en X
	cp c			;a607
	ret			;a608
lanzado_8_cerca:		; con lo lanzado de tipo 8, su Y y su X
	ld a,(0cb80h)		;a609   ; lee las 6 fichas de 16 bytes de lo que lanza Snake ([tipo][..][Y 8.8][X 8.8][velocidades]...)
	cp 008h		;a60c
	jp nz,sin_luz		;a60e   ; sin el 8, sin acarreo
	ld a,(0cb83h)		;a611   ; su Y...
	ld d,a			;a614
	ld a,(0cb85h)		;a615   ; ...su X
	ld e,a			;a618
	jr cerca_en_y_x		;a619

; ----------------------------------------------------------------------
; DATOS resto_A61B: lo apuntan con el banco puesto p10:A480 (0xA61B); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p10:A480 (67 bytes)
;   0xa61b..0xa65e  (67 bytes)
DATA_resto_A61B:
	defb 003h,010h,042h,003h,010h,082h,003h,011h,068h,004h,005h,094h,004h,005h,099h,005h	; a61b  ..B.....h.......
	defb 000h,034h,005h,001h,042h,005h,003h,091h,005h,005h,033h,005h,007h,021h,005h,008h	; a62b  .4..B.....3..!..
	defb 066h,005h,008h,068h,008h,001h,017h,008h,003h,019h,008h,004h,095h,008h,006h,098h	; a63b  f..h............
	defb 00eh,004h,057h,010h,000h,054h,010h,001h,056h,011h,005h,077h,012h,010h,036h,013h	; a64b  ..W..T..V..w..6.
	defb 005h,074h,0ffh	; a65b

; ======================================================================
; CODIGO 0xa65e..0xa71a  (188 bytes)
; ======================================================================


bandera_por_cosa:		; segun la cosa A: la 0x17 el bit 6 de 0xD7D6; la 0x2A el 4 de 0xD7D8 y fuera el 6 de 0xD7D2; la 0x2D el 5 de 0xD7D9; la 0x0C el 6 de 0xD7DA y fuera el 4 de 0xD7DF; la 0x2B el 5 de 0xD7DA y fuera el 4 de 0xD7DF; la 0x16 fuera el 6 de 0xD7E1
	cp 017h		;a65e
	jr z,cosa_17		;a660   ; la 0x17
	cp 02ah		;a662
	jr z,cosa_2a		;a664   ; la 0x2A
	cp 02dh		;a666
	jr z,cosa_2d		;a668   ; la 0x2D
	cp 00ch		;a66a
	jr z,cosa_0c		;a66c   ; la 0x0C
	cp 02bh		;a66e
	jr z,cosa_2b		;a670   ; la 0x2B
	cp 016h		;a672
	ret nz			;a674   ; la 0x16...
	ld hl,0d7e1h		;a675
	res 6,(hl)		;a678   ; ...fuera el bit 6 de 0xD7E1
	ret			;a67a
cosa_17:
	ld hl,0d7d6h		;a67b
	set 6,(hl)		;a67e   ; el bit 6 de 0xD7D6
	ret			;a680
cosa_2a:
	ld hl,0d7d8h		;a681
	set 4,(hl)		;a684   ; el bit 4 de 0xD7D8...
	ld hl,0d7d2h		;a686
	res 6,(hl)		;a689   ; ...fuera el 6 de 0xD7D2
	ret			;a68b
cosa_2d:
	ld hl,0d7d9h		;a68c
	set 5,(hl)		;a68f   ; el bit 5 de 0xD7D9
	ret			;a691
cosa_0c:
	ld hl,0d7dah		;a692
	set 6,(hl)		;a695   ; el bit 6 de 0xD7DA
quita_d7df_4:
	ld hl,0d7dfh		;a697
	res 4,(hl)		;a69a   ; fuera el 4 de 0xD7DF
	ret			;a69c
cosa_2b:
	ld hl,0d7dah		;a69d
	set 5,(hl)		;a6a0   ; el bit 5 de 0xD7DA
	jr quita_d7df_4		;a6a2
ficha_e1f8:		; la ficha 0xE1F8 en (E, D): [1][0][4][0][E][D][0xE0][0xE0] y su sitio en 0xE25C
	xor a			;a6a4
	ld hl,0e1f8h		;a6a5   ; apunta a 1 con la ficha de p10:A6A4 en marcha (0xE1F9-0xE1FF)
	ld (hl),001h		;a6a8   ; activa
	inc l			;a6aa
	ld (hl),a			;a6ab   ; el paso 0
	inc l			;a6ac
	ld (hl),004h		;a6ad   ; 4 cuadros
	inc l			;a6af
	ld (hl),a			;a6b0
	inc l			;a6b1
	ld (hl),e			;a6b2   ; la Y...
	inc l			;a6b3
	ld (hl),d			;a6b4   ; ...la X
	inc l			;a6b5
	ld (hl),0e0h		;a6b6   ; el primer par fuera...
	inc l			;a6b8
	ld (hl),0e0h		;a6b9   ; ...el segundo fuera
	ld hl,0e25ch		;a6bb   ; su sitio a 0xE25C
	ld (hl),e			;a6be
	inc l			;a6bf
	ld (hl),d			;a6c0
	ret			;a6c1
e1f8_cada_cuadro:		; su paso (p10:A6C8) y sus sprites (p10:A72E)
	call e1f8_paso		;a6c2   ; e1f8_paso: con 0xE1F8, cada 4 cuadros 0xE1F9 uno mas (0-3); en el 2, el segundo par de sprites; al volver a 0, 0xE1FB uno mas: hasta 6 (alli se acaba) el primer par en el sitio de p10:A71A
	jp sprites_e1f8		;a6c5   ; sprites_e1f8: los sprites 10-23 (0xDC28-0xDC5F) fuera y, con 0xE1F8, los dos pares (p10:A747) y sus colores (p10:A793)
e1f8_paso:		; con 0xE1F8, cada 4 cuadros 0xE1F9 uno mas (0-3); en el 2, el segundo par de sprites; al volver a 0, 0xE1FB uno mas: hasta 6 (alli se acaba) el primer par en el sitio de p10:A71A
	ld a,(0e1f8h)		;a6c8   ; lee 1 con la ficha de p10:A6A4 en marcha (0xE1F9-0xE1FF)
	or a			;a6cb
	ret z			;a6cc   ; sin 0xE1F8, nada
	ld hl,0e1fah		;a6cd
	dec (hl)			;a6d0   ; cada 4 cuadros
	ret nz			;a6d1
	ld (hl),004h		;a6d2   ; otros 4
	ld hl,0e1f9h		;a6d4
	inc (hl)			;a6d7   ; el dibujo siguiente
	ld a,(hl)			;a6d8
	cp 002h		;a6d9   ; en el 2...
	jr z,segundo_par		;a6db
	cp 004h		;a6dd   ; ...hasta 4
	ret c			;a6df
	ld (hl),000h		;a6e0
	ld hl,0e1fbh		;a6e2   ; el siguiente de 0xE1FB
	inc (hl)			;a6e5
	ld a,(hl)			;a6e6
	cp 006h		;a6e7
	jr z,e1f8_acaba		;a6e9   ; al 6, se acaba
	ld hl,0a71ah		;a6eb   ; el primer par
	ld de,0e1fch		;a6ee
	jr sitio_del_par		;a6f1
e1f8_acaba:
	xor a			;a6f3
	ld (0e1f8h),a		;a6f4   ; guarda 1 con la ficha de p10:A6A4 en marcha (0xE1F9-0xE1FF)
	ret			;a6f7
segundo_par:		; el segundo par (p10:A724)
	ld hl,0a724h		;a6f8
	ld de,0e1feh		;a6fb
sitio_del_par:		; en el 5, fuera (0xE0); si no, el desplazamiento de la entrada 0xE1FB mas 0xE25C
	ld a,(0e1fbh)		;a6fe
	cp 005h		;a701
	jr z,par_fuera		;a703
	call 043f6h		;a705   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld a,(0e25ch)		;a708
	add a,l			;a70b   ; + la Y
	ld (de),a			;a70c
	inc de			;a70d
	ld a,(0e25dh)		;a70e   ; + la X
	add a,h			;a711
	ld (de),a			;a712
	ret			;a713
par_fuera:
	ld a,0e0h		;a714
	ld (de),a			;a716
	inc de			;a717
	ld (de),a			;a718
	ret			;a719

; ----------------------------------------------------------------------
; DATOS resto_A71A: lo apuntan con el banco puesto p10:A6EB (0xA71A), p10:A6F8
;   (0xA724); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p10:A6EB, p10:A6F8 (20 bytes)
;   0xa71a..0xa72e  (20 bytes)
DATA_resto_A71A:
	defb 000h,000h,008h,010h,018h,0f0h,010h,0f8h,008h,010h,0f8h,018h,0f0h,0f0h,000h,004h	; a71a  ................
	defb 015h,008h,008h,0f0h	; a72a

; ======================================================================
; CODIGO 0xa72e..0xa7b5  (135 bytes)
; ======================================================================


sprites_e1f8:		; los sprites 10-23 (0xDC28-0xDC5F) fuera y, con 0xE1F8, los dos pares (p10:A747) y sus colores (p10:A793)
	ld de,0dc29h		;a72e
	ld hl,0dc28h		;a731   ; 0x38 bytes a 0xE0
	ld (hl),0e0h		;a734   ; a 0xE0
	ld bc,00037h		;a736
	ldir		;a739
	ld a,(0e1f8h)		;a73b   ; lee 1 con la ficha de p10:A6A4 en marcha (0xE1F9-0xE1FF)
	or a			;a73e   ; sin 0xE1F8, nada mas
	ret z			;a73f
	call pares_de_e1f8		;a740   ; pares_de_e1f8: el primer par en 0xDC28 desde 0xE1FC con el dibujo 0xE1F9; el segundo en 0xDC44 desde 0xE1FE con el dibujo 0xE1F9 + 2
	call colores_de_e1f8		;a743   ; colores_de_e1f8: los colores del dibujo 0xE1F9 de p10:A7F1: 16 lineas de cada color desde el sprite 10 (0xDAA0) hasta 0xFF
	ret			;a746
pares_de_e1f8:		; el primer par en 0xDC28 desde 0xE1FC con el dibujo 0xE1F9; el segundo en 0xDC44 desde 0xE1FE con el dibujo 0xE1F9 + 2
	ld de,0dc28h		;a747
	exx			;a74a
	ld a,(0e1fch)		;a74b   ; la Y...
	ld e,a			;a74e
	ld a,(0e1fdh)		;a74f   ; ...la X
	ld d,a			;a752
	exx			;a753
	ld a,(0e1f9h)		;a754
	call dibujo_de_a7b5		;a757   ; dibujo_de_a7b5: los sprites del dibujo A de p10:A7B5: [patron] y [dY][dX] hasta 0xFF, con el patron + 4 cada uno
	ld de,0dc44h		;a75a
	exx			;a75d
	ld a,(0e1feh)		;a75e   ; la Y del segundo...
	ld e,a			;a761
	ld a,(0e1ffh)		;a762   ; ...su X
	ld d,a			;a765
	exx			;a766
	ld a,(0e1f9h)		;a767
	add a,002h		;a76a
	and 003h		;a76c
dibujo_de_a7b5:		; los sprites del dibujo A de p10:A7B5: [patron] y [dY][dX] hasta 0xFF, con el patron + 4 cada uno
	ld hl,0a7b5h		;a76e
	call 043f6h		;a771   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld c,(hl)			;a774   ; el patron
	inc hl			;a775
sprite_de_a7b5:
	ld a,(hl)			;a776
	cp 0ffh		;a777   ; 0xFF: se acaba
	ret z			;a779
	ld b,a			;a77a
	exx			;a77b
	ld a,e			;a77c
	exx			;a77d
	add a,b			;a77e   ; la Y + dY
	ld (de),a			;a77f
	inc de			;a780
	inc hl			;a781
	ld b,(hl)			;a782
	exx			;a783
	ld a,d			;a784
	exx			;a785
	add a,b			;a786   ; la X + dX
	ld (de),a			;a787
	inc hl			;a788
	inc de			;a789
	ld a,c			;a78a
	ld (de),a			;a78b   ; el patron, 4 mas el siguiente
	add a,004h		;a78c
	ld c,a			;a78e
	inc de			;a78f
	inc de			;a790
	jr sprite_de_a7b5		;a791
colores_de_e1f8:		; los colores del dibujo 0xE1F9 de p10:A7F1: 16 lineas de cada color desde el sprite 10 (0xDAA0) hasta 0xFF
	ld a,(0e1f9h)		;a793
	ld hl,0a7f1h		;a796
	call 043f6h		;a799   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld b,h			;a79c
	ld c,l			;a79d
	ld de,0daa1h		;a79e   ; desde 0xDAA0
	ld hl,0daa0h		;a7a1
color_a7f1:
	ld a,(bc)			;a7a4
	cp 0ffh		;a7a5   ; 0xFF: se acaba
	ret z			;a7a7
	push bc			;a7a8
	ld bc,0000fh		;a7a9
	ld (hl),a			;a7ac   ; 16 lineas del color
	ldir		;a7ad
	inc hl			;a7af
	inc de			;a7b0
	pop bc			;a7b1
	inc bc			;a7b2
	jr color_a7f1		;a7b3

; ----------------------------------------------------------------------
; DATOS resto_A7B5: lo apuntan con el banco puesto p10:A76E (0xA7B5), p10:A796
;   (0xA7F1); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p10:A76E, p10:A796 (122 bytes)
;   0xa7b5..0xa82f  (122 bytes)
DATA_resto_A7B5:
	defb 0bdh,0a7h,0c5h,0a7h,0d5h,0a7h,0e5h,0a7h,078h,008h,0f9h,008h,009h,008h,009h,0ffh	; a7b5  ........x.......
	defb 084h,000h,000h,000h,010h,010h,000h,010h,010h,004h,006h,010h,002h,009h,010h,0ffh	; a7c5  ................
	defb 0a0h,000h,000h,000h,010h,010h,000h,010h,010h,010h,000h,010h,010h,000h,008h,0ffh	; a7d5  ................
	defb 0bch,00ah,003h,000h,008h,00bh,010h,009h,004h,004h,00ch,0ffh,0f9h,0a7h,008h,0a8h	; a7e5  ................
	defb 015h,0a8h,020h,0a8h,00ah,00ah,007h,000h,000h,000h,000h,003h,003h,003h,003h,00ah	; a7f5  .. .............
	defb 00ah,00ah,0ffh,00ah,00ah,00ah,00ah,007h,007h,007h,003h,003h,003h,00ah,00ah,0ffh	; a805  ................
	defb 003h,003h,003h,003h,00ah,00ah,00ah,00ah,00ah,007h,0ffh,003h,003h,003h,00ah,00ah	; a815  ................
	defb 000h,000h,00ah,00ah,00ah,00ah,007h,007h,007h,0ffh	; a825  ..........

; ======================================================================
; CODIGO 0xa82f..0xaa8f  (608 bytes)
; ======================================================================


banderas_de_la_zona:		; a cero bits de 0xD7D2, 0xD7D5-0xD7D6, 0xD7D8, 0xD7DB-0xD7DC, 0xD7E0-0xD7E1 y 0xD7E3; el bit 5 o 6 de 0xD7DB segun la zona (p10:A877), lo de cada zona (p10:A8AF) y p10:AA56
	call banderas_a_cero		;a82f   ; banderas_a_cero: fuera el bit 4 de 0xD7D2
	call bit_de_d7db		;a832   ; bit_de_d7db: desde la zona 1: el bit 5 de 0xD7DB en la 6 (fuera de las salas especiales, desde la sala 0x16), la 8 sala 0x0F y las 0x0B-0x0F; el 6 en las demas (salvo 0x0B-0x0F)
	call lo_de_cada_zona		;a835   ; lo_de_cada_zona: segun la zona, sus banderas y fichas
	jp banderas_especiales		;a838   ; banderas_especiales: en la sala especial 0x39 sala 1, el bit 1 de 0xD7D8; en la 0x29 desde la sala 2, el 1 de 0xD7E1
banderas_a_cero:		; fuera el bit 4 de 0xD7D2
	ld hl,0d7d2h		;a83b
	ld a,(hl)			;a83e
	and 0efh		;a83f
	ld (hl),a			;a841
	ld hl,0d7d5h		;a842   ; fuera el 1 de 0xD7D5
	ld a,(hl)			;a845
	and 0fdh		;a846
	ld (hl),a			;a848
	inc hl			;a849
	ld a,(hl)			;a84a   ; fuera el 3 de 0xD7D6
	and 0f7h		;a84b
	ld (hl),a			;a84d
	ld hl,0d7d8h		;a84e   ; fuera el 7 de 0xD7D8
	ld a,(hl)			;a851
	and 07fh		;a852
	ld (hl),a			;a854
	ld hl,0d7dbh		;a855   ; de 0xD7DB solo los bits 2-4
	ld a,(hl)			;a858
	and 01ch		;a859
	ld (hl),a			;a85b
	ld hl,0d7dch		;a85c   ; fuera el 5 de 0xD7DC
	ld a,(hl)			;a85f
	and 0dfh		;a860
	ld (hl),a			;a862
	ld hl,0d7e0h		;a863   ; fuera los 0, 2 y 4 de 0xD7E0
	ld a,(hl)			;a866
	and 0eah		;a867
	ld (hl),a			;a869
	inc hl			;a86a
	ld a,(hl)			;a86b   ; fuera los 1, 5 y 7 de 0xD7E1
	and 05dh		;a86c
	ld (hl),a			;a86e
	ld hl,0d7e3h		;a86f   ; fuera los 2, 4 y 6 de 0xD7E3
	ld a,(hl)			;a872
	and 0abh		;a873
	ld (hl),a			;a875
	ret			;a876
bit_de_d7db:		; desde la zona 1: el bit 5 de 0xD7DB en la 6 (fuera de las salas especiales, desde la sala 0x16), la 8 sala 0x0F y las 0x0B-0x0F; el 6 en las demas (salvo 0x0B-0x0F)
	ld hl,0d7dbh		;a877
	ld a,(0ca4ah)		;a87a   ; lee la zona
	cp 001h		;a87d
	ret c			;a87f   ; la zona 0, nada
	cp 006h		;a880
	jr z,zona_6_d7db		;a882   ; la 6, aparte
	cp 007h		;a884
	jr c,d7db_6		;a886   ; 1-5: el 6
	cp 008h		;a888
	jr z,zona_8_d7db		;a88a   ; la 8, aparte
	cp 00bh		;a88c
	ret c			;a88e   ; 7, 9 y 0x0A, nada
	cp 010h		;a88f
	jr c,d7db_5		;a891   ; 0x0B-0x0F: el 5
d7db_6:
	set 6,(hl)		;a893
	ret			;a895
zona_6_d7db:
	ld a,(0ca76h)		;a896   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	or a			;a899
	jr nz,d7db_5		;a89a
	ld a,(0ca4bh)		;a89c   ; lee la sala de la zona
	cp 016h		;a89f
	jr c,d7db_6		;a8a1
d7db_5:
	set 5,(hl)		;a8a3
	ret			;a8a5
zona_8_d7db:
	ld a,(0ca4bh)		;a8a6   ; lee la sala de la zona
	cp 00fh		;a8a9
	jr z,d7db_5		;a8ab
	jr d7db_6		;a8ad
lo_de_cada_zona:		; segun la zona, sus banderas y fichas
	ld a,(0ca4ah)		;a8af   ; lee la zona
	or a			;a8b2
	jr z,zona_0_banderas		;a8b3
	cp 001h		;a8b5
	jr z,zona_1_banderas		;a8b7
	cp 007h		;a8b9
	jp z,zona_7_banderas		;a8bb   ; zona_7_banderas: la zona 7: el bit 4 de 0xD7E3, p10:A9B5, p10:A9C4; en las salas 0x0B y 0x0D, el 7 de 0xD7DB; en la 0x0E y 0x0F, el 4 de 0xD7D2; en las cuatro, el 4 de 0xD7E0
	cp 008h		;a8be
	jp z,zona_8_banderas		;a8c0   ; zona_8_banderas: la zona 8: el bit 0 de 0xD7D4
	cp 00ah		;a8c3
	jp z,zona_0a_banderas		;a8c5   ; zona_0a_banderas: la zona 0x0A: p10:A931 y, en las salas 9-0x18 salvo 0x0B, 0x0C, 0x10, 0x11 y 0x15, el bit 2 de 0xD7E0
	cp 00bh		;a8c8
	jp z,zona_0b_banderas		;a8ca   ; zona_0b_banderas: la zona 0x0B: el bit 0 de 0xD7D2, fuera el 0 de 0xD7DC y, en la sala 5, el 7 de 0xD7D3
	cp 00dh		;a8cd
	jp z,zona_0d_banderas		;a8cf   ; zona_0d_banderas: la zona 0x0D: en la sala 5, el bit 3 de 0xD7D6
	cp 00eh		;a8d2
	jp z,zona_0e_banderas		;a8d4   ; zona_0e_banderas: la zona 0x0E: en las salas 4 y 5, el bit 0 de 0xD7E0
	cp 00fh		;a8d7
	jp z,zona_0f_banderas		;a8d9   ; zona_0f_banderas: la zona 0x0F: en la sala 0, el bit 2 de 0xD7D3; en las demas, el 6 de 0xD7E3 y el 0 de 0xD7D3
	cp 010h		;a8dc
	jp z,zona_10_banderas		;a8de   ; zona_10_banderas: la zona 0x10: fuera el bit 1 de 0xD8E0
	cp 011h		;a8e1
	jp z,zona_11_banderas		;a8e3   ; zona_11_banderas: la zona 0x11: en la sala 5, el bit 1 de 0xD7DA
	cp 012h		;a8e6
	jp z,zona_12_banderas		;a8e8   ; zona_12_banderas: la zona 0x12: p10:AA14 y, en la sala 0x0E, el bit 2 de 0xD7DA; en las demas, el 1 de 0xD7DB
	cp 013h		;a8eb
	jp z,zona_13_banderas		;a8ed   ; zona_13_banderas: la zona 0x13: el bit 2 de 0xD7E0, p10:AA42, p10:AA4E, el 0 de 0xD7DB y, en las salas 0-3, el 5 de 0xD7DC
	ret			;a8f0
zona_0_banderas:		; la zona 0 en las salas 0x0A-0x0C: el bit 2 de 0xD7D0...
	ld a,(0ca4bh)		;a8f1   ; lee la sala de la zona
	cp 00ah		;a8f4   ; desde la sala 0x0A...
	ret c			;a8f6
	cp 00dh		;a8f7   ; ...hasta la 0x0C
	ret nc			;a8f9
	ld hl,0d7d0h		;a8fa   ; apunta a las banderas de la partida: la n en el bit 7 - n % 8 del byte n / 8 (p03:B0DC, p03:B0F6)
	set 2,(hl)		;a8fd   ; el bit 2 de 0xD7D0
	ld hl,0d7ddh		;a8ff
	res 3,(hl)		;a902   ; fuera el 3 de 0xD7DD
	ret			;a904
zona_1_banderas:		; la zona 1: fuera el bit 0 de 0xD7D0 y el bit 3 de 0xD7E2
	ld hl,0d7d0h		;a905   ; apunta a las banderas de la partida: la n en el bit 7 - n % 8 del byte n / 8 (p03:B0DC, p03:B0F6)
	res 0,(hl)		;a908   ; fuera el bit 0 de 0xD7D0
	ld hl,0d7e2h		;a90a
	set 3,(hl)		;a90d   ; el bit 3 de 0xD7E2
	ret			;a90f
zona_0a_banderas:		; la zona 0x0A: p10:A931 y, en las salas 9-0x18 salvo 0x0B, 0x0C, 0x10, 0x11 y 0x15, el bit 2 de 0xD7E0
	call zona_0a_d7e3		;a910   ; zona_0a_d7e3: en las salas 0x0B, 0x0C, 0x10 y 0x11, el bit 2 de 0xD7E3
	ld hl,0d7e0h		;a913
	ld a,(0ca4bh)		;a916   ; lee la sala de la zona
	cp 009h		;a919
	ret c			;a91b   ; por debajo de la 9, nada
	cp 00bh		;a91c   ; la 0x0B...
	ret z			;a91e
	cp 00ch		;a91f   ; ...la 0x0C...
	ret z			;a921
	cp 010h		;a922   ; ...la 0x10...
	ret z			;a924
	cp 011h		;a925   ; ...la 0x11...
	ret z			;a927
	cp 015h		;a928   ; ...y la 0x15, no
	ret z			;a92a
	cp 019h		;a92b
	ret nc			;a92d   ; desde la 0x19, nada
	set 2,(hl)		;a92e   ; el bit 2
	ret			;a930
zona_0a_d7e3:		; en las salas 0x0B, 0x0C, 0x10 y 0x11, el bit 2 de 0xD7E3
	ld hl,0d7e3h		;a931
	ld a,(0ca4bh)		;a934   ; lee la sala de la zona
	cp 00bh		;a937   ; la 0x0B...
	jr z,d7e3_2		;a939
	cp 00ch		;a93b   ; ...la 0x0C...
	jr z,d7e3_2		;a93d
	cp 010h		;a93f   ; ...la 0x10...
	jr z,d7e3_2		;a941
	cp 011h		;a943   ; ...o la 0x11
	ret nz			;a945
d7e3_2:
	set 2,(hl)		;a946
	ret			;a948
zona_0b_banderas:		; la zona 0x0B: el bit 0 de 0xD7D2, fuera el 0 de 0xD7DC y, en la sala 5, el 7 de 0xD7D3
	ld hl,0d7d2h		;a949
	set 0,(hl)		;a94c   ; el bit 0 de 0xD7D2
	ld hl,0d7dch		;a94e
	res 0,(hl)		;a951   ; fuera el 0 de 0xD7DC
	ld a,(0ca4bh)		;a953   ; lee la sala de la zona
	cp 005h		;a956   ; en la sala 5...
	ret nz			;a958
	ld hl,0d7d3h		;a959
	set 7,(hl)		;a95c   ; ...el bit 7 de 0xD7D3
	ret			;a95e
zona_0e_banderas:		; la zona 0x0E: en las salas 4 y 5, el bit 0 de 0xD7E0
	ld hl,0d7e0h		;a95f
	ld a,(0ca4bh)		;a962   ; lee la sala de la zona
	cp 004h		;a965   ; la sala 4...
	jr z,d7e0_0		;a967
	cp 005h		;a969   ; ...o la 5
	ret nz			;a96b
d7e0_0:
	set 0,(hl)		;a96c
	ret			;a96e
zona_0f_banderas:		; la zona 0x0F: en la sala 0, el bit 2 de 0xD7D3; en las demas, el 6 de 0xD7E3 y el 0 de 0xD7D3
	ld a,(0ca4bh)		;a96f   ; lee la sala de la zona
	or a			;a972
	jr z,zona_0f_sala_0		;a973   ; la sala 0, aparte
	ld hl,0d7e3h		;a975
	set 6,(hl)		;a978   ; el bit 6 de 0xD7E3
	ld hl,0d7d3h		;a97a
	set 0,(hl)		;a97d   ; el bit 0 de 0xD7D3
	ret			;a97f
zona_0f_sala_0:
	ld hl,0d7d3h		;a980
	set 2,(hl)		;a983   ; el bit 2 de 0xD7D3
	ret			;a985
zona_7_banderas:		; la zona 7: el bit 4 de 0xD7E3, p10:A9B5, p10:A9C4; en las salas 0x0B y 0x0D, el 7 de 0xD7DB; en la 0x0E y 0x0F, el 4 de 0xD7D2; en las cuatro, el 4 de 0xD7E0
	ld hl,0d7e3h		;a986
	set 4,(hl)		;a989   ; el bit 4 de 0xD7E3
	call zona_7_d7e1_7		;a98b   ; zona_7_d7e1_7: en las salas 0x10-0x13, el bit 7 de 0xD7E1
	call zona_7_d7e1_5		;a98e   ; zona_7_d7e1_5: en las salas 0, 1, 5, 6 y 0x0A, el bit 5 de 0xD7E1
	ld hl,0d7dbh		;a991
	ld a,(0ca4bh)		;a994   ; lee la sala de la zona
	cp 00bh		;a997   ; la 0x0B...
	jr z,d7db_7		;a999
	cp 00dh		;a99b   ; ...y la 0x0D: 0xD7DB
	jr z,d7db_7		;a99d
	cp 00eh		;a99f   ; la 0x0E...
	jr z,d7d2_4		;a9a1
	cp 00fh		;a9a3   ; ...y la 0x0F: 0xD7D2
	ret nz			;a9a5
d7d2_4:
	ld hl,0d7d2h		;a9a6
	set 4,(hl)		;a9a9   ; el bit 4 de 0xD7D2
	jr d7e0_4		;a9ab
d7db_7:
	set 7,(hl)		;a9ad   ; el bit 7 de 0xD7DB
d7e0_4:
	ld hl,0d7e0h		;a9af
	set 4,(hl)		;a9b2   ; el bit 4 de 0xD7E0
	ret			;a9b4
zona_7_d7e1_7:		; en las salas 0x10-0x13, el bit 7 de 0xD7E1
	ld hl,0d7e1h		;a9b5
	ld a,(0ca4bh)		;a9b8   ; lee la sala de la zona
	cp 010h		;a9bb   ; desde la 0x10...
	ret c			;a9bd
	cp 014h		;a9be   ; ...hasta la 0x13
	ret nc			;a9c0
	set 7,(hl)		;a9c1   ; el bit 7
	ret			;a9c3
zona_7_d7e1_5:		; en las salas 0, 1, 5, 6 y 0x0A, el bit 5 de 0xD7E1
	ld a,(0ca4bh)		;a9c4   ; lee la sala de la zona
	cp 002h		;a9c7   ; la 0 y la 1...
	jr c,d7e1_5		;a9c9
	cp 005h		;a9cb   ; ...la 5...
	jr z,d7e1_5		;a9cd
	cp 006h		;a9cf   ; ...la 6...
	jr z,d7e1_5		;a9d1
	cp 00ah		;a9d3   ; ...y la 0x0A
	ret nz			;a9d5
d7e1_5:
	ld hl,0d7e1h		;a9d6
	set 5,(hl)		;a9d9   ; el bit 5
	ret			;a9db
zona_0d_banderas:		; la zona 0x0D: en la sala 5, el bit 3 de 0xD7D6
	ld a,(0ca4bh)		;a9dc   ; lee la sala de la zona
	cp 005h		;a9df   ; solo la sala 5
	ret nz			;a9e1
	ld hl,0d7d6h		;a9e2
	set 3,(hl)		;a9e5   ; el bit 3
	ret			;a9e7
zona_8_banderas:		; la zona 8: el bit 0 de 0xD7D4
	ld hl,0d7d4h		;a9e8
	set 0,(hl)		;a9eb   ; el bit 0
	ret			;a9ed
zona_10_banderas:		; la zona 0x10: fuera el bit 1 de 0xD8E0
	ld hl,0d8e0h		;a9ee   ; apunta a de paso (en p00:4D5A: 1 = el juego de dibujos solo pinta las listas 6 y 7)
	res 1,(hl)		;a9f1   ; fuera el bit 1
	ret			;a9f3
zona_11_banderas:		; la zona 0x11: en la sala 5, el bit 1 de 0xD7DA
	ld a,(0ca4bh)		;a9f4   ; lee la sala de la zona
	cp 005h		;a9f7   ; solo la sala 5
	ret nz			;a9f9
	ld hl,0d7dah		;a9fa
	set 1,(hl)		;a9fd   ; el bit 1
	ret			;a9ff
zona_12_banderas:		; la zona 0x12: p10:AA14 y, en la sala 0x0E, el bit 2 de 0xD7DA; en las demas, el 1 de 0xD7DB
	call d7d8_7_si		;aa00   ; d7d8_7_si: en las salas 5, 7 y 9, el bit 7 de 0xD7D8
	ld hl,0d7dbh		;aa03
	ld a,(0ca4bh)		;aa06   ; lee la sala de la zona
	cp 00eh		;aa09   ; la sala 0x0E...
	jr nz,d7db_1		;aa0b
	dec hl			;aa0d
	set 2,(hl)		;aa0e   ; ...el bit 2 de 0xD7DA
	ret			;aa10
d7db_1:
	set 1,(hl)		;aa11   ; el bit 1 de 0xD7DB
	ret			;aa13
d7d8_7_si:		; en las salas 5, 7 y 9, el bit 7 de 0xD7D8
	ld a,(0ca4bh)		;aa14   ; lee la sala de la zona
	cp 005h		;aa17   ; la 5...
	jr z,d7d8_7		;aa19
	cp 007h		;aa1b   ; ...la 7...
	jr z,d7d8_7		;aa1d
	cp 009h		;aa1f   ; ...o la 9
	ret nz			;aa21
d7d8_7:
	ld hl,0d7d8h		;aa22
	set 7,(hl)		;aa25   ; el bit 7
	ret			;aa27
zona_13_banderas:		; la zona 0x13: el bit 2 de 0xD7E0, p10:AA42, p10:AA4E, el 0 de 0xD7DB y, en las salas 0-3, el 5 de 0xD7DC
	ld hl,0d7e0h		;aa28
	set 2,(hl)		;aa2b   ; el bit 2 de 0xD7E0
	call zona_13_sala_5		;aa2d   ; zona_13_sala_5: en la sala 5, el bit 1 de 0xD7D5
	call zona_13_sala_4		;aa30   ; zona_13_sala_4: en la sala 4, el bit 7 de 0xD7D8
	ld hl,0d7dbh		;aa33
	set 0,(hl)		;aa36   ; el bit 0 de 0xD7DB
	inc hl			;aa38
	ld a,(0ca4bh)		;aa39   ; lee la sala de la zona
	cp 004h		;aa3c   ; en las salas 0-3...
	ret nc			;aa3e
	set 5,(hl)		;aa3f   ; ...el bit 5 de 0xD7DC
	ret			;aa41
zona_13_sala_5:		; en la sala 5, el bit 1 de 0xD7D5
	ld a,(0ca4bh)		;aa42   ; lee la sala de la zona
	cp 005h		;aa45   ; solo la sala 5
	ret nz			;aa47
	ld hl,0d7d5h		;aa48
	set 1,(hl)		;aa4b   ; el bit 1
	ret			;aa4d
zona_13_sala_4:		; en la sala 4, el bit 7 de 0xD7D8
	ld a,(0ca4bh)		;aa4e   ; lee la sala de la zona
	cp 004h		;aa51   ; la sala 4
	jr z,d7d8_7		;aa53
	ret			;aa55
banderas_especiales:		; en la sala especial 0x39 sala 1, el bit 1 de 0xD7D8; en la 0x29 desde la sala 2, el 1 de 0xD7E1
	ld a,(0ca76h)		;aa56   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 039h		;aa59   ; la especial 0x39
	jr z,especial_39_banderas		;aa5b
	cp 029h		;aa5d   ; la 0x29
	ret nz			;aa5f
	ld a,(0ca4bh)		;aa60   ; lee la sala de la zona
	cp 002h		;aa63   ; desde la sala 2
	ret c			;aa65
	ld hl,0d7e1h		;aa66
	set 1,(hl)		;aa69   ; el bit 1 de 0xD7E1
	ret			;aa6b
especial_39_banderas:
	ld a,(0ca4bh)		;aa6c   ; lee la sala de la zona
	cp 001h		;aa6f   ; solo la sala 1
	ret nz			;aa71
	ld hl,0d7d8h		;aa72
	set 1,(hl)		;aa75   ; el bit 1 de 0xD7D8
	ret			;aa77
d800_de_p10:		; la ficha de 0xD800 (IX) de p04:8AA6 con 0xD8A4: con 0xC692 el sonido 0x84, R#23 (p10:AAA9) y su paso (p10:AA8F, 13 pasos)
	ld a,(0d8a4h)		;aa78
	and a			;aa7b
	ret z			;aa7c   ; sin 0xD8A4, nada
	ld hl,06bcch		;aa7d   ; con 0xC692, el sonido 0x84
	call 086d0h		;aa80   ; si_c692: con 0xC692, lo borra y salta a HL
	call r23_de_d8a5		;aa83   ; r23_de_d8a5: R#23 (el desplazamiento vertical) = 0xD8A5 con la pantalla partida, 0 sin ella
	ld a,(ix+001h)		;aa86   ; lee el paso de la ficha de 0xD800
	ld hl,0aa8fh		;aa89   ; tabla_AA8F: 13 destinos del despachador p00
	call 0424dh		;aa8c   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_AA8F: 13 destinos del despachador p00:424D (call en p10:AA8C, el
;   indice en A): AAB8, AADB, AAEB, AAFC, AB26, ABA5, ABD4, AC18, ABFE, AC88,
;   ACEA, AD03, AD0C; lo leen p10:AA8C (26 bytes)
;   0xaa8f..0xaaa9  (26 bytes)
DATA_tabla_AA8F:
	defw 0aab8h,0aadbh,0aaebh,0aafch,0ab26h,0aba5h,0abd4h,0ac18h	; aa8f
	defw 0abfeh,0ac88h,0aceah,0ad03h,0ad0ch	; aa9f

; ======================================================================
; CODIGO 0xaaa9..0xab9d  (244 bytes)
; ======================================================================


r23_de_d8a5:		; R#23 (el desplazamiento vertical) = 0xD8A5 con la pantalla partida, 0 sin ella
	ld a,(0ca1ch)		;aaa9   ; lee 1: la pantalla partida en la linea 0xB4 (arriba con desplazamiento, abajo la pagina 1 sin sprites)
	and a			;aaac
	jr z,pon_r23		;aaad   ; sin pantalla partida, 0
	ld a,(0d8a5h)		;aaaf
pon_r23:
	ld b,a			;aab2
	ld c,017h		;aab3   ; el registro 23
	jp 00047h		;aab5   ; BIOS WRTVDP - Writes data in the VDP-register
d800_p10_paso_0:		; 0xCB39 = 0, sin musica pendiente, el bit 2 de 0xD7D5, fuera el 6 de 0xD7E0, 0xCB3C = 1, p03:B67D en (0x60, 0x60), el sonido 0xA1 y el paso siguiente
	xor a			;aab8
	ld (0cb39h),a		;aab9   ; 0xCB39 = 0
	ld hl,00000h		;aabc   ; sin musica pendiente
	ld (0ca19h),hl		;aabf   ; guarda la musica pendiente: la rutina que la pide (16 bits)
	ld hl,0d7d5h		;aac2
	set 2,(hl)		;aac5   ; el bit 2 de 0xD7D5
	ld hl,0d7e0h		;aac7
	res 6,(hl)		;aaca   ; fuera el 6 de 0xD7E0
	inc a			;aacc
	ld (0cb3ch),a		;aacd   ; 0xCB3C = 1
	ld de,06060h		;aad0   ; el barrido desde (0x60, 0x60)
	call 07a33h		;aad3   ; a_p03_b67d_b_10: a_p03_b67d y deja el banco 10
	call 06b75h		;aad6   ; sonido_a1: pide el sonido 0xA1 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	jr paso_siguiente_d800_p10		;aad9
d800_p10_paso_1:		; p03:B6C8; al acabar el barrido, el mensaje 0x0D10 del banco 50 y el paso siguiente
	call 07a38h		;aadb   ; a_p03_b6c8_b_10: a_p03_b6c8 y deja el banco 10
	ld a,(0e270h)		;aade   ; lee el barrido: 1 por pasos, 2 de 4 en 4 (0 nada)
	and a			;aae1
	ret nz			;aae2   ; con el barrido, nada
	ld de,00d10h		;aae3   ; el mensaje 0x0D10
	call 061ceh		;aae6   ; mensaje_de_50: 0xD8A8 = 1: la ventana estrecha
	jr paso_siguiente_d800_p10		;aae9
d800_p10_paso_2:		; al acabar el mensaje: p01:7A3E, 0xD8A4 = 0, 0xCB3C = 0 y el paso siguiente
	call 061feh		;aaeb   ; mensaje_cada_cuadro_bancos_10:
	ret nz			;aaee   ; sin acabar, nada
	call 07a3eh		;aaef   ; llama_7a27_1_bancos_10:
	xor a			;aaf2
	ld (0d8a4h),a		;aaf3   ; 0xD8A4 = 0
cb3c_y_paso:
	xor a			;aaf6
	ld (0cb3ch),a		;aaf7   ; 0xCB3C = 0
	jr paso_siguiente_d800_p10		;aafa
d800_p10_paso_3:		; en la sala 8: 0xCB3C = 1, la pantalla partida, 0xD8A5 = 0, el dibujo 0, el byte 0x11 = 1, 0x80 cuadros, la Y = 0, la X = 0x60 y el paso siguiente
	ld a,(0ca4bh)		;aafc   ; lee la sala de la zona
	cp 008h		;aaff
	ret nz			;ab01   ; fuera de la sala 8, nada
	ld a,001h		;ab02
	ld (0cb3ch),a		;ab04   ; 0xCB3C = 1
	ld (0ca1ch),a		;ab07   ; la pantalla partida
	xor a			;ab0a
	ld (0d8a5h),a		;ab0b   ; 0xD8A5 = 0
	ld (ix+00dh),a		;ab0e   ; guarda el dibujo de la ficha de 0xD800
	inc a			;ab11
	ld (ix+011h),a		;ab12   ; el byte 0x11 = 1
	ld (ix+00eh),080h		;ab15   ; la espera de la ficha de 0xD800 = 0x80
	ld (ix+003h),000h		;ab19   ; la Y de la ficha de 0xD800 = 0x00
	ld a,060h		;ab1d
	ld (ix+005h),a		;ab1f   ; la X = 0x60
paso_siguiente_d800_p10:
	inc (ix+001h)		;ab22   ; sube el paso de la ficha de 0xD800
	ret			;ab25
d800_p10_paso_4:		; la cuenta: la ficha baja uno y 0xD8A5 tambien (la pantalla de arriba sube), una linea de 0x60 de la pagina 2 y cada 5 cuadros el dibujo siguiente (p10:AB58); al acabar, el sonido 0xA1, el mensaje 0x0EC0 y el paso siguiente
	dec (ix+00eh)		;ab26   ; baja la espera de la ficha de 0xD800
	jr z,d800_p10_fin_4		;ab29
	inc (ix+003h)		;ab2b   ; baja
	ld hl,0d8a5h		;ab2e   ; la pantalla de arriba
	dec (hl)			;ab31   ; la pantalla de arriba sube
	ld a,(ix+00eh)		;ab32   ; lee la espera de la ficha de 0xD800
	ld b,a			;ab35
	add a,040h		;ab36   ; la linea 0x40 + la cuenta...
	ld l,a			;ab38
	ld h,000h		;ab39
	add a,040h		;ab3b
	ld e,a			;ab3d   ; ...a 0x80 + la cuenta
	ld d,030h		;ab3e
	ld bc,06001h		;ab40   ; una linea de 0x60
	ld a,002h		;ab43   ; de la pagina 2 a la 0
	call 04767h		;ab45   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
	ld bc,00501h		;ab48   ; cada 5 cuadros, uno mas
	jr dibujo_d800_p10		;ab4b
d800_p10_fin_4:
	call 06b75h		;ab4d   ; sonido_a1: pide el sonido 0xA1 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld de,00ec0h		;ab50   ; el mensaje 0x0EC0
	call 061ceh		;ab53   ; mensaje_de_50: 0xD8A8 = 1: la ventana estrecha
	jr paso_siguiente_d800_p10		;ab56
dibujo_d800_p10:		; cada B cuadros (byte 0x11) el dibujo + C (0-3); en los impares, el sonido 0x97 (paso 4) o 0x65; y lo pinta (p10:AB7D)
	dec (ix+011h)		;ab58   ; la cuenta del byte 0x11
	ret nz			;ab5b
	ld (ix+011h),b		;ab5c   ; otra vez B
	ld a,(ix+00dh)		;ab5f   ; lee el dibujo de la ficha de 0xD800
	add a,c			;ab62   ; + C, de 0 a 3
	and 003h		;ab63
	ld (ix+00dh),a		;ab65   ; guarda el dibujo de la ficha de 0xD800
	push af			;ab68
	rr a		;ab69   ; los impares...
	jr nc,pinta_dibujo_d800		;ab6b
	ld a,(ix+001h)		;ab6d   ; lee el paso de la ficha de 0xD800
	cp 004h		;ab70   ; ...en el paso 4, el 0x97
	jr nz,sonido_65_d800		;ab72
	call 06cbah		;ab74   ; sonido_97: pide el sonido 0x97 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	jr pinta_dibujo_d800		;ab77
sonido_65_d800:
	call 06cb6h		;ab79   ; sonido_65: pide el sonido 0x65
pinta_dibujo_d800:
	pop af			;ab7c
dibujo_ab9d:		; el dibujo A (p10:AB9D): 0x38 lineas de 0x28 de la pagina 2 desde (X, 0x40) a (D, 0xC8)
	ld hl,0ab9dh		;ab7d
	call 043f6h		;ab80   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld d,l			;ab83   ; D = la X de destino
	ld l,040h		;ab84   ; L = 0x40
	ld e,0c8h		;ab86   ; E = 0xC8
	ld b,038h		;ab88   ; 0x38 lineas
linea_de_dibujo:
	push hl			;ab8a
	push de			;ab8b
	push bc			;ab8c
	ld a,002h		;ab8d   ; de la pagina 2 a la 0
	ld bc,02801h		;ab8f   ; 0x28 x 1
	call 04767h		;ab92   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
	pop bc			;ab95
	pop de			;ab96
	pop hl			;ab97
	inc l			;ab98   ; la linea siguiente
	inc e			;ab99
	djnz linea_de_dibujo		;ab9a
	ret			;ab9c

; ----------------------------------------------------------------------
; DATOS resto_AB9D: lo apuntan con el banco puesto p10:AB7D (0xAB9D); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p10:AB7D (8 bytes)
;   0xab9d..0xaba5  (8 bytes)
DATA_resto_AB9D:
	defb 030h,060h,068h,088h,030h,0b0h,068h,0d8h	; ab9d  0`h.0.h.

; ======================================================================
; CODIGO 0xaba5..0xad8e  (489 bytes)
; ======================================================================


d800_p10_paso_5:		; al acabar el mensaje: p01:7A3E, la pantalla de arriba a su sitio (0xC0 x 0x28), el byte 0x0F = 0xA0, los bytes 0x11 y 0x16 = 1, 0xCB3C = 0, el paso siguiente, el sonido 5 y p04:8685
	call 061feh		;aba5   ; mensaje_cada_cuadro_bancos_10:
	ret nz			;aba8   ; sin acabar, nada
	call 07a3eh		;aba9   ; llama_7a27_1_bancos_10:
	ld a,(0d8a5h)		;abac   ; Y = 0xD8 + 0xD8A5...
	add a,0d8h		;abaf
	ld e,a			;abb1
	xor a			;abb2
	ld l,a			;abb3
	ld h,a			;abb4
	ld d,a			;abb5
	ld bc,0c028h		;abb6   ; ...0xC0 x 0x28 a (0, 0)
	call 04767h		;abb9   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
	ld (ix+00fh),0a0h		;abbc   ; el byte 0x0F = 0xA0
	ld a,001h		;abc0
	ld (ix+011h),a		;abc2   ; el byte 0x11 = 1
	ld (ix+016h),a		;abc5   ; el byte 0x16 = 1
	ld (ix+016h),a		;abc8
	call cb3c_y_paso		;abcb   ; cb3c_y_paso:
	call 06b12h		;abce   ; sonido_05: pide el sonido 0x05
	jp 08685h		;abd1   ; por_el_tipo_8698: por el byte del tipo en p04:8698 (p04:8691)
d800_p10_paso_6:		; baja de 2 en 2 (p10:ABE6) hasta la Y del byte 0x0F; alli, 0x31 cuadros, el byte 0x0F y el 0x18 a cero y el paso siguiente
	call baja_2		;abd4   ; baja_2: el dibujo cada 2 cuadros, la Y + 2 y 0xD8A5 - 2; acarreo por encima del byte 0x0F
	ret c			;abd7   ; sin llegar, sigue
d800_p10_fin_6:
	ld (ix+00eh),031h		;abd8   ; la espera de la ficha de 0xD800 = 0x31
	xor a			;abdc
	ld (ix+00fh),a		;abdd   ; el byte 0x0F = 0
	ld (ix+018h),a		;abe0   ; el byte 0x18 = 0
	jp paso_siguiente_d800_p10		;abe3   ; paso_siguiente_d800_p10:
baja_2:		; el dibujo cada 2 cuadros, la Y + 2 y 0xD8A5 - 2; acarreo por encima del byte 0x0F
	ld bc,00201h		;abe6   ; cada 2 cuadros, hacia delante
	call dibujo_d800_p10		;abe9   ; dibujo_d800_p10: cada B cuadros (byte 0x11) el dibujo + C (0-3); en los impares, el sonido 0x97 (paso 4) o 0x65; y lo pinta (p10:AB7D)
	inc (ix+003h)		;abec   ; sube la Y de la ficha de 0xD800
	inc (ix+003h)		;abef   ; sube la Y de la ficha de 0xD800
	ld hl,0d8a5h		;abf2   ; la pantalla de arriba...
	dec (hl)			;abf5   ; ...2 mas
	dec (hl)			;abf6
	ld a,(ix+003h)		;abf7   ; lee la Y de la ficha de 0xD800
	cp (ix+00fh)		;abfa   ; hasta el byte 0x0F
	ret			;abfd
d800_p10_paso_8:		; sube (p10:AC04) hasta la Y del byte 0x0F; alli, como el paso 6
	call sube_1		;abfe   ; sube_1: el dibujo cada 4 cuadros hacia atras, la Y - 1 y 0xD8A5 + 1; acarreo por encima del byte 0x0F
	ret nc			;ac01   ; sin llegar, sigue
	jr d800_p10_fin_6		;ac02
sube_1:		; el dibujo cada 4 cuadros hacia atras, la Y - 1 y 0xD8A5 + 1; acarreo por encima del byte 0x0F
	ld bc,004ffh		;ac04   ; cada 4 cuadros, hacia atras
	call dibujo_d800_p10		;ac07   ; dibujo_d800_p10: cada B cuadros (byte 0x11) el dibujo + C (0-3); en los impares, el sonido 0x97 (paso 4) o 0x65; y lo pinta (p10:AB7D)
	dec (ix+003h)		;ac0a   ; baja la Y de la ficha de 0xD800
	ld hl,0d8a5h		;ac0d   ; la pantalla de arriba...
	inc (hl)			;ac10   ; ...1 menos
	ld a,(ix+003h)		;ac11   ; lee la Y de la ficha de 0xD800
	cp (ix+00fh)		;ac14   ; hasta el byte 0x0F
	ret			;ac17
d800_p10_paso_7:		; la cuenta: cada 8 cuadros, salvo con Snake en X 0x50-0x6F a menos de 0x20 por debajo en Y, lanza el tipo 6 con el desplazamiento 0xE0 hacia la X de Snake + el byte 0x0F * 4 - 4; al acabar, p10:AC4B
	dec (ix+00eh)		;ac18   ; baja la espera de la ficha de 0xD800
	jr z,d800_p10_otra_vuelta		;ac1b   ; al acabar, otra vuelta
	ld a,(ix+00eh)		;ac1d   ; lee la espera de la ficha de 0xD800
	and 007h		;ac20   ; cada 8 cuadros
	ret nz			;ac22   ; solo cada 8
	ld a,(0cb03h)		;ac23   ; L = la Y de Snake...
	ld l,a			;ac26
	ld a,(0cb05h)		;ac27   ; ...H = la X
	ld h,a			;ac2a
	sub 050h		;ac2b   ; X 0x50-0x6F...
	cp 020h		;ac2d   ; en X 0x50-0x6F...
	jr nc,lanza_hacia_snake_p10		;ac2f
	ld a,(ix+003h)		;ac31   ; ...y cerca por debajo: nada
	sub l			;ac34   ; ...a menos de 0x20 por debajo...
	add a,008h		;ac35
	cp 028h		;ac37
	ret c			;ac39   ; ...nada
lanza_hacia_snake_p10:		; la X + el byte 0x0F * 4 - 4 (uno mas cada vez)
	ld a,(ix+00fh)		;ac3a
	inc (ix+00fh)		;ac3d
	add a,a			;ac40
	add a,a			;ac41
	add a,00ch		;ac42
	add a,h			;ac44
	sub 010h		;ac45
	ld h,a			;ac47
	jp 09b30h		;ac48   ; lanza el 6
d800_p10_otra_vuelta:		; el byte 0x11 = 1; desde el paso 7: el dibujo hacia atras, el byte 0x0F = 0x60-0x7F al azar y el paso 8; si no, hacia delante, 0xB4 - (0-0x1F) y el paso 6
	ld (ix+011h),001h		;ac4b   ; el byte 0x11 = 1
	ld a,(ix+001h)		;ac4f   ; lee el paso de la ficha de 0xD800
	cp 007h		;ac52   ; el paso 7...
	jr nz,d800_p10_al_6		;ac54
	ld a,(ix+00dh)		;ac56   ; lee el dibujo de la ficha de 0xD800
	dec a			;ac59   ; ...hacia atras
	and 003h		;ac5a
	ld (ix+00dh),a		;ac5c   ; guarda el dibujo de la ficha de 0xD800
	call 04256h		;ac5f   ; azar: A = un numero al azar (0xCA03 rotado mas R)
	and 01fh		;ac62   ; 0x60-0x7F al azar
	add a,060h		;ac64
	ld (ix+00fh),a		;ac66
	ld (ix+001h),008h		;ac69   ; el paso de la ficha de 0xD800 = 0x08
	ret			;ac6d
d800_p10_al_6:
	ld a,(ix+00dh)		;ac6e   ; lee el dibujo de la ficha de 0xD800
	inc a			;ac71   ; hacia delante
	and 003h		;ac72
	ld (ix+00dh),a		;ac74   ; guarda el dibujo de la ficha de 0xD800
	call 04256h		;ac77   ; azar: A = un numero al azar (0xCA03 rotado mas R)
	and 01fh		;ac7a   ; 0xB4 - (0-0x1F)
	neg		;ac7c
	add a,0b4h		;ac7e
	ld (ix+00fh),a		;ac80
	ld (ix+001h),006h		;ac83   ; el paso de la ficha de 0xD800 = 0x06
	ret			;ac87
d800_p10_paso_9:		; la cuenta; cada 16 cuadros (dos veces, byte 0x18) una ficha de 0xD4C0 en (Y - 0x58, 0x38) o (Y - 0x48, 0x80) con el tipo 3 o 4 y el sonido 0x1D; al acabar, p10:AC4B
	dec (ix+00eh)		;ac88   ; baja la espera de la ficha de 0xD800
	jr z,d800_p10_otra_vuelta		;ac8b   ; al acabar, otra vuelta
	ld a,(ix+00eh)		;ac8d   ; lee la espera de la ficha de 0xD800
	add a,004h		;ac90   ; cada 16 cuadros
	and 00fh		;ac92
	ret nz			;ac94   ; cada 16 cuadros
	inc (ix+018h)		;ac95   ; hasta dos
	ld a,(ix+018h)		;ac98
	cp 003h		;ac9b
	ret nc			;ac9d   ; hasta 2
	rra			;ac9e
	ld a,(ix+003h)		;ac9f   ; las impares: (Y - 0x58, 0x38)
	jr nc,ficha_d4c0_derecha		;aca2
	sub 058h		;aca4   ; Y - 0x58...
	ld e,a			;aca6
	ld d,038h		;aca7   ; ...X = 0x38
	jr ficha_d4c0_libre		;aca9
ficha_d4c0_derecha:		; las pares: (Y - 0x48, 0x80)
	sub 048h		;acab   ; Y - 0x48...
	ld e,a			;acad
	ld d,080h		;acae   ; ...X = 0x80
ficha_d4c0_libre:		; la primera libre de las dos de 0xD4C0
	ld hl,0d4c0h		;acb0   ; apunta a 2 fichas de 16 bytes; tocan a Snake con 0x18 de dano (p07:B309)
	ld bc,00200h		;acb3   ; 2 fichas; C = su sprite
mira_d4c0:
	ld a,(hl)			;acb6
	and a			;acb7   ; libre: esa
	jr z,pon_ficha_d4c0		;acb8   ; libre: esa
	ld a,010h		;acba
	call 0423eh		;acbc   ; suma_a_hl: HL = HL + A
	inc c			;acbf   ; el sprite siguiente
	inc c			;acc0
	djnz mira_d4c0		;acc1
	ret			;acc3   ; ninguna libre, nada
pon_ficha_d4c0:		; a cero...
	push hl			;acc4
	push de			;acc5
	push bc			;acc6
	ld bc,0000fh		;acc7
	call 04236h		;acca   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	pop bc			;accd
	pop de			;acce
	pop hl			;accf
	ld (hl),001h		;acd0   ; ...activa...
	inc l			;acd2
	inc l			;acd3
	inc l			;acd4
	ld (hl),e			;acd5   ; ...la Y...
	inc l			;acd6
	inc l			;acd7
	ld (hl),d			;acd8   ; ...la X...
	inc l			;acd9
	inc l			;acda
	dec a			;acdb   ; el impar...
	ld a,003h		;acdc   ; ...el tipo 3 o 4...
	jr z,tipo_d4c0		;acde   ; ...tipo 3...
	inc a			;ace0   ; ...el par, tipo 4
tipo_d4c0:
	ld (hl),a			;ace1
	ld a,007h		;ace2   ; al byte 0x0E...
	add a,l			;ace4
	ld l,a			;ace5
	ld (hl),c			;ace6   ; ...y su sprite
	jp 06a6fh		;ace7   ; sonido_1d: pide el sonido 0x1D
d800_p10_paso_10:		; 0xCB3C = 1, el byte 0x0F = 0x88; en Y = 0x88, el paso 0x20; por encima, el paso siguiente (baja); por debajo, el paso 0x0C (sube)
	ld a,001h		;acea
	ld (0cb3ch),a		;acec   ; 0xCB3C = 1
	ld (ix+00fh),088h		;acef   ; el byte 0x0F = 0x88
	ld a,(ix+003h)		;acf3   ; lee la Y de la ficha de 0xD800
	cp 088h		;acf6
	jr z,d800_p10_al_20		;acf8   ; en 0x88, el paso 0x20
	ld a,00ch		;acfa   ; por debajo, el paso 0x0C
	jp c,paso_siguiente_d800_p10		;acfc   ; paso_siguiente_d800_p10:
	ld (ix+001h),a		;acff   ; guarda el paso de la ficha de 0xD800
	ret			;ad02
d800_p10_paso_11:		; baja hasta 0x88 y el paso 0x20
	call baja_2		;ad03   ; baja_2: el dibujo cada 2 cuadros, la Y + 2 y 0xD8A5 - 2; acarreo por encima del byte 0x0F
	ret c			;ad06   ; sin llegar, sigue
d800_p10_al_20:
	ld (ix+001h),020h		;ad07   ; el paso de la ficha de 0xD800 = 0x20
	ret			;ad0b
d800_p10_paso_12:		; sube hasta 0x88 y el paso 0x20
	call sube_1		;ad0c   ; sube_1: el dibujo cada 4 cuadros hacia atras, la Y - 1 y 0xD8A5 + 1; acarreo por encima del byte 0x0F
	ret nc			;ad0f   ; sin llegar, sigue
	jr d800_p10_al_20		;ad10
sprites_ad8e:		; los sprites de p10:AD21 y, cada 8 cuadros (byte 0x0F), el sonido 0x15
	call sprites_de_ad8e		;ad12   ; sprites_de_ad8e: 8 sprites desde 0xDC28 con las Y y X de p10:AD8E (segun el byte 0x0F & 0x0C), los patrones de p10:ADAE (+ 4 cada par) y los colores de las rachas de p10:ADB2
	inc (ix+00fh)		;ad15   ; uno mas al byte 0x0F
	ld a,(ix+00fh)		;ad18
	and 007h		;ad1b
	ret nz			;ad1d   ; cada 8, el sonido
	jp 06a48h		;ad1e   ; sonido_15: pide el sonido 0x15
sprites_de_ad8e:		; 8 sprites desde 0xDC28 con las Y y X de p10:AD8E (segun el byte 0x0F & 0x0C), los patrones de p10:ADAE (+ 4 cada par) y los colores de las rachas de p10:ADB2
	ld a,(ix+00fh)		;ad21
	and 00ch		;ad24   ; la parte (byte 0x0F & 0x0C)...
	add a,a			;ad26
	ld hl,0ad8eh		;ad27   ; ...de p10:AD8E
	call 0423eh		;ad2a   ; suma_a_hl: HL = HL + A
	ld de,0dc28h		;ad2d   ; desde el sprite 10
	ldi		;ad30   ; la Y y la X de cada sprite (dos veces cada pareja)
	ldi		;ad32
	inc de			;ad34
	inc de			;ad35
	dec hl			;ad36
	dec hl			;ad37
	ldi		;ad38
	ldi		;ad3a
	inc de			;ad3c
	inc de			;ad3d
	ldi		;ad3e
	ldi		;ad40
	inc de			;ad42
	inc de			;ad43
	dec hl			;ad44
	dec hl			;ad45
	ldi		;ad46
	ldi		;ad48
	inc de			;ad4a
	inc de			;ad4b
	ldi		;ad4c
	ldi		;ad4e
	inc de			;ad50
	inc de			;ad51
	dec hl			;ad52
	dec hl			;ad53
	ldi		;ad54
	ldi		;ad56
	inc de			;ad58
	inc de			;ad59
	ldi		;ad5a
	ldi		;ad5c
	inc de			;ad5e
	inc de			;ad5f
	dec hl			;ad60
	dec hl			;ad61
	ldi		;ad62
	ldi		;ad64
	ld a,(ix+00fh)		;ad66   ; el patron (byte 0x0F & 3)...
	and 003h		;ad69
	ld hl,0adaeh		;ad6b   ; ...de p10:ADAE
	call 0423eh		;ad6e   ; suma_a_hl: HL = HL + A
	ld de,0dc2ah		;ad71   ; al patron del sprite 10
	ld b,004h		;ad74   ; 4 parejas
patrones_ad76:
	ld a,(hl)			;ad76
	ld (de),a			;ad77
	inc de			;ad78
	inc de			;ad79
	inc de			;ad7a
	inc de			;ad7b
	add a,004h		;ad7c   ; el siguiente, + 4
	ld (de),a			;ad7e
	inc de			;ad7f
	inc de			;ad80
	inc de			;ad81
	inc de			;ad82
	djnz patrones_ad76		;ad83
	ld hl,0daa0h		;ad85   ; los colores
	ld de,0adb2h		;ad88
	jp 051e0h		;ad8b   ; rachas_a_ram: deshace las rachas de DE en HL (n < 0x80 repite, n > 0x80 copia, 0 acaba)

; ----------------------------------------------------------------------
; DATOS resto_AD8E: lo apuntan con el banco puesto p10:AD27 (0xAD8E), p10:AD6B
;   (0xADAE), p10:AD88 (0xADB2); el tamano es lo que hay hasta lo siguiente,
;   no sale de recorrerlo; lo leen p10:AD27, p10:AD6B, p10:AD88 (53 bytes)
;   0xad8e..0xadc3  (53 bytes)
DATA_resto_AD8E:
	defb 078h,030h,068h,040h,068h,070h,048h,070h,078h,040h,058h,040h,078h,070h,060h,070h	; ad8e  x0h@hpHpx@X@xp`p
	defb 070h,040h,050h,040h,078h,080h,058h,070h,068h,038h,048h,040h,068h,078h,050h,070h	; ad9e  p@P@x.Xph8H@hxPp
	defb 028h,030h,038h,03ch,010h,007h,010h,04ah,010h,007h,010h,04ah,010h,007h,010h,04ah	; adae  (08<...J...J...J
	defb 010h,007h,010h,04ah,000h	; adbe

; ======================================================================
; CODIGO 0xadc3..0xae28  (101 bytes)
; ======================================================================


sprites_ae8c:		; los sprites del juego (byte 0x0F / 4) de p10:AE8C (p10:ADE0) y, cada 8 cuadros, el sonido 0x14
	ld a,(ix+00fh)		;adc3   ; el juego: byte 0x0F / 4...
	rrca			;adc6
	rrca			;adc7
	and 007h		;adc8
	ld hl,0ae8ch		;adca   ; ...de p10:AE8C
	call 043f6h		;adcd   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ex de,hl			;add0
	call sprites_de_ae28		;add1   ; sprites_de_ae28: los sprites 10-17 fuera y los del dibujo (byte 0x0F & 3) de p10:AE28: B sprites [dY][dX][patron][color] sumados a DE, con sus 16 colores
	ld a,(ix+00fh)		;add4
	inc (ix+00fh)		;add7   ; uno mas al byte 0x0F
	and 007h		;adda   ; cada 8, el sonido 0x14
	jp z,06a44h		;addc   ; sonido_14: pide el sonido 0x14
	ret			;addf
sprites_de_ae28:		; los sprites 10-17 fuera y los del dibujo (byte 0x0F & 3) de p10:AE28: B sprites [dY][dX][patron][color] sumados a DE, con sus 16 colores
	push de			;ade0
	ld hl,0dc28h		;ade1   ; los sprites 10-17...
	ld bc,0001fh		;ade4
	ld a,0e0h		;ade7   ; ...a 0xE0
	call 04237h		;ade9   ; llena_bloque: pone A en BC + 1 bytes desde HL
	pop de			;adec
	ld a,(ix+00fh)		;aded   ; el dibujo (byte 0x0F & 3)...
	and 003h		;adf0
	ld hl,0ae28h		;adf2   ; ...de p10:AE28
	call 043f6h		;adf5   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld b,(hl)			;adf8   ; B = cuantos sprites
	inc hl			;adf9
	exx			;adfa
	ld hl,0dc28h		;adfb   ; desde el sprite 10...
	ld de,0daa0h		;adfe   ; ...y sus colores
	exx			;ae01
sprite_ae28:
	ld a,(hl)			;ae02   ; la Y + E
	add a,e			;ae03
	exx			;ae04
	ld (hl),a			;ae05
	inc hl			;ae06
	exx			;ae07
	inc hl			;ae08
	ld a,(hl)			;ae09   ; la X + D
	add a,d			;ae0a
	exx			;ae0b
	ld (hl),a			;ae0c
	inc hl			;ae0d
	exx			;ae0e
	inc hl			;ae0f
	ld a,(hl)			;ae10   ; el patron
	exx			;ae11
	ld (hl),a			;ae12
	inc hl			;ae13
	inc hl			;ae14
	exx			;ae15
	inc hl			;ae16
	ld a,(hl)			;ae17   ; el color...
	exx			;ae18
	push hl			;ae19
	ex de,hl			;ae1a   ; ...16 lineas
	ld bc,0000fh		;ae1b
	call 04237h		;ae1e   ; llena_bloque: pone A en BC + 1 bytes desde HL
	pop hl			;ae21
	inc de			;ae22
	exx			;ae23
	inc hl			;ae24
	djnz sprite_ae28		;ae25
	ret			;ae27

; ----------------------------------------------------------------------
; DATOS resto_AE28: lo apuntan con el banco puesto p10:ADF2 (0xAE28), p10:ADCA
;   (0xAE8C); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p10:ADF2, p10:ADCA (116 bytes)
;   0xae28..0xae9c  (116 bytes)
DATA_resto_AE28:
	defb 030h,0aeh,03dh,0aeh,05ah,0aeh,077h,0aeh,003h,008h,009h,080h,007h,008h,009h,07ch	; ae28  0.=.Z.w........|
	defb 00ah,008h,000h,078h,00ah,007h,009h,010h,09ch,007h,010h,002h,098h,007h,003h,006h	; ae38  ...x............
	defb 094h,007h,010h,010h,090h,00ah,010h,000h,08ch,00ah,000h,010h,088h,00ah,000h,000h	; ae48  ................
	defb 084h,00ah,007h,000h,008h,0b8h,00ah,010h,010h,0b4h,00ah,010h,000h,0b0h,00ah,010h	; ae58  ................
	defb 010h,0ach,003h,010h,000h,0a8h,003h,000h,010h,0a4h,003h,000h,000h,0a0h,003h,005h	; ae68  ................
	defb 009h,004h,0cch,00ah,004h,00ch,0c8h,00ah,00bh,010h,0c4h,003h,000h,008h,0c0h,003h	; ae78  ................
	defb 00ah,003h,0bch,003h,028h,068h,000h,028h,000h,058h,020h,040h,048h,050h,018h,030h	; ae88  ....(h.(.X @HP.0
	defb 020h,058h,030h,040h	; ae98

; ======================================================================
; CODIGO 0xae9c..0xafc2  (294 bytes)
; ======================================================================


puntos_que_giran:		; 0x44 puntos de 2 x 2 a negro desde (0x80 + (byte 0x0E / 2 * 11) mod 0x60, 0x30), cada uno 2 mas abajo y 0x1B mas a la derecha (en vuelta de 0x60)
	ld hl,03080h		;ae9c   ; desde (0x80, 0x30)
	ld c,(ix+00eh)		;ae9f   ; lee la espera de la ficha de 0xD800
	srl c		;aea2   ; la espera / 2...
	ld b,00bh		;aea4   ; ...11 veces...
	xor a			;aea6
mod_60:
	add a,c			;aea7
	cp 060h		;aea8   ; ...en vuelta de 0x60
	jr c,desplaza_mod		;aeaa
	sub 060h		;aeac
desplaza_mod:
	djnz mod_60		;aeae
	ld c,h			;aeb0
	add a,h			;aeb1   ; + la X
	ld h,a			;aeb2
	ld a,c			;aeb3
	add a,060h		;aeb4   ; el tope: X + 0x60
	ld c,a			;aeb6
	ld b,044h		;aeb7   ; 0x44 puntos
punto_negro:
	push hl			;aeb9
	push bc			;aeba
	ld a,(0ca42h)		;aebb   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	ld d,a			;aebe
	xor a			;aebf
	ld bc,00202h		;aec0   ; 2 x 2 a 0
	call 046ffh		;aec3   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
	pop bc			;aec6
	pop hl			;aec7
	inc l			;aec8   ; 2 mas abajo
	inc l			;aec9
	ld a,h			;aeca
	add a,01bh		;aecb   ; 0x1B a la derecha...
	cp c			;aecd
	jr c,siguiente_punto		;aece
	sub 060h		;aed0   ; ...en vuelta
siguiente_punto:
	ld h,a			;aed2
	djnz punto_negro		;aed3
	ret			;aed5
pantalla_f2:		; la pantalla de F2 (p01:74FD): la vida que se va, p10:BBDD; con 0xD701 = 1, cada cuadro (p10:B185); si no, la monta: 0xCB52 = 0xCB5C = 0, con la pantalla apagada sin 0xDF80 ni desplazamiento, R#7 = 0x0F, la paleta de la sala, sin sprites, 0xD700-0xD70F (p10:AFB2), lo de p10:AF88, el cursor (p10:B880) a 0xD704, p10:B3F9 y p10:B8C7; 0xCABD = 1 y todo encendido
	call 0642ch		;aed6   ; vida_que_se_va: con 0xCB4B (y sin 0xCB3C), la vida baja un punto cada 16 cuadros (0xCB4E)
	call cb4b_sin_cosas		;aed9   ; cb4b_sin_cosas: con 0xCB4B y sin ninguna de las 0x31 cosas de 0xD600: el bit 2 de 0xD7D9, fuera el 0 de 0xD7D5, 0xCB4B = 0xE1E8 = 0...
	ld a,(0d701h)		;aedc   ; con 0xD701 = 1...
	dec a			;aedf
	jp z,f2_cada_cuadro		;aee0   ; ...cada cuadro
	ld hl,0cb52h		;aee3
	ld (hl),000h		;aee6   ; 0xCB52 = 0
	ld hl,0cb5ch		;aee8
	ld (hl),000h		;aeeb   ; 0xCB5C = 0
	call 04650h		;aeed   ; espera_vdp: espera a que el VDP acabe la orden en curso (S#2 bit 0)
	call 045f1h		;aef0   ; pantalla apagada
	call borra_df80_p10		;aef3   ; 0xDF80 a cero
	call 045beh		;aef6   ; scroll_a_cero: R#23 = 0 (el desplazamiento vertical)
	ld bc,00f07h		;aef9   ; el borde al 0x0F
	call 00047h		;aefc   ; BIOS WRTVDP - Writes data in the VDP-register
	call 0846fh		;aeff   ; paleta_de_la_sala_bancos_10:
	call 04266h		;af02   ; sin sprites
	call 045d7h		;af05   ; esconde_sprites_vram: llena con 0xE0 128 bytes de la VRAM en 0xF600 y otros 128 en 0xF200
	call d700_de_f2		;af08   ; 0xD700-0xD70F
	call lo_de_f2		;af0b   ; lo de la pantalla
	ld c,007h		;af0e   ; el cursor...
	call cosa_del_cursor		;af10   ; cosa_del_cursor: A = la cosa de la lista 0xD710 en el cursor (fila 0xD703 * C + columna 0xD702)
	ld (0d704h),a		;af13   ; ...lo elegido a 0xD704
	call cuenta_f2		;af16   ; cuenta_f2: la cuenta de lo elegido de 0xD600 en (0xE0, 0x88)
	call letrero_de_lo_elegido		;af19   ; letrero_de_lo_elegido: el letrero de lo elegido de p50:8046 y, para la 7, su recuadro (p10:B8D5)
	ld hl,0cabdh		;af1c   ; 0xCABD = 1
	ld (hl),001h		;af1f   ; 0xCABD = 1
	call 04650h		;af21   ; espera_vdp: espera a que el VDP acabe la orden en curso (S#2 bit 0)
	jp 04606h		;af24   ; enciende_todo: la pantalla y los sprites encendidos
borra_df80_p10:		; 0xDF80-0xDFBF a cero
	ld hl,0df80h		;af27   ; apunta a 8 fichas de 8 bytes [tipo][dibujo][Y][X][fila][columna][espera][grafico] que suenan 0x14 en la sala y 0x15 al lado
	ld bc,0003fh		;af2a   ; 0x40 bytes
	jp 04236h		;af2d   ; borra_bloque: pone a cero BC + 1 bytes desde HL
pantalla_f3:		; la pantalla de F3 (p01:750B): como la de F2 con 0xD700 de p10:AFCD, lo de p10:AFA0, p10:B401, p10:B926, p10:B17D, los sprites a la VRAM y 0xCA70 = la fila y la columna de la sala
	call 0642ch		;af30   ; vida_que_se_va: con 0xCB4B (y sin 0xCB3C), la vida baja un punto cada 16 cuadros (0xCB4E)
	call cb4b_sin_cosas		;af33   ; cb4b_sin_cosas: con 0xCB4B y sin ninguna de las 0x31 cosas de 0xD600: el bit 2 de 0xD7D9, fuera el 0 de 0xD7D5, 0xCB4B = 0xE1E8 = 0...
	ld a,(0d701h)		;af36   ; con 0xD701 = 1...
	dec a			;af39
	jp z,f3_cada_cuadro		;af3a   ; ...cada cuadro
	ld hl,0cb52h		;af3d
	ld (hl),000h		;af40   ; 0xCB52 = 0
	call 04650h		;af42   ; espera_vdp: espera a que el VDP acabe la orden en curso (S#2 bit 0)
	call 045f1h		;af45   ; apaga_pantalla_y_sprites: p00:45CC y p00:45F6
	call borra_df80_p10		;af48   ; borra_df80_p10: 0xDF80-0xDFBF a cero
	call 045beh		;af4b   ; scroll_a_cero: R#23 = 0 (el desplazamiento vertical)
	ld bc,00f07h		;af4e   ; el borde al 0x0F
	call 00047h		;af51   ; BIOS WRTVDP - Writes data in the VDP-register
	call 0846fh		;af54   ; paleta_de_la_sala_bancos_10:
	call 04266h		;af57   ; esconde_sprites_ram: llena 0xDC00-0xDC7F con 0xE0
	call 045d7h		;af5a   ; esconde_sprites_vram: llena con 0xE0 128 bytes de la VRAM en 0xF600 y otros 128 en 0xF200
	call d700_de_f3		;af5d   ; 0xD700-0xD70F
	call lo_de_f3		;af60   ; lo de la pantalla
	ld c,007h		;af63   ; 7 por fila
	call cosa_del_cursor		;af65   ; cosa_del_cursor: A = la cosa de la lista 0xD710 en el cursor (fila 0xD703 * C + columna 0xD702)
	ld (0d704h),a		;af68   ; guarda la cosa en el cursor de F2/F3 (de la lista 0xD710, p10:B880)
	call cuenta_f3		;af6b   ; cuenta_f3: las 0x20-0x22: la cuenta de 0xD638 en (0xE0, 0xB8); las demas, p10:B9B4
	call letrero_de_f3		;af6e   ; letrero_de_f3: el letrero de lo elegido de p50:8048 y, para las 0x14-0x1C, su dibujo de 8 x 8 en (0x94, 0x3C)
	call e1d8_rachas		;af71   ; e1d8_rachas: con 0xE1D8, las rachas de p37:B2D5
	call 08ed8h		;af74   ; sprites_a_vram_b_1_2_10: sprites_a_vram y deja los bancos 1, 2 y 10
	ld hl,(0ca50h)		;af77   ; la sala...
	ld (0ca70h),hl		;af7a   ; ...desde la que se mira
	ld hl,0cabdh		;af7d
	ld (hl),001h		;af80   ; 0xCABD = 1
	call 04650h		;af82   ; espera_vdp: espera a que el VDP acabe la orden en curso (S#2 bit 0)
	jp 04606h		;af85   ; enciende_todo: la pantalla y los sprites encendidos
lo_de_f2:		; la pantalla de F2: la pagina a cero, su letrero (p50:8044), p10:B36F, las cosas de 0xD600 (p10:B00E), los recuadros (p10:B13A, B145), p10:B38F y p10:B150
	call pagina_a_cero_f		;af88   ; pagina_a_cero_f: 0xC2 x 0xC0 desde (0, 0) a cero
	call letrero_f2		;af8b   ; letrero_f2: el letrero de p50:8044
	call cursor_f2		;af8e   ; cursor_f2: el cursor (8 x 8 de (0x38, 0x50)) en su sitio con pasos de 0x38 x 0x10
	call cosas_de_d600		;af91   ; cosas_de_d600: las 13 cosas de 0xD600 que se tienen (0xD708 = su numero): su sitio, su dibujo y a la lista (p10:B02E)
	call recuadro_f2		;af94   ; recuadro_f2: el fondo (p10:B16A) y el marco de color 7 en (0x8E, 6)
	call recuadro_f2_b		;af97   ; recuadro_f2_b: el marco de color 7 de 0x20 x 0x30 en (0x6A, 0x88)
	call elegida_f2		;af9a   ; elegida_f2: sin 0xD8A4: el sitio de 0xD874 borrado y el dibujo de lo elegido (en el cursor) a (0x74, 0xD0)
	jp cosa_d634		;af9d   ; cosa_d634: con la cosa 0x0D (0xD634), su dibujo de (0x80, 0xE0) a (0x72, 0x98)
lo_de_f3:		; la pantalla de F3: la pagina a cero, su letrero (p50:804A), p10:B374, las cosas de 0xD638 (p10:B042), el recuadro y p10:B3C1
	call pagina_a_cero_f		;afa0   ; pagina_a_cero_f: 0xC2 x 0xC0 desde (0, 0) a cero
	call letrero_f3		;afa3   ; letrero_f3: el letrero de p50:804A
	call cursor_f3		;afa6   ; cursor_f3: lo mismo con pasos de 0x20 x 0x10
	call cosas_de_d638		;afa9   ; cosas_de_d638: las 0x22 cosas de 0xD638 que se tienen, igual (p10:B062)
	call recuadro_f2		;afac   ; recuadro_f2: el fondo (p10:B16A) y el marco de color 7 en (0x8E, 6)
	jp elegida_f3		;afaf   ; elegida_f3: sin 0xD8A4: el sitio de 0xD8A4 borrado y el dibujo a el
d700_de_f2:		; 0xD700-0xD70A de p10:AFC2 y lo de 0xD70B (p10:AFDB)
	ld de,0d700h		;afb2   ; apunta a el estado de la pantalla de F2/F3 (0xD700-0xD70F; p10:AFB2)
	ld hl,0afc2h		;afb5
	ld bc,0000bh		;afb8   ; 11 bytes
	ldir		;afbb
	ld hl,0d70bh		;afbd   ; apunta a el cursor de F2 guardado (columna, fila)
	jr $+27		;afc0   ; al cursor de F2

; ----------------------------------------------------------------------
; DATOS resto_AFC2: lo apuntan con el banco puesto p10:AFB5 (0xAFC2); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p10:AFB5 (11 bytes)
;   0xafc2..0xafcd  (11 bytes)
DATA_resto_AFC2:
	defb 000h,001h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; afc2  ...........

; ======================================================================
; CODIGO 0xafcd..0xafeb  (30 bytes)
; ======================================================================


d700_de_f3:		; 0xD700-0xD707 de p10:AFEB y lo de 0xD70D
	ld de,0d700h		;afcd   ; apunta a el estado de la pantalla de F2/F3 (0xD700-0xD70F; p10:AFB2)
	ld hl,0afebh		;afd0
	ld bc,00008h		;afd3   ; 8 bytes
	ldir		;afd6
	ld hl,0d70dh		;afd8   ; apunta a el cursor de F3 guardado (columna, fila)
d702_y_d710:		; 0xD702-0xD703 = los dos bytes de HL y 0xD710-0xD74F a cero
	ld de,0d702h		;afdb   ; apunta a la columna del cursor en F2/F3
	ldi		;afde   ; la columna...
	ldi		;afe0   ; ...y la fila
	ld hl,0d710h		;afe2   ; apunta a la lista de las cosas de la pantalla de F2/F3 (0x23 sitios, p10:B099)
	ld bc,0003fh		;afe5   ; 0x40 bytes
	jp 04236h		;afe8   ; borra_bloque: pone a cero BC + 1 bytes desde HL

; ----------------------------------------------------------------------
; DATOS resto_AFEB: lo apuntan con el banco puesto p10:AFD0 (0xAFEB); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p10:AFD0 (8 bytes)
;   0xafeb..0xaff3  (8 bytes)
DATA_resto_AFEB:
	defb 001h,001h,000h,000h,000h,000h,000h,000h	; afeb  ........

; ======================================================================
; CODIGO 0xaff3..0xb119  (294 bytes)
; ======================================================================


quita_de_d710:		; la cosa A fuera de la lista 0xD710 (0x23 sitios)
	ld hl,0d710h		;aff3   ; apunta a la lista de las cosas de la pantalla de F2/F3 (0x23 sitios, p10:B099)
	ld b,023h		;aff6   ; 0x23 sitios
busca_en_d710:
	cp (hl)			;aff8
	jr z,quita_cosa		;aff9   ; encontrada
	inc hl			;affb
	djnz busca_en_d710		;affc
	ret			;affe   ; no esta
quita_cosa:
	ld (hl),000h		;afff   ; fuera
	ret			;b001
letrero_f2:		; el letrero de p50:8044
	ld hl,08044h		;b002
	jp 064b7h		;b005   ; letrero_de_50: el letrero con sitio de la palabra HL del banco 50
letrero_f3:		; el letrero de p50:804A
	ld hl,0804ah		;b008
	jp 064b7h		;b00b   ; letrero_de_50: el letrero con sitio de la palabra HL del banco 50
cosas_de_d600:		; las 13 cosas de 0xD600 que se tienen (0xD708 = su numero): su sitio, su dibujo y a la lista (p10:B02E)
	ld ix,0d600h		;b00e   ; apunta a lo que lleva Snake: fichas de 4 bytes [la tiene][cuenta en BCD, 2 bytes][...]; las de 0xCB20 desde la 1
	ld b,00dh		;b012   ; 13 cosas
	ld a,001h		;b014   ; desde la 1
	ld (0d708h),a		;b016   ; guarda el numero de la cosa que se pinta en F2/F3
cosa_de_d600:
	push bc			;b019
	ld a,(ix+000h)		;b01a
	or a			;b01d   ; sin ella, la siguiente
	call nz,cosa_a_f2		;b01e   ; la tiene: a la pantalla
	ld de,00004h		;b021
	add ix,de		;b024   ; la siguiente (4 bytes)
	ld hl,0d708h		;b026   ; el numero siguiente
	inc (hl)			;b029
	pop bc			;b02a
	djnz cosa_de_d600		;b02b
	ret			;b02d
cosa_a_f2:		; el sitio (p10:B0A7, 7 por fila de 0x38 en 0x18 x 0x18), el dibujo (p10:B0BE), a la lista (p10:B099) y 0xD705 uno mas
	ld de,01818h		;b02e   ; desde (0x18, 0x18)...
	ld hl,03807h		;b031   ; ...7 por fila de 0x38
	call sitio_de_cosa		;b034   ; sitio_de_cosa: E = la columna (0xD705 mod L) * 16 + E y D + H por cada fila
	call dibujo_f2		;b037   ; dibujo_f2: el dibujo de la cosa (p56:A6AF) de la pagina 3: 16 x 16 (32 x 16 las dos primeras, 8 a la derecha las de 16)
	call a_la_lista		;b03a   ; a_la_lista: 0xD710 + 0xD705 = 0xD708
	ld hl,0d705h		;b03d   ; apunta a cuantas cosas hay en la pantalla de F2/F3
	inc (hl)			;b040   ; una mas
	ret			;b041
cosas_de_d638:		; las 0x22 cosas de 0xD638 que se tienen, igual (p10:B062)
	ld ix,0d638h		;b042   ; apunta a la segunda tabla de lo que lleva (fichas de 4 bytes, como 0xD600)
	ld b,022h		;b046   ; 0x22 cosas
	ld a,001h		;b048   ; desde la 1
	ld (0d708h),a		;b04a   ; guarda el numero de la cosa que se pinta en F2/F3
cosa_de_d638:
	push bc			;b04d
	ld a,(ix+000h)		;b04e
	or a			;b051   ; sin ella, la siguiente
	call nz,cosa_a_f3		;b052   ; cosa_a_f3: el sitio (7 por fila de 0x20), el dibujo (p10:B0DC), a la lista y, las 0x0E, 0x20, 0x21 y 0x22, su sitio a 0xCA84, 0xCA7E, 0xCA80 o 0xCA82
	ld de,00004h		;b055
	add ix,de		;b058
	ld hl,0d708h		;b05a   ; apunta a el numero de la cosa que se pinta en F2/F3
	inc (hl)			;b05d
	pop bc			;b05e
	djnz cosa_de_d638		;b05f
	ret			;b061
cosa_a_f3:		; el sitio (7 por fila de 0x20), el dibujo (p10:B0DC), a la lista y, las 0x0E, 0x20, 0x21 y 0x22, su sitio a 0xCA84, 0xCA7E, 0xCA80 o 0xCA82
	ld de,01818h		;b062   ; desde (0x18, 0x18)...
	ld hl,02007h		;b065   ; ...7 por fila de 0x20
	call sitio_de_cosa		;b068   ; sitio_de_cosa: E = la columna (0xD705 mod L) * 16 + E y D + H por cada fila
	push de			;b06b
	call dibujo_f3		;b06c   ; dibujo_f3: el dibujo de la cosa: la 0x0E segun 0xCA7B (p10:B0F9), la 0x0F segun 0xCA90, la 0x10 segun 0xCA89, las demas de p56:A6CB; 16 x 16 a la pagina 3
	call a_la_lista		;b06f   ; a_la_lista: 0xD710 + 0xD705 = 0xD708
	ld hl,0d705h		;b072   ; apunta a cuantas cosas hay en la pantalla de F2/F3
	inc (hl)			;b075
	pop de			;b076
	ld hl,0ca84h		;b077   ; la 0x0E: 0xCA84
	ld a,(0d708h)		;b07a   ; lee el numero de la cosa que se pinta en F2/F3
	cp 00eh		;b07d
	jr z,guarda_sitio		;b07f
	ld hl,0ca7eh		;b081   ; la 0x20: 0xCA7E
	cp 020h		;b084
	jr z,guarda_sitio		;b086
	ld hl,0ca80h		;b088   ; la 0x21: 0xCA80
	cp 021h		;b08b
	jr z,guarda_sitio		;b08d
	ld hl,0ca82h		;b08f   ; la 0x22: 0xCA82
	cp 022h		;b092
	ret nz			;b094
guarda_sitio:
	ld (hl),e			;b095   ; su sitio
	inc hl			;b096
	ld (hl),d			;b097
	ret			;b098
a_la_lista:		; 0xD710 + 0xD705 = 0xD708
	ld a,(0d705h)		;b099   ; lee cuantas cosas hay en la pantalla de F2/F3
	ld hl,0d710h		;b09c   ; apunta a la lista de las cosas de la pantalla de F2/F3 (0x23 sitios, p10:B099)
	call 0423eh		;b09f   ; suma_a_hl: HL = HL + A
	ld a,(0d708h)		;b0a2   ; lee el numero de la cosa que se pinta en F2/F3
	ld (hl),a			;b0a5
	ret			;b0a6
sitio_de_cosa:		; E = la columna (0xD705 mod L) * 16 + E y D + H por cada fila
	ld a,(0d705h)		;b0a7   ; lee cuantas cosas hay en la pantalla de F2/F3
fila_de_cosa:
	sub l			;b0aa   ; una fila mas...
	jr c,columna_de_cosa		;b0ab
	ld c,a			;b0ad
	ld a,d			;b0ae
	add a,h			;b0af   ; ...H mas abajo
	ld d,a			;b0b0
	ld a,c			;b0b1
	jr fila_de_cosa		;b0b2
columna_de_cosa:
	add a,l			;b0b4   ; la columna...
	rla			;b0b5   ; ...* 16
	rla			;b0b6
	rla			;b0b7
	rla			;b0b8
	and 0f0h		;b0b9
	add a,e			;b0bb
	ld e,a			;b0bc
	ret			;b0bd
dibujo_f2:		; el dibujo de la cosa (p56:A6AF) de la pagina 3: 16 x 16 (32 x 16 las dos primeras, 8 a la derecha las de 16)
	call 08813h		;b0be   ; palabra_a6af_d708: HL = la palabra 0xD708 - 1 de p56:A6AF
	push hl			;b0c1
	ld a,(0d708h)		;b0c2   ; lee el numero de la cosa que se pinta en F2/F3
	dec a			;b0c5   ; las 1 y 2...
	ld bc,01010h		;b0c6
	cp 002h		;b0c9
	jr nc,ancho_del_dibujo		;b0cb
	ld b,020h		;b0cd   ; ...de 0x20 de ancho
ancho_del_dibujo:
	ld a,b			;b0cf
	cp 010h		;b0d0   ; las de 16...
	jr nz,copia_dibujo		;b0d2
	ld a,d			;b0d4   ; ...8 a la derecha
	add a,008h		;b0d5
	ld d,a			;b0d7
copia_dibujo:
	pop hl			;b0d8
	jp 0473bh		;b0d9   ; copia_rectangulo_a_3: p00:4767 de la pagina 0xCA42 a la 3
dibujo_f3:		; el dibujo de la cosa: la 0x0E segun 0xCA7B (p10:B0F9), la 0x0F segun 0xCA90, la 0x10 segun 0xCA89, las demas de p56:A6CB; 16 x 16 a la pagina 3
	ld a,(0d708h)		;b0dc   ; lee el numero de la cosa que se pinta en F2/F3
	cp 00eh		;b0df   ; la 0x0E
	jr z,dibujo_0e		;b0e1
	cp 00fh		;b0e3   ; la 0x0F
	jr z,dibujo_0f		;b0e5
	cp 010h		;b0e7   ; la 0x10
	jr z,$+60		;b0e9
	call 0881bh		;b0eb   ; palabra_a6cb_d708: HL = la palabra 0xD708 - 1 de p56:A6CB (con el bit 0 de 0xCAB6, de 0x20 a 0x22 pasa a 0x24)
copia_16x16:
	ld bc,01010h		;b0ee   ; 16 x 16
	jp 0473bh		;b0f1   ; copia_rectangulo_a_3: p00:4767 de la pagina 0xCA42 a la 3
dibujo_0e:
	call sitio_0e		;b0f4   ; sitio_0e: HL = (0x90, 0xB0), (0x90, 0xC0) o (0x90, 0xD0) segun 0xCA7B
	jr copia_16x16		;b0f7
sitio_0e:		; HL = (0x90, 0xB0), (0x90, 0xC0) o (0x90, 0xD0) segun 0xCA7B
	ld hl,0b090h		;b0f9
	ld a,(0ca7bh)		;b0fc   ; lee 0-3: el paso de la cosa 0x0E (p10:A1D2)
	or a			;b0ff   ; 0...
	ret z			;b100
	dec a			;b101   ; ...o 1: (0x90, 0xB0)
	ret z			;b102
	dec a			;b103
	ld h,0c0h		;b104   ; 2: (0x90, 0xC0)
	ret z			;b106
	dec a			;b107
	ld h,0d0h		;b108   ; 3: (0x90, 0xD0)
	ret			;b10a
dibujo_0f:
	call sitio_0f		;b10b   ; sitio_0f: HL = el de p10:B119 por 0xCA90
	jr copia_16x16		;b10e
sitio_0f:		; HL = el de p10:B119 por 0xCA90
	ld a,(0ca90h)		;b110   ; lee el paso de lo de la cosa 0x0F (1-5, p11:BC0C)
	ld hl,0b119h		;b113   ; de p10:B119
	jp 043f6h		;b116   ; palabra_de_tabla: HL = la palabra A de la tabla de HL

; ----------------------------------------------------------------------
; DATOS resto_B119: lo apuntan con el banco puesto p10:B113 (0xB119); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p10:B113 (12 bytes)
;   0xb119..0xb125  (12 bytes)
DATA_resto_B119:
	defb 090h,0b0h,090h,0b0h,090h,0c0h,090h,0d0h,0a0h,0b0h,0a0h,0c0h	; b119  ............

; ======================================================================
; CODIGO 0xb125..0xb130  (11 bytes)
; ======================================================================


dibujo_10:		; HL = el de p10:B130 por 0xCA89
	ld a,(0ca89h)		;b125   ; lee 0-4: lo de la cosa 0x10 (p11:BB49; su dibujo en p11:BBEB)
	ld hl,0b130h		;b128   ; de p10:B130
	call 043f6h		;b12b   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	jr $-64		;b12e

; ----------------------------------------------------------------------
; DATOS resto_B130: lo apuntan con el banco puesto p10:B128 (0xB130); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p10:B128 (10 bytes)
;   0xb130..0xb13a  (10 bytes)
DATA_resto_B130:
	defb 0a0h,010h,090h,0f0h,090h,0e0h,090h,0f0h,0a0h,000h	; b130  ..........

; ======================================================================
; CODIGO 0xb13a..0xb492  (856 bytes)
; ======================================================================


recuadro_f2:		; el fondo (p10:B16A) y el marco de color 7 en (0x8E, 6)
	call fondo_f2		;b13a   ; fondo_f2: el fondo al color 0x99
	ld hl,0068eh		;b13d   ; en (0x8E, 6)...
	ld de,sitio_del_cursor		;b140
	jr marco_7		;b143
recuadro_f2_b:		; el marco de color 7 de 0x20 x 0x30 en (0x6A, 0x88)
	ld hl,0886ah		;b145   ; en (0x6A, 0x88)...
	ld de,03020h		;b148   ; ...0x20 x 0x30
marco_7:
	ld c,007h		;b14b   ; color 7
	jp marco_b8be		;b14d   ; marco_b8be:
cosa_d634:		; con la cosa 0x0D (0xD634), su dibujo de (0x80, 0xE0) a (0x72, 0x98)
	ld a,(0d634h)		;b150
	or a			;b153
	ret z			;b154   ; sin ella, nada
	ld hl,0e080h		;b155   ; apunta a el rastro de Snake: las ultimas 16 posiciones [Y][X][direccion] (con 0xCAA0)
	ld de,09872h		;b158   ; a (0x72, 0x98)
	ld bc,01010h		;b15b
	jp 0473bh		;b15e   ; copia_rectangulo_a_3: p00:4767 de la pagina 0xCA42 a la 3
pagina_a_cero_f:		; 0xC2 x 0xC0 desde (0, 0) a cero
	ld hl,00000h		;b161
	ld bc,0c0c2h		;b164   ; 0xC2 x 0xC0
	jp 046fah		;b167   ; borra_bloque_pagina_0: p00:46FF con A = 0 en la pagina en la que se dibuja
fondo_f2:		; el fondo al color 0x99
	ld hl,0068eh		;b16a
	ld bc,sitio_del_cursor		;b16d
	jr fondo_99		;b170
fondo_de_mensajes:		; 0xB0 x 0x28 en (0x90, 8) al color 0x99
	ld hl,00890h		;b172   ; (0x90, 8)...
	ld bc,0b028h		;b175   ; ...0xB0 x 0x28
fondo_99:
	ld a,099h		;b178   ; al color 0x99
	jp 046f2h		;b17a   ; borra_bloque_pagina: p00:46FF en la pagina en la que se dibuja (0xCA42)
e1d8_rachas:		; con 0xE1D8, las rachas de p37:B2D5
	ld a,(0e1d8h)		;b17d   ; lee el tramo de la ficha de p10:A234 (0 = ninguna; 0xE1DA-0xE1DB su sitio)
	and a			;b180
	ret z			;b181   ; sin 0xE1D8, nada
	jp 085feh		;b182   ; rachas_b2d5: p37:B2D5 y 4 patrones de sprite en espejo de 0xF800 a 0xF890
f2_cada_cuadro:		; p02:8ECD, p10:BA51, p10:B191 y p02:8ED2
	call 08ecdh		;b185   ; p02:8ECD
	call sprites_cb4b_f2		;b188   ; sprites_cb4b_f2: con 0xCB4B: el parpadeo (p10:BAA8), sin sprites y, sobre las dos primeras cosas de la lista, la 9 con sus sprites
	call f2_paso		;b18b   ; f2_paso: con una tecla de funcion, sale (p10:B44D); el cursor con el mando (p10:B2F4); con 0xD707: el fondo, p10:B33B, p10:B359, p10:B36F, p10:B38F, el cursor a 0xD704, p10:B3F9 y p10:B8C7; si no, p10:BB2B y, sobre la cosa 7, con el disparo 1, 0xD70A cambia (p10:B8F8) con el sonido 0x11
	jp 08ed2h		;b18e   ; p02:8ED2
f2_paso:		; con una tecla de funcion, sale (p10:B44D); el cursor con el mando (p10:B2F4); con 0xD707: el fondo, p10:B33B, p10:B359, p10:B36F, p10:B38F, el cursor a 0xD704, p10:B3F9 y p10:B8C7; si no, p10:BB2B y, sobre la cosa 7, con el disparo 1, 0xD70A cambia (p10:B8F8) con el sonido 0x11
	ld a,(0ca09h)		;b191   ; lee lo recien pulsado de las teclas de funcion (bits como 0xCA0A)
	and 01fh		;b194
	jp nz,sale_de_f2		;b196   ; tecla: fuera
	ld de,00106h		;b199   ; 7 x 6
	call cursor_con_el_mando		;b19c   ; el cursor
	ld a,(0d707h)		;b19f   ; lee hacia donde se mueve el cursor (1 arriba, 2 abajo, 3 izquierda, 4 derecha; p10:B2F4)
	or a			;b1a2
	jr z,f2_cosa_7		;b1a3   ; sin 0xD707, aparte
	call fondo_de_mensajes		;b1a5   ; fondo_de_mensajes: 0xB0 x 0x28 en (0x90, 8) al color 0x99
	call borra_cursor_f2		;b1a8   ; borra_cursor_f2: borra el cursor de su sitio (pasos de 0x38 x 0x10)
	call mueve_cursor		;b1ab   ; mueve_cursor: 0xD702 o 0xD703 uno mas o menos segun 0xD707
	call cursor_f2		;b1ae   ; cursor_f2: el cursor (8 x 8 de (0x38, 0x50)) en su sitio con pasos de 0x38 x 0x10
	call elegida_f2		;b1b1   ; elegida_f2: sin 0xD8A4: el sitio de 0xD874 borrado y el dibujo de lo elegido (en el cursor) a (0x74, 0xD0)
	ld c,007h		;b1b4   ; 7 por fila
	call cosa_del_cursor		;b1b6   ; cosa_del_cursor: A = la cosa de la lista 0xD710 en el cursor (fila 0xD703 * C + columna 0xD702)
	ld (0d704h),a		;b1b9   ; guarda la cosa en el cursor de F2/F3 (de la lista 0xD710, p10:B880)
	call cuenta_f2		;b1bc   ; cuenta_f2: la cuenta de lo elegido de 0xD600 en (0xE0, 0x88)
	jp letrero_de_lo_elegido		;b1bf   ; letrero_de_lo_elegido: el letrero de lo elegido de p50:8046 y, para la 7, su recuadro (p10:B8D5)
f2_cosa_7:
	call usa_en_f2		;b1c2   ; usa_en_f2: con 0xCB4B y el disparo 1, sobre la 9 o la 0x0B: el sonido 0x22 y la usa (p10:BB7D con 0xD621 o 0xD629)
	ld a,(0d704h)		;b1c5   ; lee la cosa en el cursor de F2/F3 (de la lista 0xD710, p10:B880)
	cp 007h		;b1c8   ; solo sobre la 7
	ret nz			;b1ca   ; fuera de la 7, nada
	ld a,(0ca07h)		;b1cb   ; lee lo recien pulsado del mando (los bits de 0xCA08 que no estaban)
	and 010h		;b1ce
	ret z			;b1d0   ; sin el disparo 1, nada
	ld a,(0d70ah)		;b1d1   ; 0xD70A cambia
	xor 001h		;b1d4   ; 0 o 1
	ld (0d70ah),a		;b1d6   ; guarda 0-1: la opcion de la cosa 7 en F2 (p10:B8F8)
	call cursor_d70a		;b1d9   ; cursor_d70a: borra 8 x 0x18 en (0x9A, 0x74) y el cursor en (0x9A, 0x74) o (0xA6, 0x74) segun 0xD70A
	jp 05f49h		;b1dc   ; sonido_11: pide el sonido 0x11
f3_cada_cuadro:		; p02:8ECD; salvo sobre la cosa 0x0D, con 0xD443 p02:8EE5; p10:BAB3, p10:B204 y, sin 0xD706, p10:A28F
	call 08ecdh		;b1df   ; p02:8ECD
	ld a,(0d704h)		;b1e2   ; lee la cosa en el cursor de F2/F3 (de la lista 0xD710, p10:B880)
	cp 00dh		;b1e5   ; la 0x0D...
	jr z,L_B1F2		;b1e7
	ld a,(0d443h)		;b1e9   ; ...si no, con 0xD443...
	or a			;b1ec
	jr z,L_B1F2		;b1ed
	call 08ee5h		;b1ef   ; p02:8EE5
L_B1F2:
	call sprites_cb4b_f3		;b1f2   ; sprites_cb4b_f3: con 0xCB4B: el parpadeo, sin sprites y sobre las cosas de la lista (hasta 0x23, 7 por fila) los sprites de p10:BB00
	call f3_paso		;b1f5   ; f3_paso: con una tecla de funcion, sale (p10:B57B); el cursor (p10:B2F4, 6 x 4); movido: el fondo, p10:B340, p10:B359, p10:B374, p10:B3C1, el cursor a 0xD704, p10:B401 y p10:B926; si no, p10:BB50 y, con el disparo 1, se usa lo elegido: la 0x0C (p10:B2CB) o las 0x20-0x22 (la vida al maximo)
	ld a,(0d706h)		;b1f8   ; lee 1 al salir de F2/F3 (p10:B897)
	or a			;b1fb
	jr nz,fin_f3_cada_cuadro		;b1fc   ; con 0xD706, nada mas
	call e1d8_paso		;b1fe   ; e1d8_paso: con 0xE1D8: p10:A29D, p10:A376 y p10:A31B
fin_f3_cada_cuadro:
	jp 08ed2h		;b201   ; p02:8ED2
f3_paso:		; con una tecla de funcion, sale (p10:B57B); el cursor (p10:B2F4, 6 x 4); movido: el fondo, p10:B340, p10:B359, p10:B374, p10:B3C1, el cursor a 0xD704, p10:B401 y p10:B926; si no, p10:BB50 y, con el disparo 1, se usa lo elegido: la 0x0C (p10:B2CB) o las 0x20-0x22 (la vida al maximo)
	ld a,(0ca09h)		;b204   ; lee lo recien pulsado de las teclas de funcion (bits como 0xCA0A)
	and 01fh		;b207
	jp nz,sale_de_f3		;b209   ; tecla: fuera
	ld de,00406h		;b20c   ; 6 x 4
	call cursor_con_el_mando		;b20f   ; cursor_con_el_mando: 0xD707 = 0 y, con una direccion recien pulsada que cabe (0xD702 columna hasta E, 0xD703 fila hasta D): 0xD707 = 1 arriba, 2 abajo, 3 izquierda, 4 derecha y el sonido 0x11
	ld a,(0d707h)		;b212   ; lee hacia donde se mueve el cursor (1 arriba, 2 abajo, 3 izquierda, 4 derecha; p10:B2F4)
	or a			;b215
	jr z,f3_usa		;b216   ; sin mover, aparte
	call fondo_de_mensajes		;b218   ; fondo_de_mensajes: 0xB0 x 0x28 en (0x90, 8) al color 0x99
	call borra_cursor_f3		;b21b   ; borra_cursor_f3: lo mismo con pasos de 0x20 x 0x10
	call mueve_cursor		;b21e   ; mueve_cursor: 0xD702 o 0xD703 uno mas o menos segun 0xD707
	call cursor_f3		;b221   ; cursor_f3: lo mismo con pasos de 0x20 x 0x10
	call elegida_f3		;b224   ; elegida_f3: sin 0xD8A4: el sitio de 0xD8A4 borrado y el dibujo a el
	ld c,007h		;b227   ; 7 por fila
	call cosa_del_cursor		;b229   ; cosa_del_cursor: A = la cosa de la lista 0xD710 en el cursor (fila 0xD703 * C + columna 0xD702)
	ld (0d704h),a		;b22c   ; guarda la cosa en el cursor de F2/F3 (de la lista 0xD710, p10:B880)
	call cuenta_f3		;b22f   ; cuenta_f3: las 0x20-0x22: la cuenta de 0xD638 en (0xE0, 0xB8); las demas, p10:B9B4
	jp letrero_de_f3		;b232   ; letrero_de_f3: el letrero de lo elegido de p50:8048 y, para las 0x14-0x1C, su dibujo de 8 x 8 en (0x94, 0x3C)
f3_usa:
	call usa_en_f3		;b235   ; usa_en_f3: con 0xCB4B y el disparo 1: la cosa elegida de 0xD638 (las 0x20-0x22 solo con la vida al maximo) se usa (p10:BB96)
	ld a,(0ca07h)		;b238   ; lee lo recien pulsado del mando (los bits de 0xCA08 que no estaban)
	and 010h		;b23b
	ret z			;b23d   ; sin el disparo 1, nada
	ld a,(0d704h)		;b23e   ; lee la cosa en el cursor de F2/F3 (de la lista 0xD710, p10:B880)
	cp 00ch		;b241   ; la 0x0C, aparte
	jp z,usa_0c		;b243   ; usa_0c: la 0x0C, con 0xCB39: una menos y, acabada, fuera (0xD664); 0xCB39 = 0, el bit 2 de 0xD7D5, fuera el 6 de 0xD7E0 y el sonido 0x22; sin 0xCB39, el sonido 0x5C
	ld hl,0d6b4h		;b246   ; la 0x20...
	ld a,(0d704h)		;b249   ; lee la cosa en el cursor de F2/F3 (de la lista 0xD710, p10:B880)
	cp 020h		;b24c
	jr z,usa_20_22		;b24e
	ld hl,0d6b8h		;b250   ; ...la 0x21...
	cp 021h		;b253
	jr z,usa_20_22		;b255
	ld hl,0d6bch		;b257   ; ...la 0x22; las demas, nada
	cp 022h		;b25a
	ret nz			;b25c
usa_20_22:		; con 0xCAB6, no se puede
	ld a,(0cab6h)		;b25d   ; lee 1 con la cuenta de 0xCAB7 en marcha (sala especial 0x11, p10:A0F8)
	or a			;b260
	jr nz,no_se_puede		;b261
	push hl			;b263
	ld hl,0ca52h		;b264   ; con la vida al maximo...
	ld a,(hl)			;b267   ; el maximo...
	inc hl			;b268
	ld l,(hl)			;b269   ; ...y la vida
	cp l			;b26a
	pop hl			;b26b
	jr z,no_se_puede		;b26c   ; ...no se puede
	ld a,(hl)			;b26e
	or a			;b26f
	ret z			;b270   ; sin ella, nada
	push hl			;b271
	ld a,(0d704h)		;b272   ; lee la cosa en el cursor de F2/F3 (de la lista 0xD710, p10:B880)
	call 092d2h		;b275   ; una menos (p03:BEB7, BEB2)
	ld a,(0d704h)		;b278   ; lee la cosa en el cursor de F2/F3 (de la lista 0xD710, p10:B880)
	call 092dbh		;b27b   ; a_p03_beb2: p03:BEB2 con el banco 3 en 0xA000
	pop hl			;b27e
	call c,cosa_fuera_de_f3		;b27f   ; acabada: fuera de la pantalla (p10:B296)
	ld a,(0ca52h)		;b282   ; la vida al maximo
	ld (0ca53h),a		;b285   ; guarda la vida de Snake (lo largo de la barra)
	call 0429ch		;b288   ; las barras
	jp 06c53h		;b28b   ; sonido_4d: pide el sonido 0x4D
no_se_puede:		; con 0xCB4B, nada; si no, el sonido 0x5C
	ld a,(0cb4bh)		;b28e   ; lee con el puesto, la vida baja un punto cada 16 cuadros
	or a			;b291
	ret nz			;b292
sonido_no:
	jp 06c77h		;b293   ; sonido_5c: pide el sonido 0x5C
cosa_fuera_de_f3:		; (HL) = 0, su recuadro borrado, sin el sitio de 0xD8A4 (si no se usa), la cosa fuera de la lista, 0xD704 = 0, el fondo de mensajes y p10:B8C4
	ld (hl),000h		;b296   ; la cosa a cero
	ld de,00e1ch		;b298   ; su sitio en la pantalla...
	ld bc,02010h		;b29b
	call sitio_del_cursor		;b29e   ; sitio_del_cursor: D + B * la fila (0xD703) y E + C * la columna (0xD702)
	ld a,e			;b2a1   ; Y - 4...
	sub 004h		;b2a2
	ld l,a			;b2a4
	ld a,d			;b2a5   ; ...X + 0x0A...
	add a,00ah		;b2a6
	ld h,a			;b2a8
	ld bc,01010h		;b2a9   ; ...16 x 16 a cero
	call 046fah		;b2ac   ; borra_bloque_pagina_0: p00:46FF con A = 0 en la pagina en la que se dibuja
	ld a,(0d8a4h)		;b2af
	or a			;b2b2
	jr nz,quita_elegida		;b2b3   ; con 0xD8A4 se queda
	ld hl,0d8a4h		;b2b5   ; si no, borrado
	call borra_sitio_de_hl		;b2b8   ; borra_sitio_de_hl: 0x18 x 0x10 en HL y 8 x 0x10 en HL - 8 al color 0x99
quita_elegida:
	ld a,(0d704h)		;b2bb   ; lee la cosa en el cursor de F2/F3 (de la lista 0xD710, p10:B880)
	call quita_de_d710		;b2be   ; quita_de_d710: la cosa A fuera de la lista 0xD710 (0x23 sitios)
	xor a			;b2c1
	ld (0d704h),a		;b2c2   ; guarda la cosa en el cursor de F2/F3 (de la lista 0xD710, p10:B880)
	call fondo_de_mensajes		;b2c5   ; fondo_de_mensajes: 0xB0 x 0x28 en (0x90, 8) al color 0x99
	jp letrero_f2_0		;b2c8   ; letrero_f2_0: el letrero 0 de p50:8046 (ninguno)
usa_0c:		; la 0x0C, con 0xCB39: una menos y, acabada, fuera (0xD664); 0xCB39 = 0, el bit 2 de 0xD7D5, fuera el 6 de 0xD7E0 y el sonido 0x22; sin 0xCB39, el sonido 0x5C
	ld a,(0cb39h)		;b2cb
	or a			;b2ce
	jr z,sonido_no		;b2cf
	ld a,(0d704h)		;b2d1   ; lee la cosa en el cursor de F2/F3 (de la lista 0xD710, p10:B880)
	call 092d2h		;b2d4   ; a_p03_beb7: p03:BEB7 con el banco 3 en 0xA000
	ld a,(0d704h)		;b2d7   ; lee la cosa en el cursor de F2/F3 (de la lista 0xD710, p10:B880)
	call 092dbh		;b2da   ; a_p03_beb2: p03:BEB2 con el banco 3 en 0xA000
	ld hl,0d664h		;b2dd   ; la de 0xD664
	call c,cosa_fuera_de_f3		;b2e0   ; cosa_fuera_de_f3: (HL) = 0, su recuadro borrado, sin el sitio de 0xD8A4 (si no se usa), la cosa fuera de la lista, 0xD704 = 0, el fondo de mensajes y p10:B8C4
	xor a			;b2e3
	ld (0cb39h),a		;b2e4   ; 0xCB39 = 0
	ld hl,0d7d5h		;b2e7
	set 2,(hl)		;b2ea   ; el bit 2 de 0xD7D5
	ld hl,0d7e0h		;b2ec
	res 6,(hl)		;b2ef   ; fuera el 6 de 0xD7E0
	jp 06a83h		;b2f1   ; sonido_22: pide el sonido 0x22
cursor_con_el_mando:		; 0xD707 = 0 y, con una direccion recien pulsada que cabe (0xD702 columna hasta E, 0xD703 fila hasta D): 0xD707 = 1 arriba, 2 abajo, 3 izquierda, 4 derecha y el sonido 0x11
	xor a			;b2f4   ; sin mover
	ld (0d707h),a		;b2f5   ; guarda hacia donde se mueve el cursor (1 arriba, 2 abajo, 3 izquierda, 4 derecha; p10:B2F4)
	ld a,(0ca07h)		;b2f8   ; lee lo recien pulsado del mando (los bits de 0xCA08 que no estaban)
	and 00fh		;b2fb   ; las direcciones recien pulsadas
	ret z			;b2fd   ; nada pulsado, nada
	rra			;b2fe
	jr c,cursor_arriba		;b2ff   ; arriba
	rra			;b301
	jr c,cursor_abajo		;b302   ; abajo
	rra			;b304
	jr c,cursor_izquierda		;b305   ; izquierda
	ld a,(0d703h)		;b307   ; derecha: hasta la ultima fila
	cp d			;b30a   ; en la ultima fila, nada
	ret nc			;b30b
	ld a,004h		;b30c   ; abajo... no: 4
	ld (0d707h),a		;b30e   ; guarda hacia donde se mueve el cursor (1 arriba, 2 abajo, 3 izquierda, 4 derecha; p10:B2F4)
	jp 05f49h		;b311   ; sonido_11: pide el sonido 0x11
cursor_arriba:
	ld a,(0d702h)		;b314   ; lee la columna del cursor en F2/F3
	or a			;b317   ; en la columna 0, nada
	ret z			;b318
	ld a,001h		;b319   ; 1
	ld (0d707h),a		;b31b   ; guarda hacia donde se mueve el cursor (1 arriba, 2 abajo, 3 izquierda, 4 derecha; p10:B2F4)
	jp 05f49h		;b31e   ; sonido_11: pide el sonido 0x11
cursor_abajo:
	ld a,(0d702h)		;b321   ; lee la columna del cursor en F2/F3
	cp e			;b324   ; en la ultima columna, nada
	ret nc			;b325
	ld a,002h		;b326   ; 2
	ld (0d707h),a		;b328   ; guarda hacia donde se mueve el cursor (1 arriba, 2 abajo, 3 izquierda, 4 derecha; p10:B2F4)
	jp 05f49h		;b32b   ; sonido_11: pide el sonido 0x11
cursor_izquierda:
	ld a,(0d703h)		;b32e   ; lee la fila del cursor en F2/F3
	or a			;b331   ; en la fila 0, nada
	ret z			;b332
	ld a,003h		;b333   ; 3
	ld (0d707h),a		;b335   ; guarda hacia donde se mueve el cursor (1 arriba, 2 abajo, 3 izquierda, 4 derecha; p10:B2F4)
	jp 05f49h		;b338   ; sonido_11: pide el sonido 0x11
borra_cursor_f2:		; borra el cursor de su sitio (pasos de 0x38 x 0x10)
	ld bc,03810h		;b33b
	jr borra_cursor		;b33e
borra_cursor_f3:		; lo mismo con pasos de 0x20 x 0x10
	ld bc,02010h		;b340
borra_cursor:
	ld de,00e1ch		;b343   ; desde (0x1C, 0x0E)
	call sitio_del_cursor		;b346   ; sitio_del_cursor: D + B * la fila (0xD703) y E + C * la columna (0xD702)
	ld hl,00000h		;b349   ; la esquina de la otra...
	ld a,(0ca42h)		;b34c   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	ld b,a			;b34f
	rlca			;b350
	rlca			;b351
	or b			;b352
	ld bc,00808h		;b353   ; ...8 x 8
	jp 04767h		;b356   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
mueve_cursor:		; 0xD702 o 0xD703 uno mas o menos segun 0xD707
	ld hl,0d702h		;b359   ; apunta a la columna del cursor en F2/F3
	ld a,(0d707h)		;b35c   ; lee hacia donde se mueve el cursor (1 arriba, 2 abajo, 3 izquierda, 4 derecha; p10:B2F4)
	dec a			;b35f   ; 1: la columna - 1
	jr z,uno_menos_cursor		;b360
	dec a			;b362   ; 2: + 1
	jr z,uno_mas_cursor		;b363
	ld hl,0d703h		;b365   ; apunta a la fila del cursor en F2/F3
	dec a			;b368   ; 3: la fila - 1; 4: + 1
	jr z,uno_menos_cursor		;b369
uno_mas_cursor:
	inc (hl)			;b36b
	ret			;b36c
uno_menos_cursor:
	dec (hl)			;b36d
	ret			;b36e
cursor_f2:		; el cursor (8 x 8 de (0x38, 0x50)) en su sitio con pasos de 0x38 x 0x10
	ld bc,03810h		;b36f
	jr pinta_cursor		;b372
cursor_f3:		; lo mismo con pasos de 0x20 x 0x10
	ld bc,02010h		;b374
pinta_cursor:
	ld de,00e1ch		;b377   ; desde (0x1C, 0x0E)
	call sitio_del_cursor		;b37a   ; sitio_del_cursor: D + B * la fila (0xD703) y E + C * la columna (0xD702)
copia_cursor:
	ld a,(0ca42h)		;b37d   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	rlca			;b380
	rlca			;b381
	rlca			;b382
	rlca			;b383
	or 0c8h		;b384   ; la operacion 0xC8
	ld bc,00808h		;b386
	ld hl,05038h		;b389   ; el cursor de (0x38, 0x50)
	jp 047edh		;b38c   ; copia_rectangulo_logica: orden LMMM del VDP con la operacion logica de A
elegida_f2:		; sin 0xD8A4: el sitio de 0xD874 borrado y el dibujo de lo elegido (en el cursor) a (0x74, 0xD0)
	ld a,(0d8a4h)		;b38f
	or a			;b392
	ret nz			;b393   ; con 0xD8A4, nada
	ld hl,0d874h		;b394   ; el sitio de 0xD874
	call borra_sitio_de_hl		;b397   ; borra_sitio_de_hl: 0x18 x 0x10 en HL y 8 x 0x10 en HL - 8 al color 0x99
	ld de,00e1ch		;b39a
	ld bc,03810h		;b39d
	call sitio_del_cursor		;b3a0   ; sitio_del_cursor: D + B * la fila (0xD703) y E + C * la columna (0xD702)
	ld a,d			;b3a3   ; X + 0x0A
	add a,00ah		;b3a4
	ld h,a			;b3a6
	ld a,e			;b3a7   ; Y - 4
	sub 004h		;b3a8
	ld l,a			;b3aa
	ld de,0d074h		;b3ab   ; a (0x74, 0xD0)
	ld bc,02010h		;b3ae
copia_a_la_3:
	push bc			;b3b1
	ld a,(0ca42h)		;b3b2   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	rrca			;b3b5
	rrca			;b3b6
	ld b,a			;b3b7
	rrca			;b3b8
	rrca			;b3b9
	or b			;b3ba
	or 008h		;b3bb   ; de esta pagina a la 3
	pop bc			;b3bd
	jp 047edh		;b3be   ; copia_rectangulo_logica: orden LMMM del VDP con la operacion logica de A
elegida_f3:		; sin 0xD8A4: el sitio de 0xD8A4 borrado y el dibujo a el
	ld a,(0d8a4h)		;b3c1
	or a			;b3c4
	ret nz			;b3c5   ; con 0xD8A4, nada
	ld hl,0d8a4h		;b3c6
	call borra_sitio_de_hl		;b3c9   ; borra_sitio_de_hl: 0x18 x 0x10 en HL y 8 x 0x10 en HL - 8 al color 0x99
	ld de,00e1ch		;b3cc
	ld bc,02010h		;b3cf
	call sitio_del_cursor		;b3d2   ; sitio_del_cursor: D + B * la fila (0xD703) y E + C * la columna (0xD702)
	ld a,d			;b3d5
	add a,00ah		;b3d6
	ld h,a			;b3d8
	ld a,e			;b3d9
	sub 004h		;b3da
	ld l,a			;b3dc
	ld de,0d8a4h		;b3dd   ; a 0xD8A4
	ld bc,01010h		;b3e0
	jr copia_a_la_3		;b3e3
borra_sitio_de_hl:		; 0x18 x 0x10 en HL y 8 x 0x10 en HL - 8 al color 0x99
	push hl			;b3e5
	ld bc,01810h		;b3e6   ; 0x18 x 0x10
	call color_99		;b3e9   ; color_99:
	pop hl			;b3ec
	ld a,h			;b3ed
	sub 008h		;b3ee
	ld h,a			;b3f0
	ld bc,00810h		;b3f1   ; 8 x 0x10
color_99:
	ld a,099h		;b3f4   ; al color 0x99
	jp 046f2h		;b3f6   ; borra_bloque_pagina: p00:46FF en la pagina en la que se dibuja (0xCA42)
cuenta_f2:		; la cuenta de lo elegido de 0xD600 en (0xE0, 0x88)
	ld hl,0d600h		;b3f9   ; apunta a lo que lleva Snake: fichas de 4 bytes [la tiene][cuenta en BCD, 2 bytes][...]; las de 0xCB20 desde la 1
	ld de,0e088h		;b3fc   ; en (0xE0, 0x88)
	jr cuenta_de_d704		;b3ff
cuenta_f3:		; las 0x20-0x22: la cuenta de 0xD638 en (0xE0, 0xB8); las demas, p10:B9B4
	ld de,0e0b8h		;b401   ; en (0xE0, 0xB8)
	ld a,(0d704h)		;b404   ; lee la cosa en el cursor de F2/F3 (de la lista 0xD710, p10:B880)
	cp 020h		;b407   ; por debajo de 0x20...
	jp c,borra_cuenta		;b409   ; borra_cuenta: 0x18 x 0x10 en DE a 0
	cp 023h		;b40c   ; ...o desde 0x23: borrado
	jp nc,borra_cuenta		;b40e   ; borra_cuenta: 0x18 x 0x10 en DE a 0
	ld hl,0d638h		;b411   ; apunta a la segunda tabla de lo que lleva (fichas de 4 bytes, como 0xD600)
cuenta_de_d704:
	ld a,(0d704h)		;b414   ; lee la cosa en el cursor de F2/F3 (de la lista 0xD710, p10:B880)
cuenta_de_a:		; la cuenta (bytes 2-3) de la ficha A - 1 de HL pintada (p10:B960) y copiada de la otra pagina, 0x20 x 8
	dec a			;b417   ; la ficha A - 1...
	add a,a			;b418
	add a,a			;b419
	call 0423eh		;b41a   ; suma_a_hl: HL = HL + A
	inc hl			;b41d   ; ...su cuenta
	inc hl			;b41e
	push de			;b41f
	call pinta_cuenta		;b420   ; pinta_cuenta: la cuenta BCD de HL en DE (hasta 3 cifras, sin ceros a la izquierda), 8 a la derecha cada cifra; la de 0xD62C o con 0xD8A4, borrada
	pop de			;b423
	ld h,d			;b424   ; de la otra pagina...
	ld l,e			;b425
	ld bc,02008h		;b426   ; ...0x20 x 8
	jp 0474dh		;b429   ; copia_rectangulo_a_esta: p00:4767 de la otra pagina (0xCA42 ^ 1) a la de 0xCA42
sitio_del_cursor:		; D + B * la fila (0xD703) y E + C * la columna (0xD702)
	ld a,(0d702h)		;b42c   ; lee la columna del cursor en F2/F3
	ld l,a			;b42f   ; L = la columna
	ld a,(0d703h)		;b430   ; lee la fila del cursor en F2/F3
	ld h,a			;b433   ; H = la fila
	call por_la_fila		;b434   ; por_la_fila:
	jr por_la_columna		;b437
por_la_fila:
	ld a,h			;b439
	or a			;b43a
	ret z			;b43b   ; en la 0, nada
	ld a,d			;b43c
suma_b:
	add a,b			;b43d
	dec h			;b43e
	jr nz,suma_b		;b43f
	ld d,a			;b441
	ret			;b442
por_la_columna:
	ld a,l			;b443
	or a			;b444
	ret z			;b445   ; en la 0, nada
	ld a,e			;b446
suma_c:
	add a,c			;b447
	dec l			;b448
	jr nz,suma_c		;b449
	ld e,a			;b44b
	ret			;b44c
sale_de_f2:		; al salir de F2: lo elegido a 0xD704; si no se puede cambiar (p10:B4B1, B501, B558), el sonido 0x5C; si no, el cursor a 0xD70B, lo elegido a 0xCB20 (p10:B87B), 0xCB35, p10:B5C8, 0xCB24 = 0xD70A, p10:B48C y p10:B897
	ld c,007h		;b44d   ; 7 por fila
	call cosa_del_cursor		;b44f   ; cosa_del_cursor: A = la cosa de la lista 0xD710 en el cursor (fila 0xD703 * C + columna 0xD702)
	ld (0d704h),a		;b452   ; guarda la cosa en el cursor de F2/F3 (de la lista 0xD710, p10:B880)
	call se_puede_cambiar		;b455   ; se_puede_cambiar: acarreo si no se puede dejar lo de 0xCB20: con 0xCB4B, en el estado 0x0B, con 0xCA9B, con 0xD8A4, con 0xD8C0, en un sitio, con 0xCB3F o 0xCB37, en la sala especial 0x39 o en la zona 0x13 sala 5 con 0xD821 = 0x0D (segun lo elegido)
	jp c,06c77h		;b458   ; no: el sonido 0x5C
	call no_con_cb21_0a		;b45b   ; no_con_cb21_0a: con 0xCB21 = 0x0A u 0x0B, la cosa 5 no se puede (acarreo)
	jp c,06c77h		;b45e   ; sonido_5c: pide el sonido 0x5C
	call no_5_tumbado		;b461   ; no_5_tumbado: en el estado 2 (o con 0xCB31), en el 0x0B o con el dibujo 4, la 5 no se puede
	jp c,06c77h		;b464   ; sonido_5c: pide el sonido 0x5C
	ld de,0d70bh		;b467   ; el cursor a 0xD70B
	ld hl,0d702h		;b46a   ; apunta a la columna del cursor en F2/F3
	ldi		;b46d
	ldi		;b46f
	ld de,0cb20h		;b471   ; lo elegido a 0xCB20
	call pon_elegida		;b474   ; pon_elegida: (DE) = 0xD704
	call 0992ah		;b477   ; 0xCB35
	call estado_si_no_0b		;b47a   ; estado_si_no_0b: fuera del estado 0x0B, el estado que toca
	ld a,(0d70ah)		;b47d   ; 0xCB24 = 0xD70A
	ld (0cb24h),a		;b480   ; 0xCB24 = 0xD70A
	call segun_cb20_b492		;b483   ; segun_cb20_b492: por lo elegido (p10:B492)
	ld a,(0cb20h)		;b486   ; lee lo que usa el disparo 1 (0 nada; p02:8001 elige por ello)
	jp sale_del_menu		;b489   ; sale_del_menu: con algo elegido, el sonido 0x22; la sala repintada, lo lanzado a cero, 0xD700 = 0xD701 = 0xCB16 = 0, 0xD706 = 0xCA69 = 0xE236 = 1 y, con 0xCB21 = 2, los que siguen pintados
segun_cb20_b492:		; por lo elegido (p10:B492)
	ld a,(0cb20h)		;b48c   ; lee lo que usa el disparo 1 (0 nada; p02:8001 elige por ello)
	call 0424dh		;b48f   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_B492: 15 destinos del despachador p00:424D (call en p10:B48F, el
;   indice en A): B4B0, B4B0, B4B0, 85C7, B4B0, 85DD, 85E5, 85D3, 85D8, B4B0,
;   85C7, 85F6, 8615, B4B0, B4B0; lo leen p10:B48F (30 bytes)
;   0xb492..0xb4b0  (30 bytes)
DATA_tabla_B492:
	defw 0b4b0h,0b4b0h,0b4b0h,085c7h,0b4b0h,085ddh,085e5h,085d3h	; b492
	defw 085d8h,0b4b0h,085c7h,085f6h,08615h,0b4b0h,0b4b0h	; b4a2

; ======================================================================
; CODIGO 0xb4b0..0xb919  (1129 bytes)
; ======================================================================


nada_b4b0:
	ret			;b4b0
se_puede_cambiar:		; acarreo si no se puede dejar lo de 0xCB20: con 0xCB4B, en el estado 0x0B, con 0xCA9B, con 0xD8A4, con 0xD8C0, en un sitio, con 0xCB3F o 0xCB37, en la sala especial 0x39 o en la zona 0x13 sala 5 con 0xD821 = 0x0D (segun lo elegido)
	ld a,(0cb4bh)		;b4b1   ; lee con el puesto, la vida baja un punto cada 16 cuadros
	or a			;b4b4
	jr nz,no_la_9		;b4b5   ; con 0xCB4B
	ld a,(0cb00h)		;b4b7   ; lee el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	cp 00bh		;b4ba
	jr z,no_la_0a_ni_5		;b4bc   ; en el estado 0x0B
	ld a,(0ca9bh)		;b4be
	or a			;b4c1
	jr nz,solo_7_a_9		;b4c2   ; con 0xCA9B
	ld a,(0d8a4h)		;b4c4
	or a			;b4c7   ; con 0xD8A4
	jp nz,solo_0_a_3		;b4c8   ; solo_0_a_3: desde la 4 no se pueden
	ld a,(0d8c0h)		;b4cb   ; lee 1 con Snake dentro de lo de 0xD8C2 (p07:A40D; 0 al salir, p07:A69A)
	or a			;b4ce
	jr nz,no_la_0a_ni_5		;b4cf   ; con 0xD8C0
	ld a,(0ca65h)		;b4d1   ; lee el sitio de 0xCBE0 en el que esta Snake (0 = ninguno)
	or a			;b4d4
	jr nz,no_la_5_b		;b4d5   ; en un sitio
	ld a,(0cb3fh)		;b4d7   ; lee en la zona 6, lo que hay bajo Snake: 1 con los caracteres 0x90-0xB3, 2 con 0xB8-0xDB (3 con 0xCAAA)
	and a			;b4da
	jr nz,no_3_5_7		;b4db   ; con 0xCB3F
	ld a,(0cb37h)		;b4dd
	and a			;b4e0
	jr nz,no_3_5_7		;b4e1   ; con 0xCB37
	ld a,(0ca76h)		;b4e3   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 039h		;b4e6
	jr z,no_la_5		;b4e8   ; en la especial 0x39
	ld a,(0ca4ah)		;b4ea   ; lee la zona
	cp 013h		;b4ed
	jr nz,se_puede		;b4ef   ; la zona 0x13...
	ld a,(0ca4bh)		;b4f1   ; lee la sala de la zona
	cp 005h		;b4f4
	jr nz,se_puede		;b4f6   ; ...sala 5...
	ld a,(0d821h)		;b4f8
	cp 00dh		;b4fb
	jr z,no_la_9		;b4fd   ; ...con 0xD821 = 0x0D
se_puede:		; sin acarreo: se puede
	and a			;b4ff
	ret			;b500
no_con_cb21_0a:		; con 0xCB21 = 0x0A u 0x0B, la cosa 5 no se puede (acarreo)
	ld a,(0cb21h)		;b501   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	cp 00ah		;b504
	jr z,no_la_5		;b506
	cp 00bh		;b508
	jr z,no_la_5		;b50a
	and a			;b50c
	ret			;b50d
no_la_5:
	ld a,(0d704h)		;b50e   ; lee la cosa en el cursor de F2/F3 (de la lista 0xD710, p10:B880)
	cp 005h		;b511
	jr nz,se_puede		;b513
	scf			;b515
	ret			;b516
no_la_9:		; la 9 no se puede
	ld a,(0d704h)		;b517   ; lee la cosa en el cursor de F2/F3 (de la lista 0xD710, p10:B880)
	cp 009h		;b51a
	jr nz,se_puede		;b51c
	scf			;b51e
	ret			;b51f
no_la_0a_ni_5:		; la 0x0A y la 5 no se pueden
	ld a,(0d704h)		;b520   ; lee la cosa en el cursor de F2/F3 (de la lista 0xD710, p10:B880)
	cp 00ah		;b523
	jr z,no_b54d		;b525
no_la_5_b:		; la 5 no se puede
	ld a,(0d704h)		;b527   ; lee la cosa en el cursor de F2/F3 (de la lista 0xD710, p10:B880)
	cp 005h		;b52a
	jr z,no_b54d		;b52c
	and a			;b52e
	ret			;b52f
solo_7_a_9:		; solo las 7-9 se pueden
	ld a,(0d704h)		;b530   ; lee la cosa en el cursor de F2/F3 (de la lista 0xD710, p10:B880)
	cp 007h		;b533
	jr c,si_b54b		;b535
	cp 00ah		;b537
	jr nc,si_b54b		;b539
	ret			;b53b
no_3_5_7:		; la 3, la 5 y desde la 7 no se pueden
	ld a,(0d704h)		;b53c   ; lee la cosa en el cursor de F2/F3 (de la lista 0xD710, p10:B880)
	cp 003h		;b53f
	jr z,no_b54d		;b541
	cp 005h		;b543
	jr z,no_b54d		;b545
	cp 007h		;b547
	jr nc,no_b54d		;b549
si_b54b:
	and a			;b54b
	ret			;b54c
no_b54d:
	scf			;b54d
	ret			;b54e
solo_0_a_3:		; desde la 4 no se pueden
	ld a,(0d704h)		;b54f   ; lee la cosa en el cursor de F2/F3 (de la lista 0xD710, p10:B880)
	cp 004h		;b552
	jr c,si_b54b		;b554
	scf			;b556
	ret			;b557
no_5_tumbado:		; en el estado 2 (o con 0xCB31), en el 0x0B o con el dibujo 4, la 5 no se puede
	ld a,(0cb31h)		;b558   ; lee 1 en el estado 2 de Snake
	or a			;b55b
	jr nz,no_la_5_c		;b55c
	ld a,(0cb00h)		;b55e   ; lee el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	cp 002h		;b561
	jr z,no_la_5_c		;b563
	cp 00bh		;b565
	jr z,no_la_5_c		;b567
	ld a,(0cb01h)		;b569   ; lee el dibujo de Snake (al darse la vuelta se le suma 1, 3 o 5 segun 0xCB00)
	cp 004h		;b56c
	jr z,no_la_5_c		;b56e
si_b570:
	and a			;b570
	ret			;b571
no_la_5_c:
	ld a,(0d704h)		;b572   ; lee la cosa en el cursor de F2/F3 (de la lista 0xD710, p10:B880)
	cp 005h		;b575
	jr nz,si_b570		;b577
	scf			;b579
	ret			;b57a
sale_de_f3:		; al salir de F3: lo elegido a 0xD704; si no se puede (p10:B5D1, B649, B737, B75B, B773), el sonido 0x5C; si no, el cursor a 0xD70D, lo elegido a 0xCB21, el estado que toca, p10:B872, las barras (p10:B78D), salvo con 0xCB20 = 0x0C las rachas, y p10:B897
	ld c,007h		;b57b
	call cosa_del_cursor		;b57d   ; cosa_del_cursor: A = la cosa de la lista 0xD710 en el cursor (fila 0xD703 * C + columna 0xD702)
	ld (0d704h),a		;b580   ; guarda la cosa en el cursor de F2/F3 (de la lista 0xD710, p10:B880)
	call se_puede_en_f3		;b583   ; se_puede_en_f3: acarreo si no se puede lo elegido en F3: la 9 fuera de la zona 0x0D sala 5; la 0x0D segun p10:B6BF; en la especial 0x39 (sala 0: la 2; si no, 2, 0x0A, 0x0B); con 0xCB4B (1, 0x0C, 2, 0x0A, 0x0B); en el estado 0x0B o con 0xCA64 (2...); con 0xD8C0 o en un sitio (2); con 0xCA9B (0x0A, 0x0B); con 0xCB3F o 0xCB37 (1, 0x0A, 0x0B); en la zona 0x12 (1, 2); en la 7 sin el bit 4 de 0xD7D1 (2); en la 0x13 sala 5 con 0xD821 = 0x0D (0x0A, 0x0B)
	jp c,06c77h		;b586   ; sonido_5c: pide el sonido 0x5C
	call no_con_cb20_5		;b589   ; no_con_cb20_5: con 0xCB20 = 5, la 2, la 0x0A y la 0x0B no se pueden
	jp c,06c77h		;b58c   ; sonido_5c: pide el sonido 0x5C
	call la_2_sin_llegadas		;b58f   ; la_2_sin_llegadas: la 2: no en las zonas sin llegadas (p04:96BA) ni en la zona 0x0E sala 4 o la 0x0F sala 1
	jp c,06c77h		;b592   ; sonido_5c: pide el sonido 0x5C
	call la_2_sala_18		;b595   ; la_2_sala_18: la 2 no en la sala especial 0x18 salvo en la sala 0
	jp c,06c77h		;b598   ; sonido_5c: pide el sonido 0x5C
	call con_d7d5_4		;b59b   ; con_d7d5_4: con el bit 4 de 0xD7D5 y sin el 0 de 0xD7DA, la 2 y la 0x0D no se pueden
	jp c,06c77h		;b59e   ; sonido_5c: pide el sonido 0x5C
	ld de,0d70dh		;b5a1   ; el cursor a 0xD70D
	ld hl,0d702h		;b5a4   ; apunta a la columna del cursor en F2/F3
	ldi		;b5a7
	ldi		;b5a9
	ld de,0cb21h		;b5ab   ; lo elegido a 0xCB21
	call pon_elegida		;b5ae   ; pon_elegida: (DE) = 0xD704
	call estado_si_no_0b		;b5b1   ; estado_si_no_0b: fuera del estado 0x0B, el estado que toca
	call rachas_de_la_1		;b5b4   ; las rachas de la 1
	call barras_de_cb21		;b5b7   ; las barras
	ld a,(0cb20h)		;b5ba   ; lee lo que usa el disparo 1 (0 nada; p02:8001 elige por ello)
	cp 00ch		;b5bd   ; con la 0x0C en el disparo, sin rachas
	call nz,085aah		;b5bf   ; rachas_b007_af4c_bancos_10:
	ld a,(0cb21h)		;b5c2   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	jp sale_del_menu		;b5c5   ; sale_del_menu: con algo elegido, el sonido 0x22; la sala repintada, lo lanzado a cero, 0xD700 = 0xD701 = 0xCB16 = 0, 0xD706 = 0xCA69 = 0xE236 = 1 y, con 0xCB21 = 2, los que siguen pintados
estado_si_no_0b:		; fuera del estado 0x0B, el estado que toca
	ld a,(0cb00h)		;b5c8   ; lee el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	cp 00bh		;b5cb
	ret z			;b5cd
	jp 098bfh		;b5ce   ; estado_que_toca: el estado que toca (p02:98F0) a 0xCB00
se_puede_en_f3:		; acarreo si no se puede lo elegido en F3: la 9 fuera de la zona 0x0D sala 5; la 0x0D segun p10:B6BF; en la especial 0x39 (sala 0: la 2; si no, 2, 0x0A, 0x0B); con 0xCB4B (1, 0x0C, 2, 0x0A, 0x0B); en el estado 0x0B o con 0xCA64 (2...); con 0xD8C0 o en un sitio (2); con 0xCA9B (0x0A, 0x0B); con 0xCB3F o 0xCB37 (1, 0x0A, 0x0B); en la zona 0x12 (1, 2); en la 7 sin el bit 4 de 0xD7D1 (2); en la 0x13 sala 5 con 0xD821 = 0x0D (0x0A, 0x0B)
	ld a,(0d704h)		;b5d1   ; lee la cosa en el cursor de F2/F3 (de la lista 0xD710, p10:B880)
	cp 009h		;b5d4   ; la 9
	jp z,la_9_sala_0d_5		;b5d6   ; la_9_sala_0d_5: la 9 solo en la zona 0x0D sala 5
	cp 00dh		;b5d9   ; la 0x0D
	jp z,la_0d		;b5db   ; la_0d: la 0x0D: no con 0xCA64 ni donde p10:B6DF lo impide; hasta 10 veces (0xCAF5 uno mas), 0xCAF2 = 0 y 0xCAF1 = 1
	ld a,(0ca76h)		;b5de   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 039h		;b5e1
	jr nz,mira_f3		;b5e3   ; la especial 0x39
	ld a,(0ca4bh)		;b5e5   ; lee la sala de la zona
	or a			;b5e8
	jp z,no_la_2_b		;b5e9   ; no_la_2_b:
	jp no_2_0a_0b		;b5ec   ; no_2_0a_0b:
mira_f3:
	ld a,(0cb4bh)		;b5ef   ; lee con el puesto, la vida baja un punto cada 16 cuadros
	or a			;b5f2
	jp nz,no_1_0c		;b5f3   ; no_1_0c:
	ld a,(0cb00h)		;b5f6   ; lee el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	cp 00bh		;b5f9
	jr z,no_la_2		;b5fb
	ld a,(0ca64h)		;b5fd
	or a			;b600
	jr nz,no_0d_ni_2		;b601
	ld a,(0d8c0h)		;b603   ; lee 1 con Snake dentro de lo de 0xD8C2 (p07:A40D; 0 al salir, p07:A69A)
	or a			;b606
	jp nz,no_la_2_b		;b607   ; no_la_2_b:
	ld a,(0ca65h)		;b60a   ; lee el sitio de 0xCBE0 en el que esta Snake (0 = ninguno)
	or a			;b60d
	jp nz,no_la_2_b		;b60e   ; no_la_2_b:
	ld a,(0ca9bh)		;b611
	or a			;b614
	jr nz,no_0a_0b		;b615
	ld a,(0cb3fh)		;b617   ; lee en la zona 6, lo que hay bajo Snake: 1 con los caracteres 0x90-0xB3, 2 con 0xB8-0xDB (3 con 0xCAAA)
	and a			;b61a
	jr nz,no_la_1		;b61b
	ld a,(0cb37h)		;b61d
	and a			;b620
	jr nz,no_la_1		;b621
	ld a,(0ca4ah)		;b623   ; lee la zona
	cp 012h		;b626
	jr z,no_1_2		;b628
	cp 007h		;b62a
	jr nz,zona_13_f3		;b62c
	ld a,(0d7d1h)		;b62e
	bit 4,a		;b631
	jr z,no_la_2_b		;b633
zona_13_f3:
	cp 013h		;b635
	jr nz,si_b647		;b637
	ld a,(0ca4bh)		;b639   ; lee la sala de la zona
	cp 005h		;b63c
	jr nz,si_b647		;b63e
	ld a,(0d821h)		;b640
	cp 00dh		;b643
	jr z,no_0a_0b		;b645
si_b647:
	and a			;b647
	ret			;b648
no_con_cb20_5:		; con 0xCB20 = 5, la 2, la 0x0A y la 0x0B no se pueden
	ld a,(0cb20h)		;b649   ; lee lo que usa el disparo 1 (0 nada; p02:8001 elige por ello)
	cp 005h		;b64c
	jr nz,si_b647		;b64e
	ld a,(0d704h)		;b650   ; lee la cosa en el cursor de F2/F3 (de la lista 0xD710, p10:B880)
	cp 002h		;b653
	jr z,no_b6ad		;b655
	cp 00ah		;b657
	jr z,no_b6ad		;b659
	cp 00bh		;b65b
	jr z,no_b6ad		;b65d
	and a			;b65f
	ret			;b660
no_0d_ni_2:
	ld a,(0d704h)		;b661   ; lee la cosa en el cursor de F2/F3 (de la lista 0xD710, p10:B880)
	cp 00dh		;b664
	jr z,no_b6ad		;b666
no_la_2:
	ld a,(0d704h)		;b668   ; lee la cosa en el cursor de F2/F3 (de la lista 0xD710, p10:B880)
	cp 002h		;b66b
	jr z,no_b6ad		;b66d
no_la_1:
	ld a,(0d704h)		;b66f   ; lee la cosa en el cursor de F2/F3 (de la lista 0xD710, p10:B880)
	dec a			;b672
	jr z,no_b6ad		;b673
no_0a_0b:
	ld a,(0d704h)		;b675   ; lee la cosa en el cursor de F2/F3 (de la lista 0xD710, p10:B880)
	cp 00ah		;b678
	jr z,no_b6ad		;b67a
	cp 00bh		;b67c
	jr z,no_b6ad		;b67e
	and a			;b680
	ret			;b681
no_1_0c:
	ld a,(0d704h)		;b682   ; lee la cosa en el cursor de F2/F3 (de la lista 0xD710, p10:B880)
	cp 001h		;b685
	jr z,no_b6ad		;b687
	cp 00ch		;b689
	jr z,no_b6ad		;b68b
no_2_0a_0b:
	ld a,(0d704h)		;b68d   ; lee la cosa en el cursor de F2/F3 (de la lista 0xD710, p10:B880)
	cp 002h		;b690
	jr z,no_b6ad		;b692
	cp 00ah		;b694
	jr z,no_b6ad		;b696
	cp 00bh		;b698
	jr z,no_b6ad		;b69a
	and a			;b69c
	ret			;b69d
no_1_2:
	ld a,(0d704h)		;b69e   ; lee la cosa en el cursor de F2/F3 (de la lista 0xD710, p10:B880)
	dec a			;b6a1
	jr z,no_b6ad		;b6a2
no_la_2_b:
	ld a,(0d704h)		;b6a4   ; lee la cosa en el cursor de F2/F3 (de la lista 0xD710, p10:B880)
	cp 002h		;b6a7
	jr z,no_b6ad		;b6a9
	and a			;b6ab
	ret			;b6ac
no_b6ad:		; acarreo: no se puede
	scf			;b6ad
	ret			;b6ae
la_9_sala_0d_5:		; la 9 solo en la zona 0x0D sala 5
	ld a,(0ca4ah)		;b6af   ; lee la zona
	cp 00dh		;b6b2
	jr nz,no_b6ad		;b6b4
	ld a,(0ca4bh)		;b6b6   ; lee la sala de la zona
	cp 005h		;b6b9
	jr nz,no_b6ad		;b6bb
si_b6bd:
	and a			;b6bd
	ret			;b6be
la_0d:		; la 0x0D: no con 0xCA64 ni donde p10:B6DF lo impide; hasta 10 veces (0xCAF5 uno mas), 0xCAF2 = 0 y 0xCAF1 = 1
	ld a,(0ca64h)		;b6bf
	or a			;b6c2
	jr nz,no_b6ad		;b6c3
	call donde_no_0d		;b6c5   ; donde_no_0d: acarreo con 0xCAF1, 0xD8A0, las salas especiales 0x29 y 2, las zonas 0x12, 0x13 y 0x0E, la zona 3 sala 6, la 7 salas 0x10-0x13 y la 0x0A salas 0x0B-0x0C y 0x10-0x11
	ret c			;b6c8
	ld a,(0caf5h)		;b6c9   ; hasta 10
	cp 00ah		;b6cc
	jr nc,no_b6ad		;b6ce
	inc a			;b6d0   ; una mas
	ld (0caf5h),a		;b6d1   ; guarda cuantas veces se uso la cosa 0x0D (hasta 10)
	xor a			;b6d4
	ld (0caf2h),a		;b6d5   ; guarda el paso de lo de 0xCAF1 (p11:BB1E)
	ld a,001h		;b6d8   ; 0xCAF1 = 1
	ld (0caf1h),a		;b6da   ; guarda 1 con lo de la cosa 0x0D en marcha (p10:B6BF)
	and a			;b6dd
	ret			;b6de
donde_no_0d:		; acarreo con 0xCAF1, 0xD8A0, las salas especiales 0x29 y 2, las zonas 0x12, 0x13 y 0x0E, la zona 3 sala 6, la 7 salas 0x10-0x13 y la 0x0A salas 0x0B-0x0C y 0x10-0x11
	ld a,(0caf1h)		;b6df   ; lee 1 con lo de la cosa 0x0D en marcha (p10:B6BF)
	or a			;b6e2
	jr nz,no_b6ad		;b6e3   ; con 0xCAF1, no
	ld a,(0d8a0h)		;b6e5
	or a			;b6e8
	jr nz,no_b6ad		;b6e9   ; con 0xD8A0, no
	ld a,(0ca76h)		;b6eb   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 029h		;b6ee
	jr z,no_b6ad		;b6f0   ; la especial 0x29...
	cp 002h		;b6f2
	jr z,no_b6ad		;b6f4   ; ...y la 2, no
	ld a,(0ca4ah)		;b6f6   ; lee la zona
	cp 012h		;b6f9
	jr z,no_b6ad		;b6fb   ; la zona 0x12...
	cp 013h		;b6fd
	jr z,no_b6ad		;b6ff   ; ...la 0x13...
	cp 00eh		;b701
	jr z,no_b6ad		;b703   ; ...y la 0x0E, no
	cp 003h		;b705
	jr z,zona_3_0d		;b707   ; la 3, segun la sala
	cp 007h		;b709
	jr z,zona_7_0d		;b70b   ; la 7, segun la sala
	cp 00ah		;b70d
	jr z,zona_0a_0d		;b70f   ; la 0x0A, segun la sala
	and a			;b711   ; las demas, si
	ret			;b712
zona_3_0d:
	ld a,(0ca4bh)		;b713   ; lee la sala de la zona
	cp 006h		;b716
	jr z,no_b6ad		;b718
	and a			;b71a
	ret			;b71b
zona_7_0d:
	ld a,(0ca4bh)		;b71c   ; lee la sala de la zona
	cp 010h		;b71f
	jr c,si_b6bd		;b721
	cp 014h		;b723
	ret			;b725
zona_0a_0d:
	ld a,(0ca4bh)		;b726   ; lee la sala de la zona
	cp 00bh		;b729
	jr c,si_b6bd		;b72b
	cp 00dh		;b72d
	ret c			;b72f
	cp 010h		;b730
	jr c,si_b6bd		;b732
	cp 012h		;b734
	ret			;b736
la_2_sin_llegadas:		; la 2: no en las zonas sin llegadas (p04:96BA) ni en la zona 0x0E sala 4 o la 0x0F sala 1
	call no_la_2_b		;b737   ; no_la_2_b:
	ret nc			;b73a
	call 04224h		;b73b   ; bancos_4: pone el 4 en 0x8000 (con su copia en 0xC381-0xC383)
	call 096bah		;b73e   ; sin_llegadas: acarreo en las zonas sin llegadas: la 0x10, la 0x0C salas 0-3, la 0x0D sala 0
	call 041cah		;b741   ; bancos_1_2_10: pone el 1 en 0x6000, el 2 en 0x8000, el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	ret c			;b744
	ld b,004h		;b745
	ld a,(0ca4ah)		;b747   ; lee la zona
	cp 00eh		;b74a
	jr z,sala_b		;b74c
	ld b,001h		;b74e
	cp 00fh		;b750
	jr z,sala_b		;b752
	and a			;b754
	ret			;b755
sala_b:
	ld a,(0ca4bh)		;b756   ; lee la sala de la zona
	cp b			;b759
	ret			;b75a
la_2_sala_18:		; la 2 no en la sala especial 0x18 salvo en la sala 0
	ld a,(0d704h)		;b75b   ; lee la cosa en el cursor de F2/F3 (de la lista 0xD710, p10:B880)
	cp 002h		;b75e
	jr nz,si_b771		;b760
	ld a,(0ca76h)		;b762   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 018h		;b765
	jr nz,si_b771		;b767
	ld a,(0ca4bh)		;b769   ; lee la sala de la zona
	or a			;b76c
	jr z,si_b771		;b76d
no_b76f:
	scf			;b76f
	ret			;b770
si_b771:
	and a			;b771
	ret			;b772
con_d7d5_4:		; con el bit 4 de 0xD7D5 y sin el 0 de 0xD7DA, la 2 y la 0x0D no se pueden
	ld a,(0d7d5h)		;b773
	bit 4,a		;b776
	jr z,si_b771		;b778   ; sin el bit 4, si
	ld a,(0d7dah)		;b77a
	rra			;b77d
	ccf			;b77e
	ret nc			;b77f   ; con el bit 0 de 0xD7DA, si
	ld a,(0d704h)		;b780   ; lee la cosa en el cursor de F2/F3 (de la lista 0xD710, p10:B880)
	cp 002h		;b783   ; la 2...
	jr z,no_b76f		;b785
	cp 00dh		;b787   ; ...y la 0x0D, no
	jr z,no_b76f		;b789
	and a			;b78b
	ret			;b78c
barras_de_cb21:		; las barras de la derecha segun 0xCB21: la 4 (p10:B839), la 7 (p10:B7F3); las demas, las dos a 0x20 de ancho (0xCAC4 y 0xCA54) con su marco
	ld a,(0cb21h)		;b78d   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	cp 004h		;b790
	jp z,barras_de_4		;b792   ; barras_de_4: la 4: con 0xDFF0, la tercera barra a 0x40 con su marco; si no, las dos a 0x40 (y la de 0xCAC4 con 0xCB3F)
	cp 007h		;b795
	jr z,barras_de_7		;b797
	ld hl,0cac4h		;b799   ; apunta a lo largo de la barra de la derecha llena
	call barra_a_20		;b79c   ; barra_a_20: el ancho de HL a 0x20 y lo que queda a la mitad (al menos 2)
	ld a,(0dff0h)		;b79f   ; lee 1 mientras corre la tercera barra
	or a			;b7a2
	jr nz,tercera_a_20		;b7a3
	call marco_de_barra		;b7a5   ; marco_de_barra: borra la franja, el marco de la zona (p10:B7E8) y p00:42B0 con 0x20
	ld a,(0ca4ah)		;b7a8   ; lee la zona
	cp 006h		;b7ab
	call z,0431eh		;b7ad   ; barra_derecha_cac4: la barra de la derecha de 0xCAC5 (con 0xCAE2 puesto)
tercera_a_20:
	ld hl,0ca54h		;b7b0   ; apunta a el ancho de la tercera barra (lo maximo)
	call barra_a_20		;b7b3   ; barra_a_20: el ancho de HL a 0x20 y lo que queda a la mitad (al menos 2)
	ld a,(0cb3fh)		;b7b6   ; lee en la zona 6, lo que hay bajo Snake: 1 con los caracteres 0x90-0xB3, 2 con 0xB8-0xDB (3 con 0xCAAA)
	cp 002h		;b7b9
	ret nc			;b7bb
	call marco_de_barra		;b7bc   ; marco_de_barra: borra la franja, el marco de la zona (p10:B7E8) y p00:42B0 con 0x20
	ld a,(0ca4ah)		;b7bf   ; lee la zona
	cp 006h		;b7c2
	jp nz,04331h		;b7c4   ; barra_derecha_ca54: la barra de la derecha de 0xCA55 (con 0xCAE2 puesto)
	ret			;b7c7
barra_a_20:		; el ancho de HL a 0x20 y lo que queda a la mitad (al menos 2)
	ld a,(hl)			;b7c8
	cp 020h		;b7c9   ; ya 0x20, nada
	ret z			;b7cb
	ld (hl),020h		;b7cc
	inc hl			;b7ce
	ld a,(hl)			;b7cf
	cp 002h		;b7d0
	ret c			;b7d2
	rra			;b7d3   ; la mitad...
	and 07eh		;b7d4
	or a			;b7d6
	jr nz,pon_barra		;b7d7
	ld a,002h		;b7d9   ; ...al menos 2
pon_barra:
	ld (hl),a			;b7db
	ret			;b7dc
marco_de_barra:		; borra la franja, el marco de la zona (p10:B7E8) y p00:42B0 con 0x20
	call 04309h		;b7dd   ; borra_franja_80c0: borra 0x5A x 0x10 puntos desde X = 0x80, Y = 0xC0 en las paginas 0 y 1
	call marco_segun_zona		;b7e0   ; marco_segun_zona: en la zona 6, el marco de 0xCAC4; en las demas, el de 0xCA54
	ld a,020h		;b7e3
	jp 042b0h		;b7e5
marco_segun_zona:		; en la zona 6, el marco de 0xCAC4; en las demas, el de 0xCA54
	ld a,(0ca4ah)		;b7e8   ; lee la zona
	cp 006h		;b7eb
	jp nz,07053h		;b7ed   ; marco_derecha_ca54_bancos_10:
	jp 07042h		;b7f0   ; marco_derecha_cac4_bancos_10:
barras_de_7:		; la 7: con 0xCB3F desde 2, la barra de 0xCAC4 a 0x40 (p10:B82C) con su marco; si no, las dos a 0x40 (y la tercera con 0xDFF0)
	ld a,(0cb3fh)		;b7f3   ; lee en la zona 6, lo que hay bajo Snake: 1 con los caracteres 0x90-0xB3, 2 con 0xB8-0xDB (3 con 0xCAAA)
	cp 002h		;b7f6
	jr c,barras_a_40		;b7f8
	ld hl,0cac4h		;b7fa   ; apunta a lo largo de la barra de la derecha llena
	call barra_a_40		;b7fd   ; barra_a_40: el ancho de HL a 0x40 y lo que queda al doble
	call 04309h		;b800   ; borra_franja_80c0: borra 0x5A x 0x10 puntos desde X = 0x80, Y = 0xC0 en las paginas 0 y 1
	call 07042h		;b803   ; marco_derecha_cac4_bancos_10:
	call 042a8h		;b806   ; marco_barra_cac4: el marco de la barra de la derecha con el ancho de 0xCAC4
	jp 0431eh		;b809   ; barra_derecha_cac4: la barra de la derecha de 0xCAC5 (con 0xCAE2 puesto)
barras_a_40:
	ld a,040h		;b80c
	ld hl,0cac4h		;b80e   ; apunta a lo largo de la barra de la derecha llena
	ld (hl),a			;b811
	inc hl			;b812
	ld (hl),a			;b813
	ld hl,0ca54h		;b814   ; apunta a el ancho de la tercera barra (lo maximo)
	ld a,(0dff0h)		;b817   ; lee 1 mientras corre la tercera barra
	or a			;b81a
	jr nz,tercera_7		;b81b
	ld a,020h		;b81d
	ld (hl),a			;b81f
	inc hl			;b820
	ld (hl),a			;b821
	ret			;b822
tercera_7:
	call barra_a_20		;b823   ; barra_a_20: el ancho de HL a 0x20 y lo que queda a la mitad (al menos 2)
	call marco_de_barra		;b826   ; marco_de_barra: borra la franja, el marco de la zona (p10:B7E8) y p00:42B0 con 0x20
	jp 04331h		;b829   ; barra_derecha_ca54: la barra de la derecha de 0xCA55 (con 0xCAE2 puesto)
barra_a_40:		; el ancho de HL a 0x40 y lo que queda al doble
	ld a,(hl)			;b82c
	cp 040h		;b82d   ; ya 0x40, nada
	ret z			;b82f
	ld (hl),040h		;b830   ; 0x40 de ancho
	inc hl			;b832
	ld a,(hl)			;b833
	rla			;b834   ; lo que queda, al doble
	and 0feh		;b835
	ld (hl),a			;b837
	ret			;b838
barras_de_4:		; la 4: con 0xDFF0, la tercera barra a 0x40 con su marco; si no, las dos a 0x40 (y la de 0xCAC4 con 0xCB3F)
	ld a,(0dff0h)		;b839   ; lee 1 mientras corre la tercera barra
	or a			;b83c
	jr z,barras_4_a_40		;b83d
	ld hl,0ca54h		;b83f   ; apunta a el ancho de la tercera barra (lo maximo)
	call barra_a_40		;b842   ; barra_a_40: el ancho de HL a 0x40 y lo que queda al doble
	call 04309h		;b845   ; borra_franja_80c0: borra 0x5A x 0x10 puntos desde X = 0x80, Y = 0xC0 en las paginas 0 y 1
	call 07053h		;b848   ; marco_derecha_ca54_bancos_10:
	call 042adh		;b84b   ; marco_barra_ca54: el marco de la barra de la derecha con el ancho de 0xCA54
	jp 04331h		;b84e   ; barra_derecha_ca54: la barra de la derecha de 0xCA55 (con 0xCAE2 puesto)
barras_4_a_40:
	ld a,040h		;b851
	ld hl,0ca54h		;b853   ; apunta a el ancho de la tercera barra (lo maximo)
	ld (hl),a			;b856
	inc hl			;b857
	ld (hl),a			;b858
	ld hl,0cac4h		;b859   ; apunta a lo largo de la barra de la derecha llena
	ld a,(0cb3fh)		;b85c   ; lee en la zona 6, lo que hay bajo Snake: 1 con los caracteres 0x90-0xB3, 2 con 0xB8-0xDB (3 con 0xCAAA)
	cp 002h		;b85f
	jr nc,cac4_de_4		;b861
	ld a,020h		;b863
	ld (hl),a			;b865
	inc hl			;b866
	ld (hl),a			;b867
	ret			;b868
cac4_de_4:
	call barra_a_20		;b869   ; barra_a_20: el ancho de HL a 0x20 y lo que queda a la mitad (al menos 2)
	call marco_de_barra		;b86c   ; marco_de_barra: borra la franja, el marco de la zona (p10:B7E8) y p00:42B0 con 0x20
	jp 0431eh		;b86f   ; barra_derecha_cac4: la barra de la derecha de 0xCAC5 (con 0xCAE2 puesto)
rachas_de_la_1:		; con 0xCB21 = 1, las rachas de p37:B34A
	ld a,(0cb21h)		;b872   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	cp 001h		;b875
	jp z,08593h		;b877   ; rachas_b34a: p37:B34A a la VRAM de 0x1E200 (A = 1)
	ret			;b87a
pon_elegida:		; (DE) = 0xD704
	ld a,(0d704h)		;b87b   ; lee la cosa en el cursor de F2/F3 (de la lista 0xD710, p10:B880)
	ld (de),a			;b87e
	ret			;b87f
cosa_del_cursor:		; A = la cosa de la lista 0xD710 en el cursor (fila 0xD703 * C + columna 0xD702)
	ld a,(0d703h)		;b880   ; lee la fila del cursor en F2/F3
	or a			;b883
	jr z,mas_columna		;b884   ; en la fila 0, la columna
	ld b,a			;b886
	xor a			;b887
por_c:
	add a,c			;b888
	djnz por_c		;b889
mas_columna:
	ld hl,0d702h		;b88b   ; apunta a la columna del cursor en F2/F3
	add a,(hl)			;b88e
	ld hl,0d710h		;b88f   ; apunta a la lista de las cosas de la pantalla de F2/F3 (0x23 sitios, p10:B099)
	call 0423eh		;b892   ; suma_a_hl: HL = HL + A
	ld a,(hl)			;b895
	ret			;b896
sale_del_menu:		; con algo elegido, el sonido 0x22; la sala repintada, lo lanzado a cero, 0xD700 = 0xD701 = 0xCB16 = 0, 0xD706 = 0xCA69 = 0xE236 = 1 y, con 0xCB21 = 2, los que siguen pintados
	or a			;b897
	call nz,06a83h		;b898   ; sonido_22: pide el sonido 0x22
	call 092f3h		;b89b   ; la sala repintada
	call sin_lanzados_p10		;b89e   ; lo lanzado a cero
	xor a			;b8a1
	ld (0d700h),a		;b8a2   ; guarda el estado de la pantalla de F2/F3 (0xD700-0xD70F; p10:AFB2)
	ld (0d701h),a		;b8a5   ; guarda 1 con la pantalla de F2/F3 ya montada (cada cuadro, p10:AED6)
	ld (0cb16h),a		;b8a8   ; guarda 1 mientras Snake se da la vuelta
	inc a			;b8ab
	ld (0d706h),a		;b8ac   ; 0xD706 = 1
	ld (0ca69h),a		;b8af   ; guarda el quinto byte de la ficha de la sala (p02:877F)
	ld (0e236h),a		;b8b2
	ld a,(0cb21h)		;b8b5   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	cp 002h		;b8b8
	jp z,08ec0h		;b8ba   ; a_p03_b4e0_2: p03:B4E0 con el banco 3 en 0xA000
	ret			;b8bd
marco_b8be:
	ld a,(0ca42h)		;b8be   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	jp 046bch		;b8c1   ; marco: cuatro lineas: un marco de D x E desde HL
letrero_f2_0:		; el letrero 0 de p50:8046 (ninguno)
	xor a			;b8c4
	jr letrero_8046		;b8c5
letrero_de_lo_elegido:		; el letrero de lo elegido de p50:8046 y, para la 7, su recuadro (p10:B8D5)
	call letrero_d704		;b8c7   ; letrero_d704:
	jr recuadro_de_7		;b8ca
letrero_d704:
	ld a,(0d704h)		;b8cc   ; lee la cosa en el cursor de F2/F3 (de la lista 0xD710, p10:B880)
letrero_8046:
	ld hl,08046h		;b8cf
	jp 064c3h		;b8d2   ; letrero_a_de_50: el letrero A de la tabla de la palabra HL del banco 50, en (0x0C, 0x94)
recuadro_de_7:		; la 7: un marco en (0x94, 0x70) de 0x44 x 0x20, los letreros de p10:B919 y p10:B920 y el cursor de 0xD70A (p10:B8F8)
	ld a,(0d704h)		;b8d5   ; lee la cosa en el cursor de F2/F3 (de la lista 0xD710, p10:B880)
	cp 007h		;b8d8
	ret nz			;b8da
	ld hl,07094h		;b8db
	ld de,04420h		;b8de
	ld c,007h		;b8e1
	call marco_b8be		;b8e3   ; marco_b8be:
	ld hl,0b919h		;b8e6
	ld de,0809ah		;b8e9
	call 04950h		;b8ec   ; letrero: pinta las letras de HL en DE hasta 0xFF (0xFE salta de linea)
	ld hl,0b920h		;b8ef
	ld de,080a6h		;b8f2
	call 04950h		;b8f5   ; letrero: pinta las letras de HL en DE hasta 0xFF (0xFE salta de linea)
cursor_d70a:		; borra 8 x 0x18 en (0x9A, 0x74) y el cursor en (0x9A, 0x74) o (0xA6, 0x74) segun 0xD70A
	ld a,(0ca42h)		;b8f8   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	ld b,a			;b8fb
	rlca			;b8fc
	rlca			;b8fd
	or b			;b8fe
	ld hl,0629ah		;b8ff
	ld de,0749ah		;b902
	ld bc,00818h		;b905
	call 04767h		;b908   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
	ld a,(0d70ah)		;b90b   ; lee 0-1: la opcion de la cosa 7 en F2 (p10:B8F8)
	ld de,0749ah		;b90e
	or a			;b911
	jr z,pinta_cursor_d70a		;b912
	ld e,0a6h		;b914
pinta_cursor_d70a:
	jp copia_cursor		;b916   ; copia_cursor:

; ----------------------------------------------------------------------
; DATOS resto_B919: lo apuntan con el banco puesto p10:B8E6 (0xB919), p10:B8EF
;   (0xB920); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p10:B8E6, p10:B8EF (13 bytes)
;   0xb919..0xb926  (13 bytes)
DATA_resto_B919:
	defb 01dh,021h,013h,01eh,00dh,012h,0ffh,01eh,013h,017h,00fh,01ch,0ffh	; b919  .!...........

; ======================================================================
; CODIGO 0xb926..0xbcfd  (983 bytes)
; ======================================================================


letrero_de_f3:		; el letrero de lo elegido de p50:8048 y, para las 0x14-0x1C, su dibujo de 8 x 8 en (0x94, 0x3C)
	call letrero_8048		;b926   ; letrero_8048:
	jr dibujo_14_1c		;b929
letrero_8048:
	ld a,(0d704h)		;b92b   ; lee la cosa en el cursor de F2/F3 (de la lista 0xD710, p10:B880)
	ld hl,08048h		;b92e
	jp 064c3h		;b931   ; letrero_a_de_50: el letrero A de la tabla de la palabra HL del banco 50, en (0x0C, 0x94)
dibujo_14_1c:
	ld a,(0d704h)		;b934   ; lee la cosa en el cursor de F2/F3 (de la lista 0xD710, p10:B880)
	sub 014h		;b937   ; por debajo de 0x14, nada
	ret c			;b939
	cp 009h		;b93a
	ret nc			;b93c   ; desde 0x1D, nada
	ld hl,01000h		;b93d   ; de (0x10 + (A - 0x14) * 8, 0)
	rlca			;b940
	rlca			;b941
	rlca			;b942
	add a,h			;b943
	ld h,a			;b944
	ld a,(0ca42h)		;b945   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	rlca			;b948
	rlca			;b949
	rlca			;b94a
	rlca			;b94b
	or 0c8h		;b94c
	ld bc,00808h		;b94e
	ld de,03c94h		;b951
	jp 047edh		;b954   ; copia_rectangulo_logica: orden LMMM del VDP con la operacion logica de A
sin_lanzados_p10:		; lo lanzado por Snake a cero
	ld hl,0cb80h		;b957   ; apunta a las 6 fichas de 16 bytes de lo que lanza Snake ([tipo][..][Y 8.8][X 8.8][velocidades]...)
	ld bc,0005fh		;b95a
	jp 04236h		;b95d   ; borra_bloque: pone a cero BC + 1 bytes desde HL
pinta_cuenta:		; la cuenta BCD de HL en DE (hasta 3 cifras, sin ceros a la izquierda), 8 a la derecha cada cifra; la de 0xD62C o con 0xD8A4, borrada
	push hl			;b960
	push de			;b961
	dec hl			;b962
	dec hl			;b963
	ld de,0d62ch		;b964
	and a			;b967
	sbc hl,de		;b968   ; la de 0xD62C, borrada
	pop de			;b96a
	pop hl			;b96b
	jr z,borra_cuenta		;b96c
	ld a,(0d8a4h)		;b96e
	or a			;b971
	jr nz,borra_cuenta		;b972   ; con 0xD8A4, borrada
	ld a,(hl)			;b974
	or a			;b975
	jr nz,cifras_de_cuenta		;b976   ; las centenas...
	dec hl			;b978
	ld a,(hl)			;b979
	or a			;b97a
	jr z,borra_cuenta		;b97b   ; ...sin cuenta, borrada
	inc hl			;b97d
cifras_de_cuenta:
	ld a,(hl)			;b97e
	or a			;b97f   ; con centenas...
	jr nz,tres_cifras		;b980   ; con centenas, las tres
	push hl			;b982
	push de			;b983
	call borra_cuenta		;b984   ; sin ellas, borra
	pop de			;b987
	pop hl			;b988
	ld a,d			;b989   ; 8 a la derecha
	add a,008h		;b98a
	ld d,a			;b98c
	dec hl			;b98d
	ld a,(hl)			;b98e   ; las decenas...
	rra			;b98f
	rra			;b990
	rra			;b991
	rra			;b992
	and 00fh		;b993
	or a			;b995
	jr nz,decenas_y_unidades		;b996   ; ...con ellas, dos cifras
	ld a,d			;b998   ; sin ellas, 8 mas...
	add a,008h		;b999
	ld d,a			;b99b
	ld a,(hl)			;b99c   ; ...solo las unidades
	jr una_cifra_p10		;b99d
decenas_y_unidades:
	call una_cifra_p10		;b99f   ; una_cifra_p10: la cifra A en DE y 8 a la derecha
	ld a,(hl)			;b9a2
	jr una_cifra_p10		;b9a3
tres_cifras:
	call una_cifra_p10		;b9a5   ; una_cifra_p10: la cifra A en DE y 8 a la derecha
	dec hl			;b9a8
	ld a,(hl)			;b9a9
	rra			;b9aa
	rra			;b9ab
	rra			;b9ac
	rra			;b9ad
	call una_cifra_p10		;b9ae   ; una_cifra_p10: la cifra A en DE y 8 a la derecha
	ld a,(hl)			;b9b1
	jr una_cifra_p10		;b9b2
borra_cuenta:		; 0x18 x 0x10 en DE a 0
	ex de,hl			;b9b4
	ld bc,01810h		;b9b5
	jp 046fah		;b9b8   ; borra_bloque_pagina_0: p00:46FF con A = 0 en la pagina en la que se dibuja
una_cifra_p10:		; la cifra A en DE y 8 a la derecha
	and 00fh		;b9bb
	push hl			;b9bd
	call cifra_de_96ab		;b9be   ; cifra_de_96ab: la cifra de p56:96AB (dos mitades de 8 x 8) a la pagina 3
	pop hl			;b9c1
	ld a,d			;b9c2
	add a,008h		;b9c3
	ld d,a			;b9c5
	ret			;b9c6
cifra_de_96ab:		; la cifra de p56:96AB (dos mitades de 8 x 8) a la pagina 3
	push de			;b9c7
	call 071f4h		;b9c8   ; palabra_de_96ab_bancos_10:
	call dos_mitades		;b9cb   ; dos_mitades:
	pop de			;b9ce
	ret			;b9cf
dos_mitades:
	push hl			;b9d0
	ld h,l			;b9d1
	call mitad_8x8		;b9d2   ; mitad_8x8:
	pop hl			;b9d5
	ld a,e			;b9d6
	add a,008h		;b9d7
	ld e,a			;b9d9
mitad_8x8:
	push de			;b9da
	ld l,068h		;b9db
	ld bc,00808h		;b9dd
	call 0473bh		;b9e0   ; copia_rectangulo_a_3: p00:4767 de la pagina 0xCA42 a la 3
	pop de			;b9e3
	ret			;b9e4
marcador_de_lo_elegido:		; en el marcador: el dibujo de lo de 0xCB20 (p56:A6AF) con su cuenta en (0xE0, 0x88) y el de 0xCB21 (p56:A6CB) con la suya (0x20-0x22) en (0xE0, 0xB8)
	ld a,(0cb20h)		;b9e5   ; lee lo que usa el disparo 1 (0 nada; p02:8001 elige por ello)
	or a			;b9e8
	jr z,marcador_cb21		;b9e9
	dec a			;b9eb
	ld hl,0a6afh		;b9ec
	call 0649ch		;b9ef   ; palabra_de_56: HL = la palabra A de la tabla de HL del banco 56
	call dibujo_a_d074		;b9f2   ; dibujo_a_d074: el dibujo de HL a (0x74, 0xD0), 0x20 x 16 (16 x 16 en (0x74, 0xD8) desde la 3)
	ld a,(0cb20h)		;b9f5   ; lee lo que usa el disparo 1 (0 nada; p02:8001 elige por ello)
	ld hl,0d600h		;b9f8   ; apunta a lo que lleva Snake: fichas de 4 bytes [la tiene][cuenta en BCD, 2 bytes][...]; las de 0xCB20 desde la 1
	ld de,0e088h		;b9fb
	call cuenta_de_a		;b9fe   ; cuenta_de_a: la cuenta (bytes 2-3) de la ficha A - 1 de HL pintada (p10:B960) y copiada de la otra pagina, 0x20 x 8
	jr marcador_cb21		;ba01
borra_d8a4_b:
	ld hl,0d8a4h		;ba03
	call borra_sitio_de_hl		;ba06   ; borra_sitio_de_hl: 0x18 x 0x10 en HL y 8 x 0x10 en HL - 8 al color 0x99
marcador_cb21:
	ld a,(0cb21h)		;ba09   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	or a			;ba0c
	ret z			;ba0d
	dec a			;ba0e
	ld hl,0a6cbh		;ba0f
	call 0649ch		;ba12   ; palabra_de_56: HL = la palabra A de la tabla de HL del banco 56
	call dibujo_a_d8a4		;ba15   ; dibujo_a_d8a4: el dibujo de HL a (0xA4, 0xD8), 16 x 16
	ld a,(0cb21h)		;ba18   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	ld de,0e0b8h		;ba1b
	cp 020h		;ba1e
	ret c			;ba20
	cp 023h		;ba21
	ret nc			;ba23
	ld hl,0d638h		;ba24   ; apunta a la segunda tabla de lo que lleva (fichas de 4 bytes, como 0xD600)
	jp cuenta_de_a		;ba27   ; cuenta_de_a: la cuenta (bytes 2-3) de la ficha A - 1 de HL pintada (p10:B960) y copiada de la otra pagina, 0x20 x 8
dibujo_a_d8a4:		; el dibujo de HL a (0xA4, 0xD8), 16 x 16
	ld de,0d8a4h		;ba2a
	ld bc,01010h		;ba2d
	jr copia_dibujo_logica		;ba30
dibujo_a_d074:		; el dibujo de HL a (0x74, 0xD0), 0x20 x 16 (16 x 16 en (0x74, 0xD8) desde la 3)
	ld de,0d074h		;ba32
	ld bc,02010h		;ba35
	ld a,(0cb20h)		;ba38   ; lee lo que usa el disparo 1 (0 nada; p02:8001 elige por ello)
	cp 003h		;ba3b
	jr c,copia_dibujo_logica		;ba3d
	ld b,010h		;ba3f
	ld d,0d8h		;ba41
copia_dibujo_logica:
	ld a,(0ca42h)		;ba43   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	rrca			;ba46
	rrca			;ba47
	rrca			;ba48
	rrca			;ba49
	and 030h		;ba4a
	or 0c8h		;ba4c
	jp 047edh		;ba4e   ; copia_rectangulo_logica: orden LMMM del VDP con la operacion logica de A
sprites_cb4b_f2:		; con 0xCB4B: el parpadeo (p10:BAA8), sin sprites y, sobre las dos primeras cosas de la lista, la 9 con sus sprites
	ld hl,0cb4bh		;ba51   ; apunta a con el puesto, la vida baja un punto cada 16 cuadros
	ld a,(hl)			;ba54
	or a			;ba55
	ret z			;ba56
	call parpadeo_cb4b		;ba57   ; parpadeo_cb4b: cada 4 cuadros (0xCB4C), el bit 0 de 0xCB4D cambia
	call 04266h		;ba5a   ; esconde_sprites_ram: llena 0xDC00-0xDC7F con 0xE0
	ld b,002h		;ba5d
	ld de,02410h		;ba5f
	ld hl,0d710h		;ba62   ; apunta a la lista de las cosas de la pantalla de F2/F3 (0x23 sitios, p10:B099)
cosa_cb4b:
	push bc			;ba65
	push de			;ba66
	push hl			;ba67
	ld a,(hl)			;ba68
	or a			;ba69   ; con algo, su sprite
	call nz,sprite_de_la_9		;ba6a   ; sprite_de_la_9: la 9: el sprite 0 (patron 0xF0 o 0xF8 segun 0xCB4D) y sus colores
	pop hl			;ba6d
	pop de			;ba6e
	pop bc			;ba6f
	inc hl			;ba70   ; la siguiente
	ld a,e			;ba71
	add a,010h		;ba72   ; 0x10 a la derecha
	ld e,a			;ba74
	djnz cosa_cb4b		;ba75
	ret			;ba77
sprite_de_la_9:		; la 9: el sprite 0 (patron 0xF0 o 0xF8 segun 0xCB4D) y sus colores
	cp 009h		;ba78
	ret nz			;ba7a
	ld hl,0dc00h		;ba7b   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	call sprite_cb4d		;ba7e   ; sprite_cb4d: dos sprites en (E, D) con el patron 0xF0 (0xF8 con 0xCB4D)
	ld hl,0da00h		;ba81   ; apunta a la copia de la tabla de colores de sprites: 32 x 16 lineas (va con 0xDC00 detras)
	jr colores_0a_0b		;ba84
sprite_cb4d:		; dos sprites en (E, D) con el patron 0xF0 (0xF8 con 0xCB4D)
	ld a,(0cb4dh)		;ba86
	or a			;ba89
	ld c,0f0h		;ba8a
	jr z,pon_sprite_cb4d		;ba8c
	ld c,0f8h		;ba8e
pon_sprite_cb4d:
	call 05d41h		;ba90   ; pon_sprite: [E][D][C] en (HL): la Y, la X y el patron de un sprite de 0xDC00
	jp 05d3dh		;ba93   ; pon_sprite_mas_4: p00:5D41 con el patron C + 4
colores_0a_0b:		; 16 colores 0x0A y 16 0x0B
	ld a,00ah		;ba96
	ld bc,0000fh		;ba98
	call 04237h		;ba9b   ; llena_bloque: pone A en BC + 1 bytes desde HL
	inc hl			;ba9e
	inc de			;ba9f
	ld a,00bh		;baa0
	ld bc,0000fh		;baa2
	jp 04237h		;baa5   ; llena_bloque: pone A en BC + 1 bytes desde HL
parpadeo_cb4b:		; cada 4 cuadros (0xCB4C), el bit 0 de 0xCB4D cambia
	inc l			;baa8
	dec (hl)			;baa9   ; la cuenta de 4...
	ret nz			;baaa
	ld (hl),004h		;baab   ; ...otra vez
	inc l			;baad
	ld a,(hl)			;baae
	xor 001h		;baaf   ; el bit 0 cambia
	ld (hl),a			;bab1
	ret			;bab2
sprites_cb4b_f3:		; con 0xCB4B: el parpadeo, sin sprites y sobre las cosas de la lista (hasta 0x23, 7 por fila) los sprites de p10:BB00
	ld hl,0cb4bh		;bab3   ; apunta a con el puesto, la vida baja un punto cada 16 cuadros
	ld a,(hl)			;bab6
	or a			;bab7
	ret z			;bab8
	call parpadeo_cb4b		;bab9   ; parpadeo_cb4b: cada 4 cuadros (0xCB4C), el bit 0 de 0xCB4D cambia
	call 04266h		;babc   ; esconde_sprites_ram: llena 0xDC00-0xDC7F con 0xE0
	exx			;babf
	ld hl,0dc00h		;bac0   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	ld de,0da00h		;bac3   ; apunta a la copia de la tabla de colores de sprites: 32 x 16 lineas (va con 0xDC00 detras)
	exx			;bac6
	ld b,000h		;bac7
	ld de,01c10h		;bac9
	ld hl,0d710h		;bacc   ; apunta a la lista de las cosas de la pantalla de F2/F3 (0x23 sitios, p10:B099)
cosa_cb4b_f3:
	ld a,(hl)			;bacf
	or a			;bad0
	push bc			;bad1
	push de			;bad2
	push hl			;bad3
	call nz,sprite_de_cosa_f3		;bad4   ; sprite_de_cosa_f3: salvo las 2, 3, 5, 8, 0x0B, 0x10 y desde 0x20, el sprite de p10:BA86 y sus colores
	pop hl			;bad7
	pop de			;bad8
	pop bc			;bad9
	inc hl			;bada
	inc b			;badb
	call siguiente_sitio		;badc   ; siguiente_sitio: 0x10 a la derecha; tras las 7, 0xE, 0x15 y 0x1C, la fila siguiente
	ld a,b			;badf
	cp 023h		;bae0
	jr c,cosa_cb4b_f3		;bae2
	ret			;bae4
siguiente_sitio:		; 0x10 a la derecha; tras las 7, 0xE, 0x15 y 0x1C, la fila siguiente
	ld a,e			;bae5
	add a,010h		;bae6   ; 0x10 a la derecha
	ld e,a			;bae8
	ld a,b			;bae9
	cp 007h		;baea   ; tras la 7...
	jr z,fila_siguiente		;baec
	cp 00eh		;baee   ; ...la 0x0E...
	jr z,fila_siguiente		;baf0
	cp 015h		;baf2   ; ...la 0x15...
	jr z,fila_siguiente		;baf4
	cp 01ch		;baf6   ; ...y la 0x1C, otra fila
	ret nz			;baf8
fila_siguiente:
	ld a,d			;baf9
	add a,020h		;bafa
	ld d,a			;bafc
	ld e,010h		;bafd
	ret			;baff
sprite_de_cosa_f3:		; salvo las 2, 3, 5, 8, 0x0B, 0x10 y desde 0x20, el sprite de p10:BA86 y sus colores
	cp 002h		;bb00   ; la 2...
	ret z			;bb02
	cp 003h		;bb03   ; ...la 3...
	ret z			;bb05
	cp 005h		;bb06   ; ...la 5...
	ret z			;bb08
	cp 008h		;bb09   ; ...la 8...
	ret z			;bb0b
	cp 00bh		;bb0c   ; ...la 0x0B...
	ret z			;bb0e
	cp 010h		;bb0f   ; ...la 0x10...
	ret z			;bb11
	cp 020h		;bb12   ; ...y desde la 0x20, sin sprite
	ret nc			;bb14
	exx			;bb15
	push hl			;bb16   ; HL = el sprite siguiente
	exx			;bb17
	pop hl			;bb18
	call sprite_cb4d		;bb19   ; sprite_cb4d: dos sprites en (E, D) con el patron 0xF0 (0xF8 con 0xCB4D)
	push hl			;bb1c
	exx			;bb1d
	pop hl			;bb1e
	push de			;bb1f   ; DE = sus colores
	exx			;bb20
	pop hl			;bb21
	call colores_0a_0b		;bb22   ; colores_0a_0b: 16 colores 0x0A y 16 0x0B
	inc hl			;bb25   ; los siguientes
	push hl			;bb26
	exx			;bb27
	pop de			;bb28
	exx			;bb29
	ret			;bb2a
usa_en_f2:		; con 0xCB4B y el disparo 1, sobre la 9 o la 0x0B: el sonido 0x22 y la usa (p10:BB7D con 0xD621 o 0xD629)
	ld a,(0cb4bh)		;bb2b   ; lee con el puesto, la vida baja un punto cada 16 cuadros
	or a			;bb2e
	ret z			;bb2f
	ld a,(0ca07h)		;bb30   ; lee lo recien pulsado del mando (los bits de 0xCA08 que no estaban)
	and 010h		;bb33
	ret z			;bb35
	ld a,(0d704h)		;bb36   ; lee la cosa en el cursor de F2/F3 (de la lista 0xD710, p10:B880)
	cp 009h		;bb39
	jr z,usa_la_9		;bb3b
	cp 00bh		;bb3d
	ret nz			;bb3f
	call 06a83h		;bb40   ; sonido_22: pide el sonido 0x22
	ld hl,0d629h		;bb43
	jr gasta_de_d600		;bb46
usa_la_9:
	call 06a83h		;bb48   ; sonido_22: pide el sonido 0x22
	ld hl,0d621h		;bb4b
	jr gasta_de_d600		;bb4e
usa_en_f3:		; con 0xCB4B y el disparo 1: la cosa elegida de 0xD638 (las 0x20-0x22 solo con la vida al maximo) se usa (p10:BB96)
	ld a,(0cb4bh)		;bb50   ; lee con el puesto, la vida baja un punto cada 16 cuadros
	or a			;bb53
	ret z			;bb54
	ld a,(0ca07h)		;bb55   ; lee lo recien pulsado del mando (los bits de 0xCA08 que no estaban)
	and 010h		;bb58
	ret z			;bb5a
	ld a,(0d704h)		;bb5b   ; lee la cosa en el cursor de F2/F3 (de la lista 0xD710, p10:B880)
	dec a			;bb5e
	ld hl,0d638h		;bb5f   ; apunta a la segunda tabla de lo que lleva (fichas de 4 bytes, como 0xD600)
	add a,a			;bb62
	add a,a			;bb63
	call 0423eh		;bb64   ; suma_a_hl: HL = HL + A
	ld a,(0d704h)		;bb67   ; lee la cosa en el cursor de F2/F3 (de la lista 0xD710, p10:B880)
	cp 020h		;bb6a
	jr c,gasta_de_d638		;bb6c
	cp 023h		;bb6e
	jr nc,gasta_de_d638		;bb70
	ld a,(0ca53h)		;bb72   ; lee la vida de Snake (lo largo de la barra)
	ld b,a			;bb75
	ld a,(0ca52h)		;bb76   ; lee el ancho de la barra de vida (lo maximo)
	cp b			;bb79
	ret nz			;bb7a
	jr gasta_de_d638		;bb7b
gasta_de_d600:		; una menos de la cosa (p03:BE60, p03:BE42); acabada, fuera: el sitio de 0xD874 y su recuadro
	push hl			;bb7d
	ld a,(0d704h)		;bb7e   ; lee la cosa en el cursor de F2/F3 (de la lista 0xD710, p10:B880)
	call 092e3h		;bb81   ; a_p03_be60_2: p03:BE60 con el banco 3 en 0xA000
	ld a,(0d704h)		;bb84   ; lee la cosa en el cursor de F2/F3 (de la lista 0xD710, p10:B880)
	call 092ebh		;bb87   ; a_p03_be42: p03:BE42 con el banco 3 en 0xA000
	pop hl			;bb8a
	ret nc			;bb8b
	ld (hl),000h		;bb8c
	ld hl,0d874h		;bb8e
	ld bc,03810h		;bb91
	jr quita_de_la_pantalla		;bb94
gasta_de_d638:		; el sonido 0x22, una menos (p03:BEB7, BEB2); acabada, fuera: el sitio de 0xD8A4 y su recuadro
	push hl			;bb96
	ld a,(0d704h)		;bb97   ; lee la cosa en el cursor de F2/F3 (de la lista 0xD710, p10:B880)
	or a			;bb9a
	call nz,06a83h		;bb9b   ; sonido_22: pide el sonido 0x22
	ld a,(0d704h)		;bb9e   ; lee la cosa en el cursor de F2/F3 (de la lista 0xD710, p10:B880)
	call 092d2h		;bba1   ; a_p03_beb7: p03:BEB7 con el banco 3 en 0xA000
	ld a,(0d704h)		;bba4   ; lee la cosa en el cursor de F2/F3 (de la lista 0xD710, p10:B880)
	call 092dbh		;bba7   ; a_p03_beb2: p03:BEB2 con el banco 3 en 0xA000
	pop hl			;bbaa
	ret nc			;bbab
	ld (hl),000h		;bbac
	ld hl,0d8a4h		;bbae
	ld bc,02010h		;bbb1
quita_de_la_pantalla:		; borra su recuadro y su sitio, la cosa de la lista, 0xD704 = 0, el fondo y el letrero 0
	ld de,00e1ch		;bbb4
	push hl			;bbb7
	call sitio_del_cursor		;bbb8   ; sitio_del_cursor: D + B * la fila (0xD703) y E + C * la columna (0xD702)
	ld a,e			;bbbb
	sub 004h		;bbbc
	ld l,a			;bbbe
	ld a,d			;bbbf
	add a,00ah		;bbc0
	ld h,a			;bbc2
	ld bc,02010h		;bbc3
	call 046fah		;bbc6   ; borra_bloque_pagina_0: p00:46FF con A = 0 en la pagina en la que se dibuja
	pop hl			;bbc9
	call borra_sitio_de_hl		;bbca   ; borra_sitio_de_hl: 0x18 x 0x10 en HL y 8 x 0x10 en HL - 8 al color 0x99
	ld a,(0d704h)		;bbcd   ; lee la cosa en el cursor de F2/F3 (de la lista 0xD710, p10:B880)
	call quita_de_d710		;bbd0   ; quita_de_d710: la cosa A fuera de la lista 0xD710 (0x23 sitios)
	xor a			;bbd3
	ld (0d704h),a		;bbd4   ; guarda la cosa en el cursor de F2/F3 (de la lista 0xD710, p10:B880)
	call fondo_de_mensajes		;bbd7   ; fondo_de_mensajes: 0xB0 x 0x28 en (0x90, 8) al color 0x99
	jp letrero_f2_0		;bbda   ; letrero_f2_0: el letrero 0 de p50:8046 (ninguno)
cb4b_sin_cosas:		; con 0xCB4B y sin ninguna de las 0x31 cosas de 0xD600: el bit 2 de 0xD7D9, fuera el 0 de 0xD7D5, 0xCB4B = 0xE1E8 = 0...
	ld a,(0cb4bh)		;bbdd   ; lee con el puesto, la vida baja un punto cada 16 cuadros
	or a			;bbe0
	ret z			;bbe1
	ld hl,0d600h		;bbe2   ; apunta a lo que lleva Snake: fichas de 4 bytes [la tiene][cuenta en BCD, 2 bytes][...]; las de 0xCB20 desde la 1
	ld de,00004h		;bbe5
	ld b,031h		;bbe8
mira_cosa_d600:
	ld a,(hl)			;bbea
	or a			;bbeb
	ret nz			;bbec
	add hl,de			;bbed
	djnz mira_cosa_d600		;bbee
	ld hl,0d7d9h		;bbf0
	set 2,(hl)		;bbf3
	ld hl,0d7d5h		;bbf5
	res 0,(hl)		;bbf8
	xor a			;bbfa
	ld (0cb4bh),a		;bbfb   ; guarda con el puesto, la vida baja un punto cada 16 cuadros
	ld (0e1e8h),a		;bbfe   ; guarda 1 mientras hay una llamada
	ld (0d7bbh),a		;bc01   ; guarda 1: la pantalla de conversacion la abre una escena (llama sola, p09:B8AB)
	ld hl,0d88ch		;bc04   ; 0xD88C = 0xFF
	ld (hl),0ffh		;bc07
	call 04266h		;bc09   ; sin sprites
	jp 08eddh		;bc0c   ; a_p03_b1a3: p03:B1A3 con el banco 3 en 0xA000
e1c0_empieza:		; en la zona 0x0A, 0xE1C0 = 1 y 0xE1C1 = 1
	ld a,(0ca4ah)		;bc0f   ; lee la zona
	cp 00ah		;bc12
	ret nz			;bc14
	ld hl,0e1c0h		;bc15   ; apunta a 1-2: el estado de lo de la zona 0x0A sala 0x0E (p10:BC0F)
	ld (hl),001h		;bc18
	inc hl			;bc1a
	ld (hl),001h		;bc1b
	ret			;bc1d
e1c0_al_entrar:		; en la zona 0x0A sala 0x0E con 0xE1C0 (p10:BC27): los 8 bytes de 0xDE70 del mapa a 0xE1C8 y ahi 0x80, 0x40 x 0x18 de (0x40, 0x68) de la otra pagina a (0, 0) y las tres lineas de color 0x0E (p10:BC8A)
	call sala_0a_0e		;bc1e   ; sala_0a_0e: Z en la zona 0x0A sala 0x0E
	ret nz			;bc21
	ld a,(0e1c0h)		;bc22   ; lee 1-2: el estado de lo de la zona 0x0A sala 0x0E (p10:BC0F)
	and a			;bc25
	ret z			;bc26
e1c0_guarda:
	ld hl,0de70h		;bc27
	ld de,0e1c8h		;bc2a   ; los 8 bytes del mapa a 0xE1C8...
	ld bc,00008h		;bc2d
	push hl			;bc30
	ldir		;bc31
	pop hl			;bc33
	ld a,080h		;bc34   ; ...y en el mapa 0x80
	ld bc,00007h		;bc36
	call 04237h		;bc39   ; llena_bloque: pone A en BC + 1 bytes desde HL
	ld hl,04068h		;bc3c   ; 0x40 x 0x18 de (0x40, 0x68)...
	ld de,00000h		;bc3f
	ld bc,04018h		;bc42
	call 0474dh		;bc45   ; copia_rectangulo_a_esta: p00:4767 de la otra pagina (0xCA42 ^ 1) a la de 0xCA42
	ld c,00eh		;bc48   ; las lineas de color 0x0E
	jp tres_lineas		;bc4a   ; tres_lineas: tres lineas horizontales de 0x40 en X = 0x40, Y = 0x6C, 0x74 y 0x7C, color C
sala_0a_0e:		; Z en la zona 0x0A sala 0x0E
	ld a,(0ca4ah)		;bc4d   ; lee la zona
	cp 00ah		;bc50
	ret nz			;bc52
	ld a,(0ca4bh)		;bc53   ; lee la sala de la zona
	cp 00eh		;bc56
	ret			;bc58
e1c0_cada_cuadro:		; en la zona 0x0A sala 0x0E: con 0xE1C0 = 1, las lineas del color de 0xE1C1 (1-0x0E en vuelta); con 2 o mas, 0xE1C0 = 0, el mapa de vuelta (0xE1C8 a 0xDE70) y el rectangulo de (0, 0) a (0x40, 0x68) de la otra pagina
	call sala_0a_0e		;bc59   ; sala_0a_0e: Z en la zona 0x0A sala 0x0E
	ret nz			;bc5c
	ld hl,0e1c0h		;bc5d   ; apunta a 1-2: el estado de lo de la zona 0x0A sala 0x0E (p10:BC0F)
	ld a,(hl)			;bc60
	cp 001h		;bc61
	ret c			;bc63   ; sin 0xE1C0, nada
	jr z,e1c0_lineas		;bc64   ; en 1, las lineas
	ld (hl),000h		;bc66   ; 0xE1C0 = 0
	ld de,0de70h		;bc68   ; el mapa de vuelta
	ld hl,0e1c8h		;bc6b
	ld bc,00008h		;bc6e
	ldir		;bc71
	ld de,04068h		;bc73   ; el rectangulo de vuelta
	ld hl,00000h		;bc76
	ld bc,04018h		;bc79
	jp 0475ah		;bc7c   ; copia_rectangulo_a_la_otra: p00:4767 de la pagina 0xCA42 a la otra
e1c0_lineas:
	inc hl			;bc7f
	ld a,(hl)			;bc80   ; el color...
	ld c,a			;bc81
	inc a			;bc82   ; ...el siguiente (1-0x0E)
	cp 00fh		;bc83
	jr c,pon_e1c1		;bc85
	ld a,001h		;bc87
pon_e1c1:
	ld (hl),a			;bc89
tres_lineas:		; tres lineas horizontales de 0x40 en X = 0x40, Y = 0x6C, 0x74 y 0x7C, color C
	ld l,06ch		;bc8a
	call linea_40		;bc8c   ; linea_40:
	ld l,074h		;bc8f
	call linea_40		;bc91   ; linea_40:
	ld l,07ch		;bc94
linea_40:
	ld h,040h		;bc96
	ld b,h			;bc98
	ld a,(0ca42h)		;bc99   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	push bc			;bc9c
	call 0467ch		;bc9d   ; linea_horizontal: orden LINE del VDP (R#36-R#46) con el lado largo en X
	pop bc			;bca0
	ret			;bca1
fichas_e100:		; 0xE100-0xE1BF a cero y las fichas de la zona (5, 0x0D, 0x11, 0x10; la 0x0E con 0xD885 distinto de 0xFF) de p10:BCFD: 10 bytes cada una en fichas de 12, 0xFF acaba
	ld hl,0e100h		;bca2   ; apunta a 16 fichas de 12 bytes de p10:BCFD [tipo][Y][X][fila][columna][largo][cuenta][..][fondo 16 bits] (empujan a Snake, p10:BF14)
	ld bc,000bfh		;bca5
	call 04236h		;bca8   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	ld c,000h		;bcab   ; la lista 0...
	ld a,(0ca4ah)		;bcad   ; lee la zona
	cp 005h		;bcb0   ; ...la zona 5
	jr z,copia_lista_bcfd		;bcb2
	inc c			;bcb4
	cp 00dh		;bcb5   ; 1: la 0x0D
	jr z,copia_lista_bcfd		;bcb7
	inc c			;bcb9
	cp 00eh		;bcba   ; 2: la 0x0E
	jr z,zona_0e_d885		;bcbc
	inc c			;bcbe
	cp 011h		;bcbf   ; 3: la 0x11
	jr z,copia_lista_bcfd		;bcc1
	inc c			;bcc3
	cp 010h		;bcc4   ; 4: la 0x10
	jr z,copia_lista_bcfd		;bcc6
	ret			;bcc8
zona_0e_d885:
	ld a,(0d885h)		;bcc9
	inc a			;bccc
	ret z			;bccd   ; con 0xD885 a 0xFF, ninguna
copia_lista_bcfd:
	ld a,c			;bcce
	ld hl,0bcfdh		;bccf
	call 043f6h		;bcd2   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld de,0e100h		;bcd5   ; apunta a 16 fichas de 12 bytes de p10:BCFD [tipo][Y][X][fila][columna][largo][cuenta][..][fondo 16 bits] (empujan a Snake, p10:BF14)
ficha_bcfd:
	ld a,(hl)			;bcd8
	inc a			;bcd9   ; 0xFF: se acaba
	ret z			;bcda
	ld bc,0000ah		;bcdb   ; 10 bytes...
	ldir		;bcde
	inc de			;bce0   ; ...en fichas de 12
	inc de			;bce1
	jr ficha_bcfd		;bce2
fichas_e100_especial_31:		; en la zona 0x0A, 0xE100-0xE1BF a cero y, en la sala especial 0x31, la lista 5
	ld a,(0ca4ah)		;bce4   ; lee la zona
	cp 00ah		;bce7
	ret nz			;bce9
	ld hl,0e100h		;bcea   ; apunta a 16 fichas de 12 bytes de p10:BCFD [tipo][Y][X][fila][columna][largo][cuenta][..][fondo 16 bits] (empujan a Snake, p10:BF14)
	ld bc,000bfh		;bced
	call 04236h		;bcf0   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	ld a,(0ca76h)		;bcf3   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 031h		;bcf6
	ret nz			;bcf8
	ld c,005h		;bcf9
	jr copia_lista_bcfd		;bcfb

; ----------------------------------------------------------------------
; DATOS resto_BCFD: lo apuntan con el banco puesto p10:BCCF (0xBCFD); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p10:BCCF (368 bytes)
;   0xbcfd..0xbe6d  (368 bytes)
DATA_resto_BCFD:
	defb 009h,0bdh,050h,0bdh,083h,0bdh,010h,0beh,039h,0beh,04eh,0beh,001h,098h,090h,002h	; bcfd  ..P.....9.N.....
	defb 006h,020h,004h,004h,000h,000h,001h,018h,050h,003h,006h,028h,004h,004h,000h,000h	; bd0d  . ......P..(....
	defb 001h,058h,090h,003h,006h,028h,004h,004h,000h,002h,001h,018h,050h,004h,006h,028h	; bd1d  .X...(......P..(
	defb 004h,004h,000h,000h,002h,070h,0a8h,004h,006h,018h,004h,004h,000h,002h,002h,080h	; bd2d  .....p..........
	defb 0a8h,004h,006h,018h,004h,004h,002h,002h,002h,090h,0a8h,004h,006h,018h,004h,004h	; bd3d  ................
	defb 004h,002h,0ffh,001h,038h,060h,003h,007h,028h,004h,004h,000h,002h,001h,018h,050h	; bd4d  ....8`..(......P
	defb 004h,006h,028h,004h,004h,000h,002h,001h,098h,058h,004h,006h,020h,004h,004h,000h	; bd5d  ..(......X.. ...
	defb 008h,001h,098h,058h,004h,007h,020h,004h,004h,000h,004h,001h,038h,030h,004h,008h	; bd6d  ...X.. .....80..
	defb 028h,004h,004h,000h,002h,0ffh,001h,038h,018h,003h,007h,028h,004h,004h,000h,000h	; bd7d  (......8...(....
	defb 001h,038h,070h,003h,007h,028h,004h,004h,000h,002h,001h,038h,0b0h,003h,007h,028h	; bd8d  .8p..(.....8...(
	defb 004h,004h,000h,004h,001h,098h,018h,003h,007h,020h,004h,004h,000h,006h,001h,098h	; bd9d  ......... ......
	defb 060h,003h,007h,020h,004h,004h,000h,008h,001h,098h,0b0h,003h,007h,020h,004h,004h	; bdad  `.. ......... ..
	defb 000h,00ah,002h,080h,024h,003h,007h,018h,004h,004h,002h,010h,002h,080h,084h,003h	; bdbd  ....$...........
	defb 007h,018h,004h,004h,004h,010h,001h,038h,040h,003h,006h,028h,004h,004h,000h,000h	; bdcd  .......8@..(....
	defb 001h,038h,0b0h,003h,006h,028h,004h,004h,000h,002h,001h,098h,040h,003h,006h,020h	; bddd  .8...(......@..
	defb 004h,004h,000h,004h,001h,098h,0b0h,003h,006h,020h,004h,004h,000h,006h,002h,080h	; bded  ......... ......
	defb 004h,003h,006h,018h,004h,004h,002h,010h,002h,080h,064h,003h,006h,038h,004h,004h	; bdfd  ..........d..8..
	defb 004h,010h,0ffh,002h,020h,05ch,002h,007h,028h,004h,004h,000h,000h,002h,028h,05ch	; be0d  .... \..(.....(\
	defb 003h,007h,028h,004h,004h,002h,000h,002h,070h,07ch,003h,007h,028h,004h,004h,004h	; be1d  ..(.....p|..(...
	defb 000h,002h,048h,03ch,004h,007h,028h,004h,004h,006h,000h,0ffh,001h,038h,068h,002h	; be2d  ..H<..(......8h.
	defb 005h,058h,004h,004h,000h,000h,002h,050h,040h,002h,006h,060h,004h,004h,002h,000h	; be3d  .X.....P@..`....
	defb 0ffh,001h,018h,030h,002h,007h,028h,004h,004h,000h,000h,001h,018h,060h,002h,007h	; be4d  ...0..(......`..
	defb 028h,004h,004h,000h,002h,001h,018h,090h,002h,007h,028h,004h,004h,000h,004h,0ffh	; be5d  (.........(.....

; ======================================================================
; CODIGO 0xbe6d..0xc000  (403 bytes)
; ======================================================================


pinta_fichas_e100:		; sin 0xCA77 y fuera del estado 0x1A (en la zona 0x10, solo con 0xCA43 = 2): las 16 fichas de 0xE100 de esta sala pintadas (p10:BE9C)
	ld a,(0ca77h)		;be6d
	and a			;be70
	ret nz			;be71   ; con 0xCA77, nada
	ld a,(0cb00h)		;be72   ; lee el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	cp 01ah		;be75
	ret z			;be77   ; en el estado 0x1A, nada
	ld a,(0ca4ah)		;be78   ; lee la zona
	cp 010h		;be7b
	jr nz,fichas_e100_b		;be7d
	ld a,(0ca43h)		;be7f
	cp 002h		;be82
	ret nz			;be84   ; en la zona 0x10, solo con 0xCA43 = 2
fichas_e100_b:
	ld ix,0e100h		;be85   ; apunta a 16 fichas de 12 bytes de p10:BCFD [tipo][Y][X][fila][columna][largo][cuenta][..][fondo 16 bits] (empujan a Snake, p10:BF14)
	ld b,010h		;be89   ; 16 fichas de 12 bytes
ficha_e100:
	push bc			;be8b
	ld a,(ix+000h)		;be8c
	and a			;be8f
	call nz,pinta_ficha_e100		;be90   ; activa: pintada
	ld bc,0000ch		;be93
	add ix,bc		;be96
	pop bc			;be98
	djnz ficha_e100		;be99
	ret			;be9b
pinta_ficha_e100:		; en su sala (bytes 3-4): el fondo de (bytes 8-9) a su sitio (bytes 1-2), de 2 x largo (tipo 1, en vertical) o largo x 2, y una linea de color 7 del largo del byte 5
	ld bc,(0ca50h)		;be9c   ; lee la fila de la sala en la zona (uno mas al salir por arriba) y el byte siguiente (16 bits)
	ld a,(ix+004h)		;bea0   ; su sala...
	cp b			;bea3
	ret nz			;bea4
	ld a,(ix+003h)		;bea5
	cp c			;bea8
	ret nz			;bea9
	call sitio_y_fondo_e100		;beaa   ; el fondo
	ex de,hl			;bead
	ld b,002h		;beae
	ld a,(ix+000h)		;beb0   ; el tipo 1 en vertical...
	dec a			;beb3
	jr z,copia_fondo_e100		;beb4
	ld a,b			;beb6   ; ...los demas en horizontal
	ld b,c			;beb7
	ld c,a			;beb8
copia_fondo_e100:
	call 0474dh		;beb9   ; copia_rectangulo_a_esta: p00:4767 de la otra pagina (0xCA42 ^ 1) a la de 0xCA42
	ld h,(ix+002h)		;bebc   ; su sitio...
	ld l,(ix+001h)		;bebf
	ld b,(ix+005h)		;bec2   ; ...su largo...
	ld c,007h		;bec5   ; ...color 7
	ld a,(ix+000h)		;bec7
	dec a			;beca
	ld a,(0ca42h)		;becb   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	jp z,04680h		;bece   ; linea_vertical: orden LINE del VDP con el lado largo en Y (ARG = 1)
	jp 0467ch		;bed1   ; linea_horizontal: orden LINE del VDP (R#36-R#46) con el lado largo en X
fichas_e100_cada_cuadro:		; sin salir ni 0xCA77 (zona 0x10 solo con 0xCA43 = 2): cada ficha de 0xE100 de esta sala con Snake (p10:BF14)
	ld a,(0ca41h)		;bed4   ; lee la salida de la sala (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	and a			;bed7
	ret nz			;bed8
	ld a,(0ca77h)		;bed9
	and a			;bedc
	ret nz			;bedd
	ld a,(0ca4ah)		;bede   ; lee la zona
	cp 010h		;bee1
	jr nz,fichas_e100_c		;bee3
	ld a,(0ca43h)		;bee5
	cp 002h		;bee8
	ret nz			;beea
fichas_e100_c:
	ld ix,0e100h		;beeb   ; apunta a 16 fichas de 12 bytes de p10:BCFD [tipo][Y][X][fila][columna][largo][cuenta][..][fondo 16 bits] (empujan a Snake, p10:BF14)
	ld b,010h		;beef
ficha_e100_b:
	push bc			;bef1
	ld a,(ix+000h)		;bef2
	and a			;bef5
	jr z,siguiente_e100		;bef6   ; libre, la siguiente
	ld de,(0ca50h)		;bef8   ; lee la fila de la sala en la zona (uno mas al salir por arriba) y el byte siguiente (16 bits)
	ld a,(ix+003h)		;befc   ; en esta sala?
	cp e			;beff
	jr nz,siguiente_e100		;bf00
	ld a,(ix+004h)		;bf02
	cp d			;bf05
	jr nz,siguiente_e100		;bf06
	call ficha_e100_empuja		;bf08   ; ficha_e100_empuja: el tipo 1 (vertical): con Snake en su largo en Y, a menos de 6 (0x0E en el estado 2) de su X, la aparta 0x0C (0x14); los demas (p10:BF8A) en horizontal; y cuenta (p10:BF47)
siguiente_e100:
	ld bc,0000ch		;bf0b
	add ix,bc		;bf0e
	pop bc			;bf10
	djnz ficha_e100_b		;bf11
	ret			;bf13
ficha_e100_empuja:		; el tipo 1 (vertical): con Snake en su largo en Y, a menos de 6 (0x0E en el estado 2) de su X, la aparta 0x0C (0x14); los demas (p10:BF8A) en horizontal; y cuenta (p10:BF47)
	ld a,(ix+000h)		;bf14
	dec a			;bf17
	jp nz,ficha_e100_horizontal		;bf18   ; ficha_e100_horizontal: en horizontal: con Snake en su largo en X, a menos de 0x0C (0x1C en el estado 2) de su Y, la aparta en Y
	ld a,(0cb03h)		;bf1b   ; en su largo en Y?
	sub (ix+001h)		;bf1e
	cp (ix+005h)		;bf21
	ret nc			;bf24
	ld a,(0cb31h)		;bf25   ; en el estado 2...
	and a			;bf28
	ld de,0060ch		;bf29
	jr z,aparta_en_x		;bf2c
	ld de,00e14h		;bf2e   ; ...mas ancho
aparta_en_x:
	ld a,(0cb05h)		;bf31   ; lee la X de Snake
	ld b,(ix+002h)		;bf34
	cp b			;bf37   ; por la izquierda...
	jr nc,por_la_derecha_e100		;bf38
	add a,d			;bf3a
	cp b			;bf3b
	ret c			;bf3c
	sub e			;bf3d
	jr pon_x_snake_e100		;bf3e
por_la_derecha_e100:
	sub d			;bf40
	cp b			;bf41
	ret nc			;bf42
	add a,e			;bf43
pon_x_snake_e100:
	ld (0cb05h),a		;bf44   ; guarda la X de Snake
cuenta_de_e100:		; cada 4 empujones, el sonido 0x34 y, con alerta por debajo de 2, 0xD446 = 2; con la cuenta del byte 6 acabada, el sonido 0x56 y la ficha se va con su fondo de vuelta a la otra pagina
	dec (ix+007h)		;bf47
	ret nz			;bf4a
	ld (ix+007h),004h		;bf4b
	call 06ae6h		;bf4f   ; el sonido 0x34
	ld a,(0ca5fh)		;bf52   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	cp 002h		;bf55
	jr nc,ficha_e100_cuenta		;bf57
	ld a,002h		;bf59   ; los actores acuden
	ld (0d446h),a		;bf5b   ; guarda la cuenta hasta que los actores acuden a donde estaba Snake (4 al disparar, p03:AF12)
ficha_e100_cuenta:
	dec (ix+006h)		;bf5e
	ret nz			;bf61
	call 06b49h		;bf62   ; el sonido 0x56
	ld a,(ix+000h)		;bf65   ; la ficha libre
	ld (ix+000h),000h		;bf68
	call sitio_y_fondo_e100		;bf6c   ; sitio_y_fondo_e100: DE = su sitio (bytes 1-2), HL = el fondo (bytes 8-9), C = el largo (byte 5)
	ld b,002h		;bf6f
	dec a			;bf71
	jr z,fondo_e100_vuelta		;bf72
	ld a,b			;bf74
	ld b,c			;bf75
	ld c,a			;bf76
fondo_e100_vuelta:
	jp 0475ah		;bf77   ; copia_rectangulo_a_la_otra: p00:4767 de la pagina 0xCA42 a la otra
sitio_y_fondo_e100:		; DE = su sitio (bytes 1-2), HL = el fondo (bytes 8-9), C = el largo (byte 5)
	ld d,(ix+002h)		;bf7a   ; D = la X...
	ld e,(ix+001h)		;bf7d   ; ...E = la Y
	ld h,(ix+009h)		;bf80   ; el fondo
	ld l,(ix+008h)		;bf83
	ld c,(ix+005h)		;bf86   ; el largo
	ret			;bf89
ficha_e100_horizontal:		; en horizontal: con Snake en su largo en X, a menos de 0x0C (0x1C en el estado 2) de su Y, la aparta en Y
	ld a,(0cb05h)		;bf8a   ; lee la X de Snake
	sub (ix+002h)		;bf8d
	cp (ix+005h)		;bf90
	ret nc			;bf93
	ld a,(0cb31h)		;bf94   ; lee 1 en el estado 2 de Snake
	and a			;bf97
	ld de,00c10h		;bf98
	jr z,aparta_en_y		;bf9b
	ld de,01c20h		;bf9d
aparta_en_y:
	ld a,(0cb03h)		;bfa0   ; lee la Y de Snake
	ld b,(ix+001h)		;bfa3
	cp b			;bfa6
	jr nc,por_abajo_e100		;bfa7
	add a,004h		;bfa9
	cp b			;bfab
	ret c			;bfac
	sub 00ah		;bfad
	jr pon_y_snake_e100		;bfaf
por_abajo_e100:
	sub 008h		;bfb1
	cp b			;bfb3
	ret nc			;bfb4
	add a,010h		;bfb5
pon_y_snake_e100:
	ld (0cb03h),a		;bfb7   ; guarda la Y de Snake
	jr cuenta_de_e100		;bfba
vida_de_cosa:		; sin 0xCAB6, con la cosa 0x20-0x22 elegida (desde p07:B3CF, la vida a cero): la vida al maximo, una menos de ella y, acabada, a cero, 0xCB21 = 0 y (sin 0xD8A4) su sitio borrado
	ld a,(0cab6h)		;bfbc   ; lee 1 con la cuenta de 0xCAB7 en marcha (sala especial 0x11, p10:A0F8)
	or a			;bfbf
	ret nz			;bfc0   ; con 0xCAB6, nada
	ld a,(0cb21h)		;bfc1   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	ld b,020h		;bfc4   ; la 0x20...
	cp b			;bfc6
	ld hl,0d6b4h		;bfc7
	jr z,vida_al_maximo		;bfca
	ld hl,0d6b8h		;bfcc   ; ...la 0x21...
	inc b			;bfcf
	cp b			;bfd0
	jr z,vida_al_maximo		;bfd1
	ld hl,0d6bch		;bfd3   ; ...la 0x22
	inc b			;bfd6
	cp b			;bfd7
	ret nz			;bfd8
vida_al_maximo:		; la vida al maximo
	ld a,(0ca52h)		;bfd9   ; lee el ancho de la barra de vida (lo maximo)
	ld (0ca53h),a		;bfdc   ; guarda la vida de Snake (lo largo de la barra)
	ld a,(hl)			;bfdf
	or a			;bfe0
	ret z			;bfe1   ; sin ella, nada
	push hl			;bfe2
	push bc			;bfe3
	ld a,b			;bfe4
	call 092d2h		;bfe5   ; una menos
	pop af			;bfe8
	push af			;bfe9
	call 092dbh		;bfea   ; a_p03_beb2: p03:BEB2 con el banco 3 en 0xA000
	pop bc			;bfed
	pop hl			;bfee
	ret nc			;bfef   ; le quedan, ya esta
	xor a			;bff0   ; acabada...
	ld (hl),a			;bff1
	ld (0cb21h),a		;bff2   ; ...nada elegido
	ld a,(0d8a4h)		;bff5
	or a			;bff8
	ret nz			;bff9
	ld hl,0d8a4h		;bffa
	jp borra_sitio_de_hl		;bffd   ; borra_sitio_de_hl: 0x18 x 0x10 en HL y 8 x 0x10 en HL - 8 al color 0x99
