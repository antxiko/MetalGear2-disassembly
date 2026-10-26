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
	ld hl,0ffffh		;4009   ; 0xC64B = 0xFFFF (todos los registros del SCC a escribir)...
	ld (0c64bh),hl		;400c   ; guarda los registros del SCC que cambiaron este cuadro (16 bits, uno por registro)
	ld hl,0c64dh		;400f   ; ...0xC64D-0xC65C a 1...
	ld de,0c64eh		;4012
	ld (hl),001h		;4015
	ld bc,0000eh		;4017
	ldir		;401a
	call scc_registros		;401c   ; ...escritos en el SCC...
	ld a,0bfh		;401f   ; ...y el mezclador del PSG a 0xBF (todo callado)
	jp pon_mezclador		;4021   ; pon_mezclador: R#7 = A (y en 0xC643)
pide_sonido:		; pide el sonido A (0xF0-0xFF son ordenes: callar, fundir...)
	ld c,a			;4024   ; C = el sonido
	ld (0c661h),a		;4025   ; guarda el ultimo sonido pedido
	call banco_de_musica		;4028   ; el banco de su musica
	ld a,c			;402b
	cp 0f0h		;402c   ; por debajo de 0xF0, un sonido
	jp c,cabecera_de_sonido		;402e   ; cabecera_de_sonido: la cabecera del sonido A (tabla p17:65A9, 2 bytes por sonido): [canales][prioridad] y un puntero de partitura por canal; 0x10 solo el canal 8, 0x30 los canales 4 y 8 (el 0x40 no pisa al 0x40), 0xCF todos menos 4 y 8 y si no los ocho; cada canal solo si su prioridad no es mayor
	cp 0f3h		;4031   ; 0xF3: fuera el fundido
	jp z,sin_fundido		;4033   ; sin_fundido: fuera el fundido (solo quedan los bits 1-2 de 0xC640) y su cuenta a 0
	cp 0f4h		;4036   ; 0xF4: fundido de todo menos los canales 4 y 8
	jp z,fundido_f4		;4038   ; fundido_f4: el bit 4 de 0xC640 y en marcha
	cp 0f6h		;403b   ; 0xF6: fundido de todo
	jp z,fundido_f6		;403d   ; fundido_f6: el bit 5 y en marcha
	cp 0f7h		;4040   ; 0xF7: fundido de 2, 0x10, 0x20 y 0x80
	jp z,fundido_f7		;4042   ; fundido_f7: el bit 6 y en marcha
	cp 0f8h		;4045   ; 0xF8: fundido de 1, 2, 0x10, 0x40 y 0x80
	jp z,fundido_f8		;4047   ; fundido_f8: el bit 3 y en marcha
	cp 0f9h		;404a   ; 0xF9: fundido de 4 y 8
	jp z,fundido_f9		;404c   ; fundido_f9: el bit 7 y en marcha
	cp 0fbh		;404f   ; 0xFB: fuera la pausa
	jp z,fuera_pausa		;4051   ; fuera_pausa: el pedido 0xFB: 0xC698 = 0, los volumenes de vuelta y todo el SCC a escribir
	cp 0fah		;4054   ; 0xFA: la pausa
	jp z,pausa		;4056   ; pausa: el pedido 0xFA: 0xC698 = 1, los volumenes de 1, 2 y 4 guardados y a 0 sin envolvente, y el SCC callado (sus 5 volumenes a 0)
	cp 0f1h		;4059   ; 0xF1: el canal 8 de vuelta
	jp z,canal_8_de_vuelta		;405b   ; canal_8_de_vuelta: el pedido 0xF1: fuera el bit 1 de 0xC640 (con el 2, el fundido otra vez); el canal 8 de 0xC600, su onda a cargar, los volumenes de los canales 1, 2 y 4 de vuelta y todo el SCC a escribir
	cp 0f2h		;405e   ; 0xF2: el canal 8 guardado
	call z,canal_8_guardado		;4060   ; canal_8_guardado: el pedido 0xF2: el bit 1 de 0xC640 (con el fundido en marcha, al bit 2), el canal 8 a 0xC600, los volumenes de 1, 2 y 4 guardados y a 0 sin envolvente, los volumenes del SCC 2-5 a 0 y el sonido 6 (C = 6)
cabecera_de_sonido:		; la cabecera del sonido A (tabla p17:65A9, 2 bytes por sonido): [canales][prioridad] y un puntero de partitura por canal; 0x10 solo el canal 8, 0x30 los canales 4 y 8 (el 0x40 no pisa al 0x40), 0xCF todos menos 4 y 8 y si no los ocho; cada canal solo si su prioridad no es mayor
	ld hl,065a9h		;4063   ; sonidos: 171 palabras
	add a,c			;4066   ; + 2 * A
	ld e,a			;4067
	ld d,000h		;4068
	jp nc,L_406F		;406a   ; con acarreo, 0x100 mas
	ld d,001h		;406d
L_406F:
	add hl,de			;406f
	ld e,(hl)			;4070   ; la cabecera
	inc hl			;4071
	ld d,(hl)			;4072
	ex de,hl			;4073
	ld a,(hl)			;4074   ; B = los canales
	ld b,a			;4075
	inc hl			;4076
	ld c,(hl)			;4077   ; C = la prioridad
	ex de,hl			;4078
	inc de			;4079   ; DE = los punteros
	cp 010h		;407a   ; 0x10: el canal 8
	jp z,canal_8		;407c   ; canal_8: con su prioridad por debajo de la del canal 8, nada
	cp 030h		;407f   ; 0x30: los canales 4 y 8
	jp nz,sonido_de_todos		;4081   ; sonido_de_todos: con su prioridad por debajo de la del canal 1, nada
	ld a,(0c661h)		;4084   ; el sonido 0x40...
	cp 040h		;4087
	jp nz,canales_4_y_8		;4089   ; canales_4_y_8: con su prioridad por debajo de la del canal 4, nada
	ld a,(0c480h)		;408c   ; ...con el 0x40 en el canal 4, nada
	cp 040h		;408f
	ret z			;4091
canales_4_y_8:		; con su prioridad por debajo de la del canal 4, nada
	ld a,c			;4092
	ld hl,0c481h		;4093
	cp (hl)			;4096
	ret c			;4097
	call arranca_canal		;4098   ; el canal 4...
	ld hl,0c4c1h		;409b   ; ...y el 8
	jp arranca_canal		;409e   ; arranca_canal: pone en marcha un canal con el puntero de partitura de DE
sonido_de_todos:		; con su prioridad por debajo de la del canal 1, nada
	ld a,c			;40a1
	ld hl,0c401h		;40a2
	cp (hl)			;40a5
	ret c			;40a6
	ld a,(0c661h)		;40a7   ; las musicas 0x82 y 0x88...
	cp 082h		;40aa
	jp z,musica_82_88		;40ac   ; musica_82_88: ...0xC697 = 1
	cp 088h		;40af
	jp nz,otra_musica		;40b1   ; otra_musica: 0xC697 = 0
musica_82_88:		; ...0xC697 = 1
	ld a,001h		;40b4
	ld (0c697h),a		;40b6   ; guarda 1 mientras suenan las musicas 0x82 u 0x88
	jp arranca_musica		;40b9   ; arranca_musica: fuera el fundido
otra_musica:		; 0xC697 = 0
	xor a			;40bc
	ld (0c697h),a		;40bd   ; guarda 1 mientras suenan las musicas 0x82 u 0x88
arranca_musica:		; fuera el fundido
	call sin_fundido		;40c0   ; sin_fundido: fuera el fundido (solo quedan los bits 1-2 de 0xC640) y su cuenta a 0
	ld a,b			;40c3   ; 0xCF: todos menos 4 y 8
	cp 0cfh		;40c4
	jp nz,los_ocho_canales		;40c6   ; los_ocho_canales: los ocho, del 1 al 0x80
	ld hl,0c401h		;40c9   ; canal 1
	call arranca_canal		;40cc   ; arranca_canal: pone en marcha un canal con el puntero de partitura de DE
	ld hl,0c441h		;40cf   ; canal 2
	call arranca_canal		;40d2   ; arranca_canal: pone en marcha un canal con el puntero de partitura de DE
	ld hl,0c501h		;40d5   ; canal 0x10
	call arranca_canal		;40d8   ; arranca_canal: pone en marcha un canal con el puntero de partitura de DE
	ld hl,0c541h		;40db   ; canal 0x20
	call arranca_canal		;40de   ; arranca_canal: pone en marcha un canal con el puntero de partitura de DE
	ld hl,0c581h		;40e1   ; canal 0x40
	call arranca_canal		;40e4   ; arranca_canal: pone en marcha un canal con el puntero de partitura de DE
	ld hl,0c5c1h		;40e7   ; canal 0x80
	jp arranca_canal		;40ea   ; arranca_canal: pone en marcha un canal con el puntero de partitura de DE
los_ocho_canales:		; los ocho, del 1 al 0x80
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
	ld (hl),c			;411a   ; la prioridad (byte 1)...
	dec hl			;411b   ; ...el sonido (byte 0)...
	ld a,(0c661h)		;411c   ; lee el ultimo sonido pedido
	ld (hl),a			;411f
	inc hl			;4120
	inc hl			;4121
	ld a,(de)			;4122   ; ...el puntero de su partitura (bytes 2-3)...
	ld (hl),a			;4123
	inc hl			;4124
	inc de			;4125
	ld a,(de)			;4126
	ld (hl),a			;4127
	inc hl			;4128
	ld a,001h		;4129   ; ...la nota acaba ya (byte 4 = 1)...
	ld (hl),a			;412b
	inc de			;412c
	inc hl			;412d   ; ...y el resto (0x3B bytes) a 0
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
canal_8:		; con su prioridad por debajo de la del canal 8, nada
	ld a,c			;413d
	ld hl,0c4c1h		;413e
	cp (hl)			;4141
	ret c			;4142
	jp arranca_canal		;4143   ; arranca_canal: pone en marcha un canal con el puntero de partitura de DE
sin_fundido:		; fuera el fundido (solo quedan los bits 1-2 de 0xC640) y su cuenta a 0
	ld a,(0c640h)		;4146   ; lee el fundido: bit 0 en marcha, bits 3-7 que canales (los pedidos 0xF4-0xF9); bits 1-2 la pausa del canal 8 (0xF2)
	and 006h		;4149
	ld (0c640h),a		;414b   ; guarda el fundido: bit 0 en marcha, bits 3-7 que canales (los pedidos 0xF4-0xF9); bits 1-2 la pausa del canal 8 (0xF2)
	jp cuenta_fundido_0		;414e   ; cuenta_fundido_0: la cuenta y lo bajado a 0
fundido_f4:		; el bit 4 de 0xC640 y en marcha
	ld hl,0c640h		;4151   ; apunta a el fundido: bit 0 en marcha, bits 3-7 que canales (los pedidos 0xF4-0xF9); bits 1-2 la pausa del canal 8 (0xF2)
	set 4,(hl)		;4154
	jp fundido_en_marcha		;4156   ; fundido_en_marcha: en marcha
fundido_f6:		; el bit 5 y en marcha
	ld hl,0c640h		;4159   ; apunta a el fundido: bit 0 en marcha, bits 3-7 que canales (los pedidos 0xF4-0xF9); bits 1-2 la pausa del canal 8 (0xF2)
	set 5,(hl)		;415c
	jp fundido_en_marcha		;415e   ; fundido_en_marcha: en marcha
fundido_f7:		; el bit 6 y en marcha
	ld hl,0c640h		;4161   ; apunta a el fundido: bit 0 en marcha, bits 3-7 que canales (los pedidos 0xF4-0xF9); bits 1-2 la pausa del canal 8 (0xF2)
	set 6,(hl)		;4164
	jp fundido_en_marcha		;4166   ; fundido_en_marcha: en marcha
fundido_f8:		; el bit 3 y en marcha
	ld hl,0c640h		;4169   ; apunta a el fundido: bit 0 en marcha, bits 3-7 que canales (los pedidos 0xF4-0xF9); bits 1-2 la pausa del canal 8 (0xF2)
	set 3,(hl)		;416c
	jp fundido_en_marcha		;416e   ; fundido_en_marcha: en marcha
fundido_f9:		; el bit 7 y en marcha
	ld hl,0c640h		;4171   ; apunta a el fundido: bit 0 en marcha, bits 3-7 que canales (los pedidos 0xF4-0xF9); bits 1-2 la pausa del canal 8 (0xF2)
	set 7,(hl)		;4174
fundido_en_marcha:		; en marcha
	set 0,(hl)		;4176
cuenta_fundido_0:		; la cuenta y lo bajado a 0
	ld hl,00000h		;4178
	ld (0c641h),hl		;417b   ; guarda la cuenta de cuadros del fundido (0x25 por paso) y el byte siguiente (16 bits)
	ret			;417e
canal_8_de_vuelta:		; el pedido 0xF1: fuera el bit 1 de 0xC640 (con el 2, el fundido otra vez); el canal 8 de 0xC600, su onda a cargar, los volumenes de los canales 1, 2 y 4 de vuelta y todo el SCC a escribir
	ld hl,0c640h		;417f   ; apunta a el fundido: bit 0 en marcha, bits 3-7 que canales (los pedidos 0xF4-0xF9); bits 1-2 la pausa del canal 8 (0xF2)
	res 1,(hl)		;4182
	bit 2,(hl)		;4184   ; con el bit 2...
	jp z,canal_8_de_c600		;4186   ; canal_8_de_c600: el canal 8 de vuelta
	res 2,(hl)		;4189   ; ...el fundido sigue
	set 0,(hl)		;418b
canal_8_de_c600:		; el canal 8 de vuelta
	ld hl,0c600h		;418d   ; apunta a la copia del canal 8 (0x40 bytes) en la pausa (el pedido 0xF2)
	ld de,0c4c0h		;4190
	ld bc,00040h		;4193
	ldir		;4196
	ld hl,0c4ebh		;4198   ; su onda a cargar
	set 7,(hl)		;419b
	ld a,(0c65dh)		;419d   ; los volumenes guardados
	ld (0c40fh),a		;41a0
	ld a,(0c65eh)		;41a3   ; lee el volumen del canal 2 guardado en la pausa
	ld (0c44fh),a		;41a6
	ld a,(0c65fh)		;41a9   ; lee el volumen del canal 4 guardado en la pausa
	ld (0c48fh),a		;41ac
	ld hl,0ffffh		;41af   ; todo el SCC a escribir
	ld (0c64bh),hl		;41b2   ; guarda los registros del SCC que cambiaron este cuadro (16 bits, uno por registro)
	jp scc_registros		;41b5   ; scc_registros: los 16 registros del SCC (0x9880-0x988F) con su bit en 0xC64B-0xC64C, desde sus copias
canal_8_guardado:		; el pedido 0xF2: el bit 1 de 0xC640 (con el fundido en marcha, al bit 2), el canal 8 a 0xC600, los volumenes de 1, 2 y 4 guardados y a 0 sin envolvente, los volumenes del SCC 2-5 a 0 y el sonido 6 (C = 6)
	ld hl,0c640h		;41b8   ; apunta a el fundido: bit 0 en marcha, bits 3-7 que canales (los pedidos 0xF4-0xF9); bits 1-2 la pausa del canal 8 (0xF2)
	set 1,(hl)		;41bb
	bit 0,(hl)		;41bd   ; con el fundido en marcha...
	jp z,guarda_canal_8		;41bf   ; guarda_canal_8: el canal 8 a 0xC600
	res 0,(hl)		;41c2   ; ...se para y queda el bit 2
	set 2,(hl)		;41c4
guarda_canal_8:		; el canal 8 a 0xC600
	ld hl,0c4c0h		;41c6
	ld de,0c600h		;41c9   ; apunta a la copia del canal 8 (0x40 bytes) en la pausa (el pedido 0xF2)
	ld bc,00040h		;41cc
	ldir		;41cf
	ld a,(0c40fh)		;41d1   ; los volumenes de 1, 2 y 4 guardados...
	ld (0c65dh),a		;41d4   ; guarda el volumen del canal 1 guardado en la pausa
	ld a,(0c44fh)		;41d7
	ld (0c65eh),a		;41da   ; guarda el volumen del canal 2 guardado en la pausa
	ld a,(0c48fh)		;41dd
	ld (0c65fh),a		;41e0   ; guarda el volumen del canal 4 guardado en la pausa
	xor a			;41e3   ; ...y a 0
	ld (0c40fh),a		;41e4
	ld (0c44fh),a		;41e7
	ld (0c48fh),a		;41ea
	ld a,(0c40eh)		;41ed   ; sin envolvente
	res 4,a		;41f0
	ld (0c40eh),a		;41f2
	ld a,(0c44eh)		;41f5
	res 4,a		;41f8
	ld (0c44eh),a		;41fa
	ld a,(0c48eh)		;41fd
	res 4,a		;4200
	ld (0c48eh),a		;4202
	ld a,03fh		;4205   ; los registros del SCC
	ld (09000h),a		;4207   ; 0x3F en 0x9000: los registros del SCC en 0x9800
	ld hl,00000h		;420a   ; los volumenes del SCC 2-5 a 0
	ld (0988bh),hl		;420d
	ld (0988dh),hl		;4210
	ld a,012h		;4213   ; el banco 0x12 en 0x8000
	ld (09000h),a		;4215   ; el mapper: pone en 0x8000 el banco de A
	ld a,006h		;4218   ; el sonido 6
	ld (0c661h),a		;421a   ; guarda el ultimo sonido pedido
	ld c,a			;421d
	ret			;421e
pausa:		; el pedido 0xFA: 0xC698 = 1, los volumenes de 1, 2 y 4 guardados y a 0 sin envolvente, y el SCC callado (sus 5 volumenes a 0)
	ld a,001h		;421f
	ld (0c698h),a		;4221   ; guarda 1 con el sonido en pausa (el pedido 0xFA; el 0xFB la quita)
	ld a,(0c40fh)		;4224   ; los volumenes guardados...
	ld (0c65dh),a		;4227   ; guarda el volumen del canal 1 guardado en la pausa
	ld a,(0c44fh)		;422a
	ld (0c65eh),a		;422d   ; guarda el volumen del canal 2 guardado en la pausa
	ld a,(0c48fh)		;4230
	ld (0c65fh),a		;4233   ; guarda el volumen del canal 4 guardado en la pausa
	xor a			;4236   ; ...y a 0
	ld (0c40fh),a		;4237
	ld (0c44fh),a		;423a
	ld (0c48fh),a		;423d
	ld a,(0c40eh)		;4240   ; sin envolvente
	res 4,a		;4243
	ld (0c40eh),a		;4245
	ld a,(0c44eh)		;4248
	res 4,a		;424b
	ld (0c44eh),a		;424d
	ld a,(0c48eh)		;4250
	res 4,a		;4253
	ld (0c48eh),a		;4255
	ld a,03fh		;4258   ; los registros del SCC
	ld (09000h),a		;425a   ; 0x3F en 0x9000: los registros del SCC en 0x9800
	xor a			;425d   ; el volumen del SCC 1 a 0...
	ld (0988ah),a		;425e
	ld hl,00000h		;4261   ; ...y los de 2-5
	ld (0988bh),hl		;4264
	ld (0988dh),hl		;4267
	ld a,012h		;426a   ; el banco 0x12 en 0x8000
	ld (09000h),a		;426c   ; el mapper: pone en 0x8000 el banco de A
	ret			;426f
fuera_pausa:		; el pedido 0xFB: 0xC698 = 0, los volumenes de vuelta y todo el SCC a escribir
	xor a			;4270
	ld (0c698h),a		;4271   ; guarda 1 con el sonido en pausa (el pedido 0xFA; el 0xFB la quita)
	ld a,(0c65dh)		;4274   ; los volumenes guardados
	ld (0c40fh),a		;4277
	ld a,(0c65eh)		;427a   ; lee el volumen del canal 2 guardado en la pausa
	ld (0c44fh),a		;427d
	ld a,(0c65fh)		;4280   ; lee el volumen del canal 4 guardado en la pausa
	ld (0c48fh),a		;4283
	ld hl,0ffffh		;4286   ; todo el SCC a escribir
	ld (0c64bh),hl		;4289   ; guarda los registros del SCC que cambiaron este cuadro (16 bits, uno por registro)
	jp scc_registros		;428c   ; scc_registros: los 16 registros del SCC (0x9880-0x988F) con su bit en 0xC64B-0xC64C, desde sus copias
sonido_cada_cuadro:		; el sonido de un cuadro: los ocho canales
	ld a,(0c643h)		;428f   ; el mezclador de nuevo
	call pon_mezclador		;4292   ; pon_mezclador: R#7 = A (y en 0xC643)
	call pon_banco_de_musica		;4295   ; el banco de la musica en 0xA000
	ld a,(0fda2h)		;4298   ; si 0xFDA2 ya no es el de antes...
	ld hl,0c660h		;429b   ; apunta a el contador de 0xFDA2 del cuadro anterior
	cp (hl)			;429e
	jp z,sonido_cuadro_a		;429f   ; sonido_cuadro_a: uno mas, tambien en 0xFDA2
	ld ix,0c4c0h		;42a2   ; ...las ondas de los canales 8-0x40 a cargar...
	set 7,(ix+02bh)		;42a6   ; pone a uno el bit 7 de las marcas del volumen (bit 7: la onda a cargar)
	ld ix,0c500h		;42aa
	set 7,(ix+02bh)		;42ae   ; pone a uno el bit 7 de las marcas del volumen (bit 7: la onda a cargar)
	ld ix,0c540h		;42b2
	set 7,(ix+02bh)		;42b6   ; pone a uno el bit 7 de las marcas del volumen (bit 7: la onda a cargar)
	ld ix,0c580h		;42ba
	set 7,(ix+02bh)		;42be   ; pone a uno el bit 7 de las marcas del volumen (bit 7: la onda a cargar)
	ld a,(0fda2h)		;42c2   ; ...y se toma el nuevo
	ld (hl),a			;42c5
sonido_cuadro_a:		; uno mas, tambien en 0xFDA2
	inc (hl)			;42c6
	ld a,(hl)			;42c7
	ld (0fda2h),a		;42c8   ; guarda una copia de cuadros para el sonido (p16:4298)
	ld a,(0c698h)		;42cb   ; en pausa, solo la salida
	or a			;42ce
	jp nz,salida_de_sonido		;42cf   ; salida_de_sonido: la salida del cuadro: el ruido de los canales 1 y 4, los periodos y volumenes del PSG, su ruido y su envolvente, el mezclador, lo cambiado del SCC, sus canales encendidos, sus registros y sus ondas
	ld hl,0c640h		;42d2   ; con el canal 8 guardado, solo el canal 8
	bit 1,(hl)		;42d5
	jp nz,solo_canal_8		;42d7   ; solo_canal_8: el canal 8 y la salida
	bit 0,(hl)		;42da   ; el fundido
	call nz,fundido		;42dc   ; fundido: el fundido de cada cuadro: cada 0x25 cuadros el volumen baja uno mas (0xC642); a 0x0F acaban los canales de su pedido (bit 7: 4 y 8; 6: 0x20, 2, 0x10 y 0x80; 3: 0x40 y esos; 4: todos menos 4 y 8; si no, los ocho) y se quita
	ld a,001h		;42df   ; canal 1 (PSG A)
	ld (0c644h),a		;42e1   ; guarda el canal de sonido que se esta tocando (1, 2, 4...)
	ld ix,0c400h		;42e4
	call canal_cada_cuadro		;42e8   ; canal_cada_cuadro: un cuadro de un canal: cuenta la nota y lee la siguiente
	ld a,002h		;42eb   ; canal 2 (PSG B)
	ld (0c644h),a		;42ed   ; guarda el canal de sonido que se esta tocando (1, 2, 4...)
	ld ix,0c440h		;42f0
	call canal_cada_cuadro		;42f4   ; canal_cada_cuadro: un cuadro de un canal: cuenta la nota y lee la siguiente
	ld a,004h		;42f7   ; canal 4 (PSG C)
	ld (0c644h),a		;42f9   ; guarda el canal de sonido que se esta tocando (1, 2, 4...)
	ld ix,0c480h		;42fc
	call canal_cada_cuadro		;4300   ; canal_cada_cuadro: un cuadro de un canal: cuenta la nota y lee la siguiente
	ld a,008h		;4303   ; canal 8 (SCC 1)
	ld (0c644h),a		;4305   ; guarda el canal de sonido que se esta tocando (1, 2, 4...)
	ld ix,0c4c0h		;4308
	call canal_cada_cuadro		;430c   ; canal_cada_cuadro: un cuadro de un canal: cuenta la nota y lee la siguiente
	ld a,010h		;430f   ; canal 0x10 (SCC 2)
	ld (0c644h),a		;4311   ; guarda el canal de sonido que se esta tocando (1, 2, 4...)
	ld ix,0c500h		;4314
	call canal_cada_cuadro		;4318   ; canal_cada_cuadro: un cuadro de un canal: cuenta la nota y lee la siguiente
	ld a,020h		;431b   ; canal 0x20 (SCC 3)
	ld (0c644h),a		;431d   ; guarda el canal de sonido que se esta tocando (1, 2, 4...)
	ld ix,0c540h		;4320
	call canal_cada_cuadro		;4324   ; canal_cada_cuadro: un cuadro de un canal: cuenta la nota y lee la siguiente
	ld a,040h		;4327   ; canal 0x40 (SCC 4)
	ld (0c644h),a		;4329   ; guarda el canal de sonido que se esta tocando (1, 2, 4...)
	ld ix,0c580h		;432c
	call canal_cada_cuadro		;4330   ; canal_cada_cuadro: un cuadro de un canal: cuenta la nota y lee la siguiente
	ld a,(0ca5fh)		;4333   ; con la alerta 1...
	cp 001h		;4336
	jp nz,canal_80		;4338   ; canal_80: canal 0x80 (SCC 5)
	ld (ix+03ch),009h		;433b   ; ...las cuatro ondas del canal 0x40: 9, 0x1C, 9, 9
	ld (ix+03dh),01ch		;433f
	ld (ix+03eh),009h		;4343
	ld (ix+03fh),009h		;4347
canal_80:		; canal 0x80 (SCC 5)
	ld a,080h		;434b
	ld (0c644h),a		;434d   ; guarda el canal de sonido que se esta tocando (1, 2, 4...)
	ld ix,0c5c0h		;4350
	call canal_cada_cuadro		;4354   ; canal_cada_cuadro: un cuadro de un canal: cuenta la nota y lee la siguiente
	jp salida_de_sonido		;4357   ; y la salida al PSG y al SCC
solo_canal_8:		; el canal 8 y la salida
	ld a,008h		;435a
	ld (0c644h),a		;435c   ; guarda el canal de sonido que se esta tocando (1, 2, 4...)
	ld ix,0c4c0h		;435f
	call canal_cada_cuadro		;4363   ; canal_cada_cuadro: un cuadro de un canal: cuenta la nota y lee la siguiente
	jp salida_de_sonido		;4366   ; salida_de_sonido: la salida del cuadro: el ruido de los canales 1 y 4, los periodos y volumenes del PSG, su ruido y su envolvente, el mezclador, lo cambiado del SCC, sus canales encendidos, sus registros y sus ondas
canal_cada_cuadro:		; un cuadro de un canal: cuenta la nota y lee la siguiente
	ld a,(ix+000h)		;4369   ; lee el sonido del canal (0 = callado)
	or a			;436c
	ret z			;436d   ; callado, nada
	dec (ix+004h)		;436e   ; baja lo que le queda a la nota
	ld a,(ix+004h)		;4371   ; lee lo que le queda a la nota
	cp 0ffh		;4374   ; 0xFF: el byte alto uno menos
	jp z,nota_byte_alto		;4376   ; nota_byte_alto: el byte alto uno menos
	or a			;4379
	jp z,nota_acabada		;437a   ; a 0, mira el alto
	jp canal_sigue_nota		;437d   ; si no, lo de cada cuadro
nota_byte_alto:		; el byte alto uno menos
	dec (ix+01fh)		;4380   ; baja lo que le queda a la nota (alto)
	jp canal_sigue_nota		;4383   ; canal_sigue_nota: lo de cada cuadro de una nota: con la bateria, su nota (p16:46F4); si no, el deslizamiento (p16:471D), el barrido (p16:4767), el vibrato (p16:4792), la envolvente de volumen (p16:4944) o el volumen simple (p16:4862) y, en el canal 0x10, la mezcla de ondas (p16:4A43)
nota_acabada:		; con el alto a 0, la nota se acaba
	or (ix+01fh)		;4386   ; OR con lo que le queda a la nota (alto)
	jp nz,canal_sigue_nota		;4389   ; canal_sigue_nota: lo de cada cuadro de una nota: con la bateria, su nota (p16:46F4); si no, el deslizamiento (p16:471D), el barrido (p16:4767), el vibrato (p16:4792), la envolvente de volumen (p16:4944) o el volumen simple (p16:4862) y, en el canal 0x10, la mezcla de ondas (p16:4A43)
	ld l,(ix+002h)		;438c   ; lee el puntero de la partitura (bajo)
	ld h,(ix+003h)		;438f   ; lee el puntero de la partitura (alto)
lee_partitura:		; la siguiente nota u orden de la partitura (0xFF acaba, 0xD0-0xFE ordenes)
	ld a,(hl)			;4392
	cp 0ffh		;4393   ; 0xFF: se acaba
	jp z,fin_de_partitura		;4395   ; fin_de_partitura: la orden 0xFF: acaba el canal (y avisa de algunas musicas)
	cp 0d0h		;4398   ; 0xD0-0xFE: una orden...
	jp c,es_nota		;439a   ; es_nota: una nota: [nota (nibble alto, 0x0C silencio)][duracion (nibble bajo)]; con el bit 1 del modo, de bateria; con los bits 2-4, la bateria
	ex de,hl			;439d   ; ...con DE en ella
	call orden_de_partitura		;439e   ; orden_de_partitura: salta por la tabla p16:4D52 con la orden A (0xD0-0xFE)
	ex de,hl			;43a1
	inc hl			;43a2   ; la siguiente
	jp lee_partitura		;43a3   ; lee_partitura: la siguiente nota u orden de la partitura (0xFF acaba, 0xD0-0xFE ordenes)
es_nota:		; una nota: [nota (nibble alto, 0x0C silencio)][duracion (nibble bajo)]; con el bit 1 del modo, de bateria; con los bits 2-4, la bateria
	ld a,(ix+00bh)		;43a6   ; lee el modo del canal (orden 0xFE; bits 2-4 bateria)
	bit 1,a		;43a9   ; nota de bateria
	jp nz,nota_de_bateria		;43ab   ; nota_de_bateria: una nota de bateria por lo que suena: 0 nada; 1 el volumen del nibble bajo; 2 y 3 el volumen del nibble alto y el periodo de 12 bits (nibble bajo y el byte siguiente); el volumen + 2 (en el PSG con envolvente, 0x10 + 2) menos el fundido; la duracion la del byte 0x14
	and 01ch		;43ae   ; la bateria
	jp nz,bateria		;43b0   ; bateria: la bateria: la duracion (p16:43B3) y la nota elige una partitura de bateria de la tabla del modo (p16:4674); en el canal 0x40 con el sonido 0x74 y la alerta 1, siempre la primera de p16:5486; se lee su primera nota y queda en marcha (bit 0 del byte 0x10)
duracion_de_nota:		; la duracion (nibble bajo) * el tempo, en los bytes 4 y 0x1F; lo que suena (byte 0x29) = duracion * byte 0x26 / 16
	ld a,(hl)			;43b3   ; B = la duracion
	and 00fh		;43b4
	ld b,a			;43b6
	ld a,(ix+015h)		;43b7   ; el tempo
	jp z,pon_duracion		;43ba   ; pon_duracion:
	ld e,a			;43bd
por_tempo:		; + el tempo
	add a,e			;43be
	jp nc,L_43C5		;43bf
	inc (ix+01fh)		;43c2   ; con acarreo, el byte alto
L_43C5:
	djnz por_tempo		;43c5   ; B veces
pon_duracion:
	ld (ix+004h),a		;43c7   ; guarda lo que le queda a la nota
	ld c,a			;43ca   ; C = la duracion
	push bc			;43cb
	ld (ix+029h),004h		;43cc   ; 4 bits
	ld bc,00000h		;43d0   ; CB = 0
	ld e,000h		;43d3
	ld d,(ix+026h)		;43d5   ; D = lo que suena de la nota
por_dieciseisavos:		; cada bit de D...
	srl d		;43d8
	jp nc,dieciseisavo_siguiente		;43da   ; dieciseisavo_siguiente: la duracion * 2
	ld a,(ix+004h)		;43dd   ; ...+ la duracion desplazada
	add a,b			;43e0
	ld b,a			;43e1
	ld a,e			;43e2
	adc a,c			;43e3
	ld c,a			;43e4
dieciseisavo_siguiente:		; la duracion * 2
	sla (ix+004h)		;43e5
	rl e		;43e9
	dec (ix+029h)		;43eb   ; 4
	jp nz,por_dieciseisavos		;43ee   ; por_dieciseisavos: cada bit de D...
	srl c		;43f1   ; / 16
	rr b		;43f3
	srl c		;43f5
	rr b		;43f7
	srl c		;43f9
	rr b		;43fb
	srl c		;43fd
	rr b		;43ff
	ld (ix+029h),b		;4401   ; guarda lo que queda de nota cuando se corta
	pop bc			;4404   ; la duracion de vuelta
	ld (ix+004h),c		;4405   ; guarda lo que le queda a la nota
	ld a,(hl)			;4408   ; la nota (nibble alto)
	and 0f0h		;4409
	rrca			;440b
	rrca			;440c
	rrca			;440d
	rrca			;440e
	inc hl			;440f   ; el byte siguiente
	ld (ix+002h),l		;4410   ; guarda el puntero de la partitura (bajo)
	ld (ix+003h),h		;4413   ; guarda el puntero de la partitura (alto)
	bit 7,(ix+00bh)		;4416   ; con el bit 7 del modo, nada mas
	ret nz			;441a
	cp 00ch		;441b   ; 0x0C-0x0F: silencio
	jp nc,silencio		;441d   ; silencio: sin tono
	ld hl,045beh		;4420   ; su periodo de la tabla p16:45BE (12 notas)
	ld e,a			;4423
	ld d,000h		;4424
	add hl,de			;4426
	ld l,(hl)			;4427
	ld h,000h		;4428
	ld a,(ix+017h)		;442a   ; por la octava...
	or a			;442d
	jp z,mira_deslizamiento		;442e   ; mira_deslizamiento: con el bit 4 de las marcas del deslizamiento: el bit 7 segun la nota nueva sea mas grave (periodo mayor) o no que la de antes (el bit 3 lo salta una vez)
	ld b,a			;4431
octava_mas:		; ...el periodo * 2
	add hl,hl			;4432
	djnz octava_mas		;4433
mira_deslizamiento:		; con el bit 4 de las marcas del deslizamiento: el bit 7 segun la nota nueva sea mas grave (periodo mayor) o no que la de antes (el bit 3 lo salta una vez)
	bit 4,(ix+03ah)		;4435   ; mira el bit 4 de las marcas del deslizamiento (ordenes 0xD6-0xDA)
	jp z,pon_periodo		;4439   ; pon_periodo: el periodo de la nota
	bit 3,(ix+03ah)		;443c   ; mira el bit 3 de las marcas del deslizamiento (ordenes 0xD6-0xDA)
	jp z,compara_periodo		;4440   ; compara_periodo: el periodo de antes
	res 3,(ix+03ah)		;4443   ; el bit 3 lo salta una vez
	jp pon_periodo		;4447   ; pon_periodo: el periodo de la nota
compara_periodo:		; el periodo de antes
	ld e,(ix+011h)		;444a   ; lee el periodo de la nota (bajo)
	ld d,(ix+012h)		;444d   ; lee el periodo de la nota (alto)
	ld a,h			;4450   ; mayor: bit 7
	cp d			;4451
	jp c,mas_agudo		;4452   ; mas_agudo: sin el bit 7
	jp z,compara_bajo		;4455   ; compara_bajo:
mas_grave:		; el bit 7
	set 7,(ix+03ah)		;4458   ; pone a uno el bit 7 de las marcas del deslizamiento (ordenes 0xD6-0xDA)
	jp pon_periodo		;445c   ; pon_periodo: el periodo de la nota
compara_bajo:
	ld a,l			;445f
	cp e			;4460
	jp c,mas_agudo		;4461   ; mas_agudo: sin el bit 7
	jp z,igual_periodo		;4464   ; igual_periodo: igual: el bit 7 solo con el bit 2
	jp mas_grave		;4467   ; mas_grave: el bit 7
igual_periodo:		; igual: el bit 7 solo con el bit 2
	bit 2,(ix+03ah)		;446a   ; mira el bit 2 de las marcas del deslizamiento (ordenes 0xD6-0xDA)
	jp nz,mas_grave		;446e   ; mas_grave: el bit 7
mas_agudo:		; sin el bit 7
	res 7,(ix+03ah)		;4471   ; pone a cero el bit 7 de las marcas del deslizamiento (ordenes 0xD6-0xDA)
pon_periodo:		; el periodo de la nota
	ld (ix+011h),l		;4475   ; guarda el periodo de la nota (bajo)
	ld (ix+012h),h		;4478   ; guarda el periodo de la nota (alto)
	bit 1,(ix+010h)		;447b   ; con el desafinado...
	jp z,suena_tono		;447f   ; suena_tono: con tono
	ld a,(ix+036h)		;4482   ; lee el desafinado (orden 0xEE; bit 7 hacia abajo)
	bit 7,a		;4485   ; ...hacia abajo (bit 7)...
	jp nz,desafina_abajo		;4487   ; desafina_abajo: - el desafinado
	add a,(ix+011h)		;448a   ; ...si no, + el desafinado
	ld (ix+011h),a		;448d   ; guarda el periodo de la nota (bajo)
	jp nc,suena_tono		;4490   ; suena_tono: con tono
	inc (ix+012h)		;4493   ; sube el periodo de la nota (alto)
	jp suena_tono		;4496   ; suena_tono: con tono
desafina_abajo:		; - el desafinado
	res 7,a		;4499
	ld c,a			;449b
	ld a,(ix+011h)		;449c   ; lee el periodo de la nota (bajo)
	sub c			;449f
	ld (ix+011h),a		;44a0   ; guarda el periodo de la nota (bajo)
	jp nc,suena_tono		;44a3   ; suena_tono: con tono
	dec (ix+012h)		;44a6   ; baja el periodo de la nota (alto)
suena_tono:		; con tono
	set 1,(ix+00fh)		;44a9   ; pone a uno el bit 1 de lo que suena (bits 0-1: 1 ruido, 2 tono, 3 los dos; bit 2 envolvente del PSG)
	ld e,(ix+011h)		;44ad   ; el periodo que suena = el de la nota
	ld d,(ix+012h)		;44b0   ; lee el periodo de la nota (alto)
	ld (ix+00ch),e		;44b3   ; guarda el periodo que suena (bajo)
	ld (ix+00dh),d		;44b6   ; guarda el periodo que suena (alto)
	bit 5,(ix+03ah)		;44b9   ; con el deslizamiento (bit 5)...
	jp z,vibrato_al_empezar		;44bd   ; vibrato_al_empezar: fuera el bit 0 del deslizamiento
	res 6,(ix+03ah)		;44c0   ; ...fuera el bit 6...
	ld l,(ix+011h)		;44c4   ; ...y empieza paso * cuenta por encima del periodo (con el bit 7, por debajo)
	ld h,(ix+012h)		;44c7   ; lee el periodo de la nota (alto)
	ld b,(ix+038h)		;44ca   ; lee la cuenta del deslizamiento
	ld d,000h		;44cd
	ld e,(ix+037h)		;44cf   ; lee el paso del deslizamiento
	bit 7,(ix+03ah)		;44d2   ; mira el bit 7 de las marcas del deslizamiento (ordenes 0xD6-0xDA)
	jp nz,desliza_restando		;44d6   ; desliza_restando: - el paso, cuenta veces
desliza_sumando:		; + el paso, cuenta veces
	add hl,de			;44d9
	djnz desliza_sumando		;44da
	jp pon_periodo_desde		;44dc   ; pon_periodo_desde:
desliza_restando:		; - el paso, cuenta veces
	sbc hl,de		;44df
	djnz desliza_restando		;44e1
pon_periodo_desde:
	ld (ix+00ch),l		;44e3   ; guarda el periodo que suena (bajo)
	ld (ix+00dh),h		;44e6   ; guarda el periodo que suena (alto)
vibrato_al_empezar:		; fuera el bit 0 del deslizamiento
	res 0,(ix+03ah)		;44e9   ; pone a cero el bit 0 de las marcas del deslizamiento (ordenes 0xD6-0xDA)
	bit 7,(ix+031h)		;44ed   ; con el vibrato: su espera + 1, el indice y el bucle a 0 y, sin espera, el primer paso (p16:4799)
	jp z,mezcla_al_empezar		;44f1   ; mezcla_al_empezar: el canal 0x10 con la mezcla de ondas en marcha...
	ld a,(ix+032h)		;44f4   ; lee la espera del vibrato
	inc a			;44f7
	ld (ix+030h),a		;44f8
	xor a			;44fb
	ld (ix+02fh),a		;44fc
	ld (ix+034h),a		;44ff
	ld (ix+035h),a		;4502
	ld a,(ix+032h)		;4505   ; lee la espera del vibrato
	or a			;4508
	call z,paso_de_vibrato		;4509   ; paso_de_vibrato: el paso del vibrato de la tabla p17:6475 (por el byte 0x31) en el indice 0x2F: [cuadros (nibble alto)][desvio (nibble bajo; desde 8, hacia abajo)] * amplitud sobre el periodo de la nota; 0xF5-0xFA otra vez desde el siguiente, 0xFB [n] repite n veces, desde 0xFC se para
mezcla_al_empezar:		; el canal 0x10 con la mezcla de ondas en marcha...
	ld a,(0c644h)		;450c   ; lee el canal de sonido que se esta tocando (1, 2, 4...)
	cp 010h		;450f
	jp nz,ondas_al_empezar		;4511   ; ondas_al_empezar: con el bit 4 de las cuatro ondas: fuera los bits 5-7 y, sin envolvente, la primera onda
	ld a,(0c68bh)		;4514   ; lee las marcas de la mezcla (bit 0 en marcha, 1 acabada, 2 ida y vuelta, 3 tambien el canal 0x20, 5 sentido)
	bit 0,a		;4517
	jp z,ondas_al_empezar		;4519   ; ondas_al_empezar: con el bit 4 de las cuatro ondas: fuera los bits 5-7 y, sin envolvente, la primera onda
	ld a,(0c68bh)		;451c   ; ...con el bit 6, solo una vez (bit 7)...
	bit 6,a		;451f
	jp z,mezcla_desde_el_principio		;4521   ; mezcla_desde_el_principio: ...vuelve a empezar: fuera los bits 1 y 5...
	bit 7,a		;4524
	jp nz,ondas_al_empezar		;4526   ; ondas_al_empezar: con el bit 4 de las cuatro ondas: fuera los bits 5-7 y, sin envolvente, la primera onda
	set 7,a		;4529
mezcla_desde_el_principio:		; ...vuelve a empezar: fuera los bits 1 y 5...
	res 1,a		;452b
	res 5,a		;452d
	ld (0c68bh),a		;452f   ; guarda las marcas de la mezcla (bit 0 en marcha, 1 acabada, 2 ida y vuelta, 3 tambien el canal 0x20, 5 sentido)
	ld a,(0c68ah)		;4532   ; ...la espera...
	ld (0c689h),a		;4535   ; guarda la espera de la mezcla
	ld a,(0c688h)		;4538   ; ...el paso...
	ld (0c687h),a		;453b   ; guarda el paso de la mezcla (0-0x0F)
	set 7,(ix+02bh)		;453e   ; ...la onda a cargar...
	ld hl,0c683h		;4542   ; ...y la primera onda copiada a 0xC663
	ld e,(hl)			;4545
	inc hl			;4546
	ld d,(hl)			;4547
	ex de,hl			;4548
	ld de,0c663h		;4549   ; apunta a la onda del SCC que se mezcla (32 bytes; orden 0xF1)
	ld bc,00020h		;454c
	ldir		;454f
ondas_al_empezar:		; con el bit 4 de las cuatro ondas: fuera los bits 5-7 y, sin envolvente, la primera onda
	ld a,(ix+03bh)		;4551   ; lee las marcas de las cuatro ondas (orden 0xF4)
	bit 4,a		;4554
	jp z,volumen_al_empezar		;4556   ; volumen_al_empezar: con la envolvente de volumen: su paso, su bucle y su cuenta a 0, el primer paso (p16:4961) y en marcha
	and 01fh		;4559
	ld (ix+03bh),a		;455b   ; guarda las marcas de las cuatro ondas (orden 0xF4)
	ld a,(ix+02ah)		;455e   ; lee la envolvente de volumen (tabla p17:6430; bit 7 parada)
	or a			;4561
	jp nz,volumen_al_empezar		;4562   ; volumen_al_empezar: con la envolvente de volumen: su paso, su bucle y su cuenta a 0, el primer paso (p16:4961) y en marcha
	ld a,(ix+03ch)		;4565   ; lee la primera de las cuatro ondas (orden 0xF4)
	call pon_onda		;4568   ; pon_onda: la onda A de la tabla p16:583E al canal, a cargar
volumen_al_empezar:		; con la envolvente de volumen: su paso, su bucle y su cuenta a 0, el primer paso (p16:4961) y en marcha
	ld a,(ix+02ah)		;456b   ; lee la envolvente de volumen (tabla p17:6430; bit 7 parada)
	or a			;456e
	jp z,volumen_sin_envolvente		;456f   ; volumen_sin_envolvente: sin envolvente: fuera los bits 2 y 3, la cuenta a 0, el volumen del canal (menos el fundido) a la nota y al que suena; con el bit 5, el bit 1 y el volumen del nibble bajo del byte 0x2E
	ld (ix+022h),000h		;4572
	ld (ix+023h),000h		;4576
	ld (ix+024h),000h		;457a
	call paso_de_envolvente		;457e   ; paso_de_envolvente: el paso de la envolvente de la tabla p17:6430 (por el byte 0x2A) en el indice 0x22: [cuadros (nibble alto)][volumen (nibble bajo)] - lo que baja el canal (byte 0x16), no por debajo del minimo; 0xF5-0xFA bucle desde el siguiente, 0xFB [n] repite n veces, desde 0xFC se para
	res 7,(ix+02ah)		;4581   ; pone a cero el bit 7 de la envolvente de volumen (tabla p17:6430; bit 7 parada)
	ret			;4585
volumen_sin_envolvente:		; sin envolvente: fuera los bits 2 y 3, la cuenta a 0, el volumen del canal (menos el fundido) a la nota y al que suena; con el bit 5, el bit 1 y el volumen del nibble bajo del byte 0x2E
	res 2,(ix+02bh)		;4586   ; pone a cero el bit 2 de las marcas del volumen (bit 7: la onda a cargar)
	res 3,(ix+02bh)		;458a   ; pone a cero el bit 3 de las marcas del volumen (bit 7: la onda a cargar)
	ld (ix+025h),000h		;458e
	ld (ix+024h),000h		;4592
	ld e,(ix+016h)		;4596   ; el volumen del canal...
	ld a,(0c640h)		;4599   ; ...menos el fundido
	and 001h		;459c
	call nz,menos_fundido		;459e   ; menos_fundido: E = el volumen E menos lo que baja el fundido (0xC642) si el canal es de los suyos (bit 5 todos; 7 4 y 8; 6 2, 0x10, 0x20 y 0x80; 3 1, 2, 0x10, 0x40 y 0x80; si no, todos menos 4 y 8); con la envolvente del PSG, 0
	ld (ix+013h),e		;45a1   ; a la nota y al que suena
	ld (ix+00eh),e		;45a4   ; guarda el volumen que suena
	bit 5,(ix+02bh)		;45a7   ; con el bit 5...
	ret z			;45ab
	set 1,(ix+02bh)		;45ac   ; ...el bit 1...
	ld a,(ix+02eh)		;45b0   ; ...y el volumen del byte 0x2E
	and 00fh		;45b3
	ld (ix+00eh),a		;45b5   ; guarda el volumen que suena
	ret			;45b8
silencio:		; sin tono
	res 1,(ix+00fh)		;45b9   ; pone a cero el bit 1 de lo que suena (bits 0-1: 1 ruido, 2 tono, 3 los dos; bit 2 envolvente del PSG)
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


nota_de_bateria:		; una nota de bateria por lo que suena: 0 nada; 1 el volumen del nibble bajo; 2 y 3 el volumen del nibble alto y el periodo de 12 bits (nibble bajo y el byte siguiente); el volumen + 2 (en el PSG con envolvente, 0x10 + 2) menos el fundido; la duracion la del byte 0x14
	ld a,(ix+00fh)		;45cb   ; 0: sin nada
	and 003h		;45ce
	jp z,nota_de_bateria_fin		;45d0   ; nota_de_bateria_fin: con el bit 7 del modo, nada mas
	cp 001h		;45d3   ; 1: el volumen
	jp z,volumen_de_bateria		;45d5   ; volumen_de_bateria: el volumen
	ld a,(hl)			;45d8   ; el volumen (nibble alto)...
	and 0f0h		;45d9
	ld e,a			;45db
	xor (hl)			;45dc   ; ...y el periodo alto (nibble bajo)...
	ld d,a			;45dd
	inc hl			;45de
	ld a,(hl)			;45df   ; ...y el bajo
	ld (ix+00ch),a		;45e0   ; guarda el periodo que suena (bajo)
	ld (ix+00dh),d		;45e3   ; guarda el periodo que suena (alto)
	ld a,e			;45e6
	rrca			;45e7
	rrca			;45e8
	rrca			;45e9
	rrca			;45ea
	ld e,a			;45eb
	jp volumen_de_bateria_a		;45ec   ; volumen_de_bateria_a: en el PSG...
volumen_de_bateria:		; el volumen
	ld a,(hl)			;45ef
	and 00fh		;45f0
	ld e,a			;45f2
volumen_de_bateria_a:		; en el PSG...
	ld a,(0c644h)		;45f3   ; lee el canal de sonido que se esta tocando (1, 2, 4...)
	cp 008h		;45f6
	jp nc,pon_volumen_bateria		;45f8   ; pon_volumen_bateria: + 2
	bit 2,(ix+00fh)		;45fb   ; ...con envolvente...
	jp z,pon_volumen_bateria		;45ff   ; pon_volumen_bateria: + 2
	ld e,010h		;4602   ; ...0x10
pon_volumen_bateria:		; + 2
	inc e			;4604
	inc e			;4605
	ld a,(0c640h)		;4606   ; menos el fundido
	and 001h		;4609
	push hl			;460b
	call nz,menos_fundido		;460c   ; menos_fundido: E = el volumen E menos lo que baja el fundido (0xC642) si el canal es de los suyos (bit 5 todos; 7 4 y 8; 6 2, 0x10, 0x20 y 0x80; 3 1, 2, 0x10, 0x40 y 0x80; si no, todos menos 4 y 8); con la envolvente del PSG, 0
	pop hl			;460f
	ld (ix+00eh),e		;4610   ; guarda el volumen que suena
nota_de_bateria_fin:		; con el bit 7 del modo, nada mas
	bit 7,(ix+00bh)		;4613   ; mira el bit 7 de el modo del canal (orden 0xFE; bits 2-4 bateria)
	ret nz			;4617
	inc hl			;4618   ; el byte siguiente
	ld (ix+002h),l		;4619   ; guarda el puntero de la partitura (bajo)
	ld (ix+003h),h		;461c   ; guarda el puntero de la partitura (alto)
	ld a,(ix+014h)		;461f   ; la duracion de bateria
	ld (ix+004h),a		;4622   ; guarda lo que le queda a la nota
	ret			;4625
bateria:		; la bateria: la duracion (p16:43B3) y la nota elige una partitura de bateria de la tabla del modo (p16:4674); en el canal 0x40 con el sonido 0x74 y la alerta 1, siempre la primera de p16:5486; se lee su primera nota y queda en marcha (bit 0 del byte 0x10)
	set 7,(ix+00bh)		;4626   ; sin avanzar
	call duracion_de_nota		;462a   ; la duracion
	ld b,a			;462d   ; B = la nota
	ld a,(0c580h)		;462e   ; el sonido 0x74 en el canal 0x40...
	cp 074h		;4631
	jp nz,bateria_por_nota		;4633   ; bateria_por_nota: la tabla
	ld a,(0ca5fh)		;4636   ; ...con la alerta 1...
	cp 001h		;4639
	jp nz,bateria_por_nota		;463b   ; bateria_por_nota: la tabla
	xor a			;463e   ; ...la primera
	ld hl,05486h		;463f   ; sonido_5486: datos de sonido que lee el motor de p16 al tocar los sonidos 0x6A, 0x6B, 0x6D, 0x6E, 0x6F,
	jp partitura_de_bateria		;4642   ; partitura_de_bateria: la palabra de la nota
bateria_por_nota:		; la tabla
	call tabla_de_bateria		;4645   ; tabla_de_bateria: HL = la tabla de bateria del modo: bit 3 p16:54B6, bit 4 p16:54CE; si no, p16:5486 (p16:549E con octava)
	ld a,b			;4648
partitura_de_bateria:		; la palabra de la nota
	add a,a			;4649   ; la nota * 2
	ld e,a			;464a
	ld d,000h		;464b
	add hl,de			;464d   ; + la tabla
	ld e,(hl)			;464e   ; la partitura...
	inc hl			;464f
	ld d,(hl)			;4650
	ex de,hl			;4651   ; ...a HL
	ld a,(hl)			;4652   ; su primer byte
primera_de_bateria:		; lee su nota como de bateria
	set 1,(ix+00bh)		;4653   ; pone a uno el bit 1 de el modo del canal (orden 0xFE; bits 2-4 bateria)
	call lee_partitura		;4657   ; lee_partitura: la siguiente nota u orden de la partitura (0xFF acaba, 0xD0-0xFE ordenes)
	res 1,(ix+00bh)		;465a   ; pone a cero el bit 1 de el modo del canal (orden 0xFE; bits 2-4 bateria)
	res 7,(ix+00bh)		;465e   ; pone a cero el bit 7 de el modo del canal (orden 0xFE; bits 2-4 bateria)
	ld a,(ix+014h)		;4662   ; su duracion
	ld (ix+01ah),a		;4665   ; guarda lo que le queda a la nota de bateria
	inc hl			;4668   ; donde sigue
	ld (ix+018h),l		;4669   ; guarda el puntero de la bateria (bajo)
	ld (ix+019h),h		;466c   ; guarda el puntero de la bateria (alto)
	set 0,(ix+010h)		;466f   ; en marcha
	ret			;4673
tabla_de_bateria:		; HL = la tabla de bateria del modo: bit 3 p16:54B6, bit 4 p16:54CE; si no, p16:5486 (p16:549E con octava)
	bit 3,(ix+00bh)		;4674   ; mira el bit 3 de el modo del canal (orden 0xFE; bits 2-4 bateria)
	jp nz,bateria_bit_3		;4678   ; bateria_bit_3:
	bit 4,(ix+00bh)		;467b   ; mira el bit 4 de el modo del canal (orden 0xFE; bits 2-4 bateria)
	jp nz,bateria_bit_4		;467f   ; bateria_bit_4:
	ld a,(ix+017h)		;4682   ; lee la octava (ordenes 0xD0-0xD5: cada una dobla el periodo)
	or a			;4685
	jp nz,bateria_con_octava		;4686   ; bateria_con_octava:
	ld hl,05486h		;4689   ; sonido_5486: datos de sonido que lee el motor de p16 al tocar los sonidos 0x6A, 0x6B, 0x6D, 0x6E, 0x6F,
	ret			;468c
bateria_con_octava:
	ld hl,0549eh		;468d
	ret			;4690
bateria_bit_3:
	ld a,(ix+017h)		;4691   ; lee la octava (ordenes 0xD0-0xD5: cada una dobla el periodo)
	or a			;4694
	jp nz,L_469C		;4695
	ld hl,054b6h		;4698
	ret			;469b
L_469C:
	ld hl,054b6h		;469c
	ret			;469f
bateria_bit_4:
	ld a,(ix+017h)		;46a0   ; lee la octava (ordenes 0xD0-0xD5: cada una dobla el periodo)
	or a			;46a3
	jp nz,L_46AB		;46a4
	ld hl,054ceh		;46a7
	ret			;46aa
L_46AB:
	ld hl,054ceh		;46ab
	ret			;46ae
canal_sigue_nota:		; lo de cada cuadro de una nota: con la bateria, su nota (p16:46F4); si no, el deslizamiento (p16:471D), el barrido (p16:4767), el vibrato (p16:4792), la envolvente de volumen (p16:4944) o el volumen simple (p16:4862) y, en el canal 0x10, la mezcla de ondas (p16:4A43)
	bit 1,(ix+00bh)		;46af   ; leyendo una nota de bateria, nada
	ret nz			;46b3
	bit 0,(ix+010h)		;46b4   ; la bateria
	jp nz,bateria_cada_cuadro		;46b8   ; bateria_cada_cuadro: la nota de bateria uno menos; acabada, la siguiente de su partitura (sin avanzar la principal) o, con 0xFF, fuera la bateria, el volumen a 0 y sin ruido ni tono
	bit 5,(ix+03ah)		;46bb   ; el deslizamiento
	call nz,desliza		;46bf   ; desliza: el deslizamiento de cada cuadro (hasta el bit 6): el periodo que suena - el paso (+ con el bit 7); acabada la cuenta, el bit 6, el periodo de la nota y la cuenta de nuevo
	bit 0,(ix+03ah)		;46c2   ; el barrido
	call nz,barrido		;46c6   ; barrido: el barrido de cada cuadro, sin fin: el periodo que suena - el paso (+ con el bit 7)
	bit 7,(ix+031h)		;46c9   ; el vibrato
	call nz,vibrato		;46cd   ; vibrato: la cuenta del vibrato; a 0, su paso siguiente (p16:4799)
	ld a,(ix+02ah)		;46d0   ; la envolvente de volumen
	or a			;46d3
	call nz,envolvente		;46d4   ; envolvente: la envolvente de volumen de cada cuadro: al cortar la nota, p16:49EE; parada (bit 7), nada; si no, su cuenta y el paso siguiente
	ld a,(ix+02ah)		;46d7   ; lee la envolvente de volumen (tabla p17:6430; bit 7 parada)
	or a			;46da
	jp nz,mezcla_cada_cuadro		;46db   ; mezcla_cada_cuadro: el canal 0x10...
	bit 0,(ix+02bh)		;46de   ; si no, el volumen simple
	call nz,volumen_simple		;46e2   ; volumen_simple: sin la envolvente del PSG, el volumen de cada cuadro (p16:486E)
mezcla_cada_cuadro:		; el canal 0x10...
	ld a,(0c644h)		;46e5   ; lee el canal de sonido que se esta tocando (1, 2, 4...)
	cp 010h		;46e8
	ret nz			;46ea
	ld a,(0c68bh)		;46eb   ; ...con la mezcla en marcha
	bit 0,a		;46ee
	call nz,mezcla_de_ondas		;46f0   ; mezcla_de_ondas: la mezcla de ondas de cada cuadro (sin acabar): cada 0xC68A cuadros, la onda a cargar y un paso de 0xC663 hacia la segunda (o la primera, con ida y vuelta); con 0xC688 = 0 la primera de golpe y con 0x0F la segunda; a los 16 pasos se acaba (o da la vuelta)
	ret			;46f3
bateria_cada_cuadro:		; la nota de bateria uno menos; acabada, la siguiente de su partitura (sin avanzar la principal) o, con 0xFF, fuera la bateria, el volumen a 0 y sin ruido ni tono
	dec (ix+01ah)		;46f4   ; uno menos
	ret nz			;46f7
	ld l,(ix+018h)		;46f8   ; donde sigue
	ld h,(ix+019h)		;46fb   ; lee el puntero de la bateria (alto)
	ld a,(hl)			;46fe
	cp 0ffh		;46ff   ; 0xFF: se acaba
	jp z,bateria_acaba		;4701   ; bateria_acaba: fuera la bateria...
	set 7,(ix+00bh)		;4704   ; sin avanzar la principal...
	call primera_de_bateria		;4708   ; ...la siguiente
	ret			;470b
bateria_acaba:		; fuera la bateria...
	res 0,(ix+010h)		;470c   ; pone a cero el bit 0 de las marcas de la nota (bit 0 bateria, bit 1 desafinado, bit 7 orden 0xF7)
	xor a			;4710   ; ...el volumen a 0...
	ld (ix+00eh),a		;4711   ; guarda el volumen que suena
	ld a,(ix+00fh)		;4714   ; ...y sin ruido ni tono
	and 0f0h		;4717
	ld (ix+00fh),a		;4719   ; guarda lo que suena (bits 0-1: 1 ruido, 2 tono, 3 los dos; bit 2 envolvente del PSG)
	ret			;471c
desliza:		; el deslizamiento de cada cuadro (hasta el bit 6): el periodo que suena - el paso (+ con el bit 7); acabada la cuenta, el bit 6, el periodo de la nota y la cuenta de nuevo
	bit 6,(ix+03ah)		;471d   ; con el bit 6, ya acabo
	ret nz			;4721
	bit 7,(ix+03ah)		;4722   ; con el bit 7, sumando
	jp nz,desliza_mas		;4726   ; desliza_mas: el periodo + el paso
	ld a,(ix+00ch)		;4729   ; el periodo - el paso
	ld h,(ix+00dh)		;472c   ; lee el periodo que suena (alto)
	sbc a,(ix+037h)		;472f   ; le resta el paso del deslizamiento
	ld l,a			;4732
	jp nc,pon_deslizado		;4733   ; pon_deslizado:
	dec h			;4736
	jp pon_deslizado		;4737   ; pon_deslizado:
desliza_mas:		; el periodo + el paso
	ld l,(ix+00ch)		;473a   ; lee el periodo que suena (bajo)
	ld h,(ix+00dh)		;473d   ; lee el periodo que suena (alto)
	ld d,000h		;4740
	ld e,(ix+037h)		;4742   ; lee el paso del deslizamiento
	add hl,de			;4745
pon_deslizado:
	ld (ix+00ch),l		;4746   ; guarda el periodo que suena (bajo)
	ld (ix+00dh),h		;4749   ; guarda el periodo que suena (alto)
	dec (ix+038h)		;474c   ; la cuenta
	ret nz			;474f
	set 6,(ix+03ah)		;4750   ; acabado: el bit 6...
	ld l,(ix+011h)		;4754   ; ...el periodo de la nota...
	ld h,(ix+012h)		;4757   ; lee el periodo de la nota (alto)
	ld (ix+00ch),l		;475a   ; guarda el periodo que suena (bajo)
	ld (ix+00dh),h		;475d   ; guarda el periodo que suena (alto)
	ld a,(ix+039h)		;4760   ; ...y la cuenta de nuevo
	ld (ix+038h),a		;4763   ; guarda la cuenta del deslizamiento
	ret			;4766
barrido:		; el barrido de cada cuadro, sin fin: el periodo que suena - el paso (+ con el bit 7)
	bit 7,(ix+03ah)		;4767   ; mira el bit 7 de las marcas del deslizamiento (ordenes 0xD6-0xDA)
	jp nz,barrido_mas		;476b   ; barrido_mas: el periodo + el paso
	ld a,(ix+00ch)		;476e   ; el periodo - el paso
	ld h,(ix+00dh)		;4771   ; lee el periodo que suena (alto)
	sbc a,(ix+037h)		;4774   ; le resta el paso del deslizamiento
	ld l,a			;4777
	jp nc,pon_barrido		;4778   ; pon_barrido:
	dec h			;477b
	jp pon_barrido		;477c   ; pon_barrido:
barrido_mas:		; el periodo + el paso
	ld l,(ix+00ch)		;477f   ; lee el periodo que suena (bajo)
	ld h,(ix+00dh)		;4782   ; lee el periodo que suena (alto)
	ld d,000h		;4785
	ld e,(ix+037h)		;4787   ; lee el paso del deslizamiento
	add hl,de			;478a
pon_barrido:
	ld (ix+00ch),l		;478b   ; guarda el periodo que suena (bajo)
	ld (ix+00dh),h		;478e   ; guarda el periodo que suena (alto)
	ret			;4791
vibrato:		; la cuenta del vibrato; a 0, su paso siguiente (p16:4799)
	dec (ix+030h)		;4792
	ret nz			;4795
	inc (ix+030h)		;4796   ; se queda en 1
paso_de_vibrato:		; el paso del vibrato de la tabla p17:6475 (por el byte 0x31) en el indice 0x2F: [cuadros (nibble alto)][desvio (nibble bajo; desde 8, hacia abajo)] * amplitud sobre el periodo de la nota; 0xF5-0xFA otra vez desde el siguiente, 0xFB [n] repite n veces, desde 0xFC se para
	push hl			;4799
	ld a,(ix+031h)		;479a   ; su tabla...
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
	ld e,(ix+02fh)		;47ad   ; ...en su indice
	ld d,000h		;47b0
	add hl,de			;47b2
	ld a,(hl)			;47b3   ; el byte
	ld (0c662h),a		;47b4   ; guarda el byte que se lee de una envolvente o un vibrato
	ex de,hl			;47b7
	pop hl			;47b8
	cp 0f5h		;47b9   ; desde 0xF5, una orden
	jp nc,orden_de_vibrato		;47bb   ; orden_de_vibrato: 0xFB: repite
	srl a		;47be   ; los cuadros
	srl a		;47c0
	srl a		;47c2
	srl a		;47c4
	ld (ix+030h),a		;47c6
	inc (ix+02fh)		;47c9   ; el indice siguiente
	ld a,(0c662h)		;47cc   ; el desvio...
	and 00fh		;47cf
	bit 3,a		;47d1   ; ...desde 8, hacia abajo
	jp nz,vibrato_abajo		;47d3   ; vibrato_abajo: 16 - el desvio
	call por_amplitud		;47d6   ; * la amplitud
	call periodo_mas_c		;47d9   ; + el periodo
	call pon_vibrato		;47dc   ; al que suena
	ret			;47df
vibrato_abajo:		; 16 - el desvio
	ld c,a			;47e0
	ld a,010h		;47e1
	sub c			;47e3
	call por_amplitud		;47e4   ; por_amplitud: C = A * la amplitud (byte 0x33); D = el periodo alto
	call periodo_menos_c		;47e7   ; el periodo -
	call pon_vibrato		;47ea   ; pon_vibrato: DE al periodo que suena, salvo con el barrido o con el deslizamiento sin acabar
	ret			;47ed
por_amplitud:		; C = A * la amplitud (byte 0x33); D = el periodo alto
	ld c,(ix+033h)		;47ee   ; lee la amplitud del vibrato
	ld d,a			;47f1
suma_amplitud:
	dec c			;47f2
	jp z,pon_por_amplitud		;47f3   ; pon_por_amplitud:
	add a,d			;47f6
	jp suma_amplitud		;47f7   ; suma_amplitud:
pon_por_amplitud:
	ld c,a			;47fa
	ld d,(ix+012h)		;47fb   ; lee el periodo de la nota (alto)
	ret			;47fe
periodo_mas_c:		; DE = el periodo de la nota + C
	ld a,c			;47ff
	add a,(ix+011h)		;4800   ; le suma el periodo de la nota (bajo)
	ld e,a			;4803
	ret nc			;4804
	inc d			;4805
	ret			;4806
periodo_menos_c:		; DE = el periodo de la nota - C
	ld a,(ix+011h)		;4807   ; lee el periodo de la nota (bajo)
	sub c			;480a
	ld e,a			;480b
	ret nc			;480c
	dec d			;480d
	ret			;480e
pon_vibrato:		; DE al periodo que suena, salvo con el barrido o con el deslizamiento sin acabar
	ld a,(ix+03ah)		;480f   ; lee las marcas del deslizamiento (ordenes 0xD6-0xDA)
	bit 0,a		;4812   ; con el barrido, no
	ret nz			;4814
	bit 5,a		;4815   ; con el deslizamiento...
	jp z,periodo_que_suena		;4817   ; periodo_que_suena:
	bit 6,a		;481a   ; ...solo acabado
	ret z			;481c
periodo_que_suena:
	ld (ix+00ch),e		;481d   ; guarda el periodo que suena (bajo)
	ld (ix+00dh),d		;4820   ; guarda el periodo que suena (alto)
	ret			;4823
orden_de_vibrato:		; 0xFB: repite
	cp 0fbh		;4824
	jp z,repite_vibrato		;4826   ; repite_vibrato: [n]: las vueltas...
	jp nc,para_vibrato		;4829   ; desde 0xFC: se para
	inc (ix+02fh)		;482c   ; 0xF5-0xFA: el bucle empieza en el siguiente
	ld a,(ix+02fh)		;482f
	ld (ix+034h),a		;4832
	jp paso_de_vibrato		;4835   ; paso_de_vibrato: el paso del vibrato de la tabla p17:6475 (por el byte 0x31) en el indice 0x2F: [cuadros (nibble alto)][desvio (nibble bajo; desde 8, hacia abajo)] * amplitud sobre el periodo de la nota; 0xF5-0xFA otra vez desde el siguiente, 0xFB [n] repite n veces, desde 0xFC se para
repite_vibrato:		; [n]: las vueltas...
	inc de			;4838
	inc (ix+024h)		;4839   ; sube el byte 0x24 (el de la envolvente) y compara con el 0x35, que aqui nadie sube: parece copiado de p16:49C4
	ld a,(de)			;483c
	cp (ix+035h)		;483d   ; ...hasta n
	jp nz,otra_vuelta_vibrato		;4840   ; otra_vuelta_vibrato: al principio del bucle
	ld (ix+035h),000h		;4843   ; acabadas: a 0...
	ld (ix+034h),000h		;4847
	inc (ix+02fh)		;484b   ; ...y sigue tras el [n]
	inc (ix+02fh)		;484e
	jp paso_de_vibrato		;4851   ; paso_de_vibrato: el paso del vibrato de la tabla p17:6475 (por el byte 0x31) en el indice 0x2F: [cuadros (nibble alto)][desvio (nibble bajo; desde 8, hacia abajo)] * amplitud sobre el periodo de la nota; 0xF5-0xFA otra vez desde el siguiente, 0xFB [n] repite n veces, desde 0xFC se para
otra_vuelta_vibrato:		; al principio del bucle
	ld a,(ix+034h)		;4854
	ld (ix+02fh),a		;4857
	jp paso_de_vibrato		;485a   ; paso_de_vibrato: el paso del vibrato de la tabla p17:6475 (por el byte 0x31) en el indice 0x2F: [cuadros (nibble alto)][desvio (nibble bajo; desde 8, hacia abajo)] * amplitud sobre el periodo de la nota; 0xF5-0xFA otra vez desde el siguiente, 0xFB [n] repite n veces, desde 0xFC se para
para_vibrato:		; la cuenta 0xFF: parado
	ld (ix+030h),0ffh		;485d
	ret			;4861
volumen_simple:		; sin la envolvente del PSG, el volumen de cada cuadro (p16:486E)
	bit 2,(ix+00fh)		;4862   ; mira el bit 2 de lo que suena (bits 0-1: 1 ruido, 2 tono, 3 los dos; bit 2 envolvente del PSG)
	ret nz			;4866
	call volumen_de_cuadro		;4867   ; volumen_de_cuadro: el volumen de cada cuadro: al cortar la nota (byte 0x29), p16:49F2; si no, la subida (bit 1, cada byte 0x2D cuadros hasta el de la nota) o, pasada la espera del byte 0x2C, la bajada (bit 3: el byte 0x22 cada vez, el 0x23 veces) hasta el minimo
	ld (ix+00eh),e		;486a   ; guarda el volumen que suena
	ret			;486d
volumen_de_cuadro:		; el volumen de cada cuadro: al cortar la nota (byte 0x29), p16:49F2; si no, la subida (bit 1, cada byte 0x2D cuadros hasta el de la nota) o, pasada la espera del byte 0x2C, la bajada (bit 3: el byte 0x22 cada vez, el 0x23 veces) hasta el minimo
	ld e,(ix+00eh)		;486e   ; E = el que suena
	inc (ix+025h)		;4871   ; un cuadro mas
	ld b,(ix+025h)		;4874
	ld a,(ix+026h)		;4877   ; con el corte...
	or a			;487a
	jp z,sube_o_baja		;487b   ; sube_o_baja: bajando (bit 3)
	ld a,(ix+029h)		;487e   ; ...llegado: p16:49F2
	cp (ix+004h)		;4881   ; compara con lo que le queda a la nota
	jp nc,nota_cortada		;4884   ; nota_cortada: al cortar la nota
sube_o_baja:		; bajando (bit 3)
	bit 3,(ix+02bh)		;4887   ; mira el bit 3 de las marcas del volumen (bit 7: la onda a cargar)
	jp nz,baja_volumen		;488b   ; baja_volumen: acabada (bit 2): p16:492F
	bit 1,(ix+02bh)		;488e   ; subiendo (bit 1)
	jp z,espera_bajada		;4892   ; espera_bajada: uno menos, no del minimo
	dec (ix+02dh)		;4895   ; la espera de la subida
	ret nz			;4898
	ld a,(ix+02eh)		;4899   ; de nuevo, del byte 0x2E
	and 0f0h		;489c
	rrca			;489e
	rrca			;489f
	rrca			;48a0
	rrca			;48a1
	ld (ix+02dh),a		;48a2
	inc e			;48a5   ; uno mas...
	ld a,e			;48a6
	cp (ix+013h)		;48a7   ; ...hasta el de la nota
	ret c			;48aa
	res 1,(ix+02bh)		;48ab   ; llegado: se acaba la subida
	ld e,(ix+013h)		;48af   ; lee el volumen de la nota
	ld (ix+025h),000h		;48b2
	ret			;48b6
espera_bajada:		; uno menos, no del minimo
	dec e			;48b7
	call no_del_minimo		;48b8   ; no_del_minimo: E no por debajo del minimo (byte 0x21; negativo, el minimo)
	ld a,(ix+02ch)		;48bb   ; pasada la espera del byte 0x2C...
	cp b			;48be
	ret nc			;48bf
	ld (ix+025h),001h		;48c0   ; ...empieza a bajar (bit 3)
	ld b,001h		;48c4
	set 3,(ix+02bh)		;48c6   ; pone a uno el bit 3 de las marcas del volumen (bit 7: la onda a cargar)
baja_volumen:		; acabada (bit 2): p16:492F
	bit 2,(ix+02bh)		;48ca   ; mira el bit 2 de las marcas del volumen (bit 7: la onda a cargar)
	jp nz,tercera_onda		;48ce   ; tercera_onda: con las cuatro ondas, la tercera una vez (bit 6)
	ld a,(ix+022h)		;48d1   ; sin paso, se acaba
	or a			;48d4
	jp z,bajada_acaba		;48d5   ; bajada_acaba: acabada (bit 2)
	bit 4,(ix+03bh)		;48d8   ; con las cuatro ondas, la segunda una vez (bit 5)
	jp z,baja_cada		;48dc   ; baja_cada: con el bit 4, de golpe
	bit 5,(ix+03bh)		;48df   ; mira el bit 5 de las marcas de las cuatro ondas (orden 0xF4)
	jp nz,baja_cada		;48e3   ; baja_cada: con el bit 4, de golpe
	set 5,(ix+03bh)		;48e6   ; pone a uno el bit 5 de las marcas de las cuatro ondas (orden 0xF4)
	ld a,(ix+03dh)		;48ea   ; lee la segunda de las cuatro ondas
	call pon_onda		;48ed   ; pon_onda: la onda A de la tabla p16:583E al canal, a cargar
baja_cada:		; con el bit 4, de golpe
	bit 4,(ix+02bh)		;48f0   ; mira el bit 4 de las marcas del volumen (bit 7: la onda a cargar)
	jp nz,baja_de_golpe		;48f4   ; baja_de_golpe: el volumen - el byte 0x22
	ld a,b			;48f7   ; cada byte 0x22 cuadros...
	cp (ix+022h)		;48f8
	ret nz			;48fb
	dec e			;48fc   ; ...uno menos
bajada_cuenta:		; no del minimo
	call no_del_minimo		;48fd   ; no_del_minimo: E no por debajo del minimo (byte 0x21; negativo, el minimo)
	ld (ix+025h),000h		;4900
	inc (ix+024h)		;4904   ; una vez mas...
	ld a,(ix+024h)		;4907   ; ...hasta el byte 0x23
	cp (ix+023h)		;490a
	ret nz			;490d
bajada_acaba:		; acabada (bit 2)
	set 2,(ix+02bh)		;490e   ; pone a uno el bit 2 de las marcas del volumen (bit 7: la onda a cargar)
	ret			;4912
baja_de_golpe:		; el volumen - el byte 0x22
	ld d,(ix+022h)		;4913
	ld a,e			;4916
	sub d			;4917
	ld e,a			;4918
	jp bajada_cuenta		;4919   ; bajada_cuenta: no del minimo
nota_cortada:		; al cortar la nota
	call corta_nota		;491c   ; corta_nota: al cortar la nota: con el bit 1 del deslizamiento, el barrido (bit 0); con las cuatro ondas, la cuarta una vez (bit 7); el volumen del byte 0x28 (nibble bajo) o, con su nibble alto, uno que baja ese tanto cada tantos cuadros
	ld e,(ix+00eh)		;491f   ; lee el volumen que suena
	ret			;4922
no_del_minimo:		; E no por debajo del minimo (byte 0x21; negativo, el minimo)
	jp m,al_minimo		;4923   ; al_minimo: ...el minimo
	ld a,e			;4926   ; por debajo...
	cp (ix+021h)		;4927   ; compara con el volumen minimo (orden 0xDB)
	ret nc			;492a
al_minimo:		; ...el minimo
	ld e,(ix+021h)		;492b   ; lee el volumen minimo (orden 0xDB)
	ret			;492e
tercera_onda:		; con las cuatro ondas, la tercera una vez (bit 6)
	bit 4,(ix+03bh)		;492f   ; mira el bit 4 de las marcas de las cuatro ondas (orden 0xF4)
	ret z			;4933
	bit 6,(ix+03bh)		;4934   ; mira el bit 6 de las marcas de las cuatro ondas (orden 0xF4)
	ret nz			;4938
	set 6,(ix+03bh)		;4939   ; pone a uno el bit 6 de las marcas de las cuatro ondas (orden 0xF4)
	ld a,(ix+03eh)		;493d   ; lee la tercera de las cuatro ondas
	call pon_onda		;4940   ; pon_onda: la onda A de la tabla p16:583E al canal, a cargar
	ret			;4943
envolvente:		; la envolvente de volumen de cada cuadro: al cortar la nota, p16:49EE; parada (bit 7), nada; si no, su cuenta y el paso siguiente
	ld a,(ix+026h)		;4944   ; lee lo que suena de la nota, en dieciseisavos
	or a			;4947
	jp z,envolvente_sigue		;4948   ; con el corte...
	ld a,(ix+029h)		;494b   ; ...llegado: p16:49EE
	cp (ix+004h)		;494e   ; compara con lo que le queda a la nota
	jp nc,corta_envolvente		;4951   ; corta_envolvente: en marcha otra vez
envolvente_sigue:		; parada, nada
	bit 7,(ix+02ah)		;4954   ; mira el bit 7 de la envolvente de volumen (tabla p17:6430; bit 7 parada)
	ret nz			;4958
	dec (ix+025h)		;4959   ; la cuenta
	ret nz			;495c
	res 7,(ix+02ah)		;495d   ; pone a cero el bit 7 de la envolvente de volumen (tabla p17:6430; bit 7 parada)
paso_de_envolvente:		; el paso de la envolvente de la tabla p17:6430 (por el byte 0x2A) en el indice 0x22: [cuadros (nibble alto)][volumen (nibble bajo)] - lo que baja el canal (byte 0x16), no por debajo del minimo; 0xF5-0xFA bucle desde el siguiente, 0xFB [n] repite n veces, desde 0xFC se para
	push hl			;4961
	ld a,(ix+02ah)		;4962   ; su tabla...
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
	ld e,(ix+022h)		;4975   ; ...en su indice
	ld d,000h		;4978
	add hl,de			;497a
	ld a,(hl)			;497b   ; el byte
	ld (0c662h),a		;497c   ; guarda el byte que se lee de una envolvente o un vibrato
	ex de,hl			;497f
	pop hl			;4980
	cp 0f5h		;4981   ; desde 0xF5, una orden
	jp nc,orden_de_envolvente		;4983   ; orden_de_envolvente: 0xFB: repite
	srl a		;4986   ; los cuadros
	srl a		;4988
	srl a		;498a
	srl a		;498c
	ld (ix+025h),a		;498e
	inc (ix+022h)		;4991   ; el indice siguiente
	ld a,(0c662h)		;4994   ; el volumen...
	and 00fh		;4997
	or a			;4999
	sbc a,(ix+016h)		;499a   ; ...menos el byte 0x16
pon_volumen_minimo:		; negativo, 0
	jp c,volumen_0		;499d   ; volumen_0:
	ld b,(ix+021h)		;49a0   ; por debajo del minimo, el minimo
	cp b			;49a3
	jp nc,pon_volumen		;49a4   ; pon_volumen:
	ld (ix+00eh),b		;49a7   ; guarda el volumen que suena
	ret			;49aa
volumen_0:
	xor a			;49ab
pon_volumen:
	ld (ix+00eh),a		;49ac   ; guarda el volumen que suena
	ret			;49af
orden_de_envolvente:		; 0xFB: repite
	cp 0fbh		;49b0
	jp z,repite_envolvente		;49b2   ; repite_envolvente: [n]: las vueltas...
	jp nc,para_envolvente		;49b5   ; desde 0xFC: se para
	inc (ix+022h)		;49b8   ; 0xF5-0xFA: el bucle empieza en el siguiente
	ld a,(ix+022h)		;49bb
	ld (ix+023h),a		;49be
	jp paso_de_envolvente		;49c1   ; paso_de_envolvente: el paso de la envolvente de la tabla p17:6430 (por el byte 0x2A) en el indice 0x22: [cuadros (nibble alto)][volumen (nibble bajo)] - lo que baja el canal (byte 0x16), no por debajo del minimo; 0xF5-0xFA bucle desde el siguiente, 0xFB [n] repite n veces, desde 0xFC se para
repite_envolvente:		; [n]: las vueltas...
	inc de			;49c4
	inc (ix+024h)		;49c5
	ld a,(de)			;49c8
	cp (ix+024h)		;49c9   ; ...hasta n
	jp nz,otra_vuelta_envolvente		;49cc   ; otra_vuelta_envolvente:
	ld (ix+024h),000h		;49cf   ; acabadas: a 0...
	ld (ix+023h),000h		;49d3
	inc (ix+022h)		;49d7   ; ...y sigue tras el [n]
	inc (ix+022h)		;49da
	jp paso_de_envolvente		;49dd   ; paso_de_envolvente: el paso de la envolvente de la tabla p17:6430 (por el byte 0x2A) en el indice 0x22: [cuadros (nibble alto)][volumen (nibble bajo)] - lo que baja el canal (byte 0x16), no por debajo del minimo; 0xF5-0xFA bucle desde el siguiente, 0xFB [n] repite n veces, desde 0xFC se para
otra_vuelta_envolvente:
	ld a,(ix+023h)		;49e0
	ld (ix+022h),a		;49e3
	jp paso_de_envolvente		;49e6   ; paso_de_envolvente: el paso de la envolvente de la tabla p17:6430 (por el byte 0x2A) en el indice 0x22: [cuadros (nibble alto)][volumen (nibble bajo)] - lo que baja el canal (byte 0x16), no por debajo del minimo; 0xF5-0xFA bucle desde el siguiente, 0xFB [n] repite n veces, desde 0xFC se para
para_envolvente:		; parada (bit 7)
	set 7,(ix+02ah)		;49e9   ; pone a uno el bit 7 de la envolvente de volumen (tabla p17:6430; bit 7 parada)
	ret			;49ed
corta_envolvente:		; en marcha otra vez
	res 7,(ix+02ah)		;49ee   ; pone a cero el bit 7 de la envolvente de volumen (tabla p17:6430; bit 7 parada)
corta_nota:		; al cortar la nota: con el bit 1 del deslizamiento, el barrido (bit 0); con las cuatro ondas, la cuarta una vez (bit 7); el volumen del byte 0x28 (nibble bajo) o, con su nibble alto, uno que baja ese tanto cada tantos cuadros
	bit 1,(ix+03ah)		;49f2   ; mira el bit 1 de las marcas del deslizamiento (ordenes 0xD6-0xDA)
	jp z,L_49FD		;49f6
	set 0,(ix+03ah)		;49f9   ; el barrido
L_49FD:
	bit 4,(ix+03bh)		;49fd   ; con las cuatro ondas...
	jp z,volumen_al_cortar		;4a01   ; volumen_al_cortar: sin nibble alto...
	bit 7,(ix+03bh)		;4a04   ; mira el bit 7 de las marcas de las cuatro ondas (orden 0xF4)
	jp nz,volumen_al_cortar		;4a08   ; volumen_al_cortar: sin nibble alto...
	set 7,(ix+03bh)		;4a0b   ; ...la cuarta una vez
	ld a,(ix+03fh)		;4a0f   ; lee la cuarta de las cuatro ondas
	call pon_onda		;4a12   ; pon_onda: la onda A de la tabla p16:583E al canal, a cargar
volumen_al_cortar:		; sin nibble alto...
	ld a,(ix+028h)		;4a15
	and 0f0h		;4a18
	jp nz,baja_al_cortar		;4a1a   ; baja_al_cortar: la espera (byte 0x27)
	ld a,(ix+028h)		;4a1d   ; ...el volumen del bajo
	and 00fh		;4a20
	ld (ix+00eh),a		;4a22   ; guarda el volumen que suena
	ret			;4a25
baja_al_cortar:		; la espera (byte 0x27)
	dec (ix+027h)		;4a26
	ret nz			;4a29
	ld a,(ix+028h)		;4a2a   ; de nuevo, del nibble alto
	and 0f0h		;4a2d
	rrca			;4a2f
	rrca			;4a30
	rrca			;4a31
	rrca			;4a32
	ld (ix+027h),a		;4a33
	ld a,(ix+028h)		;4a36   ; el volumen - el nibble bajo
	and 00fh		;4a39
	ld b,a			;4a3b
	ld a,(ix+00eh)		;4a3c   ; lee el volumen que suena
	sub b			;4a3f
	jp pon_volumen_minimo		;4a40   ; pon_volumen_minimo: negativo, 0
mezcla_de_ondas:		; la mezcla de ondas de cada cuadro (sin acabar): cada 0xC68A cuadros, la onda a cargar y un paso de 0xC663 hacia la segunda (o la primera, con ida y vuelta); con 0xC688 = 0 la primera de golpe y con 0x0F la segunda; a los 16 pasos se acaba (o da la vuelta)
	ld a,(0c68bh)		;4a43   ; lee las marcas de la mezcla (bit 0 en marcha, 1 acabada, 2 ida y vuelta, 3 tambien el canal 0x20, 5 sentido)
	bit 1,a		;4a46   ; acabada, nada
	ret nz			;4a48
	ld a,(0c689h)		;4a49   ; la espera
	dec a			;4a4c
	ld (0c689h),a		;4a4d   ; guarda la espera de la mezcla
	ret nz			;4a50
	ld a,(0c68ah)		;4a51   ; de nuevo
	ld (0c689h),a		;4a54   ; guarda la espera de la mezcla
	set 7,(ix+02bh)		;4a57   ; la onda a cargar
	ld a,(0c688h)		;4a5b   ; 0: la primera, acabada
	or a			;4a5e
	jp z,primera_acabada		;4a5f   ; primera_acabada: acabada (bit 1)
	cp 00fh		;4a62   ; 0x0F: la segunda, acabada
	jp z,segunda_acabada		;4a64   ; segunda_acabada: acabada (bit 1)
	ld a,(0c687h)		;4a67   ; un paso mas...
	inc a			;4a6a
	ld (0c687h),a		;4a6b   ; guarda el paso de la mezcla (0-0x0F)
	cp 010h		;4a6e   ; ...a los 16, p16:4A8C
	jp z,mezcla_16_pasos		;4a70   ; mezcla_16_pasos: sin ida y vuelta, acabada con la segunda
	ld a,(0c68bh)		;4a73   ; de vuelta (bits 2 y 5)...
	bit 2,a		;4a76
	jp z,hacia_la_segunda		;4a78   ; hacia_la_segunda:
	bit 5,a		;4a7b
	jp z,hacia_la_segunda		;4a7d   ; hacia_la_segunda:
	ld hl,0c683h		;4a80   ; ...hacia la primera
	jp paso_de_mezcla		;4a83   ; paso_de_mezcla: las 32 muestras de 0xC663 hacia la onda de HL: cada una se acerca (la diferencia / 16, al menos 1) * 2^0xC688
hacia_la_segunda:
	ld hl,0c685h		;4a86   ; apunta a la segunda onda de la mezcla (puntero; orden 0xF1)
	jp paso_de_mezcla		;4a89   ; paso_de_mezcla: las 32 muestras de 0xC663 hacia la onda de HL: cada una se acerca (la diferencia / 16, al menos 1) * 2^0xC688
mezcla_16_pasos:		; sin ida y vuelta, acabada con la segunda
	ld a,(0c68bh)		;4a8c   ; lee las marcas de la mezcla (bit 0 en marcha, 1 acabada, 2 ida y vuelta, 3 tambien el canal 0x20, 5 sentido)
	bit 2,a		;4a8f
	jp z,segunda_acabada		;4a91   ; segunda_acabada: acabada (bit 1)
	ld a,(0c688h)		;4a94   ; los pasos de nuevo
	ld (0c687h),a		;4a97   ; guarda el paso de la mezcla (0-0x0F)
	ld a,(0c68bh)		;4a9a   ; el sentido
	bit 5,a		;4a9d
	jp z,vuelta_a_la_primera		;4a9f   ; vuelta_a_la_primera: la segunda entera...
	call copia_primera_onda		;4aa2   ; la primera entera...
	ld hl,0c685h		;4aa5   ; ...y hacia la segunda
	res 5,a		;4aa8
	ld (0c68bh),a		;4aaa   ; guarda las marcas de la mezcla (bit 0 en marcha, 1 acabada, 2 ida y vuelta, 3 tambien el canal 0x20, 5 sentido)
	jp paso_de_mezcla		;4aad   ; paso_de_mezcla: las 32 muestras de 0xC663 hacia la onda de HL: cada una se acerca (la diferencia / 16, al menos 1) * 2^0xC688
vuelta_a_la_primera:		; la segunda entera...
	call copia_segunda_onda		;4ab0   ; copia_segunda_onda: la segunda onda entera a 0xC663
	ld hl,0c683h		;4ab3   ; ...y hacia la primera
	set 5,a		;4ab6
	ld (0c68bh),a		;4ab8   ; guarda las marcas de la mezcla (bit 0 en marcha, 1 acabada, 2 ida y vuelta, 3 tambien el canal 0x20, 5 sentido)
paso_de_mezcla:		; las 32 muestras de 0xC663 hacia la onda de HL: cada una se acerca (la diferencia / 16, al menos 1) * 2^0xC688
	push ix		;4abb
	ld ix,0c663h		;4abd   ; IX = 0xC663 (no es un canal)
	ld e,(hl)			;4ac1   ; DE = la onda destino
	inc hl			;4ac2
	ld d,(hl)			;4ac3
	ld hl,0c663h		;4ac4   ; apunta a la onda del SCC que se mezcla (32 bytes; orden 0xF1)
	ld b,020h		;4ac7   ; 32 muestras
muestra_de_mezcla:		; la muestra (con signo, + 0x80)...
	ld a,(hl)			;4ac9
	add a,080h		;4aca
	ld c,a			;4acc
	ld a,(de)			;4acd   ; ...y la del destino
	add a,080h		;4ace
	cp c			;4ad0
	jp z,muestra_siguiente		;4ad1   ; iguales: nada
	ld (ix+000h),c		;4ad4   ; la muestra de 0xC663 (+ 0x80)
	jp c,muestra_baja		;4ad7   ; el destino es menor
	sub c			;4ada   ; la diferencia / 16
	call diferencia_16		;4adb   ; diferencia_16: A = A / 16, al menos 1
	push bc			;4ade
	ld c,a			;4adf
	ld a,(0c688h)		;4ae0   ; lee lo que se mueve la mezcla en cada paso (0: la primera onda, 0x0F: la segunda)
	ld b,a			;4ae3
	ld a,c			;4ae4
L_4AE5:
	add a,a			;4ae5   ; * 2 por 0xC688
	djnz L_4AE5		;4ae6
	pop bc			;4ae8
	add a,(ix+000h)		;4ae9   ; + la muestra de 0xC663
	ld c,080h		;4aec
	sub c			;4aee
	ld (ix+000h),a		;4aef   ; a 0xC663 (- 0x80)
	jp muestra_siguiente		;4af2   ; muestra_siguiente:
muestra_baja:		; la diferencia, en positivo
	sub c			;4af5
	ld c,a			;4af6
	xor a			;4af7
	sub c			;4af8
	call diferencia_16		;4af9   ; / 16
	push bc			;4afc
	ld c,a			;4afd
	ld a,(0c688h)		;4afe   ; lee lo que se mueve la mezcla en cada paso (0: la primera onda, 0x0F: la segunda)
	ld b,a			;4b01
	ld a,c			;4b02
L_4B03:
	add a,a			;4b03   ; * 2 por 0xC688
	djnz L_4B03		;4b04
	pop bc			;4b06
	ld c,a			;4b07
	ld a,(ix+000h)		;4b08   ; la muestra de 0xC663 - eso
	sub c			;4b0b
	ld c,080h		;4b0c
	sub c			;4b0e
	ld (ix+000h),a		;4b0f   ; a 0xC663
muestra_siguiente:
	inc hl			;4b12
	inc de			;4b13
	inc ix		;4b14
	djnz muestra_de_mezcla		;4b16   ; 32
	pop ix		;4b18
	ret			;4b1a
diferencia_16:		; A = A / 16, al menos 1
	and 0f0h		;4b1b   ; la diferencia...
	rrca			;4b1d   ; ...entre 16
	rrca			;4b1e
	rrca			;4b1f
	rrca			;4b20
	or a			;4b21   ; 0?
	ret nz			;4b22
	ld a,001h		;4b23   ; al menos 1
	ret			;4b25
primera_acabada:		; acabada (bit 1)
	ld a,(0c68bh)		;4b26   ; lee las marcas de la mezcla (bit 0 en marcha, 1 acabada, 2 ida y vuelta, 3 tambien el canal 0x20, 5 sentido)
	set 1,a		;4b29
	ld (0c68bh),a		;4b2b   ; guarda las marcas de la mezcla (bit 0 en marcha, 1 acabada, 2 ida y vuelta, 3 tambien el canal 0x20, 5 sentido)
copia_primera_onda:		; la primera onda entera a 0xC663
	ld hl,0c683h		;4b2e   ; apunta a la primera onda de la mezcla (puntero; orden 0xF1)
	ld e,(hl)			;4b31
	inc hl			;4b32
	ld d,(hl)			;4b33
	ex de,hl			;4b34
	ld de,0c663h		;4b35   ; apunta a la onda del SCC que se mezcla (32 bytes; orden 0xF1)
	ld bc,00020h		;4b38
	ldir		;4b3b
	ret			;4b3d
segunda_acabada:		; acabada (bit 1)
	ld a,(0c68bh)		;4b3e   ; lee las marcas de la mezcla (bit 0 en marcha, 1 acabada, 2 ida y vuelta, 3 tambien el canal 0x20, 5 sentido)
	set 1,a		;4b41
	ld (0c68bh),a		;4b43   ; guarda las marcas de la mezcla (bit 0 en marcha, 1 acabada, 2 ida y vuelta, 3 tambien el canal 0x20, 5 sentido)
copia_segunda_onda:		; la segunda onda entera a 0xC663
	ld hl,0c685h		;4b46   ; apunta a la segunda onda de la mezcla (puntero; orden 0xF1)
	ld e,(hl)			;4b49
	inc hl			;4b4a
	ld d,(hl)			;4b4b
	ex de,hl			;4b4c
	ld de,0c663h		;4b4d   ; apunta a la onda del SCC que se mezcla (32 bytes; orden 0xF1)
	ld bc,00020h		;4b50
	ldir		;4b53
	ret			;4b55
fundido:		; el fundido de cada cuadro: cada 0x25 cuadros el volumen baja uno mas (0xC642); a 0x0F acaban los canales de su pedido (bit 7: 4 y 8; 6: 0x20, 2, 0x10 y 0x80; 3: 0x40 y esos; 4: todos menos 4 y 8; si no, los ocho) y se quita
	ld hl,0c641h		;4b56   ; un cuadro mas...
	inc (hl)			;4b59
	ld a,(hl)			;4b5a
	cp 025h		;4b5b   ; ...cada 0x25
	ret nz			;4b5d
	ld (hl),000h		;4b5e
	inc hl			;4b60   ; baja uno mas...
	inc (hl)			;4b61
	ld a,(hl)			;4b62
	cp 00fh		;4b63   ; ...hasta 0x0F
	ret nz			;4b65
	ld a,(0c640h)		;4b66   ; bit 7
	bit 7,a		;4b69
	jp nz,acaba_4_y_8		;4b6b   ; acaba_4_y_8: 4 y 8
	bit 6,a		;4b6e   ; bit 6
	jp nz,acaba_20		;4b70   ; acaba_20: 0x20...
	bit 3,a		;4b73   ; bit 3
	jp nz,acaba_40		;4b75   ; acaba_40: 0x40 y los de p16:4BA0
	bit 4,a		;4b78   ; bit 4
	jp nz,acaba_1_y_40		;4b7a   ; acaba_1_y_40: 1 y 0x40...
	ld ix,0c480h		;4b7d   ; los ocho: 4 y 8...
	call fin_de_partitura		;4b81   ; fin_de_partitura: la orden 0xFF: acaba el canal (y avisa de algunas musicas)
	ld ix,0c4c0h		;4b84
	call fin_de_partitura		;4b88   ; fin_de_partitura: la orden 0xFF: acaba el canal (y avisa de algunas musicas)
acaba_1_y_40:		; 1 y 0x40...
	ld ix,0c400h		;4b8b
	call fin_de_partitura		;4b8f   ; fin_de_partitura: la orden 0xFF: acaba el canal (y avisa de algunas musicas)
	ld ix,0c580h		;4b92
	call fin_de_partitura		;4b96   ; fin_de_partitura: la orden 0xFF: acaba el canal (y avisa de algunas musicas)
acaba_20:		; 0x20...
	ld ix,0c540h		;4b99
	call fin_de_partitura		;4b9d   ; fin_de_partitura: la orden 0xFF: acaba el canal (y avisa de algunas musicas)
acaba_2_10_80:		; 2, 0x10 y 0x80
	ld ix,0c440h		;4ba0
	call fin_de_partitura		;4ba4   ; fin_de_partitura: la orden 0xFF: acaba el canal (y avisa de algunas musicas)
	ld ix,0c500h		;4ba7
	call fin_de_partitura		;4bab   ; fin_de_partitura: la orden 0xFF: acaba el canal (y avisa de algunas musicas)
	ld ix,0c5c0h		;4bae
	call fin_de_partitura		;4bb2   ; fin_de_partitura: la orden 0xFF: acaba el canal (y avisa de algunas musicas)
	call sin_fundido		;4bb5   ; fuera el fundido
	ret			;4bb8
acaba_4_y_8:		; 4 y 8
	ld ix,0c480h		;4bb9
	call fin_de_partitura		;4bbd   ; fin_de_partitura: la orden 0xFF: acaba el canal (y avisa de algunas musicas)
	ld ix,0c4c0h		;4bc0
	call fin_de_partitura		;4bc4   ; fin_de_partitura: la orden 0xFF: acaba el canal (y avisa de algunas musicas)
	call sin_fundido		;4bc7   ; sin_fundido: fuera el fundido (solo quedan los bits 1-2 de 0xC640) y su cuenta a 0
	ret			;4bca
acaba_40:		; 0x40 y los de p16:4BA0
	ld ix,0c580h		;4bcb
	call fin_de_partitura		;4bcf   ; fin_de_partitura: la orden 0xFF: acaba el canal (y avisa de algunas musicas)
	jp acaba_2_10_80		;4bd2   ; acaba_2_10_80: 2, 0x10 y 0x80
menos_fundido:		; E = el volumen E menos lo que baja el fundido (0xC642) si el canal es de los suyos (bit 5 todos; 7 4 y 8; 6 2, 0x10, 0x20 y 0x80; 3 1, 2, 0x10, 0x40 y 0x80; si no, todos menos 4 y 8); con la envolvente del PSG, 0
	ld hl,0c640h		;4bd5   ; apunta a el fundido: bit 0 en marcha, bits 3-7 que canales (los pedidos 0xF4-0xF9); bits 1-2 la pausa del canal 8 (0xF2)
	bit 5,(hl)		;4bd8   ; bit 5: todos
	jp nz,baja_por_fundido		;4bda   ; baja_por_fundido: con la envolvente, 0
	ld a,(0c644h)		;4bdd   ; el canal
	bit 7,(hl)		;4be0
	jp nz,fundido_4_y_8		;4be2   ; fundido_4_y_8:
	bit 6,(hl)		;4be5
	jp nz,fundido_de_f7		;4be7   ; fundido_de_f7:
	bit 3,(hl)		;4bea
	jp nz,fundido_de_f8		;4bec   ; fundido_de_f8:
	and 0f3h		;4bef   ; todos menos 4 y 8
	ret z			;4bf1
	jp baja_por_fundido		;4bf2   ; baja_por_fundido: con la envolvente, 0
fundido_4_y_8:
	and 00ch		;4bf5
	ret z			;4bf7
	jp baja_por_fundido		;4bf8   ; baja_por_fundido: con la envolvente, 0
fundido_de_f7:
	and 0b2h		;4bfb
	ret z			;4bfd
	jp baja_por_fundido		;4bfe   ; baja_por_fundido: con la envolvente, 0
fundido_de_f8:
	and 0d3h		;4c01
	ret z			;4c03
baja_por_fundido:		; con la envolvente, 0
	bit 2,(ix+00fh)		;4c04   ; mira el bit 2 de lo que suena (bits 0-1: 1 ruido, 2 tono, 3 los dos; bit 2 envolvente del PSG)
	jp nz,volumen_a_0		;4c08   ; volumen_a_0:
	ld a,(0c642h)		;4c0b   ; el volumen - lo bajado
	ld b,a			;4c0e
	ld a,e			;4c0f
	sub b			;4c10
	ld e,000h		;4c11
	ret m			;4c13   ; negativo, 0
	ld e,a			;4c14
	ret			;4c15
volumen_a_0:
	ld e,000h		;4c16
	ret			;4c18
fin_de_partitura:		; la orden 0xFF: acaba el canal (y avisa de algunas musicas)
	ld a,(0c644h)		;4c19   ; en el canal 1...
	cp 001h		;4c1c
	jp nz,acaba_en_40		;4c1e   ; acaba_en_40: en el canal 0x40, los sonidos 0x8C y 0x8E: 0xC68E = 1
	ld a,(ix+000h)		;4c21   ; ...las musicas 0x82 y 0x88...
	cp 082h		;4c24
	jp z,acaba_82_88		;4c26   ; acaba_82_88: ...0xC690 = 1 y 0xC697 = 0
	cp 088h		;4c29
	jp nz,acaba_a6		;4c2b   ; acaba_a6: 0xA6: 0xC693
acaba_82_88:		; ...0xC690 = 1 y 0xC697 = 0
	ld a,001h		;4c2e
	ld (0c690h),a		;4c30   ; guarda 1 al acabar las musicas 0x82 u 0x88
	xor a			;4c33
	ld (0c697h),a		;4c34   ; guarda 1 mientras suenan las musicas 0x82 u 0x88
	jp canal_callado		;4c37   ; canal_callado: el canal a 0: sonido, prioridad, bucles, periodo, volumen, lo que suena y las marcas; en el PSG, fuera su ruido de 0xC647 (en el canal 4, el de los otros vuelve a escribirse)
acaba_a6:		; 0xA6: 0xC693
	cp 0a6h		;4c3a
	jp nz,acaba_a1		;4c3c   ; acaba_a1: 0xA1: 0xC692
	ld a,001h		;4c3f
	ld (0c693h),a		;4c41   ; guarda 1 al acabar la musica 0xA6
	jp canal_callado		;4c44   ; canal_callado: el canal a 0: sonido, prioridad, bucles, periodo, volumen, lo que suena y las marcas; en el PSG, fuera su ruido de 0xC647 (en el canal 4, el de los otros vuelve a escribirse)
acaba_a1:		; 0xA1: 0xC692
	cp 0a1h		;4c47
	jp nz,acaba_86		;4c49   ; acaba_86: 0x86: 0xC694
	ld a,001h		;4c4c
	ld (0c692h),a		;4c4e   ; guarda 1 al acabar la musica 0xA1
	jp canal_callado		;4c51   ; canal_callado: el canal a 0: sonido, prioridad, bucles, periodo, volumen, lo que suena y las marcas; en el PSG, fuera su ruido de 0xC647 (en el canal 4, el de los otros vuelve a escribirse)
acaba_86:		; 0x86: 0xC694
	cp 086h		;4c54
	jp nz,acaba_94		;4c56   ; acaba_94: 0x94: 0xC695
	ld a,001h		;4c59
	ld (0c694h),a		;4c5b   ; guarda 1 al acabar la musica 0x86
	jp canal_callado		;4c5e   ; canal_callado: el canal a 0: sonido, prioridad, bucles, periodo, volumen, lo que suena y las marcas; en el PSG, fuera su ruido de 0xC647 (en el canal 4, el de los otros vuelve a escribirse)
acaba_94:		; 0x94: 0xC695
	cp 094h		;4c61
	jp nz,acaba_73		;4c63   ; acaba_73: 0x73: 0xC696
	ld a,001h		;4c66
	ld (0c695h),a		;4c68   ; guarda 1 al acabar la musica 0x94
	jp canal_callado		;4c6b   ; canal_callado: el canal a 0: sonido, prioridad, bucles, periodo, volumen, lo que suena y las marcas; en el PSG, fuera su ruido de 0xC647 (en el canal 4, el de los otros vuelve a escribirse)
acaba_73:		; 0x73: 0xC696
	cp 073h		;4c6e
	jp nz,acaba_8d		;4c70   ; acaba_8d: 0x8D: 0xCB58
	ld a,001h		;4c73
	ld (0c696h),a		;4c75   ; guarda 1 al acabar la musica 0x73
	jp canal_callado		;4c78   ; canal_callado: el canal a 0: sonido, prioridad, bucles, periodo, volumen, lo que suena y las marcas; en el PSG, fuera su ruido de 0xC647 (en el canal 4, el de los otros vuelve a escribirse)
acaba_8d:		; 0x8D: 0xCB58
	cp 08dh		;4c7b
	jp nz,canal_callado		;4c7d   ; canal_callado: el canal a 0: sonido, prioridad, bucles, periodo, volumen, lo que suena y las marcas; en el PSG, fuera su ruido de 0xC647 (en el canal 4, el de los otros vuelve a escribirse)
	ld a,001h		;4c80
	ld (0cb58h),a		;4c82   ; guarda 1 al acabar la musica 0x8D
	jp canal_callado		;4c85   ; canal_callado: el canal a 0: sonido, prioridad, bucles, periodo, volumen, lo que suena y las marcas; en el PSG, fuera su ruido de 0xC647 (en el canal 4, el de los otros vuelve a escribirse)
acaba_en_40:		; en el canal 0x40, los sonidos 0x8C y 0x8E: 0xC68E = 1
	ld a,(0c644h)		;4c88   ; lee el canal de sonido que se esta tocando (1, 2, 4...)
	cp 040h		;4c8b
	jp nz,canal_callado		;4c8d   ; canal_callado: el canal a 0: sonido, prioridad, bucles, periodo, volumen, lo que suena y las marcas; en el PSG, fuera su ruido de 0xC647 (en el canal 4, el de los otros vuelve a escribirse)
	ld a,(ix+000h)		;4c90
	cp 08ch		;4c93
	jp z,acaba_8c_8e		;4c95   ; acaba_8c_8e:
	cp 08eh		;4c98
	jp nz,canal_callado		;4c9a   ; canal_callado: el canal a 0: sonido, prioridad, bucles, periodo, volumen, lo que suena y las marcas; en el PSG, fuera su ruido de 0xC647 (en el canal 4, el de los otros vuelve a escribirse)
acaba_8c_8e:
	ld a,001h		;4c9d
	ld (0c68eh),a		;4c9f   ; guarda 1 al acabar los sonidos 0x8C o 0x8E del canal 0x40
canal_callado:		; el canal a 0: sonido, prioridad, bucles, periodo, volumen, lo que suena y las marcas; en el PSG, fuera su ruido de 0xC647 (en el canal 4, el de los otros vuelve a escribirse)
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
	ld a,(0c644h)		;4cc1   ; solo el PSG
	cp 008h		;4cc4
	ret nc			;4cc6
	cp 004h		;4cc7   ; canal 4...
	ld hl,0c647h		;4cc9   ; apunta a lo que falta escribir del PSG: bits 0-3 el ruido (canal 4 o los otros), 5-7 la envolvente
	jp nz,ruido_fuera		;4ccc   ; ruido_fuera: los otros: fuera los bits 2-3
	res 0,(hl)		;4ccf   ; ...fuera sus bits 0-1...
	res 1,(hl)		;4cd1
	bit 3,(hl)		;4cd3   ; ...y con los bits 2 y 3, el ruido de los otros se escribe otra vez (fuera el 3)
	ret z			;4cd5
	bit 2,(hl)		;4cd6
	ret z			;4cd8
	set 2,(hl)		;4cd9
	res 3,(hl)		;4cdb
	ret			;4cdd
ruido_fuera:		; los otros: fuera los bits 2-3
	res 2,(hl)		;4cde
	res 3,(hl)		;4ce0
	ret			;4ce2
banco_de_musica:		; el banco de la musica A (0x6A-0xEF) de p16:4CF9 a 0xC68F
	cp 06ah		;4ce3   ; por debajo de 0x6A...
	ret c			;4ce5
	cp 0f0h		;4ce6   ; ...o desde 0xF0, nada
	ret nc			;4ce8
	sub 06ah		;4ce9
	ld hl,04cf9h		;4ceb   ; su byte de la tabla
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


orden_octava:		; las ordenes 0xD0-0xD5: la octava (el nibble bajo de la orden)
	ld a,(de)			;4db0   ; el nibble bajo
	and 00fh		;4db1
	ld (ix+017h),a		;4db3
	ret			;4db6
orden_d6:		; 0xD6 [paso][cuenta]: el deslizamiento desde un periodo mayor (bit 5)
	ld (ix+03ah),020h		;4db7   ; el bit 5
paso_y_cuenta:		; [paso][cuenta] del deslizamiento
	inc de			;4dbb
	ld a,(de)			;4dbc   ; el paso
	ld (ix+037h),a		;4dbd
	inc de			;4dc0
	ld a,(de)			;4dc1   ; la cuenta...
	ld (ix+038h),a		;4dc2
	ld (ix+039h),a		;4dc5   ; ...y la inicial
	ret			;4dc8
orden_d7:		; 0xD7 [paso][cuenta]: el deslizamiento desde un periodo menor (bits 5 y 7)
	ld (ix+03ah),0a0h		;4dc9
	jp paso_y_cuenta		;4dcd   ; paso_y_cuenta: [paso][cuenta] del deslizamiento
orden_d8:		; 0xD8: sin deslizamiento
	xor a			;4dd0
	ld (ix+03ah),a		;4dd1
	ret			;4dd4
orden_d9:		; 0xD9 [0xD6 o 0xD7][paso][cuenta]: el deslizamiento segun la nota (bit 4; 0x38, o 0xBC con 0xD7)
	inc de			;4dd5
	ld a,(de)			;4dd6   ; 0xD7?
	cp 0d7h		;4dd7
	jp z,orden_d9_d7		;4dd9   ; orden_d9_d7: 0xBC
	ld (ix+03ah),038h		;4ddc   ; si no, 0x38
	jp paso_y_cuenta		;4de0   ; paso_y_cuenta: [paso][cuenta] del deslizamiento
orden_d9_d7:		; 0xBC
	ld (ix+03ah),0bch		;4de3
	jp paso_y_cuenta		;4de7   ; paso_y_cuenta: [paso][cuenta] del deslizamiento
orden_da:		; 0xDA [0xD6 o no][paso]: el barrido al cortar la nota (bit 1; con 0xD6 el periodo baja, si no sube)
	ld (ix+03ah),002h		;4dea   ; el bit 1
	inc de			;4dee
	ld a,(de)			;4def   ; 0xD6?
	cp 0d6h		;4df0
	jp z,paso_de_barrido		;4df2   ; paso_de_barrido: el paso
	set 7,(ix+03ah)		;4df5   ; si no, el bit 7
paso_de_barrido:		; el paso
	inc de			;4df9
	ld a,(de)			;4dfa
	ld (ix+037h),a		;4dfb
	ret			;4dfe
orden_db:		; 0xDB [v]: el volumen minimo
	inc de			;4dff
	ld a,(de)			;4e00
	ld (ix+021h),a		;4e01
	ret			;4e04
orden_dc:		; 0xDC: sin volumen minimo
	xor a			;4e05
	ld (ix+021h),a		;4e06
	ret			;4e09
orden_dd:		; 0xDD: el bit 2 de 0xD7D1 (la musica avisa al juego)
	push hl			;4e0a
	ld hl,0d7d1h		;4e0b   ; el bit 2 de 0xD7D1
	set 2,(hl)		;4e0e
	pop hl			;4e10
	ret			;4e11
orden_de:		; 0xDE [envolvente][volumen y corte][byte 0x28]: la envolvente de volumen, el volumen del canal (nibble alto), lo que suena (nibble bajo) y el volumen al cortar (byte 0x28: nibble alto la espera, bajo lo que baja)
	inc de			;4e12
	ld a,(de)			;4e13   ; la envolvente
	ld (ix+02ah),a		;4e14
	inc de			;4e17
	ld a,(de)			;4e18   ; el volumen del canal
	and 0f0h		;4e19
	rrca			;4e1b
	rrca			;4e1c
	rrca			;4e1d
	rrca			;4e1e
	ld (ix+016h),a		;4e1f
corte_y_28:		; lo que suena (nibble bajo)...
	ld a,(de)			;4e22
	and 00fh		;4e23
	ld (ix+026h),a		;4e25
	inc de			;4e28
	ld a,(de)			;4e29   ; ...y el byte 0x28...
	ld (ix+028h),a		;4e2a
	and 0f0h		;4e2d   ; ...con su nibble alto en el 0x27
	rrca			;4e2f
	rrca			;4e30
	rrca			;4e31
	rrca			;4e32
	ld (ix+027h),a		;4e33
	ret			;4e36
orden_df:		; 0xDF: fuera el bit 7 del byte 0x10
	res 7,(ix+010h)		;4e37
	ret			;4e3b
orden_e0:		; 0xE0 y 0xE2 (y 0xE1 y 0xE3 por p16:4E51): lo que suena = los bits 0-1 de la orden (0 nada, 1 ruido, 2 tono, 3 los dos) y, salvo con 0xE0, [duracion de las notas de bateria]
	res 7,(ix+010h)		;4e3c
	ld a,(de)			;4e40   ; los bits 0-1
	and 003h		;4e41
	ld (ix+00fh),a		;4e43
	ld b,a			;4e46
	inc de			;4e47
	ld a,(de)			;4e48   ; la duracion
	ld (ix+014h),a		;4e49
	ld a,b			;4e4c   ; con 0xE0...
	or a			;4e4d
	ret nz			;4e4e
	dec de			;4e4f   ; ...sin ese byte
	ret			;4e50
orden_e1:		; 0xE1 y 0xE3: con ruido; su periodo a escribir (bit 0 en el canal 4, bit 2 en los otros) y p16:4E3C
	ld a,(0c644h)		;4e51   ; el canal 4...
	cp 004h		;4e54
	ld a,(0c647h)		;4e56   ; lee lo que falta escribir del PSG: bits 0-3 el ruido (canal 4 o los otros), 5-7 la envolvente
	jp nz,ruido_otros		;4e59   ; ruido_otros: los otros: el bit 2
	set 0,a		;4e5c   ; ...el bit 0
	res 1,a		;4e5e
	ld (0c647h),a		;4e60   ; guarda lo que falta escribir del PSG: bits 0-3 el ruido (canal 4 o los otros), 5-7 la envolvente
	jp orden_e0		;4e63   ; orden_e0: 0xE0 y 0xE2 (y 0xE1 y 0xE3 por p16:4E51): lo que suena = los bits 0-1 de la orden (0 nada, 1 ruido, 2 tono, 3 los dos) y, salvo con 0xE0, [duracion de las notas de bateria]
ruido_otros:		; los otros: el bit 2
	set 2,a		;4e66
	res 3,a		;4e68
	ld (0c647h),a		;4e6a   ; guarda lo que falta escribir del PSG: bits 0-3 el ruido (canal 4 o los otros), 5-7 la envolvente
	jp orden_e0		;4e6d   ; orden_e0: 0xE0 y 0xE2 (y 0xE1 y 0xE3 por p16:4E51): lo que suena = los bits 0-1 de la orden (0 nada, 1 ruido, 2 tono, 3 los dos) y, salvo con 0xE0, [duracion de las notas de bateria]
orden_e4:		; 0xE4 [periodo]: el periodo del ruido (5 bits) a 0xC645 (canal 4) o 0xC646 (los otros), a escribir
	inc de			;4e70
	ld a,(de)			;4e71   ; 5 bits
	and 01fh		;4e72
	ld b,a			;4e74
	ld a,(0c644h)		;4e75   ; el canal 4...
	cp 004h		;4e78
	ld a,b			;4e7a
	jp nz,ruido_e4_otros		;4e7b   ; ruido_e4_otros: los otros: 0xC646
	ld (0c645h),a		;4e7e   ; ...0xC645
	ld a,(0c647h)		;4e81   ; lee lo que falta escribir del PSG: bits 0-3 el ruido (canal 4 o los otros), 5-7 la envolvente
	set 0,a		;4e84
	res 1,a		;4e86
	ld (0c647h),a		;4e88   ; guarda lo que falta escribir del PSG: bits 0-3 el ruido (canal 4 o los otros), 5-7 la envolvente
	ret			;4e8b
ruido_e4_otros:		; los otros: 0xC646
	ld (0c646h),a		;4e8c   ; guarda el periodo del ruido de los canales 1 y 2 (orden 0xE4)
	ld a,(0c647h)		;4e8f   ; lee lo que falta escribir del PSG: bits 0-3 el ruido (canal 4 o los otros), 5-7 la envolvente
	set 2,a		;4e92
	res 3,a		;4e94
	ld (0c647h),a		;4e96   ; guarda lo que falta escribir del PSG: bits 0-3 el ruido (canal 4 o los otros), 5-7 la envolvente
	ret			;4e99
orden_e5:		; 0xE5 [forma][alto][bajo]: la envolvente del PSG entera (R#13, R#12, R#11), a escribir, con el bit 2 de lo que suena
	inc de			;4e9a
	res 3,(ix+00fh)		;4e9b   ; fuera el bit 3
	ld a,(de)			;4e9f   ; la forma (R#13)
	ld (0c648h),a		;4ea0   ; guarda la forma de la envolvente del PSG (R#13; orden 0xE5)
	ld hl,0c647h		;4ea3   ; apunta a lo que falta escribir del PSG: bits 0-3 el ruido (canal 4 o los otros), 5-7 la envolvente
	ld a,(hl)			;4ea6
	set 5,a		;4ea7
	ld (hl),a			;4ea9
orden_e6:		; 0xE6 [alto][bajo]: el periodo de la envolvente (R#12 y R#11)
	inc de			;4eaa
	ld a,(de)			;4eab   ; el alto (R#12)
	ld (0c64ah),a		;4eac   ; guarda el periodo de la envolvente del PSG (alto, R#12; orden 0xE6)
	ld hl,0c647h		;4eaf   ; apunta a lo que falta escribir del PSG: bits 0-3 el ruido (canal 4 o los otros), 5-7 la envolvente
	ld a,(hl)			;4eb2
	set 6,a		;4eb3
	ld (hl),a			;4eb5
orden_e7:		; 0xE7 [bajo]: el periodo bajo de la envolvente (R#11)
	inc de			;4eb6
	ld a,(de)			;4eb7   ; el bajo (R#11)
	ld (0c649h),a		;4eb8   ; guarda el periodo de la envolvente del PSG (bajo, R#11; orden 0xE7)
	ld hl,0c647h		;4ebb   ; apunta a lo que falta escribir del PSG: bits 0-3 el ruido (canal 4 o los otros), 5-7 la envolvente
	ld a,(hl)			;4ebe
	set 7,a		;4ebf
	ld (hl),a			;4ec1
	set 2,(ix+00fh)		;4ec2   ; con envolvente
	ret			;4ec6
orden_e8:		; 0xE8: nada que escribir del ruido ni de la envolvente y fuera los bits 2-3 de lo que suena
	ld hl,0c647h		;4ec7   ; apunta a lo que falta escribir del PSG: bits 0-3 el ruido (canal 4 o los otros), 5-7 la envolvente
	xor a			;4eca
	ld (hl),a			;4ecb
	ld a,(ix+00fh)		;4ecc
	and 0f3h		;4ecf
	ld (ix+00fh),a		;4ed1
	ret			;4ed4
orden_e9:		; 0xE9 [t]: el tempo
	inc de			;4ed5
	ld a,(de)			;4ed6   ; el tempo
	ld (ix+015h),a		;4ed7
	xor a			;4eda   ; el byte alto de la nota a 0
	ld (ix+01fh),a		;4edb
	ret			;4ede
orden_ea:		; 0xEA [v]: el volumen del canal (nibble bajo)
	inc de			;4edf
	ld a,(de)			;4ee0
	and 00fh		;4ee1
	ld (ix+016h),a		;4ee3
	ret			;4ee6
orden_eb:		; 0xEB [subida y bajada][veces y corte][byte 0x28]: el volumen simple: espera de bajada (nibble alto; desde 8 primero sube, bits 1 y 5), paso de bajada (nibble bajo; desde 8 de golpe, bit 4), las veces (nibble alto) y lo de p16:4E22
	inc de			;4ee7
	ld (ix+02ah),000h		;4ee8   ; sin envolvente
	ld a,(ix+02bh)		;4eec   ; el volumen simple (bit 0; queda el 7)
	and 080h		;4eef
	or 001h		;4ef1
	ld (ix+02bh),a		;4ef3
	ld a,(de)			;4ef6   ; la espera (nibble alto)...
	and 0f0h		;4ef7
	rrca			;4ef9
	rrca			;4efa
	rrca			;4efb
	rrca			;4efc
	cp 008h		;4efd   ; ...desde 8...
	jp c,espera_de_bajada		;4eff   ; espera_de_bajada:
	set 1,(ix+02bh)		;4f02   ; ...primero sube
	set 5,(ix+02bh)		;4f06
	res 3,a		;4f0a
espera_de_bajada:
	ld (ix+02ch),a		;4f0c
	ld a,(de)			;4f0f   ; el paso (nibble bajo)...
	and 00fh		;4f10
	cp 008h		;4f12   ; ...desde 8...
	jp c,paso_de_bajada		;4f14   ; paso_de_bajada:
	set 4,(ix+02bh)		;4f17   ; ...de golpe
	res 3,a		;4f1b
paso_de_bajada:
	ld (ix+022h),a		;4f1d
	inc de			;4f20   ; las veces (nibble alto)
	ld a,(de)			;4f21
	and 0f0h		;4f22
	rrca			;4f24
	rrca			;4f25
	rrca			;4f26
	rrca			;4f27
	ld (ix+023h),a		;4f28
	jp corte_y_28		;4f2b   ; y el corte
orden_ec:		; 0xEC: sin volumen simple (quedan los bits 6-7)
	ld a,(ix+02bh)		;4f2e
	and 0c0h		;4f31
	ld (ix+02bh),a		;4f33
	ret			;4f36
orden_ed:		; 0xED [subida]: la espera de la subida (nibble alto) y el volumen de partida (nibble bajo)
	inc de			;4f37
	ld a,(de)			;4f38   ; el byte 0x2E...
	ld (ix+02eh),a		;4f39
	and 0f0h		;4f3c   ; ...y su nibble alto en el 0x2D
	rrca			;4f3e
	rrca			;4f3f
	rrca			;4f40
	rrca			;4f41
	ld (ix+02dh),a		;4f42
	ret			;4f45
orden_ee:		; 0xEE [d]: el desafinado y en marcha
	inc de			;4f46
	ld a,(de)			;4f47
	ld (ix+036h),a		;4f48
	set 1,(ix+010h)		;4f4b
	ret			;4f4f
orden_ef:		; 0xEF: sin desafinado
	res 1,(ix+010h)		;4f50
	ret			;4f54
orden_f0:		; 0xF0 [vibrato][espera y amplitud]: el vibrato (0 nada) y, con el, la espera (nibble alto: 0 nada, 1 el tempo, n el byte 0x0E (el volumen) + el tempo * (n - 1)) y la amplitud (nibble bajo)
	inc de			;4f55
	ld a,(de)			;4f56   ; el vibrato
	ld (ix+031h),a		;4f57
	or a			;4f5a
	ret z			;4f5b   ; 0: sin vibrato
	set 7,(ix+031h)		;4f5c   ; en marcha
	inc de			;4f60
	ld a,(de)			;4f61   ; la espera (nibble alto)
	srl a		;4f62
	srl a		;4f64
	srl a		;4f66
	srl a		;4f68
	or a			;4f6a
	jp z,pon_espera_vibrato		;4f6b   ; 0
	dec a			;4f6e
	jp z,espera_un_tempo		;4f6f   ; 1: el tempo
	ld c,a			;4f72
	ld a,(ix+00eh)		;4f73   ; n: el byte 0x0E...
espera_de_vibrato:		; ...+ el tempo, n - 1 veces
	add a,(ix+015h)		;4f76
	dec c			;4f79
	jp nz,espera_de_vibrato		;4f7a   ; espera_de_vibrato: ...+ el tempo, n - 1 veces
pon_espera_vibrato:
	ld (ix+032h),a		;4f7d
	ld a,(de)			;4f80   ; la amplitud (nibble bajo)
	and 00fh		;4f81
	ld (ix+033h),a		;4f83
	ret			;4f86
espera_un_tempo:
	ld a,(ix+015h)		;4f87
	jp pon_espera_vibrato		;4f8a   ; pon_espera_vibrato:
orden_f1:		; 0xF1 [onda 1 (bit 7: ida y vuelta)][onda 2][paso][espera]: la mezcla de ondas del canal 0x10, en marcha
	res 4,(ix+03bh)		;4f8d   ; fuera las cuatro ondas
	ld a,001h		;4f91   ; en marcha
	ld (0c68bh),a		;4f93   ; guarda las marcas de la mezcla (bit 0 en marcha, 1 acabada, 2 ida y vuelta, 3 tambien el canal 0x20, 5 sentido)
	inc de			;4f96
	ld a,(de)			;4f97   ; con el bit 7...
	bit 7,a		;4f98
	jp z,ondas_de_mezcla		;4f9a   ; ondas_de_mezcla: la primera onda (p16:583E)
	res 7,a		;4f9d
	ld c,a			;4f9f
	ld a,005h		;4fa0   ; ...ida y vuelta (bit 2)
	ld (0c68bh),a		;4fa2   ; guarda las marcas de la mezcla (bit 0 en marcha, 1 acabada, 2 ida y vuelta, 3 tambien el canal 0x20, 5 sentido)
	ld a,c			;4fa5
ondas_de_mezcla:		; la primera onda (p16:583E)
	call onda_de_tabla		;4fa6   ; onda_de_tabla: HL = la entrada A de la tabla de ondas p16:583E
	ld a,(hl)			;4fa9
	ld (0c683h),a		;4faa   ; guarda la primera onda de la mezcla (puntero; orden 0xF1)
	inc hl			;4fad
	ld a,(hl)			;4fae
	ld (0c684h),a		;4faf
	inc de			;4fb2
	ld a,(de)			;4fb3
	call onda_de_tabla		;4fb4   ; la segunda
	ld a,(hl)			;4fb7
	ld (0c685h),a		;4fb8   ; guarda la segunda onda de la mezcla (puntero; orden 0xF1)
	inc hl			;4fbb
	ld a,(hl)			;4fbc
	ld (0c686h),a		;4fbd
	inc de			;4fc0
	ld a,(de)			;4fc1   ; lo que se mueve en cada paso
	and 00fh		;4fc2
	ld (0c688h),a		;4fc4   ; guarda lo que se mueve la mezcla en cada paso (0: la primera onda, 0x0F: la segunda)
	inc de			;4fc7
	ld a,(de)			;4fc8   ; la espera
	ld (0c68ah),a		;4fc9   ; guarda la espera inicial de la mezcla
	ret			;4fcc
onda_de_tabla:		; HL = la entrada A de la tabla de ondas p16:583E
	ld hl,0583eh		;4fcd   ; la tabla de ondas
	add a,a			;4fd0   ; + 2 * A
	add a,l			;4fd1
	ld l,a			;4fd2
	ret nc			;4fd3   ; sin acarreo, ya
	inc h			;4fd4   ; con acarreo, el alto
	ret			;4fd5
orden_f2:		; 0xF2 [0 o no]: la mezcla tambien en el canal 0x20 (bit 3)
	inc de			;4fd6
	ld a,(de)			;4fd7
	or a			;4fd8
	ld a,(0c68bh)		;4fd9   ; lee las marcas de la mezcla (bit 0 en marcha, 1 acabada, 2 ida y vuelta, 3 tambien el canal 0x20, 5 sentido)
	jp z,f2_no		;4fdc   ; f2_no: sin el bit 3
	set 3,a		;4fdf
	ld (0c68bh),a		;4fe1   ; guarda las marcas de la mezcla (bit 0 en marcha, 1 acabada, 2 ida y vuelta, 3 tambien el canal 0x20, 5 sentido)
	ret			;4fe4
f2_no:		; sin el bit 3
	res 3,a		;4fe5
	ld (0c68bh),a		;4fe7   ; guarda las marcas de la mezcla (bit 0 en marcha, 1 acabada, 2 ida y vuelta, 3 tambien el canal 0x20, 5 sentido)
	ret			;4fea
orden_f3:		; 0xF3 [0 o no]: con el bit 6, la mezcla solo vuelve a empezar en la primera nota
	inc de			;4feb
	ld a,(de)			;4fec
	or a			;4fed
	ld a,(0c68bh)		;4fee   ; lee las marcas de la mezcla (bit 0 en marcha, 1 acabada, 2 ida y vuelta, 3 tambien el canal 0x20, 5 sentido)
	jp z,f3_no		;4ff1   ; f3_no: sin el bit 6
	set 6,a		;4ff4
	ld (0c68bh),a		;4ff6   ; guarda las marcas de la mezcla (bit 0 en marcha, 1 acabada, 2 ida y vuelta, 3 tambien el canal 0x20, 5 sentido)
	ret			;4ff9
f3_no:		; sin el bit 6
	res 6,a		;4ffa
	ld (0c68bh),a		;4ffc   ; guarda las marcas de la mezcla (bit 0 en marcha, 1 acabada, 2 ida y vuelta, 3 tambien el canal 0x20, 5 sentido)
	ret			;4fff
orden_f4:		; 0xF4 [a][b][c][d]: las cuatro ondas del canal (al empezar la nota, al bajar, al acabar la bajada y al cortar)
	set 4,(ix+03bh)		;5000   ; en marcha
	inc de			;5004
	ld a,(de)			;5005   ; al empezar la nota
	ld (ix+03ch),a		;5006
	inc de			;5009
	ld a,(de)			;500a   ; al bajar el volumen
	ld (ix+03dh),a		;500b
	inc de			;500e
	ld a,(de)			;500f   ; al acabar la bajada
	ld (ix+03eh),a		;5010
	inc de			;5013
	ld a,(de)			;5014   ; al cortar la nota
	ld (ix+03fh),a		;5015
	ret			;5018
orden_f5:		; 0xF5: la vuelta de 0xFB aqui
	ld (ix+007h),e		;5019
	ld (ix+008h),d		;501c
	ret			;501f
orden_f6:		; 0xF6: sin mezcla de ondas
	xor a			;5020
	ld (0c68bh),a		;5021   ; guarda las marcas de la mezcla (bit 0 en marcha, 1 acabada, 2 ida y vuelta, 3 tambien el canal 0x20, 5 sentido)
	ret			;5024
orden_f7:		; 0xF7 [b]: el bit 7 del byte 0x10 y el byte 0x20
	set 7,(ix+010h)		;5025
	inc de			;5029
	ld a,(de)			;502a
	ld (ix+020h),a		;502b
	ret			;502e
orden_f8:		; 0xF8 [onda]: la forma de onda del canal (sin las cuatro ondas)
	res 4,(ix+03bh)		;502f
	inc de			;5033   ; la onda
	ld a,(de)			;5034
pon_onda:		; la onda A de la tabla p16:583E al canal, a cargar
	set 7,(ix+02bh)		;5035   ; a cargar
	ld hl,0583eh		;5039   ; su entrada
	add a,a			;503c
	add a,l			;503d
	ld l,a			;503e
	jp nc,L_5043		;503f
	inc h			;5042
L_5043:
	ld a,(hl)			;5043   ; el puntero
	ld (ix+01bh),a		;5044
	inc hl			;5047
	ld a,(hl)			;5048
	ld (ix+01ch),a		;5049
	ret			;504c
orden_f9:		; 0xF9 [dir]: llamada: sigue en dir y la vuelta en los bytes 9-0x0A
	call salta_a_dir		;504d   ; salta_a_dir: DE = [dir] - 1 (HL = el byte alto)
	ld (ix+009h),l		;5050
	ld (ix+00ah),h		;5053
	ret			;5056
orden_fa:		; 0xFA: vuelve de la llamada
	ld e,(ix+009h)		;5057
	ld d,(ix+00ah)		;505a
	ret			;505d
orden_fb:		; 0xFB [n]: vuelve a la marca 0xF5 hasta n veces
	inc de			;505e
	ld b,(ix+005h)		;505f   ; una vuelta mas...
	inc b			;5062
	ld a,(de)			;5063
	cp b			;5064   ; ...llegado a n, sigue
	jp z,fb_acaba		;5065   ; fb_acaba: la cuenta a 0
	ld (ix+005h),b		;5068   ; si no, a la marca
	ld e,(ix+007h)		;506b
	ld d,(ix+008h)		;506e
	ret			;5071
fb_acaba:		; la cuenta a 0
	ld (ix+005h),000h		;5072
	ret			;5076
orden_fc:		; 0xFC [n][dir]: salta a dir hasta n veces
	inc de			;5077
	ld b,(ix+006h)		;5078   ; una vuelta mas...
	inc b			;507b
	ld a,(de)			;507c
	cp b			;507d   ; ...llegado a n, sigue
	jp z,fc_acaba		;507e   ; fc_acaba: se salta dir
	ld (ix+006h),b		;5081
salta_a_dir:		; DE = [dir] - 1 (HL = el byte alto)
	inc de			;5084   ; dir: el bajo...
	ld a,(de)			;5085
	ld l,a			;5086
	inc de			;5087   ; ...y el alto
	ld a,(de)			;5088
	ld h,a			;5089
	ex de,hl			;508a   ; DE = dir, HL = donde estaba
	dec de			;508b   ; menos uno: lee_partitura suma uno
	ret			;508c
fc_acaba:		; se salta dir
	inc de			;508d
	inc de			;508e
	ld (ix+006h),000h		;508f   ; la cuenta a 0
	ret			;5093
orden_fd:		; 0xFD [dir]: salta a dir
	jp salta_a_dir		;5094   ; salta_a_dir: DE = [dir] - 1 (HL = el byte alto)
orden_fe:		; 0xFE [modo]: el modo del canal; al dejar el 1 se guardan y borran los bytes 0x10 y 0x2B, al volver al 1 vuelven
	inc de			;5097
	ld b,(ix+00bh)		;5098   ; B = el de antes
	ld a,(de)			;509b
	ld (ix+00bh),a		;509c
	cp 001h		;509f   ; el nuevo es 1?
	ld a,b			;50a1
	jp z,vuelve_al_1		;50a2   ; vuelve_al_1: ya era 1: nada
	cp 001h		;50a5   ; dejando el 1...
	ret nz			;50a7
	ld a,(ix+010h)		;50a8   ; ...se guardan...
	ld (ix+01dh),a		;50ab
	ld a,(ix+02bh)		;50ae
	ld (ix+01eh),a		;50b1
	xor a			;50b4   ; ...y a 0
	ld (ix+010h),a		;50b5
	ld (ix+02bh),a		;50b8
	ret			;50bb
vuelve_al_1:		; ya era 1: nada
	cp 001h		;50bc
	ret z			;50be
	ld a,(ix+01dh)		;50bf   ; vuelven
	ld (ix+010h),a		;50c2
	ld a,(ix+01eh)		;50c5
	ld (ix+02bh),a		;50c8
	ret			;50cb
salida_de_sonido:		; la salida del cuadro: el ruido de los canales 1 y 4, los periodos y volumenes del PSG, su ruido y su envolvente, el mezclador, lo cambiado del SCC, sus canales encendidos, sus registros y sus ondas
	call ruido_1_y_4		;50cc   ; canales 1 y 4 con ruido
	call psg_periodos		;50cf   ; el PSG: periodos y volumenes
	call psg_ruido		;50d2   ; el periodo del ruido
	call psg_envolvente		;50d5   ; la envolvente
	call psg_mezclador		;50d8   ; el mezclador
	call scc_cambiado		;50db   ; lo cambiado del SCC
	call scc_encendidos		;50de   ; sus canales encendidos
	call scc_registros		;50e1   ; sus registros
	jp scc_ondas		;50e4   ; sus ondas
ruido_1_y_4:		; con ruido en los canales 1 y 4 a la vez, el canal 1 se queda sin nada (fuera los bits 0-1)
	ld a,(0c40fh)		;50e7   ; el canal 1 con ruido...
	bit 0,a		;50ea
	ret z			;50ec
	ld a,(0c48fh)		;50ed   ; ...y el 4 tambien...
	bit 0,a		;50f0
	ret z			;50f2
	ld hl,0c40fh		;50f3   ; ...el 1 sin nada
	res 1,(hl)		;50f6
	res 0,(hl)		;50f8
	ret			;50fa
psg_periodos:		; los canales 1, 2 y 4: periodo (R#0-R#5) y volumen (R#8-R#10); con la envolvente, el volumen solo una vez
	ld b,000h		;50fb   ; desde R#0...
	ld c,008h		;50fd   ; ...y R#8
	ld hl,0c40ch		;50ff   ; canal 1
	call psg_canal		;5102   ; psg_canal: el periodo bajo...
	ld hl,0c44ch		;5105   ; canal 2
	call psg_canal		;5108   ; psg_canal: el periodo bajo...
	ld hl,0c48ch		;510b   ; canal 4
psg_canal:		; el periodo bajo...
	ld e,(hl)			;510e
	ld a,b			;510f
	call escribe_psg		;5110   ; escribe_psg: escribe A en el registro del PSG (PR2 p13:73A6)
	inc hl			;5113
	inc b			;5114
	ld e,(hl)			;5115   ; ...y el alto
	ld a,b			;5116
	call escribe_psg		;5117   ; escribe_psg: escribe A en el registro del PSG (PR2 p13:73A6)
	inc hl			;511a
	ld e,(hl)			;511b   ; el volumen
	ld a,c			;511c
	inc b			;511d
	inc c			;511e
	inc hl			;511f
	bit 3,(hl)		;5120   ; escrito ya con la envolvente: nada
	ret nz			;5122
	call escribe_psg		;5123   ; escribe_psg: escribe A en el registro del PSG (PR2 p13:73A6)
	bit 2,(hl)		;5126   ; con la envolvente...
	ret z			;5128
	set 3,(hl)		;5129   ; ...ya escrito
	ret			;512b
psg_ruido:		; el periodo del ruido (R#6) pendiente: el del canal 4 (bit 0, queda el 1) o el de los otros (bit 2, queda el 3)
	ld hl,0c647h		;512c   ; apunta a lo que falta escribir del PSG: bits 0-3 el ruido (canal 4 o los otros), 5-7 la envolvente
	bit 0,(hl)		;512f   ; el del canal 4...
	jp z,ruido_de_otros		;5131   ; ruido_de_otros: con el del 4 escrito, nada
	res 0,(hl)		;5134
	set 1,(hl)		;5136
	ld a,(0c645h)		;5138   ; ...0xC645
	ld e,a			;513b
	ld a,006h		;513c
	jp escribe_ruido		;513e   ; escribe_ruido:
ruido_de_otros:		; con el del 4 escrito, nada
	bit 1,(hl)		;5141
	ret nz			;5143
	bit 2,(hl)		;5144   ; el de los otros...
	ret z			;5146
	res 2,(hl)		;5147
	set 3,(hl)		;5149
	ld a,(0c646h)		;514b   ; ...0xC646
	ld e,a			;514e
	ld a,006h		;514f
escribe_ruido:
	jp escribe_psg		;5151   ; escribe_psg: escribe A en el registro del PSG (PR2 p13:73A6)
psg_envolvente:		; la envolvente pendiente: R#11 (bit 7), R#12 (bit 6) y R#13 (bit 5)
	ld hl,0c647h		;5154   ; apunta a lo que falta escribir del PSG: bits 0-3 el ruido (canal 4 o los otros), 5-7 la envolvente
	bit 7,(hl)		;5157
	ret z			;5159
	res 7,(hl)		;515a
	ld a,(0c649h)		;515c   ; R#11
	ld e,a			;515f
	ld a,00bh		;5160
	call escribe_psg		;5162   ; escribe_psg: escribe A en el registro del PSG (PR2 p13:73A6)
	bit 6,(hl)		;5165
	ret z			;5167
	res 6,(hl)		;5168
	ld a,(0c64ah)		;516a   ; R#12
	ld e,a			;516d
	ld a,00ch		;516e
	call escribe_psg		;5170   ; escribe_psg: escribe A en el registro del PSG (PR2 p13:73A6)
	bit 5,(hl)		;5173
	ret z			;5175
	res 5,(hl)		;5176
	ld a,(0c648h)		;5178   ; R#13
	ld e,a			;517b
	ld a,00dh		;517c
	jp escribe_psg		;517e   ; escribe_psg: escribe A en el registro del PSG (PR2 p13:73A6)
psg_mezclador:		; el mezclador (R#7) de lo que suena en los canales 1, 2 y 4 (tablas p16:51B4, p16:51B8, p16:51BC)
	ld hl,0c40fh		;5181   ; canal 1
	ld a,(hl)			;5184
	ld hl,051b4h		;5185   ; sonido_51B4: datos de sonido que lee el motor de p16 al tocar los sonidos 0x01, 0x02, 0x03, 0x04, 0x05,
	call byte_por_lo_que_suena		;5188   ; byte_por_lo_que_suena: HL + los bits 0-1
	ld b,(hl)			;518b
	ld hl,0c44fh		;518c   ; canal 2
	ld a,(hl)			;518f
	ld hl,051b8h		;5190
	call byte_por_lo_que_suena		;5193   ; byte_por_lo_que_suena: HL + los bits 0-1
	ld c,(hl)			;5196
	ld hl,0c48fh		;5197   ; canal 4
	ld a,(hl)			;519a
	ld hl,051bch		;519b   ; sonido_51BC: datos de sonido que lee el motor de p16 al tocar los sonidos 0x01, 0x02, 0x03, 0x04, 0x05,
	call byte_por_lo_que_suena		;519e   ; byte_por_lo_que_suena: HL + los bits 0-1
	ld a,(hl)			;51a1   ; los tres juntos
	or b			;51a2
	or c			;51a3
pon_mezclador:		; R#7 = A (y en 0xC643)
	ld e,a			;51a4
	ld (0c643h),a		;51a5   ; guarda el mezclador del PSG (R#7) que se escribe
	ld a,007h		;51a8
	jp escribe_psg		;51aa   ; escribe_psg: escribe A en el registro del PSG (PR2 p13:73A6)
byte_por_lo_que_suena:		; HL + los bits 0-1
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


scc_cambiado:		; el periodo (2 bytes) y el volumen de los canales 8, 0x10, 0x20, 0x40 y 0x80 contra su copia (0xC64D, 0xC657): los distintos se copian y su bit en 0xC64B-0xC64C
	ld ix,0c64bh		;51c0   ; los bits
	ld bc,0c657h		;51c4   ; la copia de los volumenes
	ld de,0c64dh		;51c7   ; la de los periodos
	ld hl,0c4cch		;51ca   ; canal 8
	ld a,(de)			;51cd   ; el periodo bajo...
	res 0,(ix+000h)		;51ce
	cp (hl)			;51d2
	jp z,L_51DC		;51d3   ; ...igual?
	set 0,(ix+000h)		;51d6   ; cambiado
	ld a,(hl)			;51da
	ld (de),a			;51db
L_51DC:
	inc de			;51dc
	inc hl			;51dd
	ld a,(de)			;51de   ; el alto
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
	ld a,(bc)			;51f3   ; el volumen
	cp (hl)			;51f4
	jp z,L_51FE		;51f5
	set 2,(ix+001h)		;51f8
	ld a,(hl)			;51fc
	ld (bc),a			;51fd
L_51FE:
	inc bc			;51fe
	ld hl,0c50ch		;51ff   ; canal 0x10
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
	ld a,(de)			;5213   ; el periodo alto de la copia...
	res 3,(ix+000h)		;5214   ; ...sin cambio
	cp (hl)			;5218   ; igual que el del canal 0x10?
	jp z,L_5222		;5219
	set 3,(ix+000h)		;521c   ; cambiado
	ld a,(hl)			;5220   ; a la copia
	ld (de),a			;5221
L_5222:
	inc de			;5222
	inc hl			;5223
	res 3,(ix+001h)		;5224   ; sin cambio...
	ld a,(bc)			;5228   ; ...el volumen de la copia
	cp (hl)			;5229   ; igual que el del canal 0x10?
	jp z,L_5233		;522a
	set 3,(ix+001h)		;522d   ; cambiado
	ld a,(hl)			;5231   ; a la copia
	ld (bc),a			;5232
L_5233:
	inc bc			;5233
	ld hl,0c54ch		;5234   ; canal 0x20
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
	ld a,(de)			;5248   ; el periodo alto de la copia...
	res 5,(ix+000h)		;5249   ; ...sin cambio
	cp (hl)			;524d   ; igual que el del canal 0x20?
	jp z,L_5257		;524e
	set 5,(ix+000h)		;5251   ; cambiado
	ld a,(hl)			;5255   ; a la copia
	ld (de),a			;5256
L_5257:
	inc de			;5257
	inc hl			;5258
	res 4,(ix+001h)		;5259   ; sin cambio...
	ld a,(bc)			;525d   ; ...el volumen de la copia
	cp (hl)			;525e   ; igual que el del canal 0x20?
	jp z,L_5268		;525f
	set 4,(ix+001h)		;5262   ; cambiado
	ld a,(hl)			;5266   ; a la copia
	ld (bc),a			;5267
L_5268:
	inc bc			;5268
	ld hl,0c58ch		;5269   ; canal 0x40
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
	ld a,(de)			;527d   ; el periodo alto de la copia...
	res 7,(ix+000h)		;527e   ; ...sin cambio
	cp (hl)			;5282   ; igual que el del canal 0x40?
	jp z,L_528C		;5283
	set 7,(ix+000h)		;5286   ; cambiado
	ld a,(hl)			;528a   ; a la copia
	ld (de),a			;528b
L_528C:
	inc de			;528c
	inc hl			;528d
	res 5,(ix+001h)		;528e   ; sin cambio...
	ld a,(bc)			;5292   ; ...el volumen de la copia
	cp (hl)			;5293   ; igual que el del canal 0x40?
	jp z,L_529D		;5294
	set 5,(ix+001h)		;5297   ; cambiado
	ld a,(hl)			;529b   ; a la copia
	ld (bc),a			;529c
L_529D:
	inc bc			;529d
	ld hl,0c5cch		;529e   ; canal 0x80
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
	ld a,(de)			;52b2   ; el periodo alto de la copia...
	res 1,(ix+001h)		;52b3   ; ...sin cambio
	cp (hl)			;52b7   ; igual que el del canal 0x80?
	jp z,L_52C1		;52b8
	set 1,(ix+001h)		;52bb   ; cambiado
	ld a,(hl)			;52bf   ; a la copia
	ld (de),a			;52c0
L_52C1:
	inc de			;52c1
	inc hl			;52c2
	res 6,(ix+001h)		;52c3   ; sin cambio...
	ld a,(bc)			;52c7   ; ...el volumen de la copia
	cp (hl)			;52c8   ; igual que el del canal 0x80?
	jp z,L_52D2		;52c9
	set 6,(ix+001h)		;52cc   ; cambiado
	ld a,(hl)			;52d0   ; a la copia
	ld (bc),a			;52d1
L_52D2:
	inc bc			;52d2
	ret			;52d3
scc_encendidos:		; los canales del SCC con algo que suena (byte 0x0F): bit a bit; si cambia, a 0xC65C y el bit 7 de 0xC64C
	ld e,000h		;52d4
	ld hl,0c4cfh		;52d6   ; canal 8
	ld c,001h		;52d9
	ld a,(hl)			;52db
	or a			;52dc
	jp z,L_52E1		;52dd
	ld a,c			;52e0
L_52E1:
	or e			;52e1
	ld e,a			;52e2
	ld hl,0c50fh		;52e3   ; canal 0x10
	sla c		;52e6
	ld a,(hl)			;52e8
	or a			;52e9
	jp z,L_52EE		;52ea
	ld a,c			;52ed
L_52EE:
	or e			;52ee
	ld e,a			;52ef
	ld hl,0c54fh		;52f0   ; canal 0x20
	sla c		;52f3
	ld a,(hl)			;52f5
	or a			;52f6
	jp z,L_52FB		;52f7
	ld a,c			;52fa
L_52FB:
	or e			;52fb
	ld e,a			;52fc
	ld hl,0c58fh		;52fd   ; canal 0x40
	sla c		;5300
	ld a,(hl)			;5302
	or a			;5303
	jp z,L_5308		;5304
	ld a,c			;5307
L_5308:
	or e			;5308
	ld e,a			;5309
	ld hl,0c5cfh		;530a   ; canal 0x80
	sla c		;530d
	ld a,(hl)			;530f
	or a			;5310
	jp z,L_5315		;5311
	ld a,c			;5314
L_5315:
	or e			;5315
	ld e,a			;5316
	ld hl,0c65ch		;5317   ; distinto del de antes?
	ld a,(hl)			;531a
	cp e			;531b
	jp z,encendidos_igual		;531c   ; encendidos_igual:
	ld (hl),e			;531f
	ld hl,0c64ch		;5320   ; a escribir
	set 7,(hl)		;5323
	ret			;5325
encendidos_igual:
	ld hl,0c64ch		;5326
	res 7,(hl)		;5329
	ret			;532b
scc_registros:		; los 16 registros del SCC (0x9880-0x988F) con su bit en 0xC64B-0xC64C, desde sus copias
	ld ix,0c64bh		;532c   ; apunta a los registros del SCC que cambiaron este cuadro (16 bits, uno por registro)
	ld hl,0c64dh		;5330   ; apunta a la copia de los periodos del SCC (5 x 2, 0x9880-0x9889)
	ld de,09880h		;5333
	bit 0,(ix+000h)		;5336   ; los periodos (0x9880-0x9889)...
	call nz,escribe_scc		;533a   ; escribe_scc: (HL) al registro DE del SCC (0x3F en 0x9000) y el banco 0x12 de vuelta
	inc hl			;533d
	inc de			;533e
	bit 1,(ix+000h)		;533f
	call nz,escribe_scc		;5343   ; escribe_scc: (HL) al registro DE del SCC (0x3F en 0x9000) y el banco 0x12 de vuelta
	inc hl			;5346
	inc de			;5347
	bit 2,(ix+000h)		;5348
	call nz,escribe_scc		;534c   ; escribe_scc: (HL) al registro DE del SCC (0x3F en 0x9000) y el banco 0x12 de vuelta
	inc hl			;534f
	inc de			;5350
	bit 3,(ix+000h)		;5351
	call nz,escribe_scc		;5355   ; escribe_scc: (HL) al registro DE del SCC (0x3F en 0x9000) y el banco 0x12 de vuelta
	inc hl			;5358
	inc de			;5359
	bit 4,(ix+000h)		;535a
	call nz,escribe_scc		;535e   ; escribe_scc: (HL) al registro DE del SCC (0x3F en 0x9000) y el banco 0x12 de vuelta
	inc hl			;5361
	inc de			;5362
	bit 5,(ix+000h)		;5363
	call nz,escribe_scc		;5367   ; escribe_scc: (HL) al registro DE del SCC (0x3F en 0x9000) y el banco 0x12 de vuelta
	inc hl			;536a
	inc de			;536b
	bit 6,(ix+000h)		;536c
	call nz,escribe_scc		;5370   ; escribe_scc: (HL) al registro DE del SCC (0x3F en 0x9000) y el banco 0x12 de vuelta
	inc hl			;5373
	inc de			;5374
	bit 7,(ix+000h)		;5375
	call nz,escribe_scc		;5379   ; escribe_scc: (HL) al registro DE del SCC (0x3F en 0x9000) y el banco 0x12 de vuelta
	inc hl			;537c
	inc de			;537d
	bit 0,(ix+001h)		;537e
	call nz,escribe_scc		;5382   ; escribe_scc: (HL) al registro DE del SCC (0x3F en 0x9000) y el banco 0x12 de vuelta
	inc hl			;5385
	inc de			;5386
	bit 1,(ix+001h)		;5387
	call nz,escribe_scc		;538b   ; escribe_scc: (HL) al registro DE del SCC (0x3F en 0x9000) y el banco 0x12 de vuelta
	inc hl			;538e
	inc de			;538f
	bit 2,(ix+001h)		;5390   ; ...los volumenes (0x988A-0x988E)...
	call nz,escribe_scc		;5394   ; escribe_scc: (HL) al registro DE del SCC (0x3F en 0x9000) y el banco 0x12 de vuelta
	inc hl			;5397
	inc de			;5398
	bit 3,(ix+001h)		;5399
	call nz,escribe_scc		;539d   ; escribe_scc: (HL) al registro DE del SCC (0x3F en 0x9000) y el banco 0x12 de vuelta
	inc hl			;53a0
	inc de			;53a1
	bit 4,(ix+001h)		;53a2
	call nz,escribe_scc		;53a6   ; escribe_scc: (HL) al registro DE del SCC (0x3F en 0x9000) y el banco 0x12 de vuelta
	inc hl			;53a9
	inc de			;53aa
	bit 5,(ix+001h)		;53ab
	call nz,escribe_scc		;53af   ; escribe_scc: (HL) al registro DE del SCC (0x3F en 0x9000) y el banco 0x12 de vuelta
	inc hl			;53b2
	inc de			;53b3
	bit 6,(ix+001h)		;53b4
	call nz,escribe_scc		;53b8   ; escribe_scc: (HL) al registro DE del SCC (0x3F en 0x9000) y el banco 0x12 de vuelta
	inc hl			;53bb
	inc de			;53bc
	bit 7,(ix+001h)		;53bd   ; ...y los encendidos (0x988F)
	ret z			;53c1
escribe_scc:		; (HL) al registro DE del SCC (0x3F en 0x9000) y el banco 0x12 de vuelta
	ld a,03fh		;53c2
	ld (09000h),a		;53c4   ; 0x3F en 0x9000: los registros del SCC en 0x9800
	ld a,(hl)			;53c7
	ld (de),a			;53c8
	ld a,012h		;53c9
	ld (09000h),a		;53cb   ; el mapper: pone en 0x8000 el banco de A
	ret			;53ce
scc_ondas:		; las ondas a cargar (bit 7 del byte 0x2B): canal 8 a 0x9800, 0x10 a 0x9820 (la mezcla de 0xC663 si esta en marcha), 0x20 a 0x9840 (la mezcla con el bit 3 de 0xC68B) y 0x40 a 0x9860 (el 0x80 la comparte)
	ld ix,0c4c0h		;53cf   ; canal 8
	bit 7,(ix+02bh)		;53d3   ; mira el bit 7 de las marcas del volumen (bit 7: la onda a cargar)
	jp z,onda_canal_10		;53d7   ; onda_canal_10: fuera el bit 4
	res 7,(ix+02bh)		;53da
	ld l,(ix+01bh)		;53de
	ld h,(ix+01ch)		;53e1
	ld de,09800h		;53e4
	call carga_onda		;53e7   ; carga_onda: las 32 muestras de HL a DE con los canales del SCC apagados mientras, y el banco 0x12 de vuelta
onda_canal_10:		; fuera el bit 4
	ld a,(0c68bh)		;53ea   ; lee las marcas de la mezcla (bit 0 en marcha, 1 acabada, 2 ida y vuelta, 3 tambien el canal 0x20, 5 sentido)
	res 4,a		;53ed
	ld (0c68bh),a		;53ef   ; guarda las marcas de la mezcla (bit 0 en marcha, 1 acabada, 2 ida y vuelta, 3 tambien el canal 0x20, 5 sentido)
	ld ix,0c500h		;53f2   ; canal 0x10
	bit 7,(ix+02bh)		;53f6   ; mira el bit 7 de las marcas del volumen (bit 7: la onda a cargar)
	jp z,onda_canal_20		;53fa   ; onda_canal_20: con el bit 3...
	res 7,(ix+02bh)		;53fd
	bit 0,a		;5401   ; con la mezcla...
	jp z,onda_propia		;5403   ; onda_propia:
	set 4,a		;5406   ; ...el bit 4 y 0xC663
	ld (0c68bh),a		;5408   ; guarda las marcas de la mezcla (bit 0 en marcha, 1 acabada, 2 ida y vuelta, 3 tambien el canal 0x20, 5 sentido)
	ld hl,0c663h		;540b   ; apunta a la onda del SCC que se mezcla (32 bytes; orden 0xF1)
	jp carga_onda_10		;540e   ; carga_onda_10: a 0x9820
onda_propia:
	ld l,(ix+01bh)		;5411
	ld h,(ix+01ch)		;5414
carga_onda_10:		; a 0x9820
	ld de,09820h		;5417
	call carga_onda		;541a   ; carga_onda: las 32 muestras de HL a DE con los canales del SCC apagados mientras, y el banco 0x12 de vuelta
onda_canal_20:		; con el bit 3...
	ld a,(0c68bh)		;541d   ; lee las marcas de la mezcla (bit 0 en marcha, 1 acabada, 2 ida y vuelta, 3 tambien el canal 0x20, 5 sentido)
	bit 3,a		;5420
	jp z,onda_propia_20		;5422   ; onda_propia_20: canal 0x20
	bit 4,a		;5425   ; ...y la mezcla cargada este cuadro...
	jp z,onda_canal_40		;5427   ; onda_canal_40: canal 0x40
	ld hl,0c663h		;542a   ; ...0xC663
	jp carga_onda_20		;542d   ; carga_onda_20: a 0x9840
onda_propia_20:		; canal 0x20
	ld ix,0c540h		;5430
	bit 7,(ix+02bh)		;5434   ; mira el bit 7 de las marcas del volumen (bit 7: la onda a cargar)
	jp z,onda_canal_40		;5438   ; onda_canal_40: canal 0x40
	res 7,(ix+02bh)		;543b
	ld l,(ix+01bh)		;543f
	ld h,(ix+01ch)		;5442
carga_onda_20:		; a 0x9840
	ld de,09840h		;5445
	call carga_onda		;5448   ; carga_onda: las 32 muestras de HL a DE con los canales del SCC apagados mientras, y el banco 0x12 de vuelta
onda_canal_40:		; canal 0x40
	ld ix,0c580h		;544b
	bit 7,(ix+02bh)		;544f   ; mira el bit 7 de las marcas del volumen (bit 7: la onda a cargar)
	ret z			;5453
	res 7,(ix+02bh)		;5454   ; pone a cero el bit 7 de las marcas del volumen (bit 7: la onda a cargar)
	ld l,(ix+01bh)		;5458   ; lee la forma de onda del SCC (puntero bajo)
	ld h,(ix+01ch)		;545b   ; lee la forma de onda del SCC (puntero alto)
	ld de,09860h		;545e   ; a 0x9860
carga_onda:		; las 32 muestras de HL a DE con los canales del SCC apagados mientras, y el banco 0x12 de vuelta
	ld a,03fh		;5461
	ld (09000h),a		;5463   ; 0x3F en 0x9000: los registros del SCC en 0x9800
	xor a			;5466   ; apagados
	ld (0988fh),a		;5467
	ld b,020h		;546a   ; 32 muestras
L_546C:
	ld a,(hl)			;546c
	ld (de),a			;546d
	inc hl			;546e
	inc de			;546f
	djnz L_546C		;5470
	ld a,(0c65ch)		;5472   ; encendidos de nuevo
	ld (0988fh),a		;5475
	ld a,012h		;5478
	ld (09000h),a		;547a   ; el mapper: pone en 0x8000 el banco de A
	ret			;547d
escribe_psg:		; escribe A en el registro del PSG (PR2 p13:73A6)
	out (0a0h),a		;547e   ; el registro
	ex af,af'			;5480
	ld a,e			;5481   ; el dato E
	out (0a1h),a		;5482   ; al PSG
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
