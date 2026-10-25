; ==========================================================================
; METAL GEAR 2 SOLID SNAKE - Konami (1990) - MSX2 - MegaROM RC-767 de 512 KB (Konami SCC) - banco 01 (se ejecuta en 0x6000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x06000


; ======================================================================
; CODIGO 0x6000..0x61c0  (448 bytes)
; ======================================================================


L_6000:
	and 080h		;6000
	or c			;6002
	ld c,a			;6003
	inc hl			;6004
	inc hl			;6005
	inc hl			;6006
	inc hl			;6007
	ld a,(hl)			;6008
	and 00ch		;6009
	or c			;600b
	ld h,080h		;600c
	jp 00024h		;600e   ; BIOS ENASLT - Switches to specified slot and page definitively
L_6011:
	call 00138h		;6011   ; BIOS RSLREG - Reads the primary slot register
	rrca			;6014
	rrca			;6015
	and 003h		;6016
	ld c,a			;6018
	ld b,000h		;6019
	ld hl,0fcc1h		;601b
	add hl,bc			;601e
	or (hl)			;601f
	ld c,a			;6020
	inc hl			;6021
	inc hl			;6022
	inc hl			;6023
	inc hl			;6024
	ld a,(hl)			;6025
	and 00ch		;6026
	or c			;6028
	ld (0c399h),a		;6029
	ret			;602c
L_602D:
	ld hl,0ad5ah		;602d
	ld (0f323h),hl		;6030
	ld a,(0c386h)		;6033
	ld h,080h		;6036
	call 00024h		;6038   ; BIOS ENASLT - Switches to specified slot and page definitively
	di			;603b
	ld a,(0c38ah)		;603c
	inc a			;603f
	ld bc,002ffh		;6040
	jr nz,L_6048		;6043
	ld bc,01680h		;6045
L_6048:
	ld hl,0dd00h		;6048
	ld de,09600h		;604b
	ldir		;604e
	ld a,(0c388h)		;6050
	jp 0013bh		;6053   ; BIOS WSLREG - Writes value to the primary slot register
L_6056:
	ld hl,0ca40h		;6056
	ld bc,026bfh		;6059
	call 04236h		;605c
L_605F:
	ld a,020h		;605f
	ld hl,0ca52h		;6061
	ld (hl),a			;6064
	inc l			;6065
	ld (hl),a			;6066
	ld hl,0cac4h		;6067
	ld (hl),a			;606a
	inc l			;606b
	ld (hl),a			;606c
	ld hl,0ca54h		;606d
	ld (hl),a			;6070
	inc l			;6071
	ld (hl),a			;6072
	ret			;6073
L_6074:
	ld a,(0ca42h)		;6074
L_6077:
	ld d,a			;6077
	xor a			;6078
	ld hl,000c0h		;6079
	ld bc,0e014h		;607c
	jp 046ffh		;607f
L_6082:
	ld hl,08000h		;6082
	call 043fch		;6085
	call 043f6h		;6088
L_608B:
	ld a,(hl)			;608b
	cp 0ffh		;608c
	ret z			;608e
	cp 0feh		;608f
	jr nz,L_609A		;6091
	inc hl			;6093
	inc hl			;6094
	inc hl			;6095
	inc hl			;6096
	inc hl			;6097
	jr L_608B		;6098
L_609A:
	call L_60C4		;609a
	ld a,(0ca9ch)		;609d
	or a			;60a0
	jr z,L_608B		;60a1
L_60A3:
	ld a,(hl)			;60a3
	inc hl			;60a4
	ld (0d7b9h),hl		;60a5
	or a			;60a8
	jr z,L_60B4		;60a9
	dec a			;60ab
	jp z,L_6142		;60ac
	xor a			;60af
	ld (0ca9ch),a		;60b0
	ret			;60b3
L_60B4:
	ld a,(hl)			;60b4
	inc hl			;60b5
	ld h,(hl)			;60b6
	ld l,a			;60b7
	or h			;60b8
	jr z,L_60BF		;60b9
	ld (0d7b7h),hl		;60bb
	ret			;60be
L_60BF:
	xor a			;60bf
	ld (0ca9ch),a		;60c0
	ret			;60c3
L_60C4:
	push hl			;60c4
	call L_6104		;60c5
	pop de			;60c8
	ld a,(de)			;60c9
	bit 7,a		;60ca
	jr z,L_60F8		;60cc
	ld d,h			;60ce
	ld e,l			;60cf
	jr nc,L_60F1		;60d0
	ld a,(hl)			;60d2
	cp 014h		;60d3
	jr nc,L_60E7		;60d5
	ld a,(0ca4ah)		;60d7
	cp (hl)			;60da
	jr nz,L_60F1		;60db
	inc hl			;60dd
	ld a,(0ca4bh)		;60de
	cp (hl)			;60e1
	jr nz,L_60F1		;60e2
	inc hl			;60e4
	jr L_60FE		;60e5
L_60E7:
	inc hl			;60e7
	ld a,(0ca76h)		;60e8
	cp (hl)			;60eb
	jr nz,L_60F1		;60ec
	inc hl			;60ee
	jr L_60FE		;60ef
L_60F1:
	inc de			;60f1
	inc de			;60f2
	inc de			;60f3
	inc de			;60f4
	inc de			;60f5
	ex de,hl			;60f6
	ret			;60f7
L_60F8:
	jr c,L_60FE		;60f8
	inc hl			;60fa
	inc hl			;60fb
	inc hl			;60fc
	ret			;60fd
L_60FE:
	ld a,001h		;60fe
	ld (0ca9ch),a		;6100
	ret			;6103
L_6104:
	ld a,(hl)			;6104
	and 00fh		;6105
	ld b,a			;6107
	ld a,(hl)			;6108
	inc hl			;6109
	bit 4,a		;610a
	jr nz,L_6124		;610c
	ld a,b			;610e
	or a			;610f
	jr nz,L_6114		;6110
	scf			;6112
	ret			;6113
L_6114:
	ld a,(hl)			;6114
	call L_6134		;6115
	jr z,L_611F		;6118
	inc hl			;611a
	djnz L_6114		;611b
	scf			;611d
	ret			;611e
L_611F:
	inc hl			;611f
	djnz L_611F		;6120
	and a			;6122
	ret			;6123
L_6124:
	ld a,(hl)			;6124
	call L_6134		;6125
	jr nz,L_612F		;6128
	inc hl			;612a
	djnz L_6124		;612b
	and a			;612d
	ret			;612e
L_612F:
	inc hl			;612f
	djnz L_611F		;6130
	scf			;6132
	ret			;6133
L_6134:
	push bc			;6134
	push hl			;6135
	call 040f0h		;6136
	call 0b0f6h		;6139
	call 0411dh		;613c
	pop hl			;613f
	pop bc			;6140
	ret			;6141
L_6142:
	ld a,(hl)			;6142
	inc hl			;6143
	ld h,(hl)			;6144
	ld l,a			;6145
	ld a,(hl)			;6146
	push af			;6147
	inc hl			;6148
	ld e,l			;6149
	ld d,h			;614a
	add a,a			;614b
	ld c,a			;614c
	ld b,000h		;614d
	add hl,bc			;614f
	pop bc			;6150
	push bc			;6151
	call L_6172		;6152
	pop bc			;6155
	ld c,b			;6156
L_6157:
	dec b			;6157
	cp (hl)			;6158
	jr c,L_6166		;6159
	inc hl			;615b
	ld (0d8e5h),a		;615c
	ld a,b			;615f
	or a			;6160
	ld a,(0d8e5h)		;6161
	jr nz,L_6157		;6164
L_6166:
	ld a,c			;6166
	sub b			;6167
	dec a			;6168
	add a,a			;6169
	ld h,d			;616a
	ld l,e			;616b
	call 0423eh		;616c
	jp L_60B4		;616f
L_6172:
	ld a,r		;6172
	ld c,a			;6174
	ld a,(0ca03h)		;6175
	xor c			;6178
	rlca			;6179
	rlca			;617a
	rlca			;617b
	cp 064h		;617c
	ret c			;617e
	sub 064h		;617f
	ret			;6181
L_6182:
	ld hl,(0d7b9h)		;6182
	call 0411dh		;6185
	call L_61A6		;6188
	call 041c2h		;618b
	jr nc,L_61A1		;618e
	call 0411dh		;6190
	ld a,(hl)			;6193
	ld (0d7b6h),a		;6194
	inc hl			;6197
	call L_60A3		;6198
	call 041c2h		;619b
	jp 0ba96h		;619e
L_61A1:
	call 0ba96h		;61a1
	inc (hl)			;61a4
	ret			;61a5
L_61A6:
	inc hl			;61a6
	inc hl			;61a7
	ld a,(hl)			;61a8
	cp 0ffh		;61a9
	jr z,L_61B4		;61ab
	cp 0feh		;61ad
	jr nz,L_61B4		;61af
	inc hl			;61b1
	scf			;61b2
	ret			;61b3
L_61B4:
	and a			;61b4
	ret			;61b5
L_61B6:
	ld a,(0ca97h)		;61b6
	or a			;61b9
	jp z,0411dh		;61ba
	jp 04122h		;61bd

; ----------------------------------------------------------------------
; DATOS sin identificar  0x61c0..0x61ce  (14 bytes)
DATA_61C0:
	defb 0cdh,0ceh,061h,0cdh,042h,041h,0c3h,0efh,041h,0cdh,0dch,061h,018h,0f5h	; 61c0  ..a.BA..A..a..

; ======================================================================
; CODIGO 0x61ce..0x61f8  (42 bytes)
; ======================================================================


L_61CE:
	ld a,001h		;61ce
	ld (0d8a8h),a		;61d0
	ex de,hl			;61d3
	push hl			;61d4
	call 040f0h		;61d5
	call 0b612h		;61d8
	pop de			;61db
	call 04122h		;61dc
	ld a,d			;61df
	ld hl,08000h		;61e0
	call 043fch		;61e3
	call 043f6h		;61e6
	call L_6504		;61e9
	call 0413fh		;61ec
	ld a,(ix+000h)		;61ef
	cp 002h		;61f2
	ret nz			;61f4
	jp 041cdh		;61f5

; ----------------------------------------------------------------------
; DATOS sin identificar  0x61f8..0x61fe  (6 bytes)
DATA_61F8:
	defb 0cdh,047h,062h,0c3h,0efh,041h	; 61f8

; ======================================================================
; CODIGO 0x61fe..0x6299  (155 bytes)
; ======================================================================


L_61FE:
	call L_658B		;61fe
	ld a,(0e220h)		;6201
	and a			;6204
	call 0413fh		;6205
	jp 041cdh		;6208
L_620B:
	call L_6247		;620b
	jp 041bdh		;620e
L_6211:
	ld a,001h		;6211
	ld (0d8a8h),a		;6213
	ld a,(0cb03h)		;6216
	cp 060h		;6219
	ld l,010h		;621b
	jr nc,L_6221		;621d
	ld l,090h		;621f
L_6221:
	call 040f0h		;6221
	push hl			;6224
	call 0b612h		;6225
	pop de			;6228
	call 04122h		;6229
	ld a,(ix+000h)		;622c
	cp 016h		;622f
	ld a,(ix+011h)		;6231
	jr nz,L_6238		;6234
	ld a,00fh		;6236
L_6238:
	ld hl,08002h		;6238
	call 043fch		;623b
	call 043f6h		;623e
	call L_6504		;6241
	jp 041b5h		;6244
L_6247:
	call L_658B		;6247
	ld a,(0e220h)		;624a
	and a			;624d
	jr L_6275		;624e
L_6250:
	cp 001h		;6250
	ld hl,08010h		;6252
	jr c,L_625F		;6255
	ld hl,08012h		;6257
	jr z,L_625F		;625a
	ld hl,08014h		;625c
L_625F:
	call 0411dh		;625f
	call 043fch		;6262
	call L_636D		;6265
	ld a,001h		;6268
	ld (0d7bbh),a		;626a
	call 08b1fh		;626d
	ld a,004h		;6270
	ld (0ca01h),a		;6272
L_6275:
	jp 0413fh		;6275
L_6278:
	ld hl,0cab5h		;6278
	inc (hl)			;627b
	ld hl,0ca52h		;627c
	ld a,(hl)			;627f
	add a,008h		;6280
	ld (hl),a			;6282
	ld hl,010c8h		;6283
	ld bc,06f08h		;6286
	ld a,(0ca42h)		;6289
	ld d,a			;628c
	xor a			;628d
	call 046ffh		;628e
	call 04288h		;6291
	call 042bch		;6294
	jr L_6275		;6297

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6299..0x62a5  (12 bytes)
DATA_6299:
	defb 021h,0e1h,0d8h,036h,070h,03eh,001h,032h,0e2h,0d8h,018h,010h	; 6299  !..6p>.2....

; ======================================================================
; CODIGO 0x62a5..0x650c  (615 bytes)
; ======================================================================


L_62A5:
	ld hl,0d8e1h		;62a5
	ld (hl),000h		;62a8
	ld a,001h		;62aa
	ld (0d8e2h),a		;62ac
	jr L_62B5		;62af
L_62B1:
	xor a			;62b1
	ld (0d8e2h),a		;62b2
L_62B5:
	ld a,d			;62b5
	call L_62EA		;62b6
	ld d,a			;62b9
	ld a,e			;62ba
	call L_62EA		;62bb
	push hl			;62be
	push de			;62bf
	push bc			;62c0
	ld hl,00000h		;62c1
	ld b,a			;62c4
	or a			;62c5
	jr z,L_62CE		;62c6
	ld de,00018h		;62c8
L_62CB:
	add hl,de			;62cb
	djnz L_62CB		;62cc
L_62CE:
	pop bc			;62ce
	pop de			;62cf
	ld e,d			;62d0
	ld d,000h		;62d1
	add hl,de			;62d3
	ld de,0dd00h		;62d4
	add hl,de			;62d7
	ld d,h			;62d8
	ld e,l			;62d9
	pop hl			;62da
L_62DB:
	push bc			;62db
	push de			;62dc
	call L_62F0		;62dd
	pop de			;62e0
	pop bc			;62e1
	ld a,018h		;62e2
	call 04243h		;62e4
	djnz L_62DB		;62e7
	ret			;62e9
L_62EA:
	rra			;62ea
	rra			;62eb
	rra			;62ec
	and 01fh		;62ed
	ret			;62ef
L_62F0:
	ld a,(0d8e2h)		;62f0
	or a			;62f3
	jr nz,L_62FB		;62f4
	ld b,000h		;62f6
	ldir		;62f8
	ret			;62fa
L_62FB:
	ld a,(hl)			;62fb
	ld (de),a			;62fc
	inc de			;62fd
	dec c			;62fe
	jr nz,L_62FB		;62ff
	ret			;6301
L_6302:
	call 0416ch		;6302
	call 043f6h		;6305
	ld a,(hl)			;6308
	add a,e			;6309
	ld e,a			;630a
	inc hl			;630b
	ld a,(hl)			;630c
	add a,d			;630d
	ld d,a			;630e
	inc hl			;630f
	ld b,(hl)			;6310
	inc hl			;6311
	ld c,(hl)			;6312
	inc hl			;6313
	ld a,(hl)			;6314
	inc hl			;6315
	ld h,(hl)			;6316
	ld l,a			;6317
	jr L_633D		;6318
L_631A:
	push af			;631a
	call 04122h		;631b
	call L_6340		;631e
	ld hl,08006h		;6321
	call 043fch		;6324
	push de			;6327
	call 04950h		;6328
	pop de			;632b
	ld a,e			;632c
	sub 008h		;632d
	ld e,a			;632f
	pop af			;6330
	ld hl,0800ah		;6331
	call 043fch		;6334
	call 043f6h		;6337
	call 04950h		;633a
L_633D:
	jp 040f0h		;633d
L_6340:
	ld de,03818h		;6340
	ld a,(0cb03h)		;6343
	cp 070h		;6346
	ret nc			;6348
	ld e,0a8h		;6349
	ret			;634b
L_634C:
	call 04122h		;634c
	call L_6340		;634f
	ld a,e			;6352
	sub 008h		;6353
	ld e,a			;6355
	ld hl,08008h		;6356
	call 043fch		;6359
	call 04950h		;635c
	jr L_633D		;635f
L_6361:
	call 0411dh		;6361
	ld hl,0800eh		;6364
	call 043fch		;6367
	call 040f0h		;636a
L_636D:
	xor a			;636d
	ld (0ca9ch),a		;636e
	call 0411dh		;6371
	call L_608B		;6374
	jr L_633D		;6377
L_6379:
	ld a,(0ca97h)		;6379
	or a			;637c
	jp z,0411dh		;637d
	jp 04122h		;6380
L_6383:
	call 0411dh		;6383
	push hl			;6386
	pop bc			;6387
	exx			;6388
	ld b,000h		;6389
	exx			;638b
	ld hl,0800ch		;638c
	call 043fch		;638f
L_6392:
	ld e,(hl)			;6392
	inc hl			;6393
	ld d,(hl)			;6394
	ld a,c			;6395
	cp e			;6396
	jr nz,L_63A3		;6397
	ld a,b			;6399
	cp d			;639a
	jr nz,L_63A3		;639b
	exx			;639d
	ld a,b			;639e
	exx			;639f
	scf			;63a0
	jr L_63C6		;63a1
L_63A3:
	inc hl			;63a3
	exx			;63a4
	inc b			;63a5
	ld a,b			;63a6
	exx			;63a7
	cp 024h		;63a8
	jr nz,L_6392		;63aa
	and a			;63ac
	jr L_63C6		;63ad
L_63AF:
	call L_6379		;63af
	inc hl			;63b2
	ld a,(hl)			;63b3
	jr L_63C6		;63b4
L_63B6:
	call L_61B6		;63b6
	ld hl,(0d7b7h)		;63b9
	inc hl			;63bc
	ld a,(hl)			;63bd
	jr L_63C6		;63be
L_63C0:
	call 0411dh		;63c0
	call L_6082		;63c3
L_63C6:
	jp 041c2h		;63c6
L_63C9:
	ld hl,08008h		;63c9
	jr L_63E0		;63cc
L_63CE:
	ld hl,08004h		;63ce
	jr L_63E0		;63d1
L_63D3:
	ld hl,08006h		;63d3
	jr L_63E0		;63d6
L_63D8:
	ld hl,0800ah		;63d8
	jr L_63E0		;63db
L_63DD:
	ld hl,08002h		;63dd
L_63E0:
	call 0411dh		;63e0
	call 043fch		;63e3
	call L_636D		;63e6
	jr L_63C6		;63e9
L_63EB:
	ld hl,0cc80h		;63eb
	ld bc,0007fh		;63ee
	call 04236h		;63f1
	ld hl,0cc00h		;63f4
	ld bc,0007fh		;63f7
	call 04236h		;63fa
	ld hl,0d760h		;63fd
	ld bc,0000fh		;6400
	jp 04236h		;6403
L_6406:
	push ix		;6406
	pop de			;6408
	ld a,006h		;6409
	jp 04243h		;640b
L_640E:
	call 041c2h		;640e
	call L_63C9		;6411
	ld a,001h		;6414
	ld (0d7bbh),a		;6416
	call 0b68eh		;6419
	ld a,004h		;641c
	ld (0ca01h),a		;641e
L_6421:
	jp 041d2h		;6421
L_6424:
	call 041adh		;6424
	call 0bb10h		;6427
	jr L_6421		;642a
L_642C:
	ld a,(0cb4bh)		;642c
	or a			;642f
	ret z			;6430
	ld a,(0cb3ch)		;6431
	or a			;6434
	ret nz			;6435
	ld hl,0cb4eh		;6436
	dec (hl)			;6439
	ret nz			;643a
	ld (hl),010h		;643b
	ld hl,0ca53h		;643d
	dec (hl)			;6440
	jr nz,L_645D		;6441
	ld hl,00140h		;6443
	ld (0cb63h),hl		;6446
	ld a,(0ca01h)		;6449
	or a			;644c
	jr nz,L_6459		;644d
	ld hl,0cb00h		;644f
	ld (hl),01ch		;6452
	call L_6BA0		;6454
	jr L_645D		;6457
L_6459:
	xor a			;6459
	ld (0ca40h),a		;645a
L_645D:
	jp 04288h		;645d
L_6460:
	call 0412ch		;6460
	ld de,000f0h		;6463
	ld bc,00112h		;6466
	call 05081h		;6469
L_646C:
	jp 04176h		;646c
L_646F:
	call 0412ch		;646f
	ld a,(hl)			;6472
	cp 0ffh		;6473
	jr L_646C		;6475
L_6477:
	ld bc,00201h		;6477
L_647A:
	call 04183h		;647a
	call 0507ah		;647d
	jr L_646C		;6480
L_6482:
	call 04183h		;6482
	ld a,(hl)			;6485
	jr L_646C		;6486
L_6488:
	ld a,(0cab5h)		;6488
	or a			;648b
	ret z			;648c
	ld b,a			;648d
	xor a			;648e
L_648F:
	add a,008h		;648f
	djnz L_648F		;6491
	add a,020h		;6493
	ld hl,0ca52h		;6495
	ld (hl),a			;6498
	inc hl			;6499
	ld (hl),a			;649a
	ret			;649b
L_649C:
	call 0418eh		;649c
	call 043f6h		;649f
	jp 041cah		;64a2
L_64A5:
	call 04122h		;64a5
	ld hl,08042h		;64a8
	call 043fch		;64ab
	ld a,(0d706h)		;64ae
	call 043f6h		;64b1
	jp 04176h		;64b4
L_64B7:
	call 04122h		;64b7
	call 043fch		;64ba
	call 04918h		;64bd
L_64C0:
	jp 041cah		;64c0
L_64C3:
	call 04122h		;64c3
	call 043fch		;64c6
	call 043f6h		;64c9
	ld de,00c94h		;64cc
	call 04950h		;64cf
	jr L_64C0		;64d2
L_64D4:
	call 041a0h		;64d4
	call 0a543h		;64d7
	jp 040f0h		;64da
L_64DD:
	ld de,01098h		;64dd
	ld b,004h		;64e0
	call L_6546		;64e2
	jp 04179h		;64e5
L_64E8:
	call 0411dh		;64e8
	ld hl,08016h		;64eb
	call 043fch		;64ee
	call 041c2h		;64f1
L_64F4:
	ld de,01098h		;64f4
	ld b,004h		;64f7
	call L_6546		;64f9
	jr L_6501		;64fc
L_64FE:
	call L_6504		;64fe
L_6501:
	jp 041c5h		;6501
L_6504:
	ld a,(0caa1h)		;6504
	add a,004h		;6507
	ld e,a			;6509
	jr $+13		;650a

; ----------------------------------------------------------------------
; DATOS sin identificar  0x650c..0x6517  (11 bytes)
DATA_650C:
	defb 03ah,003h,0cbh,0feh,080h,01eh,020h,030h,002h,01eh,080h	; 650c  :..... 0...

; ======================================================================
; CODIGO 0x6517..0x6597  (128 bytes)
; ======================================================================


L_6517:
	ld d,008h		;6517
	ld b,004h		;6519
	call L_6546		;651b
	ld a,d			;651e
	sub 004h		;651f
	ld h,a			;6521
	ld a,e			;6522
	sub 004h		;6523
	ld l,a			;6525
	ld a,(0d8a8h)		;6526
	and a			;6529
	ld bc,0b828h		;652a
	jr nz,L_6531		;652d
	ld b,0e0h		;652f
L_6531:
	ld a,(0ca42h)		;6531
	ld d,a			;6534
	ld a,099h		;6535
	push hl			;6537
	push bc			;6538
	call 046ffh		;6539
	pop de			;653c
	pop hl			;653d
	ld c,007h		;653e
	ld a,(0ca42h)		;6540
	jp 046bch		;6543
L_6546:
	call L_666A		;6546
	call L_654F		;6549
	jp 040f0h		;654c
L_654F:
	ld a,(hl)			;654f
	cp 004h		;6550
	inc hl			;6552
	jr c,L_6558		;6553
	dec hl			;6555
	ld a,004h		;6556
L_6558:
	ld (0e220h),a		;6558
	ld a,(hl)			;655b
	ld (0caa3h),a		;655c
	ld (0e225h),hl		;655f
	ld (0e229h),de		;6562
	ld (0e227h),de		;6566
	ld a,b			;656a
	ld (0e22bh),a		;656b
	xor a			;656e
	ld h,a			;656f
	ld l,a			;6570
	ld (0e223h),hl		;6571
	ld (0e221h),a		;6574
	ld (0e22dh),a		;6577
	inc a			;657a
	ld (0e222h),a		;657b
	ret			;657e
L_657F:
	call L_658B		;657f
	jp 041c5h		;6582
L_6585:
	call L_658B		;6585
	jp 04179h		;6588
L_658B:
	ld hl,0e220h		;658b
	ld a,(hl)			;658e
	and a			;658f
	ret z			;6590
	ld b,a			;6591
	inc l			;6592
	ld a,(hl)			;6593
	call 0424dh		;6594

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6597..0x65a1  (10 bytes)
DATA_6597:
	defb 0a1h,065h,0b4h,065h,0c7h,065h,05ah,066h,061h,066h	; 6597  .e.e.eZfaf

; ======================================================================
; CODIGO 0x65a1..0x65ae  (13 bytes)
; ======================================================================


L_65A1:
	call L_666A		;65a1
	ld a,b			;65a4
	ld hl,065aah		;65a5
	call 0424eh		;65a8
	jp 040f0h		;65ab

; ----------------------------------------------------------------------
; DATOS sin identificar  0x65ae..0x65b4  (6 bytes)
DATA_65AE:
	defb 098h,066h,0aah,066h,083h,066h	; 65ae

; ======================================================================
; CODIGO 0x65b4..0x6683  (207 bytes)
; ======================================================================


L_65B4:
	call L_65F8		;65b4
	ret c			;65b7
	ld de,(0e227h)		;65b8
	ld a,0e2h		;65bc
	call 05d18h		;65be
	ld a,038h		;65c1
	ld (0e228h),a		;65c3
	ret			;65c6
L_65C7:
	ld h,008h		;65c7
	ld a,(0d8a8h)		;65c9
	and a			;65cc
	ld b,0b0h		;65cd
	jr nz,L_65D3		;65cf
	ld b,0d8h		;65d1
L_65D3:
	call L_6604		;65d3
	ret c			;65d6
	call L_666A		;65d7
	ld de,(0e223h)		;65da
	ld hl,(0e225h)		;65de
	ld bc,0e220h		;65e1
	add hl,de			;65e4
	ld a,(hl)			;65e5
	call 040f0h		;65e6
	cp 004h		;65e9
	jr c,L_65F1		;65eb
	ld a,004h		;65ed
	ld (bc),a			;65ef
	ret			;65f0
L_65F1:
	ld (bc),a			;65f1
	inc de			;65f2
	ld (0e223h),de		;65f3
	ret			;65f7
L_65F8:
	ld h,030h		;65f8
	ld a,(0d8a8h)		;65fa
	and a			;65fd
	ld b,088h		;65fe
	jr nz,L_6604		;6600
	ld b,0b0h		;6602
L_6604:
	ld a,(0e229h)		;6604
	ld l,a			;6607
	ld a,(0ca09h)		;6608
	and 020h		;660b
	jr nz,L_6616		;660d
	ld a,(0ca07h)		;660f
	and 030h		;6612
	jr z,L_664A		;6614
L_6616:
	ex de,hl			;6616
	ld hl,0caddh		;6617
	ld a,(hl)			;661a
	dec a			;661b
	jr nz,L_661F		;661c
	inc (hl)			;661e
L_661F:
	ex de,hl			;661f
	ld (0e227h),hl		;6620
	ld a,(0e22bh)		;6623
	add a,a			;6626
	add a,a			;6627
	add a,a			;6628
	ld c,a			;6629
	ld a,(0e221h)		;662a
	cp 004h		;662d
	jr nz,L_6639		;662f
	ld a,h			;6631
	sub 028h		;6632
	ld h,a			;6634
	ld a,b			;6635
	add a,028h		;6636
	ld b,a			;6638
L_6639:
	ld a,(0ca42h)		;6639
	ld d,a			;663c
	ld a,099h		;663d
	call 046ffh		;663f
	xor a			;6642
	ld (0e221h),a		;6643
	ld (0e22dh),a		;6646
	ret			;6649
L_664A:
	ld a,(0ca03h)		;664a
	and 008h		;664d
	ld c,001h		;664f
	jr z,L_6655		;6651
	ld c,000h		;6653
L_6655:
	call L_6788		;6655
	scf			;6658
	ret			;6659
L_665A:
	ld hl,0e22ch		;665a
	dec (hl)			;665d
	ret nz			;665e
	jr L_6665		;665f
L_6661:
	call L_65F8		;6661
	ret c			;6664
L_6665:
	xor a			;6665
	ld (0e220h),a		;6666
	ret			;6669
L_666A:
	ld a,(0ca97h)		;666a
	or a			;666d
	jp nz,04122h		;666e
	ld a,(0caafh)		;6671
	or a			;6674
	jp nz,04122h		;6675
	ld a,(0ca01h)		;6678
	cp 004h		;667b
	jp z,0411dh		;667d
	jp 04122h		;6680

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6683..0x6788  (261 bytes)
DATA_6683:
	defb 021h,02dh,0e2h,07eh,0a7h,020h,03ah,03ah,007h,0cah,0e6h,030h,020h,004h,00eh,002h	; 6683  !-.~. ::...0 ...
	defb 018h,025h,036h,001h,0c9h,021h,02dh,0e2h,07eh,0a7h,020h,025h,03ah,007h,0cah,0e6h	; 6693  .%6..!-.~. %:...
	defb 030h,020h,0efh,00eh,001h,018h,010h,021h,02dh,0e2h,07eh,0a7h,020h,013h,03ah,007h	; 66a3  0 .....!-.~. .:.
	defb 0cah,0e6h,030h,020h,0ddh,00eh,004h,021h,022h,0e2h,07eh,0a7h,028h,003h,035h,0c0h	; 66b3  ..0 ...!".~.(.5.
	defb 071h,02ah,023h,0e2h,023h,022h,023h,0e2h,02bh,0edh,05bh,025h,0e2h,019h,07eh,0edh	; 66c3  q*#.#"#.+.[%..~.
	defb 05bh,027h,0e2h,047h,03ch,028h,074h,03ch,0cah,062h,067h,03ch,0cah,074h,067h,03ch	; 66d3  ['.G<(t<.bg<.tg<
	defb 0cah,0bdh,067h,03ch,0cah,0c2h,067h,078h,0d6h,076h,0feh,00ah,038h,029h,078h,0d6h	; 66e3  ..g<..gx.v..8)x.
	defb 0d4h,0feh,00ch,030h,004h,0c6h,00ah,018h,01eh,078h,0cdh,018h,05dh,079h,0a7h,028h	; 66f3  ...0.....x..]y.(
	defb 007h,02ah,023h,0e2h,023h,022h,023h,0e2h,021h,028h,0e2h,07eh,0c6h,008h,077h,03ah	; 6703  .*#.#"#.!(.~..w:
	defb 02dh,0e2h,0a7h,0c8h,0c3h,0c4h,066h,0cdh,022h,041h,0cdh,023h,067h,0c3h,06ah,066h	; 6713  -.....f."A.#g.jf
	defb 0f5h,078h,032h,0a3h,0cah,03eh,038h,032h,028h,0e2h,0f1h,016h,008h,021h,004h,080h	; 6723  .x2..>82(....!..
	defb 0cdh,0fch,043h,0cdh,0f6h,043h,07eh,047h,004h,028h,009h,0cdh,018h,05dh,07ah,0c6h	; 6733  ..C..C~G.(...]z.
	defb 008h,057h,018h,0f2h,016h,030h,03eh,0e2h,0c3h,018h,05dh,03eh,0e3h,0cdh,018h,05dh	; 6743  .W...0>...]>...]
	defb 03eh,01eh,032h,02ch,0e2h,03eh,003h,032h,021h,0e2h,0afh,032h,0a3h,0cah,0c9h,021h	; 6753  >.2,.>.2!..2...!
	defb 027h,0e2h,07eh,0c6h,008h,077h,023h,036h,038h,03ah,02dh,0e2h,0a7h,0c8h,0c3h,0c4h	; 6763  '.~..w#68:-.....
	defb 066h,03eh,030h,032h,028h,0e2h,03eh,0e3h,0cdh,018h,05dh,00eh,001h,0cdh,088h,067h	; 6773  f>02(.>...]....g
	defb 021h,021h,0e2h,034h,0c9h	; 6783

; ======================================================================
; CODIGO 0x6788..0x67bd  (53 bytes)
; ======================================================================


L_6788:
	ld a,(0e22bh)		;6788
	dec a			;678b
	add a,a			;678c
	add a,a			;678d
	add a,a			;678e
	ld b,a			;678f
	ld a,(0e229h)		;6790
	add a,b			;6793
	ld e,a			;6794
	ld a,(0d8a8h)		;6795
	and a			;6798
	ld d,0b0h		;6799
	jr nz,L_679F		;679b
	ld d,0d8h		;679d
L_679F:
	ld a,c			;679f
	and a			;67a0
	jr z,L_67A8		;67a1
	ld a,0ech		;67a3
	jp 05d18h		;67a5
L_67A8:
	ex de,hl			;67a8
	ld bc,00808h		;67a9
	ld a,(0ca42h)		;67ac
	ld d,a			;67af
	ld a,(0caafh)		;67b0
	or a			;67b3
	ld a,099h		;67b4
	jp z,046ffh		;67b6
	xor a			;67b9
	jp 046ffh		;67ba

; ----------------------------------------------------------------------
; DATOS sin identificar  0x67bd..0x67cd  (16 bytes)
DATA_67BD:
	defb 0cdh,079h,067h,034h,0c9h,0cdh,079h,067h,036h,004h,03eh,001h,032h,0ddh,0cah,0c9h	; 67bd  .yg4..yg6.>.2...

; ======================================================================
; CODIGO 0x67cd..0x6a87  (698 bytes)
; ======================================================================


L_67CD:
	ld hl,(0ca0ch)		;67cd
	bit 2,h		;67d0
	ld hl,0f600h		;67d2
	ld de,0f400h		;67d5
	ld bc,0e705h		;67d8
	jr z,L_67E5		;67db
	ld hl,0f200h		;67dd
	ld de,0f000h		;67e0
	ld b,0efh		;67e3
L_67E5:
	ld (0ca0eh),hl		;67e5
	ld (0ca0ch),de		;67e8
	jp 04522h		;67ec
L_67EF:
	call L_67F5		;67ef
	jp 041f7h		;67f2
L_67F5:
	call L_69DA		;67f5
	ld a,(0caa0h)		;67f8
	or a			;67fb
	jr z,L_680E		;67fc
	ld a,(0e040h)		;67fe
	cp 009h		;6801
	jr z,L_680E		;6803
	call 041d5h		;6805
	call 0b67dh		;6808
	jp 040f0h		;680b
L_680E:
	ld a,(0cb4bh)		;680e
	or a			;6811
	jp nz,L_68B1		;6812
	ld a,(0ca67h)		;6815
	and a			;6818
	jp nz,L_6954		;6819
	ld a,(0d8aah)		;681c
	cp 002h		;681f
	jp z,L_6954		;6821
	and a			;6824
	jp nz,L_693F		;6825
	ld a,(0ca4ah)		;6828
	ld b,a			;682b
	cp 00fh		;682c
	jp z,L_6993		;682e
	ld a,(0d8aeh)		;6831
	and a			;6834
	jp nz,L_68BE		;6835
	ld a,(0ca5fh)		;6838
	and a			;683b
	jr nz,L_684E		;683c
	ld a,(0ca50h)		;683e
	ld c,a			;6841
	cp 007h		;6842
	jr nz,L_684E		;6844
	ld a,c			;6846
	sub 009h		;6847
	cp 002h		;6849
	jp c,L_699D		;684b
L_684E:
	ld a,b			;684e
	cp 013h		;684f
	jr nz,L_6859		;6851
	ld a,c			;6853
	cp 004h		;6854
	jp z,L_6935		;6856
L_6859:
	ld hl,0ca0bh		;6859
	ld a,(hl)			;685c
	add a,068h		;685d
	and 078h		;685f
	ld (hl),a			;6861
	ld a,(00007h)		;6862
	ld c,a			;6865
	ld hl,(0ca0ch)		;6866
	xor a			;6869
	call 044e2h		;686a
	ld a,(0ca0bh)		;686d
	ld d,010h		;6870
	add a,a			;6872
L_6873:
	ld h,06dh		;6873
	ld l,a			;6875
	add hl,hl			;6876
	ld b,020h		;6877
	otir		;6879
	add a,090h		;687b
	dec d			;687d
	jr nz,L_6873		;687e
	ld a,(0ca1ch)		;6880
	and a			;6883
	ld e,000h		;6884
	jr z,L_688C		;6886
	ld a,(0d8a5h)		;6888
	ld e,a			;688b
L_688C:
	ld a,(0ca0bh)		;688c
	ld d,010h		;688f
	ld h,0dch		;6891
L_6893:
	ld b,008h		;6893
	ld l,a			;6895
	ex af,af'			;6896
L_6897:
	ld a,l			;6897
	and 003h		;6898
	ld a,(hl)			;689a
	jr nz,L_68A3		;689b
	add a,e			;689d
	cp 0d8h		;689e
	jr nz,L_68A3		;68a0
	inc a			;68a2
L_68A3:
	out (c),a		;68a3
	inc l			;68a5
	djnz L_6897		;68a6
	ex af,af'			;68a8
	add a,048h		;68a9
	and 078h		;68ab
	dec d			;68ad
	jr nz,L_6893		;68ae
	ret			;68b0
L_68B1:
	ld a,(0cb0eh)		;68b1
	dec a			;68b4
	jr z,L_68F5		;68b5
	ld a,(0ca1ch)		;68b7
	or a			;68ba
	jp z,04f97h		;68bb
L_68BE:
	ld hl,0da00h		;68be
	ld bc,00200h		;68c1
	call L_69D2		;68c4
	ld a,(00007h)		;68c7
	ld c,a			;68ca
	ld hl,(0ca0eh)		;68cb
	xor a			;68ce
	call 044e2h		;68cf
	ld hl,0dc00h		;68d2
	ld b,080h		;68d5
	ld a,(0ca1ch)		;68d7
	ld e,000h		;68da
	and a			;68dc
	jr z,L_68E3		;68dd
	ld a,(0d8a5h)		;68df
	ld e,a			;68e2
L_68E3:
	ld a,b			;68e3
	and 003h		;68e4
	ld a,(hl)			;68e6
	jr nz,L_68EF		;68e7
	add a,e			;68e9
	cp 0d8h		;68ea
	jr nz,L_68EF		;68ec
	inc a			;68ee
L_68EF:
	out (c),a		;68ef
	inc hl			;68f1
	djnz L_68E3		;68f2
	ret			;68f4
L_68F5:
	ld hl,0da80h		;68f5
	ld bc,00180h		;68f8
	call L_69D2		;68fb
	ld hl,(0ca0ch)		;68fe
	ld de,00180h		;6901
	add hl,de			;6904
	ex de,hl			;6905
	ld hl,0da00h		;6906
	ld bc,00080h		;6909
	call L_69D6		;690c
	ld a,(00007h)		;690f
	ld c,a			;6912
	ld hl,(0ca0eh)		;6913
	xor a			;6916
	call 044e2h		;6917
	ld a,(0ca1ch)		;691a
	or a			;691d
	ld e,000h		;691e
	jr z,L_6926		;6920
	ld a,(0d8a5h)		;6922
	ld e,a			;6925
L_6926:
	ld hl,0dc20h		;6926
	ld b,060h		;6929
	call L_68E3		;692b
	ld hl,0dc00h		;692e
	ld b,020h		;6931
	jr L_68E3		;6933
L_6935:
	ld a,(0cb0eh)		;6935
	cp 002h		;6938
	jp z,04f97h		;693a
	jr L_6954		;693d
L_693F:
	ld a,(0ca4bh)		;693f
	cp 002h		;6942
	jp nz,04f97h		;6944
	ld a,(0cb03h)		;6947
	ld b,a			;694a
	ld a,(0d823h)		;694b
	cp b			;694e
	jp c,04f97h		;694f
	jr L_6954		;6952
L_6954:
	ld hl,0dbe0h		;6954
	ld de,(0ca0ch)		;6957
	ld b,010h		;695b
L_695D:
	push bc			;695d
	ld bc,00020h		;695e
	push bc			;6961
	push hl			;6962
	call L_69D6		;6963
	pop hl			;6966
	pop bc			;6967
	or a			;6968
	sbc hl,bc		;6969
	ld a,020h		;696b
	call 04243h		;696d
	pop bc			;6970
	djnz L_695D		;6971
	ld hl,0dc78h		;6973
	ld de,(0ca0eh)		;6976
	ld b,010h		;697a
L_697C:
	push bc			;697c
	ld bc,00008h		;697d
	push bc			;6980
	push hl			;6981
	call L_69D6		;6982
	pop hl			;6985
	pop bc			;6986
	or a			;6987
	sbc hl,bc		;6988
	ld a,008h		;698a
	call 04243h		;698c
	pop bc			;698f
	djnz L_697C		;6990
	ret			;6992
L_6993:
	ld a,(0ce2eh)		;6993
	ld b,a			;6996
	ld a,(0ce6eh)		;6997
	cp b			;699a
	jr c,L_6954		;699b
L_699D:
	ld hl,0daa0h		;699d
	ld bc,00160h		;69a0
	push bc			;69a3
	call L_69D2		;69a4
	pop bc			;69a7
	ld hl,(0ca0ch)		;69a8
	add hl,bc			;69ab
	ex de,hl			;69ac
	ld hl,0da00h		;69ad
	ld bc,000a0h		;69b0
	call L_69D6		;69b3
	ld hl,0dc28h		;69b6
	ld de,(0ca0eh)		;69b9
	ld bc,00058h		;69bd
	push bc			;69c0
	call L_69D6		;69c1
	pop bc			;69c4
	ld hl,(0ca0eh)		;69c5
	add hl,bc			;69c8
	ex de,hl			;69c9
	ld hl,0dc00h		;69ca
	ld bc,00028h		;69cd
	jr L_69D6		;69d0
L_69D2:
	ld de,(0ca0ch)		;69d2
L_69D6:
	xor a			;69d6
	jp 04486h		;69d7
L_69DA:
	ld a,(0ca4ah)		;69da
	cp 012h		;69dd
	ret nz			;69df
	ld a,(0d881h)		;69e0
	inc a			;69e3
	ret z			;69e4
	ld hl,0dc00h		;69e5
	ld bc,02000h		;69e8
L_69EB:
	push bc			;69eb
	push hl			;69ec
	ld a,(hl)			;69ed
	cp 0e0h		;69ee
	jr nz,L_6A03		;69f0
	ld l,c			;69f2
	ld h,000h		;69f3
	add hl,hl			;69f5
	add hl,hl			;69f6
	add hl,hl			;69f7
	add hl,hl			;69f8
	ld de,0da00h		;69f9
	add hl,de			;69fc
	ld bc,0000fh		;69fd
	call 04236h		;6a00
L_6A03:
	pop hl			;6a03
	inc hl			;6a04
	inc hl			;6a05
	inc hl			;6a06
	inc hl			;6a07
	pop bc			;6a08
	inc c			;6a09
	djnz L_69EB		;6a0a
	ret			;6a0c
L_6A0D:
	ld a,001h		;6a0d
	jr L_6A68		;6a0f
L_6A11:
	ld a,007h		;6a11
	jr L_6A68		;6a13
L_6A15:
	ld a,009h		;6a15
	jr L_6A68		;6a17
L_6A19:
	ld a,00ah		;6a19
	jr L_6A68		;6a1b
L_6A1D:
	ld a,00bh		;6a1d
	jr L_6A68		;6a1f
L_6A21:
	ld a,00ch		;6a21
	jr L_6A68		;6a23
L_6A25:
	ld a,00dh		;6a25
	jr L_6A68		;6a27
L_6A29:
	ld a,00eh		;6a29
	jr L_6A68		;6a2b
L_6A2D:
	ld a,00fh		;6a2d
	jr L_6A68		;6a2f
L_6A31:
	call L_6CDA		;6a31
	ld a,08eh		;6a34
	jr L_6A68		;6a36
L_6A38:
	ld a,010h		;6a38
	jr L_6A68		;6a3a
L_6A3C:
	ld a,012h		;6a3c
	jr L_6A68		;6a3e
L_6A40:
	ld a,013h		;6a40
	jr L_6A68		;6a42
L_6A44:
	ld a,014h		;6a44
	jr L_6A68		;6a46
L_6A48:
	ld a,015h		;6a48
	jr L_6A68		;6a4a
L_6A4C:
	ld a,016h		;6a4c
	jr L_6A68		;6a4e
L_6A50:
	ld a,017h		;6a50
	jr L_6A68		;6a52
L_6A54:
	ld a,018h		;6a54
	jr L_6A68		;6a56
L_6A58:
	ld a,019h		;6a58
	jr L_6A68		;6a5a
L_6A5C:
	ld a,01ah		;6a5c
	jr L_6A68		;6a5e
L_6A60:
	ld a,01bh		;6a60
	jr L_6A68		;6a62
L_6A64:
	ld a,01ch		;6a64
	jr L_6A68		;6a66
L_6A68:
	jp 0c340h		;6a68
L_6A6B:
	ld a,004h		;6a6b
	jr L_6A68		;6a6d
L_6A6F:
	ld a,01dh		;6a6f
	jr L_6A68		;6a71
L_6A73:
	ld a,01eh		;6a73
	jr L_6A68		;6a75
L_6A77:
	ld a,01fh		;6a77
	jr L_6A68		;6a79
L_6A7B:
	ld a,020h		;6a7b
	jr L_6A68		;6a7d
L_6A7F:
	ld a,021h		;6a7f
	jr L_6A68		;6a81
L_6A83:
	ld a,022h		;6a83
	jr L_6A68		;6a85

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6a87..0x6a8b  (4 bytes)
DATA_6A87:
	defb 03eh,023h,018h,0ddh	; 6a87

; ======================================================================
; CODIGO 0x6a8b..0x6ad2  (71 bytes)
; ======================================================================


L_6A8B:
	ld a,024h		;6a8b
	jr $-37		;6a8d
L_6A8F:
	ld a,025h		;6a8f
	jr $-41		;6a91
L_6A93:
	ld a,026h		;6a93
	jr $-45		;6a95
L_6A97:
	ld a,027h		;6a97
	jr $-49		;6a99
L_6A9B:
	ld a,028h		;6a9b
	jr $-53		;6a9d
L_6A9F:
	ld a,029h		;6a9f
	jr $-57		;6aa1
L_6AA3:
	ld a,02ah		;6aa3
	jr $-61		;6aa5
L_6AA7:
	ld a,02bh		;6aa7
	jr $-65		;6aa9
L_6AAB:
	ld a,02ch		;6aab
	jr $-69		;6aad
L_6AAF:
	ld a,02dh		;6aaf
	jr $-73		;6ab1
L_6AB3:
	ld a,02eh		;6ab3
	jr $-77		;6ab5
L_6AB7:
	ld a,02fh		;6ab7
	jr $-81		;6ab9
L_6ABB:
	ld a,030h		;6abb
	jr $-85		;6abd
L_6ABF:
	call L_6CDA		;6abf
	ld a,082h		;6ac2
	jr $-92		;6ac4
L_6AC6:
	ld a,031h		;6ac6
	jr $-96		;6ac8
L_6ACA:
	ld a,047h		;6aca
	jr $-100		;6acc
L_6ACE:
	ld a,044h		;6ace
	jr $-104		;6ad0

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6ad2..0x6ad6  (4 bytes)
DATA_6AD2:
	defb 03eh,08fh,018h,092h	; 6ad2

; ======================================================================
; CODIGO 0x6ad6..0x6ada  (4 bytes)
; ======================================================================


L_6AD6:
	ld a,090h		;6ad6
	jr $+90		;6ad8

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6ada..0x6ade  (4 bytes)
DATA_6ADA:
	defb 03eh,032h,018h,054h	; 6ada

; ======================================================================
; CODIGO 0x6ade..0x6af2  (20 bytes)
; ======================================================================


L_6ADE:
	ld a,033h		;6ade
	jr $+82		;6ae0
L_6AE2:
	ld a,085h		;6ae2
	jr $+78		;6ae4
L_6AE6:
	ld a,034h		;6ae6
	jr $+74		;6ae8
L_6AEA:
	ld a,035h		;6aea
	jr $+70		;6aec
L_6AEE:
	ld a,091h		;6aee
	jr $+66		;6af0

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6af2..0x6af6  (4 bytes)
DATA_6AF2:
	defb 03eh,036h,018h,03ch	; 6af2

; ======================================================================
; CODIGO 0x6af6..0x6b02  (12 bytes)
; ======================================================================


L_6AF6:
	ld a,038h		;6af6
	jr $+58		;6af8
L_6AFA:
	ld a,039h		;6afa
	jr $+54		;6afc
L_6AFE:
	ld a,03ah		;6afe
	jr $+50		;6b00

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6b02..0x6b06  (4 bytes)
DATA_6B02:
	defb 03eh,03bh,018h,02ch	; 6b02

; ======================================================================
; CODIGO 0x6b06..0x6b22  (28 bytes)
; ======================================================================


L_6B06:
	ld a,03ch		;6b06
	jr $+42		;6b08
L_6B0A:
	ld a,03dh		;6b0a
	jr $+38		;6b0c
L_6B0E:
	ld a,03eh		;6b0e
	jr $+34		;6b10
L_6B12:
	ld a,005h		;6b12
	jr $+30		;6b14
L_6B16:
	ld a,040h		;6b16
	jr $+26		;6b18
L_6B1A:
	ld a,041h		;6b1a
	jr $+22		;6b1c
L_6B1E:
	ld a,06ah		;6b1e
	jr $+18		;6b20

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6b22..0x6b32  (16 bytes)
DATA_6B22:
	defb 03eh,06bh,018h,00ch,03eh,06ch,018h,008h,03eh,06dh,018h,004h,03eh,06eh,018h,000h	; 6b22  >k..>l..>m..>n..

; ======================================================================
; CODIGO 0x6b32..0x6b35  (3 bytes)
; ======================================================================


L_6B32:
	jp 0c340h		;6b32

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6b35..0x6b41  (12 bytes)
DATA_6B35:
	defb 03eh,06fh,018h,0f9h,03eh,070h,018h,0f5h,03eh,071h,018h,0f1h	; 6b35  >o..>p..>q..

; ======================================================================
; CODIGO 0x6b41..0x6b4d  (12 bytes)
; ======================================================================


L_6B41:
	ld a,072h		;6b41
	jr $-17		;6b43
L_6B45:
	ld a,073h		;6b45
	jr $-21		;6b47
L_6B49:
	ld a,056h		;6b49
	jr $-25		;6b4b

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6b4d..0x6b55  (8 bytes)
DATA_6B4D:
	defb 03eh,057h,018h,0e1h,03eh,058h,018h,0ddh	; 6b4d  >W..>X..

; ======================================================================
; CODIGO 0x6b55..0x6b61  (12 bytes)
; ======================================================================


L_6B55:
	ld a,059h		;6b55
	jr $-37		;6b57
L_6B59:
	ld a,05ah		;6b59
	jr $-41		;6b5b
L_6B5D:
	ld a,05bh		;6b5d
	jr $-45		;6b5f

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6b61..0x6b69  (8 bytes)
DATA_6B61:
	defb 03eh,074h,018h,0cdh,03eh,075h,018h,0c9h	; 6b61  >t..>u..

; ======================================================================
; CODIGO 0x6b69..0x6b81  (24 bytes)
; ======================================================================


L_6B69:
	ld a,076h		;6b69
	jr $-57		;6b6b
L_6B6D:
	ld a,077h		;6b6d
	jr $-61		;6b6f
L_6B71:
	ld a,078h		;6b71
	jr $-65		;6b73
L_6B75:
	ld a,0a1h		;6b75
	jr $-69		;6b77
L_6B79:
	ld a,07ah		;6b79
	jr $-73		;6b7b
L_6B7D:
	ld a,07bh		;6b7d
	jr $-77		;6b7f

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6b81..0x6b85  (4 bytes)
DATA_6B81:
	defb 03eh,07ch,018h,0adh	; 6b81

; ======================================================================
; CODIGO 0x6b85..0x6b89  (4 bytes)
; ======================================================================


L_6B85:
	ld a,07dh		;6b85
	jr $-85		;6b87

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6b89..0x6b95  (12 bytes)
DATA_6B89:
	defb 03eh,07eh,018h,0a5h,03eh,07fh,018h,0a1h,03eh,080h,018h,09dh	; 6b89  >~..>...>...

; ======================================================================
; CODIGO 0x6b95..0x6bf0  (91 bytes)
; ======================================================================


L_6B95:
	ld a,081h		;6b95
	jr $-101		;6b97
L_6B99:
	call L_6CDA		;6b99
	ld a,08ch		;6b9c
	jr $-108		;6b9e
L_6BA0:
	ld a,08dh		;6ba0
	jr $-112		;6ba2
L_6BA4:
	ld a,099h		;6ba4
	jr $-116		;6ba6
L_6BA8:
	ld a,09bh		;6ba8
	jr $-120		;6baa
L_6BAC:
	ld a,09ch		;6bac
	jr $-124		;6bae
L_6BB0:
	ld a,09dh		;6bb0
	jr $+70		;6bb2
L_6BB4:
	ld a,09eh		;6bb4
	jr $+66		;6bb6
L_6BB8:
	ld a,09fh		;6bb8
	jr $+62		;6bba
L_6BBC:
	ld a,0a2h		;6bbc
	jr $+58		;6bbe
L_6BC0:
	ld a,0a3h		;6bc0
	jr $+54		;6bc2
L_6BC4:
	ld a,0a4h		;6bc4
	jr $+50		;6bc6
L_6BC8:
	ld a,0a5h		;6bc8
	jr $+46		;6bca
L_6BCC:
	ld a,084h		;6bcc
	jr $+42		;6bce
L_6BD0:
	ld a,0a6h		;6bd0
	jr $+38		;6bd2
L_6BD4:
	ld a,0a7h		;6bd4
	jr $+34		;6bd6
L_6BD8:
	ld a,0f1h		;6bd8
	jr $+30		;6bda
L_6BDC:
	ld a,0f2h		;6bdc
	jr $+26		;6bde
L_6BE0:
	ld a,0f3h		;6be0
	jr $+22		;6be2
L_6BE4:
	ld a,0f4h		;6be4
	jr $+18		;6be6
L_6BE8:
	ld a,0f6h		;6be8
	jr $+14		;6bea
L_6BEC:
	ld a,0f7h		;6bec
	jr $+10		;6bee

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6bf0..0x6bf8  (8 bytes)
DATA_6BF0:
	defb 03eh,0f8h,018h,004h,03eh,0f9h,018h,000h	; 6bf0  >...>...

; ======================================================================
; CODIGO 0x6bf8..0x6c13  (27 bytes)
; ======================================================================


L_6BF8:
	jp 0c340h		;6bf8
L_6BFB:
	ld a,083h		;6bfb
	jr L_6BF8		;6bfd
L_6BFF:
	ld a,0a8h		;6bff
	jr L_6BF8		;6c01
L_6C03:
	ld a,0a9h		;6c03
	jr L_6BF8		;6c05
L_6C07:
	ld a,0aah		;6c07
	jr L_6BF8		;6c09
L_6C0B:
	ld a,079h		;6c0b
	jr L_6BF8		;6c0d
L_6C0F:
	ld a,002h		;6c0f
	jr L_6BF8		;6c11

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6c13..0x6c17  (4 bytes)
DATA_6C13:
	defb 03eh,037h,018h,0e1h	; 6c13

; ======================================================================
; CODIGO 0x6c17..0x6c1b  (4 bytes)
; ======================================================================


L_6C17:
	ld a,048h		;6c17
	jr $-33		;6c19

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6c1b..0x6c1f  (4 bytes)
DATA_6C1B:
	defb 03eh,093h,018h,0d9h	; 6c1b

; ======================================================================
; CODIGO 0x6c1f..0x6c37  (24 bytes)
; ======================================================================


L_6C1F:
	ld a,049h		;6c1f
	jr $-41		;6c21
L_6C23:
	ld a,092h		;6c23
	jr $-45		;6c25
L_6C27:
	ld a,09ah		;6c27
	jr $-49		;6c29
L_6C2B:
	ld a,043h		;6c2b
	jr $-53		;6c2d
L_6C2F:
	ld a,045h		;6c2f
	jr $-57		;6c31
L_6C33:
	ld a,046h		;6c33
	jr $-61		;6c35

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6c37..0x6c3b  (4 bytes)
DATA_6C37:
	defb 03eh,003h,018h,0bdh	; 6c37

; ======================================================================
; CODIGO 0x6c3b..0x6c3f  (4 bytes)
; ======================================================================


L_6C3B:
	ld a,042h		;6c3b
	jr $-69		;6c3d

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6c3f..0x6c43  (4 bytes)
DATA_6C3F:
	defb 03eh,086h,018h,0b5h	; 6c3f

; ======================================================================
; CODIGO 0x6c43..0x6c47  (4 bytes)
; ======================================================================


L_6C43:
	ld a,094h		;6c43
	jr $-77		;6c45

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6c47..0x6c4f  (8 bytes)
DATA_6C47:
	defb 03eh,04ah,018h,0adh,03eh,04bh,018h,0a9h	; 6c47  >J..>K..

; ======================================================================
; CODIGO 0x6c4f..0x6c5f  (16 bytes)
; ======================================================================


L_6C4F:
	ld a,04ch		;6c4f
	jr $-89		;6c51
L_6C53:
	ld a,04dh		;6c53
	jr $-93		;6c55
L_6C57:
	ld a,04eh		;6c57
	jr $-97		;6c59
L_6C5B:
	ld a,04fh		;6c5b
	jr $-101		;6c5d

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6c5f..0x6c6b  (12 bytes)
DATA_6C5F:
	defb 03eh,050h,018h,095h,03eh,051h,018h,091h,03eh,052h,018h,08dh	; 6c5f  >P..>Q..>R..

; ======================================================================
; CODIGO 0x6c6b..0x6c6f  (4 bytes)
; ======================================================================


L_6C6B:
	ld a,053h		;6c6b
	jr $-117		;6c6d

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6c6f..0x6c77  (8 bytes)
DATA_6C6F:
	defb 03eh,054h,018h,085h,03eh,055h,018h,081h	; 6c6f  >T..>U..

; ======================================================================
; CODIGO 0x6c77..0x6c7b  (4 bytes)
; ======================================================================


L_6C77:
	ld a,05ch		;6c77
	jr $+42		;6c79

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6c7b..0x6c7f  (4 bytes)
DATA_6C7B:
	defb 03eh,05dh,018h,024h	; 6c7b

; ======================================================================
; CODIGO 0x6c7f..0x6c83  (4 bytes)
; ======================================================================


L_6C7F:
	ld a,05eh		;6c7f
	jr $+34		;6c81

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6c83..0x6c87  (4 bytes)
DATA_6C83:
	defb 03eh,05fh,018h,01ch	; 6c83

; ======================================================================
; CODIGO 0x6c87..0x6c9f  (24 bytes)
; ======================================================================


L_6C87:
	ld a,060h		;6c87
	jr $+26		;6c89
L_6C8B:
	ld a,061h		;6c8b
	jr $+22		;6c8d
L_6C8F:
	ld a,062h		;6c8f
	jr $+18		;6c91
L_6C93:
	ld a,063h		;6c93
	jr $+14		;6c95
L_6C97:
	ld a,087h		;6c97
	jr $+10		;6c99
L_6C9B:
	ld a,088h		;6c9b
	jr $+6		;6c9d

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6c9f..0x6ca3  (4 bytes)
DATA_6C9F:
	defb 03eh,095h,018h,000h	; 6c9f

; ======================================================================
; CODIGO 0x6ca3..0x6cae  (11 bytes)
; ======================================================================


L_6CA3:
	jp 0c340h		;6ca3
L_6CA6:
	ld a,089h		;6ca6
	jr L_6CA3		;6ca8
L_6CAA:
	ld a,08ah		;6caa
	jr L_6CA3		;6cac

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6cae..0x6cb2  (4 bytes)
DATA_6CAE:
	defb 03eh,064h,018h,0f1h	; 6cae

; ======================================================================
; CODIGO 0x6cb2..0x6cd2  (32 bytes)
; ======================================================================


L_6CB2:
	ld a,098h		;6cb2
	jr $-17		;6cb4
L_6CB6:
	ld a,065h		;6cb6
	jr $-21		;6cb8
L_6CBA:
	ld a,097h		;6cba
	jr $-25		;6cbc
L_6CBE:
	ld a,096h		;6cbe
	jr $-29		;6cc0
L_6CC2:
	ld a,0a0h		;6cc2
	jr $-33		;6cc4
L_6CC6:
	ld a,08bh		;6cc6
	jr $-37		;6cc8
L_6CCA:
	ld a,066h		;6cca
	jr $-41		;6ccc
L_6CCE:
	ld a,067h		;6cce
	jr $-45		;6cd0

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6cd2..0x6cd6  (4 bytes)
DATA_6CD2:
	defb 03eh,068h,018h,0cdh	; 6cd2

; ======================================================================
; CODIGO 0x6cd6..0x6f5e  (648 bytes)
; ======================================================================


L_6CD6:
	ld a,069h		;6cd6
	jr $-53		;6cd8
L_6CDA:
	push hl			;6cda
	ld hl,00000h		;6cdb
	ld (0ca19h),hl		;6cde
	pop hl			;6ce1
	ret			;6ce2
L_6CE3:
	call L_6DBB		;6ce3
	call 04127h		;6ce6
	ld hl,082b8h		;6ce9
	ld de,08000h		;6cec
	call 04d4ah		;6cef
	ld hl,08135h		;6cf2
	call 04d4eh		;6cf5
	ld hl,08195h		;6cf8
	call 04d52h		;6cfb
	ld a,055h		;6cfe
	ld (0ca75h),a		;6d00
	xor a			;6d03
	ld (0ca42h),a		;6d04
	ld d,001h		;6d07
	call 04be4h		;6d09
	ld hl,08336h		;6d0c
	ld de,00100h		;6d0f
	call L_6D65		;6d12
	inc hl			;6d15
	ld de,00302h		;6d16
	call L_6D65		;6d19
	inc hl			;6d1c
	ld de,00504h		;6d1d
	call L_6D65		;6d20
	ld hl,0009eh		;6d23
	ld d,00ch		;6d26
	ld bc,0ff06h		;6d28
L_6D2B:
	ld a,003h		;6d2b
	call 046e6h		;6d2d
	ld a,l			;6d30
	add a,008h		;6d31
	ld l,a			;6d33
	dec d			;6d34
	jr nz,L_6D2B		;6d35
	ld hl,00698h		;6d37
	ld d,01fh		;6d3a
	ld bc,06806h		;6d3c
L_6D3F:
	ld a,003h		;6d3f
	call 046dah		;6d41
	ld a,h			;6d44
	add a,008h		;6d45
	ld h,a			;6d47
	dec d			;6d48
	jr nz,L_6D3F		;6d49
	ld hl,00098h		;6d4b
	ld d,h			;6d4e
	ld e,l			;6d4f
	ld bc,00068h		;6d50
	ld a,078h		;6d53
	call 047edh		;6d55
	ld de,0bbcah		;6d58
	ld hl,0f800h		;6d5b
	xor a			;6d5e
	call 0456eh		;6d5f
	jp 040f0h		;6d62
L_6D65:
	ld (0ca4ch),de		;6d65
L_6D69:
	ld a,(hl)			;6d69
	inc a			;6d6a
	ret z			;6d6b
	ld e,(hl)			;6d6c
	inc hl			;6d6d
	ld d,(hl)			;6d6e
	inc hl			;6d6f
	ld b,(hl)			;6d70
	inc hl			;6d71
	ld c,(hl)			;6d72
	inc hl			;6d73
	ld a,(hl)			;6d74
	inc hl			;6d75
	push hl			;6d76
	ld h,(hl)			;6d77
	ld l,a			;6d78
	push de			;6d79
	push bc			;6d7a
	call L_6DA2		;6d7b
	pop bc			;6d7e
	pop de			;6d7f
	ld hl,0e500h		;6d80
	call L_6D8A		;6d83
	pop hl			;6d86
	inc hl			;6d87
	jr L_6D69		;6d88
L_6D8A:
	push bc			;6d8a
	push de			;6d8b
	ld b,c			;6d8c
L_6D8D:
	ld a,(hl)			;6d8d
	and a			;6d8e
	call nz,04a0bh		;6d8f
	ld a,d			;6d92
	add a,008h		;6d93
	ld d,a			;6d95
	inc hl			;6d96
	djnz L_6D8D		;6d97
	pop de			;6d99
	ld a,e			;6d9a
	add a,008h		;6d9b
	ld e,a			;6d9d
	pop bc			;6d9e
	djnz L_6D8A		;6d9f
	ret			;6da1
L_6DA2:
	ld de,0e500h		;6da2
L_6DA5:
	ld a,(hl)			;6da5
	cp 0ffh		;6da6
	ret z			;6da8
	sub 0f7h		;6da9
	jr nc,L_6DB1		;6dab
	ldi		;6dad
	jr L_6DA5		;6daf
L_6DB1:
	ld b,a			;6db1
	inc hl			;6db2
	ld a,(hl)			;6db3
L_6DB4:
	ld (de),a			;6db4
	inc de			;6db5
	djnz L_6DB4		;6db6
	inc hl			;6db8
	jr L_6DA5		;6db9
L_6DBB:
	call 04127h		;6dbb
	ld hl,08114h		;6dbe
	ld de,08000h		;6dc1
	call 04d4ah		;6dc4
	ld hl,0811fh		;6dc7
	call 04d56h		;6dca
	jr L_6DE6		;6dcd
L_6DCF:
	call 04127h		;6dcf
	ld hl,0812ah		;6dd2
	ld de,08000h		;6dd5
	jr L_6DE3		;6dd8
L_6DDA:
	call 04193h		;6dda
	ld de,0b567h		;6ddd
	ld hl,0b58bh		;6de0
L_6DE3:
	call 04d3eh		;6de3
L_6DE6:
	jp 040f0h		;6de6
L_6DE9:
	call 04127h		;6de9
	ld hl,08114h		;6dec
	ld de,08000h		;6def
	jr L_6DE3		;6df2
L_6DF4:
	call 04179h		;6df4
	ld hl,0aa44h		;6df7
	call 0463fh		;6dfa
	jr L_6DE6		;6dfd
L_6DFF:
	call 04171h		;6dff
	ld de,08000h		;6e02
	ld hl,08037h		;6e05
	call 04d3eh		;6e08
	jr L_6DE6		;6e0b
L_6E0D:
	call 04162h		;6e0d
	ld de,0bba0h		;6e10
	call 04534h		;6e13
	jr L_6DE6		;6e16
L_6E18:
	call 0416ch		;6e18
	ld hl,093e5h		;6e1b
	call 043f6h		;6e1e
	ld de,092b8h		;6e21
	call 04d56h		;6e24
	jr L_6DE6		;6e27
L_6E29:
	ld de,00820h		;6e29
L_6E2C:
	call 0412ch		;6e2c
	ld hl,08098h		;6e2f
	ld bc,0a840h		;6e32
L_6E35:
	push bc			;6e35
	push de			;6e36
	xor a			;6e37
	ld b,a			;6e38
	call 04486h		;6e39
	pop de			;6e3c
	pop bc			;6e3d
	ld a,080h		;6e3e
	call 04243h		;6e40
	djnz L_6E35		;6e43
	jp 04179h		;6e45
L_6E48:
	call 04136h		;6e48
	ld de,00000h		;6e4b
	ld hl,08000h		;6e4e
	ld bc,07050h		;6e51
	call L_6ED6		;6e54
	ld de,03800h		;6e57
	ld hl,0a300h		;6e5a
	ld bc,08040h		;6e5d
	call L_6EC9		;6e60
	call 04131h		;6e63
	call L_6EB4		;6e66
	ld de,03840h		;6e69
	ld hl,0af99h		;6e6c
	ld bc,08040h		;6e6f
	call L_6EC9		;6e72
	ld hl,08000h		;6e75
	ld e,000h		;6e78
	ld b,e			;6e7a
	call L_6EAD		;6e7b
	ld hl,08800h		;6e7e
	ld e,040h		;6e81
	ld b,000h		;6e83
	call L_6EAD		;6e85
	ld hl,09000h		;6e88
	ld e,080h		;6e8b
	ld b,000h		;6e8d
	call L_6EAD		;6e8f
	ld hl,09800h		;6e92
	ld e,0c0h		;6e95
	ld b,08bh		;6e97
	call L_6EAD		;6e99
	ld hl,030e0h		;6e9c
	ld de,008e8h		;6e9f
	ld bc,03808h		;6ea2
	ld a,00fh		;6ea5
	call 04767h		;6ea7
	jp 040f0h		;6eaa
L_6EAD:
	ld d,000h		;6ead
	ld c,00fh		;6eaf
	jp 0489ch		;6eb1
L_6EB4:
	ld de,00050h		;6eb4
	ld hl,09c58h		;6eb7
	ld bc,0702ch		;6eba
	jp L_6ED6		;6ebd
L_6EC0:
	call 04131h		;6ec0
	call L_6EB4		;6ec3
	jp 04176h		;6ec6
L_6EC9:
	push de			;6ec9
	push bc			;6eca
	ex de,hl			;6ecb
	ld hl,0d000h		;6ecc
	push hl			;6ecf
	call 051e0h		;6ed0
	pop hl			;6ed3
	pop bc			;6ed4
	pop de			;6ed5
L_6ED6:
	push bc			;6ed6
	push de			;6ed7
	ld a,001h		;6ed8
	ld b,000h		;6eda
	call 04486h		;6edc
	pop de			;6edf
	pop bc			;6ee0
	ld a,080h		;6ee1
	call 04243h		;6ee3
	djnz L_6ED6		;6ee6
	ret			;6ee8
L_6EE9:
	call 04171h		;6ee9
	ld de,0863dh		;6eec
	ld hl,086a1h		;6eef
	call 04d46h		;6ef2
	call 04162h		;6ef5
	ld de,0b905h		;6ef8
	ld hl,0b909h		;6efb
	call 04d46h		;6efe
	call 040f0h		;6f01
	jp L_6FE8		;6f04
L_6F07:
	call 0412ch		;6f07
	ld de,00080h		;6f0a
	ld hl,0b093h		;6f0d
	ld bc,02605h		;6f10
	call 0489ch		;6f13
L_6F16:
	jp 04176h		;6f16
L_6F19:
	call 04127h		;6f19
	ld hl,08114h		;6f1c
	ld de,08000h		;6f1f
	call 04d46h		;6f22
	jr L_6F16		;6f25
L_6F27:
	ld a,(0ca61h)		;6f27
	or a			;6f2a
	ret z			;6f2b
	call 04162h		;6f2c
	dec a			;6f2f
	ld de,0bc04h		;6f30
	call 04403h		;6f33
	call 04534h		;6f36
	jp 041d2h		;6f39
L_6F3C:
	call 04171h		;6f3c
	ld de,09ea2h		;6f3f
	ld hl,09eb2h		;6f42
	call 04d56h		;6f45
	jr L_6F53		;6f48
L_6F4A:
	ld de,0a81bh		;6f4a
	call 04171h		;6f4d
L_6F50:
	call 04534h		;6f50
L_6F53:
	jp 041c2h		;6f53
L_6F56:
	ld de,0ba0fh		;6f56
	call 04162h		;6f59
	jr L_6F50		;6f5c

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6f5e..0x6f72  (20 bytes)
DATA_6F5E:
	defb 011h,01bh,0a8h,0cdh,071h,041h,0cdh,034h,045h,0c3h,03fh,041h,011h,079h,0beh,0cdh	; 6f5e  ....qA.4E.?A.y..
	defb 067h,041h,018h,0f2h	; 6f6e

; ======================================================================
; CODIGO 0x6f72..0x6fa8  (54 bytes)
; ======================================================================


L_6F72:
	call L_6F78		;6f72
	jp 041c2h		;6f75
L_6F78:
	call 04158h		;6f78
	ld de,09638h		;6f7b
	ld hl,0e280h		;6f7e
	ld a,001h		;6f81
	call 0456eh		;6f83
	call 040f0h		;6f86
	ld hl,080d6h		;6f89
	ld de,006e2h		;6f8c
	ld a,00fh		;6f8f
	jp 047abh		;6f91
L_6F94:
	ld hl,0b9c8h		;6f94
L_6F97:
	ld de,0b9b2h		;6f97
	call 0416ch		;6f9a
	call 04d56h		;6f9d
	jp 041c2h		;6fa0
L_6FA3:
	ld hl,0b9e1h		;6fa3
	jr L_6F97		;6fa6

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6fa8..0x6fc9  (33 bytes)
DATA_6FA8:
	defb 0cdh,0aeh,06fh,0c3h,0efh,041h,0cdh,062h,041h,011h,06eh,0bch,021h,000h,0feh,0afh	; 6fa8  ..o..A.bA.n.!...
	defb 0cdh,06eh,045h,0c3h,03fh,041h,0cdh,062h,041h,011h,099h,0bdh,021h,000h,0fah,018h	; 6fb8  .nE.?A.bA...!...
	defb 0eeh	; 6fc8

; ======================================================================
; CODIGO 0x6fc9..0x7078  (175 bytes)
; ======================================================================


L_6FC9:
	call 0418eh		;6fc9
	ld hl,0a1d8h		;6fcc
	call 0463fh		;6fcf
	jp 040f0h		;6fd2
L_6FD5:
	call 041bdh		;6fd5
	call 051e0h		;6fd8
	jr L_703F		;6fdb
L_6FDD:
	call 04171h		;6fdd
	ld hl,096abh		;6fe0
	call 043f6h		;6fe3
	jr L_703F		;6fe6
L_6FE8:
	call 0418eh		;6fe8
	ld hl,0a412h		;6feb
	ld de,00080h		;6fee
	ld bc,00820h		;6ff1
	call 050f4h		;6ff4
	jr L_703F		;6ff7
L_6FF9:
	call 04171h		;6ff9
	ld hl,0965dh		;6ffc
	ld de,008c0h		;6fff
	ld bc,00203h		;7002
	call 0509ah		;7005
	ld hl,09667h		;7008
	ld de,0c050h		;700b
	ld bc,00208h		;700e
	call 0509ah		;7011
	ld hl,09677h		;7014
	ld de,0c868h		;7017
	ld bc,00606h		;701a
	call 0509ah		;701d
	ld hl,09677h		;7020
	ld de,0c898h		;7023
	ld bc,00606h		;7026
	jr L_703C		;7029
L_702B:
	ld hl,0969bh		;702b
	jr L_7033		;702e
L_7030:
	ld hl,096a3h		;7030
L_7033:
	call 04171h		;7033
	ld de,0d004h		;7036
	ld bc,00204h		;7039
L_703C:
	call 0509ah		;703c
L_703F:
	jp 040f0h		;703f
L_7042:
	call L_7048		;7042
	jp 041cah		;7045
L_7048:
	ld a,(0cae2h)		;7048
	or a			;704b
	ret z			;704c
	call L_7064		;704d
	jp 042a8h		;7050
L_7053:
	call L_7059		;7053
	jp 041cah		;7056
L_7059:
	ld a,(0cae2h)		;7059
	or a			;705c
	ret z			;705d
	call L_7064		;705e
	jp 042adh		;7061
L_7064:
	call 04171h		;7064
	ld hl,09663h		;7067
	ld de,080c0h		;706a
	ld bc,00202h		;706d
	jr L_703C		;7070
L_7072:
	call L_708E		;7072
	jp 041bdh		;7075

; ----------------------------------------------------------------------
; DATOS sin identificar  0x7078..0x707e  (6 bytes)
DATA_7078:
	defb 0cdh,07eh,070h,0c3h,0c5h,041h	; 7078

; ======================================================================
; CODIGO 0x707e..0x72a2  (548 bytes)
; ======================================================================


L_707E:
	ld hl,0ca42h		;707e
	ld a,(hl)			;7081
	push hl			;7082
	push af			;7083
	xor 001h		;7084
	ld (hl),a			;7086
	call L_708E		;7087
	pop af			;708a
	pop hl			;708b
	ld (hl),a			;708c
	ret			;708d
L_708E:
	call 04171h		;708e
	ld hl,0dd00h		;7091
	ld de,096bfh		;7094
	call 051e0h		;7097
	call 040f0h		;709a
	ld a,055h		;709d
	ld hl,00706h		;709f
	ld (0ca75h),a		;70a2
	ld (0ca4ch),hl		;70a5
	call 04d1ch		;70a8
	jp 057aeh		;70ab
L_70AE:
	ld hl,0d8e3h		;70ae
	ld (hl),b			;70b1
	push af			;70b2
	push de			;70b3
	call 0416ch		;70b4
	ld hl,093fdh		;70b7
	call 043f6h		;70ba
	ld bc,00604h		;70bd
	call L_70F2		;70c0
	pop de			;70c3
	pop af			;70c4
	or a			;70c5
	jp nz,040f0h		;70c6
	ld a,(0cb21h)		;70c9
	dec a			;70cc
	jp nz,040f0h		;70cd
	ld hl,095d1h		;70d0
	ld a,d			;70d3
	add a,008h		;70d4
	ld d,a			;70d6
	ld a,e			;70d7
	add a,020h		;70d8
	ld e,a			;70da
	ld bc,00202h		;70db
L_70DE:
	call L_70F2		;70de
	jp 040f0h		;70e1
L_70E4:
	push af			;70e4
	xor a			;70e5
	ld (0d8e3h),a		;70e6
	pop af			;70e9
	call 0416ch		;70ea
	call 043f6h		;70ed
	jr L_70DE		;70f0
L_70F2:
	ld a,(0d8e3h)		;70f2
	or a			;70f5
	jp z,050e8h		;70f6
	jp 050fah		;70f9
L_70FC:
	call 04171h		;70fc
	ld hl,0a719h		;70ff
	ld de,04000h		;7102
	ld bc,01308h		;7105
	jr L_711B		;7108
L_710A:
	ld hl,0a818h		;710a
	jr L_7112		;710d
L_710F:
	ld hl,0a815h		;710f
L_7112:
	call 04171h		;7112
	ld de,06040h		;7115
	ld bc,00103h		;7118
L_711B:
	call 050e8h		;711b
L_711E:
	jp 041c2h		;711e
L_7121:
	call L_7131		;7121
	call 05106h		;7124
	jr L_711E		;7127
L_7129:
	call L_7131		;7129
	call 05100h		;712c
	jr L_711E		;712f
L_7131:
	call 0416ch		;7131
	ld hl,0b9d8h		;7134
	ld de,08894h		;7137
	ld bc,00303h		;713a
	ret			;713d
L_713E:
	call 0416ch		;713e
	ld hl,0b9e7h		;7141
	ld de,06837h		;7144
	ld bc,00202h		;7147
	call 05106h		;714a
	jr L_711E		;714d
L_714F:
	call 0418eh		;714f
	ld de,01068h		;7152
	ld bc,00a02h		;7155
	call 050a0h		;7158
	jp 041d2h		;715b
L_715E:
	call 04183h		;715e
	ld de,0bb4ah		;7161
	ld hl,0e900h		;7164
	call 051e0h		;7167
	ld hl,0e900h		;716a
	ld de,04041h		;716d
	ld bc,00b10h		;7170
	call 050e2h		;7173
	jp 04179h		;7176
L_7179:
	call 04183h		;7179
	ld de,0bc95h		;717c
	ld hl,0e900h		;717f
	call 051e0h		;7182
	ld hl,0e900h		;7185
	ld de,05050h		;7188
	ld bc,0050ch		;718b
	jr L_719C		;718e
L_7190:
	call 04183h		;7190
	ld hl,0bbd5h		;7193
	ld de,04038h		;7196
	ld bc,00c10h		;7199
L_719C:
	call 050e8h		;719c
	jp 04179h		;719f
L_71A2:
	call 04158h		;71a2
	ld de,0be74h		;71a5
	ld hl,0e2c0h		;71a8
	call 051e0h		;71ab
	ld hl,0e2c0h		;71ae
	ld de,02818h		;71b1
	ld bc,0140eh		;71b4
	call 050e8h		;71b7
	call 0419dh		;71ba
	call 0a0f9h		;71bd
	jr L_71DA		;71c0
L_71C2:
	call 04158h		;71c2
	ld a,(0d8cdh)		;71c5
	add a,003h		;71c8
	add a,a			;71ca
	ld hl,0bf3eh		;71cb
	call 0423eh		;71ce
	ld de,05820h		;71d1
	ld bc,00102h		;71d4
	call 050e8h		;71d7
L_71DA:
	jp 041adh		;71da
L_71DD:
	push hl			;71dd
	push de			;71de
	push bc			;71df
	call L_71E9		;71e0
	pop bc			;71e3
	pop de			;71e4
	pop hl			;71e5
	jp L_62B1		;71e6
L_71E9:
	ld a,(0ca4ah)		;71e9
	cp 006h		;71ec
	jp z,050d6h		;71ee
	jp 050a0h		;71f1
L_71F4:
	call L_6FDD		;71f4
	jp 041cah		;71f7
L_71FA:
	call 0418eh		;71fa
	ld hl,0bccfh		;71fd
	call 0463fh		;7200
	jp 041b5h		;7203
L_7206:
	ld d,003h		;7206
	call 04be4h		;7208
	call 04171h		;720b
	ld e,000h		;720e
	ld hl,097e2h		;7210
	ld b,076h		;7213
	call L_723C		;7215
	ld e,020h		;7218
	ld hl,09b92h		;721a
	ld b,054h		;721d
	call L_723C		;721f
	ld e,038h		;7222
	ld hl,09e32h		;7224
	ld b,00eh		;7227
	call L_723C		;7229
L_722C:
	call 0416ch		;722c
	ld e,040h		;722f
	ld hl,0badbh		;7231
	ld b,080h		;7234
	call L_723C		;7236
	jp 040f0h		;7239
L_723C:
	ld c,007h		;723c
	ld d,000h		;723e
	jp 0489ch		;7240
L_7243:
	ld bc,00400h		;7243
	ld hl,0fcc1h		;7246
L_7249:
	push bc			;7249
	push hl			;724a
	ld a,(hl)			;724b
	bit 7,a		;724c
	jr nz,L_725C		;724e
	ld a,c			;7250
	call L_7271		;7251
L_7254:
	pop hl			;7254
	pop bc			;7255
	ret c			;7256
	inc hl			;7257
	inc c			;7258
	djnz L_7249		;7259
	ret			;725b
L_725C:
	and 080h		;725c
	or c			;725e
	call L_7264		;725f
	jr L_7254		;7262
L_7264:
	ld b,004h		;7264
L_7266:
	push bc			;7266
	call L_7271		;7267
	pop bc			;726a
	ret c			;726b
	add a,004h		;726c
	djnz L_7266		;726e
	ret			;7270
L_7271:
	push af			;7271
	ld hl,08000h		;7272
	call 00024h		;7275   ; BIOS ENASLT - Switches to specified slot and page definitively
	ld hl,08000h		;7278
	ld b,000h		;727b
L_727D:
	ld a,(hl)			;727d
	cpl			;727e
	ld (hl),a			;727f
	cp (hl)			;7280
	cpl			;7281
	ld (hl),a			;7282
	jr nz,L_728B		;7283
	inc hl			;7285
	djnz L_727D		;7286
	pop af			;7288
	scf			;7289
	ret			;728a
L_728B:
	pop af			;728b
	and a			;728c
	ret			;728d
L_728E:
	ld hl,0ca03h		;728e
	inc (hl)			;7291
	ld bc,(0ca00h)		;7292
	ld a,c			;7296
	cp 003h		;7297
	jr nc,L_729F		;7299
	ld hl,07747h		;729b
	push hl			;729e
L_729F:
	call 0424dh		;729f

; ----------------------------------------------------------------------
; DATOS sin identificar  0x72a2..0x72b2  (16 bytes)
DATA_72A2:
	defb 0b2h,072h,01fh,073h,05eh,073h,086h,073h,098h,073h,0d2h,073h,055h,076h,026h,077h	; 72a2  .r.s^s.s.s.sUv&w

; ======================================================================
; CODIGO 0x72b2..0x7400  (334 bytes)
; ======================================================================


L_72B2:
	ld a,b			;72b2
	cp 001h		;72b3
	jr z,L_72C8		;72b5
	jr nc,L_72DC		;72b7
	call 045fdh		;72b9
	call 04179h		;72bc
	call 092d1h		;72bf
	call 040f0h		;72c2
	jp L_7348		;72c5
L_72C8:
	call 04179h		;72c8
	call 0932fh		;72cb
	call 040f0h		;72ce
	ld a,(0ca14h)		;72d1
	or a			;72d4
	ret z			;72d5
	call L_7206		;72d6
	xor a			;72d9
	jr L_7345		;72da
L_72DC:
	ld hl,0ca04h		;72dc
	dec (hl)			;72df
	ret nz			;72e0
	call 045fdh		;72e1
	ld bc,00007h		;72e4
	call 00047h		;72e7   ; BIOS WRTVDP - Writes data in the VDP-register
	call 045f6h		;72ea
	call L_7312		;72ed
	call 04266h		;72f0
	call 045d7h		;72f3
	call 04609h		;72f6
	ld a,(0ca2ah)		;72f9
	and a			;72fc
	ld hl,00001h		;72fd
	jr z,L_7305		;7300
	ld hl,00080h		;7302
L_7305:
	ld (0ca2ch),hl		;7305
	ld hl,0ca2ah		;7308
	ld a,(hl)			;730b
	xor 001h		;730c
	ld (hl),a			;730e
	jp L_73A3		;730f
L_7312:
	ld a,(0ca2ah)		;7312
	and a			;7315
	jp nz,L_6E48		;7316
	call L_6FC9		;7319
	jp L_6CE3		;731c
L_731F:
	ld a,b			;731f
	and a			;7320
	jr nz,L_734D		;7321
	ld a,(0ca2ch)		;7323
	cp 080h		;7326
	call c,L_67CD		;7328
	call 04179h		;732b
	call 08000h		;732e
	call 040f0h		;7331
	ld a,(0ca2ch)		;7334
	cp 080h		;7337
	call c,04f97h		;7339
	ld a,(0ca2ch)		;733c
	and a			;733f
	ret nz			;7340
	call 08427h		;7341
	xor a			;7344
L_7345:
	ld (0ca04h),a		;7345
L_7348:
	ld hl,0ca01h		;7348
	inc (hl)			;734b
	ret			;734c
L_734D:
	call 04179h		;734d
	call 0a196h		;7350
	call 040f0h		;7353
	ld a,(0cafah)		;7356
	or a			;7359
	ret nz			;735a
	jp L_73A4		;735b
L_735E:
	ld a,b			;735e
	and a			;735f
	jr nz,L_7372		;7360
	ld hl,0ca04h		;7362
	dec (hl)			;7365
	ret nz			;7366
	xor a			;7367
	ld (0cafbh),a		;7368
	inc a			;736b
	ld (0cafah),a		;736c
	jp L_7348		;736f
L_7372:
	call 04179h		;7372
	call 0a299h		;7375
	call 040f0h		;7378
	ld a,(0cafah)		;737b
	or a			;737e
	ret nz			;737f
L_7380:
	xor a			;7380
	ld (0ca00h),a		;7381
	jr L_73AB		;7384
L_7386:
	ld a,b			;7386
	and a			;7387
	jr nz,L_738E		;7388
	ld a,050h		;738a
	jr L_7345		;738c
L_738E:
	ld hl,0ca04h		;738e
	dec (hl)			;7391
	ret nz			;7392
	call L_6056		;7393
	jr L_73A3		;7396
L_7398:
	call 045b3h		;7398
	call 09e2bh		;739b
	ld hl,0ca40h		;739e
	ld (hl),001h		;73a1
L_73A3:
	xor a			;73a3
L_73A4:
	ld (0ca04h),a		;73a4
	ld hl,0ca00h		;73a7
	inc (hl)			;73aa
L_73AB:
	xor a			;73ab
L_73AC:
	ld (0ca01h),a		;73ac
	ret			;73af
L_73B0:
	ld a,(0ca4ah)		;73b0
	cp 012h		;73b3
	jr nz,L_73BD		;73b5
	ld a,(0ca4bh)		;73b7
	cp 002h		;73ba
	ret z			;73bc
L_73BD:
	ld hl,0d8bah		;73bd
	ld a,(hl)			;73c0
	and a			;73c1
	jr nz,L_73C8		;73c2
	call L_7CE6		;73c4
	jp (hl)			;73c7
L_73C8:
	ld a,001h		;73c8
	ld (0d8aah),a		;73ca
L_73CD:
	xor a			;73cd
	ld (hl),a			;73ce
	jp L_6CA6		;73cf
L_73D2:
	ld hl,0c694h		;73d2
	ld a,(hl)			;73d5
	and a			;73d6
	jr z,L_73E4		;73d7
	ld (hl),000h		;73d9
	push bc			;73db
	ld a,(0ca77h)		;73dc
	and a			;73df
	call z,L_73B0		;73e0
	pop bc			;73e3
L_73E4:
	ld a,b			;73e4
	cp 00bh		;73e5
	jr z,L_73F2		;73e7
	sub 005h		;73e9
	cp 002h		;73eb
	push bc			;73ed
	call nc,089d9h		;73ee
	pop bc			;73f1
L_73F2:
	ld hl,0d4f0h		;73f2
	ld a,(hl)			;73f5
	and a			;73f6
	push bc			;73f7
	call nz,L_73CD		;73f8
	pop bc			;73fb
	ld a,b			;73fc
	call 0424dh		;73fd

; ----------------------------------------------------------------------
; DATOS sin identificar  0x7400..0x741a  (26 bytes)
DATA_7400:
	defb 01ah,074h,0edh,074h,0f7h,074h,005h,075h,01eh,075h,038h,075h,049h,075h,066h,075h	; 7400  .t.t.t.u.u8uIufu
	defb 086h,075h,0d6h,075h,0f6h,075h,01bh,076h,036h,076h	; 7410  .u.u.u.v6v

; ======================================================================
; CODIGO 0x741a..0x7659  (575 bytes)
; ======================================================================


L_741A:
	call L_7789		;741a
	ld a,(0ca41h)		;741d
	and a			;7420
	jp nz,L_7348		;7421
	ld a,(0ca97h)		;7424
	or a			;7427
	ret nz			;7428
	ld a,(0ca28h)		;7429
	and a			;742c
	ld a,009h		;742d
	jp nz,L_73AC		;742f
	ld a,(0cb3ch)		;7432
	and a			;7435
	ret nz			;7436
	ld a,(0ca09h)		;7437
	rra			;743a
	rra			;743b
	ld b,002h		;743c
	jr c,L_7490		;743e
	rra			;7440
	ld b,003h		;7441
	jr c,L_7490		;7443
	rra			;7445
	jr c,L_74A1		;7446
	rra			;7448
	jp c,L_74CA		;7449
	ld a,(0d434h)		;744c
	and a			;744f
	ld a,007h		;7450
	jp nz,L_73AC		;7452
	ld a,(0cae7h)		;7455
	and a			;7458
	ld a,00ah		;7459
	jp nz,L_73AC		;745b
	ld a,(0cb00h)		;745e
	cp 014h		;7461
	ld a,00bh		;7463
	jp z,L_73AC		;7465
	cp 01bh		;7468
	jp nc,L_73AC		;746a
	ld a,(0d7bbh)		;746d
	or a			;7470
	jr nz,L_74B6		;7471
	ld a,(0caafh)		;7473
	or a			;7476
	jr z,L_7485		;7477
	xor a			;7479
	ld (0ca42h),a		;747a
	ld a,007h		;747d
	ld (0ca00h),a		;747f
	jp L_73AB		;7482
L_7485:
	ld a,(0ca40h)		;7485
	or a			;7488
	ret nz			;7489
	call L_6DE9		;748a
	jp L_73A3		;748d
L_7490:
	call 08754h		;7490
	ret nc			;7493
	ld a,(0ca58h)		;7494
	or a			;7497
	ret nz			;7498
	xor a			;7499
	ld (0d701h),a		;749a
	ld a,b			;749d
	jp L_73AC		;749e
L_74A1:
	ld a,(0d8a4h)		;74a1
	or a			;74a4
	ret nz			;74a5
	call 08754h		;74a6
	ret nc			;74a9
	ld a,(0e1e8h)		;74aa
	or a			;74ad
	jr z,L_74B6		;74ae
	ld a,(0e1e9h)		;74b0
	or a			;74b3
	jr z,L_7485		;74b4
L_74B6:
	ld a,(0ca01h)		;74b6
	cp 004h		;74b9
	ret z			;74bb
	call 041c5h		;74bc
	call 0b68eh		;74bf
	call 040f0h		;74c2
	ld a,004h		;74c5
	jp L_73AC		;74c7
L_74CA:
	call 08754h		;74ca
	ret nc			;74cd
	ld a,(0ca1ch)		;74ce
	and a			;74d1
	ret nz			;74d2
	ld a,(0ca77h)		;74d3
	and a			;74d6
	jr z,L_74E5		;74d7
	ld a,(0d8c2h)		;74d9
	cp 005h		;74dc
	jr nz,L_74E5		;74de
	ld a,(0d88ah)		;74e0
	inc a			;74e3
	ret z			;74e4
L_74E5:
	call 05d6eh		;74e5
	ld a,008h		;74e8
	jp L_73AC		;74ea
L_74ED:
	call 08096h		;74ed
	xor a			;74f0
	ld (0ca41h),a		;74f1
	jp L_73AB		;74f4
L_74F7:
	call 092f8h		;74f7
	call L_7485		;74fa
	ld a,(0d706h)		;74fd
	or a			;7500
	ret z			;7501
	jp L_73AB		;7502
L_7505:
	call 09301h		;7505
	call L_7485		;7508
	ld a,(0d706h)		;750b
	or a			;750e
	ret z			;750f
	ld a,(0cb21h)		;7510
	cp 002h		;7513
	jp nz,L_73AB		;7515
	ld a,00ch		;7518
	ld (0ca01h),a		;751a
	ret			;751d
L_751E:
	call 041c5h		;751e
	call 0b76dh		;7521
	call 040f0h		;7524
	ld a,(0d7b4h)		;7527
	or a			;752a
	ret z			;752b
	ld a,(0e040h)		;752c
	or a			;752f
	jp z,L_73AB		;7530
	ld a,005h		;7533
	jp L_73AC		;7535
L_7538:
	call 041c5h		;7538
	call 0a5a9h		;753b
	call 040f0h		;753e
	ld a,(0e040h)		;7541
	or a			;7544
	ret nz			;7545
	jp L_73AB		;7546
L_7549:
	call L_67CD		;7549
	call 041bdh		;754c
	call 0bc53h		;754f
	call 040f0h		;7552
	call 05dc3h		;7555
	call L_67F5		;7558
	call 040f0h		;755b
	ld a,(0e1f0h)		;755e
	or a			;7561
	ret nz			;7562
	jp L_73AB		;7563
L_7566:
	call L_67CD		;7566
	call 05dcbh		;7569
	call 04650h		;756c
	call 041bdh		;756f
	call 0ab7dh		;7572
	call 040f0h		;7575
	call 05dabh		;7578
	call L_67F5		;757b
	ld a,(0d434h)		;757e
	and a			;7581
	ret nz			;7582
	jp L_73AB		;7583
L_7586:
	call 05d7ch		;7586
	ld a,(0c3a2h)		;7589
	and a			;758c
	jp z,L_73AB		;758d
	inc a			;7590
	ret nz			;7591
	call L_73AB		;7592
L_7595:
	call L_6074		;7595
	call L_605F		;7598
	call 0a1bbh		;759b
	call 041efh		;759e
	call 0b06bh		;75a1
	call 040f0h		;75a4
	call L_6F78		;75a7
	call 09e94h		;75aa
	call L_6488		;75ad
	call 04279h		;75b0
	call 041efh		;75b3
	call 0afe1h		;75b6
	call 040f0h		;75b9
	call 059bbh		;75bc
	ld a,001h		;75bf
	ld (0ca18h),a		;75c1
	call 041a0h		;75c4
	call 0b3c9h		;75c7
	call 041efh		;75ca
	call 0b06bh		;75cd
	call 0b03ah		;75d0
	jp 040f0h		;75d3
L_75D6:
	call L_67CD		;75d6
	call 05dcbh		;75d9
	call 04650h		;75dc
	call 04142h		;75df
	call 09cd5h		;75e2
	call 040f0h		;75e5
	call 05dabh		;75e8
	call L_67F5		;75eb
	ld a,(0ca28h)		;75ee
	and a			;75f1
	ret nz			;75f2
	jp L_73AB		;75f3
L_75F6:
	call L_67CD		;75f6
	call 05dcbh		;75f9
	call 04650h		;75fc
	ld a,(0ca03h)		;75ff
	and 003h		;7602
	jp nz,L_67F5		;7604
	call 041f7h		;7607
	call 0a354h		;760a
	call 040f0h		;760d
	call L_67F5		;7610
	ld a,(0cae7h)		;7613
	and a			;7616
	ret nz			;7617
	jp L_73AB		;7618
L_761B:
	call L_67CD		;761b
	call 05dcbh		;761e
	call 04650h		;7621
	call 0b593h		;7624
	call 0a1deh		;7627
	call 0b4e0h		;762a
	call 05dc3h		;762d
	call L_67F5		;7630
	jp L_7485		;7633
L_7636:
	call L_7FA7		;7636
	ld a,(0ca09h)		;7639
	rra			;763c
	rra			;763d
	rra			;763e
	ld b,003h		;763f
	ret nc			;7641
	call L_7490		;7642
	ld hl,0cb62h		;7645
	ld a,(hl)			;7648
	or a			;7649
	ret z			;764a
	ld (hl),000h		;764b
	ld a,(0cadeh)		;764d
	or a			;7650
	jp nz,L_6A9B		;7651
	ret			;7654
L_7655:
	ld a,b			;7655
	call 0424dh		;7656

; ----------------------------------------------------------------------
; DATOS sin identificar  0x7659..0x7661  (8 bytes)
DATA_7659:
	defb 061h,076h,08fh,076h,0a5h,076h,0e0h,076h	; 7659  av.v.v.v

; ======================================================================
; CODIGO 0x7661..0x7747  (230 bytes)
; ======================================================================


L_7661:
	call 045f1h		;7661
	call L_6BC8		;7664
	xor a			;7667
	ld (0ca1ch),a		;7668
	ld (0ca29h),a		;766b
	call 0542bh		;766e
	call 08502h		;7671
	ld bc,00f07h		;7674
	call 00047h		;7677   ; BIOS WRTVDP - Writes data in the VDP-register
	call 045beh		;767a
	ld a,(0d8a4h)		;767d
	and a			;7680
	call nz,L_6074		;7681
	call L_7714		;7684
	call 04606h		;7687
	ld a,0c0h		;768a
	jp L_7345		;768c
L_768F:
	ld a,(0ca03h)		;768f
	rra			;7692
	ret c			;7693
	ld hl,0ca04h		;7694
	dec (hl)			;7697
	ret nz			;7698
	ld hl,0a004h		;7699
	call 04918h		;769c
	call L_770B		;769f
	jp L_7348		;76a2
L_76A5:
	call 041a0h		;76a5
	call 0ae62h		;76a8
	call 040f0h		;76ab
	ret nc			;76ae
	ld a,(0ca29h)		;76af
	and a			;76b2
	jr z,L_76CF		;76b3
	dec a			;76b5
	jr z,L_76DA		;76b6
	call 045f1h		;76b8
	call L_6A0D		;76bb
	xor a			;76be
	ld (0ca42h),a		;76bf
	call 04879h		;76c2
	ld hl,0ca02h		;76c5
	ld a,(hl)			;76c8
	and 0bfh		;76c9
	ld (hl),a			;76cb
	jp L_7380		;76cc
L_76CF:
	call 05d66h		;76cf
	call 05d85h		;76d2
	call 05d8dh		;76d5
	jr L_76EB		;76d8
L_76DA:
	call 05d6eh		;76da
	jp L_7348		;76dd
L_76E0:
	call 05d7ch		;76e0
	ld a,(0c3a2h)		;76e3
	and a			;76e6
	jr z,L_76F4		;76e7
	inc a			;76e9
	ret nz			;76ea
L_76EB:
	ld hl,00005h		;76eb
	ld (0ca00h),hl		;76ee
	jp L_7595		;76f1
L_76F4:
	ld a,002h		;76f4
	ld (0ca01h),a		;76f6
	call 045f1h		;76f9
	call L_6DE9		;76fc
	call L_7714		;76ff
	ld hl,0a004h		;7702
	call 04918h		;7705
	call 04606h		;7708
L_770B:
	call 041a0h		;770b
	call 0ae89h		;770e
	jp 040f0h		;7711
L_7714:
	ld a,(0ca42h)		;7714
	call 04452h		;7717
	call 041a0h		;771a
	call 0a5d6h		;771d
	call 040f0h		;7720
	jp L_722C		;7723
L_7726:
	call 04179h		;7726
	call L_67CD		;7729
	call 09555h		;772c
	call 04f97h		;772f
	call 040f0h		;7732
	ld a,(0caafh)		;7735
	or a			;7738
	ret nz			;7739
	call L_6A0D		;773a
	ld hl,0ca02h		;773d
	ld a,(hl)			;7740
	and 0bfh		;7741
	ld (hl),a			;7743
	jp L_7380		;7744

; ----------------------------------------------------------------------
; DATOS sin identificar  0x7747..0x7789  (66 bytes)
DATA_7747:
	defb 0cdh,0a0h,041h,0cdh,0c8h,0b0h,021h,016h,0cah,0cdh,0c1h,0b0h,0cdh,0f0h,040h,0b7h	; 7747  ..A...!.......@.
	defb 0c8h,021h,004h,0cah,036h,000h,021h,000h,0cah,046h,005h,005h,020h,00dh,0e6h,030h	; 7757  .!..6.!..F.. ..0
	defb 0c8h,03eh,040h,032h,002h,0cah,036h,003h,023h,070h,0c9h,036h,002h,023h,036h,000h	; 7767  .>@2..6.#p.6.#6.
	defb 0cdh,00dh,06ah,0cdh,006h,072h,0cdh,027h,084h,0cdh,079h,041h,0cdh,087h,0a1h,0c3h	; 7777  ..j..r.'..yA....
	defb 0f0h,040h	; 7787

; ======================================================================
; CODIGO 0x7789..0x79c4  (571 bytes)
; ======================================================================


L_7789:
	call L_67CD		;7789
	call 05dcbh		;778c
	call 04650h		;778f
	call 0b593h		;7792
	call 04650h		;7795
	ld hl,0cac0h		;7798
	ld a,(0ca97h)		;779b
	or a			;779e
	jr nz,L_77B6		;779f
	ld a,(0cb3ch)		;77a1
	or a			;77a4
	jr nz,L_77B6		;77a5
	ld a,(0ca09h)		;77a7
	rra			;77aa
	jr nc,L_77B6		;77ab
	ld a,(hl)			;77ad
	xor 001h		;77ae
	ld (hl),a			;77b0
	push hl			;77b1
	call 0bfb0h		;77b2
	pop hl			;77b5
L_77B6:
	ld a,(hl)			;77b6
	or a			;77b7
	jp nz,L_7905		;77b8
	ld a,(0ca4ah)		;77bb
	cp 012h		;77be
	jr nz,L_77CA		;77c0
	ld a,(0ca4bh)		;77c2
	cp 00ch		;77c5
	jp c,L_7908		;77c7
L_77CA:
	ld hl,0d431h		;77ca
	ld a,(hl)			;77cd
	and a			;77ce
	jr z,L_77DE		;77cf
	dec (hl)			;77d1
	jr nz,L_77DE		;77d2
	ld a,(0ca4ah)		;77d4
	dec a			;77d7
	jr nz,L_77DE		;77d8
	xor a			;77da
	ld (0d430h),a		;77db
L_77DE:
	ld a,(0caa8h)		;77de
	or a			;77e1
	jr z,L_77EA		;77e2
	call 0bf14h		;77e4
	jp L_7902		;77e7
L_77EA:
	call 05f5fh		;77ea
	call 041b0h		;77ed
	call 0ab44h		;77f0
	call 041a0h		;77f3
	call 0a4e8h		;77f6
	call 04142h		;77f9
	call 0aa43h		;77fc
	call 089c3h		;77ff
	call 041f4h		;7802
	call 0a316h		;7805
	call 040f0h		;7808
	call 0a1deh		;780b
	xor a			;780e
	ld (0d4f1h),a		;780f
	call 0af18h		;7812
	call 0b2bch		;7815
	call 0b404h		;7818
	call 041efh		;781b
	call 0b558h		;781e
	call 0ba62h		;7821
	call 041b5h		;7824
	call 0a842h		;7827
	call 04142h		;782a
	call 092c0h		;782d
	call 0952ch		;7830
	call 09372h		;7833
	call 05f12h		;7836
	ld a,(0cb21h)		;7839
	cp 002h		;783c
	call nz,08000h		;783e
	call 0827bh		;7841
	call 09982h		;7844
	call 040f0h		;7847
	call 08bf1h		;784a
	call 041b0h		;784d
	call 0ac38h		;7850
	call 041a0h		;7853
	call 0a000h		;7856
	call 040f0h		;7859
	call 05f57h		;785c
	call 041d5h		;785f
	call 0a6e1h		;7862
	call 0bcd1h		;7865
	call 040f0h		;7868
	call 0b329h		;786b
	call 0b4e0h		;786e
	call 05dabh		;7871
	call 04142h		;7874
	call 09a80h		;7877
	call 040f0h		;787a
	call 0bc4bh		;787d
	ld a,(0caa8h)		;7880
	or a			;7883
	jp nz,L_7902		;7884
	call 08adfh		;7887
	call 08acfh		;788a
	call 041d5h		;788d
	call 0bb1eh		;7890
	call 0bc0ch		;7893
	call 040f0h		;7896
	ld a,(0cb21h)		;7899
	cp 002h		;789c
	jr z,L_78F7		;789e
	call 08affh		;78a0
	call 0bb4ch		;78a3
	call 041efh		;78a6
	call 0b761h		;78a9
	call 041cdh		;78ac
	call 0a170h		;78af
	call 0a067h		;78b2
	call 0a143h		;78b5
	call 0a4f1h		;78b8
	call 0a1d2h		;78bb
	call 0a24dh		;78be
	call 041d2h		;78c1
	call 0b8c2h		;78c4
	call 0bb49h		;78c7
	call 040f0h		;78ca
	call 08ba8h		;78cd
	call 0b132h		;78d0
	call 08b0fh		;78d3
	call 08b17h		;78d6
	call 08b58h		;78d9
	call 041a0h		;78dc
	call 0a428h		;78df
	call 0ace2h		;78e2
	call 041d5h		;78e5
	ld a,(0ca01h)		;78e8
	or a			;78eb
	jr nz,L_78F4		;78ec
	call 0aec9h		;78ee
	call 0a61eh		;78f1
L_78F4:
	call 040f0h		;78f4
L_78F7:
	call 089aah		;78f7
	ld a,(0cb21h)		;78fa
	cp 002h		;78fd
	call nz,0b5b5h		;78ff
L_7902:
	call 05dc3h		;7902
L_7905:
	jp L_67F5		;7905
L_7908:
	ld a,(0caa8h)		;7908
	or a			;790b
	jr z,L_7914		;790c
	call 0bf14h		;790e
	jp L_797E		;7911
L_7914:
	call 05f5fh		;7914
	call 04142h		;7917
	call 089c3h		;791a
	call 041f4h		;791d
	call 0a316h		;7920
	call 040f0h		;7923
	call 0a1deh		;7926
	xor a			;7929
	ld (0d4f1h),a		;792a
	call 0af18h		;792d
	call 0b2bch		;7930
	call 04142h		;7933
	call 09a80h		;7936
	call 041efh		;7939
	call 0aa5eh		;793c
	call 041d2h		;793f
	call 0a6e1h		;7942
	call 040f0h		;7945
	call 0b329h		;7948
	ld a,(0ca41h)		;794b
	or a			;794e
	jr nz,L_7972		;794f
	call 041b0h		;7951
	call 0ad57h		;7954
	call 0ae57h		;7957
	call 0b037h		;795a
	call 0af64h		;795d
	call 0af39h		;7960
	call 0b309h		;7963
	call 0aff7h		;7966
	call 0b338h		;7969
	call 0be40h		;796c
	call 040f0h		;796f
L_7972:
	call 0bc4bh		;7972
	call 0b132h		;7975
	call 05f57h		;7978
	call 089aah		;797b
L_797E:
	call 05dc3h		;797e
	call 08998h		;7981
	jp L_67F5		;7984
L_7987:
	ld b,a			;7987
	ld a,(0c383h)		;7988
	push af			;798b
	ld a,b			;798c
	call 040f0h		;798d
	call 08656h		;7990
	call 04142h		;7993
	pop af			;7996
	push af			;7997
	jp 041a3h		;7998
L_799B:
	call 04142h		;799b
	call 096bah		;799e
	jr L_79B1		;79a1
L_79A3:
	call 04142h		;79a3
	call 0924ch		;79a6
	jr L_79B1		;79a9
L_79AB:
	call 04142h		;79ab
	call 09ceeh		;79ae
L_79B1:
	jp 040f0h		;79b1
L_79B4:
	call 04179h		;79b4
	call 0b43dh		;79b7
	jr L_79B1		;79ba
L_79BC:
	call 04142h		;79bc
	call 09949h		;79bf
	jr L_79B1		;79c2

; ----------------------------------------------------------------------
; DATOS sin identificar  0x79c4..0x79c7  (3 bytes)
DATA_79C4:
	defb 0afh,018h,002h	; 79c4

; ======================================================================
; CODIGO 0x79c7..0x7a02  (59 bytes)
; ======================================================================


L_79C7:
	ld a,001h		;79c7
	call 040f0h		;79c9
	call L_7A27		;79cc
	jr L_79F7		;79cf
L_79D1:
	call 041bah		;79d1
	call 086c3h		;79d4
	jr L_79F7		;79d7
L_79D9:
	call 040f0h		;79d9
	call 0b67dh		;79dc
	jr L_79F7		;79df
L_79E1:
	call 040f0h		;79e1
	call 0b6c8h		;79e4
	jr L_79F7		;79e7
L_79E9:
	call 040f0h		;79e9
	call 0b11fh		;79ec
	jr L_79F7		;79ef
L_79F1:
	call 040f0h		;79f1
	call 0b132h		;79f4
L_79F7:
	jp 04142h		;79f7
L_79FA:
	call 040f0h		;79fa
	call 0b19ah		;79fd
	jr L_79F7		;7a00

; ----------------------------------------------------------------------
; DATOS sin identificar  0x7a02..0x7a12  (16 bytes)
DATA_7A02:
	defb 0cdh,0f0h,040h,0cdh,08eh,0b6h,018h,0edh,0cdh,0f0h,040h,0cdh,0a3h,0b1h,018h,0e5h	; 7a02  ..@.......@.....

; ======================================================================
; CODIGO 0x7a12..0x7a17  (5 bytes)
; ======================================================================


L_7A12:
	call L_7C77		;7a12
	jr $-30		;7a15

; ----------------------------------------------------------------------
; DATOS sin identificar  0x7a17..0x7a27  (16 bytes)
DATA_7A17:
	defb 0cdh,0f0h,040h,0cdh,0bah,0b1h,018h,0d8h,0cdh,0f0h,040h,0cdh,075h,084h,018h,0d0h	; 7a17  ..@.......@.u...

; ======================================================================
; CODIGO 0x7a27..0x7a48  (33 bytes)
; ======================================================================


L_7A27:
	ld (0d8a8h),a		;7a27
	jp 0b63eh		;7a2a
L_7A2D:
	call L_79C7		;7a2d
	jp 041bdh		;7a30
L_7A33:
	call L_79D9		;7a33
	jr L_7A3B		;7a36
L_7A38:
	call L_79E1		;7a38
L_7A3B:
	jp 041cdh		;7a3b
L_7A3E:
	call L_79C7		;7a3e
	jr L_7A3B		;7a41
L_7A43:
	call L_7C77		;7a43
	jr $+5		;7a46

; ----------------------------------------------------------------------
; DATOS sin identificar  0x7a48..0x7a4b  (3 bytes)
DATA_7A48:
	defb 0cdh,085h,07ch	; 7a48

; ======================================================================
; CODIGO 0x7a4b..0x7a4e  (3 bytes)
; ======================================================================


L_7A4B:
	jp 041f7h		;7a4b

; ----------------------------------------------------------------------
; DATOS sin identificar  0x7a4e..0x7a5f  (17 bytes)
DATA_7A4E:
	defb 0cdh,0f0h,040h,0cdh,058h,086h,0cdh,03fh,041h,018h,0f2h,0cdh,0c7h,079h,0c3h,0efh	; 7a4e  ..@.X..?A....y..
	defb 041h	; 7a5e

; ======================================================================
; CODIGO 0x7a5f..0x7a68  (9 bytes)
; ======================================================================


L_7A5F:
	call 040f0h		;7a5f
	call 08475h		;7a62
	jp 041b5h		;7a65

; ----------------------------------------------------------------------
; DATOS sin identificar  0x7a68..0x7a88  (32 bytes)
DATA_7A68:
	defb 0cdh,0f0h,040h,0cdh,0d8h,0a8h,018h,028h,0cdh,0f0h,040h,0cdh,008h,0b1h,018h,020h	; 7a68  ..@....(..@....
	defb 0cdh,0f0h,040h,0cdh,019h,093h,018h,018h,0cdh,0f0h,040h,0cdh,0b1h,09dh,018h,010h	; 7a78  ..@.......@.....

; ======================================================================
; CODIGO 0x7a88..0x7a8d  (5 bytes)
; ======================================================================


L_7A88:
	call L_7CE6		;7a88
	jr $+13		;7a8b

; ----------------------------------------------------------------------
; DATOS sin identificar  0x7a8d..0x7a98  (11 bytes)
DATA_7A8D:
	defb 0cdh,0f0h,040h,0cdh,038h,0bbh,018h,003h,0cdh,0a7h,059h	; 7a8d  ..@.8.....Y

; ======================================================================
; CODIGO 0x7a98..0x7a9b  (3 bytes)
; ======================================================================


L_7A98:
	jp 0413fh		;7a98

; ----------------------------------------------------------------------
; DATOS sin identificar  0x7a9b..0x7ac0  (37 bytes)
DATA_7A9B:
	defb 0cdh,018h,06eh,018h,0f8h,0cdh,0f0h,040h,0cdh,014h,0b8h,018h,0f0h,0cdh,0f0h,040h	; 7a9b  ..n....@.......@
	defb 0cdh,0ach,0b8h,018h,0e8h,0cdh,0f0h,040h,0cdh,066h,0b8h,018h,0e0h,0cdh,0f0h,040h	; 7aab  .......@.f.....@
	defb 0cdh,007h,085h,018h,0d8h	; 7abb

; ======================================================================
; CODIGO 0x7ac0..0x7b14  (84 bytes)
; ======================================================================


L_7AC0:
	call 040f0h		;7ac0
	call 0905eh		;7ac3
	jr $-46		;7ac6
L_7AC8:
	call 04142h		;7ac8
	call 09ca1h		;7acb
	jr L_7AF6		;7ace
L_7AD0:
	call 04142h		;7ad0
	call 0924ch		;7ad3
	jr L_7AF6		;7ad6
L_7AD8:
	call 04142h		;7ad8
	call 09949h		;7adb
	jr L_7AF6		;7ade
L_7AE0:
	call 04142h		;7ae0
	call 082fdh		;7ae3
	jr L_7AF6		;7ae6
L_7AE8:
	call 04142h		;7ae8
	call 0834ch		;7aeb
	jr L_7AF6		;7aee
L_7AF0:
	call 04142h		;7af0
	call 08326h		;7af3
L_7AF6:
	jp 041adh		;7af6
L_7AF9:
	call 04142h		;7af9
	call 08ebeh		;7afc
	jr L_7AF6		;7aff
L_7B01:
	call 04142h		;7b01
	call 08c4ah		;7b04
	jr L_7AF6		;7b07
L_7B09:
	call 0413fh		;7b09
	call 041efh		;7b0c
	call 0ab01h		;7b0f
	jr L_7AF6		;7b12

; ----------------------------------------------------------------------
; DATOS sin identificar  0x7b14..0x7b24  (16 bytes)
DATA_7B14:
	defb 0cdh,076h,041h,0cdh,071h,093h,018h,00eh,0cdh,076h,041h,0cdh,087h,093h,018h,006h	; 7b14  .vA.q....vA.....

; ======================================================================
; CODIGO 0x7b24..0x7b35  (17 bytes)
; ======================================================================


L_7B24:
	call 04176h		;7b24
	call 093f7h		;7b27
L_7B2A:
	jp 041d2h		;7b2a
L_7B2D:
	call 04176h		;7b2d
	call 0941ah		;7b30
	jr L_7B2A		;7b33

; ----------------------------------------------------------------------
; DATOS sin identificar  0x7b35..0x7b40  (11 bytes)
DATA_7B35:
	defb 0cdh,042h,041h,0cdh,0bdh,041h,0cdh,0c5h,081h,018h,0eah	; 7b35  .BA..A.....

; ======================================================================
; CODIGO 0x7b40..0x7b87  (71 bytes)
; ======================================================================


L_7B40:
	call 04142h		;7b40
	call 08957h		;7b43
	jr L_7B6B		;7b46
L_7B48:
	call L_6E18		;7b48
	jr L_7B6B		;7b4b
L_7B4D:
	call 040f0h		;7b4d
	call 0b814h		;7b50
	jr L_7B6B		;7b53
L_7B55:
	call 040f0h		;7b55
	call 0b8ach		;7b58
	jr L_7B6B		;7b5b
L_7B5D:
	call 040f0h		;7b5d
	call 0b866h		;7b60
	jr L_7B6B		;7b63
L_7B65:
	call 041bdh		;7b65
	call 0a187h		;7b68
L_7B6B:
	jp 04176h		;7b6b
L_7B6E:
	call 041bdh		;7b6e
	call 0a13bh		;7b71
	jr L_7B6B		;7b74
L_7B76:
	call L_7B98		;7b76
	call 040f0h		;7b79
	jp 041efh		;7b7c
L_7B7F:
	call 04142h		;7b7f
	call 092ebh		;7b82
	jr $+5		;7b85

; ----------------------------------------------------------------------
; DATOS sin identificar  0x7b87..0x7b8a  (3 bytes)
DATA_7B87:
	defb 0cdh,098h,07bh	; 7b87

; ======================================================================
; CODIGO 0x7b8a..0x7d95  (523 bytes)
; ======================================================================


L_7B8A:
	jp 041c2h		;7b8a
L_7B8D:
	call 04142h		;7b8d
	call 041f7h		;7b90
	call 0bdb8h		;7b93
	jr L_7B8A		;7b96
L_7B98:
	call L_6A31		;7b98
	call 04142h		;7b9b
	jp 09955h		;7b9e
L_7BA1:
	call 0413fh		;7ba1
	call 0924ch		;7ba4
	jp 041f4h		;7ba7
L_7BAA:
	ld hl,0d400h		;7baa
	ld bc,00015h		;7bad
	call 04236h		;7bb0
	ld hl,0ce2eh		;7bb3
	ld b,018h		;7bb6
L_7BB8:
	push hl			;7bb8
	push bc			;7bb9
	ld bc,00011h		;7bba
	call 04236h		;7bbd
	pop bc			;7bc0
	pop hl			;7bc1
	ld a,040h		;7bc2
	call 0423eh		;7bc4
	djnz L_7BB8		;7bc7
	ld a,(0ca4ah)		;7bc9
	cp 010h		;7bcc
	ld b,00ah		;7bce
	jr nc,L_7BD8		;7bd0
	cp 00ch		;7bd2
	jr z,L_7BD8		;7bd4
	ld b,01eh		;7bd6
L_7BD8:
	ld a,b			;7bd8
	ld (0d417h),a		;7bd9
	ld (0d420h),a		;7bdc
	ld hl,0d460h		;7bdf
	ld bc,0005fh		;7be2
	call 04236h		;7be5
	ld hl,0d4c0h		;7be8
	ld bc,0001fh		;7beb
	jp 04236h		;7bee
L_7BF1:
	ld bc,(0ca50h)		;7bf1
L_7BF5:
	call L_7BFC		;7bf5
	ld (0ca4bh),a		;7bf8
	ret			;7bfb
L_7BFC:
	ld de,0d900h		;7bfc
	ld a,c			;7bff
	ld l,a			;7c00
	ld h,000h		;7c01
	add hl,hl			;7c03
	add hl,hl			;7c04
	add hl,hl			;7c05
	add hl,hl			;7c06
	ld a,b			;7c07
	call 0423eh		;7c08
	add hl,de			;7c0b
	ld a,(hl)			;7c0c
	ret			;7c0d
L_7C0E:
	ld hl,0dd00h		;7c0e
	ld de,0e2c0h		;7c11
L_7C14:
	ld bc,00240h		;7c14
	ldir		;7c17
	ret			;7c19
L_7C1A:
	call L_7C20		;7c1a
	jp 041b5h		;7c1d
L_7C20:
	push ix		;7c20
	ld de,0dd00h		;7c22
	ld hl,0e2c0h		;7c25
	call L_7C14		;7c28
	call 05d4fh		;7c2b
	ld hl,0ca42h		;7c2e
	ld a,(hl)			;7c31
	push af			;7c32
	push hl			;7c33
	xor 001h		;7c34
	ld (hl),a			;7c36
	call 04142h		;7c37
	call 0bcf5h		;7c3a
	call 0418eh		;7c3d
	call 05fcah		;7c40
	call 041f7h		;7c43
	call 0a008h		;7c46
	call 040f0h		;7c49
	pop hl			;7c4c
	pop af			;7c4d
	ld (hl),a			;7c4e
	pop ix		;7c4f
	ret			;7c51
L_7C52:
	ld hl,0ca64h		;7c52
	ld c,(hl)			;7c55
	ld b,000h		;7c56
	ld a,(0ca4ah)		;7c58
	and a			;7c5b
	ld d,005h		;7c5c
	jr z,L_7C66		;7c5e
	cp 009h		;7c60
	ld d,002h		;7c62
	jr nz,L_7C6F		;7c64
L_7C66:
	ld a,(0ca50h)		;7c66
	cp d			;7c69
	jr nz,L_7C6F		;7c6a
	inc b			;7c6c
	jr L_7C6F		;7c6d
L_7C6F:
	ld a,b			;7c6f
	ld (hl),a			;7c70
	xor c			;7c71
	ret z			;7c72
	ld a,c			;7c73
	and a			;7c74
	jr z,L_7CA7		;7c75
L_7C77:
	ld a,(0caf6h)		;7c77
	and a			;7c7a
	jr nz,L_7C82		;7c7b
	ld a,(0c697h)		;7c7d
	and a			;7c80
	ret nz			;7c81
L_7C82:
	call L_7CE6		;7c82
L_7C85:
	ld de,(0ca19h)		;7c85
	call 00020h		;7c89   ; BIOS DCOMPR - Compares HL with DE
	jr z,L_7C9F		;7c8c
	ld (0ca20h),hl		;7c8e
	ld (0ca19h),hl		;7c91
	ld hl,0ca18h		;7c94
	ld a,(hl)			;7c97
	and a			;7c98
	ret nz			;7c99
	ld (hl),078h		;7c9a
	jp L_6BE4		;7c9c
L_7C9F:
	call L_6BE0		;7c9f
	xor a			;7ca2
	ld (0ca18h),a		;7ca3
	ret			;7ca6
L_7CA7:
	call L_7CBB		;7ca7
	ld hl,06a11h		;7caa
	jr L_7C85		;7cad
L_7CAF:
	call L_7CBB		;7caf
	jp 041b0h		;7cb2
L_7CB5:
	call L_7CBB		;7cb5
	jp 041c5h		;7cb8
L_7CBB:
	ld hl,0ca5fh		;7cbb
	ld a,(hl)			;7cbe
	and a			;7cbf
	ret z			;7cc0
	ld (hl),000h		;7cc1
	call 04142h		;7cc3
	call 09431h		;7cc6
	call 094dah		;7cc9
	call 040f0h		;7ccc
	call 05f98h		;7ccf
	call 0439dh		;7cd2
	ld a,(0cb00h)		;7cd5
	sub 011h		;7cd8
	cp 002h		;7cda
	jp nc,0438ah		;7cdc
	jp 0437eh		;7cdf
L_7CE2:
	ld hl,06b8dh		;7ce2
	ret			;7ce5
L_7CE6:
	call 041a0h		;7ce6
	call L_7CEF		;7ce9
	jp 040f0h		;7cec
L_7CEF:
	ld a,(0d433h)		;7cef
	and a			;7cf2
	jr nz,L_7CFB		;7cf3
	ld a,(0d430h)		;7cf5
	dec a			;7cf8
	jr z,L_7CE2		;7cf9
L_7CFB:
	ld a,(0ca5fh)		;7cfb
	and a			;7cfe
	jr nz,L_7D19		;7cff
	ld a,(0d4e2h)		;7d01
	ld hl,06b91h		;7d04
	and a			;7d07
	ret nz			;7d08
	ld a,(0d4e3h)		;7d09
	ld hl,06b85h		;7d0c
	and a			;7d0f
	ret nz			;7d10
	ld a,(0d4e4h)		;7d11
	ld hl,06b8dh		;7d14
	and a			;7d17
	ret nz			;7d18
L_7D19:
	ld a,(0ca22h)		;7d19
	ld hl,0b40ch		;7d1c
	call 043f6h		;7d1f
L_7D22:
	ld a,(hl)			;7d22
	inc a			;7d23
	jr z,L_7D39		;7d24
	inc a			;7d26
	jr z,L_7D32		;7d27
	ld a,(0ca4ah)		;7d29
	cp (hl)			;7d2c
	jr z,L_7D46		;7d2d
	inc hl			;7d2f
	jr L_7D22		;7d30
L_7D32:
	call L_7D3F		;7d32
	inc hl			;7d35
	inc hl			;7d36
	jr L_7D22		;7d37
L_7D39:
	inc hl			;7d39
	ld a,(hl)			;7d3a
	inc hl			;7d3b
	ld h,(hl)			;7d3c
	ld l,a			;7d3d
	ret			;7d3e
L_7D3F:
	ld a,(hl)			;7d3f
	inc hl			;7d40
	cp 0feh		;7d41
	ret z			;7d43
	jr L_7D3F		;7d44
L_7D46:
	call L_7D3F		;7d46
	ld e,(hl)			;7d49
	inc hl			;7d4a
	ld d,(hl)			;7d4b
	ex de,hl			;7d4c
	ld a,(0ca22h)		;7d4d
	cp 003h		;7d50
	ret nz			;7d52
	ld a,(0ca4ah)		;7d53
	cp 009h		;7d56
	ret nz			;7d58
	ld a,(0d690h)		;7d59
	ld b,a			;7d5c
	ld a,(0d67ch)		;7d5d
	or b			;7d60
	ret nz			;7d61
	ld hl,06b91h		;7d62
	ret			;7d65
L_7D66:
	ld hl,07d95h		;7d66
	ld b,004h		;7d69
L_7D6B:
	push de			;7d6b
	push bc			;7d6c
	ld b,003h		;7d6d
L_7D6F:
	push bc			;7d6f
	push hl			;7d70
	push de			;7d71
	ld a,(hl)			;7d72
	ld l,078h		;7d73
	ld h,a			;7d75
	inc a			;7d76
	jr nz,L_7D7C		;7d77
	ld hl,00060h		;7d79
L_7D7C:
	ld bc,00808h		;7d7c
	call 0473bh		;7d7f
	pop de			;7d82
	pop hl			;7d83
	pop bc			;7d84
	inc hl			;7d85
	ld a,d			;7d86
	add a,008h		;7d87
	ld d,a			;7d89
	djnz L_7D6F		;7d8a
	pop bc			;7d8c
	pop de			;7d8d
	ld a,e			;7d8e
	add a,008h		;7d8f
	ld e,a			;7d91
	djnz L_7D6B		;7d92
	ret			;7d94

; ----------------------------------------------------------------------
; DATOS sin identificar  0x7d95..0x7da9  (20 bytes)
DATA_7D95:
	defb 008h,008h,020h,0ffh,0ffh,028h,000h,000h,018h,010h,010h,030h,0ddh,046h,00bh,0ddh	; 7d95  .. ..(.....0.F..
	defb 04eh,00ah,018h,00ch	; 7da5

; ======================================================================
; CODIGO 0x7da9..0x7db8  (15 bytes)
; ======================================================================


L_7DA9:
	ld b,a			;7da9
	ld a,(0d433h)		;7daa
	and a			;7dad
	ld a,b			;7dae
	ret nz			;7daf
	ld bc,(0ca50h)		;7db0
	dec a			;7db4
	call 0424dh		;7db5

; ----------------------------------------------------------------------
; DATOS sin identificar  0x7db8..0x7dc0  (8 bytes)
DATA_7DB8:
	defb 0c0h,07dh,0c3h,07dh,0c6h,07dh,0c9h,07dh	; 7db8  .}.}.}.}

; ======================================================================
; CODIGO 0x7dc0..0x7ddc  (28 bytes)
; ======================================================================


L_7DC0:
	inc c			;7dc0
	jr L_7DCA		;7dc1
L_7DC3:
	dec c			;7dc3
	jr L_7DCA		;7dc4
L_7DC6:
	dec b			;7dc6
	jr L_7DCA		;7dc7
L_7DC9:
	inc b			;7dc9
L_7DCA:
	ld l,c			;7dca
	ld h,000h		;7dcb
	add hl,hl			;7dcd
	add hl,hl			;7dce
	add hl,hl			;7dcf
	add hl,hl			;7dd0
	ld a,b			;7dd1
	call 0423eh		;7dd2
	ld de,0d900h		;7dd5
	add hl,de			;7dd8
	ld a,(hl)			;7dd9
	inc a			;7dda
	ret			;7ddb

; ----------------------------------------------------------------------
; DATOS sin identificar  0x7ddc..0x7de2  (6 bytes)
DATA_7DDC:
	defb 0cdh,0e2h,07dh,0c3h,0c2h,041h	; 7ddc

; ======================================================================
; CODIGO 0x7de2..0x7edb  (249 bytes)
; ======================================================================


L_7DE2:
	call L_7E0D		;7de2
	call 041adh		;7de5
	call 0a4ebh		;7de8
	call 041d2h		;7deb
	call 0a20dh		;7dee
	jp 040f0h		;7df1
L_7DF4:
	ld a,(0ca42h)		;7df4
	push af			;7df7
	xor 001h		;7df8
	ld (0ca42h),a		;7dfa
	call L_7E0D		;7dfd
	call 041d2h		;7e00
	call 0a20dh		;7e03
	pop af			;7e06
	ld (0ca42h),a		;7e07
	jp 040f0h		;7e0a
L_7E0D:
	call 08ba0h		;7e0d
	call L_7E22		;7e10
	call L_7E7E		;7e13
	call L_7E3C		;7e16
	call 041a0h		;7e19
	call 0aac8h		;7e1c
	jp 0ab21h		;7e1f
L_7E22:
	call L_7E29		;7e22
	ret nz			;7e25
	jp 08535h		;7e26
L_7E29:
	ld a,(0ca4ah)		;7e29
	cp 00ah		;7e2c
	ret nz			;7e2e
	ld a,(0ca4bh)		;7e2f
	cp 004h		;7e32
	ret nz			;7e34
	ld a,(0d7dah)		;7e35
	cpl			;7e38
	bit 0,a		;7e39
	ret			;7e3b
L_7E3C:
	ld a,(0ca65h)		;7e3c
	or a			;7e3f
	ret nz			;7e40
	call 0418eh		;7e41
	call L_7E4A		;7e44
	jp 040f0h		;7e47
L_7E4A:
	ld bc,(0ca50h)		;7e4a
	call L_7BFC		;7e4e
	ld c,a			;7e51
	ld hl,0a7cdh		;7e52
L_7E55:
	ld a,(hl)			;7e55
	cp 0ffh		;7e56
	ret z			;7e58
	push hl			;7e59
	ld a,(0ca4ah)		;7e5a
	cp (hl)			;7e5d
	jr nz,L_7E6E		;7e5e
	inc hl			;7e60
	ld a,c			;7e61
	cp (hl)			;7e62
	jr nz,L_7E6E		;7e63
	inc hl			;7e65
	ld e,(hl)			;7e66
	inc hl			;7e67
	ld d,(hl)			;7e68
	push bc			;7e69
	call L_7E75		;7e6a
	pop bc			;7e6d
L_7E6E:
	pop hl			;7e6e
	ld de,00004h		;7e6f
	add hl,de			;7e72
	jr L_7E55		;7e73
L_7E75:
	ld bc,00203h		;7e75
	ld hl,0a7c7h		;7e78
	jp 050c4h		;7e7b
L_7E7E:
	ld hl,0bd9bh		;7e7e
	ld a,(0ca76h)		;7e81
	cp 038h		;7e84
	jr z,L_7E98		;7e86
	ld hl,0bd7dh		;7e88
	ld a,(0ca4ah)		;7e8b
	cp 012h		;7e8e
	jr z,L_7E98		;7e90
	ld hl,0bd8eh		;7e92
	cp 013h		;7e95
	ret nz			;7e97
L_7E98:
	call 041a0h		;7e98
L_7E9B:
	ld a,(hl)			;7e9b
	cp 0ffh		;7e9c
	jp z,040f0h		;7e9e
	push hl			;7ea1
	call L_7EAC		;7ea2
	pop hl			;7ea5
	ld de,00004h		;7ea6
	add hl,de			;7ea9
	jr L_7E9B		;7eaa
L_7EAC:
	ld a,(0ca4bh)		;7eac
	cp (hl)			;7eaf
	ret nz			;7eb0
	inc hl			;7eb1
	ld a,(hl)			;7eb2
	and 00fh		;7eb3
	add a,070h		;7eb5
	push hl			;7eb7
	call 040f0h		;7eb8
	call 0b0feh		;7ebb
	call 041a0h		;7ebe
	pop hl			;7ec1
	ret z			;7ec2
	ld a,(hl)			;7ec3
	rra			;7ec4
	rra			;7ec5
	rra			;7ec6
	rra			;7ec7
	and 00fh		;7ec8
	inc hl			;7eca
	ld e,(hl)			;7ecb
	inc hl			;7ecc
	ld d,(hl)			;7ecd
	ld hl,0bd1bh		;7ece
	call 043f6h		;7ed1
	ld b,(hl)			;7ed4
	inc hl			;7ed5
	ld c,(hl)			;7ed6
	inc hl			;7ed7
	jp 05094h		;7ed8

; ----------------------------------------------------------------------
; DATOS sin identificar  0x7edb..0x7ee5  (10 bytes)
DATA_7EDB:
	defb 0cdh,0e5h,07eh,03ah,08fh,0cah,0b7h,0c8h,018h,011h	; 7edb  ..~:......

; ======================================================================
; CODIGO 0x7ee5..0x7fff  (282 bytes)
; ======================================================================


L_7EE5:
	ld a,(0cb03h)		;7ee5
	ld e,a			;7ee8
	ld a,(0cb05h)		;7ee9
	ld d,a			;7eec
	ret			;7eed
L_7EEE:
	call L_7EE5		;7eee
	ld a,(0cb0eh)		;7ef1
	or a			;7ef4
	ret z			;7ef5
L_7EF6:
	call 0418eh		;7ef6
	call L_7EFF		;7ef9
	jp 040f0h		;7efc
L_7EFF:
	dec a			;7eff
	add a,a			;7f00
	ld c,a			;7f01
	add a,a			;7f02
	add a,c			;7f03
	ld c,a			;7f04
	ld a,b			;7f05
	ld hl,0a30ah		;7f06
	call 043f6h		;7f09
	ld a,c			;7f0c
	call 0423eh		;7f0d
	ld b,003h		;7f10
L_7F12:
	push bc			;7f12
	ld a,e			;7f13
	add a,(hl)			;7f14
	ld b,a			;7f15
	inc hl			;7f16
	push hl			;7f17
	ld a,d			;7f18
	add a,(hl)			;7f19
	ld h,a			;7f1a
	ld l,b			;7f1b
	push de			;7f1c
	call L_7F3D		;7f1d
	pop de			;7f20
	pop hl			;7f21
	inc hl			;7f22
	pop bc			;7f23
	ret c			;7f24
	push hl			;7f25
	push bc			;7f26
	ld hl,0caedh		;7f27
	ld c,a			;7f2a
	ld a,b			;7f2b
	dec a			;7f2c
	call 0423eh		;7f2d
	ld (hl),c			;7f30
	pop bc			;7f31
	pop hl			;7f32
	djnz L_7F12		;7f33
	and a			;7f35
	ret			;7f36
L_7F37:
	push hl			;7f37
	call L_7F3D		;7f38
	pop hl			;7f3b
	ret			;7f3c
L_7F3D:
	call L_7F4F		;7f3d
	call 04411h		;7f40
	ld a,(hl)			;7f43
	ld hl,0ca4eh		;7f44
	cp 081h		;7f47
	jr c,L_7F4C		;7f49
	inc hl			;7f4b
L_7F4C:
	cp (hl)			;7f4c
L_7F4D:
	ccf			;7f4d
	ret			;7f4e
L_7F4F:
	ld a,h			;7f4f
	cp 0c0h		;7f50
	call nc,L_7F61		;7f52
	ld a,l			;7f55
	cp 0c0h		;7f56
	ret c			;7f58
	cp 0e0h		;7f59
	ld l,0b8h		;7f5b
	ret c			;7f5d
	ld l,000h		;7f5e
	ret			;7f60
L_7F61:
	cp 0e0h		;7f61
	ld h,0b8h		;7f63
	ret c			;7f65
	ld h,000h		;7f66
	ret			;7f68
L_7F69:
	call L_7F4F		;7f69
	call 04411h		;7f6c
	ld a,(hl)			;7f6f
	ret			;7f70
L_7F71:
	ld a,h			;7f71
	cp 0c0h		;7f72
	jr nc,L_7F4D		;7f74
	ld a,l			;7f76
	cp 0c0h		;7f77
	jr nc,L_7F4D		;7f79
	call 04411h		;7f7b
	ld a,(hl)			;7f7e
	or a			;7f7f
	jr z,L_7F4D		;7f80
	cp 080h		;7f82
	jr z,L_7F4D		;7f84
	and a			;7f86
	ret			;7f87
L_7F88:
	call L_7F9C		;7f88
	ret nc			;7f8b
	ld b,003h		;7f8c
L_7F8E:
	push bc			;7f8e
	ld a,l			;7f8f
	add a,008h		;7f90
	ld l,a			;7f92
	call L_7F9C		;7f93
	pop bc			;7f96
	ret nc			;7f97
	djnz L_7F8E		;7f98
	scf			;7f9a
	ret			;7f9b
L_7F9C:
	ld a,l			;7f9c
	cp 0c0h		;7f9d
	ccf			;7f9f
	ret c			;7fa0
	push hl			;7fa1
	call L_7F3D		;7fa2
	pop hl			;7fa5
	ret			;7fa6
L_7FA7:
	call L_67CD		;7fa7
	call 05dcbh		;7faa
	call 04650h		;7fad
	call 0b593h		;7fb0
	call 04650h		;7fb3
	call 0a1deh		;7fb6
	call 04142h		;7fb9
	call 089c3h		;7fbc
	call 040f0h		;7fbf
	call 08bf1h		;7fc2
	call 041d5h		;7fc5
	call 0a6e1h		;7fc8
	call 0bcd1h		;7fcb
	call 0a577h		;7fce
	call 0a427h		;7fd1
	call 040f0h		;7fd4
	call 05dabh		;7fd7
	call 05dc3h		;7fda
	ld a,(0caa0h)		;7fdd
	or a			;7fe0
	jr nz,L_7FED		;7fe1
	ld a,(0ca76h)		;7fe3
	cp 026h		;7fe6
	jr nz,L_7FED		;7fe8
	call 0b5b5h		;7fea
L_7FED:
	jp L_67F5		;7fed
L_7FF0:
	call 041d5h		;7ff0
	call 08001h		;7ff3
	jp 040f0h		;7ff6
L_7FF9:
	call 041d5h		;7ff9
	call 08028h		;7ffc

; ----------------------------------------------------------------------
; DATOS sin identificar  0x7fff..0x8000  (1 bytes)
DATA_7FFF:
	defb 018h	; 7fff
