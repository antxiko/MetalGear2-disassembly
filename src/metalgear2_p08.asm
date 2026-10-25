; ==========================================================================
; METAL GEAR 2 SOLID SNAKE - Konami (1990) - MSX2 - MegaROM RC-767 de 512 KB (Konami SCC) - banco 08 (se ejecuta en 0xa000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x0a000


; ----------------------------------------------------------------------
; DATOS sin identificar  0xa000..0xa0e6  (230 bytes)
DATA_A000:
	defb 021h,022h,0d4h,034h,0ddh,07eh,001h,0cdh,04dh,042h,026h,0a0h,032h,0a0h,03ch,0a0h	; a000  !".4.~..MB&.2.<.
	defb 086h,0a0h,055h,0a0h,0a9h,0a0h,0b0h,0a0h,07eh,0a0h,0cdh,08eh,0d9h,08eh,044h,0a0h	; a010  ..U.....~.....D.
	defb 086h,0a0h,0c7h,0a0h,0bbh,0a0h,0afh,032h,022h,0d4h,03ch,0cdh,037h,08eh,0ddh,034h	; a020  .......2".<.7..4
	defb 001h,0c9h,0ddh,036h,00ch,001h,0cdh,0c5h,081h,0c3h,02eh,0a0h,0ddh,07eh,003h,0feh	; a030  ...6.........~..
	defb 070h,0dah,079h,0a0h,0ddh,036h,00dh,004h,0ddh,036h,00eh,030h,0afh,0ddh,077h,00ch	; a040  p.y..6...6.0..w.
	defb 0ddh,077h,00fh,018h,0d9h,03ah,05fh,0cah,0a7h,006h,02ch,028h,002h,006h,030h,0ddh	; a050  .w...:_...,(..0.
	defb 07eh,007h,017h,030h,014h,0ddh,07eh,003h,0b8h,030h,00eh,03ah,04bh,0cah,0feh,009h	; a060  ~..0..~..0.:K...
	defb 020h,0bch,03eh,001h,032h,009h,0d5h,018h,0b5h,006h,006h,0c3h,022h,090h,0ddh,036h	; a070   .>.2......."..6
	defb 001h,004h,0afh,0c3h,037h,08eh,0ddh,035h,00eh,028h,01ah,0ddh,07eh,00eh,0e6h,007h	; a080  ....7..5.(..~...
	defb 0c0h,0ddh,07eh,00fh,03ch,0e6h,003h,0ddh,077h,00fh,021h,0ach,0a0h,0cdh,03eh,042h	; a090  ..~.<...w.!...>B
	defb 07eh,0ddh,077h,00dh,0c9h,0afh,0cdh,037h,08eh,0c3h,02eh,0a0h,004h,005h,004h,006h	; a0a0  ~.w....7........
	defb 0cdh,073h,082h,0cdh,0f3h,080h,0ddh,036h,001h,00dh,0c9h,0afh,032h,016h,0d4h,03eh	; a0b0  .s.....6....2..>
	defb 020h,032h,017h,0d4h,0c3h,04ch,083h,0ddh,07eh,01eh,0cdh,037h,08eh,0ddh,07eh,024h	; a0c0   2...L..~..7..~$
	defb 0ddh,077h,003h,0ddh,07eh,025h,0ddh,077h,005h,0ddh,07eh,021h,0ddh,077h,001h,0ddh	; a0d0  .w..~%.w..~!.w..
	defb 07eh,023h,0ddh,077h,00ch,0c9h	; a0e0

; ======================================================================
; CODIGO 0xa0e6..0xa1d6  (240 bytes)
; ======================================================================


L_A0E6:
	ld hl,0d7e1h		;a0e6
	res 3,(hl)		;a0e9
	ld hl,0ca42h		;a0eb
	ld a,(hl)			;a0ee
	push af			;a0ef
	push hl			;a0f0
	xor 001h		;a0f1
	ld (hl),a			;a0f3
	call L_A0FB		;a0f4
	pop hl			;a0f7
	pop af			;a0f8
	ld (hl),a			;a0f9
	ret			;a0fa
L_A0FB:
	ld a,(0ca4bh)		;a0fb
	ld b,a			;a0fe
	ld a,(0ca4ah)		;a0ff
	cp 003h		;a102
	jr z,L_A11B		;a104
	cp 004h		;a106
	ret nz			;a108
	ld a,b			;a109
	ld hl,0cacch		;a10a
	cp 005h		;a10d
	jr z,L_A136		;a10f
	inc hl			;a111
	cp 00eh		;a112
	jr z,L_A136		;a114
	cp 013h		;a116
	ret nz			;a118
	jr L_A136		;a119
L_A11B:
	ld hl,0cacbh		;a11b
	ld a,(0ca76h)		;a11e
	cp 00ch		;a121
	jr z,L_A136		;a123
	and a			;a125
	ret nz			;a126
	ld a,b			;a127
	ld hl,0cac9h		;a128
	and a			;a12b
	jr z,L_A136		;a12c
	cp 005h		;a12e
	jr z,L_A136		;a130
	cp 010h		;a132
	ret nz			;a134
	inc hl			;a135
L_A136:
	ld a,(hl)			;a136
	and a			;a137
	jp z,07a5fh		;a138
L_A13B:
	ld a,(0ca4ah)		;a13b
	sub 003h		;a13e
	cp 002h		;a140
	ret nc			;a142
	ld b,a			;a143
	ld a,(0cb21h)		;a144
	cp 003h		;a147
	jr nz,L_A14E		;a149
	jp 071fah		;a14b
L_A14E:
	ld a,(0ca42h)		;a14e
	push bc			;a151
	call 04452h		;a152
	pop bc			;a155
	ld hl,0d7e1h		;a156
	set 3,(hl)		;a159
	ld a,b			;a15b
	and a			;a15c
	jr nz,L_A17C		;a15d
	ld a,(0ca76h)		;a15f
	cp 00ch		;a162
	ld de,08828h		;a164
	jr z,L_A177		;a167
	ld a,(0ca4bh)		;a169
	and a			;a16c
	ld de,04888h		;a16d
	jr z,L_A177		;a170
	cp 010h		;a172
	ld d,0a8h		;a174
	ret nz			;a176
L_A177:
	ld a,053h		;a177
	jp 04a2ch		;a179
L_A17C:
	ld a,(0ca4bh)		;a17c
	cp 00eh		;a17f
	ld de,01048h		;a181
	jr z,L_A177		;a184
	ret			;a186
L_A187:
	ld hl,0d7e1h		;a187
	res 3,(hl)		;a18a
	call 07c0eh		;a18c
	call 045cch		;a18f
	call 05debh		;a192
	call 045c5h		;a195
	call 07c1ah		;a198
	call L_A1CB		;a19b
	call 045cch		;a19e
	call L_A1CB		;a1a1
	call 045c5h		;a1a4
	call L_A1CB		;a1a7
	call 045cch		;a1aa
	call L_A1CB		;a1ad
	call 045c5h		;a1b0
	ld a,(0ca4ah)		;a1b3
	cp 004h		;a1b6
	ret nz			;a1b8
	ld a,(0ca51h)		;a1b9
	cp 009h		;a1bc
	ret nz			;a1be
	ld a,(0ca5fh)		;a1bf
	and a			;a1c2
	ret nz			;a1c3
	call 0929ah		;a1c4
	ret nc			;a1c7
	jp 09949h		;a1c8
L_A1CB:
	ld bc,01000h		;a1cb
L_A1CE:
	push bc			;a1ce
	pop bc			;a1cf
	dec bc			;a1d0
	ld a,b			;a1d1
	or c			;a1d2
	jr nz,L_A1CE		;a1d3
	ret			;a1d5

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa1d6..0xa7da  (1540 bytes)
DATA_A1D6:
	defb 0ddh,07eh,001h,0d6h,008h,0cah,0cdh,08eh,0cah,0d9h,08eh,0ddh,07eh,000h,017h,0d8h	; a1d6  .~..........~...
	defb 03ah,05fh,0cah,0feh,002h,0c0h,0ddh,04eh,001h,0c3h,016h,08fh,0ddh,07eh,001h,0feh	; a1e6  :_.....N.....~..
	defb 008h,0cah,0cdh,08eh,0feh,009h,0cah,0d9h,08eh,0cdh,04dh,042h,00eh,0a2h,025h,0a2h	; a1f6  ..........MB..%.
	defb 015h,0a3h,051h,0a3h,0d1h,0a3h,0e5h,0a3h,03eh,003h,0cdh,037h,08eh,0afh,0ddh,077h	; a206  ..Q.....>..7...w
	defb 00fh,032h,031h,0d4h,03ch,0ddh,077h,02ch,0cdh,01dh,059h,0ddh,034h,001h,0c9h,0cdh	; a216  .21.<.w,..Y.4...
	defb 000h,081h,028h,006h,03ah,031h,0d4h,0a7h,028h,04ch,0cdh,00bh,090h,0cdh,0c7h,0a2h	; a226  ..(.:1..(L......
	defb 0ddh,04eh,003h,0ddh,046h,005h,0ddh,07eh,00dh,087h,0e6h,00ch,021h,005h,0a3h,0cdh	; a236  .N..F..~....!...
	defb 03eh,042h,0cdh,0ach,0a2h,038h,034h,0cdh,0ach,0a2h,038h,02fh,0ddh,07eh,02bh,0a7h	; a246  >B...84...8/.~+.
	defb 028h,005h,0cdh,0d5h,0a2h,030h,024h,0cdh,0e6h,080h,0d8h,0ddh,07eh,00dh,00fh,0e6h	; a256  (....0$.....~...
	defb 003h,03ch,032h,032h,0d4h,0ddh,07eh,019h,0feh,005h,03eh,02dh,020h,002h,03eh,001h	; a266  .<22..~...>- .>.
	defb 032h,031h,0d4h,0c3h,01dh,059h,0afh,032h,000h,0d3h,0c9h,0ddh,07eh,019h,0feh,005h	; a276  21...Y.2....~...
	defb 0d2h,055h,0a3h,0ddh,07eh,02ch,0a7h,0c2h,055h,0a3h,0ddh,036h,00ch,000h,0c3h,03eh	; a286  .U..~,..U..6...>
	defb 0a3h,0ddh,07eh,003h,0e6h,0f8h,0f6h,00ah,0ddh,077h,003h,0ddh,07eh,005h,0e6h,0f8h	; a296  ..~......w..~...
	defb 0f6h,008h,0ddh,077h,005h,0c9h,03eh,001h,032h,0a3h,0d8h,079h,086h,05fh,023h,078h	; a2a6  ...w..>.2..y._#x
	defb 086h,057h,023h,0e5h,0c5h,0ebh,0cdh,03dh,07fh,0c1h,0e1h,03eh,000h,032h,0a3h,0d8h	; a2b6  .W#....=...>.2..
	defb 0c9h,0ddh,07eh,019h,0feh,004h,0c0h,03ah,003h,0cah,01fh,0d0h,0c3h,063h,06ch,0ddh	; a2c6  ..~....:.....cl.
	defb 056h,005h,0ddh,05eh,003h,03dh,0cdh,04dh,042h,0ebh,0a2h,0efh,0a2h,0f4h,0a2h,0f8h	; a2d6  V..^.=.MB.......
	defb 0a2h,0fch,0a2h,000h,0a3h,07ah,0feh,0a4h,0c9h,07bh,0feh,05ch,03fh,0c9h,07ah,0feh	; a2e6  .....z...{.\?.z.
	defb 084h,0c9h,07ah,0feh,044h,0c9h,07bh,0feh,08ch,0c9h,07bh,0feh,044h,03fh,0c9h,0f4h	; a2f6  ..z.D.{...{.D?..
	defb 0fch,0f4h,003h,004h,0fch,004h,003h,0fah,0f8h,003h,0f8h,0fah,007h,003h,007h,0ddh	; a306  ................
	defb 035h,00eh,0c0h,0ddh,07eh,019h,0feh,005h,0d2h,055h,0a3h,0cdh,045h,0a3h,0ddh,07eh	; a316  5...~....U..E..~
	defb 003h,0f6h,00ch,0e6h,0fch,0ddh,077h,003h,0ddh,07eh,005h,0f6h,008h,0e6h,0f8h,0ddh	; a326  ......w..~......
	defb 077h,005h,0cdh,000h,081h,0cch,05fh,06ch,0ddh,036h,00eh,010h,0c3h,021h,0a2h,0ddh	; a336  w....._l.6...!..
	defb 07eh,00dh,01fh,01fh,03fh,017h,017h,0ddh,077h,00dh,0c9h,0ddh,035h,00eh,0c0h,0cdh	; a346  ~...?...w...5...
	defb 097h,0a2h,0ddh,036h,001h,001h,0ddh,046h,00fh,0ddh,034h,00fh,0ddh,07eh,00fh,0feh	; a356  ...6...F..4..~..
	defb 034h,038h,004h,0ddh,036h,00fh,032h,078h,021h,09dh,0a3h,0cdh,03eh,042h,07eh,007h	; a366  48..6.2x!...>B~.
	defb 007h,007h,047h,0e6h,007h,0ddh,077h,02bh,078h,007h,047h,0e6h,001h,0ddh,077h,02ch	; a376  ..G...w+x.G...w,
	defb 0ddh,07eh,019h,0feh,005h,028h,00ah,078h,007h,03eh,004h,038h,001h,0afh,0ddh,077h	; a386  .~...(.x.>.8...w
	defb 019h,07eh,0e6h,003h,0c3h,037h,08eh,010h,003h,001h,003h,010h,002h,010h,033h,000h	; a396  .~...7........3.
	defb 002h,000h,002h,001h,012h,050h,002h,000h,002h,001h,013h,001h,003h,011h,063h,011h	; a3a6  .....P........c.
	defb 012h,010h,002h,001h,083h,0a1h,013h,000h,003h,009h,003h,008h,002h,010h,012h,000h	; a3b6  ................
	defb 012h,011h,002h,000h,003h,010h,002h,0c8h,010h,013h,012h,0cdh,045h,0a3h,0ddh,07eh	; a3c6  ............E..~
	defb 00ch,0ddh,077h,023h,0ddh,036h,00ch,000h,0ddh,036h,00eh,020h,0c3h,021h,0a2h,0ddh	; a3d6  ..w#.6...6. .!..
	defb 035h,00eh,0c0h,0ddh,07eh,023h,0ddh,077h,00ch,0ddh,07eh,021h,0ddh,077h,001h,0cdh	; a3e6  5...~#.w..~!.w..
	defb 045h,0a3h,0ddh,07eh,00dh,00fh,0e6h,003h,0c3h,037h,08eh,0ddh,07eh,001h,0cdh,04dh	; a3f6  E..~.....7..~..M
	defb 042h,013h,0a4h,06bh,0a4h,08ah,0a5h,018h,0a6h,00eh,0a7h,05fh,0a7h,0afh,032h,03fh	; a406  B..k......._..2?
	defb 0d4h,0ddh,077h,00eh,0ddh,077h,00fh,0ddh,077h,00ch,0ddh,077h,00dh,0ddh,077h,022h	; a416  ..w..w..w..w..w"
	defb 0ddh,077h,018h,0ddh,077h,025h,0ddh,077h,027h,0cdh,0cfh,0a7h,0ddh,07eh,000h,0feh	; a426  .w..w%.w'....~..
	defb 017h,020h,008h,0ddh,036h,025h,020h,0ddh,036h,027h,010h,0cdh,01ch,0a5h,0ddh,034h	; a436  . ..6% .6'.....4
	defb 001h,0c9h,0cdh,000h,081h,020h,01ch,03ah,005h,0cbh,0ddh,096h,005h,030h,002h,0edh	; a446  ..... .:.....0..
	defb 044h,0b8h,0d0h,03eh,010h,080h,047h,03ah,003h,0cbh,0ddh,096h,003h,030h,002h,0edh	; a456  D..>..G:.....0..
	defb 044h,0b8h,0c9h,0b7h,0c9h,0ddh,07eh,000h,0feh,017h,028h,027h,0ddh,07eh,00eh,0feh	; a466  D.....~...('.~..
	defb 020h,020h,020h,006h,030h,0cdh,048h,0a4h,038h,019h,0ddh,035h,029h,020h,014h,03ah	; a476     .0.H.8..5) .:
	defb 03fh,0d4h,0a7h,0c0h,021h,041h,0ceh,034h,03eh,020h,0ddh,077h,023h,032h,063h,0ceh	; a486  ?...!A.4> .w#2c.
	defb 0c3h,044h,0a4h,03ah,003h,0cah,047h,0ddh,07eh,000h,0feh,017h,028h,01bh,0cdh,067h	; a496  .D.:..G.~...(..g
	defb 0a5h,0ddh,07eh,001h,03dh,00eh,004h,028h,002h,00eh,002h,078h,0a1h,020h,00ah,0cdh	; a4a6  ..~.=..(...x. ..
	defb 02eh,090h,03ah,04bh,0cah,0a7h,0c4h,05ah,0a5h,0cbh,018h,0d8h,0ddh,07eh,00eh,021h	; a4b6  ..:K...Z.....~.!
	defb 07dh,0bfh,0cdh,03eh,042h,07eh,0cbh,03fh,047h,0ddh,07eh,00fh,0e6h,003h,04fh,0feh	; a4c6  }..>B~.?G.~...O.
	defb 002h,078h,030h,002h,0edh,044h,0ddh,086h,012h,0ddh,077h,003h,021h,07dh,0bfh,03eh	; a4d6  .x0..D....w.!}.>
	defb 03fh,0ddh,096h,00eh,0cdh,03eh,042h,07eh,0cbh,03fh,047h,079h,03dh,0feh,002h,078h	; a4e6  ?....>B~.?Gy=..x
	defb 038h,002h,0edh,044h,0ddh,086h,013h,0ddh,077h,005h,079h,01fh,038h,00ch,0ddh,034h	; a4f6  8..D....w.y.8..4
	defb 00eh,0ddh,07eh,00eh,0feh,03fh,038h,00ah,018h,005h,0ddh,035h,00eh,020h,003h,0ddh	; a506  ..~..?8....5. ..
	defb 034h,00fh,0cdh,0e6h,080h,0d8h,0ddh,07eh,00ah,0feh,004h,006h,000h,0ddh,07eh,00bh	; a516  4......~......~.
	defb 030h,008h,006h,002h,0feh,007h,030h,007h,018h,004h,0feh,007h,038h,001h,004h,0ddh	; a526  0.....0.....8...
	defb 070h,022h,078h,0e6h,003h,087h,021h,052h,0a5h,0cdh,03eh,042h,07eh,0ddh,086h,025h	; a536  p"x...!R..>B~..%
	defb 0ddh,077h,012h,023h,07eh,0ddh,086h,027h,0ddh,077h,013h,0c9h,09fh,098h,09fh,0e9h	; a546  .w.#~..'.w......
	defb 0f0h,0e9h,0f0h,098h,00dh,078h,0a1h,0c0h,0cdh,000h,081h,0c2h,07bh,06ch,0c3h,002h	; a556  .....x......{l..
	defb 06bh,0ddh,07eh,00eh,0feh,020h,038h,00dh,00eh,004h,0ddh,07eh,00ah,0feh,004h,028h	; a566  k.~.. 8....~...(
	defb 00fh,00eh,006h,018h,00bh,00eh,000h,0ddh,07eh,00bh,0feh,006h,028h,002h,00eh,002h	; a576  ........~...(...
	defb 0ddh,071h,00dh,0c9h,0ddh,035h,023h,028h,01ah,0ddh,07eh,000h,0feh,017h,0cah,0fbh	; a586  .q...5#(..~.....
	defb 0a5h,0ddh,034h,025h,0ddh,07eh,023h,01fh,030h,003h,0ddh,034h,027h,0cdh,01ch,0a5h	; a596  ..4%.~#.0..4'...
	defb 0c3h,099h,0a4h,0cdh,044h,0a4h,0ddh,036h,023h,000h,0cdh,000h,081h,0cch,04dh,06bh	; a5a6  ....D..6#.....Mk
	defb 0ddh,07eh,000h,0feh,017h,028h,02ch,0ddh,036h,00ch,003h,0cdh,056h,042h,0e6h,003h	; a5b6  .~...(,.6...VB..
	defb 047h,021h,010h,0a6h,0cdh,0f6h,043h,0ddh,075h,007h,0ddh,074h,009h,0afh,0ddh,077h	; a5c6  G!....C.u..t...w
	defb 006h,0ddh,077h,008h,078h,0ddh,077h,01dh,087h,0c6h,008h,0ddh,077h,00dh,0ddh,036h	; a5d6  ..w.x.w.....w..6
	defb 028h,010h,0c9h,0ddh,036h,000h,000h,0ddh,07eh,02eh,087h,087h,021h,024h,0dch,0cdh	; a5e6  (...6...~...!$..
	defb 03eh,042h,036h,0e0h,0c9h,0ddh,07eh,023h,006h,000h,0feh,016h,030h,006h,0feh,00ch	; a5f6  >B6...~#....0...
	defb 004h,030h,001h,004h,0ddh,070h,00dh,0c3h,099h,0a4h,0ffh,000h,001h,000h,000h,0ffh	; a606  .0...p..........
	defb 000h,001h,0ddh,07eh,000h,0feh,017h,0cah,044h,0a4h,03ah,03fh,0d4h,0a7h,020h,07ah	; a616  ...~....D.:?.. z
	defb 0ddh,035h,023h,028h,075h,03ah,0b6h,0cah,0a7h,020h,007h,03ah,021h,0cbh,0feh,021h	; a626  .5#(u:... .:!..!
	defb 028h,007h,006h,020h,0cdh,048h,0a4h,038h,061h,0ddh,07eh,007h,0a7h,020h,008h,0ddh	; a636  (.. .H.8a.~.. ..
	defb 04eh,005h,011h,0a0h,020h,018h,01ah,0ddh,07eh,00bh,0feh,007h,011h,0b0h,038h,0ddh	; a646  N... ...~.....8.
	defb 04eh,003h,020h,00dh,0ddh,07eh,00ah,0feh,003h,011h,050h,060h,028h,003h,011h,060h	; a656  N. ..~....P`(..`
	defb 038h,079h,092h,0bbh,030h,024h,0cdh,000h,081h,020h,010h,0cdh,0c8h,090h,0ddh,07eh	; a666  8y..0$... .....~
	defb 007h,0a7h,03eh,003h,020h,002h,03eh,00ch,0a1h,020h,00fh,0ddh,035h,028h,0cah,0b0h	; a676  ..>. .>.. ..5(..
	defb 0a5h,0ddh,07eh,028h,0e6h,003h,0c0h,0c3h,02eh,090h,0cdh,08bh,080h,0ddh,036h,028h	; a686  ..~(..........6(
	defb 008h,0ddh,07eh,01dh,01fh,03fh,017h,0c3h,0dbh,0a5h,0fdh,021h,040h,0ceh,0fdh,036h	; a696  ..~..?.....!@..6
	defb 000h,017h,0fdh,036h,001h,003h,0ddh,07eh,003h,0fdh,046h,003h,0fdh,077h,003h,090h	; a6a6  ...6...~..F..w..
	defb 0c6h,020h,0fdh,077h,025h,0ddh,077h,025h,0ddh,07eh,005h,0fdh,04eh,005h,0fdh,077h	; a6b6  . .w%.w%.~..N..w
	defb 005h,091h,0c6h,010h,0fdh,077h,027h,0ddh,077h,027h,03eh,002h,0fdh,077h,00dh,0ddh	; a6c6  .....w'.w'>..w..
	defb 07eh,00eh,0fdh,077h,00eh,0ddh,07eh,00fh,0fdh,077h,00fh,0ddh,07eh,00ah,0fdh,077h	; a6d6  ~..w..~..w..~..w
	defb 00ah,0ddh,07eh,00bh,0fdh,077h,00bh,0afh,0ddh,077h,00ch,0fdh,07eh,02eh,0a7h,020h	; a6e6  ..~..w...w..~..
	defb 014h,0fdh,036h,02eh,003h,03eh,001h,032h,002h,0d4h,021h,0c0h,0dah,001h,00fh,000h	; a6f6  ..6..>.2..!.....
	defb 03eh,00fh,0cdh,037h,042h,0c3h,044h,0a4h,0ddh,07eh,000h,0feh,016h,001h,000h,000h	; a706  >..7B.D..~......
	defb 028h,003h,001h,010h,020h,0ddh,07eh,025h,090h,0c5h,0cdh,042h,0a7h,0c1h,0ddh,072h	; a716  (... .~%...B...r
	defb 007h,0ddh,073h,006h,0ddh,07eh,027h,091h,0cdh,042h,0a7h,0ddh,072h,009h,0ddh,073h	; a726  ..s..~'..B..r..s
	defb 008h,0ddh,036h,023h,020h,0ddh,036h,00ch,000h,0c3h,044h,0a4h,006h,005h,011h,000h	; a736  ..6# .6...D.....
	defb 000h,0a7h,0c8h,04bh,0cbh,07fh,028h,004h,0edh,044h,00eh,001h,057h,0cbh,03ah,0cbh	; a746  ...K..(..D..W.:.
	defb 01bh,010h,0fah,079h,0a7h,0cch,042h,044h,0c9h,0ddh,035h,023h,028h,04dh,0ddh,07eh	; a756  ...y..BD..5#(M.~
	defb 000h,0feh,017h,028h,009h,03ah,003h,0cah,01fh,0dch,02eh,090h,018h,012h,0ddh,07eh	; a766  ...(.:.........~
	defb 023h,006h,002h,0feh,016h,030h,006h,0feh,00ch,005h,030h,001h,005h,0ddh,070h,00dh	; a776  #....0....0...p.
	defb 0cdh,0a3h,0a5h,0ddh,06eh,024h,0ddh,066h,025h,0ddh,05eh,006h,0ddh,056h,007h,019h	; a786  ....n$.f%.^..V..
	defb 0ddh,075h,024h,0ddh,074h,025h,0ebh,0ddh,06eh,026h,0ddh,066h,027h,0ddh,04eh,008h	; a796  .u$.t%..n&.f'.N.
	defb 0ddh,046h,009h,009h,0ddh,075h,026h,0ddh,074h,027h,0c9h,0ddh,07eh,000h,0feh,016h	; a7a6  .F...u&.t'..~...
	defb 001h,000h,000h,028h,003h,001h,010h,020h,0afh,0ddh,070h,025h,0ddh,077h,024h,0ddh	; a7b6  ...(... ..p%.w$.
	defb 071h,027h,0ddh,077h,026h,0ddh,036h,001h,001h,0cdh,056h,042h,0e6h,003h,0c6h,002h	; a7c6  q'.w&.6...VB....
	defb 0ddh,077h,029h,0c9h	; a7d6

; ======================================================================
; CODIGO 0xa7da..0xa806  (44 bytes)
; ======================================================================


L_A7DA:
	ld a,(0ca76h)		;a7da
	cp 039h		;a7dd
	ret nz			;a7df
	ld hl,0d43bh		;a7e0
	ld a,(0ca4bh)		;a7e3
	dec a			;a7e6
	ret nz			;a7e7
	ld (hl),001h		;a7e8
	ret			;a7ea
L_A7EB:
	ld ix,0ce00h		;a7eb
	ld b,018h		;a7ef
L_A7F1:
	ld a,(ix+000h)		;a7f1
	cp 012h		;a7f4
	jr nz,L_A7FE		;a7f6
	call 08100h		;a7f8
	jp z,06a8bh		;a7fb
L_A7FE:
	ld de,00040h		;a7fe
	add ix,de		;a801
	djnz L_A7F1		;a803
	ret			;a805

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa806..0xa842  (60 bytes)
DATA_A806:
	defb 03ah,04bh,0cah,0a7h,0c0h,03ah,0b6h,0cah,0a7h,0c0h,03ah,031h,0cbh,0a7h,0c0h,03ah	; a806  :K...:....:1...:
	defb 021h,0cbh,0feh,022h,0c0h,021h,03bh,0d4h,07eh,03dh,0c0h,034h,0afh,032h,04ch,0d4h	; a816  !..".!..~=.4.2L.
	defb 032h,04dh,0d4h,032h,04eh,0d4h,021h,000h,0ceh,006h,018h,07eh,0feh,012h,020h,004h	; a826  2M.2N.!....~.. .
	defb 023h,036h,004h,02bh,03eh,040h,0cdh,03eh,042h,010h,0f0h,0c9h	; a836  #6.+>@.>B...

; ======================================================================
; CODIGO 0xa842..0xa8d0  (142 bytes)
; ======================================================================


L_A842:
	ld a,(0ca76h)		;a842
	cp 039h		;a845
	ret nz			;a847
	call L_A7EB		;a848
	ld a,(0d43bh)		;a84b
	and a			;a84e
	ret z			;a84f
	ld a,(0ca4bh)		;a850
	and a			;a853
	ret nz			;a854
	ld a,(0cb31h)		;a855
	and a			;a858
	ret nz			;a859
	call L_A8BB		;a85a
	ld a,(0d44ch)		;a85d
	cp 00bh		;a860
	ret c			;a862
	ld hl,0d44dh		;a863
	inc (hl)			;a866
	ld a,(hl)			;a867
	cp 010h		;a868
	ret c			;a86a
	ld (hl),000h		;a86b
	inc hl			;a86d
	ld a,(hl)			;a86e
	cp 00bh		;a86f
	ret nc			;a871
	inc (hl)			;a872
	ld l,a			;a873
	ld h,000h		;a874
	add hl,hl			;a876
	add hl,hl			;a877
	add hl,hl			;a878
	add hl,hl			;a879
	add hl,hl			;a87a
	add hl,hl			;a87b
	ex de,hl			;a87c
	ld ix,0ce00h		;a87d
	add ix,de		;a881
	ld (ix+001h),008h		;a883
	dec (ix+00ah)		;a887
	ld (ix+003h),04ch		;a88a
	ld (ix+005h),060h		;a88e
	xor a			;a892
	ld (ix+006h),a		;a893
	ld (ix+007h),003h		;a896
	ld (ix+008h),a		;a89a
	ld (ix+009h),a		;a89d
	ld (ix+00ch),003h		;a8a0
	ld (ix+020h),048h		;a8a4
	ld (ix+021h),030h		;a8a8
	call 081c5h		;a8ac
	ld bc,0100fh		;a8af
	call 04256h		;a8b2
	and c			;a8b5
	add a,b			;a8b6
	ld (ix+00eh),a		;a8b7
	ret			;a8ba
L_A8BB:
	ld hl,0ce00h		;a8bb
	ld b,018h		;a8be
L_A8C0:
	ld a,(hl)			;a8c0
	and a			;a8c1
	ret nz			;a8c2
	ld a,040h		;a8c3
	call 0423eh		;a8c5
	djnz L_A8C0		;a8c8
	ld hl,0d7d9h		;a8ca
	res 6,(hl)		;a8cd
	ret			;a8cf

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa8d0..0xab7d  (685 bytes)
DATA_A8D0:
	defb 0cdh,006h,0a8h,0ddh,07eh,001h,0cdh,04dh,042h,037h,0a9h,091h,0a9h,0f5h,0a9h,00ch	; a8d0  ....~..MB7......
	defb 0a9h,0ebh,0a8h,00dh,0a9h,027h,0a9h,00ch,0a9h,0f5h,0a9h,0ddh,07eh,005h,0feh,060h	; a8e0  .....'......~..`
	defb 011h,000h,004h,006h,006h,038h,005h,0cdh,042h,044h,006h,004h,0ddh,072h,009h,0ddh	; a8f0  .....8..BD...r..
	defb 073h,008h,0ddh,070h,00dh,0ddh,036h,00ch,002h,0ddh,034h,001h,0c9h,0ddh,07eh,005h	; a900  s..p..6...4...~.
	defb 0d6h,05ch,0feh,008h,0d0h,0ddh,036h,007h,004h,0ddh,036h,006h,000h,0ddh,036h,00dh	; a910  .\....6...6...6.
	defb 002h,0ddh,036h,00ch,001h,018h,0e2h,0ddh,07eh,003h,0feh,0b8h,0d8h,0ddh,036h,00ch	; a920  ..6.....~.....6.
	defb 000h,021h,04ch,0d4h,034h,018h,0d2h,0ddh,034h,001h,0ddh,07eh,003h,0d6h,010h,0ddh	; a930  .!L.4...4..~....
	defb 077h,020h,0ddh,07eh,005h,0d6h,014h,0ddh,077h,021h,0cdh,056h,042h,0e6h,006h,0ddh	; a940  w .~....w!.VB...
	defb 077h,00dh,0cbh,03fh,04fh,01fh,021h,080h,001h,0d4h,03ah,044h,0ddh,036h,019h,001h	; a950  w..?O.!...:D.6..
	defb 0cdh,056h,042h,01fh,038h,001h,029h,0cdh,07bh,0a9h,0ddh,036h,00ch,003h,001h,007h	; a960  .VB.8.).{..6....
	defb 004h,0cdh,0b2h,0a8h,0ddh,07eh,019h,0ddh,077h,018h,0c9h,011h,000h,000h,079h,0feh	; a970  .....~..w.....y.
	defb 002h,038h,001h,0ebh,0ddh,075h,006h,0ddh,074h,007h,0ddh,073h,008h,0ddh,072h,009h	; a980  .8...u..t..s..r.
	defb 0c9h,0cdh,000h,081h,020h,018h,03ah,003h,0cbh,0d6h,020h,0feh,070h,0dah,0fch,0a9h	; a990  .... .:... .p...
	defb 03ah,0b6h,0cah,0a7h,020h,008h,03ah,021h,0cbh,0feh,022h,0cah,0fch,0a9h,0cdh,0ebh	; a9a0  :... .:!..".....
	defb 0a9h,001h,028h,020h,0ddh,07eh,007h,0ddh,0b6h,006h,028h,00bh,0ddh,07eh,003h,0ddh	; a9b0  ..( .~....(..~..
	defb 096h,020h,0b8h,030h,012h,018h,009h,0ddh,07eh,005h,0ddh,096h,021h,0b9h,030h,007h	; a9c0  . .0....~...!.0.
	defb 0ddh,035h,00eh,0c0h,0c3h,04ah,0a9h,0cdh,08bh,080h,0ddh,07eh,00dh,01fh,01fh,03fh	; a9d0  .5...J.....~...?
	defb 017h,017h,0ddh,077h,00dh,001h,007h,004h,0c3h,0b2h,0a8h,0ddh,035h,018h,0c0h,0cdh	; a9e0  ...w........5...
	defb 074h,0a9h,0c3h,02eh,090h,0ddh,035h,00eh,020h,0f8h,018h,00bh,0ddh,0e5h,0e1h,07dh	; a9f0  t.....5. ......}
	defb 0a7h,0c2h,0aeh,0a9h,0ddh,034h,001h,0cdh,024h,0aah,0ddh,036h,00eh,004h,0ddh,036h	; aa00  .....4..$..6...6
	defb 018h,001h,0ddh,07eh,00dh,0e6h,007h,0cbh,03fh,04fh,021h,000h,004h,01fh,0d4h,03ah	; aa10  ...~....?O!....:
	defb 044h,0c3h,07bh,0a9h,0cdh,0a9h,090h,0cdh,08ch,090h,0a0h,001h,000h,004h,01fh,038h	; aa20  D.{............8
	defb 006h,00ch,00ch,010h,0f9h,00eh,002h,0ddh,071h,00dh,0c9h,0ddh,07eh,021h,0a7h,028h	; aa30  ........q...~!.(
	defb 003h,0ddh,035h,021h,0ddh,07eh,011h,0feh,010h,0d2h,0a4h,0aah,0ddh,07eh,001h,0cdh	; aa40  ..5!.~.......~..
	defb 04dh,042h,056h,0aah,075h,0aah,0cdh,06ch,0aah,0cdh,0e9h,0aah,023h,0cdh,065h,08eh	; aa50  MBV.u..l....#.e.
	defb 0afh,0ddh,07eh,021h,03ch,0ddh,077h,00fh,0ddh,034h,001h,0c9h,0ddh,07eh,011h,021h	; aa60  ..~!<.w..4...~.!
	defb 076h,0b9h,0c3h,0f6h,043h,0cdh,082h,08eh,038h,008h,03ah,003h,0cah,01fh,0d8h,0c3h	; aa70  v...C...8.:.....
	defb 02eh,090h,0cdh,06ch,0aah,0ddh,07eh,00fh,047h,0ddh,034h,00fh,087h,080h,0cdh,03eh	; aa80  ...l..~.G.4....>
	defb 042h,07eh,03ch,0cch,09dh,0aah,0cdh,0e9h,0aah,023h,0c3h,065h,08eh,0ddh,036h,00fh	; aa90  B~<......#.e..6.
	defb 001h,0c3h,06ch,0aah,0cdh,000h,081h,020h,00ch,0ddh,07eh,001h,0cdh,04dh,042h,0bah	; aaa0  ..l.... ..~..MB.
	defb 0aah,009h,0abh,074h,0abh,0ddh,036h,00ch,000h,0c9h,0cdh,0c8h,090h,0cdh,056h,042h	; aab0  ...t..6.......VB
	defb 01fh,0e6h,003h,0cdh,0e1h,0aah,030h,005h,03ch,0e6h,003h,018h,0f6h,0cdh,0ech,0aah	; aac0  ......0.<.......
	defb 0cdh,056h,042h,0cbh,0bfh,0cbh,0f7h,0ddh,077h,00eh,0afh,0ddh,07eh,021h,0c3h,068h	; aad0  .VB.....w...~!.h
	defb 0aah,051h,047h,004h,0cbh,01ah,010h,0fch,0c9h,07eh,0e6h,003h,04fh,011h,0f9h,0aah	; aae0  .QG......~..O...
	defb 0cdh,040h,08eh,079h,087h,0ddh,077h,00dh,0c9h,0e0h,0feh,000h,000h,020h,001h,000h	; aaf0  .@.y..w...... ..
	defb 000h,000h,000h,0e0h,0feh,000h,000h,020h,001h,0cdh,0c8h,090h,0ddh,07eh,00ch,01fh	; ab00  ....... .....~..
	defb 03eh,003h,038h,002h,03eh,00ch,0a1h,020h,020h,0ddh,07eh,003h,0d6h,020h,0feh,0a0h	; ab10  >.8.>..  .~.. ..
	defb 030h,02eh,0ddh,07eh,005h,0d6h,008h,0feh,0b0h,030h,02ah,0ddh,035h,00eh,028h,009h	; ab20  0..~.....0*.5.(.
	defb 03ah,003h,0cah,0e6h,007h,0c0h,0c3h,02eh,090h,0cdh,056h,042h,0cbh,03fh,0cbh,03fh	; ab30  :.........VB.?.?
	defb 0feh,010h,030h,002h,03eh,010h,0ddh,077h,00eh,0ddh,036h,00ch,000h,0c3h,068h,0aah	; ab40  ..0.>..w..6...h.
	defb 0cdh,09eh,080h,018h,003h,0cdh,08eh,080h,0cdh,056h,042h,0cbh,03fh,0cbh,03fh,0feh	; ab50  .........VB.?.?.
	defb 010h,030h,002h,03eh,010h,0ddh,077h,00eh,0ddh,07eh,00dh,01fh,01fh,03fh,017h,017h	; ab60  .0.>..w..~...?..
	defb 0ddh,077h,00dh,0c9h,0ddh,035h,00eh,0c0h,0ddh,036h,001h,000h,0c9h	; ab70  .w...5...6...

; ======================================================================
; CODIGO 0xab7d..0xab88  (11 bytes)
; ======================================================================


L_AB7D:
	ld ix,(0d435h)		;ab7d
	ld a,(0d434h)		;ab81
	dec a			;ab84
	call 0424dh		;ab85

; ----------------------------------------------------------------------
; DATOS sin identificar  0xab88..0xab8e  (6 bytes)
DATA_AB88:
	defb 08eh,0abh,0a4h,0abh,0aah,0abh	; ab88

; ======================================================================
; CODIGO 0xab8e..0xabe5  (87 bytes)
; ======================================================================


L_AB8E:
	ld a,(ix+00dh)		;ab8e
	ld (ix+015h),a		;ab91
	ld a,(ix+000h)		;ab94
	cp 016h		;ab97
	call nz,L_ABBD		;ab99
	call 06211h		;ab9c
L_AB9F:
	ld hl,0d434h		;ab9f
	inc (hl)			;aba2
	ret			;aba3
L_ABA4:
	call 0620bh		;aba4
	ret nz			;aba7
	jr L_AB9F		;aba8
L_ABAA:
	ld a,(0ca07h)		;abaa
	and a			;abad
	ret z			;abae
	call 07a2dh		;abaf
	ld a,(ix+015h)		;abb2
	ld (ix+00dh),a		;abb5
	xor a			;abb8
	ld (0d434h),a		;abb9
	ret			;abbc
L_ABBD:
	ld bc,00202h		;abbd
	ld a,(0cb03h)		;abc0
	sub (ix+003h)		;abc3
	jr nc,L_ABCC		;abc6
	ld b,000h		;abc8
	neg		;abca
L_ABCC:
	ld d,a			;abcc
	ld a,(0cb05h)		;abcd
	sub (ix+005h)		;abd0
	jr nc,L_ABD9		;abd3
	ld c,000h		;abd5
	neg		;abd7
L_ABD9:
	cp d			;abd9
	ld a,004h		;abda
	jr nc,L_ABE0		;abdc
	xor a			;abde
	ld c,b			;abdf
L_ABE0:
	add a,c			;abe0
	ld (ix+00dh),a		;abe1
	ret			;abe4

; ----------------------------------------------------------------------
; DATOS sin identificar  0xabe5..0xad58  (371 bytes)
DATA_ABE5:
	defb 03ah,05fh,0cah,0a7h,0c0h,021h,0c0h,0cfh,02ch,07eh,0d6h,008h,0feh,008h,0d8h,03eh	; abe5  :_...!..,~.....>
	defb 002h,085h,06fh,07eh,0ddh,077h,003h,023h,023h,07eh,0c6h,010h,0feh,0b8h,038h,002h	; abf5  ..o~.w.##~....8.
	defb 03eh,0b8h,0ddh,077h,005h,03eh,005h,085h,06fh,07eh,0ddh,077h,00ah,023h,07eh,0ddh	; ac05  >..w.>..o~.w.#~.
	defb 077h,00bh,0cdh,000h,081h,020h,008h,0ddh,07eh,02eh,0a7h,0c0h,0c3h,0c5h,081h,0cdh	; ac15  w.... ..~.......
	defb 073h,082h,0c3h,0f3h,080h,0cdh,000h,081h,020h,003h,0cdh,0dah,06ah,0ddh,07eh,001h	; ac25  s....... ...j.~.
	defb 0feh,001h,028h,008h,030h,06ah,0ddh,036h,00fh,000h,018h,060h,0ddh,07eh,020h,0a7h	; ac35  ..(.0j.6...`.~ .
	defb 028h,006h,0cdh,000h,081h,0cch,073h,06ch,0ddh,07eh,011h,021h,0e3h,0ach,0cdh,0f6h	; ac45  (.....sl.~.!....
	defb 043h,0ddh,07eh,00fh,047h,087h,080h,0cdh,03eh,042h,07eh,0feh,0ffh,020h,006h,0ddh	; ac55  C.~.G...>B~.. ..
	defb 036h,00fh,000h,018h,0d7h,07eh,0e6h,07fh,0ddh,077h,01dh,07eh,017h,03eh,001h,038h	; ac65  6....~...w.~.>.8
	defb 001h,0afh,0ddh,077h,020h,023h,0ddh,07eh,01dh,0f5h,0cdh,065h,08eh,0f1h,021h,0dbh	; ac75  ...w #.~...e..!.
	defb 0ach,0cdh,0f6h,043h,0ddh,075h,007h,0ddh,074h,009h,0afh,0ddh,077h,006h,0ddh,077h	; ac85  ...C.u..t...w..w
	defb 008h,07dh,0a7h,03eh,001h,020h,002h,03eh,002h,0ddh,077h,00ch,0ddh,034h,001h,0c9h	; ac95  .}.>. .>..w..4..
	defb 0cdh,0e6h,080h,0ddh,07eh,00ah,0ddh,0beh,012h,0c0h,0ddh,07eh,00bh,0ddh,0beh,013h	; aca5  ....~......~....
	defb 0c0h,0ddh,07eh,00ch,01fh,0ddh,046h,003h,0ddh,07eh,007h,038h,006h,0ddh,046h,005h	; acb5  ..~...F..~.8..F.
	defb 0ddh,07eh,009h,017h,0ddh,07eh,014h,038h,004h,0b8h,0d0h,018h,002h,0b8h,0d8h,0ddh	; acc5  .~...~.8........
	defb 034h,00fh,0ddh,035h,001h,0c9h,0fch,000h,004h,000h,000h,0fch,000h,004h,0ebh,0ach	; acd5  4..5............
	defb 013h,0adh,026h,0adh,03ch,0adh,083h,057h,058h,002h,056h,0a4h,001h,046h,054h,082h	; ace5  ..&.<..WX.V..FT.
	defb 046h,028h,083h,046h,098h,001h,046h,090h,083h,047h,098h,082h,046h,0a6h,000h,046h	; acf5  F(.F..F..G..F..F
	defb 058h,082h,046h,024h,083h,046h,098h,000h,056h,080h,082h,055h,026h,0ffh,081h,036h	; ad05  X.F$.F..V..U&..6
	defb 094h,083h,036h,038h,081h,026h,094h,080h,036h,0a0h,082h,036h,026h,000h,036h,020h	; ad15  ..68.&..6..6&.6
	defb 0ffh,081h,037h,094h,083h,037h,098h,081h,027h,094h,082h,027h,026h,080h,037h,098h	; ad25  ..7..7..'..'&.7.
	defb 003h,037h,058h,000h,037h,020h,0ffh,081h,017h,094h,080h,027h,040h,0ffh,0ddh,07eh	; ad35  .7X.7 .....'@..~
	defb 019h,0a7h,0c2h,052h,0aeh,0ddh,07eh,001h,0cdh,04dh,042h,021h,0aeh,01dh,0aeh,025h	; ad45  ...R..~..MB!...%
	defb 0aeh,003h,0aeh	; ad55

; ======================================================================
; CODIGO 0xad58..0xae03  (171 bytes)
; ======================================================================


L_AD58:
	ld ix,0ce00h		;ad58
	ld b,018h		;ad5c
L_AD5E:
	ld a,(ix+000h)		;ad5e
	and 07fh		;ad61
	cp 015h		;ad63
	push bc			;ad65
	jr nz,L_AD6F		;ad66
	ld a,(ix+001h)		;ad68
	and a			;ad6b
	call z,L_AD78		;ad6c
L_AD6F:
	ld bc,00040h		;ad6f
	add ix,bc		;ad72
	pop bc			;ad74
	djnz L_AD5E		;ad75
	ret			;ad77
L_AD78:
	ld (ix+00fh),000h		;ad78
	ld a,(0ca4ah)		;ad7c
	ld hl,0bba9h		;ad7f
	call 043f6h		;ad82
	ld a,(ix+011h)		;ad85
	and 03fh		;ad88
	add a,a			;ad8a
	ld b,a			;ad8b
	add a,a			;ad8c
	add a,a			;ad8d
	add a,b			;ad8e
	call 0423eh		;ad8f
	ld a,(hl)			;ad92
	ld (ix+003h),a		;ad93
	ld (ix+020h),a		;ad96
	ld (ix+002h),000h		;ad99
	inc hl			;ad9d
	ld a,(hl)			;ad9e
	ld (ix+005h),a		;ad9f
	ld (ix+021h),a		;ada2
	ld (ix+004h),000h		;ada5
	inc hl			;ada9
	ld a,(hl)			;adaa
	ld (ix+00ah),a		;adab
	ld (ix+022h),a		;adae
	inc hl			;adb1
	ld a,(hl)			;adb2
	ld (ix+00bh),a		;adb3
	ld (ix+023h),a		;adb6
	inc hl			;adb9
	ld a,(hl)			;adba
	ld (ix+024h),a		;adbb
	inc hl			;adbe
	ld a,(hl)			;adbf
	ld (ix+025h),a		;adc0
	inc hl			;adc3
	ld a,(hl)			;adc4
	ld (ix+026h),a		;adc5
	ld (ix+012h),a		;adc8
	inc hl			;adcb
	ld a,(hl)			;adcc
	ld (ix+027h),a		;adcd
	ld (ix+013h),a		;add0
	inc hl			;add3
	ld a,(hl)			;add4
	ld c,a			;add5
	cp 002h		;add6
	ld b,(ix+024h)		;add8
	jr c,L_ADE0		;addb
	ld b,(ix+025h)		;addd
L_ADE0:
	ld (ix+014h),b		;ade0
	ld de,0ae6bh		;ade3
	push hl			;ade6
	call 08e40h		;ade7
	pop hl			;adea
	inc hl			;adeb
	ld a,(hl)			;adec
	ld (ix+00dh),a		;aded
	ld a,(ix+00ch)		;adf0
	ld (ix+016h),a		;adf3
	ld a,(0ca5fh)		;adf6
	and a			;adf9
	ret z			;adfa
	ld a,(ix+000h)		;adfb
	ld (ix+001h),003h		;adfe
	ret			;ae02

; ----------------------------------------------------------------------
; DATOS sin identificar  0xae03..0xae7b  (120 bytes)
DATA_AE03:
	defb 0ddh,036h,00ch,000h,03ah,05fh,0cah,0a7h,0c0h,0cdh,000h,081h,0c8h,0ddh,07eh,028h	; ae03  .6..:_........~(
	defb 0ddh,077h,001h,0ddh,07eh,016h,0ddh,077h,00ch,0c9h,0cdh,082h,08eh,0d0h,0ddh,034h	; ae13  .w..~..w.......4
	defb 001h,0c9h,0cdh,09eh,080h,0ddh,046h,020h,0ddh,04eh,024h,0ddh,036h,001h,001h,0ddh	; ae23  ......F .N$.6...
	defb 07eh,00fh,0ddh,034h,00fh,01fh,0ddh,056h,022h,0ddh,05eh,023h,030h,007h,041h,0ddh	; ae33  ~..4...V".^#0.A.
	defb 056h,026h,0ddh,05eh,027h,0ddh,070h,014h,0ddh,072h,012h,0ddh,073h,013h,0c9h,0ddh	; ae43  V&.^'.p..r..s...
	defb 07eh,001h,0cdh,04dh,042h,021h,0aeh,01dh,0aeh,060h,0aeh,003h,0aeh,0cdh,08eh,080h	; ae53  ~..MB!...`......
	defb 0ddh,046h,021h,0ddh,04eh,025h,018h,0c3h,000h,0ffh,000h,000h,000h,001h,000h,000h	; ae63  .F!.N%..........
	defb 000h,000h,000h,0ffh,000h,000h,000h,001h	; ae73  ........

; ======================================================================
; CODIGO 0xae7b..0xaeb8  (61 bytes)
; ======================================================================


L_AE7B:
	ld a,(0ca4ah)		;ae7b
	cp 004h		;ae7e
	ret nz			;ae80
	ld ix,0ce00h		;ae81
	ld b,018h		;ae85
L_AE87:
	push bc			;ae87
	ld a,(ix+000h)		;ae88
	cp 00ah		;ae8b
	jr nz,L_AEAF		;ae8d
	call 08100h		;ae8f
	jr nz,L_AEAF		;ae92
	ld a,(ix+00bh)		;ae94
	cp 009h		;ae97
	jr nz,L_AEA8		;ae99
	ld a,(0cb21h)		;ae9b
	cp 003h		;ae9e
	jr z,L_AEA8		;aea0
	ld a,(0cacdh)		;aea2
	and a			;aea5
	jr nz,L_AEAF		;aea6
L_AEA8:
	ld (ix+00dh),000h		;aea8
	call L_AEE2		;aeac
L_AEAF:
	ld bc,00040h		;aeaf
	add ix,bc		;aeb2
	pop bc			;aeb4
	djnz L_AE87		;aeb5
	ret			;aeb7

; ----------------------------------------------------------------------
; DATOS sin identificar  0xaeb8..0xaebf  (7 bytes)
DATA_AEB8:
	defb 011h,006h,007h,0cdh,000h,081h,0c0h	; aeb8

; ======================================================================
; CODIGO 0xaebf..0xaf0b  (76 bytes)
; ======================================================================


L_AEBF:
	ld a,(ix+00bh)		;aebf
	cp 009h		;aec2
	jr nz,L_AED2		;aec4
	ld a,(0cb21h)		;aec6
	cp 003h		;aec9
	jr z,L_AED2		;aecb
	ld a,(0cacdh)		;aecd
	and a			;aed0
	ret nz			;aed1
L_AED2:
	ld hl,0ca42h		;aed2
	ld a,(hl)			;aed5
	push af			;aed6
	xor 001h		;aed7
	ld (hl),a			;aed9
	push hl			;aeda
	call L_AEE5		;aedb
	pop hl			;aede
	pop af			;aedf
	ld (hl),a			;aee0
	ret			;aee1
L_AEE2:
	ld de,00706h		;aee2
L_AEE5:
	ld (0ca4ch),de		;aee5
	ld a,(ix+00dh)		;aee9
	ld hl,0afa7h		;aeec
	call 043f6h		;aeef
	ld b,(hl)			;aef2
	inc hl			;aef3
	ld c,(hl)			;aef4
	inc hl			;aef5
	ld a,(ix+005h)		;aef6
	sub (hl)			;aef9
	ld d,a			;aefa
	inc hl			;aefb
	ld a,(ix+003h)		;aefc
	sub (hl)			;aeff
	ld e,a			;af00
	inc hl			;af01
	call 041ddh		;af02
	call 0741eh		;af05
	jp 041b5h		;af08

; ----------------------------------------------------------------------
; DATOS sin identificar  0xaf0b..0xbc53  (3400 bytes)
DATA_AF0B:
	defb 0ddh,07eh,001h,0cdh,04dh,042h,037h,0afh,01dh,0afh,022h,0afh,043h,0afh,06fh,0afh	; af0b  .~..MB7...".C.o.
	defb 07fh,0afh,0cdh,038h,0afh,018h,00fh,0ddh,035h,00eh,0c0h,0ddh,036h,00dh,001h,0cdh	; af1b  ...8....5...6...
	defb 0b8h,0aeh,0ddh,036h,00fh,008h,0cdh,038h,0afh,0ddh,034h,001h,0c9h,0cdh,056h,042h	; af2b  ...6...8..4...VB
	defb 0e6h,007h,0c6h,004h,0ddh,077h,00eh,0c9h,0ddh,035h,00eh,0c0h,0ddh,035h,00fh,028h	; af3b  .....w...5...5.(
	defb 015h,0cdh,038h,0afh,0ddh,07eh,00fh,0e6h,003h,021h,06bh,0afh,0cdh,03eh,042h,07eh	; af4b  ..8..~...!k..>B~
	defb 0ddh,077h,00dh,0c3h,0b8h,0aeh,0afh,0ddh,077h,001h,0ddh,077h,00dh,0c3h,0b8h,0aeh	; af5b  .w......w..w....
	defb 002h,003h,002h,004h,0cdh,000h,081h,0c0h,03ah,05fh,0cah,0feh,002h,030h,0bah,0ddh	; af6b  ........:_...0..
	defb 036h,001h,000h,0c9h,0ddh,036h,00dh,005h,011h,000h,001h,0cdh,0bbh,0aeh,0ddh,07eh	; af7b  6....6.........~
	defb 003h,0c6h,008h,0ddh,077h,003h,0ddh,07eh,005h,0d6h,014h,0ddh,077h,005h,0ddh,036h	; af8b  ....w..~....w..6
	defb 000h,001h,0afh,0ddh,077h,001h,0ddh,077h,00dh,0c3h,0c5h,081h,0b3h,0afh,0c3h,0afh	; af9b  ....w..w........
	defb 0cdh,0afh,0d2h,0afh,0d7h,0afh,0dch,0afh,003h,004h,00ch,00fh,00fh,011h,010h,001h	; afab  ................
	defb 002h,003h,004h,005h,006h,007h,008h,009h,003h,002h,00ch,00fh,00dh,012h,00eh,00ah	; afbb  ................
	defb 00bh,00ch,001h,001h,004h,00fh,012h,001h,001h,004h,00fh,014h,001h,001h,004h,00fh	; afcb  ................
	defb 013h,003h,004h,00ch,00fh,0bch,0bdh,0beh,095h,087h,096h,086h,086h,088h,086h,086h	; afdb  ................
	defb 088h,0ddh,07eh,001h,0cdh,04dh,042h,003h,0b0h,0fah,0afh,011h,0b0h,032h,0b0h,0ddh	; afeb  ..~..MB......2..
	defb 035h,00eh,0c0h,0cdh,02eh,090h,018h,003h,0cdh,01ch,0b0h,0cdh,056h,042h,0e6h,007h	; affb  5...........VB..
	defb 0c6h,004h,0ddh,077h,00eh,0c9h,0ddh,036h,00dh,002h,0ddh,036h,00eh,010h,0cdh,048h	; b00b  ...w...6...6...H
	defb 06ah,0ddh,034h,001h,0c9h,03dh,021h,0a0h,0dah,087h,087h,087h,087h,0cdh,03eh,042h	; b01b  j.4..=!.......>B
	defb 079h,001h,00fh,000h,0c3h,037h,042h,0ddh,035h,00eh,0cah,04ch,083h,0ddh,07eh,02eh	; b02b  y....7B.5..L..~.
	defb 00eh,007h,0cdh,020h,0b0h,0ddh,07eh,02fh,00eh,00ah,0cdh,020h,0b0h,0ddh,07eh,00eh	; b03b  ... ..~/... ..~.
	defb 01fh,0dah,02eh,090h,0c9h,06ch,0b0h,080h,0b0h,0a0h,0b0h,0aah,0b0h,0beh,0b0h,0ceh	; b04b  .....l..........
	defb 0b0h,0e2h,0b0h,0e2h,0b0h,06ch,0b0h,0ech,0b0h,0f6h,0b0h,014h,0b1h,06ch,0b0h,01eh	; b05b  .....l.......l..
	defb 0b1h,026h,0b1h,047h,0b1h,061h,0b1h,09dh,0b1h,0c7h,0b1h,0dah,0b1h,0f2h,0b1h,005h	; b06b  .&.G.a..........
	defb 0b2h,00ch,0b2h,01fh,0b2h,035h,0b2h,04eh,0b2h,05fh,0b2h,07ch,0b2h,0abh,0b2h,0e2h	; b07b  .....5.N._.|....
	defb 0b2h,007h,0b3h,007h,0b3h,014h,0b3h,02ah,0b3h,032h,0b3h,03fh,0b3h,053h,0b3h,053h	; b08b  .......*.2.?.S.S
	defb 0b3h,05ch,0b3h,065h,0b3h,07eh,0b3h,09ch,0b3h,0b0h,0b3h,0cah,0b3h,0e3h,0b3h,007h	; b09b  .\.e.~..........
	defb 0b4h,01ch,0b4h,02bh,0b4h,03ah,0b4h,047h,0b4h,054h,0b4h,061h,0b4h,074h,0b4h,07bh	; b0ab  ...+.:.G.T.a.t.{
	defb 0b4h,082h,0b4h,089h,0b4h,0a5h,0b4h,0a5h,0b4h,0b8h,0b4h,0cdh,0b4h,0ffh,0b4h,055h	; b0bb  ...............U
	defb 0b5h,063h,0b5h,08ah,0b5h,0a7h,0b5h,0b7h,0b5h,0beh,0b5h,0d5h,0b5h,0e0h,0b5h,0f8h	; b0cb  .c..............
	defb 0b5h,00dh,0b6h,01eh,0b6h,028h,0b6h,03eh,0b6h,055h,0b6h,066h,0b6h,07eh,0b6h,08fh	; b0db  .....(.>.U.f.~..
	defb 0b6h,0a3h,0b6h,0b4h,0b6h,0c2h,0b6h,0d6h,0b6h,0edh,0b6h,0f5h,0b6h,002h,0b7h,00bh	; b0eb  ................
	defb 0b7h,016h,0b7h,02bh,0b7h,03fh,0b7h,050h,0b7h,060h,0b7h,076h,0b7h,093h,0b7h,0a8h	; b0fb  ...+.?.P.`.v....
	defb 0b7h,0bfh,0b7h,0c7h,0b7h,0ceh,0b7h,0e2h,0b7h,0ebh,0b7h,001h,0b8h,05ch,0b8h,0b1h	; b10b  .............\..
	defb 0b8h,000h,0b9h,021h,0b9h,02ch,0b9h,045h,0b9h,064h,0b9h,001h,028h,0a4h,002h,027h	; b11b  ...!.,.E.d..(..'
	defb 074h,080h,042h,027h,017h,000h,027h,06fh,003h,027h,06ch,081h,003h,028h,030h,001h	; b12b  t.B'..'o.'l..(0.
	defb 028h,080h,043h,028h,069h,040h,038h,0adh,002h,038h,02bh,0ffh,041h,026h,07ah,043h	; b13b  (.C(i@8..8+.A&zC
	defb 027h,073h,041h,027h,0a9h,002h,026h,09ch,000h,036h,0adh,002h,036h,06ah,001h,026h	; b14b  'sA'..&..6..6j.&
	defb 02bh,083h,042h,026h,029h,0ffh,001h,036h,0b0h,003h,036h,04ch,000h,036h,07bh,003h	; b15b  +.B&)..6..6L.6{.
	defb 036h,0abh,001h,026h,038h,003h,028h,00bh,000h,038h,070h,003h,038h,088h,000h,038h	; b16b  6..&8.(..8p.8..8
	defb 030h,001h,038h,069h,002h,038h,016h,001h,028h,036h,002h,026h,0b5h,000h,036h,080h	; b17b  0.8i.8..(6.&..6.
	defb 002h,036h,050h,083h,001h,036h,0b0h,002h,036h,030h,080h,002h,036h,017h,000h,036h	; b18b  .6P..6..60..6..6
	defb 060h,0ffh,002h,037h,0afh,001h,037h,0aeh,002h,037h,06fh,080h,002h,037h,015h,000h	; b19b  `..7..7..7o..7..
	defb 037h,03ah,002h,036h,036h,041h,036h,060h,000h,036h,03ah,003h,037h,012h,001h,037h	; b1ab  7:.66A6`.6:.7..7
	defb 0a9h,003h,037h,0aah,000h,037h,02ch,003h,038h,06ch,081h,0ffh,002h,037h,036h,083h	; b1bb  ..7..7,.8l...76.
	defb 001h,037h,074h,003h,037h,074h,081h,003h,037h,08ah,082h,000h,037h,033h,0ffh,002h	; b1cb  .7t.7t..7...73..
	defb 048h,070h,080h,002h,048h,013h,001h,048h,0ach,003h,048h,0a5h,080h,002h,048h,013h	; b1db  Hp..H..H..H...H.
	defb 000h,048h,054h,003h,048h,08ch,0ffh,042h,047h,05fh,003h,047h,0a7h,001h,047h,0aah	; b1eb  .HT.H..BG_.G..G.
	defb 002h,047h,06fh,003h,047h,0a6h,000h,047h,079h,0ffh,043h,047h,083h,042h,047h,034h	; b1fb  .Go.G..Gy.CG.BG4
	defb 0ffh,002h,046h,07bh,040h,046h,058h,043h,047h,058h,002h,046h,09ah,041h,046h,0abh	; b20b  ..F{@FXCGX.F.AF.
	defb 003h,046h,0a3h,0ffh,000h,046h,05ah,081h,002h,046h,016h,083h,041h,046h,099h,000h	; b21b  .F...FZ..F..AF..
	defb 046h,05ah,003h,046h,043h,082h,041h,046h,0a5h,0ffh,002h,016h,020h,000h,016h,020h	; b22b  FZ.FC.AF.... ..
	defb 003h,016h,0a0h,081h,003h,017h,09eh,081h,003h,018h,0a7h,001h,018h,076h,002h,017h	; b23b  .............v..
	defb 059h,080h,0ffh,041h,016h,093h,043h,017h,09ch,000h,017h,020h,002h,017h,05ah,081h	; b24b  Y..A..C.... ..Z.
	defb 042h,016h,09dh,0ffh,000h,025h,03ah,082h,000h,035h,034h,042h,035h,026h,003h,035h	; b25b  B....%:..54B5&.5
	defb 0a9h,040h,045h,099h,001h,025h,02eh,002h,025h,06bh,003h,025h,0a9h,041h,025h,05dh	; b26b  .@E..%..%k.%.A%]
	defb 0ffh,000h,045h,031h,002h,045h,035h,001h,045h,0aah,002h,045h,016h,001h,035h,076h	; b27b  ..E1.E5.E..E..5v
	defb 003h,035h,02ch,041h,025h,06dh,000h,035h,079h,002h,035h,015h,000h,035h,036h,083h	; b28b  .5,A%m.5y.5..56.
	defb 000h,045h,0b0h,003h,045h,02bh,000h,045h,031h,003h,045h,0a8h,041h,045h,05dh,0ffh	; b29b  .E..E+.E1.E.AE].
	defb 002h,027h,092h,040h,027h,0a0h,002h,026h,0b5h,001h,026h,0b6h,002h,026h,04ch,000h	; b2ab  .'.@'..&..&..&L.
	defb 026h,080h,002h,026h,013h,000h,046h,061h,003h,047h,010h,001h,047h,077h,003h,047h	; b2bb  &..&..Fa.G..Gw.G
	defb 06ah,000h,047h,061h,003h,048h,00bh,000h,048h,03eh,003h,048h,0ach,001h,028h,058h	; b2cb  j.Ga.H..H>.H..(X
	defb 002h,028h,096h,001h,028h,0b5h,0ffh,003h,027h,0abh,001h,027h,08fh,003h,028h,06ch	; b2db  .(..(...'..'..(l
	defb 000h,028h,019h,002h,028h,055h,040h,048h,099h,002h,046h,0b4h,000h,046h,07bh,002h	; b2eb  .(..(U@H..F..F{.
	defb 046h,056h,001h,036h,035h,003h,036h,069h,041h,026h,070h,0ffh,002h,048h,059h,001h	; b2fb  FV.65.6iA&p..HY.
	defb 038h,05ch,003h,038h,08bh,000h,048h,059h,0ffh,002h,037h,0b4h,000h,037h,033h,002h	; b30b  8\.8..HY..7..73.
	defb 037h,015h,001h,037h,0ach,003h,037h,0aah,000h,037h,073h,043h,038h,050h,0ffh,042h	; b31b  7..7..7..7sC8P.B
	defb 046h,02ah,003h,046h,093h,080h,0ffh,042h,047h,031h,041h,047h,05dh,000h,047h,02eh	; b32b  F*.F...BG1AG].G.
	defb 043h,047h,08fh,0ffh,001h,059h,0a6h,042h,059h,053h,040h,059h,046h,001h,059h,0a6h	; b33b  CG...Y.BYS@YF.Y.
	defb 003h,059h,088h,082h,000h,059h,059h,0ffh,043h,017h,057h,080h,042h,017h,01bh,080h	; b34b  .Y...YY.C.W.B...
	defb 0ffh,042h,017h,06bh,080h,043h,017h,0aah,080h,0ffh,002h,056h,05bh,001h,056h,090h	; b35b  .B.k.C.....V[.V.
	defb 002h,055h,098h,000h,055h,030h,003h,056h,056h,001h,056h,090h,003h,056h,098h,000h	; b36b  .U..U0.VV.V..V..
	defb 056h,030h,0ffh,000h,038h,0ach,002h,038h,078h,000h,038h,04dh,083h,002h,037h,0b6h	; b37b  V0..8..8x.8M..7.
	defb 001h,037h,0a8h,042h,037h,08fh,001h,027h,081h,003h,028h,069h,080h,003h,028h,08bh	; b38b  .7.B7..'..(i..(.
	defb 0ffh,043h,027h,02ah,000h,037h,0ach,083h,002h,037h,00eh,040h,037h,08ah,042h,036h	; b39b  .C'*.7...7.@7.B6
	defb 053h,041h,026h,070h,0ffh,001h,036h,034h,003h,036h,050h,041h,036h,086h,003h,037h	; b3ab  SA&p..64.6PA6..7
	defb 009h,000h,037h,02fh,043h,037h,028h,000h,047h,08dh,083h,002h,046h,031h,0ffh,042h	; b3bb  ..7/C7(.G...F1.B
	defb 047h,04fh,001h,047h,085h,002h,047h,033h,001h,037h,02ch,003h,037h,0aah,001h,037h	; b3cb  GO.G..G3.7,.7..7
	defb 047h,043h,038h,06ah,000h,048h,04dh,0ffh,003h,047h,050h,081h,003h,048h,069h,080h	; b3db  GC8j.HM..GP..Hi.
	defb 001h,028h,018h,003h,028h,084h,001h,028h,082h,002h,026h,056h,000h,036h,033h,002h	; b3eb  .(..(..(..&V.63.
	defb 036h,032h,040h,046h,07eh,003h,046h,04ah,000h,046h,04dh,0ffh,001h,035h,0abh,083h	; b3fb  62@F~.FJ.FM..5..
	defb 001h,025h,093h,003h,026h,089h,000h,036h,0b2h,082h,000h,036h,032h,002h,035h,035h	; b40b  .%..&..6...62.55
	defb 0ffh,000h,035h,0b2h,082h,040h,035h,03fh,001h,035h,0afh,0c3h,001h,025h,07ch,0ffh	; b41b  ..5..@5?.5...%|.
	defb 001h,036h,0aeh,083h,041h,026h,079h,000h,036h,0b2h,082h,040h,036h,03dh,0ffh,041h	; b42b  .6..A&y.6..@6=.A
	defb 056h,0aah,042h,056h,073h,040h,056h,04fh,043h,056h,0abh,0ffh,000h,057h,032h,002h	; b43b  V.BVs@VOCV...W2.
	defb 056h,02fh,001h,046h,093h,003h,047h,08eh,0ffh,003h,017h,0aah,000h,017h,032h,002h	; b44b  V/.F..G.......2.
	defb 017h,076h,001h,017h,0ach,0ffh,002h,049h,054h,001h,049h,0ach,003h,049h,080h,002h	; b45b  .v.....IT.I..I..
	defb 049h,054h,000h,049h,034h,003h,049h,0ach,0ffh,041h,039h,060h,040h,039h,050h,0ffh	; b46b  IT.I4.I..A9`@9P.
	defb 041h,039h,080h,040h,039h,070h,0ffh,041h,039h,0a0h,040h,039h,090h,0ffh,000h,055h	; b47b  A9.@9p.A9.@9...U
	defb 050h,003h,056h,06bh,001h,056h,091h,083h,041h,046h,03bh,000h,056h,050h,002h,055h	; b48b  P.Vk.V..AF..VP.U
	defb 015h,001h,035h,033h,083h,001h,035h,08bh,083h,0ffh,001h,036h,0adh,002h,036h,073h	; b49b  ..53..5....6..6s
	defb 040h,046h,067h,001h,036h,0adh,003h,036h,0adh,000h,036h,049h,0ffh,003h,047h,0aah	; b4ab  @Fg.6..6..6I..G.
	defb 082h,040h,047h,050h,042h,046h,07bh,003h,047h,0aah,080h,001h,047h,0aeh,002h,047h	; b4bb  .@GPBF{.G...G..G
	defb 011h,0ffh,003h,017h,090h,000h,027h,02fh,003h,028h,02fh,001h,018h,092h,003h,018h	; b4cb  ......'/.(/.....
	defb 094h,001h,018h,0a8h,003h,019h,050h,000h,019h,070h,002h,019h,02eh,080h,003h,019h	; b4db  ......P..p......
	defb 06fh,000h,019h,05fh,001h,019h,072h,002h,018h,08ch,000h,028h,030h,002h,027h,02eh	; b4eb  o.._..r....(0.'.
	defb 001h,017h,08eh,0ffh,002h,028h,030h,081h,002h,027h,090h,081h,002h,027h,030h,001h	; b4fb  .....(0..'...'0.
	defb 027h,0a0h,002h,027h,03bh,082h,001h,017h,08dh,003h,017h,08fh,080h,003h,018h,08ah	; b50b  '..'............
	defb 080h,000h,018h,071h,003h,019h,06fh,080h,003h,019h,0ach,001h,019h,0a8h,002h,019h	; b51b  ...q..o.........
	defb 04dh,000h,019h,074h,002h,019h,030h,000h,019h,060h,000h,017h,090h,002h,017h,017h	; b52b  M..t..0..`......
	defb 000h,017h,034h,003h,017h,0a8h,001h,017h,098h,002h,017h,074h,001h,017h,0b8h,001h	; b53b  ..4........t....
	defb 019h,06eh,002h,018h,08eh,000h,028h,034h,081h,0ffh,041h,018h,06ah,002h,018h,03bh	; b54b  .n....(4..A.j...
	defb 081h,000h,028h,07dh,003h,028h,035h,0ffh,003h,057h,0aah,000h,057h,02eh,002h,057h	; b55b  ..(}.(5..W..W..W
	defb 016h,001h,057h,064h,003h,057h,02ch,080h,003h,058h,020h,000h,058h,04ch,003h,058h	; b56b  ..Wd.W,..X .XL.X
	defb 07bh,080h,002h,057h,0b0h,000h,057h,02dh,002h,057h,016h,001h,057h,0ach,0ffh,001h	; b57b  {..W..W-.W..W...
	defb 036h,036h,082h,083h,001h,026h,027h,003h,026h,06ch,000h,036h,078h,083h,000h,046h	; b58b  66...&'.&l.6x..F
	defb 036h,082h,001h,026h,059h,002h,026h,034h,000h,046h,036h,0ffh,041h,027h,053h,001h	; b59b  6..&Y.&4.F6.A'S.
	defb 027h,0b0h,043h,027h,030h,002h,027h,015h,000h,027h,029h,0ffh,042h,037h,060h,043h	; b5ab  '.C'0.'..').B7`C
	defb 037h,079h,0ffh,002h,027h,074h,000h,027h,059h,082h,000h,027h,031h,003h,027h,0adh	; b5bb  7y..'t.'Y..'1.'.
	defb 002h,027h,074h,041h,027h,08eh,003h,027h,0b0h,0ffh,002h,047h,064h,081h,002h,047h	; b5cb  .'tA'..'...Gd..G
	defb 018h,043h,047h,08dh,0ffh,003h,028h,06bh,000h,028h,060h,082h,001h,028h,093h,003h	; b5db  .CG...(k.(`..(..
	defb 028h,09fh,080h,002h,028h,076h,001h,028h,0ach,002h,028h,015h,0ffh,002h,028h,075h	; b5eb  (...(v.(..(...(u
	defb 041h,028h,057h,002h,028h,016h,081h,003h,028h,06ch,081h,000h,028h,031h,003h,028h	; b5fb  A(W.(...(l..(1.(
	defb 0b1h,0ffh,003h,038h,0abh,000h,038h,031h,042h,038h,054h,001h,038h,0abh,082h,000h	; b60b  ...8..81B8T.8...
	defb 038h,091h,0ffh,002h,048h,071h,042h,048h,025h,003h,048h,0aah,0ffh,003h,048h,04ah	; b61b  8...HqBH%.H...HJ
	defb 041h,048h,047h,003h,048h,0abh,080h,081h,002h,048h,056h,081h,000h,048h,031h,002h	; b62b  AHG.H....HV..H1.
	defb 048h,016h,0ffh,041h,029h,068h,002h,029h,090h,081h,002h,029h,032h,000h,029h,02fh	; b63b  H..A)h.)...)2.)/
	defb 041h,029h,068h,003h,029h,0aeh,000h,029h,033h,0ffh,042h,057h,06eh,001h,057h,0abh	; b64b  A)h.)..)3.BWn.W.
	defb 083h,002h,057h,03bh,040h,057h,038h,003h,057h,0aah,0ffh,003h,057h,035h,081h,000h	; b65b  ..W.@W8.W...W5..
	defb 057h,02ch,043h,057h,066h,001h,057h,0afh,083h,002h,057h,037h,000h,057h,077h,002h	; b66b  W,CWf.W...W7.Ww.
	defb 057h,017h,0ffh,000h,067h,090h,082h,083h,040h,067h,021h,001h,067h,072h,083h,082h	; b67b  W...g...@g!.gr..
	defb 041h,067h,0a7h,0ffh,001h,067h,073h,082h,041h,067h,08eh,003h,067h,066h,002h,067h	; b68b  Ag...gs.Ag..gf.g
	defb 03dh,001h,067h,0b1h,000h,067h,020h,0ffh,000h,016h,05dh,003h,016h,03eh,080h,003h	; b69b  =.g..g ...]..>..
	defb 016h,071h,041h,016h,09ch,002h,016h,017h,0ffh,003h,017h,04fh,041h,017h,074h,000h	; b6ab  .qA........OA.t.
	defb 017h,059h,083h,002h,016h,0a7h,0ffh,041h,018h,073h,000h,018h,05ah,083h,042h,017h	; b6bb  .Y.....A.s..Z.B.
	defb 077h,041h,017h,078h,000h,017h,05ah,003h,018h,032h,0ffh,001h,018h,0aeh,042h,018h	; b6cb  wA.x..Z..2....B.
	defb 06bh,000h,018h,088h,001h,018h,0aeh,042h,018h,036h,003h,018h,0a7h,000h,018h,05fh	; b6db  k......B.6....._
	defb 082h,0ffh,041h,018h,061h,000h,018h,05ch,083h,0ffh,002h,037h,05ch,040h,037h,03eh	; b6eb  ..A.a..\...7\@7>
	defb 041h,037h,07bh,043h,037h,098h,0ffh,003h,037h,055h,080h,002h,037h,023h,080h,0ffh	; b6fb  A7{C7...7U..7#..
	defb 003h,049h,056h,080h,043h,04ah,085h,042h,048h,01dh,0ffh,001h,05ah,06ch,082h,001h	; b70b  .IV.CJ.BH...Zl..
	defb 04ah,091h,042h,04ah,06bh,003h,04ah,0a9h,000h,05ah,033h,082h,000h,06ah,039h,0ffh	; b71b  J.BJk.J..Z3..j9.
	defb 003h,068h,032h,001h,058h,056h,003h,058h,052h,001h,048h,053h,083h,002h,048h,017h	; b72b  .h2.XV.XR.HS..H.
	defb 000h,068h,05fh,0ffh,001h,049h,026h,002h,049h,026h,081h,002h,048h,072h,040h,058h	; b73b  .h_..I&.I&..Hr@X
	defb 075h,003h,059h,02eh,0ffh,002h,059h,072h,081h,000h,069h,092h,082h,003h,06ah,06fh	; b74b  u.Y...Yr..i...jo
	defb 080h,041h,05ah,073h,0ffh,002h,069h,094h,041h,059h,048h,003h,05ah,041h,041h,05ah	; b75b  .AZs..i.AYH.ZAAZ
	defb 073h,000h,05ah,050h,003h,05ah,04eh,000h,06ah,0b4h,0ffh,001h,059h,028h,002h,058h	; b76b  s.ZP.ZN.j...Y(.X
	defb 072h,081h,002h,058h,050h,000h,068h,02ch,002h,068h,01dh,003h,068h,04dh,001h,058h	; b77b  r..XP.h,.h..hM.X
	defb 027h,003h,059h,00dh,000h,069h,079h,0ffh,001h,069h,068h,003h,06ah,02eh,000h,06ah	; b78b  '.Y..iy..ih.j..j
	defb 03dh,083h,001h,06ah,068h,002h,069h,051h,000h,069h,02ch,082h,0ffh,001h,064h,068h	; b79b  =..jh.iQ.i,...dh
	defb 002h,064h,029h,081h,002h,064h,013h,000h,064h,02eh,001h,064h,068h,003h,064h,08fh	; b7ab  .d)..d..d..dh.d.
	defb 000h,064h,020h,0ffh,003h,064h,0a3h,080h,002h,064h,019h,0ffh,043h,017h,0a0h,042h	; b7bb  .d ..d...d..C..B
	defb 017h,020h,0ffh,001h,017h,079h,080h,002h,017h,019h,041h,017h,0a0h,000h,017h,079h	; b7cb  . ...y....A....y
	defb 003h,017h,0adh,000h,017h,050h,0ffh,003h,049h,080h,081h,002h,049h,050h,081h,0ffh	; b7db  .....P..I...IP..
	defb 000h,038h,095h,003h,038h,08bh,000h,048h,075h,042h,048h,034h,001h,038h,095h,003h	; b7eb  .8..8..HuBH4.8..
	defb 038h,064h,041h,028h,03ah,0ffh,002h,048h,033h,000h,048h,051h,002h,046h,017h,001h	; b7fb  8dA(:..H3.HQ.F..
	defb 026h,0a8h,003h,027h,0aah,000h,047h,0afh,002h,046h,057h,001h,026h,047h,003h,027h	; b80b  &..'..G..FW.&G.'
	defb 06bh,000h,037h,0afh,002h,036h,093h,000h,036h,030h,003h,037h,00ah,001h,037h,047h	; b81b  k.7..6..60.7..7G
	defb 003h,037h,06ah,002h,037h,015h,000h,037h,02eh,002h,036h,095h,001h,036h,0a3h,003h	; b82b  .7j.7..7..6..6..
	defb 037h,06bh,001h,027h,047h,002h,026h,054h,000h,046h,0aeh,003h,047h,0ach,001h,027h	; b83b  7k.'G.&T.F..G..'
	defb 0a8h,002h,026h,015h,000h,046h,04eh,003h,048h,02ch,001h,048h,063h,003h,048h,08fh	; b84b  ..&..FN.H,.Hc.H.
	defb 0ffh,001h,047h,04fh,002h,046h,016h,001h,026h,0adh,003h,027h,0aah,000h,047h,0b0h	; b85b  ..GO.F..&..'..G.
	defb 002h,046h,056h,001h,026h,052h,003h,027h,06bh,000h,037h,0b2h,002h,036h,094h,000h	; b86b  .FV.&R.'k.7..6..
	defb 036h,032h,003h,037h,00bh,001h,037h,050h,003h,037h,05eh,002h,037h,015h,000h,037h	; b87b  62.7..7P.7^.7..7
	defb 034h,002h,036h,096h,001h,036h,0aeh,003h,037h,06bh,001h,027h,052h,002h,026h,055h	; b88b  4.6..6..7k.'R.&U
	defb 000h,046h,0afh,003h,047h,0ach,001h,027h,0adh,002h,026h,013h,000h,046h,053h,003h	; b89b  .F..G..'..&..FS.
	defb 047h,02eh,000h,047h,02ch,0ffh,002h,046h,017h,001h,026h,0b0h,003h,027h,0ach,000h	; b8ab  G..G,..F..&..'..
	defb 047h,0b5h,002h,046h,056h,001h,026h,04dh,003h,027h,06bh,000h,037h,0b7h,002h,036h	; b8bb  G..FV.&M.'k.7..6
	defb 096h,000h,036h,03ch,003h,037h,00ah,001h,037h,057h,003h,037h,041h,002h,037h,013h	; b8cb  ..6<.7..7W.7A.7.
	defb 000h,037h,03ch,002h,036h,096h,001h,036h,0afh,003h,037h,06bh,001h,027h,048h,002h	; b8db  .7<.6..6..7k.'H.
	defb 026h,055h,000h,046h,0b5h,003h,047h,0abh,001h,027h,0afh,002h,026h,015h,000h,046h	; b8eb  &U.F..G..'..&..F
	defb 05bh,003h,046h,040h,0ffh,003h,017h,0adh,080h,001h,017h,0b0h,002h,017h,013h,000h	; b8fb  [.F@............
	defb 017h,079h,043h,017h,050h,002h,017h,013h,080h,001h,017h,0b0h,003h,017h,0afh,000h	; b90b  .yC.P...........
	defb 017h,079h,042h,017h,088h,0ffh,002h,037h,014h,080h,003h,037h,0aeh,002h,037h,070h	; b91b  .yB....7...7..7p
	defb 0ffh,001h,047h,054h,082h,043h,047h,08ch,001h,047h,0afh,082h,001h,037h,053h,082h	; b92b  ..GT.CG..G...7S.
	defb 000h,047h,054h,002h,047h,053h,040h,057h,0aah,0ffh,000h,057h,04fh,003h,058h,054h	; b93b  .GT.GS@W...WO.XT
	defb 041h,058h,089h,002h,058h,097h,001h,058h,0adh,002h,058h,02eh,000h,058h,065h,002h	; b94b  AX..X..X..X..Xe.
	defb 057h,019h,001h,057h,089h,002h,057h,010h,0ffh,001h,048h,0ach,080h,042h,047h,0a2h	; b95b  W..W..W...H..BG.
	defb 003h,048h,06ch,000h,048h,05bh,082h,001h,048h,080h,0ffh,095h,0b9h,0a8h,0b9h,0b5h	; b96b  .Hl.H[..H.......
	defb 0b9h,0c5h,0b9h,0cch,0b9h,0d3h,0b9h,0dah,0b9h,0e1h,0b9h,0e8h,0b9h,0efh,0b9h,0f6h	; b97b  ................
	defb 0b9h,08eh,0b9h,002h,025h,069h,003h,025h,0a6h,0ffh,001h,027h,055h,002h,026h,0abh	; b98b  ....%i.%...'U.&.
	defb 000h,036h,04bh,001h,026h,055h,003h,027h,015h,000h,027h,02ch,0ffh,002h,046h,076h	; b99b  .6K.&U.'..',..Fv
	defb 001h,046h,0afh,000h,046h,06eh,003h,047h,04eh,0ffh,002h,0b5h,07eh,000h,0b5h,025h	; b9ab  .F..Fn.GN...~..%
	defb 003h,0b5h,0a5h,001h,0b5h,04dh,003h,0b6h,05dh,0ffh,001h,0c7h,0ach,000h,0c7h,029h	; b9bb  .....M..]......)
	defb 0ffh,002h,0b9h,013h,003h,0b9h,08ch,0ffh,001h,028h,056h,000h,028h,04ah,0ffh,002h	; b9cb  .........(V.(J..
	defb 019h,07ch,003h,019h,0a1h,0ffh,002h,038h,019h,003h,038h,0a9h,0ffh,003h,038h,08ch	; b9db  .|.....8..8...8.
	defb 002h,037h,010h,0ffh,002h,047h,010h,003h,048h,0ach,0ffh,003h,048h,0a8h,002h,047h	; b9eb  .7...G..H...H..G
	defb 010h,0ffh,037h,0bah,047h,0bah,047h,0bah,03fh,0bah,03fh,0bah,037h,0bah,03fh,0bah	; b9fb  ..7.G.G.?.?.7.?.
	defb 037h,0bah,037h,0bah,037h,0bah,05fh,0bah,037h,0bah,000h,000h,000h,000h,000h,000h	; ba0b  7.7.7._.7.......
	defb 057h,0bah,05bh,0bah,06fh,0bah,053h,0bah,073h,0bah,06bh,0bah,06bh,0bah,069h,0bah	; ba1b  W.[.o.S.s.k.k.i.
	defb 04fh,0bah,04fh,0bah,035h,0bbh,03eh,0bbh,0b2h,0bah,0b5h,0bah,097h,0bah,0a4h,0bah	; ba2b  O.O.5.>.........
	defb 0b2h,0bah,0b5h,0bah,035h,0bbh,03eh,0bbh,0b2h,0bah,0b5h,0bah,097h,0bah,0abh,0bah	; ba3b  ....5.>.........
	defb 0b2h,0bah,0b5h,0bah,0b8h,0bah,017h,0bbh,0b8h,0bah,0bbh,0bah,0c1h,0bah,0d2h,0bah	; ba4b  ................
	defb 0e4h,0bah,0f2h,0bah,0ffh,0bah,00ah,0bbh,014h,0bbh,0b5h,0bah,0beh,0bah,0beh,0bah	; ba5b  ................
	defb 0b8h,0bah,017h,0bbh,0b2h,0bah,0b5h,0bah,0b8h,0bah,017h,0bbh,0b8h,0bah,017h,0bbh	; ba6b  ................
	defb 0b8h,0bah,017h,0bbh,014h,0bbh,0b5h,0bah,014h,0bbh,0b5h,0bah,014h,0bbh,0b5h,0bah	; ba7b  ................
	defb 014h,0bbh,0b5h,0bah,014h,0bbh,0b5h,0bah,014h,0bbh,0b5h,0bah,081h,003h,003h,007h	; ba8b  ................
	defb 002h,00bh,004h,003h,003h,00bh,003h,003h,000h,081h,04ch,003h,04ah,00ch,04ch,000h	; ba9b  ..........L.J.L.
	defb 081h,04ch,003h,04eh,00ch,04ch,000h,010h,003h,000h,010h,04ch,000h,010h,007h,000h	; baab  .L.N.L.....L....
	defb 010h,049h,000h,010h,00fh,000h,003h,00dh,08dh,003h,00bh,003h,007h,007h,00bh,009h	; babb  .I..............
	defb 00ch,00ch,00bh,00dh,00dh,000h,000h,083h,04eh,04ah,04ah,003h,04ch,002h,04bh,084h	; bacb  ........NJJ.L.K.
	defb 04ch,04eh,04bh,04bh,003h,04eh,081h,040h,000h,005h,00bh,003h,007h,002h,00ah,086h	; badb  LNKK.N.@........
	defb 003h,00bh,00bh,00ah,00bh,000h,000h,006h,04ch,002h,04ah,002h,047h,003h,04ch,083h	; baeb  ........L.J.G.L.
	defb 04dh,04ch,040h,000h,081h,00bh,003h,007h,002h,00bh,002h,007h,008h,00bh,000h,081h	; bafb  ML@.............
	defb 04ch,003h,04ah,082h,04ch,047h,00ah,04ch,000h,010h,00bh,000h,010h,048h,000h,085h	; bb0b  L.J.LG.L.....H..
	defb 007h,00bh,007h,007h,00bh,00bh,007h,086h,048h,04ch,04bh,04ch,04ch,04bh,00ah,048h	; bb1b  ........HLKLLK.H
	defb 000h,00ah,007h,006h,003h,00ah,048h,006h,04ch,000h,008h,007h,002h,003h,003h,00bh	; bb2b  ......H.L.......
	defb 003h,003h,000h,004h,048h,081h,04ah,003h,048h,008h,04ch,000h,008h,00bh,083h,007h	; bb3b  ....H.J.H.L.....
	defb 00bh,007h,003h,00bh,002h,003h,004h,04ch,081h,04eh,004h,04ch,084h,047h,048h,047h	; bb4b  .......L.N.L.GHG
	defb 047h,003h,04ch,000h,010h,003h,010h,04ch,000h,003h,000h,006h,00bh,002h,007h,085h	; bb5b  G.L....L........
	defb 00bh,007h,00bh,007h,007h,003h,040h,003h,04ch,081h,04eh,004h,04ch,085h,047h,04ch	; bb6b  ......@.L.N.L.GL
	defb 04ch,048h,048h,000h,088h,00dh,00bh,00bh,00dh,00dh,00bh,003h,00bh,003h,00dh,004h	; bb7b  LHH.............
	defb 00bh,08ah,00dh,04eh,04ch,04ch,04bh,04bh,04ch,04ch,04eh,04bh,004h,04eh,083h,04ch	; bb8b  ...NLLKKLLNK.N.L
	defb 04eh,04bh,000h,008h,00dh,008h,003h,003h,043h,006h,04eh,007h,04ch,000h,0d1h,0bbh	; bb9b  NK......C.N.L...
	defb 0d1h,0bbh,0e5h,0bbh,0e5h,0bbh,0f9h,0bbh,00dh,0bch,02bh,0bch,02bh,0bch,02bh,0bch	; bbab  ..........+.+.+.
	defb 02bh,0bch,02bh,0bch,03fh,0bch,03fh,0bch,03fh,0bch,053h,0bch,053h,0bch,053h,0bch	; bbbb  +.+.?.?.?.S.S.S.
	defb 053h,0bch,053h,0bch,053h,0bch,079h,01ch,004h,005h,040h,01ch,004h,005h,000h,003h	; bbcb  S.S.S.y...@.....
	defb 029h,083h,003h,006h,03ah,083h,002h,006h,001h,002h,01eh,010h,002h,009h,01eh,0b0h	; bbdb  )...:...........
	defb 002h,009h,003h,001h,020h,0a7h,005h,009h,0b0h,0a7h,005h,009h,001h,002h,050h,087h	; bbeb  .... .........P.
	defb 005h,006h,018h,087h,005h,006h,000h,002h,0b0h,01bh,003h,008h,018h,01bh,004h,008h	; bbfb  ................
	defb 000h,003h,01bh,09bh,004h,006h,03bh,09bh,003h,006h,001h,003h,012h,01bh,002h,006h	; bc0b  ................
	defb 079h,01bh,002h,006h,001h,003h,090h,09bh,003h,006h,070h,09bh,002h,006h,001h,003h	; bc1b  y.........p.....
	defb 015h,01ah,001h,007h,07ah,01ah,001h,007h,001h,003h,05ah,0a9h,001h,007h,015h,0a9h	; bc2b  ....z.....Z.....
	defb 001h,007h,000h,002h,01eh,089h,004h,006h,01eh,039h,004h,007h,003h,001h,07eh,020h	; bc3b  .........9....~
	defb 004h,008h,07eh,0a9h,004h,007h,002h,001h	; bc4b  ..~.....

; ======================================================================
; CODIGO 0xbc53..0xbc64  (17 bytes)
; ======================================================================


L_BC53:
	call L_BC5E		;bc53
	ld a,(0e1f0h)		;bc56
	or a			;bc59
	ret z			;bc5a
	jp L_BE09		;bc5b
L_BC5E:
	ld a,(0e1f1h)		;bc5e
	call 0424dh		;bc61

; ----------------------------------------------------------------------
; DATOS sin identificar  0xbc64..0xbc76  (18 bytes)
DATA_BC64:
	defb 076h,0bch,0bbh,0bch,0c2h,0bch,01fh,0bdh,032h,0bdh,053h,0bdh,07ah,0bdh,085h,0bdh	; bc64  v.......2.S.z...
	defb 0a7h,0bdh	; bc74

; ======================================================================
; CODIGO 0xbc76..0xbd14  (158 bytes)
; ======================================================================


L_BC76:
	ld a,0ffh		;bc76
	ld (0e1f3h),a		;bc78
	ld hl,0caf0h		;bc7b
	ld (hl),001h		;bc7e
	call 045f1h		;bc80
	call 04d16h		;bc83
	call 04266h		;bc86
	call 045d7h		;bc89
	call 07072h		;bc8c
	call 084f4h		;bc8f
	ld hl,00000h		;bc92
	ld d,h			;bc95
	ld e,l			;bc96
	ld bc,0c0c0h		;bc97
	call 0475ah		;bc9a
	ld de,060a8h		;bc9d
	ld hl,0cb03h		;bca0
	ld (hl),e			;bca3
	inc hl			;bca4
	inc hl			;bca5
	ld (hl),d			;bca6
	call 05febh		;bca7
	call 0439dh		;bcaa
	call 0437eh		;bcad
	call 04650h		;bcb0
	call 04606h		;bcb3
L_BCB6:
	ld hl,0e1f1h		;bcb6
	inc (hl)			;bcb9
	ret			;bcba
L_BCBB:
	ld a,070h		;bcbb
	ld (0e1f3h),a		;bcbd
	jr L_BCB6		;bcc0
L_BCC2:
	ld hl,03024h		;bcc2
	ld bc,06010h		;bcc5
	push hl			;bcc8
	push bc			;bcc9
	call L_BCE2		;bcca
	pop bc			;bccd
	pop hl			;bcce
	call L_BCFF		;bccf
	ld hl,0bd14h		;bcd2
	ld de,03828h		;bcd5
	call 04950h		;bcd8
	ld hl,0e1f2h		;bcdb
	ld (hl),040h		;bcde
	jr L_BCB6		;bce0
L_BCE2:
	ld de,030e0h		;bce2
	ld a,(0ca42h)		;bce5
	and 001h		;bce8
L_BCEA:
	jp 04767h		;bcea
L_BCED:
	ld de,03024h		;bced
	ld hl,030e0h		;bcf0
	ld bc,06010h		;bcf3
	ld a,(0ca42h)		;bcf6
	rlca			;bcf9
	rlca			;bcfa
	and 00ch		;bcfb
	jr L_BCEA		;bcfd
L_BCFF:
	ld a,(0ca42h)		;bcff
	ld d,a			;bd02
	ld a,099h		;bd03
	push hl			;bd05
	push bc			;bd06
	call 046ffh		;bd07
	pop de			;bd0a
	pop hl			;bd0b
	ld a,(0ca42h)		;bd0c
	ld c,007h		;bd0f
	jp 046bch		;bd11

; ----------------------------------------------------------------------
; DATOS sin identificar  0xbd14..0xbd1f  (11 bytes)
DATA_BD14:
	defb 026h,026h,05ch,0e6h,026h,071h,037h,02ch,04eh,0e0h,0ffh	; bd14  &&\.&q7,N..

; ======================================================================
; CODIGO 0xbd1f..0xbd74  (85 bytes)
; ======================================================================


L_BD1F:
	ld hl,0e1f2h		;bd1f
	dec (hl)			;bd22
	ret nz			;bd23
	ld hl,0e1f2h		;bd24
	ld (hl),0f0h		;bd27
	call L_BCED		;bd29
	call 06ab7h		;bd2c
	jp L_BCB6		;bd2f
L_BD32:
	call L_BD45		;bd32
	ld hl,0e1f2h		;bd35
	dec (hl)			;bd38
	ret nz			;bd39
	ld b,000h		;bd3a
	call L_BD4E		;bd3c
	call 06abbh		;bd3f
	jp L_BCB6		;bd42
L_BD45:
	ld a,(0ca03h)		;bd45
	rra			;bd48
	and 001h		;bd49
	rrca			;bd4b
	rrca			;bd4c
	ld b,a			;bd4d
L_BD4E:
	ld c,012h		;bd4e
	jp 00047h		;bd50   ; BIOS WRTVDP - Writes data in the VDP-register
L_BD53:
	ld hl,03024h		;bd53
	ld bc,06010h		;bd56
	push hl			;bd59
	push bc			;bd5a
	call L_BCE2		;bd5b
	pop bc			;bd5e
	pop hl			;bd5f
	call L_BCFF		;bd60
	ld hl,0bd74h		;bd63
	ld de,04828h		;bd66
	call 04950h		;bd69
	ld hl,0e1f2h		;bd6c
	ld (hl),040h		;bd6f
	jp L_BCB6		;bd71

; ----------------------------------------------------------------------
; DATOS sin identificar  0xbd74..0xbd7a  (6 bytes)
DATA_BD74:
	defb 036h,026h,034h,05ch,0e0h,0ffh	; bd74

; ======================================================================
; CODIGO 0xbd7a..0xbe7d  (259 bytes)
; ======================================================================


L_BD7A:
	ld hl,0e1f2h		;bd7a
	dec (hl)			;bd7d
	ret nz			;bd7e
	call L_BCED		;bd7f
	jp L_BCB6		;bd82
L_BD85:
	call L_BDFA		;bd85
	ld hl,0e1f3h		;bd88
	inc (hl)			;bd8b
	call L_BD9B		;bd8c
	ld a,(hl)			;bd8f
	cp 0b8h		;bd90
	ret c			;bd92
	ld hl,0e1f2h		;bd93
	ld (hl),040h		;bd96
	jp L_BCB6		;bd98
L_BD9B:
	ld a,(0cb03h)		;bd9b
	sub 016h		;bd9e
	cp (hl)			;bda0
	ret nc			;bda1
	ld hl,0cb03h		;bda2
	inc (hl)			;bda5
	ret			;bda6
L_BDA7:
	ld hl,0e1f2h		;bda7
	dec (hl)			;bdaa
	ret nz			;bdab
	xor a			;bdac
	ld (0e1f0h),a		;bdad
	ld a,0ffh		;bdb0
	ld (0e1f3h),a		;bdb2
	ld a,(0ca76h)		;bdb5
	cp 032h		;bdb8
	jr z,L_BDD3		;bdba
	ld hl,0ca50h		;bdbc
	ld (hl),001h		;bdbf
	inc l			;bdc1
	ld (hl),008h		;bdc2
	ld a,05fh		;bdc4
	ld (0cb03h),a		;bdc6
	ld a,080h		;bdc9
	ld (0cb05h),a		;bdcb
	ld a,009h		;bdce
	jp 08de3h		;bdd0
L_BDD3:
	xor a			;bdd3
	ld (0ca76h),a		;bdd4
	ld hl,0ca50h		;bdd7
	ld (hl),003h		;bdda
	inc l			;bddc
	ld (hl),008h		;bddd
	ld a,040h		;bddf
	ld (0cb03h),a		;bde1
	ld a,090h		;bde4
	ld (0cb05h),a		;bde6
	ld a,00ah		;bde9
	call 08de3h		;bdeb
	ld hl,00c30h		;bdee
	ld (0d418h),hl		;bdf1
	ld a,004h		;bdf4
	ld (0d41eh),a		;bdf6
	ret			;bdf9
L_BDFA:
	ld a,(0ca03h)		;bdfa
	and 007h		;bdfd
	ret nz			;bdff
	ld a,(0dfd2h)		;be00
	xor 001h		;be03
	ld (0dfd2h),a		;be05
	ret			;be08
L_BE09:
	call L_BE0E		;be09
	jr L_BE35		;be0c
L_BE0E:
	ld hl,0dc40h		;be0e
	ld a,(0e1f3h)		;be11
	sub 020h		;be14
	ld e,a			;be16
	ld d,058h		;be17
	ld c,058h		;be19
	call 05d41h		;be1b
	call 05d3dh		;be1e
	ld a,e			;be21
	add a,010h		;be22
	ld e,a			;be24
	ld a,(0dfd2h)		;be25
	or a			;be28
	jr z,L_BE2D		;be29
	ld a,008h		;be2b
L_BE2D:
	add a,c			;be2d
	ld c,a			;be2e
	call 05d3dh		;be2f
	jp 05d3dh		;be32
L_BE35:
	ld de,0ba97h		;be35
	ld hl,0db00h		;be38
	call 08de8h		;be3b
	ld de,0baa4h		;be3e
	ld hl,0db10h		;be41
	call 08de8h		;be44
	ld de,0bab2h		;be47
	ld hl,0db20h		;be4a
	call 08de8h		;be4d
	ld de,0bab5h		;be50
	ld hl,0db30h		;be53
	call 08de8h		;be56
	ld de,0ba97h		;be59
	ld hl,0db40h		;be5c
	call 08de8h		;be5f
	ld de,0baa4h		;be62
	ld hl,0db50h		;be65
	call 08de8h		;be68
	ld de,0bab2h		;be6b
	ld hl,0db60h		;be6e
	call 08de8h		;be71
	ld de,0bab5h		;be74
	ld hl,0db70h		;be77
	jp 08de8h		;be7a

; ----------------------------------------------------------------------
; DATOS sin identificar  0xbe7d..0xc000  (387 bytes)
DATA_BE7D:
	defb 020h,00dh,008h,006h,004h,004h,003h,003h,002h,002h,002h,002h,001h,001h,001h,001h	; be7d   ...............
	defb 033h,020h,016h,010h,00dh,00bh,009h,008h,007h,006h,006h,005h,005h,004h,004h,004h	; be8d  3 ..............
	defb 038h,02ah,020h,019h,015h,011h,00fh,00dh,00ch,00ah,009h,009h,008h,007h,007h,006h	; be9d  8* .............
	defb 03ah,02fh,027h,020h,01bh,017h,014h,012h,010h,00eh,00dh,00ch,00bh,00ah,00ah,009h	; bead  :/' ............
	defb 03bh,033h,02bh,025h,020h,01ch,019h,016h,014h,012h,010h,00fh,00eh,00dh,00ch,00bh	; bebd  .3+% ...........
	defb 03ch,035h,02eh,029h,024h,020h,01ch,01ah,017h,015h,014h,012h,011h,010h,00fh,00eh	; becd  <5.)$ ..........
	defb 03dh,037h,031h,02ch,027h,023h,020h,01dh,01ah,018h,016h,015h,013h,012h,011h,010h	; bedd  =71,'# .........
	defb 03dh,038h,033h,02eh,02ah,026h,023h,020h,01dh,01bh,019h,017h,016h,015h,013h,012h	; beed  =83.*&# ........
	defb 03dh,039h,034h,030h,02ch,028h,025h,022h,020h,01eh,01ch,01ah,018h,017h,015h,014h	; befd  =940,(%" .......
	defb 03eh,039h,035h,031h,02eh,02ah,027h,025h,022h,020h,01eh,01ch,01ah,019h,017h,016h	; bf0d  >951.*'%" ......
	defb 03eh,03ah,036h,033h,02fh,02ch,029h,027h,024h,022h,020h,01eh,01ch,01bh,019h,018h	; bf1d  >:63/,)'$" .....
	defb 03eh,03bh,037h,034h,031h,02eh,02bh,028h,026h,024h,022h,020h,01eh,01dh,01bh,01ah	; bf2d  >.741.+(&$" ....
	defb 03eh,03bh,038h,035h,032h,02fh,02ch,02ah,028h,025h,023h,022h,020h,01eh,01dh,01ch	; bf3d  >.852/,*(%#" ...
	defb 03eh,03bh,038h,036h,033h,030h,02eh,02bh,029h,027h,025h,023h,021h,020h,01eh,01dh	; bf4d  >.8630.+)'%#! ..
	defb 03eh,03ch,039h,036h,034h,031h,02fh,02ch,02ah,028h,026h,025h,023h,021h,020h,01eh	; bf5d  ><9641/,*(&%#! .
	defb 03fh,03ch,039h,037h,034h,032h,030h,02dh,02bh,029h,028h,026h,024h,023h,021h,020h	; bf6d  ?<97420-+)(&$#!
	defb 000h,006h,00ch,012h,019h,01fh,026h,02ch,032h,038h,03eh,044h,04ah,050h,056h,05ch	; bf7d  ......&,28>DJPV\
	defb 062h,068h,06dh,073h,079h,07eh,084h,089h,08eh,093h,099h,09eh,0a2h,0a7h,0ach,0b1h	; bf8d  bhmsy~..........
	defb 0b5h,0b9h,0beh,0c2h,0c6h,0cah,0ceh,0d1h,0d5h,0d8h,0dch,0dfh,0e2h,0e5h,0e7h,0eah	; bf9d  ................
	defb 0edh,0efh,0f1h,0f3h,0f5h,0f7h,0f8h,0fah,0fbh,0fch,0fdh,0feh,0feh,0ffh,0ffh,0ffh	; bfad  ................
	defb 000h,001h,0f7h,000h,0ddh,000h,0b5h,000h,080h,000h,042h,000h,000h,000h,0beh,0ffh	; bfbd  ..........B.....
	defb 080h,0ffh,04bh,0ffh,023h,0ffh,009h,0ffh,000h,0ffh,009h,0ffh,023h,0ffh,04bh,0ffh	; bfcd  ..K.#.......#.K.
	defb 080h,0ffh,0beh,0ffh,000h,000h,042h,000h,080h,000h,0b5h,000h,0ddh,000h,0f7h,000h	; bfdd  ......B.........
	defb 000h,001h,0f7h,000h,0ddh,000h,0b5h,000h,080h,000h,042h,000h,0c0h,021h,0a4h,0d8h	; bfed  ..........B..!..
	defb 0c3h,0e5h,0b3h	; bffd
