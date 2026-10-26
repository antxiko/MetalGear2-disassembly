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


L_8000:
	ld a,(0ca5fh)		;8000
	dec a			;8003
	jr nz,L_800D		;8004
	ld a,(0d42bh)		;8006
	and a			;8009
	call z,L_831B		;800a
L_800D:
	ld ix,0ce00h		;800d
	ld b,018h		;8011
L_8013:
	push bc			;8013
	ld a,(ix+000h)		;8014
	ld b,a			;8017
	and a			;8018
	jr z,L_8041		;8019
	call L_8061		;801b
	dec b			;801e
	jr z,L_8037		;801f
	dec b			;8021
	jr z,L_8041		;8022
	ld a,(ix+000h)		;8024
	cp 010h		;8027
	jr nc,L_8030		;8029
	call L_804A		;802b
	jr c,L_8041		;802e
L_8030:
	call L_80C8		;8030
	ld b,a			;8033
	call L_83CF		;8034
L_8037:
	call L_810E		;8037
	ld a,(ix+00ch)		;803a
	and a			;803d
	call nz,L_8085		;803e
L_8041:
	ld de,00040h		;8041
	add ix,de		;8044
	pop bc			;8046
	djnz L_8013		;8047
	ret			;8049
L_804A:
	ld hl,0d443h		;804a
	ld a,(hl)			;804d
	ld c,a			;804e
	and a			;804f
	ret z			;8050
	call L_8100		;8051
	jr nz,L_805F		;8054
	dec c			;8056
	jr nz,L_805D		;8057
	inc (hl)			;8059
	call L_9D12		;805a
L_805D:
	scf			;805d
	ret			;805e
L_805F:
	or a			;805f
	ret			;8060
L_8061:
	call L_806F		;8061
	ld b,000h		;8064
	ret nc			;8066
	inc b			;8067
	ld a,(0ca5fh)		;8068
	and a			;806b
	ret z			;806c
	inc b			;806d
	ret			;806e
L_806F:
	push hl			;806f
	push de			;8070
	push bc			;8071
	call L_80BB		;8072
	pop bc			;8075
	pop de			;8076
	pop hl			;8077
	ret			;8078
L_8079:
	ld a,(0cb03h)		;8079   ; lee la Y de Snake
	ld l,a			;807c
	ld a,(0cb05h)		;807d   ; lee la X de Snake
	ld h,a			;8080
	ret			;8081
L_8082:
	ld a,(ix+00ch)		;8082
L_8085:
	push bc			;8085
	call L_80AE		;8086
	pop bc			;8089
	ret			;808a
L_808B:
	call L_809E		;808b
L_808E:
	ld d,(ix+009h)		;808e
	ld e,(ix+008h)		;8091
	call 04442h		;8094   ; de_negativo: DE = -DE
L_8097:
	ld (ix+009h),d		;8097
	ld (ix+008h),e		;809a
	ret			;809d
L_809E:
	ld d,(ix+007h)		;809e
	ld e,(ix+006h)		;80a1
	call 04442h		;80a4   ; de_negativo: DE = -DE
L_80A7:
	ld (ix+007h),d		;80a7
	ld (ix+006h),e		;80aa
	ret			;80ad
L_80AE:
	ld bc,(0c383h)		;80ae   ; lee la copia del banco de 0xA000 y el byte siguiente (16 bits)
	push bc			;80b2
	call 041efh		;80b3   ; bancos_14: pone el 14 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0ba36h		;80b6   ; p14:BA36
	jr L_80E0		;80b9
L_80BB:
	ld bc,(0c383h)		;80bb   ; lee la copia del banco de 0xA000 y el byte siguiente (16 bits)
	push bc			;80bf
	call 041efh		;80c0   ; bancos_14: pone el 14 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b9dch		;80c3   ; p14:B9DC
	jr L_80E0		;80c6
L_80C8:
	ld bc,(0c383h)		;80c8   ; lee la copia del banco de 0xA000 y el byte siguiente (16 bits)
	push bc			;80cc
	call 041efh		;80cd   ; bancos_14: pone el 14 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b842h		;80d0   ; p14:B842
	jr L_80E0		;80d3
L_80D5:
	ld bc,(0c383h)		;80d5   ; lee la copia del banco de 0xA000 y el byte siguiente (16 bits)
	push bc			;80d9
	call 041efh		;80da   ; bancos_14: pone el 14 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b931h		;80dd   ; p14:B931
L_80E0:
	pop bc			;80e0
	push af			;80e1
	ld a,c			;80e2
	jp 041a3h		;80e3
L_80E6:
	ld bc,(0c383h)		;80e6   ; lee la copia del banco de 0xA000 y el byte siguiente (16 bits)
	push bc			;80ea
	call 041efh		;80eb   ; bancos_14: pone el 14 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b88fh		;80ee   ; p14:B88F
	jr L_80E0		;80f1
L_80F3:
	ld bc,(0c383h)		;80f3   ; lee la copia del banco de 0xA000 y el byte siguiente (16 bits)
	push bc			;80f7
	call 041efh		;80f8   ; bancos_14: pone el 14 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0ba17h		;80fb   ; p14:BA17
	jr L_80E0		;80fe
L_8100:
	ld a,(0ca50h)		;8100   ; lee la fila de la sala en la zona (uno mas al salir por arriba)
	cp (ix+00ah)		;8103
	ret nz			;8106
L_8107:
	ld a,(0ca51h)		;8107   ; lee la columna de la sala en la zona (uno mas al salir por la derecha)
	cp (ix+00bh)		;810a
	ret			;810d
L_810E:
	ld a,(0ca5fh)		;810e
	ld b,a			;8111
	and a			;8112
	jr z,L_8119		;8113
	call L_806F		;8115
	ret c			;8118
L_8119:
	ld a,(ix+000h)		;8119
	ld c,a			;811c
	cp 010h		;811d
	jr nc,L_8137		;811f
	ld a,b			;8121
	and a			;8122
	jr z,L_8137		;8123
	call L_8100		;8125
	jr z,L_8137		;8128
	ld a,c			;812a
	cp 00ah		;812b
	jr z,L_8137		;812d
	xor a			;812f
	ld (ix+00ch),a		;8130
	ld (ix+001h),a		;8133
	ret			;8136
L_8137:
	ld a,c			;8137
	and 07fh		;8138
	ld c,a			;813a
	call L_8148		;813b
	ld a,c			;813e
	ld hl,l8159h		;813f
	call 0424eh		;8142   ; salta_por_tabla: salta a la palabra A de la tabla de HL
L_8145:
	jp 04142h		;8145   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
L_8148:
	cp 003h		;8148
	jp z,041bdh		;814a   ; bancos_8: pone el 8 en 0xA000 (con su copia en 0xC381-0xC383)
	cp 00ah		;814d
	jp nc,041bdh		;814f   ; bancos_8: pone el 8 en 0xA000 (con su copia en 0xC381-0xC383)
	ret			;8152
L_8153:
	call 041bdh		;8153   ; bancos_8: pone el 8 en 0xA000 (con su copia en 0xC381-0xC383)
	call L_81C5		;8156
L_8159:
	jr L_8145		;8159

; ----------------------------------------------------------------------
; DATOS sin identificar  0x815b..0x818b  (48 bytes)
DATA_815B:
	defb 039h,09dh,039h,09dh,0f2h,0a1h,039h,09dh,039h,09dh,039h,09dh,039h,09dh,039h,09dh	; 815b  9.9...9.9.9.9.9.
	defb 039h,09dh,00bh,0afh,000h,0a0h,0d6h,0a1h,000h,000h,000h,000h,000h,000h,03bh,0aah	; 816b  9...............
	defb 03bh,0aah,0d0h,0a8h,0ech,0afh,02ah,0ach,043h,0adh,001h,0a4h,001h,0a4h,0e5h,0abh	; 817b  ......*.C.......

; ======================================================================
; CODIGO 0x818b..0x84ed  (866 bytes)
; ======================================================================


L_818B:
	ld ix,0ce00h		;818b
	ld b,018h		;818f
L_8191:
	push bc			;8191
	ld a,(ix+000h)		;8192
	ld c,a			;8195
	and a			;8196
	jr z,L_81B6		;8197
	cp 00ah		;8199
	jr z,L_81B6		;819b
	call L_8100		;819d
	jr nz,L_81B6		;81a0
	ld a,c			;81a2
	cp 015h		;81a3
	jr nz,L_81B3		;81a5
	ld a,(ix+001h)		;81a7
	cp 003h		;81aa
	jr nz,L_81B3		;81ac
	call L_9976		;81ae
	jr L_81B6		;81b1
L_81B3:
	call L_8153		;81b3
L_81B6:
	ld bc,00040h		;81b6
	add ix,bc		;81b9
	pop bc			;81bb
	djnz L_8191		;81bc
	ret			;81be
L_81BF:
	call L_8153		;81bf
	jp 041efh		;81c2   ; bancos_14: pone el 14 en 0xA000 (con su copia en 0xC381-0xC383)
L_81C5:
	call L_820A		;81c5
	ld a,(ix+000h)		;81c8
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
	call L_8273		;81e0
	ex de,hl			;81e3
	ld b,012h		;81e4
L_81E6:
	ld a,(hl)			;81e6
	and a			;81e7
	ret z			;81e8
	push hl			;81e9
	push de			;81ea
	push bc			;81eb
	ld h,000h		;81ec
	dec a			;81ee
	ld l,a			;81ef
	add hl,hl			;81f0
	add hl,hl			;81f1
	add hl,hl			;81f2
	add hl,hl			;81f3
	ld bc,0daa0h		;81f4
	add hl,bc			;81f7
	ex de,hl			;81f8
	ld a,(hl)			;81f9
	inc hl			;81fa
	ld h,(hl)			;81fb
	ld l,a			;81fc
	ex de,hl			;81fd
	call 051e0h		;81fe   ; rachas_a_ram: deshace las rachas de DE en HL (n < 0x80 repite, n > 0x80 copia, 0 acaba)
	pop bc			;8201
	pop de			;8202
	pop hl			;8203
	inc hl			;8204
	inc de			;8205
	inc de			;8206
	djnz L_81E6		;8207
	ret			;8209
L_820A:
	call L_8273		;820a
	ex de,hl			;820d
	push hl			;820e
	ld bc,00011h		;820f
	call 04236h		;8212   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	pop de			;8215
	call L_825D		;8216
	ld a,c			;8219
	ex af,af'			;821a
	ld hl,0d400h		;821b
	ld bc,01600h		;821e
L_8221:
	ld a,(hl)			;8221
	and a			;8222
	jr nz,L_823D		;8223
	ld a,c			;8225
	rra			;8226
	jr c,L_822D		;8227
	ld a,l			;8229
	rra			;822a
	jr c,L_823D		;822b
L_822D:
	ld (hl),001h		;822d
	ld a,b			;822f
	sub 016h		;8230
	neg		;8232
	inc a			;8234
	ld (de),a			;8235
	inc e			;8236
	inc c			;8237
	ex af,af'			;8238
	cp c			;8239
	jr z,L_8240		;823a
	ex af,af'			;823c
L_823D:
	inc hl			;823d
	djnz L_8221		;823e
L_8240:
	ld a,(ix+000h)		;8240
	cp 00bh		;8243
	ret nz			;8245
	ld hl,0d400h		;8246
	ld b,016h		;8249
L_824B:
	ld a,(hl)			;824b
	and a			;824c
	jr nz,L_8259		;824d
	ld (hl),001h		;824f
	ld a,b			;8251
	sub 016h		;8252
	neg		;8254
	inc a			;8256
	ld (de),a			;8257
	ret			;8258
L_8259:
	inc hl			;8259
	djnz L_824B		;825a
	ret			;825c
L_825D:
	ld a,(ix+000h)		;825d
	and 07fh		;8260
	ld c,004h		;8262
	cp 010h		;8264
	ret c			;8266
	ld c,001h		;8267
	cp 017h		;8269
	ret z			;826b
	inc c			;826c
	cp 014h		;826d
	ret nz			;826f
	ld c,012h		;8270
	ret			;8272
L_8273:
	push ix		;8273
	pop de			;8275
	ld a,02eh		;8276
	jp 04243h		;8278   ; suma_a_de: DE = DE + A
L_827B:
	ld a,(0ca4ah)		;827b   ; lee la zona
	cp 004h		;827e
	jr nz,L_8289		;8280
	ld a,(0ca4bh)		;8282   ; lee la sala de la zona
	cp 009h		;8285
	jr z,L_828E		;8287
L_8289:
	ld a,(0ca5fh)		;8289
	and a			;828c
	ret z			;828d
L_828E:
	ld ix,0ce00h		;828e
	ld b,018h		;8292
L_8294:
	push bc			;8294
	ld a,(ix+000h)		;8295
	ld b,a			;8298
	and a			;8299
	jr z,L_82DF		;829a
	rla			;829c
	jr c,L_82DF		;829d
	ld a,b			;829f
	cp 00bh		;82a0
	jr z,L_82DF		;82a2
	ld a,(ix+01bh)		;82a4
	cp 002h		;82a7
	ld c,0afh		;82a9
	jr nz,L_82AF		;82ab
	ld c,0a7h		;82ad
L_82AF:
	ld a,(ix+003h)		;82af
	sub 010h		;82b2
	cp c			;82b4
	jr nc,L_82C5		;82b5
	ld a,(ix+005h)		;82b7
	sub 008h		;82ba
	cp 0b5h		;82bc
	jr nc,L_82C5		;82be
	call L_80D5		;82c0
	jr nc,L_82DF		;82c3
L_82C5:
	ld a,(0ca5fh)		;82c5
	and a			;82c8
	jr z,L_82DF		;82c9
	ld a,(ix+000h)		;82cb
	cp 00ah		;82ce
	jr z,L_82DF		;82d0
	cp 015h		;82d2
	jr z,L_82DF		;82d4
	call L_82FD		;82d6
	call L_8273		;82d9
	call L_8387		;82dc
L_82DF:
	ld bc,00040h		;82df
	add ix,bc		;82e2
	pop bc			;82e4
	ld a,e			;82e5
	add a,008h		;82e6
	ld e,a			;82e8
	djnz L_8294		;82e9
	ld a,(0ca5fh)		;82eb
	cp 003h		;82ee
	ret c			;82f0
	ld a,(0ca76h)		;82f1   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	and a			;82f4
	ret nz			;82f5
	call L_929A		;82f6
	ret c			;82f9
	jp L_924C		;82fa
L_82FD:
	push ix		;82fd
	pop hl			;82ff
	ld de,0d300h		;8300
	call 00020h		;8303   ; BIOS DCOMPR - Compares HL with DE
	ret c			;8306
	ld a,(0ca5fh)		;8307
	dec a			;830a
	ret nz			;830b
	ld a,(0d42bh)		;830c
	and a			;830f
	jr z,L_831B		;8310
	ld hl,0d41fh		;8312
	ld a,(hl)			;8315
	and a			;8316
	jr z,L_831B		;8317
	dec (hl)			;8319
	ret nz			;831a
L_831B:
	call L_929A		;831b
	ret c			;831e
	xor a			;831f
	ld (0ca5fh),a		;8320
	jp L_94B2		;8323
L_8326:
	ld a,(ix+000h)		;8326
	push af			;8329
	call 06a2dh		;832a   ; p01:6A2D
	call L_834C		;832d
	call L_92F4		;8330
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
	jp 07a12h		;8349
L_834C:
	call L_8273		;834c
	ld a,(ix+000h)		;834f
	push af			;8352
	call L_838F		;8353
	pop af			;8356
	cp 013h		;8357
	jr z,L_836A		;8359
	cp 00bh		;835b
	ret nz			;835d
	ld a,(0ca5fh)		;835e
	and a			;8361
	ret z			;8362
	xor a			;8363
	ld (0ca67h),a		;8364
	jp 04f65h		;8367   ; sprites_6517_6113:
L_836A:
	push ix		;836a
	pop hl			;836c
	ld de,0d200h		;836d
	or a			;8370
	sbc hl,de		;8371
	ld b,006h		;8373
L_8375:
	srl h		;8375
	rr l		;8377
	djnz L_8375		;8379
	ld a,l			;837b
	and 007h		;837c
	ld hl,0d4f8h		;837e
	call 0423eh		;8381   ; suma_a_hl: HL = HL + A
	ld (hl),001h		;8384
	ret			;8386
L_8387:
	ld hl,0d426h		;8387
	ld a,(hl)			;838a
	and a			;838b
	jr z,L_838F		;838c
	dec (hl)			;838e
L_838F:
	push de			;838f
	push bc			;8390
	ld a,(ix+000h)		;8391
	cp 00ah		;8394
	push de			;8396
	call z,L_83B5		;8397
	pop de			;839a
	ld (ix+000h),000h		;839b
	ld hl,0d416h		;839f
	ld a,(hl)			;83a2
	and a			;83a3
	jr z,L_83A7		;83a4
	dec (hl)			;83a6
L_83A7:
	call L_80F3		;83a7
	pop bc			;83aa
	pop de			;83ab
	ld a,(ix+000h)		;83ac
	cp 003h		;83af
	ret nz			;83b1
	jp 07a12h		;83b2   ; p01:7A12
L_83B5:
	call L_8100		;83b5
	ret nz			;83b8
	ld (ix+00dh),005h		;83b9
	ld a,(0c383h)		;83bd   ; lee la copia del banco de 0xA000
	push af			;83c0
	call 041bdh		;83c1   ; bancos_8: pone el 8 en 0xA000 (con su copia en 0xC381-0xC383)
	ld de,00001h		;83c4
	call 0aebfh		;83c7   ; p08:AEBF
	pop af			;83ca
	push af			;83cb
	jp 041a3h		;83cc
L_83CF:
	push bc			;83cf
	ld a,(0cb80h)		;83d0
	cp 008h		;83d3
	call z,L_8630		;83d5
	pop bc			;83d8
	ld a,(0ca3ch)		;83d9
	and a			;83dc
	ret nz			;83dd
	ld a,b			;83de
	inc a			;83df
	ret z			;83e0
	ld a,(ix+000h)		;83e1
	and 07fh		;83e4
	cp 015h		;83e6
	jr z,L_83F8		;83e8
	cp 010h		;83ea
	ret nc			;83ec
	cp 003h		;83ed
	jr nz,L_83FE		;83ef
	ld a,(ix+019h)		;83f1
	and a			;83f4
	ret nz			;83f5
	jr L_83FE		;83f6
L_83F8:
	ld a,(ix+001h)		;83f8
	cp 003h		;83fb
	ret z			;83fd
L_83FE:
	ld a,(0ca41h)		;83fe   ; lee la salida de la sala (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	and a			;8401
	ret nz			;8402
	ld a,(0ca5fh)		;8403
	cp 002h		;8406
	ret nc			;8408
	ld a,(0ca65h)		;8409   ; lee el sitio de 0xCBE0 en el que esta Snake (0 = ninguno)
	cp 00dh		;840c
	jr z,L_841D		;840e
	and a			;8410
	jr z,L_8418		;8411
	ld a,(0ca5fh)		;8413
	dec a			;8416
	ret nz			;8417
L_8418:
	ld a,(0cb32h)		;8418
	and a			;841b
	ret nz			;841c
L_841D:
	call L_8100		;841d
	ret nz			;8420
	xor a			;8421
	ld (0d450h),a		;8422
	ld a,(ix+000h)		;8425
	and 07fh		;8428
	cp 015h		;842a
	jp z,L_84B2		;842c
	ld a,(ix+001h)		;842f
	cp 008h		;8432
	ret z			;8434
	call L_84A4		;8435
	ret c			;8438
	ld a,(0ca5fh)		;8439
	cp 002h		;843c
	jr nc,L_8455		;843e
	call L_96BA		;8440
	jr c,L_8455		;8443
	ld a,(0cb21h)		;8445
	cp 00ah		;8448
	jr z,L_845B		;844a
	cp 00bh		;844c
	jr nz,L_8455		;844e
L_8450:
	ld a,(0cb0fh)		;8450   ; lee 1 si Snake ha chocado en este cuadro
	and a			;8453
	ret nz			;8454
L_8455:
	call a_p12_758d		;8455   ; a_p12_758d: p12:758D con el banco 12 en 0x6000
	jp L_9949		;8458
L_845B:
	ld a,(ix+000h)		;845b
	cp 00ah		;845e
	jr nc,L_8450		;8460
	ld a,(ix+001h)		;8462
	sub 025h		;8465
	cp 002h		;8467
	jr c,L_8450		;8469
	ld a,(0cb03h)		;846b   ; lee la Y de Snake
	sub (ix+003h)		;846e
	jr nc,L_8475		;8471
	neg		;8473
L_8475:
	cp 030h		;8475
	jr nc,L_8450		;8477
	ld a,(0cb05h)		;8479   ; lee la X de Snake
	sub (ix+005h)		;847c
	jr nc,L_8483		;847f
	neg		;8481
L_8483:
	cp 030h		;8483
	jr nc,L_8450		;8485
	ld hl,0d42eh		;8487
	ld a,(hl)			;848a
	and a			;848b
	ret nz			;848c
	ld (hl),001h		;848d
	ld a,(ix+00ch)		;848f
	ld (ix+022h),a		;8492
	ld (ix+00ch),000h		;8495
	ld a,(ix+001h)		;8499
	ld (ix+020h),a		;849c
	ld (ix+001h),025h		;849f
	ret			;84a3
L_84A4:
	xor a			;84a4
	ld (0d450h),a		;84a5
	push bc			;84a8
	call L_84F5		;84a9
	pop bc			;84ac
	jp z,L_8518		;84ad
	scf			;84b0
	ret			;84b1
L_84B2:
	ld a,(ix+001h)		;84b2
	cp 003h		;84b5
	ret nc			;84b7
	ld a,b			;84b8
	ld hl,084edh		;84b9
	call 043f6h		;84bc   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld a,l			;84bf
	exx			;84c0
	ld d,a			;84c1
	ld e,000h		;84c2
	ld a,(ix+003h)		;84c4
	sub 008h		;84c7
	ld h,a			;84c9
	ld l,(ix+002h)		;84ca
	exx			;84cd
	ld d,h			;84ce
	ld e,000h		;84cf
	ld h,(ix+005h)		;84d1
	ld l,(ix+004h)		;84d4
	call L_8571		;84d7
	ret c			;84da
	ld a,(0cb21h)		;84db
	sub 00ah		;84de
	cp 002h		;84e0
	jp nc,L_9949		;84e2
	ld a,(0cb0fh)		;84e5   ; lee 1 si Snake ha chocado en este cuadro
	and a			;84e8
	ret nz			;84e9
	jp L_9949		;84ea

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


L_84F5:
	push bc			;84f5
	call L_84FC		;84f6
	pop bc			;84f9
	cp b			;84fa
	ret			;84fb
L_84FC:
	call L_8079		;84fc
L_84FF:
	ld d,(ix+005h)		;84ff
	ld e,(ix+003h)		;8502
	call 079d1h		;8505   ; a_p02_86c3: angulo_hacia (p02:86C3) con el banco 2
L_8508:
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
L_8518:
	call L_8079		;8518
	ex de,hl			;851b
L_851C:
	ld b,000h		;851c
	ld a,e			;851e
	sub (ix+003h)		;851f
	jr nc,L_8528		;8522
	neg		;8524
	set 0,b		;8526
L_8528:
	ld h,a			;8528
	ld l,000h		;8529
	ld a,d			;852b
	sub (ix+005h)		;852c
	jr nc,L_8535		;852f
	neg		;8531
	set 1,b		;8533
L_8535:
	ld d,a			;8535
	ld e,000h		;8536
	call 00020h		;8538   ; BIOS DCOMPR - Compares HL with DE
	ld c,000h		;853b
	jr nc,L_8542		;853d
	ld c,001h		;853f
	ex de,hl			;8541
L_8542:
	srl h		;8542
	rr l		;8544
	srl d		;8546
	rr e		;8548
	ld a,h			;854a
	cp 008h		;854b
	jr nc,L_8542		;854d
	ld a,c			;854f
	and a			;8550
	jr z,L_8554		;8551
	ex de,hl			;8553
L_8554:
	rr b		;8554
	call c,0443ah		;8556   ; hl_negativo: HL = -HL (PR2 p00:5BBD)
	rr b		;8559
	call c,04442h		;855b   ; de_negativo: DE = -DE
	push hl			;855e
	exx			;855f
	pop de			;8560
	ld a,(ix+003h)		;8561
	sub 010h		;8564
	ld h,a			;8566
	ld l,(ix+002h)		;8567
	exx			;856a
	ld h,(ix+005h)		;856b
	ld l,(ix+004h)		;856e
L_8571:
	xor a			;8571
	ld (0d8bdh),a		;8572
L_8575:
	ld c,000h		;8575
	add hl,de			;8577
	ld a,h			;8578
	cp 0c0h		;8579
	ccf			;857b
	ret c			;857c
	exx			;857d
	ld c,000h		;857e
	add hl,de			;8580
	ld a,h			;8581
	cp 0c0h		;8582
	ccf			;8584
	ret c			;8585
	exx			;8586
	push hl			;8587
	ld l,a			;8588
	ld (0d8bbh),hl		;8589
	exx			;858c
	ld a,d			;858d
	exx			;858e
	rla			;858f
	ld b,003h		;8590
	ld a,(0ca5dh)		;8592   ; lee el angulo hacia el destino entero (0-0xFF)
	sub 008h		;8595
	and 01fh		;8597
	cp 010h		;8599
	jr nc,L_859F		;859b
	ld b,001h		;859d
L_859F:
	call L_85DF		;859f
	pop hl			;85a2
	ret c			;85a3
	push hl			;85a4
	ld hl,(0d8bbh)		;85a5
	call L_85B4		;85a8
	ld hl,0d8bdh		;85ab
	inc (hl)			;85ae
	pop hl			;85af
	jr nc,L_8575		;85b0
	or a			;85b2
	ret			;85b3
L_85B4:
	ld a,(0d450h)		;85b4
	and a			;85b7
	jr nz,L_85CE		;85b8
	ld a,(0cb03h)		;85ba   ; lee la Y de Snake
	sub 004h		;85bd
	sub l			;85bf
	cp 018h		;85c0
	ret nc			;85c2
	ld a,(0cb05h)		;85c3   ; lee la X de Snake
	sub 006h		;85c6
	sub h			;85c8
	neg		;85c9
	cp 00ch		;85cb
	ret			;85cd
L_85CE:
	ld a,(0cb83h)		;85ce
	sub l			;85d1
	call L_85DA		;85d2
	ret nc			;85d5
	ld a,(0cb85h)		;85d6
	sub h			;85d9
L_85DA:
	add a,008h		;85da
	cp 010h		;85dc
	ret			;85de
L_85DF:
	ld a,(0d840h)		;85df
	cp 00ah		;85e2
	jr z,L_85F9		;85e4
	ld a,(ix+000h)		;85e6
	and 07fh		;85e9
	cp 015h		;85eb
	jr z,L_85F3		;85ed
	cp 00ah		;85ef
	jr nz,L_85F9		;85f1
L_85F3:
	push bc			;85f3
	call L_860F		;85f4
	pop bc			;85f7
	ret nc			;85f8
L_85F9:
	push bc			;85f9
	call L_8607		;85fa
	pop bc			;85fd
	ret nc			;85fe
	ld a,l			;85ff
	add a,008h		;8600
	ld l,a			;8602
	djnz L_85F9		;8603
	scf			;8605
	ret			;8606
L_8607:
	ld a,l			;8607
	cp 0c0h		;8608
	ccf			;860a
	ret c			;860b
	jp 07f37h		;860c   ; p01:7F37
L_860F:
	ld a,(ix+000h)		;860f
	and 07fh		;8612
	cp 00ah		;8614
	ld b,003h		;8616
	jr z,L_8624		;8618
	ld a,(ix+00dh)		;861a
	ld b,001h		;861d
	dec a			;861f
	jr nz,L_8624		;8620
	ld b,005h		;8622
L_8624:
	ld a,(ix+011h)		;8624
	rla			;8627
	ccf			;8628
	ret nc			;8629
	ld a,(0d8bdh)		;862a
	cp b			;862d
	ccf			;862e
	ret			;862f
L_8630:
	ld a,(0d44fh)		;8630
	and a			;8633
	ret nz			;8634
	ld a,(0ca5fh)		;8635
	cp 002h		;8638
	ret nc			;863a
	ld a,(ix+000h)		;863b
	and 07fh		;863e
	cp 010h		;8640
	ret nc			;8642
	call L_8100		;8643
	ret nz			;8646
	push bc			;8647
	ld a,(0cb83h)		;8648
	ld l,a			;864b
	ld a,(0cb85h)		;864c
	ld h,a			;864f
	push hl			;8650
	call L_84FF		;8651
	pop de			;8654
	pop bc			;8655
	cp b			;8656
	ret nz			;8657
	ld a,d			;8658
	add a,008h		;8659
	ld d,a			;865b
	ld a,e			;865c
	add a,008h		;865d
	ld e,a			;865f
	ld a,001h		;8660
	ld (0d450h),a		;8662
	call L_851C		;8665
	ret c			;8668
	ld a,001h		;8669
	ld (0d44fh),a		;866b
	jp L_9CFE		;866e
L_8671:
	ld hl,0ca26h		;8671
	ld a,(hl)			;8674
	and a			;8675
	ret nz			;8676
	xor a			;8677
	ld (0ca18h),a		;8678   ; guarda la espera hasta poner la musica pendiente
	inc a			;867b
	ld (0ca26h),a		;867c
	ld hl,00000h		;867f
	ld (0ca19h),hl		;8682   ; guarda la musica pendiente: la rutina que la pide (16 bits)
L_8685:
	ld a,(ix+000h)		;8685
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
; DATOS sin identificar  0x8699..0x86a4  (11 bytes)
DATA_8699:
	defb 001h,001h,003h,000h,002h,003h,000h,003h,003h,000h,003h	; 8699  ...........

; ======================================================================
; CODIGO 0x86a4..0x8a75  (977 bytes)
; ======================================================================


L_86A4:
	ld hl,0ca26h		;86a4
	ld a,(hl)			;86a7
	and a			;86a8
	ret z			;86a9
	ld (hl),000h		;86aa
	call 07a12h		;86ac
	ld a,(ix+000h)		;86af
	cp 001h		;86b2
	jp z,041f7h		;86b4   ; bancos_15: pone el 15 en 0xA000 (con su copia en 0xC381-0xC383)
	cp 002h		;86b7
	jp z,041cdh		;86b9   ; bancos_10: pone el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	cp 006h		;86bc
	jp z,041cdh		;86be   ; bancos_10: pone el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	ret			;86c1
L_86C2:
	ld a,001h		;86c2
	ld (0ca26h),a		;86c4
	ld hl,00000h		;86c7
	ld (0ca19h),hl		;86ca   ; guarda la musica pendiente: la rutina que la pide (16 bits)
	jp 06bd0h		;86cd   ; p01:6BD0
L_86D0:
	ld de,0c692h		;86d0
	jr L_86D8		;86d3
L_86D5:
	ld de,0c693h		;86d5
L_86D8:
	ld a,(de)			;86d8
	and a			;86d9
	ret z			;86da
	xor a			;86db
	ld (de),a			;86dc
	jp (hl)			;86dd
L_86DE:
	ld b,001h		;86de
	inc (ix+011h)		;86e0
	ld a,(ix+011h)		;86e3
	and b			;86e6
	ret nz			;86e7
	call L_902E		;86e8
	xor a			;86eb
	ret			;86ec
L_86ED:
	ld a,(ix+000h)		;86ed
	cp 00bh		;86f0
	ret nz			;86f2
	ld a,(0d8a0h)		;86f3
	cp 002h		;86f6
	ret c			;86f8
	call L_87C1		;86f9
	call L_87E1		;86fc
	push hl			;86ff
	push ix		;8700
	pop hl			;8702
	ld de,0d800h		;8703
	or a			;8706
	sbc hl,de		;8707
	ld a,l			;8709
	srl a		;870a
	ld de,0dc28h		;870c
	call 04243h		;870f   ; suma_a_de: DE = DE + A
	pop hl			;8712
	call L_8764		;8713
	push ix		;8716
	pop hl			;8718
	ld de,0d800h		;8719
	or a			;871c
	sbc hl,de		;871d
	add hl,hl			;871f
	ld de,0daa0h		;8720
	add hl,de			;8723
	ex de,hl			;8724
	jp L_880A		;8725
L_8728:
	ld bc,0000fh		;8728
L_872B:
	ld hl,0dc28h		;872b
	ld a,0e0h		;872e
	jp 04237h		;8730   ; llena_bloque: pone A en BC + 1 bytes desde HL
L_8733:
	call L_8739		;8733
	jp 041efh		;8736   ; bancos_14: pone el 14 en 0xA000 (con su copia en 0xC381-0xC383)
L_8739:
	call L_8728		;8739
L_873C:
	ld a,(ix+000h)		;873c
	and a			;873f
	ret z			;8740
	call L_8100		;8741
	ret nz			;8744
	call L_87C1		;8745
	call L_87E1		;8748
	call L_8761		;874b
	jp L_8807		;874e
a_p14_af96:		; p14:AF96 con el banco 14 en 0xA000
	call 041efh		;8751   ; bancos_14: pone el 14 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0af96h		;8754
	jr L_87BE		;8757
a_p14_ae76:		; p14:AE76 con el banco 14 en 0xA000
	call 041efh		;8759   ; bancos_14: pone el 14 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0ae76h		;875c
	jr L_87BE		;875f
L_8761:
	ld de,0dc28h		;8761
L_8764:
	call 0418eh		;8764   ; bancos_56: pone el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	exx			;8767
	push de			;8768
	push bc			;8769
	ld a,(hl)			;876a
	ld de,0d8e0h		;876b   ; apunta a 1: el juego de dibujos solo pinta sus listas 6 y 7
	push de			;876e
	ldi		;876f
	add a,004h		;8771
	ld (de),a			;8773
	inc de			;8774
	ld a,(hl)			;8775
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
	add a,004h		;8783
	ld e,a			;8785
	exx			;8786
	ld b,002h		;8787
L_8789:
	ld a,(ix+003h)		;8789
	add a,(ix+013h)		;878c
	ld c,a			;878f
	ld a,(hl)			;8790
	add a,a			;8791
	ld a,0e0h		;8792
	jr z,L_8798		;8794
	ld a,(hl)			;8796
	add a,c			;8797
L_8798:
	ld (de),a			;8798
	exx			;8799
	ld (de),a			;879a
	inc de			;879b
	exx			;879c
	inc hl			;879d
	inc de			;879e
	ld a,(ix+005h)		;879f
	add a,(hl)			;87a2
	ld (de),a			;87a3
	exx			;87a4
	ld (de),a			;87a5
	inc de			;87a6
	exx			;87a7
	inc hl			;87a8
	inc de			;87a9
	exx			;87aa
	ld a,(hl)			;87ab
	inc hl			;87ac
	exx			;87ad
	ld (de),a			;87ae
	exx			;87af
	ld a,(hl)			;87b0
	inc hl			;87b1
	ld (de),a			;87b2
	ld a,e			;87b3
	add a,006h		;87b4
	ld e,a			;87b6
	exx			;87b7
	ld a,e			;87b8
	add a,006h		;87b9
	ld e,a			;87bb
	djnz L_8789		;87bc
L_87BE:
	jp 04142h		;87be   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
L_87C1:
	call 0418eh		;87c1   ; bancos_56: pone el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	exx			;87c4
	ld a,(ix+000h)		;87c5
	ld hl,0abe5h		;87c8
	call 043f6h		;87cb   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld a,(ix+00dh)		;87ce
	cp 080h		;87d1
	jr c,L_87D8		;87d3
	ld hl,0acddh		;87d5
L_87D8:
	and 07fh		;87d8
	add a,a			;87da
	call 0423eh		;87db   ; suma_a_hl: HL = HL + A
	exx			;87de
	jr L_87BE		;87df
L_87E1:
	call 0418eh		;87e1   ; bancos_56: pone el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	ld a,(ix+000h)		;87e4
	ld hl,0ab35h		;87e7
	call 043f6h		;87ea   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld a,(ix+00dh)		;87ed
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
L_8807:
	ld de,0daa0h		;8807
L_880A:
	call 0418eh		;880a   ; bancos_56: pone el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	ld a,(ix+00dh)		;880d
	ld b,a			;8810
	cp 082h		;8811
	ld hl,0ae23h		;8813
	jr c,L_881B		;8816
	ld hl,0ae2ch		;8818
L_881B:
	ld a,b			;881b
	cp 080h		;881c
	jr nc,L_8861		;881e
	ld a,(ix+000h)		;8820
	ld b,a			;8823
	ld hl,0ace1h		;8824
	call 043f6h		;8827   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld a,b			;882a
	cp 003h		;882b
	jr z,L_8857		;882d
	cp 004h		;882f
	jr z,L_884B		;8831
	cp 00ah		;8833
	jr nz,L_8861		;8835
	ld a,(ix+00dh)		;8837
	cp 014h		;883a
	jr c,L_8861		;883c
	ld a,(ix+00eh)		;883e
	and 003h		;8841
	ld hl,0ade2h		;8843
	call 043f6h		;8846   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	jr L_8861		;8849
L_884B:
	ld a,(ix+00dh)		;884b
	cp 008h		;884e
	jr c,L_8861		;8850
	ld hl,0ad6ch		;8852
	jr L_8861		;8855
L_8857:
	ld a,(ix+00dh)		;8857
	cp 012h		;885a
	jr nz,L_8861		;885c
	ld hl,0ad89h		;885e
L_8861:
	ld a,(ix+017h)		;8861
	ld b,a			;8864
	and a			;8865
	jr z,L_8892		;8866
	ld a,(ix+000h)		;8868
	cp 005h		;886b
	jr z,L_8892		;886d
	ld a,b			;886f
	rra			;8870
	jr c,L_8892		;8871
	ld a,(ix+000h)		;8873
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
	call 051e0h		;8893   ; rachas_a_ram: deshace las rachas de DE en HL (n < 0x80 repite, n > 0x80 copia, 0 acaba)
	call 04142h		;8896   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	ld a,(ix+000h)		;8899
	cp 007h		;889c
	ret nz			;889e
	ld a,(ix+00dh)		;889f
	cp 008h		;88a2
	ret nz			;88a4
	ld hl,0daa8h		;88a5
	ld bc,00007h		;88a8
	call 04236h		;88ab   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	ld hl,0dab8h		;88ae
	ld bc,00027h		;88b1
	jp 04236h		;88b4   ; borra_bloque: pone a cero BC + 1 bytes desde HL
L_88B7:
	ld a,(0d800h)		;88b7
	dec a			;88ba
	jp z,L_8947		;88bb
	dec a			;88be
	ret nz			;88bf
	call L_8940		;88c0
	ret nz			;88c3
	ld hl,0d8a6h		;88c4
	ld a,(hl)			;88c7
	and a			;88c8
	jr nz,L_8915		;88c9
	inc (hl)			;88cb
	xor a			;88cc
	ld h,a			;88cd
	ld l,a			;88ce
	ld bc,00080h		;88cf
	ld d,001h		;88d2
	call 046ffh		;88d4   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
	call 0418eh		;88d7   ; bancos_56: pone el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	ld hl,00302h		;88da
	ld (0ca4ch),hl		;88dd   ; guarda los 4 bits altos del byte de la sala (p56:BD28) y el byte siguiente (16 bits)
	ld de,0aa35h		;88e0
	ld hl,0e900h		;88e3   ; apunta a los caracteres de un dibujo pasados a 4 bits
	call 051e0h		;88e6   ; rachas_a_ram: deshace las rachas de DE en HL (n < 0x80 repite, n > 0x80 copia, 0 acaba)
	ld hl,0e900h		;88e9   ; apunta a los caracteres de un dibujo pasados a 4 bits
	ld de,00000h		;88ec
L_88EF:
	ld a,(hl)			;88ef
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
	ld h,000h		;8907
	ld l,h			;8909
	ld d,h			;890a
	ld b,h			;890b
	ld e,040h		;890c
	ld c,080h		;890e
	ld a,009h		;8910
	call 04767h		;8912   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
L_8915:
	call L_89B4		;8915
	ld a,(0d801h)		;8918
	cp 006h		;891b
	ret c			;891d
	ld hl,00040h		;891e
	ld de,03080h		;8921
	ld bc,06080h		;8924
	ld a,002h		;8927
	call 04767h		;8929   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
	call 041cdh		;892c   ; bancos_10: pone el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	ld a,(0d80dh)		;892f
	push af			;8932
	call 0ab7dh		;8933   ; p10:AB7D
	pop af			;8936
	dec a			;8937
	and 003h		;8938
	call 0ab7dh		;893a
	jp 04142h		;893d   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
L_8940:
	ld ix,0d800h		;8940
	jp L_8100		;8944
L_8947:
	call L_8940		;8947
	ret nz			;894a
	ld hl,04800h		;894b
	ld de,00000h		;894e
	ld bc,03060h		;8951
	call 0474dh		;8954   ; copia_rectangulo_a_esta: p00:4767 de la otra pagina (0xCA42 ^ 1) a la de 0xCA42
L_8957:
	ld de,03000h		;8957
L_895A:
	call 0418eh		;895a   ; bancos_56: pone el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	ld hl,00303h		;895d
	ld (0ca4ch),hl		;8960   ; guarda los 4 bits altos del byte de la sala (p56:BD28) y el byte siguiente (16 bits)
	ld hl,0a9edh		;8963
	ld bc,00c06h		;8966
	call L_896F		;8969
	jp 04142h		;896c   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
L_896F:
	push bc			;896f
	push de			;8970
	ld b,c			;8971
L_8972:
	ld a,(hl)			;8972
	call 04a0bh		;8973   ; pieza_de_sala_a_la_otra: el caracter A de la sala (p00:4A36) de la pagina 2 a la otra
	inc hl			;8976
	ld a,d			;8977
	add a,008h		;8978
	ld d,a			;897a
	djnz L_8972		;897b
	pop de			;897d
	ld a,e			;897e
	add a,008h		;897f
	ld e,a			;8981
	pop bc			;8982
	djnz L_896F		;8983
	ret			;8985
L_8986:
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
	ld hl,0d800h		;8997
	ld a,(hl)			;899a
	cp 001h		;899b
	ret nz			;899d
	inc hl			;899e
	ld a,(hl)			;899f
	and a			;89a0
	ld de,04800h		;89a1
	jp z,L_895A		;89a4
	ret			;89a7
L_89A8:
	ld a,(0c383h)		;89a8   ; lee la copia del banco de 0xA000
	push af			;89ab
	call 041a0h		;89ac   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b239h		;89af   ; p06:B239
	jr L_89BE		;89b2
L_89B4:
	ld a,(0c383h)		;89b4   ; lee la copia del banco de 0xA000
	push af			;89b7
	call 041a0h		;89b8   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b1fdh		;89bb   ; p06:B1FD
L_89BE:
	pop af			;89be
	push af			;89bf
	jp 041a3h		;89c0
L_89C3:
	call L_8C77		;89c3
	ld ix,0d800h		;89c6
	ld a,(0d8a0h)		;89ca
	and a			;89cd
	jr nz,L_8A34		;89ce
	ld a,(ix+000h)		;89d0
	cp 006h		;89d3
	jr z,L_89E0		;89d5
	cp 005h		;89d7
	jr z,L_89E0		;89d9
	ld a,(0ca77h)		;89db
	and a			;89de
	ret nz			;89df
L_89E0:
	ld a,(0ca76h)		;89e0   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	and a			;89e3
	ld b,003h		;89e4
	jr z,L_8A36		;89e6
	ld ix,0d860h		;89e8
L_89EC:
	ld a,(ix+000h)		;89ec
	and a			;89ef
	ret z			;89f0
	call L_8A4B		;89f1
	ld a,(ix+017h)		;89f4
	and a			;89f7
	ret z			;89f8
	dec (ix+017h)		;89f9
	jr nz,L_8A24		;89fc
	ld a,(ix+000h)		;89fe
	ld c,a			;8a01
	cp 005h		;8a02
	ret z			;8a04
	cp 009h		;8a05
	jr nz,L_8A0D		;8a07
	ld (ix+013h),000h		;8a09
L_8A0D:
	ld a,(ix+010h)		;8a0d
	and a			;8a10
	ret z			;8a11
	ld a,c			;8a12
	cp 00bh		;8a13
	jr nz,L_8A1F		;8a15
	ld a,(ix+001h)		;8a17
	sub 003h		;8a1a
	cp 004h		;8a1c
	ret nc			;8a1e
L_8A1F:
	ld (ix+016h),001h		;8a1f
	ret			;8a23
L_8A24:
	ld a,(ix+000h)		;8a24
	cp 002h		;8a27
	jr z,L_8A2E		;8a29
	cp 004h		;8a2b
	ret nz			;8a2d
L_8A2E:
	ld a,(ix+017h)		;8a2e
	jp L_8D48		;8a31
L_8A34:
	ld b,004h		;8a34
L_8A36:
	push bc			;8a36
	call L_89EC		;8a37
	ld a,(ix+000h)		;8a3a
	cp 00bh		;8a3d
	call z,L_86ED		;8a3f
	ld bc,00020h		;8a42
	add ix,bc		;8a45
	pop bc			;8a47
	djnz L_8A36		;8a48
	ret			;8a4a
L_8A4B:
	ld a,(0cb00h)		;8a4b   ; lee el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	cp 00eh		;8a4e
	jr z,L_8A69		;8a50
	ld a,(ix+001h)		;8a52
	sub 020h		;8a55
	ld hl,08ad8h		;8a57
	jp nc,0424eh		;8a5a   ; salta_por_tabla: salta a la palabra A de la tabla de HL
	ld a,(ix+000h)		;8a5d
	dec a			;8a60
	ld hl,08a8dh		;8a61
	call 0424eh		;8a64   ; salta_por_tabla: salta a la palabra A de la tabla de HL
	jr L_8A6F		;8a67
L_8A69:
	ld a,(ix+001h)		;8a69
	cp 020h		;8a6c
	ret nc			;8a6e
L_8A6F:
	ld a,(ix+000h)		;8a6f
	call 0424dh		;8a72   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_8A75: 23 destinos del despachador p00:424D (call en p04:8A72, el
;   indice en A): 8BDF, 8AD0, 8BDF, 8739, 8739, 8BDF, 8AC8, B2CD, BD3B, 8739,
;   B56A, 8BDF, 8AAB, 8AA3, A5F3, AC1F, AFA4, 8AB3, B2B2, BD46, B923, B573,
;   8ABC; lo leen p04:8A72 (46 bytes)
;   0x8a75..0x8aa3  (46 bytes)
DATA_tabla_8A75:
	defw 08bdfh,08ad0h,08bdfh,08739h,08739h,08bdfh,08ac8h,0b2cdh	; 8a75
	defw 0bd3bh,08739h,0b56ah,08bdfh,08aabh,08aa3h,0a5f3h,0ac1fh	; 8a85
	defw 0afa4h,08ab3h,0b2b2h,0bd46h,0b923h,0b573h,08abch	; 8a95

; ======================================================================
; CODIGO 0x8aa3..0x8ad8  (53 bytes)
; ======================================================================


a_p10_aa78:		; p10:AA78 con el banco 10 en 0xA000
	call 041cdh		;8aa3   ; bancos_10: pone el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0aa78h		;8aa6   ; p10:AA78
	jr L_8AB9		;8aa9
a_p15_b8ec:		; p15:B8EC con el banco 15 en 0xA000
	call 041f7h		;8aab   ; bancos_15: pone el 15 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b8ech		;8aae   ; p15:B8EC
	jr L_8AB9		;8ab1
a_p14_ab9e:		; p14:AB9E con el banco 14 en 0xA000
	call 041efh		;8ab3   ; bancos_14: pone el 14 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0ab9eh		;8ab6   ; p14:AB9E
L_8AB9:
	jp 04142h		;8ab9   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
a_p14_ad0f:		; p14:AD0F con el banco 14 en 0xA000
	call 041efh		;8abc   ; bancos_14: pone el 14 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0ad0fh		;8abf   ; p14:AD0F
	jr L_8AB9		;8ac2
L_8AC4:
	call 07a88h		;8ac4   ; rutina_de_fase_b_1_4_5: rutina_de_fase y deja los bancos 1, 4 y 5
	jp (hl)			;8ac7
L_8AC8:
	ld a,(0ca77h)		;8ac8
	and a			;8acb
	ret nz			;8acc
	jp L_8739		;8acd
a_p15_b800:		; p15:B800 con el banco 15 en 0xA000
	call 041f7h		;8ad0   ; bancos_15: pone el 15 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b800h		;8ad3   ; p15:B800
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


L_8AF4:
	call L_8C59		;8af4
	xor a			;8af7
	ld (ix+00fh),a		;8af8
	ld (ix+00ch),a		;8afb
	inc a			;8afe
	ld (0d8aeh),a		;8aff
	ld (0cb3ch),a		;8b02
	ld a,(ix+000h)		;8b05
	cp 001h		;8b08
	jr z,L_8B30		;8b0a
	cp 002h		;8b0c
	jr z,L_8B27		;8b0e
	cp 008h		;8b10
	jr z,L_8B41		;8b12
	ld (ix+00eh),00ch		;8b14
	ld (ix+00dh),080h		;8b18
	call 06faeh		;8b1c
	call L_8C68		;8b1f
	call L_8BDC		;8b22
	jr L_8B3B		;8b25
L_8B27:
	ld (ix+00eh),048h		;8b27
	ld (ix+001h),026h		;8b2b
	ret			;8b2f
L_8B30:
	ld (ix+00eh),018h		;8b30
	ld (ix+001h),02ah		;8b34
	call L_8100		;8b38
L_8B3B:
	call 06b12h		;8b3b
	jp 06c3fh		;8b3e
L_8B41:
	call L_8D78		;8b41
	ld a,003h		;8b44
	ld (0cb5ah),a		;8b46
	call 07a68h		;8b49   ; a_p03_a8d8: p03:A8D8 con el banco 3 en 0xA000
	ld a,00dh		;8b4c
	ld (0cb01h),a		;8b4e   ; guarda el dibujo de Snake (al darse la vuelta se le suma 1, 3 o 5 segun 0xCB00)
	ret			;8b51
L_8B52:
	dec (ix+00eh)		;8b52
	jr z,L_8B64		;8b55
	ld a,(ix+00eh)		;8b57
	and 003h		;8b5a
	jr nz,L_8B61		;8b5c
	inc (ix+00dh)		;8b5e
L_8B61:
	jp L_8739		;8b61
L_8B64:
	xor a			;8b64
	ld (0d8aeh),a		;8b65
	call L_8728		;8b68
L_8B6B:
	ld (ix+00eh),018h		;8b6b
	jp L_8BDC		;8b6f
L_8B72:
	dec (ix+00eh)		;8b72
	ret nz			;8b75
	call L_8B90		;8b76
	call L_8728		;8b79
	ld a,(ix+000h)		;8b7c
	cp 005h		;8b7f
	jr z,L_8B8B		;8b81
	cp 00ah		;8b83
	jr z,L_8B8B		;8b85
	cp 006h		;8b87
	jr nz,L_8B6B		;8b89
L_8B8B:
	ld (ix+001h),024h		;8b8b
	ret			;8b8f
L_8B90:
	ld a,(ix+000h)		;8b90
	ld hl,08baah		;8b93
	call 04248h		;8b96   ; byte_de_tabla: A = el byte A de la tabla de HL (y HL apunta a el)
	and a			;8b99
	jr nz,L_8BA2		;8b9a
	call 06278h		;8b9c   ; p01:6278
	call 06c53h		;8b9f   ; p01:6C53
L_8BA2:
	ld a,(0ca52h)		;8ba2   ; lee el ancho de la barra de vida (lo maximo)
	ld (0ca53h),a		;8ba5   ; guarda la vida de Snake (lo largo de la barra)
	jp 042a2h		;8ba8   ; barras_bancos_1_4_5: p00:4288 y los bancos 1, 4 y 5

; ----------------------------------------------------------------------
; DATOS sin identificar  0x8bab..0x8bb6  (11 bytes)
DATA_8BAB:
	defb 000h,001h,000h,000h,000h,000h,000h,001h,001h,001h,000h	; 8bab  ...........

; ======================================================================
; CODIGO 0x8bb6..0x8f2a  (884 bytes)
; ======================================================================


L_8BB6:
	xor a			;8bb6
	ld (0cb3ch),a		;8bb7
	ld (ix+016h),a		;8bba
	ld a,(ix+000h)		;8bbd
	cp 00ah		;8bc0
	ld b,00ah		;8bc2
	jr z,L_8BD2		;8bc4
	cp 009h		;8bc6
	ld b,002h		;8bc8
	jr z,L_8BD2		;8bca
	inc b			;8bcc
	cp 006h		;8bcd
	jr nz,L_8BD2		;8bcf
	inc b			;8bd1
L_8BD2:
	ld a,(0ca4bh)		;8bd2   ; lee la sala de la zona
	cp b			;8bd5
	ret nz			;8bd6
	ld a,001h		;8bd7
	ld (0cb3ch),a		;8bd9
L_8BDC:
	inc (ix+001h)		;8bdc
L_8BDF:
	ret			;8bdf
L_8BE0:
	ld a,(ix+000h)		;8be0
	cp 00ah		;8be3
	ld hl,0d509h		;8be5
	jr nz,L_8BED		;8be8
	ld hl,0d529h		;8bea
L_8BED:
	ld (hl),001h		;8bed
	jr L_8C14		;8bef
L_8BF1:
	dec (ix+00eh)		;8bf1
	ret nz			;8bf4
	ld a,(ix+000h)		;8bf5
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
	call 06c3bh		;8c0e   ; p01:6C3B
	call L_8C4A		;8c11
L_8C14:
	ld a,(ix+000h)		;8c14
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
	xor a			;8c30
	ld (0ca26h),a		;8c31
	ld (ix+000h),a		;8c34
	ld (ix+001h),a		;8c37
	ld (0cb3ch),a		;8c3a
	ld a,b			;8c3d
	cp 001h		;8c3e
	ret z			;8c40
	cp 008h		;8c41
	ret z			;8c43
	ld bc,0000fh		;8c44
	jp L_872B		;8c47
L_8C4A:
	ld a,(ix+005h)		;8c4a
	sub 008h		;8c4d
	ld d,a			;8c4f
	ld a,(ix+003h)		;8c50
	sub 008h		;8c53
	ld e,a			;8c55
	jp 07ac0h		;8c56   ; a_p02_905e: p02:905E con el banco 2 en 0x8000
L_8C59:
	ld a,(ix+000h)		;8c59
	ld hl,0d87fh		;8c5c
	call 0423eh		;8c5f   ; suma_a_hl: HL = HL + A
	ld (hl),0ffh		;8c62
	ret			;8c64
L_8C65:
	call L_8C59		;8c65
L_8C68:
	ld a,(0c383h)		;8c68   ; lee la copia del banco de 0xA000
	push af			;8c6b
	call 041a0h		;8c6c   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b14eh		;8c6f   ; p06:B14E
L_8C72:
	pop af			;8c72
	push af			;8c73
	jp 041a3h		;8c74
L_8C77:
	ld a,(0c383h)		;8c77   ; lee la copia del banco de 0xA000
	push af			;8c7a
	call 041a0h		;8c7b   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b1dah		;8c7e   ; p06:B1DA
	jr L_8C72		;8c81
L_8C83:
	call 041cdh		;8c83   ; bancos_10: pone el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0ad12h		;8c86   ; p10:AD12
	call 04142h		;8c89   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	dec (ix+00eh)		;8c8c
	ret nz			;8c8f
	call 06f5eh		;8c90   ; p01:6F5E
	ld (ix+00eh),060h		;8c93
	xor a			;8c97
	ld (ix+00fh),a		;8c98
	inc a			;8c9b
	ld (0d8bah),a		;8c9c
	jp L_8BDC		;8c9f
L_8CA2:
	call 041cdh		;8ca2   ; bancos_10: pone el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0adc3h		;8ca5   ; p10:ADC3
	call 0ae9ch		;8ca8   ; p10:AE9C
	call 04142h		;8cab   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	dec (ix+00eh)		;8cae
	jp nz,L_8D45		;8cb1
	xor a			;8cb4
	call L_8D48		;8cb5
	call L_8B3B		;8cb8
	call 045f1h		;8cbb   ; apaga_pantalla_y_sprites: p00:45CC y p00:45F6
	ld (ix+00eh),030h		;8cbe
	jp L_8BDC		;8cc2
L_8CC5:
	push ix		;8cc5
	call 045beh		;8cc7   ; scroll_a_cero: R#23 = 0 (el desplazamiento vertical)
	xor a			;8cca
	ld (0d8aeh),a		;8ccb
	ld (0ca1ch),a		;8cce
	ld (0d8a5h),a		;8cd1
	ld (0d8a4h),a		;8cd4
	ld (0d6b0h),a		;8cd7
	ld (0cb21h),a		;8cda
	ld (0cb20h),a		;8cdd
	ld (0cb35h),a		;8ce0
	ld (0cb00h),a		;8ce3   ; guarda el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	ld (0cb01h),a		;8ce6   ; guarda el dibujo de Snake (al darse la vuelta se le suma 1, 3 o 5 segun 0xCB00)
	ld (0d760h),a		;8ce9
	inc a			;8cec
	ld (0cb3ch),a		;8ced
	ld hl,0cc80h		;8cf0
	ld bc,0007fh		;8cf3
	call 04236h		;8cf6   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	ld a,009h		;8cf9
	ld (0d820h),a		;8cfb
	call L_8D78		;8cfe
	ld d,000h		;8d01
	call 04be4h		;8d03   ; borra_toda_la_pagina: p00:46FF desde (0,0) con BC = 0 y A = 0 en la pagina D
	ld d,001h		;8d06
	call 04be4h		;8d08   ; borra_toda_la_pagina: p00:46FF desde (0,0) con BC = 0 y A = 0 en la pagina D
	call 07a80h		;8d0b   ; a_p02_9db1: p02:9DB1 con el banco 2 en 0x8000
	call 05df4h		;8d0e   ; p00:5DF4
	call 04270h		;8d11   ; marcador_bancos_1_4_5: rehace el marcador (p00:4279) y deja los bancos 1, 4 y 5
	ld a,001h		;8d14
	call L_8D48		;8d16
	ld a,060h		;8d19
	ld (0cb03h),a		;8d1b   ; guarda la Y de Snake
	ld (0cb05h),a		;8d1e   ; guarda la X de Snake
	ld a,002h		;8d21
	ld (0cb0eh),a		;8d23   ; guarda la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	call 05010h		;8d26   ; sprites_de_7762:
	call 05476h		;8d29   ; marcador_y_ventana_bancos_5:
	call 0437eh		;8d2c   ; copia_marcador_a_la_otra: copia las lineas 0x16-0x51 de la pagina en la que se dibuja a la otra (YMMM)
	call 04650h		;8d2f   ; espera_vdp: espera a que el VDP acabe la orden en curso (S#2 bit 0)
	ld bc,00600h		;8d32
	call 00047h		;8d35   ; BIOS WRTVDP - Writes data in the VDP-register
	call 06caeh		;8d38
	pop ix		;8d3b
	jp 04606h		;8d3d   ; enciende_todo: la pantalla y los sprites encendidos
L_8D40:
	dec (ix+00eh)		;8d40
	jr z,L_8D52		;8d43
L_8D45:
	ld a,(ix+00eh)		;8d45
L_8D48:
	rra			;8d48
	ld bc,00f07h		;8d49
	jr c,L_8D4F		;8d4c
	ld b,c			;8d4e
L_8D4F:
	jp 00047h		;8d4f   ; BIOS WRTVDP - Writes data in the VDP-register
L_8D52:
	ld bc,0001fh		;8d52
	call L_872B		;8d55
	jp L_8BDC		;8d58
L_8D5B:
	xor a			;8d5b
	ld (0d8aeh),a		;8d5c
	call 06fbeh		;8d5f   ; p01:6FBE
	call 041a0h		;8d62   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b2d6h		;8d65   ; p06:B2D6
	call 04142h		;8d68   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	jp L_8B6B		;8d6b
L_8D6E:
	call 041a0h		;8d6e   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b31dh		;8d71   ; p06:B31D
	call 04142h		;8d74   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	ret c			;8d77
L_8D78:
	call L_8C68		;8d78
	jp L_8C14		;8d7b
L_8D7E:
	call 041bdh		;8d7e   ; bancos_8: pone el 8 en 0xA000 (con su copia en 0xC381-0xC383)
	call L_8D99		;8d81
	call L_8E19		;8d84
	call L_8E33		;8d87
	call L_8E65		;8d8a
	call 04142h		;8d8d   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	ld a,003h		;8d90
	ld (ix+00fh),a		;8d92
L_8D95:
	inc (ix+001h)		;8d95
	ret			;8d98
L_8D99:
	ld a,(0ca4ah)		;8d99   ; lee la zona
	ld hl,0b050h		;8d9c
	call 043f6h		;8d9f   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld a,(ix+011h)		;8da2
	jp 043f6h		;8da5   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
a_p08_a13b:		; p08:A13B con el banco 8 en 0xA000
	call 041bdh		;8da8   ; bancos_8: pone el 8 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a13bh		;8dab   ; p08:A13B
	jr L_8DDB		;8dae
L_8DB0:
	call 041bdh		;8db0   ; bancos_8: pone el 8 en 0xA000 (con su copia en 0xC381-0xC383)
	call L_8D99		;8db3
	ld d,h			;8db6
	ld e,l			;8db7
	ld a,(ix+00fh)		;8db8
	call 04248h		;8dbb   ; byte_de_tabla: A = el byte A de la tabla de HL (y HL apunta a el)
	inc a			;8dbe
	call z,L_8DDE		;8dbf
	ld a,(hl)			;8dc2
	rla			;8dc3
	jr c,L_8DE4		;8dc4
	call L_8E19		;8dc6
	call L_8E33		;8dc9
	call L_8E65		;8dcc
	ld a,(ix+00fh)		;8dcf
	add a,003h		;8dd2
	ld (ix+00fh),a		;8dd4
	ld (ix+001h),001h		;8dd7
L_8DDB:
	jp 04142h		;8ddb   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
L_8DDE:
	ld (ix+00fh),000h		;8dde
	ex de,hl			;8de2
	ret			;8de3
L_8DE4:
	ld a,(hl)			;8de4
	and 003h		;8de5
	add a,a			;8de7
	ld (ix+00dh),a		;8de8
	ld (ix+015h),a		;8deb
	call 04142h		;8dee   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	ld (ix+00ch),000h		;8df1
	ld (ix+00eh),080h		;8df5
	inc (ix+00fh)		;8df9
	ld a,(ix+000h)		;8dfc
	cp 006h		;8dff
	jp nz,L_8D95		;8e01
	ld (ix+00eh),020h		;8e04
	ld a,(ix+02dh)		;8e08
	inc (ix+02dh)		;8e0b
	rra			;8e0e
	ld a,010h		;8e0f
	jr nc,L_8E15		;8e11
	ld a,013h		;8e13
L_8E15:
	ld (ix+001h),a		;8e15
	ret			;8e18
L_8E19:
	ld a,(hl)			;8e19
	rla			;8e1a
	rla			;8e1b
	ld a,000h		;8e1c
	jr nc,L_8E21		;8e1e
	inc a			;8e20
L_8E21:
	ld (ix+01ah),a		;8e21
	ret			;8e24
a_p06_b592_b_4_5:		; a_p06_b592 y deja los bancos 4 y 5
	call a_p06_b592		;8e25   ; a_p06_b592: p06:B592 con el banco 6 en 0xA000
	jr L_8DDB		;8e28
L_8E2A:
	call a_p06_b592		;8e2a   ; a_p06_b592: p06:B592 con el banco 6 en 0xA000
	call 0413fh		;8e2d   ; bancos_1_4_5: pone el 1 en 0x6000, el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	jp 041efh		;8e30   ; bancos_14: pone el 14 en 0xA000 (con su copia en 0xC381-0xC383)
L_8E33:
	ld a,(hl)			;8e33
	and 003h		;8e34
	inc hl			;8e36
a_p06_b592:		; p06:B592 con el banco 6 en 0xA000
	call 041a0h		;8e37   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b592h		;8e3a   ; p06:B592
	jp 041bdh		;8e3d   ; bancos_8: pone el 8 en 0xA000 (con su copia en 0xC381-0xC383)
L_8E40:
	ld a,c			;8e40
	add a,a			;8e41
	add a,a			;8e42
	call 04243h		;8e43   ; suma_a_de: DE = DE + A
	ld a,(de)			;8e46
	ld (ix+006h),a		;8e47
	inc de			;8e4a
	ld a,(de)			;8e4b
	ld (ix+007h),a		;8e4c
	inc de			;8e4f
	ld a,(de)			;8e50
	ld (ix+008h),a		;8e51
	inc de			;8e54
	ld a,(de)			;8e55
	ld (ix+009h),a		;8e56
	ld a,c			;8e59
	cp 002h		;8e5a
	ld a,001h		;8e5c
	jr c,L_8E61		;8e5e
	inc a			;8e60
L_8E61:
	ld (ix+00ch),a		;8e61
	ret			;8e64
L_8E65:
	ld a,(hl)			;8e65
	call L_8E75		;8e66
	ld (ix+012h),e		;8e69
	ld (ix+013h),d		;8e6c
	inc hl			;8e6f
	ld a,(hl)			;8e70
	ld (ix+014h),a		;8e71
	ret			;8e74
L_8E75:
	push af			;8e75
	rrca			;8e76
	rrca			;8e77
	rrca			;8e78
	rrca			;8e79
	and 00fh		;8e7a
	ld e,a			;8e7c
	pop af			;8e7d
	and 00fh		;8e7e
	ld d,a			;8e80
	ret			;8e81
L_8E82:
	ld a,(ix+00ah)		;8e82
	cp (ix+012h)		;8e85
	jr nz,L_8EB9		;8e88
	ld a,(ix+00bh)		;8e8a
	cp (ix+013h)		;8e8d
	jr nz,L_8EB9		;8e90
	ld a,(ix+00ch)		;8e92
	rra			;8e95
	ld a,(ix+003h)		;8e96
	ld b,(ix+007h)		;8e99
	jr c,L_8EA4		;8e9c
	ld a,(ix+005h)		;8e9e
	ld b,(ix+009h)		;8ea1
L_8EA4:
	ld c,(ix+014h)		;8ea4
	rl b		;8ea7
	jr c,L_8EB7		;8ea9
	neg		;8eab
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
	call L_80E6		;8eb9
	or a			;8ebc
	ret			;8ebd
L_8EBE:
	ld a,(0c383h)		;8ebe   ; lee la copia del banco de 0xA000
	push af			;8ec1
	call 041a0h		;8ec2   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b5fbh		;8ec5   ; p06:B5FB
L_8EC8:
	pop af			;8ec8
	push af			;8ec9
	jp 041a3h		;8eca
L_8ECD:
	ld a,(0c383h)		;8ecd   ; lee la copia del banco de 0xA000
	push af			;8ed0
	call 041a0h		;8ed1   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b626h		;8ed4   ; p06:B626
	jr L_8EC8		;8ed7
L_8ED9:
	ld a,(ix+000h)		;8ed9
	cp 00bh		;8edc
	jr z,L_8EF2		;8ede
	cp 00ch		;8ee0
	jr z,L_8EF2		;8ee2
	dec (ix+00eh)		;8ee4
	jr z,L_8EF2		;8ee7
L_8EE9:
	ld a,(0ca03h)		;8ee9   ; lee el contador de cuadros (uno mas en cada interrupcion)
	and 007h		;8eec
	ret nz			;8eee
	jp a_p06_b5e2		;8eef   ; a_p06_b5e2: p06:B5E2 con el banco 6 en 0xA000
L_8EF2:
	ld a,(ix+022h)		;8ef2
	ld (ix+00ch),a		;8ef5
	ld a,(ix+020h)		;8ef8
	ld (ix+001h),a		;8efb
	ld a,(ix+015h)		;8efe
	ld (ix+00dh),a		;8f01
	ld (ix+010h),003h		;8f04
	ld (ix+00eh),010h		;8f08
	ret			;8f0c
a_p06_b5e2:		; p06:B5E2 con el banco 6 en 0xA000
	call 041a0h		;8f0d   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b5e2h		;8f10   ; p06:B5E2
	jp 04142h		;8f13   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
L_8F16:
	call L_806F		;8f16
	ret c			;8f19
	ld a,(ix+001h)		;8f1a
	cp 008h		;8f1d
	jp z,L_8ECD		;8f1f
	cp 009h		;8f22
	jp z,L_8ED9		;8f24
	call 0424dh		;8f27   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_8F2A: 4 destinos del despachador p00:424D (call en p04:8F27, el
;   indice en A): 8F32, 8F56, 8FAD, 8FBB; lo leen p04:8F27 (8 bytes)
;   0x8f2a..0x8f32  (8 bytes)
DATA_tabla_8F2A:
	defw 08f32h,08f56h,08fadh,08fbbh	; 8f2a  -> L_8F32 L_8F56 L_8FAD L_8FBB

; ======================================================================
; CODIGO 0x8f32..0x915c  (554 bytes)
; ======================================================================


L_8F32:
	ld a,(ix+01ch)		;8f32
	and a			;8f35
	jr z,L_8F3C		;8f36
	dec (ix+01ch)		;8f38
	ret nz			;8f3b
L_8F3C:
	call L_90A9		;8f3c
	call L_908C		;8f3f
	and b			;8f42
	call L_907A		;8f43
	call a_p06_b592		;8f46   ; a_p06_b592: p06:B592 con el banco 6 en 0xA000
	call 04256h		;8f49   ; azar: A = un numero al azar (0xCA03 rotado mas R)
	and 00fh		;8f4c
	add a,008h		;8f4e
	ld (ix+00eh),a		;8f50
	jp L_8D95		;8f53
L_8F56:
	call L_90C8		;8f56
	ld a,(ix+00dh)		;8f59
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
	ld a,b			;8f70
	and c			;8f71
	jr nz,L_8F79		;8f72
	dec (ix+00eh)		;8f74
	jr nz,L_8F95		;8f77
L_8F79:
	call L_8FD4		;8f79
	push af			;8f7c
	call L_8F9A		;8f7d
	pop af			;8f80
	call a_p06_b592		;8f81   ; a_p06_b592: p06:B592 con el banco 6 en 0xA000
	ld (ix+00eh),004h		;8f84
	ld a,(ix+00ch)		;8f88
	ld (ix+016h),a		;8f8b
	ld (ix+00ch),000h		;8f8e
	jp L_8D95		;8f92
L_8F95:
	ld b,004h		;8f95
	jp L_9022		;8f97
L_8F9A:
	ld a,(ix+00ch)		;8f9a
	ld b,a			;8f9d
	rra			;8f9e
	jr nc,L_8FA6		;8f9f
	call L_809E		;8fa1
	jr L_8FA9		;8fa4
L_8FA6:
	call L_808E		;8fa6
L_8FA9:
	ld a,b			;8fa9
	jp L_8085		;8faa
L_8FAD:
	dec (ix+00eh)		;8fad
	ret nz			;8fb0
	call L_9B4D		;8fb1
	ld (ix+00eh),002h		;8fb4
	jp L_8D95		;8fb8
L_8FBB:
	dec (ix+00eh)		;8fbb
	ret nz			;8fbe
	call 04256h		;8fbf   ; azar: A = un numero al azar (0xCA03 rotado mas R)
	and 01fh		;8fc2
	or 010h		;8fc4
	ld (ix+00eh),a		;8fc6
	ld a,(ix+016h)		;8fc9
	ld (ix+00ch),a		;8fcc
	ld (ix+001h),001h		;8fcf
	ret			;8fd3
L_8FD4:
	call L_90C8		;8fd4
	call L_90A9		;8fd7
	call L_908C		;8fda
	and b			;8fdd
	ld d,a			;8fde
	ld e,c			;8fdf
	ld hl,00400h		;8fe0
L_8FE3:
	xor a			;8fe3
	rr e		;8fe4
	rla			;8fe6
	rr d		;8fe7
	jr nc,L_8FF0		;8fe9
	and a			;8feb
	jr nz,L_8FF0		;8fec
	ld a,l			;8fee
	ret			;8fef
L_8FF0:
	dec h			;8ff0
	inc l			;8ff1
	jr nz,L_8FE3		;8ff2
	call 04256h		;8ff4   ; azar: A = un numero al azar (0xCA03 rotado mas R)
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
	ld a,(ix+019h)		;900b
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
	ld a,(ix+000h)		;901c
	cp 003h		;901f
	ret nz			;9021
L_9022:
	inc (ix+018h)		;9022
	ld a,(ix+018h)		;9025
	cp b			;9028
	ret c			;9029
	ld (ix+018h),000h		;902a
L_902E:
	ld a,(ix+00dh)		;902e
	rra			;9031
	ccf			;9032
	rla			;9033
	ld (ix+00dh),a		;9034
	ret			;9037
L_9038:
	call L_90C8		;9038
	ld a,(ix+00ch)		;903b
	rra			;903e
	ld a,003h		;903f
	jr c,L_9045		;9041
	ld a,00ch		;9043
L_9045:
	and c			;9045
	ret			;9046
L_9047:
	exx			;9047
	ld hl,0d41ch		;9048
	ld de,0d41dh		;904b
	exx			;904e
	ld a,(ix+00ch)		;904f
	rra			;9052
	ld bc,020a0h		;9053
	ld d,(ix+007h)		;9056
	ld e,(ix+003h)		;9059
	jr c,L_906A		;905c
	ld bc,008b0h		;905e
	ld d,(ix+009h)		;9061
	ld e,(ix+005h)		;9064
	exx			;9067
	ex de,hl			;9068
	exx			;9069
L_906A:
	ld a,e			;906a
	sub b			;906b
	cp c			;906c
	ret nc			;906d
	rl d		;906e
	exx			;9070
	ld a,(hl)			;9071
	exx			;9072
	jr c,L_9078		;9073
	cp e			;9075
	ccf			;9076
	ret			;9077
L_9078:
	cp e			;9078
	ret			;9079
L_907A:
	ld bc,00300h		;907a
L_907D:
	rra			;907d
	jr c,L_9083		;907e
	inc c			;9080
	djnz L_907D		;9081
L_9083:
	ld a,c			;9083
	ret			;9084
L_9085:
	call L_8079		;9085
	ld a,h			;9088
	ld h,l			;9089
	ld l,a			;908a
	ret			;908b
L_908C:
	call L_9085		;908c
L_908F:
	ld d,(ix+003h)		;908f
	ld e,(ix+005h)		;9092
L_9095:
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
L_90A9:
	call L_9085		;90a9
L_90AC:
	ld d,(ix+003h)		;90ac
	ld e,(ix+005h)		;90af
L_90B2:
	ld b,000h		;90b2
	ld a,h			;90b4
	sub d			;90b5
	jr nc,L_90BC		;90b6
	set 0,b		;90b8
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
L_90C8:
	ld h,(ix+005h)		;90c8
	ld l,(ix+003h)		;90cb
L_90CE:
	ld c,000h		;90ce
	call L_9120		;90d0
	push hl			;90d3
	push ix		;90d4
	pop hl			;90d6
	ld de,0d800h		;90d7
	call 00020h		;90da   ; BIOS DCOMPR - Compares HL with DE
	ld de,0915ch		;90dd
	jr c,L_90E5		;90e0
	ld de,09164h		;90e2
L_90E5:
	pop hl			;90e5
	xor a			;90e6
	ld (0d4e6h),a		;90e7
L_90EA:
	ld b,004h		;90ea
L_90EC:
	push hl			;90ec
	push bc			;90ed
	ld a,(de)			;90ee
	add a,l			;90ef
	ld l,a			;90f0
	inc de			;90f1
	ld a,(de)			;90f2
	add a,h			;90f3
	ld h,a			;90f4
	inc de			;90f5
	push de			;90f6
	call L_913A		;90f7
	pop de			;90fa
	pop bc			;90fb
	pop hl			;90fc
	call c,L_9104		;90fd
	djnz L_90EC		;9100
	or a			;9102
	ret			;9103
L_9104:
	ld a,(0d4e6h)		;9104
	and a			;9107
	jr nz,L_9115		;9108
	ld a,b			;910a
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
L_9120:
	push hl			;9120
	push ix		;9121
	pop hl			;9123
	ld de,0d800h		;9124
	call 00020h		;9127   ; BIOS DCOMPR - Compares HL with DE
	ld de,0916ch		;912a
	jr c,L_9132		;912d
	ld de,09174h		;912f
L_9132:
	pop hl			;9132
	ld a,001h		;9133
	ld (0d4e6h),a		;9135
	jr L_90EA		;9138
L_913A:
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
	call 07f3dh		;9153
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


L_917C:
	ld a,(0caa0h)		;917c
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
	ld a,(0ca5fh)		;919b
	and a			;919e
	ret z			;919f
	dec a			;91a0
	jr z,L_921D		;91a1
	dec a			;91a3
	jr z,L_91AF		;91a4
	ld a,(0ca76h)		;91a6   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 031h		;91a9
	ret z			;91ab
	jp L_924C		;91ac
L_91AF:
	call L_9278		;91af
	ret z			;91b2
	call L_926C		;91b3
	jp z,L_924C		;91b6
	call L_9256		;91b9
	ld ix,0ce00h		;91bc
	ld bc,01800h		;91c0
	ld de,00040h		;91c3
L_91C6:
	ld a,(ix+000h)		;91c6
	and a			;91c9
	jr z,L_91FD		;91ca
	call L_806F		;91cc
	jr c,L_91FD		;91cf
	call L_8100		;91d1
	jr nz,L_91FD		;91d4
	ld a,(ix+000h)		;91d6
	and 07fh		;91d9
	cp 015h		;91db
	jr z,L_9210		;91dd
	cp 010h		;91df
	jr nc,L_91FD		;91e1
	cp 00ch		;91e3
	jr z,L_91F5		;91e5
	cp 00ah		;91e7
	jr z,L_91F9		;91e9
	sub 002h		;91eb
	cp 002h		;91ed
	ld a,001h		;91ef
	jr nc,L_91F5		;91f1
	ld a,002h		;91f3
L_91F5:
	ld (ix+001h),000h		;91f5
L_91F9:
	ld (ix+000h),a		;91f9
	inc c			;91fc
L_91FD:
	add ix,de		;91fd
	djnz L_91C6		;91ff
	call L_96BA		;9201
	ret c			;9204
	call 05a11h		;9205   ; d41a_y_compania_c: 0xD41A = 0xD41F = 2
	ld a,c			;9208
	and a			;9209
	ret nz			;920a
	ld hl,0ca60h		;920b
	inc (hl)			;920e
	ret			;920f
L_9210:
	push ix		;9210
	push bc			;9212
	push de			;9213
	call L_9976		;9214
	pop de			;9217
	pop bc			;9218
	pop ix		;9219
	jr L_91FD		;921b
L_921D:
	call L_9278		;921d
	ret z			;9220
	call L_926C		;9221
	jp z,L_924C		;9224
	ld hl,0d42ah		;9227
	ld a,(hl)			;922a
	and a			;922b
	jr z,L_9232		;922c
	ld (hl),000h		;922e
	jr L_924C		;9230
L_9232:
	ld hl,(0ca50h)		;9232   ; lee la fila de la sala en la zona (uno mas al salir por arriba) y el byte siguiente (16 bits)
	ld de,(0d428h)		;9235
	ld a,h			;9239
	sub d			;923a
	jr nc,L_923F		;923b
	neg		;923d
L_923F:
	cp 002h		;923f
	jr nc,L_924C		;9241
	ld a,l			;9243
	sub e			;9244
	jr nc,L_9249		;9245
	neg		;9247
L_9249:
	cp 002h		;9249
	ret c			;924b
L_924C:
	call L_9431		;924c
	xor a			;924f
	ld (0ca5fh),a		;9250
	jp L_94B2		;9253
L_9256:
	ld a,(0ca4ah)		;9256   ; lee la zona
	cp 004h		;9259
	ret nz			;925b
	ld a,(0ca4bh)		;925c   ; lee la sala de la zona
	cp 006h		;925f
	ret nz			;9261
	ld hl,0ca5fh		;9262
	ld a,(hl)			;9265
	cp 003h		;9266
	ret nc			;9268
	ld (hl),003h		;9269
	ret			;926b
L_926C:
	ld a,(0c383h)		;926c   ; lee la copia del banco de 0xA000
	push af			;926f
	call 041a0h		;9270   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b532h		;9273   ; p06:B532
	jr L_92A4		;9276
L_9278:
	call L_928B		;9278
	ld a,b			;927b
	dec b			;927c
	jp z,L_924C		;927d
	dec b			;9280
	jp z,L_94A2		;9281
	dec b			;9284
	jp z,L_9488		;9285
	or 001h		;9288
	ret			;928a
L_928B:
	ld a,(0c383h)		;928b   ; lee la copia del banco de 0xA000
	push af			;928e
	call 041f7h		;928f   ; bancos_15: pone el 15 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0bdb8h		;9292   ; p15:BDB8
L_9295:
	pop af			;9295
L_9296:
	push af			;9296
	jp 041a3h		;9297
L_929A:
	ld a,(0c383h)		;929a   ; lee la copia del banco de 0xA000
	push af			;929d
	call 041a0h		;929e   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b55ah		;92a1   ; p06:B55A
L_92A4:
	pop bc			;92a4
	ld a,b			;92a5
	jr L_9296		;92a6
L_92A8:
	ld a,(0c383h)		;92a8   ; lee la copia del banco de 0xA000
	push af			;92ab
	call 041f7h		;92ac   ; bancos_15: pone el 15 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0be48h		;92af   ; p15:BE48
	jr L_9295		;92b2
L_92B4:
	ld a,(0c383h)		;92b4   ; lee la copia del banco de 0xA000
	push af			;92b7
	call 041f7h		;92b8   ; bancos_15: pone el 15 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0be64h		;92bb   ; p15:BE64
	jr L_92A4		;92be
L_92C0:
	call L_92C7		;92c0
	ret nz			;92c3
	jp L_924C		;92c4
L_92C7:
	ld a,(0c383h)		;92c7   ; lee la copia del banco de 0xA000
	push af			;92ca
	call 041f7h		;92cb   ; bancos_15: pone el 15 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0bed7h		;92ce   ; p15:BED7
	jr L_92A4		;92d1
L_92D3:
	ld a,(0c383h)		;92d3   ; lee la copia del banco de 0xA000
	push af			;92d6
	call 041f7h		;92d7   ; bancos_15: pone el 15 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0bf5bh		;92da   ; p15:BF5B
	jr L_9295		;92dd
L_92DF:
	ld a,(0c383h)		;92df   ; lee la copia del banco de 0xA000
	push af			;92e2
	call 041f7h		;92e3   ; bancos_15: pone el 15 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0bf0dh		;92e6   ; p15:BF0D
	jr L_9295		;92e9
L_92EB:
	push hl			;92eb
	call L_929A		;92ec
	pop hl			;92ef
	ret c			;92f0
	ld (hl),002h		;92f1
	ret			;92f3
L_92F4:
	ld a,(0caa0h)		;92f4
	cp 004h		;92f7
	ret z			;92f9
	call L_96BA		;92fa
	ret c			;92fd
	ld a,(0ca5fh)		;92fe
	cp 002h		;9301
	ret c			;9303
	jr z,L_930D		;9304
L_9306:
	call L_929A		;9306
	ret c			;9309
	jp L_924C		;930a
L_930D:
	call L_96BA		;930d
	ret c			;9310
	ld a,(0ca4ah)		;9311   ; lee la zona
	cp 011h		;9314
	ret z			;9316
	cp 004h		;9317
	jr nz,L_9322		;9319
	ld a,(0ca4bh)		;931b   ; lee la sala de la zona
	cp 009h		;931e
	jr z,L_9306		;9320
L_9322:
	ld hl,0d425h		;9322
	inc (hl)			;9325
	ld a,(hl)			;9326
	inc hl			;9327
	inc hl			;9328
	cp (hl)			;9329
	ret c			;932a
	call L_929A		;932b
	ret c			;932e
	ld a,(0ca76h)		;932f   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	and a			;9332
	ld hl,0d41eh		;9333
	jr z,L_933B		;9336
	ld hl,0d449h		;9338
L_933B:
	ld a,(0d4f4h)		;933b
	ld (hl),a			;933e
	ld a,01eh		;933f
	ld (0d417h),a		;9341
	ld a,002h		;9344
	ld (0d41ah),a		;9346
	ld (0d41fh),a		;9349
L_934C:
	call L_9961		;934c
	xor a			;934f
	ld (0d416h),a		;9350
	ld (0d42ah),a		;9353
	inc a			;9356
	ld (0ca5fh),a		;9357
	call L_92A8		;935a
	call L_936B		;935d
	call L_982F		;9360
	ld a,(0c697h)		;9363
	and a			;9366
	ret nz			;9367
	jp 06bech		;9368   ; p01:6BEC
L_936B:
	ld hl,(0ca50h)		;936b   ; lee la fila de la sala en la zona (uno mas al salir por arriba) y el byte siguiente (16 bits)
	ld (0d428h),hl		;936e
	ret			;9371
L_9372:
	ld a,(0ca5fh)		;9372
	dec a			;9375
	ret nz			;9376
	ld hl,(0d42bh)		;9377
	ld a,h			;937a
	or l			;937b
	jp z,L_9306		;937c
	call L_946F		;937f
	ret z			;9382
	ld hl,0d417h		;9383
	ld a,(hl)			;9386
	and a			;9387
	jr z,L_9393		;9388
	dec (hl)			;938a
	ret nz			;938b
	xor a			;938c
	ld (0d416h),a		;938d
	jp L_9431		;9390
L_9393:
	ld a,(0d443h)		;9393
	and a			;9396
	ret nz			;9397
	ld hl,0d43eh		;9398
	inc (hl)			;939b
	ld a,(hl)			;939c
	and 03fh		;939d
	ret nz			;939f
	ld a,(0ca77h)		;93a0
	and a			;93a3
	jr z,L_93B2		;93a4
	dec a			;93a6
	ret nz			;93a7
	ld b,001h		;93a8
	ld c,003h		;93aa
	ld de,05460h		;93ac
	jp L_9786		;93af
L_93B2:
	ld a,(0ca65h)		;93b2   ; lee el sitio de 0xCBE0 en el que esta Snake (0 = ninguno)
	and a			;93b5
	jr z,L_93C2		;93b6
	ld b,000h		;93b8
	ld c,002h		;93ba
	ld de,0b060h		;93bc
	jp L_9786		;93bf
L_93C2:
	ld a,(0ca76h)		;93c2   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	and a			;93c5
	jr z,L_93DA		;93c6
	call L_941E		;93c8
	jp z,L_9306		;93cb
	ld de,(0d447h)		;93ce
	ld a,(0d449h)		;93d2
	ld b,a			;93d5
	ld c,001h		;93d6
	jr L_93F9		;93d8
L_93DA:
	call L_92B4		;93da
	jp c,L_9306		;93dd
	call L_941E		;93e0
	jp z,L_924C		;93e3
	ld hl,(0d418h)		;93e6
	call 07f3dh		;93e9
	jp c,L_9306		;93ec
	ld de,(0d418h)		;93ef
	ld a,(0d41eh)		;93f3
	ld b,a			;93f6
	ld c,000h		;93f7
L_93F9:
	ld hl,0d41ah		;93f9
	ld a,(hl)			;93fc
	and a			;93fd
	ret z			;93fe
	dec (hl)			;93ff
	ld a,e			;9400
	ld e,d			;9401
	ld d,a			;9402
	ld a,b			;9403
	cp 003h		;9404
	ld b,e			;9406
	jr c,L_940A		;9407
	ld b,d			;9409
L_940A:
	push af			;940a
	ld a,b			;940b
	add a,004h		;940c
	and 0f8h		;940e
	ld b,a			;9410
	pop af			;9411
	jr c,L_9417		;9412
	ld d,b			;9414
	jr L_9418		;9415
L_9417:
	ld e,b			;9417
L_9418:
	call L_936B		;9418
	jp L_9786		;941b
L_941E:
	ld a,(0d44ah)		;941e
	cp 0ffh		;9421
	jp z,L_942E		;9423
	ld hl,0d580h		;9426
	call 04248h		;9429   ; byte_de_tabla: A = el byte A de la tabla de HL (y HL apunta a el)
	and a			;942c
	ret			;942d
L_942E:
	or 001h		;942e
	ret			;9430
L_9431:
	push ix		;9431
	ld ix,0ce00h		;9433
	ld b,018h		;9437
L_9439:
	ld a,(ix+000h)		;9439
	and a			;943c
	jr z,L_9465		;943d
	cp 010h		;943f
	jr nc,L_9465		;9441
	cp 00ah		;9443
	jr nz,L_945C		;9445
	ld a,(0ca5fh)		;9447
	cp 002h		;944a
	jr nc,L_9465		;944c
	ld a,(ix+001h)		;944e
	dec a			;9451
	cp 003h		;9452
	jr c,L_9465		;9454
	ld (ix+001h),000h		;9456
	jr L_9465		;945a
L_945C:
	call L_8100		;945c
	jr z,L_9465		;945f
	ld (ix+000h),000h		;9461
L_9465:
	ld de,00040h		;9465
	add ix,de		;9468
	djnz L_9439		;946a
	pop ix		;946c
	ret			;946e
L_946F:
	ld hl,(0d42bh)		;946f
	dec hl			;9472
	ld (0d42bh),hl		;9473
	push hl			;9476
	call L_9877		;9477
	pop hl			;947a
	ld a,h			;947b
	or l			;947c
	ret nz			;947d
	ld a,001h		;947e
	ld (0d42ah),a		;9480
	call 06a60h		;9483   ; p01:6A60
	xor a			;9486
	ret			;9487
L_9488:
	call 0437eh		;9488   ; copia_marcador_a_la_otra: copia las lineas 0x16-0x51 de la pagina en la que se dibuja a la otra (YMMM)
	call L_94A2		;948b
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
L_94A2:
	call L_9431		;94a2
	xor a			;94a5
	ld (0ca5fh),a		;94a6
	push ix		;94a9
	call L_94DA		;94ab
	pop ix		;94ae
	xor a			;94b0
	ret			;94b1
L_94B2:
	push ix		;94b2
	call L_94DA		;94b4
	ld a,(0c697h)		;94b7
	and a			;94ba
	jr nz,L_94CB		;94bb
	call 07a88h		;94bd   ; rutina_de_fase_b_1_4_5: rutina_de_fase y deja los bancos 1, 4 y 5
	ld (0ca19h),hl		;94c0   ; guarda la musica pendiente: la rutina que la pide (16 bits)
	ld a,0b4h		;94c3
	ld (0ca18h),a		;94c5   ; guarda la espera hasta poner la musica pendiente
	call 06be4h		;94c8
L_94CB:
	call L_94D2		;94cb
	pop ix		;94ce
	xor a			;94d0
	ret			;94d1
L_94D2:
	ld a,005h		;94d2
	ld (0ca7ah),a		;94d4
	jp L_983E		;94d7
L_94DA:
	ld ix,0ce00h		;94da
	ld b,018h		;94de
L_94E0:
	ld a,(ix+000h)		;94e0
	and a			;94e3
	jr z,L_94FD		;94e4
	res 7,(ix+000h)		;94e6
	ld a,(ix+000h)		;94ea
	cp 010h		;94ed
	jr nc,L_94FD		;94ef
	ld a,(ix+017h)		;94f1
	ld (ix+00dh),a		;94f4
	ld a,(ix+016h)		;94f7
	ld (ix+00ch),a		;94fa
L_94FD:
	ld de,00040h		;94fd
	add ix,de		;9500
	djnz L_94E0		;9502
	xor a			;9504
	ld (0d444h),a		;9505
	dec a			;9508
	ld (0d44ah),a		;9509
	call L_9518		;950c
	call 04188h		;950f   ; bancos_12_4_56: pone el 12 en 0x6000, el 4 en 0x8000, el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0685fh		;9512   ; p12:685F
	jp 0413fh		;9515   ; bancos_1_4_5: pone el 1 en 0x6000, el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
L_9518:
	ld hl,0d300h		;9518
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
L_952C:
	ld a,(0cb75h)		;952c
	and a			;952f
	ret nz			;9530
	ld a,(0ca5fh)		;9531
	cp 002h		;9534
	ret nz			;9536
	ld a,(0ca67h)		;9537
	and a			;953a
	ret nz			;953b
	ld a,(0ca76h)		;953c   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	and a			;953f
	jr z,L_954C		;9540
	ld a,(0d300h)		;9542
	sub 010h		;9545
	cp 002h		;9547
	jp c,L_924C		;9549
L_954C:
	ld hl,0d417h		;954c
	ld a,(hl)			;954f
	and a			;9550
	jr z,L_957A		;9551
	dec (hl)			;9553
	ret nz			;9554
	call L_9431		;9555
	ld hl,0ca60h		;9558
	ld a,(hl)			;955b
	and a			;955c
	ld (hl),000h		;955d
	ret z			;955f
	ld a,(0d300h)		;9560
	sub 010h		;9563
	cp 002h		;9565
	jp c,L_924C		;9567
	call L_941E		;956a
	jp z,L_924C		;956d
	ld a,(0d456h)		;9570
	and a			;9573
	jp nz,L_924C		;9574
	jp L_934C		;9577
L_957A:
	ld a,(0d443h)		;957a
	and a			;957d
	ret nz			;957e
	ld a,(0d7dah)		;957f
	and 008h		;9582
	ld b,004h		;9584
	jr z,L_9589		;9586
	dec b			;9588
L_9589:
	ld a,(0d416h)		;9589
	cp b			;958c
	ret nc			;958d
	ld hl,0d43eh		;958e
	inc (hl)			;9591
	ld a,(hl)			;9592
	and 00fh		;9593
	ret nz			;9595
	call L_96BA		;9596
	jp c,L_96E0		;9599
	ld a,(0ca4ah)		;959c   ; lee la zona
	ld b,a			;959f
	cp 011h		;95a0
	jr c,L_95D9		;95a2
	ld a,(0ca4bh)		;95a4   ; lee la sala de la zona
	and a			;95a7
	ld de,078b8h		;95a8
	jp z,L_9784		;95ab
	cp 005h		;95ae
	jr nz,L_95C1		;95b0
	ld a,(0d43eh)		;95b2
	and 010h		;95b5
	ld de,0be48h		;95b7
	jr z,L_95BE		;95ba
	ld e,058h		;95bc
L_95BE:
	jp L_9784		;95be
L_95C1:
	cp 013h		;95c1
	jp nz,L_967F		;95c3
	ld a,(0ca77h)		;95c6
	ld c,003h		;95c9
	cp 001h		;95cb
	ld de,05460h		;95cd
	jp z,L_9786		;95d0
	ld de,0be70h		;95d3
	jp L_9784		;95d6
L_95D9:
	ld a,b			;95d9
	cp 004h		;95da
	jr nz,L_95E9		;95dc
	ld a,(0ca4bh)		;95de   ; lee la sala de la zona
	cp 009h		;95e1
	ld de,020a0h		;95e3
	jp z,L_9784		;95e6
L_95E9:
	call L_980D		;95e9
	ret nc			;95ec
	ld a,(0ca65h)		;95ed   ; lee el sitio de 0xCBE0 en el que esta Snake (0 = ninguno)
	and a			;95f0
	jr nz,L_9602		;95f1
	ld hl,0d451h		;95f3
	ld a,(hl)			;95f6
	and a			;95f7
	jr z,L_9602		;95f8
	dec (hl)			;95fa
	ld de,(0d452h)		;95fb
	jp L_9784		;95ff
L_9602:
	call 04256h		;9602   ; azar: A = un numero al azar (0xCA03 rotado mas R)
	rra			;9605
	ld de,0b050h		;9606
	jr c,L_960D		;9609
	ld e,070h		;960b
L_960D:
	ld a,(0ca65h)		;960d   ; lee el sitio de 0xCBE0 en el que esta Snake (0 = ninguno)
	and a			;9610
	ld c,002h		;9611
	jp nz,L_9786		;9613
	ld a,(0ca77h)		;9616
	inc c			;9619
	cp 001h		;961a
	ld de,05460h		;961c
	jp z,L_9786		;961f
	ret nc			;9622
	ld a,(0ca76h)		;9623   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	and a			;9626
	jr z,L_9648		;9627
	call L_929A		;9629
	ret c			;962c
	call L_96E6		;962d
	jp nz,L_924C		;9630
	ld de,(0d447h)		;9633
	push de			;9637
	ex de,hl			;9638
	call 07f3dh		;9639
	pop de			;963c
	ld c,001h		;963d
	ld a,d			;963f
	ld d,e			;9640
	ld e,a			;9641
	jp nc,L_9786		;9642
	jp L_924C		;9645
L_9648:
	ld a,(0d444h)		;9648
	and a			;964b
	jr z,L_9654		;964c
	call L_96E6		;964e
	jp nz,L_924C		;9651
L_9654:
	ld hl,(0d418h)		;9654
	call 07f3dh		;9657
	jr c,L_968A		;965a
	ld a,(0d444h)		;965c
	and a			;965f
	jr nz,L_966F		;9660
	ld a,(0d416h)		;9662
	rra			;9665
	jr c,L_968A		;9666
	ld hl,0d41ah		;9668
	ld a,(hl)			;966b
	and a			;966c
	jr z,L_968A		;966d
L_966F:
	call L_941E		;966f
	jr z,L_968A		;9672
	ld a,(0d456h)		;9674
	and a			;9677
	jr nz,L_968A		;9678
	call L_92B4		;967a
	jr c,L_968A		;967d
L_967F:
	ld hl,0d41ah		;967f
	dec (hl)			;9682
	dec hl			;9683
	ld e,(hl)			;9684
	dec hl			;9685
	ld d,(hl)			;9686
	jp L_9784		;9687
L_968A:
	ld a,(0d444h)		;968a
	and a			;968d
	jp nz,L_9306		;968e
	call 04256h		;9691   ; azar: A = un numero al azar (0xCA03 rotado mas R)
	and 003h		;9694
	ld c,a			;9696
	ld b,004h		;9697
L_9699:
	push bc			;9699
	ld a,c			;969a
	inc a			;969b
	push bc			;969c
	call 07da9h		;969d
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
	ld a,001h		;96b4
	ld (0d444h),a		;96b6
	ret			;96b9
L_96BA:
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
L_96E0:
	call L_92D3		;96e0
	jp L_9784		;96e3
L_96E6:
	ld hl,0d500h		;96e6
	ld b,008h		;96e9
L_96EB:
	ld a,(hl)			;96eb
	and a			;96ec
	jr z,L_96F5		;96ed
	inc hl			;96ef
	ld a,(hl)			;96f0
	cp 002h		;96f1
	ret z			;96f3
	dec hl			;96f4
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


L_9707:
	ld hl,0dd00h		;9707   ; apunta a el mapa de la sala: 24 x 24 caracteres
	ld de,0df40h		;970a
	ld bc,00018h		;970d
	ldir		;9710
	call L_97AD		;9712
	ld de,01200h		;9715
	ld a,002h		;9718
L_971A:
	ld (0d41eh),a		;971a
	ld hl,0df40h		;971d
	ld bc,01800h		;9720
L_9723:
	ld a,(hl)			;9723
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
	call 04256h		;9739   ; azar: A = un numero al azar (0xCA03 rotado mas R)
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
	call L_9768		;974c
	jr nc,L_9758		;974f
	inc hl			;9751
	call L_9768		;9752
	jr c,L_9775		;9755
	dec hl			;9757
L_9758:
	inc hl			;9758
	inc c			;9759
	ld a,c			;975a
	cp 017h		;975b
	jr c,L_9764		;975d
	ld hl,0df40h		;975f
	ld c,000h		;9762
L_9764:
	djnz L_974C		;9764
	scf			;9766
	ret			;9767
L_9768:
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
L_9775:
	ld a,c			;9775
	add a,a			;9776
	add a,a			;9777
	add a,a			;9778
	add a,008h		;9779
	ld b,a			;977b
	ld a,d			;977c
	and a			;977d
	jr z,L_9783		;977e
	ld e,b			;9780
	jr L_9784		;9781
L_9783:
	ld d,b			;9783
L_9784:
	ld c,000h		;9784
L_9786:
	ld hl,0d416h		;9786
	inc (hl)			;9789
	ld hl,0d426h		;978a
	inc (hl)			;978d
	ld ix,0d300h		;978e
	ld b,004h		;9792
L_9794:
	ld a,(ix+000h)		;9794
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
	call L_92DF		;97a5
	call L_8153		;97a8
	or a			;97ab
	ret			;97ac
L_97AD:
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
L_97CB:
	ld hl,0df28h		;97cb
	ld de,0df40h		;97ce
	ld bc,00018h		;97d1
	ldir		;97d4
	call L_97AD		;97d6
	ld de,0c000h		;97d9
	ld a,001h		;97dc
	jp L_971A		;97de
L_97E1:
	ld hl,0dd00h		;97e1   ; apunta a el mapa de la sala: 24 x 24 caracteres
	call L_97EF		;97e4
	ld de,00008h		;97e7
	ld a,004h		;97ea
	jp L_971A		;97ec
L_97EF:
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
L_97FF:
	ld hl,0dd17h		;97ff
	call L_97EF		;9802
	ld de,000b8h		;9805
	ld a,003h		;9808
	jp L_971A		;980a
L_980D:
	ld hl,0d426h		;980d
	ld a,(hl)			;9810
	inc hl			;9811
	cp (hl)			;9812
	ret			;9813
L_9814:
	call L_981A		;9814
	jp 041efh		;9817   ; bancos_14: pone el 14 en 0xA000 (con su copia en 0xC381-0xC383)
L_981A:
	ld hl,00800h		;981a
	ld (0e208h),hl		;981d
	ld a,(0ca42h)		;9820   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	ld d,a			;9823
	ld a,0ffh		;9824
	call 041ddh		;9826   ; bancos_12: pone el 12 en 0x6000 (con su copia en 0xC381-0xC383)
	call 06f49h		;9829   ; p12:6F49
	call 0413fh		;982c   ; bancos_1_4_5: pone el 1 en 0x6000, el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
L_982F:
	call L_984C		;982f
	call L_98FB		;9832
	call 041ddh		;9835   ; bancos_12: pone el 12 en 0x6000 (con su copia en 0xC381-0xC383)
	call 06ffeh		;9838   ; p12:6FFE
	jp 0413fh		;983b   ; bancos_1_4_5: pone el 1 en 0x6000, el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
L_983E:
	ld hl,00000h		;983e
	ld (0e202h),hl		;9841
	ld a,01ch		;9844
	ld (0e20bh),a		;9846
	jp 0439dh		;9849   ; lineas_c3: las lineas de las listas de p00:43C8 (verticales) y p00:43E3 (horizontales), de 0x3A de largo en el color 0x0D
L_984C:
	ld hl,098e0h		;984c
	call L_98BE		;984f
	ld a,(0ca5fh)		;9852
	dec a			;9855
	ld hl,098e9h		;9856
	jr nz,L_985E		;9859
	ld hl,098f2h		;985b
L_985E:
	call L_98BE		;985e
	ld a,(0ca5fh)		;9861
	inc a			;9864
	cp 003h		;9865
	jr c,L_986B		;9867
	ld a,003h		;9869
L_986B:
	ld de,0e62bh		;986b
	call L_98B1		;986e
	ld a,(0ca5fh)		;9871
	dec a			;9874
	jr nz,L_9889		;9875
L_9877:
	ld hl,(0d42bh)		;9877
	srl h		;987a
	rr l		;987c
	srl h		;987e
	rr l		;9880
	srl h		;9882
	rr l		;9884
	ld a,l			;9886
	jr L_9892		;9887
L_9889:
	ld a,(0ca5fh)		;9889
	cp 002h		;988c
	ret c			;988e
	ld a,(0ca53h)		;988f   ; lee la vida de Snake (lo largo de la barra)
L_9892:
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
	call 0bf98h		;98ab   ; p15:BF98
L_98AE:
	jp L_9295		;98ae
L_98B1:
	ld bc,(0c382h)		;98b1   ; lee la copia del banco de 0x8000 y el byte siguiente (16 bits)
	push bc			;98b5
	call 041f7h		;98b6   ; bancos_15: pone el 15 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0bfbfh		;98b9
	jr L_98AE		;98bc
L_98BE:
	ld b,003h		;98be
	ld a,(0ca42h)		;98c0   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	and a			;98c3
	ld c,003h		;98c4
	jr z,L_98CA		;98c6
	ld c,007h		;98c8
L_98CA:
	push bc			;98ca
	ld d,(hl)			;98cb
	inc hl			;98cc
	ld e,(hl)			;98cd
	inc hl			;98ce
	push hl			;98cf
	ld h,(hl)			;98d0
	ld l,070h		;98d1
	ld a,c			;98d3
	ld bc,01808h		;98d4
	call 04767h		;98d7   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
	pop hl			;98da
	inc hl			;98db
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
; CODIGO 0x98fb..0x9967  (108 bytes)
; ======================================================================


L_98FB:
	call 041ddh		;98fb   ; bancos_12: pone el 12 en 0x6000 (con su copia en 0xC381-0xC383)
	call 0418eh		;98fe   ; bancos_56: pone el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	ld a,(0ca5fh)		;9901
	dec a			;9904
	ld hl,0a242h		;9905
	jr z,L_990E		;9908
	dec a			;990a
	ld hl,0a2a6h		;990b
L_990E:
	ld bc,06407h		;990e
	call 06fc4h		;9911   ; p12:6FC4
	ld de,0ea00h		;9914
	ld hl,00fe6h		;9917
	call L_9929		;991a
	ld de,0eac8h		;991d
	ld hl,019f0h		;9920
	call L_9929		;9923
	jp 0413fh		;9926   ; bancos_1_4_5: pone el 1 en 0x6000, el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
L_9929:
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
L_9949:
	ld a,(0c383h)		;9949   ; lee la copia del banco de 0xA000
	push af			;994c
	call 041efh		;994d   ; bancos_14: pone el 14 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b128h		;9950   ; p14:B128
	jr $+30		;9953
L_9955:
	ld a,(0c383h)		;9955   ; lee la copia del banco de 0xA000
	push af			;9958
	call 041efh		;9959   ; bancos_14: pone el 14 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b176h		;995c   ; p14:B176
	jr $+18		;995f
L_9961:
	ld a,0ffh		;9961
	ld (0d43eh),a		;9963
	ret			;9966

; ----------------------------------------------------------------------
; DATOS sin identificar  0x9967..0x9971  (10 bytes)
DATA_9967:
	defb 03ah,083h,0c3h,0f5h,0cdh,0efh,041h,0cdh,084h,0b2h	; 9967  :.....A...

; ======================================================================
; CODIGO 0x9971..0x9b20  (431 bytes)
; ======================================================================


L_9971:
	pop af			;9971
	push af			;9972
	jp 041a3h		;9973
L_9976:
	ld a,(0c383h)		;9976   ; lee la copia del banco de 0xA000
	push af			;9979
	call 041efh		;997a   ; bancos_14: pone el 14 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b34fh		;997d   ; p14:B34F
	jr L_9971		;9980
L_9982:
	ld hl,0d446h		;9982
	ld a,(hl)			;9985
	and a			;9986
	ret z			;9987
	dec (hl)			;9988
	ret nz			;9989
	ld a,(0ca5fh)		;998a
	cp 002h		;998d
	ret nc			;998f
	call L_8079		;9990
	ex de,hl			;9993
	ld hl,0d41ch		;9994
	ld (hl),e			;9997
	inc hl			;9998
	ld (hl),d			;9999
	ld ix,0ce00h		;999a
	ld b,018h		;999e
L_99A0:
	ld a,(ix+000h)		;99a0
	and a			;99a3
	jr z,L_99B6		;99a4
	cp 004h		;99a6
	jr z,L_99B6		;99a8
	cp 005h		;99aa
	jr z,L_99B6		;99ac
	call L_806F		;99ae
	push bc			;99b1
	call nc,L_99BE		;99b2
	pop bc			;99b5
L_99B6:
	ld de,00040h		;99b6
	add ix,de		;99b9
	djnz L_99A0		;99bb
	ret			;99bd
L_99BE:
	ld a,(ix+000h)		;99be
	cp 003h		;99c1
	jp z,L_9A11		;99c3
	cp 00ah		;99c6
	jp z,L_9A2B		;99c8
	cp 00ch		;99cb
	ret nc			;99cd
	call L_8100		;99ce
	ret nz			;99d1
	ld a,(ix+01fh)		;99d2
	and a			;99d5
	ret nz			;99d6
	ld a,(ix+001h)		;99d7
	cp 021h		;99da
	jr z,L_99E1		;99dc
	cp 006h		;99de
	ret nc			;99e0
L_99E1:
	ld (ix+021h),a		;99e1
	ld a,(0ca5fh)		;99e4
	and a			;99e7
	ld a,00ah		;99e8
	jr z,L_99EE		;99ea
	ld a,006h		;99ec
L_99EE:
	ld (ix+001h),a		;99ee
	ld a,(ix+003h)		;99f1
	ld (ix+024h),a		;99f4
	ld a,(ix+005h)		;99f7
	ld (ix+025h),a		;99fa
	ld a,(ix+00dh)		;99fd
	rrca			;9a00
	and 007h		;9a01
	ld (ix+01eh),a		;9a03
	ld a,(ix+00ch)		;9a06
	ld (ix+023h),a		;9a09
	call L_9A3A		;9a0c
	jr L_9A28		;9a0f
L_9A11:
	call L_8100		;9a11
	ret nz			;9a14
	ld a,(ix+019h)		;9a15
	cp 005h		;9a18
	ret nc			;9a1a
	ld a,(ix+001h)		;9a1b
	cp 001h		;9a1e
	ret nz			;9a20
	ld (ix+021h),a		;9a21
	ld (ix+001h),004h		;9a24
L_9A28:
	jp L_9B02		;9a28
L_9A2B:
	call L_8100		;9a2b
	ret nz			;9a2e
	ld a,(ix+001h)		;9a2f
	and a			;9a32
	ret nz			;9a33
	ld (ix+001h),001h		;9a34
	jr L_9A28		;9a38
L_9A3A:
	ld l,(ix+005h)		;9a3a
	ld h,(ix+003h)		;9a3d
	ld (ix+024h),h		;9a40
	ld (ix+025h),l		;9a43
	call L_9A59		;9a46
	ld (ix+026h),h		;9a49
	ld (ix+027h),l		;9a4c
	call L_9A59		;9a4f
	ld (ix+028h),h		;9a52
	ld (ix+029h),l		;9a55
	ret			;9a58
L_9A59:
	ex de,hl			;9a59
	push de			;9a5a
	ld hl,(0d41ch)		;9a5b
	ld a,h			;9a5e
	ld h,l			;9a5f
	ld l,a			;9a60
	push hl			;9a61
	call L_90B2		;9a62
	pop hl			;9a65
	pop de			;9a66
	push de			;9a67
	call L_9095		;9a68
	and b			;9a6b
	call L_907A		;9a6c
	pop de			;9a6f
	ld bc,(0c382h)		;9a70   ; lee la copia del banco de 0x8000 y el byte siguiente (16 bits)
	push bc			;9a74
	call 041a0h		;9a75   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b256h		;9a78   ; p06:B256
	pop af			;9a7b
	push af			;9a7c
	jp 041a3h		;9a7d
L_9A80:
	ld a,(0d445h)		;9a80
	and a			;9a83
	ret nz			;9a84
	ld ix,0d460h		;9a85
	ld b,006h		;9a89
L_9A8B:
	push bc			;9a8b
	ld a,(ix+000h)		;9a8c
	and a			;9a8f
	jr z,L_9AA0		;9a90
	call L_9AC4		;9a92
	ld a,003h		;9a95
	call L_8085		;9a97
	call L_9C82		;9a9a
	call L_9ADC		;9a9d
L_9AA0:
	ld bc,00010h		;9aa0
	add ix,bc		;9aa3
	pop bc			;9aa5
	djnz L_9A8B		;9aa6
	ret			;9aa8
L_9AA9:
	ld a,(0c383h)		;9aa9   ; lee la copia del banco de 0xA000
	push af			;9aac
	call 041a0h		;9aad   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a8e8h		;9ab0   ; p06:A8E8
	jr L_9ABF		;9ab3
L_9AB5:
	ld a,(0c383h)		;9ab5   ; lee la copia del banco de 0xA000
	push af			;9ab8
	call 041a0h		;9ab9   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a924h		;9abc   ; p06:A924
L_9ABF:
	pop af			;9abf
	push af			;9ac0
	jp 041a3h		;9ac1
L_9AC4:
	ld a,(0c383h)		;9ac4   ; lee la copia del banco de 0xA000
	push af			;9ac7
	call 041a0h		;9ac8   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a7e9h		;9acb   ; p06:A7E9
	jr L_9ABF		;9ace
L_9AD0:
	ld a,(0c383h)		;9ad0   ; lee la copia del banco de 0xA000
	push af			;9ad3
	call 041a0h		;9ad4   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a942h		;9ad7   ; p06:A942
	jr L_9ABF		;9ada
L_9ADC:
	ld a,(0c383h)		;9adc   ; lee la copia del banco de 0xA000
	push af			;9adf
	call 041a0h		;9ae0   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a979h		;9ae3   ; p06:A979
	jr L_9ABF		;9ae6
L_9AE8:
	ld a,(0c383h)		;9ae8   ; lee la copia del banco de 0xA000
	push af			;9aeb
	call 041a0h		;9aec   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a95ah		;9aef   ; p06:A95A
	jr L_9ABF		;9af2
L_9AF4:
	ld b,007h		;9af4
	jr $+95		;9af6
L_9AF8:
	ld b,003h		;9af8
	jr $+88		;9afa
L_9AFC:
	call L_9B02		;9afc
	jp 041bdh		;9aff   ; bancos_8: pone el 8 en 0xA000 (con su copia en 0xC381-0xC383)
L_9B02:
	ld b,001h		;9b02
	jr $+78		;9b04
L_9B06:
	call L_9AD0		;9b06
	ld b,005h		;9b09
	jr $+71		;9b0b
L_9B0D:
	cp 00ah		;9b0d
	call L_9AD0		;9b0f
	ld (0d43ch),hl		;9b12
	ld b,008h		;9b15
	jr $+59		;9b17
L_9B19:
	ld b,008h		;9b19
	call L_9AE8		;9b1b
	jr $+10		;9b1e

; ----------------------------------------------------------------------
; DATOS sin identificar  0x9b20..0x9b28  (8 bytes)
DATA_9B20:
	defb 021h,0f0h,000h,022h,03ch,0d4h,006h,006h	; 9b20  !.."<...

; ======================================================================
; CODIGO 0x9b28..0x9cdd  (437 bytes)
; ======================================================================


L_9B28:
	ld h,(ix+019h)		;9b28
	ld l,(ix+018h)		;9b2b
	jr L_9B55		;9b2e
L_9B30:
	ld bc,000e0h		;9b30
	ld (0d43ch),bc		;9b33
	ld b,006h		;9b37
	jr L_9B55		;9b39
L_9B3B:
	call L_9AD0		;9b3b
	jr L_9B49		;9b3e
L_9B40:
	ld a,(ix+000h)		;9b40
	ld hl,000f0h		;9b43
	ld (0d43ch),hl		;9b46
L_9B49:
	ld b,006h		;9b49
	jr L_9B52		;9b4b
L_9B4D:
	call L_9AD0		;9b4d
	ld b,004h		;9b50
L_9B52:
	call L_8079		;9b52
L_9B55:
	ld (0d8e6h),hl		;9b55
	ld a,b			;9b58
	ld (0d8e8h),a		;9b59
	ld iy,0d460h		;9b5c
	ld b,006h		;9b60
L_9B62:
	ld a,(iy+000h)		;9b62
	and a			;9b65
	jr z,L_9B70		;9b66
	ld de,00010h		;9b68
	add iy,de		;9b6b
	djnz L_9B62		;9b6d
	ret			;9b6f
L_9B70:
	ld hl,0d410h		;9b70
	ld a,(0d8e8h)		;9b73
	cp 003h		;9b76
	ld bc,00610h		;9b78
	ld d,001h		;9b7b
	jr nz,L_9B82		;9b7d
	ld b,003h		;9b7f
	inc d			;9b81
L_9B82:
	ld a,(hl)			;9b82
	and a			;9b83
	jr z,L_9B8F		;9b84
	ld a,l			;9b86
	add a,d			;9b87
	ld l,a			;9b88
	ld a,c			;9b89
	add a,d			;9b8a
	ld c,a			;9b8b
	djnz L_9B82		;9b8c
	ret			;9b8e
L_9B8F:
	exx			;9b8f
	push iy		;9b90
	pop hl			;9b92
	ld bc,0000fh		;9b93
	call 04236h		;9b96   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	exx			;9b99
	ld a,c			;9b9a
	ex af,af'			;9b9b
	ld a,(0d8e8h)		;9b9c
	cp 003h		;9b9f
	jp z,L_9AA9		;9ba1
	cp 007h		;9ba4
	jp z,L_9AB5		;9ba6
	cp 004h		;9ba9
	jp c,L_9C3E		;9bab
	push hl			;9bae
	push bc			;9baf
	ld hl,(0d43ch)		;9bb0
	ld a,(ix+005h)		;9bb3
	add a,h			;9bb6
	ld d,a			;9bb7
	ld a,(ix+003h)		;9bb8
	add a,l			;9bbb
	ld e,a			;9bbc
	ld (0d8e4h),de		;9bbd
	ld hl,(0d8e6h)		;9bc1
	ld a,l			;9bc4
	add a,0ech		;9bc5
	ld l,a			;9bc7
	ld a,(0d8e8h)		;9bc8
	cp 008h		;9bcb
	ld b,0f0h		;9bcd
	jr z,L_9BD9		;9bcf
	cp 006h		;9bd1
	ld b,0e0h		;9bd3
	jr nz,L_9BD9		;9bd5
	ld b,0c0h		;9bd7
L_9BD9:
	ld a,b			;9bd9
	call 07987h		;9bda   ; p01:7987
	ld (0d8e0h),hl		;9bdd   ; guarda 1: el juego de dibujos solo pinta sus listas 6 y 7 y el byte siguiente (16 bits)
	ld (0d8e2h),de		;9be0
	call L_9C6C		;9be4
	pop bc			;9be7
	pop hl			;9be8
	ret z			;9be9
	ld (hl),001h		;9bea
	ld a,(0d8e8h)		;9bec
	ld (iy+000h),a		;9bef
	inc (iy+001h)		;9bf2
	ld (iy+00eh),c		;9bf5
	ld bc,(0d8e4h)		;9bf8
	ld (iy+003h),c		;9bfc
	ld (iy+005h),b		;9bff
	ld bc,(0d8e2h)		;9c02
	ld (iy+007h),b		;9c06
	ld (iy+006h),c		;9c09
	ld bc,(0d8e0h)		;9c0c   ; lee 1: el juego de dibujos solo pinta sus listas 6 y 7 y el byte siguiente (16 bits)
	ld (iy+009h),b		;9c10
	ld (iy+008h),c		;9c13
	ex af,af'			;9c16
	ld c,a			;9c17
	ld a,(0d8e8h)		;9c18
	cp 005h		;9c1b
	ld a,00fh		;9c1d
	jr z,L_9C23		;9c1f
	ld a,007h		;9c21
L_9C23:
	call L_9C5B		;9c23
	ld a,(0d800h)		;9c26
	cp 005h		;9c29
	jp z,06c4fh		;9c2b   ; p01:6C4F
	cp 002h		;9c2e
	jp z,06a6fh		;9c30   ; p01:6A6F
	ld a,(0d8e8h)		;9c33
	cp 005h		;9c36
	jp z,06c1fh		;9c38   ; p01:6C1F
	jp 06a5ch		;9c3b   ; p01:6A5C
L_9C3E:
	ld (hl),001h		;9c3e
	ld a,(0d8e8h)		;9c40
	ld (iy+000h),a		;9c43
	ld (iy+00eh),c		;9c46
	push ix		;9c49
	pop de			;9c4b
	ld (iy+00ah),e		;9c4c
	ld (iy+00bh),d		;9c4f
	ld (iy+00ch),002h		;9c52
	inc (iy+001h)		;9c56
	ld a,007h		;9c59
L_9C5B:
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
L_9C6C:
	ld a,(0d8e8h)		;9c6c
	cp 004h		;9c6f
	ret nz			;9c71
	call L_80C8		;9c72
	push af			;9c75
	call L_8508		;9c76
	pop bc			;9c79
	cp b			;9c7a
	jr z,L_9C7F		;9c7b
	xor a			;9c7d
	ret			;9c7e
L_9C7F:
	or 001h		;9c7f
	ret			;9c81
L_9C82:
	ld a,(ix+000h)		;9c82
	cp 004h		;9c85
	ret c			;9c87
	cp 005h		;9c88
	jp z,L_9CC2		;9c8a
	ld a,(ix+003h)		;9c8d
	ld l,a			;9c90
	cp 0c0h		;9c91
	jr nc,L_9CA1		;9c93
	ld a,(ix+005h)		;9c95
	ld h,a			;9c98
	cp 0c0h		;9c99
	jr nc,L_9CA1		;9c9b
	call 07f88h		;9c9d
	ret nc			;9ca0
L_9CA1:
	ld a,(ix+000h)		;9ca1
	cp 003h		;9ca4
	ret z			;9ca6
	cp 007h		;9ca7
	ret z			;9ca9
L_9CAA:
	ld a,(0c383h)		;9caa   ; lee la copia del banco de 0xA000
	push af			;9cad
	call 041a0h		;9cae   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0aa18h		;9cb1   ; p06:AA18
	jp L_9ABF		;9cb4
L_9CB7:
	ld a,(ix+00eh)		;9cb7
	add a,a			;9cba
	add a,a			;9cbb
	ld hl,0dc28h		;9cbc
	jp 0423eh		;9cbf   ; suma_a_hl: HL = HL + A
L_9CC2:
	ld a,(ix+003h)		;9cc2
	sub 018h		;9cc5
	cp 0a0h		;9cc7
	jr nc,L_9CA1		;9cc9
	ld a,(ix+005h)		;9ccb
	sub 008h		;9cce
	cp 0b0h		;9cd0
	jr nc,L_9CA1		;9cd2
	ret			;9cd4
a_p12_74bc:		; p12:74BC con el banco 12 en 0x6000
	call 041ddh		;9cd5   ; bancos_12: pone el 12 en 0x6000 (con su copia en 0xC381-0xC383)
	call 074bch		;9cd8   ; p12:74BC
	jr $+8		;9cdb

; ----------------------------------------------------------------------
; DATOS sin identificar  0x9cdd..0x9ce3  (6 bytes)
DATA_9CDD:
	defb 0cdh,0ddh,041h,0cdh,0cbh,074h	; 9cdd

; ======================================================================
; CODIGO 0x9ce3..0x9d5c  (121 bytes)
; ======================================================================


L_9CE3:
	jp 041eah		;9ce3   ; bancos_1: pone el 1 en 0x6000 (con su copia en 0xC381-0xC383)
a_p12_758d:		; p12:758D con el banco 12 en 0x6000
	call 041ddh		;9ce6   ; bancos_12: pone el 12 en 0x6000 (con su copia en 0xC381-0xC383)
	call 0758dh		;9ce9   ; p12:758D
	jr L_9CE3		;9cec
L_9CEE:
	ld bc,00820h		;9cee
L_9CF1:
	ld a,001h		;9cf1
	ld (0ca28h),a		;9cf3
	call 041ddh		;9cf6   ; bancos_12: pone el 12 en 0x6000 (con su copia en 0xC381-0xC383)
	call 075c3h		;9cf9   ; p12:75C3
	jr L_9CE3		;9cfc
L_9CFE:
	ld bc,08318h		;9cfe
	jr L_9CF1		;9d01
L_9D03:
	ld bc,08418h		;9d03
	jr L_9CF1		;9d06
L_9D08:
	ld bc,00520h		;9d08
	jr L_9CF1		;9d0b
L_9D0D:
	ld bc,00620h		;9d0d
	jr L_9CF1		;9d10
L_9D12:
	call L_8100		;9d12
	ret nz			;9d15
	ld bc,00730h		;9d16
	jr L_9CF1		;9d19
L_9D1B:
	ld bc,08220h		;9d1b
	jr L_9CF1		;9d1e
L_9D20:
	ld bc,00918h		;9d20
	jr L_9CF1		;9d23
L_9D25:
	ld bc,08b20h		;9d25
	jr L_9CF1		;9d28
L_9D2A:
	ld bc,00a30h		;9d2a
	jr L_9CF1		;9d2d
L_9D2F:
	ld bc,08c30h		;9d2f
	jr L_9CF1		;9d32
L_9D34:
	ld bc,08d30h		;9d34
	jr L_9CF1		;9d37
L_9D39:
	ld a,(ix+000h)		;9d39
	rla			;9d3c
	jp c,L_8EE9		;9d3d
	ld a,(0ca5fh)		;9d40
	and a			;9d43
	jr z,L_9D53		;9d44
	cp 001h		;9d46
	jp z,0a2adh		;9d48   ; p05:A2AD
	ld a,(ix+001h)		;9d4b
	cp 015h		;9d4e
	jp c,L_8F16		;9d50
L_9D53:
	call 0a019h		;9d53   ; p05:A019
	ld a,(ix+001h)		;9d56
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
	defw 09efdh,0a071h	; 9dac  -> L_9EFD 0xa071

; ======================================================================
; CODIGO 0x9db0..0x9ffe  (590 bytes)
; ======================================================================


L_9DB0:
	ld h,(ix+026h)		;9db0
	ld l,(ix+027h)		;9db3
	jp L_9E41		;9db6
L_9DB9:
	ld hl,0d44fh		;9db9
	ld a,(hl)			;9dbc
	dec a			;9dbd
	ret nz			;9dbe
	ld (hl),002h		;9dbf
	ret			;9dc1
L_9DC2:
	call L_9DB9		;9dc2
	jr nz,L_9DCE		;9dc5
	ld (ix+001h),00eh		;9dc7
	jp L_9E66		;9dcb
L_9DCE:
	ld d,(ix+026h)		;9dce
	ld e,(ix+027h)		;9dd1
	call L_9DE9		;9dd4
	jr nc,L_9DDE		;9dd7
	call L_900B		;9dd9
	or a			;9ddc
	ret			;9ddd
L_9DDE:
	ld h,(ix+028h)		;9dde
	ld l,(ix+029h)		;9de1
	call L_9E41		;9de4
	scf			;9de7
	ret			;9de8
L_9DE9:
	ld a,(ix+00ch)		;9de9
	rra			;9dec
	ld b,(ix+007h)		;9ded
	ld a,(ix+003h)		;9df0
	jr c,L_9DFC		;9df3
	ld b,(ix+009h)		;9df5
	ld a,(ix+005h)		;9df8
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
L_9E05:
	call L_9DB9		;9e05
	jr nz,L_9E1A		;9e08
	ld a,(0ca5fh)		;9e0a
	and a			;9e0d
	ld a,00dh		;9e0e
	jr z,L_9E14		;9e10
	ld a,001h		;9e12
L_9E14:
	ld (ix+001h),a		;9e14
	jp L_9E3B		;9e17
L_9E1A:
	ld d,(ix+028h)		;9e1a
	ld e,(ix+029h)		;9e1d
	call L_9DE9		;9e20
	jp c,L_900B		;9e23
	ld (ix+00ch),000h		;9e26
	ld (ix+00eh),07fh		;9e2a
	jp 0a27bh		;9e2e
L_9E31:
	call L_9DB9		;9e31
	jr z,L_9E3B		;9e34
	dec (ix+00eh)		;9e36
	jr nz,L_9E51		;9e39
L_9E3B:
	ld h,(ix+026h)		;9e3b
	ld l,(ix+027h)		;9e3e
L_9E41:
	call L_90AC		;9e41
	call L_908F		;9e44
	and b			;9e47
	call L_907A		;9e48
	call a_p06_b592_b_4_5		;9e4b   ; a_p06_b592_b_4_5: a_p06_b592 y deja los bancos 4 y 5
	jp 0a27bh		;9e4e
L_9E51:
	ld a,(ix+00eh)		;9e51
	and 00fh		;9e54
	ret nz			;9e56
	jp a_p06_b5e2		;9e57   ; a_p06_b5e2: p06:B5E2 con el banco 6 en 0xA000
L_9E5A:
	ld d,(ix+026h)		;9e5a
	ld e,(ix+027h)		;9e5d
	call L_9DE9		;9e60
	jp c,L_900B		;9e63
L_9E66:
	ld h,(ix+024h)		;9e66
	ld l,(ix+025h)		;9e69
	jp L_9E41		;9e6c
L_9E6F:
	ld d,(ix+024h)		;9e6f
	ld e,(ix+025h)		;9e72
	call L_9DE9		;9e75
	jp c,L_900B		;9e78
	ld a,(ix+01eh)		;9e7b
	call a_p06_b592_b_4_5		;9e7e   ; a_p06_b592_b_4_5: a_p06_b592 y deja los bancos 4 y 5
	ld a,(ix+024h)		;9e81
	ld (ix+003h),a		;9e84
	ld a,(ix+025h)		;9e87
	ld (ix+005h),a		;9e8a
	ld a,(ix+021h)		;9e8d
	ld (ix+001h),a		;9e90
	ld a,(ix+023h)		;9e93
	ld (ix+00ch),a		;9e96
	ret			;9e99
L_9E9A:
	call L_9D08		;9e9a
	ld (ix+01ch),020h		;9e9d
	jp 0a27bh		;9ea1   ; p05:A27B
L_9EA4:
	dec (ix+01ch)		;9ea4
	jr z,L_9EB2		;9ea7
	ld a,(ix+01ch)		;9ea9
	and 003h		;9eac
	ret nz			;9eae
	jp L_9B4D		;9eaf
L_9EB2:
	ld a,(ix+022h)		;9eb2
	ld (ix+00ch),a		;9eb5
	ld a,(ix+020h)		;9eb8
	ld (ix+001h),a		;9ebb
	jp L_9D0D		;9ebe
L_9EC1:
	dec (ix+00eh)		;9ec1
	ret nz			;9ec4
	ld (ix+01bh),001h		;9ec5
	ld (ix+003h),0b4h		;9ec9
	ld (ix+005h),070h		;9ecd
	ld bc,00107h		;9ed1
	ld a,(0ca76h)		;9ed4   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 018h		;9ed7
	jr z,L_9EEE		;9ed9
L_9EDB:
	call L_8100		;9edb
	ld (ix+00ah),b		;9ede
	ld (ix+00bh),c		;9ee1
	jp nz,0a23ah		;9ee4
	push bc			;9ee7
	call L_9FC0		;9ee8
	pop bc			;9eeb
	jr L_9EFA		;9eec
L_9EEE:
	ld (ix+00ah),b		;9eee
	ld (ix+00bh),c		;9ef1
	call L_8100		;9ef4
	call z,L_8153		;9ef7
L_9EFA:
	jp 0a23ah		;9efa   ; p05:A23A
L_9EFD:
	ld (ix+01bh),000h		;9efd
	ld (ix+003h),068h		;9f01
	ld (ix+005h),030h		;9f05
	ld (ix+00dh),002h		;9f09
	ld bc,00109h		;9f0d
	ld a,(0ca76h)		;9f10   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 018h		;9f13
	jr z,L_9EDB		;9f15
	and a			;9f17
	jr z,L_9EEE		;9f18
	ld (ix+00ah),b		;9f1a
	ld (ix+00bh),c		;9f1d
	jr L_9EFA		;9f20
L_9F22:
	ld bc,00927h		;9f22
	ld hl,0d500h		;9f25
	ld a,(ix+01bh)		;9f28
	and a			;9f2b
	jr nz,L_9F32		;9f2c
	ld d,00bh		;9f2e
	jr L_9F73		;9f30
L_9F32:
	inc c			;9f32
	ld a,(ix+000h)		;9f33
	cp b			;9f36
	ret nz			;9f37
	ld a,(ix+00ah)		;9f38
	dec a			;9f3b
	ret nz			;9f3c
	ld a,(ix+00bh)		;9f3d
	cp 007h		;9f40
	ret nz			;9f42
	ld a,(ix+003h)		;9f43
	cp 0b4h		;9f46
	jr c,L_9F68		;9f48
	xor a			;9f4a
	ld (ix+00ch),a		;9f4b
	ld (ix+001h),c		;9f4e
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
L_9F68:
	or 001h		;9f68
	ret			;9f6a
L_9F6B:
	ld bc,00822h		;9f6b
	ld hl,0d510h		;9f6e
	ld d,00ch		;9f71
L_9F73:
	ld a,(ix+000h)		;9f73
	cp b			;9f76
	ret nz			;9f77
	ld a,(ix+00ah)		;9f78
	dec a			;9f7b
	ret nz			;9f7c
	ld a,(ix+00bh)		;9f7d
	cp 009h		;9f80
	ret nz			;9f82
	ld a,(ix+003h)		;9f83
	cp 064h		;9f86
	jr nc,L_9F68		;9f88
	xor a			;9f8a
	ld (ix+00ch),a		;9f8b
	ld (ix+00eh),008h		;9f8e
	ld (ix+001h),c		;9f92
	call L_8100		;9f95
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
L_9FA7:
	dec (ix+00eh)		;9fa7
	ret nz			;9faa
	ld (ix+00eh),0c0h		;9fab
	xor a			;9faf
	ld (0d514h),a		;9fb0
	inc a			;9fb3
	ld (0d441h),a		;9fb4
	call L_8100		;9fb7
	call z,L_9FC0		;9fba
	jp 0a27bh		;9fbd
L_9FC0:
	ld a,(ix+02eh)		;9fc0
	call L_9FD5		;9fc3
	ld a,(ix+02fh)		;9fc6
	call L_9FD5		;9fc9
	ld a,(ix+030h)		;9fcc
	call L_9FD5		;9fcf
	ld a,(ix+031h)		;9fd2
L_9FD5:
	dec a			;9fd5
	ld b,a			;9fd6
	ld de,0d400h		;9fd7
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
L_9FEB:
	ld hl,0d519h		;9feb
	dec (ix+00eh)		;9fee
	ret nz			;9ff1
	ld (ix+00eh),008h		;9ff2
	call L_8100		;9ff6
	jp nz,0a27bh		;9ff9
	ld (hl),001h		;9ffc

; ----------------------------------------------------------------------
; DATOS partida_9FFE: los 2 primeros bytes de una instruccion de 3 (C3 7B A2)
;   que sigue en el banco 5: el trazador de un solo banco no puede verla
;   entera (tools/bancos.py); lo leen p04:9FFE (2 bytes)
;   0x9ffe..0xa000  (2 bytes)
DATA_partida_9FFE:
	defb 0c3h,07bh	; 9ffe
