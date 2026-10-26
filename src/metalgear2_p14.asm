; ==========================================================================
; METAL GEAR 2 SOLID SNAKE - Konami (1990) - MSX2 - MegaROM RC-767 de 512 KB (Konami SCC) - banco 14 (se ejecuta en 0xa000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x0a000


; ----------------------------------------------------------------------
; DATOS resto_A000: lo apuntan con el banco puesto p13:9ACC (0xA000), p14:A729
;   (0xA000), p14:B0B5 (0xA001), p13:9725 (0xA01D), p13:98A8 (0xA01D),
;   p13:98D1 (0xA01D); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p13:9ACC, p14:A729, p14:B0B5, p13:9725, p13:98A8,
;   p13:98D1 (406 bytes)
;   0xa000..0xa196  (406 bytes)
DATA_resto_A000:
	defb 004h,006h,030h,002h,007h,077h,007h,008h,070h,000h,009h,070h,003h,00ah,044h,004h	; a000  ..0..w..p..p..D.
	defb 00bh,070h,005h,00dh,033h,003h,00eh,022h,002h,00fh,000h,000h,0ffh,001h,040h,002h	; a010  .p..3.."......@.
	defb 002h,050h,002h,003h,060h,002h,004h,070h,000h,005h,005h,000h,006h,070h,003h,007h	; a020  .P..`..p.....p..
	defb 077h,007h,008h,070h,004h,009h,070h,006h,00ah,073h,007h,00bh,007h,000h,0ffh,000h	; a030  w..p..p..s......
	defb 000h,000h,001h,011h,001h,002h,023h,002h,003h,034h,003h,004h,045h,004h,005h,056h	; a040  ......#..4..E..V
	defb 005h,006h,067h,006h,007h,067h,006h,008h,034h,003h,009h,045h,004h,00ah,056h,005h	; a050  ..g..g..4..E..V.
	defb 00bh,045h,004h,00ch,034h,003h,00dh,023h,002h,00eh,012h,001h,0ffh,000h,000h,000h	; a060  .E..4..#........
	defb 001h,077h,007h,002h,012h,001h,003h,034h,003h,004h,045h,004h,005h,023h,002h,006h	; a070  .w.....4..E..#..
	defb 045h,004h,007h,067h,006h,008h,023h,002h,009h,023h,002h,00ah,034h,003h,00bh,045h	; a080  E..g..#..#..4..E
	defb 004h,00ch,056h,005h,00dh,067h,006h,00eh,055h,005h,00fh,000h,000h,0ffh,000h,000h	; a090  ..V..g..U.......
	defb 000h,001h,023h,002h,002h,034h,003h,003h,012h,001h,004h,034h,003h,005h,045h,004h	; a0a0  ..#..4.....4..E.
	defb 006h,056h,005h,007h,067h,006h,008h,034h,003h,00ah,012h,001h,00bh,045h,004h,00ch	; a0b0  .V..g..4.....E..
	defb 023h,002h,00dh,023h,002h,00eh,012h,001h,00fh,000h,000h,0ffh,000h,000h,000h,001h	; a0c0  #..#............
	defb 023h,002h,002h,034h,003h,003h,012h,001h,004h,056h,005h,005h,045h,004h,006h,056h	; a0d0  #..4.....V..E..V
	defb 005h,007h,067h,006h,008h,034h,003h,00ah,012h,001h,00bh,045h,004h,00ch,023h,002h	; a0e0  ..g..4.....E..#.
	defb 00dh,034h,003h,00eh,023h,002h,00fh,000h,000h,0ffh,000h,000h,000h,001h,023h,002h	; a0f0  .4..#.........#.
	defb 002h,023h,002h,003h,012h,001h,004h,045h,004h,005h,045h,004h,006h,056h,005h,007h	; a100  .#.....E..E..V..
	defb 067h,006h,008h,034h,003h,00ah,012h,001h,00bh,034h,003h,00ch,012h,001h,00dh,023h	; a110  g..4.....4.....#
	defb 002h,00eh,012h,001h,00fh,000h,000h,0ffh,000h,000h,000h,001h,023h,002h,002h,034h	; a120  ............#..4
	defb 003h,003h,012h,001h,004h,056h,005h,005h,045h,004h,006h,056h,005h,007h,067h,006h	; a130  .....V..E..V..g.
	defb 008h,034h,003h,00ah,012h,001h,00bh,045h,004h,00ch,023h,002h,00dh,023h,002h,00eh	; a140  .4.....E..#..#..
	defb 012h,001h,00fh,000h,000h,0ffh,000h,000h,000h,001h,000h,000h,002h,000h,000h,003h	; a150  ................
	defb 000h,000h,004h,000h,000h,005h,000h,000h,006h,000h,000h,007h,000h,000h,008h,000h	; a160  ................
	defb 000h,009h,000h,000h,00ah,000h,000h,00bh,000h,000h,00ch,000h,000h,00dh,000h,000h	; a170  ................
	defb 00eh,000h,000h,00fh,000h,000h,0ffh,021h,000h,000h,011h,033h,014h,001h,050h,0d8h	; a180  .......!...3..P.
	defb 0cdh,05ah,047h,0c3h,02eh,0a2h	; a190

; ======================================================================
; CODIGO 0xa196..0xa19c  (6 bytes)
; ======================================================================


estado_1_paso_1:		; el paso 1 del estado 1 por 0xCAFB (p14:A19C): un dibujo que aparece por franjas en tres tiempos (p14:A270), el sonido 0x90, las letras de p14:A24E en (0x60, 0xA0) y 0xCAFA = 0
	ld a,(0cafbh)		;a196
	call 0424dh		;a199   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_A19C: 5 destinos del despachador p00:424D (call en p14:A199, el
;   indice en A): A1A6, A1B8, A1DA, A1E6, A208; lo leen p14:A199 (10 bytes)
;   0xa19c..0xa1a6  (10 bytes)
DATA_tabla_A19C:
	defw 0a1a6h,0a1b8h,0a1dah,0a1e6h,0a208h	; a19c

; ======================================================================
; CODIGO 0xa1a6..0xa24e  (168 bytes)
; ======================================================================


cafb_0:		; 0xCAFC = 0x0D, 0xCAFD = 1, 0xCAFA = 1 y el siguiente
	ld a,00dh		;a1a6
	ld (0cafch),a		;a1a8   ; 0xCAFC = 0x0D
	ld a,001h		;a1ab
	ld (0cafdh),a		;a1ad   ; 0xCAFD = 1...
	ld (0cafah),a		;a1b0   ; ...0xCAFA = 1
cafb_siguiente:		; 0xCAFB uno mas
	ld hl,0cafbh		;a1b3
	inc (hl)			;a1b6
	ret			;a1b7
cafb_1:		; cada 6 cuadros (0xCAFD), 0xCAFC uno menos y la franja de (0, 0) de 0xB8 x 0x0D en (0x14, 0x40); bajo 0, 0xCAFC = 0x10 y el siguiente
	ld hl,0cafdh		;a1b8
	dec (hl)			;a1bb
	ret nz			;a1bc
	ld (hl),006h		;a1bd   ; 6 cuadros
	ld hl,0cafch		;a1bf
	dec (hl)			;a1c2   ; uno menos
	ld a,(hl)			;a1c3
	inc a			;a1c4   ; bajo 0...
	jr z,cafb_1_acaba		;a1c5
	ld hl,00000h		;a1c7   ; de (0, 0)...
	ld de,01440h		;a1ca   ; ...a (0x14, 0x40)...
	ld bc,0b80dh		;a1cd   ; ...0xB8 x 0x0D
	jp franja_de_cafc		;a1d0   ; franja_de_cafc: la franja de C - 0xCAFC (en 0xCAFE) de alto copiada a la otra pagina en DE - eso, y su simetrica desde el otro lado
cafb_1_acaba:		; 0x10 cuadros
	ld a,010h		;a1d3
	ld (0cafch),a		;a1d5
	jr cafb_siguiente		;a1d8
cafb_2:		; espera 0xCAFC; luego 0x0D y el siguiente
	ld hl,0cafch		;a1da   ; la espera
	dec (hl)			;a1dd   ; uno menos
	ret nz			;a1de
	ld a,00dh		;a1df   ; luego 0x0D...
	ld (0cafch),a		;a1e1
	jr cafb_siguiente		;a1e4   ; ...y el paso siguiente
cafb_3:		; cada 6 cuadros, la franja de (0xBC, 0) de 0x18 x 0x0D en (0xD0, 0x40); bajo 0, 0xCAFC = 0x1C
	ld hl,0cafdh		;a1e6
	dec (hl)			;a1e9
	ret nz			;a1ea
	ld (hl),006h		;a1eb
	ld hl,0cafch		;a1ed
	dec (hl)			;a1f0
	ld a,(hl)			;a1f1
	inc a			;a1f2
	jr z,cafb_3_acaba		;a1f3
	ld hl,0bc00h		;a1f5   ; de (0xBC, 0)...
	ld de,0d040h		;a1f8   ; ...a (0xD0, 0x40)...
	ld bc,0180dh		;a1fb   ; ...0x18 x 0x0D
	jp franja_de_cafc		;a1fe   ; franja_de_cafc: la franja de C - 0xCAFC (en 0xCAFE) de alto copiada a la otra pagina en DE - eso, y su simetrica desde el otro lado
cafb_3_acaba:
	ld a,01ch		;a201
	ld (0cafch),a		;a203
	jr cafb_siguiente		;a206
cafb_4:		; cada 6 cuadros, la franja de (0, 0x1A) de 0xD8 x 0x1C en (0x14, 0x69); bajo 0, el sonido 0x90, las letras (p14:A22E) y 0xCAFA = 0
	ld hl,0cafdh		;a208
	dec (hl)			;a20b
	ret nz			;a20c
	ld (hl),006h		;a20d
	ld hl,0cafch		;a20f
	dec (hl)			;a212
	ld a,(hl)			;a213
	inc a			;a214
	jr z,cafb_4_acaba		;a215
	ld hl,0001ah		;a217   ; de (0, 0x1A)...
	ld de,01469h		;a21a   ; ...a (0x14, 0x69)...
	ld bc,0d81ch		;a21d   ; ...0xD8 x 0x1C
	jp franja_de_cafc		;a220   ; franja_de_cafc: la franja de C - 0xCAFC (en 0xCAFE) de alto copiada a la otra pagina en DE - eso, y su simetrica desde el otro lado
cafb_4_acaba:		; el sonido 0x90
	call 06ad6h		;a223   ; sonido_90: pide el sonido 0x90 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	call letras_a24e		;a226   ; las letras
	xor a			;a229   ; 0xCAFA = 0: se acaba
	ld (0cafah),a		;a22a
	ret			;a22d
letras_a24e:		; las letras de p14:A24E ([sitio de origen][ancho], hasta 0xFF) de 8 x 8 en (0x60, 0xA0) con la operacion 0x80
	ld de,060a0h		;a22e
	ld hl,0a24eh		;a231   ; las letras de p14:A24E
letra_a24e:
	ld a,(hl)			;a234
	inc a			;a235   ; 0xFF: se acaba
	ret z			;a236
	ld a,(hl)			;a237
	inc hl			;a238
	push hl			;a239
	ld l,(hl)			;a23a   ; el origen
	ld h,a			;a23b
	ld bc,00808h		;a23c   ; 8 x 8
	ld a,080h		;a23f   ; con la operacion 0x80
	push de			;a241
	call 047edh		;a242   ; copia_rectangulo_logica: orden LMMM del VDP con la operacion logica de A
	pop de			;a245
	pop hl			;a246
	inc hl			;a247
	ld a,(hl)			;a248   ; + el ancho
	add a,d			;a249
	ld d,a			;a24a
	inc hl			;a24b
	jr letra_a24e		;a24c

; ----------------------------------------------------------------------
; DATOS resto_A24E: lo apuntan con el banco puesto p14:A231 (0xA24E); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p14:A231 (34 bytes)
;   0xa24e..0xa270  (34 bytes)
DATA_resto_A24E:
	defb 018h,010h,00ch,0e8h,008h,006h,090h,008h,005h,088h,008h,006h,030h,008h,005h,080h	; a24e  ............0...
	defb 008h,007h,070h,008h,006h,0d0h,008h,004h,0d8h,008h,005h,0d8h,008h,005h,0e0h,008h	; a25e  ..p.............
	defb 008h,0ffh	; a26e

; ======================================================================
; CODIGO 0xa270..0xa29f  (47 bytes)
; ======================================================================


franja_de_cafc:		; la franja de C - 0xCAFC (en 0xCAFE) de alto copiada a la otra pagina en DE - eso, y su simetrica desde el otro lado
	push bc			;a270
	push hl			;a271
	push hl			;a272
	ld a,(0cafch)		;a273   ; 0xCAFC
	ld h,a			;a276
	ld a,c			;a277
	sub h			;a278
	ld (0cafeh),a		;a279   ; lo que va, en 0xCAFE
	ld c,a			;a27c
	pop hl			;a27d
	push de			;a27e
	ld a,e			;a27f   ; DE arriba...
	sub c			;a280
	ld e,a			;a281
	call 0475ah		;a282   ; ...a la otra pagina
	pop de			;a285
	pop hl			;a286
	pop bc			;a287
	ld a,c			;a288
	add a,a			;a289   ; 2C...
	ld c,a			;a28a
	ld a,(0cafeh)		;a28b
	push af			;a28e
	neg		;a28f   ; ...- lo que va...
	add a,c			;a291
	add a,l			;a292   ; ...el otro lado
	ld l,a			;a293
	pop af			;a294
	ld c,a			;a295
	jp 0475ah		;a296   ; a la otra pagina
estado_1_paso_1_b:		; el paso 1 de vuelta por 0xCAFB (p14:A29F): la paleta de p13:9258, hacia la de p13:9278 cada 2 cuadros, 0x20 de espera y 0xCAFA = 0
	ld a,(0cafbh)		;a299
	call 0424dh		;a29c   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_A29F: 4 destinos del despachador p00:424D (call en p14:A29C, el
;   indice en A): A2A7, A2AD, A2C2, A2CA; lo leen p14:A29C (8 bytes)
;   0xa29f..0xa2a7  (8 bytes)
DATA_tabla_A29F:
	defw 0a2a7h,0a2adh,0a2c2h,0a2cah	; a29f  -> cafb_b_0 cafb_b_1 cafb_b_2 cafb_b_3

; ======================================================================
; CODIGO 0xa2a7..0xa2d7  (48 bytes)
; ======================================================================


cafb_b_0:
	call 091f0h		;a2a7   ; paleta_9258: en 0xE900, la paleta de p13:9258 ([n][rojo-azul][verde]) y 0xFF
	jp cafb_siguiente		;a2aa   ; cafb_siguiente: 0xCAFB uno mas
cafb_b_1:
	ld a,(0ca03h)		;a2ad   ; lee el contador de cuadros (uno mas en cada interrupcion)
	and 001h		;a2b0   ; cada 2 cuadros
	ret nz			;a2b2
	ld de,09278h		;a2b3   ; hacia la de p13:9278
	call 09175h		;a2b6   ; paleta_hacia: la paleta de 0xE900 un paso hacia la de DE (con A = 1, hacia el otro lado) y puesta; NZ mientras no sea igual
	ret nz			;a2b9
	ld a,020h		;a2ba   ; 0x20 cuadros
	ld (0cafch),a		;a2bc
	jp cafb_siguiente		;a2bf   ; cafb_siguiente: 0xCAFB uno mas
cafb_b_2:		; espera 0xCAFC
	ld hl,0cafch		;a2c2
	dec (hl)			;a2c5
	ret nz			;a2c6
	jp cafb_siguiente		;a2c7   ; cafb_siguiente: 0xCAFB uno mas
cafb_b_3:		; 0xCAFA = 0
	xor a			;a2ca
	ld (0cafah),a		;a2cb
	ret			;a2ce
presentacion_80:		; los pasos 0x80-0xA5 de la presentacion (p14:A2D7): pantallas de letras de 16 x 16 que se escriben (p14:A564) con dibujos que aparecen y se van con la paleta
	ld a,(0ca2ch)		;a2cf   ; lee el paso de la presentacion (1-0x41; 0 se acaba, desde 0x80 p14:A2CF)
	sub 080h		;a2d2   ; desde 0x80
	call 0424dh		;a2d4   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_A2D7: 38 destinos del despachador p00:424D (call en p14:A2D4, el
;   indice en A): A323, A33C, A36D, A34C, A373, A36D, A38F, A33C, A36D, A3B3,
;   A33C, A36D, A3CF, A3EF, A36D, A403, A33C, A36D, A427, A33C, A36D, A443,
;   A464, A36D, A479, A33C, A36D, A49E, A4BF, A36D, A4DC, A33C, A36D, A501,
;   A33C, A36D, A521, A52B; lo leen p14:A2D4 (76 bytes)
;   0xa2d7..0xa323  (76 bytes)
DATA_tabla_A2D7:
	defw 0a323h,0a33ch,0a36dh,0a34ch,0a373h,0a36dh,0a38fh,0a33ch	; a2d7
	defw 0a36dh,0a3b3h,0a33ch,0a36dh,0a3cfh,0a3efh,0a36dh,0a403h	; a2e7
	defw 0a33ch,0a36dh,0a427h,0a33ch,0a36dh,0a443h,0a464h,0a36dh	; a2f7
	defw 0a479h,0a33ch,0a36dh,0a49eh,0a4bfh,0a36dh,0a4dch,0a33ch	; a307
	defw 0a36dh,0a501h,0a33ch,0a36dh,0a521h,0a52bh	; a317

; ======================================================================
; CODIGO 0xa323..0xa766  (1091 bytes)
; ======================================================================


pres_80:		; la paleta a negro (p14:A53C), las letras de p14:A7DE en (0x28, 0x40) cada 0x0C cuadros, la pagina 0 borrada, el sonido 0x9A y el siguiente
	call paleta_a_negro_b		;a323   ; paleta_a_negro_b: los colores 0-14 a negro y el 15 blanco (p14:A549)
	ld hl,0a7deh		;a326   ; las letras de p14:A7DE...
	ld a,00ch		;a329   ; ...cada 0x0C...
	ld de,02840h		;a32b   ; ...en (0x28, 0x40)
	call letras_grandes		;a32e   ; letras_grandes: las letras grandes: la lista HL en 0xCA31, el sitio DE en 0xCA33, cada A cuadros (0xCA36), la columna 0xCA37 = 0 y la cuenta 0xCA35 = 1
	ld d,000h		;a331
	call 04be4h		;a333   ; borra_toda_la_pagina: p00:46FF desde (0,0) con BC = 0 y A = 0 en la pagina D
	call 06c27h		;a336   ; sonido_9a: pide el sonido 0x9A (de los que tienen la partitura en un banco de musica, p16:4CE3)
	jp pres_80_siguiente		;a339   ; pres_80_siguiente: 0xCA2C uno mas
pres_letras:		; las letras (p14:A564) hasta el final; luego la espera de p14:A645, la cuenta 0xC0 y el siguiente
	call letra_grande		;a33c   ; letra_grande: cada 0xCA36 cuadros una letra de 0xCA31: su dibujo de 16 x 16 (nibbles alto y bajo, Y y X) en el sitio + columna * 16 con la operacion 0xC8; 0xFD [X]: otra linea desde esa X; 0xFE: otra linea 0x18 mas abajo; 0xFF: se acaba (sin acarreo); acarreo mientras sigue
	ret c			;a33f   ; aun no
	call espera_ca38		;a340   ; espera_ca38: 0xCA38 = 0x41
	ld hl,000c0h		;a343   ; 0xC0 cuadros
	ld (0ca2eh),hl		;a346   ; guarda la cuenta de cuadros del paso de la presentacion (16 bits)
	jp pres_80_siguiente		;a349   ; pres_80_siguiente: 0xCA2C uno mas
pres_83:		; el color 15 a la baja (p14:A65C); al acabar, el dibujo de p14:A680, las letras de p14:A800 en (8, 0x20) cada 8, la paleta de p14:A766 desde negro (p14:A5C5) y el color 15 blanco
	call color_15_baja		;a34c   ; color_15_baja: con 0xCA38: uno menos y cada 8 el color 15 uno menos (p13:9135); acarreo mientras quede
	ret c			;a34f
	call pantalla_7080		;a350   ; pantalla_7080: el dibujo y p14:A683
	ld hl,0a800h		;a353   ; las letras de p14:A800...
	ld a,008h		;a356   ; ...cada 8...
	ld de,00820h		;a358   ; ...en (8, 0x20)
	call letras_grandes		;a35b   ; letras_grandes: las letras grandes: la lista HL en 0xCA31, el sitio DE en 0xCA33, cada A cuadros (0xCA36), la columna 0xCA37 = 0 y la cuenta 0xCA35 = 1
	ld de,0a766h		;a35e   ; desde negro hacia p14:A766
	call paleta_desde_negro		;a361   ; paleta_desde_negro: 0xCA38 = 0x81 y la paleta de 0xE900 a negro (15 colores y 0xFF)
	call 04650h		;a364   ; espera_vdp: espera a que el VDP acabe la orden en curso (S#2 bit 0)
	call color_15_blanco		;a367   ; el color 15 blanco
	jp pres_80_siguiente		;a36a   ; pres_80_siguiente: 0xCA2C uno mas
pres_espera:		; la cuenta del paso; al acabar, el siguiente
	call pres_80_cuenta		;a36d   ; pres_80_cuenta: 0xCA2E-0xCA2F uno menos; Z al llegar a 0
	ret nz			;a370
	jr pres_80_siguiente		;a371
pres_84:		; las letras; mientras, desde la columna 0x38, la paleta hacia p14:A766 (p14:A5E7); al acabar, la cuenta 0x80 y la espera de p14:A645
	call letra_grande		;a373   ; letra_grande: cada 0xCA36 cuadros una letra de 0xCA31: su dibujo de 16 x 16 (nibbles alto y bajo, Y y X) en el sitio + columna * 16 con la operacion 0xC8; 0xFD [X]: otra linea desde esa X; 0xFE: otra linea 0x18 mas abajo; 0xFF: se acaba (sin acarreo); acarreo mientras sigue
	jr nc,pres_84_acaba		;a376   ; acabadas, aparte
	ld a,(0ca33h)		;a378   ; lee el sitio de la primera linea del texto de la presentacion
	cp 038h		;a37b   ; por debajo de 0x38, nada
	ret c			;a37d
	ld de,0a766h		;a37e   ; hacia p14:A766
	jp paleta_hacia_de		;a381   ; paleta_hacia_de: con 0xCA38: uno menos y cada 16, la paleta de 0xE900 un paso hacia la de DE (15 colores) y puesta; NZ mientras no sean iguales
pres_84_acaba:		; 0x80 cuadros
	ld hl,00080h		;a384
	ld (0ca2eh),hl		;a387   ; guarda la cuenta de cuadros del paso de la presentacion (16 bits)
	call espera_ca38		;a38a   ; espera_ca38: 0xCA38 = 0x41
	jr pres_80_siguiente		;a38d
pres_86:		; el color 15 a la baja; en 0x20 de 0xCA38, el dibujo de p14:A672; al acabar, la pantalla de p14:A683, las letras de p14:A847 en (8, 0x50) cada 0x0C y el color 15 blanco
	call color_15_baja		;a38f   ; color_15_baja: con 0xCA38: uno menos y cada 8 el color 15 uno menos (p13:9135); acarreo mientras quede
	jr nc,pres_86_acaba		;a392   ; acabado, aparte
	ld a,(0ca38h)		;a394   ; en 0x20...
	cp 020h		;a397
	ret nz			;a399
	jp dibujo_7080		;a39a   ; ...el dibujo
pres_86_acaba:
	call marco_7080		;a39d   ; marco_7080: a 0 lo de alrededor: (8, 8) 0xF0 x 0x38, (8, 0x40) 0x60 x 0x80, (0xE8, 0x40) 0x10 x 0x80, (0x68, 0xB8) 0x80 x 8
	ld hl,0a847h		;a3a0   ; las letras de p14:A847...
	ld a,00ch		;a3a3   ; ...cada 0x0C...
	ld de,00850h		;a3a5   ; ...en (8, 0x50)
	call letras_grandes		;a3a8   ; letras_grandes: las letras grandes: la lista HL en 0xCA31, el sitio DE en 0xCA33, cada A cuadros (0xCA36), la columna 0xCA37 = 0 y la cuenta 0xCA35 = 1
	call 04650h		;a3ab   ; espera_vdp: espera a que el VDP acabe la orden en curso (S#2 bit 0)
	call color_15_blanco		;a3ae   ; color_15_blanco: el color 15 = (7, 7, 7)
	jr pres_80_siguiente		;a3b1
pres_89:		; la paleta a negro (p14:A64B); al acabar, la pagina 0 borrada, las letras de p14:A85D en (0x38, 0x40) cada 8 y el color 15 blanco
	call a_negro_ca38		;a3b3   ; a_negro_ca38: con 0xCA38: uno menos y cada 8 la paleta a negro (p13:90FD); acarreo mientras quede; sin el, sin acarreo
	ret c			;a3b6
	ld d,000h		;a3b7
	call 04be4h		;a3b9   ; borra_toda_la_pagina: p00:46FF desde (0,0) con BC = 0 y A = 0 en la pagina D
	ld hl,0a85dh		;a3bc   ; las letras de p14:A85D...
	ld a,008h		;a3bf   ; ...cada 8...
	ld de,03840h		;a3c1   ; ...en (0x38, 0x40)
	call letras_grandes		;a3c4   ; letras_grandes: las letras grandes: la lista HL en 0xCA31, el sitio DE en 0xCA33, cada A cuadros (0xCA36), la columna 0xCA37 = 0 y la cuenta 0xCA35 = 1
	call 04650h		;a3c7   ; espera_vdp: espera a que el VDP acabe la orden en curso (S#2 bit 0)
	call color_15_blanco		;a3ca   ; color_15_blanco: el color 15 = (7, 7, 7)
	jr pres_80_siguiente		;a3cd
pres_8c:		; el color 15 a la baja; al acabar, el dibujo de p14:A6BD, las letras de p14:A870 en (8, 0x40) cada 8, la paleta de p14:A784 desde negro y el color 15
	call color_15_baja		;a3cf   ; color_15_baja: con 0xCA38: uno menos y cada 8 el color 15 uno menos (p13:9135); acarreo mientras quede
	ret c			;a3d2
	call pantalla_0000		;a3d3   ; pantalla_0000:
	ld hl,0a870h		;a3d6   ; las letras de p14:A870...
	ld a,008h		;a3d9
	ld de,00840h		;a3db   ; ...en (8, 0x40)
	call letras_grandes		;a3de   ; letras_grandes: las letras grandes: la lista HL en 0xCA31, el sitio DE en 0xCA33, cada A cuadros (0xCA36), la columna 0xCA37 = 0 y la cuenta 0xCA35 = 1
	ld de,0a784h		;a3e1   ; desde negro hacia p14:A784
	call paleta_desde_negro		;a3e4   ; paleta_desde_negro: 0xCA38 = 0x81 y la paleta de 0xE900 a negro (15 colores y 0xFF)
	call color_15_blanco		;a3e7   ; color_15_blanco: el color 15 = (7, 7, 7)
pres_80_siguiente:		; 0xCA2C uno mas
	ld hl,0ca2ch		;a3ea   ; apunta a el paso de la presentacion (1-0x41; 0 se acaba, desde 0x80 p14:A2CF)
	inc (hl)			;a3ed
	ret			;a3ee
pres_8d:		; las letras con la paleta hacia p14:A784; al acabar, la espera, 0x80 y el siguiente
	call letra_grande		;a3ef   ; letra_grande: cada 0xCA36 cuadros una letra de 0xCA31: su dibujo de 16 x 16 (nibbles alto y bajo, Y y X) en el sitio + columna * 16 con la operacion 0xC8; 0xFD [X]: otra linea desde esa X; 0xFE: otra linea 0x18 mas abajo; 0xFF: se acaba (sin acarreo); acarreo mientras sigue
	ld de,0a784h		;a3f2
	jp c,paleta_hacia_de		;a3f5   ; paleta_hacia_de: con 0xCA38: uno menos y cada 16, la paleta de 0xE900 un paso hacia la de DE (15 colores) y puesta; NZ mientras no sean iguales
	ld hl,00080h		;a3f8   ; 0x80 cuadros
	ld (0ca2eh),hl		;a3fb   ; guarda la cuenta de cuadros del paso de la presentacion (16 bits)
	call espera_ca38		;a3fe   ; espera_ca38: 0xCA38 = 0x41
	jr pres_80_siguiente		;a401
pres_8f:		; el color 15 a la baja; en 0x20, el dibujo de p14:A6AF; al acabar, la pantalla de p14:A6C0 y las letras de p14:A895 en (8, 0x20) cada 8
	call color_15_baja		;a403   ; color_15_baja: con 0xCA38: uno menos y cada 8 el color 15 uno menos (p13:9135); acarreo mientras quede
	jr nc,pres_8f_acaba		;a406
	ld a,(0ca38h)		;a408   ; en 0x20...
	cp 020h		;a40b
	ret nz			;a40d
	jp dibujo_0000		;a40e   ; ...el dibujo
pres_8f_acaba:
	call marco_0000		;a411   ; marco_0000: a 0 lo de alrededor: (8, 8) 0xF0 x 0x10, (8, 0x18) 0x10 x 0x70, (0xB8, 0x18) 0x40 x 0x70, (8, 0x88) 0xF0 x 0x38
	ld hl,0a895h		;a414   ; las letras de p14:A895
	ld a,008h		;a417
	ld de,00820h		;a419
	call letras_grandes		;a41c   ; letras_grandes: las letras grandes: la lista HL en 0xCA31, el sitio DE en 0xCA33, cada A cuadros (0xCA36), la columna 0xCA37 = 0 y la cuenta 0xCA35 = 1
	call 04650h		;a41f   ; espera_vdp: espera a que el VDP acabe la orden en curso (S#2 bit 0)
	call color_15_blanco		;a422   ; color_15_blanco: el color 15 = (7, 7, 7)
	jr pres_80_siguiente		;a425
pres_92:		; la paleta a negro; al acabar, la pagina 0 borrada y las letras de p14:A8EA en (0x18, 0x38) cada 0x0C
	call a_negro_ca38		;a427   ; a_negro_ca38: con 0xCA38: uno menos y cada 8 la paleta a negro (p13:90FD); acarreo mientras quede; sin el, sin acarreo
	ret c			;a42a
	ld d,000h		;a42b
	call 04be4h		;a42d   ; borra_toda_la_pagina: p00:46FF desde (0,0) con BC = 0 y A = 0 en la pagina D
	ld hl,0a8eah		;a430   ; las letras de p14:A8EA
	ld a,00ch		;a433
	ld de,01838h		;a435
	call letras_grandes		;a438   ; letras_grandes: las letras grandes: la lista HL en 0xCA31, el sitio DE en 0xCA33, cada A cuadros (0xCA36), la columna 0xCA37 = 0 y la cuenta 0xCA35 = 1
	call 04650h		;a43b   ; espera_vdp: espera a que el VDP acabe la orden en curso (S#2 bit 0)
	call color_15_blanco		;a43e   ; color_15_blanco: el color 15 = (7, 7, 7)
	jr pres_80_siguiente		;a441
pres_95:		; el color 15 a la baja; al acabar, el dibujo de p14:A6FA, las letras de p14:A90C en (8, 0x20) cada 8 y la paleta de p14:A7A2 desde negro
	call color_15_baja		;a443   ; color_15_baja: con 0xCA38: uno menos y cada 8 el color 15 uno menos (p13:9135); acarreo mientras quede
	ret c			;a446
	call pantalla_7000		;a447   ; pantalla_7000:
	ld hl,0a90ch		;a44a   ; las letras de p14:A90C
	ld a,008h		;a44d
	ld de,00820h		;a44f
	call letras_grandes		;a452   ; letras_grandes: las letras grandes: la lista HL en 0xCA31, el sitio DE en 0xCA33, cada A cuadros (0xCA36), la columna 0xCA37 = 0 y la cuenta 0xCA35 = 1
	ld de,0a7a2h		;a455   ; desde negro hacia p14:A7A2
	call paleta_desde_negro		;a458   ; paleta_desde_negro: 0xCA38 = 0x81 y la paleta de 0xE900 a negro (15 colores y 0xFF)
	call 04650h		;a45b   ; espera_vdp: espera a que el VDP acabe la orden en curso (S#2 bit 0)
	call color_15_blanco		;a45e   ; color_15_blanco: el color 15 = (7, 7, 7)
	jp pres_80_siguiente		;a461   ; pres_80_siguiente: 0xCA2C uno mas
pres_96:		; las letras con la paleta hacia p14:A7A2; al acabar, la espera y 0x80
	call letra_grande		;a464   ; letra_grande: cada 0xCA36 cuadros una letra de 0xCA31: su dibujo de 16 x 16 (nibbles alto y bajo, Y y X) en el sitio + columna * 16 con la operacion 0xC8; 0xFD [X]: otra linea desde esa X; 0xFE: otra linea 0x18 mas abajo; 0xFF: se acaba (sin acarreo); acarreo mientras sigue
	ld de,0a7a2h		;a467
	jp c,paleta_hacia_de		;a46a   ; paleta_hacia_de: con 0xCA38: uno menos y cada 16, la paleta de 0xE900 un paso hacia la de DE (15 colores) y puesta; NZ mientras no sean iguales
	call espera_ca38		;a46d   ; espera_ca38: 0xCA38 = 0x41
	ld hl,00080h		;a470
	ld (0ca2eh),hl		;a473   ; guarda la cuenta de cuadros del paso de la presentacion (16 bits)
	jp pres_80_siguiente		;a476   ; pres_80_siguiente: 0xCA2C uno mas
pres_98:		; el color 15 a la baja; en 0x20, el dibujo de p14:A6EC; al acabar, la pantalla de p14:A6FD y las letras de p14:A962 en (8, 0x38) cada 8
	call color_15_baja		;a479   ; color_15_baja: con 0xCA38: uno menos y cada 8 el color 15 uno menos (p13:9135); acarreo mientras quede
	jr nc,pres_98_acaba		;a47c
	ld a,(0ca38h)		;a47e   ; en 0x20...
	cp 020h		;a481
	ret nz			;a483
	jp dibujo_7000		;a484   ; ...el dibujo
pres_98_acaba:
	call marco_7000		;a487   ; marco_7000: a 0 lo de alrededor: (8, 8) 0xF0 x 0x10, (8, 0x18) 0x60 x 0x78, (0xE8, 0x18) 0x10 x 0x78, (8, 0x90) 0xF0 x 0x30
	ld hl,0a962h		;a48a   ; las letras de p14:A962
	ld a,008h		;a48d
	ld de,00838h		;a48f
	call letras_grandes		;a492   ; letras_grandes: las letras grandes: la lista HL en 0xCA31, el sitio DE en 0xCA33, cada A cuadros (0xCA36), la columna 0xCA37 = 0 y la cuenta 0xCA35 = 1
	call 04650h		;a495   ; espera_vdp: espera a que el VDP acabe la orden en curso (S#2 bit 0)
	call color_15_blanco		;a498   ; color_15_blanco: el color 15 = (7, 7, 7)
	jp pres_80_siguiente		;a49b   ; pres_80_siguiente: 0xCA2C uno mas
pres_9b:		; la paleta a negro; al acabar, el dibujo de p14:A737, las letras de p14:A9A1 en (8, 0x20) cada 8 y la paleta de p14:A7C0 desde negro
	call a_negro_ca38		;a49e   ; a_negro_ca38: con 0xCA38: uno menos y cada 8 la paleta a negro (p13:90FD); acarreo mientras quede; sin el, sin acarreo
	ret c			;a4a1
	call pantalla_a000		;a4a2   ; pantalla_a000:
	ld hl,0a9a1h		;a4a5   ; las letras de p14:A9A1
	ld a,008h		;a4a8
	ld de,00820h		;a4aa
	call letras_grandes		;a4ad   ; letras_grandes: las letras grandes: la lista HL en 0xCA31, el sitio DE en 0xCA33, cada A cuadros (0xCA36), la columna 0xCA37 = 0 y la cuenta 0xCA35 = 1
	ld de,0a7c0h		;a4b0   ; desde negro hacia p14:A7C0
	call paleta_desde_negro		;a4b3   ; paleta_desde_negro: 0xCA38 = 0x81 y la paleta de 0xE900 a negro (15 colores y 0xFF)
	call 04650h		;a4b6   ; espera_vdp: espera a que el VDP acabe la orden en curso (S#2 bit 0)
	call color_15_blanco		;a4b9   ; color_15_blanco: el color 15 = (7, 7, 7)
	jp pres_80_siguiente		;a4bc   ; pres_80_siguiente: 0xCA2C uno mas
pres_9c:		; las letras; desde la columna 0x38, la paleta hacia p14:A7C0; al acabar, la espera y 0x80
	call letra_grande		;a4bf   ; letra_grande: cada 0xCA36 cuadros una letra de 0xCA31: su dibujo de 16 x 16 (nibbles alto y bajo, Y y X) en el sitio + columna * 16 con la operacion 0xC8; 0xFD [X]: otra linea desde esa X; 0xFE: otra linea 0x18 mas abajo; 0xFF: se acaba (sin acarreo); acarreo mientras sigue
	jr nc,pres_9c_acaba		;a4c2
	ld a,(0ca33h)		;a4c4   ; lee el sitio de la primera linea del texto de la presentacion
	cp 038h		;a4c7
	ret c			;a4c9   ; por debajo de 0x38, nada
	ld de,0a7c0h		;a4ca
	jp paleta_hacia_de		;a4cd   ; paleta_hacia_de: con 0xCA38: uno menos y cada 16, la paleta de 0xE900 un paso hacia la de DE (15 colores) y puesta; NZ mientras no sean iguales
pres_9c_acaba:
	call espera_ca38		;a4d0   ; espera_ca38: 0xCA38 = 0x41
	ld hl,00080h		;a4d3
	ld (0ca2eh),hl		;a4d6   ; guarda la cuenta de cuadros del paso de la presentacion (16 bits)
	jp pres_80_siguiente		;a4d9   ; pres_80_siguiente: 0xCA2C uno mas
pres_9e:		; el color 15 a la baja; en 0x20, el dibujo de p14:A729; al acabar, la pantalla de p14:A73A y las letras de p14:A9F9 en (8, 0x38) cada 8
	call color_15_baja		;a4dc   ; color_15_baja: con 0xCA38: uno menos y cada 8 el color 15 uno menos (p13:9135); acarreo mientras quede
	jr nc,pres_9e_acaba		;a4df
	ld a,(0ca38h)		;a4e1   ; en 0x20...
	cp 020h		;a4e4
	ret nz			;a4e6
	jp dibujo_a000		;a4e7   ; ...el dibujo
pres_9e_acaba:
	call marco_a000		;a4ea   ; marco_a000: a 0 lo de alrededor: (8, 8) 0xF0 x 0x38, (8, 0x40) 0x10 x 0x80, (0x70, 0x40) 0x88 x 0x80, (0x18, 0xB0) 0x58 x 0x10
	ld hl,0a9f9h		;a4ed   ; las letras de p14:A9F9
	ld a,008h		;a4f0
	ld de,00838h		;a4f2
	call letras_grandes		;a4f5   ; letras_grandes: las letras grandes: la lista HL en 0xCA31, el sitio DE en 0xCA33, cada A cuadros (0xCA36), la columna 0xCA37 = 0 y la cuenta 0xCA35 = 1
	call 04650h		;a4f8   ; espera_vdp: espera a que el VDP acabe la orden en curso (S#2 bit 0)
	call color_15_blanco		;a4fb   ; color_15_blanco: el color 15 = (7, 7, 7)
	jp pres_80_siguiente		;a4fe   ; pres_80_siguiente: 0xCA2C uno mas
pres_a1:		; la paleta a negro; al acabar, la pagina 0 borrada, las letras de p14:AA28 en (0x10, 0x50) cada 0x0C, la espera y el color 15
	call a_negro_ca38		;a501   ; a_negro_ca38: con 0xCA38: uno menos y cada 8 la paleta a negro (p13:90FD); acarreo mientras quede; sin el, sin acarreo
	ret c			;a504
	ld d,000h		;a505
	call 04be4h		;a507   ; borra_toda_la_pagina: p00:46FF desde (0,0) con BC = 0 y A = 0 en la pagina D
	ld hl,0aa28h		;a50a   ; las letras de p14:AA28
	ld a,00ch		;a50d
	ld de,01050h		;a50f
	call letras_grandes		;a512   ; letras_grandes: las letras grandes: la lista HL en 0xCA31, el sitio DE en 0xCA33, cada A cuadros (0xCA36), la columna 0xCA37 = 0 y la cuenta 0xCA35 = 1
	call espera_ca38		;a515   ; espera_ca38: 0xCA38 = 0x41
	call 04650h		;a518   ; espera_vdp: espera a que el VDP acabe la orden en curso (S#2 bit 0)
	call color_15_blanco		;a51b   ; color_15_blanco: el color 15 = (7, 7, 7)
	jp pres_80_siguiente		;a51e   ; pres_80_siguiente: 0xCA2C uno mas
pres_a4:		; la paleta a negro; al acabar, la orden 0xF6 al sonido
	call a_negro_ca38		;a521   ; a_negro_ca38: con 0xCA38: uno menos y cada 8 la paleta a negro (p13:90FD); acarreo mientras quede; sin el, sin acarreo
	ret c			;a524
	call 06be8h		;a525   ; orden_sonido_f6: la orden 0xF6 al sonido
	jp pres_80_siguiente		;a528   ; pres_80_siguiente: 0xCA2C uno mas
pres_a5:		; 0xCA2C = 0: la presentacion se acaba
	xor a			;a52b
	ld (0ca2ch),a		;a52c   ; guarda el paso de la presentacion (1-0x41; 0 se acaba, desde 0x80 p14:A2CF)
	ret			;a52f
pres_80_cuenta:		; 0xCA2E-0xCA2F uno menos; Z al llegar a 0
	ld bc,(0ca2eh)		;a530   ; lee la cuenta de cuadros del paso de la presentacion (16 bits)
	dec bc			;a534
	ld (0ca2eh),bc		;a535   ; guarda la cuenta de cuadros del paso de la presentacion (16 bits)
	ld a,b			;a539
	or c			;a53a
	ret			;a53b
paleta_a_negro_b:		; los colores 0-14 a negro y el 15 blanco (p14:A549)
	ld bc,00f00h		;a53c
color_a_negro_b:		; 15 colores desde el 0
	ld a,c			;a53f
	ld de,00000h		;a540   ; negro
	call 04614h		;a543   ; pon_color: el color A de la paleta = D (rojo y azul), E (verde)
	inc c			;a546   ; el siguiente
	djnz color_a_negro_b		;a547
color_15_blanco:		; el color 15 = (7, 7, 7)
	ld a,00fh		;a549
	ld de,07707h		;a54b
	jp 04614h		;a54e   ; pon_color: el color A de la paleta = D (rojo y azul), E (verde)
letras_grandes:		; las letras grandes: la lista HL en 0xCA31, el sitio DE en 0xCA33, cada A cuadros (0xCA36), la columna 0xCA37 = 0 y la cuenta 0xCA35 = 1
	ld (0ca31h),hl		;a551   ; guarda lo que falta del dibujo que se abre en la presentacion y el byte siguiente (16 bits)
	ld (0ca33h),de		;a554   ; el sitio
	ld (0ca36h),a		;a558   ; cada A cuadros
	xor a			;a55b
	ld (0ca37h),a		;a55c   ; la columna 0
	inc a			;a55f
	ld (0ca35h),a		;a560   ; la cuenta 1
	ret			;a563
letra_grande:		; cada 0xCA36 cuadros una letra de 0xCA31: su dibujo de 16 x 16 (nibbles alto y bajo, Y y X) en el sitio + columna * 16 con la operacion 0xC8; 0xFD [X]: otra linea desde esa X; 0xFE: otra linea 0x18 mas abajo; 0xFF: se acaba (sin acarreo); acarreo mientras sigue
	ld hl,0ca35h		;a564   ; apunta a las letras de la primera linea (banco 53)
	dec (hl)			;a567   ; la cuenta
	ld a,(hl)			;a568
	and a			;a569
	scf			;a56a   ; acarreo: sigue
	ret nz			;a56b
	ld a,(0ca36h)		;a56c   ; la cuenta otra vez
	ld (hl),a			;a56f
	ld hl,(0ca31h)		;a570   ; la letra
	ld a,(hl)			;a573
	inc hl			;a574
	ld (0ca31h),hl		;a575   ; guarda lo que falta del dibujo que se abre en la presentacion y el byte siguiente (16 bits)
	ld c,a			;a578
	inc a			;a579   ; 0xFF: se acaba
	jr z,letras_acaban		;a57a
	inc a			;a57c   ; 0xFE: otra linea
	jr z,letra_otra_linea		;a57d
	inc a			;a57f   ; 0xFD: otra Y
	jr z,letra_otra_y		;a580
	ld a,c			;a582   ; el nibble bajo * 16...
	and 0f0h		;a583
	ld l,a			;a585
	ld a,c			;a586   ; ...y el alto * 16: el origen
	rrca			;a587
	rrca			;a588
	rrca			;a589
	rrca			;a58a
	and 0f0h		;a58b
	ld h,a			;a58d
	ld a,(0ca37h)		;a58e   ; la columna...
	add a,a			;a591   ; ...* 16...
	add a,a			;a592
	add a,a			;a593
	add a,a			;a594
	ld de,(0ca33h)		;a595   ; ...+ el sitio
	add a,d			;a599
	ld d,a			;a59a
	ld bc,01010h		;a59b   ; 16 x 16
	ld a,0c8h		;a59e   ; con la operacion 0xC8
	call 047edh		;a5a0   ; copia_rectangulo_logica: orden LMMM del VDP con la operacion logica de A
	ld hl,0ca37h		;a5a3   ; la columna siguiente
	inc (hl)			;a5a6
	scf			;a5a7   ; acarreo
	ret			;a5a8
letra_otra_y:		; la X del siguiente byte (0xCA34)
	ld a,(hl)			;a5a9
	ld (0ca34h),a		;a5aa
	inc hl			;a5ad
	ld (0ca31h),hl		;a5ae   ; guarda lo que falta del dibujo que se abre en la presentacion y el byte siguiente (16 bits)
letra_otra_linea:
	xor a			;a5b1
	ld (0ca37h),a		;a5b2   ; columna 0
	ld de,(0ca33h)		;a5b5   ; lee el sitio de la primera linea del texto de la presentacion y el byte siguiente (16 bits)
	ld a,e			;a5b9
	add a,018h		;a5ba   ; 0x18 mas abajo
	ld e,a			;a5bc
	ld (0ca33h),de		;a5bd   ; guarda el sitio de la primera linea del texto de la presentacion y el byte siguiente (16 bits)
	scf			;a5c1
	ret			;a5c2
letras_acaban:		; sin acarreo
	or a			;a5c3
	ret			;a5c4
paleta_desde_negro:		; 0xCA38 = 0x81 y la paleta de 0xE900 a negro (15 colores y 0xFF)
	ld a,081h		;a5c5
	ld (0ca38h),a		;a5c7   ; la cuenta 0x81
	ld hl,0e900h		;a5ca   ; 0x31 bytes a 0
	ld de,0e901h		;a5cd
	ld bc,00030h		;a5d0
	ld (hl),000h		;a5d3
	ldir		;a5d5
	xor a			;a5d7
	ld b,00fh		;a5d8   ; 15 colores
	ld hl,0e900h		;a5da   ; la paleta en 0xE900: (color, 0, 0) x 15
color_negro_b:
	ld (hl),a			;a5dd   ; el numero de color
	inc hl			;a5de   ; el rojo y el azul, el verde: a 0
	inc hl			;a5df
	inc hl			;a5e0
	inc a			;a5e1   ; el color siguiente
	djnz color_negro_b		;a5e2   ; 15
	ld (hl),0ffh		;a5e4   ; el final
	ret			;a5e6
paleta_hacia_de:		; con 0xCA38: uno menos y cada 16, la paleta de 0xE900 un paso hacia la de DE (15 colores) y puesta; NZ mientras no sean iguales
	ld hl,0ca38h		;a5e7
	ld a,(hl)			;a5ea
	and a			;a5eb
	ret z			;a5ec   ; sin 0xCA38, nada
	dec (hl)			;a5ed   ; uno menos
	ld a,(hl)			;a5ee
	and 00fh		;a5ef   ; cada 16
	ret nz			;a5f1
	push de			;a5f2
	ld hl,0e901h		;a5f3
	ld b,00fh		;a5f6   ; 15 colores
color_hacia_de:
	push bc			;a5f8
	ld a,(de)			;a5f9   ; el rojo de DE...
	and 0f0h		;a5fa
	ld b,a			;a5fc
	ld a,(hl)			;a5fd   ; ...y el de HL
	and 0f0h		;a5fe
	cp b			;a600
	jr z,color_hacia_azul		;a601
	add a,010h		;a603   ; uno mas
color_hacia_azul:
	ld c,a			;a605
	ld a,(de)			;a606   ; el azul
	and 00fh		;a607
	ld b,a			;a609
	ld a,(hl)			;a60a
	and 00fh		;a60b
	cp b			;a60d
	jr z,pon_rojo_azul_b		;a60e
	inc a			;a610   ; uno mas
pon_rojo_azul_b:
	or c			;a611
	ld (hl),a			;a612
	inc hl			;a613
	inc de			;a614
	ld a,(de)			;a615   ; el verde
	and 00fh		;a616
	ld b,a			;a618
	ld a,(hl)			;a619
	and 00fh		;a61a
	cp b			;a61c
	jr z,pon_verde_c		;a61d
	inc a			;a61f   ; uno mas
pon_verde_c:
	ld (hl),a			;a620
	inc hl			;a621
	inc hl			;a622
	inc de			;a623
	pop bc			;a624
	djnz color_hacia_de		;a625   ; 15
	pop de			;a627
	ld hl,0e901h		;a628   ; compara
	ld b,00fh		;a62b
compara_de:
	ld a,(de)			;a62d   ; el rojo y el azul...
	cp (hl)			;a62e
	jr nz,pon_paleta_de		;a62f   ; distinto: sale con NZ
	inc de			;a631
	inc hl			;a632
	ld a,(de)			;a633   ; ...y el verde
	cp (hl)			;a634
	jr nz,pon_paleta_de		;a635
	inc hl			;a637   ; el color siguiente
	inc hl			;a638
	inc de			;a639
	djnz compara_de		;a63a   ; 15 colores
pon_paleta_de:
	push af			;a63c   ; Z si ya es la de DE
	ld hl,0e900h		;a63d   ; apunta a los caracteres de un dibujo pasados a 4 bits; de paso, una paleta (p14:A5C5) o las letras en bits (p14:BD54)
	call 0463fh		;a640   ; pon_paleta_con_espera: pone la paleta de HL (p00:4642) esperando al VDP antes
	pop af			;a643
	ret			;a644
espera_ca38:		; 0xCA38 = 0x41
	ld a,041h		;a645
	ld (0ca38h),a		;a647
	ret			;a64a
a_negro_ca38:		; con 0xCA38: uno menos y cada 8 la paleta a negro (p13:90FD); acarreo mientras quede; sin el, sin acarreo
	ld hl,0ca38h		;a64b
	ld a,(hl)			;a64e
	and a			;a64f
	ret z			;a650   ; a 0: sin acarreo
	dec (hl)			;a651
	ld a,(hl)			;a652
	and 007h		;a653   ; cada 8
	scf			;a655
	ret nz			;a656
	call 090fdh		;a657   ; a negro
	scf			;a65a
	ret			;a65b
color_15_baja:		; con 0xCA38: uno menos y cada 8 el color 15 uno menos (p13:9135); acarreo mientras quede
	ld hl,0ca38h		;a65c
	ld a,(hl)			;a65f
	and a			;a660
	ret z			;a661   ; a 0: sin acarreo
	dec (hl)			;a662
	ld a,(hl)			;a663
	and 007h		;a664   ; cada 8
	scf			;a666
	ret nz			;a667
	ld b,00fh		;a668   ; el color 15...
	ld hl,0f69eh		;a66a   ; ...de la VRAM
	call 09135h		;a66d   ; color_uno_menos: el color B de la VRAM de HL uno menos (p13:911C, p13:912D) y puesto en la paleta
	scf			;a670
	ret			;a671
dibujo_7080:		; de (0x80, 0x70) de 0x80 x 0x78 a (0x68, 0x40) de la pagina 2
	ld hl,08070h		;a672
	ld de,06840h		;a675
	ld bc,08078h		;a678
	ld a,002h		;a67b
	jp 04767h		;a67d   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
pantalla_7080:		; el dibujo y p14:A683
	call dibujo_7080		;a680   ; dibujo_7080: de (0x80, 0x70) de 0x80 x 0x78 a (0x68, 0x40) de la pagina 2
marco_7080:		; a 0 lo de alrededor: (8, 8) 0xF0 x 0x38, (8, 0x40) 0x60 x 0x80, (0xE8, 0x40) 0x10 x 0x80, (0x68, 0xB8) 0x80 x 8
	ld hl,00808h		;a683
	ld bc,0f038h		;a686
	xor a			;a689
	ld d,a			;a68a
	call 046ffh		;a68b   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
	ld hl,00840h		;a68e
	ld bc,06080h		;a691
	xor a			;a694
	ld d,a			;a695
	call 046ffh		;a696   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
	ld hl,0e840h		;a699
	ld bc,01080h		;a69c
	xor a			;a69f
	ld d,a			;a6a0
	call 046ffh		;a6a1   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
	ld hl,068b8h		;a6a4
	ld bc,08008h		;a6a7
	xor a			;a6aa
	ld d,a			;a6ab
	jp 046ffh		;a6ac   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
dibujo_0000:		; de (0, 0) de 0xA0 x 0x70 a (0x18, 0x18) de la pagina 2
	ld hl,00000h		;a6af
	ld de,01818h		;a6b2
	ld bc,0a070h		;a6b5
	ld a,002h		;a6b8
	jp 04767h		;a6ba   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
pantalla_0000:
	call dibujo_0000		;a6bd   ; dibujo_0000: de (0, 0) de 0xA0 x 0x70 a (0x18, 0x18) de la pagina 2
marco_0000:		; a 0 lo de alrededor: (8, 8) 0xF0 x 0x10, (8, 0x18) 0x10 x 0x70, (0xB8, 0x18) 0x40 x 0x70, (8, 0x88) 0xF0 x 0x38
	ld hl,00808h		;a6c0
	ld bc,0f010h		;a6c3
	xor a			;a6c6
	ld d,a			;a6c7
	call 046ffh		;a6c8   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
	ld hl,00818h		;a6cb
	ld bc,01070h		;a6ce
	xor a			;a6d1
	ld d,a			;a6d2
	call 046ffh		;a6d3   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
	ld hl,0b818h		;a6d6
	ld bc,04070h		;a6d9
	xor a			;a6dc
	ld d,a			;a6dd
	call 046ffh		;a6de   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
	ld hl,00888h		;a6e1
	ld bc,0f038h		;a6e4
	xor a			;a6e7
	ld d,a			;a6e8
	jp 046ffh		;a6e9   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
dibujo_7000:		; de (0, 0x70) de 0x80 x 0x78 a (0x68, 0x18) de la pagina 2
	ld hl,00070h		;a6ec
	ld de,06818h		;a6ef
	ld bc,08078h		;a6f2
	ld a,002h		;a6f5
	jp 04767h		;a6f7   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
pantalla_7000:
	call dibujo_7000		;a6fa   ; dibujo_7000: de (0, 0x70) de 0x80 x 0x78 a (0x68, 0x18) de la pagina 2
marco_7000:		; a 0 lo de alrededor: (8, 8) 0xF0 x 0x10, (8, 0x18) 0x60 x 0x78, (0xE8, 0x18) 0x10 x 0x78, (8, 0x90) 0xF0 x 0x30
	ld hl,00808h		;a6fd
	ld bc,0f010h		;a700
	xor a			;a703
	ld d,a			;a704
	call 046ffh		;a705   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
	ld hl,00818h		;a708
	ld bc,06078h		;a70b
	xor a			;a70e
	ld d,a			;a70f
	call 046ffh		;a710   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
	ld hl,0e818h		;a713
	ld bc,01078h		;a716
	xor a			;a719
	ld d,a			;a71a
	call 046ffh		;a71b   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
	ld hl,00890h		;a71e
	ld bc,0f030h		;a721
	xor a			;a724
	ld d,a			;a725
	jp 046ffh		;a726   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
dibujo_a000:		; de (0xA0, 0) de 0x58 x 0x70 a (0x18, 0x40) de la pagina 2
	ld hl,0a000h		;a729
	ld de,01840h		;a72c
	ld bc,05870h		;a72f
	ld a,002h		;a732
	jp 04767h		;a734   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
pantalla_a000:
	call dibujo_a000		;a737   ; dibujo_a000: de (0xA0, 0) de 0x58 x 0x70 a (0x18, 0x40) de la pagina 2
marco_a000:		; a 0 lo de alrededor: (8, 8) 0xF0 x 0x38, (8, 0x40) 0x10 x 0x80, (0x70, 0x40) 0x88 x 0x80, (0x18, 0xB0) 0x58 x 0x10
	ld hl,00808h		;a73a
	ld bc,0f038h		;a73d
	xor a			;a740
	ld d,a			;a741
	call 046ffh		;a742   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
	ld hl,00840h		;a745
	ld bc,01080h		;a748
	xor a			;a74b
	ld d,a			;a74c
	call 046ffh		;a74d   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
	ld hl,07040h		;a750
	ld bc,08880h		;a753
	xor a			;a756
	ld d,a			;a757
	call 046ffh		;a758   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
	ld hl,018b0h		;a75b
	ld bc,05810h		;a75e
	xor a			;a761
	ld d,a			;a762
	jp 046ffh		;a763   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)

; ----------------------------------------------------------------------
; DATOS resto_A766: lo apuntan con el banco puesto p14:A35E (0xA766), p14:A37E
;   (0xA766), p14:A3E1 (0xA784), p14:A3F2 (0xA784), p14:A455 (0xA7A2),
;   p14:A467 (0xA7A2); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p14:A35E, p14:A37E, p14:A3E1, p14:A3F2, p14:A455,
;   p14:A467 (760 bytes)
;   0xa766..0xaa5e  (760 bytes)
DATA_resto_A766:
	defb 000h,000h,000h,000h,001h,001h,012h,002h,023h,003h,034h,004h,045h,005h,056h,006h	; a766  ........#.4.E.V.
	defb 030h,001h,050h,003h,060h,006h,074h,007h,050h,000h,077h,007h,000h,000h,000h,000h	; a776  0.P.`.t.P.w.....
	defb 020h,001h,031h,002h,041h,003h,051h,004h,073h,006h,010h,002h,021h,002h,030h,000h	; a786   .1.A.Q.s...!.0.
	defb 040h,000h,051h,002h,003h,001h,004h,002h,044h,004h,076h,007h,000h,000h,001h,001h	; a796  @.Q.....D.v.....
	defb 012h,002h,023h,003h,034h,004h,045h,005h,056h,006h,065h,006h,030h,001h,020h,001h	; a7a6  ..#.4.E.V.e.0. .
	defb 076h,007h,065h,006h,000h,000h,040h,002h,030h,002h,000h,000h,077h,007h,030h,002h	; a7b6  v.e...@.0...w.0.
	defb 001h,003h,002h,005h,003h,002h,006h,005h,077h,007h,001h,002h,052h,003h,063h,004h	; a7c6  ........w...R.c.
	defb 074h,005h,075h,006h,075h,007h,044h,004h,0d1h,0d2h,0d2h,0d3h,000h,001h,002h,003h	; a7d6  t.u.u.D.........
	defb 0cbh,0cbh,0cbh,0feh,004h,005h,08dh,006h,007h,008h,08eh,009h,001h,08fh,00ah,0feh	; a7e6  ................
	defb 091h,092h,093h,094h,095h,096h,097h,098h,0deh,0ffh,00bh,0b6h,0dfh,00ch,0b6h,099h	; a7f6  ................
	defb 09ah,08eh,00dh,00eh,00fh,08eh,010h,011h,09bh,0feh,09ch,012h,09dh,09eh,0dfh,013h	; a806  ................
	defb 014h,08eh,014h,015h,016h,017h,09fh,018h,011h,0feh,019h,018h,09ch,0e2h,097h,0dfh	; a816  ................
	defb 09fh,08dh,0a1h,01ah,004h,01bh,08fh,01ch,09dh,0feh,0a2h,098h,0e0h,01dh,08eh,01eh	; a826  ................
	defb 01fh,0e1h,09fh,020h,021h,08eh,022h,023h,094h,0feh,008h,095h,096h,097h,098h,0deh	; a836  ... !."#........
	defb 0ffh,095h,090h,095h,0dfh,024h,018h,08fh,025h,09dh,099h,097h,026h,098h,0a3h,09fh	; a846  .....$..%...&...
	defb 0feh,097h,098h,0cbh,0cbh,0cbh,0ffh,00ch,027h,0a4h,028h,029h,099h,02ah,02bh,0a5h	; a856  ........'.().*+.
	defb 0fdh,048h,02ch,09dh,0a6h,096h,097h,098h,0deh,0ffh,0b6h,02dh,0dfh,00ch,00eh,0dfh	; a866  .H,........-....
	defb 00ch,02eh,027h,09ch,02fh,030h,0a7h,0a8h,031h,0feh,00eh,0dfh,0b7h,0b8h,0b9h,0bah	; a876  ..'./0..1.......
	defb 0bbh,0bch,0b8h,0bdh,09ch,032h,033h,034h,035h,0feh,0a5h,036h,037h,0deh,0ffh,0b7h	; a886  .....2345..67...
	defb 0b8h,0b9h,0bah,0bbh,0bch,0b8h,0bdh,08dh,004h,005h,013h,00eh,08eh,0e0h,0feh,038h	; a896  ...............8
	defb 039h,03ah,01dh,03bh,03ch,03dh,03eh,03fh,0e1h,08fh,040h,041h,0dfh,042h,0feh,038h	; a8a6  9:..<=>?..@A.B.8
	defb 039h,0a4h,0a9h,0a6h,098h,01dh,03bh,03ch,08fh,043h,097h,0dfh,004h,005h,0feh,0a4h	; a8b6  9......<.C......
	defb 044h,045h,08eh,01dh,046h,047h,08fh,048h,0aah,098h,002h,0dfh,02fh,00eh,0feh,09ch	; a8c6  DE..FG.H..../...
	defb 049h,095h,096h,04ah,04bh,04ch,04dh,04eh,08fh,04fh,012h,095h,098h,08eh,0feh,0a4h	; a8d6  I..JKLMN.O......
	defb 0a9h,0a8h,0deh,0ffh,01dh,050h,051h,08fh,052h,039h,095h,098h,004h,005h,09ch,053h	; a8e6  .....PQ.R9.....S
	defb 0abh,0feh,0e0h,01dh,08eh,01eh,01fh,0e1h,0a5h,054h,08fh,055h,0ach,093h,094h,0feh	; a8f6  .........T.U....
	defb 095h,096h,097h,098h,0deh,0ffh,045h,056h,0dfh,0d4h,0d3h,000h,08dh,0a0h,0adh,094h	; a906  ......EV........
	defb 057h,0aeh,0afh,098h,014h,0feh,058h,08eh,059h,05ah,05bh,05ch,08eh,05dh,05eh,0a5h	; a916  W.....X.YZ[\.]^.
	defb 05fh,060h,061h,062h,09ch,0feh,063h,0b0h,064h,0afh,0dfh,059h,05ah,09ch,065h,0aeh	; a926  _`ab..c.d..YZ.e.
	defb 0a8h,006h,066h,099h,001h,0feh,067h,0beh,0bfh,0c0h,0c1h,0bbh,0a5h,068h,0b1h,0afh	; a936  ..f...g......h..
	defb 099h,097h,09dh,09dh,004h,0feh,005h,08dh,069h,06ah,099h,0beh,0bfh,0c0h,0c1h,0bbh	; a946  ........ij......
	defb 06bh,06ch,09ch,06dh,06eh,0feh,095h,096h,097h,098h,0deh,0ffh,0ach,0b2h,099h,00ch	; a956  kl.mn...........
	defb 0dfh,0c2h,0c3h,0c4h,08eh,06fh,023h,070h,026h,0dfh,0feh,0d5h,0d6h,0d7h,0f0h,0d8h	; a966  .....o#p&.......
	defb 0d9h,0dah,0dbh,071h,072h,09ch,092h,0a6h,096h,02ch,0feh,073h,074h,08eh,059h,05ah	; a976  ...qr....,.st.YZ
	defb 08fh,075h,076h,0a7h,0a8h,094h,097h,093h,077h,06fh,0feh,023h,0e0h,0d7h,0d6h,0dch	; a986  .uv.....wo.#....
	defb 0d6h,0ddh,0e1h,0a5h,078h,079h,0b3h,0afh,098h,0deh,0ffh,0e0h,0d7h,0d6h,0dch,0d6h	; a996  ....xy..........
	defb 0ddh,0e1h,08fh,07ah,0a6h,096h,004h,005h,08dh,053h,0feh,0abh,0dfh,07bh,07ch,07dh	; a9a6  ...z.....S...{|}
	defb 07eh,09ch,07fh,080h,0deh,0c5h,0c6h,0c7h,0c8h,08eh,0feh,070h,081h,09ch,055h,082h	; a9b6  ~..........p..U.
	defb 0a7h,0a8h,098h,0b4h,09ch,0dfh,0c2h,0c3h,0c4h,08fh,0feh,083h,0afh,098h,0c9h,0cah	; a9c6  ................
	defb 0cbh,0cch,0c0h,0cdh,08dh,084h,00bh,085h,00ch,0dfh,0feh,0b7h,0b8h,0b9h,0bah,0bbh	; a9d6  ................
	defb 0bch,0b8h,0bdh,09ch,092h,0a6h,096h,086h,087h,0b3h,0feh,0afh,096h,095h,09dh,0a6h	; a9e6  ................
	defb 098h,0deh,0ffh,0b7h,0b8h,0b9h,0bah,0bbh,0bch,0b8h,0bdh,08dh,01dh,03bh,03ch,094h	; a9f6  ..............<.
	defb 0e0h,0d7h,0feh,0d6h,0dch,0d6h,0ddh,0e1h,09ch,092h,0a6h,096h,032h,033h,088h,089h	; aa06  ............23..
	defb 08fh,08ah,0feh,050h,095h,092h,093h,094h,095h,096h,097h,0a8h,08eh,0a4h,0a9h,0a8h	; aa16  ...P............
	defb 0deh,0ffh,0aeh,0b5h,090h,08bh,0ceh,0cfh,0d0h,0b8h,08eh,077h,06fh,023h,0a5h,0feh	; aa26  ...........wo#..
	defb 004h,005h,08fh,08ch,090h,0ach,093h,094h,095h,096h,097h,0a8h,0deh,0ffh,004h,000h	; aa36  ................
	defb 000h,005h,000h,000h,006h,000h,000h,008h,000h,000h,0ffh,004h,011h,001h,005h,022h	; aa46  ..............."
	defb 002h,006h,033h,003h,008h,033h,003h,0ffh	; aa56  ..3..3..

; ======================================================================
; CODIGO 0xaa5e..0xaa94  (54 bytes)
; ======================================================================


fichas_d4c0:		; en la zona 0x12 sala 8: las 2 fichas de 0xD4C0 activas, su paso (p14:AA94), p06:BA36 con 3, si salen de la sala (p14:AAEB) y sus sprites (p14:AB41)
	ld a,(0ca4ah)		;aa5e   ; lee la zona
	cp 012h		;aa61   ; la zona 0x12...
	ret nz			;aa63
	ld a,(0ca4bh)		;aa64   ; lee la sala de la zona
	cp 008h		;aa67   ; ...sala 8
	ret nz			;aa69
	ld ix,0d4c0h		;aa6a   ; apunta a 2 fichas de 16 bytes; tocan a Snake con 0x18 de dano (p07:B309)
	ld b,002h		;aa6e   ; 2 fichas
L_AA70:
	push bc			;aa70
	ld a,(ix+000h)		;aa71
	and a			;aa74   ; libre, nada
	jr z,siguiente_d4c0		;aa75
	call paso_d4c0		;aa77   ; su paso
	ld a,003h		;aa7a   ; con 3
	call 08085h		;aa7c   ; llama_ba36_a:
	call d4c0_fuera_de_sala		;aa7f   ; si sale
	call sprites_d4c0		;aa82   ; sus sprites
siguiente_d4c0:		; la siguiente (16 bytes)
	ld bc,00010h		;aa85
	add ix,bc		;aa88
	pop bc			;aa8a
	djnz L_AA70		;aa8b
	ret			;aa8d
paso_d4c0:		; por el byte 1 (p14:AA94): 0 espera a Snake, 1 cae, 2 nada, 3 se acaba
	ld a,(ix+001h)		;aa8e
	call 0424dh		;aa91   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_AA94: 4 destinos del despachador p00:424D (call en p14:AA91, el
;   indice en A): AA9C, AAC5, AAD7, AAD8; lo leen p14:AA91 (8 bytes)
;   0xaa94..0xaa9c  (8 bytes)
DATA_tabla_AA94:
	defw 0aa9ch,0aac5h,0aad7h,0aad8h	; aa94  -> d4c0_espera d4c0_cae d4c0_nada d4c0_acaba

; ======================================================================
; CODIGO 0xaa9c..0xab96  (250 bytes)
; ======================================================================


d4c0_espera:		; con Snake mas abajo (su Y - 0x20 por encima de la ficha, nada): sale hacia el lado de Snake (velocidad 3 o -3 en X, 3 en Y), el dibujo 1 o 4, la cuenta 4 y el paso siguiente
	ld a,(0cb03h)		;aa9c   ; lee la Y de Snake
	sub 020h		;aa9f   ; la Y de Snake - 0x20
	cp (ix+003h)		;aaa1
	ret nc			;aaa4   ; por encima, nada
	ld a,(0cb05h)		;aaa5   ; lee la X de Snake
	cp (ix+005h)		;aaa8   ; a la derecha?
	ld b,001h		;aaab   ; el dibujo 1...
	ld de,00303h		;aaad   ; ...3 y 3
	jr nc,d4c0_sale		;aab0
	ld d,0fdh		;aab2   ; a la izquierda, -3...
	ld b,004h		;aab4   ; ...y el dibujo 4
d4c0_sale:		; el dibujo
	ld (ix+00fh),b		;aab6
	ld (ix+007h),e		;aab9   ; la velocidad en Y
	ld (ix+009h),d		;aabc   ; la velocidad en X
	ld (ix+00ch),004h		;aabf   ; 4 cuadros
	jr d4c0_siguiente		;aac3
d4c0_cae:		; a los 4 cuadros, sin velocidad en Y, el dibujo siguiente y el paso siguiente
	dec (ix+00ch)		;aac5
	ret nz			;aac8
	ld (ix+007h),000h		;aac9   ; sin velocidad en Y
	ld (ix+006h),000h		;aacd
	inc (ix+00fh)		;aad1   ; el dibujo siguiente
d4c0_siguiente:		; el paso siguiente
	inc (ix+001h)		;aad4
d4c0_nada:
	ret			;aad7
d4c0_acaba:		; la cuenta; el dibujo 6 o 7 cada 4; al acabar, la ficha fuera (p14:AB19)
	dec (ix+00ch)		;aad8
	jr z,d4c0_libre		;aadb   ; al acabar, fuera
	ld a,(ix+00ch)		;aadd
	rra			;aae0
	rra			;aae1
	ld a,006h		;aae2   ; 6...
	jr c,pon_dibujo_d4c0		;aae4
	inc a			;aae6   ; ...o 7
pon_dibujo_d4c0:
	ld (ix+00fh),a		;aae7
	ret			;aaea
d4c0_fuera_de_sala:		; salvo en el paso 3: desde Y = 0xC0 o fuera de X 0x10-0xAF, el paso 3 (p14:AB01)
	ld a,(ix+001h)		;aaeb
	cp 003h		;aaee   ; en el 3, nada
	ret z			;aaf0
	ld a,(ix+003h)		;aaf1
	ld l,a			;aaf4
	cp 0c0h		;aaf5   ; desde 0xC0, se acaba
	jr nc,d4c0_paso_3		;aaf7
	ld a,(ix+005h)		;aaf9   ; la X - 0x10...
	sub 010h		;aafc
	cp 0a0h		;aafe   ; ...dentro de 0xA0, nada
	ret c			;ab00
d4c0_paso_3:		; el paso 3, la cuenta 0x10, sin velocidad y el sonido 0x15
	ld (ix+001h),003h		;ab01
	ld (ix+00ch),010h		;ab05   ; 0x10 cuadros
	xor a			;ab09   ; sin velocidad
	ld (ix+007h),a		;ab0a
	ld (ix+006h),a		;ab0d
	ld (ix+009h),a		;ab10
	ld (ix+008h),a		;ab13
	jp 06a48h		;ab16   ; sonido_15: pide el sonido 0x15
d4c0_libre:		; la ficha libre, sus 2 sprites (byte 0x0E) fuera y libres en 0xD400
	ld (ix+000h),000h		;ab19
	ld a,(ix+00eh)		;ab1d   ; su sprite
	ld b,a			;ab20
	add a,a			;ab21   ; * 4...
	add a,a			;ab22
	ld hl,0dc28h		;ab23   ; ...desde 0xDC28
	call 0423eh		;ab26   ; suma_a_hl: HL = HL + A
	ld d,h			;ab29
	ld a,l			;ab2a   ; el siguiente
	add a,004h		;ab2b
	ld e,a			;ab2d
	ld a,0e0h		;ab2e   ; fuera
	ld (ix+003h),a		;ab30
	ld (hl),a			;ab33
	ld (de),a			;ab34
	ld hl,0d400h		;ab35   ; los dos libres...
	ld a,b			;ab38   ; ...en 0xD400
	call 0423eh		;ab39   ; suma_a_hl: HL = HL + A
	xor a			;ab3c
	ld (hl),a			;ab3d
	inc hl			;ab3e
	ld (hl),a			;ab3f
	ret			;ab40
sprites_d4c0:		; los 2 sprites (byte 0x0E) de la ficha en su Y y X - 8 con el patron de p14:AB96 por el dibujo (y + 4), y sus colores 0x0D y 0x47 (en el paso 3, 7 y 0x4A)
	ld a,(ix+00eh)		;ab41
	add a,a			;ab44   ; * 4...
	add a,a			;ab45
	ld hl,0dc28h		;ab46   ; ...desde 0xDC28
	call 0423eh		;ab49   ; suma_a_hl: HL = HL + A
	ld b,h			;ab4c
	ld a,l			;ab4d   ; el siguiente
	add a,004h		;ab4e
	ld c,a			;ab50
	ld a,(ix+003h)		;ab51   ; la Y
	ld (hl),a			;ab54
	ld (bc),a			;ab55
	inc l			;ab56
	inc c			;ab57
	ld a,(ix+005h)		;ab58   ; la X - 8
	sub 008h		;ab5b
	ld (hl),a			;ab5d
	ld (bc),a			;ab5e
	inc l			;ab5f
	inc c			;ab60
	ld a,(ix+00fh)		;ab61   ; el patron...
	ld de,0ab96h		;ab64   ; ...de p14:AB96
	call 04243h		;ab67   ; suma_a_de: DE = DE + A
	ld a,(de)			;ab6a
	ld (hl),a			;ab6b
	add a,004h		;ab6c   ; + 4 el otro
	ld (bc),a			;ab6e
	ld a,(ix+001h)		;ab6f
	cp 003h		;ab72   ; en el paso 3...
	ld bc,00d47h		;ab74   ; ...0x0D y 0x47...
	jr nz,colores_d4c0		;ab77
	ld bc,0074ah		;ab79   ; ...o 7 y 0x4A
colores_d4c0:		; su sprite * 16...
	ld l,(ix+00eh)		;ab7c
	ld h,000h		;ab7f
	add hl,hl			;ab81
	add hl,hl			;ab82
	add hl,hl			;ab83
	add hl,hl			;ab84
	ld de,0daa0h		;ab85   ; ...desde 0xDAA0
	add hl,de			;ab88
	ld a,b			;ab89
	push bc			;ab8a
	call colores_16		;ab8b   ; el primero
	pop bc			;ab8e
	ld a,c			;ab8f   ; el segundo
colores_16:		; 16 lineas de color A
	ld bc,0000fh		;ab90
	jp 04237h		;ab93   ; llena_bloque: pone A en BC + 1 bytes desde HL

; ----------------------------------------------------------------------
; DATOS resto_AB96: lo apuntan con el banco puesto p14:AB64 (0xAB96); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p14:AB64 (8 bytes)
;   0xab96..0xab9e  (8 bytes)
DATA_resto_AB96:
	defb 040h,048h,050h,058h,060h,068h,030h,038h	; ab96  @HPX`h08

; ======================================================================
; CODIGO 0xab9e..0xabc5  (39 bytes)
; ======================================================================


d800_tipo_11:		; la ficha de 0xD800 de tipo 0x11: con 0xCA77, fuera su musica; con 0xC693, p00:6BCC; su paso por p14:ABC5 (9), p06:BA36 con su byte 0x0C y, en los pasos 5-8, su musica
	ld a,(0ca77h)		;ab9e
	and a			;aba1
	jp nz,086a4h		;aba2   ; con 0xCA77...
	ld hl,06bcch		;aba5   ; con 0xC693...
	call 086d5h		;aba8   ; si_c693: con 0xC693, lo borra y salta a HL
	ld a,(ix+001h)		;abab   ; su paso...
	ld hl,0abc5h		;abae   ; ...de p14:ABC5
	call 0424eh		;abb1   ; salta_por_tabla: salta a la palabra A de la tabla de HL
	ld a,(ix+00ch)		;abb4   ; su byte 0x0C
	call 08085h		;abb7   ; llama_ba36_a:
	ld a,(ix+001h)		;abba   ; en los pasos 5-8...
	sub 005h		;abbd
	cp 004h		;abbf
	ret nc			;abc1
	jp 08671h		;abc2   ; ...su musica

; ----------------------------------------------------------------------
; DATOS resto_ABC5: lo apuntan con el banco puesto p14:ABAE (0xABC5); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p14:ABAE (18 bytes)
;   0xabc5..0xabd7  (18 bytes)
DATA_resto_ABC5:
	defb 0d7h,0abh,0eeh,0abh,0ffh,0abh,008h,0ach,026h,0ach,030h,0ach,06bh,0ach,0edh,0ach	; abc5  ........&.0.k...
	defb 0feh,0ach	; abd5

; ======================================================================
; CODIGO 0xabd7..0xad38  (353 bytes)
; ======================================================================


d800_11_paso_0:		; con Snake en su fila de sala: 0xCB3C = 1, el bit 4 de 0xD7D3, 0x1E cuadros y el paso siguiente
	ld a,(0ca50h)		;abd7   ; lee la fila de la sala en la zona (uno mas al salir por arriba)
	cp (ix+00ah)		;abda   ; en otra fila, nada
	ret nz			;abdd
	ld a,001h		;abde   ; 0xCB3C = 1
	ld (0cb3ch),a		;abe0
	ld hl,0d7d3h		;abe3   ; el bit 4 de 0xD7D3
	set 4,(hl)		;abe6
	ld (ix+00eh),01eh		;abe8   ; 0x1E cuadros
	jr d800_11_siguiente		;abec
d800_11_paso_1:		; a los 0x1E cuadros: la musica 0xA6 y el mensaje 0x0A80 con ventana
	dec (ix+00eh)		;abee   ; baja la espera de la ficha de 0xD800
	ret nz			;abf1
	call 086c2h		;abf2   ; pon_musica_a6: 0xCA26 = 1, ninguna pendiente y el sonido 0xA6
	ld de,00a80h		;abf5   ; el mensaje 0x0A80
	call 061c0h		;abf8   ; mensaje_de_50_con_ventana: p01:61CE y los bancos 4, 5 y 14
d800_11_siguiente:		; el paso siguiente
	inc (ix+001h)		;abfb   ; sube el paso de la ficha de 0xD800
	ret			;abfe
d800_11_paso_2:		; el mensaje hasta que acaba; luego hacia Snake (p14:AC48)
	call 061f8h		;abff   ; mensaje_cada_cuadro_bancos_14:
	ret nz			;ac02
	call hacia_snake_x		;ac03   ; hacia_snake_x: la velocidad en X 0x200 hacia Snake (por la columna y la X), el byte 0x0C = 2 y el dibujo por la direccion (p14:ACD8)
	jr d800_11_siguiente		;ac06
d800_11_paso_3:		; entre columnas (p14:ACAA), p04:902E; en la columna de Snake desde X = 0x60: los bytes 0x0C y 0x0D a 0 y el mensaje 0x0B
	call d800_entre_columnas		;ac08   ; d800_entre_columnas: por debajo de X = 0x10, a la columna de la izquierda en 0xB0; desde 0xB1, a la de la derecha en 0x10
	call 0902eh		;ac0b   ; p04:902E
	call 08107h		;ac0e   ; en otra columna, nada
	ret nz			;ac11
	ld a,(ix+005h)		;ac12   ; lee la X de la ficha de 0xD800
	cp 060h		;ac15   ; por debajo de 0x60, nada
	ret c			;ac17
	xor a			;ac18
	ld (ix+00ch),a		;ac19
	ld (ix+00dh),a		;ac1c   ; guarda el dibujo de la ficha de 0xD800
	ld d,00bh		;ac1f   ; el mensaje 0x0B
	call 061c9h		;ac21   ; mensaje_de_50_bancos_14: p01:61DC y los bancos 4, 5 y 14
	jr d800_11_siguiente		;ac24
d800_11_paso_4:		; el mensaje hasta que acaba; luego p00:7A59
	call 061f8h		;ac26   ; mensaje_cada_cuadro_bancos_14:
	ret nz			;ac29
	call 07a59h		;ac2a   ; llama_7a27_1_bancos_14:
	jp d800_11_siguiente		;ac2d   ; d800_11_siguiente: el paso siguiente
d800_11_paso_5:		; p04:8685, 0xCB3C = 0, el byte 0x11 = 0, el 0x16 = 1, 0x20 cuadros y hacia Snake
	call 08685h		;ac30   ; por_el_tipo_8698: por el byte del tipo en p04:8698 (p04:8691)
	xor a			;ac33
	ld (0cb3ch),a		;ac34   ; 0xCB3C = 0
	ld (ix+011h),a		;ac37
	inc a			;ac3a
	ld (ix+016h),a		;ac3b   ; el byte 0x16 = 1
	ld (ix+00eh),020h		;ac3e   ; 0x20 cuadros
	call hacia_snake_x		;ac42   ; hacia_snake_x: la velocidad en X 0x200 hacia Snake (por la columna y la X), el byte 0x0C = 2 y el dibujo por la direccion (p14:ACD8)
	jp d800_11_siguiente		;ac45   ; d800_11_siguiente: el paso siguiente
hacia_snake_x:		; la velocidad en X 0x200 hacia Snake (por la columna y la X), el byte 0x0C = 2 y el dibujo por la direccion (p14:ACD8)
	ld de,00200h		;ac48
	call 08107h		;ac4b   ; en_esta_columna: Z si el actor esta en la columna de ahora
	jr z,hacia_snake_misma		;ac4e   ; a la izquierda...
	jr nc,pon_hacia_snake		;ac50   ; ...a la derecha
	jr hacia_la_izquierda		;ac52
hacia_snake_misma:
	ld a,(0cb05h)		;ac54   ; lee la X de Snake
	cp (ix+005h)		;ac57   ; Snake a la derecha?
	jr nc,pon_hacia_snake		;ac5a
hacia_la_izquierda:		; negativa
	call 04442h		;ac5c   ; de_negativo: DE = -DE
pon_hacia_snake:		; la velocidad en X
	ld (ix+009h),d		;ac5f   ; guarda la velocidad de la ficha de 0xD800 en X (alta)
	ld (ix+008h),e		;ac62   ; guarda la velocidad de la ficha de 0xD800 en X (baja)
	ld (ix+00ch),002h		;ac65   ; el byte 0x0C = 2
	jr dibujo_por_x		;ac69
d800_11_paso_6:		; entre columnas, el borde (p14:ACC4), cada 4 cuadros p04:902E; con la cuenta, al acabar hacia Snake; sin ella, en su columna a menos de 8 de Snake: quieto, el dibujo 2, 4 cuadros y el siguiente
	call d800_entre_columnas		;ac6b   ; d800_entre_columnas: por debajo de X = 0x10, a la columna de la izquierda en 0xB0; desde 0xB1, a la de la derecha en 0x10
	call d800_borde		;ac6e   ; d800_borde: en la columna 6, por debajo de X = 0x14 se da la vuelta; en las otras, desde 0xAC; al darse la vuelta, 0x10 cuadros
	inc (ix+011h)		;ac71   ; los cuadros
	ld a,(ix+011h)		;ac74   ; cada 4...
	and 003h		;ac77
	call z,0902eh		;ac79   ; p04:902E
	ld a,(ix+00eh)		;ac7c   ; con la cuenta, aparte
	and a			;ac7f
	jr nz,d800_11_cuenta		;ac80
	call 08107h		;ac82   ; en su columna?
	jr z,d800_11_cerca		;ac85
d800_11_cuenta:
	dec (ix+00eh)		;ac87   ; baja la espera de la ficha de 0xD800
	ret nz			;ac8a
	jp hacia_snake_x		;ac8b   ; al acabar, hacia Snake
d800_11_cerca:
	ld a,(0cb05h)		;ac8e   ; lee la X de Snake
	sub (ix+005h)		;ac91   ; la distancia en X...
	jr nc,L_AC98		;ac94
	neg		;ac96
L_AC98:
	cp 008h		;ac98   ; ...desde 8, nada
	ret nc			;ac9a
	ld (ix+00ch),000h		;ac9b   ; quieto
	ld (ix+00dh),002h		;ac9f   ; el dibujo 2
	ld (ix+00eh),004h		;aca3   ; 4 cuadros
	jp d800_11_siguiente		;aca7   ; d800_11_siguiente: el paso siguiente
d800_entre_columnas:		; por debajo de X = 0x10, a la columna de la izquierda en 0xB0; desde 0xB1, a la de la derecha en 0x10
	ld a,(ix+005h)		;acaa   ; lee la X de la ficha de 0xD800
	cp 010h		;acad
	jr c,d800_columna_izquierda		;acaf   ; por la izquierda
	cp 0b1h		;acb1   ; dentro, nada
	ret c			;acb3
	ld (ix+005h),010h		;acb4   ; en 0x10...
	inc (ix+00bh)		;acb8   ; ...una columna mas
	ret			;acbb
d800_columna_izquierda:		; en 0xB0...
	ld (ix+005h),0b0h		;acbc   ; la X de la ficha de 0xD800 = 0xB0
	dec (ix+00bh)		;acc0   ; ...una columna menos
	ret			;acc3
d800_borde:		; en la columna 6, por debajo de X = 0x14 se da la vuelta; en las otras, desde 0xAC; al darse la vuelta, 0x10 cuadros
	ld a,(ix+00bh)		;acc4
	cp 006h		;acc7
	jr z,d800_borde_6		;acc9   ; la 6, aparte
	ld a,(ix+005h)		;accb   ; lee la X de la ficha de 0xD800
	cp 0ach		;acce
	ret c			;acd0   ; por debajo de 0xAC, nada
d800_vuelta:		; 0x10 cuadros
	ld (ix+00eh),010h		;acd1   ; la espera de la ficha de 0xD800 = 0x10
	call 0808eh		;acd5   ; al reves en X
dibujo_por_x:		; el dibujo 4 hacia la izquierda, 0 hacia la derecha
	ld a,(ix+009h)		;acd8   ; lee la velocidad de la ficha de 0xD800 en X (alta)
	rla			;acdb
	ld a,004h		;acdc
	jr c,pon_dibujo_por_x		;acde
	xor a			;ace0
pon_dibujo_por_x:
	ld (ix+00dh),a		;ace1   ; guarda el dibujo de la ficha de 0xD800
	ret			;ace4
d800_borde_6:
	ld a,(ix+005h)		;ace5   ; lee la X de la ficha de 0xD800
	cp 014h		;ace8   ; desde 0x14, nada
	ret nc			;acea
	jr d800_vuelta		;aceb
d800_11_paso_7:		; a los 4 cuadros, el dibujo siguiente, 4 mas, lo lanzado de tipo 3 y el siguiente
	dec (ix+00eh)		;aced   ; baja la espera de la ficha de 0xD800
	ret nz			;acf0
	inc (ix+00dh)		;acf1   ; sube el dibujo de la ficha de 0xD800
	ld (ix+00eh),004h		;acf4   ; la espera de la ficha de 0xD800 = 0x04
	call 09af8h		;acf8   ; lanza
	jp d800_11_siguiente		;acfb   ; d800_11_siguiente: el paso siguiente
d800_11_paso_8:		; a los 4 cuadros, 8 mas, el paso 6 y hacia Snake
	dec (ix+00eh)		;acfe   ; baja la espera de la ficha de 0xD800
	ret nz			;ad01
	ld (ix+00eh),008h		;ad02   ; la espera de la ficha de 0xD800 = 0x08
	ld (ix+001h),006h		;ad06   ; el paso 6
	call hacia_snake_x		;ad0a   ; hacia_snake_x: la velocidad en X 0x200 hacia Snake (por la columna y la X), el byte 0x0C = 2 y el dibujo por la direccion (p14:ACD8)
	jr dibujo_por_x		;ad0d
d800_tipo_16:		; la ficha de 0xD800 de tipo 0x16, con 0xD8A0: el byte 0x16 a 1 en los pasos 3-4 sin el byte 0x17; su paso por p14:AD38 (8) y p06:BA36 con su byte 0x0C
	ld a,(0d8a0h)		;ad0f
	and a			;ad12
	ret z			;ad13   ; sin 0xD8A0, nada
	ld a,(ix+001h)		;ad14   ; lee el paso de la ficha de 0xD800
	ld b,a			;ad17
	ld a,(ix+017h)		;ad18   ; con el byte 0x17, 0
	and a			;ad1b
	jr nz,d800_16_byte_16_0		;ad1c
	ld a,b			;ad1e
	sub 003h		;ad1f   ; los pasos 3-4...
	cp 002h		;ad21
	ld a,001h		;ad23   ; ...1
	jr c,d800_16_byte_16		;ad25
d800_16_byte_16_0:
	xor a			;ad27
d800_16_byte_16:
	ld (ix+016h),a		;ad28
	ld a,b			;ad2b
	ld hl,0ad38h		;ad2c   ; su paso
	call 0424eh		;ad2f   ; salta_por_tabla: salta a la palabra A de la tabla de HL
	ld a,(ix+00ch)		;ad32   ; su byte 0x0C
	jp 08085h		;ad35   ; llama_ba36_a:

; ----------------------------------------------------------------------
; DATOS resto_AD38: lo apuntan con el banco puesto p14:AD2C (0xAD38); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p14:AD2C (16 bytes)
;   0xad38..0xad48  (16 bytes)
DATA_resto_AD38:
	defb 048h,0adh,04dh,0adh,096h,0adh,032h,0aeh,00fh,0afh,037h,0afh,077h,0afh,0abh,0afh	; ad38  H.M...2...7.w...

; ======================================================================
; CODIGO 0xad48..0xad86  (62 bytes)
; ======================================================================


d800_16_paso_0:		; el byte 0x16 = 0
	ld (ix+016h),000h		;ad48
	ret			;ad4c
d800_16_paso_1:		; la fila del byte 0x1A de p14:AD86: la velocidad (bytes 7-9) y la espera; la aceleracion 0x80 en los bytes 0x18-0x19, el byte 0x0C = 3, el sonido 0x5A y el siguiente
	ld a,(ix+01ah)		;ad4d
	add a,a			;ad50   ; * 4...
	add a,a			;ad51
	ld hl,0ad86h		;ad52   ; ...de p14:AD86
	call 0423eh		;ad55   ; suma_a_hl: HL = HL + A
	ld a,(hl)			;ad58
	ld (ix+007h),a		;ad59   ; guarda la velocidad de la ficha de 0xD800 en Y (alta)
	inc hl			;ad5c
	ld a,(hl)			;ad5d
	ld (ix+008h),a		;ad5e   ; guarda la velocidad de la ficha de 0xD800 en X (baja)
	inc hl			;ad61
	ld a,(hl)			;ad62   ; la espera
	ld (ix+009h),a		;ad63   ; guarda la velocidad de la ficha de 0xD800 en X (alta)
	inc hl			;ad66
	ld a,(hl)			;ad67
	ld (ix+00eh),a		;ad68   ; guarda la espera de la ficha de 0xD800
	xor a			;ad6b
	ld (ix+006h),a		;ad6c   ; guarda la velocidad de la ficha de 0xD800 en Y (baja)
	ld (ix+019h),a		;ad6f
	ld (ix+018h),080h		;ad72   ; la aceleracion 0x0080
	ld (ix+011h),a		;ad76
	ld (ix+00fh),a		;ad79
	ld (ix+00ch),003h		;ad7c   ; el byte 0x0C = 3
	call 06b59h		;ad80   ; el sonido 0x5A
	jp d800_16_siguiente		;ad83   ; d800_16_siguiente: el paso siguiente

; ----------------------------------------------------------------------
; DATOS resto_AD86: lo apuntan con el banco puesto p14:AD52 (0xAD86), p14:AE9A
;   (0xAD86); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p14:AD52, p14:AE9A (16 bytes)
;   0xad86..0xad96  (16 bytes)
DATA_resto_AD86:
	defb 0feh,000h,000h,014h,0fdh,000h,000h,008h,0feh,080h,001h,00fh,0feh,080h,0feh,00fh	; ad86  ................

; ======================================================================
; CODIGO 0xad96..0xaf6f  (473 bytes)
; ======================================================================


d800_16_paso_2:		; la espera; mientras, la velocidad en Y + la aceleracion (p14:AD9B); al acabar, guarda la velocidad en los bytes 0x1B-0x1E, hacia Snake (p14:ADEB), la Y entre 0x4A y 0xA8, una espera al azar (0-0x1F), el sonido 0x5B y el siguiente
	dec (ix+00eh)		;ad96   ; baja la espera de la ficha de 0xD800
	jr z,d800_16_guarda		;ad99
acelera_y:		; la velocidad en Y (bytes 6-7) + la aceleracion (bytes 0x18-0x19)
	ld h,(ix+007h)		;ad9b   ; lee la velocidad de la ficha de 0xD800 en Y (alta)
	ld l,(ix+006h)		;ad9e   ; lee la velocidad de la ficha de 0xD800 en Y (baja)
	ld d,(ix+019h)		;ada1
	ld e,(ix+018h)		;ada4
	add hl,de			;ada7
	ld (ix+007h),h		;ada8   ; guarda la velocidad de la ficha de 0xD800 en Y (alta)
	ld (ix+006h),l		;adab   ; guarda la velocidad de la ficha de 0xD800 en Y (baja)
	ret			;adae
d800_16_guarda:		; la velocidad a los bytes 0x1B-0x1E
	ld a,(ix+006h)		;adaf   ; lee la velocidad de la ficha de 0xD800 en Y (baja)
	ld (ix+01bh),a		;adb2
	ld a,(ix+007h)		;adb5   ; lee la velocidad de la ficha de 0xD800 en Y (alta)
	ld (ix+01ch),a		;adb8
	ld a,(ix+008h)		;adbb   ; lee la velocidad de la ficha de 0xD800 en X (baja)
	ld (ix+01dh),a		;adbe
	ld a,(ix+009h)		;adc1   ; lee la velocidad de la ficha de 0xD800 en X (alta)
	ld (ix+01eh),a		;adc4
	call hacia_snake_por_1a		;adc7   ; hacia Snake
	ld a,(ix+003h)		;adca   ; la Y...
	ld b,0a8h		;adcd   ; ...hasta 0xA8...
	cp b			;adcf
	jr c,d800_16_y_min		;add0
	ld a,b			;add2
d800_16_y_min:		; ...desde 0x4A
	ld b,04ah		;add3
	cp b			;add5
	jr nc,d800_16_pon_y		;add6
	ld a,b			;add8
d800_16_pon_y:
	ld (ix+003h),a		;add9   ; guarda la Y de la ficha de 0xD800
	call 04256h		;addc   ; una espera al azar
	and 01fh		;addf
	ld (ix+00eh),a		;ade1   ; guarda la espera de la ficha de 0xD800
	call 06b5dh		;ade4   ; el sonido 0x5B
d800_16_siguiente:		; el paso siguiente
	inc (ix+001h)		;ade7   ; sube el paso de la ficha de 0xD800
	ret			;adea
hacia_snake_por_1a:		; con el byte 0x1A desde 2, en Y hacia Snake (0x400, el dibujo 2 o 0, byte 0x0C = 1); si no, en X (el dibujo 6 o 4, byte 0x0C = 2)
	ld a,(ix+01ah)		;adeb
	cp 002h		;adee   ; desde 2, en Y
	jr c,hacia_snake_en_x		;adf0
	ld a,(0cb03h)		;adf2   ; Snake abajo?
	cp (ix+003h)		;adf5   ; compara con la Y de la ficha de 0xD800
	ld de,00400h		;adf8   ; 0x400
	ld b,002h		;adfb
	jr nc,pon_hacia_en_y		;adfd
	call 04442h		;adff   ; arriba: negativa...
	ld b,000h		;ae02   ; ...y el dibujo 0
pon_hacia_en_y:
	ld (ix+00dh),b		;ae04   ; guarda el dibujo de la ficha de 0xD800
	ld (ix+006h),e		;ae07   ; guarda la velocidad de la ficha de 0xD800 en Y (baja)
	ld (ix+007h),d		;ae0a   ; guarda la velocidad de la ficha de 0xD800 en Y (alta)
	ld (ix+00ch),001h		;ae0d
	ret			;ae11
hacia_snake_en_x:
	ld a,(0cb05h)		;ae12   ; lee la X de Snake
	cp (ix+005h)		;ae15   ; Snake a la derecha?
	ld de,00400h		;ae18
	ld b,006h		;ae1b
	jr nc,pon_hacia_en_x		;ae1d
	call 04442h		;ae1f   ; a la izquierda: negativa...
	ld b,004h		;ae22   ; ...y el dibujo 4
pon_hacia_en_x:
	ld (ix+00dh),b		;ae24   ; guarda el dibujo de la ficha de 0xD800
	ld (ix+008h),e		;ae27   ; guarda la velocidad de la ficha de 0xD800 en X (baja)
	ld (ix+009h),d		;ae2a   ; guarda la velocidad de la ficha de 0xD800 en X (alta)
	ld (ix+00ch),002h		;ae2d
	ret			;ae31
d800_16_paso_3:		; p04:86DE; tocado (p14:AEEE), de vuelta (p14:AE76); con la espera, uno menos; sin ella, alineado con Snake (p14:AED4), p14:AEBE; rebota en los bordes (Y 0x50-0xA7 o X 0x38-0x87) dandose la vuelta
	call 086deh		;ae32   ; cambia_paso_cada_2: el byte 0x11 uno mas; cada 2, el paso del dibujo
	call d800_16_tocado		;ae35   ; d800_16_tocado: con una ficha sola en 0xD800 (p14:AF96), sin acarreo; con el byte 0x17, acarreo; si no, acarreo con Snake a menos de 0x20 en Y y en X
	jr c,d800_16_vuelve		;ae38   ; tocado, de vuelta
	ld a,(ix+00eh)		;ae3a   ; lee la espera de la ficha de 0xD800
	and a			;ae3d
	jr z,d800_16_alineado		;ae3e   ; sin espera, aparte
	dec (ix+00eh)		;ae40   ; baja la espera de la ficha de 0xD800
	jr d800_16_bordes		;ae43
d800_16_alineado:
	call alineado_con_snake		;ae45   ; alineado_con_snake: acarreo si Snake esta a menos de 4 en X (o en Y, con el byte 0x1A desde 2)
	jp c,d800_16_ataca		;ae48   ; d800_16_ataca: tocado, de vuelta; si no, el dibujo de p14:AF73, quieto, 0x18 cuadros y el siguiente
d800_16_bordes:
	ld a,(ix+01ah)		;ae4b
	cp 002h		;ae4e   ; en Y?
	jr c,d800_16_bordes_x		;ae50
	ld a,(ix+003h)		;ae52   ; Y - 0x50...
	sub 050h		;ae55
	cp 058h		;ae57   ; ...dentro de 0x58, nada
	ret c			;ae59
	call 0809eh		;ae5a   ; al reves en Y
	jr dibujo_al_reves		;ae5d
d800_16_bordes_x:
	ld a,(ix+005h)		;ae5f   ; lee la X de la ficha de 0xD800
	sub 038h		;ae62   ; X - 0x38...
	cp 050h		;ae64
	ret c			;ae66   ; ...dentro de 0x50, nada
	call 0808eh		;ae67   ; al reves en X
dibujo_al_reves:		; el bit 1 del dibujo cambia
	ld a,(ix+00dh)		;ae6a   ; lee el dibujo de la ficha de 0xD800
	rra			;ae6d
	rra			;ae6e
	ccf			;ae6f
	rla			;ae70
	rla			;ae71
	ld (ix+00dh),a		;ae72   ; guarda el dibujo de la ficha de 0xD800
	ret			;ae75
d800_16_vuelve:		; la velocidad guardada al reves, la espera de la fila siguiente de p14:AD86, el byte 0x0C = 3, el paso 5, el sonido 0x5A y el dibujo de p14:AF6F por el byte 0x1A
	ld e,(ix+01bh)		;ae76
	ld d,(ix+01ch)		;ae79
	call 04442h		;ae7c   ; al reves en Y
	ld (ix+006h),e		;ae7f   ; guarda la velocidad de la ficha de 0xD800 en Y (baja)
	ld (ix+007h),d		;ae82   ; guarda la velocidad de la ficha de 0xD800 en Y (alta)
	ld e,(ix+01dh)		;ae85
	ld d,(ix+01eh)		;ae88
	call 04442h		;ae8b   ; al reves en X
	ld (ix+008h),e		;ae8e   ; guarda la velocidad de la ficha de 0xD800 en X (baja)
	ld (ix+009h),d		;ae91   ; guarda la velocidad de la ficha de 0xD800 en X (alta)
	ld a,(ix+01ah)		;ae94
	inc a			;ae97
	add a,a			;ae98   ; la fila siguiente...
	add a,a			;ae99
	ld hl,0ad86h		;ae9a
	call 0423eh		;ae9d   ; suma_a_hl: HL = HL + A
	dec hl			;aea0   ; ...su espera
	ld a,(hl)			;aea1
	ld (ix+00eh),a		;aea2   ; guarda la espera de la ficha de 0xD800
	ld (ix+00ch),003h		;aea5
	ld (ix+001h),005h		;aea9   ; el paso 5
	call 06b59h		;aead   ; sonido_5a: pide el sonido 0x5A
	ld hl,0af6fh		;aeb0   ; p14:AF6F
dibujo_por_1a:		; el dibujo = el byte 0x1A de HL
	ld a,(ix+01ah)		;aeb3
	call 0423eh		;aeb6   ; suma_a_hl: HL = HL + A
	ld a,(hl)			;aeb9
	ld (ix+00dh),a		;aeba   ; guarda el dibujo de la ficha de 0xD800
	ret			;aebd
d800_16_ataca:		; tocado, de vuelta; si no, el dibujo de p14:AF73, quieto, 0x18 cuadros y el siguiente
	call d800_16_tocado		;aebe   ; d800_16_tocado: con una ficha sola en 0xD800 (p14:AF96), sin acarreo; con el byte 0x17, acarreo; si no, acarreo con Snake a menos de 0x20 en Y y en X
	jr c,d800_16_vuelve		;aec1
	ld hl,0af73h		;aec3
	call dibujo_por_1a		;aec6   ; dibujo_por_1a: el dibujo = el byte 0x1A de HL
	ld (ix+00ch),000h		;aec9   ; quieto
	ld (ix+00eh),018h		;aecd   ; 0x18 cuadros
	jp d800_16_siguiente		;aed1   ; d800_16_siguiente: el paso siguiente
alineado_con_snake:		; acarreo si Snake esta a menos de 4 en X (o en Y, con el byte 0x1A desde 2)
	ld a,(ix+01ah)		;aed4
	cp 002h		;aed7   ; en Y?
	jr c,alineado_en_x		;aed9
	ld a,(0cb03h)		;aedb   ; lee la Y de Snake
	sub (ix+003h)		;aede   ; le resta la Y de la ficha de 0xD800
	jr alineado_cerca		;aee1
alineado_en_x:
	ld a,(0cb05h)		;aee3   ; lee la X de Snake
	sub (ix+005h)		;aee6   ; le resta la X de la ficha de 0xD800
alineado_cerca:		; entre -4 y 3
	sub 0fch		;aee9
	cp 008h		;aeeb
	ret			;aeed
d800_16_tocado:		; con una ficha sola en 0xD800 (p14:AF96), sin acarreo; con el byte 0x17, acarreo; si no, acarreo con Snake a menos de 0x20 en Y y en X
	call cuenta_d800		;aeee   ; cuenta_d800: C = cuantas fichas de 0xD800 estan activas (de 4)
	or a			;aef1
	dec c			;aef2   ; una sola, nada
	ret z			;aef3
	ld a,(ix+017h)		;aef4   ; con el byte 0x17...
	and a			;aef7
	scf			;aef8
	ret nz			;aef9
	call 08079h		;aefa   ; el sitio de Snake
	ld a,l			;aefd   ; la Y...
	sub (ix+003h)		;aefe   ; le resta la Y de la ficha de 0xD800
	sub 0e0h		;af01   ; ...a menos de 0x20
	cp 040h		;af03
	ret nc			;af05
	ld a,h			;af06   ; la X...
	sub (ix+005h)		;af07   ; le resta la X de la ficha de 0xD800
	sub 0e0h		;af0a   ; ...a menos de 0x20
	cp 040h		;af0c
	ret			;af0e
d800_16_paso_4:		; la espera; cada 8 cuadros, lo lanzado 6 (p06:9B3B); al acabar, el byte 0x0F uno mas: a 2, de vuelta; si no, hacia Snake, otra espera al azar y el paso de antes
	dec (ix+00eh)		;af0f   ; baja la espera de la ficha de 0xD800
	jr z,d800_16_otra_vez		;af12   ; al acabar, aparte
	ld a,(ix+00eh)		;af14   ; lee la espera de la ficha de 0xD800
	and 007h		;af17   ; cada 8...
	jp z,09b3bh		;af19   ; ...lanza
	ret			;af1c
d800_16_otra_vez:
	inc (ix+00fh)		;af1d
	ld a,(ix+00fh)		;af20   ; la vez 2...
	cp 002h		;af23
	jp nc,d800_16_vuelve		;af25   ; ...de vuelta
	call hacia_snake_por_1a		;af28   ; hacia Snake
	call 04256h		;af2b   ; una espera al azar
	and 01fh		;af2e
	ld (ix+00eh),a		;af30   ; guarda la espera de la ficha de 0xD800
	dec (ix+001h)		;af33   ; el paso de antes
	ret			;af36
d800_16_paso_5:		; la espera con la aceleracion; al acabar, el sitio de la fila del byte 0x1A de p14:AFD5 (la Y con 0-1, la X con 2-3), su dibujo y todo a 0 (paso 0)
	dec (ix+00eh)		;af37   ; baja la espera de la ficha de 0xD800
	jp nz,acelera_y		;af3a   ; mientras, acelera
	ld a,(ix+01ah)		;af3d
	ld b,a			;af40   ; * 3...
	add a,a			;af41
	add a,b			;af42
	ld hl,0afd5h		;af43   ; ...de p14:AFD5
	call 0423eh		;af46   ; suma_a_hl: HL = HL + A
	ld a,(ix+01ah)		;af49
	cp 002h		;af4c   ; desde 2, la X
	jr nc,d800_16_x		;af4e
	ld a,(hl)			;af50   ; la Y
	ld (ix+003h),a		;af51   ; guarda la Y de la ficha de 0xD800
	inc hl			;af54
	jr d800_16_dibujo		;af55
d800_16_x:
	inc hl			;af57
	ld a,(hl)			;af58   ; la X
	ld (ix+005h),a		;af59   ; guarda la X de la ficha de 0xD800
d800_16_dibujo:
	inc hl			;af5c
	ld a,(hl)			;af5d   ; el dibujo
	ld (ix+00dh),a		;af5e   ; guarda el dibujo de la ficha de 0xD800
	xor a			;af61   ; todo a 0
	ld (ix+002h),a		;af62
	ld (ix+004h),a		;af65
	ld (ix+00ch),a		;af68
	ld (ix+001h),a		;af6b   ; guarda el paso de la ficha de 0xD800
	ret			;af6e

; ----------------------------------------------------------------------
; DATOS resto_AF6F: lo apuntan con el banco puesto p14:AEB0 (0xAF6F), p14:AEC3
;   (0xAF73); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p14:AEB0, p14:AEC3 (8 bytes)
;   0xaf6f..0xaf77  (8 bytes)
DATA_resto_AF6F:
	defb 008h,009h,00ah,00bh,002h,000h,006h,004h	; af6f  ........

; ======================================================================
; CODIGO 0xaf77..0xafd5  (94 bytes)
; ======================================================================


d800_16_paso_6:		; 0x0C cuadros, el dibujo 0x80, quieto, p00:6FA8 y el siguiente; con una ficha sola en 0xD800, los sonidos 5 y 0x86; si no, el 0x14
	ld (ix+00eh),00ch		;af77   ; la espera de la ficha de 0xD800 = 0x0C
	ld (ix+00dh),080h		;af7b   ; el dibujo 0x80
	ld (ix+00ch),000h		;af7f
	call 06fa8h		;af83   ; rachas_bc6e_bancos_14:
	call d800_16_siguiente		;af86   ; d800_16_siguiente: el paso siguiente
	call cuenta_d800		;af89   ; cuenta_d800: C = cuantas fichas de 0xD800 estan activas (de 4)
	dec c			;af8c   ; una sola?
	jp nz,06a44h		;af8d   ; sonido_14: pide el sonido 0x14
	call 06b12h		;af90   ; el sonido 5...
	jp 06c3fh		;af93   ; ...y el 0x86
cuenta_d800:		; C = cuantas fichas de 0xD800 estan activas (de 4)
	ld hl,0d800h		;af96   ; apunta a 4 fichas de 0x20 bytes de 0xD800 (p04:89C3); sus tipos los lleva p10
	ld bc,00400h		;af99   ; 4 fichas, C = 0
cuenta_una_d800:
	ld a,(hl)			;af9c
	and a			;af9d   ; libre?
	jr z,siguiente_cuenta_d800		;af9e
	inc c			;afa0   ; una mas...
	ld d,h			;afa1   ; ...y DE = la ultima
	ld e,l			;afa2
siguiente_cuenta_d800:		; la siguiente (0x20 bytes)
	ld a,020h		;afa3
	call 0423eh		;afa5   ; suma_a_hl: HL = HL + A
	djnz cuenta_una_d800		;afa8
	ret			;afaa
d800_16_paso_7:		; la espera, el dibujo siguiente cada 4 cuadros; al acabar, la ficha libre y sus 4 sprites (desde 0xDC28 + su numero * 0x10) fuera
	dec (ix+00eh)		;afab
	jr z,d800_16_fuera		;afae   ; al acabar, aparte
	ld a,(ix+00eh)		;afb0
	and 003h		;afb3   ; cada 4...
	ret nz			;afb5
	inc (ix+00dh)		;afb6   ; ...el dibujo siguiente
	ret			;afb9
d800_16_fuera:		; libre
	ld (ix+000h),000h		;afba
	push ix		;afbe
	pop hl			;afc0
	ld de,0d800h		;afc1   ; el numero de la ficha * 0x20...
	or a			;afc4
	sbc hl,de		;afc5
	srl l		;afc7   ; ...* 0x10...
	ld de,0dc28h		;afc9   ; ...desde 0xDC28
	add hl,de			;afcc
	ld a,0e0h		;afcd   ; 16 bytes a 0xE0
	ld bc,0000fh		;afcf
	jp 04237h		;afd2   ; llena_bloque: pone A en BC + 1 bytes desde HL

; ----------------------------------------------------------------------
; DATOS resto_AFD5: lo apuntan con el banco puesto p14:AF43 (0xAFD5); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p14:AF43 (12 bytes)
;   0xafd5..0xafe1  (12 bytes)
DATA_resto_AFD5:
	defb 01ch,060h,009h,0b0h,060h,008h,070h,024h,00bh,070h,09ch,00ah	; afd5  .`..`.p$.p..

; ======================================================================
; CODIGO 0xafe1..0xb261  (640 bytes)
; ======================================================================


snake_al_seguir:		; al seguir la partida: 0xCAAD = 3 (0 en la zona 0 fila 1); en la zona 0 desde la fila 5, Snake en el estado 2 (paso 0, 0xCB31 = 1, marcha 1); mirando abajo; en la zona 0x13 con el bit 5 de 0xD7D9, en (0x52, 0x32) de la fila 4 columna 8, sala 5; A = la zona
	ld a,003h		;afe1
	ld (0caadh),a		;afe3   ; 0xCAAD = 3
	ld a,(0ca4ah)		;afe6   ; lee la zona
	ld b,a			;afe9
	and a			;afea
	jr nz,snake_mira_abajo		;afeb   ; fuera de la zona 0, aparte
	ld a,(0ca50h)		;afed   ; lee la fila de la sala en la zona (uno mas al salir por arriba)
	ld c,a			;aff0
	dec a			;aff1   ; la fila 1...
	jr nz,snake_al_seguir_b		;aff2
	xor a			;aff4
	ld (0caadh),a		;aff5   ; ...0xCAAD = 0
snake_al_seguir_b:
	ld a,c			;aff8
	cp 005h		;aff9   ; desde la fila 5...
	jr c,snake_mira_abajo		;affb
	xor a			;affd
	ld (0cb2eh),a		;affe   ; ...el estado 2 en el paso 0
	inc a			;b001
	ld (0cb31h),a		;b002   ; guarda 1 en el estado 2 de Snake
	ld (0cb0ah),a		;b005   ; la marcha 1
	ld (0cb15h),a		;b008   ; guarda la espera hasta el paso siguiente (p02:988A, segun la marcha)
	inc a			;b00b
	ld (0cb00h),a		;b00c   ; el estado 2...
	ld (0cb01h),a		;b00f   ; ...y su dibujo
snake_mira_abajo:		; mirando abajo
	ld a,002h		;b012
	ld (0cb0eh),a		;b014   ; guarda la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ld a,b			;b017
	cp 013h		;b018   ; la zona 0x13...
	jr nz,zona_en_a		;b01a
	ld a,(0d7d9h)		;b01c   ; ...con el bit 5 de 0xD7D9
	and 020h		;b01f
	jr z,zona_en_a		;b021
	ld a,032h		;b023   ; Y = 0x32
	ld (0cb03h),a		;b025   ; guarda la Y de Snake
	ld a,052h		;b028   ; X = 0x52
	ld (0cb05h),a		;b02a   ; guarda la X de Snake
	ld hl,00804h		;b02d   ; fila 4, columna 8
	ld (0ca50h),hl		;b030   ; guarda la fila de la sala en la zona (uno mas al salir por arriba) y el byte siguiente (16 bits)
	ld a,005h		;b033   ; la sala 5
	ld (0ca4bh),a		;b035   ; guarda la sala de la zona
zona_en_a:
	ld a,b			;b038
	ret			;b039
fichas_al_seguir:		; en la zona 0x0A sala 9: 0xD418-0xD419 = 0x0C30 y 0xD41E = 4; con la ficha 0xD820 de tipo 8 y 0xD88B = 0xFF: su paso 0x11, Y 0x60, X 0x70
	ld a,(0ca4ah)		;b03a   ; lee la zona
	cp 00ah		;b03d   ; la zona 0x0A...
	jr nz,d820_al_seguir		;b03f
	ld a,(0ca4bh)		;b041   ; lee la sala de la zona
	cp 009h		;b044   ; ...sala 9
	jr nz,d820_al_seguir		;b046
	ld hl,00c30h		;b048   ; 0x0C30...
	ld (0d418h),hl		;b04b
	ld a,004h		;b04e   ; ...y 4
	ld (0d41eh),a		;b050   ; guarda la direccion de llegada de los actores de la alerta + 1 (p15:BF85)
d820_al_seguir:
	ld hl,0d820h		;b053
	ld a,(hl)			;b056   ; el tipo 8?
	cp 008h		;b057
	ret nz			;b059
	ld a,(0d88bh)		;b05a   ; 0xD88B = 0xFF?
	inc a			;b05d
	ret nz			;b05e
	inc hl			;b05f
	ld (hl),011h		;b060   ; el paso 0x11
	inc hl			;b062
	inc hl			;b063
	ld (hl),060h		;b064   ; la Y 0x60
	inc hl			;b066
	inc hl			;b067
	ld (hl),070h		;b068   ; la X 0x70
	ret			;b06a
zona_al_seguir:		; al seguir en la zona 0x11: la zona 0x12 (tambien en 0xC700) y p14:B090; en la 0x12 con 0xD881 = 0xFF: por 0xD888 y 0xD889, a p14:B090, p14:B0BA o p14:B104
	ld a,(0ca4ah)		;b06b   ; lee la zona
	cp 011h		;b06e   ; la zona 0x11...
	jr nz,zona_12_al_seguir		;b070
	ld a,012h		;b072   ; ...pasa a la 0x12
	ld (0c700h),a		;b074   ; guarda copia de la zona, la sala especial, la Y y la X de Snake y 0xCA50-0xCA51 (6 bytes)
	ld (0ca4ah),a		;b077   ; guarda la zona
	jr zona_12_desde_el_principio		;b07a
zona_12_al_seguir:
	cp 012h		;b07c
	ret nz			;b07e
	ld a,(0d881h)		;b07f   ; 0xD881 = 0xFF?
	inc a			;b082
	ret nz			;b083
	ld a,(0d888h)		;b084   ; 0xD888 = 0xFF?
	inc a			;b087
	jr nz,zona_12_con_d888		;b088
	ld a,(0d889h)		;b08a   ; 0xD889 = 0xFF?
	inc a			;b08d
	jr nz,zona_12_con_d889		;b08e
zona_12_desde_el_principio:		; fuera los bits 4 de 0xD7D0, 5 de 0xD7D1 y 3 de 0xD7DA; nadie sigue a Snake, la primera cosa a 0, 0xD8D8 = 0xFE y 0xD8D9 = 0xFF; Snake en la fila 4 columna 7, Y 0xA0, mirando arriba
	ld hl,0d7d0h		;b090   ; apunta a las banderas de la partida: la n en el bit 7 - n % 8 del byte n / 8 (p03:B0DC, p03:B0F6)
	res 4,(hl)		;b093
	inc hl			;b095
	res 5,(hl)		;b096
	ld hl,0d7dah		;b098
	res 3,(hl)		;b09b
	xor a			;b09d   ; nadie le sigue
	ld (0caa0h),a		;b09e   ; guarda cuantos siguen a Snake por su rastro (1-4)
	ld (0d600h),a		;b0a1   ; la primera cosa a 0
	ld (0d601h),a		;b0a4
	ld (0d602h),a		;b0a7
	ld hl,0d8d8h		;b0aa   ; apunta a las banderas de la sala (se borran al cambiar de sala, p00:59DD)
	ld (hl),0feh		;b0ad   ; 0xD8D8 = 0xFE...
	inc hl			;b0af
	ld (hl),0ffh		;b0b0   ; ...0xD8D9 = 0xFF
	ld hl,00704h		;b0b2   ; fila 4, columna 7
	ld bc,0a001h		;b0b5   ; Y 0xA0, arriba
	jr pon_snake_al_seguir		;b0b8
zona_12_con_d888:		; 0xD8AA = 1, 0xD4F0 = 1, la ficha 0xD820 de tipo 9; con 0xD88C, p02:8EF8 y Snake en la fila 3 columna 9 mirando abajo; sin el, la ficha en el paso 5 de la fila 2 columna 8 en (0x50, 0x60) y Snake en la fila 2 columna 9 mirando a la izquierda
	ld a,001h		;b0ba
	ld (0d8aah),a		;b0bc
	ld (0d4f0h),a		;b0bf
	ld a,009h		;b0c2   ; el tipo 9
	ld (0d820h),a		;b0c4
	ld a,(0d88ch)		;b0c7   ; 0xD88C = 0xFF?
	inc a			;b0ca
	jr z,zona_12_d820_paso_5		;b0cb
	call 08ef8h		;b0cd   ; p02:8EF8
	ld hl,00903h		;b0d0   ; fila 3, columna 9
	ld c,002h		;b0d3   ; abajo
	jr snake_y_68		;b0d5
zona_12_d820_paso_5:		; el paso 5
	ld a,005h		;b0d7
	ld (0d821h),a		;b0d9
	ld hl,00802h		;b0dc   ; fila 2, columna 8
	ld (0d82ah),hl		;b0df
	ld a,060h		;b0e2   ; Y 0x60
	ld (0d823h),a		;b0e4
	ld a,050h		;b0e7   ; X 0x50
	ld (0d825h),a		;b0e9
	ld hl,00902h		;b0ec   ; fila 2, columna 9
snake_mira_izquierda:		; a la izquierda
	ld c,003h		;b0ef
snake_y_68:		; Y 0x68
	ld b,068h		;b0f1
pon_snake_al_seguir:		; la sala
	ld (0ca50h),hl		;b0f3   ; guarda la fila de la sala en la zona (uno mas al salir por arriba) y el byte siguiente (16 bits)
	ld a,b			;b0f6   ; la Y
	ld (0cb03h),a		;b0f7   ; guarda la Y de Snake
	ld a,060h		;b0fa   ; X 0x60
	ld (0cb05h),a		;b0fc   ; guarda la X de Snake
	ld a,c			;b0ff   ; la direccion
	ld (0cb0eh),a		;b100   ; guarda la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ret			;b103
zona_12_con_d889:		; lo que lleva Snake a cero, 0xD7F0-0xD7FF a cero, 0xD8A9 = 1, 0xD6B0 = 1, la ficha 0xD840 de tipo 0x0A y Snake en la fila 2 columna 8 mirando a la izquierda
	ld hl,0d600h		;b104   ; apunta a lo que lleva Snake: fichas de 4 bytes [la tiene][cuenta en BCD, 2 bytes][...]; las de 0xCB20 desde la 1
	ld bc,000ffh		;b107   ; 0x100 bytes
	call 04236h		;b10a   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	ld hl,0d7f0h		;b10d   ; apunta a otras banderas de la partida (p03:B0D3, p03:B0FE)
	ld bc,0000fh		;b110   ; 0x10 bytes
	call 04236h		;b113   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	ld a,001h		;b116
	ld (0d8a9h),a		;b118
	ld (0d6b0h),a		;b11b
	ld a,00ah		;b11e   ; el tipo 0x0A
	ld (0d840h),a		;b120
	ld hl,00802h		;b123   ; fila 2, columna 8
	jr snake_mira_izquierda		;b126
alguien_ve_a_snake:		; salvo en el estado 0x14 o desde el 0x1B de Snake: 0xD43E = 0xFF, p14:B214, 0xCAF6 = 0, 0xD4F4 = 0xD41E (o 0xD449 en una especial); el actor IX de tipo 3, 4 o 5, aparte (p14:B399, B3E3, B3F4); si no, la alerta (p14:B15C)
	ld a,(0cb00h)		;b128   ; lee el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	cp 014h		;b12b   ; el 0x14...
	ret z			;b12d
	sub 01bh		;b12e   ; ...y desde el 0x1B, nada
	ret nc			;b130
	call 09961h		;b131   ; d43e_a_ff: 0xD43E = 0xFF
	call quita_los_que_llegan		;b134   ; quita_los_que_llegan: las 4 fichas de 0xD300 de tipo 0x10 o mas (salvo el 0x15) a cero
	xor a			;b137
	ld (0caf6h),a		;b138   ; 0xCAF6 = 0
	ld a,(0ca76h)		;b13b   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	and a			;b13e   ; en una especial, 0xD449
	ld a,(0d41eh)		;b13f   ; lee la direccion de llegada de los actores de la alerta + 1 (p15:BF85)
	jr z,pon_d4f4		;b142
	ld a,(0d449h)		;b144
pon_d4f4:
	ld (0d4f4h),a		;b147
	ld a,(ix+000h)		;b14a   ; el tipo 3...
	cp 003h		;b14d
	jp z,actor_3_ve		;b14f   ; actor_3_ve: el actor 3 (salvo con el byte 0x19 = 5): en la sala 0x0C, a la alerta normal con el tipo 2 o 1 (el 0x0A se queda); si no, la musica 0x8C, el byte 0x19 = 5 y, salvo en el paso 1, el byte 0x0E = 1 (en el 8, el dibujo del byte 0x15); p06:B592 con su direccion
	cp 004h		;b152   ; ...el 4...
	jp z,actor_4_ve		;b154   ; actor_4_ve: el actor 4 sin 0xCAC9: la alerta 3 con los pasos 0x15/0x16 (dibujo 4), o 0x17 (dibujo 2) si va en Y; con 0xCAC9, la alerta normal
	cp 005h		;b157   ; ...el 5
	jp z,actor_5_ve		;b159   ; actor_5_ve: el actor 5 sin 0xCACA: la alerta 3 con los pasos 0x18/0x1A (dibujo 4 o 6), o 0x19 si va en Y; con 0xCACA, la alerta normal
alerta:		; salvo en el estado 0x14 o desde el 0x1B: la musica 0x8C (0x8E con el actor 0x15) y la alerta (p14:B185)
	ld a,(0cb00h)		;b15c   ; lee el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	cp 014h		;b15f
	ret z			;b161
	sub 01bh		;b162
	ret nc			;b164
	ld a,(ix+000h)		;b165
	cp 015h		;b168   ; el 0x15...
	jr z,alerta_8e		;b16a
	call 06b99h		;b16c   ; la musica 0x8C
	jr pon_la_alerta		;b16f
alerta_8e:		; la musica 0x8E
	call 06a31h		;b171   ; sonido_8e: pide el sonido 0x8E (de los que tienen la partitura en un banco de musica, p16:4CE3) (antes, L_6CDA)
	jr pon_la_alerta		;b174
alerta_sin_musica:		; 0xD4F4 = 0xD41E (o 0xD449 en una especial) y la alerta
	ld a,(0ca76h)		;b176   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	and a			;b179
	ld a,(0d41eh)		;b17a   ; lee la direccion de llegada de los actores de la alerta + 1 (p15:BF85)
	jr z,pon_d4f4_b		;b17d
	ld a,(0d449h)		;b17f
pon_d4f4_b:
	ld (0d4f4h),a		;b182
pon_la_alerta:		; p14:B284, sin musica pendiente, 0xD425 = 0, 0xD426 = 0xD416; la alerta 2, o 3 en ciertas salas (zona 7 salas 9 y 0x0C, 0x0A sala 0x15, 1 sala 0x16, 3 salas 0, 5, 0x0C y 0x10, 4 sala 6, 0x0B sala 2, las especiales 2, 0x0D, 0x18, 0x2E, 0x31 y 0x32); p14:B233 y el marcador de la alerta
	call actores_en_alerta		;b185   ; actores_en_alerta: 0xD416 y 0xD451 a cero, lo lanzado (p14:B269) y cada actor activo a la alerta (p14:B2AB)
	xor a			;b188   ; sin musica pendiente
	ld (0ca18h),a		;b189   ; guarda la espera hasta poner la musica pendiente
	ld h,a			;b18c
	ld l,a			;b18d
	ld (0ca19h),hl		;b18e   ; guarda la musica pendiente: la rutina que la pide (16 bits)
	ld (0d425h),a		;b191   ; 0xD425 = 0
	ld a,(0d416h)		;b194   ; lee cuantos actores han llegado con la alerta
	ld (0d426h),a		;b197   ; guarda cuantos actores hay de los que llegan
	ld a,(0ca4bh)		;b19a   ; la sala...
	ld c,a			;b19d
	ld a,(0ca4ah)		;b19e   ; ...y la zona
	ld b,a			;b1a1
	cp 007h		;b1a2   ; la zona 7...
	jr nz,alerta_zona_0a		;b1a4
	ld a,c			;b1a6
	cp 009h		;b1a7   ; ...salas 9...
	jr z,alerta_3		;b1a9
	cp 00ch		;b1ab   ; ...y 0x0C
	jr z,alerta_3		;b1ad
alerta_zona_0a:
	ld a,b			;b1af
	cp 00ah		;b1b0   ; la 0x0A...
	jr nz,alerta_zona_1		;b1b2
	ld a,c			;b1b4
	cp 015h		;b1b5   ; ...sala 0x15
	jr z,alerta_3		;b1b7
alerta_zona_1:
	ld a,b			;b1b9
	dec a			;b1ba   ; la 1...
	jr nz,alerta_zona_3		;b1bb
	ld a,c			;b1bd
	cp 016h		;b1be   ; ...sala 0x16
	jr z,alerta_3		;b1c0
alerta_zona_3:
	ld a,b			;b1c2
	cp 003h		;b1c3   ; la 3...
	jr nz,alerta_zona_4		;b1c5
	ld a,c			;b1c7
	and a			;b1c8   ; ...salas 0...
	jr z,alerta_3		;b1c9
	cp 005h		;b1cb   ; ...5...
	jr z,alerta_3		;b1cd
	cp 00ch		;b1cf   ; ...0x0C...
	jr z,alerta_3		;b1d1
	cp 010h		;b1d3   ; ...y 0x10
	jr z,alerta_3		;b1d5
alerta_zona_4:
	ld a,b			;b1d7
	cp 004h		;b1d8   ; la 4...
	jr nz,alerta_zona_0b		;b1da
	ld a,c			;b1dc
	cp 006h		;b1dd   ; ...sala 6
	jr z,alerta_3		;b1df
alerta_zona_0b:
	ld a,b			;b1e1
	cp 00bh		;b1e2   ; la 0x0B...
	jr nz,alerta_por_especial		;b1e4
	ld a,c			;b1e6
	cp 002h		;b1e7   ; ...sala 2
	jr z,alerta_3		;b1e9
alerta_por_especial:		; si no, 2
	ld b,002h		;b1eb
	ld a,(0ca76h)		;b1ed   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 002h		;b1f0   ; las especiales 2...
	jr z,alerta_3		;b1f2
	cp 00dh		;b1f4   ; ...0x0D...
	jr z,alerta_3		;b1f6
	cp 018h		;b1f8   ; ...0x18...
	jr z,alerta_3		;b1fa
	cp 02eh		;b1fc   ; ...0x2E...
	jr z,alerta_3		;b1fe
	cp 031h		;b200   ; ...0x31...
	jr z,alerta_3		;b202
	cp 032h		;b204   ; ...y 0x32
	jr nz,pon_alerta		;b206
alerta_3:		; 3
	ld b,003h		;b208
pon_alerta:
	ld a,b			;b20a
	ld (0ca5fh),a		;b20b   ; guarda la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	call cuantos_pueden_llegar		;b20e   ; los que llegan
	jp 09814h		;b211   ; el marcador
quita_los_que_llegan:		; las 4 fichas de 0xD300 de tipo 0x10 o mas (salvo el 0x15) a cero
	ld hl,0d300h		;b214   ; apunta a las 4 fichas de actor de los que llegan con la alerta (los actores 20-23)
	ld b,004h		;b217   ; 4 fichas
L_B219:
	push bc			;b219
	push hl			;b21a
	ld a,(hl)			;b21b
	cp 015h		;b21c   ; el 0x15...
	jr z,siguiente_que_llega		;b21e
	cp 010h		;b220   ; ...o por debajo de 0x10, se quedan
	jr c,siguiente_que_llega		;b222
	ld bc,0003fh		;b224   ; 0x40 bytes a cero
	call 04236h		;b227   ; borra_bloque: pone a cero BC + 1 bytes desde HL
siguiente_que_llega:
	pop hl			;b22a
	ld bc,00040h		;b22b   ; la siguiente (0x40 bytes)
	add hl,bc			;b22e
	pop bc			;b22f
	djnz L_B219		;b230
	ret			;b232
cuantos_pueden_llegar:		; 0xD427 = el de p14:B261 por el nivel de Snake (3-8) + los actores de esta sala
	ld a,(0cab5h)		;b233   ; lee el nivel de Snake: la barra de vida llena mide 0x20 + 8 por nivel
	and 007h		;b236   ; 0-7...
	ld hl,0b261h		;b238   ; ...de p14:B261
	call 0423eh		;b23b   ; suma_a_hl: HL = HL + A
	ld c,(hl)			;b23e
	push ix		;b23f
	ld ix,0ce00h		;b241   ; apunta a los actores: 24 fichas de 0x40 bytes (p04:800D)
	ld b,018h		;b245   ; 24 actores
L_B247:
	ld a,(ix+000h)		;b247   ; lee el tipo del actor (0 = libre)
	and a			;b24a   ; libre, no
	jr z,siguiente_que_cuenta		;b24b
	call 08100h		;b24d   ; en_esta_sala: Z si el actor esta en la sala de ahora (fila y columna)
	jr nz,siguiente_que_cuenta		;b250   ; de otra sala, no
	inc c			;b252   ; uno mas
siguiente_que_cuenta:
	ld de,00040h		;b253
	add ix,de		;b256
	djnz L_B247		;b258
	pop ix		;b25a
	ld a,c			;b25c
	ld (0d427h),a		;b25d   ; guarda cuantos pueden llegar como mucho
	ret			;b260

; ----------------------------------------------------------------------
; DATOS resto_B261: lo apuntan con el banco puesto p14:B238 (0xB261); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p14:B238 (8 bytes)
;   0xb261..0xb269  (8 bytes)
DATA_resto_B261:
	defb 003h,003h,004h,005h,006h,007h,008h,008h	; b261  ........

; ======================================================================
; CODIGO 0xb269..0xb2bf  (86 bytes)
; ======================================================================


lanzados_9ca1:		; p04:9CA1 con cada una de las 6 fichas activas de 0xD460
	ld ix,0d460h		;b269   ; apunta a 6 fichas de 16 bytes de lo que lanzan los actores (p04:9B55)
	ld b,006h		;b26d   ; 6 fichas
L_B26F:
	ld a,(ix+000h)		;b26f   ; lee el tipo de lo lanzado
	and a			;b272
	jr z,siguiente_lanzado_9ca1		;b273   ; libre, nada
	push bc			;b275
	push bc			;b276
	call 09ca1h		;b277   ; p04:9CA1
	pop bc			;b27a
	pop bc			;b27b
siguiente_lanzado_9ca1:		; la siguiente (16 bytes)
	ld de,00010h		;b27c
	add ix,de		;b27f
	djnz L_B26F		;b281
	ret			;b283
actores_en_alerta:		; 0xD416 y 0xD451 a cero, lo lanzado (p14:B269) y cada actor activo a la alerta (p14:B2AB)
	push ix		;b284
	xor a			;b286
	ld (0d416h),a		;b287   ; guarda cuantos actores han llegado con la alerta
	ld (0d451h),a		;b28a
	call lanzados_9ca1		;b28d   ; lanzados_9ca1: p04:9CA1 con cada una de las 6 fichas activas de 0xD460
	ld ix,0ce00h		;b290   ; apunta a los actores: 24 fichas de 0x40 bytes (p04:800D)
	ld b,018h		;b294   ; 24
L_B296:
	ld a,(ix+000h)		;b296   ; lee el tipo del actor (0 = libre)
	and a			;b299
	push hl			;b29a
	push bc			;b29b
	call nz,actor_en_alerta		;b29c   ; activo: a la alerta
	pop bc			;b29f
	pop hl			;b2a0
	ld de,00040h		;b2a1
	add ix,de		;b2a4
	djnz L_B296		;b2a6
	pop ix		;b2a8
	ret			;b2aa
actor_en_alerta:		; por el tipo (sin el bit 7): el 0x0A p14:B318; el 0x0B el paso 7; por debajo de 0x10 p14:B2D6; desde 0x10 por p14:B2BF (el 0x15 p14:B32C, los otros nada)
	and 07fh		;b2ab
	cp 00ah		;b2ad   ; el 0x0A...
	jp z,actor_0a_alerta		;b2af   ; actor_0a_alerta: el actor 0x0A: el paso 5 en esta sala (con 0xD416 uno mas), el 4 fuera de ella
	cp 00bh		;b2b2   ; ...el 0x0B...
	jr z,$+29		;b2b4
	cp 010h		;b2b6   ; ...por debajo de 0x10
	jr c,$+30		;b2b8
	sub 010h		;b2ba   ; desde 0x10
	call 0424dh		;b2bc   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_B2BF: 9 destinos del despachador p00:424D (call en p14:B2BC, el
;   indice en A): B317, B317, B317, B317, B317, B32C, B317, B317, B317; lo
;   leen p14:B2BC (18 bytes)
;   0xb2bf..0xb2d1  (18 bytes)
DATA_tabla_B2BF:
	defw 0b317h,0b317h,0b317h,0b317h,0b317h,0b32ch,0b317h,0b317h	; b2bf
	defw 0b317h	; b2cf  -> actor_alerta_nada

; ======================================================================
; CODIGO 0xb2d1..0xb4a4  (467 bytes)
; ======================================================================


actor_0b_paso_7:		; el paso 7
	ld (ix+001h),007h		;b2d1
	ret			;b2d5
actor_a_la_alerta:		; sin alerta, guarda el dibujo y el byte 0x0C en los bytes 0x17 y 0x16; el byte 0x0C a 0; si no se ve o esta en otra sala, el bit 7 del tipo; si no, sin el, el paso 0, 0xD416 uno mas, el byte 0x1C = 4 y los tipos 2 y 3 se quedan, los otros pasan al 1
	ld a,(0ca5fh)		;b2d6   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	and a			;b2d9   ; con alerta, sin guardar
	jr nz,actor_alerta_b		;b2da
	ld a,(ix+00dh)		;b2dc   ; guarda el dibujo...
	ld (ix+017h),a		;b2df
	ld a,(ix+00ch)		;b2e2   ; ...y el byte 0x0C
	ld (ix+016h),a		;b2e5
actor_alerta_b:
	ld (ix+00ch),000h		;b2e8
	call 0806fh		;b2ec   ; no se ve...
	jr c,actor_alerta_fuera		;b2ef
	call 08100h		;b2f1   ; ...o en otra sala...
	jr z,actor_alerta_aqui		;b2f4
actor_alerta_fuera:		; ...el bit 7
	set 7,(ix+000h)		;b2f6
	ret			;b2fa
actor_alerta_aqui:		; sin el bit 7
	res 7,(ix+000h)		;b2fb
	ld (ix+001h),000h		;b2ff   ; el paso 0
	ld hl,0d416h		;b303   ; uno mas de los que llegan
	inc (hl)			;b306
	ld (ix+01ch),004h		;b307   ; el byte 0x1C = 4
	ld a,(ix+000h)		;b30b   ; el 2 y el 3...
	sub 002h		;b30e
	cp 002h		;b310   ; ...se quedan
	ret c			;b312
	ld (ix+000h),001h		;b313   ; los otros, el tipo 1
actor_alerta_nada:
	ret			;b317
actor_0a_alerta:		; el actor 0x0A: el paso 5 en esta sala (con 0xD416 uno mas), el 4 fuera de ella
	call 08100h		;b318   ; en_esta_sala: Z si el actor esta en la sala de ahora (fila y columna)
	ld a,004h		;b31b   ; fuera, el 4
	jr nz,pon_paso_0a		;b31d
	inc a			;b31f   ; aqui, el 5
pon_paso_0a:
	ld (ix+001h),a		;b320
	call 08100h		;b323   ; en_esta_sala: Z si el actor esta en la sala de ahora (fila y columna)
	ret nz			;b326
	ld hl,0d416h		;b327   ; uno mas de los que llegan
	inc (hl)			;b32a
	ret			;b32b
actor_15_alerta:		; el actor 0x15 en los pasos 0-2: el paso a 0x28, el byte 0x0C y el dibujo guardados en 0x16 y 0x17, el paso 3 y, en esta sala, su lista de sprites, p14:BA17 y p14:B34F
	ld a,(ix+001h)		;b32c
	cp 003h		;b32f   ; desde 3, nada
	ret nc			;b331
	ld (ix+028h),a		;b332   ; guarda el paso
	ld a,(ix+00ch)		;b335
	ld (ix+016h),a		;b338
	ld a,(ix+00dh)		;b33b
	ld (ix+017h),a		;b33e
	ld (ix+001h),003h		;b341   ; el paso 3
	call 08100h		;b345   ; en otra sala, nada mas
	ret nz			;b348
	call 08273h		;b349   ; lista_de_sprites: DE = IX + 0x2E: la lista de sprites del actor
	call 080f3h		;b34c   ; a_p14_ba17_guarda: p14:BA17 guardando el banco de 0xA000
dibujo_del_15:		; el dibujo (0x28 + su dibujo * 16, 0xB0), 16 x 16, en su sitio (X - 8, Y - 0x0F) con la operacion 0xC8 (0xD8 en la pagina 1)
	ld a,(ix+00dh)		;b34f
	add a,a			;b352   ; su dibujo...
	add a,a			;b353
	add a,a			;b354
	add a,a			;b355
	add a,028h		;b356   ; ...* 16 + 0x28...
	ld h,a			;b358
	ld l,0b0h		;b359   ; ...en Y 0xB0
	ld a,(ix+005h)		;b35b   ; la X - 8
	sub 008h		;b35e
	ld d,a			;b360
	ld a,(ix+003h)		;b361   ; la Y - 0x0F
	sub 00fh		;b364
	ld e,a			;b366
	ld bc,01010h		;b367   ; 16 x 16
	ld a,(0ca42h)		;b36a   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	and a			;b36d
	ld a,0c8h		;b36e   ; 0xC8...
	jr z,copia_dibujo_15		;b370
	ld a,0d8h		;b372   ; ...o 0xD8
copia_dibujo_15:
	jp 047edh		;b374   ; copia_rectangulo_logica: orden LMMM del VDP con la operacion logica de A
dibujos_de_los_15:		; los actores 0x15 de esta sala en el paso 3: su dibujo (p14:B34F)
	ld ix,0ce00h		;b377   ; apunta a los actores: 24 fichas de 0x40 bytes (p04:800D)
	ld b,018h		;b37b   ; 24
L_B37D:
	ld a,(ix+000h)		;b37d   ; lee el tipo del actor (0 = libre)
	cp 015h		;b380   ; el 0x15...
	jr nz,siguiente_15		;b382
	call 08100h		;b384   ; ...en esta sala...
	jr nz,siguiente_15		;b387
	ld a,(ix+001h)		;b389   ; lee el paso del actor
	cp 003h		;b38c   ; ...en el paso 3
	call z,dibujo_del_15		;b38e   ; dibujo_del_15: el dibujo (0x28 + su dibujo * 16, 0xB0), 16 x 16, en su sitio (X - 8, Y - 0x0F) con la operacion 0xC8 (0xD8 en la pagina 1)
siguiente_15:
	ld de,00040h		;b391
	add ix,de		;b394
	djnz L_B37D		;b396
	ret			;b398
actor_3_ve:		; el actor 3 (salvo con el byte 0x19 = 5): en la sala 0x0C, a la alerta normal con el tipo 2 o 1 (el 0x0A se queda); si no, la musica 0x8C, el byte 0x19 = 5 y, salvo en el paso 1, el byte 0x0E = 1 (en el 8, el dibujo del byte 0x15); p06:B592 con su direccion
	ld a,(ix+019h)		;b399
	cp 005h		;b39c   ; con 5, nada
	ret z			;b39e
	ld a,(0ca4bh)		;b39f   ; lee la sala de la zona
	cp 00ch		;b3a2   ; la sala 0x0C, aparte
	jr z,actor_3_sala_0c		;b3a4
	call 06b99h		;b3a6   ; la musica 0x8C
	ld a,005h		;b3a9   ; el byte 0x19 = 5
	ld (ix+019h),a		;b3ab
	ld a,(ix+001h)		;b3ae
	dec a			;b3b1
	jr z,actor_3_direccion		;b3b2   ; en el paso 1, aparte
	ld (ix+00eh),001h		;b3b4   ; el byte 0x0E = 1
	cp 008h		;b3b8   ; el paso 8...
	ret nz			;b3ba
	ld a,(ix+015h)		;b3bb   ; ...su dibujo del byte 0x15
	ld (ix+00dh),a		;b3be
actor_3_direccion:		; la direccion del dibujo...
	ld a,(ix+00dh)		;b3c1
	rra			;b3c4
	and 003h		;b3c5
	jp 08e2ah		;b3c7   ; ...a p06:B592
actor_3_sala_0c:
	ld a,(ix+000h)		;b3ca
	and 07fh		;b3cd
	cp 00ah		;b3cf   ; el 0x0A se queda
	jr z,actor_3_tipo		;b3d1
	sub 002h		;b3d3   ; el 2 y el 3...
	cp 002h		;b3d5
	ld a,002h		;b3d7   ; ...el tipo 2...
	jr c,actor_3_tipo		;b3d9
	ld a,001h		;b3db   ; ...los otros el 1
actor_3_tipo:
	ld (ix+000h),a		;b3dd
	jp alerta		;b3e0   ; la alerta
actor_4_ve:		; el actor 4 sin 0xCAC9: la alerta 3 con los pasos 0x15/0x16 (dibujo 4), o 0x17 (dibujo 2) si va en Y; con 0xCAC9, la alerta normal
	ld a,(0cac9h)		;b3e3
	and a			;b3e6   ; con 0xCAC9...
	jp nz,alerta		;b3e7   ; alerta: salvo en el estado 0x14 o desde el 0x1B: la musica 0x8C (0x8E con el actor 0x15) y la alerta (p14:B185)
	ld hl,01504h		;b3ea   ; el paso 0x15, dibujo 4...
	ld de,01604h		;b3ed   ; ...o el 0x16
	ld b,017h		;b3f0   ; en Y, el 0x17
	jr alerta_3_del_actor		;b3f2
actor_5_ve:		; el actor 5 sin 0xCACA: la alerta 3 con los pasos 0x18/0x1A (dibujo 4 o 6), o 0x19 si va en Y; con 0xCACA, la alerta normal
	ld a,(0cacah)		;b3f4
	and a			;b3f7   ; con 0xCACA...
	jp nz,alerta		;b3f8   ; alerta: salvo en el estado 0x14 o desde el 0x1B: la musica 0x8C (0x8E con el actor 0x15) y la alerta (p14:B185)
	ld hl,01804h		;b3fb   ; el paso 0x18, dibujo 4...
	ld de,01a06h		;b3fe   ; ...o el 0x1A, dibujo 6
	ld b,019h		;b401   ; en Y, el 0x19
alerta_3_del_actor:
	push hl			;b403
	push de			;b404
	push bc			;b405
	call 06b99h		;b406   ; la musica 0x8C
	call actores_en_alerta		;b409   ; los actores
	ld a,003h		;b40c   ; la alerta 3
	ld (0ca5fh),a		;b40e   ; guarda la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	call 09814h		;b411   ; su marcador
	pop bc			;b414
	pop de			;b415
	pop hl			;b416
	ld a,(ix+007h)		;b417   ; con velocidad en Y, aparte
	and a			;b41a
	jr nz,paso_en_y		;b41b
paso_por_y:		; desde Y = 0x60...
	ld a,(ix+003h)		;b41d
	cp 060h		;b420
	jr c,pon_paso_y_dibujo		;b422
	ex de,hl			;b424   ; ...el otro
pon_paso_y_dibujo:		; el paso
	ld (ix+001h),h		;b425
	ld (ix+00dh),l		;b428   ; el dibujo
	jr actor_3_direccion		;b42b
paso_en_y:
	ld a,(ix+003h)		;b42d
	cp 0b0h		;b430   ; desde 0xB0, como sin velocidad
	jr nc,paso_por_y		;b432
	ld (ix+001h),b		;b434   ; el paso de Y
	ld (ix+00dh),002h		;b437   ; el dibujo 2
	jr actor_3_direccion		;b43b
cac9_por_sitio:		; con Snake mirando arriba: en la lista de p14:B4A4 ([zona][sala, 0xFF = la especial 0x0C][Y][X][n], hasta 0xFF), si Snake esta en (Y, X)-(Y + 0x14, X + 0x10), el byte n de 0xCAC9 cambia, el sonido 0x46 y p08:A187 (a 0) o p08:A13B (a 1)
	ld a,(0cb0eh)		;b43d   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	dec a			;b440   ; solo arriba
	ret nz			;b441
	ld hl,0b4a4h		;b442   ; la lista de p14:B4A4
sitio_de_cac9:
	ld a,(hl)			;b445
	cp 0ffh		;b446   ; 0xFF: se acaba
	ret z			;b448
	push hl			;b449
	ld a,(0ca4ah)		;b44a   ; lee la zona
	cp (hl)			;b44d   ; su zona?
	jr nz,siguiente_sitio_cac9		;b44e
	inc hl			;b450
	ld a,(hl)			;b451
	cp 0ffh		;b452   ; 0xFF: la especial...
	ld b,a			;b454
	ld a,(0ca4bh)		;b455   ; lee la sala de la zona
	jr nz,sitio_cac9_sala		;b458
	ld b,00ch		;b45a   ; ...0x0C
	ld a,(0ca76h)		;b45c   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
sitio_cac9_sala:		; su sala?
	cp b			;b45f
	jr nz,siguiente_sitio_cac9		;b460
	inc hl			;b462
	ld a,(0cb03h)		;b463   ; lee la Y de Snake
	cp (hl)			;b466   ; por encima, no
	jr c,siguiente_sitio_cac9		;b467
	ld a,(hl)			;b469
	add a,014h		;b46a   ; + 0x14
	ld b,a			;b46c
	ld a,(0cb03h)		;b46d   ; lee la Y de Snake
	cp b			;b470
	jr nc,siguiente_sitio_cac9		;b471   ; por debajo, no
	inc hl			;b473
	ld a,(0cb05h)		;b474   ; lee la X de Snake
	cp (hl)			;b477   ; a la izquierda, no
	jr c,siguiente_sitio_cac9		;b478
	ld a,(hl)			;b47a
	add a,010h		;b47b   ; + 0x10
	ld b,a			;b47d
	ld a,(0cb05h)		;b47e   ; lee la X de Snake
	cp b			;b481
	jr nc,siguiente_sitio_cac9		;b482   ; a la derecha, no
	inc hl			;b484
	ld e,(hl)			;b485   ; su numero
	pop hl			;b486
	ld hl,0cac9h		;b487   ; 0xCAC9 + n...
	ld d,000h		;b48a
	add hl,de			;b48c
	ld a,(hl)			;b48d
	xor 001h		;b48e   ; ...cambia
	ld (hl),a			;b490
	push af			;b491
	call 06c33h		;b492   ; el sonido 0x46
	pop af			;b495
	jp z,07b65h		;b496   ; a 0, p08:A187
	jp 07b6eh		;b499   ; a 1, p08:A13B
siguiente_sitio_cac9:
	pop hl			;b49c
	ld a,005h		;b49d   ; la siguiente (5 bytes)
	call 0423eh		;b49f   ; suma_a_hl: HL = HL + A
	jr sitio_de_cac9		;b4a2

; ----------------------------------------------------------------------
; DATOS resto_B4A4: lo apuntan con el banco puesto p14:B442 (0xB4A4); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p14:B442 (21 bytes)
;   0xb4a4..0xb4b9  (21 bytes)
DATA_resto_B4A4:
	defb 003h,000h,0a4h,047h,000h,003h,010h,0a4h,0a7h,001h,003h,0ffh,044h,087h,002h,004h	; b4a4  ...G........D...
	defb 00eh,064h,010h,004h,0ffh	; b4b4

; ======================================================================
; CODIGO 0xb4b9..0xb4fe  (69 bytes)
; ======================================================================


recuadro_e230:		; 0xE230 = 0; fuera de las especiales y de los sitios, sin alerta ni 0xCB21 = 2: con la sala de Snake en la lista de p14:B4FE ([zona][sala][Y][X]), el recuadro que crece de 0xE230 en ese sitio (p14:B51B)
	xor a			;b4b9
	ld (0e230h),a		;b4ba
	ld a,(0ca76h)		;b4bd   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	or a			;b4c0
	ret nz			;b4c1   ; en una especial, nada
	ld a,(0ca65h)		;b4c2   ; lee el sitio de 0xCBE0 en el que esta Snake (0 = ninguno)
	or a			;b4c5
	ret nz			;b4c6   ; en un sitio, nada
	ld a,(0ca5fh)		;b4c7   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	or a			;b4ca
	ret nz			;b4cb   ; con la alerta, nada
	ld a,(0cb21h)		;b4cc   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	cp 002h		;b4cf
	ret z			;b4d1   ; con 0xCB21 = 2, nada
	ld hl,0b4feh		;b4d2   ; la lista de p14:B4FE
sitio_de_e230:
	ld a,(hl)			;b4d5
	cp 0ffh		;b4d6   ; 0xFF: se acaba
	ret z			;b4d8
	push hl			;b4d9
	call sala_de_e230		;b4da   ; sala_de_e230: si la fila de HL es la zona y sala de Snake: DE = su sitio y 0xE230 uno mas
	pop hl			;b4dd
	ld a,(0e230h)		;b4de
	or a			;b4e1
	jr nz,$+57		;b4e2   ; hallada: a p14:B51B
	ld de,00004h		;b4e4   ; la siguiente (4 bytes)
	add hl,de			;b4e7
	jr sitio_de_e230		;b4e8
sala_de_e230:		; si la fila de HL es la zona y sala de Snake: DE = su sitio y 0xE230 uno mas
	ld a,(0ca4ah)		;b4ea   ; lee la zona
	cp (hl)			;b4ed   ; su zona?
	ret nz			;b4ee
	inc hl			;b4ef
	ld a,(0ca4bh)		;b4f0   ; lee la sala de la zona
	cp (hl)			;b4f3   ; su sala?
	ret nz			;b4f4
	inc hl			;b4f5
	ld e,(hl)			;b4f6   ; el sitio
	inc hl			;b4f7
	ld d,(hl)			;b4f8
	ld hl,0e230h		;b4f9
	inc (hl)			;b4fc
	ret			;b4fd

; ----------------------------------------------------------------------
; DATOS resto_B4FE: lo apuntan con el banco puesto p14:B4D2 (0xB4FE); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p14:B4D2 (29 bytes)
;   0xb4fe..0xb51b  (29 bytes)
DATA_resto_B4FE:
	defb 003h,003h,068h,050h,003h,004h,078h,070h,003h,013h,068h,070h,004h,00bh,068h,050h	; b4fe  ..hP..xp..hp..hP
	defb 00ah,009h,048h,050h,00ah,00ah,048h,030h,00ch,006h,048h,040h,0ffh	; b50e  ..HP..H0..H@.

; ======================================================================
; CODIGO 0xb51b..0xb86e  (851 bytes)
; ======================================================================


e230_empieza:		; el recuadro de 0xE230 en DE (p14:B527), lo de alrededor de la otra pagina (p14:B539), su marco (p14:B61D) y el sonido 0x38
	call e230_ficha		;b51b   ; e230_ficha: 0xE231 = 0 (el paso), 0xE232 = 2 (la cuenta), 0xE233-0xE234 = DE (el centro), 0xE235 = 4 (el radio) y 0xE236 = 0
	call e230_fondo		;b51e   ; e230_fondo: el cuadrado de 0x62 x 0x62 alrededor del centro (0x30 menos; en la zona 0x0C, 0xC4 de alto desde Y = 0x18) copiado de la otra pagina a esta
	call e230_marco		;b521   ; e230_marco: el marco de 2 * r de color 0x0A alrededor del centro
	jp 06af6h		;b524   ; sonido_38: pide el sonido 0x38
e230_ficha:		; 0xE231 = 0 (el paso), 0xE232 = 2 (la cuenta), 0xE233-0xE234 = DE (el centro), 0xE235 = 4 (el radio) y 0xE236 = 0
	ld hl,0e231h		;b527   ; el paso 0
	xor a			;b52a
	ld (hl),a			;b52b
	inc hl			;b52c
	ld (hl),002h		;b52d   ; la cuenta 2
	inc hl			;b52f
	ld (hl),e			;b530   ; el centro: Y...
	inc hl			;b531
	ld (hl),d			;b532   ; ...y X
	inc hl			;b533
	ld (hl),004h		;b534   ; el radio 4
	inc hl			;b536
	ld (hl),a			;b537   ; 0xE236 = 0
	ret			;b538
e230_fondo:		; el cuadrado de 0x62 x 0x62 alrededor del centro (0x30 menos; en la zona 0x0C, 0xC4 de alto desde Y = 0x18) copiado de la otra pagina a esta
	ld a,(0e233h)		;b539
	sub 030h		;b53c   ; el centro - 0x30
	ld l,a			;b53e
	ld a,(0e234h)		;b53f
	sub 030h		;b542
	ld h,a			;b544
	ld b,062h		;b545   ; 0x62 x 0x62
	ld c,b			;b547
	ld a,(0ca4ah)		;b548   ; la zona 0x0C...
	cp 00ch		;b54b
	jr nz,e230_fondo_b		;b54d
	ld c,0c4h		;b54f   ; ...0xC4 de alto...
	ld l,018h		;b551   ; ...desde Y = 0x18
e230_fondo_b:
	ld d,h			;b553
	ld e,l			;b554
	jp 0474dh		;b555   ; copia_rectangulo_a_esta: p00:4767 de la otra pagina (0xCA42 ^ 1) a la de 0xCA42
e230_cada_cuadro:		; fuera de las especiales, sitios y lo de la zona 6 sala 0x10, con 0xE230: con 0xE236, el fondo; sin 0xCB21 = 2, sin 0xCA73, el paso (p14:B5A3) y si toca a Snake (p14:B648); con 0xCA73, a los 4 cuadros (0xCA74), el radio 0x30, fuera, 0xCA73 y 0xE230 a 0, el sonido 0x8E con p06:9955 y los sprites de la sala
	ld a,(0ca76h)		;b558   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	or a			;b55b
	ret nz			;b55c   ; en una especial, nada
	ld a,(0ca65h)		;b55d   ; lee el sitio de 0xCBE0 en el que esta Snake (0 = ninguno)
	or a			;b560
	ret nz			;b561   ; en un sitio, nada
	ld a,(0dfe8h)		;b562   ; lee 1 con lo de la zona 6 sala 0x10 (p11:A389; 0xDFE9 paso, 0xDFEA X)
	or a			;b565
	ret nz			;b566   ; con 0xDFE8, nada
	ld a,(0e230h)		;b567
	or a			;b56a
	ret z			;b56b   ; sin 0xE230, nada
	ld hl,0e236h		;b56c
	ld a,(hl)			;b56f
	or a			;b570
	jr nz,e230_fondo_otra_vez		;b571   ; con 0xE236, el fondo
	ld a,(0cb21h)		;b573   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	cp 002h		;b576
	ret z			;b578   ; 0xCB21 = 2, nada
	ld a,(0ca73h)		;b579
	or a			;b57c
	jr nz,e230_ha_tocado		;b57d   ; con 0xCA73, aparte
	call e230_paso		;b57f   ; su paso...
	jp e230_toca		;b582   ; ...y si toca
e230_fondo_otra_vez:
	ld (hl),000h		;b585
	jr e230_fondo		;b587
e230_ha_tocado:
	ld hl,0ca74h		;b589
	dec (hl)			;b58c   ; la cuenta
	ret nz			;b58d
	ld a,030h		;b58e   ; el radio 0x30...
	ld (0e235h),a		;b590
	call e230_borra		;b593   ; ...fuera
	xor a			;b596   ; 0xCA73...
	ld (0ca73h),a		;b597
	ld (0e230h),a		;b59a   ; ...y 0xE230 a 0
	call 07b76h		;b59d   ; el sonido y p06:9955
	jp 08f00h		;b5a0   ; los sprites de la sala
e230_paso:		; por 0xE231: el 0 crece de 8 en 8 cada 2 cuadros con su marco hasta 0x30 (luego el 1 con el radio 4); el 1 crece borrando hasta 0x30 (luego el 2, 0x30 cuadros y, en la zona 0x0C, el centro al otro lado); el 2 espera (en la zona 0x0C no) y vuelve al 0 con el marco y el sonido 0x38
	ld a,(0e231h)		;b5a3
	dec a			;b5a6   ; el 1...
	jr z,e230_paso_1		;b5a7
	dec a			;b5a9   ; ...el 2
	jr z,e230_paso_2		;b5aa
	ld hl,0e232h		;b5ac
	dec (hl)			;b5af   ; cada 2 cuadros
	ret nz			;b5b0
	ld (hl),002h		;b5b1
	ld a,(0e235h)		;b5b3   ; el radio + 8
	add a,008h		;b5b6
	ld (0e235h),a		;b5b8
	cp 031h		;b5bb   ; hasta 0x30...
	jr nc,e230_paso_siguiente		;b5bd
	jr e230_marco		;b5bf   ; ...con su marco
e230_paso_siguiente:		; el radio 4...
	ld a,004h		;b5c1
	ld (0e235h),a		;b5c3
	ld hl,0e231h		;b5c6   ; ...y el paso siguiente
	inc (hl)			;b5c9
	ret			;b5ca
e230_paso_1:
	ld hl,0e232h		;b5cb
	dec (hl)			;b5ce
	ret nz			;b5cf   ; cada 2 cuadros
	ld (hl),002h		;b5d0
	ld a,(0e235h)		;b5d2   ; el radio + 8
	add a,008h		;b5d5
	ld (0e235h),a		;b5d7
	cp 031h		;b5da   ; hasta 0x30...
	jr nc,e230_paso_1_acaba		;b5dc
	jr e230_borra		;b5de   ; ...borrando
e230_paso_1_acaba:
	call e230_paso_siguiente		;b5e0   ; e230_paso_siguiente: el radio 4...
	ld a,030h		;b5e3   ; 0x30 cuadros
	ld (0e232h),a		;b5e5
	ld a,(0ca4ah)		;b5e8   ; lee la zona
	cp 00ch		;b5eb   ; en la zona 0x0C...
	ret nz			;b5ed
	ld a,(0e233h)		;b5ee   ; ...el centro al otro lado
	xor 0c0h		;b5f1
	ld (0e233h),a		;b5f3
	ret			;b5f6
e230_paso_2:
	ld hl,0e232h		;b5f7
	ld a,(0ca4ah)		;b5fa   ; lee la zona
	cp 00ch		;b5fd   ; en la zona 0x0C, sin esperar
	jr z,e230_vuelve		;b5ff
	dec (hl)			;b601
	ret nz			;b602
e230_vuelve:
	ld (hl),002h		;b603
	xor a			;b605   ; el paso 0
	ld (0e231h),a		;b606
	call e230_marco		;b609   ; su marco
	jp 06af6h		;b60c   ; el sonido 0x38
e230_borra:		; el cuadrado del radio (2 * r + 2) copiado de esta pagina a la otra
	call e230_esquina		;b60f   ; e230_esquina: HL = el centro - el radio; B = el radio
	ld d,h			;b612
	ld e,l			;b613
	ld a,b			;b614   ; 2 * r + 2
	add a,a			;b615
	add a,002h		;b616
	ld b,a			;b618
	ld c,a			;b619
	jp 0475ah		;b61a   ; copia_rectangulo_a_la_otra: p00:4767 de la pagina 0xCA42 a la otra
e230_marco:		; el marco de 2 * r de color 0x0A alrededor del centro
	call e230_esquina		;b61d   ; e230_esquina: HL = el centro - el radio; B = el radio
	ld a,b			;b620   ; 2 * r
	add a,a			;b621
	ld d,a			;b622
	ld e,a			;b623
	ld c,00ah		;b624   ; color 0x0A
	ld a,(0ca42h)		;b626   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	jp 046bch		;b629   ; marco: cuatro lineas: un marco de D x E desde HL
e230_esquina:		; HL = el centro - el radio; B = el radio
	ld a,(0e235h)		;b62c   ; el radio
	ld b,a			;b62f
	ld a,(0e233h)		;b630   ; Y - el radio
	sub b			;b633
	ld l,a			;b634
	ld a,(0e234h)		;b635   ; X - el radio
	sub b			;b638
	ld h,a			;b639
	ret			;b63a
e230_fuera:		; el radio 0x30, borrado y 0xE230 = 0
	ld a,030h		;b63b
	ld (0e235h),a		;b63d
	call e230_borra		;b640   ; e230_borra: el cuadrado del radio (2 * r + 2) copiado de esta pagina a la otra
	xor a			;b643
	ld (0e230h),a		;b644
	ret			;b647
e230_toca:		; con la alerta, fuera (p14:B63B); salvo en el paso 2: lo lanzado 6 u 8 (p14:B687) y, sin 0xCA73, Snake (X, Y - 8) a menos del radio del centro: 0xCA73 = 1 y 0xCA74 = 4
	ld a,(0ca5fh)		;b648   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	or a			;b64b
	jr nz,e230_fuera		;b64c   ; con la alerta, fuera
	ld a,(0e231h)		;b64e
	cp 002h		;b651   ; en el paso 2, nada
	ret z			;b653
	call e230_toca_lanzado		;b654   ; lo lanzado
	ld a,(0ca73h)		;b657
	or a			;b65a
	ret nz			;b65b
	call radio_de_e230		;b65c   ; el radio
	ld c,a			;b65f
	ld a,(0cb03h)		;b660   ; la Y de Snake - 8
	sub 008h		;b663
	ld e,a			;b665
	ld a,(0cb05h)		;b666   ; lee la X de Snake
	ld d,a			;b669
	ld a,(0e233h)		;b66a   ; la distancia en Y...
	sub e			;b66d
	jr nc,L_B672		;b66e
	neg		;b670
L_B672:
	cp c			;b672   ; ...menor que el radio?
	ret nc			;b673
	ld a,(0e234h)		;b674   ; la distancia en X...
	sub d			;b677
	jr nc,L_B67C		;b678
	neg		;b67a
L_B67C:
	cp c			;b67c   ; ...menor?
	ret nc			;b67d
e230_tocado:		; 0xCA73 = 1...
	ld hl,0ca73h		;b67e
	ld (hl),001h		;b681
	inc hl			;b683
	ld (hl),004h		;b684   ; ...0xCA74 = 4
	ret			;b686
e230_toca_lanzado:		; lo lanzado por Snake de tipo 6 u 8 (en X + 0x10, Y - 8) a menos del radio: tocado
	ld a,(0cb80h)		;b687   ; lee las 6 fichas de 16 bytes de lo que lanza Snake ([tipo][..][Y 8.8][X 8.8][velocidades]...)
	cp 008h		;b68a   ; el 8...
	jr z,e230_lanzado		;b68c
	cp 006h		;b68e   ; ...o el 6
	ret nz			;b690
e230_lanzado:
	call radio_de_e230		;b691   ; radio_de_e230: A = el radio (0x30 en el paso 1)
	ld c,a			;b694
	ld hl,0cb83h		;b695   ; su Y - 8
	ld a,(hl)			;b698
	sub 008h		;b699
	ld e,a			;b69b
	inc hl			;b69c
	inc hl			;b69d
	ld a,(hl)			;b69e   ; su X + 0x10
	add a,010h		;b69f
	ld d,a			;b6a1
	ld a,(0e233h)		;b6a2   ; la distancia en Y...
	sub e			;b6a5
	jr nc,L_B6AA		;b6a6
	neg		;b6a8
L_B6AA:
	cp c			;b6aa
	ret nc			;b6ab
	ld a,(0e234h)		;b6ac   ; ...y en X
	sub d			;b6af
	jr nc,L_B6B4		;b6b0
	neg		;b6b2
L_B6B4:
	cp c			;b6b4
	ret nc			;b6b5
	jr e230_tocado		;b6b6
radio_de_e230:		; A = el radio (0x30 en el paso 1)
	ld a,(0e231h)		;b6b8   ; el paso 1...
	dec a			;b6bb
	ld a,030h		;b6bc   ; ...0x30
	ret z			;b6be
	ld a,(0e235h)		;b6bf   ; si no, el radio de ahora
	ret			;b6c2
rayas_de_la_sala:		; 0xCA68 = 0, fuera el bit 1 de 0xD7E2, las rayas de 0xE280 a cero y, sin alerta: en la zona 3 la lista de p56:A512; en la especial 0x0D p56:A533; en la 0x31 (salvo la columna 7) p56:A525 (columna 6) o p56:A52C; con ellas, el bit 1 de 0xD7E2 y se pintan (p14:B712)
	xor a			;b6c3
	ld (0ca68h),a		;b6c4   ; guarda 1 si la sala tiene ficha en la lista de p02:877F
	ld hl,0d7e2h		;b6c7   ; el bit 1 de 0xD7E2
	res 1,(hl)		;b6ca
	call borra_e280		;b6cc   ; a cero
	ld a,(0ca5fh)		;b6cf   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	or a			;b6d2
	ret nz			;b6d3   ; con la alerta, nada
	ld a,(0ca76h)		;b6d4   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	or a			;b6d7
	jr nz,rayas_de_especial		;b6d8   ; en una especial, aparte
	ld a,(0ca4ah)		;b6da   ; lee la zona
	ld hl,0a512h		;b6dd   ; p56:A512...
	cp 003h		;b6e0   ; ...en la zona 3
	ret nz			;b6e2
rayas_de_lista:		; las de la lista
	call 0876bh		;b6e3   ; fichas_e280_de_sala: la lista de p56 de HL: la ficha de la sala, y sus piezas a 0xE280
	ld hl,0d7e2h		;b6e6
	set 1,(hl)		;b6e9   ; el bit 1
	jr pinta_rayas		;b6eb
rayas_de_especial:		; la 0x0D...
	cp 00dh		;b6ed
	ld hl,0a533h		;b6ef   ; ...p56:A533
	jr z,rayas_de_lista		;b6f2
	cp 031h		;b6f4   ; la 0x31...
	ret nz			;b6f6
	ld a,(0ca51h)		;b6f7   ; lee la columna de la sala en la zona (uno mas al salir por la derecha)
	cp 007h		;b6fa   ; ...salvo la columna 7
	ret z			;b6fc
	cp 006h		;b6fd   ; la 6...
	ld hl,0a525h		;b6ff   ; ...p56:A525...
	jr z,rayas_de_lista		;b702
	ld hl,0a52ch		;b704   ; ...si no, p56:A52C
	jr rayas_de_lista		;b707
borra_e280:		; 0xE280-0xE2BF a cero
	ld hl,0e280h		;b709
	ld bc,0003fh		;b70c
	jp 04236h		;b70f   ; borra_bloque: pone a cero BC + 1 bytes desde HL
pinta_rayas:		; con 0xCB21 = 1: las 8 fichas de 0xE280 activas, cada una (p14:B72F)
	ld a,(0cb21h)		;b712   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	dec a			;b715   ; solo con 0xCB21 = 1
	ret nz			;b716
	ld ix,0e280h		;b717
	ld b,008h		;b71b   ; 8 fichas
pinta_raya_e280:
	ld a,(ix+000h)		;b71d
	or a			;b720   ; libre: se acaba
	ret z			;b721
	push bc			;b722
	call pinta_una_raya		;b723   ; pinta_una_raya: lo de su sitio copiado de la otra pagina y la raya de color 0x0A en (bytes 3-4): vertical de largo el byte 5 si es 3 o mas; si no, horizontal de largo el byte 6
	pop bc			;b726
	ld de,00008h		;b727   ; la siguiente (8 bytes)
	add ix,de		;b72a
	djnz pinta_raya_e280		;b72c
	ret			;b72e
pinta_una_raya:		; lo de su sitio copiado de la otra pagina y la raya de color 0x0A en (bytes 3-4): vertical de largo el byte 5 si es 3 o mas; si no, horizontal de largo el byte 6
	call rectangulo_de_raya		;b72f   ; rectangulo_de_raya: HL = DE = su sitio, C = el byte 5 + 1, B = el byte 6 + 2
	call 0474dh		;b732   ; lo de debajo
	ld l,(ix+003h)		;b735   ; su sitio
	ld h,(ix+004h)		;b738
	ld c,00ah		;b73b   ; color 0x0A
	ld a,(ix+005h)		;b73d
	cp 003h		;b740   ; desde 3...
	ld b,a			;b742
	ld a,(0ca42h)		;b743   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	jp nc,04680h		;b746   ; ...vertical
	ld b,(ix+006h)		;b749   ; si no, horizontal
	jp 0467ch		;b74c   ; linea_horizontal: orden LINE del VDP (R#36-R#46) con el lado largo en X
rectangulo_de_raya:		; HL = DE = su sitio, C = el byte 5 + 1, B = el byte 6 + 2
	ld l,(ix+003h)		;b74f   ; su sitio (byte 3, Y; byte 4, X)
	ld h,(ix+004h)		;b752
	ld c,(ix+005h)		;b755   ; el byte 5 + 1
	inc c			;b758
	ld b,(ix+006h)		;b759   ; el byte 6 + 2
	inc b			;b75c
	inc b			;b75d
	ld e,l			;b75e   ; DE = el mismo sitio
	ld d,h			;b75f
	ret			;b760
rayas_cada_cuadro:		; con 0xCA68: con la alerta, fuera (p14:B795); si no, si tocan (p14:B7C5) y cada 0x20 cuadros (0xCA69) se borran y salen las siguientes: 0xCA6A de 0 a 3 y las piezas del byte 0xCA6B + eso (p56:A53A) a 0xE280, pintadas
	ld a,(0ca68h)		;b761   ; lee 1 si la sala tiene ficha en la lista de p02:877F
	or a			;b764
	ret z			;b765   ; sin 0xCA68, nada
	ld a,(0ca5fh)		;b766   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	or a			;b769
	jr nz,rayas_fuera		;b76a   ; con la alerta, fuera
	call rayas_tocan		;b76c   ; si tocan
	ld hl,0ca69h		;b76f   ; apunta a el quinto byte de la ficha de la sala (p02:877F)
	dec (hl)			;b772   ; la cuenta
	ret nz			;b773
	ld (hl),020h		;b774   ; 0x20 cuadros
	call borra_rayas		;b776   ; las borra
	call borra_e280		;b779   ; borra_e280: 0xE280-0xE2BF a cero
	call ca6a_siguiente		;b77c   ; 0-3
	ld hl,0ca6bh		;b77f   ; de 0xCA6B
	call 0423eh		;b782   ; suma_a_hl: HL = HL + A
	ld a,(hl)			;b785
	call 08777h		;b786   ; las nuevas
	jp pinta_rayas		;b789   ; pintadas
ca6a_siguiente:		; 0xCA6A de 0 a 3
	ld hl,0ca6ah		;b78c   ; apunta a a cero al encontrar la ficha de la sala
	ld a,(hl)			;b78f
	inc a			;b790
	and 003h		;b791
	ld (hl),a			;b793
	ret			;b794
rayas_fuera:		; borradas, 0xCA68 = 0 y 0xCA69 = 1
	call borra_rayas		;b795   ; borra_rayas: con 0xCB21 = 1: lo de cada raya de 0xE280 copiado de esta pagina a la otra
	call borra_e280		;b798   ; borra_e280: 0xE280-0xE2BF a cero
	xor a			;b79b
	ld (0ca68h),a		;b79c   ; guarda 1 si la sala tiene ficha en la lista de p02:877F
	ld hl,0ca69h		;b79f   ; apunta a el quinto byte de la ficha de la sala (p02:877F)
	ld (hl),001h		;b7a2
	ret			;b7a4
borra_rayas:		; con 0xCB21 = 1: lo de cada raya de 0xE280 copiado de esta pagina a la otra
	ld a,(0cb21h)		;b7a5   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	dec a			;b7a8   ; solo con 1
	ret nz			;b7a9
	ld ix,0e280h		;b7aa
	ld b,008h		;b7ae   ; 8 fichas
borra_una_raya:
	ld a,(ix+000h)		;b7b0
	or a			;b7b3
	ret z			;b7b4   ; libre: se acaba
	push bc			;b7b5
	call rectangulo_de_raya		;b7b6   ; rectangulo_de_raya: HL = DE = su sitio, C = el byte 5 + 1, B = el byte 6 + 2
	call 0475ah		;b7b9   ; copia_rectangulo_a_la_otra: p00:4767 de la pagina 0xCA42 a la otra
	pop bc			;b7bc
	ld de,00008h		;b7bd   ; la siguiente (8 bytes)
	add ix,de		;b7c0
	djnz borra_una_raya		;b7c2
	ret			;b7c4
rayas_tocan:		; sin alerta ni salida de la sala: cada raya de 0xE280 contra Snake (p14:B80C) y lo lanzado 6 u 8 (p14:B7EF)
	ld a,(0ca5fh)		;b7c5   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	or a			;b7c8
	ret nz			;b7c9   ; con la alerta, nada
	ld a,(0ca41h)		;b7ca   ; lee la salida de la sala (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	or a			;b7cd
	ret nz			;b7ce   ; saliendo, nada
	ld ix,0e280h		;b7cf
	ld b,008h		;b7d3   ; 8 fichas
raya_toca:
	ld a,(0ca5fh)		;b7d5   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	or a			;b7d8
	ret nz			;b7d9   ; con la alerta, se acaba
	ld a,(ix+000h)		;b7da
	or a			;b7dd
	ret z			;b7de   ; libre: se acaba
	push bc			;b7df
	call raya_toca_snake		;b7e0   ; Snake
	call raya_toca_lanzado		;b7e3   ; lo lanzado
	pop bc			;b7e6
	ld de,00008h		;b7e7   ; la siguiente (8 bytes)
	add ix,de		;b7ea
	djnz raya_toca		;b7ec
	ret			;b7ee
raya_toca_lanzado:		; lo lanzado por Snake de tipo 6 u 8: su caja (X + 0x10, Y + 0x10) de 16 x 16
	ld a,(0cb80h)		;b7ef   ; lee las 6 fichas de 16 bytes de lo que lanza Snake ([tipo][..][Y 8.8][X 8.8][velocidades]...)
	cp 008h		;b7f2   ; el 8...
	jr z,raya_lanzado		;b7f4
	cp 006h		;b7f6   ; ...o el 6
	ret nz			;b7f8
raya_lanzado:
	ld hl,0cb83h		;b7f9
	ld a,(hl)			;b7fc   ; su Y...
	inc hl			;b7fd
	inc hl			;b7fe
	add a,010h		;b7ff   ; ...+ 0x10
	ld e,a			;b801
	ld a,(hl)			;b802   ; su X + 0x10
	add a,010h		;b803
	ld d,a			;b805
	ld b,010h		;b806   ; 16 x 16
	ld c,010h		;b808
	jr raya_contra_caja		;b80a
raya_toca_snake:		; la caja de Snake: (X + 6, Y) de 0x18 de alto y 0x0C de ancho
	ld a,(0cb05h)		;b80c   ; lee la X de Snake
	add a,006h		;b80f   ; la X + 6
	ld d,a			;b811
	ld a,(0cb03h)		;b812   ; la Y
	ld e,a			;b815
	ld b,00ch		;b816   ; 0x0C de ancho...
	ld c,018h		;b818   ; ...0x18 de alto
raya_contra_caja:		; si la caja (esquina abajo a la derecha: X = D, Y = E; C alto, B ancho) toca la raya: el sonido 0x8E con p06:9955 y los sprites de la sala
	ld l,(ix+003h)		;b81a
	ld h,(ix+004h)		;b81d   ; su sitio
	ld a,e			;b820   ; por encima, nada
	cp l			;b821
	ret c			;b822
	ld a,d			;b823   ; a la izquierda, nada
	cp h			;b824
	ret c			;b825
	ld a,l			;b826   ; + el byte 5
	add a,(ix+005h)		;b827
	ld l,a			;b82a
	ld a,h			;b82b   ; + el byte 6
	add a,(ix+006h)		;b82c
	ld h,a			;b82f
	ld a,d			;b830   ; la esquina de arriba...
	sub b			;b831
	ld d,a			;b832
	ld a,e			;b833   ; ...a la izquierda
	sub c			;b834
	ld e,a			;b835
	ld a,l			;b836   ; por debajo, nada
	cp e			;b837
	ret c			;b838
	ld a,h			;b839   ; a la derecha, nada
	cp d			;b83a
	ret c			;b83b
	call 07b76h		;b83c   ; tocada: el sonido y p06:9955
	jp 08f00h		;b83f   ; los sprites de la sala
vista_del_actor:		; A = el byte del dibujo del actor IX en su tabla: el 0x15 p14:B88B, el 0x0B p14:B87E, el 0x0A p14:B885, los otros p14:B86E; el 0x10, 0xFF
	ld a,(ix+000h)		;b842
	and 07fh		;b845
	ld hl,0b88bh		;b847   ; el 0x15...
	cp 015h		;b84a
	jr z,byte_del_dibujo		;b84c
	cp 010h		;b84e   ; ...el 0x10...
	jr z,vista_ff		;b850
	ld hl,0b87eh		;b852   ; ...el 0x0B...
	cp 00bh		;b855
	jr z,byte_del_dibujo		;b857
	ld hl,0b885h		;b859   ; ...el 0x0A...
	cp 00ah		;b85c
	jr z,byte_del_dibujo		;b85e
	ld hl,0b86eh		;b860   ; ...los otros
byte_del_dibujo:		; por su dibujo
	ld a,(ix+00dh)		;b863
	call 0423eh		;b866   ; suma_a_hl: HL = HL + A
	ld a,(hl)			;b869
	ret			;b86a
vista_ff:
	ld a,0ffh		;b86b
	ret			;b86d

; ----------------------------------------------------------------------
; DATOS resto_B86E: lo apuntan con el banco puesto p14:B860 (0xB86E), p14:B852
;   (0xB87E), p14:B859 (0xB885), p14:B847 (0xB88B); el tamano es lo que hay
;   hasta lo siguiente, no sale de recorrerlo; lo leen p14:B860, p14:B852,
;   p14:B859, p14:B847 (33 bytes)
;   0xb86e..0xb88f  (33 bytes)
DATA_resto_B86E:
	defb 006h,006h,002h,002h,004h,004h,000h,000h,005h,007h,001h,003h,003h,005h,007h,001h	; b86e  ................
	defb 006h,006h,002h,002h,004h,005h,003h,0ffh,002h,003h,002h,001h,0ffh,000h,001h,002h	; b87e  ................
	defb 003h	; b88e

; ======================================================================
; CODIGO 0xb88f..0xb974  (229 bytes)
; ======================================================================


actor_cambia_de_sala:		; el actor IX que sale por un borde pasa a la sala de al lado (fila o columna) por el otro (el 0x14 de 2 a 0xC0 en Y y de 0 a 0xC0 en X; los otros de 0x10 a 0xC0 y de 9 a 0xB9); luego sus sprites libres (NZ) o, sin ellos, pintado si esta en esta sala
	ld a,(ix+000h)		;b88f
	ld d,a			;b892
	cp 014h		;b893   ; el 0x14...
	ld b,002h		;b895   ; ...desde 2...
	jr z,actor_borde_y		;b897
	ld b,010h		;b899   ; ...los otros desde 0x10
actor_borde_y:
	ld a,(ix+003h)		;b89b
	cp b			;b89e
	jr c,actor_arriba		;b89f   ; por arriba
	cp 0c0h		;b8a1
	jr nc,actor_abajo		;b8a3   ; por abajo
	ld a,(ix+000h)		;b8a5
	cp 014h		;b8a8
	ld bc,009b9h		;b8aa   ; de 9 a 0xB9...
	jr nz,actor_borde_x		;b8ad
	ld bc,002c0h		;b8af   ; ...el 0x14 de 2 a 0xC0
actor_borde_x:
	ld a,(ix+005h)		;b8b2
	cp b			;b8b5
	jr c,actor_a_la_izquierda		;b8b6   ; por la izquierda
	cp c			;b8b8
	ret c			;b8b9   ; dentro, nada
	ld a,d			;b8ba
	cp 014h		;b8bb
	jr nz,actor_a_la_derecha		;b8bd
	ld b,000h		;b8bf   ; el 0x14, en 0
actor_a_la_derecha:		; a la izquierda de la sala siguiente
	ld (ix+005h),b		;b8c1
	ld (ix+004h),000h		;b8c4
	inc (ix+00bh)		;b8c8   ; una columna mas
	jr actor_suelta_sprites		;b8cb
actor_a_la_izquierda:		; a la derecha de la de antes
	ld (ix+005h),c		;b8cd
	ld (ix+004h),000h		;b8d0
	dec (ix+00bh)		;b8d4   ; una columna menos
	jr actor_suelta_sprites		;b8d7
actor_abajo:
	ld a,d			;b8d9
	cp 014h		;b8da
	jr nz,actor_abajo_b		;b8dc
	ld b,000h		;b8de   ; el 0x14, en 0
actor_abajo_b:		; arriba de la de abajo
	ld (ix+003h),b		;b8e0
	ld (ix+002h),000h		;b8e3
	dec (ix+00ah)		;b8e7   ; una fila menos
	jr actor_suelta_sprites		;b8ea
actor_arriba:		; abajo de la de arriba
	ld (ix+003h),0c0h		;b8ec
	ld (ix+002h),000h		;b8f0
	inc (ix+00ah)		;b8f4   ; una fila mas
actor_suelta_sprites:		; su lista de sprites
	call 08273h		;b8f7   ; lista_de_sprites: DE = IX + 0x2E: la lista de sprites del actor
	ld a,(de)			;b8fa
	and a			;b8fb
	jr z,actor_sin_sprites		;b8fc   ; sin ellos, aparte
	ld b,012h		;b8fe   ; 18
suelta_sprite:
	ld a,(de)			;b900
	push bc			;b901
	push de			;b902
	call sprite_libre		;b903   ; libre y fuera
	pop de			;b906
	xor a			;b907   ; a 0 en la lista
	ld (de),a			;b908
	inc e			;b909
	pop bc			;b90a
	djnz suelta_sprite		;b90b
	or a			;b90d   ; NZ
	ret			;b90e
sprite_libre:		; el sprite N - 1: libre en 0xD400 y fuera en 0xDC28
	and a			;b90f
	ret z			;b910   ; 0: nada
	dec a			;b911
	ld b,a			;b912
	ld hl,0d400h		;b913   ; apunta a los 22 sprites que se reparten los actores (1 = ocupado)
	call 0423eh		;b916   ; en 0xD400...
	xor a			;b919
	ld (hl),a			;b91a   ; ...libre
	ld a,b			;b91b
	add a,a			;b91c   ; * 4...
	add a,a			;b91d
	ld hl,0dc28h		;b91e   ; ...desde 0xDC28
	call 0423eh		;b921   ; suma_a_hl: HL = HL + A
	ld (hl),0e0h		;b924   ; fuera
	ret			;b926
actor_sin_sprites:
	call 08100h		;b927   ; en_esta_sala: Z si el actor esta en la sala de ahora (fila y columna)
	jr nz,actor_nz		;b92a   ; en otra sala, nada
	call 081bfh		;b92c   ; pintado
actor_nz:
	or a			;b92f
	ret			;b930
actor_toca_d500:		; con la alerta y el actor IX antes de 0xD300: acarreo si alguna ficha de 0xD500 activa en el paso 2 lo toca (p14:B967 por su tipo)
	push ix		;b931
	pop hl			;b933
	ld de,0d300h		;b934   ; desde 0xD300, nada
	call 00020h		;b937   ; BIOS DCOMPR - Compares HL with DE
	ccf			;b93a
	ret nc			;b93b
	ld a,(0ca5fh)		;b93c   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	and a			;b93f
	ret z			;b940   ; sin alerta, nada
	ld iy,0d500h		;b941   ; las 8 fichas de 0xD500
	ld b,008h		;b945
ficha_d500_toca:
	ld a,(iy+000h)		;b947
	and a			;b94a
	jr z,siguiente_d500		;b94b   ; libre, nada
	ld a,(iy+001h)		;b94d   ; el paso 2?
	cp 002h		;b950
	jr nz,siguiente_d500		;b952
	ld d,(iy+003h)		;b954   ; su X...
	ld e,(iy+002h)		;b957   ; ...y su Y
	call d500_contra_actor		;b95a   ; d500_contra_actor: por la forma del tipo (p14:B97C): 0 su caja (byte 7 de alto, 8 de ancho; menos de 8 y 0x20), 1 por encima (menos de 8 desde Y + 4), 2 y 3 por debajo y a un lado
	ret c			;b95d   ; toca: acarreo
siguiente_d500:		; la siguiente (16 bytes)
	ld de,00010h		;b95e
	add iy,de		;b961
	djnz ficha_d500_toca		;b963
	or a			;b965   ; ninguna
	ret			;b966
d500_contra_actor:		; por la forma del tipo (p14:B97C): 0 su caja (byte 7 de alto, 8 de ancho; menos de 8 y 0x20), 1 por encima (menos de 8 desde Y + 4), 2 y 3 por debajo y a un lado
	ld a,(iy+000h)		;b967
	ld hl,0b97bh		;b96a   ; la forma de p14:B97C
	call 0423eh		;b96d   ; suma_a_hl: HL = HL + A
	ld a,(hl)			;b970
	call 0424dh		;b971   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_B974: 4 destinos del despachador p00:424D (call en p14:B971, el
;   indice en A): B991, B9A5, B9B2, B9C6; lo leen p14:B971 (8 bytes)
;   0xb974..0xb97c  (8 bytes)
DATA_tabla_B974:
	defw 0b991h,0b9a5h,0b9b2h,0b9c6h	; b974  -> d500_caja d500_encima d500_debajo d500_debajo_izquierda

; ----------------------------------------------------------------------
; DATOS forma_por_tipo_B97C: la forma de los tipos de puerta 1-0x15 (0xD500)
;   que lee p14:B96A (0xB97B + el tipo): el indice del despachador de p14:B971
;   0xb97c..0xb991  (21 bytes)
DATA_forma_por_tipo_B97C:
	defb 000h,001h,002h,003h,000h,001h,000h,001h,000h,000h,000h,000h,000h,001h,001h,001h	; b97c  ................
	defb 000h,000h,000h,001h,000h	; b98c

; ======================================================================
; CODIGO 0xb991..0xbd35  (932 bytes)
; ======================================================================


d500_caja:		; la Y + su alto - la del actor...
	ld a,e			;b991
	add a,(iy+007h)		;b992
	sub (ix+003h)		;b995
	cp 008h		;b998   ; ...menos de 8
	ret nc			;b99a
d500_caja_x:		; la X + su ancho - la del actor...
	ld a,d			;b99b
	add a,(iy+008h)		;b99c
	sub (ix+005h)		;b99f
	cp 020h		;b9a2   ; ...menos de 0x20
	ret			;b9a4
d500_encima:		; la Y + 4...
	ld a,e			;b9a5
	add a,004h		;b9a6
	sub (ix+003h)		;b9a8
	neg		;b9ab
	cp 008h		;b9ad   ; ...a menos de 8
	ret nc			;b9af
	jr d500_caja_x		;b9b0
d500_debajo:		; la Y + 0x18...
	ld a,e			;b9b2
	add a,018h		;b9b3
	sub (ix+003h)		;b9b5
	neg		;b9b8
	cp 020h		;b9ba   ; ...a menos de 0x20
	ret nc			;b9bc
	ld a,d			;b9bd   ; la X...
	sub (ix+005h)		;b9be
	neg		;b9c1
	cp 00ch		;b9c3   ; ...a menos de 0x0C
	ret			;b9c5
d500_debajo_izquierda:		; la Y + 0x18...
	ld a,e			;b9c6
	add a,018h		;b9c7
	sub (ix+003h)		;b9c9
	neg		;b9cc
	cp 020h		;b9ce   ; ...a menos de 0x20
	ret nc			;b9d0
	ld a,d			;b9d1   ; la X - 0x0C...
	sub 00ch		;b9d2
	sub (ix+005h)		;b9d4
	neg		;b9d7
	cp 00ch		;b9d9   ; ...a menos de 0x0C
	ret			;b9db
se_ve_el_actor:		; acarreo si el actor IX no es de aqui: su byte 0x1B ha de ser 1 en una sala especial, 2 en un sitio de 0xCBE0, 3 con 0xCA77 y 0 si no; el 9 en las especiales (salvo la 0x18), nunca
	ld a,(0ca76h)		;b9dc   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	ld b,a			;b9df
	cp 018h		;b9e0   ; la 0x18...
	jr z,se_ve_por_1b		;b9e2
	and a			;b9e4   ; ...o ninguna, aparte
	jr z,se_ve_por_1b		;b9e5
	ld a,(ix+000h)		;b9e7   ; el 9...
	and 07fh		;b9ea
	cp 009h		;b9ec
	jr z,no_se_ve		;b9ee   ; ...no
se_ve_por_1b:
	ld a,b			;b9f0
	and a			;b9f1
	ld c,001h		;b9f2   ; en una especial, 1
	jr nz,compara_1b		;b9f4
	ld a,(0ca65h)		;b9f6   ; lee el sitio de 0xCBE0 en el que esta Snake (0 = ninguno)
	and a			;b9f9
	ld c,002h		;b9fa   ; en un sitio, 2
	jr nz,compara_1b		;b9fc
	ld a,(0ca77h)		;b9fe
	and a			;ba01
	ld c,003h		;ba02   ; con 0xCA77, 3
	jr nz,compara_1b		;ba04
	ld a,(ix+01bh)		;ba06   ; si no, el byte 0x1B a 0
	and a			;ba09
	ret z			;ba0a
	scf			;ba0b   ; no: acarreo
	ret			;ba0c
compara_1b:		; el byte 0x1B = C?
	ld a,(ix+01bh)		;ba0d
	sub c			;ba10
	jr z,si_se_ve		;ba11
no_se_ve:
	scf			;ba13
	ret			;ba14
si_se_ve:
	or a			;ba15
	ret			;ba16
suelta_lista_de_sprites:		; cada sprite de la lista DE (hasta 0 o 18): fuera en 0xDC28, libre en 0xD400 y a 0 en la lista
	ld b,012h		;ba17
L_BA19:
	ld a,(de)			;ba19
	and a			;ba1a   ; 0: se acaba
	ret z			;ba1b
	dec a			;ba1c
	ld c,a			;ba1d
	add a,a			;ba1e   ; * 4...
	add a,a			;ba1f
	ld hl,0dc28h		;ba20   ; ...desde 0xDC28
	call 0423eh		;ba23   ; suma_a_hl: HL = HL + A
	ld (hl),0e0h		;ba26   ; fuera
	ld hl,0d400h		;ba28   ; en 0xD400...
	ld a,c			;ba2b
	call 0423eh		;ba2c   ; suma_a_hl: HL = HL + A
	xor a			;ba2f
	ld (hl),a			;ba30   ; ...libre
	ld (de),a			;ba31   ; a 0 en la lista
	inc de			;ba32
	djnz L_BA19		;ba33
	ret			;ba35
mueve_por_a:		; por los bits de A: el 0 la Y (bytes 2-3) + la velocidad en Y (6-7); el 1 la X (4-5) + la de X (8-9)
	rra			;ba36
	jr nc,mueve_en_x_por_a		;ba37   ; el bit 0...
	ld l,(ix+002h)		;ba39   ; ...la Y...
	ld h,(ix+003h)		;ba3c
	ld e,(ix+006h)		;ba3f   ; ...+ su velocidad
	ld d,(ix+007h)		;ba42
	add hl,de			;ba45
	ld (ix+002h),l		;ba46
	ld (ix+003h),h		;ba49
mueve_en_x_por_a:		; el bit 1...
	rra			;ba4c
	ret nc			;ba4d
	ld l,(ix+004h)		;ba4e   ; ...la X...
	ld h,(ix+005h)		;ba51
	ld e,(ix+008h)		;ba54   ; ...+ su velocidad
	ld d,(ix+009h)		;ba57
	add hl,de			;ba5a
	ld (ix+004h),l		;ba5b
	ld (ix+005h),h		;ba5e
	ret			;ba61
especial_2_caf6:		; en la especial 2, por 0xCAF6: el 1 espera 0xCAF7, luego 0xB4 cuadros mas y la orden 0xF4 al sonido; el 2 espera y luego 0xD443 = 1 y el sonido 0x82
	ld a,(0ca76h)		;ba62   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 002h		;ba65
	ret nz			;ba67   ; fuera de la 2, nada
	ld hl,0caf6h		;ba68
	ld a,(hl)			;ba6b
	and a			;ba6c
	ret z			;ba6d   ; sin 0xCAF6, nada
	dec a			;ba6e
	jr z,caf6_1		;ba6f   ; el 1...
	dec a			;ba71
	jr z,caf6_2		;ba72   ; ...el 2
	ret			;ba74
caf6_1:
	call caf7_a_cero		;ba75   ; caf7_a_cero: Z con 0xCAF7-0xCAF8 a 0
	ret nz			;ba78   ; aun no
	inc (hl)			;ba79   ; el 2
	ld bc,000b4h		;ba7a   ; 0xB4 cuadros
	ld (0caf7h),bc		;ba7d   ; guarda otra espera de 16 bits que baja en la interrupcion
	jp 06be4h		;ba81   ; orden_sonido_f4: la orden 0xF4 al sonido
caf6_2:
	call caf7_a_cero		;ba84   ; caf7_a_cero: Z con 0xCAF7-0xCAF8 a 0
	ret nz			;ba87   ; aun no
	ld a,001h		;ba88   ; 0xD443 = 1
	ld (0d443h),a		;ba8a
	inc (hl)			;ba8d   ; el 3
	jp 06abfh		;ba8e   ; sonido_82: pide el sonido 0x82 (de los que tienen la partitura en un banco de musica, p16:4CE3) (antes, L_6CDA)
caf7_a_cero:		; Z con 0xCAF7-0xCAF8 a 0
	ld bc,(0caf7h)		;ba91   ; lee otra espera de 16 bits que baja en la interrupcion
	ld a,b			;ba95
	or c			;ba96
	ret			;ba97
letras_de_la_partida:		; la opcion 0, guardando: 0xE900 y 0xC7C0 a cero, la clave 0xC7C1 de los cuadros, la partida de 0xC700 en rachas en 0xC804 (p14:BE57), su largo + 1 en 0xC7C0, la suma (p14:BB33) en 0xC7C2, la cabecera [clave][suma][largo] en 0xC800, todo cifrado (p14:BB1D), pasado a bits en 0xE900 y de 6 en 6 a 0xC900 (0xFF al final), y pintado (p14:BC7F)
	ld hl,0e900h		;ba98   ; apunta a los caracteres de un dibujo pasados a 4 bits; de paso, una paleta (p14:A5C5) o las letras en bits (p14:BD54)
	ld bc,004ffh		;ba9b   ; 0x500 bytes
	call 04236h		;ba9e   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	ld hl,0c7c0h		;baa1
	ld bc,0023fh		;baa4   ; 0x240 bytes
	call 04236h		;baa7   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	ld a,(0ca03h)		;baaa   ; la clave...
	ld (0c7c1h),a		;baad   ; ...de los cuadros
	call rachas_de_c700		;bab0   ; en rachas
	ld hl,(0d8e5h)		;bab3   ; el final...
	ld de,0c804h		;bab6   ; ...- 0xC804...
	or a			;bab9
	sbc hl,de		;baba
	ld a,l			;babc
	inc a			;babd   ; ...+ 1
	ld (0c7c0h),a		;babe
	call suma_de_la_partida		;bac1   ; la suma
	ld hl,0c800h		;bac4   ; la cabecera...
	ld a,(0c7c1h)		;bac7   ; ...la clave...
	ld (hl),a			;baca
	inc hl			;bacb
	ld de,(0c7c2h)		;bacc   ; ...la suma...
	ld (hl),d			;bad0
	inc hl			;bad1
	ld (hl),e			;bad2
	inc hl			;bad3
	ld a,(0c7c0h)		;bad4   ; ...el largo
	ld (hl),a			;bad7
	call cifra		;bad8   ; cifrada
	ld a,(0c7c0h)		;badb   ; el largo + 4
	add a,004h		;bade
	ld c,a			;bae0
	ld de,0c800h		;bae1   ; de 0xC800...
	ld hl,0e900h		;bae4   ; ...a bits en 0xE900
byte_a_bits:		; 8 bits
	ld b,008h		;bae7
	ld a,(de)			;bae9
bit_a_byte:		; el de la izquierda...
	rl a		;baea
	rl (hl)		;baec   ; ...a un byte
	inc hl			;baee
	djnz bit_a_byte		;baef
	inc de			;baf1   ; el siguiente
	dec c			;baf2
	jr nz,byte_a_bits		;baf3
	ld (hl),0ffh		;baf5   ; el final
	ld de,0e900h		;baf7   ; de 0xE900...
	ld hl,0c900h		;bafa   ; ...de 6 en 6 a 0xC900
seis_bits:		; 6 bits
	ld b,006h		;bafd
un_bit:
	ld a,(de)			;baff
	inc a			;bb00   ; 0xFF: se acaba
	jr z,bits_acaban		;bb01
	ld a,(de)			;bb03
	rra			;bb04   ; el bit...
	rl (hl)		;bb05   ; ...entra por la derecha
	inc de			;bb07
	djnz un_bit		;bb08
	inc hl			;bb0a   ; el siguiente
	jr seis_bits		;bb0b
bits_acaban:		; a medias...
	ld a,b			;bb0d
	cp 006h		;bb0e
	jr z,letras_final		;bb10
rellena_bits:		; ...con ceros
	or a			;bb12
	rl (hl)		;bb13
	djnz rellena_bits		;bb15
	inc hl			;bb17
letras_final:		; 0xFF y pintadas
	ld (hl),0ffh		;bb18
	jp pinta_letras		;bb1a   ; pinta_letras: las letras de 0xC900 (hasta 0xFF) desde (0x12, 0x3C): de 4 en 4 con 9 (0x0D entre grupos), 16 por fila, 0x0C mas abajo
cifra:		; los 0xC7C0 bytes desde 0xC804: cada uno + la clave + su numero * 8 (contando hacia atras)
	ld hl,0c804h		;bb1d
	ld a,(0c7c0h)		;bb20
	ld b,a			;bb23
L_BB24:
	ld a,b			;bb24
	add a,a			;bb25   ; su numero * 8...
	add a,a			;bb26
	add a,a			;bb27
	ld c,a			;bb28
	ld a,(0c7c1h)		;bb29   ; ...+ la clave...
	add a,c			;bb2c
	add a,(hl)			;bb2d   ; ...+ el byte
	ld (hl),a			;bb2e
	inc hl			;bb2f
	djnz L_BB24		;bb30
	ret			;bb32
suma_de_la_partida:		; la suma (p14:BB3A) en 0xC7C2-0xC7C3
	call suma_c804		;bb33   ; suma_c804: HL = dos sumas de los 0xC7C0 bytes de 0xC804: H (todos y los de 2 en 2) y L (los de 3 en 3 y de 4 en 4)
	ld (0c7c2h),hl		;bb36
	ret			;bb39
suma_c804:		; HL = dos sumas de los 0xC7C0 bytes de 0xC804: H (todos y los de 2 en 2) y L (los de 3 en 3 y de 4 en 4)
	ld hl,0c804h		;bb3a
	ld a,(0c7c0h)		;bb3d
	ld b,a			;bb40
	push hl			;bb41
	push bc			;bb42
	xor a			;bb43   ; suma de todos
suma_todos:
	add a,(hl)			;bb44   ; + el byte
	inc hl			;bb45
	djnz suma_todos		;bb46   ; los 0xC7C0
	pop bc			;bb48   ; otra vez desde el principio
	pop hl			;bb49
	push hl			;bb4a
	push bc			;bb4b
suma_de_2:		; + los de 2 en 2
	add a,(hl)			;bb4c   ; + el byte
	inc hl			;bb4d
	dec b			;bb4e   ; se acaban?
	jr z,suma_alta		;bb4f
	inc hl			;bb51   ; se salta uno
	djnz suma_de_2		;bb52   ; de 2 en 2
suma_alta:		; la alta
	ld d,a			;bb54
	pop bc			;bb55
	pop hl			;bb56
	inc hl			;bb57   ; desde el segundo
	push hl			;bb58
	push bc			;bb59
	xor a			;bb5a
suma_de_3:		; los de 3 en 3
	add a,(hl)			;bb5b   ; + el byte
	inc hl			;bb5c
	dec b			;bb5d   ; se acaban?
	jr z,suma_de_4_desde		;bb5e
	inc hl			;bb60   ; se saltan dos
	dec b			;bb61
	jr z,suma_de_4_desde		;bb62
	inc hl			;bb64
	djnz suma_de_3		;bb65   ; de 3 en 3
suma_de_4_desde:
	pop bc			;bb67   ; otra vez desde el segundo
	pop hl			;bb68
suma_de_4:		; + los de 4 en 4
	add a,(hl)			;bb69   ; + el byte
	inc hl			;bb6a
	dec b			;bb6b   ; se acaban?
	jr z,suma_baja		;bb6c
	inc hl			;bb6e   ; se saltan tres
	dec b			;bb6f
	jr z,suma_baja		;bb70
	inc hl			;bb72
	dec b			;bb73
	jr z,suma_baja		;bb74
	inc hl			;bb76
	djnz suma_de_4		;bb77   ; de 4 en 4
suma_baja:		; la baja
	ld e,a			;bb79   ; H = la alta, L = la baja
	ex de,hl			;bb7a
	ret			;bb7b
cursor_arriba:		; el cursor 0x10 menos (de 0 pasa a 0xA0 y siguientes)
	ld a,(hl)			;bb7c
	sub 010h		;bb7d
	jr nc,pon_cursor		;bb7f
	add a,0b0h		;bb81
	jr pon_cursor		;bb83
cursor_abajo:		; el cursor 0x10 mas (desde 0xB0, vuelve arriba)
	ld a,(hl)			;bb85   ; el cursor...
	add a,010h		;bb86   ; ...una fila mas
	cp 0b0h		;bb88   ; hasta 0xB0...
	jr c,pon_cursor		;bb8a
	sub 0b0h		;bb8c   ; ...y luego arriba
	jr pon_cursor		;bb8e
cursor_izquierda:		; el cursor uno menos en su fila de 16
	ld a,(hl)			;bb90   ; el cursor...
	ld c,a			;bb91
	and 0f0h		;bb92   ; ...su fila...
	ld b,a			;bb94
	ld a,c			;bb95
	dec a			;bb96   ; ...y la columna uno menos (de 0 a 15)
	and 00fh		;bb97
	or b			;bb99   ; con la fila
	jr pon_cursor		;bb9a
cursor_derecha:		; el cursor uno mas en su fila de 16
	ld a,(hl)			;bb9c   ; el cursor...
	ld c,a			;bb9d
	and 0f0h		;bb9e   ; ...su fila...
	ld b,a			;bba0
	ld a,c			;bba1
	inc a			;bba2   ; ...y la columna uno mas (de 15 a 0)
	and 00fh		;bba3
	or b			;bba5   ; con la fila
pon_cursor:
	ld (hl),a			;bba6
rejilla_de_letras:		; 11 rayas de 0x9C de color 9 desde (0x12, 0x44), cada 0x0C mas abajo, y la de 8 de color 0x0A bajo la letra del cursor 0xC7C4 (p14:BBCE)
	ld d,00bh		;bba7
	ld hl,01244h		;bba9   ; desde (0x12, 0x44)
	ld bc,09c09h		;bbac   ; 0x9C de largo, color 9
raya_de_rejilla:
	ld a,(0ca42h)		;bbaf   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	call 046e6h		;bbb2   ; linea_horizontal_guarda: p00:467C guardando AF, HL, DE y BC
	ld a,l			;bbb5   ; 0x0C mas abajo
	add a,00ch		;bbb6
	ld l,a			;bbb8
	dec d			;bbb9
	jr nz,raya_de_rejilla		;bbba
	ld de,04412h		;bbbc   ; el sitio del cursor
	ld a,(0c7c4h)		;bbbf
	call sitio_de_letra_c7c4		;bbc2   ; sitio_de_letra_c7c4: HL = el sitio en pantalla de la letra A: Y = D + (A / 16) * 12; X = E + (A & 3) * 9 + ((A & 0x0C) / 4) * 0x2A
	ld bc,0080ah		;bbc5   ; 8 de largo, color 0x0A
	ld a,(0ca42h)		;bbc8   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	jp 0467ch		;bbcb   ; linea_horizontal: orden LINE del VDP (R#36-R#46) con el lado largo en X
sitio_de_letra_c7c4:		; HL = el sitio en pantalla de la letra A: Y = D + (A / 16) * 12; X = E + (A & 3) * 9 + ((A & 0x0C) / 4) * 0x2A
	ld c,a			;bbce
	and 0f0h		;bbcf   ; la fila...
	rrca			;bbd1
	ld b,a			;bbd2
	rrca			;bbd3   ; ...* 12
	add a,b			;bbd4
	add a,d			;bbd5
	ld l,a			;bbd6
	ld a,c			;bbd7
	and 003h		;bbd8   ; A & 3...
	ld b,a			;bbda
	add a,a			;bbdb   ; ...* 9
	add a,a			;bbdc
	add a,a			;bbdd
	add a,b			;bbde
	ld b,a			;bbdf
	ld a,c			;bbe0
	and 00ch		;bbe1   ; el grupo de 4...
	add a,a			;bbe3   ; ...* 0x2A
	ld c,a			;bbe4
	add a,a			;bbe5
	add a,a			;bbe6
	add a,c			;bbe7
	add a,b			;bbe8
	add a,e			;bbe9
	ld h,a			;bbea
	ret			;bbeb
letras_cada_cuadro:		; la opcion 0, cargando: las direcciones mueven el cursor 0xC7C4; el disparo pone 0x78; con la tecla de funcion del bit 5, la comprobacion (p14:BCD3); con una tecla (p14:BDC1), su letra en el cursor (0xFF: borra la de antes, con los signos 5-0x13 y 0x19-0x1D pasados a 0x53-0x61 y 0x62-0x66) y el cursor siguiente; se pinta
	ld hl,0c7c4h		;bbec
	ld a,(0ca07h)		;bbef   ; lee lo recien pulsado del mando (los bits de 0xCA08 que no estaban)
	rra			;bbf2   ; arriba...
	jr c,cursor_arriba		;bbf3
	rra			;bbf5   ; ...abajo...
	jr c,cursor_abajo		;bbf6
	rra			;bbf8   ; ...izquierda...
	jr c,cursor_izquierda		;bbf9
	rra			;bbfb   ; ...derecha...
	jr c,cursor_derecha		;bbfc
	rra			;bbfe   ; ...el disparo
	jr c,letra_78		;bbff
	ld a,(0ca09h)		;bc01   ; la tecla de funcion...
	and 020h		;bc04   ; ...del bit 5
	jp nz,comprueba_letras		;bc06   ; comprueba_letras: con menos de 4 letras, mal; si no, las de 0x40 o mas se quitan, de 6 bits a 0xC800 (p14:BD54), sin cifrar (p14:BD90) y la suma (p14:BDB7): bien, 0xC3A1 = 1 y las rachas de 0xC804 a 0xC700; mal, el sonido 0x3F, 0xC3A1 = 2, un recuadro y el letrero de p14:BD35
	call tecla_pulsada		;bc09   ; una tecla
	and a			;bc0c
	ret z			;bc0d   ; ninguna, nada
	ld hl,0c7c4h		;bc0e
	ld de,0c900h		;bc11
	ld b,a			;bc14
	inc a			;bc15   ; 0xFF: la de antes
	jr nz,pon_letra		;bc16
	ld a,(hl)			;bc18   ; el cursor - 1...
	dec a			;bc19
	cp 0ffh		;bc1a
	jr nz,letra_de_antes		;bc1c
	ld a,0afh		;bc1e   ; ...o 0xAF
letra_de_antes:
	call 04243h		;bc20   ; suma_a_de: DE = DE + A
	ld a,(de)			;bc23   ; la de antes
	ld c,a			;bc24
	sub 005h		;bc25   ; 5-0x13...
	cp 00fh		;bc27
	jr nc,letra_19_1d		;bc29
	ld a,04eh		;bc2b   ; ...+ 0x4E
	jr letra_cambiada		;bc2d
letra_19_1d:
	ld a,c			;bc2f
	sub 019h		;bc30   ; 0x19-0x1D...
	cp 005h		;bc32
	ret nc			;bc34   ; ...si no, nada
	ld a,049h		;bc35   ; + 0x49
letra_cambiada:
	add a,c			;bc37
	ld b,a			;bc38
	dec (hl)			;bc39   ; el cursor atras
	ld a,(hl)			;bc3a
	cp 0ffh		;bc3b
	jr nz,pon_letra		;bc3d
	ld (hl),0afh		;bc3f   ; 0xAF
	jr pon_letra		;bc41
letra_78:		; la letra 0x78
	ld b,078h		;bc43
pon_letra:
	ld a,(hl)			;bc45
	push af			;bc46
	inc (hl)			;bc47   ; el cursor siguiente...
	ld a,(hl)			;bc48
	cp 0b0h		;bc49   ; ...hasta 0xAF
	jr c,L_BC4F		;bc4b
	ld (hl),000h		;bc4d
L_BC4F:
	pop af			;bc4f
	ld hl,0c900h		;bc50   ; en 0xC900
	call 0423eh		;bc53   ; suma_a_hl: HL = HL + A
	ld a,b			;bc56
	cp 051h		;bc57   ; desde 0x51...
	jr c,letra_menos_25		;bc59
	sub 002h		;bc5b   ; ...2 menos
letra_menos_25:		; - 0x25
	sub 025h		;bc5d
	ld (hl),a			;bc5f
	call rejilla_de_letras		;bc60   ; la rejilla
	ld de,03c12h		;bc63   ; en X = 0x12, Y = 0x3C...
	ld a,(0c7c4h)		;bc66   ; ...la del cursor - 1
	dec a			;bc69
	cp 0ffh		;bc6a
	jr nz,pinta_letra_cursor		;bc6c
	ld a,0afh		;bc6e
pinta_letra_cursor:
	push af			;bc70
	call sitio_de_letra_c7c4		;bc71   ; sitio_de_letra_c7c4: HL = el sitio en pantalla de la letra A: Y = D + (A / 16) * 12; X = E + (A & 3) * 9 + ((A & 0x0C) / 4) * 0x2A
	ex de,hl			;bc74
	pop af			;bc75
	ld hl,0c900h		;bc76
	call 0423eh		;bc79   ; suma_a_hl: HL = HL + A
	jp letra_c900		;bc7c   ; letra_c900: borra el sitio (8 x 8 de (0x50, 0x60), operacion 0xC0 o 0xD0) y pinta la letra (HL) + 0x25 (desde 0x51, 2 mas) de la pagina 3
pinta_letras:		; las letras de 0xC900 (hasta 0xFF) desde (0x12, 0x3C): de 4 en 4 con 9 (0x0D entre grupos), 16 por fila, 0x0C mas abajo
	ld hl,0c900h		;bc7f
	ld c,000h		;bc82
	ld de,0123ch		;bc84   ; en (0x12, 0x3C)
pinta_una_letra:
	ld a,(hl)			;bc87
	inc a			;bc88   ; 0xFF: se acaba
	ret z			;bc89
	push bc			;bc8a
	push de			;bc8b
	push hl			;bc8c
	call letra_c900		;bc8d   ; la letra
	pop hl			;bc90
	pop de			;bc91
	pop bc			;bc92
	inc c			;bc93
	ld a,c			;bc94
	cp 010h		;bc95   ; 16 por fila
	jr nc,otra_fila_de_letras		;bc97
	and 003h		;bc99   ; cada 4...
	ld a,009h		;bc9b   ; ...9...
	jr nz,avanza_letra		;bc9d
	ld a,00dh		;bc9f   ; ...o 0x0D
avanza_letra:
	add a,d			;bca1
	ld d,a			;bca2
	jr siguiente_letra_c900		;bca3
otra_fila_de_letras:
	ld c,000h		;bca5
	ld d,012h		;bca7   ; desde X = 0x12...
	ld a,e			;bca9   ; ...0x0C mas abajo
	add a,00ch		;bcaa
	ld e,a			;bcac
siguiente_letra_c900:
	inc hl			;bcad
	jr pinta_una_letra		;bcae
letra_c900:		; borra el sitio (8 x 8 de (0x50, 0x60), operacion 0xC0 o 0xD0) y pinta la letra (HL) + 0x25 (desde 0x51, 2 mas) de la pagina 3
	push hl			;bcb0
	push de			;bcb1
	ld hl,05060h		;bcb2   ; de (0x50, 0x60)...
	ld bc,00808h		;bcb5   ; ...8 x 8
	ld a,(0ca42h)		;bcb8   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	and a			;bcbb
	ld a,0c0h		;bcbc   ; 0xC0...
	jr z,L_BCC2		;bcbe
	ld a,0d0h		;bcc0   ; ...o 0xD0
L_BCC2:
	call 047edh		;bcc2   ; copia_rectangulo_logica: orden LMMM del VDP con la operacion logica de A
	pop de			;bcc5
	pop hl			;bcc6
	ld a,(hl)			;bcc7   ; la letra + 0x25
	add a,025h		;bcc8
	cp 051h		;bcca   ; desde 0x51...
	jr c,pinta_letra_c900		;bccc
	add a,002h		;bcce   ; ...2 mas
pinta_letra_c900:
	jp 049c1h		;bcd0   ; letra_transparente: la letra A de la pagina 3, con el 0 transparente, a la pagina en la que se dibuja
comprueba_letras:		; con menos de 4 letras, mal; si no, las de 0x40 o mas se quitan, de 6 bits a 0xC800 (p14:BD54), sin cifrar (p14:BD90) y la suma (p14:BDB7): bien, 0xC3A1 = 1 y las rachas de 0xC804 a 0xC700; mal, el sonido 0x3F, 0xC3A1 = 2, un recuadro y el letrero de p14:BD35
	call cuenta_letras		;bcd3   ; cuenta_letras: C = cuantas letras hay en 0xC900 (hasta 0xFF); acarreo con menos de 4
	jr c,letras_mal		;bcd6   ; menos de 4, mal
	ld de,0c900h		;bcd8   ; de 0xC900...
	ld hl,0e900h		;bcdb   ; ...a 0xE900
	ld c,000h		;bcde
copia_letra_valida:
	ld a,(de)			;bce0
	inc a			;bce1   ; 0xFF: se acaba
	jr z,letras_validas		;bce2
	ld a,(de)			;bce4
	cp 040h		;bce5   ; desde 0x40...
	jr nc,siguiente_letra_valida		;bce7   ; ...fuera
	ld (hl),a			;bce9
	inc hl			;bcea
	inc c			;bceb
siguiente_letra_valida:
	inc de			;bcec
	jr copia_letra_valida		;bced
letras_validas:
	ld (hl),0ffh		;bcef
	inc c			;bcf1
	ld b,000h		;bcf2   ; C + 1 bytes...
	ld hl,0e900h		;bcf4   ; ...de vuelta a 0xC900
	ld de,0c900h		;bcf7
	ldir		;bcfa
	ld hl,0e900h		;bcfc   ; apunta a los caracteres de un dibujo pasados a 4 bits; de paso, una paleta (p14:A5C5) o las letras en bits (p14:BD54)
	ld bc,004ffh		;bcff   ; 0x500 bytes a 0
	call 04236h		;bd02   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	call letras_a_bytes		;bd05   ; a 0xC800
	call descifra		;bd08   ; sin cifrar
	call comprueba_suma		;bd0b   ; la suma
	jr nz,letras_mal		;bd0e   ; mal
	ld a,001h		;bd10   ; bien
	ld (0c3a1h),a		;bd12   ; guarda el resultado del disco o del Game Master 2 (2 = error)
	ld de,0c804h		;bd15   ; las rachas...
	ld hl,0c700h		;bd18   ; ...a 0xC700
	jp 051e0h		;bd1b   ; rachas_a_ram: deshace las rachas de DE en HL (n < 0x80 repite, n > 0x80 copia, 0 acaba)
letras_mal:		; el sonido 0x3F
	call 05f4dh		;bd1e   ; sonido_3f: pide el sonido 0x3F
	ld a,002h		;bd21   ; mal
	ld (0c3a1h),a		;bd23   ; guarda el resultado del disco o del Game Master 2 (2 = error)
	ld hl,03074h		;bd26   ; en (0x30, 0x74)...
	ld bc,06010h		;bd29   ; ...0x60 x 0x10
	call 0603ch		;bd2c   ; pon_recuadro: un recuadro en HL (X, Y) de B x C (ancho x alto): lleno del color 0x99 y con el marco de color 7
	ld hl,0bd35h		;bd2f   ; el letrero de p14:BD35
	jp 04918h		;bd32   ; letrero_con_sitio: [fila][columna] y letras; 0xFE otra posicion, 0xFF acaba

; ----------------------------------------------------------------------
; DATOS resto_BD35: lo apuntan con el banco puesto p14:BD2F (0xBD35); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p14:BD2F (14 bytes)
;   0xbd35..0xbd43  (14 bytes)
DATA_resto_BD35:
	defb 034h,078h,0c3h,08ch,0abh,0ebh,0bch,053h,035h,053h,026h,043h,031h,0ffh	; bd35  4x.....S5S&C1.

; ======================================================================
; CODIGO 0xbd43..0xbdf7  (180 bytes)
; ======================================================================


cuenta_letras:		; C = cuantas letras hay en 0xC900 (hasta 0xFF); acarreo con menos de 4
	ld hl,0c900h		;bd43
	ld c,000h		;bd46
cuenta_letra:
	ld a,(hl)			;bd48   ; la letra...
	inc a			;bd49   ; ...0xFF: se acaba
	jr z,cuantas_letras		;bd4a
	inc hl			;bd4c
	inc c			;bd4d   ; una mas
	jr cuenta_letra		;bd4e
cuantas_letras:
	ld a,c			;bd50
	cp 004h		;bd51
	ret			;bd53
letras_a_bytes:		; las letras de 0xC900 de 6 bits a bits en 0xE900 (0xFF al final) y de 8 en 8 a 0xC800
	ld de,0c900h		;bd54
	ld hl,0e900h		;bd57   ; apunta a los caracteres de un dibujo pasados a 4 bits; de paso, una paleta (p14:A5C5) o las letras en bits (p14:BD54)
	ld c,000h		;bd5a
letra_a_bits:
	ld a,(de)			;bd5c
	inc a			;bd5d   ; 0xFF: se acaba
	jr z,bits_a_bytes		;bd5e
	ld a,(de)			;bd60
	rla			;bd61   ; sin los 2 de arriba
	rla			;bd62
	ld b,006h		;bd63   ; 6 bits
bit_de_letra:
	rla			;bd65   ; el bit de arriba...
	rl (hl)		;bd66   ; ...a un byte de 0xE900
	inc hl			;bd68   ; un byte por bit
	djnz bit_de_letra		;bd69   ; 6
	inc de			;bd6b   ; la letra siguiente
	jr letra_a_bits		;bd6c
bits_a_bytes:		; el final
	ld (hl),0ffh		;bd6e
	ld de,0e900h		;bd70   ; de 0xE900...
	ld hl,0c800h		;bd73   ; ...a 0xC800
ocho_bits:		; 8 bits
	ld b,008h		;bd76
bit_a_byte_b:
	ld a,(de)			;bd78
	inc a			;bd79   ; 0xFF: se acaba
	jr z,bits_a_medias		;bd7a
	ld a,(de)			;bd7c
	rra			;bd7d   ; el bit...
	rl (hl)		;bd7e   ; ...entra
	inc de			;bd80
	djnz bit_a_byte_b		;bd81
	inc hl			;bd83
	jr ocho_bits		;bd84
bits_a_medias:
	ld a,b			;bd86
	cp 008h		;bd87   ; entero, nada
	ret z			;bd89
rellena_byte:
	or a			;bd8a
	rl (hl)		;bd8b
	djnz rellena_byte		;bd8d
	ret			;bd8f
descifra:		; la cabecera de 0xC800 a 0xC7C1 (la clave), 0xC7C2 (la suma) y 0xC7C0 (el largo); cada byte siguiente - la clave - su numero * 8
	ld hl,0c800h		;bd90
	ld a,(hl)			;bd93   ; la clave
	ld (0c7c1h),a		;bd94
	inc hl			;bd97
	ld d,(hl)			;bd98   ; la suma
	inc hl			;bd99
	ld e,(hl)			;bd9a
	ld (0c7c2h),de		;bd9b
	inc hl			;bd9f
	ld a,(hl)			;bda0   ; el largo
	ld (0c7c0h),a		;bda1
	inc hl			;bda4
	ld b,a			;bda5
descifra_byte:		; su numero * 8...
	ld a,b			;bda6
	add a,a			;bda7
	add a,a			;bda8
	add a,a			;bda9
	ld c,a			;bdaa
	ld a,(0c7c1h)		;bdab   ; ...+ la clave...
	add a,c			;bdae
	ld c,a			;bdaf
	ld a,(hl)			;bdb0   ; ...menos
	sub c			;bdb1
	ld (hl),a			;bdb2
	inc hl			;bdb3
	djnz descifra_byte		;bdb4
	ret			;bdb6
comprueba_suma:		; Z si la suma de 0xC804 es la de 0xC7C2
	call suma_c804		;bdb7   ; suma_c804: HL = dos sumas de los 0xC7C0 bytes de 0xC804: H (todos y los de 2 en 2) y L (los de 3 en 3 y de 4 en 4)
	ld de,(0c7c2h)		;bdba
	jp 00020h		;bdbe   ; BIOS DCOMPR - Compares HL with DE
tecla_pulsada:		; A = la letra de la primera tecla recien pulsada de las 6 filas de 0xC7E0, de la tabla de p14:BE27 (con 0xFCAD, p14:BDF7); 0 si ninguna
	ld hl,0c7e0h		;bdc1   ; apunta a lo recien pulsado de esas 6 filas
	ld bc,00600h		;bdc4   ; 6 filas
fila_pulsada:
	ld a,(hl)			;bdc7
	and a			;bdc8   ; alguna?
	jr nz,tecla_de_fila		;bdc9
	inc hl			;bdcb
	inc c			;bdcc   ; la fila
	djnz fila_pulsada		;bdcd
	xor a			;bdcf   ; ninguna
	ret			;bdd0
tecla_de_fila:
	ld b,a			;bdd1
	ld a,(0fcadh)		;bdd2   ; 0xFCAD...
	and a			;bdd5
	ld hl,0be27h		;bdd6   ; ...p14:BE27...
	jr z,fila_de_tabla		;bdd9
	ld hl,0bdf7h		;bddb   ; ...o p14:BDF7
fila_de_tabla:		; la fila * 8
	ld a,c			;bdde
	add a,a			;bddf
	add a,a			;bde0
	add a,a			;bde1
	call 0423eh		;bde2   ; suma_a_hl: HL = HL + A
	ld a,b			;bde5
	ld bc,00800h		;bde6   ; 8 bits
bit_de_tecla:
	rla			;bde9
	jr c,letra_de_tecla		;bdea   ; pulsada?
	inc c			;bdec
	djnz bit_de_tecla		;bded
	xor a			;bdef
	ret			;bdf0
letra_de_tecla:
	ld a,c			;bdf1
	call 0423eh		;bdf2   ; suma_a_hl: HL = HL + A
	ld a,(hl)			;bdf5
	ret			;bdf6

; ----------------------------------------------------------------------
; DATOS resto_BDF7: lo apuntan con el banco puesto p14:BDDB (0xBDF7), p13:9B64
;   (0xBE19), p14:BDD6 (0xBE27); el tamano es lo que hay hasta lo siguiente,
;   no sale de recorrerlo; lo leen p14:BDDB, p13:9B64, p14:BDD6 (96 bytes)
;   0xbdf7..0xbe57  (96 bytes)
DATA_resto_BDF7:
	defb 048h,029h,028h,027h,025h,040h,03bh,050h,04eh,000h,0ffh,000h,041h,042h,04ah,049h	; bdf7  H)('%@.PN...ABJI
	defb 02eh,035h,04fh,046h,04dh,03ch,045h,02dh,043h,03ah,02ch,02bh,03eh,026h,030h,033h	; be07  .5OFM<E-C:,+>&03
	defb 031h,034h,032h,04bh,044h,047h,04ch,03dh,036h,000h,02fh,037h,03fh,039h,02ah,038h	; be17  142KDGL=6./7?9*8
	defb 03ah,039h,029h,028h,027h,026h,025h,03dh,047h,04fh,04eh,04dh,04ch,04bh,03ch,03bh	; be27  :9)('&%=GONMLK<.
	defb 038h,02fh,000h,000h,050h,04ah,000h,0ffh,044h,040h,043h,033h,032h,02ch,031h,036h	; be37  8/..PJ..D@C32,16
	defb 02dh,02ah,042h,041h,048h,049h,046h,045h,034h,03eh,035h,02bh,037h,03fh,02eh,030h	; be47  -*BAHIFE4>5+7?.0

; ======================================================================
; CODIGO 0xbe57..0xbf93  (316 bytes)
; ======================================================================


rachas_de_c700:		; la partida de 0xC700-0xC772 en rachas desde 0xC804 (0xD8E0 el contador de la racha, 0xD8E1 su cabecera, 0xD8E3 el final, 0xD8E5 donde acaba): n >= 0x81 repite, n < 0x80 copia; el final en 0xD8E5
	ld hl,0d8e0h		;be57   ; apunta a de paso: en p00:4D5A, 1 = solo las listas 6 y 7; en p14:BE6D, la cuenta de la racha
	ld bc,00006h		;be5a   ; 7 bytes a cero
	call 04236h		;be5d   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	ld hl,0c700h		;be60   ; apunta a copia de la zona, la sala especial, la Y y la X de Snake y 0xCA50-0xCA51 (6 bytes)
	ld de,0c773h		;be63   ; el final
	ld (0d8e3h),de		;be66   ; guarda de paso (p14:BE66): el final de lo que se pasa a rachas y el byte siguiente (16 bits)
	ld de,0c804h		;be6a   ; a 0xC804
racha_nueva:		; la racha empieza: 0x81
	ld a,081h		;be6d
	ld (0d8e0h),a		;be6f   ; guarda de paso: en p00:4D5A, 1 = solo las listas 6 y 7; en p14:BE6D, la cuenta de la racha
	ld c,(hl)			;be72   ; el byte
	ld (0d8e1h),de		;be73   ; la cabecera aqui
	inc de			;be77   ; el byte despues
	ld a,c			;be78
	ld (de),a			;be79
	inc hl			;be7a
	inc de			;be7b
	call es_el_final		;be7c   ; el final?
	jp z,rachas_fin		;be7f   ; rachas_fin: el 0 del final
	ld a,c			;be82   ; el siguiente es igual?
	cp (hl)			;be83
	jr z,racha_repite		;be84
	ld a,001h		;be86   ; distintos: 1
	ld (0d8e0h),a		;be88   ; guarda de paso: en p00:4D5A, 1 = solo las listas 6 y 7; en p14:BE6D, la cuenta de la racha
racha_copia:		; el byte...
	ld c,(hl)			;be8b
	inc hl			;be8c
	ld a,c			;be8d
	ld (de),a			;be8e   ; ...copiado
	inc de			;be8f
	call es_el_final		;be90   ; el final?
	jp z,rachas_acaban		;be93   ; rachas_acaban:
	cp (hl)			;be96   ; dos iguales...
	jr nz,racha_copia_mas		;be97
	inc hl			;be99
	call es_el_final		;be9a   ; es_el_final: Z con HL en el final (0xD8E3)
	jr z,racha_ultimo		;be9d
	cp (hl)			;be9f   ; ...tres iguales?
	dec hl			;bea0
	jr nz,racha_copia_mas		;bea1
racha_corta:		; la cabecera de la copia...
	dec hl			;bea3
	dec de			;bea4
	push hl			;bea5
	ld hl,(0d8e1h)		;bea6   ; lee de paso (p14:BE73, con 0xD8E2): donde va la cabecera de la racha y el byte siguiente (16 bits)
	ld a,(0d8e0h)		;bea9   ; lee de paso: en p00:4D5A, 1 = solo las listas 6 y 7; en p14:BE6D, la cuenta de la racha
	set 7,a		;beac   ; ...con el bit 7
	ld (hl),a			;beae
	pop hl			;beaf
	ld (0d8e1h),de		;beb0   ; guarda de paso (p14:BE73, con 0xD8E2): donde va la cabecera de la racha y el byte siguiente (16 bits)
	jr racha_nueva		;beb4
racha_copia_mas:
	ld a,(0d8e0h)		;beb6   ; lee de paso: en p00:4D5A, 1 = solo las listas 6 y 7; en p14:BE6D, la cuenta de la racha
	cp 07fh		;beb9   ; hasta 0x7F
	jr z,racha_corta		;bebb
	inc a			;bebd   ; uno mas
	ld (0d8e0h),a		;bebe   ; guarda de paso: en p00:4D5A, 1 = solo las listas 6 y 7; en p14:BE6D, la cuenta de la racha
	jr racha_copia		;bec1
racha_repite:		; 2 iguales
	ld a,002h		;bec3
	ld (0d8e0h),a		;bec5   ; guarda de paso: en p00:4D5A, 1 = solo las listas 6 y 7; en p14:BE6D, la cuenta de la racha
racha_repite_mas:
	inc hl			;bec8
	call es_el_final		;bec9   ; el final?
	jr z,rachas_fin		;becc
	ld a,c			;bece
	cp (hl)			;becf   ; igual?
	jr z,racha_repite_sigue		;bed0
racha_repite_acaba:		; la cabecera...
	ld de,(0d8e1h)		;bed2   ; lee de paso (p14:BE73, con 0xD8E2): donde va la cabecera de la racha y el byte siguiente (16 bits)
	ld a,(0d8e0h)		;bed6   ; ...con la cuenta
	ld (de),a			;bed9
	inc de			;beda
	inc de			;bedb
	ld (0d8e1h),de		;bedc   ; guarda de paso (p14:BE73, con 0xD8E2): donde va la cabecera de la racha y el byte siguiente (16 bits)
	jp racha_nueva		;bee0   ; racha_nueva: la racha empieza: 0x81
racha_repite_sigue:
	ld a,(0d8e0h)		;bee3   ; lee de paso: en p00:4D5A, 1 = solo las listas 6 y 7; en p14:BE6D, la cuenta de la racha
	cp 07fh		;bee6   ; hasta 0x7F
	jr z,racha_repite_acaba		;bee8
	inc a			;beea
	ld (0d8e0h),a		;beeb   ; guarda de paso: en p00:4D5A, 1 = solo las listas 6 y 7; en p14:BE6D, la cuenta de la racha
	jr racha_repite_mas		;beee
es_el_final:		; Z con HL en el final (0xD8E3)
	push hl			;bef0   ; HL - el final
	push de			;bef1
	ld de,(0d8e3h)		;bef2   ; lee de paso (p14:BE66): el final de lo que se pasa a rachas y el byte siguiente (16 bits)
	and a			;bef6
	sbc hl,de		;bef7
	pop de			;bef9   ; Z si son iguales
	pop hl			;befa
	ret			;befb
racha_ultimo:
	dec hl			;befc
	ld a,(hl)			;befd
	ld (de),a			;befe
	inc de			;beff
	ld a,(0d8e0h)		;bf00   ; lee de paso: en p00:4D5A, 1 = solo las listas 6 y 7; en p14:BE6D, la cuenta de la racha
	inc a			;bf03
	ld (0d8e0h),a		;bf04   ; guarda de paso: en p00:4D5A, 1 = solo las listas 6 y 7; en p14:BE6D, la cuenta de la racha
rachas_acaban:
	ld a,(0d8e0h)		;bf07   ; la cuenta + 1 con el bit 7: si pasa de 0x7F (0x80)...
	inc a			;bf0a
	set 7,a		;bf0b
	cp 080h		;bf0d
	jr nz,pon_cuenta_racha		;bf0f
	ld hl,(0d8e1h)		;bf11   ; ...la copia se queda en 0x7F (cabecera 0xFF)...
	ld (hl),0ffh		;bf14
	ex de,hl			;bf16
	dec hl			;bf17   ; ...y el ultimo byte pasa a racha de 1 (0x81, byte)
	ld a,(hl)			;bf18
	ld (hl),081h		;bf19
	inc hl			;bf1b
	ld (hl),a			;bf1c
	inc hl			;bf1d
	ld (hl),000h		;bf1e   ; el 0 del final
	ex de,hl			;bf20
	ld a,081h		;bf21   ; la cuenta 0x81
	jr rachas_final		;bf23
pon_cuenta_racha:
	ld (0d8e0h),a		;bf25   ; guarda de paso: en p00:4D5A, 1 = solo las listas 6 y 7; en p14:BE6D, la cuenta de la racha
rachas_fin:		; el 0 del final
	xor a			;bf28
	ld (de),a			;bf29
	ld a,(0d8e0h)		;bf2a   ; lee de paso: en p00:4D5A, 1 = solo las listas 6 y 7; en p14:BE6D, la cuenta de la racha
	ld hl,(0d8e1h)		;bf2d   ; lee de paso (p14:BE73, con 0xD8E2): donde va la cabecera de la racha y el byte siguiente (16 bits)
	ld (hl),a			;bf30
rachas_final:		; donde acaba, en 0xD8E5
	ld (0d8e5h),de		;bf31   ; guarda de paso (p14:BF31): donde acaba la partida en rachas y el byte siguiente (16 bits)
	ret			;bf35
cosas_por_d880:		; antes de guardar, por debajo de la zona 0x12: las cosas que se dan una vez por 0xD883 (bit 6 de 0xD7F4, 0xD68C), 0xD886 (bit 5, 0xD6A0), 0xD88A en la zona 0x0B (0xD69C) y 0xD882 (bit 7, 0xD688), a 0xFF: la cosa con 1 y cuenta 1
	ld a,(0ca4ah)		;bf36   ; lee la zona
	cp 012h		;bf39   ; desde la 0x12, nada
	ret nc			;bf3b
	call cosa_por_d883		;bf3c   ; cosa_por_d883: 0xD883...
	call cosa_por_d886		;bf3f   ; cosa_por_d886: 0xD886...
	call cosa_por_d88a		;bf42   ; cosa_por_d88a: 0xD88A...
	ld a,(0d882h)		;bf45   ; 0xD882...
	cp 0ffh		;bf48
	ret nz			;bf4a
	ld hl,0d7f4h		;bf4b   ; ...el bit 7 de 0xD7F4...
	bit 7,(hl)		;bf4e
	ret nz			;bf50
	set 7,(hl)		;bf51
	ld hl,0d688h		;bf53   ; ...la cosa de 0xD688
da_la_cosa:		; la tiene y la cuenta 1
	ld a,001h		;bf56
	ld (hl),a			;bf58
	inc hl			;bf59
	ld (hl),a			;bf5a
	ret			;bf5b
cosa_por_d883:		; 0xD883...
	ld a,(0d883h)		;bf5c
	cp 0ffh		;bf5f
	ret nz			;bf61
	ld hl,0d7f4h		;bf62   ; ...el bit 6...
	bit 6,(hl)		;bf65
	ret nz			;bf67
	set 6,(hl)		;bf68
	ld hl,0d68ch		;bf6a   ; ...la de 0xD68C
	jr da_la_cosa		;bf6d
cosa_por_d886:		; 0xD886...
	ld a,(0d886h)		;bf6f
	cp 0ffh		;bf72
	ret nz			;bf74
	ld hl,0d7f4h		;bf75   ; ...el bit 5...
	bit 5,(hl)		;bf78
	ret nz			;bf7a
	set 5,(hl)		;bf7b
	ld hl,0d6a0h		;bf7d   ; ...la de 0xD6A0
	jr da_la_cosa		;bf80
cosa_por_d88a:		; 0xD88A...
	ld a,(0d88ah)		;bf82
	cp 0ffh		;bf85
	ret nz			;bf87
	ld a,(0ca4ah)		;bf88   ; ...en la zona 0x0B...
	cp 00bh		;bf8b
	ret nz			;bf8d
	ld hl,0d69ch		;bf8e   ; ...la de 0xD69C
	jr da_la_cosa		;bf91

; ----------------------------------------------------------------------
; DATOS restos_finales_BF93: 109 bytes al final del banco detras del ultimo
;   bloque que se lee (resto_BDF7): ningun lector del listado llega a ellos ni
;   los apunta ninguna tabla declarada
;   0xbf93..0xc000  (109 bytes)
DATA_restos_finales_BF93:
	defb 0e0h,028h,0f5h,0f9h,026h,080h,0fbh,004h,0e0h,050h,0f5h,0f9h,026h,080h,0fbh,007h	; bf93  .(..&....P..&...
	defb 0e0h,028h,0f5h,0f9h,026h,080h,0fbh,005h,0e0h,050h,0f5h,0f9h,026h,080h,0fbh,006h	; bfa3  .(..&....P..&...
	defb 0e0h,028h,0f5h,0f9h,026h,080h,0fbh,002h,0e0h,050h,0f5h,0f9h,026h,080h,0fbh,006h	; bfb3  .(..&....P..&...
	defb 0e0h,028h,0f5h,0f9h,026h,080h,0fbh,004h,0e0h,0c0h,0e0h,0c0h,0fdh,07eh,07fh,0feh	; bfc3  .(..&........~..
	defb 002h,0f5h,0f9h,047h,080h,0fbh,006h,0e0h,028h,0f9h,047h,080h,0e0h,050h,0f5h,0f9h	; bfd3  ...G....(.G..P..
	defb 047h,080h,0fbh,006h,0e0h,028h,0f5h,0f9h,047h,080h,0fbh,004h,0e0h,050h,0f5h,0f9h	; bfe3  G....(..G....P..
	defb 047h,080h,0fbh,007h,0e0h,028h,0f5h,0f9h,047h,080h,0fbh,005h,0e0h	; bff3  G....(..G....
