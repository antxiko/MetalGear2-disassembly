; ==========================================================================
; METAL GEAR 2 SOLID SNAKE - Konami (1990) - MSX2 - MegaROM RC-767 de 512 KB (Konami SCC) - banco 02 (se ejecuta en 0x8000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x08000


; ----------------------------------------------------------------------
; Etiquetas que no caen en ninguna posicion emitida del listado
; (destinos fuera del binario o dentro de una instruccion).
; ----------------------------------------------------------------------
L_806F:	equ 0x0806f

; ======================================================================
; CODIGO 0x8000..0x800c  (12 bytes)
; ======================================================================


L_8000:
	push af			;8000
L_8001:
	ld ix,0cb80h		;8001
	ld a,(0cb20h)		;8005
	dec a			;8008
	call 0424dh		;8009   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_800C: 14 destinos del despachador p00:424D (call en p02:8009, el
;   indice en A): A97D, A9C2, AC58, 803C, B004, AA80, B380, B574, ADC0, AC8B,
;   AADA, B211, 803C, 803C; lo leen p02:8009 (28 bytes)
;   0x800c..0x8028  (28 bytes)
DATA_tabla_800C:
	defw 0a97dh,0a9c2h,0ac58h,0803ch,0b004h,0aa80h,0b380h,0b574h	; 800c
	defw 0adc0h,0ac8bh,0aadah,0b211h,0803ch,0803ch	; 801c

; ======================================================================
; CODIGO 0x8028..0x802c  (4 bytes)
; ======================================================================


L_8028:
	dec a			;8028
	call 0424dh		;8029   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_802C: 8 destinos del despachador p00:424D (call en p02:8029, el
;   indice en A): A9BF, AA60, AD09, 803C, B056, AAB6, AD09, AB37; lo leen
;   p02:8029 (16 bytes)
;   0x802c..0x803c  (16 bytes)
DATA_tabla_802C:
	defw 0a9bfh,0aa60h,0ad09h,0803ch,0b056h,0aab6h,0ad09h,0ab37h	; 802c

; ======================================================================
; CODIGO 0x803c..0x80b4  (120 bytes)
; ======================================================================


L_803C:
	ret			;803c
L_803D:
	call 041a0h		;803d   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b066h		;8040   ; p06:B066
	jr L_804B		;8043
lee_mandos:		; pone el banco 6 y lee mando y teclas (p06:B0AD)
	call 041a0h		;8045   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b0adh		;8048   ; lee_mando_y_teclas: el mando a 0xCA08/0xCA07 y las teclas de funcion a 0xCA0A/0xCA09
L_804B:
	jp 040f0h		;804b   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
L_804E:
	call 04206h		;804e   ; bancos_30: pone el 30 en 0xA000 (con su copia en 0xC381-0xC383)
	ld hl,0d900h		;8051
	ld bc,000ffh		;8054
	ld a,0ffh		;8057
	call 04237h		;8059   ; llena_bloque: pone A en BC + 1 bytes desde HL
	ld a,(0ca76h)		;805c   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	ld c,a			;805f
	and a			;8060
	ld hl,0b8a5h		;8061
	ld a,(0ca4ah)		;8064   ; lee la zona
	jr z,L_806E		;8067
	ld hl,0ba18h		;8069
	ld a,c			;806c
	dec a			;806d
L_806E:
	call 043f6h		;806e   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ex de,hl			;8071
	ld c,000h		;8072
L_8074:
	ld a,(de)			;8074
	inc a			;8075
	jr z,L_8084		;8076
	ld a,(de)			;8078
	ld hl,0d900h		;8079
	call 0423eh		;807c   ; suma_a_hl: HL = HL + A
	ld (hl),c			;807f
	inc c			;8080
	inc de			;8081
	jr L_8074		;8082
L_8084:
	inc de			;8084
	ld a,(de)			;8085
	inc a			;8086
	jp z,040f0h		;8087   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	ld a,(de)			;808a
	ld hl,0d900h		;808b
	call 0423eh		;808e   ; suma_a_hl: HL = HL + A
	inc de			;8091
	ld a,(de)			;8092
	ld (hl),a			;8093
	jr L_8084		;8094
L_8096:
	call 07baah		;8096
	xor a			;8099
	ld (0d42eh),a		;809a
	ld (0d44fh),a		;809d
	ld (0d456h),a		;80a0
	ld (0d451h),a		;80a3
	dec a			;80a6
	ld (0d44ah),a		;80a7
	ld de,0ca50h		;80aa
	ld a,(0ca41h)		;80ad
	dec a			;80b0
	call 0424dh		;80b1   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_80B4: 4 destinos del despachador p00:424D (call en p02:80B1, el
;   indice en A): 80BC, 811E, 8169, 8171; lo leen p02:80B1 (8 bytes)
;   0x80b4..0x80bc  (8 bytes)
DATA_tabla_80B4:
	defw 080bch,0811eh,08169h,08171h	; 80b4  -> L_80BC L_811E L_8169 L_8171

; ======================================================================
; CODIGO 0x80bc..0x8212  (342 bytes)
; ======================================================================


L_80BC:
	ld a,(0ca4bh)		;80bc   ; lee la sala de la zona
	ld c,a			;80bf
	ld a,(0ca4ah)		;80c0   ; lee la zona
	ld b,a			;80c3
	cp 007h		;80c4
	jr z,L_80D9		;80c6
	cp 00fh		;80c8
	jr z,L_80ED		;80ca
	cp 00dh		;80cc
	jr nz,L_80F8		;80ce
	ld a,(0ca50h)		;80d0
	cp 004h		;80d3
	jr nz,L_80F8		;80d5
	jr L_8109		;80d7
L_80D9:
	ld a,(0ca22h)		;80d9   ; lee la fase de la partida (indice de las listas de p06:B40C)
	dec a			;80dc
	jr nz,L_80F8		;80dd
	ld a,(0d430h)		;80df
	cp 002h		;80e2
	jr nz,L_80F8		;80e4
	ld a,c			;80e6
	cp 00ah		;80e7
	jr z,L_8109		;80e9
	jr L_80F8		;80eb
L_80ED:
	ld a,(0ca22h)		;80ed   ; lee la fase de la partida (indice de las listas de p06:B40C)
	cp 004h		;80f0
	jr nc,L_80F8		;80f2
	ld a,c			;80f4
	and a			;80f5
	jr z,L_8109		;80f6
L_80F8:
	ld a,(0d430h)		;80f8
	cp 002h		;80fb
	jr nz,L_8117		;80fd
	ld a,b			;80ff
L_8100:
	cp 007h		;8100
	jr nz,L_8117		;8102
	ld a,c			;8104
	cp 00ch		;8105
	jr nz,L_8117		;8107
L_8109:
	ld a,001h		;8109
	ld (0d4e3h),a		;810b
	push de			;810e
	ld a,(0ca5fh)		;810f
	and a			;8112
	call z,07c77h		;8113   ; p12:7C77
	pop de			;8116
L_8117:
	ex de,hl			;8117
	inc (hl)			;8118
	call L_8181		;8119
	jr L_8177		;811c
L_811E:
	ld a,(0ca4bh)		;811e   ; lee la sala de la zona
	ld b,a			;8121
	ld a,(0ca4ah)		;8122   ; lee la zona
	cp 00fh		;8125
	jr z,L_815C		;8127
	cp 00dh		;8129
	jr z,L_8153		;812b
	cp 007h		;812d
	jr nz,L_814F		;812f
	ld a,(0ca22h)		;8131   ; lee la fase de la partida (indice de las listas de p06:B40C)
	dec a			;8134
	jr nz,L_814F		;8135
	ld a,b			;8137
	cp 00ch		;8138
	jr nz,L_814F		;813a
L_813C:
	xor a			;813c
	ld (0d4e3h),a		;813d
	ld a,(0d433h)		;8140
	and a			;8143
	jr nz,L_814F		;8144
	push de			;8146
	ld a,(0ca5fh)		;8147
	and a			;814a
	call z,07c77h		;814b
	pop de			;814e
L_814F:
	ex de,hl			;814f
	dec (hl)			;8150
	jr L_8177		;8151
L_8153:
	ld a,(0ca50h)		;8153
	cp 005h		;8156
	jr z,L_813C		;8158
	jr L_814F		;815a
L_815C:
	ld a,(0ca22h)		;815c   ; lee la fase de la partida (indice de las listas de p06:B40C)
	cp 004h		;815f
	jr nc,L_814F		;8161
	ld a,b			;8163
	and a			;8164
	jr z,L_813C		;8165
	jr L_814F		;8167
L_8169:
	ex de,hl			;8169
	inc hl			;816a
	dec (hl)			;816b
	call L_81A7		;816c
	jr L_8177		;816f
L_8171:
	ex de,hl			;8171
	inc hl			;8172
	inc (hl)			;8173
	call L_81D4		;8174
L_8177:
	ld a,(0ca76h)		;8177   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	and a			;817a
	jp nz,055cfh		;817b   ; entra_en_sala_especial: entra en una sala de 0xCA76 (0xD440 = 0)
	jp 052cfh		;817e   ; entra_en_sala: entra en la sala nueva (0xD440 = 0)
L_8181:
	ld a,(0ca4ah)		;8181   ; lee la zona
	and a			;8184
	ret nz			;8185
	ld a,(0ca50h)		;8186
	ld c,a			;8189
	sub 003h		;818a
	cp 002h		;818c
	ret nc			;818e
	ld a,c			;818f
	cp 003h		;8190
	ld b,001h		;8192
	jr z,L_8197		;8194
	inc b			;8196
L_8197:
	ld hl,0caadh		;8197
	ld a,(hl)			;819a
	cp b			;819b
	ret nc			;819c
	inc (hl)			;819d
	ld a,(hl)			;819e
	dec a			;819f
	ret nz			;81a0
	ld hl,0d7d0h		;81a1
	set 3,(hl)		;81a4
	ret			;81a6
L_81A7:
	ld a,(0ca4ah)		;81a7   ; lee la zona
	ld b,a			;81aa
	sub 00dh		;81ab
	cp 004h		;81ad
	ret nc			;81af
	ld a,(0ca4bh)		;81b0   ; lee la sala de la zona
	ld c,a			;81b3
	ld a,b			;81b4
	cp 010h		;81b5
	jr nz,L_81CF		;81b7
	ld hl,0ca43h		;81b9
	ld a,(hl)			;81bc
	and a			;81bd
	jr z,L_81CF		;81be
	ld a,c			;81c0
	cp 003h		;81c1
	jr nz,L_81CF		;81c3
	dec (hl)			;81c5
L_81C6:
	ld hl,0cc80h		;81c6
	ld bc,0007fh		;81c9
	jp 04236h		;81cc   ; borra_bloque: pone a cero BC + 1 bytes desde HL
L_81CF:
	ld hl,08212h		;81cf
	jr L_81F9		;81d2
L_81D4:
	ld a,(0ca4ah)		;81d4   ; lee la zona
	ld b,a			;81d7
	sub 00ch		;81d8
	cp 005h		;81da
	ret nc			;81dc
	ld a,(0ca4bh)		;81dd   ; lee la sala de la zona
	ld c,a			;81e0
	ld a,b			;81e1
	cp 010h		;81e2
	jr nz,L_81F6		;81e4
	ld hl,0ca43h		;81e6
	ld a,(hl)			;81e9
	cp 008h		;81ea
	jr z,L_81F6		;81ec
	ld a,c			;81ee
	cp 002h		;81ef
	jr nz,L_81F6		;81f1
	inc (hl)			;81f3
	jr L_81C6		;81f4
L_81F6:
	ld hl,08216h		;81f6
L_81F9:
	ld a,(hl)			;81f9
	inc a			;81fa
	ret z			;81fb
	ld a,(hl)			;81fc
	inc hl			;81fd
	cp b			;81fe
	jr nz,L_820E		;81ff
	ld a,(hl)			;8201
	inc hl			;8202
	cp c			;8203
	jr nz,L_820F		;8204
	ld a,(hl)			;8206
	push af			;8207
	call 07bf1h		;8208
	pop af			;820b
	ld (hl),a			;820c
	ret			;820d
L_820E:
	inc hl			;820e
L_820F:
	inc hl			;820f
	jr L_81F9		;8210

; ----------------------------------------------------------------------
; DATOS resto_8212: lo apuntan con el banco puesto p02:81CF (0x8212), p02:81F6
;   (0x8216); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p02:81CF, p02:81F6 (14 bytes)
;   0x8212..0x8220  (14 bytes)
DATA_resto_8212:
	defb 010h,003h,08ch,0ffh,00ch,002h,090h,00eh,002h,08fh,010h,002h,08dh,0ffh	; 8212  ..............

; ======================================================================
; CODIGO 0x8220..0x827a  (90 bytes)
; ======================================================================


L_8220:
	ld b,a			;8220
	cp 011h		;8221
	jr nc,L_8228		;8223
	ld b,012h		;8225
	ret			;8227
L_8228:
	cp 0c0h		;8228
	ret c			;822a
	ld b,0bfh		;822b
	ret			;822d
L_822E:
	ld b,a			;822e
	cp 009h		;822f
	jr nc,L_8236		;8231
	ld b,009h		;8233
	ret			;8235
L_8236:
	cp 0b8h		;8236
	ret c			;8238
	ld b,0b7h		;8239
	ret			;823b
L_823C:
	call 0418eh		;823c   ; bancos_56: pone el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	ld a,(0ca4ah)		;823f   ; lee la zona
	ld hl,0a713h		;8242
	call 04248h		;8245   ; byte_de_tabla: A = el byte A de la tabla de HL (y HL apunta a el)
	ld (0ca75h),a		;8248
	call 040f0h		;824b   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	ld a,(0ca76h)		;824e   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 002h		;8251
	ret nz			;8253
	ld a,05dh		;8254
	ret			;8256
L_8257:
	ld a,(0ca41h)		;8257
	dec a			;825a
	jr z,L_8274		;825b
	cp 002h		;825d
	ret nc			;825f
	ld hl,0827ah		;8260
	ld de,0ca50h		;8263
L_8266:
	ld a,(hl)			;8266
	ld b,a			;8267
	inc b			;8268
	ret z			;8269
	inc hl			;826a
	cp c			;826b
	jr z,L_8271		;826c
	inc hl			;826e
	jr L_8266		;826f
L_8271:
	ldi		;8271
	ret			;8273
L_8274:
	ld hl,0ca50h		;8274
	ld (hl),001h		;8277
	ret			;8279

; ----------------------------------------------------------------------
; DATOS resto_827A: lo apuntan con el banco puesto p02:8260 (0x827A); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p02:8260 (7 bytes)
;   0x827a..0x8281  (7 bytes)
DATA_resto_827A:
	defb 001h,005h,007h,005h,009h,009h,0ffh	; 827a

; ======================================================================
; CODIGO 0x8281..0x8409  (392 bytes)
; ======================================================================


L_8281:
	ld a,(0c383h)		;8281   ; lee la copia del banco de 0xA000
	push af			;8284
	call 041a0h		;8285   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0ab91h		;8288   ; p06:AB91
L_828B:
	pop af			;828b
	push af			;828c
	jp 041a3h		;828d
L_8290:
	ld a,(0c383h)		;8290   ; lee la copia del banco de 0xA000
	push af			;8293
	call 041a0h		;8294   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0abbbh		;8297   ; p06:ABBB
	jr L_828B		;829a
L_829C:
	ld a,(0ca42h)		;829c   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	jp 04452h		;829f   ; borra_pantalla_de: 0xC0 x 0xC0 puntos a 0 en la pagina A
L_82A2:
	call 06ddah		;82a2   ; p01:6DDA
	call L_850C		;82a5
	call L_82BA		;82a8
	call 06dcfh		;82ab   ; p01:6DCF
	call 0418eh		;82ae   ; bancos_56: pone el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	call L_831F		;82b1
	call 040f0h		;82b4   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	jp 0722ch		;82b7   ; p01:722C
L_82BA:
	call 0418eh		;82ba   ; bancos_56: pone el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	ld hl,0a03ch		;82bd   ; mosaico_A03C: un mosaico de 10 x 12 caracteres, un byte cada uno
	ld de,03030h		;82c0
	ld bc,00a0ch		;82c3
	call 050c4h		;82c6
	ld b,0ffh		;82c9
	call L_82F2		;82cb
	ld hl,0a0b4h		;82ce
L_82D1:
	ld a,(hl)			;82d1
	cp 0ffh		;82d2
	jp z,040f0h		;82d4   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	ld c,(hl)			;82d7
	inc hl			;82d8
	ld b,(hl)			;82d9
	inc hl			;82da
	ld e,(hl)			;82db
	inc hl			;82dc
	ld d,(hl)			;82dd
	inc hl			;82de
	ld a,(hl)			;82df
	inc hl			;82e0
	push af			;82e1
	push hl			;82e2
	ld l,c			;82e3
	ld h,b			;82e4
	ld bc,00808h		;82e5
	call L_82FB		;82e8
	pop hl			;82eb
	pop bc			;82ec
	call L_82F2		;82ed
	jr L_82D1		;82f0
L_82F2:
	push bc			;82f2
L_82F3:
	push bc			;82f3
	pop bc			;82f4
	djnz L_82F3		;82f5
	pop bc			;82f7
	djnz L_82F2		;82f8
	ret			;82fa
L_82FB:
	ld a,l			;82fb
	cp 050h		;82fc
	jr nz,L_8309		;82fe
	ld a,h			;8300
	cp 0e8h		;8301
	jr z,L_8315		;8303
	cp 0f0h		;8305
	jr z,L_8315		;8307
L_8309:
	ld a,(0ca42h)		;8309   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	rlca			;830c
	rlca			;830d
	rlca			;830e
	rlca			;830f
	or 0c8h		;8310
	jp 047edh		;8312   ; copia_rectangulo_logica: orden LMMM del VDP con la operacion logica de A
L_8315:
	ld a,(0ca42h)		;8315   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	rlca			;8318
	rlca			;8319
	or 003h		;831a
	jp 04767h		;831c   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
L_831F:
	ld hl,0a000h		;831f
	ld de,068a8h		;8322
	ld bc,00204h		;8325
	call 050c4h		;8328
	ld hl,0a008h		;832b
	ld de,084a8h		;832e
	ld bc,00201h		;8331
	call 050c4h		;8334
	ld hl,0a00ah		;8337
	ld de,090a8h		;833a
	ld bc,00205h		;833d
	call 050c4h		;8340
	ld hl,0a014h		;8343
	ld b,00ah		;8346
L_8348:
	push bc			;8348
	push hl			;8349
	ld d,(hl)			;834a
	inc hl			;834b
	ld e,(hl)			;834c
	inc hl			;834d
	ld a,(hl)			;834e
	inc hl			;834f
	ld l,(hl)			;8350
	ld h,a			;8351
	ld bc,00808h		;8352
	ld a,(0ca42h)		;8355   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	and 003h		;8358
	rlca			;835a
	rlca			;835b
	rlca			;835c
	rlca			;835d
	or 0c8h		;835e
	call 047edh		;8360   ; copia_rectangulo_logica: orden LMMM del VDP con la operacion logica de A
	pop hl			;8363
	ld de,00004h		;8364
	add hl,de			;8367
	pop bc			;8368
	djnz L_8348		;8369
	ret			;836b
L_836C:
	call 0418eh		;836c   ; bancos_56: pone el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	ld de,0ca4ch		;836f   ; apunta a los 4 bits altos del byte de la sala (p56:BD28)
	call L_838A		;8372
	ld de,0ca4dh		;8375   ; apunta a los 4 bits bajos del byte de la sala (p56:BD28)
	call L_838A		;8378
	call 040f0h		;837b   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	ld a,(0ca76h)		;837e   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 002h		;8381
	ret nz			;8383
	ld a,001h		;8384
	ld (0ca4eh),a		;8386
	ret			;8389
L_838A:
	ld a,(0ca4ah)		;838a   ; lee la zona
	add a,a			;838d
	add a,a			;838e
	add a,a			;838f
	ld hl,0a727h		;8390
	call 0423eh		;8393   ; suma_a_hl: HL = HL + A
	ld a,(de)			;8396
	call 0423eh		;8397   ; suma_a_hl: HL = HL + A
	inc e			;839a
	inc e			;839b
	ld a,(hl)			;839c
	ld (de),a			;839d
	ret			;839e
L_839F:
	ld c,000h		;839f
	ld a,(0d430h)		;83a1
	cp 002h		;83a4
	jr nc,L_83C1		;83a6
	ld a,(0ca4ah)		;83a8   ; lee la zona
	cp 007h		;83ab
	jr nz,L_83C1		;83ad
	ld a,(0ca50h)		;83af
	dec a			;83b2
	cp 003h		;83b3
	jr nc,L_83C1		;83b5
	ld a,(0ca51h)		;83b7
	sub 005h		;83ba
	cp 002h		;83bc
	jr nc,L_83C1		;83be
	inc c			;83c0
L_83C1:
	ld a,c			;83c1
	ld (0caa9h),a		;83c2
	ret			;83c5
L_83C6:
	ld b,000h		;83c6
	ld a,(0ca4ah)		;83c8   ; lee la zona
	cp 004h		;83cb
	jr nz,L_83D7		;83cd
	ld a,(0ca4bh)		;83cf   ; lee la sala de la zona
	cp 009h		;83d2
	jr nz,L_83D7		;83d4
	inc b			;83d6
L_83D7:
	ld a,b			;83d7
	ld (0ca67h),a		;83d8
	ret			;83db
L_83DC:
	ld a,(0ca77h)		;83dc
	and a			;83df
	ret nz			;83e0
	ld a,(0ca4ah)		;83e1   ; lee la zona
	dec a			;83e4
	ld d,a			;83e5
	cp 006h		;83e6
	ret nc			;83e8
	ld bc,(0ca50h)		;83e9
	ld a,b			;83ed
	cp 007h		;83ee
	ret nz			;83f0
	ld a,c			;83f1
	cp 003h		;83f2
	ret nz			;83f4
	ld a,d			;83f5
	ld hl,08409h		;83f6
	call 043f6h		;83f9   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld de,05888h		;83fc
	ld a,l			;83ff
	call 04a8ch		;8400   ; pieza_de_sala_transparente: el caracter A de la sala, con el 0 transparente, a la otra pagina
	ld d,060h		;8403
	ld a,h			;8405
	jp 04a8ch		;8406   ; pieza_de_sala_transparente: el caracter A de la sala, con el 0 transparente, a la otra pagina

; ----------------------------------------------------------------------
; DATOS resto_8409: lo apuntan con el banco puesto p02:83F6 (0x8409); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p02:83F6 (12 bytes)
;   0x8409..0x8415  (12 bytes)
DATA_resto_8409:
	defb 097h,095h,098h,095h,099h,095h,09ah,095h,096h,097h,096h,098h	; 8409  ............

; ======================================================================
; CODIGO 0x8415..0x851e  (265 bytes)
; ======================================================================


L_8415:
	ld a,(0cb80h)		;8415
	ld hl,0cb80h		;8418
	ld bc,0005fh		;841b
	call 04236h		;841e   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	cp 008h		;8421
	ret nz			;8423
	jp 06a6bh		;8424   ; p01:6A6B
L_8427:
	xor a			;8427
	ld (0ca42h),a		;8428   ; guarda la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	ld (0cafbh),a		;842b
	call 045fdh		;842e   ; pantalla_limpia: la pantalla apagada, la pagina 0 borrada y otra vez encendida
	ld bc,00007h		;8431
	call 04522h		;8434   ; registro_vdp: escribe B en el registro C del VDP
	call 04201h		;8437   ; bancos_47: pone el 47 en 0xA000 (con su copia en 0xC381-0xC383)
	ld de,0aad9h		;843a   ; tabla_colores_AAD9: 3 punteros a colores de dibujo
	ld hl,0aae7h		;843d   ; lista_AAE7: 8 fichas de dibujo de 5 bytes [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF
	call 04d4ah		;8440   ; dibujos_en_0000: en la VRAM de 0x0000
	ld a,055h		;8443
	ld (0ca75h),a		;8445
	ld hl,00100h		;8448
	ld (0ca4ch),hl		;844b   ; guarda los 4 bits altos del byte de la sala (p56:BD28) y el byte siguiente (16 bits)
	ld d,h			;844e
	call 04be4h		;844f   ; borra_toda_la_pagina: p00:46FF desde (0,0) con BC = 0 y A = 0 en la pagina D
	ld d,l			;8452
	ld e,l			;8453
	ld hl,0bd48h		;8454
	ld bc,00a1bh		;8457
	call 06d8ah		;845a   ; p01:6D8A
	call L_8502		;845d
	call 0418eh		;8460   ; bancos_56: pone el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	ld hl,0bc23h		;8463
	call 0463fh		;8466
	call 040f0h		;8469   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	jp 06dbbh		;846c   ; p01:6DBB
L_846F:
	call L_8475		;846f
	jp 041cah		;8472   ; bancos_1_2_10: pone el 1 en 0x6000, el 2 en 0x8000, el 10 en 0xA000 (con su copia en 0xC381-0xC383)
L_8475:
	call L_8502		;8475
	ld a,(0ca65h)		;8478
	or a			;847b
	jp nz,L_84FA		;847c
	call 0418eh		;847f   ; bancos_56: pone el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	ld a,(0ca76h)		;8482   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	and a			;8485
	jr nz,L_84C7		;8486
	ld hl,0e740h		;8488
	ld a,(0ca4bh)		;848b   ; lee la sala de la zona
	ld d,a			;848e
	call 0423eh		;848f   ; suma_a_hl: HL = HL + A
	ld b,(hl)			;8492
	ld a,(0ca4ah)		;8493   ; lee la zona
	ld c,a			;8496
	ld hl,0b76fh		;8497
	call 043f6h		;849a   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld a,b			;849d
	call 043f6h		;849e   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld a,c			;84a1
	and a			;84a2
	jr nz,L_84B9		;84a3
	ld a,d			;84a5
	cp 00ah		;84a6
	jr nc,L_84B9		;84a8
	ld a,(0caadh)		;84aa
	and a			;84ad
	jr z,L_84B9		;84ae
	ld hl,0b9a4h		;84b0
	dec a			;84b3
	jr z,L_84B9		;84b4
	ld hl,0b9b7h		;84b6
L_84B9:
	call 0463fh		;84b9
	call 040f0h		;84bc   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	ld a,(0cadfh)		;84bf
	or a			;84c2
	ret z			;84c3
	jp 06df4h		;84c4   ; p01:6DF4
L_84C7:
	ld a,(0ca76h)		;84c7   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	ld hl,0b8a0h		;84ca
	call 043f6h		;84cd   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	call 0463fh		;84d0
	ld a,(0ca4bh)		;84d3   ; lee la sala de la zona
	dec a			;84d6
	jp nz,040f0h		;84d7   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	ld a,(0ca76h)		;84da   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 018h		;84dd
	jr z,L_84EB		;84df
	cp 039h		;84e1
	jp nz,040f0h		;84e3   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	ld hl,0bb35h		;84e6
	jr L_84EE		;84e9
L_84EB:
	ld hl,0babeh		;84eb
L_84EE:
	call 0463fh		;84ee   ; p00:463F
	jp 040f0h		;84f1   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
L_84F4:
	call L_84FA		;84f4
	jp 041bdh		;84f7   ; bancos_8: pone el 8 en 0xA000 (con su copia en 0xC381-0xC383)
L_84FA:
	ld hl,0b98ah		;84fa
L_84FD:
	call 0418eh		;84fd   ; bancos_56: pone el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	jr L_84EE		;8500
L_8502:
	ld hl,0b945h		;8502
	jr L_84FD		;8505
L_8507:
	ld hl,0b914h		;8507
	jr L_84FD		;850a
L_850C:
	ld hl,0bc3ch		;850c
	jr L_84FD		;850f
L_8511:
	ld hl,0b97dh		;8511
	jr L_84FD		;8514
L_8516:
	ld hl,0851eh		;8516
	call 043f6h		;8519   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	jr L_84FD		;851c

; ----------------------------------------------------------------------
; DATOS resto_851E: lo apuntan con el banco puesto p02:8516 (0x851E); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p02:8516 (6 bytes)
;   0x851e..0x8524  (6 bytes)
DATA_resto_851E:
	defb 09eh,0bch,06dh,0bch,09eh,0bch	; 851e

; ======================================================================
; CODIGO 0x8524..0x8ca2  (1918 bytes)
; ======================================================================


L_8524:
	ld hl,0bbf2h		;8524
	jr L_852C		;8527
L_8529:
	ld hl,0bc9eh		;8529
L_852C:
	call 0418eh		;852c   ; bancos_56: pone el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0463fh		;852f
	jp 041adh		;8532   ; bancos_1_2_7: pone el 1 en 0x6000, el 2 en 0x8000, el 7 en 0xA000 (con su copia en 0xC381-0xC383)
L_8535:
	call L_8559		;8535
	call 050a0h		;8538
	call L_8541		;853b
	jp 041c2h		;853e   ; bancos_1_2_9: pone el 1 en 0x6000, el 2 en 0x8000, el 9 en 0xA000 (con su copia en 0xC381-0xC383)
L_8541:
	call L_8559		;8541
	jp 062b1h		;8544
L_8547:
	call L_854D		;8547
	jp 041c5h		;854a   ; bancos_9: pone el 9 en 0xA000 (con su copia en 0xC381-0xC383)
L_854D:
	call L_8559		;854d
	call 050a6h		;8550   ; p00:50A6
	call L_8541		;8553
	jp 040f0h		;8556   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
L_8559:
	call 0418eh		;8559   ; bancos_56: pone el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	ld hl,0ae3bh		;855c
	ld de,06040h		;855f
	ld bc,00605h		;8562
	ret			;8565
L_8566:
	call 0418eh		;8566   ; bancos_56: pone el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	ld hl,0ae59h		;8569   ; mosaico_AE59: un mosaico de 5 x 12 caracteres, un byte cada uno
	ld de,04800h		;856c
	ld bc,0050ch		;856f
	call 05100h		;8572
	jp 041c2h		;8575   ; bancos_1_2_9: pone el 1 en 0x6000, el 2 en 0x8000, el 9 en 0xA000 (con su copia en 0xC381-0xC383)
L_8578:
	call 041fch		;8578   ; bancos_37: pone el 37 en 0xA000 (con su copia en 0xC381-0xC383)
	ld de,0b809h		;857b   ; tabla_colores_B809: 14 punteros a colores de dibujo
	ld hl,0b845h		;857e   ; lista_B845: 22 fichas de dibujo de 5 bytes [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF
	call 04d56h		;8581   ; dibujos_en_6000: en la VRAM de 0x6000
	jp 041adh		;8584   ; bancos_1_2_7: pone el 1 en 0x6000, el 2 en 0x8000, el 7 en 0xA000 (con su copia en 0xC381-0xC383)
L_8587:
	call L_8593		;8587
	jp 040f0h		;858a   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
L_858D:
	call L_8593		;858d
	jp 041c2h		;8590   ; bancos_1_2_9: pone el 1 en 0x6000, el 2 en 0x8000, el 9 en 0xA000 (con su copia en 0xC381-0xC383)
L_8593:
	call 041fch		;8593   ; bancos_37: pone el 37 en 0xA000 (con su copia en 0xC381-0xC383)
	ld de,0b34ah		;8596   ; rachas_B34A: datos en rachas a la VRAM
	ld hl,0e200h		;8599
	jr L_85EE		;859c
L_859E:
	call L_85B0		;859e
	jp 041c5h		;85a1   ; bancos_9: pone el 9 en 0xA000 (con su copia en 0xC381-0xC383)
L_85A4:
	call L_85B0		;85a4
	jp 041c2h		;85a7   ; bancos_1_2_9: pone el 1 en 0x6000, el 2 en 0x8000, el 9 en 0xA000 (con su copia en 0xC381-0xC383)
L_85AA:
	call L_85B0		;85aa
	jp 041cah		;85ad   ; bancos_1_2_10: pone el 1 en 0x6000, el 2 en 0x8000, el 10 en 0xA000 (con su copia en 0xC381-0xC383)
L_85B0:
	ld de,0b007h		;85b0
	call L_85B9		;85b3
	ld de,0af4ch		;85b6
L_85B9:
	call 041fch		;85b9   ; bancos_37: pone el 37 en 0xA000 (con su copia en 0xC381-0xC383)
	call 04534h		;85bc   ; rachas_otro_destino: la orden 0x80 de las rachas: [pagina][VRAM lo hi] y sigue
	jp 040f0h		;85bf   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
L_85C2:
	ld de,0b7a1h		;85c2
	jr L_85B9		;85c5
L_85C7:
	ld de,0b030h		;85c7
L_85CA:
	call 041fch		;85ca   ; bancos_37: pone el 37 en 0xA000 (con su copia en 0xC381-0xC383)
	call 04534h		;85cd   ; rachas_otro_destino: la orden 0x80 de las rachas: [pagina][VRAM lo hi] y sigue
	jp 041cah		;85d0   ; bancos_1_2_10: pone el 1 en 0x6000, el 2 en 0x8000, el 10 en 0xA000 (con su copia en 0xC381-0xC383)
L_85D3:
	ld de,0b04ah		;85d3
	jr L_85CA		;85d6
L_85D8:
	ld de,0b060h		;85d8
	jr L_85CA		;85db
L_85DD:
	call 041fch		;85dd   ; bancos_37: pone el 37 en 0xA000 (con su copia en 0xC381-0xC383)
	ld de,0b078h		;85e0   ; rachas_B078: datos en rachas a la VRAM
	jr L_85EB		;85e3
L_85E5:
	call 041fch		;85e5   ; bancos_37: pone el 37 en 0xA000 (con su copia en 0xC381-0xC383)
	ld de,0b159h		;85e8   ; rachas_B159: datos en rachas a la VRAM
L_85EB:
	ld hl,0e000h		;85eb
L_85EE:
	ld a,001h		;85ee
	call 0456eh		;85f0   ; rachas_a_vram_tal_cual: p00:453E sin voltear (C = 0)
	jp 041cah		;85f3   ; bancos_1_2_10: pone el 1 en 0x6000, el 2 en 0x8000, el 10 en 0xA000 (con su copia en 0xC381-0xC383)
L_85F6:
	call 041fch		;85f6   ; bancos_37: pone el 37 en 0xA000 (con su copia en 0xC381-0xC383)
	ld de,0b1e6h		;85f9   ; rachas_B1E6: datos en rachas a la VRAM
	jr L_85EB		;85fc
L_85FE:
	call 041fch		;85fe   ; bancos_37: pone el 37 en 0xA000 (con su copia en 0xC381-0xC383)
	ld de,0b2d5h		;8601
	call 04534h		;8604   ; rachas_otro_destino: la orden 0x80 de las rachas: [pagina][VRAM lo hi] y sigue
	call 041cah		;8607   ; bancos_1_2_10: pone el 1 en 0x6000, el 2 en 0x8000, el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	ld hl,0f800h		;860a
	ld de,0f890h		;860d
	ld c,004h		;8610
	jp 0457ah		;8612   ; voltea_en_vram: C patrones de 16 x 16 en espejo de la VRAM de HL a la de DE
L_8615:
	call L_8621		;8615
	jp 041cah		;8618   ; bancos_1_2_10: pone el 1 en 0x6000, el 2 en 0x8000, el 10 en 0xA000 (con su copia en 0xC381-0xC383)
L_861B:
	ld a,(0d7dah)		;861b
	bit 6,a		;861e
	ret z			;8620
L_8621:
	ld a,(0ca4ah)		;8621   ; lee la zona
	cp 012h		;8624
	ret nz			;8626
	ld a,(0ca4bh)		;8627   ; lee la sala de la zona
	cp 00ch		;862a
	ret nc			;862c
	call 04201h		;862d   ; bancos_47: pone el 47 en 0xA000 (con su copia en 0xC381-0xC383)
	ld de,0bf13h		;8630
	call 04534h		;8633   ; rachas_otro_destino: la orden 0x80 de las rachas: [pagina][VRAM lo hi] y sigue
	ld de,0be56h		;8636
	call 04534h		;8639   ; rachas_otro_destino: la orden 0x80 de las rachas: [pagina][VRAM lo hi] y sigue
	push ix		;863c
	ld ix,0bf0ah		;863e
	call 05223h		;8642   ; fichas_de_sprites: fichas de 4 bytes [orden][cuantos][patron de origen][de destino] hasta una orden 0: 1 da la vuelta de arriba abajo, las demas en espejo
	pop ix		;8645
	jp 040f0h		;8647   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
L_864A:
	call 041fch		;864a   ; bancos_37: pone el 37 en 0xA000 (con su copia en 0xC381-0xC383)
	ld de,0b3a6h		;864d
	call 04534h		;8650   ; rachas_otro_destino: la orden 0x80 de las rachas: [pagina][VRAM lo hi] y sigue
	jp 041c2h		;8653   ; bancos_1_2_9: pone el 1 en 0x6000, el 2 en 0x8000, el 9 en 0xA000 (con su copia en 0xC381-0xC383)
L_8656:
	ld b,000h		;8656
L_8658:
	push af			;8658
	ld a,b			;8659
	ld (0caceh),a		;865a
	pop af			;865d
	call 041bdh		;865e   ; bancos_8: pone el 8 en 0xA000 (con su copia en 0xC381-0xC383)
	call L_8667		;8661
	jp 040f0h		;8664   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
L_8667:
	ld (0ca5eh),a		;8667
	call L_86C3		;866a
	ld a,(0ca5ch)		;866d
	ld e,a			;8670
	ld a,(0caceh)		;8671
	and a			;8674
	jr nz,L_8691		;8675
	ld a,r		;8677
	ld b,a			;8679
	and 007h		;867a
	bit 6,b		;867c
	jr z,L_8689		;867e
	ld b,a			;8680
	ld a,c			;8681
	sub b			;8682
	jr nc,L_8686		;8683
	xor a			;8685
L_8686:
	ld e,a			;8686
	jr L_8691		;8687
L_8689:
	add a,e			;8689
	cp 03fh		;868a
	jr c,L_8690		;868c
	ld a,03fh		;868e
L_8690:
	ld e,a			;8690
L_8691:
	ld d,000h		;8691
	ld a,e			;8693
	sub 03fh		;8694
	neg		;8696
	ld hl,0bf7dh		;8698
	push hl			;869b
	add hl,de			;869c
	ld c,(hl)			;869d
	pop hl			;869e
	ld e,a			;869f
	add hl,de			;86a0
	ld a,(hl)			;86a1
	ld (0ca59h),a		;86a2
	ld e,c			;86a5
	call L_8707		;86a6
	ld a,(0ca5ah)		;86a9
	and a			;86ac
	call nz,04442h		;86ad   ; de_negativo: DE = -DE
	push de			;86b0
	ld a,(0ca59h)		;86b1
	ld e,a			;86b4
	call L_8707		;86b5
	ld a,(0ca5bh)		;86b8
	and a			;86bb
	call nz,04442h		;86bc   ; de_negativo: DE = -DE
	ld h,d			;86bf
	ld l,e			;86c0
	pop de			;86c1
	ret			;86c2
L_86C3:
	ld a,h			;86c3
	push af			;86c4
	ld a,l			;86c5
	ld hl,0ca5ah		;86c6
	ld (hl),000h		;86c9
	sub e			;86cb
	jr nc,L_86D1		;86cc
	neg		;86ce
	inc (hl)			;86d0
L_86D1:
	inc hl			;86d1
	ld (hl),000h		;86d2
	and 0f0h		;86d4
	ld e,a			;86d6
	pop af			;86d7
	sub d			;86d8
	jr nc,L_86DE		;86d9
	neg		;86db
	inc (hl)			;86dd
L_86DE:
	ld d,a			;86de
	ld a,d			;86df
	rra			;86e0
	rra			;86e1
	rra			;86e2
	rra			;86e3
	and 00fh		;86e4
	add a,e			;86e6
	ld hl,0be7dh		;86e7
	call 04248h		;86ea   ; byte_de_tabla: A = el byte A de la tabla de HL (y HL apunta a el)
	ld (0ca5ch),a		;86ed
	ld c,a			;86f0
	ld hl,(0ca5ah)		;86f1
	ld a,h			;86f4
	ld b,000h		;86f5
	and a			;86f7
	jr z,L_86FC		;86f8
	ld b,080h		;86fa
L_86FC:
	cp l			;86fc
	ld a,c			;86fd
	jr z,L_8702		;86fe
	neg		;8700
L_8702:
	add a,b			;8702
	ld (0ca5dh),a		;8703
	ret			;8706
L_8707:
	ld a,(0ca5eh)		;8707
	ld h,a			;870a
	call L_8719		;870b
	xor a			;870e
	add hl,hl			;870f
	adc a,a			;8710
	add hl,hl			;8711
	adc a,a			;8712
	add hl,hl			;8713
	adc a,a			;8714
	ld l,h			;8715
	ld h,a			;8716
	ex de,hl			;8717
	ret			;8718
L_8719:
	ld b,008h		;8719
	ld l,000h		;871b
	ld d,l			;871d
L_871E:
	add hl,hl			;871e
	jr nc,L_8722		;871f
	add hl,de			;8721
L_8722:
	djnz L_871E		;8722
	ret			;8724
L_8725:
	call 041bdh		;8725   ; bancos_8: pone el 8 en 0xA000 (con su copia en 0xC381-0xC383)
	call L_872E		;8728
	jp 040f0h		;872b   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
L_872E:
	cp 018h		;872e
	jr c,L_8734		;8730
	sub 018h		;8732
L_8734:
	push af			;8734
	ld de,0bfbdh		;8735
	call 04403h		;8738   ; palabra_de_tabla_de: DE = la palabra A de la tabla de DE
	ld hl,00000h		;873b
	push bc			;873e
L_873F:
	add hl,de			;873f
	djnz L_873F		;8740
	pop bc			;8742
	pop af			;8743
	push hl			;8744
	ld de,0bfc9h		;8745
	call 04403h		;8748   ; palabra_de_tabla_de: DE = la palabra A de la tabla de DE
	ld hl,00000h		;874b
L_874E:
	add hl,de			;874e
	djnz L_874E		;874f
	ex de,hl			;8751
	pop hl			;8752
	ret			;8753
L_8754:
	call 041a0h		;8754   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0aa49h		;8757   ; p06:AA49
	jp 040f0h		;875a   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
L_875D:
	ld a,01eh		;875d
	ld (0d417h),a		;875f
	ld hl,0ce00h		;8762
	ld bc,005ffh		;8765
	jp 04236h		;8768   ; borra_bloque: pone a cero BC + 1 bytes desde HL
L_876B:
	call 0418eh		;876b   ; bancos_56: pone el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	call L_877F		;876e
L_8771:
	call 040f0h		;8771   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	jp 041efh		;8774   ; bancos_14: pone el 14 en 0xA000 (con su copia en 0xC381-0xC383)
L_8777:
	call 0418eh		;8777   ; bancos_56: pone el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	call L_87AD		;877a
	jr L_8771		;877d
L_877F:
	ld a,(hl)			;877f
	cp 0ffh		;8780
	ret z			;8782
	ld a,(0ca76h)		;8783   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	or a			;8786
	jr nz,L_8795		;8787
	ld a,(0ca4bh)		;8789   ; lee la sala de la zona
	cp (hl)			;878c
	jr z,L_8795		;878d
	ld de,00006h		;878f
	add hl,de			;8792
	jr L_877F		;8793
L_8795:
	xor a			;8795
	ld (0ca6ah),a		;8796
	inc a			;8799
	ld (0ca68h),a		;879a
	inc hl			;879d
	push hl			;879e
	ld de,0ca6bh		;879f
	ld bc,00004h		;87a2
	ldir		;87a5
	ld a,(hl)			;87a7
	ld (0ca69h),a		;87a8
	pop hl			;87ab
	ld a,(hl)			;87ac
L_87AD:
	ld hl,0a53ah		;87ad
	call 043f6h		;87b0   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld ix,0e280h		;87b3
	ld b,001h		;87b7
L_87B9:
	ld a,(hl)			;87b9
	cp 0ffh		;87ba
	ret z			;87bc
	ld de,0a62eh		;87bd
	add a,a			;87c0
	add a,a			;87c1
	call 04243h		;87c2   ; suma_a_de: DE = DE + A
	ld a,(de)			;87c5
	ld (ix+003h),a		;87c6
	inc de			;87c9
	ld a,(de)			;87ca
	ld (ix+004h),a		;87cb
	inc de			;87ce
	ld a,(de)			;87cf
	ld (ix+005h),a		;87d0
	inc de			;87d3
	ld a,(de)			;87d4
	ld (ix+006h),a		;87d5
	ld a,b			;87d8
	ld (ix+000h),a		;87d9
	xor a			;87dc
	ld (ix+001h),a		;87dd
	inc hl			;87e0
	inc b			;87e1
	ld de,00008h		;87e2
	add ix,de		;87e5
	jr L_87B9		;87e7
L_87E9:
	call 0418eh		;87e9   ; bancos_56: pone el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	ld hl,0a67eh		;87ec
	call 04248h		;87ef   ; byte_de_tabla: A = el byte A de la tabla de HL (y HL apunta a el)
	jr L_8810		;87f2
L_87F4:
	call 0418eh		;87f4   ; bancos_56: pone el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	ld l,a			;87f7
	ld a,(0ca76h)		;87f8   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 011h		;87fb
	ld a,l			;87fd
	jr nz,L_880A		;87fe
	cp 02dh		;8800
	jr c,L_880A		;8802
	cp 030h		;8804
	jr nc,L_880A		;8806
	ld a,031h		;8808
L_880A:
	ld hl,0a6afh		;880a
	call 043f6h		;880d   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
L_8810:
	jp 040f0h		;8810   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
L_8813:
	ld a,(0d708h)		;8813
	ld hl,0a6afh		;8816
	jr L_8832		;8819
L_881B:
	ld a,(0d708h)		;881b
	ld hl,0cab6h		;881e
	bit 0,(hl)		;8821
	ld hl,0a6cbh		;8823
	jr z,L_8832		;8826
	cp 020h		;8828
	jr c,L_8832		;882a
	cp 023h		;882c
	jr nc,L_8832		;882e
	ld a,024h		;8830
L_8832:
	call 0418eh		;8832   ; bancos_56: pone el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	dec a			;8835
	call 043f6h		;8836   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	jp 041cah		;8839   ; bancos_1_2_10: pone el 1 en 0x6000, el 2 en 0x8000, el 10 en 0xA000 (con su copia en 0xC381-0xC383)
L_883C:
	call 041a0h		;883c   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	ld hl,0bdd2h		;883f
	call 043f6h		;8842   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	jr L_884A		;8845
L_8847:
	call 041a0h		;8847   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
L_884A:
	ld a,(0cab5h)		;884a
	call 043f6h		;884d   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	jr L_887B		;8850
L_8852:
	ld hl,0beach		;8852
L_8855:
	call 041a0h		;8855   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	ld a,(0cb0eh)		;8858
	dec a			;885b
	add a,a			;885c
	call 0423eh		;885d   ; suma_a_hl: HL = HL + A
	ld a,(0cb03h)		;8860
	ld b,a			;8863
	ld a,(0cb43h)		;8864
	add a,b			;8867
	add a,(hl)			;8868
	ld (ix+003h),a		;8869
	inc hl			;886c
	ld a,(0cb05h)		;886d
	add a,(hl)			;8870
	ld (ix+005h),a		;8871
	xor a			;8874
	ld (ix+002h),a		;8875
	ld (ix+004h),a		;8878
L_887B:
	jp 040f0h		;887b   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
L_887E:
	ld a,(0cb0eh)		;887e
L_8881:
	call 041a0h		;8881   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	dec a			;8884
	add a,a			;8885
	add a,a			;8886
	call 0423eh		;8887   ; suma_a_hl: HL = HL + A
	call 06406h		;888a   ; p01:6406
	ld bc,00004h		;888d
	ldir		;8890
	jr L_887B		;8892
L_8894:
	call 041a0h		;8894   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0aebbh		;8897   ; p06:AEBB
	jp 040f0h		;889a   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
L_889D:
	ld a,(0ca65h)		;889d
	and a			;88a0
	jp nz,L_8928		;88a1
	ld hl,0cbe0h		;88a4
	ld b,008h		;88a7
L_88A9:
	ld a,(hl)			;88a9
	and a			;88aa
	jr z,L_88B5		;88ab
	push hl			;88ad
	push bc			;88ae
	call L_88BD		;88af
	pop bc			;88b2
	pop hl			;88b3
	ret c			;88b4
L_88B5:
	ld a,004h		;88b5
	call 0423eh		;88b7   ; suma_a_hl: HL = HL + A
	djnz L_88A9		;88ba
	ret			;88bc
L_88BD:
	ld a,(0cb21h)		;88bd
	cp 00ah		;88c0
	ret z			;88c2
	ld a,(0cb0eh)		;88c3
	dec a			;88c6
	ret nz			;88c7
	ld b,(hl)			;88c8
	inc l			;88c9
	ld a,(0cb03h)		;88ca
	sub (hl)			;88cd
	cp 008h		;88ce
	ret nc			;88d0
	inc l			;88d1
	ld a,(0cb05h)		;88d2
	sub (hl)			;88d5
	cp 010h		;88d6
	ret nc			;88d8
	ld a,b			;88d9
	ld (0ca65h),a		;88da
	push af			;88dd
	call L_8982		;88de
	call 05488h		;88e1   ; marcador_y_ventana: con 0xCA5F puesto va por p00:549B
	call 0708eh		;88e4
	ld a,(0cb03h)		;88e7
	sub 020h		;88ea
	ld (0e204h),a		;88ec
	ld a,(0cb05h)		;88ef
	ld (0e205h),a		;88f2
	ld a,0aeh		;88f5
	ld (0cb03h),a		;88f7
	ld a,060h		;88fa
	ld (0cb05h),a		;88fc
	call 0b4d1h		;88ff
	ld a,012h		;8902
	ld (0ca4eh),a		;8904
	call L_8281		;8907
	call 059efh		;890a   ; limpia_sprites_y_d300:
	call L_84FA		;890d
	call 05437h		;8910   ; cambia_de_pagina: limpia los sprites...
	call 054a4h		;8913   ; copia_marcador: sin 0xCA5F, el marcador de una pagina a la otra
	call 05dbbh		;8916   ; p00:5DBB
	pop af			;8919
	call 041cdh		;891a   ; bancos_10: pone el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a0d3h		;891d
	call 040f0h		;8920   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call L_902A		;8923
	scf			;8926
	ret			;8927
L_8928:
	ld a,(0cb0fh)		;8928
	and a			;892b
	ret nz			;892c
	ld a,(0cb0eh)		;892d
	dec a			;8930
	dec a			;8931
	ret nz			;8932
	ld a,(0cb03h)		;8933
	sub 0b0h		;8936
	cp 008h		;8938
	ret nc			;893a
	ld a,(0cb05h)		;893b
	sub 038h		;893e
	cp 050h		;8940
	ret nc			;8942
	ld hl,0ca65h		;8943
	ld a,(hl)			;8946
	ld (hl),000h		;8947
	ld hl,0cbe0h		;8949
	ld b,008h		;894c
L_894E:
	cp (hl)			;894e
	jr z,L_8957		;894f
	inc hl			;8951
	inc hl			;8952
	inc hl			;8953
	inc hl			;8954
	djnz L_894E		;8955
L_8957:
	inc l			;8957
	ld a,(hl)			;8958
	add a,008h		;8959
	ld (0cb03h),a		;895b
	ld d,a			;895e
	inc l			;895f
	ld a,(hl)			;8960
	add a,00ch		;8961
	ld (0cb05h),a		;8963
	ld e,a			;8966
	ld a,(0d416h)		;8967
	ld (0d451h),a		;896a
	ld (0d452h),de		;896d
	call L_8982		;8971
	ld c,002h		;8974
	call L_8BE8		;8976
	call 04ccch		;8979
	call 059efh		;897c   ; limpia_sprites_y_d300:
	jp 052d2h		;897f   ; entra_en_sala_1: entra en la sala nueva con 0xD440 = 1
L_8982:
	xor a			;8982
	ld (0dff8h),a		;8983
	ld hl,0df80h		;8986
	ld bc,0003fh		;8989
	call 04236h		;898c   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	ld hl,0cb80h		;898f
	ld bc,0005fh		;8992
	jp 04236h		;8995   ; borra_bloque: pone a cero BC + 1 bytes desde HL
L_8998:
	ld a,(0d8a4h)		;8998
	and a			;899b
	ret nz			;899c
	ld bc,00200h		;899d
L_89A0:
	push ix		;89a0
	pop ix		;89a2
	dec bc			;89a4
	ld a,b			;89a5
	or c			;89a6
	jr nz,L_89A0		;89a7
	ret			;89a9
L_89AA:
	ld a,(0ca28h)		;89aa
	and a			;89ad
	jr nz,L_89C1		;89ae
	ld a,(0d434h)		;89b0
	and a			;89b3
	jr nz,L_89C1		;89b4
	ld a,(0cae7h)		;89b6
	and a			;89b9
	jr nz,L_89C1		;89ba
	ld a,(0cb3ch)		;89bc
	and a			;89bf
	ret z			;89c0
L_89C1:
	ld a,001h		;89c1
	ld (0cb14h),a		;89c3
	ret			;89c6
L_89C7:
	xor a			;89c7
	ld (0caf1h),a		;89c8
	ld (0d443h),a		;89cb
	ld (0caf6h),a		;89ce
	ret			;89d1
L_89D2:
	ld hl,0c690h		;89d2
	ld (hl),000h		;89d5
	jr L_8A12		;89d7
L_89D9:
	ld a,(0caf6h)		;89d9
	and a			;89dc
	jr nz,L_89EC		;89dd
	ld a,(0d443h)		;89df
	and a			;89e2
	jr z,L_89EC		;89e3
	ld a,(0c697h)		;89e5
	and a			;89e8
	call z,L_89C7		;89e9
L_89EC:
	ld hl,0c68eh		;89ec
	ld a,(hl)			;89ef
	dec a			;89f0
	jp z,L_8A7B		;89f1
L_89F4:
	ld hl,0c690h		;89f4
	ld a,(hl)			;89f7
	dec a			;89f8
	jr nz,L_8A32		;89f9
	ld (hl),a			;89fb
	ld a,(0caf5h)		;89fc
	cp 00ah		;89ff
	jr nz,L_8A12		;8a01
	ld hl,00000h		;8a03
	ld (0d668h),hl		;8a06
	ld hl,0d8a4h		;8a09
	call L_9319		;8a0c
	call 06c33h		;8a0f
L_8A12:
	call L_89C7		;8a12
	ld a,(0ca5fh)		;8a15
	cp 002h		;8a18
	jp nc,L_8A9A		;8a1a
	dec a			;8a1d
	jp z,079bch		;8a1e
	call 07ce6h		;8a21   ; rutina_de_fase: HL = la rutina de la zona en la lista de la fase 0xCA22 (p06:B40C)
	ld a,(0ca64h)		;8a24
	and a			;8a27
	jr z,L_8A2D		;8a28
	ld hl,06b89h		;8a2a
L_8A2D:
	ld (0ca19h),hl		;8a2d   ; guarda la musica pendiente: la rutina que la pide (16 bits)
	jr L_8A3D		;8a30
L_8A32:
	ld de,0ca18h		;8a32
	ld a,(de)			;8a35
	and a			;8a36
	ret nz			;8a37
	inc de			;8a38
	inc de			;8a39
	ld a,(de)			;8a3a
	and a			;8a3b
	ret z			;8a3c
L_8A3D:
	ld hl,(0ca19h)		;8a3d   ; lee la musica pendiente: la rutina que la pide (16 bits)
	ld de,00000h		;8a40
	ld (0ca19h),de		;8a43   ; guarda la musica pendiente: la rutina que la pide (16 bits)
	ld de,06a11h		;8a47
	call 00020h		;8a4a   ; BIOS DCOMPR - Compares HL with DE
	jr nz,L_8A5B		;8a4d
	ld de,06b89h		;8a4f
	ld (0ca19h),de		;8a52   ; guarda la musica pendiente: la rutina que la pide (16 bits)
	ld a,0b4h		;8a56
	ld (0ca18h),a		;8a58
L_8A5B:
	ld a,(0ca77h)		;8a5b
	and a			;8a5e
	jr nz,L_8A6F		;8a5f
	ld a,(0ca64h)		;8a61
	and a			;8a64
	jr nz,L_8A6F		;8a65
	ld a,(0ca76h)		;8a67   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 02ah		;8a6a
	call nz,06b12h		;8a6c
L_8A6F:
	push hl			;8a6f
	ld hl,0ca97h		;8a70   ; apunta a 1 si los mensajes salen de los bancos 50-51 y no de 48-49
	ld a,(hl)			;8a73
	and a			;8a74
	jr z,L_8A79		;8a75
	ld (hl),000h		;8a77
L_8A79:
	pop hl			;8a79
	jp (hl)			;8a7a
L_8A7B:
	xor a			;8a7b
	ld (hl),a			;8a7c
	ld a,(0d430h)		;8a7d
	dec a			;8a80
	jr z,L_8A8B		;8a81
	ld a,(0ca5fh)		;8a83
	cp 002h		;8a86
	jp c,L_89F4		;8a88
L_8A8B:
	ld hl,00000h		;8a8b
	ld (0ca19h),hl		;8a8e   ; guarda la musica pendiente: la rutina que la pide (16 bits)
	call L_89C7		;8a91
	ld a,(0d430h)		;8a94
	dec a			;8a97
	jr z,L_8AAF		;8a98
L_8A9A:
	call 0799bh		;8a9a   ; p01:799B
	jp c,06b7dh		;8a9d   ; p01:6B7D
	ld a,(0ca4ah)		;8aa0   ; lee la zona
	ld hl,06b61h		;8aa3
	cp 011h		;8aa6
	jr c,L_8A5B		;8aa8
	ld hl,06b79h		;8aaa
	jr L_8A5B		;8aad
L_8AAF:
	xor a			;8aaf
	ld (0d430h),a		;8ab0
	ld a,(0caa9h)		;8ab3
	and a			;8ab6
	jr z,L_8A9A		;8ab7
	ld hl,06b3dh		;8ab9
	jr L_8A5B		;8abc
L_8ABE:
	call 041cdh		;8abe   ; bancos_10: pone el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0bc27h		;8ac1   ; p10:BC27
	jr L_8ACC		;8ac4
L_8AC6:
	call 041b0h		;8ac6   ; bancos_7: pone el 7 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a000h		;8ac9   ; p07:A000
L_8ACC:
	jp 040f0h		;8acc   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
L_8ACF:
	call 041b0h		;8acf   ; bancos_7: pone el 7 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a009h		;8ad2   ; p07:A009
	jr L_8B4D		;8ad5
L_8AD7:
	call 041b0h		;8ad7   ; bancos_7: pone el 7 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a985h		;8ada   ; p07:A985
	jr L_8B4D		;8add
L_8ADF:
	call 041b0h		;8adf   ; bancos_7: pone el 7 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a996h		;8ae2   ; p07:A996
	jr L_8B4D		;8ae5
L_8AE7:
	call 041b0h		;8ae7   ; bancos_7: pone el 7 en 0xA000 (con su copia en 0xC381-0xC383)
	call L_9BDB		;8aea
	jr L_8B4D		;8aed
L_8AEF:
	call 041cdh		;8aef   ; bancos_10: pone el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a1c1h		;8af2   ; p10:A1C1
	jr L_8B4D		;8af5
L_8AF7:
	call 041cdh		;8af7   ; bancos_10: pone el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a234h		;8afa   ; p10:A234
	jr L_8B4D		;8afd
L_8AFF:
	call 041d5h		;8aff   ; bancos_11: pone el 11 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a3c4h		;8b02   ; p11:A3C4
	jr L_8B4D		;8b05
L_8B07:
	call 041d5h		;8b07   ; bancos_11: pone el 11 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a389h		;8b0a   ; p11:A389
	jr L_8B4D		;8b0d
L_8B0F:
	call 041c5h		;8b0f   ; bancos_9: pone el 9 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a000h		;8b12   ; p09:A000
	jr L_8B4D		;8b15
L_8B17:
	call 041c5h		;8b17   ; bancos_9: pone el 9 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a07bh		;8b1a   ; p09:A07B
	jr L_8B4D		;8b1d
L_8B1F:
	call 041c5h		;8b1f   ; bancos_9: pone el 9 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b68eh		;8b22   ; p09:B68E
	jr L_8B4D		;8b25
L_8B27:
	call 041d5h		;8b27   ; bancos_11: pone el 11 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0bbfbh		;8b2a   ; p11:BBFB
	jr L_8B4D		;8b2d
L_8B2F:
	call 041d5h		;8b2f   ; bancos_11: pone el 11 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0af47h		;8b32   ; p11:AF47
	jr L_8B4D		;8b35
L_8B37:
	call 041d5h		;8b37   ; bancos_11: pone el 11 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b056h		;8b3a   ; p11:B056
	jr L_8B4D		;8b3d
L_8B3F:
	call 041d5h		;8b3f   ; bancos_11: pone el 11 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0aee4h		;8b42   ; p11:AEE4
	jr L_8B4D		;8b45
L_8B47:
	call 041c5h		;8b47   ; bancos_9: pone el 9 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a163h		;8b4a   ; p09:A163
L_8B4D:
	jp 040f0h		;8b4d   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
L_8B50:
	call 041c5h		;8b50   ; bancos_9: pone el 9 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a588h		;8b53   ; p09:A588
	jr L_8B4D		;8b56
L_8B58:
	call 041c5h		;8b58   ; bancos_9: pone el 9 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a1a1h		;8b5b   ; p09:A1A1
	jr L_8B4D		;8b5e
L_8B60:
	call 041d5h		;8b60   ; bancos_11: pone el 11 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b23fh		;8b63   ; p11:B23F
	jr L_8B4D		;8b66
L_8B68:
	call 041d5h		;8b68   ; bancos_11: pone el 11 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0bd31h		;8b6b
	jr L_8B4D		;8b6e
L_8B70:
	call 041efh		;8b70   ; bancos_14: pone el 14 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b712h		;8b73
	jr L_8B4D		;8b76
L_8B78:
	call 041cdh		;8b78   ; bancos_10: pone el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a65eh		;8b7b   ; p10:A65E
	jr L_8B4D		;8b7e
L_8B80:
	call 041d5h		;8b80   ; bancos_11: pone el 11 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b494h		;8b83   ; p11:B494
	jr L_8B4D		;8b86
L_8B88:
	call 041d5h		;8b88   ; bancos_11: pone el 11 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b66eh		;8b8b   ; p11:B66E
	jr L_8B4D		;8b8e
L_8B90:
	call 041d5h		;8b90   ; bancos_11: pone el 11 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a000h		;8b93   ; p11:A000
	jr L_8B4D		;8b96
L_8B98:
	call 041d5h		;8b98   ; bancos_11: pone el 11 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a117h		;8b9b   ; p11:A117
	jr L_8B4D		;8b9e
L_8BA0:
	call 041b0h		;8ba0   ; bancos_7: pone el 7 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0ab44h		;8ba3   ; p07:AB44
	jr L_8B4D		;8ba6
L_8BA8:
	call 041d2h		;8ba8   ; bancos_1_2_11: pone el 1 en 0x6000, el 2 en 0x8000, el 11 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b9c1h		;8bab   ; p11:B9C1
	jr L_8B4D		;8bae
L_8BB0:
	call 041d2h		;8bb0   ; bancos_1_2_11: pone el 1 en 0x6000, el 2 en 0x8000, el 11 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0ba03h		;8bb3   ; p11:BA03
	jr L_8B4D		;8bb6
L_8BB8:
	call 041cdh		;8bb8   ; bancos_10: pone el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0bfbch		;8bbb   ; p10:BFBC
	jr L_8B4D		;8bbe
L_8BC0:
	call 041b0h		;8bc0   ; bancos_7: pone el 7 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b5afh		;8bc3
	jr L_8B4D		;8bc6
L_8BC8:
	call 041adh		;8bc8   ; bancos_1_2_7: pone el 1 en 0x6000, el 2 en 0x8000, el 7 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0aed1h		;8bcb   ; p07:AED1
	jr L_8BEE		;8bce
L_8BD0:
	call 041adh		;8bd0   ; bancos_1_2_7: pone el 1 en 0x6000, el 2 en 0x8000, el 7 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0af0dh		;8bd3   ; p07:AF0D
	jr L_8BEE		;8bd6
L_8BD8:
	call 041adh		;8bd8   ; bancos_1_2_7: pone el 1 en 0x6000, el 2 en 0x8000, el 7 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b6cch		;8bdb   ; p07:B6CC
	jr L_8BEE		;8bde
L_8BE0:
	call 041adh		;8be0   ; bancos_1_2_7: pone el 1 en 0x6000, el 2 en 0x8000, el 7 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b5cch		;8be3   ; p07:B5CC
	jr L_8BEE		;8be6
L_8BE8:
	call 041d5h		;8be8   ; bancos_11: pone el 11 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0bdbdh		;8beb   ; p11:BDBD
L_8BEE:
	jp 040f0h		;8bee   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
L_8BF1:
	call 041cdh		;8bf1   ; bancos_10: pone el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0bed4h		;8bf4
	call 0bc59h		;8bf7
	jr L_8BEE		;8bfa
L_8BFC:
	call 041a0h		;8bfc   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a6f9h		;8bff   ; p06:A6F9
	jr L_8BEE		;8c02
L_8C04:
	call 041c5h		;8c04   ; bancos_9: pone el 9 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b62fh		;8c07   ; p09:B62F
	jr L_8BEE		;8c0a
L_8C0C:
	call 041a0h		;8c0c   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a0abh		;8c0f   ; p06:A0AB
	jr L_8BEE		;8c12
L_8C14:
	call 041a0h		;8c14   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a598h		;8c17   ; p06:A598
	jr L_8BEE		;8c1a
L_8C1C:
	call 041cdh		;8c1c   ; bancos_10: pone el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0ba03h		;8c1f   ; p10:BA03
	jr L_8BEE		;8c22
L_8C24:
	call L_8A9A		;8c24
	jr L_8C2F		;8c27
L_8C29:
	call 040f0h		;8c29   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call L_8475		;8c2c
L_8C2F:
	jp 041c2h		;8c2f   ; bancos_1_2_9: pone el 1 en 0x6000, el 2 en 0x8000, el 9 en 0xA000 (con su copia en 0xC381-0xC383)
L_8C32:
	call 041cdh		;8c32   ; bancos_10: pone el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0bed4h		;8c35   ; p10:BED4
	call 0bc59h		;8c38   ; p10:BC59
	jr $+117		;8c3b
L_8C3D:
	call 04e22h		;8c3d   ; sprites_de_sala_si: con 0xE1D0 puesto no se tocan
	jr $+112		;8c40
L_8C42:
	call 040f0h		;8c42   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call L_9319		;8c45
	jr $+104		;8c48
L_8C4A:
	call 040f0h		;8c4a   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b563h		;8c4d   ; p03:B563
	jr $+96		;8c50
L_8C52:
	call 040f0h		;8c52   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b4e6h		;8c55   ; p03:B4E6
	jr $+88		;8c58
L_8C5A:
	call 040f0h		;8c5a   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b5b5h		;8c5d   ; p03:B5B5
	jr $+80		;8c60
L_8C62:
	call 040f0h		;8c62   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b593h		;8c65
	jr $+72		;8c68
L_8C6A:
	call 040f0h		;8c6a   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b4e0h		;8c6d
	jr $+64		;8c70
L_8C72:
	call 040f0h		;8c72   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b404h		;8c75   ; p03:B404
	jr $+56		;8c78
L_8C7A:
	call 040f0h		;8c7a   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b0dch		;8c7d   ; p03:B0DC
	jr $+48		;8c80
L_8C82:
	call 040f0h		;8c82   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b607h		;8c85   ; p03:B607
	jr $+40		;8c88
L_8C8A:
	call 040f0h		;8c8a   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b610h		;8c8d   ; p03:B610
	jr $+32		;8c90
L_8C92:
	call 040f0h		;8c92   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b603h		;8c95   ; p03:B603
	jr $+24		;8c98
L_8C9A:
	call 040f0h		;8c9a   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b5ffh		;8c9d   ; p03:B5FF
	jr $+16		;8ca0

; ----------------------------------------------------------------------
; DATOS sin identificar  0x8ca2..0x8caa  (8 bytes)
DATA_8CA2:
	defb 0cdh,0f0h,040h,0cdh,001h,0b6h,018h,006h	; 8ca2  ..@.....

; ======================================================================
; CODIGO 0x8caa..0x8cbb  (17 bytes)
; ======================================================================


L_8CAA:
	call 040f0h		;8caa   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b63eh		;8cad
L_8CB0:
	jp 041c5h		;8cb0   ; bancos_9: pone el 9 en 0xA000 (con su copia en 0xC381-0xC383)
L_8CB3:
	call 040f0h		;8cb3   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call L_9430		;8cb6
	jr L_8CB0		;8cb9

; ----------------------------------------------------------------------
; DATOS sin identificar  0x8cbb..0x8ccb  (16 bytes)
DATA_8CBB:
	defb 0cdh,0f0h,040h,0cdh,0c8h,0b6h,018h,0edh,0cdh,0f0h,040h,0cdh,08eh,0b6h,018h,0e5h	; 8cbb  ..@.......@.....

; ======================================================================
; CODIGO 0x8ccb..0x8cf5  (42 bytes)
; ======================================================================


L_8CCB:
	call L_8507		;8ccb
	jr $-30		;8cce
L_8CD0:
	call 040f0h		;8cd0   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b67dh		;8cd3
	jr $-38		;8cd6
L_8CD8:
	call 041cah		;8cd8   ; bancos_1_2_10: pone el 1 en 0x6000, el 2 en 0x8000, el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a6a4h		;8cdb   ; p10:A6A4
	jr $-46		;8cde
L_8CE0:
	call 041cah		;8ce0   ; bancos_1_2_10: pone el 1 en 0x6000, el 2 en 0x8000, el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a6c2h		;8ce3   ; p10:A6C2
	jr $-54		;8ce6
L_8CE8:
	call 040f0h		;8ce8   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b65dh		;8ceb   ; p03:B65D
	jr $-62		;8cee
L_8CF0:
	call 04cb8h		;8cf0   ; dibujos_de_sala: con 0xCA77 puesto, p02:8578
	jr $-67		;8cf3

; ----------------------------------------------------------------------
; DATOS sin identificar  0x8cf5..0x8d1d  (40 bytes)
DATA_8CF5:
	defb 0cdh,0f0h,040h,0cdh,0f6h,0b0h,018h,0b3h,0cdh,0f0h,040h,0cdh,00eh,07ch,018h,0abh	; 8cf5  ..@.......@..|..
	defb 0cdh,0f0h,040h,0cdh,020h,07ch,018h,0a3h,0cdh,0f0h,040h,0cdh,08bh,05bh,018h,09bh	; 8d05  ..@. |....@..[..
	defb 0cdh,0f0h,040h,0cdh,0e5h,057h,018h,093h	; 8d15  ..@..W..

; ======================================================================
; CODIGO 0x8d1d..0x8df0  (211 bytes)
; ======================================================================


L_8D1D:
	call 040f0h		;8d1d   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 057aeh		;8d20   ; pinta_mapa: pinta los 24 x 24 caracteres de 0xDD00
	jr $-115		;8d23
L_8D25:
	call 050e8h		;8d25
	jr $-120		;8d28
L_8D2A:
	call 041cah		;8d2a   ; bancos_1_2_10: pone el 1 en 0x6000, el 2 en 0x8000, el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0bce4h		;8d2d   ; p10:BCE4
	jr L_8D53		;8d30
L_8D32:
	call 052d2h		;8d32   ; entra_en_sala_1: entra en la sala nueva con 0xD440 = 1
	jr L_8D53		;8d35
L_8D37:
	call 052cfh		;8d37   ; entra_en_sala: entra en la sala nueva (0xD440 = 0)
	jr L_8D53		;8d3a
L_8D3C:
	call 04ccch		;8d3c
	jr L_8D53		;8d3f
L_8D41:
	call 055d2h		;8d41   ; entra_en_sala_especial_1: entra en una sala de 0xCA76 con 0xD440 = 1
	jr L_8D53		;8d44
L_8D46:
	call 05b78h		;8d46   ; lineas_c3_en_la_otra: p00:5F98 y las lineas de p00:439D en la otra pagina
	jr L_8D53		;8d49
L_8D4B:
	call L_804E		;8d4b
	jr L_8D53		;8d4e
L_8D50:
	call 05caeh		;8d50   ; mapas_de_bits_especiales: los mapas de bits de las salas especiales, desde 0x8C00 de la RAM
L_8D53:
	jp 041f4h		;8d53   ; bancos_1_2_15: pone el 1 en 0x6000, el 2 en 0x8000, el 15 en 0xA000 (con su copia en 0xC381-0xC383)
L_8D56:
	call 04279h		;8d56   ; rehace_marcador: el marcador: lineas, marco y barra de vida
	jr L_8D53		;8d59
L_8D5B:
	call 059a7h		;8d5b   ; cambia_de_zona: pasa a la zona A
	jr L_8D53		;8d5e
L_8D60:
	call 07c77h		;8d60
	jr L_8D53		;8d63
L_8D65:
	call 041d5h		;8d65   ; bancos_11: pone el 11 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0bdbdh		;8d68
	jr L_8D53		;8d6b
L_8D6D:
	call 041cdh		;8d6d   ; bancos_10: pone el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b9e5h		;8d70   ; p10:B9E5
	jr L_8D53		;8d73
L_8D75:
	call 040f0h		;8d75   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b4d1h		;8d78
	jr L_8D83		;8d7b
L_8D7D:
	call 040f0h		;8d7d   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b0f6h		;8d80
L_8D83:
	jp 041b0h		;8d83   ; bancos_7: pone el 7 en 0xA000 (con su copia en 0xC381-0xC383)
L_8D86:
	call 04cb8h		;8d86   ; dibujos_de_sala: con 0xCA77 puesto, p02:8578
	jr L_8D83		;8d89
L_8D8B:
	call 07c77h		;8d8b
	jr L_8DC3		;8d8e
L_8D90:
	call 040f0h		;8d90   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0bda5h		;8d93   ; p03:BDA5
	jr L_8DC3		;8d96
L_8D98:
	call 059a7h		;8d98   ; cambia_de_zona: pasa a la zona A
	jr L_8DC3		;8d9b
L_8D9D:
	call 041d5h		;8d9d   ; bancos_11: pone el 11 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0aee4h		;8da0
	jr L_8DC3		;8da3
L_8DA5:
	call 040f0h		;8da5   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0be51h		;8da8   ; p03:BE51
	jr L_8DC3		;8dab
L_8DAD:
	call 041cdh		;8dad   ; bancos_10: pone el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0bfbch		;8db0
	jr L_8DC3		;8db3
L_8DB5:
	call 040f0h		;8db5   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b1beh		;8db8
	jr L_8DC3		;8dbb
L_8DBD:
	call 040f0h		;8dbd   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0ac02h		;8dc0   ; p03:AC02
L_8DC3:
	jp 041adh		;8dc3   ; bancos_1_2_7: pone el 1 en 0x6000, el 2 en 0x8000, el 7 en 0xA000 (con su copia en 0xC381-0xC383)
L_8DC6:
	call 04288h		;8dc6   ; barras_de_vida: la barra de vida y, con 0xCA5F, p04:9889
	jr L_8DC3		;8dc9
L_8DCB:
	call 040f0h		;8dcb   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call L_9FE6		;8dce
	jr L_8DC3		;8dd1
L_8DD3:
	call 040f0h		;8dd3   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0bd82h		;8dd6   ; p03:BD82
	jr L_8DC3		;8dd9
L_8DDB:
	call 041d5h		;8ddb   ; bancos_11: pone el 11 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0bdbdh		;8dde
	jr L_8DC3		;8de1
L_8DE3:
	call 059a7h		;8de3   ; cambia_de_zona: pasa a la zona A
	jr $+24		;8de6
L_8DE8:
	call 040f0h		;8de8   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 06fd5h		;8deb
	jr $+16		;8dee

; ----------------------------------------------------------------------
; DATOS sin identificar  0x8df0..0x8dfe  (14 bytes)
DATA_8DF0:
	defb 0cdh,0f0h,040h,0cdh,003h,0b6h,018h,006h,0cdh,0f0h,040h,0cdh,03eh,0b6h	; 8df0  ..@.......@.>.

; ======================================================================
; CODIGO 0x8dfe..0x8e4b  (77 bytes)
; ======================================================================


L_8DFE:
	jp 041bah		;8dfe   ; bancos_1_2_8: pone el 1 en 0x6000, el 2 en 0x8000, el 8 en 0xA000 (con su copia en 0xC381-0xC383)
L_8E01:
	call 040f0h		;8e01   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b67dh		;8e04   ; p03:B67D
	jr L_8DFE		;8e07
L_8E09:
	call 040f0h		;8e09   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b6c8h		;8e0c   ; p03:B6C8
	jr L_8DFE		;8e0f
L_8E11:
	call 059a7h		;8e11   ; cambia_de_zona: pasa a la zona A
	jr $+88		;8e14
L_8E16:
	call 040f0h		;8e16   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b814h		;8e19   ; p03:B814
	jr $+80		;8e1c
L_8E1E:
	call 040f0h		;8e1e   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b8ach		;8e21   ; p03:B8AC
	jr $+72		;8e24
L_8E26:
	call 040f0h		;8e26   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b866h		;8e29
	jr $+64		;8e2c
L_8E2E:
	call 06e18h		;8e2e   ; p01:6E18
	jr $+59		;8e31
L_8E33:
	call 041f4h		;8e33   ; bancos_1_2_15: pone el 1 en 0x6000, el 2 en 0x8000, el 15 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a316h		;8e36   ; p15:A316
	jr $+51		;8e39
L_8E3B:
	call 040f0h		;8e3b   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 06fd5h		;8e3e
	jr $+43		;8e41
L_8E43:
	call 041a0h		;8e43   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0aeffh		;8e46   ; p06:AEFF
	jr $+35		;8e49

; ----------------------------------------------------------------------
; DATOS sin identificar  0x8e4b..0x8e63  (24 bytes)
DATA_8E4B:
	defb 0cdh,0f0h,040h,0cdh,04dh,092h,018h,019h,0cdh,0f0h,040h,0cdh,051h,0beh,018h,011h	; 8e4b  ..@.M.....@.Q...
	defb 0cdh,0d2h,041h,0cdh,001h,0a6h,018h,009h	; 8e5b  ..A.....

; ======================================================================
; CODIGO 0x8e63..0x8ec8  (101 bytes)
; ======================================================================


L_8E63:
	call 040f0h		;8e63   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 05f5fh		;8e66
	call 05f57h		;8e69   ; p00:5F57
L_8E6C:
	jp 041c2h		;8e6c   ; bancos_1_2_9: pone el 1 en 0x6000, el 2 en 0x8000, el 9 en 0xA000 (con su copia en 0xC381-0xC383)
L_8E6F:
	call 040f0h		;8e6f   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b3e8h		;8e72   ; p03:B3E8
	jr L_8E6C		;8e75
L_8E77:
	call 067cdh		;8e77
	jr L_8E6C		;8e7a
L_8E7C:
	call 067f5h		;8e7c
	jr L_8E6C		;8e7f
L_8E81:
	call 07c77h		;8e81
	jr L_8E6C		;8e84
L_8E86:
	call 040f0h		;8e86   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call L_84FA		;8e89
	jr L_8E6C		;8e8c
L_8E8E:
	call 041d5h		;8e8e   ; bancos_11: pone el 11 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0be0fh		;8e91   ; p11:BE0F
	jr L_8E6C		;8e94
L_8E96:
	call 041d5h		;8e96   ; bancos_11: pone el 11 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0be6bh		;8e99   ; p11:BE6B
	jr L_8E6C		;8e9c
L_8E9E:
	call 041d5h		;8e9e   ; bancos_11: pone el 11 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0be94h		;8ea1
	jr L_8E6C		;8ea4
L_8EA6:
	call 041d5h		;8ea6   ; bancos_11: pone el 11 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0bea2h		;8ea9   ; p11:BEA2
	jr L_8E6C		;8eac
L_8EAE:
	call 041d2h		;8eae   ; bancos_1_2_11: pone el 1 en 0x6000, el 2 en 0x8000, el 11 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0bf0fh		;8eb1   ; p11:BF0F
	jr L_8E6C		;8eb4
L_8EB6:
	call 07ce6h		;8eb6   ; rutina_de_fase: HL = la rutina de la zona en la lista de la fase 0xCA22 (p06:B40C)
	call 041c2h		;8eb9   ; bancos_1_2_9: pone el 1 en 0x6000, el 2 en 0x8000, el 9 en 0xA000 (con su copia en 0xC381-0xC383)
	ld (0ca20h),hl		;8ebc
	jp (hl)			;8ebf
L_8EC0:
	call 040f0h		;8ec0   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b4e0h		;8ec3
	jr $+15		;8ec6

; ----------------------------------------------------------------------
; DATOS sin identificar  0x8ec8..0x8ecd  (5 bytes)
DATA_8EC8:
	defb 0cdh,0a7h,059h,018h,008h	; 8ec8

; ======================================================================
; CODIGO 0x8ecd..0x8f05  (56 bytes)
; ======================================================================


L_8ECD:
	call 067cdh		;8ecd
	jr L_8ED5		;8ed0
L_8ED2:
	call 067f5h		;8ed2
L_8ED5:
	jp 041cah		;8ed5   ; bancos_1_2_10: pone el 1 en 0x6000, el 2 en 0x8000, el 10 en 0xA000 (con su copia en 0xC381-0xC383)
L_8ED8:
	call 04f97h		;8ed8   ; sprites_a_vram: los colores de los sprites (0xDA00) y detras sus atributos (0xDC00)...
	jr L_8ED5		;8edb
L_8EDD:
	call 040f0h		;8edd   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b1a3h		;8ee0
	jr L_8ED5		;8ee3
L_8EE5:
	call L_89D2		;8ee5
	jr L_8ED5		;8ee8
L_8EEA:
	call 040f0h		;8eea   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0af05h		;8eed
L_8EF0:
	jp 041a0h		;8ef0   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
L_8EF3:
	call 07c77h		;8ef3   ; p01:7C77
	jr L_8EF0		;8ef6
L_8EF8:
	call 040f0h		;8ef8   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call L_9DB1		;8efb
	jr $+13		;8efe
L_8F00:
	call 04e22h		;8f00   ; sprites_de_sala_si: con 0xE1D0 puesto no se tocan
	jr $+8		;8f03

; ----------------------------------------------------------------------
; DATOS sin identificar  0x8f05..0x8f0b  (6 bytes)
DATA_8F05:
	defb 0cdh,0f0h,040h,0cdh,005h,0afh	; 8f05

; ======================================================================
; CODIGO 0x8f0b..0x9292  (903 bytes)
; ======================================================================


L_8F0B:
	jp 041efh		;8f0b   ; bancos_14: pone el 14 en 0xA000 (con su copia en 0xC381-0xC383)
L_8F0E:
	call 040f0h		;8f0e   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call L_9319		;8f11
	jr L_8F60		;8f14
L_8F16:
	call 040f0h		;8f16   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 07f37h		;8f19
	jr L_8F60		;8f1c
L_8F1E:
	call 040f0h		;8f1e   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b1beh		;8f21   ; p03:B1BE
	jr L_8F60		;8f24
L_8F26:
	call 040f0h		;8f26   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b1f5h		;8f29
	jr L_8F60		;8f2c
L_8F2E:
	call 040f0h		;8f2e   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b3a6h		;8f31
	jr L_8F60		;8f34
L_8F36:
	call 040f0h		;8f36   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b289h		;8f39
	jr L_8F60		;8f3c
L_8F3E:
	call 040f0h		;8f3e   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b322h		;8f41
	jr L_8F60		;8f44
L_8F46:
	call 040f0h		;8f46   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 07f3dh		;8f49
	jr L_8F60		;8f4c
L_8F4E:
	call L_887E		;8f4e
	jr L_8F60		;8f51
L_8F53:
	call L_8881		;8f53
	jr L_8F60		;8f56
L_8F58:
	call L_8855		;8f58
	jr L_8F60		;8f5b
L_8F5D:
	call L_8852		;8f5d
L_8F60:
	jp 041d2h		;8f60   ; bancos_1_2_11: pone el 1 en 0x6000, el 2 en 0x8000, el 11 en 0xA000 (con su copia en 0xC381-0xC383)
L_8F63:
	call L_8725		;8f63
	jr L_8F60		;8f66
L_8F68:
	call 040f0h		;8f68   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b1bah		;8f6b
	jr L_8F60		;8f6e
L_8F70:
	call 040f0h		;8f70   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0af05h		;8f73
	jr L_8F60		;8f76
L_8F78:
	call 05f88h		;8f78
	jr L_8F60		;8f7b
L_8F7D:
	call 040f0h		;8f7d   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b19ah		;8f80
	jr L_8F60		;8f83
L_8F85:
	call 040f0h		;8f85   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b132h		;8f88
	jr L_8F60		;8f8b
L_8F8D:
	call 040f0h		;8f8d   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b11fh		;8f90
	jr L_8F60		;8f93
L_8F95:
	call 040f0h		;8f95   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0be60h		;8f98   ; p03:BE60
	jr L_8F60		;8f9b
L_8F9D:
	call 040f0h		;8f9d   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b108h		;8fa0   ; p03:B108
	jr L_8F60		;8fa3
L_8FA5:
	call 041b0h		;8fa5   ; bancos_7: pone el 7 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0bf5ch		;8fa8   ; p07:BF5C
	jr L_8F60		;8fab
L_8FAD:
	call 041b0h		;8fad   ; bancos_7: pone el 7 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0bb10h		;8fb0   ; p07:BB10
	jp 040f0h		;8fb3   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
L_8FB6:
	ld hl,0d770h		;8fb6
	ld bc,0000fh		;8fb9
	ld a,0ffh		;8fbc
	call 04237h		;8fbe   ; llena_bloque: pone A en BC + 1 bytes desde HL
	ld hl,0d771h		;8fc1
	ld (hl),020h		;8fc4
	ld hl,0d776h		;8fc6
	ld (hl),022h		;8fc9
	ld hl,0d77ah		;8fcb
	inc l			;8fce
	ld (hl),0a4h		;8fcf
	inc l			;8fd1
	ld (hl),021h		;8fd2
	ld hl,0d780h		;8fd4
	ld bc,00003h		;8fd7
	ld a,0ffh		;8fda
	jp 04237h		;8fdc   ; llena_bloque: pone A en BC + 1 bytes desde HL
L_8FDF:
	call 041a0h		;8fdf   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call L_914E		;8fe2
	ld a,(0ca4ah)		;8fe5   ; lee la zona
	cp 010h		;8fe8
	jr z,L_901E		;8fea
	ld hl,0b6d7h		;8fec
	call 043f6h		;8fef   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	call L_9009		;8ff2
	jp c,L_9001		;8ff5
	ld hl,0b7f2h		;8ff8
	call 043f6h		;8ffb   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	call L_9157		;8ffe
L_9001:
	call L_910C		;9001
	call L_924D		;9004
	jr L_9027		;9007
L_9009:
	ld a,(hl)			;9009
	cp 0ffh		;900a
	jr nz,L_9010		;900c
	scf			;900e
	ret			;900f
L_9010:
	ld a,(0ca4bh)		;9010   ; lee la sala de la zona
	cp (hl)			;9013
	jr z,L_901A		;9014
	inc hl			;9016
	inc hl			;9017
	jr L_9009		;9018
L_901A:
	inc hl			;901a
	ld a,(hl)			;901b
	and a			;901c
	ret			;901d
L_901E:
	ld hl,0bb03h		;901e
	call L_91BD		;9021
	call L_924D		;9024
L_9027:
	jp 040f0h		;9027   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
L_902A:
	call 041a0h		;902a   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call L_914E		;902d
	ld a,(0ca65h)		;9030
	or a			;9033
	ret z			;9034
	ld hl,0b6fdh		;9035
	call 043f6h		;9038   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	call L_9157		;903b
	call L_924D		;903e
	jr L_9027		;9041
L_9043:
	call 041a0h		;9043   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call L_914E		;9046
	ld a,(0ca76h)		;9049   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	dec a			;904c
	ld hl,0b719h		;904d
	call 043f6h		;9050   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	call L_917D		;9053
	call L_90FF		;9056
	call L_924D		;9059
	jr L_9027		;905c
L_905E:
	ld a,d			;905e
	and 0feh		;905f
	ld d,a			;9061
	ld a,e			;9062
	and 0feh		;9063
	ld e,a			;9065
	ld a,c			;9066
	cp 023h		;9067
	jr c,L_906F		;9069
	cp 02ah		;906b
	jr c,L_9076		;906d
L_906F:
	push de			;906f
	push bc			;9070
	call L_8FAD		;9071
	pop bc			;9074
	pop de			;9075
L_9076:
	push bc			;9076
	push de			;9077
	call L_90B9		;9078
	pop de			;907b
	pop bc			;907c
	call L_9084		;907d
	ret nc			;9080
	jp L_9248		;9081
L_9084:
	ld hl,0d7c0h		;9084
	ld b,004h		;9087
L_9089:
	ld a,(hl)			;9089
	or a			;908a
	jr z,L_9097		;908b
	push de			;908d
	ld de,00004h		;908e
	add hl,de			;9091
	pop de			;9092
	djnz L_9089		;9093
	and a			;9095
	ret			;9096
L_9097:
	push hl			;9097
	push bc			;9098
	ld (hl),c			;9099
	inc l			;909a
	ld (hl),e			;909b
	inc l			;909c
	ld (hl),d			;909d
	inc l			;909e
	ld a,c			;909f
	ld b,060h		;90a0
	cp 023h		;90a2
	jr z,L_90B4		;90a4
	ld b,061h		;90a6
	cp 024h		;90a8
	jr z,L_90B4		;90aa
	ld b,062h		;90ac
	cp 029h		;90ae
	jr z,L_90B4		;90b0
	ld b,03fh		;90b2
L_90B4:
	ld (hl),b			;90b4
	pop bc			;90b5
	pop hl			;90b6
	scf			;90b7
	ret			;90b8
L_90B9:
	ld a,(0ca76h)		;90b9   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 029h		;90bc
	jr z,L_90E4		;90be
	ld a,c			;90c0
	ld hl,0d770h		;90c1
	ld bc,0d780h		;90c4
	cp 023h		;90c7
	jr z,L_90D4		;90c9
	ld hl,0d775h		;90cb
	ld bc,0d782h		;90ce
	cp 029h		;90d1
	ret nz			;90d3
L_90D4:
	add a,080h		;90d4
	ld (hl),a			;90d6
	call L_90F9		;90d7
	ld a,(0ca4ah)		;90da   ; lee la zona
	ld (bc),a			;90dd
	inc c			;90de
	ld a,(0ca4bh)		;90df   ; lee la sala de la zona
	ld (bc),a			;90e2
	ret			;90e3
L_90E4:
	ld hl,0d77ah		;90e4
	ld a,(0ca50h)		;90e7
	rlca			;90ea
	rlca			;90eb
	rlca			;90ec
	rlca			;90ed
	and 0f0h		;90ee
	ld b,a			;90f0
	ld a,(0ca51h)		;90f1
	and 00fh		;90f4
	or b			;90f6
	ld (hl),a			;90f7
	inc l			;90f8
L_90F9:
	inc l			;90f9
	inc l			;90fa
	ld (hl),e			;90fb
	inc l			;90fc
	ld (hl),d			;90fd
	ret			;90fe
L_90FF:
	ld hl,0d77ah		;90ff
	ld a,(hl)			;9102
	cp 0ffh		;9103
	ret z			;9105
	ld de,0d7c0h		;9106
	jp L_918E		;9109
L_910C:
	call L_9128		;910c
	ret nc			;910f
	ld a,(hl)			;9110
	cp 0ffh		;9111
	ret z			;9113
	ld de,0d7c0h		;9114
	ld b,000h		;9117
L_9119:
	ld a,(de)			;9119
	or a			;911a
	jr z,L_9168		;911b
	inc b			;911d
	ld a,b			;911e
	cp 004h		;911f
	ret nc			;9121
	inc de			;9122
	inc de			;9123
	inc de			;9124
	inc de			;9125
	jr L_9119		;9126
L_9128:
	ld de,0d770h		;9128
	ld hl,0d780h		;912b
	ld b,002h		;912e
L_9130:
	push hl			;9130
	ld a,(0ca4ah)		;9131   ; lee la zona
	cp (hl)			;9134
	jr nz,L_9142		;9135
	inc l			;9137
	ld a,(0ca4bh)		;9138   ; lee la sala de la zona
	cp (hl)			;913b
	jr nz,L_9142		;913c
	pop hl			;913e
	ex de,hl			;913f
	scf			;9140
	ret			;9141
L_9142:
	pop hl			;9142
	inc l			;9143
	inc l			;9144
	inc e			;9145
	inc e			;9146
	inc e			;9147
	inc e			;9148
	inc e			;9149
	djnz L_9130		;914a
	and a			;914c
	ret			;914d
L_914E:
	ld hl,0d7c0h		;914e
	ld bc,0000fh		;9151
	jp 04236h		;9154   ; borra_bloque: pone a cero BC + 1 bytes desde HL
L_9157:
	ld de,0d7c0h		;9157
	ld b,000h		;915a
L_915C:
	ld a,(hl)			;915c
	cp 0ffh		;915d
	ret z			;915f
	push bc			;9160
	call L_9168		;9161
	pop bc			;9164
	inc b			;9165
	jr L_915C		;9166
L_9168:
	call L_91FB		;9168
	jr c,L_9179		;916b
L_916D:
	ld a,c			;916d
	ld (de),a			;916e
	ld a,b			;916f
	inc hl			;9170
	inc de			;9171
	ldi		;9172
	ldi		;9174
	ld (de),a			;9176
	inc de			;9177
	ret			;9178
L_9179:
	inc hl			;9179
	inc hl			;917a
	inc hl			;917b
	ret			;917c
L_917D:
	ld de,0d7c0h		;917d
	ld b,000h		;9180
L_9182:
	ld a,(hl)			;9182
	cp 0ffh		;9183
	ret z			;9185
	push bc			;9186
	call L_918E		;9187
	pop bc			;918a
	inc b			;918b
	jr L_9182		;918c
L_918E:
	call L_919A		;918e
	jr c,L_9179		;9191
	call L_91FB		;9193
	jr c,L_9179		;9196
	jr L_916D		;9198
L_919A:
	ld a,(hl)			;919a
	rra			;919b
	rra			;919c
	rra			;919d
	rra			;919e
	and 00fh		;919f
	ld b,a			;91a1
	ld a,(0ca50h)		;91a2
	cp b			;91a5
	jr nz,L_91B5		;91a6
	ld a,(hl)			;91a8
	and 00fh		;91a9
	ld b,a			;91ab
	ld a,(0ca51h)		;91ac
	cp b			;91af
	jr nz,L_91B5		;91b0
	inc hl			;91b2
	and a			;91b3
	ret			;91b4
L_91B5:
	inc hl			;91b5
	bit 7,(hl)		;91b6
	jr z,L_91BB		;91b8
	inc hl			;91ba
L_91BB:
	scf			;91bb
	ret			;91bc
L_91BD:
	ld de,0d7c0h		;91bd
	ld b,000h		;91c0
L_91C2:
	ld a,(hl)			;91c2
	cp 0ffh		;91c3
	ret z			;91c5
	push bc			;91c6
	call L_91CE		;91c7
	pop bc			;91ca
	inc b			;91cb
	jr L_91C2		;91cc
L_91CE:
	call L_91D9		;91ce
	ret c			;91d1
	call L_91FB		;91d2
	jr c,L_9179		;91d5
	jr L_916D		;91d7
L_91D9:
	ld a,(hl)			;91d9
	rra			;91da
	rra			;91db
	rra			;91dc
	rra			;91dd
	and 00fh		;91de
	ld b,a			;91e0
	ld a,(0ca43h)		;91e1
	cp b			;91e4
	jr nz,L_91F4		;91e5
	ld a,(hl)			;91e7
	and 00fh		;91e8
	ld b,a			;91ea
	ld a,(0ca4bh)		;91eb   ; lee la sala de la zona
	cp b			;91ee
	jr nz,L_91F4		;91ef
	inc hl			;91f1
	and a			;91f2
	ret			;91f3
L_91F4:
	inc hl			;91f4
	inc hl			;91f5
	inc hl			;91f6
	inc hl			;91f7
	inc hl			;91f8
	scf			;91f9
	ret			;91fa
L_91FB:
	ld a,(hl)			;91fb
	ld b,000h		;91fc
	bit 6,a		;91fe
	jr z,L_9204		;9200
	ld b,080h		;9202
L_9204:
	ld a,(hl)			;9204
	and 03fh		;9205
	ld c,a			;9207
	ld a,(hl)			;9208
	rla			;9209
	jr nc,L_922B		;920a
	push bc			;920c
	push de			;920d
	call L_921A		;920e
	pop de			;9211
	pop bc			;9212
	ret c			;9213
	ld a,(hl)			;9214
	or 040h		;9215
	or b			;9217
	ld b,a			;9218
	ret			;9219
L_921A:
	inc hl			;921a
	ld a,(hl)			;921b
	push hl			;921c
	call 040f0h		;921d   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b0feh		;9220   ; p03:B0FE
	call 041a0h		;9223   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	pop hl			;9226
	scf			;9227
	ret nz			;9228
	and a			;9229
	ret			;922a
L_922B:
	push bc			;922b
	push de			;922c
	call L_9237		;922d
	pop de			;9230
	pop bc			;9231
	ret c			;9232
	ld a,(hl)			;9233
	or b			;9234
	ld b,a			;9235
	ret			;9236
L_9237:
	inc hl			;9237
	ld a,(hl)			;9238
	push hl			;9239
	call 040f0h		;923a   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b103h		;923d   ; p03:B103
	call 041a0h		;9240   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	pop hl			;9243
	scf			;9244
	ret nz			;9245
	and a			;9246
	ret			;9247
L_9248:
	call L_9270		;9248
	jr $+103		;924b
L_924D:
	ld hl,0d7c0h		;924d
	ld b,004h		;9250
L_9252:
	ld a,(hl)			;9252
	or a			;9253
	jr z,L_9269		;9254
	push hl			;9256
	inc hl			;9257
	inc hl			;9258
	inc hl			;9259
	ld a,(hl)			;925a
	pop hl			;925b
	rla			;925c
	jr c,L_9269		;925d
	push hl			;925f
	push bc			;9260
	call L_9270		;9261
	call L_92B2		;9264
	pop bc			;9267
	pop hl			;9268
L_9269:
	ld de,00004h		;9269
	add hl,de			;926c
	djnz L_9252		;926d
	ret			;926f
L_9270:
	push hl			;9270
	call L_927C		;9271
	ld bc,02010h		;9274
	call 0474dh		;9277   ; copia_rectangulo_a_esta: p00:4767 de la otra pagina (0xCA42 ^ 1) a la de 0xCA42
	pop hl			;927a
	ret			;927b
L_927C:
	inc hl			;927c
	ld a,(hl)			;927d
	inc hl			;927e
	ld h,(hl)			;927f
	ld l,a			;9280
	push hl			;9281
	call L_9287		;9282
	pop hl			;9285
	ret			;9286
L_9287:
	ld a,b			;9287
	dec a			;9288
	ld hl,09292h		;9289
	call 043f6h		;928c   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld e,l			;928f
	ld d,h			;9290
	ret			;9291

; ----------------------------------------------------------------------
; DATOS resto_9292: lo apuntan con el banco puesto p02:9289 (0x9292); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p02:9289 (8 bytes)
;   0x9292..0x929a  (8 bytes)
DATA_resto_9292:
	defb 060h,0c0h,060h,0e0h,070h,0c0h,070h,0e0h	; 9292  `.`.p.p.

; ======================================================================
; CODIGO 0x929a..0x9520  (646 bytes)
; ======================================================================


L_929A:
	push af			;929a
	call L_927C		;929b
	ex de,hl			;929e
	ld bc,02010h		;929f
	pop af			;92a2
	jr c,L_92A8		;92a3
	jp 0475ah		;92a5   ; copia_rectangulo_a_la_otra: p00:4767 de la pagina 0xCA42 a la otra
L_92A8:
	ld h,d			;92a8
	ld l,e			;92a9
	ld a,(0ca42h)		;92aa   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	ld d,a			;92ad
	xor a			;92ae
	jp 046ffh		;92af   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
L_92B2:
	ld a,(hl)			;92b2
	inc hl			;92b3
	ld e,(hl)			;92b4
	inc hl			;92b5
	ld d,(hl)			;92b6
	ld bc,01010h		;92b7
	and 03fh		;92ba
	cp 003h		;92bc
	jr nc,L_92C2		;92be
	ld b,020h		;92c0
L_92C2:
	dec a			;92c2
	call L_87F4		;92c3
	ld a,(0ca42h)		;92c6   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	rlca			;92c9
	rlca			;92ca
	rlca			;92cb
	rlca			;92cc
	or 0c8h		;92cd
	jp 047edh		;92cf   ; copia_rectangulo_logica: orden LMMM del VDP con la operacion logica de A
L_92D2:
	call 040f0h		;92d2   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0beb7h		;92d5
L_92D8:
	jp 041cah		;92d8   ; bancos_1_2_10: pone el 1 en 0x6000, el 2 en 0x8000, el 10 en 0xA000 (con su copia en 0xC381-0xC383)
L_92DB:
	call 040f0h		;92db   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0beb2h		;92de
	jr L_92D8		;92e1
L_92E3:
	call 040f0h		;92e3   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0be60h		;92e6
	jr L_92D8		;92e9
L_92EB:
	call 040f0h		;92eb   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0be42h		;92ee
	jr L_92D8		;92f1
L_92F3:
	call 05dfdh		;92f3   ; repinta_la_sala: repinta la sala guardando los juegos de piezas de 0xCA4C-0xCA4D
	jr L_92D8		;92f6
L_92F8:
	call 041cah		;92f8   ; bancos_1_2_10: pone el 1 en 0x6000, el 2 en 0x8000, el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0aed6h		;92fb   ; p10:AED6
L_92FE:
	jp 040f0h		;92fe   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
L_9301:
	call 041cah		;9301   ; bancos_1_2_10: pone el 1 en 0x6000, el 2 en 0x8000, el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0af30h		;9304   ; p10:AF30
	jr L_92FE		;9307
L_9309:
	call 041cah		;9309   ; bancos_1_2_10: pone el 1 en 0x6000, el 2 en 0x8000, el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0aff3h		;930c   ; p10:AFF3
	jr L_92FE		;930f
L_9311:
	call 041cah		;9311   ; bancos_1_2_10: pone el 1 en 0x6000, el 2 en 0x8000, el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b172h		;9314   ; p10:B172
	jr L_92FE		;9317
L_9319:
	call 041cah		;9319   ; bancos_1_2_10: pone el 1 en 0x6000, el 2 en 0x8000, el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b3e5h		;931c
	jr L_92FE		;931f
L_9321:
	call 041cah		;9321   ; bancos_1_2_10: pone el 1 en 0x6000, el 2 en 0x8000, el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b8c4h		;9324   ; p10:B8C4
	jr L_92FE		;9327
L_9329:
	call 041cah		;9329   ; bancos_1_2_10: pone el 1 en 0x6000, el 2 en 0x8000, el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b957h		;932c   ; p10:B957
	jr L_92FE		;932f
L_9331:
	call 041cah		;9331   ; bancos_1_2_10: pone el 1 en 0x6000, el 2 en 0x8000, el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b960h		;9334   ; p10:B960
	jr L_92FE		;9337
L_9339:
	ld hl,(0cb02h)		;9339
	add hl,de			;933c
	ld (0cb02h),hl		;933d
	ret			;9340
L_9341:
	ld hl,(0cb04h)		;9341
	add hl,de			;9344
	ld (0cb04h),hl		;9345
	ret			;9348
L_9349:
	ld hl,00000h		;9349
	ld (0cb06h),hl		;934c
	ld (0cb08h),hl		;934f
	ret			;9352
L_9353:
	xor a			;9353
	ld (0cb02h),a		;9354
	ld (0cb04h),a		;9357
	ret			;935a
L_935B:
	ld a,(0cb03h)		;935b
	ld l,a			;935e
	ld a,(0cb05h)		;935f
	ld h,a			;9362
	ret			;9363
L_9364:
	ld bc,00020h		;9364
L_9367:
	ld hl,0cb28h		;9367
	ld (hl),b			;936a
	inc hl			;936b
	ld (hl),c			;936c
	ret			;936d
L_936E:
	ld a,(0cb16h)		;936e
	or a			;9371
	jp nz,L_93E5		;9372
L_9375:
	call L_93F9		;9375
	ld b,00fh		;9378
	ld a,(0ca9bh)		;937a
	or a			;937d
	jr nz,L_939B		;937e
	ld a,(0cb37h)		;9380
	or a			;9383
	jr nz,L_939B		;9384
	ld a,(0cb3fh)		;9386
	or a			;9389
	jr nz,L_939B		;938a
	ld a,(0cb28h)		;938c
	or a			;938f
	jr nz,L_9399		;9390
	ld a,(0cb00h)		;9392
	cp 00bh		;9395
	jr nz,L_939B		;9397
L_9399:
	ld b,003h		;9399
L_939B:
	ld a,(0ca07h)		;939b   ; lee lo recien pulsado del mando (los bits de 0xCA08 que no estaban)
	and b			;939e
	ret z			;939f
	ld hl,0cb0dh		;93a0
	ld a,(0cb0eh)		;93a3
	ld b,(hl)			;93a6
	cp b			;93a7
	ret z			;93a8
	dec a			;93a9
	dec b			;93aa
	and 002h		;93ab
	ld c,a			;93ad
	ld a,b			;93ae
	and 002h		;93af
	xor c			;93b1
	ret nz			;93b2
	ld a,(0cb31h)		;93b3
	or a			;93b6
	ret nz			;93b7
	inc a			;93b8
	ld (0cb16h),a		;93b9
	ld hl,0cb01h		;93bc
	ld a,(hl)			;93bf
	ld (0cb12h),a		;93c0
	ld b,003h		;93c3
	ld a,(0cb00h)		;93c5
	cp 009h		;93c8
	jr z,L_93D4		;93ca
	ld b,001h		;93cc
	cp 00ah		;93ce
	jr z,L_93D4		;93d0
	ld b,005h		;93d2
L_93D4:
	add a,b			;93d4
	ld (hl),a			;93d5
	ld a,002h		;93d6
	ld (0cb18h),a		;93d8
	ld hl,0cb0eh		;93db
	ld a,005h		;93de
	sub (hl)			;93e0
	ld (0cb17h),a		;93e1
	ret			;93e4
L_93E5:
	ld a,(0cb31h)		;93e5
	or a			;93e8
	ret nz			;93e9
	ld hl,0cb18h		;93ea
	dec (hl)			;93ed
	ret nz			;93ee
	dec hl			;93ef
	dec hl			;93f0
	ld (hl),a			;93f1
	ld a,(0cb12h)		;93f2
	ld (0cb01h),a		;93f5
	ret			;93f8
L_93F9:
	call 041a0h		;93f9   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a634h		;93fc   ; p06:A634
	jp 040f0h		;93ff   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
L_9402:
	ld a,(0cb16h)		;9402
	or a			;9405
	ret nz			;9406
	ld a,(0cb0fh)		;9407
	or a			;940a
	jr nz,L_9439		;940b
	call L_971B		;940d
	ld a,(0cb0fh)		;9410
	or a			;9413
	jr nz,L_9439		;9414
	call L_9471		;9416
	jr c,L_9439		;9419
	call L_8BB0		;941b
	jr nc,L_9427		;941e
	ld a,001h		;9420
	ld (0cb0fh),a		;9422
	jr L_9439		;9425
L_9427:
	call L_9590		;9427
	ld a,(0cb0fh)		;942a
	or a			;942d
	jr nz,L_9439		;942e
L_9430:
	call L_94AD		;9430
	call L_9530		;9433
	jp L_9841		;9436
L_9439:
	ld hl,0cb1ah		;9439
	ld a,(hl)			;943c
	or a			;943d
	jr z,L_9442		;943e
	dec (hl)			;9440
	ret			;9441
L_9442:
	ld a,001h		;9442
	ld (0cb14h),a		;9444
	ret			;9447
L_9448:
	ld a,(0cb0fh)		;9448
	or a			;944b
	jr nz,L_9439		;944c
	call L_9590		;944e
	ld a,(0cb0fh)		;9451
	or a			;9454
	jr nz,L_9439		;9455
	call L_9471		;9457
	jr c,L_9439		;945a
	call L_8BB0		;945c
	jr nc,L_9468		;945f
	ld a,001h		;9461
	ld (0cb0fh),a		;9463
	jr L_9439		;9466
L_9468:
	call L_94AD		;9468
	call L_9530		;946b
	jp L_9892		;946e
L_9471:
	ld a,(0d7d0h)		;9471
	bit 4,a		;9474
	jr z,L_948C		;9476
	ld a,(0cb0eh)		;9478
	cp 002h		;947b
	jr z,L_9481		;947d
	or a			;947f
	ret			;9480
L_9481:
	ld a,(0cb03h)		;9481
	cp 0b4h		;9484
	ccf			;9486
	ret nc			;9487
	ld a,0b4h		;9488
	jr L_94A1		;948a
L_948C:
	ld a,(0cb57h)		;948c
	or a			;948f
	ret z			;9490
	ld a,(0cb0eh)		;9491
	dec a			;9494
	jr z,L_9499		;9495
	or a			;9497
	ret			;9498
L_9499:
	ld a,(0cb03h)		;9499
	cp 050h		;949c
	ret nc			;949e
	ld a,050h		;949f
L_94A1:
	ld (0cb03h),a		;94a1
	xor a			;94a4
	ld (0cb02h),a		;94a5
	inc a			;94a8
	ld (0cb0fh),a		;94a9
	ret			;94ac
L_94AD:
	call L_94D6		;94ad
	ld a,(0cb0ah)		;94b0
	ld de,09520h		;94b3
	call 04403h		;94b6   ; palabra_de_tabla_de: DE = la palabra A de la tabla de DE
	ld a,(0cb0eh)		;94b9
	or a			;94bc
	ret z			;94bd
	rra			;94be
	call c,04442h		;94bf   ; de_negativo: DE = -DE
	call L_9349		;94c2
	ld a,(0cb0eh)		;94c5
	ld hl,0cb06h		;94c8
	cp 003h		;94cb
	jr c,L_94D2		;94cd
	ld hl,0cb08h		;94cf
L_94D2:
	ld (hl),e			;94d2
	inc hl			;94d3
	ld (hl),d			;94d4
	ret			;94d5
L_94D6:
	ld a,(0cb3fh)		;94d6
	or a			;94d9
	jr nz,L_9508		;94da
	ld a,(0cb37h)		;94dc
	or a			;94df
	jr z,L_9500		;94e0
	ld b,002h		;94e2
	ld a,(0cb29h)		;94e4
	cp 012h		;94e7
	jr nc,L_94FB		;94e9
	inc b			;94eb
	cp 00ch		;94ec
	jr nc,L_94FB		;94ee
	inc b			;94f0
	cp 00ah		;94f1
	jr nc,L_94FB		;94f3
	inc b			;94f5
	cp 008h		;94f6
	jr nc,L_94FB		;94f8
	inc b			;94fa
L_94FB:
	ld hl,0cb0ah		;94fb
	ld (hl),b			;94fe
	ret			;94ff
L_9500:
	ld a,(0cb0ah)		;9500
	cp 002h		;9503
	ret c			;9505
	jr L_950E		;9506
L_9508:
	ld a,(0cb3fh)		;9508
	dec a			;950b
	jr z,L_9513		;950c
L_950E:
	xor a			;950e
	ld (0cb0ah),a		;950f
	ret			;9512
L_9513:
	ld a,(0ca8fh)		;9513
	or a			;9516
	ld a,002h		;9517
	jr z,L_951C		;9519
	dec a			;951b
L_951C:
	ld (0cb0ah),a		;951c
	ret			;951f

; ----------------------------------------------------------------------
; DATOS resto_9520: lo apuntan con el banco puesto p02:94B3 (0x9520); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p02:94B3 (16 bytes)
;   0x9520..0x9530  (16 bytes)
DATA_resto_9520:
	defb 000h,004h,000h,002h,000h,003h,080h,000h,040h,000h,020h,000h,010h,000h,080h,001h	; 9520  ........@. .....

; ======================================================================
; CODIGO 0x9530..0x9588  (88 bytes)
; ======================================================================


L_9530:
	ld a,(0cb3fh)		;9530
	cp 002h		;9533
	jr c,L_9546		;9535
	ld a,(0ca8fh)		;9537
	or a			;953a
	jr z,L_9546		;953b
	dec a			;953d
	xor 001h		;953e
	inc a			;9540
	ld hl,0cb0eh		;9541
	cp (hl)			;9544
	ret z			;9545
L_9546:
	ld a,(0cb37h)		;9546
	or a			;9549
	jr z,L_9552		;954a
	ld a,(0cb29h)		;954c
	cp 008h		;954f
	ret c			;9551
L_9552:
	ld de,(0cb06h)		;9552
	call L_9339		;9556
	ld de,(0cb08h)		;9559
	call L_9341		;955d
	ld a,(0cb03h)		;9560
	ld e,a			;9563
	ld a,(0cb05h)		;9564
	ld d,a			;9567
	jp L_9BE4		;9568
L_956B:
	ld a,(0cb3ch)		;956b
	or a			;956e
	ret nz			;956f
	ld a,(0d4f1h)		;9570
	or a			;9573
	ret nz			;9574
	ld a,(0ca41h)		;9575
	or a			;9578
	ret nz			;9579
	ld a,(0cb3fh)		;957a
	or a			;957d
	ret z			;957e
	ld a,(0ca8fh)		;957f
	or a			;9582
	ret z			;9583
	dec a			;9584
	call 0424dh		;9585   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_9588: 4 destinos del despachador p00:424D (call en p02:9585, el
;   indice en A): 95D9, 9669, 96DF, 96FD; lo leen p02:9585 (8 bytes)
;   0x9588..0x9590  (8 bytes)
DATA_tabla_9588:
	defw 095d9h,09669h,096dfh,096fdh	; 9588  -> L_95D9 L_9669 L_96DF L_96FD

; ======================================================================
; CODIGO 0x9590..0x95d1  (65 bytes)
; ======================================================================


L_9590:
	ld a,(0cb3ch)		;9590
	or a			;9593
	ret nz			;9594
	ld a,(0d4f1h)		;9595
	or a			;9598
	ret nz			;9599
	ld a,(0ca65h)		;959a
	or a			;959d
	ret nz			;959e
	ld a,(0cb0eh)		;959f
	or a			;95a2
	ret z			;95a3
	call 07da9h		;95a4
	ret z			;95a7
	ld a,(0cb3fh)		;95a8
	or a			;95ab
	jr z,L_95BD		;95ac
	ld a,(0ca8fh)		;95ae
	or a			;95b1
	jr z,L_95BD		;95b2
	dec a			;95b4
	xor 001h		;95b5
	inc a			;95b7
	ld hl,0cb0eh		;95b8
	cp (hl)			;95bb
	ret z			;95bc
L_95BD:
	ld a,(0cb00h)		;95bd
	cp 00bh		;95c0
	call z,L_9364		;95c2
	ld a,(0ca41h)		;95c5
	or a			;95c8
	ret nz			;95c9
	ld a,(0cb0eh)		;95ca
	dec a			;95cd
	call 0424dh		;95ce   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_95D1: 4 destinos del despachador p00:424D (call en p02:95CE, el
;   indice en A): 95D9, 9669, 96DF, 96FD; lo leen p02:95CE (8 bytes)
;   0x95d1..0x95d9  (8 bytes)
DATA_tabla_95D1:
	defw 095d9h,09669h,096dfh,096fdh	; 95d1  -> L_95D9 L_9669 L_96DF L_96FD

; ======================================================================
; CODIGO 0x95d9..0x9743  (362 bytes)
; ======================================================================


L_95D9:
	ld a,(0cb03h)		;95d9
	cp 010h		;95dc
	ret nc			;95de
	ld a,(0ca4ah)		;95df   ; lee la zona
	cp 007h		;95e2
	jr nz,L_95FA		;95e4
	ld a,(0ca4bh)		;95e6   ; lee la sala de la zona
	cp 012h		;95e9
	jr nz,L_95FA		;95eb
	ld a,(0d880h)		;95ed
	cp 0ffh		;95f0
	jr z,L_95FA		;95f2
	ld a,001h		;95f4
	ld (0cb0fh),a		;95f6
	ret			;95f9
L_95FA:
	call L_9606		;95fa
	call L_9625		;95fd
	ld a,001h		;9600
	ld (0ca41h),a		;9602
	ret			;9605
L_9606:
	ld hl,0bf00h		;9606
	ld (0cb02h),hl		;9609
	ld a,(0ca4ah)		;960c   ; lee la zona
	or a			;960f
	ret nz			;9610
	ld h,054h		;9611
	ld a,(0ca4bh)		;9613   ; lee la sala de la zona
	cp 00ah		;9616
	jr z,L_961F		;9618
	ld h,034h		;961a
	cp 00ch		;961c
	ret nz			;961e
L_961F:
	ld l,000h		;961f
	ld (0cb04h),hl		;9621
	ret			;9624
L_9625:
	ld hl,0bf10h		;9625
L_9628:
	ld a,(0ca76h)		;9628   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 039h		;962b
	jr nz,L_9635		;962d
	ld a,(0ca4bh)		;962f   ; lee la sala de la zona
	dec a			;9632
	jr z,L_965D		;9633
L_9635:
	ld a,(0ca76h)		;9635   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	or a			;9638
	ret nz			;9639
	call 0418eh		;963a   ; bancos_56: pone el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	call L_9643		;963d
	jp 040f0h		;9640   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
L_9643:
	ld a,(hl)			;9643
	cp 0ffh		;9644
	ret z			;9646
	push hl			;9647
	ld a,(0ca4ah)		;9648   ; lee la zona
	cp (hl)			;964b
	jr nz,L_9663		;964c
	inc hl			;964e
	ld a,(0ca4bh)		;964f   ; lee la sala de la zona
	cp (hl)			;9652
	jr nz,L_9663		;9653
	inc hl			;9655
	ld a,(0cb00h)		;9656
	cp (hl)			;9659
	jr nz,L_9663		;965a
	pop hl			;965c
L_965D:
	ld bc,00100h		;965d
	jp L_9367		;9660
L_9663:
	pop hl			;9663
	inc hl			;9664
	inc hl			;9665
	inc hl			;9666
	jr L_9643		;9667
L_9669:
	ld a,(0cb03h)		;9669
	cp 0c0h		;966c
	ret c			;966e
	ld a,(0ca4ah)		;966f   ; lee la zona
	cp 00ah		;9672
	jr nz,L_9691		;9674
	ld a,(0ca4bh)		;9676   ; lee la sala de la zona
	cp 004h		;9679
	jr nz,L_9691		;967b
	ld a,(0d7d5h)		;967d
	bit 4,a		;9680
	jr z,L_9691		;9682
	ld a,(0d7dah)		;9684
	bit 0,a		;9687
	jr nz,L_9691		;9689
	ld a,001h		;968b
	ld (0cb0fh),a		;968d
	ret			;9690
L_9691:
	call L_96A2		;9691
	call L_969D		;9694
	ld a,002h		;9697
	ld (0ca41h),a		;9699
	ret			;969c
L_969D:
	ld hl,0bf2fh		;969d
	jr L_9628		;96a0
L_96A2:
	ld hl,01100h		;96a2
	ld (0cb02h),hl		;96a5
	ld a,(0ca4ah)		;96a8   ; lee la zona
	or a			;96ab
	jr z,L_96C5		;96ac
	cp 009h		;96ae
	ret nz			;96b0
	ld a,(0ca4bh)		;96b1   ; lee la sala de la zona
	cp 003h		;96b4
	ret nz			;96b6
	ld bc,04038h		;96b7
	ld a,(0cb05h)		;96ba
	cp 070h		;96bd
	jr c,L_96D4		;96bf
	ld b,090h		;96c1
	jr L_96D4		;96c3
L_96C5:
	ld bc,03808h		;96c5
	ld a,(0ca4bh)		;96c8   ; lee la sala de la zona
	cp 00ah		;96cb
	jr z,L_96D4		;96cd
	ld b,070h		;96cf
	cp 00ch		;96d1
	ret nz			;96d3
L_96D4:
	ld h,b			;96d4
	ld l,000h		;96d5
	ld (0cb04h),hl		;96d7
	ld h,c			;96da
	ld (0cb02h),hl		;96db
	ret			;96de
L_96DF:
	ld b,009h		;96df
	ld hl,0b800h		;96e1
	ld a,(0cb00h)		;96e4
	cp 002h		;96e7
	jr nz,L_96EF		;96e9
	ld b,011h		;96eb
	ld h,0b7h		;96ed
L_96EF:
	ld a,(0cb05h)		;96ef
	cp b			;96f2
	ret nc			;96f3
	ld (0cb04h),hl		;96f4
	ld a,003h		;96f7
	ld (0ca41h),a		;96f9
	ret			;96fc
L_96FD:
	ld b,0b8h		;96fd
	ld hl,00800h		;96ff
	ld a,(0cb00h)		;9702
	cp 002h		;9705
	jr nz,L_970D		;9707
	ld b,0b0h		;9709
	ld h,008h		;970b
L_970D:
	ld a,(0cb05h)		;970d
	cp b			;9710
	ret c			;9711
	ld (0cb04h),hl		;9712
	ld a,004h		;9715
	ld (0ca41h),a		;9717
	ret			;971a
L_971B:
	xor a			;971b
	ld (0cb30h),a		;971c
	ld a,(0cb00h)		;971f
	cp 00bh		;9722
	ret z			;9724
	ld b,000h		;9725
	ld a,(0cb00h)		;9727
	cp 002h		;972a
	jr nz,L_972F		;972c
	inc b			;972e
L_972F:
	call 07eeeh		;972f
	ret nc			;9732
	call L_975C		;9733
	ret c			;9736
	call L_9804		;9737
	call L_9756		;973a
	ld a,001h		;973d
	ld (0cb0fh),a		;973f
	ret			;9742

; ----------------------------------------------------------------------
; DATOS sin identificar  0x9743..0x9756  (19 bytes)
DATA_9743:
	defb 0afh,032h,030h,0cbh,047h,03ah,031h,0cbh,0b7h,028h,001h,004h,0cdh,0dbh,07eh,0d0h	; 9743  .20.G:1..(....~.
	defb 0cdh,0f0h,097h	; 9753

; ======================================================================
; CODIGO 0x9756..0x9763  (13 bytes)
; ======================================================================


L_9756:
	ld a,001h		;9756
	ld (0cb30h),a		;9758
	ret			;975b
L_975C:
	ld a,(0cb0eh)		;975c
	dec a			;975f
	call 0424dh		;9760   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_9763: 4 destinos del despachador p00:424D (call en p02:9760, el
;   indice en A): 976B, 976B, 978B, 978B; lo leen p02:9760 (8 bytes)
;   0x9763..0x976b  (8 bytes)
DATA_tabla_9763:
	defw 0976bh,0976bh,0978bh,0978bh	; 9763  -> L_976B L_976B L_978B L_978B

; ======================================================================
; CODIGO 0x976b..0x97f0  (133 bytes)
; ======================================================================


L_976B:
	ld de,0ff00h		;976b
	ld b,004h		;976e
L_9770:
	push bc			;9770
	call L_97D0		;9771
	pop bc			;9774
	jr nc,L_97BD		;9775
	dec d			;9777
	djnz L_9770		;9778
	ld de,00100h		;977a
	ld b,004h		;977d
L_977F:
	push bc			;977f
	call L_97D0		;9780
	pop bc			;9783
	jr nc,L_97BD		;9784
	inc d			;9786
	djnz L_977F		;9787
	and a			;9789
	ret			;978a
L_978B:
	ld de,000ffh		;978b
	ld b,004h		;978e
L_9790:
	push bc			;9790
	call L_97D0		;9791
	pop bc			;9794
	jr nc,L_97BD		;9795
	dec e			;9797
	djnz L_9790		;9798
	ld de,00001h		;979a
	ld b,004h		;979d
L_979F:
	push bc			;979f
	call L_97D0		;97a0
	pop bc			;97a3
	jr nc,L_97BD		;97a4
	inc e			;97a6
	djnz L_979F		;97a7
	and a			;97a9
	ret			;97aa
L_97AB:
	ld de,000fch		;97ab
	call L_97D0		;97ae
	jr nc,L_97BD		;97b1
	ld de,00004h		;97b3
	call L_97D0		;97b6
	jr nc,L_97BD		;97b9
	and a			;97bb
	ret			;97bc
L_97BD:
	call L_9353		;97bd
	ld a,(0cb03h)		;97c0
	add a,e			;97c3
	ld (0cb03h),a		;97c4
	ld a,(0cb05h)		;97c7
	add a,d			;97ca
	ld (0cb05h),a		;97cb
	scf			;97ce
	ret			;97cf
L_97D0:
	push de			;97d0
	call L_97D6		;97d1
	pop de			;97d4
	ret			;97d5
L_97D6:
	ld a,(0cb03h)		;97d6
	add a,e			;97d9
	ld e,a			;97da
	ld a,(0cb05h)		;97db
	add a,d			;97de
	ld d,a			;97df
	ld b,000h		;97e0
	ld a,(0cb00h)		;97e2
	cp 002h		;97e5
	jr nz,L_97EA		;97e7
	inc b			;97e9
L_97EA:
	ld a,(0cb0eh)		;97ea
	jp 07ef6h		;97ed   ; p01:7EF6

; ----------------------------------------------------------------------
; DATOS sin identificar  0x97f0..0x97f8  (8 bytes)
DATA_97F0:
	defb 0cdh,053h,093h,03ah,08fh,0cah,0b7h,0c8h	; 97f0  .S.:....

; ======================================================================
; CODIGO 0x97f8..0x97fc  (4 bytes)
; ======================================================================


L_97F8:
	dec a			;97f8
	call 0424dh		;97f9   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_97FC: 4 destinos del despachador p00:424D (call en p02:97F9, el
;   indice en A): 980C, 9824, 9831, 9838; lo leen p02:97F9 (8 bytes)
;   0x97fc..0x9804  (8 bytes)
DATA_tabla_97FC:
	defw 0980ch,09824h,09831h,09838h	; 97fc  -> L_980C L_9824 L_9831 L_9838

; ======================================================================
; CODIGO 0x9804..0x9888  (132 bytes)
; ======================================================================


L_9804:
	call L_9353		;9804
	ld a,(0cb0eh)		;9807
	jr $-18		;980a
L_980C:
	ld a,(0cb00h)		;980c
	cp 002h		;980f
	ld a,(0cb03h)		;9811
	jr z,L_981E		;9814
	and 0f8h		;9816
	add a,007h		;9818
	ld (0cb03h),a		;981a
	ret			;981d
L_981E:
	and 0f8h		;981e
	add a,005h		;9820
	jr L_982D		;9822
L_9824:
	ld a,(0cb03h)		;9824
	sub 004h		;9827
	and 0f8h		;9829
	add a,007h		;982b
L_982D:
	ld (0cb03h),a		;982d
	ret			;9830
L_9831:
	ld a,(0cb05h)		;9831
	add a,006h		;9834
	jr L_983B		;9836
L_9838:
	ld a,(0cb05h)		;9838
L_983B:
	and 0f8h		;983b
	ld (0cb05h),a		;983d
	ret			;9840
L_9841:
	ld hl,0cb1ah		;9841
	ld (hl),004h		;9844
	ld hl,0cb15h		;9846
	ld a,(0ca07h)		;9849   ; lee lo recien pulsado del mando (los bits de 0xCA08 que no estaban)
	and 00fh		;984c
	jr z,L_9852		;984e
	ld (hl),001h		;9850
L_9852:
	dec (hl)			;9852
	ret nz			;9853
	ld a,(0cb0ah)		;9854
	ld hl,0988ah		;9857
	call 04248h		;985a   ; byte_de_tabla: A = el byte A de la tabla de HL (y HL apunta a el)
	ld hl,0cb15h		;985d
	ld (hl),a			;9860
	ld a,(0cb13h)		;9861
	inc a			;9864
	and 003h		;9865
	ld (0cb13h),a		;9867
L_986A:
	ld a,(0cb13h)		;986a
	ld hl,09888h		;986d
	call 04248h		;9870   ; byte_de_tabla: A = el byte A de la tabla de HL (y HL apunta a el)
	ld (0cb14h),a		;9873
	or a			;9876
	jr z,L_987C		;9877
	cp 002h		;9879
	ret nz			;987b
L_987C:
	ld a,(0cb00h)		;987c
	cp 009h		;987f
	ret nz			;9881
	call 0af05h		;9882   ; p11:AF05
	jp 06ac6h		;9885   ; p01:6AC6

; ----------------------------------------------------------------------
; DATOS resto_9888: lo apuntan con el banco puesto p02:986D (0x9888), p02:9857
;   (0x988A); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p02:986D, p02:9857 (10 bytes)
;   0x9888..0x9892  (10 bytes)
DATA_resto_9888:
	defb 000h,001h,002h,001h,004h,005h,005h,006h,00ah,001h	; 9888  ..........

; ======================================================================
; CODIGO 0x9892..0x9915  (131 bytes)
; ======================================================================


L_9892:
	ld a,(0ca07h)		;9892   ; lee lo recien pulsado del mando (los bits de 0xCA08 que no estaban)
	and 00fh		;9895
	jr nz,L_98A9		;9897
	ld hl,0cb18h		;9899
	ld a,(0cb0fh)		;989c
	or a			;989f
	jr z,L_98A5		;98a0
	ld (hl),001h		;98a2
	ret			;98a4
L_98A5:
	dec (hl)			;98a5
	ret nz			;98a6
	ld (hl),003h		;98a7
L_98A9:
	ld b,0f8h		;98a9
	ld hl,0cb17h		;98ab
	ld a,(hl)			;98ae
	cp 00dh		;98af
	jr nc,L_98B5		;98b1
	ld b,008h		;98b3
L_98B5:
	add a,b			;98b5
	ld (hl),a			;98b6
	ret			;98b7
L_98B8:
	ld b,001h		;98b8
	call L_990E		;98ba
	jr L_98C2		;98bd
L_98BF:
	call L_98F0		;98bf
L_98C2:
	ld hl,09915h		;98c2
	ld a,b			;98c5
	add a,a			;98c6
	add a,b			;98c7
	call 0423eh		;98c8   ; suma_a_hl: HL = HL + A
	ld de,0cb00h		;98cb
	ldi		;98ce
	ldi		;98d0
	ld a,(hl)			;98d2
	ld (0cb0ah),a		;98d3
	ld a,(0cb21h)		;98d6
	cp 00ah		;98d9
	jr z,L_98EB		;98db
	cp 00bh		;98dd
	jr z,L_98EB		;98df
	cp 002h		;98e1
	ret nz			;98e3
	ld a,(0cb35h)		;98e4
	ld (0cb01h),a		;98e7
	ret			;98ea
L_98EB:
	xor a			;98eb
	ld (0cb16h),a		;98ec
	ret			;98ef
L_98F0:
	ld b,006h		;98f0
	ld a,(0cb20h)		;98f2
	cp 005h		;98f5
	ret z			;98f7
	dec b			;98f8
	ld a,(0cb21h)		;98f9
	cp 002h		;98fc
	ret z			;98fe
	dec b			;98ff
	cp 00ah		;9900
	ret z			;9902
	dec b			;9903
	cp 00bh		;9904
	ret z			;9906
	dec b			;9907
	ld a,(0cb31h)		;9908
	or a			;990b
	ret nz			;990c
	dec b			;990d
L_990E:
	ld a,(0cb35h)		;990e
	or a			;9911
	ret nz			;9912
	dec b			;9913
	ret			;9914

; ----------------------------------------------------------------------
; DATOS resto_9915: lo apuntan con el banco puesto p02:98C2 (0x9915); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p02:98C2 (21 bytes)
;   0x9915..0x992a  (21 bytes)
DATA_resto_9915:
	defb 000h,000h,000h,001h,001h,000h,002h,002h,001h,009h,00ah,000h,00ah,00bh,007h,00eh	; 9915  ................
	defb 000h,000h,007h,001h,000h	; 9925

; ======================================================================
; CODIGO 0x992a..0x9980  (86 bytes)
; ======================================================================


L_992A:
	call L_9932		;992a
	ld a,b			;992d
	ld (0cb35h),a		;992e
	ret			;9931
L_9932:
	ld b,001h		;9932
	ld a,(0cb20h)		;9934
	dec a			;9937
	ret z			;9938
	dec a			;9939
	ret z			;993a
	sub 003h		;993b
	ret z			;993d
	dec a			;993e
	ret z			;993f
	dec b			;9940
	ret			;9941
L_9942:
	call L_995E		;9942
	push hl			;9945
	call L_9976		;9946
	pop de			;9949
	jr nc,L_995B		;994a
	call L_8B98		;994c
	call L_9955		;994f
	jp 0af05h		;9952
L_9955:
	jp nc,06a19h		;9955   ; p01:6A19
	jp 06acah		;9958   ; p01:6ACA
L_995B:
	jp 06a15h		;995b
L_995E:
	ld hl,09980h		;995e
	ld a,(0cb0eh)		;9961
	dec a			;9964
	add a,a			;9965
	call 0423eh		;9966   ; suma_a_hl: HL = HL + A
	ld a,(0cb03h)		;9969
	add a,(hl)			;996c
	ld e,a			;996d
	inc hl			;996e
	ld a,(0cb05h)		;996f
	add a,(hl)			;9972
	ld d,a			;9973
	ex de,hl			;9974
	ret			;9975
L_9976:
	ld a,(0cb0eh)		;9976
	dec a			;9979
	jp z,07f3dh		;997a
	jp 07f88h		;997d   ; p01:7F88

; ----------------------------------------------------------------------
; DATOS resto_9980: lo apuntan con el banco puesto p02:995E (0x9980); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p02:995E (8 bytes)
;   0x9980..0x9988  (8 bytes)
DATA_resto_9980:
	defb 0e2h,000h,002h,0feh,0e7h,0f6h,0e7h,00ah	; 9980  ........

; ======================================================================
; CODIGO 0x9988..0x9bc7  (575 bytes)
; ======================================================================


L_9988:
	ld hl,0ca8dh		;9988
	ld a,(hl)			;998b
	or a			;998c
	jr z,L_9997		;998d
	ld a,(0cb29h)		;998f
	cp 020h		;9992
	ret nz			;9994
	ld (hl),000h		;9995
L_9997:
	ld a,(0d8c0h)		;9997
	or a			;999a
	ret nz			;999b
	ld a,(0ca41h)		;999c
	or a			;999f
	ret nz			;99a0
	call 04206h		;99a1   ; bancos_30: pone el 30 en 0xA000 (con su copia en 0xC381-0xC383)
	call L_99AA		;99a4
	jp 040f0h		;99a7   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
L_99AA:
	ld a,(0cb0eh)		;99aa
	cp 003h		;99ad
	ret nc			;99af
	ld hl,0be4bh		;99b0
	ld a,(0ca76h)		;99b3   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	or a			;99b6
	jr nz,L_99C6		;99b7
	call L_9A5B		;99b9
	ret c			;99bc
	ld a,(0ca4ah)		;99bd   ; lee la zona
	ld hl,0baa8h		;99c0
	call 043f6h		;99c3   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
L_99C6:
	ld a,(hl)			;99c6
	cp 0ffh		;99c7
	ret z			;99c9
	push hl			;99ca
	call L_99E3		;99cb
	pop hl			;99ce
	ld a,(0cb00h)		;99cf
	cp 00bh		;99d2
	ret z			;99d4
	ld a,(0ca76h)		;99d5   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	or a			;99d8
	ld a,006h		;99d9
	jr z,L_99DE		;99db
	inc a			;99dd
L_99DE:
	call 0423eh		;99de   ; suma_a_hl: HL = HL + A
	jr L_99C6		;99e1
L_99E3:
	ld a,(0ca76h)		;99e3   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	or a			;99e6
	jr z,L_99EC		;99e7
	cp (hl)			;99e9
	ret nz			;99ea
	inc hl			;99eb
L_99EC:
	ld a,(0ca4bh)		;99ec   ; lee la sala de la zona
	cp (hl)			;99ef
	ret nz			;99f0
	inc hl			;99f1
	ld a,(hl)			;99f2
	ld (0cb2fh),a		;99f3
	inc hl			;99f6
	ld a,(hl)			;99f7
	or a			;99f8
	ld a,(0cb03h)		;99f9
	jr z,L_9A00		;99fc
	cp (hl)			;99fe
	ret c			;99ff
L_9A00:
	ld e,(hl)			;9a00
	inc hl			;9a01
	sub 008h		;9a02
	jr nc,L_9A07		;9a04
	xor a			;9a06
L_9A07:
	cp (hl)			;9a07
	ret nc			;9a08
	ld d,(hl)			;9a09
	ld a,(0cb28h)		;9a0a
	or a			;9a0d
	jr nz,L_9A25		;9a0e
	ld a,(0cb03h)		;9a10
	sub 020h		;9a13
	jr nc,L_9A18		;9a15
	xor a			;9a17
L_9A18:
	cp e			;9a18
	ld a,(0cb0eh)		;9a19
	jr c,L_9A22		;9a1c
	dec a			;9a1e
	ret nz			;9a1f
	jr L_9A25		;9a20
L_9A22:
	cp 002h		;9a22
	ret nz			;9a24
L_9A25:
	inc hl			;9a25
	ld a,(hl)			;9a26
	inc hl			;9a27
	sub (hl)			;9a28
	ld b,a			;9a29
	ld a,(0cb05h)		;9a2a
	cp b			;9a2d
	ret c			;9a2e
	ld a,b			;9a2f
	add a,(hl)			;9a30
	add a,(hl)			;9a31
	ld b,a			;9a32
	ld a,(0cb05h)		;9a33
	cp b			;9a36
	ret nc			;9a37
	ld (0cb2ah),de		;9a38
	ld a,00bh		;9a3c
	ld (0cb00h),a		;9a3e
	ld a,002h		;9a41
	ld (0cb01h),a		;9a43
	xor a			;9a46
	ld (0cb50h),a		;9a47
	ld (0cb16h),a		;9a4a
	ld a,(hl)			;9a4d
	cp 008h		;9a4e
	ret nc			;9a50
	xor a			;9a51
	ld (0cb04h),a		;9a52
	dec hl			;9a55
	ld a,(hl)			;9a56
	ld (0cb05h),a		;9a57
	ret			;9a5a
L_9A5B:
	ld hl,0be92h		;9a5b
L_9A5E:
	ld a,(hl)			;9a5e
	cp 0ffh		;9a5f
	jr z,L_9A94		;9a61
	push hl			;9a63
	call L_9A6F		;9a64
	pop hl			;9a67
	ret c			;9a68
	ld de,00006h		;9a69
	add hl,de			;9a6c
	jr L_9A5E		;9a6d
L_9A6F:
	ld a,(0ca4ah)		;9a6f   ; lee la zona
	cp (hl)			;9a72
	jr nz,L_9A94		;9a73
	inc hl			;9a75
	ld a,(0ca4bh)		;9a76   ; lee la sala de la zona
	cp (hl)			;9a79
	jr nz,L_9A94		;9a7a
	inc hl			;9a7c
	ld a,(0cb03h)		;9a7d
	cp (hl)			;9a80
	jr c,L_9A94		;9a81
	inc hl			;9a83
	cp (hl)			;9a84
	jr nc,L_9A94		;9a85
	inc hl			;9a87
	ld a,(0cb05h)		;9a88
	cp (hl)			;9a8b
	jr c,L_9A94		;9a8c
	inc hl			;9a8e
	cp (hl)			;9a8f
	jr nc,L_9A94		;9a90
	scf			;9a92
	ret			;9a93
L_9A94:
	and a			;9a94
	ret			;9a95
L_9A96:
	call 041a0h		;9a96   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a14dh		;9a99   ; p06:A14D
	call 0a2aah		;9a9c   ; p06:A2AA
	call 0a139h		;9a9f   ; p06:A139
	jp 040f0h		;9aa2   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
L_9AA5:
	ld a,(0ca4ah)		;9aa5   ; lee la zona
	cp 006h		;9aa8
	ret nz			;9aaa
	call L_9AB4		;9aab
	call L_9AD3		;9aae
	jp L_9B60		;9ab1
L_9AB4:
	ld hl,0caaah		;9ab4
	ld a,(hl)			;9ab7
	or a			;9ab8
	jr z,L_9AC4		;9ab9
	ld a,(0ca07h)		;9abb   ; lee lo recien pulsado del mando (los bits de 0xCA08 que no estaban)
	and 030h		;9abe
	ret z			;9ac0
	ld (hl),000h		;9ac1
	ret			;9ac3
L_9AC4:
	ld a,(0ca08h)		;9ac4   ; lee el mando: joystick y teclado juntos (bits 0-3 las direcciones, 4-5 los disparos)
	and 020h		;9ac7
	ret z			;9ac9
	ld a,(0ca07h)		;9aca   ; lee lo recien pulsado del mando (los bits de 0xCA08 que no estaban)
	and 010h		;9acd
	ret z			;9acf
	ld (hl),001h		;9ad0
	ret			;9ad2
L_9AD3:
	ld hl,0cb3fh		;9ad3
	ld a,(hl)			;9ad6
	push af			;9ad7
	call L_9AF3		;9ad8
	pop bc			;9adb
	push bc			;9adc
	call L_9B31		;9add
	pop bc			;9ae0
	ld a,(0cb3fh)		;9ae1
	or a			;9ae4
	jr z,L_9AED		;9ae5
	call L_9BA4		;9ae7
	jp L_956B		;9aea
L_9AED:
	ld a,b			;9aed
	or a			;9aee
	ret z			;9aef
	jp L_98B8		;9af0
L_9AF3:
	xor a			;9af3
	ld (hl),a			;9af4
	ld a,(0ca41h)		;9af5
	or a			;9af8
	ret nz			;9af9
	ld a,(0ca76h)		;9afa   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	or a			;9afd
	ret nz			;9afe
	ld a,(0d8c0h)		;9aff
	or a			;9b02
	ret nz			;9b03
	ld a,(0ca4bh)		;9b04   ; lee la sala de la zona
	cp 007h		;9b07
	ret z			;9b09
	cp 010h		;9b0a
	ret z			;9b0c
	call L_935B		;9b0d
	call 07f69h		;9b10
	ld hl,0cb3fh		;9b13
	cp 090h		;9b16
	ret c			;9b18
	cp 0b4h		;9b19
	jr c,L_9B27		;9b1b
	cp 0b8h		;9b1d
	ret c			;9b1f
	cp 0dch		;9b20
	ret nc			;9b22
	ld a,002h		;9b23
	jr L_9B29		;9b25
L_9B27:
	ld a,001h		;9b27
L_9B29:
	ld (hl),a			;9b29
	ld a,(0caaah)		;9b2a
	or a			;9b2d
	ret z			;9b2e
	inc (hl)			;9b2f
	ret			;9b30
L_9B31:
	ld a,(0cb3fh)		;9b31
	cp 002h		;9b34
	jr c,L_9B47		;9b36
	cp b			;9b38
	ret z			;9b39
	ccf			;9b3a
	ret nc			;9b3b
	ld a,001h		;9b3c
	ld (0cae2h),a		;9b3e
	call 07048h		;9b41   ; p01:7048
	jp 0431eh		;9b44   ; barra_derecha_cac4: la barra de la derecha de 0xCAC5 (con 0xCAE2 puesto)
L_9B47:
	dec b			;9b47
	dec b			;9b48
	ld a,001h		;9b49
	cp b			;9b4b
	ret nc			;9b4c
	call 04309h		;9b4d   ; borra_franja_80c0: borra 0x5A x 0x10 puntos desde X = 0x80, Y = 0xC0 en las paginas 0 y 1
	ld a,(0cac4h)		;9b50
	ld (0cac5h),a		;9b53
	ld a,040h		;9b56
	ld (0cae6h),a		;9b58
	xor a			;9b5b
	ld (0cae2h),a		;9b5c
	ret			;9b5f
L_9B60:
	ld hl,0ca98h		;9b60
	ld a,(0cb3fh)		;9b63
	cp 002h		;9b66
	jr c,L_9BA1		;9b68
	dec (hl)			;9b6a
	ret nz			;9b6b
	ld (hl),010h		;9b6c
	ld hl,0cac5h		;9b6e
	ld a,(hl)			;9b71
	or a			;9b72
	jr z,L_9B7A		;9b73
	dec (hl)			;9b75
	dec (hl)			;9b76
	jp 0431eh		;9b77   ; barra_derecha_cac4: la barra de la derecha de 0xCAC5 (con 0xCAE2 puesto)
L_9B7A:
	call L_9B80		;9b7a
	jp 04288h		;9b7d   ; barras_de_vida: la barra de vida y, con 0xCA5F, p04:9889
L_9B80:
	ld hl,0ca53h		;9b80
	dec (hl)			;9b83
	dec (hl)			;9b84
	ld a,(hl)			;9b85
	cp 0f0h		;9b86
	jr c,L_9B8C		;9b88
	xor a			;9b8a
	ld (hl),a			;9b8b
L_9B8C:
	ld a,(0ca53h)		;9b8c
	or a			;9b8f
	ret nz			;9b90
	call L_8BB8		;9b91
	ld a,(0ca53h)		;9b94
	or a			;9b97
	ret nz			;9b98
	ld a,01bh		;9b99
	ld (0cb00h),a		;9b9b
	jp 06ba0h		;9b9e   ; p01:6BA0
L_9BA1:
	ld (hl),010h		;9ba1
	ret			;9ba3
L_9BA4:
	call L_8AE7		;9ba4
	ld a,(0cb3fh)		;9ba7
	or a			;9baa
	ret z			;9bab
	ld de,00400h		;9bac
	ld a,(0cb21h)		;9baf
	cp 006h		;9bb2
	jr z,L_9BBE		;9bb4
	ld a,(0cb3fh)		;9bb6
	dec a			;9bb9
	jr nz,L_9BBE		;9bba
	ld d,002h		;9bbc
L_9BBE:
	ld a,(0ca8fh)		;9bbe
	or a			;9bc1
	ret z			;9bc2
	dec a			;9bc3
	call 0424dh		;9bc4   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_9BC7: 4 destinos del despachador p00:424D (call en p02:9BC4, el
;   indice en A): 9BCF, 9BD2, 9BD5, 9BD8; lo leen p02:9BC4 (8 bytes)
;   0x9bc7..0x9bcf  (8 bytes)
DATA_tabla_9BC7:
	defw 09bcfh,09bd2h,09bd5h,09bd8h	; 9bc7  -> L_9BCF L_9BD2 L_9BD5 L_9BD8

; ======================================================================
; CODIGO 0x9bcf..0x9da2  (467 bytes)
; ======================================================================


L_9BCF:
	call 04442h		;9bcf   ; de_negativo: DE = -DE
L_9BD2:
	jp L_9339		;9bd2
L_9BD5:
	call 04442h		;9bd5   ; de_negativo: DE = -DE
L_9BD8:
	jp L_9341		;9bd8
L_9BDB:
	call 041a0h		;9bdb   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a387h		;9bde   ; p06:A387
	jp 040f0h		;9be1   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
L_9BE4:
	ld a,(0caa0h)		;9be4
	or a			;9be7
	ret z			;9be8
	push de			;9be9
	ld hl,0e0ach		;9bea
	ld de,0e0afh		;9bed
	ld bc,0002dh		;9bf0
	lddr		;9bf3
	pop de			;9bf5
	ld hl,0e080h		;9bf6
	ld (hl),e			;9bf9
	inc hl			;9bfa
	ld (hl),d			;9bfb
	inc hl			;9bfc
	ld a,(0cb0eh)		;9bfd
	ld (hl),a			;9c00
	ret			;9c01
L_9C02:
	ld a,(0ca76h)		;9c02   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 038h		;9c05
	jr nz,L_9C12		;9c07
	ld hl,0bd9bh		;9c09
	ld a,(0ca4bh)		;9c0c   ; lee la sala de la zona
	dec a			;9c0f
	jr z,L_9C27		;9c10
L_9C12:
	ld a,(0ca4ah)		;9c12   ; lee la zona
	cp 012h		;9c15
	ld hl,0bd7dh		;9c17
	jr z,L_9C22		;9c1a
	ld hl,0bd8eh		;9c1c
	cp 013h		;9c1f
	ret nz			;9c21
L_9C22:
	ld a,(0ca76h)		;9c22   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	or a			;9c25
	ret nz			;9c26
L_9C27:
	xor a			;9c27
	ld (0e25eh),a		;9c28
	call 041a0h		;9c2b   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call L_9CF4		;9c2e
	call 040f0h		;9c31   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	ld a,(0e25eh)		;9c34
	or a			;9c37
	ret z			;9c38
	bit 1,a		;9c39
	call nz,L_9C5E		;9c3b
	ld a,(0e25eh)		;9c3e
	rra			;9c41
	ret nc			;9c42
	ld a,(0cb21h)		;9c43
	cp 020h		;9c46
	jr nz,L_9C50		;9c48
	ld a,(0cab6h)		;9c4a
	or a			;9c4d
	jr z,L_9C65		;9c4e
L_9C50:
	ld a,013h		;9c50
	ld (0cb00h),a		;9c52
	ld a,(0cb35h)		;9c55
	and 001h		;9c58
	ld (0cb01h),a		;9c5a
	ret			;9c5d
L_9C5E:
	xor a			;9c5e
	ld (0cb80h),a		;9c5f
	jp 06c6bh		;9c62   ; p01:6C6B
L_9C65:
	call 06aceh		;9c65   ; p01:6ACE
	call L_9C9C		;9c68
	call L_9CDA		;9c6b
	call L_9C7C		;9c6e
	ld hl,0d7d8h		;9c71
	set 6,(hl)		;9c74
	ld hl,0d7dfh		;9c76
	res 3,(hl)		;9c79
	ret			;9c7b
L_9C7C:
	ld hl,0d6b4h		;9c7c
	ld a,(hl)			;9c7f
	or a			;9c80
	ret z			;9c81
	push hl			;9c82
	ld a,(0cb21h)		;9c83
	call 0beb7h		;9c86   ; p03:BEB7
	ld a,(0cb21h)		;9c89
	call 0beb2h		;9c8c   ; p03:BEB2
	pop hl			;9c8f
	ret nc			;9c90
	xor a			;9c91
	ld (hl),a			;9c92
	ld (0cb21h),a		;9c93
	ld hl,0d8a4h		;9c96
	jp L_9319		;9c99
L_9C9C:
	push bc			;9c9c
	push de			;9c9d
	ld a,b			;9c9e
	and 00fh		;9c9f
	or a			;9ca1
	call z,L_9CCD		;9ca2
	push af			;9ca5
	call L_9CB8		;9ca6
	pop af			;9ca9
	add a,070h		;9caa
	call 040f0h		;9cac   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b0d3h		;9caf   ; p03:B0D3
	call 041a0h		;9cb2   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	pop de			;9cb5
	pop bc			;9cb6
L_9CB7:
	ret			;9cb7
L_9CB8:
	cp 003h		;9cb8
	ret nc			;9cba
	or a			;9cbb
	jr nz,L_9CC4		;9cbc
	ld hl,0d7deh		;9cbe
L_9CC1:
	set 0,(hl)		;9cc1
	ret			;9cc3
L_9CC4:
	ld hl,0d7e4h		;9cc4
	dec a			;9cc7
	jr nz,L_9CC1		;9cc8
	set 1,(hl)		;9cca
	ret			;9ccc
L_9CCD:
	push hl			;9ccd
	ld hl,0d7f1h		;9cce
	res 7,(hl)		;9cd1
	ld hl,0d7d8h		;9cd3
	set 5,(hl)		;9cd6
	pop hl			;9cd8
	ret			;9cd9
L_9CDA:
	ld a,b			;9cda
	rra			;9cdb
	rra			;9cdc
	rra			;9cdd
	rra			;9cde
	and 00fh		;9cdf
	ld hl,0bd1bh		;9ce1
	call 041a0h		;9ce4   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 043f6h		;9ce7   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld b,(hl)			;9cea
	inc hl			;9ceb
	ld c,(hl)			;9cec
	inc hl			;9ced
	call 05094h		;9cee
	jp 040f0h		;9cf1   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
L_9CF4:
	ld a,(hl)			;9cf4
	cp 0ffh		;9cf5
	ret z			;9cf7
	push hl			;9cf8
	ld a,(0ca4bh)		;9cf9   ; lee la sala de la zona
	cp (hl)			;9cfc
	jr nz,L_9D2F		;9cfd
	inc hl			;9cff
	ld b,(hl)			;9d00
	push bc			;9d01
	inc hl			;9d02
	ld e,(hl)			;9d03
	inc hl			;9d04
	ld d,(hl)			;9d05
	push de			;9d06
	call L_9D36		;9d07
	pop de			;9d0a
	pop bc			;9d0b
	ld hl,0e25eh		;9d0c
	ld a,(hl)			;9d0f
	or a			;9d10
	jr z,L_9D2F		;9d11
	ld a,b			;9d13
	and 00fh		;9d14
	add a,070h		;9d16
	push bc			;9d18
	push de			;9d19
	call 040f0h		;9d1a   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b0feh		;9d1d
	call 041a0h		;9d20   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	pop de			;9d23
	pop bc			;9d24
	pop hl			;9d25
	ld hl,0e25eh		;9d26
	ld a,(hl)			;9d29
	ld (hl),000h		;9d2a
	ret nz			;9d2c
	ld (hl),a			;9d2d
	ret			;9d2e
L_9D2F:
	pop hl			;9d2f
	ld de,00004h		;9d30
	add hl,de			;9d33
	jr L_9CF4		;9d34
L_9D36:
	ld a,b			;9d36
	rra			;9d37
	rra			;9d38
	rra			;9d39
	rra			;9d3a
	and 00fh		;9d3b
	cp 003h		;9d3d
	jr c,L_9D43		;9d3f
	sub 003h		;9d41
L_9D43:
	add a,a			;9d43
	ld hl,09da2h		;9d44
	call 0423eh		;9d47   ; suma_a_hl: HL = HL + A
	push hl			;9d4a
	push de			;9d4b
	ld a,(0cb03h)		;9d4c
	ld (0d8f0h),a		;9d4f
	ld a,(0cb05h)		;9d52
	ld (0d8f1h),a		;9d55
	ld b,001h		;9d58
	call L_9D7A		;9d5a
	pop de			;9d5d
	pop hl			;9d5e
	ld a,(0cb80h)		;9d5f
	cp 008h		;9d62
	ret nz			;9d64
	ld a,(0cb83h)		;9d65
	ld (0d8f0h),a		;9d68
	ld a,(0cb85h)		;9d6b
	ld (0d8f1h),a		;9d6e
	ld a,(0e25eh)		;9d71
	or a			;9d74
	ld b,002h		;9d75
	jr z,L_9D7A		;9d77
	inc b			;9d79
L_9D7A:
	ld a,(0d8f0h)		;9d7a
	cp e			;9d7d
	ret c			;9d7e
	ld a,(0d8f1h)		;9d7f
	add a,002h		;9d82
	cp d			;9d84
	ret c			;9d85
	call L_9D9A		;9d86
	ld a,(0d8f0h)		;9d89
	cp e			;9d8c
	ret nc			;9d8d
	ld a,(0d8f1h)		;9d8e
	sub 002h		;9d91
	cp d			;9d93
	ret nc			;9d94
	ld a,b			;9d95
	ld (0e25eh),a		;9d96
	ret			;9d99
L_9D9A:
	ld a,e			;9d9a
	add a,(hl)			;9d9b
	ld e,a			;9d9c
	inc hl			;9d9d
	ld a,d			;9d9e
	add a,(hl)			;9d9f
	ld d,a			;9da0
	ret			;9da1

; ----------------------------------------------------------------------
; DATOS resto_9DA2: lo apuntan con el banco puesto p02:9D44 (0x9DA2); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p02:9D44 (6 bytes)
;   0x9da2..0x9da8  (6 bytes)
DATA_resto_9DA2:
	defb 020h,028h,020h,020h,018h,020h	; 9da2

; ======================================================================
; CODIGO 0x9da8..0xa000  (600 bytes)
; ======================================================================


L_9DA8:
	call 041a0h		;9da8   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a330h		;9dab   ; p06:A330
	jp 040f0h		;9dae   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
L_9DB1:
	call 06e0dh		;9db1   ; p01:6E0D
	call 041a0h		;9db4   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a3c8h		;9db7   ; p06:A3C8
	jp 040f0h		;9dba   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
L_9DBD:
	ld b,000h		;9dbd
	ld a,(0ffa7h)		;9dbf
	cp 0c9h		;9dc2
	jr z,L_9DC7		;9dc4
	inc b			;9dc6
L_9DC7:
	ld a,(0c38ah)		;9dc7
	inc a			;9dca
	jr z,L_9DCF		;9dcb
	set 1,b		;9dcd
L_9DCF:
	ld a,b			;9dcf
	ld (0c38bh),a		;9dd0
	ret			;9dd3
L_9DD4:
	ld bc,00400h		;9dd4
	ld hl,0fcc1h		;9dd7
L_9DDA:
	push bc			;9dda
	push hl			;9ddb
	ld a,(hl)			;9ddc
	bit 7,a		;9ddd
	jr nz,L_9DE7		;9ddf
	ld a,c			;9de1
	call L_9E07		;9de2
	jr L_9DEA		;9de5
L_9DE7:
	call L_9DF7		;9de7
L_9DEA:
	pop hl			;9dea
	pop bc			;9deb
	ret c			;9dec
	inc hl			;9ded
	inc c			;9dee
	djnz L_9DDA		;9def
	ld a,0ffh		;9df1
	ld (0c38ah),a		;9df3
	ret			;9df6
L_9DF7:
	and 080h		;9df7
	or c			;9df9
	ld b,004h		;9dfa
L_9DFC:
	push bc			;9dfc
	call L_9E07		;9dfd
	pop bc			;9e00
	ret c			;9e01
	add a,004h		;9e02
	djnz L_9DFC		;9e04
	ret			;9e06
L_9E07:
	ld (0c38ah),a		;9e07
	ld hl,04010h		;9e0a
	call 0000ch		;9e0d   ; BIOS RDSLT - Reads the value of an address in another slot
	cp 059h		;9e10
	jr nz,L_9E26		;9e12
	ld hl,04011h		;9e14
	ld a,(0c38ah)		;9e17
	call 0000ch		;9e1a   ; BIOS RDSLT - Reads the value of an address in another slot
	cp 05ah		;9e1d
	jr nz,L_9E26		;9e1f
	ld a,(0c38ah)		;9e21
	scf			;9e24
	ret			;9e25
L_9E26:
	ld a,(0c38ah)		;9e26
	and a			;9e29
	ret			;9e2a
L_9E2B:
	ld d,001h		;9e2b
	call 04be4h		;9e2d   ; borra_toda_la_pagina: p00:46FF desde (0,0) con BC = 0 y A = 0 en la pagina D
	call 07206h		;9e30   ; p01:7206
	call L_8502		;9e33
	call 04276h		;9e36   ; marcador_entero: p01:6DFF y el marcador (p00:4279)
	call 04459h		;9e39   ; llena_pantalla_99: 0xC0 x 0xC0 puntos al color 9 en la pagina de dibujar
	call 04606h		;9e3c   ; enciende_todo: la pantalla y los sprites encendidos
	call L_82A2		;9e3f
	call 04bech		;9e42   ; piezas_en_pagina_2: borra la pagina 2...
	call 06ee9h		;9e45   ; p01:6EE9
	call L_85C2		;9e48
	ld hl,00701h		;9e4b
	ld (0ca50h),hl		;9e4e
	ld hl,0ca89h		;9e51
	ld (hl),002h		;9e54
	ld hl,0d7f1h		;9e56
	set 7,(hl)		;9e59
	ld hl,00000h		;9e5b
	ld (0ca5fh),hl		;9e5e
	xor a			;9e61
	ld (0ca42h),a		;9e62   ; guarda la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	ld (0ca4ah),a		;9e65   ; guarda la zona
	ld (0caadh),a		;9e68
	ld (0ca22h),a		;9e6b   ; guarda la fase de la partida (indice de las listas de p06:B40C)
	inc a			;9e6e
	ld (0cabah),a		;9e6f
	ld a,01ch		;9e72
	ld (0e20bh),a		;9e74
	ld a,005h		;9e77
	ld (0ca7ah),a		;9e79
	call 06f78h		;9e7c
	call L_8C0C		;9e7f
	call 0b0adh		;9e82   ; p03:B0AD
	call L_9E94		;9e85
	call 052d2h		;9e88   ; entra_en_sala_1: entra en la sala nueva con 0xD440 = 1
	ld hl,08a80h		;9e8b
	ld (0c702h),hl		;9e8e
	jp 04365h		;9e91   ; marco_c4: p00:5F90 y las lineas de p00:439D, salvo en la zona 0x12 sala 8 con 0xD8A4
L_9E94:
	ld a,(0ca97h)		;9e94   ; lee 1 si los mensajes salen de los bancos 50-51 y no de 48-49
	or a			;9e97
	call z,L_85B0		;9e98
	ld hl,0ffffh		;9e9b
	ld (0ca20h),hl		;9e9e
	xor a			;9ea1
	ld (0c68eh),a		;9ea2
	dec a			;9ea5
	ld (0d44ah),a		;9ea6
	ld hl,0d8d8h		;9ea9
	ld bc,00007h		;9eac
	call 04236h		;9eaf   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	call L_8FB6		;9eb2
	call L_8AC6		;9eb5
	call L_8AD7		;9eb8
	call L_9EE5		;9ebb
	call L_9F02		;9ebe
	call L_9F23		;9ec1
	call L_9F50		;9ec4
	call L_9F65		;9ec7
	call L_8C04		;9eca
	call 04266h		;9ecd   ; esconde_sprites_ram: llena 0xDC00-0xDC7F con 0xE0
	call 051cah		;9ed0   ; rachas_de_zona_a_e740:
	call 05ba1h		;9ed3   ; mapas_de_bits_de_la_zona: los mapas de bits de todas las salas de la zona, desde 0x8000 de la RAM
	call L_804E		;9ed6
	call 05db3h		;9ed9   ; p00:5DB3
	call 05d9dh		;9edc
	call 05afeh		;9edf   ; copia_a_c700: copia en 0xC700 la zona, la sala especial, la Y y la X de Snake y 0xCA50-0xCA51 (salvo en la zona 0x10)
	jp L_8C14		;9ee2
L_9EE5:
	ld a,(0d66ch)		;9ee5
	or a			;9ee8
	ret z			;9ee9
	ld hl,0ca7bh		;9eea
	ld a,(0d7d7h)		;9eed
	bit 5,a		;9ef0
	jr nz,L_9EFD		;9ef2
	ld (hl),001h		;9ef4
	inc hl			;9ef6
	ld (hl),080h		;9ef7
	inc hl			;9ef9
	ld (hl),000h		;9efa
	ret			;9efc
L_9EFD:
	ld (hl),003h		;9efd
	jp L_8AF7		;9eff
L_9F02:
	ld a,(0d670h)		;9f02
	or a			;9f05
	ret z			;9f06
	ld hl,0ca90h		;9f07
	ld a,(0d7d7h)		;9f0a
	bit 3,a		;9f0d
	jr z,L_9F18		;9f0f
	ld b,004h		;9f11
	ld de,00100h		;9f13
	jr L_9F1D		;9f16
L_9F18:
	ld b,001h		;9f18
	ld de,00100h		;9f1a
L_9F1D:
	ld (hl),b			;9f1d
	inc hl			;9f1e
	ld (hl),e			;9f1f
	inc hl			;9f20
	ld (hl),d			;9f21
	ret			;9f22
L_9F23:
	ld a,(0d674h)		;9f23
	or a			;9f26
	ret z			;9f27
	ld hl,0ca89h		;9f28
	ld a,(0d7d4h)		;9f2b
	bit 2,a		;9f2e
	jr nz,L_9F47		;9f30
	bit 3,a		;9f32
	jr nz,L_9F3E		;9f34
	ld (hl),002h		;9f36
	ld hl,0ca8ch		;9f38
	ld (hl),010h		;9f3b
	ret			;9f3d
L_9F3E:
	ld (hl),000h		;9f3e
	ld hl,04000h		;9f40
	ld (0ca8ah),hl		;9f43
	ret			;9f46
L_9F47:
	ld (hl),004h		;9f47
	ld hl,00200h		;9f49
	ld (0ca8ah),hl		;9f4c
	ret			;9f4f
L_9F50:
	ld a,(0d7d5h)		;9f50
	bit 2,a		;9f53
	ret nz			;9f55
	bit 3,a		;9f56
	ret z			;9f58
	ld hl,0cb39h		;9f59
	ld (hl),001h		;9f5c
	ld hl,00080h		;9f5e
	ld (0cb3ah),hl		;9f61
	ret			;9f64
L_9F65:
	ld hl,0d7feh		;9f65
	ld a,(0d7deh)		;9f68
	rra			;9f6b
	jr nc,L_9F70		;9f6c
	set 7,(hl)		;9f6e
L_9F70:
	ld a,(0d7e4h)		;9f70
	rra			;9f73
	jr nc,L_9F78		;9f74
	set 5,(hl)		;9f76
L_9F78:
	rra			;9f78
	ret nc			;9f79
	set 6,(hl)		;9f7a
	ret			;9f7c
L_9F7D:
	ld a,(0ca41h)		;9f7d
	or a			;9f80
	ret nz			;9f81
	ld hl,0d4f5h		;9f82
	ld a,(0cb3fh)		;9f85
	cp 002h		;9f88
	jr c,L_9F8E		;9f8a
	ld a,002h		;9f8c
L_9F8E:
	cp (hl)			;9f8e
	ret z			;9f8f
	ld (hl),a			;9f90
	jp 06ccah		;9f91   ; p01:6CCA
L_9F94:
	ld a,(0cb39h)		;9f94
	or a			;9f97
	ret z			;9f98
	ld a,(0ca5fh)		;9f99
	or a			;9f9c
	ret nz			;9f9d
	ld a,(0cb0fh)		;9f9e
	or a			;9fa1
	ret z			;9fa2
	ld a,(0cb3ch)		;9fa3
	or a			;9fa6
	ret nz			;9fa7
	ld a,(0cb3fh)		;9fa8
	or a			;9fab
	jr nz,L_9FD6		;9fac
	ld a,(0cb51h)		;9fae
	dec a			;9fb1
	jr z,L_9FDD		;9fb2
	ld hl,(0cb3ah)		;9fb4
	dec hl			;9fb7
	ld (0cb3ah),hl		;9fb8
	ld a,l			;9fbb
	or h			;9fbc
	ret nz			;9fbd
	ld hl,00100h		;9fbe
	ld (0cb3ah),hl		;9fc1
	ld hl,0cb51h		;9fc4
	inc (hl)			;9fc7
	ld a,(0cb03h)		;9fc8
	ld e,a			;9fcb
	ld a,(0cb05h)		;9fcc
	ld d,a			;9fcf
	call 079abh		;9fd0   ; p01:79AB
	jp 06a8fh		;9fd3   ; p01:6A8F
L_9FD6:
	ld hl,00004h		;9fd6
	ld (0cb3ah),hl		;9fd9
	ret			;9fdc
L_9FDD:
	call 0af05h		;9fdd
	ld hl,0cb51h		;9fe0
	ld (hl),000h		;9fe3
	ret			;9fe5
L_9FE6:
	ld a,(0cb00h)		;9fe6
	cp 014h		;9fe9
	ret z			;9feb
	ld hl,0cb3dh		;9fec
	ld a,(hl)			;9fef
	or a			;9ff0
	ret nz			;9ff1
	inc (hl)			;9ff2
	inc hl			;9ff3
	ld (hl),010h		;9ff4
	ret			;9ff6
L_9FF7:
	ld hl,0cb3dh		;9ff7
	ld a,(hl)			;9ffa
	or a			;9ffb
	ret z			;9ffc
	inc hl			;9ffd
	dec (hl)			;9ffe
	ret nz			;9fff
