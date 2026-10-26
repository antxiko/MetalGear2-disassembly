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


L_A196:
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


L_A1A6:
	ld a,00dh		;a1a6
	ld (0cafch),a		;a1a8
	ld a,001h		;a1ab
	ld (0cafdh),a		;a1ad
	ld (0cafah),a		;a1b0
L_A1B3:
	ld hl,0cafbh		;a1b3
	inc (hl)			;a1b6
	ret			;a1b7
L_A1B8:
	ld hl,0cafdh		;a1b8
	dec (hl)			;a1bb
	ret nz			;a1bc
	ld (hl),006h		;a1bd
	ld hl,0cafch		;a1bf
	dec (hl)			;a1c2
	ld a,(hl)			;a1c3
	inc a			;a1c4
	jr z,L_A1D3		;a1c5
	ld hl,00000h		;a1c7
	ld de,01440h		;a1ca
	ld bc,0b80dh		;a1cd
	jp L_A270		;a1d0
L_A1D3:
	ld a,010h		;a1d3
	ld (0cafch),a		;a1d5
	jr L_A1B3		;a1d8
L_A1DA:
	ld hl,0cafch		;a1da
	dec (hl)			;a1dd
	ret nz			;a1de
	ld a,00dh		;a1df
	ld (0cafch),a		;a1e1
	jr L_A1B3		;a1e4
L_A1E6:
	ld hl,0cafdh		;a1e6
	dec (hl)			;a1e9
	ret nz			;a1ea
	ld (hl),006h		;a1eb
	ld hl,0cafch		;a1ed
	dec (hl)			;a1f0
	ld a,(hl)			;a1f1
	inc a			;a1f2
	jr z,L_A201		;a1f3
	ld hl,0bc00h		;a1f5
	ld de,0d040h		;a1f8
	ld bc,0180dh		;a1fb
	jp L_A270		;a1fe
L_A201:
	ld a,01ch		;a201
	ld (0cafch),a		;a203
	jr L_A1B3		;a206
L_A208:
	ld hl,0cafdh		;a208
	dec (hl)			;a20b
	ret nz			;a20c
	ld (hl),006h		;a20d
	ld hl,0cafch		;a20f
	dec (hl)			;a212
	ld a,(hl)			;a213
	inc a			;a214
	jr z,L_A223		;a215
	ld hl,0001ah		;a217
	ld de,01469h		;a21a
	ld bc,0d81ch		;a21d
	jp L_A270		;a220
L_A223:
	call 06ad6h		;a223   ; sonido_90: pide el sonido 0x90 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	call L_A22E		;a226
	xor a			;a229
	ld (0cafah),a		;a22a
	ret			;a22d
L_A22E:
	ld de,060a0h		;a22e
	ld hl,0a24eh		;a231
L_A234:
	ld a,(hl)			;a234
	inc a			;a235
	ret z			;a236
	ld a,(hl)			;a237
	inc hl			;a238
	push hl			;a239
	ld l,(hl)			;a23a
	ld h,a			;a23b
	ld bc,00808h		;a23c
	ld a,080h		;a23f
	push de			;a241
	call 047edh		;a242   ; copia_rectangulo_logica: orden LMMM del VDP con la operacion logica de A
	pop de			;a245
	pop hl			;a246
	inc hl			;a247
	ld a,(hl)			;a248
	add a,d			;a249
	ld d,a			;a24a
	inc hl			;a24b
	jr L_A234		;a24c

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


L_A270:
	push bc			;a270
	push hl			;a271
	push hl			;a272
	ld a,(0cafch)		;a273
	ld h,a			;a276
	ld a,c			;a277
	sub h			;a278
	ld (0cafeh),a		;a279
	ld c,a			;a27c
	pop hl			;a27d
	push de			;a27e
	ld a,e			;a27f
	sub c			;a280
	ld e,a			;a281
	call 0475ah		;a282   ; copia_rectangulo_a_la_otra: p00:4767 de la pagina 0xCA42 a la otra
	pop de			;a285
	pop hl			;a286
	pop bc			;a287
	ld a,c			;a288
	add a,a			;a289
	ld c,a			;a28a
	ld a,(0cafeh)		;a28b
	push af			;a28e
	neg		;a28f
	add a,c			;a291
	add a,l			;a292
	ld l,a			;a293
	pop af			;a294
	ld c,a			;a295
	jp 0475ah		;a296   ; copia_rectangulo_a_la_otra: p00:4767 de la pagina 0xCA42 a la otra
L_A299:
	ld a,(0cafbh)		;a299
	call 0424dh		;a29c   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_A29F: 4 destinos del despachador p00:424D (call en p14:A29C, el
;   indice en A): A2A7, A2AD, A2C2, A2CA; lo leen p14:A29C (8 bytes)
;   0xa29f..0xa2a7  (8 bytes)
DATA_tabla_A29F:
	defw 0a2a7h,0a2adh,0a2c2h,0a2cah	; a29f  -> L_A2A7 L_A2AD L_A2C2 L_A2CA

; ======================================================================
; CODIGO 0xa2a7..0xa2d7  (48 bytes)
; ======================================================================


L_A2A7:
	call 091f0h		;a2a7   ; paleta_9258: en 0xE900, la paleta de p13:9258 ([n][rojo-azul][verde]) y 0xFF
	jp L_A1B3		;a2aa
L_A2AD:
	ld a,(0ca03h)		;a2ad   ; lee el contador de cuadros (uno mas en cada interrupcion)
	and 001h		;a2b0
	ret nz			;a2b2
	ld de,09278h		;a2b3
	call 09175h		;a2b6   ; paleta_hacia: la paleta de 0xE900 un paso hacia la de DE (con A = 1, hacia el otro lado) y puesta; NZ mientras no sea igual
	ret nz			;a2b9
	ld a,020h		;a2ba
	ld (0cafch),a		;a2bc
	jp L_A1B3		;a2bf
L_A2C2:
	ld hl,0cafch		;a2c2
	dec (hl)			;a2c5
	ret nz			;a2c6
	jp L_A1B3		;a2c7
L_A2CA:
	xor a			;a2ca
	ld (0cafah),a		;a2cb
	ret			;a2ce
L_A2CF:
	ld a,(0ca2ch)		;a2cf   ; lee el paso de la presentacion (1-0x41; 0 se acaba, desde 0x80 p14:A2CF)
	sub 080h		;a2d2
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


L_A323:
	call L_A53C		;a323
	ld hl,0a7deh		;a326
	ld a,00ch		;a329
	ld de,02840h		;a32b
	call L_A551		;a32e
	ld d,000h		;a331
	call 04be4h		;a333   ; borra_toda_la_pagina: p00:46FF desde (0,0) con BC = 0 y A = 0 en la pagina D
	call 06c27h		;a336   ; sonido_9a: pide el sonido 0x9A (de los que tienen la partitura en un banco de musica, p16:4CE3)
	jp L_A3EA		;a339
L_A33C:
	call L_A564		;a33c
	ret c			;a33f
	call L_A645		;a340
	ld hl,000c0h		;a343
	ld (0ca2eh),hl		;a346   ; guarda la cuenta de cuadros del paso de la presentacion (16 bits)
	jp L_A3EA		;a349
L_A34C:
	call L_A65C		;a34c
	ret c			;a34f
	call L_A680		;a350
	ld hl,0a800h		;a353
	ld a,008h		;a356
	ld de,00820h		;a358
	call L_A551		;a35b
	ld de,0a766h		;a35e
	call L_A5C5		;a361
	call 04650h		;a364   ; espera_vdp: espera a que el VDP acabe la orden en curso (S#2 bit 0)
	call L_A549		;a367
	jp L_A3EA		;a36a
L_A36D:
	call L_A530		;a36d
	ret nz			;a370
	jr L_A3EA		;a371
L_A373:
	call L_A564		;a373
	jr nc,L_A384		;a376
	ld a,(0ca33h)		;a378   ; lee el sitio de la primera linea del texto de la presentacion
	cp 038h		;a37b
	ret c			;a37d
	ld de,0a766h		;a37e
	jp L_A5E7		;a381
L_A384:
	ld hl,00080h		;a384
	ld (0ca2eh),hl		;a387   ; guarda la cuenta de cuadros del paso de la presentacion (16 bits)
	call L_A645		;a38a
	jr L_A3EA		;a38d
L_A38F:
	call L_A65C		;a38f
	jr nc,L_A39D		;a392
	ld a,(0ca38h)		;a394
	cp 020h		;a397
	ret nz			;a399
	jp L_A672		;a39a
L_A39D:
	call L_A683		;a39d
	ld hl,0a847h		;a3a0
	ld a,00ch		;a3a3
	ld de,00850h		;a3a5
	call L_A551		;a3a8
	call 04650h		;a3ab   ; espera_vdp: espera a que el VDP acabe la orden en curso (S#2 bit 0)
	call L_A549		;a3ae
	jr L_A3EA		;a3b1
L_A3B3:
	call L_A64B		;a3b3
	ret c			;a3b6
	ld d,000h		;a3b7
	call 04be4h		;a3b9   ; borra_toda_la_pagina: p00:46FF desde (0,0) con BC = 0 y A = 0 en la pagina D
	ld hl,0a85dh		;a3bc
	ld a,008h		;a3bf
	ld de,03840h		;a3c1
	call L_A551		;a3c4
	call 04650h		;a3c7   ; espera_vdp: espera a que el VDP acabe la orden en curso (S#2 bit 0)
	call L_A549		;a3ca
	jr L_A3EA		;a3cd
L_A3CF:
	call L_A65C		;a3cf
	ret c			;a3d2
	call L_A6BD		;a3d3
	ld hl,0a870h		;a3d6
	ld a,008h		;a3d9
	ld de,00840h		;a3db
	call L_A551		;a3de
	ld de,0a784h		;a3e1
	call L_A5C5		;a3e4
	call L_A549		;a3e7
L_A3EA:
	ld hl,0ca2ch		;a3ea   ; apunta a el paso de la presentacion (1-0x41; 0 se acaba, desde 0x80 p14:A2CF)
	inc (hl)			;a3ed
	ret			;a3ee
L_A3EF:
	call L_A564		;a3ef
	ld de,0a784h		;a3f2
	jp c,L_A5E7		;a3f5
	ld hl,00080h		;a3f8
	ld (0ca2eh),hl		;a3fb   ; guarda la cuenta de cuadros del paso de la presentacion (16 bits)
	call L_A645		;a3fe
	jr L_A3EA		;a401
L_A403:
	call L_A65C		;a403
	jr nc,L_A411		;a406
	ld a,(0ca38h)		;a408
	cp 020h		;a40b
	ret nz			;a40d
	jp L_A6AF		;a40e
L_A411:
	call L_A6C0		;a411
	ld hl,0a895h		;a414
	ld a,008h		;a417
	ld de,00820h		;a419
	call L_A551		;a41c
	call 04650h		;a41f   ; espera_vdp: espera a que el VDP acabe la orden en curso (S#2 bit 0)
	call L_A549		;a422
	jr L_A3EA		;a425
L_A427:
	call L_A64B		;a427
	ret c			;a42a
	ld d,000h		;a42b
	call 04be4h		;a42d   ; borra_toda_la_pagina: p00:46FF desde (0,0) con BC = 0 y A = 0 en la pagina D
	ld hl,0a8eah		;a430
	ld a,00ch		;a433
	ld de,01838h		;a435
	call L_A551		;a438
	call 04650h		;a43b   ; espera_vdp: espera a que el VDP acabe la orden en curso (S#2 bit 0)
	call L_A549		;a43e
	jr L_A3EA		;a441
L_A443:
	call L_A65C		;a443
	ret c			;a446
	call L_A6FA		;a447
	ld hl,0a90ch		;a44a
	ld a,008h		;a44d
	ld de,00820h		;a44f
	call L_A551		;a452
	ld de,0a7a2h		;a455
	call L_A5C5		;a458
	call 04650h		;a45b   ; espera_vdp: espera a que el VDP acabe la orden en curso (S#2 bit 0)
	call L_A549		;a45e
	jp L_A3EA		;a461
L_A464:
	call L_A564		;a464
	ld de,0a7a2h		;a467
	jp c,L_A5E7		;a46a
	call L_A645		;a46d
	ld hl,00080h		;a470
	ld (0ca2eh),hl		;a473   ; guarda la cuenta de cuadros del paso de la presentacion (16 bits)
	jp L_A3EA		;a476
L_A479:
	call L_A65C		;a479
	jr nc,L_A487		;a47c
	ld a,(0ca38h)		;a47e
	cp 020h		;a481
	ret nz			;a483
	jp L_A6EC		;a484
L_A487:
	call L_A6FD		;a487
	ld hl,0a962h		;a48a
	ld a,008h		;a48d
	ld de,00838h		;a48f
	call L_A551		;a492
	call 04650h		;a495   ; espera_vdp: espera a que el VDP acabe la orden en curso (S#2 bit 0)
	call L_A549		;a498
	jp L_A3EA		;a49b
L_A49E:
	call L_A64B		;a49e
	ret c			;a4a1
	call L_A737		;a4a2
	ld hl,0a9a1h		;a4a5
	ld a,008h		;a4a8
	ld de,00820h		;a4aa
	call L_A551		;a4ad
	ld de,0a7c0h		;a4b0
	call L_A5C5		;a4b3
	call 04650h		;a4b6   ; espera_vdp: espera a que el VDP acabe la orden en curso (S#2 bit 0)
	call L_A549		;a4b9
	jp L_A3EA		;a4bc
L_A4BF:
	call L_A564		;a4bf
	jr nc,L_A4D0		;a4c2
	ld a,(0ca33h)		;a4c4   ; lee el sitio de la primera linea del texto de la presentacion
	cp 038h		;a4c7
	ret c			;a4c9
	ld de,0a7c0h		;a4ca
	jp L_A5E7		;a4cd
L_A4D0:
	call L_A645		;a4d0
	ld hl,00080h		;a4d3
	ld (0ca2eh),hl		;a4d6   ; guarda la cuenta de cuadros del paso de la presentacion (16 bits)
	jp L_A3EA		;a4d9
L_A4DC:
	call L_A65C		;a4dc
	jr nc,L_A4EA		;a4df
	ld a,(0ca38h)		;a4e1
	cp 020h		;a4e4
	ret nz			;a4e6
	jp L_A729		;a4e7
L_A4EA:
	call L_A73A		;a4ea
	ld hl,0a9f9h		;a4ed
	ld a,008h		;a4f0
	ld de,00838h		;a4f2
	call L_A551		;a4f5
	call 04650h		;a4f8   ; espera_vdp: espera a que el VDP acabe la orden en curso (S#2 bit 0)
	call L_A549		;a4fb
	jp L_A3EA		;a4fe
L_A501:
	call L_A64B		;a501
	ret c			;a504
	ld d,000h		;a505
	call 04be4h		;a507   ; borra_toda_la_pagina: p00:46FF desde (0,0) con BC = 0 y A = 0 en la pagina D
	ld hl,0aa28h		;a50a
	ld a,00ch		;a50d
	ld de,01050h		;a50f
	call L_A551		;a512
	call L_A645		;a515
	call 04650h		;a518   ; espera_vdp: espera a que el VDP acabe la orden en curso (S#2 bit 0)
	call L_A549		;a51b
	jp L_A3EA		;a51e
L_A521:
	call L_A64B		;a521
	ret c			;a524
	call 06be8h		;a525   ; orden_sonido_f6: la orden 0xF6 al sonido
	jp L_A3EA		;a528
L_A52B:
	xor a			;a52b
	ld (0ca2ch),a		;a52c   ; guarda el paso de la presentacion (1-0x41; 0 se acaba, desde 0x80 p14:A2CF)
	ret			;a52f
L_A530:
	ld bc,(0ca2eh)		;a530   ; lee la cuenta de cuadros del paso de la presentacion (16 bits)
	dec bc			;a534
	ld (0ca2eh),bc		;a535   ; guarda la cuenta de cuadros del paso de la presentacion (16 bits)
	ld a,b			;a539
	or c			;a53a
	ret			;a53b
L_A53C:
	ld bc,00f00h		;a53c
L_A53F:
	ld a,c			;a53f
	ld de,00000h		;a540
	call 04614h		;a543   ; pon_color: el color A de la paleta = D (rojo y azul), E (verde)
	inc c			;a546
	djnz L_A53F		;a547
L_A549:
	ld a,00fh		;a549
	ld de,07707h		;a54b
	jp 04614h		;a54e   ; pon_color: el color A de la paleta = D (rojo y azul), E (verde)
L_A551:
	ld (0ca31h),hl		;a551   ; guarda lo que falta del dibujo que se abre en la presentacion y el byte siguiente (16 bits)
	ld (0ca33h),de		;a554   ; guarda el sitio de la primera linea del texto de la presentacion y el byte siguiente (16 bits)
	ld (0ca36h),a		;a558
	xor a			;a55b
	ld (0ca37h),a		;a55c   ; guarda el sitio de la segunda linea
	inc a			;a55f
	ld (0ca35h),a		;a560   ; guarda las letras de la primera linea (banco 53)
	ret			;a563
L_A564:
	ld hl,0ca35h		;a564   ; apunta a las letras de la primera linea (banco 53)
	dec (hl)			;a567
	ld a,(hl)			;a568
	and a			;a569
	scf			;a56a
	ret nz			;a56b
	ld a,(0ca36h)		;a56c
	ld (hl),a			;a56f
	ld hl,(0ca31h)		;a570   ; lee lo que falta del dibujo que se abre en la presentacion y el byte siguiente (16 bits)
	ld a,(hl)			;a573
	inc hl			;a574
	ld (0ca31h),hl		;a575   ; guarda lo que falta del dibujo que se abre en la presentacion y el byte siguiente (16 bits)
	ld c,a			;a578
	inc a			;a579
	jr z,L_A5C3		;a57a
	inc a			;a57c
	jr z,L_A5B1		;a57d
	inc a			;a57f
	jr z,L_A5A9		;a580
	ld a,c			;a582
	and 0f0h		;a583
	ld l,a			;a585
	ld a,c			;a586
	rrca			;a587
	rrca			;a588
	rrca			;a589
	rrca			;a58a
	and 0f0h		;a58b
	ld h,a			;a58d
	ld a,(0ca37h)		;a58e   ; lee el sitio de la segunda linea
	add a,a			;a591
	add a,a			;a592
	add a,a			;a593
	add a,a			;a594
	ld de,(0ca33h)		;a595   ; lee el sitio de la primera linea del texto de la presentacion y el byte siguiente (16 bits)
	add a,d			;a599
	ld d,a			;a59a
	ld bc,01010h		;a59b
	ld a,0c8h		;a59e
	call 047edh		;a5a0   ; copia_rectangulo_logica: orden LMMM del VDP con la operacion logica de A
	ld hl,0ca37h		;a5a3   ; apunta a el sitio de la segunda linea
	inc (hl)			;a5a6
	scf			;a5a7
	ret			;a5a8
L_A5A9:
	ld a,(hl)			;a5a9
	ld (0ca34h),a		;a5aa
	inc hl			;a5ad
	ld (0ca31h),hl		;a5ae   ; guarda lo que falta del dibujo que se abre en la presentacion y el byte siguiente (16 bits)
L_A5B1:
	xor a			;a5b1
	ld (0ca37h),a		;a5b2   ; guarda el sitio de la segunda linea
	ld de,(0ca33h)		;a5b5   ; lee el sitio de la primera linea del texto de la presentacion y el byte siguiente (16 bits)
	ld a,e			;a5b9
	add a,018h		;a5ba
	ld e,a			;a5bc
	ld (0ca33h),de		;a5bd   ; guarda el sitio de la primera linea del texto de la presentacion y el byte siguiente (16 bits)
	scf			;a5c1
	ret			;a5c2
L_A5C3:
	or a			;a5c3
	ret			;a5c4
L_A5C5:
	ld a,081h		;a5c5
	ld (0ca38h),a		;a5c7
	ld hl,0e900h		;a5ca   ; apunta a los caracteres de un dibujo pasados a 4 bits
	ld de,0e901h		;a5cd
	ld bc,00030h		;a5d0
	ld (hl),000h		;a5d3
	ldir		;a5d5
	xor a			;a5d7
	ld b,00fh		;a5d8
	ld hl,0e900h		;a5da   ; apunta a los caracteres de un dibujo pasados a 4 bits
L_A5DD:
	ld (hl),a			;a5dd
	inc hl			;a5de
	inc hl			;a5df
	inc hl			;a5e0
	inc a			;a5e1
	djnz L_A5DD		;a5e2
	ld (hl),0ffh		;a5e4
	ret			;a5e6
L_A5E7:
	ld hl,0ca38h		;a5e7
	ld a,(hl)			;a5ea
	and a			;a5eb
	ret z			;a5ec
	dec (hl)			;a5ed
	ld a,(hl)			;a5ee
	and 00fh		;a5ef
	ret nz			;a5f1
	push de			;a5f2
	ld hl,0e901h		;a5f3
	ld b,00fh		;a5f6
L_A5F8:
	push bc			;a5f8
	ld a,(de)			;a5f9
	and 0f0h		;a5fa
	ld b,a			;a5fc
	ld a,(hl)			;a5fd
	and 0f0h		;a5fe
	cp b			;a600
	jr z,L_A605		;a601
	add a,010h		;a603
L_A605:
	ld c,a			;a605
	ld a,(de)			;a606
	and 00fh		;a607
	ld b,a			;a609
	ld a,(hl)			;a60a
	and 00fh		;a60b
	cp b			;a60d
	jr z,L_A611		;a60e
	inc a			;a610
L_A611:
	or c			;a611
	ld (hl),a			;a612
	inc hl			;a613
	inc de			;a614
	ld a,(de)			;a615
	and 00fh		;a616
	ld b,a			;a618
	ld a,(hl)			;a619
	and 00fh		;a61a
	cp b			;a61c
	jr z,L_A620		;a61d
	inc a			;a61f
L_A620:
	ld (hl),a			;a620
	inc hl			;a621
	inc hl			;a622
	inc de			;a623
	pop bc			;a624
	djnz L_A5F8		;a625
	pop de			;a627
	ld hl,0e901h		;a628
	ld b,00fh		;a62b
L_A62D:
	ld a,(de)			;a62d
	cp (hl)			;a62e
	jr nz,L_A63C		;a62f
	inc de			;a631
	inc hl			;a632
	ld a,(de)			;a633
	cp (hl)			;a634
	jr nz,L_A63C		;a635
	inc hl			;a637
	inc hl			;a638
	inc de			;a639
	djnz L_A62D		;a63a
L_A63C:
	push af			;a63c
	ld hl,0e900h		;a63d   ; apunta a los caracteres de un dibujo pasados a 4 bits
	call 0463fh		;a640   ; pon_paleta_con_espera: pone la paleta de HL (p00:4642) esperando al VDP antes
	pop af			;a643
	ret			;a644
L_A645:
	ld a,041h		;a645
	ld (0ca38h),a		;a647
	ret			;a64a
L_A64B:
	ld hl,0ca38h		;a64b
	ld a,(hl)			;a64e
	and a			;a64f
	ret z			;a650
	dec (hl)			;a651
	ld a,(hl)			;a652
	and 007h		;a653
	scf			;a655
	ret nz			;a656
	call 090fdh		;a657   ; paleta_a_negro: los 16 colores de la paleta de la VRAM (0xF680) uno menos en cada parte; NZ mientras quede alguno
	scf			;a65a
	ret			;a65b
L_A65C:
	ld hl,0ca38h		;a65c
	ld a,(hl)			;a65f
	and a			;a660
	ret z			;a661
	dec (hl)			;a662
	ld a,(hl)			;a663
	and 007h		;a664
	scf			;a666
	ret nz			;a667
	ld b,00fh		;a668
	ld hl,0f69eh		;a66a
	call 09135h		;a66d   ; color_uno_menos: el color B de la VRAM de HL uno menos (p13:911C, p13:912D) y puesto en la paleta
	scf			;a670
	ret			;a671
L_A672:
	ld hl,08070h		;a672
	ld de,06840h		;a675
	ld bc,08078h		;a678
	ld a,002h		;a67b
	jp 04767h		;a67d   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
L_A680:
	call L_A672		;a680
L_A683:
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
L_A6AF:
	ld hl,00000h		;a6af
	ld de,01818h		;a6b2
	ld bc,0a070h		;a6b5
	ld a,002h		;a6b8
	jp 04767h		;a6ba   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
L_A6BD:
	call L_A6AF		;a6bd
L_A6C0:
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
L_A6EC:
	ld hl,00070h		;a6ec
	ld de,06818h		;a6ef
	ld bc,08078h		;a6f2
	ld a,002h		;a6f5
	jp 04767h		;a6f7   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
L_A6FA:
	call L_A6EC		;a6fa
L_A6FD:
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
L_A729:
	ld hl,0a000h		;a729
	ld de,01840h		;a72c
	ld bc,05870h		;a72f
	ld a,002h		;a732
	jp 04767h		;a734   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
L_A737:
	call L_A729		;a737
L_A73A:
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


L_AA5E:
	ld a,(0ca4ah)		;aa5e   ; lee la zona
	cp 012h		;aa61
	ret nz			;aa63
	ld a,(0ca4bh)		;aa64   ; lee la sala de la zona
	cp 008h		;aa67
	ret nz			;aa69
	ld ix,0d4c0h		;aa6a   ; apunta a 2 fichas de 16 bytes; tocan a Snake con 0x18 de dano (p07:B309)
	ld b,002h		;aa6e
L_AA70:
	push bc			;aa70
	ld a,(ix+000h)		;aa71
	and a			;aa74
	jr z,L_AA85		;aa75
	call L_AA8E		;aa77
	ld a,003h		;aa7a
	call 08085h		;aa7c   ; llama_ba36_a:
	call L_AAEB		;aa7f
	call L_AB41		;aa82
L_AA85:
	ld bc,00010h		;aa85
	add ix,bc		;aa88
	pop bc			;aa8a
	djnz L_AA70		;aa8b
	ret			;aa8d
L_AA8E:
	ld a,(ix+001h)		;aa8e
	call 0424dh		;aa91   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_AA94: 4 destinos del despachador p00:424D (call en p14:AA91, el
;   indice en A): AA9C, AAC5, AAD7, AAD8; lo leen p14:AA91 (8 bytes)
;   0xaa94..0xaa9c  (8 bytes)
DATA_tabla_AA94:
	defw 0aa9ch,0aac5h,0aad7h,0aad8h	; aa94  -> L_AA9C L_AAC5 L_AAD7 L_AAD8

; ======================================================================
; CODIGO 0xaa9c..0xab96  (250 bytes)
; ======================================================================


L_AA9C:
	ld a,(0cb03h)		;aa9c   ; lee la Y de Snake
	sub 020h		;aa9f
	cp (ix+003h)		;aaa1
	ret nc			;aaa4
	ld a,(0cb05h)		;aaa5   ; lee la X de Snake
	cp (ix+005h)		;aaa8
	ld b,001h		;aaab
	ld de,00303h		;aaad
	jr nc,L_AAB6		;aab0
	ld d,0fdh		;aab2
	ld b,004h		;aab4
L_AAB6:
	ld (ix+00fh),b		;aab6
	ld (ix+007h),e		;aab9
	ld (ix+009h),d		;aabc
	ld (ix+00ch),004h		;aabf
	jr L_AAD4		;aac3
L_AAC5:
	dec (ix+00ch)		;aac5
	ret nz			;aac8
	ld (ix+007h),000h		;aac9
	ld (ix+006h),000h		;aacd
	inc (ix+00fh)		;aad1
L_AAD4:
	inc (ix+001h)		;aad4
L_AAD7:
	ret			;aad7
L_AAD8:
	dec (ix+00ch)		;aad8
	jr z,L_AB19		;aadb
	ld a,(ix+00ch)		;aadd
	rra			;aae0
	rra			;aae1
	ld a,006h		;aae2
	jr c,L_AAE7		;aae4
	inc a			;aae6
L_AAE7:
	ld (ix+00fh),a		;aae7
	ret			;aaea
L_AAEB:
	ld a,(ix+001h)		;aaeb
	cp 003h		;aaee
	ret z			;aaf0
	ld a,(ix+003h)		;aaf1
	ld l,a			;aaf4
	cp 0c0h		;aaf5
	jr nc,L_AB01		;aaf7
	ld a,(ix+005h)		;aaf9
	sub 010h		;aafc
	cp 0a0h		;aafe
	ret c			;ab00
L_AB01:
	ld (ix+001h),003h		;ab01
	ld (ix+00ch),010h		;ab05
	xor a			;ab09
	ld (ix+007h),a		;ab0a
	ld (ix+006h),a		;ab0d
	ld (ix+009h),a		;ab10
	ld (ix+008h),a		;ab13
	jp 06a48h		;ab16   ; sonido_15: pide el sonido 0x15
L_AB19:
	ld (ix+000h),000h		;ab19
	ld a,(ix+00eh)		;ab1d
	ld b,a			;ab20
	add a,a			;ab21
	add a,a			;ab22
	ld hl,0dc28h		;ab23
	call 0423eh		;ab26   ; suma_a_hl: HL = HL + A
	ld d,h			;ab29
	ld a,l			;ab2a
	add a,004h		;ab2b
	ld e,a			;ab2d
	ld a,0e0h		;ab2e
	ld (ix+003h),a		;ab30
	ld (hl),a			;ab33
	ld (de),a			;ab34
	ld hl,0d400h		;ab35   ; apunta a los 22 sprites que se reparten los actores (1 = ocupado)
	ld a,b			;ab38
	call 0423eh		;ab39   ; suma_a_hl: HL = HL + A
	xor a			;ab3c
	ld (hl),a			;ab3d
	inc hl			;ab3e
	ld (hl),a			;ab3f
	ret			;ab40
L_AB41:
	ld a,(ix+00eh)		;ab41
	add a,a			;ab44
	add a,a			;ab45
	ld hl,0dc28h		;ab46
	call 0423eh		;ab49   ; suma_a_hl: HL = HL + A
	ld b,h			;ab4c
	ld a,l			;ab4d
	add a,004h		;ab4e
	ld c,a			;ab50
	ld a,(ix+003h)		;ab51
	ld (hl),a			;ab54
	ld (bc),a			;ab55
	inc l			;ab56
	inc c			;ab57
	ld a,(ix+005h)		;ab58
	sub 008h		;ab5b
	ld (hl),a			;ab5d
	ld (bc),a			;ab5e
	inc l			;ab5f
	inc c			;ab60
	ld a,(ix+00fh)		;ab61
	ld de,0ab96h		;ab64
	call 04243h		;ab67   ; suma_a_de: DE = DE + A
	ld a,(de)			;ab6a
	ld (hl),a			;ab6b
	add a,004h		;ab6c
	ld (bc),a			;ab6e
	ld a,(ix+001h)		;ab6f
	cp 003h		;ab72
	ld bc,00d47h		;ab74
	jr nz,L_AB7C		;ab77
	ld bc,0074ah		;ab79
L_AB7C:
	ld l,(ix+00eh)		;ab7c
	ld h,000h		;ab7f
	add hl,hl			;ab81
	add hl,hl			;ab82
	add hl,hl			;ab83
	add hl,hl			;ab84
	ld de,0daa0h		;ab85
	add hl,de			;ab88
	ld a,b			;ab89
	push bc			;ab8a
	call L_AB90		;ab8b
	pop bc			;ab8e
	ld a,c			;ab8f
L_AB90:
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


L_AB9E:
	ld a,(0ca77h)		;ab9e
	and a			;aba1
	jp nz,086a4h		;aba2   ; acaba_musica_del_actor: con 0xCA26: lo quita, p01:7A12 y el banco del tipo (1 el 15, 2 y 6 el 10)
	ld hl,06bcch		;aba5
	call 086d5h		;aba8   ; si_c693: con 0xC693, lo borra y salta a HL
	ld a,(ix+001h)		;abab
	ld hl,0abc5h		;abae
	call 0424eh		;abb1   ; salta_por_tabla: salta a la palabra A de la tabla de HL
	ld a,(ix+00ch)		;abb4
	call 08085h		;abb7   ; llama_ba36_a:
	ld a,(ix+001h)		;abba
	sub 005h		;abbd
	cp 004h		;abbf
	ret nc			;abc1
	jp 08671h		;abc2   ; musica_del_actor: la primera vez (0xCA26): ninguna pendiente y por el tipo (p04:8698)

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


L_ABD7:
	ld a,(0ca50h)		;abd7   ; lee la fila de la sala en la zona (uno mas al salir por arriba)
	cp (ix+00ah)		;abda
	ret nz			;abdd
	ld a,001h		;abde
	ld (0cb3ch),a		;abe0
	ld hl,0d7d3h		;abe3
	set 4,(hl)		;abe6
	ld (ix+00eh),01eh		;abe8
	jr L_ABFB		;abec
L_ABEE:
	dec (ix+00eh)		;abee
	ret nz			;abf1
	call 086c2h		;abf2   ; pon_musica_a6: 0xCA26 = 1, ninguna pendiente y el sonido 0xA6
	ld de,00a80h		;abf5
	call 061c0h		;abf8   ; mensaje_de_50_con_ventana: p01:61CE y los bancos 4, 5 y 14
L_ABFB:
	inc (ix+001h)		;abfb
	ret			;abfe
L_ABFF:
	call 061f8h		;abff   ; mensaje_cada_cuadro_bancos_14:
	ret nz			;ac02
	call L_AC48		;ac03
	jr L_ABFB		;ac06
L_AC08:
	call L_ACAA		;ac08
	call 0902eh		;ac0b   ; p04:902E
	call 08107h		;ac0e   ; en_esta_columna: Z si el actor esta en la columna de ahora
	ret nz			;ac11
	ld a,(ix+005h)		;ac12
	cp 060h		;ac15
	ret c			;ac17
	xor a			;ac18
	ld (ix+00ch),a		;ac19
	ld (ix+00dh),a		;ac1c
	ld d,00bh		;ac1f
	call 061c9h		;ac21   ; mensaje_de_50_bancos_14: p01:61DC y los bancos 4, 5 y 14
	jr L_ABFB		;ac24
L_AC26:
	call 061f8h		;ac26   ; mensaje_cada_cuadro_bancos_14:
	ret nz			;ac29
	call 07a59h		;ac2a   ; llama_7a27_1_bancos_14:
	jp L_ABFB		;ac2d
L_AC30:
	call 08685h		;ac30   ; por_el_tipo_8698: por el byte del tipo en p04:8698 (p04:8691)
	xor a			;ac33
	ld (0cb3ch),a		;ac34
	ld (ix+011h),a		;ac37
	inc a			;ac3a
	ld (ix+016h),a		;ac3b
	ld (ix+00eh),020h		;ac3e
	call L_AC48		;ac42
	jp L_ABFB		;ac45
L_AC48:
	ld de,00200h		;ac48
	call 08107h		;ac4b   ; en_esta_columna: Z si el actor esta en la columna de ahora
	jr z,L_AC54		;ac4e
	jr nc,L_AC5F		;ac50
	jr L_AC5C		;ac52
L_AC54:
	ld a,(0cb05h)		;ac54   ; lee la X de Snake
	cp (ix+005h)		;ac57
	jr nc,L_AC5F		;ac5a
L_AC5C:
	call 04442h		;ac5c   ; de_negativo: DE = -DE
L_AC5F:
	ld (ix+009h),d		;ac5f
	ld (ix+008h),e		;ac62
	ld (ix+00ch),002h		;ac65
	jr L_ACD8		;ac69
L_AC6B:
	call L_ACAA		;ac6b
	call L_ACC4		;ac6e
	inc (ix+011h)		;ac71
	ld a,(ix+011h)		;ac74
	and 003h		;ac77
	call z,0902eh		;ac79   ; p04:902E
	ld a,(ix+00eh)		;ac7c
	and a			;ac7f
	jr nz,L_AC87		;ac80
	call 08107h		;ac82   ; en_esta_columna: Z si el actor esta en la columna de ahora
	jr z,L_AC8E		;ac85
L_AC87:
	dec (ix+00eh)		;ac87
	ret nz			;ac8a
	jp L_AC48		;ac8b
L_AC8E:
	ld a,(0cb05h)		;ac8e   ; lee la X de Snake
	sub (ix+005h)		;ac91
	jr nc,L_AC98		;ac94
	neg		;ac96
L_AC98:
	cp 008h		;ac98
	ret nc			;ac9a
	ld (ix+00ch),000h		;ac9b
	ld (ix+00dh),002h		;ac9f
	ld (ix+00eh),004h		;aca3
	jp L_ABFB		;aca7
L_ACAA:
	ld a,(ix+005h)		;acaa
	cp 010h		;acad
	jr c,L_ACBC		;acaf
	cp 0b1h		;acb1
	ret c			;acb3
	ld (ix+005h),010h		;acb4
	inc (ix+00bh)		;acb8
	ret			;acbb
L_ACBC:
	ld (ix+005h),0b0h		;acbc
	dec (ix+00bh)		;acc0
	ret			;acc3
L_ACC4:
	ld a,(ix+00bh)		;acc4
	cp 006h		;acc7
	jr z,L_ACE5		;acc9
	ld a,(ix+005h)		;accb
	cp 0ach		;acce
	ret c			;acd0
L_ACD1:
	ld (ix+00eh),010h		;acd1
	call 0808eh		;acd5   ; vuelve_en_x: la velocidad en X cambiada de signo
L_ACD8:
	ld a,(ix+009h)		;acd8
	rla			;acdb
	ld a,004h		;acdc
	jr c,L_ACE1		;acde
	xor a			;ace0
L_ACE1:
	ld (ix+00dh),a		;ace1
	ret			;ace4
L_ACE5:
	ld a,(ix+005h)		;ace5
	cp 014h		;ace8
	ret nc			;acea
	jr L_ACD1		;aceb
L_ACED:
	dec (ix+00eh)		;aced
	ret nz			;acf0
	inc (ix+00dh)		;acf1
	ld (ix+00eh),004h		;acf4
	call 09af8h		;acf8   ; lanza_3: lo lanzado de tipo 3
	jp L_ABFB		;acfb
L_ACFE:
	dec (ix+00eh)		;acfe
	ret nz			;ad01
	ld (ix+00eh),008h		;ad02
	ld (ix+001h),006h		;ad06
	call L_AC48		;ad0a
	jr L_ACD8		;ad0d
L_AD0F:
	ld a,(0d8a0h)		;ad0f
	and a			;ad12
	ret z			;ad13
	ld a,(ix+001h)		;ad14
	ld b,a			;ad17
	ld a,(ix+017h)		;ad18
	and a			;ad1b
	jr nz,L_AD27		;ad1c
	ld a,b			;ad1e
	sub 003h		;ad1f
	cp 002h		;ad21
	ld a,001h		;ad23
	jr c,L_AD28		;ad25
L_AD27:
	xor a			;ad27
L_AD28:
	ld (ix+016h),a		;ad28
	ld a,b			;ad2b
	ld hl,0ad38h		;ad2c
	call 0424eh		;ad2f   ; salta_por_tabla: salta a la palabra A de la tabla de HL
	ld a,(ix+00ch)		;ad32
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


L_AD48:
	ld (ix+016h),000h		;ad48
	ret			;ad4c
L_AD4D:
	ld a,(ix+01ah)		;ad4d
	add a,a			;ad50
	add a,a			;ad51
	ld hl,0ad86h		;ad52
	call 0423eh		;ad55   ; suma_a_hl: HL = HL + A
	ld a,(hl)			;ad58
	ld (ix+007h),a		;ad59
	inc hl			;ad5c
	ld a,(hl)			;ad5d
	ld (ix+008h),a		;ad5e
	inc hl			;ad61
	ld a,(hl)			;ad62
	ld (ix+009h),a		;ad63
	inc hl			;ad66
	ld a,(hl)			;ad67
	ld (ix+00eh),a		;ad68
	xor a			;ad6b
	ld (ix+006h),a		;ad6c
	ld (ix+019h),a		;ad6f
	ld (ix+018h),080h		;ad72
	ld (ix+011h),a		;ad76
	ld (ix+00fh),a		;ad79
	ld (ix+00ch),003h		;ad7c
	call 06b59h		;ad80   ; sonido_5a: pide el sonido 0x5A
	jp L_ADE7		;ad83

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


L_AD96:
	dec (ix+00eh)		;ad96
	jr z,L_ADAF		;ad99
L_AD9B:
	ld h,(ix+007h)		;ad9b
	ld l,(ix+006h)		;ad9e
	ld d,(ix+019h)		;ada1
	ld e,(ix+018h)		;ada4
	add hl,de			;ada7
	ld (ix+007h),h		;ada8
	ld (ix+006h),l		;adab
	ret			;adae
L_ADAF:
	ld a,(ix+006h)		;adaf
	ld (ix+01bh),a		;adb2
	ld a,(ix+007h)		;adb5
	ld (ix+01ch),a		;adb8
	ld a,(ix+008h)		;adbb
	ld (ix+01dh),a		;adbe
	ld a,(ix+009h)		;adc1
	ld (ix+01eh),a		;adc4
	call L_ADEB		;adc7
	ld a,(ix+003h)		;adca
	ld b,0a8h		;adcd
	cp b			;adcf
	jr c,L_ADD3		;add0
	ld a,b			;add2
L_ADD3:
	ld b,04ah		;add3
	cp b			;add5
	jr nc,L_ADD9		;add6
	ld a,b			;add8
L_ADD9:
	ld (ix+003h),a		;add9
	call 04256h		;addc   ; azar: A = un numero al azar (0xCA03 rotado mas R)
	and 01fh		;addf
	ld (ix+00eh),a		;ade1
	call 06b5dh		;ade4   ; sonido_5b: pide el sonido 0x5B
L_ADE7:
	inc (ix+001h)		;ade7
	ret			;adea
L_ADEB:
	ld a,(ix+01ah)		;adeb
	cp 002h		;adee
	jr c,L_AE12		;adf0
	ld a,(0cb03h)		;adf2   ; lee la Y de Snake
	cp (ix+003h)		;adf5
	ld de,00400h		;adf8
	ld b,002h		;adfb
	jr nc,L_AE04		;adfd
	call 04442h		;adff   ; de_negativo: DE = -DE
	ld b,000h		;ae02
L_AE04:
	ld (ix+00dh),b		;ae04
	ld (ix+006h),e		;ae07
	ld (ix+007h),d		;ae0a
	ld (ix+00ch),001h		;ae0d
	ret			;ae11
L_AE12:
	ld a,(0cb05h)		;ae12   ; lee la X de Snake
	cp (ix+005h)		;ae15
	ld de,00400h		;ae18
	ld b,006h		;ae1b
	jr nc,L_AE24		;ae1d
	call 04442h		;ae1f   ; de_negativo: DE = -DE
	ld b,004h		;ae22
L_AE24:
	ld (ix+00dh),b		;ae24
	ld (ix+008h),e		;ae27
	ld (ix+009h),d		;ae2a
	ld (ix+00ch),002h		;ae2d
	ret			;ae31
L_AE32:
	call 086deh		;ae32   ; cambia_paso_cada_2: el byte 0x11 uno mas; cada 2, el paso del dibujo
	call L_AEEE		;ae35
	jr c,L_AE76		;ae38
	ld a,(ix+00eh)		;ae3a
	and a			;ae3d
	jr z,L_AE45		;ae3e
	dec (ix+00eh)		;ae40
	jr L_AE4B		;ae43
L_AE45:
	call L_AED4		;ae45
	jp c,L_AEBE		;ae48
L_AE4B:
	ld a,(ix+01ah)		;ae4b
	cp 002h		;ae4e
	jr c,L_AE5F		;ae50
	ld a,(ix+003h)		;ae52
	sub 050h		;ae55
	cp 058h		;ae57
	ret c			;ae59
	call 0809eh		;ae5a   ; vuelve_en_y: la velocidad en Y cambiada de signo
	jr L_AE6A		;ae5d
L_AE5F:
	ld a,(ix+005h)		;ae5f
	sub 038h		;ae62
	cp 050h		;ae64
	ret c			;ae66
	call 0808eh		;ae67   ; vuelve_en_x: la velocidad en X cambiada de signo
L_AE6A:
	ld a,(ix+00dh)		;ae6a
	rra			;ae6d
	rra			;ae6e
	ccf			;ae6f
	rla			;ae70
	rla			;ae71
	ld (ix+00dh),a		;ae72
	ret			;ae75
L_AE76:
	ld e,(ix+01bh)		;ae76
	ld d,(ix+01ch)		;ae79
	call 04442h		;ae7c   ; de_negativo: DE = -DE
	ld (ix+006h),e		;ae7f
	ld (ix+007h),d		;ae82
	ld e,(ix+01dh)		;ae85
	ld d,(ix+01eh)		;ae88
	call 04442h		;ae8b   ; de_negativo: DE = -DE
	ld (ix+008h),e		;ae8e
	ld (ix+009h),d		;ae91
	ld a,(ix+01ah)		;ae94
	inc a			;ae97
	add a,a			;ae98
	add a,a			;ae99
	ld hl,0ad86h		;ae9a
	call 0423eh		;ae9d   ; suma_a_hl: HL = HL + A
	dec hl			;aea0
	ld a,(hl)			;aea1
	ld (ix+00eh),a		;aea2
	ld (ix+00ch),003h		;aea5
	ld (ix+001h),005h		;aea9
	call 06b59h		;aead   ; sonido_5a: pide el sonido 0x5A
	ld hl,0af6fh		;aeb0
L_AEB3:
	ld a,(ix+01ah)		;aeb3
	call 0423eh		;aeb6   ; suma_a_hl: HL = HL + A
	ld a,(hl)			;aeb9
	ld (ix+00dh),a		;aeba
	ret			;aebd
L_AEBE:
	call L_AEEE		;aebe
	jr c,L_AE76		;aec1
	ld hl,0af73h		;aec3
	call L_AEB3		;aec6
	ld (ix+00ch),000h		;aec9
	ld (ix+00eh),018h		;aecd
	jp L_ADE7		;aed1
L_AED4:
	ld a,(ix+01ah)		;aed4
	cp 002h		;aed7
	jr c,L_AEE3		;aed9
	ld a,(0cb03h)		;aedb   ; lee la Y de Snake
	sub (ix+003h)		;aede
	jr L_AEE9		;aee1
L_AEE3:
	ld a,(0cb05h)		;aee3   ; lee la X de Snake
	sub (ix+005h)		;aee6
L_AEE9:
	sub 0fch		;aee9
	cp 008h		;aeeb
	ret			;aeed
L_AEEE:
	call L_AF96		;aeee
	or a			;aef1
	dec c			;aef2
	ret z			;aef3
	ld a,(ix+017h)		;aef4
	and a			;aef7
	scf			;aef8
	ret nz			;aef9
	call 08079h		;aefa   ; y_x_de_snake_en_hl: L = la Y, H = la X de Snake
	ld a,l			;aefd
	sub (ix+003h)		;aefe
	sub 0e0h		;af01
	cp 040h		;af03
	ret nc			;af05
	ld a,h			;af06
	sub (ix+005h)		;af07
	sub 0e0h		;af0a
	cp 040h		;af0c
	ret			;af0e
L_AF0F:
	dec (ix+00eh)		;af0f
	jr z,L_AF1D		;af12
	ld a,(ix+00eh)		;af14
	and 007h		;af17
	jp z,09b3bh		;af19   ; lanza_6_a942:
	ret			;af1c
L_AF1D:
	inc (ix+00fh)		;af1d
	ld a,(ix+00fh)		;af20
	cp 002h		;af23
	jp nc,L_AE76		;af25
	call L_ADEB		;af28
	call 04256h		;af2b   ; azar: A = un numero al azar (0xCA03 rotado mas R)
	and 01fh		;af2e
	ld (ix+00eh),a		;af30
	dec (ix+001h)		;af33
	ret			;af36
L_AF37:
	dec (ix+00eh)		;af37
	jp nz,L_AD9B		;af3a
	ld a,(ix+01ah)		;af3d
	ld b,a			;af40
	add a,a			;af41
	add a,b			;af42
	ld hl,0afd5h		;af43
	call 0423eh		;af46   ; suma_a_hl: HL = HL + A
	ld a,(ix+01ah)		;af49
	cp 002h		;af4c
	jr nc,L_AF57		;af4e
	ld a,(hl)			;af50
	ld (ix+003h),a		;af51
	inc hl			;af54
	jr L_AF5C		;af55
L_AF57:
	inc hl			;af57
	ld a,(hl)			;af58
	ld (ix+005h),a		;af59
L_AF5C:
	inc hl			;af5c
	ld a,(hl)			;af5d
	ld (ix+00dh),a		;af5e
	xor a			;af61
	ld (ix+002h),a		;af62
	ld (ix+004h),a		;af65
	ld (ix+00ch),a		;af68
	ld (ix+001h),a		;af6b
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


L_AF77:
	ld (ix+00eh),00ch		;af77
	ld (ix+00dh),080h		;af7b
	ld (ix+00ch),000h		;af7f
	call 06fa8h		;af83   ; rachas_bc6e_bancos_14:
	call L_ADE7		;af86
	call L_AF96		;af89
	dec c			;af8c
	jp nz,06a44h		;af8d   ; sonido_14: pide el sonido 0x14
	call 06b12h		;af90   ; sonido_05: pide el sonido 0x05
	jp 06c3fh		;af93   ; sonido_86: pide el sonido 0x86 (de los que tienen la partitura en un banco de musica, p16:4CE3)
L_AF96:
	ld hl,0d800h		;af96   ; apunta a 4 fichas de 0x20 bytes de 0xD800 (p04:89C3); sus tipos los lleva p10
	ld bc,00400h		;af99
L_AF9C:
	ld a,(hl)			;af9c
	and a			;af9d
	jr z,L_AFA3		;af9e
	inc c			;afa0
	ld d,h			;afa1
	ld e,l			;afa2
L_AFA3:
	ld a,020h		;afa3
	call 0423eh		;afa5   ; suma_a_hl: HL = HL + A
	djnz L_AF9C		;afa8
	ret			;afaa
L_AFAB:
	dec (ix+00eh)		;afab
	jr z,L_AFBA		;afae
	ld a,(ix+00eh)		;afb0
	and 003h		;afb3
	ret nz			;afb5
	inc (ix+00dh)		;afb6
	ret			;afb9
L_AFBA:
	ld (ix+000h),000h		;afba
	push ix		;afbe
	pop hl			;afc0
	ld de,0d800h		;afc1   ; apunta a 4 fichas de 0x20 bytes de 0xD800 (p04:89C3); sus tipos los lleva p10
	or a			;afc4
	sbc hl,de		;afc5
	srl l		;afc7
	ld de,0dc28h		;afc9
	add hl,de			;afcc
	ld a,0e0h		;afcd
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


L_AFE1:
	ld a,003h		;afe1
	ld (0caadh),a		;afe3
	ld a,(0ca4ah)		;afe6   ; lee la zona
	ld b,a			;afe9
	and a			;afea
	jr nz,L_B012		;afeb
	ld a,(0ca50h)		;afed   ; lee la fila de la sala en la zona (uno mas al salir por arriba)
	ld c,a			;aff0
	dec a			;aff1
	jr nz,L_AFF8		;aff2
	xor a			;aff4
	ld (0caadh),a		;aff5
L_AFF8:
	ld a,c			;aff8
	cp 005h		;aff9
	jr c,L_B012		;affb
	xor a			;affd
	ld (0cb2eh),a		;affe   ; guarda el paso del estado 2 de Snake
	inc a			;b001
	ld (0cb31h),a		;b002   ; guarda 1 en el estado 2 de Snake
	ld (0cb0ah),a		;b005   ; guarda la marcha de Snake: el indice de las velocidades de p02:9520
	ld (0cb15h),a		;b008   ; guarda la espera hasta el paso siguiente (p02:988A, segun la marcha)
	inc a			;b00b
	ld (0cb00h),a		;b00c   ; guarda el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	ld (0cb01h),a		;b00f   ; guarda el dibujo de Snake (al darse la vuelta se le suma 1, 3 o 5 segun 0xCB00)
L_B012:
	ld a,002h		;b012
	ld (0cb0eh),a		;b014   ; guarda la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ld a,b			;b017
	cp 013h		;b018
	jr nz,L_B038		;b01a
	ld a,(0d7d9h)		;b01c
	and 020h		;b01f
	jr z,L_B038		;b021
	ld a,032h		;b023
	ld (0cb03h),a		;b025   ; guarda la Y de Snake
	ld a,052h		;b028
	ld (0cb05h),a		;b02a   ; guarda la X de Snake
	ld hl,00804h		;b02d
	ld (0ca50h),hl		;b030   ; guarda la fila de la sala en la zona (uno mas al salir por arriba) y el byte siguiente (16 bits)
	ld a,005h		;b033
	ld (0ca4bh),a		;b035   ; guarda la sala de la zona
L_B038:
	ld a,b			;b038
	ret			;b039
L_B03A:
	ld a,(0ca4ah)		;b03a   ; lee la zona
	cp 00ah		;b03d
	jr nz,L_B053		;b03f
	ld a,(0ca4bh)		;b041   ; lee la sala de la zona
	cp 009h		;b044
	jr nz,L_B053		;b046
	ld hl,00c30h		;b048
	ld (0d418h),hl		;b04b
	ld a,004h		;b04e
	ld (0d41eh),a		;b050
L_B053:
	ld hl,0d820h		;b053
	ld a,(hl)			;b056
	cp 008h		;b057
	ret nz			;b059
	ld a,(0d88bh)		;b05a
	inc a			;b05d
	ret nz			;b05e
	inc hl			;b05f
	ld (hl),011h		;b060
	inc hl			;b062
	inc hl			;b063
	ld (hl),060h		;b064
	inc hl			;b066
	inc hl			;b067
	ld (hl),070h		;b068
	ret			;b06a
L_B06B:
	ld a,(0ca4ah)		;b06b   ; lee la zona
	cp 011h		;b06e
	jr nz,L_B07C		;b070
	ld a,012h		;b072
	ld (0c700h),a		;b074   ; guarda copia de la zona, la sala especial, la Y y la X de Snake y 0xCA50-0xCA51 (6 bytes)
	ld (0ca4ah),a		;b077   ; guarda la zona
	jr L_B090		;b07a
L_B07C:
	cp 012h		;b07c
	ret nz			;b07e
	ld a,(0d881h)		;b07f
	inc a			;b082
	ret nz			;b083
	ld a,(0d888h)		;b084   ; lee 8 bytes que se guardan como bits (0xFF = 1)
	inc a			;b087
	jr nz,L_B0BA		;b088
	ld a,(0d889h)		;b08a
	inc a			;b08d
	jr nz,L_B104		;b08e
L_B090:
	ld hl,0d7d0h		;b090   ; apunta a las banderas de la partida: la n en el bit 7 - n % 8 del byte n / 8 (p03:B0DC, p03:B0F6)
	res 4,(hl)		;b093
	inc hl			;b095
	res 5,(hl)		;b096
	ld hl,0d7dah		;b098
	res 3,(hl)		;b09b
	xor a			;b09d
	ld (0caa0h),a		;b09e   ; guarda cuantos siguen a Snake por su rastro (1-4)
	ld (0d600h),a		;b0a1   ; guarda lo que lleva Snake: fichas de 4 bytes [la tiene][cuenta en BCD, 2 bytes][...]; las de 0xCB20 desde la 1
	ld (0d601h),a		;b0a4
	ld (0d602h),a		;b0a7
	ld hl,0d8d8h		;b0aa   ; apunta a las banderas de la sala (se borran al cambiar de sala, p00:59DD)
	ld (hl),0feh		;b0ad
	inc hl			;b0af
	ld (hl),0ffh		;b0b0
	ld hl,00704h		;b0b2
	ld bc,0a001h		;b0b5
	jr L_B0F3		;b0b8
L_B0BA:
	ld a,001h		;b0ba
	ld (0d8aah),a		;b0bc
	ld (0d4f0h),a		;b0bf
	ld a,009h		;b0c2
	ld (0d820h),a		;b0c4
	ld a,(0d88ch)		;b0c7
	inc a			;b0ca
	jr z,L_B0D7		;b0cb
	call 08ef8h		;b0cd   ; p02:8EF8
	ld hl,00903h		;b0d0
	ld c,002h		;b0d3
	jr L_B0F1		;b0d5
L_B0D7:
	ld a,005h		;b0d7
	ld (0d821h),a		;b0d9
	ld hl,00802h		;b0dc
	ld (0d82ah),hl		;b0df
	ld a,060h		;b0e2
	ld (0d823h),a		;b0e4
	ld a,050h		;b0e7
	ld (0d825h),a		;b0e9
	ld hl,00902h		;b0ec
L_B0EF:
	ld c,003h		;b0ef
L_B0F1:
	ld b,068h		;b0f1
L_B0F3:
	ld (0ca50h),hl		;b0f3   ; guarda la fila de la sala en la zona (uno mas al salir por arriba) y el byte siguiente (16 bits)
	ld a,b			;b0f6
	ld (0cb03h),a		;b0f7   ; guarda la Y de Snake
	ld a,060h		;b0fa
	ld (0cb05h),a		;b0fc   ; guarda la X de Snake
	ld a,c			;b0ff
	ld (0cb0eh),a		;b100   ; guarda la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ret			;b103
L_B104:
	ld hl,0d600h		;b104   ; apunta a lo que lleva Snake: fichas de 4 bytes [la tiene][cuenta en BCD, 2 bytes][...]; las de 0xCB20 desde la 1
	ld bc,000ffh		;b107
	call 04236h		;b10a   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	ld hl,0d7f0h		;b10d   ; apunta a otras banderas de la partida (p03:B0D3, p03:B0FE)
	ld bc,0000fh		;b110
	call 04236h		;b113   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	ld a,001h		;b116
	ld (0d8a9h),a		;b118
	ld (0d6b0h),a		;b11b
	ld a,00ah		;b11e
	ld (0d840h),a		;b120
	ld hl,00802h		;b123
	jr L_B0EF		;b126
L_B128:
	ld a,(0cb00h)		;b128   ; lee el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	cp 014h		;b12b
	ret z			;b12d
	sub 01bh		;b12e
	ret nc			;b130
	call 09961h		;b131   ; d43e_a_ff: 0xD43E = 0xFF
	call L_B214		;b134
	xor a			;b137
	ld (0caf6h),a		;b138
	ld a,(0ca76h)		;b13b   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	and a			;b13e
	ld a,(0d41eh)		;b13f
	jr z,L_B147		;b142
	ld a,(0d449h)		;b144
L_B147:
	ld (0d4f4h),a		;b147
	ld a,(ix+000h)		;b14a
	cp 003h		;b14d
	jp z,L_B399		;b14f
	cp 004h		;b152
	jp z,L_B3E3		;b154
	cp 005h		;b157
	jp z,L_B3F4		;b159
L_B15C:
	ld a,(0cb00h)		;b15c   ; lee el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	cp 014h		;b15f
	ret z			;b161
	sub 01bh		;b162
	ret nc			;b164
	ld a,(ix+000h)		;b165
	cp 015h		;b168
	jr z,L_B171		;b16a
	call 06b99h		;b16c   ; sonido_8c: pide el sonido 0x8C (de los que tienen la partitura en un banco de musica, p16:4CE3) (antes, L_6CDA)
	jr L_B185		;b16f
L_B171:
	call 06a31h		;b171   ; sonido_8e: pide el sonido 0x8E (de los que tienen la partitura en un banco de musica, p16:4CE3) (antes, L_6CDA)
	jr L_B185		;b174
L_B176:
	ld a,(0ca76h)		;b176   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	and a			;b179
	ld a,(0d41eh)		;b17a
	jr z,L_B182		;b17d
	ld a,(0d449h)		;b17f
L_B182:
	ld (0d4f4h),a		;b182
L_B185:
	call L_B284		;b185
	xor a			;b188
	ld (0ca18h),a		;b189   ; guarda la espera hasta poner la musica pendiente
	ld h,a			;b18c
	ld l,a			;b18d
	ld (0ca19h),hl		;b18e   ; guarda la musica pendiente: la rutina que la pide (16 bits)
	ld (0d425h),a		;b191
	ld a,(0d416h)		;b194   ; lee cuantos actores han llegado con la alerta
	ld (0d426h),a		;b197   ; guarda cuantos actores hay de los que llegan
	ld a,(0ca4bh)		;b19a   ; lee la sala de la zona
	ld c,a			;b19d
	ld a,(0ca4ah)		;b19e   ; lee la zona
	ld b,a			;b1a1
	cp 007h		;b1a2
	jr nz,L_B1AF		;b1a4
	ld a,c			;b1a6
	cp 009h		;b1a7
	jr z,L_B208		;b1a9
	cp 00ch		;b1ab
	jr z,L_B208		;b1ad
L_B1AF:
	ld a,b			;b1af
	cp 00ah		;b1b0
	jr nz,L_B1B9		;b1b2
	ld a,c			;b1b4
	cp 015h		;b1b5
	jr z,L_B208		;b1b7
L_B1B9:
	ld a,b			;b1b9
	dec a			;b1ba
	jr nz,L_B1C2		;b1bb
	ld a,c			;b1bd
	cp 016h		;b1be
	jr z,L_B208		;b1c0
L_B1C2:
	ld a,b			;b1c2
	cp 003h		;b1c3
	jr nz,L_B1D7		;b1c5
	ld a,c			;b1c7
	and a			;b1c8
	jr z,L_B208		;b1c9
	cp 005h		;b1cb
	jr z,L_B208		;b1cd
	cp 00ch		;b1cf
	jr z,L_B208		;b1d1
	cp 010h		;b1d3
	jr z,L_B208		;b1d5
L_B1D7:
	ld a,b			;b1d7
	cp 004h		;b1d8
	jr nz,L_B1E1		;b1da
	ld a,c			;b1dc
	cp 006h		;b1dd
	jr z,L_B208		;b1df
L_B1E1:
	ld a,b			;b1e1
	cp 00bh		;b1e2
	jr nz,L_B1EB		;b1e4
	ld a,c			;b1e6
	cp 002h		;b1e7
	jr z,L_B208		;b1e9
L_B1EB:
	ld b,002h		;b1eb
	ld a,(0ca76h)		;b1ed   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 002h		;b1f0
	jr z,L_B208		;b1f2
	cp 00dh		;b1f4
	jr z,L_B208		;b1f6
	cp 018h		;b1f8
	jr z,L_B208		;b1fa
	cp 02eh		;b1fc
	jr z,L_B208		;b1fe
	cp 031h		;b200
	jr z,L_B208		;b202
	cp 032h		;b204
	jr nz,L_B20A		;b206
L_B208:
	ld b,003h		;b208
L_B20A:
	ld a,b			;b20a
	ld (0ca5fh),a		;b20b   ; guarda la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	call L_B233		;b20e
	jp 09814h		;b211   ; marcador_de_alerta_bancos_14:
L_B214:
	ld hl,0d300h		;b214   ; apunta a las 4 fichas de actor de los que llegan con la alerta (los actores 20-23)
	ld b,004h		;b217
L_B219:
	push bc			;b219
	push hl			;b21a
	ld a,(hl)			;b21b
	cp 015h		;b21c
	jr z,L_B22A		;b21e
	cp 010h		;b220
	jr c,L_B22A		;b222
	ld bc,0003fh		;b224
	call 04236h		;b227   ; borra_bloque: pone a cero BC + 1 bytes desde HL
L_B22A:
	pop hl			;b22a
	ld bc,00040h		;b22b
	add hl,bc			;b22e
	pop bc			;b22f
	djnz L_B219		;b230
	ret			;b232
L_B233:
	ld a,(0cab5h)		;b233   ; lee el nivel de Snake: la barra de vida llena mide 0x20 + 8 por nivel
	and 007h		;b236
	ld hl,0b261h		;b238
	call 0423eh		;b23b   ; suma_a_hl: HL = HL + A
	ld c,(hl)			;b23e
	push ix		;b23f
	ld ix,0ce00h		;b241   ; apunta a los actores: 24 fichas de 0x40 bytes (p04:800D)
	ld b,018h		;b245
L_B247:
	ld a,(ix+000h)		;b247   ; lee el tipo del actor (0 = libre)
	and a			;b24a
	jr z,L_B253		;b24b
	call 08100h		;b24d   ; en_esta_sala: Z si el actor esta en la sala de ahora (fila y columna)
	jr nz,L_B253		;b250
	inc c			;b252
L_B253:
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


L_B269:
	ld ix,0d460h		;b269   ; apunta a 6 fichas de 16 bytes de lo que lanzan los actores (p04:9B55)
	ld b,006h		;b26d
L_B26F:
	ld a,(ix+000h)		;b26f   ; lee el tipo de lo lanzado
	and a			;b272
	jr z,L_B27C		;b273
	push bc			;b275
	push bc			;b276
	call 09ca1h		;b277   ; p04:9CA1
	pop bc			;b27a
	pop bc			;b27b
L_B27C:
	ld de,00010h		;b27c
	add ix,de		;b27f
	djnz L_B26F		;b281
	ret			;b283
L_B284:
	push ix		;b284
	xor a			;b286
	ld (0d416h),a		;b287   ; guarda cuantos actores han llegado con la alerta
	ld (0d451h),a		;b28a
	call L_B269		;b28d
	ld ix,0ce00h		;b290   ; apunta a los actores: 24 fichas de 0x40 bytes (p04:800D)
	ld b,018h		;b294
L_B296:
	ld a,(ix+000h)		;b296   ; lee el tipo del actor (0 = libre)
	and a			;b299
	push hl			;b29a
	push bc			;b29b
	call nz,L_B2AB		;b29c
	pop bc			;b29f
	pop hl			;b2a0
	ld de,00040h		;b2a1
	add ix,de		;b2a4
	djnz L_B296		;b2a6
	pop ix		;b2a8
	ret			;b2aa
L_B2AB:
	and 07fh		;b2ab
	cp 00ah		;b2ad
	jp z,L_B318		;b2af
	cp 00bh		;b2b2
	jr z,$+29		;b2b4
	cp 010h		;b2b6
	jr c,$+30		;b2b8
	sub 010h		;b2ba
	call 0424dh		;b2bc   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_B2BF: 9 destinos del despachador p00:424D (call en p14:B2BC, el
;   indice en A): B317, B317, B317, B317, B317, B32C, B317, B317, B317; lo
;   leen p14:B2BC (18 bytes)
;   0xb2bf..0xb2d1  (18 bytes)
DATA_tabla_B2BF:
	defw 0b317h,0b317h,0b317h,0b317h,0b317h,0b32ch,0b317h,0b317h	; b2bf
	defw 0b317h	; b2cf  -> L_B317

; ======================================================================
; CODIGO 0xb2d1..0xb4a4  (467 bytes)
; ======================================================================


L_B2D1:
	ld (ix+001h),007h		;b2d1
	ret			;b2d5
L_B2D6:
	ld a,(0ca5fh)		;b2d6   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	and a			;b2d9
	jr nz,L_B2E8		;b2da
	ld a,(ix+00dh)		;b2dc
	ld (ix+017h),a		;b2df
	ld a,(ix+00ch)		;b2e2
	ld (ix+016h),a		;b2e5
L_B2E8:
	ld (ix+00ch),000h		;b2e8
	call 0806fh		;b2ec   ; se_ve_el_actor_si: p14:B9DC guardando HL, DE y BC
	jr c,L_B2F6		;b2ef
	call 08100h		;b2f1   ; en_esta_sala: Z si el actor esta en la sala de ahora (fila y columna)
	jr z,L_B2FB		;b2f4
L_B2F6:
	set 7,(ix+000h)		;b2f6
	ret			;b2fa
L_B2FB:
	res 7,(ix+000h)		;b2fb
	ld (ix+001h),000h		;b2ff
	ld hl,0d416h		;b303   ; apunta a cuantos actores han llegado con la alerta
	inc (hl)			;b306
	ld (ix+01ch),004h		;b307
	ld a,(ix+000h)		;b30b
	sub 002h		;b30e
	cp 002h		;b310
	ret c			;b312
	ld (ix+000h),001h		;b313
L_B317:
	ret			;b317
L_B318:
	call 08100h		;b318   ; en_esta_sala: Z si el actor esta en la sala de ahora (fila y columna)
	ld a,004h		;b31b
	jr nz,L_B320		;b31d
	inc a			;b31f
L_B320:
	ld (ix+001h),a		;b320
	call 08100h		;b323   ; en_esta_sala: Z si el actor esta en la sala de ahora (fila y columna)
	ret nz			;b326
	ld hl,0d416h		;b327   ; apunta a cuantos actores han llegado con la alerta
	inc (hl)			;b32a
	ret			;b32b
L_B32C:
	ld a,(ix+001h)		;b32c
	cp 003h		;b32f
	ret nc			;b331
	ld (ix+028h),a		;b332
	ld a,(ix+00ch)		;b335
	ld (ix+016h),a		;b338
	ld a,(ix+00dh)		;b33b
	ld (ix+017h),a		;b33e
	ld (ix+001h),003h		;b341
	call 08100h		;b345   ; en_esta_sala: Z si el actor esta en la sala de ahora (fila y columna)
	ret nz			;b348
	call 08273h		;b349   ; lista_de_sprites: DE = IX + 0x2E: la lista de sprites del actor
	call 080f3h		;b34c   ; a_p14_ba17_guarda: p14:BA17 guardando el banco de 0xA000
L_B34F:
	ld a,(ix+00dh)		;b34f
	add a,a			;b352
	add a,a			;b353
	add a,a			;b354
	add a,a			;b355
	add a,028h		;b356
	ld h,a			;b358
	ld l,0b0h		;b359
	ld a,(ix+005h)		;b35b
	sub 008h		;b35e
	ld d,a			;b360
	ld a,(ix+003h)		;b361
	sub 00fh		;b364
	ld e,a			;b366
	ld bc,01010h		;b367
	ld a,(0ca42h)		;b36a   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	and a			;b36d
	ld a,0c8h		;b36e
	jr z,L_B374		;b370
	ld a,0d8h		;b372
L_B374:
	jp 047edh		;b374   ; copia_rectangulo_logica: orden LMMM del VDP con la operacion logica de A
L_B377:
	ld ix,0ce00h		;b377   ; apunta a los actores: 24 fichas de 0x40 bytes (p04:800D)
	ld b,018h		;b37b
L_B37D:
	ld a,(ix+000h)		;b37d   ; lee el tipo del actor (0 = libre)
	cp 015h		;b380
	jr nz,L_B391		;b382
	call 08100h		;b384   ; en_esta_sala: Z si el actor esta en la sala de ahora (fila y columna)
	jr nz,L_B391		;b387
	ld a,(ix+001h)		;b389   ; lee el paso del actor
	cp 003h		;b38c
	call z,L_B34F		;b38e
L_B391:
	ld de,00040h		;b391
	add ix,de		;b394
	djnz L_B37D		;b396
	ret			;b398
L_B399:
	ld a,(ix+019h)		;b399
	cp 005h		;b39c
	ret z			;b39e
	ld a,(0ca4bh)		;b39f   ; lee la sala de la zona
	cp 00ch		;b3a2
	jr z,L_B3CA		;b3a4
	call 06b99h		;b3a6   ; sonido_8c: pide el sonido 0x8C (de los que tienen la partitura en un banco de musica, p16:4CE3) (antes, L_6CDA)
	ld a,005h		;b3a9
	ld (ix+019h),a		;b3ab
	ld a,(ix+001h)		;b3ae
	dec a			;b3b1
	jr z,L_B3C1		;b3b2
	ld (ix+00eh),001h		;b3b4
	cp 008h		;b3b8
	ret nz			;b3ba
	ld a,(ix+015h)		;b3bb
	ld (ix+00dh),a		;b3be
L_B3C1:
	ld a,(ix+00dh)		;b3c1
	rra			;b3c4
	and 003h		;b3c5
	jp 08e2ah		;b3c7   ; a_p06_b592_bancos_14:
L_B3CA:
	ld a,(ix+000h)		;b3ca
	and 07fh		;b3cd
	cp 00ah		;b3cf
	jr z,L_B3DD		;b3d1
	sub 002h		;b3d3
	cp 002h		;b3d5
	ld a,002h		;b3d7
	jr c,L_B3DD		;b3d9
	ld a,001h		;b3db
L_B3DD:
	ld (ix+000h),a		;b3dd
	jp L_B15C		;b3e0
L_B3E3:
	ld a,(0cac9h)		;b3e3
	and a			;b3e6
	jp nz,L_B15C		;b3e7
	ld hl,01504h		;b3ea
	ld de,01604h		;b3ed
	ld b,017h		;b3f0
	jr L_B403		;b3f2
L_B3F4:
	ld a,(0cacah)		;b3f4
	and a			;b3f7
	jp nz,L_B15C		;b3f8
	ld hl,01804h		;b3fb
	ld de,01a06h		;b3fe
	ld b,019h		;b401
L_B403:
	push hl			;b403
	push de			;b404
	push bc			;b405
	call 06b99h		;b406   ; sonido_8c: pide el sonido 0x8C (de los que tienen la partitura en un banco de musica, p16:4CE3) (antes, L_6CDA)
	call L_B284		;b409
	ld a,003h		;b40c
	ld (0ca5fh),a		;b40e   ; guarda la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	call 09814h		;b411   ; marcador_de_alerta_bancos_14:
	pop bc			;b414
	pop de			;b415
	pop hl			;b416
	ld a,(ix+007h)		;b417
	and a			;b41a
	jr nz,L_B42D		;b41b
L_B41D:
	ld a,(ix+003h)		;b41d
	cp 060h		;b420
	jr c,L_B425		;b422
	ex de,hl			;b424
L_B425:
	ld (ix+001h),h		;b425
	ld (ix+00dh),l		;b428
	jr L_B3C1		;b42b
L_B42D:
	ld a,(ix+003h)		;b42d
	cp 0b0h		;b430
	jr nc,L_B41D		;b432
	ld (ix+001h),b		;b434
	ld (ix+00dh),002h		;b437
	jr L_B3C1		;b43b
L_B43D:
	ld a,(0cb0eh)		;b43d   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	dec a			;b440
	ret nz			;b441
	ld hl,0b4a4h		;b442
L_B445:
	ld a,(hl)			;b445
	cp 0ffh		;b446
	ret z			;b448
	push hl			;b449
	ld a,(0ca4ah)		;b44a   ; lee la zona
	cp (hl)			;b44d
	jr nz,L_B49C		;b44e
	inc hl			;b450
	ld a,(hl)			;b451
	cp 0ffh		;b452
	ld b,a			;b454
	ld a,(0ca4bh)		;b455   ; lee la sala de la zona
	jr nz,L_B45F		;b458
	ld b,00ch		;b45a
	ld a,(0ca76h)		;b45c   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
L_B45F:
	cp b			;b45f
	jr nz,L_B49C		;b460
	inc hl			;b462
	ld a,(0cb03h)		;b463   ; lee la Y de Snake
	cp (hl)			;b466
	jr c,L_B49C		;b467
	ld a,(hl)			;b469
	add a,014h		;b46a
	ld b,a			;b46c
	ld a,(0cb03h)		;b46d   ; lee la Y de Snake
	cp b			;b470
	jr nc,L_B49C		;b471
	inc hl			;b473
	ld a,(0cb05h)		;b474   ; lee la X de Snake
	cp (hl)			;b477
	jr c,L_B49C		;b478
	ld a,(hl)			;b47a
	add a,010h		;b47b
	ld b,a			;b47d
	ld a,(0cb05h)		;b47e   ; lee la X de Snake
	cp b			;b481
	jr nc,L_B49C		;b482
	inc hl			;b484
	ld e,(hl)			;b485
	pop hl			;b486
	ld hl,0cac9h		;b487
	ld d,000h		;b48a
	add hl,de			;b48c
	ld a,(hl)			;b48d
	xor 001h		;b48e
	ld (hl),a			;b490
	push af			;b491
	call 06c33h		;b492   ; sonido_46: pide el sonido 0x46
	pop af			;b495
	jp z,07b65h		;b496   ; a_p08_a187: p08:A187 con el banco 8 en 0xA000
	jp 07b6eh		;b499   ; a_p08_a13b: p08:A13B con el banco 8 en 0xA000
L_B49C:
	pop hl			;b49c
	ld a,005h		;b49d
	call 0423eh		;b49f   ; suma_a_hl: HL = HL + A
	jr L_B445		;b4a2

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


L_B4B9:
	xor a			;b4b9
	ld (0e230h),a		;b4ba
	ld a,(0ca76h)		;b4bd   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	or a			;b4c0
	ret nz			;b4c1
	ld a,(0ca65h)		;b4c2   ; lee el sitio de 0xCBE0 en el que esta Snake (0 = ninguno)
	or a			;b4c5
	ret nz			;b4c6
	ld a,(0ca5fh)		;b4c7   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	or a			;b4ca
	ret nz			;b4cb
	ld a,(0cb21h)		;b4cc   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	cp 002h		;b4cf
	ret z			;b4d1
	ld hl,0b4feh		;b4d2
L_B4D5:
	ld a,(hl)			;b4d5
	cp 0ffh		;b4d6
	ret z			;b4d8
	push hl			;b4d9
	call L_B4EA		;b4da
	pop hl			;b4dd
	ld a,(0e230h)		;b4de
	or a			;b4e1
	jr nz,$+57		;b4e2
	ld de,00004h		;b4e4
	add hl,de			;b4e7
	jr L_B4D5		;b4e8
L_B4EA:
	ld a,(0ca4ah)		;b4ea   ; lee la zona
	cp (hl)			;b4ed
	ret nz			;b4ee
	inc hl			;b4ef
	ld a,(0ca4bh)		;b4f0   ; lee la sala de la zona
	cp (hl)			;b4f3
	ret nz			;b4f4
	inc hl			;b4f5
	ld e,(hl)			;b4f6
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


L_B51B:
	call L_B527		;b51b
	call L_B539		;b51e
	call L_B61D		;b521
	jp 06af6h		;b524   ; sonido_38: pide el sonido 0x38
L_B527:
	ld hl,0e231h		;b527
	xor a			;b52a
	ld (hl),a			;b52b
	inc hl			;b52c
	ld (hl),002h		;b52d
	inc hl			;b52f
	ld (hl),e			;b530
	inc hl			;b531
	ld (hl),d			;b532
	inc hl			;b533
	ld (hl),004h		;b534
	inc hl			;b536
	ld (hl),a			;b537
	ret			;b538
L_B539:
	ld a,(0e233h)		;b539
	sub 030h		;b53c
	ld l,a			;b53e
	ld a,(0e234h)		;b53f
	sub 030h		;b542
	ld h,a			;b544
	ld b,062h		;b545
	ld c,b			;b547
	ld a,(0ca4ah)		;b548   ; lee la zona
	cp 00ch		;b54b
	jr nz,L_B553		;b54d
	ld c,0c4h		;b54f
	ld l,018h		;b551
L_B553:
	ld d,h			;b553
	ld e,l			;b554
	jp 0474dh		;b555   ; copia_rectangulo_a_esta: p00:4767 de la otra pagina (0xCA42 ^ 1) a la de 0xCA42
L_B558:
	ld a,(0ca76h)		;b558   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	or a			;b55b
	ret nz			;b55c
	ld a,(0ca65h)		;b55d   ; lee el sitio de 0xCBE0 en el que esta Snake (0 = ninguno)
	or a			;b560
	ret nz			;b561
	ld a,(0dfe8h)		;b562   ; lee 1 con lo de la zona 6 sala 0x10 (p11:A389; 0xDFE9 paso, 0xDFEA X)
	or a			;b565
	ret nz			;b566
	ld a,(0e230h)		;b567
	or a			;b56a
	ret z			;b56b
	ld hl,0e236h		;b56c
	ld a,(hl)			;b56f
	or a			;b570
	jr nz,L_B585		;b571
	ld a,(0cb21h)		;b573   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	cp 002h		;b576
	ret z			;b578
	ld a,(0ca73h)		;b579
	or a			;b57c
	jr nz,L_B589		;b57d
	call L_B5A3		;b57f
	jp L_B648		;b582
L_B585:
	ld (hl),000h		;b585
	jr L_B539		;b587
L_B589:
	ld hl,0ca74h		;b589
	dec (hl)			;b58c
	ret nz			;b58d
	ld a,030h		;b58e
	ld (0e235h),a		;b590
	call L_B60F		;b593
	xor a			;b596
	ld (0ca73h),a		;b597
	ld (0e230h),a		;b59a
	call 07b76h		;b59d   ; sonido_8e_y_9955_bancos_14:
	jp 08f00h		;b5a0   ; sprites_de_sala_si_b_14: sprites_de_sala_si y deja el banco 14
L_B5A3:
	ld a,(0e231h)		;b5a3
	dec a			;b5a6
	jr z,L_B5CB		;b5a7
	dec a			;b5a9
	jr z,L_B5F7		;b5aa
	ld hl,0e232h		;b5ac
	dec (hl)			;b5af
	ret nz			;b5b0
	ld (hl),002h		;b5b1
	ld a,(0e235h)		;b5b3
	add a,008h		;b5b6
	ld (0e235h),a		;b5b8
	cp 031h		;b5bb
	jr nc,L_B5C1		;b5bd
	jr L_B61D		;b5bf
L_B5C1:
	ld a,004h		;b5c1
	ld (0e235h),a		;b5c3
	ld hl,0e231h		;b5c6
	inc (hl)			;b5c9
	ret			;b5ca
L_B5CB:
	ld hl,0e232h		;b5cb
	dec (hl)			;b5ce
	ret nz			;b5cf
	ld (hl),002h		;b5d0
	ld a,(0e235h)		;b5d2
	add a,008h		;b5d5
	ld (0e235h),a		;b5d7
	cp 031h		;b5da
	jr nc,L_B5E0		;b5dc
	jr L_B60F		;b5de
L_B5E0:
	call L_B5C1		;b5e0
	ld a,030h		;b5e3
	ld (0e232h),a		;b5e5
	ld a,(0ca4ah)		;b5e8   ; lee la zona
	cp 00ch		;b5eb
	ret nz			;b5ed
	ld a,(0e233h)		;b5ee
	xor 0c0h		;b5f1
	ld (0e233h),a		;b5f3
	ret			;b5f6
L_B5F7:
	ld hl,0e232h		;b5f7
	ld a,(0ca4ah)		;b5fa   ; lee la zona
	cp 00ch		;b5fd
	jr z,L_B603		;b5ff
	dec (hl)			;b601
	ret nz			;b602
L_B603:
	ld (hl),002h		;b603
	xor a			;b605
	ld (0e231h),a		;b606
	call L_B61D		;b609
	jp 06af6h		;b60c   ; sonido_38: pide el sonido 0x38
L_B60F:
	call L_B62C		;b60f
	ld d,h			;b612
	ld e,l			;b613
	ld a,b			;b614
	add a,a			;b615
	add a,002h		;b616
	ld b,a			;b618
	ld c,a			;b619
	jp 0475ah		;b61a   ; copia_rectangulo_a_la_otra: p00:4767 de la pagina 0xCA42 a la otra
L_B61D:
	call L_B62C		;b61d
	ld a,b			;b620
	add a,a			;b621
	ld d,a			;b622
	ld e,a			;b623
	ld c,00ah		;b624
	ld a,(0ca42h)		;b626   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	jp 046bch		;b629   ; marco: cuatro lineas: un marco de D x E desde HL
L_B62C:
	ld a,(0e235h)		;b62c
	ld b,a			;b62f
	ld a,(0e233h)		;b630
	sub b			;b633
	ld l,a			;b634
	ld a,(0e234h)		;b635
	sub b			;b638
	ld h,a			;b639
	ret			;b63a
L_B63B:
	ld a,030h		;b63b
	ld (0e235h),a		;b63d
	call L_B60F		;b640
	xor a			;b643
	ld (0e230h),a		;b644
	ret			;b647
L_B648:
	ld a,(0ca5fh)		;b648   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	or a			;b64b
	jr nz,L_B63B		;b64c
	ld a,(0e231h)		;b64e
	cp 002h		;b651
	ret z			;b653
	call L_B687		;b654
	ld a,(0ca73h)		;b657
	or a			;b65a
	ret nz			;b65b
	call L_B6B8		;b65c
	ld c,a			;b65f
	ld a,(0cb03h)		;b660   ; lee la Y de Snake
	sub 008h		;b663
	ld e,a			;b665
	ld a,(0cb05h)		;b666   ; lee la X de Snake
	ld d,a			;b669
	ld a,(0e233h)		;b66a
	sub e			;b66d
	jr nc,L_B672		;b66e
	neg		;b670
L_B672:
	cp c			;b672
	ret nc			;b673
	ld a,(0e234h)		;b674
	sub d			;b677
	jr nc,L_B67C		;b678
	neg		;b67a
L_B67C:
	cp c			;b67c
	ret nc			;b67d
L_B67E:
	ld hl,0ca73h		;b67e
	ld (hl),001h		;b681
	inc hl			;b683
	ld (hl),004h		;b684
	ret			;b686
L_B687:
	ld a,(0cb80h)		;b687   ; lee las 6 fichas de 16 bytes de lo que lanza Snake ([tipo][..][Y 8.8][X 8.8][velocidades]...)
	cp 008h		;b68a
	jr z,L_B691		;b68c
	cp 006h		;b68e
	ret nz			;b690
L_B691:
	call L_B6B8		;b691
	ld c,a			;b694
	ld hl,0cb83h		;b695
	ld a,(hl)			;b698
	sub 008h		;b699
	ld e,a			;b69b
	inc hl			;b69c
	inc hl			;b69d
	ld a,(hl)			;b69e
	add a,010h		;b69f
	ld d,a			;b6a1
	ld a,(0e233h)		;b6a2
	sub e			;b6a5
	jr nc,L_B6AA		;b6a6
	neg		;b6a8
L_B6AA:
	cp c			;b6aa
	ret nc			;b6ab
	ld a,(0e234h)		;b6ac
	sub d			;b6af
	jr nc,L_B6B4		;b6b0
	neg		;b6b2
L_B6B4:
	cp c			;b6b4
	ret nc			;b6b5
	jr L_B67E		;b6b6
L_B6B8:
	ld a,(0e231h)		;b6b8
	dec a			;b6bb
	ld a,030h		;b6bc
	ret z			;b6be
	ld a,(0e235h)		;b6bf
	ret			;b6c2
L_B6C3:
	xor a			;b6c3
	ld (0ca68h),a		;b6c4   ; guarda 1 si la sala tiene ficha en la lista de p02:877F
	ld hl,0d7e2h		;b6c7
	res 1,(hl)		;b6ca
	call L_B709		;b6cc
	ld a,(0ca5fh)		;b6cf   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	or a			;b6d2
	ret nz			;b6d3
	ld a,(0ca76h)		;b6d4   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	or a			;b6d7
	jr nz,L_B6ED		;b6d8
	ld a,(0ca4ah)		;b6da   ; lee la zona
	ld hl,0a512h		;b6dd
	cp 003h		;b6e0
	ret nz			;b6e2
L_B6E3:
	call 0876bh		;b6e3   ; fichas_e280_de_sala: la lista de p56 de HL: la ficha de la sala, y sus piezas a 0xE280
	ld hl,0d7e2h		;b6e6
	set 1,(hl)		;b6e9
	jr L_B712		;b6eb
L_B6ED:
	cp 00dh		;b6ed
	ld hl,0a533h		;b6ef
	jr z,L_B6E3		;b6f2
	cp 031h		;b6f4
	ret nz			;b6f6
	ld a,(0ca51h)		;b6f7   ; lee la columna de la sala en la zona (uno mas al salir por la derecha)
	cp 007h		;b6fa
	ret z			;b6fc
	cp 006h		;b6fd
	ld hl,0a525h		;b6ff
	jr z,L_B6E3		;b702
	ld hl,0a52ch		;b704
	jr L_B6E3		;b707
L_B709:
	ld hl,0e280h		;b709
	ld bc,0003fh		;b70c
	jp 04236h		;b70f   ; borra_bloque: pone a cero BC + 1 bytes desde HL
L_B712:
	ld a,(0cb21h)		;b712   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	dec a			;b715
	ret nz			;b716
	ld ix,0e280h		;b717
	ld b,008h		;b71b
L_B71D:
	ld a,(ix+000h)		;b71d
	or a			;b720
	ret z			;b721
	push bc			;b722
	call L_B72F		;b723
	pop bc			;b726
	ld de,00008h		;b727
	add ix,de		;b72a
	djnz L_B71D		;b72c
	ret			;b72e
L_B72F:
	call L_B74F		;b72f
	call 0474dh		;b732   ; copia_rectangulo_a_esta: p00:4767 de la otra pagina (0xCA42 ^ 1) a la de 0xCA42
	ld l,(ix+003h)		;b735
	ld h,(ix+004h)		;b738
	ld c,00ah		;b73b
	ld a,(ix+005h)		;b73d
	cp 003h		;b740
	ld b,a			;b742
	ld a,(0ca42h)		;b743   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	jp nc,04680h		;b746   ; linea_vertical: orden LINE del VDP con el lado largo en Y (ARG = 1)
	ld b,(ix+006h)		;b749
	jp 0467ch		;b74c   ; linea_horizontal: orden LINE del VDP (R#36-R#46) con el lado largo en X
L_B74F:
	ld l,(ix+003h)		;b74f
	ld h,(ix+004h)		;b752
	ld c,(ix+005h)		;b755
	inc c			;b758
	ld b,(ix+006h)		;b759
	inc b			;b75c
	inc b			;b75d
	ld e,l			;b75e
	ld d,h			;b75f
	ret			;b760
L_B761:
	ld a,(0ca68h)		;b761   ; lee 1 si la sala tiene ficha en la lista de p02:877F
	or a			;b764
	ret z			;b765
	ld a,(0ca5fh)		;b766   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	or a			;b769
	jr nz,L_B795		;b76a
	call L_B7C5		;b76c
	ld hl,0ca69h		;b76f   ; apunta a el quinto byte de la ficha de la sala (p02:877F)
	dec (hl)			;b772
	ret nz			;b773
	ld (hl),020h		;b774
	call L_B7A5		;b776
	call L_B709		;b779
	call L_B78C		;b77c
	ld hl,0ca6bh		;b77f   ; apunta a los bytes 1-4 de la ficha de la sala (p02:877F)
	call 0423eh		;b782   ; suma_a_hl: HL = HL + A
	ld a,(hl)			;b785
	call 08777h		;b786   ; fichas_e280_a: las piezas A de p56:A53A a 0xE280
	jp L_B712		;b789
L_B78C:
	ld hl,0ca6ah		;b78c   ; apunta a a cero al encontrar la ficha de la sala
	ld a,(hl)			;b78f
	inc a			;b790
	and 003h		;b791
	ld (hl),a			;b793
	ret			;b794
L_B795:
	call L_B7A5		;b795
	call L_B709		;b798
	xor a			;b79b
	ld (0ca68h),a		;b79c   ; guarda 1 si la sala tiene ficha en la lista de p02:877F
	ld hl,0ca69h		;b79f   ; apunta a el quinto byte de la ficha de la sala (p02:877F)
	ld (hl),001h		;b7a2
	ret			;b7a4
L_B7A5:
	ld a,(0cb21h)		;b7a5   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	dec a			;b7a8
	ret nz			;b7a9
	ld ix,0e280h		;b7aa
	ld b,008h		;b7ae
L_B7B0:
	ld a,(ix+000h)		;b7b0
	or a			;b7b3
	ret z			;b7b4
	push bc			;b7b5
	call L_B74F		;b7b6
	call 0475ah		;b7b9   ; copia_rectangulo_a_la_otra: p00:4767 de la pagina 0xCA42 a la otra
	pop bc			;b7bc
	ld de,00008h		;b7bd
	add ix,de		;b7c0
	djnz L_B7B0		;b7c2
	ret			;b7c4
L_B7C5:
	ld a,(0ca5fh)		;b7c5   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	or a			;b7c8
	ret nz			;b7c9
	ld a,(0ca41h)		;b7ca   ; lee la salida de la sala (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	or a			;b7cd
	ret nz			;b7ce
	ld ix,0e280h		;b7cf
	ld b,008h		;b7d3
L_B7D5:
	ld a,(0ca5fh)		;b7d5   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	or a			;b7d8
	ret nz			;b7d9
	ld a,(ix+000h)		;b7da
	or a			;b7dd
	ret z			;b7de
	push bc			;b7df
	call L_B80C		;b7e0
	call L_B7EF		;b7e3
	pop bc			;b7e6
	ld de,00008h		;b7e7
	add ix,de		;b7ea
	djnz L_B7D5		;b7ec
	ret			;b7ee
L_B7EF:
	ld a,(0cb80h)		;b7ef   ; lee las 6 fichas de 16 bytes de lo que lanza Snake ([tipo][..][Y 8.8][X 8.8][velocidades]...)
	cp 008h		;b7f2
	jr z,L_B7F9		;b7f4
	cp 006h		;b7f6
	ret nz			;b7f8
L_B7F9:
	ld hl,0cb83h		;b7f9
	ld a,(hl)			;b7fc
	inc hl			;b7fd
	inc hl			;b7fe
	add a,010h		;b7ff
	ld e,a			;b801
	ld a,(hl)			;b802
	add a,010h		;b803
	ld d,a			;b805
	ld b,010h		;b806
	ld c,010h		;b808
	jr L_B81A		;b80a
L_B80C:
	ld a,(0cb05h)		;b80c   ; lee la X de Snake
	add a,006h		;b80f
	ld d,a			;b811
	ld a,(0cb03h)		;b812   ; lee la Y de Snake
	ld e,a			;b815
	ld b,00ch		;b816
	ld c,018h		;b818
L_B81A:
	ld l,(ix+003h)		;b81a
	ld h,(ix+004h)		;b81d
	ld a,e			;b820
	cp l			;b821
	ret c			;b822
	ld a,d			;b823
	cp h			;b824
	ret c			;b825
	ld a,l			;b826
	add a,(ix+005h)		;b827
	ld l,a			;b82a
	ld a,h			;b82b
	add a,(ix+006h)		;b82c
	ld h,a			;b82f
	ld a,d			;b830
	sub b			;b831
	ld d,a			;b832
	ld a,e			;b833
	sub c			;b834
	ld e,a			;b835
	ld a,l			;b836
	cp e			;b837
	ret c			;b838
	ld a,h			;b839
	cp d			;b83a
	ret c			;b83b
	call 07b76h		;b83c   ; sonido_8e_y_9955_bancos_14:
	jp 08f00h		;b83f   ; sprites_de_sala_si_b_14: sprites_de_sala_si y deja el banco 14
L_B842:
	ld a,(ix+000h)		;b842
	and 07fh		;b845
	ld hl,0b88bh		;b847
	cp 015h		;b84a
	jr z,L_B863		;b84c
	cp 010h		;b84e
	jr z,L_B86B		;b850
	ld hl,0b87eh		;b852
	cp 00bh		;b855
	jr z,L_B863		;b857
	ld hl,0b885h		;b859
	cp 00ah		;b85c
	jr z,L_B863		;b85e
	ld hl,0b86eh		;b860
L_B863:
	ld a,(ix+00dh)		;b863
	call 0423eh		;b866   ; suma_a_hl: HL = HL + A
	ld a,(hl)			;b869
	ret			;b86a
L_B86B:
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


L_B88F:
	ld a,(ix+000h)		;b88f
	ld d,a			;b892
	cp 014h		;b893
	ld b,002h		;b895
	jr z,L_B89B		;b897
	ld b,010h		;b899
L_B89B:
	ld a,(ix+003h)		;b89b
	cp b			;b89e
	jr c,L_B8EC		;b89f
	cp 0c0h		;b8a1
	jr nc,L_B8D9		;b8a3
	ld a,(ix+000h)		;b8a5
	cp 014h		;b8a8
	ld bc,009b9h		;b8aa
	jr nz,L_B8B2		;b8ad
	ld bc,002c0h		;b8af
L_B8B2:
	ld a,(ix+005h)		;b8b2
	cp b			;b8b5
	jr c,L_B8CD		;b8b6
	cp c			;b8b8
	ret c			;b8b9
	ld a,d			;b8ba
	cp 014h		;b8bb
	jr nz,L_B8C1		;b8bd
	ld b,000h		;b8bf
L_B8C1:
	ld (ix+005h),b		;b8c1
	ld (ix+004h),000h		;b8c4
	inc (ix+00bh)		;b8c8
	jr L_B8F7		;b8cb
L_B8CD:
	ld (ix+005h),c		;b8cd
	ld (ix+004h),000h		;b8d0
	dec (ix+00bh)		;b8d4
	jr L_B8F7		;b8d7
L_B8D9:
	ld a,d			;b8d9
	cp 014h		;b8da
	jr nz,L_B8E0		;b8dc
	ld b,000h		;b8de
L_B8E0:
	ld (ix+003h),b		;b8e0
	ld (ix+002h),000h		;b8e3
	dec (ix+00ah)		;b8e7
	jr L_B8F7		;b8ea
L_B8EC:
	ld (ix+003h),0c0h		;b8ec
	ld (ix+002h),000h		;b8f0
	inc (ix+00ah)		;b8f4
L_B8F7:
	call 08273h		;b8f7   ; lista_de_sprites: DE = IX + 0x2E: la lista de sprites del actor
	ld a,(de)			;b8fa
	and a			;b8fb
	jr z,L_B927		;b8fc
	ld b,012h		;b8fe
L_B900:
	ld a,(de)			;b900
	push bc			;b901
	push de			;b902
	call L_B90F		;b903
	pop de			;b906
	xor a			;b907
	ld (de),a			;b908
	inc e			;b909
	pop bc			;b90a
	djnz L_B900		;b90b
	or a			;b90d
	ret			;b90e
L_B90F:
	and a			;b90f
	ret z			;b910
	dec a			;b911
	ld b,a			;b912
	ld hl,0d400h		;b913   ; apunta a los 22 sprites que se reparten los actores (1 = ocupado)
	call 0423eh		;b916   ; suma_a_hl: HL = HL + A
	xor a			;b919
	ld (hl),a			;b91a
	ld a,b			;b91b
	add a,a			;b91c
	add a,a			;b91d
	ld hl,0dc28h		;b91e
	call 0423eh		;b921   ; suma_a_hl: HL = HL + A
	ld (hl),0e0h		;b924
	ret			;b926
L_B927:
	call 08100h		;b927   ; en_esta_sala: Z si el actor esta en la sala de ahora (fila y columna)
	jr nz,L_B92F		;b92a
	call 081bfh		;b92c   ; pinta_actor_bancos_14:
L_B92F:
	or a			;b92f
	ret			;b930
L_B931:
	push ix		;b931
	pop hl			;b933
	ld de,0d300h		;b934   ; apunta a las 4 fichas de actor de los que llegan con la alerta (los actores 20-23)
	call 00020h		;b937   ; BIOS DCOMPR - Compares HL with DE
	ccf			;b93a
	ret nc			;b93b
	ld a,(0ca5fh)		;b93c   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	and a			;b93f
	ret z			;b940
	ld iy,0d500h		;b941   ; apunta a 8 fichas de 16 bytes [activa][..][Y][X][..][..][..][alto][ancho * 2] (p07:BC95)
	ld b,008h		;b945
L_B947:
	ld a,(iy+000h)		;b947
	and a			;b94a
	jr z,L_B95E		;b94b
	ld a,(iy+001h)		;b94d
	cp 002h		;b950
	jr nz,L_B95E		;b952
	ld d,(iy+003h)		;b954
	ld e,(iy+002h)		;b957
	call L_B967		;b95a
	ret c			;b95d
L_B95E:
	ld de,00010h		;b95e
	add iy,de		;b961
	djnz L_B947		;b963
	or a			;b965
	ret			;b966
L_B967:
	ld a,(iy+000h)		;b967
	ld hl,0b97bh		;b96a
	call 0423eh		;b96d   ; suma_a_hl: HL = HL + A
	ld a,(hl)			;b970
	call 0424dh		;b971   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_B974: 4 destinos del despachador p00:424D (call en p14:B971, el
;   indice en A): B991, B9A5, B9B2, B9C6; lo leen p14:B971 (8 bytes)
;   0xb974..0xb97c  (8 bytes)
DATA_tabla_B974:
	defw 0b991h,0b9a5h,0b9b2h,0b9c6h	; b974  -> L_B991 L_B9A5 L_B9B2 L_B9C6

; ----------------------------------------------------------------------
; DATOS sin identificar  0xb97c..0xb991  (21 bytes)
DATA_B97C:
	defb 000h,001h,002h,003h,000h,001h,000h,001h,000h,000h,000h,000h,000h,001h,001h,001h	; b97c  ................
	defb 000h,000h,000h,001h,000h	; b98c

; ======================================================================
; CODIGO 0xb991..0xbd35  (932 bytes)
; ======================================================================


L_B991:
	ld a,e			;b991
	add a,(iy+007h)		;b992
	sub (ix+003h)		;b995
	cp 008h		;b998
	ret nc			;b99a
L_B99B:
	ld a,d			;b99b
	add a,(iy+008h)		;b99c
	sub (ix+005h)		;b99f
	cp 020h		;b9a2
	ret			;b9a4
L_B9A5:
	ld a,e			;b9a5
	add a,004h		;b9a6
	sub (ix+003h)		;b9a8
	neg		;b9ab
	cp 008h		;b9ad
	ret nc			;b9af
	jr L_B99B		;b9b0
L_B9B2:
	ld a,e			;b9b2
	add a,018h		;b9b3
	sub (ix+003h)		;b9b5
	neg		;b9b8
	cp 020h		;b9ba
	ret nc			;b9bc
	ld a,d			;b9bd
	sub (ix+005h)		;b9be
	neg		;b9c1
	cp 00ch		;b9c3
	ret			;b9c5
L_B9C6:
	ld a,e			;b9c6
	add a,018h		;b9c7
	sub (ix+003h)		;b9c9
	neg		;b9cc
	cp 020h		;b9ce
	ret nc			;b9d0
	ld a,d			;b9d1
	sub 00ch		;b9d2
	sub (ix+005h)		;b9d4
	neg		;b9d7
	cp 00ch		;b9d9
	ret			;b9db
L_B9DC:
	ld a,(0ca76h)		;b9dc   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	ld b,a			;b9df
	cp 018h		;b9e0
	jr z,L_B9F0		;b9e2
	and a			;b9e4
	jr z,L_B9F0		;b9e5
	ld a,(ix+000h)		;b9e7
	and 07fh		;b9ea
	cp 009h		;b9ec
	jr z,L_BA13		;b9ee
L_B9F0:
	ld a,b			;b9f0
	and a			;b9f1
	ld c,001h		;b9f2
	jr nz,L_BA0D		;b9f4
	ld a,(0ca65h)		;b9f6   ; lee el sitio de 0xCBE0 en el que esta Snake (0 = ninguno)
	and a			;b9f9
	ld c,002h		;b9fa
	jr nz,L_BA0D		;b9fc
	ld a,(0ca77h)		;b9fe
	and a			;ba01
	ld c,003h		;ba02
	jr nz,L_BA0D		;ba04
	ld a,(ix+01bh)		;ba06
	and a			;ba09
	ret z			;ba0a
	scf			;ba0b
	ret			;ba0c
L_BA0D:
	ld a,(ix+01bh)		;ba0d
	sub c			;ba10
	jr z,L_BA15		;ba11
L_BA13:
	scf			;ba13
	ret			;ba14
L_BA15:
	or a			;ba15
	ret			;ba16
L_BA17:
	ld b,012h		;ba17
L_BA19:
	ld a,(de)			;ba19
	and a			;ba1a
	ret z			;ba1b
	dec a			;ba1c
	ld c,a			;ba1d
	add a,a			;ba1e
	add a,a			;ba1f
	ld hl,0dc28h		;ba20
	call 0423eh		;ba23   ; suma_a_hl: HL = HL + A
	ld (hl),0e0h		;ba26
	ld hl,0d400h		;ba28   ; apunta a los 22 sprites que se reparten los actores (1 = ocupado)
	ld a,c			;ba2b
	call 0423eh		;ba2c   ; suma_a_hl: HL = HL + A
	xor a			;ba2f
	ld (hl),a			;ba30
	ld (de),a			;ba31
	inc de			;ba32
	djnz L_BA19		;ba33
	ret			;ba35
L_BA36:
	rra			;ba36
	jr nc,L_BA4C		;ba37
	ld l,(ix+002h)		;ba39
	ld h,(ix+003h)		;ba3c
	ld e,(ix+006h)		;ba3f
	ld d,(ix+007h)		;ba42
	add hl,de			;ba45
	ld (ix+002h),l		;ba46
	ld (ix+003h),h		;ba49
L_BA4C:
	rra			;ba4c
	ret nc			;ba4d
	ld l,(ix+004h)		;ba4e
	ld h,(ix+005h)		;ba51
	ld e,(ix+008h)		;ba54
	ld d,(ix+009h)		;ba57
	add hl,de			;ba5a
	ld (ix+004h),l		;ba5b
	ld (ix+005h),h		;ba5e
	ret			;ba61
L_BA62:
	ld a,(0ca76h)		;ba62   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 002h		;ba65
	ret nz			;ba67
	ld hl,0caf6h		;ba68
	ld a,(hl)			;ba6b
	and a			;ba6c
	ret z			;ba6d
	dec a			;ba6e
	jr z,L_BA75		;ba6f
	dec a			;ba71
	jr z,L_BA84		;ba72
	ret			;ba74
L_BA75:
	call L_BA91		;ba75
	ret nz			;ba78
	inc (hl)			;ba79
	ld bc,000b4h		;ba7a
	ld (0caf7h),bc		;ba7d   ; guarda otra espera de 16 bits que baja en la interrupcion
	jp 06be4h		;ba81   ; orden_sonido_f4: la orden 0xF4 al sonido
L_BA84:
	call L_BA91		;ba84
	ret nz			;ba87
	ld a,001h		;ba88
	ld (0d443h),a		;ba8a
	inc (hl)			;ba8d
	jp 06abfh		;ba8e   ; sonido_82: pide el sonido 0x82 (de los que tienen la partitura en un banco de musica, p16:4CE3) (antes, L_6CDA)
L_BA91:
	ld bc,(0caf7h)		;ba91   ; lee otra espera de 16 bits que baja en la interrupcion
	ld a,b			;ba95
	or c			;ba96
	ret			;ba97
L_BA98:
	ld hl,0e900h		;ba98   ; apunta a los caracteres de un dibujo pasados a 4 bits
	ld bc,004ffh		;ba9b
	call 04236h		;ba9e   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	ld hl,0c7c0h		;baa1
	ld bc,0023fh		;baa4
	call 04236h		;baa7   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	ld a,(0ca03h)		;baaa   ; lee el contador de cuadros (uno mas en cada interrupcion)
	ld (0c7c1h),a		;baad
	call L_BE57		;bab0
	ld hl,(0d8e5h)		;bab3
	ld de,0c804h		;bab6
	or a			;bab9
	sbc hl,de		;baba
	ld a,l			;babc
	inc a			;babd
	ld (0c7c0h),a		;babe
	call L_BB33		;bac1
	ld hl,0c800h		;bac4
	ld a,(0c7c1h)		;bac7
	ld (hl),a			;baca
	inc hl			;bacb
	ld de,(0c7c2h)		;bacc
	ld (hl),d			;bad0
	inc hl			;bad1
	ld (hl),e			;bad2
	inc hl			;bad3
	ld a,(0c7c0h)		;bad4
	ld (hl),a			;bad7
	call L_BB1D		;bad8
	ld a,(0c7c0h)		;badb
	add a,004h		;bade
	ld c,a			;bae0
	ld de,0c800h		;bae1
	ld hl,0e900h		;bae4   ; apunta a los caracteres de un dibujo pasados a 4 bits
L_BAE7:
	ld b,008h		;bae7
	ld a,(de)			;bae9
L_BAEA:
	rl a		;baea
	rl (hl)		;baec
	inc hl			;baee
	djnz L_BAEA		;baef
	inc de			;baf1
	dec c			;baf2
	jr nz,L_BAE7		;baf3
	ld (hl),0ffh		;baf5
	ld de,0e900h		;baf7   ; apunta a los caracteres de un dibujo pasados a 4 bits
	ld hl,0c900h		;bafa
L_BAFD:
	ld b,006h		;bafd
L_BAFF:
	ld a,(de)			;baff
	inc a			;bb00
	jr z,L_BB0D		;bb01
	ld a,(de)			;bb03
	rra			;bb04
	rl (hl)		;bb05
	inc de			;bb07
	djnz L_BAFF		;bb08
	inc hl			;bb0a
	jr L_BAFD		;bb0b
L_BB0D:
	ld a,b			;bb0d
	cp 006h		;bb0e
	jr z,L_BB18		;bb10
L_BB12:
	or a			;bb12
	rl (hl)		;bb13
	djnz L_BB12		;bb15
	inc hl			;bb17
L_BB18:
	ld (hl),0ffh		;bb18
	jp L_BC7F		;bb1a
L_BB1D:
	ld hl,0c804h		;bb1d
	ld a,(0c7c0h)		;bb20
	ld b,a			;bb23
L_BB24:
	ld a,b			;bb24
	add a,a			;bb25
	add a,a			;bb26
	add a,a			;bb27
	ld c,a			;bb28
	ld a,(0c7c1h)		;bb29
	add a,c			;bb2c
	add a,(hl)			;bb2d
	ld (hl),a			;bb2e
	inc hl			;bb2f
	djnz L_BB24		;bb30
	ret			;bb32
L_BB33:
	call L_BB3A		;bb33
	ld (0c7c2h),hl		;bb36
	ret			;bb39
L_BB3A:
	ld hl,0c804h		;bb3a
	ld a,(0c7c0h)		;bb3d
	ld b,a			;bb40
	push hl			;bb41
	push bc			;bb42
	xor a			;bb43
L_BB44:
	add a,(hl)			;bb44
	inc hl			;bb45
	djnz L_BB44		;bb46
	pop bc			;bb48
	pop hl			;bb49
	push hl			;bb4a
	push bc			;bb4b
L_BB4C:
	add a,(hl)			;bb4c
	inc hl			;bb4d
	dec b			;bb4e
	jr z,L_BB54		;bb4f
	inc hl			;bb51
	djnz L_BB4C		;bb52
L_BB54:
	ld d,a			;bb54
	pop bc			;bb55
	pop hl			;bb56
	inc hl			;bb57
	push hl			;bb58
	push bc			;bb59
	xor a			;bb5a
L_BB5B:
	add a,(hl)			;bb5b
	inc hl			;bb5c
	dec b			;bb5d
	jr z,L_BB67		;bb5e
	inc hl			;bb60
	dec b			;bb61
	jr z,L_BB67		;bb62
	inc hl			;bb64
	djnz L_BB5B		;bb65
L_BB67:
	pop bc			;bb67
	pop hl			;bb68
L_BB69:
	add a,(hl)			;bb69
	inc hl			;bb6a
	dec b			;bb6b
	jr z,L_BB79		;bb6c
	inc hl			;bb6e
	dec b			;bb6f
	jr z,L_BB79		;bb70
	inc hl			;bb72
	dec b			;bb73
	jr z,L_BB79		;bb74
	inc hl			;bb76
	djnz L_BB69		;bb77
L_BB79:
	ld e,a			;bb79
	ex de,hl			;bb7a
	ret			;bb7b
L_BB7C:
	ld a,(hl)			;bb7c
	sub 010h		;bb7d
	jr nc,L_BBA6		;bb7f
	add a,0b0h		;bb81
	jr L_BBA6		;bb83
L_BB85:
	ld a,(hl)			;bb85
	add a,010h		;bb86
	cp 0b0h		;bb88
	jr c,L_BBA6		;bb8a
	sub 0b0h		;bb8c
	jr L_BBA6		;bb8e
L_BB90:
	ld a,(hl)			;bb90
	ld c,a			;bb91
	and 0f0h		;bb92
	ld b,a			;bb94
	ld a,c			;bb95
	dec a			;bb96
	and 00fh		;bb97
	or b			;bb99
	jr L_BBA6		;bb9a
L_BB9C:
	ld a,(hl)			;bb9c
	ld c,a			;bb9d
	and 0f0h		;bb9e
	ld b,a			;bba0
	ld a,c			;bba1
	inc a			;bba2
	and 00fh		;bba3
	or b			;bba5
L_BBA6:
	ld (hl),a			;bba6
L_BBA7:
	ld d,00bh		;bba7
	ld hl,01244h		;bba9
	ld bc,09c09h		;bbac
L_BBAF:
	ld a,(0ca42h)		;bbaf   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	call 046e6h		;bbb2   ; linea_horizontal_guarda: p00:467C guardando AF, HL, DE y BC
	ld a,l			;bbb5
	add a,00ch		;bbb6
	ld l,a			;bbb8
	dec d			;bbb9
	jr nz,L_BBAF		;bbba
	ld de,04412h		;bbbc
	ld a,(0c7c4h)		;bbbf
	call L_BBCE		;bbc2
	ld bc,0080ah		;bbc5
	ld a,(0ca42h)		;bbc8   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	jp 0467ch		;bbcb   ; linea_horizontal: orden LINE del VDP (R#36-R#46) con el lado largo en X
L_BBCE:
	ld c,a			;bbce
	and 0f0h		;bbcf
	rrca			;bbd1
	ld b,a			;bbd2
	rrca			;bbd3
	add a,b			;bbd4
	add a,d			;bbd5
	ld l,a			;bbd6
	ld a,c			;bbd7
	and 003h		;bbd8
	ld b,a			;bbda
	add a,a			;bbdb
	add a,a			;bbdc
	add a,a			;bbdd
	add a,b			;bbde
	ld b,a			;bbdf
	ld a,c			;bbe0
	and 00ch		;bbe1
	add a,a			;bbe3
	ld c,a			;bbe4
	add a,a			;bbe5
	add a,a			;bbe6
	add a,c			;bbe7
	add a,b			;bbe8
	add a,e			;bbe9
	ld h,a			;bbea
	ret			;bbeb
L_BBEC:
	ld hl,0c7c4h		;bbec
	ld a,(0ca07h)		;bbef   ; lee lo recien pulsado del mando (los bits de 0xCA08 que no estaban)
	rra			;bbf2
	jr c,L_BB7C		;bbf3
	rra			;bbf5
	jr c,L_BB85		;bbf6
	rra			;bbf8
	jr c,L_BB90		;bbf9
	rra			;bbfb
	jr c,L_BB9C		;bbfc
	rra			;bbfe
	jr c,L_BC43		;bbff
	ld a,(0ca09h)		;bc01   ; lee lo recien pulsado de las teclas de funcion (bits como 0xCA0A)
	and 020h		;bc04
	jp nz,L_BCD3		;bc06
	call L_BDC1		;bc09
	and a			;bc0c
	ret z			;bc0d
	ld hl,0c7c4h		;bc0e
	ld de,0c900h		;bc11
	ld b,a			;bc14
	inc a			;bc15
	jr nz,L_BC45		;bc16
	ld a,(hl)			;bc18
	dec a			;bc19
	cp 0ffh		;bc1a
	jr nz,L_BC20		;bc1c
	ld a,0afh		;bc1e
L_BC20:
	call 04243h		;bc20   ; suma_a_de: DE = DE + A
	ld a,(de)			;bc23
	ld c,a			;bc24
	sub 005h		;bc25
	cp 00fh		;bc27
	jr nc,L_BC2F		;bc29
	ld a,04eh		;bc2b
	jr L_BC37		;bc2d
L_BC2F:
	ld a,c			;bc2f
	sub 019h		;bc30
	cp 005h		;bc32
	ret nc			;bc34
	ld a,049h		;bc35
L_BC37:
	add a,c			;bc37
	ld b,a			;bc38
	dec (hl)			;bc39
	ld a,(hl)			;bc3a
	cp 0ffh		;bc3b
	jr nz,L_BC45		;bc3d
	ld (hl),0afh		;bc3f
	jr L_BC45		;bc41
L_BC43:
	ld b,078h		;bc43
L_BC45:
	ld a,(hl)			;bc45
	push af			;bc46
	inc (hl)			;bc47
	ld a,(hl)			;bc48
	cp 0b0h		;bc49
	jr c,L_BC4F		;bc4b
	ld (hl),000h		;bc4d
L_BC4F:
	pop af			;bc4f
	ld hl,0c900h		;bc50
	call 0423eh		;bc53   ; suma_a_hl: HL = HL + A
	ld a,b			;bc56
	cp 051h		;bc57
	jr c,L_BC5D		;bc59
	sub 002h		;bc5b
L_BC5D:
	sub 025h		;bc5d
	ld (hl),a			;bc5f
	call L_BBA7		;bc60
	ld de,03c12h		;bc63
	ld a,(0c7c4h)		;bc66
	dec a			;bc69
	cp 0ffh		;bc6a
	jr nz,L_BC70		;bc6c
	ld a,0afh		;bc6e
L_BC70:
	push af			;bc70
	call L_BBCE		;bc71
	ex de,hl			;bc74
	pop af			;bc75
	ld hl,0c900h		;bc76
	call 0423eh		;bc79   ; suma_a_hl: HL = HL + A
	jp L_BCB0		;bc7c
L_BC7F:
	ld hl,0c900h		;bc7f
	ld c,000h		;bc82
	ld de,0123ch		;bc84
L_BC87:
	ld a,(hl)			;bc87
	inc a			;bc88
	ret z			;bc89
	push bc			;bc8a
	push de			;bc8b
	push hl			;bc8c
	call L_BCB0		;bc8d
	pop hl			;bc90
	pop de			;bc91
	pop bc			;bc92
	inc c			;bc93
	ld a,c			;bc94
	cp 010h		;bc95
	jr nc,L_BCA5		;bc97
	and 003h		;bc99
	ld a,009h		;bc9b
	jr nz,L_BCA1		;bc9d
	ld a,00dh		;bc9f
L_BCA1:
	add a,d			;bca1
	ld d,a			;bca2
	jr L_BCAD		;bca3
L_BCA5:
	ld c,000h		;bca5
	ld d,012h		;bca7
	ld a,e			;bca9
	add a,00ch		;bcaa
	ld e,a			;bcac
L_BCAD:
	inc hl			;bcad
	jr L_BC87		;bcae
L_BCB0:
	push hl			;bcb0
	push de			;bcb1
	ld hl,05060h		;bcb2
	ld bc,00808h		;bcb5
	ld a,(0ca42h)		;bcb8   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	and a			;bcbb
	ld a,0c0h		;bcbc
	jr z,L_BCC2		;bcbe
	ld a,0d0h		;bcc0
L_BCC2:
	call 047edh		;bcc2   ; copia_rectangulo_logica: orden LMMM del VDP con la operacion logica de A
	pop de			;bcc5
	pop hl			;bcc6
	ld a,(hl)			;bcc7
	add a,025h		;bcc8
	cp 051h		;bcca
	jr c,L_BCD0		;bccc
	add a,002h		;bcce
L_BCD0:
	jp 049c1h		;bcd0   ; letra_transparente: la letra A de la pagina 3, con el 0 transparente, a la pagina en la que se dibuja
L_BCD3:
	call L_BD43		;bcd3
	jr c,L_BD1E		;bcd6
	ld de,0c900h		;bcd8
	ld hl,0e900h		;bcdb   ; apunta a los caracteres de un dibujo pasados a 4 bits
	ld c,000h		;bcde
L_BCE0:
	ld a,(de)			;bce0
	inc a			;bce1
	jr z,L_BCEF		;bce2
	ld a,(de)			;bce4
	cp 040h		;bce5
	jr nc,L_BCEC		;bce7
	ld (hl),a			;bce9
	inc hl			;bcea
	inc c			;bceb
L_BCEC:
	inc de			;bcec
	jr L_BCE0		;bced
L_BCEF:
	ld (hl),0ffh		;bcef
	inc c			;bcf1
	ld b,000h		;bcf2
	ld hl,0e900h		;bcf4   ; apunta a los caracteres de un dibujo pasados a 4 bits
	ld de,0c900h		;bcf7
	ldir		;bcfa
	ld hl,0e900h		;bcfc   ; apunta a los caracteres de un dibujo pasados a 4 bits
	ld bc,004ffh		;bcff
	call 04236h		;bd02   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	call L_BD54		;bd05
	call L_BD90		;bd08
	call L_BDB7		;bd0b
	jr nz,L_BD1E		;bd0e
	ld a,001h		;bd10
	ld (0c3a1h),a		;bd12   ; guarda el resultado del disco o del Game Master 2 (2 = error)
	ld de,0c804h		;bd15
	ld hl,0c700h		;bd18   ; apunta a copia de la zona, la sala especial, la Y y la X de Snake y 0xCA50-0xCA51 (6 bytes)
	jp 051e0h		;bd1b   ; rachas_a_ram: deshace las rachas de DE en HL (n < 0x80 repite, n > 0x80 copia, 0 acaba)
L_BD1E:
	call 05f4dh		;bd1e   ; sonido_3f: pide el sonido 0x3F
	ld a,002h		;bd21
	ld (0c3a1h),a		;bd23   ; guarda el resultado del disco o del Game Master 2 (2 = error)
	ld hl,03074h		;bd26
	ld bc,06010h		;bd29
	call 0603ch		;bd2c   ; pon_recuadro: un recuadro en HL (X, Y) de C x B: lleno del color 0x99 y con el marco de color 7
	ld hl,0bd35h		;bd2f
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


L_BD43:
	ld hl,0c900h		;bd43
	ld c,000h		;bd46
L_BD48:
	ld a,(hl)			;bd48
	inc a			;bd49
	jr z,L_BD50		;bd4a
	inc hl			;bd4c
	inc c			;bd4d
	jr L_BD48		;bd4e
L_BD50:
	ld a,c			;bd50
	cp 004h		;bd51
	ret			;bd53
L_BD54:
	ld de,0c900h		;bd54
	ld hl,0e900h		;bd57   ; apunta a los caracteres de un dibujo pasados a 4 bits
	ld c,000h		;bd5a
L_BD5C:
	ld a,(de)			;bd5c
	inc a			;bd5d
	jr z,L_BD6E		;bd5e
	ld a,(de)			;bd60
	rla			;bd61
	rla			;bd62
	ld b,006h		;bd63
L_BD65:
	rla			;bd65
	rl (hl)		;bd66
	inc hl			;bd68
	djnz L_BD65		;bd69
	inc de			;bd6b
	jr L_BD5C		;bd6c
L_BD6E:
	ld (hl),0ffh		;bd6e
	ld de,0e900h		;bd70   ; apunta a los caracteres de un dibujo pasados a 4 bits
	ld hl,0c800h		;bd73
L_BD76:
	ld b,008h		;bd76
L_BD78:
	ld a,(de)			;bd78
	inc a			;bd79
	jr z,L_BD86		;bd7a
	ld a,(de)			;bd7c
	rra			;bd7d
	rl (hl)		;bd7e
	inc de			;bd80
	djnz L_BD78		;bd81
	inc hl			;bd83
	jr L_BD76		;bd84
L_BD86:
	ld a,b			;bd86
	cp 008h		;bd87
	ret z			;bd89
L_BD8A:
	or a			;bd8a
	rl (hl)		;bd8b
	djnz L_BD8A		;bd8d
	ret			;bd8f
L_BD90:
	ld hl,0c800h		;bd90
	ld a,(hl)			;bd93
	ld (0c7c1h),a		;bd94
	inc hl			;bd97
	ld d,(hl)			;bd98
	inc hl			;bd99
	ld e,(hl)			;bd9a
	ld (0c7c2h),de		;bd9b
	inc hl			;bd9f
	ld a,(hl)			;bda0
	ld (0c7c0h),a		;bda1
	inc hl			;bda4
	ld b,a			;bda5
L_BDA6:
	ld a,b			;bda6
	add a,a			;bda7
	add a,a			;bda8
	add a,a			;bda9
	ld c,a			;bdaa
	ld a,(0c7c1h)		;bdab
	add a,c			;bdae
	ld c,a			;bdaf
	ld a,(hl)			;bdb0
	sub c			;bdb1
	ld (hl),a			;bdb2
	inc hl			;bdb3
	djnz L_BDA6		;bdb4
	ret			;bdb6
L_BDB7:
	call L_BB3A		;bdb7
	ld de,(0c7c2h)		;bdba
	jp 00020h		;bdbe   ; BIOS DCOMPR - Compares HL with DE
L_BDC1:
	ld hl,0c7e0h		;bdc1   ; apunta a lo recien pulsado de esas 6 filas
	ld bc,00600h		;bdc4
L_BDC7:
	ld a,(hl)			;bdc7
	and a			;bdc8
	jr nz,L_BDD1		;bdc9
	inc hl			;bdcb
	inc c			;bdcc
	djnz L_BDC7		;bdcd
	xor a			;bdcf
	ret			;bdd0
L_BDD1:
	ld b,a			;bdd1
	ld a,(0fcadh)		;bdd2
	and a			;bdd5
	ld hl,0be27h		;bdd6
	jr z,L_BDDE		;bdd9
	ld hl,0bdf7h		;bddb
L_BDDE:
	ld a,c			;bdde
	add a,a			;bddf
	add a,a			;bde0
	add a,a			;bde1
	call 0423eh		;bde2   ; suma_a_hl: HL = HL + A
	ld a,b			;bde5
	ld bc,00800h		;bde6
L_BDE9:
	rla			;bde9
	jr c,L_BDF1		;bdea
	inc c			;bdec
	djnz L_BDE9		;bded
	xor a			;bdef
	ret			;bdf0
L_BDF1:
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


L_BE57:
	ld hl,0d8e0h		;be57   ; apunta a de paso (en p00:4D5A: 1 = el juego de dibujos solo pinta las listas 6 y 7)
	ld bc,00006h		;be5a
	call 04236h		;be5d   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	ld hl,0c700h		;be60   ; apunta a copia de la zona, la sala especial, la Y y la X de Snake y 0xCA50-0xCA51 (6 bytes)
	ld de,0c773h		;be63
	ld (0d8e3h),de		;be66
	ld de,0c804h		;be6a
L_BE6D:
	ld a,081h		;be6d
	ld (0d8e0h),a		;be6f   ; guarda de paso (en p00:4D5A: 1 = el juego de dibujos solo pinta las listas 6 y 7)
	ld c,(hl)			;be72
	ld (0d8e1h),de		;be73
	inc de			;be77
	ld a,c			;be78
	ld (de),a			;be79
	inc hl			;be7a
	inc de			;be7b
	call L_BEF0		;be7c
	jp z,L_BF28		;be7f
	ld a,c			;be82
	cp (hl)			;be83
	jr z,L_BEC3		;be84
	ld a,001h		;be86
	ld (0d8e0h),a		;be88   ; guarda de paso (en p00:4D5A: 1 = el juego de dibujos solo pinta las listas 6 y 7)
L_BE8B:
	ld c,(hl)			;be8b
	inc hl			;be8c
	ld a,c			;be8d
	ld (de),a			;be8e
	inc de			;be8f
	call L_BEF0		;be90
	jp z,L_BF07		;be93
	cp (hl)			;be96
	jr nz,L_BEB6		;be97
	inc hl			;be99
	call L_BEF0		;be9a
	jr z,L_BEFC		;be9d
	cp (hl)			;be9f
	dec hl			;bea0
	jr nz,L_BEB6		;bea1
L_BEA3:
	dec hl			;bea3
	dec de			;bea4
	push hl			;bea5
	ld hl,(0d8e1h)		;bea6
	ld a,(0d8e0h)		;bea9   ; lee de paso (en p00:4D5A: 1 = el juego de dibujos solo pinta las listas 6 y 7)
	set 7,a		;beac
	ld (hl),a			;beae
	pop hl			;beaf
	ld (0d8e1h),de		;beb0
	jr L_BE6D		;beb4
L_BEB6:
	ld a,(0d8e0h)		;beb6   ; lee de paso (en p00:4D5A: 1 = el juego de dibujos solo pinta las listas 6 y 7)
	cp 07fh		;beb9
	jr z,L_BEA3		;bebb
	inc a			;bebd
	ld (0d8e0h),a		;bebe   ; guarda de paso (en p00:4D5A: 1 = el juego de dibujos solo pinta las listas 6 y 7)
	jr L_BE8B		;bec1
L_BEC3:
	ld a,002h		;bec3
	ld (0d8e0h),a		;bec5   ; guarda de paso (en p00:4D5A: 1 = el juego de dibujos solo pinta las listas 6 y 7)
L_BEC8:
	inc hl			;bec8
	call L_BEF0		;bec9
	jr z,L_BF28		;becc
	ld a,c			;bece
	cp (hl)			;becf
	jr z,L_BEE3		;bed0
L_BED2:
	ld de,(0d8e1h)		;bed2
	ld a,(0d8e0h)		;bed6   ; lee de paso (en p00:4D5A: 1 = el juego de dibujos solo pinta las listas 6 y 7)
	ld (de),a			;bed9
	inc de			;beda
	inc de			;bedb
	ld (0d8e1h),de		;bedc
	jp L_BE6D		;bee0
L_BEE3:
	ld a,(0d8e0h)		;bee3   ; lee de paso (en p00:4D5A: 1 = el juego de dibujos solo pinta las listas 6 y 7)
	cp 07fh		;bee6
	jr z,L_BED2		;bee8
	inc a			;beea
	ld (0d8e0h),a		;beeb   ; guarda de paso (en p00:4D5A: 1 = el juego de dibujos solo pinta las listas 6 y 7)
	jr L_BEC8		;beee
L_BEF0:
	push hl			;bef0
	push de			;bef1
	ld de,(0d8e3h)		;bef2
	and a			;bef6
	sbc hl,de		;bef7
	pop de			;bef9
	pop hl			;befa
	ret			;befb
L_BEFC:
	dec hl			;befc
	ld a,(hl)			;befd
	ld (de),a			;befe
	inc de			;beff
	ld a,(0d8e0h)		;bf00   ; lee de paso (en p00:4D5A: 1 = el juego de dibujos solo pinta las listas 6 y 7)
	inc a			;bf03
	ld (0d8e0h),a		;bf04   ; guarda de paso (en p00:4D5A: 1 = el juego de dibujos solo pinta las listas 6 y 7)
L_BF07:
	ld a,(0d8e0h)		;bf07   ; lee de paso (en p00:4D5A: 1 = el juego de dibujos solo pinta las listas 6 y 7)
	inc a			;bf0a
	set 7,a		;bf0b
	cp 080h		;bf0d
	jr nz,L_BF25		;bf0f
	ld hl,(0d8e1h)		;bf11
	ld (hl),0ffh		;bf14
	ex de,hl			;bf16
	dec hl			;bf17
	ld a,(hl)			;bf18
	ld (hl),081h		;bf19
	inc hl			;bf1b
	ld (hl),a			;bf1c
	inc hl			;bf1d
	ld (hl),000h		;bf1e
	ex de,hl			;bf20
	ld a,081h		;bf21
	jr L_BF31		;bf23
L_BF25:
	ld (0d8e0h),a		;bf25   ; guarda de paso (en p00:4D5A: 1 = el juego de dibujos solo pinta las listas 6 y 7)
L_BF28:
	xor a			;bf28
	ld (de),a			;bf29
	ld a,(0d8e0h)		;bf2a   ; lee de paso (en p00:4D5A: 1 = el juego de dibujos solo pinta las listas 6 y 7)
	ld hl,(0d8e1h)		;bf2d
	ld (hl),a			;bf30
L_BF31:
	ld (0d8e5h),de		;bf31
	ret			;bf35
L_BF36:
	ld a,(0ca4ah)		;bf36   ; lee la zona
	cp 012h		;bf39
	ret nc			;bf3b
	call L_BF5C		;bf3c
	call L_BF6F		;bf3f
	call L_BF82		;bf42
	ld a,(0d882h)		;bf45
	cp 0ffh		;bf48
	ret nz			;bf4a
	ld hl,0d7f4h		;bf4b
	bit 7,(hl)		;bf4e
	ret nz			;bf50
	set 7,(hl)		;bf51
	ld hl,0d688h		;bf53
L_BF56:
	ld a,001h		;bf56
	ld (hl),a			;bf58
	inc hl			;bf59
	ld (hl),a			;bf5a
	ret			;bf5b
L_BF5C:
	ld a,(0d883h)		;bf5c
	cp 0ffh		;bf5f
	ret nz			;bf61
	ld hl,0d7f4h		;bf62
	bit 6,(hl)		;bf65
	ret nz			;bf67
	set 6,(hl)		;bf68
	ld hl,0d68ch		;bf6a
	jr L_BF56		;bf6d
L_BF6F:
	ld a,(0d886h)		;bf6f
	cp 0ffh		;bf72
	ret nz			;bf74
	ld hl,0d7f4h		;bf75
	bit 5,(hl)		;bf78
	ret nz			;bf7a
	set 5,(hl)		;bf7b
	ld hl,0d6a0h		;bf7d
	jr L_BF56		;bf80
L_BF82:
	ld a,(0d88ah)		;bf82
	cp 0ffh		;bf85
	ret nz			;bf87
	ld a,(0ca4ah)		;bf88   ; lee la zona
	cp 00bh		;bf8b
	ret nz			;bf8d
	ld hl,0d69ch		;bf8e
	jr L_BF56		;bf91

; ----------------------------------------------------------------------
; DATOS sin identificar  0xbf93..0xc000  (109 bytes)
DATA_BF93:
	defb 0e0h,028h,0f5h,0f9h,026h,080h,0fbh,004h,0e0h,050h,0f5h,0f9h,026h,080h,0fbh,007h	; bf93  .(..&....P..&...
	defb 0e0h,028h,0f5h,0f9h,026h,080h,0fbh,005h,0e0h,050h,0f5h,0f9h,026h,080h,0fbh,006h	; bfa3  .(..&....P..&...
	defb 0e0h,028h,0f5h,0f9h,026h,080h,0fbh,002h,0e0h,050h,0f5h,0f9h,026h,080h,0fbh,006h	; bfb3  .(..&....P..&...
	defb 0e0h,028h,0f5h,0f9h,026h,080h,0fbh,004h,0e0h,0c0h,0e0h,0c0h,0fdh,07eh,07fh,0feh	; bfc3  .(..&........~..
	defb 002h,0f5h,0f9h,047h,080h,0fbh,006h,0e0h,028h,0f9h,047h,080h,0e0h,050h,0f5h,0f9h	; bfd3  ...G....(.G..P..
	defb 047h,080h,0fbh,006h,0e0h,028h,0f5h,0f9h,047h,080h,0fbh,004h,0e0h,050h,0f5h,0f9h	; bfe3  G....(..G....P..
	defb 047h,080h,0fbh,007h,0e0h,028h,0f5h,0f9h,047h,080h,0fbh,005h,0e0h	; bff3  G....(..G....
