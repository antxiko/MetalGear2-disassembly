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


presentacion:		; el estado 1 de la partida: el paso 0xCA2C de la presentacion (1-0x41) por la tabla de p13:800D; desde 0x80, p14:A2CF
	ld de,0ca2ch		;8000   ; apunta a el paso de la presentacion (1-0x41; 0 se acaba, desde 0x80 p14:A2CF)
	ld a,(de)			;8003
	cp 080h		;8004   ; desde 0x80...
	jp nc,0a2cfh		;8006   ; ...p14:A2CF
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
	defw 087e6h	; 808d  -> pres_paso_65

; ======================================================================
; CODIGO 0x808f..0x882a  (1947 bytes)
; ======================================================================


pres_paso_1:		; el sonido 0x99, la paleta a negro, el letrero de p13:92B8 y el paso siguiente sin cuenta
	call 06ba4h		;808f   ; sonido_99: pide el sonido 0x99 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	call paleta_negra		;8092   ; la paleta a negro
	ld hl,0e900h		;8095   ; apunta a los caracteres de un dibujo pasados a 4 bits
	call 0463fh		;8098   ; pon_paleta_con_espera: pone la paleta de HL (p00:4642) esperando al VDP antes
	ld hl,092b8h		;809b   ; el letrero de p13:92B8
	call 04918h		;809e   ; letrero_con_sitio: [fila][columna] y letras; 0xFE otra posicion, 0xFF acaba
	ld de,00000h		;80a1
	jp pres_cuenta_y_siguiente		;80a4   ; pres_cuenta_y_siguiente: la cuenta 0xCA2E-0xCA2F = DE y el paso siguiente
pres_paso_2:		; la paleta hacia la de p13:9218; al llegar, la cuenta 0x100 y el paso siguiente
	call pres_cuenta		;80a7   ; pres_cuenta: 0xCA2E-0xCA2F uno menos; Z al llegar a 0
	ld de,09218h		;80aa   ; hacia la de p13:9218
	call paleta_hacia_cada_8		;80ad   ; paleta_hacia_cada_8: cada 8 cuadros de la cuenta, p13:9175
	ret nz			;80b0
	ld de,00100h		;80b1   ; 0x100 cuadros
	jp pres_cuenta_y_siguiente		;80b4   ; pres_cuenta_y_siguiente: la cuenta 0xCA2E-0xCA2F = DE y el paso siguiente
pres_paso_3:		; espera la cuenta
	call pres_cuenta		;80b7   ; pres_cuenta: 0xCA2E-0xCA2F uno menos; Z al llegar a 0
	ret nz			;80ba
	jp pres_siguiente		;80bb   ; pres_siguiente: 0xCA2C uno mas y 0xCA2D = 0
pres_paso_4:		; la paleta a negro; al acabar, la pantalla limpia, la paleta a negro, el dibujo de (0x68, 0x80) de 0x40 x 0x30 en (0x40, 0xA0) y 0xCA30-0xCA31 a cero
	call a_negro_cada_4		;80be   ; a_negro_cada_4: cada 4 cuadros de la cuenta, p13:90FD
	ret nz			;80c1   ; aun no
	call 045fdh		;80c2   ; pantalla_limpia: la pantalla apagada, la pagina 0 borrada y otra vez encendida
	call paleta_negra		;80c5   ; paleta_negra: en 0xE900, la paleta de 16 colores a negro ([n][0][0]) y 0xFF
	ld hl,0e900h		;80c8   ; apunta a los caracteres de un dibujo pasados a 4 bits
	call 0463fh		;80cb   ; pon_paleta_con_espera: pone la paleta de HL (p00:4642) esperando al VDP antes
	ld hl,08068h		;80ce   ; de (0x68, 0x80)...
	ld de,0a040h		;80d1   ; ...a (0x40, 0xA0)...
	ld bc,03040h		;80d4   ; ...0x40 x 0x30
	call copia_de_pagina_1		;80d7   ; copia_de_pagina_1: copia HL a DE, C x B, de la pagina 1
	xor a			;80da
	ld (0ca30h),a		;80db   ; guarda la cuenta de cuadros de la figura o el dibujo de la presentacion
	ld (0ca31h),a		;80de   ; guarda lo que falta del dibujo que se abre en la presentacion
	jp pres_siguiente		;80e1   ; pres_siguiente: 0xCA2C uno mas y 0xCA2D = 0
pres_paso_5:		; los sprites de p13:8B28 y la paleta hacia la de p13:9218; al llegar, la cuenta 0x40
	ld hl,0ca30h		;80e4   ; los sprites de p13:8B28 y la paleta hacia la de p13:9218; al llegar, la cuenta 0x40
	inc (hl)			;80e7   ; los cuadros
	call sprites_8b53		;80e8   ; sprites_8b53: los 5 sprites de la fila (0xCA30 / 8 & 3) * 12 de p13:8B53 a 0xDC00 y sus colores de p13:8B83 (rachas)
	call pres_cuenta		;80eb   ; pres_cuenta: 0xCA2E-0xCA2F uno menos; Z al llegar a 0
	ld de,09218h		;80ee
	call paleta_hacia_cada_8		;80f1   ; paleta_hacia_cada_8: cada 8 cuadros de la cuenta, p13:9175
	ret nz			;80f4
	ld de,00040h		;80f5
	jp pres_cuenta_y_siguiente		;80f8   ; pres_cuenta_y_siguiente: la cuenta 0xCA2E-0xCA2F = DE y el paso siguiente
pres_paso_6:		; los sprites de p13:8B28 hasta acabar la cuenta
	ld hl,0ca30h		;80fb   ; apunta a la cuenta de cuadros de la figura o el dibujo de la presentacion
	inc (hl)			;80fe
	call sprites_8b53		;80ff   ; sprites_8b53: los 5 sprites de la fila (0xCA30 / 8 & 3) * 12 de p13:8B53 a 0xDC00 y sus colores de p13:8B83 (rachas)
	call pres_cuenta		;8102   ; pres_cuenta: 0xCA2E-0xCA2F uno menos; Z al llegar a 0
	ret nz			;8105
	jp pres_siguiente		;8106   ; pres_siguiente: 0xCA2C uno mas y 0xCA2D = 0
pres_paso_7:		; los sprites de p13:8B28, el dibujo de 0xCA31 (p13:8801), cada 8 cuadros 0xCA31 + 4 (de 0 a 0x14) y el texto 0 (p13:8E2F)
	ld hl,0ca30h		;8109   ; apunta a la cuenta de cuadros de la figura o el dibujo de la presentacion
	inc (hl)			;810c
	call sprites_8b53		;810d   ; sprites_8b53: los 5 sprites de la fila (0xCA30 / 8 & 3) * 12 de p13:8B53 a 0xDC00 y sus colores de p13:8B83 (rachas)
	call dibujo_de_ca31		;8110   ; dibujo_de_ca31: el dibujo de (0x38 + 0xCA31, 0xB8) de 0x10 x 0x10 en (0x70, 0xC8)
	ld a,(0ca30h)		;8113   ; lee la cuenta de cuadros de la figura o el dibujo de la presentacion
	and 007h		;8116   ; cada 8...
	jr nz,texto_0		;8118
	ld hl,0ca31h		;811a   ; apunta a lo que falta del dibujo que se abre en la presentacion
	ld a,(hl)			;811d
	add a,004h		;811e   ; ...+ 4...
	cp 018h		;8120   ; ...hasta 0x14
	jr c,pon_ca31		;8122
	xor a			;8124
pon_ca31:
	ld (hl),a			;8125
texto_0:		; el texto 0
	xor a			;8126
	jp texto_de_ca3b		;8127   ; texto_de_ca3b: el texto A (0xCA3B) por el paso 0xCA2D (p13:8E38): el sitio y las letras (p13:8E88), 0x40 de espera, la primera linea cada 4 cuadros, la segunda cada 8, 256 de espera y el paso siguiente
pres_paso_8:		; sin sprites, la pantalla limpia, 0xCA31 = 0x38, un marco de 0x44 x 0x6C en (0x3E, 0x0E) y la cuenta 0x100
	call 04266h		;812a   ; esconde_sprites_ram: llena 0xDC00-0xDC7F con 0xE0
	call 045fdh		;812d   ; pantalla_limpia: la pantalla apagada, la pagina 0 borrada y otra vez encendida
	ld a,038h		;8130
	ld (0ca31h),a		;8132   ; guarda lo que falta del dibujo que se abre en la presentacion
	ld hl,00e3eh		;8135   ; en (0x3E, 0x0E)...
	ld de,06c44h		;8138   ; ...0x44 x 0x6C...
	ld c,006h		;813b   ; ...de color 6
	xor a			;813d
	call 046bch		;813e   ; marco: cuatro lineas: un marco de D x E desde HL
	ld de,00100h		;8141
pres_cuenta_y_siguiente:		; la cuenta 0xCA2E-0xCA2F = DE y el paso siguiente
	ld (0ca2eh),de		;8144   ; guarda la cuenta de cuadros del paso de la presentacion (16 bits)
pres_siguiente:		; 0xCA2C uno mas y 0xCA2D = 0
	ld hl,0ca2ch		;8148   ; apunta a el paso de la presentacion (1-0x41; 0 se acaba, desde 0x80 p14:A2CF)
	inc (hl)			;814b
	inc hl			;814c
	ld (hl),000h		;814d
	ret			;814f
pres_paso_9:		; el dibujo que crece (p13:899E); al acabar 0xCA31, 5 sprites de p13:8B9E con color 7 y 0xCA30 = 0
	call abre_8068		;8150   ; abre_8068: con 0xCA31 (uno menos cada vez): el dibujo de (0x68, 0x40 - lo que va) de la pagina 1 en (0x40, 0x10), de 0x40 de ancho y 0x40 + lo que va de alto (hasta 0x68)
	ld a,(0ca31h)		;8153   ; sin acabar, nada mas
	and a			;8156
	ret nz			;8157
	ld b,005h		;8158   ; 5 sprites...
	ld hl,08b9eh		;815a   ; ...de p13:8B9E
	ld de,0dc00h		;815d   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	call sprites_de_tabla		;8160   ; sprites_de_tabla: B sprites de HL [Y][X][patron] a DE (de 4 en 4)
	ld hl,0da00h		;8163   ; los colores...
	ld de,0da01h		;8166
	ld bc,0004fh		;8169
	ld (hl),007h		;816c   ; ...a 7
	ldir		;816e
	xor a			;8170
	ld (0ca30h),a		;8171   ; guarda la cuenta de cuadros de la figura o el dibujo de la presentacion
	jp pres_siguiente		;8174   ; pres_siguiente: 0xCA2C uno mas y 0xCA2D = 0
pres_paso_10:		; los 5 sprites parpadean (cada 8 cuadros, p13:8B9E o p13:8BAD) y el texto 1
	ld de,0dc00h		;8177   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	ld b,005h		;817a
	ld hl,0ca30h		;817c   ; apunta a la cuenta de cuadros de la figura o el dibujo de la presentacion
	inc (hl)			;817f
	bit 3,(hl)		;8180   ; cada 8 cuadros...
	jr z,sprites_fuera		;8182
	ld a,(hl)			;8184
	and 030h		;8185   ; ...uno u otro...
	ld hl,08b9eh		;8187
	jr nz,sprites_de_hl		;818a
	ld hl,08badh		;818c
sprites_de_hl:
	call sprites_de_tabla		;818f   ; sprites_de_tabla: B sprites de HL [Y][X][patron] a DE (de 4 en 4)
	jr texto_1		;8192
sprites_fuera:
	call sprites_b_fuera		;8194   ; sprites_b_fuera: B sprites desde DE fuera (Y = 0xE0)
texto_1:
	ld a,001h		;8197
	jp texto_de_ca3b		;8199   ; texto_de_ca3b: el texto A (0xCA3B) por el paso 0xCA2D (p13:8E38): el sitio y las letras (p13:8E88), 0x40 de espera, la primera linea cada 4 cuadros, la segunda cada 8, 256 de espera y el paso siguiente
pres_paso_11:		; sin sprites, la pantalla limpia, el dibujo de (0x38, 0x80) de 0x30 x 0x38 en (0x50, 0x20), 0xCA30 = 0 y p13:8A3B
	call 04266h		;819c   ; esconde_sprites_ram: llena 0xDC00-0xDC7F con 0xE0
	call 045fdh		;819f   ; pantalla_limpia: la pantalla apagada, la pagina 0 borrada y otra vez encendida
	ld hl,08038h		;81a2   ; de (0x38, 0x80)...
	ld de,02050h		;81a5   ; ...a (0x50, 0x20)...
	ld bc,03830h		;81a8   ; ...0x30 x 0x38
	call copia_de_pagina_1		;81ab   ; copia_de_pagina_1: copia HL a DE, C x B, de la pagina 1
	xor a			;81ae
	ld (0ca30h),a		;81af   ; guarda la cuenta de cuadros de la figura o el dibujo de la presentacion
	call barras_empiezan		;81b2   ; barras_empiezan: las 20 barras [direccion][alto] de p13:8B00 a 0xE900
	jp pres_siguiente		;81b5   ; pres_siguiente: 0xCA2C uno mas y 0xCA2D = 0
pres_paso_12:		; p13:8A4E y el texto 2
	ld hl,0ca30h		;81b8   ; apunta a la cuenta de cuadros de la figura o el dibujo de la presentacion
	inc (hl)			;81bb
	call barras_cada_cuadro		;81bc   ; barras_cada_cuadro: las 20 barras de 0xE900 suben o bajan (las 10 primeras entre 1 y 0x0F; las otras entre 1 y 0x16, cambiando de direccion en los topes) y se pintan: las de arriba en (0x64, 0x40) de color 0xCC sobre 0x10, las de abajo en (0x64, 0x26) desde 0x18
	ld a,002h		;81bf
	jp texto_de_ca3b		;81c1   ; texto_de_ca3b: el texto A (0xCA3B) por el paso 0xCA2D (p13:8E38): el sitio y las letras (p13:8E88), 0x40 de espera, la primera linea cada 4 cuadros, la segunda cada 8, 256 de espera y el paso siguiente
pres_paso_13:		; la pantalla limpia, un marco de 0x44 x 0x6C en (0x46, 0x86) y 0xCA31 = 0x28
	call 045fdh		;81c4   ; pantalla_limpia: la pantalla apagada, la pagina 0 borrada y otra vez encendida
	ld hl,pres_paso_52		;81c7
	ld de,06c44h		;81ca
	ld c,006h		;81cd
	xor a			;81cf
	call 046bch		;81d0   ; marco: cuatro lineas: un marco de D x E desde HL
	ld a,028h		;81d3
	ld (0ca31h),a		;81d5   ; guarda lo que falta del dibujo que se abre en la presentacion
	jp pres_siguiente		;81d8   ; pres_siguiente: 0xCA2C uno mas y 0xCA2D = 0
pres_paso_14:		; el dibujo de p13:89D8; al acabar 0xCA31, 5 sprites de p13:8BBC con color 7 y 0xCA30 = 0
	call abre_1800		;81db   ; abre_1800: con 0xCA31: el dibujo de (0x40 - lo que va, 0x18) de 0x40 x 0x68 en (0x48, 0x88)
	ld a,(0ca31h)		;81de   ; lee lo que falta del dibujo que se abre en la presentacion
	and a			;81e1
	ret nz			;81e2
	ld b,005h		;81e3
	ld de,0dc00h		;81e5   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	ld hl,08bbch		;81e8
	call sprites_de_tabla		;81eb   ; sprites_de_tabla: B sprites de HL [Y][X][patron] a DE (de 4 en 4)
	ld hl,0da00h		;81ee   ; apunta a la copia de la tabla de colores de sprites: 32 x 16 lineas (va con 0xDC00 detras)
	ld de,0da01h		;81f1
	ld bc,0004fh		;81f4
	ld (hl),007h		;81f7
	ldir		;81f9
	xor a			;81fb
	ld (0ca30h),a		;81fc   ; guarda la cuenta de cuadros de la figura o el dibujo de la presentacion
	jp pres_siguiente		;81ff   ; pres_siguiente: 0xCA2C uno mas y 0xCA2D = 0
pres_paso_15:		; el dibujo de p13:8814, los 5 sprites parpadean (p13:8BBC o p13:8BCB) y el texto 3
	ld hl,0ca30h		;8202   ; apunta a la cuenta de cuadros de la figura o el dibujo de la presentacion
	inc (hl)			;8205
	call dibujo_de_ca30		;8206   ; dibujo_de_ca30: el dibujo (0xCA30 / 8 & 0x0F) de p13:882A de 0x28 x 0x20 en (0x5F, 0xC8)
	ld de,0dc00h		;8209   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	ld b,005h		;820c
	ld hl,0ca30h		;820e   ; apunta a la cuenta de cuadros de la figura o el dibujo de la presentacion
	bit 3,(hl)		;8211
	jr z,sprites_fuera_15		;8213
	ld a,(hl)			;8215
	and 030h		;8216
	ld hl,08bbch		;8218
	jr nz,sprites_de_hl_15		;821b
	ld hl,08bcbh		;821d
sprites_de_hl_15:
	call sprites_de_tabla		;8220   ; sprites_de_tabla: B sprites de HL [Y][X][patron] a DE (de 4 en 4)
	jr texto_3		;8223
sprites_fuera_15:
	call sprites_b_fuera		;8225   ; sprites_b_fuera: B sprites desde DE fuera (Y = 0xE0)
texto_3:
	ld a,003h		;8228
	jp texto_de_ca3b		;822a   ; texto_de_ca3b: el texto A (0xCA3B) por el paso 0xCA2D (p13:8E38): el sitio y las letras (p13:8E88), 0x40 de espera, la primera linea cada 4 cuadros, la segunda cada 8, 256 de espera y el paso siguiente
pres_paso_16:		; sin sprites, la pantalla limpia, un marco de 0x44 x 0x64 en (0x3E, 0x0E) y 0xCA31 = 0x20
	call 04266h		;822d   ; esconde_sprites_ram: llena 0xDC00-0xDC7F con 0xE0
	call 045fdh		;8230   ; pantalla_limpia: la pantalla apagada, la pagina 0 borrada y otra vez encendida
	ld hl,00e3eh		;8233
	ld de,06444h		;8236
	ld c,006h		;8239
	xor a			;823b
	call 046bch		;823c   ; marco: cuatro lineas: un marco de D x E desde HL
	ld a,020h		;823f
	ld (0ca31h),a		;8241   ; guarda lo que falta del dibujo que se abre en la presentacion
	jp pres_siguiente		;8244   ; pres_siguiente: 0xCA2C uno mas y 0xCA2D = 0
pres_paso_17:		; el dibujo de p13:89C5; al acabar 0xCA31, 5 sprites de p13:8BDA con color 7
	call baja_1000		;8247   ; baja_1000: con 0xCA31 (uno menos cada vez): el dibujo de (0x10, 0xCA31) de 0x40 x 0x60 en (0x40, 0x10)
	ld a,(0ca31h)		;824a   ; lee lo que falta del dibujo que se abre en la presentacion
	and a			;824d
	ret nz			;824e
	ld b,005h		;824f
	ld de,0dc00h		;8251   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	ld hl,08bdah		;8254
	call sprites_de_tabla		;8257   ; sprites_de_tabla: B sprites de HL [Y][X][patron] a DE (de 4 en 4)
	ld hl,0da00h		;825a   ; apunta a la copia de la tabla de colores de sprites: 32 x 16 lineas (va con 0xDC00 detras)
	ld de,0da01h		;825d
	ld bc,0004fh		;8260
	ld (hl),007h		;8263
	ldir		;8265
	xor a			;8267
	ld (0ca30h),a		;8268   ; guarda la cuenta de cuadros de la figura o el dibujo de la presentacion
	jp pres_siguiente		;826b   ; pres_siguiente: 0xCA2C uno mas y 0xCA2D = 0
pres_paso_18:		; el dibujo de p13:884A, los 5 sprites parpadean (p13:8BDA o p13:8BE9) y el texto 4
	ld hl,0ca30h		;826e   ; apunta a la cuenta de cuadros de la figura o el dibujo de la presentacion
	inc (hl)			;8271
	call dibujo_8861		;8272   ; dibujo_8861: el dibujo (0xCA30 / 0x10 & 7) de p13:8861 de 0x20 x 0x20 en (0x50, 0x28), por p13:8811 con la A que deja p00:43F6
	ld de,0dc00h		;8275   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	ld b,005h		;8278
	ld hl,0ca30h		;827a   ; apunta a la cuenta de cuadros de la figura o el dibujo de la presentacion
	bit 3,(hl)		;827d
	jr z,sprites_fuera_18		;827f
	ld a,(hl)			;8281
	and 030h		;8282
	ld hl,08bdah		;8284
	jr nz,sprites_de_hl_18		;8287
	ld hl,08be9h		;8289
sprites_de_hl_18:
	call sprites_de_tabla		;828c   ; sprites_de_tabla: B sprites de HL [Y][X][patron] a DE (de 4 en 4)
	jr texto_4		;828f
sprites_fuera_18:
	call sprites_b_fuera		;8291   ; sprites_b_fuera: B sprites desde DE fuera (Y = 0xE0)
texto_4:
	ld a,004h		;8294
	jp texto_de_ca3b		;8296   ; texto_de_ca3b: el texto A (0xCA3B) por el paso 0xCA2D (p13:8E38): el sitio y las letras (p13:8E88), 0x40 de espera, la primera linea cada 4 cuadros, la segunda cada 8, 256 de espera y el paso siguiente
pres_paso_19:		; sin sprites, la figura 0 (p13:8CE0) y la cuenta 0x20
	call 04266h		;8299   ; esconde_sprites_ram: llena 0xDC00-0xDC7F con 0xE0
	xor a			;829c
	call figura_empieza		;829d   ; figura_empieza: la figura A de p13:8D05: 0xCA31 = 0, 0xCA30 = su primer byte y sus 10 sprites de color 7
	ld de,00020h		;82a0
	jp pres_cuenta_y_siguiente		;82a3   ; pres_cuenta_y_siguiente: la cuenta 0xCA2E-0xCA2F = DE y el paso siguiente
pres_paso_20:		; espera la cuenta
	call pres_cuenta		;82a6   ; pres_cuenta: 0xCA2E-0xCA2F uno menos; Z al llegar a 0
	ret nz			;82a9
	jp pres_siguiente		;82aa   ; pres_siguiente: 0xCA2C uno mas y 0xCA2D = 0
pres_paso_21:		; la figura 0 (p13:8DAA) hasta que 0xCA30 llega a 0; la cuenta 0x20
	xor a			;82ad
	call figura_se_mueve		;82ae   ; figura_se_mueve: la figura C: 0xCA31 uno menos, sus colores a 7 o 0 por el bit 2 (parpadeo); cada 0x20 cuadros, 0xCA30 uno menos y, desde 4, los 10 sprites movidos por los pares de la tabla de p13:8DED
	ld a,(0ca30h)		;82b1   ; lee la cuenta de cuadros de la figura o el dibujo de la presentacion
	and a			;82b4
	ret nz			;82b5
	ld de,00020h		;82b6
	jp pres_cuenta_y_siguiente		;82b9   ; pres_cuenta_y_siguiente: la cuenta 0xCA2E-0xCA2F = DE y el paso siguiente
pres_paso_22:		; al acabar la cuenta: pantalla y sprites apagados, la pagina 0 borrada, el color 0x0E = 0x40, 2 sprites de p13:8C40 de color 7, el marco de p13:900C, el dibujo de (0xD0, 0x90) de 0x30 x 0x30 en (0x50, 0x30) con la operacion 0xC8, todo encendido y la cuenta 0x80
	call pres_cuenta		;82bc   ; pres_cuenta: 0xCA2E-0xCA2F uno menos; Z al llegar a 0
	ret nz			;82bf
	call 045f1h		;82c0   ; apaga_pantalla_y_sprites: p00:45CC y p00:45F6
	call 04266h		;82c3   ; esconde_sprites_ram: llena 0xDC00-0xDC7F con 0xE0
	call 045b9h		;82c6   ; borra_pagina_0: la pagina 0 a cero y R#23 = 0
	ld de,04000h		;82c9   ; el color 0x0E...
	ld a,00eh		;82cc   ; ...a 0x40
	call 04614h		;82ce   ; pon_color: el color A de la paleta = D (rojo y azul), E (verde)
	ld b,002h		;82d1   ; 2 sprites...
	ld de,0dc00h		;82d3   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	ld hl,08c40h		;82d6   ; ...de p13:8C40
	call sprites_de_tabla		;82d9   ; sprites_de_tabla: B sprites de HL [Y][X][patron] a DE (de 4 en 4)
	ld hl,0da00h		;82dc   ; apunta a la copia de la tabla de colores de sprites: 32 x 16 lineas (va con 0xDC00 detras)
	ld de,0da01h		;82df
	ld bc,0001fh		;82e2
	ld (hl),007h		;82e5
	ldir		;82e7
	ld hl,00e3eh		;82e9   ; el marco de (0x3E, 0x0E)
	call marco_con_rejilla		;82ec   ; marco_con_rejilla: en HL, un marco de 0x48 x 0x68 de color 6 con 8 rayas horizontales y 12 verticales cada 8 puntos
	ld hl,090d0h		;82ef   ; de (0xD0, 0x90)...
	ld de,03050h		;82f2   ; ...a (0x50, 0x30)...
	ld bc,03030h		;82f5   ; ...0x30 x 0x30
	ld a,0c8h		;82f8
	call 047edh		;82fa   ; copia_rectangulo_logica: orden LMMM del VDP con la operacion logica de A
	call 04606h		;82fd   ; enciende_todo: la pantalla y los sprites encendidos
	xor a			;8300
	ld (0ca30h),a		;8301   ; guarda la cuenta de cuadros de la figura o el dibujo de la presentacion
	ld de,00080h		;8304
	jp pres_cuenta_y_siguiente		;8307   ; pres_cuenta_y_siguiente: la cuenta 0xCA2E-0xCA2F = DE y el paso siguiente
pres_paso_23:		; los 2 sprites parpadean; al acabar la cuenta, sin sprites, la figura 1 y la cuenta 0x20
	ld hl,0ca30h		;830a   ; apunta a la cuenta de cuadros de la figura o el dibujo de la presentacion
	inc (hl)			;830d
	ld de,0dc00h		;830e   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	ld b,002h		;8311
	ld hl,0ca30h		;8313   ; apunta a la cuenta de cuadros de la figura o el dibujo de la presentacion
	bit 3,(hl)		;8316
	jr nz,sprites_fuera_23		;8318
	ld hl,08c40h		;831a
	call sprites_de_tabla		;831d   ; sprites_de_tabla: B sprites de HL [Y][X][patron] a DE (de 4 en 4)
	jr cuenta_23		;8320
sprites_fuera_23:
	call sprites_b_fuera		;8322   ; sprites_b_fuera: B sprites desde DE fuera (Y = 0xE0)
cuenta_23:
	call pres_cuenta		;8325   ; pres_cuenta: 0xCA2E-0xCA2F uno menos; Z al llegar a 0
	ret nz			;8328
	call 04266h		;8329   ; esconde_sprites_ram: llena 0xDC00-0xDC7F con 0xE0
	ld a,001h		;832c
	call figura_empieza		;832e   ; figura_empieza: la figura A de p13:8D05: 0xCA31 = 0, 0xCA30 = su primer byte y sus 10 sprites de color 7
	ld de,00020h		;8331
	jp pres_cuenta_y_siguiente		;8334   ; pres_cuenta_y_siguiente: la cuenta 0xCA2E-0xCA2F = DE y el paso siguiente
pres_paso_24:		; espera la cuenta
	call pres_cuenta		;8337   ; pres_cuenta: 0xCA2E-0xCA2F uno menos; Z al llegar a 0
	ret nz			;833a
	jp pres_siguiente		;833b   ; pres_siguiente: 0xCA2C uno mas y 0xCA2D = 0
pres_paso_25:		; la figura 1 (p13:8DAA) hasta que 0xCA30 llega a 0; la cuenta 0x20
	ld a,001h		;833e
	call figura_se_mueve		;8340   ; figura_se_mueve: la figura C: 0xCA31 uno menos, sus colores a 7 o 0 por el bit 2 (parpadeo); cada 0x20 cuadros, 0xCA30 uno menos y, desde 4, los 10 sprites movidos por los pares de la tabla de p13:8DED
	ld a,(0ca30h)		;8343   ; lee la cuenta de cuadros de la figura o el dibujo de la presentacion
	and a			;8346
	ret nz			;8347
	ld de,00020h		;8348
	jp pres_cuenta_y_siguiente		;834b   ; pres_cuenta_y_siguiente: la cuenta 0xCA2E-0xCA2F = DE y el paso siguiente
pres_paso_26:		; al acabar la cuenta: sin sprites, p13:887E de (0xC0, 0xC0), 2 sprites de p13:8C61 de color 7 y 0xCA30 = 0
	call pres_cuenta		;834e   ; pres_cuenta: 0xCA2E-0xCA2F uno menos; Z al llegar a 0
	ret nz			;8351
	call 04266h		;8352   ; esconde_sprites_ram: llena 0xDC00-0xDC7F con 0xE0
	ld hl,0c0c0h		;8355
	call dibujo_en_5010		;8358   ; dibujo_en_5010: el dibujo de HL de 0x20 x 0x20 en (0x50, 0x10) con la operacion 0xC8
	ld b,002h		;835b
	ld de,0dc00h		;835d   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	ld hl,08c61h		;8360
	call sprites_de_tabla		;8363   ; sprites_de_tabla: B sprites de HL [Y][X][patron] a DE (de 4 en 4)
	ld hl,0da00h		;8366   ; apunta a la copia de la tabla de colores de sprites: 32 x 16 lineas (va con 0xDC00 detras)
	ld de,0da01h		;8369
	ld bc,0001fh		;836c
	ld (hl),007h		;836f
	ldir		;8371
	xor a			;8373
	ld (0ca30h),a		;8374   ; guarda la cuenta de cuadros de la figura o el dibujo de la presentacion
	jp pres_siguiente		;8377   ; pres_siguiente: 0xCA2C uno mas y 0xCA2D = 0
pres_paso_27:		; 0xCA30 de 0 a 0x5F, el dibujo de p13:8871, los 2 sprites parpadean y el texto 5
	ld hl,0ca30h		;837a   ; apunta a la cuenta de cuadros de la figura o el dibujo de la presentacion
	inc (hl)			;837d
	ld a,(hl)			;837e
	cp 060h		;837f   ; hasta 0x60
	jr nz,dibujo_8871		;8381
	ld (hl),000h		;8383
dibujo_8871:
	call dibujo_8889		;8385   ; dibujo_8889: el dibujo (0xCA30 / 4 & 0x0F) de p13:8889 (p13:887E)
	ld de,0dc00h		;8388   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	ld b,002h		;838b
	ld hl,0ca30h		;838d   ; apunta a la cuenta de cuadros de la figura o el dibujo de la presentacion
	bit 3,(hl)		;8390
	jr nz,sprites_fuera_27		;8392
	ld hl,08c61h		;8394
	call sprites_de_tabla		;8397   ; sprites_de_tabla: B sprites de HL [Y][X][patron] a DE (de 4 en 4)
	jr texto_5		;839a
sprites_fuera_27:
	call sprites_b_fuera		;839c   ; sprites_b_fuera: B sprites desde DE fuera (Y = 0xE0)
texto_5:
	ld a,005h		;839f
	jp texto_de_ca3b		;83a1   ; texto_de_ca3b: el texto A (0xCA3B) por el paso 0xCA2D (p13:8E38): el sitio y las letras (p13:8E88), 0x40 de espera, la primera linea cada 4 cuadros, la segunda cada 8, 256 de espera y el paso siguiente
pres_paso_28:		; la figura 2 y la cuenta 0x20
	ld a,002h		;83a4
	call figura_empieza		;83a6   ; figura_empieza: la figura A de p13:8D05: 0xCA31 = 0, 0xCA30 = su primer byte y sus 10 sprites de color 7
	ld de,00020h		;83a9
	jp pres_cuenta_y_siguiente		;83ac   ; pres_cuenta_y_siguiente: la cuenta 0xCA2E-0xCA2F = DE y el paso siguiente
pres_paso_29:		; espera la cuenta
	call pres_cuenta		;83af   ; pres_cuenta: 0xCA2E-0xCA2F uno menos; Z al llegar a 0
	ret nz			;83b2
	jp pres_siguiente		;83b3   ; pres_siguiente: 0xCA2C uno mas y 0xCA2D = 0
pres_paso_30:		; la figura 2 hasta que 0xCA30 llega a 0; la cuenta 0x20
	ld a,002h		;83b6
	call figura_se_mueve		;83b8   ; figura_se_mueve: la figura C: 0xCA31 uno menos, sus colores a 7 o 0 por el bit 2 (parpadeo); cada 0x20 cuadros, 0xCA30 uno menos y, desde 4, los 10 sprites movidos por los pares de la tabla de p13:8DED
	ld a,(0ca30h)		;83bb   ; lee la cuenta de cuadros de la figura o el dibujo de la presentacion
	and a			;83be
	ret nz			;83bf
	ld de,00020h		;83c0
	jp pres_cuenta_y_siguiente		;83c3   ; pres_cuenta_y_siguiente: la cuenta 0xCA2E-0xCA2F = DE y el paso siguiente
pres_paso_31:		; al acabar la cuenta: todo apagado, la pagina 0 borrada, la paleta de p13:8F5E, el dibujo de (0, 0x80) de 0x38 x 0x58 en (0x50, 0x10), las barras 0 (en Y 0x18) y 4 (en 0x40) de p13:9D01, una raya de 0x48 en (0x50, 0x18), 6 sprites de p13:8CC8 de color 5, todo encendido y la cuenta 0x20
	call pres_cuenta		;83c6   ; pres_cuenta: 0xCA2E-0xCA2F uno menos; Z al llegar a 0
	ret nz			;83c9
	call 045f1h		;83ca   ; apaga_pantalla_y_sprites: p00:45CC y p00:45F6
	call 04266h		;83cd   ; esconde_sprites_ram: llena 0xDC00-0xDC7F con 0xE0
	call 045b9h		;83d0   ; borra_pagina_0: la pagina 0 a cero y R#23 = 0
	ld hl,08f5eh		;83d3   ; la paleta de p13:8F5E
	call 0463fh		;83d6   ; pon_paleta_con_espera: pone la paleta de HL (p00:4642) esperando al VDP antes
	ld hl,08000h		;83d9   ; de (0, 0x80)...
	ld de,01050h		;83dc   ; ...a (0x50, 0x10)...
	ld bc,05838h		;83df   ; ...0x38 x 0x58
	ld a,001h		;83e2
	call 04767h		;83e4   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
	ld de,01850h		;83e7   ; en (0x50, 0x18)...
	xor a			;83ea   ; ...la 0
	ld b,a			;83eb
	call barra_de_9d01		;83ec   ; barra_de_9d01: p00:7B48 y p03:B814 (A, DE, B)
	ld de,04050h		;83ef   ; en (0x50, 0x40)...
	ld a,004h		;83f2   ; ...la 4
	ld b,001h		;83f4
	call barra_de_9d01		;83f6   ; barra_de_9d01: p00:7B48 y p03:B814 (A, DE, B)
	ld hl,01850h		;83f9   ; una raya en (0x50, 0x18)...
	ld b,048h		;83fc   ; ...de 0x48...
	ld c,007h		;83fe   ; ...de color 7
	ld a,000h		;8400
	call 0467ch		;8402   ; linea_horizontal: orden LINE del VDP (R#36-R#46) con el lado largo en X
	ld b,006h		;8405   ; 6 sprites...
	ld de,0dc00h		;8407   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	ld hl,08cc8h		;840a   ; ...de p13:8CC8
	call sprites_de_tabla		;840d   ; sprites_de_tabla: B sprites de HL [Y][X][patron] a DE (de 4 en 4)
	ld hl,0da00h		;8410   ; apunta a la copia de la tabla de colores de sprites: 32 x 16 lineas (va con 0xDC00 detras)
	ld de,0da01h		;8413
	ld bc,0005fh		;8416
	ld (hl),005h		;8419   ; de color 5
	ldir		;841b
	call 04606h		;841d   ; enciende_todo: la pantalla y los sprites encendidos
	xor a			;8420
	ld (0ca30h),a		;8421   ; guarda la cuenta de cuadros de la figura o el dibujo de la presentacion
	ld de,00020h		;8424
	jp pres_cuenta_y_siguiente		;8427   ; pres_cuenta_y_siguiente: la cuenta 0xCA2E-0xCA2F = DE y el paso siguiente
pres_paso_32:		; p13:90AE hasta acabar la cuenta
	call mueve_sprites_2_5		;842a   ; mueve_sprites_2_5: los sprites 2-5 movidos por el par (cuenta / 0x20 & 7) de p13:90E7 y los sprites 0-1 de p13:8CC8 o p13:8CDA por el bit 2 de la cuenta
	call pres_cuenta		;842d   ; pres_cuenta: 0xCA2E-0xCA2F uno menos; Z al llegar a 0
	ret nz			;8430
	jp pres_siguiente		;8431   ; pres_siguiente: 0xCA2C uno mas y 0xCA2D = 0
pres_paso_33:		; la cuenta, p13:90AE, p03:B8AC y el texto 6
	call pres_cuenta		;8434   ; pres_cuenta: 0xCA2E-0xCA2F uno menos; Z al llegar a 0
	call mueve_sprites_2_5		;8437   ; mueve_sprites_2_5: los sprites 2-5 movidos por el par (cuenta / 0x20 & 7) de p13:90E7 y los sprites 0-1 de p13:8CC8 o p13:8CDA por el bit 2 de la cuenta
	call 07b55h		;843a   ; a_p03_b8ac_2: p03:B8AC con el banco 3 en 0xA000
	ld a,006h		;843d
	jp texto_de_ca3b		;843f   ; texto_de_ca3b: el texto A (0xCA3B) por el paso 0xCA2D (p13:8E38): el sitio y las letras (p13:8E88), 0x40 de espera, la primera linea cada 4 cuadros, la segunda cada 8, 256 de espera y el paso siguiente
pres_paso_34:		; sin sprites, la pantalla limpia, p03:B866 con 0 y con 1, la paleta de p13:8F83, un marco de 0x44 x 0x6C en (0x46, 0x86) y 0xCA31 = 0x28
	call 04266h		;8442   ; esconde_sprites_ram: llena 0xDC00-0xDC7F con 0xE0
	call 045fdh		;8445   ; pantalla_limpia: la pantalla apagada, la pagina 0 borrada y otra vez encendida
	xor a			;8448
	call 07b5dh		;8449   ; a_p03_b866_2: p03:B866 con el banco 3 en 0xA000
	ld a,001h		;844c
	call 07b5dh		;844e   ; a_p03_b866_2: p03:B866 con el banco 3 en 0xA000
	ld hl,08f83h		;8451   ; la paleta de p13:8F83
	call 0463fh		;8454   ; pon_paleta_con_espera: pone la paleta de HL (p00:4642) esperando al VDP antes
	ld hl,pres_paso_52		;8457
	ld de,06c44h		;845a
	ld c,006h		;845d
	xor a			;845f
	call 046bch		;8460   ; marco: cuatro lineas: un marco de D x E desde HL
	ld a,028h		;8463
	ld (0ca31h),a		;8465   ; guarda lo que falta del dibujo que se abre en la presentacion
	jp pres_siguiente		;8468   ; pres_siguiente: 0xCA2C uno mas y 0xCA2D = 0
pres_paso_35:		; el dibujo de p13:89F6; al acabar 0xCA31, 2 sprites de p13:8C55 de color 7
	call abre_0000		;846b   ; abre_0000: con 0xCA31: el dibujo de (0x20 - lo que va, 0) de 0x40 x 0x40 en (0x48, 0xB0)
	ld a,(0ca31h)		;846e   ; lee lo que falta del dibujo que se abre en la presentacion
	and a			;8471
	ret nz			;8472
	ld b,002h		;8473
	ld de,0dc00h		;8475   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	ld hl,08c55h		;8478
	call sprites_de_tabla		;847b   ; sprites_de_tabla: B sprites de HL [Y][X][patron] a DE (de 4 en 4)
	ld hl,0da00h		;847e   ; apunta a la copia de la tabla de colores de sprites: 32 x 16 lineas (va con 0xDC00 detras)
	ld de,0da01h		;8481
	ld bc,0001fh		;8484
	ld (hl),007h		;8487
	ldir		;8489
	xor a			;848b
	ld (0ca30h),a		;848c   ; guarda la cuenta de cuadros de la figura o el dibujo de la presentacion
	jp pres_siguiente		;848f   ; pres_siguiente: 0xCA2C uno mas y 0xCA2D = 0
pres_paso_36:		; los 2 sprites parpadean (p13:8C55 o p13:8C5B) y el texto 7
	ld de,0dc00h		;8492   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	ld b,002h		;8495
	ld hl,0ca30h		;8497   ; apunta a la cuenta de cuadros de la figura o el dibujo de la presentacion
	inc (hl)			;849a
	bit 3,(hl)		;849b
	jr z,sprites_fuera_36		;849d
	ld a,(hl)			;849f
	and 030h		;84a0
	ld hl,08c55h		;84a2
	jr nz,sprites_de_hl_36		;84a5
	ld hl,08c5bh		;84a7
sprites_de_hl_36:
	call sprites_de_tabla		;84aa   ; sprites_de_tabla: B sprites de HL [Y][X][patron] a DE (de 4 en 4)
	jr texto_7		;84ad
sprites_fuera_36:
	call sprites_b_fuera		;84af   ; sprites_b_fuera: B sprites desde DE fuera (Y = 0xE0)
texto_7:
	ld a,007h		;84b2
	jp texto_de_ca3b		;84b4   ; texto_de_ca3b: el texto A (0xCA3B) por el paso 0xCA2D (p13:8E38): el sitio y las letras (p13:8E88), 0x40 de espera, la primera linea cada 4 cuadros, la segunda cada 8, 256 de espera y el paso siguiente
pres_paso_37:		; la figura 3 y la cuenta 0x20
	ld a,003h		;84b7
	call figura_empieza		;84b9   ; figura_empieza: la figura A de p13:8D05: 0xCA31 = 0, 0xCA30 = su primer byte y sus 10 sprites de color 7
	ld de,00020h		;84bc
	jp pres_cuenta_y_siguiente		;84bf   ; pres_cuenta_y_siguiente: la cuenta 0xCA2E-0xCA2F = DE y el paso siguiente
pres_paso_38:		; espera la cuenta
	call pres_cuenta		;84c2   ; pres_cuenta: 0xCA2E-0xCA2F uno menos; Z al llegar a 0
	ret nz			;84c5
	jp pres_siguiente		;84c6   ; pres_siguiente: 0xCA2C uno mas y 0xCA2D = 0
pres_paso_39:		; la figura 3 hasta que 0xCA30 llega a 0; la cuenta 0x20
	ld a,003h		;84c9
	call figura_se_mueve		;84cb   ; figura_se_mueve: la figura C: 0xCA31 uno menos, sus colores a 7 o 0 por el bit 2 (parpadeo); cada 0x20 cuadros, 0xCA30 uno menos y, desde 4, los 10 sprites movidos por los pares de la tabla de p13:8DED
	ld a,(0ca30h)		;84ce   ; lee la cuenta de cuadros de la figura o el dibujo de la presentacion
	and a			;84d1
	ret nz			;84d2
	ld de,00020h		;84d3
	jp pres_cuenta_y_siguiente		;84d6   ; pres_cuenta_y_siguiente: la cuenta 0xCA2E-0xCA2F = DE y el paso siguiente
pres_paso_40:		; espera la cuenta
	call pres_cuenta		;84d9   ; pres_cuenta: 0xCA2E-0xCA2F uno menos; Z al llegar a 0
	ret nz			;84dc
	jp pres_siguiente		;84dd   ; pres_siguiente: 0xCA2C uno mas y 0xCA2D = 0
pres_paso_41:		; sin sprites, la pantalla limpia, el marco de p13:900C en (0x46, 0x86), el dibujo de (0xA8, 0) de 0x40 x 0x50 en (0x48, 0x98) y la cuenta 0x20
	call 04266h		;84e0   ; esconde_sprites_ram: llena 0xDC00-0xDC7F con 0xE0
	call 045fdh		;84e3   ; pantalla_limpia: la pantalla apagada, la pagina 0 borrada y otra vez encendida
	ld hl,pres_paso_52		;84e6
	call marco_con_rejilla		;84e9   ; marco_con_rejilla: en HL, un marco de 0x48 x 0x68 de color 6 con 8 rayas horizontales y 12 verticales cada 8 puntos
	ld hl,000a8h		;84ec   ; de (0xA8, 0)...
	ld de,09848h		;84ef   ; ...a (0x48, 0x98)...
	ld bc,05040h		;84f2   ; ...0x40 x 0x50
	ld a,0c8h		;84f5
	call 047edh		;84f7   ; copia_rectangulo_logica: orden LMMM del VDP con la operacion logica de A
	ld de,00020h		;84fa
	jp pres_cuenta_y_siguiente		;84fd   ; pres_cuenta_y_siguiente: la cuenta 0xCA2E-0xCA2F = DE y el paso siguiente
pres_paso_42:		; un sprite de p13:8C46 de color 7; al acabar la cuenta, 0xCA30 y 0xE900 a cero y 0xCA32 = 0xFF
	ld b,001h		;8500
	ld de,0dc00h		;8502   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	ld hl,08c46h		;8505
	call sprites_de_tabla		;8508   ; sprites_de_tabla: B sprites de HL [Y][X][patron] a DE (de 4 en 4)
	ld hl,0da00h		;850b   ; apunta a la copia de la tabla de colores de sprites: 32 x 16 lineas (va con 0xDC00 detras)
	ld de,0da01h		;850e
	ld bc,0000fh		;8511
	ld (hl),007h		;8514
	ldir		;8516
	call pres_cuenta		;8518   ; pres_cuenta: 0xCA2E-0xCA2F uno menos; Z al llegar a 0
	ret nz			;851b
	xor a			;851c
	ld (0ca30h),a		;851d   ; guarda la cuenta de cuadros de la figura o el dibujo de la presentacion
	ld (0e900h),a		;8520   ; guarda los caracteres de un dibujo pasados a 4 bits
	dec a			;8523
	ld (0ca32h),a		;8524   ; guarda la espera del texto de la presentacion
	jp pres_siguiente		;8527   ; pres_siguiente: 0xCA2C uno mas y 0xCA2D = 0
pres_paso_43:		; el sprite parpadea con el dibujo de 0xE900 (p13:8C46, 8C49 o 8C4C) y p13:88A9; al acabar, 2 sprites de p13:8C67 de color 7
	ld de,0dc00h		;852a   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	ld b,001h		;852d
	ld hl,0ca30h		;852f   ; apunta a la cuenta de cuadros de la figura o el dibujo de la presentacion
	bit 3,(hl)		;8532
	jr nz,sprite_fuera_43		;8534
	ld a,(0e900h)		;8536   ; su dibujo
	and a			;8539
	ld hl,08c46h		;853a
	jr z,sprite_de_hl_43		;853d
	dec a			;853f
	ld hl,08c49h		;8540
	jr z,sprite_de_hl_43		;8543
	ld hl,08c4ch		;8545
sprite_de_hl_43:
	call sprites_de_tabla		;8548   ; sprites_de_tabla: B sprites de HL [Y][X][patron] a DE (de 4 en 4)
	jr pres_43_88a9		;854b
sprite_fuera_43:
	call sprites_b_fuera		;854d   ; sprites_b_fuera: B sprites desde DE fuera (Y = 0xE0)
pres_43_88a9:
	ld hl,0ca30h		;8550   ; apunta a la cuenta de cuadros de la figura o el dibujo de la presentacion
	inc (hl)			;8553
	call dibujos_8903		;8554   ; aun no
	ret nz			;8557
	ld b,002h		;8558
	ld de,0dc00h		;855a   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	ld hl,08c67h		;855d
	call sprites_de_tabla		;8560   ; sprites_de_tabla: B sprites de HL [Y][X][patron] a DE (de 4 en 4)
	ld hl,0da00h		;8563   ; apunta a la copia de la tabla de colores de sprites: 32 x 16 lineas (va con 0xDC00 detras)
	ld de,0da01h		;8566
	ld bc,0001fh		;8569
	ld (hl),007h		;856c
	ldir		;856e
	xor a			;8570
	ld (0ca30h),a		;8571   ; guarda la cuenta de cuadros de la figura o el dibujo de la presentacion
	jp pres_siguiente		;8574   ; pres_siguiente: 0xCA2C uno mas y 0xCA2D = 0
pres_paso_44:		; los 2 sprites parpadean, 0xCA30 uno menos y el texto 8
	ld de,0dc00h		;8577   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	ld b,002h		;857a
	ld hl,0ca30h		;857c   ; apunta a la cuenta de cuadros de la figura o el dibujo de la presentacion
	bit 3,(hl)		;857f
	jr nz,sprites_fuera_44		;8581
	ld hl,08c67h		;8583
	call sprites_de_tabla		;8586   ; sprites_de_tabla: B sprites de HL [Y][X][patron] a DE (de 4 en 4)
	jr texto_8		;8589
sprites_fuera_44:
	call sprites_b_fuera		;858b   ; sprites_b_fuera: B sprites desde DE fuera (Y = 0xE0)
texto_8:
	ld hl,0ca30h		;858e   ; apunta a la cuenta de cuadros de la figura o el dibujo de la presentacion
	dec (hl)			;8591
	ld a,008h		;8592
	jp texto_de_ca3b		;8594   ; texto_de_ca3b: el texto A (0xCA3B) por el paso 0xCA2D (p13:8E38): el sitio y las letras (p13:8E88), 0x40 de espera, la primera linea cada 4 cuadros, la segunda cada 8, 256 de espera y el paso siguiente
pres_paso_45:		; sin sprites, la pantalla limpia, un marco de 0x44 x 0x64 en (0x3E, 0x0E) y 0xCA31 = 0x28
	call 04266h		;8597   ; esconde_sprites_ram: llena 0xDC00-0xDC7F con 0xE0
	call 045fdh		;859a   ; pantalla_limpia: la pantalla apagada, la pagina 0 borrada y otra vez encendida
	ld hl,00e3eh		;859d
	ld de,06444h		;85a0
	ld c,006h		;85a3
	xor a			;85a5
	call 046bch		;85a6   ; marco: cuatro lineas: un marco de D x E desde HL
	ld a,028h		;85a9
	ld (0ca31h),a		;85ab   ; guarda lo que falta del dibujo que se abre en la presentacion
	jp pres_siguiente		;85ae   ; pres_siguiente: 0xCA2C uno mas y 0xCA2D = 0
pres_paso_46:		; el dibujo de p13:8A14; al acabar 0xCA31, 2 sprites de p13:8BF8 de color 7
	call abre_1030		;85b1   ; abre_1030: con 0xCA31: el dibujo de (0x30 + lo que va, 0x10) de 0x40 x 0x60 en (0x40, 0x10)
	ld a,(0ca31h)		;85b4   ; lee lo que falta del dibujo que se abre en la presentacion
	and a			;85b7
	ret nz			;85b8
	ld b,002h		;85b9
	ld hl,08bf8h		;85bb
	ld de,0dc00h		;85be   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	call sprites_de_tabla		;85c1   ; sprites_de_tabla: B sprites de HL [Y][X][patron] a DE (de 4 en 4)
	ld hl,0da00h		;85c4   ; apunta a la copia de la tabla de colores de sprites: 32 x 16 lineas (va con 0xDC00 detras)
	ld de,0da01h		;85c7
	ld bc,0001fh		;85ca
	ld (hl),007h		;85cd
	ldir		;85cf
	xor a			;85d1
	ld (0ca30h),a		;85d2   ; guarda la cuenta de cuadros de la figura o el dibujo de la presentacion
	jp pres_siguiente		;85d5   ; pres_siguiente: 0xCA2C uno mas y 0xCA2D = 0
pres_paso_47:		; los 2 sprites parpadean (p13:8BF8 o p13:8BFE) y el texto 9
	ld de,0dc00h		;85d8   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	ld b,002h		;85db
	ld hl,0ca30h		;85dd   ; apunta a la cuenta de cuadros de la figura o el dibujo de la presentacion
	inc (hl)			;85e0
	bit 3,(hl)		;85e1
	jr z,sprites_fuera_47		;85e3
	ld a,(hl)			;85e5
	and 030h		;85e6
	ld hl,08bf8h		;85e8
	jr nz,sprites_de_hl_47		;85eb
	ld hl,08bfeh		;85ed
sprites_de_hl_47:
	call sprites_de_tabla		;85f0   ; sprites_de_tabla: B sprites de HL [Y][X][patron] a DE (de 4 en 4)
	jr texto_9		;85f3
sprites_fuera_47:
	call sprites_b_fuera		;85f5   ; sprites_b_fuera: B sprites desde DE fuera (Y = 0xE0)
texto_9:
	ld a,009h		;85f8
	jp texto_de_ca3b		;85fa   ; texto_de_ca3b: el texto A (0xCA3B) por el paso 0xCA2D (p13:8E38): el sitio y las letras (p13:8E88), 0x40 de espera, la primera linea cada 4 cuadros, la segunda cada 8, 256 de espera y el paso siguiente
pres_paso_48:		; sin sprites, la figura 4 y la cuenta 0x20
	call 04266h		;85fd   ; esconde_sprites_ram: llena 0xDC00-0xDC7F con 0xE0
	ld a,004h		;8600
	call figura_empieza		;8602   ; figura_empieza: la figura A de p13:8D05: 0xCA31 = 0, 0xCA30 = su primer byte y sus 10 sprites de color 7
	ld de,00020h		;8605
	jp pres_cuenta_y_siguiente		;8608   ; pres_cuenta_y_siguiente: la cuenta 0xCA2E-0xCA2F = DE y el paso siguiente
pres_paso_49:		; espera la cuenta
	call pres_cuenta		;860b   ; pres_cuenta: 0xCA2E-0xCA2F uno menos; Z al llegar a 0
	ret nz			;860e
	jp pres_siguiente		;860f   ; pres_siguiente: 0xCA2C uno mas y 0xCA2D = 0
pres_paso_50:		; la figura 4 hasta que 0xCA30 llega a 0; la cuenta 0x20
	ld a,004h		;8612
	call figura_se_mueve		;8614   ; figura_se_mueve: la figura C: 0xCA31 uno menos, sus colores a 7 o 0 por el bit 2 (parpadeo); cada 0x20 cuadros, 0xCA30 uno menos y, desde 4, los 10 sprites movidos por los pares de la tabla de p13:8DED
	ld a,(0ca30h)		;8617   ; lee la cuenta de cuadros de la figura o el dibujo de la presentacion
	and a			;861a
	ret nz			;861b
	ld de,00020h		;861c
	jp pres_cuenta_y_siguiente		;861f   ; pres_cuenta_y_siguiente: la cuenta 0xCA2E-0xCA2F = DE y el paso siguiente
pres_paso_51:		; al acabar: sin sprites, la pantalla limpia, el marco de p13:900C, el dibujo de (0xA8, 0x50) de 0x28 x 0x48 en (0x48, 0x28) y la cuenta 0x20
	call pres_cuenta		;8622   ; pres_cuenta: 0xCA2E-0xCA2F uno menos; Z al llegar a 0
	ret nz			;8625
	call 04266h		;8626   ; esconde_sprites_ram: llena 0xDC00-0xDC7F con 0xE0
	call 045fdh		;8629   ; pantalla_limpia: la pantalla apagada, la pagina 0 borrada y otra vez encendida
	ld hl,00e3eh		;862c
	call marco_con_rejilla		;862f   ; marco_con_rejilla: en HL, un marco de 0x48 x 0x68 de color 6 con 8 rayas horizontales y 12 verticales cada 8 puntos
	ld hl,050a8h		;8632   ; de (0xA8, 0x50)...
	ld de,02848h		;8635   ; ...a (0x48, 0x28)...
	ld bc,04828h		;8638   ; ...0x28 x 0x48
	ld a,0c8h		;863b
	call 047edh		;863d   ; copia_rectangulo_logica: orden LMMM del VDP con la operacion logica de A
	ld de,00020h		;8640
	jp pres_cuenta_y_siguiente		;8643   ; pres_cuenta_y_siguiente: la cuenta 0xCA2E-0xCA2F = DE y el paso siguiente
pres_paso_52:		; al acabar la cuenta: los sprites 2-6 de p13:8C04 con sus colores de p13:8CB5, 2 sprites de p13:8C4F de color 7 y la cuenta 0 (0x10000)
	call pres_cuenta		;8646   ; pres_cuenta: 0xCA2E-0xCA2F uno menos; Z al llegar a 0
	ret nz			;8649
	ld bc,00014h		;864a   ; 5 sprites...
	ld hl,08c04h		;864d   ; ...de p13:8C04...
	ld de,0dc08h		;8650   ; ...desde el 2
	ldir		;8653
	ld hl,0da20h		;8655
	ld de,08cb5h		;8658   ; sus colores de p13:8CB5
	call 051e0h		;865b   ; rachas_a_ram: deshace las rachas de DE en HL (n < 0x80 repite, n > 0x80 copia, 0 acaba)
	ld b,002h		;865e
	ld hl,08c4fh		;8660
	ld de,0dc00h		;8663   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	call sprites_de_tabla		;8666   ; sprites_de_tabla: B sprites de HL [Y][X][patron] a DE (de 4 en 4)
	ld hl,0da00h		;8669   ; apunta a la copia de la tabla de colores de sprites: 32 x 16 lineas (va con 0xDC00 detras)
	ld de,0da01h		;866c
	ld bc,0001fh		;866f
	ld (hl),007h		;8672
	ldir		;8674
	xor a			;8676
	ld (0ca30h),a		;8677   ; guarda la cuenta de cuadros de la figura o el dibujo de la presentacion
	ld de,00000h		;867a
	jp pres_cuenta_y_siguiente		;867d   ; pres_cuenta_y_siguiente: la cuenta 0xCA2E-0xCA2F = DE y el paso siguiente
pres_paso_53:		; la cuenta; cada 4 cuadros (8 hasta 0xFF00) 0xCA30 de 0 a 2 y p13:8984; desde 0xFF00, los sprites 2-6 de p13:8C04, 8C18 o 8C2C por 0xCA30 (colores de p13:8CB5, 8CBE, 8CC3); antes, fuera; los 2 de p13:8C4F parpadean por la cuenta; el texto 0x0A
	call pres_cuenta		;8680   ; pres_cuenta: 0xCA2E-0xCA2F uno menos; Z al llegar a 0
	ld a,(0ca2fh)		;8683
	cp 0ffh		;8686   ; desde 0xFF00...
	ld c,003h		;8688   ; ...cada 4...
	jr nc,pres_53_cada		;868a
	ld c,007h		;868c   ; ...si no, cada 8
pres_53_cada:
	ld a,(0ca2eh)		;868e   ; lee la cuenta de cuadros del paso de la presentacion (16 bits)
	and c			;8691
	jr nz,pres_53_sprites		;8692
	ld hl,0ca30h		;8694   ; apunta a la cuenta de cuadros de la figura o el dibujo de la presentacion
	inc (hl)			;8697
	ld a,(hl)			;8698
	cp 003h		;8699   ; hasta 3
	jr nz,pres_53_8984		;869b
	ld (hl),000h		;869d
pres_53_8984:
	call dibujo_8998		;869f   ; dibujo_8998: el dibujo 0xCA30 de p13:8998 de 0x18 x 0x30 en (0x50, 0x28) de la pagina 3
pres_53_sprites:
	ld a,(0ca2fh)		;86a2
	cp 0ffh		;86a5
	jr c,sprites_2_6_fuera		;86a7   ; antes, fuera
	ld a,(0ca30h)		;86a9   ; lee la cuenta de cuadros de la figura o el dibujo de la presentacion
	ld hl,08c04h		;86ac   ; el 0...
	ld de,08cb5h		;86af
	and a			;86b2
	jr z,sprites_2_6		;86b3
	ld hl,08c18h		;86b5   ; ...el 1...
	ld de,08cbeh		;86b8
	dec a			;86bb
	jr z,sprites_2_6		;86bc
	ld hl,08c2ch		;86be   ; ...el 2
	ld de,08cc3h		;86c1
sprites_2_6:
	push de			;86c4
	ld de,0dc08h		;86c5   ; desde el sprite 2...
	ld bc,00014h		;86c8   ; ...5
	ldir		;86cb
	pop de			;86cd
	ld hl,0da20h		;86ce   ; sus colores
	call 051e0h		;86d1   ; rachas_a_ram: deshace las rachas de DE en HL (n < 0x80 repite, n > 0x80 copia, 0 acaba)
	jr pres_53_parpadeo		;86d4
sprites_2_6_fuera:
	ld de,0dc08h		;86d6
	ld b,005h		;86d9
	call sprites_b_fuera		;86db   ; sprites_b_fuera: B sprites desde DE fuera (Y = 0xE0)
pres_53_parpadeo:
	ld de,0dc00h		;86de   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	ld b,002h		;86e1
	ld hl,0ca2eh		;86e3   ; apunta a la cuenta de cuadros del paso de la presentacion (16 bits)
	bit 3,(hl)		;86e6
	jr nz,sprites_fuera_53		;86e8
	ld hl,08c4fh		;86ea
	call sprites_de_tabla		;86ed   ; sprites_de_tabla: B sprites de HL [Y][X][patron] a DE (de 4 en 4)
	jr texto_0a		;86f0
sprites_fuera_53:
	call sprites_b_fuera		;86f2   ; sprites_b_fuera: B sprites desde DE fuera (Y = 0xE0)
texto_0a:
	ld a,00ah		;86f5
	jp texto_de_ca3b		;86f7   ; texto_de_ca3b: el texto A (0xCA3B) por el paso 0xCA2D (p13:8E38): el sitio y las letras (p13:8E88), 0x40 de espera, la primera linea cada 4 cuadros, la segunda cada 8, 256 de espera y el paso siguiente
pres_paso_54:		; sin sprites, la pantalla limpia y la cuenta 0x40
	call 04266h		;86fa   ; esconde_sprites_ram: llena 0xDC00-0xDC7F con 0xE0
	call 045fdh		;86fd   ; pantalla_limpia: la pantalla apagada, la pagina 0 borrada y otra vez encendida
	ld de,00040h		;8700
	jp pres_cuenta_y_siguiente		;8703   ; pres_cuenta_y_siguiente: la cuenta 0xCA2E-0xCA2F = DE y el paso siguiente
pres_paso_55:		; al acabar la cuenta, 0xCA30 = 0 y la cuenta 0 (0x10000)
	call pres_cuenta		;8706   ; pres_cuenta: 0xCA2E-0xCA2F uno menos; Z al llegar a 0
	ret nz			;8709
	xor a			;870a
	ld (0ca30h),a		;870b   ; guarda la cuenta de cuadros de la figura o el dibujo de la presentacion
	ld de,00000h		;870e
	jp pres_cuenta_y_siguiente		;8711   ; pres_cuenta_y_siguiente: la cuenta 0xCA2E-0xCA2F = DE y el paso siguiente
pres_paso_56:		; la cuenta; cada 16 cuadros, p13:9046 y p13:906F con 0xCA30 uno mas; al llegar a 9, la cuenta 0x80 y el paso siguiente
	call pres_cuenta		;8714   ; pres_cuenta: 0xCA2E-0xCA2F uno menos; Z al llegar a 0
	ld a,(0ca2eh)		;8717   ; lee la cuenta de cuadros del paso de la presentacion (16 bits)
	and 00fh		;871a   ; cada 16 cuadros
	ret nz			;871c
	ld hl,0ca30h		;871d   ; apunta a la cuenta de cuadros de la figura o el dibujo de la presentacion
	ld a,(hl)			;8720
	cp 009h		;8721   ; 9?
	ld de,00080h		;8723   ; la cuenta 0x80...
	jp z,pres_cuenta_y_siguiente		;8726   ; ...y el siguiente
	call marco_de_ca30		;8729   ; marco_de_ca30: un marco de 0x34 x 0x44 de color 6 en el sitio 0xCA30 de p13:905D
	call dibujo_de_ca30_b		;872c   ; dibujo_de_ca30_b: el dibujo 0xCA30 de p13:908A [destino][origen], 0x30 x 0x40 de la pagina 1
	ld hl,0ca30h		;872f   ; apunta a la cuenta de cuadros de la figura o el dibujo de la presentacion
	inc (hl)			;8732
	ret			;8733
pres_paso_57:		; espera la cuenta
	call pres_cuenta		;8734   ; pres_cuenta: 0xCA2E-0xCA2F uno menos; Z al llegar a 0
	ret nz			;8737
	jp pres_siguiente		;8738   ; pres_siguiente: 0xCA2C uno mas y 0xCA2D = 0
pres_paso_58:		; la paleta a negro (p13:90F7)
	call a_negro_cada_4		;873b   ; a_negro_cada_4: cada 4 cuadros de la cuenta, p13:90FD
	ret nz			;873e
	jp pres_siguiente		;873f   ; pres_siguiente: 0xCA2C uno mas y 0xCA2D = 0
pres_paso_59:		; la pantalla limpia, la paleta a negro y p13:8A2D
	call 045fdh		;8742   ; pantalla_limpia: la pantalla apagada, la pagina 0 borrada y otra vez encendida
	call paleta_negra		;8745   ; paleta_negra: en 0xE900, la paleta de 16 colores a negro ([n][0][0]) y 0xFF
	ld hl,0e900h		;8748   ; apunta a los caracteres de un dibujo pasados a 4 bits
	call 0463fh		;874b   ; pon_paleta_con_espera: pone la paleta de HL (p00:4642) esperando al VDP antes
	call dibujo_grande		;874e   ; dibujo_grande: el dibujo de (0, 0) de la pagina 1, 0xA8 x 0x80, en (0x10, 0x40)
	jp pres_siguiente		;8751   ; pres_siguiente: 0xCA2C uno mas y 0xCA2D = 0
pres_paso_60:		; la paleta hacia la de p13:9238; al llegar, 12 sprites de p13:8C6D de color 7 y la cuenta 0xFF
	call pres_cuenta		;8754   ; pres_cuenta: 0xCA2E-0xCA2F uno menos; Z al llegar a 0
	ld de,09238h		;8757
	call paleta_hacia_cada_8		;875a   ; paleta_hacia_cada_8: cada 8 cuadros de la cuenta, p13:9175
	ret nz			;875d
	ld b,00ch		;875e   ; 12 sprites...
	ld hl,08c6dh		;8760   ; ...de p13:8C6D
	ld de,0dc00h		;8763   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	call sprites_de_tabla		;8766   ; sprites_de_tabla: B sprites de HL [Y][X][patron] a DE (de 4 en 4)
	ld hl,0da00h		;8769   ; apunta a la copia de la tabla de colores de sprites: 32 x 16 lineas (va con 0xDC00 detras)
	ld de,0da01h		;876c
	ld bc,000bfh		;876f   ; 0xC0 colores...
	ld (hl),007h		;8772   ; ...a 7
	ldir		;8774
	xor a			;8776
	ld (0ca30h),a		;8777   ; guarda la cuenta de cuadros de la figura o el dibujo de la presentacion
	ld de,000ffh		;877a
	jp pres_cuenta_y_siguiente		;877d   ; pres_cuenta_y_siguiente: la cuenta 0xCA2E-0xCA2F = DE y el paso siguiente
pres_paso_61:		; los 12 sprites, fuera mientras la cuenta pasa de 0x40, luego parpadean (p13:8C6D o p13:8C91); al acabar la cuenta, la paleta de p13:9258 (p13:91F0)
	ld de,0dc00h		;8780   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	ld b,00ch		;8783
	ld a,(0ca2eh)		;8785   ; lee la cuenta de cuadros del paso de la presentacion (16 bits)
	cp 040h		;8788   ; desde 0x40, fuera
	jr c,sprites_fuera_61		;878a
	ld hl,0ca30h		;878c   ; apunta a la cuenta de cuadros de la figura o el dibujo de la presentacion
	inc (hl)			;878f
	bit 3,(hl)		;8790
	jr z,sprites_fuera_61		;8792
	ld a,(hl)			;8794
	and 030h		;8795
	ld hl,08c6dh		;8797
	jr nz,sprites_de_hl_61		;879a
	ld hl,08c91h		;879c
sprites_de_hl_61:
	call sprites_de_tabla		;879f   ; sprites_de_tabla: B sprites de HL [Y][X][patron] a DE (de 4 en 4)
	jr cuenta_61		;87a2
sprites_fuera_61:
	call sprites_b_fuera		;87a4   ; sprites_b_fuera: B sprites desde DE fuera (Y = 0xE0)
cuenta_61:
	call pres_cuenta		;87a7   ; pres_cuenta: 0xCA2E-0xCA2F uno menos; Z al llegar a 0
	ret nz			;87aa
	call paleta_9258		;87ab   ; paleta_9258: en 0xE900, la paleta de p13:9258 ([n][rojo-azul][verde]) y 0xFF
	jp pres_siguiente		;87ae   ; pres_siguiente: 0xCA2C uno mas y 0xCA2D = 0
pres_paso_62:		; cada 2 cuadros la paleta hacia la de p13:9278; al llegar, sin sprites y el mapa de bits de p57:8098
	ld a,(0ca03h)		;87b1   ; lee el contador de cuadros (uno mas en cada interrupcion)
	and 001h		;87b4
	ret nz			;87b6
	ld de,09278h		;87b7
	call paleta_hacia		;87ba   ; paleta_hacia: la paleta de 0xE900 un paso hacia la de DE (con A = 1, hacia el otro lado) y puesta; NZ mientras no sea igual
	ret nz			;87bd
	call 04266h		;87be   ; esconde_sprites_ram: llena 0xDC00-0xDC7F con 0xE0
	call 06e29h		;87c1   ; mapa_de_bits_8098: el mapa de bits de p57:8098 en la VRAM de 0x0820
	jp pres_siguiente		;87c4   ; pres_siguiente: 0xCA2C uno mas y 0xCA2D = 0
pres_paso_63:		; cada 8 cuadros la paleta se aleja de la de p13:9298 (p13:9177 con 1); al llegar, la cuenta 0x100
	ld a,(0ca03h)		;87c7   ; lee el contador de cuadros (uno mas en cada interrupcion)
	and 007h		;87ca
	ret nz			;87cc
	ld de,09298h		;87cd
	ld a,001h		;87d0
	call paleta_un_paso		;87d2   ; paleta_un_paso:
	ret nz			;87d5
	ld de,00100h		;87d6
	jp pres_cuenta_y_siguiente		;87d9   ; pres_cuenta_y_siguiente: la cuenta 0xCA2E-0xCA2F = DE y el paso siguiente
pres_paso_64:		; al acabar la cuenta, la orden 0xF6 al sonido
	call pres_cuenta		;87dc   ; pres_cuenta: 0xCA2E-0xCA2F uno menos; Z al llegar a 0
	ret nz			;87df
	call 06be8h		;87e0   ; orden_sonido_f6: la orden 0xF6 al sonido
	jp pres_siguiente		;87e3   ; pres_siguiente: 0xCA2C uno mas y 0xCA2D = 0
pres_paso_65:		; cada 4 cuadros la paleta a negro; al acabar, 0xCA2C = 0: la presentacion se acaba
	ld a,(0ca03h)		;87e6   ; lee el contador de cuadros (uno mas en cada interrupcion)
	and 003h		;87e9
	ret nz			;87eb
	call a_negro_cada_4		;87ec   ; a_negro_cada_4: cada 4 cuadros de la cuenta, p13:90FD
	ret nz			;87ef
	xor a			;87f0
	ld (0ca2ch),a		;87f1   ; guarda el paso de la presentacion (1-0x41; 0 se acaba, desde 0x80 p14:A2CF)
	ret			;87f4
pres_cuenta:		; 0xCA2E-0xCA2F uno menos; Z al llegar a 0
	ld bc,(0ca2eh)		;87f5   ; lee la cuenta de cuadros del paso de la presentacion (16 bits)
	dec bc			;87f9
	ld (0ca2eh),bc		;87fa   ; guarda la cuenta de cuadros del paso de la presentacion (16 bits)
	ld a,b			;87fe
	or c			;87ff
	ret			;8800
dibujo_de_ca31:		; el dibujo de (0x38 + 0xCA31, 0xB8) de 0x10 x 0x10 en (0x70, 0xC8)
	ld a,(0ca31h)		;8801   ; lee lo que falta del dibujo que se abre en la presentacion
	add a,038h		;8804
	ld l,a			;8806
	ld h,0b8h		;8807
	ld de,0c870h		;8809
	ld bc,01010h		;880c
copia_de_pagina_1:		; copia HL a DE, C x B, de la pagina 1
	ld a,001h		;880f
	jp 04767h		;8811   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
dibujo_de_ca30:		; el dibujo (0xCA30 / 8 & 0x0F) de p13:882A de 0x28 x 0x20 en (0x5F, 0xC8)
	ld a,(0ca30h)		;8814   ; lee la cuenta de cuadros de la figura o el dibujo de la presentacion
	and 078h		;8817
	rra			;8819
	rra			;881a
	rra			;881b
	ld hl,0882ah		;881c
	call 043f6h		;881f   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld de,0c85fh		;8822
	ld bc,02028h		;8825
	jr copia_de_pagina_1		;8828

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


dibujo_8861:		; el dibujo (0xCA30 / 0x10 & 7) de p13:8861 de 0x20 x 0x20 en (0x50, 0x28), por p13:8811 con la A que deja p00:43F6
	ld a,(0ca30h)		;884a   ; lee la cuenta de cuadros de la figura o el dibujo de la presentacion
	and 070h		;884d   ; 0-7
	rra			;884f
	rra			;8850
	rra			;8851
	rra			;8852
	ld hl,08861h		;8853
	call 043f6h		;8856   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld de,02850h		;8859   ; en (0x50, 0x28)...
	ld bc,02020h		;885c   ; ...0x20 x 0x20
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


dibujo_8889:		; el dibujo (0xCA30 / 4 & 0x0F) de p13:8889 (p13:887E)
	ld a,(0ca30h)		;8871   ; lee la cuenta de cuadros de la figura o el dibujo de la presentacion
	and 03ch		;8874   ; 0-15
	rra			;8876
	rra			;8877
	ld hl,08889h		;8878
	call 043f6h		;887b   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
dibujo_en_5010:		; el dibujo de HL de 0x20 x 0x20 en (0x50, 0x10) con la operacion 0xC8
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


dibujos_8903:		; cada 8 cuadros, 0xCA32 uno mas y su numero de p13:8903 (0xFF: Z, se acaba): los 5, 6 y 8 suman uno a 0xE900; su fila de 12 bytes de p13:8918, dos copias de la pagina 3 [ancho][alto][destino][origen] (0: nada); NZ
	ld a,(0ca30h)		;88a9   ; lee la cuenta de cuadros de la figura o el dibujo de la presentacion
	and 007h		;88ac
	ret nz			;88ae   ; cada 8 cuadros
	ld hl,0ca32h		;88af   ; apunta a la espera del texto de la presentacion
	inc (hl)			;88b2
	ld a,(hl)			;88b3
	ld hl,08903h		;88b4   ; el numero de p13:8903
	call 0423eh		;88b7   ; suma_a_hl: HL = HL + A
	ld a,(hl)			;88ba
	cp 0ffh		;88bb   ; 0xFF: Z
	ret z			;88bd
	cp 005h		;88be   ; el 5...
	call z,e900_mas_1		;88c0   ; e900_mas_1:
	cp 006h		;88c3   ; ...el 6...
	call z,e900_mas_1		;88c5   ; e900_mas_1:
	cp 008h		;88c8   ; ...o el 8: 0xE900 + 1
	call z,e900_mas_1		;88ca   ; e900_mas_1:
	add a,a			;88cd   ; * 12...
	add a,a			;88ce
	ld c,a			;88cf
	add a,a			;88d0
	add a,c			;88d1
	ld hl,08918h		;88d2   ; ...de p13:8918
	call 0423eh		;88d5   ; suma_a_hl: HL = HL + A
	call copia_8918		;88d8   ; la primera copia...
copia_8918:		; ...y la segunda
	ld a,(hl)			;88db
	and a			;88dc
	jr z,sin_copia		;88dd   ; 0: nada
	ld c,(hl)			;88df   ; ancho...
	inc hl			;88e0
	ld b,(hl)			;88e1   ; ...alto...
	inc hl			;88e2
	ld e,(hl)			;88e3   ; ...destino...
	inc hl			;88e4
	ld d,(hl)			;88e5
	inc hl			;88e6
	ld a,(hl)			;88e7   ; ...origen
	inc hl			;88e8
	push hl			;88e9
	ld h,(hl)			;88ea
	ld l,a			;88eb
	ld a,003h		;88ec   ; de la pagina 3
	call 04767h		;88ee   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
	pop hl			;88f1
	inc hl			;88f2
	xor a			;88f3   ; NZ
	inc a			;88f4
	ret			;88f5
sin_copia:		; salta los 6 bytes
	ld a,006h		;88f6
	call 0423eh		;88f8   ; suma_a_hl: HL = HL + A
	xor a			;88fb
	inc a			;88fc
	ret			;88fd
e900_mas_1:
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


dibujo_8998:		; el dibujo 0xCA30 de p13:8998 de 0x18 x 0x30 en (0x50, 0x28) de la pagina 3
	ld a,(0ca30h)		;8984   ; lee la cuenta de cuadros de la figura o el dibujo de la presentacion
	ld hl,08998h		;8987
	call 043f6h		;898a   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld de,02850h		;898d   ; en (0x50, 0x28)...
	ld bc,03018h		;8990   ; ...0x18 x 0x30
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


abre_8068:		; con 0xCA31 (uno menos cada vez): el dibujo de (0x68, 0x40 - lo que va) de la pagina 1 en (0x40, 0x10), de 0x40 de ancho y 0x40 + lo que va de alto (hasta 0x68)
	ld hl,0ca31h		;899e   ; apunta a lo que falta del dibujo que se abre en la presentacion
	ld a,(hl)			;89a1
	and a			;89a2
	ret z			;89a3   ; a 0, nada
	dec (hl)			;89a4
	sub 038h		;89a5   ; lo que va (0x38 - 0xCA31)
	neg		;89a7
	ld b,a			;89a9
	ld a,040h		;89aa   ; 0x40 - lo que va...
	sub b			;89ac
	jr nc,abre_8068_b		;89ad
	xor a			;89af   ; ...o 0
abre_8068_b:
	ld h,a			;89b0
	ld l,068h		;89b1
	ld de,01040h		;89b3
	ld a,040h		;89b6   ; 0x40 + lo que va...
	add a,b			;89b8
	cp 068h		;89b9
	jr c,abre_8068_c		;89bb
	ld a,068h		;89bd   ; ...hasta 0x68
abre_8068_c:
	ld b,a			;89bf
	ld c,040h		;89c0
	jp copia_de_pagina_1		;89c2   ; copia_de_pagina_1: copia HL a DE, C x B, de la pagina 1
baja_1000:		; con 0xCA31 (uno menos cada vez): el dibujo de (0x10, 0xCA31) de 0x40 x 0x60 en (0x40, 0x10)
	ld hl,0ca31h		;89c5   ; apunta a lo que falta del dibujo que se abre en la presentacion
	ld a,(hl)			;89c8
	and a			;89c9
	ret z			;89ca   ; a 0, nada
	dec (hl)			;89cb
	ld h,a			;89cc
	ld l,010h		;89cd
	ld de,01040h		;89cf
	ld bc,06040h		;89d2
	jp copia_de_pagina_1		;89d5   ; copia_de_pagina_1: copia HL a DE, C x B, de la pagina 1
abre_1800:		; con 0xCA31: el dibujo de (0x40 - lo que va, 0x18) de 0x40 x 0x68 en (0x48, 0x88)
	ld hl,0ca31h		;89d8   ; apunta a lo que falta del dibujo que se abre en la presentacion
	ld a,(hl)			;89db
	and a			;89dc
	ret z			;89dd   ; a 0, nada
	dec (hl)			;89de
	sub 028h		;89df   ; lo que va (0x28 - 0xCA31)
	neg		;89e1
	ld b,a			;89e3
	ld a,040h		;89e4
	sub b			;89e6
	jr nc,abre_1800_b		;89e7
	xor a			;89e9   ; o 0
abre_1800_b:
	ld l,a			;89ea
	ld h,018h		;89eb
	ld de,08848h		;89ed
	ld bc,06840h		;89f0
	jp copia_de_pagina_1		;89f3   ; copia_de_pagina_1: copia HL a DE, C x B, de la pagina 1
abre_0000:		; con 0xCA31: el dibujo de (0x20 - lo que va, 0) de 0x40 x 0x40 en (0x48, 0xB0)
	ld hl,0ca31h		;89f6   ; apunta a lo que falta del dibujo que se abre en la presentacion
	ld a,(hl)			;89f9
	and a			;89fa
	ret z			;89fb   ; a 0, nada
	dec (hl)			;89fc
	sub 028h		;89fd   ; lo que va (0x28 - 0xCA31)
	neg		;89ff
	ld b,a			;8a01
	ld a,020h		;8a02
	sub b			;8a04
	jr nc,abre_0000_b		;8a05
	xor a			;8a07   ; o 0
abre_0000_b:
	ld l,a			;8a08
	ld h,000h		;8a09
	ld de,0b048h		;8a0b
	ld bc,04040h		;8a0e
	jp copia_de_pagina_1		;8a11   ; copia_de_pagina_1: copia HL a DE, C x B, de la pagina 1
abre_1030:		; con 0xCA31: el dibujo de (0x30 + lo que va, 0x10) de 0x40 x 0x60 en (0x40, 0x10)
	ld hl,0ca31h		;8a14   ; apunta a lo que falta del dibujo que se abre en la presentacion
	ld a,(hl)			;8a17
	and a			;8a18
	ret z			;8a19   ; a 0, nada
	dec (hl)			;8a1a
	ld c,(hl)			;8a1b   ; lo que va (0x28 - 0xCA31)...
	ld a,028h		;8a1c
	sub c			;8a1e
	add a,030h		;8a1f   ; ...+ 0x30
	ld l,a			;8a21
	ld h,010h		;8a22
	ld de,01040h		;8a24
	ld bc,06040h		;8a27
	jp copia_de_pagina_1		;8a2a   ; copia_de_pagina_1: copia HL a DE, C x B, de la pagina 1
dibujo_grande:		; el dibujo de (0, 0) de la pagina 1, 0xA8 x 0x80, en (0x10, 0x40)
	ld hl,00000h		;8a2d
	ld de,04010h		;8a30
	ld bc,080a8h		;8a33
	ld a,001h		;8a36
	jp 04767h		;8a38   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
barras_empiezan:		; las 20 barras [direccion][alto] de p13:8B00 a 0xE900
	ld de,08b00h		;8a3b
	ld hl,0e900h		;8a3e   ; apunta a los caracteres de un dibujo pasados a 4 bits
	ld b,014h		;8a41   ; 20
barra_empieza:
	ld a,(de)			;8a43   ; la direccion...
	ld (hl),a			;8a44
	inc hl			;8a45
	inc de			;8a46
	ld a,(de)			;8a47   ; ...y el alto
	ld (hl),a			;8a48
	inc de			;8a49
	inc hl			;8a4a
	djnz barra_empieza		;8a4b   ; 20
	ret			;8a4d
barras_cada_cuadro:		; las 20 barras de 0xE900 suben o bajan (las 10 primeras entre 1 y 0x0F; las otras entre 1 y 0x16, cambiando de direccion en los topes) y se pintan: las de arriba en (0x64, 0x40) de color 0xCC sobre 0x10, las de abajo en (0x64, 0x26) desde 0x18
	ld hl,0e900h		;8a4e   ; apunta a los caracteres de un dibujo pasados a 4 bits
	push hl			;8a51
	ld b,00ah		;8a52   ; 10
barra_arriba:
	ld a,(hl)			;8a54
	inc hl			;8a55   ; su alto
	dec a			;8a56   ; la direccion 1...
	jr z,barra_arriba_sube		;8a57
	dec (hl)			;8a59   ; ...baja
	ld a,(hl)			;8a5a
	cp 001h		;8a5b   ; en 1...
	jr nz,barra_arriba_siguiente		;8a5d
	dec hl			;8a5f
	ld (hl),001h		;8a60   ; ...cambia...
	inc hl			;8a62
	ld (hl),003h		;8a63   ; ...a 3
	jr barra_arriba_siguiente		;8a65
barra_arriba_sube:		; sube
	inc (hl)			;8a67
	ld a,(hl)			;8a68
	cp 00fh		;8a69   ; en 0x0F...
	jr nz,barra_arriba_siguiente		;8a6b
	dec hl			;8a6d
	ld (hl),000h		;8a6e   ; ...cambia...
	inc hl			;8a70
	ld (hl),00dh		;8a71   ; ...a 0x0D
barra_arriba_siguiente:
	inc hl			;8a73
	djnz barra_arriba		;8a74
	ld b,00ah		;8a76   ; 10 mas
barra_abajo:
	ld a,(hl)			;8a78
	inc hl			;8a79
	dec a			;8a7a   ; la direccion 1...
	jr z,barra_abajo_sube		;8a7b
	dec (hl)			;8a7d   ; ...baja
	ld a,(hl)			;8a7e
	cp 001h		;8a7f   ; en 1...
	jr nz,barra_abajo_siguiente		;8a81
	dec hl			;8a83
	ld (hl),001h		;8a84
	inc hl			;8a86
	ld (hl),003h		;8a87   ; ...a 3
	jr barra_abajo_siguiente		;8a89
barra_abajo_sube:
	inc (hl)			;8a8b
	ld a,(hl)			;8a8c
	cp 016h		;8a8d   ; en 0x16...
	jr nz,barra_abajo_siguiente		;8a8f
	dec hl			;8a91
	ld (hl),000h		;8a92
	inc hl			;8a94
	ld (hl),014h		;8a95   ; ...a 0x14
barra_abajo_siguiente:
	inc hl			;8a97
	djnz barra_abajo		;8a98
	pop de			;8a9a
	inc de			;8a9b
	ld hl,04064h		;8a9c   ; en (0x64, 0x40)
	ld b,00ah		;8a9f   ; 10
pinta_barra_arriba:
	push bc			;8aa1
	push de			;8aa2
	push hl			;8aa3
	ld a,(de)			;8aa4   ; su alto...
	ld b,a			;8aa5
	ld c,002h		;8aa6   ; ...2 de ancho...
	ld a,0cch		;8aa8   ; ...del color 0xCC
	ld d,000h		;8aaa
	call 046ffh		;8aac   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
	pop hl			;8aaf
	pop de			;8ab0
	push de			;8ab1
	push hl			;8ab2
	ld a,(de)			;8ab3   ; el resto hasta 0x10...
	ld b,a			;8ab4
	add a,h			;8ab5
	ld h,a			;8ab6
	ld a,010h		;8ab7
	sub b			;8ab9
	ld b,a			;8aba
	ld c,002h		;8abb
	xor a			;8abd   ; ...a 0
	ld d,000h		;8abe
	call 046ffh		;8ac0   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
	pop hl			;8ac3
	inc l			;8ac4   ; 2 a la derecha
	inc l			;8ac5
	pop de			;8ac6
	inc de			;8ac7
	inc de			;8ac8
	pop bc			;8ac9
	djnz pinta_barra_arriba		;8aca
	ld hl,02664h		;8acc   ; en (0x64, 0x26)
	ld b,00ah		;8acf
pinta_barra_abajo:
	push bc			;8ad1
	push de			;8ad2
	push hl			;8ad3
	ld a,(de)			;8ad4
	ld b,a			;8ad5
	ld a,018h		;8ad6   ; 0x18 - su alto...
	sub b			;8ad8
	ld b,a			;8ad9
	ld c,002h		;8ada
	xor a			;8adc   ; ...a 0
	ld d,000h		;8add
	call 046ffh		;8adf   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
	pop hl			;8ae2
	pop de			;8ae3
	push de			;8ae4
	push hl			;8ae5
	ld a,(de)			;8ae6
	ld b,a			;8ae7
	ld a,018h		;8ae8   ; debajo...
	add a,h			;8aea
	sub b			;8aeb
	ld h,a			;8aec
	ld c,002h		;8aed
	ld a,0cch		;8aef   ; ...del color 0xCC
	ld d,000h		;8af1
	call 046ffh		;8af3   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
	pop hl			;8af6
	inc l			;8af7   ; 2 a la derecha
	inc l			;8af8
	pop de			;8af9
	inc de			;8afa
	inc de			;8afb
	pop bc			;8afc
	djnz pinta_barra_abajo		;8afd
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


sprites_8b53:		; los 5 sprites de la fila (0xCA30 / 8 & 3) * 12 de p13:8B53 a 0xDC00 y sus colores de p13:8B83 (rachas)
	ld a,(0ca30h)		;8b28   ; lee la cuenta de cuadros de la figura o el dibujo de la presentacion
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
	ld de,0dc00h		;8b3b   ; 5...
	ld bc,004ffh		;8b3e
sprite_8b53:		; Y, X, patron
	ldi		;8b41
	ldi		;8b43
	ldi		;8b45
	inc de			;8b47
	djnz sprite_8b53		;8b48
	ld hl,0da00h		;8b4a   ; los colores...
	ld de,08b83h		;8b4d   ; ...de p13:8B83
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


sprites_b_fuera:		; B sprites desde DE fuera (Y = 0xE0)
	ld a,0e0h		;8b88
sprite_b_fuera:
	ld (de),a			;8b8a   ; Y = 0xE0
	inc de			;8b8b   ; el siguiente (4 bytes)
	inc de			;8b8c
	inc de			;8b8d
	inc de			;8b8e
	djnz sprite_b_fuera		;8b8f   ; B
	ret			;8b91
sprites_de_tabla:		; B sprites de HL [Y][X][patron] a DE (de 4 en 4)
	push bc			;8b92
	ldi		;8b93   ; la Y...
	ldi		;8b95   ; ...la X...
	ldi		;8b97   ; ...el patron
	inc de			;8b99   ; sin el color
	pop bc			;8b9a
	djnz sprites_de_tabla		;8b9b   ; B
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


figura_empieza:		; la figura A de p13:8D05: 0xCA31 = 0, 0xCA30 = su primer byte y sus 10 sprites de color 7
	ld hl,08d05h		;8ce0
	call 043f6h		;8ce3   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	xor a			;8ce6
	ld (0ca31h),a		;8ce7   ; 0xCA31 = 0
	ld a,(hl)			;8cea   ; las veces...
	ld (0ca30h),a		;8ceb   ; ...a 0xCA30
	inc hl			;8cee
	ld de,0dc00h		;8cef   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	ld b,00ah		;8cf2   ; 10 sprites
	call sprites_de_tabla		;8cf4   ; sprites_de_tabla: B sprites de HL [Y][X][patron] a DE (de 4 en 4)
	ld hl,0da00h		;8cf7   ; apunta a la copia de la tabla de colores de sprites: 32 x 16 lineas (va con 0xDC00 detras)
	ld de,0da01h		;8cfa
	ld bc,0009fh		;8cfd   ; los colores...
	ld (hl),007h		;8d00   ; ...a 7
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


figura_se_mueve:		; la figura C: 0xCA31 uno menos, sus colores a 7 o 0 por el bit 2 (parpadeo); cada 0x20 cuadros, 0xCA30 uno menos y, desde 4, los 10 sprites movidos por los pares de la tabla de p13:8DED
	ld c,a			;8daa
	ld hl,0ca31h		;8dab   ; apunta a lo que falta del dibujo que se abre en la presentacion
	dec (hl)			;8dae
	ld a,(hl)			;8daf
	bit 2,a		;8db0   ; por el bit 2...
	ld a,007h		;8db2   ; ...7...
	jr nz,colores_de_figura		;8db4
	xor a			;8db6   ; ...o 0
colores_de_figura:
	ld hl,0da00h		;8db7   ; apunta a la copia de la tabla de colores de sprites: 32 x 16 lineas (va con 0xDC00 detras)
	ld de,0da01h		;8dba
	ld bc,0009fh		;8dbd
	ld (hl),a			;8dc0
	ldir		;8dc1
	ld a,(0ca31h)		;8dc3   ; lee lo que falta del dibujo que se abre en la presentacion
	and 01fh		;8dc6   ; cada 0x20 cuadros
	ret nz			;8dc8
	ld hl,0ca30h		;8dc9   ; apunta a la cuenta de cuadros de la figura o el dibujo de la presentacion
	dec (hl)			;8dcc   ; uno menos
	ld a,(hl)			;8dcd
	cp 004h		;8dce   ; por debajo de 4, nada
	ret c			;8dd0
	ld a,c			;8dd1
	ld hl,08dedh		;8dd2   ; los pares de p13:8DED
	call 043f6h		;8dd5   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld de,0dc00h		;8dd8   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	ld b,00ah		;8ddb   ; 10 sprites
mueve_sprite_figura:		; la Y + el primero
	ld a,(de)			;8ddd
	add a,(hl)			;8dde
	ld (de),a			;8ddf
	inc de			;8de0
	inc hl			;8de1
	ld a,(de)			;8de2   ; la X + el segundo
	add a,(hl)			;8de3
	ld (de),a			;8de4
	inc de			;8de5
	inc de			;8de6   ; el siguiente (4 bytes)
	inc de			;8de7
	inc hl			;8de8
	dec b			;8de9
	jr nz,mueve_sprite_figura		;8dea
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


texto_de_ca3b:		; el texto A (0xCA3B) por el paso 0xCA2D (p13:8E38): el sitio y las letras (p13:8E88), 0x40 de espera, la primera linea cada 4 cuadros, la segunda cada 8, 256 de espera y el paso siguiente
	ld (0ca3bh),a		;8e2f   ; guarda el texto de la presentacion (0-10, p13:8E88)
	ld a,(0ca2dh)		;8e32   ; lee el paso del texto de la presentacion (p13:8E2F)
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


texto_paso_0:		; los punteros del texto y 0x40 de espera
	call punteros_del_texto		;8e44   ; punteros_del_texto: por 0xCA3B: el sitio de la primera linea de p13:8FB4 a 0xCA33, sus letras de p13:8FE0 a 0xCA35, el de la segunda de p13:8FCA a 0xCA37 y sus letras de p13:8FF6 a 0xCA39
	ld a,040h		;8e47
	jr texto_ca32		;8e49
texto_espera:		; espera 0xCA32
	ld hl,0ca32h		;8e4b   ; apunta a la espera del texto de la presentacion
	dec (hl)			;8e4e
	ret nz			;8e4f
	xor a			;8e50
texto_ca32:
	ld (0ca32h),a		;8e51   ; guarda la espera del texto de la presentacion
texto_siguiente:		; 0xCA2D uno mas
	ld hl,0ca2dh		;8e54   ; apunta a el paso del texto de la presentacion (p13:8E2F)
	inc (hl)			;8e57
	ret			;8e58
texto_linea_1:		; cada 4 cuadros una letra de la primera linea (p13:8EB9); al acabar, el paso siguiente
	ld hl,0ca32h		;8e59   ; apunta a la espera del texto de la presentacion
	inc (hl)			;8e5c
	ld a,(hl)			;8e5d
	and 003h		;8e5e
	ret nz			;8e60
	call letra_linea_1		;8e61   ; letra_linea_1: con el banco 53: la letra de 0xCA35 en el sitio 0xCA33 (p13:8EF4); con 0xFF, Z; si no, los dos avanzan y NZ
	ret nz			;8e64
	xor a			;8e65
	jp texto_ca32		;8e66   ; texto_ca32:
texto_linea_2:		; cada 8 cuadros una letra de la segunda linea (p13:8ED6)
	ld hl,0ca32h		;8e69   ; apunta a la espera del texto de la presentacion
	inc (hl)			;8e6c
	ld a,(hl)			;8e6d
	and 007h		;8e6e
	ret nz			;8e70
	call letra_linea_2		;8e71   ; letra_linea_2: con el banco 53: la letra de 0xCA39 (dos mitades, p13:8F22) en 0xCA37; con 0xFF, Z
	ret nz			;8e74
	xor a			;8e75
	jp texto_ca32		;8e76   ; texto_ca32:
texto_espera_256:		; 256 cuadros (desde 0)
	ld hl,0ca32h		;8e79   ; apunta a la espera del texto de la presentacion
	dec (hl)			;8e7c
	ret nz			;8e7d
	jp texto_siguiente		;8e7e   ; texto_siguiente: 0xCA2D uno mas
texto_acaba:		; el paso siguiente de la presentacion
	call sin_carry		;8e81   ; sin_carry:
	ret c			;8e84
	jp pres_siguiente		;8e85   ; pres_siguiente: 0xCA2C uno mas y 0xCA2D = 0
punteros_del_texto:		; por 0xCA3B: el sitio de la primera linea de p13:8FB4 a 0xCA33, sus letras de p13:8FE0 a 0xCA35, el de la segunda de p13:8FCA a 0xCA37 y sus letras de p13:8FF6 a 0xCA39
	ld a,(0ca3bh)		;8e88   ; lee el texto de la presentacion (0-10, p13:8E88)
	ld hl,08fb4h		;8e8b
	call 043f6h		;8e8e   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld (0ca33h),hl		;8e91   ; guarda el sitio de la primera linea del texto de la presentacion y el byte siguiente (16 bits)
	ld a,(0ca3bh)		;8e94   ; lee el texto de la presentacion (0-10, p13:8E88)
	ld hl,08fe0h		;8e97
	call 043f6h		;8e9a   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld (0ca35h),hl		;8e9d   ; guarda las letras de la primera linea (banco 53) y el byte siguiente (16 bits)
	ld a,(0ca3bh)		;8ea0   ; lee el texto de la presentacion (0-10, p13:8E88)
	ld hl,08fcah		;8ea3
	call 043f6h		;8ea6   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld (0ca37h),hl		;8ea9   ; guarda el sitio de la segunda linea y el byte siguiente (16 bits)
	ld a,(0ca3bh)		;8eac   ; lee el texto de la presentacion (0-10, p13:8E88)
	ld hl,08ff6h		;8eaf
	call 043f6h		;8eb2   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld (0ca39h),hl		;8eb5   ; guarda las letras de la segunda linea (banco 53) y el byte siguiente (16 bits)
	ret			;8eb8
letra_linea_1:		; con el banco 53: la letra de 0xCA35 en el sitio 0xCA33 (p13:8EF4); con 0xFF, Z; si no, los dos avanzan y NZ
	ld de,(0ca33h)		;8eb9   ; lee el sitio de la primera linea del texto de la presentacion y el byte siguiente (16 bits)
	ld hl,(0ca35h)		;8ebd   ; lee las letras de la primera linea (banco 53) y el byte siguiente (16 bits)
	call 0417eh		;8ec0   ; bancos_53: pone el 53 en 0xA000 (con su copia en 0xC381-0xC383)
	call copia_letra		;8ec3   ; copia_letra: la letra HL (p13:8F0A) de la pagina 2, 8 x 8, a DE; D + su ancho (el byte siguiente)
	ld a,(hl)			;8ec6
	inc a			;8ec7   ; 0xFF: se acaba
	jp z,04179h		;8ec8   ; bancos_13_14: pone el 13 en 0x8000, el 14 en 0xA000 (con su copia en 0xC381-0xC383)
	inc hl			;8ecb
	ld (0ca35h),hl		;8ecc   ; guarda las letras de la primera linea (banco 53) y el byte siguiente (16 bits)
	ld (0ca33h),de		;8ecf   ; guarda el sitio de la primera linea del texto de la presentacion y el byte siguiente (16 bits)
	jp 04179h		;8ed3   ; bancos_13_14: pone el 13 en 0x8000, el 14 en 0xA000 (con su copia en 0xC381-0xC383)
letra_linea_2:		; con el banco 53: la letra de 0xCA39 (dos mitades, p13:8F22) en 0xCA37; con 0xFF, Z
	ld de,(0ca37h)		;8ed6   ; lee el sitio de la segunda linea y el byte siguiente (16 bits)
	ld hl,(0ca39h)		;8eda   ; lee las letras de la segunda linea (banco 53) y el byte siguiente (16 bits)
	call 0417eh		;8edd   ; bancos_53: pone el 53 en 0xA000 (con su copia en 0xC381-0xC383)
	call copia_letra_doble		;8ee0   ; copia_letra_doble: la letra de HL y la de debajo, 8 x 8 cada una, de la pagina 2 a DE y DE + 8 en Y
	ld a,(hl)			;8ee3
	inc a			;8ee4
	jp z,04179h		;8ee5   ; bancos_13_14: pone el 13 en 0x8000, el 14 en 0xA000 (con su copia en 0xC381-0xC383)
	ld (0ca39h),hl		;8ee8   ; guarda las letras de la segunda linea (banco 53) y el byte siguiente (16 bits)
	ld (0ca37h),de		;8eeb   ; guarda el sitio de la segunda linea y el byte siguiente (16 bits)
	jp 04179h		;8eef   ; bancos_13_14: pone el 13 en 0x8000, el 14 en 0xA000 (con su copia en 0xC381-0xC383)
sin_carry:
	xor a			;8ef2
	ret			;8ef3
copia_letra:		; la letra HL (p13:8F0A) de la pagina 2, 8 x 8, a DE; D + su ancho (el byte siguiente)
	push hl			;8ef4
	push de			;8ef5
	call sitio_de_letra		;8ef6   ; sitio_de_letra: desde Y = 0
	pop de			;8ef9
	push de			;8efa
	ld bc,00808h		;8efb   ; 8 x 8...
	ld a,002h		;8efe   ; ...de la pagina 2
	call 04767h		;8f00   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
	pop de			;8f03
	pop hl			;8f04
	inc hl			;8f05   ; su ancho
	ld a,(hl)			;8f06
	add a,d			;8f07
	ld d,a			;8f08
	ret			;8f09
sitio_de_letra:		; HL = el sitio de la letra (bits 5-7 * 8 en Y, 0x40 menos en el paso 0x21; bits 0-4 * 8 en X)
	ld a,(hl)			;8f0a
	and 0e0h		;8f0b
	rra			;8f0d
	rra			;8f0e
	ld d,a			;8f0f
	ld a,(0ca2ch)		;8f10   ; en el paso 0x21...
	cp 021h		;8f13
	ld a,d			;8f15
	jr nz,sitio_de_letra_x		;8f16
	sub 040h		;8f18   ; ...0x40 mas arriba
sitio_de_letra_x:
	ld e,a			;8f1a   ; la Y
	ld a,(hl)			;8f1b   ; los bits 0-4...
	add a,a			;8f1c
	add a,a			;8f1d   ; ...* 8...
	add a,a			;8f1e
	ld d,a			;8f1f   ; ...la X
	ex de,hl			;8f20
	ret			;8f21
copia_letra_doble:		; la letra de HL y la de debajo, 8 x 8 cada una, de la pagina 2 a DE y DE + 8 en Y
	push de			;8f22
	push hl			;8f23
	push de			;8f24
	call sitio_de_letra		;8f25   ; sitio_de_letra: desde Y = 0
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
	call sitio_de_letra		;8f3b   ; sitio_de_letra: desde Y = 0
	pop de			;8f3e
	push de			;8f3f
	ld bc,00808h		;8f40
	ld a,002h		;8f43
	call 04767h		;8f45   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
	pop de			;8f48
	pop hl			;8f49
	inc hl			;8f4a
	pop de			;8f4b
	ld a,(hl)			;8f4c   ; lo siguiente: 0xFF, nada...
	cp 0ffh		;8f4d
	jr z,suma_ancho_letra		;8f4f
	bit 7,a		;8f51   ; ...con el bit 7, su ancho...
	ld a,008h		;8f53   ; ...si no, 8
	jr z,suma_ancho_letra		;8f55
	ld a,(hl)			;8f57
	and 07fh		;8f58   ; el ancho de los bits 0-6
	inc hl			;8f5a
suma_ancho_letra:
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


marco_con_rejilla:		; en HL, un marco de 0x48 x 0x68 de color 6 con 8 rayas horizontales y 12 verticales cada 8 puntos
	push hl			;900c
	push de			;900d
	ld de,06848h		;900e   ; 0x48 x 0x68...
	ld c,006h		;9011   ; ...de color 6
	xor a			;9013
	call 046bch		;9014   ; marco: cuatro lineas: un marco de D x E desde HL
	pop de			;9017
	pop hl			;9018
	push hl			;9019
	ld b,008h		;901a   ; 8 horizontales
raya_horizontal:
	push bc			;901c
	ld a,l			;901d   ; 8 mas abajo
	add a,008h		;901e
	ld l,a			;9020
	push hl			;9021
	ld b,068h		;9022   ; 0x68 de largo
	ld c,006h		;9024
	ld a,000h		;9026
	call 0467ch		;9028   ; linea_horizontal: orden LINE del VDP (R#36-R#46) con el lado largo en X
	pop hl			;902b
	pop bc			;902c
	djnz raya_horizontal		;902d
	pop hl			;902f
	ld b,00ch		;9030   ; 12 verticales
raya_vertical:
	push bc			;9032
	ld a,h			;9033   ; 8 a la derecha
	add a,008h		;9034
	ld h,a			;9036
	push hl			;9037
	ld b,048h		;9038   ; 0x48 de largo
	ld c,006h		;903a
	ld a,000h		;903c
	call 04680h		;903e   ; linea_vertical: orden LINE del VDP con el lado largo en Y (ARG = 1)
	pop hl			;9041
	pop bc			;9042
	djnz raya_vertical		;9043
	ret			;9045
marco_de_ca30:		; un marco de 0x34 x 0x44 de color 6 en el sitio 0xCA30 de p13:905D
	ld a,(0ca30h)		;9046   ; lee la cuenta de cuadros de la figura o el dibujo de la presentacion
	add a,a			;9049
	ld hl,0905dh		;904a   ; los sitios de p13:905D
	call 0423eh		;904d   ; suma_a_hl: HL = HL + A
	ld a,(hl)			;9050
	inc hl			;9051
	ld l,(hl)			;9052
	ld h,a			;9053
	ld de,04434h		;9054   ; 0x34 x 0x44...
	ld c,006h		;9057   ; ...color 6
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


dibujo_de_ca30_b:		; el dibujo 0xCA30 de p13:908A [destino][origen], 0x30 x 0x40 de la pagina 1
	ld a,(0ca30h)		;906f   ; lee la cuenta de cuadros de la figura o el dibujo de la presentacion
	add a,a			;9072
	add a,a			;9073   ; * 4
	ld hl,0908ah		;9074
	call 0423eh		;9077   ; suma_a_hl: HL = HL + A
	ld e,(hl)			;907a   ; el destino...
	inc hl			;907b
	ld d,(hl)			;907c
	inc hl			;907d
	ld a,(hl)			;907e   ; ...y el origen
	inc hl			;907f
	ld h,(hl)			;9080
	ld l,a			;9081
	ld bc,04030h		;9082   ; 0x30 x 0x40
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


mueve_sprites_2_5:		; los sprites 2-5 movidos por el par (cuenta / 0x20 & 7) de p13:90E7 y los sprites 0-1 de p13:8CC8 o p13:8CDA por el bit 2 de la cuenta
	ld hl,(0ca2eh)		;90ae   ; lee la cuenta de cuadros del paso de la presentacion (16 bits)
	ld a,l			;90b1   ; la cuenta...
	and 0e0h		;90b2
	rra			;90b4   ; ...0-7 * 2
	rra			;90b5
	rra			;90b6
	rra			;90b7
	ld de,090e7h		;90b8   ; de p13:90E7
	call 04243h		;90bb   ; suma_a_de: DE = DE + A
	ld b,004h		;90be   ; 4 sprites
	ld hl,0dc08h		;90c0   ; desde el 2
mueve_sprite_2_5:		; la Y + el primero
	ld a,(de)			;90c3
	add a,(hl)			;90c4
	ld (hl),a			;90c5
	inc de			;90c6
	inc hl			;90c7
	ld a,(de)			;90c8   ; la X + el segundo
	add a,(hl)			;90c9
	ld (hl),a			;90ca
	dec de			;90cb   ; el mismo par
	inc hl			;90cc
	inc hl			;90cd
	inc hl			;90ce
	djnz mueve_sprite_2_5		;90cf
	ld de,0dc00h		;90d1   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	ld b,002h		;90d4   ; 2 sprites
	ld hl,0ca2eh		;90d6   ; apunta a la cuenta de cuadros del paso de la presentacion (16 bits)
	bit 2,(hl)		;90d9   ; por el bit 2...
	ld hl,08cc8h		;90db   ; ...p13:8CC8...
	jp nz,sprites_de_tabla		;90de   ; sprites_de_tabla: B sprites de HL [Y][X][patron] a DE (de 4 en 4)
	ld hl,08cdah		;90e1   ; ...o p13:8CDA
	jp sprites_de_tabla		;90e4   ; sprites_de_tabla: B sprites de HL [Y][X][patron] a DE (de 4 en 4)

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


a_negro_cada_4:		; cada 4 cuadros de la cuenta, p13:90FD
	ld a,(0ca2eh)		;90f7   ; lee la cuenta de cuadros del paso de la presentacion (16 bits)
	and 003h		;90fa
	ret nz			;90fc
paleta_a_negro:		; los 16 colores de la paleta de la VRAM (0xF680) uno menos en cada parte; NZ mientras quede alguno
	ld hl,0f680h		;90fd
	ld b,000h		;9100   ; 16 colores
	ld e,000h		;9102
color_a_negro:
	push hl			;9104
	push de			;9105
	push bc			;9106
	call color_uno_menos		;9107   ; color_uno_menos: el color B de la VRAM de HL uno menos (p13:911C, p13:912D) y puesto en la paleta
	ld a,e			;910a
	or d			;910b   ; alguno?
	pop bc			;910c
	pop de			;910d
	or e			;910e
	ld e,a			;910f
	pop hl			;9110
	inc hl			;9111   ; el siguiente (2 bytes)
	inc hl			;9112
	inc b			;9113
	ld a,b			;9114
	cp 010h		;9115
	jr nz,color_a_negro		;9117
	ld a,e			;9119
	and a			;911a
	ret			;911b
rojo_azul_menos:		; D = E con el rojo (nibble alto) y el azul (bajo) uno menos
	ld a,e			;911c
	and 0f0h		;911d
	jr z,rojo_menos		;911f
	sub 010h		;9121
rojo_menos:
	ld d,a			;9123
	ld a,e			;9124
	and 00fh		;9125
	jr z,azul_menos		;9127
	dec a			;9129
azul_menos:
	or d			;912a
	ld d,a			;912b
	ret			;912c
verde_menos:		; E = el verde uno menos
	ld a,e			;912d
	and 00fh		;912e
	jr z,pon_verde		;9130
	dec a			;9132
pon_verde:
	ld e,a			;9133
	ret			;9134
color_uno_menos:		; el color B de la VRAM de HL uno menos (p13:911C, p13:912D) y puesto en la paleta
	push bc			;9135
	xor a			;9136
	call 044b9h		;9137   ; rojo y azul
	ld e,a			;913a
	inc hl			;913b
	xor a			;913c
	call 044b9h		;913d   ; verde
	ld b,a			;9140
	call rojo_azul_menos		;9141   ; rojo_azul_menos: D = E con el rojo (nibble alto) y el azul (bajo) uno menos
	ld e,b			;9144
	call verde_menos		;9145   ; verde_menos: E = el verde uno menos
	pop bc			;9148
	push bc			;9149
	ld a,b			;914a
	push de			;914b
	call 04614h		;914c   ; a la paleta
	pop de			;914f
	pop bc			;9150
	ret			;9151
paleta_negra:		; en 0xE900, la paleta de 16 colores a negro ([n][0][0]) y 0xFF
	ld hl,0e900h		;9152   ; apunta a los caracteres de un dibujo pasados a 4 bits
	ld de,0e901h		;9155   ; 0x31 bytes
	ld bc,00030h		;9158
	ld (hl),000h		;915b
	ldir		;915d
	xor a			;915f
	ld b,010h		;9160
	ld hl,0e900h		;9162   ; apunta a los caracteres de un dibujo pasados a 4 bits
color_negro:
	ld (hl),a			;9165   ; el numero del color
	inc hl			;9166   ; los dos de color a 0
	inc hl			;9167
	inc hl			;9168
	inc a			;9169   ; el siguiente
	djnz color_negro		;916a
	ld (hl),0ffh		;916c   ; el final
	ret			;916e
paleta_hacia_cada_8:		; cada 8 cuadros de la cuenta, p13:9175
	ld a,(0ca2eh)		;916f   ; lee la cuenta de cuadros del paso de la presentacion (16 bits)
	and 007h		;9172
	ret nz			;9174
paleta_hacia:		; la paleta de 0xE900 un paso hacia la de DE (con A = 1, hacia el otro lado) y puesta; NZ mientras no sea igual
	ld a,000h		;9175
paleta_un_paso:
	ld (0ca2bh),a		;9177
	push de			;917a
	ld hl,0e901h		;917b
	ld b,010h		;917e   ; 16 colores
paso_de_color:		; el rojo
	push bc			;9180
	ld a,(de)			;9181
	and 0f0h		;9182
	ld b,a			;9184
	ld a,(hl)			;9185
	and 0f0h		;9186
	cp b			;9188
	jr z,color_azul		;9189
	push af			;918b
	ld a,(0ca2bh)		;918c
	and a			;918f   ; hacia arriba...
	ld b,010h		;9190
	jr z,suma_rojo		;9192
	ld b,0f0h		;9194   ; ...o abajo
suma_rojo:
	pop af			;9196
	add a,b			;9197
color_azul:
	ld c,a			;9198
	ld a,(de)			;9199   ; el azul
	and 00fh		;919a
	ld b,a			;919c
	ld a,(hl)			;919d
	and 00fh		;919e
	cp b			;91a0   ; igual?
	jr z,pon_rojo_azul		;91a1
	push af			;91a3
	ld a,(0ca2bh)		;91a4
	and a			;91a7
	ld b,001h		;91a8   ; + 1...
	jr z,suma_azul		;91aa
	ld b,0ffh		;91ac   ; ...o - 1
suma_azul:
	pop af			;91ae
	add a,b			;91af
pon_rojo_azul:
	or c			;91b0   ; con el rojo
	ld (hl),a			;91b1   ; guarda rojo y azul
	inc hl			;91b2
	inc de			;91b3
	ld a,(de)			;91b4   ; el verde
	and 00fh		;91b5
	ld b,a			;91b7
	ld a,(hl)			;91b8
	and 00fh		;91b9
	cp b			;91bb   ; igual?
	jr z,pon_verde_b		;91bc
	push af			;91be
	ld a,(0ca2bh)		;91bf
	and a			;91c2
	ld b,001h		;91c3   ; + 1...
	jr z,suma_verde		;91c5
	ld b,0ffh		;91c7   ; ...o - 1
suma_verde:
	pop af			;91c9
	add a,b			;91ca
pon_verde_b:
	ld (hl),a			;91cb   ; guarda el verde
	inc hl			;91cc   ; el siguiente
	inc hl			;91cd
	inc de			;91ce
	pop bc			;91cf
	djnz paso_de_color		;91d0   ; 16
	pop de			;91d2
	ld hl,0e901h		;91d3   ; compara...
	ld b,010h		;91d6   ; ...los 16
compara_paleta:		; igual?
	ld a,(de)			;91d8
	cp (hl)			;91d9   ; rojo y azul?
	jr nz,pon_paleta_e900		;91da
	inc de			;91dc
	inc hl			;91dd
	ld a,(de)			;91de
	cp (hl)			;91df   ; verde?
	jr nz,pon_paleta_e900		;91e0
	inc hl			;91e2   ; el siguiente
	inc hl			;91e3
	inc de			;91e4
	djnz compara_paleta		;91e5   ; 16
pon_paleta_e900:
	push af			;91e7
	ld hl,0e900h		;91e8   ; apunta a los caracteres de un dibujo pasados a 4 bits
	call 0463fh		;91eb   ; pon_paleta_con_espera: pone la paleta de HL (p00:4642) esperando al VDP antes
	pop af			;91ee
	ret			;91ef
paleta_9258:		; en 0xE900, la paleta de p13:9258 ([n][rojo-azul][verde]) y 0xFF
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
	ld (hl),a			;9206   ; el numero
	push af			;9207
	inc hl			;9208
	ld a,(de)			;9209   ; rojo y azul...
	ld (hl),a			;920a
	inc hl			;920b
	inc de			;920c
	ld a,(de)			;920d   ; ...y verde de p13:9258
	ld (hl),a			;920e
	inc de			;920f
	inc hl			;9210
	pop af			;9211
	inc a			;9212   ; el siguiente
	djnz L_9206		;9213
	ld (hl),0ffh		;9215   ; el final
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


pantalla_de_56:		; con el banco 56: la paleta de p56:AE95, R#7 = 0x0F, un rectangulo de 0x48 x 0xA8 a 0 en (0x40, 0x28) de la pagina 3, los caracteres de p56:AEE6, p56:AF4E y p56:AFB6 a la VRAM (0x800, 0x7000, 0xD800), las piezas de p56:AEA5 en (0x40, 0x40) y todo encendido; 0xCA12 = 0x3C, 0xCA13 = 0x31, 0xCA14 = 0
	call 045f1h		;92d1   ; apaga_pantalla_y_sprites: p00:45CC y p00:45F6
	call 0418eh		;92d4   ; bancos_56: pone el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	ld hl,0ae95h		;92d7   ; la paleta de p56:AE95
	call 0463fh		;92da   ; pon_paleta_con_espera: pone la paleta de HL (p00:4642) esperando al VDP antes
	ld b,00fh		;92dd   ; R#7 = 0x0F
	ld c,007h		;92df
	call 00047h		;92e1   ; BIOS WRTVDP - Writes data in the VDP-register
	ld hl,02840h		;92e4   ; en (0x40, 0x28)...
	ld bc,0a848h		;92e7   ; ...0x48 x 0xA8...
	xor a			;92ea
	ld d,003h		;92eb   ; ...de la pagina 3
	call 046ffh		;92ed   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
	ld hl,0aee6h		;92f0   ; 13 de p56:AEE6...
	ld de,00800h		;92f3   ; ...a 0x800
	ld bc,00d01h		;92f6
	call 0489ch		;92f9   ; caracteres_a_4_bits: B caracteres de un bit pasados a cuatro con el color C
	ld hl,0af4eh		;92fc   ; 13 de p56:AF4E...
	ld de,07000h		;92ff   ; ...a 0x7000
	ld bc,00d02h		;9302
	call 0489ch		;9305   ; caracteres_a_4_bits: B caracteres de un bit pasados a cuatro con el color C
	ld hl,0afb6h		;9308   ; 0x1A de p56:AFB6...
	ld de,0d800h		;930b   ; ...a 0xD800
	ld bc,01a03h		;930e
	call 0489ch		;9311   ; caracteres_a_4_bits: B caracteres de un bit pasados a cuatro con el color C
	ld de,04040h		;9314   ; en (0x40, 0x40)...
	ld hl,0aea5h		;9317   ; ...las piezas de p56:AEA5
	call piezas_de_lista		;931a   ; piezas_de_lista: las piezas de la lista HL en DE: cada byte una pieza (p00:49FB) y el caracter siguiente; 0xFE [x]: otra fila 8 mas abajo y X + x; 0xFF se acaba
	call 041efh		;931d   ; bancos_14: pone el 14 en 0xA000 (con su copia en 0xC381-0xC383)
	call 04606h		;9320   ; enciende_todo: la pantalla y los sprites encendidos
	ld hl,0ca12h		;9323   ; 0xCA12 = 0x3C...
	ld (hl),03ch		;9326
	inc hl			;9328   ; ...0xCA13 = 0x31...
	ld (hl),031h		;9329
	inc hl			;932b   ; ...0xCA14 = 0
	ld (hl),000h		;932c
	ret			;932e
pantalla_de_56_baja:		; cada 2 cuadros (0xCA12), 0xCA13 uno menos y el rectangulo de (0x40, 0x28) de 0xA8 x (0x31 - 0xCA13) copiado sobre si mismo en la pagina 3; al llegar a 0, 0xCA14 = 1
	ld hl,0ca12h		;932f
	dec (hl)			;9332
	ld a,(hl)			;9333
	and 001h		;9334   ; cada 2
	ret nz			;9336
	inc hl			;9337
	dec (hl)			;9338   ; uno menos
	jr nz,pantalla_56_rect		;9339
	ld a,001h		;933b   ; a 0...
	ld (0ca14h),a		;933d   ; ...0xCA14 = 1
	ret			;9340
pantalla_56_rect:		; 0x31 - 0xCA13 de alto
	ld a,031h		;9341
	sub (hl)			;9343
	ld c,a			;9344
	ld b,0a8h		;9345   ; 0xA8 de ancho
	ld hl,02840h		;9347
	ld d,h			;934a
	ld e,l			;934b
	ld a,003h		;934c   ; la pagina 3
	jp 04767h		;934e   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
piezas_de_lista:		; las piezas de la lista HL en DE: cada byte una pieza (p00:49FB) y el caracter siguiente; 0xFE [x]: otra fila 8 mas abajo y X + x; 0xFF se acaba
	push de			;9351
pieza_de_lista:
	ld a,(hl)			;9352
	inc hl			;9353
	ld c,a			;9354
	inc a			;9355   ; 0xFF: se acaba
	jr z,fin_de_piezas		;9356
	inc a			;9358   ; 0xFE...
	jr nz,pon_pieza_lista		;9359
	pop de			;935b
	ld a,(hl)			;935c   ; ...X + el siguiente...
	inc hl			;935d
	add a,d			;935e
	ld d,a			;935f
	ld a,008h		;9360   ; ...y 8 mas abajo
	add a,e			;9362
	ld e,a			;9363
	jr piezas_de_lista		;9364
pon_pieza_lista:
	ld a,c			;9366
	call 049fbh		;9367   ; pieza_de_3_a_3:
	call 04af9h		;936a   ; siguiente_caracter: avanza al siguiente caracter (PR2 p01:6937)
	jr pieza_de_lista		;936d
fin_de_piezas:
	pop de			;936f
	ret			;9370
fundido_1_empieza:		; el fundido 1 (a negro): 0xCADA = 1, la velocidad C en 0xCADB, 0xCADC = 0 y la paleta de HL (0x31 bytes) a 0xE900
	ld a,001h		;9371
	ld (0cadah),a		;9373   ; guarda el fundido de la paleta en curso (0 ninguno, 1 a negro, 2 desde negro, 3 a blanco; p13:9371)
	ld a,c			;9376   ; cada C cuadros
	ld (0cadbh),a		;9377   ; guarda la cuenta de cuadros del fundido de la paleta
	xor a			;937a
	ld (0cadch),a		;937b   ; guarda 0-2 con cada paso del fundido de la paleta
	ld de,0e900h		;937e   ; la paleta a 0xE900
	ld bc,00031h		;9381
	ldir		;9384
	ret			;9386
fundido_1:		; con el fundido 1, cada C cuadros cada color uno menos en las tres partes y la paleta puesta; al quedar todo a 0, 0xCADA = 0; 0xCADC de 0 a 2
	ld a,(0cadah)		;9387   ; lee el fundido de la paleta en curso (0 ninguno, 1 a negro, 2 desde negro, 3 a blanco; p13:9371)
	or a			;938a
	ret z			;938b   ; sin fundido, nada
	ld hl,0cadbh		;938c   ; apunta a la cuenta de cuadros del fundido de la paleta
	dec (hl)			;938f   ; aun no
	ret nz			;9390
	ld (hl),c			;9391   ; la cuenta de nuevo
	ld hl,0e900h		;9392   ; apunta a los caracteres de un dibujo pasados a 4 bits
	ld b,010h		;9395   ; 16 colores
color_menos:
	ld a,(hl)			;9397
	cp 0ffh		;9398   ; 0xFF: se acaba
	jr z,fundido_1_acaba		;939a
	inc hl			;939c
	push hl			;939d
	push bc			;939e
	call color_un_paso_menos		;939f   ; uno menos
	ld hl,0e900h		;93a2   ; la paleta
	call 0463fh		;93a5   ; pon_paleta_con_espera: pone la paleta de HL (p00:4642) esperando al VDP antes
	pop bc			;93a8
	pop hl			;93a9
	inc hl			;93aa   ; el siguiente (3 bytes)
	inc hl			;93ab
	djnz color_menos		;93ac
fundido_1_acaba:		; todo a 0?
	call todo_negro		;93ae   ; todo_negro: con todos los colores de 0xE900 a 0, 0xCADA = 0
	ld hl,0cadch		;93b1   ; apunta a 0-2 con cada paso del fundido de la paleta
	inc (hl)			;93b4
	ld a,(hl)			;93b5
	cp 003h		;93b6   ; 0-2
	ret c			;93b8
	ld (hl),000h		;93b9
	ret			;93bb
color_un_paso_menos:		; el rojo, el azul y el verde uno menos (si no estan a 0)
	call rojo_un_menos		;93bc   ; rojo_un_menos: el nibble alto uno menos
	call azul_un_menos		;93bf   ; azul_un_menos: el nibble bajo uno menos
	jr verde_un_menos		;93c2
rojo_un_menos:		; el nibble alto uno menos
	ld a,(hl)			;93c4
	and 0f0h		;93c5   ; el rojo a 0...
	ret z			;93c7   ; ...nada
	ld a,(hl)			;93c8
	sub 010h		;93c9   ; uno menos
	ld b,a			;93cb
	ld a,(hl)			;93cc
	and 00fh		;93cd   ; con el azul
	or b			;93cf
	ld (hl),a			;93d0
	ret			;93d1
azul_un_menos:		; el nibble bajo uno menos
	ld a,(hl)			;93d2
	and 00fh		;93d3   ; el azul a 0...
	ret z			;93d5   ; ...nada
	ld a,(hl)			;93d6
	dec a			;93d7   ; uno menos
	ld (hl),a			;93d8
	ret			;93d9
verde_un_menos:
	inc hl			;93da
	jr azul_un_menos		;93db
todo_negro:		; con todos los colores de 0xE900 a 0, 0xCADA = 0
	ld hl,0e900h		;93dd   ; apunta a los caracteres de un dibujo pasados a 4 bits
	ld b,011h		;93e0   ; hasta 0x11
color_negro_b:
	ld a,(hl)			;93e2
	cp 0ffh		;93e3
	jr z,fundido_acaba		;93e5
	inc hl			;93e7
	ld a,(hl)			;93e8   ; rojo y azul?
	or a			;93e9
	ret nz			;93ea
	inc hl			;93eb
	ld a,(hl)			;93ec   ; verde?
	or a			;93ed
	ret nz			;93ee
	inc hl			;93ef
	djnz color_negro_b		;93f0
fundido_acaba:
	xor a			;93f2
	ld (0cadah),a		;93f3   ; guarda el fundido de la paleta en curso (0 ninguno, 1 a negro, 2 desde negro, 3 a blanco; p13:9371)
	ret			;93f6
fundido_2_empieza:		; el fundido 2 (desde negro): 0xCADA = 2, la velocidad C, la paleta de HL a 0xE900 con los colores a 0
	ld a,002h		;93f7
	ld (0cadah),a		;93f9   ; guarda el fundido de la paleta en curso (0 ninguno, 1 a negro, 2 desde negro, 3 a blanco; p13:9371)
	ld a,c			;93fc
	ld (0cadbh),a		;93fd   ; guarda la cuenta de cuadros del fundido de la paleta
	xor a			;9400
	ld (0cadch),a		;9401   ; guarda 0-2 con cada paso del fundido de la paleta
	ld de,0e900h		;9404   ; apunta a los caracteres de un dibujo pasados a 4 bits
	ld bc,00031h		;9407
	ldir		;940a
	ld b,010h		;940c   ; 16 colores...
	xor a			;940e   ; ...a negro
	ld hl,0e900h		;940f   ; apunta a los caracteres de un dibujo pasados a 4 bits
color_a_0:
	inc hl			;9412
	ld (hl),a			;9413   ; rojo y azul a 0
	inc hl			;9414
	ld (hl),a			;9415   ; verde a 0
	inc hl			;9416
	djnz color_a_0		;9417   ; 16
	ret			;9419
fundido_2:		; con el fundido 2, cada C cuadros cada color de 0xE900 un paso hacia el de DE y la paleta puesta; al ser iguales, 0xCADA = 0
	ld a,(0cadah)		;941a   ; lee el fundido de la paleta en curso (0 ninguno, 1 a negro, 2 desde negro, 3 a blanco; p13:9371)
	cp 002h		;941d
	ret nz			;941f   ; sin el 2, nada
	ld hl,0cadbh		;9420   ; apunta a la cuenta de cuadros del fundido de la paleta
	dec (hl)			;9423   ; aun no
	ret nz			;9424
	ld (hl),c			;9425
	push de			;9426
	ld hl,0e900h		;9427   ; apunta a los caracteres de un dibujo pasados a 4 bits
	ld b,010h		;942a   ; 16 colores
color_hacia:
	ld a,(hl)			;942c
	cp 0ffh		;942d   ; 0xFF: se acaba
	jr z,fundido_2_acaba		;942f
	inc hl			;9431
	inc de			;9432
	push hl			;9433
	push de			;9434
	push bc			;9435
	call color_un_paso_hacia		;9436   ; un paso
	ld hl,0e900h		;9439   ; la paleta
	call 0463fh		;943c   ; pon_paleta_con_espera: pone la paleta de HL (p00:4642) esperando al VDP antes
	pop bc			;943f
	pop de			;9440
	pop hl			;9441
	inc hl			;9442
	inc hl			;9443
	inc de			;9444
	inc de			;9445
	djnz color_hacia		;9446
fundido_2_acaba:
	pop de			;9448
	call paleta_igual		;9449   ; igual?
	ld hl,0cadch		;944c   ; apunta a 0-2 con cada paso del fundido de la paleta
	inc (hl)			;944f
	ld a,(hl)			;9450
	cp 003h		;9451
	ret c			;9453
	ld (hl),000h		;9454
	ret			;9456
color_un_paso_hacia:		; el rojo, el azul y el verde un paso hacia los de DE
	call rojo_hacia		;9457   ; rojo_hacia: el nibble alto uno mas hasta el de DE
	call azul_hacia		;945a   ; azul_hacia: el nibble bajo uno mas hasta el de DE
	jr verde_hacia		;945d
rojo_hacia:		; el nibble alto uno mas hasta el de DE
	ld a,(de)			;945f   ; el rojo de DE
	and 0f0h		;9460
	ld b,a			;9462
	ld a,(hl)			;9463   ; el de HL
	and 0f0h		;9464
	cp b			;9466
	ret z			;9467   ; igual, nada
	add a,010h		;9468   ; uno mas...
	cp b			;946a
	jr c,pon_rojo_hacia		;946b
	ld a,b			;946d   ; ...sin pasarse
pon_rojo_hacia:
	ld b,a			;946e
	ld a,(hl)			;946f   ; con el azul
	and 00fh		;9470
	or b			;9472
	ld (hl),a			;9473   ; guarda
	ret			;9474
azul_hacia:		; el nibble bajo uno mas hasta el de DE
	ld a,(de)			;9475   ; el azul de DE
	and 00fh		;9476
	ld b,a			;9478
	ld a,(hl)			;9479   ; el de HL
	and 00fh		;947a
	cp b			;947c
	ret z			;947d   ; igual, nada
	inc a			;947e   ; uno mas...
	cp b			;947f
	jr c,pon_azul_hacia		;9480
	ld a,b			;9482   ; ...sin pasarse
pon_azul_hacia:
	ld b,a			;9483
	ld a,(hl)			;9484   ; con el rojo
	and 0f0h		;9485
	or b			;9487
	ld (hl),a			;9488   ; guarda
	ret			;9489
verde_hacia:
	inc hl			;948a
	inc de			;948b
	jr azul_hacia		;948c
paleta_igual:		; con 0xE900 igual a DE (hasta 0xFF), 0xCADA = 0
	ld hl,0e900h		;948e   ; apunta a los caracteres de un dibujo pasados a 4 bits
	ld b,031h		;9491
compara_color:
	ld a,(de)			;9493
	cp 0ffh		;9494   ; 0xFF: iguales
	jr z,paleta_igual_acaba		;9496
	cp (hl)			;9498   ; distinto: nada
	ret nz			;9499
	inc hl			;949a
	inc de			;949b
	djnz compara_color		;949c   ; hasta 0x31
paleta_igual_acaba:
	xor a			;949e
	ld (0cadah),a		;949f   ; guarda el fundido de la paleta en curso (0 ninguno, 1 a negro, 2 desde negro, 3 a blanco; p13:9371)
	ret			;94a2
fundido_3_empieza:		; el fundido 3 (a blanco): 0xCADA = 3, la velocidad C y la paleta de HL a 0xE900
	ld a,003h		;94a3
	ld (0cadah),a		;94a5   ; guarda el fundido de la paleta en curso (0 ninguno, 1 a negro, 2 desde negro, 3 a blanco; p13:9371)
	ld a,c			;94a8
	ld (0cadbh),a		;94a9   ; guarda la cuenta de cuadros del fundido de la paleta
	ld de,0e900h		;94ac   ; apunta a los caracteres de un dibujo pasados a 4 bits
	ld bc,00031h		;94af
	ldir		;94b2
	ret			;94b4
fundido_3:		; con el fundido 3, cada C cuadros cada color uno mas hasta 7 y la paleta puesta; con todo a 7, 0xCADA = 0
	ld a,(0cadah)		;94b5   ; lee el fundido de la paleta en curso (0 ninguno, 1 a negro, 2 desde negro, 3 a blanco; p13:9371)
	cp 003h		;94b8
	ret nz			;94ba   ; sin el 3, nada
	ld hl,0cadbh		;94bb   ; apunta a la cuenta de cuadros del fundido de la paleta
	dec (hl)			;94be
	ret nz			;94bf
	ld (hl),c			;94c0
	ld hl,0e900h		;94c1   ; apunta a los caracteres de un dibujo pasados a 4 bits
	ld b,010h		;94c4
color_mas:
	ld a,(hl)			;94c6
	cp 0ffh		;94c7
	jr z,fundido_3_acaba		;94c9
	inc hl			;94cb
	push hl			;94cc
	push bc			;94cd
	call color_un_paso_mas		;94ce   ; color_un_paso_mas: el rojo, el azul y el verde uno mas hasta 7
	ld hl,0e900h		;94d1   ; apunta a los caracteres de un dibujo pasados a 4 bits
	call 0463fh		;94d4   ; pon_paleta_con_espera: pone la paleta de HL (p00:4642) esperando al VDP antes
	pop bc			;94d7
	pop hl			;94d8
	inc hl			;94d9
	inc hl			;94da
	djnz color_mas		;94db
fundido_3_acaba:
	call todo_blanco		;94dd   ; todo_blanco: con todos los colores a 7, 0xCADA = 0
	ret			;94e0
color_un_paso_mas:		; el rojo, el azul y el verde uno mas hasta 7
	call rojo_un_mas		;94e1   ; rojo_un_mas:
	call azul_un_mas		;94e4   ; azul_un_mas:
	jr verde_un_mas		;94e7
rojo_un_mas:
	ld a,(hl)			;94e9
	and 0f0h		;94ea   ; el rojo
	cp 070h		;94ec   ; hasta 7
	ret z			;94ee
	ld a,(hl)			;94ef
	add a,010h		;94f0   ; uno mas
	ld b,a			;94f2
	ld a,(hl)			;94f3
	and 00fh		;94f4   ; con el azul
	or b			;94f6
	ld (hl),a			;94f7   ; guarda
	ret			;94f8
azul_un_mas:
	ld a,(hl)			;94f9
	and 00fh		;94fa
	cp 007h		;94fc   ; hasta 7
	ret z			;94fe
	ld a,(hl)			;94ff
	inc a			;9500
	ld (hl),a			;9501
	ret			;9502
verde_un_mas:
	inc hl			;9503
	jr azul_un_mas		;9504
todo_blanco:		; con todos los colores a 7, 0xCADA = 0
	ld hl,0e900h		;9506   ; apunta a los caracteres de un dibujo pasados a 4 bits
	ld b,011h		;9509
L_950B:
	ld a,(hl)			;950b
	cp 0ffh		;950c
	jr z,blanco_acaba		;950e
	inc hl			;9510
	ld a,(hl)			;9511
	cp 077h		;9512   ; 0x77?
	ret nz			;9514
	inc hl			;9515
	ld a,(hl)			;9516
	cp 007h		;9517   ; 7?
	ret nz			;9519
	inc hl			;951a
siguiente_blanco:
	djnz L_950B		;951b
blanco_acaba:
	xor a			;951d
	ld (0cadah),a		;951e   ; guarda el fundido de la paleta en curso (0 ninguno, 1 a negro, 2 desde negro, 3 a blanco; p13:9371)
	ret			;9521
dibujos_de_54:		; con el banco 54: los dibujos de p54:BF21 en 0x4000 y los de p54:BF8B en 0x6000 (colores de p54:BEA0)
	call 04183h		;9522   ; bancos_54: pone el 54 en 0xA000 (con su copia en 0xC381-0xC383)
	ld de,0bea0h		;9525   ; tabla_colores_BEA0: 24 punteros a colores de dibujo
	ld hl,0bf21h		;9528   ; lista_BF21: 21 fichas de dibujo de 5 bytes [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF
	call 04d52h		;952b   ; dibujos_en_4000: en la VRAM de 0x4000
	ld de,0bea0h		;952e   ; tabla_colores_BEA0: 24 punteros a colores de dibujo
	ld hl,0bf8bh		;9531   ; lista_BF8B: 13 fichas de dibujo de 5 bytes [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF
	call 04d56h		;9534   ; dibujos_en_6000: en la VRAM de 0x6000
	jp 04179h		;9537   ; bancos_13_14: pone el 13 en 0x8000, el 14 en 0xA000 (con su copia en 0xC381-0xC383)
dibujos_de_54_b:		; con el banco 54: los dibujos de p54:BFCD en 0x6000
	call 04183h		;953a   ; bancos_54: pone el 54 en 0xA000 (con su copia en 0xC381-0xC383)
	ld de,0bea0h		;953d   ; tabla_colores_BEA0: 24 punteros a colores de dibujo
	ld hl,0bfcdh		;9540   ; lista_BFCD: 3 fichas de dibujo de 5 bytes [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF
	call 04d56h		;9543   ; dibujos_en_6000: en la VRAM de 0x6000
	jp 04179h		;9546   ; bancos_13_14: pone el 13 en 0x8000, el 14 en 0xA000 (con su copia en 0xC381-0xC383)
rachas_de_54:		; con el banco 54: las rachas de p54:A188 (p00:4534)
	call 04183h		;9549   ; bancos_54: pone el 54 en 0xA000 (con su copia en 0xC381-0xC383)
	ld de,0a188h		;954c
	call 04534h		;954f   ; rachas_otro_destino: la orden 0x80 de las rachas: [pagina][VRAM lo hi] y sigue
	jp 04179h		;9552   ; bancos_13_14: pone el 13 en 0x8000, el 14 en 0xA000 (con su copia en 0xC381-0xC383)
estado_7_cada_cuadro:		; el estado 7: 0xD705 uno mas y el paso 0xD701 por la tabla de p13:955F (31)
	ld hl,0d705h		;9555   ; apunta a cuantas cosas hay en la pantalla de F2/F3; en el estado 7, los cuadros
	inc (hl)			;9558   ; los cuadros
	ld a,(0d701h)		;9559   ; el paso
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


est7_paso_0:		; R#0 = 6, el fundido 1 de la paleta de p13:9FC1 (cada cuadro), la orden 0xF6 al sonido y el paso siguiente
	ld bc,00600h		;959d
	call 00047h		;95a0   ; BIOS WRTVDP - Writes data in the VDP-register
	ld c,001h		;95a3   ; cada cuadro
	ld hl,09fc1h		;95a5   ; la paleta de p13:9FC1
	call fundido_1_empieza		;95a8   ; fundido_1_empieza: el fundido 1 (a negro): 0xCADA = 1, la velocidad C en 0xCADB, 0xCADC = 0 y la paleta de HL (0x31 bytes) a 0xE900
	call 06be8h		;95ab   ; orden_sonido_f6: la orden 0xF6 al sonido
	jr est7_siguiente		;95ae
est7_paso_1:		; el fundido 1; al acabar, la cuenta 0xD713 = 0x1A4, todo apagado, la pagina 0 a la vista, las paginas 0-2 borradas, sin sprites y el paso siguiente
	ld c,001h		;95b0
	call fundido_1		;95b2   ; fundido_1: con el fundido 1, cada C cuadros cada color uno menos en las tres partes y la paleta puesta; al quedar todo a 0, 0xCADA = 0; 0xCADC de 0 a 2
	ld a,(0cadah)		;95b5   ; aun no
	or a			;95b8
	ret nz			;95b9
	ld hl,001a4h		;95ba   ; 0x1A4 cuadros
	ld (0d713h),hl		;95bd   ; en 0xD713
	call 045f1h		;95c0   ; apaga_pantalla_y_sprites: p00:45CC y p00:45F6
	xor a			;95c3
	ld hl,0ca42h		;95c4   ; la pagina 0...
	ld (hl),a			;95c7
	call 04879h		;95c8   ; ...a la vista
	call borra_paginas_0_2		;95cb   ; las paginas 0-2 borradas
	call 04266h		;95ce   ; esconde_sprites_ram: llena 0xDC00-0xDC7F con 0xE0
	call 045d7h		;95d1   ; esconde_sprites_vram: llena con 0xE0 128 bytes de la VRAM en 0xF600 y otros 128 en 0xF200
	jr est7_siguiente		;95d4
est7_paso_2:		; la cuenta 0xD713 (a 0xB4, el sonido 0x98); al acabar: todo apagado, los rectangulos de 0x77 (p13:962E), la paleta de p13:9FF2, todo encendido, las letras de p58:B093, los dibujos de p52:8114, los de p54 (p13:9522), el mosaico de p54:BB4A, las rachas de p54:A188, 0xD703 = 6, 0xD70B = 1, 0xD70C = 0 y el paso siguiente
	call sonido_a_b4		;95d6   ; sonido_a_b4: con la cuenta 0xD713 en 0xB4, el sonido 0x98
	ld hl,(0d713h)		;95d9   ; la cuenta
	dec hl			;95dc
	ld (0d713h),hl		;95dd   ; guarda en el estado 7, la cuenta del paso 2 (0x1A4) y el byte siguiente (16 bits)
	ld a,h			;95e0
	or l			;95e1
	ret nz			;95e2   ; aun no
	call 045f1h		;95e3   ; apaga_pantalla_y_sprites: p00:45CC y p00:45F6
	call rectangulos_77		;95e6   ; los rectangulos
	ld hl,09ff2h		;95e9   ; la paleta de p13:9FF2
	call 0463fh		;95ec   ; pon_paleta_con_espera: pone la paleta de HL (p00:4642) esperando al VDP antes
	call 04606h		;95ef   ; enciende_todo: la pantalla y los sprites encendidos
	call 06f07h		;95f2   ; letras_b093: 0x26 letras de p58:B093 en 4 bits, con el color 5, a la VRAM de 0x0080
	call 06f19h		;95f5   ; dibujos_8114_en_e000: los dibujos de p52:8114 en la VRAM de 0xE000
	call dibujos_de_54		;95f8   ; dibujos_de_54: con el banco 54: los dibujos de p54:BF21 en 0x4000 y los de p54:BF8B en 0x6000 (colores de p54:BEA0)
	call 0715eh		;95fb   ; mosaico_bb4a: el mosaico en rachas de p54:BB4A (0x0B x 0x10) en X = 0x40, Y = 0x41
	call rachas_de_54		;95fe   ; rachas_de_54: con el banco 54: las rachas de p54:A188 (p00:4534)
	ld hl,0d703h		;9601   ; 0xD703 = 6 (la cuenta de los pasos)
	ld (hl),006h		;9604
	ld hl,0d70bh		;9606   ; 0xD70B = 1...
	ld (hl),001h		;9609
	inc l			;960b
	ld (hl),000h		;960c   ; ...0xD70C = 0
est7_siguiente:		; 0xD701 uno mas
	ld hl,0d701h		;960e   ; apunta a 1 con la pantalla de F2/F3 ya montada (cada cuadro, p10:AED6); en el estado 7, su paso (p13:9555)
	inc (hl)			;9611
	ret			;9612
sonido_a_b4:		; con la cuenta 0xD713 en 0xB4, el sonido 0x98
	ld hl,(0d713h)		;9613   ; lee en el estado 7, la cuenta del paso 2 (0x1A4) y el byte siguiente (16 bits)
	ld de,000b4h		;9616
	and a			;9619
	sbc hl,de		;961a
	jp z,06cb2h		;961c   ; sonido_98: pide el sonido 0x98 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ret			;961f
borra_paginas_0_2:		; las paginas 2, 1 y 0 a 0
	ld a,002h		;9620
	call 0444ah		;9622   ; borra_pagina_0_negro: la pagina D entera a 0 desde (0, 0)
borra_paginas_0_1:
	ld a,001h		;9625
	call 0444ah		;9627   ; borra_pagina_0_negro: la pagina D entera a 0 desde (0, 0)
borra_pagina_0_b:
	xor a			;962a
	jp 0444ah		;962b   ; borra_pagina_0_negro: la pagina D entera a 0 desde (0, 0)
rectangulos_77:		; en las paginas 0 y 1, un rectangulo de 0x58 x 0x80 del color 0x77 en (0x40, 0x40)
	xor a			;962e
	call rectangulo_77_a		;962f   ; rectangulo_77_a: en (0x40, 0x40)...
rectangulo_77_1:
	ld a,001h		;9632
rectangulo_77_a:		; en (0x40, 0x40)...
	ld hl,04040h		;9634
	ld bc,08058h		;9637   ; ...0x58 x 0x80...
	ld d,a			;963a
	ld a,077h		;963b   ; ...color 0x77
	jp 046ffh		;963d   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
est7_paso_3:		; p13:9EC8, p13:9DA7 y p13:9D0D; cada 4 cuadros (0xD703): R#23 = 0xD706, las dos lineas de p13:9674 y p13:9685 y 0xD706 uno mas; a 0x58, el paso siguiente
	call sprites_9f85		;9640   ; sprites_9f85: 10 sprites de p13:9F85 o p13:9FA3 (cada 4 cuadros) desde el 0 (el puntero en 0xD707) y sus colores a 0x0F
	call particulas		;9643   ; particulas: las 22 fichas de 0x10 bytes de 0xCB00 (usadas aqui para otra cosa): una nueva (p13:9E3B), se mueven (p13:9DB1) y sus sprites (p13:9DFB)
	call piezas_que_cambian		;9646   ; piezas_que_cambian: las piezas que cambian cada 16 cuadros segun 0xD706 (p13:9D18, 9D3A, 9D5D, 9D85)
	ld hl,0d703h		;9649   ; la cuenta de 0xD703
	dec (hl)			;964c
	ret nz			;964d
	ld (hl),004h		;964e   ; cada 4
	call r23_de_d706		;9650   ; r23_de_d706: R#23 (el desplazamiento vertical) = 0xD706, tras esperar al VDP
	call linea_de_d706		;9653   ; linea_de_d706: la linea 0x40 + 0xD706 de la pagina 1 (desde (0, 0x40)) con YMMM
	call linea_de_d706_b		;9656   ; linea_de_d706_b: la linea 0x40 + (0xD706, o 0xD706 - 0x58) a la 0x98 + 0xD706 de la pagina 1 con YMMM
	ld hl,0d706h		;9659   ; 0xD706 uno mas
	inc (hl)			;965c
	ld a,(hl)			;965d
	cp 058h		;965e   ; hasta 0x58
	ret c			;9660
	ld hl,0d703h		;9661   ; 0xD703 = 0
	ld (hl),000h		;9664
	jr est7_siguiente		;9666
r23_de_d706:		; R#23 (el desplazamiento vertical) = 0xD706, tras esperar al VDP
	call 04650h		;9668   ; espera_vdp: espera a que el VDP acabe la orden en curso (S#2 bit 0)
	ld a,(0d706h)		;966b   ; 0xD706
	ld b,a			;966e
	ld c,017h		;966f   ; R#23
	jp 00047h		;9671   ; BIOS WRTVDP - Writes data in the VDP-register
linea_de_d706:		; la linea 0x40 + 0xD706 de la pagina 1 (desde (0, 0x40)) con YMMM
	ld a,040h		;9674
	ld hl,0d706h		;9676   ; 0x40 + 0xD706
	add a,(hl)			;9679
	ld e,a			;967a
	ld hl,04000h		;967b
	ld d,001h		;967e
	ld a,001h		;9680
	jp 047abh		;9682   ; copia_en_y: orden YMMM del VDP
linea_de_d706_b:		; la linea 0x40 + (0xD706, o 0xD706 - 0x58) a la 0x98 + 0xD706 de la pagina 1 con YMMM
	ld hl,0d706h		;9685   ; apunta a 1 al salir de F2/F3 (p10:B897); en el estado 7, el desplazamiento, el color o el numero de mensaje
	ld e,(hl)			;9688   ; 0xD706
	ld a,e			;9689
	ld b,e			;968a
	cp 058h		;968b   ; pasado 0x58...
	jr c,linea_de_d706_c		;968d
	sub 058h		;968f   ; ...0x58 menos
	ld b,a			;9691
linea_de_d706_c:
	ld a,040h		;9692
	add a,b			;9694
	ld l,a			;9695
	ld h,040h		;9696
	ld d,001h		;9698
	ld a,098h		;969a   ; a 0x98 + 0xD706
	add a,e			;969c
	ld e,a			;969d
	ld a,001h		;969e
	jp 047abh		;96a0   ; copia_en_y: orden YMMM del VDP
est7_paso_4:		; p13:9EC8, p13:9DA7 y p13:9D0D; a los 2 cuadros, el rectangulo de 0x77 en la pagina 1 y el paso siguiente
	call sprites_9f85		;96a3   ; sprites_9f85: 10 sprites de p13:9F85 o p13:9FA3 (cada 4 cuadros) desde el 0 (el puntero en 0xD707) y sus colores a 0x0F
	call particulas		;96a6   ; particulas: las 22 fichas de 0x10 bytes de 0xCB00 (usadas aqui para otra cosa): una nueva (p13:9E3B), se mueven (p13:9DB1) y sus sprites (p13:9DFB)
	call piezas_que_cambian		;96a9   ; piezas_que_cambian: las piezas que cambian cada 16 cuadros segun 0xD706 (p13:9D18, 9D3A, 9D5D, 9D85)
	ld hl,0d703h		;96ac   ; la cuenta de 0xD703
	dec (hl)			;96af
	ret nz			;96b0
	ld (hl),002h		;96b1
	call rectangulo_77_1		;96b3   ; rectangulo_77_1:
	jp est7_siguiente		;96b6   ; est7_siguiente: 0xD701 uno mas
est7_paso_5:		; lo mismo que el 3 cada 2 cuadros; en 0x84 la orden 0xF6 al sonido; a 0xB0, 0xD703 = 0x40 y el paso siguiente
	call sprites_9f85		;96b9   ; sprites_9f85: 10 sprites de p13:9F85 o p13:9FA3 (cada 4 cuadros) desde el 0 (el puntero en 0xD707) y sus colores a 0x0F
	call particulas		;96bc   ; particulas: las 22 fichas de 0x10 bytes de 0xCB00 (usadas aqui para otra cosa): una nueva (p13:9E3B), se mueven (p13:9DB1) y sus sprites (p13:9DFB)
	call piezas_que_cambian		;96bf   ; piezas_que_cambian: las piezas que cambian cada 16 cuadros segun 0xD706 (p13:9D18, 9D3A, 9D5D, 9D85)
	ld hl,0d703h		;96c2   ; la cuenta de 0xD703
	dec (hl)			;96c5
	ret nz			;96c6
	ld (hl),002h		;96c7
	call r23_de_d706		;96c9   ; r23_de_d706: R#23 (el desplazamiento vertical) = 0xD706, tras esperar al VDP
	call linea_de_d706		;96cc   ; linea_de_d706: la linea 0x40 + 0xD706 de la pagina 1 (desde (0, 0x40)) con YMMM
	call linea_de_d706_b		;96cf   ; linea_de_d706_b: la linea 0x40 + (0xD706, o 0xD706 - 0x58) a la 0x98 + 0xD706 de la pagina 1 con YMMM
	ld hl,0d706h		;96d2   ; 0xD706 uno mas
	inc (hl)			;96d5
	ld a,(hl)			;96d6
	cp 084h		;96d7   ; en 0x84, el sonido
	jp z,06be8h		;96d9   ; orden_sonido_f6: la orden 0xF6 al sonido
	cp 0b0h		;96dc   ; hasta 0xB0
	ret c			;96de
	ld hl,0d703h		;96df   ; 0xD703 = 0x40
	ld (hl),040h		;96e2
	jp est7_siguiente		;96e4   ; est7_siguiente: 0xD701 uno mas
est7_paso_6:		; p13:9DA7; a los 0x40 cuadros, 0xD703 = 8, 0xD706 = 7 y el paso siguiente
	call particulas		;96e7   ; particulas: las 22 fichas de 0x10 bytes de 0xCB00 (usadas aqui para otra cosa): una nueva (p13:9E3B), se mueven (p13:9DB1) y sus sprites (p13:9DFB)
	ld hl,0d703h		;96ea   ; la cuenta de 0xD703
	dec (hl)			;96ed
	ret nz			;96ee
	ld (hl),008h		;96ef
	ld hl,0d706h		;96f1   ; 0xD706 = 7
	ld (hl),007h		;96f4
	jp est7_siguiente		;96f6   ; est7_siguiente: 0xD701 uno mas
est7_paso_7:		; cada 6 cuadros 0xD706 uno menos y el color 7 = (n, n, n) (p13:9708); a 0, el paso siguiente
	ld hl,0d703h		;96f9   ; apunta a la fila del cursor en F2/F3; en el estado 7, la cuenta de cuadros del paso
	dec (hl)			;96fc   ; la cuenta
	ret nz			;96fd
	ld (hl),006h		;96fe   ; 6 cuadros
	ld hl,0d706h		;9700   ; apunta a 1 al salir de F2/F3 (p10:B897); en el estado 7, el desplazamiento, el color o el numero de mensaje
	dec (hl)			;9703   ; uno menos
	ld a,(hl)			;9704
	call z,est7_siguiente		;9705   ; a 0, el siguiente
color_7_gris:		; el color 7 de la paleta con rojo, azul y verde = A
	ld e,a			;9708
	ld d,a			;9709
	rlca			;970a   ; en los dos nibbles
	rlca			;970b
	rlca			;970c
	rlca			;970d
	or d			;970e
	ld d,a			;970f
	ld a,007h		;9710   ; el color 7
	jp 04614h		;9712   ; pon_color: el color A de la paleta = D (rojo y azul), E (verde)
est7_paso_8:		; todo apagado, la pagina 0 borrada, R#23 = 0, sin sprites, la paleta de p13:A01D, el mosaico de p54:BBD5, todo encendido, el sonido 0xA3, 0xD709 = 0xC0, 0x80 cuadros
	call 045f1h		;9715   ; apaga_pantalla_y_sprites: p00:45CC y p00:45F6
	call borra_pagina_0_b		;9718   ; borra_pagina_0_b:
	ld b,000h		;971b   ; R#23 = 0
	ld c,017h		;971d
	call 00047h		;971f   ; BIOS WRTVDP - Writes data in the VDP-register
	call 04266h		;9722   ; esconde_sprites_ram: llena 0xDC00-0xDC7F con 0xE0
	ld hl,0a01dh		;9725   ; la paleta de p13:A01D
	call 0463fh		;9728   ; pon_paleta_con_espera: pone la paleta de HL (p00:4642) esperando al VDP antes
	call 07190h		;972b   ; mosaico_bbd5: el mosaico de p54:BBD5 (0x0C x 0x10) en X = 0x40, Y = 0x38
	call 04606h		;972e   ; enciende_todo: la pantalla y los sprites encendidos
	call 06bc0h		;9731   ; sonido_a3: pide el sonido 0xA3 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld a,0c0h		;9734   ; 0xD709 = 0xC0
	ld (0d709h),a		;9736   ; guarda en el estado 7, lo que baja de 0xC0 a 0x80 (p13:974E)
	ld hl,0d703h		;9739   ; 0x80 cuadros
	ld (hl),080h		;973c
	jp est7_siguiente		;973e   ; est7_siguiente: 0xD701 uno mas
est7_paso_9:		; p13:9F4C; a los 0x80 cuadros, 4 y el paso siguiente
	call sprites_8770		;9741   ; sprites_8770: los sprites 2-3 en (0x87, 0x70) con el patron 0x98 o 0xA0 cada 4 cuadros y sus colores a 7
	ld hl,0d703h		;9744   ; apunta a la fila del cursor en F2/F3; en el estado 7, la cuenta de cuadros del paso
	dec (hl)			;9747
	ret nz			;9748
	ld (hl),004h		;9749
	jp est7_siguiente		;974b   ; est7_siguiente: 0xD701 uno mas
est7_paso_10:		; p13:9EFD y p13:9F4C; cada 4 cuadros 0xD709 uno menos; por debajo de 0x80, 0xD70A = 0 y el paso siguiente
	call sprites_de_d709		;974e   ; sprites_de_d709: los sprites 0-1 de color 0x0F en (0x68, 0xD709) y 0x10 a la derecha, el patron 0x50 o 0x58 cada 4 cuadros
	call sprites_8770		;9751   ; sprites_8770: los sprites 2-3 en (0x87, 0x70) con el patron 0x98 o 0xA0 cada 4 cuadros y sus colores a 7
	ld hl,0d703h		;9754   ; apunta a la fila del cursor en F2/F3; en el estado 7, la cuenta de cuadros del paso
	dec (hl)			;9757
	ret nz			;9758
	ld (hl),004h		;9759
	ld hl,0d709h		;975b   ; 0xD709...
	dec (hl)			;975e   ; ...uno menos
	ld a,(hl)			;975f
	cp 080h		;9760   ; hasta 0x80
	ret nc			;9762
	ld hl,0d70ah		;9763   ; 0xD70A = 0
	ld (hl),000h		;9766
	jp est7_siguiente		;9768   ; est7_siguiente: 0xD701 uno mas
est7_paso_11:		; p13:9F29 y p13:9F4C; cada 6 cuadros (0x12 desde el 6 de 0xD70A), 0xD70A por p13:9799 y, por debajo de 6, 0xD709 uno menos; desde 9, 0xD70A = 9 y el paso siguiente
	call sprites_de_d70a		;976b   ; sprites_de_d70a: los sprites 0-1 de color 0x0F en (0x68, 0xD709) con el patron de 0xD70A (p13:9F6B) y el siguiente + 4
	call sprites_8770		;976e   ; sprites_8770: los sprites 2-3 en (0x87, 0x70) con el patron 0x98 o 0xA0 cada 4 cuadros y sus colores a 7
	ld hl,0d703h		;9771   ; apunta a la fila del cursor en F2/F3; en el estado 7, la cuenta de cuadros del paso
	dec (hl)			;9774
	ret nz			;9775
	ld a,(0d70ah)		;9776   ; desde 6...
	cp 006h		;9779
	ld a,012h		;977b   ; ...0x12 cuadros...
	jr nc,est7_11_d70a		;977d
	ld a,006h		;977f   ; ...si no, 6
est7_11_d70a:
	ld (hl),a			;9781
	call d70a_de_d709		;9782   ; d70a_de_d709: C = el escalon de 0xD709 (p13:97A9); por debajo de 6, 0xD70A = C; desde 6, 0xD70A uno mas
	ld a,c			;9785
	cp 006h		;9786   ; por debajo de 6...
	jr nc,est7_11_hasta_9		;9788
	ld hl,0d709h		;978a   ; ...0xD709 uno menos
	dec (hl)			;978d
est7_11_hasta_9:		; hasta 9
	cp 009h		;978e
	ret c			;9790
	ld hl,0d70ah		;9791   ; apunta a 0-1: la opcion de la cosa 7 en F2 (p10:B8F8); en el estado 7, de 0 a 9 por 0xD709 (p13:9799)
	ld (hl),009h		;9794
	jp est7_siguiente		;9796   ; est7_siguiente: 0xD701 uno mas
d70a_de_d709:		; C = el escalon de 0xD709 (p13:97A9); por debajo de 6, 0xD70A = C; desde 6, 0xD70A uno mas
	call escalon_de_d709		;9799   ; escalon_de_d709: C = 0 desde 0x7C, 1 desde 0x78, 2 desde 0x74, 3 desde 0x70, 4 desde 0x6E, 5 desde 0x6C, 6 por debajo
	ld hl,0d70ah		;979c   ; apunta a 0-1: la opcion de la cosa 7 en F2 (p10:B8F8); en el estado 7, de 0 a 9 por 0xD709 (p13:9799)
	ld a,c			;979f
	cp 006h		;97a0
	jr nc,d70a_mas		;97a2
	ld (hl),c			;97a4
	ret			;97a5
d70a_mas:
	inc (hl)			;97a6
	ld c,(hl)			;97a7
	ret			;97a8
escalon_de_d709:		; C = 0 desde 0x7C, 1 desde 0x78, 2 desde 0x74, 3 desde 0x70, 4 desde 0x6E, 5 desde 0x6C, 6 por debajo
	ld a,(0d709h)		;97a9   ; C = 1 desde 0x78, 2 desde 0x74, 3 desde 0x70, 4 desde 0x6E, 5 desde 0x6C, 6 por debajo; desde 0x7C, C se queda
	cp 07ch		;97ac   ; desde 0x7C, nada
	ret nc			;97ae
	ld c,001h		;97af   ; 1...
	cp 078h		;97b1   ; ...desde 0x78
	ret nc			;97b3
	inc c			;97b4
	cp 074h		;97b5   ; desde 0x74, 2
	ret nc			;97b7
	inc c			;97b8
	cp 070h		;97b9   ; desde 0x70, 3
	ret nc			;97bb
	inc c			;97bc
	cp 06eh		;97bd   ; desde 0x6E, 4
	ret nc			;97bf
	inc c			;97c0
	cp 06ch		;97c1   ; desde 0x6C, 5
	ret nc			;97c3
	inc c			;97c4   ; si no, 6
	ret			;97c5
est7_paso_12:		; 0x80 cuadros y el paso siguiente
	ld hl,0d703h		;97c6   ; apunta a la fila del cursor en F2/F3; en el estado 7, la cuenta de cuadros del paso
	ld (hl),080h		;97c9
	jp est7_siguiente		;97cb   ; est7_siguiente: 0xD701 uno mas
est7_paso_13:		; p13:9F29 y p13:9F4C durante 0x80 cuadros
	call sprites_de_d70a		;97ce   ; sprites_de_d70a: los sprites 0-1 de color 0x0F en (0x68, 0xD709) con el patron de 0xD70A (p13:9F6B) y el siguiente + 4
	call sprites_8770		;97d1   ; sprites_8770: los sprites 2-3 en (0x87, 0x70) con el patron 0x98 o 0xA0 cada 4 cuadros y sus colores a 7
	ld hl,0d703h		;97d4   ; apunta a la fila del cursor en F2/F3; en el estado 7, la cuenta de cuadros del paso
	dec (hl)			;97d7
	ret nz			;97d8
	ld (hl),080h		;97d9
	jp est7_siguiente		;97db   ; est7_siguiente: 0xD701 uno mas
est7_paso_14:		; p13:9F4C; a los 0x80 cuadros: sin sprites, 0xD706 = 0, (0x38, 0x40) de 0x60 x 0x80 copiado a (0, 0) de la pagina 2, (0x60, 0) de 0xA0 x 0x90 a 0 en la pagina 2, 0xD70F-0xD710 = 0, el mosaico de p57:AA98 (y en 0xD711)
	call sprites_8770		;97de   ; sprites_8770: los sprites 2-3 en (0x87, 0x70) con el patron 0x98 o 0xA0 cada 4 cuadros y sus colores a 7
	ld hl,0d703h		;97e1   ; apunta a la fila del cursor en F2/F3; en el estado 7, la cuenta de cuadros del paso
	dec (hl)			;97e4
	ret nz			;97e5
	call 04266h		;97e6   ; esconde_sprites_ram: llena 0xDC00-0xDC7F con 0xE0
	ld hl,0d706h		;97e9   ; apunta a 1 al salir de F2/F3 (p10:B897); en el estado 7, el desplazamiento, el color o el numero de mensaje
	ld (hl),000h		;97ec
	ld hl,04038h		;97ee   ; de (0x38, 0x40)...
	ld de,00000h		;97f1   ; ...a (0, 0)...
	ld bc,08060h		;97f4   ; ...0x60 x 0x80...
	ld a,008h		;97f7   ; ...a la pagina 2
	call 04767h		;97f9   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
	ld hl,00060h		;97fc   ; (0x60, 0) de la pagina 2...
	ld d,002h		;97ff
	ld bc,090a0h		;9801   ; ...0xA0 x 0x90 a 0
	xor a			;9804
	call 046ffh		;9805   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
	xor a			;9808
	ld hl,0d70fh		;9809   ; apunta a en el estado 7, la cuenta de 16 del mosaico que sube (p13:981F)
	ld (hl),a			;980c
	inc l			;980d
	ld (hl),a			;980e
	inc l			;980f
	ld de,0aa98h		;9810   ; el mosaico de p57:AA98
	ld (hl),e			;9813
	inc l			;9814
	ld (hl),d			;9815
	ld hl,0aa98h		;9816
	call 06460h		;9819   ; mosaico_de_57: el mosaico de HL del banco 57-58 en X = 0, Y = 0xF0, 1 fila de 0x12, forma 0x0B
	jp est7_siguiente		;981c   ; est7_siguiente: 0xD701 uno mas
est7_paso_15:		; cada 16 cuadros el mosaico siguiente (p13:9871); cada cuadro, la otra pagina: (0x38, 0x38) de 0x60 x 0x90 a 0, el dibujo de (0, 0) de la pagina 2 encima, el de (0x90 + 0xD70F, 0) con la operacion 0x88 y esa pagina a la vista
	ld hl,0d70fh		;981f   ; apunta a en el estado 7, la cuenta de 16 del mosaico que sube (p13:981F)
	inc (hl)			;9822   ; la cuenta...
	ld a,(hl)			;9823
	and 00fh		;9824   ; ...cada 16
	call z,mosaico_que_sube		;9826   ; mosaico_que_sube: la cuenta a 0, (0xA0, 0) de 0x60 x 0x90 a (0x90, 0) de la pagina 2 y el mosaico 0x12 mas alla de p57; con su byte a 0, 0xD703 = 0xFF, los dibujos de p54:BFCD y el paso siguiente
	ld a,(0d710h)		;9829   ; la otra pagina
	xor 001h		;982c
	ld (0d710h),a		;982e   ; guarda la lista de las cosas de la pantalla de F2/F3 (0x23 sitios, p10:B099); en el estado 7, la pagina a la vista (0/1)
	ld hl,03838h		;9831   ; (0x38, 0x38)...
	ld bc,09060h		;9834   ; ...0x60 x 0x90 a 0
	ld d,a			;9837
	push af			;9838
	xor a			;9839
	call 046ffh		;983a   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
	pop af			;983d
	ld hl,00000h		;983e   ; de (0, 0)...
	ld de,04038h		;9841   ; ...a (0x38, 0x40)...
	ld bc,08060h		;9844   ; ...0x60 x 0x80
	rlca			;9847
	rlca			;9848
	or 002h		;9849   ; desde la pagina 2
	call 04767h		;984b   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
	ld hl,00090h		;984e   ; de (0x90 + la cuenta, 0)...
	ld a,(0d70fh)		;9851   ; lee en el estado 7, la cuenta de 16 del mosaico que sube (p13:981F)
	add a,l			;9854
	ld l,a			;9855
	ld de,03838h		;9856   ; ...a (0x38, 0x38)
	ld a,(0d710h)		;9859   ; lee la lista de las cosas de la pantalla de F2/F3 (0x23 sitios, p10:B099); en el estado 7, la pagina a la vista (0/1)
	rlca			;985c
	rlca			;985d
	rlca			;985e
	rlca			;985f
	or 088h		;9860   ; con la operacion 0x88
	ld bc,09060h		;9862
	call 047edh		;9865   ; copia_rectangulo_logica: orden LMMM del VDP con la operacion logica de A
	call 04650h		;9868   ; espera_vdp: espera a que el VDP acabe la orden en curso (S#2 bit 0)
	ld a,(0d710h)		;986b   ; a la vista
	jp 04879h		;986e   ; pon_pagina_visible: la pagina A a la vista (0xFAF5, DPPAGE de la BIOS)
mosaico_que_sube:		; la cuenta a 0, (0xA0, 0) de 0x60 x 0x90 a (0x90, 0) de la pagina 2 y el mosaico 0x12 mas alla de p57; con su byte a 0, 0xD703 = 0xFF, los dibujos de p54:BFCD y el paso siguiente
	ld (hl),000h		;9871
	ld hl,000a0h		;9873   ; de (0xA0, 0)...
	ld de,00090h		;9876   ; ...a (0x90, 0)...
	ld bc,09060h		;9879   ; ...0x60 x 0x90
	ld a,00ah		;987c   ; de la pagina 2
	call 04767h		;987e   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
	ld hl,(0d711h)		;9881   ; el mosaico...
	ld de,00012h		;9884   ; ...0x12 mas alla
	add hl,de			;9887
	ld (0d711h),hl		;9888   ; guarda en el estado 7, el mosaico del banco 57-58 que sube (de 0x12 en 0x12) y el byte siguiente (16 bits)
	call 0646fh		;988b   ; su primer byte
	jr z,mosaicos_acaban		;988e   ; 0: se acaba
	ld hl,(0d711h)		;9890   ; lee en el estado 7, el mosaico del banco 57-58 que sube (de 0x12 en 0x12) y el byte siguiente (16 bits)
	jp 06460h		;9893   ; mosaico_de_57: el mosaico de HL del banco 57-58 en X = 0, Y = 0xF0, 1 fila de 0x12, forma 0x0B
mosaicos_acaban:
	ld hl,0d703h		;9896   ; apunta a la fila del cursor en F2/F3; en el estado 7, la cuenta de cuadros del paso
	ld (hl),0ffh		;9899   ; 0xFF cuadros
	call dibujos_de_54_b		;989b   ; dibujos_de_54_b: con el banco 54: los dibujos de p54:BFCD en 0x6000
	jp est7_siguiente		;989e   ; est7_siguiente: 0xD701 uno mas
est7_paso_16:		; a los 0xFF cuadros, el fundido 1 de p13:A01D y la orden 0xF6 al sonido
	ld hl,0d703h		;98a1   ; apunta a la fila del cursor en F2/F3; en el estado 7, la cuenta de cuadros del paso
	dec (hl)			;98a4
	ret nz			;98a5
	ld c,001h		;98a6
	ld hl,0a01dh		;98a8
	call fundido_1_empieza		;98ab   ; fundido_1_empieza: el fundido 1 (a negro): 0xCADA = 1, la velocidad C en 0xCADB, 0xCADC = 0 y la paleta de HL (0x31 bytes) a 0xE900
	call 06be8h		;98ae   ; orden_sonido_f6: la orden 0xF6 al sonido
	jp est7_siguiente		;98b1   ; est7_siguiente: 0xD701 uno mas
est7_paso_17:		; el fundido 1; al acabar: todo apagado, sin sprites, las paginas 0 y 1 borradas, la pagina 0 a la vista, la paleta de p13:A01D, los recuadros de p13:98EA, 0xD706, 0xD702 y 0xD703 a cero
	ld c,001h		;98b4
	call fundido_1		;98b6   ; fundido_1: con el fundido 1, cada C cuadros cada color uno menos en las tres partes y la paleta puesta; al quedar todo a 0, 0xCADA = 0; 0xCADC de 0 a 2
	ld a,(0cadah)		;98b9   ; aun no
	or a			;98bc
	ret nz			;98bd
	call 045f1h		;98be   ; apaga_pantalla_y_sprites: p00:45CC y p00:45F6
	call 04266h		;98c1   ; esconde_sprites_ram: llena 0xDC00-0xDC7F con 0xE0
	call borra_paginas_0_1		;98c4   ; borra_paginas_0_1:
	xor a			;98c7
	ld (0ca42h),a		;98c8   ; guarda la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	call 04879h		;98cb   ; pon_pagina_visible: la pagina A a la vista (0xFAF5, DPPAGE de la BIOS)
	call 04606h		;98ce   ; enciende_todo: la pantalla y los sprites encendidos
	ld hl,0a01dh		;98d1   ; la paleta de p13:A01D
	call 0463fh		;98d4   ; pon_paleta_con_espera: pone la paleta de HL (p00:4642) esperando al VDP antes
	call recuadros_bb		;98d7   ; recuadros_bb: en la pagina 1: (0x30, 0x50) de 0x40 x 0x70 del color 0xBB, (0x30, 0xC0) de 0x40 x 0x40 a 0 y el mosaico de p54:BC95
	xor a			;98da
	ld hl,0d706h		;98db   ; apunta a 1 al salir de F2/F3 (p10:B897); en el estado 7, el desplazamiento, el color o el numero de mensaje
	ld (hl),a			;98de
	ld hl,0d702h		;98df   ; apunta a la columna del cursor en F2/F3; en el estado 7, el paso de dentro (p13:9922, p13:9A5B)
	ld (hl),a			;98e2
	xor a			;98e3
	ld (0d703h),a		;98e4   ; guarda la fila del cursor en F2/F3; en el estado 7, la cuenta de cuadros del paso
	jp est7_siguiente		;98e7   ; est7_siguiente: 0xD701 uno mas
recuadros_bb:		; en la pagina 1: (0x30, 0x50) de 0x40 x 0x70 del color 0xBB, (0x30, 0xC0) de 0x40 x 0x40 a 0 y el mosaico de p54:BC95
	ld hl,05030h		;98ea
	ld bc,07040h		;98ed   ; ...0x40 x 0x70...
	ld a,0bbh		;98f0   ; ...color 0xBB
	ld d,001h		;98f2
	call 046ffh		;98f4   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
	ld hl,0c030h		;98f7   ; en (0x30, 0xC0)...
	ld bc,04040h		;98fa   ; ...0x40 x 0x40 a 0
	xor a			;98fd
	ld d,001h		;98fe
	call 046ffh		;9900   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
	ld a,001h		;9903   ; en la pagina 1...
	ld (0ca42h),a		;9905   ; guarda la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	call 07179h		;9908   ; ...el mosaico de p54:BC95
	xor a			;990b
	ld (0ca42h),a		;990c   ; guarda la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	ret			;990f
est7_paso_18:		; a los 256 cuadros, 0xF0 y el paso siguiente
	ld hl,0d703h		;9910   ; apunta a la fila del cursor en F2/F3; en el estado 7, la cuenta de cuadros del paso
	dec (hl)			;9913
	ret nz			;9914
	ld (hl),0f0h		;9915
	jp est7_siguiente		;9917   ; est7_siguiente: 0xD701 uno mas
est7_paso_19:		; espera la cuenta
	ld hl,0d703h		;991a   ; apunta a la fila del cursor en F2/F3; en el estado 7, la cuenta de cuadros del paso
	dec (hl)			;991d
	ret nz			;991e
	jp est7_siguiente		;991f   ; est7_siguiente: 0xD701 uno mas
est7_paso_20:		; los mensajes del estado 7 por 0xD702 (p13:9928): el mensaje 0xD706 de p50:8042 abajo, hasta que acaba, 0xC0 cuadros, el siguiente; al 6, la raya de p13:99A4; al 0x13, (0xC0, 0) de 0x40 a 0 en la pagina 2, el fundido 1 de p13:A01D y el paso siguiente
	ld a,(0d702h)		;9922   ; lee la columna del cursor en F2/F3; en el estado 7, el paso de dentro (p13:9922, p13:9A5B)
	call 0424dh		;9925   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_9928: 4 destinos del despachador p00:424D (call en p13:9925, el
;   indice en A): 9930, 993B, 994A, 99A4; lo leen p13:9925 (8 bytes)
;   0x9928..0x9930  (8 bytes)
DATA_tabla_9928:
	defw 09930h,0993bh,0994ah,099a4h	; 9928  -> mensaje_d706 mensaje_hasta_acabar mensaje_siguiente raya_baja

; ======================================================================
; CODIGO 0x9930..0x9a61  (305 bytes)
; ======================================================================


mensaje_d706:		; el mensaje 0xD706 de p50:8042...
	call 064a5h		;9930   ; palabra_8042_d706: HL = la palabra 0xD706 de la tabla de p50:8042
	call 064ddh		;9933   ; ...abajo
est7_dentro_siguiente:		; 0xD702 uno mas
	ld hl,0d702h		;9936   ; apunta a la columna del cursor en F2/F3; en el estado 7, el paso de dentro (p13:9922, p13:9A5B)
	inc (hl)			;9939
	ret			;993a
mensaje_hasta_acabar:
	call 06585h		;993b   ; mensaje_cada_cuadro_b_13_14: mensaje_cada_cuadro y deja los bancos 13 y 14
	ld a,(0e220h)		;993e   ; acabado?
	or a			;9941
	ret nz			;9942
	ld hl,0d703h		;9943   ; 0xC0 cuadros
	ld (hl),0c0h		;9946
	jr est7_dentro_siguiente		;9948
mensaje_siguiente:		; a los 0xC0 cuadros, el mensaje siguiente; en el 6, p13:998A; abajo a 0 (0x28 x 0xE8 en (0x98, 8)); en el 0x13, se acaba
	ld hl,0d703h		;994a   ; apunta a la fila del cursor en F2/F3; en el estado 7, la cuenta de cuadros del paso
	dec (hl)			;994d
	ret nz			;994e
	ld hl,0d706h		;994f   ; el siguiente
	inc (hl)			;9952
	ld a,(hl)			;9953
	ld hl,0d702h		;9954   ; apunta a la columna del cursor en F2/F3; en el estado 7, el paso de dentro (p13:9922, p13:9A5B)
	ld (hl),000h		;9957
	cp 006h		;9959   ; el 6?
	push af			;995b
	call z,raya_empieza		;995c   ; raya_empieza: el paso 3 de dentro (la raya), 0xD717 = 0, (0x30, 0x40) de 0x60 x 0x80 del color 0xBB en la pagina 0 y el sonido 0x3F
	ld hl,00898h		;995f   ; (8, 0x98)...
	ld bc,0e828h		;9962   ; ...0x28 x 0xE8 a 0
	xor a			;9965
	ld d,a			;9966
	call 046ffh		;9967   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
	pop af			;996a
	cp 013h		;996b   ; el 0x13?
	ret nz			;996d
	ld hl,000c0h		;996e   ; (0xC0, 0)...
	ld bc,00040h		;9971   ; ...0x40 x 0x100...
	xor a			;9974
	ld d,002h		;9975   ; ...de la pagina 2 a 0
	call 046ffh		;9977   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
	ld hl,0a01dh		;997a   ; el fundido 1 de p13:A01D
	ld c,001h		;997d
	call fundido_1_empieza		;997f   ; fundido_1_empieza: el fundido 1 (a negro): 0xCADA = 1, la velocidad C en 0xCADB, 0xCADC = 0 y la paleta de HL (0x31 bytes) a 0xE900
	ld hl,0d702h		;9982   ; apunta a la columna del cursor en F2/F3; en el estado 7, el paso de dentro (p13:9922, p13:9A5B)
	xor a			;9985
	ld (hl),a			;9986
	jp est7_siguiente		;9987   ; est7_siguiente: 0xD701 uno mas
raya_empieza:		; el paso 3 de dentro (la raya), 0xD717 = 0, (0x30, 0x40) de 0x60 x 0x80 del color 0xBB en la pagina 0 y el sonido 0x3F
	ld hl,0d702h		;998a   ; apunta a la columna del cursor en F2/F3; en el estado 7, el paso de dentro (p13:9922, p13:9A5B)
	ld (hl),003h		;998d   ; el paso 3
	ld hl,0d717h		;998f   ; apunta a en el estado 7, el color 7 que sube y baja (0-7) o lo que va de la raya
	ld (hl),000h		;9992
	ld hl,04030h		;9994   ; en (0x30, 0x40)...
	ld bc,08060h		;9997   ; ...0x60 x 0x80...
	ld a,0bbh		;999a   ; ...color 0xBB
	ld d,000h		;999c
	call 046ffh		;999e   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
	jp 05f4dh		;99a1   ; sonido_3f: pide el sonido 0x3F
raya_baja:		; 0xD717 uno mas: hasta 0x20, la linea (0x30, 0x50 + 0xD717) de la pagina 1 a (0x48, 0x20) con YMMM; luego (0x70, 0x60) de 8 x 0x48 a (0x68, 0x60) y el paso de dentro 0
	ld hl,0d717h		;99a4   ; apunta a en el estado 7, el color 7 que sube y baja (0-7) o lo que va de la raya
	inc (hl)			;99a7
	ld a,(hl)			;99a8
	cp 021h		;99a9   ; hasta 0x20
	jr nc,raya_acaba		;99ab
	ld hl,05030h		;99ad
	add a,l			;99b0
	ld l,a			;99b1
	ld de,02048h		;99b2
	ld a,001h		;99b5
	jp 047abh		;99b7   ; copia_en_y: orden YMMM del VDP
raya_acaba:		; de (0x70, 0x60)...
	ld hl,06070h		;99ba
	ld de,06068h		;99bd   ; ...a (0x68, 0x60)...
	ld bc,04808h		;99c0   ; ...8 x 0x48
	ld a,001h		;99c3
	call 04767h		;99c5   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
	ld hl,0d702h		;99c8   ; el paso de dentro 0
	ld (hl),000h		;99cb
	ret			;99cd
est7_paso_21:		; el fundido 1; al acabar, la pagina 0 borrada y 0x40 cuadros
	ld c,001h		;99ce
	call fundido_1		;99d0   ; fundido_1: con el fundido 1, cada C cuadros cada color uno menos en las tres partes y la paleta puesta; al quedar todo a 0, 0xCADA = 0; 0xCADC de 0 a 2
	ld a,(0cadah)		;99d3   ; lee el fundido de la paleta en curso (0 ninguno, 1 a negro, 2 desde negro, 3 a blanco; p13:9371)
	or a			;99d6
	ret nz			;99d7
	call borra_pagina_0_b		;99d8   ; borra_pagina_0_b:
	ld hl,0d703h		;99db   ; apunta a la fila del cursor en F2/F3; en el estado 7, la cuenta de cuadros del paso
	ld (hl),040h		;99de
	jp est7_siguiente		;99e0   ; est7_siguiente: 0xD701 uno mas
est7_paso_22:		; a los 0x40 cuadros: 6, 0xD706 = 0, la forma de p54:BCD3 en (0x55, 0x70) y el sonido 0xA4
	ld hl,0d703h		;99e3   ; apunta a la fila del cursor en F2/F3; en el estado 7, la cuenta de cuadros del paso
	dec (hl)			;99e6
	ret nz			;99e7
	ld (hl),006h		;99e8
	ld hl,0d706h		;99ea   ; apunta a 1 al salir de F2/F3 (p10:B897); en el estado 7, el desplazamiento, el color o el numero de mensaje
	ld (hl),000h		;99ed
	ld hl,0bcd3h		;99ef   ; la forma de p54:BCD3...
	ld de,07055h		;99f2   ; ...en (0x55, 0x70)...
	ld bc,00204h		;99f5   ; ...2 x 4
	call 0647ah		;99f8   ; mosaico_de_54_bc: forma 0x0C en la franja 3
	call est7_siguiente		;99fb   ; est7_siguiente: 0xD701 uno mas
	jp 06bc4h		;99fe   ; sonido_a4: pide el sonido 0xA4 (de los que tienen la partitura en un banco de musica, p16:4CE3)
est7_paso_23:		; cada 6 cuadros 0xD706 uno mas y el color 7 gris; a 7, 0x80 cuadros y el paso siguiente
	ld hl,0d703h		;9a01   ; apunta a la fila del cursor en F2/F3; en el estado 7, la cuenta de cuadros del paso
	dec (hl)			;9a04
	ret nz			;9a05
	ld (hl),006h		;9a06
	ld hl,0d706h		;9a08   ; apunta a 1 al salir de F2/F3 (p10:B897); en el estado 7, el desplazamiento, el color o el numero de mensaje
	inc (hl)			;9a0b
	ld a,(hl)			;9a0c
	cp 007h		;9a0d   ; hasta 7
	push af			;9a0f
	call z,gris_a_7		;9a10   ; gris_a_7:
	pop af			;9a13
	jp color_7_gris		;9a14   ; color_7_gris: el color 7 de la paleta con rojo, azul y verde = A
gris_a_7:
	ld hl,0d703h		;9a17   ; apunta a la fila del cursor en F2/F3; en el estado 7, la cuenta de cuadros del paso
	ld (hl),080h		;9a1a
	jp est7_siguiente		;9a1c   ; est7_siguiente: 0xD701 uno mas
est7_paso_24:		; espera la cuenta y 6
	ld hl,0d703h		;9a1f   ; apunta a la fila del cursor en F2/F3; en el estado 7, la cuenta de cuadros del paso
	dec (hl)			;9a22
	ret nz			;9a23
	ld (hl),006h		;9a24
	jp est7_siguiente		;9a26   ; est7_siguiente: 0xD701 uno mas
est7_paso_25:		; cada 6 cuadros 0xD706 uno menos y el color 7 gris; a 0, las paginas 0 y 1 borradas y 0x40 cuadros
	ld hl,0d703h		;9a29   ; apunta a la fila del cursor en F2/F3; en el estado 7, la cuenta de cuadros del paso
	dec (hl)			;9a2c
	ret nz			;9a2d
	ld (hl),006h		;9a2e
	ld hl,0d706h		;9a30   ; apunta a 1 al salir de F2/F3 (p10:B897); en el estado 7, el desplazamiento, el color o el numero de mensaje
	dec (hl)			;9a33
	ld a,(hl)			;9a34
	or a			;9a35
	jr z,gris_a_0		;9a36
	jp color_7_gris		;9a38   ; color_7_gris: el color 7 de la paleta con rojo, azul y verde = A
gris_a_0:
	call borra_paginas_0_1		;9a3b   ; borra_paginas_0_1:
	ld hl,0d703h		;9a3e   ; apunta a la fila del cursor en F2/F3; en el estado 7, la cuenta de cuadros del paso
	ld (hl),040h		;9a41
	jp est7_siguiente		;9a43   ; est7_siguiente: 0xD701 uno mas
est7_paso_26:		; a los 0x40 cuadros, el color 7 = (6, 7, 6), 0xD71D = 0 y el paso siguiente
	ld hl,0d703h		;9a46   ; apunta a la fila del cursor en F2/F3; en el estado 7, la cuenta de cuadros del paso
	dec (hl)			;9a49
	ret nz			;9a4a
	ld de,06706h		;9a4b   ; (6, 7, 6)
	ld a,007h		;9a4e
	call 04614h		;9a50   ; pon_color: el color A de la paleta = D (rojo y azul), E (verde)
	ld hl,0d71dh		;9a53   ; apunta a en el estado 7, las vueltas del mosaico 7 (p13:9B54)
	ld (hl),000h		;9a56
	jp est7_siguiente		;9a58   ; est7_siguiente: 0xD701 uno mas
est7_paso_27:		; los dibujos del estado 7 por 0xD702 (p13:9A61): el dibujo 0xD706 (de p13:9C59, o las copias de 0x0A-0x0C), su fundido 2 (p13:9CB4), su mosaico de p54 por piezas (p13:9C80, p13:9C9A), el fundido 1 y el siguiente; desde 0x0C, el paso siguiente
	ld a,(0d702h)		;9a5b   ; lee la columna del cursor en F2/F3; en el estado 7, el paso de dentro (p13:9922, p13:9A5B)
	call 0424dh		;9a5e   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_9A61: 9 destinos del despachador p00:424D (call en p13:9A5E, el
;   indice en A): 9A73, 9ADC, 9AFB, 9B28, 9B7C, 9BBB, 9C02, 9C20, 9C2A; lo
;   leen p13:9A5E (18 bytes)
;   0x9a61..0x9a73  (18 bytes)
DATA_tabla_9A61:
	defw 09a73h,09adch,09afbh,09b28h,09b7ch,09bbbh,09c02h,09c20h	; 9a61
	defw 09c2ah	; 9a71  -> gris_baja

; ======================================================================
; CODIGO 0x9a73..0x9c59  (486 bytes)
; ======================================================================


dibujo_d706:		; la paleta de p13:A156; el dibujo 0xD706 (0x0A, 0x0B y 0x0C copias de la pagina 1 o 2; los otros p13:9D01 con los 3 bytes de p13:9C59) y el fundido 2 hacia su paleta de p13:9CB4
	call est7_dentro_siguiente		;9a73   ; est7_dentro_siguiente: 0xD702 uno mas
	ld hl,0a156h		;9a76   ; la paleta de p13:A156
	call 0463fh		;9a79   ; pon_paleta_con_espera: pone la paleta de HL (p00:4642) esperando al VDP antes
	ld a,(0d706h)		;9a7c   ; lee 1 al salir de F2/F3 (p10:B897); en el estado 7, el desplazamiento, el color o el numero de mensaje
	cp 00ah		;9a7f   ; el 0x0A...
	jr z,dibujo_0a		;9a81
	cp 00bh		;9a83   ; ...el 0x0B...
	jr z,dibujo_0b		;9a85
	cp 00ch		;9a87   ; ...el 0x0C...
	jr z,dibujo_0c		;9a89
	ld b,a			;9a8b
	add a,a			;9a8c   ; * 3
	add a,b			;9a8d
	ld hl,09c59h		;9a8e   ; de p13:9C59
	call 0423eh		;9a91   ; suma_a_hl: HL = HL + A
	ld a,(hl)			;9a94   ; la barra...
	inc hl			;9a95
	ld e,(hl)			;9a96   ; ...y su sitio
	inc hl			;9a97
	ld d,(hl)			;9a98
	ld b,000h		;9a99
	call barra_de_9d01		;9a9b   ; barra_de_9d01: p00:7B48 y p03:B814 (A, DE, B)
fundido_de_d706:
	ld a,(0d706h)		;9a9e   ; lee 1 al salir de F2/F3 (p10:B897); en el estado 7, el desplazamiento, el color o el numero de mensaje
	ld hl,09cb4h		;9aa1   ; la paleta de p13:9CB4
	call 043f6h		;9aa4   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld c,001h		;9aa7   ; cada cuadro
	jp fundido_2_empieza		;9aa9   ; fundido_2_empieza: el fundido 2 (desde negro): 0xCADA = 2, la velocidad C, la paleta de HL a 0xE900 con los colores a 0
dibujo_0a:		; (0, 0x20) de 0x58 x 0x40 a (0x40, 0x88) de la pagina 1
	ld hl,02000h		;9aac
	ld de,08840h		;9aaf
	ld bc,04058h		;9ab2
	ld a,001h		;9ab5
	call 04767h		;9ab7   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
	jr fundido_de_d706		;9aba
dibujo_0b:		; (0, 0) de 0xA8 x 0x80 a (0x10, 0x10) de la pagina 1
	ld hl,00000h		;9abc
	ld de,01010h		;9abf
	ld bc,080a8h		;9ac2
	ld a,001h		;9ac5
	call 04767h		;9ac7   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
	jr fundido_de_d706		;9aca
dibujo_0c:		; (0, 0xA0) de 0x70 x 0x58 a (0x30, 0x20) de la pagina 2
	ld hl,0a000h		;9acc
	ld de,02030h		;9acf
	ld bc,05870h		;9ad2
	ld a,002h		;9ad5
	call 04767h		;9ad7   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
	jr fundido_de_d706		;9ada
dibujo_fundido:		; p03:B8AC y el fundido 2 hacia la paleta de p13:9CB4; al acabar, el siguiente y 0x20 cuadros
	call 07b55h		;9adc   ; a_p03_b8ac_2: p03:B8AC con el banco 3 en 0xA000
	ld a,(0d706h)		;9adf   ; lee 1 al salir de F2/F3 (p10:B897); en el estado 7, el desplazamiento, el color o el numero de mensaje
	ld de,09cb4h		;9ae2
	call 04403h		;9ae5   ; palabra_de_tabla_de: DE = la palabra A de la tabla de DE
	ld c,001h		;9ae8
	call fundido_2		;9aea   ; fundido_2: con el fundido 2, cada C cuadros cada color de 0xE900 un paso hacia el de DE y la paleta puesta; al ser iguales, 0xCADA = 0
	ld a,(0cadah)		;9aed   ; lee el fundido de la paleta en curso (0 ninguno, 1 a negro, 2 desde negro, 3 a blanco; p13:9371)
	or a			;9af0
	ret nz			;9af1
	call est7_dentro_siguiente		;9af2   ; est7_dentro_siguiente: 0xD702 uno mas
	ld hl,0d703h		;9af5   ; apunta a la fila del cursor en F2/F3; en el estado 7, la cuenta de cuadros del paso
	ld (hl),020h		;9af8
	ret			;9afa
dibujo_mosaico:		; p03:B8AC; a los 0x20 cuadros, 8, el mosaico de p13:9C80 a 0xD718 y su sitio de p13:9C9A a 0xD71B
	call 07b55h		;9afb   ; a_p03_b8ac_2: p03:B8AC con el banco 3 en 0xA000
	ld hl,0d703h		;9afe   ; apunta a la fila del cursor en F2/F3; en el estado 7, la cuenta de cuadros del paso
	dec (hl)			;9b01
	ret nz			;9b02
	ld (hl),008h		;9b03
	ld a,(0d706h)		;9b05   ; lee 1 al salir de F2/F3 (p10:B897); en el estado 7, el desplazamiento, el color o el numero de mensaje
	ld hl,09c80h		;9b08   ; el de p13:9C80
	call 043f6h		;9b0b   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld (0d718h),hl		;9b0e   ; guarda en el estado 7, el mosaico del banco 54 que se pinta (p13:9B28) y el byte siguiente (16 bits)
	ld hl,09c9ah		;9b11   ; el sitio de p13:9C9A
	ld a,(0d706h)		;9b14   ; lee 1 al salir de F2/F3 (p10:B897); en el estado 7, el desplazamiento, el color o el numero de mensaje
	add a,a			;9b17
	ld e,a			;9b18
	ld d,000h		;9b19
	add hl,de			;9b1b
	ld e,(hl)			;9b1c
	inc hl			;9b1d
	ld d,(hl)			;9b1e
	ld hl,0d71bh		;9b1f   ; apunta a en el estado 7, el sitio de ese mosaico (E, D)
	ld (hl),e			;9b22
	inc l			;9b23
	ld (hl),d			;9b24
	jp est7_dentro_siguiente		;9b25   ; est7_dentro_siguiente: 0xD702 uno mas
mosaico_por_piezas:		; p03:B8AC; cada 8 cuadros, el mosaico de 0xD718 en 0xD71B y la X + el byte siguiente; con 0xFF, en el dibujo 7 dos veces el de p54:BE19 en (0x40, 0x38); si no, 0xFF cuadros y el siguiente
	call 07b55h		;9b28   ; a_p03_b8ac_2: p03:B8AC con el banco 3 en 0xA000
	ld hl,0d703h		;9b2b   ; apunta a la fila del cursor en F2/F3; en el estado 7, la cuenta de cuadros del paso
	dec (hl)			;9b2e
	ret nz			;9b2f
	ld (hl),008h		;9b30
	ld hl,0d71bh		;9b32   ; apunta a en el estado 7, el sitio de ese mosaico (E, D)
	ld e,(hl)			;9b35
	inc l			;9b36
	ld d,(hl)			;9b37
	ld hl,(0d718h)		;9b38   ; el mosaico
	call 06477h		;9b3b   ; mosaico_de_54: el mosaico de HL del banco 54 (2 filas de 1)
	ld hl,(0d718h)		;9b3e   ; lee en el estado 7, el mosaico del banco 54 que se pinta (p13:9B28) y el byte siguiente (16 bits)
	inc hl			;9b41
	inc hl			;9b42
	call 06482h		;9b43   ; lo siguiente
	cp 0ffh		;9b46   ; 0xFF: se acaba
	jr z,mosaico_acaba		;9b48
	inc hl			;9b4a
	ld (0d718h),hl		;9b4b   ; guarda en el estado 7, el mosaico del banco 54 que se pinta (p13:9B28) y el byte siguiente (16 bits)
	ld hl,0d71ch		;9b4e   ; + la X
	add a,(hl)			;9b51
	ld (hl),a			;9b52
	ret			;9b53
mosaico_acaba:
	ld a,(0d706h)		;9b54   ; lee 1 al salir de F2/F3 (p10:B897); en el estado 7, el desplazamiento, el color o el numero de mensaje
	cp 007h		;9b57   ; el 7...
	jr nz,mosaico_espera		;9b59
	ld hl,0d71dh		;9b5b   ; ...dos veces
	inc (hl)			;9b5e
	ld a,(hl)			;9b5f
	cp 002h		;9b60
	jr nc,mosaico_espera		;9b62
	ld hl,0be19h		;9b64   ; p54:BE19...
	ld de,03840h		;9b67   ; ...en (0x40, 0x38)
	ld (0d718h),hl		;9b6a   ; guarda en el estado 7, el mosaico del banco 54 que se pinta (p13:9B28) y el byte siguiente (16 bits)
	ld hl,0d71bh		;9b6d   ; apunta a en el estado 7, el sitio de ese mosaico (E, D)
	ld (hl),e			;9b70
	inc l			;9b71
	ld (hl),d			;9b72
	ret			;9b73
mosaico_espera:
	ld hl,0d703h		;9b74   ; apunta a la fila del cursor en F2/F3; en el estado 7, la cuenta de cuadros del paso
	ld (hl),0ffh		;9b77
	jp est7_dentro_siguiente		;9b79   ; est7_dentro_siguiente: 0xD702 uno mas
dibujo_siguiente:		; p03:B8AC; a los 0xFF cuadros, 6: desde 0x0C, el paso siguiente; si no, el siguiente de dentro, 0xD706 uno mas (p13:9BA3) y el fundido 1 de su paleta
	call 07b55h		;9b7c   ; a_p03_b8ac_2: p03:B8AC con el banco 3 en 0xA000
	ld hl,0d703h		;9b7f   ; apunta a la fila del cursor en F2/F3; en el estado 7, la cuenta de cuadros del paso
	dec (hl)			;9b82
	ret nz			;9b83
	ld (hl),006h		;9b84
	ld a,(0d706h)		;9b86   ; lee 1 al salir de F2/F3 (p10:B897); en el estado 7, el desplazamiento, el color o el numero de mensaje
	cp 00ch		;9b89   ; desde 0x0C, se acaba
	jp nc,est7_27_acaba		;9b8b   ; est7_27_acaba:
	call est7_dentro_siguiente		;9b8e   ; est7_dentro_siguiente: 0xD702 uno mas
	call d706_mas		;9b91   ; d706_mas: 0xD706 uno mas: en el 0x0A, los dibujos de p00:4CA6 y p04:8957; en el 0x0B, el mapa de bits de p57:8098 en 0x8000
	ld a,(0d706h)		;9b94   ; lee 1 al salir de F2/F3 (p10:B897); en el estado 7, el desplazamiento, el color o el numero de mensaje
	dec a			;9b97
	ld hl,09cb4h		;9b98
	call 043f6h		;9b9b   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld c,001h		;9b9e
	jp fundido_1_empieza		;9ba0   ; fundido_1_empieza: el fundido 1 (a negro): 0xCADA = 1, la velocidad C en 0xCADB, 0xCADC = 0 y la paleta de HL (0x31 bytes) a 0xE900
d706_mas:		; 0xD706 uno mas: en el 0x0A, los dibujos de p00:4CA6 y p04:8957; en el 0x0B, el mapa de bits de p57:8098 en 0x8000
	ld hl,0d706h		;9ba3   ; apunta a 1 al salir de F2/F3 (p10:B897); en el estado 7, el desplazamiento, el color o el numero de mensaje
	inc (hl)			;9ba6
	ld a,(hl)			;9ba7
	cp 00bh		;9ba8
	jr z,mapa_de_8098		;9baa
	cp 00ah		;9bac
	ret nz			;9bae
	call 04ca6h		;9baf   ; dibujos_a34b: los bancos 32-34...
	jp 07b40h		;9bb2   ; a_p04_8957: p04:8957 con el banco 4 en 0x8000
mapa_de_8098:
	ld de,08000h		;9bb5
	jp 06e2ch		;9bb8   ; mapa_de_bits_8098_en: el mapa de bits de p57:8098 (0xA8 filas de 0x40 bytes) en la VRAM de DE
dibujo_apaga:		; p03:B8AC y el fundido 1; al acabar: todo apagado, la pagina 0 borrada, p03:B866 con 0 y 1, todo encendido; salvo en el 0x0C, el paso de dentro 0; en el 0x0C, el color 7 a negro, 0xD717 = 0 y la forma de p54:BCDB en (0x58, 0x74)
	call 07b55h		;9bbb   ; a_p03_b8ac_2: p03:B8AC con el banco 3 en 0xA000
	ld c,001h		;9bbe
	call fundido_1		;9bc0   ; fundido_1: con el fundido 1, cada C cuadros cada color uno menos en las tres partes y la paleta puesta; al quedar todo a 0, 0xCADA = 0; 0xCADC de 0 a 2
	ld a,(0cadah)		;9bc3   ; lee el fundido de la paleta en curso (0 ninguno, 1 a negro, 2 desde negro, 3 a blanco; p13:9371)
	or a			;9bc6
	ret nz			;9bc7
	call 045f1h		;9bc8   ; apaga_pantalla_y_sprites: p00:45CC y p00:45F6
	call borra_pagina_0_b		;9bcb   ; borra_pagina_0_b:
	xor a			;9bce
	call 07b5dh		;9bcf   ; a_p03_b866_2: p03:B866 con el banco 3 en 0xA000
	ld a,001h		;9bd2
	call 07b5dh		;9bd4   ; a_p03_b866_2: p03:B866 con el banco 3 en 0xA000
	call 04606h		;9bd7   ; enciende_todo: la pantalla y los sprites encendidos
	ld a,(0d706h)		;9bda   ; lee 1 al salir de F2/F3 (p10:B897); en el estado 7, el desplazamiento, el color o el numero de mensaje
	cp 00ch		;9bdd   ; el 0x0C?
	jr z,dibujo_0c_final		;9bdf
	xor a			;9be1
	ld (0d702h),a		;9be2   ; guarda la columna del cursor en F2/F3; en el estado 7, el paso de dentro (p13:9922, p13:9A5B)
	ret			;9be5
dibujo_0c_final:
	ld de,00000h		;9be6
	ld a,007h		;9be9   ; el color 7 a negro
	call 04614h		;9beb   ; pon_color: el color A de la paleta = D (rojo y azul), E (verde)
	ld hl,0d717h		;9bee   ; apunta a en el estado 7, el color 7 que sube y baja (0-7) o lo que va de la raya
	ld (hl),000h		;9bf1
	ld hl,0bcdbh		;9bf3   ; la forma de p54:BCDB...
	ld de,07458h		;9bf6   ; ...en (0x58, 0x74)
	ld bc,00203h		;9bf9
	call 0647ah		;9bfc   ; mosaico_de_54_bc: forma 0x0C en la franja 3
	jp est7_dentro_siguiente		;9bff   ; est7_dentro_siguiente: 0xD702 uno mas
gris_sube:		; cada 6 cuadros 0xD717 uno mas y el color 7 gris; a 7, 0x80 cuadros y el siguiente
	ld hl,0d703h		;9c02   ; apunta a la fila del cursor en F2/F3; en el estado 7, la cuenta de cuadros del paso
	dec (hl)			;9c05
	ret nz			;9c06
	ld (hl),006h		;9c07
	ld hl,0d717h		;9c09   ; apunta a en el estado 7, el color 7 que sube y baja (0-7) o lo que va de la raya
	inc (hl)			;9c0c
	ld a,(hl)			;9c0d
	cp 007h		;9c0e
	push af			;9c10
	call z,gris_sube_acaba		;9c11   ; gris_sube_acaba:
	pop af			;9c14
	jp color_7_gris		;9c15   ; color_7_gris: el color 7 de la paleta con rojo, azul y verde = A
gris_sube_acaba:
	ld hl,0d703h		;9c18   ; apunta a la fila del cursor en F2/F3; en el estado 7, la cuenta de cuadros del paso
	ld (hl),080h		;9c1b
	jp est7_dentro_siguiente		;9c1d   ; est7_dentro_siguiente: 0xD702 uno mas
gris_espera:
	ld hl,0d703h		;9c20   ; apunta a la fila del cursor en F2/F3; en el estado 7, la cuenta de cuadros del paso
	dec (hl)			;9c23
	ret nz			;9c24
	ld (hl),006h		;9c25
	jp est7_dentro_siguiente		;9c27   ; est7_dentro_siguiente: 0xD702 uno mas
gris_baja:		; cada 6 cuadros 0xD717 uno menos y el color 7 gris; a 0: todo apagado, las paginas 0 y 1 borradas, el mapa de bits de p00:6EC0, todo encendido, el paso de dentro 0 y la paleta de p13:A06D
	ld hl,0d703h		;9c2a   ; apunta a la fila del cursor en F2/F3; en el estado 7, la cuenta de cuadros del paso
	dec (hl)			;9c2d
	ret nz			;9c2e
	ld (hl),006h		;9c2f
	ld hl,0d717h		;9c31   ; apunta a en el estado 7, el color 7 que sube y baja (0-7) o lo que va de la raya
	dec (hl)			;9c34
	ld a,(hl)			;9c35
	or a			;9c36
	jr z,gris_baja_acaba		;9c37
	jp color_7_gris		;9c39   ; color_7_gris: el color 7 de la paleta con rojo, azul y verde = A
gris_baja_acaba:
	call 045f1h		;9c3c   ; apaga_pantalla_y_sprites: p00:45CC y p00:45F6
	call borra_paginas_0_1		;9c3f   ; borra_paginas_0_1:
	call 06ec0h		;9c42   ; mapa_de_bits_9c58_bancos:
	call 04606h		;9c45   ; enciende_todo: la pantalla y los sprites encendidos
	call 04650h		;9c48   ; espera_vdp: espera a que el VDP acabe la orden en curso (S#2 bit 0)
	ld hl,0d702h		;9c4b   ; apunta a la columna del cursor en F2/F3; en el estado 7, el paso de dentro (p13:9922, p13:9A5B)
	ld (hl),000h		;9c4e
	ld hl,0a06dh		;9c50   ; la paleta de p13:A06D
	jp 0463fh		;9c53   ; pon_paleta_con_espera: pone la paleta de HL (p00:4642) esperando al VDP antes
est7_27_acaba:
	jp est7_siguiente		;9c56   ; est7_siguiente: 0xD701 uno mas

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


est7_paso_28:		; el fundido 3 (a blanco) de p13:A06D cada 2 cuadros y la orden 0xF6 al sonido
	ld c,002h		;9cce
	ld hl,0a06dh		;9cd0
	call fundido_3_empieza		;9cd3   ; fundido_3_empieza: el fundido 3 (a blanco): 0xCADA = 3, la velocidad C y la paleta de HL a 0xE900
	call 06be8h		;9cd6   ; orden_sonido_f6: la orden 0xF6 al sonido
	jp est7_siguiente		;9cd9   ; est7_siguiente: 0xD701 uno mas
est7_paso_29:		; el fundido 3; al acabar, 0xFF cuadros
	ld c,002h		;9cdc
	call fundido_3		;9cde   ; fundido_3: con el fundido 3, cada C cuadros cada color uno mas hasta 7 y la paleta puesta; con todo a 7, 0xCADA = 0
	ld a,(0cadah)		;9ce1   ; lee el fundido de la paleta en curso (0 ninguno, 1 a negro, 2 desde negro, 3 a blanco; p13:9371)
	or a			;9ce4
	ret nz			;9ce5
	ld hl,0d703h		;9ce6   ; apunta a la fila del cursor en F2/F3; en el estado 7, la cuenta de cuadros del paso
	ld (hl),0ffh		;9ce9
	jp est7_siguiente		;9ceb   ; est7_siguiente: 0xD701 uno mas
est7_paso_30:		; a los 0xFF cuadros, el estado 0 de la partida (paso 0), 0xCAAF = 0 y 0xD700 = 0
	ld hl,0d703h		;9cee   ; apunta a la fila del cursor en F2/F3; en el estado 7, la cuenta de cuadros del paso
	dec (hl)			;9cf1
	ret nz			;9cf2
	xor a			;9cf3
	ld (0ca00h),a		;9cf4   ; el estado 0...
	ld (0ca01h),a		;9cf7   ; ...paso 0
	ld (0caafh),a		;9cfa   ; 0xCAAF = 0
	ld (0d700h),a		;9cfd   ; guarda el estado de la pantalla de F2/F3 (0xD700-0xD70F; p10:AFB2)
	ret			;9d00
barra_de_9d01:		; p00:7B48 y p03:B814 (A, DE, B)
	push bc			;9d01
	push de			;9d02
	push af			;9d03
	call 07b48h		;9d04   ; dibujos_de_93e5_bancos_14:
	pop af			;9d07
	pop de			;9d08
	pop bc			;9d09
	jp 07b4dh		;9d0a   ; a_p03_b814_2: p03:B814 con el banco 3 en 0xA000
piezas_que_cambian:		; las piezas que cambian cada 16 cuadros segun 0xD706 (p13:9D18, 9D3A, 9D5D, 9D85)
	call pieza_a1a0		;9d0d   ; pieza_a1a0: con 0xD706 entre 0x10 y 0x5F: la pieza 0x55 o 0x56 (cada 16 cuadros) en (0xA0, 0xA1)
	call pieza_c948		;9d10   ; pieza_c948: con 0xD706 entre 0x38 y 0x87: la pieza 0x5C o 0x5F en (0x48, 0xC9)
	call piezas_c9a8		;9d13   ; piezas_c9a8: con 0xD706 entre 0x38 y 0x87: las piezas 0x5D-0x5E o 0x60-0x61 en (0xA8, 0xC9)
	jr pieza_d158		;9d16
pieza_a1a0:		; con 0xD706 entre 0x10 y 0x5F: la pieza 0x55 o 0x56 (cada 16 cuadros) en (0xA0, 0xA1)
	ld a,(0d706h)		;9d18   ; lee 1 al salir de F2/F3 (p10:B897); en el estado 7, el desplazamiento, el color o el numero de mensaje
	cp 010h		;9d1b   ; desde 0x10...
	ret c			;9d1d
	cp 060h		;9d1e   ; ...hasta 0x5F
	ret nc			;9d20
	ld a,(0d705h)		;9d21   ; cada 16 cuadros...
	rra			;9d24
	rra			;9d25
	rra			;9d26
	rra			;9d27
	ld a,055h		;9d28   ; ...0x55...
	jr nc,pon_pieza_a1a0		;9d2a
	inc a			;9d2c   ; ...o 0x56
pon_pieza_a1a0:
	ld hl,0d70dh		;9d2d   ; apunta a el cursor de F3 guardado (columna, fila); en el estado 7, la pieza 0x55 o 0x56 (p13:9D18)
	ld (hl),a			;9d30
	ld de,0a0a1h		;9d31   ; en (0xA0, 0xA1)
	ld bc,00101h		;9d34
	jp 050d6h		;9d37   ; mosaico_f2_b2: el mosaico de HL en (D, E), B filas de C caracteres, con la forma 2 de la franja 2 (p00:512C)
pieza_c948:		; con 0xD706 entre 0x38 y 0x87: la pieza 0x5C o 0x5F en (0x48, 0xC9)
	ld a,(0d706h)		;9d3a   ; lee 1 al salir de F2/F3 (p10:B897); en el estado 7, el desplazamiento, el color o el numero de mensaje
	cp 038h		;9d3d   ; desde 0x38...
	ret c			;9d3f
	cp 088h		;9d40   ; ...hasta 0x87
	ret nc			;9d42
	ld a,(0d705h)		;9d43   ; lee cuantas cosas hay en la pantalla de F2/F3; en el estado 7, los cuadros
	rra			;9d46
	rra			;9d47
	rra			;9d48
	rra			;9d49
	ld a,05ch		;9d4a   ; 0x5C...
	jr c,pon_pieza_c948		;9d4c
	ld a,05fh		;9d4e   ; ...o 0x5F
pon_pieza_c948:
	ld hl,0d70dh		;9d50   ; apunta a el cursor de F3 guardado (columna, fila); en el estado 7, la pieza 0x55 o 0x56 (p13:9D18)
	ld (hl),a			;9d53
	ld de,048c9h		;9d54   ; en (0x48, 0xC9)
	ld bc,00101h		;9d57
	jp 050d6h		;9d5a   ; mosaico_f2_b2: el mosaico de HL en (D, E), B filas de C caracteres, con la forma 2 de la franja 2 (p00:512C)
piezas_c9a8:		; con 0xD706 entre 0x38 y 0x87: las piezas 0x5D-0x5E o 0x60-0x61 en (0xA8, 0xC9)
	ld a,(0d706h)		;9d5d   ; lee 1 al salir de F2/F3 (p10:B897); en el estado 7, el desplazamiento, el color o el numero de mensaje
	cp 038h		;9d60   ; desde 0x38...
	ret c			;9d62
	cp 088h		;9d63   ; ...hasta 0x87
	ret nc			;9d65
	ld a,(0d705h)		;9d66   ; lee cuantas cosas hay en la pantalla de F2/F3; en el estado 7, los cuadros
	rra			;9d69
	rra			;9d6a
	rra			;9d6b
	rra			;9d6c
	ld de,05d5eh		;9d6d   ; 0x5D-0x5E...
	jr c,pon_piezas_c9a8		;9d70
	ld de,06061h		;9d72   ; ...o 0x60-0x61
pon_piezas_c9a8:
	ld hl,0d70dh		;9d75   ; apunta a el cursor de F3 guardado (columna, fila); en el estado 7, la pieza 0x55 o 0x56 (p13:9D18)
	ld (hl),d			;9d78
	inc hl			;9d79
	ld (hl),e			;9d7a
	dec hl			;9d7b
	ld de,0a8c9h		;9d7c   ; en (0xA8, 0xC9), 2 piezas
	ld bc,00102h		;9d7f
	jp 050d6h		;9d82   ; mosaico_f2_b2: el mosaico de HL en (D, E), B filas de C caracteres, con la forma 2 de la franja 2 (p00:512C)
pieza_d158:		; con 0xD706 entre 0x40 y 0x8F: la pieza 0x57 o 0x58 en (0x58, 0xD1)
	ld a,(0d706h)		;9d85   ; lee 1 al salir de F2/F3 (p10:B897); en el estado 7, el desplazamiento, el color o el numero de mensaje
	cp 040h		;9d88   ; desde 0x40...
	ret c			;9d8a
	cp 090h		;9d8b   ; ...hasta 0x8F
	ret nc			;9d8d
	ld a,(0d705h)		;9d8e   ; lee cuantas cosas hay en la pantalla de F2/F3; en el estado 7, los cuadros
	rra			;9d91
	rra			;9d92
	rra			;9d93
	rra			;9d94
	ld a,057h		;9d95   ; 0x57...
	jr nc,pon_pieza_d158		;9d97
	inc a			;9d99   ; ...o 0x58
pon_pieza_d158:
	ld hl,0d70dh		;9d9a   ; apunta a el cursor de F3 guardado (columna, fila); en el estado 7, la pieza 0x55 o 0x56 (p13:9D18)
	ld (hl),a			;9d9d
	ld de,058d1h		;9d9e   ; en (0x58, 0xD1)
	ld bc,00101h		;9da1
	jp 050d6h		;9da4   ; mosaico_f2_b2: el mosaico de HL en (D, E), B filas de C caracteres, con la forma 2 de la franja 2 (p00:512C)
particulas:		; las 22 fichas de 0x10 bytes de 0xCB00 (usadas aqui para otra cosa): una nueva (p13:9E3B), se mueven (p13:9DB1) y sus sprites (p13:9DFB)
	call particula_nueva		;9da7   ; particula_nueva: 0xD70C de 0 a 7; en la primera ficha libre de 0xCB00, una nueva (p13:9E5D) con la velocidad y el patron de la fila 0xD70C de p13:9EA0
	call mueve_particulas		;9daa   ; mueve_particulas: 22 fichas de 0x10 bytes desde 0xCB00
	call sprites_de_particulas		;9dad   ; sprites_de_particulas: los sprites desde el 10 a 0 y uno por ficha (p13:9E2A); los colores desde el sprite 10 a 0x0F
	ret			;9db0
mueve_particulas:		; 22 fichas de 0x10 bytes desde 0xCB00
	ld ix,0cb00h		;9db1   ; apunta a el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	ld b,016h		;9db5   ; 22
mueve_particula:
	ld a,(ix+000h)		;9db7
	or a			;9dba   ; libre, nada
	jr z,siguiente_particula		;9dbb
	call mueve_una		;9dbd   ; mueve_una: la ficha IX: la Y (16 bits en +1) + su velocidad (+5) y la X (+3) + la suya (+7); fuera de 0x40-0xBF en X, libre
siguiente_particula:		; la siguiente (0x10 bytes)
	ld de,00010h		;9dc0
	add ix,de		;9dc3
	djnz mueve_particula		;9dc5
	ret			;9dc7
mueve_una:		; la ficha IX: la Y (16 bits en +1) + su velocidad (+5) y la X (+3) + la suya (+7); fuera de 0x40-0xBF en X, libre
	ld l,(ix+005h)		;9dc8
	ld h,(ix+006h)		;9dcb   ; su velocidad en Y...
	ld e,(ix+001h)		;9dce   ; ...+ la Y
	ld d,(ix+002h)		;9dd1
	add hl,de			;9dd4
	ld (ix+001h),l		;9dd5
	ld (ix+002h),h		;9dd8
	ld l,(ix+007h)		;9ddb   ; su velocidad en X...
	ld h,(ix+008h)		;9dde
	ld e,(ix+003h)		;9de1   ; ...+ la X
	ld d,(ix+004h)		;9de4
	add hl,de			;9de7
	ld (ix+003h),l		;9de8
	ld (ix+004h),h		;9deb
	ld a,h			;9dee
	cp 040h		;9def   ; por debajo de 0x40...
	jr c,particula_fuera		;9df1
	cp 0c0h		;9df3   ; ...o desde 0xC0...
	ret c			;9df5
particula_fuera:		; ...libre
	xor a			;9df6
	ld (ix+000h),a		;9df7
	ret			;9dfa
sprites_de_particulas:		; los sprites desde el 10 a 0 y uno por ficha (p13:9E2A); los colores desde el sprite 10 a 0x0F
	ld hl,0dc28h		;9dfb
	ld bc,00058h		;9dfe   ; 0x59 bytes
	call 04236h		;9e01   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	ld ix,0cb00h		;9e04   ; las fichas de 0xCB00
	ld b,016h		;9e08   ; 22
	ld hl,0dc28h		;9e0a   ; desde el sprite 10
sprite_de_particula:
	ld a,(ix+000h)		;9e0d
	or a			;9e10
	jr z,siguiente_sprite_particula		;9e11   ; libre, nada
	push bc			;9e13
	call sprite_particula		;9e14   ; sprite_particula: el sprite en (la Y + 0xD706, la X) con el patron del byte 9
	pop bc			;9e17
siguiente_sprite_particula:
	ld de,00010h		;9e18
	add ix,de		;9e1b
	djnz sprite_de_particula		;9e1d
	ld hl,0daa0h		;9e1f   ; los colores...
	ld a,00fh		;9e22   ; ...a 0x0F
	ld bc,0015fh		;9e24
	jp 04237h		;9e27   ; llena_bloque: pone A en BC + 1 bytes desde HL
sprite_particula:		; el sprite en (la Y + 0xD706, la X) con el patron del byte 9
	ld e,(ix+002h)		;9e2a
	ld a,(0d706h)		;9e2d   ; + el desplazamiento
	add a,e			;9e30
	ld e,a			;9e31
	ld d,(ix+004h)		;9e32   ; la X
	ld c,(ix+009h)		;9e35   ; el patron
	jp 05d41h		;9e38   ; pon_sprite: [E][D][C] en (HL): la Y, la X y el patron de un sprite de 0xDC00
particula_nueva:		; 0xD70C de 0 a 7; en la primera ficha libre de 0xCB00, una nueva (p13:9E5D) con la velocidad y el patron de la fila 0xD70C de p13:9EA0
	ld a,(0d70ch)		;9e3b
	inc a			;9e3e
	and 007h		;9e3f   ; 0-7
	ld (0d70ch),a		;9e41
	ld ix,0cb00h		;9e44   ; las fichas de 0xCB00
	ld b,016h		;9e48   ; 22
busca_libre:
	ld a,(ix+000h)		;9e4a
	or a			;9e4d
	jr z,pon_particula		;9e4e   ; libre: esa
	ld de,00010h		;9e50   ; la siguiente (0x10 bytes)
	add ix,de		;9e53
	djnz busca_libre		;9e55
	ret			;9e57
pon_particula:
	call particula_empieza		;9e58   ; particula_empieza: activa, la Y 0x90 y la X 0x30 + (cuadros * 8 & 0x78)
	jr particula_velocidad		;9e5b
particula_empieza:		; activa, la Y 0x90 y la X 0x30 + (cuadros * 8 & 0x78)
	xor a			;9e5d
	ld (ix+001h),a		;9e5e
	ld (ix+003h),a		;9e61
	inc a			;9e64   ; activa
	ld (ix+000h),a		;9e65
	ld (ix+002h),090h		;9e68   ; Y = 0x90
	ld a,(0d705h)		;9e6c   ; la X por los cuadros
	rla			;9e6f
	rla			;9e70
	rla			;9e71
	and 078h		;9e72
	add a,030h		;9e74
	ld (ix+004h),a		;9e76
	ret			;9e79
particula_velocidad:		; la fila 0xD70C (5 bytes) de p13:9EA0: las velocidades en Y y X y el patron
	ld a,(0d70ch)		;9e7a
	ld b,a			;9e7d
	add a,a			;9e7e
	add a,a			;9e7f
	add a,b			;9e80   ; * 5
	ld hl,09ea0h		;9e81
	call 0423eh		;9e84   ; suma_a_hl: HL = HL + A
	ld a,(hl)			;9e87   ; la velocidad en Y...
	ld (ix+005h),a		;9e88
	inc hl			;9e8b
	ld a,(hl)			;9e8c
	ld (ix+006h),a		;9e8d
	inc hl			;9e90
	ld a,(hl)			;9e91   ; ...en X...
	ld (ix+007h),a		;9e92
	inc hl			;9e95
	ld a,(hl)			;9e96
	ld (ix+008h),a		;9e97
	inc hl			;9e9a
	ld a,(hl)			;9e9b   ; ...y el patron
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


sprites_9f85:		; 10 sprites de p13:9F85 o p13:9FA3 (cada 4 cuadros) desde el 0 (el puntero en 0xD707) y sus colores a 0x0F
	ld hl,0dc00h		;9ec8   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	ld (0d707h),hl		;9ecb   ; el puntero a 0xD707
	ld a,(0ca03h)		;9ece   ; cada 4 cuadros...
	rra			;9ed1
	rra			;9ed2
	ld hl,09f85h		;9ed3   ; ...p13:9F85...
	jr c,diez_sprites		;9ed6
	ld hl,09fa3h		;9ed8   ; ...o p13:9FA3
diez_sprites:		; 10
	ld b,00ah		;9edb
sprite_9f85:		; Y...
	ld e,(hl)			;9edd
	inc hl			;9ede
	ld d,(hl)			;9edf   ; ...X...
	inc hl			;9ee0
	ld c,(hl)			;9ee1   ; ...patron
	inc hl			;9ee2
	push bc			;9ee3
	push hl			;9ee4
	ld hl,(0d707h)		;9ee5   ; el puntero de 0xD707
	call 05d41h		;9ee8   ; pon_sprite: [E][D][C] en (HL): la Y, la X y el patron de un sprite de 0xDC00
	ld (0d707h),hl		;9eeb   ; guarda el puntero
	pop hl			;9eee
	pop bc			;9eef
	djnz sprite_9f85		;9ef0
	ld hl,0da00h		;9ef2   ; los colores...
	ld a,00fh		;9ef5   ; ...a 0x0F
	ld bc,0009fh		;9ef7
	jp 04237h		;9efa   ; llena_bloque: pone A en BC + 1 bytes desde HL
sprites_de_d709:		; los sprites 0-1 de color 0x0F en (0x68, 0xD709) y 0x10 a la derecha, el patron 0x50 o 0x58 cada 4 cuadros
	call colores_0_1		;9efd   ; colores_0_1: los colores de los sprites 0-1 a 0x0F
	ld a,(0ca03h)		;9f00   ; cada 4 cuadros...
	rra			;9f03
	rra			;9f04
	ld c,050h		;9f05   ; ...0x50...
	jr c,sprites_d709		;9f07
	ld c,058h		;9f09   ; ...o 0x58
sprites_d709:		; la X de 0xD709
	ld a,(0d709h)		;9f0b   ; lee en el estado 7, lo que baja de 0xC0 a 0x80 (p13:974E)
	ld d,a			;9f0e
	ld e,068h		;9f0f   ; Y = 0x68
	ld hl,0dc00h		;9f11   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
dos_sprites_juntos:		; el sprite en (E, D) y el de patron + 4 0x10 a la derecha
	call 05d41h		;9f14   ; pon_sprite: [E][D][C] en (HL): la Y, la X y el patron de un sprite de 0xDC00
	ld a,d			;9f17
	add a,010h		;9f18
	ld d,a			;9f1a
	jp 05d3dh		;9f1b   ; pon_sprite_mas_4: p00:5D41 con el patron C + 4
colores_0_1:		; los colores de los sprites 0-1 a 0x0F
	ld hl,0da00h		;9f1e   ; apunta a la copia de la tabla de colores de sprites: 32 x 16 lineas (va con 0xDC00 detras)
	ld a,00fh		;9f21
	ld bc,0001fh		;9f23
	jp 04237h		;9f26   ; llena_bloque: pone A en BC + 1 bytes desde HL
sprites_de_d70a:		; los sprites 0-1 de color 0x0F en (0x68, 0xD709) con el patron de 0xD70A (p13:9F6B) y el siguiente + 4
	call colores_0_1		;9f29   ; colores_0_1: los colores de los sprites 0-1 a 0x0F
	call patron_de_d70a		;9f2c   ; patron_de_d70a: C = el patron por 0xD70A: hasta 3, 0x60 + n * 8; desde 4, 0x80 + (n - 4) * 4
	ld a,(0d709h)		;9f2f   ; la X de 0xD709
	ld d,a			;9f32
	ld e,068h		;9f33   ; Y = 0x68
	ld hl,0dc00h		;9f35   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	call 05d41h		;9f38   ; pon_sprite: [E][D][C] en (HL): la Y, la X y el patron de un sprite de 0xDC00
	ld a,c			;9f3b   ; + 4...
	add a,004h		;9f3c
	ld c,a			;9f3e
	cp 080h		;9f3f   ; ...desde 0x80, 0
	jr c,segundo_sprite_d70a		;9f41
	ld c,000h		;9f43
segundo_sprite_d70a:
	ld a,d			;9f45
	add a,010h		;9f46
	ld d,a			;9f48
	jp 05d41h		;9f49   ; pon_sprite: [E][D][C] en (HL): la Y, la X y el patron de un sprite de 0xDC00
sprites_8770:		; los sprites 2-3 en (0x87, 0x70) con el patron 0x98 o 0xA0 cada 4 cuadros y sus colores a 7
	ld a,(0ca03h)		;9f4c   ; lee el contador de cuadros (uno mas en cada interrupcion)
	rra			;9f4f   ; cada 4 cuadros...
	rra			;9f50
	ld c,098h		;9f51   ; ...0x98...
	jr c,sprites_8770_b		;9f53
	ld c,0a0h		;9f55   ; ...o 0xA0
sprites_8770_b:		; desde el sprite 2
	ld hl,0dc08h		;9f57
	ld de,07087h		;9f5a   ; en (0x87, 0x70)
	call dos_sprites_juntos		;9f5d   ; dos_sprites_juntos: el sprite en (E, D) y el de patron + 4 0x10 a la derecha
	ld hl,0da20h		;9f60   ; los colores...
	ld a,007h		;9f63   ; ...a 7
	ld bc,0001fh		;9f65
	jp 04237h		;9f68   ; llena_bloque: pone A en BC + 1 bytes desde HL
patron_de_d70a:		; C = el patron por 0xD70A: hasta 3, 0x60 + n * 8; desde 4, 0x80 + (n - 4) * 4
	ld a,(0d70ah)		;9f6b   ; lee 0-1: la opcion de la cosa 7 en F2 (p10:B8F8); en el estado 7, de 0 a 9 por 0xD709 (p13:9799)
	cp 004h		;9f6e   ; desde 4, aparte
	jr nc,patron_d70a_b		;9f70
	rla			;9f72   ; * 8...
	rla			;9f73
	rla			;9f74
	and 0f8h		;9f75
	add a,060h		;9f77   ; ...+ 0x60
	ld c,a			;9f79
	ret			;9f7a
patron_d70a_b:		; - 4...
	sub 004h		;9f7b
	rla			;9f7d   ; ...* 4...
	rla			;9f7e
	and 0fch		;9f7f
	add a,080h		;9f81   ; ...+ 0x80
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
