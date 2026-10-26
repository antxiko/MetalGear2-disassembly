; ==========================================================================
; METAL GEAR 2 SOLID SNAKE - Konami (1990) - MSX2 - MegaROM RC-767 de 512 KB (Konami SCC) - banco 13 (se ejecuta en 0x8000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x08000


; ======================================================================
; CODIGO 0x8000..0x800d  (13 bytes)
; ======================================================================


L_8000:
	ld de,0ca2ch		;8000
	ld a,(de)			;8003
	cp 080h		;8004
	jp nc,0a2cfh		;8006   ; p14:A2CF
	dec a			;8009
	call 0424dh		;800a   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_800D: 65 destinos del despachador p00:424D (call en p13:800A, el
;   indice en A): 808F, 80A7, 80B7, 80BE, 80E4, 80FB, 8109, 812A, 8150, 8177,
;   819C, 81B8, 81C4, 81DB, 8202, 822D, 8247, 826E, 8299, 82A6, 82AD, 82BC,
;   830A, 8337, 833E, 834E, 837A, 83A4, 83AF, 83B6, 83C6, 842A, 8434, 8442,
;   846B, 8492, 84B7, 84C2, 84C9, 84D9, 84E0, 8500, 852A, 8577, 8597, 85B1,
;   85D8, 85FD, 860B, 8612, 8622, 8646, 8680, 86FA, 8706, 8714, 8734, 873B,
;   8742, 8754, 8780, 87B1, 87C7, 87DC, 87E6; lo leen p13:800A (130 bytes)
;   0x800d..0x808f  (130 bytes)
DATA_tabla_800D:
	defw 0808fh,080a7h,080b7h,080beh,080e4h,080fbh,08109h,0812ah	; 800d
	defw 08150h,08177h,0819ch,081b8h,081c4h,081dbh,08202h,0822dh	; 801d
	defw 08247h,0826eh,08299h,082a6h,082adh,082bch,0830ah,08337h	; 802d
	defw 0833eh,0834eh,0837ah,083a4h,083afh,083b6h,083c6h,0842ah	; 803d
	defw 08434h,08442h,0846bh,08492h,084b7h,084c2h,084c9h,084d9h	; 804d
	defw 084e0h,08500h,0852ah,08577h,08597h,085b1h,085d8h,085fdh	; 805d
	defw 0860bh,08612h,08622h,08646h,08680h,086fah,08706h,08714h	; 806d
	defw 08734h,0873bh,08742h,08754h,08780h,087b1h,087c7h,087dch	; 807d
	defw 087e6h	; 808d  -> L_87E6

; ======================================================================
; CODIGO 0x808f..0x882a  (1947 bytes)
; ======================================================================


L_808F:
	call 06ba4h		;808f   ; sonido_99: pide el sonido 0x99 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	call L_9152		;8092
	ld hl,0e900h		;8095   ; apunta a los caracteres de un dibujo pasados a 4 bits
	call 0463fh		;8098   ; pon_paleta_con_espera: pone la paleta de HL (p00:4642) esperando al VDP antes
	ld hl,092b8h		;809b
	call 04918h		;809e   ; letrero_con_sitio: [fila][columna] y letras; 0xFE otra posicion, 0xFF acaba
	ld de,00000h		;80a1
	jp L_8144		;80a4
L_80A7:
	call L_87F5		;80a7
	ld de,09218h		;80aa
	call L_916F		;80ad
	ret nz			;80b0
	ld de,00100h		;80b1
	jp L_8144		;80b4
L_80B7:
	call L_87F5		;80b7
	ret nz			;80ba
	jp L_8148		;80bb
L_80BE:
	call L_90F7		;80be
	ret nz			;80c1
	call 045fdh		;80c2   ; pantalla_limpia: la pantalla apagada, la pagina 0 borrada y otra vez encendida
	call L_9152		;80c5
	ld hl,0e900h		;80c8   ; apunta a los caracteres de un dibujo pasados a 4 bits
	call 0463fh		;80cb   ; pon_paleta_con_espera: pone la paleta de HL (p00:4642) esperando al VDP antes
	ld hl,08068h		;80ce
	ld de,0a040h		;80d1
	ld bc,03040h		;80d4
	call L_880F		;80d7
	xor a			;80da
	ld (0ca30h),a		;80db
	ld (0ca31h),a		;80de
	jp L_8148		;80e1
L_80E4:
	ld hl,0ca30h		;80e4
	inc (hl)			;80e7
	call L_8B28		;80e8
	call L_87F5		;80eb
	ld de,09218h		;80ee
	call L_916F		;80f1
	ret nz			;80f4
	ld de,00040h		;80f5
	jp L_8144		;80f8
L_80FB:
	ld hl,0ca30h		;80fb
	inc (hl)			;80fe
	call L_8B28		;80ff
	call L_87F5		;8102
	ret nz			;8105
	jp L_8148		;8106
L_8109:
	ld hl,0ca30h		;8109
	inc (hl)			;810c
	call L_8B28		;810d
	call L_8801		;8110
	ld a,(0ca30h)		;8113
	and 007h		;8116
	jr nz,L_8126		;8118
	ld hl,0ca31h		;811a
	ld a,(hl)			;811d
	add a,004h		;811e
	cp 018h		;8120
	jr c,L_8125		;8122
	xor a			;8124
L_8125:
	ld (hl),a			;8125
L_8126:
	xor a			;8126
	jp L_8E2F		;8127
L_812A:
	call 04266h		;812a   ; esconde_sprites_ram: llena 0xDC00-0xDC7F con 0xE0
	call 045fdh		;812d   ; pantalla_limpia: la pantalla apagada, la pagina 0 borrada y otra vez encendida
	ld a,038h		;8130
	ld (0ca31h),a		;8132
	ld hl,00e3eh		;8135
	ld de,06c44h		;8138
	ld c,006h		;813b
	xor a			;813d
	call 046bch		;813e   ; marco: cuatro lineas: un marco de D x E desde HL
	ld de,00100h		;8141
L_8144:
	ld (0ca2eh),de		;8144
L_8148:
	ld hl,0ca2ch		;8148
	inc (hl)			;814b
	inc hl			;814c
	ld (hl),000h		;814d
	ret			;814f
L_8150:
	call L_899E		;8150
	ld a,(0ca31h)		;8153
	and a			;8156
	ret nz			;8157
	ld b,005h		;8158
	ld hl,08b9eh		;815a
	ld de,0dc00h		;815d   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	call L_8B92		;8160
	ld hl,0da00h		;8163   ; apunta a la copia de la tabla de colores de sprites: 32 x 16 lineas (va con 0xDC00 detras)
	ld de,0da01h		;8166
	ld bc,0004fh		;8169
	ld (hl),007h		;816c
	ldir		;816e
	xor a			;8170
	ld (0ca30h),a		;8171
	jp L_8148		;8174
L_8177:
	ld de,0dc00h		;8177   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	ld b,005h		;817a
	ld hl,0ca30h		;817c
	inc (hl)			;817f
	bit 3,(hl)		;8180
	jr z,L_8194		;8182
	ld a,(hl)			;8184
	and 030h		;8185
	ld hl,08b9eh		;8187
	jr nz,L_818F		;818a
	ld hl,08badh		;818c
L_818F:
	call L_8B92		;818f
	jr L_8197		;8192
L_8194:
	call L_8B88		;8194
L_8197:
	ld a,001h		;8197
	jp L_8E2F		;8199
L_819C:
	call 04266h		;819c   ; esconde_sprites_ram: llena 0xDC00-0xDC7F con 0xE0
	call 045fdh		;819f   ; pantalla_limpia: la pantalla apagada, la pagina 0 borrada y otra vez encendida
	ld hl,08038h		;81a2
	ld de,02050h		;81a5
	ld bc,03830h		;81a8
	call L_880F		;81ab
	xor a			;81ae
	ld (0ca30h),a		;81af
	call L_8A3B		;81b2
	jp L_8148		;81b5
L_81B8:
	ld hl,0ca30h		;81b8
	inc (hl)			;81bb
	call L_8A4E		;81bc
	ld a,002h		;81bf
	jp L_8E2F		;81c1
L_81C4:
	call 045fdh		;81c4   ; pantalla_limpia: la pantalla apagada, la pagina 0 borrada y otra vez encendida
	ld hl,L_8646		;81c7
	ld de,06c44h		;81ca
	ld c,006h		;81cd
	xor a			;81cf
	call 046bch		;81d0   ; marco: cuatro lineas: un marco de D x E desde HL
	ld a,028h		;81d3
	ld (0ca31h),a		;81d5
	jp L_8148		;81d8
L_81DB:
	call L_89D8		;81db
	ld a,(0ca31h)		;81de
	and a			;81e1
	ret nz			;81e2
	ld b,005h		;81e3
	ld de,0dc00h		;81e5   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	ld hl,08bbch		;81e8
	call L_8B92		;81eb
	ld hl,0da00h		;81ee   ; apunta a la copia de la tabla de colores de sprites: 32 x 16 lineas (va con 0xDC00 detras)
	ld de,0da01h		;81f1
	ld bc,0004fh		;81f4
	ld (hl),007h		;81f7
	ldir		;81f9
	xor a			;81fb
	ld (0ca30h),a		;81fc
	jp L_8148		;81ff
L_8202:
	ld hl,0ca30h		;8202
	inc (hl)			;8205
	call L_8814		;8206
	ld de,0dc00h		;8209   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	ld b,005h		;820c
	ld hl,0ca30h		;820e
	bit 3,(hl)		;8211
	jr z,L_8225		;8213
	ld a,(hl)			;8215
	and 030h		;8216
	ld hl,08bbch		;8218
	jr nz,L_8220		;821b
	ld hl,08bcbh		;821d
L_8220:
	call L_8B92		;8220
	jr L_8228		;8223
L_8225:
	call L_8B88		;8225
L_8228:
	ld a,003h		;8228
	jp L_8E2F		;822a
L_822D:
	call 04266h		;822d   ; esconde_sprites_ram: llena 0xDC00-0xDC7F con 0xE0
	call 045fdh		;8230   ; pantalla_limpia: la pantalla apagada, la pagina 0 borrada y otra vez encendida
	ld hl,00e3eh		;8233
	ld de,06444h		;8236
	ld c,006h		;8239
	xor a			;823b
	call 046bch		;823c   ; marco: cuatro lineas: un marco de D x E desde HL
	ld a,020h		;823f
	ld (0ca31h),a		;8241
	jp L_8148		;8244
L_8247:
	call L_89C5		;8247
	ld a,(0ca31h)		;824a
	and a			;824d
	ret nz			;824e
	ld b,005h		;824f
	ld de,0dc00h		;8251   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	ld hl,08bdah		;8254
	call L_8B92		;8257
	ld hl,0da00h		;825a   ; apunta a la copia de la tabla de colores de sprites: 32 x 16 lineas (va con 0xDC00 detras)
	ld de,0da01h		;825d
	ld bc,0004fh		;8260
	ld (hl),007h		;8263
	ldir		;8265
	xor a			;8267
	ld (0ca30h),a		;8268
	jp L_8148		;826b
L_826E:
	ld hl,0ca30h		;826e
	inc (hl)			;8271
	call L_884A		;8272
	ld de,0dc00h		;8275   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	ld b,005h		;8278
	ld hl,0ca30h		;827a
	bit 3,(hl)		;827d
	jr z,L_8291		;827f
	ld a,(hl)			;8281
	and 030h		;8282
	ld hl,08bdah		;8284
	jr nz,L_828C		;8287
	ld hl,08be9h		;8289
L_828C:
	call L_8B92		;828c
	jr L_8294		;828f
L_8291:
	call L_8B88		;8291
L_8294:
	ld a,004h		;8294
	jp L_8E2F		;8296
L_8299:
	call 04266h		;8299   ; esconde_sprites_ram: llena 0xDC00-0xDC7F con 0xE0
	xor a			;829c
	call L_8CE0		;829d
	ld de,00020h		;82a0
	jp L_8144		;82a3
L_82A6:
	call L_87F5		;82a6
	ret nz			;82a9
	jp L_8148		;82aa
L_82AD:
	xor a			;82ad
	call L_8DAA		;82ae
	ld a,(0ca30h)		;82b1
	and a			;82b4
	ret nz			;82b5
	ld de,00020h		;82b6
	jp L_8144		;82b9
L_82BC:
	call L_87F5		;82bc
	ret nz			;82bf
	call 045f1h		;82c0   ; apaga_pantalla_y_sprites: p00:45CC y p00:45F6
	call 04266h		;82c3   ; esconde_sprites_ram: llena 0xDC00-0xDC7F con 0xE0
	call 045b9h		;82c6   ; borra_pagina_0: la pagina 0 a cero y R#23 = 0
	ld de,04000h		;82c9
	ld a,00eh		;82cc
	call 04614h		;82ce   ; pon_color: el color A de la paleta = D (rojo y azul), E (verde)
	ld b,002h		;82d1
	ld de,0dc00h		;82d3   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	ld hl,08c40h		;82d6
	call L_8B92		;82d9
	ld hl,0da00h		;82dc   ; apunta a la copia de la tabla de colores de sprites: 32 x 16 lineas (va con 0xDC00 detras)
	ld de,0da01h		;82df
	ld bc,0001fh		;82e2
	ld (hl),007h		;82e5
	ldir		;82e7
	ld hl,00e3eh		;82e9
	call L_900C		;82ec
	ld hl,090d0h		;82ef
	ld de,03050h		;82f2
	ld bc,03030h		;82f5
	ld a,0c8h		;82f8
	call 047edh		;82fa   ; copia_rectangulo_logica: orden LMMM del VDP con la operacion logica de A
	call 04606h		;82fd   ; enciende_todo: la pantalla y los sprites encendidos
	xor a			;8300
	ld (0ca30h),a		;8301
	ld de,00080h		;8304
	jp L_8144		;8307
L_830A:
	ld hl,0ca30h		;830a
	inc (hl)			;830d
	ld de,0dc00h		;830e   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	ld b,002h		;8311
	ld hl,0ca30h		;8313
	bit 3,(hl)		;8316
	jr nz,L_8322		;8318
	ld hl,08c40h		;831a
	call L_8B92		;831d
	jr L_8325		;8320
L_8322:
	call L_8B88		;8322
L_8325:
	call L_87F5		;8325
	ret nz			;8328
	call 04266h		;8329   ; esconde_sprites_ram: llena 0xDC00-0xDC7F con 0xE0
	ld a,001h		;832c
	call L_8CE0		;832e
	ld de,00020h		;8331
	jp L_8144		;8334
L_8337:
	call L_87F5		;8337
	ret nz			;833a
	jp L_8148		;833b
L_833E:
	ld a,001h		;833e
	call L_8DAA		;8340
	ld a,(0ca30h)		;8343
	and a			;8346
	ret nz			;8347
	ld de,00020h		;8348
	jp L_8144		;834b
L_834E:
	call L_87F5		;834e
	ret nz			;8351
	call 04266h		;8352   ; esconde_sprites_ram: llena 0xDC00-0xDC7F con 0xE0
	ld hl,0c0c0h		;8355
	call L_887E		;8358
	ld b,002h		;835b
	ld de,0dc00h		;835d   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	ld hl,08c61h		;8360
	call L_8B92		;8363
	ld hl,0da00h		;8366   ; apunta a la copia de la tabla de colores de sprites: 32 x 16 lineas (va con 0xDC00 detras)
	ld de,0da01h		;8369
	ld bc,0001fh		;836c
	ld (hl),007h		;836f
	ldir		;8371
	xor a			;8373
	ld (0ca30h),a		;8374
	jp L_8148		;8377
L_837A:
	ld hl,0ca30h		;837a
	inc (hl)			;837d
	ld a,(hl)			;837e
	cp 060h		;837f
	jr nz,L_8385		;8381
	ld (hl),000h		;8383
L_8385:
	call L_8871		;8385
	ld de,0dc00h		;8388   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	ld b,002h		;838b
	ld hl,0ca30h		;838d
	bit 3,(hl)		;8390
	jr nz,L_839C		;8392
	ld hl,08c61h		;8394
	call L_8B92		;8397
	jr L_839F		;839a
L_839C:
	call L_8B88		;839c
L_839F:
	ld a,005h		;839f
	jp L_8E2F		;83a1
L_83A4:
	ld a,002h		;83a4
	call L_8CE0		;83a6
	ld de,00020h		;83a9
	jp L_8144		;83ac
L_83AF:
	call L_87F5		;83af
	ret nz			;83b2
	jp L_8148		;83b3
L_83B6:
	ld a,002h		;83b6
	call L_8DAA		;83b8
	ld a,(0ca30h)		;83bb
	and a			;83be
	ret nz			;83bf
	ld de,00020h		;83c0
	jp L_8144		;83c3
L_83C6:
	call L_87F5		;83c6
	ret nz			;83c9
	call 045f1h		;83ca   ; apaga_pantalla_y_sprites: p00:45CC y p00:45F6
	call 04266h		;83cd   ; esconde_sprites_ram: llena 0xDC00-0xDC7F con 0xE0
	call 045b9h		;83d0   ; borra_pagina_0: la pagina 0 a cero y R#23 = 0
	ld hl,08f5eh		;83d3
	call 0463fh		;83d6   ; pon_paleta_con_espera: pone la paleta de HL (p00:4642) esperando al VDP antes
	ld hl,08000h		;83d9
	ld de,01050h		;83dc
	ld bc,05838h		;83df
	ld a,001h		;83e2
	call 04767h		;83e4   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
	ld de,01850h		;83e7
	xor a			;83ea
	ld b,a			;83eb
	call L_9D01		;83ec
	ld de,04050h		;83ef
	ld a,004h		;83f2
	ld b,001h		;83f4
	call L_9D01		;83f6
	ld hl,01850h		;83f9
	ld b,048h		;83fc
	ld c,007h		;83fe
	ld a,000h		;8400
	call 0467ch		;8402   ; linea_horizontal: orden LINE del VDP (R#36-R#46) con el lado largo en X
	ld b,006h		;8405
	ld de,0dc00h		;8407   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	ld hl,08cc8h		;840a
	call L_8B92		;840d
	ld hl,0da00h		;8410   ; apunta a la copia de la tabla de colores de sprites: 32 x 16 lineas (va con 0xDC00 detras)
	ld de,0da01h		;8413
	ld bc,0005fh		;8416
	ld (hl),005h		;8419
	ldir		;841b
	call 04606h		;841d   ; enciende_todo: la pantalla y los sprites encendidos
	xor a			;8420
	ld (0ca30h),a		;8421
	ld de,00020h		;8424
	jp L_8144		;8427
L_842A:
	call L_90AE		;842a
	call L_87F5		;842d
	ret nz			;8430
	jp L_8148		;8431
L_8434:
	call L_87F5		;8434
	call L_90AE		;8437
	call 07b55h		;843a   ; a_p03_b8ac_2: p03:B8AC con el banco 3 en 0xA000
	ld a,006h		;843d
	jp L_8E2F		;843f
L_8442:
	call 04266h		;8442   ; esconde_sprites_ram: llena 0xDC00-0xDC7F con 0xE0
	call 045fdh		;8445   ; pantalla_limpia: la pantalla apagada, la pagina 0 borrada y otra vez encendida
	xor a			;8448
	call 07b5dh		;8449   ; a_p03_b866_2: p03:B866 con el banco 3 en 0xA000
	ld a,001h		;844c
	call 07b5dh		;844e   ; a_p03_b866_2: p03:B866 con el banco 3 en 0xA000
	ld hl,08f83h		;8451
	call 0463fh		;8454   ; pon_paleta_con_espera: pone la paleta de HL (p00:4642) esperando al VDP antes
	ld hl,L_8646		;8457
	ld de,06c44h		;845a
	ld c,006h		;845d
	xor a			;845f
	call 046bch		;8460   ; marco: cuatro lineas: un marco de D x E desde HL
	ld a,028h		;8463
	ld (0ca31h),a		;8465
	jp L_8148		;8468
L_846B:
	call L_89F6		;846b
	ld a,(0ca31h)		;846e
	and a			;8471
	ret nz			;8472
	ld b,002h		;8473
	ld de,0dc00h		;8475   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	ld hl,08c55h		;8478
	call L_8B92		;847b
	ld hl,0da00h		;847e   ; apunta a la copia de la tabla de colores de sprites: 32 x 16 lineas (va con 0xDC00 detras)
	ld de,0da01h		;8481
	ld bc,0001fh		;8484
	ld (hl),007h		;8487
	ldir		;8489
	xor a			;848b
	ld (0ca30h),a		;848c
	jp L_8148		;848f
L_8492:
	ld de,0dc00h		;8492   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	ld b,002h		;8495
	ld hl,0ca30h		;8497
	inc (hl)			;849a
	bit 3,(hl)		;849b
	jr z,L_84AF		;849d
	ld a,(hl)			;849f
	and 030h		;84a0
	ld hl,08c55h		;84a2
	jr nz,L_84AA		;84a5
	ld hl,08c5bh		;84a7
L_84AA:
	call L_8B92		;84aa
	jr L_84B2		;84ad
L_84AF:
	call L_8B88		;84af
L_84B2:
	ld a,007h		;84b2
	jp L_8E2F		;84b4
L_84B7:
	ld a,003h		;84b7
	call L_8CE0		;84b9
	ld de,00020h		;84bc
	jp L_8144		;84bf
L_84C2:
	call L_87F5		;84c2
	ret nz			;84c5
	jp L_8148		;84c6
L_84C9:
	ld a,003h		;84c9
	call L_8DAA		;84cb
	ld a,(0ca30h)		;84ce
	and a			;84d1
	ret nz			;84d2
	ld de,00020h		;84d3
	jp L_8144		;84d6
L_84D9:
	call L_87F5		;84d9
	ret nz			;84dc
	jp L_8148		;84dd
L_84E0:
	call 04266h		;84e0   ; esconde_sprites_ram: llena 0xDC00-0xDC7F con 0xE0
	call 045fdh		;84e3   ; pantalla_limpia: la pantalla apagada, la pagina 0 borrada y otra vez encendida
	ld hl,L_8646		;84e6
	call L_900C		;84e9
	ld hl,000a8h		;84ec
	ld de,09848h		;84ef
	ld bc,05040h		;84f2
	ld a,0c8h		;84f5
	call 047edh		;84f7   ; copia_rectangulo_logica: orden LMMM del VDP con la operacion logica de A
	ld de,00020h		;84fa
	jp L_8144		;84fd
L_8500:
	ld b,001h		;8500
	ld de,0dc00h		;8502   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	ld hl,08c46h		;8505
	call L_8B92		;8508
	ld hl,0da00h		;850b   ; apunta a la copia de la tabla de colores de sprites: 32 x 16 lineas (va con 0xDC00 detras)
	ld de,0da01h		;850e
	ld bc,0000fh		;8511
	ld (hl),007h		;8514
	ldir		;8516
	call L_87F5		;8518
	ret nz			;851b
	xor a			;851c
	ld (0ca30h),a		;851d
	ld (0e900h),a		;8520   ; guarda los caracteres de un dibujo pasados a 4 bits
	dec a			;8523
	ld (0ca32h),a		;8524
	jp L_8148		;8527
L_852A:
	ld de,0dc00h		;852a   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	ld b,001h		;852d
	ld hl,0ca30h		;852f
	bit 3,(hl)		;8532
	jr nz,L_854D		;8534
	ld a,(0e900h)		;8536   ; lee los caracteres de un dibujo pasados a 4 bits
	and a			;8539
	ld hl,08c46h		;853a
	jr z,L_8548		;853d
	dec a			;853f
	ld hl,08c49h		;8540
	jr z,L_8548		;8543
	ld hl,08c4ch		;8545
L_8548:
	call L_8B92		;8548
	jr L_8550		;854b
L_854D:
	call L_8B88		;854d
L_8550:
	ld hl,0ca30h		;8550
	inc (hl)			;8553
	call L_88A9		;8554
	ret nz			;8557
	ld b,002h		;8558
	ld de,0dc00h		;855a   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	ld hl,08c67h		;855d
	call L_8B92		;8560
	ld hl,0da00h		;8563   ; apunta a la copia de la tabla de colores de sprites: 32 x 16 lineas (va con 0xDC00 detras)
	ld de,0da01h		;8566
	ld bc,0001fh		;8569
	ld (hl),007h		;856c
	ldir		;856e
	xor a			;8570
	ld (0ca30h),a		;8571
	jp L_8148		;8574
L_8577:
	ld de,0dc00h		;8577   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	ld b,002h		;857a
	ld hl,0ca30h		;857c
	bit 3,(hl)		;857f
	jr nz,L_858B		;8581
	ld hl,08c67h		;8583
	call L_8B92		;8586
	jr L_858E		;8589
L_858B:
	call L_8B88		;858b
L_858E:
	ld hl,0ca30h		;858e
	dec (hl)			;8591
	ld a,008h		;8592
	jp L_8E2F		;8594
L_8597:
	call 04266h		;8597   ; esconde_sprites_ram: llena 0xDC00-0xDC7F con 0xE0
	call 045fdh		;859a   ; pantalla_limpia: la pantalla apagada, la pagina 0 borrada y otra vez encendida
	ld hl,00e3eh		;859d
	ld de,06444h		;85a0
	ld c,006h		;85a3
	xor a			;85a5
	call 046bch		;85a6   ; marco: cuatro lineas: un marco de D x E desde HL
	ld a,028h		;85a9
	ld (0ca31h),a		;85ab
	jp L_8148		;85ae
L_85B1:
	call L_8A14		;85b1
	ld a,(0ca31h)		;85b4
	and a			;85b7
	ret nz			;85b8
	ld b,002h		;85b9
	ld hl,08bf8h		;85bb
	ld de,0dc00h		;85be   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	call L_8B92		;85c1
	ld hl,0da00h		;85c4   ; apunta a la copia de la tabla de colores de sprites: 32 x 16 lineas (va con 0xDC00 detras)
	ld de,0da01h		;85c7
	ld bc,0001fh		;85ca
	ld (hl),007h		;85cd
	ldir		;85cf
	xor a			;85d1
	ld (0ca30h),a		;85d2
	jp L_8148		;85d5
L_85D8:
	ld de,0dc00h		;85d8   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	ld b,002h		;85db
	ld hl,0ca30h		;85dd
	inc (hl)			;85e0
	bit 3,(hl)		;85e1
	jr z,L_85F5		;85e3
	ld a,(hl)			;85e5
	and 030h		;85e6
	ld hl,08bf8h		;85e8
	jr nz,L_85F0		;85eb
	ld hl,08bfeh		;85ed
L_85F0:
	call L_8B92		;85f0
	jr L_85F8		;85f3
L_85F5:
	call L_8B88		;85f5
L_85F8:
	ld a,009h		;85f8
	jp L_8E2F		;85fa
L_85FD:
	call 04266h		;85fd   ; esconde_sprites_ram: llena 0xDC00-0xDC7F con 0xE0
	ld a,004h		;8600
	call L_8CE0		;8602
	ld de,00020h		;8605
	jp L_8144		;8608
L_860B:
	call L_87F5		;860b
	ret nz			;860e
	jp L_8148		;860f
L_8612:
	ld a,004h		;8612
	call L_8DAA		;8614
	ld a,(0ca30h)		;8617
	and a			;861a
	ret nz			;861b
	ld de,00020h		;861c
	jp L_8144		;861f
L_8622:
	call L_87F5		;8622
	ret nz			;8625
	call 04266h		;8626   ; esconde_sprites_ram: llena 0xDC00-0xDC7F con 0xE0
	call 045fdh		;8629   ; pantalla_limpia: la pantalla apagada, la pagina 0 borrada y otra vez encendida
	ld hl,00e3eh		;862c
	call L_900C		;862f
	ld hl,050a8h		;8632
	ld de,02848h		;8635
	ld bc,04828h		;8638
	ld a,0c8h		;863b
	call 047edh		;863d   ; copia_rectangulo_logica: orden LMMM del VDP con la operacion logica de A
	ld de,00020h		;8640
	jp L_8144		;8643
L_8646:
	call L_87F5		;8646
	ret nz			;8649
	ld bc,00014h		;864a
	ld hl,08c04h		;864d
	ld de,0dc08h		;8650
	ldir		;8653
	ld hl,0da20h		;8655
	ld de,08cb5h		;8658
	call 051e0h		;865b   ; rachas_a_ram: deshace las rachas de DE en HL (n < 0x80 repite, n > 0x80 copia, 0 acaba)
	ld b,002h		;865e
	ld hl,08c4fh		;8660
	ld de,0dc00h		;8663   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	call L_8B92		;8666
	ld hl,0da00h		;8669   ; apunta a la copia de la tabla de colores de sprites: 32 x 16 lineas (va con 0xDC00 detras)
	ld de,0da01h		;866c
	ld bc,0001fh		;866f
	ld (hl),007h		;8672
	ldir		;8674
	xor a			;8676
	ld (0ca30h),a		;8677
	ld de,00000h		;867a
	jp L_8144		;867d
L_8680:
	call L_87F5		;8680
	ld a,(0ca2fh)		;8683
	cp 0ffh		;8686
	ld c,003h		;8688
	jr nc,L_868E		;868a
	ld c,007h		;868c
L_868E:
	ld a,(0ca2eh)		;868e
	and c			;8691
	jr nz,L_86A2		;8692
	ld hl,0ca30h		;8694
	inc (hl)			;8697
	ld a,(hl)			;8698
	cp 003h		;8699
	jr nz,L_869F		;869b
	ld (hl),000h		;869d
L_869F:
	call L_8984		;869f
L_86A2:
	ld a,(0ca2fh)		;86a2
	cp 0ffh		;86a5
	jr c,L_86D6		;86a7
	ld a,(0ca30h)		;86a9
	ld hl,08c04h		;86ac
	ld de,08cb5h		;86af
	and a			;86b2
	jr z,L_86C4		;86b3
	ld hl,08c18h		;86b5
	ld de,08cbeh		;86b8
	dec a			;86bb
	jr z,L_86C4		;86bc
	ld hl,08c2ch		;86be
	ld de,08cc3h		;86c1
L_86C4:
	push de			;86c4
	ld de,0dc08h		;86c5
	ld bc,00014h		;86c8
	ldir		;86cb
	pop de			;86cd
	ld hl,0da20h		;86ce
	call 051e0h		;86d1   ; rachas_a_ram: deshace las rachas de DE en HL (n < 0x80 repite, n > 0x80 copia, 0 acaba)
	jr L_86DE		;86d4
L_86D6:
	ld de,0dc08h		;86d6
	ld b,005h		;86d9
	call L_8B88		;86db
L_86DE:
	ld de,0dc00h		;86de   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	ld b,002h		;86e1
	ld hl,0ca2eh		;86e3
	bit 3,(hl)		;86e6
	jr nz,L_86F2		;86e8
	ld hl,08c4fh		;86ea
	call L_8B92		;86ed
	jr L_86F5		;86f0
L_86F2:
	call L_8B88		;86f2
L_86F5:
	ld a,00ah		;86f5
	jp L_8E2F		;86f7
L_86FA:
	call 04266h		;86fa   ; esconde_sprites_ram: llena 0xDC00-0xDC7F con 0xE0
	call 045fdh		;86fd   ; pantalla_limpia: la pantalla apagada, la pagina 0 borrada y otra vez encendida
	ld de,00040h		;8700
	jp L_8144		;8703
L_8706:
	call L_87F5		;8706
	ret nz			;8709
	xor a			;870a
	ld (0ca30h),a		;870b
	ld de,00000h		;870e
	jp L_8144		;8711
L_8714:
	call L_87F5		;8714
	ld a,(0ca2eh)		;8717
	and 00fh		;871a
	ret nz			;871c
	ld hl,0ca30h		;871d
	ld a,(hl)			;8720
	cp 009h		;8721
	ld de,00080h		;8723
	jp z,L_8144		;8726
	call L_9046		;8729
	call L_906F		;872c
	ld hl,0ca30h		;872f
	inc (hl)			;8732
	ret			;8733
L_8734:
	call L_87F5		;8734
	ret nz			;8737
	jp L_8148		;8738
L_873B:
	call L_90F7		;873b
	ret nz			;873e
	jp L_8148		;873f
L_8742:
	call 045fdh		;8742   ; pantalla_limpia: la pantalla apagada, la pagina 0 borrada y otra vez encendida
	call L_9152		;8745
	ld hl,0e900h		;8748   ; apunta a los caracteres de un dibujo pasados a 4 bits
	call 0463fh		;874b   ; pon_paleta_con_espera: pone la paleta de HL (p00:4642) esperando al VDP antes
	call L_8A2D		;874e
	jp L_8148		;8751
L_8754:
	call L_87F5		;8754
	ld de,09238h		;8757
	call L_916F		;875a
	ret nz			;875d
	ld b,00ch		;875e
	ld hl,08c6dh		;8760
	ld de,0dc00h		;8763   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	call L_8B92		;8766
	ld hl,0da00h		;8769   ; apunta a la copia de la tabla de colores de sprites: 32 x 16 lineas (va con 0xDC00 detras)
	ld de,0da01h		;876c
	ld bc,000bfh		;876f
	ld (hl),007h		;8772
	ldir		;8774
	xor a			;8776
	ld (0ca30h),a		;8777
	ld de,000ffh		;877a
	jp L_8144		;877d
L_8780:
	ld de,0dc00h		;8780   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	ld b,00ch		;8783
	ld a,(0ca2eh)		;8785
	cp 040h		;8788
	jr c,L_87A4		;878a
	ld hl,0ca30h		;878c
	inc (hl)			;878f
	bit 3,(hl)		;8790
	jr z,L_87A4		;8792
	ld a,(hl)			;8794
	and 030h		;8795
	ld hl,08c6dh		;8797
	jr nz,L_879F		;879a
	ld hl,08c91h		;879c
L_879F:
	call L_8B92		;879f
	jr L_87A7		;87a2
L_87A4:
	call L_8B88		;87a4
L_87A7:
	call L_87F5		;87a7
	ret nz			;87aa
	call L_91F0		;87ab
	jp L_8148		;87ae
L_87B1:
	ld a,(0ca03h)		;87b1   ; lee el contador de cuadros (uno mas en cada interrupcion)
	and 001h		;87b4
	ret nz			;87b6
	ld de,09278h		;87b7
	call L_9175		;87ba
	ret nz			;87bd
	call 04266h		;87be   ; esconde_sprites_ram: llena 0xDC00-0xDC7F con 0xE0
	call 06e29h		;87c1   ; mapa_de_bits_8098: el mapa de bits de p57:8098 en la VRAM de 0x0820
	jp L_8148		;87c4
L_87C7:
	ld a,(0ca03h)		;87c7   ; lee el contador de cuadros (uno mas en cada interrupcion)
	and 007h		;87ca
	ret nz			;87cc
	ld de,09298h		;87cd
	ld a,001h		;87d0
	call L_9177		;87d2
	ret nz			;87d5
	ld de,00100h		;87d6
	jp L_8144		;87d9
L_87DC:
	call L_87F5		;87dc
	ret nz			;87df
	call 06be8h		;87e0   ; orden_sonido_f6: la orden 0xF6 al sonido
	jp L_8148		;87e3
L_87E6:
	ld a,(0ca03h)		;87e6   ; lee el contador de cuadros (uno mas en cada interrupcion)
	and 003h		;87e9
	ret nz			;87eb
	call L_90F7		;87ec
	ret nz			;87ef
	xor a			;87f0
	ld (0ca2ch),a		;87f1
	ret			;87f4
L_87F5:
	ld bc,(0ca2eh)		;87f5
	dec bc			;87f9
	ld (0ca2eh),bc		;87fa
	ld a,b			;87fe
	or c			;87ff
	ret			;8800
L_8801:
	ld a,(0ca31h)		;8801
	add a,038h		;8804
	ld l,a			;8806
	ld h,0b8h		;8807
	ld de,0c870h		;8809
	ld bc,01010h		;880c
L_880F:
	ld a,001h		;880f
	jp 04767h		;8811   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
L_8814:
	ld a,(0ca30h)		;8814
	and 078h		;8817
	rra			;8819
	rra			;881a
	rra			;881b
	ld hl,0882ah		;881c
	call 043f6h		;881f   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld de,0c85fh		;8822
	ld bc,02028h		;8825
	jr L_880F		;8828

; ----------------------------------------------------------------------
; DATOS resto_882A: lo apuntan con el banco puesto p13:881C (0x882A), p13:9AAF
;   (0x8840), p13:89ED (0x8848); el tamano es lo que hay hasta lo siguiente,
;   no sale de recorrerlo; lo leen p13:881C, p13:9AAF, p13:89ED (32 bytes)
;   0x882a..0x884a  (32 bytes)
DATA_resto_882A:
	defb 048h,0e0h,048h,0e0h,048h,0e0h,048h,0e0h,048h,0e0h,048h,0e0h,048h,0e0h,070h,0e0h	; 882a  H.H.H.H.H.H.H.p.
	defb 070h,0c0h,070h,0c0h,070h,0c0h,070h,0c0h,070h,0c0h,070h,0c0h,070h,0c0h,070h,0e0h	; 883a  p.p.p.p.p.p.p.p.

; ======================================================================
; CODIGO 0x884a..0x8861  (23 bytes)
; ======================================================================


L_884A:
	ld a,(0ca30h)		;884a
	and 070h		;884d
	rra			;884f
	rra			;8850
	rra			;8851
	rra			;8852
	ld hl,08861h		;8853
	call 043f6h		;8856   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld de,02850h		;8859
	ld bc,02020h		;885c
	jr $-80		;885f

; ----------------------------------------------------------------------
; DATOS resto_8861: lo apuntan con el banco puesto p13:8853 (0x8861); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p13:8853 (16 bytes)
;   0x8861..0x8871  (16 bytes)
DATA_resto_8861:
	defb 020h,018h,020h,018h,020h,018h,000h,0e0h,020h,0e0h,020h,0e0h,020h,0e0h,000h,0e0h	; 8861   . . ... . . ...

; ======================================================================
; CODIGO 0x8871..0x8889  (24 bytes)
; ======================================================================


L_8871:
	ld a,(0ca30h)		;8871
	and 03ch		;8874
	rra			;8876
	rra			;8877
	ld hl,08889h		;8878
	call 043f6h		;887b   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
L_887E:
	ld de,01050h		;887e
	ld bc,02020h		;8881
	ld a,0c8h		;8884
	jp 047edh		;8886   ; copia_rectangulo_logica: orden LMMM del VDP con la operacion logica de A

; ----------------------------------------------------------------------
; DATOS resto_8889: lo apuntan con el banco puesto p13:8878 (0x8889); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p13:8878 (32 bytes)
;   0x8889..0x88a9  (32 bytes)
DATA_resto_8889:
	defb 0c0h,0c0h,0e0h,0c0h,0c0h,0e0h,0e0h,0e0h,0c0h,0e0h,0e0h,0c0h,0c0h,0c0h,0c0h,0c0h	; 8889  ................
	defb 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h	; 8899  ................

; ======================================================================
; CODIGO 0x88a9..0x8903  (90 bytes)
; ======================================================================


L_88A9:
	ld a,(0ca30h)		;88a9
	and 007h		;88ac
	ret nz			;88ae
	ld hl,0ca32h		;88af
	inc (hl)			;88b2
	ld a,(hl)			;88b3
	ld hl,08903h		;88b4
	call 0423eh		;88b7   ; suma_a_hl: HL = HL + A
	ld a,(hl)			;88ba
	cp 0ffh		;88bb
	ret z			;88bd
	cp 005h		;88be
	call z,L_88FE		;88c0
	cp 006h		;88c3
	call z,L_88FE		;88c5
	cp 008h		;88c8
	call z,L_88FE		;88ca
	add a,a			;88cd
	add a,a			;88ce
	ld c,a			;88cf
	add a,a			;88d0
	add a,c			;88d1
	ld hl,08918h		;88d2
	call 0423eh		;88d5   ; suma_a_hl: HL = HL + A
	call L_88DB		;88d8
L_88DB:
	ld a,(hl)			;88db
	and a			;88dc
	jr z,L_88F6		;88dd
	ld c,(hl)			;88df
	inc hl			;88e0
	ld b,(hl)			;88e1
	inc hl			;88e2
	ld e,(hl)			;88e3
	inc hl			;88e4
	ld d,(hl)			;88e5
	inc hl			;88e6
	ld a,(hl)			;88e7
	inc hl			;88e8
	push hl			;88e9
	ld h,(hl)			;88ea
	ld l,a			;88eb
	ld a,003h		;88ec
	call 04767h		;88ee   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
	pop hl			;88f1
	inc hl			;88f2
	xor a			;88f3
	inc a			;88f4
	ret			;88f5
L_88F6:
	ld a,006h		;88f6
	call 0423eh		;88f8   ; suma_a_hl: HL = HL + A
	xor a			;88fb
	inc a			;88fc
	ret			;88fd
L_88FE:
	ld hl,0e900h		;88fe   ; apunta a los caracteres de un dibujo pasados a 4 bits
	inc (hl)			;8901
	ret			;8902

; ----------------------------------------------------------------------
; DATOS resto_8903: lo apuntan con el banco puesto p13:88B4 (0x8903), p13:88D2
;   (0x8918); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p13:88B4, p13:88D2 (129 bytes)
;   0x8903..0x8984  (129 bytes)
DATA_resto_8903:
	defb 000h,001h,002h,003h,004h,004h,004h,005h,000h,001h,002h,003h,004h,005h,006h,000h	; 8903  ................
	defb 001h,002h,007h,008h,0ffh,000h,000h,000h,000h,000h,000h,020h,040h,048h,0a0h,0d0h	; 8913  ........... @H..
	defb 050h,020h,040h,048h,0a0h,0a8h,008h,008h,040h,050h,0a0h,098h,0c0h,008h,040h,050h	; 8923  P @H....@P....@P
	defb 0a0h,0b0h,008h,020h,030h,048h,0b0h,0a0h,0c8h,008h,028h,058h,0b0h,0e0h,060h,008h	; 8933  ... 0H....(X..`.
	defb 028h,060h,0b0h,0c0h,098h,008h,028h,060h,0b0h,0b8h,0c8h,000h,000h,000h,000h,000h	; 8943  (`....(`........
	defb 000h,000h,000h,000h,000h,000h,000h,010h,008h,070h,0a0h,0f0h,030h,000h,000h,000h	; 8953  .........p..0...
	defb 000h,000h,000h,018h,008h,068h,0a0h,0e8h,030h,000h,000h,000h,000h,000h,000h,008h	; 8963  .....h..0.......
	defb 028h,058h,0b0h,0c8h,098h,000h,000h,000h,000h,000h,000h,010h,038h,058h,0a0h,0f0h	; 8973  (X..........8X..
	defb 058h	; 8983

; ======================================================================
; CODIGO 0x8984..0x8998  (20 bytes)
; ======================================================================


L_8984:
	ld a,(0ca30h)		;8984
	ld hl,08998h		;8987
	call 043f6h		;898a   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld de,02850h		;898d
	ld bc,03018h		;8990
	ld a,003h		;8993
	jp 04767h		;8995   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)

; ----------------------------------------------------------------------
; DATOS resto_8998: lo apuntan con el banco puesto p13:8987 (0x8998); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p13:8987 (6 bytes)
;   0x8998..0x899e  (6 bytes)
DATA_resto_8998:
	defb 0b0h,050h,0e8h,000h,0a8h,098h	; 8998

; ======================================================================
; CODIGO 0x899e..0x8b00  (354 bytes)
; ======================================================================


L_899E:
	ld hl,0ca31h		;899e
	ld a,(hl)			;89a1
	and a			;89a2
	ret z			;89a3
	dec (hl)			;89a4
	sub 038h		;89a5
	neg		;89a7
	ld b,a			;89a9
	ld a,040h		;89aa
	sub b			;89ac
	jr nc,L_89B0		;89ad
	xor a			;89af
L_89B0:
	ld h,a			;89b0
	ld l,068h		;89b1
	ld de,01040h		;89b3
	ld a,040h		;89b6
	add a,b			;89b8
	cp 068h		;89b9
	jr c,L_89BF		;89bb
	ld a,068h		;89bd
L_89BF:
	ld b,a			;89bf
	ld c,040h		;89c0
	jp L_880F		;89c2
L_89C5:
	ld hl,0ca31h		;89c5
	ld a,(hl)			;89c8
	and a			;89c9
	ret z			;89ca
	dec (hl)			;89cb
	ld h,a			;89cc
	ld l,010h		;89cd
	ld de,01040h		;89cf
	ld bc,06040h		;89d2
	jp L_880F		;89d5
L_89D8:
	ld hl,0ca31h		;89d8
	ld a,(hl)			;89db
	and a			;89dc
	ret z			;89dd
	dec (hl)			;89de
	sub 028h		;89df
	neg		;89e1
	ld b,a			;89e3
	ld a,040h		;89e4
	sub b			;89e6
	jr nc,L_89EA		;89e7
	xor a			;89e9
L_89EA:
	ld l,a			;89ea
	ld h,018h		;89eb
	ld de,08848h		;89ed
	ld bc,06840h		;89f0
	jp L_880F		;89f3
L_89F6:
	ld hl,0ca31h		;89f6
	ld a,(hl)			;89f9
	and a			;89fa
	ret z			;89fb
	dec (hl)			;89fc
	sub 028h		;89fd
	neg		;89ff
	ld b,a			;8a01
	ld a,020h		;8a02
	sub b			;8a04
	jr nc,L_8A08		;8a05
	xor a			;8a07
L_8A08:
	ld l,a			;8a08
	ld h,000h		;8a09
	ld de,0b048h		;8a0b
	ld bc,04040h		;8a0e
	jp L_880F		;8a11
L_8A14:
	ld hl,0ca31h		;8a14
	ld a,(hl)			;8a17
	and a			;8a18
	ret z			;8a19
	dec (hl)			;8a1a
	ld c,(hl)			;8a1b
	ld a,028h		;8a1c
	sub c			;8a1e
	add a,030h		;8a1f
	ld l,a			;8a21
	ld h,010h		;8a22
	ld de,01040h		;8a24
	ld bc,06040h		;8a27
	jp L_880F		;8a2a
L_8A2D:
	ld hl,00000h		;8a2d
	ld de,04010h		;8a30
	ld bc,080a8h		;8a33
	ld a,001h		;8a36
	jp 04767h		;8a38   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
L_8A3B:
	ld de,08b00h		;8a3b
	ld hl,0e900h		;8a3e   ; apunta a los caracteres de un dibujo pasados a 4 bits
	ld b,014h		;8a41
L_8A43:
	ld a,(de)			;8a43
	ld (hl),a			;8a44
	inc hl			;8a45
	inc de			;8a46
	ld a,(de)			;8a47
	ld (hl),a			;8a48
	inc de			;8a49
	inc hl			;8a4a
	djnz L_8A43		;8a4b
	ret			;8a4d
L_8A4E:
	ld hl,0e900h		;8a4e   ; apunta a los caracteres de un dibujo pasados a 4 bits
	push hl			;8a51
	ld b,00ah		;8a52
L_8A54:
	ld a,(hl)			;8a54
	inc hl			;8a55
	dec a			;8a56
	jr z,L_8A67		;8a57
	dec (hl)			;8a59
	ld a,(hl)			;8a5a
	cp 001h		;8a5b
	jr nz,L_8A73		;8a5d
	dec hl			;8a5f
	ld (hl),001h		;8a60
	inc hl			;8a62
	ld (hl),003h		;8a63
	jr L_8A73		;8a65
L_8A67:
	inc (hl)			;8a67
	ld a,(hl)			;8a68
	cp 00fh		;8a69
	jr nz,L_8A73		;8a6b
	dec hl			;8a6d
	ld (hl),000h		;8a6e
	inc hl			;8a70
	ld (hl),00dh		;8a71
L_8A73:
	inc hl			;8a73
	djnz L_8A54		;8a74
	ld b,00ah		;8a76
L_8A78:
	ld a,(hl)			;8a78
	inc hl			;8a79
	dec a			;8a7a
	jr z,L_8A8B		;8a7b
	dec (hl)			;8a7d
	ld a,(hl)			;8a7e
	cp 001h		;8a7f
	jr nz,L_8A97		;8a81
	dec hl			;8a83
	ld (hl),001h		;8a84
	inc hl			;8a86
	ld (hl),003h		;8a87
	jr L_8A97		;8a89
L_8A8B:
	inc (hl)			;8a8b
	ld a,(hl)			;8a8c
	cp 016h		;8a8d
	jr nz,L_8A97		;8a8f
	dec hl			;8a91
	ld (hl),000h		;8a92
	inc hl			;8a94
	ld (hl),014h		;8a95
L_8A97:
	inc hl			;8a97
	djnz L_8A78		;8a98
	pop de			;8a9a
	inc de			;8a9b
	ld hl,04064h		;8a9c
	ld b,00ah		;8a9f
L_8AA1:
	push bc			;8aa1
	push de			;8aa2
	push hl			;8aa3
	ld a,(de)			;8aa4
	ld b,a			;8aa5
	ld c,002h		;8aa6
	ld a,0cch		;8aa8
	ld d,000h		;8aaa
	call 046ffh		;8aac   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
	pop hl			;8aaf
	pop de			;8ab0
	push de			;8ab1
	push hl			;8ab2
	ld a,(de)			;8ab3
	ld b,a			;8ab4
	add a,h			;8ab5
	ld h,a			;8ab6
	ld a,010h		;8ab7
	sub b			;8ab9
	ld b,a			;8aba
	ld c,002h		;8abb
	xor a			;8abd
	ld d,000h		;8abe
	call 046ffh		;8ac0   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
	pop hl			;8ac3
	inc l			;8ac4
	inc l			;8ac5
	pop de			;8ac6
	inc de			;8ac7
	inc de			;8ac8
	pop bc			;8ac9
	djnz L_8AA1		;8aca
	ld hl,02664h		;8acc
	ld b,00ah		;8acf
L_8AD1:
	push bc			;8ad1
	push de			;8ad2
	push hl			;8ad3
	ld a,(de)			;8ad4
	ld b,a			;8ad5
	ld a,018h		;8ad6
	sub b			;8ad8
	ld b,a			;8ad9
	ld c,002h		;8ada
	xor a			;8adc
	ld d,000h		;8add
	call 046ffh		;8adf   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
	pop hl			;8ae2
	pop de			;8ae3
	push de			;8ae4
	push hl			;8ae5
	ld a,(de)			;8ae6
	ld b,a			;8ae7
	ld a,018h		;8ae8
	add a,h			;8aea
	sub b			;8aeb
	ld h,a			;8aec
	ld c,002h		;8aed
	ld a,0cch		;8aef
	ld d,000h		;8af1
	call 046ffh		;8af3   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
	pop hl			;8af6
	inc l			;8af7
	inc l			;8af8
	pop de			;8af9
	inc de			;8afa
	inc de			;8afb
	pop bc			;8afc
	djnz L_8AD1		;8afd
	ret			;8aff

; ----------------------------------------------------------------------
; DATOS resto_8B00: lo apuntan con el banco puesto p13:8A3B (0x8B00); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p13:8A3B (40 bytes)
;   0x8b00..0x8b28  (40 bytes)
DATA_resto_8B00:
	defb 001h,004h,001h,002h,001h,006h,001h,008h,001h,00ah,001h,008h,001h,002h,001h,006h	; 8b00  ................
	defb 001h,004h,001h,006h,001h,00ch,001h,00ah,001h,010h,001h,00ch,001h,014h,001h,006h	; 8b10  ................
	defb 001h,00ch,001h,008h,001h,006h,001h,008h	; 8b20  ........

; ======================================================================
; CODIGO 0x8b28..0x8b53  (43 bytes)
; ======================================================================


L_8B28:
	ld a,(0ca30h)		;8b28
	and 018h		;8b2b
	rra			;8b2d
	rra			;8b2e
	rra			;8b2f
	add a,a			;8b30
	add a,a			;8b31
	ld b,a			;8b32
	add a,a			;8b33
	add a,b			;8b34
	ld hl,08b53h		;8b35
	call 0423eh		;8b38   ; suma_a_hl: HL = HL + A
	ld de,0dc00h		;8b3b   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	ld bc,004ffh		;8b3e
L_8B41:
	ldi		;8b41
	ldi		;8b43
	ldi		;8b45
	inc de			;8b47
	djnz L_8B41		;8b48
	ld hl,0da00h		;8b4a   ; apunta a la copia de la tabla de colores de sprites: 32 x 16 lineas (va con 0xDC00 detras)
	ld de,08b83h		;8b4d
	jp 051e0h		;8b50   ; rachas_a_ram: deshace las rachas de DE en HL (n < 0x80 repite, n > 0x80 copia, 0 acaba)

; ----------------------------------------------------------------------
; DATOS resto_8B53: lo apuntan con el banco puesto p13:8B35 (0x8B53), p13:8B4D
;   (0x8B83); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p13:8B35, p13:8B4D (53 bytes)
;   0x8b53..0x8b88  (53 bytes)
DATA_resto_8B53:
	defb 04fh,0bdh,048h,05ah,0b2h,048h,065h,0c4h,078h,06dh,0a9h,07ch,052h,0aeh,04ch,058h	; 8b53  O.HZ.He.xm.|R.LX
	defb 0c3h,050h,065h,0c6h,070h,06ah,0b5h,074h,04ch,0afh,054h,05eh,0c2h,058h,064h,0c2h	; 8b63  .Pe.pj.tL.T^.Xd.
	defb 068h,06ah,0bdh,06ch,04bh,0b5h,060h,05eh,0bbh,05ch,064h,0c2h,064h,0e0h,000h,000h	; 8b73  hj.lK.`^.\d.d...
	defb 010h,004h,030h,003h,000h	; 8b83

; ======================================================================
; CODIGO 0x8b88..0x8b9e  (22 bytes)
; ======================================================================


L_8B88:
	ld a,0e0h		;8b88
L_8B8A:
	ld (de),a			;8b8a
	inc de			;8b8b
	inc de			;8b8c
	inc de			;8b8d
	inc de			;8b8e
	djnz L_8B8A		;8b8f
	ret			;8b91
L_8B92:
	push bc			;8b92
	ldi		;8b93
	ldi		;8b95
	ldi		;8b97
	inc de			;8b99
	pop bc			;8b9a
	djnz L_8B92		;8b9b
	ret			;8b9d

; ----------------------------------------------------------------------
; DATOS resto_8B9E: lo apuntan con el banco puesto p13:815A (0x8B9E), p13:8187
;   (0x8B9E), p13:818C (0x8BAD), p13:81E8 (0x8BBC), p13:8218 (0x8BBC),
;   p13:821D (0x8BCB); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p13:815A, p13:8187, p13:818C, p13:81E8, p13:8218,
;   p13:821D (322 bytes)
;   0x8b9e..0x8ce0  (322 bytes)
DATA_resto_8B9E:
	defb 03fh,048h,0a4h,03fh,058h,0a8h,057h,068h,094h,067h,058h,098h,067h,068h,09ch,048h	; 8b9e  ?H.?X.Wh.gX.gh.H
	defb 018h,08ch,047h,050h,090h,05fh,028h,0a0h,0e0h,000h,000h,0e0h,000h,000h,047h,0d0h	; 8bae  ..GP._(.......G.
	defb 0a4h,047h,0e0h,0a8h,0e0h,000h,000h,0e0h,000h,000h,0e0h,000h,000h,047h,0b0h,0a4h	; 8bbe  .G...........G..
	defb 047h,0c0h,0a8h,06fh,090h,0a0h,067h,0b0h,08ch,067h,0e0h,0a0h,04fh,028h,08ch,05fh	; 8bce  G..o..g..g..O(._
	defb 020h,090h,05fh,030h,094h,06fh,020h,098h,06fh,030h,09ch,071h,00fh,034h,047h,050h	; 8bde   ._0.o .o0.q.4GP
	defb 0a4h,047h,060h,0a8h,067h,050h,08ch,0e0h,000h,000h,04fh,040h,0a4h,04fh,050h,0a8h	; 8bee  .G`.gP....O@.OP.
	defb 057h,010h,08ch,05fh,048h,090h,04dh,01ah,000h,000h,04bh,020h,004h,000h,04dh,020h	; 8bfe  W.._H.M...K ..M
	defb 008h,000h,070h,061h,010h,000h,070h,061h,014h,000h,04dh,01dh,00ch,000h,074h,05fh	; 8c0e  ..pa..pa..M...t_
	defb 018h,000h,074h,05fh,01ch,000h,0e0h,000h,000h,000h,0e0h,000h,000h,000h,07ah,05dh	; 8c1e  ..t_..........z]
	defb 020h,000h,07ah,05dh,024h,000h,0e0h,000h,000h,000h,0e0h,000h,000h,000h,0e0h,000h	; 8c2e   .z]$...........
	defb 000h,000h,057h,030h,08ch,04fh,048h,0a8h,066h,090h,08ch,05ch,090h,08ch,050h,090h	; 8c3e  ..W0.OH.f..\..P.
	defb 08ch,066h,010h,030h,076h,010h,034h,04fh,0c0h,0a0h,0e0h,000h,000h,069h,087h,030h	; 8c4e  .f.0v.4O.....i.0
	defb 079h,087h,034h,066h,065h,030h,076h,065h,034h,06dh,0ddh,030h,07dh,0ddh,034h,027h	; 8c5e  y.4fe0ve4m.0}.4'
	defb 0a8h,034h,02fh,058h,08ch,03fh,050h,090h,03fh,060h,094h,04fh,050h,098h,04fh,060h	; 8c6e  .4/X.?P.?`.OP.O`
	defb 09ch,057h,080h,0a0h,077h,080h,0a4h,077h,090h,0a8h,08fh,0a0h,094h,09fh,090h,098h	; 8c7e  .W..w..w........
	defb 09fh,0a0h,09ch,017h,050h,0a0h,027h,080h,0a4h,027h,090h,0a8h,047h,080h,08ch,047h	; 8c8e  ....P.'..'..G..G
	defb 0b0h,0a0h,04fh,040h,034h,077h,0a0h,0a0h,080h,050h,08ch,088h,088h,090h,098h,048h	; 8c9e  ..O@4w...P.....H
	defb 090h,098h,0a8h,0a0h,0e0h,000h,000h,020h,00bh,010h,007h,010h,00bh,010h,047h,000h	; 8cae  ....... ......G.
	defb 020h,00bh,010h,047h,000h,010h,00bh,010h,047h,000h,052h,03bh,030h,060h,03bh,034h	; 8cbe   ..G....G.R.0`.4
	defb 048h,048h,038h,046h,054h,03ch,055h,048h,040h,055h,054h,044h,077h,010h,034h,0e0h	; 8cce  HH8FT<UH@UTDw.4.
	defb 000h,000h	; 8cde

; ======================================================================
; CODIGO 0x8ce0..0x8d05  (37 bytes)
; ======================================================================


L_8CE0:
	ld hl,08d05h		;8ce0
	call 043f6h		;8ce3   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	xor a			;8ce6
	ld (0ca31h),a		;8ce7
	ld a,(hl)			;8cea
	ld (0ca30h),a		;8ceb
	inc hl			;8cee
	ld de,0dc00h		;8cef   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	ld b,00ah		;8cf2
	call L_8B92		;8cf4
	ld hl,0da00h		;8cf7   ; apunta a la copia de la tabla de colores de sprites: 32 x 16 lineas (va con 0xDC00 detras)
	ld de,0da01h		;8cfa
	ld bc,0009fh		;8cfd
	ld (hl),007h		;8d00
	ldir		;8d02
	ret			;8d04

; ----------------------------------------------------------------------
; DATOS resto_8D05: lo apuntan con el banco puesto p13:8CE0 (0x8D05); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p13:8CE0 (165 bytes)
;   0x8d05..0x8daa  (165 bytes)
DATA_resto_8D05:
	defb 00fh,08dh,02eh,08dh,04dh,08dh,06ch,08dh,08bh,08dh,008h,03fh,018h,080h,04fh,018h	; 8d05  ....M.l....?..O.
	defb 080h,05fh,018h,080h,06fh,018h,080h,03fh,058h,080h,04fh,058h,080h,05fh,058h,080h	; 8d15  ._..o..?X.OX._X.
	defb 06fh,058h,080h,03fh,030h,084h,06fh,030h,088h,008h,04fh,01ch,080h,05fh,01ch,080h	; 8d25  oX.?0.o0..O.._..
	defb 06fh,01ch,080h,07fh,01ch,080h,04fh,05ch,080h,05fh,05ch,080h,06fh,05ch,080h,07fh	; 8d35  o.....O\._\.o\..
	defb 05ch,080h,04fh,034h,084h,07fh,034h,088h,007h,03fh,000h,080h,04fh,000h,080h,05fh	; 8d45  \.O4..4..?..O.._
	defb 000h,080h,06fh,000h,080h,03fh,040h,080h,04fh,040h,080h,05fh,040h,080h,06fh,040h	; 8d55  ..o..?@.O@._@.o@
	defb 080h,03fh,018h,084h,06fh,018h,088h,008h,03fh,098h,080h,04fh,098h,080h,05fh,098h	; 8d65  .?..o...?..O.._.
	defb 080h,06fh,098h,080h,03fh,0e8h,080h,04fh,0e8h,080h,05fh,0e8h,080h,06fh,0e8h,080h	; 8d75  .o..?..O.._..o..
	defb 02fh,0b8h,084h,07fh,0b8h,088h,007h,03fh,019h,080h,04fh,019h,080h,05fh,019h,080h	; 8d85  /......?..O.._..
	defb 06fh,019h,080h,03fh,061h,080h,04fh,061h,080h,05fh,061h,080h,06fh,061h,080h,03fh	; 8d95  o..?a.Oa._a.oa.?
	defb 035h,084h,06fh,035h,088h	; 8da5

; ======================================================================
; CODIGO 0x8daa..0x8ded  (67 bytes)
; ======================================================================


L_8DAA:
	ld c,a			;8daa
	ld hl,0ca31h		;8dab
	dec (hl)			;8dae
	ld a,(hl)			;8daf
	bit 2,a		;8db0
	ld a,007h		;8db2
	jr nz,L_8DB7		;8db4
	xor a			;8db6
L_8DB7:
	ld hl,0da00h		;8db7   ; apunta a la copia de la tabla de colores de sprites: 32 x 16 lineas (va con 0xDC00 detras)
	ld de,0da01h		;8dba
	ld bc,0009fh		;8dbd
	ld (hl),a			;8dc0
	ldir		;8dc1
	ld a,(0ca31h)		;8dc3
	and 01fh		;8dc6
	ret nz			;8dc8
	ld hl,0ca30h		;8dc9
	dec (hl)			;8dcc
	ld a,(hl)			;8dcd
	cp 004h		;8dce
	ret c			;8dd0
	ld a,c			;8dd1
	ld hl,08dedh		;8dd2
	call 043f6h		;8dd5   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld de,0dc00h		;8dd8   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	ld b,00ah		;8ddb
L_8DDD:
	ld a,(de)			;8ddd
	add a,(hl)			;8dde
	ld (de),a			;8ddf
	inc de			;8de0
	inc hl			;8de1
	ld a,(de)			;8de2
	add a,(hl)			;8de3
	ld (de),a			;8de4
	inc de			;8de5
	inc de			;8de6
	inc de			;8de7
	inc hl			;8de8
	dec b			;8de9
	jr nz,L_8DDD		;8dea
	ret			;8dec

; ----------------------------------------------------------------------
; DATOS resto_8DED: lo apuntan con el banco puesto p13:8DD2 (0x8DED); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p13:8DD2 (66 bytes)
;   0x8ded..0x8e2f  (66 bytes)
DATA_resto_8DED:
	defb 0f7h,08dh,00bh,08eh,0f7h,08dh,01bh,08eh,00bh,08eh,004h,004h,002h,004h,0feh,004h	; 8ded  ................
	defb 0fch,004h,004h,0fch,002h,0fch,0feh,0fch,0fch,0fch,004h,000h,0fch,000h,004h,008h	; 8dfd  ................
	defb 000h,008h,0fch,008h,004h,0f8h,000h,0f8h,0fch,0f8h,004h,000h,0fch,000h,002h,002h	; 8e0d  ................
	defb 001h,002h,0ffh,002h,0feh,002h,002h,0feh,001h,0feh,0ffh,0feh,0feh,0feh,002h,000h	; 8e1d  ................
	defb 0feh,000h	; 8e2d

; ======================================================================
; CODIGO 0x8e2f..0x8e38  (9 bytes)
; ======================================================================


L_8E2F:
	ld (0ca3bh),a		;8e2f
	ld a,(0ca2dh)		;8e32
	call 0424dh		;8e35   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_8E38: 6 destinos del despachador p00:424D (call en p13:8E35, el
;   indice en A): 8E44, 8E4B, 8E59, 8E69, 8E79, 8E81; lo leen p13:8E35 (12
;   bytes)
;   0x8e38..0x8e44  (12 bytes)
DATA_tabla_8E38:
	defw 08e44h,08e4bh,08e59h,08e69h,08e79h,08e81h	; 8e38

; ======================================================================
; CODIGO 0x8e44..0x8f5e  (282 bytes)
; ======================================================================


L_8E44:
	call L_8E88		;8e44
	ld a,040h		;8e47
	jr L_8E51		;8e49
L_8E4B:
	ld hl,0ca32h		;8e4b
	dec (hl)			;8e4e
	ret nz			;8e4f
	xor a			;8e50
L_8E51:
	ld (0ca32h),a		;8e51
L_8E54:
	ld hl,0ca2dh		;8e54
	inc (hl)			;8e57
	ret			;8e58
L_8E59:
	ld hl,0ca32h		;8e59
	inc (hl)			;8e5c
	ld a,(hl)			;8e5d
	and 003h		;8e5e
	ret nz			;8e60
	call L_8EB9		;8e61
	ret nz			;8e64
	xor a			;8e65
	jp L_8E51		;8e66
L_8E69:
	ld hl,0ca32h		;8e69
	inc (hl)			;8e6c
	ld a,(hl)			;8e6d
	and 007h		;8e6e
	ret nz			;8e70
	call L_8ED6		;8e71
	ret nz			;8e74
	xor a			;8e75
	jp L_8E51		;8e76
L_8E79:
	ld hl,0ca32h		;8e79
	dec (hl)			;8e7c
	ret nz			;8e7d
	jp L_8E54		;8e7e
L_8E81:
	call L_8EF2		;8e81
	ret c			;8e84
	jp L_8148		;8e85
L_8E88:
	ld a,(0ca3bh)		;8e88
	ld hl,08fb4h		;8e8b
	call 043f6h		;8e8e   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld (0ca33h),hl		;8e91
	ld a,(0ca3bh)		;8e94
	ld hl,08fe0h		;8e97
	call 043f6h		;8e9a   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld (0ca35h),hl		;8e9d
	ld a,(0ca3bh)		;8ea0
	ld hl,08fcah		;8ea3
	call 043f6h		;8ea6   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld (0ca37h),hl		;8ea9
	ld a,(0ca3bh)		;8eac
	ld hl,08ff6h		;8eaf
	call 043f6h		;8eb2   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld (0ca39h),hl		;8eb5
	ret			;8eb8
L_8EB9:
	ld de,(0ca33h)		;8eb9
	ld hl,(0ca35h)		;8ebd
	call 0417eh		;8ec0   ; bancos_53: pone el 53 en 0xA000 (con su copia en 0xC381-0xC383)
	call L_8EF4		;8ec3
	ld a,(hl)			;8ec6
	inc a			;8ec7
	jp z,04179h		;8ec8   ; bancos_13_14: pone el 13 en 0x8000, el 14 en 0xA000 (con su copia en 0xC381-0xC383)
	inc hl			;8ecb
	ld (0ca35h),hl		;8ecc
	ld (0ca33h),de		;8ecf
	jp 04179h		;8ed3   ; bancos_13_14: pone el 13 en 0x8000, el 14 en 0xA000 (con su copia en 0xC381-0xC383)
L_8ED6:
	ld de,(0ca37h)		;8ed6
	ld hl,(0ca39h)		;8eda
	call 0417eh		;8edd   ; bancos_53: pone el 53 en 0xA000 (con su copia en 0xC381-0xC383)
	call L_8F22		;8ee0
	ld a,(hl)			;8ee3
	inc a			;8ee4
	jp z,04179h		;8ee5   ; bancos_13_14: pone el 13 en 0x8000, el 14 en 0xA000 (con su copia en 0xC381-0xC383)
	ld (0ca39h),hl		;8ee8
	ld (0ca37h),de		;8eeb
	jp 04179h		;8eef   ; bancos_13_14: pone el 13 en 0x8000, el 14 en 0xA000 (con su copia en 0xC381-0xC383)
L_8EF2:
	xor a			;8ef2
	ret			;8ef3
L_8EF4:
	push hl			;8ef4
	push de			;8ef5
	call L_8F0A		;8ef6
	pop de			;8ef9
	push de			;8efa
	ld bc,00808h		;8efb
	ld a,002h		;8efe
	call 04767h		;8f00   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
	pop de			;8f03
	pop hl			;8f04
	inc hl			;8f05
	ld a,(hl)			;8f06
	add a,d			;8f07
	ld d,a			;8f08
	ret			;8f09
L_8F0A:
	ld a,(hl)			;8f0a
	and 0e0h		;8f0b
	rra			;8f0d
	rra			;8f0e
	ld d,a			;8f0f
	ld a,(0ca2ch)		;8f10
	cp 021h		;8f13
	ld a,d			;8f15
	jr nz,L_8F1A		;8f16
	sub 040h		;8f18
L_8F1A:
	ld e,a			;8f1a
	ld a,(hl)			;8f1b
	add a,a			;8f1c
	add a,a			;8f1d
	add a,a			;8f1e
	ld d,a			;8f1f
	ex de,hl			;8f20
	ret			;8f21
L_8F22:
	push de			;8f22
	push hl			;8f23
	push de			;8f24
	call L_8F0A		;8f25
	pop de			;8f28
	push de			;8f29
	ld bc,00808h		;8f2a
	ld a,002h		;8f2d
	call 04767h		;8f2f   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
	pop de			;8f32
	pop hl			;8f33
	inc hl			;8f34
	ld a,e			;8f35
	add a,008h		;8f36
	ld e,a			;8f38
	push hl			;8f39
	push de			;8f3a
	call L_8F0A		;8f3b
	pop de			;8f3e
	push de			;8f3f
	ld bc,00808h		;8f40
	ld a,002h		;8f43
	call 04767h		;8f45   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
	pop de			;8f48
	pop hl			;8f49
	inc hl			;8f4a
	pop de			;8f4b
	ld a,(hl)			;8f4c
	cp 0ffh		;8f4d
	jr z,L_8F5B		;8f4f
	bit 7,a		;8f51
	ld a,008h		;8f53
	jr z,L_8F5B		;8f55
	ld a,(hl)			;8f57
	and 07fh		;8f58
	inc hl			;8f5a
L_8F5B:
	add a,d			;8f5b
	ld d,a			;8f5c
	ret			;8f5d

; ----------------------------------------------------------------------
; DATOS resto_8F5E: lo apuntan con el banco puesto p13:83D3 (0x8F5E), p13:8451
;   (0x8F83), p13:8E8B (0x8FB4), p13:8EA3 (0x8FCA), p13:8E97 (0x8FE0),
;   p13:8EAF (0x8FF6); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p13:83D3, p13:8451, p13:8E8B, p13:8EA3, p13:8E97,
;   p13:8EAF (174 bytes)
;   0x8f5e..0x900c  (174 bytes)
DATA_resto_8F5E:
	defb 002h,040h,000h,003h,020h,000h,004h,060h,000h,005h,077h,007h,007h,070h,000h,008h	; 8f5e  .@.. ..`..w..p..
	defb 040h,000h,00ah,070h,000h,00bh,050h,000h,00ch,030h,000h,00dh,030h,000h,00eh,020h	; 8f6e  @..p..P..0..0..
	defb 000h,00fh,000h,000h,0ffh,000h,000h,000h,001h,003h,004h,002h,004h,005h,003h,006h	; 8f7e  ................
	defb 007h,004h,047h,006h,005h,000h,005h,006h,000h,003h,007h,077h,007h,008h,012h,002h	; 8f8e  ..G........w....
	defb 009h,006h,000h,00ah,070h,000h,00bh,070h,007h,00ch,070h,003h,00dh,044h,004h,00eh	; 8f9e  ....p..p..p..D..
	defb 033h,003h,00fh,000h,000h,0ffh,054h,02eh,054h,09dh,054h,09ch,054h,021h,054h,0a0h	; 8fae  3.....T.T.T.T!T.
	defb 054h,09ch,054h,0a9h,054h,021h,054h,031h,054h,09fh,054h,0a0h,068h,02ah,068h,090h	; 8fbe  T.T.T!T1T.T.h*h.
	defb 068h,08ah,068h,00ch,068h,0a0h,068h,08ch,068h,08ch,068h,00ch,068h,00ch,068h,080h	; 8fce  h.h.h.h.h.h.h.h.
	defb 068h,088h,035h,0bfh,035h,0bfh,053h,0bfh,089h,0bfh,089h,0bfh,0a7h,0bfh,025h,0bfh	; 8fde  h.5.5.S.......%.
	defb 0dbh,0bfh,071h,0bfh,00fh,0bfh,0c7h,0bfh,012h,0beh,027h,0beh,042h,0beh,05fh,0beh	; 8fee  ..q.......'.B._.
	defb 0bch,0beh,07ch,0beh,0f7h,0bdh,09ah,0beh,0ebh,0beh,0cch,0beh,0f7h,0bdh	; 8ffe  ..|...........

; ======================================================================
; CODIGO 0x900c..0x905d  (81 bytes)
; ======================================================================


L_900C:
	push hl			;900c
	push de			;900d
	ld de,06848h		;900e
	ld c,006h		;9011
	xor a			;9013
	call 046bch		;9014   ; marco: cuatro lineas: un marco de D x E desde HL
	pop de			;9017
	pop hl			;9018
	push hl			;9019
	ld b,008h		;901a
L_901C:
	push bc			;901c
	ld a,l			;901d
	add a,008h		;901e
	ld l,a			;9020
	push hl			;9021
	ld b,068h		;9022
	ld c,006h		;9024
	ld a,000h		;9026
	call 0467ch		;9028   ; linea_horizontal: orden LINE del VDP (R#36-R#46) con el lado largo en X
	pop hl			;902b
	pop bc			;902c
	djnz L_901C		;902d
	pop hl			;902f
	ld b,00ch		;9030
L_9032:
	push bc			;9032
	ld a,h			;9033
	add a,008h		;9034
	ld h,a			;9036
	push hl			;9037
	ld b,048h		;9038
	ld c,006h		;903a
	ld a,000h		;903c
	call 04680h		;903e   ; linea_vertical: orden LINE del VDP con el lado largo en Y (ARG = 1)
	pop hl			;9041
	pop bc			;9042
	djnz L_9032		;9043
	ret			;9045
L_9046:
	ld a,(0ca30h)		;9046
	add a,a			;9049
	ld hl,0905dh		;904a
	call 0423eh		;904d   ; suma_a_hl: HL = HL + A
	ld a,(hl)			;9050
	inc hl			;9051
	ld l,(hl)			;9052
	ld h,a			;9053
	ld de,04434h		;9054
	ld c,006h		;9057
	xor a			;9059
	jp 046bch		;905a   ; marco: cuatro lineas: un marco de D x E desde HL

; ----------------------------------------------------------------------
; DATOS resto_905D: lo apuntan con el banco puesto p13:904A (0x905D), p13:9834
;   (0x9060), p13:9862 (0x9060), p13:9879 (0x9060); el tamano es lo que hay
;   hasta lo siguiente, no sale de recorrerlo; lo leen p13:904A, p13:9834,
;   p13:9862, p13:9879 (18 bytes)
;   0x905d..0x906f  (18 bytes)
DATA_resto_905D:
	defb 016h,00eh,05eh,00eh,0a6h,00eh,016h,04eh,05eh,04eh,0a6h,04eh,016h,08eh,05eh,08eh	; 905d  ..^....N^N.N..^.
	defb 0a6h,08eh	; 906d

; ======================================================================
; CODIGO 0x906f..0x908a  (27 bytes)
; ======================================================================


L_906F:
	ld a,(0ca30h)		;906f
	add a,a			;9072
	add a,a			;9073
	ld hl,0908ah		;9074
	call 0423eh		;9077   ; suma_a_hl: HL = HL + A
	ld e,(hl)			;907a
	inc hl			;907b
	ld d,(hl)			;907c
	inc hl			;907d
	ld a,(hl)			;907e
	inc hl			;907f
	ld h,(hl)			;9080
	ld l,a			;9081
	ld bc,04030h		;9082
	ld a,001h		;9085
	jp 04767h		;9087   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)

; ----------------------------------------------------------------------
; DATOS resto_908A: lo apuntan con el banco puesto p13:9074 (0x908A), p13:9801
;   (0x90A0); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p13:9074, p13:9801 (36 bytes)
;   0x908a..0x90ae  (36 bytes)
DATA_resto_908A:
	defb 010h,018h,000h,000h,010h,060h,010h,040h,010h,0a8h,000h,030h,050h,018h,040h,030h	; 908a  .....`.@...0P.@0
	defb 050h,060h,030h,008h,050h,0a8h,040h,040h,090h,018h,060h,000h,090h,060h,068h,020h	; 909a  P`0.P.@@..`..`h
	defb 090h,0a8h,060h,040h	; 90aa

; ======================================================================
; CODIGO 0x90ae..0x90e7  (57 bytes)
; ======================================================================


L_90AE:
	ld hl,(0ca2eh)		;90ae
	ld a,l			;90b1
	and 0e0h		;90b2
	rra			;90b4
	rra			;90b5
	rra			;90b6
	rra			;90b7
	ld de,090e7h		;90b8
	call 04243h		;90bb   ; suma_a_de: DE = DE + A
	ld b,004h		;90be
	ld hl,0dc08h		;90c0
L_90C3:
	ld a,(de)			;90c3
	add a,(hl)			;90c4
	ld (hl),a			;90c5
	inc de			;90c6
	inc hl			;90c7
	ld a,(de)			;90c8
	add a,(hl)			;90c9
	ld (hl),a			;90ca
	dec de			;90cb
	inc hl			;90cc
	inc hl			;90cd
	inc hl			;90ce
	djnz L_90C3		;90cf
	ld de,0dc00h		;90d1   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	ld b,002h		;90d4
	ld hl,0ca2eh		;90d6
	bit 2,(hl)		;90d9
	ld hl,08cc8h		;90db
	jp nz,L_8B92		;90de
	ld hl,08cdah		;90e1
	jp L_8B92		;90e4

; ----------------------------------------------------------------------
; DATOS resto_90E7: lo apuntan con el banco puesto p13:90B8 (0x90E7); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p13:90B8 (16 bytes)
;   0x90e7..0x90f7  (16 bytes)
DATA_resto_90E7:
	defb 002h,0feh,000h,002h,0feh,0feh,002h,000h,0feh,002h,002h,000h,000h,0feh,0feh,002h	; 90e7  ................

; ======================================================================
; CODIGO 0x90f7..0x9218  (289 bytes)
; ======================================================================


L_90F7:
	ld a,(0ca2eh)		;90f7
	and 003h		;90fa
	ret nz			;90fc
L_90FD:
	ld hl,0f680h		;90fd
	ld b,000h		;9100
	ld e,000h		;9102
L_9104:
	push hl			;9104
	push de			;9105
	push bc			;9106
	call L_9135		;9107
	ld a,e			;910a
	or d			;910b
	pop bc			;910c
	pop de			;910d
	or e			;910e
	ld e,a			;910f
	pop hl			;9110
	inc hl			;9111
	inc hl			;9112
	inc b			;9113
	ld a,b			;9114
	cp 010h		;9115
	jr nz,L_9104		;9117
	ld a,e			;9119
	and a			;911a
	ret			;911b
L_911C:
	ld a,e			;911c
	and 0f0h		;911d
	jr z,L_9123		;911f
	sub 010h		;9121
L_9123:
	ld d,a			;9123
	ld a,e			;9124
	and 00fh		;9125
	jr z,L_912A		;9127
	dec a			;9129
L_912A:
	or d			;912a
	ld d,a			;912b
	ret			;912c
L_912D:
	ld a,e			;912d
	and 00fh		;912e
	jr z,L_9133		;9130
	dec a			;9132
L_9133:
	ld e,a			;9133
	ret			;9134
L_9135:
	push bc			;9135
	xor a			;9136
	call 044b9h		;9137   ; lee_byte_vram: A = el byte de la VRAM de HL
	ld e,a			;913a
	inc hl			;913b
	xor a			;913c
	call 044b9h		;913d   ; lee_byte_vram: A = el byte de la VRAM de HL
	ld b,a			;9140
	call L_911C		;9141
	ld e,b			;9144
	call L_912D		;9145
	pop bc			;9148
	push bc			;9149
	ld a,b			;914a
	push de			;914b
	call 04614h		;914c   ; pon_color: el color A de la paleta = D (rojo y azul), E (verde)
	pop de			;914f
	pop bc			;9150
	ret			;9151
L_9152:
	ld hl,0e900h		;9152   ; apunta a los caracteres de un dibujo pasados a 4 bits
	ld de,0e901h		;9155
	ld bc,00030h		;9158
	ld (hl),000h		;915b
	ldir		;915d
	xor a			;915f
	ld b,010h		;9160
	ld hl,0e900h		;9162   ; apunta a los caracteres de un dibujo pasados a 4 bits
L_9165:
	ld (hl),a			;9165
	inc hl			;9166
	inc hl			;9167
	inc hl			;9168
	inc a			;9169
	djnz L_9165		;916a
	ld (hl),0ffh		;916c
	ret			;916e
L_916F:
	ld a,(0ca2eh)		;916f
	and 007h		;9172
	ret nz			;9174
L_9175:
	ld a,000h		;9175
L_9177:
	ld (0ca2bh),a		;9177
	push de			;917a
	ld hl,0e901h		;917b
	ld b,010h		;917e
L_9180:
	push bc			;9180
	ld a,(de)			;9181
	and 0f0h		;9182
	ld b,a			;9184
	ld a,(hl)			;9185
	and 0f0h		;9186
	cp b			;9188
	jr z,L_9198		;9189
	push af			;918b
	ld a,(0ca2bh)		;918c
	and a			;918f
	ld b,010h		;9190
	jr z,L_9196		;9192
	ld b,0f0h		;9194
L_9196:
	pop af			;9196
	add a,b			;9197
L_9198:
	ld c,a			;9198
	ld a,(de)			;9199
	and 00fh		;919a
	ld b,a			;919c
	ld a,(hl)			;919d
	and 00fh		;919e
	cp b			;91a0
	jr z,L_91B0		;91a1
	push af			;91a3
	ld a,(0ca2bh)		;91a4
	and a			;91a7
	ld b,001h		;91a8
	jr z,L_91AE		;91aa
	ld b,0ffh		;91ac
L_91AE:
	pop af			;91ae
	add a,b			;91af
L_91B0:
	or c			;91b0
	ld (hl),a			;91b1
	inc hl			;91b2
	inc de			;91b3
	ld a,(de)			;91b4
	and 00fh		;91b5
	ld b,a			;91b7
	ld a,(hl)			;91b8
	and 00fh		;91b9
	cp b			;91bb
	jr z,L_91CB		;91bc
	push af			;91be
	ld a,(0ca2bh)		;91bf
	and a			;91c2
	ld b,001h		;91c3
	jr z,L_91C9		;91c5
	ld b,0ffh		;91c7
L_91C9:
	pop af			;91c9
	add a,b			;91ca
L_91CB:
	ld (hl),a			;91cb
	inc hl			;91cc
	inc hl			;91cd
	inc de			;91ce
	pop bc			;91cf
	djnz L_9180		;91d0
	pop de			;91d2
	ld hl,0e901h		;91d3
	ld b,010h		;91d6
L_91D8:
	ld a,(de)			;91d8
	cp (hl)			;91d9
	jr nz,L_91E7		;91da
	inc de			;91dc
	inc hl			;91dd
	ld a,(de)			;91de
	cp (hl)			;91df
	jr nz,L_91E7		;91e0
	inc hl			;91e2
	inc hl			;91e3
	inc de			;91e4
	djnz L_91D8		;91e5
L_91E7:
	push af			;91e7
	ld hl,0e900h		;91e8   ; apunta a los caracteres de un dibujo pasados a 4 bits
	call 0463fh		;91eb   ; pon_paleta_con_espera: pone la paleta de HL (p00:4642) esperando al VDP antes
	pop af			;91ee
	ret			;91ef
L_91F0:
	ld hl,0e900h		;91f0   ; apunta a los caracteres de un dibujo pasados a 4 bits
	ld de,0e901h		;91f3
	ld bc,00030h		;91f6
	ld (hl),000h		;91f9
	ldir		;91fb
	xor a			;91fd
	ld b,010h		;91fe
	ld hl,0e900h		;9200   ; apunta a los caracteres de un dibujo pasados a 4 bits
	ld de,09258h		;9203
L_9206:
	ld (hl),a			;9206
	push af			;9207
	inc hl			;9208
	ld a,(de)			;9209
	ld (hl),a			;920a
	inc hl			;920b
	inc de			;920c
	ld a,(de)			;920d
	ld (hl),a			;920e
	inc de			;920f
	inc hl			;9210
	pop af			;9211
	inc a			;9212
	djnz L_9206		;9213
	ld (hl),0ffh		;9215
	ret			;9217

; ----------------------------------------------------------------------
; DATOS resto_9218: lo apuntan con el banco puesto p13:80AA (0x9218), p13:80EE
;   (0x9218), p13:8757 (0x9238), p13:9203 (0x9258), p13:87B7 (0x9278),
;   p14:A2B3 (0x9278); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p13:80AA, p13:80EE, p13:8757, p13:9203, p13:87B7,
;   p14:A2B3 (185 bytes)
;   0x9218..0x92d1  (185 bytes)
DATA_resto_9218:
	defb 000h,000h,003h,004h,004h,005h,006h,007h,047h,006h,000h,005h,000h,003h,077h,007h	; 9218  ........G.....w.
	defb 012h,002h,006h,000h,070h,000h,070h,007h,070h,003h,044h,004h,033h,003h,000h,000h	; 9228  ....p.p.p.D.3...
	defb 000h,000h,003h,004h,004h,005h,006h,007h,047h,006h,000h,005h,000h,003h,077h,007h	; 9238  ........G.....w.
	defb 012h,002h,006h,000h,070h,000h,070h,007h,070h,003h,044h,004h,033h,003h,000h,000h	; 9248  ....p.p.p.D.3...
	defb 000h,000h,011h,001h,060h,004h,030h,002h,000h,000h,000h,000h,067h,007h,000h,000h	; 9258  ....`.0.....g...
	defb 027h,005h,007h,003h,070h,000h,064h,005h,050h,003h,002h,004h,001h,002h,000h,000h	; 9268  '...p.d.P.......
	defb 077h,007h,077h,007h,077h,007h,077h,007h,077h,007h,077h,007h,077h,007h,077h,007h	; 9278  w.w.w.w.w.w.w.w.
	defb 077h,007h,077h,007h,077h,007h,077h,007h,077h,007h,077h,007h,077h,007h,077h,007h	; 9288  w.w.w.w.w.w.w.w.
	defb 000h,000h,001h,001h,001h,002h,002h,003h,003h,004h,004h,006h,055h,007h,066h,006h	; 9298  ............U.f.
	defb 044h,004h,000h,006h,070h,000h,070h,007h,060h,004h,060h,003h,030h,002h,000h,000h	; 92a8  D...p.p.`.`.0...
	defb 044h,050h,015h,019h,018h,00bh,017h,013h,0f0h,01ah,01ch,00fh,01dh,00fh,018h,01eh	; 92b8  DP..............
	defb 01dh,0feh,070h,060h,002h,00ah,00ah,001h,0ffh	; 92c8  ..p`.....

; ======================================================================
; CODIGO 0x92d1..0x955f  (654 bytes)
; ======================================================================


L_92D1:
	call 045f1h		;92d1   ; apaga_pantalla_y_sprites: p00:45CC y p00:45F6
	call 0418eh		;92d4   ; bancos_56: pone el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	ld hl,0ae95h		;92d7
	call 0463fh		;92da   ; pon_paleta_con_espera: pone la paleta de HL (p00:4642) esperando al VDP antes
	ld b,00fh		;92dd
	ld c,007h		;92df
	call 00047h		;92e1   ; BIOS WRTVDP - Writes data in the VDP-register
	ld hl,02840h		;92e4
	ld bc,0a848h		;92e7
	xor a			;92ea
	ld d,003h		;92eb
	call 046ffh		;92ed   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
	ld hl,0aee6h		;92f0
	ld de,00800h		;92f3
	ld bc,00d01h		;92f6
	call 0489ch		;92f9   ; caracteres_a_4_bits: B caracteres de un bit pasados a cuatro con el color C
	ld hl,0af4eh		;92fc
	ld de,07000h		;92ff
	ld bc,00d02h		;9302
	call 0489ch		;9305   ; caracteres_a_4_bits: B caracteres de un bit pasados a cuatro con el color C
	ld hl,0afb6h		;9308
	ld de,0d800h		;930b
	ld bc,01a03h		;930e
	call 0489ch		;9311   ; caracteres_a_4_bits: B caracteres de un bit pasados a cuatro con el color C
	ld de,04040h		;9314
	ld hl,0aea5h		;9317
	call L_9351		;931a
	call 041efh		;931d   ; bancos_14: pone el 14 en 0xA000 (con su copia en 0xC381-0xC383)
	call 04606h		;9320   ; enciende_todo: la pantalla y los sprites encendidos
	ld hl,0ca12h		;9323
	ld (hl),03ch		;9326
	inc hl			;9328
	ld (hl),031h		;9329
	inc hl			;932b
	ld (hl),000h		;932c
	ret			;932e
L_932F:
	ld hl,0ca12h		;932f
	dec (hl)			;9332
	ld a,(hl)			;9333
	and 001h		;9334
	ret nz			;9336
	inc hl			;9337
	dec (hl)			;9338
	jr nz,L_9341		;9339
	ld a,001h		;933b
	ld (0ca14h),a		;933d
	ret			;9340
L_9341:
	ld a,031h		;9341
	sub (hl)			;9343
	ld c,a			;9344
	ld b,0a8h		;9345
	ld hl,02840h		;9347
	ld d,h			;934a
	ld e,l			;934b
	ld a,003h		;934c
	jp 04767h		;934e   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
L_9351:
	push de			;9351
L_9352:
	ld a,(hl)			;9352
	inc hl			;9353
	ld c,a			;9354
	inc a			;9355
	jr z,L_936F		;9356
	inc a			;9358
	jr nz,L_9366		;9359
	pop de			;935b
	ld a,(hl)			;935c
	inc hl			;935d
	add a,d			;935e
	ld d,a			;935f
	ld a,008h		;9360
	add a,e			;9362
	ld e,a			;9363
	jr L_9351		;9364
L_9366:
	ld a,c			;9366
	call 049fbh		;9367   ; pieza_de_3_a_3:
	call 04af9h		;936a   ; siguiente_caracter: avanza al siguiente caracter (PR2 p01:6937)
	jr L_9352		;936d
L_936F:
	pop de			;936f
	ret			;9370
L_9371:
	ld a,001h		;9371
	ld (0cadah),a		;9373
	ld a,c			;9376
	ld (0cadbh),a		;9377
	xor a			;937a
	ld (0cadch),a		;937b
	ld de,0e900h		;937e   ; apunta a los caracteres de un dibujo pasados a 4 bits
	ld bc,00031h		;9381
	ldir		;9384
	ret			;9386
L_9387:
	ld a,(0cadah)		;9387
	or a			;938a
	ret z			;938b
	ld hl,0cadbh		;938c
	dec (hl)			;938f
	ret nz			;9390
	ld (hl),c			;9391
	ld hl,0e900h		;9392   ; apunta a los caracteres de un dibujo pasados a 4 bits
	ld b,010h		;9395
L_9397:
	ld a,(hl)			;9397
	cp 0ffh		;9398
	jr z,L_93AE		;939a
	inc hl			;939c
	push hl			;939d
	push bc			;939e
	call L_93BC		;939f
	ld hl,0e900h		;93a2   ; apunta a los caracteres de un dibujo pasados a 4 bits
	call 0463fh		;93a5   ; pon_paleta_con_espera: pone la paleta de HL (p00:4642) esperando al VDP antes
	pop bc			;93a8
	pop hl			;93a9
	inc hl			;93aa
	inc hl			;93ab
	djnz L_9397		;93ac
L_93AE:
	call L_93DD		;93ae
	ld hl,0cadch		;93b1
	inc (hl)			;93b4
	ld a,(hl)			;93b5
	cp 003h		;93b6
	ret c			;93b8
	ld (hl),000h		;93b9
	ret			;93bb
L_93BC:
	call L_93C4		;93bc
	call L_93D2		;93bf
	jr L_93DA		;93c2
L_93C4:
	ld a,(hl)			;93c4
	and 0f0h		;93c5
	ret z			;93c7
	ld a,(hl)			;93c8
	sub 010h		;93c9
	ld b,a			;93cb
	ld a,(hl)			;93cc
	and 00fh		;93cd
	or b			;93cf
	ld (hl),a			;93d0
	ret			;93d1
L_93D2:
	ld a,(hl)			;93d2
	and 00fh		;93d3
	ret z			;93d5
	ld a,(hl)			;93d6
	dec a			;93d7
	ld (hl),a			;93d8
	ret			;93d9
L_93DA:
	inc hl			;93da
	jr L_93D2		;93db
L_93DD:
	ld hl,0e900h		;93dd   ; apunta a los caracteres de un dibujo pasados a 4 bits
	ld b,011h		;93e0
L_93E2:
	ld a,(hl)			;93e2
	cp 0ffh		;93e3
	jr z,L_93F2		;93e5
	inc hl			;93e7
	ld a,(hl)			;93e8
	or a			;93e9
	ret nz			;93ea
	inc hl			;93eb
	ld a,(hl)			;93ec
	or a			;93ed
	ret nz			;93ee
	inc hl			;93ef
	djnz L_93E2		;93f0
L_93F2:
	xor a			;93f2
	ld (0cadah),a		;93f3
	ret			;93f6
L_93F7:
	ld a,002h		;93f7
	ld (0cadah),a		;93f9
	ld a,c			;93fc
	ld (0cadbh),a		;93fd
	xor a			;9400
	ld (0cadch),a		;9401
	ld de,0e900h		;9404   ; apunta a los caracteres de un dibujo pasados a 4 bits
	ld bc,00031h		;9407
	ldir		;940a
	ld b,010h		;940c
	xor a			;940e
	ld hl,0e900h		;940f   ; apunta a los caracteres de un dibujo pasados a 4 bits
L_9412:
	inc hl			;9412
	ld (hl),a			;9413
	inc hl			;9414
	ld (hl),a			;9415
	inc hl			;9416
	djnz L_9412		;9417
	ret			;9419
L_941A:
	ld a,(0cadah)		;941a
	cp 002h		;941d
	ret nz			;941f
	ld hl,0cadbh		;9420
	dec (hl)			;9423
	ret nz			;9424
	ld (hl),c			;9425
	push de			;9426
	ld hl,0e900h		;9427   ; apunta a los caracteres de un dibujo pasados a 4 bits
	ld b,010h		;942a
L_942C:
	ld a,(hl)			;942c
	cp 0ffh		;942d
	jr z,L_9448		;942f
	inc hl			;9431
	inc de			;9432
	push hl			;9433
	push de			;9434
	push bc			;9435
	call L_9457		;9436
	ld hl,0e900h		;9439   ; apunta a los caracteres de un dibujo pasados a 4 bits
	call 0463fh		;943c   ; pon_paleta_con_espera: pone la paleta de HL (p00:4642) esperando al VDP antes
	pop bc			;943f
	pop de			;9440
	pop hl			;9441
	inc hl			;9442
	inc hl			;9443
	inc de			;9444
	inc de			;9445
	djnz L_942C		;9446
L_9448:
	pop de			;9448
	call L_948E		;9449
	ld hl,0cadch		;944c
	inc (hl)			;944f
	ld a,(hl)			;9450
	cp 003h		;9451
	ret c			;9453
	ld (hl),000h		;9454
	ret			;9456
L_9457:
	call L_945F		;9457
	call L_9475		;945a
	jr L_948A		;945d
L_945F:
	ld a,(de)			;945f
	and 0f0h		;9460
	ld b,a			;9462
	ld a,(hl)			;9463
	and 0f0h		;9464
	cp b			;9466
	ret z			;9467
	add a,010h		;9468
	cp b			;946a
	jr c,L_946E		;946b
	ld a,b			;946d
L_946E:
	ld b,a			;946e
	ld a,(hl)			;946f
	and 00fh		;9470
	or b			;9472
	ld (hl),a			;9473
	ret			;9474
L_9475:
	ld a,(de)			;9475
	and 00fh		;9476
	ld b,a			;9478
	ld a,(hl)			;9479
	and 00fh		;947a
	cp b			;947c
	ret z			;947d
	inc a			;947e
	cp b			;947f
	jr c,L_9483		;9480
	ld a,b			;9482
L_9483:
	ld b,a			;9483
	ld a,(hl)			;9484
	and 0f0h		;9485
	or b			;9487
	ld (hl),a			;9488
	ret			;9489
L_948A:
	inc hl			;948a
	inc de			;948b
	jr L_9475		;948c
L_948E:
	ld hl,0e900h		;948e   ; apunta a los caracteres de un dibujo pasados a 4 bits
	ld b,031h		;9491
L_9493:
	ld a,(de)			;9493
	cp 0ffh		;9494
	jr z,L_949E		;9496
	cp (hl)			;9498
	ret nz			;9499
	inc hl			;949a
	inc de			;949b
	djnz L_9493		;949c
L_949E:
	xor a			;949e
	ld (0cadah),a		;949f
	ret			;94a2
L_94A3:
	ld a,003h		;94a3
	ld (0cadah),a		;94a5
	ld a,c			;94a8
	ld (0cadbh),a		;94a9
	ld de,0e900h		;94ac   ; apunta a los caracteres de un dibujo pasados a 4 bits
	ld bc,00031h		;94af
	ldir		;94b2
	ret			;94b4
L_94B5:
	ld a,(0cadah)		;94b5
	cp 003h		;94b8
	ret nz			;94ba
	ld hl,0cadbh		;94bb
	dec (hl)			;94be
	ret nz			;94bf
	ld (hl),c			;94c0
	ld hl,0e900h		;94c1   ; apunta a los caracteres de un dibujo pasados a 4 bits
	ld b,010h		;94c4
L_94C6:
	ld a,(hl)			;94c6
	cp 0ffh		;94c7
	jr z,L_94DD		;94c9
	inc hl			;94cb
	push hl			;94cc
	push bc			;94cd
	call L_94E1		;94ce
	ld hl,0e900h		;94d1   ; apunta a los caracteres de un dibujo pasados a 4 bits
	call 0463fh		;94d4   ; pon_paleta_con_espera: pone la paleta de HL (p00:4642) esperando al VDP antes
	pop bc			;94d7
	pop hl			;94d8
	inc hl			;94d9
	inc hl			;94da
	djnz L_94C6		;94db
L_94DD:
	call L_9506		;94dd
	ret			;94e0
L_94E1:
	call L_94E9		;94e1
	call L_94F9		;94e4
	jr L_9503		;94e7
L_94E9:
	ld a,(hl)			;94e9
	and 0f0h		;94ea
	cp 070h		;94ec
	ret z			;94ee
	ld a,(hl)			;94ef
	add a,010h		;94f0
	ld b,a			;94f2
	ld a,(hl)			;94f3
	and 00fh		;94f4
	or b			;94f6
	ld (hl),a			;94f7
	ret			;94f8
L_94F9:
	ld a,(hl)			;94f9
	and 00fh		;94fa
	cp 007h		;94fc
	ret z			;94fe
	ld a,(hl)			;94ff
	inc a			;9500
	ld (hl),a			;9501
	ret			;9502
L_9503:
	inc hl			;9503
	jr L_94F9		;9504
L_9506:
	ld hl,0e900h		;9506   ; apunta a los caracteres de un dibujo pasados a 4 bits
	ld b,011h		;9509
L_950B:
	ld a,(hl)			;950b
	cp 0ffh		;950c
	jr z,L_951D		;950e
	inc hl			;9510
	ld a,(hl)			;9511
	cp 077h		;9512
	ret nz			;9514
	inc hl			;9515
	ld a,(hl)			;9516
	cp 007h		;9517
	ret nz			;9519
	inc hl			;951a
	djnz L_950B		;951b
L_951D:
	xor a			;951d
	ld (0cadah),a		;951e
	ret			;9521
L_9522:
	call 04183h		;9522   ; bancos_54: pone el 54 en 0xA000 (con su copia en 0xC381-0xC383)
	ld de,0bea0h		;9525   ; tabla_colores_BEA0: 24 punteros a colores de dibujo
	ld hl,0bf21h		;9528   ; lista_BF21: 21 fichas de dibujo de 5 bytes [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF
	call 04d52h		;952b   ; dibujos_en_4000: en la VRAM de 0x4000
	ld de,0bea0h		;952e   ; tabla_colores_BEA0: 24 punteros a colores de dibujo
	ld hl,0bf8bh		;9531   ; lista_BF8B: 13 fichas de dibujo de 5 bytes [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF
	call 04d56h		;9534   ; dibujos_en_6000: en la VRAM de 0x6000
	jp 04179h		;9537   ; bancos_13_14: pone el 13 en 0x8000, el 14 en 0xA000 (con su copia en 0xC381-0xC383)
L_953A:
	call 04183h		;953a   ; bancos_54: pone el 54 en 0xA000 (con su copia en 0xC381-0xC383)
	ld de,0bea0h		;953d   ; tabla_colores_BEA0: 24 punteros a colores de dibujo
	ld hl,0bfcdh		;9540   ; lista_BFCD: 3 fichas de dibujo de 5 bytes [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF
	call 04d56h		;9543   ; dibujos_en_6000: en la VRAM de 0x6000
	jp 04179h		;9546   ; bancos_13_14: pone el 13 en 0x8000, el 14 en 0xA000 (con su copia en 0xC381-0xC383)
L_9549:
	call 04183h		;9549   ; bancos_54: pone el 54 en 0xA000 (con su copia en 0xC381-0xC383)
	ld de,0a188h		;954c
	call 04534h		;954f   ; rachas_otro_destino: la orden 0x80 de las rachas: [pagina][VRAM lo hi] y sigue
	jp 04179h		;9552   ; bancos_13_14: pone el 13 en 0x8000, el 14 en 0xA000 (con su copia en 0xC381-0xC383)
L_9555:
	ld hl,0d705h		;9555
	inc (hl)			;9558
	ld a,(0d701h)		;9559
	call 0424dh		;955c   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_955F: 31 destinos del despachador p00:424D (call en p13:955C, el
;   indice en A): 959D, 95B0, 95D6, 9640, 96A3, 96B9, 96E7, 96F9, 9715, 9741,
;   974E, 976B, 97C6, 97CE, 97DE, 981F, 98A1, 98B4, 9910, 991A, 9922, 99CE,
;   99E3, 9A01, 9A1F, 9A29, 9A46, 9A5B, 9CCE, 9CDC, 9CEE; lo leen p13:955C (62
;   bytes)
;   0x955f..0x959d  (62 bytes)
DATA_tabla_955F:
	defw 0959dh,095b0h,095d6h,09640h,096a3h,096b9h,096e7h,096f9h	; 955f
	defw 09715h,09741h,0974eh,0976bh,097c6h,097ceh,097deh,0981fh	; 956f
	defw 098a1h,098b4h,09910h,0991ah,09922h,099ceh,099e3h,09a01h	; 957f
	defw 09a1fh,09a29h,09a46h,09a5bh,09cceh,09cdch,09ceeh	; 958f

; ======================================================================
; CODIGO 0x959d..0x9928  (907 bytes)
; ======================================================================


L_959D:
	ld bc,00600h		;959d
	call 00047h		;95a0   ; BIOS WRTVDP - Writes data in the VDP-register
	ld c,001h		;95a3
	ld hl,09fc1h		;95a5
	call L_9371		;95a8
	call 06be8h		;95ab   ; orden_sonido_f6: la orden 0xF6 al sonido
	jr L_960E		;95ae
L_95B0:
	ld c,001h		;95b0
	call L_9387		;95b2
	ld a,(0cadah)		;95b5
	or a			;95b8
	ret nz			;95b9
	ld hl,001a4h		;95ba
	ld (0d713h),hl		;95bd
	call 045f1h		;95c0   ; apaga_pantalla_y_sprites: p00:45CC y p00:45F6
	xor a			;95c3
	ld hl,0ca42h		;95c4   ; apunta a la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	ld (hl),a			;95c7
	call 04879h		;95c8   ; pon_pagina_visible: la pagina A a la vista (0xFAF5, DPPAGE de la BIOS)
	call L_9620		;95cb
	call 04266h		;95ce   ; esconde_sprites_ram: llena 0xDC00-0xDC7F con 0xE0
	call 045d7h		;95d1   ; esconde_sprites_vram: llena con 0xE0 128 bytes de la VRAM en 0xF600 y otros 128 en 0xF200
	jr L_960E		;95d4
L_95D6:
	call L_9613		;95d6
	ld hl,(0d713h)		;95d9
	dec hl			;95dc
	ld (0d713h),hl		;95dd
	ld a,h			;95e0
	or l			;95e1
	ret nz			;95e2
	call 045f1h		;95e3   ; apaga_pantalla_y_sprites: p00:45CC y p00:45F6
	call L_962E		;95e6
	ld hl,09ff2h		;95e9
	call 0463fh		;95ec   ; pon_paleta_con_espera: pone la paleta de HL (p00:4642) esperando al VDP antes
	call 04606h		;95ef   ; enciende_todo: la pantalla y los sprites encendidos
	call 06f07h		;95f2   ; letras_b093: 0x26 letras de p58:B093 en 4 bits, con el color 5, a la VRAM de 0x0080
	call 06f19h		;95f5   ; dibujos_8114_en_e000: los dibujos de p52:8114 en la VRAM de 0xE000
	call L_9522		;95f8
	call 0715eh		;95fb   ; mosaico_bb4a: el mosaico en rachas de p54:BB4A (0x0B x 0x10) en X = 0x40, Y = 0x41
	call L_9549		;95fe
	ld hl,0d703h		;9601
	ld (hl),006h		;9604
	ld hl,0d70bh		;9606
	ld (hl),001h		;9609
	inc l			;960b
	ld (hl),000h		;960c
L_960E:
	ld hl,0d701h		;960e
	inc (hl)			;9611
	ret			;9612
L_9613:
	ld hl,(0d713h)		;9613
	ld de,000b4h		;9616
	and a			;9619
	sbc hl,de		;961a
	jp z,06cb2h		;961c   ; sonido_98: pide el sonido 0x98 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ret			;961f
L_9620:
	ld a,002h		;9620
	call 0444ah		;9622   ; borra_pagina_0_negro: la pagina D entera a 0 desde (0, 0)
L_9625:
	ld a,001h		;9625
	call 0444ah		;9627   ; borra_pagina_0_negro: la pagina D entera a 0 desde (0, 0)
L_962A:
	xor a			;962a
	jp 0444ah		;962b   ; borra_pagina_0_negro: la pagina D entera a 0 desde (0, 0)
L_962E:
	xor a			;962e
	call L_9634		;962f
L_9632:
	ld a,001h		;9632
L_9634:
	ld hl,04040h		;9634
	ld bc,08058h		;9637
	ld d,a			;963a
	ld a,077h		;963b
	jp 046ffh		;963d   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
L_9640:
	call L_9EC8		;9640
	call L_9DA7		;9643
	call L_9D0D		;9646
	ld hl,0d703h		;9649
	dec (hl)			;964c
	ret nz			;964d
	ld (hl),004h		;964e
	call L_9668		;9650
	call L_9674		;9653
	call L_9685		;9656
	ld hl,0d706h		;9659
	inc (hl)			;965c
	ld a,(hl)			;965d
	cp 058h		;965e
	ret c			;9660
	ld hl,0d703h		;9661
	ld (hl),000h		;9664
	jr L_960E		;9666
L_9668:
	call 04650h		;9668   ; espera_vdp: espera a que el VDP acabe la orden en curso (S#2 bit 0)
	ld a,(0d706h)		;966b
	ld b,a			;966e
	ld c,017h		;966f
	jp 00047h		;9671   ; BIOS WRTVDP - Writes data in the VDP-register
L_9674:
	ld a,040h		;9674
	ld hl,0d706h		;9676
	add a,(hl)			;9679
	ld e,a			;967a
	ld hl,04000h		;967b
	ld d,001h		;967e
	ld a,001h		;9680
	jp 047abh		;9682   ; copia_en_y: orden YMMM del VDP
L_9685:
	ld hl,0d706h		;9685
	ld e,(hl)			;9688
	ld a,e			;9689
	ld b,e			;968a
	cp 058h		;968b
	jr c,L_9692		;968d
	sub 058h		;968f
	ld b,a			;9691
L_9692:
	ld a,040h		;9692
	add a,b			;9694
	ld l,a			;9695
	ld h,040h		;9696
	ld d,001h		;9698
	ld a,098h		;969a
	add a,e			;969c
	ld e,a			;969d
	ld a,001h		;969e
	jp 047abh		;96a0   ; copia_en_y: orden YMMM del VDP
L_96A3:
	call L_9EC8		;96a3
	call L_9DA7		;96a6
	call L_9D0D		;96a9
	ld hl,0d703h		;96ac
	dec (hl)			;96af
	ret nz			;96b0
	ld (hl),002h		;96b1
	call L_9632		;96b3
	jp L_960E		;96b6
L_96B9:
	call L_9EC8		;96b9
	call L_9DA7		;96bc
	call L_9D0D		;96bf
	ld hl,0d703h		;96c2
	dec (hl)			;96c5
	ret nz			;96c6
	ld (hl),002h		;96c7
	call L_9668		;96c9
	call L_9674		;96cc
	call L_9685		;96cf
	ld hl,0d706h		;96d2
	inc (hl)			;96d5
	ld a,(hl)			;96d6
	cp 084h		;96d7
	jp z,06be8h		;96d9   ; orden_sonido_f6: la orden 0xF6 al sonido
	cp 0b0h		;96dc
	ret c			;96de
	ld hl,0d703h		;96df
	ld (hl),040h		;96e2
	jp L_960E		;96e4
L_96E7:
	call L_9DA7		;96e7
	ld hl,0d703h		;96ea
	dec (hl)			;96ed
	ret nz			;96ee
	ld (hl),008h		;96ef
	ld hl,0d706h		;96f1
	ld (hl),007h		;96f4
	jp L_960E		;96f6
L_96F9:
	ld hl,0d703h		;96f9
	dec (hl)			;96fc
	ret nz			;96fd
	ld (hl),006h		;96fe
	ld hl,0d706h		;9700
	dec (hl)			;9703
	ld a,(hl)			;9704
	call z,L_960E		;9705
L_9708:
	ld e,a			;9708
	ld d,a			;9709
	rlca			;970a
	rlca			;970b
	rlca			;970c
	rlca			;970d
	or d			;970e
	ld d,a			;970f
	ld a,007h		;9710
	jp 04614h		;9712   ; pon_color: el color A de la paleta = D (rojo y azul), E (verde)
L_9715:
	call 045f1h		;9715   ; apaga_pantalla_y_sprites: p00:45CC y p00:45F6
	call L_962A		;9718
	ld b,000h		;971b
	ld c,017h		;971d
	call 00047h		;971f   ; BIOS WRTVDP - Writes data in the VDP-register
	call 04266h		;9722   ; esconde_sprites_ram: llena 0xDC00-0xDC7F con 0xE0
	ld hl,0a01dh		;9725
	call 0463fh		;9728   ; pon_paleta_con_espera: pone la paleta de HL (p00:4642) esperando al VDP antes
	call 07190h		;972b   ; mosaico_bbd5: el mosaico de p54:BBD5 (0x0C x 0x10) en X = 0x40, Y = 0x38
	call 04606h		;972e   ; enciende_todo: la pantalla y los sprites encendidos
	call 06bc0h		;9731   ; sonido_a3: pide el sonido 0xA3 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld a,0c0h		;9734
	ld (0d709h),a		;9736
	ld hl,0d703h		;9739
	ld (hl),080h		;973c
	jp L_960E		;973e
L_9741:
	call L_9F4C		;9741
	ld hl,0d703h		;9744
	dec (hl)			;9747
	ret nz			;9748
	ld (hl),004h		;9749
	jp L_960E		;974b
L_974E:
	call L_9EFD		;974e
	call L_9F4C		;9751
	ld hl,0d703h		;9754
	dec (hl)			;9757
	ret nz			;9758
	ld (hl),004h		;9759
	ld hl,0d709h		;975b
	dec (hl)			;975e
	ld a,(hl)			;975f
	cp 080h		;9760
	ret nc			;9762
	ld hl,0d70ah		;9763
	ld (hl),000h		;9766
	jp L_960E		;9768
L_976B:
	call L_9F29		;976b
	call L_9F4C		;976e
	ld hl,0d703h		;9771
	dec (hl)			;9774
	ret nz			;9775
	ld a,(0d70ah)		;9776
	cp 006h		;9779
	ld a,012h		;977b
	jr nc,L_9781		;977d
	ld a,006h		;977f
L_9781:
	ld (hl),a			;9781
	call L_9799		;9782
	ld a,c			;9785
	cp 006h		;9786
	jr nc,L_978E		;9788
	ld hl,0d709h		;978a
	dec (hl)			;978d
L_978E:
	cp 009h		;978e
	ret c			;9790
	ld hl,0d70ah		;9791
	ld (hl),009h		;9794
	jp L_960E		;9796
L_9799:
	call L_97A9		;9799
	ld hl,0d70ah		;979c
	ld a,c			;979f
	cp 006h		;97a0
	jr nc,L_97A6		;97a2
	ld (hl),c			;97a4
	ret			;97a5
L_97A6:
	inc (hl)			;97a6
	ld c,(hl)			;97a7
	ret			;97a8
L_97A9:
	ld a,(0d709h)		;97a9
	cp 07ch		;97ac
	ret nc			;97ae
	ld c,001h		;97af
	cp 078h		;97b1
	ret nc			;97b3
	inc c			;97b4
	cp 074h		;97b5
	ret nc			;97b7
	inc c			;97b8
	cp 070h		;97b9
	ret nc			;97bb
	inc c			;97bc
	cp 06eh		;97bd
	ret nc			;97bf
	inc c			;97c0
	cp 06ch		;97c1
	ret nc			;97c3
	inc c			;97c4
	ret			;97c5
L_97C6:
	ld hl,0d703h		;97c6
	ld (hl),080h		;97c9
	jp L_960E		;97cb
L_97CE:
	call L_9F29		;97ce
	call L_9F4C		;97d1
	ld hl,0d703h		;97d4
	dec (hl)			;97d7
	ret nz			;97d8
	ld (hl),080h		;97d9
	jp L_960E		;97db
L_97DE:
	call L_9F4C		;97de
	ld hl,0d703h		;97e1
	dec (hl)			;97e4
	ret nz			;97e5
	call 04266h		;97e6   ; esconde_sprites_ram: llena 0xDC00-0xDC7F con 0xE0
	ld hl,0d706h		;97e9
	ld (hl),000h		;97ec
	ld hl,04038h		;97ee
	ld de,00000h		;97f1
	ld bc,08060h		;97f4
	ld a,008h		;97f7
	call 04767h		;97f9   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
	ld hl,00060h		;97fc
	ld d,002h		;97ff
	ld bc,090a0h		;9801
	xor a			;9804
	call 046ffh		;9805   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
	xor a			;9808
	ld hl,0d70fh		;9809
	ld (hl),a			;980c
	inc l			;980d
	ld (hl),a			;980e
	inc l			;980f
	ld de,0aa98h		;9810
	ld (hl),e			;9813
	inc l			;9814
	ld (hl),d			;9815
	ld hl,0aa98h		;9816
	call 06460h		;9819   ; mosaico_de_57: el mosaico de HL del banco 57-58 en X = 0, Y = 0xF0, 1 fila de 0x12, forma 0x0B
	jp L_960E		;981c
L_981F:
	ld hl,0d70fh		;981f
	inc (hl)			;9822
	ld a,(hl)			;9823
	and 00fh		;9824
	call z,L_9871		;9826
	ld a,(0d710h)		;9829
	xor 001h		;982c
	ld (0d710h),a		;982e
	ld hl,03838h		;9831
	ld bc,09060h		;9834
	ld d,a			;9837
	push af			;9838
	xor a			;9839
	call 046ffh		;983a   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
	pop af			;983d
	ld hl,00000h		;983e
	ld de,04038h		;9841
	ld bc,08060h		;9844
	rlca			;9847
	rlca			;9848
	or 002h		;9849
	call 04767h		;984b   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
	ld hl,00090h		;984e
	ld a,(0d70fh)		;9851
	add a,l			;9854
	ld l,a			;9855
	ld de,03838h		;9856
	ld a,(0d710h)		;9859
	rlca			;985c
	rlca			;985d
	rlca			;985e
	rlca			;985f
	or 088h		;9860
	ld bc,09060h		;9862
	call 047edh		;9865   ; copia_rectangulo_logica: orden LMMM del VDP con la operacion logica de A
	call 04650h		;9868   ; espera_vdp: espera a que el VDP acabe la orden en curso (S#2 bit 0)
	ld a,(0d710h)		;986b
	jp 04879h		;986e   ; pon_pagina_visible: la pagina A a la vista (0xFAF5, DPPAGE de la BIOS)
L_9871:
	ld (hl),000h		;9871
	ld hl,000a0h		;9873
	ld de,00090h		;9876
	ld bc,09060h		;9879
	ld a,00ah		;987c
	call 04767h		;987e   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
	ld hl,(0d711h)		;9881
	ld de,00012h		;9884
	add hl,de			;9887
	ld (0d711h),hl		;9888
	call 0646fh		;988b   ; byte_de_57: A = (HL) del banco 57-58
	jr z,L_9896		;988e
	ld hl,(0d711h)		;9890
	jp 06460h		;9893   ; mosaico_de_57: el mosaico de HL del banco 57-58 en X = 0, Y = 0xF0, 1 fila de 0x12, forma 0x0B
L_9896:
	ld hl,0d703h		;9896
	ld (hl),0ffh		;9899
	call L_953A		;989b
	jp L_960E		;989e
L_98A1:
	ld hl,0d703h		;98a1
	dec (hl)			;98a4
	ret nz			;98a5
	ld c,001h		;98a6
	ld hl,0a01dh		;98a8
	call L_9371		;98ab
	call 06be8h		;98ae   ; orden_sonido_f6: la orden 0xF6 al sonido
	jp L_960E		;98b1
L_98B4:
	ld c,001h		;98b4
	call L_9387		;98b6
	ld a,(0cadah)		;98b9
	or a			;98bc
	ret nz			;98bd
	call 045f1h		;98be   ; apaga_pantalla_y_sprites: p00:45CC y p00:45F6
	call 04266h		;98c1   ; esconde_sprites_ram: llena 0xDC00-0xDC7F con 0xE0
	call L_9625		;98c4
	xor a			;98c7
	ld (0ca42h),a		;98c8   ; guarda la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	call 04879h		;98cb   ; pon_pagina_visible: la pagina A a la vista (0xFAF5, DPPAGE de la BIOS)
	call 04606h		;98ce   ; enciende_todo: la pantalla y los sprites encendidos
	ld hl,0a01dh		;98d1
	call 0463fh		;98d4   ; pon_paleta_con_espera: pone la paleta de HL (p00:4642) esperando al VDP antes
	call L_98EA		;98d7
	xor a			;98da
	ld hl,0d706h		;98db
	ld (hl),a			;98de
	ld hl,0d702h		;98df
	ld (hl),a			;98e2
	xor a			;98e3
	ld (0d703h),a		;98e4
	jp L_960E		;98e7
L_98EA:
	ld hl,05030h		;98ea
	ld bc,07040h		;98ed
	ld a,0bbh		;98f0
	ld d,001h		;98f2
	call 046ffh		;98f4   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
	ld hl,0c030h		;98f7
	ld bc,04040h		;98fa
	xor a			;98fd
	ld d,001h		;98fe
	call 046ffh		;9900   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
	ld a,001h		;9903
	ld (0ca42h),a		;9905   ; guarda la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	call 07179h		;9908   ; mosaico_bc95: el mosaico en rachas de p54:BC95 (5 x 0x0C) en X = 0x50, Y = 0x50
	xor a			;990b
	ld (0ca42h),a		;990c   ; guarda la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	ret			;990f
L_9910:
	ld hl,0d703h		;9910
	dec (hl)			;9913
	ret nz			;9914
	ld (hl),0f0h		;9915
	jp L_960E		;9917
L_991A:
	ld hl,0d703h		;991a
	dec (hl)			;991d
	ret nz			;991e
	jp L_960E		;991f
L_9922:
	ld a,(0d702h)		;9922
	call 0424dh		;9925   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_9928: 4 destinos del despachador p00:424D (call en p13:9925, el
;   indice en A): 9930, 993B, 994A, 99A4; lo leen p13:9925 (8 bytes)
;   0x9928..0x9930  (8 bytes)
DATA_tabla_9928:
	defw 09930h,0993bh,0994ah,099a4h	; 9928  -> L_9930 L_993B L_994A L_99A4

; ======================================================================
; CODIGO 0x9930..0x9a61  (305 bytes)
; ======================================================================


L_9930:
	call 064a5h		;9930   ; palabra_8042_d706: HL = la palabra 0xD706 de la tabla de p50:8042
	call 064ddh		;9933   ; mensaje_abajo: el mensaje de HL en (0x10, 0x98), 4 lineas
L_9936:
	ld hl,0d702h		;9936
	inc (hl)			;9939
	ret			;993a
L_993B:
	call 06585h		;993b   ; mensaje_cada_cuadro_b_13_14: mensaje_cada_cuadro y deja los bancos 13 y 14
	ld a,(0e220h)		;993e   ; lee la velocidad del mensaje en curso (0 = ninguno; 1-3, 4 sin espera)
	or a			;9941
	ret nz			;9942
	ld hl,0d703h		;9943
	ld (hl),0c0h		;9946
	jr L_9936		;9948
L_994A:
	ld hl,0d703h		;994a
	dec (hl)			;994d
	ret nz			;994e
	ld hl,0d706h		;994f
	inc (hl)			;9952
	ld a,(hl)			;9953
	ld hl,0d702h		;9954
	ld (hl),000h		;9957
	cp 006h		;9959
	push af			;995b
	call z,L_998A		;995c
	ld hl,00898h		;995f
	ld bc,0e828h		;9962
	xor a			;9965
	ld d,a			;9966
	call 046ffh		;9967   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
	pop af			;996a
	cp 013h		;996b
	ret nz			;996d
	ld hl,000c0h		;996e
	ld bc,00040h		;9971
	xor a			;9974
	ld d,002h		;9975
	call 046ffh		;9977   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
	ld hl,0a01dh		;997a
	ld c,001h		;997d
	call L_9371		;997f
	ld hl,0d702h		;9982
	xor a			;9985
	ld (hl),a			;9986
	jp L_960E		;9987
L_998A:
	ld hl,0d702h		;998a
	ld (hl),003h		;998d
	ld hl,0d717h		;998f
	ld (hl),000h		;9992
	ld hl,04030h		;9994
	ld bc,08060h		;9997
	ld a,0bbh		;999a
	ld d,000h		;999c
	call 046ffh		;999e   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
	jp 05f4dh		;99a1   ; sonido_3f: pide el sonido 0x3F
L_99A4:
	ld hl,0d717h		;99a4
	inc (hl)			;99a7
	ld a,(hl)			;99a8
	cp 021h		;99a9
	jr nc,L_99BA		;99ab
	ld hl,05030h		;99ad
	add a,l			;99b0
	ld l,a			;99b1
	ld de,02048h		;99b2
	ld a,001h		;99b5
	jp 047abh		;99b7   ; copia_en_y: orden YMMM del VDP
L_99BA:
	ld hl,06070h		;99ba
	ld de,06068h		;99bd
	ld bc,04808h		;99c0
	ld a,001h		;99c3
	call 04767h		;99c5   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
	ld hl,0d702h		;99c8
	ld (hl),000h		;99cb
	ret			;99cd
L_99CE:
	ld c,001h		;99ce
	call L_9387		;99d0
	ld a,(0cadah)		;99d3
	or a			;99d6
	ret nz			;99d7
	call L_962A		;99d8
	ld hl,0d703h		;99db
	ld (hl),040h		;99de
	jp L_960E		;99e0
L_99E3:
	ld hl,0d703h		;99e3
	dec (hl)			;99e6
	ret nz			;99e7
	ld (hl),006h		;99e8
	ld hl,0d706h		;99ea
	ld (hl),000h		;99ed
	ld hl,0bcd3h		;99ef
	ld de,07055h		;99f2
	ld bc,00204h		;99f5
	call 0647ah		;99f8   ; mosaico_de_54_bc: forma 0x0C en la franja 3
	call L_960E		;99fb
	jp 06bc4h		;99fe   ; sonido_a4: pide el sonido 0xA4 (de los que tienen la partitura en un banco de musica, p16:4CE3)
L_9A01:
	ld hl,0d703h		;9a01
	dec (hl)			;9a04
	ret nz			;9a05
	ld (hl),006h		;9a06
	ld hl,0d706h		;9a08
	inc (hl)			;9a0b
	ld a,(hl)			;9a0c
	cp 007h		;9a0d
	push af			;9a0f
	call z,L_9A17		;9a10
	pop af			;9a13
	jp L_9708		;9a14
L_9A17:
	ld hl,0d703h		;9a17
	ld (hl),080h		;9a1a
	jp L_960E		;9a1c
L_9A1F:
	ld hl,0d703h		;9a1f
	dec (hl)			;9a22
	ret nz			;9a23
	ld (hl),006h		;9a24
	jp L_960E		;9a26
L_9A29:
	ld hl,0d703h		;9a29
	dec (hl)			;9a2c
	ret nz			;9a2d
	ld (hl),006h		;9a2e
	ld hl,0d706h		;9a30
	dec (hl)			;9a33
	ld a,(hl)			;9a34
	or a			;9a35
	jr z,L_9A3B		;9a36
	jp L_9708		;9a38
L_9A3B:
	call L_9625		;9a3b
	ld hl,0d703h		;9a3e
	ld (hl),040h		;9a41
	jp L_960E		;9a43
L_9A46:
	ld hl,0d703h		;9a46
	dec (hl)			;9a49
	ret nz			;9a4a
	ld de,06706h		;9a4b
	ld a,007h		;9a4e
	call 04614h		;9a50   ; pon_color: el color A de la paleta = D (rojo y azul), E (verde)
	ld hl,0d71dh		;9a53
	ld (hl),000h		;9a56
	jp L_960E		;9a58
L_9A5B:
	ld a,(0d702h)		;9a5b
	call 0424dh		;9a5e   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_9A61: 9 destinos del despachador p00:424D (call en p13:9A5E, el
;   indice en A): 9A73, 9ADC, 9AFB, 9B28, 9B7C, 9BBB, 9C02, 9C20, 9C2A; lo
;   leen p13:9A5E (18 bytes)
;   0x9a61..0x9a73  (18 bytes)
DATA_tabla_9A61:
	defw 09a73h,09adch,09afbh,09b28h,09b7ch,09bbbh,09c02h,09c20h	; 9a61
	defw 09c2ah	; 9a71  -> L_9C2A

; ======================================================================
; CODIGO 0x9a73..0x9c59  (486 bytes)
; ======================================================================


L_9A73:
	call L_9936		;9a73
	ld hl,0a156h		;9a76
	call 0463fh		;9a79   ; pon_paleta_con_espera: pone la paleta de HL (p00:4642) esperando al VDP antes
	ld a,(0d706h)		;9a7c
	cp 00ah		;9a7f
	jr z,L_9AAC		;9a81
	cp 00bh		;9a83
	jr z,L_9ABC		;9a85
	cp 00ch		;9a87
	jr z,L_9ACC		;9a89
	ld b,a			;9a8b
	add a,a			;9a8c
	add a,b			;9a8d
	ld hl,09c59h		;9a8e
	call 0423eh		;9a91   ; suma_a_hl: HL = HL + A
	ld a,(hl)			;9a94
	inc hl			;9a95
	ld e,(hl)			;9a96
	inc hl			;9a97
	ld d,(hl)			;9a98
	ld b,000h		;9a99
	call L_9D01		;9a9b
L_9A9E:
	ld a,(0d706h)		;9a9e
	ld hl,09cb4h		;9aa1
	call 043f6h		;9aa4   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld c,001h		;9aa7
	jp L_93F7		;9aa9
L_9AAC:
	ld hl,02000h		;9aac
	ld de,08840h		;9aaf
	ld bc,04058h		;9ab2
	ld a,001h		;9ab5
	call 04767h		;9ab7   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
	jr L_9A9E		;9aba
L_9ABC:
	ld hl,00000h		;9abc
	ld de,01010h		;9abf
	ld bc,080a8h		;9ac2
	ld a,001h		;9ac5
	call 04767h		;9ac7   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
	jr L_9A9E		;9aca
L_9ACC:
	ld hl,0a000h		;9acc
	ld de,02030h		;9acf
	ld bc,05870h		;9ad2
	ld a,002h		;9ad5
	call 04767h		;9ad7   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
	jr L_9A9E		;9ada
L_9ADC:
	call 07b55h		;9adc   ; a_p03_b8ac_2: p03:B8AC con el banco 3 en 0xA000
	ld a,(0d706h)		;9adf
	ld de,09cb4h		;9ae2
	call 04403h		;9ae5   ; palabra_de_tabla_de: DE = la palabra A de la tabla de DE
	ld c,001h		;9ae8
	call L_941A		;9aea
	ld a,(0cadah)		;9aed
	or a			;9af0
	ret nz			;9af1
	call L_9936		;9af2
	ld hl,0d703h		;9af5
	ld (hl),020h		;9af8
	ret			;9afa
L_9AFB:
	call 07b55h		;9afb   ; a_p03_b8ac_2: p03:B8AC con el banco 3 en 0xA000
	ld hl,0d703h		;9afe
	dec (hl)			;9b01
	ret nz			;9b02
	ld (hl),008h		;9b03
	ld a,(0d706h)		;9b05
	ld hl,09c80h		;9b08
	call 043f6h		;9b0b   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld (0d718h),hl		;9b0e
	ld hl,09c9ah		;9b11
	ld a,(0d706h)		;9b14
	add a,a			;9b17
	ld e,a			;9b18
	ld d,000h		;9b19
	add hl,de			;9b1b
	ld e,(hl)			;9b1c
	inc hl			;9b1d
	ld d,(hl)			;9b1e
	ld hl,0d71bh		;9b1f
	ld (hl),e			;9b22
	inc l			;9b23
	ld (hl),d			;9b24
	jp L_9936		;9b25
L_9B28:
	call 07b55h		;9b28   ; a_p03_b8ac_2: p03:B8AC con el banco 3 en 0xA000
	ld hl,0d703h		;9b2b
	dec (hl)			;9b2e
	ret nz			;9b2f
	ld (hl),008h		;9b30
	ld hl,0d71bh		;9b32
	ld e,(hl)			;9b35
	inc l			;9b36
	ld d,(hl)			;9b37
	ld hl,(0d718h)		;9b38
	call 06477h		;9b3b   ; mosaico_de_54: el mosaico de HL del banco 54 (2 filas de 1)
	ld hl,(0d718h)		;9b3e
	inc hl			;9b41
	inc hl			;9b42
	call 06482h		;9b43   ; byte_de_54: A = (HL) del banco 54
	cp 0ffh		;9b46
	jr z,L_9B54		;9b48
	inc hl			;9b4a
	ld (0d718h),hl		;9b4b
	ld hl,0d71ch		;9b4e
	add a,(hl)			;9b51
	ld (hl),a			;9b52
	ret			;9b53
L_9B54:
	ld a,(0d706h)		;9b54
	cp 007h		;9b57
	jr nz,L_9B74		;9b59
	ld hl,0d71dh		;9b5b
	inc (hl)			;9b5e
	ld a,(hl)			;9b5f
	cp 002h		;9b60
	jr nc,L_9B74		;9b62
	ld hl,0be19h		;9b64
	ld de,03840h		;9b67
	ld (0d718h),hl		;9b6a
	ld hl,0d71bh		;9b6d
	ld (hl),e			;9b70
	inc l			;9b71
	ld (hl),d			;9b72
	ret			;9b73
L_9B74:
	ld hl,0d703h		;9b74
	ld (hl),0ffh		;9b77
	jp L_9936		;9b79
L_9B7C:
	call 07b55h		;9b7c   ; a_p03_b8ac_2: p03:B8AC con el banco 3 en 0xA000
	ld hl,0d703h		;9b7f
	dec (hl)			;9b82
	ret nz			;9b83
	ld (hl),006h		;9b84
	ld a,(0d706h)		;9b86
	cp 00ch		;9b89
	jp nc,L_9C56		;9b8b
	call L_9936		;9b8e
	call L_9BA3		;9b91
	ld a,(0d706h)		;9b94
	dec a			;9b97
	ld hl,09cb4h		;9b98
	call 043f6h		;9b9b   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld c,001h		;9b9e
	jp L_9371		;9ba0
L_9BA3:
	ld hl,0d706h		;9ba3
	inc (hl)			;9ba6
	ld a,(hl)			;9ba7
	cp 00bh		;9ba8
	jr z,L_9BB5		;9baa
	cp 00ah		;9bac
	ret nz			;9bae
	call 04ca6h		;9baf   ; dibujos_a34b: los bancos 32-34...
	jp 07b40h		;9bb2   ; a_p04_8957: p04:8957 con el banco 4 en 0x8000
L_9BB5:
	ld de,08000h		;9bb5
	jp 06e2ch		;9bb8   ; mapa_de_bits_8098_en: el mapa de bits de p57:8098 (0xA8 filas de 0x40 bytes) en la VRAM de DE
L_9BBB:
	call 07b55h		;9bbb   ; a_p03_b8ac_2: p03:B8AC con el banco 3 en 0xA000
	ld c,001h		;9bbe
	call L_9387		;9bc0
	ld a,(0cadah)		;9bc3
	or a			;9bc6
	ret nz			;9bc7
	call 045f1h		;9bc8   ; apaga_pantalla_y_sprites: p00:45CC y p00:45F6
	call L_962A		;9bcb
	xor a			;9bce
	call 07b5dh		;9bcf   ; a_p03_b866_2: p03:B866 con el banco 3 en 0xA000
	ld a,001h		;9bd2
	call 07b5dh		;9bd4   ; a_p03_b866_2: p03:B866 con el banco 3 en 0xA000
	call 04606h		;9bd7   ; enciende_todo: la pantalla y los sprites encendidos
	ld a,(0d706h)		;9bda
	cp 00ch		;9bdd
	jr z,L_9BE6		;9bdf
	xor a			;9be1
	ld (0d702h),a		;9be2
	ret			;9be5
L_9BE6:
	ld de,00000h		;9be6
	ld a,007h		;9be9
	call 04614h		;9beb   ; pon_color: el color A de la paleta = D (rojo y azul), E (verde)
	ld hl,0d717h		;9bee
	ld (hl),000h		;9bf1
	ld hl,0bcdbh		;9bf3
	ld de,07458h		;9bf6
	ld bc,00203h		;9bf9
	call 0647ah		;9bfc   ; mosaico_de_54_bc: forma 0x0C en la franja 3
	jp L_9936		;9bff
L_9C02:
	ld hl,0d703h		;9c02
	dec (hl)			;9c05
	ret nz			;9c06
	ld (hl),006h		;9c07
	ld hl,0d717h		;9c09
	inc (hl)			;9c0c
	ld a,(hl)			;9c0d
	cp 007h		;9c0e
	push af			;9c10
	call z,L_9C18		;9c11
	pop af			;9c14
	jp L_9708		;9c15
L_9C18:
	ld hl,0d703h		;9c18
	ld (hl),080h		;9c1b
	jp L_9936		;9c1d
L_9C20:
	ld hl,0d703h		;9c20
	dec (hl)			;9c23
	ret nz			;9c24
	ld (hl),006h		;9c25
	jp L_9936		;9c27
L_9C2A:
	ld hl,0d703h		;9c2a
	dec (hl)			;9c2d
	ret nz			;9c2e
	ld (hl),006h		;9c2f
	ld hl,0d717h		;9c31
	dec (hl)			;9c34
	ld a,(hl)			;9c35
	or a			;9c36
	jr z,L_9C3C		;9c37
	jp L_9708		;9c39
L_9C3C:
	call 045f1h		;9c3c   ; apaga_pantalla_y_sprites: p00:45CC y p00:45F6
	call L_9625		;9c3f
	call 06ec0h		;9c42   ; mapa_de_bits_9c58_bancos:
	call 04606h		;9c45   ; enciende_todo: la pantalla y los sprites encendidos
	call 04650h		;9c48   ; espera_vdp: espera a que el VDP acabe la orden en curso (S#2 bit 0)
	ld hl,0d702h		;9c4b
	ld (hl),000h		;9c4e
	ld hl,0a06dh		;9c50
	jp 0463fh		;9c53   ; pon_paleta_con_espera: pone la paleta de HL (p00:4642) esperando al VDP antes
L_9C56:
	jp L_960E		;9c56

; ----------------------------------------------------------------------
; DATOS resto_9C59: lo apuntan con el banco puesto p13:9A8E (0x9C59), p13:9B08
;   (0x9C80), p13:9B11 (0x9C9A), p13:9AA1 (0x9CB4), p13:9AE2 (0x9CB4),
;   p13:9B98 (0x9CB4); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p13:9A8E, p13:9B08, p13:9B11, p13:9AA1, p13:9AE2,
;   p13:9B98 (117 bytes)
;   0x9c59..0x9cce  (117 bytes)
DATA_resto_9C59:
	defb 001h,020h,010h,004h,080h,0d0h,005h,020h,0d0h,006h,080h,010h,003h,090h,0d0h,002h	; 9c59  . ..... ........
	defb 020h,010h,007h,020h,0d0h,008h,020h,010h,00bh,090h,0d0h,00ah,080h,010h,000h,000h	; 9c69   .. .. .........
	defb 000h,000h,000h,000h,000h,000h,000h,062h,0bdh,044h,0bdh,05eh,0beh,02eh,0beh,014h	; 9c79  .......b.D.^....
	defb 0bdh,0aah,0bdh,0e1h,0bch,0f8h,0bdh,0ceh,0bdh,095h,0bdh,035h,0bdh,0f6h,0bch,082h	; 9c89  ...........5....
	defb 0beh,040h,038h,0a0h,070h,040h,060h,0a0h,038h,0b0h,068h,040h,038h,040h,088h,020h	; 9c99  .@8.p@`.8.h@8@.
	defb 038h,0b0h,050h,0a0h,038h,088h,058h,088h,090h,080h,088h,09eh,0a0h,0cch,0a0h,09eh	; 9ca9  8.P.8.X.........
	defb 0a0h,09eh,0a0h,09eh,0a0h,09eh,0a0h,0fah,0a0h,09eh,0a0h,028h,0a1h,09eh,0a0h,09eh	; 9cb9  ...........(....
	defb 0a0h,03fh,0a0h,06dh,0a0h	; 9cc9

; ======================================================================
; CODIGO 0x9cce..0x9ea0  (466 bytes)
; ======================================================================


L_9CCE:
	ld c,002h		;9cce
	ld hl,0a06dh		;9cd0
	call L_94A3		;9cd3
	call 06be8h		;9cd6   ; orden_sonido_f6: la orden 0xF6 al sonido
	jp L_960E		;9cd9
L_9CDC:
	ld c,002h		;9cdc
	call L_94B5		;9cde
	ld a,(0cadah)		;9ce1
	or a			;9ce4
	ret nz			;9ce5
	ld hl,0d703h		;9ce6
	ld (hl),0ffh		;9ce9
	jp L_960E		;9ceb
L_9CEE:
	ld hl,0d703h		;9cee
	dec (hl)			;9cf1
	ret nz			;9cf2
	xor a			;9cf3
	ld (0ca00h),a		;9cf4   ; guarda el estado de la partida (p01:729F: 8 estados)
	ld (0ca01h),a		;9cf7   ; guarda el paso del estado de la partida
	ld (0caafh),a		;9cfa
	ld (0d700h),a		;9cfd
	ret			;9d00
L_9D01:
	push bc			;9d01
	push de			;9d02
	push af			;9d03
	call 07b48h		;9d04   ; dibujos_de_93e5_bancos_14:
	pop af			;9d07
	pop de			;9d08
	pop bc			;9d09
	jp 07b4dh		;9d0a   ; a_p03_b814_2: p03:B814 con el banco 3 en 0xA000
L_9D0D:
	call L_9D18		;9d0d
	call L_9D3A		;9d10
	call L_9D5D		;9d13
	jr L_9D85		;9d16
L_9D18:
	ld a,(0d706h)		;9d18
	cp 010h		;9d1b
	ret c			;9d1d
	cp 060h		;9d1e
	ret nc			;9d20
	ld a,(0d705h)		;9d21
	rra			;9d24
	rra			;9d25
	rra			;9d26
	rra			;9d27
	ld a,055h		;9d28
	jr nc,L_9D2D		;9d2a
	inc a			;9d2c
L_9D2D:
	ld hl,0d70dh		;9d2d
	ld (hl),a			;9d30
	ld de,0a0a1h		;9d31
	ld bc,00101h		;9d34
	jp 050d6h		;9d37   ; mosaico_f2_b2: el mosaico de HL en (D, E), B filas de C caracteres, con la forma 2 de la franja 2 (p00:512C)
L_9D3A:
	ld a,(0d706h)		;9d3a
	cp 038h		;9d3d
	ret c			;9d3f
	cp 088h		;9d40
	ret nc			;9d42
	ld a,(0d705h)		;9d43
	rra			;9d46
	rra			;9d47
	rra			;9d48
	rra			;9d49
	ld a,05ch		;9d4a
	jr c,L_9D50		;9d4c
	ld a,05fh		;9d4e
L_9D50:
	ld hl,0d70dh		;9d50
	ld (hl),a			;9d53
	ld de,048c9h		;9d54
	ld bc,00101h		;9d57
	jp 050d6h		;9d5a   ; mosaico_f2_b2: el mosaico de HL en (D, E), B filas de C caracteres, con la forma 2 de la franja 2 (p00:512C)
L_9D5D:
	ld a,(0d706h)		;9d5d
	cp 038h		;9d60
	ret c			;9d62
	cp 088h		;9d63
	ret nc			;9d65
	ld a,(0d705h)		;9d66
	rra			;9d69
	rra			;9d6a
	rra			;9d6b
	rra			;9d6c
	ld de,05d5eh		;9d6d
	jr c,L_9D75		;9d70
	ld de,06061h		;9d72
L_9D75:
	ld hl,0d70dh		;9d75
	ld (hl),d			;9d78
	inc hl			;9d79
	ld (hl),e			;9d7a
	dec hl			;9d7b
	ld de,0a8c9h		;9d7c
	ld bc,00102h		;9d7f
	jp 050d6h		;9d82   ; mosaico_f2_b2: el mosaico de HL en (D, E), B filas de C caracteres, con la forma 2 de la franja 2 (p00:512C)
L_9D85:
	ld a,(0d706h)		;9d85
	cp 040h		;9d88
	ret c			;9d8a
	cp 090h		;9d8b
	ret nc			;9d8d
	ld a,(0d705h)		;9d8e
	rra			;9d91
	rra			;9d92
	rra			;9d93
	rra			;9d94
	ld a,057h		;9d95
	jr nc,L_9D9A		;9d97
	inc a			;9d99
L_9D9A:
	ld hl,0d70dh		;9d9a
	ld (hl),a			;9d9d
	ld de,058d1h		;9d9e
	ld bc,00101h		;9da1
	jp 050d6h		;9da4   ; mosaico_f2_b2: el mosaico de HL en (D, E), B filas de C caracteres, con la forma 2 de la franja 2 (p00:512C)
L_9DA7:
	call L_9E3B		;9da7
	call L_9DB1		;9daa
	call L_9DFB		;9dad
	ret			;9db0
L_9DB1:
	ld ix,0cb00h		;9db1   ; apunta a el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	ld b,016h		;9db5
L_9DB7:
	ld a,(ix+000h)		;9db7
	or a			;9dba
	jr z,L_9DC0		;9dbb
	call L_9DC8		;9dbd
L_9DC0:
	ld de,00010h		;9dc0
	add ix,de		;9dc3
	djnz L_9DB7		;9dc5
	ret			;9dc7
L_9DC8:
	ld l,(ix+005h)		;9dc8
	ld h,(ix+006h)		;9dcb
	ld e,(ix+001h)		;9dce
	ld d,(ix+002h)		;9dd1
	add hl,de			;9dd4
	ld (ix+001h),l		;9dd5
	ld (ix+002h),h		;9dd8
	ld l,(ix+007h)		;9ddb
	ld h,(ix+008h)		;9dde
	ld e,(ix+003h)		;9de1
	ld d,(ix+004h)		;9de4
	add hl,de			;9de7
	ld (ix+003h),l		;9de8
	ld (ix+004h),h		;9deb
	ld a,h			;9dee
	cp 040h		;9def
	jr c,L_9DF6		;9df1
	cp 0c0h		;9df3
	ret c			;9df5
L_9DF6:
	xor a			;9df6
	ld (ix+000h),a		;9df7
	ret			;9dfa
L_9DFB:
	ld hl,0dc28h		;9dfb
	ld bc,00058h		;9dfe
	call 04236h		;9e01   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	ld ix,0cb00h		;9e04   ; apunta a el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	ld b,016h		;9e08
	ld hl,0dc28h		;9e0a
L_9E0D:
	ld a,(ix+000h)		;9e0d
	or a			;9e10
	jr z,L_9E18		;9e11
	push bc			;9e13
	call L_9E2A		;9e14
	pop bc			;9e17
L_9E18:
	ld de,00010h		;9e18
	add ix,de		;9e1b
	djnz L_9E0D		;9e1d
	ld hl,0daa0h		;9e1f
	ld a,00fh		;9e22
	ld bc,0015fh		;9e24
	jp 04237h		;9e27   ; llena_bloque: pone A en BC + 1 bytes desde HL
L_9E2A:
	ld e,(ix+002h)		;9e2a
	ld a,(0d706h)		;9e2d
	add a,e			;9e30
	ld e,a			;9e31
	ld d,(ix+004h)		;9e32
	ld c,(ix+009h)		;9e35
	jp 05d41h		;9e38   ; pon_sprite: [E][D][C] en (HL): la Y, la X y el patron de un sprite de 0xDC00
L_9E3B:
	ld a,(0d70ch)		;9e3b
	inc a			;9e3e
	and 007h		;9e3f
	ld (0d70ch),a		;9e41
	ld ix,0cb00h		;9e44   ; apunta a el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	ld b,016h		;9e48
L_9E4A:
	ld a,(ix+000h)		;9e4a
	or a			;9e4d
	jr z,L_9E58		;9e4e
	ld de,00010h		;9e50
	add ix,de		;9e53
	djnz L_9E4A		;9e55
	ret			;9e57
L_9E58:
	call L_9E5D		;9e58
	jr L_9E7A		;9e5b
L_9E5D:
	xor a			;9e5d
	ld (ix+001h),a		;9e5e
	ld (ix+003h),a		;9e61
	inc a			;9e64
	ld (ix+000h),a		;9e65
	ld (ix+002h),090h		;9e68
	ld a,(0d705h)		;9e6c
	rla			;9e6f
	rla			;9e70
	rla			;9e71
	and 078h		;9e72
	add a,030h		;9e74
	ld (ix+004h),a		;9e76
	ret			;9e79
L_9E7A:
	ld a,(0d70ch)		;9e7a
	ld b,a			;9e7d
	add a,a			;9e7e
	add a,a			;9e7f
	add a,b			;9e80
	ld hl,09ea0h		;9e81
	call 0423eh		;9e84   ; suma_a_hl: HL = HL + A
	ld a,(hl)			;9e87
	ld (ix+005h),a		;9e88
	inc hl			;9e8b
	ld a,(hl)			;9e8c
	ld (ix+006h),a		;9e8d
	inc hl			;9e90
	ld a,(hl)			;9e91
	ld (ix+007h),a		;9e92
	inc hl			;9e95
	ld a,(hl)			;9e96
	ld (ix+008h),a		;9e97
	inc hl			;9e9a
	ld a,(hl)			;9e9b
	ld (ix+009h),a		;9e9c
	ret			;9e9f

; ----------------------------------------------------------------------
; DATOS resto_9EA0: lo apuntan con el banco puesto p13:9E81 (0x9EA0); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p13:9E81 (40 bytes)
;   0x9ea0..0x9ec8  (40 bytes)
DATA_resto_9EA0:
	defb 000h,0fdh,000h,0fch,048h,000h,0ffh,000h,008h,04ch,000h,0fdh,000h,004h,03ch,000h	; 9ea0  ....H....L....<.
	defb 0fdh,000h,0f8h,040h,000h,0fch,000h,004h,048h,000h,0ffh,000h,0f8h,04ch,000h,0fdh	; 9eb0  ...@....H....L..
	defb 000h,008h,044h,000h,0fch,000h,0fch,048h	; 9ec0  ..D....H

; ======================================================================
; CODIGO 0x9ec8..0x9f85  (189 bytes)
; ======================================================================


L_9EC8:
	ld hl,0dc00h		;9ec8   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	ld (0d707h),hl		;9ecb
	ld a,(0ca03h)		;9ece   ; lee el contador de cuadros (uno mas en cada interrupcion)
	rra			;9ed1
	rra			;9ed2
	ld hl,09f85h		;9ed3
	jr c,L_9EDB		;9ed6
	ld hl,09fa3h		;9ed8
L_9EDB:
	ld b,00ah		;9edb
L_9EDD:
	ld e,(hl)			;9edd
	inc hl			;9ede
	ld d,(hl)			;9edf
	inc hl			;9ee0
	ld c,(hl)			;9ee1
	inc hl			;9ee2
	push bc			;9ee3
	push hl			;9ee4
	ld hl,(0d707h)		;9ee5
	call 05d41h		;9ee8   ; pon_sprite: [E][D][C] en (HL): la Y, la X y el patron de un sprite de 0xDC00
	ld (0d707h),hl		;9eeb
	pop hl			;9eee
	pop bc			;9eef
	djnz L_9EDD		;9ef0
	ld hl,0da00h		;9ef2   ; apunta a la copia de la tabla de colores de sprites: 32 x 16 lineas (va con 0xDC00 detras)
	ld a,00fh		;9ef5
	ld bc,0009fh		;9ef7
	jp 04237h		;9efa   ; llena_bloque: pone A en BC + 1 bytes desde HL
L_9EFD:
	call L_9F1E		;9efd
	ld a,(0ca03h)		;9f00   ; lee el contador de cuadros (uno mas en cada interrupcion)
	rra			;9f03
	rra			;9f04
	ld c,050h		;9f05
	jr c,L_9F0B		;9f07
	ld c,058h		;9f09
L_9F0B:
	ld a,(0d709h)		;9f0b
	ld d,a			;9f0e
	ld e,068h		;9f0f
	ld hl,0dc00h		;9f11   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
L_9F14:
	call 05d41h		;9f14   ; pon_sprite: [E][D][C] en (HL): la Y, la X y el patron de un sprite de 0xDC00
	ld a,d			;9f17
	add a,010h		;9f18
	ld d,a			;9f1a
	jp 05d3dh		;9f1b   ; pon_sprite_mas_4: p00:5D41 con el patron C + 4
L_9F1E:
	ld hl,0da00h		;9f1e   ; apunta a la copia de la tabla de colores de sprites: 32 x 16 lineas (va con 0xDC00 detras)
	ld a,00fh		;9f21
	ld bc,0001fh		;9f23
	jp 04237h		;9f26   ; llena_bloque: pone A en BC + 1 bytes desde HL
L_9F29:
	call L_9F1E		;9f29
	call L_9F6B		;9f2c
	ld a,(0d709h)		;9f2f
	ld d,a			;9f32
	ld e,068h		;9f33
	ld hl,0dc00h		;9f35   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	call 05d41h		;9f38   ; pon_sprite: [E][D][C] en (HL): la Y, la X y el patron de un sprite de 0xDC00
	ld a,c			;9f3b
	add a,004h		;9f3c
	ld c,a			;9f3e
	cp 080h		;9f3f
	jr c,L_9F45		;9f41
	ld c,000h		;9f43
L_9F45:
	ld a,d			;9f45
	add a,010h		;9f46
	ld d,a			;9f48
	jp 05d41h		;9f49   ; pon_sprite: [E][D][C] en (HL): la Y, la X y el patron de un sprite de 0xDC00
L_9F4C:
	ld a,(0ca03h)		;9f4c   ; lee el contador de cuadros (uno mas en cada interrupcion)
	rra			;9f4f
	rra			;9f50
	ld c,098h		;9f51
	jr c,L_9F57		;9f53
	ld c,0a0h		;9f55
L_9F57:
	ld hl,0dc08h		;9f57
	ld de,07087h		;9f5a
	call L_9F14		;9f5d
	ld hl,0da20h		;9f60
	ld a,007h		;9f63
	ld bc,0001fh		;9f65
	jp 04237h		;9f68   ; llena_bloque: pone A en BC + 1 bytes desde HL
L_9F6B:
	ld a,(0d70ah)		;9f6b
	cp 004h		;9f6e
	jr nc,L_9F7B		;9f70
	rla			;9f72
	rla			;9f73
	rla			;9f74
	and 0f8h		;9f75
	add a,060h		;9f77
	ld c,a			;9f79
	ret			;9f7a
L_9F7B:
	sub 004h		;9f7b
	rla			;9f7d
	rla			;9f7e
	and 0fch		;9f7f
	add a,080h		;9f81
	ld c,a			;9f83
	ret			;9f84

; ----------------------------------------------------------------------
; DATOS resto_9F85: lo apuntan con el banco puesto p13:9ED3 (0x9F85), p13:9ED8
;   (0x9FA3), p13:95A5 (0x9FC1), p13:95E9 (0x9FF2); el tamano es lo que hay
;   hasta lo siguiente, no sale de recorrerlo; lo leen p13:9ED3, p13:9ED8,
;   p13:95A5, p13:95E9 (123 bytes)
;   0x9f85..0xa000  (123 bytes)
DATA_resto_9F85:
	defb 098h,040h,004h,098h,050h,004h,098h,060h,008h,098h,070h,00ch,098h,080h,010h,098h	; 9f85  .@..P..`..p.....
	defb 090h,014h,098h,0a0h,018h,098h,0b0h,004h,0a8h,0a0h,030h,0b8h,0a0h,034h,098h,040h	; 9f95  ..........0..4.@
	defb 01ch,098h,050h,004h,098h,060h,020h,098h,070h,024h,098h,080h,028h,098h,090h,004h	; 9fa5  ..P..` .p$..(...
	defb 098h,0a0h,02ch,0a8h,0a0h,038h,0e0h,0e0h,000h,0e0h,0e0h,000h,000h,000h,000h,001h	; 9fb5  ..,..8..........
	defb 001h,001h,002h,033h,003h,003h,030h,002h,004h,030h,003h,005h,022h,003h,006h,023h	; 9fc5  ...3..0..0.."..#
	defb 004h,007h,077h,007h,008h,044h,004h,009h,006h,002h,00ah,070h,000h,00bh,064h,005h	; 9fd5  ..w..D.....p..d.
	defb 00ch,050h,003h,00dh,002h,004h,00eh,001h,002h,00fh,000h,000h,0ffh,001h,000h,001h	; 9fe5  .P..............
	defb 002h,001h,002h,003h,001h,003h,004h,002h,004h,005h,073h	; 9ff5  ..........s
