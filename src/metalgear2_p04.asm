; ==========================================================================
; METAL GEAR 2 SOLID SNAKE - Konami (1990) - MSX2 - MegaROM RC-767 de 512 KB (Konami SCC) - banco 04 (se ejecuta en 0x8000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x08000


; ----------------------------------------------------------------------
; Direcciones que solo aparecen como VALOR -en un `ld`, no en
; un salto-: son punteros que el codigo se pasa o numeros que
; casualmente coinciden con una direccion. No hay nada que
; trazar en ellas; el equ existe para que el listado ensamble.
; ----------------------------------------------------------------------
l8159h:	equ 0x08159

; ======================================================================
; CODIGO 0x8000..0x815b  (347 bytes)
; ======================================================================


actores_cada_cuadro:		; los 24 actores de cada cuadro; con la alerta en 1 y sin 0xD42B, antes p04:831B
	ld a,(0ca5fh)		;8000   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	dec a			;8003
	jr nz,L_800D		;8004
	ld a,(0d42bh)		;8006   ; lee la cuenta de la alerta 1 (16 bits; se ve / 8 en la ventana); a cero se acaba
	and a			;8009
	call z,fin_de_alerta		;800a   ; fin_de_alerta: si p06:B55A no da acarreo, la alerta a 0 y p04:94B2
L_800D:
	ld ix,0ce00h		;800d   ; desde 0xCE00
	ld b,018h		;8011   ; 24 fichas
L_8013:
	push bc			;8013
	ld a,(ix+000h)		;8014   ; lee el tipo del actor (0 = libre)
	ld b,a			;8017   ; B = el tipo
	and a			;8018
	jr z,L_8041		;8019   ; libre: el siguiente
	call se_ve_el_actor		;801b   ; B = si se ve (p04:8061)
	dec b			;801e   ; se ve: p04:8037
	jr z,L_8037		;801f
	dec b			;8021   ; se ve y con alerta: el siguiente
	jr z,L_8041		;8022
	ld a,(ix+000h)		;8024   ; lee el tipo del actor (0 = libre)
	cp 010h		;8027   ; los tipos por debajo de 0x10...
	jr nc,L_8030		;8029
	call espera_d443		;802b   ; ...con p04:804A...
	jr c,L_8041		;802e
L_8030:
	call a_p14_b842_guarda		;8030   ; p14:B842...
	ld b,a			;8033
	call ve_a_snake		;8034   ; ...y mira si ve a Snake (p04:83CF)
L_8037:
	call lo_del_actor		;8037   ; lo suyo (p04:810E)
	ld a,(ix+00ch)		;803a   ; con el byte 0x0C, p14:BA36
	and a			;803d
	call nz,llama_ba36_a		;803e   ; llama_ba36_a:
L_8041:
	ld de,00040h		;8041   ; el siguiente, 0x40 mas alla
	add ix,de		;8044
	pop bc			;8046
	djnz L_8013		;8047
	ret			;8049
espera_d443:		; con 0xD443 y el actor en esta sala: acarreo; al bajar a 0, p04:9D12
	ld hl,0d443h		;804a
	ld a,(hl)			;804d
	ld c,a			;804e
	and a			;804f
	ret z			;8050
	call en_esta_sala		;8051   ; en esta sala?
	jr nz,L_805F		;8054
	dec c			;8056
	jr nz,L_805D		;8057
	inc (hl)			;8059
	call aviso_07_30		;805a   ; aviso_07_30: en esta sala, el aviso 7 de 0x30
L_805D:
	scf			;805d
	ret			;805e
L_805F:
	or a			;805f
	ret			;8060
se_ve_el_actor:		; B = 0 si no se ve (p14:B9DC), 1 si se ve, 2 si se ve con alerta
	call se_ve_el_actor_si		;8061   ; se_ve_el_actor_si: p14:B9DC guardando HL, DE y BC
	ld b,000h		;8064
	ret nc			;8066
	inc b			;8067
	ld a,(0ca5fh)		;8068   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	and a			;806b
	ret z			;806c
	inc b			;806d
	ret			;806e
se_ve_el_actor_si:		; p14:B9DC guardando HL, DE y BC
	push hl			;806f
	push de			;8070
	push bc			;8071
	call a_p14_b9dc_guarda		;8072   ; a_p14_b9dc_guarda: p14:B9DC guardando el banco de 0xA000
	pop bc			;8075
	pop de			;8076
	pop hl			;8077
	ret			;8078
y_x_de_snake_en_hl:		; L = la Y, H = la X de Snake
	ld a,(0cb03h)		;8079   ; lee la Y de Snake
	ld l,a			;807c
	ld a,(0cb05h)		;807d   ; lee la X de Snake
	ld h,a			;8080
	ret			;8081
llama_ba36:		; p14:BA36 con el byte 0x0C del actor
	ld a,(ix+00ch)		;8082
llama_ba36_a:
	push bc			;8085
	call a_p14_ba36_guarda		;8086   ; a_p14_ba36_guarda: p14:BA36 guardando el banco de 0xA000
	pop bc			;8089
	ret			;808a
da_la_vuelta_al_actor:		; las dos velocidades del actor cambiadas de signo
	call vuelve_en_y		;808b   ; vuelve_en_y: la velocidad en Y cambiada de signo
vuelve_en_x:		; la velocidad en X cambiada de signo
	ld d,(ix+009h)		;808e   ; lee la velocidad del actor en X (alta)
	ld e,(ix+008h)		;8091   ; lee la velocidad del actor en X (baja)
	call 04442h		;8094   ; de_negativo: DE = -DE
pon_velocidad_x:		; la velocidad en X = DE
	ld (ix+009h),d		;8097   ; guarda la velocidad del actor en X (alta)
	ld (ix+008h),e		;809a   ; guarda la velocidad del actor en X (baja)
	ret			;809d
vuelve_en_y:		; la velocidad en Y cambiada de signo
	ld d,(ix+007h)		;809e   ; lee la velocidad del actor en Y (alta)
	ld e,(ix+006h)		;80a1   ; lee la velocidad del actor en Y (baja)
	call 04442h		;80a4   ; de_negativo: DE = -DE
pon_velocidad_y:		; la velocidad en Y = DE
	ld (ix+007h),d		;80a7   ; guarda la velocidad del actor en Y (alta)
	ld (ix+006h),e		;80aa   ; guarda la velocidad del actor en Y (baja)
	ret			;80ad
a_p14_ba36_guarda:		; p14:BA36 guardando el banco de 0xA000
	ld bc,(0c383h)		;80ae   ; lee la copia del banco de 0xA000 y el byte siguiente (16 bits)
	push bc			;80b2
	call 041efh		;80b3   ; bancos_14: pone el 14 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0ba36h		;80b6   ; mueve_por_a: por los bits de A: el 0 la Y (bytes 2-3) + la velocidad en Y (6-7); el 1 la X (4-5) + la de X (8-9)
	jr vuelve_banco_a000		;80b9
a_p14_b9dc_guarda:		; p14:B9DC guardando el banco de 0xA000
	ld bc,(0c383h)		;80bb   ; lee la copia del banco de 0xA000 y el byte siguiente (16 bits)
	push bc			;80bf
	call 041efh		;80c0   ; bancos_14: pone el 14 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b9dch		;80c3   ; se_ve_el_actor: acarreo si el actor IX no es de aqui: su byte 0x1B ha de ser 1 en una sala especial, 2 en un sitio de 0xCBE0, 3 con 0xCA77 y 0 si no; el 9 en las especiales (salvo la 0x18), nunca
	jr vuelve_banco_a000		;80c6
a_p14_b842_guarda:		; p14:B842 guardando el banco de 0xA000
	ld bc,(0c383h)		;80c8   ; lee la copia del banco de 0xA000 y el byte siguiente (16 bits)
	push bc			;80cc
	call 041efh		;80cd   ; bancos_14: pone el 14 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b842h		;80d0   ; vista_del_actor: A = el byte del dibujo del actor IX en su tabla: el 0x15 p14:B88B, el 0x0B p14:B87E, el 0x0A p14:B885, los otros p14:B86E; el 0x10, 0xFF
	jr vuelve_banco_a000		;80d3
a_p14_b931_guarda:		; p14:B931 guardando el banco de 0xA000
	ld bc,(0c383h)		;80d5   ; lee la copia del banco de 0xA000 y el byte siguiente (16 bits)
	push bc			;80d9
	call 041efh		;80da   ; bancos_14: pone el 14 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b931h		;80dd   ; actor_toca_d500: con la alerta y el actor IX antes de 0xD300: acarreo si alguna ficha de 0xD500 activa en el paso 2 lo toca (p14:B967 por su tipo)
vuelve_banco_a000:		; el banco de 0xA000 de antes, con AF a salvo
	pop bc			;80e0
	push af			;80e1
	ld a,c			;80e2
	jp 041a3h		;80e3
a_p14_b88f_guarda:		; p14:B88F guardando el banco de 0xA000
	ld bc,(0c383h)		;80e6   ; lee la copia del banco de 0xA000 y el byte siguiente (16 bits)
	push bc			;80ea
	call 041efh		;80eb   ; bancos_14: pone el 14 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b88fh		;80ee   ; actor_cambia_de_sala: el actor IX que sale por un borde pasa a la sala de al lado (fila o columna) por el otro (el 0x14 de 2 a 0xC0 en Y y de 0 a 0xC0 en X; los otros de 0x10 a 0xC0 y de 9 a 0xB9); luego sus sprites libres (NZ) o, sin ellos, pintado si esta en esta sala
	jr vuelve_banco_a000		;80f1
a_p14_ba17_guarda:		; p14:BA17 guardando el banco de 0xA000
	ld bc,(0c383h)		;80f3   ; lee la copia del banco de 0xA000 y el byte siguiente (16 bits)
	push bc			;80f7
	call 041efh		;80f8   ; bancos_14: pone el 14 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0ba17h		;80fb   ; suelta_lista_de_sprites: cada sprite de la lista DE (hasta 0 o 18): fuera en 0xDC28, libre en 0xD400 y a 0 en la lista
	jr vuelve_banco_a000		;80fe
en_esta_sala:		; Z si el actor esta en la sala de ahora (fila y columna)
	ld a,(0ca50h)		;8100   ; lee la fila de la sala en la zona (uno mas al salir por arriba)
	cp (ix+00ah)		;8103   ; compara con la fila de la sala del actor
	ret nz			;8106
en_esta_columna:		; Z si el actor esta en la columna de ahora
	ld a,(0ca51h)		;8107   ; lee la columna de la sala en la zona (uno mas al salir por la derecha)
	cp (ix+00bh)		;810a   ; compara con la columna de la sala del actor
	ret			;810d
lo_del_actor:		; con la alerta, solo los que se ven
	ld a,(0ca5fh)		;810e   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	ld b,a			;8111
	and a			;8112
	jr z,L_8119		;8113
	call se_ve_el_actor_si		;8115   ; se_ve_el_actor_si: p14:B9DC guardando HL, DE y BC
	ret c			;8118
L_8119:
	ld a,(ix+000h)		;8119   ; C = el tipo
	ld c,a			;811c
	cp 010h		;811d   ; desde 0x10, siempre
	jr nc,L_8137		;811f
	ld a,b			;8121   ; sin alerta, siempre
	and a			;8122
	jr z,L_8137		;8123
	call en_esta_sala		;8125   ; con alerta y fuera de esta sala (salvo el 0x0A): parado
	jr z,L_8137		;8128
	ld a,c			;812a
	cp 00ah		;812b
	jr z,L_8137		;812d
	xor a			;812f
	ld (ix+00ch),a		;8130
	ld (ix+001h),a		;8133   ; guarda el paso del actor
	ret			;8136
L_8137:
	ld a,c			;8137   ; sin el bit 7
	and 07fh		;8138
	ld c,a			;813a
	call banco_del_tipo		;813b   ; el banco de su tipo (p04:8148)
	ld a,c			;813e   ; por su tipo (p04:815B)
	ld hl,l8159h		;813f
	call 0424eh		;8142   ; salta_por_tabla: salta a la palabra A de la tabla de HL
L_8145:
	jp 04142h		;8145   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
banco_del_tipo:		; el 3 y desde el 0x0A, el banco 8; los demas, el 5
	cp 003h		;8148
	jp z,041bdh		;814a   ; bancos_8: pone el 8 en 0xA000 (con su copia en 0xC381-0xC383)
	cp 00ah		;814d
	jp nc,041bdh		;814f   ; bancos_8: pone el 8 en 0xA000 (con su copia en 0xC381-0xC383)
	ret			;8152
pinta_actor:		; sus sprites (p04:81C5) con el banco 8
	call 041bdh		;8153   ; bancos_8: pone el 8 en 0xA000 (con su copia en 0xC381-0xC383)
	call sprites_del_actor		;8156   ; sprites_del_actor: sus sprites libres (p04:820A) y sus colores de p08:B9FB (p08:BA2F para el 1 con 0xD437)
L_8159:
	jr L_8145		;8159

; ----------------------------------------------------------------------
; DATOS punteros_815B: la rutina de cada tipo de actor (1-0x18) que lee
;   lo_del_actor (p04:813F: HL = 0x8159 + el tipo * 2): p04:9D39 los 1, 2 y
;   4-9; p08:A1F2 el 3; p08:AF0B el 0x0A, A000 el 0x0B, A1D6 el 0x0C;
;   0x0D-0x0F ninguna; p08:AA3B los 0x10-0x11, A8D0 el 0x12, AFEC el 0x13,
;   AC2A el 0x14, AD43 el 0x15, A401 los 0x16-0x17, ABE5 el 0x18 (el banco,
;   banco_del_tipo p04:8148)
;   0x815b..0x818b  (48 bytes)
DATA_punteros_815B:
	defb 039h,09dh,039h,09dh,0f2h,0a1h,039h,09dh,039h,09dh,039h,09dh,039h,09dh,039h,09dh	; 815b  9.9...9.9.9.9.9.
	defb 039h,09dh,00bh,0afh,000h,0a0h,0d6h,0a1h,000h,000h,000h,000h,000h,000h,03bh,0aah	; 816b  9...............
	defb 03bh,0aah,0d0h,0a8h,0ech,0afh,02ah,0ach,043h,0adh,001h,0a4h,001h,0a4h,0e5h,0abh	; 817b  ......*.C.......

; ======================================================================
; CODIGO 0x818b..0x84ed  (866 bytes)
; ======================================================================


pinta_actores:		; los actores de esta sala (salvo el 0x0A): sus sprites; el 0x15 en el paso 3, p14:B34F
	ld ix,0ce00h		;818b   ; apunta a los actores: 24 fichas de 0x40 bytes (p04:800D)
	ld b,018h		;818f
L_8191:
	push bc			;8191   ; el tipo
	ld a,(ix+000h)		;8192   ; lee el tipo del actor (0 = libre)
	ld c,a			;8195
	and a			;8196   ; libre...
	jr z,L_81B6		;8197
	cp 00ah		;8199   ; ...o el 0x0A: el siguiente
	jr z,L_81B6		;819b
	call en_esta_sala		;819d   ; en esta sala?
	jr nz,L_81B6		;81a0
	ld a,c			;81a2   ; el 0x15 en el paso 3...
	cp 015h		;81a3
	jr nz,L_81B3		;81a5
	ld a,(ix+001h)		;81a7   ; lee el paso del actor
	cp 003h		;81aa
	jr nz,L_81B3		;81ac
	call a_p14_b34f_guarda		;81ae   ; ...p14:B34F
	jr L_81B6		;81b1
L_81B3:
	call pinta_actor		;81b3   ; los demas, sus sprites
L_81B6:
	ld bc,00040h		;81b6
	add ix,bc		;81b9
	pop bc			;81bb
	djnz L_8191		;81bc
	ret			;81be
pinta_actor_bancos_14:
	call pinta_actor		;81bf   ; pinta_actor: sus sprites (p04:81C5) con el banco 8
	jp 041efh		;81c2   ; bancos_14: pone el 14 en 0xA000 (con su copia en 0xC381-0xC383)
sprites_del_actor:		; sus sprites libres (p04:820A) y sus colores de p08:B9FB (p08:BA2F para el 1 con 0xD437)
	call reparte_sprites		;81c5   ; reparte_sprites: la lista del actor (bytes 0x2E-0x3F) a cero y C sprites libres de los 22 de 0xD400
	ld a,(ix+000h)		;81c8   ; lee el tipo del actor (0 = libre)
	ld c,a			;81cb
	ld hl,0b9fbh		;81cc
	call 043f6h		;81cf   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld a,c			;81d2
	cp 001h		;81d3
	jr nz,L_81E0		;81d5
	ld a,(0d437h)		;81d7
	and a			;81da
	jr z,L_81E0		;81db
	ld hl,0ba2fh		;81dd
L_81E0:
	call lista_de_sprites		;81e0   ; DE = su lista de sprites (byte 0x2E)
	ex de,hl			;81e3
	ld b,012h		;81e4   ; hasta 18
L_81E6:
	ld a,(hl)			;81e6   ; el sprite; 0 acaba
	and a			;81e7   ; 0: se acabo
	ret z			;81e8
	push hl			;81e9
	push de			;81ea
	push bc			;81eb
	ld h,000h		;81ec   ; su sitio en los colores: 0xDAA0 + (n - 1) * 16
	dec a			;81ee   ; el sprite - 1...
	ld l,a			;81ef
	add hl,hl			;81f0   ; ...* 16...
	add hl,hl			;81f1
	add hl,hl			;81f2
	add hl,hl			;81f3
	ld bc,0daa0h		;81f4   ; ...en la copia de colores
	add hl,bc			;81f7
	ex de,hl			;81f8   ; DE = la palabra de los colores
	ld a,(hl)			;81f9   ; las rachas de los colores
	inc hl			;81fa
	ld h,(hl)			;81fb
	ld l,a			;81fc
	ex de,hl			;81fd
	call 051e0h		;81fe   ; a la copia de la tabla de colores
	pop bc			;8201
	pop de			;8202
	pop hl			;8203
	inc hl			;8204   ; el siguiente
	inc de			;8205   ; el siguiente sprite y sus colores
	inc de			;8206
	djnz L_81E6		;8207
	ret			;8209
reparte_sprites:		; la lista del actor (bytes 0x2E-0x3F) a cero y C sprites libres de los 22 de 0xD400
	call lista_de_sprites		;820a   ; lista_de_sprites: DE = IX + 0x2E: la lista de sprites del actor
	ex de,hl			;820d
	push hl			;820e
	ld bc,00011h		;820f
	call 04236h		;8212   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	pop de			;8215
	call sprites_que_pide		;8216   ; C = cuantos (p04:825D)
	ld a,c			;8219
	ex af,af'			;821a
	ld hl,0d400h		;821b   ; los 22 sprites de 0xD400
	ld bc,01600h		;821e
L_8221:
	ld a,(hl)			;8221   ; libre?
	and a			;8222
	jr nz,L_823D		;8223
	ld a,c			;8225   ; con C impar...
	rra			;8226
	jr c,L_822D		;8227
	ld a,l			;8229   ; ...solo los de numero impar
	rra			;822a
	jr c,L_823D		;822b
L_822D:
	ld (hl),001h		;822d   ; lo ocupa...
	ld a,b			;822f   ; ...y apunta su numero (1-22)
	sub 016h		;8230
	neg		;8232
	inc a			;8234
	ld (de),a			;8235
	inc e			;8236
	inc c			;8237
	ex af,af'			;8238
	cp c			;8239   ; ya tiene los que pide
	jr z,L_8240		;823a
	ex af,af'			;823c
L_823D:
	inc hl			;823d
	djnz L_8221		;823e
L_8240:
	ld a,(ix+000h)		;8240   ; el 0x0B, uno mas
	cp 00bh		;8243
	ret nz			;8245
	ld hl,0d400h		;8246   ; apunta a los 22 sprites que se reparten los actores (1 = ocupado)
	ld b,016h		;8249
L_824B:
	ld a,(hl)			;824b   ; el sprite libre?
	and a			;824c
	jr nz,L_8259		;824d
	ld (hl),001h		;824f   ; ocupado...
	ld a,b			;8251   ; ...y su numero (1-22)...
	sub 016h		;8252
	neg		;8254
	inc a			;8256
	ld (de),a			;8257   ; ...a la lista
	ret			;8258
L_8259:
	inc hl			;8259
	djnz L_824B		;825a
	ret			;825c
sprites_que_pide:		; C = cuantos sprites pide el actor: 4 por debajo del 0x10, 1 el 0x17, 0x12 el 0x14, 2 los demas
	ld a,(ix+000h)		;825d   ; lee el tipo del actor (0 = libre)
	and 07fh		;8260   ; sin el bit 7
	ld c,004h		;8262   ; 4 por debajo del 0x10
	cp 010h		;8264
	ret c			;8266
	ld c,001h		;8267   ; 1 el 0x17
	cp 017h		;8269
	ret z			;826b
	inc c			;826c   ; 2 los demas...
	cp 014h		;826d
	ret nz			;826f
	ld c,012h		;8270   ; ...y 0x12 el 0x14
	ret			;8272
lista_de_sprites:		; DE = IX + 0x2E: la lista de sprites del actor
	push ix		;8273
	pop de			;8275
	ld a,02eh		;8276
	jp 04243h		;8278   ; suma_a_de: DE = DE + A
mira_salir_de_la_sala:		; en la zona 4 sala 9, o con alerta: los actores que salen de la sala
	ld a,(0ca4ah)		;827b   ; lee la zona
	cp 004h		;827e
	jr nz,L_8289		;8280
	ld a,(0ca4bh)		;8282   ; lee la sala de la zona
	cp 009h		;8285
	jr z,L_828E		;8287
L_8289:
	ld a,(0ca5fh)		;8289   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	and a			;828c
	ret z			;828d
L_828E:
	ld ix,0ce00h		;828e   ; apunta a los actores: 24 fichas de 0x40 bytes (p04:800D)
	ld b,018h		;8292
L_8294:
	push bc			;8294
	ld a,(ix+000h)		;8295   ; el tipo...
	ld b,a			;8298
	and a			;8299
	jr z,L_82DF		;829a
	rla			;829c   ; ...con el bit 7 o el 0x0B, no
	jr c,L_82DF		;829d
	ld a,b			;829f
	cp 00bh		;82a0
	jr z,L_82DF		;82a2
	ld a,(ix+01bh)		;82a4   ; el limite de la Y: 0xAF (0xA7 con el byte 0x1B = 2)
	cp 002h		;82a7
	ld c,0afh		;82a9
	jr nz,L_82AF		;82ab
	ld c,0a7h		;82ad
L_82AF:
	ld a,(ix+003h)		;82af   ; la Y - 0x10 dentro...
	sub 010h		;82b2
	cp c			;82b4
	jr nc,L_82C5		;82b5
	ld a,(ix+005h)		;82b7   ; ...y la X - 8 dentro...
	sub 008h		;82ba
	cp 0b5h		;82bc
	jr nc,L_82C5		;82be
	call a_p14_b931_guarda		;82c0   ; ...p14:B931
	jr nc,L_82DF		;82c3
L_82C5:
	ld a,(0ca5fh)		;82c5   ; fuera, con alerta (salvo el 0x0A y el 0x15): se va
	and a			;82c8
	jr z,L_82DF		;82c9
	ld a,(ix+000h)		;82cb   ; lee el tipo del actor (0 = libre)
	cp 00ah		;82ce
	jr z,L_82DF		;82d0
	cp 015h		;82d2
	jr z,L_82DF		;82d4
	call fin_de_alerta_si		;82d6   ; fin_de_alerta_si: los actores desde 0xD300: nada
	call lista_de_sprites		;82d9   ; lista_de_sprites: DE = IX + 0x2E: la lista de sprites del actor
	call quita_actor_d426		;82dc   ; quita_actor_d426: 0xD426 uno menos y fuera
L_82DF:
	ld bc,00040h		;82df
	add ix,bc		;82e2
	pop bc			;82e4
	ld a,e			;82e5   ; E: la lista de sprites del siguiente
	add a,008h		;82e6
	ld e,a			;82e8
	djnz L_8294		;82e9
	ld a,(0ca5fh)		;82eb   ; con la alerta 3 y fuera de las especiales, p04:929A y p04:924C
	cp 003h		;82ee
	ret c			;82f0
	ld a,(0ca76h)		;82f1   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	and a			;82f4
	ret nz			;82f5
	call a_p06_b55a_guarda		;82f6   ; a_p06_b55a_guarda: p06:B55A guardando el banco de 0xA000 (y su acarreo)
	ret c			;82f9
	jp acaba_la_alerta		;82fa   ; acaba_la_alerta: los actores de otras salas fuera, la alerta a 0 y p04:94B2
fin_de_alerta_si:		; los actores desde 0xD300: nada
	push ix		;82fd
	pop hl			;82ff
	ld de,0d300h		;8300   ; apunta a las 4 fichas de actor de los que llegan con la alerta (los actores 20-23)
	call 00020h		;8303   ; BIOS DCOMPR - Compares HL with DE
	ret c			;8306
	ld a,(0ca5fh)		;8307   ; con la alerta en 1...
	dec a			;830a
	ret nz			;830b
	ld a,(0d42bh)		;830c   ; ...y con 0xD42B, la espera de 0xD41F
	and a			;830f
	jr z,fin_de_alerta		;8310
	ld hl,0d41fh		;8312
	ld a,(hl)			;8315
	and a			;8316
	jr z,fin_de_alerta		;8317
	dec (hl)			;8319
	ret nz			;831a
fin_de_alerta:		; si p06:B55A no da acarreo, la alerta a 0 y p04:94B2
	call a_p06_b55a_guarda		;831b   ; a_p06_b55a_guarda: p06:B55A guardando el banco de 0xA000 (y su acarreo)
	ret c			;831e
	xor a			;831f
	ld (0ca5fh),a		;8320   ; guarda la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	jp actores_como_antes		;8323   ; actores_como_antes: los actores como antes y, sin 0xC697, la musica de la zona con la orden 0xF4
cae_el_actor:		; el sonido 0x0F, fuera (p04:834C) y p04:92F4; el tipo 3 ademas quita 0xD430
	ld a,(ix+000h)		;8326   ; lee el tipo del actor (0 = libre)
	push af			;8329
	call 06a2dh		;832a   ; sonido_0f: pide el sonido 0x0F
	call quita_actor		;832d   ; quita_actor: sus sprites libres y fuera; el 0x13 apunta en 0xD4F8, el 0x0B con alerta 0xCA67 = 0
	call tras_la_caida		;8330   ; tras_la_caida: con menos de 4 que siguen y p04:96BA sin acarreo: con la alerta 2 cuenta (p04:930D), con 3 se acaba (p04:9306)
	pop af			;8333
	cp 003h		;8334
	ret nz			;8336
	ld hl,0d430h		;8337
	ld a,(hl)			;833a
	cp 002h		;833b
	ret nc			;833d
	xor a			;833e
	ld (hl),a			;833f
	ld (0d431h),a		;8340
	ld a,(ix+019h)		;8343
	cp 005h		;8346
	ret z			;8348
	jp 07a12h		;8349   ; p01:7A12
quita_actor:		; sus sprites libres y fuera; el 0x13 apunta en 0xD4F8, el 0x0B con alerta 0xCA67 = 0
	call lista_de_sprites		;834c   ; lista_de_sprites: DE = IX + 0x2E: la lista de sprites del actor
	ld a,(ix+000h)		;834f   ; lee el tipo del actor (0 = libre)
	push af			;8352
	call quita_actor_si		;8353   ; quita_actor_si:
	pop af			;8356
	cp 013h		;8357
	jr z,L_836A		;8359
	cp 00bh		;835b
	ret nz			;835d
	ld a,(0ca5fh)		;835e   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	and a			;8361
	ret z			;8362
	xor a			;8363
	ld (0ca67h),a		;8364
	jp 04f65h		;8367   ; sprites_6517_6113:
L_836A:
	push ix		;836a   ; el numero del actor desde 0xD200...
	pop hl			;836c
	ld de,0d200h		;836d
	or a			;8370
	sbc hl,de		;8371
	ld b,006h		;8373
L_8375:
	srl h		;8375   ; ...entre 64...
	rr l		;8377
	djnz L_8375		;8379
	ld a,l			;837b
	and 007h		;837c
	ld hl,0d4f8h		;837e   ; ...su bandera en 0xD4F8
	call 0423eh		;8381   ; suma_a_hl: HL = HL + A
	ld (hl),001h		;8384
	ret			;8386
quita_actor_d426:		; 0xD426 uno menos y fuera
	ld hl,0d426h		;8387   ; apunta a cuantos actores hay de los que llegan
	ld a,(hl)			;838a
	and a			;838b
	jr z,quita_actor_si		;838c
	dec (hl)			;838e
quita_actor_si:
	push de			;838f
	push bc			;8390
	ld a,(ix+000h)		;8391   ; el 0x0A, ademas, p04:83B5
	cp 00ah		;8394
	push de			;8396
	call z,el_0a_se_va		;8397   ; el_0a_se_va: en esta sala: el dibujo 5 y p08:AEBF
	pop de			;839a
	ld (ix+000h),000h		;839b   ; libre
	ld hl,0d416h		;839f   ; 0xD416 uno menos
	ld a,(hl)			;83a2
	and a			;83a3
	jr z,L_83A7		;83a4
	dec (hl)			;83a6
L_83A7:
	call a_p14_ba17_guarda		;83a7   ; p14:BA17
	pop bc			;83aa
	pop de			;83ab
	ld a,(ix+000h)		;83ac   ; el 3, p01:7A12
	cp 003h		;83af
	ret nz			;83b1
	jp 07a12h		;83b2   ; p01:7A12
el_0a_se_va:		; en esta sala: el dibujo 5 y p08:AEBF
	call en_esta_sala		;83b5   ; en_esta_sala: Z si el actor esta en la sala de ahora (fila y columna)
	ret nz			;83b8
	ld (ix+00dh),005h		;83b9   ; el dibujo del actor (bit 0: el paso) = 0x05
	ld a,(0c383h)		;83bd   ; lee la copia del banco de 0xA000
	push af			;83c0
	call 041bdh		;83c1   ; bancos_8: pone el 8 en 0xA000 (con su copia en 0xC381-0xC383)
	ld de,00001h		;83c4
	call 0aebfh		;83c7   ; pinta_0a_si:
	pop af			;83ca
	push af			;83cb
	jp 041a3h		;83cc
ve_a_snake:		; con lo lanzado 8, p04:8630
	push bc			;83cf
	ld a,(0cb80h)		;83d0   ; lee las 6 fichas de 16 bytes de lo que lanza Snake ([tipo][..][Y 8.8][X 8.8][velocidades]...)
	cp 008h		;83d3
	call z,ve_lo_lanzado		;83d5   ; ve_lo_lanzado: con lo lanzado 8, sin 0xD44F y sin alerta: el actor que lo tiene delante y lo ve, 0xD44F = 1 y p04:9CFE
	pop bc			;83d8
	ld a,(0ca3ch)		;83d9   ; con 0xCA3C, no ve
	and a			;83dc
	ret nz			;83dd
	ld a,b			;83de   ; B = 0xFF: no
	inc a			;83df
	ret z			;83e0
	ld a,(ix+000h)		;83e1   ; el tipo...
	and 07fh		;83e4
	cp 015h		;83e6   ; ...el 0x15 salvo en el paso 3...
	jr z,L_83F8		;83e8
	cp 010h		;83ea   ; ...desde 0x10 no ven...
	ret nc			;83ec
	cp 003h		;83ed   ; ...el 3 solo con la rapidez 0
	jr nz,L_83FE		;83ef
	ld a,(ix+019h)		;83f1
	and a			;83f4
	ret nz			;83f5
	jr L_83FE		;83f6
L_83F8:
	ld a,(ix+001h)		;83f8   ; lee el paso del actor
	cp 003h		;83fb
	ret z			;83fd
L_83FE:
	ld a,(0ca41h)		;83fe   ; saliendo de la sala, no
	and a			;8401
	ret nz			;8402
	ld a,(0ca5fh)		;8403   ; con la alerta en 2 o mas, no
	cp 002h		;8406
	ret nc			;8408
	ld a,(0ca65h)		;8409   ; en el sitio 0x0D si; en otro, solo con la alerta en 1
	cp 00dh		;840c
	jr z,L_841D		;840e
	and a			;8410
	jr z,L_8418		;8411
	ld a,(0ca5fh)		;8413   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	dec a			;8416
	ret nz			;8417
L_8418:
	ld a,(0cb32h)		;8418   ; con 0xCB32, no
	and a			;841b
	ret nz			;841c
L_841D:
	call en_esta_sala		;841d   ; solo en esta sala
	ret nz			;8420
	xor a			;8421   ; 0xD450 = 0: mira a Snake
	ld (0d450h),a		;8422   ; guarda 1: la linea de vista va a lo lanzado y no a Snake
	ld a,(ix+000h)		;8425   ; el 0x15: p04:84B2
	and 07fh		;8428
	cp 015h		;842a
	jp z,ve_el_15		;842c   ; ve_el_15: el 0x15 en los pasos 0-2: la linea de la direccion B (p04:84ED) desde el
	ld a,(ix+001h)		;842f   ; en el paso 8, no
	cp 008h		;8432
	ret z			;8434
	call lo_tiene_delante		;8435   ; lo tiene delante? (p04:84A4)
	ret c			;8438
	ld a,(0ca5fh)		;8439   ; sin alerta, p04:96BA
	cp 002h		;843c
	jr nc,L_8455		;843e
	call sin_llegadas		;8440   ; sin_llegadas: acarreo en las zonas sin llegadas: la 0x10, la 0x0C salas 0-3, la 0x0D sala 0
	jr c,L_8455		;8443
	ld a,(0cb21h)		;8445   ; con 0xCB21 = 0x0A, p04:845B
	cp 00ah		;8448
	jr z,L_845B		;844a
	cp 00bh		;844c   ; con 0x0B, solo si Snake no se choca
	jr nz,L_8455		;844e
L_8450:
	ld a,(0cb0fh)		;8450   ; lee 1 si Snake ha chocado en este cuadro
	and a			;8453
	ret nz			;8454
L_8455:
	call a_p12_758d		;8455   ; le ha visto: p12:758D y la alerta (p04:9949)
	jp alguien_ve_a_snake		;8458   ; alguien_ve_a_snake: p14:B128: la alerta (la musica 0x8C y 0xCA5F)
L_845B:
	ld a,(ix+000h)		;845b   ; con 0xCB21 = 0x0A: los de tipo menor de 0x0A...
	cp 00ah		;845e
	jr nc,L_8450		;8460
	ld a,(ix+001h)		;8462   ; ...salvo en los pasos 0x25-0x26...
	sub 025h		;8465
	cp 002h		;8467
	jr c,L_8450		;8469
	ld a,(0cb03h)		;846b   ; ...a menos de 0x30 en Y...
	sub (ix+003h)		;846e   ; le resta la Y del actor
	jr nc,L_8475		;8471
	neg		;8473
L_8475:
	cp 030h		;8475
	jr nc,L_8450		;8477
	ld a,(0cb05h)		;8479   ; ...y en X...
	sub (ix+005h)		;847c   ; le resta la X del actor
	jr nc,L_8483		;847f
	neg		;8481
L_8483:
	cp 030h		;8483
	jr nc,L_8450		;8485
	ld hl,0d42eh		;8487   ; ...la primera vez (0xD42E)...
	ld a,(hl)			;848a
	and a			;848b
	ret nz			;848c
	ld (hl),001h		;848d
	ld a,(ix+00ch)		;848f   ; ...guardan el byte 0x0C y el paso (0x22, 0x20) y pasan al 0x25
	ld (ix+022h),a		;8492
	ld (ix+00ch),000h		;8495
	ld a,(ix+001h)		;8499   ; lee el paso del actor
	ld (ix+020h),a		;849c
	ld (ix+001h),025h		;849f   ; el paso del actor = 0x25
	ret			;84a3
lo_tiene_delante:		; acarreo si Snake no esta en la direccion B del actor; si esta, mira si le ve (p04:8518)
	xor a			;84a4
	ld (0d450h),a		;84a5   ; guarda 1: la linea de vista va a lo lanzado y no a Snake
	push bc			;84a8
	call direccion_hacia_snake		;84a9   ; direccion_hacia_snake: Z si la direccion de 8 hacia Snake (p04:84FC) es la B
	pop bc			;84ac
	jp z,le_ve		;84ad   ; le_ve: acarreo si la linea del actor a Snake da con algo solido antes de llegar
	scf			;84b0
	ret			;84b1
ve_el_15:		; el 0x15 en los pasos 0-2: la linea de la direccion B (p04:84ED) desde el
	ld a,(ix+001h)		;84b2   ; lee el paso del actor
	cp 003h		;84b5   ; desde el paso 3, no
	ret nc			;84b7
	ld a,b			;84b8   ; la direccion B...
	ld hl,084edh		;84b9   ; ...su paso en p04:84ED
	call 043f6h		;84bc   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld a,l			;84bf
	exx			;84c0
	ld d,a			;84c1   ; D = el paso en Y
	ld e,000h		;84c2
	ld a,(ix+003h)		;84c4   ; lee la Y del actor
	sub 008h		;84c7   ; la Y del actor - 8
	ld h,a			;84c9
	ld l,(ix+002h)		;84ca   ; lee la Y del actor (fraccion)
	exx			;84cd
	ld d,h			;84ce   ; el paso en X
	ld e,000h		;84cf
	ld h,(ix+005h)		;84d1   ; lee la X del actor
	ld l,(ix+004h)		;84d4   ; lee la X del actor (fraccion)
	call recorre_la_linea		;84d7   ; recorre_la_linea: 0xD8BD = 0: cuenta los pasos
	ret c			;84da   ; algo de por medio: nada
	ld a,(0cb21h)		;84db   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	sub 00ah		;84de   ; con 0xCB21 = 0x0A u 0x0B...
	cp 002h		;84e0
	jp nc,alguien_ve_a_snake		;84e2   ; alguien_ve_a_snake: p14:B128: la alerta (la musica 0x8C y 0xCA5F)
	ld a,(0cb0fh)		;84e5   ; lee 1 si Snake ha chocado en este cuadro
	and a			;84e8   ; ...solo si Snake no se choca
	ret nz			;84e9
	jp alguien_ve_a_snake		;84ea   ; alguien_ve_a_snake: p14:B128: la alerta (la musica 0x8C y 0xCA5F)

; ----------------------------------------------------------------------
; DATOS resto_84ED: lo apuntan con el banco puesto p04:84B9 (0x84ED); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p04:84B9 (8 bytes)
;   0x84ed..0x84f5  (8 bytes)
DATA_resto_84ED:
	defb 0f8h,000h,008h,000h,000h,0f8h,000h,008h	; 84ed  ........

; ======================================================================
; CODIGO 0x84f5..0x8691  (412 bytes)
; ======================================================================


direccion_hacia_snake:		; Z si la direccion de 8 hacia Snake (p04:84FC) es la B
	push bc			;84f5
	call direccion_a_snake		;84f6   ; direccion_a_snake: A = la direccion de 8 (0-7) del actor a Snake
	pop bc			;84f9
	cp b			;84fa
	ret			;84fb
direccion_a_snake:		; A = la direccion de 8 (0-7) del actor a Snake
	call y_x_de_snake_en_hl		;84fc   ; y_x_de_snake_en_hl: L = la Y, H = la X de Snake
direccion_a_hl:		; A = la direccion de 8 del actor a (H, L)
	ld d,(ix+005h)		;84ff   ; lee la X del actor
	ld e,(ix+003h)		;8502   ; lee la Y del actor
	call 079d1h		;8505   ; a_p02_86c3: angulo_hacia (p02:86C3) con el banco 2
en_ocho:		; el angulo de 0xCA5D en 8 trozos de 0x20 (centrados)
	ld a,(0ca5dh)		;8508   ; lee el angulo hacia el destino entero (0-0xFF)
	add a,010h		;850b
	ld c,000h		;850d
L_850F:
	sub 020h		;850f
	jr c,L_8516		;8511
	inc c			;8513
	jr L_850F		;8514
L_8516:
	ld a,c			;8516
	ret			;8517
le_ve:		; acarreo si la linea del actor a Snake da con algo solido antes de llegar
	call y_x_de_snake_en_hl		;8518   ; y_x_de_snake_en_hl: L = la Y, H = la X de Snake
	ex de,hl			;851b
le_ve_a:		; la linea del actor a (D, E): las diferencias...
	ld b,000h		;851c
	ld a,e			;851e
	sub (ix+003h)		;851f   ; le resta la Y del actor
	jr nc,L_8528		;8522
	neg		;8524
	set 0,b		;8526   ; ...el signo de la Y en el bit 0 de B
L_8528:
	ld h,a			;8528
	ld l,000h		;8529
	ld a,d			;852b
	sub (ix+005h)		;852c   ; le resta la X del actor
	jr nc,L_8535		;852f
	neg		;8531
	set 1,b		;8533   ; ...el de la X en el bit 1
L_8535:
	ld d,a			;8535
	ld e,000h		;8536
	call 00020h		;8538   ; BIOS DCOMPR - Compares HL with DE | la mayor...
	ld c,000h		;853b
	jr nc,L_8542		;853d
	ld c,001h		;853f
	ex de,hl			;8541
L_8542:
	srl h		;8542   ; ...las dos a la mitad hasta que la mayor baje de 8: el paso
	rr l		;8544   ; las dos diferencias a la mitad...
	srl d		;8546
	rr e		;8548
	ld a,h			;854a   ; ...hasta que la mayor baje de 8
	cp 008h		;854b
	jr nc,L_8542		;854d
	ld a,c			;854f   ; en su sitio otra vez
	and a			;8550
	jr z,L_8554		;8551
	ex de,hl			;8553
L_8554:
	rr b		;8554   ; con sus signos
	call c,0443ah		;8556   ; hl_negativo: HL = -HL (PR2 p00:5BBD)
	rr b		;8559
	call c,04442h		;855b   ; de_negativo: DE = -DE
	push hl			;855e
	exx			;855f
	pop de			;8560
	ld a,(ix+003h)		;8561   ; desde el actor, 0x10 mas arriba
	sub 010h		;8564
	ld h,a			;8566
	ld l,(ix+002h)		;8567   ; lee la Y del actor (fraccion)
	exx			;856a
	ld h,(ix+005h)		;856b   ; lee la X del actor
	ld l,(ix+004h)		;856e   ; lee la X del actor (fraccion)
recorre_la_linea:		; 0xD8BD = 0: cuenta los pasos
	xor a			;8571
	ld (0d8bdh),a		;8572
L_8575:
	ld c,000h		;8575   ; un paso en X...
	add hl,de			;8577   ; la X + el paso
	ld a,h			;8578
	cp 0c0h		;8579   ; ...fuera de la sala: acarreo
	ccf			;857b   ; fuera: acarreo
	ret c			;857c
	exx			;857d
	ld c,000h		;857e   ; ...y en Y
	add hl,de			;8580   ; la Y + el paso
	ld a,h			;8581
	cp 0c0h		;8582   ; fuera: acarreo
	ccf			;8584
	ret c			;8585
	exx			;8586
	push hl			;8587
	ld l,a			;8588
	ld (0d8bbh),hl		;8589   ; el punto, a 0xD8BB
	exx			;858c
	ld a,d			;858d
	exx			;858e
	rla			;858f   ; el signo del paso en Y
	ld b,003h		;8590   ; 3 puntos de 8 en 8 hacia abajo (1 si va de lado)
	ld a,(0ca5dh)		;8592   ; lee el angulo hacia el destino entero (0-0xFF)
	sub 008h		;8595   ; el angulo cerca de lo vertical...
	and 01fh		;8597
	cp 010h		;8599
	jr nc,L_859F		;859b
	ld b,001h		;859d   ; ...1 punto; si no, 3
L_859F:
	call solido_en_la_linea		;859f   ; solido? acarreo
	pop hl			;85a2
	ret c			;85a3
	push hl			;85a4
	ld hl,(0d8bbh)		;85a5   ; llega a Snake (p04:85B4)?
	call llega_a_snake		;85a8   ; llega_a_snake: con 0xD450, a lo lanzado (p04:85CE)
	ld hl,0d8bdh		;85ab   ; un paso mas
	inc (hl)			;85ae
	pop hl			;85af
	jr nc,L_8575		;85b0
	or a			;85b2
	ret			;85b3
llega_a_snake:		; con 0xD450, a lo lanzado (p04:85CE)
	ld a,(0d450h)		;85b4   ; lee 1: la linea de vista va a lo lanzado y no a Snake
	and a			;85b7
	jr nz,llega_a_lo_lanzado		;85b8
	ld a,(0cb03h)		;85ba   ; la Y de Snake - 4 - la del punto, menos de 0x18...
	sub 004h		;85bd
	sub l			;85bf
	cp 018h		;85c0
	ret nc			;85c2
	ld a,(0cb05h)		;85c3   ; ...y la X, menos de 0x0C: acarreo
	sub 006h		;85c6
	sub h			;85c8
	neg		;85c9
	cp 00ch		;85cb
	ret			;85cd
llega_a_lo_lanzado:		; a menos de 8 en Y y en X de lo lanzado (0xCB83, 0xCB85)
	ld a,(0cb83h)		;85ce   ; la Y de lo lanzado...
	sub l			;85d1
	call L_85DA		;85d2   ; ...a menos de 8
	ret nc			;85d5
	ld a,(0cb85h)		;85d6   ; la X
	sub h			;85d9
L_85DA:
	add a,008h		;85da
	cp 010h		;85dc
	ret			;85de
solido_en_la_linea:		; con 0xD840 = 0x0A, o en los tipos 0x0A y 0x15 solo los primeros pasos (p04:860F)
	ld a,(0d840h)		;85df
	cp 00ah		;85e2
	jr z,L_85F9		;85e4
	ld a,(ix+000h)		;85e6   ; lee el tipo del actor (0 = libre)
	and 07fh		;85e9
	cp 015h		;85eb
	jr z,L_85F3		;85ed
	cp 00ah		;85ef
	jr nz,L_85F9		;85f1
L_85F3:
	push bc			;85f3
	call pasos_que_miran		;85f4   ; pasos_que_miran: acarreo si aun no ha pasado de los pasos que miran (3, 1 o 5 segun el tipo y su dibujo) o con el bit 7 del byte 0x11
	pop bc			;85f7
	ret nc			;85f8
L_85F9:
	push bc			;85f9   ; B puntos de 8 en 8 hacia abajo...
	call solido_en_hl		;85fa   ; solido_en_hl: fuera de la sala o solido: acarreo
	pop bc			;85fd
	ret nc			;85fe
	ld a,l			;85ff
	add a,008h		;8600
	ld l,a			;8602
	djnz L_85F9		;8603   ; ...todos solidos: acarreo
	scf			;8605
	ret			;8606
solido_en_hl:		; fuera de la sala o solido: acarreo
	ld a,l			;8607
	cp 0c0h		;8608
	ccf			;860a
	ret c			;860b
	jp 07f37h		;860c   ; es_solido: p01:7F3D guardando HL
pasos_que_miran:		; acarreo si aun no ha pasado de los pasos que miran (3, 1 o 5 segun el tipo y su dibujo) o con el bit 7 del byte 0x11
	ld a,(ix+000h)		;860f   ; lee el tipo del actor (0 = libre)
	and 07fh		;8612
	cp 00ah		;8614
	ld b,003h		;8616
	jr z,L_8624		;8618
	ld a,(ix+00dh)		;861a   ; lee el dibujo del actor (bit 0: el paso)
	ld b,001h		;861d
	dec a			;861f
	jr nz,L_8624		;8620
	ld b,005h		;8622
L_8624:
	ld a,(ix+011h)		;8624   ; con el bit 7 del byte 0x11, sin acarreo
	rla			;8627
	ccf			;8628
	ret nc			;8629
	ld a,(0d8bdh)		;862a   ; los pasos dados...
	cp b			;862d   ; ...contra B
	ccf			;862e
	ret			;862f
ve_lo_lanzado:		; con lo lanzado 8, sin 0xD44F y sin alerta: el actor que lo tiene delante y lo ve, 0xD44F = 1 y p04:9CFE
	ld a,(0d44fh)		;8630   ; ya visto: nada
	and a			;8633
	ret nz			;8634
	ld a,(0ca5fh)		;8635   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	cp 002h		;8638   ; con la alerta 2 o mas, nada
	ret nc			;863a
	ld a,(ix+000h)		;863b   ; lee el tipo del actor (0 = libre)
	and 07fh		;863e   ; desde el tipo 0x10, nada
	cp 010h		;8640
	ret nc			;8642
	call en_esta_sala		;8643   ; en_esta_sala: Z si el actor esta en la sala de ahora (fila y columna)
	ret nz			;8646   ; fuera de la sala, nada
	push bc			;8647
	ld a,(0cb83h)		;8648   ; la Y de lo lanzado...
	ld l,a			;864b
	ld a,(0cb85h)		;864c   ; ...y la X
	ld h,a			;864f
	push hl			;8650
	call direccion_a_hl		;8651   ; direccion_a_hl: A = la direccion de 8 del actor a (H, L)
	pop de			;8654
	pop bc			;8655
	cp b			;8656   ; en su direccion?
	ret nz			;8657
	ld a,d			;8658   ; el centro: 8 mas...
	add a,008h		;8659
	ld d,a			;865b
	ld a,e			;865c   ; ...en las dos
	add a,008h		;865d
	ld e,a			;865f
	ld a,001h		;8660   ; 0xD450 = 1: la linea va a lo lanzado
	ld (0d450h),a		;8662   ; guarda 1: la linea de vista va a lo lanzado y no a Snake
	call le_ve_a		;8665   ; le_ve_a: la linea del actor a (D, E): las diferencias...
	ret c			;8668   ; algo de por medio: nada
	ld a,001h		;8669   ; visto: 0xD44F = 1...
	ld (0d44fh),a		;866b
	jp aviso_83_18		;866e   ; aviso_83_18:
musica_del_actor:		; la primera vez (0xCA26): ninguna pendiente y por el tipo (p04:8698)
	ld hl,0ca26h		;8671   ; apunta a 1 mientras suena la musica de un actor
	ld a,(hl)			;8674
	and a			;8675
	ret nz			;8676
	xor a			;8677
	ld (0ca18h),a		;8678   ; guarda la espera hasta poner la musica pendiente
	inc a			;867b
	ld (0ca26h),a		;867c   ; guarda 1 mientras suena la musica de un actor
	ld hl,00000h		;867f
	ld (0ca19h),hl		;8682   ; guarda la musica pendiente: la rutina que la pide (16 bits)
por_el_tipo_8698:		; por el byte del tipo en p04:8698 (p04:8691)
	ld a,(ix+000h)		;8685   ; lee el tipo del actor (0 = libre)
	ld hl,08698h		;8688
	call 04248h		;868b   ; byte_de_tabla: A = el byte A de la tabla de HL (y HL apunta a el)
	call 0424dh		;868e   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_8691: 4 destinos del despachador p00:424D (call en p04:868E, el
;   indice en A): 6B69, 6B6D, 6B71, 6C0B; lo leen p04:868E (8 bytes)
;   0x8691..0x8699  (8 bytes)
DATA_tabla_8691:
	defw 06b69h,06b6dh,06b71h,06c0bh	; 8691

; ----------------------------------------------------------------------
; DATOS tipo_por_actor_8699: los bytes de los tipos de actor 1-0x0B de la
;   tabla que lee p04:8688 (A = el byte de 0x8698 + el tipo): el indice del
;   despachador de p04:868E
;   0x8699..0x86a4  (11 bytes)
DATA_tipo_por_actor_8699:
	defb 001h,001h,003h,000h,002h,003h,000h,003h,003h,000h,003h	; 8699  ...........

; ======================================================================
; CODIGO 0x86a4..0x8a75  (977 bytes)
; ======================================================================


acaba_musica_del_actor:		; con 0xCA26: lo quita, p01:7A12 y el banco del tipo (1 el 15, 2 y 6 el 10)
	ld hl,0ca26h		;86a4   ; apunta a 1 mientras suena la musica de un actor
	ld a,(hl)			;86a7
	and a			;86a8
	ret z			;86a9
	ld (hl),000h		;86aa
	call 07a12h		;86ac   ; p01:7A12
	ld a,(ix+000h)		;86af   ; lee el tipo del actor (0 = libre)
	cp 001h		;86b2
	jp z,041f7h		;86b4   ; bancos_15: pone el 15 en 0xA000 (con su copia en 0xC381-0xC383)
	cp 002h		;86b7
	jp z,041cdh		;86b9   ; bancos_10: pone el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	cp 006h		;86bc
	jp z,041cdh		;86be   ; bancos_10: pone el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	ret			;86c1
pon_musica_a6:		; 0xCA26 = 1, ninguna pendiente y el sonido 0xA6
	ld a,001h		;86c2
	ld (0ca26h),a		;86c4   ; guarda 1 mientras suena la musica de un actor
	ld hl,00000h		;86c7
	ld (0ca19h),hl		;86ca   ; guarda la musica pendiente: la rutina que la pide (16 bits)
	jp 06bd0h		;86cd   ; sonido_a6: pide el sonido 0xA6 (de los que tienen la partitura en un banco de musica, p16:4CE3)
si_c692:		; con 0xC692, lo borra y salta a HL
	ld de,0c692h		;86d0   ; apunta a 1 al acabar la musica 0xA1
	jr L_86D8		;86d3
si_c693:		; con 0xC693, lo borra y salta a HL
	ld de,0c693h		;86d5   ; apunta a 1 al acabar la musica 0xA6
L_86D8:
	ld a,(de)			;86d8   ; la bandera...
	and a			;86d9
	ret z			;86da   ; ...sin ella, nada
	xor a			;86db   ; la borra...
	ld (de),a			;86dc
	jp (hl)			;86dd   ; ...y a HL
cambia_paso_cada_2:		; el byte 0x11 uno mas; cada 2, el paso del dibujo
	ld b,001h		;86de
	inc (ix+011h)		;86e0   ; el byte 0x11 uno mas
	ld a,(ix+011h)		;86e3
	and b			;86e6   ; en los impares, nada
	ret nz			;86e7
	call L_902E		;86e8   ; el paso del dibujo
	xor a			;86eb
	ret			;86ec
actor_0b:		; el 0x0B con 0xD8A0 >= 2
	ld a,(ix+000h)		;86ed   ; lee el tipo de la ficha de 0xD800
	cp 00bh		;86f0   ; solo el tipo 0x0B...
	ret nz			;86f2
	ld a,(0d8a0h)		;86f3   ; ...con 0xD8A0 >= 2
	cp 002h		;86f6
	ret c			;86f8
	call desplazamientos_del_dibujo		;86f9   ; sus dibujos (p04:87C1, p04:87E1)
	call patrones_del_dibujo		;86fc   ; patrones_del_dibujo: HL = los patrones del dibujo del tipo (p56:AB35, o p56:AB9C con el bit 7), 4 bytes de p56:AB9F por dibujo
	push hl			;86ff   ; los dibujos
	push ix		;8700   ; el numero de su ficha desde 0xD800...
	pop hl			;8702
	ld de,0d800h		;8703   ; apunta a 4 fichas de 0x20 bytes de 0xD800 (p04:89C3); sus tipos los lleva p10
	or a			;8706
	sbc hl,de		;8707   ; IX - 0xD800...
	ld a,l			;8709
	srl a		;870a   ; .../ 2: sus sprites desde el 10 (0xDC28)
	ld de,0dc28h		;870c   ; ...los sprites desde el 10
	call 04243h		;870f   ; suma_a_de: DE = DE + A
	pop hl			;8712
	call pon_sprites_de_dibujo		;8713   ; los sprites
	push ix		;8716   ; y sus colores desde 0xDAA0
	pop hl			;8718   ; los dibujos
	ld de,0d800h		;8719   ; apunta a 4 fichas de 0x20 bytes de 0xD800 (p04:89C3); sus tipos los lleva p10
	or a			;871c
	sbc hl,de		;871d   ; (IX - 0xD800) * 2...
	add hl,hl			;871f
	ld de,0daa0h		;8720   ; ...en los colores desde 0xDAA0
	add hl,de			;8723
	ex de,hl			;8724
	jp colores_del_dibujo		;8725   ; colores_del_dibujo: los colores del dibujo en rachas a DE: los de p56:AE23/AE2C, los del tipo (p56:ACE1) y casos
esconde_sprites_10_13:		; los sprites 10-13 fuera
	ld bc,0000fh		;8728
esconde_desde_10:		; BC + 1 bytes de sprites desde el 10 fuera (Y = 0xE0)
	ld hl,0dc28h		;872b
	ld a,0e0h		;872e
	jp 04237h		;8730   ; llena_bloque: pone A en BC + 1 bytes desde HL
sprites_de_la_ficha_bancos_14:
	call sprites_de_la_ficha		;8733   ; sprites_de_la_ficha: los sprites 10-13 fuera y, si la ficha de IX esta en esta sala, sus sprites y colores
	jp 041efh		;8736   ; bancos_14: pone el 14 en 0xA000 (con su copia en 0xC381-0xC383)
sprites_de_la_ficha:		; los sprites 10-13 fuera y, si la ficha de IX esta en esta sala, sus sprites y colores
	call esconde_sprites_10_13		;8739   ; esconde_sprites_10_13: los sprites 10-13 fuera
L_873C:
	ld a,(ix+000h)		;873c   ; lee el tipo de la ficha de 0xD800
	and a			;873f
	ret z			;8740
	call en_esta_sala		;8741   ; en_esta_sala: Z si el actor esta en la sala de ahora (fila y columna)
	ret nz			;8744
	call desplazamientos_del_dibujo		;8745   ; desplazamientos_del_dibujo: HL' = los desplazamientos del dibujo del tipo (p56:ABE5; con el bit 7 del dibujo, p56:ACDD)
	call patrones_del_dibujo		;8748   ; patrones_del_dibujo: HL = los patrones del dibujo del tipo (p56:AB35, o p56:AB9C con el bit 7), 4 bytes de p56:AB9F por dibujo
	call sprites_desde_10		;874b   ; sprites_desde_10: los sprites desde el 10 (0xDC28)
	jp colores_desde_daa0		;874e   ; colores_desde_daa0: los colores desde 0xDAA0
a_p14_af96:		; p14:AF96 con el banco 14 en 0xA000
	call 041efh		;8751   ; bancos_14: pone el 14 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0af96h		;8754   ; cuenta_d800: C = cuantas fichas de 0xD800 estan activas (de 4)
	jr L_87BE		;8757
a_p14_ae76:		; p14:AE76 con el banco 14 en 0xA000
	call 041efh		;8759   ; bancos_14: pone el 14 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0ae76h		;875c   ; d800_0b_vuelve: la velocidad guardada al reves, la espera de la fila siguiente de p14:AD86, el byte 0x0C = 3, el paso 5, el sonido 0x5A y el dibujo de p14:AF6F por el byte 0x1A
	jr L_87BE		;875f
sprites_desde_10:		; los sprites desde el 10 (0xDC28)
	ld de,0dc28h		;8761
pon_sprites_de_dibujo:		; dos filas de sprites del dibujo de HL (p56) en DE, con su copia en 0xD8E0
	call 0418eh		;8764   ; bancos_56: pone el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	exx			;8767
	push de			;8768
	push bc			;8769
	ld a,(hl)			;876a   ; los dos patrones...
	ld de,0d8e0h		;876b   ; apunta a de paso: en p00:4D5A, 1 = solo las listas 6 y 7; en p14:BE6D, la cuenta de la racha
	push de			;876e
	ldi		;876f   ; ...a 0xD8E0, con el siguiente (+ 4)
	add a,004h		;8771   ; el patron siguiente
	ld (de),a			;8773
	inc de			;8774
	ld a,(hl)			;8775   ; el otro
	ldi		;8776
	add a,004h		;8778
	ld (de),a			;877a
	pop hl			;877b
	pop de			;877c
	pop bc			;877d
	exx			;877e
	push de			;877f
	exx			;8780
	pop de			;8781
	ld a,e			;8782
	add a,004h		;8783   ; DE + 4 en la copia
	ld e,a			;8785
	exx			;8786
	ld b,002h		;8787   ; dos sprites
L_8789:
	ld a,(ix+003h)		;8789   ; la Y + el byte 0x13 + la del dibujo (0: fuera)
	add a,(ix+013h)		;878c
	ld c,a			;878f
	ld a,(hl)			;8790
	add a,a			;8791
	ld a,0e0h		;8792
	jr z,L_8798		;8794
	ld a,(hl)			;8796
	add a,c			;8797
L_8798:
	ld (de),a			;8798   ; la Y del sprite...
	exx			;8799
	ld (de),a			;879a   ; ...y en la copia
	inc de			;879b
	exx			;879c
	inc hl			;879d
	inc de			;879e
	ld a,(ix+005h)		;879f   ; la X + la del dibujo
	add a,(hl)			;87a2   ; la X + la del dibujo...
	ld (de),a			;87a3
	exx			;87a4
	ld (de),a			;87a5   ; ...y en la copia
	inc de			;87a6
	exx			;87a7
	inc hl			;87a8
	inc de			;87a9
	exx			;87aa
	ld a,(hl)			;87ab   ; el patron...
	inc hl			;87ac   ; el patron de la copia
	exx			;87ad
	ld (de),a			;87ae
	exx			;87af
	ld a,(hl)			;87b0   ; ...y el color
	inc hl			;87b1   ; el color
	ld (de),a			;87b2
	ld a,e			;87b3   ; el siguiente: 6 bytes mas alla (dos sprites de 4 menos los escritos)
	add a,006h		;87b4   ; el sprite siguiente
	ld e,a			;87b6
	exx			;87b7
	ld a,e			;87b8   ; tambien en la copia
	add a,006h		;87b9
	ld e,a			;87bb
	djnz L_8789		;87bc
L_87BE:
	jp 04142h		;87be   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
desplazamientos_del_dibujo:		; HL' = los desplazamientos del dibujo del tipo (p56:ABE5; con el bit 7 del dibujo, p56:ACDD)
	call 0418eh		;87c1   ; bancos_56: pone el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	exx			;87c4
	ld a,(ix+000h)		;87c5   ; lee el tipo de la ficha de 0xD800
	ld hl,0abe5h		;87c8
	call 043f6h		;87cb   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld a,(ix+00dh)		;87ce   ; lee el dibujo de la ficha de 0xD800
	cp 080h		;87d1
	jr c,L_87D8		;87d3
	ld hl,0acddh		;87d5
L_87D8:
	and 07fh		;87d8
	add a,a			;87da
	call 0423eh		;87db   ; suma_a_hl: HL = HL + A
	exx			;87de
	jr L_87BE		;87df
patrones_del_dibujo:		; HL = los patrones del dibujo del tipo (p56:AB35, o p56:AB9C con el bit 7), 4 bytes de p56:AB9F por dibujo
	call 0418eh		;87e1   ; bancos_56: pone el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	ld a,(ix+000h)		;87e4   ; lee el tipo de la ficha de 0xD800
	ld hl,0ab35h		;87e7
	call 043f6h		;87ea   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld a,(ix+00dh)		;87ed   ; lee el dibujo de la ficha de 0xD800
	cp 080h		;87f0
	jr c,L_87F7		;87f2
	ld hl,0ab9ch		;87f4
L_87F7:
	and 07fh		;87f7
	call 0423eh		;87f9   ; suma_a_hl: HL = HL + A
	ld a,(hl)			;87fc
	ld hl,0ab9fh		;87fd
	add a,a			;8800
	add a,a			;8801
	call 0423eh		;8802   ; suma_a_hl: HL = HL + A
	jr L_87BE		;8805
colores_desde_daa0:		; los colores desde 0xDAA0
	ld de,0daa0h		;8807
colores_del_dibujo:		; los colores del dibujo en rachas a DE: los de p56:AE23/AE2C, los del tipo (p56:ACE1) y casos
	call 0418eh		;880a   ; bancos_56: pone el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	ld a,(ix+00dh)		;880d   ; lee el dibujo de la ficha de 0xD800
	ld b,a			;8810
	cp 082h		;8811
	ld hl,0ae23h		;8813
	jr c,L_881B		;8816
	ld hl,0ae2ch		;8818
L_881B:
	ld a,b			;881b
	cp 080h		;881c
	jr nc,L_8861		;881e
	ld a,(ix+000h)		;8820   ; por el tipo...
	ld b,a			;8823
	ld hl,0ace1h		;8824
	call 043f6h		;8827   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld a,b			;882a
	cp 003h		;882b   ; ...el 3 con el dibujo 0x12: p56:AD89
	jr z,L_8857		;882d
	cp 004h		;882f   ; ...el 4 desde el dibujo 8: p56:AD6C
	jr z,L_884B		;8831
	cp 00ah		;8833   ; ...el 0x0A desde el 0x14: p56:ADE2 por la espera
	jr nz,L_8861		;8835
	ld a,(ix+00dh)		;8837   ; lee el dibujo de la ficha de 0xD800
	cp 014h		;883a
	jr c,L_8861		;883c
	ld a,(ix+00eh)		;883e   ; lee la espera de la ficha de 0xD800
	and 003h		;8841
	ld hl,0ade2h		;8843
	call 043f6h		;8846   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	jr L_8861		;8849
L_884B:
	ld a,(ix+00dh)		;884b   ; lee el dibujo de la ficha de 0xD800
	cp 008h		;884e
	jr c,L_8861		;8850
	ld hl,0ad6ch		;8852
	jr L_8861		;8855
L_8857:
	ld a,(ix+00dh)		;8857   ; lee el dibujo de la ficha de 0xD800
	cp 012h		;885a
	jr nz,L_8861		;885c
	ld hl,0ad89h		;885e
L_8861:
	ld a,(ix+017h)		;8861   ; con el byte 0x17 (salvo el 5): los colores parpadean con p56:AE35/AE38
	ld b,a			;8864
	and a			;8865
	jr z,L_8892		;8866
	ld a,(ix+000h)		;8868   ; lee el tipo de la ficha de 0xD800
	cp 005h		;886b
	jr z,L_8892		;886d
	ld a,b			;886f
	rra			;8870
	jr c,L_8892		;8871
	ld a,(ix+000h)		;8873   ; lee el tipo de la ficha de 0xD800
	ld c,018h		;8876
	cp 006h		;8878
	jr z,L_8886		;887a
	cp 00ah		;887c
	jr z,L_8886		;887e
	cp 008h		;8880
	jr z,L_8886		;8882
	ld c,008h		;8884
L_8886:
	ld a,(ix+010h)		;8886
	cp c			;8889
	ld hl,0ae35h		;888a
	jr nc,L_8892		;888d
	ld hl,0ae38h		;888f
L_8892:
	ex de,hl			;8892
	call 051e0h		;8893   ; las rachas
	call 04142h		;8896   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	ld a,(ix+000h)		;8899   ; el 7 con el dibujo 8: los colores de 0xDAA8 y 0xDAB8 a cero
	cp 007h		;889c
	ret nz			;889e
	ld a,(ix+00dh)		;889f   ; lee el dibujo de la ficha de 0xD800
	cp 008h		;88a2
	ret nz			;88a4
	ld hl,0daa8h		;88a5
	ld bc,00007h		;88a8
	call 04236h		;88ab   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	ld hl,0dab8h		;88ae
	ld bc,00027h		;88b1
	jp 04236h		;88b4   ; borra_bloque: pone a cero BC + 1 bytes desde HL
pantalla_de_d800:		; segun el tipo de 0xD800: 1 p04:8947; 2 en esta sala, una pantalla de mosaicos la primera vez
	ld a,(0d800h)		;88b7   ; lee 4 fichas de 0x20 bytes de 0xD800 (p04:89C3); sus tipos los lleva p10
	dec a			;88ba
	jp z,mosaico_d800_tipo_1		;88bb
	dec a			;88be
	ret nz			;88bf
	call d800_en_esta_sala		;88c0   ; d800_en_esta_sala: IX = 0xD800: Z si esta en esta sala
	ret nz			;88c3
	ld hl,0d8a6h		;88c4   ; la primera vez (0xD8A6)...
	ld a,(hl)			;88c7
	and a			;88c8
	jr nz,L_8915		;88c9
	inc (hl)			;88cb
	xor a			;88cc   ; ...la pagina 1 a cero...
	ld h,a			;88cd
	ld l,a			;88ce
	ld bc,00080h		;88cf
	ld d,001h		;88d2
	call 046ffh		;88d4   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
	call 0418eh		;88d7   ; bancos_56: pone el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	ld hl,00302h		;88da   ; ...los juegos de piezas 2 y 3...
	ld (0ca4ch),hl		;88dd   ; guarda los 4 bits altos del byte de la sala (p56:BD28) y el byte siguiente (16 bits)
	ld de,0aa35h		;88e0   ; ...el mosaico en rachas de p56:AA35...
	ld hl,0e900h		;88e3   ; apunta a los caracteres de un dibujo pasados a 4 bits; de paso, una paleta (p14:A5C5) o las letras en bits (p14:BD54)
	call 051e0h		;88e6   ; rachas_a_ram: deshace las rachas de DE en HL (n < 0x80 repite, n > 0x80 copia, 0 acaba)
	ld hl,0e900h		;88e9   ; apunta a los caracteres de un dibujo pasados a 4 bits; de paso, una paleta (p14:A5C5) o las letras en bits (p14:BD54)
	ld de,00000h		;88ec
L_88EF:
	ld a,(hl)			;88ef   ; ...caracter a caracter hasta 0xFF, 32 por fila...
	ld b,a			;88f0
	inc b			;88f1
	jr z,L_8904		;88f2
	call 04a0bh		;88f4   ; pieza_de_sala_a_la_otra: el caracter A de la sala (p00:4A36) de la pagina 2 a la otra
	inc hl			;88f7
	ld a,d			;88f8
	add a,008h		;88f9
	ld d,a			;88fb
	jr nc,L_88EF		;88fc
	ld a,e			;88fe
	add a,008h		;88ff
	ld e,a			;8901
	jr L_88EF		;8902
L_8904:
	call 04142h		;8904   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	ld h,000h		;8907   ; ...y de la 1 a la 2: 0x80 x 0x40 de Y = 0
	ld l,h			;8909
	ld d,h			;890a
	ld b,h			;890b
	ld e,040h		;890c
	ld c,080h		;890e
	ld a,009h		;8910
	call 04767h		;8912   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
L_8915:
	call a_p06_b1fd_guarda		;8915   ; p06:B1FD
	ld a,(0d801h)		;8918   ; con 0xD801 >= 6...
	cp 006h		;891b
	ret c			;891d
	ld hl,00040h		;891e   ; ...un rectangulo de la pagina 2...
	ld de,03080h		;8921
	ld bc,06080h		;8924
	ld a,002h		;8927
	call 04767h		;8929   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
	call 041cdh		;892c   ; bancos_10: pone el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	ld a,(0d80dh)		;892f   ; ...y p10:AB7D con 0xD80D y con 0xD80D - 1
	push af			;8932
	call 0ab7dh		;8933   ; dibujo_ab9d: el dibujo A (p10:AB9D): 0x38 lineas de 0x28 de la pagina 2 desde (X, 0x40) a (D, 0xC8)
	pop af			;8936
	dec a			;8937
	and 003h		;8938
	call 0ab7dh		;893a   ; dibujo_ab9d: el dibujo A (p10:AB9D): 0x38 lineas de 0x28 de la pagina 2 desde (X, 0x40) a (D, 0xC8)
	jp 04142h		;893d   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
d800_en_esta_sala:		; IX = 0xD800: Z si esta en esta sala
	ld ix,0d800h		;8940   ; apunta a 4 fichas de 0x20 bytes de 0xD800 (p04:89C3); sus tipos los lleva p10
	jp en_esta_sala		;8944   ; en_esta_sala: Z si el actor esta en la sala de ahora (fila y columna)
mosaico_d800_tipo_1:		; en esta sala: un rectangulo de la otra pagina y el mosaico de p56:A9ED
	call d800_en_esta_sala		;8947   ; d800_en_esta_sala: IX = 0xD800: Z si esta en esta sala
	ret nz			;894a
	ld hl,04800h		;894b
	ld de,00000h		;894e
	ld bc,03060h		;8951
	call 0474dh		;8954   ; copia_rectangulo_a_esta: p00:4767 de la otra pagina (0xCA42 ^ 1) a la de 0xCA42
mosaico_a9ed:		; en X = 0x30, Y = 0
	ld de,03000h		;8957
mosaico_a9ed_en:		; el mosaico de p56:A9ED (12 x 6) en DE, con los juegos de piezas 3 y 3
	call 0418eh		;895a   ; bancos_56: pone el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	ld hl,00303h		;895d
	ld (0ca4ch),hl		;8960   ; guarda los 4 bits altos del byte de la sala (p56:BD28) y el byte siguiente (16 bits)
	ld hl,0a9edh		;8963
	ld bc,00c06h		;8966
	call mosaico_a_la_otra		;8969   ; mosaico_a_la_otra: B filas de C caracteres de HL, de la pagina 2 a la otra
	jp 04142h		;896c   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
mosaico_a_la_otra:		; B filas de C caracteres de HL, de la pagina 2 a la otra
	push bc			;896f
	push de			;8970
	ld b,c			;8971
L_8972:
	ld a,(hl)			;8972   ; el caracter
	call 04a0bh		;8973   ; pieza_de_sala_a_la_otra: el caracter A de la sala (p00:4A36) de la pagina 2 a la otra
	inc hl			;8976
	ld a,d			;8977   ; 8 puntos a la derecha
	add a,008h		;8978
	ld d,a			;897a
	djnz L_8972		;897b
	pop de			;897d
	ld a,e			;897e   ; la fila siguiente, 8 lineas mas abajo
	add a,008h		;897f
	ld e,a			;8981
	pop bc			;8982
	djnz mosaico_a_la_otra		;8983
	ret			;8985
mosaico_zona_7:		; en la zona 7 fila 8 columna 7, con 0xD800 = 1 y 0xD801 = 0: el mosaico en X = 0x48
	ld a,(0ca4ah)		;8986   ; lee la zona
	cp 007h		;8989
	ret nz			;898b
	ld hl,(0ca50h)		;898c   ; lee la fila de la sala en la zona (uno mas al salir por arriba) y el byte siguiente (16 bits)
	ld a,l			;898f
	cp 008h		;8990
	ret nz			;8992
	ld a,h			;8993
	cp 007h		;8994
	ret nz			;8996
	ld hl,0d800h		;8997   ; apunta a 4 fichas de 0x20 bytes de 0xD800 (p04:89C3); sus tipos los lleva p10
	ld a,(hl)			;899a
	cp 001h		;899b
	ret nz			;899d
	inc hl			;899e
	ld a,(hl)			;899f
	and a			;89a0
	ld de,04800h		;89a1
	jp z,mosaico_a9ed_en		;89a4   ; mosaico_a9ed_en: el mosaico de p56:A9ED (12 x 6) en DE, con los juegos de piezas 3 y 3
	ret			;89a7
a_p06_b239_guarda:		; p06:B239 guardando el banco de 0xA000
	ld a,(0c383h)		;89a8   ; lee la copia del banco de 0xA000
	push af			;89ab
	call 041a0h		;89ac   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b239h		;89af   ; bordes_b3_c8: la pagina 0 a cero y dos columnas de 0x20 caracteres de la sala: el 0xB3 en X = 0 y el 0xC8 en X = 0xB8
	jr L_89BE		;89b2
a_p06_b1fd_guarda:		; p06:B1FD guardando el banco de 0xA000
	ld a,(0c383h)		;89b4   ; lee la copia del banco de 0xA000
	push af			;89b7
	call 041a0h		;89b8   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b1fdh		;89bb   ; pagina_0_a_la_1: la pagina 0 entera (256 x 0xC0) a la 1, borra 0x40 x 0x14 en (0xC0, 0xC0) de la 1 y, con 0xD501 < 2, 6 caracteres de 8 x 8 de (0xE8, 0x38) de la pagina 2 a (0x48, 0xB8) de la 1
L_89BE:
	pop af			;89be
	push af			;89bf
	jp 041a3h		;89c0
fichas_d800:		; las 4 fichas de 0x20 bytes de 0xD800 (o la de 0xD860 en las especiales)
	call a_p06_b1da_guarda		;89c3   ; a_p06_b1da_guarda: p06:B1DA guardando el banco de 0xA000
	ld ix,0d800h		;89c6   ; apunta a 4 fichas de 0x20 bytes de 0xD800 (p04:89C3); sus tipos los lleva p10
	ld a,(0d8a0h)		;89ca   ; con 0xD8A0, las 4
	and a			;89cd
	jr nz,L_8A34		;89ce
	ld a,(ix+000h)		;89d0   ; con los tipos 5 y 6 sin mirar 0xCA77
	cp 006h		;89d3
	jr z,L_89E0		;89d5
	cp 005h		;89d7
	jr z,L_89E0		;89d9
	ld a,(0ca77h)		;89db
	and a			;89de
	ret nz			;89df
L_89E0:
	ld a,(0ca76h)		;89e0   ; en las salas normales, 3 desde 0xD800
	and a			;89e3
	ld b,003h		;89e4
	jr z,L_8A36		;89e6
	ld ix,0d860h		;89e8   ; en las especiales, la de 0xD860
ficha_d800:		; libre: nada
	ld a,(ix+000h)		;89ec   ; lee el tipo de la ficha de 0xD800
	and a			;89ef
	ret z			;89f0
	call ficha_d800_por_tipo		;89f1   ; por su paso o su tipo (p04:8A4B)
	ld a,(ix+017h)		;89f4   ; la espera del parpadeo (byte 0x17)...
	and a			;89f7
	ret z			;89f8
	dec (ix+017h)		;89f9   ; ...un cuadro menos
	jr nz,L_8A24		;89fc
	ld a,(ix+000h)		;89fe   ; al acabar: el 5 nada mas; el 9, el byte 0x13 a 0
	ld c,a			;8a01
	cp 005h		;8a02
	ret z			;8a04
	cp 009h		;8a05
	jr nz,L_8A0D		;8a07
	ld (ix+013h),000h		;8a09
L_8A0D:
	ld a,(ix+010h)		;8a0d   ; con el byte 0x10, el byte 0x16 = 1 (el 0x0B solo en los pasos 3-6)
	and a			;8a10
	ret z			;8a11
	ld a,c			;8a12
	cp 00bh		;8a13
	jr nz,L_8A1F		;8a15
	ld a,(ix+001h)		;8a17   ; lee el paso de la ficha de 0xD800
	sub 003h		;8a1a
	cp 004h		;8a1c
	ret nc			;8a1e
L_8A1F:
	ld (ix+016h),001h		;8a1f
	ret			;8a23
L_8A24:
	ld a,(ix+000h)		;8a24   ; mientras, los tipos 2 y 4: p04:8D48
	cp 002h		;8a27
	jr z,L_8A2E		;8a29
	cp 004h		;8a2b
	ret nz			;8a2d
L_8A2E:
	ld a,(ix+017h)		;8a2e   ; lee la espera del parpadeo de la ficha de 0xD800
	jp borde_parpadea		;8a31   ; borde_parpadea: R#7: 0x0F o 7 segun el bit 0 de A
L_8A34:
	ld b,004h		;8a34   ; 4 fichas
L_8A36:
	push bc			;8a36
	call ficha_d800		;8a37   ; ficha_d800: libre: nada
	ld a,(ix+000h)		;8a3a   ; lee el tipo de la ficha de 0xD800
	cp 00bh		;8a3d
	call z,actor_0b		;8a3f   ; actor_0b: el 0x0B con 0xD8A0 >= 2
	ld bc,00020h		;8a42   ; la siguiente, 0x20 mas alla
	add ix,bc		;8a45
	pop bc			;8a47
	djnz L_8A36		;8a48
	ret			;8a4a
ficha_d800_por_tipo:		; con Snake en el estado 0x0E, solo los pasos por debajo de 0x20
	ld a,(0cb00h)		;8a4b   ; lee el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	cp 00eh		;8a4e
	jr z,L_8A69		;8a50
	ld a,(ix+001h)		;8a52   ; desde el paso 0x20, por la tabla de p04:8AD8
	sub 020h		;8a55
	ld hl,08ad8h		;8a57
	jp nc,0424eh		;8a5a   ; salta_por_tabla: salta a la palabra A de la tabla de HL
	ld a,(ix+000h)		;8a5d   ; antes, por el tipo (p04:8A8D)
	dec a			;8a60
	ld hl,08a8dh		;8a61   ; tabla_8A8D: la logica de cada tipo de ficha 0xD800
	call 0424eh		;8a64   ; salta_por_tabla: salta a la palabra A de la tabla de HL
	jr L_8A6F		;8a67
L_8A69:
	ld a,(ix+001h)		;8a69   ; lee el paso de la ficha de 0xD800
	cp 020h		;8a6c
	ret nc			;8a6e
L_8A6F:
	ld a,(ix+000h)		;8a6f   ; y por el tipo (p04:8A75)
	call 0424dh		;8a72   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_8A75: el dibujo de cada tipo de ficha 0xD800 (0-0x0B), el
;   despachador p00:424D con A = el tipo (p04:8A72): 8BDF el 0, el 2, el 5 y
;   el 0x0B; p15:B800 (por 8AD0) el 1; sprites_de_la_ficha 8739 el 3, el 4 y
;   el 9; 8AC8 el 6; p05:B2CD el 7, p05:BD3B el 8, p05:B56A el 0x0A (24 bytes)
;   0x8a75..0x8a8d  (24 bytes)
DATA_tabla_8A75:
	defw 08bdfh,08ad0h,08bdfh,08739h,08739h,08bdfh,08ac8h,0b2cdh	; 8a75
	defw 0bd3bh,08739h,0b56ah,08bdfh	; 8a85  -> 0xbd3b sprites_de_la_ficha 0xb56a L_8BDF

; ----------------------------------------------------------------------
; DATOS tabla_8A8D: la logica de cada tipo de ficha 0xD800 (1-0x0B), por
;   salta_por_tabla con el tipo - 1 (p04:8A61): p15:B8EC el 1, p10:AA78 el 2,
;   p05:A5F3 el 3, p05:AC1F el 4, p05:AFA4 el 5, p14:AB9E el 6, p05:B2B2 el 7,
;   p05:BD46 el 8, p05:B923 el 9, p05:B573 el 0x0A, p14:AD0F el 0x0B (22
;   bytes)
;   0x8a8d..0x8aa3  (22 bytes)
DATA_tabla_8A8D:
	defw 08aabh,08aa3h,0a5f3h,0ac1fh,0afa4h,08ab3h,0b2b2h,0bd46h	; 8a8d
	defw 0b923h,0b573h,08abch	; 8a9d  -> 0xb923 0xb573 a_p14_ad0f

; ======================================================================
; CODIGO 0x8aa3..0x8ad8  (53 bytes)
; ======================================================================


a_p10_aa78:		; p10:AA78 con el banco 10 en 0xA000
	call 041cdh		;8aa3   ; bancos_10: pone el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0aa78h		;8aa6   ; d800_tipo_2: la ficha de 0xD800 de tipo 2 (IX, su logica por p04:8A8D) con 0xD8A4: con 0xC692 el sonido 0x84, R#23 (p10:AAA9) y su paso (p10:AA8F, 13 pasos)
	jr L_8AB9		;8aa9
a_p15_b8ec:		; p15:B8EC con el banco 15 en 0xA000
	call 041f7h		;8aab   ; bancos_15: pone el 15 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b8ech		;8aae   ; d800_tipo_1: la ficha de 0xD800 de tipo 1 (IX), su logica (p04:8A8D): solo en las salas 0x10-0x13 (si no, fuera su musica); con 0xC693, p00:6AEE; su paso por p15:B919 (6) y, desde el paso 4, p06:BA36 con su byte 0x0C y su musica
	jr L_8AB9		;8ab1
a_p14_ab9e:		; p14:AB9E con el banco 14 en 0xA000
	call 041efh		;8ab3   ; bancos_14: pone el 14 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0ab9eh		;8ab6   ; d800_tipo_6: la ficha de 0xD800 de tipo 6 (su logica, p04:8A8D): con 0xCA77, fuera su musica; con 0xC693, p00:6BCC; su paso por p14:ABC5 (9), p06:BA36 con su byte 0x0C y, en los pasos 5-8, su musica
L_8AB9:
	jp 04142h		;8ab9   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
a_p14_ad0f:		; p14:AD0F con el banco 14 en 0xA000
	call 041efh		;8abc   ; bancos_14: pone el 14 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0ad0fh		;8abf   ; d800_tipo_0b: la ficha de 0xD800 de tipo 0x0B (su logica, p04:8A8D), con 0xD8A0: el byte 0x16 a 1 en los pasos 3-4 sin el byte 0x17; su paso por p14:AD38 (8) y p06:BA36 con su byte 0x0C
	jr L_8AB9		;8ac2
rutina_de_la_zona_en_d800:		; la rutina de la zona en la fase, y a ella
	call 07a88h		;8ac4   ; rutina_de_fase_b_1_4_5: rutina_de_fase y deja los bancos 1, 4 y 5
	jp (hl)			;8ac7
sprites_de_la_ficha_si:		; sin 0xCA77, los sprites de la ficha
	ld a,(0ca77h)		;8ac8
	and a			;8acb
	ret nz			;8acc
	jp sprites_de_la_ficha		;8acd   ; sprites_de_la_ficha: los sprites 10-13 fuera y, si la ficha de IX esta en esta sala, sus sprites y colores
a_p15_b800:		; p15:B800 con el banco 15 en 0xA000
	call 041f7h		;8ad0   ; bancos_15: pone el 15 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b800h		;8ad3   ; sprites_d800_tipo_1: los sprites de la ficha de 0xD800 de tipo 1 (IX): en los pasos 2-3 (el 2 sin el byte 0x1F), los 16 sprites desde el 10 fuera y los de la lista p15:BC0A por su dibujo (byte 0x0D) desde la Y + el byte 0x0F - 0x28 y la X + 0xC0; desde el paso 4, en su sala, la lista p15:BC40 y la de p15:BBFA con el color 0x0F; recortados por encima de 0xC0 (p15:B8B9)
	jr L_8AB9		;8ad6

; ----------------------------------------------------------------------
; DATOS resto_8AD8: lo apuntan con el banco puesto p04:8A57 (0x8AD8); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p04:8A57 (28 bytes)
;   0x8ad8..0x8af4  (28 bytes)
DATA_resto_8AD8:
	defb 0f4h,08ah,052h,08bh,072h,08bh,0f1h,08bh,0b6h,08bh,0e0h,08bh,083h,08ch,0a2h,08ch	; 8ad8  ..R.r...........
	defb 072h,08bh,0c5h,08ch,040h,08dh,05bh,08dh,072h,08bh,06eh,08dh	; 8ae8  r...@.[.r.n.

; ======================================================================
; CODIGO 0x8af4..0x8bab  (183 bytes)
; ======================================================================


d800_paso_20:		; el paso 0x20 de las fichas de 0xD800: su bandera de 0xD87F, 0xD8AE = 0xCB3C = 1 y segun el tipo
	call bandera_d87f		;8af4   ; bandera_d87f: 0xD87F + el tipo = 0xFF
	xor a			;8af7   ; los bytes 0x0F y 0x0C a cero
	ld (ix+00fh),a		;8af8
	ld (ix+00ch),a		;8afb
	inc a			;8afe   ; 0xD8AE = 1, 0xCB3C = 1
	ld (0d8aeh),a		;8aff
	ld (0cb3ch),a		;8b02
	ld a,(ix+000h)		;8b05   ; el 1: p04:8B30
	cp 001h		;8b08
	jr z,L_8B30		;8b0a
	cp 002h		;8b0c   ; el 2: p04:8B27
	jr z,L_8B27		;8b0e
	cp 008h		;8b10   ; el 8: p04:8B41
	jr z,L_8B41		;8b12
	ld (ix+00eh),00ch		;8b14   ; los demas: 0x0C cuadros, el dibujo 0x80, las rachas de p41:BC6E, p06:B14E y el paso siguiente
	ld (ix+00dh),080h		;8b18   ; el dibujo de la ficha de 0xD800 = 0x80
	call 06faeh		;8b1c   ; rachas_bc6e: las rachas de p41:BC6E a la VRAM de 0xFE00
	call a_p06_b14e_guarda		;8b1f   ; a_p06_b14e_guarda: p06:B14E guardando el banco de 0xA000
	call paso_siguiente_d800		;8b22   ; paso_siguiente_d800: el paso siguiente
	jr L_8B3B		;8b25
L_8B27:
	ld (ix+00eh),048h		;8b27   ; el 2: 0x48 cuadros y el paso 0x26
	ld (ix+001h),026h		;8b2b   ; el paso de la ficha de 0xD800 = 0x26
	ret			;8b2f
L_8B30:
	ld (ix+00eh),018h		;8b30   ; el 1: 0x18 cuadros y el paso 0x2A
	ld (ix+001h),02ah		;8b34   ; el paso de la ficha de 0xD800 = 0x2A
	call en_esta_sala		;8b38   ; en_esta_sala: Z si el actor esta en la sala de ahora (fila y columna)
L_8B3B:
	call 06b12h		;8b3b   ; los sonidos 5 y 0x86
	jp 06c3fh		;8b3e   ; sonido_86: pide el sonido 0x86 (de los que tienen la partitura en un banco de musica, p16:4CE3)
L_8B41:
	call quita_d800_b14e		;8b41   ; el 8: fuera, 0xCB5A = 3, p03:A8D8 y Snake con el dibujo 0x0D
	ld a,003h		;8b44
	ld (0cb5ah),a		;8b46
	call 07a68h		;8b49   ; a_p03_a8d8: p03:A8D8 con el banco 3 en 0xA000
	ld a,00dh		;8b4c
	ld (0cb01h),a		;8b4e   ; guarda el dibujo de Snake (al darse la vuelta se le suma 1, 3 o 5 segun 0xCB00)
	ret			;8b51
d800_paso_21:		; el paso 0x21: cada 4 cuadros el dibujo siguiente; al acabar, 0xD8AE = 0, sin sprites y 0x18 cuadros
	dec (ix+00eh)		;8b52   ; baja la espera de la ficha de 0xD800
	jr z,L_8B64		;8b55
	ld a,(ix+00eh)		;8b57   ; lee la espera de la ficha de 0xD800
	and 003h		;8b5a
	jr nz,L_8B61		;8b5c
	inc (ix+00dh)		;8b5e   ; sube el dibujo de la ficha de 0xD800
L_8B61:
	jp sprites_de_la_ficha		;8b61   ; sprites_de_la_ficha: los sprites 10-13 fuera y, si la ficha de IX esta en esta sala, sus sprites y colores
L_8B64:
	xor a			;8b64
	ld (0d8aeh),a		;8b65
	call esconde_sprites_10_13		;8b68   ; esconde_sprites_10_13: los sprites 10-13 fuera
espera_18_y_paso:		; 0x18 cuadros y el paso siguiente
	ld (ix+00eh),018h		;8b6b   ; la espera de la ficha de 0xD800 = 0x18
	jp paso_siguiente_d800		;8b6f   ; paso_siguiente_d800: el paso siguiente
d800_paso_22:		; el paso 0x22: al acabar la espera, la vida (y el nivel) y sin sprites; los tipos 5, 0x0A y 6 al paso 0x24
	dec (ix+00eh)		;8b72   ; baja la espera de la ficha de 0xD800
	ret nz			;8b75
	call vida_al_acabar		;8b76   ; vida_al_acabar: los tipos con 0 en p04:8BAA suben el nivel de Snake (y el sonido 0x4D); todos llenan la vida
	call esconde_sprites_10_13		;8b79   ; esconde_sprites_10_13: los sprites 10-13 fuera
	ld a,(ix+000h)		;8b7c   ; lee el tipo de la ficha de 0xD800
	cp 005h		;8b7f
	jr z,L_8B8B		;8b81
	cp 00ah		;8b83
	jr z,L_8B8B		;8b85
	cp 006h		;8b87
	jr nz,espera_18_y_paso		;8b89
L_8B8B:
	ld (ix+001h),024h		;8b8b   ; el paso de la ficha de 0xD800 = 0x24
	ret			;8b8f
vida_al_acabar:		; los tipos con 0 en p04:8BAA suben el nivel de Snake (y el sonido 0x4D); todos llenan la vida
	ld a,(ix+000h)		;8b90   ; lee el tipo de la ficha de 0xD800
	ld hl,08baah		;8b93
	call 04248h		;8b96   ; byte_de_tabla: A = el byte A de la tabla de HL (y HL apunta a el)
	and a			;8b99
	jr nz,L_8BA2		;8b9a
	call 06278h		;8b9c   ; sube_de_nivel: 0xCAB5 uno mas y la barra de vida 8 puntos mas larga
	call 06c53h		;8b9f   ; sonido_4d: pide el sonido 0x4D
L_8BA2:
	ld a,(0ca52h)		;8ba2   ; la vida llena
	ld (0ca53h),a		;8ba5   ; guarda la vida de Snake (lo largo de la barra)
	jp 042a2h		;8ba8   ; barras_bancos_1_4_5: p00:4288 y los bancos 1, 4 y 5

; ----------------------------------------------------------------------
; DATOS nivel_por_tipo_8BAB: los bytes de los tipos 1-0x0B de la tabla que lee
;   p04:8B93 (0x8BAA + el tipo de la ficha de 0xD800): con 0, acabar con el
;   sube el nivel de Snake
;   0x8bab..0x8bb6  (11 bytes)
DATA_nivel_por_tipo_8BAB:
	defb 000h,001h,000h,000h,000h,000h,000h,001h,001h,001h,000h	; 8bab  ...........

; ======================================================================
; CODIGO 0x8bb6..0x8f2a  (884 bytes)
; ======================================================================


d800_paso_24:		; el paso 0x24: 0xCB3C = 0 y, en la sala del tipo (0x0A en la 0x0A, 9 en la 2, 6 en la 4, los demas en la 3), 0xCB3C = 1
	xor a			;8bb6   ; 0xCB3C = 0
	ld (0cb3ch),a		;8bb7
	ld (ix+016h),a		;8bba   ; el byte 0x16 = 0
	ld a,(ix+000h)		;8bbd   ; lee el tipo de la ficha de 0xD800
	cp 00ah		;8bc0   ; la sala: 0x0A el 0x0A...
	ld b,00ah		;8bc2
	jr z,L_8BD2		;8bc4
	cp 009h		;8bc6   ; ...2 el 9...
	ld b,002h		;8bc8
	jr z,L_8BD2		;8bca
	inc b			;8bcc   ; ...3 los demas...
	cp 006h		;8bcd
	jr nz,L_8BD2		;8bcf
	inc b			;8bd1   ; ...4 el 6
L_8BD2:
	ld a,(0ca4bh)		;8bd2   ; lee la sala de la zona
	cp b			;8bd5
	ret nz			;8bd6
	ld a,001h		;8bd7
	ld (0cb3ch),a		;8bd9
paso_siguiente_d800:		; el paso siguiente
	inc (ix+001h)		;8bdc   ; sube el paso de la ficha de 0xD800
L_8BDF:
	ret			;8bdf
d800_paso_25:		; el paso 0x25: la bandera de 0xD509 (0xD529 el 0x0A) y fuera
	ld a,(ix+000h)		;8be0   ; lee el tipo de la ficha de 0xD800
	cp 00ah		;8be3
	ld hl,0d509h		;8be5
	jr nz,L_8BED		;8be8
	ld hl,0d529h		;8bea
L_8BED:
	ld (hl),001h		;8bed
	jr quita_d800		;8bef
d800_paso_23:		; el paso 0x23: al acabar la espera, deja su cosa (0x23 el 3, 0x24 el 4, 0x29 el 7, 0x2D el 9) con el sonido 0x42
	dec (ix+00eh)		;8bf1   ; baja la espera de la ficha de 0xD800
	ret nz			;8bf4
	ld a,(ix+000h)		;8bf5   ; lee el tipo de la ficha de 0xD800
	cp 003h		;8bf8
	ld c,023h		;8bfa
	jr z,L_8C0E		;8bfc
	inc c			;8bfe
	cp 004h		;8bff
	jr z,L_8C0E		;8c01
	cp 007h		;8c03
	ld c,029h		;8c05
	jr z,L_8C0E		;8c07
	cp 009h		;8c09
	ld c,02dh		;8c0b
	ret nz			;8c0d
L_8C0E:
	call 06c3bh		;8c0e   ; sonido_42: pide el sonido 0x42
	call deja_la_cosa_d800		;8c11   ; deja_la_cosa_d800: la cosa C en la X - 8, la Y - 8 de la ficha
quita_d800:		; fuera: el 9 pone 0xD8A9 = 1 y la 0xD840 de tipo 0x0A; el 5 la 0xD820 de tipo 8
	ld a,(ix+000h)		;8c14   ; lee el tipo de la ficha de 0xD800
	ld b,a			;8c17
	cp 009h		;8c18
	jr nz,L_8C26		;8c1a
	ld a,001h		;8c1c
	ld (0d8a9h),a		;8c1e
	ld a,00ah		;8c21
	ld (0d840h),a		;8c23
L_8C26:
	ld a,b			;8c26
	cp 005h		;8c27
	jr nz,L_8C30		;8c29
	ld a,008h		;8c2b
	ld (0d820h),a		;8c2d
L_8C30:
	xor a			;8c30   ; sin musica de actor, el tipo y el paso a 0, 0xCB3C = 0
	ld (0ca26h),a		;8c31   ; guarda 1 mientras suena la musica de un actor
	ld (ix+000h),a		;8c34   ; guarda el tipo de la ficha de 0xD800
	ld (ix+001h),a		;8c37   ; guarda el paso de la ficha de 0xD800
	ld (0cb3ch),a		;8c3a
	ld a,b			;8c3d   ; salvo el 1 y el 8, los sprites 10-25 fuera
	cp 001h		;8c3e
	ret z			;8c40
	cp 008h		;8c41
	ret z			;8c43
	ld bc,0000fh		;8c44
	jp esconde_desde_10		;8c47   ; esconde_desde_10: BC + 1 bytes de sprites desde el 10 fuera (Y = 0xE0)
deja_la_cosa_d800:		; la cosa C en la X - 8, la Y - 8 de la ficha
	ld a,(ix+005h)		;8c4a   ; lee la X de la ficha de 0xD800
	sub 008h		;8c4d
	ld d,a			;8c4f
	ld a,(ix+003h)		;8c50   ; lee la Y de la ficha de 0xD800
	sub 008h		;8c53
	ld e,a			;8c55
	jp 07ac0h		;8c56   ; a_p02_905e: p02:905E con el banco 2 en 0x8000
bandera_d87f:		; 0xD87F + el tipo = 0xFF
	ld a,(ix+000h)		;8c59   ; lee el tipo de la ficha de 0xD800
	ld hl,0d87fh		;8c5c
	call 0423eh		;8c5f   ; suma_a_hl: HL = HL + A
	ld (hl),0ffh		;8c62
	ret			;8c64
bandera_y_b14e:
	call bandera_d87f		;8c65   ; bandera_d87f: 0xD87F + el tipo = 0xFF
a_p06_b14e_guarda:		; p06:B14E guardando el banco de 0xA000
	ld a,(0c383h)		;8c68   ; lee la copia del banco de 0xA000
	push af			;8c6b
	call 041a0h		;8c6c   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b14eh		;8c6f   ; fin_de_ficha_d800: lo que deja hecho la ficha de 0xD800 (IX) al acabar, segun su tipo (p06:B155; tras p04:8C59): banderas de la partida y la fase
L_8C72:
	pop af			;8c72
	push af			;8c73
	jp 041a3h		;8c74
a_p06_b1da_guarda:		; p06:B1DA guardando el banco de 0xA000
	ld a,(0c383h)		;8c77   ; lee la copia del banco de 0xA000
	push af			;8c7a
	call 041a0h		;8c7b   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b1dah		;8c7e   ; d860_tipo_4: en la zona 7, con 0xD883 distinto de 0xFF, fuera de la sala especial 0x29, la ficha 0xD860 libre y el bit 1 de 0xD7D1: la ficha 0xD860 de tipo 4
	jr L_8C72		;8c81
d800_paso_26:		; el paso 0x26: p10:AD12; al acabar la espera, las rachas de p47:A81B, 0x60 cuadros, 0xD8BA = 1 y el paso siguiente
	call 041cdh		;8c83   ; bancos_10: pone el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0ad12h		;8c86   ; sprites_ad8e: los sprites de p10:AD21 y, cada 8 cuadros (byte 0x0F), el sonido 0x15
	call 04142h		;8c89   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	dec (ix+00eh)		;8c8c   ; baja la espera de la ficha de 0xD800
	ret nz			;8c8f
	call 06f5eh		;8c90   ; rachas_a81b_bancos_5:
	ld (ix+00eh),060h		;8c93   ; la espera de la ficha de 0xD800 = 0x60
	xor a			;8c97
	ld (ix+00fh),a		;8c98
	inc a			;8c9b
	ld (0d8bah),a		;8c9c
	jp paso_siguiente_d800		;8c9f   ; paso_siguiente_d800: el paso siguiente
d800_paso_27:		; el paso 0x27: p10:ADC3 y p10:AE9C con el borde parpadeando; al acabar, los sonidos y la pantalla apagada
	call 041cdh		;8ca2   ; bancos_10: pone el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0adc3h		;8ca5   ; sprites_ae8c: los sprites del juego (byte 0x0F / 4) de p10:AE8C (p10:ADE0) y, cada 8 cuadros, el sonido 0x14
	call 0ae9ch		;8ca8   ; puntos_que_giran: 0x44 puntos de 2 x 2 a negro desde (0x30 + (byte 0x0E / 2 * 11) mod 0x60, 0x80), cada uno 2 mas abajo y 0x1B mas a la derecha (en vuelta de 0x60)
	call 04142h		;8cab   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	dec (ix+00eh)		;8cae   ; baja la espera de la ficha de 0xD800
	jp nz,borde_segun_espera		;8cb1   ; borde_segun_espera:
	xor a			;8cb4
	call borde_parpadea		;8cb5   ; borde_parpadea: R#7: 0x0F o 7 segun el bit 0 de A
	call L_8B3B		;8cb8
	call 045f1h		;8cbb   ; apaga_pantalla_y_sprites: p00:45CC y p00:45F6
	ld (ix+00eh),030h		;8cbe   ; la espera de la ficha de 0xD800 = 0x30
	jp paso_siguiente_d800		;8cc2   ; paso_siguiente_d800: el paso siguiente
d800_paso_29:		; el paso 0x29: 0xCB20 = 0xCB21 = 0, Snake en Y = X = 0x60 mirando abajo, las dos paginas a cero, la sala de nuevo y el sonido 0x64
	push ix		;8cc5
	call 045beh		;8cc7   ; sin desplazamiento ni pantalla partida
	xor a			;8cca
	ld (0d8aeh),a		;8ccb   ; 0xD8AE = 0
	ld (0ca1ch),a		;8cce   ; guarda 1: la pantalla partida en la linea 0xB4 (arriba con desplazamiento, abajo la pagina 1 sin sprites)
	ld (0d8a5h),a		;8cd1   ; 0xD8A5 = 0xD8A4 = 0
	ld (0d8a4h),a		;8cd4
	ld (0d6b0h),a		;8cd7   ; 0xD6B0 = 0
	ld (0cb21h),a		;8cda   ; sin lo elegido ni el estado
	ld (0cb20h),a		;8cdd   ; guarda lo que usa el disparo 1 (0 nada; p02:8001 elige por ello)
	ld (0cb35h),a		;8ce0
	ld (0cb00h),a		;8ce3   ; guarda el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	ld (0cb01h),a		;8ce6   ; guarda el dibujo de Snake (al darse la vuelta se le suma 1, 3 o 5 segun 0xCB00)
	ld (0d760h),a		;8ce9   ; 0xD760 = 0
	inc a			;8cec   ; 0xCB3C = 1
	ld (0cb3ch),a		;8ced
	ld hl,0cc80h		;8cf0   ; las 16 fichas de 0xCC80 a cero
	ld bc,0007fh		;8cf3
	call 04236h		;8cf6   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	ld a,009h		;8cf9   ; la ficha 0xD820 de tipo 9
	ld (0d820h),a		;8cfb   ; 0xD820 = 9
	call quita_d800_b14e		;8cfe   ; quita_d800_b14e: p06:B14E y fuera
	ld d,000h		;8d01   ; la pagina 0...
	call 04be4h		;8d03   ; borra_toda_la_pagina: p00:46FF desde (0,0) con BC = 0 y A = 0 en la pagina D
	ld d,001h		;8d06   ; ...y la 1
	call 04be4h		;8d08   ; borra_toda_la_pagina: p00:46FF desde (0,0) con BC = 0 y A = 0 en la pagina D
	call 07a80h		;8d0b   ; a_p02_9db1: p02:9DB1 con el banco 2 en 0x8000
	call 05df4h		;8d0e   ; p00:5DF4
	call 04270h		;8d11   ; marcador_bancos_1_4_5: rehace el marcador (p00:4279) y deja los bancos 1, 4 y 5
	ld a,001h		;8d14   ; R#7 = 0x0F
	call borde_parpadea		;8d16   ; borde_parpadea: R#7: 0x0F o 7 segun el bit 0 de A
	ld a,060h		;8d19   ; Y = X = 0x60
	ld (0cb03h),a		;8d1b   ; guarda la Y de Snake
	ld (0cb05h),a		;8d1e   ; guarda la X de Snake
	ld a,002h		;8d21   ; mirando abajo
	ld (0cb0eh),a		;8d23   ; guarda la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	call 05010h		;8d26   ; sprites_de_7762:
	call 05476h		;8d29   ; marcador_y_ventana_bancos_5:
	call 0437eh		;8d2c   ; copia_marcador_a_la_otra: copia las lineas 0x16-0x51 de la pagina en la que se dibuja a la otra (YMMM)
	call 04650h		;8d2f   ; espera_vdp: espera a que el VDP acabe la orden en curso (S#2 bit 0)
	ld bc,00600h		;8d32   ; R#6 = 0
	call 00047h		;8d35   ; BIOS WRTVDP - Writes data in the VDP-register
	call 06caeh		;8d38   ; sonido_64: pide el sonido 0x64
	pop ix		;8d3b
	jp 04606h		;8d3d   ; enciende_todo: la pantalla y los sprites encendidos
d800_paso_2a:		; el paso 0x2A: el borde parpadea; al acabar, los sprites 10-17 fuera y el paso siguiente
	dec (ix+00eh)		;8d40   ; baja la espera de la ficha de 0xD800
	jr z,L_8D52		;8d43
borde_segun_espera:
	ld a,(ix+00eh)		;8d45   ; lee la espera de la ficha de 0xD800
borde_parpadea:		; R#7: 0x0F o 7 segun el bit 0 de A
	rra			;8d48
	ld bc,00f07h		;8d49
	jr c,L_8D4F		;8d4c
	ld b,c			;8d4e
L_8D4F:
	jp 00047h		;8d4f   ; BIOS WRTVDP - Writes data in the VDP-register
L_8D52:
	ld bc,0001fh		;8d52
	call esconde_desde_10		;8d55   ; esconde_desde_10: BC + 1 bytes de sprites desde el 10 fuera (Y = 0xE0)
	jp paso_siguiente_d800		;8d58   ; paso_siguiente_d800: el paso siguiente
d800_paso_2b:		; el paso 0x2B: las rachas de p41:BD99, p06:B2D6 y 0x18 cuadros
	xor a			;8d5b
	ld (0d8aeh),a		;8d5c
	call 06fbeh		;8d5f   ; rachas_bd99: las rachas de p41:BD99 a la VRAM de 0xFA00
	call 041a0h		;8d62   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b2d6h		;8d65   ; seis_lanzados_1: 0xD460-0xD4BF a cero, 0xD445 = 1, las 6 fichas de tipo 1 con los bytes 2-4 de p06:B30B y los colores de 0xDAA0 de las rachas de p06:B3B0
	call 04142h		;8d68   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	jp espera_18_y_paso		;8d6b   ; espera_18_y_paso: 0x18 cuadros y el paso siguiente
d800_paso_2d:		; el paso 0x2D: p06:B31D; sin acarreo, fuera
	call 041a0h		;8d6e   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b31dh		;8d71   ; seis_lanzados_1_cada_cuadro: con alguna de las 6 fichas de 0xD460 activa, sus cuentas y sprites (p06:B33B) y acarreo; si no, 0xD445 = 0 y NC
	call 04142h		;8d74   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	ret c			;8d77
quita_d800_b14e:		; p06:B14E y fuera
	call a_p06_b14e_guarda		;8d78   ; a_p06_b14e_guarda: p06:B14E guardando el banco de 0xA000
	jp quita_d800		;8d7b   ; quita_d800: fuera: el 9 pone 0xD8A9 = 1 y la 0xD840 de tipo 0x0A; el 5 la 0xD820 de tipo 8
empieza_la_ronda:		; la ronda del actor (p08:B050 de la zona, la suya en el byte 0x11), su primer tramo y el paso siguiente
	call 041bdh		;8d7e   ; bancos_8: pone el 8 en 0xA000 (con su copia en 0xC381-0xC383)
	call la_ronda		;8d81   ; la_ronda: HL = la ronda del actor: la palabra del byte 0x11 en la tabla de la zona de p08:B050
	call pon_byte_1a		;8d84   ; pon_byte_1a: el byte 0x1A = el bit 6 del tramo
	call direccion_del_tramo		;8d87   ; direccion_del_tramo: la direccion del tramo (bits 0-1) y su velocidad (p06:B592)
	call destino_del_tramo		;8d8a   ; destino_del_tramo: el destino del tramo: la fila y la columna (bytes 0x12-0x13) y el punto (0x14)
	call 04142h		;8d8d   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	ld a,003h		;8d90   ; el byte 0x0F = 3
	ld (ix+00fh),a		;8d92
paso_siguiente_actor:		; el paso siguiente del actor
	inc (ix+001h)		;8d95   ; sube el paso del actor
	ret			;8d98
la_ronda:		; HL = la ronda del actor: la palabra del byte 0x11 en la tabla de la zona de p08:B050
	ld a,(0ca4ah)		;8d99   ; lee la zona
	ld hl,0b050h		;8d9c
	call 043f6h		;8d9f   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld a,(ix+011h)		;8da2
	jp 043f6h		;8da5   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
a_p08_a13b:		; p08:A13B con el banco 8 en 0xA000
	call 041bdh		;8da8   ; bancos_8: pone el 8 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a13bh		;8dab   ; a_oscuras: en las zonas 3-4: con 0xCB21 = 3, la paleta de p56:BCCF; si no, la pagina a cero, el bit 3 de 0xD7E1 y el caracter 0x53 de la sala en un sitio (zona 3: (0x88, 0x28) en la especial 0x0C, (0x48, 0x88) en la sala 0, (0xA8, 0x88) en la 0x10; zona 4: (0x10, 0x48) en la sala 0x0E)
	jr L_8DDB		;8dae
sigue_la_ronda:		; el tramo siguiente de la ronda (byte 0x0F); 0xFF vuelve al principio; con el bit 7, una parada
	call 041bdh		;8db0   ; bancos_8: pone el 8 en 0xA000 (con su copia en 0xC381-0xC383)
	call la_ronda		;8db3   ; la_ronda: HL = la ronda del actor: la palabra del byte 0x11 en la tabla de la zona de p08:B050
	ld d,h			;8db6
	ld e,l			;8db7
	ld a,(ix+00fh)		;8db8
	call 04248h		;8dbb   ; byte_de_tabla: A = el byte A de la tabla de HL (y HL apunta a el)
	inc a			;8dbe
	call z,ronda_al_principio		;8dbf   ; ronda_al_principio: el byte 0x0F a 0
	ld a,(hl)			;8dc2
	rla			;8dc3
	jr c,parada_de_la_ronda		;8dc4
	call pon_byte_1a		;8dc6   ; pon_byte_1a: el byte 0x1A = el bit 6 del tramo
	call direccion_del_tramo		;8dc9   ; direccion_del_tramo: la direccion del tramo (bits 0-1) y su velocidad (p06:B592)
	call destino_del_tramo		;8dcc   ; destino_del_tramo: el destino del tramo: la fila y la columna (bytes 0x12-0x13) y el punto (0x14)
	ld a,(ix+00fh)		;8dcf   ; el tramo siguiente, 3 bytes mas alla
	add a,003h		;8dd2
	ld (ix+00fh),a		;8dd4
	ld (ix+001h),001h		;8dd7   ; el paso 1
L_8DDB:
	jp 04142h		;8ddb   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
ronda_al_principio:		; el byte 0x0F a 0
	ld (ix+00fh),000h		;8dde
	ex de,hl			;8de2
	ret			;8de3
parada_de_la_ronda:		; la parada: el dibujo de la direccion (bits 0-1 * 2), 0x80 cuadros...
	ld a,(hl)			;8de4
	and 003h		;8de5
	add a,a			;8de7
	ld (ix+00dh),a		;8de8   ; guarda el dibujo del actor (bit 0: el paso)
	ld (ix+015h),a		;8deb
	call 04142h		;8dee   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	ld (ix+00ch),000h		;8df1
	ld (ix+00eh),080h		;8df5   ; la espera del actor = 0x80
	inc (ix+00fh)		;8df9
	ld a,(ix+000h)		;8dfc   ; lee el tipo del actor (0 = libre)
	cp 006h		;8dff   ; el tipo 6...
	jp nz,paso_siguiente_actor		;8e01   ; paso_siguiente_actor: el paso siguiente del actor
	ld (ix+00eh),020h		;8e04   ; ...para 0x20 cuadros y alterna los pasos 0x10 y 0x13 (byte 0x2D)
	ld a,(ix+02dh)		;8e08
	inc (ix+02dh)		;8e0b
	rra			;8e0e
	ld a,010h		;8e0f
	jr nc,L_8E15		;8e11
	ld a,013h		;8e13
L_8E15:
	ld (ix+001h),a		;8e15   ; guarda el paso del actor
	ret			;8e18
pon_byte_1a:		; el byte 0x1A = el bit 6 del tramo
	ld a,(hl)			;8e19   ; el bit 6 del tramo...
	rla			;8e1a
	rla			;8e1b
	ld a,000h		;8e1c   ; ...0 o 1
	jr nc,L_8E21		;8e1e
	inc a			;8e20
L_8E21:
	ld (ix+01ah),a		;8e21
	ret			;8e24
a_p06_b592_b_4_5:		; a_p06_b592 y deja los bancos 4 y 5
	call a_p06_b592		;8e25   ; a_p06_b592: p06:B592 con el banco 6 en 0xA000
	jr L_8DDB		;8e28
a_p06_b592_bancos_14:
	call a_p06_b592		;8e2a   ; a_p06_b592: p06:B592 con el banco 6 en 0xA000
	call 0413fh		;8e2d   ; bancos_1_4_5: pone el 1 en 0x6000, el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	jp 041efh		;8e30   ; bancos_14: pone el 14 en 0xA000 (con su copia en 0xC381-0xC383)
direccion_del_tramo:		; la direccion del tramo (bits 0-1) y su velocidad (p06:B592)
	ld a,(hl)			;8e33
	and 003h		;8e34
	inc hl			;8e36
a_p06_b592:		; p06:B592 con el banco 6 en 0xA000
	call 041a0h		;8e37   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b592h		;8e3a   ; velocidad_del_tramo: las velocidades del actor para la direccion A: con alerta 1 de p06:B68B, 2-3 de p06:B69B; sin ella, de p06:B65B segun el byte 0x19 (16 bytes cada uno); con el byte 0x19 >= 3 (salvo el tipo 3), parado y la direccion 1 (3 en la zona 0x0C); el dibujo, la direccion * 2
	jp 041bdh		;8e3d   ; bancos_8: pone el 8 en 0xA000 (con su copia en 0xC381-0xC383)
velocidad_de_tabla:		; las dos velocidades del actor de la tabla DE (4 bytes por direccion C) y el byte 0x0C (1 vertical, 2 horizontal)
	ld a,c			;8e40
	add a,a			;8e41
	add a,a			;8e42
	call 04243h		;8e43   ; suma_a_de: DE = DE + A
	ld a,(de)			;8e46
	ld (ix+006h),a		;8e47   ; guarda la velocidad del actor en Y (baja)
	inc de			;8e4a
	ld a,(de)			;8e4b
	ld (ix+007h),a		;8e4c   ; guarda la velocidad del actor en Y (alta)
	inc de			;8e4f
	ld a,(de)			;8e50
	ld (ix+008h),a		;8e51   ; guarda la velocidad del actor en X (baja)
	inc de			;8e54
	ld a,(de)			;8e55
	ld (ix+009h),a		;8e56   ; guarda la velocidad del actor en X (alta)
	ld a,c			;8e59   ; 0 y 1: el byte 0x0C = 1; 2 y 3: 2
	cp 002h		;8e5a
	ld a,001h		;8e5c
	jr c,L_8E61		;8e5e
	inc a			;8e60
L_8E61:
	ld (ix+00ch),a		;8e61
	ret			;8e64
destino_del_tramo:		; el destino del tramo: la fila y la columna (bytes 0x12-0x13) y el punto (0x14)
	ld a,(hl)			;8e65
	call nibbles		;8e66   ; nibbles: E = el nibble alto de A, D = el bajo
	ld (ix+012h),e		;8e69
	ld (ix+013h),d		;8e6c
	inc hl			;8e6f
	ld a,(hl)			;8e70
	ld (ix+014h),a		;8e71
	ret			;8e74
nibbles:		; E = el nibble alto de A, D = el bajo
	push af			;8e75
	rrca			;8e76   ; el nibble alto...
	rrca			;8e77
	rrca			;8e78
	rrca			;8e79
	and 00fh		;8e7a
	ld e,a			;8e7c   ; ...a E
	pop af			;8e7d
	and 00fh		;8e7e   ; el bajo a D
	ld d,a			;8e80
	ret			;8e81
llega_al_destino:		; en la sala del destino, acarreo si aun no ha llegado al punto (segun hacia donde va)
	ld a,(ix+00ah)		;8e82   ; lee la fila de la sala del actor
	cp (ix+012h)		;8e85
	jr nz,L_8EB9		;8e88
	ld a,(ix+00bh)		;8e8a   ; lee la columna de la sala del actor
	cp (ix+013h)		;8e8d
	jr nz,L_8EB9		;8e90
	ld a,(ix+00ch)		;8e92   ; en vertical, la Y; en horizontal, la X
	rra			;8e95
	ld a,(ix+003h)		;8e96   ; lee la Y del actor
	ld b,(ix+007h)		;8e99   ; lee la velocidad del actor en Y (alta)
	jr c,L_8EA4		;8e9c
	ld a,(ix+005h)		;8e9e   ; lee la X del actor
	ld b,(ix+009h)		;8ea1   ; lee la velocidad del actor en X (alta)
L_8EA4:
	ld c,(ix+014h)		;8ea4   ; C = el punto de destino
	rl b		;8ea7   ; hacia atras, contando desde el otro lado
	jr c,L_8EB7		;8ea9   ; hacia delante: tal cual
	neg		;8eab   ; hacia atras: los dos dados la vuelta (- 0x40)
	sub 040h		;8ead
	ld b,a			;8eaf
	ld a,c			;8eb0
	neg		;8eb1
	sub 040h		;8eb3
	ld c,a			;8eb5
	ld a,b			;8eb6
L_8EB7:
	cp c			;8eb7
	ret c			;8eb8
L_8EB9:
	call a_p14_b88f_guarda		;8eb9   ; p14:B88F y sin acarreo
	or a			;8ebc
	ret			;8ebd
a_p06_b5fb_guarda:		; p06:B5FB guardando el banco de 0xA000
	ld a,(0c383h)		;8ebe   ; lee la copia del banco de 0xA000
	push af			;8ec1
	call 041a0h		;8ec2   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b5fbh		;8ec5   ; actor_al_paso_8: salvo en los pasos 8-9: el paso al byte 0x20 y el paso 8, 0x3C cuadros (byte 0x1C), el byte 0x0C al 0x22 y a 0, y el dibujo & 7 (tambien al byte 0x15)
L_8EC8:
	pop af			;8ec8
	push af			;8ec9
	jp 041a3h		;8eca
a_p06_b626_guarda:		; p06:B626 guardando el banco de 0xA000
	ld a,(0c383h)		;8ecd   ; lee la copia del banco de 0xA000
	push af			;8ed0
	call 041a0h		;8ed1   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b626h		;8ed4   ; paso_8_cuenta: la cuenta del byte 0x1C: el dibujo segun la cuenta (+0, +1 u +8 sobre el byte 0x15 & 6; no en el tipo 0x0B) y NZ; al acabar, con alerta 2 o mas p04:8EF2, si no, 0x48 cuadros y el paso siguiente
	jr L_8EC8		;8ed7
actor_paso_9:		; el paso 9: los tipos 0x0B y 0x0C, o al acabar la espera, vuelven a lo de antes (bytes 0x20, 0x22, 0x15)
	ld a,(ix+000h)		;8ed9   ; lee el tipo del actor (0 = libre)
	cp 00bh		;8edc
	jr z,L_8EF2		;8ede
	cp 00ch		;8ee0
	jr z,L_8EF2		;8ee2
	dec (ix+00eh)		;8ee4   ; baja la espera del actor
	jr z,L_8EF2		;8ee7
L_8EE9:
	ld a,(0ca03h)		;8ee9   ; cada 8 cuadros, p06:B5E2
	and 007h		;8eec
	ret nz			;8eee
	jp a_p06_b5e2		;8eef   ; a_p06_b5e2: p06:B5E2 con el banco 6 en 0xA000
L_8EF2:
	ld a,(ix+022h)		;8ef2   ; lo de antes...
	ld (ix+00ch),a		;8ef5
	ld a,(ix+020h)		;8ef8
	ld (ix+001h),a		;8efb   ; guarda el paso del actor
	ld a,(ix+015h)		;8efe
	ld (ix+00dh),a		;8f01   ; guarda el dibujo del actor (bit 0: el paso)
	ld (ix+010h),003h		;8f04   ; ...el byte 0x10 = 3 y 0x10 cuadros
	ld (ix+00eh),010h		;8f08   ; la espera del actor = 0x10
	ret			;8f0c
a_p06_b5e2:		; p06:B5E2 con el banco 6 en 0xA000
	call 041a0h		;8f0d   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b5e2h		;8f10   ; dibujo_siguiente_b6bb: el dibujo siguiente: su orden en p06:B6BB, uno mas (de 0 a 0x0B, en vuelta) y el dibujo de p06:B6CB
	jp 04142h		;8f13   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
actor_por_paso:		; si no se ve, nada; el paso 8 p06:B626, el 9 p04:8ED9, los demas por p04:8F2A
	call se_ve_el_actor_si		;8f16   ; se_ve_el_actor_si: p14:B9DC guardando HL, DE y BC
	ret c			;8f19
	ld a,(ix+001h)		;8f1a   ; lee el paso del actor
	cp 008h		;8f1d
	jp z,a_p06_b626_guarda		;8f1f   ; a_p06_b626_guarda: p06:B626 guardando el banco de 0xA000
	cp 009h		;8f22
	jp z,actor_paso_9		;8f24   ; actor_paso_9: el paso 9: los tipos 0x0B y 0x0C, o al acabar la espera, vuelven a lo de antes (bytes 0x20, 0x22, 0x15)
	call 0424dh		;8f27   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_8F2A: 4 destinos del despachador p00:424D (call en p04:8F27, el
;   indice en A): 8F32, 8F56, 8FAD, 8FBB; lo leen p04:8F27 (8 bytes)
;   0x8f2a..0x8f32  (8 bytes)
DATA_tabla_8F2A:
	defw 08f32h,08f56h,08fadh,08fbbh	; 8f2a  -> actor_paso_0 actor_paso_1 actor_paso_2 actor_paso_3

; ======================================================================
; CODIGO 0x8f32..0x915c  (554 bytes)
; ======================================================================


actor_paso_0:		; el paso 0: tras la espera del byte 0x1C, va hacia Snake por el eje mas largo (p04:90A9, p04:908C) un rato al azar
	ld a,(ix+01ch)		;8f32
	and a			;8f35
	jr z,L_8F3C		;8f36
	dec (ix+01ch)		;8f38
	ret nz			;8f3b
L_8F3C:
	call lados_de_snake		;8f3c   ; lados_de_snake: B = los lados en los que esta Snake: bit 0 arriba, 1 abajo, 2 izquierda, 3 derecha
	call eje_hacia_snake		;8f3f   ; eje_hacia_snake: A = 3 si Snake esta mas lejos en Y, 0x0C si en X
	and b			;8f42
	call primer_bit		;8f43   ; primer_bit: C = el primer bit a uno de A (0-3)
	call a_p06_b592		;8f46   ; a_p06_b592: p06:B592 con el banco 6 en 0xA000
	call 04256h		;8f49   ; 8-23 cuadros
	and 00fh		;8f4c
	add a,008h		;8f4e
	ld (ix+00eh),a		;8f50   ; guarda la espera del actor
	jp paso_siguiente_actor		;8f53   ; paso_siguiente_actor: el paso siguiente del actor
actor_paso_1:		; el paso 1: anda; si choca de frente, o se acaba la espera, cambia de direccion (p04:8FD4)
	call choques_del_actor		;8f56   ; choques_del_actor: C = por donde choca el actor (bits 0-3), con los puntos de p04:915C (o p04:9164 desde 0xD800)
	ld a,(ix+00dh)		;8f59   ; la direccion de su dibujo: 1, 2, 4 u 8
	rrca			;8f5c
	and 003h		;8f5d
	ld b,001h		;8f5f
	jr z,L_8F70		;8f61
	dec a			;8f63
	ld b,002h		;8f64
	jr z,L_8F70		;8f66
	dec a			;8f68
	ld b,004h		;8f69
	jr z,L_8F70		;8f6b
	dec a			;8f6d
	ld b,008h		;8f6e
L_8F70:
	ld a,b			;8f70   ; choca por alli?
	and c			;8f71
	jr nz,L_8F79		;8f72
	dec (ix+00eh)		;8f74   ; baja la espera del actor
	jr nz,L_8F95		;8f77
L_8F79:
	call direccion_libre		;8f79   ; la direccion nueva...
	push af			;8f7c
	call da_la_vuelta_por_eje		;8f7d   ; ...da la vuelta...
	pop af			;8f80
	call a_p06_b592		;8f81   ; ...con su velocidad...
	ld (ix+00eh),004h		;8f84   ; ...4 cuadros parado y el paso siguiente
	ld a,(ix+00ch)		;8f88
	ld (ix+016h),a		;8f8b
	ld (ix+00ch),000h		;8f8e
	jp paso_siguiente_actor		;8f92   ; paso_siguiente_actor: el paso siguiente del actor
L_8F95:
	ld b,004h		;8f95   ; anda: el paso del dibujo cada 4
	jp L_9022		;8f97
da_la_vuelta_por_eje:		; en vertical, la Y al reves; en horizontal, la X; y p14:BA36
	ld a,(ix+00ch)		;8f9a
	ld b,a			;8f9d
	rra			;8f9e
	jr nc,L_8FA6		;8f9f
	call vuelve_en_y		;8fa1   ; vuelve_en_y: la velocidad en Y cambiada de signo
	jr L_8FA9		;8fa4
L_8FA6:
	call vuelve_en_x		;8fa6   ; vuelve_en_x: la velocidad en X cambiada de signo
L_8FA9:
	ld a,b			;8fa9
	jp llama_ba36_a		;8faa   ; llama_ba36_a:
actor_paso_2:		; el paso 2: al acabar la espera, p04:9B4D, 2 cuadros y el paso siguiente
	dec (ix+00eh)		;8fad   ; baja la espera del actor
	ret nz			;8fb0
	call lanza_4		;8fb1   ; lanza_4: p06:A942 y lo lanzado de tipo 4 hacia Snake
	ld (ix+00eh),002h		;8fb4   ; la espera del actor = 0x02
	jp paso_siguiente_actor		;8fb8   ; paso_siguiente_actor: el paso siguiente del actor
actor_paso_3:		; el paso 3: al acabar la espera, otra de 16-47 cuadros, el eje de antes y el paso 1
	dec (ix+00eh)		;8fbb   ; baja la espera del actor
	ret nz			;8fbe
	call 04256h		;8fbf   ; azar: A = un numero al azar (0xCA03 rotado mas R)
	and 01fh		;8fc2
	or 010h		;8fc4
	ld (ix+00eh),a		;8fc6   ; guarda la espera del actor
	ld a,(ix+016h)		;8fc9
	ld (ix+00ch),a		;8fcc
	ld (ix+001h),001h		;8fcf   ; el paso del actor = 0x01
	ret			;8fd3
direccion_libre:		; A = una direccion hacia Snake que no choca; si no hay, una libre al azar
	call choques_del_actor		;8fd4   ; choques_del_actor: C = por donde choca el actor (bits 0-3), con los puntos de p04:915C (o p04:9164 desde 0xD800)
	call lados_de_snake		;8fd7   ; lados_de_snake: B = los lados en los que esta Snake: bit 0 arriba, 1 abajo, 2 izquierda, 3 derecha
	call eje_hacia_snake		;8fda   ; eje_hacia_snake: A = 3 si Snake esta mas lejos en Y, 0x0C si en X
	and b			;8fdd
	ld d,a			;8fde
	ld e,c			;8fdf
	ld hl,00400h		;8fe0   ; 4 direcciones
L_8FE3:
	xor a			;8fe3   ; libre (C) y hacia Snake (D)...
	rr e		;8fe4
	rla			;8fe6
	rr d		;8fe7
	jr nc,L_8FF0		;8fe9
	and a			;8feb
	jr nz,L_8FF0		;8fec
	ld a,l			;8fee   ; ...esa
	ret			;8fef
L_8FF0:
	dec h			;8ff0
	inc l			;8ff1
	jr nz,L_8FE3		;8ff2
	call 04256h		;8ff4   ; si no, la primera o la segunda libre, al azar
	and 001h		;8ff7
	inc a			;8ff9
	ld d,a			;8ffa
	ld a,c			;8ffb
	ld b,003h		;8ffc
	ld e,000h		;8ffe
L_9000:
	rra			;9000
	jr c,L_9006		;9001
	dec d			;9003
	jr z,L_9009		;9004
L_9006:
	inc e			;9006
	djnz L_9000		;9007
L_9009:
	ld a,e			;9009
	ret			;900a
L_900B:
	ld a,(ix+019h)		;900b   ; la rapidez del paso: 0 cada 4 cuadros, 1 cada 3, 2 cada 2, 3 cada cuadro (solo el tipo 3)
	and a			;900e
	ld b,004h		;900f
	jr z,L_9022		;9011
	dec b			;9013
	dec a			;9014
	jr z,L_9022		;9015
	dec b			;9017
	dec a			;9018
	jr z,L_9022		;9019
	dec b			;901b
	ld a,(ix+000h)		;901c   ; lee el tipo del actor (0 = libre)
	cp 003h		;901f
	ret nz			;9021
L_9022:
	inc (ix+018h)		;9022
	ld a,(ix+018h)		;9025
	cp b			;9028
	ret c			;9029
	ld (ix+018h),000h		;902a
L_902E:
	ld a,(ix+00dh)		;902e   ; cambia el bit 0 del dibujo
	rra			;9031
	ccf			;9032
	rla			;9033
	ld (ix+00dh),a		;9034   ; guarda el dibujo del actor (bit 0: el paso)
	ret			;9037
choca_de_frente:		; A = los choques (C) en su eje: 3 vertical, 0x0C horizontal
	call choques_del_actor		;9038   ; choques_del_actor: C = por donde choca el actor (bits 0-3), con los puntos de p04:915C (o p04:9164 desde 0xD800)
	ld a,(ix+00ch)		;903b
	rra			;903e
	ld a,003h		;903f
	jr c,L_9045		;9041
	ld a,00ch		;9043
L_9045:
	and c			;9045
	ret			;9046
cerca_de_d41c:		; por su eje, si esta a menos de C del borde y del lado de 0xD41C-0xD41D
	exx			;9047
	ld hl,0d41ch		;9048   ; apunta a la Y y la X a las que acuden los actores (16 bits)
	ld de,0d41dh		;904b
	exx			;904e
	ld a,(ix+00ch)		;904f
	rra			;9052
	ld bc,020a0h		;9053
	ld d,(ix+007h)		;9056   ; lee la velocidad del actor en Y (alta)
	ld e,(ix+003h)		;9059   ; lee la Y del actor
	jr c,L_906A		;905c
	ld bc,008b0h		;905e
	ld d,(ix+009h)		;9061   ; lee la velocidad del actor en X (alta)
	ld e,(ix+005h)		;9064   ; lee la X del actor
	exx			;9067
	ex de,hl			;9068
	exx			;9069
L_906A:
	ld a,e			;906a   ; la distancia al borde...
	sub b			;906b
	cp c			;906c   ; ...menor que C...
	ret nc			;906d
	rl d		;906e   ; ...y del lado hacia el que va...
	exx			;9070
	ld a,(hl)			;9071   ; ...contra 0xD41C-0xD41D
	exx			;9072
	jr c,L_9078		;9073
	cp e			;9075
	ccf			;9076
	ret			;9077
L_9078:
	cp e			;9078
	ret			;9079
primer_bit:		; C = el primer bit a uno de A (0-3)
	ld bc,00300h		;907a
L_907D:
	rra			;907d
	jr c,L_9083		;907e
	inc c			;9080
	djnz L_907D		;9081
L_9083:
	ld a,c			;9083
	ret			;9084
x_y_de_snake:		; H = la Y, L = la X de Snake
	call y_x_de_snake_en_hl		;9085   ; y_x_de_snake_en_hl: L = la Y, H = la X de Snake
	ld a,h			;9088
	ld h,l			;9089
	ld l,a			;908a
	ret			;908b
eje_hacia_snake:		; A = 3 si Snake esta mas lejos en Y, 0x0C si en X
	call x_y_de_snake		;908c   ; x_y_de_snake: H = la Y, L = la X de Snake
eje_hacia_hl:
	ld d,(ix+003h)		;908f   ; lee la Y del actor
	ld e,(ix+005h)		;9092   ; lee la X del actor
eje_hacia:
	ld a,h			;9095
	sub d			;9096
	jr nc,L_909B		;9097
	neg		;9099
L_909B:
	ld h,a			;909b
	ld a,l			;909c
	sub e			;909d
	jr nc,L_90A2		;909e
	neg		;90a0
L_90A2:
	cp h			;90a2
	ld a,003h		;90a3
	ret c			;90a5
	ld a,00ch		;90a6
	ret			;90a8
lados_de_snake:		; B = los lados en los que esta Snake: bit 0 arriba, 1 abajo, 2 izquierda, 3 derecha
	call x_y_de_snake		;90a9   ; x_y_de_snake: H = la Y, L = la X de Snake
lados_de_hl:
	ld d,(ix+003h)		;90ac   ; lee la Y del actor
	ld e,(ix+005h)		;90af   ; lee la X del actor
lados_de:
	ld b,000h		;90b2   ; B = 0
	ld a,h			;90b4
	sub d			;90b5   ; la Y...
	jr nc,L_90BC		;90b6
	set 0,b		;90b8   ; ...menor: bit 0
	jr L_90BE		;90ba
L_90BC:
	set 1,b		;90bc
L_90BE:
	ld a,l			;90be
	sub e			;90bf
	jr nc,L_90C5		;90c0
	set 2,b		;90c2
	ret			;90c4
L_90C5:
	set 3,b		;90c5
	ret			;90c7
choques_del_actor:		; C = por donde choca el actor (bits 0-3), con los puntos de p04:915C (o p04:9164 desde 0xD800)
	ld h,(ix+005h)		;90c8   ; lee la X del actor
	ld l,(ix+003h)		;90cb   ; lee la Y del actor
choques_en_hl:
	ld c,000h		;90ce
	call choques_lejos		;90d0   ; primero los de p04:9120
	push hl			;90d3
	push ix		;90d4
	pop hl			;90d6
	ld de,0d800h		;90d7   ; apunta a 4 fichas de 0x20 bytes de 0xD800 (p04:89C3); sus tipos los lleva p10
	call 00020h		;90da   ; BIOS DCOMPR - Compares HL with DE
	ld de,0915ch		;90dd
	jr c,L_90E5		;90e0
	ld de,09164h		;90e2
L_90E5:
	pop hl			;90e5
	xor a			;90e6
	ld (0d4e6h),a		;90e7
cuatro_puntos:		; 4 puntos [dy][dx]: el solido pone su bit
	ld b,004h		;90ea
L_90EC:
	push hl			;90ec   ; el punto [dy][dx]...
	push bc			;90ed
	ld a,(de)			;90ee
	add a,l			;90ef
	ld l,a			;90f0
	inc de			;90f1
	ld a,(de)			;90f2
	add a,h			;90f3   ; ...mas (H, L)
	ld h,a			;90f4
	inc de			;90f5
	push de			;90f6
	call solido_para_actor		;90f7   ; solido?
	pop de			;90fa
	pop bc			;90fb
	pop hl			;90fc
	call c,bit_del_choque		;90fd   ; si: su bit
	djnz L_90EC		;9100
	or a			;9102   ; sin acarreo
	ret			;9103
bit_del_choque:		; los puntos 1-2 un bit y 3-4 otro (0-1 la primera tanda, 2-3 la segunda)
	ld a,(0d4e6h)		;9104   ; la primera tanda...
	and a			;9107
	jr nz,L_9115		;9108
	ld a,b			;910a   ; ...los puntos 3-4: el bit 0
	cp 003h		;910b
	jr c,L_9112		;910d
	set 0,c		;910f
	ret			;9111
L_9112:
	set 1,c		;9112
	ret			;9114
L_9115:
	ld a,b			;9115
	cp 003h		;9116
	jr c,L_911D		;9118
	set 2,c		;911a
	ret			;911c
L_911D:
	set 3,c		;911d
	ret			;911f
choques_lejos:		; la segunda tanda de puntos (p04:916C, o p04:9174 desde 0xD800)
	push hl			;9120
	push ix		;9121
	pop hl			;9123
	ld de,0d800h		;9124   ; apunta a 4 fichas de 0x20 bytes de 0xD800 (p04:89C3); sus tipos los lleva p10
	call 00020h		;9127   ; BIOS DCOMPR - Compares HL with DE
	ld de,0916ch		;912a
	jr c,L_9132		;912d
	ld de,09174h		;912f
L_9132:
	pop hl			;9132
	ld a,001h		;9133
	ld (0d4e6h),a		;9135
	jr cuatro_puntos		;9138
solido_para_actor:		; es solido? con la zona 7 sala 9, el umbral bajo en 0x30
	ld de,(0ca4eh)		;913a   ; lee el umbral de los caracteres 0x00-0x80 de la sala (de p56:A727; p00:5C28) y el byte siguiente (16 bits)
	push de			;913e
	ld a,(0ca4ah)		;913f   ; lee la zona
	cp 007h		;9142
	jr nz,L_914F		;9144
	ld a,(0ca4bh)		;9146   ; lee la sala de la zona
	cp 009h		;9149
	jr nz,L_914F		;914b
	ld e,030h		;914d
L_914F:
	ld (0ca4eh),de		;914f   ; guarda el umbral de los caracteres 0x00-0x80 de la sala (de p56:A727; p00:5C28) y el byte siguiente (16 bits)
	call 07f3dh		;9153   ; es_solido_si: acarreo si el caracter del mapa en (H = X, L = Y) llega al umbral de 0xCA4E (0xCA4F desde 0x81)
	pop de			;9156
	ld (0ca4eh),de		;9157   ; guarda el umbral de los caracteres 0x00-0x80 de la sala (de p56:A727; p00:5C28) y el byte siguiente (16 bits)
	ret			;915b

; ----------------------------------------------------------------------
; DATOS resto_915C: lo apuntan con el banco puesto p04:90DD (0x915C), p04:90E2
;   (0x9164), p04:912A (0x916C), p04:912F (0x9174); el tamano es lo que hay
;   hasta lo siguiente, no sale de recorrerlo; lo leen p04:90DD, p04:90E2,
;   p04:912A, p04:912F (32 bytes)
;   0x915c..0x917c  (32 bytes)
DATA_resto_915C:
	defb 0f8h,0fch,0f8h,003h,002h,0fch,002h,003h,0f6h,0fch,0f6h,003h,004h,0fch,004h,003h	; 915c  ................
	defb 0fah,0f8h,0feh,0f8h,0fah,007h,0feh,007h,0fah,0f5h,000h,0f5h,0fah,009h,000h,009h	; 916c  ................

; ======================================================================
; CODIGO 0x917c..0x96ff  (1411 bytes)
; ======================================================================


alerta_cada_cuadro:		; con 4 que siguen o desde la zona 0x10, p00:5A0F; en la 0x0C desde la sala 3, tambien
	ld a,(0caa0h)		;917c   ; lee cuantos siguen a Snake por su rastro (1-4)
	cp 004h		;917f
	jp z,05a0fh		;9181   ; d41a_y_compania: C = 0
	ld a,(0ca4ah)		;9184   ; lee la zona
	cp 010h		;9187
	jp nc,05a0fh		;9189   ; d41a_y_compania: C = 0
	cp 00ch		;918c
	jr nz,L_919B		;918e
	ld a,(0ca4bh)		;9190   ; lee la sala de la zona
	cp 003h		;9193
	jp c,05a0fh		;9195   ; d41a_y_compania: C = 0
	call 05a0fh		;9198   ; d41a_y_compania: C = 0
L_919B:
	ld a,(0ca5fh)		;919b   ; segun la alerta: 1 p04:921D, 2 p04:91AF, 3 fuera de la especial 0x31 se acaba
	and a			;919e
	ret z			;919f
	dec a			;91a0
	jr z,alerta_1		;91a1
	dec a			;91a3
	jr z,alerta_2		;91a4
	ld a,(0ca76h)		;91a6   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 031h		;91a9
	ret z			;91ab
	jp acaba_la_alerta		;91ac   ; acaba_la_alerta: los actores de otras salas fuera, la alerta a 0 y p04:94B2
alerta_2:		; la alerta 2: los actores que se ven en esta sala pasan a tipo 1 o 2 (los 2-3, 2) y paso 0
	call mira_b_de_bdb8		;91af   ; mira_b_de_bdb8: por lo que da p15:BDB8: 1 se acaba la alerta, 2 p04:94A2, 3 p04:9488; Z si se acabo
	ret z			;91b2
	call a_p06_b532_guarda		;91b3   ; a_p06_b532_guarda: p06:B532 guardando el banco de 0xA000
	jp z,acaba_la_alerta		;91b6   ; acaba_la_alerta: los actores de otras salas fuera, la alerta a 0 y p04:94B2
	call alerta_3_en_4_6		;91b9   ; alerta_3_en_4_6: en la zona 4 sala 6, la alerta al menos 3
	ld ix,0ce00h		;91bc   ; apunta a los actores: 24 fichas de 0x40 bytes (p04:800D)
	ld bc,01800h		;91c0
	ld de,00040h		;91c3
L_91C6:
	ld a,(ix+000h)		;91c6   ; cada actor...
	and a			;91c9
	jr z,L_91FD		;91ca
	call se_ve_el_actor_si		;91cc   ; se_ve_el_actor_si: p14:B9DC guardando HL, DE y BC
	jr c,L_91FD		;91cf
	call en_esta_sala		;91d1   ; en_esta_sala: Z si el actor esta en la sala de ahora (fila y columna)
	jr nz,L_91FD		;91d4
	ld a,(ix+000h)		;91d6   ; ...el 0x15: p14:B34F
	and 07fh		;91d9
	cp 015h		;91db
	jr z,alerta_del_15		;91dd
	cp 010h		;91df
	jr nc,L_91FD		;91e1
	cp 00ch		;91e3   ; ...el 0x0C y los de 0x10 en adelante no
	jr z,L_91F5		;91e5
	cp 00ah		;91e7
	jr z,L_91F9		;91e9
	sub 002h		;91eb
	cp 002h		;91ed
	ld a,001h		;91ef
	jr nc,L_91F5		;91f1
	ld a,002h		;91f3
L_91F5:
	ld (ix+001h),000h		;91f5   ; el paso del actor = 0x00
L_91F9:
	ld (ix+000h),a		;91f9   ; guarda el tipo del actor (0 = libre)
	inc c			;91fc
L_91FD:
	add ix,de		;91fd
	djnz L_91C6		;91ff
	call sin_llegadas		;9201   ; con p04:96BA sin acarreo...
	ret c			;9204
	call 05a11h		;9205   ; ...0xD41A = 0xD41F = 2...
	ld a,c			;9208   ; ...y si ninguno cambio, 0xCA60 uno mas
	and a			;9209
	ret nz			;920a
	ld hl,0ca60h		;920b
	inc (hl)			;920e
	ret			;920f
alerta_del_15:
	push ix		;9210
	push bc			;9212
	push de			;9213
	call a_p14_b34f_guarda		;9214   ; a_p14_b34f_guarda: p14:B34F guardando el banco de 0xA000
	pop de			;9217
	pop bc			;9218
	pop ix		;9219
	jr L_91FD		;921b
alerta_1:		; la alerta 1: se acaba si p04:9278 o p04:926C; con 0xD42A, se acaba ya
	call mira_b_de_bdb8		;921d   ; mira_b_de_bdb8: por lo que da p15:BDB8: 1 se acaba la alerta, 2 p04:94A2, 3 p04:9488; Z si se acabo
	ret z			;9220
	call a_p06_b532_guarda		;9221   ; a_p06_b532_guarda: p06:B532 guardando el banco de 0xA000
	jp z,acaba_la_alerta		;9224   ; acaba_la_alerta: los actores de otras salas fuera, la alerta a 0 y p04:94B2
	ld hl,0d42ah		;9227
	ld a,(hl)			;922a
	and a			;922b
	jr z,L_9232		;922c
	ld (hl),000h		;922e
	jr acaba_la_alerta		;9230
L_9232:
	ld hl,(0ca50h)		;9232   ; la sala de ahora contra la de 0xD428...
	ld de,(0d428h)		;9235
	ld a,h			;9239
	sub d			;923a
	jr nc,L_923F		;923b
	neg		;923d
L_923F:
	cp 002h		;923f   ; a dos salas o mas en fila...
	jr nc,acaba_la_alerta		;9241
	ld a,l			;9243   ; ...o en columna...
	sub e			;9244
	jr nc,L_9249		;9245
	neg		;9247
L_9249:
	cp 002h		;9249
	ret c			;924b   ; cerca: sigue
acaba_la_alerta:		; los actores de otras salas fuera, la alerta a 0 y p04:94B2
	call fuera_de_otras_salas		;924c   ; fuera_de_otras_salas: los actores (por debajo de 0x10) de otras salas fuera; el 0x0A sin alerta 2-3, de los pasos 1-3 al 0
	xor a			;924f
	ld (0ca5fh),a		;9250   ; guarda la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	jp actores_como_antes		;9253   ; actores_como_antes: los actores como antes y, sin 0xC697, la musica de la zona con la orden 0xF4
alerta_3_en_4_6:		; en la zona 4 sala 6, la alerta al menos 3
	ld a,(0ca4ah)		;9256   ; lee la zona
	cp 004h		;9259
	ret nz			;925b
	ld a,(0ca4bh)		;925c   ; lee la sala de la zona
	cp 006h		;925f
	ret nz			;9261
	ld hl,0ca5fh		;9262   ; apunta a la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	ld a,(hl)			;9265
	cp 003h		;9266
	ret nc			;9268
	ld (hl),003h		;9269
	ret			;926b
a_p06_b532_guarda:		; p06:B532 guardando el banco de 0xA000
	ld a,(0c383h)		;926c   ; lee la copia del banco de 0xA000
	push af			;926f
	call 041a0h		;9270   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b532h		;9273   ; alerta_en_b552: Z con alerta en las zonas y salas de p06:B552 (4 parejas); NZ en las demas o sin alerta
	jr L_92A4		;9276
mira_b_de_bdb8:		; por lo que da p15:BDB8: 1 se acaba la alerta, 2 p04:94A2, 3 p04:9488; Z si se acabo
	call a_p15_bdb8_guarda		;9278   ; a_p15_bdb8_guarda: p15:BDB8 guardando el banco de 0xA000
	ld a,b			;927b
	dec b			;927c
	jp z,acaba_la_alerta		;927d   ; acaba_la_alerta: los actores de otras salas fuera, la alerta a 0 y p04:94B2
	dec b			;9280
	jp z,alerta_a_0		;9281   ; alerta_a_0: los de otras salas fuera, la alerta a 0 y los actores como antes (p04:94DA)
	dec b			;9284
	jp z,alerta_acaba_con_lineas		;9285   ; alerta_acaba_con_lineas: se acaba la alerta (p04:94A2) y las lineas de p00:439D en las dos paginas
	or 001h		;9288
	ret			;928a
a_p15_bdb8_guarda:		; p15:BDB8 guardando el banco de 0xA000
	ld a,(0c383h)		;928b   ; lee la copia del banco de 0xA000
	push af			;928e
	call 041f7h		;928f   ; bancos_15: pone el 15 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0bdb8h		;9292   ; mira_alerta_d800: de las 4 fichas de 0xD800, la primera que da algo por su tipo (p15:BDCE): B = 0 nada, 1 se acaba la alerta, 2 o 3 (p04:9278)
vuelve_banco_a000_b:		; el banco de 0xA000 de antes
	pop af			;9295
L_9296:
	push af			;9296
	jp 041a3h		;9297
a_p06_b55a_guarda:		; p06:B55A guardando el banco de 0xA000 (y su acarreo)
	ld a,(0c383h)		;929a   ; lee la copia del banco de 0xA000
	push af			;929d
	call 041a0h		;929e   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b55ah		;92a1   ; alguien_ve_a_snake: acarreo si alguno de los 24 actores de tipo 1-0x0F se ve (p04:806F) y esta en esta sala (el 0x0A no en el paso 0)
L_92A4:
	pop bc			;92a4
	ld a,b			;92a5
	jr L_9296		;92a6
a_p15_be48_guarda:		; p15:BE48 guardando el banco de 0xA000
	ld a,(0c383h)		;92a8   ; lee la copia del banco de 0xA000
	push af			;92ab
	call 041f7h		;92ac   ; bancos_15: pone el 15 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0be48h		;92af   ; cuenta_alerta_1: la cuenta de la alerta 1 (0xD42B) por el nivel de Snake: la palabra de 0xBE54 (0x78, 0x78, 0x90, 0xA0, 0xA0, 0xA0, 0xC8, 0xC8); la rutina no lleva ret y sigue por esa tabla como instrucciones: sub b deja Z y el ret z del byte 0xC8 vuelve
	jr vuelve_banco_a000_b		;92b2
a_p15_be64_guarda:		; p15:BE64 guardando el banco de 0xA000
	ld a,(0c383h)		;92b4   ; lee la copia del banco de 0xA000
	push af			;92b7
	call 041f7h		;92b8   ; bancos_15: pone el 15 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0be64h		;92bb   ; sitio_de_d418: sin 0xCA77 ni sala especial: acarreo si 0xD418-0xD419 cae cerca (16 en el primero, 0x20 en el segundo) de un sitio de la lista de p15:BE9E de esta zona y sala ([zona][sala][..][..], 0xFF al final)
	jr L_92A4		;92be
mira_bed7:		; si p15:BED7 da Z, se acaba la alerta
	call a_p15_bed7_guarda		;92c0   ; a_p15_bed7_guarda: p15:BED7 guardando el banco de 0xA000
	ret nz			;92c3
	jp acaba_la_alerta		;92c4   ; acaba_la_alerta: los actores de otras salas fuera, la alerta a 0 y p04:94B2
a_p15_bed7_guarda:		; p15:BED7 guardando el banco de 0xA000
	ld a,(0c383h)		;92c7   ; lee la copia del banco de 0xA000
	push af			;92ca
	call 041f7h		;92cb   ; bancos_15: pone el 15 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0bed7h		;92ce   ; se_acaba_alerta: Z si se acaba la alerta: con 0xCAA0 por debajo de 4, con la alerta sin su bit 3 y con 0xD444 (o 0xCA77 = 2), las 4 fichas de 0xD300 libres
	jr L_92A4		;92d1
a_p15_bf5b_guarda:		; p15:BF5B guardando el banco de 0xA000
	ld a,(0c383h)		;92d3   ; lee la copia del banco de 0xA000
	push af			;92d6
	call 041f7h		;92d7   ; bancos_15: pone el 15 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0bf5bh		;92da   ; llegada_de_alerta: por la sala ((fila - 2) * 2 + columna - 5; desde 3, 4 en la zona 0x0C), 3 bytes de p15:BF89: D = la Y, E = la X y 0xD41E
	jr vuelve_banco_a000_b		;92dd
a_p15_bf0d_guarda:		; p15:BF0D guardando el banco de 0xA000
	ld a,(0c383h)		;92df   ; lee la copia del banco de 0xA000
	push af			;92e2
	call 041f7h		;92e3   ; bancos_15: pone el 15 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0bf0dh		;92e6   ; actor_de_alerta: la ficha de IX (0x40 bytes) a cero y un actor de tipo 1 en (X = E, Y = D) de esta sala: el byte 0x10 = 3, el 0x1B = C y su direccion (byte 0x0D): con C = 0 (0xD41E - 1) * 2, con 1 (0xD449 - 1) * 2, con 2 0, con mas 2
	jr vuelve_banco_a000_b		;92e9
d406_si:		; si p06:B55A no da acarreo, (HL) = 2
	push hl			;92eb
	call a_p06_b55a_guarda		;92ec   ; a_p06_b55a_guarda: p06:B55A guardando el banco de 0xA000 (y su acarreo)
	pop hl			;92ef
	ret c			;92f0
	ld (hl),002h		;92f1
	ret			;92f3
tras_la_caida:		; con menos de 4 que siguen y p04:96BA sin acarreo: con la alerta 2 cuenta (p04:930D), con 3 se acaba (p04:9306)
	ld a,(0caa0h)		;92f4   ; lee cuantos siguen a Snake por su rastro (1-4)
	cp 004h		;92f7
	ret z			;92f9
	call sin_llegadas		;92fa   ; sin_llegadas: acarreo en las zonas sin llegadas: la 0x10, la 0x0C salas 0-3, la 0x0D sala 0
	ret c			;92fd
	ld a,(0ca5fh)		;92fe   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	cp 002h		;9301
	ret c			;9303
	jr z,cuenta_d425		;9304
acaba_alerta_si:		; si p06:B55A no da acarreo, se acaba la alerta
	call a_p06_b55a_guarda		;9306   ; a_p06_b55a_guarda: p06:B55A guardando el banco de 0xA000 (y su acarreo)
	ret c			;9309
	jp acaba_la_alerta		;930a   ; acaba_la_alerta: los actores de otras salas fuera, la alerta a 0 y p04:94B2
cuenta_d425:		; fuera de la zona 0x11 (y de la 4 sala 9): 0xD425 uno mas; al llegar a 0xD427, la alerta 1
	call sin_llegadas		;930d   ; sin_llegadas: acarreo en las zonas sin llegadas: la 0x10, la 0x0C salas 0-3, la 0x0D sala 0
	ret c			;9310
	ld a,(0ca4ah)		;9311   ; lee la zona
	cp 011h		;9314
	ret z			;9316
	cp 004h		;9317
	jr nz,L_9322		;9319
	ld a,(0ca4bh)		;931b   ; lee la sala de la zona
	cp 009h		;931e
	jr z,acaba_alerta_si		;9320
L_9322:
	ld hl,0d425h		;9322
	inc (hl)			;9325
	ld a,(hl)			;9326
	inc hl			;9327
	inc hl			;9328
	cp (hl)			;9329
	ret c			;932a
	call a_p06_b55a_guarda		;932b   ; a_p06_b55a_guarda: p06:B55A guardando el banco de 0xA000 (y su acarreo)
	ret c			;932e
	ld a,(0ca76h)		;932f   ; la entrada que vale: 0xD41E (0xD449 en las especiales) = 0xD4F4
	and a			;9332
	ld hl,0d41eh		;9333   ; apunta a la direccion de llegada de los actores de la alerta + 1 (p15:BF85)
	jr z,L_933B		;9336
	ld hl,0d449h		;9338
L_933B:
	ld a,(0d4f4h)		;933b
	ld (hl),a			;933e
	ld a,01eh		;933f   ; 0xD417 = 0x1E, 0xD41A = 0xD41F = 2
	ld (0d417h),a		;9341
	ld a,002h		;9344
	ld (0d41ah),a		;9346
	ld (0d41fh),a		;9349
a_alerta_1:		; 0xD43E = 0xFF, 0xD416 = 0xD42A = 0, la alerta 1, p15:BE48, la sala en 0xD428, p04:982F y la orden 0xF7
	call d43e_a_ff		;934c   ; d43e_a_ff: 0xD43E = 0xFF
	xor a			;934f
	ld (0d416h),a		;9350   ; guarda cuantos actores han llegado con la alerta
	ld (0d42ah),a		;9353
	inc a			;9356
	ld (0ca5fh),a		;9357   ; guarda la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	call a_p15_be48_guarda		;935a   ; a_p15_be48_guarda: p15:BE48 guardando el banco de 0xA000
	call guarda_d428		;935d   ; guarda_d428: 0xD428-0xD429 = la fila y la columna de ahora
	call ventana_de_alerta		;9360   ; ventana_de_alerta: los rotulos (p04:984C), la imagen (p04:98FB) y p12:6FFE
	ld a,(0c697h)		;9363   ; lee 1 mientras suenan las musicas 0x82 u 0x88
	and a			;9366
	ret nz			;9367
	jp 06bech		;9368   ; orden_sonido_f7: la orden 0xF7 al sonido
guarda_d428:		; 0xD428-0xD429 = la fila y la columna de ahora
	ld hl,(0ca50h)		;936b   ; lee la fila de la sala en la zona (uno mas al salir por arriba) y el byte siguiente (16 bits)
	ld (0d428h),hl		;936e
	ret			;9371
alerta_1_cada_cuadro:		; la alerta 1: con 0xD42B a 0 se acaba; si no, baja (p04:946F)
	ld a,(0ca5fh)		;9372   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	dec a			;9375
	ret nz			;9376
	ld hl,(0d42bh)		;9377   ; lee la cuenta de la alerta 1 (16 bits; se ve / 8 en la ventana); a cero se acaba
	ld a,h			;937a
	or l			;937b
	jp z,acaba_alerta_si		;937c   ; acaba_alerta_si: si p06:B55A no da acarreo, se acaba la alerta
	call baja_d42b		;937f   ; baja_d42b: 0xD42B uno menos (y p04:9877); a cero, 0xD42A = 1, el sonido 0x1B y Z
	ret z			;9382
	ld hl,0d417h		;9383   ; la espera de 0xD417...
	ld a,(hl)			;9386
	and a			;9387
	jr z,L_9393		;9388
	dec (hl)			;938a
	ret nz			;938b
	xor a			;938c   ; ...al acabar, 0xD416 = 0 y los actores de otras salas fuera
	ld (0d416h),a		;938d   ; guarda cuantos actores han llegado con la alerta
	jp fuera_de_otras_salas		;9390   ; fuera_de_otras_salas: los actores (por debajo de 0x10) de otras salas fuera; el 0x0A sin alerta 2-3, de los pasos 1-3 al 0
L_9393:
	ld a,(0d443h)		;9393   ; sin 0xD443, cada 64 cuadros (0xD43E)...
	and a			;9396
	ret nz			;9397
	ld hl,0d43eh		;9398
	inc (hl)			;939b
	ld a,(hl)			;939c
	and 03fh		;939d
	ret nz			;939f
	ld a,(0ca77h)		;93a0   ; ...con 0xCA77 = 1, uno en (0x60, 0x54) por el lado 3...
	and a			;93a3
	jr z,L_93B2		;93a4
	dec a			;93a6
	ret nz			;93a7
	ld b,001h		;93a8
	ld c,003h		;93aa
	ld de,05460h		;93ac
	jp actor_nuevo_c		;93af   ; actor_nuevo_c: 0xD416 y 0xD426 uno mas y, en la primera libre de las 4 fichas de 0xD300, p15:BF0D y sus sprites
L_93B2:
	ld a,(0ca65h)		;93b2   ; ...dentro de un sitio, uno en (0x60, 0xB0) por el 2...
	and a			;93b5
	jr z,L_93C2		;93b6
	ld b,000h		;93b8
	ld c,002h		;93ba
	ld de,0b060h		;93bc
	jp actor_nuevo_c		;93bf   ; actor_nuevo_c: 0xD416 y 0xD426 uno mas y, en la primera libre de las 4 fichas de 0xD300, p15:BF0D y sus sprites
L_93C2:
	ld a,(0ca76h)		;93c2   ; ...en las especiales, por la entrada de 0xD447...
	and a			;93c5
	jr z,L_93DA		;93c6
	call sala_de_d44a		;93c8   ; sala_de_d44a: con 0xD44A distinto de 0xFF, A = su byte en 0xD580 (Z si 0); si no, NZ
	jp z,acaba_alerta_si		;93cb   ; acaba_alerta_si: si p06:B55A no da acarreo, se acaba la alerta
	ld de,(0d447h)		;93ce
	ld a,(0d449h)		;93d2
	ld b,a			;93d5
	ld c,001h		;93d6
	jr L_93F9		;93d8
L_93DA:
	call a_p15_be64_guarda		;93da   ; ...en las normales, por la de 0xD418 si no es solida
	jp c,acaba_alerta_si		;93dd   ; acaba_alerta_si: si p06:B55A no da acarreo, se acaba la alerta
	call sala_de_d44a		;93e0   ; sala_de_d44a: con 0xD44A distinto de 0xFF, A = su byte en 0xD580 (Z si 0); si no, NZ
	jp z,acaba_la_alerta		;93e3   ; acaba_la_alerta: los actores de otras salas fuera, la alerta a 0 y p04:94B2
	ld hl,(0d418h)		;93e6
	call 07f3dh		;93e9   ; es_solido_si: acarreo si el caracter del mapa en (H = X, L = Y) llega al umbral de 0xCA4E (0xCA4F desde 0x81)
	jp c,acaba_alerta_si		;93ec   ; acaba_alerta_si: si p06:B55A no da acarreo, se acaba la alerta
	ld de,(0d418h)		;93ef
	ld a,(0d41eh)		;93f3   ; lee la direccion de llegada de los actores de la alerta + 1 (p15:BF85)
	ld b,a			;93f6
	ld c,000h		;93f7
L_93F9:
	ld hl,0d41ah		;93f9   ; cuantos quedan (0xD41A)...
	ld a,(hl)			;93fc
	and a			;93fd
	ret z			;93fe
	dec (hl)			;93ff
	ld a,e			;9400   ; ...la entrada, a la casilla, en su eje...
	ld e,d			;9401
	ld d,a			;9402
	ld a,b			;9403
	cp 003h		;9404
	ld b,e			;9406
	jr c,L_940A		;9407
	ld b,d			;9409
L_940A:
	push af			;940a   ; la entrada a la casilla (+ 4, & 0xF8)...
	ld a,b			;940b
	add a,004h		;940c
	and 0f8h		;940e
	ld b,a			;9410
	pop af			;9411
	jr c,L_9417		;9412   ; ...en la Y o en la X
	ld d,b			;9414
	jr L_9418		;9415
L_9417:
	ld e,b			;9417
L_9418:
	call guarda_d428		;9418   ; ...la sala en 0xD428 y un actor nuevo (p04:9786)
	jp actor_nuevo_c		;941b   ; actor_nuevo_c: 0xD416 y 0xD426 uno mas y, en la primera libre de las 4 fichas de 0xD300, p15:BF0D y sus sprites
sala_de_d44a:		; con 0xD44A distinto de 0xFF, A = su byte en 0xD580 (Z si 0); si no, NZ
	ld a,(0d44ah)		;941e   ; lee el numero de la puerta por la que llega Snake (p15:AB0A)
	cp 0ffh		;9421
	jp z,L_942E		;9423
	ld hl,0d580h		;9426   ; apunta a 0x80 cuentas de las puertas por su numero: 0 cerrada, 0xFF siempre abierta; si no, cuantas entradas de sala le quedan abierta (p15:ACDE, p15:A1E2)
	call 04248h		;9429   ; byte_de_tabla: A = el byte A de la tabla de HL (y HL apunta a el)
	and a			;942c
	ret			;942d
L_942E:
	or 001h		;942e
	ret			;9430
fuera_de_otras_salas:		; los actores (por debajo de 0x10) de otras salas fuera; el 0x0A sin alerta 2-3, de los pasos 1-3 al 0
	push ix		;9431
	ld ix,0ce00h		;9433   ; apunta a los actores: 24 fichas de 0x40 bytes (p04:800D)
	ld b,018h		;9437
L_9439:
	ld a,(ix+000h)		;9439   ; lee el tipo del actor (0 = libre)
	and a			;943c
	jr z,L_9465		;943d
	cp 010h		;943f
	jr nc,L_9465		;9441
	cp 00ah		;9443
	jr nz,L_945C		;9445
	ld a,(0ca5fh)		;9447   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	cp 002h		;944a
	jr nc,L_9465		;944c
	ld a,(ix+001h)		;944e   ; lee el paso del actor
	dec a			;9451
	cp 003h		;9452
	jr c,L_9465		;9454
	ld (ix+001h),000h		;9456   ; el paso del actor = 0x00
	jr L_9465		;945a
L_945C:
	call en_esta_sala		;945c   ; en_esta_sala: Z si el actor esta en la sala de ahora (fila y columna)
	jr z,L_9465		;945f
	ld (ix+000h),000h		;9461   ; el tipo del actor (0 = libre) = 0x00
L_9465:
	ld de,00040h		;9465
	add ix,de		;9468
	djnz L_9439		;946a
	pop ix		;946c
	ret			;946e
baja_d42b:		; 0xD42B uno menos (y p04:9877); a cero, 0xD42A = 1, el sonido 0x1B y Z
	ld hl,(0d42bh)		;946f   ; lee la cuenta de la alerta 1 (16 bits; se ve / 8 en la ventana); a cero se acaba
	dec hl			;9472
	ld (0d42bh),hl		;9473   ; guarda la cuenta de la alerta 1 (16 bits; se ve / 8 en la ventana); a cero se acaba
	push hl			;9476
	call cuenta_d42b		;9477   ; cuenta_d42b: 0xD42B / 8
	pop hl			;947a
	ld a,h			;947b
	or l			;947c
	ret nz			;947d
	ld a,001h		;947e
	ld (0d42ah),a		;9480
	call 06a60h		;9483   ; sonido_1b: pide el sonido 0x1B
	xor a			;9486
	ret			;9487
alerta_acaba_con_lineas:		; se acaba la alerta (p04:94A2) y las lineas de p00:439D en las dos paginas
	call 0437eh		;9488   ; copia_marcador_a_la_otra: copia las lineas 0x16-0x51 de la pagina en la que se dibuja a la otra (YMMM)
	call alerta_a_0		;948b   ; alerta_a_0: los de otras salas fuera, la alerta a 0 y los actores como antes (p04:94DA)
	call 0439dh		;948e   ; lineas_c3: las lineas de las listas de p00:43C8 (verticales) y p00:43E3 (horizontales), de 0x3A de largo en el color 0x0D
	ld hl,0ca42h		;9491   ; apunta a la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	ld a,(hl)			;9494
	push hl			;9495
	push af			;9496
	xor 001h		;9497
	ld (hl),a			;9499
	call 0439dh		;949a   ; lineas_c3: las lineas de las listas de p00:43C8 (verticales) y p00:43E3 (horizontales), de 0x3A de largo en el color 0x0D
	pop af			;949d
	pop hl			;949e
	ld (hl),a			;949f
	xor a			;94a0
	ret			;94a1
alerta_a_0:		; los de otras salas fuera, la alerta a 0 y los actores como antes (p04:94DA)
	call fuera_de_otras_salas		;94a2   ; fuera_de_otras_salas: los actores (por debajo de 0x10) de otras salas fuera; el 0x0A sin alerta 2-3, de los pasos 1-3 al 0
	xor a			;94a5
	ld (0ca5fh),a		;94a6   ; guarda la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	push ix		;94a9
	call tipos_como_antes		;94ab   ; tipos_como_antes: los actores sin el bit 7 del tipo; los de tipo menor de 0x10, con el dibujo (0x17) y el eje (0x16) de antes
	pop ix		;94ae
	xor a			;94b0
	ret			;94b1
actores_como_antes:		; los actores como antes y, sin 0xC697, la musica de la zona con la orden 0xF4
	push ix		;94b2
	call tipos_como_antes		;94b4   ; tipos_como_antes: los actores sin el bit 7 del tipo; los de tipo menor de 0x10, con el dibujo (0x17) y el eje (0x16) de antes
	ld a,(0c697h)		;94b7   ; lee 1 mientras suenan las musicas 0x82 u 0x88
	and a			;94ba
	jr nz,L_94CB		;94bb
	call 07a88h		;94bd   ; rutina_de_fase_b_1_4_5: rutina_de_fase y deja los bancos 1, 4 y 5
	ld (0ca19h),hl		;94c0   ; guarda la musica pendiente: la rutina que la pide (16 bits)
	ld a,0b4h		;94c3
	ld (0ca18h),a		;94c5   ; guarda la espera hasta poner la musica pendiente
	call 06be4h		;94c8   ; orden_sonido_f4: la orden 0xF4 al sonido
L_94CB:
	call ca7a_5		;94cb   ; ca7a_5: 0xCA7A = 5 y p04:983E
	pop ix		;94ce
	xor a			;94d0
	ret			;94d1
ca7a_5:		; 0xCA7A = 5 y p04:983E
	ld a,005h		;94d2
	ld (0ca7ah),a		;94d4   ; guarda las veces que pasa la raya del recuadro
	jp sin_ventana_de_alerta		;94d7   ; sin_ventana_de_alerta: 0xE202 = 0, 0xE20B = 0x1C y las lineas de p00:439D
tipos_como_antes:		; los actores sin el bit 7 del tipo; los de tipo menor de 0x10, con el dibujo (0x17) y el eje (0x16) de antes
	ld ix,0ce00h		;94da   ; apunta a los actores: 24 fichas de 0x40 bytes (p04:800D)
	ld b,018h		;94de
L_94E0:
	ld a,(ix+000h)		;94e0   ; lee el tipo del actor (0 = libre)
	and a			;94e3
	jr z,L_94FD		;94e4
	res 7,(ix+000h)		;94e6   ; pone a cero el bit 7 de el tipo del actor (0 = libre)
	ld a,(ix+000h)		;94ea   ; lee el tipo del actor (0 = libre)
	cp 010h		;94ed
	jr nc,L_94FD		;94ef
	ld a,(ix+017h)		;94f1
	ld (ix+00dh),a		;94f4   ; guarda el dibujo del actor (bit 0: el paso)
	ld a,(ix+016h)		;94f7
	ld (ix+00ch),a		;94fa
L_94FD:
	ld de,00040h		;94fd
	add ix,de		;9500
	djnz L_94E0		;9502
	xor a			;9504   ; 0xD444 = 0, 0xD44A = 0xFF, p04:9518 y p12:685F
	ld (0d444h),a		;9505
	dec a			;9508
	ld (0d44ah),a		;9509   ; guarda el numero de la puerta por la que llega Snake (p15:AB0A)
	call quita_los_de_d300		;950c   ; quita_los_de_d300: los 4 actores de 0xD300 (los que llegan con la alerta) de tipo menor de 0x10, fuera
	call 04188h		;950f   ; bancos_12_4_56: pone el 12 en 0x6000, el 4 en 0x8000, el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0685fh		;9512   ; rellena_actores: salvo en el estado 0x11 de Snake o en las zonas 8 y 0x0F: de las 0xD424 primeras fichas de 0xCE00, las libres se rellenan con su fila de p56:B086 (p12:688C) si su sala esta lejos
	jp 0413fh		;9515   ; bancos_1_4_5: pone el 1 en 0x6000, el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
quita_los_de_d300:		; los 4 actores de 0xD300 (los que llegan con la alerta) de tipo menor de 0x10, fuera
	ld hl,0d300h		;9518   ; apunta a las 4 fichas de actor de los que llegan con la alerta (los actores 20-23)
	ld b,004h		;951b
L_951D:
	ld a,(hl)			;951d
	cp 010h		;951e
	jr nc,L_9524		;9520
	ld (hl),000h		;9522
L_9524:
	ld a,040h		;9524
	call 0423eh		;9526   ; suma_a_hl: HL = HL + A
	djnz L_951D		;9529
	ret			;952b
llegan_actores:		; con la alerta 2 (sin 0xCB75 ni 0xCA67): llegan actores por los lados de la sala
	ld a,(0cb75h)		;952c
	and a			;952f
	ret nz			;9530
	ld a,(0ca5fh)		;9531   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	cp 002h		;9534
	ret nz			;9536
	ld a,(0ca67h)		;9537
	and a			;953a
	ret nz			;953b
	ld a,(0ca76h)		;953c   ; en las especiales, con el 0xD300 de tipo 0x10-0x11, se acaba la alerta
	and a			;953f
	jr z,L_954C		;9540
	ld a,(0d300h)		;9542   ; lee las 4 fichas de actor de los que llegan con la alerta (los actores 20-23)
	sub 010h		;9545
	cp 002h		;9547
	jp c,acaba_la_alerta		;9549   ; acaba_la_alerta: los actores de otras salas fuera, la alerta a 0 y p04:94B2
L_954C:
	ld hl,0d417h		;954c   ; la espera de 0xD417...
	ld a,(hl)			;954f
	and a			;9550
	jr z,L_957A		;9551
	dec (hl)			;9553
	ret nz			;9554
	call fuera_de_otras_salas		;9555   ; ...al acabar: los de otras salas fuera y, segun 0xCA60, se acaba o pasa a la alerta 1
	ld hl,0ca60h		;9558
	ld a,(hl)			;955b
	and a			;955c
	ld (hl),000h		;955d
	ret z			;955f
	ld a,(0d300h)		;9560   ; lee las 4 fichas de actor de los que llegan con la alerta (los actores 20-23)
	sub 010h		;9563
	cp 002h		;9565
	jp c,acaba_la_alerta		;9567   ; acaba_la_alerta: los actores de otras salas fuera, la alerta a 0 y p04:94B2
	call sala_de_d44a		;956a   ; sala_de_d44a: con 0xD44A distinto de 0xFF, A = su byte en 0xD580 (Z si 0); si no, NZ
	jp z,acaba_la_alerta		;956d   ; acaba_la_alerta: los actores de otras salas fuera, la alerta a 0 y p04:94B2
	ld a,(0d456h)		;9570
	and a			;9573
	jp nz,acaba_la_alerta		;9574   ; acaba_la_alerta: los actores de otras salas fuera, la alerta a 0 y p04:94B2
	jp a_alerta_1		;9577   ; a_alerta_1: 0xD43E = 0xFF, 0xD416 = 0xD42A = 0, la alerta 1, p15:BE48, la sala en 0xD428, p04:982F y la orden 0xF7
L_957A:
	ld a,(0d443h)		;957a   ; sin 0xD443, como mucho 4 a la vez (3 con el bit 3 de 0xD7DA)...
	and a			;957d
	ret nz			;957e
	ld a,(0d7dah)		;957f
	and 008h		;9582
	ld b,004h		;9584
	jr z,L_9589		;9586
	dec b			;9588
L_9589:
	ld a,(0d416h)		;9589   ; lee cuantos actores han llegado con la alerta
	cp b			;958c   ; ya hay bastantes: nada
	ret nc			;958d
	ld hl,0d43eh		;958e   ; ...cada 16 cuadros (0xD43E)...
	inc (hl)			;9591   ; la cuenta...
	ld a,(hl)			;9592
	and 00fh		;9593   ; ...cada 16
	ret nz			;9595
	call sin_llegadas		;9596   ; ...en las zonas de p04:96BA, por p15:BF5B
	jp c,llegan_por_bf5b		;9599   ; llegan_por_bf5b: p15:BF5B y el actor nuevo
	ld a,(0ca4ah)		;959c   ; desde la zona 0x11: la sala 0 por (0xB8, 0x78), la 5 por (0x48, 0xBE) o (0x58, 0xBE), la 0x13 por su sitio
	ld b,a			;959f
	cp 011h		;95a0   ; desde la zona 0x11
	jr c,L_95D9		;95a2
	ld a,(0ca4bh)		;95a4   ; lee la sala de la zona
	and a			;95a7   ; la sala 0
	ld de,078b8h		;95a8
	jp z,actor_nuevo		;95ab   ; actor_nuevo: C = 0
	cp 005h		;95ae   ; la 5: segun el bit 4 de 0xD43E...
	jr nz,L_95C1		;95b0
	ld a,(0d43eh)		;95b2
	and 010h		;95b5
	ld de,0be48h		;95b7
	jr z,L_95BE		;95ba
	ld e,058h		;95bc   ; ...0x48 o 0x58
L_95BE:
	jp actor_nuevo		;95be   ; actor_nuevo: C = 0
L_95C1:
	cp 013h		;95c1
	jp nz,L_967F		;95c3
	ld a,(0ca77h)		;95c6
	ld c,003h		;95c9
	cp 001h		;95cb
	ld de,05460h		;95cd
	jp z,actor_nuevo_c		;95d0   ; actor_nuevo_c: 0xD416 y 0xD426 uno mas y, en la primera libre de las 4 fichas de 0xD300, p15:BF0D y sus sprites
	ld de,0be70h		;95d3
	jp actor_nuevo		;95d6   ; actor_nuevo: C = 0
L_95D9:
	ld a,b			;95d9   ; la zona 4 sala 9: por (0xA0, 0x20)
	cp 004h		;95da
	jr nz,L_95E9		;95dc
	ld a,(0ca4bh)		;95de   ; lee la sala de la zona
	cp 009h		;95e1
	ld de,020a0h		;95e3
	jp z,actor_nuevo		;95e6   ; actor_nuevo: C = 0
L_95E9:
	call caben_mas		;95e9   ; si caben mas (p04:980D)...
	ret nc			;95ec
	ld a,(0ca65h)		;95ed   ; ...fuera de un sitio, los de 0xD451 por 0xD452...
	and a			;95f0
	jr nz,L_9602		;95f1
	ld hl,0d451h		;95f3
	ld a,(hl)			;95f6
	and a			;95f7
	jr z,L_9602		;95f8
	dec (hl)			;95fa
	ld de,(0d452h)		;95fb
	jp actor_nuevo		;95ff   ; actor_nuevo: C = 0
L_9602:
	call 04256h		;9602   ; ...dentro, al azar por (0x50 o 0x70, 0xB0) por el lado 2...
	rra			;9605
	ld de,0b050h		;9606
	jr c,L_960D		;9609
	ld e,070h		;960b
L_960D:
	ld a,(0ca65h)		;960d   ; lee el sitio de 0xCBE0 en el que esta Snake (0 = ninguno)
	and a			;9610
	ld c,002h		;9611
	jp nz,actor_nuevo_c		;9613   ; actor_nuevo_c: 0xD416 y 0xD426 uno mas y, en la primera libre de las 4 fichas de 0xD300, p15:BF0D y sus sprites
	ld a,(0ca77h)		;9616   ; ...con 0xCA77 = 1, por (0x60, 0x54)...
	inc c			;9619
	cp 001h		;961a
	ld de,05460h		;961c
	jp z,actor_nuevo_c		;961f   ; actor_nuevo_c: 0xD416 y 0xD426 uno mas y, en la primera libre de las 4 fichas de 0xD300, p15:BF0D y sus sprites
	ret nc			;9622
	ld a,(0ca76h)		;9623   ; ...en las especiales, por la entrada de 0xD447 si no es solida
	and a			;9626
	jr z,L_9648		;9627
	call a_p06_b55a_guarda		;9629   ; a_p06_b55a_guarda: p06:B55A guardando el banco de 0xA000 (y su acarreo)
	ret c			;962c
	call hay_d500_en_2		;962d   ; hay_d500_en_2: Z si alguna de las 8 fichas de 0xD500 (16 bytes) tiene el byte 1 en 2
	jp nz,acaba_la_alerta		;9630   ; acaba_la_alerta: los actores de otras salas fuera, la alerta a 0 y p04:94B2
	ld de,(0d447h)		;9633
	push de			;9637
	ex de,hl			;9638
	call 07f3dh		;9639   ; es_solido_si: acarreo si el caracter del mapa en (H = X, L = Y) llega al umbral de 0xCA4E (0xCA4F desde 0x81)
	pop de			;963c
	ld c,001h		;963d
	ld a,d			;963f
	ld d,e			;9640
	ld e,a			;9641
	jp nc,actor_nuevo_c		;9642   ; actor_nuevo_c: 0xD416 y 0xD426 uno mas y, en la primera libre de las 4 fichas de 0xD300, p15:BF0D y sus sprites
	jp acaba_la_alerta		;9645   ; acaba_la_alerta: los actores de otras salas fuera, la alerta a 0 y p04:94B2
L_9648:
	ld a,(0d444h)		;9648   ; en las normales: por la entrada de 0xD418 (si no es solida) mientras queden en 0xD41A
	and a			;964b
	jr z,L_9654		;964c
	call hay_d500_en_2		;964e   ; hay_d500_en_2: Z si alguna de las 8 fichas de 0xD500 (16 bytes) tiene el byte 1 en 2
	jp nz,acaba_la_alerta		;9651   ; acaba_la_alerta: los actores de otras salas fuera, la alerta a 0 y p04:94B2
L_9654:
	ld hl,(0d418h)		;9654
	call 07f3dh		;9657   ; es_solido_si: acarreo si el caracter del mapa en (H = X, L = Y) llega al umbral de 0xCA4E (0xCA4F desde 0x81)
	jr c,L_968A		;965a
	ld a,(0d444h)		;965c
	and a			;965f
	jr nz,L_966F		;9660
	ld a,(0d416h)		;9662   ; lee cuantos actores han llegado con la alerta
	rra			;9665
	jr c,L_968A		;9666
	ld hl,0d41ah		;9668
	ld a,(hl)			;966b
	and a			;966c
	jr z,L_968A		;966d
L_966F:
	call sala_de_d44a		;966f   ; sala_de_d44a: con 0xD44A distinto de 0xFF, A = su byte en 0xD580 (Z si 0); si no, NZ
	jr z,L_968A		;9672
	ld a,(0d456h)		;9674
	and a			;9677
	jr nz,L_968A		;9678
	call a_p15_be64_guarda		;967a   ; a_p15_be64_guarda: p15:BE64 guardando el banco de 0xA000
	jr c,L_968A		;967d
L_967F:
	ld hl,0d41ah		;967f   ; la entrada siguiente de la lista
	dec (hl)			;9682
	dec hl			;9683
	ld e,(hl)			;9684
	dec hl			;9685
	ld d,(hl)			;9686
	jp actor_nuevo		;9687   ; actor_nuevo: C = 0
L_968A:
	ld a,(0d444h)		;968a   ; si no, por un lado al azar que tenga sala al lado (p04:96FF)
	and a			;968d
	jp nz,acaba_alerta_si		;968e   ; acaba_alerta_si: si p06:B55A no da acarreo, se acaba la alerta
	call 04256h		;9691   ; azar: A = un numero al azar (0xCA03 rotado mas R)
	and 003h		;9694
	ld c,a			;9696
	ld b,004h		;9697
L_9699:
	push bc			;9699
	ld a,c			;969a
	inc a			;969b
	push bc			;969c
	call 07da9h		;969d   ; hay_sala_al_lado: Z si no hay sala por la salida A (la casilla de 0xD900 vale 0xFF); con 0xD433, NZ
	pop bc			;96a0
	scf			;96a1
	jr z,L_96AB		;96a2
	ld a,c			;96a4
	ld hl,096ffh		;96a5
	call 0424eh		;96a8   ; salta_por_tabla: salta a la palabra A de la tabla de HL
L_96AB:
	pop bc			;96ab
	ret nc			;96ac
	ld a,c			;96ad
	inc a			;96ae
	and 003h		;96af
	ld c,a			;96b1
	djnz L_9699		;96b2
	ld a,001h		;96b4   ; ningun lado: 0xD444 = 1
	ld (0d444h),a		;96b6
	ret			;96b9
sin_llegadas:		; acarreo en las zonas sin llegadas: la 0x10, la 0x0C salas 0-3, la 0x0D sala 0
	ld a,(0ca76h)		;96ba   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	and a			;96bd
	ret nz			;96be
	ld a,(0ca4ah)		;96bf   ; lee la zona
	cp 010h		;96c2
	jr z,L_96DC		;96c4
	cp 00ch		;96c6
	jr z,L_96D6		;96c8
	cp 00dh		;96ca
	jr nz,L_96DE		;96cc
	ld a,(0ca4bh)		;96ce   ; lee la sala de la zona
	and a			;96d1
	jr nz,L_96DE		;96d2
	jr L_96DC		;96d4
L_96D6:
	ld a,(0ca4bh)		;96d6   ; lee la sala de la zona
	cp 004h		;96d9
	ret nc			;96db
L_96DC:
	scf			;96dc
	ret			;96dd
L_96DE:
	or a			;96de
	ret			;96df
llegan_por_bf5b:		; p15:BF5B y el actor nuevo
	call a_p15_bf5b_guarda		;96e0   ; a_p15_bf5b_guarda: p15:BF5B guardando el banco de 0xA000
	jp actor_nuevo		;96e3   ; actor_nuevo: C = 0
hay_d500_en_2:		; Z si alguna de las 8 fichas de 0xD500 (16 bytes) tiene el byte 1 en 2
	ld hl,0d500h		;96e6   ; apunta a 8 fichas de puerta de 16 bytes [tipo][estado][Y][X][pide][numero][paso][alto][ancho][abre][cuenta] (p15:A04C; el choque en p07:BC95)
	ld b,008h		;96e9
L_96EB:
	ld a,(hl)			;96eb   ; la ficha en uso?
	and a			;96ec
	jr z,L_96F5		;96ed
	inc hl			;96ef
	ld a,(hl)			;96f0   ; el byte 1...
	cp 002h		;96f1   ; ...en 2: Z
	ret z			;96f3
	dec hl			;96f4   ; la siguiente
L_96F5:
	ld a,010h		;96f5
	call 0423eh		;96f7   ; suma_a_hl: HL = HL + A
	djnz L_96EB		;96fa
	or 001h		;96fc
	ret			;96fe

; ----------------------------------------------------------------------
; DATOS resto_96FF: lo apuntan con el banco puesto p04:96A5 (0x96FF); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p04:96A5 (8 bytes)
;   0x96ff..0x9707  (8 bytes)
DATA_resto_96FF:
	defb 007h,097h,0cbh,097h,0e1h,097h,0ffh,097h	; 96ff  ........

; ======================================================================
; CODIGO 0x9707..0x98e0  (473 bytes)
; ======================================================================


llegan_por_arriba:		; por arriba: la primera fila del mapa a 0xDF40 y un hueco al azar (p04:971A)
	ld hl,0dd00h		;9707   ; apunta a el mapa de la sala: 24 x 24 caracteres
	ld de,0df40h		;970a
	ld bc,00018h		;970d
	ldir		;9710
	call hueco_zona_1		;9712   ; hueco_zona_1: en la zona 1 columna 5 filas 2-4, los 12 caracteres de 0xDF48 a 0x81
	ld de,01200h		;9715   ; X variable, Y = 0x12; la entrada 2
	ld a,002h		;9718
busca_hueco:		; 0xD41E = A; cuenta los huecos de la fila de 0xDF40 (al menos 2)...
	ld (0d41eh),a		;971a   ; guarda la direccion de llegada de los actores de la alerta + 1 (p15:BF85)
	ld hl,0df40h		;971d
	ld bc,01800h		;9720
L_9723:
	ld a,(hl)			;9723   ; ...los caracteres que no llegan al umbral...
	cp 081h		;9724
	exx			;9726
	ld hl,0ca4eh		;9727   ; apunta a el umbral de los caracteres 0x00-0x80 de la sala (de p56:A727; p00:5C28)
	jr c,L_972D		;972a
	inc hl			;972c
L_972D:
	cp (hl)			;972d
	exx			;972e
	jr nc,L_9732		;972f
	inc c			;9731
L_9732:
	inc hl			;9732
	djnz L_9723		;9733
	ld a,c			;9735
	cp 002h		;9736
	ret c			;9738
	call 04256h		;9739   ; ...uno al azar (0-22) desde el que buscar...
	and 01fh		;973c
	cp 017h		;973e
	jr c,L_9743		;9740
	xor a			;9742
L_9743:
	ld c,a			;9743
	ld hl,0df40h		;9744
	call 0423eh		;9747   ; suma_a_hl: HL = HL + A
	ld b,017h		;974a
L_974C:
	call caracter_libre		;974c   ; ...dos huecos seguidos...
	jr nc,L_9758		;974f
	inc hl			;9751
	call caracter_libre		;9752   ; caracter_libre: acarreo si el caracter de HL no llega al umbral de la sala
	jr c,punto_del_hueco		;9755
	dec hl			;9757
L_9758:
	inc hl			;9758
	inc c			;9759
	ld a,c			;975a
	cp 017h		;975b
	jr c,L_9764		;975d
	ld hl,0df40h		;975f   ; ...dando la vuelta...
	ld c,000h		;9762
L_9764:
	djnz L_974C		;9764
	scf			;9766   ; ...ninguno: acarreo
	ret			;9767
caracter_libre:		; acarreo si el caracter de HL no llega al umbral de la sala
	ld a,(hl)			;9768
	cp 081h		;9769
	exx			;976b
	ld hl,0ca4eh		;976c   ; apunta a el umbral de los caracteres 0x00-0x80 de la sala (de p56:A727; p00:5C28)
	jr c,L_9772		;976f
	inc hl			;9771
L_9772:
	cp (hl)			;9772
	exx			;9773
	ret			;9774
punto_del_hueco:		; la casilla * 8 + 8 en el eje que falta
	ld a,c			;9775   ; la casilla...
	add a,a			;9776   ; ...* 8 + 8
	add a,a			;9777
	add a,a			;9778
	add a,008h		;9779
	ld b,a			;977b
	ld a,d			;977c   ; en el eje que toca
	and a			;977d
	jr z,L_9783		;977e
	ld e,b			;9780
	jr actor_nuevo		;9781
L_9783:
	ld d,b			;9783
actor_nuevo:		; C = 0
	ld c,000h		;9784
actor_nuevo_c:		; 0xD416 y 0xD426 uno mas y, en la primera libre de las 4 fichas de 0xD300, p15:BF0D y sus sprites
	ld hl,0d416h		;9786   ; apunta a cuantos actores han llegado con la alerta
	inc (hl)			;9789
	ld hl,0d426h		;978a   ; apunta a cuantos actores hay de los que llegan
	inc (hl)			;978d
	ld ix,0d300h		;978e   ; apunta a las 4 fichas de actor de los que llegan con la alerta (los actores 20-23)
	ld b,004h		;9792
L_9794:
	ld a,(ix+000h)		;9794   ; lee el tipo del actor (0 = libre)
	and a			;9797
	jr z,L_97A5		;9798
	exx			;979a
	ld de,00040h		;979b
	add ix,de		;979e
	exx			;97a0
	djnz L_9794		;97a1
	or a			;97a3
	ret			;97a4
L_97A5:
	call a_p15_bf0d_guarda		;97a5   ; a_p15_bf0d_guarda: p15:BF0D guardando el banco de 0xA000
	call pinta_actor		;97a8   ; pinta_actor: sus sprites (p04:81C5) con el banco 8
	or a			;97ab
	ret			;97ac
hueco_zona_1:		; en la zona 1 columna 5 filas 2-4, los 12 caracteres de 0xDF48 a 0x81
	ld a,(0ca4ah)		;97ad   ; lee la zona
	dec a			;97b0
	ret nz			;97b1
	ld a,(0ca51h)		;97b2   ; lee la columna de la sala en la zona (uno mas al salir por la derecha)
	cp 005h		;97b5
	ret nz			;97b7
	ld a,(0ca50h)		;97b8   ; lee la fila de la sala en la zona (uno mas al salir por arriba)
	sub 002h		;97bb
	cp 003h		;97bd
	ret nc			;97bf
	ld hl,0df48h		;97c0
	ld bc,0000bh		;97c3
	ld a,081h		;97c6
	jp 04237h		;97c8   ; llena_bloque: pone A en BC + 1 bytes desde HL
llegan_por_abajo:		; por abajo: la ultima fila (0xDF28), Y = 0xC0; la entrada 1
	ld hl,0df28h		;97cb
	ld de,0df40h		;97ce
	ld bc,00018h		;97d1
	ldir		;97d4
	call hueco_zona_1		;97d6   ; hueco_zona_1: en la zona 1 columna 5 filas 2-4, los 12 caracteres de 0xDF48 a 0x81
	ld de,0c000h		;97d9
	ld a,001h		;97dc
	jp busca_hueco		;97de   ; busca_hueco: 0xD41E = A; cuenta los huecos de la fila de 0xDF40 (al menos 2)...
llegan_por_la_izquierda:		; por la izquierda: la primera columna, X = 8; la entrada 4
	ld hl,0dd00h		;97e1   ; apunta a el mapa de la sala: 24 x 24 caracteres
	call columna_a_df40		;97e4   ; columna_a_df40: una columna del mapa (24 filas) a 0xDF40
	ld de,00008h		;97e7
	ld a,004h		;97ea
	jp busca_hueco		;97ec   ; busca_hueco: 0xD41E = A; cuenta los huecos de la fila de 0xDF40 (al menos 2)...
columna_a_df40:		; una columna del mapa (24 filas) a 0xDF40
	ld de,0df40h		;97ef
	ld b,018h		;97f2
L_97F4:
	ld a,(hl)			;97f4
	ld (de),a			;97f5
	inc de			;97f6
	ld a,018h		;97f7
	call 0423eh		;97f9   ; suma_a_hl: HL = HL + A
	djnz L_97F4		;97fc
	ret			;97fe
llegan_por_la_derecha:		; por la derecha: la ultima columna, X = 0xB8; la entrada 3
	ld hl,0dd17h		;97ff
	call columna_a_df40		;9802   ; columna_a_df40: una columna del mapa (24 filas) a 0xDF40
	ld de,000b8h		;9805
	ld a,003h		;9808
	jp busca_hueco		;980a   ; busca_hueco: 0xD41E = A; cuenta los huecos de la fila de 0xDF40 (al menos 2)...
caben_mas:		; acarreo si 0xD426 aun no llega a 0xD427
	ld hl,0d426h		;980d   ; apunta a cuantos actores hay de los que llegan
	ld a,(hl)			;9810
	inc hl			;9811
	cp (hl)			;9812
	ret			;9813
marcador_de_alerta_bancos_14:
	call marcador_de_alerta		;9814   ; marcador_de_alerta: 0xE208 = 0x0800, p12:6F49 con el color 0xFF y la ventana de alerta
	jp 041efh		;9817   ; bancos_14: pone el 14 en 0xA000 (con su copia en 0xC381-0xC383)
marcador_de_alerta:		; 0xE208 = 0x0800, p12:6F49 con el color 0xFF y la ventana de alerta
	ld hl,00800h		;981a
	ld (0e208h),hl		;981d   ; guarda el paso del parpadeo del recuadro con la alerta (0-3) y el byte siguiente (16 bits)
	ld a,(0ca42h)		;9820   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	ld d,a			;9823
	ld a,0ffh		;9824
	call 041ddh		;9826   ; bancos_12: pone el 12 en 0x6000 (con su copia en 0xC381-0xC383)
	call 06f49h		;9829   ; pon_radar: el recuadro (0xC4, 0x17), 0x38 x 0x38 en el color A de la pagina D
	call 0413fh		;982c   ; bancos_1_4_5: pone el 1 en 0x6000, el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
ventana_de_alerta:		; los rotulos (p04:984C), la imagen (p04:98FB) y p12:6FFE
	call rotulos_de_alerta		;982f   ; rotulos_de_alerta: los rotulos de p04:98E0 y, segun la alerta, los de p04:98E9 o p04:98F2...
	call imagen_de_alerta		;9832   ; imagen_de_alerta: la imagen de la alerta (p56:A242 con la 1, p56:A2A6 con la 2) con p12:6FC4 y dos franjas a la VRAM
	call 041ddh		;9835   ; bancos_12: pone el 12 en 0x6000 (con su copia en 0xC381-0xC383)
	call 06ffeh		;9838   ; rectangulos_de_alerta: los rectangulos de p12:704A y p12:7052 en 0xFF, 0xCC (alerta 1) o 0xAA
	jp 0413fh		;983b   ; bancos_1_4_5: pone el 1 en 0x6000, el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
sin_ventana_de_alerta:		; 0xE202 = 0, 0xE20B = 0x1C y las lineas de p00:439D
	ld hl,00000h		;983e
	ld (0e202h),hl		;9841   ; guarda la direccion de la raya del recuadro (0 a la derecha, 1 a la izquierda) y el byte siguiente (16 bits)
	ld a,01ch		;9844
	ld (0e20bh),a		;9846   ; guarda la cuenta de cuadros sin pintar lo de dentro del recuadro
	jp 0439dh		;9849   ; lineas_c3: las lineas de las listas de p00:43C8 (verticales) y p00:43E3 (horizontales), de 0x3A de largo en el color 0x0D
rotulos_de_alerta:		; los rotulos de p04:98E0 y, segun la alerta, los de p04:98E9 o p04:98F2...
	ld hl,098e0h		;984c
	call tres_rotulos		;984f   ; tres_rotulos: 3 rectangulos de 0x18 x 8 de la pagina 3 (Y = 0x70) en los sitios de la lista HL
	ld a,(0ca5fh)		;9852   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	dec a			;9855
	ld hl,098e9h		;9856
	jr nz,L_985E		;9859
	ld hl,098f2h		;985b
L_985E:
	call tres_rotulos		;985e   ; tres_rotulos: 3 rectangulos de 0x18 x 8 de la pagina 3 (Y = 0x70) en los sitios de la lista HL
	ld a,(0ca5fh)		;9861   ; ...el numero de la alerta (1-3) en 0xE62B (p15:BFBF)...
	inc a			;9864
	cp 003h		;9865
	jr c,L_986B		;9867
	ld a,003h		;9869
L_986B:
	ld de,0e62bh		;986b
	call a_p15_bfbf_guarda		;986e   ; a_p15_bfbf_guarda: p15:BFBF guardando los bancos de 0x8000 y 0xA000
	ld a,(0ca5fh)		;9871   ; ...y con la alerta 1, la cuenta de 0xD42B / 8; con 2 o mas, la vida
	dec a			;9874
	jr nz,vida_en_alerta		;9875
cuenta_d42b:		; 0xD42B / 8
	ld hl,(0d42bh)		;9877   ; lee la cuenta de la alerta 1 (16 bits; se ve / 8 en la ventana); a cero se acaba
	srl h		;987a
	rr l		;987c
	srl h		;987e
	rr l		;9880
	srl h		;9882
	rr l		;9884
	ld a,l			;9886
	jr numero_en_ventana		;9887
vida_en_alerta:
	ld a,(0ca5fh)		;9889   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	cp 002h		;988c
	ret c			;988e
	ld a,(0ca53h)		;988f   ; lee la vida de Snake (lo largo de la barra)
numero_en_ventana:		; el hueco de X = 0xCE, Y = 0x3F (0x10 x 8) al color 15 y el numero A (p15:BF98)
	push af			;9892
	ld hl,0ce3fh		;9893
	ld bc,01008h		;9896
	ld a,(0ca42h)		;9899   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	ld d,a			;989c
	ld a,0ffh		;989d
	call 046ffh		;989f   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
	pop af			;98a2
	ld bc,(0c382h)		;98a3   ; lee la copia del banco de 0x8000 y el byte siguiente (16 bits)
	push bc			;98a7
	call 041f7h		;98a8   ; bancos_15: pone el 15 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0bf98h		;98ab   ; numero_a_cifras: A (0-99) en dos cifras de 8 x 8 de (0x68 + 8 * cifra, 0x68): las decenas en (0xCF, 0x40) y las unidades en (0xD5, 0x40), con la operacion 0xC8 (0xD8 en la pagina 1)
L_98AE:
	jp vuelve_banco_a000_b		;98ae   ; vuelve_banco_a000_b: el banco de 0xA000 de antes
a_p15_bfbf_guarda:		; p15:BFBF guardando los bancos de 0x8000 y 0xA000
	ld bc,(0c382h)		;98b1   ; lee la copia del banco de 0x8000 y el byte siguiente (16 bits)
	push bc			;98b5
	call 041f7h		;98b6   ; bancos_15: pone el 15 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0bfbfh		;98b9   ; cifra_8x8: la cifra A de (0x68 + 8 * A, 0x68)...
	jr L_98AE		;98bc
tres_rotulos:		; 3 rectangulos de 0x18 x 8 de la pagina 3 (Y = 0x70) en los sitios de la lista HL
	ld b,003h		;98be
	ld a,(0ca42h)		;98c0   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	and a			;98c3
	ld c,003h		;98c4
	jr z,L_98CA		;98c6
	ld c,007h		;98c8
L_98CA:
	push bc			;98ca
	ld d,(hl)			;98cb   ; D = la X, E = la Y del destino
	inc hl			;98cc
	ld e,(hl)			;98cd
	inc hl			;98ce
	push hl			;98cf
	ld h,(hl)			;98d0   ; H = la X de origen en la pagina 3, Y = 0x70
	ld l,070h		;98d1
	ld a,c			;98d3   ; las paginas
	ld bc,01808h		;98d4   ; 0x18 x 8
	call 04767h		;98d7   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
	pop hl			;98da
	inc hl			;98db   ; el siguiente
	pop bc			;98dc
	djnz L_98CA		;98dd
	ret			;98df

; ----------------------------------------------------------------------
; DATOS resto_98E0: lo apuntan con el banco puesto p04:984C (0x98E0), p04:9856
;   (0x98E9), p04:985B (0x98F2); el tamano es lo que hay hasta lo siguiente,
;   no sale de recorrerlo; lo leen p04:984C, p04:9856, p04:985B (27 bytes)
;   0x98e0..0x98fb  (27 bytes)
DATA_resto_98E0:
	defb 0e0h,01ch,000h,0e0h,024h,018h,0e0h,02ch,030h,0c8h,033h,048h,0c8h,03bh,060h,0c8h	; 98e0  ....$..,0.3H..`.
	defb 043h,078h,0c8h,033h,090h,0c8h,03bh,0a8h,0c8h,043h,078h	; 98f0  Cx.3.....Cx

; ======================================================================
; CODIGO 0x98fb..0x9d5c  (1121 bytes)
; ======================================================================


imagen_de_alerta:		; la imagen de la alerta (p56:A242 con la 1, p56:A2A6 con la 2) con p12:6FC4 y dos franjas a la VRAM
	call 041ddh		;98fb   ; bancos_12: pone el 12 en 0x6000 (con su copia en 0xC381-0xC383)
	call 0418eh		;98fe   ; bancos_56: pone el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	ld a,(0ca5fh)		;9901   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	dec a			;9904
	ld hl,0a242h		;9905
	jr z,L_990E		;9908
	dec a			;990a
	ld hl,0a2a6h		;990b
L_990E:
	ld bc,06407h		;990e
	call 06fc4h		;9911   ; bits_a_puntos: B bytes de HL a 0xEA00: cada bit, un punto de 4 bits del color C (1) o 0x0F (0)
	ld de,0ea00h		;9914
	ld hl,00fe6h		;9917
	call franja_a_vram		;991a   ; franja_a_vram: 20 lineas de 10 bytes de DE a la VRAM de HL (+ 0x8000 en la pagina 1)
	ld de,0eac8h		;991d
	ld hl,019f0h		;9920
	call franja_a_vram		;9923   ; franja_a_vram: 20 lineas de 10 bytes de DE a la VRAM de HL (+ 0x8000 en la pagina 1)
	jp 0413fh		;9926   ; bancos_1_4_5: pone el 1 en 0x6000, el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
franja_a_vram:		; 20 lineas de 10 bytes de DE a la VRAM de HL (+ 0x8000 en la pagina 1)
	ld a,(0ca42h)		;9929   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	and a			;992c
	ld bc,00000h		;992d
	jr z,L_9934		;9930
	ld b,080h		;9932
L_9934:
	add hl,bc			;9934
	ex de,hl			;9935
	ld b,014h		;9936
L_9938:
	push bc			;9938
	xor a			;9939
	ld bc,0000ah		;993a
	call 04486h		;993d   ; copia_a_vram_espera: espera al VDP (p00:4650) y copia BC bytes de HL a la VRAM de DE
	ld a,080h		;9940
	call 04243h		;9942   ; suma_a_de: DE = DE + A
	pop bc			;9945
	djnz L_9938		;9946
	ret			;9948
alguien_ve_a_snake:		; p14:B128: la alerta (la musica 0x8C y 0xCA5F)
	ld a,(0c383h)		;9949   ; lee la copia del banco de 0xA000
	push af			;994c
	call 041efh		;994d   ; bancos_14: pone el 14 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b128h		;9950   ; alguien_ve_a_snake: salvo en el estado 0x14 o desde el 0x1B de Snake: 0xD43E = 0xFF, p14:B214, 0xCAF6 = 0, 0xD4F4 = 0xD41E (o 0xD449 en una especial); el actor IX de tipo 3, 4 o 5, aparte (p14:B399, B3E3, B3F4); si no, la alerta (p14:B15C)
	jr L_9971		;9953
a_p14_b176_guarda:		; p14:B176 guardando el banco de 0xA000
	ld a,(0c383h)		;9955   ; lee la copia del banco de 0xA000
	push af			;9958
	call 041efh		;9959   ; bancos_14: pone el 14 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b176h		;995c   ; alerta_sin_musica: 0xD4F4 = 0xD41E (o 0xD449 en una especial) y la alerta
	jr L_9971		;995f
d43e_a_ff:		; 0xD43E = 0xFF
	ld a,0ffh		;9961
	ld (0d43eh),a		;9963
	ret			;9966
L_9967:
	ld a,(0c383h)		;9967   ; lee la copia del banco de 0xA000
	push af			;996a
	call 041efh		;996b   ; bancos_14: pone el 14 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b284h		;996e   ; actores_en_alerta: 0xD416 y 0xD451 a cero, lo lanzado (p14:B269) y cada actor activo a la alerta (p14:B2AB)
L_9971:
	pop af			;9971
	push af			;9972
	jp 041a3h		;9973
a_p14_b34f_guarda:		; p14:B34F guardando el banco de 0xA000
	ld a,(0c383h)		;9976   ; lee la copia del banco de 0xA000
	push af			;9979
	call 041efh		;997a   ; bancos_14: pone el 14 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b34fh		;997d   ; dibujo_del_15: el dibujo (0x28 + su dibujo * 16, 0xB0), 16 x 16, en su sitio (X - 8, Y - 0x0F) con la operacion 0xC8 (0xD8 en la pagina 1)
	jr L_9971		;9980
acuden_al_ruido:		; al acabar la cuenta de 0xD446 (4 al disparar, p03:AF12), sin alerta 2: los actores van a donde estaba Snake (0xD41C)
	ld hl,0d446h		;9982   ; apunta a la cuenta hasta que los actores acuden a donde estaba Snake (4 al disparar, p03:AF12)
	ld a,(hl)			;9985
	and a			;9986
	ret z			;9987
	dec (hl)			;9988
	ret nz			;9989
	ld a,(0ca5fh)		;998a   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	cp 002h		;998d
	ret nc			;998f
	call y_x_de_snake_en_hl		;9990   ; el sitio, en 0xD41C-0xD41D
	ex de,hl			;9993
	ld hl,0d41ch		;9994   ; apunta a la Y y la X a las que acuden los actores (16 bits)
	ld (hl),e			;9997
	inc hl			;9998
	ld (hl),d			;9999
	ld ix,0ce00h		;999a   ; apunta a los actores: 24 fichas de 0x40 bytes (p04:800D)
	ld b,018h		;999e
L_99A0:
	ld a,(ix+000h)		;99a0   ; los tipos 4 y 5 no acuden
	and a			;99a3
	jr z,L_99B6		;99a4
	cp 004h		;99a6
	jr z,L_99B6		;99a8
	cp 005h		;99aa
	jr z,L_99B6		;99ac
	call se_ve_el_actor_si		;99ae   ; se_ve_el_actor_si: p14:B9DC guardando HL, DE y BC
	push bc			;99b1
	call nc,acude_el_actor		;99b2   ; acude_el_actor: el 3 por p04:9A11, el 0x0A por p04:9A2B; desde el 0x0C no
	pop bc			;99b5
L_99B6:
	ld de,00040h		;99b6
	add ix,de		;99b9
	djnz L_99A0		;99bb
	ret			;99bd
acude_el_actor:		; el 3 por p04:9A11, el 0x0A por p04:9A2B; desde el 0x0C no
	ld a,(ix+000h)		;99be   ; lee el tipo del actor (0 = libre)
	cp 003h		;99c1
	jp z,acude_el_3		;99c3   ; acude_el_3: el 3 en esta sala, en el paso 1 y con la rapidez < 5: guarda el paso y al 4
	cp 00ah		;99c6
	jp z,acude_el_0a		;99c8   ; acude_el_0a: el 0x0A en esta sala y en el paso 0: al paso 1
	cp 00ch		;99cb
	ret nc			;99cd
	call en_esta_sala		;99ce   ; solo en esta sala y sin el byte 0x1F
	ret nz			;99d1
	ld a,(ix+01fh)		;99d2
	and a			;99d5
	ret nz			;99d6
	ld a,(ix+001h)		;99d7   ; en los pasos 0-5 o 0x21...
	cp 021h		;99da
	jr z,L_99E1		;99dc
	cp 006h		;99de
	ret nc			;99e0
L_99E1:
	ld (ix+021h),a		;99e1   ; ...guarda el paso (0x21), y pasa al 0x0A (al 6 con alerta), con la Y y la X en 0x24-0x25
	ld a,(0ca5fh)		;99e4   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	and a			;99e7
	ld a,00ah		;99e8
	jr z,L_99EE		;99ea
	ld a,006h		;99ec
L_99EE:
	ld (ix+001h),a		;99ee   ; guarda el paso del actor
	ld a,(ix+003h)		;99f1   ; lee la Y del actor
	ld (ix+024h),a		;99f4
	ld a,(ix+005h)		;99f7   ; lee la X del actor
	ld (ix+025h),a		;99fa
	ld a,(ix+00dh)		;99fd   ; la direccion del dibujo a 0x1E
	rrca			;9a00
	and 007h		;9a01
	ld (ix+01eh),a		;9a03
	ld a,(ix+00ch)		;9a06   ; el eje a 0x23
	ld (ix+023h),a		;9a09
	call camino_al_ruido		;9a0c   ; el camino (p04:9A3A)
	jr lanza_1		;9a0f
acude_el_3:		; el 3 en esta sala, en el paso 1 y con la rapidez < 5: guarda el paso y al 4
	call en_esta_sala		;9a11   ; en_esta_sala: Z si el actor esta en la sala de ahora (fila y columna)
	ret nz			;9a14
	ld a,(ix+019h)		;9a15
	cp 005h		;9a18
	ret nc			;9a1a
	ld a,(ix+001h)		;9a1b   ; lee el paso del actor
	cp 001h		;9a1e
	ret nz			;9a20
	ld (ix+021h),a		;9a21
	ld (ix+001h),004h		;9a24   ; el paso del actor = 0x04
lanza_1:		; lo lanzado de tipo 1
	jp lanza_1_b		;9a28   ; lanza_1_b: lo lanzado de tipo 1
acude_el_0a:		; el 0x0A en esta sala y en el paso 0: al paso 1
	call en_esta_sala		;9a2b   ; en_esta_sala: Z si el actor esta en la sala de ahora (fila y columna)
	ret nz			;9a2e
	ld a,(ix+001h)		;9a2f   ; lee el paso del actor
	and a			;9a32
	ret nz			;9a33
	ld (ix+001h),001h		;9a34   ; el paso del actor = 0x01
	jr lanza_1		;9a38
camino_al_ruido:		; tres puntos del camino hacia 0xD41C en los bytes 0x24-0x29: el de ahora y dos esquinas (p04:9A59)
	ld l,(ix+005h)		;9a3a   ; lee la X del actor
	ld h,(ix+003h)		;9a3d   ; lee la Y del actor
	ld (ix+024h),h		;9a40
	ld (ix+025h),l		;9a43
	call esquina_hacia		;9a46   ; esquina_hacia: la esquina siguiente hacia 0xD41C por el eje mas largo (p06:B256)
	ld (ix+026h),h		;9a49
	ld (ix+027h),l		;9a4c
	call esquina_hacia		;9a4f   ; esquina_hacia: la esquina siguiente hacia 0xD41C por el eje mas largo (p06:B256)
	ld (ix+028h),h		;9a52
	ld (ix+029h),l		;9a55
	ret			;9a58
esquina_hacia:		; la esquina siguiente hacia 0xD41C por el eje mas largo (p06:B256)
	ex de,hl			;9a59
	push de			;9a5a
	ld hl,(0d41ch)		;9a5b   ; lee la Y y la X a las que acuden los actores (16 bits)
	ld a,h			;9a5e
	ld h,l			;9a5f
	ld l,a			;9a60
	push hl			;9a61
	call lados_de		;9a62   ; lados_de:
	pop hl			;9a65
	pop de			;9a66
	push de			;9a67
	call eje_hacia		;9a68   ; eje_hacia:
	and b			;9a6b
	call primer_bit		;9a6c   ; primer_bit: C = el primer bit a uno de A (0-3)
	pop de			;9a6f
	ld bc,(0c382h)		;9a70   ; lee la copia del banco de 0x8000 y el byte siguiente (16 bits)
	push bc			;9a74
	call 041a0h		;9a75   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b256h		;9a78   ; avanza_hasta_choque_en: p06:B267 con la Y (L) entre 8 y 0xB7
	pop af			;9a7b
	push af			;9a7c
	jp 041a3h		;9a7d
lanzado_cada_cuadro:		; sin 0xD445, las 6 fichas de lo que lanzan los actores: p06:A7E9, p14:BA36, p04:9C82 y p06:A979
	ld a,(0d445h)		;9a80   ; lee 1 mientras las 6 fichas de 0xD460 son las de p06:B2D6 (sin choques, p07:AD5C)
	and a			;9a83
	ret nz			;9a84
	ld ix,0d460h		;9a85   ; apunta a 6 fichas de 16 bytes de lo que lanzan los actores (p04:9B55)
	ld b,006h		;9a89
L_9A8B:
	push bc			;9a8b
	ld a,(ix+000h)		;9a8c   ; lee el tipo de lo lanzado
	and a			;9a8f
	jr z,L_9AA0		;9a90
	call a_p06_a7e9_guarda		;9a92   ; a_p06_a7e9_guarda: p06:A7E9 guardando el banco de 0xA000
	ld a,003h		;9a95
	call llama_ba36_a		;9a97   ; llama_ba36_a:
	call choca_lo_lanzado		;9a9a   ; choca_lo_lanzado: lo lanzado de tipo 4 en adelante: fuera de la sala o contra lo solido, se acaba (p06:AA18), salvo el 3 y el 7
	call a_p06_a979_guarda		;9a9d   ; a_p06_a979_guarda: p06:A979 guardando el banco de 0xA000
L_9AA0:
	ld bc,00010h		;9aa0
	add ix,bc		;9aa3
	pop bc			;9aa5
	djnz L_9A8B		;9aa6
	ret			;9aa8
a_p06_a8e8_guarda:		; p06:A8E8 guardando el banco de 0xA000
	ld a,(0c383h)		;9aa9   ; lee la copia del banco de 0xA000
	push af			;9aac
	call 041a0h		;9aad   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a8e8h		;9ab0   ; lanza_el_3: lo lanzado de tipo 3 (IY) desde el actor IX: el sonido 0x0E, dos sprites (C y C + 1, colores 7 y 0x48), la Y final la de Snake - 0x10, velocidades 0xFE00 en Y y 0x30 en X, en la Y y la X del actor - 0x10
	jr L_9ABF		;9ab3
a_p06_a924_guarda:		; p06:A924 guardando el banco de 0xA000
	ld a,(0c383h)		;9ab5   ; lee la copia del banco de 0xA000
	push af			;9ab8
	call 041a0h		;9ab9   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a924h		;9abc   ; lanza_el_7: lo lanzado de tipo 7 (IY): el sonido 0x43, el sprite C (color 7), 6 cuadros, en (H, L) de 0xD8E6
L_9ABF:
	pop af			;9abf
	push af			;9ac0
	jp 041a3h		;9ac1
a_p06_a7e9_guarda:		; p06:A7E9 guardando el banco de 0xA000
	ld a,(0c383h)		;9ac4   ; lee la copia del banco de 0xA000
	push af			;9ac7
	call 041a0h		;9ac8   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a7e9h		;9acb   ; lanzado_por_tipo: lo lanzado de IX segun su tipo (p06:A7F0): el 1 p06:A800, el 3 p06:A885, el 7 p06:A8E1; los demas, nada
	jr L_9ABF		;9ace
a_p06_a942_guarda:		; p06:A942 guardando el banco de 0xA000
	ld a,(0c383h)		;9ad0   ; lee la copia del banco de 0xA000
	push af			;9ad3
	call 041a0h		;9ad4   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a942h		;9ad7   ; desplazamiento_de_4: 0xD43C = el desplazamiento de p06:A952 segun el dibujo del actor ((byte 0x0D / 2) & 3)
	jr L_9ABF		;9ada
a_p06_a979_guarda:		; p06:A979 guardando el banco de 0xA000
	ld a,(0c383h)		;9adc   ; lee la copia del banco de 0xA000
	push af			;9adf
	call 041a0h		;9ae0   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a979h		;9ae3   ; sprite_del_lanzado: el sprite de lo lanzado en su sitio: el 1 por p06:A9DA, el 3 dos (p06:A9C3 por el byte 0x0F), el 5 con el patron 0xB8, el 7 con 0xF0/0xF4 (segun la cuenta) 2 arriba y 8 a la izquierda; los demas, 0x18
	jr L_9ABF		;9ae6
a_p06_a95a_guarda:		; p06:A95A guardando el banco de 0xA000
	ld a,(0c383h)		;9ae8   ; lee la copia del banco de 0xA000
	push af			;9aeb
	call 041a0h		;9aec   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a95ah		;9aef   ; desplazamiento_de_8: 0xD43C = el desplazamiento de p06:A969 segun el dibujo del actor (byte 0x0D & 7)
	jr L_9ABF		;9af2
lanza_7:		; lo lanzado de tipo 7
	ld b,007h		;9af4
	jr lanza		;9af6
lanza_3:		; lo lanzado de tipo 3
	ld b,003h		;9af8
	jr lanza_hacia_snake		;9afa
lanza_1_bancos_8:
	call lanza_1_b		;9afc   ; lanza_1_b: lo lanzado de tipo 1
	jp 041bdh		;9aff   ; bancos_8: pone el 8 en 0xA000 (con su copia en 0xC381-0xC383)
lanza_1_b:		; lo lanzado de tipo 1
	ld b,001h		;9b02
	jr lanza_hacia_snake		;9b04
lanza_5:		; p06:A942 y lo lanzado de tipo 5
	call a_p06_a942_guarda		;9b06   ; a_p06_a942_guarda: p06:A942 guardando el banco de 0xA000
	ld b,005h		;9b09
	jr lanza_hacia_snake		;9b0b
lanza_8:		; p06:A942, su desplazamiento en 0xD43C y lo lanzado de tipo 8
	cp 00ah		;9b0d
	call a_p06_a942_guarda		;9b0f   ; a_p06_a942_guarda: p06:A942 guardando el banco de 0xA000
	ld (0d43ch),hl		;9b12
	ld b,008h		;9b15
	jr lanza_hacia_snake		;9b17
lanza_8_b:		; p06:A95A y lo lanzado de tipo 8
	ld b,008h		;9b19
	call a_p06_a95a_guarda		;9b1b   ; a_p06_a95a_guarda: p06:A95A guardando el banco de 0xA000
	jr lanza_al_byte_18		;9b1e
L_9B20:
	ld hl,000f0h		;9b20
	ld (0d43ch),hl		;9b23
	ld b,006h		;9b26
lanza_al_byte_18:		; hacia (H, L) = los bytes 0x19 y 0x18 del actor
	ld h,(ix+019h)		;9b28
	ld l,(ix+018h)		;9b2b
	jr lanza		;9b2e
lanza_6_e0:		; tipo 6 con el desplazamiento 0x00E0
	ld bc,000e0h		;9b30
	ld (0d43ch),bc		;9b33
	ld b,006h		;9b37
	jr lanza		;9b39
lanza_6_a942:
	call a_p06_a942_guarda		;9b3b   ; a_p06_a942_guarda: p06:A942 guardando el banco de 0xA000
	jr L_9B49		;9b3e
lanza_6_f0:		; tipo 6 con el desplazamiento 0x00F0
	ld a,(ix+000h)		;9b40   ; lee el tipo del actor (0 = libre)
	ld hl,000f0h		;9b43
	ld (0d43ch),hl		;9b46
L_9B49:
	ld b,006h		;9b49
	jr lanza_hacia_snake		;9b4b
lanza_4:		; p06:A942 y lo lanzado de tipo 4 hacia Snake
	call a_p06_a942_guarda		;9b4d   ; a_p06_a942_guarda: p06:A942 guardando el banco de 0xA000
	ld b,004h		;9b50
lanza_hacia_snake:		; hacia Snake
	call y_x_de_snake_en_hl		;9b52   ; y_x_de_snake_en_hl: L = la Y, H = la X de Snake
lanza:		; lo lanzado de tipo B hacia (H, L): la primera ficha libre de 0xD460 y sus sprites de 0xD410
	ld (0d8e6h),hl		;9b55
	ld a,b			;9b58
	ld (0d8e8h),a		;9b59
	ld iy,0d460h		;9b5c   ; la primera libre de las 6
	ld b,006h		;9b60
L_9B62:
	ld a,(iy+000h)		;9b62   ; libre?
	and a			;9b65
	jr z,L_9B70		;9b66
	ld de,00010h		;9b68   ; la siguiente, 16 bytes mas alla
	add iy,de		;9b6b
	djnz L_9B62		;9b6d
	ret			;9b6f
L_9B70:
	ld hl,0d410h		;9b70   ; los sprites libres: 6 desde el 0x10; el 3, 3 de dos en dos
	ld a,(0d8e8h)		;9b73
	cp 003h		;9b76
	ld bc,00610h		;9b78
	ld d,001h		;9b7b
	jr nz,L_9B82		;9b7d
	ld b,003h		;9b7f
	inc d			;9b81
L_9B82:
	ld a,(hl)			;9b82   ; el sprite libre?
	and a			;9b83
	jr z,L_9B8F		;9b84
	ld a,l			;9b86   ; si no, el siguiente (de D en D)
	add a,d			;9b87
	ld l,a			;9b88
	ld a,c			;9b89
	add a,d			;9b8a
	ld c,a			;9b8b
	djnz L_9B82		;9b8c
	ret			;9b8e
L_9B8F:
	exx			;9b8f   ; la ficha a cero
	push iy		;9b90   ; la ficha
	pop hl			;9b92
	ld bc,0000fh		;9b93   ; 16 bytes...
	call 04236h		;9b96   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	exx			;9b99
	ld a,c			;9b9a   ; el sprite, en el otro AF
	ex af,af'			;9b9b
	ld a,(0d8e8h)		;9b9c   ; el 3: p06:A8E8; el 7: p06:A924; los de menos de 4: p04:9C3E
	cp 003h		;9b9f
	jp z,a_p06_a8e8_guarda		;9ba1   ; a_p06_a8e8_guarda: p06:A8E8 guardando el banco de 0xA000
	cp 007h		;9ba4
	jp z,a_p06_a924_guarda		;9ba6   ; a_p06_a924_guarda: p06:A924 guardando el banco de 0xA000
	cp 004h		;9ba9
	jp c,lanza_cerca		;9bab   ; lanza_cerca: los tipos 1-3: el sprite, la ficha del actor (bytes 0x0A-0x0B) y el byte 0x0C = 2
	push hl			;9bae
	push bc			;9baf
	ld hl,(0d43ch)		;9bb0   ; desde el actor mas el desplazamiento de 0xD43C...
	ld a,(ix+005h)		;9bb3   ; lee la X del actor
	add a,h			;9bb6   ; la X de partida
	ld d,a			;9bb7
	ld a,(ix+003h)		;9bb8   ; lee la Y del actor
	add a,l			;9bbb   ; la Y de partida
	ld e,a			;9bbc
	ld (0d8e4h),de		;9bbd   ; a 0xD8E4-0xD8E5
	ld hl,(0d8e6h)		;9bc1   ; ...hacia el destino, 0x14 mas arriba...
	ld a,l			;9bc4   ; el destino 0x14 mas arriba
	add a,0ech		;9bc5
	ld l,a			;9bc7
	ld a,(0d8e8h)		;9bc8   ; ...con la rapidez 0xF0 (8), 0xC0 (6) o 0xE0...
	cp 008h		;9bcb   ; la rapidez: 0xF0 el 8...
	ld b,0f0h		;9bcd
	jr z,L_9BD9		;9bcf
	cp 006h		;9bd1   ; ...0xE0 los demas...
	ld b,0e0h		;9bd3
	jr nz,L_9BD9		;9bd5
	ld b,0c0h		;9bd7   ; ...0xC0 el 6
L_9BD9:
	ld a,b			;9bd9   ; la rapidez
	call 07987h		;9bda   ; ...la velocidad
	ld (0d8e0h),hl		;9bdd   ; guarda de paso: en p00:4D5A, 1 = solo las listas 6 y 7; en p14:BE6D, la cuenta de la racha y el byte siguiente (16 bits)
	ld (0d8e2h),de		;9be0   ; guarda de paso (en p01:62B5: 0 copia con ldir, 1 caracter a caracter) y el byte siguiente (16 bits)
	call apunta_bien		;9be4   ; el 4 solo si apunta en la direccion del actor (p04:9C6C)
	pop bc			;9be7   ; si apunta
	pop hl			;9be8
	ret z			;9be9   ; no apunta bien: nada
	ld (hl),001h		;9bea   ; el sprite ocupado
	ld a,(0d8e8h)		;9bec   ; el tipo
	ld (iy+000h),a		;9bef   ; [tipo][1]...
	inc (iy+001h)		;9bf2   ; el paso 1
	ld (iy+00eh),c		;9bf5   ; ...el sprite...
	ld bc,(0d8e4h)		;9bf8   ; ...la Y y la X...
	ld (iy+003h),c		;9bfc   ; la Y...
	ld (iy+005h),b		;9bff   ; ...y la X
	ld bc,(0d8e2h)		;9c02   ; ...las velocidades
	ld (iy+007h),b		;9c06   ; la velocidad en Y...
	ld (iy+006h),c		;9c09
	ld bc,(0d8e0h)		;9c0c   ; lee de paso: en p00:4D5A, 1 = solo las listas 6 y 7; en p14:BE6D, la cuenta de la racha y el byte siguiente (16 bits)
	ld (iy+009h),b		;9c10   ; ...y en X
	ld (iy+008h),c		;9c13
	ex af,af'			;9c16   ; los colores del sprite: 0x0F el 5, 7 los demas
	ld c,a			;9c17   ; C = el sprite
	ld a,(0d8e8h)		;9c18
	cp 005h		;9c1b
	ld a,00fh		;9c1d   ; 0x0F el 5
	jr z,L_9C23		;9c1f
	ld a,007h		;9c21   ; 7 los demas
L_9C23:
	call color_de_sprite		;9c23   ; color_de_sprite: las 16 lineas de colores del sprite C (0xDAA0 + C * 16) con el color A
	ld a,(0d800h)		;9c26   ; el sonido: 0x4C con la ficha 0xD800 de tipo 5, 0x1D con la de tipo 2, 0x49 el 5, 0x1A los demas
	cp 005h		;9c29
	jp z,06c4fh		;9c2b   ; sonido_4c: pide el sonido 0x4C
	cp 002h		;9c2e
	jp z,06a6fh		;9c30   ; sonido_1d: pide el sonido 0x1D
	ld a,(0d8e8h)		;9c33
	cp 005h		;9c36
	jp z,06c1fh		;9c38   ; sonido_49: pide el sonido 0x49
	jp 06a5ch		;9c3b   ; sonido_1a: pide el sonido 0x1A
lanza_cerca:		; los tipos 1-3: el sprite, la ficha del actor (bytes 0x0A-0x0B) y el byte 0x0C = 2
	ld (hl),001h		;9c3e   ; el sprite ocupado
	ld a,(0d8e8h)		;9c40   ; el tipo
	ld (iy+000h),a		;9c43
	ld (iy+00eh),c		;9c46   ; el sprite
	push ix		;9c49   ; el actor que lo lanza...
	pop de			;9c4b
	ld (iy+00ah),e		;9c4c   ; ...en los bytes 0x0A-0x0B
	ld (iy+00bh),d		;9c4f
	ld (iy+00ch),002h		;9c52   ; el byte 0x0C = 2
	inc (iy+001h)		;9c56   ; el paso 1
	ld a,007h		;9c59   ; el color 7
color_de_sprite:		; las 16 lineas de colores del sprite C (0xDAA0 + C * 16) con el color A
	ld l,c			;9c5b
	ld h,000h		;9c5c
	ld bc,0daa0h		;9c5e
	add hl,hl			;9c61
	add hl,hl			;9c62
	add hl,hl			;9c63
	add hl,hl			;9c64
	add hl,bc			;9c65
	ld bc,0000fh		;9c66
	jp 04237h		;9c69   ; llena_bloque: pone A en BC + 1 bytes desde HL
apunta_bien:		; el 4: NZ si la direccion de 8 hacia el destino es la del actor (p14:B842)
	ld a,(0d8e8h)		;9c6c
	cp 004h		;9c6f
	ret nz			;9c71
	call a_p14_b842_guarda		;9c72   ; a_p14_b842_guarda: p14:B842 guardando el banco de 0xA000
	push af			;9c75
	call en_ocho		;9c76   ; en_ocho: el angulo de 0xCA5D en 8 trozos de 0x20 (centrados)
	pop bc			;9c79
	cp b			;9c7a
	jr z,L_9C7F		;9c7b
	xor a			;9c7d
	ret			;9c7e
L_9C7F:
	or 001h		;9c7f
	ret			;9c81
choca_lo_lanzado:		; lo lanzado de tipo 4 en adelante: fuera de la sala o contra lo solido, se acaba (p06:AA18), salvo el 3 y el 7
	ld a,(ix+000h)		;9c82   ; lee el tipo de lo lanzado
	cp 004h		;9c85
	ret c			;9c87
	cp 005h		;9c88   ; el 5 mira su propio recuadro (p04:9CC2)
	jp z,dentro_del_recuadro		;9c8a   ; dentro_del_recuadro: el 5: fuera de Y 0x18-0xB7 o X 8-0xB7, se acaba
	ld a,(ix+003h)		;9c8d   ; lee la Y de lo lanzado
	ld l,a			;9c90
	cp 0c0h		;9c91
	jr nc,L_9CA1		;9c93
	ld a,(ix+005h)		;9c95   ; lee la X de lo lanzado
	ld h,a			;9c98
	cp 0c0h		;9c99
	jr nc,L_9CA1		;9c9b
	call 07f88h		;9c9d   ; cuatro_hacia_abajo: acarreo si (H, L) y los 3 puntos de 8 en 8 hacia abajo son solidos o estan fuera
	ret nc			;9ca0
L_9CA1:
	ld a,(ix+000h)		;9ca1   ; lee el tipo de lo lanzado
	cp 003h		;9ca4
	ret z			;9ca6
	cp 007h		;9ca7
	ret z			;9ca9
a_p06_aa18_guarda:		; p06:AA18 guardando el banco de 0xA000
	ld a,(0c383h)		;9caa   ; lee la copia del banco de 0xA000
	push af			;9cad
	call 041a0h		;9cae   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0aa18h		;9cb1   ; fin_del_lanzado: lo lanzado se acaba: tipo 0, el sprite fuera y libre su sitio de 0xD400 (dos para el 3)
	jp L_9ABF		;9cb4
sprite_de_lanzado:		; HL = el sprite (byte 0x0E) desde el 10 (0xDC28)
	ld a,(ix+00eh)		;9cb7   ; lee el sprite de lo lanzado
	add a,a			;9cba
	add a,a			;9cbb
	ld hl,0dc28h		;9cbc
	jp 0423eh		;9cbf   ; suma_a_hl: HL = HL + A
dentro_del_recuadro:		; el 5: fuera de Y 0x18-0xB7 o X 8-0xB7, se acaba
	ld a,(ix+003h)		;9cc2   ; lee la Y de lo lanzado
	sub 018h		;9cc5
	cp 0a0h		;9cc7
	jr nc,L_9CA1		;9cc9
	ld a,(ix+005h)		;9ccb   ; lee la X de lo lanzado
	sub 008h		;9cce
	cp 0b0h		;9cd0
	jr nc,L_9CA1		;9cd2
	ret			;9cd4
a_p12_74bc:		; p12:74BC con el banco 12 en 0x6000
	call 041ddh		;9cd5   ; bancos_12: pone el 12 en 0x6000 (con su copia en 0xC381-0xC383)
	call 074bch		;9cd8   ; aviso_d458: el aviso de 0xD458 ([que y bits][cuenta][Y][X][fila][columna]): la primera vez, guarda lo de debajo y lo pinta (p12:74F4); despues cuenta y al acabar, 0xCA28 = 0, la ficha libre y, en la sala del aviso, lo de debajo de vuelta (p12:74CB)
	jr vuelve_al_1		;9cdb
L_9CDD:
	call 041ddh		;9cdd   ; bancos_12: pone el 12 en 0x6000 (con su copia en 0xC381-0xC383)
	call 074cbh		;9ce0   ; quita_aviso: 0xCA28 = 0, 0xD458 libre y, en la misma sala, lo de debajo de vuelta: el 1, 0x10 x 0x10 desde (0xC0, 0x80); los otros por p12:7579
vuelve_al_1:		; el banco 1 en 0x6000
	jp 041eah		;9ce3   ; bancos_1: pone el 1 en 0x6000 (con su copia en 0xC381-0xC383)
a_p12_758d:		; p12:758D con el banco 12 en 0x6000
	call 041ddh		;9ce6   ; bancos_12: pone el 12 en 0x6000 (con su copia en 0xC381-0xC383)
	call 0758dh		;9ce9   ; aviso_1: el aviso 1 (quitando el de antes) sobre el actor IX: 0xCA28 = 1, la cuenta 0x10, la Y - 0x28 (o 0) y la X + 4 (o - 0x14 desde 0x80), con la sala de Snake
	jr vuelve_al_1		;9cec
aviso_08_20:		; el aviso B = 8, C = 0x20
	ld bc,00820h		;9cee
aviso_de_actor:		; 0xCA28 = 1 (el juego espera) y p12:75C3 con B y C
	ld a,001h		;9cf1
	ld (0ca28h),a		;9cf3
	call 041ddh		;9cf6   ; bancos_12: pone el 12 en 0x6000 (con su copia en 0xC381-0xC383)
	call 075c3h		;9cf9   ; aviso_b: sin otro, el aviso B con la cuenta C sobre el actor IX (el 8 en (E, D)): la Y - 0x30 (o 0) y la X par - 0x2C (bit 7) o 0x1C, entre 0 y 0x68; con la sala de Snake
	jr vuelve_al_1		;9cfc
aviso_83_18:
	ld bc,08318h		;9cfe
	jr aviso_de_actor		;9d01
aviso_84_18:
	ld bc,08418h		;9d03
	jr aviso_de_actor		;9d06
aviso_05_20:
	ld bc,00520h		;9d08
	jr aviso_de_actor		;9d0b
aviso_06_20:
	ld bc,00620h		;9d0d
	jr aviso_de_actor		;9d10
aviso_07_30:		; en esta sala, el aviso 7 de 0x30
	call en_esta_sala		;9d12   ; en_esta_sala: Z si el actor esta en la sala de ahora (fila y columna)
	ret nz			;9d15
	ld bc,00730h		;9d16
	jr aviso_de_actor		;9d19
aviso_82_20:
	ld bc,08220h		;9d1b
	jr aviso_de_actor		;9d1e
aviso_09_18:
	ld bc,00918h		;9d20
	jr aviso_de_actor		;9d23
aviso_8b_20:
	ld bc,08b20h		;9d25
	jr aviso_de_actor		;9d28
aviso_0a_30:
	ld bc,00a30h		;9d2a
	jr aviso_de_actor		;9d2d
aviso_8c_30:
	ld bc,08c30h		;9d2f
	jr aviso_de_actor		;9d32
aviso_8d_30:
	ld bc,08d30h		;9d34
	jr aviso_de_actor		;9d37
actor_corriente:		; los tipos 0, 1 y 3-8 (p04:815B): con el bit 7, p04:8EE9; con la alerta 1, p05:A2AD; con la 2-3 y paso < 0x15, a por Snake
	ld a,(ix+000h)		;9d39   ; lee el tipo del actor (0 = libre)
	rla			;9d3c
	jp c,L_8EE9		;9d3d
	ld a,(0ca5fh)		;9d40   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	and a			;9d43
	jr z,L_9D53		;9d44
	cp 001h		;9d46
	jp z,0a2adh		;9d48   ; actor_en_alerta_1: la alerta 1: los pasos 0x25 y 0x26 (lanzar), los demas por p05:A2BD
	ld a,(ix+001h)		;9d4b   ; lee el paso del actor
	cp 015h		;9d4e
	jp c,actor_por_paso		;9d50   ; actor_por_paso: si no se ve, nada; el paso 8 p06:B626, el 9 p04:8ED9, los demas por p04:8F2A
L_9D53:
	call 0a019h		;9d53   ; sin alerta: p05:A019 y su paso (p04:9D5C)
	ld a,(ix+001h)		;9d56   ; lee el paso del actor
	call 0424dh		;9d59   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_9D5C: 42 destinos del despachador p00:424D (call en p04:9D59, el
;   indice en A): 8D7E, A250, A265, A27F, 8DB0, A2A6, A0E1, A118, 8ECD, 8ED9,
;   9DB0, 9DC2, 9E05, 9E31, 9E5A, 9E6F, A1C5, A1E5, A20C, A23F, A236, A14B,
;   A161, A188, A1A7, A1A0, A1B6, A12F, A062, A080, A09A, A0AA, A0BC, A0DB,
;   9FA7, 9FEB, A001, 9E9A, 9EA4, 9EC1, 9EFD, A071; lo leen p04:9D59 (84
;   bytes)
;   0x9d5c..0x9db0  (84 bytes)
DATA_tabla_9D5C:
	defw 08d7eh,0a250h,0a265h,0a27fh,08db0h,0a2a6h,0a0e1h,0a118h	; 9d5c
	defw 08ecdh,08ed9h,09db0h,09dc2h,09e05h,09e31h,09e5ah,09e6fh	; 9d6c
	defw 0a1c5h,0a1e5h,0a20ch,0a23fh,0a236h,0a14bh,0a161h,0a188h	; 9d7c
	defw 0a1a7h,0a1a0h,0a1b6h,0a12fh,0a062h,0a080h,0a09ah,0a0aah	; 9d8c
	defw 0a0bch,0a0dbh,09fa7h,09febh,0a001h,09e9ah,09ea4h,09ec1h	; 9d9c
	defw 09efdh,0a071h	; 9dac  -> aparece_en_68_30 0xa071

; ======================================================================
; CODIGO 0x9db0..0x9ffe  (590 bytes)
; ======================================================================


hacia_la_esquina_1:		; hacia el segundo punto del camino (bytes 0x26-0x27)
	ld h,(ix+026h)		;9db0
	ld l,(ix+027h)		;9db3
	jp gira_hacia		;9db6   ; gira_hacia: la direccion hacia (H, L) por el eje mas largo, con su velocidad
d44f_de_1_a_2:		; Z si 0xD44F era 1 (y pasa a 2)
	ld hl,0d44fh		;9db9   ; 0xD44F...
	ld a,(hl)			;9dbc
	dec a			;9dbd   ; ...si no es 1, NZ
	ret nz			;9dbe
	ld (hl),002h		;9dbf   ; ...si lo es, 2 y Z
	ret			;9dc1
camino_paso_1:		; con 0xD44F: el paso 0x0E y al punto de partida; si no, anda hasta la esquina y gira hacia la siguiente
	call d44f_de_1_a_2		;9dc2   ; d44f_de_1_a_2: Z si 0xD44F era 1 (y pasa a 2)
	jr nz,L_9DCE		;9dc5
	ld (ix+001h),00eh		;9dc7   ; el paso del actor = 0x0E
	jp hacia_el_principio		;9dcb   ; hacia_el_principio: hacia el punto de partida (bytes 0x24-0x25)
L_9DCE:
	ld d,(ix+026h)		;9dce
	ld e,(ix+027h)		;9dd1
	call ha_llegado		;9dd4   ; ha_llegado: acarreo si aun no ha llegado al punto D (vertical) o E (horizontal), segun hacia donde va
	jr nc,L_9DDE		;9dd7
	call L_900B		;9dd9
	or a			;9ddc
	ret			;9ddd
L_9DDE:
	ld h,(ix+028h)		;9dde
	ld l,(ix+029h)		;9de1
	call gira_hacia		;9de4   ; gira_hacia: la direccion hacia (H, L) por el eje mas largo, con su velocidad
	scf			;9de7
	ret			;9de8
ha_llegado:		; acarreo si aun no ha llegado al punto D (vertical) o E (horizontal), segun hacia donde va
	ld a,(ix+00ch)		;9de9
	rra			;9dec
	ld b,(ix+007h)		;9ded   ; lee la velocidad del actor en Y (alta)
	ld a,(ix+003h)		;9df0   ; lee la Y del actor
	jr c,L_9DFC		;9df3
	ld b,(ix+009h)		;9df5   ; lee la velocidad del actor en X (alta)
	ld a,(ix+005h)		;9df8   ; lee la X del actor
	ld d,e			;9dfb
L_9DFC:
	rl b		;9dfc
	jr nc,L_9E03		;9dfe
	ld e,a			;9e00
	ld a,d			;9e01
	ld d,e			;9e02
L_9E03:
	cp d			;9e03
	ret			;9e04
camino_paso_2:		; con 0xD44F: el paso 0x0D (1 con alerta); si no, anda hasta el punto; alli, se para 0x7F cuadros
	call d44f_de_1_a_2		;9e05   ; d44f_de_1_a_2: Z si 0xD44F era 1 (y pasa a 2)
	jr nz,L_9E1A		;9e08
	ld a,(0ca5fh)		;9e0a   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	and a			;9e0d
	ld a,00dh		;9e0e
	jr z,L_9E14		;9e10
	ld a,001h		;9e12
L_9E14:
	ld (ix+001h),a		;9e14   ; guarda el paso del actor
	jp vuelve_a_la_esquina		;9e17   ; vuelve_a_la_esquina: hacia la esquina de los bytes 0x26-0x27
L_9E1A:
	ld d,(ix+028h)		;9e1a
	ld e,(ix+029h)		;9e1d
	call ha_llegado		;9e20   ; ha_llegado: acarreo si aun no ha llegado al punto D (vertical) o E (horizontal), segun hacia donde va
	jp c,L_900B		;9e23
	ld (ix+00ch),000h		;9e26
	ld (ix+00eh),07fh		;9e2a   ; la espera del actor = 0x7F
	jp 0a27bh		;9e2e   ; paso_siguiente: el paso siguiente del actor
camino_paso_3:		; espera mirando (p06:B5E2 cada 16 cuadros); al acabar, de vuelta
	call d44f_de_1_a_2		;9e31   ; d44f_de_1_a_2: Z si 0xD44F era 1 (y pasa a 2)
	jr z,vuelve_a_la_esquina		;9e34
	dec (ix+00eh)		;9e36   ; baja la espera del actor
	jr nz,mira_cada_16		;9e39
vuelve_a_la_esquina:		; hacia la esquina de los bytes 0x26-0x27
	ld h,(ix+026h)		;9e3b
	ld l,(ix+027h)		;9e3e
gira_hacia:		; la direccion hacia (H, L) por el eje mas largo, con su velocidad
	call lados_de_hl		;9e41   ; lados_de_hl:
	call eje_hacia_hl		;9e44   ; eje_hacia_hl:
	and b			;9e47
	call primer_bit		;9e48   ; primer_bit: C = el primer bit a uno de A (0-3)
	call a_p06_b592_b_4_5		;9e4b   ; a_p06_b592_b_4_5: a_p06_b592 y deja los bancos 4 y 5
	jp 0a27bh		;9e4e   ; paso_siguiente: el paso siguiente del actor
mira_cada_16:		; cada 16 cuadros, p06:B5E2
	ld a,(ix+00eh)		;9e51   ; lee la espera del actor
	and 00fh		;9e54
	ret nz			;9e56
	jp a_p06_b5e2		;9e57   ; a_p06_b5e2: p06:B5E2 con el banco 6 en 0xA000
camino_de_vuelta:		; anda hasta la esquina; alli, al punto de partida
	ld d,(ix+026h)		;9e5a
	ld e,(ix+027h)		;9e5d
	call ha_llegado		;9e60   ; ha_llegado: acarreo si aun no ha llegado al punto D (vertical) o E (horizontal), segun hacia donde va
	jp c,L_900B		;9e63
hacia_el_principio:		; hacia el punto de partida (bytes 0x24-0x25)
	ld h,(ix+024h)		;9e66
	ld l,(ix+025h)		;9e69
	jp gira_hacia		;9e6c   ; gira_hacia: la direccion hacia (H, L) por el eje mas largo, con su velocidad
llega_al_principio:		; en el punto de partida: la direccion, la Y, la X, el paso y el eje de antes
	ld d,(ix+024h)		;9e6f
	ld e,(ix+025h)		;9e72
	call ha_llegado		;9e75   ; ha_llegado: acarreo si aun no ha llegado al punto D (vertical) o E (horizontal), segun hacia donde va
	jp c,L_900B		;9e78
	ld a,(ix+01eh)		;9e7b
	call a_p06_b592_b_4_5		;9e7e   ; a_p06_b592_b_4_5: a_p06_b592 y deja los bancos 4 y 5
	ld a,(ix+024h)		;9e81
	ld (ix+003h),a		;9e84   ; guarda la Y del actor
	ld a,(ix+025h)		;9e87
	ld (ix+005h),a		;9e8a   ; guarda la X del actor
	ld a,(ix+021h)		;9e8d
	ld (ix+001h),a		;9e90   ; guarda el paso del actor
	ld a,(ix+023h)		;9e93
	ld (ix+00ch),a		;9e96
	ret			;9e99
aviso_y_espera:		; el aviso 5, 0x20 cuadros (byte 0x1C) y p05:A27B
	call aviso_05_20		;9e9a   ; aviso_05_20:
	ld (ix+01ch),020h		;9e9d
	jp 0a27bh		;9ea1   ; paso_siguiente: el paso siguiente del actor
lanza_cada_4:		; durante 0x1C cuadros, cada 4 lanza hacia Snake; al acabar, lo de antes y el aviso 6
	dec (ix+01ch)		;9ea4
	jr z,L_9EB2		;9ea7
	ld a,(ix+01ch)		;9ea9
	and 003h		;9eac
	ret nz			;9eae
	jp lanza_4		;9eaf   ; lanza_4: p06:A942 y lo lanzado de tipo 4 hacia Snake
L_9EB2:
	ld a,(ix+022h)		;9eb2
	ld (ix+00ch),a		;9eb5
	ld a,(ix+020h)		;9eb8
	ld (ix+001h),a		;9ebb   ; guarda el paso del actor
	jp aviso_06_20		;9ebe   ; aviso_06_20:
aparece_en_b4_70:		; al acabar la espera: Y = 0xB4, X = 0x70 en la fila 1 columna 7 (la especial 0x18 aparte)
	dec (ix+00eh)		;9ec1   ; baja la espera del actor
	ret nz			;9ec4
	ld (ix+01bh),001h		;9ec5
	ld (ix+003h),0b4h		;9ec9   ; la Y del actor = 0xB4
	ld (ix+005h),070h		;9ecd   ; la X del actor = 0x70
	ld bc,00107h		;9ed1
	ld a,(0ca76h)		;9ed4   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 018h		;9ed7
	jr z,L_9EEE		;9ed9
L_9EDB:
	call en_esta_sala		;9edb   ; la fila y la columna...
	ld (ix+00ah),b		;9ede   ; guarda la fila de la sala del actor
	ld (ix+00bh),c		;9ee1   ; guarda la columna de la sala del actor
	jp nz,0a23ah		;9ee4   ; ...fuera de esta sala, p05:A23A
	push bc			;9ee7   ; en esta sala, sus sprites fuera (p04:9FC0)
	call suelta_sprites		;9ee8   ; suelta_sprites: los 4 primeros sprites del actor (bytes 0x2E-0x31) libres y fuera
	pop bc			;9eeb
	jr L_9EFA		;9eec
L_9EEE:
	ld (ix+00ah),b		;9eee   ; guarda la fila de la sala del actor
	ld (ix+00bh),c		;9ef1   ; guarda la columna de la sala del actor
	call en_esta_sala		;9ef4   ; en_esta_sala: Z si el actor esta en la sala de ahora (fila y columna)
	call z,pinta_actor		;9ef7   ; pinta_actor: sus sprites (p04:81C5) con el banco 8
L_9EFA:
	jp 0a23ah		;9efa   ; al_paso_4: el paso 4
aparece_en_68_30:		; Y = 0x68, X = 0x30, el dibujo 2, en la fila 1 columna 9
	ld (ix+01bh),000h		;9efd
	ld (ix+003h),068h		;9f01   ; la Y del actor = 0x68
	ld (ix+005h),030h		;9f05   ; la X del actor = 0x30
	ld (ix+00dh),002h		;9f09   ; el dibujo del actor (bit 0: el paso) = 0x02
	ld bc,00109h		;9f0d
	ld a,(0ca76h)		;9f10   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 018h		;9f13
	jr z,L_9EDB		;9f15
	and a			;9f17
	jr z,L_9EEE		;9f18
	ld (ix+00ah),b		;9f1a   ; guarda la fila de la sala del actor
	ld (ix+00bh),c		;9f1d   ; guarda la columna de la sala del actor
	jr L_9EFA		;9f20
llega_a_b4:		; el tipo 9 en la fila 1 columna 7: al llegar a Y = 0xB4, el paso 0x28 y (en la sala 4 o la especial 0x18) la bandera de 0xD509
	ld bc,00927h		;9f22   ; el tipo 9, el paso 0x28
	ld hl,0d500h		;9f25   ; la bandera de 0xD500
	ld a,(ix+01bh)		;9f28   ; con el byte 0x1B...
	and a			;9f2b
	jr nz,L_9F32		;9f2c
	ld d,00bh		;9f2e   ; sin el byte 0x1B: D = 0x0B y como p04:9F73 (columna 9, Y = 0x64)
	jr llega_a_y		;9f30
L_9F32:
	inc c			;9f32
	ld a,(ix+000h)		;9f33   ; lee el tipo del actor (0 = libre)
	cp b			;9f36
	ret nz			;9f37
	ld a,(ix+00ah)		;9f38   ; lee la fila de la sala del actor
	dec a			;9f3b
	ret nz			;9f3c
	ld a,(ix+00bh)		;9f3d   ; lee la columna de la sala del actor
	cp 007h		;9f40
	ret nz			;9f42
	ld a,(ix+003h)		;9f43   ; lee la Y del actor
	cp 0b4h		;9f46
	jr c,aun_no		;9f48
	xor a			;9f4a
	ld (ix+00ch),a		;9f4b
	ld (ix+001h),c		;9f4e   ; guarda el paso del actor
	ld a,(0ca76h)		;9f51   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 018h		;9f54
	jr z,L_9F61		;9f56
	ld a,(0ca4bh)		;9f58   ; lee la sala de la zona
	cp 004h		;9f5b
	jr z,L_9F9E		;9f5d
	xor a			;9f5f
	ret			;9f60
L_9F61:
	ld a,(0ca4bh)		;9f61   ; lee la sala de la zona
	and a			;9f64
	jr z,L_9F9E		;9f65
	ret			;9f67
aun_no:		; NZ: aun no
	or 001h		;9f68
	ret			;9f6a
llega_a_64:		; el tipo 8 en la fila 1 columna 9: al llegar a Y = 0x64, el paso 0x22 con 8 cuadros y, con 0xD510 = 0x0C, la bandera de 0xD519
	ld bc,00822h		;9f6b
	ld hl,0d510h		;9f6e
	ld d,00ch		;9f71
llega_a_y:
	ld a,(ix+000h)		;9f73   ; lee el tipo del actor (0 = libre)
	cp b			;9f76
	ret nz			;9f77
	ld a,(ix+00ah)		;9f78   ; lee la fila de la sala del actor
	dec a			;9f7b
	ret nz			;9f7c
	ld a,(ix+00bh)		;9f7d   ; lee la columna de la sala del actor
	cp 009h		;9f80
	ret nz			;9f82
	ld a,(ix+003h)		;9f83   ; lee la Y del actor
	cp 064h		;9f86
	jr nc,aun_no		;9f88
	xor a			;9f8a
	ld (ix+00ch),a		;9f8b
	ld (ix+00eh),008h		;9f8e   ; la espera del actor = 0x08
	ld (ix+001h),c		;9f92   ; guarda el paso del actor
	call en_esta_sala		;9f95   ; en_esta_sala: Z si el actor esta en la sala de ahora (fila y columna)
	jr nz,L_9FA5		;9f98
	ld a,(hl)			;9f9a
	cp d			;9f9b
	jr nz,L_9FA5		;9f9c
L_9F9E:
	ld a,009h		;9f9e
	call 0423eh		;9fa0   ; suma_a_hl: HL = HL + A
	ld (hl),001h		;9fa3
L_9FA5:
	xor a			;9fa5
	ret			;9fa6
espera_c0:		; al acabar la espera: otra de 0xC0, 0xD514 = 0, 0xD441 = 1, sin sprites en esta sala y p05:A27B
	dec (ix+00eh)		;9fa7   ; baja la espera del actor
	ret nz			;9faa
	ld (ix+00eh),0c0h		;9fab   ; la espera del actor = 0xC0
	xor a			;9faf
	ld (0d514h),a		;9fb0
	inc a			;9fb3
	ld (0d441h),a		;9fb4
	call en_esta_sala		;9fb7   ; en_esta_sala: Z si el actor esta en la sala de ahora (fila y columna)
	call z,suelta_sprites		;9fba   ; suelta_sprites: los 4 primeros sprites del actor (bytes 0x2E-0x31) libres y fuera
	jp 0a27bh		;9fbd   ; paso_siguiente: el paso siguiente del actor
suelta_sprites:		; los 4 primeros sprites del actor (bytes 0x2E-0x31) libres y fuera
	ld a,(ix+02eh)		;9fc0
	call suelta_sprite		;9fc3   ; suelta_sprite: el sprite A: libre en 0xD400 y fuera (Y = 0xE0)
	ld a,(ix+02fh)		;9fc6
	call suelta_sprite		;9fc9   ; suelta_sprite: el sprite A: libre en 0xD400 y fuera (Y = 0xE0)
	ld a,(ix+030h)		;9fcc
	call suelta_sprite		;9fcf   ; suelta_sprite: el sprite A: libre en 0xD400 y fuera (Y = 0xE0)
	ld a,(ix+031h)		;9fd2
suelta_sprite:		; el sprite A: libre en 0xD400 y fuera (Y = 0xE0)
	dec a			;9fd5
	ld b,a			;9fd6
	ld de,0d400h		;9fd7   ; apunta a los 22 sprites que se reparten los actores (1 = ocupado)
	call 04243h		;9fda   ; suma_a_de: DE = DE + A
	xor a			;9fdd
	ld (de),a			;9fde
	ld a,b			;9fdf
	add a,a			;9fe0
	add a,a			;9fe1
	ld hl,0dc28h		;9fe2
	call 0423eh		;9fe5   ; suma_a_hl: HL = HL + A
	ld (hl),0e0h		;9fe8
	ret			;9fea
espera_y_d519:		; al acabar la espera (8 cuadros), en esta sala, 0xD519 = 1
	ld hl,0d519h		;9feb
	dec (ix+00eh)		;9fee   ; baja la espera del actor
	ret nz			;9ff1
	ld (ix+00eh),008h		;9ff2   ; la espera del actor = 0x08
	call en_esta_sala		;9ff6   ; en_esta_sala: Z si el actor esta en la sala de ahora (fila y columna)
	jp nz,0a27bh		;9ff9   ; paso_siguiente: el paso siguiente del actor
	ld (hl),001h		;9ffc

; ----------------------------------------------------------------------
; DATOS partida_9FFE: los 2 primeros bytes de una instruccion de 3 (C3 7B A2)
;   que sigue en el banco 5: el trazador de un solo banco no puede verla
;   entera (tools/bancos.py); lo leen p04:9FFE (2 bytes)
;   0x9ffe..0xa000  (2 bytes)
DATA_partida_9FFE:
	defb 0c3h,07bh	; 9ffe
