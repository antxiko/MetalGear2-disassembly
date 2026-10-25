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
; CODIGO 0x8000..0x808b  (139 bytes)
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
	ld a,(0cb03h)		;8079
	ld l,a			;807c
	ld a,(0cb05h)		;807d
	ld h,a			;8080
	ret			;8081
L_8082:
	ld a,(ix+00ch)		;8082
L_8085:
	push bc			;8085
	call L_80AE		;8086
	pop bc			;8089
	ret			;808a

; ----------------------------------------------------------------------
; DATOS sin identificar  0x808b..0x80ae  (35 bytes)
DATA_808B:
	defb 0cdh,09eh,080h,0ddh,056h,009h,0ddh,05eh,008h,0cdh,042h,044h,0ddh,072h,009h,0ddh	; 808b  ....V..^..BD.r..
	defb 073h,008h,0c9h,0ddh,056h,007h,0ddh,05eh,006h,0cdh,042h,044h,0ddh,072h,007h,0ddh	; 809b  s...V..^..BD.r..
	defb 073h,006h,0c9h	; 80ab

; ======================================================================
; CODIGO 0x80ae..0x80e6  (56 bytes)
; ======================================================================


L_80AE:
	ld bc,(0c383h)		;80ae
	push bc			;80b2
	call 041efh		;80b3
	call 0ba36h		;80b6
	jr L_80E0		;80b9
L_80BB:
	ld bc,(0c383h)		;80bb
	push bc			;80bf
	call 041efh		;80c0
	call 0b9dch		;80c3
	jr L_80E0		;80c6
L_80C8:
	ld bc,(0c383h)		;80c8
	push bc			;80cc
	call 041efh		;80cd
	call 0b842h		;80d0
	jr L_80E0		;80d3
L_80D5:
	ld bc,(0c383h)		;80d5
	push bc			;80d9
	call 041efh		;80da
	call 0b931h		;80dd
L_80E0:
	pop bc			;80e0
	push af			;80e1
	ld a,c			;80e2
	jp 041a3h		;80e3

; ----------------------------------------------------------------------
; DATOS sin identificar  0x80e6..0x80f3  (13 bytes)
DATA_80E6:
	defb 0edh,04bh,083h,0c3h,0c5h,0cdh,0efh,041h,0cdh,08fh,0b8h,018h,0edh	; 80e6  .K.....A.....

; ======================================================================
; CODIGO 0x80f3..0x815b  (104 bytes)
; ======================================================================


L_80F3:
	ld bc,(0c383h)		;80f3
	push bc			;80f7
	call 041efh		;80f8
	call 0ba17h		;80fb
	jr $-30		;80fe
L_8100:
	ld a,(0ca50h)		;8100
	cp (ix+00ah)		;8103
	ret nz			;8106
	ld a,(0ca51h)		;8107
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
	call 0424eh		;8142
L_8145:
	jp 04142h		;8145
L_8148:
	cp 003h		;8148
	jp z,041bdh		;814a
	cp 00ah		;814d
	jp nc,041bdh		;814f
	ret			;8152
L_8153:
	call 041bdh		;8153
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
; CODIGO 0x818b..0x81bf  (52 bytes)
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

; ----------------------------------------------------------------------
; DATOS sin identificar  0x81bf..0x81c5  (6 bytes)
DATA_81BF:
	defb 0cdh,053h,081h,0c3h,0efh,041h	; 81bf

; ======================================================================
; CODIGO 0x81c5..0x84ed  (808 bytes)
; ======================================================================


L_81C5:
	call L_820A		;81c5
	ld a,(ix+000h)		;81c8
	ld c,a			;81cb
	ld hl,0b9fbh		;81cc
	call 043f6h		;81cf
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
	call 051e0h		;81fe
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
	call 04236h		;8212
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
	jp 04243h		;8278
L_827B:
	ld a,(0ca4ah)		;827b
	cp 004h		;827e
	jr nz,L_8289		;8280
	ld a,(0ca4bh)		;8282
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
	ld a,(0ca76h)		;82f1
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
	call 06a2dh		;832a
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
	jp 04f65h		;8367
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
	call 0423eh		;8381
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
	jp 07a12h		;83b2
L_83B5:
	call L_8100		;83b5
	ret nz			;83b8
	ld (ix+00dh),005h		;83b9
	ld a,(0c383h)		;83bd
	push af			;83c0
	call 041bdh		;83c1
	ld de,00001h		;83c4
	call 0aebfh		;83c7
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
	ld a,(0ca41h)		;83fe
	and a			;8401
	ret nz			;8402
	ld a,(0ca5fh)		;8403
	cp 002h		;8406
	ret nc			;8408
	ld a,(0ca65h)		;8409
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
	ld a,(0cb0fh)		;8450
	and a			;8453
	ret nz			;8454
L_8455:
	call L_9CE6		;8455
	jp L_9949		;8458
L_845B:
	ld a,(ix+000h)		;845b
	cp 00ah		;845e
	jr nc,L_8450		;8460
	ld a,(ix+001h)		;8462
	sub 025h		;8465
	cp 002h		;8467
	jr c,L_8450		;8469
	ld a,(0cb03h)		;846b
	sub (ix+003h)		;846e
	jr nc,L_8475		;8471
	neg		;8473
L_8475:
	cp 030h		;8475
	jr nc,L_8450		;8477
	ld a,(0cb05h)		;8479
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
	call 043f6h		;84bc
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
	ld a,(0cb0fh)		;84e5
	and a			;84e8
	ret nz			;84e9
	jp L_9949		;84ea

; ----------------------------------------------------------------------
; DATOS sin identificar  0x84ed..0x84f5  (8 bytes)
DATA_84ED:
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
	call 079d1h		;8505
L_8508:
	ld a,(0ca5dh)		;8508
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
	call c,0443ah		;8556
	rr b		;8559
	call c,04442h		;855b
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
	ld a,(0ca5dh)		;8592
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
	ld a,(0cb03h)		;85ba
	sub 004h		;85bd
	sub l			;85bf
	cp 018h		;85c0
	ret nc			;85c2
	ld a,(0cb05h)		;85c3
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
	jp 07f37h		;860c
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
	ld (0ca18h),a		;8678
	inc a			;867b
	ld (0ca26h),a		;867c
	ld hl,00000h		;867f
	ld (0ca19h),hl		;8682
L_8685:
	ld a,(ix+000h)		;8685
	ld hl,08698h		;8688
	call 04248h		;868b
	call 0424dh		;868e

; ----------------------------------------------------------------------
; DATOS sin identificar  0x8691..0x86a4  (19 bytes)
DATA_8691:
	defb 069h,06bh,06dh,06bh,071h,06bh,00bh,06ch,001h,001h,003h,000h,002h,003h,000h,003h	; 8691  ikmkqk.l........
	defb 003h,000h,003h	; 86a1

; ======================================================================
; CODIGO 0x86a4..0x86c2  (30 bytes)
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
	jp z,041f7h		;86b4
	cp 002h		;86b7
	jp z,041cdh		;86b9
	cp 006h		;86bc
	jp z,041cdh		;86be
	ret			;86c1

; ----------------------------------------------------------------------
; DATOS sin identificar  0x86c2..0x86d0  (14 bytes)
DATA_86C2:
	defb 03eh,001h,032h,026h,0cah,021h,000h,000h,022h,019h,0cah,0c3h,0d0h,06bh	; 86c2  >.2&.!.."....k

; ======================================================================
; CODIGO 0x86d0..0x86de  (14 bytes)
; ======================================================================


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

; ----------------------------------------------------------------------
; DATOS sin identificar  0x86de..0x86ed  (15 bytes)
DATA_86DE:
	defb 006h,001h,0ddh,034h,011h,0ddh,07eh,011h,0a0h,0c0h,0cdh,02eh,090h,0afh,0c9h	; 86de  ...4..~........

; ======================================================================
; CODIGO 0x86ed..0x8733  (70 bytes)
; ======================================================================


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
	call 04243h		;870f
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
	jp 04237h		;8730

; ----------------------------------------------------------------------
; DATOS sin identificar  0x8733..0x8739  (6 bytes)
DATA_8733:
	defb 0cdh,039h,087h,0c3h,0efh,041h	; 8733

; ======================================================================
; CODIGO 0x8739..0x8a75  (828 bytes)
; ======================================================================


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
L_8751:
	call 041efh		;8751
	call 0af96h		;8754
	jr L_87BE		;8757
L_8759:
	call 041efh		;8759
	call 0ae76h		;875c
	jr L_87BE		;875f
L_8761:
	ld de,0dc28h		;8761
L_8764:
	call 0418eh		;8764
	exx			;8767
	push de			;8768
	push bc			;8769
	ld a,(hl)			;876a
	ld de,0d8e0h		;876b
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
	jp 04142h		;87be
L_87C1:
	call 0418eh		;87c1
	exx			;87c4
	ld a,(ix+000h)		;87c5
	ld hl,0abe5h		;87c8
	call 043f6h		;87cb
	ld a,(ix+00dh)		;87ce
	cp 080h		;87d1
	jr c,L_87D8		;87d3
	ld hl,0acddh		;87d5
L_87D8:
	and 07fh		;87d8
	add a,a			;87da
	call 0423eh		;87db
	exx			;87de
	jr L_87BE		;87df
L_87E1:
	call 0418eh		;87e1
	ld a,(ix+000h)		;87e4
	ld hl,0ab35h		;87e7
	call 043f6h		;87ea
	ld a,(ix+00dh)		;87ed
	cp 080h		;87f0
	jr c,L_87F7		;87f2
	ld hl,0ab9ch		;87f4
L_87F7:
	and 07fh		;87f7
	call 0423eh		;87f9
	ld a,(hl)			;87fc
	ld hl,0ab9fh		;87fd
	add a,a			;8800
	add a,a			;8801
	call 0423eh		;8802
	jr L_87BE		;8805
L_8807:
	ld de,0daa0h		;8807
L_880A:
	call 0418eh		;880a
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
	call 043f6h		;8827
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
	call 043f6h		;8846
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
	call 051e0h		;8893
	call 04142h		;8896
	ld a,(ix+000h)		;8899
	cp 007h		;889c
	ret nz			;889e
	ld a,(ix+00dh)		;889f
	cp 008h		;88a2
	ret nz			;88a4
	ld hl,0daa8h		;88a5
	ld bc,00007h		;88a8
	call 04236h		;88ab
	ld hl,0dab8h		;88ae
	ld bc,00027h		;88b1
	jp 04236h		;88b4
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
	call 046ffh		;88d4
	call 0418eh		;88d7
	ld hl,00302h		;88da
	ld (0ca4ch),hl		;88dd
	ld de,0aa35h		;88e0
	ld hl,0e900h		;88e3
	call 051e0h		;88e6
	ld hl,0e900h		;88e9
	ld de,00000h		;88ec
L_88EF:
	ld a,(hl)			;88ef
	ld b,a			;88f0
	inc b			;88f1
	jr z,L_8904		;88f2
	call 04a0bh		;88f4
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
	call 04142h		;8904
	ld h,000h		;8907
	ld l,h			;8909
	ld d,h			;890a
	ld b,h			;890b
	ld e,040h		;890c
	ld c,080h		;890e
	ld a,009h		;8910
	call 04767h		;8912
L_8915:
	call L_89B4		;8915
	ld a,(0d801h)		;8918
	cp 006h		;891b
	ret c			;891d
	ld hl,00040h		;891e
	ld de,03080h		;8921
	ld bc,06080h		;8924
	ld a,002h		;8927
	call 04767h		;8929
	call 041cdh		;892c
	ld a,(0d80dh)		;892f
	push af			;8932
	call 0ab7dh		;8933
	pop af			;8936
	dec a			;8937
	and 003h		;8938
	call 0ab7dh		;893a
	jp 04142h		;893d
L_8940:
	ld ix,0d800h		;8940
	jp L_8100		;8944
L_8947:
	call L_8940		;8947
	ret nz			;894a
	ld hl,04800h		;894b
	ld de,00000h		;894e
	ld bc,03060h		;8951
	call 0474dh		;8954
L_8957:
	ld de,03000h		;8957
L_895A:
	call 0418eh		;895a
	ld hl,00303h		;895d
	ld (0ca4ch),hl		;8960
	ld hl,0a9edh		;8963
	ld bc,00c06h		;8966
	call L_896F		;8969
	jp 04142h		;896c
L_896F:
	push bc			;896f
	push de			;8970
	ld b,c			;8971
L_8972:
	ld a,(hl)			;8972
	call 04a0bh		;8973
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
	ld a,(0ca4ah)		;8986
	cp 007h		;8989
	ret nz			;898b
	ld hl,(0ca50h)		;898c
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
	ld a,(0c383h)		;89a8
	push af			;89ab
	call 041a0h		;89ac
	call 0b239h		;89af
	jr L_89BE		;89b2
L_89B4:
	ld a,(0c383h)		;89b4
	push af			;89b7
	call 041a0h		;89b8
	call 0b1fdh		;89bb
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
	ld a,(0ca76h)		;89e0
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
	ld a,(0cb00h)		;8a4b
	cp 00eh		;8a4e
	jr z,L_8A69		;8a50
	ld a,(ix+001h)		;8a52
	sub 020h		;8a55
	ld hl,08ad8h		;8a57
	jp nc,0424eh		;8a5a
	ld a,(ix+000h)		;8a5d
	dec a			;8a60
	ld hl,08a8dh		;8a61
	call 0424eh		;8a64
	jr L_8A6F		;8a67
L_8A69:
	ld a,(ix+001h)		;8a69
	cp 020h		;8a6c
	ret nc			;8a6e
L_8A6F:
	ld a,(ix+000h)		;8a6f
	call 0424dh		;8a72

; ----------------------------------------------------------------------
; DATOS sin identificar  0x8a75..0x8aa3  (46 bytes)
DATA_8A75:
	defb 0dfh,08bh,0d0h,08ah,0dfh,08bh,039h,087h,039h,087h,0dfh,08bh,0c8h,08ah,0cdh,0b2h	; 8a75  ......9.9.......
	defb 03bh,0bdh,039h,087h,06ah,0b5h,0dfh,08bh,0abh,08ah,0a3h,08ah,0f3h,0a5h,01fh,0ach	; 8a85  ..9.j...........
	defb 0a4h,0afh,0b3h,08ah,0b2h,0b2h,046h,0bdh,023h,0b9h,073h,0b5h,0bch,08ah	; 8a95  ......F.#.s...

; ======================================================================
; CODIGO 0x8aa3..0x8ac4  (33 bytes)
; ======================================================================


L_8AA3:
	call 041cdh		;8aa3
	call 0aa78h		;8aa6
	jr L_8AB9		;8aa9
L_8AAB:
	call 041f7h		;8aab
	call 0b8ech		;8aae
	jr L_8AB9		;8ab1
L_8AB3:
	call 041efh		;8ab3
	call 0ab9eh		;8ab6
L_8AB9:
	jp 04142h		;8ab9
L_8ABC:
	call 041efh		;8abc
	call 0ad0fh		;8abf
	jr L_8AB9		;8ac2

; ----------------------------------------------------------------------
; DATOS sin identificar  0x8ac4..0x8ac8  (4 bytes)
DATA_8AC4:
	defb 0cdh,088h,07ah,0e9h	; 8ac4

; ======================================================================
; CODIGO 0x8ac8..0x8ad8  (16 bytes)
; ======================================================================


L_8AC8:
	ld a,(0ca77h)		;8ac8
	and a			;8acb
	ret nz			;8acc
	jp L_8739		;8acd
L_8AD0:
	call 041f7h		;8ad0
	call 0b800h		;8ad3
	jr $-29		;8ad6

; ----------------------------------------------------------------------
; DATOS sin identificar  0x8ad8..0x8b90  (184 bytes)
DATA_8AD8:
	defb 0f4h,08ah,052h,08bh,072h,08bh,0f1h,08bh,0b6h,08bh,0e0h,08bh,083h,08ch,0a2h,08ch	; 8ad8  ..R.r...........
	defb 072h,08bh,0c5h,08ch,040h,08dh,05bh,08dh,072h,08bh,06eh,08dh,0cdh,059h,08ch,0afh	; 8ae8  r...@.[.r.n..Y..
	defb 0ddh,077h,00fh,0ddh,077h,00ch,03ch,032h,0aeh,0d8h,032h,03ch,0cbh,0ddh,07eh,000h	; 8af8  .w..w.<2..2<..~.
	defb 0feh,001h,028h,024h,0feh,002h,028h,017h,0feh,008h,028h,02dh,0ddh,036h,00eh,00ch	; 8b08  ..($..(...(-.6..
	defb 0ddh,036h,00dh,080h,0cdh,0aeh,06fh,0cdh,068h,08ch,0cdh,0dch,08bh,018h,014h,0ddh	; 8b18  .6....o.h.......
	defb 036h,00eh,048h,0ddh,036h,001h,026h,0c9h,0ddh,036h,00eh,018h,0ddh,036h,001h,02ah	; 8b28  6.H.6.&..6...6.*
	defb 0cdh,000h,081h,0cdh,012h,06bh,0c3h,03fh,06ch,0cdh,078h,08dh,03eh,003h,032h,05ah	; 8b38  .....k.?l.x.>.2Z
	defb 0cbh,0cdh,068h,07ah,03eh,00dh,032h,001h,0cbh,0c9h,0ddh,035h,00eh,028h,00dh,0ddh	; 8b48  ..hz>.2....5.(..
	defb 07eh,00eh,0e6h,003h,020h,003h,0ddh,034h,00dh,0c3h,039h,087h,0afh,032h,0aeh,0d8h	; 8b58  ~... ..4..9..2..
	defb 0cdh,028h,087h,0ddh,036h,00eh,018h,0c3h,0dch,08bh,0ddh,035h,00eh,0c0h,0cdh,090h	; 8b68  .(..6......5....
	defb 08bh,0cdh,028h,087h,0ddh,07eh,000h,0feh,005h,028h,008h,0feh,00ah,028h,004h,0feh	; 8b78  ..(..~...(...(..
	defb 006h,020h,0e0h,0ddh,036h,001h,024h,0c9h	; 8b88  . ..6.$.

; ======================================================================
; CODIGO 0x8b90..0x8bab  (27 bytes)
; ======================================================================


L_8B90:
	ld a,(ix+000h)		;8b90
	ld hl,08baah		;8b93
	call 04248h		;8b96
	and a			;8b99
	jr nz,L_8BA2		;8b9a
	call 06278h		;8b9c
	call 06c53h		;8b9f
L_8BA2:
	ld a,(0ca52h)		;8ba2
	ld (0ca53h),a		;8ba5
	jp 042a2h		;8ba8

; ----------------------------------------------------------------------
; DATOS sin identificar  0x8bab..0x8bdf  (52 bytes)
DATA_8BAB:
	defb 000h,001h,000h,000h,000h,000h,000h,001h,001h,001h,000h,0afh,032h,03ch,0cbh,0ddh	; 8bab  ............2<..
	defb 077h,016h,0ddh,07eh,000h,0feh,00ah,006h,00ah,028h,00ch,0feh,009h,006h,002h,028h	; 8bbb  w..~.....(.....(
	defb 006h,004h,0feh,006h,020h,001h,004h,03ah,04bh,0cah,0b8h,0c0h,03eh,001h,032h,03ch	; 8bcb  .... ..:K...>.2<
	defb 0cbh,0ddh,034h,001h	; 8bdb

; ======================================================================
; CODIGO 0x8bdf..0x8be0  (1 bytes)
; ======================================================================


L_8BDF:
	ret			;8bdf

; ----------------------------------------------------------------------
; DATOS sin identificar  0x8be0..0x8c4a  (106 bytes)
DATA_8BE0:
	defb 0ddh,07eh,000h,0feh,00ah,021h,009h,0d5h,020h,003h,021h,029h,0d5h,036h,001h,018h	; 8be0  .~...!.. .!).6..
	defb 023h,0ddh,035h,00eh,0c0h,0ddh,07eh,000h,0feh,003h,00eh,023h,028h,010h,00ch,0feh	; 8bf0  #.5...~....#(...
	defb 004h,028h,00bh,0feh,007h,00eh,029h,028h,005h,0feh,009h,00eh,02dh,0c0h,0cdh,03bh	; 8c00  .(....)(....-...
	defb 06ch,0cdh,04ah,08ch,0ddh,07eh,000h,047h,0feh,009h,020h,00ah,03eh,001h,032h,0a9h	; 8c10  l.J..~.G.. .>.2.
	defb 0d8h,03eh,00ah,032h,040h,0d8h,078h,0feh,005h,020h,005h,03eh,008h,032h,020h,0d8h	; 8c20  .>.2@.x.. .>.2 .
	defb 0afh,032h,026h,0cah,0ddh,077h,000h,0ddh,077h,001h,032h,03ch,0cbh,078h,0feh,001h	; 8c30  .2&..w..w.2<.x..
	defb 0c8h,0feh,008h,0c8h,001h,00fh,000h,0c3h,02bh,087h	; 8c40  ........+.

; ======================================================================
; CODIGO 0x8c4a..0x8c83  (57 bytes)
; ======================================================================


L_8C4A:
	ld a,(ix+005h)		;8c4a
	sub 008h		;8c4d
	ld d,a			;8c4f
	ld a,(ix+003h)		;8c50
	sub 008h		;8c53
	ld e,a			;8c55
	jp 07ac0h		;8c56
L_8C59:
	ld a,(ix+000h)		;8c59
	ld hl,0d87fh		;8c5c
	call 0423eh		;8c5f
	ld (hl),0ffh		;8c62
	ret			;8c64
L_8C65:
	call L_8C59		;8c65
	ld a,(0c383h)		;8c68
	push af			;8c6b
	call 041a0h		;8c6c
	call 0b14eh		;8c6f
L_8C72:
	pop af			;8c72
	push af			;8c73
	jp 041a3h		;8c74
L_8C77:
	ld a,(0c383h)		;8c77
	push af			;8c7a
	call 041a0h		;8c7b
	call 0b1dah		;8c7e
	jr L_8C72		;8c81

; ----------------------------------------------------------------------
; DATOS sin identificar  0x8c83..0x8d48  (197 bytes)
DATA_8C83:
	defb 0cdh,0cdh,041h,0cdh,012h,0adh,0cdh,042h,041h,0ddh,035h,00eh,0c0h,0cdh,05eh,06fh	; 8c83  ..A....BA.5...^o
	defb 0ddh,036h,00eh,060h,0afh,0ddh,077h,00fh,03ch,032h,0bah,0d8h,0c3h,0dch,08bh,0cdh	; 8c93  .6.`..w.<2......
	defb 0cdh,041h,0cdh,0c3h,0adh,0cdh,09ch,0aeh,0cdh,042h,041h,0ddh,035h,00eh,0c2h,045h	; 8ca3  .A.......BA.5..E
	defb 08dh,0afh,0cdh,048h,08dh,0cdh,03bh,08bh,0cdh,0f1h,045h,0ddh,036h,00eh,030h,0c3h	; 8cb3  ...H......E.6.0.
	defb 0dch,08bh,0ddh,0e5h,0cdh,0beh,045h,0afh,032h,0aeh,0d8h,032h,01ch,0cah,032h,0a5h	; 8cc3  ......E.2..2..2.
	defb 0d8h,032h,0a4h,0d8h,032h,0b0h,0d6h,032h,021h,0cbh,032h,020h,0cbh,032h,035h,0cbh	; 8cd3  .2..2..2!.2 .25.
	defb 032h,000h,0cbh,032h,001h,0cbh,032h,060h,0d7h,03ch,032h,03ch,0cbh,021h,080h,0cch	; 8ce3  2..2..2`.<2<.!..
	defb 001h,07fh,000h,0cdh,036h,042h,03eh,009h,032h,020h,0d8h,0cdh,078h,08dh,016h,000h	; 8cf3  ....6B>.2 ..x...
	defb 0cdh,0e4h,04bh,016h,001h,0cdh,0e4h,04bh,0cdh,080h,07ah,0cdh,0f4h,05dh,0cdh,070h	; 8d03  ..K....K..z..].p
	defb 042h,03eh,001h,0cdh,048h,08dh,03eh,060h,032h,003h,0cbh,032h,005h,0cbh,03eh,002h	; 8d13  B>..H.>`2..2..>.
	defb 032h,00eh,0cbh,0cdh,010h,050h,0cdh,076h,054h,0cdh,07eh,043h,0cdh,050h,046h,001h	; 8d23  2....P.vT.~C.PF.
	defb 000h,006h,0cdh,047h,000h,0cdh,0aeh,06ch,0ddh,0e1h,0c3h,006h,046h,0ddh,035h,00eh	; 8d33  ...G...l....F.5.
	defb 028h,00dh,0ddh,07eh,00eh	; 8d43

; ======================================================================
; CODIGO 0x8d48..0x8d52  (10 bytes)
; ======================================================================


L_8D48:
	rra			;8d48
	ld bc,00f07h		;8d49
	jr c,L_8D4F		;8d4c
	ld b,c			;8d4e
L_8D4F:
	jp 00047h		;8d4f   ; BIOS WRTVDP - Writes data in the VDP-register

; ----------------------------------------------------------------------
; DATOS sin identificar  0x8d52..0x8e2a  (216 bytes)
DATA_8D52:
	defb 001h,01fh,000h,0cdh,02bh,087h,0c3h,0dch,08bh,0afh,032h,0aeh,0d8h,0cdh,0beh,06fh	; 8d52  ....+.....2....o
	defb 0cdh,0a0h,041h,0cdh,0d6h,0b2h,0cdh,042h,041h,0c3h,06bh,08bh,0cdh,0a0h,041h,0cdh	; 8d62  ..A....BA.k...A.
	defb 01dh,0b3h,0cdh,042h,041h,0d8h,0cdh,068h,08ch,0c3h,014h,08ch,0cdh,0bdh,041h,0cdh	; 8d72  ...BA..h......A.
	defb 099h,08dh,0cdh,019h,08eh,0cdh,033h,08eh,0cdh,065h,08eh,0cdh,042h,041h,03eh,003h	; 8d82  ......3..e..BA>.
	defb 0ddh,077h,00fh,0ddh,034h,001h,0c9h,03ah,04ah,0cah,021h,050h,0b0h,0cdh,0f6h,043h	; 8d92  .w..4..:J.!P...C
	defb 0ddh,07eh,011h,0c3h,0f6h,043h,0cdh,0bdh,041h,0cdh,03bh,0a1h,018h,02bh,0cdh,0bdh	; 8da2  .~...C..A....+..
	defb 041h,0cdh,099h,08dh,054h,05dh,0ddh,07eh,00fh,0cdh,048h,042h,03ch,0cch,0deh,08dh	; 8db2  A...T].~..HB<...
	defb 07eh,017h,038h,01eh,0cdh,019h,08eh,0cdh,033h,08eh,0cdh,065h,08eh,0ddh,07eh,00fh	; 8dc2  ~.8.....3..e..~.
	defb 0c6h,003h,0ddh,077h,00fh,0ddh,036h,001h,001h,0c3h,042h,041h,0ddh,036h,00fh,000h	; 8dd2  ...w..6...BA.6..
	defb 0ebh,0c9h,07eh,0e6h,003h,087h,0ddh,077h,00dh,0ddh,077h,015h,0cdh,042h,041h,0ddh	; 8de2  ..~....w..w..BA.
	defb 036h,00ch,000h,0ddh,036h,00eh,080h,0ddh,034h,00fh,0ddh,07eh,000h,0feh,006h,0c2h	; 8df2  6...6...4..~....
	defb 095h,08dh,0ddh,036h,00eh,020h,0ddh,07eh,02dh,0ddh,034h,02dh,01fh,03eh,010h,030h	; 8e02  ...6. .~-.4-.>.0
	defb 002h,03eh,013h,0ddh,077h,001h,0c9h,07eh,017h,017h,03eh,000h,030h,001h,03ch,0ddh	; 8e12  .>..w..~..>.0.<.
	defb 077h,01ah,0c9h,0cdh,037h,08eh,018h,0b1h	; 8e22  w...7...

; ======================================================================
; CODIGO 0x8e2a..0x8e33  (9 bytes)
; ======================================================================


L_8E2A:
	call L_8E37		;8e2a
	call 0413fh		;8e2d
	jp 041efh		;8e30

; ----------------------------------------------------------------------
; DATOS sin identificar  0x8e33..0x8e37  (4 bytes)
DATA_8E33:
	defb 07eh,0e6h,003h,023h	; 8e33

; ======================================================================
; CODIGO 0x8e37..0x8e65  (46 bytes)
; ======================================================================


L_8E37:
	call 041a0h		;8e37
	call 0b592h		;8e3a
	jp 041bdh		;8e3d
L_8E40:
	ld a,c			;8e40
	add a,a			;8e41
	add a,a			;8e42
	call 04243h		;8e43
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

; ----------------------------------------------------------------------
; DATOS sin identificar  0x8e65..0x8e75  (16 bytes)
DATA_8E65:
	defb 07eh,0cdh,075h,08eh,0ddh,073h,012h,0ddh,072h,013h,023h,07eh,0ddh,077h,014h,0c9h	; 8e65  ~.u..s..r.#~.w..

; ======================================================================
; CODIGO 0x8e75..0x8e82  (13 bytes)
; ======================================================================


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

; ----------------------------------------------------------------------
; DATOS sin identificar  0x8e82..0x8ebe  (60 bytes)
DATA_8E82:
	defb 0ddh,07eh,00ah,0ddh,0beh,012h,020h,02fh,0ddh,07eh,00bh,0ddh,0beh,013h,020h,027h	; 8e82  .~.... /.~.... '
	defb 0ddh,07eh,00ch,01fh,0ddh,07eh,003h,0ddh,046h,007h,038h,006h,0ddh,07eh,005h,0ddh	; 8e92  .~...~..F.8..~..
	defb 046h,009h,0ddh,04eh,014h,0cbh,010h,038h,00ch,0edh,044h,0d6h,040h,047h,079h,0edh	; 8ea2  F..N...8..D.@Gy.
	defb 044h,0d6h,040h,04fh,078h,0b9h,0d8h,0cdh,0e6h,080h,0b7h,0c9h	; 8eb2  D.@Ox.......

; ======================================================================
; CODIGO 0x8ebe..0x8ecd  (15 bytes)
; ======================================================================


L_8EBE:
	ld a,(0c383h)		;8ebe
	push af			;8ec1
	call 041a0h		;8ec2
	call 0b5fbh		;8ec5
	pop af			;8ec8
	push af			;8ec9
	jp 041a3h		;8eca

; ----------------------------------------------------------------------
; DATOS sin identificar  0x8ecd..0x907a  (429 bytes)
DATA_8ECD:
	defb 03ah,083h,0c3h,0f5h,0cdh,0a0h,041h,0cdh,026h,0b6h,018h,0efh,0ddh,07eh,000h,0feh	; 8ecd  :.....A.&....~..
	defb 00bh,028h,012h,0feh,00ch,028h,00eh,0ddh,035h,00eh,028h,009h,03ah,003h,0cah,0e6h	; 8edd  .(...(..5.(.:...
	defb 007h,0c0h,0c3h,00dh,08fh,0ddh,07eh,022h,0ddh,077h,00ch,0ddh,07eh,020h,0ddh,077h	; 8eed  ......~".w..~ .w
	defb 001h,0ddh,07eh,015h,0ddh,077h,00dh,0ddh,036h,010h,003h,0ddh,036h,00eh,010h,0c9h	; 8efd  ..~..w..6...6...
	defb 0cdh,0a0h,041h,0cdh,0e2h,0b5h,0c3h,042h,041h,0cdh,06fh,080h,0d8h,0ddh,07eh,001h	; 8f0d  ..A....BA.o...~.
	defb 0feh,008h,0cah,0cdh,08eh,0feh,009h,0cah,0d9h,08eh,0cdh,04dh,042h,032h,08fh,056h	; 8f1d  ...........MB2.V
	defb 08fh,0adh,08fh,0bbh,08fh,0ddh,07eh,01ch,0a7h,028h,004h,0ddh,035h,01ch,0c0h,0cdh	; 8f2d  ......~..(..5...
	defb 0a9h,090h,0cdh,08ch,090h,0a0h,0cdh,07ah,090h,0cdh,037h,08eh,0cdh,056h,042h,0e6h	; 8f3d  .......z..7..VB.
	defb 00fh,0c6h,008h,0ddh,077h,00eh,0c3h,095h,08dh,0cdh,0c8h,090h,0ddh,07eh,00dh,00fh	; 8f4d  ....w........~..
	defb 0e6h,003h,006h,001h,028h,00dh,03dh,006h,002h,028h,008h,03dh,006h,004h,028h,003h	; 8f5d  ....(.=..(.=..(.
	defb 03dh,006h,008h,078h,0a1h,020h,005h,0ddh,035h,00eh,020h,01ch,0cdh,0d4h,08fh,0f5h	; 8f6d  =..x. ..5. .....
	defb 0cdh,09ah,08fh,0f1h,0cdh,037h,08eh,0ddh,036h,00eh,004h,0ddh,07eh,00ch,0ddh,077h	; 8f7d  .....7..6...~..w
	defb 016h,0ddh,036h,00ch,000h,0c3h,095h,08dh,006h,004h,0c3h,022h,090h,0ddh,07eh,00ch	; 8f8d  ..6........"..~.
	defb 047h,01fh,030h,005h,0cdh,09eh,080h,018h,003h,0cdh,08eh,080h,078h,0c3h,085h,080h	; 8f9d  G.0.........x...
	defb 0ddh,035h,00eh,0c0h,0cdh,04dh,09bh,0ddh,036h,00eh,002h,0c3h,095h,08dh,0ddh,035h	; 8fad  .5...M..6......5
	defb 00eh,0c0h,0cdh,056h,042h,0e6h,01fh,0f6h,010h,0ddh,077h,00eh,0ddh,07eh,016h,0ddh	; 8fbd  ...VB.....w..~..
	defb 077h,00ch,0ddh,036h,001h,001h,0c9h,0cdh,0c8h,090h,0cdh,0a9h,090h,0cdh,08ch,090h	; 8fcd  w..6............
	defb 0a0h,057h,059h,021h,000h,004h,0afh,0cbh,01bh,017h,0cbh,01ah,030h,005h,0a7h,020h	; 8fdd  .WY!........0..
	defb 002h,07dh,0c9h,025h,02ch,020h,0efh,0cdh,056h,042h,0e6h,001h,03ch,057h,079h,006h	; 8fed  .}.%, ..VB..<Wy.
	defb 003h,01eh,000h,01fh,038h,003h,015h,028h,003h,01ch,010h,0f7h,07bh,0c9h,0ddh,07eh	; 8ffd  ....8..(....{..~
	defb 019h,0a7h,006h,004h,028h,00fh,005h,03dh,028h,00bh,005h,03dh,028h,007h,005h,0ddh	; 900d  ....(..=(..=(...
	defb 07eh,000h,0feh,003h,0c0h,0ddh,034h,018h,0ddh,07eh,018h,0b8h,0d8h,0ddh,036h,018h	; 901d  ~.....4..~....6.
	defb 000h,0ddh,07eh,00dh,01fh,03fh,017h,0ddh,077h,00dh,0c9h,0cdh,0c8h,090h,0ddh,07eh	; 902d  ..~..?..w......~
	defb 00ch,01fh,03eh,003h,038h,002h,03eh,00ch,0a1h,0c9h,0d9h,021h,01ch,0d4h,011h,01dh	; 903d  ..>.8.>....!....
	defb 0d4h,0d9h,0ddh,07eh,00ch,01fh,001h,0a0h,020h,0ddh,056h,007h,0ddh,05eh,003h,038h	; 904d  ...~.... .V..^.8
	defb 00ch,001h,0b0h,008h,0ddh,056h,009h,0ddh,05eh,005h,0d9h,0ebh,0d9h,07bh,090h,0b9h	; 905d  .....V..^....{..
	defb 0d0h,0cbh,012h,0d9h,07eh,0d9h,038h,003h,0bbh,03fh,0c9h,0bbh,0c9h	; 906d  ....~.8..?...

; ======================================================================
; CODIGO 0x907a..0x9085  (11 bytes)
; ======================================================================


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

; ----------------------------------------------------------------------
; DATOS sin identificar  0x9085..0x9095  (16 bytes)
DATA_9085:
	defb 0cdh,079h,080h,07ch,065h,06fh,0c9h,0cdh,085h,090h,0ddh,056h,003h,0ddh,05eh,005h	; 9085  .y.|eo.....V..^.

; ======================================================================
; CODIGO 0x9095..0x90a9  (20 bytes)
; ======================================================================


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

; ----------------------------------------------------------------------
; DATOS sin identificar  0x90a9..0x90b2  (9 bytes)
DATA_90A9:
	defb 0cdh,085h,090h,0ddh,056h,003h,0ddh,05eh,005h	; 90a9  ....V..^.

; ======================================================================
; CODIGO 0x90b2..0x90c8  (22 bytes)
; ======================================================================


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

; ----------------------------------------------------------------------
; DATOS sin identificar  0x90c8..0x90ce  (6 bytes)
DATA_90C8:
	defb 0ddh,066h,005h,0ddh,06eh,003h	; 90c8

; ======================================================================
; CODIGO 0x90ce..0x915c  (142 bytes)
; ======================================================================


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
	ld de,(0ca4eh)		;913a
	push de			;913e
	ld a,(0ca4ah)		;913f
	cp 007h		;9142
	jr nz,L_914F		;9144
	ld a,(0ca4bh)		;9146
	cp 009h		;9149
	jr nz,L_914F		;914b
	ld e,030h		;914d
L_914F:
	ld (0ca4eh),de		;914f
	call 07f3dh		;9153
	pop de			;9156
	ld (0ca4eh),de		;9157
	ret			;915b

; ----------------------------------------------------------------------
; DATOS sin identificar  0x915c..0x917c  (32 bytes)
DATA_915C:
	defb 0f8h,0fch,0f8h,003h,002h,0fch,002h,003h,0f6h,0fch,0f6h,003h,004h,0fch,004h,003h	; 915c  ................
	defb 0fah,0f8h,0feh,0f8h,0fah,007h,0feh,007h,0fah,0f5h,000h,0f5h,0fah,009h,000h,009h	; 916c  ................

; ======================================================================
; CODIGO 0x917c..0x96ff  (1411 bytes)
; ======================================================================


L_917C:
	ld a,(0caa0h)		;917c
	cp 004h		;917f
	jp z,05a0fh		;9181
	ld a,(0ca4ah)		;9184
	cp 010h		;9187
	jp nc,05a0fh		;9189
	cp 00ch		;918c
	jr nz,L_919B		;918e
	ld a,(0ca4bh)		;9190
	cp 003h		;9193
	jp c,05a0fh		;9195
	call 05a0fh		;9198
L_919B:
	ld a,(0ca5fh)		;919b
	and a			;919e
	ret z			;919f
	dec a			;91a0
	jr z,L_921D		;91a1
	dec a			;91a3
	jr z,L_91AF		;91a4
	ld a,(0ca76h)		;91a6
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
	call 05a11h		;9205
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
	ld hl,(0ca50h)		;9232
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
	ld a,(0ca4ah)		;9256
	cp 004h		;9259
	ret nz			;925b
	ld a,(0ca4bh)		;925c
	cp 006h		;925f
	ret nz			;9261
	ld hl,0ca5fh		;9262
	ld a,(hl)			;9265
	cp 003h		;9266
	ret nc			;9268
	ld (hl),003h		;9269
	ret			;926b
L_926C:
	ld a,(0c383h)		;926c
	push af			;926f
	call 041a0h		;9270
	call 0b532h		;9273
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
	ld a,(0c383h)		;928b
	push af			;928e
	call 041f7h		;928f
	call 0bdb8h		;9292
L_9295:
	pop af			;9295
L_9296:
	push af			;9296
	jp 041a3h		;9297
L_929A:
	ld a,(0c383h)		;929a
	push af			;929d
	call 041a0h		;929e
	call 0b55ah		;92a1
L_92A4:
	pop bc			;92a4
	ld a,b			;92a5
	jr L_9296		;92a6
L_92A8:
	ld a,(0c383h)		;92a8
	push af			;92ab
	call 041f7h		;92ac
	call 0be48h		;92af
	jr L_9295		;92b2
L_92B4:
	ld a,(0c383h)		;92b4
	push af			;92b7
	call 041f7h		;92b8
	call 0be64h		;92bb
	jr L_92A4		;92be
L_92C0:
	call L_92C7		;92c0
	ret nz			;92c3
	jp L_924C		;92c4
L_92C7:
	ld a,(0c383h)		;92c7
	push af			;92ca
	call 041f7h		;92cb
	call 0bed7h		;92ce
	jr L_92A4		;92d1
L_92D3:
	ld a,(0c383h)		;92d3
	push af			;92d6
	call 041f7h		;92d7
	call 0bf5bh		;92da
	jr L_9295		;92dd
L_92DF:
	ld a,(0c383h)		;92df
	push af			;92e2
	call 041f7h		;92e3
	call 0bf0dh		;92e6
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
	ld a,(0ca4ah)		;9311
	cp 011h		;9314
	ret z			;9316
	cp 004h		;9317
	jr nz,L_9322		;9319
	ld a,(0ca4bh)		;931b
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
	ld a,(0ca76h)		;932f
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
	jp 06bech		;9368
L_936B:
	ld hl,(0ca50h)		;936b
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
	ld a,(0ca65h)		;93b2
	and a			;93b5
	jr z,L_93C2		;93b6
	ld b,000h		;93b8
	ld c,002h		;93ba
	ld de,0b060h		;93bc
	jp L_9786		;93bf
L_93C2:
	ld a,(0ca76h)		;93c2
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
	call 04248h		;9429
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
	call 06a60h		;9483
	xor a			;9486
	ret			;9487
L_9488:
	call 0437eh		;9488
	call L_94A2		;948b
	call 0439dh		;948e
	ld hl,0ca42h		;9491
	ld a,(hl)			;9494
	push hl			;9495
	push af			;9496
	xor 001h		;9497
	ld (hl),a			;9499
	call 0439dh		;949a
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
	call 07a88h		;94bd
	ld (0ca19h),hl		;94c0
	ld a,0b4h		;94c3
	ld (0ca18h),a		;94c5
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
	call 04188h		;950f
	call 0685fh		;9512
	jp 0413fh		;9515
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
	call 0423eh		;9526
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
	ld a,(0ca76h)		;953c
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
	ld a,(0ca4ah)		;959c
	ld b,a			;959f
	cp 011h		;95a0
	jr c,L_95D9		;95a2
	ld a,(0ca4bh)		;95a4
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
	ld a,(0ca4bh)		;95de
	cp 009h		;95e1
	ld de,020a0h		;95e3
	jp z,L_9784		;95e6
L_95E9:
	call L_980D		;95e9
	ret nc			;95ec
	ld a,(0ca65h)		;95ed
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
	call 04256h		;9602
	rra			;9605
	ld de,0b050h		;9606
	jr c,L_960D		;9609
	ld e,070h		;960b
L_960D:
	ld a,(0ca65h)		;960d
	and a			;9610
	ld c,002h		;9611
	jp nz,L_9786		;9613
	ld a,(0ca77h)		;9616
	inc c			;9619
	cp 001h		;961a
	ld de,05460h		;961c
	jp z,L_9786		;961f
	ret nc			;9622
	ld a,(0ca76h)		;9623
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
	call 04256h		;9691
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
	call 0424eh		;96a8
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
	ld a,(0ca76h)		;96ba
	and a			;96bd
	ret nz			;96be
	ld a,(0ca4ah)		;96bf
	cp 010h		;96c2
	jr z,L_96DC		;96c4
	cp 00ch		;96c6
	jr z,L_96D6		;96c8
	cp 00dh		;96ca
	jr nz,L_96DE		;96cc
	ld a,(0ca4bh)		;96ce
	and a			;96d1
	jr nz,L_96DE		;96d2
	jr L_96DC		;96d4
L_96D6:
	ld a,(0ca4bh)		;96d6
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
	call 0423eh		;96f7
	djnz L_96EB		;96fa
	or 001h		;96fc
	ret			;96fe

; ----------------------------------------------------------------------
; DATOS sin identificar  0x96ff..0x9784  (133 bytes)
DATA_96FF:
	defb 007h,097h,0cbh,097h,0e1h,097h,0ffh,097h,021h,000h,0ddh,011h,040h,0dfh,001h,018h	; 96ff  ........!...@...
	defb 000h,0edh,0b0h,0cdh,0adh,097h,011h,000h,012h,03eh,002h,032h,01eh,0d4h,021h,040h	; 970f  .........>.2..!@
	defb 0dfh,001h,000h,018h,07eh,0feh,081h,0d9h,021h,04eh,0cah,038h,001h,023h,0beh,0d9h	; 971f  ....~...!N.8.#..
	defb 030h,001h,00ch,023h,010h,0eeh,079h,0feh,002h,0d8h,0cdh,056h,042h,0e6h,01fh,0feh	; 972f  0..#..y....VB...
	defb 017h,038h,001h,0afh,04fh,021h,040h,0dfh,0cdh,03eh,042h,006h,017h,0cdh,068h,097h	; 973f  .8..O!@..>B...h.
	defb 030h,007h,023h,0cdh,068h,097h,038h,01eh,02bh,023h,00ch,079h,0feh,017h,038h,005h	; 974f  0.#.h.8.+#.y..8.
	defb 021h,040h,0dfh,00eh,000h,010h,0e6h,037h,0c9h,07eh,0feh,081h,0d9h,021h,04eh,0cah	; 975f  !@.....7.~...!N.
	defb 038h,001h,023h,0beh,0d9h,0c9h,079h,087h,087h,087h,0c6h,008h,047h,07ah,0a7h,028h	; 976f  8.#...y.....Gz.(
	defb 003h,058h,018h,001h,050h	; 977f

; ======================================================================
; CODIGO 0x9784..0x97ad  (41 bytes)
; ======================================================================


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

; ----------------------------------------------------------------------
; DATOS sin identificar  0x97ad..0x980d  (96 bytes)
DATA_97AD:
	defb 03ah,04ah,0cah,03dh,0c0h,03ah,051h,0cah,0feh,005h,0c0h,03ah,050h,0cah,0d6h,002h	; 97ad  :J.=.:Q....:P...
	defb 0feh,003h,0d0h,021h,048h,0dfh,001h,00bh,000h,03eh,081h,0c3h,037h,042h,021h,028h	; 97bd  ...!H....>..7B!(
	defb 0dfh,011h,040h,0dfh,001h,018h,000h,0edh,0b0h,0cdh,0adh,097h,011h,000h,0c0h,03eh	; 97cd  ..@............>
	defb 001h,0c3h,01ah,097h,021h,000h,0ddh,0cdh,0efh,097h,011h,008h,000h,03eh,004h,0c3h	; 97dd  ....!........>..
	defb 01ah,097h,011h,040h,0dfh,006h,018h,07eh,012h,013h,03eh,018h,0cdh,03eh,042h,010h	; 97ed  ...@...~..>..>B.
	defb 0f6h,0c9h,021h,017h,0ddh,0cdh,0efh,097h,011h,0b8h,000h,03eh,003h,0c3h,01ah,097h	; 97fd  ..!........>....

; ======================================================================
; CODIGO 0x980d..0x98e0  (211 bytes)
; ======================================================================


L_980D:
	ld hl,0d426h		;980d
	ld a,(hl)			;9810
	inc hl			;9811
	cp (hl)			;9812
	ret			;9813
L_9814:
	call L_981A		;9814
	jp 041efh		;9817
L_981A:
	ld hl,00800h		;981a
	ld (0e208h),hl		;981d
	ld a,(0ca42h)		;9820
	ld d,a			;9823
	ld a,0ffh		;9824
	call 041ddh		;9826
	call 06f49h		;9829
	call 0413fh		;982c
L_982F:
	call L_984C		;982f
	call L_98FB		;9832
	call 041ddh		;9835
	call 06ffeh		;9838
	jp 0413fh		;983b
L_983E:
	ld hl,00000h		;983e
	ld (0e202h),hl		;9841
	ld a,01ch		;9844
	ld (0e20bh),a		;9846
	jp 0439dh		;9849
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
	ld a,(0ca53h)		;988f
L_9892:
	push af			;9892
	ld hl,0ce3fh		;9893
	ld bc,01008h		;9896
	ld a,(0ca42h)		;9899
	ld d,a			;989c
	ld a,0ffh		;989d
	call 046ffh		;989f
	pop af			;98a2
	ld bc,(0c382h)		;98a3
	push bc			;98a7
	call 041f7h		;98a8
	call 0bf98h		;98ab
L_98AE:
	jp L_9295		;98ae
L_98B1:
	ld bc,(0c382h)		;98b1
	push bc			;98b5
	call 041f7h		;98b6
	call 0bfbfh		;98b9
	jr L_98AE		;98bc
L_98BE:
	ld b,003h		;98be
	ld a,(0ca42h)		;98c0
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
	call 04767h		;98d7
	pop hl			;98da
	inc hl			;98db
	pop bc			;98dc
	djnz L_98CA		;98dd
	ret			;98df

; ----------------------------------------------------------------------
; DATOS sin identificar  0x98e0..0x98fb  (27 bytes)
DATA_98E0:
	defb 0e0h,01ch,000h,0e0h,024h,018h,0e0h,02ch,030h,0c8h,033h,048h,0c8h,03bh,060h,0c8h	; 98e0  ....$..,0.3H..`.
	defb 043h,078h,0c8h,033h,090h,0c8h,03bh,0a8h,0c8h,043h,078h	; 98f0  Cx.3.....Cx

; ======================================================================
; CODIGO 0x98fb..0x9967  (108 bytes)
; ======================================================================


L_98FB:
	call 041ddh		;98fb
	call 0418eh		;98fe
	ld a,(0ca5fh)		;9901
	dec a			;9904
	ld hl,0a242h		;9905
	jr z,L_990E		;9908
	dec a			;990a
	ld hl,0a2a6h		;990b
L_990E:
	ld bc,06407h		;990e
	call 06fc4h		;9911
	ld de,0ea00h		;9914
	ld hl,00fe6h		;9917
	call L_9929		;991a
	ld de,0eac8h		;991d
	ld hl,019f0h		;9920
	call L_9929		;9923
	jp 0413fh		;9926
L_9929:
	ld a,(0ca42h)		;9929
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
	call 04486h		;993d
	ld a,080h		;9940
	call 04243h		;9942
	pop bc			;9945
	djnz L_9938		;9946
	ret			;9948
L_9949:
	ld a,(0c383h)		;9949
	push af			;994c
	call 041efh		;994d
	call 0b128h		;9950
	jr $+30		;9953
L_9955:
	ld a,(0c383h)		;9955
	push af			;9958
	call 041efh		;9959
	call 0b176h		;995c
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
; CODIGO 0x9971..0x9ad0  (351 bytes)
; ======================================================================


L_9971:
	pop af			;9971
	push af			;9972
	jp 041a3h		;9973
L_9976:
	ld a,(0c383h)		;9976
	push af			;9979
	call 041efh		;997a
	call 0b34fh		;997d
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
	ld bc,(0c382h)		;9a70
	push bc			;9a74
	call 041a0h		;9a75
	call 0b256h		;9a78
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
	ld a,(0c383h)		;9aa9
	push af			;9aac
	call 041a0h		;9aad
	call 0a8e8h		;9ab0
	jr L_9ABF		;9ab3
L_9AB5:
	ld a,(0c383h)		;9ab5
	push af			;9ab8
	call 041a0h		;9ab9
	call 0a924h		;9abc
L_9ABF:
	pop af			;9abf
	push af			;9ac0
	jp 041a3h		;9ac1
L_9AC4:
	ld a,(0c383h)		;9ac4
	push af			;9ac7
	call 041a0h		;9ac8
	call 0a7e9h		;9acb
	jr L_9ABF		;9ace

; ----------------------------------------------------------------------
; DATOS sin identificar  0x9ad0..0x9adc  (12 bytes)
DATA_9AD0:
	defb 03ah,083h,0c3h,0f5h,0cdh,0a0h,041h,0cdh,042h,0a9h,018h,0e3h	; 9ad0  :.....A.B...

; ======================================================================
; CODIGO 0x9adc..0x9ae8  (12 bytes)
; ======================================================================


L_9ADC:
	ld a,(0c383h)		;9adc
	push af			;9adf
	call 041a0h		;9ae0
	call 0a979h		;9ae3
	jr $-39		;9ae6

; ----------------------------------------------------------------------
; DATOS sin identificar  0x9ae8..0x9b02  (26 bytes)
DATA_9AE8:
	defb 03ah,083h,0c3h,0f5h,0cdh,0a0h,041h,0cdh,05ah,0a9h,018h,0cbh,006h,007h,018h,05dh	; 9ae8  :.....A.Z......]
	defb 006h,003h,018h,056h,0cdh,002h,09bh,0c3h,0bdh,041h	; 9af8  ...V.....A

; ======================================================================
; CODIGO 0x9b02..0x9b06  (4 bytes)
; ======================================================================


L_9B02:
	ld b,001h		;9b02
	jr $+78		;9b04

; ----------------------------------------------------------------------
; DATOS sin identificar  0x9b06..0x9b30  (42 bytes)
DATA_9B06:
	defb 0cdh,0d0h,09ah,006h,005h,018h,045h,0feh,00ah,0cdh,0d0h,09ah,022h,03ch,0d4h,006h	; 9b06  ......E....."<..
	defb 008h,018h,039h,006h,008h,0cdh,0e8h,09ah,018h,008h,021h,0f0h,000h,022h,03ch,0d4h	; 9b16  ..9.......!.."<.
	defb 006h,006h,0ddh,066h,019h,0ddh,06eh,018h,018h,025h	; 9b26  ...f..n..%

; ======================================================================
; CODIGO 0x9b30..0x9b3b  (11 bytes)
; ======================================================================


L_9B30:
	ld bc,000e0h		;9b30
	ld (0d43ch),bc		;9b33
	ld b,006h		;9b37
	jr $+28		;9b39

; ----------------------------------------------------------------------
; DATOS sin identificar  0x9b3b..0x9b52  (23 bytes)
DATA_9B3B:
	defb 0cdh,0d0h,09ah,018h,009h,0ddh,07eh,000h,021h,0f0h,000h,022h,03ch,0d4h,006h,006h	; 9b3b  ......~.!.."<...
	defb 018h,005h,0cdh,0d0h,09ah,006h,004h	; 9b4b

; ======================================================================
; CODIGO 0x9b52..0x9cdd  (395 bytes)
; ======================================================================


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
	call 04236h		;9b96
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
	call 07987h		;9bda
	ld (0d8e0h),hl		;9bdd
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
	ld bc,(0d8e0h)		;9c0c
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
	jp z,06c4fh		;9c2b
	cp 002h		;9c2e
	jp z,06a6fh		;9c30
	ld a,(0d8e8h)		;9c33
	cp 005h		;9c36
	jp z,06c1fh		;9c38
	jp 06a5ch		;9c3b
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
	jp 04237h		;9c69
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
	ld a,(0c383h)		;9caa
	push af			;9cad
	call 041a0h		;9cae
	call 0aa18h		;9cb1
	jp L_9ABF		;9cb4
L_9CB7:
	ld a,(ix+00eh)		;9cb7
	add a,a			;9cba
	add a,a			;9cbb
	ld hl,0dc28h		;9cbc
	jp 0423eh		;9cbf
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
L_9CD5:
	call 041ddh		;9cd5
	call 074bch		;9cd8
	jr $+8		;9cdb

; ----------------------------------------------------------------------
; DATOS sin identificar  0x9cdd..0x9ce3  (6 bytes)
DATA_9CDD:
	defb 0cdh,0ddh,041h,0cdh,0cbh,074h	; 9cdd

; ======================================================================
; CODIGO 0x9ce3..0x9d08  (37 bytes)
; ======================================================================


L_9CE3:
	jp 041eah		;9ce3
L_9CE6:
	call 041ddh		;9ce6
	call 0758dh		;9ce9
	jr L_9CE3		;9cec
L_9CEE:
	ld bc,00820h		;9cee
L_9CF1:
	ld a,001h		;9cf1
	ld (0ca28h),a		;9cf3
	call 041ddh		;9cf6
	call 075c3h		;9cf9
	jr L_9CE3		;9cfc
L_9CFE:
	ld bc,08318h		;9cfe
	jr L_9CF1		;9d01
L_9D03:
	ld bc,08418h		;9d03
	jr L_9CF1		;9d06

; ----------------------------------------------------------------------
; DATOS sin identificar  0x9d08..0x9d12  (10 bytes)
DATA_9D08:
	defb 001h,020h,005h,018h,0e4h,001h,020h,006h,018h,0dfh	; 9d08  . .... ...

; ======================================================================
; CODIGO 0x9d12..0x9d1b  (9 bytes)
; ======================================================================


L_9D12:
	call L_8100		;9d12
	ret nz			;9d15
	ld bc,00730h		;9d16
	jr $-40		;9d19

; ----------------------------------------------------------------------
; DATOS sin identificar  0x9d1b..0xa000  (741 bytes)
DATA_9D1B:
	defb 001h,020h,082h,018h,0d1h,001h,018h,009h,018h,0cch,001h,020h,08bh,018h,0c7h,001h	; 9d1b  . ......... ....
	defb 030h,00ah,018h,0c2h,001h,030h,08ch,018h,0bdh,001h,030h,08dh,018h,0b8h,0ddh,07eh	; 9d2b  0....0....0....~
	defb 000h,017h,0dah,0e9h,08eh,03ah,05fh,0cah,0a7h,028h,00dh,0feh,001h,0cah,0adh,0a2h	; 9d3b  .....:_..(......
	defb 0ddh,07eh,001h,0feh,015h,0dah,016h,08fh,0cdh,019h,0a0h,0ddh,07eh,001h,0cdh,04dh	; 9d4b  .~..........~..M
	defb 042h,07eh,08dh,050h,0a2h,065h,0a2h,07fh,0a2h,0b0h,08dh,0a6h,0a2h,0e1h,0a0h,018h	; 9d5b  B~.P.e..........
	defb 0a1h,0cdh,08eh,0d9h,08eh,0b0h,09dh,0c2h,09dh,005h,09eh,031h,09eh,05ah,09eh,06fh	; 9d6b  ...........1.Z.o
	defb 09eh,0c5h,0a1h,0e5h,0a1h,00ch,0a2h,03fh,0a2h,036h,0a2h,04bh,0a1h,061h,0a1h,088h	; 9d7b  .......?.6.K.a..
	defb 0a1h,0a7h,0a1h,0a0h,0a1h,0b6h,0a1h,02fh,0a1h,062h,0a0h,080h,0a0h,09ah,0a0h,0aah	; 9d8b  ......./.b......
	defb 0a0h,0bch,0a0h,0dbh,0a0h,0a7h,09fh,0ebh,09fh,001h,0a0h,09ah,09eh,0a4h,09eh,0c1h	; 9d9b  ................
	defb 09eh,0fdh,09eh,071h,0a0h,0ddh,066h,026h,0ddh,06eh,027h,0c3h,041h,09eh,021h,04fh	; 9dab  ...q..f&.n'.A.!O
	defb 0d4h,07eh,03dh,0c0h,036h,002h,0c9h,0cdh,0b9h,09dh,020h,007h,0ddh,036h,001h,00eh	; 9dbb  .~=.6..... ..6..
	defb 0c3h,066h,09eh,0ddh,056h,026h,0ddh,05eh,027h,0cdh,0e9h,09dh,030h,005h,0cdh,00bh	; 9dcb  .f..V&.^'...0...
	defb 090h,0b7h,0c9h,0ddh,066h,028h,0ddh,06eh,029h,0cdh,041h,09eh,037h,0c9h,0ddh,07eh	; 9ddb  ....f(.n).A.7..~
	defb 00ch,01fh,0ddh,046h,007h,0ddh,07eh,003h,038h,007h,0ddh,046h,009h,0ddh,07eh,005h	; 9deb  ...F..~.8..F..~.
	defb 053h,0cbh,010h,030h,003h,05fh,07ah,053h,0bah,0c9h,0cdh,0b9h,09dh,020h,010h,03ah	; 9dfb  S..0._zS..... .:
	defb 05fh,0cah,0a7h,03eh,00dh,028h,002h,03eh,001h,0ddh,077h,001h,0c3h,03bh,09eh,0ddh	; 9e0b  _..>.(.>..w.....
	defb 056h,028h,0ddh,05eh,029h,0cdh,0e9h,09dh,0dah,00bh,090h,0ddh,036h,00ch,000h,0ddh	; 9e1b  V(.^).......6...
	defb 036h,00eh,07fh,0c3h,07bh,0a2h,0cdh,0b9h,09dh,028h,005h,0ddh,035h,00eh,020h,016h	; 9e2b  6...{....(..5. .
	defb 0ddh,066h,026h,0ddh,06eh,027h,0cdh,0ach,090h,0cdh,08fh,090h,0a0h,0cdh,07ah,090h	; 9e3b  .f&.n'........z.
	defb 0cdh,025h,08eh,0c3h,07bh,0a2h,0ddh,07eh,00eh,0e6h,00fh,0c0h,0c3h,00dh,08fh,0ddh	; 9e4b  .%..{..~........
	defb 056h,026h,0ddh,05eh,027h,0cdh,0e9h,09dh,0dah,00bh,090h,0ddh,066h,024h,0ddh,06eh	; 9e5b  V&.^'.......f$.n
	defb 025h,0c3h,041h,09eh,0ddh,056h,024h,0ddh,05eh,025h,0cdh,0e9h,09dh,0dah,00bh,090h	; 9e6b  %.A..V$.^%......
	defb 0ddh,07eh,01eh,0cdh,025h,08eh,0ddh,07eh,024h,0ddh,077h,003h,0ddh,07eh,025h,0ddh	; 9e7b  .~..%..~$.w..~%.
	defb 077h,005h,0ddh,07eh,021h,0ddh,077h,001h,0ddh,07eh,023h,0ddh,077h,00ch,0c9h,0cdh	; 9e8b  w..~!.w..~#.w...
	defb 008h,09dh,0ddh,036h,01ch,020h,0c3h,07bh,0a2h,0ddh,035h,01ch,028h,009h,0ddh,07eh	; 9e9b  ...6. .{..5.(..~
	defb 01ch,0e6h,003h,0c0h,0c3h,04dh,09bh,0ddh,07eh,022h,0ddh,077h,00ch,0ddh,07eh,020h	; 9eab  .....M..~".w..~
	defb 0ddh,077h,001h,0c3h,00dh,09dh,0ddh,035h,00eh,0c0h,0ddh,036h,01bh,001h,0ddh,036h	; 9ebb  .w.....5...6...6
	defb 003h,0b4h,0ddh,036h,005h,070h,001h,007h,001h,03ah,076h,0cah,0feh,018h,028h,013h	; 9ecb  ...6.p...:v...(.
	defb 0cdh,000h,081h,0ddh,070h,00ah,0ddh,071h,00bh,0c2h,03ah,0a2h,0c5h,0cdh,0c0h,09fh	; 9edb  ....p..q..:.....
	defb 0c1h,018h,00ch,0ddh,070h,00ah,0ddh,071h,00bh,0cdh,000h,081h,0cch,053h,081h,0c3h	; 9eeb  ....p..q.....S..
	defb 03ah,0a2h,0ddh,036h,01bh,000h,0ddh,036h,003h,068h,0ddh,036h,005h,030h,0ddh,036h	; 9efb  :..6...6.h.6.0.6
	defb 00dh,002h,001h,009h,001h,03ah,076h,0cah,0feh,018h,028h,0c4h,0a7h,028h,0d4h,0ddh	; 9f0b  .....:v...(..(..
	defb 070h,00ah,0ddh,071h,00bh,018h,0d8h,001h,027h,009h,021h,000h,0d5h,0ddh,07eh,01bh	; 9f1b  p..q....'.!...~.
	defb 0a7h,020h,004h,016h,00bh,018h,041h,00ch,0ddh,07eh,000h,0b8h,0c0h,0ddh,07eh,00ah	; 9f2b  . ....A..~....~.
	defb 03dh,0c0h,0ddh,07eh,00bh,0feh,007h,0c0h,0ddh,07eh,003h,0feh,0b4h,038h,01eh,0afh	; 9f3b  =..~.....~...8..
	defb 0ddh,077h,00ch,0ddh,071h,001h,03ah,076h,0cah,0feh,018h,028h,009h,03ah,04bh,0cah	; 9f4b  .w..q.:v...(.:K.
	defb 0feh,004h,028h,03fh,0afh,0c9h,03ah,04bh,0cah,0a7h,028h,037h,0c9h,0f6h,001h,0c9h	; 9f5b  ..(?..:K..(7....
	defb 001h,022h,008h,021h,010h,0d5h,016h,00ch,0ddh,07eh,000h,0b8h,0c0h,0ddh,07eh,00ah	; 9f6b  .".!.....~....~.
	defb 03dh,0c0h,0ddh,07eh,00bh,0feh,009h,0c0h,0ddh,07eh,003h,0feh,064h,030h,0deh,0afh	; 9f7b  =..~.....~..d0..
	defb 0ddh,077h,00ch,0ddh,036h,00eh,008h,0ddh,071h,001h,0cdh,000h,081h,020h,00bh,07eh	; 9f8b  .w..6...q.... .~
	defb 0bah,020h,007h,03eh,009h,0cdh,03eh,042h,036h,001h,0afh,0c9h,0ddh,035h,00eh,0c0h	; 9f9b  . .>..>B6....5..
	defb 0ddh,036h,00eh,0c0h,0afh,032h,014h,0d5h,03ch,032h,041h,0d4h,0cdh,000h,081h,0cch	; 9fab  .6...2..<2A.....
	defb 0c0h,09fh,0c3h,07bh,0a2h,0ddh,07eh,02eh,0cdh,0d5h,09fh,0ddh,07eh,02fh,0cdh,0d5h	; 9fbb  ...{..~.....~/..
	defb 09fh,0ddh,07eh,030h,0cdh,0d5h,09fh,0ddh,07eh,031h,03dh,047h,011h,000h,0d4h,0cdh	; 9fcb  ..~0....~1=G....
	defb 043h,042h,0afh,012h,078h,087h,087h,021h,028h,0dch,0cdh,03eh,042h,036h,0e0h,0c9h	; 9fdb  CB..x..!(..>B6..
	defb 021h,019h,0d5h,0ddh,035h,00eh,0c0h,0ddh,036h,00eh,008h,0cdh,000h,081h,0c2h,07bh	; 9feb  !...5...6......{
	defb 0a2h,036h,001h,0c3h,07bh	; 9ffb
