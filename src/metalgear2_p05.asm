; ==========================================================================
; METAL GEAR 2 SOLID SNAKE - Konami (1990) - MSX2 - MegaROM RC-767 de 512 KB (Konami SCC) - banco 05 (se ejecuta en 0xa000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x0a000


; ----------------------------------------------------------------------
; DATOS sin identificar  0xa000..0xa5f3  (1523 bytes)
DATA_A000:
	defb 0a2h,0ddh,035h,00eh,0c0h,0afh,032h,041h,0d4h,0cdh,000h,081h,020h,008h,0cdh,053h	; a000  ..5...2A.... ..S
	defb 081h,03eh,0ffh,032h,014h,0d5h,0c3h,03ah,0a2h,03ah,04bh,0cah,0feh,00eh,0c0h,03ah	; a010  .>.2...:.:K....:
	defb 0c0h,0e1h,0a7h,0c8h,0ddh,07eh,000h,0feh,007h,0c0h,0ddh,07eh,001h,0feh,029h,0c8h	; a020  .....~.....~..).
	defb 0d6h,01ch,0feh,005h,0d8h,03ah,04bh,0cah,0feh,00eh,0c0h,03ah,021h,0cbh,0feh,00fh	; a030  .....:K....:!...
	defb 0c0h,03ah,090h,0cah,0feh,005h,0c0h,0afh,0ddh,077h,00ch,0ddh,036h,00eh,010h,0ddh	; a040  .:.......w..6...
	defb 07eh,001h,0feh,021h,03eh,01ch,020h,006h,0ddh,036h,00dh,000h,03eh,029h,0ddh,077h	; a050  ~..!>. ..6..>).w
	defb 001h,0c9h,0ddh,035h,00eh,0c0h,0cdh,025h,09dh,03eh,003h,0cdh,025h,08eh,0c3h,07bh	; a060  ...5...%.>..%..{
	defb 0a2h,0ddh,035h,00eh,0c0h,0ddh,036h,00eh,010h,0ddh,036h,001h,020h,0c3h,025h,09dh	; a070  ..5...6...6. .%.
	defb 006h,098h,0cdh,08ah,0a0h,0d8h,0afh,0c3h,025h,08eh,0ddh,07eh,005h,0b8h,038h,005h	; a080  ........%..~..8.
	defb 0cdh,07bh,0a2h,0b7h,0c9h,0cdh,00bh,090h,037h,0c9h,0ddh,07eh,003h,0feh,02ah,0d2h	; a090  .{......7..~..*.
	defb 00bh,090h,03eh,003h,0cdh,025h,08eh,0c3h,07bh,0a2h,006h,0aah,0cdh,08ah,0a0h,0d8h	; a0a0  ..>..%..{.......
	defb 0afh,0ddh,077h,00dh,0ddh,077h,00ch,0ddh,036h,00eh,010h,0c9h,0ddh,035h,00eh,0c0h	; a0b0  ..w..w..6....5..
	defb 03eh,002h,032h,0c0h,0e1h,021h,022h,0cah,07eh,0feh,008h,030h,008h,03eh,008h,032h	; a0c0  >.2..!".~..0.>.2
	defb 022h,0cah,0cdh,012h,07ah,0cdh,033h,06ch,0c3h,07bh,0a2h,0ddh,034h,00eh,0c3h,051h	; a0d0  "...z.3l.{..4..Q
	defb 09eh,0cdh,00bh,090h,0ddh,07eh,003h,0feh,030h,0d0h,018h,01eh,0a7h,0c9h,03ah,030h	; a0e0  .....~..0.....:0
	defb 0d4h,0feh,002h,028h,0f7h,0ddh,07eh,000h,0feh,002h,020h,0f0h,0cdh,000h,081h,020h	; a0f0  ...(..~... ....
	defb 0ebh,0ddh,07eh,007h,0a7h,001h,006h,000h,020h,003h,001h,007h,002h,078h,0c5h,0cdh	; a100  ..~..... ....x..
	defb 025h,08eh,0c1h,0ddh,071h,001h,037h,0c9h,0cdh,00bh,090h,0cdh,0e6h,080h,0ddh,07eh	; a110  %...q.7........~
	defb 00bh,0feh,005h,0c0h,0ddh,07eh,005h,0feh,090h,0d0h,001h,01bh,000h,018h,0deh,0cdh	; a120  .....~..........
	defb 00bh,090h,0ddh,07eh,003h,0feh,018h,0d0h,0afh,0ddh,077h,000h,03ch,032h,030h,0d4h	; a130  ...~......w.<20.
	defb 03eh,040h,032h,031h,0d4h,0cdh,073h,082h,0c3h,0f3h,080h,0cdh,00bh,090h,0ddh,07eh	; a140  >@21..s........~
	defb 005h,0feh,070h,0d0h,0ddh,036h,001h,017h,0ddh,036h,00dh,002h,03eh,001h,0c3h,025h	; a150  ..p..6...6..>..%
	defb 08eh,0cdh,00bh,090h,0ddh,07eh,005h,0feh,048h,0d0h,021h,0c9h,0cah,0afh,0ddh,077h	; a160  .....~..H.!....w
	defb 001h,0ddh,077h,00dh,0ddh,077h,00ch,03ch,077h,03eh,008h,0ddh,077h,01ch,0cdh,000h	; a170  ..w..w.<w>..w...
	defb 081h,0c0h,0cdh,033h,06ch,0c3h,0a8h,08dh,011h,004h,016h,00eh,002h,0cdh,00bh,090h	; a180  ...3l...........
	defb 0ddh,07eh,003h,0feh,0b0h,0d8h,0ddh,072h,001h,0ddh,073h,00dh,079h,0c3h,025h,08eh	; a190  .~.....r..s.y.%.
	defb 011h,006h,01ah,00eh,003h,018h,0e6h,0cdh,00bh,090h,0ddh,07eh,005h,0feh,050h,0d0h	; a1a0  ...........~..P.
	defb 0cdh,058h,0a1h,0c3h,07bh,0a2h,0cdh,00bh,090h,0ddh,07eh,005h,0feh,0b0h,0d8h,021h	; a1b0  .X..{.....~....!
	defb 0cah,0cah,0c3h,06dh,0a1h,0ddh,035h,00eh,0c0h,03ah,021h,0d5h,0a7h,020h,00fh,0cdh	; a1c0  ...m..5..:!.. ..
	defb 000h,081h,03eh,001h,020h,005h,032h,029h,0d5h,018h,003h,032h,099h,0d5h,0ddh,036h	; a1d0  ..>. .2)...2...6
	defb 00eh,008h,0c3h,07bh,0a2h,0ddh,035h,00eh,0c0h,021h,0c0h,0d2h,001h,03fh,000h,0cdh	; a1e0  ...{..5..!...?..
	defb 036h,042h,0ddh,0e5h,0ddh,021h,0c0h,0d2h,0ddh,036h,000h,018h,0ddh,036h,010h,0ffh	; a1f0  6B...!...6...6..
	defb 0cdh,053h,081h,0ddh,0e1h,0ddh,036h,00eh,008h,0c3h,07bh,0a2h,0ddh,035h,00eh,0c0h	; a200  .S....6...{..5..
	defb 0cdh,03ah,0a2h,0afh,032h,021h,0d5h,032h,029h,0d5h,032h,099h,0d5h,0cdh,000h,081h	; a210  .:..2!.2).2.....
	defb 0c0h,021h,040h,048h,011h,040h,028h,001h,020h,018h,03ah,042h,0cah,0a7h,03eh,005h	; a220  .!@H.@(. .:B..>.
	defb 020h,001h,0afh,0c3h,067h,047h,0ddh,035h,00eh,0c0h,0ddh,036h,001h,004h,0c9h,0ddh	; a230   ...gG.5...6....
	defb 0e5h,0ddh,021h,0c0h,0d2h,0ddh,036h,000h,000h,0cdh,04ch,083h,0ddh,0e1h,018h,02bh	; a240  ..!...6...L....+
	defb 0cdh,0eeh,0a0h,0d8h,0cdh,06bh,09fh,0c8h,0cdh,022h,09fh,0c8h,0cdh,082h,08eh,0dah	; a250  .....k..."......
	defb 07bh,0a2h,0c3h,00bh,090h,0ddh,07eh,01ah,0a7h,028h,03fh,0ddh,07eh,00dh,0e6h,0feh	; a260  {.....~..(?.~...
	defb 0ddh,077h,015h,0ddh,036h,00ch,000h,0ddh,036h,00eh,080h,0ddh,034h,001h,0c9h,0cdh	; a270  .w..6...6...4...
	defb 085h,0a2h,028h,0f7h,0c9h,0ddh,035h,00eh,0c8h,006h,000h,0ddh,0cbh,00eh,066h,028h	; a280  ..(...5.......f(
	defb 009h,006h,008h,0ddh,0cbh,00eh,06eh,028h,001h,004h,0ddh,07eh,015h,0e6h,0feh,080h	; a290  ......n(...~....
	defb 0ddh,077h,00dh,0f6h,001h,0c9h,0cdh,085h,0a2h,0c0h,0c3h,03ah,0a2h,0ddh,07eh,001h	; a2a0  .w.........:..~.
	defb 0feh,025h,0cah,09ah,09eh,0feh,026h,0cah,0a4h,09eh,0cdh,04dh,042h,0d5h,0a2h,009h	; a2b0  .%....&....MB...
	defb 0a3h,07bh,0a4h,09dh,0a4h,0a9h,0a4h,00bh,090h,0b0h,09dh,0eah,0a5h,0cdh,08eh,0d9h	; a2c0  .{..............
	defb 08eh,005h,09eh,090h,0a4h,0cdh,07bh,0a2h,0afh,0ddh,077h,00fh,0ddh,077h,02ah,03ah	; a2d0  ......{...w..w*:
	defb 076h,0cah,0a7h,03ah,01eh,0d4h,028h,003h,03ah,049h,0d4h,03dh,0ddh,077h,01dh,0cdh	; a2e0  v..:..(.:I.=.w..
	defb 025h,08eh,0ddh,0e5h,0e1h,07dh,0e6h,010h,001h,020h,03fh,028h,003h,001h,018h,01fh	; a2f0  %....}... ?(....
	defb 0cdh,056h,042h,0a0h,081h,0ddh,077h,00eh,0c9h,03ah,02ah,0d4h,0a7h,020h,058h,0cdh	; a300  .VB...w..:*.. X.
	defb 05dh,0a4h,030h,02ah,0cdh,038h,090h,020h,025h,0cdh,0c0h,0a3h,038h,020h,0ddh,035h	; a310  ].0*.8. %...8 .5
	defb 00eh,0c2h,00bh,090h,0ddh,034h,00fh,0ddh,07eh,00fh,0e6h,003h,028h,02eh,0ddh,07eh	; a320  .....4..~...(..~
	defb 01dh,0eeh,002h,0e6h,002h,047h,0cdh,0eah,0a3h,0e6h,001h,0b0h,018h,0aeh,0cdh,09ah	; a330  .....G..........
	defb 08fh,0ddh,034h,00fh,0ddh,07eh,00fh,0e6h,003h,028h,011h,0ddh,07eh,01dh,0feh,002h	; a340  ..4..~...(..~...
	defb 030h,005h,0cdh,0f3h,0a3h,018h,095h,0cdh,042h,0a4h,018h,090h,0ddh,036h,00ch,000h	; a350  0.......B....6..
	defb 0ddh,036h,00eh,0c0h,0c3h,07bh,0a2h,0cdh,01bh,09dh,0ddh,036h,001h,003h,0cdh,056h	; a360  .6...{.....6...V
	defb 042h,0e6h,003h,0c3h,025h,08eh,0ddh,036h,00ch,000h,0ddh,036h,001h,00bh,0ddh,07eh	; a370  B...%..6...6...~
	defb 003h,0d6h,030h,030h,001h,0afh,06fh,0ddh,07eh,005h,0d6h,030h,026h,000h,038h,006h	; a380  ..00..o.~..0&.8.
	defb 026h,068h,0bch,030h,001h,067h,022h,039h,0d4h,011h,0e0h,000h,001h,010h,058h,03ah	; a390  &h.0.g"9......X:
	defb 042h,0cah,0e5h,0cdh,067h,047h,0e1h,001h,00ch,058h,03ah,042h,0cah,057h,03eh,099h	; a3a0  B...gG...X:B.W>.
	defb 0e5h,0cdh,0ffh,046h,0e1h,011h,00ch,058h,00eh,007h,03ah,042h,0cah,0c3h,0bch,046h	; a3b0  ...F...X..:B...F
	defb 03ah,02bh,0d4h,0a7h,0c8h,021h,000h,0d3h,011h,040h,0d3h,01ah,0a6h,0c8h,023h,023h	; a3c0  :+...!...@....##
	defb 023h,013h,013h,013h,01ah,096h,030h,002h,0edh,044h,0feh,010h,0d0h,023h,023h,013h	; a3d0  #.....0..D...##.
	defb 013h,01ah,096h,030h,002h,0edh,044h,0feh,00ch,0c9h,0ddh,0e5h,0e1h,07dh,00fh,00fh	; a3e0  ...0..D......}..
	defb 00fh,00fh,0c9h,00eh,008h,0cdh,019h,0a4h,0c5h,00eh,0f8h,0cdh,019h,0a4h,078h,050h	; a3f0  ..............xP
	defb 0c1h,080h,0feh,004h,038h,008h,07ah,0b8h,03eh,002h,0d0h,03eh,003h,0c9h,0ddh,07eh	; a400  ....8.z.>..>...~
	defb 01dh,01fh,03fh,017h,0c9h,016h,001h,018h,002h,016h,000h,0ddh,066h,005h,0ddh,07eh	; a410  ..?.........f..~
	defb 003h,0d6h,006h,06fh,006h,000h,0e5h,0d5h,0c5h,0cdh,03dh,07fh,0c1h,0d1h,0e1h,0d8h	; a420  ...o......=.....
	defb 07ah,0a7h,020h,005h,07ch,081h,067h,018h,003h,07dh,081h,06fh,0feh,0c0h,0d0h,004h	; a430  z. .|.g..}.o....
	defb 018h,0e4h,00eh,008h,0cdh,015h,0a4h,0c5h,00eh,0f8h,0cdh,015h,0a4h,078h,050h,0c1h	; a440  .............xP.
	defb 080h,0feh,004h,038h,0b9h,07ah,0b8h,03eh,000h,0d0h,03eh,001h,0c9h,0ddh,07eh,00ch	; a450  ...8.z.>..>...~.
	defb 01fh,001h,0b0h,010h,0ddh,07eh,003h,038h,00fh,0ddh,07eh,009h,017h,0ddh,07eh,005h	; a460  .....~.8..~...~.
	defb 001h,0b4h,000h,030h,003h,001h,0b0h,010h,090h,0b9h,0c9h,03ah,02ah,0d4h,0a7h,0c2h	; a470  ...0.......:*...
	defb 067h,0a3h,0ddh,035h,00eh,028h,00fh,0ddh,07eh,00eh,0e6h,00fh,0c0h,0c3h,00dh,08fh	; a480  g..5.(..~.......
	defb 0ddh,035h,00eh,0c2h,051h,09eh,0ddh,036h,001h,001h,0c3h,02eh,0a3h,0cdh,038h,090h	; a490  .5..Q..6......8.
	defb 0cah,00bh,090h,0cdh,07bh,0a2h,0c3h,07ch,0a5h,0ddh,07eh,00ch,01fh,030h,011h,0ddh	; a4a0  ....{..|..~..0..
	defb 07eh,007h,017h,03eh,000h,011h,001h,001h,038h,015h,03ch,011h,002h,010h,018h,00fh	; a4b0  ~..>....8.<.....
	defb 0ddh,07eh,009h,017h,03eh,002h,011h,004h,001h,038h,004h,03ch,011h,008h,010h,0d5h	; a4c0  .~..>....8.<....
	defb 0ddh,077h,01dh,021h,09bh,0a5h,0cdh,04eh,042h,0d1h,079h,0e6h,00eh,020h,004h,079h	; a4d0  .w.!...NB.y.. .y
	defb 0a2h,020h,011h,0d5h,0cdh,0c8h,090h,0d1h,07bh,0a1h,0cah,00bh,090h,0afh,0ddh,077h	; a4e0  . ......{......w
	defb 02ah,0c3h,07ch,0a5h,0ddh,034h,02ah,03ah,04ah,0cah,0feh,00ah,006h,005h,020h,009h	; a4f0  *.|..4*:J..... .
	defb 03ah,050h,0cah,0feh,004h,030h,002h,006h,003h,0ddh,07eh,02ah,0b8h,0d2h,00bh,090h	; a500  :P...0....~*....
	defb 0ddh,066h,005h,0ddh,06eh,003h,0ddh,07eh,00ch,01fh,030h,02fh,0ddh,07eh,007h,017h	; a510  .f..n..~..0/.~..
	defb 006h,008h,030h,002h,006h,0f8h,07dh,0feh,0c0h,0d2h,07bh,0a2h,0e5h,0c5h,07ch,0d6h	; a520  ..0...}...{...|.
	defb 004h,067h,0cdh,03dh,07fh,0c1h,0e1h,038h,03eh,0e5h,0c5h,07ch,0c6h,003h,067h,0cdh	; a530  .g.=...8>..|..g.
	defb 03dh,07fh,0c1h,0e1h,038h,031h,07dh,080h,06fh,018h,0dbh,0ddh,07eh,009h,017h,006h	; a540  =...81}.o...~...
	defb 008h,030h,002h,006h,0f8h,07ch,0feh,0c0h,0d2h,07bh,0a2h,0e5h,0c5h,02dh,0cdh,03dh	; a550  .0...|...{...-.=
	defb 07fh,0c1h,0e1h,038h,012h,0e5h,0c5h,07dh,0d6h,004h,06fh,0cdh,03dh,07fh,0c1h,0e1h	; a560  ...8...}..o.=...
	defb 038h,005h,07ch,080h,067h,018h,0deh,021h,0e6h,0a5h,018h,003h,021h,0e2h,0a5h,0ddh	; a570  8.|.g..!....!...
	defb 07eh,01dh,0cdh,048h,042h,0ddh,077h,01dh,0f5h,0cdh,0c8h,090h,0f1h,047h,004h,079h	; a580  ~..HB.w......G.y
	defb 01fh,010h,0fdh,038h,0e7h,0ddh,07eh,01dh,0c3h,025h,08eh,0a3h,0a5h,0cah,0a5h,0d2h	; a590  ...8..~..%......
	defb 0a5h,0dah,0a5h,011h,006h,000h,001h,0eeh,00bh,0ddh,07eh,003h,081h,06fh,0ddh,07eh	; a5a0  ..........~..o.~
	defb 005h,080h,067h,001h,000h,005h,0e5h,0d5h,0c5h,0cdh,03dh,07fh,0c1h,0d1h,0e1h,0cbh	; a5b0  ..g.......=.....
	defb 011h,07ch,082h,067h,07dh,083h,06fh,010h,0edh,0c9h,011h,006h,000h,001h,0eeh,0f3h	; a5c0  .|.g}.o.........
	defb 018h,0d7h,011h,000h,006h,001h,0eeh,0f3h,018h,0cfh,011h,000h,006h,001h,006h,0f4h	; a5d0  ................
	defb 018h,0c7h,002h,003h,001h,000h,003h,002h,000h,001h,0cdh,0ceh,09dh,0d0h,0ddh,036h	; a5e0  ...............6
	defb 001h,00ah,0c9h	; a5f0

; ======================================================================
; CODIGO 0xa5f3..0xa614  (33 bytes)
; ======================================================================


L_A5F3:
	call 08100h		;a5f3
	jp nz,086a4h		;a5f6
	ld hl,06bcch		;a5f9
	call 086d5h		;a5fc
	ld a,(ix+001h)		;a5ff
	ld hl,0a614h		;a602
	call 0424eh		;a605
	call 08082h		;a608
	ld a,(ix+001h)		;a60b
	cp 006h		;a60e
	ret c			;a610
	jp 08671h		;a611

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa614..0xaa43  (1071 bytes)
DATA_A614:
	defb 038h,0a6h,03ch,0a6h,05fh,0a6h,06ch,0a6h,08ah,0a6h,0fbh,0a6h,004h,0a7h,018h,0a7h	; a614  8.<._.l.........
	defb 0c3h,0a7h,0deh,0a8h,00ah,0a9h,019h,0a9h,019h,0a9h,043h,0a9h,098h,0a9h,0e4h,0a9h	; a624  ..........C.....
	defb 026h,0aah,036h,0aah,0ddh,034h,001h,0c9h,0cdh,079h,080h,07dh,0d6h,050h,0feh,030h	; a634  &.6..4...y.}.P.0
	defb 0d0h,07ch,0d6h,078h,0feh,008h,0d0h,021h,0d1h,0d7h,0cbh,0feh,03eh,001h,032h,03ch	; a644  .|.x...!....>.2<
	defb 0cbh,0ddh,036h,00eh,020h,0cdh,038h,0a6h,0c3h,0c2h,086h,0ddh,035h,00eh,0c0h,011h	; a654  ..6. .8.....5...
	defb 010h,000h,0cdh,0ceh,061h,0c3h,038h,0a6h,00eh,040h,0cdh,075h,0a6h,0d0h,0c3h,047h	; a664  ....a.8..@.u...G
	defb 06ch,0c5h,0cdh,047h,062h,0c1h,0c0h,0ddh,036h,01ch,000h,0ddh,071h,00eh,0cdh,0c7h	; a674  l..Gb...6...q...
	defb 079h,0cdh,038h,0a6h,037h,0c9h,0cdh,0afh,0a6h,0ddh,035h,00eh,028h,015h,0ddh,07eh	; a684  y.8.7.....5.(..~
	defb 00eh,0feh,01dh,0cch,0a2h,0a6h,0feh,010h,0c0h,0ddh,036h,00dh,007h,0c9h,0ddh,036h	; a694  ..........6....6
	defb 00dh,002h,0c9h,0cdh,0f0h,0a6h,011h,010h,001h,018h,0b7h,021h,060h,0dch,006h,003h	; a6a4  ...........!`...
	defb 016h,060h,072h,023h,036h,058h,023h,0ddh,07eh,00eh,01fh,03eh,028h,01eh,02ch,038h	; a6b4  .`r#6X#.~..>(.,8
	defb 004h,03eh,030h,01eh,034h,077h,023h,023h,072h,023h,036h,058h,023h,073h,023h,023h	; a6c4  .>0.4w##r#6X#s##
	defb 07ah,0d6h,00ah,057h,010h,0dch,021h,080h,0dbh,011h,0e3h,0a6h,0c3h,0e0h,051h,010h	; a6d4  z..W..!.......Q.
	defb 007h,010h,008h,010h,007h,010h,008h,010h,007h,010h,008h,000h,021h,060h,0dch,001h	; a6e4  ............!`..
	defb 01fh,000h,03eh,0e0h,0c3h,037h,042h,00eh,000h,0cdh,075h,0a6h,0d0h,0c3h,085h,086h	; a6f4  ..>..7B...u.....
	defb 0afh,032h,03ch,0cbh,0ddh,077h,011h,0ddh,077h,00eh,0ddh,077h,00dh,03ch,0ddh,077h	; a704  .2<..w..w..w.<.w
	defb 016h,0c3h,038h,0a6h,0ddh,07eh,017h,03dh,028h,01eh,0cdh,067h,0a7h,038h,019h,0ddh	; a714  ..8..~.=(..g.8..
	defb 07eh,007h,0a7h,020h,008h,0ddh,07eh,005h,0feh,080h,0d2h,0bfh,0a8h,0cdh,003h,0a8h	; a724  ~.. ..~.........
	defb 0ddh,07eh,00eh,0a7h,0c0h,0c3h,0e6h,0a7h,0ddh,036h,001h,009h,021h,05fh,0a7h,0cdh	; a734  .~.......6..!_..
	defb 056h,042h,0e6h,003h,0cdh,0f6h,043h,0ddh,075h,018h,0ddh,074h,019h,0afh,0ddh,077h	; a744  VB....C.u..t...w
	defb 00ch,0ddh,077h,016h,0ddh,036h,00eh,008h,0c3h,04bh,06ch,030h,018h,030h,070h,0a8h	; a754  ..w..6...Kl0.0p.
	defb 018h,0a8h,070h,0cdh,079h,080h,0ebh,07ah,0d6h,038h,0feh,090h,0d0h,07bh,0d6h,050h	; a764  ..p.y..z.8...{.P
	defb 0feh,030h,0c9h,0ddh,07eh,00dh,00fh,0e6h,003h,047h,0ddh,07eh,000h,021h,0adh,0a7h	; a774  .0..~....G.~.!..
	defb 0cdh,0f6h,043h,0ebh,078h,021h,09ch,0a7h,0cdh,04eh,042h,0cdh,097h,080h,0ebh,0cdh	; a784  ..C.x!...NB.....
	defb 0a7h,080h,03eh,003h,0ddh,077h,00ch,0c9h,0a4h,0a7h,0a7h,0a7h,0ach,0a7h,0afh,0a7h	; a794  ..>..w..........
	defb 0cdh,042h,044h,0ebh,011h,000h,000h,0c9h,0cdh,042h,044h,021h,000h,000h,0c9h,000h	; a7a4  .BD......BD!....
	defb 004h,000h,004h,000h,002h,000h,003h,080h,003h,080h,001h,080h,003h,080h,002h,0ddh	; a7b4  ................
	defb 07eh,017h,03dh,0cah,062h,0a8h,0cdh,067h,0a7h,0d2h,062h,0a8h,0ddh,07eh,007h,0a7h	; a7c4  ~.=.b..g..b..~..
	defb 020h,008h,0ddh,07eh,005h,0feh,090h,0d2h,0bfh,0a8h,0cdh,003h,0a8h,0ddh,07eh,00eh	; a7d4   ..~..........~.
	defb 0a7h,0c0h,0ddh,07eh,00dh,0ddh,077h,01bh,0cdh,0d2h,0a8h,001h,00bh,00ch,0ddh,070h	; a7e4  ...~..w........p
	defb 00eh,0ddh,036h,00ch,000h,0ddh,07eh,001h,0ddh,077h,01ah,0ddh,071h,001h,0c9h,0cdh	; a7f4  ..6...~..w..q...
	defb 0deh,086h,0ddh,036h,00fh,000h,0ddh,035h,00eh,0c8h,0ddh,07eh,003h,0d6h,020h,0feh	; a804  ...6...5...~.. .
	defb 0a0h,030h,018h,0ddh,07eh,005h,0d6h,008h,0feh,0b0h,030h,00fh,0cdh,0c8h,090h,0ddh	; a814  .0..~.....0.....
	defb 07eh,00ch,01fh,03eh,003h,038h,002h,03eh,00ch,0a1h,0c8h,0ddh,036h,00eh,000h,0ddh	; a824  ~..>.8.>....6...
	defb 036h,00fh,001h,0cdh,08bh,080h,03eh,003h,0c3h,085h,080h,0cdh,075h,0a8h,018h,003h	; a834  6.....>.....u...
	defb 0cdh,094h,0a8h,0cdh,077h,0a7h,0cdh,056h,042h,0e6h,007h,0c6h,008h,0ddh,077h,00eh	; a844  ....w..VB.....w.
	defb 04fh,0ddh,07eh,000h,0feh,005h,0c0h,079h,0c6h,010h,0ddh,077h,00eh,0c9h,021h,06dh	; a854  O.~....y...w..!m
	defb 0a8h,0cdh,043h,0a7h,0ddh,036h,001h,00ah,0c9h,060h,048h,060h,068h,078h,048h,078h	; a864  ..C..6...`H`hxHx
	defb 068h,0cdh,056h,042h,057h,0ddh,07eh,00dh,0feh,004h,030h,00ah,07ah,01fh,016h,004h	; a874  h.VBW.~...0.z...
	defb 038h,016h,016h,006h,018h,012h,07ah,01fh,016h,000h,038h,00ch,016h,002h,018h,008h	; a884  8.....z...8.....
	defb 0cdh,056h,042h,007h,007h,0e6h,006h,057h,0cdh,0b0h,0a8h,030h,00bh,07ah,00fh,0e6h	; a894  .VB....W...0.z..
	defb 003h,021h,0bbh,0a8h,0cdh,03eh,042h,056h,0ddh,072h,00dh,0c9h,07ah,00fh,0e6h,003h	; a8a4  .!...>BV.r..z...
	defb 047h,004h,079h,01fh,010h,0fdh,0c9h,002h,000h,006h,004h,0ddh,07eh,00dh,0e6h,0feh	; a8b4  G.y.........~...
	defb 0feh,004h,03eh,006h,028h,002h,03eh,004h,0ddh,077h,00dh,0c3h,077h,0a7h,0cdh,0e1h	; a8c4  ..>.(.>..w..w...
	defb 0b4h,078h,087h,0c6h,008h,03ch,0ddh,077h,00dh,0c9h,0cdh,0edh,0a8h,0c0h,0ddh,036h	; a8d4  .x...<.w.......6
	defb 016h,001h,0ddh,036h,001h,008h,0c3h,077h,0a7h,0ddh,035h,00eh,0c8h,0ddh,07eh,003h	; a8e4  ...6...w..5...~.
	defb 0ddh,046h,018h,0ddh,070h,003h,0ddh,077h,018h,0ddh,07eh,005h,0ddh,046h,019h,0ddh	; a8f4  .F..p..w..~..F..
	defb 070h,005h,0ddh,077h,019h,0c9h,0cdh,0edh,0a8h,0c0h,0ddh,036h,016h,001h,0ddh,036h	; a904  p..w.......6...6
	defb 001h,007h,0c3h,077h,0a7h,0ddh,035h,00eh,028h,00ch,0ddh,07eh,00eh,0e6h,003h,0c8h	; a914  ...w..5.(..~....
	defb 0feh,002h,0c0h,0c3h,006h,09bh,0ddh,07eh,01ah,0ddh,077h,001h,0cdh,0c8h,090h,0ddh	; a924  .......~..w.....
	defb 07eh,00fh,0a7h,0cah,044h,0a8h,0ddh,07eh,01bh,0ddh,077h,00dh,0c3h,03fh,0a8h,0cdh	; a934  ~...D..~..w..?..
	defb 038h,0a6h,03eh,001h,032h,03ch,0cbh,0ddh,036h,00eh,018h,011h,000h,001h,0ddh,07eh	; a944  8.>.2<..6......~
	defb 003h,0feh,040h,038h,00fh,0feh,090h,030h,00bh,0ddh,07eh,005h,0feh,028h,038h,01ch	; a954  ..@8...0..~..(8.
	defb 0feh,098h,030h,018h,0ddh,036h,00ch,002h,006h,006h,0ddh,07eh,005h,0feh,080h,038h	; a964  ..0..6.....~...8
	defb 005h,0d4h,042h,044h,006h,004h,0ddh,070h,00dh,0c3h,097h,080h,0ddh,036h,00ch,001h	; a974  ..BD...p.....6..
	defb 006h,002h,0ddh,07eh,003h,0feh,060h,038h,005h,0cdh,042h,044h,006h,000h,0ddh,070h	; a984  ...~..`8..BD...p
	defb 00dh,0c3h,0a7h,080h,0ddh,035h,00eh,0c2h,0deh,086h,0afh,0ddh,077h,00ch,0ddh,036h	; a994  .....5......w..6
	defb 00eh,020h,0ddh,036h,00dh,010h,0cdh,0b9h,0a9h,0cdh,01bh,06ch,021h,037h,06ch,0cdh	; a9a4  . .6.......l!7l.
	defb 085h,07ch,0c3h,038h,0a6h,0ddh,07eh,003h,047h,0d6h,040h,0feh,058h,0d0h,0ddh,07eh	; a9b4  .|.8..~.G.@.X..~
	defb 005h,0feh,030h,00eh,018h,038h,015h,0feh,048h,00eh,048h,038h,00fh,0feh,098h,00eh	; a9c4  ..0..8..H.H8....
	defb 0a8h,030h,009h,0feh,078h,0d8h,078h,0d6h,070h,0feh,010h,0d0h,0ddh,071h,005h,0c9h	; a9d4  .0..x.x.p....q..
	defb 0ddh,035h,00eh,0c0h,0cdh,0ach,06bh,0ddh,036h,011h,000h,006h,000h,03ah,003h,0cbh	; a9e4  .5....k.6....:..
	defb 0feh,040h,038h,006h,004h,0feh,080h,038h,001h,004h,0ddh,07eh,003h,00eh,000h,0feh	; a9f4  .@8....8...~....
	defb 040h,038h,006h,00ch,0feh,080h,038h,001h,00ch,078h,087h,080h,081h,021h,01dh,0aah	; aa04  @8....8..x...!..
	defb 0cdh,03eh,042h,05eh,016h,002h,0c3h,066h,0a6h,050h,090h,050h,090h,010h,010h,050h	; aa14  .>B^...f.P.P...P
	defb 010h,050h,00eh,020h,0cdh,075h,0a6h,0d0h,0ddh,036h,00eh,010h,0ddh,034h,00dh,0c3h	; aa24  .P. .u...6...4..
	defb 01bh,06ch,0ddh,035h,00eh,0c0h,0afh,032h,03ch,0cbh,0ddh,036h,001h,020h,0c9h	; aa34  .l.5...2<..6. .

; ======================================================================
; CODIGO 0xaa43..0xaa4d  (10 bytes)
; ======================================================================


L_AA43:
	ld de,0d8a0h		;aa43
	ld a,(de)			;aa46
	and a			;aa47
	ret z			;aa48
	dec a			;aa49
	call 0424dh		;aa4a

; ----------------------------------------------------------------------
; DATOS sin identificar  0xaa4d..0xaa59  (12 bytes)
DATA_AA4D:
	defb 090h,0aah,0fbh,0aah,095h,0abh,07bh,0aah,059h,0aah,064h,0aah	; aa4d  ......{.Y.d.

; ======================================================================
; CODIGO 0xaa59..0xaaef  (150 bytes)
; ======================================================================


L_AA59:
	ex de,hl			;aa59
	inc hl			;aa5a
	dec (hl)			;aa5b
	ret nz			;aa5c
	ld (hl),010h		;aa5d
	dec hl			;aa5f
	inc (hl)			;aa60
	jp 08b90h		;aa61
L_AA64:
	ex de,hl			;aa64
	inc hl			;aa65
	dec (hl)			;aa66
	ret nz			;aa67
	dec hl			;aa68
	ld (hl),000h		;aa69
	ld c,028h		;aa6b
	ld de,06070h		;aa6d
	call 07ac0h		;aa70
	ld a,001h		;aa73
	ld (0d4ebh),a		;aa75
	jp 06c3bh		;aa78
L_AA7B:
	ex de,hl			;aa7b
	inc (hl)			;aa7c
	inc hl			;aa7d
	ld (hl),010h		;aa7e
	ld ix,0d800h		;aa80
	ld (ix+000h),00bh		;aa84
	call 08c65h		;aa88
	ld (ix+000h),000h		;aa8b
	ret			;aa8f
L_AA90:
	ex de,hl			;aa90
	inc (hl)			;aa91
	inc hl			;aa92
	ld (hl),040h		;aa93
	inc hl			;aa95
	xor a			;aa96
	ld (hl),a			;aa97
	ld (0d8ach),a		;aa98
	ld hl,0d800h		;aa9b
	ld bc,0007fh		;aa9e
	call 04236h		;aaa1
	ld hl,0d7d6h		;aaa4
	set 5,(hl)		;aaa7
	ld hl,0aaefh		;aaa9
	ld ix,0d800h		;aaac
	ld bc,00400h		;aab0
L_AAB3:
	ld (ix+000h),00bh		;aab3
	ld a,(hl)			;aab7
	ld (ix+003h),a		;aab8
	inc hl			;aabb
	ld a,(hl)			;aabc
	ld (ix+005h),a		;aabd
	inc hl			;aac0
	ld a,(hl)			;aac1
	ld (ix+00dh),a		;aac2
	inc hl			;aac5
	ld (ix+01ah),c		;aac6
	ld de,(0ca50h)		;aac9
	ld (ix+00ah),e		;aacd
	ld (ix+00bh),d		;aad0
	ld (ix+010h),020h		;aad3
	ld de,00020h		;aad7
	add ix,de		;aada
	inc c			;aadc
	djnz L_AAB3		;aadd
	xor a			;aadf
	ld (0d800h),a		;aae0
	ld (0d820h),a		;aae3
	ld (0d840h),a		;aae6
	ld (0d860h),a		;aae9
	jp 05019h		;aaec

; ----------------------------------------------------------------------
; DATOS sin identificar  0xaaef..0xaafb  (12 bytes)
DATA_AAEF:
	defb 01ch,060h,009h,0b0h,060h,008h,070h,024h,00bh,070h,09ch,00ah	; aaef  .`..`.p$.p..

; ======================================================================
; CODIGO 0xaafb..0xab08  (13 bytes)
; ======================================================================


L_AAFB:
	ld hl,06bcch		;aafb
	call 086d5h		;aafe
	ld de,0d8ach		;ab01
	ld a,(de)			;ab04
	call 0424dh		;ab05

; ----------------------------------------------------------------------
; DATOS sin identificar  0xab08..0xab18  (16 bytes)
DATA_AB08:
	defb 018h,0abh,023h,0abh,032h,0abh,04ah,0abh,053h,0abh,068h,0abh,074h,0abh,080h,0abh	; ab08  ..#.2.J.S.h.t...

; ======================================================================
; CODIGO 0xab18..0xabe7  (207 bytes)
; ======================================================================


L_AB18:
	ex de,hl			;ab18
	ld a,001h		;ab19
	ld (0cb3ch),a		;ab1b
	inc (hl)			;ab1e
	inc hl			;ab1f
	ld (hl),020h		;ab20
	ret			;ab22
L_AB23:
	ex de,hl			;ab23
	inc hl			;ab24
	dec (hl)			;ab25
	ret nz			;ab26
	ld (hl),040h		;ab27
	dec hl			;ab29
	inc (hl)			;ab2a
	call 06b95h		;ab2b
	xor a			;ab2e
	jp 079e9h		;ab2f
L_AB32:
	push de			;ab32
	call 079f1h		;ab33
	pop hl			;ab36
	inc hl			;ab37
	dec (hl)			;ab38
	ret nz			;ab39
	ld (hl),020h		;ab3a
	dec hl			;ab3c
	inc (hl)			;ab3d
	ld a,001h		;ab3e
	ld (0e25ah),a		;ab40
	call 079fah		;ab43
	xor a			;ab46
	jp 06250h		;ab47
L_AB4A:
	ex de,hl			;ab4a
	inc hl			;ab4b
	dec (hl)			;ab4c
	ret nz			;ab4d
	dec hl			;ab4e
	inc (hl)			;ab4f
	jp 06bd0h		;ab50
L_AB53:
	xor a			;ab53
	ld (0e25ah),a		;ab54
	ex de,hl			;ab57
	inc (hl)			;ab58
	inc hl			;ab59
	ld (hl),008h		;ab5a
	ld a,00bh		;ab5c
	ld (0d820h),a		;ab5e
	ld (0d840h),a		;ab61
	ld (0d860h),a		;ab64
	ret			;ab67
L_AB68:
	ex de,hl			;ab68
	inc hl			;ab69
	dec (hl)			;ab6a
	ret nz			;ab6b
	dec hl			;ab6c
	inc (hl)			;ab6d
	ld de,00810h		;ab6e
	jp 061ceh		;ab71
L_AB74:
	call 06247h		;ab74
	ret nz			;ab77
	call 079c7h		;ab78
	ld hl,0d8ach		;ab7b
	inc (hl)			;ab7e
	ret			;ab7f
L_AB80:
	ld a,003h		;ab80
	ld (0d8a0h),a		;ab82
	xor a			;ab85
	ld (0cb3ch),a		;ab86
	ld a,00bh		;ab89
	ld (0d800h),a		;ab8b
	ld ix,0d800h		;ab8e
	jp 08685h		;ab92
L_AB95:
	push de			;ab95
	call L_ABD6		;ab96
	pop hl			;ab99
	ret z			;ab9a
	dec c			;ab9b
	jr nz,L_ABA2		;ab9c
	inc de			;ab9e
	ld a,(de)			;ab9f
	and a			;aba0
	ret nz			;aba1
L_ABA2:
	inc hl			;aba2
	dec (hl)			;aba3
	ret nz			;aba4
	ld (hl),004h		;aba5
	inc hl			;aba7
	inc (hl)			;aba8
	ld a,(hl)			;aba9
	and 01fh		;abaa
	jr z,$+85		;abac
	call 08079h		;abae
	ex de,hl			;abb1
	ld hl,0d800h		;abb2
	ld bc,00400h		;abb5
L_ABB8:
	push bc			;abb8
	push hl			;abb9
	ld a,(hl)			;abba
	and a			;abbb
	jr z,L_ABCC		;abbc
	inc hl			;abbe
	ld a,(hl)			;abbf
	and a			;abc0
	jr nz,L_ABCC		;abc1
	push hl			;abc3
	call L_ABE3		;abc4
	pop hl			;abc7
	jr nc,L_ABCC		;abc8
	ld (hl),001h		;abca
L_ABCC:
	pop hl			;abcc
	ld bc,00020h		;abcd
	add hl,bc			;abd0
	pop bc			;abd1
	inc c			;abd2
	djnz L_ABB8		;abd3
	ret			;abd5
L_ABD6:
	call 08751h		;abd6
	ld a,c			;abd9
	and a			;abda
	ret nz			;abdb
	ld a,004h		;abdc
	ld (0d8a0h),a		;abde
	xor a			;abe1
	ret			;abe2
L_ABE3:
	ld a,c			;abe3
	call 0424dh		;abe4

; ----------------------------------------------------------------------
; DATOS sin identificar  0xabe7..0xabef  (8 bytes)
DATA_ABE7:
	defb 0efh,0abh,0f4h,0abh,0f8h,0abh,0fdh,0abh	; abe7  ........

; ======================================================================
; CODIGO 0xabef..0xac48  (89 bytes)
; ======================================================================


L_ABEF:
	ld a,e			;abef
	cp 060h		;abf0
	ccf			;abf2
	ret			;abf3
L_ABF4:
	ld a,e			;abf4
	cp 080h		;abf5
	ret			;abf7
L_ABF8:
	ld a,d			;abf8
	cp 050h		;abf9
	ccf			;abfb
	ret			;abfc
L_ABFD:
	ld a,d			;abfd
	cp 070h		;abfe
	ret			;ac00
L_AC01:
	ld ix,0d800h		;ac01
	ld b,004h		;ac05
L_AC07:
	ld a,(ix+000h)		;ac07
	and a			;ac0a
	jr z,L_AC17		;ac0b
	ld a,(ix+001h)		;ac0d
	sub 003h		;ac10
	cp 002h		;ac12
	call c,08759h		;ac14
L_AC17:
	ld de,00020h		;ac17
	add ix,de		;ac1a
	djnz L_AC07		;ac1c
	ret			;ac1e
L_AC1F:
	ld a,(0ca76h)		;ac1f
	cp 029h		;ac22
	jp nz,086a4h		;ac24
	ld hl,06bcch		;ac27
	call 086d5h		;ac2a
	ld a,(ix+001h)		;ac2d
	ld hl,0ac48h		;ac30
	call 0424eh		;ac33
	call 08082h		;ac36
	ld a,(0ca4bh)		;ac39
	cp 002h		;ac3c
	ret c			;ac3e
	ld a,(ix+001h)		;ac3f
	cp 00fh		;ac42
	ret nc			;ac44
	jp 08671h		;ac45

; ----------------------------------------------------------------------
; DATOS sin identificar  0xac48..0xafa4  (860 bytes)
DATA_AC48:
	defb 06eh,0ach,095h,0ach,0c1h,0ach,0dfh,0ach,0fdh,0ach,00dh,0adh,019h,0adh,095h,0ach	; ac48  n...............
	defb 0c1h,0ach,02fh,0adh,052h,0adh,074h,0adh,084h,0adh,0d9h,0adh,0f4h,0aeh,032h,0afh	; ac58  ../.R.t.......2.
	defb 059h,0afh,086h,0afh,090h,0afh,03ah,04bh,0cah,0feh,002h,0d8h,03eh,001h,032h,03ch	; ac68  Y.....:K....>.2<
	defb 0cbh,03ch,0cdh,0cbh,0aeh,021h,0d1h,0d7h,0cbh,0c6h,0cdh,0c2h,086h,0c3h,080h,0adh	; ac78  .<...!..........
	defb 0cdh,0deh,086h,0c0h,0cdh,000h,081h,0cah,063h,06ch,0c3h,067h,06ch,0cdh,088h,0ach	; ac88  ........cl.gl...
	defb 02eh,007h,01eh,064h,006h,001h,0ddh,066h,00bh,0ddh,056h,005h,0cdh,0abh,0ach,0d0h	; ac98  ...d...f..V.....
	defb 0c3h,080h,0adh,0d9h,0cdh,05ch,0aeh,0d9h,07ch,0bdh,020h,00bh,07ah,093h,0feh,008h	; aca8  .....\..|. .z...
	defb 0d0h,078h,0cdh,0cbh,0aeh,037h,0c9h,0b7h,0c9h,0cdh,088h,0ach,0ddh,066h,00ah,02eh	; acb8  .x...7.......f..
	defb 002h,0ddh,056h,003h,01eh,038h,006h,001h,0cdh,0abh,0ach,0d0h,0ddh,036h,00ch,000h	; acc8  ..V..8.......6..
	defb 0ddh,036h,00eh,010h,0c3h,080h,0adh,0ddh,07eh,00eh,0a7h,028h,00ah,0ddh,035h,00eh	; acd8  .6......~..(..5.
	defb 0c0h,011h,050h,003h,0c3h,0ceh,061h,0cdh,047h,062h,0c0h,0cdh,0c7h,079h,0ddh,036h	; ace8  ..P...a.Gb...y.6
	defb 00ch,003h,0c3h,080h,0adh,0cdh,088h,0ach,0ddh,07eh,003h,0feh,070h,0d8h,03eh,003h	; acf8  .........~..p.>.
	defb 0cdh,0cbh,0aeh,018h,073h,0cdh,088h,0ach,02eh,008h,01eh,064h,006h,000h,0c3h,09eh	; ad08  ....s......d....
	defb 0ach,0cdh,088h,0ach,02eh,003h,01eh,064h,006h,002h,0ddh,066h,00ah,0ddh,056h,003h	; ad18  .......d...f..V.
	defb 0cdh,0abh,0ach,0d0h,0c3h,080h,0adh,0ddh,07eh,00eh,0a7h,028h,00ah,0ddh,035h,00eh	; ad28  ........~..(..5.
	defb 0c0h,011h,050h,004h,0c3h,0ceh,061h,0cdh,047h,062h,0c0h,0cdh,0c7h,079h,0cdh,087h	; ad38  ..P...a.Gb...y..
	defb 06ah,011h,050h,005h,0cdh,0ceh,061h,0c3h,080h,0adh,0cdh,047h,062h,0c0h,0cdh,0c7h	; ad48  j.P...a....Gb...
	defb 079h,0cdh,085h,086h,0afh,032h,0c8h,0cah,03ch,032h,0f0h,0dfh,032h,0e0h,0cah,032h	; ad58  y....2..<2..2..2
	defb 0e2h,0cah,03eh,010h,032h,0f2h,0dfh,0cdh,08dh,07ah,018h,00ch,0ddh,036h,016h,001h	; ad68  ..>.2....z...6..
	defb 03eh,003h,0cdh,0cbh,0aeh,0cdh,029h,059h,0ddh,034h,001h,0c9h,0cdh,0b2h,0adh,078h	; ad78  >.....)Y.4.....x
	defb 0a7h,020h,00dh,021h,0a3h,0d8h,036h,001h,0e5h,0cdh,0ach,0adh,0e1h,036h,000h,0c9h	; ad88  . .!..6......6..
	defb 078h,021h,0cfh,0adh,0cdh,0f6h,043h,0ddh,075h,019h,0ddh,074h,01ah,0ddh,036h,001h	; ad98  x!....C.u..t..6.
	defb 00dh,0c3h,09eh,0aeh,0cdh,088h,0ach,0c3h,025h,0b1h,006h,000h,03ah,051h,0cah,0ddh	; ada8  ........%...:Q..
	defb 0beh,00bh,020h,007h,0feh,008h,006h,003h,0c8h,004h,0c9h,03ah,050h,0cah,0ddh,0beh	; adb8  .. ........:P...
	defb 00ah,0c0h,0feh,002h,006h,001h,0c8h,004h,0c9h,000h,06eh,0c0h,06eh,06eh,000h,06eh	; adc8  ..........n.nn.n
	defb 0c0h,0cdh,05ch,0aeh,0d2h,080h,0adh,0cdh,088h,0ach,0ddh,07eh,01bh,0cdh,036h,0aeh	; add8  ..\........~..6.
	defb 038h,027h,0ddh,07eh,01bh,0feh,002h,038h,015h,0ddh,07eh,00ah,0feh,007h,006h,03ch	; ade8  8'.~...8..~....<
	defb 028h,002h,006h,06ch,0ddh,07eh,005h,090h,0feh,008h,0d0h,0c3h,09eh,0aeh,0ddh,07eh	; adf8  (..l.~.........~
	defb 003h,0d6h,06eh,0feh,008h,0d0h,0c3h,09eh,0aeh,0ddh,07eh,01bh,0feh,002h,038h,00fh	; ae08  ..n.......~...8.
	defb 0ddh,07eh,003h,0ddh,096h,019h,03eh,000h,0d2h,0cbh,0aeh,03ch,0c3h,0cbh,0aeh,0ddh	; ae18  .~....>....<....
	defb 07eh,005h,0ddh,096h,01ah,03eh,002h,0d2h,0cbh,0aeh,03ch,0c3h,0cbh,0aeh,011h,054h	; ae28  ~....>....<....T
	defb 0aeh,021h,0a3h,0d8h,036h,001h,0e5h,0ebh,0cdh,0f6h,043h,0ddh,07eh,003h,085h,06fh	; ae38  .!..6.....C.~..o
	defb 0ddh,07eh,005h,084h,067h,0cdh,03dh,07fh,0e1h,036h,000h,0c9h,0f0h,000h,008h,000h	; ae48  .~..g.=..6......
	defb 000h,0f5h,000h,00ch,011h,0c1h,020h,021h,0b9h,008h,0cdh,06bh,0aeh,0d8h,0cdh,029h	; ae58  ...... !...k...)
	defb 059h,0b7h,0c9h,0ddh,07eh,003h,0bah,038h,013h,0bbh,030h,019h,0ddh,07eh,005h,0bch	; ae68  Y...~..8..0..~..
	defb 038h,01bh,0bdh,0d8h,0ddh,034h,00bh,0ddh,074h,005h,018h,018h,0ddh,034h,00ah,01dh	; ae78  8....4..t....4..
	defb 0ddh,073h,003h,018h,00fh,0ddh,035h,00ah,0ddh,072h,003h,018h,007h,0ddh,035h,00bh	; ae88  .s....5..r....5.
	defb 02dh,0ddh,075h,005h,0b7h,0c9h,011h,000h,000h,0ddh,07eh,003h,0ddh,096h,019h,030h	; ae98  -.u.......~....0
	defb 003h,014h,0edh,044h,047h,0ddh,07eh,005h,0ddh,096h,01ah,030h,003h,01ch,0edh,044h	; aea8  ...DG.~....0...D
	defb 0b8h,030h,009h,07ah,0a7h,03eh,000h,028h,00ah,03ch,018h,007h,07bh,0a7h,03eh,002h	; aeb8  .0.z.>.(.<..{.>.
	defb 028h,001h,03ch,0ddh,077h,01bh,047h,087h,0ddh,077h,00dh,078h,021h,0ech,0aeh,0cdh	; aec8  (.<.w.G..w.x!...
	defb 0f6h,043h,0afh,0ddh,075h,007h,0ddh,077h,006h,0ddh,074h,009h,0ddh,077h,008h,0ddh	; aed8  .C..u..w..t..w..
	defb 036h,00ch,003h,0c9h,0fah,000h,006h,000h,000h,0fah,000h,006h,0cdh,088h,0ach,0cdh	; aee8  6...............
	defb 0b2h,0adh,078h,0a7h,0c2h,098h,0adh,0ddh,056h,003h,0ddh,05eh,005h,0ddh,07eh,01bh	; aef8  ..x.....V..^..~.
	defb 021h,018h,0afh,0cdh,04eh,042h,0d0h,0afh,032h,03ch,0cbh,0ddh,036h,001h,00ch,0c9h	; af08  !...NB..2<..6...
	defb 020h,0afh,024h,0afh,029h,0afh,02dh,0afh,07ah,0feh,070h,0c9h,07ah,0feh,070h,03fh	; af18   .$.).-.z.p.z.p?
	defb 0c9h,07bh,0feh,070h,0c9h,07bh,0feh,070h,03fh,0c9h,0ddh,036h,00dh,008h,0afh,0ddh	; af28  .{.p.{.p?..6....
	defb 077h,00ch,032h,0f0h,0dfh,03ch,032h,058h,0e2h,032h,0f2h,0d4h,03ch,032h,0e0h,0cah	; af38  w.2..<2X.2..<2..
	defb 0cdh,00ah,07ah,0cdh,01bh,06ch,0ddh,036h,003h,080h,0ddh,036h,005h,060h,0c3h,080h	; af48  ..z..l.6...6.`..
	defb 0adh,0cdh,000h,081h,0c0h,03ah,005h,0cbh,0ddh,096h,005h,030h,002h,0edh,044h,0feh	; af58  .....:.....0..D.
	defb 020h,0d0h,03ah,003h,0cbh,0c6h,028h,0ddh,096h,003h,0feh,050h,0d0h,03eh,001h,032h	; af68   .:...(....P.>.2
	defb 03ch,0cbh,021h,0ach,06bh,0cdh,085h,07ch,011h,010h,006h,0c3h,04ch,0adh,0cdh,047h	; af78  <.!.k..|....L..G
	defb 062h,0c0h,0cdh,0c7h,079h,0c3h,080h,0adh,0ddh,036h,001h,020h,0afh,032h,0f2h,0d4h	; af88  b...y....6. .2..
	defb 03ah,04bh,0cah,0feh,002h,0c0h,03eh,002h,032h,000h,0d5h,0c9h	; af98  :K....>.2...

; ======================================================================
; CODIGO 0xafa4..0xb032  (142 bytes)
; ======================================================================


L_AFA4:
	ld a,(0ca77h)		;afa4
	and a			;afa7
	jp nz,086a4h		;afa8
	ld hl,0d8a7h		;afab
	ld a,(hl)			;afae
	and a			;afaf
	jp z,L_AFCB		;afb0
	cp 002h		;afb3
	jr nz,L_AFBD		;afb5
	dec (hl)			;afb7
	call L_B161		;afb8
	jr L_AFC5		;afbb
L_AFBD:
	ld a,(0ca41h)		;afbd
	and a			;afc0
	jr z,L_AFC5		;afc1
	ld (hl),002h		;afc3
L_AFC5:
	ld a,(ix+018h)		;afc5
	and a			;afc8
	jr nz,L_AFE6		;afc9
L_AFCB:
	ld a,(ix+01fh)		;afcb
	and a			;afce
	jr z,L_AFDA		;afcf
	dec (ix+01fh)		;afd1
	jr nz,L_AFDA		;afd4
	ld (ix+016h),001h		;afd6
L_AFDA:
	ld a,(ix+001h)		;afda
	ld hl,0b032h		;afdd
	call 0424eh		;afe0
	call 08082h		;afe3
L_AFE6:
	ld a,(ix+001h)		;afe6
	sub 003h		;afe9
	cp 004h		;afeb
	call c,08671h		;afed
	ld a,(ix+001h)		;aff0
	cp 009h		;aff3
	jp nc,08728h		;aff5
	ld a,(ix+018h)		;aff8
	and a			;affb
	jp z,08728h		;affc
	call L_B020		;afff
	dec (ix+018h)		;b002
	call z,L_B00B		;b005
	jp 08739h		;b008
L_B00B:
	ld (ix+01fh),008h		;b00b
	ld (ix+016h),000h		;b00f
	ld a,(ix+015h)		;b013
	ld (ix+00ch),a		;b016
	ld a,(ix+01dh)		;b019
	ld (ix+00dh),a		;b01c
	ret			;b01f
L_B020:
	ld b,(ix+01dh)		;b020
	ld a,(ix+018h)		;b023
	sub 002h		;b026
	cp 003h		;b028
	jr nc,L_B02D		;b02a
	inc b			;b02c
L_B02D:
	ld a,b			;b02d
	ld (ix+00dh),a		;b02e
	ret			;b031

; ----------------------------------------------------------------------
; DATOS sin identificar  0xb032..0xb161  (303 bytes)
DATA_B032:
	defb 040h,0b0h,05bh,0b0h,080h,0b0h,08dh,0b0h,002h,0b1h,09fh,0b1h,07dh,0b2h,0ddh,036h	; b032  @.[.........}..6
	defb 00eh,030h,03eh,001h,032h,03ch,0cbh,021h,0d7h,0d7h,0cbh,0ceh,021h,000h,000h,022h	; b042  .0>.2<.!....!.."
	defb 019h,0cah,0afh,0cdh,0e9h,079h,0c3h,0b5h,0b0h,0ddh,035h,00eh,0ddh,07eh,00eh,0feh	; b052  .....y....5..~..
	defb 020h,0d0h,0cdh,0f1h,079h,0ddh,07eh,00eh,0a7h,0c0h,0cdh,0fah,079h,0cdh,095h,06bh	; b062   ...y.~.....y..k
	defb 03eh,001h,032h,0a7h,0d8h,032h,05ah,0e2h,0cdh,050h,062h,0c3h,0b5h,0b0h,0afh,032h	; b072  >.2..2Z..Pb....2
	defb 05ah,0e2h,032h,03ch,0cbh,0cdh,085h,086h,0c3h,0b5h,0b0h,0cdh,0cbh,0b0h,0ddh,07eh	; b082  Z.2<...........~
	defb 01fh,0a7h,020h,004h,0ddh,036h,016h,001h,0ddh,036h,01ch,010h,0cdh,061h,0b1h,0ddh	; b092  .. ..6...6...a..
	defb 07eh,01bh,0a7h,020h,012h,0cdh,056h,042h,0e6h,007h,0ddh,077h,00dh,0cdh,077h,0a7h	; b0a2  ~.. ..VB...w..w.
	defb 0cdh,09dh,0b2h,0ddh,034h,001h,0c9h,0cdh,055h,059h,0ddh,07eh,01bh,03dh,087h,0ddh	; b0b2  ....4...UY.~.=..
	defb 077h,00dh,0ddh,036h,001h,005h,0c3h,077h,0a7h,0cdh,056h,042h,0e6h,03fh,0c6h,030h	; b0c2  w..6...w..VB.?.0
	defb 0ddh,077h,01eh,0c9h,0ddh,035h,01eh,028h,0f0h,0ddh,07eh,01eh,0feh,018h,0d8h,03ah	; b0d2  .w...5.(..~....:
	defb 003h,0cah,0e6h,003h,0c0h,0ddh,07eh,00ah,03dh,087h,047h,0ddh,07eh,00bh,0d6h,007h	; b0e2  ......~.=.G.~...
	defb 080h,021h,0fah,0b0h,0cdh,0f6h,043h,0e9h,006h,06bh,00eh,06bh,093h,06ch,00ah,06bh	; b0f2  .!....C..k.k.l.k
	defb 0cdh,0d6h,0b0h,0ddh,07eh,01bh,0a7h,020h,0b1h,0cdh,025h,0b1h,0ddh,035h,01ch,0c0h	; b102  ....~.. ..%..5..
	defb 0cdh,000h,081h,0c2h,095h,0b2h,0ddh,036h,00ch,000h,0ddh,036h,01ch,018h,0ddh,036h	; b112  .......6...6...6
	defb 001h,006h,0c9h,0cdh,003h,0a8h,0ddh,07eh,000h,0feh,005h,020h,008h,0ddh,07eh,00dh	; b122  .......~... ..~.
	defb 0e6h,0feh,0ddh,077h,00dh,0ddh,07eh,003h,0d6h,018h,0feh,0a0h,030h,019h,0ddh,07eh	; b132  ...w..~.....0..~
	defb 005h,0d6h,008h,0feh,0b0h,030h,010h,0cdh,0c8h,090h,079h,0a7h,0c2h,044h,0a8h,0ddh	; b142  .....0....y..D..
	defb 07eh,00eh,0a7h,0c0h,0c3h,03fh,0a8h,0cdh,08bh,080h,0ddh,036h,00eh,010h,0c9h	; b152  ~....?.....6...

; ======================================================================
; CODIGO 0xb161..0xb19f  (62 bytes)
; ======================================================================


L_B161:
	ld h,000h		;b161
	ld c,(ix+00ah)		;b163
	ld b,(ix+00bh)		;b166
	ld de,(0ca50h)		;b169
	ld a,e			;b16d
	cp c			;b16e
	jr z,L_B177		;b16f
	call nc,L_B196		;b171
	call c,L_B199		;b174
L_B177:
	ld a,d			;b177
	cp b			;b178
	jr z,L_B181		;b179
	call c,L_B19C		;b17b
	call nc,L_B193		;b17e
L_B181:
	ld a,h			;b181
	and a			;b182
	ld bc,00300h		;b183
	jr z,L_B18F		;b186
	inc c			;b188
L_B189:
	rra			;b189
	jr c,L_B18F		;b18a
	inc c			;b18c
	djnz L_B189		;b18d
L_B18F:
	ld (ix+01bh),c		;b18f
	ret			;b192
L_B193:
	set 3,h		;b193
	ret			;b195
L_B196:
	set 0,h		;b196
	ret			;b198
L_B199:
	set 1,h		;b199
	ret			;b19b
L_B19C:
	set 2,h		;b19c
	ret			;b19e

; ----------------------------------------------------------------------
; DATOS sin identificar  0xb19f..0xb2b2  (275 bytes)
DATA_B19F:
	defb 0cdh,0d6h,0b0h,0ddh,07eh,01bh,0a7h,0cah,095h,0b2h,0ddh,07eh,003h,0d6h,018h,0feh	; b19f  ....~......~....
	defb 0a7h,0d2h,047h,0b2h,0ddh,07eh,005h,0d6h,008h,0feh,0b0h,0d2h,05eh,0b2h,0ddh,07eh	; b1af  ..G..~......^..~
	defb 007h,0a7h,0ddh,07eh,01bh,028h,027h,0feh,003h,038h,049h,0ddh,07eh,00ah,03dh,00eh	; b1bf  ...~.('..8I.~.=.
	defb 048h,028h,002h,00eh,068h,0ddh,07eh,003h,091h,0feh,010h,030h,037h,0ddh,07eh,00bh	; b1cf  H(..h.~....07.~.
	defb 0feh,007h,03eh,006h,028h,002h,03eh,004h,0ddh,077h,00dh,0c3h,077h,0a7h,0feh,003h	; b1df  ..>.(.>..w..w...
	defb 030h,022h,0ddh,07eh,00bh,0feh,007h,001h,008h,08ch,028h,002h,006h,02ch,0ddh,07eh	; b1ef  0".~......(..,.~
	defb 005h,090h,0b9h,030h,00fh,0ddh,07eh,00ah,03dh,03eh,002h,020h,001h,0afh,0ddh,077h	; b1ff  ...0..~.=>. ...w
	defb 00dh,0c3h,077h,0a7h,021h,0a3h,0d8h,036h,001h,0e5h,0cdh,0c8h,090h,0e1h,036h,000h	; b20f  ..w.!..6......6.
	defb 079h,0a7h,0c8h,0ddh,07eh,007h,0a7h,03eh,003h,0ddh,056h,005h,01eh,003h,020h,007h	; b21f  y...~..>..V... .
	defb 03eh,00ch,0ddh,056h,003h,01eh,001h,0a1h,0c8h,07ah,0feh,060h,030h,001h,01ch,07bh	; b22f  >..V.....z.`0..{
	defb 03dh,087h,0ddh,077h,00dh,0c3h,077h,0a7h,0ddh,07eh,007h,017h,038h,007h,0ddh,035h	; b23f  =..w..w..~..8..5
	defb 00ah,03eh,021h,018h,005h,0ddh,034h,00ah,03eh,0bfh,0ddh,077h,003h,018h,015h,0ddh	; b24f  .>!...4.>..w....
	defb 07eh,009h,017h,038h,007h,0ddh,034h,00bh,03eh,00ah,018h,005h,0ddh,035h,00bh,03eh	; b25f  ~..8..4.>....5.>
	defb 0b6h,0ddh,077h,005h,0ddh,036h,00eh,020h,0cdh,055h,059h,0c3h,061h,0b1h,0ddh,07eh	; b26f  ..w..6. .UY.a..~
	defb 018h,0a7h,0c0h,0cdh,000h,081h,020h,00eh,0ddh,07eh,01ch,0ddh,035h,01ch,028h,006h	; b27f  ...... ..~..5.(.
	defb 0e6h,003h,0c0h,0c3h,040h,09bh,0ddh,036h,001h,003h,0ddh,036h,00ch,003h,0cdh,056h	; b28f  ....@..6...6...V
	defb 042h,0e6h,01fh,0c6h,010h,0ddh,077h,01ch,0c9h,0cdh,079h,080h,0ddh,075h,018h,0ddh	; b29f  B.....w...y..u..
	defb 074h,019h,0c9h	; b2af

; ======================================================================
; CODIGO 0xb2b2..0xb2e8  (54 bytes)
; ======================================================================


L_B2B2:
	call L_B2D8		;b2b2
	jp nc,086a4h		;b2b5
	ld hl,06bcch		;b2b8
	call 086d5h		;b2bb
	ld a,(ix+001h)		;b2be
	ld hl,0b2e8h		;b2c1
	call 0424eh		;b2c4
	call 08082h		;b2c7
	jp 08671h		;b2ca
L_B2CD:
	call 08728h		;b2cd
	ld a,(ix+014h)		;b2d0
	and a			;b2d3
	jp z,0873ch		;b2d4
	ret			;b2d7
L_B2D8:
	ld a,(0ca50h)		;b2d8
	sub 004h		;b2db
	cp 002h		;b2dd
	ret nc			;b2df
	ld a,(0ca51h)		;b2e0
	sub 004h		;b2e3
	cp 002h		;b2e5
	ret			;b2e7

; ----------------------------------------------------------------------
; DATOS sin identificar  0xb2e8..0xb56a  (642 bytes)
DATA_B2E8:
	defb 0f8h,0b2h,014h,0b3h,04eh,0b3h,05fh,0b3h,089h,0b3h,004h,0b5h,035h,0b5h,046h,0b5h	; b2e8  ....N._.....5.F.
	defb 03eh,001h,032h,03ch,0cbh,0ddh,036h,00dh,008h,021h,0d6h,0d7h,0cbh,0ceh,0ddh,077h	; b2f8  >.2<..6..!.....w
	defb 00ch,0ddh,036h,007h,002h,0cdh,0c2h,086h,0ddh,034h,001h,0c9h,0cdh,0e3h,0b3h,0cdh	; b308  ..6......4......
	defb 041h,0b3h,03ah,050h,0cah,0ddh,0beh,00ah,0c0h,0ddh,07eh,003h,0feh,018h,0d4h,03ch	; b318  A.:P......~....<
	defb 0b3h,0feh,030h,0d8h,0ddh,036h,00ch,000h,0ddh,036h,00dh,001h,011h,050h,00ch,0cdh	; b328  ..0..6...6...P..
	defb 0ceh,061h,018h,0d4h,0ddh,036h,014h,000h,0c9h,011h,0c1h,010h,021h,0b5h,00ch,0cdh	; b338  .a...6......!...
	defb 06bh,0aeh,0d8h,0c3h,055h,059h,0cdh,047h,062h,03ah,020h,0e2h,0a7h,0c0h,0afh,032h	; b348  k...UY.Gb: ....2
	defb 03ch,0cbh,0cdh,0c7h,079h,018h,0b1h,03eh,001h,0ddh,077h,016h,0cdh,07dh,0a7h,0ddh	; b358  <...y..>..w..}..
	defb 036h,00ch,001h,0cdh,010h,0b3h,0cdh,055h,059h,0cdh,085h,086h,0ddh,07eh,000h,0feh	; b368  6......UY....~..
	defb 00ah,006h,010h,020h,002h,006h,004h,0cdh,056h,042h,0e6h,00fh,080h,0ddh,077h,00eh	; b378  ... ....VB....w.
	defb 0c9h,0cdh,06ch,0b4h,0dah,03bh,0b4h,0cdh,0e3h,0b3h,0cdh,09ch,0b4h,0ddh,07eh,00dh	; b388  ..l...........~.
	defb 0feh,002h,03eh,003h,038h,002h,03eh,00ch,0a1h,020h,064h,0ddh,035h,00eh,028h,05fh	; b398  ..>.8.>.. d.5.(_
	defb 0cdh,02dh,0b4h,0cdh,041h,0b3h,0ddh,035h,01ch,028h,042h,0ddh,07eh,01ch,0feh,010h	; b3a8  .-..A..5.(B.~...
	defb 0c0h,0ddh,07eh,014h,0a7h,0c8h,0cdh,063h,0b5h,03eh,001h,0ddh,077h,01eh,0ddh,07eh	; b3b8  ..~....c.>..w..~
	defb 00dh,0ddh,077h,01dh,0ddh,036h,00dh,008h,0ddh,036h,00ch,000h,0ddh,036h,00eh,004h	; b3c8  ..w..6...6...6..
	defb 0ddh,036h,001h,007h,0c9h,0afh,0ddh,077h,014h,018h,0e0h,0cdh,000h,081h,0c0h,0ddh	; b3d8  .6.....w........
	defb 07eh,014h,0a7h,0c0h,03ah,003h,0cah,0e6h,003h,0c0h,0c3h,073h,06ah,0cdh,056h,042h	; b3e8  ~...:......sj.VB
	defb 0e6h,01fh,0c6h,010h,0ddh,077h,01ch,0ddh,07eh,014h,0a7h,028h,0b9h,018h,0d6h,0cdh	; b3f8  .....w..~..(....
	defb 074h,0b3h,03ah,031h,0cbh,0a7h,028h,00eh,0cdh,056h,042h,0e6h,003h,047h,0cdh,0ach	; b408  t.:1..(..VB..G..
	defb 0b4h,0cdh,026h,0b4h,018h,0a0h,0cdh,0a9h,0b4h,0cdh,026h,0b4h,018h,0d9h,0ddh,071h	; b418  ..&.......&....q
	defb 00dh,079h,0c3h,07dh,0a7h,03ah,003h,0cah,0e6h,004h,03eh,0ffh,028h,001h,0afh,0ddh	; b428  .y.}.:....>.(...
	defb 077h,013h,0c9h,0afh,0ddh,077h,00ch,0ddh,036h,00eh,020h,0cdh,010h,0b3h,0cdh,050h	; b438  w....w..6. ....P
	defb 0b4h,0ddh,07eh,014h,0a7h,0c8h,018h,08dh,0cdh,0f8h,0b4h,0c6h,010h,007h,007h,007h	; b448  ..~.............
	defb 0e6h,007h,021h,064h,0b4h,0cdh,048h,042h,0ddh,077h,00dh,0c9h,003h,007h,001h,006h	; b458  ..!d..HB.w......
	defb 002h,004h,000h,005h,0ddh,07eh,01bh,0a7h,028h,005h,0ddh,035h,01bh,018h,023h,0cdh	; b468  .....~..(..5..#.
	defb 000h,081h,020h,01eh,03ah,031h,0cbh,0a7h,0c0h,0cdh,079h,080h,07dh,0ddh,096h,003h	; b478  .. .:1....y.}...
	defb 030h,002h,0edh,044h,0feh,060h,0d0h,07ch,0ddh,096h,005h,030h,002h,0edh,044h,0feh	; b488  0..D.`.|...0..D.
	defb 060h,0c9h,0b7h,0c9h,021h,0a3h,0d8h,036h,001h,0e5h,0cdh,0c8h,090h,0e1h,036h,000h	; b498  `...!..6......6.
	defb 0c9h,0cdh,0cah,0b4h,0c5h,0cdh,09ch,0b4h,079h,0c1h,048h,004h,01fh,010h,0fdh,0d0h	; b4a8  ........y.H.....
	defb 079h,0c6h,002h,0e6h,003h,047h,0edh,05fh,01fh,038h,0e9h,0cbh,018h,03fh,0cbh,010h	; b4b8  y....G._.8...?..
	defb 018h,0e2h,03ah,050h,0cah,0ddh,0beh,00ah,028h,005h,006h,001h,0d8h,005h,0c9h,0cdh	; b4c8  ..:P....(.......
	defb 007h,081h,028h,005h,006h,002h,0d8h,004h,0c9h,0cdh,0f8h,0b4h,006h,003h,0feh,020h	; b4d8  ..(............
	defb 0d8h,0feh,0e0h,0d0h,006h,001h,0feh,060h,0d8h,004h,0feh,0a0h,0d8h,006h,000h,0c9h	; b4e8  .......`........
	defb 0ddh,056h,005h,0ddh,05eh,003h,0cdh,079h,080h,0c3h,0d1h,079h,0cdh,000h,081h,020h	; b4f8  .V..^..y...y...
	defb 036h,0ddh,035h,00eh,028h,021h,0cdh,06ch,0b4h,030h,015h,0ddh,07eh,017h,0a7h,020h	; b508  6.5.(!.l.0..~..
	defb 016h,0cdh,050h,0b4h,0cdh,0a8h,0b2h,03ah,003h,0cah,0e6h,003h,0c0h,0c3h,019h,09bh	; b518  ..P....:........
	defb 0ddh,036h,00eh,020h,0c3h,010h,0b3h,0ddh,036h,01bh,010h,018h,00ah,0cdh,000h,081h	; b528  .6. ....6.......
	defb 020h,005h,0ddh,035h,00eh,020h,0e0h,0ddh,036h,001h,004h,0c3h,01eh,0b4h,0ddh,035h	; b538   ..5. ..6......5
	defb 00eh,0c0h,0ddh,036h,00ch,003h,0ddh,07eh,01dh,0ddh,077h,00dh,0ddh,036h,001h,004h	; b548  ...6...~..w..6..
	defb 0ddh,07eh,01eh,0a7h,028h,005h,0ddh,036h,014h,001h,0c9h,0cdh,000h,081h,0c0h,0c3h	; b558  .~..(..6........
	defb 0d2h,06ch	; b568

; ======================================================================
; CODIGO 0xb56a..0xb58f  (37 bytes)
; ======================================================================


L_B56A:
	ld a,(ix+001h)		;b56a
	cp 005h		;b56d
	ret c			;b56f
	jp 08739h		;b570
L_B573:
	ld a,(0d8a9h)		;b573
	and a			;b576
	ret z			;b577
	ld hl,06bcch		;b578
	call 086d5h		;b57b
	ld a,(0ca76h)		;b57e
	and a			;b581
	ret nz			;b582
	ld a,(ix+001h)		;b583
	ld hl,0b58fh		;b586
	call 0424eh		;b589
	jp 08082h		;b58c

; ----------------------------------------------------------------------
; DATOS sin identificar  0xb58f..0xb923  (916 bytes)
DATA_B58F:
	defb 0b5h,0b5h,0c8h,0b5h,0e3h,0b5h,0d4h,0b5h,008h,0b6h,034h,0b6h,049h,0b6h,09bh,0b6h	; b58f  ..........4.I...
	defb 0d8h,0b6h,061h,0b7h,097h,0b7h,0c6h,0b7h,0e1h,0b7h,011h,0b8h,01dh,0b8h,082h,0b8h	; b59f  ..a.............
	defb 0eah,0b8h,00ah,0b9h,01ah,0b9h,03ah,0b0h,0d6h,0a7h,0c8h,0cdh,0a6h,06ch,0ddh,036h	; b5af  ......:......l.6
	defb 00eh,008h,03eh,001h,032h,03ch,0cbh,018h,017h,0ddh,07eh,00eh,0a7h,028h,006h,0ddh	; b5bf  ..>.2<....~..(..
	defb 035h,00eh,0c0h,018h,01ch,0cdh,0f6h,0b5h,0c0h,032h,03ch,0cbh,03ch,032h,009h,0d5h	; b5cf  5........2<.<2..
	defb 0ddh,034h,001h,0c9h,03ah,04bh,0cah,03dh,0c0h,03eh,001h,032h,03ch,0cbh,0cdh,0dfh	; b5df  .4..:K.=.>.2<...
	defb 0b5h,011h,010h,011h,0c3h,0ceh,061h,0cdh,047h,062h,0c0h,0cdh,0c7h,079h,0afh,0c9h	; b5ef  ......a.Gb...y..
	defb 0cdh,047h,062h,0c0h,0cdh,0c4h,079h,0afh,0c9h,03ah,04bh,0cah,0feh,006h,0c0h,0ddh	; b5ff  .Gb...y..:K.....
	defb 036h,00dh,004h,03eh,001h,032h,03ch,0cbh,0ddh,077h,016h,021h,0dah,0d7h,0cbh,0feh	; b60f  6..>.2<..w.!....
	defb 0ddh,036h,00eh,020h,0ddh,036h,00ch,002h,0ddh,036h,009h,0ffh,0ddh,036h,008h,000h	; b61f  .6. .6...6...6..
	defb 0cdh,0d0h,06bh,018h,0abh,0cdh,0deh,086h,0ddh,035h,00eh,0c0h,0ddh,036h,00ch,000h	; b62f  ..k......5...6..
	defb 0ddh,036h,00dh,002h,0ddh,036h,00eh,020h,018h,096h,0ddh,07eh,00eh,0a7h,028h,00ah	; b63f  .6...6. ...~..(.
	defb 0ddh,035h,00eh,0c0h,011h,06ch,012h,0c3h,0d3h,061h,0cdh,0ffh,0b5h,0c0h,0cdh,09bh	; b64f  .5...l...a......
	defb 07ah,03eh,00ah,0cdh,09bh,07ah,021h,000h,000h,011h,000h,000h,001h,0c0h,0c0h,0cdh	; b65f  z>...z!.........
	defb 04dh,047h,03ah,042h,0cah,0cdh,052h,044h,0cdh,050h,046h,0cdh,0b8h,07ah,011h,020h	; b66f  MG:B..RD.PF..z.
	defb 020h,0afh,047h,0cdh,0a0h,07ah,011h,020h,080h,03eh,00ah,006h,001h,0cdh,0a0h,07ah	; b67f   .G..z. .>.....z
	defb 0cdh,0f6h,045h,011h,070h,007h,0cdh,0d3h,061h,0c3h,0dfh,0b5h,0cdh,0a8h,07ah,0cdh	; b68f  ..E.p...a.....z.
	defb 0ffh,0b5h,0c0h,0cdh,0f1h,045h,0afh,032h,03ch,0cbh,0ddh,077h,00fh,0cdh,0b0h,07ah	; b69f  .....E.2<..w...z
	defb 03eh,001h,0cdh,0b0h,07ah,0cdh,01fh,07ah,021h,000h,000h,011h,000h,000h,001h,0c0h	; b6af  >...z..z!.......
	defb 0c0h,0cdh,05ah,047h,0cdh,050h,046h,0cdh,006h,046h,0cdh,055h,059h,0cdh,074h,0b3h	; b6bf  ..ZG.PF..F.UY.t.
	defb 0cdh,077h,0a7h,0cdh,085h,086h,0c3h,0dfh,0b5h,0cdh,03dh,0b7h,0d2h,036h,0b7h,0cdh	; b6cf  .w........=..6..
	defb 0deh,086h,0cdh,09ch,0b4h,0ddh,07eh,00dh,00fh,0e6h,003h,03ch,047h,0cbh,019h,010h	; b6df  ......~....<G...
	defb 0fch,038h,00eh,0ddh,035h,00eh,028h,009h,011h,0c1h,020h,021h,0b9h,008h,0c3h,047h	; b6ef  .8..5.(... !...G
	defb 0b3h,0cdh,028h,0b7h,0cdh,000h,081h,0c0h,0ddh,034h,00fh,0ddh,07eh,00fh,0e6h,003h	; b6ff  ..(......4..~...
	defb 0c0h,0afh,0ddh,077h,00ch,0ddh,077h,018h,0ddh,036h,00eh,020h,0ddh,036h,001h,00ah	; b70f  ...w..w..6. .6..
	defb 0ddh,07eh,00dh,0e6h,0feh,0ddh,077h,01bh,0c9h,0cdh,0a9h,0b4h,079h,087h,0ddh,077h	; b71f  .~....w.....y..w
	defb 00dh,0cdh,074h,0b3h,0c3h,077h,0a7h,0ddh,036h,00ch,000h,0c3h,0dfh,0b5h,0cdh,000h	; b72f  ..t..w..6.......
	defb 081h,020h,00dh,0ddh,07eh,00dh,021h,051h,0b7h,0cdh,03eh,042h,046h,0c3h,0a4h,084h	; b73f  . ..~.!Q..>BF...
	defb 037h,0c9h,006h,006h,002h,002h,004h,004h,000h,000h,005h,007h,003h,001h,005h,003h	; b74f  7...............
	defb 001h,007h,0ddh,07eh,017h,0a7h,028h,01ah,0ddh,07eh,00dh,0e6h,007h,006h,004h,0b8h	; b75f  ...~..(..~......
	defb 038h,002h,006h,000h,0cdh,056h,042h,0e6h,002h,080h,0ddh,077h,00dh,0cdh,030h,0b7h	; b76f  8....VB....w..0.
	defb 018h,00eh,0cdh,03dh,0b7h,038h,009h,03ah,003h,0cah,0e6h,003h,0c0h,0c3h,00dh,09bh	; b77f  ...=.8.:........
	defb 0ddh,036h,00ch,003h,0ddh,035h,001h,0c9h,0ddh,07eh,017h,0a7h,020h,0cah,0cdh,03dh	; b78f  .6...5...~.. ..=
	defb 0b7h,030h,094h,0ddh,035h,00eh,028h,033h,0ddh,07eh,00eh,0e6h,007h,0c0h,0ddh,07eh	; b79f  .0..5.(3.~.....~
	defb 018h,0ddh,034h,018h,01fh,006h,000h,030h,006h,01fh,006h,008h,030h,001h,004h,0ddh	; b7af  ..4....0....0...
	defb 07eh,01bh,080h,0ddh,077h,00dh,0c9h,0ddh,07eh,017h,0a7h,020h,09bh,0cdh,03dh,0b7h	; b7bf  ~...w...~.. ..=.
	defb 038h,009h,03ah,003h,0cah,0e6h,003h,0c0h,0c3h,00dh,09bh,0ddh,036h,001h,008h,0c3h	; b7cf  8.:.........6...
	defb 028h,0b7h,0afh,0ddh,077h,00ch,0ddh,077h,016h,032h,001h,0cbh,032h,000h,0cbh,032h	; b7df  (...w..w.2..2..2
	defb 016h,0cbh,032h,044h,0cbh,03ch,032h,03ch,0cbh,032h,014h,0cbh,0ddh,036h,00eh,00ch	; b7ef  ..2D.<2<.2...6..
	defb 0ddh,036h,00dh,080h,021h,010h,0dch,001h,010h,000h,03eh,0e0h,0cdh,037h,042h,0c3h	; b7ff  .6..!.....>..7B.
	defb 0dfh,0b5h,0cdh,0aeh,06fh,0cdh,044h,06ah,0cdh,0dfh,0b5h,0c3h,0d3h,05dh,0ddh,035h	; b80f  ....o.Dj.....].5
	defb 00eh,028h,00ah,0ddh,07eh,00eh,0e6h,003h,0c0h,0ddh,034h,00dh,0c9h,0ddh,0e5h,0cdh	; b81f  .(..~.....4.....
	defb 06eh,050h,0ddh,0e1h,0cdh,0c8h,090h,0cdh,04eh,0b8h,0ddh,036h,00ch,003h,0ddh,036h	; b82f  nP......N..6...6
	defb 00dh,014h,0ddh,036h,00eh,0c0h,0cdh,0dfh,0b5h,0cdh,0aeh,06ch,0c3h,02ah,09dh,0cdh	; b83f  ...6.......l.*..
	defb 056h,042h,00fh,00fh,0e6h,003h,057h,047h,004h,079h,01fh,010h,0fdh,030h,007h,07ah	; b84f  VB....WG.y...0.z
	defb 03ch,0e6h,003h,057h,018h,0f1h,07ah,021h,07ah,0b8h,0cdh,0f6h,043h,0afh,0ddh,077h	; b85f  <..W..z!z...C..w
	defb 008h,0ddh,075h,009h,0ddh,077h,006h,0ddh,074h,007h,0c9h,0ffh,000h,001h,000h,000h	; b86f  ..u..w..t.......
	defb 0ffh,000h,001h,0cdh,0deh,086h,0ddh,07eh,007h,0a7h,028h,00ch,0ddh,07eh,003h,0d6h	; b87f  .......~..(..~..
	defb 018h,0feh,0a4h,0d2h,09eh,080h,018h,00ah,0ddh,07eh,005h,0d6h,00ch,0feh,0a8h,0d2h	; b88f  .........~......
	defb 08eh,080h,0cdh,0c8h,090h,0ddh,07eh,007h,0a7h,028h,00bh,017h,03eh,001h,038h,002h	; b89f  ......~..(..>.8.
	defb 03eh,002h,006h,00ch,018h,00ch,0ddh,07eh,009h,017h,03eh,004h,038h,002h,03eh,008h	; b8af  >......~..>.8.>.
	defb 006h,003h,0a1h,020h,00dh,0ddh,07eh,00eh,0e6h,01fh,020h,009h,048h,0cdh,04eh,0b8h	; b8bf  ... ..~... .H.N.
	defb 018h,003h,0cdh,08bh,080h,0ddh,035h,00eh,0ddh,07eh,00eh,0feh,060h,0cah,02fh,09dh	; b8cf  ......5..~..`./.
	defb 0a7h,0c0h,0cdh,02fh,09dh,0ddh,036h,00ch,000h,018h,015h,0ddh,035h,00eh,028h,010h	; b8df  .../..6.....5.(.
	defb 0ddh,07eh,00eh,0e6h,007h,0c0h,0ddh,07eh,00dh,01fh,03fh,017h,0ddh,077h,00dh,0c9h	; b8ef  .~.....~..?..w..
	defb 0ddh,036h,00dh,016h,0ddh,036h,00eh,040h,0c3h,0dfh,0b5h,0ddh,035h,00eh,0ddh,07eh	; b8ff  .6...6.@....5..~
	defb 00eh,0feh,020h,0cah,034h,09dh,0a7h,0c0h,0c3h,0dfh,0b5h,0afh,032h,03ch,0cbh,0ddh	; b90f  .. .4.......2<..
	defb 036h,001h,020h,0c9h	; b91f

; ======================================================================
; CODIGO 0xb923..0xb934  (17 bytes)
; ======================================================================


L_B923:
	ld a,(0d8aah)		;b923
	and a			;b926
	ret z			;b927
	ld a,(ix+001h)		;b928
	ld hl,0b934h		;b92b
	call 0424eh		;b92e
	jp 08082h		;b931

; ----------------------------------------------------------------------
; DATOS sin identificar  0xb934..0xbcf5  (961 bytes)
DATA_B934:
	defb 060h,0b9h,06fh,0b9h,078h,0b9h,090h,0b9h,0b8h,0b9h,0f3h,0b9h,00ch,0bah,025h,0bah	; b934  `.o.x.........%.
	defb 045h,0bah,058h,0bah,090h,0bah,038h,0bbh,063h,0bbh,057h,0bah,057h,0bah,057h,0bah	; b944  E.X...8.c.W.W.W.
	defb 0a2h,0bbh,0c1h,0bbh,0d9h,0bbh,04ah,0bch,0b5h,0bch,0e8h,0bch,0afh,0ddh,077h,00dh	; b954  ......J.......w.
	defb 03ch,032h,03ch,0cbh,0ddh,036h,00eh,018h,0c3h,054h,0bah,0ddh,035h,00eh,0c0h,016h	; b964  <2<..6...T..5...
	defb 009h,0c3h,04fh,0bah,0cdh,0f6h,0b5h,0c0h,0ddh,077h,00eh,03ch,032h,009h,0d5h,032h	; b974  ..O......w.<2..2
	defb 03ch,0cbh,0ddh,036h,00dh,002h,0cdh,077h,0a7h,0c3h,054h,0bah,0cdh,0dah,0b9h,0cdh	; b984  <..6...w..T.....
	defb 0deh,086h,0cdh,0afh,0b9h,0ddh,07eh,00ah,0feh,002h,0c0h,0ddh,07eh,003h,0feh,05eh	; b994  ......~.....~..^
	defb 0d8h,0ddh,036h,00dh,004h,0cdh,077h,0a7h,0c3h,054h,0bah,011h,0c1h,020h,021h,0b9h	; b9a4  ..6...w..T... !.
	defb 008h,0c3h,06bh,0aeh,0cdh,0dah,0b9h,0cdh,0afh,0b9h,0ddh,07eh,00bh,0feh,008h,0c0h	; b9b4  ..k........~....
	defb 0ddh,07eh,005h,0feh,050h,0d0h,0afh,0ddh,077h,00ch,032h,03ch,0cbh,0ddh,036h,00dh	; b9c4  .~..P...w.2<..6.
	defb 006h,0cdh,070h,07ah,018h,07ah,03ah,08ch,0d8h,03ch,028h,00dh,0ddh,034h,00eh,0ddh	; b9d4  ..pz.z:..<(..4..
	defb 07eh,00eh,0e6h,007h,001h,007h,00ah,028h,003h,001h,007h,00fh,0c3h,047h,000h,0cdh	; b9e4  ~......(.....G..
	defb 0dah,0b9h,03ah,08ch,0d8h,03ch,0c0h,03ah,04bh,0cah,0feh,003h,0c0h,03eh,001h,032h	; b9f4  ..:..<.:K....>.2
	defb 009h,0d5h,0ddh,036h,00dh,006h,018h,048h,03ah,04bh,0cah,0feh,002h,0c0h,03eh,001h	; ba04  ...6...H:K....>.
	defb 032h,03ch,0cbh,021h,0d9h,0d7h,0cbh,0ceh,0cdh,095h,06bh,0ddh,036h,00eh,010h,018h	; ba14  2<.!......k.6...
	defb 02fh,0ddh,07eh,00eh,0a7h,028h,00ah,0ddh,035h,00eh,0c0h,011h,010h,00fh,0c3h,0ceh	; ba24  /.~..(..5.......
	defb 061h,0cdh,0f6h,0b5h,0c0h,0ddh,036h,016h,001h,011h,060h,060h,0cdh,0d9h,079h,018h	; ba34  a.....6...``..y.
	defb 00fh,0cdh,0e1h,079h,03ah,070h,0e2h,0a7h,0c0h,016h,013h,01eh,010h,0cdh,0ceh,061h	; ba44  ...y:p.........a
	defb 0ddh,034h,001h,0c9h,0cdh,0f6h,0b5h,0c0h,032h,03ch,0cbh,0ddh,077h,011h,0ddh,077h	; ba54  .4......2<..w..w
	defb 00fh,0cdh,085h,086h,0cdh,070h,07ah,0cdh,054h,0bah,0afh,018h,002h,03eh,001h,0cdh	; ba64  .....pz.T....>..
	defb 07ah,0bah,078h,0c3h,07dh,0a7h,0f5h,0cdh,0e1h,0b4h,0f1h,0a7h,028h,005h,0cbh,018h	; ba74  z.x.}.......(...
	defb 03fh,0cbh,010h,0ddh,070h,018h,078h,087h,0ddh,077h,00dh,0c9h,0cdh,008h,0bbh,0c0h	; ba84  ?...p.x..w......
	defb 0cdh,0c8h,090h,0ddh,07eh,007h,0a7h,03eh,003h,020h,002h,03eh,00ch,0a1h,020h,0cah	; ba94  ....~..>. .>.. .
	defb 0cdh,0deh,086h,0cdh,0f1h,0bah,0ddh,07eh,007h,0a7h,001h,006h,00ch,020h,004h,0ebh	; baa4  .......~..... ..
	defb 001h,00ch,006h,07ch,095h,030h,002h,0edh,044h,0b8h,030h,009h,07ah,093h,030h,002h	; bab4  ...|.0..D.0.z.0.
	defb 0edh,044h,0b9h,038h,01ah,0cdh,0f1h,0bah,0ddh,07eh,018h,0feh,002h,038h,004h,07ch	; bac4  .D.8.....~...8.|
	defb 095h,018h,002h,07ah,093h,030h,002h,0edh,044h,0feh,004h,0d0h,0c3h,06eh,0bah,0afh	; bad4  ...z.0..D....n..
	defb 0ddh,077h,00ch,0ddh,077h,00fh,0ddh,036h,00eh,018h,0c3h,054h,0bah,0cdh,079h,080h	; bae4  .w..w..6...T..y.
	defb 055h,0ddh,06eh,005h,0ddh,05eh,003h,0c9h,0cdh,0e1h,0b4h,03eh,008h,080h,0ddh,077h	; baf4  U.n..^.....>...w
	defb 00dh,0c3h,015h,06ah,0ddh,07eh,017h,0a7h,0c8h,0ddh,036h,001h,00ch,0cdh,02eh,0bbh	; bb04  ...j.~....6.....
	defb 0ddh,07eh,00dh,0feh,008h,030h,00fh,0cbh,03fh,0c6h,002h,0e6h,003h,047h,087h,0ddh	; bb14  .~...0..?....G..
	defb 077h,00dh,078h,0c3h,07dh,0a7h,0d6h,008h,018h,0efh,0cdh,056h,042h,0e6h,003h,03ch	; bb24  w.x.}......VB..<
	defb 0ddh,077h,00fh,0c9h,0cdh,008h,0bbh,0c0h,0ddh,035h,00eh,028h,013h,0ddh,07eh,00eh	; bb34  .w.......5.(..~.
	defb 0e6h,003h,0c0h,0ddh,07eh,00fh,0ddh,034h,00fh,01fh,030h,0ach,0afh,0c3h,07ah,0bah	; bb44  ....~..4..0...z.
	defb 0cdh,056h,042h,01fh,038h,02dh,0cdh,071h,0bah,0cdh,02eh,0bbh,0c3h,054h,0bah,0cdh	; bb54  .VB.8-.q.....T..
	defb 0deh,086h,0cdh,08eh,0bbh,0d8h,0ddh,035h,00fh,028h,018h,0ddh,07eh,00dh,00fh,0e6h	; bb64  .......5.(..~...
	defb 003h,021h,083h,0bbh,0cdh,048h,042h,087h,0ddh,077h,00dh,07eh,0c3h,07dh,0a7h,002h	; bb74  .!...HB..w.~.}..
	defb 003h,001h,000h,0ddh,036h,001h,00ah,0c3h,06eh,0bah,0ddh,07eh,007h,0a7h,0ddh,07eh	; bb84  ....6...n..~...~
	defb 003h,006h,058h,020h,005h,006h,048h,0ddh,07eh,005h,090h,0feh,030h,0c9h,0afh,0ddh	; bb94  ..X ..H.~...0...
	defb 077h,00ch,032h,0e8h,0e1h,032h,0bbh,0d7h,03ch,032h,03ch,0cbh,0ddh,036h,00dh,00ch	; bba4  w.2..2..<2<..6..
	defb 0ddh,036h,00eh,020h,0cdh,00ah,07ah,0cdh,01bh,06ch,0c3h,054h,0bah,0ddh,035h,00eh	; bbb4  .6. ..z..l.T..5.
	defb 0c0h,026h,000h,06ch,054h,05ch,001h,0c0h,0c0h,0cdh,04dh,047h,011h,060h,060h,0cdh	; bbc4  .&.lT\....MG.``.
	defb 002h,07ah,0c3h,054h,0bah,0cdh,0e1h,079h,03ah,070h,0e2h,0a7h,0c0h,0cdh,0c2h,06ch	; bbd4  .z.T...y:p.....l
	defb 0cdh,0f6h,045h,03eh,002h,032h,0aah,0d8h,0cdh,0d7h,045h,0cdh,06ah,06fh,03eh,0d8h	; bbe4  ..E>.2....E.jo>.
	defb 032h,070h,0dch,021h,078h,0dch,036h,027h,023h,036h,088h,023h,036h,0f8h,023h,023h	; bbf4  2p.!x.6'#6.#6.##
	defb 036h,037h,023h,036h,090h,023h,036h,0fch,021h,0e0h,0dbh,001h,01fh,000h,03eh,00ah	; bc04  67#6.#6.!.....>.
	defb 0cdh,037h,042h,0afh,0cdh,09bh,07ah,03eh,008h,0cdh,09bh,07ah,03ah,042h,0cah,0cdh	; bc14  .7B...z>...z:B..
	defb 052h,044h,0cdh,050h,046h,0cdh,0b8h,07ah,0cdh,009h,046h,011h,020h,020h,0afh,047h	; bc24  RD.PF..z..F.  .G
	defb 0cdh,0a0h,07ah,011h,020h,080h,03eh,008h,006h,001h,0cdh,0a0h,07ah,011h,070h,010h	; bc34  ..z. .>.....z.p.
	defb 0cdh,0d3h,061h,0c3h,054h,0bah,0cdh,0a8h,07ah,0cdh,0ffh,0b5h,0c0h,0cdh,0f1h,045h	; bc44  ..a.T...z......E
	defb 021h,000h,0cdh,001h,0ffh,000h,0cdh,036h,042h,0afh,0cdh,09fh,0bch,03eh,001h,0cdh	; bc54  !......6B....>..
	defb 09fh,0bch,0afh,0ddh,077h,00fh,032h,001h,0cbh,032h,000h,0cbh,032h,016h,0cbh,03ch	; bc64  ....w.2..2..2..<
	defb 032h,014h,0cbh,0cdh,0d3h,05dh,0cdh,0b0h,07ah,03eh,001h,0cdh,0b0h,07ah,0cdh,01fh	; bc74  2....]..z>...z..
	defb 07ah,0cdh,04fh,044h,011h,060h,060h,0cdh,0d9h,079h,0cdh,0c5h,045h,021h,070h,0dch	; bc84  z.OD.``..y..E!p.
	defb 001h,00fh,000h,03eh,0e0h,0cdh,037h,042h,0c3h,054h,0bah,057h,0f5h,021h,030h,0dch	; bc94  ...>..7B.T.W.!0.
	defb 001h,008h,00ah,0afh,0cdh,0ffh,046h,0f1h,021h,030h,0dbh,001h,000h,008h,0c3h,080h	; bca4  ......F.!0......
	defb 046h,0cdh,0e1h,079h,03ah,070h,0e2h,0a7h,0c0h,03eh,068h,032h,003h,0cbh,0ddh,077h	; bcb4  F..y:p...>h2...w
	defb 003h,03eh,070h,032h,005h,0cbh,03eh,003h,032h,00eh,0cbh,0ddh,036h,005h,050h,0ddh	; bcc4  .>p2..>.2...6.P.
	defb 036h,00eh,010h,03eh,001h,032h,0aah,0d8h,0cdh,0d7h,045h,0cdh,066h,042h,0cdh,009h	; bcd4  6..>.2....E.fB..
	defb 046h,0c3h,054h,0bah,0ddh,035h,00eh,0c0h,0afh,032h,0aah,0d8h,0ddh,036h,001h,020h	; bce4  F.T..5...2...6.
	defb 0c9h	; bcf4

; ======================================================================
; CODIGO 0xbcf5..0xbd58  (99 bytes)
; ======================================================================


L_BCF5:
	ld a,(0ca4ah)		;bcf5
	cp 013h		;bcf8
	ret nz			;bcfa
	ld a,(0ca4bh)		;bcfb
	cp 005h		;bcfe
	ret nz			;bd00
	call 041ddh		;bd01
	ld hl,00706h		;bd04
	ld (0ca4ch),hl		;bd07
	ld hl,07435h		;bd0a
	ld de,08418h		;bd0d
	call 0741bh		;bd10
	ld a,(0d821h)		;bd13
	cp 00fh		;bd16
	push ix		;bd18
	ld ix,0d820h		;bd1a
	call nc,L_BD26		;bd1e
	pop ix		;bd21
	jp 0413fh		;bd23
L_BD26:
	ld a,(ix+005h)		;bd26
	sub 010h		;bd29
	ld d,a			;bd2b
	ld a,(ix+003h)		;bd2c
	sub 010h		;bd2f
	ld e,a			;bd31
	ld hl,0743dh		;bd32
	ld bc,00402h		;bd35
	jp 0741eh		;bd38
L_BD3B:
	ld a,(ix+001h)		;bd3b
	cp 00fh		;bd3e
	jp nc,08728h		;bd40
	jp 08739h		;bd43
L_BD46:
	ld a,(0ca4bh)		;bd46
	cp 005h		;bd49
	ret nz			;bd4b
	ld a,(ix+001h)		;bd4c
	ld hl,0bd58h		;bd4f
	call 0424eh		;bd52
	jp 08082h		;bd55

; ----------------------------------------------------------------------
; DATOS sin identificar  0xbd58..0xc000  (680 bytes)
DATA_BD58:
	defb 084h,0bdh,0ach,0bdh,0bah,0bdh,0d9h,0bdh,0fdh,0bdh,00ah,0beh,01ch,0beh,028h,0beh	; bd58  ..............(.
	defb 03bh,0beh,04fh,0beh,064h,0beh,06ch,0beh,0c6h,0beh,008h,0bfh,041h,0bfh,048h,0bfh	; bd68  ..O.d.l.....A.H.
	defb 086h,0bfh,09ch,0bfh,0b8h,0bfh,0d4h,0bfh,0dah,0bfh,0ebh,0bfh,0afh,032h,070h,0e0h	; bd78  .............2p.
	defb 032h,000h,0d5h,032h,010h,0d5h,03ch,032h,03ch,0cbh,021h,0d8h,0d7h,0cbh,0deh,0ddh	; bd88  2..2..<2<.!.....
	defb 036h,00eh,010h,0ddh,036h,00dh,004h,021h,0b8h,06bh,0cdh,085h,07ch,03eh,0b4h,032h	; bd98  6...6..!.k..|>.2
	defb 018h,0cah,018h,04dh,0ddh,035h,00eh,0c0h,0ddh,036h,00eh,009h,0ddh,036h,00fh,000h	; bda8  ...M.5...6...6..
	defb 018h,03fh,0ddh,035h,00eh,028h,011h,0ddh,07eh,00eh,0e6h,007h,0c0h,0ddh,034h,00fh	; bdb8  .?.5.(..~.....4.
	defb 0ddh,07eh,00fh,087h,0ddh,077h,00dh,0c9h,016h,014h,01eh,060h,0cdh,0ceh,061h,018h	; bdc8  .~...w.....`..a.
	defb 020h,0cdh,047h,062h,0c0h,0cdh,0c7h,079h,03eh,017h,032h,000h,0cbh,0afh,032h,03ch	; bdd8   .Gb...y>.2...2<
	defb 0cbh,03ch,032h,0abh,0d8h,03ch,0ddh,077h,00dh,0cdh,077h,0a7h,03eh,004h,032h,00eh	; bde8  .<2..<.w..w.>.2.
	defb 0cbh,0ddh,034h,001h,0c9h,0cdh,095h,0beh,03ah,005h,0cbh,0feh,098h,0d8h,03eh,001h	; bdf8  ..4.....:.....>.
	defb 018h,0ech,0cdh,095h,0beh,03ah,003h,0cbh,0feh,038h,0d0h,03eh,001h,032h,042h,0cbh	; be08  .....:...8.>.2B.
	defb 03eh,003h,018h,0dah,0cdh,095h,0beh,03eh,001h,032h,03ch,0cbh,016h,015h,018h,0aah	; be18  >......>.2<.....
	defb 0cdh,095h,0beh,0cdh,047h,062h,0c0h,0cdh,0c7h,079h,0ddh,036h,00eh,05ah,0cdh,0e8h	; be28  ....Gb...y.6.Z..
	defb 06bh,018h,0beh,0ddh,035h,00eh,0c0h,0afh,0cdh,0e9h,079h,0cdh,012h,06bh,0cdh,095h	; be38  k...5.....y..k..
	defb 06bh,0ddh,036h,00eh,020h,018h,0aah,0cdh,0f1h,079h,0ddh,035h,00eh,0c0h,0cdh,0fah	; be48  k.6. ....y.5....
	defb 079h,03eh,001h,032h,05ah,0e2h,03ch,0cdh,050h,062h,018h,095h,0cdh,0cch,06bh,016h	; be58  y>.2Z.<.Pb....k.
	defb 016h,0c3h,0d2h,0bdh,0cdh,047h,062h,0c0h,0cdh,0c7h,079h,0ddh,036h,00eh,020h,03eh	; be68  .....Gb...y.6. >
	defb 017h,032h,000h,0cbh,0afh,032h,03ch,0cbh,0ddh,036h,00dh,006h,03eh,003h,047h,0cdh	; be78  .2...2<..6..>.G.
	defb 081h,0a7h,03eh,002h,0cdh,0f6h,0bdh,0cdh,012h,06bh,0c3h,085h,086h,03ah,0abh,0d8h	; be88  ..>......k...:..
	defb 0a7h,0c8h,03dh,020h,014h,0cdh,0deh,086h,0ddh,07eh,003h,0feh,050h,0d8h,021h,0abh	; be98  ..= .....~..P.!.
	defb 0d8h,034h,0ddh,036h,00dh,004h,0c3h,077h,0a7h,0cdh,0deh,086h,0ddh,07eh,005h,0feh	; bea8  .4.6...w.....~..
	defb 070h,0d0h,0ddh,036h,00dh,006h,0afh,0ddh,077h,00ch,032h,0abh,0d8h,0c9h,03ah,005h	; beb8  p..6....w.2...:.
	defb 0cbh,0ddh,096h,005h,030h,002h,0edh,044h,0feh,005h,0d0h,0afh,0ddh,077h,011h,032h	; bec8  ....0..D.....w.2
	defb 03ch,0cbh,03ch,032h,042h,0cbh,0ddh,077h,016h,0cdh,0e7h,0beh,0c3h,0f9h,0bdh,021h	; bed8  <.<2B..w.......!
	defb 021h,0cbh,07eh,0d6h,00ah,0feh,002h,0d0h,036h,000h,03ah,035h,0cbh,0e6h,001h,032h	; bee8  !.~.....6.:5...2
	defb 000h,0cbh,032h,001h,0cbh,021h,0a4h,0d8h,001h,010h,018h,03eh,099h,0c3h,0f2h,046h	; bef8  ..2..!.....>...F
	defb 0ddh,07eh,011h,0ddh,034h,011h,0e6h,03fh,020h,007h,03ah,053h,0cah,0a7h,0c4h,020h	; bf08  .~..4..? .:S...
	defb 09dh,03ah,00eh,0cbh,047h,021h,037h,0bfh,0cdh,0f6h,043h,0ebh,0cdh,079h,080h,07bh	; bf18  .:..G!7...C..y.{
	defb 085h,0ddh,077h,003h,07ah,084h,0ddh,077h,005h,078h,03dh,0c6h,008h,0ddh,077h,00dh	; bf28  ..w.z..w.x=...w.
	defb 0c9h,000h,0fah,0fch,000h,0feh,003h,0feh,0f6h,0cdh,000h,081h,0c0h,0c3h,0f9h,0bdh	; bf38  ................
	defb 0afh,0ddh,077h,00ch,0ddh,077h,016h,0ddh,036h,00eh,018h,03eh,002h,032h,000h,0d5h	; bf48  ..w..w..6..>.2..
	defb 03eh,00dh,032h,010h,0d5h,021h,0d6h,0d7h,0cbh,0feh,0c3h,0f9h,0bdh,021h,006h,007h	; bf58  >.2..!.......!..
	defb 022h,04ch,0cah,021h,042h,0cah,07eh,0e5h,0f5h,0eeh,001h,077h,0cdh,0ddh,041h,0cdh	; bf68  "L.!B.~....w..A.
	defb 026h,0bdh,0cdh,03fh,041h,0f1h,0e1h,077h,03eh,0ffh,032h,08bh,0d8h,0c9h,0ddh,035h	; bf78  &..?A..w>.2....5
	defb 00eh,0c0h,0cdh,01bh,06ch,0cdh,088h,07ah,0cdh,085h,07ch,0cdh,028h,087h,0cdh,065h	; bf88  ....l..z..|.(..e
	defb 0bfh,0c3h,0f9h,0bdh,0afh,032h,070h,0e0h,03ah,0d9h,0d7h,0e6h,020h,0c8h,021h,0d9h	; bf98  .....2p.:... .!.
	defb 0d7h,0cbh,0e6h,03eh,002h,032h,00eh,0cbh,03eh,017h,032h,000h,0cbh,0c3h,0f9h,0bdh	; bfa8  ...>.2..>.2.....
	defb 03ah,003h,0cbh,0feh,080h,0d8h,03eh,001h,032h,03ch,0cbh,032h,042h,0cbh,03eh,004h	; bfb8  :.....>.2<.2B.>.
	defb 032h,00eh,0cbh,021h,0b0h,06bh,0cdh,085h,07ch,0c3h,0f9h,0bdh,011h,018h,017h,0c3h	; bfc8  2..!.k..|.......
	defb 0d4h,0bdh,0cdh,047h,062h,0c0h,0cdh,0c7h,079h,0cdh,0e8h,06bh,0ddh,036h,00eh,020h	; bfd8  ...Gb...y..k.6.
	defb 0c3h,0f9h,0bdh,0ddh,07eh,00eh,0a7h,028h,007h,0ddh,035h,00eh,0c0h,0c3h,012h,06bh	; bfe8  ....~..(..5....k
	defb 03eh,001h,032h,070h,0e0h,0c3h,065h,08ch	; bff8  >.2p..e.
