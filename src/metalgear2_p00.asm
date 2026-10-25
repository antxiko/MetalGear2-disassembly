; ==========================================================================
; METAL GEAR 2 SOLID SNAKE - Konami (1990) - MSX2 - MegaROM RC-767 de 512 KB (Konami SCC) - banco 00 (se ejecuta en 0x4000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x04000


; ----------------------------------------------------------------------
; DATOS sin identificar  0x4000..0x402e  (46 bytes)
DATA_4000:
	defb 041h,042h,02eh,040h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 4000  AB.@............
	defb 043h,044h,007h,067h,0ffh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 4010  CD.g............
	defb 000h,000h,000h,000h,000h,000h,000h,000h,081h,002h,001h,002h,080h,0f6h	; 4020  ..............

; ======================================================================
; CODIGO 0x402e..0x4210  (482 bytes)
; ======================================================================


L_402E:
	di			;402e
	call 06011h		;402f
	di			;4032
	ld h,a			;4033
	ld l,0f7h		;4034
	ld (0fedah),hl		;4036
	ld hl,L_4040		;4039
	ld (0fedch),hl		;403c
	ret			;403f
L_4040:
	di			;4040
	im 1		;4041
	ld sp,0c200h		;4043
	ld hl,0fd9fh		;4046
	ld de,0c39ah		;4049
	ld bc,00005h		;404c
	ldir		;404f
	ld a,0c9h		;4051
	ld (0fd9ah),a		;4053
	ld (0fd9fh),a		;4056
	call L_5FF1		;4059
	call 06011h		;405c
	call 00138h		;405f   ; BIOS RSLREG - Reads the primary slot register
	ld (0c388h),a		;4062
	call 07243h		;4065
	ld (0c386h),a		;4068
	ld a,(0c388h)		;406b
	call 0013bh		;406e   ; BIOS WSLREG - Writes value to the primary slot register
	call 09dd4h		;4071
	ld a,(0ffa7h)		;4074
	cp 0c9h		;4077
	call nz,0602dh		;4079
	ld hl,0c400h		;407c
	ld bc,02cffh		;407f
	call L_4236		;4082
	ld hl,0a0b6h		;4085
	ld de,0c200h		;4088
	ld bc,000a0h		;408b
	ldir		;408e
	ld hl,0a021h		;4090
	ld de,0c2a0h		;4093
	ld bc,000a0h		;4096
	ldir		;4099
	ld hl,0a14bh		;409b
	ld de,0c340h		;409e
	ld bc,00040h		;40a1
	ldir		;40a4
	ld hl,0a186h		;40a6
	ld de,0c000h		;40a9
	ld bc,00040h		;40ac
	ldir		;40af
	ld hl,0c380h		;40b1
	xor a			;40b4
	ld (05000h),a		;40b5
	ld (hl),a			;40b8
	inc a			;40b9
	ld (07000h),a		;40ba
	inc hl			;40bd
	ld (hl),a			;40be
	inc a			;40bf
	ld (09000h),a		;40c0
	inc hl			;40c3
	ld (hl),a			;40c4
	inc a			;40c5
	ld (0b000h),a		;40c6
	inc hl			;40c9
	ld (hl),a			;40ca
	call 0803dh		;40cb
	di			;40ce
	ld a,0c3h		;40cf
	ld (0fd9ah),a		;40d1
	ld hl,0c200h		;40d4
	ld (0fd9bh),hl		;40d7
	ld hl,0c200h		;40da
	ld (0fd9bh),hl		;40dd
	ld a,(0c388h)		;40e0
	call 0013bh		;40e3   ; BIOS WSLREG - Writes value to the primary slot register
	xor a			;40e6
	ld (0f3dbh),a		;40e7
	call 0013eh		;40ea   ; BIOS RDVDP - Reads VDP status register
	ei			;40ed
L_40EE:
	jr L_40EE		;40ee
L_40F0:
	push af			;40f0
	ld a,001h		;40f1
L_40F3:
	di			;40f3
	push hl			;40f4
	ld hl,0c381h		;40f5
	ld (hl),a			;40f8
	ld (07000h),a		;40f9
	inc a			;40fc
	inc hl			;40fd
	ld (hl),a			;40fe
	ld (09000h),a		;40ff
	jr L_414E		;4102
L_4104:
	push af			;4104
	ld a,020h		;4105
	jr L_40F3		;4107
L_4109:
	push af			;4109
	ld a,023h		;410a
	jr L_40F3		;410c
L_410E:
	push af			;410e
	ld a,018h		;410f
	jr L_40F3		;4111
L_4113:
	push af			;4113
	ld a,01bh		;4114
	jr L_4145		;4116
L_4118:
	push af			;4118
	ld a,01dh		;4119
	jr L_4145		;411b
L_411D:
	push af			;411d
	ld a,030h		;411e
	jr L_4145		;4120
L_4122:
	push af			;4122
	ld a,032h		;4123
	jr L_4145		;4125
L_4127:
	push af			;4127
	ld a,034h		;4128
	jr L_4145		;412a
L_412C:
	push af			;412c
	ld a,039h		;412d
	jr L_4145		;412f
L_4131:
	push af			;4131
	ld a,03ch		;4132
	jr L_4145		;4134
L_4136:
	push af			;4136
	ld a,03eh		;4137
	jr L_4145		;4139
L_413B:
	push af			;413b
	di			;413c
	jr L_4145		;413d
L_413F:
	call L_40F0		;413f
L_4142:
	push af			;4142
	ld a,004h		;4143
L_4145:
	di			;4145
	push hl			;4146
	ld hl,0c382h		;4147
	ld (hl),a			;414a
	ld (09000h),a		;414b
L_414E:
	inc a			;414e
	inc hl			;414f
	ld (hl),a			;4150
	ld (0b000h),a		;4151
	pop hl			;4154
	pop af			;4155
	ei			;4156
	ret			;4157
L_4158:
	push af			;4158
	ld a,024h		;4159
	jr L_4145		;415b
L_415D:
	push af			;415d
	ld a,026h		;415e
	jr L_4145		;4160
L_4162:
	push af			;4162
	ld a,028h		;4163
	jr L_4145		;4165
L_4167:
	push af			;4167
	ld a,02ah		;4168
	jr L_4145		;416a
L_416C:
	push af			;416c
	ld a,02ch		;416d
	jr L_4145		;416f
L_4171:
	push af			;4171
	ld a,02eh		;4172
	jr L_4145		;4174
L_4176:
	call L_40F0		;4176
L_4179:
	push af			;4179
	ld a,00dh		;417a
	jr L_4145		;417c
L_417E:
	push af			;417e
	ld a,035h		;417f
	jr L_41A3		;4181
L_4183:
	push af			;4183
	ld a,036h		;4184
	jr L_41A3		;4186
L_4188:
	call L_4142		;4188
	call L_41DD		;418b
L_418E:
	push af			;418e
	ld a,038h		;418f
	jr L_41A3		;4191
L_4193:
	push af			;4193
	ld a,03ah		;4194
	jr L_41A3		;4196
L_4198:
	push af			;4198
	ld a,03fh		;4199
	jr L_41A3		;419b
L_419D:
	call L_40F0		;419d
L_41A0:
	push af			;41a0
	ld a,006h		;41a1
L_41A3:
	di			;41a3
	ld (0c383h),a		;41a4
	ld (0b000h),a		;41a7
	pop af			;41aa
	ei			;41ab
	ret			;41ac
L_41AD:
	call L_40F0		;41ad
L_41B0:
	push af			;41b0
	ld a,007h		;41b1
	jr L_41A3		;41b3
L_41B5:
	call L_413F		;41b5
	jr L_41BD		;41b8
L_41BA:
	call L_40F0		;41ba
L_41BD:
	push af			;41bd
	ld a,008h		;41be
	jr L_41A3		;41c0
L_41C2:
	call L_40F0		;41c2
L_41C5:
	push af			;41c5
	ld a,009h		;41c6
	jr L_41A3		;41c8
L_41CA:
	call L_40F0		;41ca
L_41CD:
	push af			;41cd
	ld a,00ah		;41ce
	jr L_41A3		;41d0
L_41D2:
	call L_40F0		;41d2
L_41D5:
	push af			;41d5
	ld a,00bh		;41d6
	jr L_41A3		;41d8
L_41DA:
	call L_40F0		;41da
L_41DD:
	push af			;41dd
	ld a,00ch		;41de
L_41E0:
	di			;41e0
	ld (0c381h),a		;41e1
	ld (07000h),a		;41e4
	pop af			;41e7
	ei			;41e8
	ret			;41e9
L_41EA:
	push af			;41ea
	ld a,001h		;41eb
	jr L_41E0		;41ed
L_41EF:
	push af			;41ef
	ld a,00eh		;41f0
	jr L_41A3		;41f2
L_41F4:
	call L_40F0		;41f4
L_41F7:
	push af			;41f7
	ld a,00fh		;41f8
	jr L_41A3		;41fa
L_41FC:
	push af			;41fc
	ld a,025h		;41fd
	jr L_41A3		;41ff
L_4201:
	push af			;4201
	ld a,02fh		;4202
	jr L_41A3		;4204
L_4206:
	push af			;4206
	ld a,01eh		;4207
	jr L_41A3		;4209
L_420B:
	push af			;420b
	ld a,01fh		;420c
	jr L_41A3		;420e

; ----------------------------------------------------------------------
; DATOS sin identificar  0x4210..0x421a  (10 bytes)
DATA_4210:
	defb 0f5h,03eh,031h,018h,08eh,0f5h,03eh,033h,018h,089h	; 4210  .>1...>3..

; ======================================================================
; CODIGO 0x421a..0x4270  (86 bytes)
; ======================================================================


L_421A:
	push af			;421a
	ld a,032h		;421b
	jr L_422C		;421d
L_421F:
	push af			;421f
	ld a,039h		;4220
	jr L_422C		;4222
L_4224:
	push af			;4224
	ld a,004h		;4225
	jr L_422C		;4227
L_4229:
	push af			;4229
	ld a,01bh		;422a
L_422C:
	di			;422c
	ld (0c382h),a		;422d
	ld (09000h),a		;4230
	pop af			;4233
	ei			;4234
	ret			;4235
L_4236:
	xor a			;4236
L_4237:
	ld d,h			;4237
	ld e,l			;4238
	inc de			;4239
	ld (hl),a			;423a
	ldir		;423b
	ret			;423d
L_423E:
	add a,l			;423e
	ld l,a			;423f
	ret nc			;4240
	inc h			;4241
	ret			;4242
L_4243:
	add a,e			;4243
	ld e,a			;4244
	ret nc			;4245
	inc d			;4246
	ret			;4247
L_4248:
	call L_423E		;4248
	ld a,(hl)			;424b
	ret			;424c
L_424D:
	pop hl			;424d
L_424E:
	add a,a			;424e
	call L_4248		;424f
	inc hl			;4252
	ld h,(hl)			;4253
	ld l,a			;4254
	jp (hl)			;4255
L_4256:
	push bc			;4256
	ld a,(0ca03h)		;4257
	rrca			;425a
	rrca			;425b
	rrca			;425c
	rrca			;425d
	ld b,a			;425e
	ld a,r		;425f
	rlca			;4261
	rlca			;4262
	add a,b			;4263
	pop bc			;4264
	ret			;4265
L_4266:
	ld hl,0dc00h		;4266
	ld bc,0007fh		;4269
	ld a,0e0h		;426c
	jr L_4237		;426e

; ----------------------------------------------------------------------
; DATOS sin identificar  0x4270..0x4276  (6 bytes)
DATA_4270:
	defb 0cdh,079h,042h,0c3h,03fh,041h	; 4270

; ======================================================================
; CODIGO 0x4276..0x435f  (233 bytes)
; ======================================================================


L_4276:
	call 06dffh		;4276
L_4279:
	call L_5F98		;4279
	call L_439D		;427c
	call L_437E		;427f
	call 06ff9h		;4282
	call L_42BC		;4285
L_4288:
	call L_42D4		;4288
	call L_42E5		;428b
	ld a,(0ca5fh)		;428e
	and a			;4291
	ret z			;4292
	call L_4142		;4293
	call 09889h		;4296
	jp L_40F0		;4299
L_429C:
	call L_4288		;429c
	jp L_41CA		;429f
L_42A2:
	call L_4288		;42a2
	jp L_413F		;42a5
L_42A8:
	ld a,(0cac4h)		;42a8
	jr L_42B0		;42ab
L_42AD:
	ld a,(0ca54h)		;42ad
L_42B0:
	ld b,a			;42b0
	ld a,(0cae2h)		;42b1
	or a			;42b4
	ret z			;42b5
	ld a,b			;42b6
	ld hl,087cah		;42b7
	jr L_42C2		;42ba
L_42BC:
	ld a,(0ca52h)		;42bc
	ld hl,00fcah		;42bf
L_42C2:
	ld e,005h		;42c2
	add a,002h		;42c4
	ld d,a			;42c6
	ld c,007h		;42c7
	ld a,(0ca42h)		;42c9
	jp L_46BC		;42cc
L_42CF:
	ld hl,088cbh		;42cf
	jr L_42DA		;42d2
L_42D4:
	ld a,(0ca52h)		;42d4
	ld hl,010cbh		;42d7
L_42DA:
	ld b,a			;42da
	ld c,003h		;42db
	call L_42FE		;42dd
	ld d,a			;42e0
	xor a			;42e1
	jp L_46FF		;42e2
L_42E5:
	ld a,(0ca53h)		;42e5
	and 0feh		;42e8
	or a			;42ea
	ret z			;42eb
	cp 080h		;42ec
	ret nc			;42ee
	ld hl,010cbh		;42ef
L_42F2:
	ld b,a			;42f2
	ld c,003h		;42f3
	call L_42FE		;42f5
	ld d,a			;42f8
	ld a,0aah		;42f9
	jp L_46FF		;42fb
L_42FE:
	ld a,(0d8a4h)		;42fe
	or a			;4301
	ld a,(0ca42h)		;4302
	ret z			;4305
	ld a,001h		;4306
	ret			;4308
L_4309:
	ld hl,080c0h		;4309
	ld bc,05a10h		;430c
	push hl			;430f
	push bc			;4310
	ld d,000h		;4311
	call L_431A		;4313
	pop bc			;4316
	pop hl			;4317
	ld d,001h		;4318
L_431A:
	xor a			;431a
	jp L_46FF		;431b
L_431E:
	ld a,(0cae2h)		;431e
	or a			;4321
	ret z			;4322
	ld a,(0cac4h)		;4323
	call L_42CF		;4326
	ld hl,0cac5h		;4329
	ld de,0cae6h		;432c
	jr L_4342		;432f
L_4331:
	ld a,(0cae2h)		;4331
	or a			;4334
	ret z			;4335
	ld a,(0ca54h)		;4336
	call L_42CF		;4339
	ld hl,0ca55h		;433c
	ld de,0cae5h		;433f
L_4342:
	push hl			;4342
	push de			;4343
	call L_4352		;4344
	pop de			;4347
	pop hl			;4348
	dec hl			;4349
	ld a,(hl)			;434a
	cp 040h		;434b
	ret nz			;434d
	inc hl			;434e
	ldi		;434f
	ret			;4351
L_4352:
	ld a,(hl)			;4352
	and 0feh		;4353
	or a			;4355
	ret z			;4356
	cp 080h		;4357
	ret nc			;4359
	ld hl,088cbh		;435a
	jr L_42F2		;435d

; ----------------------------------------------------------------------
; DATOS sin identificar  0x435f..0x4365  (6 bytes)
DATA_435F:
	defb 0cdh,065h,043h,0c3h,0adh,041h	; 435f

; ======================================================================
; CODIGO 0x4365..0x43c8  (99 bytes)
; ======================================================================


L_4365:
	ld a,(0ca4ah)		;4365
	cp 012h		;4368
	jr nz,L_4378		;436a
	ld a,(0ca4bh)		;436c
	cp 008h		;436f
	jr nz,L_4378		;4371
	ld a,(0d8a4h)		;4373
	and a			;4376
	ret nz			;4377
L_4378:
	call L_5F90		;4378
	jp L_439D		;437b
L_437E:
	ld a,(0ca42h)		;437e
	and a			;4381
	ld a,004h		;4382
	jr nz,L_4388		;4384
	ld a,001h		;4386
L_4388:
	jr L_4394		;4388
L_438A:
	ld a,(0ca42h)		;438a
	and a			;438d
	ld a,004h		;438e
	jr z,L_4394		;4390
	ld a,001h		;4392
L_4394:
	ld hl,0c216h		;4394
	ld d,03ch		;4397
	ld e,l			;4399
	jp L_47AB		;439a
L_439D:
	ld bc,03a0dh		;439d
	ld a,(0ca5fh)		;43a0
	and a			;43a3
	ld a,004h		;43a4
	jr z,L_43AA		;43a6
	ld a,002h		;43a8
L_43AA:
	push bc			;43aa
	push af			;43ab
	call L_43CC		;43ac
	pop af			;43af
	pop bc			;43b0
	ld hl,043c8h		;43b1
L_43B4:
	push af			;43b4
	push hl			;43b5
	ld h,(hl)			;43b6
	ld l,016h		;43b7
	ld a,(0ca42h)		;43b9
	xor 001h		;43bc
	call L_46DA		;43be
	pop hl			;43c1
	pop af			;43c2
	inc hl			;43c3
	dec a			;43c4
	jr nz,L_43B4		;43c5
	ret			;43c7

; ----------------------------------------------------------------------
; DATOS sin identificar  0x43c8..0x43cc  (4 bytes)
DATA_43C8:
	defb 0c3h,0fch,0d6h,0e9h	; 43c8

; ======================================================================
; CODIGO 0x43cc..0x43e3  (23 bytes)
; ======================================================================


L_43CC:
	ld hl,043e3h		;43cc
L_43CF:
	push af			;43cf
	push hl			;43d0
	ld l,(hl)			;43d1
	ld h,0c3h		;43d2
	ld a,(0ca42h)		;43d4
	xor 001h		;43d7
	call L_46E6		;43d9
	pop hl			;43dc
	pop af			;43dd
	inc hl			;43de
	dec a			;43df
	jr nz,L_43CF		;43e0
	ret			;43e2

; ----------------------------------------------------------------------
; DATOS sin identificar  0x43e3..0x43f6  (19 bytes)
DATA_43E3:
	defb 016h,04fh,029h,03ch,0c5h,04eh,01ah,077h,079h,012h,023h,013h,0c1h,00bh,078h,0b1h	; 43e3  .O)<.N.wy.#...x.
	defb 020h,0f2h,0c9h	; 43f3

; ======================================================================
; CODIGO 0x43f6..0x44d0  (218 bytes)
; ======================================================================


L_43F6:
	add a,a			;43f6
	add a,l			;43f7
	ld l,a			;43f8
	jr nc,L_43FC		;43f9
	inc h			;43fb
L_43FC:
	push af			;43fc
	ld a,(hl)			;43fd
	inc hl			;43fe
	ld h,(hl)			;43ff
	ld l,a			;4400
	pop af			;4401
	ret			;4402
L_4403:
	add a,a			;4403
	add a,e			;4404
	ld e,a			;4405
	jr nc,L_4409		;4406
	inc d			;4408
L_4409:
	ld a,(de)			;4409
	inc de			;440a
	push af			;440b
	ld a,(de)			;440c
	ld d,a			;440d
	pop af			;440e
	ld e,a			;440f
	ret			;4410
L_4411:
	ld a,h			;4411
	rra			;4412
	rra			;4413
	rra			;4414
	and 01fh		;4415
	push af			;4417
	ld h,000h		;4418
	ld a,l			;441a
	rla			;441b
	rl h		;441c
	and 0f0h		;441e
	add a,l			;4420
	jr nc,L_4424		;4421
	inc h			;4423
L_4424:
	and 0f8h		;4424
	ld l,a			;4426
	pop af			;4427
	add a,l			;4428
	jr nc,L_442C		;4429
	inc h			;442b
L_442C:
	ld l,a			;442c
	ld a,(0d8a3h)		;442d
	and a			;4430
	ld a,0ddh		;4431
	jr z,L_4437		;4433
	ld a,0e5h		;4435
L_4437:
	add a,h			;4437
	ld h,a			;4438
	ret			;4439
L_443A:
	ld a,h			;443a
	cpl			;443b
	ld h,a			;443c
	ld a,l			;443d
	cpl			;443e
	ld l,a			;443f
	inc hl			;4440
	ret			;4441
L_4442:
	ld a,d			;4442
	cpl			;4443
	ld d,a			;4444
	ld a,e			;4445
	cpl			;4446
	ld e,a			;4447
	inc de			;4448
	ret			;4449
L_444A:
	ld bc,00000h		;444a
	jr L_4455		;444d
L_444F:
	ld a,(0ca42h)		;444f
L_4452:
	ld bc,0c0c0h		;4452
L_4455:
	ld d,a			;4455
	xor a			;4456
	jr L_4462		;4457
L_4459:
	ld bc,0c0c0h		;4459
	ld a,(0ca42h)		;445c
	ld d,a			;445f
	ld a,099h		;4460
L_4462:
	ld hl,00000h		;4462
	jp L_46FF		;4465
L_4468:
	call L_4650		;4468
	call L_4503		;446b
	call L_447E		;446e
	ex af,af'			;4471
	ld a,(00006h)		;4472
	ld c,a			;4475
	ex af,af'			;4476
L_4477:
	inir		;4477
	dec a			;4479
	jr nz,L_4477		;447a
	ex de,hl			;447c
	ret			;447d
L_447E:
	ex de,hl			;447e
	ld a,c			;447f
	or a			;4480
	ld a,b			;4481
	ld b,c			;4482
	ret z			;4483
	inc a			;4484
	ret			;4485
L_4486:
	call L_4650		;4486
	ex de,hl			;4489
	call L_44E2		;448a
	call L_447E		;448d
	ex af,af'			;4490
	ld a,(00007h)		;4491
	ld c,a			;4494
	ex af,af'			;4495
L_4496:
	otir		;4496
	dec a			;4498
	jr nz,L_4496		;4499
	ret			;449b
L_449C:
	call L_4650		;449c
	push de			;449f
	push af			;44a0
	ld a,d			;44a1
	call L_44E2		;44a2
	ld d,c			;44a5
	ld a,c			;44a6
	or a			;44a7
	jr z,L_44AB		;44a8
	inc b			;44aa
L_44AB:
	ld a,(00007h)		;44ab
	ld c,a			;44ae
	pop af			;44af
L_44B0:
	out (c),a		;44b0
	dec d			;44b2
	jr nz,L_44B0		;44b3
	djnz L_44B0		;44b5
	pop de			;44b7
	ret			;44b8
L_44B9:
	call L_4650		;44b9
	push bc			;44bc
	call L_4503		;44bd
	ld a,(00006h)		;44c0
	ld c,a			;44c3
	in a,(c)		;44c4
	pop bc			;44c6
	ret			;44c7
L_44C8:
	call L_4650		;44c8
	push bc			;44cb
	push af			;44cc
	xor a			;44cd
	jr $+8		;44ce

; ----------------------------------------------------------------------
; DATOS sin identificar  0x44d0..0x44d6  (6 bytes)
DATA_44D0:
	defb 0cdh,050h,046h,0c5h,0f5h,07ah	; 44d0

; ======================================================================
; CODIGO 0x44d6..0x4572  (156 bytes)
; ======================================================================


L_44D6:
	call L_44E2		;44d6
	ld a,(00007h)		;44d9
	ld c,a			;44dc
	pop af			;44dd
	out (c),a		;44de
	pop bc			;44e0
	ret			;44e1
L_44E2:
	push bc			;44e2
	rra			;44e3
	ld a,(00007h)		;44e4
	inc a			;44e7
	ld c,a			;44e8
	ld a,h			;44e9
	rla			;44ea
	rla			;44eb
	rla			;44ec
	and 007h		;44ed
	di			;44ef
	out (c),a		;44f0
	ld a,08eh		;44f2
	out (c),a		;44f4
	ld a,l			;44f6
	out (c),a		;44f7
	ld a,h			;44f9
	and 03fh		;44fa
	or 040h		;44fc
	out (c),a		;44fe
	pop bc			;4500
	ei			;4501
	ret			;4502
L_4503:
	push bc			;4503
	rra			;4504
	ld a,(00007h)		;4505
	inc a			;4508
	ld c,a			;4509
	ld a,h			;450a
	rla			;450b
	rla			;450c
	rla			;450d
	and 007h		;450e
	di			;4510
	out (c),a		;4511
	ld a,08eh		;4513
	out (c),a		;4515
	ld a,l			;4517
	out (c),a		;4518
	ld a,h			;451a
	and 03fh		;451b
	out (c),a		;451d
	pop bc			;451f
	ei			;4520
	ret			;4521
L_4522:
	ld a,c			;4522
	ex af,af'			;4523
	ld a,(00007h)		;4524
	inc a			;4527
	ld c,a			;4528
	ld a,b			;4529
	di			;452a
	out (c),a		;452b
	ex af,af'			;452d
	or 080h		;452e
	ei			;4530
	out (c),a		;4531
	ret			;4533
L_4534:
	ld c,000h		;4534
	ex de,hl			;4536
	ld a,(hl)			;4537
	inc hl			;4538
	ld e,(hl)			;4539
	inc hl			;453a
	ld d,(hl)			;453b
	inc hl			;453c
	ex de,hl			;453d
L_453E:
	call L_4650		;453e
	call L_44E2		;4541
	exx			;4544
	ld a,(00007h)		;4545
	ld c,a			;4548
	exx			;4549
L_454A:
	ld a,(de)			;454a
	and a			;454b
	ret z			;454c
	inc de			;454d
	ld b,a			;454e
	and 07fh		;454f
	cp b			;4551
	jr z,L_4563		;4552
	and a			;4554
	jr z,L_4534		;4555
	ld b,a			;4557
L_4558:
	call L_45A3		;4558
	exx			;455b
	out (c),a		;455c
	exx			;455e
	djnz L_4558		;455f
	jr L_454A		;4561
L_4563:
	call L_45A3		;4563
L_4566:
	exx			;4566
	out (c),a		;4567
	exx			;4569
	djnz L_4566		;456a
	jr L_454A		;456c
L_456E:
	ld c,000h		;456e
	jr L_453E		;4570

; ----------------------------------------------------------------------
; DATOS sin identificar  0x4572..0x457a  (8 bytes)
DATA_4572:
	defb 00eh,001h,018h,0c0h,00eh,001h,018h,0c4h	; 4572  ........

; ======================================================================
; CODIGO 0x457a..0x4744  (458 bytes)
; ======================================================================


L_457A:
	call L_4586		;457a
	ld a,020h		;457d
	call L_4243		;457f
	dec c			;4582
	jr nz,L_457A		;4583
	ret			;4585
L_4586:
	push de			;4586
L_4587:
	ld b,010h		;4587
L_4589:
	xor a			;4589
	call L_44B9		;458a
	call L_45A8		;458d
	ex de,hl			;4590
	call L_44C8		;4591
	ex de,hl			;4594
	inc e			;4595
	inc hl			;4596
	djnz L_4589		;4597
	ld a,e			;4599
	sub 020h		;459a
	ld e,a			;459c
	bit 4,e		;459d
	jr z,L_4587		;459f
	pop de			;45a1
	ret			;45a2
L_45A3:
	ld a,(de)			;45a3
	inc de			;45a4
	bit 0,c		;45a5
	ret z			;45a7
L_45A8:
	push bc			;45a8
	ld c,a			;45a9
	ld b,008h		;45aa
L_45AC:
	rr c		;45ac
	rla			;45ae
	djnz L_45AC		;45af
	pop bc			;45b1
	ret			;45b2
L_45B3:
	call L_45D7		;45b3
	call L_45F1		;45b6
L_45B9:
	ld d,000h		;45b9
	call L_4BE4		;45bb
L_45BE:
	ld b,000h		;45be
	ld c,017h		;45c0
	jp L_4522		;45c2
L_45C5:
	ld a,(0f3e0h)		;45c5
	or 040h		;45c8
	jr L_45D1		;45ca
L_45CC:
	ld a,(0f3e0h)		;45cc
	and 0bfh		;45cf
L_45D1:
	ld b,a			;45d1
	ld c,001h		;45d2
	jp L_4522		;45d4
L_45D7:
	ld hl,0f600h		;45d7
	ld bc,00080h		;45da
	ld d,000h		;45dd
	ld a,0e0h		;45df
	call L_449C		;45e1
	ld hl,0f200h		;45e4
	ld d,000h		;45e7
	ld a,0e0h		;45e9
	ld bc,00080h		;45eb
	jp L_449C		;45ee
L_45F1:
	call L_45CC		;45f1
	jr L_45F6		;45f4
L_45F6:
	ld a,(0ffe7h)		;45f6
	or 002h		;45f9
	jr L_460E		;45fb
L_45FD:
	call L_45D7		;45fd
	call L_45F1		;4600
	call L_45B9		;4603
L_4606:
	call L_45C5		;4606
L_4609:
	ld a,(0ffe7h)		;4609
	and 0fdh		;460c
L_460E:
	ld b,a			;460e
	ld c,008h		;460f
	jp L_4522		;4611
L_4614:
	push bc			;4614
	push hl			;4615
	ld b,a			;4616
	ld a,(00007h)		;4617
	inc a			;461a
	ld c,a			;461b
	di			;461c
	out (c),b		;461d
	ld a,090h		;461f
	out (c),a		;4621
	inc c			;4623
	out (c),d		;4624
	push af			;4626
	pop af			;4627
	out (c),e		;4628
	dec c			;462a
	ld hl,0f680h		;462b
	ld a,b			;462e
	add a,a			;462f
	add a,l			;4630
	ld l,a			;4631
	xor a			;4632
	call L_44E2		;4633
	dec c			;4636
	out (c),d		;4637
	out (c),e		;4639
	pop hl			;463b
	pop bc			;463c
	ei			;463d
	ret			;463e
L_463F:
	call L_4650		;463f
	ld a,(hl)			;4642
	inc hl			;4643
	inc a			;4644
	ret z			;4645
	dec a			;4646
	ld d,(hl)			;4647
	inc hl			;4648
	ld e,(hl)			;4649
	inc hl			;464a
	call L_4614		;464b
	jr L_463F		;464e
L_4650:
	push af			;4650
L_4651:
	ld a,002h		;4651
	call L_465C		;4653
	rra			;4656
	jp c,L_4651		;4657
	pop af			;465a
	ret			;465b
L_465C:
	push bc			;465c
	push hl			;465d
	ld hl,(00006h)		;465e
	inc h			;4661
	inc l			;4662
	ld c,h			;4663
	di			;4664
	out (c),a		;4665
	ld a,08fh		;4667
	out (c),a		;4669
	ld c,l			;466b
	in a,(c)		;466c
	push af			;466e
	xor a			;466f
	ld c,h			;4670
	out (c),a		;4671
	ld a,08fh		;4673
	out (c),a		;4675
	pop af			;4677
	pop hl			;4678
	pop bc			;4679
	ei			;467a
	ret			;467b
L_467C:
	ld d,000h		;467c
	jr L_4682		;467e
L_4680:
	ld d,001h		;4680
L_4682:
	ex af,af'			;4682
	call L_4650		;4683
	push bc			;4686
	ld a,(00007h)		;4687
	inc a			;468a
	ld c,a			;468b
	ld a,024h		;468c
	di			;468e
	out (c),a		;468f
	ld a,091h		;4691
	out (c),a		;4693
	inc c			;4695
	inc c			;4696
	out (c),h		;4697
	xor a			;4699
	out (c),a		;469a
	out (c),l		;469c
	ex af,af'			;469e
	out (c),a		;469f
	pop hl			;46a1
	xor a			;46a2
	cp h			;46a3
	jr nz,L_46A7		;46a4
	inc a			;46a6
L_46A7:
	dec h			;46a7
	out (c),h		;46a8
	out (c),a		;46aa
	xor a			;46ac
	out (c),a		;46ad
	out (c),a		;46af
	out (c),l		;46b1
	ld a,d			;46b3
	out (c),a		;46b4
	ld a,070h		;46b6
	out (c),a		;46b8
	ei			;46ba
	ret			;46bb
L_46BC:
	ld b,e			;46bc
	call L_46DA		;46bd
	ld b,d			;46c0
	call L_46E6		;46c1
	push hl			;46c4
	push af			;46c5
	ld a,l			;46c6
	dec a			;46c7
	add a,e			;46c8
	ld l,a			;46c9
	ld b,d			;46ca
	pop af			;46cb
	call L_46E6		;46cc
	pop hl			;46cf
	push af			;46d0
	ld a,h			;46d1
	dec a			;46d2
	add a,d			;46d3
	ld h,a			;46d4
	ld b,e			;46d5
	pop af			;46d6
	jp L_46DA		;46d7
L_46DA:
	push af			;46da
	push hl			;46db
	push de			;46dc
	push bc			;46dd
	call L_4680		;46de
	pop bc			;46e1
	pop de			;46e2
	pop hl			;46e3
	pop af			;46e4
	ret			;46e5
L_46E6:
	push af			;46e6
	push hl			;46e7
	push de			;46e8
	push bc			;46e9
	call L_467C		;46ea
	pop bc			;46ed
	pop de			;46ee
	pop hl			;46ef
	pop af			;46f0
	ret			;46f1
L_46F2:
	push af			;46f2
	ld a,(0ca42h)		;46f3
	ld d,a			;46f6
	pop af			;46f7
	jr L_46FF		;46f8
L_46FA:
	ld a,(0ca42h)		;46fa
	ld d,a			;46fd
	xor a			;46fe
L_46FF:
	ex af,af'			;46ff
	call L_4650		;4700
	push bc			;4703
	ld a,(00007h)		;4704
	inc a			;4707
	ld c,a			;4708
	ld a,024h		;4709
	di			;470b
	out (c),a		;470c
	ld a,091h		;470e
	out (c),a		;4710
	inc c			;4712
	inc c			;4713
	out (c),h		;4714
	xor a			;4716
	out (c),a		;4717
	out (c),l		;4719
	out (c),d		;471b
	pop hl			;471d
	out (c),h		;471e
	cp h			;4720
	jr nz,L_4724		;4721
	inc a			;4723
L_4724:
	out (c),a		;4724
	xor a			;4726
	out (c),l		;4727
	cp l			;4729
	jr nz,L_472D		;472a
	inc a			;472c
L_472D:
	out (c),a		;472d
	ex af,af'			;472f
	out (c),a		;4730
	xor a			;4732
	out (c),a		;4733
	ld a,0c0h		;4735
	out (c),a		;4737
	ei			;4739
	ret			;473a
L_473B:
	ld a,(0ca42h)		;473b
	rlca			;473e
	rlca			;473f
	or 003h		;4740
	jr $+37		;4742

; ----------------------------------------------------------------------
; DATOS sin identificar  0x4744..0x474d  (9 bytes)
DATA_4744:
	defb 03ah,042h,0cah,007h,007h,0f6h,002h,018h,01ah	; 4744  :B.......

; ======================================================================
; CODIGO 0x474d..0x491c  (463 bytes)
; ======================================================================


L_474D:
	push bc			;474d
	ld a,(0ca42h)		;474e
	ld b,a			;4751
	xor 001h		;4752
	rlca			;4754
	rlca			;4755
	or b			;4756
	pop bc			;4757
	jr L_4767		;4758
L_475A:
	push bc			;475a
	ld a,(0ca42h)		;475b
	xor 001h		;475e
	ld b,a			;4760
	xor 001h		;4761
	rlca			;4763
	rlca			;4764
	or b			;4765
	pop bc			;4766
L_4767:
	ex af,af'			;4767
	call L_4650		;4768
	push bc			;476b
	ld a,(00007h)		;476c
	inc a			;476f
	ld c,a			;4770
	ld a,020h		;4771
	di			;4773
	out (c),a		;4774
	ld a,091h		;4776
	out (c),a		;4778
	inc c			;477a
	inc c			;477b
	out (c),h		;477c
	xor a			;477e
	out (c),a		;477f
	out (c),l		;4781
	ex af,af'			;4783
	ld l,a			;4784
	and 003h		;4785
	out (c),a		;4787
	out (c),d		;4789
	xor a			;478b
	out (c),a		;478c
	out (c),e		;478e
	ld a,l			;4790
	rra			;4791
	rra			;4792
	and 003h		;4793
	out (c),a		;4795
	pop hl			;4797
	out (c),h		;4798
	xor a			;479a
	out (c),a		;479b
	out (c),l		;479d
	out (c),a		;479f
	out (c),a		;47a1
	out (c),a		;47a3
	ld a,0d0h		;47a5
	out (c),a		;47a7
	ei			;47a9
	ret			;47aa
L_47AB:
	ex af,af'			;47ab
	call L_4650		;47ac
	ld a,(00007h)		;47af
	inc a			;47b2
	ld c,a			;47b3
	ld a,022h		;47b4
	di			;47b6
	out (c),a		;47b7
	ld a,091h		;47b9
	out (c),a		;47bb
	inc c			;47bd
	inc c			;47be
	out (c),l		;47bf
	ex af,af'			;47c1
	ld l,a			;47c2
	and 003h		;47c3
	out (c),a		;47c5
	out (c),h		;47c7
	xor a			;47c9
	out (c),a		;47ca
	out (c),e		;47cc
	ld a,l			;47ce
	rra			;47cf
	rra			;47d0
	and 003h		;47d1
	out (c),a		;47d3
	xor a			;47d5
	out (c),a		;47d6
	out (c),a		;47d8
	out (c),d		;47da
	cp d			;47dc
	jr nz,L_47E0		;47dd
	inc a			;47df
L_47E0:
	out (c),a		;47e0
	xor a			;47e2
	out (c),a		;47e3
	out (c),a		;47e5
	ld a,0e0h		;47e7
	out (c),a		;47e9
	ei			;47eb
	ret			;47ec
L_47ED:
	ex af,af'			;47ed
	call L_4650		;47ee
	push bc			;47f1
	ld a,(00007h)		;47f2
	inc a			;47f5
	ld c,a			;47f6
	ld a,020h		;47f7
	di			;47f9
	out (c),a		;47fa
	ld a,091h		;47fc
	out (c),a		;47fe
	inc c			;4800
	inc c			;4801
	out (c),h		;4802
	xor a			;4804
	out (c),a		;4805
	out (c),l		;4807
	ex af,af'			;4809
	rlca			;480a
	rlca			;480b
	ld l,a			;480c
	and 003h		;480d
	out (c),a		;480f
	out (c),d		;4811
	xor a			;4813
	out (c),a		;4814
	out (c),e		;4816
	ld a,l			;4818
	ld e,a			;4819
	rlca			;481a
	rlca			;481b
	and 003h		;481c
	out (c),a		;481e
	pop hl			;4820
	ld a,h			;4821
	and a			;4822
	ld a,000h		;4823
	jr nz,L_4828		;4825
	inc a			;4827
L_4828:
	out (c),h		;4828
	out (c),a		;482a
	out (c),l		;482c
	xor a			;482e
	out (c),a		;482f
	out (c),a		;4831
	out (c),a		;4833
	ld a,e			;4835
	rra			;4836
	rra			;4837
	and 00fh		;4838
	or 090h		;483a
	out (c),a		;483c
	ei			;483e
	ret			;483f
L_4840:
	ex af,af'			;4840
	call L_4650		;4841
	ld a,(00007h)		;4844
	inc a			;4847
	ld c,a			;4848
	ld a,024h		;4849
	di			;484b
	out (c),a		;484c
	ld a,091h		;484e
	out (c),a		;4850
	inc c			;4852
	inc c			;4853
	out (c),h		;4854
	xor a			;4856
	out (c),a		;4857
	out (c),l		;4859
	out (c),d		;485b
	ld a,(00007h)		;485d
	inc a			;4860
	ld c,a			;4861
	ld a,02ch		;4862
	out (c),a		;4864
	ld a,091h		;4866
	out (c),a		;4868
	inc c			;486a
	inc c			;486b
	ex af,af'			;486c
	out (c),a		;486d
	xor a			;486f
	out (c),a		;4870
	ld a,050h		;4872
	or e			;4874
	out (c),a		;4875
	ei			;4877
	ret			;4878
L_4879:
	ld (0faf5h),a		;4879
	add a,a			;487c
	add a,a			;487d
	add a,a			;487e
	add a,a			;487f
	ld e,a			;4880
	add a,a			;4881
	ld h,a			;4882
	ld a,(0f3e1h)		;4883
	and 01fh		;4886
	or h			;4888
	ld b,a			;4889
	ld c,002h		;488a
	call L_4522		;488c
	ld a,(0f3e3h)		;488f
	and 00fh		;4892
	or e			;4894
	ld b,a			;4895
	ld c,004h		;4896
	call L_4522		;4898
	ret			;489b
L_489C:
	call L_48CB		;489c
	call L_4AF9		;489f
	djnz L_489C		;48a2
	ret			;48a4
L_48A5:
	ld b,008h		;48a5
	ld de,0e7c0h		;48a7
L_48AA:
	push bc			;48aa
	push hl			;48ab
	ex de,hl			;48ac
	ld a,(de)			;48ad
	ld d,a			;48ae
	ld b,004h		;48af
L_48B1:
	ld a,c			;48b1
	rl d		;48b2
	jr c,L_48B7		;48b4
	xor a			;48b6
L_48B7:
	rld		;48b7
	ld a,c			;48b9
	rl d		;48ba
	jr c,L_48BF		;48bc
	xor a			;48be
L_48BF:
	rld		;48bf
	inc hl			;48c1
	djnz L_48B1		;48c2
	ex de,hl			;48c4
	pop hl			;48c5
	inc hl			;48c6
	pop bc			;48c7
	djnz L_48AA		;48c8
	ret			;48ca
L_48CB:
	push bc			;48cb
	push de			;48cc
	push hl			;48cd
	push de			;48ce
	call L_48A5		;48cf
	pop de			;48d2
	ld b,d			;48d3
	ld d,e			;48d4
	ld e,b			;48d5
	srl d		;48d6
	rr e		;48d8
	ld a,d			;48da
	add a,080h		;48db
	ld d,a			;48dd
	ld hl,0e7c0h		;48de
	call L_48EC		;48e1
	pop hl			;48e4
	ld bc,00008h		;48e5
	add hl,bc			;48e8
	pop de			;48e9
	pop bc			;48ea
	ret			;48eb
L_48EC:
	push de			;48ec
	ld b,008h		;48ed
L_48EF:
	push bc			;48ef
	ld bc,00004h		;48f0
	ld a,001h		;48f3
	call L_4486		;48f5
	ex de,hl			;48f8
	ld bc,00080h		;48f9
	add hl,bc			;48fc
	ex de,hl			;48fd
	pop bc			;48fe
	djnz L_48EF		;48ff
	pop de			;4901
	ret			;4902
L_4903:
	push bc			;4903
	call L_48EC		;4904
	ld a,004h		;4907
	add a,e			;4909
	cp 080h		;490a
	jr nz,L_4913		;490c
	ld a,004h		;490e
	add a,d			;4910
	ld d,a			;4911
	xor a			;4912
L_4913:
	ld e,a			;4913
	pop bc			;4914
	djnz L_4903		;4915
	ret			;4917
L_4918:
	ld c,0ffh		;4918
	jr $+4		;491a

; ----------------------------------------------------------------------
; DATOS sin identificar  0x491c..0x491e  (2 bytes)
DATA_491C:
	defb 00eh,000h	; 491c

; ======================================================================
; CODIGO 0x491e..0x4934  (22 bytes)
; ======================================================================


L_491E:
	ld d,(hl)			;491e
	inc hl			;491f
	ld e,(hl)			;4920
	inc hl			;4921
L_4922:
	ld a,(hl)			;4922
	inc hl			;4923
	ld b,a			;4924
	inc b			;4925
	ret z			;4926
	inc b			;4927
	jr z,$-16		;4928
	and c			;492a
	call L_49C1		;492b
	ld a,d			;492e
	add a,008h		;492f
	ld d,a			;4931
	jr L_4922		;4932

; ----------------------------------------------------------------------
; DATOS sin identificar  0x4934..0x4950  (28 bytes)
DATA_4934:
	defb 00eh,0ffh,018h,002h,00eh,000h,056h,023h,05eh,023h,07eh,023h,047h,004h,0c8h,004h	; 4934  ......V#^#~#G...
	defb 028h,0eeh,0a1h,0cdh,08dh,049h,07ah,0c6h,008h,057h,018h,0eeh	; 4944  (....Iz..W..

; ======================================================================
; CODIGO 0x4950..0x496c  (28 bytes)
; ======================================================================


L_4950:
	push de			;4950
L_4951:
	ld a,(hl)			;4951
	ld b,a			;4952
	inc b			;4953
	jr z,L_4962		;4954
	inc b			;4956
	jr z,L_4964		;4957
	call L_5D18		;4959
	ld a,d			;495c
	add a,008h		;495d
	ld d,a			;495f
	jr L_4951		;4960
L_4962:
	pop de			;4962
	ret			;4963
L_4964:
	pop de			;4964
	ld a,e			;4965
	add a,009h		;4966
	ld e,a			;4968
	inc hl			;4969
	jr L_4950		;496a

; ----------------------------------------------------------------------
; DATOS sin identificar  0x496c..0x49c1  (85 bytes)
DATA_496C:
	defb 0f5h,03ah,042h,0cah,0eeh,001h,007h,007h,0f6h,002h,032h,01bh,0cah,0f1h,0c5h,0e5h	; 496c  .:B.......2.....
	defb 0d5h,0cdh,0e8h,04ah,001h,008h,008h,03ah,01bh,0cah,0cdh,067h,047h,0d1h,0e1h,0c1h	; 497c  ...J...:...gG...
	defb 0c9h,0f5h,03ah,042h,0cah,0eeh,001h,007h,007h,0f6h,003h,018h,0ddh,0f5h,03ah,042h	; 498c  ..:B..........:B
	defb 0cah,0a7h,03eh,003h,028h,002h,03eh,007h,018h,0d0h,0c5h,0e5h,0d5h,0cdh,0e8h,04ah	; 499c  ..>.(.>........J
	defb 07dh,0c6h,060h,06fh,001h,008h,008h,03ah,042h,0cah,007h,007h,0f6h,003h,0cdh,067h	; 49ac  }.`o...:B......g
	defb 047h,0d1h,0e1h,0c1h,0c9h	; 49bc

; ======================================================================
; CODIGO 0x49c1..0x4ae0  (287 bytes)
; ======================================================================


L_49C1:
	push bc			;49c1
	push hl			;49c2
	push de			;49c3
	call L_4AE8		;49c4
	ld bc,00808h		;49c7
	ld a,(0ca42h)		;49ca
	rrca			;49cd
	rrca			;49ce
	rrca			;49cf
	rrca			;49d0
	or 0c8h		;49d1
	call L_47ED		;49d3
	pop de			;49d6
	pop hl			;49d7
	pop bc			;49d8
	ret			;49d9
L_49DA:
	push af			;49da
	ld a,(0ca42h)		;49db
	xor 001h		;49de
	rlca			;49e0
	rlca			;49e1
	or 002h		;49e2
L_49E4:
	ld (0ca1bh),a		;49e4
	pop af			;49e7
	push bc			;49e8
	push hl			;49e9
	push de			;49ea
	call L_4AE4		;49eb
	ld bc,00808h		;49ee
	ld a,(0ca1bh)		;49f1
	call L_4767		;49f4
	pop de			;49f7
	pop hl			;49f8
	pop bc			;49f9
	ret			;49fa
L_49FB:
	push af			;49fb
	ld a,00fh		;49fc
	ld (0ca1bh),a		;49fe
	jr L_49E4		;4a01
L_4A03:
	push af			;4a03
	ld a,00bh		;4a04
	ld (0ca1bh),a		;4a06
	jr L_4A6D		;4a09
L_4A0B:
	push af			;4a0b
	ld a,(0ca42h)		;4a0c
	xor 001h		;4a0f
	rlca			;4a11
	rlca			;4a12
	or 002h		;4a13
L_4A15:
	ld (0ca1bh),a		;4a15
	pop af			;4a18
L_4A19:
	push bc			;4a19
	push hl			;4a1a
	push de			;4a1b
	call L_4A36		;4a1c
	ld bc,00808h		;4a1f
	ld a,(0ca1bh)		;4a22
	call L_4767		;4a25
	pop de			;4a28
	pop hl			;4a29
	pop bc			;4a2a
	ret			;4a2b
L_4A2C:
	push af			;4a2c
	ld a,(0ca42h)		;4a2d
	rlca			;4a30
	rlca			;4a31
	or 002h		;4a32
	jr L_4A15		;4a34
L_4A36:
	ld c,000h		;4a36
	ld b,a			;4a38
	and 01fh		;4a39
	add a,a			;4a3b
	add a,a			;4a3c
	add a,a			;4a3d
	ld h,a			;4a3e
	ld a,b			;4a3f
	and 0e0h		;4a40
	rrca			;4a42
	rrca			;4a43
	add a,c			;4a44
	ld l,a			;4a45
	push hl			;4a46
	cp 020h		;4a47
	ld hl,0ca4ch		;4a49
	jr c,L_4A4F		;4a4c
	inc hl			;4a4e
L_4A4F:
	ld a,(hl)			;4a4f
	ld b,a			;4a50
	inc b			;4a51
	add a,a			;4a52
	add a,a			;4a53
	add a,a			;4a54
	add a,a			;4a55
	add a,a			;4a56
	ld c,a			;4a57
	ld a,(0ca75h)		;4a58
L_4A5B:
	rla			;4a5b
	djnz L_4A5B		;4a5c
	ld a,c			;4a5e
	jr nc,L_4A63		;4a5f
	sub 020h		;4a61
L_4A63:
	pop hl			;4a63
	add a,l			;4a64
	ld l,a			;4a65
	ret			;4a66
L_4A67:
	push af			;4a67
	ld a,b			;4a68
	rlca			;4a69
	rlca			;4a6a
	or 002h		;4a6b
L_4A6D:
	ld (0ca1bh),a		;4a6d
	pop af			;4a70
	push bc			;4a71
	push hl			;4a72
	push de			;4a73
	call L_4AD2		;4a74
	ld bc,00808h		;4a77
	ld a,(0ca1bh)		;4a7a
	call L_4767		;4a7d
	pop de			;4a80
	pop hl			;4a81
	pop bc			;4a82
	ret			;4a83
L_4A84:
	push af			;4a84
	ld a,b			;4a85
	rlca			;4a86
	rlca			;4a87
	or 003h		;4a88
	jr L_4A6D		;4a8a
L_4A8C:
	push bc			;4a8c
	push hl			;4a8d
	push de			;4a8e
	call L_4A36		;4a8f
	ld bc,00808h		;4a92
	ld a,(0ca42h)		;4a95
	xor 001h		;4a98
	rlca			;4a9a
	rlca			;4a9b
	rlca			;4a9c
	rlca			;4a9d
	or 088h		;4a9e
	call L_47ED		;4aa0
	pop de			;4aa3
	pop hl			;4aa4
	pop bc			;4aa5
	ret			;4aa6
L_4AA7:
	push af			;4aa7
	ld a,b			;4aa8
	rlca			;4aa9
	rlca			;4aaa
	rlca			;4aab
	rlca			;4aac
	or 080h		;4aad
L_4AAF:
	or 008h		;4aaf
	ld (0ca1bh),a		;4ab1
	pop af			;4ab4
	push bc			;4ab5
	push hl			;4ab6
	push de			;4ab7
	call L_4AD2		;4ab8
	ld bc,00808h		;4abb
	ld a,(0ca1bh)		;4abe
	call L_47ED		;4ac1
	pop de			;4ac4
	pop hl			;4ac5
	pop bc			;4ac6
	ret			;4ac7
L_4AC8:
	push af			;4ac8
	ld a,b			;4ac9
	rlca			;4aca
	rlca			;4acb
	rlca			;4acc
	rlca			;4acd
	or 0c0h		;4ace
	jr L_4AAF		;4ad0
L_4AD2:
	push bc			;4ad2
	push af			;4ad3
	ld a,c			;4ad4
	rrca			;4ad5
	rrca			;4ad6
	and 0c0h		;4ad7
	ld c,a			;4ad9
	pop af			;4ada
	call L_4AEA		;4adb
	pop bc			;4ade
	ret			;4adf

; ----------------------------------------------------------------------
; DATOS sin identificar  0x4ae0..0x4ae4  (4 bytes)
DATA_4AE0:
	defb 00eh,0c0h,018h,006h	; 4ae0

; ======================================================================
; CODIGO 0x4ae4..0x4c6b  (391 bytes)
; ======================================================================


L_4AE4:
	ld c,000h		;4ae4
	jr L_4AEA		;4ae6
L_4AE8:
	ld c,000h		;4ae8
L_4AEA:
	ld b,a			;4aea
	and 01fh		;4aeb
	add a,a			;4aed
	add a,a			;4aee
	add a,a			;4aef
	ld h,a			;4af0
	ld a,b			;4af1
	and 0e0h		;4af2
	rrca			;4af4
	rrca			;4af5
	add a,c			;4af6
	ld l,a			;4af7
	ret			;4af8
L_4AF9:
	ld a,d			;4af9
	add a,008h		;4afa
	ld d,a			;4afc
	ret nz			;4afd
	ld a,e			;4afe
	add a,008h		;4aff
	ld e,a			;4b01
	ret			;4b02
L_4B03:
	push bc			;4b03
	push de			;4b04
	exx			;4b05
	ld hl,0e900h		;4b06
	exx			;4b09
L_4B0A:
	push bc			;4b0a
	call L_4B19		;4b0b
	pop bc			;4b0e
	djnz L_4B0A		;4b0f
	pop de			;4b11
	pop bc			;4b12
	ld hl,0e900h		;4b13
	jp L_4903		;4b16
L_4B19:
	ld b,008h		;4b19
L_4B1B:
	ld e,(hl)			;4b1b
	inc hl			;4b1c
	push bc			;4b1d
	call L_4B25		;4b1e
	pop bc			;4b21
	djnz L_4B1B		;4b22
	ret			;4b24
L_4B25:
	ld b,004h		;4b25
L_4B27:
	xor a			;4b27
	rl e		;4b28
	rla			;4b2a
	exx			;4b2b
	ld e,a			;4b2c
	ld d,0e8h		;4b2d
	ld a,(de)			;4b2f
	add a,a			;4b30
	add a,a			;4b31
	add a,a			;4b32
	add a,a			;4b33
	ld c,a			;4b34
	exx			;4b35
	xor a			;4b36
	rl e		;4b37
	rla			;4b39
	exx			;4b3a
	ld e,a			;4b3b
	ld d,0e8h		;4b3c
	ld a,(de)			;4b3e
	or c			;4b3f
	ld (hl),a			;4b40
	inc hl			;4b41
	exx			;4b42
	djnz L_4B27		;4b43
	ret			;4b45
L_4B46:
	push bc			;4b46
	push de			;4b47
	exx			;4b48
	ld hl,0e900h		;4b49
	exx			;4b4c
L_4B4D:
	push bc			;4b4d
	call L_4B5C		;4b4e
	pop bc			;4b51
	djnz L_4B4D		;4b52
	pop de			;4b54
	pop bc			;4b55
	ld hl,0e900h		;4b56
	jp L_4903		;4b59
L_4B5C:
	ld b,008h		;4b5c
L_4B5E:
	push bc			;4b5e
	call L_4B66		;4b5f
	pop bc			;4b62
	djnz L_4B5E		;4b63
	ret			;4b65
L_4B66:
	ld b,004h		;4b66
	ld e,(hl)			;4b68
	inc hl			;4b69
	ld d,(hl)			;4b6a
	inc hl			;4b6b
L_4B6C:
	xor a			;4b6c
	rl d		;4b6d
	rla			;4b6f
	rl e		;4b70
	rla			;4b72
	exx			;4b73
	ld e,a			;4b74
	ld d,0e8h		;4b75
	ld a,(de)			;4b77
	add a,a			;4b78
	add a,a			;4b79
	add a,a			;4b7a
	add a,a			;4b7b
	ld c,a			;4b7c
	exx			;4b7d
	xor a			;4b7e
	rl d		;4b7f
	rla			;4b81
	rl e		;4b82
	rla			;4b84
	exx			;4b85
	ld e,a			;4b86
	ld d,0e8h		;4b87
	ld a,(de)			;4b89
	or c			;4b8a
	ld (hl),a			;4b8b
	inc hl			;4b8c
	exx			;4b8d
	djnz L_4B6C		;4b8e
	ret			;4b90
L_4B91:
	push bc			;4b91
	push de			;4b92
	exx			;4b93
	ld hl,0e900h		;4b94
	exx			;4b97
L_4B98:
	push bc			;4b98
	call L_4BA7		;4b99
	pop bc			;4b9c
	djnz L_4B98		;4b9d
	pop de			;4b9f
	pop bc			;4ba0
	ld hl,0e900h		;4ba1
	jp L_4903		;4ba4
L_4BA7:
	ld b,008h		;4ba7
L_4BA9:
	push bc			;4ba9
	call L_4BB1		;4baa
	pop bc			;4bad
	djnz L_4BA9		;4bae
	ret			;4bb0
L_4BB1:
	ld b,004h		;4bb1
	ld e,(hl)			;4bb3
	inc hl			;4bb4
	ld d,(hl)			;4bb5
	inc hl			;4bb6
	ld c,(hl)			;4bb7
	inc hl			;4bb8
L_4BB9:
	xor a			;4bb9
	rl c		;4bba
	rla			;4bbc
	rl d		;4bbd
	rla			;4bbf
	rl e		;4bc0
	rla			;4bc2
	exx			;4bc3
	ld e,a			;4bc4
	ld d,0e8h		;4bc5
	ld a,(de)			;4bc7
	add a,a			;4bc8
	add a,a			;4bc9
	add a,a			;4bca
	add a,a			;4bcb
	ld c,a			;4bcc
	exx			;4bcd
	xor a			;4bce
	rl c		;4bcf
	rla			;4bd1
	rl d		;4bd2
	rla			;4bd4
	rl e		;4bd5
	rla			;4bd7
	exx			;4bd8
	ld e,a			;4bd9
	ld d,0e8h		;4bda
	ld a,(de)			;4bdc
	or c			;4bdd
	ld (hl),a			;4bde
	inc hl			;4bdf
	exx			;4be0
	djnz L_4BB9		;4be1
	ret			;4be3
L_4BE4:
	xor a			;4be4
	ld h,a			;4be5
	ld l,a			;4be6
	ld b,a			;4be7
	ld c,a			;4be8
	jp L_46FF		;4be9
L_4BEC:
	ld d,002h		;4bec
	call L_4BE4		;4bee
	call L_4104		;4bf1
	call L_4C0F		;4bf4
	ld c,000h		;4bf7
	call L_4BFF		;4bf9
	jp L_40F0		;4bfc
L_4BFF:
	call L_4C58		;4bff
	ld a,(0ca4ah)		;4c02
	ld hl,06000h		;4c05
	call L_43F6		;4c08
	ld a,c			;4c0b
	jp L_4D5A		;4c0c
L_4C0F:
	call L_4104		;4c0f
	ld a,(0ca4ah)		;4c12
	ld hl,06e4dh		;4c15
	call L_43F6		;4c18
L_4C1B:
	ld a,(hl)			;4c1b
	cp 0ffh		;4c1c
	jp z,L_40F0		;4c1e
	call L_4C26		;4c21
	jr L_4C1B		;4c24
L_4C26:
	push hl			;4c26
	call L_4C65		;4c27
	pop hl			;4c2a
	inc hl			;4c2b
	ld e,(hl)			;4c2c
	inc hl			;4c2d
	ld d,(hl)			;4c2e
	inc hl			;4c2f
	ld c,(hl)			;4c30
	inc hl			;4c31
	ld b,(hl)			;4c32
	inc hl			;4c33
	ld a,(hl)			;4c34
	push hl			;4c35
	ld h,b			;4c36
	ld l,c			;4c37
	call L_4C3E		;4c38
	pop hl			;4c3b
	inc hl			;4c3c
	ret			;4c3d
L_4C3E:
	ld b,a			;4c3e
	rla			;4c3f
	ld c,010h		;4c40
	jr c,L_4C4B		;4c42
	rla			;4c44
	ld c,0f0h		;4c45
	jr c,L_4C4B		;4c47
	ld c,000h		;4c49
L_4C4B:
	ld a,b			;4c4b
	and 03fh		;4c4c
	add a,a			;4c4e
	add a,a			;4c4f
	add a,a			;4c50
	add a,a			;4c51
	add a,a			;4c52
	add a,c			;4c53
	ld b,a			;4c54
	jp L_4D92		;4c55
L_4C58:
	call L_4104		;4c58
	ld a,(0ca4ah)		;4c5b
	ld b,a			;4c5e
	ld hl,04c77h		;4c5f
	call L_4248		;4c62
L_4C65:
	ld hl,04c6bh		;4c65
	call L_424D		;4c68

; ----------------------------------------------------------------------
; DATOS sin identificar  0x4c6b..0x4c8b  (32 bytes)
DATA_4C6B:
	defb 004h,041h,009h,041h,05dh,041h,062h,041h,067h,041h,06ch,041h,000h,002h,002h,003h	; 4c6b  .A.A]AbAgAlA....
	defb 003h,004h,004h,004h,005h,000h,000h,003h,003h,003h,003h,003h,003h,004h,000h,005h	; 4c7b  ................

; ======================================================================
; CODIGO 0x4c8b..0x4c91  (6 bytes)
; ======================================================================


L_4C8B:
	call L_4C97		;4c8b
	jp L_41C2		;4c8e

; ----------------------------------------------------------------------
; DATOS sin identificar  0x4c91..0x4c97  (6 bytes)
DATA_4C91:
	defb 0cdh,097h,04ch,0c3h,0cah,041h	; 4c91

; ======================================================================
; CODIGO 0x4c97..0x4d3a  (163 bytes)
; ======================================================================


L_4C97:
	call L_4C58		;4c97
	ld hl,0ae19h		;4c9a
	ld de,06648h		;4c9d
	call L_4D56		;4ca0
	jp L_41C2		;4ca3
L_4CA6:
	call L_4104		;4ca6
	call L_4167		;4ca9
	ld hl,0a34bh		;4cac
	ld de,0649ch		;4caf
	call L_4D4E		;4cb2
	jp L_4176		;4cb5
L_4CB8:
	ld a,(0ca77h)		;4cb8
	and a			;4cbb
	jp nz,08578h		;4cbc
	ld a,(0ca4ah)		;4cbf
	ld c,a			;4cc2
	ld a,(0ca4bh)		;4cc3
	ld b,a			;4cc6
	ld a,c			;4cc7
	cp 004h		;4cc8
	jr nz,L_4CCC		;4cca
L_4CCC:
	ld a,(0ca4ah)		;4ccc
	cp 00ah		;4ccf
	jr nz,L_4CDB		;4cd1
	ld a,(0ca4bh)		;4cd3
	cp 01bh		;4cd6
	jp z,L_4BEC		;4cd8
L_4CDB:
	ld c,001h		;4cdb
	call L_4BFF		;4cdd
	ld hl,000e0h		;4ce0
	ld bc,00808h		;4ce3
	ld d,002h		;4ce6
	xor a			;4ce8
	call L_46FF		;4ce9
	call L_4CF2		;4cec
	jp L_40F0		;4cef
L_4CF2:
	ld a,(0ca4ah)		;4cf2
	ld hl,06e4dh		;4cf5
	call L_43F6		;4cf8
L_4CFB:
	ld a,(hl)			;4cfb
	cp 0ffh		;4cfc
	jp z,L_40F0		;4cfe
	ld d,h			;4d01
	ld e,l			;4d02
	ld a,005h		;4d03
	call L_4248		;4d05
	cp 003h		;4d08
	jr z,L_4D0F		;4d0a
	inc hl			;4d0c
	jr L_4CFB		;4d0d
L_4D0F:
	ex de,hl			;4d0f
	ld a,(hl)			;4d10
	call L_4C26		;4d11
	jr L_4CFB		;4d14
L_4D16:
	call L_4D1C		;4d16
	jp L_41BD		;4d19
L_4D1C:
	call L_4104		;4d1c
	ld de,06112h		;4d1f
	ld hl,07118h		;4d22
	call L_4D56		;4d25
	jp L_40F0		;4d28
L_4D2B:
	call L_4104		;4d2b
	ld de,06112h		;4d2e
	ld hl,070f9h		;4d31
	call L_4D4A		;4d34
	jp L_40F0		;4d37

; ----------------------------------------------------------------------
; DATOS sin identificar  0x4d3a..0x4d3e  (4 bytes)
DATA_4D3A:
	defb 006h,080h,018h,054h	; 4d3a

; ======================================================================
; CODIGO 0x4d3e..0x4d42  (4 bytes)
; ======================================================================


L_4D3E:
	ld b,0a0h		;4d3e
	jr $+82		;4d40

; ----------------------------------------------------------------------
; DATOS sin identificar  0x4d42..0x4d46  (4 bytes)
DATA_4D42:
	defb 006h,0c0h,018h,04ch	; 4d42

; ======================================================================
; CODIGO 0x4d46..0x4f7e  (568 bytes)
; ======================================================================


L_4D46:
	ld b,0e0h		;4d46
	jr L_4D92		;4d48
L_4D4A:
	ld b,000h		;4d4a
	jr L_4D92		;4d4c
L_4D4E:
	ld b,020h		;4d4e
	jr L_4D92		;4d50
L_4D52:
	ld b,040h		;4d52
	jr L_4D92		;4d54
L_4D56:
	ld b,060h		;4d56
	jr L_4D92		;4d58
L_4D5A:
	ld (0d8e0h),a		;4d5a
	ld e,(hl)			;4d5d
	inc hl			;4d5e
	ld d,(hl)			;4d5f
	inc hl			;4d60
	ld bc,00800h		;4d61
L_4D64:
	ld a,(hl)			;4d64
	inc hl			;4d65
	or (hl)			;4d66
	jr z,L_4D8D		;4d67
	dec hl			;4d69
	ld a,c			;4d6a
	cp 006h		;4d6b
	jr nc,L_4D78		;4d6d
	ld a,(0d8e0h)		;4d6f
	and a			;4d72
	jr z,L_4D78		;4d73
	inc hl			;4d75
	jr L_4D8D		;4d76
L_4D78:
	ld a,(hl)			;4d78
	inc hl			;4d79
	push hl			;4d7a
	ld h,(hl)			;4d7b
	ld l,a			;4d7c
	push bc			;4d7d
	push de			;4d7e
	ld a,c			;4d7f
	and 006h		;4d80
	rlca			;4d82
	rlca			;4d83
	rlca			;4d84
	rlca			;4d85
	ld b,a			;4d86
	call L_4D92		;4d87
	pop de			;4d8a
	pop bc			;4d8b
	pop hl			;4d8c
L_4D8D:
	inc hl			;4d8d
	inc c			;4d8e
	djnz L_4D64		;4d8f
	ret			;4d91
L_4D92:
	ld c,000h		;4d92
	ld (0ca46h),bc		;4d94
L_4D98:
	ld a,(hl)			;4d98
	ld c,a			;4d99
	inc a			;4d9a
	ret z			;4d9b
	push de			;4d9c
	inc hl			;4d9d
	ld a,(hl)			;4d9e
	ex de,hl			;4d9f
	call L_43F6		;4da0
	push de			;4da3
	push bc			;4da4
	ld a,c			;4da5
	rlca			;4da6
	rlca			;4da7
	rlca			;4da8
	and 006h		;4da9
	jr nz,L_4DAF		;4dab
	ld a,001h		;4dad
L_4DAF:
	ld b,a			;4daf
	ld de,0e800h		;4db0
L_4DB3:
	ld a,(hl)			;4db3
	rrca			;4db4
	rrca			;4db5
	rrca			;4db6
	rrca			;4db7
	and 00fh		;4db8
	ld (de),a			;4dba
	inc de			;4dbb
	ld a,(hl)			;4dbc
	and 00fh		;4dbd
	ld (de),a			;4dbf
	inc de			;4dc0
	inc hl			;4dc1
	djnz L_4DB3		;4dc2
	pop bc			;4dc4
	pop hl			;4dc5
	inc hl			;4dc6
	push hl			;4dc7
	ld a,(hl)			;4dc8
	ld b,a			;4dc9
	and 0e0h		;4dca
	ld h,000h		;4dcc
	ld l,a			;4dce
	add hl,hl			;4dcf
	add hl,hl			;4dd0
	add hl,hl			;4dd1
	add hl,hl			;4dd2
	add hl,hl			;4dd3
	ld de,(0ca46h)		;4dd4
	add hl,de			;4dd8
	ld a,b			;4dd9
	and 01fh		;4dda
	add a,a			;4ddc
	add a,a			;4ddd
	call L_423E		;4dde
	ex de,hl			;4de1
	pop hl			;4de2
	ld a,c			;4de3
	and 03fh		;4de4
	ld b,a			;4de6
	inc hl			;4de7
	ld a,(hl)			;4de8
	inc hl			;4de9
	push hl			;4dea
	ld h,(hl)			;4deb
	ld l,a			;4dec
	call L_4DF5		;4ded
	pop hl			;4df0
	pop de			;4df1
	inc hl			;4df2
	jr L_4D98		;4df3
L_4DF5:
	ld a,c			;4df5
	rla			;4df6
	jp c,L_4B91		;4df7
	rla			;4dfa
	jp c,L_4B46		;4dfb
	jp L_4B03		;4dfe
L_4E01:
	call L_4109		;4e01
	ld de,06517h		;4e04
	ld hl,0fc00h		;4e07
L_4E0A:
	xor a			;4e0a
	call L_456E		;4e0b
	jp L_41C2		;4e0e
L_4E11:
	call L_4109		;4e11
	ld de,0935dh		;4e14
	ld hl,0ff00h		;4e17
	jr L_4E0A		;4e1a
L_4E1C:
	call L_4E22		;4e1c
	jp L_41C2		;4e1f
L_4E22:
	ld a,(0e1d0h)		;4e22
	or a			;4e25
	ret nz			;4e26
	ld a,(0cb4bh)		;4e27
	or a			;4e2a
	ret nz			;4e2b
	ld a,(0caa0h)		;4e2c
	and a			;4e2f
	jr z,L_4E44		;4e30
	ld a,(0ca4ah)		;4e32
	cp 008h		;4e35
	jr nz,L_4E44		;4e37
	call L_4F18		;4e39
	ld a,(0caa0h)		;4e3c
	cp 002h		;4e3f
	jp nc,L_4EFA		;4e41
L_4E44:
	call L_4109		;4e44
	ld a,(0ca4ah)		;4e47
	ld hl,06000h		;4e4a
	call L_43F6		;4e4d
	ld c,000h		;4e50
L_4E52:
	ld de,00001h		;4e52
	ld b,(hl)			;4e55
	inc b			;4e56
	jr z,L_4E6D		;4e57
	ld a,(0ca4bh)		;4e59
	cp (hl)			;4e5c
	jr z,L_4E63		;4e5d
	inc hl			;4e5f
	inc hl			;4e60
	jr L_4E52		;4e61
L_4E63:
	inc hl			;4e63
	ld c,(hl)			;4e64
	ld a,c			;4e65
	ld hl,060b7h		;4e66
	call L_43F6		;4e69
	ex de,hl			;4e6c
L_4E6D:
	ld a,e			;4e6d
	cp 014h		;4e6e
	jr nz,L_4E7B		;4e70
	ld a,(0d880h)		;4e72
	inc a			;4e75
	jr nz,L_4E7B		;4e76
	ld de,00001h		;4e78
L_4E7B:
	ld a,e			;4e7b
	cp 010h		;4e7c
	jr nz,L_4E89		;4e7e
	ld a,(0d881h)		;4e80
	inc a			;4e83
	jr nz,L_4E89		;4e84
	ld de,00013h		;4e86
L_4E89:
	ld a,e			;4e89
	cp 01ah		;4e8a
	jp z,L_4F05		;4e8c
	push de			;4e8f
	ld a,e			;4e90
	ld de,0fa00h		;4e91
	call L_4F4C		;4e94
	pop de			;4e97
	ld a,e			;4e98
	cp 001h		;4e99
	jr z,L_4EAE		;4e9b
	cp 004h		;4e9d
	jr nz,L_4ED6		;4e9f
	push de			;4ea1
	ld de,0668fh		;4ea2
	ld hl,0ff00h		;4ea5
	call L_4F55		;4ea8
	pop de			;4eab
	jr L_4ED6		;4eac
L_4EAE:
	push de			;4eae
	ld de,06113h		;4eaf
	ld hl,0fb80h		;4eb2
	call L_4F55		;4eb5
	ld c,000h		;4eb8
	ld a,(0ca4ah)		;4eba
	cp 003h		;4ebd
	jr z,L_4ECC		;4ebf
	cp 00ah		;4ec1
	jr nz,L_4ED1		;4ec3
	ld a,(0ca50h)		;4ec5
	cp 004h		;4ec8
	jr c,L_4ED1		;4eca
L_4ECC:
	call L_4F27		;4ecc
	ld c,001h		;4ecf
L_4ED1:
	ld a,c			;4ed1
	ld (0d437h),a		;4ed2
	pop de			;4ed5
L_4ED6:
	ld a,d			;4ed6
	and a			;4ed7
	jr z,L_4EE0		;4ed8
	ld de,0ff80h		;4eda
	call L_4F4C		;4edd
L_4EE0:
	call L_5023		;4ee0
	call L_40F0		;4ee3
	ld a,(0ca4ah)		;4ee6
	cp 00ah		;4ee9
	ret nz			;4eeb
	ld a,(0caa0h)		;4eec
	and a			;4eef
	ret z			;4ef0
	ld a,(0ca4bh)		;4ef1
	cp 005h		;4ef4
	ret nc			;4ef6
L_4EF7:
	call L_4F18		;4ef7
L_4EFA:
	call L_4109		;4efa
	ld de,08a5dh		;4efd
	ld hl,0fa00h		;4f00
	jr L_4F21		;4f03
L_4F05:
	push de			;4f05
	call L_4193		;4f06
	ld de,0b1c3h		;4f09
	ld hl,0fa00h		;4f0c
	call L_4F55		;4f0f
	call L_4109		;4f12
	pop de			;4f15
	jr L_4ED6		;4f16
L_4F18:
	call L_4109		;4f18
	ld de,08c91h		;4f1b
	ld hl,0fd00h		;4f1e
L_4F21:
	call L_4F55		;4f21
	jp L_40F0		;4f24
L_4F27:
	ld de,093e6h		;4f27
	ld hl,0fd00h		;4f2a
	call L_4F55		;4f2d
	ld de,0956fh		;4f30
	ld hl,0fa00h		;4f33
	xor a			;4f36
	call L_456E		;4f37
	ld de,095b0h		;4f3a
	ld hl,0fac0h		;4f3d
	xor a			;4f40
	call L_456E		;4f41
	ld de,095f2h		;4f44
	ld hl,0fc40h		;4f47
	jr L_4F55		;4f4a
L_4F4C:
	and a			;4f4c
	ret z			;4f4d
	ld hl,060dbh		;4f4e
	call L_43F6		;4f51
	ex de,hl			;4f54
L_4F55:
	push ix		;4f55
	xor a			;4f57
	call L_456E		;4f58
	inc de			;4f5b
	push de			;4f5c
	pop ix		;4f5d
	call L_5223		;4f5f
	pop ix		;4f62
	ret			;4f64
L_4F65:
	call L_4109		;4f65
	ld de,06517h		;4f68
	ld hl,0fa00h		;4f6b
	xor a			;4f6e
	call L_456E		;4f6f
	ld de,06113h		;4f72
	ld hl,0fb80h		;4f75
	call L_4F55		;4f78
	jp L_413F		;4f7b

; ----------------------------------------------------------------------
; DATOS sin identificar  0x4f7e..0x4f97  (25 bytes)
DATA_4F7E:
	defb 021h,028h,0dch,001h,057h,000h,018h,006h,021h,070h,0dch,001h,00fh,000h,0f5h,03eh	; 4f7e  !(..W...!p.....>
	defb 0e0h,0cdh,037h,042h,0cdh,097h,04fh,0f1h,0c9h	; 4f8e  ..7B..O..

; ======================================================================
; CODIGO 0x4f97..0x4fe2  (75 bytes)
; ======================================================================


L_4F97:
	ld hl,0da00h		;4f97
	ld de,(0ca0ch)		;4f9a
	ld bc,00280h		;4f9e
	xor a			;4fa1
	jp L_4486		;4fa2
L_4FA5:
	call L_4FAB		;4fa5
	jp L_40F0		;4fa8
L_4FAB:
	ld bc,(0ca4bh)		;4fab
	ld a,(0ca76h)		;4faf
	cp 02ah		;4fb2
	jp z,L_4EF7		;4fb4
	cp 029h		;4fb7
	jr z,$+75		;4fb9
	cp 02dh		;4fbb
	jr z,$+66		;4fbd
	cp 031h		;4fbf
	jr z,$+46		;4fc1
	cp 039h		;4fc3
	jr z,$+53		;4fc5
	cp 018h		;4fc7
	jr nz,L_4FD6		;4fc9
	ld a,(0ca51h)		;4fcb
	cp 007h		;4fce
	jp z,L_4F65		;4fd0
	jp L_4EF7		;4fd3
L_4FD6:
	ld hl,04fe2h		;4fd6
L_4FD9:
	ld b,(hl)			;4fd9
	inc b			;4fda
	ret z			;4fdb
	cp (hl)			;4fdc
	jr z,$+65		;4fdd
	inc hl			;4fdf
	jr L_4FD9		;4fe0

; ----------------------------------------------------------------------
; DATOS sin identificar  0x4fe2..0x4fef  (13 bytes)
DATA_4FE2:
	defb 009h,00fh,010h,013h,014h,015h,026h,02bh,02fh,030h,036h,037h,0ffh	; 4fe2  ......&+/067.

; ======================================================================
; CODIGO 0x4fef..0x5010  (33 bytes)
; ======================================================================


L_4FEF:
	ld de,064dbh		;4fef
	ld hl,0ff80h		;4ff2
	call L_4650		;4ff5
	jr $+75		;4ff8
L_4FFA:
	ld de,07463h		;4ffa
	jr $+64		;4ffd
L_4FFF:
	ld de,0914bh		;4fff
	jr $+59		;5002
L_5004:
	ld a,(0ca4bh)		;5004
	cp 002h		;5007
	jr c,$+21		;5009
	ld de,07ad8h		;500b
	jr $+47		;500e

; ----------------------------------------------------------------------
; DATOS sin identificar  0x5010..0x5019  (9 bytes)
DATA_5010:
	defb 011h,062h,077h,0cdh,03dh,050h,0c3h,03fh,041h	; 5010  .bw.=P.?A

; ======================================================================
; CODIGO 0x5019..0x504c  (51 bytes)
; ======================================================================


L_5019:
	ld de,08773h		;5019
	jr L_5037		;501c
L_501E:
	ld de,07ec6h		;501e
	jr L_503D		;5021
L_5023:
	ld a,(0d882h)		;5023
	inc a			;5026
	ret z			;5027
	ld a,(0ca4ah)		;5028
	cp 003h		;502b
	ret nz			;502d
	ld a,(0ca4bh)		;502e
	cp 006h		;5031
	ret nz			;5033
	ld de,06a5dh		;5034
L_5037:
	call L_503D		;5037
	jp L_4142		;503a
L_503D:
	call L_4650		;503d
	ld hl,0fa00h		;5040
L_5043:
	call L_4109		;5043
	call L_4F55		;5046
	jp L_40F0		;5049

; ----------------------------------------------------------------------
; DATOS sin identificar  0x504c..0x507a  (46 bytes)
DATA_504C:
	defb 011h,00eh,067h,0cdh,037h,050h,0cdh,009h,041h,0afh,011h,029h,06ah,021h,080h,0ffh	; 504c  ..g.7P..A..)j!..
	defb 0cdh,06eh,045h,0cdh,03fh,041h,0c3h,0f7h,041h,011h,060h,068h,0cdh,037h,050h,0c3h	; 505c  .nE.?A..A.`h.7P.
	defb 0f7h,041h,011h,08dh,085h,021h,080h,0fch,0cdh,043h,050h,0c3h,042h,041h	; 506c  .A...!...CP.BA

; ======================================================================
; CODIGO 0x507a..0x508e  (20 bytes)
; ======================================================================


L_507A:
	push bc			;507a
	ld bc,0030ch		;507b
	jp L_510A		;507e
L_5081:
	push bc			;5081
	ld bc,0020bh		;5082
	jp L_510A		;5085
L_5088:
	push bc			;5088
	ld bc,00002h		;5089
	jr $+126		;508c

; ----------------------------------------------------------------------
; DATOS sin identificar  0x508e..0x5094  (6 bytes)
DATA_508E:
	defb 0c5h,001h,007h,000h,018h,076h	; 508e

; ======================================================================
; CODIGO 0x5094..0x50ac  (24 bytes)
; ======================================================================


L_5094:
	push bc			;5094
	ld bc,00008h		;5095
	jr $+114		;5098
L_509A:
	push bc			;509a
	ld bc,00101h		;509b
	jr $+108		;509e
L_50A0:
	push bc			;50a0
	ld bc,00102h		;50a1
	jr $+102		;50a4
L_50A6:
	push bc			;50a6
	ld bc,00105h		;50a7
	jr $+96		;50aa

; ----------------------------------------------------------------------
; DATOS sin identificar  0x50ac..0x50c4  (24 bytes)
DATA_50AC:
	defb 0c5h,001h,006h,001h,018h,058h,0c5h,001h,007h,001h,018h,052h,0c5h,001h,008h,001h	; 50ac  .....X.....R....
	defb 018h,04ch,0c5h,001h,009h,001h,018h,046h	; 50bc  .L.....F

; ======================================================================
; CODIGO 0x50c4..0x50ca  (6 bytes)
; ======================================================================


L_50C4:
	push bc			;50c4
	ld bc,0010ah		;50c5
	jr $+66		;50c8

; ----------------------------------------------------------------------
; DATOS sin identificar  0x50ca..0x50d6  (12 bytes)
DATA_50CA:
	defb 0c5h,001h,000h,002h,018h,03ah,0c5h,001h,001h,002h,018h,034h	; 50ca  .....:.....4

; ======================================================================
; CODIGO 0x50d6..0x50dc  (6 bytes)
; ======================================================================


L_50D6:
	push bc			;50d6
	ld bc,00202h		;50d7
	jr $+48		;50da

; ----------------------------------------------------------------------
; DATOS sin identificar  0x50dc..0x50e2  (6 bytes)
DATA_50DC:
	defb 0c5h,001h,005h,002h,018h,028h	; 50dc

; ======================================================================
; CODIGO 0x50e2..0x50ee  (12 bytes)
; ======================================================================


L_50E2:
	push bc			;50e2
	ld bc,00207h		;50e3
	jr $+36		;50e6
L_50E8:
	push bc			;50e8
	ld bc,00302h		;50e9
	jr $+30		;50ec

; ----------------------------------------------------------------------
; DATOS sin identificar  0x50ee..0x50f4  (6 bytes)
DATA_50EE:
	defb 0c5h,001h,003h,003h,018h,016h	; 50ee

; ======================================================================
; CODIGO 0x50f4..0x51b8  (196 bytes)
; ======================================================================


L_50F4:
	push bc			;50f4
	ld bc,00304h		;50f5
	jr L_510A		;50f8
L_50FA:
	push bc			;50fa
	ld bc,00305h		;50fb
	jr L_510A		;50fe
L_5100:
	push bc			;5100
	ld bc,00307h		;5101
	jr L_510A		;5104
L_5106:
	push bc			;5106
	ld bc,00308h		;5107
L_510A:
	ld (0ca48h),bc		;510a
	pop bc			;510e
L_510F:
	push bc			;510f
	push de			;5110
	ld b,c			;5111
L_5112:
	ld a,(hl)			;5112
	push hl			;5113
	push bc			;5114
	push de			;5115
	call L_512C		;5116
	pop de			;5119
	pop bc			;511a
	pop hl			;511b
	ld a,d			;511c
	add a,008h		;511d
	ld d,a			;511f
	inc hl			;5120
	djnz L_5112		;5121
	pop de			;5123
	ld a,e			;5124
	add a,008h		;5125
	ld e,a			;5127
	pop bc			;5128
	djnz L_510F		;5129
	ret			;512b
L_512C:
	push af			;512c
	ld bc,(0ca48h)		;512d
	ld a,c			;5131
	ld c,b			;5132
	dec a			;5133
	jr z,L_5164		;5134
	dec a			;5136
	jr z,L_5174		;5137
	dec a			;5139
	jr z,L_517B		;513a
	dec a			;513c
	jr z,L_5181		;513d
	dec a			;513f
	jr z,L_5187		;5140
	dec a			;5142
	jr z,L_518E		;5143
	dec a			;5145
	jr z,L_5195		;5146
	dec a			;5148
	jr z,L_519C		;5149
	dec a			;514b
	jr z,L_51A3		;514c
	dec a			;514e
	jr z,L_51AA		;514f
	dec a			;5151
	jr z,L_51B1		;5152
	pop af			;5154
	ld b,000h		;5155
	push de			;5157
	push bc			;5158
	push af			;5159
	call L_4AC8		;515a
	pop af			;515d
	pop bc			;515e
	pop de			;515f
	inc b			;5160
	jp L_4AC8		;5161
L_5164:
	pop af			;5164
	ld b,000h		;5165
	push de			;5167
	push bc			;5168
	push af			;5169
	call L_4A84		;516a
	pop af			;516d
	pop bc			;516e
	pop de			;516f
	inc b			;5170
	jp L_4A84		;5171
L_5174:
	call L_51BE		;5174
	pop af			;5177
	jp L_4A67		;5178
L_517B:
	pop af			;517b
	ld b,000h		;517c
	jp L_4A67		;517e
L_5181:
	pop af			;5181
	ld b,003h		;5182
	jp L_4A84		;5184
L_5187:
	call L_51C3		;5187
	pop af			;518a
	jp L_4A67		;518b
L_518E:
	call L_51C3		;518e
	pop af			;5191
	jp L_4A84		;5192
L_5195:
	call L_51C3		;5195
	pop af			;5198
	jp L_4AA7		;5199
L_519C:
	call L_51BE		;519c
	pop af			;519f
	jp L_4AA7		;51a0
L_51A3:
	call L_51C3		;51a3
	pop af			;51a6
	jp L_4AC8		;51a7
L_51AA:
	call L_51BE		;51aa
	pop af			;51ad
	jp L_4AC8		;51ae
L_51B1:
	call L_51BE		;51b1
	pop af			;51b4
	jp L_4A03		;51b5

; ----------------------------------------------------------------------
; DATOS sin identificar  0x51b8..0x51be  (6 bytes)
DATA_51B8:
	defb 0f1h,006h,000h,0c3h,084h,04ah	; 51b8

; ======================================================================
; CODIGO 0x51be..0x5456  (664 bytes)
; ======================================================================


L_51BE:
	ld a,(0ca42h)		;51be
	ld b,a			;51c1
	ret			;51c2
L_51C3:
	ld a,(0ca42h)		;51c3
	xor 001h		;51c6
	ld b,a			;51c8
	ret			;51c9
L_51CA:
	call L_418E		;51ca
	ld a,(0ca4ah)		;51cd
	ld hl,0b747h		;51d0
	call L_43F6		;51d3
	ex de,hl			;51d6
	ld hl,0e740h		;51d7
	call L_51E0		;51da
	jp L_40F0		;51dd
L_51E0:
	ld c,000h		;51e0
L_51E2:
	ld a,(de)			;51e2
	and a			;51e3
	ret z			;51e4
	inc de			;51e5
	ld b,a			;51e6
	and 07fh		;51e7
	cp b			;51e9
	jr z,L_51F5		;51ea
	ld b,a			;51ec
L_51ED:
	ld a,(de)			;51ed
	ld (hl),a			;51ee
	inc de			;51ef
	inc hl			;51f0
	djnz L_51ED		;51f1
	jr L_51E2		;51f3
L_51F5:
	ld a,(de)			;51f5
	inc de			;51f6
L_51F7:
	ld (hl),a			;51f7
	inc hl			;51f8
	djnz L_51F7		;51f9
	jr L_51E2		;51fb
L_51FD:
	call L_4171		;51fd
	push af			;5200
	ld hl,0a7b1h		;5201
	call L_43F6		;5204
	ld de,04838h		;5207
	ld bc,00106h		;520a
	call L_50E8		;520d
	pop af			;5210
	ld hl,0a7c5h		;5211
	call L_43F6		;5214
	ld de,04840h		;5217
	ld bc,00102h		;521a
	call L_50E8		;521d
	jp L_41C2		;5220
L_5223:
	ld a,(ix+000h)		;5223
	and a			;5226
	ret z			;5227
	dec a			;5228
	push af			;5229
	call z,L_5238		;522a
	pop af			;522d
	call nz,L_52AB		;522e
	ld bc,00004h		;5231
	add ix,bc		;5234
	jr L_5223		;5236
L_5238:
	ld a,(ix+001h)		;5238
	or a			;523b
	ret z			;523c
	ld (0d8f0h),a		;523d
	ld l,(ix+002h)		;5240
	ld h,000h		;5243
	add hl,hl			;5245
	add hl,hl			;5246
	add hl,hl			;5247
	ld bc,0f800h		;5248
	add hl,bc			;524b
	ld (0d8f2h),hl		;524c
	ld l,(ix+003h)		;524f
	ld h,000h		;5252
	add hl,hl			;5254
	add hl,hl			;5255
	add hl,hl			;5256
	add hl,bc			;5257
	ld (0d8f4h),hl		;5258
L_525B:
	ld hl,(0d8f2h)		;525b
	ld de,0e780h		;525e
	ld bc,00020h		;5261
	xor a			;5264
	call L_4468		;5265
	call L_5291		;5268
	ld de,(0d8f4h)		;526b
	ld hl,0e7a0h		;526f
	ld bc,00020h		;5272
	xor a			;5275
	call L_4486		;5276
	ld bc,00020h		;5279
	ld hl,(0d8f2h)		;527c
	add hl,bc			;527f
	ld (0d8f2h),hl		;5280
	ld hl,(0d8f4h)		;5283
	add hl,bc			;5286
	ld (0d8f4h),hl		;5287
	ld hl,0d8f0h		;528a
	dec (hl)			;528d
	jr nz,L_525B		;528e
	ret			;5290
L_5291:
	ld hl,0e780h		;5291
	ld de,0e7afh		;5294
	ld b,010h		;5297
	call L_52A4		;5299
	ld hl,0e790h		;529c
	ld de,0e7bfh		;529f
	ld b,010h		;52a2
L_52A4:
	ld a,(hl)			;52a4
	ld (de),a			;52a5
	inc hl			;52a6
	dec de			;52a7
	djnz L_52A4		;52a8
	ret			;52aa
L_52AB:
	ld a,(ix+001h)		;52ab
	or a			;52ae
	ret z			;52af
	ld l,(ix+003h)		;52b0
	ld h,000h		;52b3
	add hl,hl			;52b5
	add hl,hl			;52b6
	add hl,hl			;52b7
	ld bc,0f810h		;52b8
	add hl,bc			;52bb
	ex de,hl			;52bc
	ld l,(ix+002h)		;52bd
	ld h,000h		;52c0
	add hl,hl			;52c2
	add hl,hl			;52c3
	add hl,hl			;52c4
	ld bc,0f800h		;52c5
	add hl,bc			;52c8
	ld c,(ix+001h)		;52c9
	jp L_457A		;52cc
L_52CF:
	xor a			;52cf
	jr L_52D4		;52d0
L_52D2:
	ld a,001h		;52d2
L_52D4:
	ld (0d440h),a		;52d4
	ld a,(0d8a4h)		;52d7
	and a			;52da
	jp nz,L_54B4		;52db
	ld a,(0d433h)		;52de
	and a			;52e1
	jr nz,L_52F0		;52e2
	call 07bf1h		;52e4
	cp 080h		;52e7
	jr c,L_52F0		;52e9
	call L_5A25		;52eb
	jr L_5310		;52ee
L_52F0:
	ld a,(0d430h)		;52f0
	cp 002h		;52f3
	jr z,L_5310		;52f5
	ld a,(0ca4ah)		;52f7
	cp 007h		;52fa
	jr nz,L_5310		;52fc
	ld bc,(0ca50h)		;52fe
	ld a,c			;5302
	dec a			;5303
	cp 004h		;5304
	jr nc,L_5310		;5306
	ld a,b			;5308
	sub 005h		;5309
	cp 003h		;530b
	jp c,L_551D		;530d
L_5310:
	call 07c52h		;5310
	call 0839fh		;5313
	call 083c6h		;5316
	call 0823ch		;5319
	call L_5726		;531c
	xor a			;531f
	ld (0dff8h),a		;5320
	call L_40F0		;5323
	call 07df4h		;5326
	call 08415h		;5329
	call 08281h		;532c
	call 0b1a3h		;532f
	call 08894h		;5332
	call 08290h		;5335
	call 083dch		;5338
	call 0836ch		;533b
	call L_4188		;533e
	call 0685ah		;5341
	call 069cch		;5344
	call L_5FBF		;5347
	call L_413F		;534a
	call 0bcf5h		;534d
	call L_41BD		;5350
	call 0ae7bh		;5353
	call L_40F0		;5356
	call L_5488		;5359
	call L_45F6		;535c
	call 0861bh		;535f
	call L_4E22		;5362
	call 08475h		;5365
	call L_41B5		;5368
	call 0a0e6h		;536b
	call L_40F0		;536e
	call L_5437		;5371
	call 0ba53h		;5374
	call 08b47h		;5377
	call L_4609		;537a
	call L_5777		;537d
	ld a,(0cabah)		;5380
	and a			;5383
	call z,L_54A4		;5384
	call L_4142		;5387
	call 0917ch		;538a
	call 088b7h		;538d
	call L_41CA		;5390
	call 0a0d3h		;5393
	call 0a000h		;5396
	call 0a477h		;5399
	call L_40F0		;539c
	call 0b4d1h		;539f
	call L_41CD		;53a2
	call 0a82fh		;53a5
	call L_419D		;53a8
	call 0ac26h		;53ab
	call L_41D5		;53ae
	call 0a601h		;53b1
	call L_40F0		;53b4
	call 0b108h		;53b7
	call 08fdfh		;53ba
	call L_41EF		;53bd
	call 0b4b9h		;53c0
	call 0b6c3h		;53c3
	call L_41F4		;53c6
	call 0bcb4h		;53c9
	call L_40F0		;53cc
	call 08b07h		;53cf
	call L_53FF		;53d2
	ld a,(0ca5fh)		;53d5
	and a			;53d8
	ld b,000h		;53d9
	jr z,L_53DF		;53db
	ld b,002h		;53dd
L_53DF:
	ld hl,0d41ah		;53df
	ld a,(hl)			;53e2
	cp 001h		;53e3
	jr nz,L_53E8		;53e5
	ld b,a			;53e7
L_53E8:
	ld (hl),b			;53e8
	ld a,b			;53e9
	ld (0d41fh),a		;53ea
	call L_4142		;53ed
	call 0818bh		;53f0
	call L_41CA		;53f3
	call 0be6dh		;53f6
	call 0bc1eh		;53f9
	jp L_40F0		;53fc
L_53FF:
	ld a,(0cb03h)		;53ff
	call 08220h		;5402
	ld d,b			;5405
	ld a,(0cb05h)		;5406
	call 0822eh		;5409
	ld e,b			;540c
	ld a,(0d440h)		;540d
	and a			;5410
	ld a,(0cb0eh)		;5411
	ld (0d4f4h),a		;5414
	jr nz,L_5421		;5417
	ld hl,0d418h		;5419
	ld (0d41eh),a		;541c
	jr L_5427		;541f
L_5421:
	ld hl,0d447h		;5421
	ld (0d449h),a		;5424
L_5427:
	ld (hl),d			;5427
	inc hl			;5428
	ld (hl),e			;5429
	ret			;542a
L_542B:
	call L_45F6		;542b
	call L_4266		;542e
	call L_45D7		;5431
	jp L_4609		;5434
L_5437:
	call L_542B		;5437
	ld hl,0ca42h		;543a
	ld a,(hl)			;543d
	xor 001h		;543e
	ld (hl),a			;5440
	jp L_4879		;5441
L_5444:
	call L_410E		;5444
	ld a,(0ca4ah)		;5447
	ld hl,0545ch		;544a
	call L_4248		;544d
	and a			;5450
	ret z			;5451
	dec a			;5452
	call L_424D		;5453

; ----------------------------------------------------------------------
; DATOS sin identificar  0x5456..0x5470  (26 bytes)
DATA_5456:
	defb 013h,041h,018h,041h,00bh,042h,000h,001h,000h,002h,001h,002h,002h,000h,003h,000h	; 5456  .A.A.B..........
	defb 000h,003h,002h,002h,002h,002h,002h,000h,001h,003h	; 5466  ..........

; ======================================================================
; CODIGO 0x5470..0x5476  (6 bytes)
; ======================================================================


L_5470:
	call L_5488		;5470
	jp L_41AD		;5473

; ----------------------------------------------------------------------
; DATOS sin identificar  0x5476..0x547c  (6 bytes)
DATA_5476:
	defb 0cdh,088h,054h,0c3h,03fh,041h	; 5476

; ======================================================================
; CODIGO 0x547c..0x5482  (6 bytes)
; ======================================================================


L_547C:
	call L_54A4		;547c
	jp L_41AD		;547f

; ----------------------------------------------------------------------
; DATOS sin identificar  0x5482..0x5488  (6 bytes)
DATA_5482:
	defb 0cdh,0a4h,054h,0c3h,03fh,041h	; 5482

; ======================================================================
; CODIGO 0x5488..0x54de  (86 bytes)
; ======================================================================


L_5488:
	ld a,(0ca5fh)		;5488
	and a			;548b
	jr nz,L_549B		;548c
	ld a,(0cabah)		;548e
	and a			;5491
	call z,L_4365		;5492
	call L_5FA0		;5495
	jp L_5F68		;5498
L_549B:
	call L_5FAF		;549b
	call L_5F68		;549e
	jp L_54EA		;54a1
L_54A4:
	ld a,(0ca5fh)		;54a4
	and a			;54a7
	jp z,L_438A		;54a8
	call L_4365		;54ab
	call L_5FAF		;54ae
	jp L_5F68		;54b1
L_54B4:
	call 07bf1h		;54b4
	call 0823ch		;54b7
	call L_5726		;54ba
	call L_40F0		;54bd
	call 0836ch		;54c0
	call L_576E		;54c3
	call L_45F6		;54c6
	call L_4E22		;54c9
	call 08475h		;54cc
	call L_5437		;54cf
	call L_4609		;54d2
	call L_4142		;54d5
	call 088b7h		;54d8
	jp L_40F0		;54db

; ----------------------------------------------------------------------
; DATOS sin identificar  0x54de..0x54ea  (12 bytes)
DATA_54DE:
	defb 0cdh,0eah,054h,0c3h,0b0h,041h,0cdh,0eah,054h,0c3h,0b0h,041h	; 54de  ..T..A..T..A

; ======================================================================
; CODIGO 0x54ea..0x56ef  (517 bytes)
; ======================================================================


L_54EA:
	ld hl,0ca42h		;54ea
	ld a,(hl)			;54ed
	push hl			;54ee
	push af			;54ef
	xor 001h		;54f0
	ld (hl),a			;54f2
	call L_54FA		;54f3
	pop af			;54f6
	pop hl			;54f7
	ld (hl),a			;54f8
	ret			;54f9
L_54FA:
	ld a,(0ca5fh)		;54fa
	and a			;54fd
	ret z			;54fe
	exx			;54ff
	ld a,(0ca42h)		;5500
	ld d,a			;5503
	ld a,0ffh		;5504
	ld hl,0c417h		;5506
	ld bc,03838h		;5509
	call L_46FF		;550c
	call L_4142		;550f
	call 0984ch		;5512
	call 098fbh		;5515
	call L_40F0		;5518
	exx			;551b
	ret			;551c
L_551D:
	ld a,(0d433h)		;551d
	and a			;5520
	jp nz,L_55B6		;5521
	ld hl,0d431h		;5524
	ld a,(hl)			;5527
	and a			;5528
	jr z,L_5560		;5529
	inc hl			;552b
	ld a,(0ca41h)		;552c
	cp (hl)			;552f
	jr nz,L_5560		;5530
	ld a,(0ca50h)		;5532
	cp 004h		;5535
	jr c,L_555A		;5537
	ld a,002h		;5539
	ld (0d430h),a		;553b
	push hl			;553e
	ld hl,0d7d1h		;553f
	set 4,(hl)		;5542
	res 3,(hl)		;5544
	ld a,001h		;5546
	ld (0d4e3h),a		;5548
	ld hl,06b85h		;554b
	ld (0ca19h),hl		;554e
	ld a,0b4h		;5551
	ld (0ca18h),a		;5553
	call 06be4h		;5556
	pop hl			;5559
L_555A:
	dec hl			;555a
	ld (hl),000h		;555b
	jp L_5310		;555d
L_5560:
	ld a,(0d433h)		;5560
	and a			;5563
	jr nz,L_5570		;5564
	ld hl,0d430h		;5566
	ld a,(hl)			;5569
	and a			;556a
	ld (hl),000h		;556b
	call nz,07c77h		;556d
L_5570:
	xor a			;5570
	ld (0d300h),a		;5571
	inc a			;5574
	ld (0d433h),a		;5575
	ld hl,0cc00h		;5578
	ld bc,0007fh		;557b
	call L_4236		;557e
	call L_55A0		;5581
	call 08281h		;5584
	call L_5444		;5587
	ld de,09ee4h		;558a
	ld hl,07af8h		;558d
L_5590:
	ld (0ca44h),de		;5590
	call L_58DD		;5594
	call L_57AE		;5597
	call L_40F0		;559a
	jp L_5437		;559d
L_55A0:
	ld a,(0cb0eh)		;55a0
	cp 003h		;55a3
	ld a,088h		;55a5
	jr c,L_55AD		;55a7
	ld (0cb03h),a		;55a9
	ret			;55ac
L_55AD:
	ld (0cb05h),a		;55ad
	ret			;55b0
L_55B1:
	call L_410E		;55b1
	jr L_5590		;55b4
L_55B6:
	ld a,(0ca41h)		;55b6
	sub 002h		;55b9
	cp 002h		;55bb
	jr nc,L_5560		;55bd
	xor a			;55bf
	ld (0d433h),a		;55c0
	ld (0ca4bh),a		;55c3
	ld hl,00501h		;55c6
	ld (0ca50h),hl		;55c9
	jp L_5310		;55cc
L_55CF:
	xor a			;55cf
	jr L_55D4		;55d0
L_55D2:
	ld a,001h		;55d2
L_55D4:
	ld (0d440h),a		;55d4
	call 07bf1h		;55d7
L_55DA:
	call L_5488		;55da
	call 0823ch		;55dd
	call L_565F		;55e0
	ld (0ca4ch),hl		;55e3
	call L_5694		;55e6
	call L_576E		;55e9
	xor a			;55ec
	ld (0dff8h),a		;55ed
	call 07df4h		;55f0
	call 08415h		;55f3
	call L_45F6		;55f6
	call L_4FA5		;55f9
	call L_5F68		;55fc
	call 08281h		;55ff
	call 0836ch		;5602
	call 08475h		;5605
	call L_41B5		;5608
	call 0a0e6h		;560b
	call L_40F0		;560e
	call L_5437		;5611
	call L_54A4		;5614
	call 0ba53h		;5617
	call 08b47h		;561a
	call L_4609		;561d
	call 0b4d1h		;5620
	call L_41CD		;5623
	call 0a0d3h		;5626
	call 0a000h		;5629
	call 0a82fh		;562c
	call L_41D2		;562f
	call 0a601h		;5632
	call L_40F0		;5635
	call 0b108h		;5638
	call L_41EF		;563b
	call 0b6c3h		;563e
	call L_4142		;5641
	call 0917ch		;5644
	call 0818bh		;5647
	call L_41BD		;564a
	call 0a7dah		;564d
	call L_41CA		;5650
	call 0be6dh		;5653
	call L_40F0		;5656
	call L_53FF		;5659
	jp 09043h		;565c
L_565F:
	call L_418E		;565f
	call L_5668		;5662
	jp L_40F0		;5665
L_5668:
	ld a,(0ca76h)		;5668
	ld c,a			;566b
	ld hl,0be63h		;566c
	call L_4248		;566f
	ld b,a			;5672
	rrca			;5673
	rrca			;5674
	rrca			;5675
	rrca			;5676
	and 00fh		;5677
	ld l,a			;5679
	ld a,b			;567a
	and 00fh		;567b
	ld h,a			;567d
	ld a,(0ca50h)		;567e
	cp 002h		;5681
	ret nz			;5683
	ld a,c			;5684
	cp 00fh		;5685
	jr z,L_5690		;5687
	cp 039h		;5689
	ret nz			;568b
	ld hl,00504h		;568c
	ret			;568f
L_5690:
	ld hl,00100h		;5690
	ret			;5693
L_5694:
	ld a,(0ca4bh)		;5694
	ld b,a			;5697
	call L_569E		;5698
	jp L_57AE		;569b
L_569E:
	call L_5444		;569e
	push bc			;56a1
	call L_56BB		;56a2
	pop bc			;56a5
	ld (0ca44h),hl		;56a6
	ld l,b			;56a9
	ld h,000h		;56aa
	add hl,hl			;56ac
	add hl,hl			;56ad
	ld d,h			;56ae
	ld e,l			;56af
	add hl,hl			;56b0
	add hl,hl			;56b1
	add hl,hl			;56b2
	add hl,de			;56b3
	ld de,0e780h		;56b4
	add hl,de			;56b7
	jp L_58DD		;56b8
L_56BB:
	ld a,(0ca76h)		;56bb
	ld hl,064b6h		;56be
	call L_43F6		;56c1
	ld de,0e780h		;56c4
	ex de,hl			;56c7
	call L_51E0		;56c8
	ld a,(0ca4ah)		;56cb
	ld b,a			;56ce
	cp 004h		;56cf
	jr z,L_56DA		;56d1
L_56D3:
	ld a,b			;56d3
	ld hl,056efh		;56d4
	jp L_43F6		;56d7
L_56DA:
	ld a,(0ca76h)		;56da
	cp 00fh		;56dd
	jr z,L_56EB		;56df
	cp 010h		;56e1
	jr z,L_56EB		;56e3
	sub 012h		;56e5
	cp 003h		;56e7
	jr nc,L_56D3		;56e9
L_56EB:
	ld hl,089f9h		;56eb
	ret			;56ee

; ----------------------------------------------------------------------
; DATOS sin identificar  0x56ef..0x5726  (55 bytes)
DATA_56EF:
	defb 0eeh,056h,0a9h,0b0h,051h,06bh,005h,08eh,009h,099h,051h,06bh,055h,0a6h,051h,06bh	; 56ef  .V..Qk....QkU.Qk
	defb 0eeh,056h,0eeh,056h,0c4h,0b9h,080h,0abh,005h,08eh,005h,08eh,0eeh,056h,0eeh,056h	; 56ff  .V.V.........V.V
	defb 0eeh,056h,0eeh,056h,0b9h,0b3h,030h,0b3h,0cdh,0f0h,040h,0cdh,076h,042h,0cdh,09dh	; 570f  .V.V..0...@.vB..
	defb 058h,0cdh,0e5h,057h,0c3h,03fh,041h	; 571f

; ======================================================================
; CODIGO 0x5726..0x591d  (503 bytes)
; ======================================================================


L_5726:
	ld a,(0ca4bh)		;5726
	ld b,a			;5729
	call L_589D		;572a
	ld a,(0ca4ah)		;572d
	cp 012h		;5730
	jr nz,L_576B		;5732
	ld a,(0d888h)		;5734
	inc a			;5737
	jr z,L_5741		;5738
	ld a,(0ca4bh)		;573a
	cp 002h		;573d
	jr z,L_575A		;573f
L_5741:
	ld a,(0d881h)		;5741
	inc a			;5744
	jr z,L_576B		;5745
	ld a,(0ca4bh)		;5747
	cp 008h		;574a
	jr z,L_5762		;574c
	cp 003h		;574e
	jr nz,L_576B		;5750
	ld hl,0caaeh		;5752
	ld a,(hl)			;5755
	and a			;5756
	jr nz,L_576B		;5757
	inc (hl)			;5759
L_575A:
	ld a,(0ca42h)		;575a
	xor 001h		;575d
	jp L_4452		;575f
L_5762:
	call L_4142		;5762
	call 089a8h		;5765
	jp L_40F0		;5768
L_576B:
	call L_57AE		;576b
L_576E:
	call L_41F7		;576e
	call 0a005h		;5771
	jp L_40F0		;5774
L_5777:
	ld a,(0ca4ah)		;5777
	cp 012h		;577a
	ret nz			;577c
	ld a,(0ca4bh)		;577d
	ld b,a			;5780
	cp 002h		;5781
	jr z,L_578F		;5783
	cp 003h		;5785
	ret nz			;5787
	ld a,(0d881h)		;5788
	inc a			;578b
	ret z			;578c
	jr L_5794		;578d
L_578F:
	ld a,(0d888h)		;578f
	inc a			;5792
	ret z			;5793
L_5794:
	call L_589D		;5794
	call L_57AE		;5797
	call L_576E		;579a
	ld a,(0ca4bh)		;579d
	cp 002h		;57a0
	ret nz			;57a2
	ld hl,04050h		;57a3
	ld d,h			;57a6
	ld e,l			;57a7
	ld bc,04020h		;57a8
	jp L_475A		;57ab
L_57AE:
	ld c,000h		;57ae
L_57B0:
	xor a			;57b0
	ld (0d458h),a		;57b1
	ld (0ca28h),a		;57b4
	ld (0d446h),a		;57b7
	ld hl,0dd00h		;57ba
	ld de,00000h		;57bd
	ld b,018h		;57c0
L_57C2:
	push bc			;57c2
	ld b,018h		;57c3
	push de			;57c5
L_57C6:
	push bc			;57c6
	ld a,(hl)			;57c7
	rr c		;57c8
	jr c,L_57D1		;57ca
	call L_4A0B		;57cc
	jr L_57D4		;57cf
L_57D1:
	call L_4A2C		;57d1
L_57D4:
	inc hl			;57d4
	ld a,d			;57d5
	add a,008h		;57d6
	ld d,a			;57d8
	pop bc			;57d9
	djnz L_57C6		;57da
	pop de			;57dc
	pop bc			;57dd
	ld a,e			;57de
	add a,008h		;57df
	ld e,a			;57e1
	djnz L_57C2		;57e2
	ret			;57e4
L_57E5:
	ld c,001h		;57e5
	jr L_57B0		;57e7
L_57E9:
	call 07baah		;57e9
	ld bc,(0ca50h)		;57ec
	jr L_57FE		;57f0
L_57F2:
	push bc			;57f2
	ld (0ca50h),bc		;57f3
	call 07c0eh		;57f7
	call 07baah		;57fa
	pop bc			;57fd
L_57FE:
	call 07bf5h		;57fe
	push af			;5801
	call L_5444		;5802
	pop bc			;5805
	push bc			;5806
	call L_588C		;5807
	call L_57E5		;580a
	call L_40F0		;580d
	call L_4266		;5810
	call L_5882		;5813
	call 08475h		;5816
	pop bc			;5819
	ld a,(0ca4bh)		;581a
	push af			;581d
	ld a,b			;581e
	ld (0ca4bh),a		;581f
	call L_5878		;5822
	pop af			;5825
	ld (0ca4bh),a		;5826
	call 08b50h		;5829
	ld a,(0ca76h)		;582c
	or a			;582f
	call nz,08b47h		;5830
	ld hl,0ca42h		;5833
	ld a,(hl)			;5836
	push hl			;5837
	push af			;5838
	xor 001h		;5839
	ld (hl),a			;583b
	call L_5FA0		;583c
	call L_41F7		;583f
	call 0a000h		;5842
	call L_4188		;5845
	call L_5FBF		;5848
	call L_413F		;584b
	call 08986h		;584e
	call L_41B5		;5851
	call 0ae7bh		;5854
	call 0a0e6h		;5857
	call L_40F0		;585a
	call 08290h		;585d
	call 083dch		;5860
	pop af			;5863
	pop hl			;5864
	ld (hl),a			;5865
	call L_41CD		;5866
	call 0be6dh		;5869
	call L_4142		;586c
	call 0818bh		;586f
	call L_40F0		;5872
	jp 07c20h		;5875
L_5878:
	ld a,(0ca76h)		;5878
	or a			;587b
	jp z,08fdfh		;587c
	jp 09043h		;587f
L_5882:
	ld a,(0ca76h)		;5882
	or a			;5885
	jp nz,L_4FA5		;5886
	jp L_4E22		;5889
L_588C:
	ld a,(0ca76h)		;588c
	or a			;588f
	jr z,L_589D		;5890
	push bc			;5892
	call L_565F		;5893
	pop bc			;5896
	ld (0ca4ch),hl		;5897
	jp L_569E		;589a
L_589D:
	call L_418E		;589d
	ld a,(0ca4ah)		;58a0
	ld c,a			;58a3
	ld hl,0bd28h		;58a4
	call L_43F6		;58a7
	ld a,b			;58aa
	call L_4248		;58ab
	rrca			;58ae
	rrca			;58af
	rrca			;58b0
	rrca			;58b1
	and 00fh		;58b2
	ld de,0ca4ch		;58b4
	ld (de),a			;58b7
	ld a,(hl)			;58b8
	and 00fh		;58b9
	inc e			;58bb
	ld (de),a			;58bc
	call L_5444		;58bd
	call L_5998		;58c0
	ex de,hl			;58c3
	ld a,c			;58c4
	ld hl,06000h		;58c5
	call L_43F6		;58c8
	add hl,de			;58cb
	ex de,hl			;58cc
	ld a,c			;58cd
	ld hl,06028h		;58ce
	call L_43F6		;58d1
	ld a,(de)			;58d4
	call L_43F6		;58d5
	ld (0ca44h),hl		;58d8
	ex de,hl			;58db
	inc hl			;58dc
L_58DD:
	ld de,0dd00h		;58dd
	ld a,006h		;58e0
L_58E2:
	ex af,af'			;58e2
	ld b,006h		;58e3
L_58E5:
	ld a,(hl)			;58e5
	push de			;58e6
	exx			;58e7
	ld bc,(0ca44h)		;58e8
	ld h,000h		;58ec
	ld l,a			;58ee
	add hl,hl			;58ef
	add hl,hl			;58f0
	add hl,hl			;58f1
	add hl,hl			;58f2
	add hl,bc			;58f3
	ld bc,004ffh		;58f4
	pop de			;58f7
L_58F8:
	ldi		;58f8
	ldi		;58fa
	ldi		;58fc
	ldi		;58fe
	ld a,014h		;5900
	add a,e			;5902
	ld e,a			;5903
	jr nc,L_5907		;5904
	inc d			;5906
L_5907:
	djnz L_58F8		;5907
	exx			;5909
	inc hl			;590a
	inc e			;590b
	inc e			;590c
	inc e			;590d
	inc de			;590e
	djnz L_58E5		;590f
	ex de,hl			;5911
	ld bc,00048h		;5912
	add hl,bc			;5915
	ex de,hl			;5916
	ex af,af'			;5917
	dec a			;5918
	jp nz,L_58E2		;5919
	ret			;591c

; ----------------------------------------------------------------------
; DATOS sin identificar  0x591d..0x5998  (123 bytes)
DATA_591D:
	defb 021h,0efh,077h,011h,0e4h,09eh,0cdh,078h,059h,0c3h,0b5h,041h,0ddh,04eh,00ah,0ddh	; 591d  !.w....xY..A.N..
	defb 046h,00bh,0cdh,0fch,07bh,06fh,0e5h,0cdh,044h,054h,0cdh,0bbh,056h,022h,044h,0cah	; 592d  F...{o..DT..V"D.
	defb 0e1h,026h,000h,029h,029h,054h,05dh,029h,029h,029h,019h,011h,080h,0e7h,019h,011h	; 593d  .&.))T])))......
	defb 000h,0e5h,0cdh,0e0h,058h,0c3h,03fh,041h,03ah,04ah,0cah,0feh,012h,021h,0cbh,086h	; 594d  ....X.?A:J...!..
	defb 011h,0b9h,0b3h,028h,010h,0feh,00ah,021h,0d5h,07bh,011h,094h,0a9h,028h,006h,021h	; 595d  ...(...!.{...(.!
	defb 0c2h,0a3h,011h,030h,0b3h,0cdh,078h,059h,0c3h,03fh,041h,0d5h,0e5h,0ddh,04eh,00ah	; 596d  ...0..xY.?A...N.
	defb 0ddh,046h,00bh,0cdh,0fch,07bh,047h,0cdh,044h,054h,0cdh,098h,059h,0d1h,019h,023h	; 597d  .F...{G.DT..Y..#
	defb 0d1h,0edh,053h,044h,0cah,011h,000h,0e5h,0c3h,0e0h,058h	; 598d  ..SD......X

; ======================================================================
; CODIGO 0x5998..0x5b72  (474 bytes)
; ======================================================================


L_5998:
	xor a			;5998
	ld h,a			;5999
	ld l,b			;599a
	add hl,hl			;599b
	add hl,hl			;599c
	ld d,h			;599d
	ld e,l			;599e
	add hl,hl			;599f
	add hl,hl			;59a0
	add hl,hl			;59a1
	add hl,de			;59a2
	ld e,b			;59a3
	ld d,a			;59a4
	add hl,de			;59a5
	ret			;59a6
L_59A7:
	push af			;59a7
	call L_59DD		;59a8
	pop af			;59ab
	ld hl,0ca4ah		;59ac
	ld c,(hl)			;59af
	cp (hl)			;59b0
	jr z,L_59C0		;59b1
	ld (hl),a			;59b3
	sub 00bh		;59b4
	cp 006h		;59b6
	jr c,L_59BB		;59b8
	ld c,(hl)			;59ba
L_59BB:
	call L_5A52		;59bb
	jr L_59CC		;59be
L_59C0:
	call L_5488		;59c0
	call L_4CB8		;59c3
	call L_5A7B		;59c6
	call L_54A4		;59c9
L_59CC:
	xor a			;59cc
	ld (0cb73h),a		;59cd
	ld a,(0ca76h)		;59d0
	and a			;59d3
	jp z,L_5310		;59d4
	call L_5CAE		;59d7
	jp L_55DA		;59da
L_59DD:
	ld hl,0d8d8h		;59dd
	ld bc,00007h		;59e0
	call L_4236		;59e3
	call L_45F6		;59e6
	call L_4266		;59e9
	call L_45D7		;59ec
L_59EF:
	call L_45F6		;59ef
	ld hl,0dc10h		;59f2
	ld bc,0006fh		;59f5
	ld a,0e0h		;59f8
	call L_4237		;59fa
	call 07baah		;59fd
	ld hl,0d300h		;5a00
	ld bc,000ffh		;5a03
	call L_4236		;5a06
	call L_5A0F		;5a09
	jp L_4609		;5a0c
L_5A0F:
	ld c,000h		;5a0f
L_5A11:
	ld a,002h		;5a11
	ld (0d41ah),a		;5a13
	ld (0d41fh),a		;5a16
	ld a,c			;5a19
	ld (0d416h),a		;5a1a
	ld (0d426h),a		;5a1d
	xor a			;5a20
	ld (0ca60h),a		;5a21
	ret			;5a24
L_5A25:
	call L_59DD		;5a25
	ld hl,0ca4ah		;5a28
	ld c,(hl)			;5a2b
	ld a,(0ca4bh)		;5a2c
	and 07fh		;5a2f
	ld (hl),a			;5a31
	ld b,a			;5a32
	ld a,(0d430h)		;5a33
	cp 002h		;5a36
	jr nc,L_5A4D		;5a38
	ld a,b			;5a3a
	dec a			;5a3b
	jr nz,L_5A44		;5a3c
	xor a			;5a3e
	ld (0d430h),a		;5a3f
	jr L_5A4D		;5a42
L_5A44:
	ld a,b			;5a44
	cp 007h		;5a45
	jr nz,L_5A4D		;5a47
	xor a			;5a49
	ld (0ca5fh),a		;5a4a
L_5A4D:
	push bc			;5a4d
	call 08257h		;5a4e
	pop bc			;5a51
L_5A52:
	ld a,c			;5a52
	sub 00bh		;5a53
	cp 006h		;5a55
	jr c,L_5A6F		;5a57
	call L_4459		;5a59
	call L_5B78		;5a5c
	call 082a2h		;5a5f
	call L_4BEC		;5a62
	call L_5BA1		;5a65
	ld a,(0ca64h)		;5a68
	and a			;5a6b
	call nz,06a6bh		;5a6c
L_5A6F:
	call L_51CA		;5a6f
	call L_41F7		;5a72
	call 0a2ebh		;5a75
	call L_40F0		;5a78
L_5A7B:
	call 0804eh		;5a7b
	ld hl,00000h		;5a7e
	ld (0cac9h),hl		;5a81
	ld a,001h		;5a84
	ld (0cacbh),a		;5a86
	ld (0cacch),a		;5a89
	ld (0cacdh),a		;5a8c
	ld a,0ffh		;5a8f
	ld (0d44ah),a		;5a91
	ld a,(0ca4ah)		;5a94
	ld b,a			;5a97
	dec a			;5a98
	jr nz,L_5AA4		;5a99
	ld hl,0ca22h		;5a9b
	ld a,(hl)			;5a9e
	and a			;5a9f
	jr nz,L_5AA4		;5aa0
	ld (hl),00ah		;5aa2
L_5AA4:
	ld a,b			;5aa4
	sub 00ch		;5aa5
	ld c,000h		;5aa7
	jr z,L_5AB0		;5aa9
	dec a			;5aab
	ld c,008h		;5aac
	jr nz,L_5AB4		;5aae
L_5AB0:
	ld a,c			;5ab0
	ld (0ca43h),a		;5ab1
L_5AB4:
	call L_41DD		;5ab4
	call 067e1h		;5ab7
	call L_41CA		;5aba
	call 0bca2h		;5abd
	call 0bc0fh		;5ac0
	call L_4188		;5ac3
	call 068e3h		;5ac6
	call L_5D9D		;5ac9
	call L_40F0		;5acc
	call 063ebh		;5acf
	ld a,(0ca4ah)		;5ad2
	cp 012h		;5ad5
	jr nz,L_5AF8		;5ad7
	ld a,(0d881h)		;5ad9
	inc a			;5adc
	jr z,L_5AF8		;5add
	ld a,001h		;5adf
	ld (0d8a4h),a		;5ae1
	ld hl,00902h		;5ae4
	ld (0ca50h),hl		;5ae7
	ld a,060h		;5aea
	ld (0cb03h),a		;5aec
	ld (0cb05h),a		;5aef
	ld a,(0ca42h)		;5af2
	call L_4452		;5af5
L_5AF8:
	call 07bf1h		;5af8
	call L_5B33		;5afb
L_5AFE:
	ld a,(0ca4ah)		;5afe
	cp 010h		;5b01
	ret z			;5b03
	ld hl,0c700h		;5b04
	ld (hl),a			;5b07
	inc hl			;5b08
	ld a,(0ca76h)		;5b09
	ld (hl),a			;5b0c
	inc hl			;5b0d
	ld a,(0cb03h)		;5b0e
	ld (hl),a			;5b11
	inc hl			;5b12
	ld a,(0cb05h)		;5b13
	ld (hl),a			;5b16
	inc hl			;5b17
	ld de,(0ca50h)		;5b18
	ld (hl),e			;5b1c
	inc hl			;5b1d
	ld (hl),d			;5b1e
	ld a,(0ca4ah)		;5b1f
	dec a			;5b22
	ret nz			;5b23
	ld a,(0ca4bh)		;5b24
	and a			;5b27
	jr z,L_5B2D		;5b28
	dec a			;5b2a
	dec a			;5b2b
	ret nz			;5b2c
L_5B2D:
	ld a,095h		;5b2d
	ld (0c702h),a		;5b2f
	ret			;5b32
L_5B33:
	xor a			;5b33
	ld (0d4e2h),a		;5b34
	ld (0d4e3h),a		;5b37
	ld (0d4e4h),a		;5b3a
	ld a,(0ca64h)		;5b3d
	and a			;5b40
	ret nz			;5b41
	ld a,(0ca5fh)		;5b42
	and a			;5b45
	ret nz			;5b46
	ld a,(0c697h)		;5b47
	and a			;5b4a
	ret nz			;5b4b
	call 07ce6h		;5b4c
	push hl			;5b4f
	ld de,(0ca20h)		;5b50
	call 00020h		;5b54   ; BIOS DCOMPR - Compares HL with DE
	pop hl			;5b57
	ld (0ca20h),hl		;5b58
	ret z			;5b5b
	ld (0ca19h),hl		;5b5c
	ld a,(0d4ebh)		;5b5f
	and a			;5b62
	ld a,0b4h		;5b63
	jr z,L_5B6C		;5b65
	xor a			;5b67
	ld (0d4ebh),a		;5b68
	inc a			;5b6b
L_5B6C:
	ld (0ca18h),a		;5b6c
	jp 06be4h		;5b6f

; ----------------------------------------------------------------------
; DATOS sin identificar  0x5b72..0x5b78  (6 bytes)
DATA_5B72:
	defb 0cdh,047h,05bh,0c3h,0c2h,041h	; 5b72

; ======================================================================
; CODIGO 0x5b78..0x5bfe  (134 bytes)
; ======================================================================


L_5B78:
	ld hl,0ca42h		;5b78
	push hl			;5b7b
	ld a,(hl)			;5b7c
	push af			;5b7d
	xor 001h		;5b7e
	ld (hl),a			;5b80
	call L_5F98		;5b81
	call L_439D		;5b84
	pop af			;5b87
	pop hl			;5b88
	ld (hl),a			;5b89
	ret			;5b8a
L_5B8B:
	ld a,(0ca4bh)		;5b8b
	ld b,a			;5b8e
	ld a,(0ca76h)		;5b8f
	and a			;5b92
	jr nz,L_5B9B		;5b93
	call L_589D		;5b95
	jp L_40F0		;5b98
L_5B9B:
	call L_569E		;5b9b
	jp L_40F0		;5b9e
L_5BA1:
	ld de,08000h		;5ba1
	ld hl,0ca4ah		;5ba4
	ld a,(hl)			;5ba7
	sub 00bh		;5ba8
	cp 006h		;5baa
	jr nc,L_5BBF		;5bac
	ld c,(hl)			;5bae
	ld (hl),00bh		;5baf
	ld b,006h		;5bb1
L_5BB3:
	push hl			;5bb3
	push bc			;5bb4
	call L_5BBF		;5bb5
	pop bc			;5bb8
	pop hl			;5bb9
	inc (hl)			;5bba
	djnz L_5BB3		;5bbb
	ld (hl),c			;5bbd
	ret			;5bbe
L_5BBF:
	ld a,(0ca4ah)		;5bbf
	ld hl,05bfeh		;5bc2
	call L_423E		;5bc5
	ld b,(hl)			;5bc8
	ld c,000h		;5bc9
L_5BCB:
	push bc			;5bcb
	push de			;5bcc
	push bc			;5bcd
	ld b,c			;5bce
	call L_589D		;5bcf
	call L_40F0		;5bd2
	pop bc			;5bd5
	ld a,c			;5bd6
	ld (0ca4bh),a		;5bd7
	call 0836ch		;5bda
	call L_5C12		;5bdd
	ld a,(0c386h)		;5be0
	ld h,080h		;5be3
	call 00024h		;5be5   ; BIOS ENASLT - Switches to specified slot and page definitively
	di			;5be8
	pop de			;5be9
	ld hl,0e900h		;5bea
	ld bc,00029h		;5bed
	ldir		;5bf0
	ld a,(0c388h)		;5bf2
	call 0013bh		;5bf5   ; BIOS WSLREG - Writes value to the primary slot register
	ei			;5bf8
	pop bc			;5bf9
	inc c			;5bfa
	djnz L_5BCB		;5bfb
	ret			;5bfd

; ----------------------------------------------------------------------
; DATOS sin identificar  0x5bfe..0x5c12  (20 bytes)
DATA_5BFE:
	defb 00dh,017h,009h,015h,018h,009h,024h,015h,010h,005h,019h,009h,009h,007h,006h,005h	; 5bfe  ......$.........
	defb 004h,006h,014h,006h	; 5c0e

; ======================================================================
; CODIGO 0x5c12..0x5c8f  (125 bytes)
; ======================================================================


L_5C12:
	exx			;5c12
	ld hl,0e900h		;5c13
	ld de,(0ca4eh)		;5c16
	exx			;5c1a
	ld de,0dd00h		;5c1b
	xor a			;5c1e
	ld (0e207h),a		;5c1f
	ld b,018h		;5c22
L_5C24:
	ld c,018h		;5c24
L_5C26:
	ld a,(de)			;5c26
	exx			;5c27
	cp 081h		;5c28
	ld c,e			;5c2a
	jr c,L_5C2E		;5c2b
	ld c,d			;5c2d
L_5C2E:
	cp c			;5c2e
	ccf			;5c2f
	call L_5C9B		;5c30
	exx			;5c33
	inc de			;5c34
	dec c			;5c35
	jr nz,L_5C26		;5c36
	djnz L_5C24		;5c38
	ld hl,0e900h		;5c3a
	ld de,0e980h		;5c3d
	ld b,018h		;5c40
L_5C42:
	push bc			;5c42
	ldi		;5c43
	ldi		;5c45
	ldi		;5c47
	ld a,003h		;5c49
L_5C4B:
	ex af,af'			;5c4b
	ld b,h			;5c4c
	ld a,l			;5c4d
	add a,003h		;5c4e
	ld c,a			;5c50
	ld a,(bc)			;5c51
	and (hl)			;5c52
	ld (de),a			;5c53
	inc hl			;5c54
	inc de			;5c55
	ex af,af'			;5c56
	dec a			;5c57
	jr nz,L_5C4B		;5c58
	inc hl			;5c5a
	inc hl			;5c5b
	inc hl			;5c5c
	ldi		;5c5d
	ldi		;5c5f
	ldi		;5c61
	pop bc			;5c63
	djnz L_5C42		;5c64
	exx			;5c66
	ld hl,0e900h		;5c67
	ld de,0e980h		;5c6a
	exx			;5c6d
	xor a			;5c6e
	ld (0e207h),a		;5c6f
	ld b,037h		;5c72
L_5C74:
	ld a,006h		;5c74
L_5C76:
	dec a			;5c76
	push af			;5c77
	exx			;5c78
	ld bc,05c8fh		;5c79
	add a,c			;5c7c
	ld c,a			;5c7d
	jr nc,L_5C81		;5c7e
	inc b			;5c80
L_5C81:
	ld a,(bc)			;5c81
	call L_5C95		;5c82
	exx			;5c85
	pop af			;5c86
	jr nz,L_5C76		;5c87
	exx			;5c89
	inc de			;5c8a
	exx			;5c8b
	djnz L_5C74		;5c8c
	ret			;5c8e

; ----------------------------------------------------------------------
; DATOS sin identificar  0x5c8f..0x5c95  (6 bytes)
DATA_5C8F:
	defb 001h,006h,008h,010h,060h,080h	; 5c8f

; ======================================================================
; CODIGO 0x5c95..0x5d03  (110 bytes)
; ======================================================================


L_5C95:
	ex de,hl			;5c95
	and (hl)			;5c96
	ex de,hl			;5c97
	jr z,L_5C9B		;5c98
	scf			;5c9a
L_5C9B:
	rl (hl)		;5c9b
	push hl			;5c9d
	ld hl,0e207h		;5c9e
	inc (hl)			;5ca1
	ld a,(hl)			;5ca2
	cp 008h		;5ca3
	jr c,L_5CAC		;5ca5
	ld (hl),000h		;5ca7
	pop hl			;5ca9
	inc hl			;5caa
	ret			;5cab
L_5CAC:
	pop hl			;5cac
	ret			;5cad
L_5CAE:
	call L_5CEF		;5cae
	ld c,000h		;5cb1
	ld de,08c00h		;5cb3
L_5CB6:
	push bc			;5cb6
	push de			;5cb7
	push bc			;5cb8
	ld b,c			;5cb9
	ld a,c			;5cba
	ld (0ca4bh),a		;5cbb
	push bc			;5cbe
	call L_565F		;5cbf
	pop bc			;5cc2
	ld (0ca4ch),hl		;5cc3
	call L_569E		;5cc6
	call L_40F0		;5cc9
	pop bc			;5ccc
	call 0836ch		;5ccd
	call L_5C12		;5cd0
	ld a,(0c386h)		;5cd3
	ld h,080h		;5cd6
	call 00024h		;5cd8   ; BIOS ENASLT - Switches to specified slot and page definitively
	pop de			;5cdb
	ld hl,0e900h		;5cdc
	ld bc,00029h		;5cdf
	ldir		;5ce2
	ld a,(0c388h)		;5ce4
	call 0013bh		;5ce7   ; BIOS WSLREG - Writes value to the primary slot register
	pop bc			;5cea
	inc c			;5ceb
	djnz L_5CB6		;5cec
	ret			;5cee
L_5CEF:
	ld a,(0ca76h)		;5cef
	ld b,001h		;5cf2
	ld hl,05d03h		;5cf4
L_5CF7:
	ld c,(hl)			;5cf7
	inc c			;5cf8
	ret z			;5cf9
	cp (hl)			;5cfa
	inc hl			;5cfb
	jr z,L_5D01		;5cfc
	inc hl			;5cfe
	jr L_5CF7		;5cff
L_5D01:
	ld b,(hl)			;5d01
	ret			;5d02

; ----------------------------------------------------------------------
; DATOS sin identificar  0x5d03..0x5d18  (21 bytes)
DATA_5D03:
	defb 004h,003h,006h,002h,018h,002h,026h,003h,029h,006h,02ah,002h,02dh,002h,031h,004h	; 5d03  ......&.).*.-.1.
	defb 038h,002h,039h,002h,0ffh	; 5d13

; ======================================================================
; CODIGO 0x5d18..0x5dd3  (187 bytes)
; ======================================================================


L_5D18:
	inc hl			;5d18
	ld c,000h		;5d19
	cp 0f8h		;5d1b
	jr nz,L_5D23		;5d1d
	ld a,(hl)			;5d1f
	ld c,040h		;5d20
	inc hl			;5d22
L_5D23:
	push hl			;5d23
	push de			;5d24
	push bc			;5d25
	call L_4AEA		;5d26
	ld bc,00808h		;5d29
	ld a,(0ca42h)		;5d2c
	and a			;5d2f
	ld a,0c8h		;5d30
	jr z,L_5D36		;5d32
	ld a,0d8h		;5d34
L_5D36:
	call L_47ED		;5d36
	pop bc			;5d39
	pop de			;5d3a
	pop hl			;5d3b
	ret			;5d3c
L_5D3D:
	ld a,c			;5d3d
	add a,004h		;5d3e
	ld c,a			;5d40
L_5D41:
	ld (hl),e			;5d41
	inc l			;5d42
	ld (hl),d			;5d43
	inc l			;5d44
	ld (hl),c			;5d45
	inc l			;5d46
	inc l			;5d47
	ret			;5d48
L_5D49:
	call L_41A0		;5d49
	jp L_41DD		;5d4c
L_5D4F:
	call L_4188		;5d4f
	call 06b42h		;5d52
	call L_413F		;5d55
	ld hl,0d400h		;5d58
	ld bc,00015h		;5d5b
	call L_4236		;5d5e
	call 0818bh		;5d61
	jr L_5D82		;5d64
L_5D66:
	call L_41DD		;5d66
	call 06be6h		;5d69
	jr L_5D82		;5d6c
L_5D6E:
	call L_5D49		;5d6e
	call 06be6h		;5d71
	call 06000h		;5d74
	call 08502h		;5d77
	jr L_5D82		;5d7a
L_5D7C:
	call L_5D49		;5d7c
	call 06055h		;5d7f
L_5D82:
	jp L_40F0		;5d82
L_5D85:
	call L_5D49		;5d85
	call 061f8h		;5d88
	jr L_5D82		;5d8b
L_5D8D:
	call L_5D49		;5d8d
	call 06327h		;5d90
	jr L_5D82		;5d93
L_5D95:
	call L_41B0		;5d95
	call 0a4a6h		;5d98
	jr L_5D82		;5d9b
L_5D9D:
	call L_4142		;5d9d
	call L_418E		;5da0
	call L_41DD		;5da3
	call 06ba5h		;5da6
	jr L_5D82		;5da9
L_5DAB:
	call L_4188		;5dab
	call 07ddch		;5dae
	jr L_5D82		;5db1
L_5DB3:
	call L_4188		;5db3
	call 068e3h		;5db6
	jr L_5D82		;5db9
L_5DBB:
	call L_4188		;5dbb
	call 06ab3h		;5dbe
	jr L_5D82		;5dc1
L_5DC3:
	call L_41DA		;5dc3
	call 07688h		;5dc6
	jr L_5D82		;5dc9
L_5DCB:
	call L_41DA		;5dcb
	call 076e9h		;5dce
	jr L_5D82		;5dd1

; ----------------------------------------------------------------------
; DATOS sin identificar  0x5dd3..0x5de2  (15 bytes)
DATA_5DD3:
	defb 0cdh,0dah,041h,0cdh,0e9h,076h,0cdh,050h,046h,0cdh,088h,076h,0c3h,03fh,041h	; 5dd3  ..A..v.PF..v.?A

; ======================================================================
; CODIGO 0x5de2..0x5df4  (18 bytes)
; ======================================================================


L_5DE2:
	call L_40F0		;5de2
	call L_5DFD		;5de5
	jp L_41DD		;5de8
L_5DEB:
	call L_40F0		;5deb
	call L_5DFD		;5dee
	jp L_41B5		;5df1

; ----------------------------------------------------------------------
; DATOS sin identificar  0x5df4..0x5dfd  (9 bytes)
DATA_5DF4:
	defb 0cdh,0f0h,040h,0cdh,0fdh,05dh,0c3h,03fh,041h	; 5df4  ..@..].?A

; ======================================================================
; CODIGO 0x5dfd..0x5f1b  (286 bytes)
; ======================================================================


L_5DFD:
	ld hl,(0ca4ch)		;5dfd
	push hl			;5e00
	call L_5E09		;5e01
	pop hl			;5e04
	ld (0ca4ch),hl		;5e05
	ret			;5e08
L_5E09:
	call L_45F1		;5e09
	call L_4266		;5e0c
	call L_45D7		;5e0f
	call 07c0eh		;5e12
	call L_5B8B		;5e15
	ld a,(0d8a4h)		;5e18
	and a			;5e1b
	jr nz,L_5E8C		;5e1c
	call 08475h		;5e1e
	ld a,(0d433h)		;5e21
	and a			;5e24
	jp nz,L_5EBC		;5e25
	call L_5EF0		;5e28
	call 07de2h		;5e2b
	ld a,(0d8c0h)		;5e2e
	and a			;5e31
	jr nz,L_5E6D		;5e32
	ld a,(0ca65h)		;5e34
	and a			;5e37
	jr nz,L_5E6D		;5e38
	call L_4142		;5e3a
	call L_41EF		;5e3d
	call 0b377h		;5e40
	call L_41CA		;5e43
	call 0be6dh		;5e46
	call 0bc1eh		;5e49
	call 0a4c9h		;5e4c
	ld hl,0ca42h		;5e4f
	ld a,(hl)			;5e52
	push hl			;5e53
	push af			;5e54
	xor 001h		;5e55
	ld (hl),a			;5e57
	call L_41B5		;5e58
	call 0a0e6h		;5e5b
	call 0ae7bh		;5e5e
	call L_40F0		;5e61
	call 08290h		;5e64
	call 083dch		;5e67
	pop af			;5e6a
	pop hl			;5e6b
	ld (hl),a			;5e6c
L_5E6D:
	call L_5ED4		;5e6d
	ld a,(0d8c0h)		;5e70
	or a			;5e73
	call z,07c20h		;5e74
	ld a,(0cb21h)		;5e77
	dec a			;5e7a
	call z,08b70h		;5e7b
	call 0924dh		;5e7e
	call L_41D5		;5e81
	call 0a601h		;5e84
	call L_40F0		;5e87
	jr L_5EB6		;5e8a
L_5E8C:
	call L_41CD		;5e8c
	call 0aaa9h		;5e8f
	call L_40F0		;5e92
	ld hl,(0c382h)		;5e95
	push hl			;5e98
	call L_4142		;5e99
	ld hl,0ca42h		;5e9c
	ld a,(hl)			;5e9f
	push af			;5ea0
	push hl			;5ea1
	xor 001h		;5ea2
	ld (hl),a			;5ea4
	call 089a8h		;5ea5
	pop hl			;5ea8
	pop af			;5ea9
	ld (hl),a			;5eaa
	call 088b7h		;5eab
	pop hl			;5eae
	ld a,l			;5eaf
	call L_413B		;5eb0
	call 07c20h		;5eb3
L_5EB6:
	call L_4650		;5eb6
	jp L_4606		;5eb9
L_5EBC:
	call L_5444		;5ebc
	ld de,09ee4h		;5ebf
	ld hl,07af8h		;5ec2
	ld (0ca44h),de		;5ec5
	call L_58DD		;5ec9
	call L_57E5		;5ecc
	call L_40F0		;5ecf
	jr L_5EB6		;5ed2
L_5ED4:
	ld a,(0ca4ah)		;5ed4
	cp 012h		;5ed7
	ret z			;5ed9
	ld a,(0ca76h)		;5eda
	cp 029h		;5edd
	ret z			;5edf
	ld a,(0d433h)		;5ee0
	and a			;5ee3
	ret nz			;5ee4
	ld a,(0cb21h)		;5ee5
	cp 008h		;5ee8
	jp nz,L_5F70		;5eea
	jp L_5F78		;5eed
L_5EF0:
	ld a,(0d8c0h)		;5ef0
	and a			;5ef3
	jp nz,L_5D95		;5ef4
	ld a,(0ca65h)		;5ef7
	and a			;5efa
	jp nz,0707eh		;5efb
	jp L_57E5		;5efe
L_5F01:
	call L_41DD		;5f01
	call 067e1h		;5f04
L_5F07:
	jp L_41F4		;5f07
L_5F0A:
	call L_4188		;5f0a
	call 069e0h		;5f0d
	jr L_5F07		;5f10
L_5F12:
	call L_4188		;5f12
	call 06ad4h		;5f15
	jp L_413F		;5f18

; ----------------------------------------------------------------------
; DATOS sin identificar  0x5f1b..0x5f23  (8 bytes)
DATA_5F1B:
	defb 0cdh,0f0h,040h,0cdh,0f0h,05eh,018h,00eh	; 5f1b  ..@..^..

; ======================================================================
; CODIGO 0x5f23..0x5fd5  (178 bytes)
; ======================================================================


L_5F23:
	call L_40F0		;5f23
	call L_5DFD		;5f26
	jr L_5F31		;5f29
L_5F2B:
	call L_41DA		;5f2b
	call 07688h		;5f2e
L_5F31:
	jp L_41C2		;5f31
L_5F34:
	call L_41DA		;5f34
	call 076e9h		;5f37
	jr L_5F31		;5f3a
L_5F3C:
	ld a,008h		;5f3c
L_5F3E:
	jp 0c340h		;5f3e
L_5F41:
	ld a,0fah		;5f41
	jr L_5F3E		;5f43
L_5F45:
	ld a,0fbh		;5f45
	jr L_5F3E		;5f47
L_5F49:
	ld a,011h		;5f49
	jr L_5F3E		;5f4b
L_5F4D:
	ld a,03fh		;5f4d
	jr L_5F3E		;5f4f
L_5F51:
	call L_5F5F		;5f51
	jp L_41C5		;5f54
L_5F57:
	call L_41DD		;5f57
	call 06ce0h		;5f5a
	jr L_5F65		;5f5d
L_5F5F:
	call L_41DD		;5f5f
	call 06d78h		;5f62
L_5F65:
	jp L_40F0		;5f65
L_5F68:
	call L_41DD		;5f68
	call 06e3ah		;5f6b
	jr L_5F65		;5f6e
L_5F70:
	call L_41DD		;5f70
	call 06e4bh		;5f73
	jr L_5F65		;5f76
L_5F78:
	call L_41DD		;5f78
	call 06e4fh		;5f7b
	jr L_5F65		;5f7e
L_5F80:
	call L_41DD		;5f80
	call 06e6ch		;5f83
	jr L_5F65		;5f86
L_5F88:
	call L_41DD		;5f88
	call 06e70h		;5f8b
	jr L_5F65		;5f8e
L_5F90:
	call L_41DD		;5f90
	call 06ec8h		;5f93
	jr L_5F65		;5f96
L_5F98:
	call L_41DD		;5f98
	call 06f41h		;5f9b
	jr L_5F65		;5f9e
L_5FA0:
	call L_418E		;5fa0
	call L_41DD		;5fa3
	xor a			;5fa6
	ld (0d455h),a		;5fa7
	call 072a1h		;5faa
	jr L_5F65		;5fad
L_5FAF:
	call L_418E		;5faf
	call L_41DD		;5fb2
	ld a,001h		;5fb5
	ld (0d455h),a		;5fb7
	call 072a1h		;5fba
	jr L_5F65		;5fbd
L_5FBF:
	call L_41DD		;5fbf
	call L_418E		;5fc2
	call 0746bh		;5fc5
	jr L_5F65		;5fc8
L_5FCA:
	call L_41DD		;5fca
	call L_418E		;5fcd
	call 07462h		;5fd0
	jr L_5F65		;5fd3

; ----------------------------------------------------------------------
; DATOS sin identificar  0x5fd5..0x5fe0  (11 bytes)
DATA_5FD5:
	defb 0cdh,088h,05fh,018h,003h,0cdh,080h,05fh,0c3h,042h,041h	; 5fd5  .._...._.BA

; ======================================================================
; CODIGO 0x5fe0..0x5fe6  (6 bytes)
; ======================================================================


L_5FE0:
	call L_5F80		;5fe0
	jp L_41B0		;5fe3

; ----------------------------------------------------------------------
; DATOS sin identificar  0x5fe6..0x5feb  (5 bytes)
DATA_5FE6:
	defb 0cdh,098h,05fh,018h,0f8h	; 5fe6

; ======================================================================
; CODIGO 0x5feb..0x6000  (21 bytes)
; ======================================================================


L_5FEB:
	call L_5F98		;5feb
	jp L_41BD		;5fee
L_5FF1:
	call 00138h		;5ff1   ; BIOS RSLREG - Reads the primary slot register
	rrca			;5ff4
	rrca			;5ff5
	and 003h		;5ff6
	ld c,a			;5ff8
	ld b,000h		;5ff9
	ld hl,0fcc1h		;5ffb
	add hl,bc			;5ffe
	ld a,(hl)			;5fff
