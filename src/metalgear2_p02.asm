; ==========================================================================
; METAL GEAR 2 SOLID SNAKE - Konami (1990) - MSX2 - MegaROM RC-767 de 512 KB (Konami SCC) - banco 02 (se ejecuta en 0x8000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x08000


; ----------------------------------------------------------------------
; DATOS sin identificar  0x8000..0x8001  (1 bytes)
DATA_8000:
	defb 0f5h	; 8000

; ======================================================================
; CODIGO 0x8001..0x800c  (11 bytes)
; ======================================================================


segun_cb20:		; la ficha de 0xCB80 por el despachador de 0xCB20 (14 casos)
	ld ix,0cb80h		;8001   ; apunta a las 6 fichas de 16 bytes de lo que lanza Snake ([tipo][..][Y 8.8][X 8.8][velocidades]...)
	ld a,(0cb20h)		;8005   ; 0xCB20 desde 1
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


segun_a_8:		; el despachador de 8 casos de p02:802C, A desde 1
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


nada:		; no hace nada (los casos vacios de los despachadores)
	ret			;803c
llama_b066:		; p06:B066 con el banco 6
	call 041a0h		;803d   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b066h		;8040   ; pantalla_5_limpia: 0xC000, el sonido 1, SCREEN 5, las 4 paginas a 0, los 8 registros del VDP de p06:B09D y los sprites apagados
	jr L_804B		;8043
lee_mandos:		; pone el banco 6 y lee mando y teclas (p06:B0AD)
	call 041a0h		;8045   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b0adh		;8048   ; lee_mando_y_teclas: el mando a 0xCA08/0xCA07 y las teclas de funcion a 0xCA0A/0xCA09
L_804B:
	jp 040f0h		;804b   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
lista_de_zona_a_d900:		; 0xD900-0xD9FF a 0xFF y la lista de p30 de la zona (o de la especial)
	call 04206h		;804e   ; bancos_30: pone el 30 en 0xA000 (con su copia en 0xC381-0xC383)
	ld hl,0d900h		;8051   ; 0xD900...
	ld bc,000ffh		;8054   ; ...256 bytes...
	ld a,0ffh		;8057   ; ...a 0xFF
	call 04237h		;8059   ; llena_bloque: pone A en BC + 1 bytes desde HL
	ld a,(0ca76h)		;805c   ; la sala especial...
	ld c,a			;805f
	and a			;8060
	ld hl,0b8a5h		;8061   ; sin ella, la lista de la zona en p30:B8A5
	ld a,(0ca4ah)		;8064   ; lee la zona
	jr z,L_806E		;8067
	ld hl,0ba18h		;8069   ; con ella, la suya en p30:BA18
	ld a,c			;806c
	dec a			;806d
L_806E:
	call 043f6h		;806e   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ex de,hl			;8071   ; DE = la lista
	ld c,000h		;8072   ; C = el numero de sala, desde 0
L_8074:
	ld a,(de)			;8074   ; la casilla de la sala (fila * 16 + columna)...
	inc a			;8075
	jr z,L_8084		;8076   ; ...0xFF acaba la primera parte
	ld a,(de)			;8078
	ld hl,0d900h		;8079   ; 0xD900 + la casilla...
	call 0423eh		;807c   ; suma_a_hl: HL = HL + A
	ld (hl),c			;807f   ; ...= la sala
	inc c			;8080   ; la siguiente
	inc de			;8081
	jr L_8074		;8082
L_8084:
	inc de			;8084   ; la segunda parte: parejas [casilla][sala]...
	ld a,(de)			;8085
	inc a			;8086   ; ...hasta 0xFF
	jp z,040f0h		;8087   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	ld a,(de)			;808a   ; la casilla...
	ld hl,0d900h		;808b
	call 0423eh		;808e   ; suma_a_hl: HL = HL + A
	inc de			;8091
	ld a,(de)			;8092   ; ...= la sala de la pareja
	ld (hl),a			;8093
	jr L_8084		;8094
sala_de_al_lado:		; p01:7BAA
	call 07baah		;8096   ; borra_lo_de_la_sala: borra 0xD400-0xD415, las 24 fichas de 0x40 bytes desde 0xCE2E (18 bytes de cada una), 0xD460-0xD4BF y 0xD4C0-0xD4DF
	xor a			;8099   ; 0xD42E = 0xD44F = 0xD456 = 0xD451 = 0
	ld (0d42eh),a		;809a
	ld (0d44fh),a		;809d
	ld (0d456h),a		;80a0
	ld (0d451h),a		;80a3
	dec a			;80a6   ; 0xD44A = 0xFF
	ld (0d44ah),a		;80a7
	ld de,0ca50h		;80aa   ; DE apunta a la fila y la columna
	ld a,(0ca41h)		;80ad   ; por la salida: arriba, abajo, izquierda, derecha
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
	ld a,(0ca4bh)		;80bc   ; la sala...
	ld c,a			;80bf
	ld a,(0ca4ah)		;80c0   ; ...y la zona
	ld b,a			;80c3
	cp 007h		;80c4   ; la zona 7...
	jr z,L_80D9		;80c6
	cp 00fh		;80c8   ; ...la 0x0F...
	jr z,L_80ED		;80ca
	cp 00dh		;80cc   ; ...o la 0x0D con la fila 4
	jr nz,L_80F8		;80ce
	ld a,(0ca50h)		;80d0   ; lee la fila de la sala en la zona (uno mas al salir por arriba)
	cp 004h		;80d3
	jr nz,L_80F8		;80d5
	jr L_8109		;80d7
L_80D9:
	ld a,(0ca22h)		;80d9   ; la 7 en la fase 1, con 0xD430 = 2, en la sala 0x0A
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
	ld a,(0ca22h)		;80ed   ; la 0x0F en las fases 0-3, en la sala 0
	cp 004h		;80f0
	jr nc,L_80F8		;80f2
	ld a,c			;80f4
	and a			;80f5
	jr z,L_8109		;80f6
L_80F8:
	ld a,(0d430h)		;80f8   ; con 0xD430 = 2...
	cp 002h		;80fb
	jr nz,L_8117		;80fd
	ld a,b			;80ff
	cp 007h		;8100   ; ...en la zona 7 sala 0x0C
	jr nz,L_8117		;8102
	ld a,c			;8104
	cp 00ch		;8105
	jr nz,L_8117		;8107
L_8109:
	ld a,001h		;8109   ; 0xD4E3 = 1...
	ld (0d4e3h),a		;810b
	push de			;810e
	ld a,(0ca5fh)		;810f   ; ...y, sin 0xCA5F, p01:7C77
	and a			;8112
	call z,07c77h		;8113   ; musica_de_la_zona_si: con 0xCAF6, o sin 0xC697, la musica de la zona
	pop de			;8116
L_8117:
	ex de,hl			;8117   ; la fila uno mas
	inc (hl)			;8118
	call cuenta_caad		;8119   ; p02:8181
	jr L_8177		;811c
L_811E:
	ld a,(0ca4bh)		;811e   ; salir por abajo
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
	xor a			;813c   ; 0xD4E3 = 0...
	ld (0d4e3h),a		;813d
	ld a,(0d433h)		;8140   ; ...y sin 0xD433 ni 0xCA5F, p01:7C77
	and a			;8143
	jr nz,L_814F		;8144
	push de			;8146
	ld a,(0ca5fh)		;8147   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	and a			;814a
	call z,07c77h		;814b   ; musica_de_la_zona_si: con 0xCAF6, o sin 0xC697, la musica de la zona
	pop de			;814e
L_814F:
	ex de,hl			;814f   ; la fila uno menos
	dec (hl)			;8150
	jr L_8177		;8151
L_8153:
	ld a,(0ca50h)		;8153   ; lee la fila de la sala en la zona (uno mas al salir por arriba)
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
	ex de,hl			;8169   ; por la izquierda: la columna uno menos
	inc hl			;816a
	dec (hl)			;816b
	call cambia_ca43_abajo		;816c   ; cambia_ca43_abajo: en las zonas 0x0D-0x10...
	jr L_8177		;816f
L_8171:
	ex de,hl			;8171   ; por la derecha: la columna uno mas
	inc hl			;8172
	inc (hl)			;8173
	call cambia_ca43_derecha		;8174   ; cambia_ca43_derecha: en las zonas 0x0C-0x10...
L_8177:
	ld a,(0ca76h)		;8177   ; entra en la sala nueva, especial o no
	and a			;817a
	jp nz,055cfh		;817b   ; entra_en_sala_especial: entra en una sala de 0xCA76 (0xD440 = 0)
	jp 052cfh		;817e   ; entra_en_sala: entra en la sala nueva (0xD440 = 0)
cuenta_caad:		; en la zona 0, filas 3-4: 0xCAAD sube hasta 1 (fila 3) o 2 (fila 4); al llegar a 1, el bit 3 de 0xD7D0
	ld a,(0ca4ah)		;8181   ; lee la zona
	and a			;8184
	ret nz			;8185
	ld a,(0ca50h)		;8186   ; lee la fila de la sala en la zona (uno mas al salir por arriba)
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
	ld hl,0caadh		;8197   ; 0xCAAD...
	ld a,(hl)			;819a
	cp b			;819b   ; ...ya llega a B: nada
	ret nc			;819c
	inc (hl)			;819d   ; uno mas
	ld a,(hl)			;819e
	dec a			;819f   ; al llegar a 1...
	ret nz			;81a0
	ld hl,0d7d0h		;81a1   ; ...el bit 3 de 0xD7D0
	set 3,(hl)		;81a4
	ret			;81a6
cambia_ca43_abajo:		; en las zonas 0x0D-0x10...
	ld a,(0ca4ah)		;81a7   ; lee la zona
	ld b,a			;81aa
	sub 00dh		;81ab
	cp 004h		;81ad
	ret nc			;81af
	ld a,(0ca4bh)		;81b0   ; lee la sala de la zona
	ld c,a			;81b3
	ld a,b			;81b4
	cp 010h		;81b5   ; ...la 0x10 sala 3 con 0xCA43: 0xCA43 uno menos y 0xCC80-0xCCFF a cero
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
	ld hl,0cc80h		;81c6   ; apunta a 16 fichas de 8 bytes que mueve p11:B66E
	ld bc,0007fh		;81c9
	jp 04236h		;81cc   ; borra_bloque: pone a cero BC + 1 bytes desde HL
L_81CF:
	ld hl,08212h		;81cf   ; si no, la lista de p02:8212
	jr sala_de_lista		;81d2
cambia_ca43_derecha:		; en las zonas 0x0C-0x10...
	ld a,(0ca4ah)		;81d4   ; lee la zona
	ld b,a			;81d7
	sub 00ch		;81d8
	cp 005h		;81da
	ret nc			;81dc
	ld a,(0ca4bh)		;81dd   ; lee la sala de la zona
	ld c,a			;81e0
	ld a,b			;81e1   ; ...la 0x10 sala 2 con 0xCA43 < 8: 0xCA43 uno mas
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
	ld hl,08216h		;81f6   ; si no, la lista de p02:8216
sala_de_lista:		; ternas [zona][sala][...] hasta 0xFF: con la zona B y la sala C, p01:7BF1 y el tercer byte
	ld a,(hl)			;81f9   ; la terna; 0xFF acaba
	inc a			;81fa
	ret z			;81fb
	ld a,(hl)			;81fc
	inc hl			;81fd
	cp b			;81fe   ; la zona contra B
	jr nz,L_820E		;81ff
	ld a,(hl)			;8201
	inc hl			;8202
	cp c			;8203   ; la sala contra C
	jr nz,L_820F		;8204
	ld a,(hl)			;8206   ; el tercer byte...
	push af			;8207
	call 07bf1h		;8208   ; ...p01:7BF1 (que deja HL en la sala)...
	pop af			;820b
	ld (hl),a			;820c   ; ...y el byte alli
	ret			;820d
L_820E:
	inc hl			;820e   ; la terna siguiente
L_820F:
	inc hl			;820f
	jr sala_de_lista		;8210

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


y_dentro:		; B = la Y de A dentro de los bordes: entre 0x12 y 0xBF
	ld b,a			;8220
	cp 011h		;8221   ; menos de 0x11...
	jr nc,L_8228		;8223
	ld b,012h		;8225   ; ...0x12
	ret			;8227
L_8228:
	cp 0c0h		;8228   ; 0xC0 o mas...
	ret c			;822a
	ld b,0bfh		;822b   ; ...0xBF
	ret			;822d
x_dentro:		; B = la X de A dentro de los bordes: entre 0x09 y 0xB7
	ld b,a			;822e
	cp 009h		;822f   ; menos de 9...
	jr nc,L_8236		;8231
	ld b,009h		;8233   ; ...9
	ret			;8235
L_8236:
	cp 0b8h		;8236   ; 0xB8 o mas...
	ret c			;8238
	ld b,0b7h		;8239   ; ...0xB7
	ret			;823b
bits_de_la_zona:		; 0xCA75 = el byte de la zona en p56:A713; A = 0x5D en la sala especial 2
	call 0418eh		;823c   ; bancos_56: pone el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	ld a,(0ca4ah)		;823f   ; lee la zona
	ld hl,0a713h		;8242
	call 04248h		;8245   ; byte_de_tabla: A = el byte A de la tabla de HL (y HL apunta a el)
	ld (0ca75h),a		;8248   ; guarda los bits de los juegos de piezas de la zona (p56:A713; p00:4A58)
	call 040f0h		;824b   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	ld a,(0ca76h)		;824e   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 002h		;8251
	ret nz			;8253
	ld a,05dh		;8254
	ret			;8256
sala_de_entrada:		; por la salida 1: 0xCA50 = 1; por la 2, la pareja de C en p02:827A
	ld a,(0ca41h)		;8257   ; lee la salida de la sala (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	dec a			;825a
	jr z,L_8274		;825b
	cp 002h		;825d
	ret nc			;825f
	ld hl,0827ah		;8260
	ld de,0ca50h		;8263   ; apunta a la fila de la sala en la zona (uno mas al salir por arriba)
L_8266:
	ld a,(hl)			;8266   ; la pareja [salida][...]...
	ld b,a			;8267
	inc b			;8268   ; ...0xFF acaba
	ret z			;8269
	inc hl			;826a
	cp c			;826b   ; es la de C?
	jr z,L_8271		;826c
	inc hl			;826e   ; la siguiente
	jr L_8266		;826f
L_8271:
	ldi		;8271   ; el segundo byte a 0xCA50
	ret			;8273
L_8274:
	ld hl,0ca50h		;8274   ; 0xCA50 = 1
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


llama_ab91:		; p06:AB91 guardando el banco de 0xA000
	ld a,(0c383h)		;8281   ; lee la copia del banco de 0xA000
	push af			;8284
	call 041a0h		;8285   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0ab91h		;8288   ; franjas_de_la_otra: 0x58 x 0x10 de (0x80, 0xC0) de la otra pagina a esta y dos copias en Y (YMMM): (0xC0, 0x60) a (0x74, 0x60) y (0, 0xC0) a (0x10, 0xC0)
L_828B:
	pop af			;828b
	push af			;828c
	jp 041a3h		;828d
llama_abbb:		; p06:ABBB guardando el banco de 0xA000
	ld a,(0c383h)		;8290   ; lee la copia del banco de 0xA000
	push af			;8293
	call 041a0h		;8294   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0abbbh		;8297   ; piezas_zona_10: en la zona 0x10 desde la sala 2: 0xCA4C = 0x0100 y 2 x 2 caracteres de p06:ABFE (segun 0xCA43; 4 mas en la sala 2) de la pagina 2 a la otra, en (0x48, 0x40) en la sala 2 o en (0x68, 0x40)
	jr L_828B		;829a
borra_esta_pantalla:		; 0xC0 x 0xC0 puntos a 0 en la pagina de dibujar
	ld a,(0ca42h)		;829c   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	jp 04452h		;829f   ; borra_pantalla_de: 0xC0 x 0xC0 puntos a 0 en la pagina A
pantalla_del_marcador:		; el marcador entero: p01:6DDA, p02:850C, el mosaico de p56:A03C, p01:6DCF, p02:831F y p01:722C
	call 06ddah		;82a2   ; dibujos_b58b: los dibujos de p58:B58B en la VRAM de 0xA000
	call paleta_bc3c		;82a5   ; paleta_bc3c: la paleta de p56:BC3C
	call mosaico_a03c		;82a8   ; mosaico_a03c: el mosaico de p56:A03C y las piezas de la lista de p56:A0B4 con una pausa entre una y otra
	call 06dcfh		;82ab   ; dibujos_812a: los dibujos de p52:812A en la VRAM de 0xA000
	call 0418eh		;82ae   ; bancos_56: pone el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	call rotulos_del_marcador		;82b1   ; rotulos_del_marcador: los rotulos del marcador (p56:A000, A008, A00A) y las 10 piezas de p56:A014
	call 040f0h		;82b4   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	jp 0722ch		;82b7   ; letras_de_44: 0x80 letras de p44:BADB en la fila 0x40
mosaico_a03c:		; el mosaico de p56:A03C y las piezas de la lista de p56:A0B4 con una pausa entre una y otra
	call 0418eh		;82ba   ; bancos_56: pone el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	ld hl,0a03ch		;82bd   ; mosaico_A03C: un mosaico de 10 x 12 caracteres, un byte cada uno
	ld de,03030h		;82c0   ; en X = 0x30, Y = 0x30...
	ld bc,00a0ch		;82c3   ; ...10 x 12 caracteres
	call 050c4h		;82c6   ; mosaico_fa_b1: el mosaico de HL en (D, E), B filas de C caracteres, con la forma 10 de la franja 1 (p00:512C)
	ld b,0ffh		;82c9   ; una pausa
	call pausa		;82cb   ; pausa: una espera de B x B vueltas
	ld hl,0a0b4h		;82ce   ; la lista de piezas
L_82D1:
	ld a,(hl)			;82d1   ; 0xFF: se acabo
	cp 0ffh		;82d2
	jp z,040f0h		;82d4   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	ld c,(hl)			;82d7   ; HL = el sitio de origen
	inc hl			;82d8
	ld b,(hl)			;82d9
	inc hl			;82da
	ld e,(hl)			;82db   ; DE = el destino
	inc hl			;82dc
	ld d,(hl)			;82dd
	inc hl			;82de
	ld a,(hl)			;82df   ; A = la pausa de despues
	inc hl			;82e0
	push af			;82e1
	push hl			;82e2
	ld l,c			;82e3
	ld h,b			;82e4
	ld bc,00808h		;82e5   ; 8 x 8 puntos
	call copia_pieza_marcador		;82e8   ; la copia
	pop hl			;82eb
	pop bc			;82ec
	call pausa		;82ed   ; la pausa
	jr L_82D1		;82f0
pausa:		; una espera de B x B vueltas
	push bc			;82f2
L_82F3:
	push bc			;82f3   ; una vuelta de espera
	pop bc			;82f4
	djnz L_82F3		;82f5   ; B veces...
	pop bc			;82f7
	djnz pausa		;82f8   ; ...B veces
	ret			;82fa
copia_pieza_marcador:		; las piezas de Y = 0x50 en X = 0xE8 o 0xF0 se copian enteras; las demas con el 0 transparente
	ld a,l			;82fb
	cp 050h		;82fc   ; la Y 0x50...
	jr nz,L_8309		;82fe
	ld a,h			;8300   ; ...y la X 0xE8...
	cp 0e8h		;8301
	jr z,L_8315		;8303
	cp 0f0h		;8305   ; ...o 0xF0: entera
	jr z,L_8315		;8307
L_8309:
	ld a,(0ca42h)		;8309   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	rlca			;830c
	rlca			;830d
	rlca			;830e
	rlca			;830f
	or 0c8h		;8310   ; de la 3 a la pagina de dibujar, TIMP
	jp 047edh		;8312   ; copia_rectangulo_logica: orden LMMM del VDP con la operacion logica de A
L_8315:
	ld a,(0ca42h)		;8315   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	rlca			;8318
	rlca			;8319
	or 003h		;831a   ; de la 3 a la pagina de dibujar
	jp 04767h		;831c   ; copia_rectangulo: orden HMMM del VDP: copia un rectangulo de BC de (H,L) a (D,E); A = paginas (bits 0-1 origen, 2-3 destino)
rotulos_del_marcador:		; los rotulos del marcador (p56:A000, A008, A00A) y las 10 piezas de p56:A014
	ld hl,0a000h		;831f
	ld de,068a8h		;8322   ; en X = 0x68, Y = 0xA8: 2 filas de 4
	ld bc,00204h		;8325
	call 050c4h		;8328   ; mosaico_fa_b1: el mosaico de HL en (D, E), B filas de C caracteres, con la forma 10 de la franja 1 (p00:512C)
	ld hl,0a008h		;832b
	ld de,084a8h		;832e   ; en X = 0x84, Y = 0xA8: 2 filas de 1
	ld bc,00201h		;8331
	call 050c4h		;8334   ; mosaico_fa_b1: el mosaico de HL en (D, E), B filas de C caracteres, con la forma 10 de la franja 1 (p00:512C)
	ld hl,0a00ah		;8337
	ld de,090a8h		;833a   ; en X = 0x90, Y = 0xA8: 2 filas de 5
	ld bc,00205h		;833d
	call 050c4h		;8340   ; mosaico_fa_b1: el mosaico de HL en (D, E), B filas de C caracteres, con la forma 10 de la franja 1 (p00:512C)
	ld hl,0a014h		;8343
	ld b,00ah		;8346   ; 10 piezas de 4 bytes [X][Y][origen X][origen Y]
L_8348:
	push bc			;8348
	push hl			;8349
	ld d,(hl)			;834a   ; DE = el destino
	inc hl			;834b
	ld e,(hl)			;834c
	inc hl			;834d
	ld a,(hl)			;834e   ; HL = el origen
	inc hl			;834f
	ld l,(hl)			;8350
	ld h,a			;8351
	ld bc,00808h		;8352   ; 8 x 8 puntos
	ld a,(0ca42h)		;8355   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	and 003h		;8358
	rlca			;835a
	rlca			;835b
	rlca			;835c
	rlca			;835d
	or 0c8h		;835e   ; de la 3 a la pagina de dibujar, TIMP
	call 047edh		;8360   ; copia_rectangulo_logica: orden LMMM del VDP con la operacion logica de A
	pop hl			;8363
	ld de,00004h		;8364
	add hl,de			;8367
	pop bc			;8368
	djnz L_8348		;8369
	ret			;836b
umbrales_de_la_sala:		; los umbrales de los juegos de piezas de la sala (p56:A727) a 0xCA4E-0xCA4F
	call 0418eh		;836c   ; bancos_56: pone el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	ld de,0ca4ch		;836f   ; apunta a los 4 bits altos del byte de la sala (p56:BD28)
	call umbral_del_juego		;8372   ; umbral_del_juego: la zona * 8...
	ld de,0ca4dh		;8375   ; apunta a los 4 bits bajos del byte de la sala (p56:BD28)
	call umbral_del_juego		;8378   ; umbral_del_juego: la zona * 8...
	call 040f0h		;837b   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	ld a,(0ca76h)		;837e   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 002h		;8381   ; en la sala especial 2, 0xCA4E = 1
	ret nz			;8383
	ld a,001h		;8384
	ld (0ca4eh),a		;8386   ; guarda el umbral de los caracteres 0x00-0x80 de la sala (de p56:A727; p00:5C28)
	ret			;8389
umbral_del_juego:		; la zona * 8...
	ld a,(0ca4ah)		;838a   ; lee la zona
	add a,a			;838d
	add a,a			;838e
	add a,a			;838f
	ld hl,0a727h		;8390
	call 0423eh		;8393   ; suma_a_hl: HL = HL + A
	ld a,(de)			;8396   ; ...mas el juego de (DE)
	call 0423eh		;8397   ; suma_a_hl: HL = HL + A
	inc e			;839a   ; dos mas alla: 0xCA4E o 0xCA4F
	inc e			;839b
	ld a,(hl)			;839c
	ld (de),a			;839d
	ret			;839e
mira_caa9:		; 0xCAA9 = 1 en la zona 7, filas 1-3, columnas 5-6, con 0xD430 < 2
	ld c,000h		;839f
	ld a,(0d430h)		;83a1
	cp 002h		;83a4
	jr nc,L_83C1		;83a6
	ld a,(0ca4ah)		;83a8   ; lee la zona
	cp 007h		;83ab
	jr nz,L_83C1		;83ad
	ld a,(0ca50h)		;83af   ; lee la fila de la sala en la zona (uno mas al salir por arriba)
	dec a			;83b2
	cp 003h		;83b3
	jr nc,L_83C1		;83b5
	ld a,(0ca51h)		;83b7   ; lee la columna de la sala en la zona (uno mas al salir por la derecha)
	sub 005h		;83ba
	cp 002h		;83bc
	jr nc,L_83C1		;83be
	inc c			;83c0
L_83C1:
	ld a,c			;83c1
	ld (0caa9h),a		;83c2
	ret			;83c5
mira_ca67:		; 0xCA67 = 1 en la zona 4, sala 9
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
piezas_de_83dc:		; en las zonas 1-6, fila 3, columna 7: dos piezas (p02:8409) en Y = 0x88, X = 0x58 y 0x60
	ld a,(0ca77h)		;83dc
	and a			;83df
	ret nz			;83e0
	ld a,(0ca4ah)		;83e1   ; lee la zona
	dec a			;83e4
	ld d,a			;83e5
	cp 006h		;83e6
	ret nc			;83e8
	ld bc,(0ca50h)		;83e9   ; lee la fila de la sala en la zona (uno mas al salir por arriba) y el byte siguiente (16 bits)
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


borra_cb80:
	ld a,(0cb80h)		;8415   ; lee las 6 fichas de 16 bytes de lo que lanza Snake ([tipo][..][Y 8.8][X 8.8][velocidades]...)
	ld hl,0cb80h		;8418   ; 0xCB80-0xCBDF a cero
	ld bc,0005fh		;841b
	call 04236h		;841e   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	cp 008h		;8421
	ret nz			;8423
	jp 06a6bh		;8424   ; sonido_04: pide el sonido 0x04
pantalla_de_47:		; una pantalla desde cero: pagina 0, los dibujos de p47:AAE7, la pagina 1 borrada, p01:6D8A con p47:BD48 y la paleta de p56:BC23
	xor a			;8427
	ld (0ca42h),a		;8428   ; se dibuja en la 0
	ld (0cafbh),a		;842b   ; 0xCAFB = 0
	call 045fdh		;842e   ; pantalla_limpia: la pantalla apagada, la pagina 0 borrada y otra vez encendida
	ld bc,00007h		;8431   ; R#7 = 0: el borde negro
	call 04522h		;8434   ; registro_vdp: escribe B en el registro C del VDP
	call 04201h		;8437   ; bancos_47: pone el 47 en 0xA000 (con su copia en 0xC381-0xC383)
	ld de,0aad9h		;843a   ; los colores de p47:AAD9...
	ld hl,0aae7h		;843d   ; ...y la lista de p47:AAE7...
	call 04d4ah		;8440   ; ...en la VRAM de 0
	ld a,055h		;8443   ; 0xCA75 = 0x55
	ld (0ca75h),a		;8445   ; guarda los bits de los juegos de piezas de la zona (p56:A713; p00:4A58)
	ld hl,00100h		;8448   ; los juegos de piezas 0 y 1
	ld (0ca4ch),hl		;844b   ; guarda los 4 bits altos del byte de la sala (p56:BD28) y el byte siguiente (16 bits)
	ld d,h			;844e   ; la pagina 1 a cero
	call 04be4h		;844f   ; borra_toda_la_pagina: p00:46FF desde (0,0) con BC = 0 y A = 0 en la pagina D
	ld d,l			;8452   ; DE = 0
	ld e,l			;8453
	ld hl,0bd48h		;8454   ; p47:BD48...
	ld bc,00a1bh		;8457   ; ...0x0A x 0x1B
	call 06d8ah		;845a   ; pinta_mosaico_e500: B filas de C caracteres de 0xE500 en (D, E), los distintos de 0, de la pagina 2 a la otra
	call paleta_comun		;845d   ; la paleta comun (p02:8502)
	call 0418eh		;8460   ; bancos_56: pone el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	ld hl,0bc23h		;8463   ; y la de p56:BC23
	call 0463fh		;8466   ; pon_paleta_con_espera: pone la paleta de HL (p00:4642) esperando al VDP antes
	call 040f0h		;8469   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	jp 06dbbh		;846c   ; dibujos_52_cabecera: los dibujos de p52:8114 en la VRAM de 0 y los de p52:811F en la de 0x6000
paleta_de_la_sala_bancos_10:
	call paleta_de_la_sala		;846f   ; paleta_de_la_sala: la paleta comun y la de la sala
	jp 041cah		;8472   ; bancos_1_2_10: pone el 1 en 0x6000, el 2 en 0x8000, el 10 en 0xA000 (con su copia en 0xC381-0xC383)
paleta_de_la_sala:		; la paleta comun y la de la sala
	call paleta_comun		;8475   ; paleta_comun: la paleta de p56:B945
	ld a,(0ca65h)		;8478   ; con 0xCA65 puesto, la de p56:B98A
	or a			;847b
	jp nz,paleta_b98a		;847c   ; paleta_b98a: la paleta de p56:B98A
	call 0418eh		;847f   ; bancos_56: pone el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	ld a,(0ca76h)		;8482   ; la sala especial tiene la suya (p02:84C7)
	and a			;8485
	jr nz,L_84C7		;8486
	ld hl,0e740h		;8488   ; el numero de paleta de la sala...
	ld a,(0ca4bh)		;848b   ; lee la sala de la zona
	ld d,a			;848e
	call 0423eh		;848f   ; suma_a_hl: HL = HL + A
	ld b,(hl)			;8492   ; ...B = el de 0xE740 + la sala
	ld a,(0ca4ah)		;8493   ; la zona...
	ld c,a			;8496
	ld hl,0b76fh		;8497   ; ...sus paletas (p56:B76F)...
	call 043f6h		;849a   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld a,b			;849d
	call 043f6h		;849e   ; ...la de la sala
	ld a,c			;84a1   ; en la zona 0, salas 0-9, con 0xCAAD = 1 o 2...
	and a			;84a2
	jr nz,L_84B9		;84a3
	ld a,d			;84a5
	cp 00ah		;84a6
	jr nc,L_84B9		;84a8
	ld a,(0caadh)		;84aa
	and a			;84ad
	jr z,L_84B9		;84ae
	ld hl,0b9a4h		;84b0   ; ...la de p56:B9A4...
	dec a			;84b3
	jr z,L_84B9		;84b4
	ld hl,0b9b7h		;84b6   ; ...o la de p56:B9B7
L_84B9:
	call 0463fh		;84b9   ; la pone
	call 040f0h		;84bc   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	ld a,(0cadfh)		;84bf   ; con 0xCADF, p01:6DF4
	or a			;84c2
	ret z			;84c3
	jp 06df4h		;84c4   ; paleta_aa44: la paleta de p14:AA44
L_84C7:
	ld a,(0ca76h)		;84c7   ; la de la sala especial (p56:B8A0)
	ld hl,0b8a0h		;84ca
	call 043f6h		;84cd   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	call 0463fh		;84d0   ; pon_paleta_con_espera: pone la paleta de HL (p00:4642) esperando al VDP antes
	ld a,(0ca4bh)		;84d3   ; solo en su sala 1...
	dec a			;84d6
	jp nz,040f0h		;84d7   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	ld a,(0ca76h)		;84da   ; ...de la especial 0x18 (p56:BABE) o la 0x39 (p56:BB35), otra mas
	cp 018h		;84dd
	jr z,L_84EB		;84df
	cp 039h		;84e1
	jp nz,040f0h		;84e3   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	ld hl,0bb35h		;84e6
	jr pon_paleta_con_espera_b_1_2_3		;84e9
L_84EB:
	ld hl,0babeh		;84eb
pon_paleta_con_espera_b_1_2_3:		; pon_paleta_con_espera y deja los bancos 1, 2 y 3
	call 0463fh		;84ee   ; pon_paleta_con_espera: pone la paleta de HL (p00:4642) esperando al VDP antes
	jp 040f0h		;84f1   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
paleta_b98a_bancos_8:
	call paleta_b98a		;84f4   ; paleta_b98a: la paleta de p56:B98A
	jp 041bdh		;84f7   ; bancos_8: pone el 8 en 0xA000 (con su copia en 0xC381-0xC383)
paleta_b98a:		; la paleta de p56:B98A
	ld hl,0b98ah		;84fa
paleta_de_56:		; la paleta de HL en el banco 56
	call 0418eh		;84fd   ; bancos_56: pone el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	jr pon_paleta_con_espera_b_1_2_3		;8500
paleta_comun:		; la paleta de p56:B945
	ld hl,0b945h		;8502
	jr paleta_de_56		;8505
paleta_b914:		; la paleta de p56:B914
	ld hl,0b914h		;8507
	jr paleta_de_56		;850a
paleta_bc3c:		; la paleta de p56:BC3C
	ld hl,0bc3ch		;850c
	jr paleta_de_56		;850f
paleta_b97d:		; la paleta de p56:B97D
	ld hl,0b97dh		;8511
	jr paleta_de_56		;8514
paleta_de_851e:		; la paleta A de la lista de p02:851E
	ld hl,0851eh		;8516
	call 043f6h		;8519   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	jr paleta_de_56		;851c

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


paleta_bbf2:		; la paleta de p56:BBF2 y los bancos 1, 2 y 7
	ld hl,0bbf2h		;8524
	jr L_852C		;8527
paleta_bc9e:		; la paleta de p56:BC9E y los bancos 1, 2 y 7
	ld hl,0bc9eh		;8529
L_852C:
	call 0418eh		;852c   ; bancos_56: pone el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0463fh		;852f   ; pon_paleta_con_espera: pone la paleta de HL (p00:4642) esperando al VDP antes
	jp 041adh		;8532   ; bancos_1_2_7: pone el 1 en 0x6000, el 2 en 0x8000, el 7 en 0xA000 (con su copia en 0xC381-0xC383)
mosaico_ae3b_bancos_9:
	call datos_ae3b		;8535   ; datos_ae3b: HL = p56:AE3B, DE = (0x60, 0x40), BC = 6 x 5
	call 050a0h		;8538   ; el mosaico en la franja 1 forma 2 (p00:50A0)
	call mosaico_ae3b_62b1		;853b   ; y p01:62B1
	jp 041c2h		;853e   ; bancos_1_2_9: pone el 1 en 0x6000, el 2 en 0x8000, el 9 en 0xA000 (con su copia en 0xC381-0xC383)
mosaico_ae3b_62b1:
	call datos_ae3b		;8541   ; datos_ae3b: HL = p56:AE3B, DE = (0x60, 0x40), BC = 6 x 5
	jp 062b1h		;8544   ; p01:62B1 con HL, DE y BC de p02:8559
mosaico_ae3b_b_bancos_9:
	call mosaico_ae3b_b		;8547   ; mosaico_ae3b_b:
	jp 041c5h		;854a   ; bancos_9: pone el 9 en 0xA000 (con su copia en 0xC381-0xC383)
mosaico_ae3b_b:
	call datos_ae3b		;854d   ; datos_ae3b: HL = p56:AE3B, DE = (0x60, 0x40), BC = 6 x 5
	call 050a6h		;8550   ; el mosaico en la franja 1 forma 5
	call mosaico_ae3b_62b1		;8553   ; mosaico_ae3b_62b1:
	jp 040f0h		;8556   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
datos_ae3b:		; HL = p56:AE3B, DE = (0x60, 0x40), BC = 6 x 5
	call 0418eh		;8559   ; bancos_56: pone el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	ld hl,0ae3bh		;855c
	ld de,06040h		;855f
	ld bc,00605h		;8562
	ret			;8565
mosaico_ae59:
	call 0418eh		;8566   ; bancos_56: pone el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	ld hl,0ae59h		;8569   ; el mosaico de p56:AE59...
	ld de,04800h		;856c   ; ...en X = 0x48, Y = 0...
	ld bc,0050ch		;856f   ; ...5 filas de 12
	call 05100h		;8572   ; forma 7 en la franja 3
	jp 041c2h		;8575   ; bancos_1_2_9: pone el 1 en 0x6000, el 2 en 0x8000, el 9 en 0xA000 (con su copia en 0xC381-0xC383)
dibujos_b845:		; los dibujos de p37:B845 con los colores de p37:B809 en la VRAM de 0x6000
	call 041fch		;8578   ; bancos_37: pone el 37 en 0xA000 (con su copia en 0xC381-0xC383)
	ld de,0b809h		;857b   ; tabla_colores_B809: 14 punteros a colores de dibujo
	ld hl,0b845h		;857e   ; lista_B845: 22 fichas de dibujo de 5 bytes [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF
	call 04d56h		;8581   ; dibujos_en_6000: en la VRAM de 0x6000
	jp 041adh		;8584   ; bancos_1_2_7: pone el 1 en 0x6000, el 2 en 0x8000, el 7 en 0xA000 (con su copia en 0xC381-0xC383)
rachas_b34a_bancos_3:
	call rachas_b34a		;8587   ; rachas_b34a: p37:B34A a la VRAM de 0x1E200 (A = 1)
	jp 040f0h		;858a   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
rachas_b34a_bancos_9:
	call rachas_b34a		;858d   ; rachas_b34a: p37:B34A a la VRAM de 0x1E200 (A = 1)
	jp 041c2h		;8590   ; bancos_1_2_9: pone el 1 en 0x6000, el 2 en 0x8000, el 9 en 0xA000 (con su copia en 0xC381-0xC383)
rachas_b34a:		; p37:B34A a la VRAM de 0x1E200 (A = 1)
	call 041fch		;8593   ; bancos_37: pone el 37 en 0xA000 (con su copia en 0xC381-0xC383)
	ld de,0b34ah		;8596   ; rachas_B34A: datos en rachas a la VRAM
	ld hl,0e200h		;8599
	jr L_85EE		;859c
rachas_b007_af4c_bancos_9:
	call rachas_b007_af4c		;859e   ; rachas_b007_af4c: p37:B007 y p37:AF4C, cada una con su destino
	jp 041c5h		;85a1   ; bancos_9: pone el 9 en 0xA000 (con su copia en 0xC381-0xC383)
rachas_b007_af4c_bancos_1_2_9:
	call rachas_b007_af4c		;85a4   ; rachas_b007_af4c: p37:B007 y p37:AF4C, cada una con su destino
	jp 041c2h		;85a7   ; bancos_1_2_9: pone el 1 en 0x6000, el 2 en 0x8000, el 9 en 0xA000 (con su copia en 0xC381-0xC383)
rachas_b007_af4c_bancos_10:
	call rachas_b007_af4c		;85aa   ; rachas_b007_af4c: p37:B007 y p37:AF4C, cada una con su destino
	jp 041cah		;85ad   ; bancos_1_2_10: pone el 1 en 0x6000, el 2 en 0x8000, el 10 en 0xA000 (con su copia en 0xC381-0xC383)
rachas_b007_af4c:		; p37:B007 y p37:AF4C, cada una con su destino
	ld de,0b007h		;85b0
	call rachas_de_37		;85b3   ; rachas_de_37: las rachas de DE en el banco 37, con su destino delante
	ld de,0af4ch		;85b6
rachas_de_37:		; las rachas de DE en el banco 37, con su destino delante
	call 041fch		;85b9   ; bancos_37: pone el 37 en 0xA000 (con su copia en 0xC381-0xC383)
	call 04534h		;85bc   ; rachas_otro_destino: la orden 0x80 de las rachas: [pagina][VRAM lo hi] y sigue
	jp 040f0h		;85bf   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
rachas_b7a1:
	ld de,0b7a1h		;85c2
	jr rachas_de_37		;85c5
rachas_b030:
	ld de,0b030h		;85c7
rachas_de_37_bancos_10:		; las rachas de DE en el banco 37 con su destino, y los bancos 1, 2 y 10
	call 041fch		;85ca   ; bancos_37: pone el 37 en 0xA000 (con su copia en 0xC381-0xC383)
	call 04534h		;85cd   ; rachas_otro_destino: la orden 0x80 de las rachas: [pagina][VRAM lo hi] y sigue
	jp 041cah		;85d0   ; bancos_1_2_10: pone el 1 en 0x6000, el 2 en 0x8000, el 10 en 0xA000 (con su copia en 0xC381-0xC383)
rachas_b04a:
	ld de,0b04ah		;85d3
	jr rachas_de_37_bancos_10		;85d6
rachas_b060:
	ld de,0b060h		;85d8
	jr rachas_de_37_bancos_10		;85db
rachas_b078:		; p37:B078 a la VRAM de 0x1E000
	call 041fch		;85dd   ; bancos_37: pone el 37 en 0xA000 (con su copia en 0xC381-0xC383)
	ld de,0b078h		;85e0   ; rachas_B078: datos en rachas a la VRAM
	jr L_85EB		;85e3
rachas_b159:		; p37:B159 a la VRAM de 0x1E000
	call 041fch		;85e5   ; bancos_37: pone el 37 en 0xA000 (con su copia en 0xC381-0xC383)
	ld de,0b159h		;85e8   ; rachas_B159: datos en rachas a la VRAM
L_85EB:
	ld hl,0e000h		;85eb   ; a 0xE000...
L_85EE:
	ld a,001h		;85ee   ; ...de la mitad alta (A = 1)
	call 0456eh		;85f0   ; rachas_a_vram_tal_cual: p00:453E sin voltear (C = 0)
	jp 041cah		;85f3   ; bancos_1_2_10: pone el 1 en 0x6000, el 2 en 0x8000, el 10 en 0xA000 (con su copia en 0xC381-0xC383)
rachas_b1e6:		; p37:B1E6 a la VRAM de 0x1E000
	call 041fch		;85f6   ; bancos_37: pone el 37 en 0xA000 (con su copia en 0xC381-0xC383)
	ld de,0b1e6h		;85f9   ; rachas_B1E6: datos en rachas a la VRAM
	jr L_85EB		;85fc
rachas_b2d5:		; p37:B2D5 y 4 patrones de sprite en espejo de 0xF800 a 0xF890
	call 041fch		;85fe   ; bancos_37: pone el 37 en 0xA000 (con su copia en 0xC381-0xC383)
	ld de,0b2d5h		;8601
	call 04534h		;8604   ; rachas_otro_destino: la orden 0x80 de las rachas: [pagina][VRAM lo hi] y sigue
	call 041cah		;8607   ; bancos_1_2_10: pone el 1 en 0x6000, el 2 en 0x8000, el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	ld hl,0f800h		;860a
	ld de,0f890h		;860d
	ld c,004h		;8610
	jp 0457ah		;8612   ; voltea_en_vram: C patrones de 16 x 16 en espejo de la VRAM de HL a la de DE
sprites_zona_12_bancos_10:
	call sprites_zona_12		;8615   ; sprites_zona_12: en la zona 0x12, salas 0-0x0B: p47:BF13, p47:BE56 y las fichas de p47:BF0A
	jp 041cah		;8618   ; bancos_1_2_10: pone el 1 en 0x6000, el 2 en 0x8000, el 10 en 0xA000 (con su copia en 0xC381-0xC383)
sprites_zona_12_si:		; solo con el bit 6 de 0xD7DA
	ld a,(0d7dah)		;861b
	bit 6,a		;861e
	ret z			;8620
sprites_zona_12:		; en la zona 0x12, salas 0-0x0B: p47:BF13, p47:BE56 y las fichas de p47:BF0A
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
rachas_b3a6:
	call 041fch		;864a   ; bancos_37: pone el 37 en 0xA000 (con su copia en 0xC381-0xC383)
	ld de,0b3a6h		;864d
	call 04534h		;8650   ; rachas_otro_destino: la orden 0x80 de las rachas: [pagina][VRAM lo hi] y sigue
	jp 041c2h		;8653   ; bancos_1_2_9: pone el 1 en 0x6000, el 2 en 0x8000, el 9 en 0xA000 (con su copia en 0xC381-0xC383)
apunta:		; la velocidad para ir de (H, L) a (D, E) con la rapidez A, con un poco de azar
	ld b,000h		;8656
apunta_con_b:		; como p02:8656 con 0xCACE = B (distinto de 0: sin azar)
	push af			;8658
	ld a,b			;8659
	ld (0caceh),a		;865a   ; guarda distinto de 0: p02:8667 apunta sin azar
	pop af			;865d
	call 041bdh		;865e   ; bancos_8: pone el 8 en 0xA000 (con su copia en 0xC381-0xC383)
	call velocidad_hacia		;8661   ; velocidad_hacia: 0xCA5E = la rapidez
	jp 040f0h		;8664   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
velocidad_hacia:		; 0xCA5E = la rapidez
	ld (0ca5eh),a		;8667   ; guarda la rapidez de p02:8667
	call angulo_hacia		;866a   ; el angulo (p02:86C3)
	ld a,(0ca5ch)		;866d   ; E = el angulo del octante
	ld e,a			;8670
	ld a,(0caceh)		;8671   ; con 0xCACE puesto, tal cual
	and a			;8674
	jr nz,L_8691		;8675
	ld a,r		;8677   ; el azar: R
	ld b,a			;8679
	and 007h		;867a   ; hasta 7...
	bit 6,b		;867c   ; ...con el bit 6, menos...
	jr z,L_8689		;867e
	ld b,a			;8680
	ld a,c			;8681
	sub b			;8682
	jr nc,L_8686		;8683
	xor a			;8685   ; ...sin bajar de 0
L_8686:
	ld e,a			;8686
	jr L_8691		;8687
L_8689:
	add a,e			;8689   ; ...si no, mas, sin pasar de 0x3F
	cp 03fh		;868a
	jr c,L_8690		;868c
	ld a,03fh		;868e
L_8690:
	ld e,a			;8690
L_8691:
	ld d,000h		;8691
	ld a,e			;8693   ; 0x3F - el angulo: el complementario
	sub 03fh		;8694
	neg		;8696
	ld hl,0bf7dh		;8698   ; la tabla de p08:BF7D...
	push hl			;869b
	add hl,de			;869c
	ld c,(hl)			;869d   ; ...C = la del angulo
	pop hl			;869e
	ld e,a			;869f
	add hl,de			;86a0
	ld a,(hl)			;86a1   ; ...y la del complementario
	ld (0ca59h),a		;86a2   ; guarda el valor de p08:BF7D del angulo complementario
	ld e,c			;86a5
	call por_la_rapidez		;86a6   ; DE = la rapidez por C
	ld a,(0ca5ah)		;86a9   ; con su signo
	and a			;86ac
	call nz,04442h		;86ad   ; de_negativo: DE = -DE
	push de			;86b0
	ld a,(0ca59h)		;86b1   ; lee el valor de p08:BF7D del angulo complementario
	ld e,a			;86b4
	call por_la_rapidez		;86b5   ; HL = la rapidez por la otra
	ld a,(0ca5bh)		;86b8   ; con su signo
	and a			;86bb
	call nz,04442h		;86bc   ; de_negativo: DE = -DE
	ld h,d			;86bf
	ld l,e			;86c0
	pop de			;86c1
	ret			;86c2
angulo_hacia:		; el angulo de (H, L) a (D, E): 0xCA5C en el octante, 0xCA5D entero, y los signos en 0xCA5A-0xCA5B
	ld a,h			;86c3
	push af			;86c4
	ld a,l			;86c5
	ld hl,0ca5ah		;86c6   ; 0xCA5A: 1 si L < E
	ld (hl),000h		;86c9
	sub e			;86cb   ; L - E...
	jr nc,L_86D1		;86cc
	neg		;86ce   ; ...en valor absoluto
	inc (hl)			;86d0
L_86D1:
	inc hl			;86d1
	ld (hl),000h		;86d2   ; 0xCA5B: 1 si H < D
	and 0f0h		;86d4   ; los 4 bits altos de |L - E|...
	ld e,a			;86d6
	pop af			;86d7
	sub d			;86d8   ; H - D...
	jr nc,L_86DE		;86d9
	neg		;86db   ; ...en valor absoluto
	inc (hl)			;86dd
L_86DE:
	ld d,a			;86de
	ld a,d			;86df   ; los 4 bits altos de |H - D|...
	rra			;86e0
	rra			;86e1
	rra			;86e2
	rra			;86e3
	and 00fh		;86e4
	add a,e			;86e6   ; ...con los otros: una casilla de 16 x 16
	ld hl,0be7dh		;86e7   ; el angulo en la tabla de p08:BE7D
	call 04248h		;86ea   ; byte_de_tabla: A = el byte A de la tabla de HL (y HL apunta a el)
	ld (0ca5ch),a		;86ed   ; 0xCA5C = el angulo
	ld c,a			;86f0
	ld hl,(0ca5ah)		;86f1   ; los dos signos
	ld a,h			;86f4
	ld b,000h		;86f5
	and a			;86f7
	jr z,L_86FC		;86f8
	ld b,080h		;86fa   ; con 0xCA5B, media vuelta (0x80)
L_86FC:
	cp l			;86fc   ; con los signos distintos, el angulo al reves
	ld a,c			;86fd
	jr z,L_8702		;86fe
	neg		;8700
L_8702:
	add a,b			;8702
	ld (0ca5dh),a		;8703   ; 0xCA5D = el angulo entero
	ret			;8706
por_la_rapidez:		; DE = la rapidez de 0xCA5E por E / 32
	ld a,(0ca5eh)		;8707   ; lee la rapidez de p02:8667
	ld h,a			;870a
	call multiplica		;870b   ; HL = H * E
	xor a			;870e   ; tres bits a la izquierda, a A:H...
	add hl,hl			;870f
	adc a,a			;8710
	add hl,hl			;8711
	adc a,a			;8712
	add hl,hl			;8713
	adc a,a			;8714
	ld l,h			;8715   ; ...HL = H * E / 32
	ld h,a			;8716
	ex de,hl			;8717
	ret			;8718
multiplica:		; HL = H * E (8 x 8 bits)
	ld b,008h		;8719
	ld l,000h		;871b
	ld d,l			;871d
L_871E:
	add hl,hl			;871e   ; un bit de H...
	jr nc,L_8722		;871f
	add hl,de			;8721   ; ...si esta, suma E
L_8722:
	djnz L_871E		;8722
	ret			;8724
dos_palabras_por_b:		; p02:872E con el banco 8
	call 041bdh		;8725   ; bancos_8: pone el 8 en 0xA000 (con su copia en 0xC381-0xC383)
	call dos_palabras_por_b_si		;8728   ; dos_palabras_por_b_si: HL = B veces la palabra A de p08:BFBD, DE = B veces la de p08:BFC9 (A de 0 a 0x17, o 0x18 menos)
	jp 040f0h		;872b   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
dos_palabras_por_b_si:		; HL = B veces la palabra A de p08:BFBD, DE = B veces la de p08:BFC9 (A de 0 a 0x17, o 0x18 menos)
	cp 018h		;872e
	jr c,L_8734		;8730
	sub 018h		;8732
L_8734:
	push af			;8734
	ld de,0bfbdh		;8735   ; la palabra de la primera tabla...
	call 04403h		;8738   ; palabra_de_tabla_de: DE = la palabra A de la tabla de DE
	ld hl,00000h		;873b
	push bc			;873e
L_873F:
	add hl,de			;873f   ; ...sumada B veces
	djnz L_873F		;8740
	pop bc			;8742
	pop af			;8743
	push hl			;8744
	ld de,0bfc9h		;8745   ; la de la segunda...
	call 04403h		;8748   ; palabra_de_tabla_de: DE = la palabra A de la tabla de DE
	ld hl,00000h		;874b
L_874E:
	add hl,de			;874e   ; ...sumada B veces
	djnz L_874E		;874f
	ex de,hl			;8751
	pop hl			;8752
	ret			;8753
a_p06_aa49:		; p06:AA49 con el banco 6 en 0xA000
	call 041a0h		;8754   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0aa49h		;8757   ; teclas_f_permitidas: acarreo si se pueden las teclas F2-F5: no con ciertas cosas de 0xD881-0xD883 sin lo de 0xD678-0xD69C, 0xD8C1 = 0x13, 0xD8C2 = 5 con 0xCB5F, ni en los estados 0x10, 0x11 o 0x13 en adelante salvo 0x18-0x19; nada (NC sin tocar) con el rotulo, 0xE1D0, 0xE1F0, mirando la sala de al lado o en pausa; con 0xCB37, solo con 0xCB28 < 2
	jp 040f0h		;875a   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
borra_ce00:		; 0xD417 = 0x1E y 0xCE00-0xD3FF a cero
	ld a,01eh		;875d
	ld (0d417h),a		;875f
	ld hl,0ce00h		;8762   ; apunta a los actores: 24 fichas de 0x40 bytes (p04:800D)
	ld bc,005ffh		;8765
	jp 04236h		;8768   ; borra_bloque: pone a cero BC + 1 bytes desde HL
fichas_e280_de_sala:		; la lista de p56 de HL: la ficha de la sala, y sus piezas a 0xE280
	call 0418eh		;876b   ; bancos_56: pone el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	call busca_la_sala		;876e   ; busca_la_sala: fichas de 6 bytes [sala][4 a 0xCA6B][1 a 0xCA69]... hasta 0xFF; en una sala especial, la primera
L_8771:
	call 040f0h		;8771   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	jp 041efh		;8774   ; bancos_14: pone el 14 en 0xA000 (con su copia en 0xC381-0xC383)
fichas_e280_a:		; las piezas A de p56:A53A a 0xE280
	call 0418eh		;8777   ; bancos_56: pone el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	call L_87AD		;877a
	jr L_8771		;877d
busca_la_sala:		; fichas de 6 bytes [sala][4 a 0xCA6B][1 a 0xCA69]... hasta 0xFF; en una sala especial, la primera
	ld a,(hl)			;877f
	cp 0ffh		;8780
	ret z			;8782
	ld a,(0ca76h)		;8783   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	or a			;8786
	jr nz,L_8795		;8787
	ld a,(0ca4bh)		;8789   ; la sala
	cp (hl)			;878c
	jr z,L_8795		;878d
	ld de,00006h		;878f   ; si no es, la ficha siguiente
	add hl,de			;8792
	jr busca_la_sala		;8793
L_8795:
	xor a			;8795   ; 0xCA6A = 0, 0xCA68 = 1
	ld (0ca6ah),a		;8796   ; guarda a cero al encontrar la ficha de la sala
	inc a			;8799
	ld (0ca68h),a		;879a   ; guarda 1 si la sala tiene ficha en la lista de p02:877F
	inc hl			;879d
	push hl			;879e
	ld de,0ca6bh		;879f   ; cuatro bytes a 0xCA6B
	ld bc,00004h		;87a2
	ldir		;87a5
	ld a,(hl)			;87a7   ; el quinto a 0xCA69
	ld (0ca69h),a		;87a8   ; guarda el quinto byte de la ficha de la sala (p02:877F)
	pop hl			;87ab
	ld a,(hl)			;87ac   ; A = el primer byte de detras
L_87AD:
	ld hl,0a53ah		;87ad   ; la lista A de p56:A53A
	call 043f6h		;87b0   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld ix,0e280h		;87b3   ; fichas de 8 bytes en 0xE280
	ld b,001h		;87b7   ; numeradas desde 1
L_87B9:
	ld a,(hl)			;87b9   ; la pieza; 0xFF acaba
	cp 0ffh		;87ba
	ret z			;87bc
	ld de,0a62eh		;87bd   ; sus 4 bytes en p56:A62E...
	add a,a			;87c0
	add a,a			;87c1
	call 04243h		;87c2   ; suma_a_de: DE = DE + A
	ld a,(de)			;87c5
	ld (ix+003h),a		;87c6   ; ...a los bytes 3-6 de la ficha
	inc de			;87c9
	ld a,(de)			;87ca
	ld (ix+004h),a		;87cb
	inc de			;87ce
	ld a,(de)			;87cf
	ld (ix+005h),a		;87d0
	inc de			;87d3
	ld a,(de)			;87d4
	ld (ix+006h),a		;87d5
	ld a,b			;87d8   ; el byte 0 = el numero
	ld (ix+000h),a		;87d9
	xor a			;87dc   ; el byte 1 = 0
	ld (ix+001h),a		;87dd
	inc hl			;87e0
	inc b			;87e1
	ld de,00008h		;87e2   ; la ficha siguiente
	add ix,de		;87e5
	jr L_87B9		;87e7
byte_a67e:		; A = el byte A de p56:A67E
	call 0418eh		;87e9   ; bancos_56: pone el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	ld hl,0a67eh		;87ec
	call 04248h		;87ef   ; byte_de_tabla: A = el byte A de la tabla de HL (y HL apunta a el)
	jr L_8810		;87f2
palabra_a6af:		; HL = la palabra A de p56:A6AF (en la especial 0x11, de 0x2D a 0x2F pasa a 0x31)
	call 0418eh		;87f4   ; bancos_56: pone el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	ld l,a			;87f7
	ld a,(0ca76h)		;87f8   ; en la sala especial 0x11...
	cp 011h		;87fb
	ld a,l			;87fd
	jr nz,L_880A		;87fe
	cp 02dh		;8800   ; ...las 0x2D-0x2F...
	jr c,L_880A		;8802
	cp 030h		;8804
	jr nc,L_880A		;8806
	ld a,031h		;8808   ; ...son la 0x31
L_880A:
	ld hl,0a6afh		;880a
	call 043f6h		;880d   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
L_8810:
	jp 040f0h		;8810   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
palabra_a6af_d708:		; HL = la palabra 0xD708 - 1 de p56:A6AF
	ld a,(0d708h)		;8813
	ld hl,0a6afh		;8816
	jr L_8832		;8819
palabra_a6cb_d708:		; HL = la palabra 0xD708 - 1 de p56:A6CB (con el bit 0 de 0xCAB6, de 0x20 a 0x22 pasa a 0x24)
	ld a,(0d708h)		;881b
	ld hl,0cab6h		;881e   ; 0xCAB6...
	bit 0,(hl)		;8821   ; ...sin el bit 0, la palabra tal cual
	ld hl,0a6cbh		;8823
	jr z,L_8832		;8826
	cp 020h		;8828   ; las 0x20-0x22...
	jr c,L_8832		;882a
	cp 023h		;882c
	jr nc,L_8832		;882e
	ld a,024h		;8830   ; ...son la 0x24
L_8832:
	call 0418eh		;8832   ; bancos_56: pone el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	dec a			;8835   ; desde 1
	call 043f6h		;8836   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	jp 041cah		;8839   ; bancos_1_2_10: pone el 1 en 0x6000, el 2 en 0x8000, el 10 en 0xA000 (con su copia en 0xC381-0xC383)
palabra_bdd2:		; HL = la palabra A de p06:BDD2 y de ella la de 0xCAB5
	call 041a0h		;883c   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	ld hl,0bdd2h		;883f
	call 043f6h		;8842   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	jr L_884A		;8845
palabra_de_cab5:		; HL = la palabra 0xCAB5 de la tabla de HL (banco 6)
	call 041a0h		;8847   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
L_884A:
	ld a,(0cab5h)		;884a   ; lee el nivel de Snake: la barra de vida llena mide 0x20 + 8 por nivel
	call 043f6h		;884d   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	jr L_887B		;8850
junto_a_snake_beac:		; la ficha IX junto a Snake, con los desplazamientos de p06:BEAC
	ld hl,0beach		;8852
junto_a_snake:		; la ficha IX en la Y y la X de Snake mas el desplazamiento de su direccion en la tabla de HL
	call 041a0h		;8855   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	ld a,(0cb0eh)		;8858   ; dos bytes por direccion
	dec a			;885b
	add a,a			;885c
	call 0423eh		;885d   ; suma_a_hl: HL = HL + A
	ld a,(0cb03h)		;8860   ; la Y de Snake...
	ld b,a			;8863
	ld a,(0cb43h)		;8864   ; ...mas 0xCB43...
	add a,b			;8867
	add a,(hl)			;8868   ; ...mas el desplazamiento
	ld (ix+003h),a		;8869   ; a la Y de la ficha
	inc hl			;886c
	ld a,(0cb05h)		;886d   ; la X de Snake mas el suyo...
	add a,(hl)			;8870
	ld (ix+005h),a		;8871   ; ...a la X de la ficha
	xor a			;8874   ; sin fracciones
	ld (ix+002h),a		;8875
	ld (ix+004h),a		;8878
L_887B:
	jp 040f0h		;887b   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
cuatro_bytes_por_direccion:		; 4 bytes de la tabla de HL (banco 6) segun la direccion de Snake, a donde dice p01:6406
	ld a,(0cb0eh)		;887e   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
cuatro_bytes_por_a:
	call 041a0h		;8881   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	dec a			;8884   ; cuatro bytes por direccion
	add a,a			;8885
	add a,a			;8886
	call 0423eh		;8887   ; suma_a_hl: HL = HL + A
	call 06406h		;888a   ; DE = el destino (p01:6406)
	ld bc,00004h		;888d
	ldir		;8890
	jr L_887B		;8892
llama_aebb:		; p06:AEBB con el banco 6 en 0xA000
	call 041a0h		;8894   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0aebbh		;8897   ; sitios_de_la_sala: 0xCBE0 a cero y los sitios de esta sala de la lista de la zona (p06:BB13; fichas [sala][numero][Y][X], 0xFF acaba) en los huecos de 0xCBE0
	jp 040f0h		;889a   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
sitios_cbe0:		; con 0xCA65 puesto, mira si sale (p02:8928)
	ld a,(0ca65h)		;889d   ; lee el sitio de 0xCBE0 en el que esta Snake (0 = ninguno)
	and a			;88a0
	jp nz,sale_del_sitio		;88a1   ; sale_del_sitio: si ha chocado, nada
	ld hl,0cbe0h		;88a4   ; los 8 sitios de 4 bytes de 0xCBE0 [numero][Y][X][...]
	ld b,008h		;88a7
L_88A9:
	ld a,(hl)			;88a9   ; 0: no hay
	and a			;88aa
	jr z,L_88B5		;88ab
	push hl			;88ad
	push bc			;88ae
	call entra_en_sitio		;88af   ; entra Snake en el?
	pop bc			;88b2
	pop hl			;88b3
	ret c			;88b4   ; con acarreo, ha entrado
L_88B5:
	ld a,004h		;88b5   ; el siguiente
	call 0423eh		;88b7   ; suma_a_hl: HL = HL + A
	djnz L_88A9		;88ba
	ret			;88bc
entra_en_sitio:		; con 0xCB21 = 0x0A no
	ld a,(0cb21h)		;88bd   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	cp 00ah		;88c0
	ret z			;88c2
	ld a,(0cb0eh)		;88c3   ; solo yendo hacia arriba
	dec a			;88c6
	ret nz			;88c7
	ld b,(hl)			;88c8   ; B = el numero del sitio
	inc l			;88c9
	ld a,(0cb03h)		;88ca   ; la Y de Snake menos la del sitio...
	sub (hl)			;88cd
	cp 008h		;88ce   ; ...a menos de 8
	ret nc			;88d0
	inc l			;88d1
	ld a,(0cb05h)		;88d2   ; la X menos la del sitio...
	sub (hl)			;88d5
	cp 010h		;88d6   ; ...a menos de 16
	ret nc			;88d8
	ld a,b			;88d9
	ld (0ca65h),a		;88da   ; 0xCA65 = el sitio
	push af			;88dd
	call borra_df80_y_cb80		;88de   ; limpia los sprites de la sala
	call 05488h		;88e1   ; marcador_y_ventana: con 0xCA5F puesto va por p00:549B
	call 0708eh		;88e4   ; p01:708E
	ld a,(0cb03h)		;88e7   ; guarda donde estaba Snake: la Y - 0x20...
	sub 020h		;88ea
	ld (0e204h),a		;88ec   ; guarda la Y de Snake antes de entrar en el sitio - 0x20
	ld a,(0cb05h)		;88ef   ; ...y la X
	ld (0e205h),a		;88f2   ; guarda la X de Snake antes de entrar en el sitio
	ld a,0aeh		;88f5   ; Snake abajo en el centro: Y = 0xAE...
	ld (0cb03h),a		;88f7   ; guarda la Y de Snake
	ld a,060h		;88fa   ; ...X = 0x60
	ld (0cb05h),a		;88fc   ; guarda la X de Snake
	call 0b4d1h		;88ff   ; cuenta_caa0: con 0xCAA0 = 3 pasa a 2; con cualquiera, empiezan los que siguen
	ld a,012h		;8902   ; 0xCA4E = 0x12
	ld (0ca4eh),a		;8904   ; guarda el umbral de los caracteres 0x00-0x80 de la sala (de p56:A727; p00:5C28)
	call llama_ab91		;8907   ; llama_ab91: p06:AB91 guardando el banco de 0xA000
	call 059efh		;890a   ; limpia_sprites_y_d300:
	call paleta_b98a		;890d   ; la paleta de p56:B98A
	call 05437h		;8910   ; a la vista
	call 054a4h		;8913   ; copia_marcador: sin 0xCA5F, el marcador de una pagina a la otra
	call 05dbbh		;8916   ; a_p12_6ab3: p12:6AB3 con el banco 12 en 0x6000
	pop af			;8919   ; el sitio
	call 041cdh		;891a   ; bancos_10: pone el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a0d3h		;891d
	call 040f0h		;8920   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call cosas_del_sitio		;8923   ; p02:902A
	scf			;8926   ; con acarreo: ha entrado
	ret			;8927
sale_del_sitio:		; si ha chocado, nada
	ld a,(0cb0fh)		;8928   ; lee 1 si Snake ha chocado en este cuadro
	and a			;892b
	ret nz			;892c
	ld a,(0cb0eh)		;892d   ; solo yendo hacia abajo
	dec a			;8930
	dec a			;8931
	ret nz			;8932
	ld a,(0cb03h)		;8933   ; la Y de Snake entre 0xB0 y 0xB7...
	sub 0b0h		;8936
	cp 008h		;8938
	ret nc			;893a
	ld a,(0cb05h)		;893b   ; ...y la X entre 0x38 y 0x87
	sub 038h		;893e
	cp 050h		;8940
	ret nc			;8942
	ld hl,0ca65h		;8943   ; el sitio, y 0xCA65 = 0
	ld a,(hl)			;8946
	ld (hl),000h		;8947
	ld hl,0cbe0h		;8949   ; lo busca en 0xCBE0
	ld b,008h		;894c
L_894E:
	cp (hl)			;894e   ; es este?
	jr z,L_8957		;894f
	inc hl			;8951   ; el siguiente, 4 bytes mas alla
	inc hl			;8952
	inc hl			;8953
	inc hl			;8954
	djnz L_894E		;8955
L_8957:
	inc l			;8957   ; Snake donde el sitio: la Y + 8...
	ld a,(hl)			;8958
	add a,008h		;8959
	ld (0cb03h),a		;895b   ; guarda la Y de Snake
	ld d,a			;895e
	inc l			;895f   ; ...la X + 12
	ld a,(hl)			;8960
	add a,00ch		;8961
	ld (0cb05h),a		;8963   ; guarda la X de Snake
	ld e,a			;8966
	ld a,(0d416h)		;8967   ; 0xD451 = 0xD416
	ld (0d451h),a		;896a
	ld (0d452h),de		;896d   ; 0xD452-0xD453 = la Y y la X
	call borra_df80_y_cb80		;8971   ; borra_df80_y_cb80: 0xDFF8 = 0
	ld c,002h		;8974   ; C = 2
	call a_p11_bdbd		;8976   ; p02:8BE8
	call 04ccch		;8979   ; p00:4CCC
	call 059efh		;897c   ; limpia_sprites_y_d300:
	jp 052d2h		;897f   ; y otra vez en la sala
borra_df80_y_cb80:		; 0xDFF8 = 0
	xor a			;8982
	ld (0dff8h),a		;8983   ; guarda con el, la caja de 0xDFFD/0xDFFE choca (p07:B149)
	ld hl,0df80h		;8986   ; 0xDF80-0xDFBF a cero
	ld bc,0003fh		;8989
	call 04236h		;898c   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	ld hl,0cb80h		;898f   ; 0xCB80-0xCBDF a cero
	ld bc,0005fh		;8992
	jp 04236h		;8995   ; borra_bloque: pone a cero BC + 1 bytes desde HL
pausa_200:		; una espera de 0x200 vueltas, salvo con 0xD8A4
	ld a,(0d8a4h)		;8998
	and a			;899b
	ret nz			;899c
	ld bc,00200h		;899d
L_89A0:
	push ix		;89a0   ; una vuelta lenta (push ix / pop ix)
	pop ix		;89a2
	dec bc			;89a4   ; BC veces
	ld a,b			;89a5
	or c			;89a6
	jr nz,L_89A0		;89a7
	ret			;89a9
quieto_si:		; con 0xCA28, 0xD434, 0xCAE7 o 0xCB3C, el dibujo de quieto
	ld a,(0ca28h)		;89aa   ; 0xCA28...
	and a			;89ad
	jr nz,L_89C1		;89ae
	ld a,(0d434h)		;89b0   ; ...0xD434...
	and a			;89b3
	jr nz,L_89C1		;89b4
	ld a,(0cae7h)		;89b6   ; ...0xCAE7...
	and a			;89b9
	jr nz,L_89C1		;89ba
	ld a,(0cb3ch)		;89bc   ; ...o 0xCB3C
	and a			;89bf
	ret z			;89c0
L_89C1:
	ld a,001h		;89c1   ; el dibujo de quieto
	ld (0cb14h),a		;89c3   ; guarda el dibujo del paso de andar (0, 1, 2, 1: p02:9888)
	ret			;89c6
borra_caf1:		; 0xCAF1 = 0xD443 = 0xCAF6 = 0
	xor a			;89c7
	ld (0caf1h),a		;89c8
	ld (0d443h),a		;89cb
	ld (0caf6h),a		;89ce
	ret			;89d1
musica_otra_vez:		; 0xC690 = 0 y la musica de ahora (p02:8A12)
	ld hl,0c690h		;89d2
	ld (hl),000h		;89d5
	jr L_8A12		;89d7
musica_de_cada_cuadro:		; sin 0xCAF6, con 0xD443 y sin 0xC697: p02:89C7
	ld a,(0caf6h)		;89d9
	and a			;89dc
	jr nz,L_89EC		;89dd
	ld a,(0d443h)		;89df
	and a			;89e2
	jr z,L_89EC		;89e3
	ld a,(0c697h)		;89e5
	and a			;89e8
	call z,borra_caf1		;89e9   ; borra_caf1: 0xCAF1 = 0xD443 = 0xCAF6 = 0
L_89EC:
	ld hl,0c68eh		;89ec   ; 0xC68E = 1: p02:8A7B
	ld a,(hl)			;89ef
	dec a			;89f0
	jp z,L_8A7B		;89f1
L_89F4:
	ld hl,0c690h		;89f4   ; 0xC690 = 1...
	ld a,(hl)			;89f7
	dec a			;89f8
	jr nz,L_8A32		;89f9
	ld (hl),a			;89fb   ; ...lo borra
	ld a,(0caf5h)		;89fc   ; con 0xCAF5 = 0x0A...
	cp 00ah		;89ff
	jr nz,L_8A12		;8a01
	ld hl,00000h		;8a03   ; ...0xD668 = 0...
	ld (0d668h),hl		;8a06
	ld hl,0d8a4h		;8a09   ; ...p10:B3E5 con 0xD8A4...
	call a_p10_b3e5		;8a0c   ; a_p10_b3e5: p10:B3E5 con el banco 10 en 0xA000
	call 06c33h		;8a0f   ; ...y p01:6C33
L_8A12:
	call borra_caf1		;8a12   ; borra_caf1: 0xCAF1 = 0xD443 = 0xCAF6 = 0
	ld a,(0ca5fh)		;8a15   ; con 0xCA5F >= 2: p02:8A9A
	cp 002h		;8a18
	jp nc,L_8A9A		;8a1a
	dec a			;8a1d   ; con 0xCA5F = 1: p01:79BC
	jp z,079bch		;8a1e   ; a_p04_9949: p04:9949 con el banco 4 en 0x8000
	call 07ce6h		;8a21   ; la musica de la zona en la fase...
	ld a,(0ca64h)		;8a24   ; ...o, con 0xCA64, la de p01:6B89
	and a			;8a27
	jr z,L_8A2D		;8a28
	ld hl,06b89h		;8a2a
L_8A2D:
	ld (0ca19h),hl		;8a2d   ; guarda la musica pendiente: la rutina que la pide (16 bits)
	jr L_8A3D		;8a30
L_8A32:
	ld de,0ca18h		;8a32   ; si queda espera, nada
	ld a,(de)			;8a35
	and a			;8a36
	ret nz			;8a37
	inc de			;8a38   ; si no hay musica pendiente, nada
	inc de			;8a39
	ld a,(de)			;8a3a
	and a			;8a3b
	ret z			;8a3c
L_8A3D:
	ld hl,(0ca19h)		;8a3d   ; la pendiente...
	ld de,00000h		;8a40   ; ...ya no lo esta
	ld (0ca19h),de		;8a43   ; guarda la musica pendiente: la rutina que la pide (16 bits)
	ld de,06a11h		;8a47   ; la de p01:6A11 deja pendiente la de p01:6B89...
	call 00020h		;8a4a   ; BIOS DCOMPR - Compares HL with DE
	jr nz,L_8A5B		;8a4d
	ld de,06b89h		;8a4f
	ld (0ca19h),de		;8a52   ; guarda la musica pendiente: la rutina que la pide (16 bits)
	ld a,0b4h		;8a56   ; ...para dentro de 0xB4 cuadros
	ld (0ca18h),a		;8a58   ; guarda la espera hasta poner la musica pendiente
L_8A5B:
	ld a,(0ca77h)		;8a5b   ; sin 0xCA77 ni 0xCA64, y fuera de la especial 0x2A, p01:6B12
	and a			;8a5e
	jr nz,L_8A6F		;8a5f
	ld a,(0ca64h)		;8a61
	and a			;8a64
	jr nz,L_8A6F		;8a65
	ld a,(0ca76h)		;8a67   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 02ah		;8a6a
	call nz,06b12h		;8a6c   ; sonido_05: pide el sonido 0x05
L_8A6F:
	push hl			;8a6f
	ld hl,0ca97h		;8a70   ; 0xCA97 = 0
	ld a,(hl)			;8a73
	and a			;8a74
	jr z,L_8A79		;8a75
	ld (hl),000h		;8a77
L_8A79:
	pop hl			;8a79
	jp (hl)			;8a7a   ; y a la rutina de la musica
L_8A7B:
	xor a			;8a7b   ; 0xC68E = 0
	ld (hl),a			;8a7c
	ld a,(0d430h)		;8a7d   ; con 0xD430 = 1 o 0xCA5F >= 2, nada pendiente
	dec a			;8a80
	jr z,L_8A8B		;8a81
	ld a,(0ca5fh)		;8a83   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	cp 002h		;8a86
	jp c,L_89F4		;8a88
L_8A8B:
	ld hl,00000h		;8a8b
	ld (0ca19h),hl		;8a8e   ; guarda la musica pendiente: la rutina que la pide (16 bits)
	call borra_caf1		;8a91   ; borra_caf1: 0xCAF1 = 0xD443 = 0xCAF6 = 0
	ld a,(0d430h)		;8a94
	dec a			;8a97
	jr z,L_8AAF		;8a98
L_8A9A:
	call 0799bh		;8a9a   ; p01:799B...
	jp c,06b7dh		;8a9d   ; ...con acarreo, p01:6B7D
	ld a,(0ca4ah)		;8aa0   ; las zonas hasta 0x10: p01:6B61; las demas, p01:6B79
	ld hl,06b61h		;8aa3
	cp 011h		;8aa6
	jr c,L_8A5B		;8aa8
	ld hl,06b79h		;8aaa
	jr L_8A5B		;8aad
L_8AAF:
	xor a			;8aaf   ; 0xD430 = 0
	ld (0d430h),a		;8ab0
	ld a,(0caa9h)		;8ab3   ; con 0xCAA9: p01:6B3D
	and a			;8ab6
	jr z,L_8A9A		;8ab7
	ld hl,06b3dh		;8ab9
	jr L_8A5B		;8abc
a_p10_bc27:		; p10:BC27 con el banco 10 en 0xA000
	call 041cdh		;8abe   ; bancos_10: pone el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0bc27h		;8ac1   ; p10:BC27
	jr L_8ACC		;8ac4
a_p07_a000:		; p07:A000 con el banco 7 en 0xA000
	call 041b0h		;8ac6   ; bancos_7: pone el 7 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a000h		;8ac9   ; borra_d8c0: 0xD8C0-0xD8CD a cero
L_8ACC:
	jp 040f0h		;8acc   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
a_p07_a009:		; p07:A009 con el banco 7 en 0xA000
	call 041b0h		;8acf   ; bancos_7: pone el 7 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a009h		;8ad2   ; d8c1_cada_cuadro: p07:A03A y el paso 0xD8C1 (p07:A012, 20 pasos)
	jr L_8B4D		;8ad5
a_p07_a985:		; p07:A985 con el banco 7 en 0xA000
	call 041b0h		;8ad7   ; bancos_7: pone el 7 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a985h		;8ada   ; dc80_de_p57: las 10 fichas de 8 bytes de p57:8000 a 0xDC80
	jr L_8B4D		;8add
a_p07_a996:		; p07:A996 con el banco 7 en 0xA000
	call 041b0h		;8adf   ; bancos_7: pone el 7 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a996h		;8ae2   ; fichas_dc80: cada 0x20 cuadros, las fichas de 0xDC80 (la de tipo 0x0A solo con 0xD8C2 = 0x0A) cambian de entrada (p07:A9C9) y de numero (p07:A9F9)
	jr L_8B4D		;8ae5
L_8AE7:
	call 041b0h		;8ae7   ; bancos_7: pone el 7 en 0xA000 (con su copia en 0xC381-0xC383)
	call a_p06_a387		;8aea   ; a_p06_a387: p06:A387 con el banco 6 en 0xA000
	jr L_8B4D		;8aed
a_p10_a1c1:		; p10:A1C1 con el banco 10 en 0xA000
	call 041cdh		;8aef   ; bancos_10: pone el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a1c1h		;8af2   ; p10:A1C1
	jr L_8B4D		;8af5
a_p10_a234:		; p10:A234 con el banco 10 en 0xA000
	call 041cdh		;8af7   ; bancos_10: pone el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a234h		;8afa   ; p10:A234
	jr L_8B4D		;8afd
a_p11_a3c4:		; p11:A3C4 con el banco 11 en 0xA000
	call 041d5h		;8aff   ; bancos_11: pone el 11 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a3c4h		;8b02   ; p11:A3C4
	jr L_8B4D		;8b05
a_p11_a389:		; p11:A389 con el banco 11 en 0xA000
	call 041d5h		;8b07   ; bancos_11: pone el 11 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a389h		;8b0a   ; p11:A389
	jr L_8B4D		;8b0d
a_p09_a000:		; p09:A000 con el banco 9 en 0xA000
	call 041c5h		;8b0f   ; bancos_9: pone el 9 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a000h		;8b12   ; p09:A000
	jr L_8B4D		;8b15
a_p09_a07b:		; p09:A07B con el banco 9 en 0xA000
	call 041c5h		;8b17   ; bancos_9: pone el 9 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a07bh		;8b1a   ; p09:A07B
	jr L_8B4D		;8b1d
a_p09_b68e:		; p09:B68E con el banco 9 en 0xA000
	call 041c5h		;8b1f   ; bancos_9: pone el 9 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b68eh		;8b22   ; p09:B68E
	jr L_8B4D		;8b25
a_p11_bbfb:		; p11:BBFB con el banco 11 en 0xA000
	call 041d5h		;8b27   ; bancos_11: pone el 11 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0bbfbh		;8b2a   ; p11:BBFB
	jr L_8B4D		;8b2d
a_p11_af47:		; p11:AF47 con el banco 11 en 0xA000
	call 041d5h		;8b2f   ; bancos_11: pone el 11 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0af47h		;8b32   ; p11:AF47
	jr L_8B4D		;8b35
a_p11_b056:		; p11:B056 con el banco 11 en 0xA000
	call 041d5h		;8b37   ; bancos_11: pone el 11 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b056h		;8b3a   ; p11:B056
	jr L_8B4D		;8b3d
a_p11_aee4:		; p11:AEE4 con el banco 11 en 0xA000
	call 041d5h		;8b3f   ; bancos_11: pone el 11 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0aee4h		;8b42   ; p11:AEE4
	jr L_8B4D		;8b45
a_p09_a163:		; p09:A163 con el banco 9 en 0xA000
	call 041c5h		;8b47   ; bancos_9: pone el 9 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a163h		;8b4a   ; p09:A163
L_8B4D:
	jp 040f0h		;8b4d   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
a_p09_a588:		; p09:A588 con el banco 9 en 0xA000
	call 041c5h		;8b50   ; bancos_9: pone el 9 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a588h		;8b53   ; p09:A588
	jr L_8B4D		;8b56
a_p09_a1a1:		; p09:A1A1 con el banco 9 en 0xA000
	call 041c5h		;8b58   ; bancos_9: pone el 9 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a1a1h		;8b5b   ; p09:A1A1
	jr L_8B4D		;8b5e
a_p11_b23f:		; p11:B23F con el banco 11 en 0xA000
	call 041d5h		;8b60   ; bancos_11: pone el 11 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b23fh		;8b63   ; p11:B23F
	jr L_8B4D		;8b66
a_p11_bd31:		; p11:BD31 con el banco 11 en 0xA000
	call 041d5h		;8b68   ; bancos_11: pone el 11 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0bd31h		;8b6b
	jr L_8B4D		;8b6e
a_p14_b712:		; p14:B712 con el banco 14 en 0xA000
	call 041efh		;8b70   ; bancos_14: pone el 14 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b712h		;8b73
	jr L_8B4D		;8b76
a_p10_a65e:		; p10:A65E con el banco 10 en 0xA000
	call 041cdh		;8b78   ; bancos_10: pone el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a65eh		;8b7b   ; p10:A65E
	jr L_8B4D		;8b7e
a_p11_b494:		; p11:B494 con el banco 11 en 0xA000
	call 041d5h		;8b80   ; bancos_11: pone el 11 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b494h		;8b83   ; p11:B494
	jr L_8B4D		;8b86
a_p11_b66e:		; p11:B66E con el banco 11 en 0xA000
	call 041d5h		;8b88   ; bancos_11: pone el 11 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b66eh		;8b8b   ; p11:B66E
	jr L_8B4D		;8b8e
a_p11_a000:		; p11:A000 con el banco 11 en 0xA000
	call 041d5h		;8b90   ; bancos_11: pone el 11 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a000h		;8b93   ; p11:A000
	jr L_8B4D		;8b96
a_p11_a117:		; p11:A117 con el banco 11 en 0xA000
	call 041d5h		;8b98   ; bancos_11: pone el 11 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a117h		;8b9b   ; p11:A117
	jr L_8B4D		;8b9e
a_p07_ab44:		; p07:AB44 con el banco 7 en 0xA000
	call 041b0h		;8ba0   ; bancos_7: pone el 7 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0ab44h		;8ba3   ; numeros_de_fuera: sin 0xD8C0, en las zonas 1-6, fila 3 columna 7: los numeros de las fichas 0 y 1 de 0xDC80 (p07:AB66)
	jr L_8B4D		;8ba6
a_p11_b9c1:		; p11:B9C1 con el banco 11 en 0xA000
	call 041d2h		;8ba8   ; bancos_1_2_11: pone el 1 en 0x6000, el 2 en 0x8000, el 11 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b9c1h		;8bab   ; p11:B9C1
	jr L_8B4D		;8bae
a_p11_ba03:		; p11:BA03 con el banco 11 en 0xA000
	call 041d2h		;8bb0   ; bancos_1_2_11: pone el 1 en 0x6000, el 2 en 0x8000, el 11 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0ba03h		;8bb3   ; p11:BA03
	jr L_8B4D		;8bb6
a_p10_bfbc:		; p10:BFBC con el banco 10 en 0xA000
	call 041cdh		;8bb8   ; bancos_10: pone el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0bfbch		;8bbb   ; p10:BFBC
	jr L_8B4D		;8bbe
a_p07_b5af:		; p07:B5AF con el banco 7 en 0xA000
	call 041b0h		;8bc0   ; bancos_7: pone el 7 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b5afh		;8bc3   ; se_tocan: acarreo si se tocan las dos cajas: la de (H, L) con D y E y la del otro juego de registros (|X - X'| < D + D'; en Y, por debajo menos que E y por encima menos que E')
	jr L_8B4D		;8bc6
a_p07_aed1:		; p07:AED1 con el banco 7 en 0xA000
	call 041adh		;8bc8   ; bancos_1_2_7: pone el 1 en 0x6000, el 2 en 0x8000, el 7 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0aed1h		;8bcb   ; delante_con_actores: la caja de delante de Snake (p07:B70F) contra cada actor: salvo el 0x0A, los de tipo menor de 0x10 reciben el golpe (p07:B3DA); los 0x10-0x11 hacen 4 de dano a Snake
	jr L_8BEE		;8bce
a_p07_af0d:		; p07:AF0D con el banco 7 en 0xA000
	call 041adh		;8bd0   ; bancos_1_2_7: pone el 1 en 0x6000, el 2 en 0x8000, el 7 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0af0dh		;8bd3   ; delante_con_d800: la caja de delante de Snake contra las fichas de 0xD800 (salvo el tipo 0x0A): 1 de dano a la ficha
	jr L_8BEE		;8bd6
a_p07_b6cc:		; p07:B6CC con el banco 7 en 0xA000
	call 041adh		;8bd8   ; bancos_1_2_7: pone el 1 en 0x6000, el 2 en 0x8000, el 7 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b6cch		;8bdb   ; caja_de_snake_c: sin 0xCB32, la caja del dibujo de Snake (p07:B6E9) bajada 0xCB43
	jr L_8BEE		;8bde
a_p07_b5cc:		; p07:B5CC con el banco 7 en 0xA000
	call 041adh		;8be0   ; bancos_1_2_7: pone el 1 en 0x6000, el 2 en 0x8000, el 7 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b5cch		;8be3   ; caja_de_snake: la caja de Snake segun su dibujo (p07:B624) bajada 0xCB43 y con 0xCB28 (p07:B608); NZ sin caja: con 0xCB32 (salvo en la zona 0x0A salas 0x0B, 0x0C, 0x10 y 0x11 o con 0xCA8D); con 0xCA8D, la caja sin mas
	jr L_8BEE		;8be6
a_p11_bdbd:		; p11:BDBD con el banco 11 en 0xA000
	call 041d5h		;8be8   ; bancos_11: pone el 11 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0bdbdh		;8beb   ; p11:BDBD
L_8BEE:
	jp 040f0h		;8bee   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
L_8BF1:
	call 041cdh		;8bf1   ; bancos_10: pone el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0bed4h		;8bf4
	call 0bc59h		;8bf7
	jr L_8BEE		;8bfa
a_p06_a6f9:		; p06:A6F9 con el banco 6 en 0xA000
	call 041a0h		;8bfc   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a6f9h		;8bff   ; cuentas_de_snake: el suelo de la zona 7 (p06:A710), la cuenta de 0xCB54 y, con 0xCB4B, cada 4 cuadros el bit 0 de 0xCB4D
	jr L_8BEE		;8c02
a_p09_b62f:		; p09:B62F con el banco 9 en 0xA000
	call 041c5h		;8c04   ; bancos_9: pone el 9 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b62fh		;8c07   ; p09:B62F
	jr L_8BEE		;8c0a
a_p06_a0ab:		; p06:A0AB con el banco 6 en 0xA000
	call 041a0h		;8c0c   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a0abh		;8c0f   ; snake_de_nuevo: 0xCB00-0xCB3F y 0xCB40-0xCB4F a cero; el primero de 0xD638 a 1, Snake en el estado 0x19 con el dibujo 0x0D, la direccion 3, en (0x6E, 0xA5), 0xCA97 = 1 y 0xCADF = 1
	jr L_8BEE		;8c12
a_p06_a598:		; p06:A598 con el banco 6 en 0xA000
	call 041a0h		;8c14   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a598h		;8c17   ; siguen_a_snake_aqui: los 1-4 que siguen a Snake (0xCAA0) puestos donde esta Snake (p06:A5A1)
	jr L_8BEE		;8c1a
a_p10_ba03:		; p10:BA03 con el banco 10 en 0xA000
	call 041cdh		;8c1c   ; bancos_10: pone el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0ba03h		;8c1f   ; p10:BA03
	jr L_8BEE		;8c22
L_8C24:
	call L_8A9A		;8c24
	jr L_8C2F		;8c27
L_8C29:
	call 040f0h		;8c29   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call paleta_de_la_sala		;8c2c   ; paleta_de_la_sala: la paleta comun y la de la sala
L_8C2F:
	jp 041c2h		;8c2f   ; bancos_1_2_9: pone el 1 en 0x6000, el 2 en 0x8000, el 9 en 0xA000 (con su copia en 0xC381-0xC383)
L_8C32:
	call 041cdh		;8c32   ; bancos_10: pone el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0bed4h		;8c35   ; p10:BED4
	call 0bc59h		;8c38   ; p10:BC59
	jr $+117		;8c3b
sprites_de_sala_si_b_9:		; sprites_de_sala_si y deja el banco 9
	call 04e22h		;8c3d   ; sprites_de_sala_si: con 0xE1D0 puesto no se tocan
	jr $+112		;8c40
L_8C42:
	call 040f0h		;8c42   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call a_p10_b3e5		;8c45   ; a_p10_b3e5: p10:B3E5 con el banco 10 en 0xA000
	jr $+104		;8c48
a_p03_b563:		; p03:B563 con el banco 3 en 0xA000
	call 040f0h		;8c4a   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b563h		;8c4d   ; dibuja_el_de_e248: lo mismo para el de 0xE248: sprites 24-27 (0xDC60) desde el patron 0x28, colores de p08:BB1A y p08:BB2C
	jr $+96		;8c50
a_p03_b4e6:		; p03:B4E6 con el banco 3 en 0xA000
	call 040f0h		;8c52   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b4e6h		;8c55   ; dibuja_el_de_e240: sin 0xE240, nada
	jr $+88		;8c58
a_p03_b5b5:		; p03:B5B5 con el banco 3 en 0xA000
	call 040f0h		;8c5a   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b5b5h		;8c5d   ; dibuja_el_de_dfd8: el de 0xDFD8: sprites 22-25 (0xDC58), patrones desde 0xE0, colores de p08:BB7F y p08:BB9E
	jr $+80		;8c60
a_p03_b593:		; p03:B593 con el banco 3 en 0xA000
	call 040f0h		;8c62   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b593h		;8c65   ; franja_de_dfd8: con 0xDFD8 y 0xDFD9, una franja de la pagina 0 a Y = 0xFE de la 1 (YMMM)
	jr $+72		;8c68
a_p03_b4e0:		; p03:B4E0 con el banco 3 en 0xA000
	call 040f0h		;8c6a   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b4e0h		;8c6d   ; dibuja_los_que_siguen: p03:B4E6 y p03:B563
	jr $+64		;8c70
a_p03_b404:		; p03:B404 con el banco 3 en 0xA000
	call 040f0h		;8c72   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b404h		;8c75   ; los_que_siguen: con 0xCAA0 = 3, p03:B4AF; si no, las tres fichas (0xE240, 0xE248, 0xDFD8) por el rastro
	jr $+56		;8c78
a_p03_b0dc:		; p03:B0DC con el banco 3 en 0xA000
	call 040f0h		;8c7a   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b0dch		;8c7d   ; pon_bandera: pone la bandera A de 0xD7D0
	jr $+48		;8c80
a_p03_b607:		; p03:B607 con el banco 3 en 0xA000
	call 040f0h		;8c82   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b607h		;8c85   ; ventana_segun_snake: la ventana arriba (Y = 0x1C) con Snake abajo; si no, abajo (Y = 0x7C)
	jr $+40		;8c88
a_p03_b610:		; p03:B610 con el banco 3 en 0xA000
	call 040f0h		;8c8a   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b610h		;8c8d   ; ventana_7c: la ventana del mensaje en Y = 0x7C
	jr $+32		;8c90
a_p03_b603:		; p03:B603 con el banco 3 en 0xA000
	call 040f0h		;8c92   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b603h		;8c95   ; ventana_0c: la ventana del mensaje en Y = 0x0C
	jr $+24		;8c98
a_p03_b5ff:		; p03:B5FF con el banco 3 en 0xA000
	call 040f0h		;8c9a   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b5ffh		;8c9d   ; ventana_4c: la ventana del mensaje en Y = 0x4C
	jr $+16		;8ca0

; ----------------------------------------------------------------------
; DATOS sin identificar  0x8ca2..0x8caa  (8 bytes)
DATA_8CA2:
	defb 0cdh,0f0h,040h,0cdh,001h,0b6h,018h,006h	; 8ca2  ..@.....

; ======================================================================
; CODIGO 0x8caa..0x8cbb  (17 bytes)
; ======================================================================


a_p03_b63e:		; p03:B63E con el banco 3 en 0xA000
	call 040f0h		;8caa   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b63eh		;8cad   ; quita_la_ventana: lo guardado en Y = 0xD8 otra vez en su sitio, y 0xD8A8 = 0
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


paleta_b914_b_9:		; paleta_b914 y deja el banco 9
	call paleta_b914		;8ccb   ; paleta_b914: la paleta de p56:B914
	jr $-30		;8cce
a_p03_b67d:		; p03:B67D con el banco 3 en 0xA000
	call 040f0h		;8cd0   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b67dh		;8cd3   ; barrido_2: 0xE270 = 2: el barrido de la otra pagina desde (E, D), de 4 en 4
	jr $-38		;8cd6
a_p10_a6a4:		; p10:A6A4 con el banco 10 en 0xA000
	call 041cah		;8cd8   ; bancos_1_2_10: pone el 1 en 0x6000, el 2 en 0x8000, el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a6a4h		;8cdb   ; p10:A6A4
	jr $-46		;8cde
a_p10_a6c2:		; p10:A6C2 con el banco 10 en 0xA000
	call 041cah		;8ce0   ; bancos_1_2_10: pone el 1 en 0x6000, el 2 en 0x8000, el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a6c2h		;8ce3   ; p10:A6C2
	jr $-54		;8ce6
a_p03_b65d:		; p03:B65D con el banco 3 en 0xA000
	call 040f0h		;8ce8   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b65dh		;8ceb   ; ventana_de_bed8: la ventana a 0 y el rectangulo de X = 0xBE..., Y = 0xD8, 0x22 x 0x28 encima
	jr $-62		;8cee
dibujos_de_sala_b_9:		; dibujos_de_sala y deja el banco 9
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
	call 050e8h		;8d25   ; mosaico_f2_b3: el mosaico de HL en (D, E), B filas de C caracteres, con la forma 2 de la franja 3 (p00:512C)
	jr $-120		;8d28
a_p10_bce4:		; p10:BCE4 con el banco 10 en 0xA000
	call 041cah		;8d2a   ; bancos_1_2_10: pone el 1 en 0x6000, el 2 en 0x8000, el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0bce4h		;8d2d   ; p10:BCE4
	jr L_8D53		;8d30
entra_en_sala_1_b_1_2_15:		; entra_en_sala_1 y deja los bancos 1, 2 y 15
	call 052d2h		;8d32   ; entra_en_sala_1: entra en la sala nueva con 0xD440 = 1
	jr L_8D53		;8d35
entra_en_sala_b_1_2_15:		; entra_en_sala y deja los bancos 1, 2 y 15
	call 052cfh		;8d37   ; entra_en_sala: entra en la sala nueva (0xD440 = 0)
	jr L_8D53		;8d3a
L_8D3C:
	call 04ccch		;8d3c
	jr L_8D53		;8d3f
entra_en_sala_especial_1_b_1_2_15:		; entra_en_sala_especial_1 y deja los bancos 1, 2 y 15
	call 055d2h		;8d41   ; entra_en_sala_especial_1: entra en una sala de 0xCA76 con 0xD440 = 1
	jr L_8D53		;8d44
lineas_c3_en_la_otra_b_1_2_15:		; lineas_c3_en_la_otra y deja los bancos 1, 2 y 15
	call 05b78h		;8d46   ; lineas_c3_en_la_otra: p00:5F98 y las lineas de p00:439D en la otra pagina
	jr L_8D53		;8d49
L_8D4B:
	call lista_de_zona_a_d900		;8d4b   ; lista_de_zona_a_d900: 0xD900-0xD9FF a 0xFF y la lista de p30 de la zona (o de la especial)
	jr L_8D53		;8d4e
mapas_de_bits_especiales_b_1_2_15:		; mapas_de_bits_especiales y deja los bancos 1, 2 y 15
	call 05caeh		;8d50   ; mapas_de_bits_especiales: los mapas de bits de las salas especiales, desde 0x8C00 de la RAM
L_8D53:
	jp 041f4h		;8d53   ; bancos_1_2_15: pone el 1 en 0x6000, el 2 en 0x8000, el 15 en 0xA000 (con su copia en 0xC381-0xC383)
rehace_marcador_b_1_2_15:		; rehace_marcador y deja los bancos 1, 2 y 15
	call 04279h		;8d56   ; rehace_marcador: el marcador: lineas, marco y barra de vida
	jr L_8D53		;8d59
cambia_de_zona_b_1_2_15:		; cambia_de_zona y deja los bancos 1, 2 y 15
	call 059a7h		;8d5b   ; cambia_de_zona: pasa a la zona A
	jr L_8D53		;8d5e
L_8D60:
	call 07c77h		;8d60   ; musica_de_la_zona_si: con 0xCAF6, o sin 0xC697, la musica de la zona
	jr L_8D53		;8d63
a_p11_bdbd_2:		; p11:BDBD con el banco 11 en 0xA000
	call 041d5h		;8d65   ; bancos_11: pone el 11 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0bdbdh		;8d68
	jr L_8D53		;8d6b
a_p10_b9e5:		; p10:B9E5 con el banco 10 en 0xA000
	call 041cdh		;8d6d   ; bancos_10: pone el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b9e5h		;8d70   ; p10:B9E5
	jr L_8D53		;8d73
a_p03_b4d1:		; p03:B4D1 con el banco 3 en 0xA000
	call 040f0h		;8d75   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b4d1h		;8d78   ; cuenta_caa0: con 0xCAA0 = 3 pasa a 2; con cualquiera, empiezan los que siguen
	jr L_8D83		;8d7b
a_p03_b0f6:		; p03:B0F6 con el banco 3 en 0xA000
	call 040f0h		;8d7d   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b0f6h		;8d80   ; mira_bandera: NZ si la bandera A de 0xD7D0 esta puesta
L_8D83:
	jp 041b0h		;8d83   ; bancos_7: pone el 7 en 0xA000 (con su copia en 0xC381-0xC383)
dibujos_de_sala_b_7:		; dibujos_de_sala y deja el banco 7
	call 04cb8h		;8d86   ; dibujos_de_sala: con 0xCA77 puesto, p02:8578
	jr L_8D83		;8d89
L_8D8B:
	call 07c77h		;8d8b   ; musica_de_la_zona_si: con 0xCAF6, o sin 0xC697, la musica de la zona
	jr L_8DC3		;8d8e
a_p03_bda5:		; p03:BDA5 con el banco 3 en 0xA000
	call 040f0h		;8d90   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0bda5h		;8d93   ; suma_7: suma 7 a la cosa 1 (B = 1, C = 7)
	jr L_8DC3		;8d96
cambia_de_zona_b_1_2_7:		; cambia_de_zona y deja los bancos 1, 2 y 7
	call 059a7h		;8d98   ; cambia_de_zona: pasa a la zona A
	jr L_8DC3		;8d9b
a_p11_aee4_2:		; p11:AEE4 con el banco 11 en 0xA000
	call 041d5h		;8d9d   ; bancos_11: pone el 11 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0aee4h		;8da0
	jr L_8DC3		;8da3
a_p03_be51:		; p03:BE51 con el banco 3 en 0xA000
	call 040f0h		;8da5   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0be51h		;8da8   ; suma_una: la cosa A: la tiene y una mas
	jr L_8DC3		;8dab
a_p10_bfbc_2:		; p10:BFBC con el banco 10 en 0xA000
	call 041cdh		;8dad   ; bancos_10: pone el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0bfbch		;8db0
	jr L_8DC3		;8db3
a_p03_b1be:		; p03:B1BE con el banco 3 en 0xA000
	call 040f0h		;8db5   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b1beh		;8db8   ; algo_en_la_sala_de: en la zona 0x0C: p03:B1FD
	jr L_8DC3		;8dbb
a_p03_ac02:		; p03:AC02 con el banco 3 en 0xA000
	call 040f0h		;8dbd   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0ac02h		;8dc0   ; a_estado_14: al estado 0x14 (si no lo esta): el sprite 4 fuera, 0xCB40 = 0x40, mirando abajo, las rachas de p37:9638 y el sonido 0x8D
L_8DC3:
	jp 041adh		;8dc3   ; bancos_1_2_7: pone el 1 en 0x6000, el 2 en 0x8000, el 7 en 0xA000 (con su copia en 0xC381-0xC383)
barras_de_vida_b_1_2_7:		; barras_de_vida y deja los bancos 1, 2 y 7
	call 04288h		;8dc6   ; barras_de_vida: la barra de vida y, con 0xCA5F, p04:9889
	jr L_8DC3		;8dc9
L_8DCB:
	call 040f0h		;8dcb   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call pon_cb3d		;8dce   ; pon_cb3d: salvo en el estado 0x14: 0xCB3D = 1 y 0xCB3E = 16 (si no estaba)
	jr L_8DC3		;8dd1
a_p03_bd82:		; p03:BD82 con el banco 3 en 0xA000
	call 040f0h		;8dd3   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0bd82h		;8dd6   ; lleva_cosa: desde la 0x32, solo el rotulo y 0xCAC7 = 1
	jr L_8DC3		;8dd9
a_p11_bdbd_3:		; p11:BDBD con el banco 11 en 0xA000
	call 041d5h		;8ddb   ; bancos_11: pone el 11 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0bdbdh		;8dde
	jr L_8DC3		;8de1
cambia_de_zona_b_1_2_8:		; cambia_de_zona y deja los bancos 1, 2 y 8
	call 059a7h		;8de3   ; cambia_de_zona: pasa a la zona A
	jr $+24		;8de6
a_p01_6fd5:		; p01:6FD5 con el banco 1 en 0x6000
	call 040f0h		;8de8   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 06fd5h		;8deb   ; rachas_a_ram_de_8: las rachas de DE (banco 8) en HL
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
a_p03_b67d_2:		; p03:B67D con el banco 3 en 0xA000
	call 040f0h		;8e01   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b67dh		;8e04   ; barrido_2: 0xE270 = 2: el barrido de la otra pagina desde (E, D), de 4 en 4
	jr L_8DFE		;8e07
a_p03_b6c8:		; p03:B6C8 con el banco 3 en 0xA000
	call 040f0h		;8e09   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b6c8h		;8e0c   ; barrido_cada_cuadro: el barrido de 0xE270: 1 por pasos (p03:B7A1), 2 de 4 en 4 con franjas de la otra pagina
	jr L_8DFE		;8e0f
cambia_de_zona_b_1_2_9:		; cambia_de_zona y deja los bancos 1, 2 y 9
	call 059a7h		;8e11   ; cambia_de_zona: pasa a la zona A
	jr $+88		;8e14
a_p03_b814:		; p03:B814 con el banco 3 en 0xA000
	call 040f0h		;8e16   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b814h		;8e19   ; pon_mosaico_de_quien_habla: la ficha B de 0xE260 (8 bytes) con el mosaico A (6 x 4 de p44:93FD) en DE; el 4 quita el bit 1 de 0xD7D2
	jr $+80		;8e1c
a_p03_b8ac:		; p03:B8AC con el banco 3 en 0xA000
	call 040f0h		;8e1e   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b8ach		;8e21   ; mosaicos_de_quien_habla: cada 8 cuadros, 0xCAB9 uno mas
	jr $+72		;8e24
a_p03_b866:		; p03:B866 con el banco 3 en 0xA000
	call 040f0h		;8e26   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b866h		;8e29   ; quita_mosaico_de_quien_habla: la ficha A de 0xE260 libre y su sitio (0x20 x 0x30) a 0
	jr $+64		;8e2c
L_8E2E:
	call 06e18h		;8e2e   ; dibujos_de_93e5: la lista de dibujos A de p44:93E5 en la VRAM de 0x6000
	jr $+59		;8e31
a_p15_a316:		; p15:A316 con el banco 15 en 0xA000
	call 041f4h		;8e33   ; bancos_1_2_15: pone el 1 en 0x6000, el 2 en 0x8000, el 15 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a316h		;8e36   ; p15:A316
	jr $+51		;8e39
a_p01_6fd5_2:		; p01:6FD5 con el banco 1 en 0x6000
	call 040f0h		;8e3b   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 06fd5h		;8e3e   ; rachas_a_ram_de_8: las rachas de DE (banco 8) en HL
	jr $+43		;8e41
a_p06_aeff:		; p06:AEFF con el banco 6 en 0xA000
	call 041a0h		;8e43   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0aeffh		;8e46   ; tras_la_conversacion: lo que deja hecho la conversacion A (p06:AF02; desde p09:BE53): banderas de 0xD7D0-0xD7E3, sonidos...
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
	call 05f5fh		;8e66   ; a_p12_6d78: p12:6D78 con el banco 12 en 0x6000
	call 05f57h		;8e69   ; a_p12_6ce0: p12:6CE0 con el banco 12 en 0x6000
L_8E6C:
	jp 041c2h		;8e6c   ; bancos_1_2_9: pone el 1 en 0x6000, el 2 en 0x8000, el 9 en 0xA000 (con su copia en 0xC381-0xC383)
a_p03_b3e8:		; p03:B3E8 con el banco 3 en 0xA000
	call 040f0h		;8e6f   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b3e8h		;8e72   ; llena_el_rastro: las 16 posiciones del rastro con la Y, la X y la direccion de ahora
	jr L_8E6C		;8e75
L_8E77:
	call 067cdh		;8e77   ; cambia_tablas_de_sprites: alterna las tablas de sprites de la VRAM: atributos en 0xF600 o 0xF200, colores en 0xF400 o 0xF000
	jr L_8E6C		;8e7a
L_8E7C:
	call 067f5h		;8e7c   ; sprites_a_vram_turnos: los sprites a la VRAM, cambiando el orden cada cuadro para que no desaparezcan
	jr L_8E6C		;8e7f
L_8E81:
	call 07c77h		;8e81   ; musica_de_la_zona_si: con 0xCAF6, o sin 0xC697, la musica de la zona
	jr L_8E6C		;8e84
L_8E86:
	call 040f0h		;8e86   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call paleta_b98a		;8e89   ; paleta_b98a: la paleta de p56:B98A
	jr L_8E6C		;8e8c
a_p11_be0f:		; p11:BE0F con el banco 11 en 0xA000
	call 041d5h		;8e8e   ; bancos_11: pone el 11 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0be0fh		;8e91   ; p11:BE0F
	jr L_8E6C		;8e94
a_p11_be6b:		; p11:BE6B con el banco 11 en 0xA000
	call 041d5h		;8e96   ; bancos_11: pone el 11 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0be6bh		;8e99   ; p11:BE6B
	jr L_8E6C		;8e9c
a_p11_be94:		; p11:BE94 con el banco 11 en 0xA000
	call 041d5h		;8e9e   ; bancos_11: pone el 11 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0be94h		;8ea1
	jr L_8E6C		;8ea4
a_p11_bea2:		; p11:BEA2 con el banco 11 en 0xA000
	call 041d5h		;8ea6   ; bancos_11: pone el 11 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0bea2h		;8ea9   ; p11:BEA2
	jr L_8E6C		;8eac
a_p11_bf0f:		; p11:BF0F con el banco 11 en 0xA000
	call 041d2h		;8eae   ; bancos_1_2_11: pone el 1 en 0x6000, el 2 en 0x8000, el 11 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0bf0fh		;8eb1   ; p11:BF0F
	jr L_8E6C		;8eb4
L_8EB6:
	call 07ce6h		;8eb6   ; rutina_de_fase: HL = la rutina de la zona en la lista de la fase 0xCA22 (p06:B40C)
	call 041c2h		;8eb9   ; bancos_1_2_9: pone el 1 en 0x6000, el 2 en 0x8000, el 9 en 0xA000 (con su copia en 0xC381-0xC383)
	ld (0ca20h),hl		;8ebc   ; guarda la rutina de la musica que suena (16 bits; p00:5B50)
	jp (hl)			;8ebf
a_p03_b4e0_2:		; p03:B4E0 con el banco 3 en 0xA000
	call 040f0h		;8ec0   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b4e0h		;8ec3   ; dibuja_los_que_siguen: p03:B4E6 y p03:B563
	jr $+15		;8ec6

; ----------------------------------------------------------------------
; DATOS sin identificar  0x8ec8..0x8ecd  (5 bytes)
DATA_8EC8:
	defb 0cdh,0a7h,059h,018h,008h	; 8ec8

; ======================================================================
; CODIGO 0x8ecd..0x8f05  (56 bytes)
; ======================================================================


L_8ECD:
	call 067cdh		;8ecd   ; cambia_tablas_de_sprites: alterna las tablas de sprites de la VRAM: atributos en 0xF600 o 0xF200, colores en 0xF400 o 0xF000
	jr L_8ED5		;8ed0
L_8ED2:
	call 067f5h		;8ed2   ; sprites_a_vram_turnos: los sprites a la VRAM, cambiando el orden cada cuadro para que no desaparezcan
L_8ED5:
	jp 041cah		;8ed5   ; bancos_1_2_10: pone el 1 en 0x6000, el 2 en 0x8000, el 10 en 0xA000 (con su copia en 0xC381-0xC383)
sprites_a_vram_b_1_2_10:		; sprites_a_vram y deja los bancos 1, 2 y 10
	call 04f97h		;8ed8   ; sprites_a_vram: los colores de los sprites (0xDA00) y detras sus atributos (0xDC00)...
	jr L_8ED5		;8edb
a_p03_b1a3:		; p03:B1A3 con el banco 3 en 0xA000
	call 040f0h		;8edd   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b1a3h		;8ee0   ; borra_aviso: X = 0xD0, Y = 0, 0x20 x 0x14 a 0 en las dos paginas
	jr L_8ED5		;8ee3
L_8EE5:
	call musica_otra_vez		;8ee5   ; musica_otra_vez: 0xC690 = 0 y la musica de ahora (p02:8A12)
	jr L_8ED5		;8ee8
a_p03_af05:		; p03:AF05 con el banco 3 en 0xA000
	call 040f0h		;8eea   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0af05h		;8eed   ; d446_si: con 0xCA5F < 2, 0xD446 = 4
L_8EF0:
	jp 041a0h		;8ef0   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
L_8EF3:
	call 07c77h		;8ef3   ; musica_de_la_zona_si: con 0xCAF6, o sin 0xC697, la musica de la zona
	jr L_8EF0		;8ef6
L_8EF8:
	call 040f0h		;8ef8   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call llama_6e0d_a3c8		;8efb   ; llama_6e0d_a3c8: p01:6E0D y p06:A3C8
	jr $+13		;8efe
sprites_de_sala_si_b_14:		; sprites_de_sala_si y deja el banco 14
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
	call a_p10_b3e5		;8f11   ; a_p10_b3e5: p10:B3E5 con el banco 10 en 0xA000
	jr L_8F60		;8f14
a_p01_7f37:		; p01:7F37 con el banco 1 en 0x6000
	call 040f0h		;8f16   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 07f37h		;8f19   ; es_solido: p01:7F3D guardando HL
	jr L_8F60		;8f1c
a_p03_b1be_2:		; p03:B1BE con el banco 3 en 0xA000
	call 040f0h		;8f1e   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b1beh		;8f21   ; algo_en_la_sala_de: en la zona 0x0C: p03:B1FD
	jr L_8F60		;8f24
a_p03_b1f5:		; p03:B1F5 con el banco 3 en 0xA000
	call 040f0h		;8f26   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b1f5h		;8f29
	jr L_8F60		;8f2c
a_p03_b3a6:		; p03:B3A6 con el banco 3 en 0xA000
	call 040f0h		;8f2e   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b3a6h		;8f31   ; pinta_ficha: el dibujo de la ficha (16 x 16 desde X = 0x68 + dibujo * 16, Y = 0xB0 de la pagina 3, TIMP)
	jr L_8F60		;8f34
a_p03_b289:		; p03:B289 con el banco 3 en 0xA000
	call 040f0h		;8f36   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b289h		;8f39   ; guarda_fondo: el fondo (16 x 16) de la otra pagina a esta en el sitio de la ficha
	jr L_8F60		;8f3c
a_p03_b322:		; p03:B322 con el banco 3 en 0xA000
	call 040f0h		;8f3e   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b322h		;8f41   ; vuelve_el_fondo: el fondo guardado otra vez a la otra pagina
	jr L_8F60		;8f44
a_p01_7f3d:		; p01:7F3D con el banco 1 en 0x6000
	call 040f0h		;8f46   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 07f3dh		;8f49   ; es_solido_si: acarreo si el caracter del mapa en (H = X, L = Y) llega al umbral de 0xCA4E (0xCA4F desde 0x81)
	jr L_8F60		;8f4c
L_8F4E:
	call cuatro_bytes_por_direccion		;8f4e   ; cuatro_bytes_por_direccion: 4 bytes de la tabla de HL (banco 6) segun la direccion de Snake, a donde dice p01:6406
	jr L_8F60		;8f51
L_8F53:
	call cuatro_bytes_por_a		;8f53   ; cuatro_bytes_por_a:
	jr L_8F60		;8f56
L_8F58:
	call junto_a_snake		;8f58   ; junto_a_snake: la ficha IX en la Y y la X de Snake mas el desplazamiento de su direccion en la tabla de HL
	jr L_8F60		;8f5b
L_8F5D:
	call junto_a_snake_beac		;8f5d   ; junto_a_snake_beac: la ficha IX junto a Snake, con los desplazamientos de p06:BEAC
L_8F60:
	jp 041d2h		;8f60   ; bancos_1_2_11: pone el 1 en 0x6000, el 2 en 0x8000, el 11 en 0xA000 (con su copia en 0xC381-0xC383)
dos_palabras_por_b_b_1_2_11:		; dos_palabras_por_b y deja los bancos 1, 2 y 11
	call dos_palabras_por_b		;8f63   ; dos_palabras_por_b: p02:872E con el banco 8
	jr L_8F60		;8f66
a_p03_b1ba:		; p03:B1BA con el banco 3 en 0xA000
	call 040f0h		;8f68   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b1bah		;8f6b   ; algo_en_la_sala: DE = la fila y la columna de ahora
	jr L_8F60		;8f6e
a_p03_af05_2:		; p03:AF05 con el banco 3 en 0xA000
	call 040f0h		;8f70   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0af05h		;8f73   ; d446_si: con 0xCA5F < 2, 0xD446 = 4
	jr L_8F60		;8f76
a_p12_6e70_b_1_2_11:		; a_p12_6e70 y deja los bancos 1, 2 y 11
	call 05f88h		;8f78   ; a_p12_6e70: p12:6E70 con el banco 12 en 0x6000
	jr L_8F60		;8f7b
a_p03_b19a:		; p03:B19A con el banco 3 en 0xA000
	call 040f0h		;8f7d   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b19ah		;8f80   ; acaba_llamada: borra el aviso y 0xE1E8 = 0
	jr L_8F60		;8f83
a_p03_b132:		; p03:B132 con el banco 3 en 0xA000
	call 040f0h		;8f85   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b132h		;8f88   ; llamada_cada_cuadro: sin llamada (0xE1E8 = 0), nada
	jr L_8F60		;8f8b
a_p03_b11f:		; p03:B11F con el banco 3 en 0xA000
	call 040f0h		;8f8d   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b11fh		;8f90   ; empieza_llamada: la llamada A: 0xE1E8 = 1, 0xE1E9 = A, 0xE1EA = 0, 0xE1EB = 0x0E
	jr L_8F60		;8f93
a_p03_be60:		; p03:BE60 con el banco 3 en 0xA000
	call 040f0h		;8f95   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0be60h		;8f98   ; gasta_una: la cosa A una menos; con 1 y 2, nada mas; si se acaba, fuera de las manos y el mensaje de p10:B3E5 con 0xD874
	jr L_8F60		;8f9b
a_p03_b108:		; p03:B108 con el banco 3 en 0xA000
	call 040f0h		;8f9d   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b108h		;8fa0   ; llamada_800e: la conversacion de p48:800E; si encuentra ficha, la llamada 0 (p03:B11F)
	jr L_8F60		;8fa3
a_p07_bf5c:		; p07:BF5C con el banco 7 en 0xA000
	call 041b0h		;8fa5   ; bancos_7: pone el 7 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0bf5ch		;8fa8   ; toca_e230_o_fijas: acarreo si la caja de (H, L, D, E) toca la ficha 0xE230, la caja de la zona 0x0C sala 6 o alguna de las de p12:7F25
	jr L_8F60		;8fab
a_p07_bb10:		; p07:BB10 con el banco 7 en 0xA000
	call 041b0h		;8fad   ; bancos_7: pone el 7 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0bb10h		;8fb0   ; sitio_ocupado: acarreo si la caja de (H, L, D, E) toca algo de la sala (p02:9071, al dejar una cosa): las cosas de 0xD7C0, las fichas de 0xCC00 y 0xCC80, 0xD760, cajas fijas de algunas salas, 0xD8C0, las entradas de p07:AA83, las fichas de 0xD500, las de 0xE070 (fuera de las salas especiales) y las de 0xDF80
	jp 040f0h		;8fb3   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
prepara_d770:		; la tabla de 0xD770 (16 bytes) a 0xFF, con 0x20, 0x22, 0xA4 y 0x21 en sus sitios, y 0xD780-0xD783 a 0xFF
	ld hl,0d770h		;8fb6   ; apunta a las cosas dejadas: 0x23 en 0xD770, 0x29 en 0xD775, la de la especial 0x29 en 0xD77A
	ld bc,0000fh		;8fb9
	ld a,0ffh		;8fbc
	call 04237h		;8fbe   ; llena_bloque: pone A en BC + 1 bytes desde HL
	ld hl,0d771h		;8fc1   ; 0xD771 = 0x20
	ld (hl),020h		;8fc4
	ld hl,0d776h		;8fc6   ; 0xD776 = 0x22
	ld (hl),022h		;8fc9
	ld hl,0d77ah		;8fcb
	inc l			;8fce
	ld (hl),0a4h		;8fcf   ; 0xD77B = 0xA4
	inc l			;8fd1
	ld (hl),021h		;8fd2   ; 0xD77C = 0x21
	ld hl,0d780h		;8fd4   ; 0xD780-0xD783 a 0xFF
	ld bc,00003h		;8fd7
	ld a,0ffh		;8fda
	jp 04237h		;8fdc   ; llena_bloque: pone A en BC + 1 bytes desde HL
cosas_de_la_sala:		; las cosas de la sala (0xD7C0) de las listas de p06 y las pinta
	call 041a0h		;8fdf   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call borra_d7c0		;8fe2   ; las 4 fichas de 0xD7C0 a cero
	ld a,(0ca4ah)		;8fe5   ; la zona 0x10 tiene su lista (p02:901E)
	cp 010h		;8fe8
	jr z,L_901E		;8fea
	ld hl,0b6d7h		;8fec   ; las salas de la zona en p06:B6D7...
	call 043f6h		;8fef   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	call busca_sala_en_pares		;8ff2   ; ...el numero de la de esta sala
	jp c,L_9001		;8ff5   ; si no esta, sin la lista de p06:B7F2
	ld hl,0b7f2h		;8ff8   ; la lista de la sala en p06:B7F2...
	call 043f6h		;8ffb   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	call lista_a_d7c0		;8ffe   ; ...a 0xD7C0
L_9001:
	call dejadas_en_la_sala		;9001   ; y las que se dejaron en la sala (0xD770)
	call pinta_cosas		;9004   ; las pinta
	jr L_9027		;9007
busca_sala_en_pares:		; parejas [sala][dato] hasta 0xFF: A = el dato de la sala (acarreo si no esta)
	ld a,(hl)			;9009
	cp 0ffh		;900a
	jr nz,L_9010		;900c
	scf			;900e
	ret			;900f
L_9010:
	ld a,(0ca4bh)		;9010   ; es esta sala?
	cp (hl)			;9013
	jr z,L_901A		;9014
	inc hl			;9016   ; la pareja siguiente
	inc hl			;9017
	jr busca_sala_en_pares		;9018
L_901A:
	inc hl			;901a   ; A = el dato
	ld a,(hl)			;901b
	and a			;901c
	ret			;901d
L_901E:
	ld hl,0bb03h		;901e   ; la lista de la zona 0x10: p06:BB03
	call lista_zona_10		;9021   ; lista_zona_10: las fichas de HL hasta 0xFF de esta sala (0xCA43 y 0xCA4B) a 0xD7C0
	call pinta_cosas		;9024   ; pinta_cosas: las 4 cosas de 0xD7C0 que no tengan el bit 7 del numero
L_9027:
	jp 040f0h		;9027   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
cosas_del_sitio:		; las cosas del sitio de 0xCA65 (p06:B6FD)
	call 041a0h		;902a   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call borra_d7c0		;902d   ; borra_d7c0: las 4 fichas de 0xD7C0 a cero
	ld a,(0ca65h)		;9030   ; lee el sitio de 0xCBE0 en el que esta Snake (0 = ninguno)
	or a			;9033
	ret z			;9034
	ld hl,0b6fdh		;9035
	call 043f6h		;9038   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	call lista_a_d7c0		;903b   ; lista_a_d7c0: las fichas de 3 bytes de HL hasta 0xFF a 0xD7C0, con su numero
	call pinta_cosas		;903e   ; pinta_cosas: las 4 cosas de 0xD7C0 que no tengan el bit 7 del numero
	jr L_9027		;9041
cosas_de_la_especial:		; las cosas de la sala especial (p06:B719)
	call 041a0h		;9043   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call borra_d7c0		;9046   ; borra_d7c0: las 4 fichas de 0xD7C0 a cero
	ld a,(0ca76h)		;9049   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	dec a			;904c
	ld hl,0b719h		;904d
	call 043f6h		;9050   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	call lista_de_especial		;9053   ; lista_de_especial: las fichas de HL hasta 0xFF, las de la fila y columna de esta sala, a 0xD7C0
	call dejada_en_especial		;9056   ; y las que se dejaron alli (0xD77A)
	call pinta_cosas		;9059   ; pinta_cosas: las 4 cosas de 0xD7C0 que no tengan el bit 7 del numero
	jr L_9027		;905c
deja_cosa:		; deja la cosa C en (D, E), en puntos pares
	ld a,d			;905e   ; la Y...
	and 0feh		;905f   ; ...par
	ld d,a			;9061
	ld a,e			;9062   ; la X...
	and 0feh		;9063   ; ...par
	ld e,a			;9065
	ld a,c			;9066   ; las 0x23-0x29...
	cp 023h		;9067
	jr c,L_906F		;9069
	cp 02ah		;906b
	jr c,L_9076		;906d
L_906F:
	push de			;906f   ; ...las demas, p07:BB10 antes
	push bc			;9070
	call a_p07_bb10		;9071   ; a_p07_bb10: p07:BB10 con el banco 7 en 0xA000
	pop bc			;9074
	pop de			;9075
L_9076:
	push bc			;9076
	push de			;9077
	call apunta_cosa		;9078   ; la apunta en 0xD770 si es de las que se guardan
	pop de			;907b
	pop bc			;907c
	call sitio_en_d7c0		;907d   ; un sitio libre en 0xD7C0...
	ret nc			;9080
	jp pinta_cosa		;9081   ; ...y la pinta (p02:9248)
sitio_en_d7c0:		; mete la cosa C en (D, E) en la primera ficha libre de 0xD7C0 (acarreo si cabe)
	ld hl,0d7c0h		;9084   ; apunta a las 4 cosas de la sala: fichas de 4 bytes [tipo][Y][X][numero]
	ld b,004h		;9087
L_9089:
	ld a,(hl)			;9089   ; libre?
	or a			;908a
	jr z,L_9097		;908b
	push de			;908d
	ld de,00004h		;908e   ; la siguiente, 4 bytes mas alla
	add hl,de			;9091
	pop de			;9092
	djnz L_9089		;9093
	and a			;9095   ; no cabe: sin acarreo
	ret			;9096
L_9097:
	push hl			;9097
	push bc			;9098
	ld (hl),c			;9099   ; [tipo][E][D]...
	inc l			;909a
	ld (hl),e			;909b
	inc l			;909c
	ld (hl),d			;909d
	inc l			;909e
	ld a,c			;909f   ; ...y el dibujo: 0x60 la 0x23, 0x61 la 0x24, 0x62 la 0x29, 0x3F las demas
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
	scf			;90b7   ; cabe: con acarreo
	ret			;90b8
apunta_cosa:		; en la especial 0x29, a 0xD77A con la fila y la columna (p02:90E4)
	ld a,(0ca76h)		;90b9   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 029h		;90bc
	jr z,L_90E4		;90be
	ld a,c			;90c0
	ld hl,0d770h		;90c1   ; la 0x23: a 0xD770, con la zona y la sala en 0xD780
	ld bc,0d780h		;90c4   ; apunta a la zona y la sala de la cosa 0x23 de 0xD770 (y en 0xD782 las de la 0x29)
	cp 023h		;90c7
	jr z,L_90D4		;90c9
	ld hl,0d775h		;90cb   ; la 0x29: a 0xD775, con la zona y la sala en 0xD782
	ld bc,0d782h		;90ce
	cp 029h		;90d1
	ret nz			;90d3
L_90D4:
	add a,080h		;90d4   ; el tipo con el bit 7
	ld (hl),a			;90d6
	call L_90F9		;90d7   ; la Y y la X
	ld a,(0ca4ah)		;90da   ; la zona...
	ld (bc),a			;90dd
	inc c			;90de
	ld a,(0ca4bh)		;90df   ; ...y la sala
	ld (bc),a			;90e2
	ret			;90e3
L_90E4:
	ld hl,0d77ah		;90e4
	ld a,(0ca50h)		;90e7   ; la fila en el nibble alto...
	rlca			;90ea
	rlca			;90eb
	rlca			;90ec
	rlca			;90ed
	and 0f0h		;90ee
	ld b,a			;90f0
	ld a,(0ca51h)		;90f1   ; ...la columna en el bajo
	and 00fh		;90f4
	or b			;90f6
	ld (hl),a			;90f7
	inc l			;90f8
L_90F9:
	inc l			;90f9
	inc l			;90fa
	ld (hl),e			;90fb   ; la Y...
	inc l			;90fc
	ld (hl),d			;90fd   ; ...y la X
	ret			;90fe
dejada_en_especial:		; la cosa dejada en la especial (0xD77A) a 0xD7C0, si es de esta sala
	ld hl,0d77ah		;90ff
	ld a,(hl)			;9102
	cp 0ffh		;9103
	ret z			;9105
	ld de,0d7c0h		;9106   ; apunta a las 4 cosas de la sala: fichas de 4 bytes [tipo][Y][X][numero]
	jp ficha_de_especial		;9109   ; ficha_de_especial: de esta sala?
dejadas_en_la_sala:		; las cosas dejadas en esta sala (0xD770) a la primera ficha libre de 0xD7C0
	call busca_dejada		;910c   ; busca_dejada: la ficha de 0xD770 dejada en esta zona y sala (con acarreo; HL = la ficha)
	ret nc			;910f
	ld a,(hl)			;9110   ; 0xFF: ninguna
	cp 0ffh		;9111
	ret z			;9113
	ld de,0d7c0h		;9114   ; apunta a las 4 cosas de la sala: fichas de 4 bytes [tipo][Y][X][numero]
	ld b,000h		;9117
L_9119:
	ld a,(de)			;9119   ; la primera libre
	or a			;911a
	jr z,ficha_a_d7c0		;911b
	inc b			;911d   ; la siguiente...
	ld a,b			;911e
	cp 004h		;911f   ; ...de las 4
	ret nc			;9121
	inc de			;9122
	inc de			;9123
	inc de			;9124
	inc de			;9125
	jr L_9119		;9126
busca_dejada:		; la ficha de 0xD770 dejada en esta zona y sala (con acarreo; HL = la ficha)
	ld de,0d770h		;9128   ; apunta a las cosas dejadas: 0x23 en 0xD770, 0x29 en 0xD775, la de la especial 0x29 en 0xD77A
	ld hl,0d780h		;912b   ; apunta a la zona y la sala de la cosa 0x23 de 0xD770 (y en 0xD782 las de la 0x29)
	ld b,002h		;912e   ; dos fichas
L_9130:
	push hl			;9130
	ld a,(0ca4ah)		;9131   ; la zona...
	cp (hl)			;9134
	jr nz,L_9142		;9135
	inc l			;9137
	ld a,(0ca4bh)		;9138   ; ...y la sala
	cp (hl)			;913b
	jr nz,L_9142		;913c
	pop hl			;913e
	ex de,hl			;913f
	scf			;9140
	ret			;9141
L_9142:
	pop hl			;9142   ; la terna siguiente: 2 bytes en 0xD780...
	inc l			;9143   ; la siguiente: 2 bytes en 0xD780 y 5 en 0xD770
	inc l			;9144
	inc e			;9145   ; ...y 5 en 0xD770
	inc e			;9146
	inc e			;9147
	inc e			;9148
	inc e			;9149
	djnz L_9130		;914a
	and a			;914c   ; ninguna: sin acarreo
	ret			;914d
borra_d7c0:		; las 4 fichas de 0xD7C0 a cero
	ld hl,0d7c0h		;914e   ; apunta a las 4 cosas de la sala: fichas de 4 bytes [tipo][Y][X][numero]
	ld bc,0000fh		;9151
	jp 04236h		;9154   ; borra_bloque: pone a cero BC + 1 bytes desde HL
lista_a_d7c0:		; las fichas de 3 bytes de HL hasta 0xFF a 0xD7C0, con su numero
	ld de,0d7c0h		;9157   ; apunta a las 4 cosas de la sala: fichas de 4 bytes [tipo][Y][X][numero]
	ld b,000h		;915a
L_915C:
	ld a,(hl)			;915c
	cp 0ffh		;915d
	ret z			;915f
	push bc			;9160
	call ficha_a_d7c0		;9161   ; ficha_a_d7c0: si ya la tienen (p02:91FB), no
	pop bc			;9164
	inc b			;9165
	jr L_915C		;9166
ficha_a_d7c0:		; si ya la tienen (p02:91FB), no
	call ya_la_tienen		;9168   ; ya_la_tienen: la ficha de HL: si su bit 7 o el 6 dicen que ya se recogio (p03:B0FE, p03:B103), con acarreo
	jr c,L_9179		;916b
L_916D:
	ld a,c			;916d   ; [tipo]...
	ld (de),a			;916e
	ld a,b			;916f
	inc hl			;9170
	inc de			;9171
	ldi		;9172   ; ...[Y][X]...
	ldi		;9174
	ld (de),a			;9176   ; ...[numero]
	inc de			;9177
	ret			;9178
L_9179:
	inc hl			;9179   ; la ficha siguiente
	inc hl			;917a
	inc hl			;917b
	ret			;917c
lista_de_especial:		; las fichas de HL hasta 0xFF, las de la fila y columna de esta sala, a 0xD7C0
	ld de,0d7c0h		;917d   ; apunta a las 4 cosas de la sala: fichas de 4 bytes [tipo][Y][X][numero]
	ld b,000h		;9180
L_9182:
	ld a,(hl)			;9182
	cp 0ffh		;9183
	ret z			;9185
	push bc			;9186
	call ficha_de_especial		;9187   ; ficha_de_especial: de esta sala?
	pop bc			;918a
	inc b			;918b
	jr L_9182		;918c
ficha_de_especial:		; de esta sala?
	call es_de_esta_fila		;918e   ; es_de_esta_fila: el nibble alto es la fila, el bajo la columna: sin acarreo si es esta sala
	jr c,L_9179		;9191
	call ya_la_tienen		;9193   ; ya_la_tienen: la ficha de HL: si su bit 7 o el 6 dicen que ya se recogio (p03:B0FE, p03:B103), con acarreo
	jr c,L_9179		;9196
	jr L_916D		;9198
es_de_esta_fila:		; el nibble alto es la fila, el bajo la columna: sin acarreo si es esta sala
	ld a,(hl)			;919a
	rra			;919b
	rra			;919c
	rra			;919d
	rra			;919e
	and 00fh		;919f
	ld b,a			;91a1
	ld a,(0ca50h)		;91a2   ; lee la fila de la sala en la zona (uno mas al salir por arriba)
	cp b			;91a5
	jr nz,L_91B5		;91a6
	ld a,(hl)			;91a8
	and 00fh		;91a9
	ld b,a			;91ab
	ld a,(0ca51h)		;91ac   ; lee la columna de la sala en la zona (uno mas al salir por la derecha)
	cp b			;91af
	jr nz,L_91B5		;91b0
	inc hl			;91b2
	and a			;91b3
	ret			;91b4
L_91B5:
	inc hl			;91b5
	bit 7,(hl)		;91b6   ; con el bit 7, un byte mas
	jr z,L_91BB		;91b8
	inc hl			;91ba
L_91BB:
	scf			;91bb
	ret			;91bc
lista_zona_10:		; las fichas de HL hasta 0xFF de esta sala (0xCA43 y 0xCA4B) a 0xD7C0
	ld de,0d7c0h		;91bd   ; apunta a las 4 cosas de la sala: fichas de 4 bytes [tipo][Y][X][numero]
	ld b,000h		;91c0
L_91C2:
	ld a,(hl)			;91c2   ; 0xFF: se acabo
	cp 0ffh		;91c3
	ret z			;91c5
	push bc			;91c6
	call L_91CE		;91c7   ; la ficha
	pop bc			;91ca
	inc b			;91cb   ; la siguiente, con su numero
	jr L_91C2		;91cc
L_91CE:
	call es_de_esta_sala_10		;91ce   ; es_de_esta_sala_10: el nibble alto contra 0xCA43, el bajo contra la sala
	ret c			;91d1
	call ya_la_tienen		;91d2   ; ya_la_tienen: la ficha de HL: si su bit 7 o el 6 dicen que ya se recogio (p03:B0FE, p03:B103), con acarreo
	jr c,L_9179		;91d5
	jr L_916D		;91d7
es_de_esta_sala_10:		; el nibble alto contra 0xCA43, el bajo contra la sala
	ld a,(hl)			;91d9
	rra			;91da   ; el nibble alto...
	rra			;91db
	rra			;91dc
	rra			;91dd
	and 00fh		;91de
	ld b,a			;91e0
	ld a,(0ca43h)		;91e1
	cp b			;91e4   ; ...contra 0xCA43
	jr nz,L_91F4		;91e5
	ld a,(hl)			;91e7   ; el nibble bajo...
	and 00fh		;91e8
	ld b,a			;91ea
	ld a,(0ca4bh)		;91eb   ; lee la sala de la zona
	cp b			;91ee   ; ...contra la sala
	jr nz,L_91F4		;91ef
	inc hl			;91f1
	and a			;91f2   ; de esta sala: sin acarreo
	ret			;91f3
L_91F4:
	inc hl			;91f4   ; de otra: la ficha siguiente (5 bytes)
	inc hl			;91f5
	inc hl			;91f6
	inc hl			;91f7
	inc hl			;91f8
	scf			;91f9   ; con acarreo
	ret			;91fa
ya_la_tienen:		; la ficha de HL: si su bit 7 o el 6 dicen que ya se recogio (p03:B0FE, p03:B103), con acarreo
	ld a,(hl)			;91fb
	ld b,000h		;91fc
	bit 6,a		;91fe   ; el bit 6: B = 0x80
	jr z,L_9204		;9200
	ld b,080h		;9202
L_9204:
	ld a,(hl)			;9204
	and 03fh		;9205   ; C = el tipo (bits 0-5)
	ld c,a			;9207
	ld a,(hl)			;9208
	rla			;9209   ; el bit 7 mira p03:B0FE; si no, p03:B103
	jr nc,L_922B		;920a
	push bc			;920c
	push de			;920d
	call L_921A		;920e
	pop de			;9211
	pop bc			;9212
	ret c			;9213
	ld a,(hl)			;9214   ; B = el byte con el bit 6
	or 040h		;9215
	or b			;9217
	ld b,a			;9218
	ret			;9219
L_921A:
	inc hl			;921a
	ld a,(hl)			;921b   ; el byte siguiente: el numero que se mira
	push hl			;921c
	call 040f0h		;921d   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b0feh		;9220   ; mira_bandera_d7f0: NZ si la bandera A de 0xD7F0 esta puesta
	call 041a0h		;9223   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	pop hl			;9226
	scf			;9227   ; NZ: si
	ret nz			;9228
	and a			;9229   ; Z: no
	ret			;922a
L_922B:
	push bc			;922b
	push de			;922c
	call L_9237		;922d   ; esta en p03:B103?
	pop de			;9230
	pop bc			;9231
	ret c			;9232   ; si: con acarreo
	ld a,(hl)			;9233   ; B con el byte
	or b			;9234
	ld b,a			;9235
	ret			;9236
L_9237:
	inc hl			;9237
	ld a,(hl)			;9238   ; el byte siguiente
	push hl			;9239
	call 040f0h		;923a   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b103h		;923d   ; mira_bandera_d8d8: NZ si la bandera A de 0xD8D8 esta puesta
	call 041a0h		;9240   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	pop hl			;9243
	scf			;9244
	ret nz			;9245
	and a			;9246
	ret			;9247
pinta_cosa:		; el fondo de la cosa de HL (p02:9270) y la cosa
	call fondo_de_cosa		;9248   ; fondo_de_cosa: HL = el sitio de la cosa
	jr $+103		;924b
pinta_cosas:		; las 4 cosas de 0xD7C0 que no tengan el bit 7 del numero
	ld hl,0d7c0h		;924d   ; apunta a las 4 cosas de la sala: fichas de 4 bytes [tipo][Y][X][numero]
	ld b,004h		;9250
L_9252:
	ld a,(hl)			;9252   ; libre?
	or a			;9253
	jr z,L_9269		;9254
	push hl			;9256
	inc hl			;9257   ; el byte 3...
	inc hl			;9258
	inc hl			;9259
	ld a,(hl)			;925a
	pop hl			;925b
	rla			;925c   ; ...con el bit 7 no se pinta
	jr c,L_9269		;925d
	push hl			;925f
	push bc			;9260
	call fondo_de_cosa		;9261   ; el fondo...
	call dibuja_cosa		;9264   ; ...y la cosa
	pop bc			;9267
	pop hl			;9268
L_9269:
	ld de,00004h		;9269   ; la siguiente
	add hl,de			;926c
	djnz L_9252		;926d
	ret			;926f
fondo_de_cosa:		; HL = el sitio de la cosa
	push hl			;9270
	call sitio_de_cosa		;9271   ; sitio_de_cosa: la Y y la X de la ficha...
	ld bc,02010h		;9274   ; 32 x 16 puntos de la otra pagina a esta
	call 0474dh		;9277   ; copia_rectangulo_a_esta: p00:4767 de la otra pagina (0xCA42 ^ 1) a la de 0xCA42
	pop hl			;927a
	ret			;927b
sitio_de_cosa:		; la Y y la X de la ficha...
	inc hl			;927c
	ld a,(hl)			;927d
	inc hl			;927e
	ld h,(hl)			;927f
	ld l,a			;9280
	push hl			;9281
	call tabla_de_b		;9282   ; ...DE = HL
	pop hl			;9285
	ret			;9286
tabla_de_b:		; HL = DE = la palabra B - 1 de p02:9292
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


borra_cosa:		; sin acarreo, el sitio de la cosa a la otra pagina; con acarreo, a 0 en esta
	push af			;929a
	call sitio_de_cosa		;929b   ; sitio_de_cosa: la Y y la X de la ficha...
	ex de,hl			;929e
	ld bc,02010h		;929f   ; 32 x 16
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
dibuja_cosa:		; el tipo...
	ld a,(hl)			;92b2
	inc hl			;92b3
	ld e,(hl)			;92b4   ; ...E = la Y, D = la X
	inc hl			;92b5
	ld d,(hl)			;92b6
	ld bc,01010h		;92b7   ; 16 x 16...
	and 03fh		;92ba
	cp 003h		;92bc   ; ...los tipos 1 y 2, 32 x 16
	jr nc,L_92C2		;92be
	ld b,020h		;92c0
L_92C2:
	dec a			;92c2
	call palabra_a6af		;92c3   ; HL = su dibujo (p02:87F4)
	ld a,(0ca42h)		;92c6   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	rlca			;92c9
	rlca			;92ca
	rlca			;92cb
	rlca			;92cc
	or 0c8h		;92cd   ; de la 3, TIMP
	jp 047edh		;92cf   ; copia_rectangulo_logica: orden LMMM del VDP con la operacion logica de A
a_p03_beb7:		; p03:BEB7 con el banco 3 en 0xA000
	call 040f0h		;92d2   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0beb7h		;92d5   ; gasta_una_d638: la cosa A de 0xD638 una menos; a cero, no la tiene
L_92D8:
	jp 041cah		;92d8   ; bancos_1_2_10: pone el 1 en 0x6000, el 2 en 0x8000, el 10 en 0xA000 (con su copia en 0xC381-0xC383)
a_p03_beb2:		; p03:BEB2 con el banco 3 en 0xA000
	call 040f0h		;92db   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0beb2h		;92de   ; tiene_cuenta_d638: acarreo si la cuenta de la cosa A de 0xD638 es 0
	jr L_92D8		;92e1
a_p03_be60_2:		; p03:BE60 con el banco 3 en 0xA000
	call 040f0h		;92e3   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0be60h		;92e6   ; gasta_una: la cosa A una menos; con 1 y 2, nada mas; si se acaba, fuera de las manos y el mensaje de p10:B3E5 con 0xD874
	jr L_92D8		;92e9
a_p03_be42:		; p03:BE42 con el banco 3 en 0xA000
	call 040f0h		;92eb   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0be42h		;92ee   ; tiene_balas: acarreo si la cuenta de la cosa A de 0xD600 es 0
	jr L_92D8		;92f1
repinta_la_sala_b_1_2_10:		; repinta_la_sala y deja los bancos 1, 2 y 10
	call 05dfdh		;92f3   ; repinta_la_sala: repinta la sala guardando los juegos de piezas de 0xCA4C-0xCA4D
	jr L_92D8		;92f6
a_p10_aed6:		; p10:AED6 con el banco 10 en 0xA000
	call 041cah		;92f8   ; bancos_1_2_10: pone el 1 en 0x6000, el 2 en 0x8000, el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0aed6h		;92fb   ; p10:AED6
L_92FE:
	jp 040f0h		;92fe   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
a_p10_af30:		; p10:AF30 con el banco 10 en 0xA000
	call 041cah		;9301   ; bancos_1_2_10: pone el 1 en 0x6000, el 2 en 0x8000, el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0af30h		;9304   ; p10:AF30
	jr L_92FE		;9307
a_p10_aff3:		; p10:AFF3 con el banco 10 en 0xA000
	call 041cah		;9309   ; bancos_1_2_10: pone el 1 en 0x6000, el 2 en 0x8000, el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0aff3h		;930c   ; p10:AFF3
	jr L_92FE		;930f
a_p10_b172:		; p10:B172 con el banco 10 en 0xA000
	call 041cah		;9311   ; bancos_1_2_10: pone el 1 en 0x6000, el 2 en 0x8000, el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b172h		;9314   ; p10:B172
	jr L_92FE		;9317
a_p10_b3e5:		; p10:B3E5 con el banco 10 en 0xA000
	call 041cah		;9319   ; bancos_1_2_10: pone el 1 en 0x6000, el 2 en 0x8000, el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b3e5h		;931c
	jr L_92FE		;931f
a_p10_b8c4:		; p10:B8C4 con el banco 10 en 0xA000
	call 041cah		;9321   ; bancos_1_2_10: pone el 1 en 0x6000, el 2 en 0x8000, el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b8c4h		;9324   ; p10:B8C4
	jr L_92FE		;9327
a_p10_b957:		; p10:B957 con el banco 10 en 0xA000
	call 041cah		;9329   ; bancos_1_2_10: pone el 1 en 0x6000, el 2 en 0x8000, el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b957h		;932c   ; p10:B957
	jr L_92FE		;932f
a_p10_b960:		; p10:B960 con el banco 10 en 0xA000
	call 041cah		;9331   ; bancos_1_2_10: pone el 1 en 0x6000, el 2 en 0x8000, el 10 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b960h		;9334   ; p10:B960
	jr L_92FE		;9337
suma_a_y:		; la Y de Snake (8.8) + DE
	ld hl,(0cb02h)		;9339   ; lee la Y de Snake: la parte fraccionaria (0xCB02-0xCB03 en 8.8) y el byte siguiente (16 bits)
	add hl,de			;933c
	ld (0cb02h),hl		;933d   ; guarda la Y de Snake: la parte fraccionaria (0xCB02-0xCB03 en 8.8) y el byte siguiente (16 bits)
	ret			;9340
suma_a_x:		; la X de Snake (8.8) + DE
	ld hl,(0cb04h)		;9341   ; lee la X de Snake: la parte fraccionaria (0xCB04-0xCB05 en 8.8) y el byte siguiente (16 bits)
	add hl,de			;9344
	ld (0cb04h),hl		;9345   ; guarda la X de Snake: la parte fraccionaria (0xCB04-0xCB05 en 8.8) y el byte siguiente (16 bits)
	ret			;9348
sin_velocidad:		; las velocidades en Y y en X a cero
	ld hl,00000h		;9349
	ld (0cb06h),hl		;934c   ; guarda la velocidad de Snake en Y (16 bits, 8.8)
	ld (0cb08h),hl		;934f   ; guarda la velocidad de Snake en X (16 bits, 8.8)
	ret			;9352
sin_fraccion:		; las fracciones de la Y y de la X a cero
	xor a			;9353
	ld (0cb02h),a		;9354   ; guarda la Y de Snake: la parte fraccionaria (0xCB02-0xCB03 en 8.8)
	ld (0cb04h),a		;9357   ; guarda la X de Snake: la parte fraccionaria (0xCB04-0xCB05 en 8.8)
	ret			;935a
y_x_de_snake:		; L = la Y, H = la X de Snake
	ld a,(0cb03h)		;935b   ; lee la Y de Snake
	ld l,a			;935e
	ld a,(0cb05h)		;935f   ; lee la X de Snake
	ld h,a			;9362
	ret			;9363
cb28_a_0020:		; 0xCB28 = 0, 0xCB29 = 0x20
	ld bc,00020h		;9364
pon_cb28:		; 0xCB28 = B, 0xCB29 = C
	ld hl,0cb28h		;9367
	ld (hl),b			;936a
	inc hl			;936b
	ld (hl),c			;936c
	ret			;936d
date_la_vuelta:		; si Snake esta dandose la vuelta, sigue (p02:93E5); si no, mira si se pide
	ld a,(0cb16h)		;936e   ; lee 1 mientras Snake se da la vuelta
	or a			;9371
	jp nz,L_93E5		;9372
L_9375:
	call lee_direccion		;9375   ; el mando a 0xCB0D (p06:A634)
	ld b,00fh		;9378   ; vale cualquier direccion (bits 0-3)...
	ld a,(0ca9bh)		;937a
	or a			;937d
	jr nz,L_939B		;937e
	ld a,(0cb37h)		;9380
	or a			;9383
	jr nz,L_939B		;9384
	ld a,(0cb3fh)		;9386   ; lee en la zona 6, lo que hay bajo Snake: 1 con los caracteres 0x90-0xB3, 2 con 0xB8-0xDB (3 con 0xCAAA)
	or a			;9389
	jr nz,L_939B		;938a
	ld a,(0cb28h)		;938c
	or a			;938f
	jr nz,L_9399		;9390
	ld a,(0cb00h)		;9392   ; lee el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	cp 00bh		;9395
	jr nz,L_939B		;9397
L_9399:
	ld b,003h		;9399   ; ...o solo arriba y abajo
L_939B:
	ld a,(0ca07h)		;939b   ; ...recien pulsada
	and b			;939e
	ret z			;939f
	ld hl,0cb0dh		;93a0   ; la pedida contra la de ahora
	ld a,(0cb0eh)		;93a3   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ld b,(hl)			;93a6
	cp b			;93a7   ; la misma: nada
	ret z			;93a8
	dec a			;93a9   ; 1-2 y 3-4 son el mismo eje...
	dec b			;93aa
	and 002h		;93ab
	ld c,a			;93ad
	ld a,b			;93ae
	and 002h		;93af
	xor c			;93b1   ; ...si no es el contrario, nada
	ret nz			;93b2
	ld a,(0cb31h)		;93b3   ; con 0xCB31, nada
	or a			;93b6
	ret nz			;93b7
	inc a			;93b8   ; se da la vuelta
	ld (0cb16h),a		;93b9   ; guarda 1 mientras Snake se da la vuelta
	ld hl,0cb01h		;93bc   ; el dibujo de ahora...
	ld a,(hl)			;93bf
	ld (0cb12h),a		;93c0   ; ...se guarda
	ld b,003h		;93c3   ; el de la vuelta: + 3 con el estado 9...
	ld a,(0cb00h)		;93c5   ; lee el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	cp 009h		;93c8
	jr z,L_93D4		;93ca
	ld b,001h		;93cc   ; ...+ 1 con el 0x0A...
	cp 00ah		;93ce
	jr z,L_93D4		;93d0
	ld b,005h		;93d2   ; ...+ 5 con los demas
L_93D4:
	add a,b			;93d4
	ld (hl),a			;93d5
	ld a,002h		;93d6   ; dos cuadros
	ld (0cb18h),a		;93d8   ; guarda la espera de la vuelta
	ld hl,0cb0eh		;93db   ; 0xCB17 = 5 - la direccion
	ld a,005h		;93de
	sub (hl)			;93e0
	ld (0cb17h),a		;93e1
	ret			;93e4
L_93E5:
	ld a,(0cb31h)		;93e5   ; con 0xCB31 se queda asi
	or a			;93e8
	ret nz			;93e9
	ld hl,0cb18h		;93ea   ; un cuadro menos
	dec (hl)			;93ed
	ret nz			;93ee
	dec hl			;93ef   ; a los dos, 0xCB16 = 0...
	dec hl			;93f0
	ld (hl),a			;93f1
	ld a,(0cb12h)		;93f2   ; ...y el dibujo de antes
	ld (0cb01h),a		;93f5   ; guarda el dibujo de Snake (al darse la vuelta se le suma 1, 3 o 5 segun 0xCB00)
	ret			;93f8
lee_direccion:		; p06:A634: la direccion del mando a 0xCB0D
	call 041a0h		;93f9   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a634h		;93fc   ; direccion_del_mando: la direccion pedida con el mando (p06:A639) y la de marcha (p06:A6B8)
	jp 040f0h		;93ff   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
mueve_a_snake:		; dandose la vuelta no se mueve
	ld a,(0cb16h)		;9402   ; lee 1 mientras Snake se da la vuelta
	or a			;9405
	ret nz			;9406
	ld a,(0cb0fh)		;9407   ; si ya ha chocado, la espera de quieto
	or a			;940a
	jr nz,L_9439		;940b
	call choca_con_la_sala		;940d   ; el choque contra la sala (p02:971B)
	ld a,(0cb0fh)		;9410   ; lee 1 si Snake ha chocado en este cuadro
	or a			;9413
	jr nz,L_9439		;9414
	call bordes_de_la_sala		;9416   ; los bordes de la sala (p02:9471)
	jr c,L_9439		;9419
	call a_p11_ba03		;941b   ; p02:8BB0: con acarreo, choca
	jr nc,L_9427		;941e
	ld a,001h		;9420
	ld (0cb0fh),a		;9422   ; guarda 1 si Snake ha chocado en este cuadro
	jr L_9439		;9425
L_9427:
	call sale_de_la_sala		;9427   ; la salida de la sala (p02:9590)
	ld a,(0cb0fh)		;942a   ; lee 1 si Snake ha chocado en este cuadro
	or a			;942d
	jr nz,L_9439		;942e
L_9430:
	call velocidad_de_snake		;9430   ; la marcha y la velocidad...
	call mueve_por_la_velocidad		;9433   ; ...se mueve...
	jp anda		;9436   ; ...y anda
L_9439:
	ld hl,0cb1ah		;9439   ; la espera de quieto...
	ld a,(hl)			;943c
	or a			;943d
	jr z,L_9442		;943e
	dec (hl)			;9440   ; ...un cuadro menos
	ret			;9441
L_9442:
	ld a,001h		;9442   ; a los 4 cuadros, el dibujo 1: quieto
	ld (0cb14h),a		;9444   ; guarda el dibujo del paso de andar (0, 1, 2, 1: p02:9888)
	ret			;9447
mueve_a_snake_b:		; como p02:9402, primero la salida y despues el choque, y con p02:9892 en vez de p02:9841
	ld a,(0cb0fh)		;9448   ; lee 1 si Snake ha chocado en este cuadro
	or a			;944b
	jr nz,L_9439		;944c
	call sale_de_la_sala		;944e   ; sale_de_la_sala: con 0xCB3C, 0xD4F1 o 0xCA65 no sale
	ld a,(0cb0fh)		;9451   ; lee 1 si Snake ha chocado en este cuadro
	or a			;9454
	jr nz,L_9439		;9455
	call bordes_de_la_sala		;9457   ; bordes_de_la_sala: con el bit 4 de 0xD7D0, hacia abajo no pasa de Y = 0xB4
	jr c,L_9439		;945a
	call a_p11_ba03		;945c   ; a_p11_ba03: p11:BA03 con el banco 11 en 0xA000
	jr nc,L_9468		;945f
	ld a,001h		;9461
	ld (0cb0fh),a		;9463   ; guarda 1 si Snake ha chocado en este cuadro
	jr L_9439		;9466
L_9468:
	call velocidad_de_snake		;9468   ; velocidad_de_snake: la marcha (p02:94D6)...
	call mueve_por_la_velocidad		;946b   ; mueve_por_la_velocidad: con 0xCB3F >= 2 y 0xCA8F: la direccion contraria a 0xCA8F no se mueve
	jp anda_b		;946e   ; anda_b: una direccion recien pulsada: cambia ya
bordes_de_la_sala:		; con el bit 4 de 0xD7D0, hacia abajo no pasa de Y = 0xB4
	ld a,(0d7d0h)		;9471   ; lee las banderas de la partida: la n en el bit 7 - n % 8 del byte n / 8 (p03:B0DC, p03:B0F6)
	bit 4,a		;9474
	jr z,L_948C		;9476
	ld a,(0cb0eh)		;9478   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	cp 002h		;947b
	jr z,L_9481		;947d
	or a			;947f
	ret			;9480
L_9481:
	ld a,(0cb03h)		;9481   ; la Y...
	cp 0b4h		;9484   ; ...llega a 0xB4: acarreo y se queda alli
	ccf			;9486
	ret nc			;9487
	ld a,0b4h		;9488
	jr L_94A1		;948a
L_948C:
	ld a,(0cb57h)		;948c   ; con 0xCB57, hacia arriba no pasa de Y = 0x50
	or a			;948f
	ret z			;9490
	ld a,(0cb0eh)		;9491   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	dec a			;9494
	jr z,L_9499		;9495
	or a			;9497
	ret			;9498
L_9499:
	ld a,(0cb03h)		;9499   ; la Y...
	cp 050h		;949c   ; ...menos de 0x50: se queda en 0x50
	ret nc			;949e
	ld a,050h		;949f
L_94A1:
	ld (0cb03h),a		;94a1   ; la Y del borde
	xor a			;94a4   ; sin fraccion
	ld (0cb02h),a		;94a5   ; guarda la Y de Snake: la parte fraccionaria (0xCB02-0xCB03 en 8.8)
	inc a			;94a8   ; ha chocado
	ld (0cb0fh),a		;94a9   ; guarda 1 si Snake ha chocado en este cuadro
	ret			;94ac
velocidad_de_snake:		; la marcha (p02:94D6)...
	call marcha_de_snake		;94ad   ; marcha_de_snake: con 0xCB3F: p02:9508
	ld a,(0cb0ah)		;94b0   ; ...su velocidad en p02:9520
	ld de,09520h		;94b3
	call 04403h		;94b6   ; palabra_de_tabla_de: DE = la palabra A de la tabla de DE
	ld a,(0cb0eh)		;94b9   ; sin direccion, nada
	or a			;94bc
	ret z			;94bd
	rra			;94be   ; 1 y 3 (arriba, izquierda) van hacia atras
	call c,04442h		;94bf   ; de_negativo: DE = -DE
	call sin_velocidad		;94c2   ; las dos velocidades a cero
	ld a,(0cb0eh)		;94c5   ; arriba y abajo: la de Y...
	ld hl,0cb06h		;94c8   ; apunta a la velocidad de Snake en Y (16 bits, 8.8)
	cp 003h		;94cb
	jr c,L_94D2		;94cd
	ld hl,0cb08h		;94cf   ; ...izquierda y derecha: la de X
L_94D2:
	ld (hl),e			;94d2
	inc hl			;94d3
	ld (hl),d			;94d4
	ret			;94d5
marcha_de_snake:		; con 0xCB3F: p02:9508
	ld a,(0cb3fh)		;94d6   ; lee en la zona 6, lo que hay bajo Snake: 1 con los caracteres 0x90-0xB3, 2 con 0xB8-0xDB (3 con 0xCAAA)
	or a			;94d9
	jr nz,L_9508		;94da
	ld a,(0cb37h)		;94dc   ; sin 0xCB37: p02:9500
	or a			;94df
	jr z,L_9500		;94e0
	ld b,002h		;94e2   ; con 0xCB37 la marcha sale de 0xCB29: 2 desde 0x12...
	ld a,(0cb29h)		;94e4
	cp 012h		;94e7
	jr nc,L_94FB		;94e9
	inc b			;94eb   ; ...3 desde 0x0C...
	cp 00ch		;94ec
	jr nc,L_94FB		;94ee
	inc b			;94f0   ; ...4 desde 0x0A...
	cp 00ah		;94f1
	jr nc,L_94FB		;94f3
	inc b			;94f5   ; ...5 desde 8...
	cp 008h		;94f6
	jr nc,L_94FB		;94f8
	inc b			;94fa   ; ...6 por debajo
L_94FB:
	ld hl,0cb0ah		;94fb   ; la marcha
	ld (hl),b			;94fe
	ret			;94ff
L_9500:
	ld a,(0cb0ah)		;9500   ; la marcha 0 o 1 se queda
	cp 002h		;9503
	ret c			;9505
	jr L_950E		;9506
L_9508:
	ld a,(0cb3fh)		;9508   ; 0xCB3F = 1: la marcha 2, o 1 con 0xCA8F
	dec a			;950b
	jr z,L_9513		;950c
L_950E:
	xor a			;950e   ; la marcha 0
	ld (0cb0ah),a		;950f   ; guarda la marcha de Snake: el indice de las velocidades de p02:9520
	ret			;9512
L_9513:
	ld a,(0ca8fh)		;9513   ; lee hacia donde empuja la zona (1 arriba, 2 abajo, 3 izquierda, 4 derecha; 0 nada)
	or a			;9516
	ld a,002h		;9517
	jr z,L_951C		;9519
	dec a			;951b
L_951C:
	ld (0cb0ah),a		;951c   ; guarda la marcha de Snake: el indice de las velocidades de p02:9520
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


mueve_por_la_velocidad:		; con 0xCB3F >= 2 y 0xCA8F: la direccion contraria a 0xCA8F no se mueve
	ld a,(0cb3fh)		;9530   ; lee en la zona 6, lo que hay bajo Snake: 1 con los caracteres 0x90-0xB3, 2 con 0xB8-0xDB (3 con 0xCAAA)
	cp 002h		;9533
	jr c,L_9546		;9535
	ld a,(0ca8fh)		;9537   ; lee hacia donde empuja la zona (1 arriba, 2 abajo, 3 izquierda, 4 derecha; 0 nada)
	or a			;953a
	jr z,L_9546		;953b
	dec a			;953d
	xor 001h		;953e
	inc a			;9540
	ld hl,0cb0eh		;9541   ; apunta a la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	cp (hl)			;9544
	ret z			;9545
L_9546:
	ld a,(0cb37h)		;9546   ; con 0xCB37, por debajo de 8 en 0xCB29 no se mueve
	or a			;9549
	jr z,L_9552		;954a
	ld a,(0cb29h)		;954c
	cp 008h		;954f
	ret c			;9551
L_9552:
	ld de,(0cb06h)		;9552   ; la Y + su velocidad
	call suma_a_y		;9556   ; suma_a_y: la Y de Snake (8.8) + DE
	ld de,(0cb08h)		;9559   ; la X + su velocidad
	call suma_a_x		;955d   ; suma_a_x: la X de Snake (8.8) + DE
	ld a,(0cb03h)		;9560   ; E = la Y, D = la X
	ld e,a			;9563
	ld a,(0cb05h)		;9564   ; lee la X de Snake
	ld d,a			;9567
	jp rastro_de_snake		;9568   ; p02:9BE4
empuje_de_ca8f:		; con 0xCB3F y 0xCA8F, salvo con 0xCB3C, 0xD4F1 o una salida: por 0xCA8F (p02:9588)
	ld a,(0cb3ch)		;956b
	or a			;956e
	ret nz			;956f
	ld a,(0d4f1h)		;9570
	or a			;9573
	ret nz			;9574
	ld a,(0ca41h)		;9575   ; lee la salida de la sala (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	or a			;9578
	ret nz			;9579
	ld a,(0cb3fh)		;957a   ; lee en la zona 6, lo que hay bajo Snake: 1 con los caracteres 0x90-0xB3, 2 con 0xB8-0xDB (3 con 0xCAAA)
	or a			;957d
	ret z			;957e
	ld a,(0ca8fh)		;957f   ; lee hacia donde empuja la zona (1 arriba, 2 abajo, 3 izquierda, 4 derecha; 0 nada)
	or a			;9582
	ret z			;9583
	dec a			;9584
	call 0424dh		;9585   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_9588: 4 destinos del despachador p00:424D (call en p02:9585, el
;   indice en A): 95D9, 9669, 96DF, 96FD; lo leen p02:9585 (8 bytes)
;   0x9588..0x9590  (8 bytes)
DATA_tabla_9588:
	defw 095d9h,09669h,096dfh,096fdh	; 9588  -> sale_por_arriba sale_por_abajo sale_por_la_izquierda sale_por_la_derecha

; ======================================================================
; CODIGO 0x9590..0x95d1  (65 bytes)
; ======================================================================


sale_de_la_sala:		; con 0xCB3C, 0xD4F1 o 0xCA65 no sale
	ld a,(0cb3ch)		;9590
	or a			;9593
	ret nz			;9594
	ld a,(0d4f1h)		;9595
	or a			;9598
	ret nz			;9599
	ld a,(0ca65h)		;959a   ; lee el sitio de 0xCBE0 en el que esta Snake (0 = ninguno)
	or a			;959d
	ret nz			;959e
	ld a,(0cb0eh)		;959f   ; sin direccion tampoco
	or a			;95a2
	ret z			;95a3
	call 07da9h		;95a4   ; p01:7DA9: Z, no se puede salir
	ret z			;95a7
	ld a,(0cb3fh)		;95a8   ; con 0xCB3F y 0xCA8F, la direccion contraria no sale
	or a			;95ab
	jr z,L_95BD		;95ac
	ld a,(0ca8fh)		;95ae   ; lee hacia donde empuja la zona (1 arriba, 2 abajo, 3 izquierda, 4 derecha; 0 nada)
	or a			;95b1
	jr z,L_95BD		;95b2
	dec a			;95b4
	xor 001h		;95b5
	inc a			;95b7
	ld hl,0cb0eh		;95b8   ; apunta a la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	cp (hl)			;95bb
	ret z			;95bc
L_95BD:
	ld a,(0cb00h)		;95bd   ; con el estado 0x0B, p02:9364
	cp 00bh		;95c0
	call z,cb28_a_0020		;95c2   ; cb28_a_0020: 0xCB28 = 0, 0xCB29 = 0x20
	ld a,(0ca41h)		;95c5   ; si ya sale, nada
	or a			;95c8
	ret nz			;95c9
	ld a,(0cb0eh)		;95ca   ; por la direccion: arriba, abajo, izquierda, derecha
	dec a			;95cd
	call 0424dh		;95ce   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_95D1: 4 destinos del despachador p00:424D (call en p02:95CE, el
;   indice en A): 95D9, 9669, 96DF, 96FD; lo leen p02:95CE (8 bytes)
;   0x95d1..0x95d9  (8 bytes)
DATA_tabla_95D1:
	defw 095d9h,09669h,096dfh,096fdh	; 95d1  -> sale_por_arriba sale_por_abajo sale_por_la_izquierda sale_por_la_derecha

; ======================================================================
; CODIGO 0x95d9..0x9743  (362 bytes)
; ======================================================================


sale_por_arriba:		; la Y por debajo de 0x10
	ld a,(0cb03h)		;95d9   ; lee la Y de Snake
	cp 010h		;95dc
	ret nc			;95de
	ld a,(0ca4ah)		;95df   ; en la zona 7, sala 0x12, con 0xD880 distinto de 0xFF, choca
	cp 007h		;95e2
	jr nz,L_95FA		;95e4
	ld a,(0ca4bh)		;95e6   ; lee la sala de la zona
	cp 012h		;95e9
	jr nz,L_95FA		;95eb
	ld a,(0d880h)		;95ed
	cp 0ffh		;95f0
	jr z,L_95FA		;95f2
	ld a,001h		;95f4
	ld (0cb0fh),a		;95f6   ; guarda 1 si Snake ha chocado en este cuadro
	ret			;95f9
L_95FA:
	call entra_por_abajo		;95fa   ; la Y de la sala de arriba
	call cb28_al_salir_arriba		;95fd   ; p02:9625
	ld a,001h		;9600   ; sale por arriba
	ld (0ca41h),a		;9602   ; guarda la salida de la sala (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ret			;9605
entra_por_abajo:		; Y = 0xBF
	ld hl,0bf00h		;9606
	ld (0cb02h),hl		;9609   ; guarda la Y de Snake: la parte fraccionaria (0xCB02-0xCB03 en 8.8) y el byte siguiente (16 bits)
	ld a,(0ca4ah)		;960c   ; en la zona 0...
	or a			;960f
	ret nz			;9610
	ld h,054h		;9611   ; ...sala 0x0A: X = 0x54...
	ld a,(0ca4bh)		;9613   ; lee la sala de la zona
	cp 00ah		;9616
	jr z,L_961F		;9618
	ld h,034h		;961a   ; ...sala 0x0C: X = 0x34
	cp 00ch		;961c
	ret nz			;961e
L_961F:
	ld l,000h		;961f
	ld (0cb04h),hl		;9621   ; guarda la X de Snake: la parte fraccionaria (0xCB04-0xCB05 en 8.8) y el byte siguiente (16 bits)
	ret			;9624
cb28_al_salir_arriba:		; la lista de p56:BF10
	ld hl,0bf10h		;9625
cb28_al_salir:		; en la especial 0x39 sala 1: 0xCB28 = 1, 0xCB29 = 0
	ld a,(0ca76h)		;9628   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	cp 039h		;962b
	jr nz,L_9635		;962d
	ld a,(0ca4bh)		;962f   ; lee la sala de la zona
	dec a			;9632
	jr z,L_965D		;9633
L_9635:
	ld a,(0ca76h)		;9635   ; en las demas especiales, nada
	or a			;9638
	ret nz			;9639
	call 0418eh		;963a   ; bancos_56: pone el 56 en 0xA000 (con su copia en 0xC381-0xC383)
	call busca_cb28		;963d   ; la lista de HL (en p56)
	jp 040f0h		;9640   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
busca_cb28:		; ternas [zona][sala][estado de Snake] hasta 0xFF: si casa, 0xCB28 = 1, 0xCB29 = 0
	ld a,(hl)			;9643
	cp 0ffh		;9644
	ret z			;9646
	push hl			;9647
	ld a,(0ca4ah)		;9648   ; la zona...
	cp (hl)			;964b
	jr nz,L_9663		;964c
	inc hl			;964e
	ld a,(0ca4bh)		;964f   ; ...la sala...
	cp (hl)			;9652
	jr nz,L_9663		;9653
	inc hl			;9655
	ld a,(0cb00h)		;9656   ; ...el estado de Snake
	cp (hl)			;9659
	jr nz,L_9663		;965a
	pop hl			;965c
L_965D:
	ld bc,00100h		;965d
	jp pon_cb28		;9660   ; pon_cb28: 0xCB28 = B, 0xCB29 = C
L_9663:
	pop hl			;9663   ; la terna siguiente
	inc hl			;9664
	inc hl			;9665
	inc hl			;9666
	jr busca_cb28		;9667
sale_por_abajo:		; la Y desde 0xC0
	ld a,(0cb03h)		;9669   ; lee la Y de Snake
	cp 0c0h		;966c
	ret c			;966e
	ld a,(0ca4ah)		;966f   ; en la zona 0x0A sala 4, con el bit 4 de 0xD7D5 y sin el bit 0 de 0xD7DA, choca
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
	ld (0cb0fh),a		;968d   ; guarda 1 si Snake ha chocado en este cuadro
	ret			;9690
L_9691:
	call entra_por_arriba		;9691   ; la Y de la sala de abajo
	call cb28_al_salir_abajo		;9694   ; p02:969D
	ld a,002h		;9697   ; sale por abajo
	ld (0ca41h),a		;9699   ; guarda la salida de la sala (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ret			;969c
cb28_al_salir_abajo:		; la lista de p56:BF2F
	ld hl,0bf2fh		;969d
	jr cb28_al_salir		;96a0
entra_por_arriba:		; Y = 0x11
	ld hl,01100h		;96a2
	ld (0cb02h),hl		;96a5   ; guarda la Y de Snake: la parte fraccionaria (0xCB02-0xCB03 en 8.8) y el byte siguiente (16 bits)
	ld a,(0ca4ah)		;96a8   ; en la zona 0 y en la 9 (sala 3) la X y la Y salen de p02:96C5 o 96B7
	or a			;96ab
	jr z,L_96C5		;96ac
	cp 009h		;96ae
	ret nz			;96b0
	ld a,(0ca4bh)		;96b1   ; lee la sala de la zona
	cp 003h		;96b4
	ret nz			;96b6
	ld bc,04038h		;96b7   ; zona 9, sala 3: X = 0x40 o 0x90, Y = 0x38
	ld a,(0cb05h)		;96ba   ; lee la X de Snake
	cp 070h		;96bd
	jr c,L_96D4		;96bf
	ld b,090h		;96c1
	jr L_96D4		;96c3
L_96C5:
	ld bc,03808h		;96c5   ; zona 0, sala 0x0A: X = 0x38, Y = 8; sala 0x0C: X = 0x70
	ld a,(0ca4bh)		;96c8   ; lee la sala de la zona
	cp 00ah		;96cb
	jr z,L_96D4		;96cd
	ld b,070h		;96cf
	cp 00ch		;96d1
	ret nz			;96d3
L_96D4:
	ld h,b			;96d4   ; la X...
	ld l,000h		;96d5
	ld (0cb04h),hl		;96d7   ; guarda la X de Snake: la parte fraccionaria (0xCB04-0xCB05 en 8.8) y el byte siguiente (16 bits)
	ld h,c			;96da   ; ...y la Y
	ld (0cb02h),hl		;96db   ; guarda la Y de Snake: la parte fraccionaria (0xCB02-0xCB03 en 8.8) y el byte siguiente (16 bits)
	ret			;96de
sale_por_la_izquierda:		; la X por debajo de 9...
	ld b,009h		;96df
	ld hl,0b800h		;96e1   ; ...entra por la derecha en X = 0xB8
	ld a,(0cb00h)		;96e4   ; con el estado 2...
	cp 002h		;96e7
	jr nz,L_96EF		;96e9
	ld b,011h		;96eb   ; ...por debajo de 0x11, en X = 0xB7
	ld h,0b7h		;96ed
L_96EF:
	ld a,(0cb05h)		;96ef   ; lee la X de Snake
	cp b			;96f2
	ret nc			;96f3
	ld (0cb04h),hl		;96f4   ; la X de la sala de la izquierda
	ld a,003h		;96f7   ; sale por la izquierda
	ld (0ca41h),a		;96f9   ; guarda la salida de la sala (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ret			;96fc
sale_por_la_derecha:		; la X desde 0xB8...
	ld b,0b8h		;96fd
	ld hl,00800h		;96ff   ; ...entra por la izquierda en X = 8
	ld a,(0cb00h)		;9702   ; con el estado 2...
	cp 002h		;9705
	jr nz,L_970D		;9707
	ld b,0b0h		;9709   ; ...desde 0xB0
	ld h,008h		;970b
L_970D:
	ld a,(0cb05h)		;970d   ; lee la X de Snake
	cp b			;9710
	ret c			;9711
	ld (0cb04h),hl		;9712   ; la X de la sala de la derecha
	ld a,004h		;9715   ; sale por la derecha
	ld (0ca41h),a		;9717   ; guarda la salida de la sala (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ret			;971a
choca_con_la_sala:		; 0xCB30 = 0
	xor a			;971b
	ld (0cb30h),a		;971c   ; guarda 1 si el ultimo choque fue contra la sala (p02:9756)
	ld a,(0cb00h)		;971f   ; con el estado 0x0B no choca
	cp 00bh		;9722
	ret z			;9724
	ld b,000h		;9725   ; B = 1 con el estado 2
	ld a,(0cb00h)		;9727   ; lee el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	cp 002h		;972a
	jr nz,L_972F		;972c
	inc b			;972e
L_972F:
	call 07eeeh		;972f   ; p01:7EEE: sin acarreo, no choca
	ret nc			;9732
	call resbala		;9733   ; resbala por la esquina (p02:975C)
	ret c			;9736
	call pega_a_la_casilla_si		;9737   ; si no, se pega a la casilla (p02:9804)...
	call L_9756		;973a   ; ...0xCB30 = 1...
	ld a,001h		;973d   ; ...y ha chocado
	ld (0cb0fh),a		;973f   ; guarda 1 si Snake ha chocado en este cuadro
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
	ld (0cb30h),a		;9758   ; guarda 1 si el ultimo choque fue contra la sala (p02:9756)
	ret			;975b
resbala:		; por la direccion: arriba y abajo prueban de lado, izquierda y derecha arriba y abajo
	ld a,(0cb0eh)		;975c   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	dec a			;975f
	call 0424dh		;9760   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_9763: 4 destinos del despachador p00:424D (call en p02:9760, el
;   indice en A): 976B, 976B, 978B, 978B; lo leen p02:9760 (8 bytes)
;   0x9763..0x976b  (8 bytes)
DATA_tabla_9763:
	defw 0976bh,0976bh,0978bh,0978bh	; 9763  -> resbala_en_x resbala_en_x resbala_en_y resbala_en_y

; ======================================================================
; CODIGO 0x976b..0x97f0  (133 bytes)
; ======================================================================


resbala_en_x:		; hasta 4 puntos a la izquierda...
	ld de,0ff00h		;976b
	ld b,004h		;976e
L_9770:
	push bc			;9770
	call cabe_en		;9771   ; cabe?
	pop bc			;9774
	jr nc,L_97BD		;9775
	dec d			;9777   ; un punto mas
	djnz L_9770		;9778
	ld de,00100h		;977a   ; ...y hasta 4 a la derecha
	ld b,004h		;977d
L_977F:
	push bc			;977f
	call cabe_en		;9780   ; cabe_en: cabe Snake en su sitio + (D, E)? (sin acarreo, si)
	pop bc			;9783
	jr nc,L_97BD		;9784
	inc d			;9786
	djnz L_977F		;9787
	and a			;9789   ; sin sitio: sin acarreo
	ret			;978a
resbala_en_y:		; hasta 4 puntos arriba...
	ld de,000ffh		;978b
	ld b,004h		;978e
L_9790:
	push bc			;9790
	call cabe_en		;9791   ; cabe_en: cabe Snake en su sitio + (D, E)? (sin acarreo, si)
	pop bc			;9794
	jr nc,L_97BD		;9795
	dec e			;9797
	djnz L_9790		;9798
	ld de,00001h		;979a   ; ...y hasta 4 abajo
	ld b,004h		;979d
L_979F:
	push bc			;979f
	call cabe_en		;97a0   ; cabe_en: cabe Snake en su sitio + (D, E)? (sin acarreo, si)
	pop bc			;97a3
	jr nc,L_97BD		;97a4
	inc e			;97a6
	djnz L_979F		;97a7
	and a			;97a9
	ret			;97aa
resbala_4:		; 4 puntos arriba...
	ld de,000fch		;97ab
	call cabe_en		;97ae   ; cabe_en: cabe Snake en su sitio + (D, E)? (sin acarreo, si)
	jr nc,L_97BD		;97b1
	ld de,00004h		;97b3   ; ...o 4 abajo
	call cabe_en		;97b6   ; cabe_en: cabe Snake en su sitio + (D, E)? (sin acarreo, si)
	jr nc,L_97BD		;97b9
	and a			;97bb
	ret			;97bc
L_97BD:
	call sin_fraccion		;97bd   ; donde cabe: sin fraccion...
	ld a,(0cb03h)		;97c0   ; ...la Y + E...
	add a,e			;97c3
	ld (0cb03h),a		;97c4   ; guarda la Y de Snake
	ld a,(0cb05h)		;97c7   ; ...la X + D
	add a,d			;97ca
	ld (0cb05h),a		;97cb   ; guarda la X de Snake
	scf			;97ce   ; con acarreo: se ha movido
	ret			;97cf
cabe_en:		; cabe Snake en su sitio + (D, E)? (sin acarreo, si)
	push de			;97d0
	call cabe_en_si		;97d1   ; cabe_en_si: E = la Y + E
	pop de			;97d4
	ret			;97d5
cabe_en_si:		; E = la Y + E
	ld a,(0cb03h)		;97d6   ; lee la Y de Snake
	add a,e			;97d9
	ld e,a			;97da
	ld a,(0cb05h)		;97db   ; D = la X + D
	add a,d			;97de
	ld d,a			;97df
	ld b,000h		;97e0   ; B = 1 con el estado 2
	ld a,(0cb00h)		;97e2   ; lee el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	cp 002h		;97e5
	jr nz,L_97EA		;97e7
	inc b			;97e9
L_97EA:
	ld a,(0cb0eh)		;97ea   ; y la direccion
	jp 07ef6h		;97ed   ; choca_en_direccion: acarreo si alguno de los 3 puntos de Snake en la direccion A da con un caracter solido (p56:A30A)

; ----------------------------------------------------------------------
; DATOS sin identificar  0x97f0..0x97f8  (8 bytes)
DATA_97F0:
	defb 0cdh,053h,093h,03ah,08fh,0cah,0b7h,0c8h	; 97f0  .S.:....

; ======================================================================
; CODIGO 0x97f8..0x97fc  (4 bytes)
; ======================================================================


pega_a_la_casilla:		; por la direccion (p02:97FC)
	dec a			;97f8
	call 0424dh		;97f9   ; despachador: salta a la palabra A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_97FC: 4 destinos del despachador p00:424D (call en p02:97F9, el
;   indice en A): 980C, 9824, 9831, 9838; lo leen p02:97F9 (8 bytes)
;   0x97fc..0x9804  (8 bytes)
DATA_tabla_97FC:
	defw 0980ch,09824h,09831h,09838h	; 97fc  -> pega_arriba pega_abajo pega_a_la_izquierda pega_a_la_derecha

; ======================================================================
; CODIGO 0x9804..0x9888  (132 bytes)
; ======================================================================


pega_a_la_casilla_si:		; sin fraccion
	call sin_fraccion		;9804   ; sin_fraccion: las fracciones de la Y y de la X a cero
	ld a,(0cb0eh)		;9807   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	jr $-18		;980a   ; a p02:97F8 con la direccion
pega_arriba:		; la Y a la casilla: & 0xF8 + 7 (+ 5 con el estado 2)
	ld a,(0cb00h)		;980c   ; lee el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	cp 002h		;980f
	ld a,(0cb03h)		;9811   ; lee la Y de Snake
	jr z,L_981E		;9814
	and 0f8h		;9816
	add a,007h		;9818
	ld (0cb03h),a		;981a   ; guarda la Y de Snake
	ret			;981d
L_981E:
	and 0f8h		;981e
	add a,005h		;9820
	jr L_982D		;9822
pega_abajo:		; la Y - 4 a la casilla, + 7
	ld a,(0cb03h)		;9824   ; lee la Y de Snake
	sub 004h		;9827
	and 0f8h		;9829
	add a,007h		;982b
L_982D:
	ld (0cb03h),a		;982d   ; guarda la Y de Snake
	ret			;9830
pega_a_la_izquierda:		; la X + 6 a la casilla
	ld a,(0cb05h)		;9831   ; lee la X de Snake
	add a,006h		;9834
	jr L_983B		;9836
pega_a_la_derecha:		; la X a la casilla
	ld a,(0cb05h)		;9838   ; lee la X de Snake
L_983B:
	and 0f8h		;983b   ; & 0xF8: el principio de la casilla
	ld (0cb05h),a		;983d   ; guarda la X de Snake
	ret			;9840
anda:		; la espera de quieto otra vez a 4
	ld hl,0cb1ah		;9841   ; apunta a la espera hasta el dibujo de quieto (4 cuadros)
	ld (hl),004h		;9844
	ld hl,0cb15h		;9846   ; la espera del paso
	ld a,(0ca07h)		;9849   ; una direccion recien pulsada...
	and 00fh		;984c
	jr z,L_9852		;984e
	ld (hl),001h		;9850   ; ...cambia de paso ya
L_9852:
	dec (hl)			;9852   ; un cuadro menos
	ret nz			;9853
	ld a,(0cb0ah)		;9854   ; la espera del paso siguiente, segun la marcha (p02:988A)
	ld hl,0988ah		;9857
	call 04248h		;985a   ; byte_de_tabla: A = el byte A de la tabla de HL (y HL apunta a el)
	ld hl,0cb15h		;985d   ; apunta a la espera hasta el paso siguiente (p02:988A, segun la marcha)
	ld (hl),a			;9860
	ld a,(0cb13h)		;9861   ; el paso siguiente, de 0 a 3
	inc a			;9864
	and 003h		;9865
	ld (0cb13h),a		;9867   ; guarda el paso de la animacion de andar (0-3)
dibujo_del_paso:		; el dibujo del paso (p02:9888)
	ld a,(0cb13h)		;986a   ; lee el paso de la animacion de andar (0-3)
	ld hl,09888h		;986d
	call 04248h		;9870   ; byte_de_tabla: A = el byte A de la tabla de HL (y HL apunta a el)
	ld (0cb14h),a		;9873   ; guarda el dibujo del paso de andar (0, 1, 2, 1: p02:9888)
	or a			;9876   ; los dibujos 0 y 2 (los pies en el suelo)...
	jr z,L_987C		;9877
	cp 002h		;9879
	ret nz			;987b
L_987C:
	ld a,(0cb00h)		;987c   ; ...con el estado 9...
	cp 009h		;987f
	ret nz			;9881
	call 0af05h		;9882   ; ...p11:AF05...
	jp 06ac6h		;9885   ; ...y p01:6AC6

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


anda_b:		; una direccion recien pulsada: cambia ya
	ld a,(0ca07h)		;9892   ; lee lo recien pulsado del mando (los bits de 0xCA08 que no estaban)
	and 00fh		;9895
	jr nz,L_98A9		;9897
	ld hl,0cb18h		;9899   ; si ha chocado, la espera a 1
	ld a,(0cb0fh)		;989c   ; lee 1 si Snake ha chocado en este cuadro
	or a			;989f
	jr z,L_98A5		;98a0
	ld (hl),001h		;98a2
	ret			;98a4
L_98A5:
	dec (hl)			;98a5   ; un cuadro menos
	ret nz			;98a6
	ld (hl),003h		;98a7   ; a los 3 cuadros...
L_98A9:
	ld b,0f8h		;98a9   ; ...0xCB17 se mueve 8 adelante o atras (por debajo de 0x0D, adelante)
	ld hl,0cb17h		;98ab
	ld a,(hl)			;98ae
	cp 00dh		;98af
	jr nc,L_98B5		;98b1
	ld b,008h		;98b3
L_98B5:
	add a,b			;98b5
	ld (hl),a			;98b6
	ret			;98b7
estado_1:		; el estado 1, o el 0 sin 0xCB35 (p02:990E)
	ld b,001h		;98b8
	call que_estado_b		;98ba   ; que_estado_b: ...1 con 0xCB35, si no 0
	jr estado_de_snake		;98bd
estado_que_toca:		; el estado que toca (p02:98F0) a 0xCB00
	call que_estado		;98bf   ; que_estado: B = el estado: 6 con 0xCB20 = 5...
estado_de_snake:		; el estado B de Snake de p02:9915 (3 bytes: estado, dibujo y marcha)
	ld hl,09915h		;98c2
	ld a,b			;98c5
	add a,a			;98c6
	add a,b			;98c7
	call 0423eh		;98c8   ; suma_a_hl: HL = HL + A
	ld de,0cb00h		;98cb   ; 0xCB00 y 0xCB01...
	ldi		;98ce
	ldi		;98d0
	ld a,(hl)			;98d2   ; ...y la marcha
	ld (0cb0ah),a		;98d3   ; guarda la marcha de Snake: el indice de las velocidades de p02:9520
	ld a,(0cb21h)		;98d6   ; con 0xCB21 = 0x0A u 0x0B no se da la vuelta
	cp 00ah		;98d9
	jr z,L_98EB		;98db
	cp 00bh		;98dd
	jr z,L_98EB		;98df
	cp 002h		;98e1   ; con 0xCB21 = 2, el dibujo de 0xCB35
	ret nz			;98e3
	ld a,(0cb35h)		;98e4
	ld (0cb01h),a		;98e7   ; guarda el dibujo de Snake (al darse la vuelta se le suma 1, 3 o 5 segun 0xCB00)
	ret			;98ea
L_98EB:
	xor a			;98eb
	ld (0cb16h),a		;98ec   ; guarda 1 mientras Snake se da la vuelta
	ret			;98ef
que_estado:		; B = el estado: 6 con 0xCB20 = 5...
	ld b,006h		;98f0
	ld a,(0cb20h)		;98f2   ; lee lo que usa el disparo 1 (0 nada; p02:8001 elige por ello)
	cp 005h		;98f5
	ret z			;98f7
	dec b			;98f8   ; ...5 con 0xCB21 = 2...
	ld a,(0cb21h)		;98f9   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	cp 002h		;98fc
	ret z			;98fe
	dec b			;98ff   ; ...4 con 0xCB21 = 0x0A...
	cp 00ah		;9900
	ret z			;9902
	dec b			;9903   ; ...3 con 0xCB21 = 0x0B...
	cp 00bh		;9904
	ret z			;9906
	dec b			;9907   ; ...2 con 0xCB31...
	ld a,(0cb31h)		;9908   ; lee 1 en el estado 2 de Snake
	or a			;990b
	ret nz			;990c
	dec b			;990d
que_estado_b:		; ...1 con 0xCB35, si no 0
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


pon_cb35:		; 0xCB35 = 1 si 0xCB20 es 1, 2, 5 o 6
	call cb35_segun_cb20		;992a   ; cb35_segun_cb20: B = 0 con 0xCB20 = 1, 2, 5 o 6; si no, 1
	ld a,b			;992d
	ld (0cb35h),a		;992e
	ret			;9931
cb35_segun_cb20:		; B = 0 con 0xCB20 = 1, 2, 5 o 6; si no, 1
	ld b,001h		;9932   ; B = 1...
	ld a,(0cb20h)		;9934   ; ...con 0xCB20 = 1...
	dec a			;9937
	ret z			;9938
	dec a			;9939   ; ...2...
	ret z			;993a
	sub 003h		;993b   ; ...5...
	ret z			;993d
	dec a			;993e   ; ...o 6
	ret z			;993f
	dec b			;9940   ; con los demas, B = 0
	ret			;9941
delante_de_snake:		; lo que hay delante de Snake: p11:A117 y p01:6A19 o p01:6ACA; si no, p01:6A15
	call punto_delante		;9942   ; punto_delante: L = la Y, H = la X de Snake mas lo de su direccion en p02:9980
	push hl			;9945   ; HL = el punto de delante (p02:995E)
	call mira_delante		;9946   ; p01:7F3D (arriba) o p01:7F88
	pop de			;9949
	jr nc,L_995B		;994a
	call a_p11_a117		;994c   ; a_p11_a117: p11:A117 con el banco 11 en 0xA000
	call L_9955		;994f
	jp 0af05h		;9952   ; p03:AF05
L_9955:
	jp nc,06a19h		;9955   ; sonido_0a: pide el sonido 0x0A
	jp 06acah		;9958   ; sonido_47: pide el sonido 0x47
L_995B:
	jp 06a15h		;995b   ; sonido_09: pide el sonido 0x09
punto_delante:		; L = la Y, H = la X de Snake mas lo de su direccion en p02:9980
	ld hl,09980h		;995e
	ld a,(0cb0eh)		;9961   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	dec a			;9964
	add a,a			;9965
	call 0423eh		;9966   ; suma_a_hl: HL = HL + A
	ld a,(0cb03h)		;9969   ; lee la Y de Snake
	add a,(hl)			;996c
	ld e,a			;996d
	inc hl			;996e
	ld a,(0cb05h)		;996f   ; lee la X de Snake
	add a,(hl)			;9972
	ld d,a			;9973
	ex de,hl			;9974
	ret			;9975
mira_delante:		; hacia arriba p01:7F3D, si no p01:7F88
	ld a,(0cb0eh)		;9976   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	dec a			;9979
	jp z,07f3dh		;997a   ; es_solido_si: acarreo si el caracter del mapa en (H = X, L = Y) llega al umbral de 0xCA4E (0xCA4F desde 0x81)
	jp 07f88h		;997d   ; cuatro_hacia_abajo: acarreo si (H, L) y los 3 puntos de 8 en 8 hacia abajo son solidos o estan fuera

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


zonas_de_estado_0b:		; con 0xCA8D puesto, solo con 0xCB29 = 0x20 (y lo borra)
	ld hl,0ca8dh		;9988   ; apunta a con el, otros choques de Snake con los actores (p07:AD1E)
	ld a,(hl)			;998b   ; con 0xCA8D...
	or a			;998c
	jr z,L_9997		;998d
	ld a,(0cb29h)		;998f   ; ...0xCB29 = 0x20...
	cp 020h		;9992
	ret nz			;9994
	ld (hl),000h		;9995   ; ...lo borra
L_9997:
	ld a,(0d8c0h)		;9997   ; con 0xD8C0 o saliendo de la sala, nada
	or a			;999a
	ret nz			;999b
	ld a,(0ca41h)		;999c   ; lee la salida de la sala (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	or a			;999f
	ret nz			;99a0
	call 04206h		;99a1   ; las listas de p30
	call busca_zona_0b		;99a4   ; busca_zona_0b: solo yendo arriba o abajo
	jp 040f0h		;99a7   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
busca_zona_0b:		; solo yendo arriba o abajo
	ld a,(0cb0eh)		;99aa   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	cp 003h		;99ad
	ret nc			;99af
	ld hl,0be4bh		;99b0   ; en las salas especiales, la lista de p30:BE4B
	ld a,(0ca76h)		;99b3   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	or a			;99b6
	jr nz,L_99C6		;99b7
	call rectangulo_de_be92		;99b9   ; los rectangulos de p30:BE92 (p02:9A5B)...
	ret c			;99bc
	ld a,(0ca4ah)		;99bd   ; ...si no, la lista de la zona en p30:BAA8
	ld hl,0baa8h		;99c0
	call 043f6h		;99c3   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
L_99C6:
	ld a,(hl)			;99c6   ; 0xFF: se acabo
	cp 0ffh		;99c7
	ret z			;99c9
	push hl			;99ca
	call ficha_de_estado_0b		;99cb   ; mira la ficha
	pop hl			;99ce
	ld a,(0cb00h)		;99cf   ; si ya esta en el estado 0x0B, ya esta
	cp 00bh		;99d2
	ret z			;99d4
	ld a,(0ca76h)		;99d5   ; fichas de 6 bytes (7 en las especiales)
	or a			;99d8
	ld a,006h		;99d9
	jr z,L_99DE		;99db
	inc a			;99dd
L_99DE:
	call 0423eh		;99de   ; suma_a_hl: HL = HL + A
	jr L_99C6		;99e1
ficha_de_estado_0b:		; en las especiales, primero la especial
	ld a,(0ca76h)		;99e3   ; lee la sala especial (0 = ninguna; indice de p24:64B6)
	or a			;99e6
	jr z,L_99EC		;99e7
	cp (hl)			;99e9
	ret nz			;99ea
	inc hl			;99eb
L_99EC:
	ld a,(0ca4bh)		;99ec   ; la sala
	cp (hl)			;99ef
	ret nz			;99f0
	inc hl			;99f1
	ld a,(hl)			;99f2   ; el byte 0xCB2F
	ld (0cb2fh),a		;99f3
	inc hl			;99f6
	ld a,(hl)			;99f7   ; la Y de arriba (0: cualquiera)...
	or a			;99f8
	ld a,(0cb03h)		;99f9   ; lee la Y de Snake
	jr z,L_9A00		;99fc
	cp (hl)			;99fe   ; ...Snake por encima: nada
	ret c			;99ff
L_9A00:
	ld e,(hl)			;9a00   ; E = la Y de arriba
	inc hl			;9a01
	sub 008h		;9a02   ; la Y de Snake - 8...
	jr nc,L_9A07		;9a04
	xor a			;9a06
L_9A07:
	cp (hl)			;9a07   ; ...por debajo de la Y de abajo
	ret nc			;9a08
	ld d,(hl)			;9a09   ; D = la Y de abajo
	ld a,(0cb28h)		;9a0a   ; sin 0xCB28, la direccion tiene que llevar hacia dentro
	or a			;9a0d
	jr nz,L_9A25		;9a0e
	ld a,(0cb03h)		;9a10   ; la Y de Snake - 0x20 contra la de arriba...
	sub 020h		;9a13
	jr nc,L_9A18		;9a15
	xor a			;9a17
L_9A18:
	cp e			;9a18
	ld a,(0cb0eh)		;9a19   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	jr c,L_9A22		;9a1c
	dec a			;9a1e   ; ...por debajo: solo hacia arriba
	ret nz			;9a1f
	jr L_9A25		;9a20
L_9A22:
	cp 002h		;9a22   ; ...por encima: solo hacia abajo
	ret nz			;9a24
L_9A25:
	inc hl			;9a25   ; la X del centro y el medio ancho...
	ld a,(hl)			;9a26
	inc hl			;9a27
	sub (hl)			;9a28
	ld b,a			;9a29
	ld a,(0cb05h)		;9a2a   ; ...la X de Snake desde la izquierda...
	cp b			;9a2d
	ret c			;9a2e
	ld a,b			;9a2f
	add a,(hl)			;9a30
	add a,(hl)			;9a31
	ld b,a			;9a32
	ld a,(0cb05h)		;9a33   ; ...hasta la derecha
	cp b			;9a36
	ret nc			;9a37
	ld (0cb2ah),de		;9a38   ; 0xCB2A-0xCB2B = las Y de arriba y abajo
	ld a,00bh		;9a3c   ; el estado 0x0B (solo arriba y abajo, p02:9399)
	ld (0cb00h),a		;9a3e   ; guarda el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	ld a,002h		;9a41   ; el dibujo 2
	ld (0cb01h),a		;9a43   ; guarda el dibujo de Snake (al darse la vuelta se le suma 1, 3 o 5 segun 0xCB00)
	xor a			;9a46   ; 0xCB50 = 0xCB16 = 0
	ld (0cb50h),a		;9a47
	ld (0cb16h),a		;9a4a   ; guarda 1 mientras Snake se da la vuelta
	ld a,(hl)			;9a4d   ; con el medio ancho por debajo de 8...
	cp 008h		;9a4e
	ret nc			;9a50
	xor a			;9a51   ; ...la X de Snake = la del centro
	ld (0cb04h),a		;9a52   ; guarda la X de Snake: la parte fraccionaria (0xCB04-0xCB05 en 8.8)
	dec hl			;9a55
	ld a,(hl)			;9a56
	ld (0cb05h),a		;9a57   ; guarda la X de Snake
	ret			;9a5a
rectangulo_de_be92:		; los rectangulos de p30:BE92 [zona][sala][Y][Y][X][X] hasta 0xFF: acarreo si Snake esta en uno
	ld hl,0be92h		;9a5b
L_9A5E:
	ld a,(hl)			;9a5e   ; 0xFF: se acabo
	cp 0ffh		;9a5f
	jr z,L_9A94		;9a61
	push hl			;9a63
	call L_9A6F		;9a64   ; el rectangulo
	pop hl			;9a67
	ret c			;9a68   ; dentro: con acarreo
	ld de,00006h		;9a69   ; el siguiente, 6 bytes mas alla
	add hl,de			;9a6c
	jr L_9A5E		;9a6d
L_9A6F:
	ld a,(0ca4ah)		;9a6f   ; la zona
	cp (hl)			;9a72
	jr nz,L_9A94		;9a73
	inc hl			;9a75
	ld a,(0ca4bh)		;9a76   ; la sala
	cp (hl)			;9a79
	jr nz,L_9A94		;9a7a
	inc hl			;9a7c
	ld a,(0cb03h)		;9a7d   ; la Y entre los dos limites
	cp (hl)			;9a80
	jr c,L_9A94		;9a81
	inc hl			;9a83
	cp (hl)			;9a84
	jr nc,L_9A94		;9a85
	inc hl			;9a87
	ld a,(0cb05h)		;9a88   ; la X entre los dos limites
	cp (hl)			;9a8b
	jr c,L_9A94		;9a8c
	inc hl			;9a8e
	cp (hl)			;9a8f
	jr nc,L_9A94		;9a90
	scf			;9a92   ; dentro
	ret			;9a93
L_9A94:
	and a			;9a94   ; fuera
	ret			;9a95
llama_a14d_a2aa_a139:		; p06:A14D, p06:A2AA y p06:A139 con el banco 6
	call 041a0h		;9a96   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a14dh		;9a99   ; suelo_bajo_snake: el bit 2 de 0xD7E1 si Snake pisa un caracter de los de la zona (p06:A1AC; sin 0xD8C0 ni 0xCA65), con 0xCB33 = su numero; y el sonido del paso
	call 0a2aah		;9a9c   ; tope_dfea: con 0xDFE8 (zona 6 sala 0x10, p11:A389) y Snake fuera del estado 0x10: no pasa de la X de 0xDFEA; con la X en 0x20-0x3F, el estado 0x10
	call 0a139h		;9a9f   ; suelo_5_o_6: con 0xCA9B, 0xCB33 = 6; si no, con 0xCB37, 5; y el sonido del paso (p06:A16B)
	jp 040f0h		;9aa2   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
el_agua:		; solo en la zona 6: 0xCAAA, 0xCB3F y la barra de la derecha
	ld a,(0ca4ah)		;9aa5   ; lee la zona
	cp 006h		;9aa8
	ret nz			;9aaa
	call cambia_caaa		;9aab   ; cambia_caaa: con 0xCAAA puesto, cualquier disparo recien pulsado lo quita
	call cb3f_y_barra		;9aae   ; cb3f_y_barra: el 0xCB3F de antes...
	jp gasta_la_barra		;9ab1   ; gasta_la_barra: con 0xCB3F >= 2, cada 16 cuadros (0xCA98)...
cambia_caaa:		; con 0xCAAA puesto, cualquier disparo recien pulsado lo quita
	ld hl,0caaah		;9ab4   ; apunta a en la zona 6: lo ponen los dos disparos (el 2 apretado y el 1 recien pulsado), lo quita cualquiera
	ld a,(hl)			;9ab7
	or a			;9ab8
	jr z,L_9AC4		;9ab9
	ld a,(0ca07h)		;9abb   ; lee lo recien pulsado del mando (los bits de 0xCA08 que no estaban)
	and 030h		;9abe
	ret z			;9ac0
	ld (hl),000h		;9ac1
	ret			;9ac3
L_9AC4:
	ld a,(0ca08h)		;9ac4   ; sin el: el disparo 2 apretado (bit 5) y el 1 recien pulsado (bit 4) lo ponen
	and 020h		;9ac7
	ret z			;9ac9
	ld a,(0ca07h)		;9aca   ; lee lo recien pulsado del mando (los bits de 0xCA08 que no estaban)
	and 010h		;9acd
	ret z			;9acf
	ld (hl),001h		;9ad0
	ret			;9ad2
cb3f_y_barra:		; el 0xCB3F de antes...
	ld hl,0cb3fh		;9ad3   ; apunta a en la zona 6, lo que hay bajo Snake: 1 con los caracteres 0x90-0xB3, 2 con 0xB8-0xDB (3 con 0xCAAA)
	ld a,(hl)			;9ad6
	push af			;9ad7
	call que_cb3f		;9ad8   ; ...el de ahora (p02:9AF3)...
	pop bc			;9adb
	push bc			;9adc
	call barra_si_cambia		;9add   ; ...y la barra de la derecha si cambia
	pop bc			;9ae0
	ld a,(0cb3fh)		;9ae1   ; con 0xCB3F: p02:9BA4 y el empuje
	or a			;9ae4
	jr z,L_9AED		;9ae5
	call empuje		;9ae7   ; empuje: p06:A387
	jp empuje_de_ca8f		;9aea   ; empuje_de_ca8f: con 0xCB3F y 0xCA8F, salvo con 0xCB3C, 0xD4F1 o una salida: por 0xCA8F (p02:9588)
L_9AED:
	ld a,b			;9aed   ; sin el, si antes lo habia, el estado 1
	or a			;9aee
	ret z			;9aef
	jp estado_1		;9af0   ; estado_1: el estado 1, o el 0 sin 0xCB35 (p02:990E)
que_cb3f:		; 0xCB3F = 0
	xor a			;9af3
	ld (hl),a			;9af4
	ld a,(0ca41h)		;9af5   ; saliendo de la sala, nada
	or a			;9af8
	ret nz			;9af9
	ld a,(0ca76h)		;9afa   ; ni en una especial
	or a			;9afd
	ret nz			;9afe
	ld a,(0d8c0h)		;9aff   ; ni con 0xD8C0
	or a			;9b02
	ret nz			;9b03
	ld a,(0ca4bh)		;9b04   ; ni en las salas 7 y 0x10
	cp 007h		;9b07
	ret z			;9b09
	cp 010h		;9b0a
	ret z			;9b0c
	call y_x_de_snake		;9b0d   ; el caracter de la sala bajo Snake (p01:7F69)
	call 07f69h		;9b10   ; caracter_en: A = el caracter del mapa en (H = X, L = Y)
	ld hl,0cb3fh		;9b13   ; apunta a en la zona 6, lo que hay bajo Snake: 1 con los caracteres 0x90-0xB3, 2 con 0xB8-0xDB (3 con 0xCAAA)
	cp 090h		;9b16   ; 0x90-0xB3: 1
	ret c			;9b18
	cp 0b4h		;9b19
	jr c,L_9B27		;9b1b
	cp 0b8h		;9b1d   ; 0xB8-0xDB: 2
	ret c			;9b1f
	cp 0dch		;9b20
	ret nc			;9b22
	ld a,002h		;9b23
	jr L_9B29		;9b25
L_9B27:
	ld a,001h		;9b27
L_9B29:
	ld (hl),a			;9b29   ; con 0xCAAA, uno mas
	ld a,(0caaah)		;9b2a   ; lee en la zona 6: lo ponen los dos disparos (el 2 apretado y el 1 recien pulsado), lo quita cualquiera
	or a			;9b2d
	ret z			;9b2e
	inc (hl)			;9b2f
	ret			;9b30
barra_si_cambia:		; B = el 0xCB3F de antes
	ld a,(0cb3fh)		;9b31   ; lee en la zona 6, lo que hay bajo Snake: 1 con los caracteres 0x90-0xB3, 2 con 0xB8-0xDB (3 con 0xCAAA)
	cp 002h		;9b34
	jr c,L_9B47		;9b36
	cp b			;9b38   ; el mismo: nada
	ret z			;9b39
	ccf			;9b3a
	ret nc			;9b3b
	ld a,001h		;9b3c   ; de menos a 2 o mas: la barra de la derecha aparece (0xCAE2 = 1)
	ld (0cae2h),a		;9b3e   ; guarda 1 mientras se ve la barra de la derecha
	call 07048h		;9b41   ; p01:7048
	jp 0431eh		;9b44   ; y se pinta
L_9B47:
	dec b			;9b47   ; de 2 o mas a menos...
	dec b			;9b48
	ld a,001h		;9b49
	cp b			;9b4b
	ret nc			;9b4c
	call 04309h		;9b4d   ; ...se borra la franja
	ld a,(0cac4h)		;9b50   ; la barra otra vez llena (0xCAC4)
	ld (0cac5h),a		;9b53   ; guarda la barra de la derecha: con 0xCB3F >= 2 baja dos puntos cada 16 cuadros
	ld a,040h		;9b56   ; 0xCAE6 = 0x40
	ld (0cae6h),a		;9b58
	xor a			;9b5b   ; 0xCAE2 = 0: sin barra
	ld (0cae2h),a		;9b5c   ; guarda 1 mientras se ve la barra de la derecha
	ret			;9b5f
gasta_la_barra:		; con 0xCB3F >= 2, cada 16 cuadros (0xCA98)...
	ld hl,0ca98h		;9b60   ; apunta a la espera de 16 cuadros de la barra de la derecha
	ld a,(0cb3fh)		;9b63   ; lee en la zona 6, lo que hay bajo Snake: 1 con los caracteres 0x90-0xB3, 2 con 0xB8-0xDB (3 con 0xCAAA)
	cp 002h		;9b66
	jr c,L_9BA1		;9b68
	dec (hl)			;9b6a
	ret nz			;9b6b
	ld (hl),010h		;9b6c   ; ...otra vez 16
	ld hl,0cac5h		;9b6e   ; la barra de la derecha...
	ld a,(hl)			;9b71
	or a			;9b72
	jr z,L_9B7A		;9b73
	dec (hl)			;9b75   ; ...baja dos puntos
	dec (hl)			;9b76
	jp 0431eh		;9b77   ; barra_derecha_cac4: la barra de la derecha de 0xCAC5 (con 0xCAE2 puesto)
L_9B7A:
	call baja_la_vida		;9b7a   ; vacia: baja la vida
	jp 04288h		;9b7d   ; barras_de_vida: la barra de vida y, con 0xCA5F, p04:9889
baja_la_vida:		; la vida baja dos puntos...
	ld hl,0ca53h		;9b80   ; apunta a la vida de Snake (lo largo de la barra)
	dec (hl)			;9b83
	dec (hl)			;9b84
	ld a,(hl)			;9b85
	cp 0f0h		;9b86   ; ...sin pasar de 0
	jr c,L_9B8C		;9b88
	xor a			;9b8a
	ld (hl),a			;9b8b
L_9B8C:
	ld a,(0ca53h)		;9b8c   ; sin vida...
	or a			;9b8f
	ret nz			;9b90
	call a_p10_bfbc		;9b91   ; ...p10:BFBC...
	ld a,(0ca53h)		;9b94   ; ...y si sigue sin vida...
	or a			;9b97
	ret nz			;9b98
	ld a,01bh		;9b99   ; ...el estado 0x1B...
	ld (0cb00h),a		;9b9b   ; guarda el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	jp 06ba0h		;9b9e   ; ...y p01:6BA0
L_9BA1:
	ld (hl),010h		;9ba1   ; 0xCA98 = 16
	ret			;9ba3
empuje:		; p06:A387
	call L_8AE7		;9ba4
	ld a,(0cb3fh)		;9ba7   ; lee en la zona 6, lo que hay bajo Snake: 1 con los caracteres 0x90-0xB3, 2 con 0xB8-0xDB (3 con 0xCAAA)
	or a			;9baa
	ret z			;9bab
	ld de,00400h		;9bac   ; el empuje: 4 puntos por cuadro...
	ld a,(0cb21h)		;9baf   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	cp 006h		;9bb2
	jr z,L_9BBE		;9bb4
	ld a,(0cb3fh)		;9bb6   ; ...o 2 con 0xCB3F = 1 (salvo con 0xCB21 = 6)
	dec a			;9bb9
	jr nz,L_9BBE		;9bba
	ld d,002h		;9bbc
L_9BBE:
	ld a,(0ca8fh)		;9bbe   ; hacia donde dice 0xCA8F (1-4)
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
	call 04442h		;9bcf   ; hacia arriba
L_9BD2:
	jp suma_a_y		;9bd2   ; la Y + DE
L_9BD5:
	call 04442h		;9bd5   ; hacia la izquierda
L_9BD8:
	jp suma_a_x		;9bd8   ; la X + DE
a_p06_a387:		; p06:A387 con el banco 6 en 0xA000
	call 041a0h		;9bdb   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a387h		;9bde   ; empuje_de_la_sala: con Snake dentro (Y y X por debajo de 0xC0): 0xCA8F = 0 y, en p06:BB76 (fichas de 6 bytes ordenadas por sala), las de esta sala (p06:A3B2) hasta que una empuja
	jp 040f0h		;9be1   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
rastro_de_snake:		; con 0xCAA0, guarda la Y, la X y la direccion de Snake en 0xE080 (el rastro)
	ld a,(0caa0h)		;9be4   ; lee cuantos siguen a Snake por su rastro (1-4)
	or a			;9be7
	ret z			;9be8
	push de			;9be9
	ld hl,0e0ach		;9bea   ; el rastro tres bytes atras...
	ld de,0e0afh		;9bed
	ld bc,0002dh		;9bf0
	lddr		;9bf3
	pop de			;9bf5
	ld hl,0e080h		;9bf6   ; ...y en 0xE080 la Y...
	ld (hl),e			;9bf9
	inc hl			;9bfa
	ld (hl),d			;9bfb   ; ...la X...
	inc hl			;9bfc
	ld a,(0cb0eh)		;9bfd   ; lee la direccion en la que va Snake (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ld (hl),a			;9c00
	ret			;9c01
pisa_algo:		; en la especial 0x38 sala 1 (p06:BD9B), la zona 0x12 (p06:BD7D) o la 0x13 (p06:BD8E): lo que pisan Snake o 0xCB80
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
	xor a			;9c27   ; 0xE25E = 0
	ld (0e25eh),a		;9c28
	call 041a0h		;9c2b   ; mira la lista (p02:9CF4)
	call lista_de_pisar		;9c2e   ; lista_de_pisar: fichas de 4 bytes [sala][tipo][Y][X] hasta 0xFF
	call 040f0h		;9c31   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	ld a,(0e25eh)		;9c34   ; 0xE25E = 0: nada
	or a			;9c37
	ret z			;9c38
	bit 1,a		;9c39   ; el bit 1: 0xCB80 = 0 y p01:6C6B
	call nz,cb80_a_cero		;9c3b   ; cb80_a_cero: 0xCB80 = 0 y p01:6C6B
	ld a,(0e25eh)		;9c3e   ; el bit 0...
	rra			;9c41
	ret nc			;9c42
	ld a,(0cb21h)		;9c43   ; ...con 0xCB21 = 0x20 y sin 0xCAB6: p02:9C65
	cp 020h		;9c46
	jr nz,L_9C50		;9c48
	ld a,(0cab6h)		;9c4a
	or a			;9c4d
	jr z,pisa_con_cb21_20		;9c4e
L_9C50:
	ld a,013h		;9c50   ; si no, el estado 0x13...
	ld (0cb00h),a		;9c52   ; guarda el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	ld a,(0cb35h)		;9c55   ; ...con el dibujo del bit 0 de 0xCB35
	and 001h		;9c58
	ld (0cb01h),a		;9c5a   ; guarda el dibujo de Snake (al darse la vuelta se le suma 1, 3 o 5 segun 0xCB00)
	ret			;9c5d
cb80_a_cero:		; 0xCB80 = 0 y p01:6C6B
	xor a			;9c5e
	ld (0cb80h),a		;9c5f   ; guarda las 6 fichas de 16 bytes de lo que lanza Snake ([tipo][..][Y 8.8][X 8.8][velocidades]...)
	jp 06c6bh		;9c62   ; sonido_53: pide el sonido 0x53
pisa_con_cb21_20:		; p01:6ACE
	call 06aceh		;9c65   ; sonido_44: pide el sonido 0x44
	call apunta_lo_pisado		;9c68   ; apunta_lo_pisado: el nibble bajo de B...
	call mosaico_de_lo_pisado		;9c6b   ; mosaico_de_lo_pisado: el nibble alto de B: el mosaico de p06:BD1B...
	call mira_d6b4		;9c6e   ; mira_d6b4: con 0xD6B4 puesto...
	ld hl,0d7d8h		;9c71   ; el bit 6 de 0xD7D8 a uno...
	set 6,(hl)		;9c74
	ld hl,0d7dfh		;9c76   ; ...y el 3 de 0xD7DF a cero
	res 3,(hl)		;9c79
	ret			;9c7b
mira_d6b4:		; con 0xD6B4 puesto...
	ld hl,0d6b4h		;9c7c
	ld a,(hl)			;9c7f
	or a			;9c80
	ret z			;9c81
	push hl			;9c82
	ld a,(0cb21h)		;9c83   ; ...p03:BEB7 y p03:BEB2 con 0xCB21...
	call 0beb7h		;9c86   ; gasta_una_d638: la cosa A de 0xD638 una menos; a cero, no la tiene
	ld a,(0cb21h)		;9c89   ; lee lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	call 0beb2h		;9c8c   ; tiene_cuenta_d638: acarreo si la cuenta de la cosa A de 0xD638 es 0
	pop hl			;9c8f
	ret nc			;9c90   ; ...con acarreo, 0xD6B4 = 0xCB21 = 0...
	xor a			;9c91
	ld (hl),a			;9c92
	ld (0cb21h),a		;9c93   ; guarda lo elegido de la segunda tabla (0xCB21; las 0x20-0x22 llevan cuenta)
	ld hl,0d8a4h		;9c96   ; ...y p10:B3E5 con 0xD8A4
	jp a_p10_b3e5		;9c99   ; a_p10_b3e5: p10:B3E5 con el banco 10 en 0xA000
apunta_lo_pisado:		; el nibble bajo de B...
	push bc			;9c9c
	push de			;9c9d
	ld a,b			;9c9e
	and 00fh		;9c9f
	or a			;9ca1
	call z,bits_de_lo_pisado_0		;9ca2   ; ...0: p02:9CCD
	push af			;9ca5
	call bits_de_lo_pisado		;9ca6   ; los bits de 0xD7DE/0xD7E4 (p02:9CB8)
	pop af			;9ca9
	add a,070h		;9caa   ; + 0x70...
	call 040f0h		;9cac   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b0d3h		;9caf   ; ...p03:B0D3
	call 041a0h		;9cb2   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	pop de			;9cb5
	pop bc			;9cb6
	ret			;9cb7
bits_de_lo_pisado:		; A = 0: el bit 0 de 0xD7DE; 1: el 0 de 0xD7E4; 2: el 1 de 0xD7E4
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
bits_de_lo_pisado_0:		; el bit 7 de 0xD7F1 a cero y el 5 de 0xD7D8 a uno
	push hl			;9ccd
	ld hl,0d7f1h		;9cce   ; el bit 7 de 0xD7F1 a cero
	res 7,(hl)		;9cd1
	ld hl,0d7d8h		;9cd3   ; el bit 5 de 0xD7D8 a uno
	set 5,(hl)		;9cd6
	pop hl			;9cd8
	ret			;9cd9
mosaico_de_lo_pisado:		; el nibble alto de B: el mosaico de p06:BD1B...
	ld a,b			;9cda
	rra			;9cdb
	rra			;9cdc
	rra			;9cdd
	rra			;9cde
	and 00fh		;9cdf
	ld hl,0bd1bh		;9ce1
	call 041a0h		;9ce4   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 043f6h		;9ce7   ; palabra_de_tabla: HL = la palabra A de la tabla de HL
	ld b,(hl)			;9cea   ; ...[filas][columnas] y los caracteres...
	inc hl			;9ceb
	ld c,(hl)			;9cec
	inc hl			;9ced
	call 05094h		;9cee   ; ...forma 8 en la franja 0
	jp 040f0h		;9cf1   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
lista_de_pisar:		; fichas de 4 bytes [sala][tipo][Y][X] hasta 0xFF
	ld a,(hl)			;9cf4
	cp 0ffh		;9cf5
	ret z			;9cf7
	push hl			;9cf8
	ld a,(0ca4bh)		;9cf9   ; la sala
	cp (hl)			;9cfc
	jr nz,L_9D2F		;9cfd
	inc hl			;9cff
	ld b,(hl)			;9d00   ; B = el tipo
	push bc			;9d01
	inc hl			;9d02
	ld e,(hl)			;9d03   ; DE = la Y y la X
	inc hl			;9d04
	ld d,(hl)			;9d05
	push de			;9d06
	call lo_pisan		;9d07   ; lo pisan? (p02:9D36)
	pop de			;9d0a
	pop bc			;9d0b
	ld hl,0e25eh		;9d0c   ; 0xE25E = 0: no
	ld a,(hl)			;9d0f
	or a			;9d10
	jr z,L_9D2F		;9d11
	ld a,b			;9d13   ; si: el nibble bajo + 0x70...
	and 00fh		;9d14
	add a,070h		;9d16
	push bc			;9d18
	push de			;9d19
	call 040f0h		;9d1a   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0b0feh		;9d1d   ; ...p03:B0FE: si ya estaba, 0xE25E = 0
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
	ld de,00004h		;9d30   ; la ficha siguiente
	add hl,de			;9d33
	jr lista_de_pisar		;9d34
lo_pisan:		; el nibble alto del tipo (menos 3 si pasa de 2)...
	ld a,b			;9d36
	rra			;9d37   ; el nibble alto del tipo
	rra			;9d38
	rra			;9d39
	rra			;9d3a
	and 00fh		;9d3b
	cp 003h		;9d3d   ; de 3 en adelante, tres menos
	jr c,L_9D43		;9d3f
	sub 003h		;9d41
L_9D43:
	add a,a			;9d43   ; ...el tamano de p02:9DA2
	ld hl,09da2h		;9d44
	call 0423eh		;9d47   ; suma_a_hl: HL = HL + A
	push hl			;9d4a
	push de			;9d4b
	ld a,(0cb03h)		;9d4c   ; con la Y...
	ld (0d8f0h),a		;9d4f
	ld a,(0cb05h)		;9d52   ; ...y la X de Snake
	ld (0d8f1h),a		;9d55
	ld b,001h		;9d58   ; B = 1: Snake
	call L_9D7A		;9d5a
	pop de			;9d5d
	pop hl			;9d5e
	ld a,(0cb80h)		;9d5f   ; con 0xCB80 = 8, tambien con la suya
	cp 008h		;9d62
	ret nz			;9d64
	ld a,(0cb83h)		;9d65
	ld (0d8f0h),a		;9d68
	ld a,(0cb85h)		;9d6b
	ld (0d8f1h),a		;9d6e
	ld a,(0e25eh)		;9d71
	or a			;9d74
	ld b,002h		;9d75   ; B = 2 o 3
	jr z,L_9D7A		;9d77
	inc b			;9d79
L_9D7A:
	ld a,(0d8f0h)		;9d7a   ; la Y por encima de E...
	cp e			;9d7d
	ret c			;9d7e
	ld a,(0d8f1h)		;9d7f   ; ...y la X + 2 por encima de D...
	add a,002h		;9d82
	cp d			;9d84
	ret c			;9d85
	call suma_tamano		;9d86   ; ...el otro rincon...
	ld a,(0d8f0h)		;9d89   ; ...la Y por debajo...
	cp e			;9d8c
	ret nc			;9d8d
	ld a,(0d8f1h)		;9d8e   ; ...y la X - 2 por debajo
	sub 002h		;9d91
	cp d			;9d93
	ret nc			;9d94
	ld a,b			;9d95   ; dentro: 0xE25E = B
	ld (0e25eh),a		;9d96
	ret			;9d99
suma_tamano:		; E + (HL), D + (HL + 1)
	ld a,e			;9d9a
	add a,(hl)			;9d9b   ; la Y + el alto
	ld e,a			;9d9c
	inc hl			;9d9d
	ld a,d			;9d9e
	add a,(hl)			;9d9f   ; la X + el ancho
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


a_p06_a330:		; p06:A330 con el banco 6 en 0xA000
	call 041a0h		;9da8   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a330h		;9dab   ; caja_de_bda4: busca en p06:BDA4 (fichas de 9 bytes: zona, sala, Y de-hasta, X de-hasta y 3 bytes; zona 0x32 = la sala especial 0x32) la caja en la que esta Snake: copia sus 3 bytes a 0xCAA5, A = la X final - 0x10 (en multiplos de 8) y acarreo
	jp 040f0h		;9dae   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
llama_6e0d_a3c8:		; p01:6E0D y p06:A3C8
	call 06e0dh		;9db1   ; rachas_bba0: las rachas de p41:BBA0 con su destino
	call 041a0h		;9db4   ; bancos_6: pone el 6 en 0xA000 (con su copia en 0xC381-0xC383)
	call 0a3c8h		;9db7   ; sin_equipo: 0xCB4B-0xCB4E = 1, 4, 0, 0x10; 0xCAB6 = 0, 0xCB3C = 1, el bit 7 de 0xD8D9 y los bits 2-7 de 0xD8D8; a cero partes de lo que lleva (0xD600-0xD61F, 0xD624-0xD627, 0xD62C-0xD637, 0xD650-0xD653, 0xD66C-0xD673, 0xD6A8-0xD6AF y 0xD6C0-0xD6C3)
	jp 040f0h		;9dba   ; bancos_1_2_3: pone el 1 en 0x6000, el 2 en 0x8000, el 3 en 0xA000 (con su copia en 0xC381-0xC383)
que_hay_conectado:		; 0xC38B: bit 0 = hay disquetera (0xFFA7 no es un ret), bit 1 = hay Game Master 2
	ld b,000h		;9dbd
	ld a,(0ffa7h)		;9dbf
	cp 0c9h		;9dc2
	jr z,L_9DC7		;9dc4
	inc b			;9dc6
L_9DC7:
	ld a,(0c38ah)		;9dc7   ; 0xC38A = 0xFF: sin Game Master 2
	inc a			;9dca
	jr z,L_9DCF		;9dcb
	set 1,b		;9dcd
L_9DCF:
	ld a,b			;9dcf
	ld (0c38bh),a		;9dd0   ; guarda bit 0: hay disquetera; bit 1: hay Game Master 2
	ret			;9dd3
busca_gm2:		; busca en los 4 slots (y sus subslots) un cartucho con "YZ" en 0x4010: el Game Master 2; 0xC38A = su slot o 0xFF
	ld bc,00400h		;9dd4
	ld hl,0fcc1h		;9dd7   ; la tabla de slots expandidos de la BIOS
L_9DDA:
	push bc			;9dda
	push hl			;9ddb
	ld a,(hl)			;9ddc
	bit 7,a		;9ddd   ; expandido?
	jr nz,L_9DE7		;9ddf
	ld a,c			;9de1   ; no: el slot tal cual
	call es_gm2		;9de2   ; es_gm2: el slot que se mira
	jr L_9DEA		;9de5
L_9DE7:
	call busca_gm2_subslots		;9de7   ; si: sus cuatro subslots
L_9DEA:
	pop hl			;9dea
	pop bc			;9deb
	ret c			;9dec
	inc hl			;9ded
	inc c			;9dee
	djnz L_9DDA		;9def
	ld a,0ffh		;9df1   ; no esta
	ld (0c38ah),a		;9df3   ; guarda el slot del Game Master 2 (0xFF: no hay)
	ret			;9df6
busca_gm2_subslots:		; el bit 7 de expandido con el slot...
	and 080h		;9df7
	or c			;9df9
	ld b,004h		;9dfa   ; ...y los 4 subslots
L_9DFC:
	push bc			;9dfc
	call es_gm2		;9dfd   ; es_gm2: el slot que se mira
	pop bc			;9e00
	ret c			;9e01
	add a,004h		;9e02   ; el siguiente subslot
	djnz L_9DFC		;9e04
	ret			;9e06
es_gm2:		; el slot que se mira
	ld (0c38ah),a		;9e07   ; guarda el slot del Game Master 2 (0xFF: no hay)
	ld hl,04010h		;9e0a   ; 0x4010...
	call 0000ch		;9e0d   ; BIOS RDSLT - Reads the value of an address in another slot
	cp 059h		;9e10   ; ...es 'Y'?
	jr nz,L_9E26		;9e12
	ld hl,04011h		;9e14   ; 0x4011...
	ld a,(0c38ah)		;9e17   ; lee el slot del Game Master 2 (0xFF: no hay)
	call 0000ch		;9e1a   ; BIOS RDSLT - Reads the value of an address in another slot
	cp 05ah		;9e1d   ; ...es 'Z'?
	jr nz,L_9E26		;9e1f
	ld a,(0c38ah)		;9e21   ; lee el slot del Game Master 2 (0xFF: no hay)
	scf			;9e24   ; si: con acarreo
	ret			;9e25
L_9E26:
	ld a,(0c38ah)		;9e26   ; lee el slot del Game Master 2 (0xFF: no hay)
	and a			;9e29
	ret			;9e2a
partida_nueva:		; la partida desde el principio
	ld d,001h		;9e2b
	call 04be4h		;9e2d   ; la pagina 1 borrada
	call 07206h		;9e30   ; p01:7206
	call paleta_comun		;9e33   ; paleta_comun: la paleta de p56:B945
	call 04276h		;9e36   ; marcador_entero: p01:6DFF y el marcador (p00:4279)
	call 04459h		;9e39   ; llena_pantalla_99: 0xC0 x 0xC0 puntos al color 9 en la pagina de dibujar
	call 04606h		;9e3c   ; pantalla y sprites
	call pantalla_del_marcador		;9e3f   ; pantalla_del_marcador: el marcador entero: p01:6DDA, p02:850C, el mosaico de p56:A03C, p01:6DCF, p02:831F y p01:722C
	call 04bech		;9e42   ; piezas_en_pagina_2: borra la pagina 2...
	call 06ee9h		;9e45   ; p01:6EE9
	call rachas_b7a1		;9e48   ; rachas_b7a1:
	ld hl,00701h		;9e4b   ; la fila 1, columna 7
	ld (0ca50h),hl		;9e4e   ; guarda la fila de la sala en la zona (uno mas al salir por arriba) y el byte siguiente (16 bits)
	ld hl,0ca89h		;9e51   ; 0xCA89 = 2
	ld (hl),002h		;9e54
	ld hl,0d7f1h		;9e56   ; el bit 7 de 0xD7F1 a uno
	set 7,(hl)		;9e59
	ld hl,00000h		;9e5b   ; 0xCA5F = 0xCA60 = 0
	ld (0ca5fh),hl		;9e5e   ; guarda la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna y el byte siguiente (16 bits)
	xor a			;9e61   ; la pagina 0, la zona 0, 0xCAAD = 0 y la fase 0
	ld (0ca42h),a		;9e62   ; guarda la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	ld (0ca4ah),a		;9e65   ; guarda la zona
	ld (0caadh),a		;9e68
	ld (0ca22h),a		;9e6b   ; guarda la fase de la partida (indice de las listas de p06:B40C)
	inc a			;9e6e   ; 0xCABA = 1
	ld (0cabah),a		;9e6f
	ld a,01ch		;9e72   ; 0xE20B = 0x1C
	ld (0e20bh),a		;9e74
	ld a,005h		;9e77   ; 0xCA7A = 5
	ld (0ca7ah),a		;9e79
	call 06f78h		;9e7c   ; p01:6F78
	call a_p06_a0ab		;9e7f   ; a_p06_a0ab: p06:A0AB con el banco 6 en 0xA000
	call 0b0adh		;9e82   ; banderas_al_empezar: las banderas de 0xD7D0 (21 bytes) de p03:B0B9
	call empieza_la_partida		;9e85   ; lo comun de empezar (p02:9E94)
	call 052d2h		;9e88   ; entra en la primera sala
	ld hl,08a80h		;9e8b   ; la Y y la X guardadas: 0x80 y 0x8A
	ld (0c702h),hl		;9e8e
	jp 04365h		;9e91   ; marco_c4: p00:5F90 y las lineas de p00:439D, salvo en la zona 0x12 sala 8 con 0xD8A4
empieza_la_partida:		; sin 0xCA97, las rachas de p37
	ld a,(0ca97h)		;9e94   ; lee 1 si los mensajes salen de los bancos 50-51 y no de 48-49
	or a			;9e97
	call z,rachas_b007_af4c		;9e98   ; rachas_b007_af4c: p37:B007 y p37:AF4C, cada una con su destino
	ld hl,0ffffh		;9e9b   ; ninguna musica sonando
	ld (0ca20h),hl		;9e9e   ; guarda la rutina de la musica que suena (16 bits; p00:5B50)
	xor a			;9ea1   ; 0xC68E = 0
	ld (0c68eh),a		;9ea2
	dec a			;9ea5   ; 0xD44A = 0xFF
	ld (0d44ah),a		;9ea6
	ld hl,0d8d8h		;9ea9   ; 0xD8D8-0xD8DF a cero
	ld bc,00007h		;9eac
	call 04236h		;9eaf   ; borra_bloque: pone a cero BC + 1 bytes desde HL
	call prepara_d770		;9eb2   ; las cosas dejadas a 0xFF
	call a_p07_a000		;9eb5   ; a_p07_a000: p07:A000 con el banco 7 en 0xA000
	call a_p07_a985		;9eb8   ; a_p07_a985: p07:A985 con el banco 7 en 0xA000
	call segun_d66c		;9ebb   ; lo que dicen las banderas de 0xD66C, 0xD670, 0xD674...
	call segun_d670		;9ebe   ; segun_d670: con 0xD670: 0xCA90 = 1 (4 con el bit 3 de 0xD7D7) y 0xCA91-0xCA92 = 0x0100
	call segun_d674		;9ec1   ; segun_d674: con 0xD674: 0xCA89 = 2 y 0xCA8C = 0x10; con el bit 3 de 0xD7D4, 0xCA89 = 0 y 0xCA8A = 0x4000; con el 2, 4 y 0x0200
	call segun_d7d5		;9ec4   ; ...de 0xD7D5...
	call segun_d7de		;9ec7   ; ...y de 0xD7DE, 0xD7E4
	call a_p09_b62f		;9eca   ; a_p09_b62f: p09:B62F con el banco 9 en 0xA000
	call 04266h		;9ecd   ; los sprites fuera
	call 051cah		;9ed0   ; las paletas de las salas de la zona
	call 05ba1h		;9ed3   ; los mapas de bits
	call lista_de_zona_a_d900		;9ed6   ; la lista de p30 de la zona a 0xD900
	call 05db3h		;9ed9   ; a_p12_68e3: p12:68E3 con el banco 12 en 0x6000
	call 05d9dh		;9edc
	call 05afeh		;9edf   ; guarda en 0xC700
	jp a_p06_a598		;9ee2   ; a_p06_a598: p06:A598 con el banco 6 en 0xA000
segun_d66c:		; con 0xD66C: 0xCA7B-0xCA7D = 1, 0x80, 0; o, con el bit 5 de 0xD7D7, 0xCA7B = 3 y p10:A234
	ld a,(0d66ch)		;9ee5
	or a			;9ee8
	ret z			;9ee9
	ld hl,0ca7bh		;9eea   ; 0xCA7B...
	ld a,(0d7d7h)		;9eed   ; con el bit 5 de 0xD7D7: p02:9EFD
	bit 5,a		;9ef0
	jr nz,L_9EFD		;9ef2
	ld (hl),001h		;9ef4   ; 0xCA7B = 1
	inc hl			;9ef6
	ld (hl),080h		;9ef7   ; 0xCA7C = 0x80
	inc hl			;9ef9
	ld (hl),000h		;9efa   ; 0xCA7D = 0
	ret			;9efc
L_9EFD:
	ld (hl),003h		;9efd   ; 0xCA7B = 3
	jp a_p10_a234		;9eff   ; a_p10_a234: p10:A234 con el banco 10 en 0xA000
segun_d670:		; con 0xD670: 0xCA90 = 1 (4 con el bit 3 de 0xD7D7) y 0xCA91-0xCA92 = 0x0100
	ld a,(0d670h)		;9f02
	or a			;9f05
	ret z			;9f06
	ld hl,0ca90h		;9f07   ; 0xCA90...
	ld a,(0d7d7h)		;9f0a   ; con el bit 3 de 0xD7D7...
	bit 3,a		;9f0d
	jr z,L_9F18		;9f0f
	ld b,004h		;9f11   ; ...4
	ld de,00100h		;9f13
	jr L_9F1D		;9f16
L_9F18:
	ld b,001h		;9f18   ; si no, 1
	ld de,00100h		;9f1a
L_9F1D:
	ld (hl),b			;9f1d   ; 0xCA90 = B
	inc hl			;9f1e
	ld (hl),e			;9f1f   ; 0xCA91-0xCA92 = DE
	inc hl			;9f20
	ld (hl),d			;9f21
	ret			;9f22
segun_d674:		; con 0xD674: 0xCA89 = 2 y 0xCA8C = 0x10; con el bit 3 de 0xD7D4, 0xCA89 = 0 y 0xCA8A = 0x4000; con el 2, 4 y 0x0200
	ld a,(0d674h)		;9f23
	or a			;9f26
	ret z			;9f27
	ld hl,0ca89h		;9f28   ; 0xCA89...
	ld a,(0d7d4h)		;9f2b   ; segun los bits 2 y 3 de 0xD7D4
	bit 2,a		;9f2e
	jr nz,L_9F47		;9f30
	bit 3,a		;9f32
	jr nz,L_9F3E		;9f34
	ld (hl),002h		;9f36   ; 0xCA89 = 2...
	ld hl,0ca8ch		;9f38
	ld (hl),010h		;9f3b   ; ...0xCA8C = 0x10
	ret			;9f3d
L_9F3E:
	ld (hl),000h		;9f3e   ; 0xCA89 = 0...
	ld hl,04000h		;9f40
	ld (0ca8ah),hl		;9f43   ; ...0xCA8A-0xCA8B = 0x4000
	ret			;9f46
L_9F47:
	ld (hl),004h		;9f47   ; 0xCA89 = 4...
	ld hl,00200h		;9f49
	ld (0ca8ah),hl		;9f4c   ; ...0xCA8A-0xCA8B = 0x0200
	ret			;9f4f
segun_d7d5:		; con el bit 3 (y sin el 2) de 0xD7D5: 0xCB39 = 1 y 0xCB3A = 0x0080
	ld a,(0d7d5h)		;9f50
	bit 2,a		;9f53
	ret nz			;9f55
	bit 3,a		;9f56
	ret z			;9f58
	ld hl,0cb39h		;9f59   ; 0xCB39 = 1
	ld (hl),001h		;9f5c
	ld hl,00080h		;9f5e   ; 0xCB3A-0xCB3B = 0x0080
	ld (0cb3ah),hl		;9f61
	ret			;9f64
segun_d7de:		; los bits de 0xD7FE: el 7 con el 0 de 0xD7DE, el 5 con el 0 de 0xD7E4, el 6 con el 1 de 0xD7E4
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
cambia_d4f5:		; si no sale de la sala, 0xD4F5 = 0xCB3F (2 como mucho) y, si cambia, p01:6CCA
	ld a,(0ca41h)		;9f7d   ; lee la salida de la sala (0 ninguna, 1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	or a			;9f80
	ret nz			;9f81
	ld hl,0d4f5h		;9f82
	ld a,(0cb3fh)		;9f85   ; 0xCB3F...
	cp 002h		;9f88
	jr c,L_9F8E		;9f8a
	ld a,002h		;9f8c   ; ...como mucho 2
L_9F8E:
	cp (hl)			;9f8e   ; el mismo: nada
	ret z			;9f8f
	ld (hl),a			;9f90
	jp 06ccah		;9f91   ; sonido_66: pide el sonido 0x66
cuenta_cb3a:		; con 0xCB39, sin 0xCA5F, chocando y sin 0xCB3C
	ld a,(0cb39h)		;9f94
	or a			;9f97
	ret z			;9f98
	ld a,(0ca5fh)		;9f99   ; lee la alerta: 2 cuando un actor ve a Snake (p04:8455, p14:B20B, con la musica 0x8C), 3 en ciertas salas, 1 despues (p04:9357); 0 ninguna
	or a			;9f9c
	ret nz			;9f9d
	ld a,(0cb0fh)		;9f9e   ; lee 1 si Snake ha chocado en este cuadro
	or a			;9fa1
	ret z			;9fa2
	ld a,(0cb3ch)		;9fa3
	or a			;9fa6
	ret nz			;9fa7
	ld a,(0cb3fh)		;9fa8   ; con 0xCB3F, 0xCB3A = 4
	or a			;9fab
	jr nz,L_9FD6		;9fac
	ld a,(0cb51h)		;9fae   ; con 0xCB51 = 1: p03:AF05 y 0xCB51 = 0
	dec a			;9fb1
	jr z,L_9FDD		;9fb2
	ld hl,(0cb3ah)		;9fb4   ; 0xCB3A un cuadro menos...
	dec hl			;9fb7
	ld (0cb3ah),hl		;9fb8
	ld a,l			;9fbb
	or h			;9fbc
	ret nz			;9fbd
	ld hl,00100h		;9fbe   ; ...a cero: otra vez 0x100...
	ld (0cb3ah),hl		;9fc1
	ld hl,0cb51h		;9fc4   ; ...0xCB51 uno mas...
	inc (hl)			;9fc7
	ld a,(0cb03h)		;9fc8   ; ...y en la Y y la X de Snake...
	ld e,a			;9fcb
	ld a,(0cb05h)		;9fcc   ; lee la X de Snake
	ld d,a			;9fcf
	call 079abh		;9fd0   ; ...p04:9CEE...
	jp 06a8fh		;9fd3   ; ...y p01:6A8F
L_9FD6:
	ld hl,00004h		;9fd6
	ld (0cb3ah),hl		;9fd9
	ret			;9fdc
L_9FDD:
	call 0af05h		;9fdd   ; d446_si: con 0xCA5F < 2, 0xD446 = 4
	ld hl,0cb51h		;9fe0
	ld (hl),000h		;9fe3
	ret			;9fe5
pon_cb3d:		; salvo en el estado 0x14: 0xCB3D = 1 y 0xCB3E = 16 (si no estaba)
	ld a,(0cb00h)		;9fe6   ; lee el estado de Snake (2, 9, 0x0A, 0x0B...: cambia sus bordes y sus choques)
	cp 014h		;9fe9   ; el estado 0x14: nada
	ret z			;9feb
	ld hl,0cb3dh		;9fec   ; 0xCB3D...
	ld a,(hl)			;9fef
	or a			;9ff0
	ret nz			;9ff1   ; ...si ya esta, nada
	inc (hl)			;9ff2   ; 0xCB3D = 1...
	inc hl			;9ff3
	ld (hl),010h		;9ff4   ; ...0xCB3E = 16
	ret			;9ff6
cuenta_cb3d:		; con 0xCB3D, 0xCB3E un cuadro menos
	ld hl,0cb3dh		;9ff7   ; 0xCB3D...
	ld a,(hl)			;9ffa
	or a			;9ffb   ; ...sin el, nada
	ret z			;9ffc
	inc hl			;9ffd
	dec (hl)			;9ffe   ; 0xCB3E un cuadro menos
	ret nz			;9fff
