; ==========================================================================
; METAL GEAR 2 SOLID SNAKE - Konami (1990) - MSX2 - MegaROM RC-767 de 512 KB (Konami SCC) - banco 00 (se ejecuta en 0x4000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x04000


; ----------------------------------------------------------------------
; DATOS resto_4000: lo apuntan con el banco puesto p01:7102 (0x4000), p02:9F40
;   (0x4000), p13:82C9 (0x4000), p13:967B (0x4000), p15:BD67 (0x4000),
;   p11:BD4C (0x4001); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p01:7102, p02:9F40, p13:82C9, p13:967B, p15:BD67,
;   p11:BD4C (46 bytes)
;   0x4000..0x402e  (46 bytes)
DATA_resto_4000:
	defb 041h,042h,02eh,040h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 4000  AB.@............
	defb 043h,044h,007h,067h,0ffh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 4010  CD.g............
	defb 000h,000h,000h,000h,000h,000h,000h,000h,081h,002h,001h,002h,080h,0f6h	; 4020  ..............

; ======================================================================
; CODIGO 0x402e..0x43c8  (922 bytes)
; ======================================================================


arranque:		; sin interrupciones mientras se prepara el cartucho
	di			;402e
	call 06011h		;402f   ; 0x6011 (banco 1): busca en que ranura esta el cartucho
	di			;4032
	ld h,a			;4033   ; H = el slot del cartucho
	ld l,0f7h		;4034   ; L = 0xF7: el gancho H.STKE (0xFEDA) llama al slot H
	ld (0fedah),hl		;4036   ; el gancho H.STKE apunta al cartucho
	ld hl,arranque_por_el_gancho		;4039   ; y salta a 0x4040 cuando la BIOS acabe de arrancar
	ld (0fedch),hl		;403c
	ret			;403f   ; vuelve a la BIOS: el juego empieza por el gancho
arranque_por_el_gancho:		; ya desde el gancho H.STKE: no vuelve a la BIOS
	di			;4040
	im 1		;4041   ; interrupciones en modo 1 (rst 38h)
	ld sp,0c200h		;4043   ; la pila, justo por debajo de la interrupcion copiada en 0xC200
	ld hl,0fd9fh		;4046   ; guarda los 5 bytes del gancho H.TIMI (0xFD9F)...
	ld de,0c39ah		;4049   ; ...en 0xC39A
	ld bc,00005h		;404c
	ldir		;404f
	ld a,0c9h		;4051   ; 0xC9 = ret
	ld (0fd9ah),a		;4053   ; desactiva el gancho H.KEYI
	ld (0fd9fh),a		;4056   ; y el H.TIMI
	call slot_del_cartucho		;4059   ; slot_del_cartucho: el slot de la pagina 1 (la del cartucho)...
	call 06011h		;405c   ; vuelve a buscar la ranura del cartucho
	call 00138h		;405f   ; BIOS RSLREG - Reads the primary slot register
	ld (0c388h),a		;4062   ; guarda el registro de slots primarios
	call 07243h		;4065   ; p01:7243
	ld (0c386h),a		;4068   ; guarda lo que devuelve p01:7243
	ld a,(0c388h)		;406b   ; vuelve a poner los slots de antes
	call 0013bh		;406e   ; BIOS WSLREG - Writes value to the primary slot register
	call 09dd4h		;4071   ; busca el cartucho Game Master 2 (busca_gm2, p02:9DD4)
	ld a,(0ffa7h)		;4074   ; el gancho 0xFFA7 (H.PHYD, el disco): si no es un ret hay disquetera
	cp 0c9h		;4077
	call nz,0602dh		;4079   ; y entonces p01:602D prepara el disco
	ld hl,0c400h		;407c   ; borra la RAM del juego: 0xC400-0xF0FF
	ld bc,02cffh		;407f
	call borra_bloque		;4082   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	ld hl,0a0b6h		;4085   ; la interrupcion del juego: 160 bytes de p03:A0B6...
	ld de,0c200h		;4088   ; ...a 0xC200
	ld bc,000a0h		;408b
	ldir		;408e
	ld hl,0a021h		;4090   ; 160 bytes de p03:A021...
	ld de,0c2a0h		;4093   ; ...a 0xC2A0
	ld bc,000a0h		;4096
	ldir		;4099
	ld hl,0a14bh		;409b   ; el puente del sonido: 64 bytes de p03:A14B...
	ld de,0c340h		;409e   ; ...a 0xC340
	ld bc,00040h		;40a1
	ldir		;40a4
	ld hl,0a186h		;40a6   ; 64 bytes de p03:A186...
	ld de,0c000h		;40a9   ; ...a 0xC000
	ld bc,00040h		;40ac
	ldir		;40af
	ld hl,0c380h		;40b1   ; apunta a la copia del banco de 0x4000
	xor a			;40b4   ; los bancos 0, 1, 2 y 3 en las cuatro ventanas, con su copia
	ld (05000h),a		;40b5   ; el mapper: pone en 0x4000 el banco de A
	ld (hl),a			;40b8
	inc a			;40b9
	ld (07000h),a		;40ba   ; el mapper: pone en 0x6000 el banco de A
	inc hl			;40bd
	ld (hl),a			;40be
	inc a			;40bf
	ld (09000h),a		;40c0   ; el mapper: pone en 0x8000 el banco de A
	inc hl			;40c3
	ld (hl),a			;40c4
	inc a			;40c5
	ld (0b000h),a		;40c6   ; el mapper: pone en 0xA000 el banco de A
	inc hl			;40c9
	ld (hl),a			;40ca
	call 0803dh		;40cb   ; p06:B066 con el banco 6 (p02:803D)
	di			;40ce
	ld a,0c3h		;40cf   ; 0xC3 = jp
	ld (0fd9ah),a		;40d1   ; el gancho H.KEYI salta...
	ld hl,0c200h		;40d4   ; ...a la interrupcion copiada en 0xC200
	ld (0fd9bh),hl		;40d7
	ld hl,0c200h		;40da   ; (otra vez la misma direccion)
	ld (0fd9bh),hl		;40dd
	ld a,(0c388h)		;40e0   ; los slots de antes
	call 0013bh		;40e3   ; BIOS WSLREG - Writes value to the primary slot register
	xor a			;40e6   ; 0xF3DB = 0: sin el clic de las teclas
	ld (0f3dbh),a		;40e7
	call 0013eh		;40ea   ; BIOS RDVDP - Reads VDP status register | lee S#0 para borrar la interrupcion pendiente
	ei			;40ed   ; a partir de aqui el juego entero corre en la interrupcion
espera_eterna:		; el programa principal no hace nada mas: todo va en la interrupcion
	jr espera_eterna		;40ee
bancos_1_2_3:		; pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	push af			;40f0   ; el registro A se respeta
	ld a,001h		;40f1
L_40F3:
	di			;40f3   ; sin interrupciones mientras se cambia el mapper
	push hl			;40f4
	ld hl,0c381h		;40f5   ; apunta a la copia del banco de 0x6000
	ld (hl),a			;40f8   ; la copia del banco de 0x6000
	ld (07000h),a		;40f9   ; el mapper: pone en 0x6000 el banco de A
	inc a			;40fc   ; el banco siguiente...
	inc hl			;40fd
	ld (hl),a			;40fe   ; ...en su copia
	ld (09000h),a		;40ff   ; el mapper: pone en 0x8000 el banco de A
	jr L_414E		;4102   ; y el siguiente en 0xA000 (p00:414E)
bancos_32_33_34:		; pone el 32 en 0x6000, el 33 en 0x8000, el 34 en 0xA000 (con su copia en 0xC381-0xC383)
	push af			;4104
	ld a,020h		;4105   ; 0x20 = 32: y 33, 34 en las ventanas siguientes
	jr L_40F3		;4107
bancos_35_36_37:		; pone el 35 en 0x6000, el 36 en 0x8000, el 37 en 0xA000 (con su copia en 0xC381-0xC383)
	push af			;4109
	ld a,023h		;410a   ; 0x23 = 35
	jr L_40F3		;410c
bancos_24_25_26:		; pone el 24 en 0x6000, el 25 en 0x8000, el 26 en 0xA000 (con su copia en 0xC381-0xC383)
	push af			;410e
	ld a,018h		;410f   ; 0x18 = 24
	jr L_40F3		;4111
bancos_27_28:		; pone el 27 en 0x8000, el 28 en 0xA000 (con su copia en 0xC381-0xC383)
	push af			;4113
	ld a,01bh		;4114   ; 0x1B = 27: y 28 en 0xA000
	jr L_4145		;4116
bancos_29_30:		; pone el 29 en 0x8000, el 30 en 0xA000 (con su copia en 0xC381-0xC383)
	push af			;4118
	ld a,01dh		;4119   ; 0x1D = 29
	jr L_4145		;411b
bancos_48_49:		; pone el 48 en 0x8000, el 49 en 0xA000 (con su copia en 0xC381-0xC383)
	push af			;411d
	ld a,030h		;411e   ; 0x30 = 48
	jr L_4145		;4120
bancos_50_51:		; pone el 50 en 0x8000, el 51 en 0xA000 (con su copia en 0xC381-0xC383)
	push af			;4122
	ld a,032h		;4123   ; 0x32 = 50
	jr L_4145		;4125
bancos_52_53:		; pone el 52 en 0x8000, el 53 en 0xA000 (con su copia en 0xC381-0xC383)
	push af			;4127
	ld a,034h		;4128   ; 0x34 = 52
	jr L_4145		;412a
bancos_57_58:		; pone el 57 en 0x8000, el 58 en 0xA000 (con su copia en 0xC381-0xC383)
	push af			;412c
	ld a,039h		;412d   ; 0x39 = 57
	jr L_4145		;412f
bancos_60_61:		; pone el 60 en 0x8000, el 61 en 0xA000 (con su copia en 0xC381-0xC383)
	push af			;4131
	ld a,03ch		;4132   ; 0x3C = 60
	jr L_4145		;4134
bancos_62_63:		; pone el 62 en 0x8000, el 63 en 0xA000 (con su copia en 0xC381-0xC383)
	push af			;4136
	ld a,03eh		;4137   ; 0x3E = 62
	jr L_4145		;4139
bancos_0_1:		; pone el 0 en 0x8000, el 1 en 0xA000 (con su copia en 0xC381-0xC383)
	push af			;413b
	di			;413c   ; con el banco que traiga A (A en 0x8000, A + 1 en 0xA000)
	jr L_4145		;413d
bancos_1_4_5:		; pone el 1 en 0x6000, el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	call bancos_1_2_3		;413f   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
bancos_4_5:		; pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	push af			;4142
	ld a,004h		;4143   ; 4: y el 5 en 0xA000
L_4145:
	di			;4145
	push hl			;4146
	ld hl,0c382h		;4147   ; la copia del banco de 0x8000
	ld (hl),a			;414a
	ld (09000h),a		;414b   ; el mapper: pone en 0x8000 el banco de A
L_414E:
	inc a			;414e   ; el banco siguiente para 0xA000
	inc hl			;414f
	ld (hl),a			;4150   ; en la copia de 0xA000
	ld (0b000h),a		;4151   ; el mapper: pone en 0xA000 el banco de A
	pop hl			;4154
	pop af			;4155
	ei			;4156   ; el mapper ya esta puesto
	ret			;4157
bancos_36_37:		; pone el 36 en 0x8000, el 37 en 0xA000 (con su copia en 0xC381-0xC383)
	push af			;4158
	ld a,024h		;4159   ; 0x24 = 36
	jr L_4145		;415b
bancos_38_39:		; pone el 38 en 0x8000, el 39 en 0xA000 (con su copia en 0xC381-0xC383)
	push af			;415d
	ld a,026h		;415e   ; 0x26 = 38
	jr L_4145		;4160
bancos_40_41:		; pone el 40 en 0x8000, el 41 en 0xA000 (con su copia en 0xC381-0xC383)
	push af			;4162
	ld a,028h		;4163   ; 0x28 = 40
	jr L_4145		;4165
bancos_42_43:		; pone el 42 en 0x8000, el 43 en 0xA000 (con su copia en 0xC381-0xC383)
	push af			;4167
	ld a,02ah		;4168   ; 0x2A = 42
	jr L_4145		;416a
bancos_44_45:		; pone el 44 en 0x8000, el 45 en 0xA000 (con su copia en 0xC381-0xC383)
	push af			;416c
	ld a,02ch		;416d   ; 0x2C = 44
	jr L_4145		;416f
bancos_46_47:		; pone el 46 en 0x8000, el 47 en 0xA000 (con su copia en 0xC381-0xC383)
	push af			;4171
	ld a,02eh		;4172   ; 0x2E = 46
	jr L_4145		;4174
bancos_1_13_14:		; pone el 1 en 0x6000, el 13 en 0x8000, el 14 en 0xA000 (con su copia en 0xC381-0xC383)
	call bancos_1_2_3		;4176   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
bancos_13_14:		; pone el 13 en 0x8000, el 14 en 0xA000 (con su copia en 0xC381-0xC383)
	push af			;4179
	ld a,00dh		;417a   ; 0x0D = 13
	jr L_4145		;417c
bancos_53:		; pone el 53 en 0xA000 (con su copia en 0xC381-0xC383)
	push af			;417e
	ld a,035h		;417f   ; 0x35 = 53
	jr L_41A3		;4181
bancos_54:		; pone el 54 en 0xA000 (con su copia en 0xC381-0xC383)
	push af			;4183
	ld a,036h		;4184   ; 0x36 = 54
	jr L_41A3		;4186
bancos_12_4_56:		; pone el 12 en 0x6000, el 4 en 0x8000, el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	call bancos_4_5		;4188   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
bancos_12_56:		; pone el 12 en 0x6000, el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	call bancos_12		;418b   ; bancos_12: pone el 12 en 0x6000 (con su copia en 0xC381-0xC383)
bancos_56:		; pone el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	push af			;418e
	ld a,038h		;418f   ; 0x38 = 56
	jr L_41A3		;4191
bancos_58:		; pone el 58 en 0xA000 (con su copia en 0xC381-0xC383)
	push af			;4193
	ld a,03ah		;4194   ; 0x3A = 58
	jr L_41A3		;4196
bancos_63:		; pone el 63 en 0xA000 (con su copia en 0xC381-0xC383)
	push af			;4198
	ld a,03fh		;4199   ; 0x3F = 63
	jr L_41A3		;419b
bancos_1_2_6:		; pone el 1 en 0x6000, el 2 en 0x8000, el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call bancos_1_2_3		;419d   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
bancos_6:		; pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	push af			;41a0
	ld a,006h		;41a1   ; 6
L_41A3:
	di			;41a3
	ld (0c383h),a		;41a4   ; guarda la copia del banco de 0xA000
	ld (0b000h),a		;41a7   ; el mapper: pone en 0xA000 el banco de A
	pop af			;41aa   ; el A de la llamada
	ei			;41ab
	ret			;41ac
bancos_1_2_7:		; pone el 1 en 0x6000, el 2 en 0x8000, el 7 en 0xA000 (con su copia en 0xC381-0xC383)
	call bancos_1_2_3		;41ad   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
bancos_7:		; pone el 7 en 0xA000 (con su copia en 0xC381-0xC383)
	push af			;41b0
	ld a,007h		;41b1   ; 7
	jr L_41A3		;41b3
bancos_1_4_8:		; pone el 1 en 0x6000, el 4 en 0x8000, el 8 en 0xA000 (con su copia en 0xC381-0xC383)
	call bancos_1_4_5		;41b5   ; bancos_1_4_5: pone el 1 en 0x6000, el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	jr bancos_8		;41b8   ; y el 8 en 0xA000
bancos_1_2_8:		; pone el 1 en 0x6000, el 2 en 0x8000, el 8 en 0xA000 (con su copia en 0xC381-0xC383)
	call bancos_1_2_3		;41ba   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
bancos_8:		; pone el 8 en 0xA000 (con su copia en 0xC381-0xC383)
	push af			;41bd
	ld a,008h		;41be   ; 8
	jr L_41A3		;41c0
bancos_1_2_9:		; pone el 1 en 0x6000, el 2 en 0x8000, el 9 en 0xA000 (con su copia en 0xC381-0xC383)
	call bancos_1_2_3		;41c2   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
bancos_9:		; pone el 9 en 0xA000 (con su copia en 0xC381-0xC383)
	push af			;41c5
	ld a,009h		;41c6   ; 9
	jr L_41A3		;41c8
bancos_1_2_10:		; pone el 1 en 0x6000, el 2 en 0x8000, el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	call bancos_1_2_3		;41ca   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
bancos_10:		; pone el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	push af			;41cd
	ld a,00ah		;41ce   ; 0x0A = 10
	jr L_41A3		;41d0
bancos_1_2_11:		; pone el 1 en 0x6000, el 2 en 0x8000, el 11 en 0xA000 (con su copia en 0xC381-0xC383)
	call bancos_1_2_3		;41d2   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
bancos_11:		; pone el 11 en 0xA000 (con su copia en 0xC381-0xC383)
	push af			;41d5
	ld a,00bh		;41d6   ; 0x0B = 11
	jr L_41A3		;41d8
bancos_12_2_3:		; pone el 12 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call bancos_1_2_3		;41da   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
bancos_12:		; pone el 12 en 0x6000 (con su copia en 0xC381-0xC383)
	push af			;41dd
	ld a,00ch		;41de   ; 0x0C = 12
L_41E0:
	di			;41e0
	ld (0c381h),a		;41e1   ; guarda la copia del banco de 0x6000
	ld (07000h),a		;41e4   ; el mapper: pone en 0x6000 el banco de A
	pop af			;41e7
	ei			;41e8
	ret			;41e9
bancos_1:		; pone el 1 en 0x6000 (con su copia en 0xC381-0xC383)
	push af			;41ea
	ld a,001h		;41eb   ; 1
	jr L_41E0		;41ed
bancos_14:		; pone el 14 en 0xA000 (con su copia en 0xC381-0xC383)
	push af			;41ef
	ld a,00eh		;41f0   ; 0x0E = 14
	jr L_41A3		;41f2
bancos_1_2_15:		; pone el 1 en 0x6000, el 2 en 0x8000, el 15 en 0xA000 (con su copia en 0xC381-0xC383)
	call bancos_1_2_3		;41f4   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
bancos_15:		; pone el 15 en 0xA000 (con su copia en 0xC381-0xC383)
	push af			;41f7
	ld a,00fh		;41f8   ; 0x0F = 15
	jr L_41A3		;41fa
bancos_37:		; pone el 37 en 0xA000 (con su copia en 0xC381-0xC383)
	push af			;41fc
	ld a,025h		;41fd   ; 0x25 = 37
	jr L_41A3		;41ff
bancos_47:		; pone el 47 en 0xA000 (con su copia en 0xC381-0xC383)
	push af			;4201
	ld a,02fh		;4202   ; 0x2F = 47
	jr L_41A3		;4204
bancos_30:		; pone el 30 en 0xA000 (con su copia en 0xC381-0xC383)
	push af			;4206
	ld a,01eh		;4207   ; 0x1E = 30
	jr L_41A3		;4209
bancos_31:		; pone el 31 en 0xA000 (con su copia en 0xC381-0xC383)
	push af			;420b
	ld a,01fh		;420c   ; 0x1F = 31
	jr L_41A3		;420e
bancos_49:		; pone el 49 en 0xA000 (con su copia en 0xC381-0xC383)
	push af			;4210
	ld a,031h		;4211   ; 0x31 = 49
	jr L_41A3		;4213
bancos_51:		; pone el 51 en 0xA000 (con su copia en 0xC381-0xC383)
	push af			;4215
	ld a,033h		;4216   ; 0x33 = 51
	jr L_41A3		;4218
bancos_50:		; pone el 50 en 0x8000 (con su copia en 0xC381-0xC383)
	push af			;421a
	ld a,032h		;421b   ; 0x32 = 50
	jr L_422C		;421d
bancos_57:		; pone el 57 en 0x8000 (con su copia en 0xC381-0xC383)
	push af			;421f
	ld a,039h		;4220   ; 0x39 = 57
	jr L_422C		;4222
bancos_4:		; pone el 4 en 0x8000 (con su copia en 0xC381-0xC383)
	push af			;4224
	ld a,004h		;4225   ; 4
	jr L_422C		;4227
bancos_27:		; pone el 27 en 0x8000 (con su copia en 0xC381-0xC383)
	push af			;4229
	ld a,01bh		;422a   ; 0x1B = 27
L_422C:
	di			;422c
	ld (0c382h),a		;422d   ; guarda la copia del banco de 0x8000
	ld (09000h),a		;4230   ; el mapper: pone en 0x8000 el banco de A
	pop af			;4233
	ei			;4234
	ret			;4235
borra_bloque:		; pone a cero BC + 1 bytes desde HL
	xor a			;4236   ; A = 0
llena_bloque:		; pone A en BC + 1 bytes desde HL
	ld d,h			;4237   ; DE = HL + 1
	ld e,l			;4238
	inc de			;4239
	ld (hl),a			;423a   ; el primer byte...
	ldir		;423b   ; ...se arrastra por los BC siguientes
	ret			;423d
suma_a_hl:		; HL = HL + A
	add a,l			;423e   ; suma A al byte bajo
	ld l,a			;423f
	ret nc			;4240   ; sin acarreo, ya esta
	inc h			;4241   ; con acarreo, sube el alto
	ret			;4242
suma_a_de:		; DE = DE + A
	add a,e			;4243
	ld e,a			;4244
	ret nc			;4245
	inc d			;4246
	ret			;4247
byte_de_tabla:		; A = el byte A de la tabla de HL (y HL apunta a el)
	call suma_a_hl		;4248   ; HL apunta al byte A
	ld a,(hl)			;424b   ; A = ese byte
	ret			;424c
despachador:		; salta a la palabra A de la tabla que va detras del call
	pop hl			;424d   ; HL = la direccion de vuelta: la tabla que va detras del call
salta_por_tabla:		; salta a la palabra A de la tabla de HL
	add a,a			;424e   ; dos bytes por destino
	call byte_de_tabla		;424f   ; A = el byte bajo del destino
	inc hl			;4252
	ld h,(hl)			;4253   ; H = el byte alto
	ld l,a			;4254
	jp (hl)			;4255   ; al destino (la vuelta del call se ha quitado de la pila)
azar:		; A = un numero al azar (0xCA03 rotado mas R)
	push bc			;4256
	ld a,(0ca03h)		;4257   ; lee el contador de cuadros (uno mas en cada interrupcion)
	rrca			;425a   ; los 4 bits altos del contador...
	rrca			;425b
	rrca			;425c
	rrca			;425d
	ld b,a			;425e   ; ...a B
	ld a,r		;425f   ; mas el registro de refresco
	rlca			;4261
	rlca			;4262
	add a,b			;4263   ; A = R * 4 + cuadros / 16
	pop bc			;4264
	ret			;4265
esconde_sprites_ram:		; llena 0xDC00-0xDC7F con 0xE0
	ld hl,0dc00h		;4266   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	ld bc,0007fh		;4269   ; 128 bytes
	ld a,0e0h		;426c   ; Y = 0xE0: el sprite fuera de la pantalla
	jr llena_bloque		;426e
marcador_bancos_1_4_5:		; rehace el marcador (p00:4279) y deja los bancos 1, 4 y 5
	call rehace_marcador		;4270   ; rehace_marcador: el marcador: lineas, marco y barra de vida
	jp bancos_1_4_5		;4273   ; ...y deja los bancos 1, 4 y 5
marcador_entero:		; p01:6DFF y el marcador (p00:4279)
	call 06dffh		;4276   ; p01:6DFF
rehace_marcador:		; el marcador: lineas, marco y barra de vida
	call a_p12_6f41		;4279   ; a_p12_6f41: p12:6F41 con el banco 12 en 0x6000
	call lineas_c3		;427c   ; las lineas de p00:439D
	call copia_marcador_a_la_otra		;427f   ; copia la franja del marcador de una pagina a la otra
	call 06ff9h		;4282   ; p01:6FF9
	call marco_barra_de_vida		;4285   ; el marco de la barra de vida
barras_de_vida:		; la barra de vida y, con 0xCA5F, p04:9889
	call borra_barra_de_vida		;4288   ; borra_barra_de_vida: borra la barra de vida con el ancho de 0xCA52
	call pinta_barra_de_vida		;428b   ; y la pinta con lo que queda (0xCA53)
	ld a,(0ca5fh)		;428e
	and a			;4291   ; sin 0xCA5F, ya esta
	ret z			;4292
	call bancos_4_5		;4293   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	call 09889h		;4296
	jp bancos_1_2_3		;4299   ; y los bancos de siempre
barras_bancos_1_2_10:		; p00:4288 y los bancos 1, 2 y 10
	call barras_de_vida		;429c   ; barras_de_vida: la barra de vida y, con 0xCA5F, p04:9889
	jp bancos_1_2_10		;429f   ; ...y los bancos 1, 2 y 10
barras_bancos_1_4_5:		; p00:4288 y los bancos 1, 4 y 5
	call barras_de_vida		;42a2   ; barras_de_vida: la barra de vida y, con 0xCA5F, p04:9889
	jp bancos_1_4_5		;42a5   ; ...y los bancos 1, 4 y 5
marco_barra_cac4:		; el marco de la barra de la derecha con el ancho de 0xCAC4
	ld a,(0cac4h)		;42a8   ; lee lo largo de la barra de la derecha llena
	jr L_42B0		;42ab
marco_barra_ca54:		; el marco de la barra de la derecha con el ancho de 0xCA54
	ld a,(0ca54h)		;42ad
L_42B0:
	ld b,a			;42b0
	ld a,(0cae2h)		;42b1   ; sin la barra de la derecha (0xCAE2 = 0) no se pinta
	or a			;42b4
	ret z			;42b5
	ld a,b			;42b6
	ld hl,087cah		;42b7   ; el marco en X = 0x87, Y = 0xCA
	jr L_42C2		;42ba
marco_barra_de_vida:		; el marco de la barra de vida: X = 0x0F, Y = 0xCA, el ancho de 0xCA52 + 2, en el color 7
	ld a,(0ca52h)		;42bc   ; lee el ancho de la barra de vida (lo maximo)
	ld hl,00fcah		;42bf   ; el marco en X = 0x0F, Y = 0xCA (abajo, en el marcador)
L_42C2:
	ld e,005h		;42c2   ; 5 lineas de alto
	add a,002h		;42c4   ; dos puntos mas que la barra
	ld d,a			;42c6   ; D = el ancho del marco
	ld c,007h		;42c7   ; en el color 7
	ld a,(0ca42h)		;42c9   ; en la pagina en la que se dibuja
	jp marco		;42cc   ; las cuatro lineas
borra_barra_derecha:		; borra la barra de la derecha (X = 0x88, Y = 0xCB) con el ancho de A
	ld hl,088cbh		;42cf
	jr L_42DA		;42d2
borra_barra_de_vida:		; borra la barra de vida con el ancho de 0xCA52
	ld a,(0ca52h)		;42d4   ; lee el ancho de la barra de vida (lo maximo)
	ld hl,010cbh		;42d7   ; dentro del marco: X = 0x10, Y = 0xCB
L_42DA:
	ld b,a			;42da   ; B = el ancho
	ld c,003h		;42db   ; 3 lineas de alto
	call pagina_del_marcador		;42dd   ; D = la pagina
	ld d,a			;42e0
	xor a			;42e1   ; con el color 0 (negro)
	jp borra_bloque_vram		;42e2   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
pinta_barra_de_vida:		; la barra de vida de lo que vale 0xCA53, en el color 10
	ld a,(0ca53h)		;42e5   ; lee la vida de Snake (lo largo de la barra)
	and 0feh		;42e8   ; en pasos de dos puntos (un byte de la VRAM)
	or a			;42ea
	ret z			;42eb   ; sin vida no se pinta nada
	cp 080h		;42ec   ; 0x80 o mas tampoco
	ret nc			;42ee
	ld hl,010cbh		;42ef   ; dentro del marco: X = 0x10, Y = 0xCB
L_42F2:
	ld b,a			;42f2   ; B = lo largo de la barra
	ld c,003h		;42f3   ; 3 lineas
	call pagina_del_marcador		;42f5   ; pagina_del_marcador: A = la pagina del marcador: la 1 con 0xD8A4 puesto, si no la de 0xCA42
	ld d,a			;42f8
	ld a,0aah		;42f9   ; 0xAA: los dos puntos del byte en el color 10
	jp borra_bloque_vram		;42fb   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
pagina_del_marcador:		; A = la pagina del marcador: la 1 con 0xD8A4 puesto, si no la de 0xCA42
	ld a,(0d8a4h)		;42fe
	or a			;4301
	ld a,(0ca42h)		;4302   ; si no, en la pagina en la que se dibuja
	ret z			;4305
	ld a,001h		;4306   ; la pagina 1
	ret			;4308
borra_franja_80c0:		; borra 0x5A x 0x10 puntos desde X = 0x80, Y = 0xC0 en las paginas 0 y 1
	ld hl,080c0h		;4309
	ld bc,05a10h		;430c   ; 0x5A x 0x10 puntos
	push hl			;430f
	push bc			;4310
	ld d,000h		;4311   ; en la pagina 0...
	call L_431A		;4313
	pop bc			;4316
	pop hl			;4317
	ld d,001h		;4318   ; ...y en la 1
L_431A:
	xor a			;431a   ; con el color 0
	jp borra_bloque_vram		;431b   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
barra_derecha_cac4:		; la barra de la derecha de 0xCAC5 (con 0xCAE2 puesto)
	ld a,(0cae2h)		;431e   ; lee 1 mientras se ve la barra de la derecha
	or a			;4321
	ret z			;4322
	ld a,(0cac4h)		;4323   ; lo largo del hueco
	call borra_barra_derecha		;4326   ; lo borra
	ld hl,0cac5h		;4329   ; la barra de 0xCAC5...
	ld de,0cae6h		;432c   ; ...con el valor anterior en 0xCAE6
	jr L_4342		;432f
barra_derecha_ca54:		; la barra de la derecha de 0xCA55 (con 0xCAE2 puesto)
	ld a,(0cae2h)		;4331   ; lee 1 mientras se ve la barra de la derecha
	or a			;4334
	ret z			;4335
	ld a,(0ca54h)		;4336   ; lo largo del hueco
	call borra_barra_derecha		;4339   ; borra_barra_derecha: borra la barra de la derecha (X = 0x88, Y = 0xCB) con el ancho de A
	ld hl,0ca55h		;433c   ; la barra de 0xCA55...
	ld de,0cae5h		;433f   ; ...con el valor anterior en 0xCAE5
L_4342:
	push hl			;4342
	push de			;4343
	call pinta_barra_derecha		;4344   ; la pinta
	pop de			;4347
	pop hl			;4348
	dec hl			;4349   ; el byte de antes (el ancho del hueco)
	ld a,(hl)			;434a
	cp 040h		;434b   ; si la barra no esta llena (0x40), ya esta
	ret nz			;434d
	inc hl			;434e
	ldi		;434f   ; llena: copia el valor a su anterior
	ret			;4351
pinta_barra_derecha:		; la barra de la derecha de lo que vale (HL), en el color 10
	ld a,(hl)			;4352
	and 0feh		;4353   ; en bytes de dos puntos
	or a			;4355
	ret z			;4356
	cp 080h		;4357
	ret nc			;4359
	ld hl,088cbh		;435a   ; X = 0x88, Y = 0xCB
	jr L_42F2		;435d
marco_c4_bancos_1_2_7:		; p00:4365 y los bancos 1, 2 y 7
	call marco_c4		;435f   ; marco_c4: p00:5F90 y las lineas de p00:439D, salvo en la zona 0x12 sala 8 con 0xD8A4
	jp bancos_1_2_7		;4362   ; ...y los bancos 1, 2 y 7
marco_c4:		; p00:5F90 y las lineas de p00:439D, salvo en la zona 0x12 sala 8 con 0xD8A4
	ld a,(0ca4ah)		;4365   ; lee la zona
	cp 012h		;4368   ; la zona 0x12...
	jr nz,L_4378		;436a
	ld a,(0ca4bh)		;436c   ; lee la sala de la zona
	cp 008h		;436f   ; ...sala 8...
	jr nz,L_4378		;4371
	ld a,(0d8a4h)		;4373   ; ...con 0xD8A4 puesto no lleva el marco
	and a			;4376
	ret nz			;4377
L_4378:
	call a_p12_6ec8		;4378   ; a_p12_6ec8: p12:6EC8 con el banco 12 en 0x6000
	jp lineas_c3		;437b   ; y las lineas del radar
copia_marcador_a_la_otra:		; copia las lineas 0x16-0x51 de la pagina en la que se dibuja a la otra (YMMM)
	ld a,(0ca42h)		;437e   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	and a			;4381
	ld a,004h		;4382   ; la 0: A = 0b0100 (de la 1 a la 0)
	jr nz,L_4388		;4384
	ld a,001h		;4386   ; la 1: A = 0b0001 (de la 0 a la 1)
L_4388:
	jr L_4394		;4388
copia_marcador_a_esta:		; copia las lineas 0x16-0x51 de la otra pagina a la de dibujar (YMMM)
	ld a,(0ca42h)		;438a   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	and a			;438d
	ld a,004h		;438e
	jr z,L_4394		;4390
	ld a,001h		;4392
L_4394:
	ld hl,0c216h		;4394   ; Y = 0x16 ... 0xC2: el marcador
	ld d,03ch		;4397   ; 0x3C lineas
	ld e,l			;4399   ; a la misma Y
	jp copia_en_y		;439a   ; copia_en_y: orden YMMM del VDP
lineas_c3:		; las lineas de las listas de p00:43C8 (verticales) y p00:43E3 (horizontales), de 0x3A de largo en el color 0x0D
	ld bc,03a0dh		;439d
	ld a,(0ca5fh)		;43a0   ; con 0xCA5F puesto son 2 lineas, si no 4
	and a			;43a3
	ld a,004h		;43a4
	jr z,L_43AA		;43a6
	ld a,002h		;43a8
L_43AA:
	push bc			;43aa
	push af			;43ab
	call L_43CC		;43ac   ; las horizontales (p00:43CC)
	pop af			;43af
	pop bc			;43b0
	ld hl,043c8h		;43b1   ; las X de las verticales (p00:43C8)
L_43B4:
	push af			;43b4
	push hl			;43b5
	ld h,(hl)			;43b6   ; H = la X
	ld l,016h		;43b7   ; desde Y = 0x16
	ld a,(0ca42h)		;43b9   ; en la otra pagina
	xor 001h		;43bc
	call linea_vertical_guarda		;43be   ; la linea
	pop hl			;43c1
	pop af			;43c2
	inc hl			;43c3   ; la X siguiente
	dec a			;43c4
	jr nz,L_43B4		;43c5
	ret			;43c7

; ----------------------------------------------------------------------
; DATOS resto_43C8: lo apuntan con el banco puesto p00:43B1 (0x43C8); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p00:43B1 (4 bytes)
;   0x43c8..0x43cc  (4 bytes)
DATA_resto_43C8:
	defb 0c3h,0fch,0d6h,0e9h	; 43c8

; ======================================================================
; CODIGO 0x43cc..0x43e3  (23 bytes)
; ======================================================================


L_43CC:
	ld hl,043e3h		;43cc   ; las Y de las horizontales (p00:43E3)
L_43CF:
	push af			;43cf
	push hl			;43d0
	ld l,(hl)			;43d1   ; L = la Y
	ld h,0c3h		;43d2   ; desde X = 0xC3
	ld a,(0ca42h)		;43d4   ; en la otra pagina
	xor 001h		;43d7
	call linea_horizontal_guarda		;43d9   ; linea_horizontal_guarda: p00:467C guardando AF, HL, DE y BC
	pop hl			;43dc
	pop af			;43dd
	inc hl			;43de
	dec a			;43df
	jr nz,L_43CF		;43e0
	ret			;43e2

; ----------------------------------------------------------------------
; DATOS resto_43E3: lo apuntan con el banco puesto p00:43CC (0x43E3); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p00:43CC (19 bytes)
;   0x43e3..0x43f6  (19 bytes)
DATA_resto_43E3:
	defb 016h,04fh,029h,03ch,0c5h,04eh,01ah,077h,079h,012h,023h,013h,0c1h,00bh,078h,0b1h	; 43e3  .O)<.N.wy.#...x.
	defb 020h,0f2h,0c9h	; 43f3

; ======================================================================
; CODIGO 0x43f6..0x44d0  (218 bytes)
; ======================================================================


palabra_de_tabla:		; HL = la palabra A de la tabla de HL
	add a,a			;43f6   ; dos bytes por palabra
	add a,l			;43f7
	ld l,a			;43f8
	jr nc,lee_palabra		;43f9   ; sin acarreo, a leerla
	inc h			;43fb
lee_palabra:		; HL = la palabra que hay en HL
	push af			;43fc
	ld a,(hl)			;43fd   ; el byte bajo...
	inc hl			;43fe
	ld h,(hl)			;43ff   ; ...y el alto
	ld l,a			;4400
	pop af			;4401
	ret			;4402
palabra_de_tabla_de:		; DE = la palabra A de la tabla de DE
	add a,a			;4403   ; dos bytes por palabra
	add a,e			;4404
	ld e,a			;4405
	jr nc,L_4409		;4406
	inc d			;4408
L_4409:
	ld a,(de)			;4409   ; el byte bajo
	inc de			;440a
	push af			;440b
	ld a,(de)			;440c   ; el alto...
	ld d,a			;440d   ; ...a D
	pop af			;440e
	ld e,a			;440f   ; y el bajo a E
	ret			;4410
punto_a_mapa:		; H = X, L = Y en puntos; A = X / 8, la columna
	ld a,h			;4411
	rra			;4412
	rra			;4413
	rra			;4414
	and 01fh		;4415
	push af			;4417
	ld h,000h		;4418   ; HL = Y * 2...
	ld a,l			;441a
	rla			;441b
	rl h		;441c
	and 0f0h		;441e   ; ...(Y / 8) * 16...
	add a,l			;4420   ; ...mas Y
	jr nc,L_4424		;4421
	inc h			;4423
L_4424:
	and 0f8h		;4424   ; sin los 3 bits bajos: (Y / 8) * 24, la fila
	ld l,a			;4426
	pop af			;4427
	add a,l			;4428   ; mas la columna
	jr nc,L_442C		;4429
	inc h			;442b
L_442C:
	ld l,a			;442c
	ld a,(0d8a3h)		;442d   ; el mapa de la sala: 0xDD00 o, con 0xD8A3, 0xE500
	and a			;4430
	ld a,0ddh		;4431
	jr z,L_4437		;4433
	ld a,0e5h		;4435
L_4437:
	add a,h			;4437   ; HL = la casilla del mapa
	ld h,a			;4438
	ret			;4439
hl_negativo:		; HL = -HL (PR2 p00:5BBD)
	ld a,h			;443a   ; da la vuelta a los bits...
	cpl			;443b
	ld h,a			;443c
	ld a,l			;443d
	cpl			;443e
	ld l,a			;443f
	inc hl			;4440   ; ...y suma uno: complemento a dos
	ret			;4441
de_negativo:		; DE = -DE
	ld a,d			;4442
	cpl			;4443   ; da la vuelta a los bits de D...
	ld d,a			;4444
	ld a,e			;4445
	cpl			;4446   ; ...y de E...
	ld e,a			;4447
	inc de			;4448   ; ...y suma uno
	ret			;4449
borra_pagina_0_negro:		; la pagina D entera a 0 desde (0, 0)
	ld bc,00000h		;444a
	jr L_4455		;444d
borra_pantalla_negro:		; 0xC0 x 0xC0 puntos a 0 en la pagina de dibujar
	ld a,(0ca42h)		;444f   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
borra_pantalla_de:		; 0xC0 x 0xC0 puntos a 0 en la pagina A
	ld bc,0c0c0h		;4452
L_4455:
	ld d,a			;4455   ; D = la pagina
	xor a			;4456   ; color 0
	jr L_4462		;4457
llena_pantalla_99:		; 0xC0 x 0xC0 puntos al color 9 en la pagina de dibujar
	ld bc,0c0c0h		;4459
	ld a,(0ca42h)		;445c   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	ld d,a			;445f
	ld a,099h		;4460   ; color 0x99: el 9 en los dos puntos
L_4462:
	ld hl,00000h		;4462   ; desde (0, 0)
	jp borra_bloque_vram		;4465   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
lee_de_vram_espera:		; espera al VDP y copia BC bytes de la VRAM de HL a DE
	call espera_vdp		;4468   ; espera_vdp: espera a que el VDP acabe la orden en curso (S#2 bit 0)
lee_de_vram:		; copia BC bytes de la VRAM de HL a DE (PR2 p00:463B)
	call vram_para_leer		;446b   ; vram_para_leer: pone en el VDP la direccion de lectura HL (A bit 0 = la mitad alta, R#14)
	call cuenta_para_otir		;446e   ; cuenta_para_otir: pasa BC a B (bytes) y A (vueltas de 256) para otir/inir
	ex af,af'			;4471
	ld a,(00006h)		;4472   ; el puerto de datos del VDP para leer (0x0006 en la BIOS)
	ld c,a			;4475
	ex af,af'			;4476
L_4477:
	inir		;4477   ; lee B bytes...
	dec a			;4479   ; ...A vueltas
	jr nz,L_4477		;447a
	ex de,hl			;447c
	ret			;447d
cuenta_para_otir:		; pasa BC a B (bytes) y A (vueltas de 256) para otir/inir
	ex de,hl			;447e
	ld a,c			;447f   ; un multiplo de 256: A vueltas de 256
	or a			;4480
	ld a,b			;4481
	ld b,c			;4482   ; B = el resto
	ret z			;4483
	inc a			;4484   ; una vuelta mas para el resto
	ret			;4485
copia_a_vram_espera:		; espera al VDP (p00:4650) y copia BC bytes de HL a la VRAM de DE
	call espera_vdp		;4486   ; espera_vdp: espera a que el VDP acabe la orden en curso (S#2 bit 0)
copia_a_vram:		; copia BC bytes de HL a la VRAM de DE (PR2 p00:45ED)
	ex de,hl			;4489
	call vram_para_escribir		;448a   ; vram_para_escribir: pone en el VDP la direccion de escritura HL (A bit 0 = la mitad alta, R#14)
	call cuenta_para_otir		;448d   ; cuenta_para_otir: pasa BC a B (bytes) y A (vueltas de 256) para otir/inir
	ex af,af'			;4490
	ld a,(00007h)		;4491   ; el puerto de datos del VDP para escribir (0x0007 en la BIOS)
	ld c,a			;4494
	ex af,af'			;4495
L_4496:
	otir		;4496   ; escribe B bytes...
	dec a			;4498   ; ...A vueltas
	jr nz,L_4496		;4499
	ret			;449b
llena_vram:		; llena con A BC bytes de la VRAM de HL (pagina en D)
	call espera_vdp		;449c   ; espera_vdp: espera a que el VDP acabe la orden en curso (S#2 bit 0)
	push de			;449f
	push af			;44a0
	ld a,d			;44a1   ; la pagina
	call vram_para_escribir		;44a2   ; vram_para_escribir: pone en el VDP la direccion de escritura HL (A bit 0 = la mitad alta, R#14)
	ld d,c			;44a5   ; D = la cuenta baja
	ld a,c			;44a6
	or a			;44a7
	jr z,L_44AB		;44a8
	inc b			;44aa   ; con resto, una vuelta mas
L_44AB:
	ld a,(00007h)		;44ab
	ld c,a			;44ae
	pop af			;44af
L_44B0:
	out (c),a		;44b0   ; el byte...
	dec d			;44b2   ; ...D veces...
	jr nz,L_44B0		;44b3
	djnz L_44B0		;44b5   ; ...B vueltas
	pop de			;44b7
	ret			;44b8
lee_byte_vram:		; A = el byte de la VRAM de HL
	call espera_vdp		;44b9   ; espera_vdp: espera a que el VDP acabe la orden en curso (S#2 bit 0)
	push bc			;44bc
	call vram_para_leer		;44bd   ; vram_para_leer: pone en el VDP la direccion de lectura HL (A bit 0 = la mitad alta, R#14)
	ld a,(00006h)		;44c0
	ld c,a			;44c3
	in a,(c)		;44c4   ; lo lee
	pop bc			;44c6
	ret			;44c7
escribe_byte_vram:		; escribe A en la VRAM de HL (pagina 0)
	call espera_vdp		;44c8   ; espera_vdp: espera a que el VDP acabe la orden en curso (S#2 bit 0)
	push bc			;44cb
	push af			;44cc
	xor a			;44cd
	jr $+8		;44ce   ; salta la mitad del byte que sigue: entra en p00:44D6

; ----------------------------------------------------------------------
; DATOS sin identificar  0x44d0..0x44d6  (6 bytes)
DATA_44D0:
	defb 0cdh,050h,046h,0c5h,0f5h,07ah	; 44d0

; ======================================================================
; CODIGO 0x44d6..0x491c  (1094 bytes)
; ======================================================================


L_44D6:
	call vram_para_escribir		;44d6   ; vram_para_escribir: pone en el VDP la direccion de escritura HL (A bit 0 = la mitad alta, R#14)
	ld a,(00007h)		;44d9
	ld c,a			;44dc
	pop af			;44dd
	out (c),a		;44de   ; escribe el byte
	pop bc			;44e0
	ret			;44e1
vram_para_escribir:		; pone en el VDP la direccion de escritura HL (A bit 0 = la mitad alta, R#14)
	push bc			;44e2
	rra			;44e3   ; el bit 0 de A al acarreo: la mitad de 128 KB
	ld a,(00007h)		;44e4   ; el puerto de control del VDP
	inc a			;44e7
	ld c,a			;44e8
	ld a,h			;44e9   ; A14-A16: los tres bits altos de la direccion...
	rla			;44ea
	rla			;44eb
	rla			;44ec
	and 007h		;44ed
	di			;44ef
	out (c),a		;44f0   ; ...al registro 14
	ld a,08eh		;44f2   ; 0x8E: el registro 14
	out (c),a		;44f4
	ld a,l			;44f6   ; los 8 bits bajos
	out (c),a		;44f7
	ld a,h			;44f9   ; y los 6 de en medio con el bit 6 (escribir)
	and 03fh		;44fa
	or 040h		;44fc
	out (c),a		;44fe
	pop bc			;4500
	ei			;4501
	ret			;4502
vram_para_leer:		; pone en el VDP la direccion de lectura HL (A bit 0 = la mitad alta, R#14)
	push bc			;4503
	rra			;4504   ; el bit 0 de A: la mitad de 128 KB
	ld a,(00007h)		;4505
	inc a			;4508
	ld c,a			;4509
	ld a,h			;450a   ; A14-A16 al registro 14
	rla			;450b
	rla			;450c
	rla			;450d
	and 007h		;450e
	di			;4510
	out (c),a		;4511
	ld a,08eh		;4513
	out (c),a		;4515
	ld a,l			;4517   ; los 8 bits bajos
	out (c),a		;4518
	ld a,h			;451a   ; y los 6 de en medio sin el bit 6 (leer)
	and 03fh		;451b
	out (c),a		;451d
	pop bc			;451f
	ei			;4520
	ret			;4521
registro_vdp:		; escribe B en el registro C del VDP
	ld a,c			;4522   ; C = el numero de registro
	ex af,af'			;4523
	ld a,(00007h)		;4524   ; el puerto de control del VDP
	inc a			;4527
	ld c,a			;4528
	ld a,b			;4529
	di			;452a
	out (c),a		;452b   ; el dato primero...
	ex af,af'			;452d
	or 080h		;452e   ; ...y el registro con el bit 7
	ei			;4530
	out (c),a		;4531
	ret			;4533
rachas_otro_destino:		; la orden 0x80 de las rachas: [pagina][VRAM lo hi] y sigue
	ld c,000h		;4534   ; sin voltear
L_4536:
	ex de,hl			;4536
	ld a,(hl)			;4537   ; A = la pagina
	inc hl			;4538
	ld e,(hl)			;4539   ; HL = la nueva direccion de la VRAM
	inc hl			;453a
	ld d,(hl)			;453b
	inc hl			;453c
	ex de,hl			;453d
rachas_a_vram:		; deshace las rachas de DE en la VRAM de HL (n < 0x80 repite, n > 0x80 copia n & 0x7F, 0x80 cambia de destino, 0 acaba); C bit 0 = voltear
	call espera_vdp		;453e   ; espera_vdp: espera a que el VDP acabe la orden en curso (S#2 bit 0)
	call vram_para_escribir		;4541   ; vram_para_escribir: pone en el VDP la direccion de escritura HL (A bit 0 = la mitad alta, R#14)
	exx			;4544
	ld a,(00007h)		;4545
	ld c,a			;4548
	exx			;4549
L_454A:
	ld a,(de)			;454a   ; el byte de la orden
	and a			;454b
	ret z			;454c   ; 0: se acabo
	inc de			;454d
	ld b,a			;454e
	and 07fh		;454f   ; el contador sin el bit 7
	cp b			;4551   ; sin el bit 7 (n < 0x80): una racha del mismo byte
	jr z,L_4563		;4552
	and a			;4554
	jr z,rachas_otro_destino		;4555   ; 0x80 justo: cambia de destino
	ld b,a			;4557   ; n > 0x80: n & 0x7F bytes distintos
L_4558:
	call byte_volteado_si		;4558   ; cada byte, volteado si hace falta...
	exx			;455b
	out (c),a		;455c   ; ...a la VRAM
	exx			;455e
	djnz L_4558		;455f
	jr L_454A		;4561
L_4563:
	call byte_volteado_si		;4563   ; el byte de la racha...
L_4566:
	exx			;4566
	out (c),a		;4567   ; ...n veces
	exx			;4569
	djnz L_4566		;456a
	jr L_454A		;456c
rachas_a_vram_tal_cual:		; p00:453E sin voltear (C = 0)
	ld c,000h		;456e
	jr rachas_a_vram		;4570
rachas_otro_destino_volteado:		; como p00:4534 pero dando la vuelta a cada byte
	ld c,001h		;4572
	jr L_4536		;4574
rachas_a_vram_volteado:		; p00:453E dando la vuelta a cada byte
	ld c,001h		;4576
	jr rachas_a_vram		;4578
voltea_en_vram:		; C patrones de 16 x 16 en espejo de la VRAM de HL a la de DE
	call voltea_bloque_vram		;457a   ; voltea_bloque_vram: un patron de 16 x 16 en espejo: cada byte con los bits al reves y las dos mitades cambiadas
	ld a,020h		;457d   ; ...y el siguiente, 32 bytes mas alla
	call suma_a_de		;457f   ; suma_a_de: DE = DE + A
	dec c			;4582   ; C bloques
	jr nz,voltea_en_vram		;4583
	ret			;4585
voltea_bloque_vram:		; un patron de 16 x 16 en espejo: cada byte con los bits al reves y las dos mitades cambiadas
	push de			;4586
L_4587:
	ld b,010h		;4587   ; 16 bytes por fila
L_4589:
	xor a			;4589   ; de la pagina 0
	call lee_byte_vram		;458a   ; lee el byte de HL...
	call bits_al_reves		;458d   ; ...le da la vuelta...
	ex de,hl			;4590
	call escribe_byte_vram		;4591   ; ...y lo escribe en DE
	ex de,hl			;4594
	inc e			;4595
	inc hl			;4596
	djnz L_4589		;4597
	ld a,e			;4599   ; vuelve a la fila
	sub 020h		;459a
	ld e,a			;459c
	bit 4,e		;459d   ; hasta pasar el bit 4 de E
	jr z,L_4587		;459f
	pop de			;45a1
	ret			;45a2
byte_volteado_si:		; lee el byte de DE y lo voltea si C lleva el bit 0
	ld a,(de)			;45a3   ; el byte de DE
	inc de			;45a4
	bit 0,c		;45a5   ; sin el bit 0 de C, tal cual
	ret z			;45a7
bits_al_reves:		; da la vuelta a los 8 bits de A (PR2 p00:4827)
	push bc			;45a8
	ld c,a			;45a9
	ld b,008h		;45aa
L_45AC:
	rr c		;45ac   ; el bit bajo de C...
	rla			;45ae   ; ...entra por abajo en A
	djnz L_45AC		;45af
	pop bc			;45b1
	ret			;45b2
pantalla_a_negro:		; sin sprites ni pantalla, la pagina 0 a cero y sin desplazamiento
	call esconde_sprites_vram		;45b3   ; esconde_sprites_vram: llena con 0xE0 128 bytes de la VRAM en 0xF600 y otros 128 en 0xF200
	call apaga_pantalla_y_sprites		;45b6   ; ...ni pantalla...
borra_pagina_0:		; la pagina 0 a cero y R#23 = 0
	ld d,000h		;45b9
	call borra_toda_la_pagina		;45bb   ; borra_toda_la_pagina: p00:46FF desde (0,0) con BC = 0 y A = 0 en la pagina D
scroll_a_cero:		; R#23 = 0 (el desplazamiento vertical)
	ld b,000h		;45be   ; ...y sin desplazamiento
	ld c,017h		;45c0   ; R#23
	jp registro_vdp		;45c2   ; registro_vdp: escribe B en el registro C del VDP
enciende_pantalla:		; R#1 con el bit 6 (BL) a uno, desde la copia 0xF3E0
	ld a,(0f3e0h)		;45c5   ; la copia del registro 1 de la BIOS
	or 040h		;45c8   ; el bit 6: pantalla encendida
	jr L_45D1		;45ca
apaga_pantalla:		; R#1 con el bit 6 (BL) a cero, desde la copia 0xF3E0
	ld a,(0f3e0h)		;45cc
	and 0bfh		;45cf   ; sin el bit 6
L_45D1:
	ld b,a			;45d1   ; B = el valor
	ld c,001h		;45d2   ; R#1
	jp registro_vdp		;45d4   ; registro_vdp: escribe B en el registro C del VDP
esconde_sprites_vram:		; llena con 0xE0 128 bytes de la VRAM en 0xF600 y otros 128 en 0xF200
	ld hl,0f600h		;45d7   ; la tabla de atributos de sprites de la pagina 0...
	ld bc,00080h		;45da
	ld d,000h		;45dd
	ld a,0e0h		;45df   ; con Y = 0xE0 todos fuera
	call llena_vram		;45e1   ; llena_vram: llena con A BC bytes de la VRAM de HL (pagina en D)
	ld hl,0f200h		;45e4   ; ...y la de la pagina 1
	ld d,000h		;45e7
	ld a,0e0h		;45e9
	ld bc,00080h		;45eb
	jp llena_vram		;45ee   ; llena_vram: llena con A BC bytes de la VRAM de HL (pagina en D)
apaga_pantalla_y_sprites:		; p00:45CC y p00:45F6
	call apaga_pantalla		;45f1   ; apaga_pantalla: R#1 con el bit 6 (BL) a cero, desde la copia 0xF3E0
	jr apaga_sprites		;45f4
apaga_sprites:		; R#8 con el bit 1 (SPD) a uno, desde la copia 0xFFE7
	ld a,(0ffe7h)		;45f6   ; la copia del registro 8
	or 002h		;45f9   ; el bit 1: sin sprites
	jr L_460E		;45fb
pantalla_limpia:		; la pantalla apagada, la pagina 0 borrada y otra vez encendida
	call esconde_sprites_vram		;45fd   ; esconde_sprites_vram: llena con 0xE0 128 bytes de la VRAM en 0xF600 y otros 128 en 0xF200
	call apaga_pantalla_y_sprites		;4600   ; apaga_pantalla_y_sprites: p00:45CC y p00:45F6
	call borra_pagina_0		;4603   ; borra_pagina_0: la pagina 0 a cero y R#23 = 0
enciende_todo:		; la pantalla y los sprites encendidos
	call enciende_pantalla		;4606   ; enciende_pantalla: R#1 con el bit 6 (BL) a uno, desde la copia 0xF3E0
enciende_sprites:		; R#8 con el bit 1 (SPD) a cero, desde la copia 0xFFE7
	ld a,(0ffe7h)		;4609   ; la copia del registro 8
	and 0fdh		;460c   ; sin el bit 1: con sprites
L_460E:
	ld b,a			;460e
	ld c,008h		;460f   ; R#8
	jp registro_vdp		;4611   ; registro_vdp: escribe B en el registro C del VDP
pon_color:		; el color A de la paleta = D (rojo y azul), E (verde)
	push bc			;4614
	push hl			;4615
	ld b,a			;4616   ; B = el color
	ld a,(00007h)		;4617   ; el puerto de control
	inc a			;461a
	ld c,a			;461b
	di			;461c
	out (c),b		;461d   ; el color al registro 16...
	ld a,090h		;461f   ; 0x90 = R#16
	out (c),a		;4621
	inc c			;4623   ; el puerto de la paleta
	out (c),d		;4624   ; rojo y azul...
	push af			;4626   ; una pausa para el VDP
	pop af			;4627
	out (c),e		;4628   ; ...y verde
	dec c			;462a
	ld hl,0f680h		;462b   ; la copia de la paleta en la VRAM (0xF680, como la BIOS)
	ld a,b			;462e
	add a,a			;462f   ; dos bytes por color
	add a,l			;4630
	ld l,a			;4631
	xor a			;4632
	call vram_para_escribir		;4633   ; en la pagina 0
	dec c			;4636   ; el puerto de datos
	out (c),d		;4637   ; los dos bytes tambien en la copia
	out (c),e		;4639
	pop hl			;463b
	pop bc			;463c
	ei			;463d
	ret			;463e
pon_paleta_con_espera:		; pone la paleta de HL (p00:4642) esperando al VDP antes
	call espera_vdp		;463f   ; entre color y color, espera al VDP
pon_paleta:		; pone la paleta de HL (PR2 p00:4AD8)
	ld a,(hl)			;4642   ; el numero de color
	inc hl			;4643
	inc a			;4644   ; 0xFF: se acabo
	ret z			;4645
	dec a			;4646
	ld d,(hl)			;4647   ; D = rojo y azul
	inc hl			;4648
	ld e,(hl)			;4649   ; E = verde
	inc hl			;464a
	call pon_color		;464b   ; lo pone
	jr pon_paleta_con_espera		;464e
espera_vdp:		; espera a que el VDP acabe la orden en curso (S#2 bit 0)
	push af			;4650
L_4651:
	ld a,002h		;4651   ; S#2...
	call lee_estado_vdp		;4653   ; lee_estado_vdp: A = el registro de estado A del VDP (por R#15, que vuelve a 0)
	rra			;4656   ; ...bit 0 (CE): la orden sigue en curso
	jp c,L_4651		;4657
	pop af			;465a
	ret			;465b
lee_estado_vdp:		; A = el registro de estado A del VDP (por R#15, que vuelve a 0)
	push bc			;465c
	push hl			;465d
	ld hl,(00006h)		;465e   ; 0x0006/0x0007: los puertos del VDP
	inc h			;4661   ; el de control para escribir...
	inc l			;4662   ; ...y el de estado para leer
	ld c,h			;4663
	di			;4664
	out (c),a		;4665   ; el numero de registro...
	ld a,08fh		;4667   ; ...a R#15
	out (c),a		;4669
	ld c,l			;466b
	in a,(c)		;466c   ; lo lee
	push af			;466e
	xor a			;466f   ; R#15 = 0 otra vez (la BIOS lo espera asi)
	ld c,h			;4670
	out (c),a		;4671
	ld a,08fh		;4673
	out (c),a		;4675
	pop af			;4677
	pop hl			;4678
	pop bc			;4679
	ei			;467a
	ret			;467b
linea_horizontal:		; orden LINE del VDP (R#36-R#46) con el lado largo en X
	ld d,000h		;467c   ; ARG = 0: el lado largo en X
	jr L_4682		;467e
linea_vertical:		; orden LINE del VDP con el lado largo en Y (ARG = 1)
	ld d,001h		;4680
L_4682:
	ex af,af'			;4682   ; en A la pagina, guardada en el otro AF
	call espera_vdp		;4683   ; espera_vdp: espera a que el VDP acabe la orden en curso (S#2 bit 0)
	push bc			;4686
	ld a,(00007h)		;4687
	inc a			;468a
	ld c,a			;468b
	ld a,024h		;468c   ; desde R#36...
	di			;468e
	out (c),a		;468f
	ld a,091h		;4691   ; ...con autoincremento (0x91 = R#17)
	out (c),a		;4693
	inc c			;4695   ; el puerto de registros indirectos
	inc c			;4696
	out (c),h		;4697   ; DX = H
	xor a			;4699
	out (c),a		;469a
	out (c),l		;469c   ; DY = L
	ex af,af'			;469e
	out (c),a		;469f   ; con la pagina
	pop hl			;46a1   ; H = B, el largo
	xor a			;46a2
	cp h			;46a3   ; si es 0 son 256: el alto a 1
	jr nz,L_46A7		;46a4
	inc a			;46a6
L_46A7:
	dec h			;46a7
	out (c),h		;46a8   ; NX = el largo - 1
	out (c),a		;46aa
	xor a			;46ac
	out (c),a		;46ad   ; NY = 0
	out (c),a		;46af
	out (c),l		;46b1   ; el color = C
	ld a,d			;46b3   ; ARG
	out (c),a		;46b4
	ld a,070h		;46b6   ; 0x70: LINE
	out (c),a		;46b8
	ei			;46ba
	ret			;46bb
marco:		; cuatro lineas: un marco de D x E desde HL
	ld b,e			;46bc   ; la vertical izquierda de E
	call linea_vertical_guarda		;46bd   ; linea_vertical_guarda: p00:4680 guardando AF, HL, DE y BC
	ld b,d			;46c0   ; la horizontal de arriba de D
	call linea_horizontal_guarda		;46c1   ; linea_horizontal_guarda: p00:467C guardando AF, HL, DE y BC
	push hl			;46c4
	push af			;46c5
	ld a,l			;46c6   ; Y + E - 1...
	dec a			;46c7
	add a,e			;46c8
	ld l,a			;46c9
	ld b,d			;46ca   ; ...la de abajo
	pop af			;46cb
	call linea_horizontal_guarda		;46cc   ; linea_horizontal_guarda: p00:467C guardando AF, HL, DE y BC
	pop hl			;46cf
	push af			;46d0
	ld a,h			;46d1   ; X + D - 1...
	dec a			;46d2
	add a,d			;46d3
	ld h,a			;46d4
	ld b,e			;46d5   ; ...la vertical derecha
	pop af			;46d6
	jp linea_vertical_guarda		;46d7   ; linea_vertical_guarda: p00:4680 guardando AF, HL, DE y BC
linea_vertical_guarda:		; p00:4680 guardando AF, HL, DE y BC
	push af			;46da
	push hl			;46db
	push de			;46dc
	push bc			;46dd
	call linea_vertical		;46de   ; linea_vertical: orden LINE del VDP con el lado largo en Y (ARG = 1)
	pop bc			;46e1
	pop de			;46e2
	pop hl			;46e3
	pop af			;46e4
	ret			;46e5
linea_horizontal_guarda:		; p00:467C guardando AF, HL, DE y BC
	push af			;46e6
	push hl			;46e7
	push de			;46e8
	push bc			;46e9
	call linea_horizontal		;46ea   ; linea_horizontal: orden LINE del VDP (R#36-R#46) con el lado largo en X
	pop bc			;46ed
	pop de			;46ee
	pop hl			;46ef
	pop af			;46f0
	ret			;46f1
borra_bloque_pagina:		; p00:46FF en la pagina en la que se dibuja (0xCA42)
	push af			;46f2
	ld a,(0ca42h)		;46f3   ; la pagina
	ld d,a			;46f6
	pop af			;46f7
	jr borra_bloque_vram		;46f8
borra_bloque_pagina_0:		; p00:46FF con A = 0 en la pagina en la que se dibuja
	ld a,(0ca42h)		;46fa   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	ld d,a			;46fd
	xor a			;46fe
borra_bloque_vram:		; llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
	ex af,af'			;46ff   ; el color, guardado en el otro AF
	call espera_vdp		;4700   ; espera_vdp: espera a que el VDP acabe la orden en curso (S#2 bit 0)
	push bc			;4703
	ld a,(00007h)		;4704
	inc a			;4707
	ld c,a			;4708
	ld a,024h		;4709   ; desde R#36 con autoincremento
	di			;470b
	out (c),a		;470c
	ld a,091h		;470e
	out (c),a		;4710
	inc c			;4712
	inc c			;4713
	out (c),h		;4714   ; DX = H
	xor a			;4716
	out (c),a		;4717
	out (c),l		;4719   ; DY = L
	out (c),d		;471b   ; la pagina = D
	pop hl			;471d   ; HL = BC: el tamano
	out (c),h		;471e   ; NX = B
	cp h			;4720   ; 0 son 256
	jr nz,L_4724		;4721
	inc a			;4723
L_4724:
	out (c),a		;4724
	xor a			;4726
	out (c),l		;4727   ; NY = C
	cp l			;4729   ; 0 son 256
	jr nz,L_472D		;472a
	inc a			;472c
L_472D:
	out (c),a		;472d
	ex af,af'			;472f
	out (c),a		;4730   ; el color
	xor a			;4732
	out (c),a		;4733
	ld a,0c0h		;4735   ; 0xC0: HMMV
	out (c),a		;4737
	ei			;4739
	ret			;473a
copia_rectangulo_a_3:		; p00:4767 de la pagina 0xCA42 a la 3
	ld a,(0ca42h)		;473b   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	rlca			;473e   ; la pagina en la que se dibuja, de origen...
	rlca			;473f
	or 003h		;4740   ; ...a la 3
	jr copia_rectangulo		;4742
copia_rectangulo_a_2:		; p00:4767 de la pagina 0xCA42 a la 2
	ld a,(0ca42h)		;4744   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	rlca			;4747
	rlca			;4748
	or 002h		;4749   ; a la 2
	jr copia_rectangulo		;474b
copia_rectangulo_a_esta:		; p00:4767 de la otra pagina (0xCA42 ^ 1) a la de 0xCA42
	push bc			;474d
	ld a,(0ca42h)		;474e   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	ld b,a			;4751
	xor 001h		;4752   ; la otra de origen...
	rlca			;4754
	rlca			;4755
	or b			;4756   ; ...a la de 0xCA42
	pop bc			;4757
	jr copia_rectangulo		;4758
copia_rectangulo_a_la_otra:		; p00:4767 de la pagina 0xCA42 a la otra
	push bc			;475a
	ld a,(0ca42h)		;475b   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	xor 001h		;475e   ; la otra de destino
	ld b,a			;4760
	xor 001h		;4761   ; la de 0xCA42 de origen
	rlca			;4763
	rlca			;4764
	or b			;4765
	pop bc			;4766
copia_rectangulo:		; orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
	ex af,af'			;4767   ; las paginas, guardadas en el otro AF
	call espera_vdp		;4768   ; espera_vdp: espera a que el VDP acabe la orden en curso (S#2 bit 0)
	push bc			;476b
	ld a,(00007h)		;476c
	inc a			;476f
	ld c,a			;4770
	ld a,020h		;4771   ; desde R#32 con autoincremento
	di			;4773
	out (c),a		;4774
	ld a,091h		;4776
	out (c),a		;4778
	inc c			;477a
	inc c			;477b
	out (c),h		;477c   ; SX = H
	xor a			;477e
	out (c),a		;477f
	out (c),l		;4781   ; SY = L...
	ex af,af'			;4783
	ld l,a			;4784
	and 003h		;4785   ; ...en la pagina de los bits 0-1
	out (c),a		;4787
	out (c),d		;4789   ; DX = D
	xor a			;478b
	out (c),a		;478c
	out (c),e		;478e   ; DY = E...
	ld a,l			;4790
	rra			;4791   ; ...en la pagina de los bits 2-3
	rra			;4792
	and 003h		;4793
	out (c),a		;4795
	pop hl			;4797   ; HL = BC
	out (c),h		;4798   ; NX = B
	xor a			;479a
	out (c),a		;479b
	out (c),l		;479d   ; NY = C
	out (c),a		;479f
	out (c),a		;47a1
	out (c),a		;47a3
	ld a,0d0h		;47a5   ; 0xD0: HMMM
	out (c),a		;47a7
	ei			;47a9
	ret			;47aa
copia_en_y:		; orden YMMM del VDP
	ex af,af'			;47ab   ; las paginas, guardadas en el otro AF
	call espera_vdp		;47ac   ; espera_vdp: espera a que el VDP acabe la orden en curso (S#2 bit 0)
	ld a,(00007h)		;47af
	inc a			;47b2
	ld c,a			;47b3
	ld a,022h		;47b4   ; desde R#34 con autoincremento
	di			;47b6
	out (c),a		;47b7
	ld a,091h		;47b9
	out (c),a		;47bb
	inc c			;47bd
	inc c			;47be
	out (c),l		;47bf   ; SY = L...
	ex af,af'			;47c1
	ld l,a			;47c2   ; ...en la pagina de los bits 0-1
	and 003h		;47c3
	out (c),a		;47c5
	out (c),h		;47c7   ; DX = H
	xor a			;47c9
	out (c),a		;47ca
	out (c),e		;47cc   ; DY = E...
	ld a,l			;47ce   ; ...en la pagina de los bits 2-3
	rra			;47cf
	rra			;47d0
	and 003h		;47d1
	out (c),a		;47d3
	xor a			;47d5
	out (c),a		;47d6
	out (c),a		;47d8
	out (c),d		;47da   ; NY = D
	cp d			;47dc   ; 0 son 256
	jr nz,L_47E0		;47dd
	inc a			;47df
L_47E0:
	out (c),a		;47e0
	xor a			;47e2
	out (c),a		;47e3
	out (c),a		;47e5
	ld a,0e0h		;47e7   ; 0xE0: YMMM
	out (c),a		;47e9
	ei			;47eb
	ret			;47ec
copia_rectangulo_logica:		; orden LMMM del VDP con la operacion logica de A
	ex af,af'			;47ed   ; paginas (bits 0-3) y operacion logica (bits 4-7), guardadas en el otro AF
	call espera_vdp		;47ee   ; espera_vdp: espera a que el VDP acabe la orden en curso (S#2 bit 0)
	push bc			;47f1
	ld a,(00007h)		;47f2
	inc a			;47f5
	ld c,a			;47f6
	ld a,020h		;47f7   ; desde R#32 con autoincremento
	di			;47f9
	out (c),a		;47fa
	ld a,091h		;47fc
	out (c),a		;47fe
	inc c			;4800
	inc c			;4801
	out (c),h		;4802   ; SX = H
	xor a			;4804
	out (c),a		;4805
	out (c),l		;4807   ; SY = L...
	ex af,af'			;4809
	rlca			;480a
	rlca			;480b
	ld l,a			;480c
	and 003h		;480d   ; ...en su pagina
	out (c),a		;480f
	out (c),d		;4811   ; DX = D
	xor a			;4813
	out (c),a		;4814
	out (c),e		;4816   ; DY = E...
	ld a,l			;4818
	ld e,a			;4819
	rlca			;481a
	rlca			;481b
	and 003h		;481c   ; ...en su pagina
	out (c),a		;481e
	pop hl			;4820   ; HL = BC: el tamano
	ld a,h			;4821
	and a			;4822
	ld a,000h		;4823
	jr nz,L_4828		;4825
	inc a			;4827
L_4828:
	out (c),h		;4828   ; NX = B (0 son 256)
	out (c),a		;482a
	out (c),l		;482c   ; NY = C
	xor a			;482e
	out (c),a		;482f
	out (c),a		;4831
	out (c),a		;4833
	ld a,e			;4835
	rra			;4836   ; la operacion logica...
	rra			;4837
	and 00fh		;4838
	or 090h		;483a   ; ...con 0x90: LMMM
	out (c),a		;483c
	ei			;483e
	ret			;483f
punto:		; orden PSET del VDP con la operacion logica de E
	ex af,af'			;4840   ; el color, guardado en el otro AF
	call espera_vdp		;4841   ; espera_vdp: espera a que el VDP acabe la orden en curso (S#2 bit 0)
	ld a,(00007h)		;4844
	inc a			;4847
	ld c,a			;4848
	ld a,024h		;4849   ; desde R#36
	di			;484b
	out (c),a		;484c
	ld a,091h		;484e
	out (c),a		;4850
	inc c			;4852
	inc c			;4853
	out (c),h		;4854   ; DX = H
	xor a			;4856
	out (c),a		;4857
	out (c),l		;4859   ; DY = L
	out (c),d		;485b   ; la pagina = D
	ld a,(00007h)		;485d
	inc a			;4860
	ld c,a			;4861
	ld a,02ch		;4862   ; desde R#44 con autoincremento
	out (c),a		;4864
	ld a,091h		;4866
	out (c),a		;4868
	inc c			;486a
	inc c			;486b
	ex af,af'			;486c
	out (c),a		;486d   ; el color
	xor a			;486f
	out (c),a		;4870
	ld a,050h		;4872   ; 0x50: PSET con la operacion de E
	or e			;4874
	out (c),a		;4875
	ei			;4877
	ret			;4878
pon_pagina_visible:		; la pagina A a la vista (0xFAF5, DPPAGE de la BIOS)
	ld (0faf5h),a		;4879
	add a,a			;487c   ; A * 16 para R#4 (los patrones de sprite)...
	add a,a			;487d
	add a,a			;487e
	add a,a			;487f
	ld e,a			;4880
	add a,a			;4881   ; ...y A * 32 para R#2
	ld h,a			;4882
	ld a,(0f3e1h)		;4883   ; la copia de R#2...
	and 01fh		;4886   ; ...sin los bits de pagina
	or h			;4888
	ld b,a			;4889
	ld c,002h		;488a   ; R#2: la tabla de nombres (la pagina que se ve)
	call registro_vdp		;488c   ; registro_vdp: escribe B en el registro C del VDP
	ld a,(0f3e3h)		;488f   ; la copia de R#4
	and 00fh		;4892
	or e			;4894
	ld b,a			;4895
	ld c,004h		;4896   ; R#4
	call registro_vdp		;4898   ; registro_vdp: escribe B en el registro C del VDP
	ret			;489b
caracteres_a_4_bits:		; B caracteres de un bit pasados a cuatro con el color C
	call caracter_a_vram		;489c   ; un caracter a la VRAM
	call siguiente_caracter		;489f   ; siguiente_caracter: avanza al siguiente caracter (PR2 p01:6937)
	djnz caracteres_a_4_bits		;48a2   ; B veces
	ret			;48a4
caracter_a_4_bits:		; pasa un caracter de un bit a cuatro con el color C (PR2 p01:6911)
	ld b,008h		;48a5   ; 8 filas
	ld de,0e7c0h		;48a7   ; a 0xE7C0
L_48AA:
	push bc			;48aa
	push hl			;48ab
	ex de,hl			;48ac
	ld a,(de)			;48ad   ; la fila del caracter
	ld d,a			;48ae
	ld b,004h		;48af   ; 4 bytes de dos puntos
L_48B1:
	ld a,c			;48b1   ; el color si el bit esta, si no 0...
	rl d		;48b2
	jr c,L_48B7		;48b4
	xor a			;48b6
L_48B7:
	rld		;48b7   ; ...metido en el nibble
	ld a,c			;48b9
	rl d		;48ba
	jr c,L_48BF		;48bc
	xor a			;48be
L_48BF:
	rld		;48bf
	inc hl			;48c1   ; cada dos puntos, un byte
	djnz L_48B1		;48c2
	ex de,hl			;48c4
	pop hl			;48c5
	inc hl			;48c6   ; la fila siguiente del caracter
	pop bc			;48c7
	djnz L_48AA		;48c8
	ret			;48ca
caracter_a_vram:		; D = X, E = Y: el caracter en 4 bits a la pagina 3 de la VRAM
	push bc			;48cb
	push de			;48cc
	push hl			;48cd
	push de			;48ce
	call caracter_a_4_bits		;48cf   ; a 0xE7C0
	pop de			;48d2
	ld b,d			;48d3   ; intercambia D y E
	ld d,e			;48d4
	ld e,b			;48d5
	srl d		;48d6   ; Y * 128 + X / 2: dos puntos por byte
	rr e		;48d8
	ld a,d			;48da   ; + 0x8000, y con A = 1 (p00:48F3): la pagina 3
	add a,080h		;48db
	ld d,a			;48dd
	ld hl,0e7c0h		;48de   ; desde 0xE7C0
	call filas_a_vram		;48e1   ; las 8 filas
	pop hl			;48e4
	ld bc,00008h		;48e5   ; el caracter siguiente
	add hl,bc			;48e8
	pop de			;48e9
	pop bc			;48ea
	ret			;48eb
filas_a_vram:
	push de			;48ec
	ld b,008h		;48ed   ; 8 filas
L_48EF:
	push bc			;48ef
	ld bc,00004h		;48f0   ; 4 bytes cada una
	ld a,001h		;48f3   ; A = 1: la mitad alta de la VRAM
	call copia_a_vram_espera		;48f5   ; copia_a_vram_espera: espera al VDP (p00:4650) y copia BC bytes de HL a la VRAM de DE
	ex de,hl			;48f8
	ld bc,00080h		;48f9   ; la linea siguiente: 128 bytes
	add hl,bc			;48fc
	ex de,hl			;48fd
	pop bc			;48fe
	djnz L_48EF		;48ff
	pop de			;4901
	ret			;4902
dibujo_a_vram:		; B caracteres de 0xE900 en fila desde la direccion DE de la VRAM
	push bc			;4903
	call filas_a_vram		;4904   ; un caracter: 8 filas de 4 bytes
	ld a,004h		;4907   ; 4 bytes mas alla: 8 puntos a la derecha
	add a,e			;4909
	cp 080h		;490a   ; al llegar al final de la linea (0x80)...
	jr nz,L_4913		;490c
	ld a,004h		;490e   ; ...0x400 mas: 8 lineas de 128 bytes
	add a,d			;4910
	ld d,a			;4911
	xor a			;4912   ; y vuelve a la izquierda
L_4913:
	ld e,a			;4913
	pop bc			;4914
	djnz dibujo_a_vram		;4915
	ret			;4917
letrero_con_sitio:		; [fila][columna] y letras; 0xFE otra posicion, 0xFF acaba
	ld c,0ffh		;4918   ; C = 0xFF: las letras tal cual
	jr $+4		;491a   ; salta la entrada de 0x491C, que pone C = 0 (borra con espacios)

; ----------------------------------------------------------------------
; DATOS sin identificar  0x491c..0x491e  (2 bytes)
DATA_491C:
	defb 00eh,000h	; 491c

; ======================================================================
; CODIGO 0x491e..0x4c6b  (845 bytes)
; ======================================================================


L_491E:
	ld d,(hl)			;491e   ; D = la X
	inc hl			;491f
	ld e,(hl)			;4920   ; E = la Y
	inc hl			;4921
L_4922:
	ld a,(hl)			;4922   ; la letra
	inc hl			;4923
	ld b,a			;4924
	inc b			;4925   ; 0xFF: se acabo
	ret z			;4926
	inc b			;4927   ; 0xFE: otra posicion (vuelve a 0x4918)
	jr z,$-16		;4928
	and c			;492a   ; con C = 0, la letra 0 (en blanco)
	call letra_transparente		;492b   ; la letra, transparente, en la pagina en la que se dibuja
	ld a,d			;492e   ; 8 puntos a la derecha
	add a,008h		;492f
	ld d,a			;4931
	jr L_4922		;4932
letrero_otra_pagina:		; C = 0xFF: las letras tal cual
	ld c,0ffh		;4934
	jr L_493A		;4936
borra_letrero_otra_pagina:		; C = 0: todo en blanco
	ld c,000h		;4938
L_493A:
	ld d,(hl)			;493a   ; D = la X
	inc hl			;493b
	ld e,(hl)			;493c   ; E = la Y
	inc hl			;493d
L_493E:
	ld a,(hl)			;493e   ; la letra
	inc hl			;493f
	ld b,a			;4940
	inc b			;4941   ; 0xFF: se acabo
	ret z			;4942
	inc b			;4943   ; 0xFE: otra posicion
	jr z,letrero_otra_pagina		;4944
	and c			;4946   ; con C = 0, la letra 0
	call letra_de_3_a_la_otra		;4947   ; la letra en la otra pagina
	ld a,d			;494a   ; 8 puntos a la derecha
	add a,008h		;494b
	ld d,a			;494d
	jr L_493E		;494e
letrero:		; pinta las letras de HL en DE hasta 0xFF (0xFE salta de linea)
	push de			;4950
L_4951:
	ld a,(hl)			;4951   ; la letra
	ld b,a			;4952
	inc b			;4953   ; 0xFF: se acabo
	jr z,L_4962		;4954
	inc b			;4956   ; 0xFE: salta de linea
	jr z,L_4964		;4957
	call pinta_letra		;4959   ; pinta_letra: pinta la letra A en DE (0xF8 trae una de la segunda pagina)
	ld a,d			;495c   ; 8 puntos a la derecha
	add a,008h		;495d
	ld d,a			;495f
	jr L_4951		;4960
L_4962:
	pop de			;4962
	ret			;4963
L_4964:
	pop de			;4964   ; la X del principio de la linea
	ld a,e			;4965
	add a,009h		;4966   ; 9 lineas mas abajo
	ld e,a			;4968
	inc hl			;4969
	jr letrero		;496a
letra_de_2_a_la_otra:		; la letra A de la pagina 2 a la otra (la que no se dibuja)
	push af			;496c
	ld a,(0ca42h)		;496d   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	xor 001h		;4970
	rlca			;4972
	rlca			;4973
	or 002h		;4974   ; bits 0-1 = 2, el origen; bits 2-3 = el destino
L_4976:
	ld (0ca1bh),a		;4976   ; las paginas de la copia
	pop af			;4979
	push bc			;497a
	push hl			;497b
	push de			;497c
	call sitio_de_letra		;497d   ; HL = el sitio de la letra A en la pagina de origen
	ld bc,00808h		;4980   ; 8 x 8 puntos
	ld a,(0ca1bh)		;4983   ; lee las paginas de la copia de una letra o pieza (bits 0-1 origen, 2-3 destino)
	call copia_rectangulo		;4986   ; a DE
	pop de			;4989
	pop hl			;498a
	pop bc			;498b
	ret			;498c
letra_de_3_a_la_otra:		; la letra A de la pagina 3 a la otra
	push af			;498d
	ld a,(0ca42h)		;498e   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	xor 001h		;4991
	rlca			;4993
	rlca			;4994
	or 003h		;4995   ; origen 3
	jr L_4976		;4997
letra_de_3_a_esta:		; la letra A de la pagina 3 a la pagina en la que se dibuja
	push af			;4999
	ld a,(0ca42h)		;499a   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	and a			;499d
	ld a,003h		;499e   ; de la 3 a la 0
	jr z,L_49A4		;49a0
	ld a,007h		;49a2   ; de la 3 a la 1
L_49A4:
	jr L_4976		;49a4
letra_de_3_a_esta_abajo:		; como p00:4999 pero 0x60 lineas mas abajo en la pagina 3
	push bc			;49a6
	push hl			;49a7
	push de			;49a8
	call sitio_de_letra		;49a9   ; HL = el sitio de la letra A
	ld a,l			;49ac   ; 0x60 lineas mas abajo
	add a,060h		;49ad
	ld l,a			;49af
	ld bc,00808h		;49b0   ; 8 x 8 puntos
	ld a,(0ca42h)		;49b3   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	rlca			;49b6
	rlca			;49b7
	or 003h		;49b8   ; de la 3 a la pagina en la que se dibuja
	call copia_rectangulo		;49ba   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
	pop de			;49bd
	pop hl			;49be
	pop bc			;49bf
	ret			;49c0
letra_transparente:		; la letra A de la pagina 3, con el 0 transparente, a la pagina en la que se dibuja
	push bc			;49c1
	push hl			;49c2
	push de			;49c3
	call sitio_de_letra		;49c4   ; HL = el sitio de la letra
	ld bc,00808h		;49c7   ; 8 x 8 puntos
	ld a,(0ca42h)		;49ca   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	rrca			;49cd   ; la pagina, a los bits 4-5...
	rrca			;49ce
	rrca			;49cf
	rrca			;49d0
	or 0c8h		;49d1   ; ...con 0xC8: de la 3, TIMP (el 0 no se copia)
	call copia_rectangulo_logica		;49d3   ; copia_rectangulo_logica: orden LMMM del VDP con la operacion logica de A
	pop de			;49d6
	pop hl			;49d7
	pop bc			;49d8
	ret			;49d9
pieza_de_2_a_la_otra:		; el caracter A de la pagina 2 a la otra
	push af			;49da
	ld a,(0ca42h)		;49db   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	xor 001h		;49de
	rlca			;49e0
	rlca			;49e1
	or 002h		;49e2   ; origen 2
L_49E4:
	ld (0ca1bh),a		;49e4   ; las paginas de la copia
	pop af			;49e7
	push bc			;49e8
	push hl			;49e9
	push de			;49ea
	call sitio_de_caracter		;49eb   ; HL = el sitio del caracter A (desde Y = 0)
	ld bc,00808h		;49ee   ; 8 x 8 puntos
	ld a,(0ca1bh)		;49f1   ; lee las paginas de la copia de una letra o pieza (bits 0-1 origen, 2-3 destino)
	call copia_rectangulo		;49f4   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
	pop de			;49f7
	pop hl			;49f8
	pop bc			;49f9
	ret			;49fa
pieza_de_3_a_3:
	push af			;49fb
	ld a,00fh		;49fc   ; 0x0F: de la 3 a la 3
	ld (0ca1bh),a		;49fe   ; guarda las paginas de la copia de una letra o pieza (bits 0-1 origen, 2-3 destino)
	jr L_49E4		;4a01
pieza_de_3_a_2:
	push af			;4a03
	ld a,00bh		;4a04   ; 0x0B: de la 3 a la 2
	ld (0ca1bh),a		;4a06   ; guarda las paginas de la copia de una letra o pieza (bits 0-1 origen, 2-3 destino)
	jr L_4A6D		;4a09
pieza_de_sala_a_la_otra:		; el caracter A de la sala (p00:4A36) de la pagina 2 a la otra
	push af			;4a0b
	ld a,(0ca42h)		;4a0c   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	xor 001h		;4a0f
	rlca			;4a11
	rlca			;4a12
	or 002h		;4a13   ; origen 2
L_4A15:
	ld (0ca1bh),a		;4a15   ; las paginas de la copia
	pop af			;4a18
L_4A19:
	push bc			;4a19
	push hl			;4a1a
	push de			;4a1b
	call sitio_de_pieza_de_sala		;4a1c   ; HL = el sitio del caracter A, segun la sala
	ld bc,00808h		;4a1f   ; 8 x 8 puntos
	ld a,(0ca1bh)		;4a22   ; lee las paginas de la copia de una letra o pieza (bits 0-1 origen, 2-3 destino)
	call copia_rectangulo		;4a25   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
	pop de			;4a28
	pop hl			;4a29
	pop bc			;4a2a
	ret			;4a2b
pieza_de_sala_a_esta:		; el caracter A de la sala de la pagina 2 a la pagina en la que se dibuja
	push af			;4a2c
	ld a,(0ca42h)		;4a2d   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	rlca			;4a30
	rlca			;4a31
	or 002h		;4a32
	jr L_4A15		;4a34
sitio_de_pieza_de_sala:		; HL = el sitio en la VRAM del caracter A de la sala
	ld c,000h		;4a36
	ld b,a			;4a38   ; B = el caracter
	and 01fh		;4a39   ; la columna (32 por fila)...
	add a,a			;4a3b
	add a,a			;4a3c
	add a,a			;4a3d
	ld h,a			;4a3e   ; ...* 8 = la X
	ld a,b			;4a3f
	and 0e0h		;4a40   ; la fila (bits 5-7)...
	rrca			;4a42
	rrca			;4a43
	add a,c			;4a44   ; ...* 8 = la Y
	ld l,a			;4a45
	push hl			;4a46
	cp 020h		;4a47   ; las 4 primeras filas miran 0xCA4C...
	ld hl,0ca4ch		;4a49   ; apunta a los 4 bits altos del byte de la sala (p56:BD28)
	jr c,L_4A4F		;4a4c
	inc hl			;4a4e   ; ...las otras 4, 0xCA4D
L_4A4F:
	ld a,(hl)			;4a4f   ; el juego de piezas de la sala (0-7)
	ld b,a			;4a50
	inc b			;4a51   ; B = el juego + 1, para rotar
	add a,a			;4a52   ; * 32: C = la Y del juego
	add a,a			;4a53
	add a,a			;4a54
	add a,a			;4a55
	add a,a			;4a56
	ld c,a			;4a57
	ld a,(0ca75h)		;4a58   ; los bits de 0xCA75...
L_4A5B:
	rla			;4a5b   ; ...el bit 7 - juego al acarreo
	djnz L_4A5B		;4a5c
	ld a,c			;4a5e
	jr nc,L_4A63		;4a5f   ; con el bit a uno, una franja (0x20) mas arriba
	sub 020h		;4a61
L_4A63:
	pop hl			;4a63
	add a,l			;4a64   ; la Y del caracter mas la del juego
	ld l,a			;4a65
	ret			;4a66
pieza_de_2_a_b:		; el caracter A de la pagina 2 a la pagina B
	push af			;4a67
	ld a,b			;4a68
	rlca			;4a69
	rlca			;4a6a
	or 002h		;4a6b   ; origen 2
L_4A6D:
	ld (0ca1bh),a		;4a6d   ; las paginas de la copia
	pop af			;4a70
	push bc			;4a71
	push hl			;4a72
	push de			;4a73
	call sitio_en_franja		;4a74   ; HL = el sitio del caracter A en la franja C
	ld bc,00808h		;4a77   ; 8 x 8 puntos
	ld a,(0ca1bh)		;4a7a   ; lee las paginas de la copia de una letra o pieza (bits 0-1 origen, 2-3 destino)
	call copia_rectangulo		;4a7d   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
	pop de			;4a80
	pop hl			;4a81
	pop bc			;4a82
	ret			;4a83
pieza_de_3_a_b:
	push af			;4a84
	ld a,b			;4a85
	rlca			;4a86
	rlca			;4a87
	or 003h		;4a88   ; origen 3
	jr L_4A6D		;4a8a
pieza_de_sala_transparente:		; el caracter A de la sala, con el 0 transparente, a la otra pagina
	push bc			;4a8c
	push hl			;4a8d
	push de			;4a8e
	call sitio_de_pieza_de_sala		;4a8f   ; HL = el sitio del caracter, segun la sala
	ld bc,00808h		;4a92   ; 8 x 8 puntos
	ld a,(0ca42h)		;4a95   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	xor 001h		;4a98   ; la otra pagina, a los bits 4-5...
	rlca			;4a9a
	rlca			;4a9b
	rlca			;4a9c
	rlca			;4a9d
	or 088h		;4a9e   ; ...con 0x88: de la 2, TIMP
	call copia_rectangulo_logica		;4aa0   ; copia_rectangulo_logica: orden LMMM del VDP con la operacion logica de A
	pop de			;4aa3
	pop hl			;4aa4
	pop bc			;4aa5
	ret			;4aa6
pieza_transparente_de_2_a_b:
	push af			;4aa7
	ld a,b			;4aa8
	rlca			;4aa9   ; la pagina B a los bits 4-5
	rlca			;4aaa
	rlca			;4aab
	rlca			;4aac
	or 080h		;4aad   ; de la 2...
L_4AAF:
	or 008h		;4aaf   ; ...con TIMP
	ld (0ca1bh),a		;4ab1   ; guarda las paginas de la copia de una letra o pieza (bits 0-1 origen, 2-3 destino)
	pop af			;4ab4
	push bc			;4ab5
	push hl			;4ab6
	push de			;4ab7
	call sitio_en_franja		;4ab8   ; HL = el sitio del caracter A en la franja C
	ld bc,00808h		;4abb   ; 8 x 8 puntos
	ld a,(0ca1bh)		;4abe   ; lee las paginas de la copia de una letra o pieza (bits 0-1 origen, 2-3 destino)
	call copia_rectangulo_logica		;4ac1   ; copia_rectangulo_logica: orden LMMM del VDP con la operacion logica de A
	pop de			;4ac4
	pop hl			;4ac5
	pop bc			;4ac6
	ret			;4ac7
pieza_transparente_de_3_a_b:
	push af			;4ac8
	ld a,b			;4ac9
	rlca			;4aca
	rlca			;4acb
	rlca			;4acc
	rlca			;4acd
	or 0c0h		;4ace   ; de la 3
	jr L_4AAF		;4ad0
sitio_en_franja:		; HL = el sitio del caracter A en la franja C (0-3, de 64 lineas)
	push bc			;4ad2
	push af			;4ad3
	ld a,c			;4ad4   ; C * 64: la Y de la franja
	rrca			;4ad5
	rrca			;4ad6
	and 0c0h		;4ad7
	ld c,a			;4ad9
	pop af			;4ada
	call sitio_de_caracter_c		;4adb   ; sitio_de_caracter_c: HL = (X, Y) del caracter A: 32 por fila de 8 x 8, desde Y = C
	pop bc			;4ade
	ret			;4adf
sitio_en_franja_c0:		; en la franja de Y = 0xC0
	ld c,0c0h		;4ae0
	jr sitio_de_caracter_c		;4ae2
sitio_de_caracter:		; desde Y = 0
	ld c,000h		;4ae4
	jr sitio_de_caracter_c		;4ae6
sitio_de_letra:		; desde Y = 0
	ld c,000h		;4ae8
sitio_de_caracter_c:		; HL = (X, Y) del caracter A: 32 por fila de 8 x 8, desde Y = C
	ld b,a			;4aea
	and 01fh		;4aeb   ; la columna...
	add a,a			;4aed
	add a,a			;4aee
	add a,a			;4aef
	ld h,a			;4af0   ; ...* 8 = la X
	ld a,b			;4af1
	and 0e0h		;4af2   ; la fila (bits 5-7)...
	rrca			;4af4   ; ...* 8...
	rrca			;4af5
	add a,c			;4af6   ; ...mas C = la Y
	ld l,a			;4af7
	ret			;4af8
siguiente_caracter:		; avanza al siguiente caracter (PR2 p01:6937)
	ld a,d			;4af9   ; 8 puntos a la derecha
	add a,008h		;4afa
	ld d,a			;4afc
	ret nz			;4afd   ; si no da la vuelta, ya esta
	ld a,e			;4afe   ; al acabar la fila, 8 lineas mas abajo
	add a,008h		;4aff
	ld e,a			;4b01
	ret			;4b02
dibujo_1_bit:		; B caracteres de un bit por punto a 0xE900 y a la VRAM
	push bc			;4b03   ; el numero de caracteres
	push de			;4b04   ; y donde van
	exx			;4b05
	ld hl,0e900h		;4b06   ; los pasa a 0xE900
	exx			;4b09
L_4B0A:
	push bc			;4b0a
	call caracter_1_bit		;4b0b   ; uno de 8 bytes
	pop bc			;4b0e
	djnz L_4B0A		;4b0f
	pop de			;4b11
	pop bc			;4b12
	ld hl,0e900h		;4b13   ; y desde 0xE900...
	jp dibujo_a_vram		;4b16   ; ...a la VRAM
caracter_1_bit:		; un caracter de un bit por punto (PR2 p00:4C4A)
	ld b,008h		;4b19   ; 8 filas
L_4B1B:
	ld e,(hl)			;4b1b   ; un byte por fila
	inc hl			;4b1c
	push bc			;4b1d
	call fila_1_bit		;4b1e   ; pasada a 4 bytes
	pop bc			;4b21
	djnz L_4B1B		;4b22
	ret			;4b24
fila_1_bit:		; una fila de un bit por punto (PR2 p00:4C56)
	ld b,004h		;4b25   ; 4 bytes de dos puntos
L_4B27:
	xor a			;4b27   ; el bit del primer punto...
	rl e		;4b28
	rla			;4b2a
	exx			;4b2b
	ld e,a			;4b2c   ; ...es el indice de la tabla de colores de 0xE800
	ld d,0e8h		;4b2d
	ld a,(de)			;4b2f   ; su color...
	add a,a			;4b30   ; ...al nibble alto
	add a,a			;4b31
	add a,a			;4b32
	add a,a			;4b33
	ld c,a			;4b34
	exx			;4b35
	xor a			;4b36   ; el bit del segundo punto
	rl e		;4b37
	rla			;4b39
	exx			;4b3a
	ld e,a			;4b3b
	ld d,0e8h		;4b3c
	ld a,(de)			;4b3e   ; su color al nibble bajo
	or c			;4b3f
	ld (hl),a			;4b40   ; el byte de dos puntos a 0xE900
	inc hl			;4b41
	exx			;4b42
	djnz L_4B27		;4b43
	ret			;4b45
dibujo_2_bits:		; B caracteres de dos bits por punto a 0xE900 y a la VRAM
	push bc			;4b46   ; el numero de caracteres
	push de			;4b47   ; y donde van
	exx			;4b48
	ld hl,0e900h		;4b49   ; los pasa a 0xE900
	exx			;4b4c
L_4B4D:
	push bc			;4b4d
	call caracter_2_bits		;4b4e   ; uno de 16 bytes
	pop bc			;4b51
	djnz L_4B4D		;4b52
	pop de			;4b54
	pop bc			;4b55
	ld hl,0e900h		;4b56   ; y desde 0xE900...
	jp dibujo_a_vram		;4b59   ; ...a la VRAM
caracter_2_bits:		; 8 filas de dos bytes
	ld b,008h		;4b5c
L_4B5E:
	push bc			;4b5e
	call fila_2_bits		;4b5f   ; fila_2_bits: una fila de dos bits por punto (PR2 p00:4CAD)
	pop bc			;4b62
	djnz L_4B5E		;4b63
	ret			;4b65
fila_2_bits:		; una fila de dos bits por punto (PR2 p00:4CAD)
	ld b,004h		;4b66   ; 4 bytes de dos puntos
	ld e,(hl)			;4b68   ; los dos planos de la fila
	inc hl			;4b69
	ld d,(hl)			;4b6a
	inc hl			;4b6b
L_4B6C:
	xor a			;4b6c   ; los dos bits del primer punto...
	rl d		;4b6d
	rla			;4b6f
	rl e		;4b70
	rla			;4b72
	exx			;4b73
	ld e,a			;4b74   ; ...son el indice de la tabla de colores de 0xE800
	ld d,0e8h		;4b75
	ld a,(de)			;4b77   ; su color...
	add a,a			;4b78   ; ...al nibble alto
	add a,a			;4b79
	add a,a			;4b7a
	add a,a			;4b7b
	ld c,a			;4b7c
	exx			;4b7d
	xor a			;4b7e   ; los dos bits del segundo punto
	rl d		;4b7f
	rla			;4b81
	rl e		;4b82
	rla			;4b84
	exx			;4b85
	ld e,a			;4b86
	ld d,0e8h		;4b87
	ld a,(de)			;4b89   ; su color al nibble bajo
	or c			;4b8a
	ld (hl),a			;4b8b   ; el byte de dos puntos a 0xE900
	inc hl			;4b8c
	exx			;4b8d
	djnz L_4B6C		;4b8e
	ret			;4b90
dibujo_3_bits:		; B caracteres de tres bits por punto a 0xE900 y a la VRAM
	push bc			;4b91   ; el numero de caracteres
	push de			;4b92   ; y donde van
	exx			;4b93
	ld hl,0e900h		;4b94   ; los pasa a 0xE900
	exx			;4b97
L_4B98:
	push bc			;4b98
	call caracter_3_bits		;4b99   ; uno de 24 bytes
	pop bc			;4b9c
	djnz L_4B98		;4b9d
	pop de			;4b9f
	pop bc			;4ba0
	ld hl,0e900h		;4ba1   ; y desde 0xE900...
	jp dibujo_a_vram		;4ba4   ; ...a la VRAM
caracter_3_bits:		; 8 filas de tres bytes
	ld b,008h		;4ba7
L_4BA9:
	push bc			;4ba9
	call fila_3_bits		;4baa   ; fila_3_bits: una fila de tres bits por punto (PR2 p00:4D04)
	pop bc			;4bad
	djnz L_4BA9		;4bae
	ret			;4bb0
fila_3_bits:		; una fila de tres bits por punto (PR2 p00:4D04)
	ld b,004h		;4bb1   ; 4 bytes de dos puntos
	ld e,(hl)			;4bb3   ; los tres planos de la fila
	inc hl			;4bb4
	ld d,(hl)			;4bb5
	inc hl			;4bb6
	ld c,(hl)			;4bb7
	inc hl			;4bb8
L_4BB9:
	xor a			;4bb9   ; los tres bits del primer punto...
	rl c		;4bba
	rla			;4bbc
	rl d		;4bbd
	rla			;4bbf
	rl e		;4bc0
	rla			;4bc2
	exx			;4bc3   ; ...son el indice de la tabla de colores de 0xE800
	ld e,a			;4bc4
	ld d,0e8h		;4bc5
	ld a,(de)			;4bc7   ; su color...
	add a,a			;4bc8   ; ...al nibble alto
	add a,a			;4bc9
	add a,a			;4bca
	add a,a			;4bcb
	ld c,a			;4bcc
	exx			;4bcd
	xor a			;4bce   ; los tres bits del segundo punto
	rl c		;4bcf
	rla			;4bd1
	rl d		;4bd2
	rla			;4bd4
	rl e		;4bd5
	rla			;4bd7
	exx			;4bd8
	ld e,a			;4bd9
	ld d,0e8h		;4bda
	ld a,(de)			;4bdc   ; su color al nibble bajo
	or c			;4bdd
	ld (hl),a			;4bde   ; el byte de dos puntos a 0xE900
	inc hl			;4bdf
	exx			;4be0
	djnz L_4BB9		;4be1
	ret			;4be3
borra_toda_la_pagina:		; p00:46FF desde (0,0) con BC = 0 y A = 0 en la pagina D
	xor a			;4be4   ; el color 0
	ld h,a			;4be5   ; desde (0, 0)
	ld l,a			;4be6
	ld b,a			;4be7   ; 256 x 256 (0 son 256)
	ld c,a			;4be8
	jp borra_bloque_vram		;4be9   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
piezas_en_pagina_2:		; borra la pagina 2...
	ld d,002h		;4bec
	call borra_toda_la_pagina		;4bee   ; borra_toda_la_pagina: p00:46FF desde (0,0) con BC = 0 y A = 0 en la pagina D
	call bancos_32_33_34		;4bf1   ; ...con los bancos 32-34...
	call piezas_de_zona		;4bf4   ; ...pinta las piezas de la zona...
	ld c,000h		;4bf7   ; ...en la franja 0...
	call dibujos_de_zona		;4bf9   ; ...y los dibujos de la zona
	jp bancos_1_2_3		;4bfc   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
dibujos_de_zona:		; la cabecera de p32:6000 de la zona (0xCA4A)
	call bancos_de_zona		;4bff   ; bancos_de_zona: 32-33-34 y el juego de bancos de la zona (p00:4C77)
	ld a,(0ca4ah)		;4c02   ; la zona...
	ld hl,06000h		;4c05   ; ...en la tabla de p32:6000
	call palabra_de_tabla		;4c08   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld a,c			;4c0b   ; C: 0 todas las listas, 1 solo las dos ultimas
	jp pinta_juego_de_dibujos		;4c0c   ; pinta_juego_de_dibujos: [VRAM] y 8 listas de p00:4D92 (0 = ninguna)
piezas_de_zona:		; las piezas de la zona: p32:6E4D, fichas de 6 bytes hasta 0xFF
	call bancos_32_33_34		;4c0f   ; bancos_32_33_34: pone el 32 en 0x6000, el 33 en 0x8000, el 34 en 0xA000 (con su copia en 0xC381-0xC383)
	ld a,(0ca4ah)		;4c12   ; lee la zona
	ld hl,06e4dh		;4c15   ; las piezas de la zona
	call palabra_de_tabla		;4c18   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
L_4C1B:
	ld a,(hl)			;4c1b   ; la primera ficha
	cp 0ffh		;4c1c   ; 0xFF: se acabo
	jp z,bancos_1_2_3		;4c1e   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call pinta_pieza		;4c21   ; la ficha de 6 bytes
	jr L_4C1B		;4c24
pinta_pieza:		; una ficha de piezas: sus bancos, sus colores, su lista y su sitio
	push hl			;4c26
	call bancos_por_juego		;4c27   ; el primer byte: el juego de bancos
	pop hl			;4c2a
	inc hl			;4c2b
	ld e,(hl)			;4c2c   ; DE = la tabla de colores
	inc hl			;4c2d
	ld d,(hl)			;4c2e
	inc hl			;4c2f
	ld c,(hl)			;4c30   ; BC = la lista de dibujos
	inc hl			;4c31
	ld b,(hl)			;4c32
	inc hl			;4c33
	ld a,(hl)			;4c34   ; A = el byte de sitio
	push hl			;4c35
	ld h,b			;4c36   ; HL = la lista
	ld l,c			;4c37
	call pinta_pieza_en		;4c38   ; pinta_pieza_en: la VRAM de la pieza sale del byte de sitio (bits 7-6 y 5-0)
	pop hl			;4c3b
	inc hl			;4c3c   ; la ficha siguiente
	ret			;4c3d
pinta_pieza_en:		; la VRAM de la pieza sale del byte de sitio (bits 7-6 y 5-0)
	ld b,a			;4c3e
	rla			;4c3f   ; el bit 7: C = 0x10
	ld c,010h		;4c40
	jr c,L_4C4B		;4c42
	rla			;4c44   ; el bit 6: C = 0xF0
	ld c,0f0h		;4c45
	jr c,L_4C4B		;4c47
	ld c,000h		;4c49   ; ninguno: C = 0
L_4C4B:
	ld a,b			;4c4b
	and 03fh		;4c4c   ; los 3 bits bajos...
	add a,a			;4c4e   ; ...* 0x20 (lo de mas arriba se pierde)...
	add a,a			;4c4f
	add a,a			;4c50
	add a,a			;4c51
	add a,a			;4c52
	add a,c			;4c53   ; ...mas C: B = el byte alto de la VRAM
	ld b,a			;4c54
	jp pinta_dibujos		;4c55   ; pinta_dibujos: la lista de dibujos de HL con la tabla de colores de DE y la VRAM de B (fichas de 5 bytes hasta 0xFF)
bancos_de_zona:		; 32-33-34 y el juego de bancos de la zona (p00:4C77)
	call bancos_32_33_34		;4c58   ; bancos_32_33_34: pone el 32 en 0x6000, el 33 en 0x8000, el 34 en 0xA000 (con su copia en 0xC381-0xC383)
	ld a,(0ca4ah)		;4c5b   ; la zona...
	ld b,a			;4c5e   ; (B = la zona)
	ld hl,04c77h		;4c5f   ; ...en la tabla de p00:4C77: el juego de bancos
	call byte_de_tabla		;4c62   ; byte_de_tabla: A = el byte A de la tabla de HL (y HL apunta a el)
bancos_por_juego:		; pone el juego de bancos A (p00:4C6B)
	ld hl,04c6bh		;4c65   ; seis juegos: 32-34, 35-37, 38-39, 40-41, 42-43, 44-45
	call despachador		;4c68   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_4C6B: 6 destinos del despachador p00:424D (call en p00:4C68, el
;   indice en A): 4104, 4109, 415D, 4162, 4167, 416C; lo leen p00:4C68 (12
;   bytes)
;   0x4c6b..0x4c77  (12 bytes)
DATA_tabla_4C6B:
	defw 04104h,04109h,0415dh,04162h,04167h,0416ch	; 4c6b

; ----------------------------------------------------------------------
; DATOS resto_4C77: lo apuntan con el banco puesto p00:4C5F (0x4C77); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p00:4C5F (20 bytes)
;   0x4c77..0x4c8b  (20 bytes)
DATA_resto_4C77:
	defb 000h,002h,002h,003h,003h,004h,004h,004h,005h,000h,000h,003h,003h,003h,003h,003h	; 4c77  ................
	defb 003h,004h,000h,005h	; 4c87

; ======================================================================
; CODIGO 0x4c8b..0x4d3a  (175 bytes)
; ======================================================================


colores_ae19_bancos_9:
	call colores_ae19		;4c8b   ; colores_ae19: los bancos de la zona
	jp bancos_1_2_9		;4c8e   ; bancos_1_2_9: pone el 1 en 0x6000, el 2 en 0x8000, el 9 en 0xA000 (con su copia en 0xC381-0xC383)
colores_ae19_bancos_10:
	call colores_ae19		;4c91   ; colores_ae19: los bancos de la zona
	jp bancos_1_2_10		;4c94   ; bancos_1_2_10: pone el 1 en 0x6000, el 2 en 0x8000, el 10 en 0xA000 (con su copia en 0xC381-0xC383)
colores_ae19:		; los bancos de la zona
	call bancos_de_zona		;4c97   ; bancos_de_zona: 32-33-34 y el juego de bancos de la zona (p00:4C77)
	ld hl,0ae19h		;4c9a   ; la lista de dibujos de 0xAE19...
	ld de,06648h		;4c9d   ; ...con los colores de 0x6648...
	call dibujos_en_6000		;4ca0   ; ...en la VRAM de 0x6000
	jp bancos_1_2_9		;4ca3   ; bancos_1_2_9: pone el 1 en 0x6000, el 2 en 0x8000, el 9 en 0xA000 (con su copia en 0xC381-0xC383)
dibujos_a34b:		; los bancos 32-34...
	call bancos_32_33_34		;4ca6   ; bancos_32_33_34: pone el 32 en 0x6000, el 33 en 0x8000, el 34 en 0xA000 (con su copia en 0xC381-0xC383)
	call bancos_42_43		;4ca9   ; ...con el 42 y el 43
	ld hl,0a34bh		;4cac   ; lista_A34B: 13 fichas de dibujo de 5 bytes [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF
	ld de,0649ch		;4caf   ; tabla_colores_649C: 31 punteros a colores de dibujo
	call dibujos_en_2000		;4cb2   ; en la VRAM de 0x2000
	jp bancos_1_13_14		;4cb5   ; y los bancos 1, 13 y 14
dibujos_de_sala:		; con 0xCA77 puesto, p02:8578
	ld a,(0ca77h)		;4cb8
	and a			;4cbb
	jp nz,08578h		;4cbc   ; dibujos_b845: los dibujos de p37:B845 con los colores de p37:B809 en la VRAM de 0x6000
	ld a,(0ca4ah)		;4cbf   ; lee la zona
	ld c,a			;4cc2
	ld a,(0ca4bh)		;4cc3   ; lee la sala de la zona
	ld b,a			;4cc6
	ld a,c			;4cc7
	cp 004h		;4cc8   ; (la zona 4 no hace nada distinto: el salto cae en la instruccion siguiente)
	jr nz,L_4CCC		;4cca
L_4CCC:
	ld a,(0ca4ah)		;4ccc   ; la zona 0x0A...
	cp 00ah		;4ccf
	jr nz,L_4CDB		;4cd1
	ld a,(0ca4bh)		;4cd3   ; ...sala 0x1B...
	cp 01bh		;4cd6
	jp z,piezas_en_pagina_2		;4cd8   ; ...pinta la pagina 2 entera (p00:4BEC)
L_4CDB:
	ld c,001h		;4cdb   ; solo las dos ultimas listas
	call dibujos_de_zona		;4cdd   ; dibujos_de_zona: la cabecera de p32:6000 de la zona (0xCA4A)
	ld hl,000e0h		;4ce0   ; X = 0, Y = 0xE0 en la pagina 2
	ld bc,00808h		;4ce3   ; 8 x 8 puntos
	ld d,002h		;4ce6
	xor a			;4ce8   ; a cero: el caracter 0xE0 en negro
	call borra_bloque_vram		;4ce9   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
	call piezas_de_tipo_3		;4cec   ; las piezas de tipo 3
	jp bancos_1_2_3		;4cef   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
piezas_de_tipo_3:		; de las piezas de la zona...
	ld a,(0ca4ah)		;4cf2   ; lee la zona
	ld hl,06e4dh		;4cf5
	call palabra_de_tabla		;4cf8   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
L_4CFB:
	ld a,(hl)			;4cfb   ; la ficha
	cp 0ffh		;4cfc   ; 0xFF: se acabo
	jp z,bancos_1_2_3		;4cfe   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	ld d,h			;4d01   ; DE = el principio de la ficha
	ld e,l			;4d02
	ld a,005h		;4d03   ; el byte 5 de la ficha...
	call byte_de_tabla		;4d05   ; byte_de_tabla: A = el byte A de la tabla de HL (y HL apunta a el)
	cp 003h		;4d08   ; ...si vale 3 se pinta
	jr z,L_4D0F		;4d0a
	inc hl			;4d0c   ; si no, la siguiente (HL ya esta en el byte 5)
	jr L_4CFB		;4d0d
L_4D0F:
	ex de,hl			;4d0f   ; la ficha entera
	ld a,(hl)			;4d10
	call pinta_pieza		;4d11   ; pinta_pieza: una ficha de piezas: sus bancos, sus colores, su lista y su sitio
	jr L_4CFB		;4d14
dibujos_7118_bancos_8:
	call dibujos_7118		;4d16   ; dibujos_7118:
	jp bancos_8		;4d19   ; bancos_8: pone el 8 en 0xA000 (con su copia en 0xC381-0xC383)
dibujos_7118:
	call bancos_32_33_34		;4d1c   ; bancos_32_33_34: pone el 32 en 0x6000, el 33 en 0x8000, el 34 en 0xA000 (con su copia en 0xC381-0xC383)
	ld de,06112h		;4d1f   ; tabla_colores_6112: 30 punteros a colores de dibujo
	ld hl,07118h		;4d22   ; lista_7118: 9 fichas de dibujo de 5 bytes [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF
	call dibujos_en_6000		;4d25   ; en la VRAM de 0x6000
	jp bancos_1_2_3		;4d28   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
dibujos_70f9:
	call bancos_32_33_34		;4d2b   ; bancos_32_33_34: pone el 32 en 0x6000, el 33 en 0x8000, el 34 en 0xA000 (con su copia en 0xC381-0xC383)
	ld de,06112h		;4d2e   ; tabla_colores_6112: 30 punteros a colores de dibujo
	ld hl,070f9h		;4d31   ; lista_70F9: 6 fichas de dibujo de 5 bytes [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF
	call dibujos_en_0000		;4d34   ; en la VRAM de 0x0000
	jp bancos_1_2_3		;4d37   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)

; ----------------------------------------------------------------------
; DATOS sin identificar  0x4d3a..0x4d3e  (4 bytes)
DATA_4D3A:
	defb 006h,080h,018h,054h	; 4d3a

; ======================================================================
; CODIGO 0x4d3e..0x4fe2  (676 bytes)
; ======================================================================


dibujos_en_a000:		; en la VRAM de 0xA000
	ld b,0a0h		;4d3e
	jr pinta_dibujos		;4d40
dibujos_en_c000:		; en la VRAM de 0xC000
	ld b,0c0h		;4d42
	jr pinta_dibujos		;4d44
dibujos_en_e000:		; en la VRAM de 0xE000
	ld b,0e0h		;4d46
	jr pinta_dibujos		;4d48
dibujos_en_0000:		; en la VRAM de 0x0000
	ld b,000h		;4d4a
	jr pinta_dibujos		;4d4c
dibujos_en_2000:		; en la VRAM de 0x2000
	ld b,020h		;4d4e
	jr pinta_dibujos		;4d50
dibujos_en_4000:		; en la VRAM de 0x4000
	ld b,040h		;4d52
	jr pinta_dibujos		;4d54
dibujos_en_6000:		; en la VRAM de 0x6000
	ld b,060h		;4d56
	jr pinta_dibujos		;4d58
pinta_juego_de_dibujos:		; [VRAM] y 8 listas de p00:4D92 (0 = ninguna)
	ld (0d8e0h),a		;4d5a   ; 0xD8E0 = 1: solo las listas 6 y 7
	ld e,(hl)			;4d5d   ; DE = la tabla de colores
	inc hl			;4d5e
	ld d,(hl)			;4d5f
	inc hl			;4d60
	ld bc,00800h		;4d61   ; 8 listas, C = el numero
L_4D64:
	ld a,(hl)			;4d64   ; la palabra de la lista...
	inc hl			;4d65
	or (hl)			;4d66   ; ...0: no hay
	jr z,L_4D8D		;4d67
	dec hl			;4d69
	ld a,c			;4d6a   ; las listas 0-5...
	cp 006h		;4d6b
	jr nc,L_4D78		;4d6d
	ld a,(0d8e0h)		;4d6f   ; ...con 0xD8E0 puesto se saltan
	and a			;4d72
	jr z,L_4D78		;4d73
	inc hl			;4d75
	jr L_4D8D		;4d76
L_4D78:
	ld a,(hl)			;4d78   ; HL = la lista
	inc hl			;4d79
	push hl			;4d7a
	ld h,(hl)			;4d7b
	ld l,a			;4d7c
	push bc			;4d7d
	push de			;4d7e
	ld a,c			;4d7f   ; la pareja de la lista (0-3)...
	and 006h		;4d80
	rlca			;4d82   ; ...* 0x20: el byte alto de la VRAM
	rlca			;4d83
	rlca			;4d84
	rlca			;4d85
	ld b,a			;4d86
	call pinta_dibujos		;4d87   ; pinta_dibujos: la lista de dibujos de HL con la tabla de colores de DE y la VRAM de B (fichas de 5 bytes hasta 0xFF)
	pop de			;4d8a
	pop bc			;4d8b
	pop hl			;4d8c
L_4D8D:
	inc hl			;4d8d   ; la palabra siguiente
	inc c			;4d8e
	djnz L_4D64		;4d8f
	ret			;4d91
pinta_dibujos:		; la lista de dibujos de HL con la tabla de colores de DE y la VRAM de B (fichas de 5 bytes hasta 0xFF)
	ld c,000h		;4d92   ; la VRAM empieza en B * 256
	ld (0ca46h),bc		;4d94   ; guarda la base de la VRAM de la lista de dibujos y el byte siguiente (16 bits)
L_4D98:
	ld a,(hl)			;4d98   ; el primer byte de la ficha: tipo (bits 7-6) y cuantos caracteres (5-0)
	ld c,a			;4d99
	inc a			;4d9a   ; 0xFF: se acabo
	ret z			;4d9b
	push de			;4d9c
	inc hl			;4d9d
	ld a,(hl)			;4d9e   ; el segundo: el numero de colores...
	ex de,hl			;4d9f
	call palabra_de_tabla		;4da0   ; ...HL = los colores en la tabla de DE
	push de			;4da3
	push bc			;4da4
	ld a,c			;4da5   ; los bits de color...
	rlca			;4da6
	rlca			;4da7
	rlca			;4da8
	and 006h		;4da9   ; ...2 o 4 bytes (4 u 8 colores); con un bit, 1 byte (2 colores)
	jr nz,L_4DAF		;4dab
	ld a,001h		;4dad
L_4DAF:
	ld b,a			;4daf
	ld de,0e800h		;4db0   ; los colores, uno por byte, a 0xE800
L_4DB3:
	ld a,(hl)			;4db3   ; el nibble alto...
	rrca			;4db4
	rrca			;4db5
	rrca			;4db6
	rrca			;4db7
	and 00fh		;4db8
	ld (de),a			;4dba   ; ...un color
	inc de			;4dbb
	ld a,(hl)			;4dbc   ; el nibble bajo...
	and 00fh		;4dbd
	ld (de),a			;4dbf   ; ...otro
	inc de			;4dc0
	inc hl			;4dc1
	djnz L_4DB3		;4dc2
	pop bc			;4dc4
	pop hl			;4dc5
	inc hl			;4dc6   ; el tercer byte: el sitio
	push hl			;4dc7
	ld a,(hl)			;4dc8
	ld b,a			;4dc9
	and 0e0h		;4dca   ; la fila (bits 7-5)...
	ld h,000h		;4dcc
	ld l,a			;4dce
	add hl,hl			;4dcf   ; ...* 32 * 32: 8 lineas de 128 bytes por fila
	add hl,hl			;4dd0
	add hl,hl			;4dd1
	add hl,hl			;4dd2
	add hl,hl			;4dd3
	ld de,(0ca46h)		;4dd4   ; mas la base
	add hl,de			;4dd8
	ld a,b			;4dd9   ; la columna (bits 4-0)...
	and 01fh		;4dda
	add a,a			;4ddc   ; ...* 4 bytes
	add a,a			;4ddd
	call suma_a_hl		;4dde   ; suma_a_hl: HL = HL + A
	ex de,hl			;4de1   ; DE = la VRAM del primer caracter
	pop hl			;4de2
	ld a,c			;4de3   ; cuantos caracteres
	and 03fh		;4de4
	ld b,a			;4de6
	inc hl			;4de7   ; el cuarto y quinto: los graficos
	ld a,(hl)			;4de8
	inc hl			;4de9
	push hl			;4dea
	ld h,(hl)			;4deb
	ld l,a			;4dec
	call dibujo_por_bits		;4ded   ; los pasa a 4 bits y a la VRAM
	pop hl			;4df0
	pop de			;4df1
	inc hl			;4df2   ; la ficha siguiente
	jr L_4D98		;4df3
dibujo_por_bits:		; elige p00:4B03, 4B46 o 4B91 por los bits 7-6 de C
	ld a,c			;4df5   ; el tipo de la ficha
	rla			;4df6   ; bit 7: tres bits por punto
	jp c,dibujo_3_bits		;4df7   ; dibujo_3_bits: B caracteres de tres bits por punto a 0xE900 y a la VRAM
	rla			;4dfa   ; bit 6: dos
	jp c,dibujo_2_bits		;4dfb   ; dibujo_2_bits: B caracteres de dos bits por punto a 0xE900 y a la VRAM
	jp dibujo_1_bit		;4dfe   ; ninguno: uno
rachas_6517_a_fc00:
	call bancos_35_36_37		;4e01   ; bancos_35_36_37: pone el 35 en 0x6000, el 36 en 0x8000, el 37 en 0xA000 (con su copia en 0xC381-0xC383)
	ld de,06517h		;4e04   ; p35:6517...
	ld hl,0fc00h		;4e07   ; ...a la VRAM de 0xFC00
L_4E0A:
	xor a			;4e0a   ; en la pagina 0 (A = 0)
	call rachas_a_vram_tal_cual		;4e0b   ; rachas_a_vram_tal_cual: p00:453E sin voltear (C = 0)
	jp bancos_1_2_9		;4e0e   ; bancos_1_2_9: pone el 1 en 0x6000, el 2 en 0x8000, el 9 en 0xA000 (con su copia en 0xC381-0xC383)
rachas_935d_a_ff00:
	call bancos_35_36_37		;4e11   ; bancos_35_36_37: pone el 35 en 0x6000, el 36 en 0x8000, el 37 en 0xA000 (con su copia en 0xC381-0xC383)
	ld de,0935dh		;4e14   ; p36:935D...
	ld hl,0ff00h		;4e17   ; ...a la VRAM de 0xFF00
	jr L_4E0A		;4e1a
sprites_de_sala_bancos_9:
	call sprites_de_sala_si		;4e1c   ; sprites_de_sala_si: con 0xE1D0 puesto no se tocan
	jp bancos_1_2_9		;4e1f   ; bancos_1_2_9: pone el 1 en 0x6000, el 2 en 0x8000, el 9 en 0xA000 (con su copia en 0xC381-0xC383)
sprites_de_sala_si:		; con 0xE1D0 puesto no se tocan
	ld a,(0e1d0h)		;4e22
	or a			;4e25
	ret nz			;4e26
	ld a,(0cb4bh)		;4e27   ; ni con 0xCB4B
	or a			;4e2a
	ret nz			;4e2b
	ld a,(0caa0h)		;4e2c   ; con 0xCAA0 en la zona 8...
	and a			;4e2f
	jr z,sprites_de_sala		;4e30
	ld a,(0ca4ah)		;4e32   ; lee la zona
	cp 008h		;4e35
	jr nz,sprites_de_sala		;4e37
	call sprites_de_8c91		;4e39   ; ...p00:4F18...
	ld a,(0caa0h)		;4e3c   ; ...y con 0xCAA0 >= 2, los de p00:4EFA
	cp 002h		;4e3f
	jp nc,L_4EFA		;4e41
sprites_de_sala:		; los sprites de la sala: p35:6000 de la zona, parejas [sala][juego]
	call bancos_35_36_37		;4e44   ; bancos_35_36_37: pone el 35 en 0x6000, el 36 en 0x8000, el 37 en 0xA000 (con su copia en 0xC381-0xC383)
	ld a,(0ca4ah)		;4e47   ; lee la zona
	ld hl,06000h		;4e4a   ; zonas_sprites: 20 punteros, uno por zona
	call palabra_de_tabla		;4e4d   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld c,000h		;4e50
L_4E52:
	ld de,00001h		;4e52   ; por defecto, el juego 1 (D = 0, E = 1)
	ld b,(hl)			;4e55   ; la sala de la pareja
	inc b			;4e56   ; 0xFF: la sala no esta, se queda el de defecto
	jr z,L_4E6D		;4e57
	ld a,(0ca4bh)		;4e59   ; lee la sala de la zona
	cp (hl)			;4e5c   ; es esta sala?
	jr z,L_4E63		;4e5d
	inc hl			;4e5f   ; si no, la pareja siguiente
	inc hl			;4e60
	jr L_4E52		;4e61
L_4E63:
	inc hl			;4e63
	ld c,(hl)			;4e64   ; el juego de la sala...
	ld a,c			;4e65
	ld hl,060b7h		;4e66   ; ...sus dos bloques (p35:60B7)
	call palabra_de_tabla		;4e69   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ex de,hl			;4e6c   ; DE = [segundo][primero]
L_4E6D:
	ld a,e			;4e6d
	cp 014h		;4e6e   ; el bloque 0x14...
	jr nz,L_4E7B		;4e70
	ld a,(0d880h)		;4e72   ; ...con 0xD880 a 0xFF...
	inc a			;4e75
	jr nz,L_4E7B		;4e76
	ld de,00001h		;4e78   ; ...pasa al 1
L_4E7B:
	ld a,e			;4e7b
	cp 010h		;4e7c   ; el bloque 0x10...
	jr nz,L_4E89		;4e7e
	ld a,(0d881h)		;4e80   ; ...con 0xD881 a 0xFF...
	inc a			;4e83
	jr nz,L_4E89		;4e84
	ld de,00013h		;4e86   ; ...pasa al 0x13
L_4E89:
	ld a,e			;4e89
	cp 01ah		;4e8a   ; el bloque 0x1A: p00:4F05
	jp z,sprites_de_b1c3		;4e8c   ; sprites_de_b1c3: el bloque 0x1A no esta en p35: viene de p58:B1C3
	push de			;4e8f
	ld a,e			;4e90
	ld de,0fa00h		;4e91   ; el primer bloque a la VRAM de 0xFA00
	call bloque_de_sprites		;4e94   ; bloque_de_sprites: el bloque de sprites A de p35:60DB a la VRAM de DE (0 = ninguno)
	pop de			;4e97
	ld a,e			;4e98
	cp 001h		;4e99   ; tras el bloque 1...
	jr z,L_4EAE		;4e9b
	cp 004h		;4e9d   ; ...o el 4...
	jr nz,L_4ED6		;4e9f
	push de			;4ea1
	ld de,0668fh		;4ea2   ; ...el 4: las rachas de p35:668F a 0xFF00
	ld hl,0ff00h		;4ea5
	call sprites_y_fichas		;4ea8   ; sprites_y_fichas: rachas de sprites a la VRAM y sus fichas de 4 bytes (p00:5223)
	pop de			;4eab
	jr L_4ED6		;4eac
L_4EAE:
	push de			;4eae
	ld de,06113h		;4eaf   ; el 1: las rachas de p35:6113 a 0xFB80
	ld hl,0fb80h		;4eb2
	call sprites_y_fichas		;4eb5   ; sprites_y_fichas: rachas de sprites a la VRAM y sus fichas de 4 bytes (p00:5223)
	ld c,000h		;4eb8   ; 0xD437 = 0...
	ld a,(0ca4ah)		;4eba   ; ...salvo en la zona 3...
	cp 003h		;4ebd
	jr z,L_4ECC		;4ebf
	cp 00ah		;4ec1   ; ...o en la 0x0A con 0xCA50 >= 4
	jr nz,L_4ED1		;4ec3
	ld a,(0ca50h)		;4ec5   ; lee la fila de la sala en la zona (uno mas al salir por arriba)
	cp 004h		;4ec8
	jr c,L_4ED1		;4eca
L_4ECC:
	call sprites_de_zona_3		;4ecc   ; alli p00:4F27 y 0xD437 = 1
	ld c,001h		;4ecf
L_4ED1:
	ld a,c			;4ed1
	ld (0d437h),a		;4ed2
	pop de			;4ed5
L_4ED6:
	ld a,d			;4ed6   ; el segundo bloque (0 = ninguno)...
	and a			;4ed7
	jr z,L_4EE0		;4ed8
	ld de,0ff80h		;4eda   ; ...a la VRAM de 0xFF80
	call bloque_de_sprites		;4edd   ; bloque_de_sprites: el bloque de sprites A de p35:60DB a la VRAM de DE (0 = ninguno)
L_4EE0:
	call sprites_zona_3_sala_6		;4ee0   ; sprites_zona_3_sala_6: con 0xD882 a 0xFF, nada
	call bancos_1_2_3		;4ee3   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	ld a,(0ca4ah)		;4ee6   ; en la zona 0x0A...
	cp 00ah		;4ee9
	ret nz			;4eeb
	ld a,(0caa0h)		;4eec   ; ...con 0xCAA0...
	and a			;4eef
	ret z			;4ef0
	ld a,(0ca4bh)		;4ef1   ; ...y la sala < 5...
	cp 005h		;4ef4
	ret nc			;4ef6
sprites_zona_0a:		; ...p00:4F18...
	call sprites_de_8c91		;4ef7   ; sprites_de_8c91:
L_4EFA:
	call bancos_35_36_37		;4efa   ; ...y las rachas de p36:8A5D
	ld de,08a5dh		;4efd   ; rachas_8A5D: datos en rachas a la VRAM
	ld hl,0fa00h		;4f00   ; a la VRAM de 0xFA00
	jr sprites_y_fichas_b_1_2_3		;4f03
sprites_de_b1c3:		; el bloque 0x1A no esta en p35: viene de p58:B1C3
	push de			;4f05
	call bancos_58		;4f06   ; bancos_58: pone el 58 en 0xA000 (con su copia en 0xC381-0xC383)
	ld de,0b1c3h		;4f09   ; rachas_B1C3: datos en rachas a la VRAM
	ld hl,0fa00h		;4f0c   ; a la VRAM de 0xFA00
	call sprites_y_fichas		;4f0f   ; sprites_y_fichas: rachas de sprites a la VRAM y sus fichas de 4 bytes (p00:5223)
	call bancos_35_36_37		;4f12   ; vuelve a los bancos 35-37
	pop de			;4f15
	jr L_4ED6		;4f16   ; y sigue con el segundo bloque
sprites_de_8c91:
	call bancos_35_36_37		;4f18   ; bancos_35_36_37: pone el 35 en 0x6000, el 36 en 0x8000, el 37 en 0xA000 (con su copia en 0xC381-0xC383)
	ld de,08c91h		;4f1b   ; rachas_8C91: datos en rachas a la VRAM
	ld hl,0fd00h		;4f1e   ; a la VRAM de 0xFD00
sprites_y_fichas_b_1_2_3:		; sprites_y_fichas y deja los bancos 1, 2 y 3
	call sprites_y_fichas		;4f21   ; sprites_y_fichas: rachas de sprites a la VRAM y sus fichas de 4 bytes (p00:5223)
	jp bancos_1_2_3		;4f24   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
sprites_de_zona_3:		; p36:93E6...
	ld de,093e6h		;4f27
	ld hl,0fd00h		;4f2a   ; ...a la VRAM de 0xFD00
	call sprites_y_fichas		;4f2d   ; sprites_y_fichas: rachas de sprites a la VRAM y sus fichas de 4 bytes (p00:5223)
	ld de,0956fh		;4f30   ; p36:956F...
	ld hl,0fa00h		;4f33   ; ...a 0xFA00
	xor a			;4f36
	call rachas_a_vram_tal_cual		;4f37   ; rachas_a_vram_tal_cual: p00:453E sin voltear (C = 0)
	ld de,095b0h		;4f3a   ; p36:95B0...
	ld hl,0fac0h		;4f3d   ; ...a 0xFAC0
	xor a			;4f40
	call rachas_a_vram_tal_cual		;4f41   ; rachas_a_vram_tal_cual: p00:453E sin voltear (C = 0)
	ld de,095f2h		;4f44   ; p36:95F2...
	ld hl,0fc40h		;4f47   ; ...a 0xFC40
	jr sprites_y_fichas		;4f4a
bloque_de_sprites:		; el bloque de sprites A de p35:60DB a la VRAM de DE (0 = ninguno)
	and a			;4f4c   ; 0: ninguno
	ret z			;4f4d
	ld hl,060dbh		;4f4e   ; los bloques de sprites de p35:60DB
	call palabra_de_tabla		;4f51   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ex de,hl			;4f54   ; DE = el bloque
sprites_y_fichas:		; rachas de sprites a la VRAM y sus fichas de 4 bytes (p00:5223)
	push ix		;4f55
	xor a			;4f57   ; en la pagina 0
	call rachas_a_vram_tal_cual		;4f58   ; las rachas a la VRAM de HL
	inc de			;4f5b   ; detras del 0 de las rachas...
	push de			;4f5c   ; ...van las fichas...
	pop ix		;4f5d
	call fichas_de_sprites		;4f5f   ; ...que dan la vuelta a los patrones
	pop ix		;4f62
	ret			;4f64
sprites_6517_6113:
	call bancos_35_36_37		;4f65   ; bancos_35_36_37: pone el 35 en 0x6000, el 36 en 0x8000, el 37 en 0xA000 (con su copia en 0xC381-0xC383)
	ld de,06517h		;4f68   ; p35:6517...
	ld hl,0fa00h		;4f6b   ; ...a la VRAM de 0xFA00
	xor a			;4f6e
	call rachas_a_vram_tal_cual		;4f6f   ; rachas_a_vram_tal_cual: p00:453E sin voltear (C = 0)
	ld de,06113h		;4f72   ; p35:6113...
	ld hl,0fb80h		;4f75   ; ...a 0xFB80, con sus fichas
	call sprites_y_fichas		;4f78   ; sprites_y_fichas: rachas de sprites a la VRAM y sus fichas de 4 bytes (p00:5223)
	jp bancos_1_4_5		;4f7b   ; bancos_1_4_5: pone el 1 en 0x6000, el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
esconde_sprites_10_31:		; desde el sprite 10 (0xDC28)...
	ld hl,0dc28h		;4f7e
	ld bc,00057h		;4f81   ; ...88 bytes: los 22 ultimos
	jr L_4F8C		;4f84
esconde_sprites_28_31:		; desde el sprite 28 (0xDC70)...
	ld hl,0dc70h		;4f86
	ld bc,0000fh		;4f89   ; ...los 4 ultimos
L_4F8C:
	push af			;4f8c
	ld a,0e0h		;4f8d   ; Y = 0xE0: fuera
	call llena_bloque		;4f8f   ; llena_bloque: pone A en BC + 1 bytes desde HL
	call sprites_a_vram		;4f92   ; y la copia a la VRAM
	pop af			;4f95
	ret			;4f96
sprites_a_vram:		; los colores de los sprites (0xDA00) y detras sus atributos (0xDC00)...
	ld hl,0da00h		;4f97   ; apunta a la copia de la tabla de colores de sprites: 32 x 16 lineas (va con 0xDC00 detras)
	ld de,(0ca0ch)		;4f9a   ; ...a la tabla de colores de sprites de la VRAM
	ld bc,00280h		;4f9e   ; 0x200 de colores mas 0x80 de atributos
	xor a			;4fa1   ; en la pagina 0
	jp copia_a_vram_espera		;4fa2   ; copia_a_vram_espera: espera al VDP (p00:4650) y copia BC bytes de HL a la VRAM de DE
sprites_de_sala_especial_bancos:
	call sprites_de_sala_especial		;4fa5   ; sprites_de_sala_especial: C = la sala, B = 0xCA4C
	jp bancos_1_2_3		;4fa8   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
sprites_de_sala_especial:		; C = la sala, B = 0xCA4C
	ld bc,(0ca4bh)		;4fab   ; lee la sala de la zona y el byte siguiente (16 bits)
	ld a,(0ca76h)		;4faf   ; la sala especial...
	cp 02ah		;4fb2   ; 0x2A: p00:4EF7
	jp z,sprites_zona_0a		;4fb4   ; sprites_zona_0a: ...p00:4F18...
	cp 029h		;4fb7   ; 0x29: p00:5004
	jr z,$+75		;4fb9
	cp 02dh		;4fbb   ; 0x2D: p00:4FFF
	jr z,$+66		;4fbd
	cp 031h		;4fbf   ; 0x31: p00:4FEF
	jr z,$+46		;4fc1
	cp 039h		;4fc3   ; 0x39: p00:4FFA
	jr z,$+53		;4fc5
	cp 018h		;4fc7   ; 0x18...
	jr nz,L_4FD6		;4fc9
	ld a,(0ca51h)		;4fcb   ; ...con 0xCA51 = 7: p00:4F65...
	cp 007h		;4fce
	jp z,sprites_6517_6113		;4fd0   ; sprites_6517_6113:
	jp sprites_zona_0a		;4fd3   ; ...si no, p00:4EF7
L_4FD6:
	ld hl,04fe2h		;4fd6   ; las demas, en la lista de p00:4FE2
L_4FD9:
	ld b,(hl)			;4fd9   ; la sala de la lista...
	inc b			;4fda   ; ...0xFF: no esta, ya esta
	ret z			;4fdb
	cp (hl)			;4fdc   ; si es esta, los de p00:501E
	jr z,$+65		;4fdd
	inc hl			;4fdf   ; la siguiente
	jr L_4FD9		;4fe0

; ----------------------------------------------------------------------
; DATOS resto_4FE2: lo apuntan con el banco puesto p00:4FD6 (0x4FE2); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p00:4FD6 (13 bytes)
;   0x4fe2..0x4fef  (13 bytes)
DATA_resto_4FE2:
	defb 009h,00fh,010h,013h,014h,015h,026h,02bh,02fh,030h,036h,037h,0ffh	; 4fe2  ......&+/067.

; ======================================================================
; CODIGO 0x4fef..0x51b8  (457 bytes)
; ======================================================================


L_4FEF:
	ld de,064dbh		;4fef   ; p35:64DB...
	ld hl,0ff80h		;4ff2   ; ...a la VRAM de 0xFF80
	call espera_vdp		;4ff5   ; espera_vdp: espera a que el VDP acabe la orden en curso (S#2 bit 0)
	jr sprites_de_en		;4ff8
L_4FFA:
	ld de,07463h		;4ffa
	jr sprites_de_a_fa00		;4ffd
L_4FFF:
	ld de,0914bh		;4fff
	jr sprites_de_a_fa00		;5002
L_5004:
	ld a,(0ca4bh)		;5004   ; en las salas 0 y 1, p35:7EC6
	cp 002h		;5007
	jr c,L_501E		;5009
	ld de,07ad8h		;500b   ; en las demas, p35:7AD8
	jr sprites_de_a_fa00		;500e
sprites_de_7762:
	ld de,07762h		;5010
	call sprites_de_a_fa00		;5013   ; sprites_de_a_fa00: las rachas de DE...
	jp bancos_1_4_5		;5016   ; bancos_1_4_5: pone el 1 en 0x6000, el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
sprites_de_8773:
	ld de,08773h		;5019
	jr sprites_de_y_bancos_4_5		;501c
L_501E:
	ld de,07ec6h		;501e
	jr sprites_de_a_fa00		;5021
sprites_zona_3_sala_6:		; con 0xD882 a 0xFF, nada
	ld a,(0d882h)		;5023
	inc a			;5026
	ret z			;5027
	ld a,(0ca4ah)		;5028   ; solo en la zona 3...
	cp 003h		;502b
	ret nz			;502d
	ld a,(0ca4bh)		;502e   ; ...sala 6
	cp 006h		;5031
	ret nz			;5033
	ld de,06a5dh		;5034
sprites_de_y_bancos_4_5:
	call sprites_de_a_fa00		;5037   ; sprites_de_a_fa00: las rachas de DE...
	jp bancos_4_5		;503a   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
sprites_de_a_fa00:		; las rachas de DE...
	call espera_vdp		;503d   ; espera_vdp: espera a que el VDP acabe la orden en curso (S#2 bit 0)
	ld hl,0fa00h		;5040   ; ...a la VRAM de 0xFA00
sprites_de_en:		; con los bancos 35-37
	call bancos_35_36_37		;5043   ; bancos_35_36_37: pone el 35 en 0x6000, el 36 en 0x8000, el 37 en 0xA000 (con su copia en 0xC381-0xC383)
	call sprites_y_fichas		;5046   ; sprites_y_fichas: rachas de sprites a la VRAM y sus fichas de 4 bytes (p00:5223)
	jp bancos_1_2_3		;5049   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
sprites_de_670e:		; p35:670E a 0xFA00
	ld de,0670eh		;504c
	call sprites_de_y_bancos_4_5		;504f   ; sprites_de_y_bancos_4_5:
	call bancos_35_36_37		;5052   ; bancos_35_36_37: pone el 35 en 0x6000, el 36 en 0x8000, el 37 en 0xA000 (con su copia en 0xC381-0xC383)
	xor a			;5055
	ld de,06a29h		;5056   ; y p35:6A29...
	ld hl,0ff80h		;5059   ; ...a 0xFF80
	call rachas_a_vram_tal_cual		;505c   ; rachas_a_vram_tal_cual: p00:453E sin voltear (C = 0)
	call bancos_1_4_5		;505f   ; bancos_1_4_5: pone el 1 en 0x6000, el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	jp bancos_15		;5062   ; bancos_15: pone el 15 en 0xA000 (con su copia en 0xC381-0xC383)
sprites_de_6860:
	ld de,06860h		;5065
	call sprites_de_y_bancos_4_5		;5068   ; sprites_de_y_bancos_4_5:
	jp bancos_15		;506b   ; bancos_15: pone el 15 en 0xA000 (con su copia en 0xC381-0xC383)
sprites_de_858d:		; p36:858D...
	ld de,0858dh		;506e
	ld hl,0fc80h		;5071   ; ...a la VRAM de 0xFC80
	call sprites_de_en		;5074   ; sprites_de_en: con los bancos 35-37
	jp bancos_4_5		;5077   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
L_507A:
	push bc			;507a
	ld bc,0030ch		;507b   ; forma 0x0C en la franja 3
	jp mosaico_con_forma		;507e   ; mosaico_con_forma: guarda la forma (BC de la entrada) en 0xCA48 y pinta el mosaico
L_5081:
	push bc			;5081
	ld bc,0020bh		;5082   ; forma 0x0B en la franja 2
	jp mosaico_con_forma		;5085   ; mosaico_con_forma: guarda la forma (BC de la entrada) en 0xCA48 y pinta el mosaico
L_5088:
	push bc			;5088
	ld bc,00002h		;5089   ; forma 2 en la franja 0
	jr mosaico_con_forma		;508c
L_508E:
	push bc			;508e
	ld bc,00007h		;508f   ; forma 7 en la franja 0
	jr mosaico_con_forma		;5092
L_5094:
	push bc			;5094
	ld bc,00008h		;5095   ; forma 8 en la franja 0
	jr mosaico_con_forma		;5098
L_509A:
	push bc			;509a
	ld bc,00101h		;509b   ; forma 1 en la franja 1
	jr mosaico_con_forma		;509e
L_50A0:
	push bc			;50a0
	ld bc,00102h		;50a1   ; forma 2 en la franja 1
	jr mosaico_con_forma		;50a4
L_50A6:
	push bc			;50a6
	ld bc,00105h		;50a7   ; forma 5 en la franja 1
	jr mosaico_con_forma		;50aa
L_50AC:
	push bc			;50ac
	ld bc,00106h		;50ad   ; forma 6 en la franja 1
	jr mosaico_con_forma		;50b0
L_50B2:
	push bc			;50b2
	ld bc,00107h		;50b3   ; forma 7 en la franja 1
	jr mosaico_con_forma		;50b6
L_50B8:
	push bc			;50b8
	ld bc,00108h		;50b9   ; forma 8 en la franja 1
	jr mosaico_con_forma		;50bc
L_50BE:
	push bc			;50be
	ld bc,00109h		;50bf   ; forma 9 en la franja 1
	jr mosaico_con_forma		;50c2
L_50C4:
	push bc			;50c4
	ld bc,0010ah		;50c5   ; forma 0x0A en la franja 1
	jr mosaico_con_forma		;50c8
L_50CA:
	push bc			;50ca
	ld bc,00200h		;50cb   ; forma 0 en la franja 2
	jr mosaico_con_forma		;50ce
L_50D0:
	push bc			;50d0
	ld bc,00201h		;50d1   ; forma 1 en la franja 2
	jr mosaico_con_forma		;50d4
L_50D6:
	push bc			;50d6
	ld bc,00202h		;50d7   ; forma 2 en la franja 2
	jr mosaico_con_forma		;50da
L_50DC:
	push bc			;50dc
	ld bc,00205h		;50dd   ; forma 5 en la franja 2
	jr mosaico_con_forma		;50e0
L_50E2:
	push bc			;50e2
	ld bc,00207h		;50e3   ; forma 7 en la franja 2
	jr mosaico_con_forma		;50e6
L_50E8:
	push bc			;50e8
	ld bc,00302h		;50e9   ; forma 2 en la franja 3
	jr mosaico_con_forma		;50ec
L_50EE:
	push bc			;50ee
	ld bc,00303h		;50ef   ; forma 3 en la franja 3
	jr mosaico_con_forma		;50f2
L_50F4:
	push bc			;50f4
	ld bc,00304h		;50f5   ; forma 4 en la franja 3
	jr mosaico_con_forma		;50f8
L_50FA:
	push bc			;50fa
	ld bc,00305h		;50fb   ; forma 5 en la franja 3
	jr mosaico_con_forma		;50fe
L_5100:
	push bc			;5100
	ld bc,00307h		;5101   ; forma 7 en la franja 3
	jr mosaico_con_forma		;5104
L_5106:
	push bc			;5106
	ld bc,00308h		;5107   ; forma 8 en la franja 3
mosaico_con_forma:		; guarda la forma (BC de la entrada) en 0xCA48 y pinta el mosaico
	ld (0ca48h),bc		;510a   ; C = la forma (que paginas y si es transparente), B = la franja de origen
	pop bc			;510e   ; BC = B filas de C caracteres
mosaico:		; B filas de C caracteres de HL en DE, de la forma de 0xCA48
	push bc			;510f
	push de			;5110
	ld b,c			;5111   ; C caracteres por fila
L_5112:
	ld a,(hl)			;5112   ; el caracter
	push hl			;5113
	push bc			;5114
	push de			;5115
	call caracter_de_mosaico		;5116   ; lo pinta en DE (D = X, E = Y)
	pop de			;5119
	pop bc			;511a
	pop hl			;511b
	ld a,d			;511c   ; 8 puntos a la derecha
	add a,008h		;511d
	ld d,a			;511f
	inc hl			;5120
	djnz L_5112		;5121
	pop de			;5123
	ld a,e			;5124   ; la fila siguiente, 8 lineas mas abajo
	add a,008h		;5125
	ld e,a			;5127
	pop bc			;5128
	djnz mosaico		;5129
	ret			;512b
caracter_de_mosaico:		; pinta un caracter del mosaico de la forma de 0xCA48
	push af			;512c
	ld bc,(0ca48h)		;512d   ; C = la forma, B = la franja
	ld a,c			;5131
	ld c,b			;5132   ; C = la franja (para p00:4AD2)
	dec a			;5133
	jr z,L_5164		;5134   ; forma 1: de la 3 a las paginas 0 y 1
	dec a			;5136
	jr z,L_5174		;5137   ; forma 2: de la 2 a la pagina en la que se dibuja
	dec a			;5139
	jr z,L_517B		;513a   ; forma 3: de la 2 a la 0
	dec a			;513c
	jr z,L_5181		;513d   ; forma 4: de la 3 a la 3
	dec a			;513f
	jr z,L_5187		;5140   ; forma 5: de la 2 a la otra
	dec a			;5142
	jr z,L_518E		;5143   ; forma 6: de la 3 a la otra
	dec a			;5145
	jr z,L_5195		;5146   ; forma 7: de la 2 a la otra, transparente
	dec a			;5148
	jr z,L_519C		;5149   ; forma 8: de la 2 a la que se dibuja, transparente
	dec a			;514b
	jr z,L_51A3		;514c   ; forma 9: de la 3 a la otra, transparente
	dec a			;514e
	jr z,L_51AA		;514f   ; forma 0x0A: de la 3 a la que se dibuja, transparente
	dec a			;5151
	jr z,L_51B1		;5152   ; forma 0x0B: de la 3 a la 2
	pop af			;5154
	ld b,000h		;5155   ; las demas: de la 3 a las paginas 0 y 1, transparente
	push de			;5157
	push bc			;5158
	push af			;5159
	call pieza_transparente_de_3_a_b		;515a   ; en la 0...
	pop af			;515d
	pop bc			;515e
	pop de			;515f
	inc b			;5160   ; ...y en la 1
	jp pieza_transparente_de_3_a_b		;5161   ; pieza_transparente_de_3_a_b:
L_5164:
	pop af			;5164
	ld b,000h		;5165   ; en la 0...
	push de			;5167
	push bc			;5168
	push af			;5169
	call pieza_de_3_a_b		;516a   ; pieza_de_3_a_b:
	pop af			;516d
	pop bc			;516e
	pop de			;516f
	inc b			;5170   ; ...y en la 1
	jp pieza_de_3_a_b		;5171   ; pieza_de_3_a_b:
L_5174:
	call L_51BE		;5174   ; B = la pagina en la que se dibuja
	pop af			;5177
	jp pieza_de_2_a_b		;5178   ; pieza_de_2_a_b: el caracter A de la pagina 2 a la pagina B
L_517B:
	pop af			;517b
	ld b,000h		;517c   ; B = la 0
	jp pieza_de_2_a_b		;517e   ; pieza_de_2_a_b: el caracter A de la pagina 2 a la pagina B
L_5181:
	pop af			;5181
	ld b,003h		;5182   ; B = la 3
	jp pieza_de_3_a_b		;5184   ; pieza_de_3_a_b:
L_5187:
	call L_51C3		;5187   ; B = la otra
	pop af			;518a
	jp pieza_de_2_a_b		;518b   ; pieza_de_2_a_b: el caracter A de la pagina 2 a la pagina B
L_518E:
	call L_51C3		;518e
	pop af			;5191
	jp pieza_de_3_a_b		;5192   ; pieza_de_3_a_b:
L_5195:
	call L_51C3		;5195
	pop af			;5198
	jp pieza_transparente_de_2_a_b		;5199   ; pieza_transparente_de_2_a_b:
L_519C:
	call L_51BE		;519c
	pop af			;519f
	jp pieza_transparente_de_2_a_b		;51a0   ; pieza_transparente_de_2_a_b:
L_51A3:
	call L_51C3		;51a3
	pop af			;51a6
	jp pieza_transparente_de_3_a_b		;51a7   ; pieza_transparente_de_3_a_b:
L_51AA:
	call L_51BE		;51aa
	pop af			;51ad
	jp pieza_transparente_de_3_a_b		;51ae   ; pieza_transparente_de_3_a_b:
L_51B1:
	call L_51BE		;51b1
	pop af			;51b4
	jp pieza_de_3_a_2		;51b5   ; pieza_de_3_a_2:

; ----------------------------------------------------------------------
; DATOS sin identificar  0x51b8..0x51be  (6 bytes)
DATA_51B8:
	defb 0f1h,006h,000h,0c3h,084h,04ah	; 51b8

; ======================================================================
; CODIGO 0x51be..0x5456  (664 bytes)
; ======================================================================


L_51BE:
	ld a,(0ca42h)		;51be   ; B = la pagina en la que se dibuja
	ld b,a			;51c1
	ret			;51c2
L_51C3:
	ld a,(0ca42h)		;51c3   ; B = la otra pagina
	xor 001h		;51c6
	ld b,a			;51c8
	ret			;51c9
rachas_de_zona_a_e740:
	call bancos_56		;51ca   ; bancos_56: pone el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	ld a,(0ca4ah)		;51cd   ; la zona...
	ld hl,0b747h		;51d0   ; ...en la tabla de p56:B747
	call palabra_de_tabla		;51d3   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ex de,hl			;51d6
	ld hl,0e740h		;51d7   ; deshecha en 0xE740
	call rachas_a_ram		;51da   ; rachas_a_ram: deshace las rachas de DE en HL (n < 0x80 repite, n > 0x80 copia, 0 acaba)
	jp bancos_1_2_3		;51dd   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
rachas_a_ram:		; deshace las rachas de DE en HL (n < 0x80 repite, n > 0x80 copia, 0 acaba)
	ld c,000h		;51e0
L_51E2:
	ld a,(de)			;51e2   ; el byte de la orden
	and a			;51e3   ; 0: se acabo
	ret z			;51e4
	inc de			;51e5
	ld b,a			;51e6
	and 07fh		;51e7   ; sin el bit 7...
	cp b			;51e9   ; ...n < 0x80: una racha
	jr z,L_51F5		;51ea
	ld b,a			;51ec   ; n > 0x80: n & 0x7F bytes tal cual
L_51ED:
	ld a,(de)			;51ed   ; un byte tal cual...
	ld (hl),a			;51ee   ; ...a HL
	inc de			;51ef
	inc hl			;51f0
	djnz L_51ED		;51f1
	jr L_51E2		;51f3   ; la orden siguiente
L_51F5:
	ld a,(de)			;51f5   ; el byte de la racha...
	inc de			;51f6
L_51F7:
	ld (hl),a			;51f7   ; ...n veces
	inc hl			;51f8
	djnz L_51F7		;51f9
	jr L_51E2		;51fb
rotulos_a7b1:
	call bancos_46_47		;51fd   ; bancos_46_47: pone el 46 en 0x8000, el 47 en 0xA000 (con su copia en 0xC381-0xC383)
	push af			;5200   ; A = el numero del rotulo
	ld hl,0a7b1h		;5201   ; la primera parte, de p47:A7B1...
	call palabra_de_tabla		;5204   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld de,04838h		;5207   ; ...en X = 0x48, Y = 0x38...
	ld bc,00106h		;520a   ; ...una fila de 6 caracteres
	call L_50E8		;520d   ; de la franja 3, a la pagina en la que se dibuja
	pop af			;5210
	ld hl,0a7c5h		;5211   ; la segunda, de p47:A7C5...
	call palabra_de_tabla		;5214   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld de,04840h		;5217   ; ...en X = 0x48, Y = 0x40...
	ld bc,00102h		;521a   ; ...una fila de 2 caracteres
	call L_50E8		;521d
	jp bancos_1_2_9		;5220   ; bancos_1_2_9: pone el 1 en 0x6000, el 2 en 0x8000, el 9 en 0xA000 (con su copia en 0xC381-0xC383)
fichas_de_sprites:		; fichas de 4 bytes [orden][cuantos][patron de origen][de destino] hasta una orden 0: 1 da la vuelta de arriba abajo, las demas en espejo
	ld a,(ix+000h)		;5223
	and a			;5226   ; 0: se acabo
	ret z			;5227
	dec a			;5228   ; 1: de arriba abajo
	push af			;5229
	call z,patrones_de_arriba_abajo		;522a   ; patrones_de_arriba_abajo: copia patrones de sprite de 16 x 16 dados la vuelta de arriba abajo
	pop af			;522d
	call nz,patrones_en_espejo		;522e   ; las demas: en espejo
	ld bc,00004h		;5231   ; la ficha siguiente
	add ix,bc		;5234
	jr fichas_de_sprites		;5236
patrones_de_arriba_abajo:		; copia patrones de sprite de 16 x 16 dados la vuelta de arriba abajo
	ld a,(ix+001h)		;5238
	or a			;523b   ; ninguno: nada
	ret z			;523c
	ld (0d8f0h),a		;523d   ; la cuenta
	ld l,(ix+002h)		;5240   ; el patron de origen...
	ld h,000h		;5243
	add hl,hl			;5245   ; ...* 8 bytes...
	add hl,hl			;5246
	add hl,hl			;5247
	ld bc,0f800h		;5248   ; ...en la tabla de patrones de sprites (0xF800)
	add hl,bc			;524b
	ld (0d8f2h),hl		;524c
	ld l,(ix+003h)		;524f   ; el patron de destino
	ld h,000h		;5252
	add hl,hl			;5254
	add hl,hl			;5255
	add hl,hl			;5256
	add hl,bc			;5257
	ld (0d8f4h),hl		;5258
L_525B:
	ld hl,(0d8f2h)		;525b   ; un patron de 16 x 16 (32 bytes) de la VRAM...
	ld de,0e780h		;525e   ; ...a 0xE780
	ld bc,00020h		;5261
	xor a			;5264
	call lee_de_vram_espera		;5265   ; lee_de_vram_espera: espera al VDP y copia BC bytes de la VRAM de HL a DE
	call patron_de_arriba_abajo		;5268   ; le da la vuelta de arriba abajo en 0xE7A0
	ld de,(0d8f4h)		;526b   ; y lo escribe en el patron de destino
	ld hl,0e7a0h		;526f
	ld bc,00020h		;5272
	xor a			;5275
	call copia_a_vram_espera		;5276   ; copia_a_vram_espera: espera al VDP (p00:4650) y copia BC bytes de HL a la VRAM de DE
	ld bc,00020h		;5279   ; los dos, 32 bytes mas alla
	ld hl,(0d8f2h)		;527c
	add hl,bc			;527f
	ld (0d8f2h),hl		;5280
	ld hl,(0d8f4h)		;5283
	add hl,bc			;5286
	ld (0d8f4h),hl		;5287
	ld hl,0d8f0h		;528a   ; uno menos
	dec (hl)			;528d
	jr nz,L_525B		;528e
	ret			;5290
patron_de_arriba_abajo:		; la mitad izquierda (16 lineas)...
	ld hl,0e780h		;5291   ; apunta a las salas de 0xCA76 deshechas (36 bloques cada una)
	ld de,0e7afh		;5294   ; ...al reves en 0xE7A0-0xE7AF
	ld b,010h		;5297
	call L_52A4		;5299
	ld hl,0e790h		;529c   ; la mitad derecha...
	ld de,0e7bfh		;529f   ; ...al reves en 0xE7B0-0xE7BF
	ld b,010h		;52a2
L_52A4:
	ld a,(hl)			;52a4   ; la linea de arriba...
	ld (de),a			;52a5   ; ...abajo
	inc hl			;52a6
	dec de			;52a7
	djnz L_52A4		;52a8
	ret			;52aa
patrones_en_espejo:		; copia patrones de sprite de 16 x 16 en espejo (p00:457A)
	ld a,(ix+001h)		;52ab
	or a			;52ae   ; ninguno: nada
	ret z			;52af
	ld l,(ix+003h)		;52b0   ; el destino...
	ld h,000h		;52b3
	add hl,hl			;52b5   ; ...* 8 bytes...
	add hl,hl			;52b6
	add hl,hl			;52b7
	ld bc,0f810h		;52b8   ; ...en la mitad derecha (0x10 mas) de la tabla de patrones
	add hl,bc			;52bb
	ex de,hl			;52bc
	ld l,(ix+002h)		;52bd   ; el origen
	ld h,000h		;52c0
	add hl,hl			;52c2
	add hl,hl			;52c3
	add hl,hl			;52c4
	ld bc,0f800h		;52c5
	add hl,bc			;52c8
	ld c,(ix+001h)		;52c9   ; C = cuantos
	jp voltea_en_vram		;52cc   ; cada byte con sus bits al reves, y las mitades cambiadas
entra_en_sala:		; entra en la sala nueva (0xD440 = 0)
	xor a			;52cf
	jr L_52D4		;52d0
entra_en_sala_1:		; entra en la sala nueva con 0xD440 = 1
	ld a,001h		;52d2
L_52D4:
	ld (0d440h),a		;52d4   ; 0xD440: donde se guarda la entrada (p00:53FF)
	ld a,(0d8a4h)		;52d7   ; con 0xD8A4 puesto, la entrada corta de p00:54B4
	and a			;52da
	jp nz,entra_en_sala_corta		;52db   ; entra_en_sala_corta: la entrada a la sala con 0xD8A4: menos cosas
	ld a,(0d433h)		;52de   ; con 0xD433 puesto se salta la pregunta
	and a			;52e1
	jr nz,L_52F0		;52e2
	call 07bf1h		;52e4   ; p01:7BF1...
	cp 080h		;52e7   ; ...0x80 o mas: p00:5A25 y a la parte comun
	jr c,L_52F0		;52e9
	call sale_a_la_zona_de_la_sala		;52eb   ; sale_a_la_zona_de_la_sala: limpia lo de la sala
	jr L_5310		;52ee
L_52F0:
	ld a,(0d430h)		;52f0   ; 0xD430 = 2: a la parte comun
	cp 002h		;52f3
	jr z,L_5310		;52f5
	ld a,(0ca4ah)		;52f7   ; en la zona 7...
	cp 007h		;52fa
	jr nz,L_5310		;52fc
	ld bc,(0ca50h)		;52fe   ; ...C = 0xCA50, B = 0xCA51...
	ld a,c			;5302   ; ...con 0xCA50 entre 1 y 4...
	dec a			;5303
	cp 004h		;5304
	jr nc,L_5310		;5306
	ld a,b			;5308   ; ...y 0xCA51 entre 5 y 7: p00:551D
	sub 005h		;5309
	cp 003h		;530b
	jp c,sala_de_la_zona_7		;530d   ; sala_de_la_zona_7: con 0xD433 puesto, p00:55B6
L_5310:
	call 07c52h		;5310   ; la parte comun: una llamada por cada cosa de la sala
	call 0839fh		;5313   ; mira_caa9: 0xCAA9 = 1 en la zona 7, filas 1-3, columnas 5-6, con 0xD430 < 2
	call 083c6h		;5316   ; mira_ca67: 0xCA67 = 1 en la zona 4, sala 9
	call 0823ch		;5319   ; bits_de_la_zona: 0xCA75 = el byte de la zona en p56:A713; A = 0x5D en la sala especial 2
	call carga_y_pinta_sala		;531c   ; carga_y_pinta_sala: la sala 0xCA4B al mapa de 0xDD00 y a la otra pagina, con los casos de la zona 0x12
	xor a			;531f
	ld (0dff8h),a		;5320   ; 0xDFF8 = 0
	call bancos_1_2_3		;5323   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 07df4h		;5326   ; p01:7DF4
	call 08415h		;5329   ; borra_cb80:
	call 08281h		;532c   ; llama_ab91: p06:AB91 guardando el banco de 0xA000
	call 0b1a3h		;532f
	call 08894h		;5332   ; llama_aebb: p06:AEBB con el banco 6 en 0xA000
	call 08290h		;5335   ; llama_abbb: p06:ABBB guardando el banco de 0xA000
	call 083dch		;5338   ; piezas_de_83dc: en las zonas 1-6, fila 3, columna 7: dos piezas (p02:8409) en Y = 0x88, X = 0x58 y 0x60
	call 0836ch		;533b   ; umbrales_de_la_sala: los umbrales de los juegos de piezas de la sala (p56:A727) a 0xCA4E-0xCA4F
	call bancos_12_4_56		;533e   ; bancos_12_4_56: pone el 12 en 0x6000, el 4 en 0x8000, el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0685ah		;5341   ; p12:685A
	call 069cch		;5344   ; p12:69CC
	call a_p12_746b		;5347   ; a_p12_746b: p12:746B con el banco 12 en 0x6000
	call bancos_1_4_5		;534a   ; bancos_1_4_5: pone el 1 en 0x6000, el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0bcf5h		;534d   ; p05:BCF5
	call bancos_8		;5350   ; bancos_8: pone el 8 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0ae7bh		;5353   ; p08:AE7B
	call bancos_1_2_3		;5356   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call marcador_y_ventana		;5359   ; el marcador (p00:5488)
	call apaga_sprites		;535c   ; sin sprites mientras se prepara la sala
	call 0861bh		;535f   ; sprites_zona_12_si: solo con el bit 6 de 0xD7DA
	call sprites_de_sala_si		;5362   ; los sprites de la sala
	call 08475h		;5365   ; paleta_de_la_sala: la paleta comun y la de la sala
	call bancos_1_4_8		;5368   ; bancos_1_4_8: pone el 1 en 0x6000, el 4 en 0x8000, el 8 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a0e6h		;536b   ; p08:A0E6
	call bancos_1_2_3		;536e   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call cambia_de_pagina		;5371   ; cambia de pagina: la sala nueva a la vista
	call 0ba53h		;5374   ; p03:BA53
	call 08b47h		;5377   ; a_p09_a163: p09:A163 con el banco 9 en 0xA000
	call enciende_sprites		;537a   ; otra vez con sprites
	call sala_zona_12_otra_vez		;537d   ; sala_zona_12_otra_vez: en la zona 0x12, las salas 2 (con 0xD888) y 3 (con 0xD881) se pintan otra vez
	ld a,(0cabah)		;5380   ; sin 0xCABA, copia el marcador (p00:54A4)
	and a			;5383
	call z,copia_marcador		;5384   ; copia_marcador: sin 0xCA5F, el marcador de una pagina a la otra
	call bancos_4_5		;5387   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0917ch		;538a   ; p04:917C
	call 088b7h		;538d   ; p04:88B7
	call bancos_1_2_10		;5390   ; bancos_1_2_10: pone el 1 en 0x6000, el 2 en 0x8000, el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a0d3h		;5393   ; p10:A0D3
	call 0a000h		;5396   ; p10:A000
	call 0a477h		;5399   ; p10:A477
	call bancos_1_2_3		;539c   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b4d1h		;539f   ; p03:B4D1
	call bancos_10		;53a2   ; bancos_10: pone el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a82fh		;53a5   ; p10:A82F
	call bancos_1_2_6		;53a8   ; bancos_1_2_6: pone el 1 en 0x6000, el 2 en 0x8000, el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0ac26h		;53ab   ; p06:AC26
	call bancos_11		;53ae   ; bancos_11: pone el 11 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a601h		;53b1   ; p11:A601
	call bancos_1_2_3		;53b4   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b108h		;53b7
	call 08fdfh		;53ba   ; cosas_de_la_sala: las cosas de la sala (0xD7C0) de las listas de p06 y las pinta
	call bancos_14		;53bd   ; bancos_14: pone el 14 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b4b9h		;53c0   ; p14:B4B9
	call 0b6c3h		;53c3   ; p14:B6C3
	call bancos_1_2_15		;53c6   ; bancos_1_2_15: pone el 1 en 0x6000, el 2 en 0x8000, el 15 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0bcb4h		;53c9   ; p15:BCB4
	call bancos_1_2_3		;53cc   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 08b07h		;53cf   ; a_p11_a389: p11:A389 con el banco 11 en 0xA000
	call guarda_la_entrada		;53d2   ; guarda por donde se ha entrado (p00:53FF)
	ld a,(0ca5fh)		;53d5   ; B = 0, o 2 con 0xCA5F puesto
	and a			;53d8
	ld b,000h		;53d9
	jr z,L_53DF		;53db
	ld b,002h		;53dd
L_53DF:
	ld hl,0d41ah		;53df   ; 0xD41A...
	ld a,(hl)			;53e2
	cp 001h		;53e3   ; ...si vale 1 se queda en 1
	jr nz,L_53E8		;53e5
	ld b,a			;53e7
L_53E8:
	ld (hl),b			;53e8   ; si no, B
	ld a,b			;53e9
	ld (0d41fh),a		;53ea   ; y lo mismo en 0xD41F
	call bancos_4_5		;53ed   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0818bh		;53f0   ; p04:818B
	call bancos_1_2_10		;53f3   ; bancos_1_2_10: pone el 1 en 0x6000, el 2 en 0x8000, el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0be6dh		;53f6   ; p10:BE6D
	call 0bc1eh		;53f9   ; p10:BC1E
	jp bancos_1_2_3		;53fc   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
guarda_la_entrada:		; guarda donde ha entrado Snake (su Y y su X dentro de los bordes) y su direccion
	ld a,(0cb03h)		;53ff   ; lee la Y de Snake
	call 08220h		;5402   ; la Y entre 0x12 y 0xBF (p02:8220)...
	ld d,b			;5405   ; ...a D
	ld a,(0cb05h)		;5406   ; lee la X de Snake
	call 0822eh		;5409   ; la X entre 0x09 y 0xB7 (p02:822E)...
	ld e,b			;540c   ; ...a E
	ld a,(0d440h)		;540d   ; 0xD440 elige donde se guarda
	and a			;5410
	ld a,(0cb0eh)		;5411   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ld (0d4f4h),a		;5414   ; tambien en 0xD4F4
	jr nz,L_5421		;5417
	ld hl,0d418h		;5419   ; con 0xD440 = 0: en 0xD418-0xD419...
	ld (0d41eh),a		;541c   ; ...y 0xD41E
	jr L_5427		;541f
L_5421:
	ld hl,0d447h		;5421   ; con 0xD440 = 1: en 0xD447-0xD448...
	ld (0d449h),a		;5424   ; ...y 0xD449
L_5427:
	ld (hl),d			;5427   ; la Y...
	inc hl			;5428
	ld (hl),e			;5429   ; ...y la X
	ret			;542a
limpia_sprites:		; sin sprites, todos fuera en la RAM y en la VRAM, y otra vez con sprites
	call apaga_sprites		;542b   ; apaga_sprites: R#8 con el bit 1 (SPD) a uno, desde la copia 0xFFE7
	call esconde_sprites_ram		;542e   ; esconde_sprites_ram: llena 0xDC00-0xDC7F con 0xE0
	call esconde_sprites_vram		;5431   ; esconde_sprites_vram: llena con 0xE0 128 bytes de la VRAM en 0xF600 y otros 128 en 0xF200
	jp enciende_sprites		;5434   ; enciende_sprites: R#8 con el bit 1 (SPD) a cero, desde la copia 0xFFE7
cambia_de_pagina:		; limpia los sprites...
	call limpia_sprites		;5437   ; limpia_sprites: sin sprites, todos fuera en la RAM y en la VRAM, y otra vez con sprites
	ld hl,0ca42h		;543a   ; apunta a la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	ld a,(hl)			;543d   ; ...y se ve la pagina en la que se ha dibujado...
	xor 001h		;543e   ; ...que deja de ser la de dibujar
	ld (hl),a			;5440
	jp pon_pagina_visible		;5441   ; pon_pagina_visible: la pagina A a la vista (0xFAF5, DPPAGE de la BIOS)
bancos_de_mapa:		; 24-25-26 y los bancos del mapa de la zona (p00:545C)
	call bancos_24_25_26		;5444   ; bancos_24_25_26: pone el 24 en 0x6000, el 25 en 0x8000, el 26 en 0xA000 (con su copia en 0xC381-0xC383)
	ld a,(0ca4ah)		;5447   ; lee la zona
	ld hl,0545ch		;544a   ; el juego de bancos del mapa de la zona (p00:545C)
	call byte_de_tabla		;544d   ; byte_de_tabla: A = el byte A de la tabla de HL (y HL apunta a el)
	and a			;5450   ; 0: solo 24-26
	ret z			;5451
	dec a			;5452
	call despachador		;5453   ; 1: 27-28, 2: 29-30, 3: 31

; ----------------------------------------------------------------------
; DATOS tabla_5456: 3 destinos del despachador p00:424D (call en p00:5453, el
;   indice en A): 4113, 4118, 420B; lo leen p00:5453 (6 bytes)
;   0x5456..0x545c  (6 bytes)
DATA_tabla_5456:
	defw 04113h,04118h,0420bh	; 5456  -> bancos_27_28 bancos_29_30 bancos_31

; ----------------------------------------------------------------------
; DATOS resto_545C: lo apuntan con el banco puesto p00:544A (0x545C), p04:93AC
;   (0x5460), p04:95CD (0x5460), p04:961C (0x5460); el tamano es lo que hay
;   hasta lo siguiente, no sale de recorrerlo; lo leen p00:544A, p04:93AC,
;   p04:95CD, p04:961C (20 bytes)
;   0x545c..0x5470  (20 bytes)
DATA_resto_545C:
	defb 000h,001h,000h,002h,001h,002h,002h,000h,003h,000h,000h,003h,002h,002h,002h,002h	; 545c  ................
	defb 002h,000h,001h,003h	; 546c

; ======================================================================
; CODIGO 0x5470..0x56ef  (639 bytes)
; ======================================================================


marcador_y_ventana_bancos_7:
	call marcador_y_ventana		;5470   ; marcador_y_ventana: con 0xCA5F puesto va por p00:549B
	jp bancos_1_2_7		;5473   ; bancos_1_2_7: pone el 1 en 0x6000, el 2 en 0x8000, el 7 en 0xA000 (con su copia en 0xC381-0xC383)
marcador_y_ventana_bancos_5:
	call marcador_y_ventana		;5476   ; marcador_y_ventana: con 0xCA5F puesto va por p00:549B
	jp bancos_1_4_5		;5479   ; bancos_1_4_5: pone el 1 en 0x6000, el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
copia_marcador_bancos_7:
	call copia_marcador		;547c   ; copia_marcador: sin 0xCA5F, el marcador de una pagina a la otra
	jp bancos_1_2_7		;547f   ; bancos_1_2_7: pone el 1 en 0x6000, el 2 en 0x8000, el 7 en 0xA000 (con su copia en 0xC381-0xC383)
copia_marcador_bancos_5:
	call copia_marcador		;5482   ; copia_marcador: sin 0xCA5F, el marcador de una pagina a la otra
	jp bancos_1_4_5		;5485   ; bancos_1_4_5: pone el 1 en 0x6000, el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
marcador_y_ventana:		; con 0xCA5F puesto va por p00:549B
	ld a,(0ca5fh)		;5488
	and a			;548b
	jr nz,L_549B		;548c
	ld a,(0cabah)		;548e   ; sin 0xCABA, p00:4365
	and a			;5491
	call z,marco_c4		;5492   ; marco_c4: p00:5F90 y las lineas de p00:439D, salvo en la zona 0x12 sala 8 con 0xD8A4
	call L_5FA0		;5495
	jp a_p12_6e3a		;5498   ; a_p12_6e3a: p12:6E3A con el banco 12 en 0x6000
L_549B:
	call L_5FAF		;549b
	call a_p12_6e3a		;549e   ; a_p12_6e3a: p12:6E3A con el banco 12 en 0x6000
	jp ventana_c4_en_la_otra		;54a1   ; y p00:54EA
copia_marcador:		; sin 0xCA5F, el marcador de una pagina a la otra
	ld a,(0ca5fh)		;54a4
	and a			;54a7
	jp z,copia_marcador_a_esta		;54a8   ; copia_marcador_a_esta: copia las lineas 0x16-0x51 de la otra pagina a la de dibujar (YMMM)
	call marco_c4		;54ab   ; con el, p00:4365...
	call L_5FAF		;54ae   ; ...p00:5FAF...
	jp a_p12_6e3a		;54b1   ; ...y p00:5F68
entra_en_sala_corta:		; la entrada a la sala con 0xD8A4: menos cosas
	call 07bf1h		;54b4
	call 0823ch		;54b7   ; bits_de_la_zona: 0xCA75 = el byte de la zona en p56:A713; A = 0x5D en la sala especial 2
	call carga_y_pinta_sala		;54ba   ; carga_y_pinta_sala: la sala 0xCA4B al mapa de 0xDD00 y a la otra pagina, con los casos de la zona 0x12
	call bancos_1_2_3		;54bd   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0836ch		;54c0   ; umbrales_de_la_sala: los umbrales de los juegos de piezas de la sala (p56:A727) a 0xCA4E-0xCA4F
	call sala_banco_15		;54c3   ; sala_banco_15: p15:A005 con el banco 15
	call apaga_sprites		;54c6   ; sin sprites...
	call sprites_de_sala_si		;54c9   ; ...los de la sala...
	call 08475h		;54cc   ; paleta_de_la_sala: la paleta comun y la de la sala
	call cambia_de_pagina		;54cf   ; ...la sala nueva a la vista...
	call enciende_sprites		;54d2   ; ...y otra vez con sprites
	call bancos_4_5		;54d5   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	call 088b7h		;54d8
	jp bancos_1_2_3		;54db   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
ventana_c4_bancos_7:
	call ventana_c4_en_la_otra		;54de   ; ventana_c4_en_la_otra: p00:54FA con la pagina de dibujar cambiada un momento
	jp bancos_7		;54e1   ; bancos_7: pone el 7 en 0xA000 (con su copia en 0xC381-0xC383)
ventana_c4_bancos_7_b:
	call ventana_c4_en_la_otra		;54e4   ; ventana_c4_en_la_otra: p00:54FA con la pagina de dibujar cambiada un momento
	jp bancos_7		;54e7   ; bancos_7: pone el 7 en 0xA000 (con su copia en 0xC381-0xC383)
ventana_c4_en_la_otra:		; p00:54FA con la pagina de dibujar cambiada un momento
	ld hl,0ca42h		;54ea   ; apunta a la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	ld a,(hl)			;54ed
	push hl			;54ee
	push af			;54ef
	xor 001h		;54f0   ; la otra
	ld (hl),a			;54f2
	call pinta_ventana_c4		;54f3   ; el radar alli
	pop af			;54f6
	pop hl			;54f7
	ld (hl),a			;54f8   ; y la de antes
	ret			;54f9
pinta_ventana_c4:		; solo con 0xCA5F puesto
	ld a,(0ca5fh)		;54fa
	and a			;54fd
	ret z			;54fe
	exx			;54ff
	ld a,(0ca42h)		;5500   ; la pagina en la que se dibuja
	ld d,a			;5503
	ld a,0ffh		;5504   ; color 0xFF: el 15 en los dos puntos
	ld hl,0c417h		;5506   ; X = 0xC4, Y = 0x17...
	ld bc,03838h		;5509   ; ...0x38 x 0x38 puntos
	call borra_bloque_vram		;550c   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
	call bancos_4_5		;550f   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0984ch		;5512
	call 098fbh		;5515
	call bancos_1_2_3		;5518   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	exx			;551b
	ret			;551c
sala_de_la_zona_7:		; con 0xD433 puesto, p00:55B6
	ld a,(0d433h)		;551d
	and a			;5520
	jp nz,L_55B6		;5521
	ld hl,0d431h		;5524   ; 0xD431...
	ld a,(hl)			;5527   ; ...a cero: p00:5560
	and a			;5528
	jr z,L_5560		;5529
	inc hl			;552b
	ld a,(0ca41h)		;552c   ; si 0xCA41 no es el de 0xD432: p00:5560
	cp (hl)			;552f
	jr nz,L_5560		;5530
	ld a,(0ca50h)		;5532   ; con 0xCA50 < 4: p00:555A
	cp 004h		;5535
	jr c,L_555A		;5537
	ld a,002h		;5539   ; 0xD430 = 2
	ld (0d430h),a		;553b
	push hl			;553e
	ld hl,0d7d1h		;553f   ; el bit 4 de 0xD7D1 a uno, el 3 a cero
	set 4,(hl)		;5542
	res 3,(hl)		;5544
	ld a,001h		;5546   ; 0xD4E3 = 1
	ld (0d4e3h),a		;5548
	ld hl,06b85h		;554b   ; la musica pendiente la pide p01:6B85...
	ld (0ca19h),hl		;554e   ; guarda la musica pendiente: la rutina que la pide (16 bits)
	ld a,0b4h		;5551   ; ...dentro de 0xB4 cuadros (0xCA18)
	ld (0ca18h),a		;5553   ; guarda la espera hasta poner la musica pendiente
	call 06be4h		;5556   ; p12:6BE4
	pop hl			;5559
L_555A:
	dec hl			;555a   ; 0xD431 = 0
	ld (hl),000h		;555b
	jp L_5310		;555d   ; a la parte comun
L_5560:
	ld a,(0d433h)		;5560   ; sin 0xD433...
	and a			;5563
	jr nz,L_5570		;5564
	ld hl,0d430h		;5566   ; ...0xD430 a cero; si no lo estaba, p01:7C77
	ld a,(hl)			;5569
	and a			;556a
	ld (hl),000h		;556b
	call nz,07c77h		;556d
L_5570:
	xor a			;5570   ; 0xD300 = 0
	ld (0d300h),a		;5571
	inc a			;5574   ; 0xD433 = 1
	ld (0d433h),a		;5575
	ld hl,0cc00h		;5578   ; borra 0xCC00-0xCC7F
	ld bc,0007fh		;557b
	call borra_bloque		;557e   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	call snake_a_0x88		;5581   ; la X o la Y de Snake a 0x88 (p00:55A0)
	call 08281h		;5584   ; llama_ab91: p06:AB91 guardando el banco de 0xA000
	call bancos_de_mapa		;5587   ; los bancos del mapa
	ld de,09ee4h		;558a   ; los bloques de p25:9EE4...
	ld hl,07af8h		;558d   ; ...y la sala de p24:7AF8
L_5590:
	ld (0ca44h),de		;5590   ; los bloques de 4 x 4
	call sala_a_ram		;5594   ; la sala al mapa de 0xDD00...
	call pinta_mapa		;5597   ; ...y a la VRAM
	call bancos_1_2_3		;559a   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	jp cambia_de_pagina		;559d   ; a la vista
snake_a_0x88:		; entrando por arriba o abajo, la X de Snake = 0x88; por los lados, la Y
	ld a,(0cb0eh)		;55a0   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	cp 003h		;55a3
	ld a,088h		;55a5   ; 0x88
	jr c,L_55AD		;55a7   ; arriba o abajo: la X = 0x88
	ld (0cb03h),a		;55a9   ; izquierda o derecha: la Y = 0x88
	ret			;55ac
L_55AD:
	ld (0cb05h),a		;55ad   ; guarda la X de Snake
	ret			;55b0
sala_de_bloques_de:		; p00:5590 con los bancos 24-26
	call bancos_24_25_26		;55b1   ; bancos_24_25_26: pone el 24 en 0x6000, el 25 en 0x8000, el 26 en 0xA000 (con su copia en 0xC381-0xC383)
	jr L_5590		;55b4
L_55B6:
	ld a,(0ca41h)		;55b6   ; con 0xCA41 = 2 o 3...
	sub 002h		;55b9
	cp 002h		;55bb
	jr nc,L_5560		;55bd
	xor a			;55bf   ; ...0xD433 = 0...
	ld (0d433h),a		;55c0
	ld (0ca4bh),a		;55c3   ; ...la sala 0...
	ld hl,00501h		;55c6   ; ...0xCA50 = 1, 0xCA51 = 5...
	ld (0ca50h),hl		;55c9   ; guarda la fila de la sala en la zona (uno mas al salir por arriba) y el byte siguiente (16 bits)
	jp L_5310		;55cc   ; ...y a la parte comun
entra_en_sala_especial:		; entra en una sala de 0xCA76 (0xD440 = 0)
	xor a			;55cf
	jr L_55D4		;55d0
entra_en_sala_especial_1:		; entra en una sala de 0xCA76 con 0xD440 = 1
	ld a,001h		;55d2
L_55D4:
	ld (0d440h),a		;55d4
	call 07bf1h		;55d7
L_55DA:
	call marcador_y_ventana		;55da   ; el marcador
	call 0823ch		;55dd   ; bits_de_la_zona: 0xCA75 = el byte de la zona en p56:A713; A = 0x5D en la sala especial 2
	call juegos_de_sala_especial		;55e0   ; los juegos de piezas de la sala especial (p56:BE63)
	ld (0ca4ch),hl		;55e3   ; a 0xCA4C y 0xCA4D
	call pinta_sala_especial		;55e6   ; la sala de 0xCA76 al mapa y a la VRAM
	call sala_banco_15		;55e9   ; sala_banco_15: p15:A005 con el banco 15
	xor a			;55ec
	ld (0dff8h),a		;55ed
	call 07df4h		;55f0
	call 08415h		;55f3   ; borra_cb80:
	call apaga_sprites		;55f6   ; sin sprites
	call sprites_de_sala_especial_bancos		;55f9   ; los sprites de la sala especial
	call a_p12_6e3a		;55fc   ; a_p12_6e3a: p12:6E3A con el banco 12 en 0x6000
	call 08281h		;55ff   ; llama_ab91: p06:AB91 guardando el banco de 0xA000
	call 0836ch		;5602   ; umbrales_de_la_sala: los umbrales de los juegos de piezas de la sala (p56:A727) a 0xCA4E-0xCA4F
	call 08475h		;5605   ; paleta_de_la_sala: la paleta comun y la de la sala
	call bancos_1_4_8		;5608   ; bancos_1_4_8: pone el 1 en 0x6000, el 4 en 0x8000, el 8 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a0e6h		;560b
	call bancos_1_2_3		;560e   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call cambia_de_pagina		;5611   ; la sala a la vista
	call copia_marcador		;5614   ; el marcador a la otra pagina
	call 0ba53h		;5617
	call 08b47h		;561a   ; a_p09_a163: p09:A163 con el banco 9 en 0xA000
	call enciende_sprites		;561d   ; otra vez con sprites
	call 0b4d1h		;5620
	call bancos_10		;5623   ; bancos_10: pone el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a0d3h		;5626
	call 0a000h		;5629
	call 0a82fh		;562c
	call bancos_1_2_11		;562f   ; bancos_1_2_11: pone el 1 en 0x6000, el 2 en 0x8000, el 11 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a601h		;5632
	call bancos_1_2_3		;5635   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b108h		;5638
	call bancos_14		;563b   ; bancos_14: pone el 14 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b6c3h		;563e
	call bancos_4_5		;5641   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0917ch		;5644
	call 0818bh		;5647
	call bancos_8		;564a   ; bancos_8: pone el 8 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a7dah		;564d   ; p08:A7DA
	call bancos_1_2_10		;5650   ; bancos_1_2_10: pone el 1 en 0x6000, el 2 en 0x8000, el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0be6dh		;5653
	call bancos_1_2_3		;5656   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call guarda_la_entrada		;5659   ; guarda por donde se ha entrado
	jp 09043h		;565c   ; cosas_de_la_especial: las cosas de la sala especial (p06:B719)
juegos_de_sala_especial:
	call bancos_56		;565f   ; bancos_56: pone el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	call datos_sala_especial		;5662   ; datos_sala_especial: el byte de p56:BE63 de la sala 0xCA76 en L y H
	jp bancos_1_2_3		;5665   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
datos_sala_especial:		; el byte de p56:BE63 de la sala 0xCA76 en L y H
	ld a,(0ca76h)		;5668   ; la sala especial...
	ld c,a			;566b
	ld hl,0be63h		;566c   ; ...su byte en p56:BE63
	call byte_de_tabla		;566f   ; byte_de_tabla: A = el byte A de la tabla de HL (y HL apunta a el)
	ld b,a			;5672
	rrca			;5673   ; el nibble alto a L
	rrca			;5674
	rrca			;5675
	rrca			;5676
	and 00fh		;5677
	ld l,a			;5679
	ld a,b			;567a
	and 00fh		;567b   ; el bajo a H
	ld h,a			;567d
	ld a,(0ca50h)		;567e   ; solo con 0xCA50 = 2...
	cp 002h		;5681
	ret nz			;5683
	ld a,c			;5684   ; ...en la 0x0F: H = 1, L = 0...
	cp 00fh		;5685
	jr z,L_5690		;5687
	cp 039h		;5689   ; ...en la 0x39: H = 5, L = 4
	ret nz			;568b
	ld hl,00504h		;568c
	ret			;568f
L_5690:
	ld hl,00100h		;5690
	ret			;5693
pinta_sala_especial:		; la sala B = 0xCA4B de las de 0xCA76...
	ld a,(0ca4bh)		;5694   ; lee la sala de la zona
	ld b,a			;5697
	call carga_sala_especial		;5698   ; carga_sala_especial: la sala B de las de 0xCA76 (p24:64B6) con los bloques de p00:56EF
	jp pinta_mapa		;569b   ; ...y a la VRAM
carga_sala_especial:		; la sala B de las de 0xCA76 (p24:64B6) con los bloques de p00:56EF
	call bancos_de_mapa		;569e   ; bancos_de_mapa: 24-25-26 y los bancos del mapa de la zona (p00:545C)
	push bc			;56a1
	call salas_especiales		;56a2   ; deshace las salas y HL = los bloques
	pop bc			;56a5
	ld (0ca44h),hl		;56a6   ; los bloques de 4 x 4
	ld l,b			;56a9   ; la sala B...
	ld h,000h		;56aa
	add hl,hl			;56ac   ; ...* 4...
	add hl,hl			;56ad
	ld d,h			;56ae
	ld e,l			;56af
	add hl,hl			;56b0   ; ...* 8 mas * 4: * 36 bloques
	add hl,hl			;56b1
	add hl,hl			;56b2
	add hl,de			;56b3
	ld de,0e780h		;56b4   ; desde 0xE780
	add hl,de			;56b7
	jp sala_a_ram		;56b8   ; los 6 x 6 bloques al mapa
salas_especiales:		; deshace las salas de 0xCA76 en 0xE780 y da los bloques de la zona
	ld a,(0ca76h)		;56bb   ; la sala especial...
	ld hl,064b6h		;56be   ; ...sus salas en rachas (p24:64B6)...
	call palabra_de_tabla		;56c1   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld de,0e780h		;56c4   ; ...deshechas en 0xE780
	ex de,hl			;56c7
	call rachas_a_ram		;56c8   ; rachas_a_ram: deshace las rachas de DE en HL (n < 0x80 repite, n > 0x80 copia, 0 acaba)
	ld a,(0ca4ah)		;56cb   ; la zona...
	ld b,a			;56ce
	cp 004h		;56cf   ; ...la 4 tiene dos juegos de bloques
	jr z,L_56DA		;56d1
L_56D3:
	ld a,b			;56d3
	ld hl,056efh		;56d4   ; los bloques de la zona (p00:56EF)
	jp palabra_de_tabla		;56d7   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
L_56DA:
	ld a,(0ca76h)		;56da   ; en la zona 4, las salas 0x0F, 0x10, 0x12-0x14...
	cp 00fh		;56dd
	jr z,L_56EB		;56df
	cp 010h		;56e1
	jr z,L_56EB		;56e3
	sub 012h		;56e5
	cp 003h		;56e7
	jr nc,L_56D3		;56e9
L_56EB:
	ld hl,089f9h		;56eb   ; ...usan los bloques de 0x89F9
	ret			;56ee

; ----------------------------------------------------------------------
; DATOS zonas_bloques_0xCA76: 20 punteros, uno por zona: los bloques de las
;   salas de 0xCA76 (p00:56D4; 0x56EE, que es un `ret`, en las zonas sin
;   ellas; la 4 usa 0x89F9 para 0xCA76 = 15, 16, 18-20, p00:56EB); lo leen
;   p00:56D7 (40 bytes)
;   0x56ef..0x5717  (40 bytes)
DATA_zonas_bloques_0xCA76:
	defw 056eeh,0b0a9h,06b51h,08e05h,09909h,06b51h,0a655h,06b51h	; 56ef
	defw 056eeh,056eeh,0b9c4h,0ab80h,08e05h,08e05h,056eeh,056eeh	; 56ff
	defw 056eeh,056eeh,0b3b9h,0b330h	; 570f

; ======================================================================
; CODIGO 0x5717..0x5bfe  (1255 bytes)
; ======================================================================


sala_en_la_pagina_de_dibujar:		; el marcador, la sala 0xCA4B y su mapa en la pagina de dibujar (p00:57E5)
	call bancos_1_2_3		;5717   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call marcador_entero		;571a   ; marcador_entero: p01:6DFF y el marcador (p00:4279)
	call carga_sala		;571d   ; la sala B
	call pinta_mapa_aqui		;5720   ; su mapa en la pagina de dibujar
	jp bancos_1_4_5		;5723   ; bancos_1_4_5: pone el 1 en 0x6000, el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
carga_y_pinta_sala:		; la sala 0xCA4B al mapa de 0xDD00 y a la otra pagina, con los casos de la zona 0x12
	ld a,(0ca4bh)		;5726   ; lee la sala de la zona
	ld b,a			;5729
	call carga_sala		;572a   ; sus datos, bloques y mapa
	ld a,(0ca4ah)		;572d   ; la zona 0x12...
	cp 012h		;5730
	jr nz,L_576B		;5732
	ld a,(0d888h)		;5734   ; ...con 0xD888 distinto de 0xFF...
	inc a			;5737
	jr z,L_5741		;5738
	ld a,(0ca4bh)		;573a   ; ...en la sala 2: la otra pagina en negro
	cp 002h		;573d
	jr z,L_575A		;573f
L_5741:
	ld a,(0d881h)		;5741   ; con 0xD881 a 0xFF, la sala se pinta
	inc a			;5744
	jr z,L_576B		;5745
	ld a,(0ca4bh)		;5747   ; la sala 8: p04:89A8
	cp 008h		;574a
	jr z,a_p04_89a8		;574c
	cp 003h		;574e   ; la sala 3...
	jr nz,L_576B		;5750
	ld hl,0caaeh		;5752   ; ...la primera vez (0xCAAE = 0)...
	ld a,(hl)			;5755
	and a			;5756
	jr nz,L_576B		;5757
	inc (hl)			;5759   ; ...se apunta y la otra pagina en negro
L_575A:
	ld a,(0ca42h)		;575a   ; la otra pagina...
	xor 001h		;575d   ; ...0xC0 x 0xC0 puntos a 0
	jp borra_pantalla_de		;575f   ; borra_pantalla_de: 0xC0 x 0xC0 puntos a 0 en la pagina A
a_p04_89a8:		; p04:89A8 con el banco 4 en 0x8000
	call bancos_4_5		;5762   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	call 089a8h		;5765   ; p04:89A8
	jp bancos_1_2_3		;5768   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
L_576B:
	call pinta_mapa		;576b   ; el mapa a la otra pagina
sala_banco_15:		; p15:A005 con el banco 15
	call bancos_15		;576e   ; bancos_15: pone el 15 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a005h		;5771   ; p15:A005
	jp bancos_1_2_3		;5774   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
sala_zona_12_otra_vez:		; en la zona 0x12, las salas 2 (con 0xD888) y 3 (con 0xD881) se pintan otra vez
	ld a,(0ca4ah)		;5777   ; lee la zona
	cp 012h		;577a
	ret nz			;577c
	ld a,(0ca4bh)		;577d   ; lee la sala de la zona
	ld b,a			;5780   ; B = la sala
	cp 002h		;5781   ; la 2...
	jr z,L_578F		;5783
	cp 003h		;5785   ; ...o la 3...
	ret nz			;5787
	ld a,(0d881h)		;5788   ; ...con 0xD881 distinto de 0xFF
	inc a			;578b
	ret z			;578c
	jr L_5794		;578d
L_578F:
	ld a,(0d888h)		;578f   ; la 2 con 0xD888 distinto de 0xFF
	inc a			;5792
	ret z			;5793
L_5794:
	call carga_sala		;5794   ; la sala al mapa...
	call pinta_mapa		;5797   ; ...y a la otra pagina
	call sala_banco_15		;579a   ; sala_banco_15: p15:A005 con el banco 15
	ld a,(0ca4bh)		;579d   ; en la sala 2...
	cp 002h		;57a0
	ret nz			;57a2
	ld hl,04050h		;57a3   ; ...el rectangulo de X = 0x40, Y = 0x50...
	ld d,h			;57a6
	ld e,l			;57a7
	ld bc,04020h		;57a8   ; ...de 0x40 x 0x20 puntos...
	jp copia_rectangulo_a_la_otra		;57ab   ; ...tambien a la pagina de dibujar
pinta_mapa:		; pinta los 24 x 24 caracteres de 0xDD00
	ld c,000h		;57ae   ; C = 0: a la otra pagina
L_57B0:
	xor a			;57b0   ; a cero: 0xD458, 0xCA28 y 0xD446
	ld (0d458h),a		;57b1
	ld (0ca28h),a		;57b4
	ld (0d446h),a		;57b7
	ld hl,0dd00h		;57ba   ; desde el mapa de la sala
	ld de,00000h		;57bd   ; desde X = 0, Y = 0
	ld b,018h		;57c0   ; 24 filas
L_57C2:
	push bc			;57c2
	ld b,018h		;57c3   ; de 24 caracteres
	push de			;57c5
L_57C6:
	push bc			;57c6
	ld a,(hl)			;57c7   ; el caracter
	rr c		;57c8   ; el bit 0 de C elige la pagina
	jr c,L_57D1		;57ca
	call pieza_de_sala_a_la_otra		;57cc   ; 0: a la otra
	jr L_57D4		;57cf
L_57D1:
	call pieza_de_sala_a_esta		;57d1   ; 1: a la de dibujar
L_57D4:
	inc hl			;57d4   ; el siguiente caracter...
	ld a,d			;57d5   ; ...8 puntos a la derecha
	add a,008h		;57d6
	ld d,a			;57d8
	pop bc			;57d9
	djnz L_57C6		;57da
	pop de			;57dc
	pop bc			;57dd
	ld a,e			;57de   ; la fila siguiente, 8 lineas mas abajo
	add a,008h		;57df
	ld e,a			;57e1
	djnz L_57C2		;57e2
	ret			;57e4
pinta_mapa_aqui:		; C = 1: el mapa a la pagina de dibujar
	ld c,001h		;57e5
	jr L_57B0		;57e7
vuelve_a_la_sala:		; p01:7BAA y la sala de 0xCA50
	call 07baah		;57e9
	ld bc,(0ca50h)		;57ec   ; lee la fila de la sala en la zona (uno mas al salir por arriba) y el byte siguiente (16 bits)
	jr L_57FE		;57f0
cambia_a_la_sala:		; la sala BC: 0xCA50 = C, 0xCA51 = B
	push bc			;57f2
	ld (0ca50h),bc		;57f3   ; guarda la fila de la sala en la zona (uno mas al salir por arriba) y el byte siguiente (16 bits)
	call 07c0eh		;57f7
	call 07baah		;57fa
	pop bc			;57fd
L_57FE:
	call 07bf5h		;57fe   ; p01:7BF5: A = la sala de la zona
	push af			;5801
	call bancos_de_mapa		;5802   ; los bancos del mapa
	pop bc			;5805
	push bc			;5806
	call carga_sala_o_especial		;5807   ; la sala (normal o especial) al mapa
	call pinta_mapa_aqui		;580a   ; y a la pagina de dibujar
	call bancos_1_2_3		;580d   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call esconde_sprites_ram		;5810   ; los sprites fuera
	call sprites_de_la_sala		;5813   ; los sprites de la sala
	call 08475h		;5816   ; paleta_de_la_sala: la paleta comun y la de la sala
	pop bc			;5819
	ld a,(0ca4bh)		;581a   ; la sala de antes...
	push af			;581d
	ld a,b			;581e   ; ...un momento la nueva...
	ld (0ca4bh),a		;581f   ; guarda la sala de la zona
	call sala_8fdf_o_9043		;5822   ; ...p02:8FDF o p02:9043...
	pop af			;5825   ; ...y otra vez la de antes
	ld (0ca4bh),a		;5826   ; guarda la sala de la zona
	call 08b50h		;5829   ; a_p09_a588: p09:A588 con el banco 9 en 0xA000
	ld a,(0ca76h)		;582c   ; en una sala especial, p02:8B47
	or a			;582f
	call nz,08b47h		;5830   ; a_p09_a163: p09:A163 con el banco 9 en 0xA000
	ld hl,0ca42h		;5833   ; la pagina de dibujar...
	ld a,(hl)			;5836
	push hl			;5837
	push af			;5838
	xor 001h		;5839   ; ...un momento la otra
	ld (hl),a			;583b
	call L_5FA0		;583c
	call bancos_15		;583f   ; bancos_15: pone el 15 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a000h		;5842   ; p15:A000
	call bancos_12_4_56		;5845   ; bancos_12_4_56: pone el 12 en 0x6000, el 4 en 0x8000, el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	call a_p12_746b		;5848   ; a_p12_746b: p12:746B con el banco 12 en 0x6000
	call bancos_1_4_5		;584b   ; bancos_1_4_5: pone el 1 en 0x6000, el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	call 08986h		;584e   ; p04:8986
	call bancos_1_4_8		;5851   ; bancos_1_4_8: pone el 1 en 0x6000, el 4 en 0x8000, el 8 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0ae7bh		;5854
	call 0a0e6h		;5857
	call bancos_1_2_3		;585a   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 08290h		;585d   ; llama_abbb: p06:ABBB guardando el banco de 0xA000
	call 083dch		;5860   ; piezas_de_83dc: en las zonas 1-6, fila 3, columna 7: dos piezas (p02:8409) en Y = 0x88, X = 0x58 y 0x60
	pop af			;5863   ; la pagina de antes
	pop hl			;5864
	ld (hl),a			;5865
	call bancos_10		;5866   ; bancos_10: pone el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0be6dh		;5869
	call bancos_4_5		;586c   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0818bh		;586f
	call bancos_1_2_3		;5872   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	jp 07c20h		;5875   ; y p01:7C20
sala_8fdf_o_9043:		; p02:8FDF en las salas normales, p02:9043 en las especiales
	ld a,(0ca76h)		;5878   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	or a			;587b
	jp z,08fdfh		;587c   ; cosas_de_la_sala: las cosas de la sala (0xD7C0) de las listas de p06 y las pinta
	jp 09043h		;587f   ; cosas_de_la_especial: las cosas de la sala especial (p06:B719)
sprites_de_la_sala:		; los sprites de la sala especial o de la normal
	ld a,(0ca76h)		;5882   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	or a			;5885
	jp nz,sprites_de_sala_especial_bancos		;5886   ; sprites_de_sala_especial_bancos:
	jp sprites_de_sala_si		;5889   ; sprites_de_sala_si: con 0xE1D0 puesto no se tocan
carga_sala_o_especial:		; la sala B, normal (p00:589D) o especial (p00:569E)
	ld a,(0ca76h)		;588c   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	or a			;588f
	jr z,carga_sala		;5890
	push bc			;5892
	call juegos_de_sala_especial		;5893   ; los juegos de piezas de la especial...
	pop bc			;5896
	ld (0ca4ch),hl		;5897   ; ...a 0xCA4C y 0xCA4D
	jp carga_sala_especial		;589a   ; carga_sala_especial: la sala B de las de 0xCA76 (p24:64B6) con los bloques de p00:56EF
carga_sala:		; la sala 0xCA4B de la zona 0xCA4A: sus datos (p56:BD28), sus bloques y su mapa
	call bancos_56		;589d   ; bancos_56: pone el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	ld a,(0ca4ah)		;58a0   ; la zona...
	ld c,a			;58a3   ; (C = la zona)
	ld hl,0bd28h		;58a4   ; ...los datos de sus salas (p56:BD28)
	call palabra_de_tabla		;58a7   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld a,b			;58aa   ; el byte de la sala B
	call byte_de_tabla		;58ab   ; byte_de_tabla: A = el byte A de la tabla de HL (y HL apunta a el)
	rrca			;58ae   ; el nibble alto: el juego de piezas de las 4 primeras filas de caracteres
	rrca			;58af
	rrca			;58b0
	rrca			;58b1
	and 00fh		;58b2
	ld de,0ca4ch		;58b4   ; apunta a los 4 bits altos del byte de la sala (p56:BD28)
	ld (de),a			;58b7
	ld a,(hl)			;58b8   ; el nibble bajo: el de las 4 ultimas
	and 00fh		;58b9
	inc e			;58bb
	ld (de),a			;58bc
	call bancos_de_mapa		;58bd   ; los bancos del mapa de la zona
	call sala_por_37		;58c0   ; la sala B * 37
	ex de,hl			;58c3
	ld a,c			;58c4   ; la zona...
	ld hl,06000h		;58c5   ; ...sus salas (p24:6000)...
	call palabra_de_tabla		;58c8   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	add hl,de			;58cb   ; ...DE = la sala
	ex de,hl			;58cc
	ld a,c			;58cd
	ld hl,06028h		;58ce   ; los juegos de bloques de la zona (p24:6028)
	call palabra_de_tabla		;58d1   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld a,(de)			;58d4   ; el primer byte de la sala: su juego de bloques
	call palabra_de_tabla		;58d5   ; HL = los bloques
	ld (0ca44h),hl		;58d8   ; guarda el puntero a los bloques de 4 x 4 de la sala y el byte siguiente (16 bits)
	ex de,hl			;58db
	inc hl			;58dc   ; los 36 bytes que siguen: 6 x 6 bloques
sala_a_ram:		; los 6 x 6 bloques de HL, de 4 x 4 caracteres, en el mapa de 0xDD00
	ld de,0dd00h		;58dd   ; a 0xDD00
L_58E0:
	ld a,006h		;58e0   ; 6 filas de bloques
L_58E2:
	ex af,af'			;58e2   ; (la cuenta de filas en el otro AF)
	ld b,006h		;58e3   ; 6 bloques por fila
L_58E5:
	ld a,(hl)			;58e5   ; el numero de bloque
	push de			;58e6
	exx			;58e7
	ld bc,(0ca44h)		;58e8   ; los bloques de la sala...
	ld h,000h		;58ec
	ld l,a			;58ee
	add hl,hl			;58ef   ; ...16 bytes cada uno
	add hl,hl			;58f0
	add hl,hl			;58f1
	add hl,hl			;58f2
	add hl,bc			;58f3
	ld bc,004ffh		;58f4   ; 4 filas
	pop de			;58f7
L_58F8:
	ldi		;58f8   ; 4 caracteres...
	ldi		;58fa
	ldi		;58fc
	ldi		;58fe
	ld a,014h		;5900   ; ...y la fila siguiente del mapa: 24 - 4 = 20 mas alla
	add a,e			;5902
	ld e,a			;5903
	jr nc,L_5907		;5904
	inc d			;5906
L_5907:
	djnz L_58F8		;5907
	exx			;5909
	inc hl			;590a   ; el bloque siguiente...
	inc e			;590b   ; ...4 caracteres a la derecha en el mapa
	inc e			;590c
	inc e			;590d
	inc de			;590e
	djnz L_58E5		;590f
	ex de,hl			;5911   ; la fila de bloques siguiente: 72 mas (3 filas de 24)
	ld bc,00048h		;5912
	add hl,bc			;5915
	ex de,hl			;5916
	ex af,af'			;5917
	dec a			;5918
	jp nz,L_58E2		;5919
	ret			;591c
bloques_de_77ef:		; la sala de la ficha IX de p24:77EF con los bloques de p25:9EE4, a 0xE500
	ld hl,077efh		;591d
	ld de,09ee4h		;5920
	call sala_de_lista_a_e500		;5923   ; sala_de_lista_a_e500: la sala de la ficha IX de la lista HL, con los bloques DE, a 0xE500
	jp bancos_1_4_8		;5926   ; bancos_1_4_8: pone el 1 en 0x6000, el 4 en 0x8000, el 8 en 0xA000 (con su copia en 0xC381-0xC383)
sala_especial_a_e500:		; la sala especial de la ficha IX (sus bytes 10-11) a 0xE500
	ld c,(ix+00ah)		;5929
	ld b,(ix+00bh)		;592c
	call 07bfch		;592f   ; p01:7BFC: A = el numero de la sala
	ld l,a			;5932
	push hl			;5933
	call bancos_de_mapa		;5934   ; bancos_de_mapa: 24-25-26 y los bancos del mapa de la zona (p00:545C)
	call salas_especiales		;5937   ; deshace las salas especiales
	ld (0ca44h),hl		;593a   ; los bloques de la zona
	pop hl			;593d
	ld h,000h		;593e   ; la sala * 36...
	add hl,hl			;5940
	add hl,hl			;5941
	ld d,h			;5942
	ld e,l			;5943
	add hl,hl			;5944
	add hl,hl			;5945
	add hl,hl			;5946
	add hl,de			;5947
	ld de,0e780h		;5948   ; ...desde 0xE780
	add hl,de			;594b
	ld de,0e500h		;594c   ; a 0xE500
	call L_58E0		;594f
	jp bancos_1_4_5		;5952   ; bancos_1_4_5: pone el 1 en 0x6000, el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
sala_de_zona_a_e500:		; la sala de la ficha IX a 0xE500, de una lista y unos bloques que dependen de la zona
	ld a,(0ca4ah)		;5955   ; lee la zona
	cp 012h		;5958
	ld hl,086cbh		;595a   ; la zona 0x12: las salas de 0x86CB, los bloques de 0xB3B9
	ld de,0b3b9h		;595d
	jr z,sala_de_lista_a_e500_b_1_4_5		;5960
	cp 00ah		;5962
	ld hl,07bd5h		;5964   ; la 0x0A: 0x7BD5 y 0xA994
	ld de,0a994h		;5967
	jr z,sala_de_lista_a_e500_b_1_4_5		;596a
	ld hl,0a3c2h		;596c   ; las demas: 0xA3C2 y 0xB330
	ld de,0b330h		;596f
sala_de_lista_a_e500_b_1_4_5:		; sala_de_lista_a_e500 y deja los bancos 1, 4 y 5
	call sala_de_lista_a_e500		;5972   ; sala_de_lista_a_e500: la sala de la ficha IX de la lista HL, con los bloques DE, a 0xE500
	jp bancos_1_4_5		;5975   ; bancos_1_4_5: pone el 1 en 0x6000, el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
sala_de_lista_a_e500:		; la sala de la ficha IX de la lista HL, con los bloques DE, a 0xE500
	push de			;5978
	push hl			;5979
	ld c,(ix+00ah)		;597a   ; los bytes 10-11 de la ficha...
	ld b,(ix+00bh)		;597d
	call 07bfch		;5980   ; ...p01:7BFC: el numero de la sala
	ld b,a			;5983
	call bancos_de_mapa		;5984   ; bancos_de_mapa: 24-25-26 y los bancos del mapa de la zona (p00:545C)
	call sala_por_37		;5987   ; * 37
	pop de			;598a
	add hl,de			;598b   ; la sala en la lista...
	inc hl			;598c   ; ...sin su primer byte
	pop de			;598d
	ld (0ca44h),de		;598e   ; los bloques
	ld de,0e500h		;5992   ; a 0xE500
	jp L_58E0		;5995
sala_por_37:		; HL = 37 x B (las salas son de 37 bytes)
	xor a			;5998
	ld h,a			;5999   ; HL = B
	ld l,b			;599a
	add hl,hl			;599b   ; * 4...
	add hl,hl			;599c
	ld d,h			;599d
	ld e,l			;599e
	add hl,hl			;599f   ; ...* 32 + * 4 = * 36...
	add hl,hl			;59a0
	add hl,hl			;59a1
	add hl,de			;59a2
	ld e,b			;59a3
	ld d,a			;59a4
	add hl,de			;59a5   ; ...+ B = * 37
	ret			;59a6
cambia_de_zona:		; pasa a la zona A
	push af			;59a7
	call limpia_sala		;59a8   ; limpia lo de la sala (p00:59DD)
	pop af			;59ab
	ld hl,0ca4ah		;59ac   ; la zona de ahora
	ld c,(hl)			;59af   ; C = la de antes
	cp (hl)			;59b0   ; la misma: solo se repinta
	jr z,L_59C0		;59b1
	ld (hl),a			;59b3   ; la nueva
	sub 00bh		;59b4   ; en las zonas 0x0B-0x10 C sigue siendo la de antes
	cp 006h		;59b6
	jr c,L_59BB		;59b8
	ld c,(hl)			;59ba   ; en las demas, C = la nueva
L_59BB:
	call prepara_la_zona		;59bb   ; prepara_la_zona: C = la zona (o la de antes): las zonas 0x0B-0x10 no rehacen la pantalla
	jr L_59CC		;59be
L_59C0:
	call marcador_y_ventana		;59c0   ; la misma zona: el marcador...
	call dibujos_de_sala		;59c3   ; ...los dibujos de la sala...
	call prepara_la_zona_sin_pantalla		;59c6   ; ...p00:5A7B...
	call copia_marcador		;59c9   ; ...y el marcador a la otra pagina
L_59CC:
	xor a			;59cc   ; 0xCB73 = 0
	ld (0cb73h),a		;59cd
	ld a,(0ca76h)		;59d0   ; sala normal: p00:5310
	and a			;59d3
	jp z,L_5310		;59d4
	call mapas_de_bits_especiales		;59d7   ; especial: p00:5CAE y p00:55DA
	jp L_55DA		;59da
limpia_sala:		; 0xD8D8-0xD8DF a cero
	ld hl,0d8d8h		;59dd
	ld bc,00007h		;59e0
	call borra_bloque		;59e3   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	call apaga_sprites		;59e6   ; sin sprites, todos fuera
	call esconde_sprites_ram		;59e9   ; esconde_sprites_ram: llena 0xDC00-0xDC7F con 0xE0
	call esconde_sprites_vram		;59ec   ; esconde_sprites_vram: llena con 0xE0 128 bytes de la VRAM en 0xF600 y otros 128 en 0xF200
limpia_sprites_y_d300:
	call apaga_sprites		;59ef   ; apaga_sprites: R#8 con el bit 1 (SPD) a uno, desde la copia 0xFFE7
	ld hl,0dc10h		;59f2   ; los sprites 4-31 fuera (0xDC10)
	ld bc,0006fh		;59f5
	ld a,0e0h		;59f8
	call llena_bloque		;59fa   ; llena_bloque: pone A en BC + 1 bytes desde HL
	call 07baah		;59fd
	ld hl,0d300h		;5a00   ; 0xD300-0xD3FF a cero
	ld bc,000ffh		;5a03
	call borra_bloque		;5a06   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	call d41a_y_compania		;5a09   ; d41a_y_compania: C = 0
	jp enciende_sprites		;5a0c   ; enciende_sprites: R#8 con el bit 1 (SPD) a cero, desde la copia 0xFFE7
d41a_y_compania:		; C = 0
	ld c,000h		;5a0f
d41a_y_compania_c:		; 0xD41A = 0xD41F = 2
	ld a,002h		;5a11
	ld (0d41ah),a		;5a13
	ld (0d41fh),a		;5a16
	ld a,c			;5a19   ; 0xD416 = 0xD426 = C
	ld (0d416h),a		;5a1a
	ld (0d426h),a		;5a1d
	xor a			;5a20   ; 0xCA60 = 0
	ld (0ca60h),a		;5a21
	ret			;5a24
sale_a_la_zona_de_la_sala:		; limpia lo de la sala
	call limpia_sala		;5a25   ; limpia_sala: 0xD8D8-0xD8DF a cero
	ld hl,0ca4ah		;5a28   ; la zona...
	ld c,(hl)			;5a2b   ; (C = la de antes)
	ld a,(0ca4bh)		;5a2c   ; ...pasa a ser la sala & 0x7F
	and 07fh		;5a2f
	ld (hl),a			;5a31
	ld b,a			;5a32
	ld a,(0d430h)		;5a33   ; con 0xD430 >= 2: p00:5A4D
	cp 002h		;5a36
	jr nc,L_5A4D		;5a38
	ld a,b			;5a3a   ; la zona 1...
	dec a			;5a3b
	jr nz,L_5A44		;5a3c
	xor a			;5a3e   ; ...0xD430 = 0
	ld (0d430h),a		;5a3f
	jr L_5A4D		;5a42
L_5A44:
	ld a,b			;5a44   ; la zona 7: 0xCA5F = 0
	cp 007h		;5a45
	jr nz,L_5A4D		;5a47
	xor a			;5a49
	ld (0ca5fh),a		;5a4a
L_5A4D:
	push bc			;5a4d
	call 08257h		;5a4e   ; sala_de_entrada: por la salida 1: 0xCA50 = 1; por la 2, la pareja de C en p02:827A
	pop bc			;5a51
prepara_la_zona:		; C = la zona (o la de antes): las zonas 0x0B-0x10 no rehacen la pantalla
	ld a,c			;5a52
	sub 00bh		;5a53
	cp 006h		;5a55
	jr c,L_5A6F		;5a57
	call llena_pantalla_99		;5a59   ; la sala en el color 9...
	call lineas_c3_en_la_otra		;5a5c   ; ...p00:5B78...
	call 082a2h		;5a5f   ; ...p02:82A2...
	call piezas_en_pagina_2		;5a62   ; ...las piezas de la zona en la pagina 2...
	call mapas_de_bits_de_la_zona		;5a65   ; ...los mapas de bits de las salas (p00:5BA1)
	ld a,(0ca64h)		;5a68   ; con 0xCA64 puesto, p01:6A6B
	and a			;5a6b
	call nz,06a6bh		;5a6c
L_5A6F:
	call rachas_de_zona_a_e740		;5a6f   ; las rachas de la zona a 0xE740
	call bancos_15		;5a72   ; bancos_15: pone el 15 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a2ebh		;5a75   ; p15:A2EB
	call bancos_1_2_3		;5a78   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
prepara_la_zona_sin_pantalla:		; p02:804E: la lista de p30 de la zona a 0xD900
	call 0804eh		;5a7b   ; lista_de_zona_a_d900: 0xD900-0xD9FF a 0xFF y la lista de p30 de la zona (o de la especial)
	ld hl,00000h		;5a7e   ; 0xCAC9-0xCACA = 0
	ld (0cac9h),hl		;5a81
	ld a,001h		;5a84   ; 0xCACB = 0xCACC = 0xCACD = 1
	ld (0cacbh),a		;5a86
	ld (0cacch),a		;5a89
	ld (0cacdh),a		;5a8c
	ld a,0ffh		;5a8f   ; 0xD44A = 0xFF
	ld (0d44ah),a		;5a91
	ld a,(0ca4ah)		;5a94   ; en la zona 1...
	ld b,a			;5a97
	dec a			;5a98
	jr nz,L_5AA4		;5a99
	ld hl,0ca22h		;5a9b   ; ...con la fase 0...
	ld a,(hl)			;5a9e
	and a			;5a9f
	jr nz,L_5AA4		;5aa0
	ld (hl),00ah		;5aa2   ; ...la fase pasa a 0x0A
L_5AA4:
	ld a,b			;5aa4   ; la zona 0x0C: 0xCA43 = 0
	sub 00ch		;5aa5
	ld c,000h		;5aa7
	jr z,L_5AB0		;5aa9
	dec a			;5aab   ; la 0x0D: 0xCA43 = 8
	ld c,008h		;5aac
	jr nz,L_5AB4		;5aae
L_5AB0:
	ld a,c			;5ab0
	ld (0ca43h),a		;5ab1
L_5AB4:
	call bancos_12		;5ab4   ; bancos_12: pone el 12 en 0x6000 (con su copia en 0xC381-0xC383)
	call 067e1h		;5ab7   ; p12:67E1
	call bancos_1_2_10		;5aba   ; bancos_1_2_10: pone el 1 en 0x6000, el 2 en 0x8000, el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0bca2h		;5abd   ; p10:BCA2
	call 0bc0fh		;5ac0   ; p10:BC0F
	call bancos_12_4_56		;5ac3   ; bancos_12_4_56: pone el 12 en 0x6000, el 4 en 0x8000, el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	call 068e3h		;5ac6   ; p12:68E3
	call L_5D9D		;5ac9
	call bancos_1_2_3		;5acc   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 063ebh		;5acf   ; p01:63EB
	ld a,(0ca4ah)		;5ad2   ; en la zona 0x12...
	cp 012h		;5ad5
	jr nz,L_5AF8		;5ad7
	ld a,(0d881h)		;5ad9   ; ...con 0xD881 distinto de 0xFF...
	inc a			;5adc
	jr z,L_5AF8		;5add
	ld a,001h		;5adf   ; ...0xD8A4 = 1...
	ld (0d8a4h),a		;5ae1
	ld hl,00902h		;5ae4   ; ...0xCA50 = 2, 0xCA51 = 9...
	ld (0ca50h),hl		;5ae7   ; guarda la fila de la sala en la zona (uno mas al salir por arriba) y el byte siguiente (16 bits)
	ld a,060h		;5aea   ; ...Snake en Y = X = 0x60...
	ld (0cb03h),a		;5aec   ; guarda la Y de Snake
	ld (0cb05h),a		;5aef   ; guarda la X de Snake
	ld a,(0ca42h)		;5af2   ; ...y la pagina de dibujar en negro
	call borra_pantalla_de		;5af5   ; borra_pantalla_de: 0xC0 x 0xC0 puntos a 0 en la pagina A
L_5AF8:
	call 07bf1h		;5af8
	call musica_de_la_zona		;5afb   ; la musica de la zona (p00:5B33)
copia_a_c700:		; copia en 0xC700 la zona, la sala especial, la Y y la X de Snake y 0xCA50-0xCA51 (salvo en la zona 0x10)
	ld a,(0ca4ah)		;5afe   ; lee la zona
	cp 010h		;5b01
	ret z			;5b03
	ld hl,0c700h		;5b04   ; la zona
	ld (hl),a			;5b07
	inc hl			;5b08
	ld a,(0ca76h)		;5b09   ; la sala especial
	ld (hl),a			;5b0c
	inc hl			;5b0d
	ld a,(0cb03h)		;5b0e   ; la Y de Snake
	ld (hl),a			;5b11
	inc hl			;5b12
	ld a,(0cb05h)		;5b13   ; la X de Snake
	ld (hl),a			;5b16
	inc hl			;5b17
	ld de,(0ca50h)		;5b18   ; 0xCA50 y 0xCA51
	ld (hl),e			;5b1c
	inc hl			;5b1d
	ld (hl),d			;5b1e
	ld a,(0ca4ah)		;5b1f   ; en la zona 1...
	dec a			;5b22
	ret nz			;5b23
	ld a,(0ca4bh)		;5b24   ; ...salas 0 y 2...
	and a			;5b27
	jr z,L_5B2D		;5b28
	dec a			;5b2a
	dec a			;5b2b
	ret nz			;5b2c
L_5B2D:
	ld a,095h		;5b2d   ; ...la Y guardada es 0x95
	ld (0c702h),a		;5b2f
	ret			;5b32
musica_de_la_zona:		; 0xD4E2 = 0xD4E3 = 0xD4E4 = 0
	xor a			;5b33
	ld (0d4e2h),a		;5b34
	ld (0d4e3h),a		;5b37
	ld (0d4e4h),a		;5b3a
	ld a,(0ca64h)		;5b3d   ; con 0xCA64 no se cambia la musica
	and a			;5b40
	ret nz			;5b41
	ld a,(0ca5fh)		;5b42   ; ni con 0xCA5F
	and a			;5b45
	ret nz			;5b46
musica_de_la_zona_si:		; ni con 0xC697
	ld a,(0c697h)		;5b47
	and a			;5b4a
	ret nz			;5b4b
	call 07ce6h		;5b4c   ; la rutina de la zona en la fase...
	push hl			;5b4f
	ld de,(0ca20h)		;5b50   ; ...si es la de 0xCA20, la que ya suena...
	call 00020h		;5b54   ; BIOS DCOMPR - Compares HL with DE
	pop hl			;5b57
	ld (0ca20h),hl		;5b58   ; ...ya esta
	ret z			;5b5b
	ld (0ca19h),hl		;5b5c   ; si no, se pide
	ld a,(0d4ebh)		;5b5f   ; dentro de 0xB4 cuadros, o de 1 con 0xD4EB (que se borra)
	and a			;5b62
	ld a,0b4h		;5b63
	jr z,L_5B6C		;5b65
	xor a			;5b67
	ld (0d4ebh),a		;5b68
	inc a			;5b6b
L_5B6C:
	ld (0ca18h),a		;5b6c   ; la espera
	jp 06be4h		;5b6f
musica_de_la_zona_bancos_9:
	call musica_de_la_zona_si		;5b72   ; musica_de_la_zona_si: ni con 0xC697
	jp bancos_1_2_9		;5b75   ; bancos_1_2_9: pone el 1 en 0x6000, el 2 en 0x8000, el 9 en 0xA000 (con su copia en 0xC381-0xC383)
lineas_c3_en_la_otra:		; p00:5F98 y las lineas de p00:439D en la otra pagina
	ld hl,0ca42h		;5b78   ; apunta a la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	push hl			;5b7b
	ld a,(hl)			;5b7c
	push af			;5b7d
	xor 001h		;5b7e   ; la otra un momento
	ld (hl),a			;5b80
	call a_p12_6f41		;5b81   ; a_p12_6f41: p12:6F41 con el banco 12 en 0x6000
	call lineas_c3		;5b84   ; lineas_c3: las lineas de las listas de p00:43C8 (verticales) y p00:43E3 (horizontales), de 0x3A de largo en el color 0x0D
	pop af			;5b87
	pop hl			;5b88
	ld (hl),a			;5b89   ; la de antes
	ret			;5b8a
carga_esta_sala:		; la sala 0xCA4B, normal o especial, al mapa
	ld a,(0ca4bh)		;5b8b   ; lee la sala de la zona
	ld b,a			;5b8e
	ld a,(0ca76h)		;5b8f   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	and a			;5b92
	jr nz,carga_sala_especial_b_1_2_3		;5b93
	call carga_sala		;5b95   ; carga_sala: la sala 0xCA4B de la zona 0xCA4A: sus datos (p56:BD28), sus bloques y su mapa
	jp bancos_1_2_3		;5b98   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
carga_sala_especial_b_1_2_3:		; carga_sala_especial y deja los bancos 1, 2 y 3
	call carga_sala_especial		;5b9b   ; carga_sala_especial: la sala B de las de 0xCA76 (p24:64B6) con los bloques de p00:56EF
	jp bancos_1_2_3		;5b9e   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
mapas_de_bits_de_la_zona:		; los mapas de bits de todas las salas de la zona, desde 0x8000 de la RAM
	ld de,08000h		;5ba1
	ld hl,0ca4ah		;5ba4   ; en las zonas 0x0B-0x10...
	ld a,(hl)			;5ba7
	sub 00bh		;5ba8
	cp 006h		;5baa
	jr nc,mapas_de_bits_de_salas		;5bac
	ld c,(hl)			;5bae   ; ...las seis seguidas: 0x0B, 0x0C...
	ld (hl),00bh		;5baf
	ld b,006h		;5bb1
L_5BB3:
	push hl			;5bb3
	push bc			;5bb4
	call mapas_de_bits_de_salas		;5bb5   ; mapas_de_bits_de_salas: las salas de la zona (p00:5BFE)...
	pop bc			;5bb8
	pop hl			;5bb9
	inc (hl)			;5bba   ; ...la zona siguiente...
	djnz L_5BB3		;5bbb
	ld (hl),c			;5bbd   ; ...y la de antes
	ret			;5bbe
mapas_de_bits_de_salas:		; las salas de la zona (p00:5BFE)...
	ld a,(0ca4ah)		;5bbf   ; lee la zona
	ld hl,05bfeh		;5bc2
	call suma_a_hl		;5bc5   ; suma_a_hl: HL = HL + A
	ld b,(hl)			;5bc8   ; ...B = cuantas
	ld c,000h		;5bc9   ; desde la 0
L_5BCB:
	push bc			;5bcb
	push de			;5bcc
	push bc			;5bcd
	ld b,c			;5bce   ; la sala C...
	call carga_sala		;5bcf   ; ...al mapa de 0xDD00
	call bancos_1_2_3		;5bd2   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	pop bc			;5bd5
	ld a,c			;5bd6
	ld (0ca4bh),a		;5bd7   ; guarda la sala de la zona
	call 0836ch		;5bda   ; umbrales_de_la_sala: los umbrales de los juegos de piezas de la sala (p56:A727) a 0xCA4E-0xCA4F
	call mapa_de_bits		;5bdd   ; su mapa de bits en 0xE900
	ld a,(0c386h)		;5be0   ; la RAM del slot de 0xC386 en 0x8000
	ld h,080h		;5be3
	call 00024h		;5be5   ; BIOS ENASLT - Switches to specified slot and page definitively
	di			;5be8
	pop de			;5be9
	ld hl,0e900h		;5bea   ; los 41 bytes del mapa de bits...
	ld bc,00029h		;5bed
	ldir		;5bf0   ; ...a la RAM de DE
	ld a,(0c388h)		;5bf2   ; el slot de antes
	call 0013bh		;5bf5   ; BIOS WSLREG - Writes value to the primary slot register
	ei			;5bf8
	pop bc			;5bf9
	inc c			;5bfa   ; la sala siguiente
	djnz L_5BCB		;5bfb
	ret			;5bfd

; ----------------------------------------------------------------------
; DATOS resto_5BFE: lo apuntan con el banco puesto p00:5BC2 (0x5BFE); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p00:5BC2 (20 bytes)
;   0x5bfe..0x5c12  (20 bytes)
DATA_resto_5BFE:
	defb 00dh,017h,009h,015h,018h,009h,024h,015h,010h,005h,019h,009h,009h,007h,006h,005h	; 5bfe  ......$.........
	defb 004h,006h,014h,006h	; 5c0e

; ======================================================================
; CODIGO 0x5c12..0x5c8f  (125 bytes)
; ======================================================================


mapa_de_bits:		; el mapa de 0xDD00 en bits (uno por caracter, a uno los de 0xCA4E-0xCA4F en adelante) y apretado en 41 bytes en 0xE900
	exx			;5c12
	ld hl,0e900h		;5c13   ; apunta a los caracteres de un dibujo pasados a 4 bits
	ld de,(0ca4eh)		;5c16   ; los dos umbrales
	exx			;5c1a
	ld de,0dd00h		;5c1b   ; desde el mapa
	xor a			;5c1e   ; la cuenta de bits a cero
	ld (0e207h),a		;5c1f
	ld b,018h		;5c22   ; 24 filas
L_5C24:
	ld c,018h		;5c24   ; de 24 caracteres
L_5C26:
	ld a,(de)			;5c26   ; el caracter
	exx			;5c27
	cp 081h		;5c28   ; los de hasta 0x80 con el umbral de 0xCA4E...
	ld c,e			;5c2a
	jr c,L_5C2E		;5c2b
	ld c,d			;5c2d   ; ...los demas con el de 0xCA4F
L_5C2E:
	cp c			;5c2e   ; acarreo = el caracter llega al umbral
	ccf			;5c2f
	call mete_bit		;5c30   ; el bit al mapa
	exx			;5c33
	inc de			;5c34
	dec c			;5c35
	jr nz,L_5C26		;5c36
	djnz L_5C24		;5c38
	ld hl,0e900h		;5c3a   ; de 0xE900 a 0xE980: 24 vueltas
	ld de,0e980h		;5c3d
	ld b,018h		;5c40
L_5C42:
	push bc			;5c42
	ldi		;5c43   ; tres bytes tal cual
	ldi		;5c45
	ldi		;5c47
	ld a,003h		;5c49   ; tres...
L_5C4B:
	ex af,af'			;5c4b
	ld b,h			;5c4c   ; ...con el byte de tres mas alla...
	ld a,l			;5c4d
	add a,003h		;5c4e
	ld c,a			;5c50
	ld a,(bc)			;5c51
	and (hl)			;5c52   ; ...juntos con AND
	ld (de),a			;5c53
	inc hl			;5c54
	inc de			;5c55
	ex af,af'			;5c56
	dec a			;5c57
	jr nz,L_5C4B		;5c58
	inc hl			;5c5a   ; salta tres
	inc hl			;5c5b
	inc hl			;5c5c
	ldi		;5c5d   ; y tres tal cual
	ldi		;5c5f
	ldi		;5c61
	pop bc			;5c63
	djnz L_5C42		;5c64
	exx			;5c66   ; y de 0xE980 otra vez a 0xE900
	ld hl,0e900h		;5c67   ; apunta a los caracteres de un dibujo pasados a 4 bits
	ld de,0e980h		;5c6a
	exx			;5c6d
	xor a			;5c6e   ; la cuenta de bits a cero
	ld (0e207h),a		;5c6f
	ld b,037h		;5c72   ; 55 bytes
L_5C74:
	ld a,006h		;5c74   ; 6 bits de cada uno
L_5C76:
	dec a			;5c76
	push af			;5c77
	exx			;5c78
	ld bc,05c8fh		;5c79   ; las mascaras de p00:5C8F
	add a,c			;5c7c
	ld c,a			;5c7d
	jr nc,L_5C81		;5c7e
	inc b			;5c80
L_5C81:
	ld a,(bc)			;5c81   ; la mascara
	call bit_de_mascara		;5c82   ; el bit de ese byte al mapa
	exx			;5c85
	pop af			;5c86
	jr nz,L_5C76		;5c87
	exx			;5c89
	inc de			;5c8a   ; el byte siguiente
	exx			;5c8b
	djnz L_5C74		;5c8c
	ret			;5c8e

; ----------------------------------------------------------------------
; DATOS resto_5C8F: lo apuntan con el banco puesto p00:5C79 (0x5C8F); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p00:5C79 (6 bytes)
;   0x5c8f..0x5c95  (6 bytes)
DATA_resto_5C8F:
	defb 001h,006h,008h,010h,060h,080h	; 5c8f

; ======================================================================
; CODIGO 0x5c95..0x5d03  (110 bytes)
; ======================================================================


bit_de_mascara:		; el bit de la mascara A en (DE) al mapa de (HL)
	ex de,hl			;5c95
	and (hl)			;5c96
	ex de,hl			;5c97
	jr z,mete_bit		;5c98
	scf			;5c9a
mete_bit:		; el acarreo entra por la derecha en (HL)
	rl (hl)		;5c9b
	push hl			;5c9d
	ld hl,0e207h		;5c9e   ; la cuenta de bits del byte
	inc (hl)			;5ca1
	ld a,(hl)			;5ca2
	cp 008h		;5ca3   ; a los 8...
	jr c,L_5CAC		;5ca5
	ld (hl),000h		;5ca7   ; ...a cero y el byte siguiente
	pop hl			;5ca9
	inc hl			;5caa
	ret			;5cab
L_5CAC:
	pop hl			;5cac
	ret			;5cad
mapas_de_bits_especiales:		; los mapas de bits de las salas especiales, desde 0x8C00 de la RAM
	call salas_de_la_especial		;5cae   ; salas_de_la_especial: B = cuantas salas tiene la especial 0xCA76 (p00:5D03; 1 si no esta)
	ld c,000h		;5cb1   ; desde la 0
	ld de,08c00h		;5cb3
L_5CB6:
	push bc			;5cb6
	push de			;5cb7
	push bc			;5cb8
	ld b,c			;5cb9   ; la sala C...
	ld a,c			;5cba
	ld (0ca4bh),a		;5cbb   ; guarda la sala de la zona
	push bc			;5cbe
	call juegos_de_sala_especial		;5cbf   ; ...sus juegos de piezas...
	pop bc			;5cc2
	ld (0ca4ch),hl		;5cc3   ; guarda los 4 bits altos del byte de la sala (p56:BD28) y el byte siguiente (16 bits)
	call carga_sala_especial		;5cc6   ; ...al mapa
	call bancos_1_2_3		;5cc9   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	pop bc			;5ccc
	call 0836ch		;5ccd   ; umbrales_de_la_sala: los umbrales de los juegos de piezas de la sala (p56:A727) a 0xCA4E-0xCA4F
	call mapa_de_bits		;5cd0   ; el mapa de bits
	ld a,(0c386h)		;5cd3   ; la RAM de 0x8000
	ld h,080h		;5cd6
	call 00024h		;5cd8   ; BIOS ENASLT - Switches to specified slot and page definitively
	pop de			;5cdb
	ld hl,0e900h		;5cdc   ; 41 bytes...
	ld bc,00029h		;5cdf
	ldir		;5ce2   ; ...a DE
	ld a,(0c388h)		;5ce4   ; el slot de antes
	call 0013bh		;5ce7   ; BIOS WSLREG - Writes value to the primary slot register
	pop bc			;5cea
	inc c			;5ceb
	djnz L_5CB6		;5cec
	ret			;5cee
salas_de_la_especial:		; B = cuantas salas tiene la especial 0xCA76 (p00:5D03; 1 si no esta)
	ld a,(0ca76h)		;5cef   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	ld b,001h		;5cf2
	ld hl,05d03h		;5cf4
L_5CF7:
	ld c,(hl)			;5cf7   ; la pareja [especial][salas]
	inc c			;5cf8   ; 0xFF: no esta
	ret z			;5cf9
	cp (hl)			;5cfa   ; es esta?
	inc hl			;5cfb
	jr z,L_5D01		;5cfc
	inc hl			;5cfe
	jr L_5CF7		;5cff
L_5D01:
	ld b,(hl)			;5d01   ; B = sus salas
	ret			;5d02

; ----------------------------------------------------------------------
; DATOS resto_5D03: lo apuntan con el banco puesto p00:5CF4 (0x5D03); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p00:5CF4 (21 bytes)
;   0x5d03..0x5d18  (21 bytes)
DATA_resto_5D03:
	defb 004h,003h,006h,002h,018h,002h,026h,003h,029h,006h,02ah,002h,02dh,002h,031h,004h	; 5d03  ......&.).*.-.1.
	defb 038h,002h,039h,002h,0ffh	; 5d13

; ======================================================================
; CODIGO 0x5d18..0x6000  (744 bytes)
; ======================================================================


pinta_letra:		; pinta la letra A en DE (0xF8 trae una de la segunda pagina)
	inc hl			;5d18   ; HL detras de la letra
	ld c,000h		;5d19   ; de la franja 0
	cp 0f8h		;5d1b   ; 0xF8...
	jr nz,L_5D23		;5d1d
	ld a,(hl)			;5d1f   ; ...la letra es el byte siguiente...
	ld c,040h		;5d20   ; ...de la franja de Y = 0x40
	inc hl			;5d22
L_5D23:
	push hl			;5d23
	push de			;5d24
	push bc			;5d25
	call sitio_de_caracter_c		;5d26   ; HL = su sitio en la pagina 3
	ld bc,00808h		;5d29   ; 8 x 8 puntos
	ld a,(0ca42h)		;5d2c   ; de la 3 a la pagina 0, TIMP
	and a			;5d2f
	ld a,0c8h		;5d30
	jr z,L_5D36		;5d32
	ld a,0d8h		;5d34   ; a la 1
L_5D36:
	call copia_rectangulo_logica		;5d36   ; copia_rectangulo_logica: orden LMMM del VDP con la operacion logica de A
	pop bc			;5d39
	pop de			;5d3a
	pop hl			;5d3b
	ret			;5d3c
pon_sprite_mas_4:		; p00:5D41 con el patron C + 4
	ld a,c			;5d3d
	add a,004h		;5d3e   ; el patron 4 mas alla (el siguiente de 16 x 16)
	ld c,a			;5d40
pon_sprite:		; [E][D][C] en (HL): la Y, la X y el patron de un sprite de 0xDC00
	ld (hl),e			;5d41   ; la Y
	inc l			;5d42
	ld (hl),d			;5d43   ; la X
	inc l			;5d44
	ld (hl),c			;5d45   ; el patron
	inc l			;5d46
	inc l			;5d47   ; HL al sprite siguiente
	ret			;5d48
bancos_6_12:		; el 6 en 0xA000 y el 12 en 0x6000
	call bancos_6		;5d49   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	jp bancos_12		;5d4c   ; bancos_12: pone el 12 en 0x6000 (con su copia en 0xC381-0xC383)
prepara_d400:
	call bancos_12_4_56		;5d4f   ; bancos_12_4_56: pone el 12 en 0x6000, el 4 en 0x8000, el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	call 06b42h		;5d52
	call bancos_1_4_5		;5d55   ; bancos_1_4_5: pone el 1 en 0x6000, el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	ld hl,0d400h		;5d58   ; 0xD400-0xD415 a cero
	ld bc,00015h		;5d5b
	call borra_bloque		;5d5e   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	call 0818bh		;5d61
	jr L_5D82		;5d64
llama_6be6:
	call bancos_12		;5d66   ; bancos_12: pone el 12 en 0x6000 (con su copia en 0xC381-0xC383)
	call 06be6h		;5d69
	jr L_5D82		;5d6c
llama_6be6_6000_8502:
	call bancos_6_12		;5d6e   ; bancos_6_12: el 6 en 0xA000 y el 12 en 0x6000
	call 06be6h		;5d71
	call 06000h		;5d74   ; p12:6000
	call 08502h		;5d77
	jr L_5D82		;5d7a
llama_6055:
	call bancos_6_12		;5d7c   ; bancos_6_12: el 6 en 0xA000 y el 12 en 0x6000
	call 06055h		;5d7f   ; p12:6055
L_5D82:
	jp bancos_1_2_3		;5d82   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
L_5D85:
	call bancos_6_12		;5d85   ; bancos_6_12: el 6 en 0xA000 y el 12 en 0x6000
	call 061f8h		;5d88   ; p12:61F8
	jr L_5D82		;5d8b
L_5D8D:
	call bancos_6_12		;5d8d   ; bancos_6_12: el 6 en 0xA000 y el 12 en 0x6000
	call 06327h		;5d90
	jr L_5D82		;5d93
a_p07_a4a6:		; p07:A4A6 con el banco 7 en 0xA000
	call bancos_7		;5d95   ; bancos_7: pone el 7 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a4a6h		;5d98   ; p07:A4A6
	jr L_5D82		;5d9b
L_5D9D:
	call bancos_4_5		;5d9d   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	call bancos_56		;5da0   ; bancos_56: pone el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	call bancos_12		;5da3   ; bancos_12: pone el 12 en 0x6000 (con su copia en 0xC381-0xC383)
	call 06ba5h		;5da6   ; p12:6BA5
	jr L_5D82		;5da9
a_p12_7ddc:		; p12:7DDC con el banco 12 en 0x6000
	call bancos_12_4_56		;5dab   ; bancos_12_4_56: pone el 12 en 0x6000, el 4 en 0x8000, el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	call 07ddch		;5dae   ; p12:7DDC
	jr L_5D82		;5db1
a_p12_68e3:		; p12:68E3 con el banco 12 en 0x6000
	call bancos_12_4_56		;5db3   ; bancos_12_4_56: pone el 12 en 0x6000, el 4 en 0x8000, el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	call 068e3h		;5db6
	jr L_5D82		;5db9
a_p12_6ab3:		; p12:6AB3 con el banco 12 en 0x6000
	call bancos_12_4_56		;5dbb   ; bancos_12_4_56: pone el 12 en 0x6000, el 4 en 0x8000, el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	call 06ab3h		;5dbe   ; p12:6AB3
	jr L_5D82		;5dc1
a_p12_7688:		; p12:7688 con el banco 12 en 0x6000
	call bancos_12_2_3		;5dc3   ; bancos_12_2_3: pone el 12 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 07688h		;5dc6
	jr L_5D82		;5dc9
a_p12_76e9:		; p12:76E9 con el banco 12 en 0x6000
	call bancos_12_2_3		;5dcb   ; bancos_12_2_3: pone el 12 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 076e9h		;5dce
	jr L_5D82		;5dd1
L_5DD3:
	call bancos_12_2_3		;5dd3   ; bancos_12_2_3: pone el 12 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 076e9h		;5dd6   ; p12:76E9
	call espera_vdp		;5dd9   ; espera_vdp: espera a que el VDP acabe la orden en curso (S#2 bit 0)
	call 07688h		;5ddc   ; p12:7688
	jp bancos_1_4_5		;5ddf   ; bancos_1_4_5: pone el 1 en 0x6000, el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
L_5DE2:
	call bancos_1_2_3		;5de2   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call repinta_la_sala		;5de5   ; repinta_la_sala: repinta la sala guardando los juegos de piezas de 0xCA4C-0xCA4D
	jp bancos_12		;5de8   ; bancos_12: pone el 12 en 0x6000 (con su copia en 0xC381-0xC383)
L_5DEB:
	call bancos_1_2_3		;5deb   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call repinta_la_sala		;5dee   ; repinta_la_sala: repinta la sala guardando los juegos de piezas de 0xCA4C-0xCA4D
	jp bancos_1_4_8		;5df1   ; bancos_1_4_8: pone el 1 en 0x6000, el 4 en 0x8000, el 8 en 0xA000 (con su copia en 0xC381-0xC383)
L_5DF4:
	call bancos_1_2_3		;5df4   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call repinta_la_sala		;5df7   ; repinta_la_sala: repinta la sala guardando los juegos de piezas de 0xCA4C-0xCA4D
	jp bancos_1_4_5		;5dfa   ; bancos_1_4_5: pone el 1 en 0x6000, el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
repinta_la_sala:		; repinta la sala guardando los juegos de piezas de 0xCA4C-0xCA4D
	ld hl,(0ca4ch)		;5dfd   ; lee los 4 bits altos del byte de la sala (p56:BD28) y el byte siguiente (16 bits)
	push hl			;5e00   ; los juegos de piezas de ahora
	call repinta_la_sala_si		;5e01   ; repinta_la_sala_si: apaga la pantalla y los sprites, vuelve a cargar la sala y la pinta segun el caso
	pop hl			;5e04
	ld (0ca4ch),hl		;5e05   ; y otra vez los de antes
	ret			;5e08
repinta_la_sala_si:		; apaga la pantalla y los sprites, vuelve a cargar la sala y la pinta segun el caso
	call apaga_pantalla_y_sprites		;5e09   ; apaga_pantalla_y_sprites: p00:45CC y p00:45F6
	call esconde_sprites_ram		;5e0c   ; los sprites fuera
	call esconde_sprites_vram		;5e0f   ; esconde_sprites_vram: llena con 0xE0 128 bytes de la VRAM en 0xF600 y otros 128 en 0xF200
	call 07c0eh		;5e12   ; p01:7C0E
	call carga_esta_sala		;5e15   ; la sala al mapa
	ld a,(0d8a4h)		;5e18   ; con 0xD8A4: p00:5E8C
	and a			;5e1b
	jr nz,L_5E8C		;5e1c
	call 08475h		;5e1e   ; paleta_de_la_sala: la paleta comun y la de la sala
	ld a,(0d433h)		;5e21   ; con 0xD433: la sala de p24:7AF8 (p00:5EBC)
	and a			;5e24
	jp nz,L_5EBC		;5e25
	call sala_a_esta_segun		;5e28   ; la sala a la pagina de dibujar (p00:5EF0)
	call 07de2h		;5e2b   ; p01:7DE2
	ld a,(0d8c0h)		;5e2e   ; con 0xD8C0 o 0xCA65 puestos se salta lo que sigue
	and a			;5e31
	jr nz,L_5E6D		;5e32
	ld a,(0ca65h)		;5e34   ; lee el sitio de 0xCBE0 en el que esta Snake (0 = ninguno)
	and a			;5e37
	jr nz,L_5E6D		;5e38
	call bancos_4_5		;5e3a   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	call bancos_14		;5e3d   ; bancos_14: pone el 14 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b377h		;5e40   ; p14:B377
	call bancos_1_2_10		;5e43   ; bancos_1_2_10: pone el 1 en 0x6000, el 2 en 0x8000, el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0be6dh		;5e46
	call 0bc1eh		;5e49
	call 0a4c9h		;5e4c   ; p10:A4C9
	ld hl,0ca42h		;5e4f   ; en la otra pagina un momento
	ld a,(hl)			;5e52
	push hl			;5e53
	push af			;5e54
	xor 001h		;5e55
	ld (hl),a			;5e57
	call bancos_1_4_8		;5e58   ; bancos_1_4_8: pone el 1 en 0x6000, el 4 en 0x8000, el 8 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a0e6h		;5e5b
	call 0ae7bh		;5e5e
	call bancos_1_2_3		;5e61   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 08290h		;5e64   ; llama_abbb: p06:ABBB guardando el banco de 0xA000
	call 083dch		;5e67   ; piezas_de_83dc: en las zonas 1-6, fila 3, columna 7: dos piezas (p02:8409) en Y = 0x88, X = 0x58 y 0x60
	pop af			;5e6a   ; la pagina de antes
	pop hl			;5e6b
	ld (hl),a			;5e6c
L_5E6D:
	call sala_con_cb21		;5e6d   ; sala_con_cb21: salvo en la zona 0x12, la especial 0x29 o con 0xD433: p12:6E4B, o p12:6E4F con 0xCB21 = 8
	ld a,(0d8c0h)		;5e70   ; sin 0xD8C0, p01:7C20
	or a			;5e73
	call z,07c20h		;5e74   ; p01:7C20
	ld a,(0cb21h)		;5e77   ; con 0xCB21 = 1, p02:8B70
	dec a			;5e7a
	call z,08b70h		;5e7b   ; a_p14_b712: p14:B712 con el banco 14 en 0xA000
	call 0924dh		;5e7e   ; pinta_cosas: las 4 cosas de 0xD7C0 que no tengan el bit 7 del numero
	call bancos_11		;5e81   ; bancos_11: pone el 11 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a601h		;5e84
	call bancos_1_2_3		;5e87   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	jr L_5EB6		;5e8a
L_5E8C:
	call bancos_10		;5e8c   ; la sala con 0xD8A4
	call 0aaa9h		;5e8f   ; p10:AAA9
	call bancos_1_2_3		;5e92   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	ld hl,(0c382h)		;5e95   ; el banco de 0x8000 de antes
	push hl			;5e98
	call bancos_4_5		;5e99   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	ld hl,0ca42h		;5e9c   ; en la otra pagina un momento
	ld a,(hl)			;5e9f
	push af			;5ea0
	push hl			;5ea1
	xor 001h		;5ea2
	ld (hl),a			;5ea4
	call 089a8h		;5ea5
	pop hl			;5ea8
	pop af			;5ea9
	ld (hl),a			;5eaa   ; la pagina de antes
	call 088b7h		;5eab
	pop hl			;5eae   ; el banco de antes...
	ld a,l			;5eaf
	call bancos_0_1		;5eb0   ; ...otra vez en 0x8000 (y el siguiente en 0xA000)
	call 07c20h		;5eb3
L_5EB6:
	call espera_vdp		;5eb6   ; al acabar el VDP, se enciende todo
	jp enciende_todo		;5eb9   ; enciende_todo: la pantalla y los sprites encendidos
L_5EBC:
	call bancos_de_mapa		;5ebc   ; la sala de p24:7AF8 con los bloques de p25:9EE4
	ld de,09ee4h		;5ebf
	ld hl,07af8h		;5ec2
	ld (0ca44h),de		;5ec5   ; guarda el puntero a los bloques de 4 x 4 de la sala y el byte siguiente (16 bits)
	call sala_a_ram		;5ec9   ; sala_a_ram: los 6 x 6 bloques de HL, de 4 x 4 caracteres, en el mapa de 0xDD00
	call pinta_mapa_aqui		;5ecc   ; a la pagina de dibujar
	call bancos_1_2_3		;5ecf   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	jr L_5EB6		;5ed2
sala_con_cb21:		; salvo en la zona 0x12, la especial 0x29 o con 0xD433: p12:6E4B, o p12:6E4F con 0xCB21 = 8
	ld a,(0ca4ah)		;5ed4   ; lee la zona
	cp 012h		;5ed7
	ret z			;5ed9
	ld a,(0ca76h)		;5eda   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 029h		;5edd
	ret z			;5edf
	ld a,(0d433h)		;5ee0
	and a			;5ee3
	ret nz			;5ee4
	ld a,(0cb21h)		;5ee5
	cp 008h		;5ee8
	jp nz,a_p12_6e4b		;5eea   ; a_p12_6e4b: p12:6E4B con el banco 12 en 0x6000
	jp a_p12_6e4f		;5eed   ; a_p12_6e4f: p12:6E4F con el banco 12 en 0x6000
sala_a_esta_segun:		; con 0xD8C0: p07:A4A6
	ld a,(0d8c0h)		;5ef0
	and a			;5ef3
	jp nz,a_p07_a4a6		;5ef4   ; a_p07_a4a6: p07:A4A6 con el banco 7 en 0xA000
	ld a,(0ca65h)		;5ef7   ; con 0xCA65: 0x707E
	and a			;5efa
	jp nz,0707eh		;5efb
	jp pinta_mapa_aqui		;5efe   ; si no, el mapa a la pagina de dibujar
a_p12_67e1:		; p12:67E1 con el banco 12 en 0x6000
	call bancos_12		;5f01   ; bancos_12: pone el 12 en 0x6000 (con su copia en 0xC381-0xC383)
	call 067e1h		;5f04
L_5F07:
	jp bancos_1_2_15		;5f07   ; bancos_1_2_15: pone el 1 en 0x6000, el 2 en 0x8000, el 15 en 0xA000 (con su copia en 0xC381-0xC383)
a_p12_69e0:		; p12:69E0 con el banco 12 en 0x6000
	call bancos_12_4_56		;5f0a   ; bancos_12_4_56: pone el 12 en 0x6000, el 4 en 0x8000, el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	call 069e0h		;5f0d   ; p12:69E0
	jr L_5F07		;5f10
a_p12_6ad4:		; p12:6AD4 con el banco 12 en 0x6000
	call bancos_12_4_56		;5f12   ; bancos_12_4_56: pone el 12 en 0x6000, el 4 en 0x8000, el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	call 06ad4h		;5f15   ; p12:6AD4
	jp bancos_1_4_5		;5f18   ; bancos_1_4_5: pone el 1 en 0x6000, el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
L_5F1B:
	call bancos_1_2_3		;5f1b   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call sala_a_esta_segun		;5f1e   ; sala_a_esta_segun: con 0xD8C0: p07:A4A6
	jr L_5F31		;5f21
L_5F23:
	call bancos_1_2_3		;5f23   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call repinta_la_sala		;5f26   ; repinta_la_sala: repinta la sala guardando los juegos de piezas de 0xCA4C-0xCA4D
	jr L_5F31		;5f29
a_p12_7688_2:		; p12:7688 con el banco 12 en 0x6000
	call bancos_12_2_3		;5f2b   ; bancos_12_2_3: pone el 12 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 07688h		;5f2e
L_5F31:
	jp bancos_1_2_9		;5f31   ; bancos_1_2_9: pone el 1 en 0x6000, el 2 en 0x8000, el 9 en 0xA000 (con su copia en 0xC381-0xC383)
a_p12_76e9_2:		; p12:76E9 con el banco 12 en 0x6000
	call bancos_12_2_3		;5f34   ; bancos_12_2_3: pone el 12 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 076e9h		;5f37
	jr L_5F31		;5f3a
sonido_08:		; pide el sonido 8
	ld a,008h		;5f3c
pide_sonido:		; pide el sonido A por el puente de 0xC340 (copiado de p03:A14B)
	jp 0c340h		;5f3e
sonido_fa:		; pide el sonido 0xFA
	ld a,0fah		;5f41
	jr pide_sonido		;5f43
sonido_fb:		; pide el sonido 0xFB
	ld a,0fbh		;5f45
	jr pide_sonido		;5f47
sonido_11:		; pide el sonido 0x11
	ld a,011h		;5f49
	jr pide_sonido		;5f4b
sonido_3f:		; pide el sonido 0x3F
	ld a,03fh		;5f4d
	jr pide_sonido		;5f4f
a_p12_6d78_b_9:		; a_p12_6d78 y deja el banco 9
	call a_p12_6d78		;5f51   ; a_p12_6d78: p12:6D78 con el banco 12 en 0x6000
	jp bancos_9		;5f54   ; bancos_9: pone el 9 en 0xA000 (con su copia en 0xC381-0xC383)
a_p12_6ce0:		; p12:6CE0 con el banco 12 en 0x6000
	call bancos_12		;5f57   ; bancos_12: pone el 12 en 0x6000 (con su copia en 0xC381-0xC383)
	call 06ce0h		;5f5a   ; p12:6CE0
	jr L_5F65		;5f5d
a_p12_6d78:		; p12:6D78 con el banco 12 en 0x6000
	call bancos_12		;5f5f   ; bancos_12: pone el 12 en 0x6000 (con su copia en 0xC381-0xC383)
	call 06d78h		;5f62   ; p12:6D78
L_5F65:
	jp bancos_1_2_3		;5f65   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
a_p12_6e3a:		; p12:6E3A con el banco 12 en 0x6000
	call bancos_12		;5f68   ; bancos_12: pone el 12 en 0x6000 (con su copia en 0xC381-0xC383)
	call 06e3ah		;5f6b   ; p12:6E3A
	jr L_5F65		;5f6e
a_p12_6e4b:		; p12:6E4B con el banco 12 en 0x6000
	call bancos_12		;5f70   ; bancos_12: pone el 12 en 0x6000 (con su copia en 0xC381-0xC383)
	call 06e4bh		;5f73   ; p12:6E4B
	jr L_5F65		;5f76
a_p12_6e4f:		; p12:6E4F con el banco 12 en 0x6000
	call bancos_12		;5f78   ; bancos_12: pone el 12 en 0x6000 (con su copia en 0xC381-0xC383)
	call 06e4fh		;5f7b
	jr L_5F65		;5f7e
a_p12_6e6c:		; p12:6E6C con el banco 12 en 0x6000
	call bancos_12		;5f80   ; bancos_12: pone el 12 en 0x6000 (con su copia en 0xC381-0xC383)
	call 06e6ch		;5f83   ; p12:6E6C
	jr L_5F65		;5f86
a_p12_6e70:		; p12:6E70 con el banco 12 en 0x6000
	call bancos_12		;5f88   ; bancos_12: pone el 12 en 0x6000 (con su copia en 0xC381-0xC383)
	call 06e70h		;5f8b   ; p12:6E70
	jr L_5F65		;5f8e
a_p12_6ec8:		; p12:6EC8 con el banco 12 en 0x6000
	call bancos_12		;5f90   ; bancos_12: pone el 12 en 0x6000 (con su copia en 0xC381-0xC383)
	call 06ec8h		;5f93   ; p12:6EC8
	jr L_5F65		;5f96
a_p12_6f41:		; p12:6F41 con el banco 12 en 0x6000
	call bancos_12		;5f98   ; bancos_12: pone el 12 en 0x6000 (con su copia en 0xC381-0xC383)
	call 06f41h		;5f9b
	jr L_5F65		;5f9e
L_5FA0:
	call bancos_56		;5fa0   ; bancos_56: pone el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	call bancos_12		;5fa3   ; bancos_12: pone el 12 en 0x6000 (con su copia en 0xC381-0xC383)
	xor a			;5fa6   ; 0xD455 = 0
	ld (0d455h),a		;5fa7
	call 072a1h		;5faa
	jr L_5F65		;5fad
L_5FAF:
	call bancos_56		;5faf   ; bancos_56: pone el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	call bancos_12		;5fb2   ; bancos_12: pone el 12 en 0x6000 (con su copia en 0xC381-0xC383)
	ld a,001h		;5fb5   ; 0xD455 = 1
	ld (0d455h),a		;5fb7
	call 072a1h		;5fba   ; p12:72A1
	jr L_5F65		;5fbd
a_p12_746b:		; p12:746B con el banco 12 en 0x6000
	call bancos_12		;5fbf   ; bancos_12: pone el 12 en 0x6000 (con su copia en 0xC381-0xC383)
	call bancos_56		;5fc2   ; bancos_56: pone el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0746bh		;5fc5   ; p12:746B
	jr L_5F65		;5fc8
a_p12_7462:		; p12:7462 con el banco 12 en 0x6000
	call bancos_12		;5fca   ; bancos_12: pone el 12 en 0x6000 (con su copia en 0xC381-0xC383)
	call bancos_56		;5fcd   ; bancos_56: pone el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	call 07462h		;5fd0   ; p12:7462
	jr L_5F65		;5fd3
a_p12_6e70_b_4_5:		; a_p12_6e70 y deja los bancos 4 y 5
	call a_p12_6e70		;5fd5   ; a_p12_6e70: p12:6E70 con el banco 12 en 0x6000
	jr L_5FDD		;5fd8
a_p12_6e6c_b_4_5:		; a_p12_6e6c y deja los bancos 4 y 5
	call a_p12_6e6c		;5fda   ; a_p12_6e6c: p12:6E6C con el banco 12 en 0x6000
L_5FDD:
	jp bancos_4_5		;5fdd   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
a_p12_6e6c_b_7:		; a_p12_6e6c y deja el banco 7
	call a_p12_6e6c		;5fe0   ; a_p12_6e6c: p12:6E6C con el banco 12 en 0x6000
L_5FE3:
	jp bancos_7		;5fe3   ; bancos_7: pone el 7 en 0xA000 (con su copia en 0xC381-0xC383)
a_p12_6f41_b_7:		; a_p12_6f41 y deja el banco 7
	call a_p12_6f41		;5fe6   ; a_p12_6f41: p12:6F41 con el banco 12 en 0x6000
	jr L_5FE3		;5fe9
a_p12_6f41_b_8:		; a_p12_6f41 y deja el banco 8
	call a_p12_6f41		;5feb   ; a_p12_6f41: p12:6F41 con el banco 12 en 0x6000
	jp bancos_8		;5fee   ; bancos_8: pone el 8 en 0xA000 (con su copia en 0xC381-0xC383)
slot_del_cartucho:		; el slot de la pagina 1 (la del cartucho)...
	call 00138h		;5ff1   ; BIOS RSLREG - Reads the primary slot register
	rrca			;5ff4   ; ...los bits 2-3 del registro de slots
	rrca			;5ff5
	and 003h		;5ff6
	ld c,a			;5ff8
	ld b,000h		;5ff9
	ld hl,0fcc1h		;5ffb   ; si esta expandido (0xFCC1, EXPTBL de la BIOS)
	add hl,bc			;5ffe
	ld a,(hl)			;5fff
