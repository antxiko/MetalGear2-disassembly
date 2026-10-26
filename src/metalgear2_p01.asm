; ==========================================================================
; METAL GEAR 2 SOLID SNAKE - Konami (1990) - MSX2 - MegaROM RC-767 de 512 KB (Konami SCC) - banco 01 (se ejecuta en 0x6000)
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
sprites_a_vram:	equ 0x068c8

; ----------------------------------------------------------------------
; Direcciones que solo aparecen como VALOR -en un `ld`, no en
; un salto-: son punteros que el codigo se pasa o numeros que
; casualmente coinciden con una direccion. No hay nada que
; trazar en ellas; el equ existe para que el listado ensamble.
; ----------------------------------------------------------------------
l7050h:	equ 0x07050

; ======================================================================
; CODIGO 0x6000..0x650c  (1292 bytes)
; ======================================================================


L_6000:
	and 080h		;6000   ; el bit de expandido...
	or c			;6002   ; ...con el slot primario
	ld c,a			;6003
	inc hl			;6004
	inc hl			;6005
	inc hl			;6006
	inc hl			;6007
	ld a,(hl)			;6008   ; el subslot de la pagina 1 (bits 2-3)
	and 00ch		;6009
	or c			;600b
	ld h,080h		;600c   ; en la pagina 2 (0x8000)
	jp 00024h		;600e   ; BIOS ENASLT - Switches to specified slot and page definitively
slot_del_cartucho_a_c399:		; 0xC399 = el slot del cartucho (el de la pagina 1), con su subslot
	call 00138h		;6011   ; BIOS RSLREG - Reads the primary slot register
	rrca			;6014   ; el slot primario de la pagina 1
	rrca			;6015
	and 003h		;6016
	ld c,a			;6018
	ld b,000h		;6019
	ld hl,0fcc1h		;601b   ; expandido? (EXPTBL)
	add hl,bc			;601e
	or (hl)			;601f
	ld c,a			;6020
	inc hl			;6021
	inc hl			;6022
	inc hl			;6023
	inc hl			;6024
	ld a,(hl)			;6025   ; su subslot (SLTTBL)
	and 00ch		;6026
	or c			;6028
	ld (0c399h),a		;6029   ; el slot entero para ENASLT
	ret			;602c
guarda_ram_del_disco:		; con disquetera: el gancho de errores del disco y la RAM de 0xDD00 guardada en 0x9600 de la RAM de 0x8000
	ld hl,0ad5ah		;602d
	ld (0f323h),hl		;6030   ; DISKVE (0xF323): los errores del disco a 0xAD5A
	ld a,(0c386h)		;6033   ; la RAM en 0x8000
	ld h,080h		;6036
	call 00024h		;6038   ; BIOS ENASLT - Switches to specified slot and page definitively
	di			;603b
	ld a,(0c38ah)		;603c   ; con Game Master 2, 0x300 bytes...
	inc a			;603f
	ld bc,002ffh		;6040
	jr nz,L_6048		;6043
	ld bc,01680h		;6045   ; ...sin el, 0x1681
L_6048:
	ld hl,0dd00h		;6048   ; de 0xDD00...
	ld de,09600h		;604b   ; ...a 0x9600
	ldir		;604e
	ld a,(0c388h)		;6050   ; los slots de antes
	jp 0013bh		;6053   ; BIOS WSLREG - Writes value to the primary slot register
borra_la_partida:		; 0xCA40-0xF0FF a cero y las barras llenas
	ld hl,0ca40h		;6056
	ld bc,026bfh		;6059
	call 04236h		;605c   ; borra_bloque: pone a cero BC + 1 bytes desde HL
barras_llenas:		; 0x20 en las tres barras: la de vida, la de la derecha y la de 0xCA54
	ld a,020h		;605f
	ld hl,0ca52h		;6061   ; apunta a el ancho de la barra de vida (lo maximo)
	ld (hl),a			;6064   ; lo maximo...
	inc l			;6065
	ld (hl),a			;6066   ; ...y lo que hay
	ld hl,0cac4h		;6067   ; apunta a lo largo de la barra de la derecha llena
	ld (hl),a			;606a
	inc l			;606b
	ld (hl),a			;606c
	ld hl,0ca54h		;606d   ; apunta a el ancho de la tercera barra (lo maximo)
	ld (hl),a			;6070
	inc l			;6071
	ld (hl),a			;6072
	ret			;6073
borra_marcador_abajo:		; en la pagina de dibujar
	ld a,(0ca42h)		;6074   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
borra_marcador_abajo_en:		; la franja de abajo (X = 0, Y = 0xC0, 0xE0 x 0x14) a 0 en la pagina A
	ld d,a			;6077
	xor a			;6078
	ld hl,000c0h		;6079
	ld bc,0e014h		;607c
	jp 046ffh		;607f   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
busca_conversacion:		; la conversacion A de la tabla del banco 48 (p48:8000)
	ld hl,08000h		;6082   ; la cabecera del banco 48...
	call 043fch		;6085   ; lee_palabra: HL = la palabra que hay en HL
	call 043f6h		;6088   ; ...la conversacion A
recorre_conversacion:		; busca la primera ficha que se cumple y hace su accion
	ld a,(hl)			;608b   ; la ficha; 0xFF acaba
	cp 0ffh		;608c
	ret z			;608e
	cp 0feh		;608f   ; 0xFE: una ficha vacia de 5 bytes
	jr nz,L_609A		;6091
	inc hl			;6093
	inc hl			;6094
	inc hl			;6095
	inc hl			;6096
	inc hl			;6097
	jr recorre_conversacion		;6098
L_609A:
	call mira_ficha		;609a   ; se cumple?
	ld a,(0ca9ch)		;609d   ; lee 1 si una conversacion ha encontrado su ficha
	or a			;60a0
	jr z,recorre_conversacion		;60a1   ; no: la siguiente
hace_accion:		; accion 0: un mensaje; 1: uno al azar (p01:6142); otra: nada
	ld a,(hl)			;60a3   ; el numero de la accion
	inc hl			;60a4
	ld (0d7b9h),hl		;60a5   ; guarda por donde va la conversacion (16 bits)
	or a			;60a8
	jr z,accion_mensaje		;60a9   ; 0: un mensaje
	dec a			;60ab
	jp z,mensaje_al_azar		;60ac   ; 1: uno al azar
	xor a			;60af   ; las demas: no se ha encontrado nada
	ld (0ca9ch),a		;60b0   ; guarda 1 si una conversacion ha encontrado su ficha
	ret			;60b3
accion_mensaje:		; el mensaje de la accion a 0xD7B7 (0 = ninguno)
	ld a,(hl)			;60b4   ; el mensaje...
	inc hl			;60b5
	ld h,(hl)			;60b6
	ld l,a			;60b7
	or h			;60b8   ; ...0: ninguno
	jr z,L_60BF		;60b9
	ld (0d7b7h),hl		;60bb   ; guarda el mensaje que toca (16 bits)
	ret			;60be
L_60BF:
	xor a			;60bf
	ld (0ca9ch),a		;60c0   ; guarda 1 si una conversacion ha encontrado su ficha
	ret			;60c3
mira_ficha:		; si se cumplen las condiciones de la ficha y, con el bit 7, la zona y la sala
	push hl			;60c4
	call mira_condiciones		;60c5   ; las condiciones (acarreo si se cumplen)
	pop de			;60c8
	ld a,(de)			;60c9   ; la cabeza de la ficha
	bit 7,a		;60ca   ; el bit 7: tambien la zona y la sala
	jr z,L_60F8		;60cc
	ld d,h			;60ce
	ld e,l			;60cf
	jr nc,L_60F1		;60d0
	ld a,(hl)			;60d2   ; la zona (0x14 o mas: una sala especial)
	cp 014h		;60d3
	jr nc,L_60E7		;60d5
	ld a,(0ca4ah)		;60d7   ; es esta zona...
	cp (hl)			;60da
	jr nz,L_60F1		;60db
	inc hl			;60dd
	ld a,(0ca4bh)		;60de   ; ...y esta sala?
	cp (hl)			;60e1
	jr nz,L_60F1		;60e2
	inc hl			;60e4
	jr L_60FE		;60e5
L_60E7:
	inc hl			;60e7
	ld a,(0ca76h)		;60e8   ; la sala especial
	cp (hl)			;60eb
	jr nz,L_60F1		;60ec
	inc hl			;60ee
	jr L_60FE		;60ef
L_60F1:
	inc de			;60f1   ; no se cumple: detras de la ficha
	inc de			;60f2
	inc de			;60f3
	inc de			;60f4
	inc de			;60f5
	ex de,hl			;60f6
	ret			;60f7
L_60F8:
	jr c,L_60FE		;60f8   ; sin el bit 7, se cumple con las condiciones
	inc hl			;60fa   ; si no, la siguiente
	inc hl			;60fb
	inc hl			;60fc
	ret			;60fd
L_60FE:
	ld a,001h		;60fe   ; se cumple
	ld (0ca9ch),a		;6100   ; guarda 1 si una conversacion ha encontrado su ficha
	ret			;6103
mira_condiciones:		; las n condiciones de la ficha (bits 0-3 de la cabeza; bit 4: todas o ninguna)
	ld a,(hl)			;6104
	and 00fh		;6105   ; B = cuantas condiciones
	ld b,a			;6107
	ld a,(hl)			;6108
	inc hl			;6109
	bit 4,a		;610a   ; bit 4: tienen que estar todas
	jr nz,L_6124		;610c
	ld a,b			;610e   ; ninguna: se cumple
	or a			;610f
	jr nz,L_6114		;6110
	scf			;6112
	ret			;6113
L_6114:
	ld a,(hl)			;6114   ; vale una que este
	call mira_condicion		;6115   ; esta? (p03:B0F6)
	jr z,L_611F		;6118
	inc hl			;611a   ; no: la siguiente
	djnz L_6114		;611b
	scf			;611d   ; ninguna esta: se cumple
	ret			;611e
L_611F:
	inc hl			;611f   ; salta las que quedan
	djnz L_611F		;6120
	and a			;6122   ; no se cumple
	ret			;6123
L_6124:
	ld a,(hl)			;6124   ; todas
	call mira_condicion		;6125   ; mira_condicion: la condicion A (p03:B0F6), con los bancos 48-49 a la vuelta
	jr nz,L_612F		;6128   ; una no esta: no se cumple
	inc hl			;612a
	djnz L_6124		;612b
	and a			;612d   ; todas estan: no se cumple
	ret			;612e
L_612F:
	inc hl			;612f   ; salta las que quedan...
	djnz L_611F		;6130
	scf			;6132   ; ...y se cumple
	ret			;6133
mira_condicion:		; la condicion A (p03:B0F6), con los bancos 48-49 a la vuelta
	push bc			;6134
	push hl			;6135
	call 040f0h		;6136   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b0f6h		;6139   ; mira_bandera: NZ si la bandera A de 0xD7D0 esta puesta
	call 0411dh		;613c   ; bancos_48_49: pone el 48 en 0x8000, el 49 en 0xA000 (con su copia en 0xC381-0xC383)
	pop hl			;613f
	pop bc			;6140
	ret			;6141
mensaje_al_azar:		; [n], n mensajes y n umbrales: elige uno con p01:6172
	ld a,(hl)			;6142   ; la lista...
	inc hl			;6143
	ld h,(hl)			;6144
	ld l,a			;6145
	ld a,(hl)			;6146   ; ...n
	push af			;6147
	inc hl			;6148
	ld e,l			;6149   ; DE = los mensajes
	ld d,h			;614a
	add a,a			;614b   ; HL = los umbrales, detras de los n mensajes
	ld c,a			;614c
	ld b,000h		;614d
	add hl,bc			;614f
	pop bc			;6150
	push bc			;6151
	call azar_100		;6152   ; A = de 0 a 99
	pop bc			;6155
	ld c,b			;6156
L_6157:
	dec b			;6157   ; el primer umbral por encima de A...
	cp (hl)			;6158
	jr c,L_6166		;6159
	inc hl			;615b
	ld (0d8e5h),a		;615c   ; ...si no, el siguiente
	ld a,b			;615f
	or a			;6160
	ld a,(0d8e5h)		;6161
	jr nz,L_6157		;6164
L_6166:
	ld a,c			;6166   ; el numero del mensaje...
	sub b			;6167
	dec a			;6168
	add a,a			;6169   ; ...dos bytes cada uno
	ld h,d			;616a
	ld l,e			;616b
	call 0423eh		;616c   ; suma_a_hl: HL = HL + A
	jp accion_mensaje		;616f   ; y se pone
azar_100:		; un numero al azar de 0 a 99 (R y 0xCA03)
	ld a,r		;6172   ; el registro de refresco...
	ld c,a			;6174
	ld a,(0ca03h)		;6175   ; ...con el contador de cuadros
	xor c			;6178
	rlca			;6179   ; * 8...
	rlca			;617a
	rlca			;617b
	cp 064h		;617c   ; ...y por debajo de 100
	ret c			;617e
	sub 064h		;617f
	ret			;6181
siguiente_accion:		; la accion que sigue en la conversacion (0xFE [espera]...) o acaba
	ld hl,(0d7b9h)		;6182   ; lee por donde va la conversacion (16 bits)
	call 0411dh		;6185   ; bancos_48_49: pone el 48 en 0x8000, el 49 en 0xA000 (con su copia en 0xC381-0xC383)
	call hay_mas_acciones		;6188   ; hay otra accion detras?
	call 041c2h		;618b   ; bancos_1_2_9: pone el 1 en 0x6000, el 2 en 0x8000, el 9 en 0xA000 (con su copia en 0xC381-0xC383)
	jr nc,L_61A1		;618e   ; no: p09:BA96 y se acabo
	call 0411dh		;6190   ; bancos_48_49: pone el 48 en 0x8000, el 49 en 0xA000 (con su copia en 0xC381-0xC383)
	ld a,(hl)			;6193   ; la espera antes de la accion
	ld (0d7b6h),a		;6194   ; guarda la espera antes de la siguiente accion de la conversacion
	inc hl			;6197
	call hace_accion		;6198   ; la accion
	call 041c2h		;619b   ; bancos_1_2_9: pone el 1 en 0x6000, el 2 en 0x8000, el 9 en 0xA000 (con su copia en 0xC381-0xC383)
	jp 0ba96h		;619e   ; p09:BA96
L_61A1:
	call 0ba96h		;61a1   ; p09:BA96...
	inc (hl)			;61a4   ; ...y uno mas en lo que devuelve
	ret			;61a5
hay_mas_acciones:		; acarreo si detras de la accion hay 0xFE (otra)
	inc hl			;61a6   ; detras de los dos bytes del mensaje
	inc hl			;61a7
	ld a,(hl)			;61a8
	cp 0ffh		;61a9   ; 0xFF: se acabo
	jr z,L_61B4		;61ab
	cp 0feh		;61ad   ; 0xFE: otra accion
	jr nz,L_61B4		;61af
	inc hl			;61b1
	scf			;61b2
	ret			;61b3
L_61B4:
	and a			;61b4
	ret			;61b5
bancos_de_mensajes:		; los bancos 48-49, o 50-51 con 0xCA97
	ld a,(0ca97h)		;61b6   ; lee 1 si los mensajes salen de los bancos 50-51 y no de 48-49
	or a			;61b9
	jp z,0411dh		;61ba   ; bancos_48_49: pone el 48 en 0x8000, el 49 en 0xA000 (con su copia en 0xC381-0xC383)
	jp 04122h		;61bd   ; bancos_50_51: pone el 50 en 0x8000, el 51 en 0xA000 (con su copia en 0xC381-0xC383)
mensaje_de_50_con_ventana:		; p01:61CE y los bancos 4, 5 y 14
	call mensaje_de_50		;61c0   ; mensaje_de_50: 0xD8A8 = 1: la ventana estrecha
L_61C3:
	call 04142h		;61c3   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	jp 041efh		;61c6   ; bancos_14: pone el 14 en 0xA000 (con su copia en 0xC381-0xC383)
mensaje_de_50_bancos_14:		; p01:61DC y los bancos 4, 5 y 14
	call mensaje_d_de_50		;61c9   ; mensaje_d_de_50: el mensaje D de la tabla de la cabecera del banco 50 en su ventana
	jr L_61C3		;61cc
mensaje_de_50:		; 0xD8A8 = 1: la ventana estrecha
	ld a,001h		;61ce
	ld (0d8a8h),a		;61d0   ; guarda 1: la ventana del mensaje es estrecha (0xB8 x 0x28)
mensaje_de_50_en:		; p03:B612 con DE
	ex de,hl			;61d3
	push hl			;61d4
	call 040f0h		;61d5   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b612h		;61d8   ; guarda_lo_de_la_ventana: 0xCAA1-0xCAA2 = (Y, X = 4) y guarda lo que tapa la ventana en Y = 0xD8 de la misma pagina
	pop de			;61db
mensaje_d_de_50:		; el mensaje D de la tabla de la cabecera del banco 50 en su ventana
	call 04122h		;61dc   ; bancos_50_51: pone el 50 en 0x8000, el 51 en 0xA000 (con su copia en 0xC381-0xC383)
	ld a,d			;61df
	ld hl,08000h		;61e0   ; cabecera_50: 38 punteros del banco 50
	call 043fch		;61e3   ; la tabla...
	call 043f6h		;61e6   ; ...el mensaje D
	call mensaje_con_ventana		;61e9   ; con su ventana (p01:6504)
	call 0413fh		;61ec   ; bancos_1_4_5: pone el 1 en 0x6000, el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	ld a,(ix+000h)		;61ef   ; si la ficha IX es del tipo 2...
	cp 002h		;61f2
	ret nz			;61f4
	jp 041cdh		;61f5   ; ...el banco 10
mensaje_cada_cuadro_bancos_14:
	call mensaje_cada_cuadro_bancos_5		;61f8   ; mensaje_cada_cuadro_bancos_5:
	jp 041efh		;61fb   ; bancos_14: pone el 14 en 0xA000 (con su copia en 0xC381-0xC383)
mensaje_cada_cuadro_bancos_10:
	call mensaje_cada_cuadro		;61fe   ; mensaje_cada_cuadro: el paso 0xE221 del mensaje en curso (p01:6597)
	ld a,(0e220h)		;6201   ; Z si ya no hay mensaje
	and a			;6204
	call 0413fh		;6205   ; bancos_1_4_5: pone el 1 en 0x6000, el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	jp 041cdh		;6208   ; bancos_10: pone el 10 en 0xA000 (con su copia en 0xC381-0xC383)
mensaje_cada_cuadro_bancos_8:
	call mensaje_cada_cuadro_bancos_5		;620b   ; mensaje_cada_cuadro_bancos_5:
	jp 041bdh		;620e   ; bancos_8: pone el 8 en 0xA000 (con su copia en 0xC381-0xC383)
mensaje_de_ix:		; el mensaje de la ficha IX (del banco 50) arriba o abajo segun Snake
	ld a,001h		;6211
	ld (0d8a8h),a		;6213   ; guarda 1: la ventana del mensaje es estrecha (0xB8 x 0x28)
	ld a,(0cb03h)		;6216   ; Snake abajo (Y >= 0x60): la ventana arriba (L = 0x10)...
	cp 060h		;6219
	ld l,010h		;621b
	jr nc,L_6221		;621d
	ld l,090h		;621f   ; ...arriba: abajo (L = 0x90)
L_6221:
	call 040f0h		;6221   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	push hl			;6224
	call 0b612h		;6225   ; p03:B612
	pop de			;6228
	call 04122h		;6229   ; bancos_50_51: pone el 50 en 0x8000, el 51 en 0xA000 (con su copia en 0xC381-0xC383)
	ld a,(ix+000h)		;622c   ; la ficha del tipo 0x16 dice el mensaje 0x0F...
	cp 016h		;622f
	ld a,(ix+011h)		;6231   ; ...las demas, su byte 0x11
	jr nz,L_6238		;6234
	ld a,00fh		;6236
L_6238:
	ld hl,08002h		;6238   ; la tabla de p50:8002...
	call 043fch		;623b   ; lee_palabra: HL = la palabra que hay en HL
	call 043f6h		;623e   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	call mensaje_con_ventana		;6241   ; ...con su ventana
	jp 041b5h		;6244   ; bancos_1_4_8: pone el 1 en 0x6000, el 4 en 0x8000, el 8 en 0xA000 (con su copia en 0xC381-0xC383)
mensaje_cada_cuadro_bancos_5:
	call mensaje_cada_cuadro		;6247   ; mensaje_cada_cuadro: el paso 0xE221 del mensaje en curso (p01:6597)
	ld a,(0e220h)		;624a   ; lee la velocidad del mensaje en curso (0 = ninguno; 1-3, 4 sin espera)
	and a			;624d
	jr L_6275		;624e
conversacion_de_a:		; la conversacion de p48:8010 (A = 0), p48:8012 (1) o p48:8014 (2)
	cp 001h		;6250   ; 0: la de p48:8010
	ld hl,08010h		;6252   ; 1: la de p48:8012
	jr c,L_625F		;6255
	ld hl,08012h		;6257   ; 2: la de p48:8014
	jr z,L_625F		;625a
	ld hl,08014h		;625c
L_625F:
	call 0411dh		;625f   ; bancos_48_49: pone el 48 en 0x8000, el 49 en 0xA000 (con su copia en 0xC381-0xC383)
	call 043fch		;6262   ; la lista...
	call conversacion_de_hl		;6265   ; ...su accion
	ld a,001h		;6268   ; 0xD7BB = 1
	ld (0d7bbh),a		;626a
	call 08b1fh		;626d   ; p09:B68E
	ld a,004h		;6270   ; el paso 4 del estado de la partida
	ld (0ca01h),a		;6272   ; guarda el paso del estado de la partida
L_6275:
	jp 0413fh		;6275   ; bancos_1_4_5: pone el 1 en 0x6000, el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
sube_de_nivel:		; 0xCAB5 uno mas y la barra de vida 8 puntos mas larga
	ld hl,0cab5h		;6278   ; apunta a el nivel de Snake: la barra de vida llena mide 0x20 + 8 por nivel
	inc (hl)			;627b
	ld hl,0ca52h		;627c   ; lo maximo de la vida...
	ld a,(hl)			;627f
	add a,008h		;6280   ; ...8 mas
	ld (hl),a			;6282
	ld hl,010c8h		;6283   ; la franja de la barra (X = 0x10, Y = 0xC8, 0x6F x 8) a 0
	ld bc,06f08h		;6286
	ld a,(0ca42h)		;6289   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	ld d,a			;628c
	xor a			;628d
	call 046ffh		;628e   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
	call 04288h		;6291   ; la barra...
	call 042bch		;6294   ; ...y su marco
	jr L_6275		;6297
copia_al_mapa_70:		; p01:62B5 sumando 0x70 a cada caracter
	ld hl,0d8e1h		;6299
	ld (hl),070h		;629c
	ld a,001h		;629e
	ld (0d8e2h),a		;62a0   ; guarda de paso (en p01:62B5: 0 copia con ldir, 1 caracter a caracter)
	jr copia_al_mapa		;62a3
copia_al_mapa_0:		; p01:62B5 caracter a caracter, sin sumar
	ld hl,0d8e1h		;62a5
	ld (hl),000h		;62a8
	ld a,001h		;62aa
	ld (0d8e2h),a		;62ac   ; guarda de paso (en p01:62B5: 0 copia con ldir, 1 caracter a caracter)
	jr copia_al_mapa		;62af
copia_al_mapa_ldir:		; p01:62B5 con ldir
	xor a			;62b1
	ld (0d8e2h),a		;62b2   ; guarda de paso (en p01:62B5: 0 copia con ldir, 1 caracter a caracter)
copia_al_mapa:		; B filas de C caracteres de HL al mapa de 0xDD00 en (D, E) puntos
	ld a,d			;62b5
	call entre_8		;62b6   ; la columna (X / 8)
	ld d,a			;62b9
	ld a,e			;62ba
	call entre_8		;62bb   ; la fila (Y / 8)
	push hl			;62be
	push de			;62bf
	push bc			;62c0
	ld hl,00000h		;62c1
	ld b,a			;62c4   ; la fila * 24
	or a			;62c5
	jr z,L_62CE		;62c6
	ld de,00018h		;62c8
L_62CB:
	add hl,de			;62cb
	djnz L_62CB		;62cc
L_62CE:
	pop bc			;62ce
	pop de			;62cf
	ld e,d			;62d0   ; mas la columna
	ld d,000h		;62d1
	add hl,de			;62d3
	ld de,0dd00h		;62d4   ; en el mapa
	add hl,de			;62d7
	ld d,h			;62d8
	ld e,l			;62d9
	pop hl			;62da
L_62DB:
	push bc			;62db
	push de			;62dc
	call copia_fila_al_mapa		;62dd   ; una fila
	pop de			;62e0
	pop bc			;62e1
	ld a,018h		;62e2   ; la siguiente del mapa
	call 04243h		;62e4   ; suma_a_de: DE = DE + A
	djnz L_62DB		;62e7
	ret			;62e9
entre_8:		; A = A / 8
	rra			;62ea
	rra			;62eb
	rra			;62ec
	and 01fh		;62ed
	ret			;62ef
copia_fila_al_mapa:		; con 0xD8E2 = 0, ldir
	ld a,(0d8e2h)		;62f0   ; lee de paso (en p01:62B5: 0 copia con ldir, 1 caracter a caracter)
	or a			;62f3
	jr nz,L_62FB		;62f4
	ld b,000h		;62f6
	ldir		;62f8
	ret			;62fa
L_62FB:
	ld a,(hl)			;62fb   ; si no, caracter a caracter
	ld (de),a			;62fc
	inc de			;62fd
	dec c			;62fe
	jr nz,L_62FB		;62ff
	ret			;6301
rectangulo_de_44:		; la ficha A de la tabla de HL en el banco 44-45: [dy][dx][filas][columnas][caracteres]
	call 0416ch		;6302   ; bancos_44_45: pone el 44 en 0x8000, el 45 en 0xA000 (con su copia en 0xC381-0xC383)
	call 043f6h		;6305   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld a,(hl)			;6308   ; la Y + dy
	add a,e			;6309
	ld e,a			;630a
	inc hl			;630b
	ld a,(hl)			;630c   ; la X + dx
	add a,d			;630d
	ld d,a			;630e
	inc hl			;630f
	ld b,(hl)			;6310   ; B = las filas, C = las columnas
	inc hl			;6311
	ld c,(hl)			;6312
	inc hl			;6313
	ld a,(hl)			;6314   ; HL = los caracteres
	inc hl			;6315
	ld h,(hl)			;6316
	ld l,a			;6317
	jr L_633D		;6318
rotulo_de_50:		; los rotulos de p50:8006 y el A de p50:800A, arriba o abajo
	push af			;631a
	call 04122h		;631b   ; bancos_50_51: pone el 50 en 0x8000, el 51 en 0xA000 (con su copia en 0xC381-0xC383)
	call sitio_del_rotulo		;631e   ; sitio_del_rotulo: DE = (0x38, 0x18) con Snake abajo; (0x38, 0xA8) con Snake arriba
	ld hl,08006h		;6321   ; el de p50:8006...
	call 043fch		;6324   ; lee_palabra: HL = la palabra que hay en HL
	push de			;6327
	call 04950h		;6328   ; ...en DE
	pop de			;632b
	ld a,e			;632c   ; una linea mas arriba...
	sub 008h		;632d
	ld e,a			;632f
	pop af			;6330
	ld hl,0800ah		;6331   ; ...el A de la tabla de p50:800A
	call 043fch		;6334   ; lee_palabra: HL = la palabra que hay en HL
	call 043f6h		;6337   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	call 04950h		;633a   ; letrero: pinta las letras de HL en DE hasta 0xFF (0xFE salta de linea)
L_633D:
	jp 040f0h		;633d   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
sitio_del_rotulo:		; DE = (0x38, 0x18) con Snake abajo; (0x38, 0xA8) con Snake arriba
	ld de,03818h		;6340
	ld a,(0cb03h)		;6343   ; lee la Y de Snake
	cp 070h		;6346
	ret nc			;6348
	ld e,0a8h		;6349
	ret			;634b
rotulo_8008:		; el rotulo de p50:8008 una linea por encima
	call 04122h		;634c   ; bancos_50_51: pone el 50 en 0x8000, el 51 en 0xA000 (con su copia en 0xC381-0xC383)
	call sitio_del_rotulo		;634f   ; sitio_del_rotulo: DE = (0x38, 0x18) con Snake abajo; (0x38, 0xA8) con Snake arriba
	ld a,e			;6352
	sub 008h		;6353
	ld e,a			;6355
	ld hl,08008h		;6356
	call 043fch		;6359   ; lee_palabra: HL = la palabra que hay en HL
	call 04950h		;635c   ; letrero: pinta las letras de HL en DE hasta 0xFF (0xFE salta de linea)
	jr L_633D		;635f
conversacion_800e:		; la conversacion de p48:800E
	call 0411dh		;6361   ; bancos_48_49: pone el 48 en 0x8000, el 49 en 0xA000 (con su copia en 0xC381-0xC383)
	ld hl,0800eh		;6364
	call 043fch		;6367   ; lee_palabra: HL = la palabra que hay en HL
	call 040f0h		;636a   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
conversacion_de_hl:		; la conversacion de HL (banco 48)
	xor a			;636d
	ld (0ca9ch),a		;636e   ; guarda 1 si una conversacion ha encontrado su ficha
	call 0411dh		;6371   ; bancos_48_49: pone el 48 en 0x8000, el 49 en 0xA000 (con su copia en 0xC381-0xC383)
	call recorre_conversacion		;6374   ; recorre_conversacion: busca la primera ficha que se cumple y hace su accion
	jr L_633D		;6377
bancos_de_mensajes_b:		; los bancos 48-49, o 50-51 con 0xCA97
	ld a,(0ca97h)		;6379   ; lee 1 si los mensajes salen de los bancos 50-51 y no de 48-49
	or a			;637c
	jp z,0411dh		;637d   ; bancos_48_49: pone el 48 en 0x8000, el 49 en 0xA000 (con su copia en 0xC381-0xC383)
	jp 04122h		;6380   ; bancos_50_51: pone el 50 en 0x8000, el 51 en 0xA000 (con su copia en 0xC381-0xC383)
numero_de_conversacion:		; A = el numero de la conversacion BC en la lista de p48:800C (acarreo si esta)
	call 0411dh		;6383   ; bancos_48_49: pone el 48 en 0x8000, el 49 en 0xA000 (con su copia en 0xC381-0xC383)
	push hl			;6386
	pop bc			;6387
	exx			;6388
	ld b,000h		;6389   ; desde 0
	exx			;638b
	ld hl,0800ch		;638c
	call 043fch		;638f   ; lee_palabra: HL = la palabra que hay en HL
L_6392:
	ld e,(hl)			;6392   ; la palabra de la lista...
	inc hl			;6393
	ld d,(hl)			;6394
	ld a,c			;6395   ; ...es BC?
	cp e			;6396
	jr nz,L_63A3		;6397
	ld a,b			;6399
	cp d			;639a
	jr nz,L_63A3		;639b
	exx			;639d   ; si: A = su numero
	ld a,b			;639e
	exx			;639f
	scf			;63a0
	jr L_63C6		;63a1
L_63A3:
	inc hl			;63a3   ; la siguiente...
	exx			;63a4
	inc b			;63a5
	ld a,b			;63a6
	exx			;63a7
	cp 024h		;63a8   ; ...hasta 0x24
	jr nz,L_6392		;63aa
	and a			;63ac
	jr L_63C6		;63ad
byte_del_mensaje:		; A = el byte siguiente de HL en el banco de los mensajes
	call bancos_de_mensajes_b		;63af   ; bancos_de_mensajes_b: los bancos 48-49, o 50-51 con 0xCA97
	inc hl			;63b2
	ld a,(hl)			;63b3
	jr L_63C6		;63b4
byte_del_mensaje_d7b7:		; A = el segundo byte del mensaje que toca
	call bancos_de_mensajes		;63b6   ; bancos_de_mensajes: los bancos 48-49, o 50-51 con 0xCA97
	ld hl,(0d7b7h)		;63b9   ; lee el mensaje que toca (16 bits)
	inc hl			;63bc
	ld a,(hl)			;63bd
	jr L_63C6		;63be
conversacion_a:		; la conversacion A del banco 48
	call 0411dh		;63c0   ; bancos_48_49: pone el 48 en 0x8000, el 49 en 0xA000 (con su copia en 0xC381-0xC383)
	call busca_conversacion		;63c3   ; busca_conversacion: la conversacion A de la tabla del banco 48 (p48:8000)
L_63C6:
	jp 041c2h		;63c6   ; bancos_1_2_9: pone el 1 en 0x6000, el 2 en 0x8000, el 9 en 0xA000 (con su copia en 0xC381-0xC383)
conversacion_8008:
	ld hl,08008h		;63c9
	jr conversacion_de_cabecera		;63cc
conversacion_8004:
	ld hl,08004h		;63ce
	jr conversacion_de_cabecera		;63d1
conversacion_8006:
	ld hl,08006h		;63d3
	jr conversacion_de_cabecera		;63d6
conversacion_800a:
	ld hl,0800ah		;63d8
	jr conversacion_de_cabecera		;63db
conversacion_8002:
	ld hl,08002h		;63dd
conversacion_de_cabecera:		; la conversacion de la palabra HL de la cabecera del banco 48
	call 0411dh		;63e0   ; bancos_48_49: pone el 48 en 0x8000, el 49 en 0xA000 (con su copia en 0xC381-0xC383)
	call 043fch		;63e3   ; lee_palabra: HL = la palabra que hay en HL
	call conversacion_de_hl		;63e6   ; conversacion_de_hl: la conversacion de HL (banco 48)
	jr L_63C6		;63e9
borra_cc00_d760:		; 0xCC80-0xCCFF, 0xCC00-0xCC7F y 0xD760-0xD76F a cero
	ld hl,0cc80h		;63eb   ; apunta a 16 fichas de 8 bytes que mueve p11:B66E
	ld bc,0007fh		;63ee
	call 04236h		;63f1   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	ld hl,0cc00h		;63f4   ; apunta a 8 fichas de 16 bytes que mueve p11:B494
	ld bc,0007fh		;63f7
	call 04236h		;63fa   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	ld hl,0d760h		;63fd
	ld bc,0000fh		;6400
	jp 04236h		;6403   ; borra_bloque: pone a cero BC + 1 bytes desde HL
de_ix_mas_6:		; DE = IX + 6
	push ix		;6406
	pop de			;6408
	ld a,006h		;6409
	jp 04243h		;640b   ; suma_a_de: DE = DE + A
conversacion_8008_b:		; la conversacion de p48:8008, 0xD7BB = 1, p09:B68E y el paso 4
	call 041c2h		;640e   ; bancos_1_2_9: pone el 1 en 0x6000, el 2 en 0x8000, el 9 en 0xA000 (con su copia en 0xC381-0xC383)
	call conversacion_8008		;6411   ; conversacion_8008:
	ld a,001h		;6414
	ld (0d7bbh),a		;6416
	call 0b68eh		;6419
	ld a,004h		;641c
	ld (0ca01h),a		;641e   ; guarda el paso del estado de la partida
L_6421:
	jp 041d2h		;6421   ; bancos_1_2_11: pone el 1 en 0x6000, el 2 en 0x8000, el 11 en 0xA000 (con su copia en 0xC381-0xC383)
a_p07_bb10:		; p07:BB10 con el banco 7 en 0xA000
	call 041adh		;6424   ; bancos_1_2_7: pone el 1 en 0x6000, el 2 en 0x8000, el 7 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0bb10h		;6427
	jr L_6421		;642a
vida_que_se_va:		; con 0xCB4B (y sin 0xCB3C), la vida baja un punto cada 16 cuadros (0xCB4E)
	ld a,(0cb4bh)		;642c   ; lee con el puesto, la vida baja un punto cada 16 cuadros
	or a			;642f
	ret z			;6430
	ld a,(0cb3ch)		;6431
	or a			;6434
	ret nz			;6435
	ld hl,0cb4eh		;6436   ; la espera...
	dec (hl)			;6439
	ret nz			;643a
	ld (hl),010h		;643b   ; ...otra vez 16
	ld hl,0ca53h		;643d   ; un punto menos
	dec (hl)			;6440
	jr nz,L_645D		;6441
	ld hl,00140h		;6443   ; sin vida: 0xCB63 = 0x140...
	ld (0cb63h),hl		;6446   ; guarda una espera de 16 bits que baja en la interrupcion
	ld a,(0ca01h)		;6449   ; ...en el paso 0 del estado de la partida...
	or a			;644c
	jr nz,L_6459		;644d
	ld hl,0cb00h		;644f   ; ...el estado 0x1C...
	ld (hl),01ch		;6452
	call sonido_8d		;6454   ; ...y p01:6BA0
	jr L_645D		;6457
L_6459:
	xor a			;6459   ; en otro paso, 0xCA40 = 0
	ld (0ca40h),a		;645a
L_645D:
	jp 04288h		;645d   ; barras_de_vida: la barra de vida y, con 0xCA5F, p04:9889
mosaico_de_57:		; el mosaico de HL del banco 57-58 en X = 0, Y = 0xF0, 1 fila de 0x12, forma 0x0B
	call 0412ch		;6460   ; bancos_57_58: pone el 57 en 0x8000, el 58 en 0xA000 (con su copia en 0xC381-0xC383)
	ld de,000f0h		;6463
	ld bc,00112h		;6466
	call 05081h		;6469   ; mosaico_fb_b2: el mosaico de HL en (D, E), B filas de C caracteres, con la forma 11 de la franja 2 (p00:512C)
L_646C:
	jp 04176h		;646c   ; bancos_1_13_14: pone el 1 en 0x6000, el 13 en 0x8000, el 14 en 0xA000 (con su copia en 0xC381-0xC383)
byte_de_57:		; A = (HL) del banco 57-58
	call 0412ch		;646f   ; bancos_57_58: pone el 57 en 0x8000, el 58 en 0xA000 (con su copia en 0xC381-0xC383)
	ld a,(hl)			;6472
	cp 0ffh		;6473
	jr L_646C		;6475
mosaico_de_54:		; el mosaico de HL del banco 54 (2 filas de 1)
	ld bc,00201h		;6477
mosaico_de_54_bc:		; forma 0x0C en la franja 3
	call 04183h		;647a   ; bancos_54: pone el 54 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0507ah		;647d   ; mosaico_fc_b3: el mosaico de HL en (D, E), B filas de C caracteres, con la forma 12 de la franja 3 (p00:512C)
	jr L_646C		;6480
byte_de_54:		; A = (HL) del banco 54
	call 04183h		;6482   ; bancos_54: pone el 54 en 0xA000 (con su copia en 0xC381-0xC383)
	ld a,(hl)			;6485
	jr L_646C		;6486
vida_por_nivel:		; la barra de vida llena: 0x20 + 8 por cada nivel de 0xCAB5
	ld a,(0cab5h)		;6488   ; lee el nivel de Snake: la barra de vida llena mide 0x20 + 8 por nivel
	or a			;648b
	ret z			;648c
	ld b,a			;648d
	xor a			;648e
L_648F:
	add a,008h		;648f   ; 8 por nivel...
	djnz L_648F		;6491
	add a,020h		;6493   ; ...mas 0x20
	ld hl,0ca52h		;6495   ; apunta a el ancho de la barra de vida (lo maximo)
	ld (hl),a			;6498
	inc hl			;6499
	ld (hl),a			;649a
	ret			;649b
palabra_de_56:		; HL = la palabra A de la tabla de HL del banco 56
	call 0418eh		;649c   ; bancos_56: pone el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	call 043f6h		;649f   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	jp 041cah		;64a2   ; bancos_1_2_10: pone el 1 en 0x6000, el 2 en 0x8000, el 10 en 0xA000 (con su copia en 0xC381-0xC383)
palabra_8042_d706:		; HL = la palabra 0xD706 de la tabla de p50:8042
	call 04122h		;64a5   ; bancos_50_51: pone el 50 en 0x8000, el 51 en 0xA000 (con su copia en 0xC381-0xC383)
	ld hl,08042h		;64a8
	call 043fch		;64ab   ; lee_palabra: HL = la palabra que hay en HL
	ld a,(0d706h)		;64ae
	call 043f6h		;64b1   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	jp 04176h		;64b4   ; bancos_1_13_14: pone el 1 en 0x6000, el 13 en 0x8000, el 14 en 0xA000 (con su copia en 0xC381-0xC383)
letrero_de_50:		; el letrero con sitio de la palabra HL del banco 50
	call 04122h		;64b7   ; bancos_50_51: pone el 50 en 0x8000, el 51 en 0xA000 (con su copia en 0xC381-0xC383)
	call 043fch		;64ba   ; lee_palabra: HL = la palabra que hay en HL
	call 04918h		;64bd   ; letrero_con_sitio: [fila][columna] y letras; 0xFE otra posicion, 0xFF acaba
L_64C0:
	jp 041cah		;64c0   ; bancos_1_2_10: pone el 1 en 0x6000, el 2 en 0x8000, el 10 en 0xA000 (con su copia en 0xC381-0xC383)
letrero_a_de_50:		; el letrero A de la tabla de la palabra HL del banco 50, en (0x0C, 0x94)
	call 04122h		;64c3   ; bancos_50_51: pone el 50 en 0x8000, el 51 en 0xA000 (con su copia en 0xC381-0xC383)
	call 043fch		;64c6   ; lee_palabra: HL = la palabra que hay en HL
	call 043f6h		;64c9   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld de,00c94h		;64cc
	call 04950h		;64cf   ; letrero: pinta las letras de HL en DE hasta 0xFF (0xFE salta de linea)
	jr L_64C0		;64d2
a_p06_a543:		; p06:A543 con el banco 6 en 0xA000
	call 041a0h		;64d4   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a543h		;64d7   ; p06:A543
	jp 040f0h		;64da   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
mensaje_abajo:		; el mensaje de HL en (0x10, 0x98), 4 lineas
	ld de,01098h		;64dd
	ld b,004h		;64e0
	call empieza_mensaje		;64e2   ; empieza_mensaje: pone el mensaje de HL a escribirse letra a letra en DE
	jp 04179h		;64e5   ; bancos_13_14: pone el 13 en 0x8000, el 14 en 0xA000 (con su copia en 0xC381-0xC383)
mensaje_8016:		; el mensaje de p48:8016 abajo
	call 0411dh		;64e8   ; bancos_48_49: pone el 48 en 0x8000, el 49 en 0xA000 (con su copia en 0xC381-0xC383)
	ld hl,08016h		;64eb
	call 043fch		;64ee   ; lee_palabra: HL = la palabra que hay en HL
	call 041c2h		;64f1   ; bancos_1_2_9: pone el 1 en 0x6000, el 2 en 0x8000, el 9 en 0xA000 (con su copia en 0xC381-0xC383)
mensaje_abajo_bancos_9:
	ld de,01098h		;64f4
	ld b,004h		;64f7
	call empieza_mensaje		;64f9   ; empieza_mensaje: pone el mensaje de HL a escribirse letra a letra en DE
	jr L_6501		;64fc
mensaje_con_ventana_bancos_9:
	call mensaje_con_ventana		;64fe   ; mensaje_con_ventana: el mensaje de HL en su ventana, en la Y de 0xCAA1 + 4
L_6501:
	jp 041c5h		;6501   ; bancos_9: pone el 9 en 0xA000 (con su copia en 0xC381-0xC383)
mensaje_con_ventana:		; el mensaje de HL en su ventana, en la Y de 0xCAA1 + 4
	ld a,(0caa1h)		;6504   ; lee la Y y la X de la ventana del mensaje (16 bits)
	add a,004h		;6507
	ld e,a			;6509
	jr $+13		;650a   ; salta los datos de 0x650C

; ----------------------------------------------------------------------
; DATOS sin identificar  0x650c..0x6517  (11 bytes)
DATA_650C:
	defb 03ah,003h,0cbh,0feh,080h,01eh,020h,030h,002h,01eh,080h	; 650c  :..... 0...

; ======================================================================
; CODIGO 0x6517..0x6597  (128 bytes)
; ======================================================================


L_6517:
	ld d,008h		;6517   ; en X = 8, 4 lineas
	ld b,004h		;6519
	call empieza_mensaje		;651b   ; empieza_mensaje: pone el mensaje de HL a escribirse letra a letra en DE
	ld a,d			;651e   ; la ventana: 4 puntos mas arriba y a la izquierda
	sub 004h		;651f
	ld h,a			;6521
	ld a,e			;6522
	sub 004h		;6523
	ld l,a			;6525
	ld a,(0d8a8h)		;6526   ; con 0xD8A8, 0xB8 x 0x28...
	and a			;6529
	ld bc,0b828h		;652a
	jr nz,L_6531		;652d
	ld b,0e0h		;652f   ; ...sin el, 0xE0 x 0x28
L_6531:
	ld a,(0ca42h)		;6531   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	ld d,a			;6534
	ld a,099h		;6535   ; el fondo en el color 9
	push hl			;6537
	push bc			;6538
	call 046ffh		;6539   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
	pop de			;653c
	pop hl			;653d
	ld c,007h		;653e   ; y el marco en el color 7
	ld a,(0ca42h)		;6540   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	jp 046bch		;6543   ; marco: cuatro lineas: un marco de D x E desde HL
empieza_mensaje:		; pone el mensaje de HL a escribirse letra a letra en DE
	call bancos_del_mensaje		;6546   ; p01:666A
	call arranca_mensaje		;6549   ; arranca_mensaje: la velocidad (primer byte < 4), el puntero y la ventana del mensaje
	jp 040f0h		;654c   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
arranca_mensaje:		; la velocidad (primer byte < 4), el puntero y la ventana del mensaje
	ld a,(hl)			;654f   ; el primer byte...
	cp 004h		;6550   ; ...por debajo de 4 es la velocidad
	inc hl			;6552
	jr c,L_6558		;6553
	dec hl			;6555   ; si no, es ya el texto: la velocidad 4
	ld a,004h		;6556
L_6558:
	ld (0e220h),a		;6558   ; guarda la velocidad del mensaje en curso (0 = ninguno; 1-3, 4 sin espera)
	ld a,(hl)			;655b   ; el byte siguiente a 0xCAA3
	ld (0caa3h),a		;655c
	ld (0e225h),hl		;655f   ; el texto
	ld (0e229h),de		;6562   ; la ventana: el principio de la linea...
	ld (0e227h),de		;6566   ; ...y la primera letra
	ld a,b			;656a   ; B = las lineas
	ld (0e22bh),a		;656b   ; guarda las lineas de la ventana del mensaje
	xor a			;656e
	ld h,a			;656f
	ld l,a			;6570
	ld (0e223h),hl		;6571   ; desde la letra 0
	ld (0e221h),a		;6574   ; el paso 0
	ld (0e22dh),a		;6577   ; letra a letra
	inc a			;657a
	ld (0e222h),a		;657b   ; la primera, ya
	ret			;657e
mensaje_cada_cuadro_b_9:		; mensaje_cada_cuadro y deja el banco 9
	call mensaje_cada_cuadro		;657f   ; mensaje_cada_cuadro: el paso 0xE221 del mensaje en curso (p01:6597)
	jp 041c5h		;6582   ; bancos_9: pone el 9 en 0xA000 (con su copia en 0xC381-0xC383)
mensaje_cada_cuadro_b_13_14:		; mensaje_cada_cuadro y deja los bancos 13 y 14
	call mensaje_cada_cuadro		;6585   ; mensaje_cada_cuadro: el paso 0xE221 del mensaje en curso (p01:6597)
	jp 04179h		;6588   ; bancos_13_14: pone el 13 en 0x8000, el 14 en 0xA000 (con su copia en 0xC381-0xC383)
mensaje_cada_cuadro:		; el paso 0xE221 del mensaje en curso (p01:6597)
	ld hl,0e220h		;658b   ; apunta a la velocidad del mensaje en curso (0 = ninguno; 1-3, 4 sin espera)
	ld a,(hl)			;658e   ; sin mensaje, nada
	and a			;658f
	ret z			;6590
	ld b,a			;6591   ; B = la velocidad
	inc l			;6592
	ld a,(hl)			;6593   ; por el paso (p01:6597)
	call 0424dh		;6594   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_6597: 5 destinos del despachador p00:424D (call en p01:6594, el
;   indice en A): 65A1, 65B4, 65C7, 665A, 6661; lo leen p01:6594 (10 bytes)
;   0x6597..0x65a1  (10 bytes)
DATA_tabla_6597:
	defw 065a1h,065b4h,065c7h,0665ah,06661h	; 6597

; ======================================================================
; CODIGO 0x65a1..0x65ae  (13 bytes)
; ======================================================================


letra_segun_velocidad:		; los bancos de los mensajes
	call bancos_del_mensaje		;65a1   ; bancos_del_mensaje: los bancos 50-51 con 0xCA97 o 0xCAAF; los 48-49 en el paso 4 del estado de la partida
	ld a,b			;65a4   ; por la velocidad (p01:65AA)
	ld hl,065aah		;65a5
	call 0424eh		;65a8   ; salta_por_tabla: salta a la palabra A de la tabla de HL
	jp 040f0h		;65ab   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)

; ----------------------------------------------------------------------
; DATOS sin identificar  0x65ae..0x65b4  (6 bytes)
DATA_65AE:
	defb 098h,066h,0aah,066h,083h,066h	; 65ae

; ======================================================================
; CODIGO 0x65b4..0x6b8d  (1497 bytes)
; ======================================================================


espera_tecla_del_final:		; espera la tecla (acarreo mientras no)
	call espera_tecla		;65b4   ; espera_tecla: espera una tecla y borra la ventana: con 0xD8A8, 0x88 de ancho; si no, 0xB0
	ret c			;65b7
	ld de,(0e227h)		;65b8   ; al pulsarla, en la siguiente letra...
	ld a,0e2h		;65bc   ; ...el caracter 0xE2...
	call 05d18h		;65be   ; pinta_letra: pinta la letra A en DE (0xF8 trae una de la segunda pagina)
	ld a,038h		;65c1   ; ...y la X otra vez a 0x38
	ld (0e228h),a		;65c3
	ret			;65c6
espera_tecla_de_ventana:		; espera la tecla para seguir en otra ventana
	ld h,008h		;65c7
	ld a,(0d8a8h)		;65c9   ; con 0xD8A8, 0xB0 de ancho; si no, 0xD8
	and a			;65cc
	ld b,0b0h		;65cd
	jr nz,L_65D3		;65cf
	ld b,0d8h		;65d1
L_65D3:
	call espera_tecla_y_borra		;65d3   ; sin tecla, acarreo
	ret c			;65d6
	call bancos_del_mensaje		;65d7   ; bancos_del_mensaje: los bancos 50-51 con 0xCA97 o 0xCAAF; los 48-49 en el paso 4 del estado de la partida
	ld de,(0e223h)		;65da   ; la letra por la que va...
	ld hl,(0e225h)		;65de   ; lee el puntero al mensaje en curso (16 bits)
	ld bc,0e220h		;65e1   ; apunta a la velocidad del mensaje en curso (0 = ninguno; 1-3, 4 sin espera)
	add hl,de			;65e4   ; ...el byte del mensaje
	ld a,(hl)			;65e5
	call 040f0h		;65e6   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	cp 004h		;65e9   ; por debajo de 4 es una velocidad nueva...
	jr c,L_65F1		;65eb
	ld a,004h		;65ed   ; ...si no, la 4
	ld (bc),a			;65ef
	ret			;65f0
L_65F1:
	ld (bc),a			;65f1   ; la velocidad, y la letra siguiente
	inc de			;65f2
	ld (0e223h),de		;65f3   ; guarda la letra del mensaje por la que va (16 bits)
	ret			;65f7
espera_tecla:		; espera una tecla y borra la ventana: con 0xD8A8, 0x88 de ancho; si no, 0xB0
	ld h,030h		;65f8
	ld a,(0d8a8h)		;65fa   ; lee 1: la ventana del mensaje es estrecha (0xB8 x 0x28)
	and a			;65fd
	ld b,088h		;65fe
	jr nz,espera_tecla_y_borra		;6600
	ld b,0b0h		;6602
espera_tecla_y_borra:		; L = la Y de la ventana
	ld a,(0e229h)		;6604   ; lee donde empieza la linea del mensaje (16 bits)
	ld l,a			;6607
	ld a,(0ca09h)		;6608   ; la tecla de funcion del bit 5...
	and 020h		;660b
	jr nz,L_6616		;660d
	ld a,(0ca07h)		;660f   ; ...o un disparo recien pulsado
	and 030h		;6612
	jr z,L_664A		;6614
L_6616:
	ex de,hl			;6616
	ld hl,0caddh		;6617   ; 0xCADD = 1 pasa a 2
	ld a,(hl)			;661a
	dec a			;661b
	jr nz,L_661F		;661c
	inc (hl)			;661e
L_661F:
	ex de,hl			;661f
	ld (0e227h),hl		;6620   ; la siguiente letra al principio de la ventana
	ld a,(0e22bh)		;6623   ; el alto: las lineas * 8
	add a,a			;6626
	add a,a			;6627
	add a,a			;6628
	ld c,a			;6629
	ld a,(0e221h)		;662a   ; en el paso 4, 0x28 mas a la izquierda y mas ancha
	cp 004h		;662d
	jr nz,L_6639		;662f
	ld a,h			;6631
	sub 028h		;6632
	ld h,a			;6634
	ld a,b			;6635
	add a,028h		;6636
	ld b,a			;6638
L_6639:
	ld a,(0ca42h)		;6639   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	ld d,a			;663c
	ld a,099h		;663d   ; la ventana borrada al color 9
	call 046ffh		;663f   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
	xor a			;6642   ; el paso 0 y otra vez letra a letra
	ld (0e221h),a		;6643   ; guarda el paso del mensaje en curso (p01:6597)
	ld (0e22dh),a		;6646   ; guarda 1 si el mensaje se escribe de golpe (sin espera)
	ret			;6649
L_664A:
	ld a,(0ca03h)		;664a   ; sin tecla, el cursor parpadea cada 8 cuadros
	and 008h		;664d
	ld c,001h		;664f
	jr z,L_6655		;6651
	ld c,000h		;6653
L_6655:
	call cursor		;6655   ; el cursor (C = 1) o su hueco (C = 0)
	scf			;6658   ; con acarreo: sigue esperando
	ret			;6659
espera_del_final:		; la espera del final...
	ld hl,0e22ch		;665a   ; apunta a la espera del final del mensaje
	dec (hl)			;665d
	ret nz			;665e   ; ...al acabar, se acaba el mensaje
	jr L_6665		;665f
espera_y_acaba:		; espera una tecla y se acaba el mensaje
	call espera_tecla		;6661   ; espera_tecla: espera una tecla y borra la ventana: con 0xD8A8, 0x88 de ancho; si no, 0xB0
	ret c			;6664
L_6665:
	xor a			;6665   ; sin mensaje
	ld (0e220h),a		;6666   ; guarda la velocidad del mensaje en curso (0 = ninguno; 1-3, 4 sin espera)
	ret			;6669
bancos_del_mensaje:		; los bancos 50-51 con 0xCA97 o 0xCAAF; los 48-49 en el paso 4 del estado de la partida
	ld a,(0ca97h)		;666a   ; lee 1 si los mensajes salen de los bancos 50-51 y no de 48-49
	or a			;666d
	jp nz,04122h		;666e   ; bancos_50_51: pone el 50 en 0x8000, el 51 en 0xA000 (con su copia en 0xC381-0xC383)
	ld a,(0caafh)		;6671
	or a			;6674
	jp nz,04122h		;6675   ; bancos_50_51: pone el 50 en 0x8000, el 51 en 0xA000 (con su copia en 0xC381-0xC383)
	ld a,(0ca01h)		;6678   ; lee el paso del estado de la partida
	cp 004h		;667b
	jp z,0411dh		;667d   ; bancos_48_49: pone el 48 en 0x8000, el 49 en 0xA000 (con su copia en 0xC381-0xC383)
	jp 04122h		;6680   ; bancos_50_51: pone el 50 en 0x8000, el 51 en 0xA000 (con su copia en 0xC381-0xC383)
letra_lenta:		; letra a letra cada 2 cuadros; con un disparo, de golpe
	ld hl,0e22dh		;6683   ; apunta a 1 si el mensaje se escribe de golpe (sin espera)
	ld a,(hl)			;6686   ; de golpe: la letra ya
	and a			;6687
	jr nz,siguiente_letra		;6688
	ld a,(0ca07h)		;668a   ; un disparo recien pulsado...
	and 030h		;668d
	jr nz,L_6695		;668f
	ld c,002h		;6691   ; 2 cuadros entre letra y letra
	jr L_66BA		;6693
L_6695:
	ld (hl),001h		;6695   ; ...el resto de golpe
	ret			;6697
letra_rapida:		; letra a letra cada cuadro; con un disparo, de golpe
	ld hl,0e22dh		;6698   ; apunta a 1 si el mensaje se escribe de golpe (sin espera)
	ld a,(hl)			;669b
	and a			;669c
	jr nz,siguiente_letra		;669d
	ld a,(0ca07h)		;669f   ; lee lo recien pulsado del mando (los bits de 0xCA08 que no estaban)
	and 030h		;66a2
	jr nz,L_6695		;66a4
	ld c,001h		;66a6   ; 1 cuadro entre letras
	jr L_66BA		;66a8
letra_muy_lenta:		; letra a letra cada 4 cuadros; con un disparo, de golpe
	ld hl,0e22dh		;66aa   ; apunta a 1 si el mensaje se escribe de golpe (sin espera)
	ld a,(hl)			;66ad
	and a			;66ae
	jr nz,siguiente_letra		;66af
	ld a,(0ca07h)		;66b1   ; lee lo recien pulsado del mando (los bits de 0xCA08 que no estaban)
	and 030h		;66b4
	jr nz,L_6695		;66b6
	ld c,004h		;66b8   ; 4 cuadros entre letras
L_66BA:
	ld hl,0e222h		;66ba   ; la espera entre letras...
	ld a,(hl)			;66bd
	and a			;66be
	jr z,siguiente_letra		;66bf
	dec (hl)			;66c1   ; ...un cuadro menos
	ret nz			;66c2
	ld (hl),c			;66c3   ; a cero: otra vez C y la letra
siguiente_letra:		; la siguiente letra del mensaje y sus ordenes (0xFF, 0xFE, 0xFD, 0xFC, 0xFB, quien habla)
	ld hl,(0e223h)		;66c4   ; la letra por la que va...
	inc hl			;66c7   ; ...la siguiente
	ld (0e223h),hl		;66c8   ; guarda la letra del mensaje por la que va (16 bits)
	dec hl			;66cb
	ld de,(0e225h)		;66cc   ; lee el puntero al mensaje en curso (16 bits)
	add hl,de			;66d0
	ld a,(hl)			;66d1   ; A = la letra
	ld de,(0e227h)		;66d2   ; DE = donde se escribe
	ld b,a			;66d6
	inc a			;66d7   ; 0xFF: el final
	jr z,L_674E		;66d8
	inc a			;66da   ; 0xFE: salta de linea
	jp z,L_6762		;66db
	inc a			;66de   ; 0xFD: espera una tecla
	jp z,L_6774		;66df
	inc a			;66e2   ; 0xFC: espera una tecla y el paso siguiente
	jp z,espera_tecla_y_sigue		;66e3   ; espera_tecla_y_sigue: el cursor y dos pasos mas
	inc a			;66e6   ; 0xFB: espera una tecla, el paso 4 y 0xCADD = 1
	jp z,espera_tecla_paso_4		;66e7   ; espera_tecla_paso_4: el cursor, el paso 4 y 0xCADD = 1
	ld a,b			;66ea   ; las 0x76-0x7F...
	sub 076h		;66eb
	cp 00ah		;66ed
	jr c,L_671A		;66ef
	ld a,b			;66f1   ; ...y las 0xD4-0xDF (como 0x0A-0x15)...
	sub 0d4h		;66f2
	cp 00ch		;66f4
	jr nc,L_66FC		;66f6
	add a,00ah		;66f8   ; ...dicen quien habla
	jr L_671A		;66fa
L_66FC:
	ld a,b			;66fc   ; una letra
	call 05d18h		;66fd   ; pinta_letra: pinta la letra A en DE (0xF8 trae una de la segunda pagina)
	ld a,c			;6700   ; con 0xF8 delante (C = 0x40) ocupa dos bytes
	and a			;6701
	jr z,L_670B		;6702
	ld hl,(0e223h)		;6704   ; lee la letra del mensaje por la que va (16 bits)
	inc hl			;6707
	ld (0e223h),hl		;6708   ; guarda la letra del mensaje por la que va (16 bits)
L_670B:
	ld hl,0e228h		;670b   ; la X 8 puntos mas alla
	ld a,(hl)			;670e
	add a,008h		;670f
	ld (hl),a			;6711
	ld a,(0e22dh)		;6712   ; de golpe: la letra siguiente ya
	and a			;6715
	ret z			;6716
	jp siguiente_letra		;6717   ; siguiente_letra: la siguiente letra del mensaje y sus ordenes (0xFF, 0xFE, 0xFD, 0xFC, 0xFB, quien habla)
L_671A:
	call 04122h		;671a   ; bancos_50_51: pone el 50 en 0x8000, el 51 en 0xA000 (con su copia en 0xC381-0xC383)
	call pinta_quien_habla		;671d   ; el nombre de quien habla
	jp bancos_del_mensaje		;6720   ; y los bancos de los mensajes otra vez
pinta_quien_habla:		; el nombre de quien habla (p50:8004) en la cabecera de la ventana
	push af			;6723
	ld a,b			;6724   ; 0xCAA3 = quien habla
	ld (0caa3h),a		;6725
	ld a,038h		;6728   ; la X del texto: 0x38
	ld (0e228h),a		;672a
	pop af			;672d
	ld d,008h		;672e   ; el nombre en X = 8
	ld hl,08004h		;6730   ; la tabla de nombres de p50:8004...
	call 043fch		;6733   ; lee_palabra: HL = la palabra que hay en HL
	call 043f6h		;6736   ; ...el de A
L_6739:
	ld a,(hl)			;6739   ; las letras hasta 0xFF
	ld b,a			;673a
	inc b			;673b
	jr z,L_6747		;673c
	call 05d18h		;673e   ; pinta_letra: pinta la letra A en DE (0xF8 trae una de la segunda pagina)
	ld a,d			;6741   ; 8 puntos a la derecha
	add a,008h		;6742
	ld d,a			;6744
	jr L_6739		;6745
L_6747:
	ld d,030h		;6747   ; detras, en X = 0x30...
	ld a,0e2h		;6749   ; ...el caracter 0xE2
	jp 05d18h		;674b   ; pinta_letra: pinta la letra A en DE (0xF8 trae una de la segunda pagina)
L_674E:
	ld a,0e3h		;674e   ; el final: el caracter 0xE3...
	call 05d18h		;6750   ; pinta_letra: pinta la letra A en DE (0xF8 trae una de la segunda pagina)
	ld a,01eh		;6753   ; ...espera 0x1E cuadros...
	ld (0e22ch),a		;6755   ; guarda la espera del final del mensaje
	ld a,003h		;6758   ; ...en el paso 3
	ld (0e221h),a		;675a   ; guarda el paso del mensaje en curso (p01:6597)
	xor a			;675d   ; 0xCAA3 = 0
	ld (0caa3h),a		;675e
	ret			;6761
L_6762:
	ld hl,0e227h		;6762   ; salta de linea: la Y 8 mas...
	ld a,(hl)			;6765
	add a,008h		;6766
	ld (hl),a			;6768
	inc hl			;6769
	ld (hl),038h		;676a   ; ...y la X a 0x38
	ld a,(0e22dh)		;676c   ; lee 1 si el mensaje se escribe de golpe (sin espera)
	and a			;676f
	ret z			;6770
	jp siguiente_letra		;6771   ; siguiente_letra: la siguiente letra del mensaje y sus ordenes (0xFF, 0xFE, 0xFD, 0xFC, 0xFB, quien habla)
L_6774:
	ld a,030h		;6774   ; la X a 0x30
	ld (0e228h),a		;6776
cursor_de_espera:		; el cursor de esperar una tecla y el siguiente paso
	ld a,0e3h		;6779   ; el caracter 0xE3
	call 05d18h		;677b   ; pinta_letra: pinta la letra A en DE (0xF8 trae una de la segunda pagina)
	ld c,001h		;677e   ; el cursor
	call cursor		;6780   ; cursor: el cursor (C = 1) o su hueco (C = 0) abajo a la derecha de la ventana
	ld hl,0e221h		;6783   ; el paso siguiente
	inc (hl)			;6786
	ret			;6787
cursor:		; el cursor (C = 1) o su hueco (C = 0) abajo a la derecha de la ventana
	ld a,(0e22bh)		;6788   ; lee las lineas de la ventana del mensaje
	dec a			;678b
	add a,a			;678c
	add a,a			;678d
	add a,a			;678e
	ld b,a			;678f
	ld a,(0e229h)		;6790   ; la Y de la ultima linea
	add a,b			;6793
	ld e,a			;6794
	ld a,(0d8a8h)		;6795   ; la X: 0xB0 con 0xD8A8, si no 0xD8
	and a			;6798
	ld d,0b0h		;6799
	jr nz,L_679F		;679b
	ld d,0d8h		;679d
L_679F:
	ld a,c			;679f
	and a			;67a0
	jr z,L_67A8		;67a1
	ld a,0ech		;67a3   ; el caracter 0xEC
	jp 05d18h		;67a5   ; pinta_letra: pinta la letra A en DE (0xF8 trae una de la segunda pagina)
L_67A8:
	ex de,hl			;67a8   ; su hueco: 8 x 8 puntos
	ld bc,00808h		;67a9
	ld a,(0ca42h)		;67ac   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	ld d,a			;67af
	ld a,(0caafh)		;67b0   ; al color 9, o a 0 con 0xCAAF
	or a			;67b3
	ld a,099h		;67b4
	jp z,046ffh		;67b6   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
	xor a			;67b9
	jp 046ffh		;67ba   ; borra_bloque_vram: llena un rectangulo de la VRAM con un color (PR2 p00:4B9D)
espera_tecla_y_sigue:		; el cursor y dos pasos mas
	call cursor_de_espera		;67bd   ; cursor_de_espera: el cursor de esperar una tecla y el siguiente paso
	inc (hl)			;67c0
	ret			;67c1
espera_tecla_paso_4:		; el cursor, el paso 4 y 0xCADD = 1
	call cursor_de_espera		;67c2   ; cursor_de_espera: el cursor de esperar una tecla y el siguiente paso
	ld (hl),004h		;67c5
	ld a,001h		;67c7
	ld (0caddh),a		;67c9
	ret			;67cc
cambia_tablas_de_sprites:		; alterna las tablas de sprites de la VRAM: atributos en 0xF600 o 0xF200, colores en 0xF400 o 0xF000
	ld hl,(0ca0ch)		;67cd   ; lee la direccion en la VRAM de la tabla de colores de sprites (16 bits)
	bit 2,h		;67d0   ; las de ahora...
	ld hl,0f600h		;67d2   ; ...las otras: 0xF600 y 0xF400...
	ld de,0f400h		;67d5
	ld bc,0e705h		;67d8   ; ...con R#5 = 0xE7
	jr z,L_67E5		;67db
	ld hl,0f200h		;67dd   ; ...o 0xF200 y 0xF000 con R#5 = 0xEF
	ld de,0f000h		;67e0
	ld b,0efh		;67e3
L_67E5:
	ld (0ca0eh),hl		;67e5   ; guarda la direccion en la VRAM de la tabla de atributos de sprites (16 bits)
	ld (0ca0ch),de		;67e8   ; guarda la direccion en la VRAM de la tabla de colores de sprites (16 bits)
	jp 04522h		;67ec   ; R#5: la tabla de atributos que se ve
sprites_a_vram_bancos_15:
	call sprites_a_vram_turnos		;67ef   ; sprites_a_vram_turnos: los sprites a la VRAM, cambiando el orden cada cuadro para que no desaparezcan
	jp 041f7h		;67f2   ; bancos_15: pone el 15 en 0xA000 (con su copia en 0xC381-0xC383)
sprites_a_vram_turnos:		; los sprites a la VRAM, cambiando el orden cada cuadro para que no desaparezcan
	call sin_color_los_escondidos		;67f5   ; sin_color_los_escondidos: en la zona 0x12 con 0xD881: los colores de los sprites escondidos (Y = 0xE0) a cero
	ld a,(0caa0h)		;67f8   ; con 0xCAA0, salvo con 0xE040 = 9, p11:B67D
	or a			;67fb
	jr z,L_680E		;67fc
	ld a,(0e040h)		;67fe
	cp 009h		;6801
	jr z,L_680E		;6803
	call 041d5h		;6805   ; bancos_11: pone el 11 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b67dh		;6808   ; p11:B67D
	jp 040f0h		;680b   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
L_680E:
	ld a,(0cb4bh)		;680e   ; con 0xCB4B, p01:68B1
	or a			;6811
	jp nz,L_68B1		;6812
	ld a,(0ca67h)		;6815   ; con 0xCA67 o 0xD8AA = 2, p01:6954
	and a			;6818
	jp nz,sprites_al_reves		;6819   ; sprites_al_reves: los sprites en orden inverso: el 31 primero
	ld a,(0d8aah)		;681c
	cp 002h		;681f
	jp z,sprites_al_reves		;6821   ; sprites_al_reves: los sprites en orden inverso: el 31 primero
	and a			;6824   ; con 0xD8AA = 1, p01:693F
	jp nz,sprites_de_d823		;6825   ; sprites_de_d823: en la sala 2, con Snake por encima de 0xD823, al reves; si no, tal cual
	ld a,(0ca4ah)		;6828   ; la zona 0x0F: p01:6993
	ld b,a			;682b
	cp 00fh		;682c
	jp z,sprites_zona_0f		;682e   ; sprites_zona_0f: al reves si 0xCE6E < 0xCE2E; si no, los 10 primeros al final
	ld a,(0d8aeh)		;6831   ; con 0xD8AE, sin turnos (p01:68BE)
	and a			;6834
	jp nz,L_68BE		;6835
	ld a,(0ca5fh)		;6838   ; sin 0xCA5F, en la fila 7...
	and a			;683b
	jr nz,L_684E		;683c
	ld a,(0ca50h)		;683e   ; lee la fila de la sala en la zona (uno mas al salir por arriba)
	ld c,a			;6841
	cp 007h		;6842
	jr nz,L_684E		;6844
	ld a,c			;6846   ; ...columnas 9-0x0A: p01:699D
	sub 009h		;6847
	cp 002h		;6849
	jp c,sprites_10_al_final		;684b   ; sprites_10_al_final: los colores de los sprites 10-31 al principio...
L_684E:
	ld a,b			;684e   ; la zona 0x13 fila 4: p01:6935
	cp 013h		;684f
	jr nz,L_6859		;6851
	ld a,c			;6853
	cp 004h		;6854
	jp z,sprites_zona_13		;6856   ; sprites_zona_13: hacia abajo, la copia tal cual; si no, al reves (p01:6954)
L_6859:
	ld hl,0ca0bh		;6859   ; el turno: 0xCA0B + 0x68, de 8 en 8 (de 0 a 0x78)
	ld a,(hl)			;685c
	add a,068h		;685d
	and 078h		;685f
	ld (hl),a			;6861
	ld a,(00007h)		;6862   ; el puerto de datos
	ld c,a			;6865
	ld hl,(0ca0ch)		;6866   ; a la tabla de colores
	xor a			;6869
	call 044e2h		;686a   ; vram_para_escribir: pone en el VDP la direccion de escritura HL (A bit 0 = la mitad alta, R#14)
	ld a,(0ca0bh)		;686d   ; 16 pares de sprites, desde el del turno
	ld d,010h		;6870
	add a,a			;6872
L_6873:
	ld h,06dh		;6873   ; HL = 0xDA00 + el turno * 4: 32 bytes por par
	ld l,a			;6875
	add hl,hl			;6876
	ld b,020h		;6877   ; los colores del par (32 bytes)
	otir		;6879
	add a,090h		;687b   ; el par siguiente: 9 pares mas alla, dando la vuelta
	dec d			;687d
	jr nz,L_6873		;687e
	ld a,(0ca1ch)		;6880   ; con 0xCA1C, la Y de los sprites + 0xD8A5
	and a			;6883
	ld e,000h		;6884
	jr z,L_688C		;6886
	ld a,(0d8a5h)		;6888
	ld e,a			;688b
L_688C:
	ld a,(0ca0bh)		;688c   ; los atributos, en el mismo orden
	ld d,010h		;688f
	ld h,0dch		;6891   ; desde 0xDC00
L_6893:
	ld b,008h		;6893   ; dos sprites (8 bytes)
	ld l,a			;6895
	ex af,af'			;6896
L_6897:
	ld a,l			;6897   ; la Y (el byte 0 de cada 4)...
	and 003h		;6898
	ld a,(hl)			;689a
	jr nz,L_68A3		;689b
	add a,e			;689d   ; ...mas el desplazamiento...
	cp 0d8h		;689e   ; ...sin dar 0xD8 (que esconde los que siguen)
	jr nz,L_68A3		;68a0
	inc a			;68a2
L_68A3:
	out (c),a		;68a3   ; a la VRAM
	inc l			;68a5
	djnz L_6897		;68a6
	ex af,af'			;68a8
	add a,048h		;68a9   ; el par siguiente, 9 mas alla
	and 078h		;68ab
	dec d			;68ad
	jr nz,L_6893		;68ae
	ret			;68b0
L_68B1:
	ld a,(0cb0eh)		;68b1   ; hacia arriba: p01:68F5
	dec a			;68b4
	jr z,L_68F5		;68b5
	ld a,(0ca1ch)		;68b7   ; sin 0xCA1C, la copia tal cual
	or a			;68ba
	jp z,04f97h		;68bb   ; sprites_a_vram: los colores de los sprites (0xDA00) y detras sus atributos (0xDC00)...
L_68BE:
	ld hl,0da00h		;68be   ; sin turnos: los colores tal cual
	ld bc,00200h		;68c1   ; 0x200 bytes
	call a_colores_de_sprites		;68c4   ; p01:69D2
	ld a,(00007h)		;68c7
	ld c,a			;68ca
	ld hl,(0ca0eh)		;68cb   ; y los atributos
	xor a			;68ce
	call 044e2h		;68cf   ; vram_para_escribir: pone en el VDP la direccion de escritura HL (A bit 0 = la mitad alta, R#14)
	ld hl,0dc00h		;68d2   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	ld b,080h		;68d5   ; 128 bytes
	ld a,(0ca1ch)		;68d7   ; lee 1: la pantalla partida en la linea 0xB4 (arriba con desplazamiento, abajo la pagina 1 sin sprites)
	ld e,000h		;68da
	and a			;68dc
	jr z,L_68E3		;68dd
	ld a,(0d8a5h)		;68df
	ld e,a			;68e2
L_68E3:
	ld a,b			;68e3   ; la Y...
	and 003h		;68e4
	ld a,(hl)			;68e6
	jr nz,L_68EF		;68e7
	add a,e			;68e9   ; ...mas el desplazamiento, sin dar 0xD8
	cp 0d8h		;68ea
	jr nz,L_68EF		;68ec
	inc a			;68ee
L_68EF:
	out (c),a		;68ef
	inc hl			;68f1
	djnz L_68E3		;68f2
	ret			;68f4
L_68F5:
	ld hl,0da80h		;68f5   ; hacia arriba: desde el sprite 8 (0xDA80), 0x180 bytes
	ld bc,00180h		;68f8
	call a_colores_de_sprites		;68fb   ; a_colores_de_sprites: BC bytes de HL a la tabla de colores de sprites
	ld hl,(0ca0ch)		;68fe   ; los colores de los sprites 24-31 al principio de la tabla...
	ld de,00180h		;6901
	add hl,de			;6904
	ex de,hl			;6905
	ld hl,0da00h		;6906   ; ...y los 0-7 al final
	ld bc,00080h		;6909
	call a_vram_pagina_0		;690c   ; a_vram_pagina_0: BC bytes de HL a la VRAM de DE (pagina 0)
	ld a,(00007h)		;690f
	ld c,a			;6912
	ld hl,(0ca0eh)		;6913   ; lee la direccion en la VRAM de la tabla de atributos de sprites (16 bits)
	xor a			;6916
	call 044e2h		;6917   ; vram_para_escribir: pone en el VDP la direccion de escritura HL (A bit 0 = la mitad alta, R#14)
	ld a,(0ca1ch)		;691a   ; lee 1: la pantalla partida en la linea 0xB4 (arriba con desplazamiento, abajo la pagina 1 sin sprites)
	or a			;691d
	ld e,000h		;691e
	jr z,L_6926		;6920
	ld a,(0d8a5h)		;6922
	ld e,a			;6925
L_6926:
	ld hl,0dc20h		;6926   ; los atributos de los sprites 8-31...
	ld b,060h		;6929
	call L_68E3		;692b
	ld hl,0dc00h		;692e   ; ...y despues los 0-7
	ld b,020h		;6931
	jr L_68E3		;6933
sprites_zona_13:		; hacia abajo, la copia tal cual; si no, al reves (p01:6954)
	ld a,(0cb0eh)		;6935   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	cp 002h		;6938
	jp z,04f97h		;693a   ; sprites_a_vram: los colores de los sprites (0xDA00) y detras sus atributos (0xDC00)...
	jr sprites_al_reves		;693d
sprites_de_d823:		; en la sala 2, con Snake por encima de 0xD823, al reves; si no, tal cual
	ld a,(0ca4bh)		;693f   ; lee la sala de la zona
	cp 002h		;6942
	jp nz,04f97h		;6944   ; sprites_a_vram: los colores de los sprites (0xDA00) y detras sus atributos (0xDC00)...
	ld a,(0cb03h)		;6947   ; lee la Y de Snake
	ld b,a			;694a
	ld a,(0d823h)		;694b
	cp b			;694e
	jp c,04f97h		;694f   ; sprites_a_vram: los colores de los sprites (0xDA00) y detras sus atributos (0xDC00)...
	jr sprites_al_reves		;6952
sprites_al_reves:		; los sprites en orden inverso: el 31 primero
	ld hl,0dbe0h		;6954
	ld de,(0ca0ch)		;6957   ; desde los colores del ultimo par (0xDBE0)
	ld b,010h		;695b   ; 16 pares
L_695D:
	push bc			;695d
	ld bc,00020h		;695e
	push bc			;6961
	push hl			;6962
	call a_vram_pagina_0		;6963   ; 32 bytes de colores
	pop hl			;6966
	pop bc			;6967
	or a			;6968
	sbc hl,bc		;6969   ; el par de antes
	ld a,020h		;696b   ; el par siguiente de la VRAM
	call 04243h		;696d   ; suma_a_de: DE = DE + A
	pop bc			;6970
	djnz L_695D		;6971
	ld hl,0dc78h		;6973   ; los atributos desde el ultimo par (0xDC78)
	ld de,(0ca0eh)		;6976   ; lee la direccion en la VRAM de la tabla de atributos de sprites (16 bits)
	ld b,010h		;697a
L_697C:
	push bc			;697c
	ld bc,00008h		;697d
	push bc			;6980
	push hl			;6981
	call a_vram_pagina_0		;6982   ; 8 bytes
	pop hl			;6985
	pop bc			;6986
	or a			;6987
	sbc hl,bc		;6988   ; el par de antes
	ld a,008h		;698a
	call 04243h		;698c   ; suma_a_de: DE = DE + A
	pop bc			;698f
	djnz L_697C		;6990
	ret			;6992
sprites_zona_0f:		; al reves si 0xCE6E < 0xCE2E; si no, los 10 primeros al final
	ld a,(0ce2eh)		;6993
	ld b,a			;6996
	ld a,(0ce6eh)		;6997
	cp b			;699a
	jr c,sprites_al_reves		;699b
sprites_10_al_final:		; los colores de los sprites 10-31 al principio...
	ld hl,0daa0h		;699d
	ld bc,00160h		;69a0
	push bc			;69a3
	call a_colores_de_sprites		;69a4   ; a_colores_de_sprites: BC bytes de HL a la tabla de colores de sprites
	pop bc			;69a7
	ld hl,(0ca0ch)		;69a8   ; lee la direccion en la VRAM de la tabla de colores de sprites (16 bits)
	add hl,bc			;69ab
	ex de,hl			;69ac
	ld hl,0da00h		;69ad   ; ...y los 0-9 detras
	ld bc,000a0h		;69b0
	call a_vram_pagina_0		;69b3   ; a_vram_pagina_0: BC bytes de HL a la VRAM de DE (pagina 0)
	ld hl,0dc28h		;69b6   ; los atributos igual: 10-31...
	ld de,(0ca0eh)		;69b9   ; lee la direccion en la VRAM de la tabla de atributos de sprites (16 bits)
	ld bc,00058h		;69bd
	push bc			;69c0
	call a_vram_pagina_0		;69c1   ; a_vram_pagina_0: BC bytes de HL a la VRAM de DE (pagina 0)
	pop bc			;69c4
	ld hl,(0ca0eh)		;69c5   ; lee la direccion en la VRAM de la tabla de atributos de sprites (16 bits)
	add hl,bc			;69c8
	ex de,hl			;69c9
	ld hl,0dc00h		;69ca   ; ...y 0-9
	ld bc,00028h		;69cd
	jr a_vram_pagina_0		;69d0
a_colores_de_sprites:		; BC bytes de HL a la tabla de colores de sprites
	ld de,(0ca0ch)		;69d2   ; lee la direccion en la VRAM de la tabla de colores de sprites (16 bits)
a_vram_pagina_0:		; BC bytes de HL a la VRAM de DE (pagina 0)
	xor a			;69d6
	jp 04486h		;69d7   ; copia_a_vram_espera: espera al VDP (p00:4650) y copia BC bytes de HL a la VRAM de DE
sin_color_los_escondidos:		; en la zona 0x12 con 0xD881: los colores de los sprites escondidos (Y = 0xE0) a cero
	ld a,(0ca4ah)		;69da   ; lee la zona
	cp 012h		;69dd
	ret nz			;69df
	ld a,(0d881h)		;69e0
	inc a			;69e3
	ret z			;69e4
	ld hl,0dc00h		;69e5   ; apunta a la copia de la tabla de atributos de sprites: 32 x [Y][X][patron][color]
	ld bc,02000h		;69e8   ; 32 sprites, C = el numero
L_69EB:
	push bc			;69eb
	push hl			;69ec
	ld a,(hl)			;69ed   ; la Y
	cp 0e0h		;69ee
	jr nz,L_6A03		;69f0
	ld l,c			;69f2   ; escondido: sus 16 colores...
	ld h,000h		;69f3
	add hl,hl			;69f5
	add hl,hl			;69f6
	add hl,hl			;69f7
	add hl,hl			;69f8
	ld de,0da00h		;69f9   ; apunta a la copia de la tabla de colores de sprites: 32 x 16 lineas (va con 0xDC00 detras)
	add hl,de			;69fc
	ld bc,0000fh		;69fd
	call 04236h		;6a00   ; ...a cero
L_6A03:
	pop hl			;6a03   ; el siguiente
	inc hl			;6a04
	inc hl			;6a05
	inc hl			;6a06
	inc hl			;6a07
	pop bc			;6a08
	inc c			;6a09
	djnz L_69EB		;6a0a
	ret			;6a0c
sonido_01:		; pide el sonido 0x01
	ld a,001h		;6a0d
	jr L_6A68		;6a0f
sonido_07:		; pide el sonido 0x07
	ld a,007h		;6a11
	jr L_6A68		;6a13
sonido_09:		; pide el sonido 0x09
	ld a,009h		;6a15
	jr L_6A68		;6a17
sonido_0a:		; pide el sonido 0x0A
	ld a,00ah		;6a19
	jr L_6A68		;6a1b
sonido_0b:		; pide el sonido 0x0B
	ld a,00bh		;6a1d
	jr L_6A68		;6a1f
sonido_0c:		; pide el sonido 0x0C
	ld a,00ch		;6a21
	jr L_6A68		;6a23
sonido_0d:		; pide el sonido 0x0D
	ld a,00dh		;6a25
	jr L_6A68		;6a27
sonido_0e:		; pide el sonido 0x0E
	ld a,00eh		;6a29
	jr L_6A68		;6a2b
sonido_0f:		; pide el sonido 0x0F
	ld a,00fh		;6a2d
	jr L_6A68		;6a2f
sonido_8e:		; pide el sonido 0x8E (de los que tienen la partitura en un banco de musica, p16:4CE3) (antes, L_6CDA)
	call sin_musica_pendiente		;6a31   ; sin_musica_pendiente: 0xCA19 = 0: ninguna musica pendiente
	ld a,08eh		;6a34
	jr L_6A68		;6a36
sonido_10:		; pide el sonido 0x10
	ld a,010h		;6a38
	jr L_6A68		;6a3a
sonido_12:		; pide el sonido 0x12
	ld a,012h		;6a3c
	jr L_6A68		;6a3e
sonido_13:		; pide el sonido 0x13
	ld a,013h		;6a40
	jr L_6A68		;6a42
sonido_14:		; pide el sonido 0x14
	ld a,014h		;6a44
	jr L_6A68		;6a46
sonido_15:		; pide el sonido 0x15
	ld a,015h		;6a48
	jr L_6A68		;6a4a
sonido_16:		; pide el sonido 0x16
	ld a,016h		;6a4c
	jr L_6A68		;6a4e
sonido_17:		; pide el sonido 0x17
	ld a,017h		;6a50
	jr L_6A68		;6a52
sonido_18:		; pide el sonido 0x18
	ld a,018h		;6a54
	jr L_6A68		;6a56
sonido_19:		; pide el sonido 0x19
	ld a,019h		;6a58
	jr L_6A68		;6a5a
sonido_1a:		; pide el sonido 0x1A
	ld a,01ah		;6a5c
	jr L_6A68		;6a5e
sonido_1b:		; pide el sonido 0x1B
	ld a,01bh		;6a60
	jr L_6A68		;6a62
sonido_1c:		; pide el sonido 0x1C
	ld a,01ch		;6a64
	jr L_6A68		;6a66
L_6A68:
	jp 0c340h		;6a68
sonido_04:		; pide el sonido 0x04
	ld a,004h		;6a6b
	jr L_6A68		;6a6d
sonido_1d:		; pide el sonido 0x1D
	ld a,01dh		;6a6f
	jr L_6A68		;6a71
sonido_1e:		; pide el sonido 0x1E
	ld a,01eh		;6a73
	jr L_6A68		;6a75
sonido_1f:		; pide el sonido 0x1F
	ld a,01fh		;6a77
	jr L_6A68		;6a79
sonido_20:		; pide el sonido 0x20
	ld a,020h		;6a7b
	jr L_6A68		;6a7d
sonido_21:		; pide el sonido 0x21
	ld a,021h		;6a7f
	jr L_6A68		;6a81
sonido_22:		; pide el sonido 0x22
	ld a,022h		;6a83
	jr L_6A68		;6a85
sonido_23:		; pide el sonido 0x23
	ld a,023h		;6a87
	jr L_6A68		;6a89
sonido_24:		; pide el sonido 0x24
	ld a,024h		;6a8b
	jr L_6A68		;6a8d
sonido_25:		; pide el sonido 0x25
	ld a,025h		;6a8f
	jr L_6A68		;6a91
sonido_26:		; pide el sonido 0x26
	ld a,026h		;6a93
	jr L_6A68		;6a95
sonido_27:		; pide el sonido 0x27
	ld a,027h		;6a97
	jr L_6A68		;6a99
sonido_28:		; pide el sonido 0x28
	ld a,028h		;6a9b
	jr L_6A68		;6a9d
sonido_29:		; pide el sonido 0x29
	ld a,029h		;6a9f
	jr L_6A68		;6aa1
sonido_2a:		; pide el sonido 0x2A
	ld a,02ah		;6aa3
	jr L_6A68		;6aa5
sonido_2b:		; pide el sonido 0x2B
	ld a,02bh		;6aa7
	jr L_6A68		;6aa9
sonido_2c:		; pide el sonido 0x2C
	ld a,02ch		;6aab
	jr L_6A68		;6aad
sonido_2d:		; pide el sonido 0x2D
	ld a,02dh		;6aaf
	jr L_6A68		;6ab1
sonido_2e:		; pide el sonido 0x2E
	ld a,02eh		;6ab3
	jr L_6A68		;6ab5
sonido_2f:		; pide el sonido 0x2F
	ld a,02fh		;6ab7
	jr L_6A68		;6ab9
sonido_30:		; pide el sonido 0x30
	ld a,030h		;6abb
	jr L_6A68		;6abd
sonido_82:		; pide el sonido 0x82 (de los que tienen la partitura en un banco de musica, p16:4CE3) (antes, L_6CDA)
	call sin_musica_pendiente		;6abf   ; sin_musica_pendiente: 0xCA19 = 0: ninguna musica pendiente
	ld a,082h		;6ac2
	jr L_6A68		;6ac4
sonido_31:		; pide el sonido 0x31
	ld a,031h		;6ac6
	jr L_6A68		;6ac8
sonido_47:		; pide el sonido 0x47
	ld a,047h		;6aca
	jr L_6A68		;6acc
sonido_44:		; pide el sonido 0x44
	ld a,044h		;6ace
	jr L_6A68		;6ad0
sonido_8f:		; pide el sonido 0x8F (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld a,08fh		;6ad2
	jr L_6A68		;6ad4
sonido_90:		; pide el sonido 0x90 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld a,090h		;6ad6
	jr L_6B32		;6ad8
sonido_32:		; pide el sonido 0x32
	ld a,032h		;6ada
	jr L_6B32		;6adc
sonido_33:		; pide el sonido 0x33
	ld a,033h		;6ade
	jr L_6B32		;6ae0
sonido_85:		; pide el sonido 0x85 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld a,085h		;6ae2
	jr L_6B32		;6ae4
sonido_34:		; pide el sonido 0x34
	ld a,034h		;6ae6
	jr L_6B32		;6ae8
sonido_35:		; pide el sonido 0x35
	ld a,035h		;6aea
	jr L_6B32		;6aec
sonido_91:		; pide el sonido 0x91 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld a,091h		;6aee
	jr L_6B32		;6af0
sonido_36:		; pide el sonido 0x36
	ld a,036h		;6af2
	jr L_6B32		;6af4
sonido_38:		; pide el sonido 0x38
	ld a,038h		;6af6
	jr L_6B32		;6af8
sonido_39:		; pide el sonido 0x39
	ld a,039h		;6afa
	jr L_6B32		;6afc
sonido_3a:		; pide el sonido 0x3A
	ld a,03ah		;6afe
	jr L_6B32		;6b00
sonido_3b:		; pide el sonido 0x3B
	ld a,03bh		;6b02
	jr L_6B32		;6b04
sonido_3c:		; pide el sonido 0x3C
	ld a,03ch		;6b06
	jr L_6B32		;6b08
sonido_3d:		; pide el sonido 0x3D
	ld a,03dh		;6b0a
	jr L_6B32		;6b0c
sonido_3e:		; pide el sonido 0x3E
	ld a,03eh		;6b0e
	jr L_6B32		;6b10
sonido_05:		; pide el sonido 0x05
	ld a,005h		;6b12
	jr L_6B32		;6b14
sonido_40:		; pide el sonido 0x40
	ld a,040h		;6b16
	jr L_6B32		;6b18
sonido_41:		; pide el sonido 0x41
	ld a,041h		;6b1a
	jr L_6B32		;6b1c
sonido_6a:		; pide el sonido 0x6A (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld a,06ah		;6b1e
	jr L_6B32		;6b20
sonido_6b:		; pide el sonido 0x6B (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld a,06bh		;6b22
	jr L_6B32		;6b24
sonido_6c:		; pide el sonido 0x6C (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld a,06ch		;6b26
	jr L_6B32		;6b28
sonido_6d:		; pide el sonido 0x6D (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld a,06dh		;6b2a
	jr L_6B32		;6b2c
sonido_6e:		; pide el sonido 0x6E (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld a,06eh		;6b2e
	jr L_6B32		;6b30
L_6B32:
	jp 0c340h		;6b32
sonido_6f:		; pide el sonido 0x6F (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld a,06fh		;6b35
	jr L_6B32		;6b37
sonido_70:		; pide el sonido 0x70 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld a,070h		;6b39
	jr L_6B32		;6b3b
sonido_71:		; pide el sonido 0x71 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld a,071h		;6b3d
	jr L_6B32		;6b3f
sonido_72:		; pide el sonido 0x72 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld a,072h		;6b41
	jr L_6B32		;6b43
sonido_73:		; pide el sonido 0x73 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld a,073h		;6b45
	jr L_6B32		;6b47
sonido_56:		; pide el sonido 0x56
	ld a,056h		;6b49
	jr L_6B32		;6b4b
sonido_57:		; pide el sonido 0x57
	ld a,057h		;6b4d
	jr L_6B32		;6b4f
sonido_58:		; pide el sonido 0x58
	ld a,058h		;6b51
	jr L_6B32		;6b53
sonido_59:		; pide el sonido 0x59
	ld a,059h		;6b55
	jr L_6B32		;6b57
sonido_5a:		; pide el sonido 0x5A
	ld a,05ah		;6b59
	jr L_6B32		;6b5b
sonido_5b:		; pide el sonido 0x5B
	ld a,05bh		;6b5d
	jr L_6B32		;6b5f
sonido_74:		; pide el sonido 0x74 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld a,074h		;6b61
	jr L_6B32		;6b63
sonido_75:		; pide el sonido 0x75 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld a,075h		;6b65
	jr L_6B32		;6b67
sonido_76:		; pide el sonido 0x76 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld a,076h		;6b69
	jr L_6B32		;6b6b
sonido_77:		; pide el sonido 0x77 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld a,077h		;6b6d
	jr L_6B32		;6b6f
sonido_78:		; pide el sonido 0x78 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld a,078h		;6b71
	jr L_6B32		;6b73
sonido_a1:		; pide el sonido 0xA1 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld a,0a1h		;6b75
	jr L_6B32		;6b77
sonido_7a:		; pide el sonido 0x7A (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld a,07ah		;6b79
	jr L_6B32		;6b7b
sonido_7b:		; pide el sonido 0x7B (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld a,07bh		;6b7d
	jr L_6B32		;6b7f
sonido_7c:		; pide el sonido 0x7C (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld a,07ch		;6b81
	jr L_6B32		;6b83
sonido_7d:		; pide el sonido 0x7D (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld a,07dh		;6b85
	jr L_6B32		;6b87
sonido_7e:		; pide el sonido 0x7E (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld a,07eh		;6b89
	jr L_6B32		;6b8b

; ----------------------------------------------------------------------
; DATOS resto_6B8D: lo apuntan con el banco puesto p01:7CE2 (0x6B8D), p01:7D14
;   (0x6B8D); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p01:7CE2, p01:7D14 (4 bytes)
;   0x6b8d..0x6b91  (4 bytes)
DATA_resto_6B8D:
	defb 03eh,07fh,018h,0a1h	; 6b8d

; ======================================================================
; CODIGO 0x6b91..0x6c37  (166 bytes)
; ======================================================================


sonido_80:		; pide el sonido 0x80 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld a,080h		;6b91
	jr $-97		;6b93
sonido_81:		; pide el sonido 0x81 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld a,081h		;6b95
	jr $-101		;6b97
sonido_8c:		; pide el sonido 0x8C (de los que tienen la partitura en un banco de musica, p16:4CE3) (antes, L_6CDA)
	call sin_musica_pendiente		;6b99   ; sin_musica_pendiente: 0xCA19 = 0: ninguna musica pendiente
	ld a,08ch		;6b9c
	jr $-108		;6b9e
sonido_8d:		; pide el sonido 0x8D (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld a,08dh		;6ba0
	jr $-112		;6ba2
sonido_99:		; pide el sonido 0x99 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld a,099h		;6ba4
	jr $-116		;6ba6
sonido_9b:		; pide el sonido 0x9B (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld a,09bh		;6ba8
	jr $-120		;6baa
sonido_9c:		; pide el sonido 0x9C (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld a,09ch		;6bac
	jr $-124		;6bae
sonido_9d:		; pide el sonido 0x9D (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld a,09dh		;6bb0
	jr L_6BF8		;6bb2
sonido_9e:		; pide el sonido 0x9E (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld a,09eh		;6bb4
	jr L_6BF8		;6bb6
sonido_9f:		; pide el sonido 0x9F (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld a,09fh		;6bb8
	jr L_6BF8		;6bba
sonido_a2:		; pide el sonido 0xA2 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld a,0a2h		;6bbc
	jr L_6BF8		;6bbe
sonido_a3:		; pide el sonido 0xA3 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld a,0a3h		;6bc0
	jr L_6BF8		;6bc2
sonido_a4:		; pide el sonido 0xA4 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld a,0a4h		;6bc4
	jr L_6BF8		;6bc6
sonido_a5:		; pide el sonido 0xA5 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld a,0a5h		;6bc8
	jr L_6BF8		;6bca
sonido_84:		; pide el sonido 0x84 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld a,084h		;6bcc
	jr L_6BF8		;6bce
sonido_a6:		; pide el sonido 0xA6 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld a,0a6h		;6bd0
	jr L_6BF8		;6bd2
sonido_a7:		; pide el sonido 0xA7 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld a,0a7h		;6bd4
	jr L_6BF8		;6bd6
orden_sonido_f1:		; la orden 0xF1 al sonido
	ld a,0f1h		;6bd8
	jr L_6BF8		;6bda
orden_sonido_f2:		; la orden 0xF2 al sonido
	ld a,0f2h		;6bdc
	jr L_6BF8		;6bde
orden_sonido_f3:		; la orden 0xF3 al sonido
	ld a,0f3h		;6be0
	jr L_6BF8		;6be2
orden_sonido_f4:		; la orden 0xF4 al sonido
	ld a,0f4h		;6be4
	jr L_6BF8		;6be6
orden_sonido_f6:		; la orden 0xF6 al sonido
	ld a,0f6h		;6be8
	jr L_6BF8		;6bea
orden_sonido_f7:		; la orden 0xF7 al sonido
	ld a,0f7h		;6bec
	jr L_6BF8		;6bee
orden_sonido_f8:		; la orden 0xF8 al sonido
	ld a,0f8h		;6bf0
	jr L_6BF8		;6bf2
orden_sonido_f9:		; la orden 0xF9 al sonido
	ld a,0f9h		;6bf4
	jr L_6BF8		;6bf6
L_6BF8:
	jp 0c340h		;6bf8
sonido_83:		; pide el sonido 0x83 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld a,083h		;6bfb
	jr L_6BF8		;6bfd
sonido_a8:		; pide el sonido 0xA8 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld a,0a8h		;6bff
	jr L_6BF8		;6c01
sonido_a9:		; pide el sonido 0xA9 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld a,0a9h		;6c03
	jr L_6BF8		;6c05
sonido_aa:		; pide el sonido 0xAA (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld a,0aah		;6c07
	jr L_6BF8		;6c09
sonido_79:		; pide el sonido 0x79 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld a,079h		;6c0b
	jr L_6BF8		;6c0d
sonido_02:		; pide el sonido 0x02
	ld a,002h		;6c0f
	jr L_6BF8		;6c11
sonido_37:		; pide el sonido 0x37
	ld a,037h		;6c13
	jr L_6BF8		;6c15
sonido_48:		; pide el sonido 0x48
	ld a,048h		;6c17
	jr L_6BF8		;6c19
sonido_93:		; pide el sonido 0x93 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld a,093h		;6c1b
	jr L_6BF8		;6c1d
sonido_49:		; pide el sonido 0x49
	ld a,049h		;6c1f
	jr L_6BF8		;6c21
sonido_92:		; pide el sonido 0x92 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld a,092h		;6c23
	jr L_6BF8		;6c25
sonido_9a:		; pide el sonido 0x9A (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld a,09ah		;6c27
	jr L_6BF8		;6c29
sonido_43:		; pide el sonido 0x43
	ld a,043h		;6c2b
	jr L_6BF8		;6c2d
sonido_45:		; pide el sonido 0x45
	ld a,045h		;6c2f
	jr L_6BF8		;6c31
sonido_46:		; pide el sonido 0x46
	ld a,046h		;6c33
	jr L_6BF8		;6c35

; ----------------------------------------------------------------------
; DATOS resto_6C37: lo apuntan con el banco puesto p05:A9B0 (0x6C37); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p05:A9B0 (4 bytes)
;   0x6c37..0x6c3b  (4 bytes)
DATA_resto_6C37:
	defb 03eh,003h,018h,0bdh	; 6c37

; ======================================================================
; CODIGO 0x6c3b..0x72a2  (1639 bytes)
; ======================================================================


sonido_42:		; pide el sonido 0x42
	ld a,042h		;6c3b
	jr $-69		;6c3d
sonido_86:		; pide el sonido 0x86 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld a,086h		;6c3f
	jr $-73		;6c41
sonido_94:		; pide el sonido 0x94 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld a,094h		;6c43
	jr $-77		;6c45
sonido_4a:		; pide el sonido 0x4A
	ld a,04ah		;6c47
	jr $-81		;6c49
sonido_4b:		; pide el sonido 0x4B
	ld a,04bh		;6c4b
	jr $-85		;6c4d
sonido_4c:		; pide el sonido 0x4C
	ld a,04ch		;6c4f
	jr $-89		;6c51
sonido_4d:		; pide el sonido 0x4D
	ld a,04dh		;6c53
	jr $-93		;6c55
sonido_4e:		; pide el sonido 0x4E
	ld a,04eh		;6c57
	jr $-97		;6c59
sonido_4f:		; pide el sonido 0x4F
	ld a,04fh		;6c5b
	jr $-101		;6c5d
sonido_50:		; pide el sonido 0x50
	ld a,050h		;6c5f
	jr $-105		;6c61
sonido_51:		; pide el sonido 0x51
	ld a,051h		;6c63
	jr $-109		;6c65
sonido_52:		; pide el sonido 0x52
	ld a,052h		;6c67
	jr $-113		;6c69
sonido_53:		; pide el sonido 0x53
	ld a,053h		;6c6b
	jr $-117		;6c6d
sonido_54:		; pide el sonido 0x54
	ld a,054h		;6c6f
	jr $-121		;6c71
sonido_55:		; pide el sonido 0x55
	ld a,055h		;6c73
	jr $-125		;6c75
sonido_5c:		; pide el sonido 0x5C
	ld a,05ch		;6c77
	jr L_6CA3		;6c79
sonido_5d:		; pide el sonido 0x5D
	ld a,05dh		;6c7b
	jr L_6CA3		;6c7d
sonido_5e:		; pide el sonido 0x5E
	ld a,05eh		;6c7f
	jr L_6CA3		;6c81
sonido_5f:		; pide el sonido 0x5F
	ld a,05fh		;6c83
	jr L_6CA3		;6c85
sonido_60:		; pide el sonido 0x60
	ld a,060h		;6c87
	jr L_6CA3		;6c89
sonido_61:		; pide el sonido 0x61
	ld a,061h		;6c8b
	jr L_6CA3		;6c8d
sonido_62:		; pide el sonido 0x62
	ld a,062h		;6c8f
	jr L_6CA3		;6c91
sonido_63:		; pide el sonido 0x63
	ld a,063h		;6c93
	jr L_6CA3		;6c95
sonido_87:		; pide el sonido 0x87 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld a,087h		;6c97
	jr L_6CA3		;6c99
sonido_88:		; pide el sonido 0x88 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld a,088h		;6c9b
	jr L_6CA3		;6c9d
sonido_95:		; pide el sonido 0x95 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld a,095h		;6c9f
	jr L_6CA3		;6ca1
L_6CA3:
	jp 0c340h		;6ca3
sonido_89:		; pide el sonido 0x89 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld a,089h		;6ca6
	jr L_6CA3		;6ca8
sonido_8a:		; pide el sonido 0x8A (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld a,08ah		;6caa
	jr L_6CA3		;6cac
sonido_64:		; pide el sonido 0x64
	ld a,064h		;6cae
	jr L_6CA3		;6cb0
sonido_98:		; pide el sonido 0x98 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld a,098h		;6cb2
	jr L_6CA3		;6cb4
sonido_65:		; pide el sonido 0x65
	ld a,065h		;6cb6
	jr L_6CA3		;6cb8
sonido_97:		; pide el sonido 0x97 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld a,097h		;6cba
	jr L_6CA3		;6cbc
sonido_96:		; pide el sonido 0x96 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld a,096h		;6cbe
	jr L_6CA3		;6cc0
sonido_a0:		; pide el sonido 0xA0 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld a,0a0h		;6cc2
	jr L_6CA3		;6cc4
sonido_8b:		; pide el sonido 0x8B (de los que tienen la partitura en un banco de musica, p16:4CE3)
	ld a,08bh		;6cc6
	jr L_6CA3		;6cc8
sonido_66:		; pide el sonido 0x66
	ld a,066h		;6cca
	jr L_6CA3		;6ccc
sonido_67:		; pide el sonido 0x67
	ld a,067h		;6cce
	jr L_6CA3		;6cd0
sonido_68:		; pide el sonido 0x68
	ld a,068h		;6cd2
	jr L_6CA3		;6cd4
sonido_69:		; pide el sonido 0x69
	ld a,069h		;6cd6
	jr L_6CA3		;6cd8
sin_musica_pendiente:		; 0xCA19 = 0: ninguna musica pendiente
	push hl			;6cda
	ld hl,00000h		;6cdb
	ld (0ca19h),hl		;6cde   ; guarda la musica pendiente: la rutina que la pide (16 bits)
	pop hl			;6ce1
	ret			;6ce2
pantalla_de_52:		; una pantalla de los bancos 52-53: dibujos, mosaicos, una rejilla de lineas y sprites
	call dibujos_52_cabecera		;6ce3   ; dibujos_52_cabecera: los dibujos de p52:8114 en la VRAM de 0 y los de p52:811F en la de 0x6000
	call 04127h		;6ce6   ; bancos_52_53: pone el 52 en 0x8000, el 53 en 0xA000 (con su copia en 0xC381-0xC383)
	ld hl,082b8h		;6ce9   ; los dibujos de p52:82B8 en la VRAM de 0...
	ld de,08000h		;6cec   ; tabla_colores_8000: 53 punteros a colores de dibujo
	call 04d4ah		;6cef   ; dibujos_en_0000: en la VRAM de 0x0000
	ld hl,08135h		;6cf2   ; ...los de p52:8135 en la de 0x2000...
	call 04d4eh		;6cf5   ; dibujos_en_2000: en la VRAM de 0x2000
	ld hl,08195h		;6cf8   ; ...y los de p52:8195 en la de 0x4000
	call 04d52h		;6cfb   ; dibujos_en_4000: en la VRAM de 0x4000
	ld a,055h		;6cfe   ; 0xCA75 = 0x55
	ld (0ca75h),a		;6d00   ; guarda los bits de los juegos de piezas de la zona (p56:A713; p00:4A58)
	xor a			;6d03   ; se dibuja en la 0
	ld (0ca42h),a		;6d04   ; guarda la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	ld d,001h		;6d07   ; la pagina 1 a cero
	call 04be4h		;6d09   ; borra_toda_la_pagina: p00:46FF desde (0,0) con BC = 0 y A = 0 en la pagina D
	ld hl,08336h		;6d0c   ; los mosaicos de p52:8336 con los juegos 0 y 1...
	ld de,00100h		;6d0f
	call lista_de_mosaicos		;6d12   ; lista_de_mosaicos: fichas [VRAM][filas][columnas][puntero] hasta 0xFF
	inc hl			;6d15
	ld de,00302h		;6d16   ; ...los siguientes con el 2 y el 3...
	call lista_de_mosaicos		;6d19   ; lista_de_mosaicos: fichas [VRAM][filas][columnas][puntero] hasta 0xFF
	inc hl			;6d1c
	ld de,00504h		;6d1d   ; ...y los ultimos con el 4 y el 5
	call lista_de_mosaicos		;6d20   ; lista_de_mosaicos: fichas [VRAM][filas][columnas][puntero] hasta 0xFF
	ld hl,0009eh		;6d23   ; 12 lineas horizontales desde X = 0, Y = 0x9E...
	ld d,00ch		;6d26
	ld bc,0ff06h		;6d28   ; ...de 0xFF de largo, en el color 6...
L_6D2B:
	ld a,003h		;6d2b   ; ...en la pagina 3...
	call 046e6h		;6d2d   ; linea_horizontal_guarda: p00:467C guardando AF, HL, DE y BC
	ld a,l			;6d30   ; ...cada 8 lineas
	add a,008h		;6d31
	ld l,a			;6d33
	dec d			;6d34
	jr nz,L_6D2B		;6d35
	ld hl,00698h		;6d37   ; 31 verticales desde X = 6, Y = 0x98...
	ld d,01fh		;6d3a
	ld bc,06806h		;6d3c   ; ...de 0x68 de alto, en el color 6...
L_6D3F:
	ld a,003h		;6d3f
	call 046dah		;6d41   ; linea_vertical_guarda: p00:4680 guardando AF, HL, DE y BC
	ld a,h			;6d44   ; ...cada 8 puntos
	add a,008h		;6d45
	ld h,a			;6d47
	dec d			;6d48
	jr nz,L_6D3F		;6d49
	ld hl,00098h		;6d4b   ; la franja de Y = 0x98 (0x68 lineas)...
	ld d,h			;6d4e
	ld e,l			;6d4f
	ld bc,00068h		;6d50
	ld a,078h		;6d53   ; ...de la 3 a la 0 con TIMP
	call 047edh		;6d55   ; copia_rectangulo_logica: orden LMMM del VDP con la operacion logica de A
	ld de,0bbcah		;6d58   ; los sprites de p53:BBCA...
	ld hl,0f800h		;6d5b   ; ...a los patrones (0xF800)
	xor a			;6d5e
	call 0456eh		;6d5f   ; rachas_a_vram_tal_cual: p00:453E sin voltear (C = 0)
	jp 040f0h		;6d62   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
lista_de_mosaicos:		; fichas [VRAM][filas][columnas][puntero] hasta 0xFF
	ld (0ca4ch),de		;6d65   ; los dos juegos de piezas
L_6D69:
	ld a,(hl)			;6d69   ; la ficha; 0xFF acaba
	inc a			;6d6a
	ret z			;6d6b
	ld e,(hl)			;6d6c   ; DE = el sitio
	inc hl			;6d6d
	ld d,(hl)			;6d6e
	inc hl			;6d6f
	ld b,(hl)			;6d70   ; B = las filas, C = las columnas
	inc hl			;6d71
	ld c,(hl)			;6d72
	inc hl			;6d73
	ld a,(hl)			;6d74   ; HL = el mosaico
	inc hl			;6d75
	push hl			;6d76
	ld h,(hl)			;6d77
	ld l,a			;6d78
	push de			;6d79
	push bc			;6d7a
	call deshace_en_e500		;6d7b   ; deshecho en 0xE500
	pop bc			;6d7e
	pop de			;6d7f
	ld hl,0e500h		;6d80   ; y pintado
	call pinta_mosaico_e500		;6d83   ; pinta_mosaico_e500: B filas de C caracteres de 0xE500 en (D, E), los distintos de 0, de la pagina 2 a la otra
	pop hl			;6d86
	inc hl			;6d87   ; la ficha siguiente
	jr L_6D69		;6d88
pinta_mosaico_e500:		; B filas de C caracteres de 0xE500 en (D, E), los distintos de 0, de la pagina 2 a la otra
	push bc			;6d8a
	push de			;6d8b
	ld b,c			;6d8c
L_6D8D:
	ld a,(hl)			;6d8d   ; el caracter...
	and a			;6d8e
	call nz,04a0bh		;6d8f   ; ...si no es 0, se pinta
	ld a,d			;6d92   ; 8 puntos a la derecha
	add a,008h		;6d93
	ld d,a			;6d95
	inc hl			;6d96
	djnz L_6D8D		;6d97
	pop de			;6d99
	ld a,e			;6d9a   ; la fila siguiente, 8 lineas mas abajo
	add a,008h		;6d9b
	ld e,a			;6d9d
	pop bc			;6d9e
	djnz pinta_mosaico_e500		;6d9f
	ret			;6da1
deshace_en_e500:		; a 0xE500
	ld de,0e500h		;6da2
deshace_f7:		; deshace en 0xE500 un mosaico comprimido (0xF7-0xFE repite, 0xFF acaba)
	ld a,(hl)			;6da5   ; el byte; 0xFF acaba
	cp 0ffh		;6da6
	ret z			;6da8
	sub 0f7h		;6da9   ; 0xF7-0xFE: una racha de 1-8 (el byte de detras)
	jr nc,L_6DB1		;6dab
	ldi		;6dad   ; los demas, tal cual
	jr deshace_f7		;6daf
L_6DB1:
	ld b,a			;6db1   ; B = cuantas
	inc hl			;6db2
	ld a,(hl)			;6db3   ; el byte de la racha
L_6DB4:
	ld (de),a			;6db4
	inc de			;6db5
	djnz L_6DB4		;6db6
	inc hl			;6db8
	jr deshace_f7		;6db9
dibujos_52_cabecera:		; los dibujos de p52:8114 en la VRAM de 0 y los de p52:811F en la de 0x6000
	call 04127h		;6dbb   ; bancos_52_53: pone el 52 en 0x8000, el 53 en 0xA000 (con su copia en 0xC381-0xC383)
	ld hl,08114h		;6dbe   ; lista_8114: 2 fichas de dibujo de 5 bytes [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF
	ld de,08000h		;6dc1   ; tabla_colores_8000: 53 punteros a colores de dibujo
	call 04d4ah		;6dc4   ; dibujos_en_0000: en la VRAM de 0x0000
	ld hl,0811fh		;6dc7   ; lista_811F: 2 fichas de dibujo de 5 bytes [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF
	call 04d56h		;6dca   ; dibujos_en_6000: en la VRAM de 0x6000
	jr L_6DE6		;6dcd
dibujos_812a:		; los dibujos de p52:812A en la VRAM de 0xA000
	call 04127h		;6dcf   ; bancos_52_53: pone el 52 en 0x8000, el 53 en 0xA000 (con su copia en 0xC381-0xC383)
	ld hl,0812ah		;6dd2   ; lista_812A: 2 fichas de dibujo de 5 bytes [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF
	ld de,08000h		;6dd5   ; tabla_colores_8000: 53 punteros a colores de dibujo
	jr dibujos_en_a000_b_1_2_3		;6dd8
dibujos_b58b:		; los dibujos de p58:B58B en la VRAM de 0xA000
	call 04193h		;6dda   ; bancos_58: pone el 58 en 0xA000 (con su copia en 0xC381-0xC383)
	ld de,0b567h		;6ddd   ; tabla_colores_B567: 8 punteros a colores de dibujo
	ld hl,0b58bh		;6de0   ; lista_B58B: 15 fichas de dibujo de 5 bytes [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF
dibujos_en_a000_b_1_2_3:		; dibujos_en_a000 y deja los bancos 1, 2 y 3
	call 04d3eh		;6de3   ; dibujos_en_a000: en la VRAM de 0xA000
L_6DE6:
	jp 040f0h		;6de6   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
dibujos_8114_en_a000:		; los dibujos de p52:8114 en la VRAM de 0xA000
	call 04127h		;6de9   ; bancos_52_53: pone el 52 en 0x8000, el 53 en 0xA000 (con su copia en 0xC381-0xC383)
	ld hl,08114h		;6dec   ; lista_8114: 2 fichas de dibujo de 5 bytes [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF
	ld de,08000h		;6def   ; tabla_colores_8000: 53 punteros a colores de dibujo
	jr dibujos_en_a000_b_1_2_3		;6df2
paleta_aa44:		; la paleta de p14:AA44
	call 04179h		;6df4   ; bancos_13_14: pone el 13 en 0x8000, el 14 en 0xA000 (con su copia en 0xC381-0xC383)
	ld hl,0aa44h		;6df7
	call 0463fh		;6dfa   ; pon_paleta_con_espera: pone la paleta de HL (p00:4642) esperando al VDP antes
	jr L_6DE6		;6dfd
dibujos_8037:		; los dibujos de p46:8037 en la VRAM de 0xA000
	call 04171h		;6dff   ; bancos_46_47: pone el 46 en 0x8000, el 47 en 0xA000 (con su copia en 0xC381-0xC383)
	ld de,08000h		;6e02   ; tabla_colores_8000: 13 punteros a colores de dibujo
	ld hl,08037h		;6e05   ; lista_8037: 17 fichas de dibujo de 5 bytes [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF
	call 04d3eh		;6e08   ; dibujos_en_a000: en la VRAM de 0xA000
	jr L_6DE6		;6e0b
rachas_bba0:		; las rachas de p41:BBA0 con su destino
	call 04162h		;6e0d   ; bancos_40_41: pone el 40 en 0x8000, el 41 en 0xA000 (con su copia en 0xC381-0xC383)
	ld de,0bba0h		;6e10
	call 04534h		;6e13   ; rachas_otro_destino: la orden 0x80 de las rachas: [pagina][VRAM lo hi] y sigue
	jr L_6DE6		;6e16
dibujos_de_93e5:		; la lista de dibujos A de p44:93E5 en la VRAM de 0x6000
	call 0416ch		;6e18   ; bancos_44_45: pone el 44 en 0x8000, el 45 en 0xA000 (con su copia en 0xC381-0xC383)
	ld hl,093e5h		;6e1b   ; tabla_dibujos_93E5: 12 punteros a listas de dibujos
	call 043f6h		;6e1e   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld de,092b8h		;6e21   ; tabla_colores_92B8: 15 punteros a colores de dibujo
	call 04d56h		;6e24   ; dibujos_en_6000: en la VRAM de 0x6000
	jr L_6DE6		;6e27
mapa_de_bits_8098:		; el mapa de bits de p57:8098 en la VRAM de 0x0820
	ld de,00820h		;6e29
mapa_de_bits_8098_en:		; el mapa de bits de p57:8098 (0xA8 filas de 0x40 bytes) en la VRAM de DE
	call 0412ch		;6e2c   ; bancos_57_58: pone el 57 en 0x8000, el 58 en 0xA000 (con su copia en 0xC381-0xC383)
	ld hl,08098h		;6e2f   ; mapa_de_bits_8098: mapa de bits de 168 filas de 64 bytes
	ld bc,0a840h		;6e32
L_6E35:
	push bc			;6e35   ; una fila
	push de			;6e36
	xor a			;6e37
	ld b,a			;6e38
	call 04486h		;6e39   ; copia_a_vram_espera: espera al VDP (p00:4650) y copia BC bytes de HL a la VRAM de DE
	pop de			;6e3c
	pop bc			;6e3d
	ld a,080h		;6e3e   ; la siguiente: 128 bytes mas
	call 04243h		;6e40   ; suma_a_de: DE = DE + A
	djnz L_6E35		;6e43
	jp 04179h		;6e45   ; bancos_13_14: pone el 13 en 0x8000, el 14 en 0xA000 (con su copia en 0xC381-0xC383)
pantalla_de_62:		; una pantalla de los bancos 60-63: mapas de bits, rachas y 4 juegos de letras
	call 04136h		;6e48   ; bancos_62_63: pone el 62 en 0x8000, el 63 en 0xA000 (con su copia en 0xC381-0xC383)
	ld de,00000h		;6e4b   ; el mapa de bits de p62:8000 en la VRAM de 0x10000...
	ld hl,08000h		;6e4e   ; mapa_de_bits_8000: mapa de bits de 112 filas de 80 bytes
	ld bc,l7050h		;6e51   ; ...0x70 filas de 0x50 bytes
	call copia_mapa_de_bits		;6e54   ; copia_mapa_de_bits: B filas de C bytes de HL a la VRAM de DE, 128 bytes por fila
	ld de,03800h		;6e57   ; las rachas de p63:A300 en 0x13800, 0x80 filas de 0x40
	ld hl,0a300h		;6e5a   ; rachas_A300: rachas de p00
	ld bc,08040h		;6e5d
	call rachas_y_mapa_de_bits		;6e60   ; rachas_y_mapa_de_bits: deshace en 0xD000 las rachas de HL y las copia como p01:6ED6
	call 04131h		;6e63   ; bancos_60_61: pone el 60 en 0x8000, el 61 en 0xA000 (con su copia en 0xC381-0xC383)
	call mapa_de_bits_9c58		;6e66   ; p01:6EB4
	ld de,03840h		;6e69   ; las rachas de p61:AF99 en 0x13840
	ld hl,0af99h		;6e6c   ; rachas_AF99: rachas de p00
	ld bc,08040h		;6e6f
	call rachas_y_mapa_de_bits		;6e72   ; rachas_y_mapa_de_bits: deshace en 0xD000 las rachas de HL y las copia como p01:6ED6
	ld hl,08000h		;6e75   ; las letras de p60:8000 en la fila 0...
	ld e,000h		;6e78
	ld b,e			;6e7a
	call letras_en_4_bits		;6e7b   ; letras_en_4_bits: B letras de HL en la fila E, con el color 15
	ld hl,08800h		;6e7e   ; ...las de p60:8800 en la 0x40...
	ld e,040h		;6e81
	ld b,000h		;6e83
	call letras_en_4_bits		;6e85   ; letras_en_4_bits: B letras de HL en la fila E, con el color 15
	ld hl,09000h		;6e88   ; ...las de p60:9000 en la 0x80...
	ld e,080h		;6e8b
	ld b,000h		;6e8d
	call letras_en_4_bits		;6e8f   ; letras_en_4_bits: B letras de HL en la fila E, con el color 15
	ld hl,09800h		;6e92   ; ...y 139 de p60:9800 en la 0xC0
	ld e,0c0h		;6e95
	ld b,08bh		;6e97
	call letras_en_4_bits		;6e99   ; letras_en_4_bits: B letras de HL en la fila E, con el color 15
	ld hl,030e0h		;6e9c   ; el rectangulo de X = 0x30, Y = 0xE0...
	ld de,008e8h		;6e9f   ; ...a X = 8, Y = 0xE8...
	ld bc,03808h		;6ea2   ; ...0x38 x 8...
	ld a,00fh		;6ea5   ; ...de la 3 a la 3
	call 04767h		;6ea7   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
	jp 040f0h		;6eaa   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
letras_en_4_bits:		; B letras de HL en la fila E, con el color 15
	ld d,000h		;6ead
	ld c,00fh		;6eaf
	jp 0489ch		;6eb1   ; caracteres_a_4_bits: B caracteres de un bit pasados a cuatro con el color C
mapa_de_bits_9c58:		; el mapa de bits de p60:9C58 (0x70 filas de 0x2C) en la VRAM de 0x10050
	ld de,00050h		;6eb4
	ld hl,09c58h		;6eb7
	ld bc,0702ch		;6eba
	jp copia_mapa_de_bits		;6ebd   ; copia_mapa_de_bits: B filas de C bytes de HL a la VRAM de DE, 128 bytes por fila
mapa_de_bits_9c58_bancos:
	call 04131h		;6ec0   ; bancos_60_61: pone el 60 en 0x8000, el 61 en 0xA000 (con su copia en 0xC381-0xC383)
	call mapa_de_bits_9c58		;6ec3   ; mapa_de_bits_9c58: el mapa de bits de p60:9C58 (0x70 filas de 0x2C) en la VRAM de 0x10050
	jp 04176h		;6ec6   ; bancos_1_13_14: pone el 1 en 0x6000, el 13 en 0x8000, el 14 en 0xA000 (con su copia en 0xC381-0xC383)
rachas_y_mapa_de_bits:		; deshace en 0xD000 las rachas de HL y las copia como p01:6ED6
	push de			;6ec9   ; DE = las rachas
	push bc			;6eca
	ex de,hl			;6ecb
	ld hl,0d000h		;6ecc   ; deshechas en 0xD000
	push hl			;6ecf
	call 051e0h		;6ed0   ; rachas_a_ram: deshace las rachas de DE en HL (n < 0x80 repite, n > 0x80 copia, 0 acaba)
	pop hl			;6ed3
	pop bc			;6ed4
	pop de			;6ed5
copia_mapa_de_bits:		; B filas de C bytes de HL a la VRAM de DE, 128 bytes por fila
	push bc			;6ed6
	push de			;6ed7
	ld a,001h		;6ed8   ; en la mitad alta de la VRAM
	ld b,000h		;6eda   ; C bytes
	call 04486h		;6edc   ; copia_a_vram_espera: espera al VDP (p00:4650) y copia BC bytes de HL a la VRAM de DE
	pop de			;6edf
	pop bc			;6ee0
	ld a,080h		;6ee1   ; la fila siguiente: 128 bytes
	call 04243h		;6ee3   ; suma_a_de: DE = DE + A
	djnz copia_mapa_de_bits		;6ee6
	ret			;6ee8
dibujos_86a1:		; los dibujos de p46:86A1 y p41:B909 en la VRAM de 0xE000
	call 04171h		;6ee9   ; bancos_46_47: pone el 46 en 0x8000, el 47 en 0xA000 (con su copia en 0xC381-0xC383)
	ld de,0863dh		;6eec   ; tabla_colores_863D: 21 punteros a colores de dibujo
	ld hl,086a1h		;6eef   ; lista_86A1: 23 fichas de dibujo de 5 bytes [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF
	call 04d46h		;6ef2   ; dibujos_en_e000: en la VRAM de 0xE000
	call 04162h		;6ef5   ; bancos_40_41: pone el 40 en 0x8000, el 41 en 0xA000 (con su copia en 0xC381-0xC383)
	ld de,0b905h		;6ef8   ; tabla_colores_B905: 1 punteros a colores de dibujo
	ld hl,0b909h		;6efb   ; lista_B909: 1 fichas de dibujo de 5 bytes [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF
	call 04d46h		;6efe   ; dibujos_en_e000: en la VRAM de 0xE000
	call 040f0h		;6f01   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	jp mosaico_a412		;6f04   ; mosaico_a412: el mosaico de p56:A412 en X = 0, Y = 0x80: 8 filas de 32
letras_b093:		; 0x26 letras de p58:B093 en 4 bits, con el color 5, a la VRAM de 0x0080
	call 0412ch		;6f07   ; bancos_57_58: pone el 57 en 0x8000, el 58 en 0xA000 (con su copia en 0xC381-0xC383)
	ld de,00080h		;6f0a
	ld hl,0b093h		;6f0d
	ld bc,02605h		;6f10
	call 0489ch		;6f13   ; caracteres_a_4_bits: B caracteres de un bit pasados a cuatro con el color C
L_6F16:
	jp 04176h		;6f16   ; bancos_1_13_14: pone el 1 en 0x6000, el 13 en 0x8000, el 14 en 0xA000 (con su copia en 0xC381-0xC383)
dibujos_8114_en_e000:		; los dibujos de p52:8114 en la VRAM de 0xE000
	call 04127h		;6f19   ; bancos_52_53: pone el 52 en 0x8000, el 53 en 0xA000 (con su copia en 0xC381-0xC383)
	ld hl,08114h		;6f1c   ; lista_8114: 2 fichas de dibujo de 5 bytes [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF
	ld de,08000h		;6f1f   ; tabla_colores_8000: 53 punteros a colores de dibujo
	call 04d46h		;6f22   ; dibujos_en_e000: en la VRAM de 0xE000
	jr L_6F16		;6f25
rachas_de_ca61:		; con 0xCA61, las rachas A - 1 de la tabla de p41:BC04
	ld a,(0ca61h)		;6f27
	or a			;6f2a
	ret z			;6f2b
	call 04162h		;6f2c   ; bancos_40_41: pone el 40 en 0x8000, el 41 en 0xA000 (con su copia en 0xC381-0xC383)
	dec a			;6f2f
	ld de,0bc04h		;6f30
	call 04403h		;6f33   ; palabra_de_tabla_de: DE = la palabra A de la tabla de DE
	call 04534h		;6f36   ; rachas_otro_destino: la orden 0x80 de las rachas: [pagina][VRAM lo hi] y sigue
	jp 041d2h		;6f39   ; bancos_1_2_11: pone el 1 en 0x6000, el 2 en 0x8000, el 11 en 0xA000 (con su copia en 0xC381-0xC383)
dibujos_9eb2:		; los dibujos de p46:9EB2 en la VRAM de 0x6000
	call 04171h		;6f3c   ; bancos_46_47: pone el 46 en 0x8000, el 47 en 0xA000 (con su copia en 0xC381-0xC383)
	ld de,09ea2h		;6f3f   ; tabla_colores_9EA2: 3 punteros a colores de dibujo
	ld hl,09eb2h		;6f42   ; lista_9EB2: 6 fichas de dibujo de 5 bytes [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF
	call 04d56h		;6f45   ; dibujos_en_6000: en la VRAM de 0x6000
	jr L_6F53		;6f48
rachas_a81b:		; las rachas de p47:A81B
	ld de,0a81bh		;6f4a
	call 04171h		;6f4d   ; bancos_46_47: pone el 46 en 0x8000, el 47 en 0xA000 (con su copia en 0xC381-0xC383)
rachas_otro_destino_b_1_2_9:		; rachas_otro_destino y deja los bancos 1, 2 y 9
	call 04534h		;6f50   ; rachas_otro_destino: la orden 0x80 de las rachas: [pagina][VRAM lo hi] y sigue
L_6F53:
	jp 041c2h		;6f53   ; bancos_1_2_9: pone el 1 en 0x6000, el 2 en 0x8000, el 9 en 0xA000 (con su copia en 0xC381-0xC383)
rachas_ba0f:		; las rachas de p41:BA0F
	ld de,0ba0fh		;6f56
	call 04162h		;6f59   ; bancos_40_41: pone el 40 en 0x8000, el 41 en 0xA000 (con su copia en 0xC381-0xC383)
	jr rachas_otro_destino_b_1_2_9		;6f5c
rachas_a81b_bancos_5:
	ld de,0a81bh		;6f5e
	call 04171h		;6f61   ; bancos_46_47: pone el 46 en 0x8000, el 47 en 0xA000 (con su copia en 0xC381-0xC383)
rachas_otro_destino_b_1_4_5:		; rachas_otro_destino y deja los bancos 1, 4 y 5
	call 04534h		;6f64   ; rachas_otro_destino: la orden 0x80 de las rachas: [pagina][VRAM lo hi] y sigue
	jp 0413fh		;6f67   ; bancos_1_4_5: pone el 1 en 0x6000, el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
rachas_be79:		; las rachas de p43:BE79
	ld de,0be79h		;6f6a
	call 04167h		;6f6d   ; bancos_42_43: pone el 42 en 0x8000, el 43 en 0xA000 (con su copia en 0xC381-0xC383)
	jr rachas_otro_destino_b_1_4_5		;6f70
rachas_9638_bancos_9:
	call rachas_9638		;6f72   ; rachas_9638: las rachas de p37:9638 a la VRAM de 0x1E280 y una franja de la pagina 3 a la 3
	jp 041c2h		;6f75   ; bancos_1_2_9: pone el 1 en 0x6000, el 2 en 0x8000, el 9 en 0xA000 (con su copia en 0xC381-0xC383)
rachas_9638:		; las rachas de p37:9638 a la VRAM de 0x1E280 y una franja de la pagina 3 a la 3
	call 04158h		;6f78   ; bancos_36_37: pone el 36 en 0x8000, el 37 en 0xA000 (con su copia en 0xC381-0xC383)
	ld de,09638h		;6f7b   ; rachas_9638: datos en rachas a la VRAM
	ld hl,0e280h		;6f7e
	ld a,001h		;6f81
	call 0456eh		;6f83   ; rachas_a_vram_tal_cual: p00:453E sin voltear (C = 0)
	call 040f0h		;6f86   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	ld hl,080d6h		;6f89   ; X = 0x80, Y = 0xD6...
	ld de,006e2h		;6f8c   ; ...a Y = 0xE2, 6 lineas...
	ld a,00fh		;6f8f   ; ...de la 3 a la 3 (YMMM)
	jp 047abh		;6f91   ; copia_en_y: orden YMMM del VDP
dibujos_b9c8:		; los dibujos de p45:B9C8 con los colores de p45:B9B2 en la VRAM de 0x6000
	ld hl,0b9c8h		;6f94
dibujos_de_45:		; los dibujos de HL con los colores de p45:B9B2 en la VRAM de 0x6000
	ld de,0b9b2h		;6f97
	call 0416ch		;6f9a   ; bancos_44_45: pone el 44 en 0x8000, el 45 en 0xA000 (con su copia en 0xC381-0xC383)
	call 04d56h		;6f9d   ; dibujos_en_6000: en la VRAM de 0x6000
	jp 041c2h		;6fa0   ; bancos_1_2_9: pone el 1 en 0x6000, el 2 en 0x8000, el 9 en 0xA000 (con su copia en 0xC381-0xC383)
dibujos_b9e1:		; los dibujos de p45:B9E1
	ld hl,0b9e1h		;6fa3
	jr dibujos_de_45		;6fa6
rachas_bc6e_bancos_14:
	call rachas_bc6e		;6fa8   ; rachas_bc6e: las rachas de p41:BC6E a la VRAM de 0xFE00
	jp 041efh		;6fab   ; bancos_14: pone el 14 en 0xA000 (con su copia en 0xC381-0xC383)
rachas_bc6e:		; las rachas de p41:BC6E a la VRAM de 0xFE00
	call 04162h		;6fae   ; bancos_40_41: pone el 40 en 0x8000, el 41 en 0xA000 (con su copia en 0xC381-0xC383)
	ld de,0bc6eh		;6fb1   ; rachas_BC6E: datos en rachas a la VRAM
	ld hl,0fe00h		;6fb4
L_6FB7:
	xor a			;6fb7
	call 0456eh		;6fb8   ; rachas_a_vram_tal_cual: p00:453E sin voltear (C = 0)
	jp 0413fh		;6fbb   ; bancos_1_4_5: pone el 1 en 0x6000, el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
rachas_bd99:		; las rachas de p41:BD99 a la VRAM de 0xFA00
	call 04162h		;6fbe   ; bancos_40_41: pone el 40 en 0x8000, el 41 en 0xA000 (con su copia en 0xC381-0xC383)
	ld de,0bd99h		;6fc1   ; rachas_BD99: datos en rachas a la VRAM
	ld hl,0fa00h		;6fc4
	jr L_6FB7		;6fc7
paleta_a1d8:		; la paleta de p56:A1D8
	call 0418eh		;6fc9   ; bancos_56: pone el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	ld hl,0a1d8h		;6fcc
	call 0463fh		;6fcf   ; pon_paleta_con_espera: pone la paleta de HL (p00:4642) esperando al VDP antes
	jp 040f0h		;6fd2   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
rachas_a_ram_de_8:		; las rachas de DE (banco 8) en HL
	call 041bdh		;6fd5   ; bancos_8: pone el 8 en 0xA000 (con su copia en 0xC381-0xC383)
	call 051e0h		;6fd8   ; rachas_a_ram: deshace las rachas de DE en HL (n < 0x80 repite, n > 0x80 copia, 0 acaba)
	jr L_703F		;6fdb
palabra_de_96ab:		; HL = la palabra A de p46:96AB
	call 04171h		;6fdd   ; bancos_46_47: pone el 46 en 0x8000, el 47 en 0xA000 (con su copia en 0xC381-0xC383)
	ld hl,096abh		;6fe0
	call 043f6h		;6fe3   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	jr L_703F		;6fe6
mosaico_a412:		; el mosaico de p56:A412 en X = 0, Y = 0x80: 8 filas de 32
	call 0418eh		;6fe8   ; bancos_56: pone el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	ld hl,0a412h		;6feb   ; mosaico_A412: un mosaico de 8 x 32 caracteres, un byte cada uno
	ld de,00080h		;6fee
	ld bc,00820h		;6ff1
	call 050f4h		;6ff4   ; mosaico_f4_b3: el mosaico de HL en (D, E), B filas de C caracteres, con la forma 4 de la franja 3 (p00:512C)
	jr L_703F		;6ff7
mosaicos_del_marcador:		; cuatro mosaicos del banco 46 en el marcador
	call 04171h		;6ff9   ; bancos_46_47: pone el 46 en 0x8000, el 47 en 0xA000 (con su copia en 0xC381-0xC383)
	ld hl,0965dh		;6ffc   ; p46:965D en X = 8, Y = 0xC0, 2 x 3
	ld de,008c0h		;6fff
	ld bc,00203h		;7002
	call 0509ah		;7005   ; mosaico_f1_b1: el mosaico de HL en (D, E), B filas de C caracteres, con la forma 1 de la franja 1 (p00:512C)
	ld hl,09667h		;7008   ; p46:9667 en X = 0xC0, Y = 0x50, 2 x 8
	ld de,0c050h		;700b
	ld bc,00208h		;700e
	call 0509ah		;7011   ; mosaico_f1_b1: el mosaico de HL en (D, E), B filas de C caracteres, con la forma 1 de la franja 1 (p00:512C)
	ld hl,09677h		;7014   ; p46:9677 en X = 0xC8, Y = 0x68, 6 x 6
	ld de,0c868h		;7017
	ld bc,00606h		;701a
	call 0509ah		;701d   ; mosaico_f1_b1: el mosaico de HL en (D, E), B filas de C caracteres, con la forma 1 de la franja 1 (p00:512C)
	ld hl,09677h		;7020   ; y otra vez en X = 0xC8, Y = 0x98
	ld de,0c898h		;7023
	ld bc,00606h		;7026
	jr L_703C		;7029
mosaico_969b:		; el mosaico de p46:969B en X = 0xD0, Y = 4 (2 x 4)
	ld hl,0969bh		;702b   ; mosaico_969B: un mosaico de 2 x 4 caracteres, un byte cada uno
	jr L_7033		;702e
mosaico_96a3:		; el mosaico de p46:96A3 en X = 0xD0, Y = 4 (2 x 4)
	ld hl,096a3h		;7030   ; mosaico_96A3: un mosaico de 2 x 4 caracteres, un byte cada uno
L_7033:
	call 04171h		;7033   ; bancos_46_47: pone el 46 en 0x8000, el 47 en 0xA000 (con su copia en 0xC381-0xC383)
	ld de,0d004h		;7036
	ld bc,00204h		;7039
L_703C:
	call 0509ah		;703c   ; mosaico_f1_b1: el mosaico de HL en (D, E), B filas de C caracteres, con la forma 1 de la franja 1 (p00:512C)
L_703F:
	jp 040f0h		;703f   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
marco_derecha_cac4_bancos_10:
	call marco_derecha_cac4		;7042   ; marco_derecha_cac4: con la barra de la derecha: su rotulo y su marco con el ancho de 0xCAC4
	jp 041cah		;7045   ; bancos_1_2_10: pone el 1 en 0x6000, el 2 en 0x8000, el 10 en 0xA000 (con su copia en 0xC381-0xC383)
marco_derecha_cac4:		; con la barra de la derecha: su rotulo y su marco con el ancho de 0xCAC4
	ld a,(0cae2h)		;7048   ; lee 1 mientras se ve la barra de la derecha
	or a			;704b
	ret z			;704c
	call rotulo_barra_derecha		;704d   ; rotulo_barra_derecha: el rotulo de p46:9663 en X = 0x80, Y = 0xC0 (2 x 2)
L_7050:
	jp 042a8h		;7050   ; marco_barra_cac4: el marco de la barra de la derecha con el ancho de 0xCAC4
marco_derecha_ca54_bancos_10:
	call marco_derecha_ca54		;7053   ; marco_derecha_ca54: con la barra de la derecha: su rotulo y su marco con el ancho de 0xCA54
	jp 041cah		;7056   ; bancos_1_2_10: pone el 1 en 0x6000, el 2 en 0x8000, el 10 en 0xA000 (con su copia en 0xC381-0xC383)
marco_derecha_ca54:		; con la barra de la derecha: su rotulo y su marco con el ancho de 0xCA54
	ld a,(0cae2h)		;7059   ; lee 1 mientras se ve la barra de la derecha
	or a			;705c
	ret z			;705d
	call rotulo_barra_derecha		;705e   ; rotulo_barra_derecha: el rotulo de p46:9663 en X = 0x80, Y = 0xC0 (2 x 2)
	jp 042adh		;7061   ; marco_barra_ca54: el marco de la barra de la derecha con el ancho de 0xCA54
rotulo_barra_derecha:		; el rotulo de p46:9663 en X = 0x80, Y = 0xC0 (2 x 2)
	call 04171h		;7064   ; bancos_46_47: pone el 46 en 0x8000, el 47 en 0xA000 (con su copia en 0xC381-0xC383)
	ld hl,09663h		;7067   ; mosaico_9663: un mosaico de 2 x 4 caracteres, un byte cada uno
	ld de,080c0h		;706a
	ld bc,00202h		;706d
	jr L_703C		;7070
mapa_96bf_bancos_8:
	call mapa_96bf		;7072   ; mapa_96bf: el mapa de p46:96BF deshecho en 0xDD00, con los juegos de piezas 6 y 7, y pintado
	jp 041bdh		;7075   ; bancos_8: pone el 8 en 0xA000 (con su copia en 0xC381-0xC383)
mapa_96bf_en_la_otra_bancos_9:
	call mapa_96bf_en_la_otra		;7078   ; mapa_96bf_en_la_otra: p01:708E con la pagina de dibujar cambiada un momento
	jp 041c5h		;707b   ; bancos_9: pone el 9 en 0xA000 (con su copia en 0xC381-0xC383)
mapa_96bf_en_la_otra:		; p01:708E con la pagina de dibujar cambiada un momento
	ld hl,0ca42h		;707e   ; apunta a la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	ld a,(hl)			;7081
	push hl			;7082
	push af			;7083
	xor 001h		;7084
	ld (hl),a			;7086
	call mapa_96bf		;7087   ; mapa_96bf: el mapa de p46:96BF deshecho en 0xDD00, con los juegos de piezas 6 y 7, y pintado
	pop af			;708a
	pop hl			;708b
	ld (hl),a			;708c
	ret			;708d
mapa_96bf:		; el mapa de p46:96BF deshecho en 0xDD00, con los juegos de piezas 6 y 7, y pintado
	call 04171h		;708e   ; bancos_46_47: pone el 46 en 0x8000, el 47 en 0xA000 (con su copia en 0xC381-0xC383)
	ld hl,0dd00h		;7091   ; apunta a el mapa de la sala: 24 x 24 caracteres
	ld de,096bfh		;7094
	call 051e0h		;7097   ; rachas_a_ram: deshace las rachas de DE en HL (n < 0x80 repite, n > 0x80 copia, 0 acaba)
	call 040f0h		;709a   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	ld a,055h		;709d   ; 0xCA75 = 0x55
	ld hl,00706h		;709f   ; los juegos 6 y 7
	ld (0ca75h),a		;70a2   ; guarda los bits de los juegos de piezas de la zona (p56:A713; p00:4A58)
	ld (0ca4ch),hl		;70a5   ; guarda los 4 bits altos del byte de la sala (p56:BD28) y el byte siguiente (16 bits)
	call 04d1ch		;70a8   ; los dibujos de p32:7118
	jp 057aeh		;70ab   ; y el mapa
mosaico_de_93fd:		; el mosaico A de p44:93FD (6 x 4) en DE; 0xD8E3 = B elige la forma
	ld hl,0d8e3h		;70ae
	ld (hl),b			;70b1
	push af			;70b2
	push de			;70b3
	call 0416ch		;70b4   ; bancos_44_45: pone el 44 en 0x8000, el 45 en 0xA000 (con su copia en 0xC381-0xC383)
	ld hl,093fdh		;70b7   ; tabla_mosaicos_93FD: 12 punteros a mosaicos de 6 x 4 caracteres
	call 043f6h		;70ba   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld bc,00604h		;70bd
	call mosaico_segun_d8e3		;70c0   ; mosaico_segun_d8e3: 0xD8E3 = 0: la forma 2 de la franja 3; si no, la 5
	pop de			;70c3
	pop af			;70c4
	or a			;70c5   ; si A no era 0, ya esta
	jp nz,040f0h		;70c6   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	ld a,(0cb21h)		;70c9   ; con 0xCB21 = 1, otro de p44:95D1 (2 x 2) 8 puntos a la derecha y 0x20 mas abajo
	dec a			;70cc
	jp nz,040f0h		;70cd   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	ld hl,095d1h		;70d0   ; tabla_95D1: 4 destinos del despachador p00
	ld a,d			;70d3
	add a,008h		;70d4
	ld d,a			;70d6
	ld a,e			;70d7
	add a,020h		;70d8
	ld e,a			;70da
	ld bc,00202h		;70db
L_70DE:
	call mosaico_segun_d8e3		;70de   ; mosaico_segun_d8e3: 0xD8E3 = 0: la forma 2 de la franja 3; si no, la 5
	jp 040f0h		;70e1   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
mosaico_de_tabla_44:		; el mosaico A de la tabla de HL del banco 44 con la forma de 0xD8E3 = 0
	push af			;70e4
	xor a			;70e5
	ld (0d8e3h),a		;70e6
	pop af			;70e9
	call 0416ch		;70ea   ; bancos_44_45: pone el 44 en 0x8000, el 45 en 0xA000 (con su copia en 0xC381-0xC383)
	call 043f6h		;70ed   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	jr L_70DE		;70f0
mosaico_segun_d8e3:		; 0xD8E3 = 0: la forma 2 de la franja 3; si no, la 5
	ld a,(0d8e3h)		;70f2
	or a			;70f5
	jp z,050e8h		;70f6   ; mosaico_f2_b3: el mosaico de HL en (D, E), B filas de C caracteres, con la forma 2 de la franja 3 (p00:512C)
	jp 050fah		;70f9   ; mosaico_f5_b3: el mosaico de HL en (D, E), B filas de C caracteres, con la forma 5 de la franja 3 (p00:512C)
mosaico_a719:		; el mosaico de p47:A719 en X = 0x40, Y = 0, 0x13 filas de 8
	call 04171h		;70fc   ; bancos_46_47: pone el 46 en 0x8000, el 47 en 0xA000 (con su copia en 0xC381-0xC383)
	ld hl,0a719h		;70ff   ; mosaico_A719: un mosaico de 1 x 3 caracteres, un byte cada uno
	ld de,04000h		;7102
	ld bc,01308h		;7105
	jr L_711B		;7108
mosaico_a818:		; el mosaico de p47:A818 en X = 0x60, Y = 0x40 (1 x 3)
	ld hl,0a818h		;710a   ; mosaico_A818: un mosaico de 1 x 3 caracteres, un byte cada uno
	jr L_7112		;710d
mosaico_a815:		; el mosaico de p47:A815 en X = 0x60, Y = 0x40 (1 x 3)
	ld hl,0a815h		;710f   ; mosaico_A815: un mosaico de 1 x 3 caracteres, un byte cada uno
L_7112:
	call 04171h		;7112   ; bancos_46_47: pone el 46 en 0x8000, el 47 en 0xA000 (con su copia en 0xC381-0xC383)
	ld de,06040h		;7115
	ld bc,00103h		;7118
L_711B:
	call 050e8h		;711b   ; mosaico_f2_b3: el mosaico de HL en (D, E), B filas de C caracteres, con la forma 2 de la franja 3 (p00:512C)
L_711E:
	jp 041c2h		;711e   ; bancos_1_2_9: pone el 1 en 0x6000, el 2 en 0x8000, el 9 en 0xA000 (con su copia en 0xC381-0xC383)
mosaico_b9d8_f8:		; el mosaico de p45:B9D8 con la forma 8 de la franja 3
	call datos_b9d8		;7121   ; datos_b9d8: HL = p45:B9D8, DE = (0x88, 0x94), BC = 3 x 3
	call 05106h		;7124   ; mosaico_f8_b3: el mosaico de HL en (D, E), B filas de C caracteres, con la forma 8 de la franja 3 (p00:512C)
	jr L_711E		;7127
mosaico_b9d8_f7:		; el mosaico de p45:B9D8 con la forma 7 de la franja 3
	call datos_b9d8		;7129   ; datos_b9d8: HL = p45:B9D8, DE = (0x88, 0x94), BC = 3 x 3
	call 05100h		;712c   ; mosaico_f7_b3: el mosaico de HL en (D, E), B filas de C caracteres, con la forma 7 de la franja 3 (p00:512C)
	jr L_711E		;712f
datos_b9d8:		; HL = p45:B9D8, DE = (0x88, 0x94), BC = 3 x 3
	call 0416ch		;7131   ; bancos_44_45: pone el 44 en 0x8000, el 45 en 0xA000 (con su copia en 0xC381-0xC383)
	ld hl,0b9d8h		;7134
	ld de,08894h		;7137
	ld bc,00303h		;713a
	ret			;713d
mosaico_b9e7:		; el mosaico de p45:B9E7 en X = 0x68, Y = 0x37 (2 x 2)
	call 0416ch		;713e   ; bancos_44_45: pone el 44 en 0x8000, el 45 en 0xA000 (con su copia en 0xC381-0xC383)
	ld hl,0b9e7h		;7141   ; mosaico_B9E7: un mosaico de 2 x 2 caracteres, un byte cada uno
	ld de,06837h		;7144
	ld bc,00202h		;7147
	call 05106h		;714a   ; mosaico_f8_b3: el mosaico de HL en (D, E), B filas de C caracteres, con la forma 8 de la franja 3 (p00:512C)
	jr L_711E		;714d
mosaico_de_56_10x2:		; el mosaico de HL del banco 56 en X = 0x10, Y = 0x68, 10 x 2
	call 0418eh		;714f   ; bancos_56: pone el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	ld de,01068h		;7152
	ld bc,00a02h		;7155
	call 050a0h		;7158   ; mosaico_f2_b1: el mosaico de HL en (D, E), B filas de C caracteres, con la forma 2 de la franja 1 (p00:512C)
	jp 041d2h		;715b   ; bancos_1_2_11: pone el 1 en 0x6000, el 2 en 0x8000, el 11 en 0xA000 (con su copia en 0xC381-0xC383)
mosaico_bb4a:		; el mosaico en rachas de p54:BB4A (0x0B x 0x10) en X = 0x40, Y = 0x41
	call 04183h		;715e   ; bancos_54: pone el 54 en 0xA000 (con su copia en 0xC381-0xC383)
	ld de,0bb4ah		;7161
	ld hl,0e900h		;7164   ; apunta a los caracteres de un dibujo pasados a 4 bits
	call 051e0h		;7167   ; rachas_a_ram: deshace las rachas de DE en HL (n < 0x80 repite, n > 0x80 copia, 0 acaba)
	ld hl,0e900h		;716a   ; apunta a los caracteres de un dibujo pasados a 4 bits
	ld de,04041h		;716d
	ld bc,00b10h		;7170
	call 050e2h		;7173   ; mosaico_f7_b2: el mosaico de HL en (D, E), B filas de C caracteres, con la forma 7 de la franja 2 (p00:512C)
	jp 04179h		;7176   ; bancos_13_14: pone el 13 en 0x8000, el 14 en 0xA000 (con su copia en 0xC381-0xC383)
mosaico_bc95:		; el mosaico en rachas de p54:BC95 (5 x 0x0C) en X = 0x50, Y = 0x50
	call 04183h		;7179   ; bancos_54: pone el 54 en 0xA000 (con su copia en 0xC381-0xC383)
	ld de,0bc95h		;717c
	ld hl,0e900h		;717f   ; apunta a los caracteres de un dibujo pasados a 4 bits
	call 051e0h		;7182   ; rachas_a_ram: deshace las rachas de DE en HL (n < 0x80 repite, n > 0x80 copia, 0 acaba)
	ld hl,0e900h		;7185   ; apunta a los caracteres de un dibujo pasados a 4 bits
	ld de,05050h		;7188
	ld bc,0050ch		;718b
	jr L_719C		;718e
mosaico_bbd5:		; el mosaico de p54:BBD5 (0x0C x 0x10) en X = 0x40, Y = 0x38
	call 04183h		;7190   ; bancos_54: pone el 54 en 0xA000 (con su copia en 0xC381-0xC383)
	ld hl,0bbd5h		;7193   ; mosaico_BBD5: un mosaico de 12 x 16 caracteres, un byte cada uno
	ld de,04038h		;7196
	ld bc,00c10h		;7199
L_719C:
	call 050e8h		;719c   ; mosaico_f2_b3: el mosaico de HL en (D, E), B filas de C caracteres, con la forma 2 de la franja 3 (p00:512C)
	jp 04179h		;719f   ; bancos_13_14: pone el 13 en 0x8000, el 14 en 0xA000 (con su copia en 0xC381-0xC383)
mosaico_be74:		; el mosaico en rachas de p37:BE74 (0x14 x 0x0E) en X = 0x28, Y = 0x18, y p06:A0F9
	call 04158h		;71a2   ; bancos_36_37: pone el 36 en 0x8000, el 37 en 0xA000 (con su copia en 0xC381-0xC383)
	ld de,0be74h		;71a5
	ld hl,0e2c0h		;71a8
	call 051e0h		;71ab   ; rachas_a_ram: deshace las rachas de DE en HL (n < 0x80 repite, n > 0x80 copia, 0 acaba)
	ld hl,0e2c0h		;71ae
	ld de,02818h		;71b1
	ld bc,0140eh		;71b4
	call 050e8h		;71b7   ; mosaico_f2_b3: el mosaico de HL en (D, E), B filas de C caracteres, con la forma 2 de la franja 3 (p00:512C)
	call 0419dh		;71ba   ; bancos_1_2_6: pone el 1 en 0x6000, el 2 en 0x8000, el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a0f9h		;71bd   ; p06:A0F9
	jr L_71DA		;71c0
mosaico_de_d8cd:		; el mosaico 0xD8CD + 3 de p37:BF3E (1 x 2) en X = 0x58, Y = 0x20
	call 04158h		;71c2   ; bancos_36_37: pone el 36 en 0x8000, el 37 en 0xA000 (con su copia en 0xC381-0xC383)
	ld a,(0d8cdh)		;71c5
	add a,003h		;71c8
	add a,a			;71ca
	ld hl,0bf3eh		;71cb
	call 0423eh		;71ce   ; suma_a_hl: HL = HL + A
	ld de,05820h		;71d1
	ld bc,00102h		;71d4
	call 050e8h		;71d7   ; mosaico_f2_b3: el mosaico de HL en (D, E), B filas de C caracteres, con la forma 2 de la franja 3 (p00:512C)
L_71DA:
	jp 041adh		;71da   ; bancos_1_2_7: pone el 1 en 0x6000, el 2 en 0x8000, el 7 en 0xA000 (con su copia en 0xC381-0xC383)
mosaico_y_al_mapa:		; el mosaico en la pantalla (p01:71E9) y en el mapa (p01:62B1)
	push hl			;71dd
	push de			;71de
	push bc			;71df
	call mosaico_segun_zona		;71e0   ; mosaico_segun_zona: en la zona 6, la forma 2 de la franja 2; si no, la 2 de la franja 1
	pop bc			;71e3
	pop de			;71e4
	pop hl			;71e5
	jp copia_al_mapa_ldir		;71e6   ; copia_al_mapa_ldir: p01:62B5 con ldir
mosaico_segun_zona:		; en la zona 6, la forma 2 de la franja 2; si no, la 2 de la franja 1
	ld a,(0ca4ah)		;71e9   ; lee la zona
	cp 006h		;71ec
	jp z,050d6h		;71ee   ; mosaico_f2_b2: el mosaico de HL en (D, E), B filas de C caracteres, con la forma 2 de la franja 2 (p00:512C)
	jp 050a0h		;71f1   ; mosaico_f2_b1: el mosaico de HL en (D, E), B filas de C caracteres, con la forma 2 de la franja 1 (p00:512C)
palabra_de_96ab_bancos_10:
	call palabra_de_96ab		;71f4   ; palabra_de_96ab: HL = la palabra A de p46:96AB
	jp 041cah		;71f7   ; bancos_1_2_10: pone el 1 en 0x6000, el 2 en 0x8000, el 10 en 0xA000 (con su copia en 0xC381-0xC383)
paleta_bccf:		; la paleta de p56:BCCF
	call 0418eh		;71fa   ; bancos_56: pone el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	ld hl,0bccfh		;71fd
	call 0463fh		;7200   ; pon_paleta_con_espera: pone la paleta de HL (p00:4642) esperando al VDP antes
	jp 041b5h		;7203   ; bancos_1_4_8: pone el 1 en 0x6000, el 4 en 0x8000, el 8 en 0xA000 (con su copia en 0xC381-0xC383)
letras_de_la_pagina_3:		; la pagina 3 a cero y sus letras de un bit en 4 bits, con el color 7
	ld d,003h		;7206
	call 04be4h		;7208   ; borra_toda_la_pagina: p00:46FF desde (0,0) con BC = 0 y A = 0 en la pagina D
	call 04171h		;720b   ; bancos_46_47: pone el 46 en 0x8000, el 47 en 0xA000 (con su copia en 0xC381-0xC383)
	ld e,000h		;720e   ; 0x76 letras de p46:97E2 en la fila 0
	ld hl,097e2h		;7210
	ld b,076h		;7213
	call letras_con_color_7		;7215   ; letras_con_color_7: con el color 7
	ld e,020h		;7218   ; 0x54 de p46:9B92 en la 0x20
	ld hl,09b92h		;721a
	ld b,054h		;721d
	call letras_con_color_7		;721f   ; letras_con_color_7: con el color 7
	ld e,038h		;7222   ; 0x0E de p46:9E32 en la 0x38
	ld hl,09e32h		;7224
	ld b,00eh		;7227
	call letras_con_color_7		;7229   ; letras_con_color_7: con el color 7
letras_de_44:		; 0x80 letras de p44:BADB en la fila 0x40
	call 0416ch		;722c   ; bancos_44_45: pone el 44 en 0x8000, el 45 en 0xA000 (con su copia en 0xC381-0xC383)
	ld e,040h		;722f
	ld hl,0badbh		;7231
	ld b,080h		;7234
	call letras_con_color_7		;7236   ; letras_con_color_7: con el color 7
	jp 040f0h		;7239   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
letras_con_color_7:		; con el color 7
	ld c,007h		;723c   ; con el color 7...
	ld d,000h		;723e   ; ...en la fila E de la VRAM
	jp 0489ch		;7240   ; caracteres_a_4_bits: B caracteres de un bit pasados a cuatro con el color C
busca_la_ram:		; A = el slot con RAM en 0x8000: prueba los 4 slots y sus subslots (acarreo si la encuentra)
	ld bc,00400h		;7243
	ld hl,0fcc1h		;7246   ; la tabla de slots expandidos de la BIOS
L_7249:
	push bc			;7249
	push hl			;724a
	ld a,(hl)			;724b   ; expandido?
	bit 7,a		;724c
	jr nz,busca_la_ram_subslots		;724e
	ld a,c			;7250   ; no: el slot tal cual
	call es_ram		;7251   ; es_ram: pone el slot A en 0x8000 y mira si sus 256 primeros bytes se pueden escribir
L_7254:
	pop hl			;7254
	pop bc			;7255
	ret c			;7256   ; encontrada: ya esta
	inc hl			;7257   ; el slot siguiente
	inc c			;7258
	djnz L_7249		;7259
	ret			;725b
busca_la_ram_subslots:		; el bit 7 de expandido con el slot
	and 080h		;725c
	or c			;725e
	call prueba_subslots		;725f   ; prueba_subslots: los 4 subslots
	jr L_7254		;7262
prueba_subslots:		; los 4 subslots
	ld b,004h		;7264
L_7266:
	push bc			;7266
	call es_ram		;7267   ; es_ram: pone el slot A en 0x8000 y mira si sus 256 primeros bytes se pueden escribir
	pop bc			;726a
	ret c			;726b
	add a,004h		;726c   ; el subslot siguiente (bits 2-3)
	djnz L_7266		;726e
	ret			;7270
es_ram:		; pone el slot A en 0x8000 y mira si sus 256 primeros bytes se pueden escribir
	push af			;7271
	ld hl,08000h		;7272
	call 00024h		;7275   ; BIOS ENASLT - Switches to specified slot and page definitively | el slot en la pagina 2
	ld hl,08000h		;7278
	ld b,000h		;727b
L_727D:
	ld a,(hl)			;727d   ; el byte...
	cpl			;727e   ; ...dado la vuelta...
	ld (hl),a			;727f
	cp (hl)			;7280   ; ...se queda?
	cpl			;7281   ; lo deja como estaba
	ld (hl),a			;7282
	jr nz,L_728B		;7283   ; no: no es RAM
	inc hl			;7285
	djnz L_727D		;7286
	pop af			;7288
	scf			;7289   ; si: con acarreo
	ret			;728a
L_728B:
	pop af			;728b
	and a			;728c
	ret			;728d
cada_cuadro:		; el estado de la partida de cada cuadro: cuenta el cuadro (0xCA03) y salta por el estado 0xCA00 (p01:72A2)
	ld hl,0ca03h		;728e   ; apunta a el contador de cuadros (uno mas en cada interrupcion)
	inc (hl)			;7291
	ld bc,(0ca00h)		;7292   ; lee el estado de la partida (p01:729F: 8 estados) y el byte siguiente (16 bits)
	ld a,c			;7296   ; C = el estado, B = el paso
	cp 003h		;7297   ; en los estados 0-2...
	jr nc,L_729F		;7299
	ld hl,07747h		;729b   ; ...a la vuelta, p01:7747
	push hl			;729e
L_729F:
	call 0424dh		;729f   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_72A2: 8 destinos del despachador p00:424D (call en p01:729F, el
;   indice en A): 72B2, 731F, 735E, 7386, 7398, 73D2, 7655, 7726; lo leen
;   p01:729F (16 bytes)
;   0x72a2..0x72b2  (16 bytes)
DATA_tabla_72A2:
	defw 072b2h,0731fh,0735eh,07386h,07398h,073d2h,07655h,07726h	; 72a2

; ======================================================================
; CODIGO 0x72b2..0x7400  (334 bytes)
; ======================================================================


estado_0:		; el estado 0: el paso 0 limpia y p13:92D1, el 1 p13:932F hasta 0xCA14, el 2 espera y alterna 0xCA2A
	ld a,b			;72b2
	cp 001h		;72b3
	jr z,L_72C8		;72b5
	jr nc,L_72DC		;72b7
	call 045fdh		;72b9   ; paso 0: la pantalla limpia...
	call 04179h		;72bc   ; bancos_13_14: pone el 13 en 0x8000, el 14 en 0xA000 (con su copia en 0xC381-0xC383)
	call 092d1h		;72bf   ; p13:92D1
	call 040f0h		;72c2   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	jp L_7348		;72c5   ; ...y el paso siguiente
L_72C8:
	call 04179h		;72c8   ; paso 1
	call 0932fh		;72cb   ; p13:932F
	call 040f0h		;72ce   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	ld a,(0ca14h)		;72d1   ; hasta que 0xCA14 se pone
	or a			;72d4
	ret z			;72d5
	call letras_de_la_pagina_3		;72d6   ; las letras de la pagina 3
	xor a			;72d9
	jr L_7345		;72da
L_72DC:
	ld hl,0ca04h		;72dc   ; paso 2: la espera...
	dec (hl)			;72df
	ret nz			;72e0
	call 045fdh		;72e1   ; ...la pantalla limpia...
	ld bc,00007h		;72e4   ; ...R#7 = 0...
	call 00047h		;72e7   ; BIOS WRTVDP - Writes data in the VDP-register
	call 045f6h		;72ea   ; apaga_sprites: R#8 con el bit 1 (SPD) a uno, desde la copia 0xFFE7
	call pantalla_de_ca2a		;72ed   ; ...una pantalla u otra segun 0xCA2A (p01:7312)...
	call 04266h		;72f0   ; esconde_sprites_ram: llena 0xDC00-0xDC7F con 0xE0
	call 045d7h		;72f3   ; esconde_sprites_vram: llena con 0xE0 128 bytes de la VRAM en 0xF600 y otros 128 en 0xF200
	call 04609h		;72f6   ; enciende_sprites: R#8 con el bit 1 (SPD) a cero, desde la copia 0xFFE7
	ld a,(0ca2ah)		;72f9   ; ...0xCA2C = 1, o 0x80 con 0xCA2A...
	and a			;72fc
	ld hl,00001h		;72fd
	jr z,L_7305		;7300
	ld hl,00080h		;7302
L_7305:
	ld (0ca2ch),hl		;7305
	ld hl,0ca2ah		;7308   ; ...0xCA2A cambia...
	ld a,(hl)			;730b
	xor 001h		;730c
	ld (hl),a			;730e
	jp L_73A3		;730f   ; ...y el estado 1
pantalla_de_ca2a:		; con 0xCA2A, la de los bancos 60-63; sin el, la paleta de p56:A1D8 y la de los bancos 52-53
	ld a,(0ca2ah)		;7312
	and a			;7315
	jp nz,pantalla_de_62		;7316   ; pantalla_de_62: una pantalla de los bancos 60-63: mapas de bits, rachas y 4 juegos de letras
	call paleta_a1d8		;7319   ; paleta_a1d8: la paleta de p56:A1D8
	jp pantalla_de_52		;731c   ; pantalla_de_52: una pantalla de los bancos 52-53: dibujos, mosaicos, una rejilla de lineas y sprites
estado_1:		; el estado 1: el paso 0 corre p13:8000 hasta que 0xCA2C llega a 0; el 1 p14:A196 hasta 0xCAFA
	ld a,b			;731f
	and a			;7320
	jr nz,L_734D		;7321
	ld a,(0ca2ch)		;7323   ; con 0xCA2C < 0x80, las tablas de sprites se alternan
	cp 080h		;7326
	call c,cambia_tablas_de_sprites		;7328   ; cambia_tablas_de_sprites: alterna las tablas de sprites de la VRAM: atributos en 0xF600 o 0xF200, colores en 0xF400 o 0xF000
	call 04179h		;732b   ; bancos_13_14: pone el 13 en 0x8000, el 14 en 0xA000 (con su copia en 0xC381-0xC383)
	call 08000h		;732e   ; p13:8000
	call 040f0h		;7331   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	ld a,(0ca2ch)		;7334   ; con 0xCA2C < 0x80, los sprites a la VRAM
	cp 080h		;7337
	call c,04f97h		;7339   ; sprites_a_vram: los colores de los sprites (0xDA00) y detras sus atributos (0xDC00)...
	ld a,(0ca2ch)		;733c   ; hasta que 0xCA2C llega a 0
	and a			;733f
	ret nz			;7340
	call 08427h		;7341   ; la pantalla de p47
	xor a			;7344
L_7345:
	ld (0ca04h),a		;7345   ; la espera a 0
L_7348:
	ld hl,0ca01h		;7348   ; el paso siguiente
	inc (hl)			;734b
	ret			;734c
L_734D:
	call 04179h		;734d   ; paso 1: p14:A196...
	call 0a196h		;7350   ; p14:A196
	call 040f0h		;7353   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	ld a,(0cafah)		;7356   ; ...hasta que 0xCAFA se pone
	or a			;7359
	ret nz			;735a
	jp L_73A4		;735b
estado_2:		; el estado 2: el paso 0 espera y pone 0xCAFA = 1; el 1 corre p14:A299 hasta que 0xCAFA vuelve a 0 y al estado 0
	ld a,b			;735e
	and a			;735f
	jr nz,L_7372		;7360
	ld hl,0ca04h		;7362   ; apunta a la espera del paso del estado
	dec (hl)			;7365
	ret nz			;7366
	xor a			;7367   ; 0xCAFB = 0...
	ld (0cafbh),a		;7368
	inc a			;736b   ; ...0xCAFA = 1
	ld (0cafah),a		;736c
	jp L_7348		;736f
L_7372:
	call 04179h		;7372   ; paso 1: p14:A299
	call 0a299h		;7375   ; p14:A299
	call 040f0h		;7378   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	ld a,(0cafah)		;737b   ; mientras 0xCAFA...
	or a			;737e
	ret nz			;737f
L_7380:
	xor a			;7380   ; ...luego, el estado 0
	ld (0ca00h),a		;7381   ; guarda el estado de la partida (p01:729F: 8 estados)
	jr L_73AB		;7384
estado_3:		; el estado 3: espera 0x50 cuadros, borra la partida y al estado 4
	ld a,b			;7386
	and a			;7387
	jr nz,L_738E		;7388
	ld a,050h		;738a   ; 0x50 cuadros
	jr L_7345		;738c
L_738E:
	ld hl,0ca04h		;738e   ; apunta a la espera del paso del estado
	dec (hl)			;7391
	ret nz			;7392
	call borra_la_partida		;7393   ; 0xCA40-0xF0FF a cero
	jr L_73A3		;7396
estado_4:		; el estado 4: la pantalla a negro, la partida nueva, 0xCA40 = 1 y al estado 5
	call 045b3h		;7398   ; pantalla_a_negro: sin sprites ni pantalla, la pagina 0 a cero y sin desplazamiento
	call 09e2bh		;739b   ; partida_nueva: la partida desde el principio
	ld hl,0ca40h		;739e
	ld (hl),001h		;73a1
L_73A3:
	xor a			;73a3
L_73A4:
	ld (0ca04h),a		;73a4   ; la espera...
	ld hl,0ca00h		;73a7   ; ...el estado siguiente...
	inc (hl)			;73aa
L_73AB:
	xor a			;73ab
L_73AC:
	ld (0ca01h),a		;73ac   ; ...en el paso A
	ret			;73af
rutina_de_la_zona:		; la rutina de la zona en la fase (salvo en la zona 0x12 sala 2); con 0xD8BA, 0xD8AA = 1 y p01:6CA6
	ld a,(0ca4ah)		;73b0   ; lee la zona
	cp 012h		;73b3
	jr nz,L_73BD		;73b5
	ld a,(0ca4bh)		;73b7   ; lee la sala de la zona
	cp 002h		;73ba
	ret z			;73bc
L_73BD:
	ld hl,0d8bah		;73bd
	ld a,(hl)			;73c0
	and a			;73c1
	jr nz,L_73C8		;73c2
	call rutina_de_fase		;73c4   ; la rutina...
	jp (hl)			;73c7   ; ...se ejecuta
L_73C8:
	ld a,001h		;73c8   ; 0xD8AA = 1
	ld (0d8aah),a		;73ca
L_73CD:
	xor a			;73cd   ; (HL) = 0 (0xD8BA o 0xD4F0) y el sonido 0x89
	ld (hl),a			;73ce
	jp sonido_89		;73cf   ; sonido_89: pide el sonido 0x89 (de los que tienen la partitura en un banco de musica, p16:4CE3)
estado_5:		; el estado 5, la partida: con 0xC694 (y sin 0xCA77), la rutina de la zona; despues el paso de 0xCA01
	ld hl,0c694h		;73d2
	ld a,(hl)			;73d5
	and a			;73d6
	jr z,L_73E4		;73d7
	ld (hl),000h		;73d9   ; 0xC694 = 0
	push bc			;73db
	ld a,(0ca77h)		;73dc
	and a			;73df
	call z,rutina_de_la_zona		;73e0   ; rutina_de_la_zona: la rutina de la zona en la fase (salvo en la zona 0x12 sala 2); con 0xD8BA, 0xD8AA = 1 y p01:6CA6
	pop bc			;73e3
L_73E4:
	ld a,b			;73e4   ; salvo en los pasos 5, 6 y 0x0B...
	cp 00bh		;73e5
	jr z,L_73F2		;73e7
	sub 005h		;73e9
	cp 002h		;73eb
	push bc			;73ed
	call nc,089d9h		;73ee   ; ...la musica de cada cuadro
	pop bc			;73f1
L_73F2:
	ld hl,0d4f0h		;73f2   ; con 0xD4F0, p01:73CD
	ld a,(hl)			;73f5
	and a			;73f6
	push bc			;73f7
	call nz,L_73CD		;73f8
	pop bc			;73fb
	ld a,b			;73fc   ; por el paso (p01:7400)
	call 0424dh		;73fd   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_7400: 13 destinos del despachador p00:424D (call en p01:73FD, el
;   indice en A): 741A, 74ED, 74F7, 7505, 751E, 7538, 7549, 7566, 7586, 75D6,
;   75F6, 761B, 7636; lo leen p01:73FD (26 bytes)
;   0x7400..0x741a  (26 bytes)
DATA_tabla_7400:
	defw 0741ah,074edh,074f7h,07505h,0751eh,07538h,07549h,07566h	; 7400
	defw 07586h,075d6h,075f6h,0761bh,07636h	; 7410

; ======================================================================
; CODIGO 0x741a..0x7659  (575 bytes)
; ======================================================================


paso_0:		; el paso 0, jugando: p01:7789 y las teclas de funcion
	call bucle_del_juego		;741a   ; bucle_del_juego: lo de cada cuadro jugando: la pausa, Snake, los enemigos, las cosas de la sala, los sprites
	ld a,(0ca41h)		;741d   ; saliendo de la sala, el paso 1
	and a			;7420
	jp nz,L_7348		;7421
	ld a,(0ca97h)		;7424   ; con 0xCA97, nada mas
	or a			;7427
	ret nz			;7428
	ld a,(0ca28h)		;7429   ; con 0xCA28, el paso 9
	and a			;742c
	ld a,009h		;742d
	jp nz,L_73AC		;742f
	ld a,(0cb3ch)		;7432   ; con 0xCB3C, nada mas
	and a			;7435
	ret nz			;7436
	ld a,(0ca09h)		;7437   ; las teclas de funcion recien pulsadas
	rra			;743a   ; F2: el paso 2
	rra			;743b
	ld b,002h		;743c
	jr c,tecla_f2_f3		;743e
	rra			;7440   ; F3: el paso 3
	ld b,003h		;7441
	jr c,tecla_f2_f3		;7443
	rra			;7445   ; F4: p01:74A1
	jr c,tecla_f4		;7446
	rra			;7448   ; F5: p01:74CA
	jp c,tecla_f5		;7449   ; tecla_f5: si se puede (p06:AA49)
	ld a,(0d434h)		;744c   ; con 0xD434, el paso 7
	and a			;744f
	ld a,007h		;7450
	jp nz,L_73AC		;7452
	ld a,(0cae7h)		;7455   ; con 0xCAE7, el paso 0x0A
	and a			;7458
	ld a,00ah		;7459
	jp nz,L_73AC		;745b
	ld a,(0cb00h)		;745e   ; con el estado de Snake 0x14, el paso 0x0B
	cp 014h		;7461
	ld a,00bh		;7463
	jp z,L_73AC		;7465
	cp 01bh		;7468   ; aqui A ya vale 0x0B (p01:7463): este salto no se da nunca
	jp nc,L_73AC		;746a
	ld a,(0d7bbh)		;746d   ; con 0xD7BB, el paso 4 (p01:74B6)
	or a			;7470
	jr nz,L_74B6		;7471
	ld a,(0caafh)		;7473   ; con 0xCAAF, la pagina 0 y el estado 7
	or a			;7476
	jr z,fin_del_paso		;7477
	xor a			;7479
	ld (0ca42h),a		;747a   ; guarda la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	ld a,007h		;747d
	ld (0ca00h),a		;747f   ; guarda el estado de la partida (p01:729F: 8 estados)
	jp L_73AB		;7482
fin_del_paso:		; sin 0xCA40, los dibujos de p52:8114 en la VRAM de 0xA000 y el estado siguiente
	ld a,(0ca40h)		;7485
	or a			;7488
	ret nz			;7489
	call dibujos_8114_en_a000		;748a   ; dibujos_8114_en_a000: los dibujos de p52:8114 en la VRAM de 0xA000
	jp L_73A3		;748d
tecla_f2_f3:		; si se puede (p06:AA49, acarreo) y sin 0xCA58: 0xD701 = 0 y el paso B
	call 08754h		;7490   ; a_p06_aa49: p06:AA49 con el banco 6 en 0xA000
	ret nc			;7493
	ld a,(0ca58h)		;7494
	or a			;7497
	ret nz			;7498
	xor a			;7499
	ld (0d701h),a		;749a
	ld a,b			;749d
	jp L_73AC		;749e
tecla_f4:		; con 0xD8A4 no
	ld a,(0d8a4h)		;74a1
	or a			;74a4
	ret nz			;74a5
	call 08754h		;74a6   ; si se puede (p06:AA49)
	ret nc			;74a9
	ld a,(0e1e8h)		;74aa   ; con 0xE1E8 y sin 0xE1E9, p01:7485
	or a			;74ad
	jr z,L_74B6		;74ae
	ld a,(0e1e9h)		;74b0   ; lee el numero de la llamada
	or a			;74b3
	jr z,fin_del_paso		;74b4
L_74B6:
	ld a,(0ca01h)		;74b6   ; si no esta ya en el paso 4...
	cp 004h		;74b9
	ret z			;74bb
	call 041c5h		;74bc   ; ...p09:B68E...
	call 0b68eh		;74bf
	call 040f0h		;74c2   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	ld a,004h		;74c5   ; ...y el paso 4
	jp L_73AC		;74c7
tecla_f5:		; si se puede (p06:AA49)
	call 08754h		;74ca   ; a_p06_aa49: p06:AA49 con el banco 6 en 0xA000
	ret nc			;74cd
	ld a,(0ca1ch)		;74ce   ; con 0xCA1C no
	and a			;74d1
	ret nz			;74d2
	ld a,(0ca77h)		;74d3   ; con 0xCA77, 0xD8C2 = 5 y 0xD88A = 0xFF tampoco
	and a			;74d6
	jr z,L_74E5		;74d7
	ld a,(0d8c2h)		;74d9
	cp 005h		;74dc
	jr nz,L_74E5		;74de
	ld a,(0d88ah)		;74e0
	inc a			;74e3
	ret z			;74e4
L_74E5:
	call 05d6eh		;74e5   ; p12:6BE6, p12:6000 y p02:8502...
	ld a,008h		;74e8   ; ...y el paso 8
	jp L_73AC		;74ea
paso_1:		; el paso 1: a la sala de al lado y otra vez el paso 0
	call 08096h		;74ed   ; sala_de_al_lado: p01:7BAA
	xor a			;74f0
	ld (0ca41h),a		;74f1   ; guarda la salida de la sala (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	jp L_73AB		;74f4
paso_2:		; el paso 2 (F2): p10:AED6 hasta 0xD706
	call 092f8h		;74f7   ; a_p10_aed6: p10:AED6 con el banco 10 en 0xA000
	call fin_del_paso		;74fa   ; fin_del_paso: sin 0xCA40, los dibujos de p52:8114 en la VRAM de 0xA000 y el estado siguiente
	ld a,(0d706h)		;74fd
	or a			;7500
	ret z			;7501
	jp L_73AB		;7502
paso_3:		; el paso 3 (F3): p10:AF30 hasta 0xD706; con 0xCB21 = 2, el paso 0x0C
	call 09301h		;7505   ; a_p10_af30: p10:AF30 con el banco 10 en 0xA000
	call fin_del_paso		;7508   ; fin_del_paso: sin 0xCA40, los dibujos de p52:8114 en la VRAM de 0xA000 y el estado siguiente
	ld a,(0d706h)		;750b
	or a			;750e
	ret z			;750f
	ld a,(0cb21h)		;7510   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	cp 002h		;7513
	jp nz,L_73AB		;7515
	ld a,00ch		;7518
	ld (0ca01h),a		;751a   ; guarda el paso del estado de la partida
	ret			;751d
paso_4:		; el paso 4 (F4): p09:B76D hasta 0xD7B4; con 0xE040, el paso 5
	call 041c5h		;751e   ; bancos_9: pone el 9 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b76dh		;7521   ; p09:B76D
	call 040f0h		;7524   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	ld a,(0d7b4h)		;7527
	or a			;752a
	ret z			;752b
	ld a,(0e040h)		;752c
	or a			;752f
	jp z,L_73AB		;7530
	ld a,005h		;7533
	jp L_73AC		;7535
paso_5:		; el paso 5: p09:A5A9 hasta que 0xE040 se pone a 0
	call 041c5h		;7538   ; bancos_9: pone el 9 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a5a9h		;753b   ; p09:A5A9
	call 040f0h		;753e   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	ld a,(0e040h)		;7541
	or a			;7544
	ret nz			;7545
	jp L_73AB		;7546
paso_6:		; el paso 6: p08:BC53 y p12:7688 hasta que 0xE1F0 se pone a 0
	call cambia_tablas_de_sprites		;7549   ; cambia_tablas_de_sprites: alterna las tablas de sprites de la VRAM: atributos en 0xF600 o 0xF200, colores en 0xF400 o 0xF000
	call 041bdh		;754c   ; bancos_8: pone el 8 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0bc53h		;754f   ; p08:BC53
	call 040f0h		;7552   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 05dc3h		;7555   ; a_p12_7688: p12:7688 con el banco 12 en 0x6000
	call sprites_a_vram_turnos		;7558   ; sprites_a_vram_turnos: los sprites a la VRAM, cambiando el orden cada cuadro para que no desaparezcan
	call 040f0h		;755b   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	ld a,(0e1f0h)		;755e
	or a			;7561
	ret nz			;7562
	jp L_73AB		;7563
paso_7:		; el paso 7: p08:AB7D y p12:7DDC hasta que 0xD434 se pone a 0
	call cambia_tablas_de_sprites		;7566   ; cambia_tablas_de_sprites: alterna las tablas de sprites de la VRAM: atributos en 0xF600 o 0xF200, colores en 0xF400 o 0xF000
	call 05dcbh		;7569   ; a_p12_76e9: p12:76E9 con el banco 12 en 0x6000
	call 04650h		;756c   ; espera_vdp: espera a que el VDP acabe la orden en curso (S#2 bit 0)
	call 041bdh		;756f   ; bancos_8: pone el 8 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0ab7dh		;7572   ; p08:AB7D
	call 040f0h		;7575   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 05dabh		;7578   ; a_p12_7ddc: p12:7DDC con el banco 12 en 0x6000
	call sprites_a_vram_turnos		;757b   ; sprites_a_vram_turnos: los sprites a la VRAM, cambiando el orden cada cuadro para que no desaparezcan
	ld a,(0d434h)		;757e
	and a			;7581
	ret nz			;7582
	jp L_73AB		;7583
paso_8:		; el paso 8 (F5): p12:6055 hasta 0xC3A2; con 0xC3A2 = 0xFF, la partida otra vez desde lo guardado
	call 05d7ch		;7586   ; llama_6055:
	ld a,(0c3a2h)		;7589
	and a			;758c
	jp z,L_73AB		;758d
	inc a			;7590
	ret nz			;7591
	call L_73AB		;7592
sigue_la_partida:		; la partida otra vez: marcador, barras, p03:A1BB, p14:B06B, la zona y la musica
	call borra_marcador_abajo		;7595   ; borra_marcador_abajo: en la pagina de dibujar
	call barras_llenas		;7598   ; barras_llenas: 0x20 en las tres barras: la de vida, la de la derecha y la de 0xCA54
	call 0a1bbh		;759b   ; snake_al_empezar: Snake al empezar: 0xCA58 = 0, las esperas a 1, el estado 0, mirando a la izquierda
	call 041efh		;759e   ; bancos_14: pone el 14 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b06bh		;75a1   ; p14:B06B
	call 040f0h		;75a4   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call rachas_9638		;75a7   ; rachas_9638: las rachas de p37:9638 a la VRAM de 0x1E280 y una franja de la pagina 3 a la 3
	call 09e94h		;75aa   ; empieza_la_partida: sin 0xCA97, las rachas de p37
	call vida_por_nivel		;75ad   ; la barra de vida segun el nivel
	call 04279h		;75b0   ; rehace_marcador: el marcador: lineas, marco y barra de vida
	call 041efh		;75b3   ; bancos_14: pone el 14 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0afe1h		;75b6   ; p14:AFE1
	call 040f0h		;75b9   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 059bbh		;75bc   ; p00:59BB, dentro de cambia_de_zona: prepara la zona y entra en la sala
	ld a,001h		;75bf   ; la musica enseguida
	ld (0ca18h),a		;75c1   ; guarda la espera hasta poner la musica pendiente
	call 041a0h		;75c4   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b3c9h		;75c7   ; p06:B3C9
	call 041efh		;75ca   ; bancos_14: pone el 14 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b06bh		;75cd
	call 0b03ah		;75d0   ; p14:B03A
	jp 040f0h		;75d3   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
paso_9:		; el paso 9: p12:74BC y p12:7DDC hasta que 0xCA28 se pone a 0
	call cambia_tablas_de_sprites		;75d6   ; cambia_tablas_de_sprites: alterna las tablas de sprites de la VRAM: atributos en 0xF600 o 0xF200, colores en 0xF400 o 0xF000
	call 05dcbh		;75d9   ; a_p12_76e9: p12:76E9 con el banco 12 en 0x6000
	call 04650h		;75dc   ; espera_vdp: espera a que el VDP acabe la orden en curso (S#2 bit 0)
	call 04142h		;75df   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	call 09cd5h		;75e2   ; a_p12_74bc: p12:74BC con el banco 12 en 0x6000
	call 040f0h		;75e5   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 05dabh		;75e8   ; a_p12_7ddc: p12:7DDC con el banco 12 en 0x6000
	call sprites_a_vram_turnos		;75eb   ; sprites_a_vram_turnos: los sprites a la VRAM, cambiando el orden cada cuadro para que no desaparezcan
	ld a,(0ca28h)		;75ee
	and a			;75f1
	ret nz			;75f2
	jp L_73AB		;75f3
paso_0a:		; el paso 0x0A: p15:A354 cada 4 cuadros hasta que 0xCAE7 se pone a 0
	call cambia_tablas_de_sprites		;75f6   ; cambia_tablas_de_sprites: alterna las tablas de sprites de la VRAM: atributos en 0xF600 o 0xF200, colores en 0xF400 o 0xF000
	call 05dcbh		;75f9   ; a_p12_76e9: p12:76E9 con el banco 12 en 0x6000
	call 04650h		;75fc   ; espera_vdp: espera a que el VDP acabe la orden en curso (S#2 bit 0)
	ld a,(0ca03h)		;75ff   ; lee el contador de cuadros (uno mas en cada interrupcion)
	and 003h		;7602
	jp nz,sprites_a_vram_turnos		;7604   ; sprites_a_vram_turnos: los sprites a la VRAM, cambiando el orden cada cuadro para que no desaparezcan
	call 041f7h		;7607   ; bancos_15: pone el 15 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a354h		;760a   ; p15:A354
	call 040f0h		;760d   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call sprites_a_vram_turnos		;7610   ; sprites_a_vram_turnos: los sprites a la VRAM, cambiando el orden cada cuadro para que no desaparezcan
	ld a,(0cae7h)		;7613
	and a			;7616
	ret nz			;7617
	jp L_73AB		;7618
paso_0b:		; el paso 0x0B: p03:B593, p03:A1DE, p03:B4E0 y p12:7688
	call cambia_tablas_de_sprites		;761b   ; cambia_tablas_de_sprites: alterna las tablas de sprites de la VRAM: atributos en 0xF600 o 0xF200, colores en 0xF400 o 0xF000
	call 05dcbh		;761e   ; a_p12_76e9: p12:76E9 con el banco 12 en 0x6000
	call 04650h		;7621   ; espera_vdp: espera a que el VDP acabe la orden en curso (S#2 bit 0)
	call 0b593h		;7624   ; franja_de_dfd8: con 0xDFD8 y 0xDFD9, una franja de la pagina 0 a Y = 0xFE de la 1 (YMMM)
	call 0a1deh		;7627   ; snake_cada_cuadro: Snake en cada cuadro: su estado y lo que le pasa
	call 0b4e0h		;762a   ; dibuja_los_que_siguen: p03:B4E6 y p03:B563
	call 05dc3h		;762d   ; a_p12_7688: p12:7688 con el banco 12 en 0x6000
	call sprites_a_vram_turnos		;7630   ; sprites_a_vram_turnos: los sprites a la VRAM, cambiando el orden cada cuadro para que no desaparezcan
	jp fin_del_paso		;7633   ; fin_del_paso: sin 0xCA40, los dibujos de p52:8114 en la VRAM de 0xA000 y el estado siguiente
paso_0c:		; el paso 0x0C: p01:7FA7; F3 otra vez, como en el paso 0
	call paso_0c_cada_cuadro		;7636   ; paso_0c_cada_cuadro: lo de cada cuadro en el paso 0x0C: las tablas, p12:76E9, p03:B593, p03:A1DE, p04:89C3, p02:8BF1, el banco 11...
	ld a,(0ca09h)		;7639   ; lee lo recien pulsado de las teclas de funcion (bits como 0xCA0A)
	rra			;763c
	rra			;763d
	rra			;763e
	ld b,003h		;763f
	ret nc			;7641
	call tecla_f2_f3		;7642   ; tecla_f2_f3: si se puede (p06:AA49, acarreo) y sin 0xCA58: 0xD701 = 0 y el paso B
	ld hl,0cb62h		;7645   ; con 0xCB62...
	ld a,(hl)			;7648
	or a			;7649
	ret z			;764a
	ld (hl),000h		;764b   ; ...lo borra y, con 0xCADE, el sonido 0x28
	ld a,(0cadeh)		;764d
	or a			;7650
	jp nz,sonido_28		;7651   ; sonido_28: pide el sonido 0x28
	ret			;7654
estado_6:		; el estado 6, por el paso (p01:7659)
	ld a,b			;7655
	call 0424dh		;7656   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_7659: 4 destinos del despachador p00:424D (call en p01:7656, el
;   indice en A): 7661, 768F, 76A5, 76E0; lo leen p01:7656 (8 bytes)
;   0x7659..0x7661  (8 bytes)
DATA_tabla_7659:
	defw 07661h,0768fh,076a5h,076e0h	; 7659  -> L_7661 estado_6_paso_1 estado_6_paso_2 estado_6_paso_3

; ======================================================================
; CODIGO 0x7661..0x7747  (230 bytes)
; ======================================================================


L_7661:
	call 045f1h		;7661   ; el estado 6, paso 0: apaga la pantalla, el sonido 0xA5...
	call sonido_a5		;7664   ; sonido_a5: pide el sonido 0xA5 (de los que tienen la partitura en un banco de musica, p16:4CE3)
	xor a			;7667   ; ...0xCA1C = 0xCA29 = 0...
	ld (0ca1ch),a		;7668   ; guarda 1: la pantalla partida en la linea 0xB4 (arriba con desplazamiento, abajo la pagina 1 sin sprites)
	ld (0ca29h),a		;766b
	call 0542bh		;766e   ; ...sin sprites, la paleta comun...
	call 08502h		;7671   ; paleta_comun: la paleta de p56:B945
	ld bc,00f07h		;7674   ; ...R#7 = 0x0F (el borde blanco)...
	call 00047h		;7677   ; BIOS WRTVDP - Writes data in the VDP-register
	call 045beh		;767a   ; ...sin desplazamiento...
	ld a,(0d8a4h)		;767d   ; ...con 0xD8A4, el marcador de abajo borrado...
	and a			;7680
	call nz,borra_marcador_abajo		;7681   ; borra_marcador_abajo: en la pagina de dibujar
	call ventana_a5d6		;7684   ; ...la ventana de p06:A5D6...
	call 04606h		;7687   ; ...y otra vez la pantalla
	ld a,0c0h		;768a   ; 0xC0 cuadros
	jp L_7345		;768c
estado_6_paso_1:		; cada dos cuadros...
	ld a,(0ca03h)		;768f   ; lee el contador de cuadros (uno mas en cada interrupcion)
	rra			;7692
	ret c			;7693
	ld hl,0ca04h		;7694   ; ...la espera; al acabar, el letrero de p03:A004 y p06:AE89
	dec (hl)			;7697
	ret nz			;7698
	ld hl,0a004h		;7699
	call 04918h		;769c   ; letrero_con_sitio: [fila][columna] y letras; 0xFE otra posicion, 0xFF acaba
	call a_p06_ae89		;769f   ; a_p06_ae89: p06:AE89 con el banco 6 en 0xA000
	jp L_7348		;76a2
estado_6_paso_2:		; p06:AE62: sin acarreo, sigue esperando
	call 041a0h		;76a5   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0ae62h		;76a8   ; p06:AE62
	call 040f0h		;76ab   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	ret nc			;76ae
	ld a,(0ca29h)		;76af   ; segun 0xCA29: 0 sigue la partida (p01:76CF), 1 el paso siguiente (p01:76DA), 2 vuelve al estado 0
	and a			;76b2
	jr z,L_76CF		;76b3
	dec a			;76b5
	jr z,L_76DA		;76b6
	call 045f1h		;76b8   ; apaga la pantalla...
	call sonido_01		;76bb   ; ...el sonido 1...
	xor a			;76be   ; ...la pagina 0 a la vista...
	ld (0ca42h),a		;76bf   ; guarda la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	call 04879h		;76c2   ; pon_pagina_visible: la pagina A a la vista (0xFAF5, DPPAGE de la BIOS)
	ld hl,0ca02h		;76c5   ; ...el bit 6 de 0xCA02 a cero...
	ld a,(hl)			;76c8
	and 0bfh		;76c9
	ld (hl),a			;76cb
	jp L_7380		;76cc   ; ...y el estado 0
L_76CF:
	call 05d66h		;76cf   ; p12:6BE6, p12:61F8 y p12:6327
	call 05d85h		;76d2   ; p00:5D85
	call 05d8dh		;76d5   ; p00:5D8D
	jr L_76EB		;76d8
L_76DA:
	call 05d6eh		;76da   ; p12:6BE6, p12:6000 y p02:8502, y el paso siguiente
	jp L_7348		;76dd
estado_6_paso_3:		; p12:6055 hasta 0xC3A2: 0 vuelve al paso 2; 0xFF sigue la partida
	call 05d7ch		;76e0   ; llama_6055:
	ld a,(0c3a2h)		;76e3
	and a			;76e6
	jr z,L_76F4		;76e7
	inc a			;76e9
	ret nz			;76ea
L_76EB:
	ld hl,00005h		;76eb   ; el estado 5 paso 0...
	ld (0ca00h),hl		;76ee   ; guarda el estado de la partida (p01:729F: 8 estados) y el byte siguiente (16 bits)
	jp sigue_la_partida		;76f1   ; ...y la partida otra vez
L_76F4:
	ld a,002h		;76f4   ; el paso 2...
	ld (0ca01h),a		;76f6   ; guarda el paso del estado de la partida
	call 045f1h		;76f9   ; ...con la pantalla apagada...
	call dibujos_8114_en_a000		;76fc   ; ...los dibujos de p52:8114...
	call ventana_a5d6		;76ff   ; ...la ventana...
	ld hl,0a004h		;7702   ; ...el letrero de p03:A004...
	call 04918h		;7705   ; letrero_con_sitio: [fila][columna] y letras; 0xFE otra posicion, 0xFF acaba
	call 04606h		;7708   ; ...y otra vez la pantalla
a_p06_ae89:		; p06:AE89 con el banco 6 en 0xA000
	call 041a0h		;770b   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0ae89h		;770e   ; p06:AE89
	jp 040f0h		;7711   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
ventana_a5d6:		; la pagina de dibujar borrada, p06:A5D6 y las letras de p44:BADB
	ld a,(0ca42h)		;7714   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	call 04452h		;7717   ; borra_pantalla_de: 0xC0 x 0xC0 puntos a 0 en la pagina A
	call 041a0h		;771a   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a5d6h		;771d   ; p06:A5D6
	call 040f0h		;7720   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	jp letras_de_44		;7723   ; letras_de_44: 0x80 letras de p44:BADB en la fila 0x40
estado_7:		; el estado 7: p13:9555 con los sprites hasta que 0xCAAF se pone a 0; luego el sonido 1 y el estado 0
	call 04179h		;7726   ; bancos_13_14: pone el 13 en 0x8000, el 14 en 0xA000 (con su copia en 0xC381-0xC383)
	call cambia_tablas_de_sprites		;7729   ; cambia_tablas_de_sprites: alterna las tablas de sprites de la VRAM: atributos en 0xF600 o 0xF200, colores en 0xF400 o 0xF000
	call 09555h		;772c   ; p13:9555
	call 04f97h		;772f   ; sprites_a_vram: los colores de los sprites (0xDA00) y detras sus atributos (0xDC00)...
	call 040f0h		;7732   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	ld a,(0caafh)		;7735
	or a			;7738
	ret nz			;7739
	call sonido_01		;773a   ; sonido_01: pide el sonido 0x01
	ld hl,0ca02h		;773d   ; el bit 6 de 0xCA02 a cero
	ld a,(hl)			;7740
	and 0bfh		;7741
	ld (hl),a			;7743
	jp L_7380		;7744

; ----------------------------------------------------------------------
; DATOS resto_7747: lo apuntan con el banco puesto p01:729B (0x7747), p00:5010
;   (0x7762); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p01:729B, p00:5010 (66 bytes)
;   0x7747..0x7789  (66 bytes)
DATA_resto_7747:
	defb 0cdh,0a0h,041h,0cdh,0c8h,0b0h,021h,016h,0cah,0cdh,0c1h,0b0h,0cdh,0f0h,040h,0b7h	; 7747  ..A...!.......@.
	defb 0c8h,021h,004h,0cah,036h,000h,021h,000h,0cah,046h,005h,005h,020h,00dh,0e6h,030h	; 7757  .!..6.!..F.. ..0
	defb 0c8h,03eh,040h,032h,002h,0cah,036h,003h,023h,070h,0c9h,036h,002h,023h,036h,000h	; 7767  .>@2..6.#p.6.#6.
	defb 0cdh,00dh,06ah,0cdh,006h,072h,0cdh,027h,084h,0cdh,079h,041h,0cdh,087h,0a1h,0c3h	; 7777  ..j..r.'..yA....
	defb 0f0h,040h	; 7787

; ======================================================================
; CODIGO 0x7789..0x7a48  (703 bytes)
; ======================================================================


bucle_del_juego:		; lo de cada cuadro jugando: la pausa, Snake, los enemigos, las cosas de la sala, los sprites
	call cambia_tablas_de_sprites		;7789   ; las tablas de sprites se alternan
	call 05dcbh		;778c   ; a_p12_76e9: p12:76E9 con el banco 12 en 0x6000
	call 04650h		;778f   ; espera_vdp: espera a que el VDP acabe la orden en curso (S#2 bit 0)
	call 0b593h		;7792   ; franja_de_dfd8: con 0xDFD8 y 0xDFD9, una franja de la pagina 0 a Y = 0xFE de la 1 (YMMM)
	call 04650h		;7795   ; espera_vdp: espera a que el VDP acabe la orden en curso (S#2 bit 0)
	ld hl,0cac0h		;7798   ; 0xCAC0: la pausa
	ld a,(0ca97h)		;779b   ; sin mensajes de 50-51...
	or a			;779e
	jr nz,L_77B6		;779f
	ld a,(0cb3ch)		;77a1   ; ...ni 0xCB3C...
	or a			;77a4
	jr nz,L_77B6		;77a5
	ld a,(0ca09h)		;77a7   ; ...F1 recien pulsada...
	rra			;77aa
	jr nc,L_77B6		;77ab
	ld a,(hl)			;77ad   ; ...pone o quita la pausa...
	xor 001h		;77ae
	ld (hl),a			;77b0
	push hl			;77b1
	call 0bfb0h		;77b2   ; ...p03:BFB0
	pop hl			;77b5
L_77B6:
	ld a,(hl)			;77b6   ; en pausa, solo los sprites
	or a			;77b7
	jp nz,L_7905		;77b8
	ld a,(0ca4ah)		;77bb   ; en la zona 0x12, salas 0-0x0B, la lista corta de p01:7908
	cp 012h		;77be
	jr nz,L_77CA		;77c0
	ld a,(0ca4bh)		;77c2   ; lee la sala de la zona
	cp 00ch		;77c5
	jp c,bucle_del_juego_zona_12		;77c7   ; bucle_del_juego_zona_12: la lista corta de la zona 0x12, salas 0-0x0B
L_77CA:
	ld hl,0d431h		;77ca   ; la espera de 0xD431...
	ld a,(hl)			;77cd
	and a			;77ce
	jr z,L_77DE		;77cf
	dec (hl)			;77d1   ; ...al acabar en la zona 1, 0xD430 = 0
	jr nz,L_77DE		;77d2
	ld a,(0ca4ah)		;77d4   ; lee la zona
	dec a			;77d7
	jr nz,L_77DE		;77d8
	xor a			;77da
	ld (0d430h),a		;77db
L_77DE:
	ld a,(0caa8h)		;77de   ; con 0xCAA8, solo p03:BF14
	or a			;77e1
	jr z,L_77EA		;77e2
	call 0bf14h		;77e4   ; quita_el_rotulo: con 0xCAC7 = 2 una tecla o un disparo recien pulsados lo quitan; si no, tambien con un disparo apretado
	jp L_7902		;77e7
L_77EA:
	call 05f5fh		;77ea   ; a_p12_6d78: p12:6D78 con el banco 12 en 0x6000
	call 041b0h		;77ed   ; bancos_7: pone el 7 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0ab44h		;77f0
	call 041a0h		;77f3   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a4e8h		;77f6   ; p06:A4E8
	call 04142h		;77f9   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0aa43h		;77fc   ; pasos_de_d8a0: con 0xD8A0, por su paso (p05:AA4D)
	call 089c3h		;77ff   ; fichas_d800: las 4 fichas de 0x20 bytes de 0xD800 (o la de 0xD860 en las especiales)
	call 041f4h		;7802   ; bancos_1_2_15: pone el 1 en 0x6000, el 2 en 0x8000, el 15 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a316h		;7805
	call 040f0h		;7808   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a1deh		;780b   ; snake_cada_cuadro: Snake en cada cuadro: su estado y lo que le pasa
	xor a			;780e   ; 0xD4F1 = 0
	ld (0d4f1h),a		;780f
	call 0af18h		;7812   ; fichas_de_cada_cuadro: las fichas de 0xCB80, 0xCC00 y 0xCC80, p11:AF47 y p11:B23F
	call 0b2bch		;7815   ; fichas_df80: las 8 fichas de 0xDF80 en cada cuadro
	call 0b404h		;7818   ; los_que_siguen: con 0xCAA0 = 3, p03:B4AF; si no, las tres fichas (0xE240, 0xE248, 0xDFD8) por el rastro
	call 041efh		;781b   ; bancos_14: pone el 14 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b558h		;781e   ; p14:B558
	call 0ba62h		;7821   ; p14:BA62
	call 041b5h		;7824   ; bancos_1_4_8: pone el 1 en 0x6000, el 4 en 0x8000, el 8 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a842h		;7827   ; p08:A842
	call 04142h		;782a   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	call 092c0h		;782d   ; mira_bed7: si p15:BED7 da Z, se acaba la alerta
	call 0952ch		;7830   ; llegan_actores: con la alerta 2 (sin 0xCB75 ni 0xCA67): llegan actores por los lados de la sala
	call 09372h		;7833   ; alerta_1_cada_cuadro: la alerta 1: con 0xD42B a 0 se acaba; si no, baja (p04:946F)
	call 05f12h		;7836   ; a_p12_6ad4: p12:6AD4 con el banco 12 en 0x6000
	ld a,(0cb21h)		;7839   ; salvo con 0xCB21 = 2, p04:8000
	cp 002h		;783c
	call nz,08000h		;783e   ; actores_cada_cuadro: los 24 actores de cada cuadro; con la alerta en 1 y sin 0xD42B, antes p04:831B
	call 0827bh		;7841   ; mira_salir_de_la_sala: en la zona 4 sala 9, o con alerta: los actores que salen de la sala
	call 09982h		;7844   ; acuden_al_ruido: al acabar la cuenta de 0xD446 (4 al disparar, p03:AF12), sin alerta 2: los actores van a donde estaba Snake (0xD41C)
	call 040f0h		;7847   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 08bf1h		;784a
	call 041b0h		;784d   ; bancos_7: pone el 7 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0ac38h		;7850   ; p07:AC38
	call 041a0h		;7853   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a000h		;7856   ; p06:A000
	call 040f0h		;7859   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 05f57h		;785c   ; a_p12_6ce0: p12:6CE0 con el banco 12 en 0x6000
	call 041d5h		;785f   ; bancos_11: pone el 11 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a6e1h		;7862
	call 0bcd1h		;7865
	call 040f0h		;7868   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b329h		;786b   ; sprites_df80: las fichas de 0xDF80 sin dibujo de fondo son sprites (desde el 8, 0xDC20, colores en 0xDA80)
	call 0b4e0h		;786e   ; dibuja_los_que_siguen: p03:B4E6 y p03:B563
	call 05dabh		;7871   ; a_p12_7ddc: p12:7DDC con el banco 12 en 0x6000
	call 04142h		;7874   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	call 09a80h		;7877   ; lanzado_cada_cuadro: sin 0xD445, las 6 fichas de lo que lanzan los actores: p06:A7E9, p14:BA36, p04:9C82 y p06:A979
	call 040f0h		;787a   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0bc4bh		;787d   ; coge_cosas: salvo con 0xCB21 = 2 o saliendo: las cosas de 0xD7C0 que toca Snake se cogen
	ld a,(0caa8h)		;7880   ; con 0xCAA8 se acaba aqui
	or a			;7883
	jp nz,L_7902		;7884
	call 08adfh		;7887   ; a_p07_a996: p07:A996 con el banco 7 en 0xA000
	call 08acfh		;788a   ; a_p07_a009: p07:A009 con el banco 7 en 0xA000
	call 041d5h		;788d   ; bancos_11: pone el 11 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0bb1eh		;7890   ; p11:BB1E
	call 0bc0ch		;7893   ; p11:BC0C
	call 040f0h		;7896   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	ld a,(0cb21h)		;7899   ; con 0xCB21 = 2 se salta lo que sigue
	cp 002h		;789c
	jr z,L_78F7		;789e
	call 08affh		;78a0   ; a_p11_a3c4: p11:A3C4 con el banco 11 en 0xA000
	call 0bb4ch		;78a3   ; tercera_barra_cada_cuadro: sin 0xDFF0: p03:BB91
	call 041efh		;78a6   ; bancos_14: pone el 14 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b761h		;78a9   ; p14:B761
	call 041cdh		;78ac   ; bancos_10: pone el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a170h		;78af   ; p10:A170
	call 0a067h		;78b2   ; p10:A067
	call 0a143h		;78b5   ; p10:A143
	call 0a4f1h		;78b8   ; p10:A4F1
	call 0a1d2h		;78bb   ; p10:A1D2
	call 0a24dh		;78be   ; p10:A24D
	call 041d2h		;78c1   ; bancos_1_2_11: pone el 1 en 0x6000, el 2 en 0x8000, el 11 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b8c2h		;78c4   ; p11:B8C2
	call 0bb49h		;78c7   ; p11:BB49
	call 040f0h		;78ca   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 08ba8h		;78cd   ; a_p11_b9c1: p11:B9C1 con el banco 11 en 0xA000
	call 0b132h		;78d0   ; llamada_cada_cuadro: sin llamada (0xE1E8 = 0), nada
	call 08b0fh		;78d3   ; a_p09_a000: p09:A000 con el banco 9 en 0xA000
	call 08b17h		;78d6   ; a_p09_a07b: p09:A07B con el banco 9 en 0xA000
	call 08b58h		;78d9   ; a_p09_a1a1: p09:A1A1 con el banco 9 en 0xA000
	call 041a0h		;78dc   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a428h		;78df   ; p06:A428
	call 0ace2h		;78e2   ; p06:ACE2
	call 041d5h		;78e5   ; bancos_11: pone el 11 en 0xA000 (con su copia en 0xC381-0xC383)
	ld a,(0ca01h)		;78e8   ; en el paso 0, p11:AEC9 y p11:A61E
	or a			;78eb
	jr nz,L_78F4		;78ec
	call 0aec9h		;78ee   ; p11:AEC9
	call 0a61eh		;78f1   ; p11:A61E
L_78F4:
	call 040f0h		;78f4   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
L_78F7:
	call 089aah		;78f7   ; el dibujo de quieto si toca
	ld a,(0cb21h)		;78fa   ; salvo con 0xCB21 = 2, p03:B5B5
	cp 002h		;78fd
	call nz,0b5b5h		;78ff   ; dibuja_el_de_dfd8: el de 0xDFD8: sprites 22-25 (0xDC58), patrones desde 0xE0, colores de p08:BB7F y p08:BB9E
L_7902:
	call 05dc3h		;7902   ; a_p12_7688: p12:7688 con el banco 12 en 0x6000
L_7905:
	jp sprites_a_vram_turnos		;7905   ; los sprites a la VRAM
bucle_del_juego_zona_12:		; la lista corta de la zona 0x12, salas 0-0x0B
	ld a,(0caa8h)		;7908   ; lee 1 mientras se ve el rotulo de la cosa cogida
	or a			;790b
	jr z,L_7914		;790c
	call 0bf14h		;790e   ; con 0xCAA8, solo p03:BF14
	jp L_797E		;7911
L_7914:
	call 05f5fh		;7914   ; a_p12_6d78: p12:6D78 con el banco 12 en 0x6000
	call 04142h		;7917   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	call 089c3h		;791a   ; fichas_d800: las 4 fichas de 0x20 bytes de 0xD800 (o la de 0xD860 en las especiales)
	call 041f4h		;791d   ; bancos_1_2_15: pone el 1 en 0x6000, el 2 en 0x8000, el 15 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a316h		;7920
	call 040f0h		;7923   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a1deh		;7926   ; snake_cada_cuadro: Snake en cada cuadro: su estado y lo que le pasa
	xor a			;7929
	ld (0d4f1h),a		;792a
	call 0af18h		;792d   ; fichas_de_cada_cuadro: las fichas de 0xCB80, 0xCC00 y 0xCC80, p11:AF47 y p11:B23F
	call 0b2bch		;7930   ; fichas_df80: las 8 fichas de 0xDF80 en cada cuadro
	call 04142h		;7933   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	call 09a80h		;7936   ; lanzado_cada_cuadro: sin 0xD445, las 6 fichas de lo que lanzan los actores: p06:A7E9, p14:BA36, p04:9C82 y p06:A979
	call 041efh		;7939   ; bancos_14: pone el 14 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0aa5eh		;793c   ; p14:AA5E
	call 041d2h		;793f   ; bancos_1_2_11: pone el 1 en 0x6000, el 2 en 0x8000, el 11 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a6e1h		;7942
	call 040f0h		;7945   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b329h		;7948   ; sprites_df80: las fichas de 0xDF80 sin dibujo de fondo son sprites (desde el 8, 0xDC20, colores en 0xDA80)
	ld a,(0ca41h)		;794b   ; saliendo de la sala se salta lo del banco 7
	or a			;794e
	jr nz,L_7972		;794f
	call 041b0h		;7951   ; bancos_7: pone el 7 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0ad57h		;7954
	call 0ae57h		;7957
	call 0b037h		;795a
	call 0af64h		;795d
	call 0af39h		;7960   ; p07:AF39
	call 0b309h		;7963   ; p07:B309
	call 0aff7h		;7966
	call 0b338h		;7969   ; p07:B338
	call 0be40h		;796c   ; p07:BE40
	call 040f0h		;796f   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
L_7972:
	call 0bc4bh		;7972   ; coge_cosas: salvo con 0xCB21 = 2 o saliendo: las cosas de 0xD7C0 que toca Snake se cogen
	call 0b132h		;7975   ; llamada_cada_cuadro: sin llamada (0xE1E8 = 0), nada
	call 05f57h		;7978   ; a_p12_6ce0: p12:6CE0 con el banco 12 en 0x6000
	call 089aah		;797b   ; quieto_si: con 0xCA28, 0xD434, 0xCAE7 o 0xCB3C, el dibujo de quieto
L_797E:
	call 05dc3h		;797e   ; a_p12_7688: p12:7688 con el banco 12 en 0x6000
	call 08998h		;7981   ; y una espera
	jp sprites_a_vram_turnos		;7984   ; sprites_a_vram_turnos: los sprites a la VRAM, cambiando el orden cada cuadro para que no desaparezcan
apunta_bancos_4_5:		; apunta (p02:8656) con la rapidez A, guardando el banco de 0xA000
	ld b,a			;7987
	ld a,(0c383h)		;7988   ; el banco de 0xA000 de ahora
	push af			;798b
	ld a,b			;798c
	call 040f0h		;798d   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 08656h		;7990   ; apunta: la velocidad para ir de (H, L) a (D, E) con la rapidez A, con un poco de azar
	call 04142h		;7993   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	pop af			;7996   ; y otra vez el de antes
	push af			;7997
	jp 041a3h		;7998
a_p04_96ba:		; p04:96BA con el banco 4 en 0x8000
	call 04142h		;799b   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	call 096bah		;799e   ; sin_llegadas: acarreo en las zonas sin llegadas: la 0x10, la 0x0C salas 0-3, la 0x0D sala 0
	jr L_79B1		;79a1
a_p04_924c:		; p04:924C con el banco 4 en 0x8000
	call 04142h		;79a3   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0924ch		;79a6   ; acaba_la_alerta: los actores de otras salas fuera, la alerta a 0 y p04:94B2
	jr L_79B1		;79a9
a_p04_9cee:		; p04:9CEE con el banco 4 en 0x8000
	call 04142h		;79ab   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	call 09ceeh		;79ae   ; aviso_08_20: el aviso B = 8, C = 0x20
L_79B1:
	jp 040f0h		;79b1   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
a_p14_b43d:		; p14:B43D con el banco 14 en 0xA000
	call 04179h		;79b4   ; bancos_13_14: pone el 13 en 0x8000, el 14 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b43dh		;79b7   ; p14:B43D
	jr L_79B1		;79ba
a_p04_9949:		; p04:9949 con el banco 4 en 0x8000
	call 04142h		;79bc   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	call 09949h		;79bf   ; alguien_ve_a_snake: p14:B128: la alerta (la musica 0x8C y 0xCA5F)
	jr L_79B1		;79c2
llama_7a27_0:		; p01:7A27 con A = 0 y los bancos 4 y 5
	xor a			;79c4
	jr L_79C9		;79c5
llama_7a27_1:		; p01:7A27 con A = 1 y los bancos 4 y 5
	ld a,001h		;79c7
L_79C9:
	call 040f0h		;79c9   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call mensaje_b63e		;79cc   ; mensaje_b63e: 0xD8A8 = A (la ventana estrecha o no) y p03:B63E
	jr L_79F7		;79cf
a_p02_86c3:		; angulo_hacia (p02:86C3) con el banco 2
	call 041bah		;79d1   ; bancos_1_2_8: pone el 1 en 0x6000, el 2 en 0x8000, el 8 en 0xA000 (con su copia en 0xC381-0xC383)
	call 086c3h		;79d4   ; angulo_hacia: el angulo de (H, L) a (D, E): 0xCA5C en el octante, 0xCA5D entero, y los signos en 0xCA5A-0xCA5B
	jr L_79F7		;79d7
a_p03_b67d:		; p03:B67D con el banco 3 en 0xA000
	call 040f0h		;79d9   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b67dh		;79dc   ; barrido_2: 0xE270 = 2: el barrido de la otra pagina desde (E, D), de 4 en 4
	jr L_79F7		;79df
a_p03_b6c8:		; p03:B6C8 con el banco 3 en 0xA000
	call 040f0h		;79e1   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b6c8h		;79e4   ; barrido_cada_cuadro: el barrido de 0xE270: 1 por pasos (p03:B7A1), 2 de 4 en 4 con franjas de la otra pagina
	jr L_79F7		;79e7
a_p03_b11f:		; p03:B11F con el banco 3 en 0xA000
	call 040f0h		;79e9   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b11fh		;79ec   ; empieza_llamada: la llamada A: 0xE1E8 = 1, 0xE1E9 = A, 0xE1EA = 0, 0xE1EB = 0x0E
	jr L_79F7		;79ef
a_p03_b132:		; p03:B132 con el banco 3 en 0xA000
	call 040f0h		;79f1   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b132h		;79f4   ; llamada_cada_cuadro: sin llamada (0xE1E8 = 0), nada
L_79F7:
	jp 04142h		;79f7   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
a_p03_b19a:		; p03:B19A con el banco 3 en 0xA000
	call 040f0h		;79fa   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b19ah		;79fd   ; acaba_llamada: borra el aviso y 0xE1E8 = 0
	jr L_79F7		;7a00
a_p03_b68e:		; p03:B68E con el banco 3 en 0xA000
	call 040f0h		;7a02   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b68eh		;7a05   ; barrido_1: 0xE270 = 1: el barrido por pasos desde (E, D)
	jr L_79F7		;7a08
a_p03_b1a3:		; p03:B1A3 con el banco 3 en 0xA000
	call 040f0h		;7a0a   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b1a3h		;7a0d   ; borra_aviso: X = 0xD0, Y = 0, 0x20 x 0x14 a 0 en las dos paginas
	jr L_79F7		;7a10
L_7A12:
	call musica_de_la_zona_si		;7a12   ; musica_de_la_zona_si: ni con 0xC697
	jr L_79F7		;7a15
a_p03_b1ba:		; p03:B1BA con el banco 3 en 0xA000
	call 040f0h		;7a17   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b1bah		;7a1a   ; algo_en_la_sala: DE = la fila y la columna de ahora
	jr L_79F7		;7a1d
a_p02_8475:		; paleta_de_la_sala (p02:8475) con el banco 2
	call 040f0h		;7a1f   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 08475h		;7a22   ; paleta_de_la_sala: la paleta comun y la de la sala
	jr L_79F7		;7a25
mensaje_b63e:		; 0xD8A8 = A (la ventana estrecha o no) y p03:B63E
	ld (0d8a8h),a		;7a27   ; guarda 1: la ventana del mensaje es estrecha (0xB8 x 0x28)
	jp 0b63eh		;7a2a   ; quita_la_ventana: lo guardado en Y = 0xD8 otra vez en su sitio, y 0xD8A8 = 0
llama_7a27_1_bancos_8:
	call llama_7a27_1		;7a2d   ; llama_7a27_1: p01:7A27 con A = 1 y los bancos 4 y 5
	jp 041bdh		;7a30   ; bancos_8: pone el 8 en 0xA000 (con su copia en 0xC381-0xC383)
a_p03_b67d_b_10:		; a_p03_b67d y deja el banco 10
	call a_p03_b67d		;7a33   ; a_p03_b67d: p03:B67D con el banco 3 en 0xA000
	jr L_7A3B		;7a36
a_p03_b6c8_b_10:		; a_p03_b6c8 y deja el banco 10
	call a_p03_b6c8		;7a38   ; a_p03_b6c8: p03:B6C8 con el banco 3 en 0xA000
L_7A3B:
	jp 041cdh		;7a3b   ; bancos_10: pone el 10 en 0xA000 (con su copia en 0xC381-0xC383)
llama_7a27_1_bancos_10:
	call llama_7a27_1		;7a3e   ; llama_7a27_1: p01:7A27 con A = 1 y los bancos 4 y 5
	jr L_7A3B		;7a41
musica_de_la_zona_bancos_15:
	call musica_de_la_zona_si		;7a43   ; musica_de_la_zona_si: ni con 0xC697
	jr $+5		;7a46

; ----------------------------------------------------------------------
; DATOS sin identificar  0x7a48..0x7a4b  (3 bytes)
DATA_7A48:
	defb 0cdh,085h,07ch	; 7a48

; ======================================================================
; CODIGO 0x7a4b..0x7a95  (74 bytes)
; ======================================================================


L_7A4B:
	jp 041f7h		;7a4b   ; bancos_15: pone el 15 en 0xA000 (con su copia en 0xC381-0xC383)
apunta_con_b_bancos_15:
	call 040f0h		;7a4e   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 08658h		;7a51   ; apunta_con_b: como p02:8656 con 0xCACE = B (distinto de 0: sin azar)
	call 0413fh		;7a54   ; bancos_1_4_5: pone el 1 en 0x6000, el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	jr L_7A4B		;7a57
llama_7a27_1_bancos_14:
	call llama_7a27_1		;7a59   ; llama_7a27_1: p01:7A27 con A = 1 y los bancos 4 y 5
	jp 041efh		;7a5c   ; bancos_14: pone el 14 en 0xA000 (con su copia en 0xC381-0xC383)
a_p02_8475_2:		; paleta_de_la_sala (p02:8475) con el banco 2
	call 040f0h		;7a5f   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 08475h		;7a62   ; paleta_de_la_sala: la paleta comun y la de la sala
	jp 041b5h		;7a65   ; bancos_1_4_8: pone el 1 en 0x6000, el 4 en 0x8000, el 8 en 0xA000 (con su copia en 0xC381-0xC383)
a_p03_a8d8:		; p03:A8D8 con el banco 3 en 0xA000
	call 040f0h		;7a68   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a8d8h		;7a6b   ; escena_de_cb5a: Snake mirando abajo, la pantalla limpia, los dibujos de p32:70F9, la paleta de p56:B97D...
	jr $+42		;7a6e
a_p03_b108:		; p03:B108 con el banco 3 en 0xA000
	call 040f0h		;7a70   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b108h		;7a73   ; llamada_800e: la conversacion de p48:800E; si encuentra ficha, la llamada 0 (p03:B11F)
	jr $+34		;7a76
a_p02_9319:		; p02:9319 con el banco 2 en 0x8000
	call 040f0h		;7a78   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 09319h		;7a7b   ; a_p10_b3e5: p10:B3E5 con el banco 10 en 0xA000
	jr $+26		;7a7e
a_p02_9db1:		; p02:9DB1 con el banco 2 en 0x8000
	call 040f0h		;7a80   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 09db1h		;7a83   ; llama_6e0d_a3c8: p01:6E0D y p06:A3C8
	jr $+18		;7a86
rutina_de_fase_b_1_4_5:		; rutina_de_fase y deja los bancos 1, 4 y 5
	call rutina_de_fase		;7a88   ; rutina_de_fase: HL = la rutina de la zona en la lista de la fase 0xCA22 (p06:B40C)
	jr $+13		;7a8b
a_p03_bb38:		; p03:BB38 con el banco 3 en 0xA000
	call 040f0h		;7a8d   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0bb38h		;7a90   ; pinta_tercera_barra: el marco de la barra de 0xCA54...
	jr $+5		;7a93

; ----------------------------------------------------------------------
; DATOS sin identificar  0x7a95..0x7a98  (3 bytes)
DATA_7A95:
	defb 0cdh,0a7h,059h	; 7a95

; ======================================================================
; CODIGO 0x7a98..0x7b87  (239 bytes)
; ======================================================================


L_7A98:
	jp 0413fh		;7a98   ; bancos_1_4_5: pone el 1 en 0x6000, el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
dibujos_de_93e5_bancos_5:
	call dibujos_de_93e5		;7a9b   ; dibujos_de_93e5: la lista de dibujos A de p44:93E5 en la VRAM de 0x6000
	jr L_7A98		;7a9e
a_p03_b814:		; p03:B814 con el banco 3 en 0xA000
	call 040f0h		;7aa0   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b814h		;7aa3   ; pon_mosaico_de_quien_habla: la ficha B de 0xE260 (8 bytes) con el mosaico A (6 x 4 de p44:93FD) en DE; el 4 quita el bit 1 de 0xD7D2
	jr L_7A98		;7aa6
a_p03_b8ac:		; p03:B8AC con el banco 3 en 0xA000
	call 040f0h		;7aa8   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b8ach		;7aab   ; mosaicos_de_quien_habla: cada 8 cuadros, 0xCAB9 uno mas
	jr L_7A98		;7aae
a_p03_b866:		; p03:B866 con el banco 3 en 0xA000
	call 040f0h		;7ab0   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b866h		;7ab3   ; quita_mosaico_de_quien_habla: la ficha A de 0xE260 libre y su sitio (0x20 x 0x30) a 0
	jr L_7A98		;7ab6
a_p02_8507:		; paleta_b914 (p02:8507) con el banco 2
	call 040f0h		;7ab8   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 08507h		;7abb   ; paleta_b914: la paleta de p56:B914
	jr L_7A98		;7abe
a_p02_905e:		; p02:905E con el banco 2 en 0x8000
	call 040f0h		;7ac0   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0905eh		;7ac3   ; deja_cosa: deja la cosa C en (D, E), en puntos pares
	jr L_7A98		;7ac6
a_p04_9ca1:		; p04:9CA1 con el banco 4 en 0x8000
	call 04142h		;7ac8   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	call 09ca1h		;7acb
	jr L_7AF6		;7ace
a_p04_924c_2:		; p04:924C con el banco 4 en 0x8000
	call 04142h		;7ad0   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0924ch		;7ad3   ; acaba_la_alerta: los actores de otras salas fuera, la alerta a 0 y p04:94B2
	jr L_7AF6		;7ad6
a_p04_9949_2:		; p04:9949 con el banco 4 en 0x8000
	call 04142h		;7ad8   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	call 09949h		;7adb   ; alguien_ve_a_snake: p14:B128: la alerta (la musica 0x8C y 0xCA5F)
	jr L_7AF6		;7ade
a_p04_82fd:		; p04:82FD con el banco 4 en 0x8000
	call 04142h		;7ae0   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	call 082fdh		;7ae3   ; fin_de_alerta_si: los actores desde 0xD300: nada
	jr L_7AF6		;7ae6
a_p04_834c:		; p04:834C con el banco 4 en 0x8000
	call 04142h		;7ae8   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0834ch		;7aeb   ; quita_actor: sus sprites libres y fuera; el 0x13 apunta en 0xD4F8, el 0x0B con alerta 0xCA67 = 0
	jr L_7AF6		;7aee
a_p04_8326:		; p04:8326 con el banco 4 en 0x8000
	call 04142h		;7af0   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	call 08326h		;7af3   ; cae_el_actor: el sonido 0x0F, fuera (p04:834C) y p04:92F4; el tipo 3 ademas quita 0xD430
L_7AF6:
	jp 041adh		;7af6   ; bancos_1_2_7: pone el 1 en 0x6000, el 2 en 0x8000, el 7 en 0xA000 (con su copia en 0xC381-0xC383)
a_p04_8ebe:		; p04:8EBE con el banco 4 en 0x8000
	call 04142h		;7af9   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	call 08ebeh		;7afc   ; a_p06_b5fb_guarda: p06:B5FB guardando el banco de 0xA000
	jr L_7AF6		;7aff
a_p04_8c4a:		; p04:8C4A con el banco 4 en 0x8000
	call 04142h		;7b01   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	call 08c4ah		;7b04   ; deja_la_cosa_d800: la cosa C en la X - 8, la Y - 8 de la ficha
	jr L_7AF6		;7b07
a_p14_ab01:		; p14:AB01 con el banco 14 en 0xA000
	call 0413fh		;7b09   ; bancos_1_4_5: pone el 1 en 0x6000, el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	call 041efh		;7b0c   ; bancos_14: pone el 14 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0ab01h		;7b0f   ; p14:AB01
	jr L_7AF6		;7b12
a_p13_9371:		; p13:9371 con el banco 13 en 0x8000
	call 04176h		;7b14   ; bancos_1_13_14: pone el 1 en 0x6000, el 13 en 0x8000, el 14 en 0xA000 (con su copia en 0xC381-0xC383)
	call 09371h		;7b17   ; p13:9371
	jr L_7B2A		;7b1a
a_p13_9387:		; p13:9387 con el banco 13 en 0x8000
	call 04176h		;7b1c   ; bancos_1_13_14: pone el 1 en 0x6000, el 13 en 0x8000, el 14 en 0xA000 (con su copia en 0xC381-0xC383)
	call 09387h		;7b1f   ; p13:9387
	jr L_7B2A		;7b22
a_p13_93f7:		; p13:93F7 con el banco 13 en 0x8000
	call 04176h		;7b24   ; bancos_1_13_14: pone el 1 en 0x6000, el 13 en 0x8000, el 14 en 0xA000 (con su copia en 0xC381-0xC383)
	call 093f7h		;7b27
L_7B2A:
	jp 041d2h		;7b2a   ; bancos_1_2_11: pone el 1 en 0x6000, el 2 en 0x8000, el 11 en 0xA000 (con su copia en 0xC381-0xC383)
a_p13_941a:		; p13:941A con el banco 13 en 0x8000
	call 04176h		;7b2d   ; bancos_1_13_14: pone el 1 en 0x6000, el 13 en 0x8000, el 14 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0941ah		;7b30
	jr L_7B2A		;7b33
a_p04_81c5:		; p04:81C5 con el banco 4 en 0x8000
	call 04142h		;7b35   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	call 041bdh		;7b38   ; bancos_8: pone el 8 en 0xA000 (con su copia en 0xC381-0xC383)
	call 081c5h		;7b3b   ; sprites_del_actor: sus sprites libres (p04:820A) y sus colores de p08:B9FB (p08:BA2F para el 1 con 0xD437)
	jr L_7B2A		;7b3e
a_p04_8957:		; p04:8957 con el banco 4 en 0x8000
	call 04142h		;7b40   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	call 08957h		;7b43   ; mosaico_a9ed: en X = 0x30, Y = 0
	jr L_7B6B		;7b46
dibujos_de_93e5_bancos_14:
	call dibujos_de_93e5		;7b48   ; dibujos_de_93e5: la lista de dibujos A de p44:93E5 en la VRAM de 0x6000
	jr L_7B6B		;7b4b
a_p03_b814_2:		; p03:B814 con el banco 3 en 0xA000
	call 040f0h		;7b4d   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b814h		;7b50   ; pon_mosaico_de_quien_habla: la ficha B de 0xE260 (8 bytes) con el mosaico A (6 x 4 de p44:93FD) en DE; el 4 quita el bit 1 de 0xD7D2
	jr L_7B6B		;7b53
a_p03_b8ac_2:		; p03:B8AC con el banco 3 en 0xA000
	call 040f0h		;7b55   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b8ach		;7b58   ; mosaicos_de_quien_habla: cada 8 cuadros, 0xCAB9 uno mas
	jr L_7B6B		;7b5b
a_p03_b866_2:		; p03:B866 con el banco 3 en 0xA000
	call 040f0h		;7b5d   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b866h		;7b60   ; quita_mosaico_de_quien_habla: la ficha A de 0xE260 libre y su sitio (0x20 x 0x30) a 0
	jr L_7B6B		;7b63
a_p08_a187:		; p08:A187 con el banco 8 en 0xA000
	call 041bdh		;7b65   ; bancos_8: pone el 8 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a187h		;7b68   ; p08:A187
L_7B6B:
	jp 04176h		;7b6b   ; bancos_1_13_14: pone el 1 en 0x6000, el 13 en 0x8000, el 14 en 0xA000 (con su copia en 0xC381-0xC383)
a_p08_a13b:		; p08:A13B con el banco 8 en 0xA000
	call 041bdh		;7b6e   ; bancos_8: pone el 8 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a13bh		;7b71
	jr L_7B6B		;7b74
sonido_8e_y_9955_bancos_14:
	call sonido_8e_y_9955		;7b76   ; sonido_8e_y_9955: el sonido 0x8E y p04:9955
	call 040f0h		;7b79   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	jp 041efh		;7b7c   ; bancos_14: pone el 14 en 0xA000 (con su copia en 0xC381-0xC383)
a_p04_92eb:		; p04:92EB con el banco 4 en 0x8000
	call 04142h		;7b7f   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	call 092ebh		;7b82   ; d406_si: si p06:B55A no da acarreo, (HL) = 2
	jr $+5		;7b85

; ----------------------------------------------------------------------
; DATOS sin identificar  0x7b87..0x7b8a  (3 bytes)
DATA_7B87:
	defb 0cdh,098h,07bh	; 7b87

; ======================================================================
; CODIGO 0x7b8a..0x7d95  (523 bytes)
; ======================================================================


L_7B8A:
	jp 041c2h		;7b8a   ; bancos_1_2_9: pone el 1 en 0x6000, el 2 en 0x8000, el 9 en 0xA000 (con su copia en 0xC381-0xC383)
a_p15_bdb8:		; p15:BDB8 con el banco 15 en 0xA000
	call 04142h		;7b8d   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	call 041f7h		;7b90   ; bancos_15: pone el 15 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0bdb8h		;7b93
	jr L_7B8A		;7b96
sonido_8e_y_9955:		; el sonido 0x8E y p04:9955
	call sonido_8e		;7b98   ; sonido_8e: pide el sonido 0x8E (de los que tienen la partitura en un banco de musica, p16:4CE3) (antes, L_6CDA)
	call 04142h		;7b9b   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	jp 09955h		;7b9e   ; a_p14_b176_guarda: p14:B176 guardando el banco de 0xA000
a_p04_924c_3:		; p04:924C con el banco 4 en 0x8000
	call 0413fh		;7ba1   ; bancos_1_4_5: pone el 1 en 0x6000, el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0924ch		;7ba4   ; acaba_la_alerta: los actores de otras salas fuera, la alerta a 0 y p04:94B2
	jp 041f4h		;7ba7   ; bancos_1_2_15: pone el 1 en 0x6000, el 2 en 0x8000, el 15 en 0xA000 (con su copia en 0xC381-0xC383)
borra_lo_de_la_sala:		; borra 0xD400-0xD415, las 24 fichas de 0x40 bytes desde 0xCE2E (18 bytes de cada una), 0xD460-0xD4BF y 0xD4C0-0xD4DF
	ld hl,0d400h		;7baa   ; apunta a los 22 sprites que se reparten los actores (1 = ocupado)
	ld bc,00015h		;7bad
	call 04236h		;7bb0   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	ld hl,0ce2eh		;7bb3   ; desde 0xCE2E...
	ld b,018h		;7bb6   ; ...24 fichas...
L_7BB8:
	push hl			;7bb8
	push bc			;7bb9
	ld bc,00011h		;7bba   ; ...18 bytes a cero...
	call 04236h		;7bbd   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	pop bc			;7bc0
	pop hl			;7bc1
	ld a,040h		;7bc2   ; ...cada 0x40
	call 0423eh		;7bc4   ; suma_a_hl: HL = HL + A
	djnz L_7BB8		;7bc7
	ld a,(0ca4ah)		;7bc9   ; 0xD417 = 0xD420 = 0x0A en las zonas 0x0C y desde la 0x10; 0x1E en las demas
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
	ld hl,0d460h		;7bdf   ; 0xD460-0xD4BF a cero
	ld bc,0005fh		;7be2
	call 04236h		;7be5   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	ld hl,0d4c0h		;7be8   ; 0xD4C0-0xD4DF a cero
	ld bc,0001fh		;7beb
	jp 04236h		;7bee   ; borra_bloque: pone a cero BC + 1 bytes desde HL
sala_de_ca50:		; 0xCA4B = la sala de la fila y la columna de 0xCA50-0xCA51
	ld bc,(0ca50h)		;7bf1   ; lee la fila de la sala en la zona (uno mas al salir por arriba) y el byte siguiente (16 bits)
sala_de_bc:		; 0xCA4B = la sala de la fila C y la columna B
	call sala_de_casilla		;7bf5   ; sala_de_casilla: A = la sala de la fila C y la columna B en la tabla de 0xD900 (16 columnas por fila)
	ld (0ca4bh),a		;7bf8   ; guarda la sala de la zona
	ret			;7bfb
sala_de_casilla:		; A = la sala de la fila C y la columna B en la tabla de 0xD900 (16 columnas por fila)
	ld de,0d900h		;7bfc
	ld a,c			;7bff   ; la fila...
	ld l,a			;7c00
	ld h,000h		;7c01
	add hl,hl			;7c03   ; ...* 16...
	add hl,hl			;7c04
	add hl,hl			;7c05
	add hl,hl			;7c06
	ld a,b			;7c07   ; ...mas la columna
	call 0423eh		;7c08   ; suma_a_hl: HL = HL + A
	add hl,de			;7c0b
	ld a,(hl)			;7c0c
	ret			;7c0d
guarda_el_mapa:		; copia el mapa de la sala (0xDD00) a 0xE2C0
	ld hl,0dd00h		;7c0e   ; apunta a el mapa de la sala: 24 x 24 caracteres
	ld de,0e2c0h		;7c11
copia_mapa:		; 0x240 bytes: 24 x 24
	ld bc,00240h		;7c14
	ldir		;7c17
	ret			;7c19
vuelve_el_mapa_bancos_8:
	call vuelve_el_mapa		;7c1a   ; vuelve_el_mapa: el mapa guardado en 0xE2C0 otra vez a 0xDD00 y lo de la sala en la otra pagina
	jp 041b5h		;7c1d   ; bancos_1_4_8: pone el 1 en 0x6000, el 4 en 0x8000, el 8 en 0xA000 (con su copia en 0xC381-0xC383)
vuelve_el_mapa:		; el mapa guardado en 0xE2C0 otra vez a 0xDD00 y lo de la sala en la otra pagina
	push ix		;7c20
	ld de,0dd00h		;7c22   ; apunta a el mapa de la sala: 24 x 24 caracteres
	ld hl,0e2c0h		;7c25
	call copia_mapa		;7c28   ; copia_mapa: 0x240 bytes: 24 x 24
	call 05d4fh		;7c2b   ; 0xD400 y compania (p00:5D4F)
	ld hl,0ca42h		;7c2e   ; en la otra pagina un momento...
	ld a,(hl)			;7c31
	push af			;7c32
	push hl			;7c33
	xor 001h		;7c34
	ld (hl),a			;7c36
	call 04142h		;7c37   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0bcf5h		;7c3a   ; ...p04:BCF5...
	call 0418eh		;7c3d   ; bancos_56: pone el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	call 05fcah		;7c40   ; ...p12:7462...
	call 041f7h		;7c43   ; bancos_15: pone el 15 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a008h		;7c46   ; ...p15:A008
	call 040f0h		;7c49   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	pop hl			;7c4c   ; la pagina de antes
	pop af			;7c4d
	ld (hl),a			;7c4e
	pop ix		;7c4f
	ret			;7c51
mira_ca64:		; 0xCA64 = 1 en la zona 0 fila 5 o la zona 9 fila 2; si cambia, la musica
	ld hl,0ca64h		;7c52
	ld c,(hl)			;7c55   ; C = el de antes
	ld b,000h		;7c56
	ld a,(0ca4ah)		;7c58   ; lee la zona
	and a			;7c5b
	ld d,005h		;7c5c
	jr z,L_7C66		;7c5e
	cp 009h		;7c60
	ld d,002h		;7c62
	jr nz,L_7C6F		;7c64
L_7C66:
	ld a,(0ca50h)		;7c66   ; la fila...
	cp d			;7c69
	jr nz,L_7C6F		;7c6a
	inc b			;7c6c   ; ...casa: 1
	jr L_7C6F		;7c6d
L_7C6F:
	ld a,b			;7c6f
	ld (hl),a			;7c70
	xor c			;7c71   ; el mismo: nada
	ret z			;7c72
	ld a,c			;7c73   ; de 1 a 0: p01:7CA7
	and a			;7c74
	jr z,musica_6a11		;7c75
musica_de_la_zona_si:		; con 0xCAF6, o sin 0xC697, la musica de la zona
	ld a,(0caf6h)		;7c77
	and a			;7c7a   ; con 0xCAF6, ya
	jr nz,L_7C82		;7c7b
	ld a,(0c697h)		;7c7d   ; sin el, solo si 0xC697 esta a cero
	and a			;7c80
	ret nz			;7c81
L_7C82:
	call rutina_de_fase		;7c82   ; la rutina de la musica de la zona...
pide_musica_hl:		; la musica de la rutina HL: si no es la pendiente, pendiente dentro de 0x78 cuadros
	ld de,(0ca19h)		;7c85   ; lee la musica pendiente: la rutina que la pide (16 bits)
	call 00020h		;7c89   ; BIOS DCOMPR - Compares HL with DE | la misma que la pendiente: p01:7C9F
	jr z,L_7C9F		;7c8c
	ld (0ca20h),hl		;7c8e   ; la que suena y la pendiente
	ld (0ca19h),hl		;7c91   ; guarda la musica pendiente: la rutina que la pide (16 bits)
	ld hl,0ca18h		;7c94   ; si ya hay espera, se queda
	ld a,(hl)			;7c97
	and a			;7c98
	ret nz			;7c99
	ld (hl),078h		;7c9a   ; si no, 0x78 cuadros...
	jp orden_sonido_f4		;7c9c   ; ...y el sonido 0xF4
L_7C9F:
	call orden_sonido_f3		;7c9f   ; el sonido 0xF3...
	xor a			;7ca2   ; ...sin espera
	ld (0ca18h),a		;7ca3   ; guarda la espera hasta poner la musica pendiente
	ret			;7ca6
musica_6a11:		; 0xCA5F a cero y la musica de p01:6A11
	call quita_ca5f		;7ca7   ; quita_ca5f: con 0xCA5F: lo pone a 0, p04:9431, p04:94DA, p12:6F41, las lineas y el marcador
	ld hl,06a11h		;7caa
	jr pide_musica_hl		;7cad
quita_ca5f_bancos_7:
	call quita_ca5f		;7caf   ; quita_ca5f: con 0xCA5F: lo pone a 0, p04:9431, p04:94DA, p12:6F41, las lineas y el marcador
	jp 041b0h		;7cb2   ; bancos_7: pone el 7 en 0xA000 (con su copia en 0xC381-0xC383)
quita_ca5f_bancos_9:
	call quita_ca5f		;7cb5   ; quita_ca5f: con 0xCA5F: lo pone a 0, p04:9431, p04:94DA, p12:6F41, las lineas y el marcador
	jp 041c5h		;7cb8   ; bancos_9: pone el 9 en 0xA000 (con su copia en 0xC381-0xC383)
quita_ca5f:		; con 0xCA5F: lo pone a 0, p04:9431, p04:94DA, p12:6F41, las lineas y el marcador
	ld hl,0ca5fh		;7cbb   ; apunta a la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	ld a,(hl)			;7cbe
	and a			;7cbf
	ret z			;7cc0
	ld (hl),000h		;7cc1   ; 0xCA5F = 0
	call 04142h		;7cc3   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	call 09431h		;7cc6   ; fuera_de_otras_salas: los actores (por debajo de 0x10) de otras salas fuera; el 0x0A sin alerta 2-3, de los pasos 1-3 al 0
	call 094dah		;7cc9   ; tipos_como_antes: los actores sin el bit 7 del tipo; los de tipo menor de 0x10, con el dibujo (0x17) y el eje (0x16) de antes
	call 040f0h		;7ccc   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 05f98h		;7ccf   ; a_p12_6f41: p12:6F41 con el banco 12 en 0x6000
	call 0439dh		;7cd2   ; las lineas de p00:439D
	ld a,(0cb00h)		;7cd5   ; con el estado de Snake 0x11-0x12, el marcador a la otra pagina; si no, a esta
	sub 011h		;7cd8
	cp 002h		;7cda
	jp nc,0438ah		;7cdc   ; copia_marcador_a_esta: copia las lineas 0x16-0x51 de la otra pagina a la de dibujar (YMMM)
	jp 0437eh		;7cdf   ; copia_marcador_a_la_otra: copia las lineas 0x16-0x51 de la pagina en la que se dibuja a la otra (YMMM)
musica_6b8d:		; HL = p01:6B8D
	ld hl,06b8dh		;7ce2
	ret			;7ce5
rutina_de_fase:		; HL = la rutina de la zona en la lista de la fase 0xCA22 (p06:B40C)
	call 041a0h		;7ce6   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call rutina_de_fase_si		;7ce9   ; rutina_de_fase_si: sin 0xD433 y con 0xD430 = 1, p01:6B8D
	jp 040f0h		;7cec   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
rutina_de_fase_si:		; sin 0xD433 y con 0xD430 = 1, p01:6B8D
	ld a,(0d433h)		;7cef
	and a			;7cf2   ; con 0xD433, la de la fase
	jr nz,L_7CFB		;7cf3
	ld a,(0d430h)		;7cf5   ; con 0xD430 = 1...
	dec a			;7cf8
	jr z,musica_6b8d		;7cf9   ; ...p01:6B8D
L_7CFB:
	ld a,(0ca5fh)		;7cfb   ; con 0xCA5F, la de la fase
	and a			;7cfe
	jr nz,L_7D19		;7cff
	ld a,(0d4e2h)		;7d01   ; con 0xD4E2, p01:6B91
	ld hl,06b91h		;7d04
	and a			;7d07
	ret nz			;7d08
	ld a,(0d4e3h)		;7d09   ; con 0xD4E3, p01:6B85
	ld hl,06b85h		;7d0c
	and a			;7d0f
	ret nz			;7d10
	ld a,(0d4e4h)		;7d11   ; con 0xD4E4, p01:6B8D
	ld hl,06b8dh		;7d14
	and a			;7d17
	ret nz			;7d18
L_7D19:
	ld a,(0ca22h)		;7d19   ; la lista de la fase...
	ld hl,0b40ch		;7d1c
	call 043f6h		;7d1f   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
busca_zona:		; recorre una lista de p06:B40C: [zonas... 0xFE][rutina], 0xFF [la de las demas]
	ld a,(hl)			;7d22   ; 0xFF: la de las demas zonas
	inc a			;7d23
	jr z,L_7D39		;7d24
	inc a			;7d26   ; 0xFE: el final de una lista de zonas
	jr z,L_7D32		;7d27
	ld a,(0ca4ah)		;7d29   ; es esta zona?
	cp (hl)			;7d2c
	jr z,L_7D46		;7d2d
	inc hl			;7d2f   ; la siguiente zona de la lista
	jr busca_zona		;7d30
L_7D32:
	call hasta_fe		;7d32   ; detras del 0xFE...
	inc hl			;7d35   ; ...y de su rutina
	inc hl			;7d36
	jr busca_zona		;7d37
L_7D39:
	inc hl			;7d39   ; HL = la rutina de las demas
	ld a,(hl)			;7d3a
	inc hl			;7d3b
	ld h,(hl)			;7d3c
	ld l,a			;7d3d
	ret			;7d3e
hasta_fe:		; avanza HL detras del siguiente 0xFE
	ld a,(hl)			;7d3f
	inc hl			;7d40
	cp 0feh		;7d41
	ret z			;7d43
	jr hasta_fe		;7d44
L_7D46:
	call hasta_fe		;7d46   ; detras del 0xFE...
	ld e,(hl)			;7d49   ; ...HL = la rutina
	inc hl			;7d4a
	ld d,(hl)			;7d4b
	ex de,hl			;7d4c
	ld a,(0ca22h)		;7d4d   ; en la fase 3, zona 9, sin 0xD690 ni 0xD67C...
	cp 003h		;7d50
	ret nz			;7d52
	ld a,(0ca4ah)		;7d53   ; lee la zona
	cp 009h		;7d56
	ret nz			;7d58
	ld a,(0d690h)		;7d59
	ld b,a			;7d5c
	ld a,(0d67ch)		;7d5d
	or b			;7d60
	ret nz			;7d61
	ld hl,06b91h		;7d62   ; ...p01:6B91
	ret			;7d65
copia_7d95_a_3:		; 4 filas de 3 caracteres de 8 x 8 de la pagina de dibujar (X de la lista de p01:7D95, Y = 0x78; 0xFF: X = 0, Y = 0x60) a la pagina 3
	ld hl,07d95h		;7d66
	ld b,004h		;7d69
L_7D6B:
	push de			;7d6b
	push bc			;7d6c
	ld b,003h		;7d6d
L_7D6F:
	push bc			;7d6f   ; el caracter de la lista
	push hl			;7d70
	push de			;7d71
	ld a,(hl)			;7d72
	ld l,078h		;7d73   ; desde Y = 0x78
	ld h,a			;7d75
	inc a			;7d76   ; 0xFF: el hueco
	jr nz,L_7D7C		;7d77
	ld hl,00060h		;7d79   ; X = 0, Y = 0x60
L_7D7C:
	ld bc,00808h		;7d7c   ; 8 x 8 puntos
	call 0473bh		;7d7f   ; copia_rectangulo_a_3: p00:4767 de la pagina 0xCA42 a la 3
	pop de			;7d82
	pop hl			;7d83
	pop bc			;7d84
	inc hl			;7d85
	ld a,d			;7d86   ; 8 puntos a la derecha
	add a,008h		;7d87
	ld d,a			;7d89
	djnz L_7D6F		;7d8a
	pop bc			;7d8c
	pop de			;7d8d
	ld a,e			;7d8e   ; la fila siguiente, 8 lineas mas abajo
	add a,008h		;7d8f
	ld e,a			;7d91
	djnz L_7D6B		;7d92
	ret			;7d94

; ----------------------------------------------------------------------
; DATOS resto_7D95: lo apuntan con el banco puesto p01:7D66 (0x7D95); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p01:7D66 (20 bytes)
;   0x7d95..0x7da9  (20 bytes)
DATA_resto_7D95:
	defb 008h,008h,020h,0ffh,0ffh,028h,000h,000h,018h,010h,010h,030h,0ddh,046h,00bh,0ddh	; 7d95  .. ..(.....0.F..
	defb 04eh,00ah,018h,00ch	; 7da5

; ======================================================================
; CODIGO 0x7da9..0x7db8  (15 bytes)
; ======================================================================


hay_sala_al_lado:		; Z si no hay sala por la salida A (la casilla de 0xD900 vale 0xFF); con 0xD433, NZ
	ld b,a			;7da9
	ld a,(0d433h)		;7daa
	and a			;7dad
	ld a,b			;7dae
	ret nz			;7daf
	ld bc,(0ca50h)		;7db0   ; la fila y la columna de ahora
	dec a			;7db4
	call 0424dh		;7db5   ; por la salida: arriba, abajo, izquierda, derecha

; ----------------------------------------------------------------------
; DATOS tabla_7DB8: 4 destinos del despachador p00:424D (call en p01:7DB5, el
;   indice en A): 7DC0, 7DC3, 7DC6, 7DC9; lo leen p01:7DB5 (8 bytes)
;   0x7db8..0x7dc0  (8 bytes)
DATA_tabla_7DB8:
	defw 07dc0h,07dc3h,07dc6h,07dc9h	; 7db8  -> L_7DC0 L_7DC3 L_7DC6 L_7DC9

; ======================================================================
; CODIGO 0x7dc0..0x7ddc  (28 bytes)
; ======================================================================


L_7DC0:
	inc c			;7dc0   ; arriba: la fila + 1
	jr L_7DCA		;7dc1
L_7DC3:
	dec c			;7dc3   ; abajo: la fila - 1
	jr L_7DCA		;7dc4
L_7DC6:
	dec b			;7dc6   ; izquierda: la columna - 1
	jr L_7DCA		;7dc7
L_7DC9:
	inc b			;7dc9   ; derecha: la columna + 1
L_7DCA:
	ld l,c			;7dca   ; la fila * 16...
	ld h,000h		;7dcb
	add hl,hl			;7dcd
	add hl,hl			;7dce
	add hl,hl			;7dcf
	add hl,hl			;7dd0
	ld a,b			;7dd1   ; ...mas la columna...
	call 0423eh		;7dd2   ; suma_a_hl: HL = HL + A
	ld de,0d900h		;7dd5   ; ...en 0xD900
	add hl,de			;7dd8
	ld a,(hl)			;7dd9   ; la sala...
	inc a			;7dda   ; ...0xFF: no hay (Z)
	ret			;7ddb

; ----------------------------------------------------------------------
; DATOS sin identificar  0x7ddc..0x7de2  (6 bytes)
DATA_7DDC:
	defb 0cdh,0e2h,07dh,0c3h,0c2h,041h	; 7ddc

; ======================================================================
; CODIGO 0x7de2..0x7fff  (541 bytes)
; ======================================================================


cosas_fijas_de_la_sala:		; lo fijo de la sala (p01:7E0D), p07:A4EB y p11:A20D
	call lo_fijo		;7de2   ; lo_fijo: p07:AB44, el mosaico de la zona 0x0A (p01:7E22), lo pisado (p01:7E7E), los mosaicos de la sala (p01:7E3C), p06:AAC8 y p06:AB21
	call 041adh		;7de5   ; bancos_1_2_7: pone el 1 en 0x6000, el 2 en 0x8000, el 7 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a4ebh		;7de8   ; p07:A4EB
	call 041d2h		;7deb   ; bancos_1_2_11: pone el 1 en 0x6000, el 2 en 0x8000, el 11 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a20dh		;7dee
	jp 040f0h		;7df1   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
cosas_fijas_en_la_otra:		; lo mismo en la otra pagina
	ld a,(0ca42h)		;7df4   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	push af			;7df7
	xor 001h		;7df8
	ld (0ca42h),a		;7dfa   ; guarda la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	call lo_fijo		;7dfd   ; lo_fijo: p07:AB44, el mosaico de la zona 0x0A (p01:7E22), lo pisado (p01:7E7E), los mosaicos de la sala (p01:7E3C), p06:AAC8 y p06:AB21
	call 041d2h		;7e00   ; bancos_1_2_11: pone el 1 en 0x6000, el 2 en 0x8000, el 11 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a20dh		;7e03   ; p11:A20D
	pop af			;7e06
	ld (0ca42h),a		;7e07   ; guarda la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	jp 040f0h		;7e0a   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
lo_fijo:		; p07:AB44, el mosaico de la zona 0x0A (p01:7E22), lo pisado (p01:7E7E), los mosaicos de la sala (p01:7E3C), p06:AAC8 y p06:AB21
	call 08ba0h		;7e0d   ; a_p07_ab44: p07:AB44 con el banco 7 en 0xA000
	call mosaico_zona_0a		;7e10   ; mosaico_zona_0a: en la zona 0x0A sala 4, sin el bit 0 de 0xD7DA, el mosaico de p56:AE3B
	call lo_pisado_pintado		;7e13   ; lo_pisado_pintado: los mosaicos de lo que ya se piso: la especial 0x38 (p06:BD9B), la zona 0x12 (p06:BD7D) o la 0x13 (p06:BD8E)
	call mosaicos_de_la_sala		;7e16   ; mosaicos_de_la_sala: salvo dentro de un sitio, los mosaicos de p56:A7CD de esta sala
	call 041a0h		;7e19   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0aac8h		;7e1c   ; p06:AAC8
	jp 0ab21h		;7e1f   ; p06:AB21
mosaico_zona_0a:		; en la zona 0x0A sala 4, sin el bit 0 de 0xD7DA, el mosaico de p56:AE3B
	call es_zona_0a_sala_4		;7e22   ; es_zona_0a_sala_4: Z en la zona 0x0A sala 4 sin el bit 0 de 0xD7DA
	ret nz			;7e25
	jp 08535h		;7e26   ; mosaico_ae3b_bancos_9:
es_zona_0a_sala_4:		; Z en la zona 0x0A sala 4 sin el bit 0 de 0xD7DA
	ld a,(0ca4ah)		;7e29   ; lee la zona
	cp 00ah		;7e2c
	ret nz			;7e2e
	ld a,(0ca4bh)		;7e2f   ; lee la sala de la zona
	cp 004h		;7e32
	ret nz			;7e34
	ld a,(0d7dah)		;7e35
	cpl			;7e38   ; Z: sin el bit
	bit 0,a		;7e39
	ret			;7e3b
mosaicos_de_la_sala:		; salvo dentro de un sitio, los mosaicos de p56:A7CD de esta sala
	ld a,(0ca65h)		;7e3c   ; lee el sitio de 0xCBE0 en el que esta Snake (0 = ninguno)
	or a			;7e3f
	ret nz			;7e40
	call 0418eh		;7e41   ; bancos_56: pone el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	call mosaicos_a7cd		;7e44   ; mosaicos_a7cd: C = la sala de la fila y la columna
	jp 040f0h		;7e47   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
mosaicos_a7cd:		; C = la sala de la fila y la columna
	ld bc,(0ca50h)		;7e4a   ; lee la fila de la sala en la zona (uno mas al salir por arriba) y el byte siguiente (16 bits)
	call sala_de_casilla		;7e4e   ; sala_de_casilla: A = la sala de la fila C y la columna B en la tabla de 0xD900 (16 columnas por fila)
	ld c,a			;7e51
	ld hl,0a7cdh		;7e52   ; fichas de 4 bytes [zona][sala][Y][X] hasta 0xFF
L_7E55:
	ld a,(hl)			;7e55
	cp 0ffh		;7e56
	ret z			;7e58
	push hl			;7e59
	ld a,(0ca4ah)		;7e5a   ; la zona...
	cp (hl)			;7e5d
	jr nz,L_7E6E		;7e5e
	inc hl			;7e60
	ld a,c			;7e61   ; ...y la sala...
	cp (hl)			;7e62
	jr nz,L_7E6E		;7e63
	inc hl			;7e65
	ld e,(hl)			;7e66   ; ...DE = el sitio...
	inc hl			;7e67
	ld d,(hl)			;7e68
	push bc			;7e69
	call mosaico_a7c7		;7e6a   ; ...el mosaico
	pop bc			;7e6d
L_7E6E:
	pop hl			;7e6e
	ld de,00004h		;7e6f   ; la ficha siguiente
	add hl,de			;7e72
	jr L_7E55		;7e73
mosaico_a7c7:		; el mosaico de p56:A7C7, 2 x 3, con la forma 0x0A de la franja 1
	ld bc,00203h		;7e75
	ld hl,0a7c7h		;7e78
	jp 050c4h		;7e7b   ; mosaico_fa_b1: el mosaico de HL en (D, E), B filas de C caracteres, con la forma 10 de la franja 1 (p00:512C)
lo_pisado_pintado:		; los mosaicos de lo que ya se piso: la especial 0x38 (p06:BD9B), la zona 0x12 (p06:BD7D) o la 0x13 (p06:BD8E)
	ld hl,0bd9bh		;7e7e
	ld a,(0ca76h)		;7e81   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 038h		;7e84
	jr z,L_7E98		;7e86
	ld hl,0bd7dh		;7e88
	ld a,(0ca4ah)		;7e8b   ; lee la zona
	cp 012h		;7e8e
	jr z,L_7E98		;7e90
	ld hl,0bd8eh		;7e92
	cp 013h		;7e95
	ret nz			;7e97
L_7E98:
	call 041a0h		;7e98   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
L_7E9B:
	ld a,(hl)			;7e9b   ; la ficha; 0xFF acaba
	cp 0ffh		;7e9c
	jp z,040f0h		;7e9e   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	push hl			;7ea1
	call pinta_lo_pisado		;7ea2   ; pinta_lo_pisado: la sala
	pop hl			;7ea5
	ld de,00004h		;7ea6   ; la siguiente, 4 bytes mas alla
	add hl,de			;7ea9
	jr L_7E9B		;7eaa
pinta_lo_pisado:		; la sala
	ld a,(0ca4bh)		;7eac   ; lee la sala de la zona
	cp (hl)			;7eaf
	ret nz			;7eb0
	inc hl			;7eb1
	ld a,(hl)			;7eb2   ; el nibble bajo + 0x70...
	and 00fh		;7eb3
	add a,070h		;7eb5
	push hl			;7eb7
	call 040f0h		;7eb8   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b0feh		;7ebb   ; ...p03:B0FE: Z, no se ha pisado
	call 041a0h		;7ebe   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	pop hl			;7ec1
	ret z			;7ec2
	ld a,(hl)			;7ec3   ; el nibble alto: el mosaico de p06:BD1B...
	rra			;7ec4
	rra			;7ec5
	rra			;7ec6
	rra			;7ec7
	and 00fh		;7ec8
	inc hl			;7eca
	ld e,(hl)			;7ecb   ; ...en (D, E)
	inc hl			;7ecc
	ld d,(hl)			;7ecd
	ld hl,0bd1bh		;7ece
	call 043f6h		;7ed1   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld b,(hl)			;7ed4   ; B = las filas, C = las columnas
	inc hl			;7ed5
	ld c,(hl)			;7ed6
	inc hl			;7ed7
	jp 05094h		;7ed8   ; forma 8 en la franja 0
choca_con_el_empuje:		; los puntos de Snake en la direccion de 0xCA8F
	call y_x_de_snake_en_de		;7edb   ; y_x_de_snake_en_de: E = la Y, D = la X de Snake
	ld a,(0ca8fh)		;7ede   ; lee hacia donde empuja la zona (1 arriba, 2 abajo, 3 izquierda, 4 derecha; 0 nada)
	or a			;7ee1
	ret z			;7ee2
	jr choca_en_direccion		;7ee3
y_x_de_snake_en_de:		; E = la Y, D = la X de Snake
	ld a,(0cb03h)		;7ee5   ; lee la Y de Snake
	ld e,a			;7ee8
	ld a,(0cb05h)		;7ee9   ; lee la X de Snake
	ld d,a			;7eec
	ret			;7eed
choca_al_andar:		; los puntos de Snake en su direccion (sin direccion, nada)
	call y_x_de_snake_en_de		;7eee   ; y_x_de_snake_en_de: E = la Y, D = la X de Snake
	ld a,(0cb0eh)		;7ef1   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	or a			;7ef4
	ret z			;7ef5
choca_en_direccion:		; acarreo si alguno de los 3 puntos de Snake en la direccion A da con un caracter solido (p56:A30A)
	call 0418eh		;7ef6   ; bancos_56: pone el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	call L_7EFF		;7ef9
	jp 040f0h		;7efc   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
L_7EFF:
	dec a			;7eff   ; 6 bytes por direccion...
	add a,a			;7f00
	ld c,a			;7f01
	add a,a			;7f02
	add a,c			;7f03
	ld c,a			;7f04
	ld a,b			;7f05   ; ...en la tabla de B (0 normal, 1 con el estado 2)
	ld hl,0a30ah		;7f06
	call 043f6h		;7f09   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld a,c			;7f0c
	call 0423eh		;7f0d   ; suma_a_hl: HL = HL + A
	ld b,003h		;7f10   ; 3 puntos [dy][dx]
L_7F12:
	push bc			;7f12
	ld a,e			;7f13   ; la Y + dy...
	add a,(hl)			;7f14
	ld b,a			;7f15
	inc hl			;7f16
	push hl			;7f17
	ld a,d			;7f18   ; ...la X + dx
	add a,(hl)			;7f19
	ld h,a			;7f1a
	ld l,b			;7f1b
	push de			;7f1c
	call es_solido_si		;7f1d   ; solido?
	pop de			;7f20
	pop hl			;7f21
	inc hl			;7f22
	pop bc			;7f23
	ret c			;7f24   ; si: acarreo
	push hl			;7f25
	push bc			;7f26
	ld hl,0caedh		;7f27   ; si no, el caracter a 0xCAED + el punto
	ld c,a			;7f2a
	ld a,b			;7f2b
	dec a			;7f2c
	call 0423eh		;7f2d   ; suma_a_hl: HL = HL + A
	ld (hl),c			;7f30
	pop bc			;7f31
	pop hl			;7f32
	djnz L_7F12		;7f33
	and a			;7f35   ; ninguno: sin acarreo
	ret			;7f36
es_solido:		; p01:7F3D guardando HL
	push hl			;7f37
	call es_solido_si		;7f38   ; es_solido_si: acarreo si el caracter del mapa en (H = X, L = Y) llega al umbral de 0xCA4E (0xCA4F desde 0x81)
	pop hl			;7f3b
	ret			;7f3c
es_solido_si:		; acarreo si el caracter del mapa en (H = X, L = Y) llega al umbral de 0xCA4E (0xCA4F desde 0x81)
	call dentro_de_la_sala		;7f3d   ; dentro_de_la_sala: H y L dentro de la sala: de 0xC0 a 0xDF quedan en 0xB8; desde 0xE0 (negativos), en 0
	call 04411h		;7f40   ; su casilla en el mapa
	ld a,(hl)			;7f43   ; el caracter
	ld hl,0ca4eh		;7f44   ; apunta a el umbral de los caracteres 0x00-0x80 de la sala (de p56:A727; p00:5C28)
	cp 081h		;7f47   ; desde 0x81, el segundo umbral
	jr c,L_7F4C		;7f49
	inc hl			;7f4b
L_7F4C:
	cp (hl)			;7f4c   ; llega?
L_7F4D:
	ccf			;7f4d
	ret			;7f4e
dentro_de_la_sala:		; H y L dentro de la sala: de 0xC0 a 0xDF quedan en 0xB8; desde 0xE0 (negativos), en 0
	ld a,h			;7f4f
	cp 0c0h		;7f50
	call nc,L_7F61		;7f52
	ld a,l			;7f55   ; la Y
	cp 0c0h		;7f56
	ret c			;7f58
	cp 0e0h		;7f59
	ld l,0b8h		;7f5b
	ret c			;7f5d
	ld l,000h		;7f5e   ; por arriba: 0
	ret			;7f60
L_7F61:
	cp 0e0h		;7f61   ; la X
	ld h,0b8h		;7f63
	ret c			;7f65
	ld h,000h		;7f66   ; por la izquierda: 0
	ret			;7f68
caracter_en:		; A = el caracter del mapa en (H = X, L = Y)
	call dentro_de_la_sala		;7f69   ; dentro_de_la_sala: H y L dentro de la sala: de 0xC0 a 0xDF quedan en 0xB8; desde 0xE0 (negativos), en 0
	call 04411h		;7f6c   ; punto_a_mapa: H = X, L = Y en puntos; A = X / 8, la columna
	ld a,(hl)			;7f6f
	ret			;7f70
hay_algo_en:		; sin acarreo si en (H, L) hay un caracter distinto de 0 y 0x80; fuera de la sala, acarreo
	ld a,h			;7f71
	cp 0c0h		;7f72
	jr nc,L_7F4D		;7f74
	ld a,l			;7f76
	cp 0c0h		;7f77
	jr nc,L_7F4D		;7f79
	call 04411h		;7f7b   ; punto_a_mapa: H = X, L = Y en puntos; A = X / 8, la columna
	ld a,(hl)			;7f7e   ; el caracter...
	or a			;7f7f   ; ...0: vacio
	jr z,L_7F4D		;7f80
	cp 080h		;7f82   ; ...0x80: vacio
	jr z,L_7F4D		;7f84
	and a			;7f86
	ret			;7f87
cuatro_hacia_abajo:		; acarreo si (H, L) y los 3 puntos de 8 en 8 hacia abajo son solidos o estan fuera
	call es_solido_o_fuera		;7f88   ; es_solido_o_fuera: fuera por abajo (Y >= 0xC0): acarreo
	ret nc			;7f8b
	ld b,003h		;7f8c
L_7F8E:
	push bc			;7f8e
	ld a,l			;7f8f   ; 8 lineas mas abajo
	add a,008h		;7f90
	ld l,a			;7f92
	call es_solido_o_fuera		;7f93   ; es_solido_o_fuera: fuera por abajo (Y >= 0xC0): acarreo
	pop bc			;7f96
	ret nc			;7f97
	djnz L_7F8E		;7f98
	scf			;7f9a
	ret			;7f9b
es_solido_o_fuera:		; fuera por abajo (Y >= 0xC0): acarreo
	ld a,l			;7f9c
	cp 0c0h		;7f9d
	ccf			;7f9f
	ret c			;7fa0
	push hl			;7fa1
	call es_solido_si		;7fa2   ; es_solido_si: acarreo si el caracter del mapa en (H = X, L = Y) llega al umbral de 0xCA4E (0xCA4F desde 0x81)
	pop hl			;7fa5
	ret			;7fa6
paso_0c_cada_cuadro:		; lo de cada cuadro en el paso 0x0C: las tablas, p12:76E9, p03:B593, p03:A1DE, p04:89C3, p02:8BF1, el banco 11...
	call cambia_tablas_de_sprites		;7fa7   ; cambia_tablas_de_sprites: alterna las tablas de sprites de la VRAM: atributos en 0xF600 o 0xF200, colores en 0xF400 o 0xF000
	call 05dcbh		;7faa   ; a_p12_76e9: p12:76E9 con el banco 12 en 0x6000
	call 04650h		;7fad   ; espera_vdp: espera a que el VDP acabe la orden en curso (S#2 bit 0)
	call 0b593h		;7fb0   ; franja_de_dfd8: con 0xDFD8 y 0xDFD9, una franja de la pagina 0 a Y = 0xFE de la 1 (YMMM)
	call 04650h		;7fb3   ; espera_vdp: espera a que el VDP acabe la orden en curso (S#2 bit 0)
	call 0a1deh		;7fb6   ; snake_cada_cuadro: Snake en cada cuadro: su estado y lo que le pasa
	call 04142h		;7fb9   ; bancos_4_5: pone el 4 en 0x8000, el 5 en 0xA000 (con su copia en 0xC381-0xC383)
	call 089c3h		;7fbc   ; fichas_d800: las 4 fichas de 0x20 bytes de 0xD800 (o la de 0xD860 en las especiales)
	call 040f0h		;7fbf   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 08bf1h		;7fc2   ; p02:8BF1
	call 041d5h		;7fc5   ; bancos_11: pone el 11 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a6e1h		;7fc8   ; p11:A6E1
	call 0bcd1h		;7fcb   ; p11:BCD1
	call 0a577h		;7fce   ; p11:A577
	call 0a427h		;7fd1   ; p11:A427
	call 040f0h		;7fd4   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 05dabh		;7fd7   ; a_p12_7ddc: p12:7DDC con el banco 12 en 0x6000
	call 05dc3h		;7fda   ; a_p12_7688: p12:7688 con el banco 12 en 0x6000
	ld a,(0caa0h)		;7fdd   ; ...sin 0xCAA0 y en la especial 0x26, p03:B5B5...
	or a			;7fe0
	jr nz,L_7FED		;7fe1
	ld a,(0ca76h)		;7fe3   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 026h		;7fe6
	jr nz,L_7FED		;7fe8
	call 0b5b5h		;7fea   ; dibuja_el_de_dfd8: el de 0xDFD8: sprites 22-25 (0xDC58), patrones desde 0xE0, colores de p08:BB7F y p08:BB9E
L_7FED:
	jp sprites_a_vram_turnos		;7fed   ; ...y los sprites
segun_cb20_bancos_11:		; segun_cb20 (p02:8001) con el banco 11
	call 041d5h		;7ff0   ; bancos_11: pone el 11 en 0xA000 (con su copia en 0xC381-0xC383)
	call 08001h		;7ff3   ; segun_cb20: la ficha de 0xCB80 por el despachador de 0xCB20 (14 casos)
	jp 040f0h		;7ff6   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
segun_a_8_bancos_11:		; segun_a_8 (p02:8028) con el banco 11 (sigue en el banco 2)
	call 041d5h		;7ff9   ; bancos_11: pone el 11 en 0xA000 (con su copia en 0xC381-0xC383)
	call 08028h		;7ffc   ; segun_a_8: el despachador de 8 casos de p02:802C, A desde 1

; ----------------------------------------------------------------------
; DATOS partida_7FFF: los 1 primeros bytes de una instruccion de 2 (18 F5) que
;   sigue en el banco 2: el trazador de un solo banco no puede verla entera
;   (tools/bancos.py); lo leen p01:7FFF (1 bytes)
;   0x7fff..0x8000  (1 bytes)
DATA_partida_7FFF:
	defb 018h	; 7fff
