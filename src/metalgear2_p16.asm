; ==========================================================================
; METAL GEAR 2 SOLID SNAKE - Konami (1990) - MSX2 - MegaROM RC-767 de 512 KB (Konami SCC) - banco 16 (se ejecuta en 0x4000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x04000


; ======================================================================
; CODIGO 0x4000..0x45be  (1470 bytes)
; ======================================================================


entrada_arranque:		; jp p16:4009
	jp calla_todo		;4000   ; calla_todo: arranque del sonido: todo callado
entrada_pide:		; jp p16:4024
	jp pide_sonido		;4003   ; pide_sonido: pide el sonido A por el puente de 0xC340 (copiado de p03:A14B)
entrada_cuadro:		; jp p16:428F
	jp sonido_cada_cuadro		;4006   ; sonido_cada_cuadro: el sonido de un cuadro: los ocho canales
calla_todo:		; arranque del sonido: todo callado
	ld hl,0ffffh		;4009
	ld (0c64bh),hl		;400c
	ld hl,0c64dh		;400f
	ld de,0c64eh		;4012
	ld (hl),001h		;4015
	ld bc,0000eh		;4017
	ldir		;401a
	call L_532C		;401c
	ld a,0bfh		;401f
	jp L_51A4		;4021
pide_sonido:		; pide el sonido A (0xF0-0xFF son ordenes: callar, fundir...)
	ld c,a			;4024
	ld (0c661h),a		;4025   ; guarda el ultimo sonido pedido
	call banco_de_musica		;4028   ; banco_de_musica: el banco de la musica A (0x6A-0xEF) de p16:4CF9 a 0xC68F
	ld a,c			;402b
	cp 0f0h		;402c
	jp c,L_4063		;402e
	cp 0f3h		;4031
	jp z,L_4146		;4033
	cp 0f4h		;4036
	jp z,L_4151		;4038
	cp 0f6h		;403b
	jp z,L_4159		;403d
	cp 0f7h		;4040
	jp z,L_4161		;4042
	cp 0f8h		;4045
	jp z,L_4169		;4047
	cp 0f9h		;404a
	jp z,L_4171		;404c
	cp 0fbh		;404f
	jp z,L_4270		;4051
	cp 0fah		;4054
	jp z,L_421F		;4056
	cp 0f1h		;4059
	jp z,L_417F		;405b
	cp 0f2h		;405e
	call z,L_41B8		;4060
L_4063:
	ld hl,065a9h		;4063   ; sonidos: 171 palabras
	add a,c			;4066
	ld e,a			;4067
	ld d,000h		;4068
	jp nc,L_406F		;406a
	ld d,001h		;406d
L_406F:
	add hl,de			;406f
	ld e,(hl)			;4070
	inc hl			;4071
	ld d,(hl)			;4072
	ex de,hl			;4073
	ld a,(hl)			;4074
	ld b,a			;4075
	inc hl			;4076
	ld c,(hl)			;4077
	ex de,hl			;4078
	inc de			;4079
	cp 010h		;407a
	jp z,L_413D		;407c
	cp 030h		;407f
	jp nz,L_40A1		;4081
	ld a,(0c661h)		;4084   ; lee el ultimo sonido pedido
	cp 040h		;4087
	jp nz,L_4092		;4089
	ld a,(0c480h)		;408c
	cp 040h		;408f
	ret z			;4091
L_4092:
	ld a,c			;4092
	ld hl,0c481h		;4093
	cp (hl)			;4096
	ret c			;4097
	call arranca_canal		;4098   ; arranca_canal: pone en marcha un canal con el puntero de partitura de DE
	ld hl,0c4c1h		;409b
	jp arranca_canal		;409e   ; arranca_canal: pone en marcha un canal con el puntero de partitura de DE
L_40A1:
	ld a,c			;40a1
	ld hl,0c401h		;40a2
	cp (hl)			;40a5
	ret c			;40a6
	ld a,(0c661h)		;40a7   ; lee el ultimo sonido pedido
	cp 082h		;40aa
	jp z,L_40B4		;40ac
	cp 088h		;40af
	jp nz,L_40BC		;40b1
L_40B4:
	ld a,001h		;40b4
	ld (0c697h),a		;40b6
	jp L_40C0		;40b9
L_40BC:
	xor a			;40bc
	ld (0c697h),a		;40bd
L_40C0:
	call L_4146		;40c0
	ld a,b			;40c3
	cp 0cfh		;40c4
	jp nz,L_40ED		;40c6
	ld hl,0c401h		;40c9
	call arranca_canal		;40cc   ; arranca_canal: pone en marcha un canal con el puntero de partitura de DE
	ld hl,0c441h		;40cf
	call arranca_canal		;40d2   ; arranca_canal: pone en marcha un canal con el puntero de partitura de DE
	ld hl,0c501h		;40d5
	call arranca_canal		;40d8   ; arranca_canal: pone en marcha un canal con el puntero de partitura de DE
	ld hl,0c541h		;40db
	call arranca_canal		;40de   ; arranca_canal: pone en marcha un canal con el puntero de partitura de DE
	ld hl,0c581h		;40e1
	call arranca_canal		;40e4   ; arranca_canal: pone en marcha un canal con el puntero de partitura de DE
	ld hl,0c5c1h		;40e7
	jp arranca_canal		;40ea   ; arranca_canal: pone en marcha un canal con el puntero de partitura de DE
L_40ED:
	ld hl,0c401h		;40ed
	call arranca_canal		;40f0   ; arranca_canal: pone en marcha un canal con el puntero de partitura de DE
	ld hl,0c441h		;40f3
	call arranca_canal		;40f6   ; arranca_canal: pone en marcha un canal con el puntero de partitura de DE
	ld hl,0c481h		;40f9
	call arranca_canal		;40fc   ; arranca_canal: pone en marcha un canal con el puntero de partitura de DE
	ld hl,0c4c1h		;40ff
	call arranca_canal		;4102   ; arranca_canal: pone en marcha un canal con el puntero de partitura de DE
	ld hl,0c501h		;4105
	call arranca_canal		;4108   ; arranca_canal: pone en marcha un canal con el puntero de partitura de DE
	ld hl,0c541h		;410b
	call arranca_canal		;410e   ; arranca_canal: pone en marcha un canal con el puntero de partitura de DE
	ld hl,0c581h		;4111
	call arranca_canal		;4114   ; arranca_canal: pone en marcha un canal con el puntero de partitura de DE
	ld hl,0c5c1h		;4117
arranca_canal:		; pone en marcha un canal con el puntero de partitura de DE
	ld (hl),c			;411a
	dec hl			;411b
	ld a,(0c661h)		;411c   ; lee el ultimo sonido pedido
	ld (hl),a			;411f
	inc hl			;4120
	inc hl			;4121
	ld a,(de)			;4122
	ld (hl),a			;4123
	inc hl			;4124
	inc de			;4125
	ld a,(de)			;4126
	ld (hl),a			;4127
	inc hl			;4128
	ld a,001h		;4129
	ld (hl),a			;412b
	inc de			;412c
	inc hl			;412d
	push bc			;412e
	push de			;412f
	ld d,h			;4130
	ld e,l			;4131
	inc de			;4132
	ld bc,0003ah		;4133
	ld (hl),000h		;4136
	ldir		;4138
	pop de			;413a
	pop bc			;413b
	ret			;413c
L_413D:
	ld a,c			;413d
	ld hl,0c4c1h		;413e
	cp (hl)			;4141
	ret c			;4142
	jp arranca_canal		;4143   ; arranca_canal: pone en marcha un canal con el puntero de partitura de DE
L_4146:
	ld a,(0c640h)		;4146
	and 006h		;4149
	ld (0c640h),a		;414b
	jp L_4178		;414e
L_4151:
	ld hl,0c640h		;4151
	set 4,(hl)		;4154
	jp L_4176		;4156
L_4159:
	ld hl,0c640h		;4159
	set 5,(hl)		;415c
	jp L_4176		;415e
L_4161:
	ld hl,0c640h		;4161
	set 6,(hl)		;4164
	jp L_4176		;4166
L_4169:
	ld hl,0c640h		;4169
	set 3,(hl)		;416c
	jp L_4176		;416e
L_4171:
	ld hl,0c640h		;4171
	set 7,(hl)		;4174
L_4176:
	set 0,(hl)		;4176
L_4178:
	ld hl,00000h		;4178
	ld (0c641h),hl		;417b
	ret			;417e
L_417F:
	ld hl,0c640h		;417f
	res 1,(hl)		;4182
	bit 2,(hl)		;4184
	jp z,L_418D		;4186
	res 2,(hl)		;4189
	set 0,(hl)		;418b
L_418D:
	ld hl,0c600h		;418d
	ld de,0c4c0h		;4190
	ld bc,00040h		;4193
	ldir		;4196
	ld hl,0c4ebh		;4198
	set 7,(hl)		;419b
	ld a,(0c65dh)		;419d
	ld (0c40fh),a		;41a0
	ld a,(0c65eh)		;41a3
	ld (0c44fh),a		;41a6
	ld a,(0c65fh)		;41a9
	ld (0c48fh),a		;41ac
	ld hl,0ffffh		;41af
	ld (0c64bh),hl		;41b2
	jp L_532C		;41b5
L_41B8:
	ld hl,0c640h		;41b8
	set 1,(hl)		;41bb
	bit 0,(hl)		;41bd
	jp z,L_41C6		;41bf
	res 0,(hl)		;41c2
	set 2,(hl)		;41c4
L_41C6:
	ld hl,0c4c0h		;41c6
	ld de,0c600h		;41c9
	ld bc,00040h		;41cc
	ldir		;41cf
	ld a,(0c40fh)		;41d1
	ld (0c65dh),a		;41d4
	ld a,(0c44fh)		;41d7
	ld (0c65eh),a		;41da
	ld a,(0c48fh)		;41dd
	ld (0c65fh),a		;41e0
	xor a			;41e3
	ld (0c40fh),a		;41e4
	ld (0c44fh),a		;41e7
	ld (0c48fh),a		;41ea
	ld a,(0c40eh)		;41ed
	res 4,a		;41f0
	ld (0c40eh),a		;41f2
	ld a,(0c44eh)		;41f5
	res 4,a		;41f8
	ld (0c44eh),a		;41fa
	ld a,(0c48eh)		;41fd
	res 4,a		;4200
	ld (0c48eh),a		;4202
	ld a,03fh		;4205
	ld (09000h),a		;4207   ; 0x3F en 0x9000: los registros del SCC en 0x9800
	ld hl,00000h		;420a
	ld (0988bh),hl		;420d
	ld (0988dh),hl		;4210
	ld a,012h		;4213
	ld (09000h),a		;4215   ; el mapper: pone en 0x8000 el banco de A
	ld a,006h		;4218
	ld (0c661h),a		;421a   ; guarda el ultimo sonido pedido
	ld c,a			;421d
	ret			;421e
L_421F:
	ld a,001h		;421f
	ld (0c698h),a		;4221
	ld a,(0c40fh)		;4224
	ld (0c65dh),a		;4227
	ld a,(0c44fh)		;422a
	ld (0c65eh),a		;422d
	ld a,(0c48fh)		;4230
	ld (0c65fh),a		;4233
	xor a			;4236
	ld (0c40fh),a		;4237
	ld (0c44fh),a		;423a
	ld (0c48fh),a		;423d
	ld a,(0c40eh)		;4240
	res 4,a		;4243
	ld (0c40eh),a		;4245
	ld a,(0c44eh)		;4248
	res 4,a		;424b
	ld (0c44eh),a		;424d
	ld a,(0c48eh)		;4250
	res 4,a		;4253
	ld (0c48eh),a		;4255
	ld a,03fh		;4258
	ld (09000h),a		;425a   ; 0x3F en 0x9000: los registros del SCC en 0x9800
	xor a			;425d
	ld (0988ah),a		;425e
	ld hl,00000h		;4261
	ld (0988bh),hl		;4264
	ld (0988dh),hl		;4267
	ld a,012h		;426a
	ld (09000h),a		;426c   ; el mapper: pone en 0x8000 el banco de A
	ret			;426f
L_4270:
	xor a			;4270
	ld (0c698h),a		;4271
	ld a,(0c65dh)		;4274
	ld (0c40fh),a		;4277
	ld a,(0c65eh)		;427a
	ld (0c44fh),a		;427d
	ld a,(0c65fh)		;4280
	ld (0c48fh),a		;4283
	ld hl,0ffffh		;4286
	ld (0c64bh),hl		;4289
	jp L_532C		;428c
sonido_cada_cuadro:		; el sonido de un cuadro: los ocho canales
	ld a,(0c643h)		;428f
	call L_51A4		;4292
	call pon_banco_de_musica		;4295   ; pon_banco_de_musica: pone en 0xA000 el banco de 0xC68F
	ld a,(0fda2h)		;4298   ; lee una copia de cuadros para el sonido (p16:4298)
	ld hl,0c660h		;429b
	cp (hl)			;429e
	jp z,L_42C6		;429f
	ld ix,0c4c0h		;42a2
	set 7,(ix+02bh)		;42a6
	ld ix,0c500h		;42aa
	set 7,(ix+02bh)		;42ae
	ld ix,0c540h		;42b2
	set 7,(ix+02bh)		;42b6
	ld ix,0c580h		;42ba
	set 7,(ix+02bh)		;42be
	ld a,(0fda2h)		;42c2   ; lee una copia de cuadros para el sonido (p16:4298)
	ld (hl),a			;42c5
L_42C6:
	inc (hl)			;42c6
	ld a,(hl)			;42c7
	ld (0fda2h),a		;42c8   ; guarda una copia de cuadros para el sonido (p16:4298)
	ld a,(0c698h)		;42cb
	or a			;42ce
	jp nz,L_50CC		;42cf
	ld hl,0c640h		;42d2
	bit 1,(hl)		;42d5
	jp nz,L_435A		;42d7
	bit 0,(hl)		;42da
	call nz,L_4B56		;42dc
	ld a,001h		;42df
	ld (0c644h),a		;42e1   ; guarda el canal de sonido que se esta tocando (1, 2, 4...)
	ld ix,0c400h		;42e4
	call canal_cada_cuadro		;42e8   ; canal_cada_cuadro: un cuadro de un canal: cuenta la nota y lee la siguiente
	ld a,002h		;42eb
	ld (0c644h),a		;42ed   ; guarda el canal de sonido que se esta tocando (1, 2, 4...)
	ld ix,0c440h		;42f0
	call canal_cada_cuadro		;42f4   ; canal_cada_cuadro: un cuadro de un canal: cuenta la nota y lee la siguiente
	ld a,004h		;42f7
	ld (0c644h),a		;42f9   ; guarda el canal de sonido que se esta tocando (1, 2, 4...)
	ld ix,0c480h		;42fc
	call canal_cada_cuadro		;4300   ; canal_cada_cuadro: un cuadro de un canal: cuenta la nota y lee la siguiente
	ld a,008h		;4303
	ld (0c644h),a		;4305   ; guarda el canal de sonido que se esta tocando (1, 2, 4...)
	ld ix,0c4c0h		;4308
	call canal_cada_cuadro		;430c   ; canal_cada_cuadro: un cuadro de un canal: cuenta la nota y lee la siguiente
	ld a,010h		;430f
	ld (0c644h),a		;4311   ; guarda el canal de sonido que se esta tocando (1, 2, 4...)
	ld ix,0c500h		;4314
	call canal_cada_cuadro		;4318   ; canal_cada_cuadro: un cuadro de un canal: cuenta la nota y lee la siguiente
	ld a,020h		;431b
	ld (0c644h),a		;431d   ; guarda el canal de sonido que se esta tocando (1, 2, 4...)
	ld ix,0c540h		;4320
	call canal_cada_cuadro		;4324   ; canal_cada_cuadro: un cuadro de un canal: cuenta la nota y lee la siguiente
	ld a,040h		;4327
	ld (0c644h),a		;4329   ; guarda el canal de sonido que se esta tocando (1, 2, 4...)
	ld ix,0c580h		;432c
	call canal_cada_cuadro		;4330   ; canal_cada_cuadro: un cuadro de un canal: cuenta la nota y lee la siguiente
	ld a,(0ca5fh)		;4333
	cp 001h		;4336
	jp nz,L_434B		;4338
	ld (ix+03ch),009h		;433b
	ld (ix+03dh),01ch		;433f
	ld (ix+03eh),009h		;4343
	ld (ix+03fh),009h		;4347
L_434B:
	ld a,080h		;434b
	ld (0c644h),a		;434d   ; guarda el canal de sonido que se esta tocando (1, 2, 4...)
	ld ix,0c5c0h		;4350
	call canal_cada_cuadro		;4354   ; canal_cada_cuadro: un cuadro de un canal: cuenta la nota y lee la siguiente
	jp L_50CC		;4357
L_435A:
	ld a,008h		;435a
	ld (0c644h),a		;435c   ; guarda el canal de sonido que se esta tocando (1, 2, 4...)
	ld ix,0c4c0h		;435f
	call canal_cada_cuadro		;4363   ; canal_cada_cuadro: un cuadro de un canal: cuenta la nota y lee la siguiente
	jp L_50CC		;4366
canal_cada_cuadro:		; un cuadro de un canal: cuenta la nota y lee la siguiente
	ld a,(ix+000h)		;4369   ; lee el sonido del canal (0 = callado)
	or a			;436c
	ret z			;436d
	dec (ix+004h)		;436e   ; baja lo que le queda a la nota
	ld a,(ix+004h)		;4371   ; lee lo que le queda a la nota
	cp 0ffh		;4374
	jp z,L_4380		;4376
	or a			;4379
	jp z,L_4386		;437a
	jp L_46AF		;437d
L_4380:
	dec (ix+01fh)		;4380
	jp L_46AF		;4383
L_4386:
	or (ix+01fh)		;4386
	jp nz,L_46AF		;4389
	ld l,(ix+002h)		;438c   ; lee el puntero de la partitura (bajo)
	ld h,(ix+003h)		;438f   ; lee el puntero de la partitura (alto)
lee_partitura:		; la siguiente nota u orden de la partitura (0xFF acaba, 0xD0-0xFE ordenes)
	ld a,(hl)			;4392
	cp 0ffh		;4393
	jp z,fin_de_partitura		;4395   ; fin_de_partitura: la orden 0xFF: acaba el canal (y avisa de algunas musicas)
	cp 0d0h		;4398
	jp c,L_43A6		;439a
	ex de,hl			;439d
	call orden_de_partitura		;439e   ; orden_de_partitura: salta por la tabla p16:4D52 con la orden A (0xD0-0xFE)
	ex de,hl			;43a1
	inc hl			;43a2
	jp lee_partitura		;43a3   ; lee_partitura: la siguiente nota u orden de la partitura (0xFF acaba, 0xD0-0xFE ordenes)
L_43A6:
	ld a,(ix+00bh)		;43a6
	bit 1,a		;43a9
	jp nz,L_45CB		;43ab
	and 01ch		;43ae
	jp nz,L_4626		;43b0
L_43B3:
	ld a,(hl)			;43b3
	and 00fh		;43b4
	ld b,a			;43b6
	ld a,(ix+015h)		;43b7
	jp z,L_43C7		;43ba
	ld e,a			;43bd
L_43BE:
	add a,e			;43be
	jp nc,L_43C5		;43bf
	inc (ix+01fh)		;43c2
L_43C5:
	djnz L_43BE		;43c5
L_43C7:
	ld (ix+004h),a		;43c7   ; guarda lo que le queda a la nota
	ld c,a			;43ca
	push bc			;43cb
	ld (ix+029h),004h		;43cc
	ld bc,00000h		;43d0
	ld e,000h		;43d3
	ld d,(ix+026h)		;43d5
L_43D8:
	srl d		;43d8
	jp nc,L_43E5		;43da
	ld a,(ix+004h)		;43dd   ; lee lo que le queda a la nota
	add a,b			;43e0
	ld b,a			;43e1
	ld a,e			;43e2
	adc a,c			;43e3
	ld c,a			;43e4
L_43E5:
	sla (ix+004h)		;43e5
	rl e		;43e9
	dec (ix+029h)		;43eb
	jp nz,L_43D8		;43ee
	srl c		;43f1
	rr b		;43f3
	srl c		;43f5
	rr b		;43f7
	srl c		;43f9
	rr b		;43fb
	srl c		;43fd
	rr b		;43ff
	ld (ix+029h),b		;4401
	pop bc			;4404
	ld (ix+004h),c		;4405   ; guarda lo que le queda a la nota
	ld a,(hl)			;4408
	and 0f0h		;4409
	rrca			;440b
	rrca			;440c
	rrca			;440d
	rrca			;440e
	inc hl			;440f
	ld (ix+002h),l		;4410   ; guarda el puntero de la partitura (bajo)
	ld (ix+003h),h		;4413   ; guarda el puntero de la partitura (alto)
	bit 7,(ix+00bh)		;4416
	ret nz			;441a
	cp 00ch		;441b
	jp nc,L_45B9		;441d
	ld hl,045beh		;4420   ; sonido_45BE: datos de sonido que lee el motor de p16 al tocar los sonidos 0x06, 0x6A, 0x6B, 0x6C, 0x6D,
	ld e,a			;4423
	ld d,000h		;4424
	add hl,de			;4426
	ld l,(hl)			;4427
	ld h,000h		;4428
	ld a,(ix+017h)		;442a
	or a			;442d
	jp z,L_4435		;442e
	ld b,a			;4431
L_4432:
	add hl,hl			;4432
	djnz L_4432		;4433
L_4435:
	bit 4,(ix+03ah)		;4435
	jp z,L_4475		;4439
	bit 3,(ix+03ah)		;443c
	jp z,L_444A		;4440
	res 3,(ix+03ah)		;4443
	jp L_4475		;4447
L_444A:
	ld e,(ix+011h)		;444a
	ld d,(ix+012h)		;444d
	ld a,h			;4450
	cp d			;4451
	jp c,L_4471		;4452
	jp z,L_445F		;4455
L_4458:
	set 7,(ix+03ah)		;4458
	jp L_4475		;445c
L_445F:
	ld a,l			;445f
	cp e			;4460
	jp c,L_4471		;4461
	jp z,L_446A		;4464
	jp L_4458		;4467
L_446A:
	bit 2,(ix+03ah)		;446a
	jp nz,L_4458		;446e
L_4471:
	res 7,(ix+03ah)		;4471
L_4475:
	ld (ix+011h),l		;4475
	ld (ix+012h),h		;4478
	bit 1,(ix+010h)		;447b
	jp z,L_44A9		;447f
	ld a,(ix+036h)		;4482
	bit 7,a		;4485
	jp nz,L_4499		;4487
	add a,(ix+011h)		;448a
	ld (ix+011h),a		;448d
	jp nc,L_44A9		;4490
	inc (ix+012h)		;4493
	jp L_44A9		;4496
L_4499:
	res 7,a		;4499
	ld c,a			;449b
	ld a,(ix+011h)		;449c
	sub c			;449f
	ld (ix+011h),a		;44a0
	jp nc,L_44A9		;44a3
	dec (ix+012h)		;44a6
L_44A9:
	set 1,(ix+00fh)		;44a9
	ld e,(ix+011h)		;44ad
	ld d,(ix+012h)		;44b0
	ld (ix+00ch),e		;44b3
	ld (ix+00dh),d		;44b6
	bit 5,(ix+03ah)		;44b9
	jp z,L_44E9		;44bd
	res 6,(ix+03ah)		;44c0
	ld l,(ix+011h)		;44c4
	ld h,(ix+012h)		;44c7
	ld b,(ix+038h)		;44ca
	ld d,000h		;44cd
	ld e,(ix+037h)		;44cf
	bit 7,(ix+03ah)		;44d2
	jp nz,L_44DF		;44d6
L_44D9:
	add hl,de			;44d9
	djnz L_44D9		;44da
	jp L_44E3		;44dc
L_44DF:
	sbc hl,de		;44df
	djnz L_44DF		;44e1
L_44E3:
	ld (ix+00ch),l		;44e3
	ld (ix+00dh),h		;44e6
L_44E9:
	res 0,(ix+03ah)		;44e9
	bit 7,(ix+031h)		;44ed
	jp z,L_450C		;44f1
	ld a,(ix+032h)		;44f4
	inc a			;44f7
	ld (ix+030h),a		;44f8
	xor a			;44fb
	ld (ix+02fh),a		;44fc
	ld (ix+034h),a		;44ff
	ld (ix+035h),a		;4502
	ld a,(ix+032h)		;4505
	or a			;4508
	call z,L_4799		;4509
L_450C:
	ld a,(0c644h)		;450c   ; lee el canal de sonido que se esta tocando (1, 2, 4...)
	cp 010h		;450f
	jp nz,L_4551		;4511
	ld a,(0c68bh)		;4514
	bit 0,a		;4517
	jp z,L_4551		;4519
	ld a,(0c68bh)		;451c
	bit 6,a		;451f
	jp z,L_452B		;4521
	bit 7,a		;4524
	jp nz,L_4551		;4526
	set 7,a		;4529
L_452B:
	res 1,a		;452b
	res 5,a		;452d
	ld (0c68bh),a		;452f
	ld a,(0c68ah)		;4532
	ld (0c689h),a		;4535
	ld a,(0c688h)		;4538
	ld (0c687h),a		;453b
	set 7,(ix+02bh)		;453e
	ld hl,0c683h		;4542
	ld e,(hl)			;4545
	inc hl			;4546
	ld d,(hl)			;4547
	ex de,hl			;4548
	ld de,0c663h		;4549
	ld bc,00020h		;454c
	ldir		;454f
L_4551:
	ld a,(ix+03bh)		;4551
	bit 4,a		;4554
	jp z,L_456B		;4556
	and 01fh		;4559
	ld (ix+03bh),a		;455b
	ld a,(ix+02ah)		;455e
	or a			;4561
	jp nz,L_456B		;4562
	ld a,(ix+03ch)		;4565
	call L_5035		;4568
L_456B:
	ld a,(ix+02ah)		;456b
	or a			;456e
	jp z,L_4586		;456f
	ld (ix+022h),000h		;4572
	ld (ix+023h),000h		;4576
	ld (ix+024h),000h		;457a
	call L_4961		;457e
	res 7,(ix+02ah)		;4581
	ret			;4585
L_4586:
	res 2,(ix+02bh)		;4586
	res 3,(ix+02bh)		;458a
	ld (ix+025h),000h		;458e
	ld (ix+024h),000h		;4592
	ld e,(ix+016h)		;4596
	ld a,(0c640h)		;4599
	and 001h		;459c
	call nz,L_4BD5		;459e
	ld (ix+013h),e		;45a1
	ld (ix+00eh),e		;45a4
	bit 5,(ix+02bh)		;45a7
	ret z			;45ab
	set 1,(ix+02bh)		;45ac
	ld a,(ix+02eh)		;45b0
	and 00fh		;45b3
	ld (ix+00eh),a		;45b5
	ret			;45b8
L_45B9:
	res 1,(ix+00fh)		;45b9
	ret			;45bd

; ----------------------------------------------------------------------
; DATOS sonido_45BE: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x06, 0x6A, 0x6B, 0x6C, 0x6D, 0x6E, 0x6F, 0x70, 0x71, 0x72 y 43
;   mas (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392 (12
;   bytes)
;   0x45be..0x45ca  (12 bytes)
DATA_sonido_45BE:
	defb 06ah,064h,05eh,059h,054h,04fh,04ah,046h,042h,03fh,03bh,038h	; 45be  jd^YTOJFB?.8

; ----------------------------------------------------------------------
; DATOS sin identificar  0x45ca..0x45cb  (1 bytes)
DATA_45CA:
	defb 035h	; 45ca

; ======================================================================
; CODIGO 0x45cb..0x4cf9  (1838 bytes)
; ======================================================================


L_45CB:
	ld a,(ix+00fh)		;45cb
	and 003h		;45ce
	jp z,L_4613		;45d0
	cp 001h		;45d3
	jp z,L_45EF		;45d5
	ld a,(hl)			;45d8
	and 0f0h		;45d9
	ld e,a			;45db
	xor (hl)			;45dc
	ld d,a			;45dd
	inc hl			;45de
	ld a,(hl)			;45df
	ld (ix+00ch),a		;45e0
	ld (ix+00dh),d		;45e3
	ld a,e			;45e6
	rrca			;45e7
	rrca			;45e8
	rrca			;45e9
	rrca			;45ea
	ld e,a			;45eb
	jp L_45F3		;45ec
L_45EF:
	ld a,(hl)			;45ef
	and 00fh		;45f0
	ld e,a			;45f2
L_45F3:
	ld a,(0c644h)		;45f3   ; lee el canal de sonido que se esta tocando (1, 2, 4...)
	cp 008h		;45f6
	jp nc,L_4604		;45f8
	bit 2,(ix+00fh)		;45fb
	jp z,L_4604		;45ff
	ld e,010h		;4602
L_4604:
	inc e			;4604
	inc e			;4605
	ld a,(0c640h)		;4606
	and 001h		;4609
	push hl			;460b
	call nz,L_4BD5		;460c
	pop hl			;460f
	ld (ix+00eh),e		;4610
L_4613:
	bit 7,(ix+00bh)		;4613
	ret nz			;4617
	inc hl			;4618
	ld (ix+002h),l		;4619   ; guarda el puntero de la partitura (bajo)
	ld (ix+003h),h		;461c   ; guarda el puntero de la partitura (alto)
	ld a,(ix+014h)		;461f
	ld (ix+004h),a		;4622   ; guarda lo que le queda a la nota
	ret			;4625
L_4626:
	set 7,(ix+00bh)		;4626
	call L_43B3		;462a
	ld b,a			;462d
	ld a,(0c580h)		;462e
	cp 074h		;4631
	jp nz,L_4645		;4633
	ld a,(0ca5fh)		;4636
	cp 001h		;4639
	jp nz,L_4645		;463b
	xor a			;463e
	ld hl,05486h		;463f   ; sonido_5486: datos de sonido que lee el motor de p16 al tocar los sonidos 0x6A, 0x6B, 0x6D, 0x6E, 0x6F,
	jp L_4649		;4642
L_4645:
	call L_4674		;4645
	ld a,b			;4648
L_4649:
	add a,a			;4649
	ld e,a			;464a
	ld d,000h		;464b
	add hl,de			;464d
	ld e,(hl)			;464e
	inc hl			;464f
	ld d,(hl)			;4650
	ex de,hl			;4651
	ld a,(hl)			;4652
L_4653:
	set 1,(ix+00bh)		;4653
	call lee_partitura		;4657   ; lee_partitura: la siguiente nota u orden de la partitura (0xFF acaba, 0xD0-0xFE ordenes)
	res 1,(ix+00bh)		;465a
	res 7,(ix+00bh)		;465e
	ld a,(ix+014h)		;4662
	ld (ix+01ah),a		;4665
	inc hl			;4668
	ld (ix+018h),l		;4669
	ld (ix+019h),h		;466c
	set 0,(ix+010h)		;466f
	ret			;4673
L_4674:
	bit 3,(ix+00bh)		;4674
	jp nz,L_4691		;4678
	bit 4,(ix+00bh)		;467b
	jp nz,L_46A0		;467f
	ld a,(ix+017h)		;4682
	or a			;4685
	jp nz,L_468D		;4686
	ld hl,05486h		;4689   ; sonido_5486: datos de sonido que lee el motor de p16 al tocar los sonidos 0x6A, 0x6B, 0x6D, 0x6E, 0x6F,
	ret			;468c
L_468D:
	ld hl,0549eh		;468d
	ret			;4690
L_4691:
	ld a,(ix+017h)		;4691
	or a			;4694
	jp nz,L_469C		;4695
	ld hl,054b6h		;4698
	ret			;469b
L_469C:
	ld hl,054b6h		;469c
	ret			;469f
L_46A0:
	ld a,(ix+017h)		;46a0
	or a			;46a3
	jp nz,L_46AB		;46a4
	ld hl,054ceh		;46a7
	ret			;46aa
L_46AB:
	ld hl,054ceh		;46ab
	ret			;46ae
L_46AF:
	bit 1,(ix+00bh)		;46af
	ret nz			;46b3
	bit 0,(ix+010h)		;46b4
	jp nz,L_46F4		;46b8
	bit 5,(ix+03ah)		;46bb
	call nz,L_471D		;46bf
	bit 0,(ix+03ah)		;46c2
	call nz,L_4767		;46c6
	bit 7,(ix+031h)		;46c9
	call nz,L_4792		;46cd
	ld a,(ix+02ah)		;46d0
	or a			;46d3
	call nz,L_4944		;46d4
	ld a,(ix+02ah)		;46d7
	or a			;46da
	jp nz,L_46E5		;46db
	bit 0,(ix+02bh)		;46de
	call nz,L_4862		;46e2
L_46E5:
	ld a,(0c644h)		;46e5   ; lee el canal de sonido que se esta tocando (1, 2, 4...)
	cp 010h		;46e8
	ret nz			;46ea
	ld a,(0c68bh)		;46eb
	bit 0,a		;46ee
	call nz,L_4A43		;46f0
	ret			;46f3
L_46F4:
	dec (ix+01ah)		;46f4
	ret nz			;46f7
	ld l,(ix+018h)		;46f8
	ld h,(ix+019h)		;46fb
	ld a,(hl)			;46fe
	cp 0ffh		;46ff
	jp z,L_470C		;4701
	set 7,(ix+00bh)		;4704
	call L_4653		;4708
	ret			;470b
L_470C:
	res 0,(ix+010h)		;470c
	xor a			;4710
	ld (ix+00eh),a		;4711
	ld a,(ix+00fh)		;4714
	and 0f0h		;4717
	ld (ix+00fh),a		;4719
	ret			;471c
L_471D:
	bit 6,(ix+03ah)		;471d
	ret nz			;4721
	bit 7,(ix+03ah)		;4722
	jp nz,L_473A		;4726
	ld a,(ix+00ch)		;4729
	ld h,(ix+00dh)		;472c
	sbc a,(ix+037h)		;472f
	ld l,a			;4732
	jp nc,L_4746		;4733
	dec h			;4736
	jp L_4746		;4737
L_473A:
	ld l,(ix+00ch)		;473a
	ld h,(ix+00dh)		;473d
	ld d,000h		;4740
	ld e,(ix+037h)		;4742
	add hl,de			;4745
L_4746:
	ld (ix+00ch),l		;4746
	ld (ix+00dh),h		;4749
	dec (ix+038h)		;474c
	ret nz			;474f
	set 6,(ix+03ah)		;4750
	ld l,(ix+011h)		;4754
	ld h,(ix+012h)		;4757
	ld (ix+00ch),l		;475a
	ld (ix+00dh),h		;475d
	ld a,(ix+039h)		;4760
	ld (ix+038h),a		;4763
	ret			;4766
L_4767:
	bit 7,(ix+03ah)		;4767
	jp nz,L_477F		;476b
	ld a,(ix+00ch)		;476e
	ld h,(ix+00dh)		;4771
	sbc a,(ix+037h)		;4774
	ld l,a			;4777
	jp nc,L_478B		;4778
	dec h			;477b
	jp L_478B		;477c
L_477F:
	ld l,(ix+00ch)		;477f
	ld h,(ix+00dh)		;4782
	ld d,000h		;4785
	ld e,(ix+037h)		;4787
	add hl,de			;478a
L_478B:
	ld (ix+00ch),l		;478b
	ld (ix+00dh),h		;478e
	ret			;4791
L_4792:
	dec (ix+030h)		;4792
	ret nz			;4795
	inc (ix+030h)		;4796
L_4799:
	push hl			;4799
	ld a,(ix+031h)		;479a
	and 07fh		;479d
	add a,a			;479f
	ld hl,06475h		;47a0
	add a,l			;47a3
	ld l,a			;47a4
	jp nc,L_47A9		;47a5
	inc h			;47a8
L_47A9:
	ld e,(hl)			;47a9
	inc hl			;47aa
	ld d,(hl)			;47ab
	ex de,hl			;47ac
	ld e,(ix+02fh)		;47ad
	ld d,000h		;47b0
	add hl,de			;47b2
	ld a,(hl)			;47b3
	ld (0c662h),a		;47b4
	ex de,hl			;47b7
	pop hl			;47b8
	cp 0f5h		;47b9
	jp nc,L_4824		;47bb
	srl a		;47be
	srl a		;47c0
	srl a		;47c2
	srl a		;47c4
	ld (ix+030h),a		;47c6
	inc (ix+02fh)		;47c9
	ld a,(0c662h)		;47cc
	and 00fh		;47cf
	bit 3,a		;47d1
	jp nz,L_47E0		;47d3
	call L_47EE		;47d6
	call L_47FF		;47d9
	call L_480F		;47dc
	ret			;47df
L_47E0:
	ld c,a			;47e0
	ld a,010h		;47e1
	sub c			;47e3
	call L_47EE		;47e4
	call L_4807		;47e7
	call L_480F		;47ea
	ret			;47ed
L_47EE:
	ld c,(ix+033h)		;47ee
	ld d,a			;47f1
L_47F2:
	dec c			;47f2
	jp z,L_47FA		;47f3
	add a,d			;47f6
	jp L_47F2		;47f7
L_47FA:
	ld c,a			;47fa
	ld d,(ix+012h)		;47fb
	ret			;47fe
L_47FF:
	ld a,c			;47ff
	add a,(ix+011h)		;4800
	ld e,a			;4803
	ret nc			;4804
	inc d			;4805
	ret			;4806
L_4807:
	ld a,(ix+011h)		;4807
	sub c			;480a
	ld e,a			;480b
	ret nc			;480c
	dec d			;480d
	ret			;480e
L_480F:
	ld a,(ix+03ah)		;480f
	bit 0,a		;4812
	ret nz			;4814
	bit 5,a		;4815
	jp z,L_481D		;4817
	bit 6,a		;481a
	ret z			;481c
L_481D:
	ld (ix+00ch),e		;481d
	ld (ix+00dh),d		;4820
	ret			;4823
L_4824:
	cp 0fbh		;4824
	jp z,L_4838		;4826
	jp nc,L_485D		;4829
	inc (ix+02fh)		;482c
	ld a,(ix+02fh)		;482f
	ld (ix+034h),a		;4832
	jp L_4799		;4835
L_4838:
	inc de			;4838
	inc (ix+024h)		;4839
	ld a,(de)			;483c
	cp (ix+035h)		;483d
	jp nz,L_4854		;4840
	ld (ix+035h),000h		;4843
	ld (ix+034h),000h		;4847
	inc (ix+02fh)		;484b
	inc (ix+02fh)		;484e
	jp L_4799		;4851
L_4854:
	ld a,(ix+034h)		;4854
	ld (ix+02fh),a		;4857
	jp L_4799		;485a
L_485D:
	ld (ix+030h),0ffh		;485d
	ret			;4861
L_4862:
	bit 2,(ix+00fh)		;4862
	ret nz			;4866
	call L_486E		;4867
	ld (ix+00eh),e		;486a
	ret			;486d
L_486E:
	ld e,(ix+00eh)		;486e
	inc (ix+025h)		;4871
	ld b,(ix+025h)		;4874
	ld a,(ix+026h)		;4877
	or a			;487a
	jp z,L_4887		;487b
	ld a,(ix+029h)		;487e
	cp (ix+004h)		;4881   ; compara con lo que le queda a la nota
	jp nc,L_491C		;4884
L_4887:
	bit 3,(ix+02bh)		;4887
	jp nz,L_48CA		;488b
	bit 1,(ix+02bh)		;488e
	jp z,L_48B7		;4892
	dec (ix+02dh)		;4895
	ret nz			;4898
	ld a,(ix+02eh)		;4899
	and 0f0h		;489c
	rrca			;489e
	rrca			;489f
	rrca			;48a0
	rrca			;48a1
	ld (ix+02dh),a		;48a2
	inc e			;48a5
	ld a,e			;48a6
	cp (ix+013h)		;48a7
	ret c			;48aa
	res 1,(ix+02bh)		;48ab
	ld e,(ix+013h)		;48af
	ld (ix+025h),000h		;48b2
	ret			;48b6
L_48B7:
	dec e			;48b7
	call L_4923		;48b8
	ld a,(ix+02ch)		;48bb
	cp b			;48be
	ret nc			;48bf
	ld (ix+025h),001h		;48c0
	ld b,001h		;48c4
	set 3,(ix+02bh)		;48c6
L_48CA:
	bit 2,(ix+02bh)		;48ca
	jp nz,L_492F		;48ce
	ld a,(ix+022h)		;48d1
	or a			;48d4
	jp z,L_490E		;48d5
	bit 4,(ix+03bh)		;48d8
	jp z,L_48F0		;48dc
	bit 5,(ix+03bh)		;48df
	jp nz,L_48F0		;48e3
	set 5,(ix+03bh)		;48e6
	ld a,(ix+03dh)		;48ea
	call L_5035		;48ed
L_48F0:
	bit 4,(ix+02bh)		;48f0
	jp nz,L_4913		;48f4
	ld a,b			;48f7
	cp (ix+022h)		;48f8
	ret nz			;48fb
	dec e			;48fc
L_48FD:
	call L_4923		;48fd
	ld (ix+025h),000h		;4900
	inc (ix+024h)		;4904
	ld a,(ix+024h)		;4907
	cp (ix+023h)		;490a
	ret nz			;490d
L_490E:
	set 2,(ix+02bh)		;490e
	ret			;4912
L_4913:
	ld d,(ix+022h)		;4913
	ld a,e			;4916
	sub d			;4917
	ld e,a			;4918
	jp L_48FD		;4919
L_491C:
	call L_49F2		;491c
	ld e,(ix+00eh)		;491f
	ret			;4922
L_4923:
	jp m,L_492B		;4923
	ld a,e			;4926
	cp (ix+021h)		;4927
	ret nc			;492a
L_492B:
	ld e,(ix+021h)		;492b
	ret			;492e
L_492F:
	bit 4,(ix+03bh)		;492f
	ret z			;4933
	bit 6,(ix+03bh)		;4934
	ret nz			;4938
	set 6,(ix+03bh)		;4939
	ld a,(ix+03eh)		;493d
	call L_5035		;4940
	ret			;4943
L_4944:
	ld a,(ix+026h)		;4944
	or a			;4947
	jp z,L_4954		;4948
	ld a,(ix+029h)		;494b
	cp (ix+004h)		;494e   ; compara con lo que le queda a la nota
	jp nc,L_49EE		;4951
L_4954:
	bit 7,(ix+02ah)		;4954
	ret nz			;4958
	dec (ix+025h)		;4959
	ret nz			;495c
	res 7,(ix+02ah)		;495d
L_4961:
	push hl			;4961
	ld a,(ix+02ah)		;4962
	and 07fh		;4965
	add a,a			;4967
	ld hl,06430h		;4968
	add a,l			;496b
	ld l,a			;496c
	jp nc,L_4971		;496d
	inc h			;4970
L_4971:
	ld e,(hl)			;4971
	inc hl			;4972
	ld d,(hl)			;4973
	ex de,hl			;4974
	ld e,(ix+022h)		;4975
	ld d,000h		;4978
	add hl,de			;497a
	ld a,(hl)			;497b
	ld (0c662h),a		;497c
	ex de,hl			;497f
	pop hl			;4980
	cp 0f5h		;4981
	jp nc,L_49B0		;4983
	srl a		;4986
	srl a		;4988
	srl a		;498a
	srl a		;498c
	ld (ix+025h),a		;498e
	inc (ix+022h)		;4991
	ld a,(0c662h)		;4994
	and 00fh		;4997
	or a			;4999
	sbc a,(ix+016h)		;499a
L_499D:
	jp c,L_49AB		;499d
	ld b,(ix+021h)		;49a0
	cp b			;49a3
	jp nc,L_49AC		;49a4
	ld (ix+00eh),b		;49a7
	ret			;49aa
L_49AB:
	xor a			;49ab
L_49AC:
	ld (ix+00eh),a		;49ac
	ret			;49af
L_49B0:
	cp 0fbh		;49b0
	jp z,L_49C4		;49b2
	jp nc,L_49E9		;49b5
	inc (ix+022h)		;49b8
	ld a,(ix+022h)		;49bb
	ld (ix+023h),a		;49be
	jp L_4961		;49c1
L_49C4:
	inc de			;49c4
	inc (ix+024h)		;49c5
	ld a,(de)			;49c8
	cp (ix+024h)		;49c9
	jp nz,L_49E0		;49cc
	ld (ix+024h),000h		;49cf
	ld (ix+023h),000h		;49d3
	inc (ix+022h)		;49d7
	inc (ix+022h)		;49da
	jp L_4961		;49dd
L_49E0:
	ld a,(ix+023h)		;49e0
	ld (ix+022h),a		;49e3
	jp L_4961		;49e6
L_49E9:
	set 7,(ix+02ah)		;49e9
	ret			;49ed
L_49EE:
	res 7,(ix+02ah)		;49ee
L_49F2:
	bit 1,(ix+03ah)		;49f2
	jp z,L_49FD		;49f6
	set 0,(ix+03ah)		;49f9
L_49FD:
	bit 4,(ix+03bh)		;49fd
	jp z,L_4A15		;4a01
	bit 7,(ix+03bh)		;4a04
	jp nz,L_4A15		;4a08
	set 7,(ix+03bh)		;4a0b
	ld a,(ix+03fh)		;4a0f
	call L_5035		;4a12
L_4A15:
	ld a,(ix+028h)		;4a15
	and 0f0h		;4a18
	jp nz,L_4A26		;4a1a
	ld a,(ix+028h)		;4a1d
	and 00fh		;4a20
	ld (ix+00eh),a		;4a22
	ret			;4a25
L_4A26:
	dec (ix+027h)		;4a26
	ret nz			;4a29
	ld a,(ix+028h)		;4a2a
	and 0f0h		;4a2d
	rrca			;4a2f
	rrca			;4a30
	rrca			;4a31
	rrca			;4a32
	ld (ix+027h),a		;4a33
	ld a,(ix+028h)		;4a36
	and 00fh		;4a39
	ld b,a			;4a3b
	ld a,(ix+00eh)		;4a3c
	sub b			;4a3f
	jp L_499D		;4a40
L_4A43:
	ld a,(0c68bh)		;4a43
	bit 1,a		;4a46
	ret nz			;4a48
	ld a,(0c689h)		;4a49
	dec a			;4a4c
	ld (0c689h),a		;4a4d
	ret nz			;4a50
	ld a,(0c68ah)		;4a51
	ld (0c689h),a		;4a54
	set 7,(ix+02bh)		;4a57
	ld a,(0c688h)		;4a5b
	or a			;4a5e
	jp z,L_4B26		;4a5f
	cp 00fh		;4a62
	jp z,L_4B3E		;4a64
	ld a,(0c687h)		;4a67
	inc a			;4a6a
	ld (0c687h),a		;4a6b
	cp 010h		;4a6e
	jp z,L_4A8C		;4a70
	ld a,(0c68bh)		;4a73
	bit 2,a		;4a76
	jp z,L_4A86		;4a78
	bit 5,a		;4a7b
	jp z,L_4A86		;4a7d
	ld hl,0c683h		;4a80
	jp L_4ABB		;4a83
L_4A86:
	ld hl,0c685h		;4a86
	jp L_4ABB		;4a89
L_4A8C:
	ld a,(0c68bh)		;4a8c
	bit 2,a		;4a8f
	jp z,L_4B3E		;4a91
	ld a,(0c688h)		;4a94
	ld (0c687h),a		;4a97
	ld a,(0c68bh)		;4a9a
	bit 5,a		;4a9d
	jp z,L_4AB0		;4a9f
	call L_4B2E		;4aa2
	ld hl,0c685h		;4aa5
	res 5,a		;4aa8
	ld (0c68bh),a		;4aaa
	jp L_4ABB		;4aad
L_4AB0:
	call L_4B46		;4ab0
	ld hl,0c683h		;4ab3
	set 5,a		;4ab6
	ld (0c68bh),a		;4ab8
L_4ABB:
	push ix		;4abb
	ld ix,0c663h		;4abd
	ld e,(hl)			;4ac1
	inc hl			;4ac2
	ld d,(hl)			;4ac3
	ld hl,0c663h		;4ac4
	ld b,020h		;4ac7
L_4AC9:
	ld a,(hl)			;4ac9
	add a,080h		;4aca
	ld c,a			;4acc
	ld a,(de)			;4acd
	add a,080h		;4ace
	cp c			;4ad0
	jp z,L_4B12		;4ad1
	ld (ix+000h),c		;4ad4   ; guarda el sonido del canal (0 = callado)
	jp c,L_4AF5		;4ad7
	sub c			;4ada
	call L_4B1B		;4adb
	push bc			;4ade
	ld c,a			;4adf
	ld a,(0c688h)		;4ae0
	ld b,a			;4ae3
	ld a,c			;4ae4
L_4AE5:
	add a,a			;4ae5
	djnz L_4AE5		;4ae6
	pop bc			;4ae8
	add a,(ix+000h)		;4ae9   ; le suma el sonido del canal (0 = callado)
	ld c,080h		;4aec
	sub c			;4aee
	ld (ix+000h),a		;4aef   ; guarda el sonido del canal (0 = callado)
	jp L_4B12		;4af2
L_4AF5:
	sub c			;4af5
	ld c,a			;4af6
	xor a			;4af7
	sub c			;4af8
	call L_4B1B		;4af9
	push bc			;4afc
	ld c,a			;4afd
	ld a,(0c688h)		;4afe
	ld b,a			;4b01
	ld a,c			;4b02
L_4B03:
	add a,a			;4b03
	djnz L_4B03		;4b04
	pop bc			;4b06
	ld c,a			;4b07
	ld a,(ix+000h)		;4b08   ; lee el sonido del canal (0 = callado)
	sub c			;4b0b
	ld c,080h		;4b0c
	sub c			;4b0e
	ld (ix+000h),a		;4b0f   ; guarda el sonido del canal (0 = callado)
L_4B12:
	inc hl			;4b12
	inc de			;4b13
	inc ix		;4b14
	djnz L_4AC9		;4b16
	pop ix		;4b18
	ret			;4b1a
L_4B1B:
	and 0f0h		;4b1b
	rrca			;4b1d
	rrca			;4b1e
	rrca			;4b1f
	rrca			;4b20
	or a			;4b21
	ret nz			;4b22
	ld a,001h		;4b23
	ret			;4b25
L_4B26:
	ld a,(0c68bh)		;4b26
	set 1,a		;4b29
	ld (0c68bh),a		;4b2b
L_4B2E:
	ld hl,0c683h		;4b2e
	ld e,(hl)			;4b31
	inc hl			;4b32
	ld d,(hl)			;4b33
	ex de,hl			;4b34
	ld de,0c663h		;4b35
	ld bc,00020h		;4b38
	ldir		;4b3b
	ret			;4b3d
L_4B3E:
	ld a,(0c68bh)		;4b3e
	set 1,a		;4b41
	ld (0c68bh),a		;4b43
L_4B46:
	ld hl,0c685h		;4b46
	ld e,(hl)			;4b49
	inc hl			;4b4a
	ld d,(hl)			;4b4b
	ex de,hl			;4b4c
	ld de,0c663h		;4b4d
	ld bc,00020h		;4b50
	ldir		;4b53
	ret			;4b55
L_4B56:
	ld hl,0c641h		;4b56
	inc (hl)			;4b59
	ld a,(hl)			;4b5a
	cp 025h		;4b5b
	ret nz			;4b5d
	ld (hl),000h		;4b5e
	inc hl			;4b60
	inc (hl)			;4b61
	ld a,(hl)			;4b62
	cp 00fh		;4b63
	ret nz			;4b65
	ld a,(0c640h)		;4b66
	bit 7,a		;4b69
	jp nz,L_4BB9		;4b6b
	bit 6,a		;4b6e
	jp nz,L_4B99		;4b70
	bit 3,a		;4b73
	jp nz,L_4BCB		;4b75
	bit 4,a		;4b78
	jp nz,L_4B8B		;4b7a
	ld ix,0c480h		;4b7d
	call fin_de_partitura		;4b81   ; fin_de_partitura: la orden 0xFF: acaba el canal (y avisa de algunas musicas)
	ld ix,0c4c0h		;4b84
	call fin_de_partitura		;4b88   ; fin_de_partitura: la orden 0xFF: acaba el canal (y avisa de algunas musicas)
L_4B8B:
	ld ix,0c400h		;4b8b
	call fin_de_partitura		;4b8f   ; fin_de_partitura: la orden 0xFF: acaba el canal (y avisa de algunas musicas)
	ld ix,0c580h		;4b92
	call fin_de_partitura		;4b96   ; fin_de_partitura: la orden 0xFF: acaba el canal (y avisa de algunas musicas)
L_4B99:
	ld ix,0c540h		;4b99
	call fin_de_partitura		;4b9d   ; fin_de_partitura: la orden 0xFF: acaba el canal (y avisa de algunas musicas)
L_4BA0:
	ld ix,0c440h		;4ba0
	call fin_de_partitura		;4ba4   ; fin_de_partitura: la orden 0xFF: acaba el canal (y avisa de algunas musicas)
	ld ix,0c500h		;4ba7
	call fin_de_partitura		;4bab   ; fin_de_partitura: la orden 0xFF: acaba el canal (y avisa de algunas musicas)
	ld ix,0c5c0h		;4bae
	call fin_de_partitura		;4bb2   ; fin_de_partitura: la orden 0xFF: acaba el canal (y avisa de algunas musicas)
	call L_4146		;4bb5
	ret			;4bb8
L_4BB9:
	ld ix,0c480h		;4bb9
	call fin_de_partitura		;4bbd   ; fin_de_partitura: la orden 0xFF: acaba el canal (y avisa de algunas musicas)
	ld ix,0c4c0h		;4bc0
	call fin_de_partitura		;4bc4   ; fin_de_partitura: la orden 0xFF: acaba el canal (y avisa de algunas musicas)
	call L_4146		;4bc7
	ret			;4bca
L_4BCB:
	ld ix,0c580h		;4bcb
	call fin_de_partitura		;4bcf   ; fin_de_partitura: la orden 0xFF: acaba el canal (y avisa de algunas musicas)
	jp L_4BA0		;4bd2
L_4BD5:
	ld hl,0c640h		;4bd5
	bit 5,(hl)		;4bd8
	jp nz,L_4C04		;4bda
	ld a,(0c644h)		;4bdd   ; lee el canal de sonido que se esta tocando (1, 2, 4...)
	bit 7,(hl)		;4be0
	jp nz,L_4BF5		;4be2
	bit 6,(hl)		;4be5
	jp nz,L_4BFB		;4be7
	bit 3,(hl)		;4bea
	jp nz,L_4C01		;4bec
	and 0f3h		;4bef
	ret z			;4bf1
	jp L_4C04		;4bf2
L_4BF5:
	and 00ch		;4bf5
	ret z			;4bf7
	jp L_4C04		;4bf8
L_4BFB:
	and 0b2h		;4bfb
	ret z			;4bfd
	jp L_4C04		;4bfe
L_4C01:
	and 0d3h		;4c01
	ret z			;4c03
L_4C04:
	bit 2,(ix+00fh)		;4c04
	jp nz,L_4C16		;4c08
	ld a,(0c642h)		;4c0b
	ld b,a			;4c0e
	ld a,e			;4c0f
	sub b			;4c10
	ld e,000h		;4c11
	ret m			;4c13
	ld e,a			;4c14
	ret			;4c15
L_4C16:
	ld e,000h		;4c16
	ret			;4c18
fin_de_partitura:		; la orden 0xFF: acaba el canal (y avisa de algunas musicas)
	ld a,(0c644h)		;4c19   ; lee el canal de sonido que se esta tocando (1, 2, 4...)
	cp 001h		;4c1c
	jp nz,L_4C88		;4c1e
	ld a,(ix+000h)		;4c21
	cp 082h		;4c24
	jp z,L_4C2E		;4c26
	cp 088h		;4c29
	jp nz,L_4C3A		;4c2b
L_4C2E:
	ld a,001h		;4c2e
	ld (0c690h),a		;4c30
	xor a			;4c33
	ld (0c697h),a		;4c34
	jp L_4CA2		;4c37
L_4C3A:
	cp 0a6h		;4c3a
	jp nz,L_4C47		;4c3c
	ld a,001h		;4c3f
	ld (0c693h),a		;4c41
	jp L_4CA2		;4c44
L_4C47:
	cp 0a1h		;4c47
	jp nz,L_4C54		;4c49
	ld a,001h		;4c4c
	ld (0c692h),a		;4c4e
	jp L_4CA2		;4c51
L_4C54:
	cp 086h		;4c54
	jp nz,L_4C61		;4c56
	ld a,001h		;4c59
	ld (0c694h),a		;4c5b
	jp L_4CA2		;4c5e
L_4C61:
	cp 094h		;4c61
	jp nz,L_4C6E		;4c63
	ld a,001h		;4c66
	ld (0c695h),a		;4c68
	jp L_4CA2		;4c6b
L_4C6E:
	cp 073h		;4c6e
	jp nz,L_4C7B		;4c70
	ld a,001h		;4c73
	ld (0c696h),a		;4c75
	jp L_4CA2		;4c78
L_4C7B:
	cp 08dh		;4c7b
	jp nz,L_4CA2		;4c7d
	ld a,001h		;4c80
	ld (0cb58h),a		;4c82
	jp L_4CA2		;4c85
L_4C88:
	ld a,(0c644h)		;4c88   ; lee el canal de sonido que se esta tocando (1, 2, 4...)
	cp 040h		;4c8b
	jp nz,L_4CA2		;4c8d
	ld a,(ix+000h)		;4c90
	cp 08ch		;4c93
	jp z,L_4C9D		;4c95
	cp 08eh		;4c98
	jp nz,L_4CA2		;4c9a
L_4C9D:
	ld a,001h		;4c9d
	ld (0c68eh),a		;4c9f
L_4CA2:
	xor a			;4ca2
	ld (ix+000h),a		;4ca3
	ld (ix+001h),a		;4ca6
	ld (ix+005h),a		;4ca9
	ld (ix+006h),a		;4cac
	ld (ix+00ch),a		;4caf
	ld (ix+00dh),a		;4cb2
	ld (ix+00eh),a		;4cb5
	ld (ix+00fh),a		;4cb8
	ld (ix+010h),a		;4cbb
	ld (ix+02bh),a		;4cbe
	ld a,(0c644h)		;4cc1   ; lee el canal de sonido que se esta tocando (1, 2, 4...)
	cp 008h		;4cc4
	ret nc			;4cc6
	cp 004h		;4cc7
	ld hl,0c647h		;4cc9
	jp nz,L_4CDE		;4ccc
	res 0,(hl)		;4ccf
	res 1,(hl)		;4cd1
	bit 3,(hl)		;4cd3
	ret z			;4cd5
	bit 2,(hl)		;4cd6
	ret z			;4cd8
	set 2,(hl)		;4cd9
	res 3,(hl)		;4cdb
	ret			;4cdd
L_4CDE:
	res 2,(hl)		;4cde
	res 3,(hl)		;4ce0
	ret			;4ce2
banco_de_musica:		; el banco de la musica A (0x6A-0xEF) de p16:4CF9 a 0xC68F
	cp 06ah		;4ce3
	ret c			;4ce5
	cp 0f0h		;4ce6
	ret nc			;4ce8
	sub 06ah		;4ce9
	ld hl,04cf9h		;4ceb   ; sonido_4CF9: datos de sonido que lee el motor de p16 al tocar los sonidos 0x6A, 0x6B, 0x6C, 0x6D, 0x6E,
	add a,l			;4cee
	ld l,a			;4cef
	jp nc,L_4CF4		;4cf0
	inc h			;4cf3
L_4CF4:
	ld a,(hl)			;4cf4
	ld (0c68fh),a		;4cf5   ; guarda el banco de 0xA000 de la musica que suena
	ret			;4cf8

; ----------------------------------------------------------------------
; DATOS sonido_4CF9: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x6A, 0x6B, 0x6C, 0x6D, 0x6E, 0x6F, 0x70, 0x71, 0x72, 0x73 y 55
;   mas (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392 (65
;   bytes)
;   0x4cf9..0x4d3a  (65 bytes)
DATA_sonido_4CF9:
	defb 014h,014h,037h,037h,037h,037h,037h,037h,037h,037h,013h,014h,03bh,016h,03bh,014h	; 4cf9  ..77777777......
	defb 017h,014h,013h,013h,037h,03bh,015h,013h,014h,013h,015h,013h,013h,013h,013h,015h	; 4d09  ....7...........
	defb 014h,013h,03bh,014h,015h,015h,015h,015h,015h,014h,013h,013h,015h,015h,014h,015h	; 4d19  ................
	defb 03bh,015h,015h,013h,03bh,015h,014h,015h,016h,016h,017h,014h,013h,017h,017h,017h	; 4d29  ................
	defb 013h	; 4d39

; ======================================================================
; CODIGO 0x4d3a..0x4d52  (24 bytes)
; ======================================================================


pon_banco_de_musica:		; pone en 0xA000 el banco de 0xC68F
	ld a,(0c68fh)		;4d3a   ; lee el banco de 0xA000 de la musica que suena
	ld (0b000h),a		;4d3d   ; el mapper: pone en 0xA000 el banco de A
	ret			;4d40
orden_de_partitura:		; salta por la tabla p16:4D52 con la orden A (0xD0-0xFE)
	sub 0d0h		;4d41
	ld hl,04d52h		;4d43   ; sonido_4D52: datos de sonido que lee el motor de p16 al tocar los sonidos 0x06, 0x28, 0x6A, 0x6B, 0x6C,
	add a,a			;4d46
	add a,l			;4d47
	ld l,a			;4d48
	jp nc,L_4D4D		;4d49
	inc h			;4d4c
L_4D4D:
	ld a,(hl)			;4d4d
	inc hl			;4d4e
	ld h,(hl)			;4d4f
	ld l,a			;4d50
	jp (hl)			;4d51

; ----------------------------------------------------------------------
; DATOS sonido_4D52: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x06, 0x28, 0x6A, 0x6B, 0x6C, 0x6D, 0x6E, 0x6F, 0x70, 0x71 y 44
;   mas (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392 (30
;   bytes)
;   0x4d52..0x4d70  (30 bytes)
DATA_sonido_4D52:
	defb 0b0h,04dh,0b0h,04dh,0b0h,04dh,0b0h,04dh,0b0h,04dh,0b0h,04dh,0b7h,04dh,0c9h,04dh	; 4d52  .M.M.M.M.M.M.M.M
	defb 0d0h,04dh,0d5h,04dh,0eah,04dh,0ffh,04dh,005h,04eh,00ah,04eh,012h,04eh	; 4d62  .M.M.M.M.N.N.N

; ----------------------------------------------------------------------
; DATOS sin identificar  0x4d70..0x4d72  (2 bytes)
DATA_4D70:
	defb 037h,04eh	; 4d70

; ----------------------------------------------------------------------
; DATOS sonido_4D72: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F, 0x10 y 136
;   mas (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392 (12
;   bytes)
;   0x4d72..0x4d7e  (12 bytes)
DATA_sonido_4D72:
	defb 03ch,04eh,051h,04eh,03ch,04eh,051h,04eh,070h,04eh,09ah,04eh	; 4d72  <NQN<NQNpN.N

; ----------------------------------------------------------------------
; DATOS sin identificar  0x4d7e..0x4d82  (4 bytes)
DATA_4D7E:
	defb 0aah,04eh,0b6h,04eh	; 4d7e

; ----------------------------------------------------------------------
; DATOS sonido_4D82: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x06, 0x0C, 0x13, 0x16, 0x1C, 0x1D, 0x23, 0x24, 0x26, 0x27 y 89
;   mas (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392 (30
;   bytes)
;   0x4d82..0x4da0  (30 bytes)
DATA_sonido_4D82:
	defb 0c7h,04eh,0d5h,04eh,0dfh,04eh,0e7h,04eh,02eh,04fh,037h,04fh,046h,04fh,050h,04fh	; 4d82  .N.N.N.N.O7OFOPO
	defb 055h,04fh,08dh,04fh,0d6h,04fh,0ebh,04fh,000h,050h,019h,050h,020h,050h	; 4d92  UO.O.O.O.P.P P

; ----------------------------------------------------------------------
; DATOS sin identificar  0x4da0..0x4da2  (2 bytes)
DATA_4DA0:
	defb 025h,050h	; 4da0

; ----------------------------------------------------------------------
; DATOS sonido_4DA2: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F y 150
;   mas (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392 (14
;   bytes)
;   0x4da2..0x4db0  (14 bytes)
DATA_sonido_4DA2:
	defb 02fh,050h,04dh,050h,057h,050h,05eh,050h,077h,050h,094h,050h,097h,050h	; 4da2  /PMPWP^PwP.P.P

; ======================================================================
; CODIGO 0x4db0..0x51b4  (1028 bytes)
; ======================================================================


L_4DB0:
	ld a,(de)			;4db0
	and 00fh		;4db1
	ld (ix+017h),a		;4db3
	ret			;4db6
L_4DB7:
	ld (ix+03ah),020h		;4db7
L_4DBB:
	inc de			;4dbb
	ld a,(de)			;4dbc
	ld (ix+037h),a		;4dbd
	inc de			;4dc0
	ld a,(de)			;4dc1
	ld (ix+038h),a		;4dc2
	ld (ix+039h),a		;4dc5
	ret			;4dc8
L_4DC9:
	ld (ix+03ah),0a0h		;4dc9
	jp L_4DBB		;4dcd
L_4DD0:
	xor a			;4dd0
	ld (ix+03ah),a		;4dd1
	ret			;4dd4
L_4DD5:
	inc de			;4dd5
	ld a,(de)			;4dd6
	cp 0d7h		;4dd7
	jp z,L_4DE3		;4dd9
	ld (ix+03ah),038h		;4ddc
	jp L_4DBB		;4de0
L_4DE3:
	ld (ix+03ah),0bch		;4de3
	jp L_4DBB		;4de7
L_4DEA:
	ld (ix+03ah),002h		;4dea
	inc de			;4dee
	ld a,(de)			;4def
	cp 0d6h		;4df0
	jp z,L_4DF9		;4df2
	set 7,(ix+03ah)		;4df5
L_4DF9:
	inc de			;4df9
	ld a,(de)			;4dfa
	ld (ix+037h),a		;4dfb
	ret			;4dfe
L_4DFF:
	inc de			;4dff
	ld a,(de)			;4e00
	ld (ix+021h),a		;4e01
	ret			;4e04
L_4E05:
	xor a			;4e05
	ld (ix+021h),a		;4e06
	ret			;4e09
L_4E0A:
	push hl			;4e0a
	ld hl,0d7d1h		;4e0b
	set 2,(hl)		;4e0e
	pop hl			;4e10
	ret			;4e11
L_4E12:
	inc de			;4e12
	ld a,(de)			;4e13
	ld (ix+02ah),a		;4e14
	inc de			;4e17
	ld a,(de)			;4e18
	and 0f0h		;4e19
	rrca			;4e1b
	rrca			;4e1c
	rrca			;4e1d
	rrca			;4e1e
	ld (ix+016h),a		;4e1f
L_4E22:
	ld a,(de)			;4e22
	and 00fh		;4e23
	ld (ix+026h),a		;4e25
	inc de			;4e28
	ld a,(de)			;4e29
	ld (ix+028h),a		;4e2a
	and 0f0h		;4e2d
	rrca			;4e2f
	rrca			;4e30
	rrca			;4e31
	rrca			;4e32
	ld (ix+027h),a		;4e33
	ret			;4e36
L_4E37:
	res 7,(ix+010h)		;4e37
	ret			;4e3b
L_4E3C:
	res 7,(ix+010h)		;4e3c
	ld a,(de)			;4e40
	and 003h		;4e41
	ld (ix+00fh),a		;4e43
	ld b,a			;4e46
	inc de			;4e47
	ld a,(de)			;4e48
	ld (ix+014h),a		;4e49
	ld a,b			;4e4c
	or a			;4e4d
	ret nz			;4e4e
	dec de			;4e4f
	ret			;4e50
L_4E51:
	ld a,(0c644h)		;4e51   ; lee el canal de sonido que se esta tocando (1, 2, 4...)
	cp 004h		;4e54
	ld a,(0c647h)		;4e56
	jp nz,L_4E66		;4e59
	set 0,a		;4e5c
	res 1,a		;4e5e
	ld (0c647h),a		;4e60
	jp L_4E3C		;4e63
L_4E66:
	set 2,a		;4e66
	res 3,a		;4e68
	ld (0c647h),a		;4e6a
	jp L_4E3C		;4e6d
L_4E70:
	inc de			;4e70
	ld a,(de)			;4e71
	and 01fh		;4e72
	ld b,a			;4e74
	ld a,(0c644h)		;4e75   ; lee el canal de sonido que se esta tocando (1, 2, 4...)
	cp 004h		;4e78
	ld a,b			;4e7a
	jp nz,L_4E8C		;4e7b
	ld (0c645h),a		;4e7e
	ld a,(0c647h)		;4e81
	set 0,a		;4e84
	res 1,a		;4e86
	ld (0c647h),a		;4e88
	ret			;4e8b
L_4E8C:
	ld (0c646h),a		;4e8c
	ld a,(0c647h)		;4e8f
	set 2,a		;4e92
	res 3,a		;4e94
	ld (0c647h),a		;4e96
	ret			;4e99
L_4E9A:
	inc de			;4e9a
	res 3,(ix+00fh)		;4e9b
	ld a,(de)			;4e9f
	ld (0c648h),a		;4ea0
	ld hl,0c647h		;4ea3
	ld a,(hl)			;4ea6
	set 5,a		;4ea7
	ld (hl),a			;4ea9
L_4EAA:
	inc de			;4eaa
	ld a,(de)			;4eab
	ld (0c64ah),a		;4eac
	ld hl,0c647h		;4eaf
	ld a,(hl)			;4eb2
	set 6,a		;4eb3
	ld (hl),a			;4eb5
L_4EB6:
	inc de			;4eb6
	ld a,(de)			;4eb7
	ld (0c649h),a		;4eb8
	ld hl,0c647h		;4ebb
	ld a,(hl)			;4ebe
	set 7,a		;4ebf
	ld (hl),a			;4ec1
	set 2,(ix+00fh)		;4ec2
	ret			;4ec6
L_4EC7:
	ld hl,0c647h		;4ec7
	xor a			;4eca
	ld (hl),a			;4ecb
	ld a,(ix+00fh)		;4ecc
	and 0f3h		;4ecf
	ld (ix+00fh),a		;4ed1
	ret			;4ed4
L_4ED5:
	inc de			;4ed5
	ld a,(de)			;4ed6
	ld (ix+015h),a		;4ed7
	xor a			;4eda
	ld (ix+01fh),a		;4edb
	ret			;4ede
L_4EDF:
	inc de			;4edf
	ld a,(de)			;4ee0
	and 00fh		;4ee1
	ld (ix+016h),a		;4ee3
	ret			;4ee6
L_4EE7:
	inc de			;4ee7
	ld (ix+02ah),000h		;4ee8
	ld a,(ix+02bh)		;4eec
	and 080h		;4eef
	or 001h		;4ef1
	ld (ix+02bh),a		;4ef3
	ld a,(de)			;4ef6
	and 0f0h		;4ef7
	rrca			;4ef9
	rrca			;4efa
	rrca			;4efb
	rrca			;4efc
	cp 008h		;4efd
	jp c,L_4F0C		;4eff
	set 1,(ix+02bh)		;4f02
	set 5,(ix+02bh)		;4f06
	res 3,a		;4f0a
L_4F0C:
	ld (ix+02ch),a		;4f0c
	ld a,(de)			;4f0f
	and 00fh		;4f10
	cp 008h		;4f12
	jp c,L_4F1D		;4f14
	set 4,(ix+02bh)		;4f17
	res 3,a		;4f1b
L_4F1D:
	ld (ix+022h),a		;4f1d
	inc de			;4f20
	ld a,(de)			;4f21
	and 0f0h		;4f22
	rrca			;4f24
	rrca			;4f25
	rrca			;4f26
	rrca			;4f27
	ld (ix+023h),a		;4f28
	jp L_4E22		;4f2b
L_4F2E:
	ld a,(ix+02bh)		;4f2e
	and 0c0h		;4f31
	ld (ix+02bh),a		;4f33
	ret			;4f36
L_4F37:
	inc de			;4f37
	ld a,(de)			;4f38
	ld (ix+02eh),a		;4f39
	and 0f0h		;4f3c
	rrca			;4f3e
	rrca			;4f3f
	rrca			;4f40
	rrca			;4f41
	ld (ix+02dh),a		;4f42
	ret			;4f45
L_4F46:
	inc de			;4f46
	ld a,(de)			;4f47
	ld (ix+036h),a		;4f48
	set 1,(ix+010h)		;4f4b
	ret			;4f4f
L_4F50:
	res 1,(ix+010h)		;4f50
	ret			;4f54
L_4F55:
	inc de			;4f55
	ld a,(de)			;4f56
	ld (ix+031h),a		;4f57
	or a			;4f5a
	ret z			;4f5b
	set 7,(ix+031h)		;4f5c
	inc de			;4f60
	ld a,(de)			;4f61
	srl a		;4f62
	srl a		;4f64
	srl a		;4f66
	srl a		;4f68
	or a			;4f6a
	jp z,L_4F7D		;4f6b
	dec a			;4f6e
	jp z,L_4F87		;4f6f
	ld c,a			;4f72
	ld a,(ix+00eh)		;4f73
L_4F76:
	add a,(ix+015h)		;4f76
	dec c			;4f79
	jp nz,L_4F76		;4f7a
L_4F7D:
	ld (ix+032h),a		;4f7d
	ld a,(de)			;4f80
	and 00fh		;4f81
	ld (ix+033h),a		;4f83
	ret			;4f86
L_4F87:
	ld a,(ix+015h)		;4f87
	jp L_4F7D		;4f8a
L_4F8D:
	res 4,(ix+03bh)		;4f8d
	ld a,001h		;4f91
	ld (0c68bh),a		;4f93
	inc de			;4f96
	ld a,(de)			;4f97
	bit 7,a		;4f98
	jp z,L_4FA6		;4f9a
	res 7,a		;4f9d
	ld c,a			;4f9f
	ld a,005h		;4fa0
	ld (0c68bh),a		;4fa2
	ld a,c			;4fa5
L_4FA6:
	call L_4FCD		;4fa6
	ld a,(hl)			;4fa9
	ld (0c683h),a		;4faa
	inc hl			;4fad
	ld a,(hl)			;4fae
	ld (0c684h),a		;4faf
	inc de			;4fb2
	ld a,(de)			;4fb3
	call L_4FCD		;4fb4
	ld a,(hl)			;4fb7
	ld (0c685h),a		;4fb8
	inc hl			;4fbb
	ld a,(hl)			;4fbc
	ld (0c686h),a		;4fbd
	inc de			;4fc0
	ld a,(de)			;4fc1
	and 00fh		;4fc2
	ld (0c688h),a		;4fc4
	inc de			;4fc7
	ld a,(de)			;4fc8
	ld (0c68ah),a		;4fc9
	ret			;4fcc
L_4FCD:
	ld hl,0583eh		;4fcd
	add a,a			;4fd0
	add a,l			;4fd1
	ld l,a			;4fd2
	ret nc			;4fd3
	inc h			;4fd4
	ret			;4fd5
L_4FD6:
	inc de			;4fd6
	ld a,(de)			;4fd7
	or a			;4fd8
	ld a,(0c68bh)		;4fd9
	jp z,L_4FE5		;4fdc
	set 3,a		;4fdf
	ld (0c68bh),a		;4fe1
	ret			;4fe4
L_4FE5:
	res 3,a		;4fe5
	ld (0c68bh),a		;4fe7
	ret			;4fea
L_4FEB:
	inc de			;4feb
	ld a,(de)			;4fec
	or a			;4fed
	ld a,(0c68bh)		;4fee
	jp z,L_4FFA		;4ff1
	set 6,a		;4ff4
	ld (0c68bh),a		;4ff6
	ret			;4ff9
L_4FFA:
	res 6,a		;4ffa
	ld (0c68bh),a		;4ffc
	ret			;4fff
L_5000:
	set 4,(ix+03bh)		;5000
	inc de			;5004
	ld a,(de)			;5005
	ld (ix+03ch),a		;5006
	inc de			;5009
	ld a,(de)			;500a
	ld (ix+03dh),a		;500b
	inc de			;500e
	ld a,(de)			;500f
	ld (ix+03eh),a		;5010
	inc de			;5013
	ld a,(de)			;5014
	ld (ix+03fh),a		;5015
	ret			;5018
L_5019:
	ld (ix+007h),e		;5019
	ld (ix+008h),d		;501c
	ret			;501f
L_5020:
	xor a			;5020
	ld (0c68bh),a		;5021
	ret			;5024
L_5025:
	set 7,(ix+010h)		;5025
	inc de			;5029
	ld a,(de)			;502a
	ld (ix+020h),a		;502b
	ret			;502e
L_502F:
	res 4,(ix+03bh)		;502f
	inc de			;5033
	ld a,(de)			;5034
L_5035:
	set 7,(ix+02bh)		;5035
	ld hl,0583eh		;5039
	add a,a			;503c
	add a,l			;503d
	ld l,a			;503e
	jp nc,L_5043		;503f
	inc h			;5042
L_5043:
	ld a,(hl)			;5043
	ld (ix+01bh),a		;5044
	inc hl			;5047
	ld a,(hl)			;5048
	ld (ix+01ch),a		;5049
	ret			;504c
L_504D:
	call L_5084		;504d
	ld (ix+009h),l		;5050
	ld (ix+00ah),h		;5053
	ret			;5056
L_5057:
	ld e,(ix+009h)		;5057
	ld d,(ix+00ah)		;505a
	ret			;505d
L_505E:
	inc de			;505e
	ld b,(ix+005h)		;505f
	inc b			;5062
	ld a,(de)			;5063
	cp b			;5064
	jp z,L_5072		;5065
	ld (ix+005h),b		;5068
	ld e,(ix+007h)		;506b
	ld d,(ix+008h)		;506e
	ret			;5071
L_5072:
	ld (ix+005h),000h		;5072
	ret			;5076
L_5077:
	inc de			;5077
	ld b,(ix+006h)		;5078
	inc b			;507b
	ld a,(de)			;507c
	cp b			;507d
	jp z,L_508D		;507e
	ld (ix+006h),b		;5081
L_5084:
	inc de			;5084
	ld a,(de)			;5085
	ld l,a			;5086
	inc de			;5087
	ld a,(de)			;5088
	ld h,a			;5089
	ex de,hl			;508a
	dec de			;508b
	ret			;508c
L_508D:
	inc de			;508d
	inc de			;508e
	ld (ix+006h),000h		;508f
	ret			;5093
L_5094:
	jp L_5084		;5094
L_5097:
	inc de			;5097
	ld b,(ix+00bh)		;5098
	ld a,(de)			;509b
	ld (ix+00bh),a		;509c
	cp 001h		;509f
	ld a,b			;50a1
	jp z,L_50BC		;50a2
	cp 001h		;50a5
	ret nz			;50a7
	ld a,(ix+010h)		;50a8
	ld (ix+01dh),a		;50ab
	ld a,(ix+02bh)		;50ae
	ld (ix+01eh),a		;50b1
	xor a			;50b4
	ld (ix+010h),a		;50b5
	ld (ix+02bh),a		;50b8
	ret			;50bb
L_50BC:
	cp 001h		;50bc
	ret z			;50be
	ld a,(ix+01dh)		;50bf
	ld (ix+010h),a		;50c2
	ld a,(ix+01eh)		;50c5
	ld (ix+02bh),a		;50c8
	ret			;50cb
L_50CC:
	call L_50E7		;50cc
	call L_50FB		;50cf
	call L_512C		;50d2
	call L_5154		;50d5
	call L_5181		;50d8
	call L_51C0		;50db
	call L_52D4		;50de
	call L_532C		;50e1
	jp L_53CF		;50e4
L_50E7:
	ld a,(0c40fh)		;50e7
	bit 0,a		;50ea
	ret z			;50ec
	ld a,(0c48fh)		;50ed
	bit 0,a		;50f0
	ret z			;50f2
	ld hl,0c40fh		;50f3
	res 1,(hl)		;50f6
	res 0,(hl)		;50f8
	ret			;50fa
L_50FB:
	ld b,000h		;50fb
	ld c,008h		;50fd
	ld hl,0c40ch		;50ff
	call L_510E		;5102
	ld hl,0c44ch		;5105
	call L_510E		;5108
	ld hl,0c48ch		;510b
L_510E:
	ld e,(hl)			;510e
	ld a,b			;510f
	call escribe_psg		;5110   ; escribe_psg: escribe A en el registro del PSG (PR2 p13:73A6)
	inc hl			;5113
	inc b			;5114
	ld e,(hl)			;5115
	ld a,b			;5116
	call escribe_psg		;5117   ; escribe_psg: escribe A en el registro del PSG (PR2 p13:73A6)
	inc hl			;511a
	ld e,(hl)			;511b
	ld a,c			;511c
	inc b			;511d
	inc c			;511e
	inc hl			;511f
	bit 3,(hl)		;5120
	ret nz			;5122
	call escribe_psg		;5123   ; escribe_psg: escribe A en el registro del PSG (PR2 p13:73A6)
	bit 2,(hl)		;5126
	ret z			;5128
	set 3,(hl)		;5129
	ret			;512b
L_512C:
	ld hl,0c647h		;512c
	bit 0,(hl)		;512f
	jp z,L_5141		;5131
	res 0,(hl)		;5134
	set 1,(hl)		;5136
	ld a,(0c645h)		;5138
	ld e,a			;513b
	ld a,006h		;513c
	jp L_5151		;513e
L_5141:
	bit 1,(hl)		;5141
	ret nz			;5143
	bit 2,(hl)		;5144
	ret z			;5146
	res 2,(hl)		;5147
	set 3,(hl)		;5149
	ld a,(0c646h)		;514b
	ld e,a			;514e
	ld a,006h		;514f
L_5151:
	jp escribe_psg		;5151   ; escribe_psg: escribe A en el registro del PSG (PR2 p13:73A6)
L_5154:
	ld hl,0c647h		;5154
	bit 7,(hl)		;5157
	ret z			;5159
	res 7,(hl)		;515a
	ld a,(0c649h)		;515c
	ld e,a			;515f
	ld a,00bh		;5160
	call escribe_psg		;5162   ; escribe_psg: escribe A en el registro del PSG (PR2 p13:73A6)
	bit 6,(hl)		;5165
	ret z			;5167
	res 6,(hl)		;5168
	ld a,(0c64ah)		;516a
	ld e,a			;516d
	ld a,00ch		;516e
	call escribe_psg		;5170   ; escribe_psg: escribe A en el registro del PSG (PR2 p13:73A6)
	bit 5,(hl)		;5173
	ret z			;5175
	res 5,(hl)		;5176
	ld a,(0c648h)		;5178
	ld e,a			;517b
	ld a,00dh		;517c
	jp escribe_psg		;517e   ; escribe_psg: escribe A en el registro del PSG (PR2 p13:73A6)
L_5181:
	ld hl,0c40fh		;5181
	ld a,(hl)			;5184
	ld hl,051b4h		;5185   ; sonido_51B4: datos de sonido que lee el motor de p16 al tocar los sonidos 0x01, 0x02, 0x03, 0x04, 0x05,
	call L_51AD		;5188
	ld b,(hl)			;518b
	ld hl,0c44fh		;518c
	ld a,(hl)			;518f
	ld hl,051b8h		;5190
	call L_51AD		;5193
	ld c,(hl)			;5196
	ld hl,0c48fh		;5197
	ld a,(hl)			;519a
	ld hl,051bch		;519b   ; sonido_51BC: datos de sonido que lee el motor de p16 al tocar los sonidos 0x01, 0x02, 0x03, 0x04, 0x05,
	call L_51AD		;519e
	ld a,(hl)			;51a1
	or b			;51a2
	or c			;51a3
L_51A4:
	ld e,a			;51a4
	ld (0c643h),a		;51a5
	ld a,007h		;51a8
	jp escribe_psg		;51aa   ; escribe_psg: escribe A en el registro del PSG (PR2 p13:73A6)
L_51AD:
	and 003h		;51ad
	ld e,a			;51af
	ld d,000h		;51b0
	add hl,de			;51b2
	ret			;51b3

; ----------------------------------------------------------------------
; DATOS sonido_51B4: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A y 160
;   mas (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392 (7 bytes)
;   0x51b4..0x51bb  (7 bytes)
DATA_sonido_51B4:
	defb 089h,081h,088h,080h,092h,082h,090h	; 51b4

; ----------------------------------------------------------------------
; DATOS sin identificar  0x51bb..0x51bc  (1 bytes)
DATA_51BB:
	defb 080h	; 51bb

; ----------------------------------------------------------------------
; DATOS sonido_51BC: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A y 160
;   mas (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392 (4 bytes)
;   0x51bc..0x51c0  (4 bytes)
DATA_sonido_51BC:
	defb 0a4h,084h,0a0h,080h	; 51bc

; ======================================================================
; CODIGO 0x51c0..0x5486  (710 bytes)
; ======================================================================


L_51C0:
	ld ix,0c64bh		;51c0
	ld bc,0c657h		;51c4
	ld de,0c64dh		;51c7
	ld hl,0c4cch		;51ca
	ld a,(de)			;51cd
	res 0,(ix+000h)		;51ce
	cp (hl)			;51d2
	jp z,L_51DC		;51d3
	set 0,(ix+000h)		;51d6
	ld a,(hl)			;51da
	ld (de),a			;51db
L_51DC:
	inc de			;51dc
	inc hl			;51dd
	ld a,(de)			;51de
	res 1,(ix+000h)		;51df
	cp (hl)			;51e3
	jp z,L_51ED		;51e4
	set 1,(ix+000h)		;51e7
	ld a,(hl)			;51eb
	ld (de),a			;51ec
L_51ED:
	inc de			;51ed
	inc hl			;51ee
	res 2,(ix+001h)		;51ef
	ld a,(bc)			;51f3
	cp (hl)			;51f4
	jp z,L_51FE		;51f5
	set 2,(ix+001h)		;51f8
	ld a,(hl)			;51fc
	ld (bc),a			;51fd
L_51FE:
	inc bc			;51fe
	ld hl,0c50ch		;51ff
	ld a,(de)			;5202
	res 2,(ix+000h)		;5203
	cp (hl)			;5207
	jp z,L_5211		;5208
	set 2,(ix+000h)		;520b
	ld a,(hl)			;520f
	ld (de),a			;5210
L_5211:
	inc de			;5211
	inc hl			;5212
	ld a,(de)			;5213
	res 3,(ix+000h)		;5214
	cp (hl)			;5218
	jp z,L_5222		;5219
	set 3,(ix+000h)		;521c
	ld a,(hl)			;5220
	ld (de),a			;5221
L_5222:
	inc de			;5222
	inc hl			;5223
	res 3,(ix+001h)		;5224
	ld a,(bc)			;5228
	cp (hl)			;5229
	jp z,L_5233		;522a
	set 3,(ix+001h)		;522d
	ld a,(hl)			;5231
	ld (bc),a			;5232
L_5233:
	inc bc			;5233
	ld hl,0c54ch		;5234
	ld a,(de)			;5237
	res 4,(ix+000h)		;5238
	cp (hl)			;523c
	jp z,L_5246		;523d
	set 4,(ix+000h)		;5240
	ld a,(hl)			;5244
	ld (de),a			;5245
L_5246:
	inc de			;5246
	inc hl			;5247
	ld a,(de)			;5248
	res 5,(ix+000h)		;5249
	cp (hl)			;524d
	jp z,L_5257		;524e
	set 5,(ix+000h)		;5251
	ld a,(hl)			;5255
	ld (de),a			;5256
L_5257:
	inc de			;5257
	inc hl			;5258
	res 4,(ix+001h)		;5259
	ld a,(bc)			;525d
	cp (hl)			;525e
	jp z,L_5268		;525f
	set 4,(ix+001h)		;5262
	ld a,(hl)			;5266
	ld (bc),a			;5267
L_5268:
	inc bc			;5268
	ld hl,0c58ch		;5269
	ld a,(de)			;526c
	res 6,(ix+000h)		;526d
	cp (hl)			;5271
	jp z,L_527B		;5272
	set 6,(ix+000h)		;5275
	ld a,(hl)			;5279
	ld (de),a			;527a
L_527B:
	inc de			;527b
	inc hl			;527c
	ld a,(de)			;527d
	res 7,(ix+000h)		;527e
	cp (hl)			;5282
	jp z,L_528C		;5283
	set 7,(ix+000h)		;5286
	ld a,(hl)			;528a
	ld (de),a			;528b
L_528C:
	inc de			;528c
	inc hl			;528d
	res 5,(ix+001h)		;528e
	ld a,(bc)			;5292
	cp (hl)			;5293
	jp z,L_529D		;5294
	set 5,(ix+001h)		;5297
	ld a,(hl)			;529b
	ld (bc),a			;529c
L_529D:
	inc bc			;529d
	ld hl,0c5cch		;529e
	ld a,(de)			;52a1
	res 0,(ix+001h)		;52a2
	cp (hl)			;52a6
	jp z,L_52B0		;52a7
	set 0,(ix+001h)		;52aa
	ld a,(hl)			;52ae
	ld (de),a			;52af
L_52B0:
	inc de			;52b0
	inc hl			;52b1
	ld a,(de)			;52b2
	res 1,(ix+001h)		;52b3
	cp (hl)			;52b7
	jp z,L_52C1		;52b8
	set 1,(ix+001h)		;52bb
	ld a,(hl)			;52bf
	ld (de),a			;52c0
L_52C1:
	inc de			;52c1
	inc hl			;52c2
	res 6,(ix+001h)		;52c3
	ld a,(bc)			;52c7
	cp (hl)			;52c8
	jp z,L_52D2		;52c9
	set 6,(ix+001h)		;52cc
	ld a,(hl)			;52d0
	ld (bc),a			;52d1
L_52D2:
	inc bc			;52d2
	ret			;52d3
L_52D4:
	ld e,000h		;52d4
	ld hl,0c4cfh		;52d6
	ld c,001h		;52d9
	ld a,(hl)			;52db
	or a			;52dc
	jp z,L_52E1		;52dd
	ld a,c			;52e0
L_52E1:
	or e			;52e1
	ld e,a			;52e2
	ld hl,0c50fh		;52e3
	sla c		;52e6
	ld a,(hl)			;52e8
	or a			;52e9
	jp z,L_52EE		;52ea
	ld a,c			;52ed
L_52EE:
	or e			;52ee
	ld e,a			;52ef
	ld hl,0c54fh		;52f0
	sla c		;52f3
	ld a,(hl)			;52f5
	or a			;52f6
	jp z,L_52FB		;52f7
	ld a,c			;52fa
L_52FB:
	or e			;52fb
	ld e,a			;52fc
	ld hl,0c58fh		;52fd
	sla c		;5300
	ld a,(hl)			;5302
	or a			;5303
	jp z,L_5308		;5304
	ld a,c			;5307
L_5308:
	or e			;5308
	ld e,a			;5309
	ld hl,0c5cfh		;530a
	sla c		;530d
	ld a,(hl)			;530f
	or a			;5310
	jp z,L_5315		;5311
	ld a,c			;5314
L_5315:
	or e			;5315
	ld e,a			;5316
	ld hl,0c65ch		;5317
	ld a,(hl)			;531a
	cp e			;531b
	jp z,L_5326		;531c
	ld (hl),e			;531f
	ld hl,0c64ch		;5320
	set 7,(hl)		;5323
	ret			;5325
L_5326:
	ld hl,0c64ch		;5326
	res 7,(hl)		;5329
	ret			;532b
L_532C:
	ld ix,0c64bh		;532c
	ld hl,0c64dh		;5330
	ld de,09880h		;5333
	bit 0,(ix+000h)		;5336
	call nz,L_53C2		;533a
	inc hl			;533d
	inc de			;533e
	bit 1,(ix+000h)		;533f
	call nz,L_53C2		;5343
	inc hl			;5346
	inc de			;5347
	bit 2,(ix+000h)		;5348
	call nz,L_53C2		;534c
	inc hl			;534f
	inc de			;5350
	bit 3,(ix+000h)		;5351
	call nz,L_53C2		;5355
	inc hl			;5358
	inc de			;5359
	bit 4,(ix+000h)		;535a
	call nz,L_53C2		;535e
	inc hl			;5361
	inc de			;5362
	bit 5,(ix+000h)		;5363
	call nz,L_53C2		;5367
	inc hl			;536a
	inc de			;536b
	bit 6,(ix+000h)		;536c
	call nz,L_53C2		;5370
	inc hl			;5373
	inc de			;5374
	bit 7,(ix+000h)		;5375
	call nz,L_53C2		;5379
	inc hl			;537c
	inc de			;537d
	bit 0,(ix+001h)		;537e
	call nz,L_53C2		;5382
	inc hl			;5385
	inc de			;5386
	bit 1,(ix+001h)		;5387
	call nz,L_53C2		;538b
	inc hl			;538e
	inc de			;538f
	bit 2,(ix+001h)		;5390
	call nz,L_53C2		;5394
	inc hl			;5397
	inc de			;5398
	bit 3,(ix+001h)		;5399
	call nz,L_53C2		;539d
	inc hl			;53a0
	inc de			;53a1
	bit 4,(ix+001h)		;53a2
	call nz,L_53C2		;53a6
	inc hl			;53a9
	inc de			;53aa
	bit 5,(ix+001h)		;53ab
	call nz,L_53C2		;53af
	inc hl			;53b2
	inc de			;53b3
	bit 6,(ix+001h)		;53b4
	call nz,L_53C2		;53b8
	inc hl			;53bb
	inc de			;53bc
	bit 7,(ix+001h)		;53bd
	ret z			;53c1
L_53C2:
	ld a,03fh		;53c2
	ld (09000h),a		;53c4   ; 0x3F en 0x9000: los registros del SCC en 0x9800
	ld a,(hl)			;53c7
	ld (de),a			;53c8
	ld a,012h		;53c9
	ld (09000h),a		;53cb   ; el mapper: pone en 0x8000 el banco de A
	ret			;53ce
L_53CF:
	ld ix,0c4c0h		;53cf
	bit 7,(ix+02bh)		;53d3
	jp z,L_53EA		;53d7
	res 7,(ix+02bh)		;53da
	ld l,(ix+01bh)		;53de
	ld h,(ix+01ch)		;53e1
	ld de,09800h		;53e4
	call L_5461		;53e7
L_53EA:
	ld a,(0c68bh)		;53ea
	res 4,a		;53ed
	ld (0c68bh),a		;53ef
	ld ix,0c500h		;53f2
	bit 7,(ix+02bh)		;53f6
	jp z,L_541D		;53fa
	res 7,(ix+02bh)		;53fd
	bit 0,a		;5401
	jp z,L_5411		;5403
	set 4,a		;5406
	ld (0c68bh),a		;5408
	ld hl,0c663h		;540b
	jp L_5417		;540e
L_5411:
	ld l,(ix+01bh)		;5411
	ld h,(ix+01ch)		;5414
L_5417:
	ld de,09820h		;5417
	call L_5461		;541a
L_541D:
	ld a,(0c68bh)		;541d
	bit 3,a		;5420
	jp z,L_5430		;5422
	bit 4,a		;5425
	jp z,L_544B		;5427
	ld hl,0c663h		;542a
	jp L_5445		;542d
L_5430:
	ld ix,0c540h		;5430
	bit 7,(ix+02bh)		;5434
	jp z,L_544B		;5438
	res 7,(ix+02bh)		;543b
	ld l,(ix+01bh)		;543f
	ld h,(ix+01ch)		;5442
L_5445:
	ld de,09840h		;5445
	call L_5461		;5448
L_544B:
	ld ix,0c580h		;544b
	bit 7,(ix+02bh)		;544f
	ret z			;5453
	res 7,(ix+02bh)		;5454
	ld l,(ix+01bh)		;5458
	ld h,(ix+01ch)		;545b
	ld de,09860h		;545e
L_5461:
	ld a,03fh		;5461
	ld (09000h),a		;5463   ; 0x3F en 0x9000: los registros del SCC en 0x9800
	xor a			;5466
	ld (0988fh),a		;5467
	ld b,020h		;546a
L_546C:
	ld a,(hl)			;546c
	ld (de),a			;546d
	inc hl			;546e
	inc de			;546f
	djnz L_546C		;5470
	ld a,(0c65ch)		;5472
	ld (0988fh),a		;5475
	ld a,012h		;5478
	ld (09000h),a		;547a   ; el mapper: pone en 0x8000 el banco de A
	ret			;547d
escribe_psg:		; escribe A en el registro del PSG (PR2 p13:73A6)
	out (0a0h),a		;547e
	ex af,af'			;5480
	ld a,e			;5481
	out (0a1h),a		;5482
	ex af,af'			;5484
	ret			;5485

; ----------------------------------------------------------------------
; DATOS sonido_5486: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x6A, 0x6B, 0x6D, 0x6E, 0x6F, 0x70, 0x71, 0x74, 0x76, 0x77 y 20
;   mas (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392 (16
;   bytes)
;   0x5486..0x5496  (16 bytes)
DATA_sonido_5486:
	defb 0e6h,054h,0efh,054h,008h,055h,01dh,055h,032h,055h,047h,055h,060h,055h,084h,055h	; 5486  .T.T.U.U2UGU`U.U

; ----------------------------------------------------------------------
; DATOS sin identificar  0x5496..0x5498  (2 bytes)
DATA_5496:
	defb 095h,055h	; 5496

; ----------------------------------------------------------------------
; DATOS sonido_5498: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x6A, 0x6B, 0x6F, 0x70, 0x71, 0x72, 0x73, 0x74, 0x76, 0x77 y 20
;   mas (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392 (8 bytes)
;   0x5498..0x54a0  (8 bytes)
DATA_sonido_5498:
	defb 0beh,055h,0d4h,055h,0f2h,055h,014h,056h	; 5498  .U.U.U.V

; ----------------------------------------------------------------------
; DATOS sin identificar  0x54a0..0x54a4  (4 bytes)
DATA_54A0:
	defb 035h,056h,053h,056h	; 54a0

; ----------------------------------------------------------------------
; DATOS sonido_54A4: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x6D, 0x6E, 0x71, 0x73, 0x76, 0x7A, 0x7B, 0x82, 0x88, 0x89 y 9 mas
;   (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392 (14 bytes)
;   0x54a4..0x54b2  (14 bytes)
DATA_sonido_54A4:
	defb 06ch,056h,085h,056h,0a0h,056h,0bdh,056h,0deh,056h,0ffh,056h,020h,057h	; 54a4  lV.V.V.V.V.V W

; ----------------------------------------------------------------------
; DATOS resto_54B2: lo apuntan con el banco puesto p16:4698 (0x54B6), p16:469C
;   (0x54B6), p16:46A7 (0x54CE), p16:46AB (0x54CE); el tamano es lo que hay
;   hasta lo siguiente, no sale de recorrerlo; lo leen p16:4698, p16:469C,
;   p16:46A7, p16:46AB (52 bytes)
;   0x54b2..0x54e6  (52 bytes)
DATA_resto_54B2:
	defb 041h,057h,041h,057h,042h,057h,042h,057h,042h,057h,042h,057h,042h,057h,042h,057h	; 54b2  AWAWBWBWBWBWBWBW
	defb 042h,057h,042h,057h,042h,057h,042h,057h,042h,057h,042h,057h,043h,057h,049h,057h	; 54c2  BWBWBWBWBWBWCWIW
	defb 04fh,057h,063h,057h,082h,057h,095h,057h,0a8h,057h,0bdh,057h,0d2h,057h,0eeh,057h	; 54d2  OWcW.W.W.W.W.W.W
	defb 00ah,058h,019h,058h	; 54e2

; ----------------------------------------------------------------------
; DATOS sonido_54E6: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x6A, 0x6B, 0x6D, 0x6E, 0x6F, 0x70, 0x71, 0x74, 0x76, 0x77 y 20
;   mas (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392 (175
;   bytes)
;   0x54e6..0x5595  (175 bytes)
DATA_sonido_54E6:
	defb 0e3h,001h,0e4h,000h,070h,00bh,050h,00ah,0ffh,0e3h,001h,0e4h,000h,070h,00ah,050h	; 54e6  ....p.P......p.P
	defb 009h,0e2h,008h,000h,000h,0e3h,001h,010h,009h,0e2h,008h,000h,000h,0e3h,001h,000h	; 54f6  ................
	defb 009h,0ffh,0e3h,001h,0e4h,003h,080h,00bh,0e3h,004h,0e4h,001h,060h,00ah,050h,00ah	; 5506  ............`.P.
	defb 040h,00ah,030h,00ah,020h,009h,0ffh,0e2h,001h,0e5h,004h,000h,070h,000h,000h,0e8h	; 5516  @.0. .......p...
	defb 0e1h,001h,0e4h,001h,007h,006h,005h,004h,003h,002h,001h,0ffh,0e2h,001h,0e5h,00ah	; 5526  ................
	defb 000h,070h,000h,000h,0e8h,0e1h,001h,0e4h,004h,007h,006h,005h,004h,003h,002h,001h	; 5536  .p..............
	defb 0ffh,0e2h,001h,0e5h,00ah,000h,042h,0c1h,0b0h,0e8h,0e1h,001h,0e4h,008h,008h,007h	; 5546  ......B.........
	defb 006h,005h,004h,003h,002h,002h,001h,001h,000h,0ffh,0e2h,001h,0e5h,00ah,000h,012h	; 5556  ................
	defb 0c4h,000h,0e8h,0e1h,001h,0e4h,008h,009h,008h,007h,006h,005h,0e4h,00ah,0e1h,002h	; 5566  ................
	defb 006h,005h,004h,003h,002h,001h,000h,0e1h,006h,0e4h,00bh,001h,000h,0ffh,0e2h,001h	; 5576  ................
	defb 0a1h,080h,0e1h,001h,0e4h,004h,007h,006h,005h,004h,003h,002h,001h,000h,0ffh	; 5586  ...............

; ----------------------------------------------------------------------
; DATOS sin identificar  0x5595..0x55be  (41 bytes)
DATA_5595:
	defb 0e2h,001h,0e5h,00ah,000h,060h,000h,000h,0e8h,0e1h,001h,0e4h,008h,009h,0e3h,002h	; 5595  .....`..........
	defb 0e4h,005h,070h,00eh,060h,00dh,050h,00ch,040h,00bh,030h,00ah,020h,009h,010h,008h	; 55a5  ..p.`.P.@.0. ...
	defb 0e4h,002h,020h,00bh,010h,00ah,000h,009h,0ffh	; 55b5  .. ......

; ----------------------------------------------------------------------
; DATOS sonido_55BE: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392
;   (20 bytes)
;   0x55be..0x55d2  (20 bytes)
DATA_sonido_55BE:
	defb 0e2h,002h,0e5h,009h,000h,0a0h,0a2h,080h,0e1h,001h,0e4h,008h,006h,0e4h,003h,005h	; 55be  ................
	defb 004h,003h,002h,001h	; 55ce

; ----------------------------------------------------------------------
; DATOS sin identificar  0x55d2..0x55d4  (2 bytes)
DATA_55D2:
	defb 000h,0ffh	; 55d2

; ----------------------------------------------------------------------
; DATOS sonido_55D4: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x6A, 0x6B, 0x6F, 0x70, 0x71, 0x72, 0x73, 0x74, 0x76, 0x77 y 20
;   mas (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392 (97
;   bytes)
;   0x55d4..0x5635  (97 bytes)
DATA_sonido_55D4:
	defb 0e2h,001h,0e5h,008h,001h,000h,000h,001h,0e8h,064h,000h,054h,080h,045h,000h,0e2h	; 55d4  .........d.T.E..
	defb 003h,005h,000h,0e2h,001h,004h,000h,004h,080h,005h,000h,006h,000h,0ffh,0e2h,001h	; 55e4  ................
	defb 0e5h,008h,001h,080h,097h,000h,098h,000h,0e8h,0e2h,001h,064h,000h,054h,080h,045h	; 55f4  ...........d.T.E
	defb 000h,0e2h,003h,005h,000h,0e2h,001h,004h,000h,004h,080h,005h,000h,006h,000h,0ffh	; 5604  ................
	defb 0e2h,001h,091h,0c0h,0e1h,001h,0e4h,004h,007h,006h,005h,004h,003h,0e1h,002h,0e4h	; 5614  ................
	defb 003h,004h,003h,002h,001h,0e4h,002h,002h,001h,000h,0e1h,003h,0e4h,001h,001h,000h	; 5624  ................
	defb 0ffh	; 5634

; ----------------------------------------------------------------------
; DATOS sin identificar  0x5635..0x566c  (55 bytes)
DATA_5635:
	defb 0e2h,001h,080h,046h,0e1h,001h,0e4h,001h,009h,008h,007h,006h,005h,004h,003h,002h	; 5635  ...F............
	defb 001h,0e1h,003h,004h,003h,002h,001h,0e1h,00ah,0e4h,000h,001h,000h,0ffh,0e2h,001h	; 5645  ................
	defb 0a1h,02ah,091h,04ah,081h,055h,071h,060h,061h,06ah,051h,075h,041h,080h,031h,08ah	; 5655  .*.J.Uq`ajQuA.1.
	defb 021h,095h,011h,0a0h,001h,0b0h,0ffh	; 5665

; ----------------------------------------------------------------------
; DATOS sonido_566C: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392
;   (18 bytes)
;   0x566c..0x567e  (18 bytes)
DATA_sonido_566C:
	defb 0e2h,001h,0b1h,05ah,091h,080h,081h,08ah,071h,095h,061h,0a0h,051h,0aah,041h,0b5h	; 566c  ...Z....q.a.Q.A.
	defb 031h,0c0h	; 567c

; ----------------------------------------------------------------------
; DATOS sin identificar  0x567e..0x5685  (7 bytes)
DATA_567E:
	defb 021h,0cah,011h,0d5h,001h,0e0h,0ffh	; 567e

; ----------------------------------------------------------------------
; DATOS sonido_5685: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392
;   (18 bytes)
;   0x5685..0x5697  (18 bytes)
DATA_sonido_5685:
	defb 0e2h,001h,0b1h,095h,0a1h,0c0h,091h,0cah,0b1h,0d5h,071h,0e0h,061h,0eah,051h,0f5h	; 5685  ..........q.a.Q.
	defb 042h,000h	; 5695

; ----------------------------------------------------------------------
; DATOS sin identificar  0x5697..0x56a0  (9 bytes)
DATA_5697:
	defb 032h,00ah,022h,015h,012h,020h,002h,030h,0ffh	; 5697  2.".. .0.

; ----------------------------------------------------------------------
; DATOS sonido_56A0: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392
;   (18 bytes)
;   0x56a0..0x56b2  (18 bytes)
DATA_sonido_56A0:
	defb 0e2h,001h,0c1h,0e0h,0b2h,010h,0a2h,01ah,092h,025h,082h,030h,072h,03ah,062h,045h	; 56a0  .........%.0r:bE
	defb 052h,050h	; 56b0

; ----------------------------------------------------------------------
; DATOS sin identificar  0x56b2..0x56bd  (11 bytes)
DATA_56B2:
	defb 042h,05ah,032h,065h,022h,070h,012h,07ah,002h,085h,0ffh	; 56b2  BZ2e"p.z...

; ----------------------------------------------------------------------
; DATOS sonido_56BD: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x6D, 0x6E, 0x71, 0x73, 0x76, 0x7A, 0x7B, 0x82, 0x88, 0x89 y 9 mas
;   (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392 (132 bytes)
;   0x56bd..0x5741  (132 bytes)
DATA_sonido_56BD:
	defb 0e2h,001h,061h,0f8h,0e1h,001h,0e4h,004h,005h,004h,003h,002h,001h,0e1h,002h,0e4h	; 56bd  ..a.............
	defb 003h,002h,001h,000h,000h,0e4h,002h,000h,000h,000h,0e1h,003h,0e4h,001h,000h,000h	; 56cd  ................
	defb 0ffh,0e2h,001h,071h,0f8h,0e1h,001h,0e4h,004h,005h,004h,003h,002h,001h,0e1h,002h	; 56dd  ...q............
	defb 0e4h,003h,002h,001h,001h,000h,0e4h,002h,001h,000h,000h,0e1h,003h,0e4h,001h,000h	; 56ed  ................
	defb 000h,0ffh,0e2h,001h,081h,0f8h,0e1h,001h,0e4h,004h,006h,005h,004h,003h,002h,0e1h	; 56fd  ................
	defb 002h,0e4h,003h,003h,002h,001h,000h,0e4h,002h,001h,000h,000h,0e1h,003h,0e4h,001h	; 570d  ................
	defb 000h,000h,0ffh,0e2h,001h,091h,0f8h,0e1h,001h,0e4h,004h,007h,006h,005h,004h,003h	; 571d  ................
	defb 0e1h,002h,0e4h,003h,004h,003h,002h,001h,0e4h,002h,002h,001h,000h,0e1h,003h,0e4h	; 572d  ................
	defb 001h,001h,000h,0ffh	; 573d

; ----------------------------------------------------------------------
; DATOS resto_5741: lo apuntan con el banco puesto p16:4FCD (0x583E), p16:5039
;   (0x583E); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p16:4FCD, p16:5039 (257 bytes)
;   0x5741..0x5842  (257 bytes)
DATA_resto_5741:
	defb 0ffh,0ffh,0e1h,001h,0e4h,001h,009h,0ffh,0e1h,001h,0e4h,001h,007h,0ffh,0e1h,001h	; 5741  ................
	defb 0e4h,005h,005h,0e4h,002h,007h,0e4h,000h,008h,0e1h,004h,007h,006h,005h,004h,003h	; 5751  ................
	defb 002h,0ffh,0e3h,001h,0e4h,005h,070h,00dh,0e4h,002h,080h,00bh,0e4h,000h,090h,009h	; 5761  ......p.........
	defb 0e3h,004h,080h,00bh,070h,00bh,060h,00bh,050h,00bh,040h,00bh,030h,00bh,020h,00bh	; 5771  ....p.`.P.@.0. .
	defb 0ffh,0e1h,001h,0e4h,014h,005h,0e2h,001h,052h,000h,0e1h,001h,0e4h,010h,004h,003h	; 5781  ........R.......
	defb 0e4h,006h,002h,0ffh,0e1h,001h,0e4h,014h,006h,0e2h,001h,062h,000h,0e1h,001h,0e4h	; 5791  ...........b....
	defb 010h,005h,004h,0e4h,006h,002h,0ffh,0e2h,001h,072h,030h,0e1h,002h,0e4h,005h,007h	; 57a1  .........r0.....
	defb 0e1h,002h,0e4h,006h,007h,0e4h,008h,005h,0e4h,004h,004h,0ffh,0e2h,001h,082h,030h	; 57b1  ...............0
	defb 0e1h,002h,0e4h,005h,008h,0e1h,002h,0e4h,006h,008h,0e4h,008h,006h,0e4h,004h,005h	; 57c1  ................
	defb 0ffh,0e2h,001h,092h,030h,0e1h,001h,0e4h,005h,00ah,0e4h,006h,008h,0e4h,008h,007h	; 57d1  ....0...........
	defb 0e4h,004h,006h,0e1h,005h,0e4h,00ah,005h,004h,003h,002h,001h,0ffh,0e2h,001h,0a2h	; 57e1  ................
	defb 030h,0e1h,001h,0e4h,005h,00ah,0e4h,006h,009h,0e4h,008h,008h,0e4h,004h,007h,0e1h	; 57f1  0...............
	defb 005h,0e4h,00ah,005h,004h,003h,002h,001h,0ffh,0e2h,001h,0e5h,009h,001h,0a0h,094h	; 5801  ................
	defb 050h,096h,000h,097h,000h,098h,000h,0ffh,0e1h,001h,0e4h,008h,005h,0e4h,007h,008h	; 5811  P...............
	defb 0e4h,006h,007h,0e4h,005h,008h,0e4h,004h,008h,0e4h,004h,008h,0e4h,003h,008h,0e4h	; 5821  ................
	defb 002h,008h,0e1h,001h,0e4h,001h,007h,006h,005h,004h,003h,002h,0ffh,0f2h,058h,012h	; 5831  ..............X.
	defb 059h	; 5841

; ----------------------------------------------------------------------
; DATOS sonido_5842: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x12, 0x1D, 0x24, 0x2E, 0x30, 0x56, 0x6A, 0x6B, 0x6D, 0x6E y 27
;   mas (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392 (4 bytes)
;   0x5842..0x5846  (4 bytes)
DATA_sonido_5842:
	defb 032h,059h,052h,059h	; 5842

; ----------------------------------------------------------------------
; DATOS sin identificar  0x5846..0x5848  (2 bytes)
DATA_5846:
	defb 072h,059h	; 5846

; ----------------------------------------------------------------------
; DATOS sonido_5848: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x07, 0x08, 0x09, 0x0B, 0x0C, 0x0E, 0x11, 0x16, 0x1F, 0x22 y 35
;   mas (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392 (2 bytes)
;   0x5848..0x584a  (2 bytes)
DATA_sonido_5848:
	defb 092h,059h	; 5848

; ----------------------------------------------------------------------
; DATOS sin identificar  0x584a..0x584c  (2 bytes)
DATA_584A:
	defb 0b2h,059h	; 584a

; ----------------------------------------------------------------------
; DATOS sonido_584C: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x0A, 0x0C, 0x13, 0x17, 0x19, 0x1D, 0x1E, 0x25, 0x28, 0x30 y 62
;   mas (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392 (14
;   bytes)
;   0x584c..0x585a  (14 bytes)
DATA_sonido_584C:
	defb 0d2h,059h,0f2h,059h,012h,05ah,032h,05ah,052h,05ah,072h,05ah,092h,05ah	; 584c  .Y.Y.Z2ZRZrZ.Z

; ----------------------------------------------------------------------
; DATOS sin identificar  0x585a..0x585e  (4 bytes)
DATA_585A:
	defb 0b2h,05ah,0d2h,05ah	; 585a

; ----------------------------------------------------------------------
; DATOS sonido_585E: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x3F, 0x5C, 0x78, 0x7A, 0x81, 0x84, 0x9A, 0x9C, 0xA2, 0xA3 y 5 mas
;   (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392 (6 bytes)
;   0x585e..0x5864  (6 bytes)
DATA_sonido_585E:
	defb 0f2h,05ah,012h,05bh,032h,05bh	; 585e

; ----------------------------------------------------------------------
; DATOS sin identificar  0x5864..0x5866  (2 bytes)
DATA_5864:
	defb 052h,05bh	; 5864

; ----------------------------------------------------------------------
; DATOS sonido_5866: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x06, 0x0F, 0x20, 0x21, 0x32, 0x3E, 0x55, 0x61, 0x65, 0x6A y 19
;   mas (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392 (8 bytes)
;   0x5866..0x586e  (8 bytes)
DATA_sonido_5866:
	defb 072h,05bh,092h,05bh,0b2h,05bh,0d2h,05bh	; 5866  r[.[.[.[

; ----------------------------------------------------------------------
; DATOS sin identificar  0x586e..0x5870  (2 bytes)
DATA_586E:
	defb 0f2h,05bh	; 586e

; ----------------------------------------------------------------------
; DATOS sonido_5870: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x20, 0x2E, 0x3B, 0x49, 0x59, 0x5D, 0x5E, 0x63, 0x6D, 0x6E y 5 mas
;   (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392 (4 bytes)
;   0x5870..0x5874  (4 bytes)
DATA_sonido_5870:
	defb 012h,05ch,032h,05ch	; 5870

; ----------------------------------------------------------------------
; DATOS sin identificar  0x5874..0x5876  (2 bytes)
DATA_5874:
	defb 052h,05ch	; 5874

; ----------------------------------------------------------------------
; DATOS sonido_5876: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x17, 0x1B, 0x2B, 0x2C, 0x2D, 0x2E, 0x39, 0x6A, 0x6B, 0x6D y 8 mas
;   (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392 (4 bytes)
;   0x5876..0x587a  (4 bytes)
DATA_sonido_5876:
	defb 072h,05ch,092h,05ch	; 5876

; ----------------------------------------------------------------------
; DATOS sin identificar  0x587a..0x587e  (4 bytes)
DATA_587A:
	defb 0b2h,05ch,0d2h,05ch	; 587a

; ----------------------------------------------------------------------
; DATOS sonido_587E: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x0D (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392
;   (2 bytes)
;   0x587e..0x5880  (2 bytes)
DATA_sonido_587E:
	defb 0f2h,05ch	; 587e

; ----------------------------------------------------------------------
; DATOS sin identificar  0x5880..0x5884  (4 bytes)
DATA_5880:
	defb 012h,05dh,032h,05dh	; 5880

; ----------------------------------------------------------------------
; DATOS sonido_5884: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x0A, 0x0D, 0x0F, 0x10, 0x13, 0x14, 0x15, 0x18, 0x1A, 0x21 y 43
;   mas (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392 (12
;   bytes)
;   0x5884..0x5890  (12 bytes)
DATA_sonido_5884:
	defb 052h,05dh,072h,05dh,092h,05dh,0b2h,05dh,0d2h,05dh,0f2h,05dh	; 5884  R]r].].].].]

; ----------------------------------------------------------------------
; DATOS sin identificar  0x5890..0x5892  (2 bytes)
DATA_5890:
	defb 012h,05eh	; 5890

; ----------------------------------------------------------------------
; DATOS sonido_5892: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x1D, 0x43, 0x78, 0x7F (lo mide tools/partituras.py ejecutandolo);
;   lo leen p16:4392 (2 bytes)
;   0x5892..0x5894  (2 bytes)
DATA_sonido_5892:
	defb 032h,05eh	; 5892

; ----------------------------------------------------------------------
; DATOS sin identificar  0x5894..0x58ae  (26 bytes)
DATA_5894:
	defb 052h,05eh,072h,05eh,092h,05eh,0b2h,05eh,0d2h,05eh,0f2h,05eh,012h,05fh,032h,05fh	; 5894  R^r^.^.^.^.^._2_
	defb 052h,05fh,072h,05fh,092h,05fh,0b2h,05fh,0d2h,05fh	; 58a4  R_r_._._._

; ----------------------------------------------------------------------
; DATOS sonido_58AE: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x48, 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0x58ae..0x58b2  (4 bytes)
DATA_sonido_58AE:
	defb 0f2h,05fh,012h,060h	; 58ae

; ----------------------------------------------------------------------
; DATOS sin identificar  0x58b2..0x58ba  (8 bytes)
DATA_58B2:
	defb 032h,060h,052h,060h,072h,060h,092h,060h	; 58b2  2`R`r`.`

; ----------------------------------------------------------------------
; DATOS sonido_58BA: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x40, 0x4E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0x58ba..0x58be  (4 bytes)
DATA_sonido_58BA:
	defb 0b2h,060h,0d2h,060h	; 58ba

; ----------------------------------------------------------------------
; DATOS sin identificar  0x58be..0x58c0  (2 bytes)
DATA_58BE:
	defb 0f2h,060h	; 58be

; ----------------------------------------------------------------------
; DATOS sonido_58C0: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x25, 0x2E, 0x42, 0x44, 0x45, 0x46, 0x4C, 0x60, 0x76, 0x77 y 6 mas
;   (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392 (6 bytes)
;   0x58c0..0x58c6  (6 bytes)
DATA_sonido_58C0:
	defb 012h,061h,032h,061h,052h,061h	; 58c0

; ----------------------------------------------------------------------
; DATOS sin identificar  0x58c6..0x58ca  (4 bytes)
DATA_58C6:
	defb 072h,061h,092h,061h	; 58c6

; ----------------------------------------------------------------------
; DATOS sonido_58CA: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x2A, 0x2F, 0x36, 0x37, 0x3E, 0x40, 0x4A, 0x4B, 0x63, 0x6F y 25
;   mas (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392 (14
;   bytes)
;   0x58ca..0x58d8  (14 bytes)
DATA_sonido_58CA:
	defb 0b2h,061h,0d2h,061h,0f2h,061h,012h,062h,032h,062h,052h,062h,072h,062h	; 58ca  .a.a.a.b2bRbrb

; ----------------------------------------------------------------------
; DATOS sin identificar  0x58d8..0x58da  (2 bytes)
DATA_58D8:
	defb 092h,062h	; 58d8

; ----------------------------------------------------------------------
; DATOS sonido_58DA: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x44, 0x9E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0x58da..0x58dc  (2 bytes)
DATA_sonido_58DA:
	defb 0b2h,062h	; 58da

; ----------------------------------------------------------------------
; DATOS sin identificar  0x58dc..0x58de  (2 bytes)
DATA_58DC:
	defb 0d2h,062h	; 58dc

; ----------------------------------------------------------------------
; DATOS sonido_58DE: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x6A, 0x6B, 0x70, 0x71, 0x72, 0x74, 0x77, 0x78, 0x79, 0x7A y 13
;   mas (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392 (10
;   bytes)
;   0x58de..0x58e8  (10 bytes)
DATA_sonido_58DE:
	defb 0f2h,062h,012h,063h,032h,063h,052h,063h,072h,063h	; 58de  .b.c2cRcrc

; ----------------------------------------------------------------------
; DATOS sin identificar  0x58e8..0x58ee  (6 bytes)
DATA_58E8:
	defb 092h,063h,0b2h,063h,0d2h,063h	; 58e8

; ----------------------------------------------------------------------
; DATOS sonido_58EE: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x1C (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392
;   (2 bytes)
;   0x58ee..0x58f0  (2 bytes)
DATA_sonido_58EE:
	defb 0f2h,063h	; 58ee

; ----------------------------------------------------------------------
; DATOS sin identificar  0x58f0..0x5906  (22 bytes)
DATA_58F0:
	defb 012h,064h,07fh,07fh,07fh,07fh,07fh,07fh,07fh,07fh,07fh,07fh,07fh,07fh,07fh,07fh	; 58f0  .d..............
	defb 07fh,07fh,080h,080h,080h,080h	; 5900

; ----------------------------------------------------------------------
; DATOS sonido_5906: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x54 (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392
;   (2 bytes)
;   0x5906..0x5908  (2 bytes)
DATA_sonido_5906:
	defb 080h,080h	; 5906

; ----------------------------------------------------------------------
; DATOS sin identificar  0x5908..0x5932  (42 bytes)
DATA_5908:
	defb 080h,080h,080h,080h,080h,080h,080h,080h,080h,000h,07fh,07fh,07fh,07fh,07fh,07fh	; 5908  ................
	defb 07fh,07fh,080h,080h,080h,080h,080h,080h,080h,080h,07fh,07fh,07fh,07fh,07fh,07fh	; 5918  ................
	defb 07fh,07fh,080h,080h,080h,080h,080h,080h,080h,080h	; 5928  ..........

; ----------------------------------------------------------------------
; DATOS sonido_5932: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x12, 0x1D, 0x24, 0x2E, 0x30, 0x56, 0x6A, 0x6B, 0x6D, 0x6E y 27
;   mas (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392 (64
;   bytes)
;   0x5932..0x5972  (64 bytes)
DATA_sonido_5932:
	defb 000h,0f8h,0f0h,0e8h,0e0h,0d8h,0d0h,0c8h,0c0h,0b8h,0b0h,0a8h,0a0h,098h,090h,088h	; 5932  ................
	defb 080h,078h,070h,068h,060h,058h,050h,048h,040h,038h,030h,028h,020h,018h,010h,008h	; 5942  .xph`XPH@80( ...
	defb 000h,0f0h,0e0h,0d0h,0c0h,0b0h,0a0h,090h,080h,070h,060h,050h,040h,030h,020h,010h	; 5952  .........p`P@0 .
	defb 000h,0f0h,0e0h,0d0h,0c0h,0b0h,0a0h,090h,080h,070h,060h,050h,040h,030h,020h,010h	; 5962  .........p`P@0 .

; ----------------------------------------------------------------------
; DATOS sin identificar  0x5972..0x5992  (32 bytes)
DATA_5972:
	defb 000h,04eh,062h,06dh,075h,07ah,07dh,07eh,07fh,07eh,07dh,07ah,075h,06dh,062h,04eh	; 5972  .Nbmuz}~.~}zumbN
	defb 000h,0b1h,09dh,092h,08ah,085h,082h,081h,080h,081h,082h,085h,08ah,092h,09dh,0b1h	; 5982  ................

; ----------------------------------------------------------------------
; DATOS sonido_5992: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x07, 0x08, 0x09, 0x0B, 0x0C, 0x0E, 0x11, 0x16, 0x1F, 0x22 y 35
;   mas (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392 (32
;   bytes)
;   0x5992..0x59b2  (32 bytes)
DATA_sonido_5992:
	defb 000h,019h,031h,047h,05ah,06ah,075h,07dh,07fh,07dh,075h,06ah,05ah,047h,031h,019h	; 5992  ..1GZju}.}ujZG1.
	defb 000h,0e7h,0cfh,0b9h,0a6h,096h,08bh,083h,080h,083h,08bh,096h,0a6h,0b9h,0cfh,0e7h	; 59a2  ................

; ----------------------------------------------------------------------
; DATOS sin identificar  0x59b2..0x59d2  (32 bytes)
DATA_59B2:
	defb 000h,0f0h,0e0h,0d0h,0c0h,0b0h,0a0h,090h,080h,090h,0a0h,0b0h,0c0h,0d0h,0e0h,0f0h	; 59b2  ................
	defb 000h,010h,020h,030h,040h,050h,060h,070h,07fh,070h,060h,050h,040h,030h,020h,010h	; 59c2  .. 0@P`p.p`P@0 .

; ----------------------------------------------------------------------
; DATOS sonido_59D2: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x0A, 0x0C, 0x13, 0x17, 0x19, 0x1D, 0x1E, 0x25, 0x28, 0x30 y 61
;   mas (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392 (224
;   bytes)
;   0x59d2..0x5ab2  (224 bytes)
DATA_sonido_59D2:
	defb 000h,0e0h,0c0h,0a0h,080h,0a0h,0c0h,0e0h,000h,020h,040h,060h,07fh,060h,040h,020h	; 59d2  ......... @`.`@
	defb 000h,0e0h,0c0h,0a0h,080h,0a0h,0c0h,0e0h,000h,020h,040h,060h,07fh,060h,040h,020h	; 59e2  ......... @`.`@
	defb 000h,019h,031h,047h,05ah,06ah,075h,07dh,07fh,07dh,075h,06ah,05ah,047h,031h,019h	; 59f2  ..1GZju}.}ujZG1.
	defb 000h,0f0h,0e0h,0d0h,0c0h,0b0h,0a0h,090h,080h,090h,0a0h,0b0h,0c0h,0d0h,0e0h,0f0h	; 5a02  ................
	defb 000h,019h,031h,047h,05ah,06ah,075h,07dh,07fh,07dh,075h,06ah,05ah,047h,031h,019h	; 5a12  ..1GZju}.}ujZG1.
	defb 000h,0e0h,0c0h,0a0h,080h,0a0h,0c0h,0e0h,000h,020h,040h,060h,07fh,060h,040h,020h	; 5a22  ......... @`.`@
	defb 000h,019h,031h,047h,05ah,06ah,075h,07dh,07fh,07dh,075h,06ah,05ah,047h,031h,019h	; 5a32  ..1GZju}.}ujZG1.
	defb 080h,090h,0a0h,0b0h,0c0h,0d0h,0e0h,0f0h,000h,010h,020h,030h,040h,050h,060h,070h	; 5a42  .......... 0@P`p
	defb 000h,019h,031h,047h,05ah,06ah,075h,07dh,07fh,07dh,075h,06ah,05ah,047h,031h,019h	; 5a52  ..1GZju}.}ujZG1.
	defb 080h,0a0h,0c0h,0e0h,000h,020h,040h,060h,080h,0a0h,0c0h,0e0h,000h,020h,040h,060h	; 5a62  ..... @`..... @`
	defb 001h,02ah,040h,050h,05ch,068h,070h,078h,07fh,078h,070h,068h,05ch,050h,040h,02ah	; 5a72  .*@P\hpx.xph\P@*
	defb 0ffh,0d6h,0c0h,0b0h,0a4h,098h,090h,088h,081h,088h,090h,098h,0a4h,0b0h,0c0h,0d6h	; 5a82  ................
	defb 000h,040h,07fh,040h,001h,0c0h,081h,0c0h,001h,040h,07fh,040h,001h,0c0h,001h,040h	; 5a92  .@.@.....@.@...@
	defb 001h,0e0h,001h,020h,001h,0f0h,001h,010h,001h,0ffh,0ffh,0ffh,0ffh,040h,040h,040h	; 5aa2  ... .........@@@

; ----------------------------------------------------------------------
; DATOS sin identificar  0x5ab2..0x5af2  (64 bytes)
DATA_5AB2:
	defb 078h,070h,068h,060h,058h,050h,048h,040h,038h,030h,028h,020h,018h,010h,008h,000h	; 5ab2  xph`XPH@80( ....
	defb 078h,070h,068h,060h,058h,050h,048h,040h,038h,030h,028h,020h,018h,010h,008h,000h	; 5ac2  xph`XPH@80( ....
	defb 080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h	; 5ad2  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5ae2  ................

; ----------------------------------------------------------------------
; DATOS sonido_5AF2: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x3F, 0x5C, 0x78, 0x7A, 0x81, 0x84, 0x9A, 0x9C, 0xA2, 0xA3 y 5 mas
;   (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392 (96 bytes)
;   0x5af2..0x5b52  (96 bytes)
DATA_sonido_5AF2:
	defb 000h,040h,07fh,040h,001h,010h,020h,02dh,037h,044h,04eh,059h,063h,06ch,073h,078h	; 5af2  .@.@.. -7DNYclsx
	defb 07ch,07fh,07ch,078h,073h,06ch,059h,04eh,044h,037h,02dh,020h,010h,003h,002h,001h	; 5b02  |.|xslYND7- ....
	defb 000h,040h,07fh,040h,010h,001h,0eah,0d6h,0c3h,0b9h,0afh,0a4h,09ch,095h,08fh,08ah	; 5b12  .@.@............
	defb 086h,083h,081h,083h,086h,08ah,08fh,095h,09ch,0a4h,0afh,0b9h,0c3h,0d6h,0eah,0ffh	; 5b22  ................
	defb 000h,040h,07fh,040h,000h,0c0h,0ffh,0c0h,005h,0ebh,0d6h,0c3h,0b9h,0afh,0a4h,09ch	; 5b32  .@.@............
	defb 095h,08fh,089h,084h,081h,084h,089h,08fh,095h,09ch,0a4h,0afh,0b9h,0c3h,0d6h,0eah	; 5b42  ................

; ----------------------------------------------------------------------
; DATOS sin identificar  0x5b52..0x5b72  (32 bytes)
DATA_5B52:
	defb 000h,0f0h,0e0h,0d0h,0c0h,0b0h,0a0h,090h,080h,080h,080h,080h,080h,080h,080h,080h	; 5b52  ................
	defb 080h,080h,080h,080h,080h,080h,080h,080h,07fh,070h,060h,050h,040h,030h,020h,010h	; 5b62  .........p`P@0 .

; ----------------------------------------------------------------------
; DATOS sonido_5B72: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x06, 0x0F, 0x20, 0x21, 0x32, 0x3E, 0x55, 0x61, 0x65, 0x6A y 19
;   mas (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392 (128
;   bytes)
;   0x5b72..0x5bf2  (128 bytes)
DATA_sonido_5B72:
	defb 000h,030h,050h,060h,070h,060h,050h,030h,000h,0d0h,0b0h,0a0h,090h,0a0h,0b0h,0d0h	; 5b72  .0P`p`P0........
	defb 000h,040h,060h,070h,060h,040h,000h,0c0h,0a0h,090h,0a0h,0c0h,000h,070h,000h,090h	; 5b82  .@`p`@.......p..
	defb 030h,050h,050h,030h,000h,000h,010h,040h,060h,070h,060h,030h,0f0h,0e0h,0e0h,000h	; 5b92  0PP0...@`p`0....
	defb 020h,020h,010h,0c0h,0a0h,090h,0a0h,0c0h,000h,000h,0d0h,0b0h,0b0h,0d0h,000h,000h	; 5ba2    ..............
	defb 0a0h,090h,090h,0a0h,0a0h,0b0h,0b0h,0b0h,0c0h,0c0h,0d0h,0d0h,0e0h,0e0h,0f0h,0f0h	; 5bb2  ................
	defb 000h,000h,010h,010h,020h,020h,030h,030h,040h,040h,050h,050h,060h,060h,060h,050h	; 5bc2  ....  00@@PP```P
	defb 000h,07fh,000h,080h,0a0h,0c0h,0d8h,0f0h,008h,020h,030h,040h,050h,060h,070h,078h	; 5bd2  ......... 0@P`px
	defb 07ch,07fh,07ch,078h,070h,060h,050h,040h,030h,020h,008h,0f0h,0d8h,0c0h,0a0h,080h	; 5be2  |.|xp`P@0 ......

; ----------------------------------------------------------------------
; DATOS sin identificar  0x5bf2..0x5c12  (32 bytes)
DATA_5BF2:
	defb 07fh,080h,07fh,080h,07fh,080h,07fh,080h,07fh,080h,07fh,080h,07fh,080h,07fh,080h	; 5bf2  ................
	defb 07fh,080h,07fh,080h,07fh,080h,07fh,080h,07fh,080h,07fh,080h,07fh,080h,07fh,080h	; 5c02  ................

; ----------------------------------------------------------------------
; DATOS sonido_5C12: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x20, 0x2E, 0x3B, 0x49, 0x59, 0x5D, 0x5E, 0x63, 0x6D, 0x6E y 4 mas
;   (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392 (64 bytes)
;   0x5c12..0x5c52  (64 bytes)
DATA_sonido_5C12:
	defb 07fh,080h,07fh,080h,07fh,080h,07fh,080h,000h,000h,000h,000h,000h,000h,000h,000h	; 5c12  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,07fh,080h,07fh,080h,07fh,080h,07fh,080h	; 5c22  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,07fh,080h,07fh,080h,07fh,080h,07fh,080h	; 5c32  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5c42  ................

; ----------------------------------------------------------------------
; DATOS sin identificar  0x5c52..0x5c72  (32 bytes)
DATA_5C52:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,07fh,080h,07fh,080h,07fh,080h,07fh,080h	; 5c52  ................
	defb 07fh,080h,07fh,080h,07fh,080h,07fh,080h,000h,000h,000h,000h,000h,000h,000h,000h	; 5c62  ................

; ----------------------------------------------------------------------
; DATOS sonido_5C72: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x17, 0x1B, 0x2B, 0x2C, 0x2D, 0x2E, 0x39, 0x6A, 0x6B, 0x6D y 8 mas
;   (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392 (64 bytes)
;   0x5c72..0x5cb2  (64 bytes)
DATA_sonido_5C72:
	defb 080h,08eh,0a0h,0c0h,0e0h,000h,020h,03fh,03eh,03ch,03ah,037h,031h,029h,020h,01ch	; 5c72  ...... ?><:71) .
	defb 010h,000h,0e6h,0c0h,0d0h,000h,020h,03fh,010h,0e0h,080h,0c0h,000h,020h,000h,090h	; 5c82  ...... ?..... ..
	defb 000h,070h,050h,020h,050h,070h,030h,000h,050h,07fh,060h,010h,030h,040h,000h,0b0h	; 5c92  .pP Pp0.P.`.0@..
	defb 010h,060h,000h,0e0h,0f0h,000h,0b0h,090h,0c0h,010h,0e0h,0a0h,0c0h,0f0h,0c0h,0a0h	; 5ca2  .`..............

; ----------------------------------------------------------------------
; DATOS sin identificar  0x5cb2..0x5cf2  (64 bytes)
DATA_5CB2:
	defb 080h,088h,090h,098h,0a0h,0b0h,0b0h,0b8h,0c0h,0c8h,0d0h,0d8h,0e0h,0e8h,0f0h,0f8h	; 5cb2  ................
	defb 000h,008h,010h,018h,020h,028h,030h,038h,040h,048h,050h,058h,060h,068h,070h,078h	; 5cc2  .... (08@HPX`hpx
	defb 000h,020h,030h,040h,050h,060h,068h,070h,078h,070h,068h,060h,050h,040h,030h,020h	; 5cd2  . 0@P`hpxph`P@0
	defb 000h,0e0h,0d0h,0c0h,0b0h,0a0h,098h,090h,088h,090h,098h,0a0h,0b0h,0c0h,0d0h,0e0h	; 5ce2  ................

; ----------------------------------------------------------------------
; DATOS sonido_5CF2: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x0D (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392
;   (32 bytes)
;   0x5cf2..0x5d12  (32 bytes)
DATA_sonido_5CF2:
	defb 000h,000h,000h,000h,000h,078h,078h,000h,000h,080h,080h,080h,000h,000h,000h,000h	; 5cf2  .....xx.........
	defb 078h,078h,078h,000h,080h,080h,000h,000h,000h,000h,078h,078h,000h,000h,080h,080h	; 5d02  xxx.......xx....

; ----------------------------------------------------------------------
; DATOS sin identificar  0x5d12..0x5d52  (64 bytes)
DATA_5D12:
	defb 078h,078h,078h,078h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h	; 5d12  xxxx............
	defb 080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h	; 5d22  ................
	defb 078h,078h,078h,078h,078h,078h,078h,078h,080h,080h,080h,080h,080h,080h,080h,080h	; 5d32  xxxxxxxx........
	defb 080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h	; 5d42  ................

; ----------------------------------------------------------------------
; DATOS sonido_5D52: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x0A, 0x0D, 0x0F, 0x10, 0x13, 0x14, 0x15, 0x18, 0x1A, 0x21 y 43
;   mas (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392 (192
;   bytes)
;   0x5d52..0x5e12  (192 bytes)
DATA_sonido_5D52:
	defb 080h,0b0h,0c0h,010h,01ah,02ah,02ch,01ah,000h,0e0h,0d0h,0e0h,022h,053h,070h,075h	; 5d52  .....*,....."Spu
	defb 070h,031h,0eah,080h,088h,08ah,08ch,08eh,000h,07fh,075h,073h,062h,000h,0c0h,090h	; 5d62  p1........usb...
	defb 000h,020h,030h,040h,050h,058h,060h,068h,070h,068h,060h,058h,050h,040h,030h,020h	; 5d72  . 0@PX`hph`XP@0
	defb 000h,0e0h,0d0h,0c0h,0b0h,0a0h,098h,090h,088h,090h,098h,0a0h,0b0h,0c0h,0d0h,0e0h	; 5d82  ................
	defb 000h,000h,000h,000h,000h,070h,070h,000h,000h,080h,080h,080h,000h,000h,000h,000h	; 5d92  .....pp.........
	defb 070h,070h,070h,000h,080h,080h,000h,000h,000h,000h,070h,070h,000h,000h,080h,080h	; 5da2  ppp.......pp....
	defb 000h,000h,000h,080h,000h,070h,070h,070h,000h,000h,000h,080h,000h,000h,000h,080h	; 5db2  .....ppp........
	defb 080h,080h,080h,000h,080h,000h,000h,000h,000h,080h,080h,080h,000h,080h,080h,080h	; 5dc2  ................
	defb 000h,030h,0f0h,030h,040h,050h,060h,060h,070h,079h,070h,078h,040h,000h,000h,00eh	; 5dd2  .0.0@P``pypx@...
	defb 070h,083h,060h,050h,000h,000h,000h,026h,074h,082h,084h,065h,064h,0e4h,093h,084h	; 5de2  p.`P...&t..ed...
	defb 070h,070h,070h,070h,070h,070h,070h,070h,080h,080h,080h,080h,080h,080h,080h,080h	; 5df2  pppppppp........
	defb 070h,070h,070h,080h,080h,080h,070h,070h,070h,070h,080h,080h,080h,080h,080h,080h	; 5e02  ppp...pppp......

; ----------------------------------------------------------------------
; DATOS sin identificar  0x5e12..0x5e32  (32 bytes)
DATA_5E12:
	defb 0a0h,090h,090h,090h,0a0h,0a0h,0b0h,0b0h,0c0h,0c0h,0d0h,0d0h,0e0h,0e0h,0f0h,0f0h	; 5e12  ................
	defb 000h,000h,010h,010h,020h,020h,030h,030h,040h,040h,050h,050h,060h,060h,060h,050h	; 5e22  ....  00@@PP```P

; ----------------------------------------------------------------------
; DATOS sonido_5E32: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x1D, 0x43, 0x78, 0x7F (lo mide tools/partituras.py ejecutandolo);
;   lo leen p16:4392 (32 bytes)
;   0x5e32..0x5e52  (32 bytes)
DATA_sonido_5E32:
	defb 070h,070h,060h,080h,090h,090h,080h,080h,040h,040h,030h,080h,090h,090h,080h,080h	; 5e32  pp`.....@@0.....
	defb 020h,020h,010h,080h,090h,090h,080h,080h,000h,000h,0f0h,080h,090h,090h,080h,080h	; 5e42    ..............

; ----------------------------------------------------------------------
; DATOS sin identificar  0x5e52..0x5ff2  (416 bytes)
DATA_5E52:
	defb 000h,0f8h,0f0h,0e8h,0e0h,0d8h,0d0h,0c8h,0c0h,0b8h,0b0h,0a8h,0a0h,098h,090h,088h	; 5e52  ................
	defb 080h,088h,090h,098h,0a0h,0a8h,0b0h,0b8h,0c0h,0c8h,0d0h,0d8h,0e0h,0e8h,0f0h,0f8h	; 5e62  ................
	defb 078h,070h,068h,060h,058h,050h,040h,040h,038h,030h,028h,020h,018h,010h,008h,000h	; 5e72  xph`XP@@80( ....
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5e82  ................
	defb 0f8h,0f0h,0e8h,0e0h,0d8h,0d0h,0c8h,0c0h,0b8h,0b0h,0a8h,0a0h,098h,090h,088h,080h	; 5e92  ................
	defb 078h,070h,068h,060h,058h,050h,048h,040h,038h,030h,028h,020h,018h,010h,008h,000h	; 5ea2  xph`XPH@80( ....
	defb 000h,005h,00ah,010h,015h,01ah,020h,025h,030h,035h,03ah,040h,045h,04ah,050h,055h	; 5eb2  ...... %05:@EJPU
	defb 060h,065h,06ah,065h,06ah,070h,075h,07ah,07fh,070h,060h,050h,040h,030h,020h,010h	; 5ec2  `ejejpuz.p`P@0 .
	defb 080h,080h,080h,080h,080h,080h,080h,080h,000h,000h,000h,000h,000h,000h,000h,000h	; 5ed2  ................
	defb 080h,080h,080h,080h,080h,080h,080h,080h,000h,000h,000h,000h,000h,000h,000h,000h	; 5ee2  ................
	defb 000h,00ah,015h,020h,02ah,035h,040h,04ah,055h,060h,06ah,075h,07fh,060h,040h,020h	; 5ef2  ... *5@JU`ju.`@
	defb 000h,0e0h,0c0h,0a0h,080h,08ah,095h,0a0h,0aah,0b5h,0c0h,0cah,0d5h,0e0h,0eah,0f5h	; 5f02  ................
	defb 080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h	; 5f12  ................
	defb 07fh,07fh,07fh,07fh,07fh,07fh,07fh,07fh,07fh,07fh,07fh,07fh,07fh,07fh,07fh,07fh	; 5f22  ................
	defb 07fh,07fh,07fh,07fh,07fh,07fh,07fh,07fh,080h,080h,080h,080h,080h,080h,080h,080h	; 5f32  ................
	defb 07fh,07fh,07fh,07fh,07fh,07fh,07fh,07fh,080h,080h,080h,080h,080h,080h,080h,080h	; 5f42  ................
	defb 000h,07fh,000h,080h,0a0h,0c0h,0d8h,0f0h,008h,020h,030h,040h,050h,060h,070h,078h	; 5f52  ......... 0@P`px
	defb 07ch,07fh,07ch,078h,070h,060h,050h,040h,030h,020h,008h,0f0h,0d8h,0c0h,0a0h,080h	; 5f62  |.|xp`P@0 ......
	defb 000h,07fh,070h,070h,060h,060h,040h,020h,000h,0e0h,0c0h,0a0h,0a0h,090h,090h,080h	; 5f72  ..pp``@ ........
	defb 000h,07fh,070h,070h,060h,060h,040h,020h,000h,0e0h,0c0h,0a0h,0a0h,090h,090h,000h	; 5f82  ..pp``@ ........
	defb 080h,07fh,080h,070h,080h,060h,080h,050h,080h,040h,080h,030h,080h,020h,080h,010h	; 5f92  ...p.`.P.@.0. ..
	defb 080h,000h,080h,0f0h,080h,0e0h,080h,0d0h,080h,0c0h,080h,0b0h,080h,0a0h,080h,090h	; 5fa2  ................
	defb 080h,07fh,080h,07fh,080h,07fh,080h,07fh,080h,07fh,080h,07fh,080h,07fh,080h,07fh	; 5fb2  ................
	defb 080h,07fh,080h,060h,080h,040h,080h,010h,080h,0f0h,080h,0d0h,080h,0b0h,080h,090h	; 5fc2  ...`.@..........
	defb 000h,080h,020h,080h,040h,080h,060h,080h,07fh,080h,060h,080h,040h,080h,020h,080h	; 5fd2  .. .@.`...`.@. .
	defb 000h,080h,0e0h,080h,0c0h,080h,0a0h,080h,0a0h,080h,0c0h,080h,0e0h,080h,000h,080h	; 5fe2  ................

; ----------------------------------------------------------------------
; DATOS sonido_5FF2: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x48 (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392
;   (14 bytes)
;   0x5ff2..0x6000  (14 bytes)
DATA_sonido_5FF2:
	defb 080h,080h,080h,080h,080h,080h,010h,080h,080h,080h,080h,080h,080h,080h	; 5ff2  ..............
