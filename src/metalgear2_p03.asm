; ==========================================================================
; METAL GEAR 2 SOLID SNAKE - Konami (1990) - MSX2 - MegaROM RC-767 de 512 KB (Konami SCC) - banco 03 (se ejecuta en 0xa000)
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
lbe8ch:	equ 0x0be8c

; ======================================================================
; CODIGO 0xa000..0xa004  (4 bytes)
; ======================================================================


L_A000:
	dec hl			;a000
	ld (hl),000h		;a001
	ret			;a003

; ----------------------------------------------------------------------
; DATOS resto_A004: lo apuntan con el banco puesto p01:7699 (0xA004), p01:7702
;   (0xA004); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p01:7699, p01:7702 (29 bytes)
;   0xa004..0xa021  (29 bytes)
DATA_resto_A004:
	defb 040h,060h,00dh,019h,018h,01eh,013h,018h,01fh,00fh,0feh,040h,070h,01dh,00bh,020h	; a004  @`.........@p..
	defb 00fh,0f0h,016h,019h,00bh,00eh,0feh,040h,080h,00fh,018h,00eh,0ffh	; a014  .......@.....

; ======================================================================
; CODIGO 0xa021..0xa216  (501 bytes)
; ======================================================================


linea_o_cuadro_ram:		; copiada a 0xC2A0: con acarreo es la interrupcion de linea (la pantalla partida); sin el, la del cuadro
	ld hl,(00006h)		;a021   ; los puertos del VDP
	inc h			;a024   ; H = el puerto de control...
	inc l			;a025   ; ...L = el de estado
	ld c,h			;a026
	ld a,001h		;a027   ; S#1...
	out (c),a		;a029   ; 1...
	ld a,08fh		;a02b   ; ...a R#15
	out (c),a		;a02d
	ld c,l			;a02f   ; ...B = S#1
	in a,(c)		;a030   ; S#1
	ld b,a			;a032
	xor a			;a033   ; R#15 = 0 otra vez...
	ld c,h			;a034
	out (c),a		;a035   ; 0...
	ld a,08fh		;a037   ; ...a R#15
	out (c),a		;a039
	ld c,l			;a03b   ; ...y S#0
	in a,(c)		;a03c   ; S#0
	rla			;a03e   ; el bit 7 (F): el cuadro
	jr nc,L_A07F		;a03f   ; no es el cuadro: p03:A07F
	ld a,(0ca1ch)		;a041   ; sin 0xCA1C, nada que partir
	and a			;a044
	ret z			;a045
	ld c,h			;a046
	ld a,(0ffe7h)		;a047   ; R#8 con los sprites...
	and 0fdh		;a04a   ; sin el bit 1: con sprites
	out (c),a		;a04c
	ld a,088h		;a04e   ; ...a R#8
	out (c),a		;a050
	ld a,01fh		;a052   ; ...R#2 = 0x1F: arriba la pagina 0...
	out (c),a		;a054   ; 0x1F...
	ld a,082h		;a056   ; ...a R#2
	out (c),a		;a058
	ld c,h			;a05a
	ld a,(0ca01h)		;a05b   ; en los pasos 2-4, sin desplazamiento (y la linea 8 mas abajo)
	sub 002h		;a05e   ; los pasos 2, 3 y 4...
	cp 003h		;a060
	ld a,(0fff6h)		;a062   ; si no, el desplazamiento de 0xFFF6
	ld b,a			;a065
	jr nc,L_A06B		;a066   ; ...no
	xor a			;a068   ; sin desplazamiento...
	ld b,008h		;a069   ; ...y la linea 8 mas abajo
L_A06B:
	out (c),a		;a06b   ; R#23: el desplazamiento vertical
	ld a,097h		;a06d
	out (c),a		;a06f
	ld a,0b4h		;a071   ; R#19 = 0xB4 + el desplazamiento: la linea de la interrupcion
	add a,b			;a073
	jr nz,L_A077		;a074
	inc a			;a076
L_A077:
	out (c),a		;a077
	ld a,093h		;a079
	out (c),a		;a07b
	xor a			;a07d   ; sin acarreo
	ret			;a07e
L_A07F:
	ld a,b			;a07f   ; el bit 0 de S#1 (FH): la linea
	rra			;a080
	ccf			;a081
	ret c			;a082   ; no es la linea: con acarreo, nada
	ld a,(0ca1ch)		;a083   ; sin 0xCA1C, nada
	and a			;a086
	jr z,L_A0B4		;a087
L_A089:
	ld c,h			;a089   ; espera al borde de la linea (S#2 bit 5, HR)...
	ld a,002h		;a08a   ; S#2...
	out (c),a		;a08c
	ld a,08fh		;a08e
	out (c),a		;a090
	ld c,l			;a092
	in a,(c)		;a093
	bit 5,a		;a095   ; ...el bit 5: HR, el borde
	jr z,L_A089		;a097
	ld c,h			;a099   ; ...R#8 sin sprites...
	ld a,(0ffe7h)		;a09a
	or 002h		;a09d   ; con el bit 1: sin sprites
	out (c),a		;a09f
	ld a,088h		;a0a1   ; ...a R#8
	out (c),a		;a0a3
	ld a,03fh		;a0a5   ; ...R#2 = 0x3F: abajo la pagina 1...
	out (c),a		;a0a7   ; 0x3F...
	ld a,082h		;a0a9   ; ...a R#2
	out (c),a		;a0ab
	xor a			;a0ad   ; ...R#23 = 0
	out (c),a		;a0ae   ; 0...
	ld a,097h		;a0b0   ; ...a R#23
	out (c),a		;a0b2
L_A0B4:
	scf			;a0b4
	ret			;a0b5
interrupcion_ram:		; copiada a 0xC200: la interrupcion del juego, cada cuadro
	di			;a0b6
	call 0c2a0h		;a0b7   ; la linea de la pantalla partida?
	jr nc,L_A0C1		;a0ba
	call 0013eh		;a0bc   ; BIOS RDVDP - Reads VDP status register | si: borra el aviso y vuelve
	ei			;a0bf
	ret			;a0c0
L_A0C1:
	ld a,(0cac0h)		;a0c1   ; en pausa no corren las esperas
	and a			;a0c4
	jr nz,L_A0E5		;a0c5
	ld hl,0ca18h		;a0c7   ; la espera de la musica pendiente...
	ld a,(hl)			;a0ca
	and a			;a0cb
	jr z,L_A0CF		;a0cc
	dec (hl)			;a0ce   ; ...un cuadro menos
L_A0CF:
	ld hl,(0cb63h)		;a0cf   ; 0xCB63 un cuadro menos (16 bits)
	ld a,l			;a0d2
	or h			;a0d3
	jr z,L_A0DA		;a0d4
	dec hl			;a0d6
	ld (0cb63h),hl		;a0d7   ; guarda una espera de 16 bits que baja en la interrupcion
L_A0DA:
	ld hl,(0caf7h)		;a0da   ; 0xCAF7 un cuadro menos (16 bits)
	ld a,h			;a0dd
	or l			;a0de
	jr z,L_A0E2		;a0df
	dec hl			;a0e1
L_A0E2:
	ld (0caf7h),hl		;a0e2   ; guarda otra espera de 16 bits que baja en la interrupcion
L_A0E5:
	ld hl,0ca06h		;a0e5   ; 0xCA06: el sonido ya esta corriendo (una interrupcion dentro de otra)
	ld a,(hl)			;a0e8   ; ya corriendo: nada mas
	and a			;a0e9   ; ya corriendo...
	jr nz,L_A146		;a0ea
	inc (hl)			;a0ec   ; lo apunta
	ld a,010h		;a0ed   ; los bancos del sonido: 16-17-18-19
	ld (05000h),a		;a0ef   ; el mapper: pone en 0x4000 el banco de A
	inc a			;a0f2   ; el 17...
	ld (07000h),a		;a0f3   ; el mapper: pone en 0x6000 el banco de A
	inc a			;a0f6   ; ...el 18...
	ld (09000h),a		;a0f7   ; el mapper: pone en 0x8000 el banco de A
	inc a			;a0fa   ; ...el 19
	ld (0b000h),a		;a0fb   ; el mapper: pone en 0xA000 el banco de A
	ei			;a0fe   ; con interrupciones...
	call 04006h		;a0ff   ; ...el sonido de este cuadro (p16:4006)
	di			;a102   ; sin interrupciones
	xor a			;a103   ; el sonido ha acabado
	ld (0ca06h),a		;a104   ; guarda 1 mientras corre el sonido de la interrupcion
	di			;a107   ; sin interrupciones
	ld hl,0c380h		;a108   ; los bancos de antes
	ld a,(hl)			;a10b   ; el banco de 0x4000
	ld (05000h),a		;a10c   ; el mapper: pone en 0x4000 el banco de A
	inc hl			;a10f
	ld a,(hl)			;a110   ; el de 0x6000
	ld (07000h),a		;a111   ; el mapper: pone en 0x6000 el banco de A
	inc hl			;a114
	ld a,(hl)			;a115   ; el de 0x8000
	ld (09000h),a		;a116   ; el mapper: pone en 0x8000 el banco de A
	inc hl			;a119
	ld a,(hl)			;a11a   ; el de 0xA000
	ld (0b000h),a		;a11b   ; el mapper: pone en 0xA000 el banco de A
	ld hl,0ca05h		;a11e   ; 0xCA05: el juego ya esta corriendo (el cuadro anterior no ha acabado)
	ld a,(hl)			;a121   ; ya corriendo: nada mas
	and a			;a122   ; ya corriendo...
	jr nz,L_A146		;a123
	inc (hl)			;a125   ; lo apunta
	ei			;a126   ; con interrupciones (el juego puede tardar mas de un cuadro)
	ld a,03fh		;a127   ; el banco 63 en 0xA000...
	ld (0b000h),a		;a129   ; el mapper: pone en 0xA000 el banco de A
	ld (0c383h),a		;a12c   ; guarda la copia del banco de 0xA000
	call 0b800h		;a12f   ; ...p63:B800...
	ld a,003h		;a132   ; ...y otra vez el 3
	ld (0b000h),a		;a134   ; el mapper: pone en 0xA000 el banco de A
	ld (0c383h),a		;a137   ; guarda la copia del banco de 0xA000
	jr c,L_A142		;a13a   ; con acarreo, el juego no corre este cuadro
	call 08045h		;a13c   ; el mando y las teclas
	call 0728eh		;a13f   ; y el juego de este cuadro
L_A142:
	xor a			;a142   ; el juego ha acabado
	ld (0ca05h),a		;a143   ; guarda 1 mientras corre el juego de la interrupcion
L_A146:
	call 0013eh		;a146   ; BIOS RDVDP - Reads VDP status register | borra el aviso del VDP
	ei			;a149
	ret			;a14a
pide_sonido_ram:		; copiada a 0xC340: pone 16-17-18-19, pide el sonido A y devuelve los bancos
	di			;a14b   ; sin interrupciones...
	push hl			;a14c   ; ...guarda los registros...
	push de			;a14d
	push bc			;a14e
	push ix		;a14f   ; guarda IX
	push af			;a151   ; ...y el sonido pedido
	ld a,010h		;a152   ; los bancos del sonido
	ld (05000h),a		;a154   ; el mapper: pone en 0x4000 el banco de A
	inc a			;a157   ; el 17...
	ld (07000h),a		;a158   ; el mapper: pone en 0x6000 el banco de A
	inc a			;a15b   ; ...el 18...
	ld (09000h),a		;a15c   ; el mapper: pone en 0x8000 el banco de A
	inc a			;a15f   ; ...el 19
	ld (0b000h),a		;a160   ; el mapper: pone en 0xA000 el banco de A
	pop af			;a163   ; el sonido pedido
	push af			;a164
	call 04003h		;a165   ; p16:4003: pide el sonido A
	ld hl,0c380h		;a168   ; los bancos de antes
	ld a,(hl)			;a16b   ; el banco de 0x4000
	ld (05000h),a		;a16c   ; el mapper: pone en 0x4000 el banco de A
	inc hl			;a16f
	ld a,(hl)			;a170   ; el de 0x6000
	ld (07000h),a		;a171   ; el mapper: pone en 0x6000 el banco de A
	inc hl			;a174
	ld a,(hl)			;a175   ; el de 0x8000
	ld (09000h),a		;a176   ; el mapper: pone en 0x8000 el banco de A
	inc hl			;a179
	ld a,(hl)			;a17a   ; el de 0xA000
	ld (0b000h),a		;a17b   ; el mapper: pone en 0xA000 el banco de A
	pop af			;a17e   ; los registros de antes
	pop ix		;a17f
	pop bc			;a181
	pop de			;a182
	pop hl			;a183
	ei			;a184   ; con interrupciones
	ret			;a185
calla_sonido_ram:		; copiada a 0xC000: con los bancos 16-19, p16:4000 (todo callado) y los bancos de antes
	di			;a186   ; sin interrupciones...
	push hl			;a187   ; ...guarda los registros
	push de			;a188
	push bc			;a189
	push af			;a18a
	ld a,010h		;a18b   ; los bancos 16-19
	ld (05000h),a		;a18d   ; el mapper: pone en 0x4000 el banco de A
	inc a			;a190   ; el 17...
	ld (07000h),a		;a191   ; el mapper: pone en 0x6000 el banco de A
	inc a			;a194   ; ...el 18...
	ld (09000h),a		;a195   ; el mapper: pone en 0x8000 el banco de A
	inc a			;a198   ; ...el 19
	ld (0b000h),a		;a199   ; el mapper: pone en 0xA000 el banco de A
	call 04000h		;a19c   ; p16:4000
	ld hl,0c380h		;a19f   ; apunta a la copia del banco de 0x4000
	ld a,(hl)			;a1a2   ; el banco de 0x4000
	ld (05000h),a		;a1a3   ; el mapper: pone en 0x4000 el banco de A
	inc hl			;a1a6
	ld a,(hl)			;a1a7   ; el de 0x6000
	ld (07000h),a		;a1a8   ; el mapper: pone en 0x6000 el banco de A
	inc hl			;a1ab
	ld a,(hl)			;a1ac   ; el de 0x8000
	ld (09000h),a		;a1ad   ; el mapper: pone en 0x8000 el banco de A
	inc hl			;a1b0
	ld a,(hl)			;a1b1   ; el de 0xA000
	ld (0b000h),a		;a1b2   ; el mapper: pone en 0xA000 el banco de A
	pop af			;a1b5   ; los registros de antes
	pop bc			;a1b6
	pop de			;a1b7
	pop hl			;a1b8
	ei			;a1b9   ; con interrupciones
	ret			;a1ba
snake_al_empezar:		; Snake al empezar: 0xCA58 = 0, las esperas a 1, el estado 0, mirando a la izquierda
	xor a			;a1bb
	ld (0ca58h),a		;a1bc
	inc a			;a1bf   ; 1 en las esperas de quieto y del paso...
	ld (0cb1ah),a		;a1c0   ; guarda la espera hasta el dibujo de quieto (4 cuadros)
	ld (0cb15h),a		;a1c3   ; guarda la espera hasta el paso siguiente (p02:988A, segun la marcha)
	ld (0cb1eh),a		;a1c6   ; ...y en 0xCB1E
	xor a			;a1c9
	call pon_estado		;a1ca   ; el estado 0 y el dibujo 0
	ld hl,00303h		;a1cd   ; la direccion 3 (izquierda), pedida y la de ahora
	ld (0cb0dh),hl		;a1d0   ; guarda la direccion pedida con el mando (1 arriba, 2 abajo, 3 izquierda, 4 derecha) y el byte siguiente (16 bits)
	ld a,020h		;a1d3   ; 0xCB29 = 0x20
	ld (0cb29h),a		;a1d5
	ld a,080h		;a1d8   ; 0xCB26 = 0x80
	ld (0cb26h),a		;a1da
	ret			;a1dd
snake_cada_cuadro:		; Snake en cada cuadro: su estado y lo que le pasa
	call snake_por_estado		;a1de   ; por su estado (p03:A20B)
	ld a,(0cb00h)		;a1e1   ; en el estado 0x14 o desde el 0x1B, nada mas
	cp 014h		;a1e4
	ret z			;a1e6
	cp 01bh		;a1e7
	ret nc			;a1e9
	ld a,(0cb21h)		;a1ea   ; con 0xCB21 = 2 tampoco
	cp 002h		;a1ed
	ret z			;a1ef
	call 08bfch		;a1f0   ; p06:A6F9
	call 0642ch		;a1f3   ; vida_que_se_va: con 0xCB4B (y sin 0xCB3C), la vida baja un punto cada 16 cuadros (0xCB4E)
	call 09aa5h		;a1f6   ; el_agua: solo en la zona 6: 0xCAAA, 0xCB3F y la barra de la derecha
	call 09f7dh		;a1f9   ; cambia_d4f5: si no sale de la sala, 0xD4F5 = 0xCB3F (2 como mucho) y, si cambia, p01:6CCA
	call 09f94h		;a1fc   ; cuenta_cb3a: con 0xCB39, sin 0xCA5F, chocando y sin 0xCB3C
	call 09ff7h		;a1ff   ; cuenta_cb3d: con 0xCB3D, 0xCB3E un cuadro menos
	call 09c02h		;a202   ; pisa_algo: en la especial 0x38 sala 1 (p06:BD9B), la zona 0x12 (p06:BD7D) o la 0x13 (p06:BD8E): lo que pisan Snake o 0xCB80
	call mira_cb28		;a205   ; p03:AE4A
	jp 09a96h		;a208   ; llama_a14d_a2aa_a139: p06:A14D, p06:A2AA y p06:A139 con el banco 6
snake_por_estado:		; con 0xCB3C, nada
	ld a,(0cb3ch)		;a20b
	or a			;a20e
	ret nz			;a20f
	ld a,(0cb00h)		;a210   ; por el estado de Snake (p03:A216, 29)
	call 0424dh		;a213   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_A216: 29 destinos del despachador p00:424D (call en p03:A213, el
;   indice en A): A276, A302, A3BD, A549, A301, A560, A5DF, A5F5, A5FC, A61B,
;   A634, A6AE, A9A4, A9D5, A9ED, AB2B, AB3D, A931, A977, ABAF, AC48, ACAE,
;   ACD8, AD47, AD58, 8B90, ABDA, A250, A260; lo leen p03:A213 (58 bytes)
;   0xa216..0xa250  (58 bytes)
DATA_tabla_A216:
	defw 0a276h,0a302h,0a3bdh,0a549h,0a301h,0a560h,0a5dfh,0a5f5h	; a216
	defw 0a5fch,0a61bh,0a634h,0a6aeh,0a9a4h,0a9d5h,0a9edh,0ab2bh	; a226
	defw 0ab3dh,0a931h,0a977h,0abafh,0ac48h,0acaeh,0acd8h,0ad47h	; a236
	defw 0ad58h,08b90h,0abdah,0a250h,0a260h	; a246

; ======================================================================
; CODIGO 0xa250..0xa3de  (398 bytes)
; ======================================================================


estado_1b:		; el estado 0x1B: esconde el sprite 4, espera 300 cuadros (0xCB63) y el estado 0x1C
	ld a,0e0h		;a250   ; el sprite 4 fuera
	ld (0dc10h),a		;a252
	ld hl,0012ch		;a255   ; 300 cuadros
	ld (0cb63h),hl		;a258   ; guarda una espera de 16 bits que baja en la interrupcion
	ld hl,0cb00h		;a25b   ; el estado siguiente
	inc (hl)			;a25e
	ret			;a25f
estado_1c:		; el estado 0x1C: al acabar la espera, 0xCB58 = 0xCA40 = 0 y el sonido 1
	ld a,0e0h		;a260
	ld (0dc10h),a		;a262
	ld hl,(0cb63h)		;a265   ; la espera...
	ld a,h			;a268
	or l			;a269
	ret nz			;a26a   ; ...sigue
	xor a			;a26b
	ld hl,0cb58h		;a26c
	ld (hl),a			;a26f
	ld (0ca40h),a		;a270
	jp 06a0dh		;a273   ; sonido_01: pide el sonido 0x01
estado_0:		; el estado 0: andar; los dos disparos, el estado 2; el disparo 1, p03:A56C; el 2, p03:A360
	ld a,(0ca58h)		;a276   ; con 0xCA58, nada
	or a			;a279
	ret nz			;a27a
	call dos_disparos		;a27b   ; los dos disparos (p03:A29B)...
	jp c,a_estado_2		;a27e   ; ...el estado 2
	ld a,(0cb16h)		;a281   ; dandose la vuelta, solo se mueve
	or a			;a284
	jp nz,anda_y_sitios		;a285   ; anda_y_sitios: con 0xCB80 = 6, solo p03:ADA6
	ld a,(0ca07h)		;a288   ; el disparo 1 recien pulsado
	and 010h		;a28b
	jp nz,disparo_1		;a28d   ; disparo_1: el disparo 1: con 0xE040 o 0xCB3C, nada
	ld a,(0ca07h)		;a290   ; el disparo 2 recien pulsado
	and 020h		;a293
	jp nz,disparo_2		;a295   ; disparo_2: el disparo 2: con 0xCB20 = 7, nada
	jp anda_y_sitios		;a298   ; anda_y_sitios: con 0xCB80 = 6, solo p03:ADA6
dos_disparos:		; acarreo si con el disparo 2 apretado se pulsa el 1 y se puede (no en el agua, ni con 0xCB37, 0xCAA0, 0xCB4B...)
	ld a,(0d820h)		;a29b   ; con 0xD820 = 8 en la sala 5 y 0xD821 < 0x0F, no
	cp 008h		;a29e
	jr nz,L_A2B0		;a2a0
	ld a,(0ca4bh)		;a2a2   ; lee la sala de la zona
	cp 005h		;a2a5
	jr nz,L_A2B0		;a2a7
	ld a,(0d821h)		;a2a9
	cp 00fh		;a2ac
	jr c,L_A2C8		;a2ae
L_A2B0:
	ld a,(0ca4ah)		;a2b0   ; en la zona 0x12, sala 0x0C, o la 2 con 0xD8AA, no
	cp 012h		;a2b3
	jr nz,L_A2CA		;a2b5
	ld a,(0ca4bh)		;a2b7   ; lee la sala de la zona
	cp 00ch		;a2ba
	jr z,L_A2C8		;a2bc
	cp 002h		;a2be
	jr nz,L_A2CA		;a2c0
	ld a,(0d8aah)		;a2c2
	or a			;a2c5
	jr z,L_A2CA		;a2c6
L_A2C8:
	or a			;a2c8
	ret			;a2c9
L_A2CA:
	ld a,(0ca76h)		;a2ca   ; en la especial 0x26, no
	cp 026h		;a2cd
	jr nz,L_A2D3		;a2cf
	or a			;a2d1
	ret			;a2d2
L_A2D3:
	ld a,(0d43bh)		;a2d3   ; con 0xD43B, solo con el bit 6 de 0xD7D9
	or a			;a2d6
	jr z,L_A2E0		;a2d7
	ld a,(0d7d9h)		;a2d9
	rla			;a2dc
	rla			;a2dd
	ccf			;a2de
	ret nc			;a2df
L_A2E0:
	ld a,(0cb3fh)		;a2e0   ; en el agua, no
	or a			;a2e3   ; en el agua, no
	ret nz			;a2e4
	ld a,(0cb37h)		;a2e5   ; con 0xCB37, no
	or a			;a2e8
	ret nz			;a2e9
	ld a,(0caa0h)		;a2ea   ; lee cuantos siguen a Snake por su rastro (1-4)
	or a			;a2ed   ; con 0xCAA0, no
	ret nz			;a2ee
	ld a,(0cb4bh)		;a2ef   ; lee con el puesto, la vida baja un punto cada 16 cuadros
	or a			;a2f2   ; con 0xCB4B, no
	ret nz			;a2f3
	ld a,(0ca08h)		;a2f4   ; el disparo 2 apretado...
	and 020h		;a2f7   ; el disparo 2 apretado
	ret z			;a2f9
	ld a,(0ca07h)		;a2fa   ; ...y el 1 recien pulsado
	and 010h		;a2fd   ; el disparo 1 recien pulsado
	ret z			;a2ff
	scf			;a300   ; si
estado_4:		; el estado 4 no hace nada
	ret			;a301
estado_1:		; el estado 1: como el 0, y con el disparo 1 apretado anda en el sitio
	call dos_disparos		;a302   ; dos_disparos: acarreo si con el disparo 2 apretado se pulsa el 1 y se puede (no en el agua, ni con 0xCB37, 0xCAA0, 0xCB4B...)
	jp c,a_estado_2		;a305   ; los dos disparos: el estado 2
	ld a,(0cb16h)		;a308   ; lee 1 mientras Snake se da la vuelta
	or a			;a30b
	jr nz,L_A33C		;a30c
	ld a,(0cb3fh)		;a30e   ; en el agua sin 0xCAAA...
	or a			;a311
	jr z,L_A31A		;a312
	ld a,(0caaah)		;a314   ; lee en la zona 6: lo ponen los dos disparos (el 2 apretado y el 1 recien pulsado), lo quita cualquiera
	or a			;a317
	jr nz,L_A33C		;a318
L_A31A:
	ld a,(0ca08h)		;a31a   ; ...el disparo 1 apretado...
	and 010h		;a31d
	jr z,L_A33C		;a31f
	ld a,(0cb37h)		;a321   ; ...(con 0xCB37, desde 0x0B en 0xCB29)...
	or a			;a324
	jr z,L_A32E		;a325
	ld a,(0cb29h)		;a327
	cp 00bh		;a32a
	jr c,L_A33C		;a32c
L_A32E:
	ld a,001h		;a32e   ; ...el paso 1 y su dibujo...
	ld (0cb15h),a		;a330   ; guarda la espera hasta el paso siguiente (p02:988A, segun la marcha)
	ld (0cb13h),a		;a333   ; guarda el paso de la animacion de andar (0-3)
	call 0986ah		;a336   ; dibujo_del_paso: el dibujo del paso (p02:9888)
	jp usa_cb20		;a339   ; ...y p03:AE63
L_A33C:
	xor a			;a33c   ; 0xD750 = 0xD751 = 0
	ld (0d750h),a		;a33d
	ld (0d751h),a		;a340
	ld a,(0ca07h)		;a343   ; el disparo 2 recien pulsado: p03:A360
	and 020h		;a346
	jr nz,disparo_2		;a348
anda_y_sitios:		; con 0xCB80 = 6, solo p03:ADA6
	ld a,(0cb80h)		;a34a   ; lee las 6 fichas de 16 bytes de lo que lanza Snake ([tipo][..][Y 8.8][X 8.8][velocidades]...)
	cp 006h		;a34d
	jr z,L_A35D		;a34f
	call 0889dh		;a351   ; los sitios, la vuelta y el movimiento
	call 0936eh		;a354   ; date_la_vuelta: si Snake esta dandose la vuelta, sigue (p02:93E5); si no, mira si se pide
	call 09402h		;a357   ; mueve_a_snake: dandose la vuelta no se mueve
	call punto_del_arma		;a35a   ; p03:AD60
L_A35D:
	jp pose_con_cb21_1		;a35d   ; p03:ADA6
disparo_2:		; el disparo 2: con 0xCB20 = 7, nada
	ld a,(0cb20h)		;a360   ; lee lo que usa el disparo 1 (0 nada; p02:8001 elige por ello)
	cp 007h		;a363
	ret z			;a365
	ld a,(0cb0eh)		;a366   ; 0xCB17 = la direccion + 8
	add a,008h		;a369
	ld (0cb17h),a		;a36b
	ld a,004h		;a36e   ; 4 cuadros (0xCB1D)
	ld (0cb1dh),a		;a370
	ld a,003h		;a373   ; el estado 3
	call pon_estado		;a375   ; pon_estado: el estado A y el dibujo A
	ld a,(0e220h)		;a378   ; sin mensaje, lo que hay delante
	or a			;a37b
	call z,09942h		;a37c   ; delante_de_snake: lo que hay delante de Snake: p11:A117 y p01:6A19 o p01:6ACA; si no, p01:6A15
	call mira_e1c0		;a37f   ; p03:AE14
	call 08bc8h		;a382   ; p07:AED1 y p07:AF0D
	jp 08bd0h		;a385   ; a_p07_af0d: p07:AF0D con el banco 7 en 0xA000
a_estado_2:		; al estado 2: 0xCB2E = 0, 0xCB31 = 1, la vuelta, 4 cuadros, la marcha 1 y el sonido 0x12
	xor a			;a388
	ld (0cb2eh),a		;a389   ; 0xCB2E = 0
	inc a			;a38c   ; 0xCB31 = 1
	ld (0cb31h),a		;a38d   ; guarda 1 en el estado 2 de Snake
	call empieza_vuelta		;a390   ; la vuelta
	ld a,002h		;a393   ; el estado 2
	call pon_estado		;a395   ; pon_estado: el estado A y el dibujo A
	ld a,004h		;a398   ; 4 cuadros (0xCB1E)
	ld (0cb1eh),a		;a39a
	ld a,001h		;a39d   ; la marcha 1
	ld (0cb0ah),a		;a39f   ; guarda la marcha de Snake: el indice de las velocidades de p02:9520
	call sin_pose		;a3a2   ; p03:AE04
	jp 06a3ch		;a3a5   ; sonido_12: pide el sonido 0x12
pon_estado:		; el estado A y el dibujo A
	ld hl,0cb00h		;a3a8   ; apunta a el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	ld (hl),a			;a3ab
	inc l			;a3ac
	ld (hl),a			;a3ad
	ret			;a3ae
empieza_vuelta:		; 0xCB16 = 1 y 0xCB17 = la direccion + 4
	ld a,001h		;a3af
	ld (0cb16h),a		;a3b1   ; guarda 1 mientras Snake se da la vuelta
	ld a,(0cb0eh)		;a3b4   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	add a,004h		;a3b7
	ld (0cb17h),a		;a3b9
	ret			;a3bc
estado_2:		; el estado 2: con 0xCB4B, o un disparo recien pulsado, se acaba (p03:A4C5); si no, sus pasos de 0xCB2E
	ld a,(0cb4bh)		;a3bd   ; lee con el puesto, la vida baja un punto cada 16 cuadros
	or a			;a3c0
	jp nz,acaba_estado_2		;a3c1   ; acaba_estado_2: con 0xCA9B, se acaba
	ld a,(0ca4ah)		;a3c4   ; en la zona 0x12...
	cp 012h		;a3c7
	jr nz,L_A3D0		;a3c9
	cp 00ch		;a3cb   ; (esta comparacion es otra vez con 0x12: nunca casa)
	jp z,acaba_estado_2		;a3cd   ; acaba_estado_2: con 0xCA9B, se acaba
L_A3D0:
	ld a,(0ca07h)		;a3d0   ; un disparo recien pulsado: se acaba
	and 030h		;a3d3
	jp nz,acaba_estado_2		;a3d5   ; acaba_estado_2: con 0xCA9B, se acaba
	ld a,(0cb2eh)		;a3d8   ; por el paso de 0xCB2E (p03:A3DE)
	call 0424dh		;a3db   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_A3DE: 4 destinos del despachador p00:424D (call en p03:A3DB, el
;   indice en A): A3E6, A3F0, A465, A506; lo leen p03:A3DB (8 bytes)
;   0xa3de..0xa3e6  (8 bytes)
DATA_tabla_A3DE:
	defw 0a3e6h,0a3f0h,0a465h,0a506h	; a3de  -> estado_2_paso_0 estado_2_paso_1 estado_2_paso_2 estado_2_paso_3

; ======================================================================
; CODIGO 0xa3e6..0xa45a  (116 bytes)
; ======================================================================


estado_2_paso_0:		; espera 0xCB1E cuadros...
	ld hl,0cb1eh		;a3e6
	dec (hl)			;a3e9
	ret nz			;a3ea
paso_siguiente_cb2e:		; ...y el paso siguiente
	ld hl,0cb2eh		;a3eb   ; apunta a el paso del estado 2 de Snake
	inc (hl)			;a3ee
	ret			;a3ef
estado_2_paso_1:		; el mando y la vuelta
	call 09375h		;a3f0   ; el mando (p02:9375)
	call empieza_vuelta		;a3f3   ; empieza_vuelta: 0xCB16 = 1 y 0xCB17 = la direccion + 4
	ld a,(0cb0eh)		;a3f6   ; la direccion de ahora en el mando (p03:A45A)...
	dec a			;a3f9
	ld hl,0a45ah		;a3fa   ; la mascara de la direccion (p03:A45A)
	call 0423eh		;a3fd   ; suma_a_hl: HL = HL + A
	ld a,(0ca08h)		;a400   ; lee el mando: joystick y teclado juntos (bits 0-3 las direcciones, 4-5 los disparos)
	and (hl)			;a403   ; apretada?
	ret z			;a404   ; ...sin ella, nada
	call 09988h		;a405   ; las zonas del estado 0x0B
	ld a,(0cb00h)		;a408   ; en el estado 0x0B: p03:A453
	cp 00bh		;a40b   ; el estado 0x0B: sin vuelta y el paso
	jr z,sin_vuelta_y_paso		;a40d
	ld b,002h		;a40f   ; los puntos 2-6 de la tabla de choques (p03:A45E)...
	call choca_con_tabla_b		;a411   ; choca_con_tabla_b: acarreo si choca con la sala (p01:7EEE con la tabla B) o con algo (p11:BA03)
	ret c			;a414   ; choca: nada
	call paso_siguiente_cb2e		;a415   ; paso_siguiente_cb2e: ...y el paso siguiente
	ld b,003h		;a418   ; el punto 3...
	call choca_con_tabla_b		;a41a   ; choca_con_tabla_b: acarreo si choca con la sala (p01:7EEE con la tabla B) o con algo (p11:BA03)
	jr c,L_A447		;a41d
	ld b,004h		;a41f   ; ...el 4...
	call choca_con_tabla_b		;a421   ; choca_con_tabla_b: acarreo si choca con la sala (p01:7EEE con la tabla B) o con algo (p11:BA03)
	jr c,L_A447		;a424
	ld a,(0cb0eh)		;a426   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	cp 003h		;a429   ; ...arriba y abajo tambien el 5 y el 6
	jr nc,L_A43B		;a42b
	ld b,005h		;a42d
	call choca_con_tabla_b		;a42f   ; choca_con_tabla_b: acarreo si choca con la sala (p01:7EEE con la tabla B) o con algo (p11:BA03)
	jr c,L_A447		;a432
	ld b,006h		;a434
	call choca_con_tabla_b		;a436   ; choca_con_tabla_b: acarreo si choca con la sala (p01:7EEE con la tabla B) o con algo (p11:BA03)
	jr c,L_A447		;a439
L_A43B:
	call sin_vuelta_y_paso		;a43b   ; ...y con todos libres, el 7
	ld b,007h		;a43e
	call 07eeeh		;a440   ; choca_al_andar: los puntos de Snake en su direccion (sin direccion, nada)
	ret nc			;a443
	jp pega_de_4_en_4		;a444   ; se pega a la casilla de 4 en 4 (p03:A49B)
L_A447:
	call paso_siguiente_cb2e		;a447   ; el paso siguiente sin fracciones y la espera de la vuelta a 3
	call 09353h		;a44a   ; sin_fraccion: las fracciones de la Y y de la X a cero
	ld a,003h		;a44d
	ld (0cb18h),a		;a44f   ; guarda la espera de la vuelta
	ret			;a452
sin_vuelta_y_paso:		; 0xCB16 = 0 y el dibujo del paso
	xor a			;a453
	ld (0cb16h),a		;a454   ; guarda 1 mientras Snake se da la vuelta
	jp 0986ah		;a457   ; dibujo_del_paso: el dibujo del paso (p02:9888)

; ----------------------------------------------------------------------
; DATOS resto_A45A: lo apuntan con el banco puesto p03:A3FA (0xA45A); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p03:A3FA (4 bytes)
;   0xa45a..0xa45e  (4 bytes)
DATA_resto_A45A:
	defb 001h,002h,004h,008h	; a45a

; ======================================================================
; CODIGO 0xa45e..0xa4bd  (95 bytes)
; ======================================================================


choca_con_tabla_b:		; acarreo si choca con la sala (p01:7EEE con la tabla B) o con algo (p11:BA03)
	call 07eeeh		;a45e   ; choca_al_andar: los puntos de Snake en su direccion (sin direccion, nada)
	ret c			;a461
	jp 08bb0h		;a462   ; a_p11_ba03: p11:BA03 con el banco 11 en 0xA000
estado_2_paso_2:		; la vuelta; si la direccion cambia, otra vez el paso 0
	call 0936eh		;a465   ; date_la_vuelta: si Snake esta dandose la vuelta, sigue (p02:93E5); si no, mira si se pide
	ld a,(0cb0eh)		;a468   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ld hl,0cb0dh		;a46b   ; apunta a la direccion pedida con el mando (1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	cp (hl)			;a46e
	jr nz,L_A487		;a46f
	call 09402h		;a471   ; se mueve...
	call tope_en_el_sitio		;a474   ; ...sin pasar de 0xB0 dentro de un sitio...
	call 09988h		;a477   ; ...las zonas del estado 0x0B
	ld a,(0ca41h)		;a47a   ; saliendo de la sala, nada mas
	or a			;a47d
	ret nz			;a47e
	ld hl,0cb30h		;a47f   ; tras un choque contra la sala, otra vez el paso 0
	ld a,(hl)			;a482
	or a			;a483
	ret z			;a484
	ld (hl),000h		;a485
L_A487:
	ld hl,0cb2eh		;a487   ; el paso 0
	ld (hl),000h		;a48a
	ld a,(0cb00h)		;a48c   ; salvo en el estado 0x0B, la vuelta y 4 cuadros
	cp 00bh		;a48f
	ret z			;a491
	call empieza_vuelta		;a492   ; empieza_vuelta: 0xCB16 = 1 y 0xCB17 = la direccion + 4
	ld a,004h		;a495
	ld (0cb1eh),a		;a497
	ret			;a49a
pega_de_4_en_4:		; la Y y la X de Snake mas lo de su direccion en p03:A4BD, de 4 en 4
	ld hl,0a4bdh		;a49b
	call 09353h		;a49e   ; sin_fraccion: las fracciones de la Y y de la X a cero
	ld a,(0cb0eh)		;a4a1   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	dec a			;a4a4
	add a,a			;a4a5
	call 0423eh		;a4a6   ; suma_a_hl: HL = HL + A
	ld a,(0cb03h)		;a4a9   ; lee la Y de Snake
	add a,(hl)			;a4ac
	and 0fch		;a4ad
	ld (0cb03h),a		;a4af   ; guarda la Y de Snake
	inc hl			;a4b2
	ld a,(0cb05h)		;a4b3   ; lee la X de Snake
	add a,(hl)			;a4b6
	and 0fch		;a4b7
	ld (0cb05h),a		;a4b9   ; guarda la X de Snake
	ret			;a4bc

; ----------------------------------------------------------------------
; DATOS resto_A4BD: lo apuntan con el banco puesto p03:A49B (0xA4BD); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p03:A49B (8 bytes)
;   0xa4bd..0xa4c5  (8 bytes)
DATA_resto_A4BD:
	defb 000h,000h,010h,000h,000h,0f8h,000h,008h	; a4bd  ........

; ======================================================================
; CODIGO 0xa4c5..0xa775  (688 bytes)
; ======================================================================


acaba_estado_2:		; con 0xCA9B, se acaba
	ld a,(0ca9bh)		;a4c5
	or a			;a4c8
	jr nz,L_A4E7		;a4c9
	ld a,(0ca8dh)		;a4cb   ; sin 0xCA8D y con 0xCB29 = 0, nada
	or a			;a4ce
	jr nz,L_A4D6		;a4cf
	ld a,(0cb29h)		;a4d1
	or a			;a4d4
	ret z			;a4d5
L_A4D6:
	ld a,(0ca64h)		;a4d6   ; con 0xCA64, nada
	or a			;a4d9
	ret nz			;a4da
	ld a,(0ca76h)		;a4db   ; en la especial 0x39, solo en su sala 0
	cp 039h		;a4de
	jr nz,L_A4E7		;a4e0
	ld a,(0ca4bh)		;a4e2   ; lee la sala de la zona
	or a			;a4e5
	ret nz			;a4e6
L_A4E7:
	xor a			;a4e7   ; 0xCB31 = 0
	ld (0cb31h),a		;a4e8   ; guarda 1 en el estado 2 de Snake
	call empieza_vuelta		;a4eb   ; la vuelta y 4 cuadros
	ld a,004h		;a4ee
	ld (0cb1eh),a		;a4f0
	ld a,005h		;a4f3   ; el estado 5...
	ld (0cb00h),a		;a4f5   ; guarda el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	dec a			;a4f8   ; ...con el dibujo 4
	ld (0cb01h),a		;a4f9   ; guarda el dibujo de Snake (al darse la vuelta se le suma 1, 3 o 5 segun 0xCB00)
	xor a			;a4fc   ; 0xCB28 = 0, 0xCB29 = 0x20
	ld (0cb28h),a		;a4fd
	ld a,020h		;a500
	ld (0cb29h),a		;a502
	ret			;a505
estado_2_paso_3:		; el mando; si cambia la direccion, el paso 1
	call 09375h		;a506   ; p02:9375
	ld a,(0cb0eh)		;a509   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ld hl,0cb0dh		;a50c   ; apunta a la direccion pedida con el mando (1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	cp (hl)			;a50f
	jr z,L_A518		;a510
	ld hl,0cb2eh		;a512   ; apunta a el paso del estado 2 de Snake
	ld (hl),001h		;a515
	ret			;a517
L_A518:
	call 09448h		;a518   ; se mueve (salida antes que choque)...
	call tope_en_el_sitio		;a51b   ; tope_en_el_sitio: dentro de un sitio, la Y de Snake no pasa de 0xB0
	ld b,002h		;a51e   ; ...el punto 2...
	call choca_con_tabla_b		;a520   ; choca_con_tabla_b: acarreo si choca con la sala (p01:7EEE con la tabla B) o con algo (p11:BA03)
	ret nc			;a523
	ld a,(0cb0eh)		;a524   ; ...arriba o abajo, la Y a la casilla (- 2, & 0xF8, + 7)
	cp 003h		;a527
	jr nc,L_A537		;a529
	ld a,(0cb03h)		;a52b   ; lee la Y de Snake
	sub 002h		;a52e
	and 0f8h		;a530
	add a,007h		;a532
	ld (0cb03h),a		;a534   ; guarda la Y de Snake
L_A537:
	jp L_A487		;a537
tope_en_el_sitio:		; dentro de un sitio, la Y de Snake no pasa de 0xB0
	ld a,(0ca65h)		;a53a   ; lee el sitio de 0xCBE0 en el que esta Snake (0 = ninguno)
	or a			;a53d
	ret z			;a53e
	ld b,0b0h		;a53f
	ld hl,0cb03h		;a541   ; apunta a la Y de Snake
	ld a,(hl)			;a544
	cp b			;a545
	ret c			;a546
	ld (hl),b			;a547
	ret			;a548
estado_3:		; el estado 3: a los 4 cuadros (0xCB1D), p14:B43D y el estado que toca
	ld hl,0cb1dh		;a549
	dec (hl)			;a54c
	ret nz			;a54d
	ld a,(0cb75h)		;a54e   ; con 0xCB75 = 2, 0xCB76 = 1
	cp 002h		;a551
	jr nz,L_A55A		;a553
	ld a,001h		;a555
	ld (0cb76h),a		;a557
L_A55A:
	call 079b4h		;a55a   ; a_p14_b43d: p14:B43D con el banco 14 en 0xA000
	jp 098bfh		;a55d   ; estado_que_toca: el estado que toca (p02:98F0) a 0xCB00
estado_5:		; el estado 5: a los 0xCB1E cuadros, sin vuelta y el estado que toca
	ld hl,0cb1eh		;a560
	dec (hl)			;a563
	ret nz			;a564
	xor a			;a565
	ld (0cb16h),a		;a566   ; guarda 1 mientras Snake se da la vuelta
	jp 098bfh		;a569   ; estado_que_toca: el estado que toca (p02:98F0) a 0xCB00
disparo_1:		; el disparo 1: con 0xE040 o 0xCB3C, nada
	ld a,(0e040h)		;a56c   ; con 0xE040...
	or a			;a56f
	ret nz			;a570
	ld a,(0cb3ch)		;a571   ; ...o 0xCB3C, nada
	or a			;a574
	ret nz			;a575
	call usa_cb20		;a576   ; p03:AE63
	ld a,(0d752h)		;a579   ; sin 0xD752, nada
	or a			;a57c   ; sin 0xD752 (no se pudo), nada
	ret z			;a57d
	ld a,(0cb20h)		;a57e   ; segun 0xCB20: 7, 8, 9 y 0x0B van a p03:A5CE; 0x0C a p03:A5BD
	cp 007h		;a581   ; 7, 8, 0x0B y 9: el estado 6
	jr z,a_estado_6		;a583
	cp 008h		;a585
	jr z,a_estado_6		;a587
	cp 00bh		;a589
	jr z,a_estado_6		;a58b
	cp 009h		;a58d
	jr z,a_estado_6		;a58f
	cp 00ch		;a591   ; 0x0C: el estado 0x18
	jr z,a_estado_18		;a593
	ld a,(0cb80h)		;a595   ; con 0xCB80 = 3 o 7: p03:A5AD
	cp 003h		;a598   ; con lo lanzado de tipo 3 o 7: el estado 8
	jr z,a_estado_8		;a59a
	cp 007h		;a59c
	jr z,a_estado_8		;a59e
	ld a,(0cb60h)		;a5a0   ; con 0xCB60 o 0xCB61: p03:A5CE
	or a			;a5a3   ; con 0xCB60...
	jr nz,a_estado_6		;a5a4
	ld a,(0cb61h)		;a5a6   ; ...o 0xCB61: el estado 6
	or a			;a5a9
	jr nz,a_estado_6		;a5aa
	ret			;a5ac
a_estado_8:		; el estado 8, 0xCB17 = 1 y 0xCB25 = 4
	ld a,008h		;a5ad
	call pon_estado		;a5af   ; pon_estado: el estado A y el dibujo A
	ld a,001h		;a5b2
	ld (0cb17h),a		;a5b4
	ld a,004h		;a5b7
	ld (0cb25h),a		;a5b9
	ret			;a5bc
a_estado_18:		; 0xCB17 = la direccion + 8, el estado 0x18 con el dibujo 3
	ld a,(0cb0eh)		;a5bd   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	add a,008h		;a5c0
	ld (0cb17h),a		;a5c2
	ld hl,0cb00h		;a5c5   ; apunta a el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	ld (hl),018h		;a5c8
	inc l			;a5ca
	ld (hl),003h		;a5cb
	ret			;a5cd
a_estado_6:		; la vuelta, 4 cuadros, el dibujo 4 y el estado 6
	call empieza_vuelta		;a5ce   ; empieza_vuelta: 0xCB16 = 1 y 0xCB17 = la direccion + 4
	ld a,004h		;a5d1
	ld (0cb1eh),a		;a5d3
	ld (0cb01h),a		;a5d6   ; guarda el dibujo de Snake (al darse la vuelta se le suma 1, 3 o 5 segun 0xCB00)
	ld a,006h		;a5d9
	ld (0cb00h),a		;a5db   ; guarda el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	ret			;a5de
estado_6:		; el estado 6: a los 0xCB1E cuadros, el estado 0 y 0xCB60 = 0xCB61 = 0
	ld hl,0cb1eh		;a5df
	dec (hl)			;a5e2
	ret nz			;a5e3
	xor a			;a5e4
	ld hl,00000h		;a5e5   ; el estado y el dibujo 0
	ld (0cb00h),hl		;a5e8   ; guarda el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques) y el byte siguiente (16 bits)
	ld (0cb16h),a		;a5eb   ; guarda 1 mientras Snake se da la vuelta
	ld hl,0cb60h		;a5ee
	ld (hl),a			;a5f1
	inc hl			;a5f2
	ld (hl),a			;a5f3
	ret			;a5f4
estado_7:		; el estado 7: sin vuelta y p03:AE63
	xor a			;a5f5
	ld (0cb16h),a		;a5f6   ; guarda 1 mientras Snake se da la vuelta
	jp usa_cb20		;a5f9   ; usa_cb20: el disparo con lo de 0xCB20 (p03:AE9B); si se pudo, 0xCB52 y p03:BE60
estado_8:		; el estado 8: 0xCB25 cuadros; al quedar 1, 0xCB81 uno mas, 0xCB17 = 2 y el sonido 0x0E; a cero, el estado 0
	ld hl,0cb25h		;a5fc   ; la espera de 0xCB25
	ld a,(hl)			;a5ff
	or a			;a600
	jr z,L_A613		;a601
	dec (hl)			;a603   ; un cuadro menos...
	cp 002h		;a604   ; ...al quedar 1...
	ret nz			;a606
	ld hl,0cb81h		;a607   ; ...0xCB81 uno mas...
	inc (hl)			;a60a
	ld a,002h		;a60b   ; ...0xCB17 = 2
	ld (0cb17h),a		;a60d
	jp 06a29h		;a610   ; sonido_0e: pide el sonido 0x0E
L_A613:
	xor a			;a613   ; el estado y el dibujo 0
	ld (0cb01h),a		;a614   ; guarda el dibujo de Snake (al darse la vuelta se le suma 1, 3 o 5 segun 0xCB00)
	ld (0cb00h),a		;a617   ; guarda el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	ret			;a61a
estado_9:		; el estado 9: p03:A68B, anda; al chocar, el sonido 0x31 (una vez, 0xCABC)
	call estado_de_cb35_en_0a		;a61b   ; estado_de_cb35_en_0a: en la zona 0x0A, salas 0x0B, 0x0C, 0x10 y 0x11: el estado de 0xCB35 y la marcha 0
	call anda_y_sitios		;a61e   ; anda_y_sitios: con 0xCB80 = 6, solo p03:ADA6
	ld hl,0cabch		;a621   ; 0xCABC: ya ha sonado
	ld a,(0cb0fh)		;a624   ; lee 1 si Snake ha chocado en este cuadro
	or a			;a627
	jr z,L_A631		;a628
	ld a,(hl)			;a62a
	or a			;a62b
	ret nz			;a62c
	inc (hl)			;a62d
	jp 06ac6h		;a62e   ; sonido_31: pide el sonido 0x31
L_A631:
	ld (hl),000h		;a631   ; sin choque, 0xCABC = 0
	ret			;a633
estado_0a:		; el estado 0x0A: p03:A68B, anda y, sin 0xCA5F, p06:A330: con acarreo la X = A y el estado 0x16
	call estado_de_cb35_en_0a		;a634   ; estado_de_cb35_en_0a: en la zona 0x0A, salas 0x0B, 0x0C, 0x10 y 0x11: el estado de 0xCB35 y la marcha 0
	call anda_y_sitios		;a637   ; anda_y_sitios: con 0xCB80 = 6, solo p03:ADA6
	ld a,(0ca5fh)		;a63a
	or a			;a63d
	ret nz			;a63e
	call zona_9_u_0b		;a63f   ; en la zona 9 sin el bit 1 de 0xD7DC, o la 0x0B con el bit 2 de 0xD7D6, nada
	ret c			;a642
	ld hl,0caf0h		;a643   ; con 0xCAF0, lo borra y sigue
	ld a,(hl)			;a646
	or a			;a647
	jr z,L_A64E		;a648
	ld (hl),000h		;a64a
	jr L_A65B		;a64c
L_A64E:
	ld a,(0ca4ah)		;a64e   ; en la zona 0x0A sala 9, nada
	cp 00ah		;a651
	jr nz,L_A65B		;a653
	ld a,(0ca4bh)		;a655   ; lee la sala de la zona
	cp 009h		;a658
	ret z			;a65a
L_A65B:
	call 09da8h		;a65b   ; p06:A330...
	ret nc			;a65e
	ld hl,0cb04h		;a65f   ; ...la X de Snake = A...
	ld (hl),000h		;a662
	inc hl			;a664
	ld (hl),a			;a665
	ld a,016h		;a666   ; ...y el estado 0x16
	ld (0cb00h),a		;a668   ; guarda el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	ret			;a66b
zona_9_u_0b:		; acarreo en la zona 9 con el bit 1 de 0xD7DC, o en la 0x0B sin el bit 2 de 0xD7D6
	ld a,(0ca4ah)		;a66c   ; lee la zona
	cp 009h		;a66f
	jr nz,L_A67C		;a671
	ld a,(0d7dch)		;a673
	bit 1,a		;a676
	jr z,L_A689		;a678
	scf			;a67a
	ret			;a67b
L_A67C:
	cp 00bh		;a67c   ; la zona 0x0B...
	jr nz,L_A689		;a67e
	ld a,(0d7d6h)		;a680   ; ...sin el bit 2 de 0xD7D6...
	bit 2,a		;a683
	jr nz,L_A689		;a685
	scf			;a687   ; ...acarreo
	ret			;a688
L_A689:
	and a			;a689
	ret			;a68a
estado_de_cb35_en_0a:		; en la zona 0x0A, salas 0x0B, 0x0C, 0x10 y 0x11: el estado de 0xCB35 y la marcha 0
	ld a,(0ca4ah)		;a68b   ; lee la zona
	cp 00ah		;a68e
	ret nz			;a690
	ld a,(0ca4bh)		;a691   ; lee la sala de la zona
	cp 00bh		;a694
	jr z,L_A6A3		;a696
	cp 00ch		;a698
	jr z,L_A6A3		;a69a
	cp 010h		;a69c
	jr z,L_A6A3		;a69e
	cp 011h		;a6a0
	ret nz			;a6a2
L_A6A3:
	ld a,(0cb35h)		;a6a3
	call pon_estado		;a6a6   ; pon_estado: el estado A y el dibujo A
	xor a			;a6a9
	ld (0cb0ah),a		;a6aa   ; guarda la marcha de Snake: el indice de las velocidades de p02:9520
	ret			;a6ad
estado_0b:		; el estado 0x0B: solo arriba y abajo entre las Y de 0xCB2A-0xCB2B
	xor a			;a6ae
	ld (0cb16h),a		;a6af   ; guarda 1 mientras Snake se da la vuelta
	ld a,(0ca41h)		;a6b2   ; al salir de la sala, 0xCB50 = 1
	or a			;a6b5
	jr z,L_A6BD		;a6b6
	ld a,001h		;a6b8
	ld (0cb50h),a		;a6ba
L_A6BD:
	ld a,(0cb50h)		;a6bd   ; con 0xCB50 y 0xCB32: 0xCB28-0xCB29 y fuera (p03:A7E0)
	or a			;a6c0
	jr z,L_A6CF		;a6c1
	ld a,(0cb32h)		;a6c3
	or a			;a6c6
	jr z,L_A6CF		;a6c7
	call 09364h		;a6c9   ; cb28_a_0020: 0xCB28 = 0, 0xCB29 = 0x20
	jp a_estado_2_paso_2		;a6cc   ; a_estado_2_paso_2: el estado 2 y el paso 2
L_A6CF:
	ld a,(0cb0eh)		;a6cf   ; hacia arriba con 0xCB29 >= 0x1C (0x1D hacia abajo)...
	dec a			;a6d2
	ld b,01ch		;a6d3
	jr z,L_A6D8		;a6d5
	inc b			;a6d7
L_A6D8:
	ld a,(0cb29h)		;a6d8
	cp b			;a6db
	jr c,L_A6FF		;a6dc
	ld a,(0ca08h)		;a6de   ; ...y un disparo apretado...
	and 030h		;a6e1
	jr z,L_A6FF		;a6e3
	ld a,(0cb0eh)		;a6e5   ; ...hacia arriba con 0xCB29 < 0x1F, 3 puntos mas arriba...
	dec a			;a6e8
	jr nz,L_A6F9		;a6e9
	ld a,(0cb29h)		;a6eb
	cp 01fh		;a6ee
	jr nc,L_A6F9		;a6f0
	ld hl,0cb03h		;a6f2   ; apunta a la Y de Snake
	ld a,(hl)			;a6f5
	sub 003h		;a6f6
	ld (hl),a			;a6f8
L_A6F9:
	call borra_cb28		;a6f9   ; ...0xCB28-0xCB2A a cero y el estado 5
	jp L_A4E7		;a6fc
L_A6FF:
	call 0936eh		;a6ff   ; la vuelta y el movimiento
	call 09402h		;a702   ; mueve_a_snake: dandose la vuelta no se mueve
	call limites_estado_0b		;a705   ; los limites (p03:A713)
	call a_estado_0c		;a708   ; p03:A97E
	call choca_en_0b		;a70b   ; el choque (p03:A82F)
	call sale_a_la_5_8		;a70e   ; p03:A8A4
	jr sale_del_0b_de_lado		;a711
limites_estado_0b:		; p03:A746 y, sin salir de la sala, los limites de 0xCB2F (p03:A76F)
	call sale_por_arriba_0b		;a713   ; sale_por_arriba_0b: en la zona 0 sala 9 (o la 9 sala 0), hacia arriba por encima de Y = 0x3C: sale por arriba
	ld a,(0ca41h)		;a716   ; lee la salida de la sala (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	or a			;a719
	jp nz,fuera_del_0b		;a71a   ; fuera_del_0b: sale del estado 0x0B; en la zona 0 sala 6, el bit 5 de 0xD7D0 a cero
	call limites_por_cb2f		;a71d   ; limites_por_cb2f: por 0xCB2F (p03:A775)
	ret c			;a720
	ld a,(0cb00h)		;a721   ; aun en el estado 0x0B: p03:A7E9
	cp 00bh		;a724
	ret nz			;a726
	jp cb28_por_la_altura		;a727   ; cb28_por_la_altura: 0xCB28-0xCB29 segun lo que falta para las Y de arriba y abajo (de 0 a 0x20)
sale_del_0b_de_lado:		; sin arriba ni abajo y con izquierda o derecha...
	ld a,(0ca08h)		;a72a   ; lee el mando: joystick y teclado juntos (bits 0-3 las direcciones, 4-5 los disparos)
	and 003h		;a72d
	ret nz			;a72f
	ld a,(0ca08h)		;a730   ; lee el mando: joystick y teclado juntos (bits 0-3 las direcciones, 4-5 los disparos)
	and 00ch		;a733
	ret z			;a735
	ld hl,0cb28h		;a736   ; ...con 0xCB28 = 0, o 0xCB29 >= 0x1C, sale del estado 0x0B
	ld a,(hl)			;a739
	or a			;a73a
	jp z,fuera_del_0b_de_lado		;a73b   ; fuera_del_0b_de_lado: 0xCB28-0xCB29 = 0x0020, fuera y, hacia arriba, 4 puntos mas arriba
	inc l			;a73e
	ld a,(hl)			;a73f
	cp 01ch		;a740
	ret c			;a742
	jp fuera_del_0b_de_lado		;a743   ; fuera_del_0b_de_lado: 0xCB28-0xCB29 = 0x0020, fuera y, hacia arriba, 4 puntos mas arriba
sale_por_arriba_0b:		; en la zona 0 sala 9 (o la 9 sala 0), hacia arriba por encima de Y = 0x3C: sale por arriba
	ld b,009h		;a746
	ld a,(0ca4ah)		;a748   ; lee la zona
	or a			;a74b
	jr z,L_A753		;a74c
	ld b,000h		;a74e
	cp 009h		;a750
	ret nz			;a752
L_A753:
	ld a,(0ca4bh)		;a753   ; lee la sala de la zona
	cp b			;a756
	ret nz			;a757
	ld a,(0cb0eh)		;a758   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	dec a			;a75b
	ret nz			;a75c
	ld a,(0cb03h)		;a75d   ; lee la Y de Snake
	cp 03ch		;a760
	ret nc			;a762
	ld a,001h		;a763   ; la salida 1
	ld (0ca41h),a		;a765   ; guarda la salida de la sala (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ld hl,0bf00h		;a768   ; Y = 0xBF
	ld (0cb02h),hl		;a76b   ; guarda la Y de Snake: la parte fraccionaria (0xCB02-0xCB03 en 8.8) y el byte siguiente (16 bits)
	ret			;a76e
limites_por_cb2f:		; por 0xCB2F (p03:A775)
	ld a,(0cb2fh)		;a76f
	call 0424dh		;a772   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_A775: 2 destinos del despachador p00:424D (call en p03:A772, el
;   indice en A): A779, A787; lo leen p03:A772 (4 bytes)
;   0xa775..0xa779  (4 bytes)
DATA_tabla_A775:
	defw 0a779h,0a787h	; a775  -> limites_0 limites_1

; ======================================================================
; CODIGO 0xa779..0xac53  (1242 bytes)
; ======================================================================


limites_0:		; la Y por encima de la de arriba: fuera; por debajo de la de abajo: p03:A7AE
	ld hl,(0cb2ah)		;a779   ; lee las Y de arriba y abajo de la zona del estado 0x0B (16 bits)
	ld a,(0cb03h)		;a77c   ; lee la Y de Snake
	cp l			;a77f
	jr c,fuera_del_0b		;a780
	cp h			;a782
	jr nc,L_A7AE		;a783
	and a			;a785
	ret			;a786
limites_1:		; la Y - 0x1A por encima de la de arriba: se queda en ella + 0x1A con 0xCB28 = 2
	ld hl,(0cb2ah)		;a787   ; lee las Y de arriba y abajo de la zona del estado 0x0B (16 bits)
	ld a,(0cb03h)		;a78a   ; lee la Y de Snake
	sub 01ah		;a78d
	jr nz,L_A792		;a78f
	xor a			;a791
L_A792:
	cp l			;a792
	jr c,L_A79D		;a793
	ld a,(0cb03h)		;a795   ; lee la Y de Snake
	cp h			;a798
	jr nc,L_A7AE		;a799
	and a			;a79b
	ret			;a79c
L_A79D:
	ld a,l			;a79d   ; Y = la de arriba + 0x1A
	add a,01ah		;a79e
	ld h,a			;a7a0
	ld l,000h		;a7a1
	ld (0cb02h),hl		;a7a3   ; guarda la Y de Snake: la parte fraccionaria (0xCB02-0xCB03 en 8.8) y el byte siguiente (16 bits)
	ld bc,00200h		;a7a6   ; 0xCB28 = 2, 0xCB29 = 0
	call 09367h		;a7a9   ; pon_cb28: 0xCB28 = B, 0xCB29 = C
	scf			;a7ac
	ret			;a7ad
L_A7AE:
	sub h			;a7ae   ; hasta 8 por debajo de la de abajo: 0xCB28-0xCB29 = 0x0020 y acarreo; mas, fuera
	cp 008h		;a7af
	jr nc,fuera_del_0b		;a7b1
	call 09364h		;a7b3   ; cb28_a_0020: 0xCB28 = 0, 0xCB29 = 0x20
	scf			;a7b6
	ret			;a7b7
fuera_del_0b:		; sale del estado 0x0B; en la zona 0 sala 6, el bit 5 de 0xD7D0 a cero
	call a_estado_2_paso_2		;a7b8   ; a_estado_2_paso_2: el estado 2 y el paso 2
	ld a,(0ca4ah)		;a7bb   ; lee la zona
	or a			;a7be
	ret nz			;a7bf
	ld a,(0ca4bh)		;a7c0   ; lee la sala de la zona
	cp 006h		;a7c3
	ret nz			;a7c5
	ld hl,0d7d0h		;a7c6   ; apunta a las banderas de la partida: la n en el bit 7 - n % 8 del byte n / 8 (p03:B0DC, p03:B0F6)
	res 5,(hl)		;a7c9
	scf			;a7cb
	ret			;a7cc
fuera_del_0b_de_lado:		; 0xCB28-0xCB29 = 0x0020, fuera y, hacia arriba, 4 puntos mas arriba
	call 09364h		;a7cd   ; cb28_a_0020: 0xCB28 = 0, 0xCB29 = 0x20
	call a_estado_2_paso_2		;a7d0   ; a_estado_2_paso_2: el estado 2 y el paso 2
	ld a,(0cb0eh)		;a7d3   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	dec a			;a7d6
	ret nz			;a7d7
	ld hl,0cb03h		;a7d8   ; apunta a la Y de Snake
	ld a,(hl)			;a7db
	sub 004h		;a7dc
	ld (hl),a			;a7de
	ret			;a7df
a_estado_2_paso_2:		; el estado 2 y el paso 2
	ld a,002h		;a7e0
	call pon_estado		;a7e2   ; pon_estado: el estado A y el dibujo A
	ld (0cb2eh),a		;a7e5   ; guarda el paso del estado 2 de Snake
	ret			;a7e8
cb28_por_la_altura:		; 0xCB28-0xCB29 segun lo que falta para las Y de arriba y abajo (de 0 a 0x20)
	ld hl,(0cb2ah)		;a7e9   ; lee las Y de arriba y abajo de la zona del estado 0x0B (16 bits)
	ld a,(0cb03h)		;a7ec   ; lee la Y de Snake
	sub 020h		;a7ef   ; la Y - 0x20 contra la de arriba
	jr nc,L_A7F4		;a7f1
	xor a			;a7f3
L_A7F4:
	sub l			;a7f4
	jr nc,L_A80F		;a7f5
	neg		;a7f7
	cp 020h		;a7f9
	jr c,L_A802		;a7fb
	ld bc,00020h		;a7fd   ; lejos: 0x0020
	jr L_A82C		;a800
L_A802:
	ld c,a			;a802   ; cerca de arriba: B = 2 y lo que falta (0 con 0xCB2F = 1)
	ld a,(0cb2fh)		;a803
	dec a			;a806
	jr nz,L_A80B		;a807
	ld c,000h		;a809
L_A80B:
	ld b,002h		;a80b
	jr L_A82C		;a80d
L_A80F:
	ld a,h			;a80f   ; contra la de abajo - 0x20
	sub 020h		;a810
	ld b,a			;a812
	ld a,(0cb03h)		;a813   ; lee la Y de Snake
	sub b			;a816
	jr c,L_A829		;a817
	jr z,L_A829		;a819
	cp 020h		;a81b
	jr c,L_A824		;a81d
	ld bc,00020h		;a81f
	jr L_A82C		;a822
L_A824:
	ld c,a			;a824   ; cerca de abajo: B = 1 y lo que falta
	ld b,001h		;a825
	jr L_A82C		;a827
L_A829:
	ld bc,00100h		;a829   ; en ella: 0x0100
L_A82C:
	jp 09367h		;a82c   ; pon_cb28: 0xCB28 = B, 0xCB29 = C
choca_en_0b:		; en la zona 0 sala 7 o la 9 sala 0, no choca
	call sin_choque_0b		;a82f   ; sin_choque_0b: acarreo en la zona 0 sala 7 y en la 9 sala 0
	ret c			;a832
	ld a,(0ca41h)		;a833   ; lee la salida de la sala (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	or a			;a836
	ret nz			;a837
	ld a,(0cb28h)		;a838   ; con 0xCB28 = 1 solo hacia abajo desde 0x0F; con 2, hacia arriba desde 0x10
	or a			;a83b
	jr z,L_A857		;a83c
	dec a			;a83e
	ld a,(0cb0eh)		;a83f   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	jr nz,L_A84F		;a842
	cp 002h		;a844
	ret nz			;a846
	ld a,(0cb29h)		;a847
	cp 00fh		;a84a
	ret c			;a84c
	jr L_A857		;a84d
L_A84F:
	dec a			;a84f
	ret nz			;a850
	ld a,(0cb29h)		;a851
	cp 010h		;a854
	ret c			;a856
L_A857:
	ld b,001h		;a857   ; la tabla de choques 1
	call 07eeeh		;a859   ; choca_al_andar: los puntos de Snake en su direccion (sin direccion, nada)
	ret nc			;a85c
	call 09804h		;a85d   ; se pega a la casilla...
	ld a,(0cb0eh)		;a860   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	cp 001h		;a863   ; ...hacia arriba, 0x10 mas arriba...
	jr nz,L_A86F		;a865
	ld a,(0cb03h)		;a867   ; lee la Y de Snake
	sub 010h		;a86a
	ld (0cb03h),a		;a86c   ; guarda la Y de Snake
L_A86F:
	ld a,001h		;a86f   ; ...ha chocado, el estado 2 en el paso 2...
	ld (0cb0fh),a		;a871   ; guarda 1 si Snake ha chocado en este cuadro
	inc a			;a874
	ld (0cb00h),a		;a875   ; guarda el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	ld (0cb2eh),a		;a878   ; guarda el paso del estado 2 de Snake
	call borra_cb28		;a87b   ; ...0xCB28-0xCB2A a cero y otra vez el paso 0
	jp L_A487		;a87e
borra_cb28:		; 0xCB28 = 0, 0xCB29 = 0x20, 0xCB2A = 0xCB2B = 0
	call 09364h		;a881   ; cb28_a_0020: 0xCB28 = 0, 0xCB29 = 0x20
	xor a			;a884
	inc hl			;a885
	ld (hl),a			;a886
	inc hl			;a887
	ld (hl),a			;a888
	ret			;a889
sin_choque_0b:		; acarreo en la zona 0 sala 7 y en la 9 sala 0
	ld a,(0ca4ah)		;a88a   ; lee la zona
	or a			;a88d
	jr nz,L_A899		;a88e
	ld a,(0ca4bh)		;a890   ; lee la sala de la zona
	cp 007h		;a893
	jr z,L_A8A2		;a895
L_A897:
	and a			;a897
	ret			;a898
L_A899:
	cp 009h		;a899
	jr nz,L_A897		;a89b
	ld a,(0ca4bh)		;a89d   ; lee la sala de la zona
	or a			;a8a0
	ret nz			;a8a1
L_A8A2:
	scf			;a8a2
	ret			;a8a3
sale_a_la_5_8:		; en las zonas 1, 3 y 4, fila 5 columna 8, por encima de Y = 0x38 hacia arriba: p03:A8D8
	ld a,(0ca4ah)		;a8a4   ; lee la zona
	cp 001h		;a8a7
	jr z,L_A8B2		;a8a9
	cp 003h		;a8ab
	jr z,L_A8B2		;a8ad
	cp 004h		;a8af
	ret nz			;a8b1
L_A8B2:
	ld a,(0ca50h)		;a8b2   ; lee la fila de la sala en la zona (uno mas al salir por arriba)
	cp 005h		;a8b5
	ret nz			;a8b7
	ld a,(0ca51h)		;a8b8   ; lee la columna de la sala en la zona (uno mas al salir por la derecha)
	cp 008h		;a8bb
	ret nz			;a8bd
	ld a,(0cb03h)		;a8be   ; lee la Y de Snake
	cp 038h		;a8c1
	ret nc			;a8c3
	ld a,(0cb0eh)		;a8c4   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	cp 001h		;a8c7
	ret nz			;a8c9
	ld a,(0ca4ah)		;a8ca   ; 0xCB5A = 1 en la zona 1, 2 en las 3 y 4
	cp 002h		;a8cd
	ld a,001h		;a8cf
	jr c,L_A8D5		;a8d1
	ld a,002h		;a8d3
L_A8D5:
	ld (0cb5ah),a		;a8d5
escena_de_cb5a:		; Snake mirando abajo, la pantalla limpia, los dibujos de p32:70F9, la paleta de p56:B97D...
	ld hl,0cb0dh		;a8d8   ; apunta a la direccion pedida con el mando (1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ld a,002h		;a8db   ; arriba y abajo: la 2
	ld (hl),a			;a8dd
	inc l			;a8de
	ld (hl),a			;a8df
	xor a			;a8e0   ; 0xE230 = 0
	ld (0e230h),a		;a8e1   ; 0xE230 = 0
	ld hl,0ce00h		;a8e4   ; 0xCE00-0xD3FF a cero
	ld bc,005ffh		;a8e7   ; 0x600 bytes
	call 04236h		;a8ea   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	call 059efh		;a8ed   ; limpia_sprites_y_d300:
	call 04d2bh		;a8f0   ; dibujos_70f9:
	ld a,(0ca42h)		;a8f3   ; la pagina de dibujar en negro
	call 04452h		;a8f6   ; borra_pantalla_de: 0xC0 x 0xC0 puntos a 0 en la pagina A
	call 08511h		;a8f9   ; paleta_b97d: la paleta de p56:B97D
	call 08281h		;a8fc   ; llama_ab91: p06:AB91 guardando el banco de 0xA000
	ld hl,0ca4ch		;a8ff   ; los juegos de piezas 0 y 1
	ld (hl),000h		;a902   ; el juego de piezas 0...
	inc hl			;a904
	ld (hl),001h		;a905   ; ...y el 1
	ld hl,08050h		;a907   ; la sala de p24:8050 con los bloques de p25:8EB4
	ld de,08eb4h		;a90a   ; los bloques de p25:8EB4
	call 055b1h		;a90d   ; sala_de_bloques_de: p00:5590 con los bancos 24-26
	call 09364h		;a910   ; cb28_a_0020: 0xCB28 = 0, 0xCB29 = 0x20
	ld hl,0cb02h		;a913   ; Snake en Y = 0x20, X = 0x64
	xor a			;a916   ; sin fraccion...
	ld (hl),a			;a917
	inc hl			;a918
	ld (hl),020h		;a919   ; ...Y = 0x20...
	inc hl			;a91b
	ld (hl),a			;a91c
	inc hl			;a91d
	ld (hl),064h		;a91e   ; ...X = 0x64
	ld hl,0cb00h		;a920   ; el estado 0x11 con el dibujo 2
	ld (hl),011h		;a923   ; el estado 0x11...
	inc hl			;a925
	ld (hl),002h		;a926   ; ...con el dibujo 2
	call 07cbbh		;a928   ; sin 0xCA5F
	call 06b12h		;a92b   ; los sonidos 5 y 0x85
	jp 06ae2h		;a92e   ; sonido_85: pide el sonido 0x85 (de los que tienen la partitura en un banco de musica, p16:4CE3)
estado_11:		; el estado 0x11: Snake baja 4 puntos por cuadro hasta Y = 0xBE, 0xCB5A veces; despues a la zona 6 (o la 0x12 desde la 0x13)
	ld a,002h		;a931
	ld (0cb01h),a		;a933   ; guarda el dibujo de Snake (al darse la vuelta se le suma 1, 3 o 5 segun 0xCB00)
	ld hl,0cb03h		;a936   ; 4 puntos mas abajo
	ld a,(hl)			;a939
	add a,004h		;a93a
	ld (hl),a			;a93c
	cp 0beh		;a93d
	ret c			;a93f
	ld a,(0cb5ah)		;a940   ; otra vuelta desde arriba (Y = 0x20)...
	dec a			;a943
	jr z,L_A94C		;a944
	ld (0cb5ah),a		;a946
	ld (hl),020h		;a949
	ret			;a94b
L_A94C:
	ld (hl),050h		;a94c   ; ...la ultima: Y = 0x50, X = 0x90...
	inc hl			;a94e
	inc hl			;a94f
	ld (hl),090h		;a950
	ld hl,0cb00h		;a952   ; ...el estado 0x12...
	inc (hl)			;a955
	inc hl			;a956
	ld (hl),000h		;a957
	ld a,(0ca4ah)		;a959   ; ...desde la zona 0x13, a la 0x12
	cp 013h		;a95c
	jr z,L_A972		;a95e
	ld a,005h		;a960   ; a la zona 6, fila 5, columna 8, y el sonido 0x12
	ld (0ca50h),a		;a962   ; guarda la fila de la sala en la zona (uno mas al salir por arriba)
	ld a,008h		;a965
	ld (0ca51h),a		;a967   ; guarda la columna de la sala en la zona (uno mas al salir por la derecha)
	ld a,006h		;a96a
	call 059a7h		;a96c   ; cambia_de_zona: pasa a la zona A
	jp 06a3ch		;a96f   ; sonido_12: pide el sonido 0x12
L_A972:
	ld a,012h		;a972
	jp 059a7h		;a974   ; cambia_de_zona: pasa a la zona A
estado_12:		; el estado 0x12: 0xCB31 = 0 y el estado 1 (o 0)
	xor a			;a977
	ld (0cb31h),a		;a978   ; guarda 1 en el estado 2 de Snake
	jp 098b8h		;a97b   ; estado_1: el estado 1, o el 0 sin 0xCB35 (p02:990E)
a_estado_0c:		; en la zona 0 sala 7, por debajo de Y = 0x1A hacia abajo: el estado 0x0C
	ld a,(0ca4ah)		;a97e   ; lee la zona
	or a			;a981
	ret nz			;a982
	ld a,(0ca4bh)		;a983   ; lee la sala de la zona
	cp 007h		;a986
	ret nz			;a988
	ld a,(0cb03h)		;a989   ; lee la Y de Snake
	cp 01ah		;a98c
	ret c			;a98e
	ld a,(0cb0eh)		;a98f   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	cp 002h		;a992
	ret nz			;a994
	ld a,00ch		;a995
	ld (0cb00h),a		;a997   ; guarda el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	xor a			;a99a
	ld (0cb01h),a		;a99b   ; guarda el dibujo de Snake (al darse la vuelta se le suma 1, 3 o 5 segun 0xCB00)
	ld (0cb02h),a		;a99e   ; guarda la Y de Snake: la parte fraccionaria (0xCB02-0xCB03 en 8.8)
	jp 09364h		;a9a1   ; cb28_a_0020: 0xCB28 = 0, 0xCB29 = 0x20
estado_0c:		; el estado 0x0C: Snake baja 6 puntos por cuadro hasta Y = 0x4C; alli el estado 0x0D, la vuelta y el sonido 0x12
	ld a,001h		;a9a4
	ld (0cb14h),a		;a9a6   ; guarda el dibujo del paso de andar (0, 1, 2, 1: p02:9888)
	ld a,(0cb03h)		;a9a9   ; lee la Y de Snake
	add a,006h		;a9ac
	ld (0cb03h),a		;a9ae   ; guarda la Y de Snake
	cp 04ch		;a9b1
	ret c			;a9b3
	ld a,04ch		;a9b4
	ld (0cb03h),a		;a9b6   ; guarda la Y de Snake
	ld a,00dh		;a9b9
	ld (0cb00h),a		;a9bb   ; guarda el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	ld a,001h		;a9be
	ld (0cb16h),a		;a9c0   ; guarda 1 mientras Snake se da la vuelta
	ld a,006h		;a9c3
	ld (0cb17h),a		;a9c5
	ld a,004h		;a9c8
	ld (0cb01h),a		;a9ca   ; guarda el dibujo de Snake (al darse la vuelta se le suma 1, 3 o 5 segun 0xCB00)
	ld a,008h		;a9cd   ; 8 cuadros (0xCB2C)
	ld (0cb2ch),a		;a9cf
	jp 06a3ch		;a9d2   ; sonido_12: pide el sonido 0x12
estado_0d:		; el estado 0x0D: a los 8 cuadros, sin vuelta, la marcha 0 y el estado de 0xCB35
	ld hl,0cb2ch		;a9d5
	dec (hl)			;a9d8
	ret nz			;a9d9
	xor a			;a9da
	ld (0cb16h),a		;a9db   ; guarda 1 mientras Snake se da la vuelta
	ld (0cb17h),a		;a9de
	ld (0cb31h),a		;a9e1   ; guarda 1 en el estado 2 de Snake
	ld (0cb0ah),a		;a9e4   ; guarda la marcha de Snake: el indice de las velocidades de p02:9520
	ld a,(0cb35h)		;a9e7
	jp pon_estado		;a9ea   ; pon_estado: el estado A y el dibujo A
estado_0e:		; el estado 0x0E: con una direccion se ve la sala de al lado durante 0x30 cuadros (0xCB53)
	ld hl,0cb53h		;a9ed
	ld a,(hl)			;a9f0
	or a			;a9f1
	jr z,L_A9F9		;a9f2
	dec (hl)			;a9f4   ; la espera...
	jp z,deja_de_mirar		;a9f5   ; ...al acabar, otra vez la sala de antes (p03:AACF)
	ret			;a9f8
L_A9F9:
	ld hl,0e256h		;a9f9   ; 0xE256: la direccion que se mira
	ld a,(0ca08h)		;a9fc   ; una direccion apretada
	and 00fh		;a9ff   ; las direcciones...
	ret z			;aa01   ; ...ninguna: nada
	ld b,a			;aa02   ; B = las apretadas
	call no_se_mira_arriba		;aa03   ; hacia arriba, en la zona 0 desde la sala 7 o en la 9, no
	ret c			;aa06   ; arriba no se puede: nada
	ld a,(hl)			;aa07   ; si ya se esta mirando, nada
	or a			;aa08   ; ya se mira: nada
	ret nz			;aa09
	ld a,030h		;aa0a   ; 0x30 cuadros
	ld (0cb53h),a		;aa0c   ; la espera
	ld a,b			;aa0f
	ld e,001h		;aa10   ; la salida y el paso: arriba (1, fila + 1)...
	ld bc,00001h		;aa12   ; arriba: E = 1, fila + 1
	rra			;aa15
	jr c,L_AA28		;aa16   ; el bit 0
	inc e			;aa18   ; ...abajo (2, fila - 1)...
	ld c,0ffh		;aa19   ; abajo: E = 2, fila - 1
	rra			;aa1b
	jr c,L_AA28		;aa1c
	inc e			;aa1e   ; ...izquierda (3, columna - 1)...
	ld bc,0ff00h		;aa1f   ; izquierda: E = 3, columna - 1
	rra			;aa22
	jr c,L_AA28		;aa23
	inc e			;aa25   ; ...derecha (4, columna + 1)
	ld b,001h		;aa26   ; derecha: E = 4, columna + 1
L_AA28:
	ld a,(hl)			;aa28   ; la misma de antes: nada
	cp e			;aa29   ; la de ahora: nada
	ret z			;aa2a
	ld a,e			;aa2b   ; la salida E
	push de			;aa2c
	push bc			;aa2d
	call 07da9h		;aa2e   ; no hay sala alli...
	pop bc			;aa31
	pop de			;aa32
	jp z,06c77h		;aa33   ; ...el sonido 0x5C
	cp 081h		;aa36   ; una sala especial (desde 0x81) tampoco
	jp nc,06c77h		;aa38   ; sonido_5c: pide el sonido 0x5C
	push af			;aa3b   ; 0xCB62 = 1
	ld a,001h		;aa3c
	ld (0cb62h),a		;aa3e   ; 0xCB62 = 1
	pop af			;aa41
	ld hl,0e256h		;aa42   ; apunta a la direccion en la que se mira la sala de al lado (estado 0x0E)
	ld (hl),e			;aa45   ; la direccion
	call sala_mas_bc		;aa46   ; BC = la sala de al lado de la de 0xCA70
	push bc			;aa49
	ld a,00dh		;aa4a   ; el dibujo 0x0D
	ld (0cb01h),a		;aa4c   ; guarda el dibujo de Snake (al darse la vuelta se le suma 1, 3 o 5 segun 0xCB00)
	call 04266h		;aa4f   ; sin sprites ni pantalla
	call 045d7h		;aa52   ; esconde_sprites_vram: llena con 0xE0 128 bytes de la VRAM en 0xF600 y otros 128 en 0xF200
	call 045f1h		;aa55   ; apaga_pantalla_y_sprites: p00:45CC y p00:45F6
	call rachas_de_la_especial_26		;aa58   ; rachas_de_la_especial_26: en la especial 0x26: las rachas de p37:9638 y, con 0xCB21 = 1, las de p37:B34A
	pop bc			;aa5b
	call 057f2h		;aa5c   ; la sala de al lado...
	ld a,(0ca4bh)		;aa5f   ; ...con lo fijo de su sala...
	push af			;aa62   ; la sala de antes...
	call 07bf1h		;aa63   ; sala_de_ca50: 0xCA4B = la sala de la fila y la columna de 0xCA50-0xCA51
	call 07de2h		;aa66   ; cosas_fijas_de_la_sala: lo fijo de la sala (p01:7E0D), p07:A4EB y p11:A20D
	pop af			;aa69   ; ...otra vez
	ld (0ca4bh),a		;aa6a   ; guarda la sala de la zona
	call marcos_de_mirar		;aa6d   ; ...los marcos (p03:AA8E)...
	call 04606h		;aa70   ; ...otra vez la pantalla y el sonido 0x39
	jp 06afah		;aa73   ; sonido_39: pide el sonido 0x39
no_se_mira_arriba:		; acarreo si hacia arriba no se puede mirar: en la zona 0 desde la sala 7 y en la 9
	and 001h		;aa76
	ret z			;aa78
	ld a,(0ca4ah)		;aa79   ; lee la zona
	or a			;aa7c
	jr z,L_AA85		;aa7d
	cp 009h		;aa7f
	jr z,L_AA8C		;aa81
	or a			;aa83
	ret			;aa84
L_AA85:
	ld a,(0ca4bh)		;aa85   ; lee la sala de la zona
	cp 007h		;aa88
	ccf			;aa8a
	ret			;aa8b
L_AA8C:
	scf			;aa8c
	ret			;aa8d
marcos_de_mirar:		; seis franjas de 0x18 x 2 y dos de 2 x 0x60 en el color 7: el marco de la sala de al lado
	ld hl,0105fh		;aa8e
	call franja_de_marco		;aa91   ; franja_de_marco: 0x18 x 2 puntos en HL
	ld hl,0985fh		;aa94
	call franja_de_marco		;aa97   ; franja_de_marco: 0x18 x 2 puntos en HL
	ld hl,02830h		;aa9a
	call franja_de_marco		;aa9d   ; franja_de_marco: 0x18 x 2 puntos en HL
	ld hl,08030h		;aaa0
	call franja_de_marco		;aaa3   ; franja_de_marco: 0x18 x 2 puntos en HL
	ld hl,0288eh		;aaa6
	call franja_de_marco		;aaa9   ; franja_de_marco: 0x18 x 2 puntos en HL
	ld hl,0808eh		;aaac
	call franja_de_marco		;aaaf   ; franja_de_marco: 0x18 x 2 puntos en HL
	ld hl,02630h		;aab2
	ld bc,00260h		;aab5
	call franja_bc		;aab8   ; franja_bc: BC puntos en HL al color 0x77
	ld hl,09830h		;aabb
	ld bc,00260h		;aabe
	jr franja_bc		;aac1
franja_de_marco:		; 0x18 x 2 puntos en HL
	ld bc,01802h		;aac3
franja_bc:		; BC puntos en HL al color 0x77
	ld a,(0ca42h)		;aac6   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	ld d,a			;aac9
	ld a,077h		;aaca
	jp 046ffh		;aacc   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
deja_de_mirar:		; si se miraba, otra vez la sala de 0xCA70-0xCA71
	ld hl,0e256h		;aacf   ; apunta a la direccion en la que se mira la sala de al lado (estado 0x0E)
	ld a,(hl)			;aad2
	or a			;aad3
	ret z			;aad4
	xor a			;aad5   ; 0xE256 = 0xCB62 = 0
	ld (hl),a			;aad6
	ld (0cb62h),a		;aad7
	ld hl,(0ca70h)		;aada   ; la fila y la columna de antes
	ld (0ca50h),hl		;aadd   ; guarda la fila de la sala en la zona (uno mas al salir por arriba) y el byte siguiente (16 bits)
	call 045f1h		;aae0   ; sin sprites ni pantalla
	call 04266h		;aae3   ; esconde_sprites_ram: llena 0xDC00-0xDC7F con 0xE0
	call 045d7h		;aae6   ; esconde_sprites_vram: llena con 0xE0 128 bytes de la VRAM en 0xF600 y otros 128 en 0xF200
	call rachas_de_la_especial_26		;aae9   ; rachas_de_la_especial_26: en la especial 0x26: las rachas de p37:9638 y, con 0xCB21 = 1, las de p37:B34A
	call 057e9h		;aaec   ; la sala
	call dibuja_los_que_siguen		;aaef   ; dibuja_los_que_siguen: p03:B4E6 y p03:B563
	call dibuja_el_de_dfd8		;aaf2   ; dibuja_el_de_dfd8: el de 0xDFD8: sprites 22-25 (0xDC58), patrones desde 0xE0, colores de p08:BB7F y p08:BB9E
	ld a,(0cb35h)		;aaf5   ; el dibujo 0 (1 con 0xCB35)
	or a			;aaf8
	ld b,000h		;aaf9
	jr z,L_AAFE		;aafb
	inc b			;aafd
L_AAFE:
	ld a,b			;aafe
	ld (0cb01h),a		;aaff   ; guarda el dibujo de Snake (al darse la vuelta se le suma 1, 3 o 5 segun 0xCB00)
	ld a,030h		;ab02   ; 0x30 cuadros antes de poder mirar otra vez
	ld (0cb53h),a		;ab04
	call 07de2h		;ab07   ; lo fijo de la sala y la pantalla otra vez
	call 04650h		;ab0a   ; espera_vdp: espera a que el VDP acabe la orden en curso (S#2 bit 0)
	jp 04606h		;ab0d   ; enciende_todo: la pantalla y los sprites encendidos
rachas_de_la_especial_26:		; en la especial 0x26: las rachas de p37:9638 y, con 0xCB21 = 1, las de p37:B34A
	ld a,(0ca76h)		;ab10   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 026h		;ab13
	ret nz			;ab15
	call 06f78h		;ab16   ; rachas_9638: las rachas de p37:9638 a la VRAM de 0x1E280 y una franja de la pagina 3 a la 3
	ld a,(0cb21h)		;ab19   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	dec a			;ab1c
	jp z,08587h		;ab1d   ; rachas_b34a_bancos_3:
sala_mas_bc:		; C = la fila de 0xCA70 + C, B = la columna de 0xCA71 + B
	ld a,(0ca70h)		;ab20   ; lee la fila y la columna de la sala desde la que se mira (16 bits)
	add a,c			;ab23
	ld c,a			;ab24
	ld a,(0ca71h)		;ab25
	add a,b			;ab28
	ld b,a			;ab29
	ret			;ab2a
estado_0f:		; el estado 0x0F: se mueve y, desde Y = 0x78, la Y se queda alli y el estado que toca
	call 09430h		;ab2b
	ld a,(0cb03h)		;ab2e   ; lee la Y de Snake
	ld h,078h		;ab31
	cp h			;ab33
	ret c			;ab34
	ld l,000h		;ab35
	ld (0cb02h),hl		;ab37   ; guarda la Y de Snake: la parte fraccionaria (0xCB02-0xCB03 en 8.8) y el byte siguiente (16 bits)
	jp 098bfh		;ab3a   ; estado_que_toca: el estado que toca (p02:98F0) a 0xCB00
estado_10:		; el estado 0x10: da vueltas (salvo con 0xCB21 = 0x0A u 0x0B), baja en diagonal y 0xCB28 segun la Y
	ld a,(0cb21h)		;ab3d   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	cp 00ah		;ab40
	jr z,L_AB49		;ab42
	cp 00bh		;ab44
	call nz,da_vueltas		;ab46   ; da_vueltas: cada 4 cuadros (B = 3), la direccion siguiente (1-4)
L_AB49:
	call baja_en_diagonal		;ab49   ; baja_en_diagonal: la Y + 2, la X - 2; por debajo de X = 0x10, el estado 0x1B y el sonido 0x8D
	jp cb28_al_caer		;ab4c   ; cb28_al_caer: desde Y = 0xD6, 0xCB28-0xCB29 = 0x0200; entre 0xB7 y 0xD6, 0xCB29 = 0x20 - lo que pasa de 0xB7
baja_en_diagonal:		; la Y + 2, la X - 2; por debajo de X = 0x10, el estado 0x1B y el sonido 0x8D
	ld hl,0cb03h		;ab4f   ; apunta a la Y de Snake
	inc (hl)			;ab52
	inc (hl)			;ab53
	ld hl,0cb05h		;ab54   ; apunta a la X de Snake
	dec (hl)			;ab57
	dec (hl)			;ab58
	ld a,(hl)			;ab59
	cp 010h		;ab5a
	ret nc			;ab5c
	ld hl,0cb00h		;ab5d   ; apunta a el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	ld (hl),01bh		;ab60
	jp 06ba0h		;ab62   ; sonido_8d: pide el sonido 0x8D (de los que tienen la partitura en un banco de musica, p16:4CE3)
cb28_al_caer:		; desde Y = 0xD6, 0xCB28-0xCB29 = 0x0200; entre 0xB7 y 0xD6, 0xCB29 = 0x20 - lo que pasa de 0xB7
	ld a,(0cb03h)		;ab65   ; lee la Y de Snake
	cp 0d6h		;ab68
	jr nc,L_AB95		;ab6a
	sub 0b7h		;ab6c
	ret c			;ab6e
	cp 020h		;ab6f
	jr c,L_AB74		;ab71
	xor a			;ab73
L_AB74:
	ld b,a			;ab74
	ld a,020h		;ab75
	sub b			;ab77
	ld c,a			;ab78
	call cb29_segun_cb21		;ab79   ; cb29_segun_cb21: con 0xCB21 = 0x0A, 8 menos; con 0x0B, 0x10 menos
	ld b,002h		;ab7c
	jp 09367h		;ab7e   ; pon_cb28: 0xCB28 = B, 0xCB29 = C
cb29_segun_cb21:		; con 0xCB21 = 0x0A, 8 menos; con 0x0B, 0x10 menos
	ld a,(0cb21h)		;ab81   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	cp 00ah		;ab84
	jr z,L_AB90		;ab86
	cp 00bh		;ab88
	ret nz			;ab8a
	ld a,c			;ab8b
	sub 010h		;ab8c
	ld c,a			;ab8e
	ret			;ab8f
L_AB90:
	ld a,c			;ab90
	sub 008h		;ab91
	ld c,a			;ab93
	ret			;ab94
L_AB95:
	ld bc,00200h		;ab95
	jp 09367h		;ab98   ; pon_cb28: 0xCB28 = B, 0xCB29 = C
da_vueltas:		; cada 4 cuadros (B = 3), la direccion siguiente (1-4)
	ld b,003h		;ab9b
da_vueltas_b:		; la direccion siguiente cuando los bits B del contador de cuadros estan a cero
	ld a,(0ca03h)		;ab9d   ; lee el contador de cuadros (uno mas en cada interrupcion)
	and b			;aba0
	ret nz			;aba1
	ld hl,0cb0eh		;aba2   ; apunta a la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ld a,(hl)			;aba5
	inc a			;aba6
	cp 005h		;aba7
	jr c,L_ABAD		;aba9
	ld a,001h		;abab
L_ABAD:
	ld (hl),a			;abad
	ret			;abae
estado_13:		; el estado 0x13: el sonido 0x53, da vueltas y se hunde (0xCB29 baja cada dos cuadros); al acabar, el estado 0x1C
	call 06c6bh		;abaf   ; sonido_53: pide el sonido 0x53
	call da_vueltas		;abb2   ; da_vueltas: cada 4 cuadros (B = 3), la direccion siguiente (1-4)
	ld a,(0cb29h)		;abb5
	or a			;abb8
	jr z,L_ABCC		;abb9
	ld a,(0ca03h)		;abbb   ; lee el contador de cuadros (uno mas en cada interrupcion)
	rra			;abbe
	ret c			;abbf
	ld hl,0cb28h		;abc0
	ld (hl),002h		;abc3
	inc hl			;abc5
	dec (hl)			;abc6
	ld hl,0cb03h		;abc7   ; apunta a la Y de Snake
	inc (hl)			;abca
	ret			;abcb
L_ABCC:
	ld hl,001e4h		;abcc   ; 0x1E4 cuadros
a_estado_1c:		; la espera de 0xCB63, el estado 0x1C y el sonido 0x8D
	ld (0cb63h),hl		;abcf   ; guarda una espera de 16 bits que baja en la interrupcion
	ld hl,0cb00h		;abd2   ; apunta a el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	ld (hl),01ch		;abd5
	jp 06ba0h		;abd7   ; sonido_8d: pide el sonido 0x8D (de los que tienen la partitura en un banco de musica, p16:4CE3)
estado_1a:		; el estado 0x1A: se hunde 2 puntos por cuadro; al acabar, el estado 0x1C con 0x108 cuadros (0x18C en la zona 0x11)
	ld a,(0cb29h)		;abda   ; 0xCB29...
	or a			;abdd
	jr z,L_ABF3		;abde   ; ...a cero: el final (p03:ABF3)
	ld hl,0cb28h		;abe0   ; 0xCB28 = 2
	ld (hl),002h		;abe3
	inc hl			;abe5
	ld a,(hl)			;abe6   ; 0xCB29 dos menos...
	sub 002h		;abe7
	jr nc,L_ABEC		;abe9
	xor a			;abeb   ; ...sin bajar de 0
L_ABEC:
	ld (hl),a			;abec
	ld hl,0cb03h		;abed   ; apunta a la Y de Snake
	inc (hl)			;abf0
	inc (hl)			;abf1
	ret			;abf2
L_ABF3:
	ld a,(0ca4ah)		;abf3   ; lee la zona
	cp 011h		;abf6
	ld hl,00108h		;abf8
	jr nz,a_estado_1c		;abfb
	ld hl,0018ch		;abfd
	jr a_estado_1c		;ac00
a_estado_14:		; al estado 0x14 (si no lo esta): el sprite 4 fuera, 0xCB40 = 0x40, mirando abajo, las rachas de p37:9638 y el sonido 0x8D
	ld a,(0cb00h)		;ac02   ; lee el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	cp 014h		;ac05   ; ya en el estado 0x14: nada
	ret z			;ac07
	ld a,0e0h		;ac08   ; el sprite 4 fuera
	ld (0dc10h),a		;ac0a
	ld hl,0cb40h		;ac0d   ; 0xCB40 = 0x40 cuadros...
	ld (hl),040h		;ac10
	inc hl			;ac12
	xor a			;ac13   ; ...el paso 0
	ld (hl),a			;ac14
	ld (0cb28h),a		;ac15   ; 0xCB28 = 0, el dibujo 0, sin vuelta
	ld (0cb01h),a		;ac18   ; guarda el dibujo de Snake (al darse la vuelta se le suma 1, 3 o 5 segun 0xCB00)
	ld (0cb16h),a		;ac1b   ; guarda 1 mientras Snake se da la vuelta
	ld a,014h		;ac1e   ; el estado 0x14
	ld (0cb00h),a		;ac20   ; guarda el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	ld a,002h		;ac23   ; mirando abajo
	ld (0cb0eh),a		;ac25   ; guarda la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ld a,020h		;ac28   ; 0xCB29 = 0x20
	ld (0cb29h),a		;ac2a
	ld a,(0dfd8h)		;ac2d   ; con 0xDFD8, los sprites 22-25 fuera
	or a			;ac30   ; con 0xDFD8...
	jr z,L_AC42		;ac31
	xor a			;ac33   ; ...lo quita...
	ld (0dfd8h),a		;ac34
	ld hl,0dc58h		;ac37   ; ...y sus sprites (22-25) fuera
	ld bc,0000fh		;ac3a
	ld a,0e0h		;ac3d
	call 04237h		;ac3f   ; llena_bloque: pone A en BC + 1 bytes desde HL
L_AC42:
	call 06f78h		;ac42   ; rachas_9638: las rachas de p37:9638 a la VRAM de 0x1E280 y una franja de la pagina 3 a la 3
	jp 06ba0h		;ac45   ; sonido_8d: pide el sonido 0x8D (de los que tienen la partitura en un banco de musica, p16:4CE3)
estado_14:		; el estado 0x14: el sprite 4 fuera y sus pasos de 0xCB41 (p03:AC53)
	ld a,0e0h		;ac48
	ld (0dc10h),a		;ac4a
	ld a,(0cb41h)		;ac4d
	call 0424dh		;ac50   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_AC53: 3 destinos del despachador p00:424D (call en p03:AC50, el
;   indice en A): AC59, AC7E, AC9D; lo leen p03:AC50 (6 bytes)
;   0xac53..0xac59  (6 bytes)
DATA_tabla_AC53:
	defw 0ac59h,0ac7eh,0ac9dh	; ac53  -> estado_14_paso_0 estado_14_paso_1 estado_14_paso_2

; ======================================================================
; CODIGO 0xac59..0xad96  (317 bytes)
; ======================================================================


estado_14_paso_0:		; vueltas cada 16 cuadros durante 0xCB40; despues el dibujo 4 y mirando abajo
	ld b,00fh		;ac59
	call da_vueltas_b		;ac5b   ; da_vueltas_b: la direccion siguiente cuando los bits B del contador de cuadros estan a cero
	ld hl,0cb40h		;ac5e
	dec (hl)			;ac61
	ret nz			;ac62
	ld (hl),020h		;ac63   ; 0x20 cuadros para el paso siguiente
	ld a,004h		;ac65
	ld (0cb01h),a		;ac67   ; guarda el dibujo de Snake (al darse la vuelta se le suma 1, 3 o 5 segun 0xCB00)
	ld a,001h		;ac6a
	ld (0cb16h),a		;ac6c   ; guarda 1 mientras Snake se da la vuelta
	ld a,006h		;ac6f
	ld (0cb17h),a		;ac71
	ld a,002h		;ac74
	ld (0cb0eh),a		;ac76   ; guarda la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
paso_siguiente_cb41:		; el paso siguiente del estado 0x14
	ld hl,0cb41h		;ac79
	inc (hl)			;ac7c
	ret			;ac7d
estado_14_paso_1:		; a los 0x20 cuadros, el dibujo 2 y, fuera del agua, 0x10 mas abajo
	ld hl,0cb40h		;ac7e
	dec (hl)			;ac81
	ret nz			;ac82
	ld (hl),010h		;ac83
	ld a,002h		;ac85
	ld (0cb01h),a		;ac87   ; guarda el dibujo de Snake (al darse la vuelta se le suma 1, 3 o 5 segun 0xCB00)
	xor a			;ac8a
	ld (0cb16h),a		;ac8b   ; guarda 1 mientras Snake se da la vuelta
	ld a,(0cb3fh)		;ac8e   ; lee en la zona 6, lo que hay bajo Snake: 1 con los caracteres 0x90-0xB3, 2 con 0xB8-0xDB (3 con 0xCAAA)
	or a			;ac91
	jr nz,L_AC9B		;ac92
	ld hl,0cb03h		;ac94   ; apunta a la Y de Snake
	ld a,(hl)			;ac97
	add a,010h		;ac98
	ld (hl),a			;ac9a
L_AC9B:
	jr paso_siguiente_cb41		;ac9b
estado_14_paso_2:		; a los 0x10 cuadros, 0x90 de espera y el estado 0x1C
	ld hl,0cb40h		;ac9d
	dec (hl)			;aca0
	ret nz			;aca1
	ld hl,00090h		;aca2
	ld (0cb63h),hl		;aca5   ; guarda una espera de 16 bits que baja en la interrupcion
	ld hl,0cb00h		;aca8   ; apunta a el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	ld (hl),01ch		;acab
	ret			;acad
estado_15:		; el estado 0x15: se mueve; por encima de Y = 0xB8, la Y alli, el estado que toca y se guarda en 0xC700
	call 09430h		;acae
	ld a,(0cb03h)		;acb1   ; lee la Y de Snake
	cp 0b8h		;acb4
	jr nc,L_ACC8		;acb6
	ld hl,0b800h		;acb8
	ld (0cb02h),hl		;acbb   ; guarda la Y de Snake: la parte fraccionaria (0xCB02-0xCB03 en 8.8) y el byte siguiente (16 bits)
	xor a			;acbe
	ld (0cb28h),a		;acbf
	call 098bfh		;acc2   ; estado_que_toca: el estado que toca (p02:98F0) a 0xCB00
	jp 05afeh		;acc5   ; copia_a_c700: copia en 0xC700 la zona, la sala especial, la Y y la X de Snake y 0xCA50-0xCA51 (salvo en la zona 0x10)
L_ACC8:
	ld a,(0cb03h)		;acc8   ; por debajo, 0xCB29 = 0x20 - lo que pasa de 0xC0
	sub 0c0h		;accb
	ret c			;accd
	ld b,a			;acce
	ld a,020h		;accf
	sub b			;acd1
	ld c,a			;acd2
	ld b,002h		;acd3
	jp 09367h		;acd5   ; pon_cb28: 0xCB28 = B, 0xCB29 = C
estado_16:		; el estado 0x16: con 0xCA5F, p04:924C; Snake sube un punto por cuadro hasta la Y de 0xCAA7
	ld a,(0ca5fh)		;acd8
	or a			;acdb
	call nz,079a3h		;acdc   ; a_p04_924c: p04:924C con el banco 4 en 0x8000
	ld hl,0cb03h		;acdf   ; apunta a la Y de Snake
	dec (hl)			;ace2   ; un punto mas arriba
	call cb28_al_subir		;ace3   ; 0xCB28 al acercarse a 0xCAA6
	ld hl,0caa7h		;ace6   ; aun no llega: nada
	ld a,(0cb03h)		;ace9   ; lee la Y de Snake
	cp (hl)			;acec
	ret nc			;aced
	ld a,(0caa5h)		;acee   ; segun 0xCAA5: 0 a la zona 0x0B (p03:AD10), 4 con Y = 0x2F; los demas, el paso 6 del estado 5
	or a			;acf1
	jr z,L_AD10		;acf2
	cp 004h		;acf4
	jr z,L_AD2A		;acf6
	ld a,006h		;acf8
	ld (0ca01h),a		;acfa   ; guarda el paso del estado de la partida
	xor a			;acfd   ; 0xE1F1 = 0, 0xE1F0 = 1
	ld (0e1f1h),a		;acfe
	inc a			;ad01
	ld (0e1f0h),a		;ad02
L_AD05:
	call 09364h		;ad05   ; el estado 0x0A y se guarda en 0xC700
	ld a,00ah		;ad08
	ld (0cb00h),a		;ad0a   ; guarda el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	jp 05afeh		;ad0d   ; copia_a_c700: copia en 0xC700 la zona, la sala especial, la Y y la X de Snake y 0xCA50-0xCA51 (salvo en la zona 0x10)
L_AD10:
	ld hl,0ca50h		;ad10   ; a la zona 0x0B, fila 2 columna 8, en Y = 0x9F, X = 0x68
	ld (hl),002h		;ad13
	inc hl			;ad15
	ld (hl),008h		;ad16
	ld a,00bh		;ad18
	call 059a7h		;ad1a   ; cambia_de_zona: pasa a la zona A
	ld hl,09f00h		;ad1d
	ld (0cb02h),hl		;ad20   ; guarda la Y de Snake: la parte fraccionaria (0xCB02-0xCB03 en 8.8) y el byte siguiente (16 bits)
	ld h,068h		;ad23
	ld (0cb04h),hl		;ad25   ; guarda la X de Snake: la parte fraccionaria (0xCB04-0xCB05 en 8.8) y el byte siguiente (16 bits)
	jr L_AD05		;ad28
L_AD2A:
	ld hl,02f00h		;ad2a
	ld (0cb02h),hl		;ad2d   ; guarda la Y de Snake: la parte fraccionaria (0xCB02-0xCB03 en 8.8) y el byte siguiente (16 bits)
	jr L_AD05		;ad30
cb28_al_subir:		; por encima de 0xCAA6: 0xCB28 = 1 y 0xCB29 = 0x20 - lo que pasa (0 si se pasa de 0x20)
	ld a,(hl)			;ad32   ; la Y...
	ld hl,0caa6h		;ad33   ; ...contra 0xCAA6
	sub (hl)			;ad36
	ret nc			;ad37   ; por debajo: nada
	ld b,a			;ad38
	ld a,020h		;ad39   ; 0x20 - lo que le falta...
	add a,b			;ad3b
	bit 7,a		;ad3c   ; ...negativo: 0
	jr z,L_AD41		;ad3e
	xor a			;ad40
L_AD41:
	ld c,a			;ad41
	ld b,001h		;ad42
	jp 09367h		;ad44   ; pon_cb28: 0xCB28 = B, 0xCB29 = C
estado_17:		; el estado 0x17: sin 0xCB42, se mueve (p02:9430); con el, lo borra, el dibujo de quieto y el estado que toca
	ld hl,0cb42h		;ad47
	ld a,(hl)			;ad4a
	or a			;ad4b
	jp z,09430h		;ad4c
	xor a			;ad4f
	ld (hl),a			;ad50
	inc a			;ad51
	ld (0cb14h),a		;ad52   ; guarda el dibujo del paso de andar (0, 1, 2, 1: p02:9888)
	jp 098bfh		;ad55   ; estado_que_toca: el estado que toca (p02:98F0) a 0xCB00
estado_18:		; el estado 0x18: cuando 0xCB44 se pone a 0, el estado que toca
	ld a,(0cb44h)		;ad58
	or a			;ad5b
	ret nz			;ad5c
	jp 098bfh		;ad5d   ; estado_que_toca: el estado que toca (p02:98F0) a 0xCB00
punto_del_arma:		; sin 0xCB80 y con 0xCB20 = 3 o 0x0A: 0xCB22-0xCB23 = la Y y la X de Snake mas lo de su direccion, y 0xCB5C = 1
	ld a,(0cb80h)		;ad60   ; lee las 6 fichas de 16 bytes de lo que lanza Snake ([tipo][..][Y 8.8][X 8.8][velocidades]...)
	or a			;ad63
	ret nz			;ad64
	ld a,(0cb20h)		;ad65   ; lee lo que usa el disparo 1 (0 nada; p02:8001 elige por ello)
	or a			;ad68
	ret z			;ad69
	cp 003h		;ad6a
	jr z,L_AD76		;ad6c
	cp 00ah		;ad6e
	ret nz			;ad70
	ld hl,0ad9eh		;ad71   ; con 0x0A, p03:AD9E
	jr L_AD79		;ad74
L_AD76:
	ld hl,0ad96h		;ad76   ; con 0xCB20 = 3, p03:AD96
L_AD79:
	ld a,(0cb0eh)		;ad79   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	dec a			;ad7c
	add a,a			;ad7d
	call 0423eh		;ad7e   ; suma_a_hl: HL = HL + A
	ld a,(0cb03h)		;ad81   ; la Y...
	add a,(hl)			;ad84
	ld (0cb22h),a		;ad85
	inc hl			;ad88
	ld a,(0cb05h)		;ad89   ; ...y la X
	add a,(hl)			;ad8c
	ld (0cb23h),a		;ad8d
	ld a,001h		;ad90
	ld (0cb5ch),a		;ad92
	ret			;ad95

; ----------------------------------------------------------------------
; DATOS resto_AD96: lo apuntan con el banco puesto p03:AD76 (0xAD96), p03:AD71
;   (0xAD9E); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p03:AD76, p03:AD71 (16 bytes)
;   0xad96..0xada6  (16 bytes)
DATA_resto_AD96:
	defb 0b0h,0f8h,020h,0f8h,0e8h,0c0h,0e8h,030h,0c8h,0f8h,008h,0f8h,0f0h,0d8h,0f0h,018h	; ad96  .. ....0........

; ======================================================================
; CODIGO 0xada6..0xb077  (721 bytes)
; ======================================================================


pose_con_cb21_1:		; con 0xCB21 = 1, quieto y fuera del agua, si p11:BD31 da acarreo: el dibujo cambia segun la cuenta de 0xCB26
	ld a,(0dff8h)		;ada6   ; con 0xDFF8, nada
	or a			;ada9
	ret nz			;adaa
	ld a,(0cb21h)		;adab   ; solo con 0xCB21 = 1
	dec a			;adae
	ret nz			;adaf
	ld a,(0cb16h)		;adb0   ; ni dandose la vuelta
	or a			;adb3
	ret nz			;adb4
	ld a,(0cb00h)		;adb5   ; ni en el estado 0x14
	cp 014h		;adb8
	jr z,sin_pose		;adba
	ld a,(0cb3fh)		;adbc   ; ni en el agua
	or a			;adbf
	jr nz,sin_pose		;adc0
	ld a,(0cb37h)		;adc2   ; ni con 0xCB37
	or a			;adc5
	jr nz,sin_pose		;adc6
	call 08b68h		;adc8   ; p11:BD31: sin acarreo, sin pose
	jr nc,sin_pose		;adcb
	ld hl,0cb26h		;adcd   ; la cuenta de 0xCB26...
	dec (hl)			;add0   ; un cuadro menos; a cero, sin pose
	jr z,sin_pose		;add1
	ld a,(hl)			;add3   ; ...0x60: el dibujo 9 (0xCB27 = 1)...
	cp 060h		;add4   ; los cambios: 0x60...
	jr z,L_ADE9		;add6
	cp 040h		;add8   ; ...0x40...
	jr z,L_ADF4		;adda
	cp 030h		;addc   ; ...0x30...
	jr z,L_ADF8		;adde
	cp 020h		;ade0   ; ...0x20...
	jr z,L_ADF4		;ade2
	cp 010h		;ade4   ; ...0x10
	jr z,L_ADF8		;ade6
	ret			;ade8
L_ADE9:
	ld a,001h		;ade9
	ld (0cb27h),a		;adeb
	ld a,009h		;adee
	ld (0cb01h),a		;adf0   ; guarda el dibujo de Snake (al darse la vuelta se le suma 1, 3 o 5 segun 0xCB00)
	ret			;adf3
L_ADF4:
	ld a,002h		;adf4
	jr L_ADFA		;adf6
L_ADF8:
	ld a,003h		;adf8
L_ADFA:
	ld (0cb27h),a		;adfa
	ld a,(0cb00h)		;adfd   ; lee el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	ld (0cb01h),a		;ae00   ; guarda el dibujo de Snake (al darse la vuelta se le suma 1, 3 o 5 segun 0xCB00)
	ret			;ae03
sin_pose:		; el dibujo del estado, 0xCB26 = 0x80 y 0xCB27 = 0
	ld a,(0cb00h)		;ae04   ; lee el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	ld (0cb01h),a		;ae07   ; guarda el dibujo de Snake (al darse la vuelta se le suma 1, 3 o 5 segun 0xCB00)
	ld a,080h		;ae0a
	ld (0cb26h),a		;ae0c
	xor a			;ae0f
	ld (0cb27h),a		;ae10
	ret			;ae13
mira_e1c0:		; en la zona 0x0A sala 0x0E, hacia arriba en Y 0x28-0x2F y X 0xA8-0xAF: 0xE1C0 = 1 y p10:BC27 (2 si ya estaba) y el sonido 0x46
	ld a,(0ca4ah)		;ae14   ; lee la zona
	cp 00ah		;ae17   ; la zona 0x0A...
	ret nz			;ae19
	ld a,(0ca4bh)		;ae1a   ; lee la sala de la zona
	cp 00eh		;ae1d   ; ...sala 0x0E...
	ret nz			;ae1f
	ld a,(0cb03h)		;ae20   ; lee la Y de Snake
	cp 028h		;ae23   ; ...la Y 0x28-0x2F...
	ret c			;ae25
	cp 030h		;ae26
	ret nc			;ae28
	ld a,(0cb0eh)		;ae29   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	dec a			;ae2c   ; ...hacia arriba...
	ret nz			;ae2d
	ld a,(0cb05h)		;ae2e   ; lee la X de Snake
	cp 0a8h		;ae31   ; ...la X 0xA8-0xAF
	ret c			;ae33
	cp 0b0h		;ae34
	ret nc			;ae36
	ld hl,0e1c0h		;ae37   ; 0xE1C0...
	ld a,(hl)			;ae3a
	or a			;ae3b
	jr z,L_AE42		;ae3c
	ld (hl),002h		;ae3e   ; ...ya puesto: 2
	jr L_AE47		;ae40
L_AE42:
	ld (hl),001h		;ae42
	call 08abeh		;ae44   ; a_p10_bc27: p10:BC27 con el banco 10 en 0xA000
L_AE47:
	jp 06c33h		;ae47   ; sonido_46: pide el sonido 0x46
mira_cb28:		; 0xCB32 = 1 si 0xCB29 es menor que 7 (6 con 0xCB28 = 2)
	ld hl,0cb32h		;ae4a   ; 0xCB32 = 0
	ld (hl),000h		;ae4d
	ld b,007h		;ae4f   ; el limite 7...
	ld a,(0cb28h)		;ae51   ; ...sin 0xCB28, nada
	or a			;ae54
	ret z			;ae55
	dec a			;ae56
	jr z,L_AE5B		;ae57
	ld b,006h		;ae59   ; ...6 con 0xCB28 = 2
L_AE5B:
	ld a,(0cb29h)		;ae5b
	cp b			;ae5e
	ret nc			;ae5f
	ld (hl),001h		;ae60
	ret			;ae62
usa_cb20:		; el disparo con lo de 0xCB20 (p03:AE9B); si se pudo, 0xCB52 y p03:BE60
	xor a			;ae63   ; 0xD752 = 0
	ld (0d752h),a		;ae64
	call dispara		;ae67   ; dispara: dandose la vuelta, no
	ld a,(0d752h)		;ae6a   ; se ha podido?
	or a			;ae6d
	ret z			;ae6e
	call pon_cb52		;ae6f   ; pon_cb52: 0xCB52 = 0xCB20, salvo 0, 1 y 0x0C
	ld a,(0cb20h)		;ae72   ; con 0xCB20 = 0x0C o 5, o 0xCB75 = 2, o 0xCB55, nada mas
	cp 00ch		;ae75   ; 0x0C...
	ret z			;ae77
	cp 005h		;ae78   ; ...y 5: nada mas
	ret z			;ae7a
	ld b,a			;ae7b
	ld a,(0cb75h)		;ae7c   ; con 0xCB75 = 2, nada mas
	cp 002h		;ae7f
	ret z			;ae81
	ld a,(0cb55h)		;ae82   ; con 0xCB55, nada mas
	or a			;ae85
	ret nz			;ae86
	ld a,b			;ae87   ; la cosa: una menos
	jp gasta_una		;ae88   ; gasta_una: la cosa A una menos; con 1 y 2, nada mas; si se acaba, fuera de las manos y el mensaje de p10:B3E5 con 0xD874
pon_cb52:		; 0xCB52 = 0xCB20, salvo 0, 1 y 0x0C
	ld hl,0cb52h		;ae8b
	ld (hl),000h		;ae8e
	ld a,(0cb20h)		;ae90   ; lee lo que usa el disparo 1 (0 nada; p02:8001 elige por ello)
	cp 002h		;ae93
	ret c			;ae95
	cp 00ch		;ae96
	ret z			;ae98
	ld (hl),a			;ae99
	ret			;ae9a
dispara:		; dandose la vuelta, no
	ld a,(0cb16h)		;ae9b   ; lee 1 mientras Snake se da la vuelta
	or a			;ae9e
	ret nz			;ae9f
	ld a,(0cb20h)		;aea0   ; con 0xCB20 = 0, nada
	or a			;aea3
	ret z			;aea4
	ld a,(0cb20h)		;aea5   ; con 0xCB20 = 6, solo con 0xDF80 & 0x7F = 0
	cp 006h		;aea8
	jr nz,L_AEB2		;aeaa
	ld a,(0df80h)		;aeac   ; lee 8 fichas de 8 bytes [tipo][dibujo][Y][X][fila][columna][espera][grafico] que suenan 0x14 en la sala y 0x15 al lado
	and 07fh		;aeaf
	ret nz			;aeb1
L_AEB2:
	ld a,(0cb3fh)		;aeb2   ; bajo el agua (0xCB3F >= 2), el sonido 0x5C
	cp 002h		;aeb5   ; 2 o mas: bajo el agua
	jp nc,06c77h		;aeb7   ; sonido_5c: pide el sonido 0x5C
	ld a,(0cb20h)		;aeba   ; con 0xCB20 = 0x0C, a p02:8001 sin mas
	cp 00ch		;aebd   ; 0x0C: sin mirar mas
	jr z,L_AEE9		;aebf
	ld b,a			;aec1
	ld a,(0cb55h)		;aec2   ; con 0xCB55, tambien
	or a			;aec5   ; con 0xCB55, tambien
	jr nz,L_AEE9		;aec6
	ld a,(0cb75h)		;aec8   ; con 0xCB75 = 2: 0xCB76 = 1 y el sonido 0x39
	cp 002h		;aecb   ; con 0xCB75 = 2: p03:AEEC
	jr z,L_AEEC		;aecd
	ld a,b			;aecf   ; tiene cuenta?
	call tiene_balas		;aed0   ; p03:BE42: sin acarreo, a p02:8001
	jr nc,L_AEE9		;aed3   ; si: dispara
	ld a,(0cb20h)		;aed5   ; con acarreo: desde 3, el sonido 0x5C...
	cp 003h		;aed8   ; sin cuenta, desde la 3...
	jp nc,06c77h		;aeda   ; sonido_5c: pide el sonido 0x5C
	dec a			;aedd   ; ...el 1 solo con el disparo recien pulsado...
	jr nz,L_AEE6		;aede
	ld a,(0ca07h)		;aee0   ; lee lo recien pulsado del mando (los bits de 0xCA08 que no estaban)
	and 010h		;aee3   ; la 1 con el disparo recien pulsado
	ret z			;aee5
L_AEE6:
	jp 06afah		;aee6   ; ...y el sonido 0x39
L_AEE9:
	jp 07ff0h		;aee9   ; a p02:8001 con el banco 11
L_AEEC:
	ld a,001h		;aeec
	ld (0cb76h),a		;aeee
	jr L_AEE6		;aef1
d446_o_9949:		; sin 0xCA5F, 0xD446 = 4; con 0xCA5F = 1, p04:9949
	push ix		;aef3
	ld a,(0ca5fh)		;aef5
	and a			;aef8
	push af			;aef9
	call z,pon_d446		;aefa   ; pon_d446: 0xD446 = 4
	pop af			;aefd
	dec a			;aefe
	call z,079bch		;aeff   ; a_p04_9949: p04:9949 con el banco 4 en 0x8000
	pop ix		;af02
	ret			;af04
d446_si:		; con 0xCA5F < 2, 0xD446 = 4
	push ix		;af05
	ld a,(0ca5fh)		;af07
	cp 002h		;af0a
	call c,pon_d446		;af0c   ; pon_d446: 0xD446 = 4
	pop ix		;af0f
	ret			;af11
pon_d446:		; 0xD446 = 4
	ld a,004h		;af12
	ld (0d446h),a		;af14
	ret			;af17
fichas_de_cada_cuadro:		; las fichas de 0xCB80, 0xCC00 y 0xCC80, p11:AF47 y p11:B23F
	call fichas_cb80		;af18   ; fichas_cb80: las 6 fichas de 16 bytes de 0xCB80 (lo que lanza Snake)
	call fichas_cc00		;af1b   ; fichas_cc00: las 8 fichas de 16 bytes de 0xCC00 (p11:B494)
	call fichas_cc80		;af1e   ; fichas_cc80: las 16 fichas de 8 bytes de 0xCC80 (p11:B66E)
	call 08b2fh		;af21   ; a_p11_af47: p11:AF47 con el banco 11 en 0xA000
	jp 08b60h		;af24   ; a_p11_b23f: p11:B23F con el banco 11 en 0xA000
fichas_cb80:		; las 6 fichas de 16 bytes de 0xCB80 (lo que lanza Snake)
	ld ix,0cb80h		;af27   ; apunta a las 6 fichas de 16 bytes de lo que lanza Snake ([tipo][..][Y 8.8][X 8.8][velocidades]...)
	ld b,006h		;af2b
L_AF2D:
	push bc			;af2d
	ld a,(ix+000h)		;af2e   ; el tipo; 0 = libre
	or a			;af31
	call nz,ficha_cb80		;af32   ; ficha_cb80: por su tipo (p02:8028), se mueve (p03:AF8A) y choca con la sala (p03:B007)
	ld de,00010h		;af35   ; la siguiente
	add ix,de		;af38
	pop bc			;af3a
	djnz L_AF2D		;af3b
	ret			;af3d
ficha_cb80:		; por su tipo (p02:8028), se mueve (p03:AF8A) y choca con la sala (p03:B007)
	call 07ff9h		;af3e   ; segun_a_8_bancos_11: segun_a_8 (p02:8028) con el banco 11 (sigue en el banco 2)
	call mueve_ficha		;af41   ; mueve_ficha: si se mueve (p03:AFB5): la Y (bytes 2-3) + la velocidad (6-7) y la X (4-5) + la suya (8-9)
	call choca_ficha		;af44   ; choca_ficha: los tipos 3, 5, 7 y 8 no chocan con la sala
	ld a,(ix+000h)		;af47   ; si sigue viva...
	or a			;af4a
	ret z			;af4b
	cp 003h		;af4c   ; ...los tipos 3 y 7 miran los bordes con 0xCB22 (p03:AFEE)...
	jp z,fuera_de_la_sala_b		;af4e   ; fuera_de_la_sala_b: con 0xCB22 desde 0xB8, la Y; si no, la X desde 0xC0
	cp 007h		;af51
	jp z,fuera_de_la_sala_b		;af53   ; fuera_de_la_sala_b: con 0xCB22 desde 0xB8, la Y; si no, la X desde 0xC0
	cp 005h		;af56   ; ...el 5 no; los demas, p03:AFDD
	ret z			;af58
	jp fuera_de_la_sala		;af59   ; fuera_de_la_sala: con la Y o la X desde 0xB8, se acaba (p03:B096)
fichas_cc00:		; las 8 fichas de 16 bytes de 0xCC00 (p11:B494)
	ld ix,0cc00h		;af5c   ; apunta a 8 fichas de 16 bytes que mueve p11:B494
	ld b,008h		;af60
L_AF62:
	push bc			;af62
	ld a,(ix+000h)		;af63
	or a			;af66
	call nz,08b80h		;af67   ; a_p11_b494: p11:B494 con el banco 11 en 0xA000
	ld de,00010h		;af6a
	add ix,de		;af6d
	pop bc			;af6f
	djnz L_AF62		;af70
	ret			;af72
fichas_cc80:		; las 16 fichas de 8 bytes de 0xCC80 (p11:B66E)
	ld ix,0cc80h		;af73   ; apunta a 16 fichas de 8 bytes que mueve p11:B66E
	ld b,010h		;af77
L_AF79:
	push bc			;af79
	ld a,(ix+000h)		;af7a
	or a			;af7d
	call nz,08b88h		;af7e   ; a_p11_b66e: p11:B66E con el banco 11 en 0xA000
	ld de,00008h		;af81
	add ix,de		;af84
	pop bc			;af86
	djnz L_AF79		;af87
	ret			;af89
mueve_ficha:		; si se mueve (p03:AFB5): la Y (bytes 2-3) + la velocidad (6-7) y la X (4-5) + la suya (8-9)
	call se_mueve		;af8a   ; se_mueve: acarreo si la ficha se mueve: los tipos 3, 4 y 7 con el byte 1; el 8 sin el byte 0x0D (que se borra)
	ret nc			;af8d
	ld e,(ix+002h)		;af8e   ; la Y en 8.8...
	ld d,(ix+003h)		;af91
	ld l,(ix+006h)		;af94   ; ...mas su velocidad
	ld h,(ix+007h)		;af97
	add hl,de			;af9a
	ld (ix+002h),l		;af9b
	ld (ix+003h),h		;af9e
	ld e,(ix+004h)		;afa1   ; la X en 8.8...
	ld d,(ix+005h)		;afa4
	ld l,(ix+008h)		;afa7   ; ...mas su velocidad
	ld h,(ix+009h)		;afaa
	add hl,de			;afad
	ld (ix+004h),l		;afae
	ld (ix+005h),h		;afb1
	ret			;afb4
se_mueve:		; acarreo si la ficha se mueve: los tipos 3, 4 y 7 con el byte 1; el 8 sin el byte 0x0D (que se borra)
	ld a,(ix+000h)		;afb5   ; el tipo
	cp 003h		;afb8   ; 3, 4 y 7: con el byte 1
	jr z,L_AFD6		;afba
	cp 004h		;afbc
	jr z,L_AFD6		;afbe
	cp 007h		;afc0
	jr z,L_AFD6		;afc2
	cp 008h		;afc4   ; 8: sin el byte 0x0D
	jr z,L_AFCA		;afc6
	scf			;afc8   ; los demas, siempre
	ret			;afc9
L_AFCA:
	ld a,(ix+00dh)		;afca   ; el byte 0x0D...
	or a			;afcd
	ccf			;afce   ; ...a cero: se mueve
	ret z			;afcf
	xor a			;afd0   ; si no, se borra y no se mueve
	ld (ix+00dh),a		;afd1
	and a			;afd4
	ret			;afd5
L_AFD6:
	ld a,(ix+001h)		;afd6
	or a			;afd9
	ret z			;afda
	scf			;afdb
	ret			;afdc
fuera_de_la_sala:		; con la Y o la X desde 0xB8, se acaba (p03:B096)
	ld a,(ix+003h)		;afdd
	cp 0b8h		;afe0
	jp nc,acaba_ficha		;afe2   ; acaba_ficha: el tipo 8: el sonido 4 y 0xD44F = 0
	ld a,(ix+005h)		;afe5
	cp 0b8h		;afe8
	jp nc,acaba_ficha		;afea   ; acaba_ficha: el tipo 8: el sonido 4 y 0xD44F = 0
	ret			;afed
fuera_de_la_sala_b:		; con 0xCB22 desde 0xB8, la Y; si no, la X desde 0xC0
	ld a,(0cb22h)		;afee
	cp 0b8h		;aff1
	jr c,L_AFFE		;aff3
	ld a,(ix+003h)		;aff5
	cp 0b8h		;aff8
	jp nc,acaba_ficha		;affa   ; acaba_ficha: el tipo 8: el sonido 4 y 0xD44F = 0
	ret			;affd
L_AFFE:
	ld a,(ix+005h)		;affe
	cp 0c0h		;b001
	jp nc,acaba_ficha		;b003   ; acaba_ficha: el tipo 8: el sonido 4 y 0xD44F = 0
	ret			;b006
choca_ficha:		; los tipos 3, 5, 7 y 8 no chocan con la sala
	call choca_con_la_sala		;b007   ; choca_con_la_sala: sin acarreo los tipos 3, 5, 7 y 8
	ret nc			;b00a
	ld a,(0ca4ah)		;b00b   ; en la zona 3 sala 6, con Snake en Y 0x26-0xA9 y X 0x10-0xA7, tampoco
	cp 003h		;b00e
	jr nz,L_B029		;b010
	ld a,(0ca4bh)		;b012   ; lee la sala de la zona
	cp 006h		;b015
	jr nz,L_B029		;b017
	ld a,(0cb03h)		;b019   ; lee la Y de Snake
	sub 026h		;b01c
	cp 084h		;b01e
	ret c			;b020
	ld a,(0cb05h)		;b021   ; lee la X de Snake
	sub 010h		;b024
	cp 098h		;b026
	ret c			;b028
L_B029:
	call punto_de_ficha		;b029   ; el punto de la ficha...
	call 07f88h		;b02c   ; ...y los 3 de debajo: solidos?
	ret nc			;b02f
	ld b,(ix+000h)		;b030   ; si: se acaba
	call acaba_ficha_si		;b033   ; acaba_ficha_si: la ficha libre y 0xCB52 = 0
	ld a,b			;b036   ; el tipo 6, ademas, p03:B1BA en su sitio
	cp 006h		;b037
	ret nz			;b039
	ld l,(ix+003h)		;b03a
	ld h,(ix+005h)		;b03d
	ld c,000h		;b040
	jp algo_en_la_sala		;b042   ; algo_en_la_sala: DE = la fila y la columna de ahora
punto_de_ficha:		; L = la Y, H = la X de la ficha; el tipo 6 con lo de su direccion (byte 0x0B, p03:B077), sin pasar de 0xB8
	ld a,(ix+000h)		;b045   ; el tipo 6...
	cp 006h		;b048
	jr z,L_B053		;b04a   ; ...con su direccion (p03:B053)
	ld l,(ix+003h)		;b04c   ; L = la Y
	ld h,(ix+005h)		;b04f   ; H = la X
	ret			;b052
L_B053:
	ld hl,0b077h		;b053
	ld a,(ix+00bh)		;b056
	dec a			;b059
	add a,a			;b05a
	call 0423eh		;b05b   ; suma_a_hl: HL = HL + A
	ld a,(ix+003h)		;b05e
	add a,(hl)			;b061
	cp 0c0h		;b062
	jr c,L_B068		;b064
	ld a,0b8h		;b066
L_B068:
	ld b,a			;b068   ; B = la Y
	inc hl			;b069
	ld a,(ix+005h)		;b06a   ; la X + lo de la direccion...
	add a,(hl)			;b06d
	cp 0c0h		;b06e   ; ...sin pasar de 0xB8
	jr c,L_B074		;b070
	ld a,0b8h		;b072
L_B074:
	ld h,a			;b074
	ld l,b			;b075
	ret			;b076

; ----------------------------------------------------------------------
; DATOS resto_B077: lo apuntan con el banco puesto p03:B053 (0xB077); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p03:B053 (8 bytes)
;   0xb077..0xb07f  (8 bytes)
DATA_resto_B077:
	defb 000h,004h,010h,004h,004h,000h,004h,010h	; b077  ........

; ======================================================================
; CODIGO 0xb07f..0xb0b9  (58 bytes)
; ======================================================================


choca_con_la_sala:		; sin acarreo los tipos 3, 5, 7 y 8
	ld a,(ix+000h)		;b07f   ; el tipo: 8...
	cp 008h		;b082
	jr z,L_B094		;b084
	cp 003h		;b086   ; ...3...
	jr z,L_B094		;b088
	cp 007h		;b08a   ; ...7...
	jr z,L_B094		;b08c
	cp 005h		;b08e   ; ...y 5 no chocan
	jr z,L_B094		;b090
	scf			;b092   ; los demas, si
	ret			;b093
L_B094:
	or a			;b094
	ret			;b095
acaba_ficha:		; el tipo 8: el sonido 4 y 0xD44F = 0
	ld a,(ix+000h)		;b096
	cp 008h		;b099
	jr nz,acaba_ficha_si		;b09b
	call 06a6bh		;b09d   ; sonido_04: pide el sonido 0x04
	xor a			;b0a0
	ld (0d44fh),a		;b0a1
acaba_ficha_si:		; la ficha libre y 0xCB52 = 0
	xor a			;b0a4
	ld (ix+000h),a		;b0a5
	ld hl,0cb52h		;b0a8
	ld (hl),a			;b0ab
	ret			;b0ac
banderas_al_empezar:		; las banderas de 0xD7D0 (21 bytes) de p03:B0B9
	ld de,0d7d0h		;b0ad   ; apunta a las banderas de la partida: la n en el bit 7 - n % 8 del byte n / 8 (p03:B0DC, p03:B0F6)
	ld hl,0b0b9h		;b0b0
	ld bc,00015h		;b0b3
	ldir		;b0b6
	ret			;b0b8

; ----------------------------------------------------------------------
; DATOS resto_B0B9: lo apuntan con el banco puesto p03:B0B0 (0xB0B9); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p03:B0B0 (21 bytes)
;   0xb0b9..0xb0ce  (21 bytes)
DATA_resto_B0B9:
	defb 021h,048h,0e6h,048h,000h,003h,011h,001h,000h,041h,000h,01ch,0dfh,0ffh,0feh,0fbh	; b0b9  !H.H.....A......
	defb 06ah,041h,0c1h,082h,004h	; b0c9

; ======================================================================
; CODIGO 0xb0ce..0xb3a0  (722 bytes)
; ======================================================================


pon_bandera_d8d8:		; pone la bandera A de 0xD8D8 (las de la sala)
	ld hl,0d8d8h		;b0ce   ; apunta a las banderas de la sala (se borran al cambiar de sala, p00:59DD)
	jr pon_bandera_hl		;b0d1
pon_bandera_d7f0:		; pone la bandera A de 0xD7F0
	ld hl,0d7f0h		;b0d3   ; apunta a otras banderas de la partida (p03:B0D3, p03:B0FE)
pon_bandera_hl:		; el bit de la bandera A en la tabla HL...
	call bit_de_bandera		;b0d6   ; bit_de_bandera: HL = HL + A / 8, A = el bit 7 - (A & 7)
	or (hl)			;b0d9   ; ...a uno
	ld (hl),a			;b0da
	ret			;b0db
pon_bandera:		; pone la bandera A de 0xD7D0
	ld hl,0d7d0h		;b0dc   ; apunta a las banderas de la partida: la n en el bit 7 - n % 8 del byte n / 8 (p03:B0DC, p03:B0F6)
	jr pon_bandera_hl		;b0df
bit_de_bandera:		; HL = HL + A / 8, A = el bit 7 - (A & 7)
	ld b,a			;b0e1
	rra			;b0e2   ; el byte: A / 8
	rra			;b0e3
	rra			;b0e4
	and 01fh		;b0e5
	ld e,a			;b0e7
	ld d,000h		;b0e8
	add hl,de			;b0ea
	ld a,b			;b0eb   ; el bit: el 7 para A & 7 = 0...
	and 007h		;b0ec
	or a			;b0ee
	ld a,080h		;b0ef
	ret z			;b0f1
L_B0F2:
	rrca			;b0f2   ; ...y uno menos por cada uno
	djnz L_B0F2		;b0f3
	ret			;b0f5
mira_bandera:		; NZ si la bandera A de 0xD7D0 esta puesta
	ld hl,0d7d0h		;b0f6   ; apunta a las banderas de la partida: la n en el bit 7 - n % 8 del byte n / 8 (p03:B0DC, p03:B0F6)
mira_bandera_hl:		; el bit...
	call bit_de_bandera		;b0f9   ; bit_de_bandera: HL = HL + A / 8, A = el bit 7 - (A & 7)
	and (hl)			;b0fc   ; ...esta?
	ret			;b0fd
mira_bandera_d7f0:		; NZ si la bandera A de 0xD7F0 esta puesta
	ld hl,0d7f0h		;b0fe   ; apunta a otras banderas de la partida (p03:B0D3, p03:B0FE)
	jr mira_bandera_hl		;b101
mira_bandera_d8d8:		; NZ si la bandera A de 0xD8D8 esta puesta
	ld hl,0d8d8h		;b103   ; apunta a las banderas de la sala (se borran al cambiar de sala, p00:59DD)
	jr mira_bandera_hl		;b106
llamada_800e:		; la conversacion de p48:800E; si encuentra ficha, la llamada 0 (p03:B11F)
	ld a,(0ca97h)		;b108   ; lee 1 si los mensajes salen de los bancos 50-51 y no de 48-49
	or a			;b10b
	jr nz,L_B113		;b10c
	ld hl,0d7bbh		;b10e   ; sin 0xCA97, 0xD7BB = 0
	ld (hl),000h		;b111
L_B113:
	call 06361h		;b113   ; conversacion_800e: la conversacion de p48:800E
	ld a,(0ca9ch)		;b116   ; lee 1 si una conversacion ha encontrado su ficha
	or a			;b119
	ret z			;b11a
	xor a			;b11b
	jp empieza_llamada		;b11c   ; empieza_llamada: la llamada A: 0xE1E8 = 1, 0xE1E9 = A, 0xE1EA = 0, 0xE1EB = 0x0E
empieza_llamada:		; la llamada A: 0xE1E8 = 1, 0xE1E9 = A, 0xE1EA = 0, 0xE1EB = 0x0E
	push af			;b11f
	call borra_aviso		;b120   ; borra el aviso (p03:B1A3)
	pop af			;b123
	ld hl,0e1e8h		;b124   ; apunta a 1 mientras hay una llamada
	ld (hl),001h		;b127
	inc l			;b129
	ld (hl),a			;b12a
	inc l			;b12b
	ld (hl),000h		;b12c
	inc l			;b12e
	ld (hl),00eh		;b12f
	ret			;b131
llamada_cada_cuadro:		; sin llamada (0xE1E8 = 0), nada
	ld hl,0e1e8h		;b132   ; apunta a 1 mientras hay una llamada
	ld a,(hl)			;b135
	or a			;b136
	ret z			;b137
	inc hl			;b138   ; con 0xE1E9 distinto de 0: p03:B178
	ld a,(hl)			;b139
	or a			;b13a
	jr nz,aviso_de_llamada_b		;b13b
	call aviso_de_llamada		;b13d   ; el aviso (p03:B152)
	ld a,(0ca97h)		;b140   ; lee 1 si los mensajes salen de los bancos 50-51 y no de 48-49
	or a			;b143
	ret nz			;b144
	ld a,(0ca09h)		;b145   ; F4 recien pulsada: 0xD7BB = 1 y se acaba la llamada
	and 008h		;b148
	ret z			;b14a
	ld hl,0d7bbh		;b14b
	ld (hl),001h		;b14e
	jr acaba_llamada		;b150
aviso_de_llamada:		; mientras quedan avisos (0xE1EB), el mosaico de p46:96A3 en el marcador parpadea y suena el 0x1C
	ld a,(0e1ebh)		;b152   ; lee los avisos que le quedan a la llamada
	or a			;b155   ; sin avisos...
	jr z,borra_aviso		;b156   ; ...se borra
	inc l			;b158   ; la cuenta de 0xE1EC...
	dec (hl)			;b159   ; la cuenta de cuadros
	ld a,(hl)			;b15a   ; ...cada 4 cuadros...
	and 003h		;b15b   ; cada 4...
	jr nz,borra_aviso		;b15d
	ld a,(hl)			;b15f
	rra			;b160
	bit 3,a		;b161   ; ...el bit 3: la mitad de cada 16...
	jr z,borra_aviso		;b163
	bit 1,a		;b165   ; ...sin el bit 1...
	jr nz,borra_aviso		;b167
	push af			;b169   ; el mosaico
	call 07030h		;b16a   ; mosaico_96a3: el mosaico de p46:96A3 en X = 0xD0, Y = 4 (2 x 4)
	pop af			;b16d
	and 001h		;b16e   ; ...en una de cada dos, un aviso menos
	ret nz			;b170
	ld hl,0e1ebh		;b171   ; un aviso menos...
	dec (hl)			;b174
	jp 06a64h		;b175   ; ...y el sonido 0x1C
aviso_de_llamada_b:		; el otro aviso: el mosaico de p46:969B y el sonido 0x4F
	ld a,(0e1ebh)		;b178   ; lee los avisos que le quedan a la llamada
	or a			;b17b   ; sin avisos, fuera
	jr z,borra_aviso		;b17c
	inc l			;b17e
	dec (hl)			;b17f   ; la cuenta...
	ld a,(hl)			;b180
	rra			;b181   ; ...en pasos de 2 cuadros, de 0 a 7...
	and 007h		;b182
	cp 004h		;b184   ; ...de 4 en adelante, borrado
	jr nc,borra_aviso		;b186
	push hl			;b188
	push af			;b189
	call 0702bh		;b18a   ; mosaico_969b: el mosaico de p46:969B en X = 0xD0, Y = 4 (2 x 4)
	pop af			;b18d
	pop hl			;b18e
	ld a,(hl)			;b18f   ; en los cuadros pares...
	rra			;b190
	ret c			;b191
	and 007h		;b192   ; ...en el paso 3...
	cp 003h		;b194
	jp z,06c5bh		;b196   ; sonido_4f: pide el sonido 0x4F
	ret			;b199   ; ...el sonido 0x4F
acaba_llamada:		; borra el aviso y 0xE1E8 = 0
	call borra_aviso		;b19a   ; borra_aviso: X = 0xD0, Y = 0, 0x20 x 0x14 a 0 en las dos paginas
	ld hl,0e1e8h		;b19d   ; apunta a 1 mientras hay una llamada
	ld (hl),000h		;b1a0
	ret			;b1a2
borra_aviso:		; X = 0xD0, Y = 0, 0x20 x 0x14 a 0 en las dos paginas
	ld a,(0ca42h)		;b1a3   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	ld d,a			;b1a6
	call L_B1B0		;b1a7
	ld a,(0ca42h)		;b1aa   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	xor 001h		;b1ad
	ld d,a			;b1af
L_B1B0:
	ld hl,0d000h		;b1b0
	ld bc,02014h		;b1b3
	xor a			;b1b6
	jp 046ffh		;b1b7   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
algo_en_la_sala:		; DE = la fila y la columna de ahora
	ld de,(0ca50h)		;b1ba   ; lee la fila de la sala en la zona (uno mas al salir por arriba) y el byte siguiente (16 bits)
algo_en_la_sala_de:		; en la zona 0x0C: p03:B1FD
	ld a,(0ca4ah)		;b1be   ; lee la zona
	cp 00ch		;b1c1   ; la zona 0x0C
	jr z,L_B1FD		;b1c3
	cp 00fh		;b1c5   ; en la 0x0F sala 0, con H 0x48-0x9F y L < 0x60: p03:B206 sin mirar
	jr nz,L_B1DF		;b1c7
	ld a,(0ca4bh)		;b1c9   ; lee la sala de la zona
	or a			;b1cc   ; la sala 0 de la zona 0x0F...
	jr nz,L_B1DF		;b1cd
	ld a,h			;b1cf   ; ...con H entre 0x48 y 0x9F...
	cp 048h		;b1d0
	jr c,L_B1DF		;b1d2
	cp 0a0h		;b1d4
	jr nc,L_B1DF		;b1d6
	ld a,l			;b1d8   ; ...y L por debajo de 0x60
	cp 060h		;b1d9
	jr nc,L_B1DF		;b1db
	jr L_B1F5		;b1dd
L_B1DF:
	ld a,(0ca50h)		;b1df   ; en la sala de DE...
	cp e			;b1e2
	jr nz,L_B1F5		;b1e3
	ld a,(0ca51h)		;b1e5   ; lee la columna de la sala en la zona (uno mas al salir por la derecha)
	cp d			;b1e8
	jr nz,L_B1F5		;b1e9
	push bc			;b1eb
	push hl			;b1ec
	push de			;b1ed
	call 07f71h		;b1ee   ; ...si en (H, L) no hay nada, ya esta
	pop de			;b1f1
	pop hl			;b1f2
	pop bc			;b1f3
	ret c			;b1f4
L_B1F5:
	push ix		;b1f5   ; p03:B206
	call nueva_ficha_df80		;b1f7   ; nueva_ficha_df80: una ficha nueva en 0xDF80 (la primera libre; con C = 0 solo la primera)
	pop ix		;b1fa
	ret			;b1fc
L_B1FD:
	ld a,(0ca4bh)		;b1fd   ; en la zona 0x0C, desde la sala 4 sin mirar
	cp 004h		;b200
	jr c,L_B1DF		;b202
	jr L_B1F5		;b204
nueva_ficha_df80:		; una ficha nueva en 0xDF80 (la primera libre; con C = 0 solo la primera)
	ld ix,0df80h		;b206   ; apunta a 8 fichas de 8 bytes [tipo][dibujo][Y][X][fila][columna][espera][grafico] que suenan 0x14 en la sala y 0x15 al lado
	ld a,c			;b20a
	ld b,001h		;b20b
	or a			;b20d
	jr z,L_B212		;b20e
	ld b,008h		;b210
L_B212:
	ld a,(ix+000h)		;b212   ; libre?
	or a			;b215
	jr z,L_B222		;b216
	push de			;b218
	ld de,00008h		;b219   ; la siguiente, 8 bytes mas alla
	add ix,de		;b21c
	pop de			;b21e
	djnz L_B212		;b21f
	ret			;b221
L_B222:
	call rellena_y_pinta		;b222   ; la rellena y la pinta
	call suena_segun_sala		;b225   ; el sonido segun lo lejos (p03:B230)
	push ix		;b228   ; y 0xD446 = 4
	call d446_si		;b22a   ; d446_si: con 0xCA5F < 2, 0xD446 = 4
	pop ix		;b22d
	ret			;b22f
suena_segun_sala:		; el sonido 0x14 en esta sala; el 0x15 en una de al lado (fila o columna a 1)
	ld a,(0ca50h)		;b230   ; lee la fila de la sala en la zona (uno mas al salir por arriba)
	sub (ix+004h)		;b233   ; la fila de la ficha contra la de ahora
	jr z,L_B247		;b236
	jr nc,L_B23C		;b238
	neg		;b23a
L_B23C:
	cp 002h		;b23c   ; dos o mas: nada
	ret nc			;b23e
	ld a,(0ca51h)		;b23f   ; lee la columna de la sala en la zona (uno mas al salir por la derecha)
	sub (ix+005h)		;b242   ; la columna
	jr z,L_B250		;b245
L_B247:
	ld a,(0ca51h)		;b247   ; lee la columna de la sala en la zona (uno mas al salir por la derecha)
	sub (ix+005h)		;b24a   ; la misma sala: 0x14
	jp z,06a44h		;b24d   ; sonido_14: pide el sonido 0x14
L_B250:
	jr nc,L_B254		;b250
	neg		;b252
L_B254:
	cp 002h		;b254   ; al lado: 0x15
	ret nc			;b256
	jp 06a48h		;b257   ; sonido_15: pide el sonido 0x15
rellena_y_pinta:
	call rellena_ficha_df80		;b25a   ; rellena_ficha_df80: [1][0][L = Y][H = X][E = fila][D = columna][3][C]
	call es_de_esta_sala		;b25d   ; si esta en esta sala y tiene dibujo, guarda el fondo y la pinta
	ret nz			;b260
	ld a,(ix+007h)		;b261
	and 00fh		;b264
	ret z			;b266
	call guarda_fondo		;b267   ; guarda_fondo: el fondo (16 x 16) de la otra pagina a esta en el sitio de la ficha
	jp pinta_ficha		;b26a   ; pinta_ficha: el dibujo de la ficha (16 x 16 desde X = 0x68 + dibujo * 16, Y = 0xB0 de la pagina 3, TIMP)
rellena_ficha_df80:		; [1][0][L = Y][H = X][E = fila][D = columna][3][C]
	ld (ix+000h),001h		;b26d   ; en uso
	ld (ix+001h),000h		;b271   ; el dibujo 0
	ld (ix+002h),l		;b275   ; la Y
	ld (ix+003h),h		;b278   ; la X
	ld (ix+006h),003h		;b27b   ; la espera de 3 cuadros
	ld (ix+007h),c		;b27f   ; el grafico
	ld (ix+004h),e		;b282   ; la fila...
	ld (ix+005h),d		;b285   ; ...y la columna de la sala
	ret			;b288
guarda_fondo:		; el fondo (16 x 16) de la otra pagina a esta en el sitio de la ficha
	call sitio_del_fondo		;b289   ; sitio_del_fondo: DE = donde se guarda el fondo de la ficha B - 1 (X = 0xC0 + (B & 3) * 16, Y = 0x90 o 0xA0 por el bit 2), HL = su sitio, BC = 16 x 16
	jp 0474dh		;b28c   ; copia_rectangulo_a_esta: p00:4767 de la otra pagina (0xCA42 ^ 1) a la de 0xCA42
sitio_del_fondo:		; DE = donde se guarda el fondo de la ficha B - 1 (X = 0xC0 + (B & 3) * 16, Y = 0x90 o 0xA0 por el bit 2), HL = su sitio, BC = 16 x 16
	dec b			;b28f   ; el numero de la ficha, desde 0
	ld a,b			;b290
	and 004h		;b291   ; el bit 2: Y = 0x90 o 0xA0
	ld a,b			;b293
	ld e,090h		;b294
	jr z,L_B29A		;b296
	ld e,0a0h		;b298
L_B29A:
	ld a,b			;b29a   ; los bits 0-1...
	and 003h		;b29b
	rlca			;b29d   ; ...* 16...
	rlca			;b29e
	rlca			;b29f
	rlca			;b2a0
	add a,0c0h		;b2a1   ; ...+ 0xC0: la X
	ld d,a			;b2a3
	ld l,(ix+002h)		;b2a4   ; HL = la Y y la X de la ficha
	ld h,(ix+003h)		;b2a7
	ld bc,01010h		;b2aa   ; 16 x 16
	ret			;b2ad
es_de_esta_sala:		; Z si la fila y la columna de la ficha son las de ahora
	ld a,(0ca50h)		;b2ae   ; lee la fila de la sala en la zona (uno mas al salir por arriba)
	cp (ix+004h)		;b2b1
	ret nz			;b2b4
	ld a,(0ca51h)		;b2b5   ; lee la columna de la sala en la zona (uno mas al salir por la derecha)
	cp (ix+005h)		;b2b8
	ret			;b2bb
fichas_df80:		; las 8 fichas de 0xDF80 en cada cuadro
	ld ix,0df80h		;b2bc   ; apunta a 8 fichas de 8 bytes [tipo][dibujo][Y][X][fila][columna][espera][grafico] que suenan 0x14 en la sala y 0x15 al lado
	ld b,008h		;b2c0
L_B2C2:
	ld a,(ix+000h)		;b2c2
	and 07fh		;b2c5
	jr z,L_B2CE		;b2c7
	push bc			;b2c9
	call ficha_df80		;b2ca   ; ficha_df80: saliendo de la sala, se borra
	pop bc			;b2cd
L_B2CE:
	ld de,00008h		;b2ce
	add ix,de		;b2d1
	djnz L_B2C2		;b2d3
	ret			;b2d5
ficha_df80:		; saliendo de la sala, se borra
	ld a,(0ca41h)		;b2d6   ; lee la salida de la sala (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	or a			;b2d9
	jr z,L_B2E1		;b2da
	ld (ix+000h),000h		;b2dc
	ret			;b2e0
L_B2E1:
	dec (ix+006h)		;b2e1   ; cada 3 cuadros...
	jr nz,L_B307		;b2e4
	ld (ix+006h),003h		;b2e6
	ld a,(ix+001h)		;b2ea   ; ...el dibujo siguiente (0-2)...
	inc a			;b2ed
	cp 003h		;b2ee
	jr nc,L_B314		;b2f0
	ld (ix+001h),a		;b2f2
	ld a,(ix+007h)		;b2f5   ; ...y si tiene dibujo y es de esta sala, el fondo y el dibujo
	and 00fh		;b2f8
	ret z			;b2fa
	call es_de_esta_sala		;b2fb   ; es_de_esta_sala: Z si la fila y la columna de la ficha son las de ahora
	ret nz			;b2fe
	push bc			;b2ff
	call vuelve_el_fondo		;b300   ; vuelve_el_fondo: el fondo guardado otra vez a la otra pagina
	pop bc			;b303
	jp pinta_ficha		;b304   ; pinta_ficha: el dibujo de la ficha (16 x 16 desde X = 0x68 + dibujo * 16, Y = 0xB0 de la pagina 3, TIMP)
L_B307:
	ld a,(ix+007h)		;b307   ; entre medias, solo el dibujo
	and 00fh		;b30a
	ret z			;b30c
	call es_de_esta_sala		;b30d   ; es_de_esta_sala: Z si la fila y la columna de la ficha son las de ahora
	ret nz			;b310
	jp pinta_ficha		;b311   ; pinta_ficha: el dibujo de la ficha (16 x 16 desde X = 0x68 + dibujo * 16, Y = 0xB0 de la pagina 3, TIMP)
L_B314:
	ld (ix+000h),000h		;b314   ; tras el dibujo 2, libre y el fondo otra vez
	call es_de_esta_sala		;b318   ; es_de_esta_sala: Z si la fila y la columna de la ficha son las de ahora
	ret nz			;b31b
	ld a,(ix+007h)		;b31c
	and 00fh		;b31f
	ret z			;b321
vuelve_el_fondo:		; el fondo guardado otra vez a la otra pagina
	call sitio_del_fondo		;b322   ; sitio_del_fondo: DE = donde se guarda el fondo de la ficha B - 1 (X = 0xC0 + (B & 3) * 16, Y = 0x90 o 0xA0 por el bit 2), HL = su sitio, BC = 16 x 16
	ex de,hl			;b325
	jp 0475ah		;b326   ; copia_rectangulo_a_la_otra: p00:4767 de la pagina 0xCA42 a la otra
sprites_df80:		; las fichas de 0xDF80 sin dibujo de fondo son sprites (desde el 8, 0xDC20, colores en 0xDA80)
	ld ix,0df80h		;b329   ; apunta a 8 fichas de 8 bytes [tipo][dibujo][Y][X][fila][columna][espera][grafico] que suenan 0x14 en la sala y 0x15 al lado
	ld hl,0dc20h		;b32d
	ld de,0da80h		;b330
	ld b,008h		;b333
L_B335:
	ld a,(ix+000h)		;b335
	and 07fh		;b338
	jr z,L_B34D		;b33a
	ld a,(ix+007h)		;b33c
	and 00fh		;b33f
	jr nz,L_B34D		;b341
	call es_de_esta_sala		;b343   ; es_de_esta_sala: Z si la fila y la columna de la ficha son las de ahora
	jr nz,L_B34D		;b346
	push bc			;b348
	call sprite_de_ficha		;b349   ; sprite_de_ficha: los dos sprites y sus colores
	pop bc			;b34c
L_B34D:
	push de			;b34d   ; la ficha siguiente
	ld de,00008h		;b34e
	add ix,de		;b351
	pop de			;b353
	djnz L_B335		;b354
	ret			;b356
sprite_de_ficha:		; los dos sprites y sus colores
	call dos_sprites_de_ficha		;b357   ; dos_sprites_de_ficha: el patron del dibujo, en la Y y la X de la ficha, y el siguiente (+ 4)
	jr colores_de_ficha		;b35a
dos_sprites_de_ficha:		; el patron del dibujo, en la Y y la X de la ficha, y el siguiente (+ 4)
	push de			;b35c
	call patron_de_ficha		;b35d   ; patron_de_ficha: C = 0x28 + el dibujo * 8
	ld e,(ix+002h)		;b360
	ld d,(ix+003h)		;b363
	call 05d41h		;b366   ; pon_sprite: [E][D][C] en (HL): la Y, la X y el patron de un sprite de 0xDC00
	call 05d3dh		;b369   ; pon_sprite_mas_4: p00:5D41 con el patron C + 4
	pop de			;b36c
	ret			;b36d
patron_de_ficha:		; C = 0x28 + el dibujo * 8
	ld a,(ix+001h)		;b36e   ; el dibujo...
	rlca			;b371   ; ...* 8...
	rlca			;b372
	rlca			;b373
	add a,028h		;b374   ; ...+ 0x28
	ld c,a			;b376
	ret			;b377
colores_de_ficha:		; 16 lineas del color B y 16 del C (p03:B3A0 segun el dibujo)
	push hl			;b378
	call colores_del_dibujo		;b379   ; colores_del_dibujo: B y C = los dos colores del dibujo de la ficha (p03:B3A0)
	push bc			;b37c
	ld h,d			;b37d   ; los colores del primer sprite...
	ld l,e			;b37e   ; HL = DE
	inc de			;b37f
	ld (hl),b			;b380   ; ...16 lineas del color B
	ld bc,0000fh		;b381   ; 15 bytes mas
	ldir		;b384
	inc de			;b386
	inc hl			;b387
	pop bc			;b388
	ld (hl),c			;b389   ; los del segundo, del color C
	ld bc,0000fh		;b38a   ; otros 15
	ldir		;b38d
	inc de			;b38f
	pop hl			;b390
	ret			;b391
colores_del_dibujo:		; B y C = los dos colores del dibujo de la ficha (p03:B3A0)
	ld a,(ix+001h)		;b392
	add a,a			;b395
	ld hl,0b3a0h		;b396
	call 0423eh		;b399   ; suma_a_hl: HL = HL + A
	ld b,(hl)			;b39c
	inc hl			;b39d
	ld c,(hl)			;b39e
	ret			;b39f

; ----------------------------------------------------------------------
; DATOS resto_B3A0: lo apuntan con el banco puesto p03:B396 (0xB3A0); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p03:B396 (6 bytes)
;   0xb3a0..0xb3a6  (6 bytes)
DATA_resto_B3A0:
	defb 007h,04bh,00ah,04bh,003h,04ch	; b3a0

; ======================================================================
; CODIGO 0xb3a6..0xb9ce  (1576 bytes)
; ======================================================================


pinta_ficha:		; el dibujo de la ficha (16 x 16 desde X = 0x68 + dibujo * 16, Y = 0xB0 de la pagina 3, TIMP)
	ld e,(ix+002h)		;b3a6   ; E = la Y
	ld d,(ix+003h)		;b3a9   ; D = la X
	ld a,(ix+001h)		;b3ac   ; el dibujo...
	rlca			;b3af
	rlca			;b3b0
	rlca			;b3b1
	rlca			;b3b2
	add a,068h		;b3b3   ; ...* 16 + 0x68: la X de origen
	ld h,a			;b3b5
	ld l,0b0h		;b3b6   ; Y = 0xB0
	ld bc,01010h		;b3b8   ; 16 x 16
	ld a,(0ca42h)		;b3bb   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	rlca			;b3be   ; la pagina a los bits 4-5...
	rlca			;b3bf
	rlca			;b3c0
	rlca			;b3c1
	or 0c8h		;b3c2   ; ...de la 3, TIMP
	jp 047edh		;b3c4   ; copia_rectangulo_logica: orden LMMM del VDP con la operacion logica de A
empiezan_los_que_siguen:		; el rastro con la posicion de Snake y, segun 0xCAA0, 0xE240 = 3 (y 0xE248 = 3 desde 2; 0xDFD8 = 3 con 4)
	call llena_el_rastro		;b3c7   ; llena_el_rastro: las 16 posiciones del rastro con la Y, la X y la direccion de ahora
	ld a,(0caa0h)		;b3ca   ; lee cuantos siguen a Snake por su rastro (1-4)
	cp 004h		;b3cd
	jr z,L_B3E2		;b3cf
	ld a,003h		;b3d1
	ld (0e240h),a		;b3d3   ; guarda la ficha del que sigue a Snake 4 posiciones por detras (del rastro de 0xE08C)
	ld a,(0caa0h)		;b3d6   ; lee cuantos siguen a Snake por su rastro (1-4)
	cp 002h		;b3d9
	ret c			;b3db
	ld a,003h		;b3dc
	ld (0e248h),a		;b3de   ; guarda la ficha del que sigue a Snake 12 posiciones por detras (0xE0A4)
	ret			;b3e1
L_B3E2:
	ld a,003h		;b3e2
	ld (0dfd8h),a		;b3e4
	ret			;b3e7
llena_el_rastro:		; las 16 posiciones del rastro con la Y, la X y la direccion de ahora
	ld hl,0e080h		;b3e8   ; apunta a el rastro de Snake: las ultimas 16 posiciones [Y][X][direccion] (con 0xCAA0)
	ld a,(0cb03h)		;b3eb   ; lee la Y de Snake
	ld (hl),a			;b3ee
	inc l			;b3ef
	ld a,(0cb05h)		;b3f0   ; lee la X de Snake
	ld (hl),a			;b3f3
	inc l			;b3f4
	ld a,(0cb0eh)		;b3f5   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ld (hl),a			;b3f8
	ld e,l			;b3f9
	ld d,h			;b3fa
	dec l			;b3fb
	dec l			;b3fc
	inc e			;b3fd
	ld bc,0002dh		;b3fe
	ldir		;b401
	ret			;b403
los_que_siguen:		; con 0xCAA0 = 3, p03:B4AF; si no, las tres fichas (0xE240, 0xE248, 0xDFD8) por el rastro
	ld a,(0caa0h)		;b404   ; lee cuantos siguen a Snake por su rastro (1-4)
	cp 003h		;b407
	jp z,los_que_siguen_3		;b409   ; los_que_siguen_3: con 0xCAA0 = 3, los dos andan arriba o abajo como Snake si no choca
	call el_de_e240		;b40c   ; el_de_e240: 0xE240 con la posicion del rastro de 0xE08C y 0x100 de rapidez
	call el_de_e248		;b40f   ; el_de_e248: 0xE248 con la posicion del rastro de 0xE0A4 y 0x80 de rapidez
	ld hl,0dfd8h		;b412
	ld de,000c0h		;b415
	jr L_B420		;b418
el_de_e248:		; 0xE248 con la posicion del rastro de 0xE0A4 y 0x80 de rapidez
	ld hl,0e248h		;b41a   ; apunta a la ficha del que sigue a Snake 12 posiciones por detras (0xE0A4)
	ld de,00080h		;b41d
L_B420:
	ld bc,0e0a4h		;b420
	jr sigue_el_rastro		;b423
el_de_e240:		; 0xE240 con la posicion del rastro de 0xE08C y 0x100 de rapidez
	ld hl,0e240h		;b425   ; apunta a la ficha del que sigue a Snake 4 posiciones por detras (del rastro de 0xE08C)
	ld de,00100h		;b428
	ld bc,0e08ch		;b42b
sigue_el_rastro:		; por su estado: 1 se para, 2 anda (p03:B457), 3 toma la posicion del rastro
	ld a,(hl)			;b42e   ; el estado del que sigue
	dec a			;b42f
	jr z,L_B439		;b430   ; 1: se para
	dec a			;b432
	jr z,anda_el_que_sigue		;b433   ; 2: anda
	dec a			;b435
	jr z,L_B441		;b436   ; 3: el rastro
	ret			;b438
L_B439:
	ld a,007h		;b439   ; 1: el byte 7 a cero
	call 0423eh		;b43b   ; suma_a_hl: HL = HL + A
	xor a			;b43e
	ld (hl),a			;b43f
	ret			;b440
L_B441:
	ld a,(bc)			;b441   ; 3: la Y, la X y la direccion del rastro...
	inc l			;b442   ; la Y (byte 3)
	inc l			;b443
	inc l			;b444
	ld (hl),a			;b445
	inc bc			;b446
	ld a,(bc)			;b447
	inc l			;b448   ; la X (byte 5)
	inc l			;b449
	ld (hl),a			;b44a
	inc bc			;b44b
	ld a,(bc)			;b44c
	inc l			;b44d   ; la direccion (byte 6)
	ld (hl),a			;b44e
	inc l			;b44f
	ld a,(0cb14h)		;b450   ; ...y el paso de Snake
	and 001h		;b453   ; el paso, de Snake
	ld (hl),a			;b455
	ret			;b456
anda_el_que_sigue:		; la Y o la X (16 bits) segun su direccion, mas o menos DE
	push hl			;b457   ; la ficha
	inc l			;b458   ; BC = su Y (16 bits)
	inc l			;b459
	ld c,(hl)			;b45a   ; BC = la Y (16 bits)
	inc l			;b45b
	ld b,(hl)			;b45c
	inc l			;b45d
	push bc			;b45e
	ld c,(hl)			;b45f   ; HL = su X (16 bits)
	inc l			;b460
	ld b,(hl)			;b461
	inc l			;b462
	ld a,(hl)			;b463   ; A = su direccion
	ld l,c			;b464   ; HL = la X (16 bits)
	ld h,b			;b465
	pop bc			;b466
	call mas_o_menos		;b467   ; mas_o_menos: DE = BC o HL + DE con el signo de la direccion A
	pop hl			;b46a
	cp 003h		;b46b   ; arriba o abajo: la Y; si no, la X
	ld a,002h		;b46d   ; la Y: el byte 2
	jr c,L_B473		;b46f
	ld a,004h		;b471   ; la X
L_B473:
	push hl			;b473   ; la nueva, en su sitio
	call 0423eh		;b474   ; suma_a_hl: HL = HL + A
	ld (hl),e			;b477
	inc l			;b478
	ld (hl),d			;b479
	pop hl			;b47a
	ld a,007h		;b47b   ; y el paso
	call 0423eh		;b47d   ; suma_a_hl: HL = HL + A
cambia_paso:		; cada 8 cuadros, el bit 0 de (HL) cambia
	ld a,(0ca03h)		;b480   ; lee el contador de cuadros (uno mas en cada interrupcion)
	and 007h		;b483
	ret nz			;b485
	ld a,(hl)			;b486
	xor 001h		;b487
	ld (hl),a			;b489
	ret			;b48a
paso_e247:
	ld hl,0e247h		;b48b
	jr cambia_paso		;b48e
paso_e24f:
	ld hl,0e24fh		;b490
	jr cambia_paso		;b493
mas_o_menos:		; DE = BC o HL + DE con el signo de la direccion A
	push af			;b495
	dec a			;b496
	dec a			;b497
	jr z,L_B4A3		;b498
	dec a			;b49a
	jr z,L_B4A7		;b49b
	dec a			;b49d
	jr z,L_B4AA		;b49e
	call 04442h		;b4a0   ; de_negativo: DE = -DE
L_B4A3:
	ld l,c			;b4a3
	ld h,b			;b4a4
	jr L_B4AA		;b4a5
L_B4A7:
	call 04442h		;b4a7   ; de_negativo: DE = -DE
L_B4AA:
	add hl,de			;b4aa
	ld d,h			;b4ab
	ld e,l			;b4ac
	pop af			;b4ad
	ret			;b4ae
los_que_siguen_3:		; con 0xCAA0 = 3, los dos andan arriba o abajo como Snake si no choca
	ld a,(0cb0fh)		;b4af   ; lee 1 si Snake ha chocado en este cuadro
	or a			;b4b2
	ret nz			;b4b3
	ld a,(0cb0eh)		;b4b4   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	cp 003h		;b4b7
	ret nc			;b4b9
	ld (0e24eh),a		;b4ba
	ld (0e246h),a		;b4bd
	ld hl,0e248h		;b4c0   ; apunta a la ficha del que sigue a Snake 12 posiciones por detras (0xE0A4)
	ld de,00080h		;b4c3
	call anda_el_que_sigue		;b4c6   ; anda_el_que_sigue: la Y o la X (16 bits) segun su direccion, mas o menos DE
	ld hl,0e240h		;b4c9   ; apunta a la ficha del que sigue a Snake 4 posiciones por detras (del rastro de 0xE08C)
	ld de,000c0h		;b4cc
	jr anda_el_que_sigue		;b4cf
cuenta_caa0:		; con 0xCAA0 = 3 pasa a 2; con cualquiera, empiezan los que siguen
	ld hl,0caa0h		;b4d1   ; apunta a cuantos siguen a Snake por su rastro (1-4)
	ld a,(hl)			;b4d4
	or a			;b4d5
	ret z			;b4d6
	cp 003h		;b4d7
	jp nz,empiezan_los_que_siguen		;b4d9   ; empiezan_los_que_siguen: el rastro con la posicion de Snake y, segun 0xCAA0, 0xE240 = 3 (y 0xE248 = 3 desde 2; 0xDFD8 = 3 con 4)
	dec (hl)			;b4dc
	jp empiezan_los_que_siguen		;b4dd   ; empiezan_los_que_siguen: el rastro con la posicion de Snake y, segun 0xCAA0, 0xE240 = 3 (y 0xE248 = 3 desde 2; 0xDFD8 = 3 con 4)
dibuja_los_que_siguen:		; p03:B4E6 y p03:B563
	call dibuja_el_de_e240		;b4e0   ; dibuja_el_de_e240: sin 0xE240, nada
	jp dibuja_el_de_e248		;b4e3   ; dibuja_el_de_e248: lo mismo para el de 0xE248: sprites 24-27 (0xDC60) desde el patron 0x28, colores de p08:BB1A y p08:BB2C
dibuja_el_de_e240:		; sin 0xE240, nada
	ld a,(0e240h)		;b4e6   ; lee la ficha del que sigue a Snake 4 posiciones por detras (del rastro de 0xE08C)
	or a			;b4e9
	ret z			;b4ea
	call sprites_del_de_e240		;b4eb   ; sus sprites y, si se ve, sus colores
	ld a,(0e241h)		;b4ee
	or a			;b4f1
	call nz,colores_del_de_e240		;b4f2   ; colores_del_de_e240: los colores de los sprites 28-31: p08:BB47 (p08:BB64 con 0xE040 = 5) y p08:BB5F
	ret			;b4f5
sprites_del_de_e240:		; los sprites 28-31 (0xDC70) del que sigue de 0xE240, con los patrones desde 0x88
	ld a,(0e241h)		;b4f6
	ld de,0dc70h		;b4f9
	ld hl,0e243h		;b4fc
	ld c,088h		;b4ff
sprites_del_que_sigue:		; sin el, o por debajo de Y = 0xC0, fuera
	or a			;b501   ; sin el, fuera
	jr z,esconde_4_sprites		;b502
	ld a,(hl)			;b504   ; la Y...
	cp 0c0h		;b505   ; ...desde 0xC0, fuera
	jr nc,esconde_4_sprites		;b507
	push de			;b509
	sub 020h		;b50a   ; la Y - 0x20
	ld e,a			;b50c
	inc l			;b50d
	inc l			;b50e
	ld a,(hl)			;b50f   ; la X - 8
	sub 008h		;b510
	ld d,a			;b512
	inc l			;b513
	ld b,(hl)			;b514   ; B = la direccion
	inc l			;b515
	ld a,(hl)			;b516   ; el paso
	ld (0d8e5h),a		;b517   ; el paso, a 0xD8E5
	ld a,c			;b51a   ; el patron: C + 0x18 por direccion
L_B51B:
	add a,018h		;b51b
	djnz L_B51B		;b51d
	ld c,a			;b51f
	pop hl			;b520
	ld b,002h		;b521   ; dos filas de dos sprites
L_B523:
	call 05d41h		;b523   ; pon_sprite: [E][D][C] en (HL): la Y, la X y el patron de un sprite de 0xDC00
	call 05d3dh		;b526   ; pon_sprite_mas_4: p00:5D41 con el patron C + 4
	ld a,e			;b529   ; la de abajo, 16 lineas mas abajo
	add a,010h		;b52a
	ld e,a			;b52c
	ld a,(0d8e5h)		;b52d   ; el patron de abajo: + 4, o + 0x0C con el paso 1
	rra			;b530
	ld a,004h		;b531
	jr nc,L_B537		;b533
	ld a,00ch		;b535
L_B537:
	add a,c			;b537
	ld c,a			;b538
	djnz L_B523		;b539
	ret			;b53b
colores_del_de_e240:		; los colores de los sprites 28-31: p08:BB47 (p08:BB64 con 0xE040 = 5) y p08:BB5F
	ld de,0bb47h		;b53c
	ld a,(0e040h)		;b53f
	cp 005h		;b542
	jr nz,L_B549		;b544
	ld de,0bb64h		;b546
L_B549:
	ld hl,0dbc0h		;b549
	call 06fd5h		;b54c   ; rachas_a_ram_de_8: las rachas de DE (banco 8) en HL
	ld hl,0dbe0h		;b54f
	ld de,0bb5fh		;b552
	jp 06fd5h		;b555   ; rachas_a_ram_de_8: las rachas de DE (banco 8) en HL
esconde_4_sprites:		; los 4 sprites de DE fuera (Y = 0xE0)
	ld h,d			;b558   ; DE = los 4 sprites...
	ld l,e			;b559
	inc de			;b55a
	ld (hl),0e0h		;b55b   ; ...Y = 0xE0...
	ld bc,0000fh		;b55d   ; ...16 bytes
	ldir		;b560
	ret			;b562
dibuja_el_de_e248:		; lo mismo para el de 0xE248: sprites 24-27 (0xDC60) desde el patron 0x28, colores de p08:BB1A y p08:BB2C
	ld a,(0e248h)		;b563   ; lee la ficha del que sigue a Snake 12 posiciones por detras (0xE0A4)
	or a			;b566
	ret z			;b567
	call L_B573		;b568
	ld a,(0e249h)		;b56b
	or a			;b56e
	call nz,L_B581		;b56f
	ret			;b572
L_B573:
	ld a,(0e249h)		;b573
	ld de,0dc60h		;b576
	ld hl,0e24bh		;b579
	ld c,028h		;b57c
	jp sprites_del_que_sigue		;b57e   ; sprites_del_que_sigue: sin el, o por debajo de Y = 0xC0, fuera
L_B581:
	ld de,0bb1ah		;b581
	ld hl,0db80h		;b584
	call 06fd5h		;b587   ; rachas_a_ram_de_8: las rachas de DE (banco 8) en HL
	ld de,0bb2ch		;b58a
	ld hl,0dba0h		;b58d
	jp 06fd5h		;b590   ; rachas_a_ram_de_8: las rachas de DE (banco 8) en HL
franja_de_dfd8:		; con 0xDFD8 y 0xDFD9, una franja de la pagina 0 a Y = 0xFE de la 1 (YMMM)
	ld a,(0dfd8h)		;b593
	or a			;b596
	ret z			;b597
	ld a,(0dfd9h)		;b598
	or a			;b59b
	ret z			;b59c
	ld a,(0dfdeh)		;b59d   ; la fila de 0xDFDE...
	dec a			;b5a0
	add a,a			;b5a1
	add a,0e8h		;b5a2   ; ...+ 0xE8...
	ld c,a			;b5a4
	ld a,(0dfdfh)		;b5a5   ; ...+ 0xDFDF: la Y de origen
	add a,c			;b5a8
	ld l,a			;b5a9
	ld h,000h		;b5aa
	ld d,001h		;b5ac   ; de la pagina 0 a la 1 (D = 1)...
	ld e,0feh		;b5ae   ; ...a Y = 0xFE...
	ld a,007h		;b5b0   ; ...7 lineas
	jp 047abh		;b5b2   ; copia_en_y: orden YMMM del VDP
dibuja_el_de_dfd8:		; el de 0xDFD8: sprites 22-25 (0xDC58), patrones desde 0xE0, colores de p08:BB7F y p08:BB9E
	ld a,(0dfd8h)		;b5b5
	or a			;b5b8
	ret z			;b5b9
	ld de,0dc58h		;b5ba
	ld a,(0dfd9h)		;b5bd
	or a			;b5c0
	jr z,esconde_4_sprites		;b5c1
	call sprites_del_de_dfd8		;b5c3   ; sprites_del_de_dfd8: por debajo de Y = 0xC0, fuera
	ld de,0bb7fh		;b5c6
	ld hl,0db60h		;b5c9
	call 06fd5h		;b5cc   ; rachas_a_ram_de_8: las rachas de DE (banco 8) en HL
	ld de,0bb9eh		;b5cf
	ld hl,0db80h		;b5d2
	jp 06fd5h		;b5d5   ; rachas_a_ram_de_8: las rachas de DE (banco 8) en HL
sprites_del_de_dfd8:		; por debajo de Y = 0xC0, fuera
	ld a,(0dfdbh)		;b5d8
	cp 0c0h		;b5db
	jp nc,esconde_4_sprites		;b5dd   ; esconde_4_sprites: los 4 sprites de DE fuera (Y = 0xE0)
	ex de,hl			;b5e0
	ld a,(0dfdbh)		;b5e1
	sub 020h		;b5e4
	ld e,a			;b5e6
	ld a,(0dfddh)		;b5e7
	sub 008h		;b5ea
	ld d,a			;b5ec
	ld c,0e0h		;b5ed
	call 05d41h		;b5ef   ; pon_sprite: [E][D][C] en (HL): la Y, la X y el patron de un sprite de 0xDC00
	call 05d3dh		;b5f2   ; pon_sprite_mas_4: p00:5D41 con el patron C + 4
	ld a,e			;b5f5
	add a,010h		;b5f6
	ld e,a			;b5f8
	call 05d3dh		;b5f9   ; pon_sprite_mas_4: p00:5D41 con el patron C + 4
	jp 05d3dh		;b5fc   ; pon_sprite_mas_4: p00:5D41 con el patron C + 4
ventana_4c:		; la ventana del mensaje en Y = 0x4C
	ld l,04ch		;b5ff
	jr guarda_lo_de_la_ventana		;b601
ventana_0c:		; la ventana del mensaje en Y = 0x0C
	ld l,00ch		;b603
	jr guarda_lo_de_la_ventana		;b605
ventana_segun_snake:		; la ventana arriba (Y = 0x1C) con Snake abajo; si no, abajo (Y = 0x7C)
	ld a,(0cb03h)		;b607   ; lee la Y de Snake
	cp 080h		;b60a
	ld l,01ch		;b60c
	jr nc,guarda_lo_de_la_ventana		;b60e
ventana_7c:		; la ventana del mensaje en Y = 0x7C
	ld l,07ch		;b610
guarda_lo_de_la_ventana:		; 0xCAA1-0xCAA2 = (Y, X = 4) y guarda lo que tapa la ventana en Y = 0xD8 de la misma pagina
	ld h,004h		;b612
	ld a,l			;b614
	ld (0caa1h),a		;b615   ; guarda la Y y la X de la ventana del mensaje (16 bits)
	ld a,h			;b618
	ld (0caa2h),a		;b619
	ld de,000d8h		;b61c
	call tamano_de_ventana		;b61f   ; el tamano (p03:B633)
	ld a,(0ca1ch)		;b622   ; con la pantalla partida, mas el desplazamiento
	and a			;b625
	jr z,L_B62D		;b626
	ld a,(0d8a5h)		;b628
	add a,e			;b62b
	ld e,a			;b62c
L_B62D:
	ld a,(0ca42h)		;b62d   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	jp 04767h		;b630   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
tamano_de_ventana:		; BC = 0xB8 x 0x28 con 0xD8A8, si no 0xE0 x 0x28
	ld a,(0d8a8h)		;b633   ; lee 1: la ventana del mensaje es estrecha (0xB8 x 0x28)
	and a			;b636
	ld bc,0b828h		;b637
	ret nz			;b63a
	ld b,0e0h		;b63b
	ret			;b63d
quita_la_ventana:		; lo guardado en Y = 0xD8 otra vez en su sitio, y 0xD8A8 = 0
	ld hl,0caa1h		;b63e   ; apunta a la Y y la X de la ventana del mensaje (16 bits)
	ld e,(hl)			;b641
	inc hl			;b642
	ld d,(hl)			;b643
	ld hl,000d8h		;b644
	call tamano_de_ventana		;b647   ; tamano_de_ventana: BC = 0xB8 x 0x28 con 0xD8A8, si no 0xE0 x 0x28
	ld a,(0ca1ch)		;b64a   ; lee 1: la pantalla partida en la linea 0xB4 (arriba con desplazamiento, abajo la pagina 1 sin sprites)
	and a			;b64d
	jr z,L_B655		;b64e
	ld a,(0d8a5h)		;b650
	add a,l			;b653
	ld l,a			;b654
L_B655:
	call copia_en_esta		;b655   ; copia_en_esta: HMMM de la pagina de dibujar a si misma
	xor a			;b658
	ld (0d8a8h),a		;b659   ; guarda 1: la ventana del mensaje es estrecha (0xB8 x 0x28)
	ret			;b65c
ventana_de_bed8:		; la ventana a 0 y el rectangulo de X = 0xBE..., Y = 0xD8, 0x22 x 0x28 encima
	ld hl,0caa1h		;b65d   ; apunta a la Y y la X de la ventana del mensaje (16 bits)
	ld e,(hl)			;b660
	inc hl			;b661
	ld d,(hl)			;b662
	push de			;b663
	ld h,d			;b664
	ld l,e			;b665
	ld bc,0c028h		;b666
	call 046fah		;b669   ; borra_bloque_pagina_0: p00:46FF con A = 0 en la pagina en la que se dibuja
	pop de			;b66c
	ld hl,0bed8h		;b66d
	ld d,0c2h		;b670
	ld bc,02228h		;b672
copia_en_esta:		; HMMM de la pagina de dibujar a si misma
	ld a,(0ca42h)		;b675   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	rlca			;b678
	rlca			;b679
	jp 04767h		;b67a   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
barrido_2:		; 0xE270 = 2: el barrido de la otra pagina desde (E, D), de 4 en 4
	xor a			;b67d
	ld hl,0e270h		;b67e   ; apunta a el barrido: 1 por pasos, 2 de 4 en 4 (0 nada)
	ld (hl),002h		;b681   ; el barrido 2
	inc l			;b683
	ld (hl),e			;b684   ; desde E...
	inc l			;b685
	ld (hl),d			;b686   ; ...y D
	inc l			;b687
	ld (hl),a			;b688   ; lo demas a cero
	inc l			;b689
	ld (hl),a			;b68a
	inc l			;b68b
	ld (hl),a			;b68c
	ret			;b68d
barrido_1:		; 0xE270 = 1: el barrido por pasos desde (E, D)
	ld hl,0e270h		;b68e   ; apunta a el barrido: 1 por pasos, 2 de 4 en 4 (0 nada)
	ld (hl),001h		;b691
	inc l			;b693
	ld c,e			;b694
	call medidas_del_barrido		;b695   ; medidas_del_barrido: el paso y la cuenta para un lado (p03:B6AB)
	inc l			;b698
	ld c,d			;b699
medidas_del_barrido:		; el paso y la cuenta para un lado (p03:B6AB)
	call paso_del_barrido		;b69a   ; paso_del_barrido: A = cuantas veces cabe el lado corto en el largo (0xC0 - C o C)
	ld (hl),a			;b69d   ; los dos lados de este eje
	inc l			;b69e
	ld (hl),a			;b69f
	inc l			;b6a0
	ld (hl),000h		;b6a1   ; 0
	inc l			;b6a3
	ld (hl),b			;b6a4   ; la cuenta B en los dos
	inc l			;b6a5
	ld (hl),b			;b6a6
	inc l			;b6a7
	ld (hl),0c0h		;b6a8   ; 0xC0
	ret			;b6aa
paso_del_barrido:		; A = cuantas veces cabe el lado corto en el largo (0xC0 - C o C)
	ld a,0c0h		;b6ab
	sub c			;b6ad
	cp c			;b6ae
	jr nc,L_B6BA		;b6af
	ld b,a			;b6b1
	ld a,c			;b6b2
	ld c,b			;b6b3
	call divide		;b6b4   ; divide: B = A / C (restando)
	ld a,001h		;b6b7
	ret			;b6b9
L_B6BA:
	call divide		;b6ba   ; divide: B = A / C (restando)
	ld a,b			;b6bd
	ld b,001h		;b6be
	ret			;b6c0
divide:		; B = A / C (restando)
	ld b,000h		;b6c1
L_B6C3:
	inc b			;b6c3
	sub c			;b6c4
	jr nz,L_B6C3		;b6c5
	ret			;b6c7
barrido_cada_cuadro:		; el barrido de 0xE270: 1 por pasos (p03:B7A1), 2 de 4 en 4 con franjas de la otra pagina
	ld a,(0e270h)		;b6c8   ; lee el barrido: 1 por pasos, 2 de 4 en 4 (0 nada)
	dec a			;b6cb
	jp z,barrido_por_pasos		;b6cc   ; barrido_por_pasos: los cuatro lados con su cuenta; al acabar, fuera
	ld a,(0e274h)		;b6cf   ; los cuatro lados acabados: fuera
	ld hl,0e275h		;b6d2
	and (hl)			;b6d5
	cp 003h		;b6d6
	jp z,L_B7DC		;b6d8
	ld hl,0e273h		;b6db   ; 4 mas cada cuadro, hasta 0xC0
	ld a,(hl)			;b6de
	add a,004h		;b6df
	ld (hl),a			;b6e1
	cp 0c0h		;b6e2
	jr c,L_B6E8		;b6e4
	ld (hl),0c0h		;b6e6
L_B6E8:
	call lado_de_arriba		;b6e8   ; los bordes avanzan (p03:B779, p03:B78D)
	call lado_izquierdo		;b6eb   ; lado_izquierdo: el lado izquierdo 2 a la izquierda; al llegar a 0, acabado
	ld hl,0e271h		;b6ee   ; DE = el sitio
	ld e,(hl)			;b6f1   ; E = el lado de arriba
	inc hl			;b6f2
	ld d,(hl)			;b6f3   ; D = el izquierdo
	push de			;b6f4
	ld a,(0e274h)		;b6f5   ; los cuatro lados que no han llegado
	bit 0,a		;b6f8   ; el de arriba, si no ha llegado
	call z,franja_vertical		;b6fa   ; franja_vertical: una franja de 2 de ancho, sin pasar de 0xC0
	pop de			;b6fd
	push de			;b6fe
	ld a,(0e274h)		;b6ff   ; el de abajo
	bit 1,a		;b702   ; el de abajo, si no ha llegado
	call z,lado_de_abajo		;b704   ; lado_de_abajo: el lado de abajo baja; al llegar a 0xBE, acabado
	pop de			;b707
	push de			;b708
	ld a,(0e275h)		;b709   ; el izquierdo
	bit 0,a		;b70c   ; el izquierdo, si no ha llegado
	call z,franja_horizontal		;b70e   ; franja_horizontal: una franja de 2 de alto, sin pasar de 0xC0
	pop de			;b711
	ld a,(0e275h)		;b712   ; el derecho
	bit 1,a		;b715   ; el derecho, si no ha llegado
	ret nz			;b717
	jr lado_derecho		;b718
franja_vertical:		; una franja de 2 de ancho, sin pasar de 0xC0
	ld h,d			;b71a   ; HL = (D, E)
	ld l,e			;b71b
	ld a,(0e273h)		;b71c   ; lo largo...
	ld b,a			;b71f
	add a,h			;b720   ; ...sin pasar de 0xC0
	jr c,L_B727		;b721
	cp 0c0h		;b723
	jr c,L_B72B		;b725
L_B727:
	ld a,0c0h		;b727
	sub h			;b729
	ld b,a			;b72a
L_B72B:
	ld c,002h		;b72b
	jr L_B75C		;b72d
lado_de_abajo:		; el lado de abajo baja; al llegar a 0xBE, acabado
	ld a,(0e273h)		;b72f   ; el lado de abajo: E + lo largo - 2
	add a,e			;b732
	sub 002h		;b733
	cp 0beh		;b735   ; al llegar a 0xBE...
	jr c,L_B743		;b737
	ld a,(0e274h)		;b739   ; ...el bit 1 de 0xE274: acabado
	or 002h		;b73c
	ld (0e274h),a		;b73e
	ld a,0beh		;b741
L_B743:
	ld e,a			;b743
	cp 0c0h		;b744
	ret nc			;b746
	jr franja_vertical		;b747
franja_horizontal:		; una franja de 2 de alto, sin pasar de 0xC0
	ld h,d			;b749   ; HL = (D, E)
	ld l,e			;b74a
	ld a,(0e273h)		;b74b   ; lo largo...
	ld c,a			;b74e
	add a,l			;b74f   ; ...sin pasar de 0xC0
	jr c,L_B756		;b750
	cp 0c1h		;b752
	jr c,L_B75A		;b754
L_B756:
	ld a,0c0h		;b756
	sub l			;b758
	ld c,a			;b759
L_B75A:
	ld b,002h		;b75a
L_B75C:
	jp 0475ah		;b75c   ; copia_rectangulo_a_la_otra: p00:4767 de la pagina 0xCA42 a la otra
lado_derecho:		; el lado derecho avanza; al llegar a 0xBE, acabado
	ld a,(0e273h)		;b75f   ; el lado derecho: D + lo largo - 2
	add a,d			;b762
	sub 002h		;b763
	cp 0beh		;b765   ; al llegar a 0xBE...
	jr c,L_B773		;b767
	ld a,(0e275h)		;b769   ; ...el bit 1 de 0xE275: acabado
	or 002h		;b76c
	ld (0e275h),a		;b76e
	ld a,0beh		;b771
L_B773:
	ld d,a			;b773
	cp 0c0h		;b774
	ret nc			;b776
	jr franja_horizontal		;b777
lado_de_arriba:		; el lado de arriba sube 2; al llegar a 0, acabado
	ld a,(0e271h)		;b779   ; el de arriba, 2 menos
	sub 002h		;b77c
	jr nc,L_B789		;b77e
	ld a,(0e274h)		;b780   ; al llegar a 0, el bit 0 de 0xE274: acabado
	or 001h		;b783
	ld (0e274h),a		;b785
	xor a			;b788
L_B789:
	ld (0e271h),a		;b789
	ret			;b78c
lado_izquierdo:		; el lado izquierdo 2 a la izquierda; al llegar a 0, acabado
	ld a,(0e272h)		;b78d   ; el izquierdo, 2 menos
	sub 002h		;b790
	jr nc,L_B79D		;b792
	ld a,(0e275h)		;b794   ; al llegar a 0, el bit 0 de 0xE275: acabado
	or 001h		;b797
	ld (0e275h),a		;b799
	xor a			;b79c
L_B79D:
	ld (0e272h),a		;b79d
	ret			;b7a0
barrido_por_pasos:		; los cuatro lados con su cuenta; al acabar, fuera
	ld hl,0e271h		;b7a1   ; el lado de arriba: + 2...
	ld b,002h		;b7a4
	call cuenta_de_lado		;b7a6   ; cuenta_de_lado: la cuenta del lado; a cero, otra vez y el lado avanza B (acarreo)
	call c,lado_de_arriba_por_pasos		;b7a9   ; lado_de_arriba_por_pasos: una franja de 0xC0 x 2 a 0 en la Y del lado - 2
	ld hl,0e274h		;b7ac   ; ...el de abajo: - 2...
	ld b,0feh		;b7af
	call cuenta_de_lado		;b7b1   ; cuenta_de_lado: la cuenta del lado; a cero, otra vez y el lado avanza B (acarreo)
	call c,lado_de_abajo_por_pasos		;b7b4   ; lado_de_abajo_por_pasos:
	ld hl,0e277h		;b7b7   ; ...el izquierdo: + 2...
	ld b,002h		;b7ba
	call cuenta_de_lado		;b7bc   ; cuenta_de_lado: la cuenta del lado; a cero, otra vez y el lado avanza B (acarreo)
	call c,lado_izquierdo_por_pasos		;b7bf   ; lado_izquierdo_por_pasos: una franja de 2 x 0xC0 a 0 en la X del lado - 2
	ld hl,0e27ah		;b7c2   ; ...el derecho: - 2
	ld b,0feh		;b7c5
	call cuenta_de_lado		;b7c7   ; cuenta_de_lado: la cuenta del lado; a cero, otra vez y el lado avanza B (acarreo)
	call c,lado_derecho_por_pasos		;b7ca   ; lado_derecho_por_pasos:
	ld a,(0e276h)		;b7cd   ; lo que queda entre los lados...
	ld b,a			;b7d0
	ld a,0c0h		;b7d1
	sub b			;b7d3
	ld b,a			;b7d4
	ld a,(0e273h)		;b7d5
	add a,b			;b7d8
	cp 0c0h		;b7d9   ; ...por debajo de 0xC0, sigue
	ret c			;b7db
L_B7DC:
	xor a			;b7dc
	ld (0e270h),a		;b7dd   ; guarda el barrido: 1 por pasos, 2 de 4 en 4 (0 nada)
	ret			;b7e0
cuenta_de_lado:		; la cuenta del lado; a cero, otra vez y el lado avanza B (acarreo)
	or a			;b7e1
	dec (hl)			;b7e2   ; la cuenta...
	ret nz			;b7e3   ; ...sigue
	ld d,h			;b7e4   ; a cero: otra vez la del byte siguiente...
	ld e,l			;b7e5
	inc l			;b7e6
	ldi		;b7e7
	ld a,(hl)			;b7e9   ; ...y el lado + B
	add a,b			;b7ea
	ld (hl),a			;b7eb
	scf			;b7ec
	ret			;b7ed
lado_de_arriba_por_pasos:		; una franja de 0xC0 x 2 a 0 en la Y del lado - 2
	call lado_menos_2		;b7ee   ; lado_menos_2: A = (HL) - 2
	ld l,a			;b7f1
L_B7F2:
	ld h,000h		;b7f2
	ld bc,0c002h		;b7f4
	jr franja_a_0		;b7f7
lado_de_abajo_por_pasos:
	ld l,(hl)			;b7f9
	jr L_B7F2		;b7fa
lado_izquierdo_por_pasos:		; una franja de 2 x 0xC0 a 0 en la X del lado - 2
	call lado_menos_2		;b7fc   ; lado_menos_2: A = (HL) - 2
	ld l,000h		;b7ff
	ld h,a			;b801
	ld bc,002c0h		;b802
	jr franja_a_0		;b805
lado_menos_2:		; A = (HL) - 2
	ld a,(hl)			;b807
	dec a			;b808
	dec a			;b809
	ret			;b80a
lado_derecho_por_pasos:
	ld h,(hl)			;b80b
	ld l,000h		;b80c
	ld bc,002c0h		;b80e
franja_a_0:		; BC puntos a 0 en HL de la pagina de dibujar
	jp 046fah		;b811   ; borra_bloque_pagina_0: p00:46FF con A = 0 en la pagina en la que se dibuja
pon_mosaico_de_quien_habla:		; la ficha B de 0xE260 (8 bytes) con el mosaico A (6 x 4 de p44:93FD) en DE; el 4 quita el bit 1 de 0xD7D2
	cp 004h		;b814
	jr nz,L_B81D		;b816
	ld hl,0d7d2h		;b818
	res 1,(hl)		;b81b
L_B81D:
	inc a			;b81d   ; [A + 1]...
	ld c,a			;b81e
	ld a,b			;b81f
	rlca			;b820
	rlca			;b821
	rlca			;b822
	ld hl,0e260h		;b823   ; apunta a dos fichas de 8 bytes de los mosaicos de quien habla
	call 0423eh		;b826   ; suma_a_hl: HL = HL + A
	ld (hl),c			;b829
	ld b,000h		;b82a   ; ...con 0xCAD0 y D desde 0x60, B = 1 (se abre poco a poco)...
	ld a,(0cad0h)		;b82c
	or a			;b82f
	jr z,L_B838		;b830
	ld a,d			;b832
	cp 060h		;b833
	jr c,L_B838		;b835
	inc b			;b837
L_B838:
	inc l			;b838   ; ...[B][E][D][0][0][0][0]
	ld (hl),b			;b839   ; [B]: 1 si se abre poco a poco
	push bc			;b83a   ; la ficha:
	inc l			;b83b
	ld (hl),e			;b83c   ; [E]
	inc l			;b83d
	ld (hl),d			;b83e   ; [D]
	inc l			;b83f
	xor a			;b840
	ld (hl),a			;b841   ; el resto a cero
	inc l			;b842
	ld (hl),a			;b843
	inc l			;b844
	ld (hl),a			;b845
	inc l			;b846
	ld (hl),a			;b847
	pop bc			;b848   ; B = como se abre
	ld a,b			;b849   ; abriendose: 0xCAD1 = 4, 0xCAD2 = 0, 0xCAD3 = E, 0xCAD4 = E + 0x2E, 0xCAD5 = D, 0xCAD6 = 0
	or a			;b84a   ; 0: de golpe
	jr z,L_B861		;b84b
	ld hl,0cad1h		;b84d   ; 4 cuadros
	ld (hl),004h		;b850   ; cada 4 cuadros
	inc l			;b852
	ld (hl),000h		;b853   ; 0 lineas
	inc l			;b855
	ld (hl),e			;b856   ; la Y de arriba...
	ld a,e			;b857   ; la de abajo...
	add a,02eh		;b858   ; ...y la de abajo, 0x2E mas
	inc l			;b85a
	ld (hl),a			;b85b   ; ...a 0xCAD4
	inc l			;b85c
	ld (hl),d			;b85d   ; la X
	inc l			;b85e
	ld (hl),000h		;b85f   ; 0xCAD6 = 0
L_B861:
	ld a,c			;b861   ; el mosaico A - 1 en DE
	dec a			;b862
	jp 070aeh		;b863   ; mosaico_de_93fd: el mosaico A de p44:93FD (6 x 4) en DE; 0xD8E3 = B elige la forma
quita_mosaico_de_quien_habla:		; la ficha A de 0xE260 libre y su sitio (0x20 x 0x30) a 0
	rlca			;b866   ; la ficha A...
	rlca			;b867
	rlca			;b868
	ld hl,0e260h		;b869   ; apunta a dos fichas de 8 bytes de los mosaicos de quien habla
	call 0423eh		;b86c   ; suma_a_hl: HL = HL + A
	ld a,(hl)			;b86f   ; ...libre ya: nada
	or a			;b870
	ret z			;b871
	xor a			;b872
	ld (hl),a			;b873   ; libre
	inc l			;b874
	inc l			;b875
	ld e,(hl)			;b876   ; su sitio
	inc l			;b877
	ld d,(hl)			;b878
	ld h,d			;b879
	ld l,e			;b87a
	ld bc,02030h		;b87b   ; 0x20 x 0x30
	ld a,(0e040h)		;b87e   ; con 0xE040, solo en la pagina de dibujar
	or a			;b881   ; con 0xE040...
	jr z,L_B887		;b882
	jp 046fah		;b884   ; borra_bloque_pagina_0: p00:46FF con A = 0 en la pagina en la que se dibuja
L_B887:
	ld a,(0ca01h)		;b887   ; fuera del paso 4, con 0xD8AA o 0xD8A9 no se borra
	cp 004h		;b88a
	jr z,L_B898		;b88c
	ld a,(0d8aah)		;b88e
	or a			;b891
	ret nz			;b892
	ld a,(0d8a9h)		;b893
	or a			;b896
	ret nz			;b897
L_B898:
	xor a			;b898   ; en la pagina 0...
	ld d,a			;b899
	push bc			;b89a
	push hl			;b89b
	call 046ffh		;b89c   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
	pop hl			;b89f
	pop bc			;b8a0
	ld a,(0ca2ch)		;b8a1   ; ...y, sin 0xCA2C, en la 1
	or a			;b8a4
	ret nz			;b8a5
	xor a			;b8a6
	ld d,001h		;b8a7
	jp 046ffh		;b8a9   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
mosaicos_de_quien_habla:		; cada 8 cuadros, 0xCAB9 uno mas
	ld a,(0ca03h)		;b8ac   ; lee el contador de cuadros (uno mas en cada interrupcion)
	and 007h		;b8af
	jr nz,L_B8B7		;b8b1
	ld hl,0cab9h		;b8b3
	inc (hl)			;b8b6
L_B8B7:
	ld hl,0e260h		;b8b7   ; las dos fichas de 0xE260
	ld b,002h		;b8ba
L_B8BC:
	ld a,(hl)			;b8bc   ; libre?
	or a			;b8bd
	push hl			;b8be
	push bc			;b8bf
	call nz,mosaico_de_quien_habla		;b8c0   ; mosaico_de_quien_habla: por su byte 1: 1 se abre (p03:B8E8), 2 se cierra (p03:B94C), los demas se pinta
	pop bc			;b8c3
	pop hl			;b8c4
	ld de,00008h		;b8c5   ; la siguiente, 8 bytes mas alla
	add hl,de			;b8c8
	djnz L_B8BC		;b8c9
	ret			;b8cb
mosaico_de_quien_habla:		; por su byte 1: 1 se abre (p03:B8E8), 2 se cierra (p03:B94C), los demas se pinta
	inc hl			;b8cc   ; el byte 1
	ld a,(hl)			;b8cd
	dec a			;b8ce
	jr z,se_abre		;b8cf   ; 1: se abre
	dec a			;b8d1   ; 2: se cierra
	jp z,se_cierra		;b8d2   ; se_cierra: cada 1 o 2 cuadros, dos lineas a 0, 12 veces
	dec hl			;b8d5
	ld a,(hl)			;b8d6   ; el byte 0: el mosaico
	push af			;b8d7
	push hl			;b8d8
	call dibujo_de_quien_habla		;b8d9   ; el dibujo segun quien habla (p03:B9A0)...
	pop hl			;b8dc
	pop bc			;b8dd
	push bc			;b8de
	push hl			;b8df
	call pinta_mosaico_de_quien_habla		;b8e0   ; ...el mosaico (p03:B9DE)...
	pop hl			;b8e3
	pop af			;b8e4
	jp encima_del_mosaico		;b8e5   ; ...y lo de encima (p03:BA39)
se_abre:		; cada 1 o 2 cuadros (0xCAD1), dos lineas de la otra pagina...
	ld d,h			;b8e8   ; DE = la ficha
	ld e,l			;b8e9
	ld hl,0cad1h		;b8ea   ; la espera de 0xCAD1
	dec (hl)			;b8ed
	ret nz			;b8ee
	ld a,(0cad6h)		;b8ef   ; 1 o 2 cuadros
	xor 001h		;b8f2
	inc a			;b8f4
	ld (hl),a			;b8f5
	push de			;b8f6   ; dos lineas de la otra pagina
	call dos_lineas_de_la_otra		;b8f7   ; dos_lineas_de_la_otra: las lineas E y A de 0x20 de ancho en X = D, de la otra pagina a esta
	pop de			;b8fa
	ld hl,0cad2h		;b8fb   ; ...12 veces
	inc (hl)			;b8fe   ; una vez mas...
	ld a,(hl)			;b8ff
	cp 00ch		;b900   ; ...de 12
	jr nc,L_B906		;b902
	jr L_B968		;b904   ; las lineas, 4 mas lejos
L_B906:
	ld hl,0cad6h		;b906   ; abierto con 0xCAD6: 0xCAD0 = 0 y se cierra (2) en Y 0x18-0x46 y X = 0x90
	ld a,(hl)			;b909   ; 0xCAD6...
	or a			;b90a   ; 0xCAD6 = 0: otra vez
	jr z,L_B924		;b90b
	xor a			;b90d   ; abierto del todo: 0xCAD0 = 0, la ficha libre...
	ld hl,0cad0h		;b90e
	ld (hl),a			;b911
	ld (de),a			;b912   ; la ficha libre
	inc l			;b913
	ld (hl),002h		;b914   ; ...se cierra...
	inc l			;b916
	ld (hl),a			;b917
	inc l			;b918
	ld (hl),018h		;b919   ; ...desde Y = 0x18...
	inc l			;b91b
	ld (hl),046h		;b91c   ; ...y 0x46...
	inc l			;b91e
	ld (hl),090h		;b91f   ; ...en X = 0x90
	inc l			;b921
	ld (hl),a			;b922
	ret			;b923
L_B924:
	inc (hl)			;b924   ; 0xCAD6 = 1...
	dec l			;b925
	ld (hl),090h		;b926   ; ...en X = 0x90...
	dec l			;b928
	ld (hl),047h		;b929   ; ...Y = 0x47...
	dec l			;b92b
	ld (hl),019h		;b92c   ; ...y 0x19...
	dec l			;b92e
	ld (hl),000h		;b92f
	dec l			;b931
	ld (hl),001h		;b932   ; ...y se abre otra vez
	ret			;b934
dos_lineas_de_la_otra:		; las lineas E y A de 0x20 de ancho en X = D, de la otra pagina a esta
	inc l			;b935
	inc l			;b936
	ld e,(hl)			;b937   ; E = la Y de arriba
	inc l			;b938
	ld a,(hl)			;b939   ; la de abajo
	inc l			;b93a
	ld d,(hl)			;b93b   ; D = la X
	push af			;b93c
	push de			;b93d
	call L_B944		;b93e   ; la de arriba...
	pop de			;b941
	pop af			;b942
	ld e,a			;b943   ; ...y la de abajo
L_B944:
	ld l,e			;b944
	ld h,d			;b945
	ld bc,02001h		;b946
	jp 0475ah		;b949   ; copia_rectangulo_a_la_otra: p00:4767 de la pagina 0xCA42 a la otra
se_cierra:		; cada 1 o 2 cuadros, dos lineas a 0, 12 veces
	ld d,h			;b94c   ; DE = la ficha
	ld e,l			;b94d
	ld hl,0cad1h		;b94e   ; la espera de 0xCAD1
	dec (hl)			;b951   ; cada 1 o 2 cuadros
	ret nz			;b952
	ld a,(0cad6h)		;b953   ; 1 o 2 cuadros, alternando
	xor 001h		;b956
	inc a			;b958
	ld (hl),a			;b959
	push de			;b95a
	call dos_lineas_a_0		;b95b   ; dos_lineas_a_0: las lineas de 0x20 de ancho a 0 en la pagina de dibujar
	pop de			;b95e
	ld hl,0cad2h		;b95f   ; 12 veces
	inc (hl)			;b962   ; una vez mas...
	ld a,(hl)			;b963
	cp 00ch		;b964   ; ...de 12
	jr nc,L_B973		;b966
L_B968:
	inc l			;b968   ; las dos lineas, 4 mas cerca
	ld a,(hl)			;b969
	add a,004h		;b96a
	ld (hl),a			;b96c
	inc l			;b96d
	ld a,(hl)			;b96e
	sub 004h		;b96f
	ld (hl),a			;b971
	ret			;b972
L_B973:
	ld hl,0cad6h		;b973   ; cerrado con 0xCAD6: fuera y quita el mosaico 1
	ld a,(hl)			;b976
	or a			;b977
	jr z,L_B924		;b978
	xor a			;b97a
	ld hl,0cad0h		;b97b
	ld (hl),a			;b97e
	ld (de),a			;b97f
	ld a,001h		;b980
	jp quita_mosaico_de_quien_habla		;b982   ; quita_mosaico_de_quien_habla: la ficha A de 0xE260 libre y su sitio (0x20 x 0x30) a 0
dos_lineas_a_0:		; las lineas de 0x20 de ancho a 0 en la pagina de dibujar
	inc l			;b985
	inc l			;b986
	ld a,(hl)			;b987   ; L = la Y de arriba
	inc l			;b988
	ld d,(hl)			;b989   ; D = la de abajo
	inc l			;b98a
	ld h,(hl)			;b98b   ; H = la X
	ld l,a			;b98c
	push de			;b98d
	push hl			;b98e
	call L_B995		;b98f   ; la de arriba...
	pop hl			;b992
	pop de			;b993
	ld l,d			;b994   ; ...y la de abajo
L_B995:
	ld a,(0ca42h)		;b995   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	ld d,a			;b998
	xor a			;b999
	ld bc,02001h		;b99a
	jp 046ffh		;b99d   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
dibujo_de_quien_habla:		; B = el dibujo segun quien habla (0xCAA3 en la lista de p03:B9CE; 0 si no esta); con 0xE040 = 3 y 0xE255, 8 o 0x0C
	ld a,(0e040h)		;b9a0   ; con 0xE040 = 3...
	cp 003h		;b9a3
	jr nz,L_B9B8		;b9a5
	ld a,(0e255h)		;b9a7   ; ...y 0xE255...
	or a			;b9aa
	jr z,L_B9B8		;b9ab
	ld a,(0caa3h)		;b9ad   ; ...quien habla: el 0x7C, 0x0C; los demas, 8
	cp 07ch		;b9b0
	ld a,00ch		;b9b2
	ret z			;b9b4
	ld a,008h		;b9b5
	ret			;b9b7
L_B9B8:
	ld a,(0caa3h)		;b9b8
	ld b,000h		;b9bb
	ld hl,0b9ceh		;b9bd
L_B9C0:
	cp (hl)			;b9c0   ; es este?
	jr z,L_B9CB		;b9c1
	inc b			;b9c3   ; el siguiente, hasta 16
	inc hl			;b9c4
	bit 4,b		;b9c5
	jr z,L_B9C0		;b9c7
	ld b,000h		;b9c9   ; no esta: 0
L_B9CB:
	ld a,b			;b9cb
	inc a			;b9cc
	ret			;b9cd

; ----------------------------------------------------------------------
; DATOS resto_B9CE: lo apuntan con el banco puesto p03:B9BD (0xB9CE); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p03:B9BD (16 bytes)
;   0xb9ce..0xb9de  (16 bytes)
DATA_resto_B9CE:
	defb 076h,077h,079h,07ah,078h,07bh,07eh,07dh,07fh,07ch,0d4h,0dbh,0deh,000h,000h,000h	; b9ce  vwyzx{~}.|......

; ======================================================================
; CODIGO 0xb9de..0xbae8  (266 bytes)
; ======================================================================


pinta_mosaico_de_quien_habla:		; con B = 0, nada; si el dibujo no es el de quien habla, caracter a caracter
	ld e,a			;b9de   ; E = el dibujo
	ld a,b			;b9df   ; B = el de quien habla; 0: nada
	or a			;b9e0
	ret z			;b9e1
	ld a,e			;b9e2
	ld e,000h		;b9e3
	cp b			;b9e5   ; el mismo: con ldir; si no, caracter a caracter
	jr z,L_B9EA		;b9e6
	ld e,001h		;b9e8
L_B9EA:
	ld a,e			;b9ea   ; 0xD8E2 = 0 o 1
	ld (0d8e2h),a		;b9eb   ; guarda 0: p01:62B5 copia con ldir; 1: caracter a caracter
	ld a,b			;b9ee   ; el dibujo - 1
	dec a			;b9ef
	push af			;b9f0
	inc hl			;b9f1
	inc hl			;b9f2
	ld e,(hl)			;b9f3   ; DE = el sitio
	inc l			;b9f4
	ld d,(hl)			;b9f5
	ld hl,09535h		;b9f6   ; el rectangulo de p44:9535
	call 06302h		;b9f9   ; rectangulo_de_44: la ficha A de la tabla de HL en el banco 44-45: [dy][dx][filas][columnas][caracteres]
	pop af			;b9fc
	push bc			;b9fd   ; con 0xCB21 = 1...
	ld b,a			;b9fe
	ld a,(0cb21h)		;b9ff   ; con 0xCB21 = 1 y el dibujo 0, el 2
	dec a			;ba02
	ld a,b			;ba03
	ld b,000h		;ba04
	jr nz,L_BA0D		;ba06
	or a			;ba08   ; ...y el dibujo 0...
	jr nz,L_BA0D		;ba09
	ld b,002h		;ba0b   ; ...el 2
L_BA0D:
	ld a,(0d8e2h)		;ba0d   ; caracter a caracter: el dibujo 0
	or a			;ba10
	ld a,000h		;ba11
	jr nz,L_BA34		;ba13
	ld a,(0e221h)		;ba15   ; sin el mensaje en el paso 0: el dibujo 0
	or a			;ba18
	ld a,000h		;ba19
	jr nz,L_BA34		;ba1b
	ld a,(0caa3h)		;ba1d   ; nadie habla: el dibujo 0
	or a			;ba20
	jr z,L_BA34		;ba21
	ld a,(0e228h)		;ba23   ; hasta la X 0x40 del texto...
	cp 040h		;ba26
	jr nc,L_BA2D		;ba28
	xor a			;ba2a   ; ...el dibujo 0
	jr L_BA34		;ba2b
L_BA2D:
	ld a,(0ca03h)		;ba2d   ; ...cambia cada 4 cuadros
	rra			;ba30
	rra			;ba31
	and 001h		;ba32
L_BA34:
	add a,b			;ba34
	pop bc			;ba35
	jp 070e4h		;ba36   ; el mosaico de p44
encima_del_mosaico:		; lo de encima: p06:A543 y el rectangulo A - 1 de p44:9611
	inc hl			;ba39
	inc hl			;ba3a
	ld e,(hl)			;ba3b
	inc l			;ba3c
	ld d,(hl)			;ba3d
	dec a			;ba3e
	ld (0d8e7h),a		;ba3f
	call 064d4h		;ba42   ; a_p06_a543: p06:A543 con el banco 6 en 0xA000
	push af			;ba45
	ld hl,09611h		;ba46
	ld a,(0d8e7h)		;ba49
	call 06302h		;ba4c   ; rectangulo_de_44: la ficha A de la tabla de HL en el banco 44-45: [dy][dx][filas][columnas][caracteres]
	pop af			;ba4f
	jp 070e4h		;ba50   ; mosaico_de_tabla_44: el mosaico A de la tabla de HL del banco 44 con la forma de 0xD8E3 = 0
al_entrar_en_la_sala:		; 0xE1E8 = 0xDFF0 = 0; fuera del agua, sin la barra de la derecha
	xor a			;ba53
	ld (0e1e8h),a		;ba54   ; guarda 1 mientras hay una llamada
	ld (0dff0h),a		;ba57   ; guarda 1 mientras corre la tercera barra
	ld a,(0cb3fh)		;ba5a   ; lee en la zona 6, lo que hay bajo Snake: 1 con los caracteres 0x90-0xB3, 2 con 0xB8-0xDB (3 con 0xCAAA)
	or a			;ba5d
	jr nz,L_BA64		;ba5e
	xor a			;ba60
	ld (0cae2h),a		;ba61   ; guarda 1 mientras se ve la barra de la derecha
L_BA64:
	ld a,(0ca76h)		;ba64   ; en la especial 0x2E con 0xCA5F: p03:BB1B con 1
	cp 02eh		;ba67
	jr nz,L_BA76		;ba69
	ld a,(0ca5fh)		;ba6b
	or a			;ba6e
	jr z,L_BA76		;ba6f
	ld a,001h		;ba71
	jp empieza_tercera_barra		;ba73   ; empieza_tercera_barra: 0xCAC8 = A, 0xDFF0 = 1, la paleta A de p02:851E, la barra de la derecha y la llamada 0
L_BA76:
	ld hl,0bae8h		;ba76   ; las ternas de p03:BAE8 [zona][...][sala]: la de esta sala, p03:BB16
L_BA79:
	ld a,(hl)			;ba79
	cp 0ffh		;ba7a
	jr z,L_BA97		;ba7c
	push hl			;ba7e
	ld a,(0ca4ah)		;ba7f   ; lee la zona
	cp (hl)			;ba82
	jr nz,L_BA91		;ba83
	inc hl			;ba85
	call terna_con_ca5f		;ba86   ; terna_con_ca5f: con el nibble bajo, solo vale con 0xCA5F (acarreo si no)
	jr c,L_BA91		;ba89
	call terna_de_esta_sala		;ba8b   ; terna_de_esta_sala: Z si es esta sala; con el nibble alto, en la especial 0x29 con 0xCAE0 = 1
	jp z,terna_casa		;ba8e   ; terna_casa:
L_BA91:
	pop hl			;ba91
	inc hl			;ba92
	inc hl			;ba93
	inc hl			;ba94
	jr L_BA79		;ba95
L_BA97:
	ld a,(0ca76h)		;ba97   ; en la especial 0x31 con 0xCA5F, nada mas
	cp 031h		;ba9a
	jr nz,L_BAA3		;ba9c
	ld a,(0ca5fh)		;ba9e
	or a			;baa1
	ret nz			;baa2
L_BAA3:
	ld a,(0cb21h)		;baa3   ; la tercera barra: 0x20, o 0x40 con 0xCB21 = 4
	cp 004h		;baa6
	ld a,020h		;baa8
	jr nz,L_BAAE		;baaa
	ld a,040h		;baac
L_BAAE:
	ld (0ca55h),a		;baae   ; guarda la tercera barra (lo que queda)
	ld a,040h		;bab1   ; 0xCAE5 = 0x40
	ld (0cae5h),a		;bab3
	call borra_aviso		;bab6   ; borra el aviso de llamada
	ld a,(0cb3fh)		;bab9   ; fuera del agua, la franja de la barra de la derecha a 0
	or a			;babc
	ret nz			;babd
	jp 04309h		;babe   ; borra_franja_80c0: borra 0x5A x 0x10 puntos desde X = 0x80, Y = 0xC0 en las paginas 0 y 1
terna_con_ca5f:		; con el nibble bajo, solo vale con 0xCA5F (acarreo si no)
	ld a,(hl)			;bac1   ; el nibble bajo...
	and 00fh		;bac2
	ret z			;bac4   ; ...0: vale siempre
	ld a,(0ca5fh)		;bac5   ; con 0xCA5F vale
	and a			;bac8
	ccf			;bac9
	ret z			;baca
	and a			;bacb   ; sin el, no (acarreo)
	ret			;bacc
terna_de_esta_sala:		; Z si es esta sala; con el nibble alto, en la especial 0x29 con 0xCAE0 = 1
	ld a,(hl)			;bacd
	inc hl			;bace
	and 0f0h		;bacf
	jr nz,L_BAD8		;bad1
L_BAD3:
	ld a,(0ca4bh)		;bad3   ; lee la sala de la zona
	cp (hl)			;bad6
	ret			;bad7
L_BAD8:
	ld a,(0ca76h)		;bad8   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 029h		;badb
	ret nz			;badd
	ld a,(0cae0h)		;bade
	dec a			;bae1
	jr z,L_BAD3		;bae2
	xor a			;bae4
	sub 0a0h		;bae5
	ret			;bae7

; ----------------------------------------------------------------------
; DATOS resto_BAE8: lo apuntan con el banco puesto p03:BA76 (0xBAE8), p03:BBAE
;   (0xBAFD); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p03:BA76, p03:BBAE (46 bytes)
;   0xbae8..0xbb16  (46 bytes)
DATA_resto_BAE8:
	defb 003h,000h,001h,003h,000h,002h,003h,000h,007h,007h,010h,002h,007h,010h,003h,007h	; bae8  ................
	defb 010h,004h,007h,010h,005h,003h,001h,003h,003h,001h,004h,003h,001h,008h,003h,001h	; baf8  ................
	defb 009h,003h,001h,00dh,003h,001h,00eh,003h,001h,011h,003h,001h,012h,0ffh	; bb08  ..............

; ======================================================================
; CODIGO 0xbb16..0xbc25  (271 bytes)
; ======================================================================


terna_casa:
	pop hl			;bb16
	inc hl			;bb17
	ld a,(hl)			;bb18   ; el nibble bajo de la terna
	and 00fh		;bb19
empieza_tercera_barra:		; 0xCAC8 = A, 0xDFF0 = 1, la paleta A de p02:851E, la barra de la derecha y la llamada 0
	ld (0cac8h),a		;bb1b
	ld hl,0dff0h		;bb1e   ; apunta a 1 mientras corre la tercera barra
	ld (hl),001h		;bb21
	call 08516h		;bb23   ; paleta_de_851e: la paleta A de la lista de p02:851E
	ld a,001h		;bb26
	ld (0cae2h),a		;bb28   ; guarda 1 mientras se ve la barra de la derecha
	call empieza_llamada		;bb2b   ; empieza_llamada: la llamada A: 0xE1E8 = 1, 0xE1E9 = A, 0xE1EA = 0, 0xE1EB = 0x0E
	xor a			;bb2e   ; 0xDFF1 = 0xDFF3 = 0
	ld (0dff1h),a		;bb2f
	ld (0dff3h),a		;bb32
	call espera_de_la_barra		;bb35   ; la espera de la barra (p03:BC07)
pinta_tercera_barra:		; el marco de la barra de 0xCA54...
	call 07059h		;bb38   ; marco_derecha_ca54: con la barra de la derecha: su rotulo y su marco con el ancho de 0xCA54
	ld a,(0cb21h)		;bb3b   ; ...de 0x40 de ancho con 0xCB21 = 4, si no 0x20...
	cp 004h		;bb3e
	ld a,040h		;bb40
	jr z,L_BB46		;bb42
	ld a,020h		;bb44
L_BB46:
	call 042b0h		;bb46   ; p00:42B0
	jp 04331h		;bb49   ; ...y la barra
tercera_barra_cada_cuadro:		; sin 0xDFF0: p03:BB91
	ld a,(0dff0h)		;bb4c   ; lee 1 mientras corre la tercera barra
	or a			;bb4f
	jr z,L_BB91		;bb50
	ld (0cae2h),a		;bb52   ; guarda 1 mientras se ve la barra de la derecha
	ld a,(0d8c0h)		;bb55   ; con 0xD8C0: se acaba
	or a			;bb58
	jr nz,L_BB9A		;bb59
	ld a,(0cac8h)		;bb5b   ; con 0xCAC8 y sin 0xCA5F: se acaba con la paleta de la sala
	or a			;bb5e
	jr z,L_BB76		;bb5f
	ld a,(0ca5fh)		;bb61
	or a			;bb64
	jr nz,L_BB76		;bb65
	ld (0cae2h),a		;bb67   ; guarda 1 mientras se ve la barra de la derecha
	call 04309h		;bb6a   ; borra_franja_80c0: borra 0x5A x 0x10 puntos desde X = 0x80, Y = 0xC0 en las paginas 0 y 1
	call 08475h		;bb6d   ; paleta_de_la_sala: la paleta comun y la de la sala
	call acaba_tercera_barra		;bb70   ; acaba_tercera_barra: 0xDFF0 = 0xE1E8 = 0
	jp borra_aviso		;bb73   ; borra_aviso: X = 0xD0, Y = 0, 0x20 x 0x14 a 0 en las dos paginas
L_BB76:
	ld a,(0ca53h)		;bb76   ; sin vida, se acaba y Snake al estado 0x14
	or a			;bb79
	jr z,L_BB87		;bb7a
	call paleta_parpadea		;bb7c   ; la paleta parpadea (p03:BC29)
	ld a,(0ca41h)		;bb7f   ; saliendo de la sala, se acaba
	or a			;bb82
	jr nz,acaba_tercera_barra		;bb83
	jr gasta_tercera_barra		;bb85
L_BB87:
	xor a			;bb87
	ld (0dff0h),a		;bb88   ; guarda 1 mientras corre la tercera barra
	call 08475h		;bb8b   ; paleta_de_la_sala: la paleta comun y la de la sala
	jp a_estado_14		;bb8e   ; a_estado_14: al estado 0x14 (si no lo esta): el sprite 4 fuera, 0xCB40 = 0x40, mirando abajo, las rachas de p37:9638 y el sonido 0x8D
L_BB91:
	ld hl,0e258h		;bb91   ; con 0xE258, se borra todo
	ld a,(hl)			;bb94
	or a			;bb95
	jr z,L_BBA2		;bb96
	ld (hl),000h		;bb98
L_BB9A:
	call 04309h		;bb9a   ; borra_franja_80c0: borra 0x5A x 0x10 puntos desde X = 0x80, Y = 0xC0 en las paginas 0 y 1
	call borra_aviso		;bb9d   ; borra_aviso: X = 0xD0, Y = 0, 0x20 x 0x14 a 0 en las dos paginas
	jr acaba_tercera_barra		;bba0
L_BBA2:
	ld a,(0ca5fh)		;bba2   ; con 0xCA5F >= 2: en salas normales, las ternas de p03:BAFD; en las especiales 0x0D, 0x2E y 0x31, p03:BB1B
	cp 002h		;bba5
	ret c			;bba7
	ld a,(0ca76h)		;bba8   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	or a			;bbab
	jr nz,L_BBB4		;bbac
	ld hl,0bafdh		;bbae
	jp L_BA79		;bbb1
L_BBB4:
	ld a,(0ca76h)		;bbb4   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 00dh		;bbb7
	jr z,L_BBC2		;bbb9
	cp 02eh		;bbbb
	jr z,L_BBC2		;bbbd
	cp 031h		;bbbf
	ret nz			;bbc1
L_BBC2:
	ld a,001h		;bbc2
	jp empieza_tercera_barra		;bbc4   ; empieza_tercera_barra: 0xCAC8 = A, 0xDFF0 = 1, la paleta A de p02:851E, la barra de la derecha y la llamada 0
gasta_tercera_barra:		; con 0xCB3C no se gasta
	ld a,(0cb3ch)		;bbc7
	or a			;bbca
	ret nz			;bbcb
	ld hl,0dff2h		;bbcc   ; cada 0xDFF2 cuadros...
	dec (hl)			;bbcf
	ret nz			;bbd0
	call espera_de_la_barra		;bbd1   ; espera_de_la_barra: 0xDFF2 = el byte de p03:BC25: + 2 en el estado 2, + 1 con 0xCB21 = 4
	ld a,(0ca55h)		;bbd4   ; ...la barra baja dos puntos; vacia, la vida
	or a			;bbd7
	jr z,L_BBEB		;bbd8
	call baja_tercera_barra		;bbda   ; baja_tercera_barra: la barra de 0xCA55 dos puntos menos
	jp 04331h		;bbdd   ; barra_derecha_ca54: la barra de la derecha de 0xCA55 (con 0xCAE2 puesto)
baja_tercera_barra:		; la barra de 0xCA55 dos puntos menos
	ld hl,0ca55h		;bbe0   ; apunta a la tercera barra (lo que queda)
baja_dos:		; (HL) - 2, sin bajar de 0
	ld a,(hl)			;bbe3
	sub 002h		;bbe4
	jr nc,L_BBE9		;bbe6
	xor a			;bbe8
L_BBE9:
	ld (hl),a			;bbe9
	ret			;bbea
L_BBEB:
	call baja_la_vida_2		;bbeb   ; baja_la_vida_2: la vida dos puntos menos; sin vida, p10:BFBC
	jp 04288h		;bbee   ; barras_de_vida: la barra de vida y, con 0xCA5F, p04:9889
baja_la_vida_2:		; la vida dos puntos menos; sin vida, p10:BFBC
	ld hl,0ca53h		;bbf1   ; apunta a la vida de Snake (lo largo de la barra)
	call baja_dos		;bbf4   ; baja_dos: (HL) - 2, sin bajar de 0
	ld a,(0ca53h)		;bbf7   ; lee la vida de Snake (lo largo de la barra)
	or a			;bbfa
	ret nz			;bbfb
	jp 08bb8h		;bbfc   ; a_p10_bfbc: p10:BFBC con el banco 10 en 0xA000
acaba_tercera_barra:		; 0xDFF0 = 0xE1E8 = 0
	xor a			;bbff
	ld (0dff0h),a		;bc00   ; guarda 1 mientras corre la tercera barra
	ld (0e1e8h),a		;bc03   ; guarda 1 mientras hay una llamada
	ret			;bc06
espera_de_la_barra:		; 0xDFF2 = el byte de p03:BC25: + 2 en el estado 2, + 1 con 0xCB21 = 4
	ld b,000h		;bc07
	ld a,(0cb00h)		;bc09   ; lee el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	cp 002h		;bc0c
	jr nz,L_BC12		;bc0e
	ld b,002h		;bc10
L_BC12:
	ld a,(0cb21h)		;bc12   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	cp 004h		;bc15
	jr nz,L_BC1A		;bc17
	inc b			;bc19
L_BC1A:
	ld a,b			;bc1a
	ld hl,0bc25h		;bc1b
	call 04248h		;bc1e   ; byte_de_tabla: A = el byte A de la tabla de HL (y HL apunta a el)
	ld (0dff2h),a		;bc21   ; guarda la espera de la tercera barra
	ret			;bc24

; ----------------------------------------------------------------------
; DATOS resto_BC25: lo apuntan con el banco puesto p03:BC1B (0xBC25); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p03:BC1B (4 bytes)
;   0xbc25..0xbc29  (4 bytes)
DATA_resto_BC25:
	defb 008h,010h,010h,018h	; bc25

; ======================================================================
; CODIGO 0xbc29..0xbd33  (266 bytes)
; ======================================================================


paleta_parpadea:		; cada 4 cuadros, segun el contador: la de la sala o las 0, 1, 2 de p02:851E
	ld a,(0ca03h)		;bc29   ; lee el contador de cuadros (uno mas en cada interrupcion)
	ld b,a			;bc2c   ; cada 4 cuadros...
	and 003h		;bc2d
	ret nz			;bc2f
	ld a,b			;bc30   ; ...el contador / 4, de 0 a 15...
	rra			;bc31
	rra			;bc32
	and 00fh		;bc33
	jp z,08475h		;bc35   ; paleta_de_la_sala: la paleta comun y la de la sala
	ld b,000h		;bc38   ; ...en el 0x0A la paleta 0...
	cp 00ah		;bc3a
	jr z,L_BC47		;bc3c
	inc b			;bc3e   ; ...en el 0x0C la 1...
	cp 00ch		;bc3f
	jr z,L_BC47		;bc41
	inc b			;bc43   ; ...en el 0x0E la 2
	cp 00eh		;bc44
	ret nz			;bc46
L_BC47:
	ld a,b			;bc47
	jp 08516h		;bc48   ; paleta_de_851e: la paleta A de la lista de p02:851E
coge_cosas:		; salvo con 0xCB21 = 2 o saliendo: las cosas de 0xD7C0 que toca Snake se cogen
	ld a,(0cb21h)		;bc4b   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	cp 002h		;bc4e
	ret z			;bc50
	ld a,(0ca41h)		;bc51   ; lee la salida de la sala (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	or a			;bc54
	ret nz			;bc55
	call hay_algo_estallando		;bc56   ; con lo que estalla de por medio (p03:BC7C), no
	ret c			;bc59
	ld ix,0d7c0h		;bc5a   ; las 4 cosas
	ld b,004h		;bc5e
L_BC60:
	call segun_la_y_de_la_cosa		;bc60   ; p07:B6CC o p07:B5CC segun la Y
	jr nz,L_BC72		;bc63
	exx			;bc65
	call rectangulo_de_cosa		;bc66   ; el rectangulo de la cosa (p03:BCBA)
	exx			;bc69
	jr nc,L_BC72		;bc6a
	call 08bc0h		;bc6c   ; toca Snake? (p07:B5AF)
	call c,coge_cosa		;bc6f   ; la coge
L_BC72:
	exx			;bc72   ; la cosa siguiente, 4 bytes mas alla
	ld de,00004h		;bc73
	add ix,de		;bc76
	exx			;bc78
	djnz L_BC60		;bc79
	ret			;bc7b
hay_algo_estallando:		; fuera de la zona 0x12, con una cosa 0x23, 0x24 o 0x29 en la sala y una ficha en 0xDF80: acarreo
	ld a,(0ca4ah)		;bc7c   ; lee la zona
	cp 012h		;bc7f
	jr z,L_BC9B		;bc81
	ld hl,0d7c0h		;bc83   ; apunta a las 4 cosas de la sala: fichas de 4 bytes [tipo][Y][X][numero]
	ld b,004h		;bc86
L_BC88:
	ld a,(hl)			;bc88   ; la cosa: 0x23...
	cp 023h		;bc89
	jr z,L_BC9D		;bc8b
	cp 024h		;bc8d   ; ...0x24...
	jr z,L_BC9D		;bc8f
	cp 029h		;bc91   ; ...o 0x29
	jr z,L_BC9D		;bc93
	ld de,00004h		;bc95   ; la siguiente
	add hl,de			;bc98
	djnz L_BC88		;bc99
L_BC9B:
	and a			;bc9b
	ret			;bc9c
L_BC9D:
	ld hl,0df80h		;bc9d   ; apunta a 8 fichas de 8 bytes [tipo][dibujo][Y][X][fila][columna][espera][grafico] que suenan 0x14 en la sala y 0x15 al lado
	ld b,008h		;bca0
	ld de,00008h		;bca2
L_BCA5:
	ld a,(hl)			;bca5   ; la ficha de 0xDF80 en uso?
	or a			;bca6
	jr nz,L_BCAE		;bca7
	add hl,de			;bca9   ; la siguiente
	djnz L_BCA5		;bcaa
	and a			;bcac   ; ninguna: sin acarreo
	ret			;bcad
L_BCAE:
	scf			;bcae
	ret			;bcaf
segun_la_y_de_la_cosa:		; el bit 0 de la Y: p07:B5CC; si no, p07:B6CC
	ld a,(ix+001h)		;bcb0
	rra			;bcb3
	jp nc,08bd8h		;bcb4   ; a_p07_b6cc: p07:B6CC con el banco 7 en 0xA000
	jp 08be0h		;bcb7   ; a_p07_b5cc: p07:B5CC con el banco 7 en 0xA000
rectangulo_de_cosa:		; HL = (X + 8, Y + 0x10) de la cosa, DE = 0x10 x 8; con la X impar y 0xCB31, nada
	ld a,(ix+000h)		;bcba
	and a			;bcbd
	ret z			;bcbe
	ld a,(ix+002h)		;bcbf
	rra			;bcc2
	jr nc,L_BCCA		;bcc3
	ld a,(0cb31h)		;bcc5   ; lee 1 en el estado 2 de Snake
	and a			;bcc8
	ret nz			;bcc9
L_BCCA:
	ld a,(ix+001h)		;bcca   ; la Y par...
	and 0feh		;bccd
	add a,010h		;bccf   ; ...+ 0x10
	ld l,a			;bcd1
	ld a,(ix+002h)		;bcd2   ; la X par...
	and 0feh		;bcd5
	add a,008h		;bcd7   ; ...+ 8
	ld h,a			;bcd9
	ld de,00810h		;bcda   ; 16 x 8
	scf			;bcdd
	ret			;bcde
coge_cosa:		; el tipo
	push bc			;bcdf
	push ix		;bce0   ; HL = la ficha
	pop hl			;bce2
	ld a,(hl)			;bce3   ; el tipo
	push af			;bce4
	ld e,l			;bce5   ; sin el bit 7 del numero, su fondo otra vez
	ld d,h			;bce6   ; DE = el byte 3...
	inc de			;bce7
	inc de			;bce8
	inc de			;bce9
	ld a,(de)			;bcea   ; ...el bit 7...
	rla			;bceb
	push hl			;bcec
	call nc,fondo_de_la_cosa		;bced   ; fondo_de_la_cosa: p03:BF55 y el sitio de la cosa a la otra pagina o a 0
	pop hl			;bcf0
	call apunta_cogida		;bcf1   ; apunta que se ha cogido
	pop af			;bcf4   ; el tipo
	call sonido_de_coger		;bcf5   ; y el sonido 0x10
	pop bc			;bcf8
	ret			;bcf9
sonido_de_coger:
	jp 06a38h		;bcfa   ; sonido_10: pide el sonido 0x10
apunta_cogida:		; el byte 3: con el bit 6, la bandera de 0xD7F0; sin el, la de la sala (0xD8D8); 0x3F y 0x09, ninguna
	ld e,l			;bcfd   ; DE = la ficha
	ld d,h			;bcfe
	inc hl			;bcff
	inc hl			;bd00
	inc hl			;bd01
	ld a,(hl)			;bd02   ; el byte 3
	ex de,hl			;bd03
	bit 6,a		;bd04   ; el bit 6: la bandera de 0xD7F0
	jr nz,L_BD15		;bd06
	and 03fh		;bd08   ; sin el: 0x3F, ninguna...
	cp 03fh		;bd0a
	jr z,L_BD20		;bd0c
	push hl			;bd0e   ; ...si no, la de la sala
	call pon_bandera_d8d8		;bd0f   ; pon_bandera_d8d8: pone la bandera A de 0xD8D8 (las de la sala)
	pop hl			;bd12
	jr L_BD20		;bd13
L_BD15:
	and 03fh		;bd15
	cp 009h		;bd17
	jr z,L_BD20		;bd19
	push hl			;bd1b
	call pon_bandera_d7f0		;bd1c   ; pon_bandera_d7f0: pone la bandera A de 0xD7F0
	pop hl			;bd1f
L_BD20:
	ld a,(hl)			;bd20   ; la ficha libre y la cosa a lo que lleva Snake (p03:BD86)
	ld (hl),000h		;bd21
	call lleva_cosa_si		;bd23   ; lleva_cosa_si: la tiene (p03:BDAD), le suma lo de p56:A67E (p03:BDB3), lo que dice (p03:BE0B) y el rotulo
	push af			;bd26
	call 08b78h		;bd27   ; p10:A65E
	pop af			;bd2a
	sub 01ch		;bd2b   ; las cosas 0x1C-0x21 hacen algo mas (p03:BD33)
	cp 006h		;bd2d
	ret nc			;bd2f
	call 0424dh		;bd30   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_BD33: 6 destinos del despachador p00:424D (call en p03:BD30, el
;   indice en A): 8AEF, 8B27, BDB2, BD3F, BD4C, BD59; lo leen p03:BD30 (12
;   bytes)
;   0xbd33..0xbd3f  (12 bytes)
DATA_tabla_BD33:
	defw 08aefh,08b27h,0bdb2h,0bd3fh,0bd4ch,0bd59h	; bd33

; ======================================================================
; CODIGO 0xbd3f..0xbfd8  (665 bytes)
; ======================================================================


cosa_1c:		; 0xD684-0xD68F a cero y, con 0xCB21 entre 0x14 y 0x16, 0xCB21 = 0x11
	ld hl,0d684h		;bd3f
	call borra_12		;bd42   ; borra_12: 12 bytes de HL a cero
	ld bc,01417h		;bd45
	ld e,011h		;bd48
	jr cambia_cb21		;bd4a
cosa_1d:		; 0xD690-0xD69B a cero y, con 0xCB21 entre 0x17 y 0x19, 0xCB21 = 0x12
	ld hl,0d690h		;bd4c
	call borra_12		;bd4f   ; borra_12: 12 bytes de HL a cero
	ld bc,0171ah		;bd52
	ld e,012h		;bd55
	jr cambia_cb21		;bd57
cosa_1e:		; 0xD69C-0xD6A7 a cero y, con 0xCB21 entre 0x1A y 0x1C, 0xCB21 = 0x13
	ld hl,0d69ch		;bd59
	call borra_12		;bd5c   ; borra_12: 12 bytes de HL a cero
	ld bc,01a1dh		;bd5f
	ld e,013h		;bd62
	jr cambia_cb21		;bd64
borra_12:		; 12 bytes de HL a cero
	ld bc,0000bh		;bd66
	jp 04236h		;bd69   ; borra_bloque: pone a cero BC + 1 bytes desde HL
cambia_cb21:		; con 0xCB21 entre B y C - 1: 0xCB21 = E y p10:BA03
	ld a,(0cb21h)		;bd6c   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	cp b			;bd6f
	ret c			;bd70
	cp c			;bd71
	ret nc			;bd72
	ld a,e			;bd73
	ld (0cb21h),a		;bd74   ; guarda lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	jp 08c1ch		;bd77   ; a_p10_ba03: p10:BA03 con el banco 10 en 0xA000
fondo_de_la_cosa:		; p03:BF55 y el sitio de la cosa a la otra pagina o a 0
	push hl			;bd7a
	call cosa_que_cuenta		;bd7b   ; cosa_que_cuenta: acarreo si la cosa es de las de 0xCAC9-0xCACD (zonas 3 y 4, ciertas salas) y aun vale
	pop hl			;bd7e
	jp 0929ah		;bd7f   ; borra_cosa: sin acarreo, el sitio de la cosa a la otra pagina; con acarreo, a 0 en esta
lleva_cosa:		; desde la 0x32, solo el rotulo y 0xCAC7 = 1
	cp 032h		;bd82
	jr nc,L_BD9B		;bd84
lleva_cosa_si:		; la tiene (p03:BDAD), le suma lo de p56:A67E (p03:BDB3), lo que dice (p03:BE0B) y el rotulo
	push af			;bd86
	dec a			;bd87
	push af			;bd88
	call la_tiene		;bd89   ; la_tiene: el byte 0 de su ficha de 0xD600 a 1
	pop af			;bd8c
	call cuantas_trae		;bd8d   ; cuantas_trae: B = lo que trae (p56:A67E); 0xFF: p03:BDF5
	call dice_lo_que_lleva		;bd90   ; dice_lo_que_lleva: la cuenta del arma y la del equipo en el marcador
	pop af			;bd93
	push af			;bd94
	dec a			;bd95
	call rotulo_de_la_cosa		;bd96   ; rotulo_de_la_cosa: 0xCAA8 = 1, la ventana del rotulo (guardando el fondo) y el rotulo A
	pop af			;bd99
	ret			;bd9a
L_BD9B:
	dec a			;bd9b
	call rotulo_de_la_cosa		;bd9c   ; rotulo_de_la_cosa: 0xCAA8 = 1, la ventana del rotulo (guardando el fondo) y el rotulo A
	ld hl,0cac7h		;bd9f   ; apunta a el rotulo de la cosa cogida: 1 puesto, 2 que se quita con una tecla
	ld (hl),001h		;bda2
	ret			;bda4
suma_7:		; suma 7 a la cosa 1 (B = 1, C = 7)
	ld bc,00107h		;bda5
	call suma_a_la_cosa		;bda8   ; suma_a_la_cosa: la cuenta (BCD) de la ficha C + B...
	jr dice_lo_que_lleva		;bdab
la_tiene:		; el byte 0 de su ficha de 0xD600 a 1
	call ficha_de_cosa		;bdad   ; ficha_de_cosa: HL = 0xD600 + A * 4: la ficha de lo que lleva Snake
	ld (hl),001h		;bdb0
L_BDB2:
	ret			;bdb2
cuantas_trae:		; B = lo que trae (p56:A67E); 0xFF: p03:BDF5
	ld c,a			;bdb3
	call 087e9h		;bdb4   ; byte_a67e: A = el byte A de p56:A67E
	ld b,a			;bdb7
	cp 0ffh		;bdb8
	jr z,suma_a_las_dos		;bdba
suma_a_la_cosa:		; la cuenta (BCD) de la ficha C + B...
	ld a,c			;bdbc
L_BDBD:
	call ficha_de_cosa		;bdbd   ; ficha_de_cosa: HL = 0xD600 + A * 4: la ficha de lo que lleva Snake
	inc hl			;bdc0
	ld (0d8f0h),hl		;bdc1
	ld a,(hl)			;bdc4
	add a,b			;bdc5
	daa			;bdc6   ; ...en decimal
	ld (hl),a			;bdc7
	inc hl			;bdc8
	ld e,a			;bdc9
	ld d,(hl)			;bdca
	jr nc,L_BDD1		;bdcb   ; con acarreo, el byte alto uno mas
	call suma_bcd		;bdcd   ; suma_bcd: (HL) + 1 en decimal
	ld d,a			;bdd0
L_BDD1:
	ld a,c			;bdd1   ; las cosas 0x0D-0x2C no tienen tope...
	cp 00dh		;bdd2
	jr c,L_BDE4		;bdd4
	cp 02dh		;bdd6
	ret c			;bdd8
	cp 030h		;bdd9
	ret nc			;bddb
	ld hl,lbe8ch		;bddc   ; ...las 0x2D-0x2F, el de p06:BE8C segun el nivel...
	call 08847h		;bddf   ; palabra_de_cab5: HL = la palabra 0xCAB5 de la tabla de HL (banco 6)
	jr L_BDE7		;bde2
L_BDE4:
	call 0883ch		;bde4   ; ...las de antes, el de p06:BDD2 segun el nivel
L_BDE7:
	and a			;bde7   ; por encima del tope...
	push hl			;bde8
	sbc hl,de		;bde9
	pop hl			;bdeb
	ret nc			;bdec
	ex de,hl			;bded   ; ...se queda en el tope
	ld hl,(0d8f0h)		;bdee
	ld (hl),e			;bdf1
	inc hl			;bdf2
	ld (hl),d			;bdf3
	ret			;bdf4
suma_a_las_dos:		; 50 a la cosa 0 y 60 a la 1
	xor a			;bdf5   ; 50 (en decimal) a la ficha 0...
	ld bc,05000h		;bdf6
	call L_BDBD		;bdf9
	ld a,001h		;bdfc   ; ...y 60 a la 1
	ld bc,06001h		;bdfe
	jr L_BDBD		;be01
ficha_de_cosa:		; HL = 0xD600 + A * 4: la ficha de lo que lleva Snake
	ld hl,0d600h		;be03   ; apunta a lo que lleva Snake: fichas de 4 bytes [la tiene][cuenta en BCD, 2 bytes][...]; las de 0xCB20 desde la 1
	add a,a			;be06
	add a,a			;be07
	jp 0423eh		;be08   ; suma_a_hl: HL = HL + A
dice_lo_que_lleva:		; la cuenta del arma y la del equipo en el marcador
	call dice_el_arma		;be0b   ; dice_el_arma: la cuenta de 0xCB20 (0xD704 fuera del paso 0) en 0xE088 (p10:B960)
	jr dice_el_equipo		;be0e
dice_el_arma:		; la cuenta de 0xCB20 (0xD704 fuera del paso 0) en 0xE088 (p10:B960)
	ld a,(0ca01h)		;be10   ; lee el paso del estado de la partida
	or a			;be13
	ld a,(0cb20h)		;be14   ; lee lo que usa el disparo 1 (0 nada; p02:8001 elige por ello)
	jr z,L_BE1C		;be17
	ld a,(0d704h)		;be19
L_BE1C:
	dec a			;be1c
	ld de,0e088h		;be1d
	jr L_BE39		;be20
dice_el_equipo:		; con 0xCB21 (0xD704 fuera del paso 0) entre 0x20 y 0x22, su cuenta (cosa + 0x0D) en 0xE0B8
	ld a,(0ca01h)		;be22   ; lee el paso del estado de la partida
	or a			;be25
	ld a,(0cb21h)		;be26   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	jr z,L_BE2E		;be29
	ld a,(0d704h)		;be2b
L_BE2E:
	cp 020h		;be2e   ; de 0x20 a 0x22...
	ret c			;be30
	cp 023h		;be31
	ret nc			;be33
	add a,00dh		;be34   ; ...su ficha: + 0x0D
	ld de,0e0b8h		;be36   ; en 0xE0B8
L_BE39:
	call ficha_de_cosa		;be39   ; ficha_de_cosa: HL = 0xD600 + A * 4: la ficha de lo que lleva Snake
	inc hl			;be3c
	inc hl			;be3d
	call 09331h		;be3e   ; a_p10_b960: p10:B960 con el banco 10 en 0xA000
	ret			;be41
tiene_balas:		; acarreo si la cuenta de la cosa A de 0xD600 es 0
	ld de,0d600h		;be42   ; apunta a lo que lleva Snake: fichas de 4 bytes [la tiene][cuenta en BCD, 2 bytes][...]; las de 0xCB20 desde la 1
tiene_cuenta:		; los dos bytes de la cuenta a cero: acarreo
	call ficha_de_a		;be45   ; ficha_de_a: HL = DE + (A - 1) * 4 + 1: la cuenta de la ficha A
	ld a,(hl)			;be48
	or a			;be49
	ret nz			;be4a
	inc hl			;be4b
	ld a,(hl)			;be4c
	or a			;be4d
	ret nz			;be4e
	scf			;be4f
	ret			;be50
suma_una:		; la cosa A: la tiene y una mas
	ld de,0d600h		;be51   ; apunta a lo que lleva Snake: fichas de 4 bytes [la tiene][cuenta en BCD, 2 bytes][...]; las de 0xCB20 desde la 1
	call ficha_de_a		;be54   ; ficha_de_a: HL = DE + (A - 1) * 4 + 1: la cuenta de la ficha A
	dec hl			;be57
	ld (hl),001h		;be58
	inc hl			;be5a
	call suma_una_bcd		;be5b   ; suma_una_bcd: la cuenta BCD de 16 bits de HL mas 1
	jr dice_el_arma		;be5e
gasta_una:		; la cosa A una menos; con 1 y 2, nada mas; si se acaba, fuera de las manos y el mensaje de p10:B3E5 con 0xD874
	push af			;be60
	ld de,0d600h		;be61   ; apunta a lo que lleva Snake: fichas de 4 bytes [la tiene][cuenta en BCD, 2 bytes][...]; las de 0xCB20 desde la 1
	call ficha_de_a		;be64   ; ficha_de_a: HL = DE + (A - 1) * 4 + 1: la cuenta de la ficha A
	call resta_una		;be67   ; resta_una: la cuenta BCD de 16 bits de HL menos 1
	call dice_el_arma		;be6a   ; dice_el_arma: la cuenta de 0xCB20 (0xD704 fuera del paso 0) en 0xE088 (p10:B960)
	pop af			;be6d
	cp 002h		;be6e
	ret z			;be70
	cp 001h		;be71
	ret z			;be73
	call tiene_balas		;be74   ; tiene_balas: acarreo si la cuenta de la cosa A de 0xD600 es 0
	ret nc			;be77
	dec hl			;be78   ; sin cuenta: no la tiene...
	dec hl			;be79
	xor a			;be7a
	ld (hl),a			;be7b   ; ...0xCB20, el estado, el dibujo y 0xCB35 a 0
	ld (0cb20h),a		;be7c   ; guarda lo que usa el disparo 1 (0 nada; p02:8001 elige por ello)
	ld (0cb00h),a		;be7f   ; guarda el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	ld (0cb01h),a		;be82   ; guarda el dibujo de Snake (al darse la vuelta se le suma 1, 3 o 5 segun 0xCB00)
	ld (0cb35h),a		;be85
	ld a,(0d8a4h)		;be88
	or a			;be8b
L_BE8C:
	ret nz			;be8c
	ld hl,0d874h		;be8d
	jp 09319h		;be90   ; a_p10_b3e5: p10:B3E5 con el banco 10 en 0xA000
ficha_de_a:		; HL = DE + (A - 1) * 4 + 1: la cuenta de la ficha A
	dec a			;be93   ; desde 0
	ld l,a			;be94
	ld h,000h		;be95
	add hl,hl			;be97   ; * 4
	add hl,hl			;be98
	add hl,de			;be99   ; en la tabla de DE
	inc hl			;be9a   ; la cuenta: el byte 1
	ret			;be9b
resta_una:		; la cuenta BCD de 16 bits de HL menos 1
	call resta_bcd		;be9c   ; resta_bcd: (HL) - 1 en decimal
	inc hl			;be9f
	ret nc			;bea0
resta_bcd:		; (HL) - 1 en decimal
	ld a,(hl)			;bea1
	sub 001h		;bea2
	daa			;bea4
	ld (hl),a			;bea5
	ret			;bea6
suma_una_bcd:		; la cuenta BCD de 16 bits de HL mas 1
	call suma_bcd		;bea7   ; suma_bcd: (HL) + 1 en decimal
	inc hl			;beaa
	ret nc			;beab
suma_bcd:		; (HL) + 1 en decimal
	ld a,(hl)			;beac
	add a,001h		;bead
	daa			;beaf
	ld (hl),a			;beb0
	ret			;beb1
tiene_cuenta_d638:		; acarreo si la cuenta de la cosa A de 0xD638 es 0
	ld de,0d638h		;beb2   ; apunta a la segunda tabla de lo que lleva (fichas de 4 bytes, como 0xD600)
	jr tiene_cuenta		;beb5
gasta_una_d638:		; la cosa A de 0xD638 una menos; a cero, no la tiene
	push af			;beb7
	ld de,0d638h		;beb8   ; apunta a la segunda tabla de lo que lleva (fichas de 4 bytes, como 0xD600)
	call ficha_de_a		;bebb   ; ficha_de_a: HL = DE + (A - 1) * 4 + 1: la cuenta de la ficha A
	call resta_una		;bebe   ; resta_una: la cuenta BCD de 16 bits de HL menos 1
	call dice_el_equipo		;bec1   ; dice_el_equipo: con 0xCB21 (0xD704 fuera del paso 0) entre 0x20 y 0x22, su cuenta (cosa + 0x0D) en 0xE0B8
	pop af			;bec4
	call tiene_balas		;bec5   ; tiene_balas: acarreo si la cuenta de la cosa A de 0xD600 es 0
	ret nc			;bec8
	dec hl			;bec9
	dec hl			;beca
	ld (hl),000h		;becb
	ret			;becd
rotulo_de_la_cosa:		; 0xCAA8 = 1, la ventana del rotulo (guardando el fondo) y el rotulo A
	push af			;bece
	ld hl,0caa8h		;becf   ; apunta a 1 mientras se ve el rotulo de la cosa cogida
	ld (hl),001h		;bed2
	call sitio_del_rotulo_cosa		;bed4   ; sitio_del_rotulo_cosa: HL = (0x30, 0x0C) o (0x30, 0x9C) con Snake arriba; BC = 0x60 x 0x18
	push hl			;bed7
	push bc			;bed8
	call guarda_fondo_rotulo		;bed9   ; guarda_fondo_rotulo: el rectangulo a (0x30, 0xE0) de la pagina de dibujar
	pop bc			;bedc
	pop hl			;bedd
	call ventana_del_rotulo		;bede   ; ventana_del_rotulo: el fondo al color 9 y el marco en el color 7
	pop af			;bee1
	jp 0631ah		;bee2   ; rotulo_de_50: los rotulos de p50:8006 y el A de p50:800A, arriba o abajo
sitio_del_rotulo_cosa:		; HL = (0x30, 0x0C) o (0x30, 0x9C) con Snake arriba; BC = 0x60 x 0x18
	ld hl,0300ch		;bee5
	ld bc,06018h		;bee8
	ld a,(0cb03h)		;beeb   ; lee la Y de Snake
	cp 070h		;beee
	ret nc			;bef0
	ld l,09ch		;bef1
	ret			;bef3
guarda_fondo_rotulo:		; el rectangulo a (0x30, 0xE0) de la pagina de dibujar
	ld de,030e0h		;bef4
	ld a,(0ca42h)		;bef7   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	and 001h		;befa
	jp 04767h		;befc   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
ventana_del_rotulo:		; el fondo al color 9 y el marco en el color 7
	ld a,(0ca42h)		;beff   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	ld d,a			;bf02
	ld a,099h		;bf03
	push hl			;bf05
	push bc			;bf06
	call 046ffh		;bf07   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
	pop de			;bf0a
	pop hl			;bf0b
	ld a,(0ca42h)		;bf0c   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	ld c,007h		;bf0f
	jp 046bch		;bf11   ; marco: cuatro lineas: un marco de D x E desde HL
quita_el_rotulo:		; con 0xCAC7 = 2 una tecla o un disparo recien pulsados lo quitan; si no, tambien con un disparo apretado
	ld hl,0cac7h		;bf14   ; apunta a el rotulo de la cosa cogida: 1 puesto, 2 que se quita con una tecla
	ld a,(hl)			;bf17
	cp 002h		;bf18
	jr nz,L_BF24		;bf1a
	ld a,(0ca07h)		;bf1c   ; lee lo recien pulsado del mando (los bits de 0xCA08 que no estaban)
	and 03fh		;bf1f
	ret z			;bf21
	jr L_BF31		;bf22
L_BF24:
	ld a,(0ca08h)		;bf24   ; lee el mando: joystick y teclado juntos (bits 0-3 las direcciones, 4-5 los disparos)
	and 030h		;bf27
	jr nz,L_BF31		;bf29
	ld a,(0ca07h)		;bf2b   ; lee lo recien pulsado del mando (los bits de 0xCA08 que no estaban)
	and 03fh		;bf2e
	ret z			;bf30
L_BF31:
	ld a,(hl)			;bf31   ; 0xCAC7 = 0: el fondo otra vez y 0xCAA8 = 0
	or a			;bf32
	jr nz,L_BF4A		;bf33
	xor a			;bf35
	ld (0caa8h),a		;bf36   ; guarda 1 mientras se ve el rotulo de la cosa cogida
	call sitio_del_rotulo_cosa		;bf39   ; sitio_del_rotulo_cosa: HL = (0x30, 0x0C) o (0x30, 0x9C) con Snake arriba; BC = 0x60 x 0x18
	ld de,030e0h		;bf3c
	ex de,hl			;bf3f
	ld a,(0ca42h)		;bf40   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	rlca			;bf43
	rlca			;bf44
	and 00ch		;bf45
	jp 04767h		;bf47   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
L_BF4A:
	ld (hl),000h		;bf4a   ; si no, 0xCAC7 = 0 y el rotulo de p50:8008
	call sitio_del_rotulo_cosa		;bf4c   ; sitio_del_rotulo_cosa: HL = (0x30, 0x0C) o (0x30, 0x9C) con Snake arriba; BC = 0x60 x 0x18
	call ventana_del_rotulo		;bf4f   ; ventana_del_rotulo: el fondo al color 9 y el marco en el color 7
	jp 0634ch		;bf52   ; rotulo_8008: el rotulo de p50:8008 una linea por encima
cosa_que_cuenta:		; acarreo si la cosa es de las de 0xCAC9-0xCACD (zonas 3 y 4, ciertas salas) y aun vale
	ld a,(0cb21h)		;bf55   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	cp 003h		;bf58   ; con 0xCB21 = 3, no
	jr z,L_BF86		;bf5a
	ld a,(0ca4ah)		;bf5c   ; lee la zona
	cp 003h		;bf5f   ; la zona 3...
	jr nz,L_BF88		;bf61
	ld a,(0ca76h)		;bf63   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	or a			;bf66   ; ...en una especial, la 0x0C (0xCACB)
	jr nz,L_BF7F		;bf67
	ld hl,0cac9h		;bf69   ; las salas 0 y 5: 0xCAC9
	ld a,(0ca4bh)		;bf6c   ; lee la sala de la zona
	or a			;bf6f
	jr z,L_BFAB		;bf70
	cp 005h		;bf72
	jr z,L_BFAB		;bf74
	ld hl,0cacah		;bf76   ; la 0x10: 0xCACA
	cp 010h		;bf79
	jr z,L_BFAB		;bf7b
	or a			;bf7d   ; las demas, no
	ret			;bf7e
L_BF7F:
	ld hl,0cacbh		;bf7f
	cp 00ch		;bf82
	jr z,L_BFAB		;bf84
L_BF86:
	or a			;bf86
	ret			;bf87
L_BF88:
	ld a,(0ca4ah)		;bf88   ; lee la zona
	cp 004h		;bf8b   ; la zona 4...
	jr nz,L_BF86		;bf8d
	ld a,(0ca76h)		;bf8f   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	or a			;bf92   ; ...no en una especial
	ret nz			;bf93
	ld hl,0cacch		;bf94   ; la sala 5: 0xCACC
	ld a,(0ca4bh)		;bf97   ; lee la sala de la zona
	cp 005h		;bf9a
	jr z,L_BFAB		;bf9c
	ld hl,0cacdh		;bf9e   ; las 0x0E y 0x13: 0xCACD
	cp 00eh		;bfa1
	jr z,L_BFAB		;bfa3
	cp 013h		;bfa5
	jr z,L_BFAB		;bfa7
	or a			;bfa9   ; las demas, no
	ret			;bfaa
L_BFAB:
	ld a,(hl)			;bfab
	or a			;bfac
	ret z			;bfad
	scf			;bfae
	ret			;bfaf
pausa:		; A = 0xCAC0: con la pausa, la orden 0xF2 y el rotulo de p03:BFD8 en X = 0x4C, Y = 0x58; sin ella, p03:BFE2
	or a			;bfb0
	jr z,$+49		;bfb1
	call 06bdch		;bfb3   ; orden_sonido_f2: la orden 0xF2 al sonido
	ld a,(0d8a4h)		;bfb6
	or a			;bfb9
	ret nz			;bfba
	call 06de9h		;bfbb   ; dibujos_8114_en_a000: los dibujos de p52:8114 en la VRAM de 0xA000
	ld hl,04c58h		;bfbe   ; guarda lo de X = 0x4C, Y = 0x58 de la otra pagina...
	ld de,0c000h		;bfc1   ; ...en X = 0xC0, Y = 0 de esta (0x28 x 0x10)
	ld bc,02810h		;bfc4
	push hl			;bfc7
	call 0474dh		;bfc8   ; copia_rectangulo_a_esta: p00:4767 de la otra pagina (0xCA42 ^ 1) a la de 0xCA42
	pop de			;bfcb
	ld hl,0bfd8h		;bfcc   ; el rotulo de 2 x 5
	ld bc,00205h		;bfcf
	call 050c4h		;bfd2   ; mosaico_fa_b1: el mosaico de HL en (D, E), B filas de C caracteres, con la forma 10 de la franja 1 (p00:512C)
	jp 0722ch		;bfd5   ; letras_de_44: 0x80 letras de p44:BADB en la fila 0x40

; ----------------------------------------------------------------------
; DATOS mosaico_BFD8: un mosaico de 2 x 5 caracteres, un byte cada uno
;   (p00:510F; BC = 0x0205 en quien llama); lo leen p03:BFD2 (10 bytes)
;   0xbfd8..0xbfe2  (10 bytes)
DATA_mosaico_BFD8:
	defb 01ah,001h,00fh,01dh,009h	; bfd8
	defb 01bh,002h,019h,01eh,00ah	; bfdd

; ======================================================================
; CODIGO 0xbfe2..0xc000  (30 bytes)
; ======================================================================


sin_pausa:		; la orden 0xF1 y el rectangulo otra vez en su sitio
	call 06bd8h		;bfe2   ; orden_sonido_f1: la orden 0xF1 al sonido
	ld a,(0d8a4h)		;bfe5
	or a			;bfe8
	ret nz			;bfe9
	ld hl,0c000h		;bfea
	ld de,04c58h		;bfed
	ld bc,02810h		;bff0
	push hl			;bff3
	call 0475ah		;bff4   ; copia_rectangulo_a_la_otra: p00:4767 de la pagina 0xCA42 a la otra
	pop hl			;bff7
	ld e,l			;bff8
	ld d,h			;bff9
	ld bc,04010h		;bffa
	jp 0474dh		;bffd   ; copia_rectangulo_a_esta: p00:4767 de la otra pagina (0xCA42 ^ 1) a la de 0xCA42
