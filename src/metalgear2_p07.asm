; ==========================================================================
; METAL GEAR 2 SOLID SNAKE - Konami (1990) - MSX2 - MegaROM RC-767 de 512 KB (Konami SCC) - banco 07 (se ejecuta en 0xa000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x0a000


; ======================================================================
; CODIGO 0xa000..0xa012  (18 bytes)
; ======================================================================


borra_d8c0:		; 0xD8C0-0xD8CD a cero
	ld hl,0d8c0h		;a000   ; apunta a 1 con Snake dentro de lo de 0xD8C2 (p07:A40D; 0 al salir, p07:A69A)
	ld bc,0000dh		;a003   ; 14 bytes
	jp 04236h		;a006   ; borra_bloque: pone a cero BC + 1 bytes desde HL
d8c1_cada_cuadro:		; p07:A03A y el paso 0xD8C1 (p07:A012, 20 pasos)
	call d8c2_al_salir		;a009   ; d8c2_al_salir: con 0xD8C2 y 0xD8CE (o saliendo de la sala): 0xD8C9 = 0xD4E9 = 0 y todo a cero (p07:A2FF)
	ld a,(0d8c1h)		;a00c   ; lee el paso de lo de 0xD8C2 (20 pasos, p07:A012)
	call 0424dh		;a00f   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_A012: 20 destinos del despachador p00:424D (call en p07:A00F, el
;   indice en A): A054, A07B, A0B0, A0C6, A0E2, A15A, A17B, A19C, A1C1, A1D4,
;   A276, A29D, A2C3, A2E9, A315, A329, A356, A3A9, A3CE, A3F3; lo leen
;   p07:A00F (40 bytes)
;   0xa012..0xa03a  (40 bytes)
DATA_tabla_A012:
	defw 0a054h,0a07bh,0a0b0h,0a0c6h,0a0e2h,0a15ah,0a17bh,0a19ch	; a012
	defw 0a1c1h,0a1d4h,0a276h,0a29dh,0a2c3h,0a2e9h,0a315h,0a329h	; a022
	defw 0a356h,0a3a9h,0a3ceh,0a3f3h	; a032  -> d8c1_paso_16 d8c1_paso_17 d8c1_paso_18 d8c1_paso_19

; ======================================================================
; CODIGO 0xa03a..0xa686  (1612 bytes)
; ======================================================================


d8c2_al_salir:		; con 0xD8C2 y 0xD8CE (o saliendo de la sala): 0xD8C9 = 0xD4E9 = 0 y todo a cero (p07:A2FF)
	ld a,(0d8c2h)		;a03a   ; lee la entrada de p07:AA83 junto a la que esta Snake (su numero, p07:A543)
	or a			;a03d   ; sin 0xD8C2, nada
	ret z			;a03e
	ld a,(0d8ceh)		;a03f   ; lee con 1, lo de 0xD8C2 se acaba (p07:A03A)
	or a			;a042   ; con 0xD8CE, a cero
	jr nz,d8c2_a_cero		;a043
	ld a,(0ca41h)		;a045   ; lee la salida de la sala (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	or a			;a048   ; sin salir...
	ret z			;a049   ; sin salir, nada
d8c2_a_cero:
	xor a			;a04a
	ld (0d8c9h),a		;a04b   ; 0xD8C9 = 0...
	ld (0d4e9h),a		;a04e   ; ...0xD4E9 = 0
	jp d8c1_todo_a_cero		;a051   ; d8c1_todo_a_cero: el byte 6 de su ficha, 0xD8C1 y 0xD8C2 a cero, 0xD456 = 1 y p11:BDBD con 3
d8c1_paso_0:		; p07:A667 y p07:A50A; con 0xD8C2: 0xD8CE = 0, p07:A5D7, el byte 6 de su ficha de 0xDC80 a 1, el paso siguiente, p07:A83A y el sonido 0x46
	call d8cd_de_la_zona		;a054   ; d8cd_de_la_zona: 0xD8CD = el de la zona en p07:A686; en la zona 6, 0xFF en la sala 0x23 y 0xFE en las demas
	call busca_ficha_aa83		;a057   ; busca_ficha_aa83: con Snake en el estado 3 hacia arriba: las fichas de p07:AA83 (8 bytes: zona, sala, numero, Y, X y 3 bytes) hasta la que pone 0xD8C2 (p07:A543); con el 3, sin 0xD4F3 ni el bit 1 de 0xD7D4, otra vez a 0
	ld a,(0d8c2h)		;a05a   ; lee la entrada de p07:AA83 junto a la que esta Snake (su numero, p07:A543)
	or a			;a05d   ; sin 0xD8C2, nada
	ret z			;a05e   ; sin 0xD8C2, nada
	xor a			;a05f
	ld (0d8ceh),a		;a060   ; 0xD8CE = 0
	call caracter_b_de_d8cf		;a063   ; caracter_b_de_d8cf: el de al lado: 0x10 a la derecha (8 desde la zona 7)
	ld b,006h		;a066   ; el byte 6 de su ficha...
	call ficha_dc80		;a068   ; ficha_dc80: HL = el byte B de la ficha 0xD8C2 - 1 de 0xDC80 (8 bytes cada una)
	ld (hl),001h		;a06b   ; ...a 1
	call d8c1_siguiente		;a06d   ; d8c1_siguiente: el paso siguiente de 0xD8C1
	call guarda_fondo_d8c0		;a070   ; guarda_fondo_d8c0: p07:A896 y cuatro bloques de 16 x 16 de la pagina 0 a la 3: (0xC0, 0xE0), (0xC0, 0xF0), (0xF0, 0xE0) y (0xF0, 0xF0) a (0xA0-0xD0, 0xB0)
	jp 06c33h		;a073   ; sonido_46: pide el sonido 0x46
d8c1_siguiente:		; el paso siguiente de 0xD8C1
	ld hl,0d8c1h		;a076   ; apunta a el paso de lo de 0xD8C2 (20 pasos, p07:A012)
	inc (hl)			;a079   ; uno mas
	ret			;a07a
d8c1_paso_1:		; cuando el byte 5 de su ficha de 0xDC80 es 0xD8CD: sus bytes 3-5 a 0xD8CB, el paso siguiente, 0x20 cuadros y el sonido 0x19
	ld b,005h		;a07b   ; el byte 5 (su numero)
	call ficha_dc80		;a07d   ; ficha_dc80: HL = el byte B de la ficha 0xD8C2 - 1 de 0xDC80 (8 bytes cada una)
	ld a,(0d8cdh)		;a080   ; 0xD8CD...
	cp (hl)			;a083   ; ...distinto del byte 5: nada
	ret nz			;a084   ; aun no esta aqui
	call ficha_a_d8cb		;a085   ; ficha_a_d8cb: los bytes 3-5 de su ficha de 0xDC80 a 0xD8CB-0xD8CD
	call d8c1_siguiente		;a088   ; d8c1_siguiente: el paso siguiente de 0xD8C1
	ld hl,0d8c3h		;a08b   ; 0x20 cuadros
	ld (hl),020h		;a08e
	jp 06a58h		;a090   ; sonido_19: pide el sonido 0x19
ficha_a_d8cb:		; los bytes 3-5 de su ficha de 0xDC80 a 0xD8CB-0xD8CD
	ld b,003h		;a093   ; desde el byte 3
	call ficha_dc80		;a095   ; ficha_dc80: HL = el byte B de la ficha 0xD8C2 - 1 de 0xDC80 (8 bytes cada una)
	ld de,0d8cbh		;a098   ; apunta a la ultima entrada de la lista de 0xD8C2 (p07:A61D)
	ldi		;a09b   ; la ultima entrada...
	ldi		;a09d   ; ...la entrada...
	ldi		;a09f   ; ...y el numero
	ret			;a0a1
ficha_dc80:		; HL = el byte B de la ficha 0xD8C2 - 1 de 0xDC80 (8 bytes cada una)
	ld a,(0d8c2h)		;a0a2   ; lee la entrada de p07:AA83 junto a la que esta Snake (su numero, p07:A543)
	dec a			;a0a5   ; desde la ficha 0
	add a,a			;a0a6   ; * 8...
	add a,a			;a0a7
	add a,a			;a0a8
	add a,b			;a0a9   ; ...+ B
	ld hl,0dc80h		;a0aa   ; apunta a 10 fichas de 8 bytes de p57:8000 (p07:A985): [tipo][..][cuenta][ultima entrada][entrada][numero][llamada][..]
	jp 0423eh		;a0ad   ; suma_a_hl: HL = HL + A
d8c1_paso_2:		; al acabar la cuenta: p07:A5C3, el paso siguiente, 0xD4E9 = 1, p07:A83A y el sonido 0x16
	ld hl,0d8c3h		;a0b0   ; apunta a la cuenta de cuadros de los pasos de 0xD8C1
	dec (hl)			;a0b3   ; al acabar la cuenta
	ret nz			;a0b4
	call caracter_de_d8cf		;a0b5   ; caracter_de_d8cf: el caracter de la zona (p07:A5E9) en la Y y X de 0xD8CF
	call d8c1_siguiente		;a0b8   ; d8c1_siguiente: el paso siguiente de 0xD8C1
	ld a,001h		;a0bb   ; 0xD4E9 = 1
	ld (0d4e9h),a		;a0bd
	call guarda_fondo_d8c0		;a0c0   ; guarda_fondo_d8c0: p07:A896 y cuatro bloques de 16 x 16 de la pagina 0 a la 3: (0xC0, 0xE0), (0xC0, 0xF0), (0xF0, 0xE0) y (0xF0, 0xF0) a (0xA0-0xD0, 0xB0)
	jp 06a4ch		;a0c3   ; sonido_16: pide el sonido 0x16
d8c1_paso_3:		; 0xD8C9 sube de 2 en 2 (p07:A8D1) hasta 0x10; alli 0x40 cuadros, 0xD4E9 = 0 y el paso siguiente
	ld a,(0d8c9h)		;a0c6   ; lee lo separadas que estan las dos mitades (0-0x10, p07:A8D1)
	add a,002h		;a0c9   ; 2 mas...
	ld (0d8c9h),a		;a0cb   ; guarda lo separadas que estan las dos mitades (0-0x10, p07:A8D1)
	call pinta_d8c9		;a0ce   ; ...y pintado
	ld a,(0d8c9h)		;a0d1   ; lee lo separadas que estan las dos mitades (0-0x10, p07:A8D1)
	cp 010h		;a0d4   ; hasta 0x10
	ret nz			;a0d6   ; aun no
	ld a,040h		;a0d7   ; 0x40 cuadros
	ld (0d8c3h),a		;a0d9   ; guarda la cuenta de cuadros de los pasos de 0xD8C1
	xor a			;a0dc   ; 0xD4E9 = 0
	ld (0d4e9h),a		;a0dd   ; 0xD4E9 = 0
	jr d8c1_siguiente		;a0e0
d8c1_paso_4:		; con Snake dentro (p07:A129): p07:A40D, en la sala especial 0x18 sin nadie detras y sin la bandera 0x27, uno detras (0xCAA0 = 1, el bit 1 de 0xD7D4, fuera el 4 de 0xD7DE); p03:B4D1 y dos pasos mas; si no, al acabar la cuenta, el paso siguiente, 0xD4E9 = 1, p07:A862 y el sonido 0x16
	call snake_dentro		;a0e2   ; snake_dentro: acarreo con Snake hacia arriba (sin 0xCB21 = 0x0A u 0x0B), su Y en 0xD8C8 - 4 a 0xD8C8 - 1 y su X en 0xD8C7 a 0xD8C7 + 0x1F
	jr nc,d8c1_cuenta_4		;a0e5   ; fuera: la cuenta
	call snake_entra_en_d8c0		;a0e7   ; Snake dentro
	ld a,(0caa0h)		;a0ea   ; lee cuantos siguen a Snake por su rastro (1-4)
	or a			;a0ed
	jr nz,d8c1_dos_pasos		;a0ee   ; ya con alguien detras, no
	ld a,(0ca76h)		;a0f0   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 018h		;a0f3   ; solo en la sala especial 0x18
	jr nz,d8c1_dos_pasos		;a0f5   ; solo en la sala especial 0x18
	ld a,027h		;a0f7   ; la bandera 0x27
	call 08d7dh		;a0f9   ; la bandera 0x27...
	jr nz,d8c1_dos_pasos		;a0fc   ; ...puesta, no
	ld a,001h		;a0fe   ; uno detras
	ld (0caa0h),a		;a100   ; guarda cuantos siguen a Snake por su rastro (1-4)
	ld hl,0d7d4h		;a103
	set 1,(hl)		;a106   ; el bit 1 de 0xD7D4
	ld hl,0d7deh		;a108
	res 4,(hl)		;a10b   ; fuera el bit 4 de 0xD7DE
d8c1_dos_pasos:		; p03:B4D1...
	call 08d75h		;a10d   ; a_p03_b4d1: p03:B4D1 con el banco 3 en 0xA000
	call d8c1_siguiente		;a110   ; ...y dos pasos mas
	jp d8c1_siguiente		;a113   ; d8c1_siguiente: el paso siguiente de 0xD8C1
d8c1_cuenta_4:		; al acabar la cuenta...
	ld hl,0d8c3h		;a116   ; apunta a la cuenta de cuadros de los pasos de 0xD8C1
	dec (hl)			;a119   ; la cuenta...
	ret nz			;a11a   ; ...aun no
	call d8c1_siguiente		;a11b   ; ...el paso siguiente...
	ld a,001h		;a11e   ; ...0xD4E9 = 1
	ld (0d4e9h),a		;a120   ; 0xD4E9 = 1
	call repone_fondo_d8c0		;a123   ; repone_fondo_d8c0: 0x40 x 0x20 a 0 en (0xC0, 0xE0) y los cuatro bloques de vuelta de la pagina 3 a la 0
	jp 06a4ch		;a126   ; sonido_16: pide el sonido 0x16
snake_dentro:		; acarreo con Snake hacia arriba (sin 0xCB21 = 0x0A u 0x0B), su Y en 0xD8C8 - 4 a 0xD8C8 - 1 y su X en 0xD8C7 a 0xD8C7 + 0x1F
	ld a,(0cb0eh)		;a129   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	dec a			;a12c   ; solo hacia arriba
	jr nz,fuera_de_d8c7		;a12d   ; hacia otro lado, no
	ld a,(0cb21h)		;a12f   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	cp 00ah		;a132
	jr z,fuera_de_d8c7		;a134   ; con 0x0A...
	cp 00bh		;a136
	jr z,fuera_de_d8c7		;a138   ; ...u 0x0B en 0xCB21, no
	ld a,(0d8c8h)		;a13a   ; B = 0xD8C8, C = B - 4
	ld b,a			;a13d
	sub 004h		;a13e   ; C = la Y de 0xD8C8 - 4
	ld c,a			;a140
	ld a,(0cb03h)		;a141   ; lee la Y de Snake
	cp b			;a144   ; desde B, no
	ret nc			;a145   ; desde la Y de 0xD8C8, no
	cp c			;a146   ; por debajo de C, no
	jr c,fuera_de_d8c7		;a147
	ld a,(0d8c7h)		;a149   ; B = 0xD8C7, C = B + 0x20
	ld b,a			;a14c
	add a,020h		;a14d   ; C = la X + 0x20
	ld c,a			;a14f
	ld a,(0cb05h)		;a150   ; lee la X de Snake
	cp b			;a153   ; a la izquierda, no
	jr c,fuera_de_d8c7		;a154
	cp c			;a156   ; acarreo por debajo de C
	ret			;a157   ; acarreo dentro
fuera_de_d8c7:
	and a			;a158   ; sin acarreo
	ret			;a159
d8c1_paso_5:		; 0xD8C9 baja de 2 en 2 (p07:A8D1) hasta 0; alli el byte 6 de su ficha, 0xD4E9, 0xD8C1 y 0xD8C2 a cero
	ld a,(0d8c9h)		;a15a   ; lee lo separadas que estan las dos mitades (0-0x10, p07:A8D1)
	sub 002h		;a15d   ; 2 menos
	ld (0d8c9h),a		;a15f   ; guarda lo separadas que estan las dos mitades (0-0x10, p07:A8D1)
	call pinta_d8c9		;a162   ; pintado
	ld a,(0d8c9h)		;a165   ; lee lo separadas que estan las dos mitades (0-0x10, p07:A8D1)
	or a			;a168   ; hasta 0
	ret nz			;a169   ; hasta 0
	ld b,006h		;a16a   ; el byte 6 de su ficha...
	call ficha_dc80		;a16c   ; ficha_dc80: HL = el byte B de la ficha 0xD8C2 - 1 de 0xDC80 (8 bytes cada una)
	xor a			;a16f
	ld (hl),a			;a170   ; ...a cero
	ld (0d4e9h),a		;a171   ; 0xD4E9 = 0
	ld (0d8c1h),a		;a174   ; el paso 0...
	ld (0d8c2h),a		;a177   ; ...y sin 0xD8C2
	ret			;a17a
d8c1_paso_6:		; p07:A69A; por debajo del paso 0x0D, p07:A61D y, con 0xD8C4: 0xD8C9 = 0x10, 2 cuadros, el paso siguiente y el sonido 0x46
	call snake_sale_de_d8c0		;a17b   ; snake_sale_de_d8c0: con Snake hacia arriba en Y < 0x50 y X 0x58-0x68: 0xD8C0 = 0, a la sala B y al sitio de la entrada 0xD8CC de p07:AA0F (p07:A731), mirando abajo, 0xCA77 = 0, p03:B4D1, p07:A80B, 0xD8C9 = 0x10, p07:A83A, p07:A8D1, el paso de p07:A70F y los bytes 3-5 de su ficha de 0xDC80 = 0xD8CB-0xD8CD
	ld a,(0d8c1h)		;a17e   ; lee el paso de lo de 0xD8C2 (20 pasos, p07:A012)
	cp 00dh		;a181   ; desde el paso 0x0D...
	ret nc			;a183   ; desde el paso 0x0D, nada mas
	call botones_d8c4		;a184   ; botones_d8c4: 0xD8C4 = 0; con Snake en el estado 3 hacia arriba en Y 0x40-0x5B: en X 0x3C-0x47 (salvo zonas 0x11 y 0x12) y 0xD8CC distinto de 0, 0xD8C4 = 2; en X 0x77-0x7F con 0xD8CC por debajo de 0xD8CB, 0xD8C4 = 1
	ld a,(0d8c4h)		;a187   ; lee el boton pulsado dentro: 1 o 2 (p07:A61D)
	or a			;a18a   ; sin boton, nada
	ret z			;a18b   ; sin 0xD8C4, nada
	ld a,010h		;a18c   ; 0xD8C9 = 0x10
	ld (0d8c9h),a		;a18e   ; guarda lo separadas que estan las dos mitades (0-0x10, p07:A8D1)
	ld a,002h		;a191   ; 2 cuadros
	ld (0d8c3h),a		;a193   ; guarda la cuenta de cuadros de los pasos de 0xD8C1
	call d8c1_siguiente		;a196   ; d8c1_siguiente: el paso siguiente de 0xD8C1
	jp 06c33h		;a199   ; sonido_46: pide el sonido 0x46
d8c1_paso_7:		; cada 2 cuadros, 0xD8C9 baja 2 (p07:A8D1); a 0, 0x10 cuadros, 0xCA77 = 2 y el paso siguiente
	ld hl,0d8c3h		;a19c   ; apunta a la cuenta de cuadros de los pasos de 0xD8C1
	dec (hl)			;a19f   ; la cuenta...
	ret nz			;a1a0   ; ...cada 2 cuadros
	ld a,002h		;a1a1   ; otros 2
	ld (hl),a			;a1a3
	ld a,(0d8c9h)		;a1a4   ; 2 menos...
	sub 002h		;a1a7   ; 2 menos
	ld (0d8c9h),a		;a1a9   ; guarda lo separadas que estan las dos mitades (0-0x10, p07:A8D1)
	call pinta_d8c9		;a1ac   ; ...y pintado
	ld a,(0d8c9h)		;a1af   ; lee lo separadas que estan las dos mitades (0-0x10, p07:A8D1)
	or a			;a1b2
	ret nz			;a1b3   ; hasta 0
	ld a,010h		;a1b4   ; 0x10 cuadros
	ld (0d8c3h),a		;a1b6   ; guarda la cuenta de cuadros de los pasos de 0xD8C1
	ld a,002h		;a1b9   ; 0xCA77 = 2
	ld (0ca77h),a		;a1bb
	jp d8c1_siguiente		;a1be   ; d8c1_siguiente: el paso siguiente de 0xD8C1
d8c1_paso_8:		; al acabar la cuenta: 0x18 cuadros, p07:A918, el sonido 0x41 y el paso siguiente
	ld hl,0d8c3h		;a1c1   ; apunta a la cuenta de cuadros de los pasos de 0xD8C1
	dec (hl)			;a1c4   ; la cuenta...
	ret nz			;a1c5   ; ...aun no
	ld hl,0d8c3h		;a1c6   ; apunta a la cuenta de cuadros de los pasos de 0xD8C1
	ld (hl),018h		;a1c9   ; 0x18 cuadros
	call d8d2_destino		;a1cb   ; p07:A918
	call 06b1ah		;a1ce   ; el sonido 0x41
	jp d8c1_siguiente		;a1d1   ; d8c1_siguiente: el paso siguiente de 0xD8C1
d8c1_paso_9:		; sin 0xD8A0: p07:ABA2 y p07:A95D; a 8 de la cuenta, con 0xD8CD el siguiente en el sentido de 0xD8C4 (saltando el 0), el sonido 0x19; al acabar, 0xD8CD cambia uno en ese sentido y se pinta, p07:A248 y otra cuenta (0x18; 0x0C para 0xD8C2 4-6); al llegar a 0xD8D2, 8 cuadros, p07:AB9B y el paso siguiente
	ld a,(0d8a0h)		;a1d4
	or a			;a1d7
	ret nz			;a1d8   ; con 0xD8A0, nada
	call lineas_d8d1_2		;a1d9   ; lineas_d8d1_2: borra las de ahora, 0xD8D1 sigue (p07:AC0C) y las nuevas con el color 2
	call flecha_d8c4		;a1dc   ; flecha_d8c4: un caracter de 8 x 8 de la pagina 2: de (0xE8, 0xD0) a (0x78, 0x30) con 0xD8C4 = 1, de (0xE0, 0xD0) a (0x40, 0x30) si no; cada 4 cuadros, el de 0x10 mas abajo
	ld hl,0d8c3h		;a1df   ; la cuenta
	dec (hl)			;a1e2   ; la cuenta
	jr z,d8cd_cambia		;a1e3   ; al acabar, cambia
	ld a,(hl)			;a1e5
	cp 008h		;a1e6   ; a 8...
	ret nz			;a1e8   ; solo a 8
	ld a,(0d8c4h)		;a1e9   ; ...el sentido: 0xD8C4 = 1, -1; si no, +1
	ld b,0ffh		;a1ec   ; -1...
	dec a			;a1ee
	jr z,d8d2_mas_sentido		;a1ef
	ld b,001h		;a1f1   ; ...o +1
d8d2_mas_sentido:		; 0xD8D2 + el sentido
	ld a,(0d8d2h)		;a1f3   ; lee el numero de la entrada a la que va (p07:A918)
	add a,b			;a1f6
	or a			;a1f7   ; el 0...
	jr nz,mira_d8cd		;a1f8   ; el 0 se salta
	add a,b			;a1fa   ; ...se salta
mira_d8cd:
	ld hl,0d8cdh		;a1fb   ; apunta a el numero de la entrada en la que esta (sin el 0; lo pinta p01:71C2)
	cp (hl)			;a1fe   ; si es 0xD8CD, el sonido 0x19
	jp z,06a58h		;a1ff   ; sonido_19: pide el sonido 0x19
	ret			;a202
d8cd_cambia:		; el sentido: 0xD8C4 = 1, +1; si no, -1
	ld a,(0d8c4h)		;a203   ; lee el boton pulsado dentro: 1 o 2 (p07:A61D)
	ld b,001h		;a206   ; +1...
	dec a			;a208
	jr z,suma_sentido		;a209
	ld b,0ffh		;a20b   ; ...o -1
suma_sentido:
	ld hl,0d8cdh		;a20d   ; apunta a el numero de la entrada en la que esta (sin el 0; lo pinta p01:71C2)
	ld a,(hl)			;a210   ; 0xD8CD + el sentido...
	add a,b			;a211
	or a			;a212   ; el 0...
	jr nz,pon_d8cd		;a213   ; ...saltando el 0
	add a,b			;a215   ; ...se salta
pon_d8cd:
	ld (hl),a			;a216
	call 071c2h		;a217   ; el numero pintado (p01:71C2)
	call d8cd_13		;a21a   ; p07:A248
	ld a,(0d8a0h)		;a21d
	or a			;a220
	ret nz			;a221   ; con 0xD8A0, nada mas
	ld b,018h		;a222   ; 0x18 cuadros...
	ld a,(0d8c2h)		;a224   ; lee la entrada de p07:AA83 junto a la que esta Snake (su numero, p07:A543)
	cp 004h		;a227   ; 0xD8C2 4-6...
	jr c,pon_cuenta_d8c3		;a229
	cp 007h		;a22b   ; ...0x0C con 0xD8C2 4-6
	jr nc,pon_cuenta_d8c3		;a22d
	ld b,00ch		;a22f   ; ...0x0C
pon_cuenta_d8c3:
	ld hl,0d8c3h		;a231   ; apunta a la cuenta de cuadros de los pasos de 0xD8C1
	ld (hl),b			;a234   ; la cuenta
	ld a,(0d8cdh)		;a235   ; 0xD8CD...
	ld hl,0d8d2h		;a238   ; apunta a el numero de la entrada a la que va (p07:A918)
	cp (hl)			;a23b   ; ...sin llegar a 0xD8D2, nada mas
	ret nz			;a23c
	ld hl,0d8c3h		;a23d   ; 8 cuadros
	ld (hl),008h		;a240   ; 8 cuadros
	call lineas_d8d1_0		;a242   ; lineas_d8d1_0: las lineas de 0xD8D1 con el color 0
	jp d8c1_siguiente		;a245   ; d8c1_siguiente: el paso siguiente de 0xD8C1
d8cd_13:		; con 0xD8CD = 0x13, 0xD658, 0xD8C2 = 5 y 0xD8C4 = 1: 0xD8C4 = 2, p07:A918, el paso 0x0F, p07:AB96, 0x10 cuadros y el sonido 0x19
	ld a,(0d8cdh)		;a248   ; lee el numero de la entrada en la que esta (sin el 0; lo pinta p01:71C2)
	cp 013h		;a24b   ; solo en el 0x13
	ret nz			;a24d
	ld a,(0d658h)		;a24e   ; sin 0xD658, nada
	or a			;a251
	ret z			;a252
	ld a,(0d8c2h)		;a253   ; solo con 0xD8C2 = 5
	cp 005h		;a256
	ret nz			;a258
	ld a,(0d8c4h)		;a259   ; solo con 0xD8C4 = 1
	dec a			;a25c
	ret nz			;a25d
	ld a,002h		;a25e   ; 0xD8C4 = 2
	ld (0d8c4h),a		;a260   ; guarda el boton pulsado dentro: 1 o 2 (p07:A61D)
	call d8d2_destino		;a263   ; p07:A918
	ld a,00fh		;a266   ; el paso 0x0F
	ld (0d8c1h),a		;a268   ; guarda el paso de lo de 0xD8C2 (20 pasos, p07:A012)
	call d8d1_a_cero		;a26b   ; d8d1_a_cero: 0xD8D1 = 0
	ld hl,0d8c3h		;a26e   ; 0x10 cuadros
	ld (hl),010h		;a271   ; 0x10 cuadros
	jp 06a58h		;a273   ; sonido_19: pide el sonido 0x19
d8c1_paso_10:		; la cuenta; en los 4 ultimos cuadros R#18 tiembla (p07:A28D); al acabar, 0x20 cuadros, el paso siguiente, R#18 a 0 y el sonido 0x18
	ld hl,0d8c3h		;a276   ; apunta a la cuenta de cuadros de los pasos de 0xD8C1
	dec (hl)			;a279
	jr z,d8c1_fin_10		;a27a
	ld a,(hl)			;a27c   ; desde 5, nada
	cp 005h		;a27d   ; desde 5, nada
	ret nc			;a27f
	jr tiembla_r18		;a280   ; en los 4 ultimos, tiembla
d8c1_fin_10:		; 0x20 cuadros
	ld (hl),020h		;a282   ; 0x20 cuadros
	call d8c1_siguiente		;a284   ; d8c1_siguiente: el paso siguiente de 0xD8C1
	call r18_a_cero		;a287   ; r18_a_cero: R#18 = 0
	jp 06a54h		;a28a   ; sonido_18: pide el sonido 0x18
tiembla_r18:		; R#18 = 0xE0 en los cuadros pares de la cuenta, 0 en los impares
	ld a,(0d8c3h)		;a28d   ; lee la cuenta de cuadros de los pasos de 0xD8C1
	dec a			;a290
	ld b,0e0h		;a291   ; los pares, 0xE0
	rra			;a293
	jr c,pon_r18		;a294
r18_a_cero:		; R#18 = 0
	ld b,000h		;a296   ; los impares, 0
pon_r18:		; R#18 (el ajuste de la pantalla) = B
	ld c,012h		;a298   ; el registro 18 del VDP
	jp 00047h		;a29a   ; BIOS WRTVDP - Writes data in the VDP-register
d8c1_paso_11:		; la cuenta con p07:A61D; con 0xD8C4, el paso 8, 0x10 cuadros y el sonido 0x46; al acabar, 2 cuadros, el paso siguiente y el sonido 0x16
	ld hl,0d8c3h		;a29d   ; apunta a la cuenta de cuadros de los pasos de 0xD8C1
	dec (hl)			;a2a0   ; la cuenta
	jr z,d8c1_fin_11		;a2a1
	call botones_d8c4		;a2a3   ; p07:A61D
	ld a,(0d8c4h)		;a2a6   ; lee el boton pulsado dentro: 1 o 2 (p07:A61D)
	or a			;a2a9   ; sin boton, sigue
	ret z			;a2aa   ; sin 0xD8C4, nada
	ld a,008h		;a2ab   ; el paso 8
	ld (0d8c1h),a		;a2ad   ; guarda el paso de lo de 0xD8C2 (20 pasos, p07:A012)
	ld a,010h		;a2b0   ; 0x10 cuadros
	ld (0d8c3h),a		;a2b2   ; guarda la cuenta de cuadros de los pasos de 0xD8C1
	jp 06c33h		;a2b5   ; sonido_46: pide el sonido 0x46
d8c1_fin_11:		; 2 cuadros
	ld a,002h		;a2b8   ; 2 cuadros
	ld (0d8c3h),a		;a2ba   ; guarda la cuenta de cuadros de los pasos de 0xD8C1
	call d8c1_siguiente		;a2bd   ; d8c1_siguiente: el paso siguiente de 0xD8C1
	jp 06a4ch		;a2c0   ; sonido_16: pide el sonido 0x16
d8c1_paso_12:		; cada 2 cuadros, 0xD8C9 sube 2 (p07:A8D1); a 0x10, 0xCA77 = 1 y el paso 6
	ld hl,0d8c3h		;a2c3   ; apunta a la cuenta de cuadros de los pasos de 0xD8C1
	dec (hl)			;a2c6   ; cada 2 cuadros
	ret nz			;a2c7
	ld a,002h		;a2c8   ; otros 2
	ld (0d8c3h),a		;a2ca   ; guarda la cuenta de cuadros de los pasos de 0xD8C1
	ld a,(0d8c9h)		;a2cd   ; 2 mas...
	add a,002h		;a2d0   ; 2 mas
	ld (0d8c9h),a		;a2d2   ; guarda lo separadas que estan las dos mitades (0-0x10, p07:A8D1)
	call pinta_d8c9		;a2d5   ; ...y pintado
	ld a,(0d8c9h)		;a2d8   ; lee lo separadas que estan las dos mitades (0-0x10, p07:A8D1)
	cp 010h		;a2db   ; hasta 0x10
	ret nz			;a2dd   ; hasta 0x10
	ld a,001h		;a2de   ; 0xCA77 = 1
	ld (0ca77h),a		;a2e0   ; 0xCA77 = 1
	ld a,006h		;a2e3   ; el paso 6
	ld (0d8c1h),a		;a2e5   ; guarda el paso de lo de 0xD8C2 (20 pasos, p07:A012)
	ret			;a2e8
d8c1_paso_13:		; sin salir de la sala, 0xD8C9 baja 2 (p07:A8D1) hasta 0; saliendo, o a 0, todo a cero (p07:A2FF)
	ld a,(0ca41h)		;a2e9   ; lee la salida de la sala (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	or a			;a2ec   ; saliendo...
	jr nz,d8c1_todo_a_cero		;a2ed   ; saliendo: a cero
	ld a,(0d8c9h)		;a2ef   ; 2 menos...
	sub 002h		;a2f2   ; 2 menos
	ld (0d8c9h),a		;a2f4   ; guarda lo separadas que estan las dos mitades (0-0x10, p07:A8D1)
	call pinta_d8c9		;a2f7   ; ...y pintado
	ld a,(0d8c9h)		;a2fa   ; lee lo separadas que estan las dos mitades (0-0x10, p07:A8D1)
	or a			;a2fd
	ret nz			;a2fe   ; hasta 0
d8c1_todo_a_cero:		; el byte 6 de su ficha, 0xD8C1 y 0xD8C2 a cero, 0xD456 = 1 y p11:BDBD con 3
	ld b,006h		;a2ff
	call ficha_dc80		;a301   ; el byte 6 de su ficha...
	xor a			;a304   ; a cero
	ld (hl),a			;a305   ; ...a cero
	ld (0d8c1h),a		;a306   ; el paso 0...
	ld (0d8c2h),a		;a309   ; ...sin 0xD8C2
	inc a			;a30c   ; 0xD456 = 1
	ld (0d456h),a		;a30d   ; 0xD456 = 1
	ld c,003h		;a310   ; p11:BDBD con 3
	jp 08ddbh		;a312   ; a_p11_bdbd_3: p11:BDBD con el banco 11 en 0xA000
d8c1_paso_14:		; con Snake dentro (p07:A129): p07:A40D, con alguien detras p03:B4D1, y el paso 6
	call snake_dentro		;a315   ; snake_dentro: acarreo con Snake hacia arriba (sin 0xCB21 = 0x0A u 0x0B), su Y en 0xD8C8 - 4 a 0xD8C8 - 1 y su X en 0xD8C7 a 0xD8C7 + 0x1F
	ret nc			;a318   ; fuera, nada
	call snake_entra_en_d8c0		;a319   ; snake_entra_en_d8c0: 0xDFF8 = 0xD8C4 = 0xCB16 = 0, 0xD8C0 = 0xCA77 = 1; fuera las cosas, lo lanzado por Snake y los actores, p07:A470, los dibujos de p37:B845, los sprites, la pantalla de p07:A4A6, p07:AB96, los umbrales 0x40 y 0x81, y Snake en (0x50, 0x60) en el estado 0x0F mirando abajo
	ld a,(0caa0h)		;a31c   ; con alguien detras...
	or a			;a31f   ; con alguien detras...
	call nz,08d75h		;a320   ; ...p03:B4D1
	ld a,006h		;a323   ; el paso 6
	ld (0d8c1h),a		;a325   ; guarda el paso de lo de 0xD8C2 (20 pasos, p07:A012)
	ret			;a328
d8c1_paso_15:		; la cuenta: a 4 R#18 = 0xE0, a 2 R#18 = 0x20; al acabar, R#18 a 0, 0xCB5F = 0, 0xD8A0 = 1, 2 cuadros y el paso siguiente
	ld hl,0d8c3h		;a329   ; apunta a la cuenta de cuadros de los pasos de 0xD8C1
	dec (hl)			;a32c   ; la cuenta
	jr z,d8c1_fin_15		;a32d   ; al acabar, aparte
	ld a,(hl)			;a32f
	cp 004h		;a330   ; a 4...
	ld b,0e0h		;a332   ; ...0xE0
	jr z,r18_b		;a334   ; a 4: 0xE0
	cp 002h		;a336   ; a 2...
	ld b,020h		;a338   ; ...0x20
	jr z,r18_b		;a33a   ; a 2: 0x20
	or a			;a33c
	ret nz			;a33d   ; los demas, nada
d8c1_fin_15:		; R#18 a 0
	call r18_a_cero		;a33e   ; r18_a_cero: R#18 = 0
	xor a			;a341   ; 0xCB5F = 0...
	ld (0cb5fh),a		;a342   ; 0xCB5F = 0
	inc a			;a345   ; ...0xD8A0 = 1
	ld (0d8a0h),a		;a346   ; 0xD8A0 = 1
	ld hl,0d8c3h		;a349   ; 2 cuadros
	ld (hl),002h		;a34c   ; 2 cuadros
	jp d8c1_siguiente		;a34e   ; d8c1_siguiente: el paso siguiente de 0xD8C1
r18_b:		; R#18 = B
	ld c,012h		;a351   ; el registro 18
	jp 00047h		;a353   ; BIOS WRTVDP - Writes data in the VDP-register
d8c1_paso_16:		; con 0xD88A a 0xFF y 0xD69C: la primera vez, 0xCB5F = 1 y los sonidos 5 y 0x8A; R#18 tiembla (p07:A39D), p07:ABA2 y, cada 2 cuadros, 0xD8CD uno menos (pintado) hasta 0xD8D2; alli R#18 a 0, p07:AB9B, 8 cuadros, el sonido 0x87 y el paso siguiente
	ld a,(0d88ah)		;a356
	cp 0ffh		;a359   ; 0xD88A a 0xFF...
	ret nz			;a35b   ; sin 0xD88A a 0xFF, nada
	ld a,(0d69ch)		;a35c
	or a			;a35f   ; ...y 0xD69C
	ret z			;a360   ; sin 0xD69C, nada
	ld hl,0cb5fh		;a361   ; la primera vez...
	ld a,(hl)			;a364
	or a			;a365   ; la primera vez
	jr nz,d8c1_baja		;a366
	ld (hl),001h		;a368   ; ...0xCB5F = 1...
	call 06b12h		;a36a   ; ...el sonido 5...
	call 06caah		;a36d   ; ...y el 0x8A
d8c1_baja:		; R#18 tiembla
	call tiembla_f0		;a370   ; tiembla_f0: R#18 = 0xF0 en los cuadros impares de la cuenta, 0 en los pares
	call lineas_d8d1_2		;a373   ; p07:ABA2
	ld hl,0d8c3h		;a376   ; apunta a la cuenta de cuadros de los pasos de 0xD8C1
	dec (hl)			;a379   ; cada 2 cuadros...
	ret nz			;a37a
	ld (hl),002h		;a37b   ; otros 2
	ld hl,0d8cdh		;a37d   ; 0xD8CD uno menos...
	dec (hl)			;a380   ; ...uno menos
	call 071c2h		;a381   ; ...y pintado
	ld hl,0d8cdh		;a384   ; apunta a el numero de la entrada en la que esta (sin el 0; lo pinta p01:71C2)
	ld a,(0d8d2h)		;a387   ; sin llegar a 0xD8D2, nada mas
	cp (hl)			;a38a   ; hasta 0xD8D2
	ret nz			;a38b
	call r18_a_cero		;a38c   ; R#18 a 0
	call lineas_d8d1_0		;a38f   ; lineas_d8d1_0: las lineas de 0xD8D1 con el color 0
	ld hl,0d8c3h		;a392   ; 8 cuadros
	ld (hl),008h		;a395   ; 8 cuadros
	call 06c97h		;a397   ; el sonido 0x87
	jp d8c1_siguiente		;a39a   ; d8c1_siguiente: el paso siguiente de 0xD8C1
tiembla_f0:		; R#18 = 0xF0 en los cuadros impares de la cuenta, 0 en los pares
	ld a,(0d8c3h)		;a39d   ; lee la cuenta de cuadros de los pasos de 0xD8C1
	ld b,0f0h		;a3a0   ; los impares, 0xF0
	rra			;a3a2
	jp c,pon_r18		;a3a3   ; pon_r18: R#18 (el ajuste de la pantalla) = B
	jp r18_a_cero		;a3a6   ; r18_a_cero: R#18 = 0
d8c1_paso_17:		; R#18 tiembla (0xE0 / 0x20); al acabar, R#18 a 0, 0x20 cuadros, la pantalla y los sprites apagados y el paso siguiente
	call tiembla_e0_20		;a3a9   ; tiembla_e0_20: R#18 = 0xE0 en los cuadros impares, 0x20 en los pares
	ld hl,0d8c3h		;a3ac   ; apunta a la cuenta de cuadros de los pasos de 0xD8C1
	dec (hl)			;a3af   ; la cuenta
	ret nz			;a3b0
	call r18_a_cero		;a3b1   ; R#18 a 0
	ld hl,0d8c3h		;a3b4   ; 0x20 cuadros
	ld (hl),020h		;a3b7   ; 0x20 cuadros
	call 045f1h		;a3b9   ; pantalla apagada
	jp d8c1_siguiente		;a3bc   ; d8c1_siguiente: el paso siguiente de 0xD8C1
tiembla_e0_20:		; R#18 = 0xE0 en los cuadros impares, 0x20 en los pares
	ld a,(0d8c3h)		;a3bf   ; lee la cuenta de cuadros de los pasos de 0xD8C1
	rra			;a3c2
	ld b,0e0h		;a3c3   ; los impares, 0xE0...
	jr c,pon_r18_b		;a3c5
	ld b,020h		;a3c7   ; ...los pares, 0x20
pon_r18_b:
	ld c,012h		;a3c9   ; el registro 18
	jp 00047h		;a3cb   ; BIOS WRTVDP - Writes data in the VDP-register
d8c1_paso_18:		; con la pantalla apagada, la cuenta; al acabar, 0xD8C9 = 0x10 (pintado), 0xCABD = 0, la paleta de p56:BC9E, todo encendido, el sonido 0x69, 0xCB5F = 0 y el paso siguiente
	call 045f1h		;a3ce   ; apaga_pantalla_y_sprites: p00:45CC y p00:45F6
	ld hl,0d8c3h		;a3d1   ; apunta a la cuenta de cuadros de los pasos de 0xD8C1
	dec (hl)			;a3d4   ; la cuenta...
	ret nz			;a3d5   ; ...aun no
	ld a,010h		;a3d6   ; 0xD8C9 = 0x10...
	ld (0d8c9h),a		;a3d8   ; guarda lo separadas que estan las dos mitades (0-0x10, p07:A8D1)
	call pinta_d8c9		;a3db   ; ...y pintado
	ld hl,0cabdh		;a3de   ; 0xCABD = 0
	ld (hl),000h		;a3e1
	call 08529h		;a3e3   ; la paleta
	call 04606h		;a3e6   ; todo encendido
	call 06cd6h		;a3e9   ; el sonido 0x69
	xor a			;a3ec
	ld (0cb5fh),a		;a3ed   ; 0xCB5F = 0
	jp d8c1_siguiente		;a3f0   ; d8c1_siguiente: el paso siguiente de 0xD8C1
d8c1_paso_19:		; con 0xCABD, a cero y la paleta de p56:BC9E; 0xCB57 = 0 y, con 0xD69C, p07:A69A; sin el, 0xCB57 = 1
	ld hl,0cabdh		;a3f3   ; con 0xCABD...
	ld a,(hl)			;a3f6
	or a			;a3f7
	jr z,mira_d69c		;a3f8
	ld (hl),000h		;a3fa   ; 0xCABD = 0...
	call 08529h		;a3fc   ; ...y la paleta
mira_d69c:
	ld hl,0cb57h		;a3ff
	ld (hl),000h		;a402   ; 0xCB57 = 0
	ld a,(0d69ch)		;a404
	or a			;a407   ; con 0xD69C...
	jp nz,snake_sale_de_d8c0		;a408   ; con 0xD69C, p07:A69A
	inc (hl)			;a40b   ; si no, 0xCB57 = 1
	ret			;a40c
snake_entra_en_d8c0:		; 0xDFF8 = 0xD8C4 = 0xCB16 = 0, 0xD8C0 = 0xCA77 = 1; fuera las cosas, lo lanzado por Snake y los actores, p07:A470, los dibujos de p37:B845, los sprites, la pantalla de p07:A4A6, p07:AB96, los umbrales 0x40 y 0x81, y Snake en (0x50, 0x60) en el estado 0x0F mirando abajo
	xor a			;a40d   ; 0xDFF8 = 0...
	ld (0dff8h),a		;a40e   ; guarda con el, la caja de 0xDFFD/0xDFFE choca (p07:B149)
	ld (0d8c4h),a		;a411   ; guarda el boton pulsado dentro: 1 o 2 (p07:A61D)
	ld (0cb16h),a		;a414   ; sin darse la vuelta
	inc a			;a417   ; A = 1
	ld (0d8c0h),a		;a418   ; 0xD8C0 = 1...
	ld (0ca77h),a		;a41b   ; ...0xCA77 = 1
	ld hl,0d7c0h		;a41e   ; las cosas de la sala a cero
	ld bc,0000fh		;a421   ; 16 bytes
	call 04236h		;a424   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	call borra_df80		;a427   ; 0xDF80-0xDFBF a cero
	ld hl,0cb80h		;a42a   ; lo lanzado por Snake a cero
	ld bc,0005fh		;a42d   ; 0x60 bytes
	call 04236h		;a430   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	call alerta_fuera_d8c2		;a433   ; p07:A470
	call 08578h		;a436   ; los dibujos de p37:B845
	call 0875dh		;a439   ; los actores a cero
	call 059efh		;a43c   ; los sprites
	call pantalla_d8c0		;a43f   ; la pantalla
	call d8d1_a_cero		;a442   ; p07:AB96
	ld hl,0ca4eh		;a445   ; los umbrales de los caracteres: 0x40...
	ld (hl),040h		;a448   ; los de abajo, 0x40
	inc hl			;a44a
	ld (hl),081h		;a44b   ; ...y 0x81
	ld a,050h		;a44d   ; Snake en Y = 0x50...
	ld (0cb03h),a		;a44f   ; guarda la Y de Snake
	ld a,060h		;a452   ; ...X = 0x60...
	ld (0cb05h),a		;a454   ; guarda la X de Snake
	ld a,00fh		;a457   ; ...en el estado 0x0F
	ld (0cb00h),a		;a459   ; guarda el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	ld a,(0cb31h)		;a45c   ; el dibujo 0 (2 en el estado 2)
	or a			;a45f   ; en el estado 2...
	jr z,pon_dibujo_snake		;a460
	ld a,002h		;a462   ; ...el dibujo 2
pon_dibujo_snake:
	ld (0cb01h),a		;a464   ; guarda el dibujo de Snake (al darse la vuelta se le suma 1, 3 o 5 segun 0xCB00)
	ld a,002h		;a467   ; hacia abajo
	ld (0cb0eh),a		;a469   ; guarda la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ld (0cb0dh),a		;a46c   ; guarda la direccion pedida con el mando (1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ret			;a46f
alerta_fuera_d8c2:		; con alerta, la quita (p01:7CAF y p02:8D8B) con 0xD8C2 = 5 (con 0xD658, fuera de la zona 0x0D) o 9 (en la zona 0x0A)
	ld a,(0d8c2h)		;a470   ; lee la entrada de p07:AA83 junto a la que esta Snake (su numero, p07:A543)
	cp 005h		;a473   ; el 5...
	jr nz,d8c2_9		;a475   ; el 9
	ld a,(0d658h)		;a477
	or a			;a47a   ; ...con 0xD658
	ret z			;a47b   ; sin 0xD658, nada
	ld a,(0ca4ah)		;a47c   ; lee la zona
	cp 00dh		;a47f   ; la zona 0x0D...
	ret z			;a481   ; en la zona 0x0D, nada
	ld a,(0ca5fh)		;a482   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	or a			;a485   ; con alerta, se quita
	ret z			;a486   ; sin alerta, nada
quita_la_alerta:
	call 07cafh		;a487   ; quita_ca5f_bancos_7:
	jp 08d8bh		;a48a   ; p02:8D8B
d8c2_9:
	cp 009h		;a48d   ; el 9...
	ret nz			;a48f   ; ni el 5 ni el 9, nada
	ld a,(0ca4ah)		;a490   ; lee la zona
	cp 00ah		;a493   ; ...en la zona 0x0A...
	ret nz			;a495   ; solo en la zona 0x0A
	ld a,(0ca5fh)		;a496   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	or a			;a499   ; ...con alerta, se quita
	ret z			;a49a   ; sin alerta, nada
	jr quita_la_alerta		;a49b
borra_df80:		; 0xDF80-0xDFBF a cero
	ld hl,0df80h		;a49d   ; apunta a 8 fichas de 8 bytes [tipo][dibujo][Y][X][fila][columna][espera][grafico] que suenan 0x14 en la sala y 0x15 al lado
	ld bc,0003fh		;a4a0   ; 0x40 bytes
	jp 04236h		;a4a3   ; borra_bloque: pone a cero BC + 1 bytes desde HL
pantalla_d8c0:		; sin sprites, las paginas 0 y 1 a cero, p06:AB91, el marcador, la paleta de p56:BBF2, el mosaico de p37:BE74, p07:A83A, sin 0xD8A0 p07:A8C3, el numero 0xD8CD, la pagina a la vista; sin el bit 7 de 0xD7D5, la ficha 0xE248 a cero; y los sprites encendidos
	call 045f6h		;a4a6   ; apaga_sprites: R#8 con el bit 1 (SPD) a uno, desde la copia 0xFFE7
	xor a			;a4a9   ; la pagina 0...
	call 04452h		;a4aa   ; borra_pantalla_de: 0xC0 x 0xC0 puntos a 0 en la pagina A
	ld a,001h		;a4ad   ; ...y la 1 a cero
	call 04452h		;a4af   ; borra_pantalla_de: 0xC0 x 0xC0 puntos a 0 en la pagina A
	call 08281h		;a4b2   ; p06:AB91
	call 05470h		;a4b5   ; el marcador y la ventana
	ld a,(0ca42h)		;a4b8   ; la otra pagina...
	xor 001h		;a4bb   ; la otra
	ld (0ca42h),a		;a4bd   ; guarda la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	call 0547ch		;a4c0   ; ...el marcador tambien
	call 08524h		;a4c3   ; la paleta
	call 071a2h		;a4c6   ; el mosaico de p37:BE74
	call guarda_fondo_d8c0		;a4c9   ; p07:A83A
	ld a,(0d8a0h)		;a4cc   ; sin 0xD8A0...
	or a			;a4cf   ; con 0xD8A0, sin p07:A8C3
	call z,borra_502d		;a4d0   ; ...p07:A8C3
	call 071c2h		;a4d3   ; el numero 0xD8CD
	ld a,(0ca42h)		;a4d6   ; la pagina a la vista
	call 04879h		;a4d9   ; pon_pagina_visible: la pagina A a la vista (0xFAF5, DPPAGE de la BIOS)
	ld a,(0d7d5h)		;a4dc
	bit 7,a		;a4df   ; con el bit 7 de 0xD7D5 se queda...
	jr nz,sprites_d8c0		;a4e1
	ld hl,0e248h		;a4e3   ; ...si no, la ficha 0xE248 a cero
	ld (hl),000h		;a4e6   ; la ficha 0xE248 libre
sprites_d8c0:
	jp 04609h		;a4e8   ; enciende_sprites: R#8 con el bit 1 (SPD) a cero, desde la copia 0xFFE7
d8c1_al_pintar:		; con 0xCB21 = 2 solo fuera de la sala especial 0x2A y sin 0xCB62; desde el paso 1 (en el 1, p07:A5D7) p07:A8D1
	ld a,(0cb21h)		;a4eb   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	cp 002h		;a4ee   ; 0xCB21 = 2...
	jr nz,d8c1_pinta		;a4f0   ; sin 0xCB21 = 2, sigue
	ld a,(0ca76h)		;a4f2   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 02ah		;a4f5   ; ...en la sala especial 0x2A, nada
	ret z			;a4f7   ; en la sala especial 0x2A, nada
	ld a,(0cb62h)		;a4f8
	or a			;a4fb   ; ...con 0xCB62, nada
	ret nz			;a4fc   ; con 0xCB62, nada
d8c1_pinta:
	ld a,(0d8c1h)		;a4fd   ; lee el paso de lo de 0xD8C2 (20 pasos, p07:A012)
	or a			;a500   ; en el paso 0, nada
	ret z			;a501   ; en el paso 0, nada
	cp 001h		;a502   ; en el 1...
	call z,caracter_b_de_d8cf		;a504   ; ...p07:A5D7
	jp pinta_d8c9		;a507   ; pinta_d8c9: las dos mitades separadas 0xD8C9: la de (0xF0 - 0xD8C9, 0xE5) a la X de 0xD8C7 + 0x10 y la de (0xC0 + 0xD8C9, 0xE5) a la X de 0xD8C7
busca_ficha_aa83:		; con Snake en el estado 3 hacia arriba: las fichas de p07:AA83 (8 bytes: zona, sala, numero, Y, X y 3 bytes) hasta la que pone 0xD8C2 (p07:A543); con el 3, sin 0xD4F3 ni el bit 1 de 0xD7D4, otra vez a 0
	ld a,(0cb00h)		;a50a   ; lee el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	cp 003h		;a50d   ; solo en el estado 3...
	ret nz			;a50f   ; fuera del estado 3, nada
	ld a,(0cb0eh)		;a510   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	dec a			;a513   ; ...hacia arriba
	ret nz			;a514   ; hacia otro lado, nada
	ld hl,0aa83h		;a515   ; las entradas de p07:AA83
ficha_aa83:
	ld a,(hl)			;a518
	cp 0ffh		;a519   ; 0xFF: se acaba
	ret z			;a51b   ; 0xFF: ninguna
	push hl			;a51c
	call mira_ficha_aa83		;a51d   ; la mira
	pop hl			;a520
	ld a,(0d8c2h)		;a521   ; con 0xD8C2 puesto, ya esta
	or a			;a524
	jr nz,d8c2_puesto		;a525   ; encontrada
	ld de,00008h		;a527   ; la siguiente (8 bytes)
	add hl,de			;a52a
	jr ficha_aa83		;a52b   ; la siguiente
d8c2_puesto:
	ld a,(0d8c2h)		;a52d   ; lee la entrada de p07:AA83 junto a la que esta Snake (su numero, p07:A543)
	cp 003h		;a530   ; solo el 3
	ret nz			;a532   ; solo el 3...
	ld a,(0d4f3h)		;a533
	or a			;a536   ; con 0xD4F3, se queda
	ret nz			;a537   ; ...sin 0xD4F3...
	ld a,(0d7d4h)		;a538
	bit 1,a		;a53b   ; con el bit 1 de 0xD7D4, se queda
	ret nz			;a53d   ; ...ni el bit 1 de 0xD7D4...
	xor a			;a53e   ; ...se quita
	ld (0d8c2h),a		;a53f   ; guarda la entrada de p07:AA83 junto a la que esta Snake (su numero, p07:A543)
	ret			;a542
mira_ficha_aa83:		; en su zona y sala (0xFF: la sala especial 0x18 en la sala 1; 0xFE: la especial 0x2E), con Snake (Y - 0x1C, X + 4) dentro de 16 x 16 desde su Y y X: 0xD8C2 = su numero (no el 5 con el bit 5 de 0xD7E2), 0xD8CF-0xD8D0 = su Y y X y sus 3 ultimos bytes a 0xD8C6
	ld a,(0ca4ah)		;a543   ; lee la zona
	cp (hl)			;a546   ; su zona
	ret nz			;a547   ; otra zona, nada
	inc hl			;a548
	ld a,(hl)			;a549   ; su sala
	cp 0ffh		;a54a   ; 0xFF...
	jr z,sala_ff		;a54c
	cp 0feh		;a54e   ; ...0xFE...
	jr z,sala_fe		;a550
	jr sala_aa83		;a552   ; ...o la sala
sala_ff:
	ld a,(0ca76h)		;a554   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 018h		;a557   ; la especial 0x18...
	ret nz			;a559   ; la especial 0x18...
	ld a,(0ca4bh)		;a55a   ; lee la sala de la zona
	dec a			;a55d   ; ...en la sala 1
	ret nz			;a55e   ; ...en la sala 1
	jr numero_aa83		;a55f
sala_fe:
	ld a,(0ca76h)		;a561   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 02eh		;a564   ; la especial 0x2E
	ret nz			;a566   ; la especial 0x2E
	jr numero_aa83		;a567
sala_aa83:
	ld a,(0ca4bh)		;a569   ; lee la sala de la zona
	cp (hl)			;a56c   ; la sala
	ret nz			;a56d
numero_aa83:
	inc hl			;a56e
	ld a,(0d8c2h)		;a56f   ; ya es la de 0xD8C2, nada
	cp (hl)			;a572   ; la misma: nada
	ret z			;a573
	ld b,(hl)			;a574   ; B = su numero
	inc hl			;a575
	ld a,(hl)			;a576   ; su Y a 0xD8CF
	ld (0d8cfh),a		;a577   ; guarda la Y de la entrada de p07:AA83 (p07:A577)
	ld a,(0cb03h)		;a57a   ; la Y de Snake - 0x1C...
	sub 01ch		;a57d   ; la Y de Snake - 0x1C...
	cp (hl)			;a57f   ; ...por encima, nada
	ret c			;a580   ; ...por encima: nada
	ld a,(hl)			;a581   ; ...hasta su Y + 0x10
	add a,010h		;a582   ; la Y + 0x10
	ld c,a			;a584
	ld a,(0cb03h)		;a585   ; lee la Y de Snake
	sub 01ch		;a588
	cp c			;a58a
	ret nc			;a58b   ; por debajo: nada
	inc hl			;a58c
	ld a,(hl)			;a58d   ; su X a 0xD8D0
	ld (0d8d0h),a		;a58e   ; guarda la X de la entrada de p07:AA83 (p07:A58E)
	ld a,(0cb05h)		;a591   ; la X de Snake + 4...
	add a,004h		;a594   ; la X de Snake + 4...
	cp (hl)			;a596   ; ...a la izquierda, nada
	ret c			;a597   ; ...a la izquierda: nada
	ld a,(hl)			;a598   ; ...hasta su X + 0x10
	add a,010h		;a599   ; la X + 0x10
	ld c,a			;a59b
	ld a,(0cb05h)		;a59c   ; lee la X de Snake
	add a,004h		;a59f
	cp c			;a5a1
	ret nc			;a5a2   ; a la derecha: nada
	ld a,b			;a5a3   ; 0xD8C2 = B
	ld (0d8c2h),a		;a5a4   ; guarda la entrada de p07:AA83 junto a la que esta Snake (su numero, p07:A543)
	ld a,(0d7e2h)		;a5a7
	bit 5,a		;a5aa   ; con el bit 5 de 0xD7E2...
	jr z,aa83_a_d8c6		;a5ac   ; sin el bit 5 de 0xD7E2, se queda
	ld a,b			;a5ae
	cp 005h		;a5af   ; ...el 5...
	jr nz,aa83_a_d8c6		;a5b1   ; el 5 con el bit 5: no
	xor a			;a5b3   ; ...no vale
	ld (0d8c2h),a		;a5b4   ; guarda la entrada de p07:AA83 junto a la que esta Snake (su numero, p07:A543)
	ret			;a5b7
aa83_a_d8c6:
	inc hl			;a5b8
	ld de,0d8c6h		;a5b9   ; 3 bytes a 0xD8C6
	ldi		;a5bc   ; la Y...
	ldi		;a5be   ; ...la X...
	ldi		;a5c0   ; ...y la Y de entrada
	ret			;a5c2
caracter_de_d8cf:		; el caracter de la zona (p07:A5E9) en la Y y X de 0xD8CF
	call caracter_de_la_zona		;a5c3   ; caracter_de_la_zona: HL = el sitio en la pagina 2 del caracter de la zona: (0x70, 0x28) en las 0x12-0x13, (0xE8, 0x78) en las 0x0C-0x0E, (0x70, 0xA8) en la 0x0B, (0x70, 0xF8) en la 0x0A, (0xA8, 0x30) en la 8 y (0xC8, 0xF0), o (0xD0, 0xF0) con 0xD8C2 distinto de 1, en las demas
caracter_en_d8cf:		; E = la Y, D = la X
	ld de,(0d8cfh)		;a5c6   ; lee la Y de la entrada de p07:AA83 (p07:A577) y el byte siguiente (16 bits)
	ld a,(0ca42h)		;a5ca   ; la pagina 2 a la de dibujo
	rlca			;a5cd   ; la pagina de dibujo de destino...
	rlca			;a5ce
	or 002h		;a5cf   ; ...y la 2 de origen
	ld bc,00808h		;a5d1   ; 8 x 8
	jp 04767h		;a5d4   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
caracter_b_de_d8cf:		; el de al lado: 0x10 a la derecha (8 desde la zona 7)
	call caracter_de_la_zona		;a5d7   ; caracter_de_la_zona: HL = el sitio en la pagina 2 del caracter de la zona: (0x70, 0x28) en las 0x12-0x13, (0xE8, 0x78) en las 0x0C-0x0E, (0x70, 0xA8) en la 0x0B, (0x70, 0xF8) en la 0x0A, (0xA8, 0x30) en la 8 y (0xC8, 0xF0), o (0xD0, 0xF0) con 0xD8C2 distinto de 1, en las demas
	ld a,(0ca4ah)		;a5da   ; lee la zona
	cp 007h		;a5dd   ; por debajo de la zona 7...
	ld a,010h		;a5df   ; ...0x10...
	jr c,mas_h		;a5e1
	ld a,008h		;a5e3   ; ...si no, 8
mas_h:
	add a,h			;a5e5   ; a la derecha
	ld h,a			;a5e6
	jr caracter_en_d8cf		;a5e7
caracter_de_la_zona:		; HL = el sitio en la pagina 2 del caracter de la zona: (0x70, 0x28) en las 0x12-0x13, (0xE8, 0x78) en las 0x0C-0x0E, (0x70, 0xA8) en la 0x0B, (0x70, 0xF8) en la 0x0A, (0xA8, 0x30) en la 8 y (0xC8, 0xF0), o (0xD0, 0xF0) con 0xD8C2 distinto de 1, en las demas
	ld a,(0ca4ah)		;a5e9   ; lee la zona
	ld hl,07028h		;a5ec   ; (0x70, 0x28)...
	cp 012h		;a5ef
	ret z			;a5f1   ; ...la zona 0x12...
	cp 013h		;a5f2
	ret z			;a5f4   ; ...y la 0x13
	ld hl,0e878h		;a5f5   ; (0xE8, 0x78)...
	cp 00ch		;a5f8
	ret z			;a5fa   ; ...las 0x0C...
	cp 00dh		;a5fb
	ret z			;a5fd   ; ...0x0D...
	cp 00eh		;a5fe
	ret z			;a600   ; ...y 0x0E
	ld hl,070a8h		;a601   ; (0x70, 0xA8): la 0x0B
	cp 00bh		;a604
	ret z			;a606
	ld l,0f8h		;a607   ; (0x70, 0xF8): la 0x0A
	cp 00ah		;a609
	ret z			;a60b
	ld hl,0a830h		;a60c   ; (0xA8, 0x30): la 8
	cp 008h		;a60f
	ret z			;a611
	ld hl,0c8f0h		;a612   ; las demas: (0xC8, 0xF0)...
	ld a,(0d8c2h)		;a615   ; lee la entrada de p07:AA83 junto a la que esta Snake (su numero, p07:A543)
	dec a			;a618
	ret z			;a619   ; ...con el 1...
	ld h,0d0h		;a61a   ; ...si no, (0xD0, 0xF0)
	ret			;a61c
botones_d8c4:		; 0xD8C4 = 0; con Snake en el estado 3 hacia arriba en Y 0x40-0x5B: en X 0x3C-0x47 (salvo zonas 0x11 y 0x12) y 0xD8CC distinto de 0, 0xD8C4 = 2; en X 0x77-0x7F con 0xD8CC por debajo de 0xD8CB, 0xD8C4 = 1
	xor a			;a61d   ; sin boton
	ld (0d8c4h),a		;a61e   ; guarda el boton pulsado dentro: 1 o 2 (p07:A61D)
	ld a,(0cb00h)		;a621   ; solo en el estado 3...
	cp 003h		;a624
	ret nz			;a626   ; fuera del estado 3, nada
	ld a,(0cb0eh)		;a627   ; ...hacia arriba...
	dec a			;a62a
	ret nz			;a62b   ; hacia otro lado, nada
	ld a,(0cb03h)		;a62c   ; ...en Y 0x40-0x5B
	cp 040h		;a62f
	ret c			;a631   ; por encima de 0x40, nada
	cp 05ch		;a632
	ret nc			;a634   ; desde 0x5C, nada
	ld a,(0cb05h)		;a635   ; por debajo de X = 0x3C, nada
	cp 03ch		;a638
	ret c			;a63a   ; a la izquierda de 0x3C, nada
	cp 048h		;a63b   ; en 0x3C-0x47
	jr c,boton_izquierdo		;a63d   ; 0x3C-0x47: el de la izquierda
	cp 077h		;a63f   ; en 0x77-0x7F...
	ret c			;a641   ; 0x48-0x76, nada
	cp 080h		;a642
	ret nc			;a644   ; desde 0x80, nada
	ld hl,0d8cbh		;a645   ; ...con 0xD8CC por debajo de 0xD8CB...
	ld a,(0d8cch)		;a648   ; lee la entrada de la lista de 0xD8C2 en la que esta (p07:AA0F)
	cp (hl)			;a64b
	ret nc			;a64c   ; en la ultima, nada
	ld a,001h		;a64d   ; ...0xD8C4 = 1
	ld (0d8c4h),a		;a64f   ; guarda el boton pulsado dentro: 1 o 2 (p07:A61D)
	ret			;a652
boton_izquierdo:
	ld a,(0ca4ah)		;a653   ; lee la zona
	cp 012h		;a656   ; en las zonas 0x12...
	ret z			;a658   ; en la 0x12, nada
	cp 011h		;a659
	ret z			;a65b   ; ...y 0x11, no
	ld a,(0d8cch)		;a65c   ; lee la entrada de la lista de 0xD8C2 en la que esta (p07:AA0F)
	or a			;a65f   ; en la 0, nada
	ret z			;a660   ; con 0xD8CC a 0, no
	ld a,002h		;a661   ; 0xD8C4 = 2
	ld (0d8c4h),a		;a663   ; guarda el boton pulsado dentro: 1 o 2 (p07:A61D)
	ret			;a666
d8cd_de_la_zona:		; 0xD8CD = el de la zona en p07:A686; en la zona 6, 0xFF en la sala 0x23 y 0xFE en las demas
	ld a,(0ca4ah)		;a667   ; lee la zona
	cp 006h		;a66a
	jr z,d8cd_zona_6		;a66c   ; la zona 6, aparte
	ld hl,0a686h		;a66e   ; el de la zona
	call 04248h		;a671   ; byte_de_tabla: A = el byte A de la tabla de HL (y HL apunta a el)
	ld (0d8cdh),a		;a674   ; guarda el numero de la entrada en la que esta (sin el 0; lo pinta p01:71C2)
	ret			;a677
d8cd_zona_6:
	ld a,(0ca4bh)		;a678   ; lee la sala de la zona
	cp 023h		;a67b
	ld a,0ffh		;a67d   ; 0xFF en la sala 0x23...
	jr z,pon_d8cd_zona		;a67f
	dec a			;a681   ; ...0xFE en las demas
pon_d8cd_zona:
	ld (0d8cdh),a		;a682   ; guarda el numero de la entrada en la que esta (sin el 0; lo pinta p01:71C2)
	ret			;a685

; ----------------------------------------------------------------------
; DATOS resto_A686: lo apuntan con el banco puesto p07:A66E (0xA686); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p07:A66E (20 bytes)
;   0xa686..0xa69a  (20 bytes)
DATA_resto_A686:
	defb 000h,001h,002h,003h,004h,0ffh,0feh,001h,0fdh,001h,001h,001h,00ah,014h,01eh,01fh	; a686  ................
	defb 001h,001h,0fdh,0ffh	; a696

; ======================================================================
; CODIGO 0xa69a..0xaa0f  (885 bytes)
; ======================================================================


snake_sale_de_d8c0:		; con Snake hacia arriba en Y < 0x50 y X 0x58-0x68: 0xD8C0 = 0, a la sala B y al sitio de la entrada 0xD8CC de p07:AA0F (p07:A731), mirando abajo, 0xCA77 = 0, p03:B4D1, p07:A80B, 0xD8C9 = 0x10, p07:A83A, p07:A8D1, el paso de p07:A70F y los bytes 3-5 de su ficha de 0xDC80 = 0xD8CB-0xD8CD
	ld a,(0cb0eh)		;a69a   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	dec a			;a69d   ; solo hacia arriba
	ret nz			;a69e   ; solo hacia arriba
	ld a,(0cb03h)		;a69f   ; lee la Y de Snake
	cp 050h		;a6a2   ; por debajo de 0x50
	ret nc			;a6a4   ; desde Y = 0x50, nada
	ld a,(0cb05h)		;a6a5   ; lee la X de Snake
	cp 058h		;a6a8   ; X desde 0x58...
	ret c			;a6aa   ; X 0x58...
	cp 069h		;a6ab   ; ...hasta 0x68
	ret nc			;a6ad   ; ...a 0x68
	xor a			;a6ae   ; 0xD8C0 = 0
	ld (0d8c0h),a		;a6af   ; guarda 1 con Snake dentro de lo de 0xD8C2 (p07:A40D; 0 al salir, p07:A69A)
	call borra_df80		;a6b2   ; 0xDF80 a cero
	ld hl,0aa0fh		;a6b5   ; la lista de 0xD8C2 en p07:AA0F...
	ld a,(0d8c2h)		;a6b8   ; lee la entrada de p07:AA83 junto a la que esta Snake (su numero, p07:A543)
	dec a			;a6bb   ; la lista de 0xD8C2
	call 043f6h		;a6bc   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld a,(0d8cch)		;a6bf   ; ...su entrada 0xD8CC (4 bytes), desde el segundo
	add a,a			;a6c2   ; la entrada * 4 + 1
	add a,a			;a6c3
	inc a			;a6c4
	call 0423eh		;a6c5   ; suma_a_hl: HL = HL + A
	ld b,(hl)			;a6c8   ; B = la sala
	inc hl			;a6c9
	ld a,(hl)			;a6ca   ; la Y...
	ld (0cb03h),a		;a6cb   ; guarda la Y de Snake
	inc hl			;a6ce
	ld a,(hl)			;a6cf   ; ...y la X de Snake
	ld (0cb05h),a		;a6d0   ; guarda la X de Snake
	ld a,002h		;a6d3   ; hacia abajo
	ld (0cb0eh),a		;a6d5   ; guarda la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ld (0cb0dh),a		;a6d8   ; guarda la direccion pedida con el mando (1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	xor a			;a6db   ; 0xCA77 = 0
	ld (0ca77h),a		;a6dc   ; 0xCA77 = 0
	push bc			;a6df
	call 059efh		;a6e0   ; los sprites
	call 08d75h		;a6e3   ; p03:B4D1
	pop bc			;a6e6
	call a_la_sala_b		;a6e7   ; a la sala B
	call d8c6_de_aa83		;a6ea   ; p07:A80B
	ld a,010h		;a6ed   ; 0xD8C9 = 0x10
	ld (0d8c9h),a		;a6ef   ; guarda lo separadas que estan las dos mitades (0-0x10, p07:A8D1)
	call guarda_fondo_d8c0		;a6f2   ; p07:A83A
	call pinta_d8c9		;a6f5   ; pintado
	call paso_al_salir		;a6f8   ; el paso
	ld b,001h		;a6fb   ; el byte 1 de su ficha
	call ficha_dc80		;a6fd   ; su ficha de 0xDC80...
	ld (hl),000h		;a700   ; ...byte 1 = 0
	inc hl			;a702
	inc hl			;a703
	ex de,hl			;a704   ; al byte 3
	ld hl,0d8cbh		;a705   ; 0xD8CB-0xD8CD a los bytes 3-5
	ldi		;a708
	ldi		;a70a
	ldi		;a70c
	ret			;a70e
paso_al_salir:		; con 0xD8C2 = 8 y 0xD8CD = 1, el paso 0x0E con 0xD8C7 = 0x60 y 0xD8C8 = 0x29; si no, el paso 0x0D
	ld a,(0d8c2h)		;a70f   ; lee la entrada de p07:AA83 junto a la que esta Snake (su numero, p07:A543)
	cp 008h		;a712   ; el 8...
	jr nz,paso_0d		;a714   ; no el 8
	ld a,(0d8cdh)		;a716   ; lee el numero de la entrada en la que esta (sin el 0; lo pinta p01:71C2)
	cp 001h		;a719   ; ...con el numero 1
	jr nz,paso_0d		;a71b   ; no el 1
	ld a,00eh		;a71d   ; el paso 0x0E
	ld (0d8c1h),a		;a71f   ; guarda el paso de lo de 0xD8C2 (20 pasos, p07:A012)
	ld hl,0d8c7h		;a722   ; 0xD8C7 = 0x60...
	ld (hl),060h		;a725   ; 0xD8C7 = 0x60...
	inc hl			;a727
	ld (hl),029h		;a728   ; ...0xD8C8 = 0x29
	ret			;a72a
paso_0d:
	ld a,00dh		;a72b   ; el paso 0x0D
	ld (0d8c1h),a		;a72d   ; guarda el paso de lo de 0xD8C2 (20 pasos, p07:A012)
	ret			;a730
a_la_sala_b:		; en las zonas 0x0B-0x10, los dibujos de la sala; segun 0xD8C2 y 0xD8CD, la fila y columna (0xCA50-0xCA51) y la sala especial; con alerta en las salas 6 y 0x0C, p04:924C; y a la sala B (p02:8D98)
	ld a,(0ca4ah)		;a731   ; lee la zona
	sub 00bh		;a734   ; zonas 0x0B-0x10...
	cp 006h		;a736   ; zonas 0x0B-0x10
	push bc			;a738
	call c,08d86h		;a739   ; ...los dibujos de la sala
	pop bc			;a73c
	ld a,(0d8c2h)		;a73d   ; lee la entrada de p07:AA83 junto a la que esta Snake (su numero, p07:A543)
	cp 003h		;a740   ; el 3
	jp z,sale_con_d8c2_3		;a742   ; sale_con_d8c2_3: el 3: negativo, columna 7; si no, columna 8 en la sala especial 0x18
	cp 005h		;a745   ; el 5
	jr z,sale_con_d8c2_5		;a747   ; el 5
	cp 007h		;a749   ; el 7
	jr z,sale_con_d8c2_7		;a74b   ; el 7
	cp 008h		;a74d   ; el 8
	jr z,sale_con_d8c2_8		;a74f   ; el 8
	cp 009h		;a751   ; el 9
	jr z,sale_con_d8c2_9		;a753   ; el 9
	cp 00ah		;a755   ; el 0x0A; los demas, sin cambiar
	jp nz,sin_especial		;a757   ; sin_especial:
	ld hl,0ca50h		;a75a   ; apunta a la fila de la sala en la zona (uno mas al salir por arriba)
	push bc			;a75d
	ld a,(0d8cdh)		;a75e   ; el 1: fila 1, columna 6...
	cp 001h		;a761   ; con el 1...
	ld bc,00106h		;a763   ; ...fila 1, columna 6
	jr z,pon_fila_columna		;a766
	ld bc,00c07h		;a768   ; ...los demas: fila 0x0C, columna 7
pon_fila_columna:
	ld (hl),b			;a76b   ; la fila...
	inc hl			;a76c
	ld (hl),c			;a76d   ; ...la columna
	pop bc			;a76e
	jr sin_especial		;a76f
sale_con_d8c2_7:		; el 7 con 0xD8CD = 1: fila 1, columna 9
	ld a,(0d8cdh)		;a771   ; lee el numero de la entrada en la que esta (sin el 0; lo pinta p01:71C2)
	cp 001h		;a774   ; solo con el 1
	jr nz,sin_especial		;a776
	ld hl,0ca50h		;a778   ; apunta a la fila de la sala en la zona (uno mas al salir por arriba)
	ld (hl),001h		;a77b   ; fila 1...
	inc hl			;a77d
	ld (hl),009h		;a77e   ; ...columna 9
	jr sin_especial		;a780
sale_con_d8c2_5:		; el 5: fila 4 (0x0C con 0xD8CD negativo), columna 7
	ld hl,0ca50h		;a782   ; apunta a la fila de la sala en la zona (uno mas al salir por arriba)
	ld (hl),004h		;a785   ; fila 4...
	ld a,(0d8cdh)		;a787   ; lee el numero de la entrada en la que esta (sin el 0; lo pinta p01:71C2)
	rla			;a78a   ; con el numero negativo...
	jr nc,columna_7		;a78b
	ld (hl),00ch		;a78d   ; ...fila 0x0C
columna_7:
	inc hl			;a78f
	ld (hl),007h		;a790   ; columna 7
	jr sin_especial		;a792
sale_con_d8c2_8:		; el 8: negativo, fila 5 columna 5; si no, fila 1 columna 8 en la sala especial 0x2A
	ld a,(0d8cdh)		;a794   ; lee el numero de la entrada en la que esta (sin el 0; lo pinta p01:71C2)
	rla			;a797   ; negativo...
	jr nc,d8c2_8_especial		;a798
	ld hl,0ca50h		;a79a   ; apunta a la fila de la sala en la zona (uno mas al salir por arriba)
	ld (hl),005h		;a79d   ; ...fila 5...
	inc hl			;a79f
	ld (hl),005h		;a7a0   ; ...columna 5
	jr sin_especial		;a7a2
d8c2_8_especial:
	ld hl,0ca50h		;a7a4   ; apunta a la fila de la sala en la zona (uno mas al salir por arriba)
	ld (hl),001h		;a7a7   ; fila 1...
	inc hl			;a7a9
	ld (hl),008h		;a7aa   ; ...columna 8
	ld a,02ah		;a7ac   ; la sala especial 0x2A
	ld (0ca76h),a		;a7ae   ; guarda la sala especial (0 = ninguna; indice de p24:64B6)
	ld a,b			;a7b1   ; la sala B
	jp 08d98h		;a7b2   ; cambia_de_zona_b_1_2_7: cambia_de_zona y deja los bancos 1, 2 y 7
sale_con_d8c2_9:		; el 9: negativo, fila 2 columna 7; si no, fila 1 columna 7 en la sala especial 0x2E
	ld a,(0d8cdh)		;a7b5   ; lee el numero de la entrada en la que esta (sin el 0; lo pinta p01:71C2)
	rla			;a7b8   ; negativo...
	jr nc,d8c2_9_especial		;a7b9
	ld hl,0ca50h		;a7bb   ; apunta a la fila de la sala en la zona (uno mas al salir por arriba)
	ld (hl),002h		;a7be   ; ...fila 2...
	inc hl			;a7c0
	ld (hl),007h		;a7c1   ; ...columna 7
	jr sin_especial		;a7c3
d8c2_9_especial:
	ld hl,0ca50h		;a7c5   ; apunta a la fila de la sala en la zona (uno mas al salir por arriba)
	ld (hl),001h		;a7c8   ; fila 1...
	inc hl			;a7ca
	ld (hl),007h		;a7cb   ; ...columna 7
	ld a,02eh		;a7cd   ; la sala especial 0x2E
	ld (0ca76h),a		;a7cf   ; guarda la sala especial (0 = ninguna; indice de p24:64B6)
	ld a,b			;a7d2   ; la sala B
	jp 08d98h		;a7d3   ; cambia_de_zona_b_1_2_7: cambia_de_zona y deja los bancos 1, 2 y 7
sale_con_d8c2_3:		; el 3: negativo, columna 7; si no, columna 8 en la sala especial 0x18
	ld a,(0d8cdh)		;a7d6   ; lee el numero de la entrada en la que esta (sin el 0; lo pinta p01:71C2)
	rla			;a7d9   ; negativo...
	jr nc,d8c2_3_especial		;a7da
	ld a,007h		;a7dc   ; ...columna 7
	ld (0ca51h),a		;a7de   ; guarda la columna de la sala en la zona (uno mas al salir por la derecha)
sin_especial:
	xor a			;a7e1
	ld (0ca76h),a		;a7e2   ; sin sala especial
	ld a,(0ca5fh)		;a7e5   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	and a			;a7e8
	ld a,b			;a7e9   ; la sala B
	jr z,a_la_sala_b_ya		;a7ea   ; sin alerta, a la sala
	push af			;a7ec
	cp 00ch		;a7ed   ; la sala 0x0C...
	call z,07ad0h		;a7ef   ; a_p04_924c_2: p04:924C con el banco 4 en 0x8000
	pop af			;a7f2
	push af			;a7f3
	cp 006h		;a7f4   ; ...o la 6: p04:924C
	call z,07ad0h		;a7f6   ; a_p04_924c_2: p04:924C con el banco 4 en 0x8000
	pop af			;a7f9
a_la_sala_b_ya:
	jp 08d98h		;a7fa   ; cambia_de_zona_b_1_2_7: cambia_de_zona y deja los bancos 1, 2 y 7
d8c2_3_especial:		; columna 8...
	ld a,008h		;a7fd   ; columna 8
	ld (0ca51h),a		;a7ff   ; guarda la columna de la sala en la zona (uno mas al salir por la derecha)
	ld a,018h		;a802   ; ...la sala especial 0x18
	ld (0ca76h),a		;a804   ; guarda la sala especial (0 = ninguna; indice de p24:64B6)
	ld a,b			;a807   ; la sala B
	jp 08d98h		;a808   ; cambia_de_zona_b_1_2_7: cambia_de_zona y deja los bancos 1, 2 y 7
d8c6_de_aa83:		; la ficha de p07:AA83 de esta zona y 0xD8C2: sus bytes 5-6 a 0xD8C6-0xD8C7 (acarreo)
	ld hl,0aa83h		;a80b   ; las entradas de p07:AA83
ficha_aa83_b:
	ld a,(hl)			;a80e
	cp 0ffh		;a80f   ; 0xFF: se acaba
	ret z			;a811   ; 0xFF: ninguna
	push hl			;a812
	call es_la_de_d8c2		;a813   ; es_la_de_d8c2:
	pop hl			;a816
	ret c			;a817   ; encontrada
	ld de,00008h		;a818   ; la siguiente (8 bytes)
	add hl,de			;a81b
	jr ficha_aa83_b		;a81c   ; la siguiente
es_la_de_d8c2:
	ld a,(0ca4ah)		;a81e   ; lee la zona
	cp (hl)			;a821   ; su zona
	jr nz,no_es		;a822   ; otra zona
	inc hl			;a824
	inc hl			;a825
	ld a,(0d8c2h)		;a826   ; lee la entrada de p07:AA83 junto a la que esta Snake (su numero, p07:A543)
	cp (hl)			;a829   ; su numero
	jr nz,no_es		;a82a   ; otro numero
	inc hl			;a82c
	inc hl			;a82d
	inc hl			;a82e
	ld de,0d8c6h		;a82f   ; los bytes 5-6 a 0xD8C6
	ldi		;a832   ; la Y...
	ldi		;a834   ; ...y la X
	scf			;a836   ; encontrada
	ret			;a837
no_es:
	or a			;a838   ; no
	ret			;a839
guarda_fondo_d8c0:		; p07:A896 y cuatro bloques de 16 x 16 de la pagina 0 a la 3: (0xC0, 0xE0), (0xC0, 0xF0), (0xF0, 0xE0) y (0xF0, 0xF0) a (0xA0-0xD0, 0xB0)
	call mitades_d8c0		;a83a   ; mitades_d8c0: borra 0x40 x 0x2C en (0xC0, 0xD4) y copia el sitio de 0xD8C6 (p07:A8FF) a (0xC0, 0xE5) y a (0xF0, 0xE5) en dos trozos de 0x10 x 0x1A
	ld hl,0c0e0h		;a83d   ; (0xC0, 0xE0)...
	ld de,0a0b0h		;a840   ; ...a (0xA0, 0xB0)
	call de_0_a_3		;a843   ; de_0_a_3: de la pagina 0 a la 3
	ld hl,0c0f0h		;a846   ; (0xC0, 0xF0) a (0xB0, 0xB0)
	ld de,0b0b0h		;a849
	call de_0_a_3		;a84c   ; de_0_a_3: de la pagina 0 a la 3
	ld hl,0f0e0h		;a84f   ; (0xF0, 0xE0) a (0xC0, 0xB0)
	ld de,0c0b0h		;a852
	call de_0_a_3		;a855   ; de_0_a_3: de la pagina 0 a la 3
	ld hl,0f0f0h		;a858   ; (0xF0, 0xF0) a (0xD0, 0xB0)
	ld de,0d0b0h		;a85b
de_0_a_3:		; de la pagina 0 a la 3
	ld a,00ch		;a85e   ; de la pagina 0 a la 3
	jr bloque_16		;a860
repone_fondo_d8c0:		; 0x40 x 0x20 a 0 en (0xC0, 0xE0) y los cuatro bloques de vuelta de la pagina 3 a la 0
	ld hl,0c0e0h		;a862
	ld bc,04020h		;a865   ; 0x40 x 0x20...
	xor a			;a868   ; ...en la pagina 0, al color 0
	ld d,a			;a869
	call 046ffh		;a86a   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
	ld de,0c0e0h		;a86d   ; (0xA0, 0xB0) a (0xC0, 0xE0)
	ld hl,0a0b0h		;a870
	call de_3_a_0		;a873   ; de_3_a_0: de la pagina 3 a la 0
	ld de,0c0f0h		;a876
	ld hl,0b0b0h		;a879
	call de_3_a_0		;a87c   ; de_3_a_0: de la pagina 3 a la 0
	ld de,0f0e0h		;a87f
	ld hl,0c0b0h		;a882
	call de_3_a_0		;a885   ; de_3_a_0: de la pagina 3 a la 0
	ld de,0f0f0h		;a888
	ld hl,0d0b0h		;a88b
de_3_a_0:		; de la pagina 3 a la 0
	ld a,003h		;a88e   ; de la pagina 3 a la 0
bloque_16:		; 16 x 16
	ld bc,01010h		;a890
copia_hmmm:
	jp 04767h		;a893   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
mitades_d8c0:		; borra 0x40 x 0x2C en (0xC0, 0xD4) y copia el sitio de 0xD8C6 (p07:A8FF) a (0xC0, 0xE5) y a (0xF0, 0xE5) en dos trozos de 0x10 x 0x1A
	call borra_c0d4		;a896   ; borra_c0d4: 0x40 x 0x2C a 0 en (0xC0, 0xD4) de la pagina 0
	ld b,000h		;a899   ; sin mas
	call sitio_de_d8c6		;a89b   ; el sitio
	ex de,hl			;a89e
	ld de,0c0e5h		;a89f   ; a (0xC0, 0xE5)
	push de			;a8a2
	push hl			;a8a3
	call trozo_10x1a		;a8a4   ; trozo_10x1a: 0x10 x 0x1A en la pagina de dibujo
	pop hl			;a8a7
	pop de			;a8a8
	ld a,h			;a8a9   ; el trozo de 0x10 a la derecha...
	add a,010h		;a8aa
	ld h,a			;a8ac
	ld a,d			;a8ad   ; ...a 0x30 mas
	add a,030h		;a8ae
	ld d,a			;a8b0
trozo_10x1a:		; 0x10 x 0x1A en la pagina de dibujo
	ld bc,0101ah		;a8b1   ; 0x10 x 0x1A
	ld a,(0ca42h)		;a8b4   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	jr copia_hmmm		;a8b7
borra_c0d4:		; 0x40 x 0x2C a 0 en (0xC0, 0xD4) de la pagina 0
	ld hl,0c0d4h		;a8b9
	ld bc,0402ch		;a8bc   ; 0x40 x 0x2C...
	xor a			;a8bf   ; ...pagina 0, color 0
	ld d,a			;a8c0
	jr borra_vram		;a8c1
borra_502d:		; 0x20 x 0x19 a 0 en (0x50, 0x2D) de la pagina de dibujo
	ld hl,0502dh		;a8c3
	ld bc,02019h		;a8c6   ; 0x20 x 0x19...
	ld a,(0ca42h)		;a8c9   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	ld d,a			;a8cc
	xor a			;a8cd   ; ...al color 0
borra_vram:
	jp 046ffh		;a8ce   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
pinta_d8c9:		; las dos mitades separadas 0xD8C9: la de (0xF0 - 0xD8C9, 0xE5) a la X de 0xD8C7 + 0x10 y la de (0xC0 + 0xD8C9, 0xE5) a la X de 0xD8C7
	call mitad_derecha		;a8d1   ; mitad_derecha: desde 0xF0 - 0xD8C9...
	jr mitad_izquierda		;a8d4
mitad_derecha:		; desde 0xF0 - 0xD8C9...
	ld a,(0d8c9h)		;a8d6   ; lee lo separadas que estan las dos mitades (0-0x10, p07:A8D1)
	ld b,a			;a8d9
	ld a,0f0h		;a8da
	sub b			;a8dc
	ld h,a			;a8dd
	ld l,0e5h		;a8de
	ld b,010h		;a8e0   ; ...a 0x10 a la derecha
	call sitio_de_d8c6		;a8e2   ; sitio_de_d8c6: DE = (0xD8C7 + B, 0xD8C6 + 5); con 0xD8C0, (0x50 + B, 0x2D)
trozo_a_pagina:		; 0x10 x 0x1A de la pagina 0 a la de dibujo
	ld bc,0101ah		;a8e5
	ld a,(0ca42h)		;a8e8   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	rlca			;a8eb
	rlca			;a8ec
	jp 04767h		;a8ed   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
mitad_izquierda:		; desde 0xC0 + 0xD8C9...
	ld a,(0d8c9h)		;a8f0   ; lee lo separadas que estan las dos mitades (0-0x10, p07:A8D1)
	add a,0c0h		;a8f3
	ld h,a			;a8f5
	ld l,0e5h		;a8f6
	ld b,000h		;a8f8
	call sitio_de_d8c6		;a8fa   ; sitio_de_d8c6: DE = (0xD8C7 + B, 0xD8C6 + 5); con 0xD8C0, (0x50 + B, 0x2D)
	jr trozo_a_pagina		;a8fd
sitio_de_d8c6:		; DE = (0xD8C7 + B, 0xD8C6 + 5); con 0xD8C0, (0x50 + B, 0x2D)
	ld a,(0d8c7h)		;a8ff   ; lee la X del sitio de la entrada (p07:A8FF, p07:A129)
	ld d,a			;a902
	ld a,(0d8c6h)		;a903   ; lee la Y del sitio de la entrada (p07:A8FF)
	ld e,a			;a906
	ld a,(0d8c0h)		;a907   ; dentro...
	or a			;a90a
	jr z,mas_b_y_5		;a90b
	ld de,05028h		;a90d   ; ...en (0x50, 0x28)
mas_b_y_5:
	ld a,d			;a910
	add a,b			;a911   ; D = la X + B
	ld d,a			;a912
	ld a,e			;a913
	add a,005h		;a914   ; E = la Y + 5
	ld e,a			;a916
	ret			;a917
d8d2_destino:		; 0xD8CC cambia uno segun 0xD8C4 (p07:A931) y 0xD8D2 = el numero de esa entrada en la lista de 0xD8C2 de p07:AA0F
	call d8cc_sentido		;a918   ; d8cc_sentido: con 0xD8C4 = 1, 0xD8CC + 1; con 2, - 1
	ld hl,0aa0fh		;a91b   ; la lista de 0xD8C2...
	ld a,(0d8c2h)		;a91e   ; lee la entrada de p07:AA83 junto a la que esta Snake (su numero, p07:A543)
	dec a			;a921
	call 043f6h		;a922   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld a,(0d8cch)		;a925   ; ...su entrada 0xD8CC (4 bytes)
	add a,a			;a928
	add a,a			;a929
	call 04248h		;a92a   ; byte_de_tabla: A = el byte A de la tabla de HL (y HL apunta a el)
	ld (0d8d2h),a		;a92d   ; guarda el numero de la entrada a la que va (p07:A918)
	ret			;a930
d8cc_sentido:		; con 0xD8C4 = 1, 0xD8CC + 1; con 2, - 1
	ld a,(0d8c4h)		;a931   ; lee el boton pulsado dentro: 1 o 2 (p07:A61D)
	or a			;a934
	ret z			;a935
	ld b,001h		;a936
	dec a			;a938
	ld a,(0d8cch)		;a939   ; lee la entrada de la lista de 0xD8C2 en la que esta (p07:AA0F)
	jr z,pon_d8cc		;a93c
	ld b,0ffh		;a93e
pon_d8cc:
	add a,b			;a940
	ld (0d8cch),a		;a941   ; guarda la entrada de la lista de 0xD8C2 en la que esta (p07:AA0F)
	ret			;a944
d8cd_de_d8cc:		; 0xD8CD = el numero de la entrada 0xD8CC de la lista de 0xD8C2 (p07:AA0F); sin llamada vista
	ld a,(0d8c2h)		;a945   ; lee la entrada de p07:AA83 junto a la que esta Snake (su numero, p07:A543)
	or a			;a948
	ret z			;a949
	dec a			;a94a
	ld hl,0aa0fh		;a94b
	call 043f6h		;a94e   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld a,(0d8cch)		;a951   ; lee la entrada de la lista de 0xD8C2 en la que esta (p07:AA0F)
	add a,a			;a954
	add a,a			;a955
	call 04248h		;a956   ; byte_de_tabla: A = el byte A de la tabla de HL (y HL apunta a el)
	ld (0d8cdh),a		;a959   ; guarda el numero de la entrada en la que esta (sin el 0; lo pinta p01:71C2)
	ret			;a95c
flecha_d8c4:		; un caracter de 8 x 8 de la pagina 2: de (0xE8, 0xD0) a (0x78, 0x30) con 0xD8C4 = 1, de (0xE0, 0xD0) a (0x40, 0x30) si no; cada 4 cuadros, el de 0x10 mas abajo
	ld hl,0e8d0h		;a95d
	ld de,07830h		;a960
	ld a,(0d8c4h)		;a963   ; lee el boton pulsado dentro: 1 o 2 (p07:A61D)
	dec a			;a966
	jr z,cada_4_cuadros		;a967
	ld h,0e0h		;a969   ; el otro sentido
	ld d,040h		;a96b
cada_4_cuadros:
	ld a,(0d8c3h)		;a96d   ; lee la cuenta de cuadros de los pasos de 0xD8C1
	rra			;a970
	rra			;a971
	jr nc,copia_flecha		;a972
	ld bc,01000h		;a974   ; el de abajo
	add hl,bc			;a977
copia_flecha:
	ld bc,00808h		;a978
	ld a,(0ca42h)		;a97b   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	rlca			;a97e
	rlca			;a97f
	or 002h		;a980
	jp 04767h		;a982   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
dc80_de_p57:		; las 10 fichas de 8 bytes de p57:8000 a 0xDC80
	call 0421fh		;a985   ; bancos_57: pone el 57 en 0x8000 (con su copia en 0xC381-0xC383)
	ld de,0dc80h		;a988   ; apunta a 10 fichas de 8 bytes de p57:8000 (p07:A985): [tipo][..][cuenta][ultima entrada][entrada][numero][llamada][..]
	ld hl,08000h		;a98b   ; copia_8000: 80 bytes que p07
	ld bc,00050h		;a98e
	ldir		;a991
	jp 041adh		;a993   ; bancos_1_2_7: pone el 1 en 0x6000, el 2 en 0x8000, el 7 en 0xA000 (con su copia en 0xC381-0xC383)
fichas_dc80:		; cada 0x20 cuadros, las fichas de 0xDC80 (la de tipo 0x0A solo con 0xD8C2 = 0x0A) cambian de entrada (p07:A9C9) y de numero (p07:A9F9)
	ld ix,0dc80h		;a996   ; apunta a 10 fichas de 8 bytes de p57:8000 (p07:A985): [tipo][..][cuenta][ultima entrada][entrada][numero][llamada][..]
	ld b,010h		;a99a
ficha_dc80_b:
	ld a,(ix+000h)		;a99c
	or a			;a99f
	jr z,siguiente_dc80		;a9a0   ; libre: la siguiente
	cp 00ah		;a9a2
	jr nz,mueve_ficha_dc80		;a9a4   ; el tipo 0x0A...
	ld a,(0d8c2h)		;a9a6   ; lee la entrada de p07:AA83 junto a la que esta Snake (su numero, p07:A543)
	cp 00ah		;a9a9
	jr nz,siguiente_dc80		;a9ab   ; ...solo con 0xD8C2 = 0x0A
mueve_ficha_dc80:
	push bc			;a9ad
	call cada_20_cuadros		;a9ae   ; cada_20_cuadros:
	pop bc			;a9b1
siguiente_dc80:
	ld de,00008h		;a9b2
	add ix,de		;a9b5
	djnz ficha_dc80_b		;a9b7
	ret			;a9b9
cada_20_cuadros:
	dec (ix+002h)		;a9ba
	ret nz			;a9bd
	ld (ix+002h),020h		;a9be   ; otros 0x20
	call entrada_dc80		;a9c2   ; entrada_dc80: con el byte 6, la entrada (byte 4) va hacia 0xD8CD (una por vez); sin el, al azar (R) una mas o una menos, entre 0 y el byte 3
	call numero_dc80		;a9c5   ; numero_dc80: el byte 5 = el numero de la entrada (byte 4) de la lista de su tipo en p07:AA0F
	ret			;a9c8
entrada_dc80:		; con el byte 6, la entrada (byte 4) va hacia 0xD8CD (una por vez); sin el, al azar (R) una mas o una menos, entre 0 y el byte 3
	ld a,(ix+006h)		;a9c9
	or a			;a9cc
	jr z,al_azar_dc80		;a9cd   ; sin el byte 6, al azar
	ld a,(ix+005h)		;a9cf   ; su numero + 0x10...
	add a,010h		;a9d2
	ld b,a			;a9d4
	ld a,(0d8cdh)		;a9d5   ; ...0xD8CD + 0x10
	add a,010h		;a9d8
	cp b			;a9da
	ret z			;a9db   ; igual, nada
	jr c,una_menos		;a9dc   ; por debajo, una menos
	jr una_mas		;a9de
al_azar_dc80:		; el bit 0 de R
	ld a,r		;a9e0
	rra			;a9e2
	jr c,una_mas		;a9e3
una_menos:
	ld a,(ix+004h)		;a9e5
	or a			;a9e8
	ret z			;a9e9   ; en la 0, nada
	dec (ix+004h)		;a9ea
	ret			;a9ed
una_mas:
	ld a,(ix+004h)		;a9ee
	cp (ix+003h)		;a9f1
	ret z			;a9f4   ; en la ultima (byte 3), nada
	inc (ix+004h)		;a9f5
	ret			;a9f8
numero_dc80:		; el byte 5 = el numero de la entrada (byte 4) de la lista de su tipo en p07:AA0F
	ld a,(ix+000h)		;a9f9
	dec a			;a9fc
	ld hl,0aa0fh		;a9fd
	call 043f6h		;aa00   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld a,(ix+004h)		;aa03
	add a,a			;aa06
	add a,a			;aa07
	call 04248h		;aa08   ; byte_de_tabla: A = el byte A de la tabla de HL (y HL apunta a el)
	ld (ix+005h),a		;aa0b
	ret			;aa0e

; ----------------------------------------------------------------------
; DATOS resto_AA0F: lo apuntan con el banco puesto p07:A6B5 (0xAA0F), p07:A91B
;   (0xAA0F), p07:A94B (0xAA0F), p07:A9FD (0xAA0F), p07:A515 (0xAA83),
;   p07:A80B (0xAA83); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p07:A6B5, p07:A91B, p07:A94B, p07:A9FD, p07:A515,
;   p07:A80B (309 bytes)
;   0xaa0f..0xab44  (309 bytes)
DATA_resto_AA0F:
	defb 023h,0aah,02fh,0aah,03fh,0aah,047h,0aah,04fh,0aah,05bh,0aah,063h,0aah,06bh,0aah	; aa0f  #./.?.G.O.[.c.k.
	defb 073h,0aah,07bh,0aah,0feh,006h,0ach,040h,0ffh,005h,0ach,040h,002h,002h,0ach,040h	; aa1f  s.{....@...@...@
	defb 001h,001h,0ach,080h,002h,002h,0ach,080h,003h,003h,0ach,080h,004h,004h,0ach,080h	; aa2f  ................
	defb 0fdh,008h,06ch,080h,004h,004h,04ch,090h,001h,00bh,04ch,050h,01eh,00eh,04ch,050h	; aa3f  ..l...L...LP..LP
	defb 0ffh,006h,0ach,030h,001h,00bh,0ach,030h,014h,00dh,0ach,030h,001h,00bh,04ch,090h	; aa4f  ...0...0...0..L.
	defb 00ah,00ch,04ch,090h,0fdh,008h,06ch,060h,001h,00ah,08ch,060h,0fdh,008h,06ch,060h	; aa5f  ..L...l`...`..l`
	defb 001h,007h,029h,070h,0ffh,013h,02ch,060h,001h,00ah,02ch,060h,0fdh,012h,070h,050h	; aa6f  ..)p..,`..,`..pP
	defb 001h,011h,070h,050h,001h,00bh,002h,088h,090h,07fh,070h,0a8h,002h,004h,001h,088h	; aa7f  ..pP......p.....
	defb 028h,07fh,030h,0a8h,002h,004h,002h,088h,090h,07fh,070h,0a8h,003h,00ah,002h,088h	; aa8f  (.0.......p.....
	defb 090h,07fh,070h,0a8h,004h,00ch,002h,088h,090h,07fh,070h,0a8h,004h,0ffh,003h,028h	; aa9f  ..p.......p....(
	defb 0a0h,01fh,080h,048h,005h,004h,001h,088h,028h,07fh,030h,0a8h,006h,007h,001h,088h	; aaaf  ...H....(.0.....
	defb 028h,07fh,030h,0a8h,006h,023h,005h,088h,040h,07fh,020h,0a8h,007h,0d0h,008h,0e0h	; aabf  (.0..#..@. .....
	defb 0e0h,000h,060h,029h,008h,007h,008h,048h,040h,03fh,050h,068h,008h,00fh,007h,048h	; aacf  ..`)...H@?Ph...H
	defb 040h,03fh,050h,068h,008h,000h,003h,048h,060h,03fh,070h,068h,00ah,0d0h,007h,0e0h	; aadf  @?Ph...H`?ph....
	defb 0e0h,05fh,050h,088h,00ah,0feh,009h,008h,070h,000h,050h,028h,00bh,004h,004h,028h	; aaef  ._P.....p.P(...(
	defb 068h,01fh,040h,048h,00bh,007h,005h,088h,048h,07fh,020h,0a8h,00bh,007h,006h,028h	; aaff  h.@H....H. ....(
	defb 0a8h,01fh,080h,048h,00ch,007h,006h,028h,0a0h,01fh,080h,048h,00dh,003h,005h,088h	; ab0f  ...H...(...H....
	defb 040h,07fh,020h,0a8h,00eh,005h,004h,028h,060h,01fh,040h,048h,011h,0d0h,00ah,0e0h	; ab1f  @. ....(`.@H....
	defb 0e0h,03fh,040h,068h,012h,013h,00ah,048h,078h,03fh,050h,068h,013h,002h,009h,008h	; ab2f  .?@h...Hx?Ph....
	defb 078h,000h,050h,028h,0ffh	; ab3f

; ======================================================================
; CODIGO 0xab44..0xb2e9  (1957 bytes)
; ======================================================================


numeros_de_fuera:		; sin 0xD8C0, en las zonas 1-6, fila 3 columna 7: los numeros de las fichas 0 y 1 de 0xDC80 (p07:AB66)
	ld a,(0d8c0h)		;ab44   ; lee 1 con Snake dentro de lo de 0xD8C2 (p07:A40D; 0 al salir, p07:A69A)
	or a			;ab47
	ret nz			;ab48   ; con 0xD8C0, nada
	ld a,(0ca4ah)		;ab49   ; lee la zona
	or a			;ab4c
	ret z			;ab4d   ; zona 0, nada
	cp 007h		;ab4e
	ret nc			;ab50   ; desde la 7, nada
	ld a,(0ca50h)		;ab51   ; lee la fila de la sala en la zona (uno mas al salir por arriba)
	cp 003h		;ab54
	ret nz			;ab56   ; solo la fila 3...
	ld a,(0ca51h)		;ab57   ; lee la columna de la sala en la zona (uno mas al salir por la derecha)
	cp 007h		;ab5a
	ret nz			;ab5c   ; ...columna 7
	call 0421fh		;ab5d   ; bancos_57: pone el 57 en 0x8000 (con su copia en 0xC381-0xC383)
	call numeros_dc85_dc8d		;ab60   ; numeros_dc85_dc8d: con el byte 5 de la ficha 0, su numero (p57:8080) en (0x30, 0x7C); con el de la 1, en (0x70, 0x7C); 1 x 4
	jp 041adh		;ab63   ; bancos_1_2_7: pone el 1 en 0x6000, el 2 en 0x8000, el 7 en 0xA000 (con su copia en 0xC381-0xC383)
numeros_dc85_dc8d:		; con el byte 5 de la ficha 0, su numero (p57:8080) en (0x30, 0x7C); con el de la 1, en (0x70, 0x7C); 1 x 4
	ld a,(0dc85h)		;ab66
	or a			;ab69
	jr z,numero_dc8d		;ab6a
	call mosaico_del_numero		;ab6c   ; mosaico_del_numero: HL = p57:8080 + (A + 1, o A + 2 si es negativo) * 4
	ld de,0307ch		;ab6f   ; en (0x30, 0x7C)
	call numero_1x4		;ab72   ; numero_1x4:
numero_dc8d:
	ld a,(0dc8dh)		;ab75
	or a			;ab78
	ret z			;ab79
	call mosaico_del_numero		;ab7a   ; mosaico_del_numero: HL = p57:8080 + (A + 1, o A + 2 si es negativo) * 4
	ld de,0707ch		;ab7d   ; en (0x70, 0x7C)
numero_1x4:
	ld bc,00104h		;ab80
	jp 050e8h		;ab83   ; mosaico_f2_b3: el mosaico de HL en (D, E), B filas de C caracteres, con la forma 2 de la franja 3 (p00:512C)
mosaico_del_numero:		; HL = p57:8080 + (A + 1, o A + 2 si es negativo) * 4
	bit 7,a		;ab86
	ld b,001h		;ab88
	jr z,numero_mas_b		;ab8a
	inc b			;ab8c
numero_mas_b:
	add a,b			;ab8d
	ld hl,08080h		;ab8e
	add a,a			;ab91
	add a,a			;ab92
	jp 0423eh		;ab93   ; suma_a_hl: HL = HL + A
d8d1_a_cero:		; 0xD8D1 = 0
	xor a			;ab96
	ld (0d8d1h),a		;ab97   ; guarda el paso de las lineas de p57:8050 (0-5, p07:AC0C)
	ret			;ab9a
lineas_d8d1_0:		; las lineas de 0xD8D1 con el color 0
	ld a,(0d8d1h)		;ab9b   ; lee el paso de las lineas de p57:8050 (0-5, p07:AC0C)
	ld c,000h		;ab9e
	jr lineas_banco_57		;aba0
lineas_d8d1_2:		; borra las de ahora, 0xD8D1 sigue (p07:AC0C) y las nuevas con el color 2
	call lineas_d8d1_0		;aba2   ; lineas_d8d1_0: las lineas de 0xD8D1 con el color 0
	call d8d1_siguiente		;aba5   ; d8d1_siguiente: 0xD8D1 de 0 a 5 en vuelta: hacia arriba con el paso 0x0F en adelante o 0xD8C4 = 2, hacia abajo con 0xD8C4 = 1; sin 0xD8C4, nada
	ld a,(hl)			;aba8
	ld c,002h		;aba9
lineas_banco_57:
	call 0421fh		;abab   ; bancos_57: pone el 57 en 0x8000 (con su copia en 0xC381-0xC383)
	call lineas_8050		;abae   ; lineas_8050: las 4 lineas de p57:8050 + A * 8 (4 palabras): dos de 0x18 en horizontal con dos de 0x2C en vertical, y dos de 0x20 en vertical
	jp 041adh		;abb1   ; bancos_1_2_7: pone el 1 en 0x6000, el 2 en 0x8000, el 7 en 0xA000 (con su copia en 0xC381-0xC383)
lineas_8050:		; las 4 lineas de p57:8050 + A * 8 (4 palabras): dos de 0x18 en horizontal con dos de 0x2C en vertical, y dos de 0x20 en vertical
	add a,a			;abb4
	add a,a			;abb5
	add a,a			;abb6
	ld hl,08050h		;abb7
	call 0423eh		;abba   ; suma_a_hl: HL = HL + A
	push hl			;abbd
	call palabra_hl		;abbe   ; palabra_hl: HL = la palabra de HL
	ld b,018h		;abc1
	call linea_en_x		;abc3   ; linea_en_x:
	ld b,02ch		;abc6
	call linea_en_y		;abc8   ; linea_en_y:
	pop hl			;abcb
	inc hl			;abcc
	inc hl			;abcd
	push hl			;abce
	call palabra_hl		;abcf   ; palabra_hl: HL = la palabra de HL
	ld b,018h		;abd2
	ld a,h			;abd4
	sub b			;abd5
	ld h,a			;abd6
	call linea_en_x		;abd7   ; linea_en_x:
	ld b,02ch		;abda
	ld a,h			;abdc
	add a,018h		;abdd
	ld h,a			;abdf
	call linea_en_y		;abe0   ; linea_en_y:
	pop hl			;abe3
	inc hl			;abe4
	inc hl			;abe5
	push hl			;abe6
	call palabra_hl		;abe7   ; palabra_hl: HL = la palabra de HL
	ld b,020h		;abea
	call linea_en_y		;abec   ; linea_en_y:
	pop hl			;abef
	inc hl			;abf0
	inc hl			;abf1
	call palabra_hl		;abf2   ; palabra_hl: HL = la palabra de HL
	ld b,020h		;abf5
linea_en_y:
	ld a,(0ca42h)		;abf7   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	push bc			;abfa
	push hl			;abfb
	call 04680h		;abfc   ; linea_vertical: orden LINE del VDP con el lado largo en Y (ARG = 1)
	jr fin_linea		;abff
linea_en_x:
	ld a,(0ca42h)		;ac01   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	push bc			;ac04
	push hl			;ac05
	call 0467ch		;ac06   ; linea_horizontal: orden LINE del VDP (R#36-R#46) con el lado largo en X
fin_linea:
	pop hl			;ac09
	pop bc			;ac0a
	ret			;ac0b
d8d1_siguiente:		; 0xD8D1 de 0 a 5 en vuelta: hacia arriba con el paso 0x0F en adelante o 0xD8C4 = 2, hacia abajo con 0xD8C4 = 1; sin 0xD8C4, nada
	ld hl,0d8d1h		;ac0c   ; apunta a el paso de las lineas de p57:8050 (0-5, p07:AC0C)
	ld a,(0d8c1h)		;ac0f   ; lee el paso de lo de 0xD8C2 (20 pasos, p07:A012)
	cp 00fh		;ac12
	jr c,d8d1_sentido		;ac14
	ld a,(hl)			;ac16
	jr d8d1_mas		;ac17
d8d1_sentido:
	ld a,(0d8c4h)		;ac19   ; lee el boton pulsado dentro: 1 o 2 (p07:A61D)
	or a			;ac1c
	ret z			;ac1d
	dec a			;ac1e
	ld a,(hl)			;ac1f
	jr z,d8d1_menos		;ac20
d8d1_mas:
	inc a			;ac22
	cp 006h		;ac23
	jr c,pon_d8d1		;ac25
	xor a			;ac27
pon_d8d1:
	ld (hl),a			;ac28
	ret			;ac29
d8d1_menos:
	dec a			;ac2a
	cp 0ffh		;ac2b   ; de 0...
	jr nz,pon_d8d1		;ac2d
	ld a,005h		;ac2f   ; ...pasa a 5
	ld (hl),a			;ac31
	ret			;ac32
palabra_hl:		; HL = la palabra de HL
	ld a,(hl)			;ac33
	inc hl			;ac34
	ld h,(hl)			;ac35
	ld l,a			;ac36
	ret			;ac37
choques_cada_cuadro:		; sin salir de la sala, los choques de cada cuadro: Snake con los actores, con lo que lanzan y con las fichas de 0xD800, 0xDF80, 0xCC80, 0xD4C0 y 0xD760; lo que lanza Snake con los actores y las fichas
	ld a,(0ca41h)		;ac38   ; lee la salida de la sala (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	or a			;ac3b
	ret nz			;ac3c
	call snake_con_actores		;ac3d   ; Snake con los actores
	call snake_con_lanzado		;ac40   ; Snake con lo que lanzan
	call lanzado_de_snake_con_actores		;ac43   ; lo lanzado por Snake con los actores
	call lanzado_6_con_snake		;ac46   ; el tipo 6 de Snake con Snake
	call snake_con_d800		;ac49   ; Snake con las fichas de 0xD800
	call lanzado_de_snake_con_d800		;ac4c   ; lo lanzado por Snake con las fichas de 0xD800
	call snake_con_df80		;ac4f   ; Snake con las fichas de 0xDF80
	call df80_con_actores		;ac52   ; las de 0xDF80 con los actores
	call df80_con_d800		;ac55   ; las de 0xDF80 con las de 0xD800
	call snake_con_cc80		;ac58   ; Snake con las de 0xCC80
	call cc80_con_actores		;ac5b   ; las de 0xCC80 con los actores
	call cc80_con_d800		;ac5e   ; las de 0xCC80 con las de 0xD800
	call snake_con_18_y_e060		;ac61   ; Snake con los actores de tipo 0x18 y con 0xE060
	call choques_dff8		;ac64   ; con 0xDFF8
	jp snake_con_d760		;ac67   ; Snake con la ficha 0xD760
snake_con_actores:		; con 0xCA8D, p07:AD1E; si no, la caja de Snake (p07:B5CC en la zona 0x0F, p07:B670 en las demas) contra cada actor (p07:B8C5): el que toca hace dano a Snake (4; 0x0C el 0x13, que pasa al paso 2), y los de tipo menor de 0x10, sin alerta 2 y sin 0x0A-0x0B en 0xCB21, dan la alerta (p04:9949); los 0x10-0x11 y el 0x16 (con 0xCB21 = 0x21 en su paso 3) pasan a 0xD434
	ld a,(0ca8dh)		;ac6a   ; lee con el, otros choques de Snake con los actores (p07:AD1E)
	or a			;ac6d
	jp nz,snake_con_actores_ca8d		;ac6e   ; snake_con_actores_ca8d: con 0xCA8D: la caja de p07:B5CC contra cada actor (p07:B90A); los que tocan (salvo los tipos 0x16, 0x0A y 0x10-0x11) hacen 4 de dano
	ld a,(0ca4ah)		;ac71   ; lee la zona
	cp 00fh		;ac74   ; zona 0x0F...
	jr nz,caja_b670		;ac76
	call caja_de_snake		;ac78   ; ...su caja de Snake
	ret nz			;ac7b   ; sin caja, nada
	jr actores_contra_snake		;ac7c
caja_b670:		; en las demas, la otra
	call caja_de_snake_b		;ac7e   ; caja_de_snake_b: como p07:B5CC con la tabla p07:B6A5 y sin lo de 0xCB28 ni 0xCA8D
	ret nz			;ac81
actores_contra_snake:
	ld ix,0ce00h		;ac82   ; apunta a los actores: 24 fichas de 0x40 bytes (p04:800D)
	ld b,018h		;ac86   ; 24 actores
actor_contra_snake:
	exx			;ac88
	call caja_actor_snake		;ac89   ; la caja del actor (en el otro juego de registros)
	exx			;ac8c
	jr nz,siguiente_actor_choque		;ac8d   ; sin caja, el siguiente
	call se_tocan		;ac8f   ; se tocan?
	jr nc,siguiente_actor_choque		;ac92
	ld a,(ix+000h)		;ac94   ; lee el tipo del actor (0 = libre)
	and 07fh		;ac97   ; el tipo sin el bit 7
	ld c,a			;ac99
	cp 018h		;ac9a
	jr z,siguiente_actor_choque		;ac9c   ; el 0x18, nada
	cp 016h		;ac9e
	jr z,actor_16		;aca0   ; el 0x16, aparte
	cp 00ah		;aca2
	jr z,siguiente_actor_choque		;aca4   ; el 0x0A, nada
	sub 010h		;aca6
	cp 002h		;aca8   ; el 0x10 y el 0x11, aparte
	jr c,actor_10_11		;acaa
	ld a,c			;acac
	cp 013h		;acad
	ld c,004h		;acaf   ; el dano: 4...
	jr nz,dano_del_actor		;acb1
	ld (ix+001h),002h		;acb3   ; ...el 0x13 pasa al paso 2...
	ld c,00ch		;acb7   ; ...y hace 0x0C
dano_del_actor:
	xor a			;acb9
	call dano_a_snake		;acba   ; el dano a Snake
	ld a,(ix+000h)		;acbd   ; lee el tipo del actor (0 = libre)
	and 07fh		;acc0
	cp 010h		;acc2
	jr nc,siguiente_actor_choque		;acc4   ; desde el tipo 0x10, nada mas
	ld a,(0ca5fh)		;acc6   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	cp 002h		;acc9
	jr nc,siguiente_actor_choque		;accb   ; con alerta 2 o mas, nada mas
	ld a,(0cb21h)		;accd   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	sub 00ah		;acd0   ; con 0x0A-0x0B en 0xCB21, no...
	cp 002h		;acd2
	push bc			;acd4
	call nc,07ad8h		;acd5   ; ...si no, la alerta
	pop bc			;acd8
siguiente_actor_choque:
	exx			;acd9
	ld de,00040h		;acda   ; el siguiente (0x40 bytes)
	add ix,de		;acdd
	exx			;acdf
	djnz actor_contra_snake		;ace0
	ret			;ace2
actor_16:		; con 0xCB21 = 0x21, en su paso 3 y sin el byte 0x21: 0xD43F = 1, el bit 6 de 0xD7D4, fuera el 5 de 0xD7E0 y p07:AD0E
	ld a,(0cb21h)		;ace3   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	cp 021h		;ace6
	jr nz,siguiente_actor_choque		;ace8   ; sin 0x21, nada
	ld a,(ix+001h)		;acea
	cp 003h		;aced
	jr nz,siguiente_actor_choque		;acef   ; fuera del paso 3, nada
	ld a,(ix+021h)		;acf1
	and a			;acf4
	jr nz,siguiente_actor_choque		;acf5   ; con el byte 0x21, nada
	ld a,001h		;acf7   ; 0xD43F = 1
	ld (0d43fh),a		;acf9
	ld hl,0d7d4h		;acfc
	set 6,(hl)		;acff
	ld hl,0d7e0h		;ad01
	res 5,(hl)		;ad04
	jr actor_a_d434		;ad06
actor_10_11:		; sin el byte 0x21: p07:AD0E
	ld a,(ix+021h)		;ad08
	and a			;ad0b
	jr nz,siguiente_actor_choque		;ad0c
actor_a_d434:		; 0xD434 = 1, 0xD435 = el actor y el byte 0x21 = 0x3C (no otra vez en 0x3C cuadros)
	ld a,001h		;ad0e
	ld (0d434h),a		;ad10   ; guarda 1 cuando un actor 0x10-0x16 toca a Snake (p07:AD0E)
	push ix		;ad13   ; el actor...
	pop hl			;ad15
	ld (0d435h),hl		;ad16   ; ...a 0xD435
	ld (ix+021h),03ch		;ad19   ; 0x3C cuadros
	ret			;ad1d
snake_con_actores_ca8d:		; con 0xCA8D: la caja de p07:B5CC contra cada actor (p07:B90A); los que tocan (salvo los tipos 0x16, 0x0A y 0x10-0x11) hacen 4 de dano
	call caja_de_snake		;ad1e   ; caja_de_snake: la caja de Snake segun su dibujo (p07:B624) bajada 0xCB43 y con 0xCB28 (p07:B608); NZ sin caja: con 0xCB32 (salvo en la zona 0x0A salas 0x0B, 0x0C, 0x10 y 0x11 o con 0xCA8D); con 0xCA8D, la caja sin mas
	ret nz			;ad21
	ld ix,0ce00h		;ad22   ; apunta a los actores: 24 fichas de 0x40 bytes (p04:800D)
	ld b,018h		;ad26   ; 24 actores
actor_ca8d:
	exx			;ad28
	call caja_actor		;ad29   ; caja_actor: la caja del actor en esta sala (p07:BAB3 desde el tipo 0x10, p07:BAB0 los demas)
	exx			;ad2c
	jr nz,siguiente_ca8d		;ad2d
	call se_tocan		;ad2f   ; se tocan?
	jr nc,siguiente_ca8d		;ad32
	ld a,(ix+000h)		;ad34   ; lee el tipo del actor (0 = libre)
	and 07fh		;ad37
	cp 016h		;ad39   ; el 0x16...
	jr z,siguiente_ca8d		;ad3b
	cp 00ah		;ad3d   ; ...el 0x0A...
	jr z,siguiente_ca8d		;ad3f
	sub 010h		;ad41
	cp 002h		;ad43   ; ...y el 0x10-0x11, no
	jr c,siguiente_ca8d		;ad45
	ld c,004h		;ad47   ; 4 de dano
	xor a			;ad49
	call dano_a_snake		;ad4a   ; dano_a_snake: 0xD4E7 = A; saliendo de la sala o con 0xCB3C, nada; el actor 0x14 o 0x12 lleva a Snake al estado 0x14 (p03:AC02); si no, el dano C (p07:B393)
siguiente_ca8d:
	exx			;ad4d
	ld de,00040h		;ad4e
	add ix,de		;ad51   ; la ficha siguiente (0x40 bytes)
	exx			;ad53
	djnz actor_ca8d		;ad54   ; hasta la ultima
	ret			;ad56
snake_con_lanzado:		; sin 0xCA8D ni 0xD445: la caja de Snake contra lo que lanzan los actores (p07:BA3A): el dano de p07:B53D y lo lanzado se acaba (p04:9CA1)
	ld a,(0ca8dh)		;ad57   ; lee con el, otros choques de Snake con los actores (p07:AD1E)
	or a			;ad5a
	ret nz			;ad5b   ; con 0xCA8D, nada
	ld a,(0d445h)		;ad5c   ; lee 1 mientras las 6 fichas de 0xD460 son las de p06:B2D6 (sin choques, p07:AD5C)
	and a			;ad5f
	ret nz			;ad60   ; con 0xD445, nada
	call caja_de_snake		;ad61   ; caja_de_snake: la caja de Snake segun su dibujo (p07:B624) bajada 0xCB43 y con 0xCB28 (p07:B608); NZ sin caja: con 0xCB32 (salvo en la zona 0x0A salas 0x0B, 0x0C, 0x10 y 0x11 o con 0xCA8D); con 0xCA8D, la caja sin mas
	ret nz			;ad64   ; sin caja, nada
	ld ix,0d460h		;ad65   ; apunta a 6 fichas de 16 bytes de lo que lanzan los actores (p04:9B55)
	ld b,006h		;ad69   ; 6 fichas
lanzado_contra_snake:
	exx			;ad6b
	call caja_d460		;ad6c   ; caja_d460: la caja de lo lanzado por un actor: desde el tipo 3; el 3 (desde el paso 1) con p07:BB00; los demas, la entrada tipo - 4 de p07:BAEC
	exx			;ad6f
	jr nz,siguiente_lanzado_choque		;ad70
	call se_tocan		;ad72   ; se tocan?
	jr nc,siguiente_lanzado_choque		;ad75
	call dano_del_lanzado		;ad77   ; C = su dano
	ld a,001h		;ad7a   ; el dano a Snake
	call dano_a_snake		;ad7c   ; dano_a_snake: 0xD4E7 = A; saliendo de la sala o con 0xCB3C, nada; el actor 0x14 o 0x12 lleva a Snake al estado 0x14 (p03:AC02); si no, el dano C (p07:B393)
	call fin_de_lanzado_b		;ad7f   ; se acaba
siguiente_lanzado_choque:
	exx			;ad82
	ld de,00010h		;ad83
	add ix,de		;ad86   ; la ficha siguiente (0x10 bytes)
	exx			;ad88
	djnz lanzado_contra_snake		;ad89   ; hasta la ultima
	ret			;ad8b
lanzado_de_snake_con_actores:		; cada cosa lanzada por Snake (p07:B734) contra cada actor (p07:B90A; la de tipo 8 solo con los 0x14): el tipo 6 se acaba con p07:AE3D; las demas se acaban salvo con los 0x16-0x17, y el actor cae (p07:B456); los 0x10-0x11 ademas hacen 0x10 de dano a Snake
	ld iy,0cb80h		;ad8c   ; apunta a las 6 fichas de 16 bytes de lo que lanza Snake ([tipo][..][Y 8.8][X 8.8][velocidades]...)
	exx			;ad90
	ld b,006h		;ad91   ; 6 fichas
lanzado_de_snake:
	exx			;ad93
	call caja_lanzado_snake		;ad94   ; su caja
	jr nz,siguiente_lanzado_snake		;ad97   ; sin caja, la siguiente
	ld ix,0ce00h		;ad99   ; apunta a los actores: 24 fichas de 0x40 bytes (p04:800D)
	ld b,018h		;ad9d   ; 24 actores
actor_contra_lanzado:
	ld a,(ix+000h)		;ad9f   ; lee el tipo del actor (0 = libre)
	cp 014h		;ada2
	jr z,caja_del_actor		;ada4   ; el 0x14 vale con todas
	ld a,(iy+000h)		;ada6
	cp 008h		;ada9   ; la de tipo 8 solo con el 0x14
	jr z,siguiente_actor_lanzado		;adab
caja_del_actor:
	exx			;adad
	call caja_actor		;adae   ; caja_actor: la caja del actor en esta sala (p07:BAB3 desde el tipo 0x10, p07:BAB0 los demas)
	exx			;adb1
	jr nz,siguiente_actor_lanzado		;adb2
	call se_tocan		;adb4   ; se tocan?
	jr nc,siguiente_actor_lanzado		;adb7
	ld a,(iy+000h)		;adb9
	cp 006h		;adbc   ; el tipo 6...
	jr nz,golpea_al_actor		;adbe
	xor a			;adc0   ; ...se acaba...
	ld (iy+000h),a		;adc1
	ld (0cb52h),a		;adc4
	call algo_en_la_sala_iy		;adc7   ; ...con p07:AE3D
	jr siguiente_lanzado_snake		;adca
golpea_al_actor:
	ld a,(ix+000h)		;adcc   ; lee el tipo del actor (0 = libre)
	and 07fh		;adcf
	sub 016h		;add1
	cp 002h		;add3   ; los 0x16-0x17, nada
	jr c,siguiente_actor_lanzado		;add5
	xor a			;add7   ; se acaba
	ld (iy+000h),a		;add8
	ld (0cb52h),a		;addb
	ld a,(ix+000h)		;adde   ; lee el tipo del actor (0 = libre)
	and 07fh		;ade1
	sub 010h		;ade3
	cp 002h		;ade5   ; los 0x10-0x11...
	jr nc,cae_el_actor_b		;ade7
	ld c,010h		;ade9   ; ...0x10 de dano a Snake
	xor a			;adeb
	call dano_a_snake		;adec   ; dano_a_snake: 0xD4E7 = A; saliendo de la sala o con 0xCB3C, nada; el actor 0x14 o 0x12 lleva a Snake al estado 0x14 (p03:AC02); si no, el dano C (p07:B393)
cae_el_actor_b:		; el actor cae
	call cae_el_actor_c		;adef   ; cae_el_actor_c: con el byte 0x10 distinto de 0xFF: cae (p04:8326, p04:82FD) guardando los registros
	jr siguiente_lanzado_snake		;adf2
siguiente_actor_lanzado:
	exx			;adf4
	ld de,00040h		;adf5
	add ix,de		;adf8
	exx			;adfa
	djnz actor_contra_lanzado		;adfb
siguiente_lanzado_snake:
	ld de,00010h		;adfd
	add iy,de		;ae00   ; la ficha siguiente (0x10 bytes)
	exx			;ae02
	djnz lanzado_de_snake		;ae03   ; hasta la ultima
	exx			;ae05
	ret			;ae06
lanzado_6_con_snake:		; con 0xCACF: lo de tipo 6 lanzado por Snake que toca a Snake se acaba con p07:AE3D
	ld a,(0cacfh)		;ae07   ; lee 1 al cambiar de direccion lo lanzado de tipo 6 (p11:AAD6)
	or a			;ae0a
	ret z			;ae0b   ; sin 0xCACF, nada
	call caja_de_snake		;ae0c   ; caja_de_snake: la caja de Snake segun su dibujo (p07:B624) bajada 0xCB43 y con 0xCB28 (p07:B608); NZ sin caja: con 0xCB32 (salvo en la zona 0x0A salas 0x0B, 0x0C, 0x10 y 0x11 o con 0xCA8D); con 0xCA8D, la caja sin mas
	ret nz			;ae0f
	ld iy,0cb80h		;ae10   ; apunta a las 6 fichas de 16 bytes de lo que lanza Snake ([tipo][..][Y 8.8][X 8.8][velocidades]...)
	ld b,006h		;ae14   ; 6 fichas
lanzado_6:
	exx			;ae16
	call caja_lanzado_snake		;ae17   ; caja_lanzado_snake: la caja de lo lanzado por Snake (IY) segun su tipo (p07:B73A): los 1, 2 y 9 de 1 x 2; el 6 por p07:B75E; los demas, ninguna
	exx			;ae1a
	jr nz,siguiente_6		;ae1b
	call se_tocan		;ae1d   ; se tocan?
	jr nc,siguiente_6		;ae20
	ld a,(iy+000h)		;ae22
	cp 006h		;ae25   ; solo el 6
	jr nz,siguiente_6		;ae27
	xor a			;ae29
	ld (iy+000h),a		;ae2a
	ld (0cb52h),a		;ae2d
	call algo_en_la_sala_iy		;ae30   ; algo_en_la_sala_iy: p03:B1BE con la fila y la columna de la sala, C = 0x80 y el sitio de lo lanzado (IY)
siguiente_6:
	exx			;ae33
	ld de,00010h		;ae34
	add iy,de		;ae37   ; la ficha siguiente (0x10 bytes)
	exx			;ae39
	djnz lanzado_6		;ae3a   ; hasta la ultima
	ret			;ae3c
algo_en_la_sala_iy:		; p03:B1BE con la fila y la columna de la sala, C = 0x80 y el sitio de lo lanzado (IY)
	push de			;ae3d
	push bc			;ae3e
	push hl			;ae3f
	ld a,(0ca50h)		;ae40   ; lee la fila de la sala en la zona (uno mas al salir por arriba)
	ld e,a			;ae43
	ld a,(0ca51h)		;ae44   ; lee la columna de la sala en la zona (uno mas al salir por la derecha)
	ld d,a			;ae47
	ld c,080h		;ae48
	ld l,(iy+003h)		;ae4a
	ld h,(iy+005h)		;ae4d
	call 08db5h		;ae50   ; a_p03_b1be: p03:B1BE con el banco 3 en 0xA000
	pop hl			;ae53
	pop bc			;ae54
	pop de			;ae55
	ret			;ae56
snake_con_d800:		; la caja de Snake contra las 4 fichas de 0xD800 (p07:B97A): las que tocan (salvo el tipo 9) hacen 4 de dano
	call caja_de_snake		;ae57   ; caja_de_snake: la caja de Snake segun su dibujo (p07:B624) bajada 0xCB43 y con 0xCB28 (p07:B608); NZ sin caja: con 0xCB32 (salvo en la zona 0x0A salas 0x0B, 0x0C, 0x10 y 0x11 o con 0xCA8D); con 0xCA8D, la caja sin mas
	ret nz			;ae5a
	ld ix,0d800h		;ae5b   ; apunta a 4 fichas de 0x20 bytes de 0xD800 (p04:89C3); sus tipos los lleva p10
	ld b,004h		;ae5f   ; 4 fichas
d800_contra_snake:
	exx			;ae61
	call caja_d800_snake		;ae62   ; caja_d800_snake: la caja de la ficha de 0xD800 para tocar a Snake (desde el tipo 3; p07:BA95 el 0x0A, p07:BA92 los demas)
	exx			;ae65
	jr nz,siguiente_d800		;ae66
	ld a,(ix+000h)		;ae68   ; lee el tipo de la ficha de 0xD800
	cp 009h		;ae6b
	jr z,siguiente_d800		;ae6d   ; el tipo 9, nada
	call se_tocan		;ae6f   ; se tocan?
	jr nc,siguiente_d800		;ae72
	ld c,004h		;ae74   ; 4 de dano
	xor a			;ae76
	call dano_a_snake		;ae77   ; dano_a_snake: 0xD4E7 = A; saliendo de la sala o con 0xCB3C, nada; el actor 0x14 o 0x12 lleva a Snake al estado 0x14 (p03:AC02); si no, el dano C (p07:B393)
siguiente_d800:
	exx			;ae7a
	ld de,00020h		;ae7b
	add ix,de		;ae7e   ; la ficha siguiente (0x20 bytes)
	exx			;ae80
	djnz d800_contra_snake		;ae81   ; hasta la ultima
	ret			;ae83
lanzado_de_snake_con_d800:		; cada cosa lanzada por Snake contra las fichas de 0xD800 (p07:B9B5): se acaba; el tipo 6 con p07:AE3D; las demas, el dano de su tipo (p07:B52C) a la ficha (p07:B469)
	ld iy,0cb80h		;ae84   ; apunta a las 6 fichas de 16 bytes de lo que lanza Snake ([tipo][..][Y 8.8][X 8.8][velocidades]...)
	exx			;ae88
	ld b,006h		;ae89   ; 6 fichas
lanzado_d800:
	exx			;ae8b
	call caja_lanzado_snake		;ae8c   ; caja_lanzado_snake: la caja de lo lanzado por Snake (IY) segun su tipo (p07:B73A): los 1, 2 y 9 de 1 x 2; el 6 por p07:B75E; los demas, ninguna
	jr nz,siguiente_lanzado_d800		;ae8f
	ld ix,0d800h		;ae91   ; apunta a 4 fichas de 0x20 bytes de 0xD800 (p04:89C3); sus tipos los lleva p10
	ld b,020h		;ae95
ficha_d800_lanzado:
	exx			;ae97
	call caja_d800		;ae98   ; caja_d800: la caja de la ficha de 0xD800 en esta sala (desde el tipo 3; p07:BAB3 el 7, p07:BAB0 los demas)
	exx			;ae9b
	jr nz,siguiente_ficha_d800		;ae9c
	call se_tocan		;ae9e   ; se tocan?
	jr nc,siguiente_ficha_d800		;aea1
	ld a,(iy+000h)		;aea3   ; C = el tipo...
	ld c,a			;aea6
	xor a			;aea7   ; ...y se acaba
	ld (iy+000h),a		;aea8
	ld (0cb52h),a		;aeab
	ld a,c			;aeae
	cp 006h		;aeaf   ; el 6...
	jr nz,dano_a_d800		;aeb1
	call algo_en_la_sala_iy		;aeb3   ; ...con p07:AE3D
	jr siguiente_ficha_d800		;aeb6
dano_a_d800:		; el dano de su tipo...
	call dano_del_tipo		;aeb8   ; dano_del_tipo: C = el dano del tipo C de lo lanzado por Snake (p07:B535)
	call dano_c_a_d800		;aebb   ; ...a la ficha
siguiente_ficha_d800:
	exx			;aebe
	ld de,00020h		;aebf
	add ix,de		;aec2
	exx			;aec4
	djnz ficha_d800_lanzado		;aec5
siguiente_lanzado_d800:
	ld de,00010h		;aec7
	add iy,de		;aeca   ; la ficha siguiente (0x10 bytes)
	exx			;aecc
	djnz lanzado_d800		;aecd   ; hasta la ultima
	exx			;aecf
	ret			;aed0
delante_con_actores:		; la caja de delante de Snake (p07:B70F) contra cada actor: salvo el 0x0A, los de tipo menor de 0x10 reciben el golpe (p07:B3DA); los 0x10-0x11 hacen 4 de dano a Snake
	call caja_delante		;aed1   ; caja_delante: la caja de 2 x 4 delante de Snake segun su direccion (p07:B72C: arriba Y - 0x20; abajo en Snake; a los lados Y - 0x1C y X - 0x0A o + 0x0A)
	ret nz			;aed4
	ld ix,0ce00h		;aed5   ; apunta a los actores: 24 fichas de 0x40 bytes (p04:800D)
	ld b,018h		;aed9   ; 24 actores
actor_delante:
	exx			;aedb
	call caja_actor		;aedc   ; caja_actor: la caja del actor en esta sala (p07:BAB3 desde el tipo 0x10, p07:BAB0 los demas)
	exx			;aedf
	jr nz,siguiente_delante		;aee0
	call se_tocan		;aee2   ; se tocan?
	jr nc,siguiente_delante		;aee5
	ld a,(ix+000h)		;aee7   ; lee el tipo del actor (0 = libre)
	and 07fh		;aeea
	cp 00ah		;aeec
	jr z,siguiente_delante		;aeee   ; el 0x0A, nada
	cp 010h		;aef0
	jr c,golpe_al_actor		;aef2   ; por debajo de 0x10, el golpe
	sub 010h		;aef4
	cp 002h		;aef6
	jr nc,siguiente_delante		;aef8   ; desde 0x12, nada
	ld c,004h		;aefa   ; los 0x10-0x11: 4 de dano a Snake
	xor a			;aefc
	call dano_a_snake		;aefd   ; dano_a_snake: 0xD4E7 = A; saliendo de la sala o con 0xCB3C, nada; el actor 0x14 o 0x12 lleva a Snake al estado 0x14 (p03:AC02); si no, el dano C (p07:B393)
golpe_al_actor:
	call golpe_al_actor_b		;af00   ; golpe_al_actor_b: el golpe al actor IX (p07:B3E3) guardando HL, DE y BC
siguiente_delante:
	exx			;af03
	ld de,00040h		;af04
	add ix,de		;af07   ; la ficha siguiente (0x40 bytes)
	exx			;af09
	djnz actor_delante		;af0a   ; hasta la ultima
	ret			;af0c
delante_con_d800:		; la caja de delante de Snake contra las fichas de 0xD800 (salvo el tipo 0x0A): 1 de dano a la ficha
	call caja_delante		;af0d   ; caja_delante: la caja de 2 x 4 delante de Snake segun su direccion (p07:B72C: arriba Y - 0x20; abajo en Snake; a los lados Y - 0x1C y X - 0x0A o + 0x0A)
	ret nz			;af10
	ld ix,0d800h		;af11   ; apunta a 4 fichas de 0x20 bytes de 0xD800 (p04:89C3); sus tipos los lleva p10
	ld b,004h		;af15   ; 4 fichas
d800_delante:
	ld a,(ix+000h)		;af17   ; lee el tipo de la ficha de 0xD800
	cp 00ah		;af1a
	jr z,siguiente_d800_delante		;af1c   ; el tipo 0x0A, nada
	exx			;af1e
	call caja_d800		;af1f   ; caja_d800: la caja de la ficha de 0xD800 en esta sala (desde el tipo 3; p07:BAB3 el 7, p07:BAB0 los demas)
	exx			;af22
	jr nz,siguiente_d800_delante		;af23
	call se_tocan		;af25   ; se tocan?
	jr nc,siguiente_d800_delante		;af28
	ld c,001h		;af2a   ; 1 de dano
	call dano_c_a_d800		;af2c   ; dano_c_a_d800: el dano C a la ficha de 0xD800 (p07:B471) guardando los registros
siguiente_d800_delante:
	exx			;af2f
	ld de,00020h		;af30
	add ix,de		;af33   ; la ficha siguiente (0x20 bytes)
	exx			;af35
	djnz d800_delante		;af36   ; hasta la ultima
	ret			;af38
cb44_con_d800:		; en la zona 0x12: la caja de 0xCB44 (p07:B84A) contra las fichas de 0xD800: 6 de dano a la ficha
	ld a,(0ca4ah)		;af39   ; lee la zona
	cp 012h		;af3c
	ret nz			;af3e   ; solo en la zona 0x12
	call caja_cb44		;af3f   ; caja_cb44: con 0xCB44 y 0xCB46 desde 4: la caja de p07:B879 segun la direccion de Snake (4 bytes: E, D, dY, dX)
	ret nz			;af42   ; sin caja, nada
	ld ix,0d800h		;af43   ; apunta a 4 fichas de 0x20 bytes de 0xD800 (p04:89C3); sus tipos los lleva p10
	ld b,004h		;af47   ; 4 fichas
d800_cb44:
	exx			;af49
	call caja_d800		;af4a   ; caja_d800: la caja de la ficha de 0xD800 en esta sala (desde el tipo 3; p07:BAB3 el 7, p07:BAB0 los demas)
	exx			;af4d
	jr nz,siguiente_cb44		;af4e
	call se_tocan		;af50   ; se tocan?
	jr nc,siguiente_cb44		;af53
	ld c,006h		;af55   ; 6 de dano
	call dano_c_a_d800		;af57   ; dano_c_a_d800: el dano C a la ficha de 0xD800 (p07:B471) guardando los registros
siguiente_cb44:
	exx			;af5a
	ld de,00020h		;af5b
	add ix,de		;af5e   ; la ficha siguiente (0x20 bytes)
	exx			;af60
	djnz d800_cb44		;af61   ; hasta la ultima
	ret			;af63
snake_con_df80:		; la caja de Snake (p07:B6CC) contra las 8 fichas de 0xDF80 de esta sala (p07:B790): 0x12 de dano
	call caja_de_snake_c		;af64   ; caja_de_snake_c: sin 0xCB32, la caja del dibujo de Snake (p07:B6E9) bajada 0xCB43
	ret nz			;af67   ; sin caja, nada
	ld iy,0df80h		;af68   ; apunta a 8 fichas de 8 bytes [tipo][dibujo][Y][X][fila][columna][espera][grafico] que suenan 0x14 en la sala y 0x15 al lado
	ld b,008h		;af6c   ; 8 fichas
df80_contra_snake:
	exx			;af6e
	call caja_df80_aqui		;af6f   ; caja_df80_aqui: la caja de la ficha de 0xDF80, si esta activa y en esta sala
	exx			;af72
	jr nz,siguiente_df80		;af73
	call se_tocan		;af75   ; se tocan?
	jr nc,siguiente_df80		;af78
	ld c,012h		;af7a   ; 0x12 de dano
	xor a			;af7c
	call dano_a_snake		;af7d   ; dano_a_snake: 0xD4E7 = A; saliendo de la sala o con 0xCB3C, nada; el actor 0x14 o 0x12 lleva a Snake al estado 0x14 (p03:AC02); si no, el dano C (p07:B393)
siguiente_df80:
	exx			;af80
	ld de,00008h		;af81
	add iy,de		;af84   ; la ficha siguiente (0x08 bytes)
	exx			;af86
	djnz df80_contra_snake		;af87   ; hasta la ultima
	ret			;af89
df80_con_actores:		; cada ficha de 0xDF80 (p07:B787) contra los actores de su sala (p07:B8E4; en la zona 0x0C, los de la fila 3 columna 6 solo en la sala 3): salvo los 0x16-0x17, el actor cae (p07:B456); los 0x10-0x11 hacen 0x10 de dano a Snake
	ld iy,0df80h		;af8a   ; apunta a 8 fichas de 8 bytes [tipo][dibujo][Y][X][fila][columna][espera][grafico] que suenan 0x14 en la sala y 0x15 al lado
	exx			;af8e
	ld b,008h		;af8f   ; 8 fichas
df80_b:
	exx			;af91
	call caja_df80		;af92   ; su caja
	jr nz,siguiente_df80_b		;af95
	ld ix,0ce00h		;af97   ; apunta a los actores: 24 fichas de 0x40 bytes (p04:800D)
	ld b,018h		;af9b   ; 24 actores
actor_df80:
	exx			;af9d
	call caja_actor_df80		;af9e   ; caja_actor_df80: la caja del actor en la sala de la ficha IY
	exx			;afa1
	jr nz,siguiente_actor_df80		;afa2
	ld a,(0ca4ah)		;afa4   ; lee la zona
	cp 00ch		;afa7
	jr nz,toca_df80		;afa9   ; en la zona 0x0C...
	ld a,(ix+00ah)		;afab   ; lee la fila de la sala del actor
	cp 003h		;afae
	jr nz,toca_df80		;afb0   ; ...con el actor en la fila 3...
	ld a,(ix+00bh)		;afb2   ; lee la columna de la sala del actor
	cp 006h		;afb5
	jr nz,toca_df80		;afb7   ; ...columna 6...
	ld a,(0ca4bh)		;afb9   ; lee la sala de la zona
	cp 003h		;afbc
	jr nz,siguiente_actor_df80		;afbe   ; ...solo en la sala 3
toca_df80:		; se tocan?
	call se_tocan		;afc0   ; se_tocan: acarreo si se tocan las dos cajas: la de (H, L) con D y E y la del otro juego de registros (|X - X'| < D + D'; en Y, por debajo menos que E y por encima menos que E')
	jr nc,siguiente_actor_df80		;afc3
	ld a,(ix+000h)		;afc5   ; lee el tipo del actor (0 = libre)
	and 07fh		;afc8
	sub 016h		;afca
	cp 002h		;afcc
	jr c,siguiente_actor_df80		;afce   ; los 0x16-0x17, nada
	ld a,(ix+000h)		;afd0   ; lee el tipo del actor (0 = libre)
	and 07fh		;afd3
	sub 010h		;afd5
	cp 002h		;afd7
	jr nc,cae_por_df80		;afd9   ; los 0x10-0x11...
	ld c,010h		;afdb   ; ...0x10 de dano a Snake
	xor a			;afdd
	call dano_a_snake		;afde   ; dano_a_snake: 0xD4E7 = A; saliendo de la sala o con 0xCB3C, nada; el actor 0x14 o 0x12 lleva a Snake al estado 0x14 (p03:AC02); si no, el dano C (p07:B393)
cae_por_df80:
	call cae_el_actor_c		;afe1   ; cae_el_actor_c: con el byte 0x10 distinto de 0xFF: cae (p04:8326, p04:82FD) guardando los registros
siguiente_actor_df80:
	exx			;afe4
	ld de,00040h		;afe5
	add ix,de		;afe8
	exx			;afea
	djnz actor_df80		;afeb
siguiente_df80_b:
	ld de,00008h		;afed
	add iy,de		;aff0   ; la ficha siguiente (0x08 bytes)
	exx			;aff2
	djnz df80_b		;aff3   ; hasta la ultima
	exx			;aff5
	ret			;aff6
df80_con_d800:		; cada ficha de 0xDF80 contra las de 0xD800 (p07:B991): dano 3 a la ficha (6 sin el bit 7 de su byte 7)
	ld iy,0df80h		;aff7   ; apunta a 8 fichas de 8 bytes [tipo][dibujo][Y][X][fila][columna][espera][grafico] que suenan 0x14 en la sala y 0x15 al lado
	exx			;affb
	ld b,008h		;affc   ; 8 fichas
df80_c:
	exx			;affe
	call caja_df80		;afff   ; caja_df80: la caja de la ficha de 0xDF80 (IY), si esta activa
	jr nz,siguiente_df80_c		;b002   ; sin caja, la siguiente
	ld ix,0d800h		;b004   ; apunta a 4 fichas de 0x20 bytes de 0xD800 (p04:89C3); sus tipos los lleva p10
	ld b,004h		;b008   ; 4 fichas
d800_df80:
	exx			;b00a
	call caja_d800_df80		;b00b   ; caja_d800_df80: la caja de la ficha de 0xD800 en la sala de IY
	exx			;b00e
	jr nz,siguiente_d800_df80		;b00f
	call se_tocan		;b011   ; se tocan?
	jr nc,siguiente_d800_df80		;b014
	ld a,(ix+007h)		;b016   ; con el bit 7 del byte 7, 3...
	ld c,003h		;b019
	and 080h		;b01b
	jr nz,dano_df80		;b01d
	ld c,006h		;b01f   ; ...si no, 6
dano_df80:
	call dano_c_a_d800		;b021   ; dano_c_a_d800: el dano C a la ficha de 0xD800 (p07:B471) guardando los registros
siguiente_d800_df80:
	exx			;b024
	ld de,00020h		;b025
	add ix,de		;b028
	exx			;b02a
	djnz d800_df80		;b02b
siguiente_df80_c:
	ld de,00008h		;b02d
	add iy,de		;b030   ; la ficha siguiente (0x08 bytes)
	exx			;b032
	djnz df80_c		;b033   ; hasta la ultima
	exx			;b035
	ret			;b036
snake_con_cc80:		; sin 0xE1D0: la caja de Snake contra las fichas de 0xCC80 (p07:B7BF): en el estado 2 o el 0x0B, se coge (p07:B06A); si no, p07:B563
	ld a,(0e1d0h)		;b037   ; lee 1 con la ficha de p09:A061 en marcha (zona 0x0A; 0xE1D1 paso, 0xE1D2-0xE1D3 su sitio)
	or a			;b03a
	ret nz			;b03b   ; con 0xE1D0, nada
	call caja_de_snake_c		;b03c   ; caja_de_snake_c: sin 0xCB32, la caja del dibujo de Snake (p07:B6E9) bajada 0xCB43
	ret nz			;b03f   ; sin caja, nada
	ld iy,0cc80h		;b040   ; apunta a 16 fichas de 8 bytes del arma 8 [sitio][paso][Y][X][fila][columna] (p11:B574)
	ld b,030h		;b044   ; 0x30 fichas de 8 bytes
cc80_contra_snake:
	exx			;b046
	call caja_cc80_aqui		;b047   ; caja_cc80_aqui: la caja de la ficha de 0xCC80 si su tipo es el del sitio de Snake (1 normal, 2 en un sitio de 0xCBE0, 3 con 0xCA77, 4 en una sala especial) y esta en esta sala
	exx			;b04a
	jr nz,siguiente_cc80		;b04b
	call se_tocan		;b04d   ; se tocan?
	jr nc,siguiente_cc80		;b050
	ld a,(0cb00h)		;b052   ; lee el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	cp 002h		;b055
	jr z,coge_cc80		;b057   ; en el estado 2...
	cp 00bh		;b059
	jr z,coge_cc80		;b05b   ; ...o el 0x0B, se coge
	call fin_de_cc80		;b05d   ; si no, p07:B563
siguiente_cc80:
	exx			;b060
	ld de,00008h		;b061
	add iy,de		;b064   ; la ficha siguiente (0x08 bytes)
	exx			;b066
	djnz cc80_contra_snake		;b067   ; hasta la ultima
	ret			;b069
coge_cc80:		; p12:6E6C, la ficha fuera, 0xD61C = 1, 7 mas a la cosa 1 (p03:BDA5) y el sonido 0x10
	call p12_6e6c_iy		;b06a   ; p12_6e6c_iy: p12:6E6C con la ficha de IY guardando los registros
	xor a			;b06d   ; la ficha fuera
	ld (iy+000h),a		;b06e
	ld (0cb52h),a		;b071
	push bc			;b074
	push hl			;b075
	push de			;b076
	ld hl,0d61ch		;b077   ; 0xD61C = 1
	ld (hl),001h		;b07a
	call 08d90h		;b07c   ; 7 mas a la cosa 1
	pop de			;b07f
	pop hl			;b080
	pop bc			;b081
	jp 06a38h		;b082   ; sonido_10: pide el sonido 0x10
cc80_con_actores:		; cada ficha de 0xCC80 (p07:B7B6) contra los actores de su sala (p07:B8EC; salvo los tipos 1 y 4, no el actor de su byte 0x1B): salvo los 0x16-0x17, p07:B563
	ld iy,0cc80h		;b085   ; apunta a 16 fichas de 8 bytes del arma 8 [sitio][paso][Y][X][fila][columna] (p11:B574)
	exx			;b089
	ld b,030h		;b08a   ; 0x30 fichas
cc80_b:
	exx			;b08c
	call caja_cc80		;b08d   ; caja_cc80: la caja de la ficha de 0xCC80 (IY), si esta activa
	jr nz,siguiente_cc80_b		;b090
	ld ix,0ce00h		;b092   ; apunta a los actores: 24 fichas de 0x40 bytes (p04:800D)
	ld b,018h		;b096   ; 24 actores
actor_cc80:
	ld a,(iy+000h)		;b098
	cp 001h		;b09b
	jr z,misma_sala_cc80		;b09d   ; los tipos 1...
	cp 004h		;b09f
	jr z,misma_sala_cc80		;b0a1   ; ...y 4 valen con todos
	cp (ix+01bh)		;b0a3   ; los demas, no con el de su byte 0x1B
	jr z,siguiente_actor_cc80		;b0a6
misma_sala_cc80:		; la sala del actor...
	ld a,(ix+00ah)		;b0a8   ; lee la fila de la sala del actor
	cp (iy+004h)		;b0ab
	jr nz,siguiente_actor_cc80		;b0ae   ; ...es la de la ficha?
	ld a,(ix+00bh)		;b0b0   ; lee la columna de la sala del actor
	cp (iy+005h)		;b0b3
	jr nz,siguiente_actor_cc80		;b0b6
	exx			;b0b8
	call caja_actor_cc80		;b0b9   ; la caja del actor
	exx			;b0bc
	jr nz,siguiente_actor_cc80		;b0bd
	call se_tocan		;b0bf   ; se tocan?
	jr nc,siguiente_actor_cc80		;b0c2
	ld a,(ix+000h)		;b0c4   ; lee el tipo del actor (0 = libre)
	and 07fh		;b0c7
	sub 016h		;b0c9
	cp 002h		;b0cb
	jr c,siguiente_actor_cc80		;b0cd   ; los 0x16-0x17, nada
	call fin_de_cc80		;b0cf   ; fin_de_cc80: la ficha de 0xCC80 (IY) se acaba: p12:6E6C, tipo 0 y p03:B1BE con C = 1 en su sitio (Y - 4 y X - 4, pares, hasta 0xB0) y su fila y columna
siguiente_actor_cc80:
	exx			;b0d2
	ld de,00040h		;b0d3
	add ix,de		;b0d6
	exx			;b0d8
	djnz actor_cc80		;b0d9
siguiente_cc80_b:
	ld de,00008h		;b0db
	add iy,de		;b0de   ; la ficha siguiente (0x08 bytes)
	exx			;b0e0
	djnz cc80_b		;b0e1   ; hasta la ultima
	exx			;b0e3
	ret			;b0e4
cc80_con_d800:		; las 16 primeras fichas de 0xCC80 contra las de 0xD800 de su sala (p07:B999): los tipos 1 y 4 con todas salvo el 0x0B, el 2 con ninguna, los demas solo con el 0x0B; p07:B563
	ld iy,0cc80h		;b0e5   ; apunta a 16 fichas de 8 bytes del arma 8 [sitio][paso][Y][X][fila][columna] (p11:B574)
	exx			;b0e9
	ld b,010h		;b0ea   ; 16 fichas
cc80_c:
	exx			;b0ec
	call caja_cc80		;b0ed   ; caja_cc80: la caja de la ficha de 0xCC80 (IY), si esta activa
	jr nz,siguiente_cc80_c		;b0f0
	ld ix,0d800h		;b0f2   ; apunta a 4 fichas de 0x20 bytes de 0xD800 (p04:89C3); sus tipos los lleva p10
	ld b,004h		;b0f6   ; 4 fichas
d800_cc80:
	exx			;b0f8
	call caja_d800_cc80		;b0f9   ; caja_d800_cc80: la caja de la ficha de 0xD800 en la sala de IY (desde el tipo 3; p07:BAD1 el 7, p07:BACE los demas)
	exx			;b0fc
	jr nz,siguiente_d800_cc80		;b0fd
	ld a,(iy+000h)		;b0ff
	cp 001h		;b102
	jr z,cc80_tipo_1_4		;b104   ; el tipo 1...
	cp 004h		;b106
	jr z,cc80_tipo_1_4		;b108   ; ...y el 4: todas salvo el 0x0B
	cp 002h		;b10a
	jr z,siguiente_d800_cc80		;b10c   ; el 2: ninguna
	ld a,(ix+000h)		;b10e   ; lee el tipo de la ficha de 0xD800
	cp 00bh		;b111
	jr nz,siguiente_d800_cc80		;b113   ; los demas: solo el 0x0B
	jr misma_sala_d800		;b115
cc80_tipo_1_4:
	ld a,(ix+000h)		;b117   ; lee el tipo de la ficha de 0xD800
	cp 00bh		;b11a
	jr z,siguiente_d800_cc80		;b11c
misma_sala_d800:		; la sala de la ficha de 0xD800...
	ld a,(ix+00ah)		;b11e
	cp (iy+004h)		;b121
	jr nz,siguiente_d800_cc80		;b124   ; ...es la de la de 0xCC80?
	ld a,(ix+00bh)		;b126
	cp (iy+005h)		;b129
	jr nz,siguiente_d800_cc80		;b12c
	call se_tocan		;b12e   ; se tocan?
	jr nc,siguiente_d800_cc80		;b131
	call fin_de_cc80		;b133   ; fin_de_cc80: la ficha de 0xCC80 (IY) se acaba: p12:6E6C, tipo 0 y p03:B1BE con C = 1 en su sitio (Y - 4 y X - 4, pares, hasta 0xB0) y su fila y columna
siguiente_d800_cc80:
	exx			;b136
	ld de,00020h		;b137
	add ix,de		;b13a
	exx			;b13c
	djnz d800_cc80		;b13d
siguiente_cc80_c:
	ld de,00008h		;b13f
	add iy,de		;b142   ; la ficha siguiente (0x08 bytes)
	exx			;b144
	djnz cc80_c		;b145   ; hasta la ultima
	exx			;b147
	ret			;b148
choques_dff8:		; con 0xDFF8: la caja de 0xDFF8 (p07:B889) con Snake (p07:B156), con los actores (p07:B170) y con las fichas de 0xD800 (p07:B1B1)
	ld a,(0dff8h)		;b149   ; lee con el, la caja de 0xDFFD/0xDFFE choca (p07:B149)
	or a			;b14c
	ret z			;b14d
	call dff8_con_snake		;b14e   ; dff8_con_snake: salvo con 0xCB21 = 4: si toca a Snake, 0x10 de dano
	call dff8_con_actores		;b151   ; dff8_con_actores: sin 0xD437: los actores de tipo menor de 0x13 que toca caen (p07:B456); los 0x10-0x11 hacen 6 de dano a Snake
	jr dff8_con_d800		;b154
dff8_con_snake:		; salvo con 0xCB21 = 4: si toca a Snake, 0x10 de dano
	ld a,(0cb21h)		;b156   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	cp 004h		;b159
	ret z			;b15b   ; con 4 en 0xCB21, nada
	call caja_de_snake		;b15c   ; caja_de_snake: la caja de Snake segun su dibujo (p07:B624) bajada 0xCB43 y con 0xCB28 (p07:B608); NZ sin caja: con 0xCB32 (salvo en la zona 0x0A salas 0x0B, 0x0C, 0x10 y 0x11 o con 0xCA8D); con 0xCA8D, la caja sin mas
	ret nz			;b15f   ; sin caja, nada
	exx			;b160
	call caja_dff8		;b161   ; caja_dff8: con 0xDFF8 y 0xCA61: la caja segun 0xCA61 (p07:B89B)
	exx			;b164
	ret nz			;b165
	call se_tocan		;b166   ; se tocan?
	ret nc			;b169
	ld c,010h		;b16a   ; 0x10 de dano
	xor a			;b16c
	jp dano_a_snake		;b16d   ; dano_a_snake: 0xD4E7 = A; saliendo de la sala o con 0xCB3C, nada; el actor 0x14 o 0x12 lleva a Snake al estado 0x14 (p03:AC02); si no, el dano C (p07:B393)
dff8_con_actores:		; sin 0xD437: los actores de tipo menor de 0x13 que toca caen (p07:B456); los 0x10-0x11 hacen 6 de dano a Snake
	ld a,(0d437h)		;b170
	or a			;b173
	ret nz			;b174   ; con 0xD437, nada
	call caja_dff8		;b175   ; caja_dff8: con 0xDFF8 y 0xCA61: la caja segun 0xCA61 (p07:B89B)
	ld ix,0ce00h		;b178   ; apunta a los actores: 24 fichas de 0x40 bytes (p04:800D)
	ld b,018h		;b17c   ; 24 actores
actor_dff8:
	exx			;b17e
	call caja_actor		;b17f   ; caja_actor: la caja del actor en esta sala (p07:BAB3 desde el tipo 0x10, p07:BAB0 los demas)
	exx			;b182
	jr nz,siguiente_dff8		;b183
	call se_tocan		;b185   ; se tocan?
	jr nc,siguiente_dff8		;b188
	ld a,(ix+000h)		;b18a   ; lee el tipo del actor (0 = libre)
	and 07fh		;b18d
	cp 013h		;b18f
	jr nc,siguiente_dff8		;b191   ; desde 0x13, nada
	ld a,(ix+000h)		;b193   ; lee el tipo del actor (0 = libre)
	and 07fh		;b196
	sub 010h		;b198
	cp 002h		;b19a
	jr nc,cae_por_dff8		;b19c   ; los 0x10-0x11...
	ld c,006h		;b19e   ; ...6 de dano a Snake
	xor a			;b1a0
	call dano_a_snake		;b1a1   ; dano_a_snake: 0xD4E7 = A; saliendo de la sala o con 0xCB3C, nada; el actor 0x14 o 0x12 lleva a Snake al estado 0x14 (p03:AC02); si no, el dano C (p07:B393)
cae_por_dff8:
	call cae_el_actor_c		;b1a4   ; cae_el_actor_c: con el byte 0x10 distinto de 0xFF: cae (p04:8326, p04:82FD) guardando los registros
siguiente_dff8:
	exx			;b1a7
	ld de,00040h		;b1a8
	add ix,de		;b1ab   ; la ficha siguiente (0x40 bytes)
	exx			;b1ad
	djnz actor_dff8		;b1ae   ; hasta la ultima
	ret			;b1b0
dff8_con_d800:		; las fichas de 0xD800 de tipo 5 u 8 que toca: 3 de dano
	call caja_dff8		;b1b1   ; caja_dff8: con 0xDFF8 y 0xCA61: la caja segun 0xCA61 (p07:B89B)
	ld ix,0d800h		;b1b4   ; apunta a 4 fichas de 0x20 bytes de 0xD800 (p04:89C3); sus tipos los lleva p10
	ld b,004h		;b1b8   ; 4 fichas
d800_dff8:
	exx			;b1ba
	call caja_d800		;b1bb   ; caja_d800: la caja de la ficha de 0xD800 en esta sala (desde el tipo 3; p07:BAB3 el 7, p07:BAB0 los demas)
	exx			;b1be
	jr nz,siguiente_d800_dff8		;b1bf
	ld a,(ix+000h)		;b1c1   ; lee el tipo de la ficha de 0xD800
	cp 008h		;b1c4
	jr z,toca_dff8		;b1c6   ; el 8...
	cp 005h		;b1c8
	jr nz,siguiente_d800_dff8		;b1ca   ; ...o el 5
toca_dff8:
	call se_tocan		;b1cc   ; se_tocan: acarreo si se tocan las dos cajas: la de (H, L) con D y E y la del otro juego de registros (|X - X'| < D + D'; en Y, por debajo menos que E y por encima menos que E')
	jr nc,siguiente_d800_dff8		;b1cf
	ld c,003h		;b1d1   ; 3 de dano
	call dano_c_a_d800		;b1d3   ; dano_c_a_d800: el dano C a la ficha de 0xD800 (p07:B471) guardando los registros
siguiente_d800_dff8:
	exx			;b1d6
	ld de,00020h		;b1d7
	add ix,de		;b1da   ; la ficha siguiente (0x20 bytes)
	exx			;b1dc
	djnz d800_dff8		;b1dd   ; hasta la ultima
	ret			;b1df
snake_con_d760:		; con lo mismo que p06:AA49 (0xD881-0xD883, 0xD678-0xD69C), sin 0xCA8D, con la ficha 0xD760 del sitio de Snake (p07:B23A) y fuera del estado 0x0B (en el 2, solo a los lados): si la caja de Snake toca la de 0xD760 (p07:B804), el sonido 0x10, p11:AEE4 y una mas de la cosa 9
	ld a,(0d881h)		;b1e0
	inc a			;b1e3   ; 0xD881 a 0xFF: vale
	jr z,mira_ca8d		;b1e4
	ld a,(0d88ah)		;b1e6
	inc a			;b1e9
	jr nz,mira_d883_b		;b1ea   ; 0xD88A distinto de 0xFF: mira 0xD883
	ld a,(0d680h)		;b1ec
	or a			;b1ef
	jr nz,mira_d883_b		;b1f0   ; con 0xD680...
	ld a,(0d69ch)		;b1f2
	or a			;b1f5
	ret z			;b1f6   ; ...o 0xD69C; sin ninguno, nada
mira_d883_b:
	ld a,(0d883h)		;b1f7
	inc a			;b1fa
	jr nz,mira_ca8d		;b1fb   ; 0xD883 distinto de 0xFF: vale
	ld a,(0d678h)		;b1fd
	or a			;b200
	jr nz,mira_ca8d		;b201   ; con 0xD678...
	ld a,(0d68ch)		;b203
	or a			;b206
	ret z			;b207   ; ...o 0xD68C; sin ninguno, nada
mira_ca8d:
	ld a,(0ca8dh)		;b208   ; lee con el, otros choques de Snake con los actores (p07:AD1E)
	or a			;b20b
	ret nz			;b20c   ; con 0xCA8D, nada
	call d760_aqui		;b20d   ; d760_aqui: Z si el byte 0 de 0xD760 es el del sitio de Snake: 3 con 0xD8C0, 2 en un sitio de 0xCBE0, 4 en una sala especial, 1 en las demas
	ret nz			;b210   ; la ficha de otro sitio, nada
	ld a,(0cb00h)		;b211   ; lee el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	cp 00bh		;b214
	ret z			;b216   ; en el estado 0x0B, nada
	cp 002h		;b217
	jr nz,caja_d760		;b219
	ld a,(0cb0eh)		;b21b   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	cp 003h		;b21e   ; en el 2, solo a los lados
	ret c			;b220
caja_d760:
	call caja_de_snake_c		;b221   ; caja_de_snake_c: sin 0xCB32, la caja del dibujo de Snake (p07:B6E9) bajada 0xCB43
	ret nz			;b224   ; sin caja, nada
	exx			;b225
	call caja_de_d760		;b226   ; caja_de_d760: la caja de la ficha 0xD760, si esta activa, con el byte 0 del sitio de Snake (4 sala especial, 3 con 0xD8C0, 2 en un sitio, 1) y en esta sala: en (Y + 0x20, X + 8), 8 x 0x20
	exx			;b229
	ret nz			;b22a
	call se_tocan		;b22b   ; se tocan?
	ret nc			;b22e
	call 06a38h		;b22f   ; sonido_10: pide el sonido 0x10
	call 08d9dh		;b232   ; p11:AEE4
	ld a,009h		;b235   ; una mas de la cosa 9
	jp 08da5h		;b237   ; a_p03_be51: p03:BE51 con el banco 3 en 0xA000
d760_aqui:		; Z si el byte 0 de 0xD760 es el del sitio de Snake: 3 con 0xD8C0, 2 en un sitio de 0xCBE0, 4 en una sala especial, 1 en las demas
	ld b,003h		;b23a
	ld a,(0d8c0h)		;b23c   ; lee 1 con Snake dentro de lo de 0xD8C2 (p07:A40D; 0 al salir, p07:A69A)
	or a			;b23f
	jr nz,compara_d760		;b240
	dec b			;b242
	ld a,(0ca65h)		;b243   ; lee el sitio de 0xCBE0 en el que esta Snake (0 = ninguno)
	or a			;b246
	jr nz,compara_d760		;b247
	ld b,004h		;b249
	ld a,(0ca76h)		;b24b   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	or a			;b24e
	jr nz,compara_d760		;b24f
	ld b,001h		;b251
compara_d760:
	ld a,(0d760h)		;b253   ; lee una ficha de 16 bytes [sitio][..][Y][X][fila][columna]; la toca Snake en p07:B1E0
	cp b			;b256
	ret			;b257
snake_con_18_y_e060:		; Snake con los actores de tipo 0x18 (p07:B25D) y con la ficha de 0xE060 (p07:B29A)
	call snake_con_18		;b258   ; snake_con_18: si la caja de Snake toca un actor de tipo 0x18: el sonido 0x10, fuera (p04:834C) y una cosa al azar (p07:B2C0)
	jr snake_con_e060		;b25b
snake_con_18:		; si la caja de Snake toca un actor de tipo 0x18: el sonido 0x10, fuera (p04:834C) y una cosa al azar (p07:B2C0)
	call caja_de_snake_c		;b25d   ; caja_de_snake_c: sin 0xCB32, la caja del dibujo de Snake (p07:B6E9) bajada 0xCB43
	ret nz			;b260   ; sin caja, nada
	ld ix,0ce00h		;b261   ; apunta a los actores: 24 fichas de 0x40 bytes (p04:800D)
	ld b,018h		;b265   ; 24 actores
actor_18:
	exx			;b267
	call caja_actor		;b268   ; caja_actor: la caja del actor en esta sala (p07:BAB3 desde el tipo 0x10, p07:BAB0 los demas)
	exx			;b26b
	jr nz,siguiente_18		;b26c
	ld a,(ix+000h)		;b26e   ; lee el tipo del actor (0 = libre)
	and 07fh		;b271
	cp 018h		;b273
	jr nz,siguiente_18		;b275   ; solo el 0x18
	call se_tocan		;b277   ; se tocan?
	jr nc,siguiente_18		;b27a
	push ix		;b27c
	push de			;b27e
	push bc			;b27f
	push hl			;b280
	call 06a38h		;b281   ; sonido_10: pide el sonido 0x10
	call 07ae8h		;b284   ; fuera
	call cosa_al_azar		;b287   ; una cosa al azar
	pop hl			;b28a
	pop bc			;b28b
	pop de			;b28c
	pop ix		;b28d
	ret			;b28f
siguiente_18:
	exx			;b290
	ld de,00040h		;b291
	add ix,de		;b294   ; la ficha siguiente (0x40 bytes)
	exx			;b296
	djnz actor_18		;b297   ; hasta la ultima
	ret			;b299
snake_con_e060:		; con 0xE060, si la caja de Snake toca la suya (p07:B2F9): el sonido 0x10, 0xE060 = 0, los sprites de 0xDC70 fuera y una cosa al azar
	ld a,(0e060h)		;b29a   ; lee 1 con la ficha de 0xE063/0xE065 en la sala (p07:B29A; se coge)
	or a			;b29d
	ret z			;b29e   ; sin 0xE060, nada
	call caja_de_snake_c		;b29f   ; caja_de_snake_c: sin 0xCB32, la caja del dibujo de Snake (p07:B6E9) bajada 0xCB43
	ret nz			;b2a2   ; sin caja, nada
	exx			;b2a3
	call caja_e060		;b2a4   ; la caja de 0xE060
	exx			;b2a7
	call se_tocan		;b2a8   ; se tocan?
	ret nc			;b2ab
	call 06a38h		;b2ac   ; sonido_10: pide el sonido 0x10
	xor a			;b2af   ; 0xE060 = 0
	ld (0e060h),a		;b2b0   ; guarda 1 con la ficha de 0xE063/0xE065 en la sala (p07:B29A; se coge)
	ld hl,0dc70h		;b2b3   ; 0xDC70-0xDC77 a 0xE0
	ld de,0dc71h		;b2b6
	ld (hl),0e0h		;b2b9
	ld bc,00007h		;b2bb
	ldir		;b2be
cosa_al_azar:		; la cosa de p07:B2E9 al azar (R & 0x0F; & 7 con 0xCB73 desde 3) y p03:BD82; con las de numero menor de 0x31, 0xCB73 sube hasta 3
	ld l,00fh		;b2c0
	ld a,(0cb73h)		;b2c2   ; con 0xCB73 desde 3...
	cp 003h		;b2c5
	jr c,elige_cosa		;b2c7
	ld l,007h		;b2c9   ; ...solo las 8 primeras
elige_cosa:		; R & L
	ld a,r		;b2cb
	and l			;b2cd
	ld hl,0b2e9h		;b2ce
	call 0423eh		;b2d1   ; suma_a_hl: HL = HL + A
	ld a,(hl)			;b2d4   ; la cosa
	push af			;b2d5
	cp 031h		;b2d6
	jr nc,lleva_la_cosa		;b2d8   ; desde la 0x31, sin contar
	ld a,(0cb73h)		;b2da   ; lee cuantas cosas al azar de p07:B2E9 se han dado (hasta 3)
	cp 003h		;b2dd
	jr nc,lleva_la_cosa		;b2df   ; 0xCB73 hasta 3...
	inc a			;b2e1   ; ...uno mas
	ld (0cb73h),a		;b2e2   ; guarda cuantas cosas al azar de p07:B2E9 se han dado (hasta 3)
lleva_la_cosa:
	pop af			;b2e5
	jp 08dd3h		;b2e6   ; a_p03_bd82: p03:BD82 con el banco 3 en 0xA000

; ----------------------------------------------------------------------
; DATOS resto_B2E9: lo apuntan con el banco puesto p07:B2CE (0xB2E9); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p07:B2CE (16 bytes)
;   0xb2e9..0xb2f9  (16 bytes)
DATA_resto_B2E9:
	defb 032h,037h,033h,034h,035h,03bh,035h,036h,02eh,02eh,038h,03ah,02fh,039h,02fh,030h	; b2e9  27345.56..8:/9/0

; ======================================================================
; CODIGO 0xb2f9..0xb447  (334 bytes)
; ======================================================================


caja_e060:		; la caja de 0xE060: Y = 0xE063 + 0x10, X = 0xE065 + 8, 8 x 0x10
	ld a,(0e063h)		;b2f9
	add a,010h		;b2fc   ; la Y + 0x10
	ld l,a			;b2fe
	ld a,(0e065h)		;b2ff
	add a,008h		;b302   ; la X + 8
	ld h,a			;b304
	ld de,00810h		;b305   ; 8 x 0x10
	ret			;b308
snake_con_d4c0:		; la caja de Snake contra las 2 fichas de 0xD4C0 (p07:BA1D): 0x18 de dano y p14:AB01
	call caja_de_snake		;b309   ; caja_de_snake: la caja de Snake segun su dibujo (p07:B624) bajada 0xCB43 y con 0xCB28 (p07:B608); NZ sin caja: con 0xCB32 (salvo en la zona 0x0A salas 0x0B, 0x0C, 0x10 y 0x11 o con 0xCA8D); con 0xCA8D, la caja sin mas
	ret nz			;b30c   ; sin caja, nada
	ld ix,0d4c0h		;b30d   ; apunta a 2 fichas de 16 bytes; tocan a Snake con 0x18 de dano (p07:B309)
	ld b,002h		;b311   ; 2 fichas
d4c0_contra_snake:
	exx			;b313
	call caja_d4c0		;b314   ; caja_d4c0: la caja de la ficha de 0xD4C0: activa y en los pasos 0-2; la entrada del byte 0x0F (menos 3 desde 3) de p07:BB04
	exx			;b317
	jr nz,siguiente_d4c0		;b318
	call se_tocan		;b31a   ; se tocan?
	jr nc,siguiente_d4c0		;b31d
	ld c,018h		;b31f   ; 0x18 de dano
	xor a			;b321
	call quita_vida		;b322   ; quita_vida: la vida menos C (p07:B3A5), las barras, p02:8DCB y el sonido 0x40
	push hl			;b325
	push de			;b326
	push bc			;b327
	call 07b09h		;b328   ; p14:AB01
	pop bc			;b32b
	pop de			;b32c
	pop hl			;b32d
siguiente_d4c0:
	exx			;b32e
	ld de,00010h		;b32f
	add ix,de		;b332   ; la ficha siguiente (0x10 bytes)
	exx			;b334
	djnz d4c0_contra_snake		;b335   ; hasta la ultima
	ret			;b337
snake_con_d820:		; en la sala 2, con la ficha 0xD820 de tipo 9 en los dibujos 8-0x0B: si su caja (p07:BA71) toca a Snake, 4 de dano y, sin 0xCB54, 0xCB54 = 1 y 0xCB56 = 9
	ld a,(0ca4bh)		;b338   ; lee la sala de la zona
	cp 002h		;b33b
	ret nz			;b33d   ; solo en la sala 2
	ld ix,0d820h		;b33e
	ld a,(ix+000h)		;b342   ; lee el tipo de la ficha de 0xD800
	cp 009h		;b345
	ret nz			;b347   ; solo el tipo 9
	ld a,(ix+00dh)		;b348   ; lee el dibujo de la ficha de 0xD800
	sub 008h		;b34b
	cp 004h		;b34d
	ret nc			;b34f   ; solo los dibujos 8-0x0B
	call caja_de_snake		;b350   ; la caja de Snake
	exx			;b353
	call caja_d820		;b354   ; la de la ficha
	exx			;b357
	call se_tocan		;b358   ; se tocan?
	ret nc			;b35b
	ld c,004h		;b35c   ; 4 de dano
	call dano_sin_d4e7		;b35e   ; dano_sin_d4e7: 0xD4E7 = 0 y el dano C (p07:B393)
	ld a,(0cb54h)		;b361
	or a			;b364
	ret nz			;b365   ; con 0xCB54, nada mas
	ld a,001h		;b366   ; 0xCB54 = 1...
	ld (0cb54h),a		;b368
	ld a,009h		;b36b   ; ...0xCB56 = 9
	ld (0cb56h),a		;b36d
	ret			;b370
dano_sin_d4e7:		; 0xD4E7 = 0 y el dano C (p07:B393)
	xor a			;b371
	ld (0d4e7h),a		;b372
	jr quita_vida		;b375
dano_a_snake:		; 0xD4E7 = A; saliendo de la sala o con 0xCB3C, nada; el actor 0x14 o 0x12 lleva a Snake al estado 0x14 (p03:AC02); si no, el dano C (p07:B393)
	ld (0d4e7h),a		;b377
	ld a,(0ca41h)		;b37a   ; lee la salida de la sala (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	and a			;b37d
	ret nz			;b37e   ; saliendo, nada
	ld a,(0cb3ch)		;b37f
	or a			;b382
	ret nz			;b383   ; en una escena, nada
	ld a,(ix+000h)		;b384
	and 07fh		;b387
	cp 014h		;b389
	jp z,08dbdh		;b38b   ; el 0x14: al estado 0x14
	cp 012h		;b38e
	jp z,08dbdh		;b390   ; el 0x12: al estado 0x14
quita_vida:		; la vida menos C (p07:B3A5), las barras, p02:8DCB y el sonido 0x40
	push hl			;b393
	push de			;b394
	push bc			;b395
	call vida_menos_c		;b396   ; la vida
	call 08dc6h		;b399   ; las barras
	call 08dcbh		;b39c   ; p02:8DCB
	pop bc			;b39f
	pop de			;b3a0
	pop hl			;b3a1
	jp 06b16h		;b3a2   ; sonido_40: pide el sonido 0x40
vida_menos_c:		; sin 0xCB3D y fuera del estado 0x14: 0xCA53 menos C (la mitad con 0xD4E7 y 0xCB21 = 5); a 0, p10:BFBC y, si sigue a 0, el estado 0x14
	ld a,(0cb3dh)		;b3a5
	or a			;b3a8
	ret nz			;b3a9   ; con 0xCB3D, nada
	ld a,(0cb00h)		;b3aa   ; lee el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	cp 014h		;b3ad
	ret z			;b3af   ; en el estado 0x14, nada
	ld a,(0d4e7h)		;b3b0
	or a			;b3b3
	jr z,resta_vida		;b3b4   ; sin 0xD4E7, entero
	ld a,(0cb21h)		;b3b6   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	cp 005h		;b3b9
	jr nz,resta_vida		;b3bb   ; sin 0xCB21 = 5, entero
	ld a,c			;b3bd   ; la mitad
	rra			;b3be
	and 07fh		;b3bf
	ld c,a			;b3c1
resta_vida:
	ld hl,0ca53h		;b3c2   ; apunta a la vida de Snake (lo largo de la barra)
	ld a,(hl)			;b3c5
	sub c			;b3c6   ; menos el dano
	jr z,vida_a_cero		;b3c7   ; a cero o por debajo...
	jr c,vida_a_cero		;b3c9
	ld (hl),a			;b3cb   ; ...si queda, esa
	ret			;b3cc
vida_a_cero:		; a cero
	ld (hl),000h		;b3cd
	call 08dadh		;b3cf   ; p10:BFBC
	ld a,(0ca53h)		;b3d2   ; lee la vida de Snake (lo largo de la barra)
	or a			;b3d5
	jp z,08dbdh		;b3d6   ; sigue a cero: el estado 0x14
	ret			;b3d9
golpe_al_actor_b:		; el golpe al actor IX (p07:B3E3) guardando HL, DE y BC
	push hl			;b3da
	push de			;b3db
	push bc			;b3dc
	call golpe_a_ix		;b3dd   ; golpe_a_ix: con el byte 0x10 distinto de 0xFF: el sonido 0x13, el byte 0x1F = 4 y uno menos al 0x10; queda: al paso 8 (p04:8EBE); a 0: quiza una cosa (p07:B401) y cae (p04:8326, p04:82FD)
	jp recupera_hl_de_bc		;b3e0   ; recupera_hl_de_bc:
golpe_a_ix:		; con el byte 0x10 distinto de 0xFF: el sonido 0x13, el byte 0x1F = 4 y uno menos al 0x10; queda: al paso 8 (p04:8EBE); a 0: quiza una cosa (p07:B401) y cae (p04:8326, p04:82FD)
	ld a,(ix+010h)		;b3e3
	cp 0ffh		;b3e6   ; 0xFF: no le pasa nada
	ret z			;b3e8
	call 06a40h		;b3e9   ; sonido_13: pide el sonido 0x13
	ld (ix+01fh),004h		;b3ec   ; el byte 0x1F = 4
	dec (ix+010h)		;b3f0   ; uno menos
	jr z,actor_vencido		;b3f3
	jp 07af9h		;b3f5   ; queda: al paso 8
actor_vencido:		; quiza una cosa
	call cosa_del_actor		;b3f8   ; cosa_del_actor: sin alerta y con el tipo menor de 0x0A: si el contador de cuadros * 4 llega al valor de p07:B447 del nivel de Snake, la cosa 0x2E + (cuadros & 0x0F) / 4 (la 0x31 solo con la cosa 0 o la 1) donde estaba (p04:8C4A)
	call 07af0h		;b3fb   ; cae
	jp 07ae0h		;b3fe   ; a_p04_82fd: p04:82FD con el banco 4 en 0x8000
cosa_del_actor:		; sin alerta y con el tipo menor de 0x0A: si el contador de cuadros * 4 llega al valor de p07:B447 del nivel de Snake, la cosa 0x2E + (cuadros & 0x0F) / 4 (la 0x31 solo con la cosa 0 o la 1) donde estaba (p04:8C4A)
	ld a,(0ca5fh)		;b401   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	and a			;b404
	ret nz			;b405   ; con alerta, nada
	ld a,(ix+000h)		;b406
	and 07fh		;b409
	cp 00ah		;b40b
	ret nc			;b40d   ; desde el tipo 0x0A, nada
	ld a,(0cab5h)		;b40e   ; el valor del nivel
	ld hl,0b447h		;b411
	call 0423eh		;b414   ; suma_a_hl: HL = HL + A
	ld a,(0ca03h)		;b417   ; los cuadros...
	ld b,a			;b41a
	add a,a			;b41b   ; ...* 4
	add a,a			;b41c
	cp (hl)			;b41d
	ret c			;b41e   ; por debajo, nada
	ld a,b			;b41f
	and 00fh		;b420   ; cuadros & 0x0F: 0-3...
	ld c,000h		;b422
	cp 004h		;b424
	jr c,numero_de_cosa		;b426
	inc c			;b428   ; ...4-7...
	cp 008h		;b429
	jr c,numero_de_cosa		;b42b
	inc c			;b42d   ; ...8-0x0B...
	cp 00ch		;b42e
	jr c,numero_de_cosa		;b430
	inc c			;b432   ; ...0x0C-0x0F
numero_de_cosa:
	ld a,c			;b433
	add a,02eh		;b434   ; + 0x2E
	ld c,a			;b436
	cp 031h		;b437   ; la 0x31...
	jr nz,deja_cosa		;b439
	ld a,(0d600h)		;b43b   ; ...solo con la cosa 0...
	ld b,a			;b43e
	ld a,(0d604h)		;b43f   ; ...o la 1
	or b			;b442
	ret z			;b443
deja_cosa:
	jp 07b01h		;b444   ; a_p04_8c4a: p04:8C4A con el banco 4 en 0x8000

; ----------------------------------------------------------------------
; DATOS resto_B447: lo apuntan con el banco puesto p07:B411 (0xB447); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p07:B411 (7 bytes)
;   0xb447..0xb44e  (7 bytes)
DATA_resto_B447:
	defb 0b0h,0b8h,0c8h,0d0h,0d8h,0e0h,0e8h	; b447

; ======================================================================
; CODIGO 0xb44e..0xb521  (211 bytes)
; ======================================================================


fin_de_lanzado_b:		; lo lanzado se acaba (p04:9CA1) guardando los registros
	push hl			;b44e
	push de			;b44f
	push bc			;b450
	call 07ac8h		;b451   ; a_p04_9ca1: p04:9CA1 con el banco 4 en 0x8000
	jr recupera_hl_de_bc		;b454
cae_el_actor_c:		; con el byte 0x10 distinto de 0xFF: cae (p04:8326, p04:82FD) guardando los registros
	ld a,(ix+010h)		;b456
	cp 0ffh		;b459   ; 0xFF: nada
	ret z			;b45b
	push hl			;b45c
	push de			;b45d
	push bc			;b45e
	call 07af0h		;b45f   ; a_p04_8326: p04:8326 con el banco 4 en 0x8000
	call 07ae0h		;b462   ; a_p04_82fd: p04:82FD con el banco 4 en 0x8000
recupera_hl_de_bc:
	pop bc			;b465
	pop de			;b466
	pop hl			;b467
	ret			;b468
dano_c_a_d800:		; el dano C a la ficha de 0xD800 (p07:B471) guardando los registros
	push hl			;b469
	push de			;b46a
	push bc			;b46b
	call resta_a_d800		;b46c   ; resta_a_d800: p07:B502; el byte 0x10 (su vida) menos C (no baja de 0); a 0, p07:B4C0; si queda: el sonido (p07:B4A3), el byte 0x16 = 0 y el 0x17 = C * 4 (al menos 0x0A); el tipo 9, el byte 0x13 = 0xFD
	jr recupera_hl_de_bc		;b46f
resta_a_d800:		; p07:B502; el byte 0x10 (su vida) menos C (no baja de 0); a 0, p07:B4C0; si queda: el sonido (p07:B4A3), el byte 0x16 = 0 y el 0x17 = C * 4 (al menos 0x0A); el tipo 9, el byte 0x13 = 0xFD
	push bc			;b471
	call golpe_d800_tipo_5		;b472
	pop bc			;b475
	ld a,(ix+010h)		;b476   ; su vida...
	sub c			;b479   ; ...menos el dano
	jr nc,pon_vida_d800		;b47a
	xor a			;b47c   ; no baja de 0
pon_vida_d800:
	ld (ix+010h),a		;b47d
	and a			;b480
	jr z,d800_vencida		;b481   ; a cero: vencida
	push bc			;b483
	call sonido_de_d800		;b484   ; el sonido
	pop bc			;b487
	ld (ix+016h),000h		;b488   ; el byte 0x16 = 0
	ld a,c			;b48c   ; C * 4...
	add a,a			;b48d
	add a,a			;b48e
	cp 00ah		;b48f   ; ...al menos 0x0A...
	jr nc,pon_byte_17		;b491
	ld a,00ah		;b493
pon_byte_17:		; ...al byte 0x17
	ld (ix+017h),a		;b495
	ld a,(ix+000h)		;b498
	cp 009h		;b49b   ; solo el 9...
	ret nz			;b49d
	ld (ix+013h),0fdh		;b49e   ; ...byte 0x13 = 0xFD
	ret			;b4a2
sonido_de_d800:		; con la vida desde 0x18 (los tipos 6, 8 y 0x0A) o desde 8 (los demas), el sonido 0x48; por debajo, el 0x4E
	ld a,(ix+000h)		;b4a3
	ld c,018h		;b4a6
	cp 006h		;b4a8   ; el 6...
	jr z,compara_vida		;b4aa
	cp 00ah		;b4ac   ; ...el 0x0A...
	jr z,compara_vida		;b4ae
	cp 008h		;b4b0   ; ...y el 8: 0x18
	jr z,compara_vida		;b4b2
	ld c,008h		;b4b4   ; los demas: 8
compara_vida:
	ld a,(ix+010h)		;b4b6
	cp c			;b4b9
	jp nc,06c17h		;b4ba   ; por encima: el 0x48
	jp 06c57h		;b4bd   ; por debajo: el 0x4E
d800_vencida:		; el paso de p07:B521 segun su tipo, el byte 0x16 = 0, el 0x17 = 4 y fuera lo lanzado (p07:B4D5)
	ld hl,nada_b520		;b4c0
	ld a,(ix+000h)		;b4c3
	call 0423eh		;b4c6   ; suma_a_hl: HL = HL + A
	ld a,(hl)			;b4c9   ; el paso
	ld (ix+001h),a		;b4ca
	ld (ix+016h),000h		;b4cd   ; el byte 0x16 = 0...
	ld (ix+017h),004h		;b4d1   ; ...el 0x17 = 4
fuera_lo_lanzado:		; 0xD460-0xD4BF y 0xD4C0-0xD4DF a cero, los sprites de 0xDC68-0xDC7F fuera y, con 0xD8A4, los de 0xDC28-0xDC37
	ld hl,0d460h		;b4d5   ; apunta a 6 fichas de 16 bytes de lo que lanzan los actores (p04:9B55)
	ld bc,0005fh		;b4d8
	call 04236h		;b4db   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	ld hl,0d4c0h		;b4de   ; 0xD4C0-0xD4DF
	ld bc,0001fh		;b4e1
	call 04236h		;b4e4   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	ld hl,0dc68h		;b4e7   ; 0xDC68-0xDC7F...
	ld bc,00017h		;b4ea
	ld a,0e0h		;b4ed   ; ...a 0xE0
	call 04237h		;b4ef   ; llena_bloque: pone A en BC + 1 bytes desde HL
	ld a,(0d8a4h)		;b4f2
	and a			;b4f5
	ret z			;b4f6   ; sin 0xD8A4, ya esta
	ld hl,0dc28h		;b4f7   ; 0xDC28-0xDC37 a 0xE0
	ld bc,0000fh		;b4fa
	ld a,0e0h		;b4fd
	jp 04237h		;b4ff   ; llena_bloque: pone A en BC + 1 bytes desde HL
golpe_d800_tipo_5:		; el tipo 5: el byte 0x18 = 6, el 0x0C al 0x15 y a 0, el dibujo al 0x1D y el byte 0x16 = 0
	ld a,(ix+000h)		;b502
	cp 005h		;b505
	ret nz			;b507
	ld (ix+018h),006h		;b508   ; el byte 0x18 = 6
	ld a,(ix+00ch)		;b50c   ; el 0x0C al 0x15
	ld (ix+015h),a		;b50f
	ld a,(ix+00dh)		;b512   ; el dibujo al 0x1D
	ld (ix+01dh),a		;b515
	xor a			;b518
	ld (ix+00ch),a		;b519   ; el 0x0C...
	ld (ix+016h),a		;b51c   ; ...y el 0x16 a 0
	or a			;b51f
nada_b520:
	ret			;b520

; ----------------------------------------------------------------------
; DATOS paso_vencido_B521: los pasos de los tipos 1-0x0B de la ficha de 0xD800
;   que lee p07:B4C0 (0xB520 + el tipo) al vencerla
;   0xb521..0xb52c  (11 bytes)
DATA_paso_vencido_B521:
	defb 000h,000h,00dh,00fh,020h,020h,020h,00fh,010h,00ch,006h	; b521  ....   ....

; ======================================================================
; CODIGO 0xb52c..0xb535  (9 bytes)
; ======================================================================


dano_del_tipo:		; C = el dano del tipo C de lo lanzado por Snake (p07:B535)
	ld a,c			;b52c
	ld hl,nada_b534		;b52d
	call 0423eh		;b530   ; suma_a_hl: HL = HL + A
	ld c,(hl)			;b533
nada_b534:
	ret			;b534

; ----------------------------------------------------------------------
; DATOS dano_por_tipo_B535: el dano de los tipos 1-8 de lo lanzado por Snake
;   que lee p07:B52D (0xB534 + el tipo)
;   0xb535..0xb53d  (8 bytes)
DATA_dano_por_tipo_B535:
	defb 002h,002h,004h,000h,004h,004h,000h,000h	; b535  ........

; ======================================================================
; CODIGO 0xb53d..0xb55b  (30 bytes)
; ======================================================================


dano_del_lanzado:		; C = el dano de lo lanzado por un actor: 0x0A con 0xD8A0, 0x10 con la ficha 0xD840 de tipo 0x0A, si no el de su tipo (p07:B55B); A = 1
	ld a,(0d8a0h)		;b53d
	and a			;b540   ; con 0xD8A0...
	ld c,00ah		;b541   ; ...0x0A
	ld a,001h		;b543
	ret nz			;b545
	ld a,(0d840h)		;b546   ; la ficha 0xD840 de tipo 0x0A...
	cp 00ah		;b549
	ld c,010h		;b54b   ; ...0x10
	ld a,001h		;b54d
	ret z			;b54f
	ld a,(ix+000h)		;b550   ; el de su tipo
	ld hl,nada_b55a		;b553
	call 0423eh		;b556   ; suma_a_hl: HL = HL + A
	ld c,(hl)			;b559
nada_b55a:
	ret			;b55a

; ----------------------------------------------------------------------
; DATOS dano_por_actor_B55B: el dano de lo lanzado por los actores de tipo 1-8
;   que lee p07:B553 (0xB55A + el tipo)
;   0xb55b..0xb563  (8 bytes)
DATA_dano_por_actor_B55B:
	defb 000h,000h,012h,006h,006h,006h,018h,00ah	; b55b  ........

; ======================================================================
; CODIGO 0xb563..0xb62e  (203 bytes)
; ======================================================================


fin_de_cc80:		; la ficha de 0xCC80 (IY) se acaba: p12:6E6C, tipo 0 y p03:B1BE con C = 1 en su sitio (Y - 4 y X - 4, pares, hasta 0xB0) y su fila y columna
	push hl			;b563
	push de			;b564
	push bc			;b565
	push iy		;b566
	pop hl			;b568
	call 05fe0h		;b569   ; a_p12_6e6c_b_7: a_p12_6e6c y deja el banco 7
	xor a			;b56c
	ld (iy+000h),a		;b56d
	ld (0cb52h),a		;b570
	ld a,c			;b573
	ld e,(iy+004h)		;b574   ; su fila y columna
	ld d,(iy+005h)		;b577
	ld c,001h		;b57a   ; C = 1
	ld a,(iy+002h)		;b57c   ; la Y - 4...
	sub 004h		;b57f
	jr nc,y_par		;b581
	xor a			;b583   ; ...no por debajo de 0...
y_par:		; ...par...
	and 0feh		;b584
	cp 0b0h		;b586
	jr c,pon_l_cc80		;b588   ; ...hasta 0xB0
	ld a,0b0h		;b58a
pon_l_cc80:
	ld l,a			;b58c
	ld a,(iy+003h)		;b58d   ; la X - 4, igual
	sub 004h		;b590
	jr nc,x_par		;b592
	xor a			;b594
x_par:
	and 0feh		;b595
	cp 0b0h		;b597
	jr c,pon_h_cc80		;b599
	ld a,0b0h		;b59b
pon_h_cc80:
	ld h,a			;b59d
	call 08db5h		;b59e   ; a_p03_b1be: p03:B1BE con el banco 3 en 0xA000
recupera_b5a1:
	jp recupera_hl_de_bc		;b5a1   ; recupera_hl_de_bc:
p12_6e6c_iy:		; p12:6E6C con la ficha de IY guardando los registros
	push hl			;b5a4
	push de			;b5a5
	push bc			;b5a6
	push iy		;b5a7
	pop hl			;b5a9
	call 05fe0h		;b5aa   ; a_p12_6e6c_b_7: a_p12_6e6c y deja el banco 7
	jr recupera_b5a1		;b5ad
se_tocan:		; acarreo si se tocan las dos cajas: la de (H, L) con D y E y la del otro juego de registros (|X - X'| < D + D'; en Y, por debajo menos que E y por encima menos que E')
	exx			;b5af
	ld a,d			;b5b0
	exx			;b5b1
	add a,d			;b5b2   ; D + D'...
	ld c,a			;b5b3
	exx			;b5b4
	ld a,h			;b5b5   ; ...lo que hay de H' a H...
	exx			;b5b6
	sub h			;b5b7
	jr nc,L_B5BC		;b5b8
	neg		;b5ba   ; ...en positivo
L_B5BC:
	cp c			;b5bc   ; lejos en X: no
	ret nc			;b5bd
	exx			;b5be
	ld a,l			;b5bf
	exx			;b5c0
	sub l			;b5c1   ; L' - L
	jr c,por_encima		;b5c2
	exx			;b5c4   ; por debajo: menos que E'
	cp e			;b5c5
	exx			;b5c6
	ret			;b5c7
por_encima:		; por encima: menos que E
	neg		;b5c8
	cp e			;b5ca
	ret			;b5cb
caja_de_snake:		; la caja de Snake segun su dibujo (p07:B624) bajada 0xCB43 y con 0xCB28 (p07:B608); NZ sin caja: con 0xCB32 (salvo en la zona 0x0A salas 0x0B, 0x0C, 0x10 y 0x11 o con 0xCA8D); con 0xCA8D, la caja sin mas
	ld a,(0ca4ah)		;b5cc   ; lee la zona
	cp 00ah		;b5cf
	jr nz,mira_cb32		;b5d1   ; fuera de la zona 0x0A...
	ld a,(0ca4bh)		;b5d3   ; lee la sala de la zona
	cp 00bh		;b5d6
	jr z,caja_por_dibujo		;b5d8   ; ...las salas 0x0B...
	cp 00ch		;b5da
	jr z,caja_por_dibujo		;b5dc   ; ...0x0C...
	cp 010h		;b5de
	jr z,caja_por_dibujo		;b5e0   ; ...0x10...
	cp 011h		;b5e2
	jr z,caja_por_dibujo		;b5e4   ; ...y 0x11 si valen
mira_cb32:
	ld a,(0ca8dh)		;b5e6   ; lee con el, otros choques de Snake con los actores (p07:AD1E)
	or a			;b5e9
	jr nz,caja_por_dibujo		;b5ea   ; con 0xCA8D, vale
	ld a,(0cb32h)		;b5ec
	or a			;b5ef
	jr nz,$+86		;b5f0   ; con 0xCB32, sin caja
caja_por_dibujo:
	call caja_segun_dibujo		;b5f2   ; caja_segun_dibujo: la caja del dibujo de Snake (p07:B62E); desde el 0x0C, ninguna
	ld a,(0ca8dh)		;b5f5   ; lee con el, otros choques de Snake con los actores (p07:AD1E)
	or a			;b5f8
	jr z,baja_cb43		;b5f9   ; con 0xCA8D, tal cual
	xor a			;b5fb
	ret			;b5fc
baja_cb43:
	push af			;b5fd
	ld a,(0cb43h)		;b5fe   ; la Y + 0xCB43
	add a,l			;b601
	ld l,a			;b602
	call caja_cb28		;b603   ; y 0xCB28
	pop af			;b606
	ret			;b607
caja_cb28:		; con 0xCB28 = 1, E = 0xCB29; con 2, E = 0xCB29 - 4 y la Y sube 0x20 - 0xCB29
	ld a,(0cb28h)		;b608
	or a			;b60b
	ret z			;b60c   ; sin 0xCB28, nada
	dec a			;b60d
	jr z,caja_cb28_1		;b60e
	ld a,(0cb29h)		;b610   ; con 2...
	ld c,a			;b613
	sub 004h		;b614   ; ...E = 0xCB29 - 4...
	ld e,a			;b616
	ld a,020h		;b617   ; ...y la Y menos 0x20 - 0xCB29
	sub c			;b619
	ld c,a			;b61a
	ld a,l			;b61b
	sub c			;b61c
	ld l,a			;b61d
	ret			;b61e
caja_cb28_1:		; con 1, E = 0xCB29
	ld a,(0cb29h)		;b61f
	ld e,a			;b622
	ret			;b623
caja_segun_dibujo:		; la caja del dibujo de Snake (p07:B62E); desde el 0x0C, ninguna
	ld a,(0cb01h)		;b624   ; lee el dibujo de Snake (al darse la vuelta se le suma 1, 3 o 5 segun 0xCB00)
	cp 00ch		;b627
	jr nc,$+29		;b629
	call 0424dh		;b62b   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_B62E: 12 destinos del despachador p00:424D (call en p07:B62B, el
;   indice en A): B649, B649, B650, B649, B662, B649, B649, B662, B649, B649,
;   B649, B669; lo leen p07:B62B (24 bytes)
;   0xb62e..0xb646  (24 bytes)
DATA_tabla_B62E:
	defw 0b649h,0b649h,0b650h,0b649h,0b662h,0b649h,0b649h,0b662h	; b62e
	defw 0b649h,0b649h,0b649h,0b669h	; b63e  -> caja_06_1c caja_06_1c caja_06_1c caja_08_10

; ======================================================================
; CODIGO 0xb646..0xb6a5  (95 bytes)
; ======================================================================


sin_caja:		; NZ: sin caja
	or 001h		;b646
	ret			;b648
caja_06_1c:		; en Snake, 6 x 0x1C
	call sitio_de_snake		;b649   ; sitio_de_snake: L = la Y, H = la X de Snake; Z
	ld de,0061ch		;b64c
	ret			;b64f
caja_de_lado:		; en Snake: a los lados 0x0E x 6, si no 8 x 0x0D
	call sitio_de_snake		;b650   ; sitio_de_snake: L = la Y, H = la X de Snake; Z
	ld de,00e06h		;b653
	ld a,(0cb0eh)		;b656   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	cp 003h		;b659
	jr nc,caja_z		;b65b
	ld de,0080dh		;b65d
caja_z:
	xor a			;b660
	ret			;b661
caja_06_14:		; en Snake, 6 x 0x14
	call sitio_de_snake		;b662   ; sitio_de_snake: L = la Y, H = la X de Snake; Z
	ld de,00614h		;b665
	ret			;b668
caja_08_10:		; en Snake, 8 x 0x10
	call sitio_de_snake		;b669   ; sitio_de_snake: L = la Y, H = la X de Snake; Z
	ld de,00810h		;b66c
	ret			;b66f
caja_de_snake_b:		; como p07:B5CC con la tabla p07:B6A5 y sin lo de 0xCB28 ni 0xCA8D
	ld a,(0ca4ah)		;b670   ; lee la zona
	cp 00ah		;b673
	jr nz,mira_cb32_b		;b675
	ld a,(0ca4bh)		;b677   ; lee la sala de la zona
	cp 00bh		;b67a
	jr z,caja_b_por_dibujo		;b67c
	cp 00ch		;b67e
	jr z,caja_b_por_dibujo		;b680
	cp 010h		;b682
	jr z,caja_b_por_dibujo		;b684
	cp 011h		;b686
	jr z,caja_b_por_dibujo		;b688
mira_cb32_b:
	ld a,(0cb32h)		;b68a
	or a			;b68d
	jr nz,sin_caja		;b68e
caja_b_por_dibujo:
	call caja_b_segun_dibujo		;b690   ; caja_b_segun_dibujo: la caja del dibujo de Snake (p07:B6A5); desde el 0x0C, ninguna
	push af			;b693
	ld a,(0cb43h)		;b694   ; lee lo que baja la caja de Snake en los choques (p07:B5FE)
	add a,l			;b697
	ld l,a			;b698
	pop af			;b699
	ret			;b69a
caja_b_segun_dibujo:		; la caja del dibujo de Snake (p07:B6A5); desde el 0x0C, ninguna
	ld a,(0cb01h)		;b69b   ; lee el dibujo de Snake (al darse la vuelta se le suma 1, 3 o 5 segun 0xCB00)
	cp 00ch		;b69e
	jr nc,sin_caja		;b6a0
	call 0424dh		;b6a2   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_B6A5: 12 destinos del despachador p00:424D (call en p07:B6A2, el
;   indice en A): B6BD, B6BD, B650, B6BD, B662, B6BD, B6BD, B662, B6BD, B6BD,
;   B6BD, B669; lo leen p07:B6A2 (24 bytes)
;   0xb6a5..0xb6bd  (24 bytes)
DATA_tabla_B6A5:
	defw 0b6bdh,0b6bdh,0b650h,0b6bdh,0b662h,0b6bdh,0b6bdh,0b662h	; b6a5
	defw 0b6bdh,0b6bdh,0b6bdh,0b669h	; b6b5  -> caja_alta caja_alta caja_alta caja_08_10

; ======================================================================
; CODIGO 0xb6bd..0xb6e9  (44 bytes)
; ======================================================================


caja_alta:		; en (Y - 0x0C, X), 5 x 8
	ld a,(0cb03h)		;b6bd   ; lee la Y de Snake
	sub 00ch		;b6c0
	ld l,a			;b6c2
	ld a,(0cb05h)		;b6c3   ; lee la X de Snake
	ld h,a			;b6c6
	ld de,00508h		;b6c7
	xor a			;b6ca
	ret			;b6cb
caja_de_snake_c:		; sin 0xCB32, la caja del dibujo de Snake (p07:B6E9) bajada 0xCB43
	ld a,(0cb32h)		;b6cc
	or a			;b6cf
	jp nz,sin_caja		;b6d0   ; sin_caja: NZ: sin caja
	call caja_c_segun_dibujo		;b6d3   ; caja_c_segun_dibujo: la caja del dibujo de Snake (p07:B6E9); desde el 0x0C, ninguna
	push af			;b6d6
	ld a,(0cb43h)		;b6d7   ; lee lo que baja la caja de Snake en los choques (p07:B5FE)
	add a,l			;b6da
	ld l,a			;b6db
	pop af			;b6dc
	ret			;b6dd
caja_c_segun_dibujo:		; la caja del dibujo de Snake (p07:B6E9); desde el 0x0C, ninguna
	ld a,(0cb01h)		;b6de   ; lee el dibujo de Snake (al darse la vuelta se le suma 1, 3 o 5 segun 0xCB00)
	cp 00ch		;b6e1
	jp nc,sin_caja		;b6e3   ; sin_caja: NZ: sin caja
	call 0424dh		;b6e6   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_B6E9: 12 destinos del despachador p00:424D (call en p07:B6E6, el
;   indice en A): B701, B701, B650, B701, B701, B701, B701, B701, B701, B701,
;   B701, B708; lo leen p07:B6E6 (24 bytes)
;   0xb6e9..0xb701  (24 bytes)
DATA_tabla_B6E9:
	defw 0b701h,0b701h,0b650h,0b701h,0b701h,0b701h,0b701h,0b701h	; b6e9
	defw 0b701h,0b701h,0b701h,0b708h	; b6f9  -> caja_06_04 caja_06_04 caja_06_04 caja_08_08

; ======================================================================
; CODIGO 0xb701..0xb72c  (43 bytes)
; ======================================================================


caja_06_04:		; en Snake, 6 x 4
	call sitio_de_snake		;b701   ; sitio_de_snake: L = la Y, H = la X de Snake; Z
	ld de,00604h		;b704
	ret			;b707
caja_08_08:		; en Snake, 8 x 8
	call sitio_de_snake		;b708   ; sitio_de_snake: L = la Y, H = la X de Snake; Z
	ld de,00808h		;b70b
	ret			;b70e
caja_delante:		; la caja de 2 x 4 delante de Snake segun su direccion (p07:B72C: arriba Y - 0x20; abajo en Snake; a los lados Y - 0x1C y X - 0x0A o + 0x0A)
	ld de,00204h		;b70f
	ld a,(0cb0eh)		;b712   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	dec a			;b715
	ld hl,0b72ch		;b716   ; la direccion...
	add a,a			;b719
	call 0423eh		;b71a   ; suma_a_hl: HL = HL + A
	call palabra_hl		;b71d   ; ...su desplazamiento
	ld a,(0cb03h)		;b720   ; la Y + el de Y
	add a,l			;b723
	ld l,a			;b724
	ld a,(0cb05h)		;b725   ; la X + el de X
	add a,h			;b728
	ld h,a			;b729
	xor a			;b72a
	ret			;b72b

; ----------------------------------------------------------------------
; DATOS resto_B72C: lo apuntan con el banco puesto p07:B716 (0xB72C); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p07:B716 (8 bytes)
;   0xb72c..0xb734  (8 bytes)
DATA_resto_B72C:
	defb 0e0h,000h,000h,000h,0e4h,0f6h,0e4h,00ah	; b72c  ........

; ======================================================================
; CODIGO 0xb734..0xb73a  (6 bytes)
; ======================================================================


caja_lanzado_snake:		; la caja de lo lanzado por Snake (IY) segun su tipo (p07:B73A): los 1, 2 y 9 de 1 x 2; el 6 por p07:B75E; los demas, ninguna
	ld a,(iy+000h)		;b734
	call 0424dh		;b737   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_B73A: 10 destinos del despachador p00:424D (call en p07:B737, el
;   indice en A): B646, B74E, B74E, B646, B646, B646, B75E, B646, B646, B74E;
;   lo leen p07:B737 (20 bytes)
;   0xb73a..0xb74e  (20 bytes)
DATA_tabla_B73A:
	defw 0b646h,0b74eh,0b74eh,0b646h,0b646h,0b646h,0b75eh,0b646h	; b73a
	defw 0b646h,0b74eh	; b74a  -> sin_caja caja_1x2

; ======================================================================
; CODIGO 0xb74e..0xb879  (299 bytes)
; ======================================================================


caja_1x2:		; en (Y + 2, X + 1), 1 x 2
	ld a,(iy+003h)		;b74e
	add a,002h		;b751   ; la Y + 2
	ld l,a			;b753
	ld a,(iy+005h)		;b754
	inc a			;b757   ; la X + 1
	ld h,a			;b758
	ld de,00102h		;b759   ; 1 x 2
	xor a			;b75c
	ret			;b75d
caja_tipo_6:		; el tipo 6: con el byte 0x0B desde 2, 8 x 6 en (Y + 6, X + 8); si no, 3 x 0x10 en (Y + 0x10, X + 3)
	ld a,(iy+00bh)		;b75e
	cp 002h		;b761   ; con el byte 0x0B desde 2...
	jr c,caja_6_estrecha		;b763
	ld de,00806h		;b765   ; ...8 x 6...
	ld a,(iy+003h)		;b768
	add a,006h		;b76b   ; ...en la Y + 6...
	ld l,a			;b76d
	ld a,(iy+005h)		;b76e
	add a,008h		;b771   ; ...y la X + 8
	ld h,a			;b773
	xor a			;b774
	ret			;b775
caja_6_estrecha:
	ld de,00310h		;b776   ; 3 x 0x10...
	ld a,(iy+003h)		;b779
	add a,010h		;b77c   ; ...en la Y + 0x10...
	ld l,a			;b77e
	ld a,(iy+005h)		;b77f
	add a,003h		;b782   ; ...y la X + 3
	ld h,a			;b784
	xor a			;b785
	ret			;b786
caja_df80:		; la caja de la ficha de 0xDF80 (IY), si esta activa
	ld a,(iy+000h)		;b787
	or a			;b78a
	jp z,sin_caja		;b78b   ; sin_caja: NZ: sin caja
	jr caja_18x30		;b78e
caja_df80_aqui:		; la caja de la ficha de 0xDF80, si esta activa y en esta sala
	ld a,(iy+000h)		;b790
	or a			;b793
	jp z,sin_caja		;b794   ; sin_caja: NZ: sin caja
	ld a,(0ca50h)		;b797   ; lee la fila de la sala en la zona (uno mas al salir por arriba)
	cp (iy+004h)		;b79a
	ret nz			;b79d
	ld a,(0ca51h)		;b79e   ; lee la columna de la sala en la zona (uno mas al salir por la derecha)
	cp (iy+005h)		;b7a1
	ret nz			;b7a4
caja_18x30:		; en (Y + 0x20, X + 8), 0x18 x 0x30
	ld a,(iy+002h)		;b7a5
	add a,020h		;b7a8   ; la Y + 0x20
	ld l,a			;b7aa
	ld a,(iy+003h)		;b7ab
	add a,008h		;b7ae   ; la X + 8
	ld h,a			;b7b0
	ld de,01830h		;b7b1   ; 0x18 x 0x30
	xor a			;b7b4
	ret			;b7b5
caja_cc80:		; la caja de la ficha de 0xCC80 (IY), si esta activa
	ld a,(iy+000h)		;b7b6
	or a			;b7b9
	jp z,sin_caja		;b7ba   ; sin_caja: NZ: sin caja
	jr caja_06x0c		;b7bd
caja_cc80_aqui:		; la caja de la ficha de 0xCC80 si su tipo es el del sitio de Snake (1 normal, 2 en un sitio de 0xCBE0, 3 con 0xCA77, 4 en una sala especial) y esta en esta sala
	ld a,(iy+000h)		;b7bf
	ld e,a			;b7c2
	or a			;b7c3
	jp z,sin_caja		;b7c4   ; sin_caja: NZ: sin caja
	ld d,004h		;b7c7
	ld a,(0ca76h)		;b7c9   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	or a			;b7cc
	jr nz,compara_sitio		;b7cd
	dec d			;b7cf
	ld a,(0ca77h)		;b7d0
	and a			;b7d3
	jr nz,compara_sitio		;b7d4
	dec d			;b7d6
	ld a,(0ca65h)		;b7d7   ; lee el sitio de 0xCBE0 en el que esta Snake (0 = ninguno)
	ld d,002h		;b7da
	and a			;b7dc
	jr nz,compara_sitio		;b7dd
	dec d			;b7df
compara_sitio:
	ld a,e			;b7e0
	cp d			;b7e1
	jp nz,sin_caja		;b7e2   ; sin_caja: NZ: sin caja
	ld de,(0ca50h)		;b7e5   ; lee la fila de la sala en la zona (uno mas al salir por arriba) y el byte siguiente (16 bits)
	ld a,e			;b7e9
	cp (iy+004h)		;b7ea
	ret nz			;b7ed
	ld a,d			;b7ee
	cp (iy+005h)		;b7ef
	ret nz			;b7f2
caja_06x0c:		; en (Y + 0x0A, X + 4), 6 x 0x0C
	ld a,(iy+002h)		;b7f3
	add a,00ah		;b7f6   ; la Y + 0x0A
	ld l,a			;b7f8
	ld a,(iy+003h)		;b7f9
	add a,004h		;b7fc   ; la X + 4
	ld h,a			;b7fe
	ld de,0060ch		;b7ff   ; 6 x 0x0C
	xor a			;b802
	ret			;b803
caja_de_d760:		; la caja de la ficha 0xD760, si esta activa, con el byte 0 del sitio de Snake (4 sala especial, 3 con 0xD8C0, 2 en un sitio, 1) y en esta sala: en (Y + 0x20, X + 8), 8 x 0x20
	ld ix,0d760h		;b804   ; apunta a una ficha de 16 bytes [sitio][..][Y][X][fila][columna]; la toca Snake en p07:B1E0
	ld a,(ix+000h)		;b808
	or a			;b80b
	jp z,sin_caja		;b80c   ; sin_caja: NZ: sin caja
	ld b,004h		;b80f
	ld a,(0ca76h)		;b811   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	or a			;b814
	jr nz,compara_sitio_d760		;b815
	dec b			;b817
	ld a,(0d8c0h)		;b818   ; lee 1 con Snake dentro de lo de 0xD8C2 (p07:A40D; 0 al salir, p07:A69A)
	or a			;b81b
	jr nz,compara_sitio_d760		;b81c
	dec b			;b81e
	ld a,(0ca65h)		;b81f   ; lee el sitio de 0xCBE0 en el que esta Snake (0 = ninguno)
	or a			;b822
	jr nz,compara_sitio_d760		;b823
	dec b			;b825
compara_sitio_d760:
	ld a,b			;b826
	cp (ix+000h)		;b827
	ret nz			;b82a
	ld a,(0ca50h)		;b82b   ; lee la fila de la sala en la zona (uno mas al salir por arriba)
	cp (ix+004h)		;b82e
	ret nz			;b831
	ld a,(0ca51h)		;b832   ; lee la columna de la sala en la zona (uno mas al salir por la derecha)
	cp (ix+005h)		;b835
	ret nz			;b838
	ld a,(ix+002h)		;b839
	add a,020h		;b83c
	ld l,a			;b83e
	ld a,(ix+003h)		;b83f
	add a,008h		;b842
	ld h,a			;b844
	ld de,00820h		;b845
	xor a			;b848
	ret			;b849
caja_cb44:		; con 0xCB44 y 0xCB46 desde 4: la caja de p07:B879 segun la direccion de Snake (4 bytes: E, D, dY, dX)
	ld a,(0cb44h)		;b84a   ; lee 1-2: el arma 0x0C en marcha (2 con 0xCB21 = 0x1D; p11:B211)
	or a			;b84d
	jp z,sin_caja		;b84e   ; sin_caja: NZ: sin caja
	ld a,(0cb46h)		;b851   ; lee lo largo del arma 0x0C (0-4 sprites, p11:B295)
	cp 004h		;b854
	jp c,sin_caja		;b856   ; sin_caja: NZ: sin caja
	ld a,(0cb0eh)		;b859   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	dec a			;b85c
	add a,a			;b85d
	add a,a			;b85e
	ld hl,0b879h		;b85f
	call 0423eh		;b862   ; suma_a_hl: HL = HL + A
	ld e,(hl)			;b865
	inc hl			;b866
	ld d,(hl)			;b867
	inc hl			;b868
	ld a,(hl)			;b869
	inc hl			;b86a
	ld h,(hl)			;b86b
	ld l,a			;b86c
	ld a,(0cb03h)		;b86d   ; lee la Y de Snake
	add a,l			;b870
	ld l,a			;b871
	ld a,(0cb05h)		;b872   ; lee la X de Snake
	add a,h			;b875
	ld h,a			;b876
	xor a			;b877
	ret			;b878

; ----------------------------------------------------------------------
; DATOS resto_B879: lo apuntan con el banco puesto p07:B85F (0xB879); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p07:B85F (16 bytes)
;   0xb879..0xb889  (16 bytes)
DATA_resto_B879:
	defb 040h,004h,0e0h,000h,040h,004h,030h,0feh,010h,020h,0eah,0d8h,010h,020h,0eah,028h	; b879  @...@.0.. ... .(

; ======================================================================
; CODIGO 0xb889..0xb89b  (18 bytes)
; ======================================================================


caja_dff8:		; con 0xDFF8 y 0xCA61: la caja segun 0xCA61 (p07:B89B)
	ld a,(0dff8h)		;b889   ; lee con el, la caja de 0xDFFD/0xDFFE choca (p07:B149)
	or a			;b88c
	jp z,sin_caja		;b88d   ; sin_caja: NZ: sin caja
	ld a,(0ca61h)		;b890   ; lee 1-4: elige las rachas de p01:6F27 y la caja de p07:B889 (al azar cada 0xF0 cuadros en la mayoria de salas, p10:A0BB)
	or a			;b893
	jp z,sin_caja		;b894   ; sin_caja: NZ: sin caja
	dec a			;b897
	call 0424dh		;b898   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_B89B: 4 destinos del despachador p00:424D (call en p07:B898, el
;   indice en A): B8A3, B8A3, B8AE, B8AE; lo leen p07:B898 (8 bytes)
;   0xb89b..0xb8a3  (8 bytes)
DATA_tabla_B89B:
	defw 0b8a3h,0b8a3h,0b8aeh,0b8aeh	; b89b  -> caja_dffd caja_dffd caja_dffe caja_dffe

; ======================================================================
; CODIGO 0xb8a3..0xba8a  (487 bytes)
; ======================================================================


caja_dffd:		; en (Y = 0xDFFD, X = 0x60), 0x60 x 0x10
	ld a,(0dffdh)		;b8a3   ; lee la Y de la caja de 0xDFF8 (se mueve por 0xCA61)
	ld l,a			;b8a6   ; la Y de 0xDFFD...
	ld h,060h		;b8a7   ; ...la X 0x60
	ld de,06010h		;b8a9   ; 0x60 x 0x10
	xor a			;b8ac
	ret			;b8ad
caja_dffe:		; en (Y = 0xC0, X = 0xDFFE + 8), 8 x 0xC0
	ld a,(0dffeh)		;b8ae   ; lee la X de la caja de 0xDFF8
	add a,008h		;b8b1   ; la X de 0xDFFE + 8...
	ld h,a			;b8b3
	ld l,0c0h		;b8b4   ; ...la Y 0xC0
	ld de,008c0h		;b8b6   ; 8 x 0xC0
	xor a			;b8b9
	ret			;b8ba
sitio_de_snake:		; L = la Y, H = la X de Snake; Z
	ld a,(0cb03h)		;b8bb   ; lee la Y de Snake
	ld l,a			;b8be
	ld a,(0cb05h)		;b8bf   ; lee la X de Snake
	ld h,a			;b8c2
	xor a			;b8c3
	ret			;b8c4
caja_actor_snake:		; la caja del actor IX para tocar a Snake (p07:BA95 desde el tipo 0x10, p07:BA92 los demas; los menores de 0x10 en los pasos 8-9, ninguna)
	ld de,(0ca50h)		;b8c5   ; lee la fila de la sala en la zona (uno mas al salir por arriba) y el byte siguiente (16 bits)
	ld a,(ix+000h)		;b8c9
	and 07fh		;b8cc
	cp 010h		;b8ce
	ld hl,0ba95h		;b8d0
	jr nc,caja_de_tabla		;b8d3
	ld a,(ix+001h)		;b8d5
	sub 008h		;b8d8
	cp 002h		;b8da
	jp c,caja_nz		;b8dc   ; caja_nz: NZ: sin caja
	ld hl,0ba92h		;b8df
	jr caja_de_tabla		;b8e2
caja_actor_df80:		; la caja del actor en la sala de la ficha IY
	ld d,(iy+005h)		;b8e4
	ld e,(iy+004h)		;b8e7
	jr caja_actor_en_de		;b8ea
caja_actor_cc80:		; la caja del actor en la sala de la ficha IY (p07:BABF el 0x14, p07:BAD1 desde 0x10, p07:BACE los demas)
	ld d,(iy+005h)		;b8ec
	ld e,(iy+004h)		;b8ef   ; la sala de la ficha
	ld a,(ix+000h)		;b8f2
	and 07fh		;b8f5
	cp 014h		;b8f7   ; el 0x14...
	ld hl,0babfh		;b8f9
	jr z,caja_de_tabla		;b8fc
	cp 010h		;b8fe   ; ...desde 0x10...
	ld hl,0bad1h		;b900
	jr nc,caja_de_tabla		;b903
	ld hl,0baceh		;b905   ; ...los demas
	jr caja_de_tabla		;b908
caja_actor:		; la caja del actor en esta sala (p07:BAB3 desde el tipo 0x10, p07:BAB0 los demas)
	ld de,(0ca50h)		;b90a   ; lee la fila de la sala en la zona (uno mas al salir por arriba) y el byte siguiente (16 bits)
caja_actor_en_de:
	ld a,(ix+000h)		;b90e
	and 07fh		;b911
	cp 010h		;b913   ; desde 0x10...
	ld hl,0bab3h		;b915
	jr nc,caja_de_tabla		;b918
	ld hl,0bab0h		;b91a   ; ...los demas
caja_de_tabla:		; sin caja: libre, el 8 con 0xD441, si p12:7E35 da acarreo, en otra sala o el 0x13 desde el paso 2; desde el tipo 0x10, la entrada (tipo - 0x10) * 3 de la tabla; [E][D][dY] con la Y del actor + dY y su X
	ld a,(ix+000h)		;b91d
	and 07fh		;b920
	ld c,a			;b922
	and a			;b923
	jr z,caja_nz		;b924   ; libre, ninguna
	cp 008h		;b926
	jr nz,L_B930		;b928
	ld a,(0d441h)		;b92a   ; el 8 con 0xD441, ninguna
	and a			;b92d
	jr nz,caja_nz		;b92e
L_B930:
	call 041ddh		;b930   ; bancos_12: pone el 12 en 0x6000 (con su copia en 0xC381-0xC383)
	push de			;b933
	call 07e35h		;b934   ; p12:7E35
	pop de			;b937
	call 041adh		;b938   ; bancos_1_2_7: pone el 1 en 0x6000, el 2 en 0x8000, el 7 en 0xA000 (con su copia en 0xC381-0xC383)
	jr c,caja_nz		;b93b   ; acarreo: ninguna
	ld a,e			;b93d   ; en otra sala, ninguna
	cp (ix+00ah)		;b93e
	jr nz,caja_nz		;b941
	ld a,d			;b943
	cp (ix+00bh)		;b944
	jr nz,caja_nz		;b947
	ld a,(ix+000h)		;b949
	and 07fh		;b94c
	ld c,a			;b94e
	cp 013h		;b94f
	jr nz,entrada_de_tipo		;b951
	ld a,(ix+001h)		;b953   ; el 0x13 desde el paso 2, ninguna
	cp 002h		;b956
	jr nc,caja_nz		;b958
entrada_de_tipo:
	ld a,c			;b95a
	sub 010h		;b95b   ; desde el 0x10...
	jr c,caja_e_d_dy		;b95d
	ld c,a			;b95f
	add a,a			;b960   ; ...la entrada * 3
	add a,c			;b961
	call 0423eh		;b962   ; suma_a_hl: HL = HL + A
caja_e_d_dy:
	ld a,(hl)			;b965
	and a			;b966   ; a cero, ninguna
	jr z,caja_nz		;b967
	ld e,a			;b969   ; E...
	inc hl			;b96a
	ld d,(hl)			;b96b   ; ...D...
	inc hl			;b96c
	ld a,(hl)			;b96d   ; ...la Y + dY...
	add a,(ix+003h)		;b96e
	ld l,a			;b971
	ld h,(ix+005h)		;b972   ; ...y la X
	xor a			;b975
	ret			;b976
caja_nz:		; NZ: sin caja
	or 001h		;b977
	ret			;b979
caja_d800_snake:		; la caja de la ficha de 0xD800 para tocar a Snake (desde el tipo 3; p07:BA95 el 0x0A, p07:BA92 los demas)
	ld de,(0ca50h)		;b97a   ; lee la fila de la sala en la zona (uno mas al salir por arriba) y el byte siguiente (16 bits)
	ld a,(ix+000h)		;b97e
	sub 003h		;b981
	jr c,caja_nz		;b983
	cp 007h		;b985
	ld hl,0ba92h		;b987
	jr nz,caja_d800_tabla		;b98a
	ld hl,0ba95h		;b98c
	jr caja_d800_tabla		;b98f
caja_d800_df80:		; la caja de la ficha de 0xD800 en la sala de IY
	ld d,(iy+005h)		;b991
	ld e,(iy+004h)		;b994
	jr caja_d800_en_de		;b997
caja_d800_cc80:		; la caja de la ficha de 0xD800 en la sala de IY (desde el tipo 3; p07:BAD1 el 7, p07:BACE los demas)
	ld d,(iy+005h)		;b999
	ld e,(iy+004h)		;b99c   ; la sala de la ficha
	ld a,(ix+000h)		;b99f
	and a			;b9a2
	jr z,caja_nz		;b9a3   ; libre, ninguna
	cp 003h		;b9a5
	jr c,caja_nz		;b9a7   ; el 1 y el 2, ninguna
	cp 007h		;b9a9   ; el 7...
	ld hl,0baceh		;b9ab   ; ...los demas
	jr nz,caja_d800_tabla		;b9ae
	ld hl,0bad1h		;b9b0
	jr caja_d800_tabla		;b9b3
caja_d800:		; la caja de la ficha de 0xD800 en esta sala (desde el tipo 3; p07:BAB3 el 7, p07:BAB0 los demas)
	ld de,(0ca50h)		;b9b5   ; lee la fila de la sala en la zona (uno mas al salir por arriba) y el byte siguiente (16 bits)
caja_d800_en_de:
	ld a,(ix+000h)		;b9b9
	cp 003h		;b9bc
	jr c,caja_nz		;b9be   ; el 1 y el 2, ninguna
	cp 007h		;b9c0   ; el 7...
	ld hl,0bab0h		;b9c2   ; ...los demas
	jr nz,caja_d800_tabla		;b9c5
	ld hl,0bab3h		;b9c7
caja_d800_tabla:		; sin caja: sin el byte 0x16, en una sala especial salvo con el byte 0x12 = 0x29, en otra sala, el 7 con el byte 0x14 o el dibujo 8, y (salvo el 0x0B) con 0xCA77; [E][D][dY] con la Y + dY y la X
	ld a,(ix+016h)		;b9ca
	and a			;b9cd
	jr z,caja_nz		;b9ce   ; sin el byte 0x16, ninguna
	ld a,(0ca76h)		;b9d0   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	and a			;b9d3
	jr z,misma_sala_d800_b		;b9d4   ; sin sala especial, sigue
	ld a,(ix+012h)		;b9d6
	cp 029h		;b9d9
	jr nz,caja_nz		;b9db   ; en ella, solo con 0x29 en el byte 0x12
misma_sala_d800_b:
	ld a,e			;b9dd
	cp (ix+00ah)		;b9de
	jr nz,caja_nz		;b9e1   ; otra sala, ninguna
	ld a,d			;b9e3
	cp (ix+00bh)		;b9e4
	jr nz,caja_nz		;b9e7
	ld a,(ix+000h)		;b9e9
	cp 007h		;b9ec
	jr nz,mira_ca77		;b9ee   ; el 7...
	ld a,(ix+014h)		;b9f0
	and a			;b9f3
	jp nz,caja_nz		;b9f4   ; ...con el byte 0x14, ninguna...
	ld a,(ix+00dh)		;b9f7
	cp 008h		;b9fa
	jp z,caja_nz		;b9fc   ; ...o con el dibujo 8
mira_ca77:
	ld a,(ix+000h)		;b9ff
	cp 00bh		;ba02
	jr z,caja_d800_e_d		;ba04   ; el 0x0B vale siempre
	ld a,(0ca77h)		;ba06
	and a			;ba09
	jp nz,caja_nz		;ba0a   ; con 0xCA77, ninguna
caja_d800_e_d:		; E...
	ld a,(hl)			;ba0d
	ld e,a			;ba0e
	inc hl			;ba0f
	ld d,(hl)			;ba10   ; ...D...
	inc hl			;ba11
	ld a,(hl)			;ba12   ; ...la Y + dY...
	add a,(ix+003h)		;ba13
	ld c,a			;ba16
	ld h,(ix+005h)		;ba17   ; ...la X
	ld l,c			;ba1a
	xor a			;ba1b
	ret			;ba1c
caja_d4c0:		; la caja de la ficha de 0xD4C0: activa y en los pasos 0-2; la entrada del byte 0x0F (menos 3 desde 3) de p07:BB04
	ld a,(ix+000h)		;ba1d
	and a			;ba20
	jp z,caja_nz		;ba21   ; libre, ninguna
	ld a,(ix+001h)		;ba24
	cp 003h		;ba27
	jp nc,caja_nz		;ba29   ; desde el paso 3, ninguna
	ld a,(ix+00fh)		;ba2c
	cp 003h		;ba2f   ; desde 3...
	jr c,tabla_bb04		;ba31
	sub 003h		;ba33   ; ...menos 3
tabla_bb04:
	ld hl,0bb04h		;ba35
	jr entrada_de_4		;ba38
caja_d460:		; la caja de lo lanzado por un actor: desde el tipo 3; el 3 (desde el paso 1) con p07:BB00; los demas, la entrada tipo - 4 de p07:BAEC
	ld a,(ix+000h)		;ba3a
	and a			;ba3d
	jp z,caja_nz		;ba3e   ; libre, ninguna
	cp 003h		;ba41
	jp c,caja_nz		;ba43   ; el 1 y el 2, ninguna
	jr z,caja_lanzado_3		;ba46   ; el 3, aparte
	sub 004h		;ba48   ; la entrada tipo - 4
	ld hl,0baech		;ba4a
entrada_de_4:		; * 4
	add a,a			;ba4d
	add a,a			;ba4e
	call 0423eh		;ba4f   ; suma_a_hl: HL = HL + A
caja_de_4_bytes:		; [E][D][dY][dX]: la caja en (Y + dY, X + dX)
	ld a,(hl)			;ba52
	ld e,a			;ba53   ; E...
	inc hl			;ba54
	ld d,(hl)			;ba55   ; ...D...
	inc hl			;ba56
	ld a,(hl)			;ba57   ; ...la Y + dY...
	add a,(ix+003h)		;ba58
	ld c,a			;ba5b
	inc hl			;ba5c
	ld a,(hl)			;ba5d   ; ...la X + dX
	add a,(ix+005h)		;ba5e
	ld h,a			;ba61
	ld l,c			;ba62
	xor a			;ba63
	ret			;ba64
caja_lanzado_3:
	ld a,(ix+001h)		;ba65
	and a			;ba68
	jp z,caja_nz		;ba69   ; en el paso 0, ninguna
	ld hl,0bb00h		;ba6c   ; la de p07:BB00
	jr caja_de_4_bytes		;ba6f
caja_d820:		; la caja de 2 x 4 de la ficha 0xD820 segun su dibujo - 8 (p07:BA8A: el desplazamiento de su sitio)
	ld a,(ix+00dh)		;ba71
	sub 008h		;ba74
	ld hl,0ba8ah		;ba76
	call 043f6h		;ba79   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld a,(ix+005h)		;ba7c   ; la X + el desplazamiento...
	add a,h			;ba7f
	ld h,a			;ba80
	ld a,(ix+003h)		;ba81   ; ...la Y + el suyo
	add a,l			;ba84
	ld l,a			;ba85
	ld de,00204h		;ba86
	ret			;ba89

; ----------------------------------------------------------------------
; DATOS resto_BA8A: lo apuntan con el banco puesto p07:BA76 (0xBA8A), p07:B8DF
;   (0xBA92), p07:B987 (0xBA92), p07:B8D0 (0xBA95), p07:B98C (0xBA95),
;   p07:B91A (0xBAB0); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p07:BA76, p07:B8DF, p07:B987, p07:B8D0, p07:B98C,
;   p07:B91A (134 bytes)
;   0xba8a..0xbb10  (134 bytes)
DATA_resto_BA8A:
	defb 0e2h,000h,0f2h,000h,0eeh,0f5h,0eeh,00ah,008h,005h,0f4h,006h,005h,0fbh,006h,005h	; ba8a  ................
	defb 0fbh,006h,005h,0fbh,006h,005h,0fbh,020h,014h,010h,000h,000h,000h,006h,005h,0fbh	; ba9a  ....... ........
	defb 000h,000h,000h,006h,005h,0fbh,01ch,005h,0fch,018h,005h,0feh,018h,005h,0feh,00eh	; baaa  ................
	defb 005h,0feh,00eh,005h,0feh,030h,018h,018h,000h,000h,000h,018h,005h,0feh,000h,000h	; baba  .....0..........
	defb 000h,00eh,005h,0feh,004h,006h,000h,004h,005h,000h,004h,005h,000h,004h,005h,000h	; baca  ................
	defb 004h,005h,000h,018h,010h,0f8h,000h,000h,000h,004h,005h,000h,000h,000h,000h,004h	; bada  ................
	defb 005h,000h,002h,001h,002h,001h,003h,003h,003h,001h,002h,001h,002h,001h,004h,002h	; baea  ................
	defb 004h,001h,002h,001h,002h,001h,010h,008h,010h,004h,008h,002h,00ch,008h,008h,008h	; bafa  ................
	defb 00ch,008h,004h,004h,006h,008h	; bb0a

; ======================================================================
; CODIGO 0xbb10..0xbcfc  (492 bytes)
; ======================================================================


sitio_ocupado:		; acarreo si la caja de (H, L, D, E) toca algo de la sala (p02:9071, al dejar una cosa): las cosas de 0xD7C0, las fichas de 0xCC00 y 0xCC80, 0xD760, cajas fijas de algunas salas, 0xD8C0, las entradas de p07:AA83, las fichas de 0xD500, las de 0xE070 (fuera de las salas especiales) y las de 0xDF80
	push ix		;bb10
	call toca_cosa		;bb12   ; las cosas de la sala
	jr c,fin_sitio_ocupado		;bb15
	call toca_cc00		;bb17   ; las fichas de 0xCC00
	jr c,fin_sitio_ocupado		;bb1a
	call toca_cc80		;bb1c   ; las de 0xCC80
	jr c,fin_sitio_ocupado		;bb1f
	call toca_d760		;bb21   ; 0xD760
	jr c,fin_sitio_ocupado		;bb24
	call toca_caja_0a_0e		;bb26   ; la zona 0x0A sala 0x0E
	jr c,fin_sitio_ocupado		;bb29
	call toca_caja_d8c0		;bb2b   ; con 0xD8C0
	jr c,fin_sitio_ocupado		;bb2e
	call toca_entrada		;bb30   ; las entradas de p07:AA83
	jr c,fin_sitio_ocupado		;bb33
	call toca_d500		;bb35   ; las fichas de 0xD500
	jr c,fin_sitio_ocupado		;bb38
	call toca_cajas_13_4		;bb3a   ; la zona 0x13 sala 4
	jr c,fin_sitio_ocupado		;bb3d
	call toca_cajas_zona_4		;bb3f   ; la zona 4
	jr c,fin_sitio_ocupado		;bb42
	ld a,(0ca76h)		;bb44   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	or a			;bb47
	jr nz,mira_df80		;bb48   ; en una sala especial, sin 0xE070
	call toca_e070		;bb4a   ; las fichas de 0xE070
	jr c,fin_sitio_ocupado		;bb4d
mira_df80:		; las fichas de 0xDF80
	call sitio_toca_df80		;bb4f   ; sitio_toca_df80: acarreo si toca alguna de las 8 fichas de 0xDF80 de esta sala (p07:BDEF)
fin_sitio_ocupado:
	pop ix		;bb52
	ret			;bb54
toca_cc00:		; acarreo si toca alguna de las 8 fichas de 0xCC00 de esta sala (p07:BD78)
	ld ix,0cc00h		;bb55   ; apunta a 8 fichas de 16 bytes del arma 7 [sitio][paso][Y][X][fila][columna][cuenta] (p11:B380)
	ld b,008h		;bb59
ficha_cc00:
	exx			;bb5b
	call caja_cc00		;bb5c   ; caja_cc00: la caja de la ficha de 0xCC00 activa y en esta sala: en (Y + 0x0C, X + 4), 8 x 0x10 (acarreo)
	exx			;bb5f
	jr nc,siguiente_cc00		;bb60   ; sin caja, la siguiente
	call se_tocan		;bb62   ; se_tocan: acarreo si se tocan las dos cajas: la de (H, L) con D y E y la del otro juego de registros (|X - X'| < D + D'; en Y, por debajo menos que E y por encima menos que E')
	ret c			;bb65   ; se tocan: acarreo
siguiente_cc00:
	exx			;bb66
	ld de,00010h		;bb67
	add ix,de		;bb6a
	exx			;bb6c
	djnz ficha_cc00		;bb6d
	or a			;bb6f   ; ninguna: sin acarreo
	ret			;bb70
toca_cc80:		; acarreo si toca alguna de las fichas de 0xCC80 de esta sala (p07:BDA1)
	ld ix,0cc80h		;bb71   ; apunta a 16 fichas de 8 bytes del arma 8 [sitio][paso][Y][X][fila][columna] (p11:B574)
	ld b,030h		;bb75
ficha_cc80:
	exx			;bb77
	call caja_cc80_b		;bb78   ; caja_cc80_b: la caja de la ficha de 0xCC80 activa y en esta sala: en (Y + 0x0C, X + 4), 8 x 0x10
	exx			;bb7b
	jr nc,siguiente_cc80_d		;bb7c
	call se_tocan		;bb7e   ; se_tocan: acarreo si se tocan las dos cajas: la de (H, L) con D y E y la del otro juego de registros (|X - X'| < D + D'; en Y, por debajo menos que E y por encima menos que E')
	ret c			;bb81
siguiente_cc80_d:
	exx			;bb82
	ld de,00008h		;bb83
	add ix,de		;bb86   ; la ficha siguiente (8 bytes)
	exx			;bb88
	djnz ficha_cc80		;bb89   ; hasta la ultima
	or a			;bb8b   ; ninguna: sin acarreo
	ret			;bb8c
toca_d760:		; acarreo si toca la ficha 0xD760 (p07:BDC8)
	ld ix,0d760h		;bb8d   ; apunta a una ficha de 16 bytes [sitio][..][Y][X][fila][columna]; la toca Snake en p07:B1E0
	ld b,001h		;bb91
ficha_d760:
	exx			;bb93
	call caja_d760_b		;bb94   ; caja_d760_b: la caja de la ficha 0xD760 activa y en esta sala: en (Y + 0x22, X + 9), 0x0A x 0x23
	exx			;bb97
	jr nc,siguiente_d760		;bb98
	call se_tocan		;bb9a   ; se_tocan: acarreo si se tocan las dos cajas: la de (H, L) con D y E y la del otro juego de registros (|X - X'| < D + D'; en Y, por debajo menos que E y por encima menos que E')
	ret c			;bb9d
siguiente_d760:
	exx			;bb9e
	ld de,00010h		;bb9f
	add ix,de		;bba2   ; la siguiente (16 bytes)
	exx			;bba4
	djnz ficha_d760		;bba5
	or a			;bba7   ; ninguna: sin acarreo
	ret			;bba8
sitio_toca_df80:		; acarreo si toca alguna de las 8 fichas de 0xDF80 de esta sala (p07:BDEF)
	ld ix,0df80h		;bba9   ; apunta a 8 fichas de 8 bytes [tipo][dibujo][Y][X][fila][columna][espera][grafico] que suenan 0x14 en la sala y 0x15 al lado
	ld b,008h		;bbad
ficha_df80:
	exx			;bbaf
	call caja_df80_b		;bbb0   ; caja_df80_b: la caja de la ficha de 0xDF80 activa y en esta sala: en (Y + 0x10, X + 8), 0x0A x 0x12
	exx			;bbb3
	jr nc,siguiente_df80_d		;bbb4
	call se_tocan		;bbb6   ; se_tocan: acarreo si se tocan las dos cajas: la de (H, L) con D y E y la del otro juego de registros (|X - X'| < D + D'; en Y, por debajo menos que E y por encima menos que E')
	ret c			;bbb9
siguiente_df80_d:
	exx			;bbba
	ld de,00008h		;bbbb
	add ix,de		;bbbe   ; la ficha siguiente (8 bytes)
	exx			;bbc0
	djnz ficha_df80		;bbc1   ; hasta la ultima
	or a			;bbc3   ; ninguna: sin acarreo
	ret			;bbc4
toca_cosa:		; acarreo si toca alguna de las 4 cosas de 0xD7C0 (p07:BE16)
	ld ix,0d7c0h		;bbc5   ; apunta a las 4 cosas de la sala: fichas de 4 bytes [tipo][Y][X][numero]
	ld b,004h		;bbc9
cosa_d7c0:
	exx			;bbcb
	call caja_cosa		;bbcc   ; caja_cosa: la caja de la cosa de 0xD7C0 (si hay): en (Y + 0x10, X + 8), 0x0A x 0x12
	exx			;bbcf
	jr nc,siguiente_cosa		;bbd0
	call se_tocan		;bbd2   ; se_tocan: acarreo si se tocan las dos cajas: la de (H, L) con D y E y la del otro juego de registros (|X - X'| < D + D'; en Y, por debajo menos que E y por encima menos que E')
	ret c			;bbd5
siguiente_cosa:
	exx			;bbd6
	ld de,00004h		;bbd7
	add ix,de		;bbda   ; la cosa siguiente (4 bytes)
	exx			;bbdc
	djnz cosa_d7c0		;bbdd   ; hasta la ultima
	or a			;bbdf   ; ninguna: sin acarreo
	ret			;bbe0
toca_e070:		; acarreo si toca alguna de las 2 fichas activas de 0xE070 (p07:BE2D)
	ld ix,0e070h		;bbe1   ; apunta a 2 fichas de 8 bytes [activa][paso][Y][X][..] de p10:A61B (se abren al acercarse Snake, p10:A4F1)
	ld b,002h		;bbe5
ficha_e070:
	ld a,(ix+000h)		;bbe7
	or a			;bbea
	jr z,siguiente_e070		;bbeb   ; libre, la siguiente
	exx			;bbed
	call caja_e070		;bbee   ; caja_e070: la caja de la ficha de 0xE070: en (Y + 0x20, X + 0x10), 0x10 x 0x20
	exx			;bbf1
	jr nc,siguiente_e070		;bbf2
	call se_tocan		;bbf4   ; se_tocan: acarreo si se tocan las dos cajas: la de (H, L) con D y E y la del otro juego de registros (|X - X'| < D + D'; en Y, por debajo menos que E y por encima menos que E')
	ret c			;bbf7
siguiente_e070:
	exx			;bbf8
	ld de,00008h		;bbf9
	add ix,de		;bbfc
	exx			;bbfe
	djnz ficha_e070		;bbff
sin_acarreo_bc01:
	or a			;bc01
	ret			;bc02
toca_caja_0a_0e:		; en la zona 0x0A sala 0x0E: acarreo si toca la caja de (0x60, 0x80) de 0x20 x 0x18
	ld a,(0ca4ah)		;bc03   ; lee la zona
	cp 00ah		;bc06
	jr nz,sin_acarreo_bc01		;bc08
	ld a,(0ca4bh)		;bc0a   ; lee la sala de la zona
	cp 00eh		;bc0d
	jr nz,sin_acarreo_bc01		;bc0f   ; fuera de esa sala, no
	exx			;bc11
	ld de,02018h		;bc12   ; 0x20 x 0x18...
	ld hl,06080h		;bc15   ; ...en (Y = 0x80, X = 0x60)
	exx			;bc18
	jp se_tocan		;bc19   ; se_tocan: acarreo si se tocan las dos cajas: la de (H, L) con D y E y la del otro juego de registros (|X - X'| < D + D'; en Y, por debajo menos que E y por encima menos que E')
toca_caja_d8c0:		; con 0xD8C0: acarreo si toca la caja de (0x60, 0x46) de 0x12 x 0x18
	ld a,(0d8c0h)		;bc1c   ; lee 1 con Snake dentro de lo de 0xD8C2 (p07:A40D; 0 al salir, p07:A69A)
	or a			;bc1f
	ret z			;bc20   ; sin 0xD8C0, no
	exx			;bc21
	ld de,01218h		;bc22   ; 0x12 x 0x18...
	ld hl,06046h		;bc25   ; ...en (Y = 0x46, X = 0x60)
	exx			;bc28
	jp se_tocan		;bc29   ; se_tocan: acarreo si se tocan las dos cajas: la de (H, L) con D y E y la del otro juego de registros (|X - X'| < D + D'; en Y, por debajo menos que E y por encima menos que E')
toca_entrada:		; sin 0xD8C0: acarreo si toca la entrada de p07:AA83 de esta sala (p07:BC38)
	ld a,(0d8c0h)		;bc2c   ; lee 1 con Snake dentro de lo de 0xD8C2 (p07:A40D; 0 al salir, p07:A69A)
	or a			;bc2f
	ret nz			;bc30   ; con 0xD8C0, no
	call caja_entrada		;bc31   ; caja_entrada: en el otro juego de registros, la caja de la entrada de p07:AA83 de esta sala (como p07:A543; la sala 0xD0 no vale): en (Y + 0x20, X + 0x10), 0x12 x 0x20 (acarreo)
	ret nc			;bc34   ; sin entrada, no
	jp se_tocan		;bc35   ; se_tocan: acarreo si se tocan las dos cajas: la de (H, L) con D y E y la del otro juego de registros (|X - X'| < D + D'; en Y, por debajo menos que E y por encima menos que E')
caja_entrada:		; en el otro juego de registros, la caja de la entrada de p07:AA83 de esta sala (como p07:A543; la sala 0xD0 no vale): en (Y + 0x20, X + 0x10), 0x12 x 0x20 (acarreo)
	exx			;bc38
	push bc			;bc39
	ld hl,0aa83h		;bc3a
entrada_aa83:
	push hl			;bc3d
	ld a,(0ca4ah)		;bc3e   ; lee la zona
	cp (hl)			;bc41
	jr nz,siguiente_entrada		;bc42   ; otra zona
	inc hl			;bc44
	ld a,(hl)			;bc45
	cp 0d0h		;bc46
	jr z,siguiente_entrada		;bc48   ; la 0xD0, no
	cp 0ffh		;bc4a
	jr nz,entrada_fe		;bc4c   ; 0xFF...
	ld a,(0ca76h)		;bc4e   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 018h		;bc51
	jr nz,siguiente_entrada		;bc53   ; ...la sala especial 0x18...
	ld a,(0ca4bh)		;bc55   ; lee la sala de la zona
	dec a			;bc58
	jr nz,siguiente_entrada		;bc59   ; ...en la sala 1
	jr caja_de_entrada		;bc5b
entrada_fe:
	cp 0feh		;bc5d
	jr nz,entrada_sala		;bc5f   ; 0xFE...
	ld a,(0ca76h)		;bc61   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 02eh		;bc64
	jr nz,siguiente_entrada		;bc66   ; ...la sala especial 0x2E
	jr caja_de_entrada		;bc68
entrada_sala:
	ld a,(0ca4bh)		;bc6a   ; lee la sala de la zona
	cp (hl)			;bc6d
	jr nz,siguiente_entrada		;bc6e   ; otra sala
caja_de_entrada:
	pop hl			;bc70
	inc hl			;bc71
	inc hl			;bc72
	inc hl			;bc73
	inc hl			;bc74
	inc hl			;bc75
	ld a,(hl)			;bc76   ; su Y + 0x20...
	add a,020h		;bc77
	ld c,a			;bc79
	inc hl			;bc7a
	ld a,(hl)			;bc7b   ; ...su X + 0x10
	add a,010h		;bc7c
	ld h,a			;bc7e
	ld l,c			;bc7f
	ld de,01220h		;bc80   ; 0x12 x 0x20
	pop bc			;bc83
	exx			;bc84
	scf			;bc85
	ret			;bc86
siguiente_entrada:
	pop hl			;bc87
	ld de,00008h		;bc88   ; la siguiente (8 bytes)
	add hl,de			;bc8b
	ld a,(hl)			;bc8c
	cp 0ffh		;bc8d
	jr nz,entrada_aa83		;bc8f   ; hasta 0xFF
	pop bc			;bc91
	exx			;bc92
	and a			;bc93
	ret			;bc94
toca_d500:		; acarreo si toca alguna de las 8 fichas activas de 0xD500: su caja de (byte 8 / 2) de ancho desde su X + eso, y del alto de p07:BCC5 desde su Y + eso
	ld ix,0d500h		;bc95   ; apunta a 8 fichas de puerta de 16 bytes [tipo][estado][Y][X][pide][numero][paso][alto][ancho][abre][cuenta] (p15:A04C; el choque en p07:BC95)
	ld b,008h		;bc99   ; 8 fichas
ficha_d500:
	ld a,(ix+000h)		;bc9b
	or a			;bc9e
	jr z,siguiente_d500		;bc9f   ; libre, la siguiente
	exx			;bca1
	ld a,(ix+008h)		;bca2   ; D = el byte 8 / 2...
	rra			;bca5
	and 07fh		;bca6
	ld d,a			;bca8
	add a,(ix+003h)		;bca9   ; ...H = la X + D
	ld h,a			;bcac
	call alto_d500		;bcad   ; E = el alto...
	ld e,a			;bcb0
	add a,(ix+002h)		;bcb1   ; ...L = la Y + E
	ld l,a			;bcb4
	exx			;bcb5
	call se_tocan		;bcb6   ; se tocan: acarreo
	ret c			;bcb9
siguiente_d500:
	exx			;bcba
	ld de,00010h		;bcbb
	add ix,de		;bcbe   ; la ficha siguiente (16 bytes)
	exx			;bcc0
	djnz ficha_d500		;bcc1   ; hasta la ultima
	and a			;bcc3   ; ninguna: sin acarreo
	ret			;bcc4
alto_d500:		; A = el byte 7; con el byte 8 = 8, + 0x12
	ld a,(ix+008h)		;bcc5
	cp 008h		;bcc8   ; con el byte 8 = 8...
	ld a,(ix+007h)		;bcca   ; ...el byte 7...
	ret nz			;bccd
	add a,012h		;bcce   ; ...+ 0x12
	ret			;bcd0
toca_cajas_13_4:		; en la zona 0x13 sala 4: acarreo si toca alguna de las 3 cajas de p07:BCFC ([E][D][X][Y])
	ld a,(0ca4ah)		;bcd1   ; lee la zona
	cp 013h		;bcd4
	jr nz,no_13_4		;bcd6
	ld a,(0ca4bh)		;bcd8   ; lee la sala de la zona
	cp 004h		;bcdb
	jr nz,no_13_4		;bcdd   ; fuera de esa sala, no
	ld b,003h		;bcdf   ; 3 cajas
caja_13_4:
	ld a,b			;bce1
	exx			;bce2
	dec a			;bce3   ; la caja B - 1 (4 bytes)
	add a,a			;bce4
	add a,a			;bce5
	ld hl,0bcfch		;bce6
	call 0423eh		;bce9   ; suma_a_hl: HL = HL + A
	ld e,(hl)			;bcec
	inc hl			;bced
	ld d,(hl)			;bcee
	inc hl			;bcef
	call palabra_hl		;bcf0   ; palabra_hl: HL = la palabra de HL
	exx			;bcf3
	call se_tocan		;bcf4   ; se tocan: acarreo
	ret c			;bcf7
	djnz caja_13_4		;bcf8
no_13_4:
	and a			;bcfa
	ret			;bcfb

; ----------------------------------------------------------------------
; DATOS resto_BCFC: lo apuntan con el banco puesto p07:BCE6 (0xBCFC); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p07:BCE6 (12 bytes)
;   0xbcfc..0xbd08  (12 bytes)
DATA_resto_BCFC:
	defb 024h,012h,040h,0a2h,024h,010h,060h,050h,01ch,010h,0b8h,04ch	; bcfc  $.@.$.`P...L

; ======================================================================
; CODIGO 0xbd08..0xbd5e  (86 bytes)
; ======================================================================


toca_cajas_zona_4:		; en la zona 4, salas 0x0D, 0x0E, 0x12, 0x13 y 0x17: acarreo si toca alguna de sus cajas de 0x38 x 0x0C (los sitios de p07:BD5E segun la sala, p07:BD2F)
	ld a,(0ca4ah)		;bd08   ; lee la zona
	cp 004h		;bd0b
	jr nz,$-19		;bd0d   ; otra zona, no
	call cajas_de_la_sala		;bd0f   ; cajas_de_la_sala: B = cuantas y HL' = sus sitios: la sala 0x17 2 (p07:BD62), la 0x13 2 (p07:BD6C), la 0x12 4 (p07:BD66), la 0x0D 4 (p07:BD5E), la 0x0E 4 (p07:BD70); Z si es una de ellas
	jr nz,$-24		;bd12   ; sin cajas en la sala, no
caja_zona_4:
	ld a,b			;bd14
	exx			;bd15
	dec a			;bd16
	add a,a			;bd17
	call 0423eh		;bd18   ; el sitio B - 1...
	call palabra_hl		;bd1b   ; palabra_hl: HL = la palabra de HL
	ld de,00c38h		;bd1e   ; ...0x38 x 0x0C
	exx			;bd21
	call se_tocan		;bd22   ; se tocan: acarreo
	ret c			;bd25
	push bc			;bd26
	call cajas_de_la_sala		;bd27   ; cajas_de_la_sala: B = cuantas y HL' = sus sitios: la sala 0x17 2 (p07:BD62), la 0x13 2 (p07:BD6C), la 0x12 4 (p07:BD66), la 0x0D 4 (p07:BD5E), la 0x0E 4 (p07:BD70); Z si es una de ellas
	pop bc			;bd2a
	djnz caja_zona_4		;bd2b
	and a			;bd2d
	ret			;bd2e
cajas_de_la_sala:		; B = cuantas y HL' = sus sitios: la sala 0x17 2 (p07:BD62), la 0x13 2 (p07:BD6C), la 0x12 4 (p07:BD66), la 0x0D 4 (p07:BD5E), la 0x0E 4 (p07:BD70); Z si es una de ellas
	ld b,002h		;bd2f   ; la sala 0x17: 2 cajas...
	exx			;bd31
	ld hl,0bd62h		;bd32   ; ...de p07:BD62
	exx			;bd35
	ld a,(0ca4bh)		;bd36   ; lee la sala de la zona
	cp 017h		;bd39
	ret z			;bd3b
	exx			;bd3c
	ld hl,0bd6ch		;bd3d   ; la 0x13: 2 de p07:BD6C
	exx			;bd40
	cp 013h		;bd41
	ret z			;bd43
	ld b,004h		;bd44   ; 4 cajas...
	exx			;bd46
	ld hl,0bd66h		;bd47   ; ...la 0x12: p07:BD66
	exx			;bd4a
	cp 012h		;bd4b
	ret z			;bd4d
	exx			;bd4e
	ld hl,0bd5eh		;bd4f   ; la 0x0D: p07:BD5E
	exx			;bd52
	cp 00dh		;bd53
	ret z			;bd55
	exx			;bd56
	ld hl,0bd70h		;bd57   ; la 0x0E: p07:BD70
	exx			;bd5a
	cp 00eh		;bd5b
	ret			;bd5d   ; Z si es la 0x0E

; ----------------------------------------------------------------------
; DATOS resto_BD5E: lo apuntan con el banco puesto p07:BD4F (0xBD5E), p07:BD32
;   (0xBD62), p07:BD47 (0xBD66), p07:BD3D (0xBD6C), p07:BD57 (0xBD70); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p07:BD4F, p07:BD32, p07:BD47, p07:BD3D, p07:BD57 (26 bytes)
;   0xbd5e..0xbd78  (26 bytes)
DATA_resto_BD5E:
	defb 038h,04ch,038h,074h,098h,04ch,098h,074h,058h,04ch,058h,074h,0c8h,074h,0c8h,04ch	; bd5e  8L8t.L.tXLXt.t.L
	defb 0c8h,08ch,038h,04ch,038h,08ch,098h,04ch,098h,08ch	; bd6e  ..8L8..L..

; ======================================================================
; CODIGO 0xbd78..0xbf2c  (436 bytes)
; ======================================================================


caja_cc00:		; la caja de la ficha de 0xCC00 activa y en esta sala: en (Y + 0x0C, X + 4), 8 x 0x10 (acarreo)
	ld a,(ix+000h)		;bd78
	or a			;bd7b
	jr z,sin_caja_nc		;bd7c
	ld a,(0ca50h)		;bd7e   ; lee la fila de la sala en la zona (uno mas al salir por arriba)
	cp (ix+004h)		;bd81
	jr nz,sin_caja_nc		;bd84
	ld a,(0ca51h)		;bd86   ; lee la columna de la sala en la zona (uno mas al salir por la derecha)
	cp (ix+005h)		;bd89
	jr nz,sin_caja_nc		;bd8c
	ld a,(ix+002h)		;bd8e
	add a,00ch		;bd91
	ld l,a			;bd93
	ld a,(ix+003h)		;bd94
	add a,004h		;bd97
	ld h,a			;bd99
	ld de,00810h		;bd9a
	scf			;bd9d
	ret			;bd9e
sin_caja_nc:		; sin caja: sin acarreo
	or a			;bd9f
	ret			;bda0
caja_cc80_b:		; la caja de la ficha de 0xCC80 activa y en esta sala: en (Y + 0x0C, X + 4), 8 x 0x10
	ld a,(ix+000h)		;bda1
	or a			;bda4
	jr z,sin_caja_nc		;bda5
	ld a,(0ca50h)		;bda7   ; lee la fila de la sala en la zona (uno mas al salir por arriba)
	cp (ix+004h)		;bdaa
	jr nz,sin_caja_nc		;bdad
	ld a,(0ca51h)		;bdaf   ; lee la columna de la sala en la zona (uno mas al salir por la derecha)
	cp (ix+005h)		;bdb2
	jr nz,sin_caja_nc		;bdb5
	ld a,(ix+002h)		;bdb7
	add a,00ch		;bdba
	ld l,a			;bdbc
	ld a,(ix+003h)		;bdbd
	add a,004h		;bdc0
	ld h,a			;bdc2
	ld de,00810h		;bdc3
	scf			;bdc6
	ret			;bdc7
caja_d760_b:		; la caja de la ficha 0xD760 activa y en esta sala: en (Y + 0x22, X + 9), 0x0A x 0x23
	ld a,(ix+000h)		;bdc8
	or a			;bdcb
	jr z,sin_caja_nc		;bdcc
	ld a,(0ca50h)		;bdce   ; lee la fila de la sala en la zona (uno mas al salir por arriba)
	cp (ix+004h)		;bdd1
	jr nz,sin_caja_nc		;bdd4
	ld a,(0ca51h)		;bdd6   ; lee la columna de la sala en la zona (uno mas al salir por la derecha)
	cp (ix+005h)		;bdd9
	jr nz,sin_caja_nc		;bddc
	ld a,(ix+002h)		;bdde
	add a,022h		;bde1
	ld l,a			;bde3
	ld a,(ix+003h)		;bde4
	add a,009h		;bde7
	ld h,a			;bde9
	ld de,00a23h		;bdea
	scf			;bded
	ret			;bdee
caja_df80_b:		; la caja de la ficha de 0xDF80 activa y en esta sala: en (Y + 0x10, X + 8), 0x0A x 0x12
	ld a,(ix+000h)		;bdef
	or a			;bdf2
	jr z,sin_caja_nc		;bdf3
	ld a,(0ca50h)		;bdf5   ; lee la fila de la sala en la zona (uno mas al salir por arriba)
	cp (ix+004h)		;bdf8
	jr nz,sin_caja_nc		;bdfb
	ld a,(0ca51h)		;bdfd   ; lee la columna de la sala en la zona (uno mas al salir por la derecha)
	cp (ix+005h)		;be00
	jr nz,sin_caja_nc		;be03
	ld a,(ix+002h)		;be05
	add a,010h		;be08
	ld l,a			;be0a
	ld a,(ix+003h)		;be0b
	add a,008h		;be0e
	ld h,a			;be10
	ld de,00a12h		;be11
	scf			;be14
	ret			;be15
caja_cosa:		; la caja de la cosa de 0xD7C0 (si hay): en (Y + 0x10, X + 8), 0x0A x 0x12
	ld a,(ix+000h)		;be16
	or a			;be19
	jr z,sin_caja_nc		;be1a   ; sin cosa, ninguna
	ld a,(ix+001h)		;be1c
	add a,010h		;be1f   ; la Y + 0x10
	ld l,a			;be21
	ld a,(ix+002h)		;be22
	add a,008h		;be25   ; la X + 8
	ld h,a			;be27
	ld de,00a12h		;be28   ; 0x0A x 0x12
	scf			;be2b
	ret			;be2c
caja_e070:		; la caja de la ficha de 0xE070: en (Y + 0x20, X + 0x10), 0x10 x 0x20
	ld a,(ix+002h)		;be2d
	add a,020h		;be30   ; la Y + 0x20
	ld l,a			;be32
	ld a,(ix+003h)		;be33
	add a,010h		;be36   ; la X + 0x10
	ld h,a			;be38
	ld de,01020h		;be39   ; 0x10 x 0x20
	scf			;be3c
	ret			;be3d
sin_acarreo_be3e:
	and a			;be3e
	ret			;be3f
choques_d800_tipo_2:		; con la ficha 0xD800 de tipo 2 en la sala 8, con 0xD816 y por debajo del paso 0x0A: Snake dentro de su forma va al estado 0x14 (p07:BE8E), la ficha 0 de 0xDF80 le quita vida (p07:BED8) y lo lanzado por Snake de tipos 1-2 y 6 que entra en ella se acaba
	ld a,(0d800h)		;be40   ; lee 4 fichas de 0x20 bytes de 0xD800 (p04:89C3); sus tipos los lleva p10
	cp 002h		;be43
	ret nz			;be45   ; solo el tipo 2...
	ld a,(0ca4bh)		;be46   ; lee la sala de la zona
	cp 008h		;be49
	ret nz			;be4b   ; ...en la sala 8...
	ld a,(0d816h)		;be4c
	and a			;be4f
	ret z			;be50   ; ...con 0xD816...
	ld a,(0d801h)		;be51
	cp 00ah		;be54
	ret nc			;be56   ; ...por debajo del paso 0x0A
	call snake_en_d800_2		;be57   ; Snake
	call df80_en_d800_2		;be5a   ; la ficha de 0xDF80
	ld ix,0cb80h		;be5d   ; apunta a las 6 fichas de 16 bytes de lo que lanza Snake ([tipo][..][Y 8.8][X 8.8][velocidades]...)
	ld b,006h		;be61   ; 6 fichas
lanzado_en_d800_2:
	push bc			;be63
	ld a,(ix+000h)		;be64   ; lee el tipo de lo lanzado por Snake
	and a			;be67
	jr z,siguiente_lanzado_d800_2		;be68   ; libre, la siguiente
	ld b,(ix+005h)		;be6a   ; su X y su Y
	ld c,(ix+003h)		;be6d   ; lee la Y de lo lanzado por Snake
	call tipo_que_entra		;be70   ; tipo_que_entra: los tipos 1, 2 y 6 se miran (p07:BE9F); los demas, no
	jr nc,siguiente_lanzado_d800_2		;be73   ; fuera, sigue
	ld (ix+000h),000h		;be75   ; dentro: se acaba
siguiente_lanzado_d800_2:
	ld bc,00010h		;be79
	add ix,bc		;be7c
	pop bc			;be7e
	djnz lanzado_en_d800_2		;be7f
	ret			;be81
tipo_que_entra:		; los tipos 1, 2 y 6 se miran (p07:BE9F); los demas, no
	ld a,(ix+000h)		;be82
	cp 006h		;be85   ; el 6...
	jr z,dentro_de_la_forma		;be87
	cp 003h		;be89   ; ...y el 1 y el 2 se miran
	jr c,dentro_de_la_forma		;be8b
	ret			;be8d
snake_en_d800_2:		; Snake (X - 4, Y) dentro de la forma: al estado 0x14
	ld a,(0cb05h)		;be8e   ; lee la X de Snake
	sub 004h		;be91
	ld b,a			;be93
	ld a,(0cb03h)		;be94   ; lee la Y de Snake
	ld c,a			;be97
	call dentro_de_la_forma		;be98   ; dentro_de_la_forma: acarreo si (B = X, C = Y) cae dentro de la forma de la ficha: por la fila (0x0F - (Y de la ficha - C) / 8), una franja de X de p07:BF2C (filas 0-0x0B) o dos de p07:BF4C (las demas)
	ret nc			;be9b
	jp 08dbdh		;be9c   ; a_p03_ac02: p03:AC02 con el banco 3 en 0xA000
dentro_de_la_forma:		; acarreo si (B = X, C = Y) cae dentro de la forma de la ficha: por la fila (0x0F - (Y de la ficha - C) / 8), una franja de X de p07:BF2C (filas 0-0x0B) o dos de p07:BF4C (las demas)
	ld a,(0d803h)		;be9f
	sub c			;bea2   ; lo que hay de C a la Y de la ficha...
	cp 080h		;bea3
	ret nc			;bea5   ; ...por encima, desde 0x80, no
	srl a		;bea6   ; / 8...
	srl a		;bea8
	srl a		;beaa
	sub 00fh		;beac   ; ...la fila: 0x0F - eso
	neg		;beae
	cp 00ch		;beb0   ; las filas 0-0x0B: una franja
	jr nc,dos_franjas		;beb2
	ld hl,0bf2ch		;beb4   ; [desde][ancho]
	call 043f6h		;beb7   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
en_la_franja:		; acarreo con B - desde < ancho
	ld a,b			;beba
	sub l			;bebb
	cp h			;bebc
	ret			;bebd
dos_franjas:		; las demas: dos franjas de p07:BF4C (4 bytes)
	sub 00ch		;bebe
	add a,a			;bec0
	add a,a			;bec1
	ld hl,0bf4ch		;bec2
una_de_dos:
	call 0423eh		;bec5   ; suma_a_hl: HL = HL + A
	ld e,(hl)			;bec8
	inc hl			;bec9
	ld d,(hl)			;beca
	inc hl			;becb
	ld a,(hl)			;becc
	inc hl			;becd
	ld h,(hl)			;bece
	ld l,a			;becf
	push de			;bed0
	call en_la_franja		;bed1   ; la primera...
	pop hl			;bed4   ; ...dentro: acarreo
	ret c			;bed5
	jr en_la_franja		;bed6   ; ...si no, la segunda
df80_en_d800_2:		; con 0xD816 y la ficha 0 de 0xDF80 activa con su byte 7 a cero: si su sitio (+8, +8) cae en la forma (filas 0x0A en adelante, p07:BF44), el sonido 0x48 y uno menos a 0xD810; a 0, el paso 0x0A y fuera lo lanzado; si no, 0xD816 = 0 y 0xD817 = 0x10
	ld a,(0d816h)		;bed8
	and a			;bedb
	ret z			;bedc   ; sin 0xD816, nada
	ld a,(0df80h)		;bedd   ; lee 8 fichas de 8 bytes [tipo][dibujo][Y][X][fila][columna][espera][grafico] que suenan 0x14 en la sala y 0x15 al lado
	and a			;bee0
	ret z			;bee1   ; sin la ficha, nada
	ld a,(0df87h)		;bee2
	and a			;bee5
	ret nz			;bee6   ; con su byte 7, nada
	ld hl,(0df82h)		;bee7   ; su Y y X...
	ld bc,00808h		;beea
	add hl,bc			;beed   ; ...+ 8
	ld b,h			;beee
	ld c,l			;beef
	ld a,(0d803h)		;bef0   ; la fila...
	sub c			;bef3
	cp 080h		;bef4
	ret nc			;bef6   ; ...por encima, nada
	srl a		;bef7
	srl a		;bef9
	srl a		;befb
	sub 00fh		;befd
	neg		;beff
	cp 00ah		;bf01
	ret c			;bf03   ; por encima de la fila 0x0A, nada
	push bc			;bf04
	sub 00ah		;bf05   ; las dos franjas de la fila
	add a,a			;bf07
	add a,a			;bf08
	ld hl,0bf44h		;bf09
	call una_de_dos		;bf0c   ; una_de_dos:
	pop bc			;bf0f
	ret nc			;bf10   ; fuera, nada
	call 06c17h		;bf11   ; sonido_48: pide el sonido 0x48
	ld hl,0d810h		;bf14   ; uno menos a 0xD810
	dec (hl)			;bf17
	jr nz,d816_a_cero		;bf18
	ld a,00ah		;bf1a   ; a cero: el paso 0x0A...
	ld (0d801h),a		;bf1c
	jp fuera_lo_lanzado		;bf1f   ; ...y fuera lo lanzado
d816_a_cero:		; 0xD816 = 0...
	xor a			;bf22
	ld (0d816h),a		;bf23
	ld a,010h		;bf26   ; ...0xD817 = 0x10
	ld (0d817h),a		;bf28
	ret			;bf2b

; ----------------------------------------------------------------------
; DATOS resto_BF2C: lo apuntan con el banco puesto p07:BEB4 (0xBF2C), p07:BF09
;   (0xBF44), p07:BEC2 (0xBF4C); el tamano es lo que hay hasta lo siguiente,
;   no sale de recorrerlo; lo leen p07:BEB4, p07:BF09, p07:BEC2 (48 bytes)
;   0xbf2c..0xbf5c  (48 bytes)
DATA_resto_BF2C:
	defb 030h,055h,030h,055h,030h,050h,030h,048h,030h,055h,030h,060h,030h,055h,040h,045h	; bf2c  0U0U0P0H0U0`0U@E
	defb 040h,040h,040h,040h,040h,040h,040h,040h,040h,020h,070h,018h,040h,020h,070h,018h	; bf3c  @@@@@@@@@ p.@ p.
	defb 040h,020h,070h,018h,038h,020h,070h,018h,038h,018h,070h,020h,040h,008h,078h,018h	; bf4c  @ p.8 p.8.p @.x.

; ======================================================================
; CODIGO 0xbf5c..0xbfc3  (103 bytes)
; ======================================================================


toca_e230_o_fijas:		; acarreo si la caja de (H, L, D, E) toca la ficha 0xE230, la caja de la zona 0x0C sala 6 o alguna de las de p12:7F25
	push ix		;bf5c
	call toca_e230_b		;bf5e   ; toca_e230_b:
	pop ix		;bf61
	ret			;bf63
toca_e230_b:
	push de			;bf64
	push hl			;bf65
	call caja_e230		;bf66   ; la de 0xE230
	pop hl			;bf69
	pop de			;bf6a
	ret c			;bf6b
	push de			;bf6c
	push hl			;bf6d
	call caja_0c_6		;bf6e   ; la de la zona 0x0C sala 6
	pop hl			;bf71
	pop de			;bf72
	ret c			;bf73
	call 041ddh		;bf74   ; bancos_12: pone el 12 en 0x6000 (con su copia en 0xC381-0xC383)
	call cajas_7f25		;bf77   ; las de p12:7F25
	jp 041adh		;bf7a   ; bancos_1_2_7: pone el 1 en 0x6000, el 2 en 0x8000, el 7 en 0xA000 (con su copia en 0xC381-0xC383)
cajas_7f25:		; 0xCB74 = 0 y las cajas de p12:7F25 una tras otra hasta 0xCB74 = 0xFF; acarreo con la que toca
	ld hl,0cb74h		;bf7d   ; apunta a el numero de la lista de la sala (0xFF: se acabo; p12:7F3B)
	ld (hl),000h		;bf80
caja_7f25:
	call 07f25h		;bf82   ; cb74_siguiente: con el banco 56: el de 0xCB74 en la sala (p12:7F3B: DE y HL de p56:A62E) y 0xCB74 uno mas (salvo en 0xFF); luego el banco 7
	ld a,(0cb74h)		;bf85   ; lee el numero de la lista de la sala (0xFF: se acabo; p12:7F3B)
	cp 0ffh		;bf88   ; 0xFF: se acabaron
	jr nz,toca_7f25		;bf8a
sin_acarreo_bf8c:
	or a			;bf8c
	ret			;bf8d
toca_7f25:
	call se_tocan		;bf8e   ; se_tocan: acarreo si se tocan las dos cajas: la de (H, L) con D y E y la del otro juego de registros (|X - X'| < D + D'; en Y, por debajo menos que E y por encima menos que E')
	jr nc,caja_7f25		;bf91
	ret			;bf93
caja_e230:		; con 0xE230, su caja en (Y = 0xE233 + 0x32, X = 0xE234), 0x32 x 0x34
	ld a,(0e230h)		;bf94
	or a			;bf97
	ret z			;bf98   ; sin 0xE230, nada
	exx			;bf99
	ld a,(0e233h)		;bf9a   ; la Y + 0x32...
	add a,032h		;bf9d
	ld l,a			;bf9f
	ld e,034h		;bfa0   ; ...0x34 de alto
	ld a,(0e234h)		;bfa2   ; la X...
	ld h,a			;bfa5
	ld d,032h		;bfa6   ; ...0x32 de ancho
	jr toca_bfbf		;bfa8
caja_0c_6:		; en la zona 0x0C sala 6, la caja de (Y = 0xB8, X = 0x40), 0x30 x 0xB0
	ld a,(0ca4ah)		;bfaa   ; lee la zona
	cp 00ch		;bfad
	jr nz,sin_acarreo_bf8c		;bfaf
	ld a,(0ca4bh)		;bfb1   ; lee la sala de la zona
	cp 006h		;bfb4
	jr nz,sin_acarreo_bf8c		;bfb6
	exx			;bfb8
	ld de,030b0h		;bfb9
	ld hl,040b8h		;bfbc
toca_bfbf:
	exx			;bfbf
	jp se_tocan		;bfc0   ; se_tocan: acarreo si se tocan las dos cajas: la de (H, L) con D y E y la del otro juego de registros (|X - X'| < D + D'; en Y, por debajo menos que E y por encima menos que E')

; ----------------------------------------------------------------------
; DATOS restos_finales_BFC3: 61 bytes al final del banco detras del ultimo
;   bloque que se lee (resto_BF2C): ningun lector del listado llega a ellos ni
;   los apunta ninguna tabla declarada
;   0xbfc3..0xc000  (61 bytes)
DATA_restos_finales_BFC3:
	defb 0b5h,000h,080h,000h,042h,000h,000h,000h,0beh,0ffh,080h,0ffh,04bh,0ffh,023h,0ffh	; bfc3  ....B.......K.#.
	defb 009h,0ffh,000h,0ffh,009h,0ffh,023h,0ffh,04bh,0ffh,080h,0ffh,0beh,0ffh,000h,000h	; bfd3  ......#.K.......
	defb 042h,000h,080h,000h,0b5h,000h,0ddh,000h,0f7h,000h,000h,001h,0f7h,000h,0ddh,000h	; bfe3  B...............
	defb 0b5h,000h,080h,000h,042h,000h,0c0h,021h,0a4h,0d8h,0c3h,0e5h,0b3h	; bff3  ....B..!.....
