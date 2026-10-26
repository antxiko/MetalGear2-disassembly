; ==========================================================================
; METAL GEAR 2 SOLID SNAKE - Konami (1990) - MSX2 - MegaROM RC-767 de 512 KB (Konami SCC) - banco 12 (se ejecuta en 0x6000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x06000


; ----------------------------------------------------------------------
; Direcciones que solo aparecen como VALOR -en un `ld`, no en
; un salto-: son punteros que el codigo se pasa o numeros que
; casualmente coinciden con una direccion. No hay nada que
; trazar en ellas; el equ existe para que el listado ensamble.
; ----------------------------------------------------------------------
l6c20h:	equ 0x06c20
l7ecfh:	equ 0x07ecf

; ======================================================================
; CODIGO 0x6000..0x6050  (80 bytes)
; ======================================================================


menu_de_guardar:		; la pantalla del menu de guardar y cargar: 0xC3A0, 0xC38D, 0xC39F y 0xC3A1 a cero, el paso 1 en 0xC3A2, la pagina borrada, dos recuadros (p12:603C), el letrero de p12:BF74 y la marca de 0xC39F (p12:60D3)
	call 045f1h		;6000   ; apaga_pantalla_y_sprites: p00:45CC y p00:45F6
	call 09dbdh		;6003   ; que se puede usar
	xor a			;6006   ; la ranura 0...
	ld (0c3a0h),a		;6007   ; guarda la ranura del menu de guardar (0-2: SNAKE1-3)
	ld (0c38dh),a		;600a   ; ...la opcion 0...
	ld (0c39fh),a		;600d   ; ...guardar...
	ld (0c3a1h),a		;6010   ; ...sin resultado
	ld a,001h		;6013   ; el paso 1
	ld (0c3a2h),a		;6015   ; guarda el paso del menu de guardar (1-9; 0 fuera, 0xFF cargada)
	ld a,(0ca42h)		;6018   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	call 04452h		;601b   ; la pagina en negro
	ld hl,01018h		;601e   ; en (0x10, 0x18)...
	ld bc,0381ch		;6021   ; ...0x38 x 0x1C
	call pon_recuadro		;6024   ; pon_recuadro: un recuadro en HL (X, Y) de B x C (ancho x alto): lleno del color 0x99 y con el marco de color 7
	ld hl,01c04h		;6027   ; en (0x1C, 4)...
	ld bc,08810h		;602a   ; ...0x88 x 0x10
	call pon_recuadro		;602d   ; pon_recuadro: un recuadro en HL (X, Y) de B x C (ancho x alto): lleno del color 0x99 y con el marco de color 7
	ld hl,0bf74h		;6030   ; el letrero de p12:BF74
	call 04918h		;6033   ; letrero_con_sitio: [fila][columna] y letras; 0xFE otra posicion, 0xFF acaba
	call marca_c39f		;6036   ; la marca de guardar o cargar
	jp 045c5h		;6039   ; enciende_pantalla: R#1 con el bit 6 (BL) a uno, desde la copia 0xF3E0
pon_recuadro:		; un recuadro en HL (X, Y) de B x C (ancho x alto): lleno del color 0x99 y con el marco de color 7
	ld a,(0ca42h)		;603c   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	ld d,a			;603f
	ld a,099h		;6040   ; el color 0x99
	push hl			;6042
	push de			;6043
	push bc			;6044
	call 046ffh		;6045   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
	pop de			;6048
	pop af			;6049
	pop hl			;604a
	ld c,007h		;604b   ; el marco de color 7
	jp 046bch		;604d   ; marco: cuatro lineas: un marco de D x E desde HL

; ----------------------------------------------------------------------
; DATOS resto_6050: lo apuntan con el banco puesto p12:60C3 (0x6050), p12:60E3
;   (0x6054), p12:6133 (0x6054); el tamano es lo que hay hasta lo siguiente,
;   no sale de recorrerlo; lo leen p12:60C3, p12:60E3, p12:6133 (5 bytes)
;   0x6050..0x6055  (5 bytes)
DATA_resto_6050:
	defb 01dh,01ch,00bh,017h,0ffh	; 6050

; ======================================================================
; CODIGO 0x6055..0x605c  (7 bytes)
; ======================================================================


menu_cada_cuadro:		; el paso del menu (0xC3A2, desde 1) por la tabla de p12:605C
	ld a,(0c3a2h)		;6055   ; lee el paso del menu de guardar (1-9; 0 fuera, 0xFF cargada)
	dec a			;6058   ; desde 1
	call 0424dh		;6059   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_605C: 9 destinos del despachador p00:424D (call en p12:6059, el
;   indice en A): 606E, 6155, 62B4, 62F7, 63F3, 6413, 63F3, 643A, 6458; lo
;   leen p12:6059 (18 bytes)
;   0x605c..0x606e  (18 bytes)
DATA_tabla_605C:
	defw 0606eh,06155h,062b4h,062f7h,063f3h,06413h,063f3h,0643ah	; 605c
	defw 06458h	; 606c  -> menu_paso_9

; ======================================================================
; CODIGO 0x606e..0x64ff  (1169 bytes)
; ======================================================================


menu_paso_1:		; guardar o cargar: con F1-F5, fuera (p12:63FC); arriba o abajo cambian 0xC39F (sonido 0x11); izquierda o derecha, a la opcion
	call menu_fuera_con_f		;606e   ; menu_fuera_con_f: con F1-F5 recien pulsada: 0xC3A2 = 0 y NZ (en el estado 5 de la partida, antes p00:5DE2); sin ella, Z
	ret nz			;6071   ; con una tecla de funcion, fuera
	ld a,(0ca07h)		;6072   ; lee lo recien pulsado del mando (los bits de 0xCA08 que no estaban)
	rra			;6075   ; arriba...
	jr c,cambia_c39f		;6076
	rra			;6078   ; ...o abajo
	jr c,cambia_c39f		;6079
	and 00ch		;607b   ; izquierda o derecha
	jr nz,a_las_opciones		;607d
	ret			;607f
cambia_c39f:
	call 05f49h		;6080   ; sonido_11: pide el sonido 0x11
	ld hl,0c39fh		;6083   ; apunta a en el menu de guardar: 0 guardar, 1 cargar
	ld a,(hl)			;6086   ; cambia...
	xor 001h		;6087   ; 0 guardar, 1 cargar
	ld (hl),a			;6089
	jp marca_c39f		;608a   ; y su marca
a_las_opciones:		; el recuadro de las opciones (su alto por 0xC38B: 0x10, 0x1C o 0x28), el letrero de p12:BF95, el de p12:BFA0 con la disquetera y el de p12:6050 con el Game Master 2 (fila 0x34 con los dos); la marca de 0xC38D y el paso siguiente
	ld a,(0c38bh)		;608d   ; lee bit 0: hay disquetera; bit 1: hay Game Master 2
	ld c,010h		;6090   ; sin nada, 0x10
	and a			;6092   ; sin nada...
	jr z,L_609D		;6093
	cp 003h		;6095   ; ...uno...
	ld c,01ch		;6097   ; con uno, 0x1C
	jr c,L_609D		;6099
	ld c,028h		;609b   ; con los dos, 0x28
L_609D:
	ld hl,05818h		;609d   ; en (0x58, 0x18)...
	ld b,058h		;60a0   ; ...0x58 de ancho
	call pon_recuadro		;60a2   ; pon_recuadro: un recuadro en HL (X, Y) de B x C (ancho x alto): lleno del color 0x99 y con el marco de color 7
	ld hl,0bf95h		;60a5   ; el letrero de p12:BF95
	call 04918h		;60a8   ; letrero_con_sitio: [fila][columna] y letras; 0xFE otra posicion, 0xFF acaba
	ld hl,0bfa0h		;60ab   ; el de p12:BFA0...
	ld a,(0c38bh)		;60ae   ; lee bit 0: hay disquetera; bit 1: hay Game Master 2
	rra			;60b1   ; ...con la disquetera
	call c,04918h		;60b2   ; letrero_con_sitio: [fila][columna] y letras; 0xFE otra posicion, 0xFF acaba
	ld a,(0c38bh)		;60b5   ; lee bit 0: hay disquetera; bit 1: hay Game Master 2
	sub 002h		;60b8   ; sin Game Master 2, nada mas
	jr c,marca_y_siguiente		;60ba
	ld de,06828h		;60bc   ; en la fila 0x28...
	jr z,L_60C3		;60bf
	ld e,034h		;60c1   ; ...o 0x34 con la disquetera
L_60C3:
	ld hl,06050h		;60c3   ; el de p12:6050...
	ld c,0ffh		;60c6   ; ...sin posicion propia
	call 04922h		;60c8   ; el letrero sin posicion propia
marca_y_siguiente:
	call marca_c38d		;60cb   ; marca_c38d: la marca en la fila 0x1C + 0x0C por la opcion 0xC38D, tras borrar la columna (p12:6112)
menu_paso_siguiente:
	ld hl,0c3a2h		;60ce   ; apunta a el paso del menu de guardar (1-9; 0 fuera, 0xFF cargada)
	inc (hl)			;60d1   ; el paso siguiente
	ret			;60d2
marca_c39f:		; borra la columna de marcas y pone la marca en la fila 0x1C (guardar) o 0x28 (cargar)
	ld a,(0c39fh)		;60d3   ; lee en el menu de guardar: 0 guardar, 1 cargar
	and a			;60d6
	ld de,0181ch		;60d7   ; guardar: fila 0x1C...
	jr z,borra_marcas_c39f		;60da
	ld e,028h		;60dc   ; ...cargar: 0x28
	jr borra_marcas_c39f		;60de
marca_c3a0:		; la marca en la fila 0x54 + 0x10 por la ranura 0xC3A0, tras borrar la columna (p12:6132)
	ld a,(0c3a0h)		;60e0   ; lee la ranura del menu de guardar (0-2: SNAKE1-3)
	ld de,06054h		;60e3   ; la columna 0x54
	add a,a			;60e6   ; * 0x10
	add a,a			;60e7
	add a,a			;60e8
	add a,a			;60e9
	call 04243h		;60ea   ; DE = 0x6054 + ranura * 0x10
	jr borra_marcas_c3a0		;60ed
marca_c38d:		; la marca en la fila 0x1C + 0x0C por la opcion 0xC38D, tras borrar la columna (p12:6112)
	ld de,0601ch		;60ef   ; la columna 0x1C
	ld a,(0c38dh)		;60f2   ; lee la opcion del menu de guardar (0 la de p14:BA98; 1 la primera unidad; 2 el Game Master 2)
	add a,a			;60f5   ; * 0x0C
	add a,a			;60f6
	ld b,a			;60f7
	add a,a			;60f8
	add a,b			;60f9
	call 04243h		;60fa   ; suma_a_de: DE = DE + A
	jr borra_marcas_c38d		;60fd
borra_marcas_c39f:
	push de			;60ff
	ld hl,0181ch		;6100   ; (0x18, 0x1C), 0x14 x 8
	ld bc,00814h		;6103
	ld a,(0ca42h)		;6106   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	ld d,a			;6109
	ld a,099h		;610a   ; el color 0x99
	call 046ffh		;610c   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
	pop de			;610f
	jr dibuja_marca		;6110
borra_marcas_c38d:		; la columna de marcas de las opciones, su alto por 0xC38B (0x14 o 0x20; sin nada, no se borra)
	push de			;6112
	ld a,(0c38bh)		;6113   ; lee bit 0: hay disquetera; bit 1: hay Game Master 2
	and a			;6116   ; sin nada, nada que borrar
	jr z,pon_marca		;6117
	cp 003h		;6119   ; con uno, 0x14...
	ld c,014h		;611b
	jr c,L_6121		;611d
	ld c,020h		;611f   ; ...con los dos, 0x20
L_6121:
	ld hl,0601ch		;6121   ; (0x60, 0x1C)...
	ld b,008h		;6124   ; ...8 de ancho
	ld a,(0ca42h)		;6126   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	ld d,a			;6129
	ld a,099h		;612a
	call 046ffh		;612c   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
pon_marca:
	pop de			;612f
	jr dibuja_marca		;6130
borra_marcas_c3a0:
	push de			;6132
	ld hl,06054h		;6133   ; (0x60, 0x54)
	ld bc,00828h		;6136   ; 8 x 0x28
	ld a,(0ca42h)		;6139   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	ld d,a			;613c
	ld a,099h		;613d
	call 046ffh		;613f   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
	pop de			;6142
dibuja_marca:		; copia el dibujo de 8 x 8 de (0x50, 0x38) a DE con la operacion 0xC8, de la pagina de 0xCA42
	ld hl,05038h		;6143   ; de (0x50, 0x38)...
	ld bc,00808h		;6146   ; ...8 x 8
	ld a,(0ca42h)		;6149   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	rrca			;614c   ; la pagina de destino...
	rrca			;614d
	rrca			;614e
	rrca			;614f
	or 0c8h		;6150   ; ...con la operacion 0xC8
	jp 047edh		;6152   ; copia_rectangulo_logica: orden LMMM del VDP con la operacion logica de A
menu_paso_2:		; la opcion 0xC38D: arriba o abajo la cambian (2 o 3 opciones por 0xC38B; sin nada, directa); con izquierda o derecha, al guardar la partida a 0xC706 (p12:61F3); con la opcion 0, el paso 8 y p14:BA98 (guardar) o p14:BBA7 (cargar); con las otras, el letrero de p12:BFA7, la marca de la ranura y el paso siguiente
	call menu_fuera_con_f		;6155   ; menu_fuera_con_f: con F1-F5 recien pulsada: 0xC3A2 = 0 y NZ (en el estado 5 de la partida, antes p00:5DE2); sin ella, Z
	ret nz			;6158
	ld hl,0c38dh		;6159   ; apunta a la opcion del menu de guardar (0 la de p14:BA98; 1 la primera unidad; 2 el Game Master 2)
	ld a,(0c38bh)		;615c   ; lee bit 0: hay disquetera; bit 1: hay Game Master 2
	ld b,002h		;615f   ; 2 opciones...
	and a			;6161
	jr z,opcion_elegida		;6162   ; ...sin nada, la 0 sin elegir
	cp 003h		;6164
	jr c,L_6169		;6166
	inc b			;6168   ; ...3 con los dos
L_6169:
	ld a,(0ca07h)		;6169   ; lee lo recien pulsado del mando (los bits de 0xCA08 que no estaban)
	rra			;616c   ; arriba...
	jr c,c38d_menos		;616d
	rra			;616f   ; ...abajo...
	jr c,c38d_mas		;6170
	and 00ch		;6172   ; ...izquierda o derecha
	ret z			;6174
opcion_elegida:		; guardando, la partida a 0xC706
	call guarda_si_c39f_0		;6175   ; guarda_si_c39f_0: al guardar (0xC39F = 0), p12:61F8
	ld a,(0c38dh)		;6178   ; lee la opcion del menu de guardar (0 la de p14:BA98; 1 la primera unidad; 2 el Game Master 2)
	and a			;617b   ; la 0?
	jr z,opcion_0		;617c   ; la 0, aparte
	call letrero_de_ranuras		;617e   ; el letrero de las ranuras...
	call marca_c3a0		;6181   ; ...y su marca
	jp menu_paso_siguiente		;6184   ; menu_paso_siguiente:
opcion_0:		; el paso 8 con 0xC3A1 = 0, el recuadro grande y, guardando, p14:BA98; cargando, 0xE900, 0xC7C0 y 0xC900 a cero / 0xFF y p14:BBA7
	ld a,008h		;6187   ; el paso 8
	ld (0c3a2h),a		;6189   ; guarda el paso del menu de guardar (1-9; 0 fuera, 0xFF cargada)
	xor a			;618c
	ld (0c3a1h),a		;618d   ; sin resultado
	ld hl,00c38h		;6190   ; en (0x0C, 0x38)...
	ld bc,0a888h		;6193   ; ...0xA8 x 0x88
	call pon_recuadro		;6196   ; pon_recuadro: un recuadro en HL (X, Y) de B x C (ancho x alto): lleno del color 0x99 y con el marco de color 7
	ld a,(0c39fh)		;6199   ; lee en el menu de guardar: 0 guardar, 1 cargar
	and a			;619c
	jr nz,opcion_0_cargar		;619d   ; cargando, aparte
	call 041efh		;619f   ; bancos_14: pone el 14 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0ba98h		;61a2   ; letras_de_la_partida: la opcion 0, guardando: 0xE900 y 0xC7C0 a cero, la clave 0xC7C1 de los cuadros, la partida de 0xC700 en rachas en 0xC804 (p14:BE57), su largo + 1 en 0xC7C0, la suma (p14:BB33) en 0xC7C2, la cabecera [clave][suma][largo] en 0xC800, todo cifrado (p14:BB1D), pasado a bits en 0xE900 y de 6 en 6 a 0xC900 (0xFF al final), y pintado (p14:BC7F)
	jp 041a0h		;61a5   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
opcion_0_cargar:
	ld hl,0e900h		;61a8   ; apunta a los caracteres de un dibujo pasados a 4 bits
	ld bc,004ffh		;61ab   ; 0x500 bytes
	call 04236h		;61ae   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	ld hl,0c7c0h		;61b1   ; 0xC7C0...
	ld bc,0023fh		;61b4   ; 0x240 bytes
	call 04236h		;61b7   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	ld hl,0c900h		;61ba   ; 0x100 bytes a 0xFF
	ld bc,000ffh		;61bd
	ld a,0ffh		;61c0   ; ...0xC900 a 0xFF
	call 04237h		;61c2   ; llena_bloque: pone A en BC + 1 bytes desde HL
	call 041efh		;61c5   ; bancos_14: pone el 14 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0bba7h		;61c8   ; rejilla_de_letras: 11 rayas de 0x9C de color 9 desde (0x12, 0x44), cada 0x0C mas abajo, y la de 8 de color 0x0A bajo la letra del cursor 0xC7C4 (p14:BBCE)
	jp 041a0h		;61cb   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
c38d_menos:
	ld a,(hl)			;61ce   ; la opcion
	sub 001h		;61cf   ; desde la 0...
	jr nc,pon_c38d		;61d1
	ld a,b			;61d3   ; ...la ultima
	dec a			;61d4
	jr pon_c38d		;61d5
c38d_mas:
	ld a,(hl)			;61d7   ; la opcion
	inc a			;61d8
	cp b			;61d9   ; pasada la ultima...
	jr c,pon_c38d		;61da
	xor a			;61dc   ; ...la 0
pon_c38d:
	ld (hl),a			;61dd   ; guarda
	call 05f49h		;61de   ; sonido_11: pide el sonido 0x11
	jp marca_c38d		;61e1   ; marca_c38d: la marca en la fila 0x1C + 0x0C por la opcion 0xC38D, tras borrar la columna (p12:6112)
letrero_de_ranuras:		; el recuadro de (0x58, 0x50), 0x58 x 0x30 y el letrero de p12:BFA7
	ld hl,05850h		;61e4   ; en (0x58, 0x50)...
	ld bc,05830h		;61e7   ; ...0x58 x 0x30
	call pon_recuadro		;61ea   ; pon_recuadro: un recuadro en HL (X, Y) de B x C (ancho x alto): lleno del color 0x99 y con el marco de color 7
	ld hl,0bfa7h		;61ed   ; el letrero de p12:BFA7
	jp 04918h		;61f0   ; letrero_con_sitio: [fila][columna] y letras; 0xFE otra posicion, 0xFF acaba
guarda_si_c39f_0:		; al guardar (0xC39F = 0), p12:61F8
	ld a,(0c39fh)		;61f3   ; lee en el menu de guardar: 0 guardar, 1 cargar
	and a			;61f6
	ret nz			;61f7   ; cargando, nada
partida_a_c706:		; p14:BF36 y lo de la partida a 0xC706: la fase, 0xCAA0, el nivel, 0xD430, los bits de 0xD880 y 0xD888 (p12:62A4), 0x15 bytes de banderas de 0xD7D0, 5 de 0xD7F0 y de las 48 fichas de 0xD600: si se tienen (6 bytes de bits), su cuenta (48) y la parte alta de 24 parejas; en la zona 4 sin el bit 0 de 0xD7D4, antes fuera el bit 1 de 0xD7D4, el 4 de 0xD7DE y 0xCAA0 = 0
	call 041efh		;61f8   ; bancos_14: pone el 14 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0bf36h		;61fb   ; cosas_por_d880: antes de guardar, por debajo de la zona 0x12: las cosas que se dan una vez por 0xD883 (bit 6 de 0xD7F4, 0xD68C), 0xD886 (bit 5, 0xD6A0), 0xD88A en la zona 0x0B (0xD69C) y 0xD882 (bit 7, 0xD688), a 0xFF: la cosa con 1 y cuenta 1
	call 041a0h		;61fe   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	ld a,(0ca4ah)		;6201   ; lee la zona
	cp 004h		;6204   ; la zona 4...
	jr nz,copia_la_partida		;6206
	ld hl,0d7d4h		;6208   ; el bit 0 de 0xD7D4
	ld a,(hl)			;620b
	rra			;620c
	jr c,copia_la_partida		;620d   ; ...con el bit 0, nada
	res 1,(hl)		;620f   ; el bit 1 fuera
	ld hl,0d7deh		;6211   ; 0xD7DE
	set 4,(hl)		;6214   ; el bit 4 de 0xD7DE
	xor a			;6216   ; nadie sigue a Snake
	ld (0caa0h),a		;6217   ; guarda cuantos siguen a Snake por su rastro (1-4)
copia_la_partida:		; 0xC706: la fase
	ld hl,0c706h		;621a   ; apunta a la partida para guardar: la fase (0xC706-0xC772 desde p12:61F8)
	ld a,(0ca22h)		;621d   ; lee la fase de la partida (indice de las listas de p06:B40C)
	ld (hl),a			;6220
	inc hl			;6221   ; 0xC707: cuantos le siguen
	ld a,(0caa0h)		;6222   ; lee cuantos siguen a Snake por su rastro (1-4)
	ld (hl),a			;6225
	inc hl			;6226   ; 0xC708: el nivel
	ld a,(0cab5h)		;6227   ; lee el nivel de Snake: la barra de vida llena mide 0x20 + 8 por nivel
	ld (hl),a			;622a
	inc hl			;622b   ; 0xC709: 0xD430
	ld a,(0d430h)		;622c
	ld (hl),a			;622f
	ld hl,0d880h		;6230   ; los 8 de 0xD880...
	call bits_de_ocho		;6233   ; bits_de_ocho: C = un bit por cada uno de los 8 bytes de HL: 1 si vale 0xFF
	ld a,c			;6236   ; ...en 0xC70A
	ld (0c70ah),a		;6237
	ld hl,0d888h		;623a   ; los 8 de 0xD888...
	call bits_de_ocho		;623d   ; bits_de_ocho: C = un bit por cada uno de los 8 bytes de HL: 1 si vale 0xFF
	ld a,c			;6240   ; ...en 0xC70B
	ld (0c70bh),a		;6241
	ld hl,0d7d0h		;6244   ; las banderas...
	ld de,0c70ch		;6247   ; ...a 0xC70C...
	ld bc,00015h		;624a   ; ...0x15 bytes
	ldir		;624d
	ld hl,0d7f0h		;624f   ; las otras...
	ld de,0c721h		;6252   ; ...a 0xC721...
	ld bc,00005h		;6255   ; ...5 bytes
	ldir		;6258
	ld de,0d600h		;625a   ; las fichas de lo que lleva...
	ld hl,0c726h		;625d   ; ...a 0xC726...
	ld c,006h		;6260   ; ...6 bytes
L_6262:
	ld b,008h		;6262   ; de 8 fichas
L_6264:
	ld a,(de)			;6264   ; el bit 0 de su primer byte...
	rra			;6265   ; el bit 0
	rl (hl)		;6266   ; ...entra por la derecha
	inc de			;6268   ; la siguiente (4 bytes)
	inc de			;6269
	inc de			;626a
	inc de			;626b
	djnz L_6264		;626c
	inc hl			;626e
	dec c			;626f   ; 6 bytes
	jr nz,L_6262		;6270
	ld hl,0d601h		;6272   ; las cuentas...
	ld de,0c72ch		;6275   ; ...a 0xC72C...
	ld b,030h		;6278   ; ...48
L_627A:
	ld a,(hl)			;627a   ; la cuenta...
	ld (de),a			;627b   ; ...a 0xC72C
	inc de			;627c
	inc hl			;627d   ; la siguiente (4 bytes)
	inc hl			;627e
	inc hl			;627f
	inc hl			;6280
	djnz L_627A		;6281
	ld hl,0d602h		;6283   ; la parte alta de la cuenta...
	ld de,0c75ch		;6286   ; ...a 0xC75C...
	ld b,018h		;6289   ; ...24 bytes de dos fichas
L_628B:
	ld a,(hl)			;628b   ; la de una en el nibble alto...
	rlca			;628c   ; al nibble alto
	rlca			;628d
	rlca			;628e
	rlca			;628f
	and 0f0h		;6290
	ld c,a			;6292
	inc hl			;6293   ; ...la siguiente...
	inc hl			;6294
	inc hl			;6295
	inc hl			;6296
	ld a,(hl)			;6297   ; ...en el bajo
	and 00fh		;6298   ; al bajo
	or c			;629a
	ld (de),a			;629b   ; los dos juntos
	inc de			;629c
	inc hl			;629d
	inc hl			;629e
	inc hl			;629f
	inc hl			;62a0
	djnz L_628B		;62a1
	ret			;62a3
bits_de_ocho:		; C = un bit por cada uno de los 8 bytes de HL: 1 si vale 0xFF
	ld c,000h		;62a4
	ld b,008h		;62a6   ; 8 bytes
L_62A8:
	ld a,(hl)			;62a8   ; el byte
	inc a			;62a9   ; 0xFF?
	or a			;62aa
	jr nz,L_62AE		;62ab
	scf			;62ad   ; si: el bit a 1
L_62AE:
	rl c		;62ae   ; entra por la derecha
	inc hl			;62b0   ; el siguiente
	djnz L_62A8		;62b1
	ret			;62b3
menu_paso_3:		; la ranura 0xC3A0 (0-2): arriba o abajo la cambian; con izquierda o derecha, sonido 0xFA y el paso 4 (disco) o el 6 (la opcion 2, o sin disquetera)
	call menu_fuera_con_f		;62b4   ; menu_fuera_con_f: con F1-F5 recien pulsada: 0xC3A2 = 0 y NZ (en el estado 5 de la partida, antes p00:5DE2); sin ella, Z
	ret nz			;62b7
	ld hl,0c3a0h		;62b8   ; apunta a la ranura del menu de guardar (0-2: SNAKE1-3)
	ld a,(0ca07h)		;62bb   ; arriba...
	rra			;62be   ; arriba
	jr c,c3a0_menos		;62bf
	rra			;62c1   ; ...abajo...
	jr c,c3a0_mas		;62c2
	and 00ch		;62c4   ; ...izquierda o derecha
	ret z			;62c6
	call 05f41h		;62c7   ; sonido_fa: pide el sonido 0xFA
	ld a,(0c38dh)		;62ca   ; la opcion 2...
	cp 002h		;62cd   ; la 2?
	jr z,al_paso_6		;62cf
	ld a,(0c38bh)		;62d1   ; ...o solo Game Master 2: el paso 6
	cp 002h		;62d4   ; solo el Game Master 2?
	jp nz,menu_paso_siguiente		;62d6   ; si no, el paso 4
al_paso_6:
	ld a,006h		;62d9   ; el paso 6
	ld (0c3a2h),a		;62db   ; guarda el paso del menu de guardar (1-9; 0 fuera, 0xFF cargada)
	ret			;62de
c3a0_mas:
	ld a,(hl)			;62df
	inc a			;62e0   ; la siguiente
	cp 003h		;62e1   ; pasada la 2...
	jr c,pon_c3a0		;62e3
	xor a			;62e5   ; ...la 0
	jr pon_c3a0		;62e6
c3a0_menos:
	ld a,(hl)			;62e8
	dec a			;62e9
	cp 0ffh		;62ea   ; bajo la 0...
	jr nz,pon_c3a0		;62ec
	ld a,002h		;62ee   ; ...la 2
pon_c3a0:
	ld (hl),a			;62f0
	call 05f49h		;62f1   ; sonido_11: pide el sonido 0x11
	jp marca_c3a0		;62f4   ; marca_c3a0: la marca en la fila 0x54 + 0x10 por la ranura 0xC3A0, tras borrar la columna (p12:6132)
menu_paso_4:		; el disco (p12:6480) y el sonido 0xFB; con error (0xC3A1 = 2), 0xC3A3 = 0x40, el sonido 0x3F y el paso 5; sin el, guardando, el letrero de p12:BFC2 y el paso 5; cargando, la partida de vuelta (p12:6327) y 0xC3A2 = 0xFF
	call por_el_disco		;62f7   ; por_el_disco: guarda o carga la partida en el disco: sin la interrupcion de linea (R#0 = 6), H.KEYI a ret, la pila en 0xC392; la RAM de 0x9600 cambiada con 0xDD00 (p12:6595), el FCB de la ranura (p12:651F), abrir o crear (p12:64C9), registro de 1 byte (p12:6502), 0x73 bytes desde 0xC700 (p12:64BB), cerrar (p12:64EF); la RAM de vuelta (p12:65C1), H.KEYI y R#0 = 0x16
	call 05f45h		;62fa   ; sonido_fb: pide el sonido 0xFB
	ld a,(0c3a1h)		;62fd   ; error?
	cp 002h		;6300   ; error?
	jr nz,disco_sin_error		;6302
	ld a,040h		;6304   ; 0x40 cuadros de espera
	ld (0c3a3h),a		;6306   ; guarda los cuadros de espera del menu de guardar tras un error
	call 05f4dh		;6309   ; sonido_3f: pide el sonido 0x3F
	jp menu_paso_siguiente		;630c   ; menu_paso_siguiente:
disco_sin_error:
	ld a,(0c39fh)		;630f   ; lee en el menu de guardar: 0 guardar, 1 cargar
	and a			;6312
	jr nz,partida_cargada		;6313
	ld hl,0bfc2h		;6315   ; el letrero de p12:BFC2
	call 04918h		;6318   ; letrero_con_sitio: [fila][columna] y letras; 0xFE otra posicion, 0xFF acaba
	jp menu_paso_siguiente		;631b   ; menu_paso_siguiente:
partida_cargada:
	call partida_de_c700		;631e   ; partida_de_c700: lo de 0xCA20-0xF0FE a cero (salvo 0xCA42) y la partida de vuelta desde 0xC700: zona, sala especial, Y y X de Snake, fila y columna, fase, 0xCAA0, nivel, 0xD430, 0xD880 y 0xD888 (p12:63DE), las banderas de 0xD7D0 y 0xD7F0 y las 48 fichas de 0xD600 (al reves que p12:61F8)
	ld a,0ffh		;6321   ; el menu se acaba con 0xFF
	ld (0c3a2h),a		;6323   ; guarda el paso del menu de guardar (1-9; 0 fuera, 0xFF cargada)
	ret			;6326
partida_de_c700:		; lo de 0xCA20-0xF0FE a cero (salvo 0xCA42) y la partida de vuelta desde 0xC700: zona, sala especial, Y y X de Snake, fila y columna, fase, 0xCAA0, nivel, 0xD430, 0xD880 y 0xD888 (p12:63DE), las banderas de 0xD7D0 y 0xD7F0 y las 48 fichas de 0xD600 (al reves que p12:61F8)
	ld a,(0ca42h)		;6327   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	push af			;632a
	ld hl,0ca20h		;632b   ; desde 0xCA20...
	ld bc,026deh		;632e   ; ...0x26DF bytes
	call 04236h		;6331   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	pop af			;6334
	ld (0ca42h),a		;6335   ; guarda la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	ld hl,0c700h		;6338   ; 0xC700: la zona
	ld a,(hl)			;633b
	ld (0ca4ah),a		;633c   ; guarda la zona
	inc hl			;633f   ; 0xC701: la sala especial
	ld a,(hl)			;6340
	ld (0ca76h),a		;6341   ; guarda la sala especial (0 = ninguna; indice de p24:64B6)
	inc hl			;6344   ; 0xC702: la Y
	ld a,(hl)			;6345
	ld (0cb03h),a		;6346   ; guarda la Y de Snake
	inc hl			;6349   ; 0xC703: la X
	ld a,(hl)			;634a
	ld (0cb05h),a		;634b   ; guarda la X de Snake
	inc hl			;634e   ; 0xC704: la fila
	ld a,(hl)			;634f
	ld (0ca50h),a		;6350   ; guarda la fila de la sala en la zona (uno mas al salir por arriba)
	inc hl			;6353   ; 0xC705: la columna
	ld a,(hl)			;6354
	ld (0ca51h),a		;6355   ; guarda la columna de la sala en la zona (uno mas al salir por la derecha)
	inc hl			;6358   ; 0xC706: la fase
	ld a,(hl)			;6359
	ld (0ca22h),a		;635a   ; guarda la fase de la partida (indice de las listas de p06:B40C)
	inc hl			;635d   ; 0xC707: cuantos le siguen
	ld a,(hl)			;635e
	ld (0caa0h),a		;635f   ; guarda cuantos siguen a Snake por su rastro (1-4)
	inc hl			;6362   ; 0xC708: el nivel
	ld a,(hl)			;6363
	ld (0cab5h),a		;6364   ; guarda el nivel de Snake: la barra de vida llena mide 0x20 + 8 por nivel
	inc hl			;6367   ; 0xC709: 0xD430
	ld a,(hl)			;6368
	ld (0d430h),a		;6369
	ld hl,0d880h		;636c   ; los 8 de 0xD880...
	ld a,(0c70ah)		;636f   ; ...de 0xC70A
	call ocho_de_bits		;6372   ; ocho_de_bits: los 8 bytes de HL a 0xFF o 0 por los bits de A (el 7 primero) y 0xCA40 = 1
	ld hl,0d888h		;6375   ; los 8 de 0xD888...
	ld a,(0c70bh)		;6378   ; ...de 0xC70B
	call ocho_de_bits		;637b   ; ocho_de_bits: los 8 bytes de HL a 0xFF o 0 por los bits de A (el 7 primero) y 0xCA40 = 1
	ld hl,0c70ch		;637e   ; las banderas...
	ld de,0d7d0h		;6381   ; ...a 0xD7D0...
	ld bc,00015h		;6384   ; ...0x15 bytes
	ldir		;6387
	ld hl,0c721h		;6389   ; las otras...
	ld de,0d7f0h		;638c   ; ...a 0xD7F0...
	ld bc,00005h		;638f   ; ...5 bytes
	ldir		;6392
	ld hl,0c726h		;6394   ; de 0xC726...
	ld de,0d600h		;6397   ; ...a las fichas...
	ld c,006h		;639a   ; ...6 bytes
L_639C:
	ld b,008h		;639c   ; de 8 fichas
L_639E:
	xor a			;639e
	rl (hl)		;639f   ; el bit de la izquierda...
	rla			;63a1   ; ...a su primer byte
	ld (de),a			;63a2
	inc de			;63a3   ; la siguiente (4 bytes)
	inc de			;63a4
	inc de			;63a5
	inc de			;63a6
	djnz L_639E		;63a7
	inc hl			;63a9
	dec c			;63aa   ; 6
	jr nz,L_639C		;63ab
	ld hl,0c72ch		;63ad   ; las cuentas...
	ld de,0d601h		;63b0   ; ...a 0xD601...
	ld b,030h		;63b3   ; ...48
L_63B5:
	ld a,(hl)			;63b5
	ld (de),a			;63b6
	inc hl			;63b7
	inc de			;63b8
	inc de			;63b9   ; la siguiente (4 bytes)
	inc de			;63ba
	inc de			;63bb
	djnz L_63B5		;63bc
	ld hl,0c75ch		;63be   ; las partes altas...
	ld de,0d602h		;63c1   ; ...a 0xD602...
	ld b,018h		;63c4   ; ...24 bytes
dos_nibbles:
	ld a,(hl)			;63c6   ; el nibble alto a una...
	rrca			;63c7   ; el nibble alto...
	rrca			;63c8
	rrca			;63c9
	rrca			;63ca
	and 00fh		;63cb
	ld (de),a			;63cd   ; ...a la primera
	inc de			;63ce   ; la siguiente (4 bytes)
	inc de			;63cf
	inc de			;63d0
	inc de			;63d1
	ld a,(hl)			;63d2   ; ...el bajo a la siguiente
	and 00fh		;63d3   ; el bajo...
	ld (de),a			;63d5   ; ...a la segunda
	inc hl			;63d6   ; el siguiente byte
	inc de			;63d7
	inc de			;63d8
	inc de			;63d9
	inc de			;63da
	djnz dos_nibbles		;63db   ; 24
	ret			;63dd
ocho_de_bits:		; los 8 bytes de HL a 0xFF o 0 por los bits de A (el 7 primero) y 0xCA40 = 1
	ld c,a			;63de
	ld b,008h		;63df   ; 8
L_63E1:
	rl c		;63e1   ; el bit de la izquierda
	ld a,000h		;63e3
	jr nc,pon_ocho		;63e5
	ld a,0ffh		;63e7   ; a 1: 0xFF
pon_ocho:
	ld (hl),a			;63e9   ; 0 o 0xFF
	inc hl			;63ea   ; el siguiente
	djnz L_63E1		;63eb   ; 8
	ld a,001h		;63ed   ; que se redibuje
	ld (0ca40h),a		;63ef   ; 0xCA40 = 1
	ret			;63f2
menu_espera:		; los pasos 5 y 7: espera 0xC3A3 cuadros y luego a lo de las teclas de funcion
	ld hl,0c3a3h		;63f3   ; apunta a los cuadros de espera del menu de guardar tras un error
	ld a,(hl)			;63f6
	and a			;63f7
	jr z,menu_fuera_con_f		;63f8
	dec (hl)			;63fa   ; aun no
	ret			;63fb
menu_fuera_con_f:		; con F1-F5 recien pulsada: 0xC3A2 = 0 y NZ (en el estado 5 de la partida, antes p00:5DE2); sin ella, Z
	ld a,(0ca09h)		;63fc   ; lee lo recien pulsado de las teclas de funcion (bits como 0xCA0A)
	and 01fh		;63ff   ; F1-F5
	ret z			;6401   ; ninguna: Z
	ld a,(0ca00h)		;6402   ; lee el estado de la partida (p01:729F: 8 estados)
	cp 005h		;6405   ; el estado 5?
	jr nz,menu_acaba		;6407
	call 05de2h		;6409   ; p00:5DE2
menu_acaba:
	xor a			;640c
	ld (0c3a2h),a		;640d   ; guarda el paso del menu de guardar (1-9; 0 fuera, 0xFF cargada)
	or 001h		;6410   ; NZ
	ret			;6412
menu_paso_6:		; el Game Master 2 (p12:6628) y el sonido 0xFB; con error, 0xC3A3 = 0x40, el sonido 0x3F y el paso 7; sin el, cargando, la partida de vuelta; guardando, el letrero de p12:BFC2 y el paso 7
	call por_el_gm2		;6413   ; por_el_gm2: guarda o carga la partida en la SRAM del Game Master 2: sin la interrupcion de linea, H.KEYI a ret, la pila en 0xC392, la ficha de la ranura (p12:6666) y las funciones (p12:6692); H.KEYI de vuelta y R#0 = 0x16
	call 05f45h		;6416   ; sonido_fb: pide el sonido 0xFB
	ld a,(0c3a1h)		;6419   ; error?
	and a			;641c
	jr z,gm2_sin_error		;641d
	ld a,040h		;641f   ; 0x40 cuadros de espera
	ld (0c3a3h),a		;6421   ; guarda los cuadros de espera del menu de guardar tras un error
	call 05f4dh		;6424   ; sonido_3f: pide el sonido 0x3F
	jp menu_paso_siguiente		;6427   ; menu_paso_siguiente:
gm2_sin_error:
	ld a,(0c39fh)		;642a   ; lee en el menu de guardar: 0 guardar, 1 cargar
	and a			;642d
	jp nz,partida_cargada		;642e   ; partida_cargada:
	ld hl,0bfc2h		;6431   ; el letrero de p12:BFC2
	call 04918h		;6434   ; letrero_con_sitio: [fila][columna] y letras; 0xFE otra posicion, 0xFF acaba
	jp menu_paso_siguiente		;6437   ; menu_paso_siguiente:
menu_paso_8:		; la opcion 0: guardando, espera las teclas de funcion; cargando, p14:BBEC y por 0xC3A1: 0 espera, 1 la partida de vuelta, otro el paso 9
	ld a,(0c39fh)		;643a   ; lee en el menu de guardar: 0 guardar, 1 cargar
	and a			;643d
	jp z,menu_fuera_con_f		;643e   ; guardando, solo F1-F5
	call 041efh		;6441   ; bancos_14: pone el 14 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0bbech		;6444   ; letras_cada_cuadro: la opcion 0, cargando: las direcciones mueven el cursor 0xC7C4; el disparo pone 0x78; con la tecla de funcion del bit 5, la comprobacion (p14:BCD3); con una tecla (p14:BDC1), su letra en el cursor (0xFF: borra la de antes, con los signos 5-0x13 y 0x19-0x1D pasados a 0x53-0x61 y 0x62-0x66) y el cursor siguiente; se pinta
	call 041a0h		;6447   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	ld a,(0c3a1h)		;644a   ; lee el resultado del disco o del Game Master 2 (2 = error)
	and a			;644d
	jp z,menu_fuera_con_f		;644e   ; 0: espera
	dec a			;6451
	jp z,partida_cargada		;6452   ; 1: cargada
	jp menu_paso_siguiente		;6455   ; si no, el paso 9
menu_paso_9:		; con algo pulsado: 0xC7C4 y 0xC3A1 a cero, el paso 8, el recuadro grande, p14:BC7F y p14:BBA7; sin nada, las teclas de funcion
	ld a,(0ca07h)		;6458   ; lee lo recien pulsado del mando (los bits de 0xCA08 que no estaban)
	and a			;645b
	jp z,menu_fuera_con_f		;645c   ; menu_fuera_con_f: con F1-F5 recien pulsada: 0xC3A2 = 0 y NZ (en el estado 5 de la partida, antes p00:5DE2); sin ella, Z
	xor a			;645f
	ld (0c7c4h),a		;6460   ; 0xC7C4 = 0
	ld (0c3a1h),a		;6463   ; guarda el resultado del disco o del Game Master 2 (2 = error)
	ld a,008h		;6466   ; de vuelta al paso 8
	ld (0c3a2h),a		;6468   ; guarda el paso del menu de guardar (1-9; 0 fuera, 0xFF cargada)
	ld hl,00c38h		;646b   ; en (0x0C, 0x38)...
	ld bc,0a888h		;646e   ; ...0xA8 x 0x88
	call pon_recuadro		;6471   ; pon_recuadro: un recuadro en HL (X, Y) de B x C (ancho x alto): lleno del color 0x99 y con el marco de color 7
	call 041efh		;6474   ; bancos_14: pone el 14 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0bc7fh		;6477   ; pinta_letras: las letras de 0xC900 (hasta 0xFF) desde (0x12, 0x3C): de 4 en 4 con 9 (0x0D entre grupos), 16 por fila, 0x0C mas abajo
	call 0bba7h		;647a   ; rejilla_de_letras: 11 rayas de 0x9C de color 9 desde (0x12, 0x44), cada 0x0C mas abajo, y la de 8 de color 0x0A bajo la letra del cursor 0xC7C4 (p14:BBCE)
	jp 041a0h		;647d   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
por_el_disco:		; guarda o carga la partida en el disco: sin la interrupcion de linea (R#0 = 6), H.KEYI a ret, la pila en 0xC392; la RAM de 0x9600 cambiada con 0xDD00 (p12:6595), el FCB de la ranura (p12:651F), abrir o crear (p12:64C9), registro de 1 byte (p12:6502), 0x73 bytes desde 0xC700 (p12:64BB), cerrar (p12:64EF); la RAM de vuelta (p12:65C1), H.KEYI y R#0 = 0x16
	di			;6480   ; sin interrupciones
	ld bc,00600h		;6481   ; R#0 = 6: sin la interrupcion de linea
	call 00047h		;6484   ; BIOS WRTVDP - Writes data in the VDP-register
	di			;6487
	ld a,(0fd9ah)		;6488   ; guarda H.KEYI...
	ld (0c394h),a		;648b   ; guarda la copia de H.KEYI mientras se usa el disco
	ld a,0c9h		;648e   ; ...y lo deja en ret
	ld (0fd9ah),a		;6490
	ld (0c392h),sp		;6493   ; la pila para volver si hay error
	call cambia_9600_dd00		;6497   ; la RAM para el disco
	call fcb_de_la_ranura		;649a   ; el FCB
	call abre_o_crea		;649d   ; abre o crea
	call registro_de_1		;64a0   ; registro de 1 byte
	call lee_o_escribe_c700		;64a3   ; escribe o lee
	call cierra_fichero		;64a6   ; cierra
	di			;64a9
	call ram_de_vuelta		;64aa   ; la RAM de vuelta
	ld a,(0c394h)		;64ad   ; H.KEYI de vuelta
	ld (0fd9ah),a		;64b0
	ld bc,01600h		;64b3   ; R#0 = 0x16: con la interrupcion de linea
	call 00047h		;64b6   ; BIOS WRTVDP - Writes data in the VDP-register
	ei			;64b9
	ret			;64ba
lee_o_escribe_c700:		; la DTA en 0xC700 (BDOS 0x1A) y 0x73 registros de 1 byte (p12:6577)
	ld de,0c700h		;64bb   ; apunta a copia de la zona, la sala especial, la Y y la X de Snake y 0xCA50-0xCA51 (6 bytes)
	ld c,01ah		;64be   ; BDOS 0x1A: la DTA
	call 0f37dh		;64c0   ; BDOS
	ld hl,00073h		;64c3   ; 0x73 bytes
	jp lee_o_escribe		;64c6   ; lee_o_escribe: guardando, p12:6567; cargando, BDOS 0x27 (leer HL registros; error 0)
abre_o_crea:		; cargando, abre el fichero (BDOS 0x0F; error 1); guardando, lo crea (BDOS 0x16; error 5)
	ld a,(0c39fh)		;64c9   ; lee en el menu de guardar: 0 guardar, 1 cargar
	and a			;64cc
	jr z,crea_fichero		;64cd
	ld de,(0c390h)		;64cf   ; lee la ficha del disco o del Game Master 2 (0xC3B0) y el byte siguiente (16 bits)
	ld c,00fh		;64d3   ; BDOS 0x0F: abrir
	call 0f37dh		;64d5   ; BDOS
	ld c,001h		;64d8   ; el error 1...
	inc a			;64da   ; ...con 0xFF
	jp z,0ad94h		;64db   ; error_de_disco: p12:65C1 y el mensaje de error C; sale a la pila de 0xC392 con 0xC3A1 = 2
	ret			;64de
crea_fichero:
	ld de,(0c390h)		;64df   ; lee la ficha del disco o del Game Master 2 (0xC3B0) y el byte siguiente (16 bits)
	ld c,016h		;64e3   ; BDOS 0x16: crear
	call 0f37dh		;64e5   ; BDOS
	ld c,005h		;64e8   ; el error 5...
	inc a			;64ea   ; ...con 0xFF
	jp z,0ad94h		;64eb   ; error_de_disco: p12:65C1 y el mensaje de error C; sale a la pila de 0xC392 con 0xC3A1 = 2
	ret			;64ee
cierra_fichero:		; cierra el fichero (BDOS 0x10; error 2)
	ld de,(0c390h)		;64ef   ; lee la ficha del disco o del Game Master 2 (0xC3B0) y el byte siguiente (16 bits)
	ld c,010h		;64f3   ; BDOS 0x10: cerrar
	call 0f37dh		;64f5   ; BDOS
	ld c,002h		;64f8   ; el error 2...
	inc a			;64fa   ; ...con 0xFF
	jp z,0ad94h		;64fb   ; error_de_disco: p12:65C1 y el mensaje de error C; sale a la pila de 0xC392 con 0xC3A1 = 2
	ret			;64fe

; ----------------------------------------------------------------------
; DATOS sin identificar  0x64ff..0x6502  (3 bytes)
DATA_64FF:
	defb 022h,090h,0c3h	; 64ff

; ======================================================================
; CODIGO 0x6502..0x6546  (68 bytes)
; ======================================================================


registro_de_1:		; en el FCB: el bloque (+0x0C) a 0, el tamano de registro (+0x0E) a 1 y el registro (+0x21) a 0
	ld hl,(0c390h)		;6502   ; lee la ficha del disco o del Game Master 2 (0xC3B0) y el byte siguiente (16 bits)
	ld bc,0000ch		;6505   ; +0x0C
	add hl,bc			;6508
	ld (hl),b			;6509   ; el bloque a 0
	inc hl			;650a
	ld (hl),b			;650b
	inc hl			;650c
	ld bc,00001h		;650d   ; 1 byte
	ld (hl),c			;6510   ; el tamano a 1
	inc hl			;6511
	ld (hl),b			;6512
	ld bc,00011h		;6513   ; +0x21
	add hl,bc			;6516
	ld b,005h		;6517   ; 5 bytes
	xor a			;6519
L_651A:
	ld (hl),a			;651a
	inc hl			;651b
	djnz L_651A		;651c
	ret			;651e
fcb_de_la_ranura:		; el FCB en 0xC3B0 (en 0xC390): la unidad 0, el nombre de la ranura de p12:6546 (SNAKE1-3.MG2) y 0x19 ceros
	ld a,(0c3a0h)		;651f   ; lee la ranura del menu de guardar (0-2: SNAKE1-3)
	ld b,a			;6522
	add a,a			;6523   ; * 11
	ld c,a			;6524
	add a,a			;6525
	add a,a			;6526
	add a,b			;6527
	add a,c			;6528
	ld hl,06546h		;6529   ; los nombres
	call 0423eh		;652c   ; suma_a_hl: HL = HL + A
	ld de,0c3b0h		;652f   ; apunta a el FCB del disco (o la ficha del Game Master 2)
	ld (0c390h),de		;6532   ; guarda la ficha del disco o del Game Master 2 (0xC3B0) y el byte siguiente (16 bits)
	xor a			;6536   ; la unidad por defecto
	ld (de),a			;6537
	inc de			;6538
	ld bc,0000bh		;6539   ; 11 letras
	ldir		;653c
	xor a			;653e
	ld b,019h		;653f   ; 0x19 ceros
L_6541:
	ld (de),a			;6541
	inc de			;6542
	djnz L_6541		;6543
	ret			;6545

; ----------------------------------------------------------------------
; DATOS resto_6546: lo apuntan con el banco puesto p12:6529 (0x6546); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p12:6529 (33 bytes)
;   0x6546..0x6567  (33 bytes)
DATA_resto_6546:
	defb 053h,04eh,041h,04bh,045h,031h,020h,020h,04dh,047h,032h,053h,04eh,041h,04bh,045h	; 6546  SNAKE1  MG2SNAKE
	defb 032h,020h,020h,04dh,047h,032h,053h,04eh,041h,04bh,045h,033h,020h,020h,04dh,047h	; 6556  2  MG2SNAKE3  MG
	defb 032h	; 6566

; ======================================================================
; CODIGO 0x6567..0x65d0  (105 bytes)
; ======================================================================


escribe_bloque:		; BDOS 0x26 (escribir HL registros); error 4
	ld de,(0c390h)		;6567   ; lee la ficha del disco o del Game Master 2 (0xC3B0) y el byte siguiente (16 bits)
	ld c,026h		;656b   ; BDOS 0x26: escribir
	call 0f37dh		;656d   ; BDOS
	ld c,004h		;6570   ; el error 4...
	or a			;6572   ; ...si no es 0
	jp nz,0ad94h		;6573   ; error_de_disco: p12:65C1 y el mensaje de error C; sale a la pila de 0xC392 con 0xC3A1 = 2
	ret			;6576
lee_o_escribe:		; guardando, p12:6567; cargando, BDOS 0x27 (leer HL registros; error 0)
	ld a,(0c39fh)		;6577   ; lee en el menu de guardar: 0 guardar, 1 cargar
	and a			;657a
	jr z,escribe_bloque		;657b
	ld de,(0c390h)		;657d   ; lee la ficha del disco o del Game Master 2 (0xC3B0) y el byte siguiente (16 bits)
	ld c,027h		;6581   ; BDOS 0x27: leer
	call 0f37dh		;6583   ; BDOS
	ld c,000h		;6586   ; el error 0...
	or a			;6588   ; ...si no es 0
	jp nz,0ad94h		;6589   ; error_de_disco: p12:65C1 y el mensaje de error C; sale a la pila de 0xC392 con 0xC3A1 = 2
	ret			;658c
ram_en_8000:		; la RAM de 0xC386 en la pagina 2 (ENASLT)
	ld a,(0c386h)		;658d   ; lee el slot de la RAM de 0x8000 (p01:7243)
	ld h,080h		;6590
	jp 00024h		;6592   ; BIOS ENASLT - Switches to specified slot and page definitively
cambia_9600_dd00:		; con la RAM en la pagina 2, cambia 0x1680 bytes de 0x9600 con los de 0xDD00; 0xF1C0 = 0, DISKVE (0xF323) = 0xAD5A y los slots primarios del arranque (0xC388)
	call ram_en_8000		;6595   ; ram_en_8000: la RAM de 0xC386 en la pagina 2 (ENASLT)
	ld hl,09600h		;6598   ; 0x9600...
	ld de,0dd00h		;659b   ; ...con 0xDD00...
	ld bc,01680h		;659e   ; ...0x1680 bytes
L_65A1:
	push bc			;65a1
	ld b,(hl)			;65a2   ; el de 0x9600...
	ld a,(de)			;65a3   ; ...y el de 0xDD00...
	ld (hl),a			;65a4   ; ...se cambian
	ld a,b			;65a5
	ld (de),a			;65a6
	inc hl			;65a7
	inc de			;65a8
	pop bc			;65a9
	dec bc			;65aa   ; uno menos
	ld a,b			;65ab
	or c			;65ac
	jr nz,L_65A1		;65ad
	ld hl,00000h		;65af   ; 0xF1C0 = 0
	ld (0f1c0h),hl		;65b2
	ld hl,0ad5ah		;65b5   ; los errores del disco...
	ld (0f323h),hl		;65b8   ; ...a p06:AD5A
	ld a,(0c388h)		;65bb   ; lee el registro de slots primarios del arranque
	jp 0013bh		;65be   ; BIOS WSLREG - Writes value to the primary slot register
ram_de_vuelta:		; deja correr el H.TIMI de la BIOS (p12:65C6) y cambia otra vez 0x9600 con 0xDD00
	call htimi_256		;65c1   ; htimi_256: 256 veces el H.TIMI que habia al arrancar (copiado en 0xC39A)
	jr cambia_9600_dd00		;65c4
htimi_256:		; 256 veces el H.TIMI que habia al arrancar (copiado en 0xC39A)
	ld b,000h		;65c6   ; 256 veces
L_65C8:
	push bc			;65c8
	call 0c39ah		;65c9   ; la copia del gancho H.TIMI del arranque (5 bytes)
	pop bc			;65cc
	djnz L_65C8		;65cd
	ret			;65cf

; ----------------------------------------------------------------------
; DATOS sin identificar  0x65d0..0x6628  (88 bytes)
DATA_65D0:
	defb 001h,000h,003h,0c5h,0cdh,016h,066h,0c1h,0c5h,079h,087h,087h,087h,080h,021h,046h	; 65d0  ......f..y....!F
	defb 065h,0cdh,03eh,042h,011h,0b1h,0c3h,001h,00bh,000h,0edh,0b0h,011h,0d5h,0c3h,00eh	; 65e0  e.>B............
	defb 01ah,0cdh,07dh,0f3h,011h,0b0h,0c3h,00eh,011h,0cdh,07dh,0f3h,0c1h,03ch,028h,012h	; 65f0  ..}.......}..<(.
	defb 079h,016h,001h,0a7h,028h,006h,014h,03dh,028h,002h,016h,004h,021h,095h,0c3h,07eh	; 6600  y...(..=(...!..~
	defb 0b2h,077h,00ch,010h,0beh,0c9h,021h,0d5h,0c3h,001h,024h,000h,0cdh,036h,042h,021h	; 6610  .w....!...$..6B!
	defb 0b0h,0c3h,001h,024h,000h,0c3h,036h,042h	; 6620  ...$..6B

; ======================================================================
; CODIGO 0x6628..0x6653  (43 bytes)
; ======================================================================


por_el_gm2:		; guarda o carga la partida en la SRAM del Game Master 2: sin la interrupcion de linea, H.KEYI a ret, la pila en 0xC392, la ficha de la ranura (p12:6666) y las funciones (p12:6692); H.KEYI de vuelta y R#0 = 0x16
	di			;6628
	ld bc,00600h		;6629   ; R#0 = 6
	call 00047h		;662c   ; BIOS WRTVDP - Writes data in the VDP-register
	di			;662f
	ld a,(0fd9ah)		;6630   ; guarda H.KEYI...
	ld (0c394h),a		;6633   ; guarda la copia de H.KEYI mientras se usa el disco
	ld a,0c9h		;6636   ; ...y lo deja en ret
	ld (0fd9ah),a		;6638
	ld (0c392h),sp		;663b   ; la pila para volver si hay error
	call ficha_gm2		;663f   ; la ficha
	call funciones_gm2		;6642   ; las funciones
	ld a,(0c394h)		;6645   ; H.KEYI de vuelta
	ld (0fd9ah),a		;6648
	ld bc,01600h		;664b   ; R#0 = 0x16
	call 00047h		;664e   ; BIOS WRTVDP - Writes data in the VDP-register
	ei			;6651
	ret			;6652

; ----------------------------------------------------------------------
; DATOS resto_6653: lo apuntan con el banco puesto p12:66AA (0x6653), p12:666D
;   (0x6657); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p12:66AA, p12:666D (19 bytes)
;   0x6653..0x6666  (19 bytes)
DATA_resto_6653:
	defb 000h,0c7h,073h,000h,053h,04eh,041h,04bh,031h,053h,04eh,041h,04bh,032h,053h,04eh	; 6653  ..s.SNAK1SNAK2SN
	defb 041h,04bh,033h	; 6663

; ======================================================================
; CODIGO 0x6666..0x672a  (196 bytes)
; ======================================================================


ficha_gm2:		; la ficha en 0xC3B0 (en 0xC390): el nombre de la ranura de p12:6657 (SNAK1-3), 8 ceros, y en 0xC3C1 el slot del cartucho
	ld a,(0c3a0h)		;6666   ; lee la ranura del menu de guardar (0-2: SNAKE1-3)
	ld b,a			;6669
	add a,a			;666a   ; * 5
	add a,a			;666b
	add a,b			;666c
	ld hl,06657h		;666d   ; los nombres
	call 0423eh		;6670   ; suma_a_hl: HL = HL + A
	ld de,0c3b0h		;6673   ; apunta a el FCB del disco (o la ficha del Game Master 2)
	ld (0c390h),de		;6676   ; guarda la ficha del disco o del Game Master 2 (0xC3B0) y el byte siguiente (16 bits)
	ld bc,00005h		;667a   ; 5 letras
	ldir		;667d
	ld de,0c3b5h		;667f   ; 0xC3B5
	xor a			;6682
	ld b,008h		;6683   ; 8 ceros
L_6685:
	ld (de),a			;6685
	inc de			;6686
	djnz L_6685		;6687
	inc de			;6689
	inc de			;668a
	inc de			;668b
	inc de			;668c
	ld a,(0c399h)		;668d   ; el slot del cartucho...
	ld (de),a			;6690   ; ...en 0xC3C1
	ret			;6691
funciones_gm2:		; guardando, la funcion 0; luego la 2, la direccion y el largo de p12:6653 (0xC700, 0x73 bytes) en 0xC3BD, la 9 (guardar) o la 8 (cargar) y la 1; 0xC3A1 = 0
	ld a,(0c39fh)		;6692   ; lee en el menu de guardar: 0 guardar, 1 cargar
	and a			;6695   ; cargando, sin la 0
	jr nz,gm2_funcion_2		;6696
	ld de,(0c390h)		;6698   ; lee la ficha del disco o del Game Master 2 (0xC3B0) y el byte siguiente (16 bits)
	ld c,000h		;669c   ; la funcion 0
	call llama_al_gm2		;669e   ; llama_al_gm2: la funcion C del Game Master 2: su slot en la pagina 2, 0x8000 = 4, call 0x8000 con DE = la ficha; luego el cartucho otra vez en la pagina 2
gm2_funcion_2:
	ld de,(0c390h)		;66a1   ; lee la ficha del disco o del Game Master 2 (0xC3B0) y el byte siguiente (16 bits)
	ld c,002h		;66a5   ; la funcion 2
	call gm2_o_error		;66a7   ; gm2_o_error: la funcion C; si devuelve A, la 6 y el mensaje: 1 FILE ALREADY EXIST (p12:674B), 0xF6-0xFF de p12:672A, debajo SRAM ERROR (p12:673E); H.KEYI de vuelta, 0xC3A1 = 2 y vuelta a la pila de 0xC392
	ld hl,06653h		;66aa   ; 0xC700 y 0x73...
	ld de,0c3bdh		;66ad   ; ...en 0xC3BD
	ld bc,00004h		;66b0   ; 4 bytes
	ldir		;66b3
	ld a,(0c39fh)		;66b5   ; lee en el menu de guardar: 0 guardar, 1 cargar
	and a			;66b8
	ld c,009h		;66b9   ; guardando, la 9
	jr z,gm2_funcion_8_9		;66bb
	ld c,008h		;66bd   ; cargando, la 8
gm2_funcion_8_9:
	ld de,(0c390h)		;66bf   ; lee la ficha del disco o del Game Master 2 (0xC3B0) y el byte siguiente (16 bits)
	call gm2_o_error		;66c3   ; gm2_o_error: la funcion C; si devuelve A, la 6 y el mensaje: 1 FILE ALREADY EXIST (p12:674B), 0xF6-0xFF de p12:672A, debajo SRAM ERROR (p12:673E); H.KEYI de vuelta, 0xC3A1 = 2 y vuelta a la pila de 0xC392
	ld de,(0c390h)		;66c6   ; lee la ficha del disco o del Game Master 2 (0xC3B0) y el byte siguiente (16 bits)
	ld c,001h		;66ca   ; la funcion 1
	call gm2_o_error		;66cc   ; gm2_o_error: la funcion C; si devuelve A, la 6 y el mensaje: 1 FILE ALREADY EXIST (p12:674B), 0xF6-0xFF de p12:672A, debajo SRAM ERROR (p12:673E); H.KEYI de vuelta, 0xC3A1 = 2 y vuelta a la pila de 0xC392
	xor a			;66cf   ; sin error
	ld (0c3a1h),a		;66d0   ; guarda el resultado del disco o del Game Master 2 (2 = error)
	ret			;66d3
llama_al_gm2:		; la funcion C del Game Master 2: su slot en la pagina 2, 0x8000 = 4, call 0x8000 con DE = la ficha; luego el cartucho otra vez en la pagina 2
	push bc			;66d4
	ld a,(0c38ah)		;66d5   ; lee el slot del Game Master 2 (0xFF: no hay)
	ld h,080h		;66d8
	call 00024h		;66da   ; BIOS ENASLT - Switches to specified slot and page definitively
	ld a,004h		;66dd   ; 0x8000 = 4
	ld (08000h),a		;66df   ; la funcion 4 a 0x8000
	pop bc			;66e2
	ld de,(0c390h)		;66e3   ; la ficha
	call 08000h		;66e7   ; p02:8000
	push af			;66ea
	ld a,(0c399h)		;66eb   ; el cartucho...
	ld h,080h		;66ee
	call 00024h		;66f0   ; BIOS ENASLT - Switches to specified slot and page definitively | ...de vuelta
	pop af			;66f3
	ret			;66f4
gm2_o_error:		; la funcion C; si devuelve A, la 6 y el mensaje: 1 FILE ALREADY EXIST (p12:674B), 0xF6-0xFF de p12:672A, debajo SRAM ERROR (p12:673E); H.KEYI de vuelta, 0xC3A1 = 2 y vuelta a la pila de 0xC392
	call llama_al_gm2		;66f5   ; llama_al_gm2: la funcion C del Game Master 2: su slot en la pagina 2, 0x8000 = 4, call 0x8000 con DE = la ficha; luego el cartucho otra vez en la pagina 2
	and a			;66f8
	ret z			;66f9   ; sin error, nada
	push af			;66fa
	ld c,006h		;66fb   ; la funcion 6
	call llama_al_gm2		;66fd   ; llama_al_gm2: la funcion C del Game Master 2: su slot en la pagina 2, 0x8000 = 4, call 0x8000 con DE = la ficha; luego el cartucho otra vez en la pagina 2
	pop af			;6700
	cp 001h		;6701   ; 1?
	ld hl,0674bh		;6703   ; FILE ALREADY EXIST
	jr z,mensaje_gm2		;6706
	sub 0f6h		;6708   ; 0xF6-0xFF...
	ld hl,0672ah		;670a   ; ...de la tabla de p12:672A
	call 043f6h		;670d   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
mensaje_gm2:
	call 04918h		;6710   ; letrero_con_sitio: [fila][columna] y letras; 0xFE otra posicion, 0xFF acaba
	ld hl,0673eh		;6713   ; SRAM ERROR
	call 04918h		;6716   ; letrero_con_sitio: [fila][columna] y letras; 0xFE otra posicion, 0xFF acaba
	ld a,(0c394h)		;6719   ; H.KEYI de vuelta
	ld (0fd9ah),a		;671c
	ld a,002h		;671f   ; error
	ld (0c3a1h),a		;6721   ; guarda el resultado del disco o del Game Master 2 (2 = error)
	ld sp,(0c392h)		;6724   ; vuelve a la pila de antes
	ei			;6728
	ret			;6729

; ----------------------------------------------------------------------
; DATOS resto_672A: lo apuntan con el banco puesto p12:670A (0x672A), p12:6713
;   (0x673E), p12:6703 (0x674B); el tamano es lo que hay hasta lo siguiente,
;   no sale de recorrerlo; lo leen p12:670A, p12:6713, p12:6703 (183 bytes)
;   0x672a..0x67e1  (183 bytes)
DATA_resto_672A:
	defb 060h,067h,002h,0aeh,070h,067h,080h,067h,08ch,067h,099h,067h,0a7h,067h,0b5h,067h	; 672a  `g..pg.g.g.g.g.g
	defb 0c7h,067h,0d2h,067h,040h,08ch,01dh,01ch,00bh,017h,000h,00fh,01ch,01ch,019h,01ch	; 673a  .g.g@...........
	defb 0ffh,020h,09ch,010h,013h,016h,00fh,000h,00bh,016h,01ch,00fh,00bh,00eh,023h,000h	; 674a  . ............#.
	defb 00fh,022h,013h,01dh,01eh,0ffh,038h,09ch,00ch,00bh,00eh,000h,010h,013h,016h,00fh	; 675a  ."....8.........
	defb 000h,018h,00bh,017h,00fh,0ffh,038h,09ch,010h,013h,016h,00fh,000h,018h,019h,01eh	; 676a  ......8.........
	defb 000h,019h,01ah,00fh,018h,0ffh,048h,09ch,01dh,01ch,00bh,017h,000h,010h,01fh,016h	; 677a  ......H.........
	defb 016h,0ffh,040h,09ch,01ch,00fh,00bh,00eh,000h,00fh,01ch,01ch,019h,01ch,0ffh,040h	; 678a  ..@............@
	defb 09ch,021h,01ch,013h,01eh,00fh,000h,00fh,01ch,01ch,019h,01ch,0ffh,040h,09ch,019h	; 679a  .!...........@..
	defb 01fh,01eh,000h,019h,010h,000h,00eh,00bh,01eh,00bh,0ffh,030h,09ch,010h,016h,016h	; 67aa  ...........0....
	defb 00fh,000h,00dh,016h,019h,01dh,00fh,000h,010h,00bh,013h,016h,0ffh,048h,09ch,01fh	; 67ba  .............H..
	defb 018h,010h,019h,01ch,017h,00bh,01eh,0ffh,038h,09ch,01dh,023h,01dh,01eh,00fh,017h	; 67ca  ........8..#....
	defb 000h,00fh,01ch,01ch,019h,01ch,0ffh	; 67da

; ======================================================================
; CODIGO 0x67e1..0x69b8  (471 bytes)
; ======================================================================


fichas_cd00_56:		; con el banco 56 en 0xA000: p12:67F0 y el banco de antes
	ld a,(0c383h)		;67e1   ; lee la copia del banco de 0xA000
	push af			;67e4
	call 0418eh		;67e5   ; bancos_56: pone el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	call fichas_cd00		;67e8   ; fichas_cd00: 0xCC80-0xCDFF a cero; fuera de las salas especiales, las fichas de la zona de las listas del banco 56 (p12:683D): la 7 p56:BE9D (3, 7) y p56:BEBC (4, 7); la 0x12 sin 0xD888 = 0xFF, p56:BEE7 (2, 8); la 0x0A p56:BEC5 (1, 6) y p56:BEDA (1, 7) en 0xCD50
	pop af			;67eb
	push af			;67ec
	jp 041a3h		;67ed
fichas_cd00:		; 0xCC80-0xCDFF a cero; fuera de las salas especiales, las fichas de la zona de las listas del banco 56 (p12:683D): la 7 p56:BE9D (3, 7) y p56:BEBC (4, 7); la 0x12 sin 0xD888 = 0xFF, p56:BEE7 (2, 8); la 0x0A p56:BEC5 (1, 6) y p56:BEDA (1, 7) en 0xCD50
	ld hl,0cc80h		;67f0   ; apunta a 16 fichas de 8 bytes del arma 8 [sitio][paso][Y][X][fila][columna] (p11:B574)
	ld bc,0017fh		;67f3   ; 0x180 bytes
	call 04236h		;67f6   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	ld a,(0ca76h)		;67f9   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	and a			;67fc   ; en una especial, nada
	ret nz			;67fd
	ld a,(0ca4ah)		;67fe   ; lee la zona
	cp 007h		;6801   ; la zona 7
	jr nz,L_6816		;6803
	ld bc,00307h		;6805   ; 3, 7...
	ld hl,0be9dh		;6808   ; ...p56:BE9D
	call fichas_desde_cd00		;680b   ; fichas_desde_cd00: desde 0xCD00: por cada pareja de HL (hasta 0xFF), una ficha de 8 bytes [1][-][los dos][B][C][-][-][-]
	ld bc,00407h		;680e   ; 4, 7...
	ld hl,0bebch		;6811   ; ...p56:BEBC
	jr fichas_desde_cd00		;6814
L_6816:
	cp 012h		;6816   ; la zona 0x12...
	ld bc,00208h		;6818   ; 2, 8...
	ld hl,0bee7h		;681b   ; ...p56:BEE7
	jr nz,fichas_zona_0a		;681e
	ld a,(0d888h)		;6820   ; ...con 0xD888 = 0xFF, nada
	inc a			;6823
	jr nz,fichas_desde_cd00		;6824
fichas_zona_0a:		; la zona 0x0A
	cp 00ah		;6826
	ret nz			;6828
	ld bc,00106h		;6829   ; 1, 6...
	ld hl,0bec5h		;682c   ; ...p56:BEC5
	call fichas_desde_cd00		;682f   ; fichas_desde_cd00: desde 0xCD00: por cada pareja de HL (hasta 0xFF), una ficha de 8 bytes [1][-][los dos][B][C][-][-][-]
	ld bc,00107h		;6832   ; 1, 7...
	ld hl,0bedah		;6835   ; ...p56:BEDA
	ld de,0cd50h		;6838   ; la segunda en 0xCD50
	jr ficha_cd00		;683b
fichas_desde_cd00:		; desde 0xCD00: por cada pareja de HL (hasta 0xFF), una ficha de 8 bytes [1][-][los dos][B][C][-][-][-]
	ld de,0cd00h		;683d   ; desde 0xCD00
ficha_cd00:
	ld a,(hl)			;6840
	inc a			;6841   ; 0xFF: se acaba
	ret z			;6842
	ld a,001h		;6843   ; activa
	ld (de),a			;6845
	inc de			;6846
	inc de			;6847
	push bc			;6848
	ldi		;6849   ; los dos de la lista
	ldi		;684b
	pop bc			;684d
	ld a,b			;684e   ; B...
	ld (de),a			;684f
	inc de			;6850
	ld a,c			;6851   ; ...y C
	ld (de),a			;6852
	ld a,003h		;6853   ; la siguiente (8 bytes)
	call 04243h		;6855   ; suma_a_de: DE = DE + A
	jr ficha_cd00		;6858
vuelven_los_actores:		; sin la alerta: p12:685F
	ld a,(0ca5fh)		;685a   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	and a			;685d
	ret nz			;685e
rellena_actores:		; salvo en el estado 0x11 de Snake o en las zonas 8 y 0x0F: de las 0xD424 primeras fichas de 0xCE00, las libres se rellenan con su fila de p56:B086 (p12:688C) si su sala esta lejos
	ld a,(0cb00h)		;685f   ; lee el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	cp 011h		;6862   ; el estado 0x11, nada
	ret z			;6864
	ld a,(0ca4ah)		;6865   ; lee la zona
	cp 008h		;6868   ; la zona 8...
	ret z			;686a
	cp 00fh		;686b
	ret z			;686d   ; ...o la 0x0F, nada
	ld a,(0d424h)		;686e   ; cuantas
	and a			;6871
	ret z			;6872
	ld b,a			;6873
	ld ix,0ce00h		;6874   ; apunta a los actores: 24 fichas de 0x40 bytes (p04:800D)
	ld c,000h		;6878   ; la ficha 0
rellena_actor:
	push bc			;687a
	ld a,(ix+000h)		;687b   ; lee el tipo del actor (0 = libre)
	and a			;687e   ; libre?
	call z,rellena_libre		;687f   ; rellena_libre: la ficha a cero; la fila C (5 bytes) de la lista de la zona de p56:B086: con su sala lejos de la de Snake (p12:68B4), el actor (p12:6948)
	ld de,00040h		;6882   ; la siguiente (0x40 bytes)
	add ix,de		;6885
	pop bc			;6887
	inc c			;6888   ; el numero siguiente
	djnz rellena_actor		;6889
	ret			;688b
rellena_libre:		; la ficha a cero; la fila C (5 bytes) de la lista de la zona de p56:B086: con su sala lejos de la de Snake (p12:68B4), el actor (p12:6948)
	push bc			;688c
	push ix		;688d
	pop hl			;688f
	ld bc,0003fh		;6890   ; 0x40 bytes
	call 04236h		;6893   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	pop bc			;6896
	ld a,(0ca4ah)		;6897   ; lee la zona
	ld hl,0b086h		;689a   ; las listas de p56:B086
	call 043f6h		;689d   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld a,c			;68a0
	add a,a			;68a1
	add a,a			;68a2
	add a,c			;68a3   ; * 5
	call 0423eh		;68a4   ; suma_a_hl: HL = HL + A
	push hl			;68a7
	inc hl			;68a8   ; el byte 3: su sala
	inc hl			;68a9
	inc hl			;68aa
	ld b,(hl)			;68ab   ; la sala del actor
	call sala_cerca		;68ac   ; sala_cerca: Z si la sala B (nibbles fila, columna) esta a uno o menos de la de Snake en fila y columna; en la zona 0x0C o en una especial, solo si es la misma
	pop hl			;68af
	ret z			;68b0   ; cerca: nada
	jp actor_de_fila		;68b1   ; actor_de_fila: el actor de IX desde la fila de HL: los bytes 1 y 0x1F a 0, el tipo (byte 0; el 8 por p12:6930; con 0x0C, el dibujo 6 o 2 en la zona 0x12), la Y, la X, su sala (0: la de Snake), los bits 0-5 del byte 4 a 0x11 y los 6-7 a 0x19, y el byte 0x10 por el tipo: 3 hasta 0x0F, 1 hasta 0x12, 0xFF desde 0x13
sala_cerca:		; Z si la sala B (nibbles fila, columna) esta a uno o menos de la de Snake en fila y columna; en la zona 0x0C o en una especial, solo si es la misma
	ld hl,(0ca50h)		;68b4   ; lee la fila de la sala en la zona (uno mas al salir por arriba) y el byte siguiente (16 bits)
	ld a,b			;68b7
	call 08e75h		;68b8   ; nibbles: E = el nibble alto de A, D = el bajo
	ex de,hl			;68bb
	ld a,(0ca4ah)		;68bc   ; lee la zona
	cp 00ch		;68bf   ; la zona 0x0C...
	jr z,misma_sala		;68c1
	ld a,(0ca76h)		;68c3   ; ...o una especial
	and a			;68c6
	jr z,sala_vecina		;68c7
misma_sala:
	ld a,h			;68c9   ; la fila...
	cp d			;68ca
	ret nz			;68cb
	ld a,l			;68cc   ; ...y la columna
	cp e			;68cd
	ret			;68ce   ; Z si las dos
sala_vecina:
	ld a,h			;68cf
	sub d			;68d0
	inc a			;68d1
	cp 003h		;68d2   ; la fila a uno o menos...
	jr nc,sala_lejos		;68d4
	ld a,l			;68d6
	sub e			;68d7
	inc a			;68d8
	cp 003h		;68d9   ; ...y la columna
	jr nc,sala_lejos		;68db
	xor a			;68dd   ; Z: cerca
	ret			;68de
sala_lejos:		; NZ: lejos
	ld a,001h		;68df
	and a			;68e1
	ret			;68e2
actores_de_la_zona:		; en la zona 8 con 2 o mas siguiendo a Snake, nada; si no, los 24 actores a cero y uno por fila de la lista de la zona de p56:B086 (hasta 0xFF), 0xD424 = cuantos, con el bit 7 del tipo si hay alerta; luego p12:69BD y, con 0xD430 = 1, la ficha 0xD300 de p12:69B8
	ld a,(0ca4ah)		;68e3   ; lee la zona
	cp 008h		;68e6   ; la zona 8...
	jr nz,todos_los_actores		;68e8
	ld a,(0caa0h)		;68ea   ; ...con 2 o mas
	cp 002h		;68ed
	ret nc			;68ef
todos_los_actores:
	ld hl,0ce00h		;68f0   ; apunta a los actores: 24 fichas de 0x40 bytes (p04:800D)
	ld bc,005ffh		;68f3   ; 0x600 bytes
	call 04236h		;68f6   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	xor a			;68f9
	ld (0d424h),a		;68fa   ; ninguno
	ld a,(0ca4ah)		;68fd   ; lee la zona
	ld hl,0b086h		;6900   ; las listas de p56:B086
	call 043f6h		;6903   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld ix,0ce00h		;6906   ; apunta a los actores: 24 fichas de 0x40 bytes (p04:800D)
actor_de_la_lista:
	ld a,(hl)			;690a
	inc a			;690b   ; 0xFF: se acaba
	jp z,actores_acabados		;690c   ; actores_acabados:
	call actor_de_fila		;690f   ; actor_de_fila: el actor de IX desde la fila de HL: los bytes 1 y 0x1F a 0, el tipo (byte 0; el 8 por p12:6930; con 0x0C, el dibujo 6 o 2 en la zona 0x12), la Y, la X, su sala (0: la de Snake), los bits 0-5 del byte 4 a 0x11 y los 6-7 a 0x19, y el byte 0x10 por el tipo: 3 hasta 0x0F, 1 hasta 0x12, 0xFF desde 0x13
	inc hl			;6912   ; la fila siguiente
	ex de,hl			;6913
	ld hl,0d424h		;6914   ; apunta a cuantas fichas de 0xCE00 llenan las listas de p56:B086
	inc (hl)			;6917   ; uno mas
	ex de,hl			;6918
	ld a,(0ca5fh)		;6919   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	and a			;691c
	jr z,siguiente_actor_lista		;691d   ; sin alerta, asi
	ld a,(ix+000h)		;691f
	and a			;6922   ; libre, asi
	jr z,siguiente_actor_lista		;6923
	set 7,(ix+000h)		;6925   ; con alerta, el bit 7
siguiente_actor_lista:
	ld bc,00040h		;6929
	add ix,bc		;692c
	jr actor_de_la_lista		;692e
tipo_8_fuera:		; un actor de tipo 8 se quita (tipo 0) salvo con el bit 4 de 0xD7D4 y sin el 0 de 0xD7DA
	ld a,(ix+000h)		;6930   ; su tipo
	cp 008h		;6933   ; el 8?
	ret nz			;6935
	ld a,(0d7d4h)		;6936   ; sin el bit 4, fuera
	and 010h		;6939   ; el bit 4 de 0xD7D4
	jr z,actor_fuera		;693b
	ld a,(0d7dah)		;693d   ; con el 0 de 0xD7DA, fuera
	and 001h		;6940   ; el bit 0 de 0xD7DA
	ret z			;6942
actor_fuera:
	ld (ix+000h),000h		;6943   ; fuera
	ret			;6947
actor_de_fila:		; el actor de IX desde la fila de HL: los bytes 1 y 0x1F a 0, el tipo (byte 0; el 8 por p12:6930; con 0x0C, el dibujo 6 o 2 en la zona 0x12), la Y, la X, su sala (0: la de Snake), los bits 0-5 del byte 4 a 0x11 y los 6-7 a 0x19, y el byte 0x10 por el tipo: 3 hasta 0x0F, 1 hasta 0x12, 0xFF desde 0x13
	xor a			;6948
	ld (ix+001h),a		;6949   ; el paso a 0
	ld (ix+01fh),a		;694c   ; el byte 0x1F a 0
	ld a,(hl)			;694f
	ld c,a			;6950
	ld (ix+000h),a		;6951   ; el tipo
	call tipo_8_fuera		;6954   ; tipo_8_fuera: un actor de tipo 8 se quita (tipo 0) salvo con el bit 4 de 0xD7D4 y sin el 0 de 0xD7DA
	ld a,c			;6957
	cp 00ch		;6958   ; el 0x0C...
	jr nz,fila_del_actor		;695a
	ld a,(0ca4ah)		;695c   ; ...en la zona 0x12...
	cp 012h		;695f   ; la zona 0x12?
	ld a,006h		;6961   ; ...el dibujo 6...
	jr nz,L_6967		;6963
	ld a,002h		;6965   ; ...o el 2
L_6967:
	ld (ix+00dh),a		;6967   ; el dibujo
fila_del_actor:
	inc hl			;696a
	ld a,(hl)			;696b
	ld (ix+003h),a		;696c   ; la Y
	inc hl			;696f
	ld a,(hl)			;6970
	ld (ix+005h),a		;6971   ; la X
	inc hl			;6974
	ld a,(hl)			;6975
	and a			;6976   ; su sala (0: la de Snake)
	ld de,(0ca50h)		;6977   ; lee la fila de la sala en la zona (uno mas al salir por arriba) y el byte siguiente (16 bits)
	call nz,08e75h		;697b   ; nibbles: E = el nibble alto de A, D = el bajo
	ld (ix+00ah),e		;697e   ; la fila de la sala...
	ld (ix+00bh),d		;6981   ; ...y la columna
	inc hl			;6984
	ld a,(hl)			;6985
	and 03fh		;6986   ; los bits 0-5...
	ld (ix+011h),a		;6988   ; ...al byte 0x11
	ld a,(hl)			;698b   ; los bits 6-7...
	rlca			;698c
	rlca			;698d
	and 003h		;698e
	ld (ix+019h),a		;6990   ; ...al byte 0x19
	ld a,c			;6993
	ld c,003h		;6994
	cp 010h		;6996   ; hasta 0x0F, 3
	jr c,pon_byte_10		;6998
	ld c,001h		;699a   ; hasta 0x12, 1
	cp 013h		;699c
	jr c,pon_byte_10		;699e
	ld c,0ffh		;69a0   ; desde 0x13, 0xFF
pon_byte_10:
	ld (ix+010h),c		;69a2   ; el byte 0x10
	ret			;69a5
actores_acabados:
	call empiezan_15_b8		;69a6   ; empiezan_15_b8: p08:AD58 con el banco 8 en 0xA000 y el banco de antes
	ld a,(0d430h)		;69a9   ; 0xD430 = 1?
	dec a			;69ac
	ret nz			;69ad
	ld ix,0d300h		;69ae   ; la ficha 0xD300...
	ld hl,069b8h		;69b2   ; ...de p12:69B8
	jp actor_de_fila		;69b5   ; actor_de_fila: el actor de IX desde la fila de HL: los bytes 1 y 0x1F a 0, el tipo (byte 0; el 8 por p12:6930; con 0x0C, el dibujo 6 o 2 en la zona 0x12), la Y, la X, su sala (0: la de Snake), los bits 0-5 del byte 4 a 0x11 y los 6-7 a 0x19, y el byte 0x10 por el tipo: 3 hasta 0x0F, 1 hasta 0x12, 0xFF desde 0x13

; ----------------------------------------------------------------------
; DATOS resto_69B8: lo apuntan con el banco puesto p12:69B2 (0x69B8); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p12:69B2 (5 bytes)
;   0x69b8..0x69bd  (5 bytes)
DATA_resto_69B8:
	defb 003h,08ah,080h,015h,000h	; 69b8

; ======================================================================
; CODIGO 0x69bd..0x6bbe  (513 bytes)
; ======================================================================


empiezan_15_b8:		; p08:AD58 con el banco 8 en 0xA000 y el banco de antes
	ld a,(0c383h)		;69bd   ; lee la copia del banco de 0xA000
	push af			;69c0
	call 041bdh		;69c1   ; bancos_8: pone el 8 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0ad58h		;69c4   ; empiezan_los_15: los actores de tipo 0x15 en el paso 0 toman su sitio (p08:AD78)
	pop af			;69c7
	push af			;69c8
	jp 041a3h		;69c9
actores_especiales:		; fuera de las salas especiales: 0xD4F8-0xD4FF a cero, p12:6B42 y los de la zona 4 (p12:6A28)
	ld a,(0ca76h)		;69cc   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	and a			;69cf
	ret nz			;69d0
	ld hl,0d4f8h		;69d1   ; 8 bytes
	ld bc,00007h		;69d4
	call 04236h		;69d7   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	call actores_d200		;69da   ; actores_d200: en la zona 6 fuera de las especiales: 0xD200-0xD3FF a cero y, por cada fila de p56:B431 ([sala][Y][X], hasta 0xFF) de la sala de Snake, un actor desde 0xD200 con su sitio y sala, de tipo 0x13 si su byte de 0xD4F8 es 0 (si no, libre)
	jp actores_de_la_zona_4		;69dd   ; actores_de_la_zona_4: en la zona 4: en la sala 1, una ficha en 0xD300 con la de p56:B6E1 (al azar 0-3) y los sitios de p56:B701 (B = 1, fila 1); en la sala 6, 0xD42D al azar (0-3), 3 fichas de p56:B6E9 y los sitios de p56:B709 (fila 2)
actores_de_la_especial:		; la lista de la sala especial en p56:B326 ([sala][lista], hasta 0xFF): un actor por fila desde 0xD300 (en la 0x39, desde 0xCE00 y solo con el bit 6 de 0xD7D9) con el byte 0x1B = 1; luego p12:69BD
	ld hl,0b326h		;69e0   ; las listas de p56:B326
	ld a,(0ca76h)		;69e3   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
busca_especial:
	ld b,(hl)			;69e6   ; la sala
	inc b			;69e7   ; 0xFF: ninguna
	ret z			;69e8
	cp (hl)			;69e9   ; la suya?
	inc hl			;69ea
	jr z,especial_hallada		;69eb
	inc hl			;69ed   ; la siguiente (3 bytes)
	inc hl			;69ee
	jr busca_especial		;69ef
especial_hallada:
	ld a,(hl)			;69f1
	inc hl			;69f2
	ld h,(hl)			;69f3
	ld l,a			;69f4
	ld a,(0ca76h)		;69f5   ; la especial 0x39...
	cp 039h		;69f8   ; la 0x39?
	ld ix,0d300h		;69fa   ; apunta a las 4 fichas de actor de los que llegan con la alerta (los actores 20-23)
	jr nz,actor_de_especial		;69fe
	ld ix,0ce00h		;6a00   ; ...en 0xCE00...
	ld a,(0d7d9h)		;6a04   ; ...con el bit 6 de 0xD7D9
	and 040h		;6a07   ; el bit 6 de 0xD7D9
	ret z			;6a09
actor_de_especial:
	ld a,(hl)			;6a0a
	inc a			;6a0b   ; 0xFF: se acaba
	jr z,empiezan_15_b8		;6a0c
	push hl			;6a0e
	push ix		;6a0f
	pop hl			;6a11
	ld bc,0003fh		;6a12   ; 0x40 bytes a cero
	call 04236h		;6a15   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	pop hl			;6a18
	call actor_de_fila		;6a19   ; actor_de_fila: el actor de IX desde la fila de HL: los bytes 1 y 0x1F a 0, el tipo (byte 0; el 8 por p12:6930; con 0x0C, el dibujo 6 o 2 en la zona 0x12), la Y, la X, su sala (0: la de Snake), los bits 0-5 del byte 4 a 0x11 y los 6-7 a 0x19, y el byte 0x10 por el tipo: 3 hasta 0x0F, 1 hasta 0x12, 0xFF desde 0x13
	inc hl			;6a1c
	ld (ix+01bh),001h		;6a1d   ; el byte 0x1B = 1
	ld bc,00040h		;6a21   ; la siguiente (0x40 bytes)
	add ix,bc		;6a24
	jr actor_de_especial		;6a26
actores_de_la_zona_4:		; en la zona 4: en la sala 1, una ficha en 0xD300 con la de p56:B6E1 (al azar 0-3) y los sitios de p56:B701 (B = 1, fila 1); en la sala 6, 0xD42D al azar (0-3), 3 fichas de p56:B6E9 y los sitios de p56:B709 (fila 2)
	ld a,(0ca4ah)		;6a28   ; lee la zona
	cp 004h		;6a2b   ; la zona 4?
	ret nz			;6a2d
	ld a,(0ca4bh)		;6a2e   ; la sala 6...
	cp 006h		;6a31   ; la sala 6?
	jr z,zona_4_sala_6		;6a33
	dec a			;6a35   ; ...o la 1
	ret nz			;6a36
	call 04256h		;6a37   ; azar: A = un numero al azar (0xCA03 rotado mas R)
	and 003h		;6a3a   ; 0-3...
	add a,a			;6a3c
	ld hl,0b6e1h		;6a3d   ; ...de p56:B6E1
	call 0423eh		;6a40   ; suma_a_hl: HL = HL + A
	ld bc,00101h		;6a43   ; una, fila 1
	ld de,0b701h		;6a46   ; los sitios de p56:B701
	jr fichas_d300		;6a49
zona_4_sala_6:
	call 04256h		;6a4b   ; azar: A = un numero al azar (0xCA03 rotado mas R)
	and 003h		;6a4e   ; 0-3...
	ld (0d42dh),a		;6a50   ; ...a 0xD42D
	call fila_b6e9		;6a53   ; fila_b6e9:
	ld bc,00302h		;6a56   ; tres, fila 2
	ld de,0b709h		;6a59   ; los sitios de p56:B709
fichas_d300:		; las 4 fichas de 0xD300 a cero y B desde la de HL: tipo 0x0C (1 con alerta 2), fila C, columna 6, byte 0x10 = 3, la Y y la X del sitio [HL] de DE y el dibujo
	exx			;6a5c
	ld hl,0d300h		;6a5d   ; apunta a las 4 fichas de actor de los que llegan con la alerta (los actores 20-23)
	ld bc,000ffh		;6a60   ; 0x100 bytes
	call 04236h		;6a63   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	exx			;6a66
	ld ix,0d300h		;6a67   ; apunta a las 4 fichas de actor de los que llegan con la alerta (los actores 20-23)
ficha_d300:
	push de			;6a6b
	ld a,(0ca5fh)		;6a6c   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	cp 002h		;6a6f   ; alerta 2?
	ld a,00ch		;6a71   ; sin alerta 2, el 0x0C...
	jr c,L_6A77		;6a73
	ld a,001h		;6a75   ; ...con ella, el 1
L_6A77:
	ld (ix+000h),a		;6a77   ; guarda el tipo del actor (0 = libre)
	ld (ix+00ah),c		;6a7a   ; guarda la fila de la sala del actor
	ld (ix+00bh),006h		;6a7d   ; la columna de la sala del actor = 0x06
	ld (ix+010h),003h		;6a81   ; byte 0x10 = 3
	ld (ix+00ch),000h		;6a85   ; byte 0x0C = 0
	ld a,(hl)			;6a89   ; el sitio...
	add a,a			;6a8a
	call 04243h		;6a8b   ; suma_a_de: DE = DE + A
	ld a,(de)			;6a8e   ; ...su Y...
	ld (ix+003h),a		;6a8f   ; guarda la Y del actor
	inc de			;6a92
	ld a,(de)			;6a93   ; ...su X
	ld (ix+005h),a		;6a94   ; guarda la X del actor
	inc hl			;6a97
	ld a,(hl)			;6a98   ; el dibujo
	ld (ix+00dh),a		;6a99   ; guarda el dibujo del actor (bit 0: el paso)
	inc hl			;6a9c
	ld de,00040h		;6a9d   ; la siguiente (0x40 bytes)
	add ix,de		;6aa0
	pop de			;6aa2
	djnz ficha_d300		;6aa3
	ret			;6aa5
fila_d42d:		; HL = p56:B6E9 + 0xD42D * 6
	ld a,(0d42dh)		;6aa6   ; lee la fila de p56:B6E9 de la zona 4 sala 6 (al azar 0-3)
fila_b6e9:
	add a,a			;6aa9
	ld b,a			;6aaa
	add a,a			;6aab
	add a,b			;6aac
	ld hl,0b6e9h		;6aad   ; + p56:B6E9
	jp 0423eh		;6ab0   ; suma_a_hl: HL = HL + A
actores_del_sitio_0d:		; con Snake en el sitio 0x0D de 0xCBE0: un actor por fila de p56:B0AE desde 0xD300 con el byte 0x1B = 2 y luego p04:818B
	ld a,(0ca65h)		;6ab3   ; lee el sitio de 0xCBE0 en el que esta Snake (0 = ninguno)
	cp 00dh		;6ab6   ; el sitio 0x0D?
	ret nz			;6ab8
	ld hl,0b0aeh		;6ab9   ; la lista de p56:B0AE
	ld ix,0d300h		;6abc   ; apunta a las 4 fichas de actor de los que llegan con la alerta (los actores 20-23)
actor_del_sitio:
	ld a,(hl)			;6ac0
	inc a			;6ac1   ; 0xFF: a pintarlos
	jp z,0818bh		;6ac2   ; pinta_actores: los actores de esta sala (salvo el 0x0A): sus sprites; el 0x15 en el paso 3, p14:B34F
	call actor_de_fila		;6ac5   ; actor_de_fila: el actor de IX desde la fila de HL: los bytes 1 y 0x1F a 0, el tipo (byte 0; el 8 por p12:6930; con 0x0C, el dibujo 6 o 2 en la zona 0x12), la Y, la X, su sala (0: la de Snake), los bits 0-5 del byte 4 a 0x11 y los 6-7 a 0x19, y el byte 0x10 por el tipo: 3 hasta 0x0F, 1 hasta 0x12, 0xFF desde 0x13
	ld (ix+01bh),002h		;6ac8   ; el byte 0x1B = 2
	inc hl			;6acc
	ld bc,00040h		;6acd   ; la siguiente (0x40 bytes)
	add ix,bc		;6ad0
	jr actor_del_sitio		;6ad2
actor_d340:		; sin 0xC697: sin 0xD454 y sin alerta, con 0xCA67 y la ficha 0xD340 libre, cuenta 0xD420; al acabar, 0xD509 = 1, 0xD454 = 4 y la ficha a cero; con 0xD454, cuenta y al acabar el actor 0x0B en X = 0xA0, Y = 0x20
	ld a,(0c697h)		;6ad4   ; con 0xC697, nada
	and a			;6ad7
	ret nz			;6ad8
	ld a,(0d454h)		;6ad9   ; con 0xD454, aparte
	and a			;6adc
	jr nz,d454_cuenta		;6add
	ld a,(0ca5fh)		;6adf   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	and a			;6ae2
	ret nz			;6ae3   ; con alerta, nada
	ld a,(0ca67h)		;6ae4   ; 0xCA67
	and a			;6ae7
	ret z			;6ae8   ; sin 0xCA67, nada
	ld a,(0d340h)		;6ae9   ; 0xD340
	and a			;6aec
	ret nz			;6aed   ; ocupada, nada
	ld hl,0d420h		;6aee   ; apunta a la cuenta del actor de 0xD340
	dec (hl)			;6af1   ; la cuenta
	ret nz			;6af2
	ld a,001h		;6af3
	ld (0d509h),a		;6af5   ; 0xD509 = 1
	ld a,004h		;6af8   ; 0xD454 = 4
	ld (0d454h),a		;6afa   ; guarda la cuenta hasta que sale el actor de 0xD340
	ld hl,0d340h		;6afd   ; la ficha a cero
	ld bc,0003fh		;6b00   ; 0x40 bytes
	jp 04236h		;6b03   ; borra_bloque: pone a cero BC + 1 bytes desde HL
d454_cuenta:
	ld hl,0d454h		;6b06   ; apunta a la cuenta hasta que sale el actor de 0xD340
	dec (hl)			;6b09   ; la cuenta
	ret nz			;6b0a
	ld a,00bh		;6b0b   ; el tipo 0x0B
	ld (0d340h),a		;6b0d   ; el tipo...
	ld a,020h		;6b10   ; la Y 0x20
	ld d,a			;6b12
	ld (0d343h),a		;6b13   ; ...la Y...
	ld a,0a0h		;6b16   ; la X 0xA0
	ld e,a			;6b18
	ld (0d345h),a		;6b19   ; ...la X
	ld a,009h		;6b1c   ; byte 0x0B = 9
	ld (0d34bh),a		;6b1e
	ld a,002h		;6b21   ; bytes 0x0A y 0x0D = 2
	ld (0d34ah),a		;6b23
	ld (0d34dh),a		;6b26
	inc a			;6b29   ; byte 0x10 = 3
	ld (0d350h),a		;6b2a
	ld a,03ch		;6b2d   ; 0xD420 = 0x3C
	ld (0d420h),a		;6b2f   ; guarda la cuenta del actor de 0xD340
	call 04256h		;6b32   ; 0xD421 al azar 1-4
	and 003h		;6b35
	inc a			;6b37
	ld (0d421h),a		;6b38   ; 0xD421
	ld hl,00000h		;6b3b   ; 0xD422-0xD423 = 0
	ld (0d422h),hl		;6b3e
	ret			;6b41
actores_d200:		; en la zona 6 fuera de las especiales: 0xD200-0xD3FF a cero y, por cada fila de p56:B431 ([sala][Y][X], hasta 0xFF) de la sala de Snake, un actor desde 0xD200 con su sitio y sala, de tipo 0x13 si su byte de 0xD4F8 es 0 (si no, libre)
	ld a,(0ca4ah)		;6b42   ; lee la zona
	cp 006h		;6b45   ; la zona 6?
	ret nz			;6b47
	ld a,(0ca76h)		;6b48   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	and a			;6b4b
	ret nz			;6b4c   ; en una especial, nada
	ld hl,0d200h		;6b4d   ; 0xD200
	ld bc,001ffh		;6b50   ; 0x200 bytes
	call 04236h		;6b53   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	ld de,0d4f8h		;6b56   ; un byte por fila
	ld ix,0d200h		;6b59
	ld bc,(0ca50h)		;6b5d   ; la sala de Snake...
	ld a,c			;6b61
	rlca			;6b62
	rlca			;6b63
	rlca			;6b64
	rlca			;6b65
	or b			;6b66   ; ...en un byte (fila, columna)
	ld c,a			;6b67
	ld hl,0b431h		;6b68   ; la lista de p56:B431
fila_b431:
	ld a,(hl)			;6b6b
	inc a			;6b6c   ; 0xFF: se acaba
	ret z			;6b6d
	ld a,(hl)			;6b6e
	inc hl			;6b6f
	cp c			;6b70   ; de esta sala?
	jr nz,otra_fila_b431		;6b71
	ld a,(hl)			;6b73   ; la Y
	ld (ix+003h),a		;6b74   ; guarda la Y del actor
	inc hl			;6b77
	ld a,(hl)			;6b78   ; la X
	ld (ix+005h),a		;6b79   ; guarda la X del actor
	inc hl			;6b7c
	ld a,c			;6b7d   ; la fila de la sala...
	rrca			;6b7e
	rrca			;6b7f
	rrca			;6b80
	rrca			;6b81
	and 00fh		;6b82
	ld (ix+00ah),a		;6b84   ; guarda la fila de la sala del actor
	ld a,c			;6b87   ; ...y la columna
	and 00fh		;6b88
	ld (ix+00bh),a		;6b8a   ; guarda la columna de la sala del actor
	ld a,(de)			;6b8d   ; su byte de 0xD4F8
	inc de			;6b8e
	and a			;6b8f
	ld a,013h		;6b90   ; a 0, el tipo 0x13...
	jr z,pon_tipo_d200		;6b92
	xor a			;6b94   ; ...si no, libre
pon_tipo_d200:
	ld (ix+000h),a		;6b95   ; guarda el tipo del actor (0 = libre)
	push bc			;6b98
	ld bc,00040h		;6b99   ; la siguiente (0x40 bytes)
	add ix,bc		;6b9c
	pop bc			;6b9e
	jr fila_b431		;6b9f
otra_fila_b431:
	inc hl			;6ba1
	inc hl			;6ba2
	jr fila_b431		;6ba3
fichas_d800_de_la_zona:		; guarda las de 0xD800 (p12:6BE6), 0xD8A6 = 0, las 4 fichas a cero y las de la zona por la tabla de p12:6BBE (las zonas 3, 7, 0x0A, 0x0E y 0x12)
	call guarda_d800		;6ba5   ; guarda_d800: por cada ficha de 0xD800 de tipo T (salvo 0 y 0x0B) con el byte 1 distinto de 0: si es 0x20 o mas, o no es menor que el de p12:6C21 de su tipo, se guarda en 0xD87F + T (salvo que este a 0xFF)
	xor a			;6ba8
	ld (0d8a6h),a		;6ba9   ; 0xD8A6 = 0
	ld hl,0d800h		;6bac   ; apunta a 4 fichas de 0x20 bytes de 0xD800 (p04:89C3); sus tipos los lleva p10
	ld bc,0007fh		;6baf   ; 0x80 bytes
	call 04236h		;6bb2   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	ld a,(0ca4ah)		;6bb5   ; lee la zona
	ld hl,06bbeh		;6bb8   ; tabla_6BBE: 19 destinos del despachador p00
	call 0424dh		;6bbb   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_6BBE: 19 destinos del despachador p00:424D (call en p12:6BBB, el
;   indice en A): 6CDF, 6CDF, 6CDF, 6C2C, 6CDF, 6CDF, 6CDF, 6C38, 6CDF, 6CDF,
;   6C4F, 6CDF, 6CDF, 6CDF, 6C8D, 6CDF, 6CDF, 6CDF, 6C54; lo leen p12:6BBB (38
;   bytes)
;   0x6bbe..0x6be4  (38 bytes)
DATA_tabla_6BBE:
	defw 06cdfh,06cdfh,06cdfh,06c2ch,06cdfh,06cdfh,06cdfh,06c38h	; 6bbe
	defw 06cdfh,06cdfh,06c4fh,06cdfh,06cdfh,06cdfh,06c8dh,06cdfh	; 6bce
	defw 06cdfh,06cdfh,06c54h	; 6bde  -> sin_fichas_d800 sin_fichas_d800 fichas_de_a1b3

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6be4..0x6be6  (2 bytes)
DATA_6BE4:
	defb 074h,06ch	; 6be4

; ======================================================================
; CODIGO 0x6be6..0x6c21  (59 bytes)
; ======================================================================


guarda_d800:		; por cada ficha de 0xD800 de tipo T (salvo 0 y 0x0B) con el byte 1 distinto de 0: si es 0x20 o mas, o no es menor que el de p12:6C21 de su tipo, se guarda en 0xD87F + T (salvo que este a 0xFF)
	ld hl,0d800h		;6be6   ; apunta a 4 fichas de 0x20 bytes de 0xD800 (p04:89C3); sus tipos los lleva p10
	ld b,004h		;6be9   ; 4 fichas
L_6BEB:
	push hl			;6beb
	ld a,(hl)			;6bec
	ld c,a			;6bed
	and a			;6bee   ; libre...
	jr z,siguiente_d800		;6bef
	cp 00bh		;6bf1   ; ...o el 0x0B, nada
	jr z,siguiente_d800		;6bf3
	inc hl			;6bf5
	ld a,(hl)			;6bf6   ; el byte 1
	ld d,a			;6bf7
	and a			;6bf8
	jr z,siguiente_d800		;6bf9
	ld a,c			;6bfb
	ld hl,l6c20h		;6bfc   ; el minimo de p12:6C21
	call 0423eh		;6bff   ; suma_a_hl: HL = HL + A
	ld a,d			;6c02
	ld e,a			;6c03
	cp 020h		;6c04   ; desde 0x20...
	jr nc,L_6C0C		;6c06
	ld e,(hl)			;6c08   ; ...o desde el minimo...
	cp e			;6c09
	jr c,siguiente_d800		;6c0a
L_6C0C:
	ld a,c			;6c0c
	ld hl,0d87fh		;6c0d   ; ...a 0xD87F + T...
	call 0423eh		;6c10   ; suma_a_hl: HL = HL + A
	ld a,(hl)			;6c13
	inc a			;6c14   ; ...salvo con 0xFF
	jr z,siguiente_d800		;6c15
	ld (hl),e			;6c17   ; guardado
siguiente_d800:
	pop hl			;6c18
	ld a,020h		;6c19   ; la siguiente (0x20 bytes)
	call 0423eh		;6c1b   ; suma_a_hl: HL = HL + A
	djnz L_6BEB		;6c1e
L_6C20:
	ret			;6c20

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6c21..0x6c2c  (11 bytes)
DATA_6C21:
	defb 004h,000h,006h,00bh,003h,005h,003h,000h,000h,000h,000h	; 6c21  ...........

; ======================================================================
; CODIGO 0x6c2c..0x6e05  (473 bytes)
; ======================================================================


fichas_de_a19b:		; la ficha de p56:A19B y el byte 0x0D = 0x12
	ld hl,0a19bh		;6c2c   ; p56:A19B
	call ficha_en_d800		;6c2f   ; ficha_en_d800:
	ld a,012h		;6c32
	ld (0d80dh),a		;6c34   ; el byte 0x0D de 0xD800 = 0x12
	ret			;6c37
fichas_de_a1a1:		; la ficha de p56:A1A1 y la de p56:A1D1 en 0xD860 (con su byte en 0xD872); sin el bit 1 de 0xD7D1, la de 0xD860 libre
	ld hl,0a1a1h		;6c38   ; p56:A1A1
	call ficha_en_d800		;6c3b   ; ficha_en_d800:
	ld hl,0a1d1h		;6c3e   ; p56:A1D1
	call ficha_en_d860		;6c41   ; ficha_en_d860: un byte a 0xD872 y la ficha en 0xD860
	ld a,(0d7d1h)		;6c44   ; el bit 1 de 0xD7D1
	and 002h		;6c47   ; con el bit 1, se queda
	ret nz			;6c49
	xor a			;6c4a
	ld (0d860h),a		;6c4b   ; 0xD860 libre
	ret			;6c4e
fichas_de_a1ad:		; la de p56:A1AD
	ld hl,0a1adh		;6c4f   ; p56:A1AD
	jr ficha_en_d800		;6c52
fichas_de_a1b3:		; las de p56:A1B3, p56:A1BF en 0xD820 y p56:A1C5 en 0xD840; luego 0xD820 y 0xD840 libres
	ld hl,0a1b3h		;6c54   ; p56:A1B3
	call ficha_en_d800		;6c57   ; ficha_en_d800:
	ld hl,0a1bfh		;6c5a   ; p56:A1BF...
	ld de,0d820h		;6c5d   ; ...en 0xD820
	call ficha_d800_de_fila		;6c60   ; ficha_d800_de_fila: la ficha DE desde la fila de HL [T][Y][X][fila][columna][byte 0x10], con su byte 1 de 0xD87F + T; con 0xFF ahi, nada; con T = 8 y 0xD88B = 0xFF, el byte 1 = 0x11, la Y 0x80, la X 0x78 y el byte 0x16 a 0
	ld hl,0a1c5h		;6c63   ; p56:A1C5...
	ld de,0d840h		;6c66   ; ...en 0xD840
	call ficha_d800_de_fila		;6c69   ; ficha_d800_de_fila: la ficha DE desde la fila de HL [T][Y][X][fila][columna][byte 0x10], con su byte 1 de 0xD87F + T; con 0xFF ahi, nada; con T = 8 y 0xD88B = 0xFF, el byte 1 = 0x11, la Y 0x80, la X 0x78 y el byte 0x16 a 0
	xor a			;6c6c
	ld (0d820h),a		;6c6d   ; 0xD820...
	ld (0d840h),a		;6c70   ; ...y 0xD840 libres
	ret			;6c73
fichas_de_a1b9:		; las de p56:A1B9 y p56:A1CB en 0xD820; salvo con 0xD884 = 0xFF, la de 0xD820 libre
	ld hl,0a1b9h		;6c74   ; p56:A1B9
	call ficha_en_d800		;6c77   ; ficha_en_d800:
	ld hl,0a1cbh		;6c7a   ; p56:A1CB...
	ld de,0d820h		;6c7d   ; ...en 0xD820
	call ficha_d800_de_fila		;6c80   ; ficha_d800_de_fila: la ficha DE desde la fila de HL [T][Y][X][fila][columna][byte 0x10], con su byte 1 de 0xD87F + T; con 0xFF ahi, nada; con T = 8 y 0xD88B = 0xFF, el byte 1 = 0x11, la Y 0x80, la X 0x78 y el byte 0x16 a 0
	ld a,(0d884h)		;6c83   ; 0xD884
	inc a			;6c86   ; 0xFF: se queda
	ret z			;6c87
	xor a			;6c88
	ld (0d820h),a		;6c89   ; 0xD820 libre
	ret			;6c8c
fichas_de_a1a7:		; la de p56:A1A7
	ld hl,0a1a7h		;6c8d   ; p56:A1A7
ficha_en_d800:
	ld de,0d800h		;6c90   ; apunta a 4 fichas de 0x20 bytes de 0xD800 (p04:89C3); sus tipos los lleva p10
	jr ficha_d800_de_fila		;6c93
ficha_en_d860:		; un byte a 0xD872 y la ficha en 0xD860
	ld de,0d872h		;6c95   ; un byte a 0xD872
	ldi		;6c98
	ld de,0d860h		;6c9a   ; la ficha en 0xD860
ficha_d800_de_fila:		; la ficha DE desde la fila de HL [T][Y][X][fila][columna][byte 0x10], con su byte 1 de 0xD87F + T; con 0xFF ahi, nada; con T = 8 y 0xD88B = 0xFF, el byte 1 = 0x11, la Y 0x80, la X 0x78 y el byte 0x16 a 0
	ld a,(hl)			;6c9d
	push hl			;6c9e   ; el tipo
	ld hl,0d87fh		;6c9f   ; 0xD87F + T
	call 0423eh		;6ca2   ; suma_a_hl: HL = HL + A
	ld a,(hl)			;6ca5   ; lo guardado
	ld c,a			;6ca6
	inc c			;6ca7
	pop hl			;6ca8
	ret z			;6ca9   ; 0xFF: nada
	push de			;6caa
	ldi		;6cab   ; el tipo...
	ld (de),a			;6cad   ; ...y lo guardado al byte 1
	inc e			;6cae
	inc e			;6caf
	ldi		;6cb0   ; la Y al 3
	inc e			;6cb2
	ldi		;6cb3   ; la X al 5
	ld a,e			;6cb5   ; al 0x0A...
	add a,004h		;6cb6
	ld e,a			;6cb8
	ldi		;6cb9   ; ...la fila...
	ldi		;6cbb   ; ...y la columna
	ld a,e			;6cbd   ; al 0x10...
	add a,004h		;6cbe
	ld e,a			;6cc0
	ldi		;6cc1
	pop hl			;6cc3
	ld a,(hl)			;6cc4   ; el tipo 8...
	cp 008h		;6cc5
	ret nz			;6cc7
	ld a,(0d88bh)		;6cc8   ; ...con 0xD88B = 0xFF
	inc a			;6ccb
	ret nz			;6ccc
	inc hl			;6ccd
	ld (hl),011h		;6cce   ; el byte 1 = 0x11
	inc hl			;6cd0
	inc hl			;6cd1
	ld (hl),080h		;6cd2   ; la Y 0x80
	inc hl			;6cd4
	inc hl			;6cd5
	ld (hl),078h		;6cd6   ; la X 0x78
	ld a,011h		;6cd8
	call 0423eh		;6cda   ; suma_a_hl: HL = HL + A
	ld (hl),000h		;6cdd   ; el byte 0x16 = 0
sin_fichas_d800:
	ret			;6cdf
radar_cada_cuadro:		; el bit 4 de 0xD7E1 con 0xCA64 o 0xCAA9; salvo con 0xCB21 = 2, la pantalla partida o una escena: 0xE206 = 0 y, sin 0xE1D0, 0xCABA, 0xCA64, el estado 0x11, 0xCA77 ni 0xCAA9, lo del recuadro (p12:705A, p12:70A0, p12:71D7, p12:7272 sin 0xE20B) y la raya de 0xCA7A (p12:6D63); con la alerta, p12:6FEA
	ld a,(0ca64h)		;6ce0   ; 0xCA64...
	ld hl,0caa9h		;6ce3
	or (hl)			;6ce6   ; ...o 0xCAA9
	ld hl,0d7e1h		;6ce7   ; el bit 4 de 0xD7E1
	jr z,quita_d7e1_4		;6cea
	set 4,(hl)		;6cec   ; con alguno, el bit 4
	jr radar_si_se_ve		;6cee
quita_d7e1_4:
	res 4,(hl)		;6cf0
radar_si_se_ve:
	ld a,(0cb21h)		;6cf2   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	cp 002h		;6cf5
	ret z			;6cf7   ; con 0xCB21 = 2, nada
	ld a,(0ca1ch)		;6cf8   ; lee 1: la pantalla partida en la linea 0xB4 (arriba con desplazamiento, abajo la pagina 1 sin sprites)
	and a			;6cfb
	ret nz			;6cfc   ; partida, nada
	ld a,(0e040h)		;6cfd   ; lee la escena en curso (1-9, 0 = ninguna; p09:A4A6, guiones en p09:A5D4)
	and a			;6d00
	ret nz			;6d01   ; en una escena, nada
	xor a			;6d02
radar_con_e206:
	ld (0e206h),a		;6d03   ; guarda 1 al borrar los puntos del recuadro
	ld a,(0e1d0h)		;6d06   ; lee 1 con la ficha de p09:A061 en marcha (zona 0x0A; 0xE1D1 paso, 0xE1D2-0xE1D3 su sitio)
	and a			;6d09
	ret nz			;6d0a
	ld a,(0cabah)		;6d0b
	and a			;6d0e
	ret nz			;6d0f
	ld a,(0ca5fh)		;6d10   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	and a			;6d13
	jp nz,radar_en_alerta		;6d14   ; con la alerta, el parpadeo
	ld a,(0ca64h)		;6d17
	and a			;6d1a
	ret nz			;6d1b
	ld a,(0cb00h)		;6d1c   ; lee el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	cp 011h		;6d1f
	ret z			;6d21   ; el estado 0x11, nada
	ld a,(0ca77h)		;6d22
	and a			;6d25
	ret nz			;6d26
	ld a,(0caa9h)		;6d27
	and a			;6d2a
	ret nz			;6d2b
	ld hl,0e20bh		;6d2c   ; apunta a la cuenta de cuadros sin pintar lo de dentro del recuadro
	ld a,(hl)			;6d2f
	and a			;6d30
	jr nz,raya_de_ca7a		;6d31   ; con 0xE20B, sin lo de dentro
	call punto_de_snake		;6d33   ; punto_de_snake: salvo en el estado 0x11: el punto de Snake (su sitio, o el de antes de entrar en 0xCBE0) en la casilla del centro del recuadro: de color 0x0A cada 4 cuadros sin salir de la sala; con 0xE206, copiado de la otra pagina
	call puntos_de_actores		;6d36   ; puntos_de_actores: los actores de 0xCE00 (0x18, o 0x14 dentro de un sitio) que no son 0, 0x13, 0x17, 0x18 ni el 8 con 0xD441, en una sala a uno o menos de la de Snake: su punto (p12:710F); en una especial, solo los del byte 0x1B = 1 (el 9, solo en la especial 0x18)
	call puntos_de_d800		;6d39   ; puntos_de_d800: las marcas de las 3 fichas de 0xD800 (en una especial, solo la de 0xD860)
	call puntos_de_la_columna_7		;6d3c   ; puntos_de_la_columna_7: en la columna 7: en la especial 0x2A sin el bit 7 de 0xD7D5, un punto en (0xEC, 0x34); en la 0x26 sin los bits 5 y 6 de 0xD7D3, en (0xF3, 0x34)
raya_de_ca7a:		; sin 0xE206 y con 0xCA7A de 2 o mas: con 0xE203 = 1, 0xCA7A uno menos y el sonido 8 (si sigue en 2 o mas); la raya vertical de color 0x0C en la columna de 0xE203
	ld a,(0e206h)		;6d3f   ; lee 1 al borrar los puntos del recuadro
	and a			;6d42
	ret nz			;6d43
	ld a,(0ca7ah)		;6d44   ; lee las veces que pasa la raya del recuadro
	cp 002h		;6d47
	ret c			;6d49   ; por debajo de 2, nada
	ld hl,0e203h		;6d4a   ; apunta a la columna de la raya del recuadro (1-0x1B)
	ld c,(hl)			;6d4d
	ld a,c			;6d4e
	dec a			;6d4f   ; 0xE203 = 1?
	jr nz,raya_e203		;6d50
	ld a,(0e206h)		;6d52   ; lee 1 al borrar los puntos del recuadro
	and a			;6d55
	jr nz,raya_e203		;6d56
	ld hl,0ca7ah		;6d58   ; apunta a las veces que pasa la raya del recuadro
	dec (hl)			;6d5b   ; uno menos
	ld a,(hl)			;6d5c
	cp 002h		;6d5d
	ret c			;6d5f
	call 05f3ch		;6d60   ; el sonido 8
raya_e203:
	call sitio_de_raya		;6d63   ; sitio_de_raya: HL = (0xC3 + C * 2, 0x17) y B = 0x38 de alto
	ld c,00ch		;6d66   ; el color 0x0C
	ld a,(0ca42h)		;6d68   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	jp 04680h		;6d6b   ; linea_vertical: orden LINE del VDP con el lado largo en Y (ARG = 1)
sitio_de_raya:		; HL = (0xC3 + C * 2, 0x17) y B = 0x38 de alto
	ld l,017h		;6d6e   ; Y = 0x17
	ld a,c			;6d70   ; X = 0xC3 + C * 2
	add a,a			;6d71
	add a,0c3h		;6d72
	ld h,a			;6d74
	ld b,038h		;6d75   ; 0x38 de alto
	ret			;6d77
radar_entre_cuadros:		; salvo con 0xCB21 = 2, la pantalla partida o la alerta: la raya que se mueve (p12:6D9C) y la cuenta 0xE20B; al acabar, p12:6D03 con 0xE206 = 1
	ld a,(0cb21h)		;6d78   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	cp 002h		;6d7b
	ret z			;6d7d
	ld a,(0ca1ch)		;6d7e   ; lee 1: la pantalla partida en la linea 0xB4 (arriba con desplazamiento, abajo la pagina 1 sin sprites)
	and a			;6d81
	ret nz			;6d82
	ld a,(0ca5fh)		;6d83   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	and a			;6d86
	ret nz			;6d87
	call raya_que_va_y_viene		;6d88   ; raya_que_va_y_viene: sin 0xCABA y con 0xCA7A (a 1 pasa a 0): 0xE203 va de 1 a 0x1B y vuelve (0xE202 la direccion), y la columna de la raya se copia de la otra pagina (p12:6DCD)
	ld hl,0e20bh		;6d8b   ; apunta a la cuenta de cuadros sin pintar lo de dentro del recuadro
	ld a,(hl)			;6d8e
	and a			;6d8f
	jr z,radar_e206_1		;6d90
	dec (hl)			;6d92
	ret			;6d93
radar_e206_1:
	ld a,001h		;6d94
	jp radar_con_e206		;6d96   ; radar_con_e206:
ca7a_a_cero:
	ld (hl),000h		;6d99
	ret			;6d9b
raya_que_va_y_viene:		; sin 0xCABA y con 0xCA7A (a 1 pasa a 0): 0xE203 va de 1 a 0x1B y vuelve (0xE202 la direccion), y la columna de la raya se copia de la otra pagina (p12:6DCD)
	ld a,(0cabah)		;6d9c
	and a			;6d9f
	ret nz			;6da0
	ld hl,0ca7ah		;6da1   ; apunta a las veces que pasa la raya del recuadro
	ld a,(hl)			;6da4
	cp 001h		;6da5
	ret c			;6da7
	call z,ca7a_a_cero		;6da8   ; a 1, a 0
	ld hl,0e202h		;6dab   ; la direccion
	ld a,(hl)			;6dae
	inc hl			;6daf
	ld c,(hl)			;6db0
	and a			;6db1
	jr nz,raya_a_la_izquierda		;6db2
	inc (hl)			;6db4   ; a la derecha...
	ld a,(hl)			;6db5
	cp 01ch		;6db6   ; ...hasta 0x1B...
	jr c,copia_la_raya		;6db8
	dec hl			;6dba
	ld (hl),001h		;6dbb   ; ...y vuelve
	jr copia_la_raya		;6dbd
raya_a_la_izquierda:
	dec (hl)			;6dbf
	ld a,(hl)			;6dc0
	and a			;6dc1
	jr nz,copia_la_raya		;6dc2
	dec hl			;6dc4
	ld (hl),000h		;6dc5   ; en 0, a la derecha
copia_la_raya:
	call sitio_de_raya		;6dc7   ; sitio_de_raya: HL = (0xC3 + C * 2, 0x17) y B = 0x38 de alto
	ld bc,0023ch		;6dca   ; 2 x 0x3C
copia_de_la_otra:		; copia de la pagina 1 (o 4) a la misma posicion de la de 0xCA42
	ld d,h			;6dcd
	ld e,l			;6dce
	ld a,(0ca42h)		;6dcf   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	and a			;6dd2
	ld a,001h		;6dd3
	jr z,copia_columna		;6dd5
	ld a,004h		;6dd7
copia_columna:
	jp 04767h		;6dd9   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
punto_7:		; un punto de color 7 en la pagina A
	ld d,a			;6ddc
	ld a,007h		;6ddd
punto_c:
	ld e,000h		;6ddf
	jp 04840h		;6de1   ; punto: orden PSET del VDP con la operacion logica de E
sitio_en_el_radar:		; HL = el punto del recuadro de (E, D): cada uno por p12:6DEF
	ld a,e			;6de4
	call a_radar		;6de5   ; a_radar: B = (A / 0x20) * 3 + 0, 1 o 2 por A & 0x1F (menos de 8, de 0x18, o mas)
	ld l,b			;6de8
	ld a,d			;6de9
	call a_radar		;6dea   ; a_radar: B = (A / 0x20) * 3 + 0, 1 o 2 por A & 0x1F (menos de 8, de 0x18, o mas)
	ld h,b			;6ded
	ret			;6dee
a_radar:		; B = (A / 0x20) * 3 + 0, 1 o 2 por A & 0x1F (menos de 8, de 0x18, o mas)
	ld c,a			;6def   ; el tercio (A / 0x20)...
	rlca			;6df0
	rlca			;6df1
	rlca			;6df2
	and 007h		;6df3
	ld b,a			;6df5
	add a,a			;6df6   ; ...* 3
	add a,b			;6df7
	ld b,a			;6df8
	ld a,c			;6df9   ; dentro de la sala:
	and 01fh		;6dfa   ; dentro de la sala
	cp 008h		;6dfc   ; por debajo de 8, + 0
	ret c			;6dfe
	inc b			;6dff   ; por debajo de 0x18, + 1
	cp 018h		;6e00
	ret c			;6e02
	inc b			;6e03   ; si no, + 2
	ret			;6e04

; ----------------------------------------------------------------------
; DATOS resto_6E05: lo apuntan con el banco puesto p12:6F78 (0x6E05), p12:71CA
;   (0x6E05), p12:7341 (0x6E05), p12:73C3 (0x6E05); el tamano es lo que hay
;   hasta lo siguiente, no sale de recorrerlo; lo leen p12:6F78, p12:71CA,
;   p12:7341, p12:73C3 (18 bytes)
;   0x6e05..0x6e17  (18 bytes)
DATA_resto_6E05:
	defb 017h,0c4h,017h,0d7h,017h,0eah,02ah,0c4h,02ah,0d7h,02ah,0eah,03dh,0c4h,03dh,0d7h	; 6e05  ......*.*.*.=.=.
	defb 03dh,0eah	; 6e15

; ======================================================================
; CODIGO 0x6e17..0x6f3b  (292 bytes)
; ======================================================================


radar_de_cc80:		; acarreo si se pintan los puntos de 0xCC80: sin 0xCAA9, en la zona 0x12, o con 0xD654 en la especial 0x29 o con 0xCB21 = 8
	ld a,(0caa9h)		;6e17
	and a			;6e1a
	ret nz			;6e1b
	ld a,(0ca4ah)		;6e1c   ; lee la zona
	cp 012h		;6e1f
	jr z,si_cc80		;6e21   ; la zona 0x12: si
	ld a,(0d654h)		;6e23
	and a			;6e26
	ret z			;6e27   ; sin 0xD654, no
	ld a,(0ca76h)		;6e28   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 029h		;6e2b
	jr z,si_cc80		;6e2d   ; la especial 0x29: si
	ld a,(0cb21h)		;6e2f   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	cp 008h		;6e32
	jr z,si_cc80		;6e34   ; 0xCB21 = 8: si
	or a			;6e36   ; no
	ret			;6e37
si_cc80:
	scf			;6e38
	ret			;6e39
puntos_cc80_ya:		; con p12:6E17, los puntos de 0xCC80 (p12:6E4F) con 0xD4E5 = 1 mientras
	call radar_de_cc80		;6e3a   ; radar_de_cc80: acarreo si se pintan los puntos de 0xCC80: sin 0xCAA9, en la zona 0x12, o con 0xD654 en la especial 0x29 o con 0xCB21 = 8
	ret nc			;6e3d
	ld hl,0d4e5h		;6e3e   ; apunta a 1 mientras se pintan los puntos de 0xCC80 fuera de su turno
	ld (hl),001h		;6e41
	push hl			;6e43
	call puntos_cc80		;6e44   ; puntos_cc80: con 0xE206 = 0: sin 0xCAA9, los puntos de las 0x30 fichas de 0xCC80 (p12:6E78)
	pop hl			;6e47
	ld (hl),000h		;6e48
	ret			;6e4a
borra_puntos_cc80:		; con 0xE206 = 1, los borra
	ld a,001h		;6e4b
	jr L_6E50		;6e4d
puntos_cc80:		; con 0xE206 = 0: sin 0xCAA9, los puntos de las 0x30 fichas de 0xCC80 (p12:6E78)
	xor a			;6e4f
L_6E50:
	ld (0e206h),a		;6e50   ; guarda 1 al borrar los puntos del recuadro
	ld a,(0caa9h)		;6e53
	and a			;6e56
	ret nz			;6e57
	ld hl,0cc80h		;6e58   ; apunta a 16 fichas de 8 bytes del arma 8 [sitio][paso][Y][X][fila][columna] (p11:B574)
	ld b,030h		;6e5b
punto_cc80:
	push hl			;6e5d
	push bc			;6e5e
	call punto_de_ficha		;6e5f   ; punto_de_ficha: la ficha HL de tipo 1 o 4 en una sala a uno o menos de la de Snake: su punto en las dos paginas, de color 7 (0 si se borra; sin 0xD4E5 ni alerta, tambien en la de dibujo)
	pop bc			;6e62
	pop hl			;6e63
	ld a,008h		;6e64   ; la siguiente (8 bytes)
	call 0423eh		;6e66   ; suma_a_hl: HL = HL + A
	djnz punto_cc80		;6e69
	ret			;6e6b
borra_un_punto:
	ld a,001h		;6e6c
	jr un_punto_con_e206		;6e6e
un_punto:
	xor a			;6e70
un_punto_con_e206:		; 0xE206 = A y, con p12:6E17, p12:6E78
	ld (0e206h),a		;6e71   ; guarda 1 al borrar los puntos del recuadro
	call radar_de_cc80		;6e74   ; radar_de_cc80: acarreo si se pintan los puntos de 0xCC80: sin 0xCAA9, en la zona 0x12, o con 0xD654 en la especial 0x29 o con 0xCB21 = 8
	ret nc			;6e77
punto_de_ficha:		; la ficha HL de tipo 1 o 4 en una sala a uno o menos de la de Snake: su punto en las dos paginas, de color 7 (0 si se borra; sin 0xD4E5 ni alerta, tambien en la de dibujo)
	ld a,(hl)			;6e78
	cp 004h		;6e79   ; el 4...
	jr z,punto_de_cc80		;6e7b
	dec a			;6e7d   ; ...o el 1
	ret nz			;6e7e
punto_de_cc80:
	inc hl			;6e7f
	inc hl			;6e80
	ld e,(hl)			;6e81   ; su Y...
	inc hl			;6e82
	ld d,(hl)			;6e83   ; ...y su X
	inc hl			;6e84
	ld b,(hl)			;6e85   ; su fila
	ld a,(0ca50h)		;6e86   ; lee la fila de la sala en la zona (uno mas al salir por arriba)
	sub b			;6e89
	inc a			;6e8a   ; a uno o menos?
	cp 003h		;6e8b
	ret nc			;6e8d
	inc hl			;6e8e
	ld c,(hl)			;6e8f   ; su columna
	ld a,(0ca51h)		;6e90   ; lee la columna de la sala en la zona (uno mas al salir por la derecha)
	sub c			;6e93
	inc a			;6e94   ; a uno o menos?
	cp 003h		;6e95
	ret nc			;6e97
	push bc			;6e98
	call sitio_en_el_radar		;6e99   ; el punto
	pop bc			;6e9c
	call casilla_de_sala		;6e9d   ; + la sala
	ld a,(0ca42h)		;6ea0   ; la otra pagina
	xor 001h		;6ea3
	ld d,a			;6ea5
	ld a,(0e206h)		;6ea6   ; lee 1 al borrar los puntos del recuadro
	and a			;6ea9
	ld a,007h		;6eaa   ; color 7...
	jr z,L_6EAF		;6eac
	xor a			;6eae   ; ...o 0 al borrar
L_6EAF:
	push af			;6eaf
	call punto_e		;6eb0   ; punto_e:
	pop bc			;6eb3
	ld a,(0d4e5h)		;6eb4   ; lee 1 mientras se pintan los puntos de 0xCC80 fuera de su turno
	and a			;6eb7
	ret nz			;6eb8   ; con 0xD4E5, nada mas
	ld a,(0ca5fh)		;6eb9   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	and a			;6ebc
	ret nz			;6ebd   ; con la alerta, nada mas
	ld a,(0ca42h)		;6ebe   ; en la de dibujo
	ld d,a			;6ec1
	ld a,b			;6ec2
punto_e:
	ld e,000h		;6ec3
	jp 04840h		;6ec5   ; punto: orden PSET del VDP con la operacion logica de E
fondo_del_radar:		; el recuadro en 0xEE (p12:6F41) y las 3 x 3 salas alrededor de la de Snake desde el mapa de 0xD900: sin 0xCA64, 0xCA77 ni 0xCAA9, las de menos de 0x0A (zona 0), 3 (zona 9) o 0x80 con su dibujo (p12:6F61) desde 0xCA9E (0x8000 + lo de la zona 0x0B-0x10 de p12:6F3B * 0x13)
	call borra_radar		;6ec8   ; borra_radar: el recuadro de la otra pagina en 0xEE
	ld hl,08000h		;6ecb
	ld a,(0ca4ah)		;6ece   ; lee la zona
	sub 00bh		;6ed1   ; las zonas 0x0B-0x10...
	cp 006h		;6ed3
	jr nc,radar_desde		;6ed5
	ld hl,06f3bh		;6ed7   ; ...de p12:6F3B
	call 0423eh		;6eda   ; suma_a_hl: HL = HL + A
	ld a,(hl)			;6edd
	call por_0x13		;6ede   ; * 0x13
	ld de,08000h		;6ee1
	add hl,de			;6ee4
radar_desde:		; los dibujos en 0xCA9E
	ld (0ca9eh),hl		;6ee5   ; guarda los dibujos de las salas del recuadro (0x8000 + lo de la zona) y el byte siguiente (16 bits)
	ld hl,(0ca50h)		;6ee8   ; la sala de Snake...
	inc l			;6eeb
	ld a,l			;6eec
	add a,a			;6eed
	add a,a			;6eee
	add a,a			;6eef
	add a,a			;6ef0
	dec h			;6ef1   ; ...arriba a la izquierda...
	add a,h			;6ef2
	ld hl,0d900h		;6ef3   ; ...en el mapa de 0xD900
	call 0423eh		;6ef6   ; suma_a_hl: HL = HL + A
	ld bc,00303h		;6ef9   ; 3 x 3
	ld e,000h		;6efc   ; la casilla 0
fila_del_radar:
	push bc			;6efe
	push hl			;6eff
	ld b,c			;6f00
sala_del_radar:
	push bc			;6f01
	push de			;6f02
	push hl			;6f03
	ld a,(0ca64h)		;6f04
	and a			;6f07
	jr nz,siguiente_del_radar		;6f08   ; con 0xCA64, nada
	ld a,(0ca77h)		;6f0a
	and a			;6f0d
	jr nz,siguiente_del_radar		;6f0e   ; con 0xCA77, nada
	ld a,(0caa9h)		;6f10
	and a			;6f13
	jr nz,siguiente_del_radar		;6f14   ; con 0xCAA9, nada
	ld a,(0ca4ah)		;6f16   ; lee la zona
	and a			;6f19
	ld c,00ah		;6f1a   ; la zona 0: hasta 0x0A
	jr z,dibuja_si_menor		;6f1c
	cp 009h		;6f1e
	ld c,003h		;6f20   ; la 9: hasta 3
	jr z,dibuja_si_menor		;6f22
	ld c,080h		;6f24   ; las otras: hasta 0x80
dibuja_si_menor:
	ld a,(hl)			;6f26
	cp c			;6f27
	call c,dibujo_de_sala		;6f28   ; dibujo_de_sala: el dibujo A de la sala (A * 0x13 + 0xCA9E, o 0x8C00 en una especial) pasado a 0x7000 de la VRAM (p12:6F93) y copiado a su casilla E de p12:6E05 con la operacion 0 (la pagina 2 o 0)
siguiente_del_radar:
	pop hl			;6f2b
	pop de			;6f2c
	pop bc			;6f2d
	inc hl			;6f2e   ; la siguiente sala...
	inc e			;6f2f   ; ...y casilla
	djnz sala_del_radar		;6f30
	pop hl			;6f32
	ld a,l			;6f33   ; la fila de arriba (0x10 menos)
	sub 010h		;6f34
	ld l,a			;6f36
	pop bc			;6f37
	djnz fila_del_radar		;6f38
	ret			;6f3a

; ----------------------------------------------------------------------
; DATOS resto_6F3B: lo apuntan con el banco puesto p12:6ED7 (0x6F3B); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p12:6ED7 (6 bytes)
;   0x6f3b..0x6f41  (6 bytes)
DATA_resto_6F3B:
	defb 000h,009h,012h,019h,01fh,024h	; 6f3b

; ======================================================================
; CODIGO 0x6f41..0x704a  (265 bytes)
; ======================================================================


borra_radar:		; el recuadro de la otra pagina en 0xEE
	ld a,(0ca42h)		;6f41   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	xor 001h		;6f44
	ld d,a			;6f46
	ld a,0eeh		;6f47
pon_radar:		; el recuadro (0xC4, 0x17), 0x38 x 0x38 en el color A de la pagina D
	ld hl,0c417h		;6f49
	ld bc,03838h		;6f4c
	jp 046ffh		;6f4f   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
por_0x13:		; HL = A * 0x13
	ld l,a			;6f52   ; HL = A
	ld h,000h		;6f53
	ld b,h			;6f55   ; BC = A
	ld c,l			;6f56
	add hl,hl			;6f57   ; * 8...
	add hl,hl			;6f58
	add hl,hl			;6f59
	ld d,h			;6f5a   ; ...a DE
	ld e,l			;6f5b
	add hl,hl			;6f5c   ; * 0x20...
	add hl,hl			;6f5d
	add hl,bc			;6f5e   ; ...+ A...
	add hl,de			;6f5f   ; ...+ A * 8 = A * 0x29
	ret			;6f60
dibujo_de_sala:		; el dibujo A de la sala (A * 0x13 + 0xCA9E, o 0x8C00 en una especial) pasado a 0x7000 de la VRAM (p12:6F93) y copiado a su casilla E de p12:6E05 con la operacion 0 (la pagina 2 o 0)
	push de			;6f61
	call por_0x13		;6f62   ; por_0x13: HL = A * 0x13
	ld a,(0ca76h)		;6f65   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	and a			;6f68
	ld bc,(0ca9eh)		;6f69   ; lee los dibujos de las salas del recuadro (0x8000 + lo de la zona) y el byte siguiente (16 bits)
	jr z,L_6F72		;6f6d
	ld bc,08c00h		;6f6f   ; en una especial, 0x8C00
L_6F72:
	add hl,bc			;6f72
	call dibujo_a_7000		;6f73   ; dibujo_a_7000: con la RAM de 0x8000: los 0x2C bytes de bits de HL a puntos de color 0x0E (p12:6FC4) en 0xEA00, y de ahi 0x12 lineas de 9 bytes a 0x7000 de la VRAM, de 0x80 en 0x80
	pop de			;6f76
	ld a,e			;6f77
	ld hl,06e05h		;6f78   ; su casilla...
	call 043f6h		;6f7b   ; ...de p12:6E05
	ex de,hl			;6f7e
	ld hl,000e0h		;6f7f   ; de (0, 0xE0)...
	ld a,(0ca42h)		;6f82   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	and a			;6f85
	ld b,010h		;6f86   ; ...de la pagina 2...
	jr z,L_6F8C		;6f88
	ld b,000h		;6f8a   ; ...o la 0
L_6F8C:
	ld a,b			;6f8c
	ld bc,01212h		;6f8d   ; 0x12 x 0x12
	jp 047edh		;6f90   ; copia_rectangulo_logica: orden LMMM del VDP con la operacion logica de A
dibujo_a_7000:		; con la RAM de 0x8000: los 0x2C bytes de bits de HL a puntos de color 0x0E (p12:6FC4) en 0xEA00, y de ahi 0x12 lineas de 9 bytes a 0x7000 de la VRAM, de 0x80 en 0x80
	push hl			;6f93
	ld a,(0c386h)		;6f94   ; lee el slot de la RAM de 0x8000 (p01:7243)
	ld h,080h		;6f97
	call 00024h		;6f99   ; BIOS ENASLT - Switches to specified slot and page definitively
	di			;6f9c
	pop hl			;6f9d
	ld bc,02c0eh		;6f9e   ; 0x2C bytes, color 0x0E
	call bits_a_puntos		;6fa1   ; bits_a_puntos: B bytes de HL a 0xEA00: cada bit, un punto de 4 bits del color C (1) o 0x0F (0)
	ld a,(0c388h)		;6fa4   ; lee el registro de slots primarios del arranque
	call 0013bh		;6fa7   ; BIOS WSLREG - Writes value to the primary slot register
	ei			;6faa
	ld hl,0ea00h		;6fab   ; de 0xEA00...
	ld de,07000h		;6fae   ; ...a 0x7000...
	ld b,012h		;6fb1   ; ...0x12 lineas
L_6FB3:
	push bc			;6fb3
	xor a			;6fb4
	ld bc,00009h		;6fb5   ; 9 bytes
	call 04486h		;6fb8   ; copia_a_vram_espera: espera al VDP (p00:4650) y copia BC bytes de HL a la VRAM de DE
	ld a,080h		;6fbb   ; la linea siguiente
	call 04243h		;6fbd   ; suma_a_de: DE = DE + A
	pop bc			;6fc0
	djnz L_6FB3		;6fc1
	ret			;6fc3
bits_a_puntos:		; B bytes de HL a 0xEA00: cada bit, un punto de 4 bits del color C (1) o 0x0F (0)
	ld de,0ea00h		;6fc4
byte_a_puntos:
	push bc			;6fc7
	push hl			;6fc8
	ex de,hl			;6fc9
	ld a,(de)			;6fca
	ld d,a			;6fcb
	ld b,004h		;6fcc   ; 4 parejas
dos_puntos:
	ld a,c			;6fce
	rl d		;6fcf
	jr c,L_6FD5		;6fd1
	ld a,00fh		;6fd3   ; 0: 0x0F
L_6FD5:
	rld		;6fd5   ; el de la izquierda
	ld a,c			;6fd7
	rl d		;6fd8
	jr c,L_6FDE		;6fda
	ld a,00fh		;6fdc   ; 0: 0x0F
L_6FDE:
	rld		;6fde   ; el de la derecha
	inc hl			;6fe0
	djnz dos_puntos		;6fe1
	ex de,hl			;6fe3
	pop hl			;6fe4
	inc hl			;6fe5
	pop bc			;6fe6
	djnz byte_a_puntos		;6fe7
	ret			;6fe9
radar_en_alerta:		; cada 0xE209 cuadros, 0xE208 uno mas (0-3) y la cuenta de 8 (pares) o 4 (impares); los dos rectangulos de p12:704A (0xFF en 0xE208 = 0; si no, 0xCC con alerta 1 o 0xAA) y los dos de p12:7052 (lo mismo con 0xE208 = 2)
	ld hl,0e209h		;6fea   ; apunta a la cuenta del parpadeo del recuadro con la alerta
	dec (hl)			;6fed
	ret nz			;6fee
	dec hl			;6fef
	ld a,(hl)			;6ff0
	inc a			;6ff1
	and 003h		;6ff2   ; 0-3
	ld (hl),a			;6ff4
	rra			;6ff5
	ld a,008h		;6ff6   ; pares, 8...
	jr nc,pon_e209		;6ff8
	ld a,004h		;6ffa   ; ...impares, 4
pon_e209:
	inc hl			;6ffc
	ld (hl),a			;6ffd
rectangulos_de_alerta:		; los rectangulos de p12:704A y p12:7052 en 0xFF, 0xCC (alerta 1) o 0xAA
	ld hl,0704ah		;6ffe
	ld a,(0e208h)		;7001   ; lee el paso del parpadeo del recuadro con la alerta (0-3)
	and a			;7004
	ld c,0ffh		;7005
	jr nz,rectangulos_7052		;7007   ; con 0xE208, 0xFF
	ld a,(0ca5fh)		;7009   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	ld c,0cch		;700c
	dec a			;700e   ; alerta 1: 0xCC
	jr z,rectangulos_7052		;700f
	ld c,0aah		;7011   ; si no, 0xAA
rectangulos_7052:
	call dos_rectangulos		;7013   ; dos_rectangulos: 2 rectangulos de HL [X][Y][alto][ancho] en el color A
	ld hl,07052h		;7016
	ld a,(0e208h)		;7019   ; lee el paso del parpadeo del recuadro con la alerta (0-3)
	cp 002h		;701c   ; con 0xE208 = 2...
	ld c,0ffh		;701e
	jr nz,dos_rectangulos		;7020
	ld a,(0ca5fh)		;7022   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	ld c,0cch		;7025
	dec a			;7027
	jr z,dos_rectangulos		;7028
	ld c,0aah		;702a
dos_rectangulos:		; 2 rectangulos de HL [X][Y][alto][ancho] en el color A
	ld a,c			;702c
	ld b,002h		;702d
rectangulo_de_alerta:
	push af			;702f
	push bc			;7030
	ld d,(hl)			;7031   ; la X...
	inc hl			;7032
	ld e,(hl)			;7033   ; ...la Y...
	inc hl			;7034
	ld b,(hl)			;7035   ; ...el alto...
	inc hl			;7036
	ld c,(hl)			;7037   ; ...y el ancho
	inc hl			;7038
	push hl			;7039   ; el siguiente
	ex de,hl			;703a
	ex af,af'			;703b   ; el color aparte
	ld a,(0ca42h)		;703c   ; la pagina
	ld d,a			;703f
	ex af,af'			;7040
	call 046ffh		;7041   ; el rectangulo
	pop hl			;7044
	pop bc			;7045
	pop af			;7046
	djnz rectangulo_de_alerta		;7047   ; dos
	ret			;7049

; ----------------------------------------------------------------------
; DATOS resto_704A: lo apuntan con el banco puesto p12:6FFE (0x704A), p12:7016
;   (0x7052); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p12:6FFE, p12:7016 (16 bytes)
;   0x704a..0x705a  (16 bytes)
DATA_resto_704A:
	defb 0c4h,017h,018h,006h,0c4h,01dh,006h,012h,0e4h,049h,018h,006h,0f6h,037h,006h,012h	; 704a  .........I...7..

; ======================================================================
; CODIGO 0x705a..0x710a  (176 bytes)
; ======================================================================


punto_de_snake:		; salvo en el estado 0x11: el punto de Snake (su sitio, o el de antes de entrar en 0xCBE0) en la casilla del centro del recuadro: de color 0x0A cada 4 cuadros sin salir de la sala; con 0xE206, copiado de la otra pagina
	ld a,(0cb00h)		;705a   ; lee el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	cp 011h		;705d
	ret z			;705f
	ld a,(0ca65h)		;7060   ; lee el sitio de 0xCBE0 en el que esta Snake (0 = ninguno)
	and a			;7063
	jr nz,punto_de_e204		;7064   ; dentro de un sitio, el de antes
	ld a,(0cb03h)		;7066   ; lee la Y de Snake
	ld (0e204h),a		;7069   ; guarda la Y...
	ld a,(0cb05h)		;706c   ; lee la X de Snake
	ld (0e205h),a		;706f   ; ...y la X
punto_de_e204:
	ld de,(0e204h)		;7072   ; lee la Y de Snake antes de entrar en el sitio - 0x20 y el byte siguiente (16 bits)
	call sitio_en_el_radar		;7076   ; su punto...
	ld de,0d72ah		;7079   ; ...en la casilla del centro (0xD7, 0x2A)
	add hl,de			;707c
	ld a,(0e206h)		;707d   ; lee 1 al borrar los puntos del recuadro
	and a			;7080
	jr nz,copia_un_punto		;7081   ; con 0xE206, aparte
	ld a,(0ca42h)		;7083   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	ld d,a			;7086
	ld a,(0ca03h)		;7087   ; lee el contador de cuadros (uno mas en cada interrupcion)
	and 004h		;708a   ; parpadea cada 4 cuadros
	ret z			;708c
	ld a,(0ca41h)		;708d   ; lee la salida de la sala (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	and a			;7090
	ret nz			;7091   ; saliendo, nada
	ld e,00ah		;7092   ; el color 0x0A
	ld a,e			;7094
	ld e,000h		;7095
	jp 04840h		;7097   ; punto: orden PSET del VDP con la operacion logica de E
copia_un_punto:		; 2 x 1 de la otra pagina
	ld bc,00201h		;709a
	jp copia_de_la_otra		;709d   ; copia_de_la_otra: copia de la pagina 1 (o 4) a la misma posicion de la de 0xCA42
puntos_de_actores:		; los actores de 0xCE00 (0x18, o 0x14 dentro de un sitio) que no son 0, 0x13, 0x17, 0x18 ni el 8 con 0xD441, en una sala a uno o menos de la de Snake: su punto (p12:710F); en una especial, solo los del byte 0x1B = 1 (el 9, solo en la especial 0x18)
	ld ix,0ce00h		;70a0   ; apunta a los actores: 24 fichas de 0x40 bytes (p04:800D)
	ld a,(0ca65h)		;70a4   ; lee el sitio de 0xCBE0 en el que esta Snake (0 = ninguno)
	and a			;70a7
	ld b,018h		;70a8   ; 24...
	jr z,L_70AE		;70aa
	ld b,014h		;70ac   ; ...o 20 en un sitio
L_70AE:
	ld a,(ix+000h)		;70ae   ; lee el tipo del actor (0 = libre)
	ld c,a			;70b1
	and a			;70b2   ; libre...
	jr z,siguiente_del_radar_ce00		;70b3
	cp 017h		;70b5   ; ...0x17...
	jr z,siguiente_del_radar_ce00		;70b7
	cp 018h		;70b9   ; ...0x18...
	jr z,siguiente_del_radar_ce00		;70bb
	cp 013h		;70bd   ; ...o 0x13: nada
	jr z,siguiente_del_radar_ce00		;70bf
	cp 008h		;70c1   ; el 8...
	jr nz,actor_en_el_radar		;70c3
	ld a,(0d441h)		;70c5   ; ...con 0xD441, nada
	and a			;70c8
	jr nz,siguiente_del_radar_ce00		;70c9
actor_en_el_radar:
	ld a,(0ca76h)		;70cb   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	ld d,a			;70ce
	and a			;70cf
	ld a,(ix+01bh)		;70d0
	jr z,actor_cerca		;70d3   ; sin especial, con el byte 0x1B = 0
	dec a			;70d5   ; en una especial, el 1
	jr nz,siguiente_del_radar_ce00		;70d6
	ld e,a			;70d8
	ld a,(ix+000h)		;70d9   ; lee el tipo del actor (0 = libre)
	cp 009h		;70dc   ; el 9...
	ld a,e			;70de
	jr nz,actor_cerca		;70df
	ld a,d			;70e1   ; ...solo en la especial 0x18
	cp 018h		;70e2
	jr nz,siguiente_del_radar_ce00		;70e4
actor_cerca:
	and a			;70e6
	jr nz,siguiente_del_radar_ce00		;70e7
	ld a,(0ca50h)		;70e9   ; la fila a uno o menos...
	sub (ix+00ah)		;70ec   ; le resta la fila de la sala del actor
	inc a			;70ef
	cp 003h		;70f0
	jr nc,siguiente_del_radar_ce00		;70f2
	ld a,(0ca51h)		;70f4   ; ...y la columna
	sub (ix+00bh)		;70f7   ; le resta la columna de la sala del actor
	inc a			;70fa
	cp 003h		;70fb
	exx			;70fd
	call c,punto_de_actor		;70fe   ; su punto
	exx			;7101
siguiente_del_radar_ce00:		; el siguiente (0x40 bytes)
	ld de,00040h		;7102
	add ix,de		;7105
	djnz L_70AE		;7107
	ret			;7109

; ----------------------------------------------------------------------
; DATOS sin identificar  0x710a..0x710f  (5 bytes)
DATA_710A:
	defb 03eh,001h,032h,006h,0e2h	; 710a

; ======================================================================
; CODIGO 0x710f..0x7435  (806 bytes)
; ======================================================================


punto_de_actor:		; el punto del actor IX en su casilla: los de 0xD800 en adelante (C = 1) solo con el byte 1 por debajo de 0x20 (el tipo 1 desde el 3, 0x20 mas arriba y a la izquierda; recortados a la casilla); de color 0x0A el 3 y el 6 con el byte 1 por debajo de 3 (el 6 desde 9, nada), el 0x15 cada 4 cuadros, los otros del color de la pagina
	ld d,(ix+005h)		;710f   ; la X...
	ld e,(ix+003h)		;7112   ; ...y la Y
	push hl			;7115
	push de			;7116
	push ix		;7117
	pop hl			;7119
	ld de,0d800h		;711a   ; apunta a 4 fichas de 0x20 bytes de 0xD800 (p04:89C3); sus tipos los lleva p10
	call 00020h		;711d   ; BIOS DCOMPR - Compares HL with DE | antes de 0xD800?
	pop de			;7120
	pop hl			;7121
	ld c,000h		;7122   ; de 0xCE00: C = 0
	jr c,punto_en_casilla		;7124
	ld c,001h		;7126   ; de 0xD800: C = 1
	ld a,(ix+001h)		;7128
	cp 020h		;712b   ; desde 0x20, nada
	ret nc			;712d
	ld a,(ix+000h)		;712e
	cp 001h		;7131   ; el 1...
	jr nz,punto_en_casilla		;7133
	ld a,(ix+001h)		;7135
	cp 003h		;7138   ; ...desde 3...
	jr c,punto_en_casilla		;713a
	ld a,d			;713c   ; ...0x20 a la izquierda...
	sub 020h		;713d
	ld d,a			;713f
	ld a,e			;7140
	sub 020h		;7141   ; ...y arriba
	ld e,a			;7143
punto_en_casilla:
	push bc			;7144
	call sitio_en_el_radar		;7145   ; sitio_en_el_radar: HL = el punto del recuadro de (E, D): cada uno por p12:6DEF
	pop bc			;7148
	ld a,c			;7149
	and a			;714a
	jr z,punto_de_la_sala		;714b   ; de 0xCE00, asi
	ld a,h			;714d
	cp 012h		;714e   ; pasado de la casilla...
	jr c,L_7155		;7150
	sub 019h		;7152   ; ...0x19 menos
	ld h,a			;7154
L_7155:
	ld a,l			;7155
	cp 012h		;7156   ; lo mismo en Y
	jr c,punto_de_la_sala		;7158
	sub 019h		;715a
	ld l,a			;715c
punto_de_la_sala:
	push bc			;715d
	call casilla_del_actor		;715e   ; + su casilla
	pop bc			;7161
	ld a,l			;7162
	cp 016h		;7163   ; por encima del recuadro, nada
	ret c			;7165
	ld a,(0e206h)		;7166   ; lee 1 al borrar los puntos del recuadro
	and a			;7169
	jp nz,copia_un_punto		;716a   ; con 0xE206, copiado
	ld a,(0ca42h)		;716d   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	ld b,a			;7170
	ld a,c			;7171
	and a			;7172
	jr z,punto_normal		;7173   ; de 0xCE00, aparte
	ld a,(ix+001h)		;7175
	ld c,a			;7178
	ld a,(ix+000h)		;7179
	cp 003h		;717c   ; el 3...
	jr z,punto_0a		;717e
	cp 006h		;7180   ; ...o el 6...
	jr nz,punto_normal		;7182
	ld a,c			;7184
	cp 009h		;7185   ; ...desde 9, nada
	ret nc			;7187
	jr nz,punto_normal		;7188
punto_0a:
	ld a,c			;718a
	cp 003h		;718b   ; desde 3, el normal
	jr nc,punto_normal		;718d
	ld d,b			;718f
	ld a,00ah		;7190   ; de color 0x0A
	jp punto_c		;7192   ; punto_c:
punto_normal:
	ld a,(ix+000h)		;7195
	cp 015h		;7198   ; el 0x15...
	jr nz,punto_de_pagina		;719a
	ld a,(0ca03h)		;719c   ; lee el contador de cuadros (uno mas en cada interrupcion)
	and 004h		;719f   ; ...cada 4 cuadros
	ret z			;71a1
punto_de_pagina:
	ld a,b			;71a2
	jp punto_7		;71a3   ; punto_7: un punto de color 7 en la pagina A
casilla_del_actor:		; HL += la casilla del recuadro de la sala del actor IX (p12:71AC)
	ld b,(ix+00ah)		;71a6
	ld c,(ix+00bh)		;71a9
casilla_de_sala:		; HL = DE + la esquina de la casilla de p12:6E05 de la sala (B fila, C columna) respecto a la de Snake
	ld a,(0ca50h)		;71ac   ; lee la fila de la sala en la zona (uno mas al salir por arriba)
	cp b			;71af   ; por encima...
	ld b,000h		;71b0
	jr c,L_71BA		;71b2
	ld b,003h		;71b4   ; ...la misma...
	jr z,L_71BA		;71b6
	ld b,006h		;71b8   ; ...o por debajo
L_71BA:
	inc b			;71ba   ; la columna de enmedio
	inc b			;71bb
	ld a,(0ca51h)		;71bc   ; lee la columna de la sala en la zona (uno mas al salir por la derecha)
	cp c			;71bf   ; a la derecha...
	jr c,suma_casilla		;71c0
	ex af,af'			;71c2
	dec b			;71c3   ; ...la misma...
	ex af,af'			;71c4
	jr z,suma_casilla		;71c5
	dec b			;71c7   ; ...o a la izquierda
suma_casilla:
	ex de,hl			;71c8
	ld a,b			;71c9
	ld hl,06e05h		;71ca   ; la esquina de p12:6E05
	call 043f6h		;71cd   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld a,h			;71d0
	add a,d			;71d1
	ld h,a			;71d2
	ld a,l			;71d3
	add a,e			;71d4
	ld l,a			;71d5
	ret			;71d6
puntos_de_d800:		; las marcas de las 3 fichas de 0xD800 (en una especial, solo la de 0xD860)
	ld a,(0ca76h)		;71d7   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	and a			;71da
	ld ix,0d800h		;71db   ; apunta a 4 fichas de 0x20 bytes de 0xD800 (p04:89C3); sus tipos los lleva p10
	ld b,003h		;71df   ; 3...
	jr z,punto_d800		;71e1
	ld ix,0d860h		;71e3   ; ...o la de 0xD860
	ld b,001h		;71e7
punto_d800:
	push bc			;71e9
	call marca_de_d800		;71ea   ; marca_de_d800: la ficha IX en una sala a uno o menos (el 5 solo con 0xCA3C; el 7 sin su byte 0x14): el 2 y el 1 por debajo de 4, una marca de 3 x 5 (el 2 en su sitio - (0x10, 0x30); el 1 en (0x50, 0)); los otros, su punto (p12:710F)
	ld bc,00020h		;71ed   ; la siguiente (0x20 bytes)
	add ix,bc		;71f0
	pop bc			;71f2
	djnz punto_d800		;71f3
	ret			;71f5
marca_de_d800:		; la ficha IX en una sala a uno o menos (el 5 solo con 0xCA3C; el 7 sin su byte 0x14): el 2 y el 1 por debajo de 4, una marca de 3 x 5 (el 2 en su sitio - (0x10, 0x30); el 1 en (0x50, 0)); los otros, su punto (p12:710F)
	ld a,(ix+000h)		;71f6
	and a			;71f9
	ret z			;71fa   ; libre, nada
	ld a,(0ca3ch)		;71fb
	and a			;71fe
	jr nz,marca_d800_7		;71ff   ; con 0xCA3C, asi
	ld a,(ix+000h)		;7201
	cp 005h		;7204   ; el 5, nada
	ret z			;7206
marca_d800_7:
	ld a,(ix+000h)		;7207
	cp 007h		;720a   ; el 7...
	jr nz,marca_d800_cerca		;720c
	ld a,(ix+014h)		;720e   ; ...con su byte 0x14, nada
	and a			;7211
	ret nz			;7212
marca_d800_cerca:
	ld a,(0ca50h)		;7213   ; lee la fila de la sala en la zona (uno mas al salir por arriba)
	sub (ix+00ah)		;7216   ; la fila a uno o menos...
	inc a			;7219
	cp 003h		;721a
	ret nc			;721c
	ld a,(0ca51h)		;721d   ; lee la columna de la sala en la zona (uno mas al salir por la derecha)
	sub (ix+00bh)		;7220   ; ...y la columna
	inc a			;7223
	cp 003h		;7224
	ret nc			;7226
	ld a,(ix+000h)		;7227
	cp 002h		;722a   ; el 2, aparte
	jr z,marca_del_2		;722c
	cp 001h		;722e   ; sin el 1, su punto
	jp nz,punto_de_actor		;7230   ; punto_de_actor: el punto del actor IX en su casilla: los de 0xD800 en adelante (C = 1) solo con el byte 1 por debajo de 0x20 (el tipo 1 desde el 3, 0x20 mas arriba y a la izquierda; recortados a la casilla); de color 0x0A el 3 y el 6 con el byte 1 por debajo de 3 (el 6 desde 9, nada), el 0x15 cada 4 cuadros, los otros del color de la pagina
	ld a,(ix+001h)		;7233
	cp 004h		;7236   ; desde 4, su punto
	jp nc,punto_de_actor		;7238   ; punto_de_actor: el punto del actor IX en su casilla: los de 0xD800 en adelante (C = 1) solo con el byte 1 por debajo de 0x20 (el tipo 1 desde el 3, 0x20 mas arriba y a la izquierda; recortados a la casilla); de color 0x0A el 3 y el 6 con el byte 1 por debajo de 3 (el 6 desde 9, nada), el 0x15 cada 4 cuadros, los otros del color de la pagina
	ld de,05000h		;723b   ; en (0x50, 0)
	jr pon_marca_d800		;723e
marca_del_2:		; su X - 0x10...
	ld a,(ix+005h)		;7240
	sub 010h		;7243
	ld d,a			;7245
	ld a,(ix+003h)		;7246   ; ...y su Y - 0x30
	sub 030h		;7249
	ld e,a			;724b
pon_marca_d800:
	call sitio_en_el_radar		;724c   ; sitio_en_el_radar: HL = el punto del recuadro de (E, D): cada uno por p12:6DEF
	call casilla_del_actor		;724f   ; casilla_del_actor: HL += la casilla del recuadro de la sala del actor IX (p12:71AC)
	ld a,(0e206h)		;7252   ; lee 1 al borrar los puntos del recuadro
	and a			;7255
	jp nz,copia_la_marca		;7256   ; con 0xE206, copiada
	ld bc,00307h		;7259   ; 3 rayas de 5
raya_de_marca:
	push hl			;725c
	push bc			;725d
	ld b,005h		;725e
	ld a,(0ca42h)		;7260   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	call 04680h		;7263   ; linea_vertical: orden LINE del VDP con el lado largo en Y (ARG = 1)
	pop bc			;7266
	pop hl			;7267
	inc h			;7268   ; la columna siguiente
	djnz raya_de_marca		;7269
	ret			;726b
copia_la_marca:		; 4 x 5 de la otra pagina
	ld bc,00405h		;726c
	jp copia_de_la_otra		;726f   ; copia_de_la_otra: copia de la pagina 1 (o 4) a la misma posicion de la de 0xCA42
puntos_de_la_columna_7:		; en la columna 7: en la especial 0x2A sin el bit 7 de 0xD7D5, un punto en (0xEC, 0x34); en la 0x26 sin los bits 5 y 6 de 0xD7D3, en (0xF3, 0x34)
	ld a,(0ca51h)		;7272   ; lee la columna de la sala en la zona (uno mas al salir por la derecha)
	cp 007h		;7275
	ret nz			;7277
	ld a,(0ca76h)		;7278   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 02ah		;727b   ; la 0x2A, aparte
	jr z,punto_de_2a		;727d
	cp 026h		;727f   ; la 0x26...
	ret nz			;7281
	ld a,(0d7d3h)		;7282   ; ...sin el bit 6...
	ld b,a			;7285
	and 040h		;7286
	ret nz			;7288
	ld a,b			;7289   ; ...ni el 5
	and 020h		;728a
	ret nz			;728c
	ld hl,0f334h		;728d
punto_de_pagina_b:
	ld a,(0ca42h)		;7290   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	jp punto_7		;7293   ; punto_7: un punto de color 7 en la pagina A
punto_de_2a:
	ld a,(0d7d5h)		;7296
	and 080h		;7299   ; con el bit 7, nada
	ret nz			;729b
	ld hl,0ec34h		;729c
	jr punto_de_pagina_b		;729f
dibujos_del_radar:		; fuera de las especiales y sin 0xCA77: en la zona 1 (filas 8-9, columnas 1-4) o la 4 (filas 5-7, columnas 1-3), los 3 x 3 bytes de p56:B68A-B6B2 de la sala: cada uno distinto de 0, su dibujo (p12:731B)
	ld a,(0ca76h)		;72a1   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	and a			;72a4
	ret nz			;72a5
	ld a,(0ca77h)		;72a6
	and a			;72a9
	ret nz			;72aa
	ld bc,(0ca50h)		;72ab   ; lee la fila de la sala en la zona (uno mas al salir por arriba) y el byte siguiente (16 bits)
	ld a,(0ca4ah)		;72af   ; lee la zona
	cp 004h		;72b2
	jr z,dibujos_zona_4		;72b4   ; la zona 4, aparte
	dec a			;72b6   ; la 1...
	ret nz			;72b7
	ld a,b			;72b8   ; ...filas 8-9...
	sub 008h		;72b9
	ld b,a			;72bb
	cp 002h		;72bc
	ret nc			;72be
	ld a,c			;72bf   ; ...columnas 1-4
	dec a			;72c0
	ld c,a			;72c1
	cp 004h		;72c2
	ret nc			;72c4
	ld a,c			;72c5
	ld hl,0b6adh		;72c6   ; la 1: p56:B6AD
	dec a			;72c9
	jr z,dibujos_3_x_3		;72ca
	ld hl,0b6a8h		;72cc   ; la 2: p56:B6A8
	dec a			;72cf
	jr z,dibujos_3_x_3		;72d0
	ld hl,0b6a3h		;72d2   ; la 3: p56:B6A3
	dec a			;72d5
	jr z,dibujos_3_x_3		;72d6
	ld hl,0b6b2h		;72d8   ; la 4: p56:B6B2
	jr dibujos_3_x_3		;72db
dibujos_zona_4:		; columnas 1-3...
	ld a,c			;72dd
	dec a			;72de
	ld c,a			;72df
	cp 003h		;72e0
	ret nc			;72e2
	ld a,b			;72e3   ; ...filas 5-7
	sub 005h		;72e4
	ld b,a			;72e6
	cp 003h		;72e7
	ret nc			;72e9
	ld a,c			;72ea
	ld hl,0b68fh		;72eb   ; la 2: p56:B68F
	cp 001h		;72ee
	jr z,dibujos_3_x_3		;72f0
	ld hl,0b68ah		;72f2   ; la 3: p56:B68A
	jr nc,dibujos_3_x_3		;72f5
	ld hl,0b694h		;72f7   ; la 1: p56:B694
dibujos_3_x_3:		; + la fila
	ld a,b			;72fa
	call 0423eh		;72fb   ; suma_a_hl: HL = HL + A
	ld b,003h		;72fe   ; 3 filas...
	ld d,000h		;7300   ; ...desde la casilla 0
fila_de_dibujos:		; 3 columnas
	ld c,003h		;7302
dibujo_de_casilla:
	ld a,(hl)			;7304
	and a			;7305   ; 0, nada
	jr z,siguiente_casilla		;7306
	push hl			;7308
	push de			;7309
	push bc			;730a
	call dibujo_de_byte		;730b   ; dibujo_de_byte: por el byte y la zona: en la 1, el 1 p56:B60C y otro p56:B58E; en la 4, el 1 p56:B492, el 2 p56:B510 y otro el de las fichas (p12:7389); pasado a la VRAM (p12:7372) y copiado a la casilla D + 3 en las dos paginas (en la de dibujo, sin 0xD455), salvo con 0xCB21 = 2
	pop bc			;730e
	pop de			;730f
	pop hl			;7310
siguiente_casilla:
	inc hl			;7311
	inc d			;7312
	dec c			;7313
	jr nz,dibujo_de_casilla		;7314
	inc hl			;7316   ; la fila siguiente (5 bytes)
	inc hl			;7317
	djnz fila_de_dibujos		;7318
	ret			;731a
dibujo_de_byte:		; por el byte y la zona: en la 1, el 1 p56:B60C y otro p56:B58E; en la 4, el 1 p56:B492, el 2 p56:B510 y otro el de las fichas (p12:7389); pasado a la VRAM (p12:7372) y copiado a la casilla D + 3 en las dos paginas (en la de dibujo, sin 0xD455), salvo con 0xCB21 = 2
	ld a,(0ca4ah)		;731b   ; lee la zona
	dec a			;731e   ; la zona 1, aparte
	jr z,dibujo_zona_1		;731f
	ld a,(hl)			;7321
	dec a			;7322   ; el 1: p56:B492
	ld hl,0b492h		;7323
	jr z,dibujo_a_casilla		;7326
	dec a			;7328   ; el 2: p56:B510
	ld hl,0b510h		;7329
	jr nz,fichas_al_radar		;732c   ; otro, las fichas
	jr dibujo_a_casilla		;732e
dibujo_zona_1:
	ld a,(hl)			;7330
	dec a			;7331   ; el 1: p56:B60C
	ld hl,0b60ch		;7332
	jr z,dibujo_a_casilla		;7335
	ld hl,0b58eh		;7337   ; otro: p56:B58E
dibujo_a_casilla:
	push de			;733a
	call dibujo_a_vram		;733b   ; a 0x7000 de la VRAM
	pop de			;733e
	ld a,d			;733f
	ex de,hl			;7340
	ld hl,06e05h		;7341   ; la esquina de la casilla
	call 043f6h		;7344   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ex de,hl			;7347
	inc e			;7348   ; 3 mas abajo
	inc e			;7349
	inc e			;734a
	ld a,(0ca42h)		;734b   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	ld b,a			;734e
	ld a,(0d455h)		;734f
	and a			;7352   ; sin 0xD455, tambien en esta
	push de			;7353
	ld a,b			;7354
	push af			;7355
	call z,copia_dibujo_de_casilla		;7356   ; copia_dibujo_de_casilla: salvo con 0xCB21 = 2: de (0, 0xE0) de la pagina 2 (o 0), 0x12 x 0x0E
	pop af			;7359
	pop de			;735a
	xor 001h		;735b   ; la otra pagina
copia_dibujo_de_casilla:		; salvo con 0xCB21 = 2: de (0, 0xE0) de la pagina 2 (o 0), 0x12 x 0x0E
	ex af,af'			;735d
	ld a,(0cb21h)		;735e   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	cp 002h		;7361
	ret z			;7363
	ex af,af'			;7364
	rlca			;7365
	rlca			;7366
	rlca			;7367
	rlca			;7368
	ld hl,000e0h		;7369
	ld bc,0120eh		;736c
	jp 047edh		;736f   ; copia_rectangulo_logica: orden LMMM del VDP con la operacion logica de A
dibujo_a_vram:		; 0x0E lineas de 9 bytes de HL a 0x7000 de la VRAM, de 0x80 en 0x80
	ld de,07000h		;7372
	ld b,00eh		;7375
linea_a_vram:
	push bc			;7377
	ld bc,00009h		;7378   ; 9 bytes
	xor a			;737b
	call 04486h		;737c   ; copia_a_vram_espera: espera al VDP (p00:4650) y copia BC bytes de HL a la VRAM de DE
	ex de,hl			;737f   ; la linea siguiente...
	ld bc,00080h		;7380   ; ...0x80 mas
	add hl,bc			;7383
	ex de,hl			;7384
	pop bc			;7385
	djnz linea_a_vram		;7386   ; 0x0E lineas
	ret			;7388
fichas_al_radar:		; en la casilla D: los 16 sitios de p56:B709 salvo los 3 de la fila de p56:B6E9 de 0xD42D (en la sala 6; fuera de ella todos): su punto en las dos paginas, y en la sala 6 la pieza de 2 x 4 (p12:7403) y su mapa (p12:7445)
	ld a,d			;7389
	ld (0d8e0h),a		;738a   ; la casilla a 0xD8E0
	call fila_d42d		;738d   ; la fila de 0xD42D
	ld c,(hl)			;7390   ; los tres que no
	inc hl			;7391
	inc hl			;7392
	ld d,(hl)			;7393
	inc hl			;7394
	inc hl			;7395
	ld e,(hl)			;7396
	ld a,(0ca4bh)		;7397   ; lee la sala de la zona
	cp 006h		;739a   ; fuera de la sala 6...
	jr z,sitios_b709		;739c
	ld c,0ffh		;739e   ; ...todos
	ld d,c			;73a0
	ld e,c			;73a1
sitios_b709:		; los de p56:B709
	ld hl,0b709h		;73a2
	ld b,010h		;73a5   ; 16
sitio_b709:
	push bc			;73a7
	push de			;73a8
	push hl			;73a9
	ld a,b			;73aa   ; el numero (0-15)
	sub 010h		;73ab
	neg		;73ad
	cp c			;73af   ; uno de los tres: nada
	jr z,siguiente_b709		;73b0
	cp d			;73b2
	jr z,siguiente_b709		;73b3
	cp e			;73b5
	jr z,siguiente_b709		;73b6
	ld e,(hl)			;73b8   ; su sitio
	inc hl			;73b9
	ld d,(hl)			;73ba
	push de			;73bb
	call sitio_en_el_radar		;73bc   ; su punto...
	ex de,hl			;73bf
	ld a,(0d8e0h)		;73c0   ; ...en la casilla
	ld hl,06e05h		;73c3
	call 043f6h		;73c6   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	add hl,de			;73c9
	ld a,(0ca42h)		;73ca   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	ld b,a			;73cd
	ld a,(0d455h)		;73ce
	and a			;73d1   ; sin 0xD455, tambien en esta
	push hl			;73d2
	ld a,b			;73d3
	push af			;73d4
	call z,punto_sin_cb21_2		;73d5   ; punto_sin_cb21_2: el punto de la pagina A salvo con 0xCB21 = 2
	pop af			;73d8
	pop hl			;73d9
	xor 001h		;73da   ; y en la otra
	call punto_sin_cb21_2		;73dc   ; punto_sin_cb21_2: el punto de la pagina A salvo con 0xCB21 = 2
	pop de			;73df
	ld a,d			;73e0   ; su sitio - (0x1F, 8)
	sub 008h		;73e1
	ld d,a			;73e3
	ld a,e			;73e4
	sub 01fh		;73e5
	ld e,a			;73e7
	push de			;73e8
	call pieza_2_x_4		;73e9   ; pieza_2_x_4: en la sala 6: 0xCA4C-0xCA4D = 0x0200 y una pieza de 2 x 4 caracteres en X = D, Y = E: la de p56:B6C1 o p56:B6C9 al azar
	pop hl			;73ec
	call mapa_de_la_pieza		;73ed   ; mapa_de_la_pieza: salvo con 0xCB21 = 2, en la sala 6: p12:7451
siguiente_b709:
	pop hl			;73f0
	pop de			;73f1
	pop bc			;73f2
	inc hl			;73f3   ; el siguiente (2 bytes)
	inc hl			;73f4
	djnz sitio_b709		;73f5
	ret			;73f7
punto_sin_cb21_2:		; el punto de la pagina A salvo con 0xCB21 = 2
	ld d,a			;73f8
	ld a,(0cb21h)		;73f9   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	cp 002h		;73fc
	ld a,d			;73fe
	ret z			;73ff
	jp punto_7		;7400   ; punto_7: un punto de color 7 en la pagina A
pieza_2_x_4:		; en la sala 6: 0xCA4C-0xCA4D = 0x0200 y una pieza de 2 x 4 caracteres en X = D, Y = E: la de p56:B6C1 o p56:B6C9 al azar
	ld a,(0ca4bh)		;7403   ; lee la sala de la zona
	cp 006h		;7406
	ret nz			;7408
	ld hl,00200h		;7409
	ld (0ca4ch),hl		;740c   ; guarda los 4 bits altos del byte de la sala (p56:BD28) y el byte siguiente (16 bits)
	call 04256h		;740f   ; al azar...
	rra			;7412
	ld hl,0b6c1h		;7413   ; ...p56:B6C1...
	jr c,pieza_b_x_c		;7416
	ld hl,0b6c9h		;7418   ; ...o p56:B6C9
pieza_b_x_c:		; B x C caracteres de HL en (E, D), de 8 en 8
	ld bc,00204h		;741b
fila_de_pieza:
	push bc			;741e
	push de			;741f
caracter_de_pieza:
	ld a,(hl)			;7420
	call 04a8ch		;7421   ; pieza_de_sala_transparente: el caracter A de la sala, con el 0 transparente, a la otra pagina
	inc hl			;7424
	ld a,d			;7425   ; 8 a la derecha
	add a,008h		;7426
	ld d,a			;7428
	djnz caracter_de_pieza		;7429
	pop de			;742b
	pop bc			;742c
	ld a,e			;742d   ; 8 mas abajo
	add a,008h		;742e
	ld e,a			;7430
	dec c			;7431
	jr nz,fila_de_pieza		;7432
	ret			;7434

; ----------------------------------------------------------------------
; DATOS resto_7435: lo apuntan con el banco puesto p05:BD0A (0x7435), p05:BD32
;   (0x743D); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p05:BD0A, p05:BD32 (16 bytes)
;   0x7435..0x7445  (16 bytes)
DATA_resto_7435:
	defb 005h,006h,001h,002h,007h,008h,003h,004h,009h,00ah,00dh,00eh,00fh,00bh,010h,00ch	; 7435  ................

; ======================================================================
; CODIGO 0x7445..0x7601  (444 bytes)
; ======================================================================


mapa_de_la_pieza:		; salvo con 0xCB21 = 2, en la sala 6: p12:7451
	ld a,(0cb21h)		;7445   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	cp 002h		;7448
	ret z			;744a
	ld a,(0ca4bh)		;744b   ; lee la sala de la zona
	cp 006h		;744e
	ret nz			;7450
mapa_2_x_3:		; en el mapa, 2 x 3 casillas a 0x80 desde el sitio HL
	call 04411h		;7451   ; punto_a_mapa: H = X, L = Y en puntos; A = X / 8, la columna
	ld bc,00380h		;7454   ; 3 filas, 0x80
fila_de_mapa:
	ld (hl),c			;7457
	inc hl			;7458
	ld (hl),c			;7459
	ld a,017h		;745a   ; la fila siguiente (0x18)
	call 0423eh		;745c   ; suma_a_hl: HL = HL + A
	djnz fila_de_mapa		;745f
	ret			;7461
piezas_de_la_sala:		; en la zona 4, sala 6: las fichas de la casilla 4 (p12:7389); en la zona 1 (p12:746B)
	ld a,(0ca4ah)		;7462   ; lee la zona
	cp 004h		;7465
	jr z,fichas_zona_4_sala_6		;7467   ; la zona 4, aparte
	dec a			;7469
	ret nz			;746a
piezas_zona_1:		; en la zona 1 fuera de las especiales: 0xCA4C-0xCA4D = 0x0706; en la sala 8, 4 piezas de los sitios de p56:B733 (la primera de p56:B6D9, las otras p56:B6D1); en la 0x0D, 1 de p56:B729; cada una con su mapa
	ld a,(0ca4ah)		;746b   ; lee la zona
	dec a			;746e
	ret nz			;746f
	ld a,(0ca76h)		;7470   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	and a			;7473
	ret nz			;7474
	ld hl,00706h		;7475
	ld (0ca4ch),hl		;7478   ; guarda los 4 bits altos del byte de la sala (p56:BD28) y el byte siguiente (16 bits)
	ld a,(0ca4bh)		;747b   ; lee la sala de la zona
	cp 008h		;747e   ; la sala 8...
	jr z,piezas_sala_8		;7480
	cp 00dh		;7482   ; ...o la 0x0D
	ret nz			;7484
	ld hl,0b729h		;7485   ; los sitios de p56:B729...
	ld bc,00501h		;7488   ; ...1
	jr pieza_de_sitio		;748b
piezas_sala_8:		; los de p56:B733...
	ld hl,0b733h		;748d
	ld bc,00a04h		;7490   ; ...4
pieza_de_sitio:		; su sitio
	ld e,(hl)			;7493
	inc hl			;7494
	ld d,(hl)			;7495
	inc hl			;7496
	push bc			;7497
	push hl			;7498
	push de			;7499
	ld a,c			;749a
	rla			;749b   ; la primera...
	ld hl,0b6d1h		;749c   ; ...p56:B6D1...
	jr c,L_74A4		;749f
	ld hl,0b6d9h		;74a1   ; ...o p56:B6D9
L_74A4:
	call pieza_b_x_c		;74a4   ; pieza_b_x_c: B x C caracteres de HL en (E, D), de 8 en 8
	pop hl			;74a7
	call mapa_2_x_3		;74a8   ; su mapa
	pop hl			;74ab
	pop bc			;74ac
	dec c			;74ad
	djnz pieza_de_sitio		;74ae
	ret			;74b0
fichas_zona_4_sala_6:
	ld a,(0ca4bh)		;74b1   ; lee la sala de la zona
	cp 006h		;74b4
	ret nz			;74b6
	ld d,004h		;74b7   ; la casilla 4
	jp fichas_al_radar		;74b9   ; fichas_al_radar: en la casilla D: los 16 sitios de p56:B709 salvo los 3 de la fila de p56:B6E9 de 0xD42D (en la sala 6; fuera de ella todos): su punto en las dos paginas, y en la sala 6 la pieza de 2 x 4 (p12:7403) y su mapa (p12:7445)
aviso_d458:		; el aviso de 0xD458 ([que y bits][cuenta][Y][X][fila][columna]): la primera vez, guarda lo de debajo y lo pinta (p12:74F4); despues cuenta y al acabar, 0xCA28 = 0, la ficha libre y, en la sala del aviso, lo de debajo de vuelta (p12:74CB)
	ld hl,0d458h		;74bc   ; apunta a el aviso sobre un actor: [que y bits][cuenta][Y][X][fila][columna]
	ld a,(hl)			;74bf
	and a			;74c0
	ret z			;74c1   ; sin aviso, nada
	and 040h		;74c2   ; aun sin pintar, aparte
	jr z,pinta_aviso		;74c4
	ld a,(hl)			;74c6
	inc hl			;74c7
	dec (hl)			;74c8   ; la cuenta
	dec hl			;74c9
	ret nz			;74ca
quita_aviso:		; 0xCA28 = 0, 0xD458 libre y, en la misma sala, lo de debajo de vuelta: el 1, 0x10 x 0x10 desde (0xC0, 0x80); los otros por p12:7579
	ex af,af'			;74cb
	xor a			;74cc
	ld (0ca28h),a		;74cd
	ld (hl),a			;74d0
	inc hl			;74d1
	inc hl			;74d2
	ld e,(hl)			;74d3   ; el sitio
	inc hl			;74d4
	ld d,(hl)			;74d5
	inc hl			;74d6
	ld bc,(0ca50h)		;74d7   ; en la misma sala...
	ld a,c			;74db
	cp (hl)			;74dc
	ret nz			;74dd
	inc hl			;74de
	ld a,b			;74df
	cp (hl)			;74e0
	ret nz			;74e1
	ex af,af'			;74e2
	ld b,a			;74e3   ; el 1...
	and 03fh		;74e4
	dec a			;74e6
	ld a,b			;74e7
	jp nz,quita_letrero		;74e8   ; ...los otros, aparte
	ld hl,0c080h		;74eb   ; de (0xC0, 0x80)...
	ld bc,01010h		;74ee   ; ...0x10 x 0x10
	jp 0475ah		;74f1   ; copia_rectangulo_a_la_otra: p00:4767 de la pagina 0xCA42 a la otra
pinta_aviso:		; con el bit 6 ya pintado: el 1 guarda 0x10 x 0x10 de su sitio en (0xC0, 0x80) y pone encima el dibujo de (8, 0xB0); los otros guardan 0x5A (con el bit 7) o 0x3A x 0x10 en (0, 0xE0) y pintan un recuadro de 0x0C de alto con marco y el letrero de p12:7601
	set 6,(hl)		;74f4
	ld a,(hl)			;74f6
	ld b,a			;74f7
	inc hl			;74f8
	inc hl			;74f9
	ld e,(hl)			;74fa   ; su sitio
	inc hl			;74fb
	ld d,(hl)			;74fc
	and 03fh		;74fd
	dec a			;74ff   ; el 1?
	jr nz,aviso_con_letrero		;7500
	push de			;7502
	ex de,hl			;7503
	ld de,0c080h		;7504   ; lo de debajo a (0xC0, 0x80)
	ld bc,01010h		;7507
	push bc			;750a
	call 0474dh		;750b   ; copia_rectangulo_a_esta: p00:4767 de la otra pagina (0xCA42 ^ 1) a la de 0xCA42
	pop bc			;750e
	pop de			;750f
	ld hl,008b0h		;7510   ; el dibujo de (8, 0xB0)...
	ld a,(0ca42h)		;7513   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	rrca			;7516
	rrca			;7517
	rrca			;7518
	rrca			;7519
	or 0c8h		;751a   ; ...con la operacion 0xC8
	jp 047edh		;751c   ; copia_rectangulo_logica: orden LMMM del VDP con la operacion logica de A
aviso_con_letrero:
	push de			;751f
	push bc			;7520
	ex de,hl			;7521
	ld de,000e0h		;7522   ; lo de debajo a (0, 0xE0)...
	ld bc,05a10h		;7525   ; ...0x5A x 0x10
	ld a,(0ca42h)		;7528   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	push hl			;752b
	call 04767h		;752c   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
	pop hl			;752f
	pop af			;7530
	rla			;7531   ; con el bit 7...
	ld b,058h		;7532   ; ...0x58 de ancho...
	jr c,recuadro_de_aviso		;7534
	ld b,038h		;7536   ; ...o 0x38
recuadro_de_aviso:		; 0x0C de alto
	ld c,00ch		;7538
	ld a,(0ca42h)		;753a   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	ld d,a			;753d
	ld a,099h		;753e   ; el color 0x99
	push hl			;7540
	push bc			;7541
	call 046ffh		;7542   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
	pop de			;7545
	pop hl			;7546
	ld c,007h		;7547   ; el marco de color 7
	ld a,(0ca42h)		;7549   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	call 046bch		;754c   ; marco: cuatro lineas: un marco de D x E desde HL
	ld a,(0d458h)		;754f   ; el numero - 2...
	and 03fh		;7552
	sub 002h		;7554
	ld b,a			;7556   ; ...* 3...
	add a,a			;7557
	add a,b			;7558
	ld hl,07601h		;7559   ; ...de p12:7601 [letrero][columna]
	call 0423eh		;755c   ; suma_a_hl: HL = HL + A
	ld e,(hl)			;755f
	inc hl			;7560
	ld d,(hl)			;7561
	inc hl			;7562
	ld a,(hl)			;7563
	ex de,hl			;7564
	pop de			;7565
	add a,d			;7566   ; + la columna...
	ld d,a			;7567
	ld a,e			;7568   ; ...y 2 mas abajo
	add a,002h		;7569
	ld e,a			;756b
letra_de_aviso:
	ld a,(hl)			;756c
	ld c,a			;756d
	inc c			;756e   ; 0xFF: se acaba
	ret z			;756f
	call 05d18h		;7570   ; pinta_letra: pinta la letra A en DE (0xF8 trae una de la segunda pagina)
	ld a,d			;7573   ; 8 a la derecha
	add a,008h		;7574
	ld d,a			;7576
	jr letra_de_aviso		;7577
quita_letrero:		; lo de (0, 0xE0), 0x5A (o 0x3A) x 0x0C de vuelta a su sitio
	rla			;7579
	ld b,05ah		;757a   ; con el bit 7, 0x5A...
	jr c,letrero_de_vuelta		;757c
	ld b,03ah		;757e   ; ...o 0x3A
letrero_de_vuelta:
	ld hl,000e0h		;7580
	ld c,00ch		;7583
	ld a,(0ca42h)		;7585   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	rlca			;7588
	rlca			;7589
	jp 04767h		;758a   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
aviso_1:		; el aviso 1 (quitando el de antes) sobre el actor IX: 0xCA28 = 1, la cuenta 0x10, la Y - 0x28 (o 0) y la X + 4 (o - 0x14 desde 0x80), con la sala de Snake
	ld hl,0d458h		;758d   ; apunta a el aviso sobre un actor: [que y bits][cuenta][Y][X][fila][columna]
	ld a,(hl)			;7590
	and a			;7591
	push hl			;7592
	call nz,quita_aviso		;7593   ; quita el de antes
	pop hl			;7596
	ld a,001h		;7597
	ld (0ca28h),a		;7599
	ld (hl),a			;759c
	inc hl			;759d
	ld (hl),010h		;759e   ; la cuenta 0x10
	inc hl			;75a0
	ld a,(ix+003h)		;75a1   ; la Y - 0x28...
	sub 028h		;75a4
	jr nc,L_75A9		;75a6
	xor a			;75a8   ; ...o 0
L_75A9:
	ld (hl),a			;75a9
	ld e,a			;75aa
	inc hl			;75ab
	ld a,(ix+005h)		;75ac   ; a la izquierda, + 4...
	cp 080h		;75af
	ld c,004h		;75b1
	jr c,L_75B7		;75b3
	ld c,0ech		;75b5   ; ...a la derecha, - 0x14
L_75B7:
	add a,c			;75b7
	ld (hl),a			;75b8
	ld d,a			;75b9
	inc hl			;75ba
	ld bc,(0ca50h)		;75bb   ; la sala de Snake
	ld (hl),c			;75bf
	inc hl			;75c0
	ld (hl),b			;75c1
	ret			;75c2
aviso_b:		; sin otro, el aviso B con la cuenta C sobre el actor IX (el 8 en (E, D)): la Y - 0x30 (o 0) y la X par - 0x2C (bit 7) o 0x1C, entre 0 y 0x68; con la sala de Snake
	ld hl,0d458h		;75c3   ; apunta a el aviso sobre un actor: [que y bits][cuenta][Y][X][fila][columna]
	ld a,(hl)			;75c6
	and a			;75c7
	ret nz			;75c8   ; con otro, nada
	ld (hl),b			;75c9
	inc hl			;75ca
	ld (hl),c			;75cb
	inc hl			;75cc
	ld a,b			;75cd   ; el 8...
	cp 008h		;75ce
	jr z,aviso_sitio		;75d0
	ld e,(ix+003h)		;75d2   ; ...los otros, el sitio del actor
	ld d,(ix+005h)		;75d5
aviso_sitio:		; la Y - 0x30...
	ld a,e			;75d8
	sub 030h		;75d9
	jr nc,L_75DE		;75db
	xor a			;75dd   ; ...o 0
L_75DE:
	ld e,a			;75de
	ld (hl),e			;75df
	inc hl			;75e0
	ld a,b			;75e1   ; con el bit 7...
	rla			;75e2
	ld c,02ch		;75e3   ; ...0x2C...
	jr c,aviso_x		;75e5
	ld c,01ch		;75e7   ; ...o 0x1C
aviso_x:
	ld a,d			;75e9
	and 0feh		;75ea
	sub c			;75ec
	ld d,000h		;75ed   ; por debajo de 0, 0
	jr c,pon_aviso_x		;75ef
	ld d,068h		;75f1   ; desde 0x68, 0x68
	cp d			;75f3
	jr nc,pon_aviso_x		;75f4
	ld d,a			;75f6
pon_aviso_x:
	ld (hl),d			;75f7
	inc hl			;75f8
	ld bc,(0ca50h)		;75f9   ; la sala de Snake
	ld (hl),c			;75fd
	inc hl			;75fe
	ld (hl),b			;75ff
	ret			;7600

; ----------------------------------------------------------------------
; DATOS resto_7601: lo apuntan con el banco puesto p12:7559 (0x7601); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p12:7559 (135 bytes)
;   0x7601..0x7688  (135 bytes)
DATA_resto_7601:
	defb 025h,076h,004h,030h,076h,00ch,039h,076h,00ch,042h,076h,00ch,047h,076h,004h,04eh	; 7601  %v.0v.9v.Bv.Gv.N
	defb 076h,008h,053h,076h,006h,05ah,076h,00ch,06bh,076h,004h,060h,076h,00ch,072h,076h	; 7611  v.Sv.Zv.kv.`v.rv
	defb 004h,07dh,076h,004h,02eh,02eh,03ah,03eh,026h,039h,026h,04ah,027h,05dh,0ffh,039h	; 7621  .}v...:>&9&J'].9
	defb 052h,05dh,0f0h,03ch,05ah,044h,02ah,0ffh,039h,052h,03dh,0f0h,029h,038h,05dh,0e0h	; 7631  R].<ZD*.9R=.)8].
	defb 0ffh,039h,052h,05dh,0e1h,0ffh,026h,059h,074h,027h,039h,030h,0ffh,02bh,029h,036h	; 7641  .9R]..&Yt'90.+)6
	defb 02dh,0ffh,03eh,071h,02ch,030h,074h,052h,0ffh,02ch,04dh,030h,026h,0e0h,0ffh,047h	; 7651  -.>q,0tR.,M0&..G
	defb 027h,02eh,052h,039h,0f8h,028h,0f8h,069h,02ah,0ffh,08ch,097h,0ebh,087h,0e0h,0e0h	; 7661  '.R9.(.i*.......
	defb 0ffh,043h,05dh,05dh,0e4h,0e4h,043h,05dh,05dh,0e4h,0e4h,0ffh,08ch,097h,0ebh,087h	; 7671  .C]]..C]].......
	defb 0e4h,0e4h,08ch,0e4h,097h,0e4h,0ffh	; 7681

; ======================================================================
; CODIGO 0x7688..0x76cb  (67 bytes)
; ======================================================================


dibuja_snake:		; salvo en el paso 4 de la partida o el estado 4 de Snake: p12:7BB0; sobre lo de 0xCB3F por debajo de 2, 0xCB43 = 0 y con el banco 63 en 0xA000 su dibujo (p12:76C5) y lo de p12:7DA0, 7B73, 7D51, 7C5E, 7C25, 7D7B, 7C6E, 7C81 y 7C8A; luego los bancos 12, 2 y 3
	ld a,(0ca01h)		;7688   ; lee el paso del estado de la partida
	cp 004h		;768b
	ret z			;768d   ; en el paso 4, nada
	ld a,(0cb00h)		;768e   ; lee el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	cp 004h		;7691
	ret z			;7693   ; el estado 4, nada
	call sprites_de_cb3f		;7694   ; sprites_de_cb3f: con 0xCB21 = 2 y 0xCB62, nada; con 0xCB3F = 2 o mas, los sprites 0-1 (p12:7BDA) con los colores 7 y 0x0F
	ld a,(0cb3fh)		;7697   ; lee en la zona 6, lo que hay bajo Snake: 1 con los caracteres 0x90-0xB3, 2 con 0xB8-0xDB (3 con 0xCAAA)
	cp 002h		;769a
	ret nc			;769c   ; desde 2, nada
	xor a			;769d
	ld (0cb43h),a		;769e   ; guarda lo que baja la caja de Snake en los choques (p07:B5FE)
	call 04198h		;76a1   ; los dibujos del banco 63
	call dibujo_de_snake		;76a4   ; dibujo_de_snake: por el dibujo de 0xCB01 (p12:76CB, 15)
	call sprites_del_puesto		;76a7   ; sprites_del_puesto: con 0xCB4B: los sprites 30-31 en (Y - 0x28, X - 8) con el patron 0xF0 (0xF8 con 0xCB4D) y los colores 0x0A y 0x0B
	call colores_e900		;76aa   ; colores_e900: salvo en el dibujo 0x0B, los 0x40 bytes de 0xE900 a 0xDA00 (los colores de los sprites 0-3)
	call parpadeo_de_snake		;76ad   ; parpadeo_de_snake: sin escena ni rotulo: con 0xCB4B, en los cuadros impares, sin colores; sin el, con 0xCB3D, por el bit 0 de 0xCB3E
	call baja_por_cb29		;76b0   ; baja_por_cb29: con 0xCB37, 0xCB43 = 0x20 - 0xCB29
	call sprite_de_cb3f_1		;76b3   ; sprite_de_cb3f_1: con 0xCB3F = 1: 0xCB43 = 0x0B, el sprite 2 0x10 por debajo del 0 con el patron 8, el 3 fuera y los colores del sprite 2 a 7
	call snake_con_ca9b		;76b6   ; snake_con_ca9b: con 0xCA9B: 0xCB43 = 0x10 y 0xCB28-0xCB29 = 2 y 0x10 (en el dibujo 2 sin darse la vuelta, 2 y 0)
	call baja_los_sprites		;76b9   ; baja_los_sprites: la Y de los sprites 0-3 + 0xCB43
	call sube_por_cb54		;76bc   ; sube_por_cb54: con 0xCB54, la Y de los sprites 0-3 - 8
	call recorta_por_cb28		;76bf   ; recorta_por_cb28: con 0xCB28: en el dibujo 2 a los lados sin darse la vuelta, sin colores; si no, por lo que falta de 0xCB29 hasta 0x20, las lineas de colores de los sprites a 0 desde arriba (0xCB28 = 1, p12:7CC9) o desde abajo (p12:7D0D)
	jp 041dah		;76c2   ; bancos_12_2_3: pone el 12 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
dibujo_de_snake:		; por el dibujo de 0xCB01 (p12:76CB, 15)
	ld a,(0cb01h)		;76c5   ; lee el dibujo de Snake (al darse la vuelta se le suma 1, 3 o 5 segun 0xCB00)
	call 0424dh		;76c8   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_76CB: 15 destinos del despachador p00:424D (call en p12:76C8, el
;   indice en A): 7728, 7728, 780D, 787B, 78AC, 78CF, 78CF, 7911, 7935, 79A8,
;   79EE, 7ABC, 7B0D, 7B19, 7B2D; lo leen p12:76C8 (30 bytes)
;   0x76cb..0x76e9  (30 bytes)
DATA_tabla_76CB:
	defw 07728h,07728h,0780dh,0787bh,078ach,078cfh,078cfh,07911h	; 76cb
	defw 07935h,079a8h,079eeh,07abch,07b0dh,07b19h,07b2dh	; 76db

; ======================================================================
; CODIGO 0x76e9..0x770a  (33 bytes)
; ======================================================================


dibuja_snake_b:		; salvo en el estado 4: p12:7B85; sobre lo de 0xCB3F por debajo de 2, con el banco 63, p12:7704 y p12:7BFA; luego los bancos 12, 2 y 3
	ld a,(0cb00h)		;76e9   ; lee el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	cp 004h		;76ec
	ret z			;76ee   ; el estado 4, nada
	call linea_de_cb3f		;76ef   ; linea_de_cb3f: con 0xCB21 = 2 y 0xCB62, nada; con 0xCB3F = 2 o mas, la linea (0x80, 0xCA) o (0, 0xCB) cada 4 cuadros a la fila 0xF0
	ld a,(0cb3fh)		;76f2   ; lee en la zona 6, lo que hay bajo Snake: 1 con los caracteres 0x90-0xB3, 2 con 0xB8-0xDB (3 con 0xCAAA)
	cp 002h		;76f5
	ret nc			;76f7   ; desde 2, nada
	call 04198h		;76f8   ; bancos_63: pone el 63 en 0xA000 (con su copia en 0xC381-0xC383)
	call dibujo_de_snake_b		;76fb   ; dibujo_de_snake_b: por el dibujo de 0xCB01 (p12:770A, 15)
	call linea_de_cb3f_1		;76fe   ; linea_de_cb3f_1: con 0xCB3F = 1: la fila (0xC0, 0xF0) a 0 y la linea (0 o 0x40 cada 4 cuadros, 0xCA), 0x40 x 1, a (0x80, 0xF0)
	jp 041dah		;7701   ; bancos_12_2_3: pone el 12 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
dibujo_de_snake_b:		; por el dibujo de 0xCB01 (p12:770A, 15)
	ld a,(0cb01h)		;7704   ; lee el dibujo de Snake (al darse la vuelta se le suma 1, 3 o 5 segun 0xCB00)
	call 0424dh		;7707   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_770A: 15 destinos del despachador p00:424D (call en p12:7707, el
;   indice en A): 772E, 7805, 781A, 7881, 78B2, 78D5, 7904, 7917, 7940, 79AD,
;   79E3, 7AC7, 7B04, 7B84, 7B24; lo leen p12:7707 (30 bytes)
;   0x770a..0x7728  (30 bytes)
DATA_tabla_770A:
	defw 0772eh,07805h,0781ah,07881h,078b2h,078d5h,07904h,07917h	; 770a
	defw 07940h,079adh,079e3h,07ac7h,07b04h,07b84h,07b24h	; 771a

; ======================================================================
; CODIGO 0x7728..0x77a8  (128 bytes)
; ======================================================================


dibujo_0:		; los sprites (p12:775D) y los patrones de p63:B1CC (p12:77B8)
	call sprites_de_snake		;7728   ; sprites_de_snake: los sprites 0-1 (y 2-3 sin 0xCB3F, 0x10 mas abajo) en el sitio de Snake (X - 8, Y - 0x20), movido un punto al disparar (p12:7789), con el patron 0 de 4 en 4
	jp patrones_de_b1cc		;772b   ; patrones_de_b1cc: la tabla de p63:B1CC del dibujo de 0xCB01, por la direccion y el paso, y los patrones (p12:77E2)
colores_0:		; los colores desde 0xD0 + la direccion * 3 + el paso (p12:774E) a la tabla de colores (p12:7733)
	ld l,0d0h		;772e   ; la linea 0xD0 + (direccion - 1) * 3 + el paso a la fila 0xF0 de la pagina 7 (p12:7733)
	call por_direccion_y_paso		;7730   ; por_direccion_y_paso: L += (la direccion - 1) * 3 + el paso
colores_de_snake:		; la linea L de los colores de Snake: sin 0xCB3F, a (1, 0xF0) con YMMM; con el, 0x80 x 1 a (0, 0xF0)
	ld h,000h		;7733   ; en la pagina 7, la linea L a la fila 0xF0: sin 0xCB3F con YMMM; con el, 0x80 x 1 con HMMM
	ld a,(0cb3fh)		;7735   ; lee en la zona 6, lo que hay bajo Snake: 1 con los caracteres 0x90-0xB3, 2 con 0xB8-0xDB (3 con 0xCAAA)
	or a			;7738
	jr nz,colores_de_snake_b		;7739   ; con 0xCB3F, aparte
	ld de,001f0h		;773b
	ld a,007h		;773e
	jp 047abh		;7740   ; copia_en_y: orden YMMM del VDP
colores_de_snake_b:
	ld de,000f0h		;7743
	ld bc,08001h		;7746
	ld a,007h		;7749
	jp 04767h		;774b   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
por_direccion_y_paso:		; L += (la direccion - 1) * 3 + el paso
	ld a,(0cb0eh)		;774e   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	dec a			;7751
	ld b,a			;7752
	add a,a			;7753
	add a,b			;7754
	add a,l			;7755
	ld l,a			;7756
	ld a,(0cb14h)		;7757   ; lee el dibujo del paso de andar (0, 1, 2, 1: p02:9888)
	add a,l			;775a
	ld l,a			;775b
	ret			;775c
sprites_de_snake:		; los sprites 0-1 (y 2-3 sin 0xCB3F, 0x10 mas abajo) en el sitio de Snake (X - 8, Y - 0x20), movido un punto al disparar (p12:7789), con el patron 0 de 4 en 4
	ld a,(0cb03h)		;775d   ; lee la Y de Snake
	sub 020h		;7760   ; la Y - 0x20
	ld e,a			;7762
sprites_de_snake_x:
	ld a,(0cb05h)		;7763   ; lee la X de Snake
	sub 008h		;7766   ; la X - 8...
	jr nc,sprites_de_snake_y		;7768
	xor a			;776a   ; ...o 0
sprites_de_snake_y:
	ld d,a			;776b
	call retroceso		;776c   ; movido al disparar
	ld hl,0dc00h		;776f   ; desde el sprite 0
	ld c,000h		;7772   ; el patron 0
	call 05d41h		;7774   ; el sprite 0...
	call 05d3dh		;7777   ; ...el 1...
	ld a,(0cb3fh)		;777a   ; lee en la zona 6, lo que hay bajo Snake: 1 con los caracteres 0x90-0xB3, 2 con 0xB8-0xDB (3 con 0xCAAA)
	or a			;777d
	ret nz			;777e   ; con 0xCB3F, solo dos
	ld a,e			;777f   ; 0x10 mas abajo...
	add a,010h		;7780
	ld e,a			;7782
	call 05d3dh		;7783   ; ...el 2...
	jp 05d3dh		;7786   ; ...y el 3
retroceso:		; al disparar (0xD752) en el estado 1 con lo de 0xCB20 por debajo de 3, el 5 o el 6: un punto contra la direccion de Snake (p12:77A8)
	ld a,(0d752h)		;7789   ; lee 1 al disparar algo (p11:A995)
	or a			;778c
	ret z			;778d
	ld a,(0cb00h)		;778e   ; lee el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	dec a			;7791
	ret nz			;7792   ; solo el estado 1
	ld a,(0cb20h)		;7793   ; lee lo que usa el disparo 1 (0 nada; p02:8001 elige por ello)
	cp 003h		;7796   ; por debajo de 3...
	jr c,retroceso_por_direccion		;7798
	cp 005h		;779a   ; ...el 5...
	jr z,retroceso_por_direccion		;779c
	cp 006h		;779e   ; ...o el 6
	ret nz			;77a0
retroceso_por_direccion:
	ld a,(0cb0eh)		;77a1   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	dec a			;77a4
	call 0424dh		;77a5   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_77A8: 4 destinos del despachador p00:424D (call en p12:77A5, el
;   indice en A): 77B0, 77B2, 77B4, 77B6; lo leen p12:77A5 (8 bytes)
;   0x77a8..0x77b0  (8 bytes)
DATA_tabla_77A8:
	defw 077b0h,077b2h,077b4h,077b6h	; 77a8  -> retroceso_abajo retroceso_arriba retroceso_derecha retroceso_izquierda

; ======================================================================
; CODIGO 0x77b0..0x78e7  (311 bytes)
; ======================================================================


retroceso_abajo:
	inc e			;77b0
	ret			;77b1
retroceso_arriba:
	dec e			;77b2
	ret			;77b3
retroceso_derecha:
	inc d			;77b4
	ret			;77b5
retroceso_izquierda:
	dec d			;77b6
	ret			;77b7
patrones_de_b1cc:		; la tabla de p63:B1CC del dibujo de 0xCB01, por la direccion y el paso, y los patrones (p12:77E2)
	ld a,(0cb01h)		;77b8   ; lee el dibujo de Snake (al darse la vuelta se le suma 1, 3 o 5 segun 0xCB00)
	ld hl,0b1cch		;77bb
	call 043f6h		;77be   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
patrones_por_direccion:
	ld a,(0cb0eh)		;77c1   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
patrones_por_a:
	dec a			;77c4
	call por_direccion_6		;77c5   ; por_direccion_6: HL += A * 6 + el paso * 2
	jr patrones_de_b282		;77c8
por_direccion_6:		; HL += A * 6 + el paso * 2
	add a,a			;77ca
	ld b,a			;77cb
	add a,a			;77cc
	add a,b			;77cd
	ld b,a			;77ce
	ld a,(0cb14h)		;77cf   ; lee el dibujo del paso de andar (0, 1, 2, 1: p02:9888)
	add a,a			;77d2
	add a,b			;77d3
	jp 0423eh		;77d4   ; suma_a_hl: HL = HL + A
patrones_de_b620:		; como p12:77E2 con los dos de p63:B620
	ld de,0e900h		;77d7   ; apunta a los caracteres de un dibujo pasados a 4 bits
	push hl			;77da
	push de			;77db
	ld a,(hl)			;77dc
	ld hl,0b620h		;77dd
	jr patrones_a_e900		;77e0
patrones_de_b282:		; el primero de los dos bytes de HL de p63:B282 y el segundo de p63:B620, deshechas sus rachas en 0xE900 y 0xE920
	ld de,0e900h		;77e2   ; apunta a los caracteres de un dibujo pasados a 4 bits
	push hl			;77e5
	push de			;77e6
	ld a,(hl)			;77e7
	ld hl,0b282h		;77e8
patrones_a_e900:
	call 043f6h		;77eb   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ex de,hl			;77ee
	call 051e0h		;77ef   ; las rachas
	pop de			;77f2
	pop hl			;77f3
	inc hl			;77f4
	ld a,(hl)			;77f5   ; el segundo...
	ld hl,0b620h		;77f6   ; ...de p63:B620...
	call 043f6h		;77f9   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld a,020h		;77fc   ; ...en 0xE920
	call 04243h		;77fe   ; suma_a_de: DE = DE + A
	ex de,hl			;7801
	jp 051e0h		;7802   ; rachas_a_ram: deshace las rachas de DE en HL (n < 0x80 repite, n > 0x80 copia, 0 acaba)
lineas_1:		; la linea 0xDC + direccion y paso a la fila 0xF0
	ld l,0dch		;7805
	call por_direccion_y_paso		;7807   ; por_direccion_y_paso: L += (la direccion - 1) * 3 + el paso
	jp colores_de_snake		;780a   ; colores_de_snake: la linea L de los colores de Snake: sin 0xCB3F, a (1, 0xF0) con YMMM; con el, 0x80 x 1 a (0, 0xF0)
dibujo_2:		; dandose la vuelta, como el 4; si no, los sprites (p12:7829) y los patrones de p63:B1CC
	ld a,(0cb16h)		;780d   ; lee 1 mientras Snake se da la vuelta
	or a			;7810
	jp nz,dibujo_4		;7811   ; dibujo_4: los sprites y los patrones de p63:B25A por 0xCB17 (p12:78B8)
	call sprites_2		;7814   ; sprites_2: los sprites: arriba o abajo, los normales (p12:775D); a los lados, 0x10 mas abajo y 8 a la izquierda (p12:7851); dandose la vuelta, 0x18 por encima (con 0xCB17 desde 3, tambien 8 a la izquierda)
	jp patrones_de_b1cc		;7817   ; patrones_de_b1cc: la tabla de p63:B1CC del dibujo de 0xCB01, por la direccion y el paso, y los patrones (p12:77E2)
lineas_2:		; dandose la vuelta, como el 4; si no, la linea 0xE8 + direccion y paso
	ld a,(0cb16h)		;781a   ; lee 1 mientras Snake se da la vuelta
	or a			;781d
	jp nz,lineas_4		;781e   ; lineas_4:
	ld l,0e8h		;7821
	call por_direccion_y_paso		;7823   ; por_direccion_y_paso: L += (la direccion - 1) * 3 + el paso
	jp colores_de_snake		;7826   ; colores_de_snake: la linea L de los colores de Snake: sin 0xCB3F, a (1, 0xF0) con YMMM; con el, 0x80 x 1 a (0, 0xF0)
sprites_2:		; los sprites: arriba o abajo, los normales (p12:775D); a los lados, 0x10 mas abajo y 8 a la izquierda (p12:7851); dandose la vuelta, 0x18 por encima (con 0xCB17 desde 3, tambien 8 a la izquierda)
	ld a,(0cb16h)		;7829   ; lee 1 mientras Snake se da la vuelta
	or a			;782c
	jr nz,sprites_2_vuelta		;782d
	ld a,(0cb0eh)		;782f   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	cp 003h		;7832   ; arriba o abajo...
	jp c,sprites_de_snake		;7834   ; sprites_de_snake: los sprites 0-1 (y 2-3 sin 0xCB3F, 0x10 mas abajo) en el sitio de Snake (X - 8, Y - 0x20), movido un punto al disparar (p12:7789), con el patron 0 de 4 en 4
	jr sprites_2_lado		;7837   ; ...a los lados
sprites_2_vuelta:
	ld a,(0cb17h)		;7839
	cp 003h		;783c   ; desde 3, aparte
	jr nc,sprites_2_vuelta_b		;783e
	ld a,(0cb03h)		;7840   ; la Y - 0x18
	sub 018h		;7843
	ld e,a			;7845
	jp sprites_de_snake_x		;7846   ; sprites_de_snake_x:
sprites_2_vuelta_b:
	ld a,(0cb03h)		;7849   ; lee la Y de Snake
	sub 018h		;784c
	ld e,a			;784e
	jr sprites_anchos		;784f
sprites_2_lado:		; la Y - 0x10
	ld a,(0cb03h)		;7851   ; lee la Y de Snake
	sub 010h		;7854
	ld e,a			;7856
sprites_anchos:		; los sprites 0-1 en (Y, X - 0x10) y 2-3 0x10 a la derecha, patrones desde 0 de 4 en 4; desde X = 0xF0, los de la izquierda fuera
	ld a,(0cb05h)		;7857   ; la X - 0x10
	sub 010h		;785a
	ld d,a			;785c
	ld hl,0dc00h		;785d   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	ld c,000h		;7860
	push de			;7862
	ld a,d			;7863
	cp 0f0h		;7864   ; desde 0xF0...
	jr c,L_786A		;7866
	ld e,0e0h		;7868   ; ...fuera
L_786A:
	call 05d41h		;786a   ; pon_sprite: [E][D][C] en (HL): la Y, la X y el patron de un sprite de 0xDC00
	call 05d3dh		;786d   ; pon_sprite_mas_4: p00:5D41 con el patron C + 4
	pop de			;7870
	ld a,d			;7871
	add a,010h		;7872   ; 0x10 a la derecha
	ld d,a			;7874
	call 05d3dh		;7875   ; pon_sprite_mas_4: p00:5D41 con el patron C + 4
	jp 05d3dh		;7878   ; pon_sprite_mas_4: p00:5D41 con el patron C + 4
dibujo_3:		; los sprites y los patrones de p63:B26A por 0xCB17 (p12:789A)
	call sprites_de_snake		;787b   ; sprites_de_snake: los sprites 0-1 (y 2-3 sin 0xCB3F, 0x10 mas abajo) en el sitio de Snake (X - 8, Y - 0x20), movido un punto al disparar (p12:7789), con el patron 0 de 4 en 4
	jp patrones_3		;787e   ; patrones_3:
lineas_3:		; la linea de 0xCB17 (p12:7887)
	call linea_de_cb17		;7881   ; linea_de_cb17: L = 0xF4 + 0xCB17 - 5 (hasta 0x0C) o 0xCC + 0xCB17 - 0x0D
	jp colores_de_snake		;7884   ; colores_de_snake: la linea L de los colores de Snake: sin 0xCB3F, a (1, 0xF0) con YMMM; con el, 0x80 x 1 a (0, 0xF0)
linea_de_cb17:		; L = 0xF4 + 0xCB17 - 5 (hasta 0x0C) o 0xCC + 0xCB17 - 0x0D
	ld a,(0cb17h)		;7887   ; hasta 0x0C...
	cp 00dh		;788a
	jr nc,linea_de_cb17_b		;788c
	sub 005h		;788e   ; ...0xF4 + 0xCB17 - 5
	add a,0f4h		;7890
	ld l,a			;7892
	ret			;7893
linea_de_cb17_b:
	sub 00dh		;7894   ; desde 0x0D...
	add a,0cch		;7896   ; ...0xCC + 0xCB17 - 0x0D
	ld l,a			;7898
	ret			;7899
patrones_3:
	ld a,(0cb17h)		;789a
	call fila_b26a		;789d   ; fila_b26a: HL = p63:B26A + (A - 9) * 2
	jp patrones_de_b282		;78a0   ; patrones_de_b282: el primero de los dos bytes de HL de p63:B282 y el segundo de p63:B620, deshechas sus rachas en 0xE900 y 0xE920
fila_b26a:		; HL = p63:B26A + (A - 9) * 2
	ld hl,0b26ah		;78a3
	sub 009h		;78a6
	add a,a			;78a8
	jp 0423eh		;78a9   ; suma_a_hl: HL = HL + A
dibujo_4:		; los sprites y los patrones de p63:B25A por 0xCB17 (p12:78B8)
	call sprites_de_snake		;78ac   ; sprites_de_snake: los sprites 0-1 (y 2-3 sin 0xCB3F, 0x10 mas abajo) en el sitio de Snake (X - 8, Y - 0x20), movido un punto al disparar (p12:7789), con el patron 0 de 4 en 4
	jp patrones_4		;78af   ; patrones_4: p63:B25A + (0xCB17 - 5) * 2 (desde 0x0D, - 4)
lineas_4:
	call linea_de_cb17		;78b2   ; linea_de_cb17: L = 0xF4 + 0xCB17 - 5 (hasta 0x0C) o 0xCC + 0xCB17 - 0x0D
	jp colores_de_snake		;78b5   ; colores_de_snake: la linea L de los colores de Snake: sin 0xCB3F, a (1, 0xF0) con YMMM; con el, 0x80 x 1 a (0, 0xF0)
patrones_4:		; p63:B25A + (0xCB17 - 5) * 2 (desde 0x0D, - 4)
	ld a,(0cb17h)		;78b8   ; hasta 0x0C...
	ld hl,0b25ah		;78bb   ; ...desde p63:B25A
	cp 00dh		;78be
	jr c,patrones_4_b		;78c0
	sub 00dh		;78c2   ; desde 0x0D...
	add a,009h		;78c4   ; ...4 menos
patrones_4_b:
	sub 005h		;78c6   ; - 5...
	add a,a			;78c8   ; ...* 2
	call 0423eh		;78c9   ; suma_a_hl: HL = HL + A
	jp patrones_de_b282		;78cc   ; patrones_de_b282: el primero de los dos bytes de HL de p63:B282 y el segundo de p63:B620, deshechas sus rachas en 0xE900 y 0xE920
dibujo_5:		; los sprites y los patrones de la tabla de p63:B1D2 del estado, por 0xCB17 (p12:78EB)
	call sprites_de_snake		;78cf   ; sprites_de_snake: los sprites 0-1 (y 2-3 sin 0xCB3F, 0x10 mas abajo) en el sitio de Snake (X - 8, Y - 0x20), movido un punto al disparar (p12:7789), con el patron 0 de 4 en 4
	jp patrones_5		;78d2   ; patrones_5:
lineas_5:		; la linea de p12:78E7 por 0xCB17
	ld hl,078e7h		;78d5
	call linea_de_tabla		;78d8   ; linea_de_tabla: L = el byte 0xCB17 - 1 de HL
	jp colores_de_snake		;78db   ; colores_de_snake: la linea L de los colores de Snake: sin 0xCB3F, a (1, 0xF0) con YMMM; con el, 0x80 x 1 a (0, 0xF0)
linea_de_tabla:		; L = el byte 0xCB17 - 1 de HL
	ld a,(0cb17h)		;78de
	dec a			;78e1
	call 0423eh		;78e2   ; suma_a_hl: HL = HL + A
	ld l,(hl)			;78e5
	ret			;78e6

; ----------------------------------------------------------------------
; DATOS resto_78E7: lo apuntan con el banco puesto p12:78D5 (0x78E7); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p12:78D5 (4 bytes)
;   0x78e7..0x78eb  (4 bytes)
DATA_resto_78E7:
	defb 0d1h,0d4h,0d7h,0dah	; 78e7

; ======================================================================
; CODIGO 0x78eb..0x790d  (34 bytes)
; ======================================================================


patrones_5:
	ld a,(0cb17h)		;78eb
	ld hl,0b1d2h		;78ee
	call fila_del_estado		;78f1   ; fila_del_estado: HL = la tabla del estado de Snake de HL + (A - 1) * 2
	jp patrones_de_b282		;78f4   ; patrones_de_b282: el primero de los dos bytes de HL de p63:B282 y el segundo de p63:B620, deshechas sus rachas en 0xE900 y 0xE920
fila_del_estado:		; HL = la tabla del estado de Snake de HL + (A - 1) * 2
	ld b,a			;78f7
	ld a,(0cb00h)		;78f8   ; lee el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	call 043f6h		;78fb   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld a,b			;78fe
	dec a			;78ff
	add a,a			;7900
	jp 0423eh		;7901   ; suma_a_hl: HL = HL + A
lineas_6:		; la linea de p12:790D por 0xCB17
	ld hl,0790dh		;7904
	call linea_de_tabla		;7907   ; linea_de_tabla: L = el byte 0xCB17 - 1 de HL
	jp colores_de_snake		;790a   ; colores_de_snake: la linea L de los colores de Snake: sin 0xCB3F, a (1, 0xF0) con YMMM; con el, 0x80 x 1 a (0, 0xF0)

; ----------------------------------------------------------------------
; DATOS resto_790D: lo apuntan con el banco puesto p12:7904 (0x790D); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p12:7904 (4 bytes)
;   0x790d..0x7911  (4 bytes)
DATA_resto_790D:
	defb 0ddh,0e0h,0e3h,0e6h	; 790d

; ======================================================================
; CODIGO 0x7911..0x7a96  (389 bytes)
; ======================================================================


dibujo_7:		; los sprites y los patrones de p63:B25A por 0xCB17
	call sprites_de_snake		;7911   ; sprites_de_snake: los sprites 0-1 (y 2-3 sin 0xCB3F, 0x10 mas abajo) en el sitio de Snake (X - 8, Y - 0x20), movido un punto al disparar (p12:7789), con el patron 0 de 4 en 4
	jp patrones_7		;7914   ; patrones_7:
lineas_7:
	call linea_ef		;7917   ; linea_ef: L = 0xEF + 0xCB17
	jp colores_de_snake		;791a   ; colores_de_snake: la linea L de los colores de Snake: sin 0xCB3F, a (1, 0xF0) con YMMM; con el, 0x80 x 1 a (0, 0xF0)
linea_ef:		; L = 0xEF + 0xCB17
	ld a,(0cb17h)		;791d
	add a,0efh		;7920
	ld l,a			;7922
	ret			;7923
patrones_7:
	ld a,(0cb17h)		;7924
	call fila_b25a		;7927   ; fila_b25a: HL = p63:B25A + (A - 1) * 2
	jp patrones_de_b282		;792a   ; patrones_de_b282: el primero de los dos bytes de HL de p63:B282 y el segundo de p63:B620, deshechas sus rachas en 0xE900 y 0xE920
fila_b25a:		; HL = p63:B25A + (A - 1) * 2
	ld hl,0b25ah		;792d
	dec a			;7930
	add a,a			;7931
	jp 0423eh		;7932   ; suma_a_hl: HL = HL + A
dibujo_8:		; con la direccion en 0xD8E0, los sprites y los patrones de p63:B272 (0xCB17 = 1) o p63:B26A (p12:798E)
	ld a,(0cb0eh)		;7935   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ld (0d8e0h),a		;7938   ; guarda de paso (en p00:4D5A: 1 = el juego de dibujos solo pinta las listas 6 y 7)
	call sprites_de_snake		;793b   ; sprites_de_snake: los sprites 0-1 (y 2-3 sin 0xCB3F, 0x10 mas abajo) en el sitio de Snake (X - 8, Y - 0x20), movido un punto al disparar (p12:7789), con el patron 0 de 4 en 4
	jr patrones_8		;793e
lineas_8:		; la linea de p12:7949 a la fila 0xF0 y la 0xF7 + direccion a la 0x1F0 (p12:797E)
	call linea_8		;7940   ; linea_8: con 0xCB17 = 1: L = 0xFC (0xFD a los lados), H = 0 (direcciones impares) u 0x80; si no, H = 0 y L = 0xF7 + direccion
	call linea_a_f0		;7943   ; linea_a_f0: la linea HL de la pagina 7 a (0, 0xF0), 0x80 x 1
	jp linea_8_c		;7946   ; linea_8_c: la linea (0x80, 0xF7 + direccion) a 0x1F0 con YMMM
linea_8:		; con 0xCB17 = 1: L = 0xFC (0xFD a los lados), H = 0 (direcciones impares) u 0x80; si no, H = 0 y L = 0xF7 + direccion
	ld a,(0cb0eh)		;7949   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ld (0d8e0h),a		;794c   ; guarda de paso (en p00:4D5A: 1 = el juego de dibujos solo pinta las listas 6 y 7)
	ld a,(0cb17h)		;794f
	dec a			;7952
	jr nz,linea_8_b		;7953
	ld l,0fch		;7955
	ld a,(0d8e0h)		;7957   ; lee de paso (en p00:4D5A: 1 = el juego de dibujos solo pinta las listas 6 y 7)
	cp 003h		;795a   ; a los lados...
	jr c,linea_8_h		;795c
	inc l			;795e   ; ...0xFD
linea_8_h:
	ld h,080h		;795f
	ld a,(0d8e0h)		;7961   ; lee de paso (en p00:4D5A: 1 = el juego de dibujos solo pinta las listas 6 y 7)
	rra			;7964
	ret nc			;7965
	ld h,000h		;7966
	ret			;7968
linea_8_b:
	ld h,000h		;7969
	ld a,(0d8e0h)		;796b   ; lee de paso (en p00:4D5A: 1 = el juego de dibujos solo pinta las listas 6 y 7)
	dec a			;796e
	add a,0f8h		;796f
	ld l,a			;7971
	ret			;7972
linea_a_f0:		; la linea HL de la pagina 7 a (0, 0xF0), 0x80 x 1
	ld de,000f0h		;7973
linea_a_de:
	ld bc,08001h		;7976
	ld a,007h		;7979
	jp 04767h		;797b   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
linea_8_c:		; la linea (0x80, 0xF7 + direccion) a 0x1F0 con YMMM
	ld a,(0d8e0h)		;797e   ; lee de paso (en p00:4D5A: 1 = el juego de dibujos solo pinta las listas 6 y 7)
	add a,0f7h		;7981
	ld l,a			;7983
	ld h,080h		;7984
	ld de,001f0h		;7986
	ld a,007h		;7989
	jp 047abh		;798b   ; copia_en_y: orden YMMM del VDP
patrones_8:
	ld a,(0cb17h)		;798e
	ld hl,0b272h		;7991   ; 0xCB17 = 1: p63:B272...
	dec a			;7994
	jr z,patrones_8_b		;7995
	ld hl,0b26ah		;7997   ; ...si no, p63:B26A
patrones_8_b:
	call por_direccion_d8e0		;799a   ; por_direccion_d8e0: HL += (0xD8E0 - 1) * 2
	jp patrones_de_b282		;799d   ; patrones_de_b282: el primero de los dos bytes de HL de p63:B282 y el segundo de p63:B620, deshechas sus rachas en 0xE900 y 0xE920
por_direccion_d8e0:		; HL += (0xD8E0 - 1) * 2
	ld a,(0d8e0h)		;79a0   ; lee de paso (en p00:4D5A: 1 = el juego de dibujos solo pinta las listas 6 y 7)
	dec a			;79a3
	add a,a			;79a4
	jp 0423eh		;79a5   ; suma_a_hl: HL = HL + A
dibujo_9:		; los sprites y los patrones de p63:B27A por la direccion (p12:79D2)
	call sprites_de_snake		;79a8   ; sprites_de_snake: los sprites 0-1 (y 2-3 sin 0xCB3F, 0x10 mas abajo) en el sitio de Snake (X - 8, Y - 0x20), movido un punto al disparar (p12:7789), con el patron 0 de 4 en 4
	jr patrones_9		;79ab
lineas_9:		; la linea de p12:79C1 a la fila 0xF0 y la (0x80, 0xD0) + direccion y paso a la 0x1F0
	call linea_9		;79ad   ; linea_9: L = 0xFE (0xFF a los lados), H = 0 (direcciones impares) u 0x80
	call linea_a_f0		;79b0   ; linea_a_f0: la linea HL de la pagina 7 a (0, 0xF0), 0x80 x 1
	ld hl,080d0h		;79b3
	call por_direccion_y_paso		;79b6   ; por_direccion_y_paso: L += (la direccion - 1) * 3 + el paso
	ld de,001f0h		;79b9
	ld a,007h		;79bc
	jp 047abh		;79be   ; copia_en_y: orden YMMM del VDP
linea_9:		; L = 0xFE (0xFF a los lados), H = 0 (direcciones impares) u 0x80
	ld a,(0cb0eh)		;79c1   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ld l,0feh		;79c4
	cp 003h		;79c6
	jr c,linea_9_h		;79c8
	inc l			;79ca
linea_9_h:
	ld h,000h		;79cb
	rra			;79cd
	ret c			;79ce
	ld h,080h		;79cf
	ret			;79d1
patrones_9:
	ld a,(0cb0eh)		;79d2   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	call fila_b27a		;79d5   ; fila_b27a: HL = p63:B27A + (A - 1) * 2
	jp patrones_de_b282		;79d8   ; patrones_de_b282: el primero de los dos bytes de HL de p63:B282 y el segundo de p63:B620, deshechas sus rachas en 0xE900 y 0xE920
fila_b27a:		; HL = p63:B27A + (A - 1) * 2
	ld hl,0b27ah		;79db
	dec a			;79de
	add a,a			;79df
	jp 0423eh		;79e0   ; suma_a_hl: HL = HL + A
lineas_0a:		; la linea de p12:7A45 y, sin chocar, la de p12:7AA4 por direccion y paso
	call linea_0a		;79e3   ; linea_0a: la linea (0x80 en el paso 1, si no 0; 0xC8) a la fila 0xF0
	ld a,(0cb0fh)		;79e6   ; lee 1 si Snake ha chocado en este cuadro
	or a			;79e9
	ret nz			;79ea   ; chocando, nada mas
	jp linea_por_direccion		;79eb   ; linea_por_direccion:
dibujo_0a:		; los patrones de p63:B242 (p12:7A79); chocando, los sprites de p12:7A25; si no, 0-1 en (Y - 0x20 + 2 o 3 por el paso, X - 7) y 2-3 0x10 mas abajo y uno a la izquierda
	call patrones_0a		;79ee   ; patrones_0a: los patrones de p63:B242 y a cero las lineas 0-1 (y 2 fuera del paso 1) de 0xE920 y 0xE930
	ld a,(0cb0fh)		;79f1   ; lee 1 si Snake ha chocado en este cuadro
	or a			;79f4
	jr nz,sprites_0a_choque		;79f5   ; chocando, aparte
	ld hl,0dc00h		;79f7   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	ld c,000h		;79fa
	ld a,(0cb05h)		;79fc   ; la X - 7
	sub 007h		;79ff
	ld d,a			;7a01
	ld a,(0cb03h)		;7a02   ; la Y - 0x20
	sub 020h		;7a05
	push af			;7a07
	ld b,a			;7a08
	ld a,(0cb14h)		;7a09   ; + 2 en el paso 1...
	dec a			;7a0c
	ld a,002h		;7a0d
	jr z,sprites_0a		;7a0f
	inc a			;7a11   ; ...o 3
sprites_0a:
	add a,b			;7a12
	ld e,a			;7a13
	call 05d41h		;7a14   ; pon_sprite: [E][D][C] en (HL): la Y, la X y el patron de un sprite de 0xDC00
	call 05d3dh		;7a17   ; pon_sprite_mas_4: p00:5D41 con el patron C + 4
	dec d			;7a1a   ; uno a la izquierda
	pop af			;7a1b
	add a,010h		;7a1c   ; 0x10 mas abajo
	ld e,a			;7a1e
	call 05d3dh		;7a1f   ; pon_sprite_mas_4: p00:5D41 con el patron C + 4
	jp 05d3dh		;7a22   ; pon_sprite_mas_4: p00:5D41 con el patron C + 4
sprites_0a_choque:		; los sprites 0-1 en (Y - 0x10, X - 8) y el 2 y el 3 fuera (Y = 0xE0)
	ld hl,0dc00h		;7a25   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	ld a,(0cb03h)		;7a28   ; lee la Y de Snake
	sub 010h		;7a2b
	ld e,a			;7a2d
	ld a,(0cb05h)		;7a2e   ; lee la X de Snake
	sub 008h		;7a31
	ld d,a			;7a33
	ld c,000h		;7a34
	call 05d41h		;7a36   ; pon_sprite: [E][D][C] en (HL): la Y, la X y el patron de un sprite de 0xDC00
	call 05d3dh		;7a39   ; pon_sprite_mas_4: p00:5D41 con el patron C + 4
	ld a,0e0h		;7a3c   ; fuera
	ld (hl),a			;7a3e
	inc l			;7a3f
	inc l			;7a40
	inc l			;7a41
	inc l			;7a42
	ld (hl),a			;7a43
	ret			;7a44
linea_0a:		; la linea (0x80 en el paso 1, si no 0; 0xC8) a la fila 0xF0
	ld l,0c8h		;7a45
	ld h,080h		;7a47
	ld a,(0cb14h)		;7a49   ; lee el dibujo del paso de andar (0, 1, 2, 1: p02:9888)
	dec a			;7a4c
	jr z,linea_a_f0_b		;7a4d
	ld h,000h		;7a4f
linea_a_f0_b:
	ld de,000f0h		;7a51
linea_de_80:		; 0x80 x 1 de HL a DE en la pagina 7
	ld bc,08001h		;7a54
	ld a,007h		;7a57
	jp 04767h		;7a59   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
linea_por_direccion:
	ld a,(0cb0eh)		;7a5c   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
linea_7aa4:		; la linea de p12:7AA4 por (A - 1) * 6 + el paso * 2 a (0x80, 0xF0)
	dec a			;7a5f
	add a,a			;7a60
	ld b,a			;7a61
	add a,a			;7a62
	add a,b			;7a63
	ld b,a			;7a64
	ld a,(0cb14h)		;7a65   ; lee el dibujo del paso de andar (0, 1, 2, 1: p02:9888)
	add a,a			;7a68
	add a,b			;7a69
	ld hl,07aa4h		;7a6a
	call 0423eh		;7a6d   ; suma_a_hl: HL = HL + A
	ld a,(hl)			;7a70
	inc hl			;7a71
	ld h,(hl)			;7a72
	ld l,a			;7a73
	ld de,080f0h		;7a74
	jr linea_de_80		;7a77
patrones_0a:		; los patrones de p63:B242 y a cero las lineas 0-1 (y 2 fuera del paso 1) de 0xE920 y 0xE930
	ld hl,0b242h		;7a79
	call patrones_por_direccion		;7a7c   ; patrones_por_direccion:
	ld hl,0e920h		;7a7f
	call lineas_a_cero		;7a82   ; lineas_a_cero:
	ld hl,0e930h		;7a85
lineas_a_cero:
	ld (hl),000h		;7a88
	inc l			;7a8a
	ld (hl),000h		;7a8b
	ld a,(0cb14h)		;7a8d   ; lee el dibujo del paso de andar (0, 1, 2, 1: p02:9888)
	dec a			;7a90
	ret z			;7a91   ; en el paso 1, solo dos
	inc l			;7a92
	ld (hl),000h		;7a93
	ret			;7a95

; ----------------------------------------------------------------------
; DATOS resto_7A96: lo apuntan con el banco puesto p12:7A6A (0x7AA4); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p12:7A6A (38 bytes)
;   0x7a96..0x7abc  (38 bytes)
DATA_resto_7A96:
	defb 021h,06ah,0b2h,03ah,00eh,0cbh,03dh,087h,0cdh,03eh,042h,0c3h,0e2h,077h,0d0h,080h	; 7a96  !j.:..=..>B..w..
	defb 0d1h,080h,0d2h,080h,0d3h,080h,0d4h,080h,0d5h,080h,0d6h,080h,0d7h,080h,0d8h,080h	; 7aa6  ................
	defb 0d9h,080h,0dah,080h,0dbh,080h	; 7ab6

; ======================================================================
; CODIGO 0x7abc..0x7b60  (164 bytes)
; ======================================================================


dibujo_0b:		; los sprites 0x18 por encima y los colores 0x0B, 0x4C, 3 y 0x4C de los sprites 0-3 (p12:7AE5)
	ld a,(0cb03h)		;7abc   ; lee la Y de Snake
	sub 018h		;7abf
	ld e,a			;7ac1
	call sprites_de_snake_x		;7ac2   ; sprites_de_snake_x:
	jr colores_0b		;7ac5
lineas_0b:		; la linea (0, 0xC9) a la 0x1F0
	ld hl,000c9h		;7ac7
	ld de,001f0h		;7aca
	ld a,007h		;7acd
	jp 047abh		;7acf   ; copia_en_y: orden YMMM del VDP
sprite_4_de_snake:		; el sprite 4 en (Y - 0x10, X + 8) con el patron 0x10
	ld a,(0cb03h)		;7ad2   ; lee la Y de Snake
	sub 010h		;7ad5
	ld e,a			;7ad7
	ld a,(0cb05h)		;7ad8   ; lee la X de Snake
	add a,008h		;7adb
	ld hl,0dc10h		;7add
	ld c,010h		;7ae0
	jp 05d41h		;7ae2   ; pon_sprite: [E][D][C] en (HL): la Y, la X y el patron de un sprite de 0xDC00
colores_0b:		; los 16 colores de los sprites 0-3 a 0x0B, 0x4C, 3 y 0x4C
	ld de,0da01h		;7ae5
	ld hl,0da00h		;7ae8   ; apunta a la copia de la tabla de colores de sprites: 32 x 16 lineas (va con 0xDC00 detras)
	ld (hl),00bh		;7aeb
	call colores_de_un_sprite		;7aed   ; colores_de_un_sprite: el byte de HL a los 15 siguientes
	ld (hl),04ch		;7af0
	call colores_de_un_sprite		;7af2   ; colores_de_un_sprite: el byte de HL a los 15 siguientes
	ld (hl),003h		;7af5
	call colores_de_un_sprite		;7af7   ; colores_de_un_sprite: el byte de HL a los 15 siguientes
	ld (hl),04ch		;7afa
colores_de_un_sprite:		; el byte de HL a los 15 siguientes
	ld bc,0000fh		;7afc
	ldir		;7aff
	inc hl			;7b01
	inc de			;7b02
	ret			;7b03
lineas_0c:		; la linea de p12:7A45 y la de p12:7AA4 por 0xCB17
	call linea_0a		;7b04   ; linea_0a: la linea (0x80 en el paso 1, si no 0; 0xC8) a la fila 0xF0
	ld a,(0cb17h)		;7b07
	jp linea_7aa4		;7b0a   ; linea_7aa4: la linea de p12:7AA4 por (A - 1) * 6 + el paso * 2 a (0x80, 0xF0)
dibujo_0c:		; los sprites y los patrones de p63:B242 por 0xCB17
	call sprites_de_snake		;7b0d   ; sprites_de_snake: los sprites 0-1 (y 2-3 sin 0xCB3F, 0x10 mas abajo) en el sitio de Snake (X - 8, Y - 0x20), movido un punto al disparar (p12:7789), con el patron 0 de 4 en 4
	ld hl,0b242h		;7b10
	ld a,(0cb17h)		;7b13
	jp patrones_por_a		;7b16   ; patrones_por_a:
dibujo_0d:		; los sprites 0-3 fuera (0x10 bytes a 0xE0)
	ld hl,0dc00h		;7b19   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	ld a,0e0h		;7b1c
	ld bc,0000fh		;7b1e
	jp 04237h		;7b21   ; llena_bloque: pone A en BC + 1 bytes desde HL
lineas_0e:		; la linea de p12:7B60 por 0xCB4A, y (0x80, 0xC7) a (0x80, 0xF0)
	call linea_de_cb4a		;7b24   ; linea_de_cb4a: HL = la palabra 0xCB4A de p12:7B60
	call linea_a_f0		;7b27   ; linea_a_f0: la linea HL de la pagina 7 a (0, 0xF0), 0x80 x 1
	jp linea_c7		;7b2a   ; linea_c7:
dibujo_0e:		; los sprites 0-1 en el sitio de Snake y 2-3 0x10 mas abajo, con los patrones de p63:B1D8 por 0xCB4A (p12:77D7)
	ld hl,0dc00h		;7b2d   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	ld a,(0cb03h)		;7b30   ; lee la Y de Snake
	ld e,a			;7b33
	ld a,(0cb05h)		;7b34   ; lee la X de Snake
	ld d,a			;7b37
	ld c,000h		;7b38
	call 05d41h		;7b3a   ; pon_sprite: [E][D][C] en (HL): la Y, la X y el patron de un sprite de 0xDC00
	call 05d3dh		;7b3d   ; pon_sprite_mas_4: p00:5D41 con el patron C + 4
	ld a,e			;7b40
	add a,010h		;7b41
	ld e,a			;7b43
	call 05d3dh		;7b44   ; pon_sprite_mas_4: p00:5D41 con el patron C + 4
	call 05d3dh		;7b47   ; pon_sprite_mas_4: p00:5D41 con el patron C + 4
	ld a,(0cb4ah)		;7b4a   ; el sitio del paso 3...
	ld hl,0b1d8h		;7b4d   ; ...en p63:B1D8
	add a,a			;7b50
	call 0423eh		;7b51   ; suma_a_hl: HL = HL + A
	jp patrones_de_b620		;7b54   ; patrones_de_b620: como p12:77E2 con los dos de p63:B620
linea_de_cb4a:		; HL = la palabra 0xCB4A de p12:7B60
	ld a,(0cb4ah)		;7b57   ; lee el sitio de Snake en el paso 3 del estado 0x19 (p11:A090)
	ld hl,07b60h		;7b5a
	jp 043f6h		;7b5d   ; palabra_de_tabla: HL = la palabra A de la tabla de HL

; ----------------------------------------------------------------------
; DATOS resto_7B60: lo apuntan con el banco puesto p12:7B5A (0x7B60); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p12:7B5A (10 bytes)
;   0x7b60..0x7b6a  (10 bytes)
DATA_resto_7B60:
	defb 0c5h,000h,0c5h,080h,0c6h,000h,0c6h,080h,0c7h,000h	; 7b60  ..........

; ======================================================================
; CODIGO 0x7b6a..0x7c53  (233 bytes)
; ======================================================================


linea_c7:
	ld hl,080c7h		;7b6a
	ld de,080f0h		;7b6d
	jp linea_a_de		;7b70   ; linea_a_de:
colores_e900:		; salvo en el dibujo 0x0B, los 0x40 bytes de 0xE900 a 0xDA00 (los colores de los sprites 0-3)
	ld a,(0cb01h)		;7b73   ; lee el dibujo de Snake (al darse la vuelta se le suma 1, 3 o 5 segun 0xCB00)
	cp 00bh		;7b76
	ret z			;7b78   ; el 0x0B, nada
	ld hl,0e900h		;7b79   ; apunta a los caracteres de un dibujo pasados a 4 bits
	ld de,0da00h		;7b7c   ; apunta a la copia de la tabla de colores de sprites: 32 x 16 lineas (va con 0xDC00 detras)
	ld bc,00040h		;7b7f
	ldir		;7b82
L_7B84:
	ret			;7b84
linea_de_cb3f:		; con 0xCB21 = 2 y 0xCB62, nada; con 0xCB3F = 2 o mas, la linea (0x80, 0xCA) o (0, 0xCB) cada 4 cuadros a la fila 0xF0
	ld a,(0cb21h)		;7b85   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	cp 002h		;7b88
	jr nz,linea_de_cb3f_b		;7b8a
	ld a,(0cb62h)		;7b8c
	or a			;7b8f
	ret nz			;7b90
linea_de_cb3f_b:
	ld a,(0cb3fh)		;7b91   ; lee en la zona 6, lo que hay bajo Snake: 1 con los caracteres 0x90-0xB3, 2 con 0xB8-0xDB (3 con 0xCAAA)
	or a			;7b94
	ret z			;7b95   ; sin 0xCB3F, nada
	dec a			;7b96
	ret z			;7b97   ; con 1, nada
	ld hl,080cah		;7b98
	ld a,(0ca03h)		;7b9b   ; lee el contador de cuadros (uno mas en cada interrupcion)
	rra			;7b9e   ; cada 4 cuadros...
	rra			;7b9f
	jr c,linea_a_f0_c		;7ba0
	ld hl,000cbh		;7ba2   ; ...la otra
linea_a_f0_c:
	ld de,000f0h		;7ba5
	ld bc,08001h		;7ba8
	ld a,007h		;7bab
	jp 04767h		;7bad   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
sprites_de_cb3f:		; con 0xCB21 = 2 y 0xCB62, nada; con 0xCB3F = 2 o mas, los sprites 0-1 (p12:7BDA) con los colores 7 y 0x0F
	ld a,(0cb21h)		;7bb0   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	cp 002h		;7bb3
	jr nz,sprites_de_cb3f_b		;7bb5
	ld a,(0cb62h)		;7bb7
	or a			;7bba
	ret nz			;7bbb
sprites_de_cb3f_b:
	ld a,(0cb3fh)		;7bbc   ; lee en la zona 6, lo que hay bajo Snake: 1 con los caracteres 0x90-0xB3, 2 con 0xB8-0xDB (3 con 0xCAAA)
	or a			;7bbf
	ret z			;7bc0   ; sin 0xCB3F, nada
	dec a			;7bc1
	ret z			;7bc2   ; con 1, nada
	call sprites_0_1		;7bc3   ; sprites_0_1: los sprites 0-1 en (Y - 0x10, X - 8) con los patrones 0 y 4, y el 2 y el 3 fuera
	ld hl,0da00h		;7bc6   ; el sprite 0 de color 7...
	ld bc,0000fh		;7bc9
	ld a,007h		;7bcc
	call 04237h		;7bce   ; llena_bloque: pone A en BC + 1 bytes desde HL
	inc hl			;7bd1
	ld bc,0000fh		;7bd2   ; ...y el 1 de 0x0F
	ld a,00fh		;7bd5
	jp 04237h		;7bd7   ; llena_bloque: pone A en BC + 1 bytes desde HL
sprites_0_1:		; los sprites 0-1 en (Y - 0x10, X - 8) con los patrones 0 y 4, y el 2 y el 3 fuera
	ld a,(0cb03h)		;7bda   ; lee la Y de Snake
	sub 010h		;7bdd
	ld e,a			;7bdf
	ld a,(0cb05h)		;7be0   ; lee la X de Snake
	sub 008h		;7be3
	ld d,a			;7be5
	ld hl,0dc00h		;7be6   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	ld c,000h		;7be9
	call 05d41h		;7beb   ; pon_sprite: [E][D][C] en (HL): la Y, la X y el patron de un sprite de 0xDC00
	call 05d3dh		;7bee   ; pon_sprite_mas_4: p00:5D41 con el patron C + 4
	ld a,0e0h		;7bf1
	ld (hl),a			;7bf3
	inc l			;7bf4
	inc l			;7bf5
	inc l			;7bf6
	inc l			;7bf7
	ld (hl),a			;7bf8
	ret			;7bf9
linea_de_cb3f_1:		; con 0xCB3F = 1: la fila (0xC0, 0xF0) a 0 y la linea (0 o 0x40 cada 4 cuadros, 0xCA), 0x40 x 1, a (0x80, 0xF0)
	ld a,(0cb3fh)		;7bfa   ; lee en la zona 6, lo que hay bajo Snake: 1 con los caracteres 0x90-0xB3, 2 con 0xB8-0xDB (3 con 0xCAAA)
	or a			;7bfd
	ret z			;7bfe
	cp 001h		;7bff
	ret nz			;7c01
	ld hl,0c0f0h		;7c02   ; 0x80 x 1 en (0xC0, 0xF0)...
	ld bc,08001h		;7c05
	xor a			;7c08   ; ...a 0 en la pagina 1
	ld d,001h		;7c09
	call 046ffh		;7c0b   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
	ld hl,000cah		;7c0e
	ld a,(0ca03h)		;7c11   ; cada 4 cuadros...
	rra			;7c14
	rra			;7c15
	jr c,linea_40		;7c16
	ld h,040h		;7c18   ; ...la otra mitad
linea_40:
	ld de,080f0h		;7c1a
	ld bc,04001h		;7c1d
	ld a,007h		;7c20
	jp 04767h		;7c22   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
sprite_de_cb3f_1:		; con 0xCB3F = 1: 0xCB43 = 0x0B, el sprite 2 0x10 por debajo del 0 con el patron 8, el 3 fuera y los colores del sprite 2 a 7
	ld a,(0cb3fh)		;7c25   ; lee en la zona 6, lo que hay bajo Snake: 1 con los caracteres 0x90-0xB3, 2 con 0xB8-0xDB (3 con 0xCAAA)
	or a			;7c28
	ret z			;7c29
	cp 001h		;7c2a
	ret nz			;7c2c
	ld a,00bh		;7c2d
	ld (0cb43h),a		;7c2f   ; guarda lo que baja la caja de Snake en los choques (p07:B5FE)
	ld hl,0dc00h		;7c32   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	ld de,0dc08h		;7c35   ; el sprite 2...
	ld a,(hl)			;7c38
	add a,010h		;7c39   ; ...0x10 mas abajo
	ld (de),a			;7c3b
	inc hl			;7c3c
	inc de			;7c3d
	ldi		;7c3e
	ld a,008h		;7c40   ; el patron 8
	ld (de),a			;7c42
	ld hl,0dc0ch		;7c43
	ld (hl),0e0h		;7c46   ; el 3 fuera
	ld hl,0da20h		;7c48   ; los colores del 2 a 7
	ld bc,0000fh		;7c4b
	ld a,007h		;7c4e
	jp 04237h		;7c50   ; llena_bloque: pone A en BC + 1 bytes desde HL

; ----------------------------------------------------------------------
; DATOS sin identificar  0x7c53..0x7c5e  (11 bytes)
DATA_7C53:
	defb 021h,000h,0dch,03eh,0e0h,001h,00fh,000h,0c3h,037h,042h	; 7c53  !..>.....7B

; ======================================================================
; CODIGO 0x7c5e..0x7ed0  (626 bytes)
; ======================================================================


baja_por_cb29:		; con 0xCB37, 0xCB43 = 0x20 - 0xCB29
	ld a,(0cb37h)		;7c5e
	or a			;7c61
	ret z			;7c62
	ld a,(0cb29h)		;7c63
	ld b,a			;7c66
	ld a,020h		;7c67
	sub b			;7c69
	ld (0cb43h),a		;7c6a   ; guarda lo que baja la caja de Snake en los choques (p07:B5FE)
	ret			;7c6d
baja_los_sprites:		; la Y de los sprites 0-3 + 0xCB43
	ld a,(0cb43h)		;7c6e   ; lee lo que baja la caja de Snake en los choques (p07:B5FE)
	ld c,a			;7c71
baja_c:		; la Y de los sprites 0-3 + C
	ld hl,0dc00h		;7c72   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	ld de,00004h		;7c75
	ld b,004h		;7c78
baja_un_sprite:
	ld a,(hl)			;7c7a   ; la Y...
	add a,c			;7c7b   ; ...+ C
	ld (hl),a			;7c7c
	add hl,de			;7c7d   ; el siguiente (4 bytes)
	djnz baja_un_sprite		;7c7e   ; cuatro
	ret			;7c80
sube_por_cb54:		; con 0xCB54, la Y de los sprites 0-3 - 8
	ld a,(0cb54h)		;7c81
	or a			;7c84
	ret z			;7c85
	ld c,0f8h		;7c86
	jr baja_c		;7c88
recorta_por_cb28:		; con 0xCB28: en el dibujo 2 a los lados sin darse la vuelta, sin colores; si no, por lo que falta de 0xCB29 hasta 0x20, las lineas de colores de los sprites a 0 desde arriba (0xCB28 = 1, p12:7CC9) o desde abajo (p12:7D0D)
	ld hl,0cb28h		;7c8a
	ld a,(hl)			;7c8d
	or a			;7c8e
	ret z			;7c8f   ; sin 0xCB28, nada
	ld a,(0cb01h)		;7c90   ; lee el dibujo de Snake (al darse la vuelta se le suma 1, 3 o 5 segun 0xCB00)
	cp 002h		;7c93   ; el dibujo 2...
	jr nz,recorta_lineas		;7c95
	ld a,(0cb16h)		;7c97   ; lee 1 mientras Snake se da la vuelta
	or a			;7c9a   ; ...sin darse la vuelta...
	jr nz,recorta_lineas		;7c9b
	ld a,(0cb0eh)		;7c9d   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	cp 003h		;7ca0   ; ...a los lados
	jr nc,sin_colores_0_3		;7ca2
recorta_lineas:
	ld a,(0cb29h)		;7ca4
	cp 020h		;7ca7   ; entero, nada
	ret z			;7ca9
	ld b,a			;7caa
	ld a,020h		;7cab
	sub b			;7cad   ; C = lo que falta
	ld c,a			;7cae
	ld b,000h		;7caf
	sub 010h		;7cb1   ; B = lo que pasa de 0x10
	jr c,recorta_por_arriba_o_abajo		;7cb3
	jr z,recorta_por_arriba_o_abajo		;7cb5
	ld b,a			;7cb7
recorta_por_arriba_o_abajo:
	ld a,(hl)			;7cb8
	dec a			;7cb9   ; el 1, desde arriba
	jr nz,recorta_desde_abajo		;7cba
	jr recorta_arriba		;7cbc
recorta_desde_abajo:
	jr recorta_abajo		;7cbe
sin_colores_0_3:		; los colores de los sprites 0-3 a 0
	ld hl,0da00h		;7cc0   ; apunta a la copia de la tabla de colores de sprites: 32 x 16 lineas (va con 0xDC00 detras)
	ld bc,0003fh		;7cc3
	jp 04236h		;7cc6   ; borra_bloque: pone a cero BC + 1 bytes desde HL
recorta_arriba:		; las C primeras lineas de colores de los sprites 0 y 1 a 0 y, con B, las B primeras del 2 y el 3
	push bc			;7cc9
	ld b,000h		;7cca
	ld hl,0da00h		;7ccc   ; el sprite 0
	ld de,0da01h		;7ccf
	ld (hl),000h		;7cd2
	dec c			;7cd4
	jr z,recorta_arriba_1		;7cd5
	ldir		;7cd7
recorta_arriba_1:
	pop bc			;7cd9
	push bc			;7cda
	ld b,000h		;7cdb
	ld hl,0da10h		;7cdd   ; el sprite 1
	ld de,0da11h		;7ce0
	ld (hl),000h		;7ce3
	dec c			;7ce5
	jr z,recorta_arriba_2		;7ce6
	ldir		;7ce8
recorta_arriba_2:
	pop bc			;7cea
	ld a,b			;7ceb
	or a			;7cec
	ret z			;7ced   ; sin B, nada mas
	ld c,b			;7cee
	ld b,000h		;7cef
	push bc			;7cf1
	ld hl,0da20h		;7cf2   ; el sprite 2
	ld de,0da21h		;7cf5
	ld (hl),000h		;7cf8
	dec c			;7cfa
	jr z,recorta_arriba_3		;7cfb
	ldir		;7cfd
recorta_arriba_3:
	pop bc			;7cff
	ld hl,0da30h		;7d00   ; el sprite 3
	ld de,0da31h		;7d03
	ld (hl),000h		;7d06
	dec c			;7d08
	ret z			;7d09
	ldir		;7d0a
	ret			;7d0c
recorta_abajo:		; las C ultimas lineas de colores de los sprites 2 y 3 a 0 y, con B, las B ultimas del 0 y el 1
	push bc			;7d0d
	ld b,000h		;7d0e
	ld hl,0da2fh		;7d10   ; el sprite 2, desde abajo
	ld de,0da2eh		;7d13
	ld (hl),000h		;7d16
	dec c			;7d18
	jr z,recorta_abajo_3		;7d19
	lddr		;7d1b
recorta_abajo_3:
	pop bc			;7d1d
	push bc			;7d1e
	ld b,000h		;7d1f
	ld hl,0da3fh		;7d21   ; el sprite 3
	ld de,0da3eh		;7d24
	ld (hl),000h		;7d27
	dec c			;7d29
	jr z,recorta_abajo_0		;7d2a
	lddr		;7d2c
recorta_abajo_0:
	pop bc			;7d2e
	ld a,b			;7d2f
	or a			;7d30
	ret z			;7d31   ; sin B, nada mas
	ld c,b			;7d32
	ld b,000h		;7d33
	push bc			;7d35
	ld hl,0da0fh		;7d36   ; el sprite 0
	ld de,0da0eh		;7d39
	ld (hl),000h		;7d3c
	dec c			;7d3e
	jr z,recorta_abajo_1		;7d3f
	lddr		;7d41
recorta_abajo_1:
	pop bc			;7d43
	ld hl,0da1fh		;7d44   ; el sprite 1
	ld de,0da1eh		;7d47
	ld (hl),000h		;7d4a
	dec c			;7d4c
	ret z			;7d4d
	lddr		;7d4e
	ret			;7d50
parpadeo_de_snake:		; sin escena ni rotulo: con 0xCB4B, en los cuadros impares, sin colores; sin el, con 0xCB3D, por el bit 0 de 0xCB3E
	ld a,(0e040h)		;7d51   ; lee la escena en curso (1-9, 0 = ninguna; p09:A4A6, guiones en p09:A5D4)
	or a			;7d54
	ret nz			;7d55   ; en una escena, nada
	ld a,(0caa8h)		;7d56   ; lee 1 mientras se ve el rotulo de la cosa cogida
	or a			;7d59
	ret nz			;7d5a   ; con el rotulo, nada
	ld a,(0cb4bh)		;7d5b   ; lee con el puesto, la vida baja un punto cada 16 cuadros
	or a			;7d5e
	jr z,parpadeo_cb3d		;7d5f   ; sin 0xCB4B, aparte
	ld a,(0ca03h)		;7d61   ; lee el contador de cuadros (uno mas en cada interrupcion)
	rra			;7d64   ; los impares...
	ret c			;7d65
	jr snake_sin_colores		;7d66   ; ...sin colores
parpadeo_cb3d:
	ld hl,0cb3dh		;7d68
	ld a,(hl)			;7d6b
	or a			;7d6c
	ret z			;7d6d   ; sin 0xCB3D, nada
	inc hl			;7d6e
	ld a,(hl)			;7d6f
	rra			;7d70   ; por el bit 0 de 0xCB3E
	ret c			;7d71
snake_sin_colores:		; los colores de los sprites 0-3 a 0
	ld hl,0da00h		;7d72   ; apunta a la copia de la tabla de colores de sprites: 32 x 16 lineas (va con 0xDC00 detras)
	ld bc,0003fh		;7d75
	jp 04236h		;7d78   ; borra_bloque: pone a cero BC + 1 bytes desde HL
snake_con_ca9b:		; con 0xCA9B: 0xCB43 = 0x10 y 0xCB28-0xCB29 = 2 y 0x10 (en el dibujo 2 sin darse la vuelta, 2 y 0)
	ld a,(0ca9bh)		;7d7b
	or a			;7d7e
	ret z			;7d7f
	ld a,010h		;7d80
	ld (0cb43h),a		;7d82   ; guarda lo que baja la caja de Snake en los choques (p07:B5FE)
	ld bc,00210h		;7d85
	ld a,(0cb16h)		;7d88   ; dandose la vuelta, 0x10
	or a			;7d8b
	jp nz,pon_cb28		;7d8c   ; pon_cb28:
	ld a,(0cb01h)		;7d8f   ; el dibujo 2...
	cp 002h		;7d92
	jr nz,pon_cb28		;7d94
	ld bc,00200h		;7d96   ; ...0
pon_cb28:
	ld hl,0cb28h		;7d99
	ld (hl),b			;7d9c
	inc l			;7d9d
	ld (hl),c			;7d9e
	ret			;7d9f
sprites_del_puesto:		; con 0xCB4B: los sprites 30-31 en (Y - 0x28, X - 8) con el patron 0xF0 (0xF8 con 0xCB4D) y los colores 0x0A y 0x0B
	ld hl,0cb4bh		;7da0   ; apunta a con el puesto, la vida baja un punto cada 16 cuadros
	ld a,(hl)			;7da3
	or a			;7da4
	ret z			;7da5
	inc l			;7da6
	inc l			;7da7
	ld c,0f0h		;7da8   ; 0xF0...
	ld a,(hl)			;7daa
	or a			;7dab
	jr z,sprites_30_31		;7dac
	ld c,0f8h		;7dae   ; ...o 0xF8 con 0xCB4D
sprites_30_31:		; el sprite 30
	ld hl,0dc78h		;7db0
	ld a,(0cb03h)		;7db3   ; la Y - 0x28
	sub 028h		;7db6
	ld e,a			;7db8
	ld a,(0cb05h)		;7db9   ; la X - 8
	sub 008h		;7dbc
	ld d,a			;7dbe
	call 05d41h		;7dbf   ; pon_sprite: [E][D][C] en (HL): la Y, la X y el patron de un sprite de 0xDC00
	call 05d3dh		;7dc2   ; pon_sprite_mas_4: p00:5D41 con el patron C + 4
	ld hl,0dbe0h		;7dc5   ; los colores del 30 a 0x0A...
	ld de,0dbe1h		;7dc8
	ld (hl),00ah		;7dcb
	ld bc,0000fh		;7dcd
	ldir		;7dd0
	inc de			;7dd2
	inc hl			;7dd3
	ld (hl),00bh		;7dd4   ; ...y del 31 a 0x0B
	ld bc,0000fh		;7dd6
	ldir		;7dd9
	ret			;7ddb
sprites_de_actores:		; los 24 actores (no libres; el 8 sin 0xD441) que se ven (p04:806F) en esta sala: su lista de sprites desde la tabla del tipo de p56:A808 [ancho][filas...] por su dibujo (en la especial 2 con 0xD443, el 0) y los sprites desde 0xDC28 (p12:7E4B)
	ld ix,0ce00h		;7ddc   ; apunta a los actores: 24 fichas de 0x40 bytes (p04:800D)
	ld b,018h		;7de0   ; 24 actores
L_7DE2:
	push bc			;7de2
	ld a,(ix+000h)		;7de3   ; lee el tipo del actor (0 = libre)
	ld c,a			;7de6
	and a			;7de7
	jr z,siguiente_de_sprites		;7de8   ; libre, nada
	cp 008h		;7dea   ; el 8...
	jr nz,actor_visible		;7dec
	ld a,(0d441h)		;7dee   ; ...con 0xD441, nada
	and a			;7df1
	jr nz,siguiente_de_sprites		;7df2
actor_visible:
	call se_ve_guardando_bc		;7df4   ; se_ve_guardando_bc:
	jr c,siguiente_de_sprites		;7df7   ; no se ve, nada
	call 08100h		;7df9   ; en_esta_sala: Z si el actor esta en la sala de ahora (fila y columna)
	jr nz,siguiente_de_sprites		;7dfc   ; de otra sala, nada
	ld a,c			;7dfe
	ld hl,0a808h		;7dff   ; la tabla de p56:A808
	call 043f6h		;7e02   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld a,(hl)			;7e05   ; el ancho * 2
	add a,a			;7e06
	ld c,a			;7e07
	inc hl			;7e08
	ld a,(ix+00dh)		;7e09   ; el dibujo
	and a			;7e0c
	jr z,fila_de_sprites		;7e0d   ; el 0, la primera
	ld b,a			;7e0f
	ld a,(0d443h)		;7e10   ; con 0xD443...
	and a			;7e13
	jr z,por_el_dibujo		;7e14
	ld a,(0ca76h)		;7e16   ; ...en la especial 2, el 0
	cp 002h		;7e19
	ld a,000h		;7e1b
	jr z,fila_de_sprites		;7e1d
por_el_dibujo:
	xor a			;7e1f
suma_ancho:
	add a,c			;7e20
	djnz suma_ancho		;7e21
fila_de_sprites:
	call 0423eh		;7e23   ; suma_a_hl: HL = HL + A
	call 08273h		;7e26   ; su lista
	call sprites_de_lista		;7e29   ; sprites_de_lista: el byte 0x1F uno menos (si no es 0) y, por cada numero de la lista DE (hasta 0 o 18), su sprite (p12:7E64)
siguiente_de_sprites:		; el siguiente (0x40 bytes)
	ld bc,00040h		;7e2c
	add ix,bc		;7e2f
	pop bc			;7e31
	djnz L_7DE2		;7e32
	ret			;7e34
se_ve_guardando_bc:
	push bc			;7e35
	call se_ve_banco_4		;7e36   ; se_ve_banco_4: p04:806F con el banco 4 en 0x8000 y el de antes
	pop bc			;7e39
	ret			;7e3a
se_ve_banco_4:		; p04:806F con el banco 4 en 0x8000 y el de antes
	ld a,(0c382h)		;7e3b   ; lee la copia del banco de 0x8000
	push af			;7e3e
	call 04224h		;7e3f   ; bancos_4: pone el 4 en 0x8000 (con su copia en 0xC381-0xC383)
	call 0806fh		;7e42   ; se_ve_el_actor_si: p14:B9DC guardando HL, DE y BC
	pop bc			;7e45
	ld a,b			;7e46
	push af			;7e47
	jp 0422ch		;7e48
sprites_de_lista:		; el byte 0x1F uno menos (si no es 0) y, por cada numero de la lista DE (hasta 0 o 18), su sprite (p12:7E64)
	ld a,(ix+01fh)		;7e4b
	and a			;7e4e
	jr z,L_7E54		;7e4f
	dec (ix+01fh)		;7e51
L_7E54:
	ld b,012h		;7e54   ; hasta 18
sprite_de_lista:
	ld a,(de)			;7e56
	and a			;7e57   ; 0: se acaba
	ret z			;7e58
	push bc			;7e59
	push de			;7e5a
	call sprite_de_actor		;7e5b   ; sprite_de_actor: el sprite N - 1 de 0xDC28: la Y del actor + el desplazamiento de p56:A7EE (de 0xB4 a 0xEF, fuera; temblando por p12:7EB0), la X + el suyo (desde 0xB1, fuera) y el patron; el 4 del tipo 0x0B, aparte (p12:7ED4)
	pop de			;7e5e
	pop bc			;7e5f
	inc e			;7e60
	djnz sprite_de_lista		;7e61
	ret			;7e63
sprite_de_actor:		; el sprite N - 1 de 0xDC28: la Y del actor + el desplazamiento de p56:A7EE (de 0xB4 a 0xEF, fuera; temblando por p12:7EB0), la X + el suyo (desde 0xB1, fuera) y el patron; el 4 del tipo 0x0B, aparte (p12:7ED4)
	dec a			;7e64
	ld c,a			;7e65
	add a,a			;7e66
	add a,a			;7e67
	ld de,0dc28h		;7e68   ; desde el sprite 10
	add a,e			;7e6b
	ld e,a			;7e6c
	ld a,c			;7e6d
	cp 004h		;7e6e   ; el 4...
	jr nz,sprite_de_actor_b		;7e70
	ld a,(ix+000h)		;7e72   ; ...del 0x0B, aparte
	cp 00bh		;7e75
	jp z,sprite_4_de_0b		;7e77   ; sprite_4_de_0b: el sprite del 0x0B que se mueve en circulo: la Y + p12:7EFF de 0xD422 / 2 - 0x1C (fuera con el dibujo desde 4), la X + p12:7EFF de 0xD422 - 0x0C, el patron 0x90
sprite_de_actor_b:
	ld a,(hl)			;7e7a
	exx			;7e7b
	ld hl,0a7eeh		;7e7c   ; el desplazamiento de p56:A7EE
	call 043f6h		;7e7f   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld a,l			;7e82
	exx			;7e83
	add a,(ix+003h)		;7e84   ; + la Y
	cp 0f0h		;7e87   ; desde 0xF0, se queda...
	jr nc,pon_y_de_sprite		;7e89
	cp 0b4h		;7e8b   ; ...desde 0xB4, fuera
	jr c,pon_y_de_sprite		;7e8d
	ld a,0e0h		;7e8f
pon_y_de_sprite:
	push bc			;7e91
	call temblor		;7e92   ; temblando
	pop bc			;7e95
	ld (de),a			;7e96
	inc e			;7e97
	exx			;7e98
	ld a,h			;7e99
	exx			;7e9a
	add a,(ix+005h)		;7e9b   ; + la X
	cp 0b1h		;7e9e   ; desde 0xB1...
	jr c,pon_x_de_sprite		;7ea0
	push af			;7ea2
	dec e			;7ea3
	ld a,0e0h		;7ea4   ; ...fuera
	ld (de),a			;7ea6
	inc e			;7ea7
	pop af			;7ea8
pon_x_de_sprite:
	ld (de),a			;7ea9
	inc e			;7eaa
	inc hl			;7eab
	ld a,(hl)			;7eac   ; el patron
	ld (de),a			;7ead
	inc hl			;7eae
	ret			;7eaf
temblor:		; con el byte 0x1F y un tipo por debajo de 0x10, A + el de p12:7ED0 por el byte 0x1F; 0xE0 se queda
	ld b,a			;7eb0
	cp 0e0h		;7eb1
	ret z			;7eb3
	ld a,(ix+01fh)		;7eb4
	and a			;7eb7
	jr z,sin_temblor		;7eb8   ; sin 0x1F, igual
	ld c,a			;7eba
	ld a,(ix+000h)		;7ebb
	cp 010h		;7ebe
	jr nc,sin_temblor		;7ec0   ; desde 0x10, igual
	push hl			;7ec2
	ld hl,l7ecfh		;7ec3
	ld a,c			;7ec6
	call 0423eh		;7ec7   ; suma_a_hl: HL = HL + A
	ld a,(hl)			;7eca
	pop hl			;7ecb
	add a,b			;7ecc
	ret			;7ecd
sin_temblor:
	ld a,b			;7ece
L_7ECF:
	ret			;7ecf

; ----------------------------------------------------------------------
; DATOS sin identificar  0x7ed0..0x7ed4  (4 bytes)
DATA_7ED0:
	defb 0ffh,0feh,0fdh,0ffh	; 7ed0

; ======================================================================
; CODIGO 0x7ed4..0x7f15  (65 bytes)
; ======================================================================


sprite_4_de_0b:		; el sprite del 0x0B que se mueve en circulo: la Y + p12:7EFF de 0xD422 / 2 - 0x1C (fuera con el dibujo desde 4), la X + p12:7EFF de 0xD422 - 0x0C, el patron 0x90
	ld a,(0d422h)		;7ed4
	rra			;7ed7
	call onda_7f15		;7ed8   ; onda_7f15: el byte de p12:7F15 por A & 0x1F (de 0x10 a 0x1F, de vuelta)
	add a,(ix+003h)		;7edb
	sub 01ch		;7ede
	ld b,a			;7ee0
	ld a,(ix+00dh)		;7ee1
	cp 004h		;7ee4   ; desde el dibujo 4...
	jr c,pon_y_de_0b		;7ee6
	ld b,0e0h		;7ee8   ; ...fuera
pon_y_de_0b:
	ld a,b			;7eea
	ld (de),a			;7eeb
	inc hl			;7eec
	inc e			;7eed
	ld a,(0d422h)		;7eee
	call onda_7f15		;7ef1   ; onda_7f15: el byte de p12:7F15 por A & 0x1F (de 0x10 a 0x1F, de vuelta)
	add a,(ix+005h)		;7ef4
	sub 00ch		;7ef7
	ld (de),a			;7ef9
	inc e			;7efa
	ld a,090h		;7efb   ; el patron 0x90
	ld (de),a			;7efd
	ret			;7efe
onda_7f15:		; el byte de p12:7F15 por A & 0x1F (de 0x10 a 0x1F, de vuelta)
	push hl			;7eff
	and 01fh		;7f00
	cp 010h		;7f02   ; la segunda mitad...
	jr c,byte_de_onda		;7f04
	sub 01fh		;7f06   ; ...de vuelta
	neg		;7f08
byte_de_onda:
	and 00fh		;7f0a
	ld hl,07f15h		;7f0c
	call 0423eh		;7f0f   ; suma_a_hl: HL = HL + A
	ld a,(hl)			;7f12
	pop hl			;7f13
	ret			;7f14

; ----------------------------------------------------------------------
; DATOS resto_7F15: lo apuntan con el banco puesto p12:7F0C (0x7F15); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p12:7F0C (16 bytes)
;   0x7f15..0x7f25  (16 bytes)
DATA_resto_7F15:
	defb 000h,000h,000h,000h,001h,001h,002h,002h,003h,004h,005h,005h,006h,006h,007h,007h	; 7f15  ................

; ======================================================================
; CODIGO 0x7f25..0x7fbe  (153 bytes)
; ======================================================================


cb74_siguiente:		; con el banco 56: el de 0xCB74 en la sala (p12:7F3B: DE y HL de p56:A62E) y 0xCB74 uno mas (salvo en 0xFF); luego el banco 7
	call 0418eh		;7f25   ; bancos_56: pone el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	exx			;7f28
	call fila_de_cb74		;7f29   ; fila_de_cb74: DE y HL de la fila (* 4) de p56:A62E del numero 0xCB74 de la lista de la sala: en la zona 3, las salas de p56:A5EA con las listas de p56:A5ED; la especial 0x0D p56:A623; la 0x31 en la columna 6 p56:A60D, en la 8 p56:A618; sin lista o con 0xFF, 0xCB74 = 0xFF
	exx			;7f2c
	push hl			;7f2d
	ld hl,0cb74h		;7f2e   ; apunta a el numero de la lista de la sala (0xFF: se acabo; p12:7F3B)
	ld a,(hl)			;7f31   ; en 0xFF, se queda
	cp 0ffh		;7f32
	jr z,cb74_banco_7		;7f34
	inc (hl)			;7f36
cb74_banco_7:
	pop hl			;7f37
	jp 041b0h		;7f38   ; bancos_7: pone el 7 en 0xA000 (con su copia en 0xC381-0xC383)
fila_de_cb74:		; DE y HL de la fila (* 4) de p56:A62E del numero 0xCB74 de la lista de la sala: en la zona 3, las salas de p56:A5EA con las listas de p56:A5ED; la especial 0x0D p56:A623; la 0x31 en la columna 6 p56:A60D, en la 8 p56:A618; sin lista o con 0xFF, 0xCB74 = 0xFF
	ld a,(0ca4ah)		;7f3b   ; lee la zona
	cp 003h		;7f3e   ; fuera de la zona 3, aparte
	jr nz,lista_de_especial		;7f40
	ld b,000h		;7f42
	ld a,(0ca4bh)		;7f44   ; lee la sala de la zona
	ld hl,0a5eah		;7f47   ; las salas de p56:A5EA
busca_sala_a5ea:
	cp (hl)			;7f4a
	jr z,lista_de_a5ed		;7f4b   ; la suya?
	inc hl			;7f4d
	inc b			;7f4e
	ld c,a			;7f4f
	ld a,b			;7f50
	cp 003h		;7f51   ; 3
	ld a,c			;7f53
	jr c,busca_sala_a5ea		;7f54
	jr cb74_ff		;7f56   ; ninguna
lista_de_a5ed:
	ld hl,0a5edh		;7f58
	ld a,b			;7f5b
	call 043f6h		;7f5c   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
numero_de_cb74:
	ld a,(0cb74h)		;7f5f   ; lee el numero de la lista de la sala (0xFF: se acabo; p12:7F3B)
	call 0423eh		;7f62   ; suma_a_hl: HL = HL + A
	ld a,(hl)			;7f65   ; el numero de la lista
	cp 0ffh		;7f66   ; 0xFF: se acaba
	jr z,cb74_ff		;7f68
	ld hl,0a62eh		;7f6a   ; la fila de p56:A62E
	add a,a			;7f6d
	add a,a			;7f6e
	call 0423eh		;7f6f   ; suma_a_hl: HL = HL + A
	ld e,(hl)			;7f72   ; DE...
	inc hl			;7f73
	ld d,(hl)			;7f74
	inc hl			;7f75
	ld a,(hl)			;7f76   ; ...y HL
	inc hl			;7f77
	ld h,(hl)			;7f78
	ld l,a			;7f79
	ret			;7f7a
lista_de_especial:		; p56:A623...
	ld hl,0a623h		;7f7b
	ld a,(0ca76h)		;7f7e   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 00dh		;7f81   ; ...en la especial 0x0D
	jr z,numero_de_cb74		;7f83
	ld hl,0a60dh		;7f85   ; p56:A60D...
	cp 031h		;7f88   ; ...en la 0x31...
	jr nz,cb74_ff		;7f8a
	ld a,(0ca51h)		;7f8c   ; lee la columna de la sala en la zona (uno mas al salir por la derecha)
	cp 006h		;7f8f   ; ...columna 6
	jr z,numero_de_cb74		;7f91
	ld hl,0a618h		;7f93   ; p56:A618...
	cp 008h		;7f96   ; ...columna 8
	jr z,numero_de_cb74		;7f98
cb74_ff:
	ld hl,0cb74h		;7f9a   ; apunta a el numero de la lista de la sala (0xFF: se acabo; p12:7F3B)
	ld (hl),0ffh		;7f9d
	ret			;7f9f
mueve_ix_0_1:		; cada 2 cuadros el bit 0 del byte 2 cambia (p12:7FC6); los bytes 0 y 1 de IX + el par de p12:7FBE por el byte 3 (1-4)
	call alterna_byte_2		;7fa0   ; alterna_byte_2: en los cuadros pares, el bit 0 del byte 2 de IX cambia
	ld a,(ix+003h)		;7fa3
	dec a			;7fa6   ; (byte 3 - 1) * 2
	add a,a			;7fa7
	ld hl,07fbeh		;7fa8
	call 0423eh		;7fab   ; suma_a_hl: HL = HL + A
	ld a,(hl)			;7fae   ; + el primero al byte 0
	add a,(ix+000h)		;7faf
	ld (ix+000h),a		;7fb2
	inc hl			;7fb5
	ld a,(hl)			;7fb6   ; + el segundo al byte 1
	add a,(ix+001h)		;7fb7
	ld (ix+001h),a		;7fba
	ret			;7fbd

; ----------------------------------------------------------------------
; DATOS resto_7FBE: lo apuntan con el banco puesto p12:7FA8 (0x7FBE); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p12:7FA8 (8 bytes)
;   0x7fbe..0x7fc6  (8 bytes)
DATA_resto_7FBE:
	defb 0feh,000h,002h,000h,000h,0feh,000h,002h	; 7fbe  ........

; ======================================================================
; CODIGO 0x7fc6..0x7fd4  (14 bytes)
; ======================================================================


alterna_byte_2:		; en los cuadros pares, el bit 0 del byte 2 de IX cambia
	ld a,(0ca03h)		;7fc6   ; lee el contador de cuadros (uno mas en cada interrupcion)
	rra			;7fc9
	ret c			;7fca
	ld a,(ix+002h)		;7fcb
	xor 001h		;7fce
	ld (ix+002h),a		;7fd0
	ret			;7fd3

; ----------------------------------------------------------------------
; DATOS sin identificar  0x7fd4..0x8000  (44 bytes)
DATA_7FD4:
	defb 023h,004h,007h,077h,007h,008h,044h,004h,009h,006h,002h,00ah,070h,000h,00bh,064h	; 7fd4  #..w..D.....p..d
	defb 005h,00ch,050h,003h,00dh,002h,004h,00eh,001h,002h,00fh,000h,000h,0ffh,001h,000h	; 7fe4  ..P.............
	defb 001h,002h,001h,002h,003h,001h,003h,004h,002h,004h,005h,073h	; 7ff4  ...........s
