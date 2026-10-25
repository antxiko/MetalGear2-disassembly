; ==========================================================================
; METAL GEAR 2 SOLID SNAKE - Konami (1990) - MSX2 - MegaROM RC-767 de 512 KB (Konami SCC) - banco 12 (se ejecuta en 0x6000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x06000


; ----------------------------------------------------------------------
; Etiquetas que no caen en ninguna posicion emitida del listado
; (destinos fuera del binario o dentro de una instruccion).
; ----------------------------------------------------------------------
L_7BAA:	equ 0x07baa
L_7C52:	equ 0x07c52
L_7C77:	equ 0x07c77

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


L_6000:
	call 045f1h		;6000
	call 09dbdh		;6003
	xor a			;6006
	ld (0c3a0h),a		;6007
	ld (0c38dh),a		;600a
	ld (0c39fh),a		;600d
	ld (0c3a1h),a		;6010
	ld a,001h		;6013
	ld (0c3a2h),a		;6015
	ld a,(0ca42h)		;6018
	call 04452h		;601b
	ld hl,01018h		;601e
	ld bc,0381ch		;6021
	call L_603C		;6024
	ld hl,01c04h		;6027
	ld bc,08810h		;602a
	call L_603C		;602d
	ld hl,0bf74h		;6030
	call 04918h		;6033
	call L_60D3		;6036
	jp 045c5h		;6039
L_603C:
	ld a,(0ca42h)		;603c
	ld d,a			;603f
	ld a,099h		;6040
	push hl			;6042
	push de			;6043
	push bc			;6044
	call 046ffh		;6045
	pop de			;6048
	pop af			;6049
	pop hl			;604a
	ld c,007h		;604b
	jp 046bch		;604d

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


L_6055:
	ld a,(0c3a2h)		;6055
	dec a			;6058
	call 0424dh		;6059

; ----------------------------------------------------------------------
; DATOS tabla_605C: 9 destinos del despachador p00:424D (call en p12:6059, el
;   indice en A): 606E, 6155, 62B4, 62F7, 63F3, 6413, 63F3, 643A, 6458; lo
;   leen p12:6059 (18 bytes)
;   0x605c..0x606e  (18 bytes)
DATA_tabla_605C:
	defw 0606eh,06155h,062b4h,062f7h,063f3h,06413h,063f3h,0643ah	; 605c
	defw 06458h	; 606c  -> L_6458

; ======================================================================
; CODIGO 0x606e..0x64ff  (1169 bytes)
; ======================================================================


L_606E:
	call L_63FC		;606e
	ret nz			;6071
	ld a,(0ca07h)		;6072
	rra			;6075
	jr c,L_6080		;6076
	rra			;6078
	jr c,L_6080		;6079
	and 00ch		;607b
	jr nz,L_608D		;607d
	ret			;607f
L_6080:
	call 05f49h		;6080
	ld hl,0c39fh		;6083
	ld a,(hl)			;6086
	xor 001h		;6087
	ld (hl),a			;6089
	jp L_60D3		;608a
L_608D:
	ld a,(0c38bh)		;608d
	ld c,010h		;6090
	and a			;6092
	jr z,L_609D		;6093
	cp 003h		;6095
	ld c,01ch		;6097
	jr c,L_609D		;6099
	ld c,028h		;609b
L_609D:
	ld hl,05818h		;609d
	ld b,058h		;60a0
	call L_603C		;60a2
	ld hl,0bf95h		;60a5
	call 04918h		;60a8
	ld hl,0bfa0h		;60ab
	ld a,(0c38bh)		;60ae
	rra			;60b1
	call c,04918h		;60b2
	ld a,(0c38bh)		;60b5
	sub 002h		;60b8
	jr c,L_60CB		;60ba
	ld de,06828h		;60bc
	jr z,L_60C3		;60bf
	ld e,034h		;60c1
L_60C3:
	ld hl,06050h		;60c3
	ld c,0ffh		;60c6
	call 04922h		;60c8
L_60CB:
	call L_60EF		;60cb
L_60CE:
	ld hl,0c3a2h		;60ce
	inc (hl)			;60d1
	ret			;60d2
L_60D3:
	ld a,(0c39fh)		;60d3
	and a			;60d6
	ld de,0181ch		;60d7
	jr z,L_60FF		;60da
	ld e,028h		;60dc
	jr L_60FF		;60de
L_60E0:
	ld a,(0c3a0h)		;60e0
	ld de,06054h		;60e3
	add a,a			;60e6
	add a,a			;60e7
	add a,a			;60e8
	add a,a			;60e9
	call 04243h		;60ea
	jr L_6132		;60ed
L_60EF:
	ld de,0601ch		;60ef
	ld a,(0c38dh)		;60f2
	add a,a			;60f5
	add a,a			;60f6
	ld b,a			;60f7
	add a,a			;60f8
	add a,b			;60f9
	call 04243h		;60fa
	jr L_6112		;60fd
L_60FF:
	push de			;60ff
	ld hl,0181ch		;6100
	ld bc,00814h		;6103
	ld a,(0ca42h)		;6106
	ld d,a			;6109
	ld a,099h		;610a
	call 046ffh		;610c
	pop de			;610f
	jr L_6143		;6110
L_6112:
	push de			;6112
	ld a,(0c38bh)		;6113
	and a			;6116
	jr z,L_612F		;6117
	cp 003h		;6119
	ld c,014h		;611b
	jr c,L_6121		;611d
	ld c,020h		;611f
L_6121:
	ld hl,0601ch		;6121
	ld b,008h		;6124
	ld a,(0ca42h)		;6126
	ld d,a			;6129
	ld a,099h		;612a
	call 046ffh		;612c
L_612F:
	pop de			;612f
	jr L_6143		;6130
L_6132:
	push de			;6132
	ld hl,06054h		;6133
	ld bc,00828h		;6136
	ld a,(0ca42h)		;6139
	ld d,a			;613c
	ld a,099h		;613d
	call 046ffh		;613f
	pop de			;6142
L_6143:
	ld hl,05038h		;6143
	ld bc,00808h		;6146
	ld a,(0ca42h)		;6149
	rrca			;614c
	rrca			;614d
	rrca			;614e
	rrca			;614f
	or 0c8h		;6150
	jp 047edh		;6152
L_6155:
	call L_63FC		;6155
	ret nz			;6158
	ld hl,0c38dh		;6159
	ld a,(0c38bh)		;615c
	ld b,002h		;615f
	and a			;6161
	jr z,L_6175		;6162
	cp 003h		;6164
	jr c,L_6169		;6166
	inc b			;6168
L_6169:
	ld a,(0ca07h)		;6169
	rra			;616c
	jr c,L_61CE		;616d
	rra			;616f
	jr c,L_61D7		;6170
	and 00ch		;6172
	ret z			;6174
L_6175:
	call L_61F3		;6175
	ld a,(0c38dh)		;6178
	and a			;617b
	jr z,L_6187		;617c
	call L_61E4		;617e
	call L_60E0		;6181
	jp L_60CE		;6184
L_6187:
	ld a,008h		;6187
	ld (0c3a2h),a		;6189
	xor a			;618c
	ld (0c3a1h),a		;618d
	ld hl,00c38h		;6190
	ld bc,0a888h		;6193
	call L_603C		;6196
	ld a,(0c39fh)		;6199
	and a			;619c
	jr nz,L_61A8		;619d
	call 041efh		;619f
	call 0ba98h		;61a2
	jp 041a0h		;61a5
L_61A8:
	ld hl,0e900h		;61a8
	ld bc,004ffh		;61ab
	call 04236h		;61ae
	ld hl,0c7c0h		;61b1
	ld bc,0023fh		;61b4
	call 04236h		;61b7
	ld hl,0c900h		;61ba
	ld bc,000ffh		;61bd
	ld a,0ffh		;61c0
	call 04237h		;61c2
	call 041efh		;61c5
	call 0bba7h		;61c8
	jp 041a0h		;61cb
L_61CE:
	ld a,(hl)			;61ce
	sub 001h		;61cf
	jr nc,L_61DD		;61d1
	ld a,b			;61d3
	dec a			;61d4
	jr L_61DD		;61d5
L_61D7:
	ld a,(hl)			;61d7
	inc a			;61d8
	cp b			;61d9
	jr c,L_61DD		;61da
	xor a			;61dc
L_61DD:
	ld (hl),a			;61dd
	call 05f49h		;61de
	jp L_60EF		;61e1
L_61E4:
	ld hl,05850h		;61e4
	ld bc,05830h		;61e7
	call L_603C		;61ea
	ld hl,0bfa7h		;61ed
	jp 04918h		;61f0
L_61F3:
	ld a,(0c39fh)		;61f3
	and a			;61f6
	ret nz			;61f7
L_61F8:
	call 041efh		;61f8
	call 0bf36h		;61fb
	call 041a0h		;61fe
	ld a,(0ca4ah)		;6201
	cp 004h		;6204
	jr nz,L_621A		;6206
	ld hl,0d7d4h		;6208
	ld a,(hl)			;620b
	rra			;620c
	jr c,L_621A		;620d
	res 1,(hl)		;620f
	ld hl,0d7deh		;6211
	set 4,(hl)		;6214
	xor a			;6216
	ld (0caa0h),a		;6217
L_621A:
	ld hl,0c706h		;621a
	ld a,(0ca22h)		;621d
	ld (hl),a			;6220
	inc hl			;6221
	ld a,(0caa0h)		;6222
	ld (hl),a			;6225
	inc hl			;6226
	ld a,(0cab5h)		;6227
	ld (hl),a			;622a
	inc hl			;622b
	ld a,(0d430h)		;622c
	ld (hl),a			;622f
	ld hl,0d880h		;6230
	call L_62A4		;6233
	ld a,c			;6236
	ld (0c70ah),a		;6237
	ld hl,0d888h		;623a
	call L_62A4		;623d
	ld a,c			;6240
	ld (0c70bh),a		;6241
	ld hl,0d7d0h		;6244
	ld de,0c70ch		;6247
	ld bc,00015h		;624a
	ldir		;624d
	ld hl,0d7f0h		;624f
	ld de,0c721h		;6252
	ld bc,00005h		;6255
	ldir		;6258
	ld de,0d600h		;625a
	ld hl,0c726h		;625d
	ld c,006h		;6260
L_6262:
	ld b,008h		;6262
L_6264:
	ld a,(de)			;6264
	rra			;6265
	rl (hl)		;6266
	inc de			;6268
	inc de			;6269
	inc de			;626a
	inc de			;626b
	djnz L_6264		;626c
	inc hl			;626e
	dec c			;626f
	jr nz,L_6262		;6270
	ld hl,0d601h		;6272
	ld de,0c72ch		;6275
	ld b,030h		;6278
L_627A:
	ld a,(hl)			;627a
	ld (de),a			;627b
	inc de			;627c
	inc hl			;627d
	inc hl			;627e
	inc hl			;627f
	inc hl			;6280
	djnz L_627A		;6281
	ld hl,0d602h		;6283
	ld de,0c75ch		;6286
	ld b,018h		;6289
L_628B:
	ld a,(hl)			;628b
	rlca			;628c
	rlca			;628d
	rlca			;628e
	rlca			;628f
	and 0f0h		;6290
	ld c,a			;6292
	inc hl			;6293
	inc hl			;6294
	inc hl			;6295
	inc hl			;6296
	ld a,(hl)			;6297
	and 00fh		;6298
	or c			;629a
	ld (de),a			;629b
	inc de			;629c
	inc hl			;629d
	inc hl			;629e
	inc hl			;629f
	inc hl			;62a0
	djnz L_628B		;62a1
	ret			;62a3
L_62A4:
	ld c,000h		;62a4
	ld b,008h		;62a6
L_62A8:
	ld a,(hl)			;62a8
	inc a			;62a9
	or a			;62aa
	jr nz,L_62AE		;62ab
	scf			;62ad
L_62AE:
	rl c		;62ae
	inc hl			;62b0
	djnz L_62A8		;62b1
	ret			;62b3
L_62B4:
	call L_63FC		;62b4
	ret nz			;62b7
	ld hl,0c3a0h		;62b8
	ld a,(0ca07h)		;62bb
	rra			;62be
	jr c,L_62E8		;62bf
	rra			;62c1
	jr c,L_62DF		;62c2
	and 00ch		;62c4
	ret z			;62c6
	call 05f41h		;62c7
	ld a,(0c38dh)		;62ca
	cp 002h		;62cd
	jr z,L_62D9		;62cf
	ld a,(0c38bh)		;62d1
	cp 002h		;62d4
	jp nz,L_60CE		;62d6
L_62D9:
	ld a,006h		;62d9
	ld (0c3a2h),a		;62db
	ret			;62de
L_62DF:
	ld a,(hl)			;62df
	inc a			;62e0
	cp 003h		;62e1
	jr c,L_62F0		;62e3
	xor a			;62e5
	jr L_62F0		;62e6
L_62E8:
	ld a,(hl)			;62e8
	dec a			;62e9
	cp 0ffh		;62ea
	jr nz,L_62F0		;62ec
	ld a,002h		;62ee
L_62F0:
	ld (hl),a			;62f0
	call 05f49h		;62f1
	jp L_60E0		;62f4
L_62F7:
	call L_6480		;62f7
	call 05f45h		;62fa
	ld a,(0c3a1h)		;62fd
	cp 002h		;6300
	jr nz,L_630F		;6302
	ld a,040h		;6304
	ld (0c3a3h),a		;6306
	call 05f4dh		;6309
	jp L_60CE		;630c
L_630F:
	ld a,(0c39fh)		;630f
	and a			;6312
	jr nz,L_631E		;6313
	ld hl,0bfc2h		;6315
	call 04918h		;6318
	jp L_60CE		;631b
L_631E:
	call L_6327		;631e
	ld a,0ffh		;6321
	ld (0c3a2h),a		;6323
	ret			;6326
L_6327:
	ld a,(0ca42h)		;6327
	push af			;632a
	ld hl,0ca20h		;632b
	ld bc,026deh		;632e
	call 04236h		;6331
	pop af			;6334
	ld (0ca42h),a		;6335
	ld hl,0c700h		;6338
	ld a,(hl)			;633b
	ld (0ca4ah),a		;633c
	inc hl			;633f
	ld a,(hl)			;6340
	ld (0ca76h),a		;6341
	inc hl			;6344
	ld a,(hl)			;6345
	ld (0cb03h),a		;6346
	inc hl			;6349
	ld a,(hl)			;634a
	ld (0cb05h),a		;634b
	inc hl			;634e
	ld a,(hl)			;634f
	ld (0ca50h),a		;6350
	inc hl			;6353
	ld a,(hl)			;6354
	ld (0ca51h),a		;6355
	inc hl			;6358
	ld a,(hl)			;6359
	ld (0ca22h),a		;635a
	inc hl			;635d
	ld a,(hl)			;635e
	ld (0caa0h),a		;635f
	inc hl			;6362
	ld a,(hl)			;6363
	ld (0cab5h),a		;6364
	inc hl			;6367
	ld a,(hl)			;6368
	ld (0d430h),a		;6369
	ld hl,0d880h		;636c
	ld a,(0c70ah)		;636f
	call L_63DE		;6372
	ld hl,0d888h		;6375
	ld a,(0c70bh)		;6378
	call L_63DE		;637b
	ld hl,0c70ch		;637e
	ld de,0d7d0h		;6381
	ld bc,00015h		;6384
	ldir		;6387
	ld hl,0c721h		;6389
	ld de,0d7f0h		;638c
	ld bc,00005h		;638f
	ldir		;6392
	ld hl,0c726h		;6394
	ld de,0d600h		;6397
	ld c,006h		;639a
L_639C:
	ld b,008h		;639c
L_639E:
	xor a			;639e
	rl (hl)		;639f
	rla			;63a1
	ld (de),a			;63a2
	inc de			;63a3
	inc de			;63a4
	inc de			;63a5
	inc de			;63a6
	djnz L_639E		;63a7
	inc hl			;63a9
	dec c			;63aa
	jr nz,L_639C		;63ab
	ld hl,0c72ch		;63ad
	ld de,0d601h		;63b0
	ld b,030h		;63b3
L_63B5:
	ld a,(hl)			;63b5
	ld (de),a			;63b6
	inc hl			;63b7
	inc de			;63b8
	inc de			;63b9
	inc de			;63ba
	inc de			;63bb
	djnz L_63B5		;63bc
	ld hl,0c75ch		;63be
	ld de,0d602h		;63c1
	ld b,018h		;63c4
L_63C6:
	ld a,(hl)			;63c6
	rrca			;63c7
	rrca			;63c8
	rrca			;63c9
	rrca			;63ca
	and 00fh		;63cb
	ld (de),a			;63cd
	inc de			;63ce
	inc de			;63cf
	inc de			;63d0
	inc de			;63d1
	ld a,(hl)			;63d2
	and 00fh		;63d3
	ld (de),a			;63d5
	inc hl			;63d6
	inc de			;63d7
	inc de			;63d8
	inc de			;63d9
	inc de			;63da
	djnz L_63C6		;63db
	ret			;63dd
L_63DE:
	ld c,a			;63de
	ld b,008h		;63df
L_63E1:
	rl c		;63e1
	ld a,000h		;63e3
	jr nc,L_63E9		;63e5
	ld a,0ffh		;63e7
L_63E9:
	ld (hl),a			;63e9
	inc hl			;63ea
	djnz L_63E1		;63eb
	ld a,001h		;63ed
	ld (0ca40h),a		;63ef
	ret			;63f2
L_63F3:
	ld hl,0c3a3h		;63f3
	ld a,(hl)			;63f6
	and a			;63f7
	jr z,L_63FC		;63f8
	dec (hl)			;63fa
	ret			;63fb
L_63FC:
	ld a,(0ca09h)		;63fc
	and 01fh		;63ff
	ret z			;6401
	ld a,(0ca00h)		;6402
	cp 005h		;6405
	jr nz,L_640C		;6407
	call 05de2h		;6409
L_640C:
	xor a			;640c
	ld (0c3a2h),a		;640d
	or 001h		;6410
	ret			;6412
L_6413:
	call L_6628		;6413
	call 05f45h		;6416
	ld a,(0c3a1h)		;6419
	and a			;641c
	jr z,L_642A		;641d
	ld a,040h		;641f
	ld (0c3a3h),a		;6421
	call 05f4dh		;6424
	jp L_60CE		;6427
L_642A:
	ld a,(0c39fh)		;642a
	and a			;642d
	jp nz,L_631E		;642e
	ld hl,0bfc2h		;6431
	call 04918h		;6434
	jp L_60CE		;6437
L_643A:
	ld a,(0c39fh)		;643a
	and a			;643d
	jp z,L_63FC		;643e
	call 041efh		;6441
	call 0bbech		;6444
	call 041a0h		;6447
	ld a,(0c3a1h)		;644a
	and a			;644d
	jp z,L_63FC		;644e
	dec a			;6451
	jp z,L_631E		;6452
	jp L_60CE		;6455
L_6458:
	ld a,(0ca07h)		;6458
	and a			;645b
	jp z,L_63FC		;645c
	xor a			;645f
	ld (0c7c4h),a		;6460
	ld (0c3a1h),a		;6463
	ld a,008h		;6466
	ld (0c3a2h),a		;6468
	ld hl,00c38h		;646b
	ld bc,0a888h		;646e
	call L_603C		;6471
	call 041efh		;6474
	call 0bc7fh		;6477
	call 0bba7h		;647a
	jp 041a0h		;647d
L_6480:
	di			;6480
	ld bc,00600h		;6481
	call 00047h		;6484   ; BIOS WRTVDP - Writes data in the VDP-register
	di			;6487
	ld a,(0fd9ah)		;6488
	ld (0c394h),a		;648b
	ld a,0c9h		;648e
	ld (0fd9ah),a		;6490
	ld (0c392h),sp		;6493
	call L_6595		;6497
	call L_651F		;649a
	call L_64C9		;649d
	call L_6502		;64a0
	call L_64BB		;64a3
	call L_64EF		;64a6
	di			;64a9
	call L_65C1		;64aa
	ld a,(0c394h)		;64ad
	ld (0fd9ah),a		;64b0
	ld bc,01600h		;64b3
	call 00047h		;64b6   ; BIOS WRTVDP - Writes data in the VDP-register
	ei			;64b9
	ret			;64ba
L_64BB:
	ld de,0c700h		;64bb
	ld c,01ah		;64be
	call 0f37dh		;64c0
	ld hl,00073h		;64c3
	jp L_6577		;64c6
L_64C9:
	ld a,(0c39fh)		;64c9
	and a			;64cc
	jr z,L_64DF		;64cd
	ld de,(0c390h)		;64cf
	ld c,00fh		;64d3
	call 0f37dh		;64d5
	ld c,001h		;64d8
	inc a			;64da
	jp z,0ad94h		;64db
	ret			;64de
L_64DF:
	ld de,(0c390h)		;64df
	ld c,016h		;64e3
	call 0f37dh		;64e5
	ld c,005h		;64e8
	inc a			;64ea
	jp z,0ad94h		;64eb
	ret			;64ee
L_64EF:
	ld de,(0c390h)		;64ef
	ld c,010h		;64f3
	call 0f37dh		;64f5
	ld c,002h		;64f8
	inc a			;64fa
	jp z,0ad94h		;64fb
	ret			;64fe

; ----------------------------------------------------------------------
; DATOS sin identificar  0x64ff..0x6502  (3 bytes)
DATA_64FF:
	defb 022h,090h,0c3h	; 64ff

; ======================================================================
; CODIGO 0x6502..0x6546  (68 bytes)
; ======================================================================


L_6502:
	ld hl,(0c390h)		;6502
	ld bc,0000ch		;6505
	add hl,bc			;6508
	ld (hl),b			;6509
	inc hl			;650a
	ld (hl),b			;650b
	inc hl			;650c
	ld bc,00001h		;650d
	ld (hl),c			;6510
	inc hl			;6511
	ld (hl),b			;6512
	ld bc,00011h		;6513
	add hl,bc			;6516
	ld b,005h		;6517
	xor a			;6519
L_651A:
	ld (hl),a			;651a
	inc hl			;651b
	djnz L_651A		;651c
	ret			;651e
L_651F:
	ld a,(0c3a0h)		;651f
	ld b,a			;6522
	add a,a			;6523
	ld c,a			;6524
	add a,a			;6525
	add a,a			;6526
	add a,b			;6527
	add a,c			;6528
	ld hl,06546h		;6529
	call 0423eh		;652c
	ld de,0c3b0h		;652f
	ld (0c390h),de		;6532
	xor a			;6536
	ld (de),a			;6537
	inc de			;6538
	ld bc,0000bh		;6539
	ldir		;653c
	xor a			;653e
	ld b,019h		;653f
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


L_6567:
	ld de,(0c390h)		;6567
	ld c,026h		;656b
	call 0f37dh		;656d
	ld c,004h		;6570
	or a			;6572
	jp nz,0ad94h		;6573
	ret			;6576
L_6577:
	ld a,(0c39fh)		;6577
	and a			;657a
	jr z,L_6567		;657b
	ld de,(0c390h)		;657d
	ld c,027h		;6581
	call 0f37dh		;6583
	ld c,000h		;6586
	or a			;6588
	jp nz,0ad94h		;6589
	ret			;658c
L_658D:
	ld a,(0c386h)		;658d
	ld h,080h		;6590
	jp 00024h		;6592   ; BIOS ENASLT - Switches to specified slot and page definitively
L_6595:
	call L_658D		;6595
	ld hl,09600h		;6598
	ld de,0dd00h		;659b
	ld bc,01680h		;659e
L_65A1:
	push bc			;65a1
	ld b,(hl)			;65a2
	ld a,(de)			;65a3
	ld (hl),a			;65a4
	ld a,b			;65a5
	ld (de),a			;65a6
	inc hl			;65a7
	inc de			;65a8
	pop bc			;65a9
	dec bc			;65aa
	ld a,b			;65ab
	or c			;65ac
	jr nz,L_65A1		;65ad
	ld hl,00000h		;65af
	ld (0f1c0h),hl		;65b2
	ld hl,0ad5ah		;65b5
	ld (0f323h),hl		;65b8
	ld a,(0c388h)		;65bb
	jp 0013bh		;65be   ; BIOS WSLREG - Writes value to the primary slot register
L_65C1:
	call L_65C6		;65c1
	jr L_6595		;65c4
L_65C6:
	ld b,000h		;65c6
L_65C8:
	push bc			;65c8
	call 0c39ah		;65c9
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


L_6628:
	di			;6628
	ld bc,00600h		;6629
	call 00047h		;662c   ; BIOS WRTVDP - Writes data in the VDP-register
	di			;662f
	ld a,(0fd9ah)		;6630
	ld (0c394h),a		;6633
	ld a,0c9h		;6636
	ld (0fd9ah),a		;6638
	ld (0c392h),sp		;663b
	call L_6666		;663f
	call L_6692		;6642
	ld a,(0c394h)		;6645
	ld (0fd9ah),a		;6648
	ld bc,01600h		;664b
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


L_6666:
	ld a,(0c3a0h)		;6666
	ld b,a			;6669
	add a,a			;666a
	add a,a			;666b
	add a,b			;666c
	ld hl,06657h		;666d
	call 0423eh		;6670
	ld de,0c3b0h		;6673
	ld (0c390h),de		;6676
	ld bc,00005h		;667a
	ldir		;667d
	ld de,0c3b5h		;667f
	xor a			;6682
	ld b,008h		;6683
L_6685:
	ld (de),a			;6685
	inc de			;6686
	djnz L_6685		;6687
	inc de			;6689
	inc de			;668a
	inc de			;668b
	inc de			;668c
	ld a,(0c399h)		;668d
	ld (de),a			;6690
	ret			;6691
L_6692:
	ld a,(0c39fh)		;6692
	and a			;6695
	jr nz,L_66A1		;6696
	ld de,(0c390h)		;6698
	ld c,000h		;669c
	call L_66D4		;669e
L_66A1:
	ld de,(0c390h)		;66a1
	ld c,002h		;66a5
	call L_66F5		;66a7
	ld hl,06653h		;66aa
	ld de,0c3bdh		;66ad
	ld bc,00004h		;66b0
	ldir		;66b3
	ld a,(0c39fh)		;66b5
	and a			;66b8
	ld c,009h		;66b9
	jr z,L_66BF		;66bb
	ld c,008h		;66bd
L_66BF:
	ld de,(0c390h)		;66bf
	call L_66F5		;66c3
	ld de,(0c390h)		;66c6
	ld c,001h		;66ca
	call L_66F5		;66cc
	xor a			;66cf
	ld (0c3a1h),a		;66d0
	ret			;66d3
L_66D4:
	push bc			;66d4
	ld a,(0c38ah)		;66d5
	ld h,080h		;66d8
	call 00024h		;66da   ; BIOS ENASLT - Switches to specified slot and page definitively
	ld a,004h		;66dd
	ld (08000h),a		;66df
	pop bc			;66e2
	ld de,(0c390h)		;66e3
	call 08000h		;66e7
	push af			;66ea
	ld a,(0c399h)		;66eb
	ld h,080h		;66ee
	call 00024h		;66f0   ; BIOS ENASLT - Switches to specified slot and page definitively
	pop af			;66f3
	ret			;66f4
L_66F5:
	call L_66D4		;66f5
	and a			;66f8
	ret z			;66f9
	push af			;66fa
	ld c,006h		;66fb
	call L_66D4		;66fd
	pop af			;6700
	cp 001h		;6701
	ld hl,0674bh		;6703
	jr z,L_6710		;6706
	sub 0f6h		;6708
	ld hl,0672ah		;670a
	call 043f6h		;670d
L_6710:
	call 04918h		;6710
	ld hl,0673eh		;6713
	call 04918h		;6716
	ld a,(0c394h)		;6719
	ld (0fd9ah),a		;671c
	ld a,002h		;671f
	ld (0c3a1h),a		;6721
	ld sp,(0c392h)		;6724
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


L_67E1:
	ld a,(0c383h)		;67e1
	push af			;67e4
	call 0418eh		;67e5
	call L_67F0		;67e8
	pop af			;67eb
	push af			;67ec
	jp 041a3h		;67ed
L_67F0:
	ld hl,0cc80h		;67f0
	ld bc,0017fh		;67f3
	call 04236h		;67f6
	ld a,(0ca76h)		;67f9
	and a			;67fc
	ret nz			;67fd
	ld a,(0ca4ah)		;67fe
	cp 007h		;6801
	jr nz,L_6816		;6803
	ld bc,00307h		;6805
	ld hl,0be9dh		;6808
	call L_683D		;680b
	ld bc,00407h		;680e
	ld hl,0bebch		;6811
	jr L_683D		;6814
L_6816:
	cp 012h		;6816
	ld bc,00208h		;6818
	ld hl,0bee7h		;681b
	jr nz,L_6826		;681e
	ld a,(0d888h)		;6820
	inc a			;6823
	jr nz,L_683D		;6824
L_6826:
	cp 00ah		;6826
	ret nz			;6828
	ld bc,00106h		;6829
	ld hl,0bec5h		;682c
	call L_683D		;682f
	ld bc,00107h		;6832
	ld hl,0bedah		;6835
	ld de,0cd50h		;6838
	jr L_6840		;683b
L_683D:
	ld de,0cd00h		;683d
L_6840:
	ld a,(hl)			;6840
	inc a			;6841
	ret z			;6842
	ld a,001h		;6843
	ld (de),a			;6845
	inc de			;6846
	inc de			;6847
	push bc			;6848
	ldi		;6849
	ldi		;684b
	pop bc			;684d
	ld a,b			;684e
	ld (de),a			;684f
	inc de			;6850
	ld a,c			;6851
	ld (de),a			;6852
	ld a,003h		;6853
	call 04243h		;6855
	jr L_6840		;6858
L_685A:
	ld a,(0ca5fh)		;685a
	and a			;685d
	ret nz			;685e
L_685F:
	ld a,(0cb00h)		;685f
	cp 011h		;6862
	ret z			;6864
	ld a,(0ca4ah)		;6865
	cp 008h		;6868
	ret z			;686a
	cp 00fh		;686b
	ret z			;686d
	ld a,(0d424h)		;686e
	and a			;6871
	ret z			;6872
	ld b,a			;6873
	ld ix,0ce00h		;6874
	ld c,000h		;6878
L_687A:
	push bc			;687a
	ld a,(ix+000h)		;687b
	and a			;687e
	call z,L_688C		;687f
	ld de,00040h		;6882
	add ix,de		;6885
	pop bc			;6887
	inc c			;6888
	djnz L_687A		;6889
	ret			;688b
L_688C:
	push bc			;688c
	push ix		;688d
	pop hl			;688f
	ld bc,0003fh		;6890
	call 04236h		;6893
	pop bc			;6896
	ld a,(0ca4ah)		;6897
	ld hl,0b086h		;689a
	call 043f6h		;689d
	ld a,c			;68a0
	add a,a			;68a1
	add a,a			;68a2
	add a,c			;68a3
	call 0423eh		;68a4
	push hl			;68a7
	inc hl			;68a8
	inc hl			;68a9
	inc hl			;68aa
	ld b,(hl)			;68ab
	call L_68B4		;68ac
	pop hl			;68af
	ret z			;68b0
	jp L_6948		;68b1
L_68B4:
	ld hl,(0ca50h)		;68b4
	ld a,b			;68b7
	call 08e75h		;68b8
	ex de,hl			;68bb
	ld a,(0ca4ah)		;68bc
	cp 00ch		;68bf
	jr z,L_68C9		;68c1
	ld a,(0ca76h)		;68c3
	and a			;68c6
	jr z,L_68CF		;68c7
L_68C9:
	ld a,h			;68c9
	cp d			;68ca
	ret nz			;68cb
	ld a,l			;68cc
	cp e			;68cd
	ret			;68ce
L_68CF:
	ld a,h			;68cf
	sub d			;68d0
	inc a			;68d1
	cp 003h		;68d2
	jr nc,L_68DF		;68d4
	ld a,l			;68d6
	sub e			;68d7
	inc a			;68d8
	cp 003h		;68d9
	jr nc,L_68DF		;68db
	xor a			;68dd
	ret			;68de
L_68DF:
	ld a,001h		;68df
	and a			;68e1
	ret			;68e2
L_68E3:
	ld a,(0ca4ah)		;68e3
	cp 008h		;68e6
	jr nz,L_68F0		;68e8
	ld a,(0caa0h)		;68ea
	cp 002h		;68ed
	ret nc			;68ef
L_68F0:
	ld hl,0ce00h		;68f0
	ld bc,005ffh		;68f3
	call 04236h		;68f6
	xor a			;68f9
	ld (0d424h),a		;68fa
	ld a,(0ca4ah)		;68fd
	ld hl,0b086h		;6900
	call 043f6h		;6903
	ld ix,0ce00h		;6906
L_690A:
	ld a,(hl)			;690a
	inc a			;690b
	jp z,L_69A6		;690c
	call L_6948		;690f
	inc hl			;6912
	ex de,hl			;6913
	ld hl,0d424h		;6914
	inc (hl)			;6917
	ex de,hl			;6918
	ld a,(0ca5fh)		;6919
	and a			;691c
	jr z,L_6929		;691d
	ld a,(ix+000h)		;691f
	and a			;6922
	jr z,L_6929		;6923
	set 7,(ix+000h)		;6925
L_6929:
	ld bc,00040h		;6929
	add ix,bc		;692c
	jr L_690A		;692e
L_6930:
	ld a,(ix+000h)		;6930
	cp 008h		;6933
	ret nz			;6935
	ld a,(0d7d4h)		;6936
	and 010h		;6939
	jr z,L_6943		;693b
	ld a,(0d7dah)		;693d
	and 001h		;6940
	ret z			;6942
L_6943:
	ld (ix+000h),000h		;6943
	ret			;6947
L_6948:
	xor a			;6948
	ld (ix+001h),a		;6949
	ld (ix+01fh),a		;694c
	ld a,(hl)			;694f
	ld c,a			;6950
	ld (ix+000h),a		;6951
	call L_6930		;6954
	ld a,c			;6957
	cp 00ch		;6958
	jr nz,L_696A		;695a
	ld a,(0ca4ah)		;695c
	cp 012h		;695f
	ld a,006h		;6961
	jr nz,L_6967		;6963
	ld a,002h		;6965
L_6967:
	ld (ix+00dh),a		;6967
L_696A:
	inc hl			;696a
	ld a,(hl)			;696b
	ld (ix+003h),a		;696c
	inc hl			;696f
	ld a,(hl)			;6970
	ld (ix+005h),a		;6971
	inc hl			;6974
	ld a,(hl)			;6975
	and a			;6976
	ld de,(0ca50h)		;6977
	call nz,08e75h		;697b
	ld (ix+00ah),e		;697e
	ld (ix+00bh),d		;6981
	inc hl			;6984
	ld a,(hl)			;6985
	and 03fh		;6986
	ld (ix+011h),a		;6988
	ld a,(hl)			;698b
	rlca			;698c
	rlca			;698d
	and 003h		;698e
	ld (ix+019h),a		;6990
	ld a,c			;6993
	ld c,003h		;6994
	cp 010h		;6996
	jr c,L_69A2		;6998
	ld c,001h		;699a
	cp 013h		;699c
	jr c,L_69A2		;699e
	ld c,0ffh		;69a0
L_69A2:
	ld (ix+010h),c		;69a2
	ret			;69a5
L_69A6:
	call L_69BD		;69a6
	ld a,(0d430h)		;69a9
	dec a			;69ac
	ret nz			;69ad
	ld ix,0d300h		;69ae
	ld hl,069b8h		;69b2
	jp L_6948		;69b5

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


L_69BD:
	ld a,(0c383h)		;69bd
	push af			;69c0
	call 041bdh		;69c1
	call 0ad58h		;69c4
	pop af			;69c7
	push af			;69c8
	jp 041a3h		;69c9
L_69CC:
	ld a,(0ca76h)		;69cc
	and a			;69cf
	ret nz			;69d0
	ld hl,0d4f8h		;69d1
	ld bc,00007h		;69d4
	call 04236h		;69d7
	call L_6B42		;69da
	jp L_6A28		;69dd
L_69E0:
	ld hl,0b326h		;69e0
	ld a,(0ca76h)		;69e3
L_69E6:
	ld b,(hl)			;69e6
	inc b			;69e7
	ret z			;69e8
	cp (hl)			;69e9
	inc hl			;69ea
	jr z,L_69F1		;69eb
	inc hl			;69ed
	inc hl			;69ee
	jr L_69E6		;69ef
L_69F1:
	ld a,(hl)			;69f1
	inc hl			;69f2
	ld h,(hl)			;69f3
	ld l,a			;69f4
	ld a,(0ca76h)		;69f5
	cp 039h		;69f8
	ld ix,0d300h		;69fa
	jr nz,L_6A0A		;69fe
	ld ix,0ce00h		;6a00
	ld a,(0d7d9h)		;6a04
	and 040h		;6a07
	ret z			;6a09
L_6A0A:
	ld a,(hl)			;6a0a
	inc a			;6a0b
	jr z,L_69BD		;6a0c
	push hl			;6a0e
	push ix		;6a0f
	pop hl			;6a11
	ld bc,0003fh		;6a12
	call 04236h		;6a15
	pop hl			;6a18
	call L_6948		;6a19
	inc hl			;6a1c
	ld (ix+01bh),001h		;6a1d
	ld bc,00040h		;6a21
	add ix,bc		;6a24
	jr L_6A0A		;6a26
L_6A28:
	ld a,(0ca4ah)		;6a28
	cp 004h		;6a2b
	ret nz			;6a2d
	ld a,(0ca4bh)		;6a2e
	cp 006h		;6a31
	jr z,L_6A4B		;6a33
	dec a			;6a35
	ret nz			;6a36
	call 04256h		;6a37
	and 003h		;6a3a
	add a,a			;6a3c
	ld hl,0b6e1h		;6a3d
	call 0423eh		;6a40
	ld bc,00101h		;6a43
	ld de,0b701h		;6a46
	jr L_6A5C		;6a49
L_6A4B:
	call 04256h		;6a4b
	and 003h		;6a4e
	ld (0d42dh),a		;6a50
	call L_6AA9		;6a53
	ld bc,00302h		;6a56
	ld de,0b709h		;6a59
L_6A5C:
	exx			;6a5c
	ld hl,0d300h		;6a5d
	ld bc,000ffh		;6a60
	call 04236h		;6a63
	exx			;6a66
	ld ix,0d300h		;6a67
L_6A6B:
	push de			;6a6b
	ld a,(0ca5fh)		;6a6c
	cp 002h		;6a6f
	ld a,00ch		;6a71
	jr c,L_6A77		;6a73
	ld a,001h		;6a75
L_6A77:
	ld (ix+000h),a		;6a77
	ld (ix+00ah),c		;6a7a
	ld (ix+00bh),006h		;6a7d
	ld (ix+010h),003h		;6a81
	ld (ix+00ch),000h		;6a85
	ld a,(hl)			;6a89
	add a,a			;6a8a
	call 04243h		;6a8b
	ld a,(de)			;6a8e
	ld (ix+003h),a		;6a8f
	inc de			;6a92
	ld a,(de)			;6a93
	ld (ix+005h),a		;6a94
	inc hl			;6a97
	ld a,(hl)			;6a98
	ld (ix+00dh),a		;6a99
	inc hl			;6a9c
	ld de,00040h		;6a9d
	add ix,de		;6aa0
	pop de			;6aa2
	djnz L_6A6B		;6aa3
	ret			;6aa5
L_6AA6:
	ld a,(0d42dh)		;6aa6
L_6AA9:
	add a,a			;6aa9
	ld b,a			;6aaa
	add a,a			;6aab
	add a,b			;6aac
	ld hl,0b6e9h		;6aad
	jp 0423eh		;6ab0
L_6AB3:
	ld a,(0ca65h)		;6ab3
	cp 00dh		;6ab6
	ret nz			;6ab8
	ld hl,0b0aeh		;6ab9
	ld ix,0d300h		;6abc
L_6AC0:
	ld a,(hl)			;6ac0
	inc a			;6ac1
	jp z,0818bh		;6ac2
	call L_6948		;6ac5
	ld (ix+01bh),002h		;6ac8
	inc hl			;6acc
	ld bc,00040h		;6acd
	add ix,bc		;6ad0
	jr L_6AC0		;6ad2
L_6AD4:
	ld a,(0c697h)		;6ad4
	and a			;6ad7
	ret nz			;6ad8
	ld a,(0d454h)		;6ad9
	and a			;6adc
	jr nz,L_6B06		;6add
	ld a,(0ca5fh)		;6adf
	and a			;6ae2
	ret nz			;6ae3
	ld a,(0ca67h)		;6ae4
	and a			;6ae7
	ret z			;6ae8
	ld a,(0d340h)		;6ae9
	and a			;6aec
	ret nz			;6aed
	ld hl,0d420h		;6aee
	dec (hl)			;6af1
	ret nz			;6af2
	ld a,001h		;6af3
	ld (0d509h),a		;6af5
	ld a,004h		;6af8
	ld (0d454h),a		;6afa
	ld hl,0d340h		;6afd
	ld bc,0003fh		;6b00
	jp 04236h		;6b03
L_6B06:
	ld hl,0d454h		;6b06
	dec (hl)			;6b09
	ret nz			;6b0a
	ld a,00bh		;6b0b
	ld (0d340h),a		;6b0d
	ld a,020h		;6b10
	ld d,a			;6b12
	ld (0d343h),a		;6b13
	ld a,0a0h		;6b16
	ld e,a			;6b18
	ld (0d345h),a		;6b19
	ld a,009h		;6b1c
	ld (0d34bh),a		;6b1e
	ld a,002h		;6b21
	ld (0d34ah),a		;6b23
	ld (0d34dh),a		;6b26
	inc a			;6b29
	ld (0d350h),a		;6b2a
	ld a,03ch		;6b2d
	ld (0d420h),a		;6b2f
	call 04256h		;6b32
	and 003h		;6b35
	inc a			;6b37
	ld (0d421h),a		;6b38
	ld hl,00000h		;6b3b
	ld (0d422h),hl		;6b3e
	ret			;6b41
L_6B42:
	ld a,(0ca4ah)		;6b42
	cp 006h		;6b45
	ret nz			;6b47
	ld a,(0ca76h)		;6b48
	and a			;6b4b
	ret nz			;6b4c
	ld hl,0d200h		;6b4d
	ld bc,001ffh		;6b50
	call 04236h		;6b53
	ld de,0d4f8h		;6b56
	ld ix,0d200h		;6b59
	ld bc,(0ca50h)		;6b5d
	ld a,c			;6b61
	rlca			;6b62
	rlca			;6b63
	rlca			;6b64
	rlca			;6b65
	or b			;6b66
	ld c,a			;6b67
	ld hl,0b431h		;6b68
L_6B6B:
	ld a,(hl)			;6b6b
	inc a			;6b6c
	ret z			;6b6d
	ld a,(hl)			;6b6e
	inc hl			;6b6f
	cp c			;6b70
	jr nz,L_6BA1		;6b71
	ld a,(hl)			;6b73
	ld (ix+003h),a		;6b74
	inc hl			;6b77
	ld a,(hl)			;6b78
	ld (ix+005h),a		;6b79
	inc hl			;6b7c
	ld a,c			;6b7d
	rrca			;6b7e
	rrca			;6b7f
	rrca			;6b80
	rrca			;6b81
	and 00fh		;6b82
	ld (ix+00ah),a		;6b84
	ld a,c			;6b87
	and 00fh		;6b88
	ld (ix+00bh),a		;6b8a
	ld a,(de)			;6b8d
	inc de			;6b8e
	and a			;6b8f
	ld a,013h		;6b90
	jr z,L_6B95		;6b92
	xor a			;6b94
L_6B95:
	ld (ix+000h),a		;6b95
	push bc			;6b98
	ld bc,00040h		;6b99
	add ix,bc		;6b9c
	pop bc			;6b9e
	jr L_6B6B		;6b9f
L_6BA1:
	inc hl			;6ba1
	inc hl			;6ba2
	jr L_6B6B		;6ba3
L_6BA5:
	call L_6BE6		;6ba5
	xor a			;6ba8
	ld (0d8a6h),a		;6ba9
	ld hl,0d800h		;6bac
	ld bc,0007fh		;6baf
	call 04236h		;6bb2
	ld a,(0ca4ah)		;6bb5
	ld hl,06bbeh		;6bb8
	call 0424dh		;6bbb

; ----------------------------------------------------------------------
; DATOS tabla_6BBE: 19 destinos del despachador p00:424D (call en p12:6BBB, el
;   indice en A): 6CDF, 6CDF, 6CDF, 6C2C, 6CDF, 6CDF, 6CDF, 6C38, 6CDF, 6CDF,
;   6C4F, 6CDF, 6CDF, 6CDF, 6C8D, 6CDF, 6CDF, 6CDF, 6C54; lo leen p12:6BBB (38
;   bytes)
;   0x6bbe..0x6be4  (38 bytes)
DATA_tabla_6BBE:
	defw 06cdfh,06cdfh,06cdfh,06c2ch,06cdfh,06cdfh,06cdfh,06c38h	; 6bbe
	defw 06cdfh,06cdfh,06c4fh,06cdfh,06cdfh,06cdfh,06c8dh,06cdfh	; 6bce
	defw 06cdfh,06cdfh,06c54h	; 6bde  -> L_6CDF L_6CDF L_6C54

; ======================================================================
; CODIGO 0x6be4..0x6c21  (61 bytes)
; ======================================================================


L_6BE4:
	ld (hl),h			;6be4
	ld l,h			;6be5
L_6BE6:
	ld hl,0d800h		;6be6
	ld b,004h		;6be9
L_6BEB:
	push hl			;6beb
	ld a,(hl)			;6bec
	ld c,a			;6bed
	and a			;6bee
	jr z,L_6C18		;6bef
	cp 00bh		;6bf1
	jr z,L_6C18		;6bf3
	inc hl			;6bf5
	ld a,(hl)			;6bf6
	ld d,a			;6bf7
	and a			;6bf8
	jr z,L_6C18		;6bf9
	ld a,c			;6bfb
	ld hl,l6c20h		;6bfc
	call 0423eh		;6bff
	ld a,d			;6c02
	ld e,a			;6c03
	cp 020h		;6c04
	jr nc,L_6C0C		;6c06
	ld e,(hl)			;6c08
	cp e			;6c09
	jr c,L_6C18		;6c0a
L_6C0C:
	ld a,c			;6c0c
	ld hl,0d87fh		;6c0d
	call 0423eh		;6c10
	ld a,(hl)			;6c13
	inc a			;6c14
	jr z,L_6C18		;6c15
	ld (hl),e			;6c17
L_6C18:
	pop hl			;6c18
	ld a,020h		;6c19
	call 0423eh		;6c1b
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


L_6C2C:
	ld hl,0a19bh		;6c2c
	call L_6C90		;6c2f
	ld a,012h		;6c32
	ld (0d80dh),a		;6c34
	ret			;6c37
L_6C38:
	ld hl,0a1a1h		;6c38
	call L_6C90		;6c3b
	ld hl,0a1d1h		;6c3e
	call L_6C95		;6c41
	ld a,(0d7d1h)		;6c44
	and 002h		;6c47
	ret nz			;6c49
	xor a			;6c4a
	ld (0d860h),a		;6c4b
	ret			;6c4e
L_6C4F:
	ld hl,0a1adh		;6c4f
	jr L_6C90		;6c52
L_6C54:
	ld hl,0a1b3h		;6c54
	call L_6C90		;6c57
	ld hl,0a1bfh		;6c5a
	ld de,0d820h		;6c5d
	call L_6C9D		;6c60
	ld hl,0a1c5h		;6c63
	ld de,0d840h		;6c66
	call L_6C9D		;6c69
	xor a			;6c6c
	ld (0d820h),a		;6c6d
	ld (0d840h),a		;6c70
	ret			;6c73
L_6C74:
	ld hl,0a1b9h		;6c74
	call L_6C90		;6c77
	ld hl,0a1cbh		;6c7a
	ld de,0d820h		;6c7d
	call L_6C9D		;6c80
	ld a,(0d884h)		;6c83
	inc a			;6c86
	ret z			;6c87
	xor a			;6c88
	ld (0d820h),a		;6c89
	ret			;6c8c
L_6C8D:
	ld hl,0a1a7h		;6c8d
L_6C90:
	ld de,0d800h		;6c90
	jr L_6C9D		;6c93
L_6C95:
	ld de,0d872h		;6c95
	ldi		;6c98
	ld de,0d860h		;6c9a
L_6C9D:
	ld a,(hl)			;6c9d
	push hl			;6c9e
	ld hl,0d87fh		;6c9f
	call 0423eh		;6ca2
	ld a,(hl)			;6ca5
	ld c,a			;6ca6
	inc c			;6ca7
	pop hl			;6ca8
	ret z			;6ca9
	push de			;6caa
	ldi		;6cab
	ld (de),a			;6cad
	inc e			;6cae
	inc e			;6caf
	ldi		;6cb0
	inc e			;6cb2
	ldi		;6cb3
	ld a,e			;6cb5
	add a,004h		;6cb6
	ld e,a			;6cb8
	ldi		;6cb9
	ldi		;6cbb
	ld a,e			;6cbd
	add a,004h		;6cbe
	ld e,a			;6cc0
	ldi		;6cc1
	pop hl			;6cc3
	ld a,(hl)			;6cc4
	cp 008h		;6cc5
	ret nz			;6cc7
	ld a,(0d88bh)		;6cc8
	inc a			;6ccb
	ret nz			;6ccc
	inc hl			;6ccd
	ld (hl),011h		;6cce
	inc hl			;6cd0
	inc hl			;6cd1
	ld (hl),080h		;6cd2
	inc hl			;6cd4
	inc hl			;6cd5
	ld (hl),078h		;6cd6
	ld a,011h		;6cd8
	call 0423eh		;6cda
	ld (hl),000h		;6cdd
L_6CDF:
	ret			;6cdf
L_6CE0:
	ld a,(0ca64h)		;6ce0
	ld hl,0caa9h		;6ce3
	or (hl)			;6ce6
	ld hl,0d7e1h		;6ce7
	jr z,L_6CF0		;6cea
	set 4,(hl)		;6cec
	jr L_6CF2		;6cee
L_6CF0:
	res 4,(hl)		;6cf0
L_6CF2:
	ld a,(0cb21h)		;6cf2
	cp 002h		;6cf5
	ret z			;6cf7
	ld a,(0ca1ch)		;6cf8
	and a			;6cfb
	ret nz			;6cfc
	ld a,(0e040h)		;6cfd
	and a			;6d00
	ret nz			;6d01
	xor a			;6d02
L_6D03:
	ld (0e206h),a		;6d03
	ld a,(0e1d0h)		;6d06
	and a			;6d09
	ret nz			;6d0a
	ld a,(0cabah)		;6d0b
	and a			;6d0e
	ret nz			;6d0f
	ld a,(0ca5fh)		;6d10
	and a			;6d13
	jp nz,L_6FEA		;6d14
	ld a,(0ca64h)		;6d17
	and a			;6d1a
	ret nz			;6d1b
	ld a,(0cb00h)		;6d1c
	cp 011h		;6d1f
	ret z			;6d21
	ld a,(0ca77h)		;6d22
	and a			;6d25
	ret nz			;6d26
	ld a,(0caa9h)		;6d27
	and a			;6d2a
	ret nz			;6d2b
	ld hl,0e20bh		;6d2c
	ld a,(hl)			;6d2f
	and a			;6d30
	jr nz,L_6D3F		;6d31
	call L_705A		;6d33
	call L_70A0		;6d36
	call L_71D7		;6d39
	call L_7272		;6d3c
L_6D3F:
	ld a,(0e206h)		;6d3f
	and a			;6d42
	ret nz			;6d43
	ld a,(0ca7ah)		;6d44
	cp 002h		;6d47
	ret c			;6d49
	ld hl,0e203h		;6d4a
	ld c,(hl)			;6d4d
	ld a,c			;6d4e
	dec a			;6d4f
	jr nz,L_6D63		;6d50
	ld a,(0e206h)		;6d52
	and a			;6d55
	jr nz,L_6D63		;6d56
	ld hl,0ca7ah		;6d58
	dec (hl)			;6d5b
	ld a,(hl)			;6d5c
	cp 002h		;6d5d
	ret c			;6d5f
	call 05f3ch		;6d60
L_6D63:
	call L_6D6E		;6d63
	ld c,00ch		;6d66
	ld a,(0ca42h)		;6d68
	jp 04680h		;6d6b
L_6D6E:
	ld l,017h		;6d6e
	ld a,c			;6d70
	add a,a			;6d71
	add a,0c3h		;6d72
	ld h,a			;6d74
	ld b,038h		;6d75
	ret			;6d77
L_6D78:
	ld a,(0cb21h)		;6d78
	cp 002h		;6d7b
	ret z			;6d7d
	ld a,(0ca1ch)		;6d7e
	and a			;6d81
	ret nz			;6d82
	ld a,(0ca5fh)		;6d83
	and a			;6d86
	ret nz			;6d87
	call L_6D9C		;6d88
	ld hl,0e20bh		;6d8b
	ld a,(hl)			;6d8e
	and a			;6d8f
	jr z,L_6D94		;6d90
	dec (hl)			;6d92
	ret			;6d93
L_6D94:
	ld a,001h		;6d94
	jp L_6D03		;6d96
L_6D99:
	ld (hl),000h		;6d99
	ret			;6d9b
L_6D9C:
	ld a,(0cabah)		;6d9c
	and a			;6d9f
	ret nz			;6da0
	ld hl,0ca7ah		;6da1
	ld a,(hl)			;6da4
	cp 001h		;6da5
	ret c			;6da7
	call z,L_6D99		;6da8
	ld hl,0e202h		;6dab
	ld a,(hl)			;6dae
	inc hl			;6daf
	ld c,(hl)			;6db0
	and a			;6db1
	jr nz,L_6DBF		;6db2
	inc (hl)			;6db4
	ld a,(hl)			;6db5
	cp 01ch		;6db6
	jr c,L_6DC7		;6db8
	dec hl			;6dba
	ld (hl),001h		;6dbb
	jr L_6DC7		;6dbd
L_6DBF:
	dec (hl)			;6dbf
	ld a,(hl)			;6dc0
	and a			;6dc1
	jr nz,L_6DC7		;6dc2
	dec hl			;6dc4
	ld (hl),000h		;6dc5
L_6DC7:
	call L_6D6E		;6dc7
	ld bc,0023ch		;6dca
L_6DCD:
	ld d,h			;6dcd
	ld e,l			;6dce
	ld a,(0ca42h)		;6dcf
	and a			;6dd2
	ld a,001h		;6dd3
	jr z,L_6DD9		;6dd5
	ld a,004h		;6dd7
L_6DD9:
	jp 04767h		;6dd9
L_6DDC:
	ld d,a			;6ddc
	ld a,007h		;6ddd
L_6DDF:
	ld e,000h		;6ddf
	jp 04840h		;6de1
L_6DE4:
	ld a,e			;6de4
	call L_6DEF		;6de5
	ld l,b			;6de8
	ld a,d			;6de9
	call L_6DEF		;6dea
	ld h,b			;6ded
	ret			;6dee
L_6DEF:
	ld c,a			;6def
	rlca			;6df0
	rlca			;6df1
	rlca			;6df2
	and 007h		;6df3
	ld b,a			;6df5
	add a,a			;6df6
	add a,b			;6df7
	ld b,a			;6df8
	ld a,c			;6df9
	and 01fh		;6dfa
	cp 008h		;6dfc
	ret c			;6dfe
	inc b			;6dff
	cp 018h		;6e00
	ret c			;6e02
	inc b			;6e03
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


L_6E17:
	ld a,(0caa9h)		;6e17
	and a			;6e1a
	ret nz			;6e1b
	ld a,(0ca4ah)		;6e1c
	cp 012h		;6e1f
	jr z,L_6E38		;6e21
	ld a,(0d654h)		;6e23
	and a			;6e26
	ret z			;6e27
	ld a,(0ca76h)		;6e28
	cp 029h		;6e2b
	jr z,L_6E38		;6e2d
	ld a,(0cb21h)		;6e2f
	cp 008h		;6e32
	jr z,L_6E38		;6e34
	or a			;6e36
	ret			;6e37
L_6E38:
	scf			;6e38
	ret			;6e39
L_6E3A:
	call L_6E17		;6e3a
	ret nc			;6e3d
	ld hl,0d4e5h		;6e3e
	ld (hl),001h		;6e41
	push hl			;6e43
	call L_6E4F		;6e44
	pop hl			;6e47
	ld (hl),000h		;6e48
	ret			;6e4a
L_6E4B:
	ld a,001h		;6e4b
	jr L_6E50		;6e4d
L_6E4F:
	xor a			;6e4f
L_6E50:
	ld (0e206h),a		;6e50
	ld a,(0caa9h)		;6e53
	and a			;6e56
	ret nz			;6e57
	ld hl,0cc80h		;6e58
	ld b,030h		;6e5b
L_6E5D:
	push hl			;6e5d
	push bc			;6e5e
	call L_6E78		;6e5f
	pop bc			;6e62
	pop hl			;6e63
	ld a,008h		;6e64
	call 0423eh		;6e66
	djnz L_6E5D		;6e69
	ret			;6e6b
L_6E6C:
	ld a,001h		;6e6c
	jr L_6E71		;6e6e
L_6E70:
	xor a			;6e70
L_6E71:
	ld (0e206h),a		;6e71
	call L_6E17		;6e74
	ret nc			;6e77
L_6E78:
	ld a,(hl)			;6e78
	cp 004h		;6e79
	jr z,L_6E7F		;6e7b
	dec a			;6e7d
	ret nz			;6e7e
L_6E7F:
	inc hl			;6e7f
	inc hl			;6e80
	ld e,(hl)			;6e81
	inc hl			;6e82
	ld d,(hl)			;6e83
	inc hl			;6e84
	ld b,(hl)			;6e85
	ld a,(0ca50h)		;6e86
	sub b			;6e89
	inc a			;6e8a
	cp 003h		;6e8b
	ret nc			;6e8d
	inc hl			;6e8e
	ld c,(hl)			;6e8f
	ld a,(0ca51h)		;6e90
	sub c			;6e93
	inc a			;6e94
	cp 003h		;6e95
	ret nc			;6e97
	push bc			;6e98
	call L_6DE4		;6e99
	pop bc			;6e9c
	call L_71AC		;6e9d
	ld a,(0ca42h)		;6ea0
	xor 001h		;6ea3
	ld d,a			;6ea5
	ld a,(0e206h)		;6ea6
	and a			;6ea9
	ld a,007h		;6eaa
	jr z,L_6EAF		;6eac
	xor a			;6eae
L_6EAF:
	push af			;6eaf
	call L_6EC3		;6eb0
	pop bc			;6eb3
	ld a,(0d4e5h)		;6eb4
	and a			;6eb7
	ret nz			;6eb8
	ld a,(0ca5fh)		;6eb9
	and a			;6ebc
	ret nz			;6ebd
	ld a,(0ca42h)		;6ebe
	ld d,a			;6ec1
	ld a,b			;6ec2
L_6EC3:
	ld e,000h		;6ec3
	jp 04840h		;6ec5
L_6EC8:
	call L_6F41		;6ec8
	ld hl,08000h		;6ecb
	ld a,(0ca4ah)		;6ece
	sub 00bh		;6ed1
	cp 006h		;6ed3
	jr nc,L_6EE5		;6ed5
	ld hl,06f3bh		;6ed7
	call 0423eh		;6eda
	ld a,(hl)			;6edd
	call L_6F52		;6ede
	ld de,08000h		;6ee1
	add hl,de			;6ee4
L_6EE5:
	ld (0ca9eh),hl		;6ee5
	ld hl,(0ca50h)		;6ee8
	inc l			;6eeb
	ld a,l			;6eec
	add a,a			;6eed
	add a,a			;6eee
	add a,a			;6eef
	add a,a			;6ef0
	dec h			;6ef1
	add a,h			;6ef2
	ld hl,0d900h		;6ef3
	call 0423eh		;6ef6
	ld bc,00303h		;6ef9
	ld e,000h		;6efc
L_6EFE:
	push bc			;6efe
	push hl			;6eff
	ld b,c			;6f00
L_6F01:
	push bc			;6f01
	push de			;6f02
	push hl			;6f03
	ld a,(0ca64h)		;6f04
	and a			;6f07
	jr nz,L_6F2B		;6f08
	ld a,(0ca77h)		;6f0a
	and a			;6f0d
	jr nz,L_6F2B		;6f0e
	ld a,(0caa9h)		;6f10
	and a			;6f13
	jr nz,L_6F2B		;6f14
	ld a,(0ca4ah)		;6f16
	and a			;6f19
	ld c,00ah		;6f1a
	jr z,L_6F26		;6f1c
	cp 009h		;6f1e
	ld c,003h		;6f20
	jr z,L_6F26		;6f22
	ld c,080h		;6f24
L_6F26:
	ld a,(hl)			;6f26
	cp c			;6f27
	call c,L_6F61		;6f28
L_6F2B:
	pop hl			;6f2b
	pop de			;6f2c
	pop bc			;6f2d
	inc hl			;6f2e
	inc e			;6f2f
	djnz L_6F01		;6f30
	pop hl			;6f32
	ld a,l			;6f33
	sub 010h		;6f34
	ld l,a			;6f36
	pop bc			;6f37
	djnz L_6EFE		;6f38
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


L_6F41:
	ld a,(0ca42h)		;6f41
	xor 001h		;6f44
	ld d,a			;6f46
	ld a,0eeh		;6f47
L_6F49:
	ld hl,0c417h		;6f49
	ld bc,03838h		;6f4c
	jp 046ffh		;6f4f
L_6F52:
	ld l,a			;6f52
	ld h,000h		;6f53
	ld b,h			;6f55
	ld c,l			;6f56
	add hl,hl			;6f57
	add hl,hl			;6f58
	add hl,hl			;6f59
	ld d,h			;6f5a
	ld e,l			;6f5b
	add hl,hl			;6f5c
	add hl,hl			;6f5d
	add hl,bc			;6f5e
	add hl,de			;6f5f
	ret			;6f60
L_6F61:
	push de			;6f61
	call L_6F52		;6f62
	ld a,(0ca76h)		;6f65
	and a			;6f68
	ld bc,(0ca9eh)		;6f69
	jr z,L_6F72		;6f6d
	ld bc,08c00h		;6f6f
L_6F72:
	add hl,bc			;6f72
	call L_6F93		;6f73
	pop de			;6f76
	ld a,e			;6f77
	ld hl,06e05h		;6f78
	call 043f6h		;6f7b
	ex de,hl			;6f7e
	ld hl,000e0h		;6f7f
	ld a,(0ca42h)		;6f82
	and a			;6f85
	ld b,010h		;6f86
	jr z,L_6F8C		;6f88
	ld b,000h		;6f8a
L_6F8C:
	ld a,b			;6f8c
	ld bc,01212h		;6f8d
	jp 047edh		;6f90
L_6F93:
	push hl			;6f93
	ld a,(0c386h)		;6f94
	ld h,080h		;6f97
	call 00024h		;6f99   ; BIOS ENASLT - Switches to specified slot and page definitively
	di			;6f9c
	pop hl			;6f9d
	ld bc,02c0eh		;6f9e
	call L_6FC4		;6fa1
	ld a,(0c388h)		;6fa4
	call 0013bh		;6fa7   ; BIOS WSLREG - Writes value to the primary slot register
	ei			;6faa
	ld hl,0ea00h		;6fab
	ld de,07000h		;6fae
	ld b,012h		;6fb1
L_6FB3:
	push bc			;6fb3
	xor a			;6fb4
	ld bc,00009h		;6fb5
	call 04486h		;6fb8
	ld a,080h		;6fbb
	call 04243h		;6fbd
	pop bc			;6fc0
	djnz L_6FB3		;6fc1
	ret			;6fc3
L_6FC4:
	ld de,0ea00h		;6fc4
L_6FC7:
	push bc			;6fc7
	push hl			;6fc8
	ex de,hl			;6fc9
	ld a,(de)			;6fca
	ld d,a			;6fcb
	ld b,004h		;6fcc
L_6FCE:
	ld a,c			;6fce
	rl d		;6fcf
	jr c,L_6FD5		;6fd1
	ld a,00fh		;6fd3
L_6FD5:
	rld		;6fd5
	ld a,c			;6fd7
	rl d		;6fd8
	jr c,L_6FDE		;6fda
	ld a,00fh		;6fdc
L_6FDE:
	rld		;6fde
	inc hl			;6fe0
	djnz L_6FCE		;6fe1
	ex de,hl			;6fe3
	pop hl			;6fe4
	inc hl			;6fe5
	pop bc			;6fe6
	djnz L_6FC7		;6fe7
	ret			;6fe9
L_6FEA:
	ld hl,0e209h		;6fea
	dec (hl)			;6fed
	ret nz			;6fee
	dec hl			;6fef
	ld a,(hl)			;6ff0
	inc a			;6ff1
	and 003h		;6ff2
	ld (hl),a			;6ff4
	rra			;6ff5
	ld a,008h		;6ff6
	jr nc,L_6FFC		;6ff8
	ld a,004h		;6ffa
L_6FFC:
	inc hl			;6ffc
	ld (hl),a			;6ffd
L_6FFE:
	ld hl,0704ah		;6ffe
	ld a,(0e208h)		;7001
	and a			;7004
	ld c,0ffh		;7005
	jr nz,L_7013		;7007
	ld a,(0ca5fh)		;7009
	ld c,0cch		;700c
	dec a			;700e
	jr z,L_7013		;700f
	ld c,0aah		;7011
L_7013:
	call L_702C		;7013
	ld hl,07052h		;7016
	ld a,(0e208h)		;7019
	cp 002h		;701c
	ld c,0ffh		;701e
	jr nz,L_702C		;7020
	ld a,(0ca5fh)		;7022
	ld c,0cch		;7025
	dec a			;7027
	jr z,L_702C		;7028
	ld c,0aah		;702a
L_702C:
	ld a,c			;702c
	ld b,002h		;702d
L_702F:
	push af			;702f
	push bc			;7030
	ld d,(hl)			;7031
	inc hl			;7032
	ld e,(hl)			;7033
	inc hl			;7034
	ld b,(hl)			;7035
	inc hl			;7036
	ld c,(hl)			;7037
	inc hl			;7038
	push hl			;7039
	ex de,hl			;703a
	ex af,af'			;703b
	ld a,(0ca42h)		;703c
	ld d,a			;703f
	ex af,af'			;7040
	call 046ffh		;7041
	pop hl			;7044
	pop bc			;7045
	pop af			;7046
	djnz L_702F		;7047
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


L_705A:
	ld a,(0cb00h)		;705a
	cp 011h		;705d
	ret z			;705f
	ld a,(0ca65h)		;7060
	and a			;7063
	jr nz,L_7072		;7064
	ld a,(0cb03h)		;7066
	ld (0e204h),a		;7069
	ld a,(0cb05h)		;706c
	ld (0e205h),a		;706f
L_7072:
	ld de,(0e204h)		;7072
	call L_6DE4		;7076
	ld de,0d72ah		;7079
	add hl,de			;707c
	ld a,(0e206h)		;707d
	and a			;7080
	jr nz,L_709A		;7081
	ld a,(0ca42h)		;7083
	ld d,a			;7086
	ld a,(0ca03h)		;7087
	and 004h		;708a
	ret z			;708c
	ld a,(0ca41h)		;708d
	and a			;7090
	ret nz			;7091
	ld e,00ah		;7092
	ld a,e			;7094
	ld e,000h		;7095
	jp 04840h		;7097
L_709A:
	ld bc,00201h		;709a
	jp L_6DCD		;709d
L_70A0:
	ld ix,0ce00h		;70a0
	ld a,(0ca65h)		;70a4
	and a			;70a7
	ld b,018h		;70a8
	jr z,L_70AE		;70aa
	ld b,014h		;70ac
L_70AE:
	ld a,(ix+000h)		;70ae
	ld c,a			;70b1
	and a			;70b2
	jr z,L_7102		;70b3
	cp 017h		;70b5
	jr z,L_7102		;70b7
	cp 018h		;70b9
	jr z,L_7102		;70bb
	cp 013h		;70bd
	jr z,L_7102		;70bf
	cp 008h		;70c1
	jr nz,L_70CB		;70c3
	ld a,(0d441h)		;70c5
	and a			;70c8
	jr nz,L_7102		;70c9
L_70CB:
	ld a,(0ca76h)		;70cb
	ld d,a			;70ce
	and a			;70cf
	ld a,(ix+01bh)		;70d0
	jr z,L_70E6		;70d3
	dec a			;70d5
	jr nz,L_7102		;70d6
	ld e,a			;70d8
	ld a,(ix+000h)		;70d9
	cp 009h		;70dc
	ld a,e			;70de
	jr nz,L_70E6		;70df
	ld a,d			;70e1
	cp 018h		;70e2
	jr nz,L_7102		;70e4
L_70E6:
	and a			;70e6
	jr nz,L_7102		;70e7
	ld a,(0ca50h)		;70e9
	sub (ix+00ah)		;70ec
	inc a			;70ef
	cp 003h		;70f0
	jr nc,L_7102		;70f2
	ld a,(0ca51h)		;70f4
	sub (ix+00bh)		;70f7
	inc a			;70fa
	cp 003h		;70fb
	exx			;70fd
	call c,L_710F		;70fe
	exx			;7101
L_7102:
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


L_710F:
	ld d,(ix+005h)		;710f
	ld e,(ix+003h)		;7112
	push hl			;7115
	push de			;7116
	push ix		;7117
	pop hl			;7119
	ld de,0d800h		;711a
	call 00020h		;711d   ; BIOS DCOMPR - Compares HL with DE
	pop de			;7120
	pop hl			;7121
	ld c,000h		;7122
	jr c,L_7144		;7124
	ld c,001h		;7126
	ld a,(ix+001h)		;7128
	cp 020h		;712b
	ret nc			;712d
	ld a,(ix+000h)		;712e
	cp 001h		;7131
	jr nz,L_7144		;7133
	ld a,(ix+001h)		;7135
	cp 003h		;7138
	jr c,L_7144		;713a
	ld a,d			;713c
	sub 020h		;713d
	ld d,a			;713f
	ld a,e			;7140
	sub 020h		;7141
	ld e,a			;7143
L_7144:
	push bc			;7144
	call L_6DE4		;7145
	pop bc			;7148
	ld a,c			;7149
	and a			;714a
	jr z,L_715D		;714b
	ld a,h			;714d
	cp 012h		;714e
	jr c,L_7155		;7150
	sub 019h		;7152
	ld h,a			;7154
L_7155:
	ld a,l			;7155
	cp 012h		;7156
	jr c,L_715D		;7158
	sub 019h		;715a
	ld l,a			;715c
L_715D:
	push bc			;715d
	call L_71A6		;715e
	pop bc			;7161
	ld a,l			;7162
	cp 016h		;7163
	ret c			;7165
	ld a,(0e206h)		;7166
	and a			;7169
	jp nz,L_709A		;716a
	ld a,(0ca42h)		;716d
	ld b,a			;7170
	ld a,c			;7171
	and a			;7172
	jr z,L_7195		;7173
	ld a,(ix+001h)		;7175
	ld c,a			;7178
	ld a,(ix+000h)		;7179
	cp 003h		;717c
	jr z,L_718A		;717e
	cp 006h		;7180
	jr nz,L_7195		;7182
	ld a,c			;7184
	cp 009h		;7185
	ret nc			;7187
	jr nz,L_7195		;7188
L_718A:
	ld a,c			;718a
	cp 003h		;718b
	jr nc,L_7195		;718d
	ld d,b			;718f
	ld a,00ah		;7190
	jp L_6DDF		;7192
L_7195:
	ld a,(ix+000h)		;7195
	cp 015h		;7198
	jr nz,L_71A2		;719a
	ld a,(0ca03h)		;719c
	and 004h		;719f
	ret z			;71a1
L_71A2:
	ld a,b			;71a2
	jp L_6DDC		;71a3
L_71A6:
	ld b,(ix+00ah)		;71a6
	ld c,(ix+00bh)		;71a9
L_71AC:
	ld a,(0ca50h)		;71ac
	cp b			;71af
	ld b,000h		;71b0
	jr c,L_71BA		;71b2
	ld b,003h		;71b4
	jr z,L_71BA		;71b6
	ld b,006h		;71b8
L_71BA:
	inc b			;71ba
	inc b			;71bb
	ld a,(0ca51h)		;71bc
	cp c			;71bf
	jr c,L_71C8		;71c0
	ex af,af'			;71c2
	dec b			;71c3
	ex af,af'			;71c4
	jr z,L_71C8		;71c5
	dec b			;71c7
L_71C8:
	ex de,hl			;71c8
	ld a,b			;71c9
	ld hl,06e05h		;71ca
	call 043f6h		;71cd
	ld a,h			;71d0
	add a,d			;71d1
	ld h,a			;71d2
	ld a,l			;71d3
	add a,e			;71d4
	ld l,a			;71d5
	ret			;71d6
L_71D7:
	ld a,(0ca76h)		;71d7
	and a			;71da
	ld ix,0d800h		;71db
	ld b,003h		;71df
	jr z,L_71E9		;71e1
	ld ix,0d860h		;71e3
	ld b,001h		;71e7
L_71E9:
	push bc			;71e9
	call L_71F6		;71ea
	ld bc,00020h		;71ed
	add ix,bc		;71f0
	pop bc			;71f2
	djnz L_71E9		;71f3
	ret			;71f5
L_71F6:
	ld a,(ix+000h)		;71f6
	and a			;71f9
	ret z			;71fa
	ld a,(0ca3ch)		;71fb
	and a			;71fe
	jr nz,L_7207		;71ff
	ld a,(ix+000h)		;7201
	cp 005h		;7204
	ret z			;7206
L_7207:
	ld a,(ix+000h)		;7207
	cp 007h		;720a
	jr nz,L_7213		;720c
	ld a,(ix+014h)		;720e
	and a			;7211
	ret nz			;7212
L_7213:
	ld a,(0ca50h)		;7213
	sub (ix+00ah)		;7216
	inc a			;7219
	cp 003h		;721a
	ret nc			;721c
	ld a,(0ca51h)		;721d
	sub (ix+00bh)		;7220
	inc a			;7223
	cp 003h		;7224
	ret nc			;7226
	ld a,(ix+000h)		;7227
	cp 002h		;722a
	jr z,L_7240		;722c
	cp 001h		;722e
	jp nz,L_710F		;7230
	ld a,(ix+001h)		;7233
	cp 004h		;7236
	jp nc,L_710F		;7238
	ld de,05000h		;723b
	jr L_724C		;723e
L_7240:
	ld a,(ix+005h)		;7240
	sub 010h		;7243
	ld d,a			;7245
	ld a,(ix+003h)		;7246
	sub 030h		;7249
	ld e,a			;724b
L_724C:
	call L_6DE4		;724c
	call L_71A6		;724f
	ld a,(0e206h)		;7252
	and a			;7255
	jp nz,L_726C		;7256
	ld bc,00307h		;7259
L_725C:
	push hl			;725c
	push bc			;725d
	ld b,005h		;725e
	ld a,(0ca42h)		;7260
	call 04680h		;7263
	pop bc			;7266
	pop hl			;7267
	inc h			;7268
	djnz L_725C		;7269
	ret			;726b
L_726C:
	ld bc,00405h		;726c
	jp L_6DCD		;726f
L_7272:
	ld a,(0ca51h)		;7272
	cp 007h		;7275
	ret nz			;7277
	ld a,(0ca76h)		;7278
	cp 02ah		;727b
	jr z,L_7296		;727d
	cp 026h		;727f
	ret nz			;7281
	ld a,(0d7d3h)		;7282
	ld b,a			;7285
	and 040h		;7286
	ret nz			;7288
	ld a,b			;7289
	and 020h		;728a
	ret nz			;728c
	ld hl,0f334h		;728d
L_7290:
	ld a,(0ca42h)		;7290
	jp L_6DDC		;7293
L_7296:
	ld a,(0d7d5h)		;7296
	and 080h		;7299
	ret nz			;729b
	ld hl,0ec34h		;729c
	jr L_7290		;729f
L_72A1:
	ld a,(0ca76h)		;72a1
	and a			;72a4
	ret nz			;72a5
	ld a,(0ca77h)		;72a6
	and a			;72a9
	ret nz			;72aa
	ld bc,(0ca50h)		;72ab
	ld a,(0ca4ah)		;72af
	cp 004h		;72b2
	jr z,L_72DD		;72b4
	dec a			;72b6
	ret nz			;72b7
	ld a,b			;72b8
	sub 008h		;72b9
	ld b,a			;72bb
	cp 002h		;72bc
	ret nc			;72be
	ld a,c			;72bf
	dec a			;72c0
	ld c,a			;72c1
	cp 004h		;72c2
	ret nc			;72c4
	ld a,c			;72c5
	ld hl,0b6adh		;72c6
	dec a			;72c9
	jr z,L_72FA		;72ca
	ld hl,0b6a8h		;72cc
	dec a			;72cf
	jr z,L_72FA		;72d0
	ld hl,0b6a3h		;72d2
	dec a			;72d5
	jr z,L_72FA		;72d6
	ld hl,0b6b2h		;72d8
	jr L_72FA		;72db
L_72DD:
	ld a,c			;72dd
	dec a			;72de
	ld c,a			;72df
	cp 003h		;72e0
	ret nc			;72e2
	ld a,b			;72e3
	sub 005h		;72e4
	ld b,a			;72e6
	cp 003h		;72e7
	ret nc			;72e9
	ld a,c			;72ea
	ld hl,0b68fh		;72eb
	cp 001h		;72ee
	jr z,L_72FA		;72f0
	ld hl,0b68ah		;72f2
	jr nc,L_72FA		;72f5
	ld hl,0b694h		;72f7
L_72FA:
	ld a,b			;72fa
	call 0423eh		;72fb
	ld b,003h		;72fe
	ld d,000h		;7300
L_7302:
	ld c,003h		;7302
L_7304:
	ld a,(hl)			;7304
	and a			;7305
	jr z,L_7311		;7306
	push hl			;7308
	push de			;7309
	push bc			;730a
	call L_731B		;730b
	pop bc			;730e
	pop de			;730f
	pop hl			;7310
L_7311:
	inc hl			;7311
	inc d			;7312
	dec c			;7313
	jr nz,L_7304		;7314
	inc hl			;7316
	inc hl			;7317
	djnz L_7302		;7318
	ret			;731a
L_731B:
	ld a,(0ca4ah)		;731b
	dec a			;731e
	jr z,L_7330		;731f
	ld a,(hl)			;7321
	dec a			;7322
	ld hl,0b492h		;7323
	jr z,L_733A		;7326
	dec a			;7328
	ld hl,0b510h		;7329
	jr nz,L_7389		;732c
	jr L_733A		;732e
L_7330:
	ld a,(hl)			;7330
	dec a			;7331
	ld hl,0b60ch		;7332
	jr z,L_733A		;7335
	ld hl,0b58eh		;7337
L_733A:
	push de			;733a
	call L_7372		;733b
	pop de			;733e
	ld a,d			;733f
	ex de,hl			;7340
	ld hl,06e05h		;7341
	call 043f6h		;7344
	ex de,hl			;7347
	inc e			;7348
	inc e			;7349
	inc e			;734a
	ld a,(0ca42h)		;734b
	ld b,a			;734e
	ld a,(0d455h)		;734f
	and a			;7352
	push de			;7353
	ld a,b			;7354
	push af			;7355
	call z,L_735D		;7356
	pop af			;7359
	pop de			;735a
	xor 001h		;735b
L_735D:
	ex af,af'			;735d
	ld a,(0cb21h)		;735e
	cp 002h		;7361
	ret z			;7363
	ex af,af'			;7364
	rlca			;7365
	rlca			;7366
	rlca			;7367
	rlca			;7368
	ld hl,000e0h		;7369
	ld bc,0120eh		;736c
	jp 047edh		;736f
L_7372:
	ld de,07000h		;7372
	ld b,00eh		;7375
L_7377:
	push bc			;7377
	ld bc,00009h		;7378
	xor a			;737b
	call 04486h		;737c
	ex de,hl			;737f
	ld bc,00080h		;7380
	add hl,bc			;7383
	ex de,hl			;7384
	pop bc			;7385
	djnz L_7377		;7386
	ret			;7388
L_7389:
	ld a,d			;7389
	ld (0d8e0h),a		;738a
	call L_6AA6		;738d
	ld c,(hl)			;7390
	inc hl			;7391
	inc hl			;7392
	ld d,(hl)			;7393
	inc hl			;7394
	inc hl			;7395
	ld e,(hl)			;7396
	ld a,(0ca4bh)		;7397
	cp 006h		;739a
	jr z,L_73A2		;739c
	ld c,0ffh		;739e
	ld d,c			;73a0
	ld e,c			;73a1
L_73A2:
	ld hl,0b709h		;73a2
	ld b,010h		;73a5
L_73A7:
	push bc			;73a7
	push de			;73a8
	push hl			;73a9
	ld a,b			;73aa
	sub 010h		;73ab
	neg		;73ad
	cp c			;73af
	jr z,L_73F0		;73b0
	cp d			;73b2
	jr z,L_73F0		;73b3
	cp e			;73b5
	jr z,L_73F0		;73b6
	ld e,(hl)			;73b8
	inc hl			;73b9
	ld d,(hl)			;73ba
	push de			;73bb
	call L_6DE4		;73bc
	ex de,hl			;73bf
	ld a,(0d8e0h)		;73c0
	ld hl,06e05h		;73c3
	call 043f6h		;73c6
	add hl,de			;73c9
	ld a,(0ca42h)		;73ca
	ld b,a			;73cd
	ld a,(0d455h)		;73ce
	and a			;73d1
	push hl			;73d2
	ld a,b			;73d3
	push af			;73d4
	call z,L_73F8		;73d5
	pop af			;73d8
	pop hl			;73d9
	xor 001h		;73da
	call L_73F8		;73dc
	pop de			;73df
	ld a,d			;73e0
	sub 008h		;73e1
	ld d,a			;73e3
	ld a,e			;73e4
	sub 01fh		;73e5
	ld e,a			;73e7
	push de			;73e8
	call L_7403		;73e9
	pop hl			;73ec
	call L_7445		;73ed
L_73F0:
	pop hl			;73f0
	pop de			;73f1
	pop bc			;73f2
	inc hl			;73f3
	inc hl			;73f4
	djnz L_73A7		;73f5
	ret			;73f7
L_73F8:
	ld d,a			;73f8
	ld a,(0cb21h)		;73f9
	cp 002h		;73fc
	ld a,d			;73fe
	ret z			;73ff
	jp L_6DDC		;7400
L_7403:
	ld a,(0ca4bh)		;7403
	cp 006h		;7406
	ret nz			;7408
	ld hl,00200h		;7409
	ld (0ca4ch),hl		;740c
	call 04256h		;740f
	rra			;7412
	ld hl,0b6c1h		;7413
	jr c,L_741B		;7416
	ld hl,0b6c9h		;7418
L_741B:
	ld bc,00204h		;741b
L_741E:
	push bc			;741e
	push de			;741f
L_7420:
	ld a,(hl)			;7420
	call 04a8ch		;7421
	inc hl			;7424
	ld a,d			;7425
	add a,008h		;7426
	ld d,a			;7428
	djnz L_7420		;7429
	pop de			;742b
	pop bc			;742c
	ld a,e			;742d
	add a,008h		;742e
	ld e,a			;7430
	dec c			;7431
	jr nz,L_741E		;7432
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


L_7445:
	ld a,(0cb21h)		;7445
	cp 002h		;7448
	ret z			;744a
	ld a,(0ca4bh)		;744b
	cp 006h		;744e
	ret nz			;7450
L_7451:
	call 04411h		;7451
	ld bc,00380h		;7454
L_7457:
	ld (hl),c			;7457
	inc hl			;7458
	ld (hl),c			;7459
	ld a,017h		;745a
	call 0423eh		;745c
	djnz L_7457		;745f
	ret			;7461
L_7462:
	ld a,(0ca4ah)		;7462
	cp 004h		;7465
	jr z,L_74B1		;7467
	dec a			;7469
	ret nz			;746a
L_746B:
	ld a,(0ca4ah)		;746b
	dec a			;746e
	ret nz			;746f
	ld a,(0ca76h)		;7470
	and a			;7473
	ret nz			;7474
	ld hl,00706h		;7475
	ld (0ca4ch),hl		;7478
	ld a,(0ca4bh)		;747b
	cp 008h		;747e
	jr z,L_748D		;7480
	cp 00dh		;7482
	ret nz			;7484
	ld hl,0b729h		;7485
	ld bc,00501h		;7488
	jr L_7493		;748b
L_748D:
	ld hl,0b733h		;748d
	ld bc,00a04h		;7490
L_7493:
	ld e,(hl)			;7493
	inc hl			;7494
	ld d,(hl)			;7495
	inc hl			;7496
	push bc			;7497
	push hl			;7498
	push de			;7499
	ld a,c			;749a
	rla			;749b
	ld hl,0b6d1h		;749c
	jr c,L_74A4		;749f
	ld hl,0b6d9h		;74a1
L_74A4:
	call L_741B		;74a4
	pop hl			;74a7
	call L_7451		;74a8
	pop hl			;74ab
	pop bc			;74ac
	dec c			;74ad
	djnz L_7493		;74ae
	ret			;74b0
L_74B1:
	ld a,(0ca4bh)		;74b1
	cp 006h		;74b4
	ret nz			;74b6
	ld d,004h		;74b7
	jp L_7389		;74b9
L_74BC:
	ld hl,0d458h		;74bc
	ld a,(hl)			;74bf
	and a			;74c0
	ret z			;74c1
	and 040h		;74c2
	jr z,L_74F4		;74c4
	ld a,(hl)			;74c6
	inc hl			;74c7
	dec (hl)			;74c8
	dec hl			;74c9
	ret nz			;74ca
L_74CB:
	ex af,af'			;74cb
	xor a			;74cc
	ld (0ca28h),a		;74cd
	ld (hl),a			;74d0
	inc hl			;74d1
	inc hl			;74d2
	ld e,(hl)			;74d3
	inc hl			;74d4
	ld d,(hl)			;74d5
	inc hl			;74d6
	ld bc,(0ca50h)		;74d7
	ld a,c			;74db
	cp (hl)			;74dc
	ret nz			;74dd
	inc hl			;74de
	ld a,b			;74df
	cp (hl)			;74e0
	ret nz			;74e1
	ex af,af'			;74e2
	ld b,a			;74e3
	and 03fh		;74e4
	dec a			;74e6
	ld a,b			;74e7
	jp nz,L_7579		;74e8
	ld hl,0c080h		;74eb
	ld bc,01010h		;74ee
	jp 0475ah		;74f1
L_74F4:
	set 6,(hl)		;74f4
	ld a,(hl)			;74f6
	ld b,a			;74f7
	inc hl			;74f8
	inc hl			;74f9
	ld e,(hl)			;74fa
	inc hl			;74fb
	ld d,(hl)			;74fc
	and 03fh		;74fd
	dec a			;74ff
	jr nz,L_751F		;7500
	push de			;7502
	ex de,hl			;7503
	ld de,0c080h		;7504
	ld bc,01010h		;7507
	push bc			;750a
	call 0474dh		;750b
	pop bc			;750e
	pop de			;750f
	ld hl,008b0h		;7510
	ld a,(0ca42h)		;7513
	rrca			;7516
	rrca			;7517
	rrca			;7518
	rrca			;7519
	or 0c8h		;751a
	jp 047edh		;751c
L_751F:
	push de			;751f
	push bc			;7520
	ex de,hl			;7521
	ld de,000e0h		;7522
	ld bc,05a10h		;7525
	ld a,(0ca42h)		;7528
	push hl			;752b
	call 04767h		;752c
	pop hl			;752f
	pop af			;7530
	rla			;7531
	ld b,058h		;7532
	jr c,L_7538		;7534
	ld b,038h		;7536
L_7538:
	ld c,00ch		;7538
	ld a,(0ca42h)		;753a
	ld d,a			;753d
	ld a,099h		;753e
	push hl			;7540
	push bc			;7541
	call 046ffh		;7542
	pop de			;7545
	pop hl			;7546
	ld c,007h		;7547
	ld a,(0ca42h)		;7549
	call 046bch		;754c
	ld a,(0d458h)		;754f
	and 03fh		;7552
	sub 002h		;7554
	ld b,a			;7556
	add a,a			;7557
	add a,b			;7558
	ld hl,07601h		;7559
	call 0423eh		;755c
	ld e,(hl)			;755f
	inc hl			;7560
	ld d,(hl)			;7561
	inc hl			;7562
	ld a,(hl)			;7563
	ex de,hl			;7564
	pop de			;7565
	add a,d			;7566
	ld d,a			;7567
	ld a,e			;7568
	add a,002h		;7569
	ld e,a			;756b
L_756C:
	ld a,(hl)			;756c
	ld c,a			;756d
	inc c			;756e
	ret z			;756f
	call 05d18h		;7570
	ld a,d			;7573
	add a,008h		;7574
	ld d,a			;7576
	jr L_756C		;7577
L_7579:
	rla			;7579
	ld b,05ah		;757a
	jr c,L_7580		;757c
	ld b,03ah		;757e
L_7580:
	ld hl,000e0h		;7580
	ld c,00ch		;7583
	ld a,(0ca42h)		;7585
	rlca			;7588
	rlca			;7589
	jp 04767h		;758a
L_758D:
	ld hl,0d458h		;758d
	ld a,(hl)			;7590
	and a			;7591
	push hl			;7592
	call nz,L_74CB		;7593
	pop hl			;7596
	ld a,001h		;7597
	ld (0ca28h),a		;7599
	ld (hl),a			;759c
	inc hl			;759d
	ld (hl),010h		;759e
	inc hl			;75a0
	ld a,(ix+003h)		;75a1
	sub 028h		;75a4
	jr nc,L_75A9		;75a6
	xor a			;75a8
L_75A9:
	ld (hl),a			;75a9
	ld e,a			;75aa
	inc hl			;75ab
	ld a,(ix+005h)		;75ac
	cp 080h		;75af
	ld c,004h		;75b1
	jr c,L_75B7		;75b3
	ld c,0ech		;75b5
L_75B7:
	add a,c			;75b7
	ld (hl),a			;75b8
	ld d,a			;75b9
	inc hl			;75ba
	ld bc,(0ca50h)		;75bb
	ld (hl),c			;75bf
	inc hl			;75c0
	ld (hl),b			;75c1
	ret			;75c2
L_75C3:
	ld hl,0d458h		;75c3
	ld a,(hl)			;75c6
	and a			;75c7
	ret nz			;75c8
	ld (hl),b			;75c9
	inc hl			;75ca
	ld (hl),c			;75cb
	inc hl			;75cc
	ld a,b			;75cd
	cp 008h		;75ce
	jr z,L_75D8		;75d0
	ld e,(ix+003h)		;75d2
	ld d,(ix+005h)		;75d5
L_75D8:
	ld a,e			;75d8
	sub 030h		;75d9
	jr nc,L_75DE		;75db
	xor a			;75dd
L_75DE:
	ld e,a			;75de
	ld (hl),e			;75df
	inc hl			;75e0
	ld a,b			;75e1
	rla			;75e2
	ld c,02ch		;75e3
	jr c,L_75E9		;75e5
	ld c,01ch		;75e7
L_75E9:
	ld a,d			;75e9
	and 0feh		;75ea
	sub c			;75ec
	ld d,000h		;75ed
	jr c,L_75F7		;75ef
	ld d,068h		;75f1
	cp d			;75f3
	jr nc,L_75F7		;75f4
	ld d,a			;75f6
L_75F7:
	ld (hl),d			;75f7
	inc hl			;75f8
	ld bc,(0ca50h)		;75f9
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


L_7688:
	ld a,(0ca01h)		;7688
	cp 004h		;768b
	ret z			;768d
	ld a,(0cb00h)		;768e
	cp 004h		;7691
	ret z			;7693
	call L_7BB0		;7694
	ld a,(0cb3fh)		;7697
	cp 002h		;769a
	ret nc			;769c
	xor a			;769d
	ld (0cb43h),a		;769e
	call 04198h		;76a1
	call L_76C5		;76a4
	call L_7DA0		;76a7
	call L_7B73		;76aa
	call L_7D51		;76ad
	call L_7C5E		;76b0
	call L_7C25		;76b3
	call L_7D7B		;76b6
	call L_7C6E		;76b9
	call L_7C81		;76bc
	call L_7C8A		;76bf
	jp 041dah		;76c2
L_76C5:
	ld a,(0cb01h)		;76c5
	call 0424dh		;76c8

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


L_76E9:
	ld a,(0cb00h)		;76e9
	cp 004h		;76ec
	ret z			;76ee
	call L_7B85		;76ef
	ld a,(0cb3fh)		;76f2
	cp 002h		;76f5
	ret nc			;76f7
	call 04198h		;76f8
	call L_7704		;76fb
	call L_7BFA		;76fe
	jp 041dah		;7701
L_7704:
	ld a,(0cb01h)		;7704
	call 0424dh		;7707

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


L_7728:
	call L_775D		;7728
	jp L_77B8		;772b
L_772E:
	ld l,0d0h		;772e
	call L_774E		;7730
L_7733:
	ld h,000h		;7733
	ld a,(0cb3fh)		;7735
	or a			;7738
	jr nz,L_7743		;7739
	ld de,001f0h		;773b
	ld a,007h		;773e
	jp 047abh		;7740
L_7743:
	ld de,000f0h		;7743
	ld bc,08001h		;7746
	ld a,007h		;7749
	jp 04767h		;774b
L_774E:
	ld a,(0cb0eh)		;774e
	dec a			;7751
	ld b,a			;7752
	add a,a			;7753
	add a,b			;7754
	add a,l			;7755
	ld l,a			;7756
	ld a,(0cb14h)		;7757
	add a,l			;775a
	ld l,a			;775b
	ret			;775c
L_775D:
	ld a,(0cb03h)		;775d
	sub 020h		;7760
	ld e,a			;7762
L_7763:
	ld a,(0cb05h)		;7763
	sub 008h		;7766
	jr nc,L_776B		;7768
	xor a			;776a
L_776B:
	ld d,a			;776b
	call L_7789		;776c
	ld hl,0dc00h		;776f
	ld c,000h		;7772
	call 05d41h		;7774
	call 05d3dh		;7777
	ld a,(0cb3fh)		;777a
	or a			;777d
	ret nz			;777e
	ld a,e			;777f
	add a,010h		;7780
	ld e,a			;7782
	call 05d3dh		;7783
	jp 05d3dh		;7786
L_7789:
	ld a,(0d752h)		;7789
	or a			;778c
	ret z			;778d
	ld a,(0cb00h)		;778e
	dec a			;7791
	ret nz			;7792
	ld a,(0cb20h)		;7793
	cp 003h		;7796
	jr c,L_77A1		;7798
	cp 005h		;779a
	jr z,L_77A1		;779c
	cp 006h		;779e
	ret nz			;77a0
L_77A1:
	ld a,(0cb0eh)		;77a1
	dec a			;77a4
	call 0424dh		;77a5

; ----------------------------------------------------------------------
; DATOS tabla_77A8: 4 destinos del despachador p00:424D (call en p12:77A5, el
;   indice en A): 77B0, 77B2, 77B4, 77B6; lo leen p12:77A5 (8 bytes)
;   0x77a8..0x77b0  (8 bytes)
DATA_tabla_77A8:
	defw 077b0h,077b2h,077b4h,077b6h	; 77a8  -> L_77B0 L_77B2 L_77B4 L_77B6

; ======================================================================
; CODIGO 0x77b0..0x78e7  (311 bytes)
; ======================================================================


L_77B0:
	inc e			;77b0
	ret			;77b1
L_77B2:
	dec e			;77b2
	ret			;77b3
L_77B4:
	inc d			;77b4
	ret			;77b5
L_77B6:
	dec d			;77b6
	ret			;77b7
L_77B8:
	ld a,(0cb01h)		;77b8
	ld hl,0b1cch		;77bb
	call 043f6h		;77be
L_77C1:
	ld a,(0cb0eh)		;77c1
L_77C4:
	dec a			;77c4
	call L_77CA		;77c5
	jr L_77E2		;77c8
L_77CA:
	add a,a			;77ca
	ld b,a			;77cb
	add a,a			;77cc
	add a,b			;77cd
	ld b,a			;77ce
	ld a,(0cb14h)		;77cf
	add a,a			;77d2
	add a,b			;77d3
	jp 0423eh		;77d4
L_77D7:
	ld de,0e900h		;77d7
	push hl			;77da
	push de			;77db
	ld a,(hl)			;77dc
	ld hl,0b620h		;77dd
	jr L_77EB		;77e0
L_77E2:
	ld de,0e900h		;77e2
	push hl			;77e5
	push de			;77e6
	ld a,(hl)			;77e7
	ld hl,0b282h		;77e8
L_77EB:
	call 043f6h		;77eb
	ex de,hl			;77ee
	call 051e0h		;77ef
	pop de			;77f2
	pop hl			;77f3
	inc hl			;77f4
	ld a,(hl)			;77f5
	ld hl,0b620h		;77f6
	call 043f6h		;77f9
	ld a,020h		;77fc
	call 04243h		;77fe
	ex de,hl			;7801
	jp 051e0h		;7802
L_7805:
	ld l,0dch		;7805
	call L_774E		;7807
	jp L_7733		;780a
L_780D:
	ld a,(0cb16h)		;780d
	or a			;7810
	jp nz,L_78AC		;7811
	call L_7829		;7814
	jp L_77B8		;7817
L_781A:
	ld a,(0cb16h)		;781a
	or a			;781d
	jp nz,L_78B2		;781e
	ld l,0e8h		;7821
	call L_774E		;7823
	jp L_7733		;7826
L_7829:
	ld a,(0cb16h)		;7829
	or a			;782c
	jr nz,L_7839		;782d
	ld a,(0cb0eh)		;782f
	cp 003h		;7832
	jp c,L_775D		;7834
	jr L_7851		;7837
L_7839:
	ld a,(0cb17h)		;7839
	cp 003h		;783c
	jr nc,L_7849		;783e
	ld a,(0cb03h)		;7840
	sub 018h		;7843
	ld e,a			;7845
	jp L_7763		;7846
L_7849:
	ld a,(0cb03h)		;7849
	sub 018h		;784c
	ld e,a			;784e
	jr L_7857		;784f
L_7851:
	ld a,(0cb03h)		;7851
	sub 010h		;7854
	ld e,a			;7856
L_7857:
	ld a,(0cb05h)		;7857
	sub 010h		;785a
	ld d,a			;785c
	ld hl,0dc00h		;785d
	ld c,000h		;7860
	push de			;7862
	ld a,d			;7863
	cp 0f0h		;7864
	jr c,L_786A		;7866
	ld e,0e0h		;7868
L_786A:
	call 05d41h		;786a
	call 05d3dh		;786d
	pop de			;7870
	ld a,d			;7871
	add a,010h		;7872
	ld d,a			;7874
	call 05d3dh		;7875
	jp 05d3dh		;7878
L_787B:
	call L_775D		;787b
	jp L_789A		;787e
L_7881:
	call L_7887		;7881
	jp L_7733		;7884
L_7887:
	ld a,(0cb17h)		;7887
	cp 00dh		;788a
	jr nc,L_7894		;788c
	sub 005h		;788e
	add a,0f4h		;7890
	ld l,a			;7892
	ret			;7893
L_7894:
	sub 00dh		;7894
	add a,0cch		;7896
	ld l,a			;7898
	ret			;7899
L_789A:
	ld a,(0cb17h)		;789a
	call L_78A3		;789d
	jp L_77E2		;78a0
L_78A3:
	ld hl,0b26ah		;78a3
	sub 009h		;78a6
	add a,a			;78a8
	jp 0423eh		;78a9
L_78AC:
	call L_775D		;78ac
	jp L_78B8		;78af
L_78B2:
	call L_7887		;78b2
	jp L_7733		;78b5
L_78B8:
	ld a,(0cb17h)		;78b8
	ld hl,0b25ah		;78bb
	cp 00dh		;78be
	jr c,L_78C6		;78c0
	sub 00dh		;78c2
	add a,009h		;78c4
L_78C6:
	sub 005h		;78c6
	add a,a			;78c8
	call 0423eh		;78c9
	jp L_77E2		;78cc
L_78CF:
	call L_775D		;78cf
	jp L_78EB		;78d2
L_78D5:
	ld hl,078e7h		;78d5
	call L_78DE		;78d8
	jp L_7733		;78db
L_78DE:
	ld a,(0cb17h)		;78de
	dec a			;78e1
	call 0423eh		;78e2
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


L_78EB:
	ld a,(0cb17h)		;78eb
	ld hl,0b1d2h		;78ee
	call L_78F7		;78f1
	jp L_77E2		;78f4
L_78F7:
	ld b,a			;78f7
	ld a,(0cb00h)		;78f8
	call 043f6h		;78fb
	ld a,b			;78fe
	dec a			;78ff
	add a,a			;7900
	jp 0423eh		;7901
L_7904:
	ld hl,0790dh		;7904
	call L_78DE		;7907
	jp L_7733		;790a

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


L_7911:
	call L_775D		;7911
	jp L_7924		;7914
L_7917:
	call L_791D		;7917
	jp L_7733		;791a
L_791D:
	ld a,(0cb17h)		;791d
	add a,0efh		;7920
	ld l,a			;7922
	ret			;7923
L_7924:
	ld a,(0cb17h)		;7924
	call L_792D		;7927
	jp L_77E2		;792a
L_792D:
	ld hl,0b25ah		;792d
	dec a			;7930
	add a,a			;7931
	jp 0423eh		;7932
L_7935:
	ld a,(0cb0eh)		;7935
	ld (0d8e0h),a		;7938
	call L_775D		;793b
	jr L_798E		;793e
L_7940:
	call L_7949		;7940
	call L_7973		;7943
	jp L_797E		;7946
L_7949:
	ld a,(0cb0eh)		;7949
	ld (0d8e0h),a		;794c
	ld a,(0cb17h)		;794f
	dec a			;7952
	jr nz,L_7969		;7953
	ld l,0fch		;7955
	ld a,(0d8e0h)		;7957
	cp 003h		;795a
	jr c,L_795F		;795c
	inc l			;795e
L_795F:
	ld h,080h		;795f
	ld a,(0d8e0h)		;7961
	rra			;7964
	ret nc			;7965
	ld h,000h		;7966
	ret			;7968
L_7969:
	ld h,000h		;7969
	ld a,(0d8e0h)		;796b
	dec a			;796e
	add a,0f8h		;796f
	ld l,a			;7971
	ret			;7972
L_7973:
	ld de,000f0h		;7973
L_7976:
	ld bc,08001h		;7976
	ld a,007h		;7979
	jp 04767h		;797b
L_797E:
	ld a,(0d8e0h)		;797e
	add a,0f7h		;7981
	ld l,a			;7983
	ld h,080h		;7984
	ld de,001f0h		;7986
	ld a,007h		;7989
	jp 047abh		;798b
L_798E:
	ld a,(0cb17h)		;798e
	ld hl,0b272h		;7991
	dec a			;7994
	jr z,L_799A		;7995
	ld hl,0b26ah		;7997
L_799A:
	call L_79A0		;799a
	jp L_77E2		;799d
L_79A0:
	ld a,(0d8e0h)		;79a0
	dec a			;79a3
	add a,a			;79a4
	jp 0423eh		;79a5
L_79A8:
	call L_775D		;79a8
	jr L_79D2		;79ab
L_79AD:
	call L_79C1		;79ad
	call L_7973		;79b0
	ld hl,080d0h		;79b3
	call L_774E		;79b6
	ld de,001f0h		;79b9
	ld a,007h		;79bc
	jp 047abh		;79be
L_79C1:
	ld a,(0cb0eh)		;79c1
	ld l,0feh		;79c4
	cp 003h		;79c6
	jr c,L_79CB		;79c8
	inc l			;79ca
L_79CB:
	ld h,000h		;79cb
	rra			;79cd
	ret c			;79ce
	ld h,080h		;79cf
	ret			;79d1
L_79D2:
	ld a,(0cb0eh)		;79d2
	call L_79DB		;79d5
	jp L_77E2		;79d8
L_79DB:
	ld hl,0b27ah		;79db
	dec a			;79de
	add a,a			;79df
	jp 0423eh		;79e0
L_79E3:
	call L_7A45		;79e3
	ld a,(0cb0fh)		;79e6
	or a			;79e9
	ret nz			;79ea
	jp L_7A5C		;79eb
L_79EE:
	call L_7A79		;79ee
	ld a,(0cb0fh)		;79f1
	or a			;79f4
	jr nz,L_7A25		;79f5
	ld hl,0dc00h		;79f7
	ld c,000h		;79fa
	ld a,(0cb05h)		;79fc
	sub 007h		;79ff
	ld d,a			;7a01
	ld a,(0cb03h)		;7a02
	sub 020h		;7a05
	push af			;7a07
	ld b,a			;7a08
	ld a,(0cb14h)		;7a09
	dec a			;7a0c
	ld a,002h		;7a0d
	jr z,L_7A12		;7a0f
	inc a			;7a11
L_7A12:
	add a,b			;7a12
	ld e,a			;7a13
	call 05d41h		;7a14
	call 05d3dh		;7a17
	dec d			;7a1a
	pop af			;7a1b
	add a,010h		;7a1c
	ld e,a			;7a1e
	call 05d3dh		;7a1f
	jp 05d3dh		;7a22
L_7A25:
	ld hl,0dc00h		;7a25
	ld a,(0cb03h)		;7a28
	sub 010h		;7a2b
	ld e,a			;7a2d
	ld a,(0cb05h)		;7a2e
	sub 008h		;7a31
	ld d,a			;7a33
	ld c,000h		;7a34
	call 05d41h		;7a36
	call 05d3dh		;7a39
	ld a,0e0h		;7a3c
	ld (hl),a			;7a3e
	inc l			;7a3f
	inc l			;7a40
	inc l			;7a41
	inc l			;7a42
	ld (hl),a			;7a43
	ret			;7a44
L_7A45:
	ld l,0c8h		;7a45
	ld h,080h		;7a47
	ld a,(0cb14h)		;7a49
	dec a			;7a4c
	jr z,L_7A51		;7a4d
	ld h,000h		;7a4f
L_7A51:
	ld de,000f0h		;7a51
L_7A54:
	ld bc,08001h		;7a54
	ld a,007h		;7a57
	jp 04767h		;7a59
L_7A5C:
	ld a,(0cb0eh)		;7a5c
L_7A5F:
	dec a			;7a5f
	add a,a			;7a60
	ld b,a			;7a61
	add a,a			;7a62
	add a,b			;7a63
	ld b,a			;7a64
	ld a,(0cb14h)		;7a65
	add a,a			;7a68
	add a,b			;7a69
	ld hl,07aa4h		;7a6a
	call 0423eh		;7a6d
	ld a,(hl)			;7a70
	inc hl			;7a71
	ld h,(hl)			;7a72
	ld l,a			;7a73
	ld de,080f0h		;7a74
	jr L_7A54		;7a77
L_7A79:
	ld hl,0b242h		;7a79
	call L_77C1		;7a7c
	ld hl,0e920h		;7a7f
	call L_7A88		;7a82
	ld hl,0e930h		;7a85
L_7A88:
	ld (hl),000h		;7a88
	inc l			;7a8a
	ld (hl),000h		;7a8b
	ld a,(0cb14h)		;7a8d
	dec a			;7a90
	ret z			;7a91
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


L_7ABC:
	ld a,(0cb03h)		;7abc
	sub 018h		;7abf
	ld e,a			;7ac1
	call L_7763		;7ac2
	jr L_7AE5		;7ac5
L_7AC7:
	ld hl,000c9h		;7ac7
	ld de,001f0h		;7aca
	ld a,007h		;7acd
	jp 047abh		;7acf
L_7AD2:
	ld a,(0cb03h)		;7ad2
	sub 010h		;7ad5
	ld e,a			;7ad7
	ld a,(0cb05h)		;7ad8
	add a,008h		;7adb
	ld hl,0dc10h		;7add
	ld c,010h		;7ae0
	jp 05d41h		;7ae2
L_7AE5:
	ld de,0da01h		;7ae5
	ld hl,0da00h		;7ae8
	ld (hl),00bh		;7aeb
	call L_7AFC		;7aed
	ld (hl),04ch		;7af0
	call L_7AFC		;7af2
	ld (hl),003h		;7af5
	call L_7AFC		;7af7
	ld (hl),04ch		;7afa
L_7AFC:
	ld bc,0000fh		;7afc
	ldir		;7aff
	inc hl			;7b01
	inc de			;7b02
	ret			;7b03
L_7B04:
	call L_7A45		;7b04
	ld a,(0cb17h)		;7b07
	jp L_7A5F		;7b0a
L_7B0D:
	call L_775D		;7b0d
	ld hl,0b242h		;7b10
	ld a,(0cb17h)		;7b13
	jp L_77C4		;7b16
L_7B19:
	ld hl,0dc00h		;7b19
	ld a,0e0h		;7b1c
	ld bc,0000fh		;7b1e
	jp 04237h		;7b21
L_7B24:
	call L_7B57		;7b24
	call L_7973		;7b27
	jp L_7B6A		;7b2a
L_7B2D:
	ld hl,0dc00h		;7b2d
	ld a,(0cb03h)		;7b30
	ld e,a			;7b33
	ld a,(0cb05h)		;7b34
	ld d,a			;7b37
	ld c,000h		;7b38
	call 05d41h		;7b3a
	call 05d3dh		;7b3d
	ld a,e			;7b40
	add a,010h		;7b41
	ld e,a			;7b43
	call 05d3dh		;7b44
	call 05d3dh		;7b47
	ld a,(0cb4ah)		;7b4a
	ld hl,0b1d8h		;7b4d
	add a,a			;7b50
	call 0423eh		;7b51
	jp L_77D7		;7b54
L_7B57:
	ld a,(0cb4ah)		;7b57
	ld hl,07b60h		;7b5a
	jp 043f6h		;7b5d

; ----------------------------------------------------------------------
; DATOS resto_7B60: lo apuntan con el banco puesto p12:7B5A (0x7B60); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p12:7B5A (10 bytes)
;   0x7b60..0x7b6a  (10 bytes)
DATA_resto_7B60:
	defb 0c5h,000h,0c5h,080h,0c6h,000h,0c6h,080h,0c7h,000h	; 7b60  ..........

; ======================================================================
; CODIGO 0x7b6a..0x7ed0  (870 bytes)
; ======================================================================


L_7B6A:
	ld hl,080c7h		;7b6a
	ld de,080f0h		;7b6d
	jp L_7976		;7b70
L_7B73:
	ld a,(0cb01h)		;7b73
	cp 00bh		;7b76
	ret z			;7b78
	ld hl,0e900h		;7b79
	ld de,0da00h		;7b7c
	ld bc,00040h		;7b7f
	ldir		;7b82
L_7B84:
	ret			;7b84
L_7B85:
	ld a,(0cb21h)		;7b85
	cp 002h		;7b88
	jr nz,L_7B91		;7b8a
	ld a,(0cb62h)		;7b8c
	or a			;7b8f
	ret nz			;7b90
L_7B91:
	ld a,(0cb3fh)		;7b91
	or a			;7b94
	ret z			;7b95
	dec a			;7b96
	ret z			;7b97
	ld hl,080cah		;7b98
	ld a,(0ca03h)		;7b9b
	rra			;7b9e
	rra			;7b9f
	jr c,L_7BA5		;7ba0
	ld hl,000cbh		;7ba2
L_7BA5:
	ld de,000f0h		;7ba5
	ld bc,08001h		;7ba8
	ld a,007h		;7bab
	jp 04767h		;7bad
L_7BB0:
	ld a,(0cb21h)		;7bb0
	cp 002h		;7bb3
	jr nz,L_7BBC		;7bb5
	ld a,(0cb62h)		;7bb7
	or a			;7bba
	ret nz			;7bbb
L_7BBC:
	ld a,(0cb3fh)		;7bbc
	or a			;7bbf
	ret z			;7bc0
	dec a			;7bc1
	ret z			;7bc2
	call L_7BDA		;7bc3
	ld hl,0da00h		;7bc6
	ld bc,0000fh		;7bc9
	ld a,007h		;7bcc
	call 04237h		;7bce
	inc hl			;7bd1
	ld bc,0000fh		;7bd2
	ld a,00fh		;7bd5
	jp 04237h		;7bd7
L_7BDA:
	ld a,(0cb03h)		;7bda
	sub 010h		;7bdd
	ld e,a			;7bdf
	ld a,(0cb05h)		;7be0
	sub 008h		;7be3
	ld d,a			;7be5
	ld hl,0dc00h		;7be6
	ld c,000h		;7be9
	call 05d41h		;7beb
	call 05d3dh		;7bee
L_7BF1:
	ld a,0e0h		;7bf1
	ld (hl),a			;7bf3
	inc l			;7bf4
	inc l			;7bf5
	inc l			;7bf6
	inc l			;7bf7
	ld (hl),a			;7bf8
	ret			;7bf9
L_7BFA:
	ld a,(0cb3fh)		;7bfa
	or a			;7bfd
	ret z			;7bfe
	cp 001h		;7bff
	ret nz			;7c01
	ld hl,0c0f0h		;7c02
	ld bc,08001h		;7c05
	xor a			;7c08
	ld d,001h		;7c09
	call 046ffh		;7c0b
	ld hl,000cah		;7c0e
	ld a,(0ca03h)		;7c11
	rra			;7c14
	rra			;7c15
	jr c,L_7C1A		;7c16
	ld h,040h		;7c18
L_7C1A:
	ld de,080f0h		;7c1a
	ld bc,04001h		;7c1d
	ld a,007h		;7c20
	jp 04767h		;7c22
L_7C25:
	ld a,(0cb3fh)		;7c25
	or a			;7c28
	ret z			;7c29
	cp 001h		;7c2a
	ret nz			;7c2c
	ld a,00bh		;7c2d
	ld (0cb43h),a		;7c2f
	ld hl,0dc00h		;7c32
	ld de,0dc08h		;7c35
	ld a,(hl)			;7c38
	add a,010h		;7c39
	ld (de),a			;7c3b
	inc hl			;7c3c
	inc de			;7c3d
	ldi		;7c3e
	ld a,008h		;7c40
	ld (de),a			;7c42
	ld hl,0dc0ch		;7c43
	ld (hl),0e0h		;7c46
	ld hl,0da20h		;7c48
	ld bc,0000fh		;7c4b
	ld a,007h		;7c4e
	jp 04237h		;7c50
	ld hl,0dc00h		;7c53
	ld a,0e0h		;7c56
	ld bc,0000fh		;7c58
	jp 04237h		;7c5b
L_7C5E:
	ld a,(0cb37h)		;7c5e
	or a			;7c61
	ret z			;7c62
	ld a,(0cb29h)		;7c63
	ld b,a			;7c66
	ld a,020h		;7c67
	sub b			;7c69
	ld (0cb43h),a		;7c6a
	ret			;7c6d
L_7C6E:
	ld a,(0cb43h)		;7c6e
	ld c,a			;7c71
L_7C72:
	ld hl,0dc00h		;7c72
	ld de,00004h		;7c75
	ld b,004h		;7c78
L_7C7A:
	ld a,(hl)			;7c7a
	add a,c			;7c7b
	ld (hl),a			;7c7c
	add hl,de			;7c7d
	djnz L_7C7A		;7c7e
	ret			;7c80
L_7C81:
	ld a,(0cb54h)		;7c81
	or a			;7c84
	ret z			;7c85
	ld c,0f8h		;7c86
	jr L_7C72		;7c88
L_7C8A:
	ld hl,0cb28h		;7c8a
	ld a,(hl)			;7c8d
	or a			;7c8e
	ret z			;7c8f
	ld a,(0cb01h)		;7c90
	cp 002h		;7c93
	jr nz,L_7CA4		;7c95
	ld a,(0cb16h)		;7c97
	or a			;7c9a
	jr nz,L_7CA4		;7c9b
	ld a,(0cb0eh)		;7c9d
	cp 003h		;7ca0
	jr nc,L_7CC0		;7ca2
L_7CA4:
	ld a,(0cb29h)		;7ca4
	cp 020h		;7ca7
	ret z			;7ca9
	ld b,a			;7caa
	ld a,020h		;7cab
	sub b			;7cad
	ld c,a			;7cae
	ld b,000h		;7caf
	sub 010h		;7cb1
	jr c,L_7CB8		;7cb3
	jr z,L_7CB8		;7cb5
	ld b,a			;7cb7
L_7CB8:
	ld a,(hl)			;7cb8
	dec a			;7cb9
	jr nz,L_7CBE		;7cba
	jr L_7CC9		;7cbc
L_7CBE:
	jr L_7D0D		;7cbe
L_7CC0:
	ld hl,0da00h		;7cc0
	ld bc,0003fh		;7cc3
	jp 04236h		;7cc6
L_7CC9:
	push bc			;7cc9
	ld b,000h		;7cca
	ld hl,0da00h		;7ccc
	ld de,0da01h		;7ccf
	ld (hl),000h		;7cd2
	dec c			;7cd4
	jr z,L_7CD9		;7cd5
	ldir		;7cd7
L_7CD9:
	pop bc			;7cd9
	push bc			;7cda
	ld b,000h		;7cdb
	ld hl,0da10h		;7cdd
	ld de,0da11h		;7ce0
	ld (hl),000h		;7ce3
	dec c			;7ce5
	jr z,L_7CEA		;7ce6
	ldir		;7ce8
L_7CEA:
	pop bc			;7cea
	ld a,b			;7ceb
	or a			;7cec
	ret z			;7ced
	ld c,b			;7cee
	ld b,000h		;7cef
	push bc			;7cf1
	ld hl,0da20h		;7cf2
	ld de,0da21h		;7cf5
	ld (hl),000h		;7cf8
	dec c			;7cfa
	jr z,L_7CFF		;7cfb
	ldir		;7cfd
L_7CFF:
	pop bc			;7cff
	ld hl,0da30h		;7d00
	ld de,0da31h		;7d03
	ld (hl),000h		;7d06
	dec c			;7d08
	ret z			;7d09
	ldir		;7d0a
	ret			;7d0c
L_7D0D:
	push bc			;7d0d
	ld b,000h		;7d0e
	ld hl,0da2fh		;7d10
	ld de,0da2eh		;7d13
	ld (hl),000h		;7d16
	dec c			;7d18
	jr z,L_7D1D		;7d19
	lddr		;7d1b
L_7D1D:
	pop bc			;7d1d
	push bc			;7d1e
	ld b,000h		;7d1f
	ld hl,0da3fh		;7d21
	ld de,0da3eh		;7d24
	ld (hl),000h		;7d27
	dec c			;7d29
	jr z,L_7D2E		;7d2a
	lddr		;7d2c
L_7D2E:
	pop bc			;7d2e
	ld a,b			;7d2f
	or a			;7d30
	ret z			;7d31
	ld c,b			;7d32
	ld b,000h		;7d33
	push bc			;7d35
	ld hl,0da0fh		;7d36
	ld de,0da0eh		;7d39
	ld (hl),000h		;7d3c
	dec c			;7d3e
	jr z,L_7D43		;7d3f
	lddr		;7d41
L_7D43:
	pop bc			;7d43
	ld hl,0da1fh		;7d44
	ld de,0da1eh		;7d47
	ld (hl),000h		;7d4a
	dec c			;7d4c
	ret z			;7d4d
	lddr		;7d4e
	ret			;7d50
L_7D51:
	ld a,(0e040h)		;7d51
	or a			;7d54
	ret nz			;7d55
	ld a,(0caa8h)		;7d56
	or a			;7d59
	ret nz			;7d5a
	ld a,(0cb4bh)		;7d5b
	or a			;7d5e
	jr z,L_7D68		;7d5f
	ld a,(0ca03h)		;7d61
	rra			;7d64
	ret c			;7d65
	jr L_7D72		;7d66
L_7D68:
	ld hl,0cb3dh		;7d68
	ld a,(hl)			;7d6b
	or a			;7d6c
	ret z			;7d6d
	inc hl			;7d6e
	ld a,(hl)			;7d6f
	rra			;7d70
	ret c			;7d71
L_7D72:
	ld hl,0da00h		;7d72
	ld bc,0003fh		;7d75
	jp 04236h		;7d78
L_7D7B:
	ld a,(0ca9bh)		;7d7b
	or a			;7d7e
	ret z			;7d7f
	ld a,010h		;7d80
	ld (0cb43h),a		;7d82
	ld bc,00210h		;7d85
	ld a,(0cb16h)		;7d88
	or a			;7d8b
	jp nz,L_7D99		;7d8c
	ld a,(0cb01h)		;7d8f
	cp 002h		;7d92
	jr nz,L_7D99		;7d94
	ld bc,00200h		;7d96
L_7D99:
	ld hl,0cb28h		;7d99
	ld (hl),b			;7d9c
	inc l			;7d9d
	ld (hl),c			;7d9e
	ret			;7d9f
L_7DA0:
	ld hl,0cb4bh		;7da0
	ld a,(hl)			;7da3
	or a			;7da4
	ret z			;7da5
	inc l			;7da6
	inc l			;7da7
	ld c,0f0h		;7da8
	ld a,(hl)			;7daa
	or a			;7dab
	jr z,L_7DB0		;7dac
	ld c,0f8h		;7dae
L_7DB0:
	ld hl,0dc78h		;7db0
	ld a,(0cb03h)		;7db3
	sub 028h		;7db6
	ld e,a			;7db8
	ld a,(0cb05h)		;7db9
	sub 008h		;7dbc
	ld d,a			;7dbe
	call 05d41h		;7dbf
	call 05d3dh		;7dc2
	ld hl,0dbe0h		;7dc5
	ld de,0dbe1h		;7dc8
	ld (hl),00ah		;7dcb
	ld bc,0000fh		;7dcd
	ldir		;7dd0
	inc de			;7dd2
	inc hl			;7dd3
	ld (hl),00bh		;7dd4
	ld bc,0000fh		;7dd6
	ldir		;7dd9
	ret			;7ddb
L_7DDC:
	ld ix,0ce00h		;7ddc
	ld b,018h		;7de0
L_7DE2:
	push bc			;7de2
	ld a,(ix+000h)		;7de3
	ld c,a			;7de6
	and a			;7de7
	jr z,L_7E2C		;7de8
	cp 008h		;7dea
	jr nz,L_7DF4		;7dec
	ld a,(0d441h)		;7dee
	and a			;7df1
	jr nz,L_7E2C		;7df2
L_7DF4:
	call L_7E35		;7df4
	jr c,L_7E2C		;7df7
	call 08100h		;7df9
	jr nz,L_7E2C		;7dfc
	ld a,c			;7dfe
	ld hl,0a808h		;7dff
	call 043f6h		;7e02
	ld a,(hl)			;7e05
	add a,a			;7e06
	ld c,a			;7e07
	inc hl			;7e08
	ld a,(ix+00dh)		;7e09
	and a			;7e0c
	jr z,L_7E23		;7e0d
	ld b,a			;7e0f
	ld a,(0d443h)		;7e10
	and a			;7e13
	jr z,L_7E1F		;7e14
	ld a,(0ca76h)		;7e16
	cp 002h		;7e19
	ld a,000h		;7e1b
	jr z,L_7E23		;7e1d
L_7E1F:
	xor a			;7e1f
L_7E20:
	add a,c			;7e20
	djnz L_7E20		;7e21
L_7E23:
	call 0423eh		;7e23
	call 08273h		;7e26
	call L_7E4B		;7e29
L_7E2C:
	ld bc,00040h		;7e2c
	add ix,bc		;7e2f
	pop bc			;7e31
	djnz L_7DE2		;7e32
	ret			;7e34
L_7E35:
	push bc			;7e35
	call L_7E3B		;7e36
	pop bc			;7e39
	ret			;7e3a
L_7E3B:
	ld a,(0c382h)		;7e3b
	push af			;7e3e
	call 04224h		;7e3f
	call 0806fh		;7e42
	pop bc			;7e45
	ld a,b			;7e46
	push af			;7e47
	jp 0422ch		;7e48
L_7E4B:
	ld a,(ix+01fh)		;7e4b
	and a			;7e4e
	jr z,L_7E54		;7e4f
	dec (ix+01fh)		;7e51
L_7E54:
	ld b,012h		;7e54
L_7E56:
	ld a,(de)			;7e56
	and a			;7e57
	ret z			;7e58
	push bc			;7e59
	push de			;7e5a
	call L_7E64		;7e5b
	pop de			;7e5e
	pop bc			;7e5f
	inc e			;7e60
	djnz L_7E56		;7e61
	ret			;7e63
L_7E64:
	dec a			;7e64
	ld c,a			;7e65
	add a,a			;7e66
	add a,a			;7e67
	ld de,0dc28h		;7e68
	add a,e			;7e6b
	ld e,a			;7e6c
	ld a,c			;7e6d
	cp 004h		;7e6e
	jr nz,L_7E7A		;7e70
	ld a,(ix+000h)		;7e72
	cp 00bh		;7e75
	jp z,L_7ED4		;7e77
L_7E7A:
	ld a,(hl)			;7e7a
	exx			;7e7b
	ld hl,0a7eeh		;7e7c
	call 043f6h		;7e7f
	ld a,l			;7e82
	exx			;7e83
	add a,(ix+003h)		;7e84
	cp 0f0h		;7e87
	jr nc,L_7E91		;7e89
	cp 0b4h		;7e8b
	jr c,L_7E91		;7e8d
	ld a,0e0h		;7e8f
L_7E91:
	push bc			;7e91
	call L_7EB0		;7e92
	pop bc			;7e95
	ld (de),a			;7e96
	inc e			;7e97
	exx			;7e98
	ld a,h			;7e99
	exx			;7e9a
	add a,(ix+005h)		;7e9b
	cp 0b1h		;7e9e
	jr c,L_7EA9		;7ea0
	push af			;7ea2
	dec e			;7ea3
	ld a,0e0h		;7ea4
	ld (de),a			;7ea6
	inc e			;7ea7
	pop af			;7ea8
L_7EA9:
	ld (de),a			;7ea9
	inc e			;7eaa
	inc hl			;7eab
	ld a,(hl)			;7eac
	ld (de),a			;7ead
	inc hl			;7eae
	ret			;7eaf
L_7EB0:
	ld b,a			;7eb0
	cp 0e0h		;7eb1
	ret z			;7eb3
	ld a,(ix+01fh)		;7eb4
	and a			;7eb7
	jr z,L_7ECE		;7eb8
	ld c,a			;7eba
	ld a,(ix+000h)		;7ebb
	cp 010h		;7ebe
	jr nc,L_7ECE		;7ec0
	push hl			;7ec2
	ld hl,l7ecfh		;7ec3
	ld a,c			;7ec6
	call 0423eh		;7ec7
	ld a,(hl)			;7eca
	pop hl			;7ecb
	add a,b			;7ecc
	ret			;7ecd
L_7ECE:
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


L_7ED4:
	ld a,(0d422h)		;7ed4
	rra			;7ed7
	call L_7EFF		;7ed8
	add a,(ix+003h)		;7edb
	sub 01ch		;7ede
	ld b,a			;7ee0
	ld a,(ix+00dh)		;7ee1
	cp 004h		;7ee4
	jr c,L_7EEA		;7ee6
	ld b,0e0h		;7ee8
L_7EEA:
	ld a,b			;7eea
	ld (de),a			;7eeb
	inc hl			;7eec
	inc e			;7eed
	ld a,(0d422h)		;7eee
	call L_7EFF		;7ef1
	add a,(ix+005h)		;7ef4
	sub 00ch		;7ef7
	ld (de),a			;7ef9
	inc e			;7efa
	ld a,090h		;7efb
	ld (de),a			;7efd
	ret			;7efe
L_7EFF:
	push hl			;7eff
	and 01fh		;7f00
	cp 010h		;7f02
	jr c,L_7F0A		;7f04
	sub 01fh		;7f06
	neg		;7f08
L_7F0A:
	and 00fh		;7f0a
	ld hl,07f15h		;7f0c
	call 0423eh		;7f0f
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


L_7F25:
	call 0418eh		;7f25
	exx			;7f28
	call L_7F3B		;7f29
	exx			;7f2c
	push hl			;7f2d
	ld hl,0cb74h		;7f2e
	ld a,(hl)			;7f31
	cp 0ffh		;7f32
	jr z,L_7F37		;7f34
	inc (hl)			;7f36
L_7F37:
	pop hl			;7f37
	jp 041b0h		;7f38
L_7F3B:
	ld a,(0ca4ah)		;7f3b
	cp 003h		;7f3e
	jr nz,L_7F7B		;7f40
	ld b,000h		;7f42
	ld a,(0ca4bh)		;7f44
	ld hl,0a5eah		;7f47
L_7F4A:
	cp (hl)			;7f4a
	jr z,L_7F58		;7f4b
	inc hl			;7f4d
	inc b			;7f4e
	ld c,a			;7f4f
	ld a,b			;7f50
	cp 003h		;7f51
	ld a,c			;7f53
	jr c,L_7F4A		;7f54
	jr L_7F9A		;7f56
L_7F58:
	ld hl,0a5edh		;7f58
	ld a,b			;7f5b
	call 043f6h		;7f5c
L_7F5F:
	ld a,(0cb74h)		;7f5f
	call 0423eh		;7f62
	ld a,(hl)			;7f65
	cp 0ffh		;7f66
	jr z,L_7F9A		;7f68
	ld hl,0a62eh		;7f6a
	add a,a			;7f6d
	add a,a			;7f6e
	call 0423eh		;7f6f
	ld e,(hl)			;7f72
	inc hl			;7f73
	ld d,(hl)			;7f74
	inc hl			;7f75
	ld a,(hl)			;7f76
	inc hl			;7f77
	ld h,(hl)			;7f78
	ld l,a			;7f79
	ret			;7f7a
L_7F7B:
	ld hl,0a623h		;7f7b
	ld a,(0ca76h)		;7f7e
	cp 00dh		;7f81
	jr z,L_7F5F		;7f83
	ld hl,0a60dh		;7f85
	cp 031h		;7f88
	jr nz,L_7F9A		;7f8a
	ld a,(0ca51h)		;7f8c
	cp 006h		;7f8f
	jr z,L_7F5F		;7f91
	ld hl,0a618h		;7f93
	cp 008h		;7f96
	jr z,L_7F5F		;7f98
L_7F9A:
	ld hl,0cb74h		;7f9a
	ld (hl),0ffh		;7f9d
	ret			;7f9f
L_7FA0:
	call L_7FC6		;7fa0
	ld a,(ix+003h)		;7fa3
	dec a			;7fa6
	add a,a			;7fa7
	ld hl,07fbeh		;7fa8
	call 0423eh		;7fab
	ld a,(hl)			;7fae
	add a,(ix+000h)		;7faf
	ld (ix+000h),a		;7fb2
	inc hl			;7fb5
	ld a,(hl)			;7fb6
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


L_7FC6:
	ld a,(0ca03h)		;7fc6
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
