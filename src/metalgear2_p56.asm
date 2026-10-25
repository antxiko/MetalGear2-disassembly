; ==========================================================================
; METAL GEAR 2 SOLID SNAKE - Konami (1990) - MSX2 - MegaROM RC-767 de 512 KB (Konami SCC) - banco 56 (se ejecuta en 0xa000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x0a000


; ----------------------------------------------------------------------
; DATOS mosaico_A000: un mosaico de 2 x 4 caracteres, un byte cada uno
;   (p00:510F; BC = 0x0204 en quien llama); lo leen p02:8328 (8 bytes)
;   0xa000..0xa008  (8 bytes)
DATA_mosaico_A000:
	defb 01dh,018h,00bh,00bh	; a000
	defb 01eh,019h,00ah,00bh	; a004

; ----------------------------------------------------------------------
; DATOS mosaico_A008: un mosaico de 2 x 1 caracteres, un byte cada uno
;   (p00:510F; BC = 0x0201 en quien llama); lo leen p02:8334 (2 bytes)
;   0xa008..0xa00a  (2 bytes)
DATA_mosaico_A008:
	defb 007h	; a008
	defb 008h	; a009

; ----------------------------------------------------------------------
; DATOS mosaico_A00A: un mosaico de 2 x 5 caracteres, un byte cada uno
;   (p00:510F; BC = 0x0205 en quien llama); lo leen p02:8340 (10 bytes)
;   0xa00a..0xa014  (10 bytes)
DATA_mosaico_A00A:
	defb 01dh,016h,001h,012h,009h	; a00a
	defb 01eh,017h,002h,013h,00ah	; a00f

; ----------------------------------------------------------------------
; DATOS resto_A014: lo apuntan con el banco puesto p02:8343 (0xA014); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p02:8343 (40 bytes)
;   0xa014..0xa03c  (40 bytes)
DATA_resto_A014:
	defb 068h,09eh,080h,048h,071h,09eh,050h,048h,078h,09eh,0b0h,048h,07fh,09eh,030h,048h	; a014  h..Hq.PHx..H..0H
	defb 086h,09eh,078h,048h,093h,09eh,060h,048h,09ah,09eh,050h,048h,0a1h,09eh,030h,048h	; a024  ..xH..`H..PH..0H
	defb 0a8h,09eh,0a0h,048h,0b3h,09eh,020h,050h	; a034  ...H.. P

; ----------------------------------------------------------------------
; DATOS mosaico_A03C: un mosaico de 10 x 12 caracteres, un byte cada uno
;   (p00:510F; BC = 0x0A0C en quien llama); lo leen p02:82C6 (120 bytes)
;   0xa03c..0xa0b4  (120 bytes)
DATA_mosaico_A03C:
	defb 002h,002h,002h,002h,002h,010h,011h,012h,013h,001h,002h,002h	; a03c  ............
	defb 002h,002h,002h,009h,020h,014h,015h,016h,017h,002h,002h,002h	; a048  .... .......
	defb 002h,002h,002h,018h,00ah,040h,00bh,041h,019h,021h,002h,002h	; a054  .....@.A.!..
	defb 002h,002h,002h,002h,047h,03dh,00dh,00ch,00eh,024h,002h,002h	; a060  ....G=...$..
	defb 023h,025h,026h,027h,01ah,00fh,01bh,03ch,02ch,03eh,002h,002h	; a06c  #%&'...<,>..
	defb 002h,028h,007h,029h,02ah,02bh,042h,043h,02dh,03fh,002h,002h	; a078  .(.)*+BC-?..
	defb 002h,002h,02eh,02fh,003h,006h,044h,045h,037h,002h,002h,002h	; a084  .../..DE7...
	defb 002h,002h,036h,035h,004h,01dh,01fh,034h,033h,002h,002h,002h	; a090  ..65...43...
	defb 002h,002h,002h,030h,031h,004h,005h,004h,032h,002h,002h,002h	; a09c  ...01...2...
	defb 002h,002h,002h,002h,047h,038h,039h,022h,002h,002h,002h,002h	; a0a8  ....G89"....

; ----------------------------------------------------------------------
; DATOS resto_A0B4: lo apuntan con el banco puesto p02:82CE (0xA0B4), p12:6C2C
;   (0xA19B), p12:6C38 (0xA1A1), p12:6C8D (0xA1A7), p12:6C4F (0xA1AD),
;   p12:6C54 (0xA1B3); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p02:82CE, p12:6C2C, p12:6C38, p12:6C8D, p12:6C4F,
;   p12:6C54 (862 bytes)
;   0xa0b4..0xa412  (862 bytes)
DATA_resto_A0B4:
	defb 058h,0c0h,048h,078h,001h,058h,080h,040h,078h,001h,058h,0c8h,048h,080h,001h,058h	; a0b4  X.Hx.X.@x.X.H..X
	defb 088h,040h,080h,001h,050h,090h,038h,080h,028h,050h,088h,038h,078h,028h,050h,080h	; a0c4  .@..P.8.(P.8x(P.
	defb 038h,070h,028h,050h,0b0h,048h,058h,028h,050h,0a0h,048h,050h,028h,050h,0b8h,050h	; a0d4  8p(P.HX(P.HP(P.P
	defb 050h,028h,050h,0a8h,050h,048h,028h,058h,0d0h,048h,078h,001h,058h,090h,040h,078h	; a0e4  P(P.PH(X.Hx.X.@x
	defb 001h,058h,0d8h,048h,080h,001h,058h,098h,040h,080h,028h,050h,0c0h,060h,040h,028h	; a0f4  .X.H..X.@.(P.`@(
	defb 050h,0c8h,060h,038h,028h,050h,0d0h,068h,038h,028h,050h,0d8h,070h,038h,028h,050h	; a104  P.`8(P.h8(P.p8(P
	defb 0e0h,070h,040h,028h,058h,050h,070h,048h,028h,058h,070h,070h,050h,028h,058h,0e0h	; a114  .p@(XPpH(XppP(X.
	defb 048h,078h,001h,058h,0a0h,040h,078h,001h,058h,0e8h,048h,080h,001h,058h,0a8h,040h	; a124  Hx.X.@x.X.H..X.@
	defb 080h,028h,048h,0d0h,070h,048h,001h,048h,0d8h,070h,050h,028h,050h,0f8h,070h,058h	; a134  .(H.pH.H.pP(P.pX
	defb 028h,058h,000h,070h,060h,028h,058h,008h,068h,060h,028h,058h,010h,068h,068h,028h	; a144  (X.p`(X.h`(X.hh(
	defb 058h,018h,068h,070h,028h,058h,020h,060h,070h,028h,058h,028h,060h,078h,028h,058h	; a154  X.hp(X `p(X(`x(X
	defb 030h,058h,078h,028h,058h,040h,060h,080h,028h,058h,038h,058h,080h,028h,058h,068h	; a164  0Xx(X@`.(X8X.(Xh
	defb 050h,080h,001h,058h,048h,058h,088h,001h,058h,060h,050h,088h,001h,058h,058h,048h	; a174  P..XHX..X`P..XXH
	defb 088h,001h,058h,0c0h,048h,078h,001h,058h,0b0h,040h,078h,001h,058h,0f0h,048h,080h	; a184  ..X.Hx.X.@x.X.H.
	defb 001h,058h,0b8h,040h,080h,001h,0ffh,003h,070h,060h,002h,008h,014h,001h,000h,040h	; a194  .X.@....p`.....@
	defb 008h,007h,020h,006h,018h,060h,003h,006h,080h,007h,030h,060h,005h,004h,060h,002h	; a1a4  .. ..`....0`..`.
	defb 060h,060h,003h,009h,014h,005h,060h,060h,001h,008h,060h,009h,080h,060h,003h,009h	; a1b4  ``....``..`..`..
	defb 030h,00ah,068h,0a0h,003h,007h,070h,008h,038h,0a0h,004h,008h,040h,029h,004h,070h	; a1c4  0.h...p.8...@).p
	defb 060h,003h,008h,028h,000h,000h,000h,001h,003h,004h,002h,004h,005h,003h,006h,007h	; a1d4  `..(............
	defb 004h,047h,006h,005h,000h,005h,006h,000h,003h,007h,077h,007h,008h,012h,002h,009h	; a1e4  .G........w.....
	defb 006h,000h,00ah,070h,000h,00bh,070h,007h,00ch,070h,003h,00dh,044h,004h,00eh,033h	; a1f4  ...p..p..p..D..3
	defb 003h,00fh,000h,000h,0ffh,00dh,044h,004h,00eh,040h,000h,0ffh,00dh,034h,004h,00eh	; a204  ......D..@...4..
	defb 023h,003h,0ffh,001h,000h,000h,002h,040h,000h,003h,020h,000h,004h,060h,000h,005h	; a214  #......@.. ..`..
	defb 077h,007h,006h,000h,000h,007h,070h,000h,008h,040h,000h,009h,000h,000h,00ah,070h	; a224  w.....p..@.....p
	defb 000h,00bh,050h,000h,00ch,030h,000h,00dh,030h,000h,00eh,020h,000h,0ffh,07fh,0ffh	; a234  ..P..0..0.. ....
	defb 0f7h,0ffh,0ffh,060h,000h,036h,000h,003h,060h,000h,036h,03fh,0e3h,063h,0feh,036h	; a244  ...`.6..`.6?.c.6
	defb 030h,063h,063h,006h,036h,030h,063h,063h,006h,036h,030h,063h,063h,0feh,036h,03fh	; a254  0cc.60cc.60cc.6?
	defb 0e3h,063h,000h,036h,000h,003h,060h,000h,037h,0ffh,0ffh,07fh,0ffh,0f6h,000h,000h	; a264  .c.6..`.7.......
	defb 000h,001h,084h,03fh,018h,0e3h,0ffh,0f7h,033h,0ffh,023h,036h,060h,03fh,066h,003h	; a274  ...?....3.#6`?f.
	defb 0f6h,070h,031h,0ffh,003h,01fh,0ffh,03fh,018h,0f3h,0f1h,083h,0f3h,0ffh,03fh,03fh	; a284  .p1....?......??
	defb 0f3h,0b3h,018h,033h,0f1h,083h,03fh,018h,07bh,031h,08fh,0e0h,000h,0efh,0ffh,0f4h	; a294  ...3..?.{1......
	defb 03fh,0ffh,003h,0c0h,000h,038h,030h,007h,0ffh,080h,0ffh,0f0h,01ch,00eh,007h,081h	; a2a4  ?....80.........
	defb 0c0h,03fh,0ffh,0f0h,0ffh,0ffh,00ch,000h,000h,0cfh,0f8h,00ch,0ffh,080h,0cch,018h	; a2b4  .?..............
	defb 00ch,0c1h,080h,0cch,018h,00ch,0cfh,081h,08ch,0f2h,018h,0c0h,033h,00ch,007h,070h	; a2c4  ............3..p
	defb 0ffh,0e2h,007h,0fch,07fh,01eh,007h,0f1h,0e0h,067h,03fh,006h,067h,038h,06eh,0e1h	; a2d4  .........g?.g8n.
	defb 0c6h,0ffh,0ffh,07fh,0ffh,0f7h,090h,0c2h,06ch,0ffh,0c6h,0cfh,0fch,066h,0cch,0c6h	; a2e4  ........l....f..
	defb 06ch,0cch,067h,0ffh,0c7h,0ffh,0fch,06eh,0deh,0c6h,043h,0f0h,060h,073h,086h,03eh	; a2f4  l.g....n..C.`s.>
	defb 01fh,063h,0c0h,0f6h,030h,003h,01ah,0a3h,032h,0a3h,04ah,0a3h,062h,0a3h,07ah,0a3h	; a304  .c..0...2.J.b.z.
	defb 092h,0a3h,09eh,0a3h,0aah,0a3h,0f8h,0f8h,0f8h,000h,0f8h,007h,001h,0f8h,001h,000h	; a314  ................
	defb 001h,007h,0f9h,0f7h,0fch,0f7h,000h,0f7h,0f9h,008h,0fch,008h,000h,008h,0e4h,0f8h	; a324  ................
	defb 0e4h,000h,0e4h,007h,001h,0f8h,001h,000h,001h,007h,0f9h,0efh,0fch,0efh,000h,0efh	; a334  ................
	defb 0f9h,010h,0fch,010h,000h,010h,0f8h,0f8h,0f8h,000h,0f8h,007h,001h,0f8h,001h,000h	; a344  ................
	defb 001h,007h,0f9h,0f7h,0fch,0f7h,000h,0f7h,0f9h,008h,0fch,008h,000h,008h,0f0h,0f8h	; a354  ................
	defb 0f0h,000h,0f0h,007h,008h,0f8h,008h,000h,008h,007h,0f9h,0efh,0fch,0efh,000h,0efh	; a364  ................
	defb 0f9h,010h,0fch,010h,000h,010h,0e8h,0f8h,0e8h,000h,0e8h,007h,010h,0f8h,010h,000h	; a374  ................
	defb 010h,007h,0f9h,0e7h,0fch,0e7h,000h,0e7h,0f9h,018h,0fch,018h,000h,018h,0e0h,0f8h	; a384  ................
	defb 0e0h,000h,0e0h,007h,018h,0f8h,018h,000h,018h,007h,0d8h,0f8h,0d8h,000h,0d8h,007h	; a394  ................
	defb 020h,0f8h,020h,000h,020h,007h,004h,0f8h,004h,000h,004h,007h,0f1h,0f8h,0f1h,000h	; a3a4   . . ...........
	defb 0f1h,007h,0f9h,00ch,0fch,00ch,000h,00ch,0f9h,0f4h,0fch,0f4h,000h,0f4h,0a2h,000h	; a3b4  ................
	defb 0a8h,0a1h,0a7h,0a1h,0a8h,0a1h,0a8h,0a1h,0a8h,0a1h,0a7h,0a1h,0a8h,0a1h,0a8h,0a1h	; a3c4  ................
	defb 0a8h,0a1h,0a2h,000h,0a3h,0a4h,0a5h,0a0h,0a6h,0a4h,0a6h,0a4h,0a3h,0a4h,0a6h,0a0h	; a3d4  ................
	defb 0a6h,0a4h,0a6h,0a4h,0a3h,0a4h,0a2h,000h,0ach,0adh,0ach,0a1h,0ach,0adh,0a7h,0adh	; a3e4  ................
	defb 0a7h,0adh,0ach,0a1h,0ach,0adh,0ach,0adh,0a7h,0adh,0a2h,000h,0a9h,0a1h,0aah,0abh	; a3f4  ................
	defb 0a9h,0abh,0a9h,0abh,0a9h,0a1h,0aah,0abh,0a9h,0abh,0a9h,0abh,0a9h,0a1h	; a404  ..............

; ----------------------------------------------------------------------
; DATOS mosaico_A412: un mosaico de 8 x 32 caracteres, un byte cada uno
;   (p00:510F; BC = 0x0820 en quien llama); lo leen p01:6FF4 (256 bytes)
;   0xa412..0xa512  (256 bytes)
DATA_mosaico_A412:
	defb 001h,002h,003h,06eh,018h,019h,01ah,01bh,082h,083h,000h,06fh,079h,07ah,042h,043h	; a412  ...n.......oyzBC
	defb 074h,00ch,0a3h,0a4h,094h,08fh,05eh,020h,008h,009h,000h,000h,011h,012h,098h,097h	; a422  t.....^ ........
	defb 000h,004h,005h,006h,01ch,01dh,01eh,01fh,084h,085h,00fh,010h,07bh,07ch,044h,045h	; a432  ............{|DE
	defb 00dh,00eh,0a5h,0a6h,086h,087h,021h,022h,00ah,00bh,000h,000h,013h,014h,071h,041h	; a442  ......!"......qA
	defb 088h,089h,015h,016h,03dh,03eh,07eh,07fh,035h,08ch,033h,03ch,06ah,06bh,046h,047h	; a452  ....=>~.5.3<jkFG
	defb 04eh,04fh,04ah,04bh,05ah,05bh,025h,026h,029h,02ah,02ch,02dh,060h,061h,063h,064h	; a462  NOJKZ[%&)*,-`acd
	defb 08ah,08bh,070h,017h,03fh,040h,096h,081h,0a2h,036h,073h,007h,06ch,06dh,048h,049h	; a472  ..p.?@...6s.lmHI
	defb 050h,051h,04ch,04dh,05ch,05dh,027h,028h,027h,02bh,02eh,02fh,062h,038h,065h,039h	; a482  PQLM\]'('+./b8e9
	defb 000h,066h,000h,068h,03bh,09dh,03bh,09ah,03bh,0a7h,03bh,0a0h,099h,09fh,075h,078h	; a492  .f.h..........ux
	defb 090h,030h,023h,024h,08dh,08eh,052h,053h,056h,057h,000h,000h,0f4h,0f0h,0f0h,0f1h	; a4a2  .0#$..RSVW......
	defb 000h,067h,000h,069h,09ch,09eh,09ch,09bh,09ch,0a8h,09ch,0a1h,072h,03ah,05fh,034h	; a4b2  .g.i........r:_4
	defb 095h,091h,092h,093h,07dh,037h,054h,055h,058h,059h,000h,000h,0f2h,000h,000h,0f3h	; a4c2  ....}7TUXY......
	defb 0c5h,0c6h,0c8h,000h,000h,0e0h,0e1h,0e8h,0e9h,0ech,0edh,0e4h,0e5h,0d2h,0d3h,0d4h	; a4d2  ................
	defb 0d5h,0d6h,0d7h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0f2h,000h,000h,0f3h	; a4e2  ................
	defb 0c5h,0c7h,0c9h,000h,000h,0e2h,0e3h,0eah,0ebh,0eeh,0efh,0e6h,0e7h,0d8h,0d9h,0dah	; a4f2  ................
	defb 0dbh,0dch,0ddh,000h,000h,000h,000h,000h,000h,000h,000h,000h,0f2h,000h,000h,0f3h	; a502  ................

; ----------------------------------------------------------------------
; DATOS resto_A512: lo apuntan con el banco puesto p02:87AD (0xA53A), p12:7F47
;   (0xA5EA), p12:7F58 (0xA5ED), p12:7F85 (0xA60D), p12:7F93 (0xA618),
;   p12:7F7B (0xA623); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p02:87AD, p12:7F47, p12:7F58, p12:7F85, p12:7F93,
;   p12:7F7B (693 bytes)
;   0xa512..0xa7c7  (693 bytes)
DATA_resto_A512:
	defb 00fh,000h,001h,002h,003h,020h,00bh,008h,008h,008h,008h,020h,014h,004h,005h,006h	; a512  ..... ..... ....
	defb 007h,020h,0ffh,000h,009h,00ah,00bh,00ch,020h,0ffh,000h,00dh,00eh,00fh,010h,020h	; a522  . ...... ......
	defb 0ffh,000h,011h,012h,013h,014h,020h,0ffh,064h,0a5h,06bh,0a5h,072h,0a5h,079h,0a5h	; a532  ...... .d.k.r.y.
	defb 07fh,0a5h,084h,0a5h,08ah,0a5h,092h,0a5h,095h,0a5h,09bh,0a5h,0a2h,0a5h,0aah,0a5h	; a542  ................
	defb 0b2h,0a5h,0b8h,0a5h,0beh,0a5h,0c5h,0a5h,0cah,0a5h,0d0h,0a5h,0d7h,0a5h,0dfh,0a5h	; a552  ................
	defb 0e4h,0a5h,000h,001h,002h,003h,004h,005h,0ffh,000h,001h,006h,007h,008h,009h,0ffh	; a562  ................
	defb 002h,006h,003h,007h,004h,005h,0ffh,000h,001h,002h,008h,005h,0ffh,001h,004h,005h	; a572  ................
	defb 008h,0ffh,003h,00ah,008h,009h,00bh,0ffh,003h,00ah,004h,005h,008h,009h,00bh,0ffh	; a582  ................
	defb 00bh,003h,0ffh,000h,001h,006h,009h,00ch,0ffh,001h,002h,00bh,00fh,010h,011h,0ffh	; a592  ................
	defb 003h,006h,00bh,00dh,00eh,00fh,011h,0ffh,003h,00bh,00dh,00eh,00fh,010h,011h,0ffh	; a5a2  ................
	defb 001h,002h,00dh,00fh,011h,0ffh,003h,00bh,00fh,010h,011h,0ffh,001h,003h,00bh,00dh	; a5b2  ................
	defb 010h,012h,0ffh,001h,00dh,00eh,010h,0ffh,001h,00dh,00eh,00fh,013h,0ffh,003h,00bh	; a5c2  ................
	defb 00eh,00fh,010h,011h,0ffh,003h,001h,00bh,00dh,00eh,010h,012h,0ffh,001h,00dh,010h	; a5d2  ................
	defb 00eh,0ffh,001h,00dh,00eh,00fh,013h,0ffh,00fh,00bh,014h,0f3h,0a5h,0feh,0a5h,004h	; a5e2  ................
	defb 0a6h,000h,001h,002h,003h,004h,005h,006h,007h,008h,009h,0ffh,000h,001h,006h,009h	; a5f2  ................
	defb 00ch,0ffh,001h,003h,004h,005h,008h,009h,00ah,00bh,0ffh,001h,002h,003h,006h,00bh	; a602  ................
	defb 00dh,00eh,00fh,010h,011h,0ffh,001h,003h,00bh,00dh,00eh,00fh,010h,011h,012h,013h	; a612  ................
	defb 0ffh,001h,003h,00bh,00dh,00eh,00fh,010h,011h,012h,013h,0ffh,08ah,040h,002h,020h	; a622  .............@.
	defb 056h,02fh,02ah,002h,08bh,004h,002h,01ch,00ch,02fh,034h,002h,04bh,080h,002h,01eh	; a632  V/*....../4.K...
	defb 08bh,080h,002h,01eh,04bh,004h,002h,01ch,04bh,040h,002h,020h,056h,06fh,02ah,002h	; a642  ....K...K@. Vo*.
	defb 096h,06fh,022h,002h,00ch,06fh,034h,002h,096h,02fh,022h,002h,08bh,080h,002h,03eh	; a652  .o"..o4../"....>
	defb 04bh,040h,002h,040h,08ah,040h,002h,040h,00ch,08fh,034h,002h,056h,08fh,02ah,002h	; a662  K@.@.@.@..4.V.*.
	defb 096h,08fh,022h,002h,04bh,0a0h,002h,01eh,08bh,0a0h,002h,01eh,030h,030h,015h,000h	; a672  ..".K.......00..
	defb 006h,005h,005h,005h,001h,005h,005h,001h,005h,001h,001h,001h,001h,001h,001h,001h	; a682  ................
	defb 001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h	; a692  ................
	defb 001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,0ffh,080h,000h,080h	; a6a2  ................
	defb 020h,080h,040h,0b0h,018h,080h,050h,080h,060h,080h,070h,080h,080h,080h,090h,080h	; a6b2   .@...P.`.p.....
	defb 0a0h,080h,0b0h,080h,0c0h,080h,0d0h,080h,0e0h,080h,0f0h,090h,000h,090h,010h,090h	; a6c2  ................
	defb 020h,090h,030h,0b0h,018h,090h,040h,090h,050h,090h,060h,090h,070h,090h,080h,090h	; a6d2   .0...@.P.`.p...
	defb 090h,090h,0a0h,090h,0b0h,090h,0b0h,090h,0e0h,0a0h,020h,0a0h,030h,0a0h,040h,0a0h	; a6e2  .......... .0.@.
	defb 050h,0a0h,050h,0a0h,050h,0a0h,050h,0a0h,050h,0a0h,050h,0a0h,050h,0a0h,050h,0a0h	; a6f2  P.P.P.P.P.P.P.P.
	defb 050h,0a0h,060h,0b0h,018h,0a0h,070h,0a0h,080h,0a0h,080h,0a0h,080h,0a0h,0a0h,0a0h	; a702  P.`...p.........
	defb 090h,055h,07dh,07dh,055h,075h,055h,055h,05dh,055h,055h,055h,055h,055h,055h,055h	; a712  .U}}UuUU]UUUUUUU
	defb 055h,055h,07fh,055h,055h,02bh,090h,010h,090h,048h,081h,012h,0a0h,035h,090h,081h	; a722  UU.UU+...H...5..
	defb 081h,081h,089h,010h,090h,017h,090h,090h,0a0h,0a0h,090h,020h,090h,020h,081h,001h	; a732  ........... . ..
	defb 081h,001h,081h,001h,090h,025h,081h,090h,090h,008h,0a0h,001h,090h,040h,081h,020h	; a742  .....%.......@.
	defb 081h,001h,081h,001h,090h,023h,0e4h,001h,0b0h,001h,090h,001h,090h,04eh,0a2h,030h	; a752  .....#.......N.0
	defb 0a0h,090h,081h,020h,081h,040h,081h,001h,081h,001h,081h,001h,081h,02bh,090h,010h	; a762  ... .@.......+..
	defb 090h,048h,081h,012h,0a0h,030h,0a2h,02bh,090h,04eh,090h,025h,081h,020h,0b0h,025h	; a772  .H...0.+.N.%. .%
	defb 017h,030h,090h,001h,081h,020h,0b0h,025h,017h,030h,090h,001h,081h,020h,0b0h,025h	; a782  .0... .%.0... .%
	defb 097h,017h,090h,001h,081h,020h,0b0h,025h,097h,030h,090h,001h,081h,020h,0b0h,025h	; a792  ..... .%.0... .%
	defb 097h,030h,090h,001h,081h,020h,0b0h,025h,097h,030h,090h,001h,081h,04eh,0a2h,0c0h	; a7a2  .0... .%.0...N..
	defb 090h,0a0h,0bah,0a0h,081h,050h,090h,001h,081h,001h,081h,001h,081h,076h,090h,020h	; a7b2  .....P.......v.
	defb 081h,040h,081h,001h,0a0h	; a7c2

; ----------------------------------------------------------------------
; DATOS mosaico_A7C7: un mosaico de 2 x 3 caracteres, un byte cada uno
;   (p00:510F; BC = 0x0203 en quien llama); lo leen p01:7E7B (6 bytes)
;   0xa7c7..0xa7cd  (6 bytes)
DATA_mosaico_A7C7:
	defb 0e7h,0ech,0e8h	; a7c7
	defb 0e9h,0eah,0ebh	; a7ca

; ----------------------------------------------------------------------
; DATOS resto_A7CD: lo apuntan con el banco puesto p01:7E52 (0xA7CD), p12:7E7C
;   (0xA7EE), p12:7DFF (0xA808), p13:92E7 (0xA848), p04:8963 (0xA9ED),
;   p04:88E0 (0xAA35); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p01:7E52, p12:7E7C, p12:7DFF, p13:92E7, p04:8963,
;   p04:88E0 (1676 bytes)
;   0xa7cd..0xae59  (1676 bytes)
DATA_resto_A7CD:
	defb 003h,003h,068h,044h,003h,004h,078h,064h,003h,013h,068h,064h,004h,00bh,068h,044h	; a7cd  ..hD..xd..hd..hD
	defb 00ah,009h,048h,044h,00ah,00ah,048h,024h,00ch,006h,048h,034h,00ch,006h,088h,034h	; a7dd  ..HD..H$..H4...4
	defb 0ffh,0e0h,0f8h,0f0h,0f8h,0e1h,0f8h,0f1h,0f8h,020h,010h,0e9h,0e8h,0e9h,0f8h,0e9h	; a7ed  ......... ......
	defb 008h,0f9h,0e8h,0f9h,0f8h,0f9h,008h,009h,0e8h,009h,0f8h,009h,008h,052h,0a8h,052h	; a7fd  .............R.R
	defb 0a8h,052h,0a8h,052h,0a8h,052h,0a8h,052h,0a8h,052h,0a8h,052h,0a8h,052h,0a8h,052h	; a80d  .R.R.R.R.R.R.R.R
	defb 0a8h,0d3h,0a8h,052h,0a8h,000h,000h,000h,000h,000h,000h,075h,0a9h,096h,0a9h,054h	; a81d  ...R.......u...T
	defb 0a9h,03ch,0a8h,0b7h,0a9h,0dch,0a9h,00ch,0a9h,04dh,0a9h,04dh,0a8h,04dh,0a8h,002h	; a82d  .<.......M.M.M..
	defb 001h,0f0h,001h,0f4h,001h,0f8h,001h,0fch,001h,028h,001h,02ch,001h,030h,001h,038h	; a83d  .........(.,.0.8
	defb 002h,001h,0e8h,001h,0ech,004h,000h,040h,000h,044h,001h,048h,001h,04ch,002h,040h	; a84d  .......@.D.H.L.@
	defb 002h,044h,003h,050h,003h,054h,000h,058h,000h,05ch,001h,060h,001h,064h,002h,058h	; a85d  .D.P.T.X.\.`.d.X
	defb 002h,05ch,003h,068h,003h,06ch,000h,070h,000h,074h,001h,078h,001h,07ch,002h,070h	; a86d  .\.h.l.p.t.x.|.p
	defb 002h,074h,003h,080h,003h,084h,000h,088h,000h,08ch,001h,090h,001h,094h,002h,088h	; a87d  .t..............
	defb 002h,08ch,003h,098h,003h,09ch,000h,0a0h,000h,0a4h,001h,048h,001h,04ch,000h,0a8h	; a88d  ...........H.L..
	defb 000h,0ach,001h,048h,001h,04ch,000h,0c0h,000h,0c4h,001h,060h,001h,064h,000h,0c8h	; a89d  ...H.L.....`.d..
	defb 000h,0cch,001h,060h,001h,064h,000h,0d0h,000h,0d4h,001h,078h,001h,07ch,000h,0d8h	; a8ad  ...`.d.....x.|..
	defb 000h,0dch,001h,078h,001h,07ch,000h,0b0h,000h,0b4h,001h,090h,001h,094h,000h,0b8h	; a8bd  ...x.|..........
	defb 000h,0bch,001h,090h,001h,094h,004h,000h,040h,000h,044h,001h,048h,001h,04ch,002h	; a8cd  ........@.D.H.L.
	defb 040h,002h,044h,003h,050h,003h,054h,000h,058h,000h,05ch,001h,060h,001h,064h,002h	; a8dd  @.D.P.T.X.\.`.d.
	defb 058h,002h,05ch,003h,068h,003h,06ch,000h,070h,000h,074h,001h,078h,001h,07ch,000h	; a8ed  X.\.h.l.p.t.x.|.
	defb 080h,000h,084h,001h,078h,001h,07ch,000h,088h,000h,08ch,001h,078h,001h,07ch,002h	; a8fd  ....x.|.....x.|.
	defb 001h,040h,001h,044h,001h,048h,001h,04ch,001h,0a0h,001h,0a4h,001h,0a8h,001h,0ach	; a90d  .@.D.H.L........
	defb 001h,050h,001h,054h,001h,058h,001h,05ch,001h,0b0h,001h,0b4h,001h,0b8h,001h,0bch	; a91d  .P.T.X.\........
	defb 001h,060h,001h,064h,001h,068h,001h,06ch,001h,070h,001h,074h,001h,078h,001h,07ch	; a92d  .`.d.h.l.p.t.x.|
	defb 001h,080h,001h,084h,001h,088h,001h,08ch,001h,0c0h,001h,0c4h,001h,0c8h,001h,0cch	; a93d  ................
	defb 001h,001h,090h,001h,094h,001h,098h,002h,001h,040h,001h,044h,001h,048h,001h,04ch	; a94d  .........@.D.H.L
	defb 001h,050h,001h,054h,001h,058h,001h,05ch,001h,060h,001h,064h,001h,068h,001h,06ch	; a95d  .P.T.X.\.`.d.h.l
	defb 001h,070h,001h,074h,001h,078h,001h,07ch,002h,001h,040h,001h,044h,003h,048h,003h	; a96d  .p.t.x.|..@.D.H.
	defb 04ch,001h,050h,001h,054h,003h,058h,003h,05ch,001h,060h,001h,064h,003h,068h,003h	; a97d  L.P.T.X.\.`.d.h.
	defb 06ch,001h,0a0h,001h,0a4h,003h,0a8h,003h,0ach,002h,001h,070h,001h,074h,003h,078h	; a98d  l..........p.t.x
	defb 003h,07ch,001h,080h,001h,084h,003h,088h,003h,08ch,001h,090h,001h,094h,003h,098h	; a99d  .|..............
	defb 003h,09ch,001h,0b0h,001h,0b4h,003h,0b8h,003h,0bch,012h,006h,040h,006h,044h,009h	; a9ad  ............@.D.
	defb 048h,009h,04ch,00ch,050h,00ch,054h,005h,058h,005h,05ch,008h,060h,008h,064h,00bh	; a9bd  H.L.P.T.X.\.`.d.
	defb 068h,00bh,06ch,007h,070h,007h,074h,00ah,078h,00ah,07ch,00dh,080h,00dh,084h,002h	; a9cd  h.l.p.t.x.|.....
	defb 001h,0f0h,001h,0f4h,001h,0f8h,001h,0fch,001h,0f8h,001h,0fch,001h,0f0h,001h,0f4h	; a9dd  ................
	defb 0b8h,0ach,0adh,0aeh,08dh,082h,0afh,0b0h,0b1h,0b2h,0a6h,082h,0b3h,0b4h,0aah,0b5h	; a9ed  ................
	defb 0a4h,083h,0b6h,0b9h,0c4h,0cdh,0a5h,084h,0bah,0c5h,0cch,0c6h,092h,085h,0bbh,0a8h	; a9fd  ................
	defb 0c3h,0a7h,090h,08bh,0b7h,0bch,0c7h,0a9h,091h,086h,095h,0bdh,0c8h,0c9h,08ch,081h	; aa0d  ................
	defb 096h,0beh,0bfh,0c0h,094h,081h,081h,0c1h,0c2h,0a3h,087h,081h,081h,089h,0abh,088h	; aa1d  ................
	defb 08ah,081h,081h,081h,093h,081h,081h,081h,083h,040h,041h,003h,004h,000h,084h,00ah	; aa2d  .........@A.....
	defb 000h,00ch,042h,003h,000h,086h,063h,094h,017h,018h,098h,06bh,004h,000h,093h,076h	; aa3d  ..B...c....k...v
	defb 0a8h,017h,018h,08eh,03eh,000h,000h,001h,002h,024h,000h,000h,043h,044h,00ah,00ch	; aa4d  ....>....$..CD..
	defb 0ach,004h,003h,000h,086h,064h,0b9h,095h,000h,099h,06ch,004h,000h,092h,077h,09dh	; aa5d  .....d....l...w.
	defb 03bh,02dh,03dh,03fh,000h,000h,039h,03ah,045h,025h,026h,0adh,046h,0bch,0aeh,004h	; aa6d  .-=?..9:E%&.F...
	defb 004h,000h,086h,065h,096h,097h,000h,09ah,06dh,004h,000h,091h,078h,079h,08dh,037h	; aa7d  ...e....m...xy.7
	defb 0bbh,0bah,000h,000h,0afh,0b0h,006h,047h,048h,090h,049h,0a3h,027h,005h,000h,087h	; aa8d  .......GH.I.'...
	defb 066h,019h,00fh,000h,09bh,06eh,03ch,003h,000h,0d3h,07ah,09eh,036h,000h,08ch,087h	; aa9d  f....n<...z.6...
	defb 000h,000h,0b1h,0b2h,04ah,04bh,04ch,04dh,04eh,08fh,035h,00dh,00eh,000h,000h,067h	; aaad  ....JKLMN.5....g
	defb 068h,028h,007h,000h,09ch,06fh,029h,000h,000h,033h,07bh,09fh,030h,000h,081h,082h	; aabd  h(...o)..3{.0...
	defb 083h,000h,0b3h,0b4h,005h,04fh,050h,010h,051h,011h,0b5h,052h,053h,054h,000h,069h	; aacd  .....OP.Q..RST.i
	defb 06ah,02eh,000h,000h,008h,070h,071h,072h,00bh,07ch,07dh,02bh,000h,000h,032h,084h	; aadd  j....pqr.|}+..2.
	defb 085h,086h,055h,056h,057h,091h,0a9h,012h,058h,013h,092h,0aah,0abh,003h,000h,081h	; aaed  ..UVW...X.......
	defb 02fh,004h,000h,087h,073h,074h,075h,07eh,02ah,07fh,009h,003h,000h,08eh,031h,000h	; aafd  /...stu~*.....1.
	defb 02ch,000h,000h,059h,05ah,05bh,05ch,014h,015h,093h,0b6h,0b7h,017h,000h,088h,05dh	; ab0d  ,..YZ[\........]
	defb 016h,05eh,05fh,060h,0a2h,061h,062h,01ah,000h,084h,017h,0c0h,0c1h,018h,01dh,000h	; ab1d  .^_`.ab.........
	defb 082h,0a0h,0b8h,01eh,000h,082h,0a1h,034h,01eh,000h,082h,0bdh,0ffh,000h,055h,0abh	; ab2d  .......4......U.
	defb 055h,0abh,04dh,0abh,068h,0abh,06eh,0abh,055h,0abh,077h,0abh,084h,0abh,055h,0abh	; ab3d  U.M.h.n.U.w...U.
	defb 006h,000h,006h,000h,006h,000h,006h,000h,000h,001h,000h,001h,000h,001h,000h,001h	; ab4d  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,002h,002h,000h,003h,003h,003h,003h,003h	; ab5d  ................
	defb 003h,007h,00fh,010h,011h,008h,009h,00ah,00bh,012h,000h,001h,000h,001h,000h,001h	; ab6d  ................
	defb 000h,001h,000h,000h,00ch,00dh,000h,000h,001h,000h,001h,000h,001h,000h,001h,000h	; ab7d  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,00eh	; ab8d  ................
	defb 000h,000h,0e1h,0f8h,0f1h,0f8h,0e2h,0f8h,0f2h,0f8h,0f1h,0f0h,0f8h,000h,0f1h,0f0h	; ab9d  ................
	defb 0f1h,000h,0e1h,0fah,0f1h,0f8h,0e1h,0f6h,0f1h,0f8h,0e3h,0f8h,0f3h,0f8h,0f1h,0f8h	; abad  ................
	defb 0e1h,0f8h,0f1h,0f8h,0f1h,0e8h,0f1h,0f8h,0f1h,008h,0f1h,0f8h,0f9h,0e8h,0f1h,0f8h	; abbd  ................
	defb 0f9h,008h,0e1h,0f5h,0f1h,0f8h,0e1h,0fbh,0f1h,0f8h,0e8h,0f8h,0e8h,0f8h,0f1h,0f8h	; abcd  ................
	defb 001h,0f8h,0f1h,0f8h,0f1h,0f0h,0f1h,0f8h,0f1h,000h,0f8h,0f8h,008h,0f8h,031h,0ach	; abdd  ..............1.
	defb 057h,0ach,009h,0ach,0fdh,0abh,0b1h,0ach,019h,0ach,0c3h,0ach,081h,0ach,069h,0ach	; abed  W.............i.
	defb 040h,048h,050h,058h,060h,068h,070h,078h,098h,090h,0a8h,0a0h,040h,048h,050h,058h	; abfd  @HPX`hpx....@HPX
	defb 060h,068h,070h,078h,080h,088h,090h,098h,0a0h,0a8h,0b0h,0b8h,040h,048h,040h,050h	; ac0d  `hpx........@H@P
	defb 058h,060h,058h,068h,070h,078h,070h,080h,0b8h,0c0h,0b8h,0c8h,088h,090h,098h,0a0h	; ac1d  X`Xhpxp.........
	defb 0a8h,0b0h,0d0h,0d8h,040h,048h,040h,050h,060h,068h,060h,070h,080h,088h,080h,090h	; ac2d  ....@H@P`h`p....
	defb 0d0h,0d8h,0d0h,0e0h,040h,048h,058h,048h,060h,068h,078h,068h,080h,090h,098h,090h	; ac3d  ....@HXH`hxh....
	defb 0d0h,0e0h,0e8h,0e0h,0a0h,0b0h,0a8h,0b0h,0c0h,0c8h,040h,048h,040h,050h,040h,048h	; ac4d  ..........@H@P@H
	defb 040h,050h,058h,060h,058h,068h,058h,060h,058h,068h,070h,078h,040h,048h,040h,050h	; ac5d  @PX`XhX`Xhpx@H@P
	defb 060h,068h,060h,070h,080h,088h,080h,090h,0a0h,0a8h,0a0h,0b0h,058h,048h,078h,068h	; ac6d  `h`p........XHxh
	defb 098h,088h,0b8h,0a8h,040h,048h,040h,050h,068h,070h,068h,078h,090h,098h,090h,0a0h	; ac7d  ....@H@Phphx....
	defb 0b8h,0c0h,0b8h,0c8h,058h,048h,060h,048h,080h,070h,088h,070h,0a8h,098h,0b0h,098h	; ac8d  ....XH`H.p.p....
	defb 0d0h,0c0h,0d8h,0c0h,040h,048h,050h,058h,060h,068h,070h,078h,090h,098h,0a0h,0a8h	; ac9d  ....@HPX`hpx....
	defb 0b8h,0b0h,0c8h,0c0h,040h,068h,060h,088h,050h,078h,098h,0b0h,048h,070h,090h,0a8h	; acad  ....@h`.Px..Hp..
	defb 058h,080h,0a0h,0b8h,060h,088h,040h,048h,040h,050h,060h,068h,060h,070h,080h,088h	; acbd  X...`.@H@P`h`p..
	defb 080h,090h,0b0h,0b8h,0b0h,0c0h,058h,050h,078h,070h,098h,090h,0c8h,0c0h,0a0h,0a8h	; accd  ......XPxp......
	defb 0c0h,0c0h,0c8h,0d0h,0d8h,0e0h,0f9h,0ach,0f9h,0ach,0f9h,0ach,014h,0adh,03ch,0adh	; acdd  ..............<.
	defb 055h,0adh,075h,0adh,089h,0adh,0a3h,0adh,0bdh,0adh,005h,0aeh,005h,005h,081h,00bh	; aced  U.u.............
	defb 007h,005h,002h,00bh,081h,005h,008h,04eh,005h,04bh,002h,04ch,081h,04eh,008h,005h	; acfd  .......N.K.L.N..
	defb 008h,003h,008h,04eh,008h,04ch,000h,085h,00dh,007h,007h,00dh,00bh,004h,007h,004h	; ad0d  ...N.L..........
	defb 00dh,002h,003h,086h,00dh,04eh,048h,048h,04eh,04ch,004h,048h,004h,04eh,002h,04ch	; ad1d  .....NHHNL.H.N.L
	defb 081h,04eh,008h,00dh,002h,007h,006h,003h,008h,04eh,002h,048h,006h,04ch,000h,002h	; ad2d  .N.......N.H.L..
	defb 00dh,005h,00bh,002h,00dh,083h,003h,00bh,00bh,004h,00ch,00ch,04eh,004h,043h,008h	; ad3d  ............N.C.
	defb 003h,008h,00dh,007h,04ch,009h,04eh,000h,082h,00dh,003h,004h,00dh,00ah,00bh,00bh	; ad4d  ....L.N.........
	defb 04eh,005h,04ch,082h,00dh,003h,004h,00dh,00ah,00bh,00bh,04eh,005h,04ch,000h,010h	; ad5d  N.L........N.L..
	defb 003h,010h,04ch,010h,003h,010h,04ch,000h,006h,00dh,082h,003h,00bh,003h,00dh,005h	; ad6d  ..L...L.........
	defb 00bh,005h,04eh,081h,04ah,00ah,04eh,010h,007h,010h,049h,000h,085h,007h,00bh,007h	; ad7d  ..N.J.N...I.....
	defb 007h,00bh,00bh,007h,086h,048h,04ch,04bh,04ch,04ch,04bh,00ah,048h,00ah,007h,006h	; ad8d  .....HLKLLK.H...
	defb 003h,00ah,048h,006h,04ch,000h,081h,00dh,003h,00bh,081h,00dh,008h,00bh,003h,003h	; ad9d  ..H.L...........
	defb 081h,04eh,003h,04ch,082h,04ah,04ch,007h,04eh,003h,04ch,010h,003h,010h,04ch,000h	; adad  .N.L.JL.N.L...L.
	defb 081h,00dh,003h,007h,002h,00bh,081h,003h,003h,00dh,087h,00bh,00bh,007h,003h,003h	; adbd  ................
	defb 00dh,04eh,003h,04ah,002h,04ch,006h,04eh,002h,04ch,002h,04eh,009h,00dh,007h,003h	; adcd  .N.J.L.N.L.N....
	defb 009h,04eh,007h,04ch,000h,0eah,0adh,0f3h,0adh,0eah,0adh,0fch,0adh,010h,00ah,010h	; addd  .N.L............
	defb 00fh,010h,00ah,010h,00fh,000h,010h,002h,010h,00fh,010h,002h,010h,00fh,000h,010h	; aded  ................
	defb 009h,010h,00fh,010h,009h,010h,00fh,000h,004h,007h,081h,00bh,008h,007h,084h,003h	; adfd  ................
	defb 007h,007h,048h,003h,049h,081h,04ch,007h,04bh,002h,04ch,002h,048h,009h,007h,007h	; ae0d  ..H.I.L.K.L.H...
	defb 003h,009h,048h,007h,04ch,000h,010h,00ah,010h,00bh,010h,00ah,010h,00bh,000h,010h	; ae1d  ..H.L...........
	defb 003h,010h,00ch,010h,003h,010h,00ch,000h,040h,007h,000h,040h,00ah,000h,065h,019h	; ae2d  ........@..@..e.
	defb 01ch,01ch,06ch,055h,01ah,01bh,01bh,06dh,080h,080h,080h,05ah,080h,080h,080h,080h	; ae3d  ..lU...m...Z....
	defb 080h,080h,05bh,05ch,080h,080h,064h,069h,020h,01fh,01fh,06dh	; ae4d  ..[\..di ..m

; ----------------------------------------------------------------------
; DATOS mosaico_AE59: un mosaico de 5 x 12 caracteres, un byte cada uno
;   (p00:510F; BC = 0x050C en quien llama); lo leen p02:8572 (60 bytes)
;   0xae59..0xae95  (60 bytes)
DATA_mosaico_AE59:
	defb 000h,000h,065h,096h,097h,0a1h,034h,037h,0bbh,0bah,000h,000h	; ae59  ..e...47....
	defb 000h,000h,066h,019h,00fh,0bdh,000h,000h,08ch,087h,000h,000h	; ae65  ..f.........
	defb 000h,067h,068h,028h,007h,000h,000h,000h,081h,082h,083h,000h	; ae71  .gh(........
	defb 000h,069h,06ah,02eh,000h,000h,000h,000h,032h,084h,085h,086h	; ae7d  .ij.....2...
	defb 000h,000h,02fh,000h,000h,000h,000h,000h,000h,031h,000h,02ch	; ae89  ../......1.,

; ----------------------------------------------------------------------
; DATOS resto_AE95: lo apuntan con el banco puesto p13:92D7 (0xAE95), p13:9317
;   (0xAEA5), p13:92F0 (0xAEE6), p13:92FC (0xAF4E), p13:9308 (0xAFB6),
;   p00:4151 (0xB000); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p13:92D7, p13:9317, p13:92F0, p13:92FC, p13:9308,
;   p00:4151 (3731 bytes)
;   0xae95..0xbd28  (3731 bytes)
DATA_resto_AE95:
	defb 000h,000h,000h,001h,070h,003h,002h,060h,001h,003h,044h,004h,00fh,077h,007h,0ffh	; ae95  ....p..`..D..w..
	defb 001h,002h,003h,0feh,0f8h,004h,005h,006h,007h,0feh,0f0h,008h,009h,00ah,00bh,00eh	; aea5  ................
	defb 00fh,010h,011h,01bh,01ch,01dh,01eh,01fh,020h,021h,022h,023h,024h,025h,026h,0feh	; aeb5  ........ !"#$%&.
	defb 000h,00ch,002h,00dh,012h,013h,014h,015h,027h,028h,029h,02ah,02bh,02ch,02dh,02eh	; aec5  ........'()*+,-.
	defb 02fh,030h,031h,032h,033h,034h,0feh,010h,016h,019h,017h,0feh,0f8h,018h,019h,01ah	; aed5  /01234..........
	defb 0ffh,007h,007h,00fh,00fh,00fh,01fh,01fh,03fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; aee5  ........?.......
	defb 0ffh,0f8h,0f8h,0f0h,0f0h,0f0h,0e0h,0e0h,0e0h,000h,000h,000h,000h,001h,003h,00fh	; aef5  ................
	defb 07fh,03fh,07fh,07fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fch,0f0h	; af05  .?..............
	defb 0c0h,0c0h,0c0h,080h,080h,000h,000h,000h,000h,000h,000h,000h,001h,003h,007h,00fh	; af15  ................
	defb 00fh,00fh,03fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0feh,0fch,0f8h,0f8h	; af25  ..?.............
	defb 0f0h,0f8h,0c0h,000h,000h,000h,000h,000h,000h,01fh,01fh,01fh,03fh,03fh,03fh,07fh	; af35  ............???.
	defb 07fh,0f0h,0e0h,0e0h,0c0h,0c0h,0c0h,080h,080h,000h,000h,000h,000h,000h,001h,001h	; af45  ................
	defb 003h,07fh,07fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0feh,0feh	; af55  ................
	defb 0fch,080h,080h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; af65  ................
	defb 007h,003h,007h,007h,00fh,01fh,03fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; af75  ......?.........
	defb 0f8h,0fch,0f8h,0f8h,0f0h,0e0h,0c0h,000h,000h,000h,003h,00fh,01fh,03fh,07fh,0ffh	; af85  .............?..
	defb 0ffh,0ffh,0fch,0f0h,0e0h,0c0h,080h,080h,000h,001h,001h,001h,003h,003h,003h,007h	; af95  ................
	defb 007h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0feh,0feh,0fch,0fch,0fch,0f8h	; afa5  ................
	defb 0f8h,03ch,03ch,078h,078h,079h,0f3h,0f7h,0ffh,01fh,03eh,07ch,0f9h,0f3h,0e3h,0c3h	; afb5  .<<xxy....>|....
	defb 087h,01fh,07fh,0f8h,0f0h,0e0h,0e0h,0c0h,0c0h,0c0h,0f0h,0f8h,078h,078h,079h,079h	; afc5  ............xxyy
	defb 079h,07fh,07fh,0ffh,0f7h,0f7h,0e7h,0e7h,0e7h,00fh,00fh,01eh,01eh,01eh,03ch,03ch	; afd5  y.............<<
	defb 03ch,003h,007h,00fh,00eh,01eh,03ch,038h,078h,0e0h,0e0h,0e0h,0e0h,0e0h,0e1h,0e1h	; afe5  <.....<8x.......
	defb 0e1h,07eh,07eh,0feh,0f6h,0f6h,0eeh,0eeh,0eeh,00fh,00fh,01fh,01dh,03dh,03bh,07bh	; aff5  .~~..........=.{
	defb 073h,0f1h,0f1h,0e3h,0e3h,0e3h,0c7h,0c7h,0c7h,0e0h,0e0h,0c0h,0c0h,0c0h,080h,080h	; b005  s...............
	defb 080h,001h,001h,001h,003h,003h,003h,007h,007h,0efh,0e7h,0e7h,0c7h,0c7h,0c3h,083h	; b015  ................
	defb 083h,087h,087h,087h,0c7h,0c7h,0c7h,0e3h,0e0h,080h,080h,081h,081h,083h,0c7h,0ffh	; b025  ................
	defb 0feh,0fbh,0f3h,0f3h,0f7h,0e7h,0c7h,08fh,00fh,0c7h,0c7h,0c7h,087h,087h,087h,007h	; b035  ................
	defb 007h,078h,078h,079h,0f1h,0f3h,0f7h,0e7h,0efh,070h,0f0h,0ffh,0ffh,0ffh,080h,080h	; b045  .xxy.....p......
	defb 000h,0e3h,0e3h,0e3h,0e7h,0e7h,0e7h,0efh,0efh,0ceh,0ceh,0cfh,08fh,08fh,08fh,00fh	; b055  ................
	defb 00fh,0f7h,0e7h,0c7h,0cfh,08fh,08fh,01eh,01eh,08fh,08fh,08fh,01eh,01eh,01eh,03ch	; b065  ...............<
	defb 03ch,007h,008h,017h,014h,017h,014h,008h,007h,080h,040h,020h,0a0h,020h,0a0h,040h	; b075  <.........@ . .@
	defb 080h,0beh,0b0h,0f1h,0b0h,03dh,0b1h,057h,0b1h,08fh,0b1h,0efh,0b1h,022h,0b2h,03ch	; b085  .....=.W.....".<
	defb 0b2h,060h,0b2h,070h,0b2h,08ah,0b2h,0b8h,0b2h,0cdh,0b2h,0ech,0b2h,0f0h,0b0h,00bh	; b095  .`.p............
	defb 0b3h,0f0h,0b0h,0f0h,0b0h,016h,0b3h,0f0h,0b0h,001h,040h,048h,000h,0c0h,001h,040h	; b0a5  ..........@H...@
	defb 078h,000h,0c0h,001h,070h,060h,000h,0c0h,0ffh,001h,0adh,02bh,038h,000h,001h,029h	; b0b5  x...p`.....+8..)
	defb 02bh,026h,001h,001h,012h,016h,036h,082h,001h,029h,06ch,038h,043h,001h,033h,08ah	; b0c5  +&....6..)l8C.3.
	defb 037h,004h,001h,052h,08ch,048h,085h,001h,079h,0a6h,047h,046h,001h,061h,034h,047h	; b0d5  7..R.H..y.GF.a4G
	defb 007h,001h,0abh,0a3h,046h,088h,001h,0a5h,043h,046h,009h,0ffh,001h,079h,059h,017h	; b0e5  ....F...CF...yY.
	defb 080h,001h,020h,09dh,016h,001h,001h,05dh,0a9h,025h,082h,001h,05dh,0aah,045h,083h	; b0f5  .. ....].%..].E.
	defb 001h,0b5h,096h,028h,084h,001h,06fh,070h,026h,085h,001h,059h,091h,048h,047h,001h	; b105  ...(..op&..Y.HG.
	defb 078h,050h,038h,048h,001h,05fh,093h,046h,009h,001h,02ch,08fh,047h,00ah,001h,047h	; b115  xP8H._.F..,.G..G
	defb 08ch,059h,00bh,002h,030h,090h,056h,04fh,015h,000h,000h,000h,000h,015h,000h,000h	; b125  .Y..0.VO........
	defb 000h,001h,00ch,070h,010h,039h,000h,0ffh,001h,081h,08bh,028h,040h,001h,070h,052h	; b135  ...p.9.....(@.pR
	defb 026h,041h,001h,087h,02ch,046h,042h,001h,04ah,06ah,048h,043h,001h,04ch,04ah,046h	; b145  &A..,FB.JjHC.LJF
	defb 084h,0ffh,001h,030h,031h,035h,080h,001h,07ch,08eh,025h,041h,001h,03dh,030h,036h	; b155  ...015..|.%A.=06
	defb 082h,001h,04bh,0a9h,056h,003h,001h,050h,06eh,039h,007h,001h,070h,070h,039h,008h	; b165  ..K.V..Pn9..pp9.
	defb 001h,090h,070h,039h,009h,004h,0b0h,070h,017h,045h,005h,030h,0b0h,049h,046h,015h	; b175  ..p9...p.E.0.IF.
	defb 000h,000h,000h,040h,015h,000h,000h,000h,001h,0ffh,001h,08bh,013h,035h,080h,001h	; b185  ...@.........5..
	defb 046h,0adh,036h,002h,001h,0aeh,00fh,047h,043h,008h,08eh,02eh,017h,084h,009h,034h	; b195  F.6....GC......4
	defb 08eh,028h,085h,001h,07dh,036h,028h,006h,011h,0b4h,0a6h,025h,00bh,006h,0b0h,010h	; b1a5  .(..}6(....%....
	defb 057h,007h,015h,000h,000h,000h,000h,015h,000h,000h,000h,001h,00ah,017h,04ch,038h	; b1b5  W.............L8
	defb 000h,00ah,077h,04ch,038h,000h,00ah,077h,074h,038h,000h,00ah,017h,04ch,039h,000h	; b1c5  ..wL8..wt8...L9.
	defb 00ah,017h,08ch,039h,000h,00ah,077h,04ch,039h,000h,00ah,037h,04ch,048h,000h,00ah	; b1d5  ...9..wL9..7LH..
	defb 037h,074h,048h,000h,00ah,0a7h,074h,048h,000h,0ffh,001h,036h,030h,046h,000h,001h	; b1e5  7tH...tH...60F..
	defb 029h,010h,027h,041h,001h,02eh,08dh,047h,004h,001h,0ach,012h,028h,045h,001h,08fh	; b1f5  ).'A...G....(E..
	defb 050h,038h,087h,001h,096h,0aeh,048h,088h,001h,031h,011h,048h,089h,015h,000h,000h	; b205  P8....H..1.H....
	defb 000h,000h,015h,000h,000h,000h,001h,015h,000h,000h,000h,002h,0ffh,010h,02ch,015h	; b215  ..............,.
	defb 027h,040h,010h,06fh,04eh,047h,041h,010h,04dh,05dh,0b6h,042h,011h,029h,0ach,0c7h	; b225  '@.oNGA.M].B.)..
	defb 003h,010h,029h,04ch,0b9h,004h,0ffh,010h,04ah,020h,028h,005h,010h,08dh,0a1h,019h	; b235  ..)L....J (.....
	defb 006h,001h,033h,0b3h,029h,040h,001h,038h,0aah,057h,041h,001h,075h,016h,057h,042h	; b245  ..3.)@.8.WA.u.WB
	defb 001h,0a7h,088h,067h,043h,001h,01dh,03dh,067h,044h,0ffh,014h,080h,060h,056h,000h	; b255  ...gC..=gD...`V.
	defb 014h,020h,020h,036h,001h,014h,020h,060h,037h,002h,0ffh,001h,09ch,015h,016h,040h	; b265  .  6.. `7......@
	defb 001h,057h,0a7h,016h,001h,001h,057h,035h,018h,002h,001h,05dh,0a7h,018h,043h,001h	; b275  .W....W5...]..C.
	defb 054h,069h,018h,004h,0ffh,001h,07bh,09ah,037h,040h,001h,07ch,023h,037h,041h,001h	; b285  Ti....{.7@.|#7A.
	defb 05fh,017h,068h,084h,001h,073h,06fh,05ah,046h,001h,0b4h,04fh,06ah,007h,001h,079h	; b295  _.h..soZF..Oj..y
	defb 00dh,069h,008h,001h,02ch,051h,069h,049h,001h,020h,08fh,064h,04ah,007h,058h,050h	; b2a5  .i..,QiI. .dJ.XP
	defb 049h,04eh,0ffh,001h,03ah,064h,028h,040h,001h,067h,08fh,048h,081h,001h,02ch,03eh	; b2b5  IN..:d(@.g.H..,>
	defb 047h,082h,001h,05bh,040h,046h,083h,0ffh,010h,0aah,0a9h,038h,047h,010h,054h,010h	; b2c5  G..[@F.....8G.T.
	defb 037h,088h,010h,0aeh,0ach,048h,089h,010h,054h,010h,047h,04ah,001h,030h,050h,036h	; b2d5  7....H..T.GJ.0P6
	defb 0c0h,001h,050h,050h,036h,0c0h,0ffh,001h,0adh,070h,037h,000h,001h,0a8h,051h,057h	; b2e5  ..PP6....p7...QW
	defb 041h,001h,089h,00ch,057h,082h,001h,080h,06ch,048h,043h,015h,000h,000h,000h,040h	; b2f5  A...W...lHC....@
	defb 015h,000h,000h,000h,041h,0ffh,016h,000h,000h,046h,000h,017h,000h,000h,046h,000h	; b305  ....A....F....F.
	defb 0ffh,00ch,040h,070h,077h,000h,00ch,050h,040h,077h,000h,00ch,050h,0a0h,077h,000h	; b315  ..@pw..P@w..P.w.
	defb 0ffh,002h,060h,0b3h,009h,06bh,0b3h,00fh,071h,0b3h,010h,07ch,0b3h,013h,082h,0b3h	; b325  ..`..k..q..|....
	defb 014h,088h,0b3h,015h,093h,0b3h,026h,099h,0b3h,029h,09fh,0b3h,02bh,0aah,0b3h,02dh	; b335  ......&..)..+..-
	defb 0b0h,0b3h,02eh,0b6h,0b3h,02fh,0c1h,0b3h,030h,0cch,0b3h,031h,0dch,0b3h,032h,0e7h	; b345  ...../..0..1..2.
	defb 0b3h,036h,0edh,0b3h,037h,0f3h,0b3h,039h,0f9h,0b3h,0ffh,001h,06ah,01bh,017h,00dh	; b355  .6..7..9....j...
	defb 001h,06dh,0aah,017h,00eh,0ffh,011h,060h,060h,017h,010h,0ffh,010h,060h,040h,017h	; b365  .m.....``....`@.
	defb 011h,010h,060h,090h,017h,012h,0ffh,011h,060h,060h,017h,013h,0ffh,011h,070h,060h	; b375  ..`.....``....p`
	defb 017h,014h,0ffh,011h,080h,040h,017h,015h,010h,080h,080h,017h,016h,0ffh,011h,060h	; b385  .....@.........`
	defb 05ch,017h,017h,0ffh,011h,060h,060h,016h,018h,0ffh,010h,060h,040h,018h,019h,011h	; b395  \....``....`@...
	defb 080h,090h,018h,01ah,0ffh,010h,060h,060h,017h,01bh,0ffh,014h,080h,060h,027h,003h	; b3a5  ......``.....`'.
	defb 0ffh,001h,030h,020h,017h,04ch,001h,050h,0b0h,017h,04dh,0ffh,010h,059h,040h,017h	; b3b5  ..0 .L.P..M..Y@.
	defb 01ch,010h,080h,080h,017h,01dh,0ffh,010h,059h,035h,017h,01eh,011h,080h,050h,017h	; b3c5  ........Y5....P.
	defb 01fh,011h,060h,080h,017h,020h,0ffh,015h,000h,000h,000h,000h,015h,000h,000h,000h	; b3d5  ..`.. ..........
	defb 001h,0ffh,001h,079h,088h,017h,004h,0ffh,010h,060h,060h,017h,021h,0ffh,010h,060h	; b3e5  ...y.....``.!..`
	defb 060h,017h,022h,0ffh,012h,038h,048h,027h,000h,012h,038h,060h,027h,001h,012h,040h	; b3f5  `."..8H'..8`'..@
	defb 068h,027h,002h,012h,050h,040h,027h,003h,012h,050h,078h,027h,004h,012h,060h,058h	; b405  h'..P@'..Px'..`X
	defb 027h,005h,012h,068h,040h,027h,006h,012h,068h,078h,027h,007h,012h,078h,048h,027h	; b415  '..h@'..hx'..xH'
	defb 008h,012h,078h,060h,027h,009h,012h,080h,070h,027h,00ah,0ffh,026h,080h,040h,026h	; b425  ..x`'...p'..&.@&
	defb 090h,070h,026h,0a0h,090h,026h,090h,0a0h,027h,0a0h,040h,027h,090h,070h,027h,080h	; b435  .p&..&..'.@'.p'.
	defb 0a0h,038h,030h,030h,038h,050h,030h,038h,070h,030h,038h,090h,030h,038h,020h,070h	; b445  .8008P08p08.08 p
	defb 038h,040h,070h,038h,060h,070h,038h,080h,070h,0b5h,048h,018h,0b5h,048h,028h,0b5h	; b455  8@p8`p8.p.H..H(.
	defb 048h,038h,0b6h,080h,020h,0b6h,080h,030h,0b6h,080h,040h,0b7h,0a8h,020h,0b7h,0a8h	; b465  H8.. ..0..@.. ..
	defb 030h,0b7h,0a8h,040h,0b8h,0b8h,030h,0b8h,0b8h,040h,0b8h,0b8h,050h,0c5h,060h,050h	; b475  0..@..0..@..P.`P
	defb 0c5h,070h,050h,0c5h,080h,050h,0c5h,090h,050h,0c5h,0a0h,050h,0ffh,0e7h,077h,000h	; b485  .pP..P..P..P..w.
	defb 000h,0eeh,0eeh,0eeh,0eeh,0eeh,0e7h,077h,000h,000h,0eeh,0eeh,0eeh,0eeh,0eeh,0e7h	; b495  .......w........
	defb 077h,000h,000h,077h,077h,077h,077h,07eh,0e7h,077h,000h,000h,077h,077h,077h,077h	; b4a5  w..wwww~.w..wwww
	defb 07eh,0e7h,077h,000h,000h,077h,077h,077h,077h,07eh,0e7h,077h,000h,000h,007h,077h	; b4b5  ~.w..wwww~.w...w
	defb 077h,077h,07eh,0e7h,077h,000h,000h,000h,000h,000h,000h,00eh,0e7h,077h,070h,000h	; b4c5  ww~.w........wp.
	defb 000h,000h,000h,000h,00eh,0e7h,077h,077h,000h,000h,000h,000h,000h,00eh,0e7h,077h	; b4d5  ......ww.......w
	defb 077h,000h,000h,000h,000h,000h,00eh,0e7h,077h,077h,000h,000h,000h,000h,000h,00eh	; b4e5  w.......ww......
	defb 0e7h,077h,077h,077h,077h,077h,077h,077h,07eh,0e7h,077h,077h,077h,077h,077h,077h	; b4f5  .wwwwwww~.wwwwww
	defb 077h,07eh,0e7h,077h,077h,077h,077h,077h,077h,077h,07eh,0e7h,070h,000h,077h,070h	; b505  w~.wwwwwww~.p.wp
	defb 000h,077h,077h,07eh,0e7h,070h,000h,077h,070h,000h,077h,077h,07eh,0e7h,070h,000h	; b515  .ww~.p.wp.ww~.p.
	defb 077h,070h,000h,077h,077h,07eh,0e7h,070h,000h,077h,070h,000h,077h,077h,07eh,0e7h	; b525  wp.ww~.p.wp.ww~.
	defb 070h,000h,077h,070h,000h,077h,077h,07eh,0e7h,070h,000h,077h,070h,000h,077h,077h	; b535  p.wp.ww~.p.wp.ww
	defb 07eh,0e7h,070h,000h,077h,070h,000h,077h,077h,07eh,0e7h,070h,000h,077h,070h,000h	; b545  ~.p.wp.ww~.p.wp.
	defb 077h,077h,07eh,0e7h,070h,000h,077h,070h,000h,077h,077h,07eh,0e0h,000h,000h,077h	; b555  ww~.p.wp.ww~...w
	defb 070h,000h,077h,077h,07eh,0e0h,000h,000h,077h,070h,000h,077h,077h,07eh,0e0h,000h	; b565  p.ww~...wp.ww~..
	defb 000h,077h,070h,000h,077h,077h,07eh,0e0h,000h,000h,000h,000h,000h,000h,000h,00eh	; b575  .wp.ww~.........
	defb 0e0h,000h,000h,000h,000h,000h,000h,000h,00eh,0eeh,0eeh,0eeh,0eeh,0eeh,0eeh,0eeh	; b585  ................
	defb 0eeh,0eeh,0eeh,0eeh,0eeh,0eeh,0eeh,0eeh,0eeh,0eeh,0eeh,0eeh,0eeh,0eeh,0eeh,0eeh	; b595  ................
	defb 0eeh,0eeh,0eeh,0eeh,0eeh,0eeh,0eeh,0eeh,0eeh,0eeh,0eeh,0eeh,0eeh,0eeh,0eeh,0eeh	; b5a5  ................
	defb 0eeh,0eeh,0eeh,0eeh,0eeh,0eeh,0eeh,0eeh,0eeh,0eeh,0eeh,0eeh,0eeh,0eeh,0eeh,0e0h	; b5b5  ................
	defb 000h,000h,000h,000h,00eh,0eeh,0eeh,0eeh,0e0h,000h,000h,000h,000h,07eh,0eeh,0eeh	; b5c5  .............~..
	defb 0eeh,0e0h,000h,000h,000h,000h,00eh,0eeh,0eeh,0eeh,0e0h,000h,000h,000h,000h,00eh	; b5d5  ................
	defb 0eeh,0eeh,0eeh,0e7h,000h,000h,000h,000h,07eh,0eeh,0eeh,0eeh,0e0h,000h,000h,000h	; b5e5  ........~.......
	defb 000h,00eh,0eeh,0eeh,0eeh,0e0h,000h,000h,000h,000h,00eh,0eeh,0eeh,0eeh,0e7h,000h	; b5f5  ................
	defb 000h,000h,000h,07eh,0eeh,0eeh,0eeh,0e7h,000h,000h,000h,000h,07eh,0eeh,0eeh,0eeh	; b605  ...~........~...
	defb 0e0h,000h,000h,000h,000h,00eh,0eeh,0eeh,0eeh,0e0h,000h,000h,000h,000h,00eh,0eeh	; b615  ................
	defb 0eeh,0eeh,0e7h,000h,000h,000h,000h,07eh,0eeh,0eeh,0eeh,0e0h,000h,000h,000h,000h	; b625  .......~........
	defb 00eh,0eeh,0eeh,0eeh,0e0h,000h,000h,000h,000h,00eh,0eeh,0eeh,0eeh,0e7h,000h,000h	; b635  ................
	defb 000h,000h,07eh,0eeh,0eeh,0eeh,0e0h,000h,000h,000h,000h,00eh,0eeh,0eeh,0eeh,0e0h	; b645  ..~.............
	defb 000h,000h,000h,000h,00eh,0eeh,0eeh,0eeh,0e7h,000h,000h,000h,000h,07eh,0eeh,0eeh	; b655  .............~..
	defb 0eeh,0e0h,000h,000h,000h,000h,00eh,0eeh,0eeh,0eeh,0e0h,000h,000h,000h,000h,00eh	; b665  ................
	defb 0eeh,0eeh,0eeh,0e7h,000h,000h,000h,000h,07eh,0eeh,0eeh,0eeh,0e0h,000h,000h,000h	; b675  ........~.......
	defb 000h,00eh,0eeh,0eeh,0eeh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; b685  ................
	defb 000h,003h,000h,000h,000h,001h,002h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; b695  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,002h,000h,000h,000h,000h,001h	; b6a5  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0e8h,0e9h,0eah,0ebh	; b6b5  ................
	defb 0e0h,0e1h,0e2h,0e3h,0ech,0edh,0eeh,0efh,0e4h,0e5h,0e6h,0e7h,068h,069h,06ah,06bh	; b6c5  ............hijk
	defb 060h,061h,062h,063h,06ch,06dh,06eh,06fh,064h,065h,066h,067h,000h,002h,001h,002h	; b6d5  `abclmnodefg....
	defb 002h,006h,003h,004h,000h,006h,002h,002h,008h,002h,001h,006h,006h,002h,007h,002h	; b6e5  ................
	defb 002h,002h,001h,006h,004h,002h,005h,002h,003h,002h,004h,006h,078h,018h,09ch,048h	; b6f5  ............x..H
	defb 09ch,058h,0ach,088h,040h,088h,060h,098h,080h,048h,080h,068h,080h,088h,0a0h,038h	; b705  .X..@.`..H.h...8
	defb 0a0h,058h,0a0h,078h,0a0h,098h,040h,028h,040h,048h,040h,068h,060h,038h,060h,058h	; b715  .X.x..@(@H@h`8`X
	defb 060h,078h,080h,028h,070h,008h,090h,008h,050h,068h,070h,068h,090h,068h,008h,008h	; b725  `x.(p...Phph.h..
	defb 028h,008h,048h,008h,068h,008h,088h,008h,008h,068h,028h,068h,048h,068h,068h,068h	; b735  (.H.h....h(hHhhh
	defb 088h,068h,097h,0b7h,09ch,0b7h,0adh,0b7h,0b0h,0b7h,0c6h,0b7h,0e0h,0b7h,0e7h,0b7h	; b745  .h..............
	defb 0f2h,0b7h,0fah,0b7h,0fdh,0b7h,002h,0b8h,00dh,0b8h,010h,0b8h,015h,0b8h,01ch,0b8h	; b755  ................
	defb 021h,0b8h,026h,0b8h,029h,0b8h,02ch,0b8h,037h,0b8h,040h,0b8h,048h,0b8h,050h,0b8h	; b765  !.&.).,.7.@.H.P.
	defb 052h,0b8h,05eh,0b8h,06ch,0b8h,070h,0b8h,076h,0b8h,07ch,0b8h,07eh,0b8h,082h,0b8h	; b775  R.^.l.p.v.|.~...
	defb 088h,0b8h,08ah,0b8h,08ah,0b8h,08ah,0b8h,08ah,0b8h,08ah,0b8h,076h,0b8h,094h,0b8h	; b785  ............v...
	defb 09ah,0b8h,00ah,000h,003h,001h,000h,004h,000h,081h,002h,004h,000h,083h,002h,000h	; b795  ................
	defb 003h,002h,000h,081h,002h,008h,000h,000h,009h,000h,000h,003h,003h,092h,002h,002h	; b7a5  ................
	defb 003h,004h,003h,002h,002h,005h,002h,002h,001h,001h,002h,002h,001h,001h,002h,002h	; b7b5  ................
	defb 000h,002h,000h,003h,001h,002h,000h,002h,001h,081h,002h,002h,003h,083h,006h,005h	; b7c5  ................
	defb 004h,003h,003h,082h,005h,004h,002h,003h,002h,005h,000h,004h,000h,081h,001h,004h	; b7d5  ................
	defb 000h,000h,007h,000h,081h,002h,008h,000h,081h,001h,011h,000h,000h,00bh,000h,082h	; b7e5  ................
	defb 001h,000h,008h,001h,000h,010h,000h,000h,003h,000h,002h,001h,000h,00bh,001h,002h	; b7f5  ................
	defb 000h,003h,002h,002h,000h,007h,002h,000h,009h,000h,000h,004h,000h,005h,001h,000h	; b805  ................
	defb 081h,000h,004h,003h,002h,000h,000h,004h,000h,002h,004h,000h,081h,000h,004h,002h	; b815  ................
	defb 000h,004h,000h,000h,006h,000h,000h,005h,000h,003h,001h,081h,002h,003h,001h,008h	; b825  ................
	defb 000h,000h,005h,000h,001h,001h,001h,002h,001h,003h,000h,06ah,0b9h,07dh,0b9h,0a4h	; b835  ...........j.}..
	defb 0b9h,0b7h,0b9h,0cah,0b9h,0cah,0b9h,0d7h,0b9h,0cah,0b9h,0f4h,0b9h,001h,0bah,011h	; b845  ................
	defb 0bah,021h,0bah,031h,0bah,041h,0bah,0cah,0b9h,051h,0bah,061h,0bah,071h,0bah,081h	; b855  .!.1.A...Q.a.q..
	defb 0bah,091h,0bah,0a1h,0bah,0cah,0b9h,035h,0bbh,0cah,0b9h,0e8h,0bah,0f8h,0bah,0cah	; b865  .......5........
	defb 0b9h,008h,0bbh,018h,0bbh,025h,0bbh,035h,0bbh,018h,0bbh,07dh,0b9h,045h,0bbh,0a4h	; b875  .....%.5...}.E..
	defb 0b9h,055h,0bbh,0cah,0b9h,0f4h,0b9h,078h,0bbh,0a4h,0b9h,088h,0bbh,098h,0bbh,0cah	; b885  .U.....x........
	defb 0b9h,0a8h,0bbh,0b5h,0bbh,0c5h,0bbh,0d5h,0bbh,0e5h,0bbh,035h,0bbh,0cah,0b9h,0e7h	; b895  ...........5....
	defb 0b9h,0cah,0b9h,0cah,0b9h,0f4h,0b9h,0f4h,0b9h,011h,0bah,011h,0bah,011h,0bah,011h	; b8a5  ................
	defb 0bah,001h,0bah,001h,0bah,011h,0bah,011h,0bah,081h,0bah,051h,0bah,0cbh,0bah,051h	; b8b5  ...........Q...Q
	defb 0bah,051h,0bah,051h,0bah,0dbh,0bah,0dbh,0bah,0dbh,0bah,0b1h,0bah,025h,0bbh,025h	; b8c5  .Q.Q.........%.%
	defb 0bbh,025h,0bbh,025h,0bbh,025h,0bbh,025h,0bbh,025h,0bbh,025h,0bbh,025h,0bbh,025h	; b8d5  .%.%.%.%.%.%.%.%
	defb 0bbh,025h,0bbh,025h,0bbh,025h,0bbh,0e8h,0bah,0e8h,0bah,0e8h,0bah,025h,0bbh,025h	; b8e5  .%.%.%.......%.%
	defb 0bbh,025h,0bbh,025h,0bbh,025h,0bbh,025h,0bbh,025h,0bbh,025h,0bbh,025h,0bbh,0cah	; b8f5  .%.%.%.%.%.%.%..
	defb 0b9h,068h,0bbh,068h,0bbh,068h,0bbh,068h,0bbh,068h,0bbh,0a8h,0bbh,0e5h,0bbh,000h	; b905  .h.h.h.h.h......
	defb 000h,000h,001h,011h,001h,002h,052h,003h,003h,020h,001h,004h,075h,006h,005h,033h	; b915  ......R.. ..u..3
	defb 003h,006h,055h,005h,007h,077h,007h,008h,044h,004h,009h,006h,002h,00ah,070h,000h	; b925  ..U..w..D.....p.
	defb 00bh,073h,004h,00ch,041h,002h,00dh,002h,004h,00eh,001h,002h,00fh,000h,000h,0ffh	; b935  .s..A...........
	defb 000h,000h,000h,002h,060h,004h,003h,030h,002h,007h,077h,007h,008h,044h,004h,009h	; b945  ....`..0..w..D..
	defb 006h,002h,00ah,070h,000h,00bh,064h,005h,00ch,050h,003h,00dh,002h,004h,00eh,001h	; b955  ...p..d..P......
	defb 002h,00fh,000h,000h,0ffh,001h,000h,000h,002h,040h,003h,004h,011h,001h,005h,022h	; b965  .........@....."
	defb 002h,006h,033h,003h,008h,033h,003h,0ffh,001h,003h,000h,004h,022h,002h,005h,033h	; b975  ..3..3......"..3
	defb 003h,006h,055h,005h,0ffh,001h,001h,001h,004h,022h,002h,005h,033h,003h,006h,055h	; b985  ..U......"..3..U
	defb 005h,0ffh,001h,002h,002h,004h,023h,003h,005h,034h,004h,006h,056h,006h,0ffh,001h	; b995  ......#..4..V...
	defb 011h,001h,002h,060h,005h,004h,022h,002h,005h,033h,003h,006h,066h,006h,008h,044h	; b9a5  ...`.."..3..f..D
	defb 004h,0ffh,001h,022h,002h,002h,060h,005h,004h,033h,003h,005h,044h,004h,006h,066h	; b9b5  ..."..`..3..D..f
	defb 006h,008h,044h,004h,0ffh,001h,001h,001h,004h,012h,002h,005h,034h,004h,006h,046h	; b9c5  ..D.........4..F
	defb 005h,0ffh,001h,021h,002h,002h,060h,005h,004h,032h,003h,005h,043h,004h,006h,054h	; b9d5  ...!..`..2..C..T
	defb 005h,0ffh,001h,020h,000h,004h,030h,000h,005h,050h,000h,006h,060h,000h,0ffh,001h	; b9e5  ... ..0..P..`...
	defb 001h,001h,004h,012h,002h,005h,023h,003h,006h,045h,005h,0ffh,001h,022h,002h,002h	; b9f5  ......#..E..."..
	defb 031h,003h,004h,042h,004h,005h,053h,005h,006h,064h,006h,0ffh,001h,032h,002h,002h	; ba05  1..B..S..d...2..
	defb 043h,003h,004h,043h,003h,005h,054h,004h,006h,065h,005h,0ffh,001h,022h,002h,002h	; ba15  C..C..T..e..."..
	defb 031h,003h,004h,042h,004h,005h,053h,005h,006h,064h,006h,0ffh,001h,022h,002h,002h	; ba25  1..B..S..d..."..
	defb 031h,003h,004h,042h,004h,005h,053h,005h,006h,064h,006h,0ffh,001h,002h,002h,002h	; ba35  1..B..S..d......
	defb 024h,004h,004h,023h,003h,005h,045h,005h,006h,056h,006h,0ffh,001h,031h,002h,002h	; ba45  $..#..E..V...1..
	defb 051h,004h,004h,042h,003h,005h,053h,004h,006h,075h,006h,0ffh,001h,031h,002h,002h	; ba55  Q..B..S..u...1..
	defb 042h,003h,004h,053h,004h,005h,064h,005h,006h,075h,006h,0ffh,001h,021h,001h,002h	; ba65  B..S..d..u...!..
	defb 031h,002h,004h,041h,003h,005h,051h,004h,006h,062h,005h,0ffh,001h,032h,002h,002h	; ba75  1..A..Q..b...2..
	defb 043h,003h,004h,043h,003h,005h,054h,004h,006h,065h,005h,0ffh,001h,031h,002h,002h	; ba85  C..C..T..e...1..
	defb 040h,003h,004h,042h,003h,005h,053h,004h,006h,064h,005h,0ffh,001h,031h,002h,002h	; ba95  @..B..S..d...1..
	defb 040h,003h,004h,042h,003h,005h,053h,004h,006h,064h,005h,0ffh,001h,002h,001h,004h	; baa5  @..B..S..d......
	defb 024h,003h,005h,046h,005h,006h,057h,006h,0ffh,001h,010h,000h,004h,032h,002h,005h	; bab5  $..F..W......2..
	defb 054h,004h,006h,076h,006h,0ffh,001h,012h,001h,002h,013h,002h,004h,014h,003h,005h	; bac5  T..v............
	defb 026h,005h,006h,037h,007h,0ffh,001h,031h,002h,004h,042h,003h,005h,053h,004h,006h	; bad5  &..7...1..B..S..
	defb 064h,005h,0ffh,001h,001h,001h,002h,022h,003h,004h,012h,002h,005h,023h,003h,006h	; bae5  d......".....#..
	defb 045h,005h,0ffh,001h,001h,001h,002h,070h,005h,004h,012h,002h,005h,023h,003h,006h	; baf5  E......p.....#..
	defb 024h,004h,0ffh,001h,001h,001h,002h,033h,003h,004h,030h,003h,005h,022h,003h,006h	; bb05  $......3..0.."..
	defb 023h,004h,0ffh,001h,031h,002h,004h,051h,004h,005h,062h,005h,006h,064h,006h,0ffh	; bb15  #...1..Q..b..d..
	defb 001h,022h,002h,002h,033h,003h,004h,033h,003h,005h,044h,004h,006h,055h,005h,0ffh	; bb25  ."..3..3..D..U..
	defb 001h,041h,002h,004h,022h,002h,005h,044h,004h,006h,052h,003h,008h,033h,003h,0ffh	; bb35  .A.."..D..R..3..
	defb 001h,020h,001h,003h,030h,001h,004h,040h,003h,005h,050h,004h,006h,060h,005h,0ffh	; bb45  . ..0..@..P..`..
	defb 001h,001h,001h,002h,032h,003h,004h,030h,003h,005h,022h,003h,006h,023h,004h,00ch	; bb55  ....2..0.."..#..
	defb 040h,003h,0ffh,001h,011h,001h,002h,023h,003h,004h,022h,002h,005h,033h,003h,006h	; bb65  @......#.."..3..
	defb 055h,005h,0ffh,001h,014h,001h,002h,024h,002h,004h,035h,003h,005h,046h,004h,006h	; bb75  U......$..5..F..
	defb 057h,005h,0ffh,001h,031h,002h,002h,040h,003h,004h,042h,003h,005h,053h,004h,006h	; bb85  W...1..@..B..S..
	defb 064h,005h,0ffh,001h,022h,002h,002h,031h,003h,004h,042h,004h,005h,053h,005h,006h	; bb95  d..."..1..B..S..
	defb 064h,006h,0ffh,001h,001h,001h,004h,022h,002h,005h,033h,003h,006h,055h,006h,0ffh	; bba5  d......"..3..U..
	defb 001h,001h,002h,002h,000h,000h,004h,002h,003h,005h,003h,004h,006h,004h,006h,0ffh	; bbb5  ................
	defb 001h,011h,001h,004h,022h,002h,005h,033h,003h,006h,055h,005h,008h,044h,004h,0ffh	; bbc5  ...."..3..U..D..
	defb 001h,020h,001h,002h,033h,003h,004h,042h,003h,005h,053h,004h,006h,075h,006h,0ffh	; bbd5  . ..3..B..S..u..
	defb 001h,030h,002h,004h,042h,003h,005h,053h,004h,006h,075h,006h,0ffh,000h,000h,000h	; bbe5  .0..B..S..u.....
	defb 001h,001h,001h,002h,060h,004h,003h,030h,002h,004h,012h,002h,005h,034h,004h,006h	; bbf5  ....`..0.....4..
	defb 046h,005h,007h,077h,007h,008h,044h,004h,009h,006h,002h,00ah,070h,000h,00bh,064h	; bc05  F..w..D.....p..d
	defb 005h,00ch,050h,003h,00dh,002h,004h,00eh,001h,002h,00fh,000h,000h,0ffh,000h,000h	; bc15  ..P.............
	defb 000h,001h,003h,000h,002h,016h,001h,003h,011h,001h,004h,016h,003h,005h,015h,002h	; bc25  ................
	defb 006h,037h,005h,007h,067h,006h,0ffh,000h,000h,000h,001h,020h,002h,002h,060h,004h	; bc35  .7..g...... ..`.
	defb 003h,030h,000h,004h,032h,003h,005h,020h,001h,006h,066h,006h,007h,077h,007h,008h	; bc45  .0..2.. ..f..w..
	defb 044h,004h,009h,006h,002h,00ah,070h,000h,00bh,064h,005h,00ch,050h,003h,00dh,002h	; bc55  D.....p..d..P...
	defb 004h,00eh,001h,002h,00fh,000h,000h,0ffh,000h,000h,000h,001h,040h,000h,002h,060h	; bc65  ............@..`
	defb 000h,003h,030h,000h,004h,050h,000h,005h,050h,000h,006h,070h,000h,007h,070h,000h	; bc75  ..0..P..P..p..p.
	defb 008h,070h,000h,009h,050h,000h,00ah,070h,000h,00bh,070h,000h,00ch,060h,000h,00dh	; bc85  .p..P..p..p..`..
	defb 070h,000h,00eh,050h,000h,00fh,000h,000h,0ffh,000h,000h,000h,001h,030h,000h,002h	; bc95  p..P.........0..
	defb 050h,000h,003h,030h,000h,004h,040h,000h,005h,040h,000h,006h,070h,000h,007h,070h	; bca5  P..0..@..@..p..p
	defb 000h,008h,060h,000h,009h,050h,000h,00ah,070h,000h,00bh,070h,000h,00ch,050h,000h	; bcb5  ..`..P..p..p..P.
	defb 00dh,060h,000h,00eh,040h,000h,00fh,000h,000h,0ffh,001h,003h,001h,002h,014h,002h	; bcc5  .`..@...........
	defb 003h,014h,003h,004h,015h,002h,005h,026h,003h,006h,027h,004h,007h,027h,006h,008h	; bcd5  .......&..'..'..
	defb 015h,002h,00ah,016h,004h,00bh,036h,004h,00ch,014h,002h,00dh,015h,002h,00eh,014h	; bce5  ......6.........
	defb 001h,0ffh,000h,000h,000h,001h,000h,000h,002h,012h,001h,003h,034h,003h,004h,045h	; bcf5  ............4..E
	defb 004h,005h,023h,002h,006h,045h,004h,007h,034h,003h,008h,023h,002h,009h,023h,002h	; bd05  ..#..E..4..#..#.
	defb 00ah,034h,003h,00bh,045h,004h,00ch,056h,005h,00dh,067h,006h,00eh,077h,007h,00fh	; bd15  .4..E..V..g..w..
	defb 000h,000h,0ffh	; bd25

; ----------------------------------------------------------------------
; DATOS zonas_salas_datos: 20 punteros, uno por zona: un byte por sala
;   (p00:58A7; los 4 bits altos a 0xCA4C y los bajos a 0xCA4D); lo leen
;   p00:58A7 (40 bytes)
;   0xbd28..0xbd50  (40 bytes)
DATA_zonas_salas_datos:
	defw 0bd50h,0bd5dh,0bd74h,0bd7dh,0bd92h,0bdaah,0bdb3h,0bdd7h	; bd28
	defw 0bdech,0bdfch,0be01h,0be1ah,0be23h,0be2ch,0be33h,0be39h	; bd38
	defw 0be3eh,0be42h,0be48h,0be5ch	; bd48  -> DATA_salas_datos_zona_16 DATA_salas_datos_zona_17 DATA_salas_datos_zona_18 DATA_salas_datos_zona_19

; ----------------------------------------------------------------------
; DATOS salas_datos_zona_0: 13 bytes, uno por sala de la zona 0: los 4 bits
;   altos a 0xCA4C y los bajos a 0xCA4D (p00:58AB); lo leen p00:58AB (13
;   bytes)
;   0xbd50..0xbd5d  (13 bytes)
DATA_salas_datos_zona_0:
	defb 003h,003h,003h,003h,003h,003h,003h,023h,023h,021h,041h,041h,041h	; bd50  .......##!AAA

; ----------------------------------------------------------------------
; DATOS salas_datos_zona_1: 23 bytes, uno por sala de la zona 1: los 4 bits
;   altos a 0xCA4C y los bajos a 0xCA4D (p00:58AB); lo leen p00:58AB (23
;   bytes)
;   0xbd5d..0xbd74  (23 bytes)
DATA_salas_datos_zona_1:
	defb 002h,002h,002h,002h,002h,001h,001h,001h,001h,002h,001h,067h,001h,001h,002h,001h	; bd5d  ...........g....
	defb 001h,001h,004h,004h,004h,004h,003h	; bd6d

; ----------------------------------------------------------------------
; DATOS salas_datos_zona_2: 9 bytes, uno por sala de la zona 2: los 4 bits
;   altos a 0xCA4C y los bajos a 0xCA4D (p00:58AB); lo leen p00:58AB (9 bytes)
;   0xbd74..0xbd7d  (9 bytes)
DATA_salas_datos_zona_2:
	defb 003h,001h,002h,003h,007h,004h,001h,001h,005h	; bd74  .........

; ----------------------------------------------------------------------
; DATOS salas_datos_zona_3: 21 bytes, uno por sala de la zona 3: los 4 bits
;   altos a 0xCA4C y los bajos a 0xCA4D (p00:58AB); lo leen p00:58AB (21
;   bytes)
;   0xbd7d..0xbd92  (21 bytes)
DATA_salas_datos_zona_3:
	defb 001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,007h,001h,001h,001h,001h,001h	; bd7d  ................
	defb 001h,001h,001h,001h,001h	; bd8d

; ----------------------------------------------------------------------
; DATOS salas_datos_zona_4: 24 bytes, uno por sala de la zona 4: los 4 bits
;   altos a 0xCA4C y los bajos a 0xCA4D (p00:58AB); lo leen p00:58AB (24
;   bytes)
;   0xbd92..0xbdaa  (24 bytes)
DATA_salas_datos_zona_4:
	defb 003h,003h,001h,001h,001h,001h,001h,001h,001h,002h,001h,001h,007h,001h,001h,001h	; bd92  ................
	defb 001h,001h,001h,001h,001h,001h,001h,001h	; bda2  ........

; ----------------------------------------------------------------------
; DATOS salas_datos_zona_5: 9 bytes, uno por sala de la zona 5: los 4 bits
;   altos a 0xCA4C y los bajos a 0xCA4D (p00:58AB); lo leen p00:58AB (9 bytes)
;   0xbdaa..0xbdb3  (9 bytes)
DATA_salas_datos_zona_5:
	defb 001h,001h,001h,001h,007h,001h,001h,001h,001h	; bdaa  .........

; ----------------------------------------------------------------------
; DATOS salas_datos_zona_6: 36 bytes, uno por sala de la zona 6: los 4 bits
;   altos a 0xCA4C y los bajos a 0xCA4D (p00:58AB); lo leen p00:58AB (36
;   bytes)
;   0xbdb3..0xbdd7  (36 bytes)
DATA_salas_datos_zona_6:
	defb 001h,001h,001h,001h,001h,001h,001h,007h,001h,001h,001h,001h,001h,001h,001h,001h	; bdb3  ................
	defb 003h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h	; bdc3  ................
	defb 001h,001h,001h,001h	; bdd3

; ----------------------------------------------------------------------
; DATOS salas_datos_zona_7: 21 bytes, uno por sala de la zona 7: los 4 bits
;   altos a 0xCA4C y los bajos a 0xCA4D (p00:58AB); lo leen p00:58AB (21
;   bytes)
;   0xbdd7..0xbdec  (21 bytes)
DATA_salas_datos_zona_7:
	defb 001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,024h,001h,024h,024h,024h	; bdd7  ...........$.$$$
	defb 024h,024h,023h,024h,023h	; bde7

; ----------------------------------------------------------------------
; DATOS salas_datos_zona_8: 16 bytes, uno por sala de la zona 8: los 4 bits
;   altos a 0xCA4C y los bajos a 0xCA4D (p00:58AB); lo leen p00:58AB (16
;   bytes)
;   0xbdec..0xbdfc  (16 bytes)
DATA_salas_datos_zona_8:
	defb 001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h	; bdec  ................

; ----------------------------------------------------------------------
; DATOS salas_datos_zona_9: 5 bytes, uno por sala de la zona 9: los 4 bits
;   altos a 0xCA4C y los bajos a 0xCA4D (p00:58AB); lo leen p00:58AB (5 bytes)
;   0xbdfc..0xbe01  (5 bytes)
DATA_salas_datos_zona_9:
	defb 021h,021h,021h,041h,041h	; bdfc

; ----------------------------------------------------------------------
; DATOS salas_datos_zona_10: 25 bytes, uno por sala de la zona 10: los 4 bits
;   altos a 0xCA4C y los bajos a 0xCA4D (p00:58AB); lo leen p00:58AB (25
;   bytes)
;   0xbe01..0xbe1a  (25 bytes)
DATA_salas_datos_zona_10:
	defb 025h,025h,025h,023h,025h,025h,025h,025h,025h,025h,025h,005h,005h,001h,001h,001h	; be01  %%%#%%%%%%%.....
	defb 005h,005h,001h,001h,001h,041h,001h,001h,001h	; be11  .....A...

; ----------------------------------------------------------------------
; DATOS salas_datos_zona_11: 9 bytes, uno por sala de la zona 11: los 4 bits
;   altos a 0xCA4C y los bajos a 0xCA4D (p00:58AB); lo leen p00:58AB (9 bytes)
;   0xbe1a..0xbe23  (9 bytes)
DATA_salas_datos_zona_11:
	defb 045h,045h,045h,045h,045h,045h,045h,045h,045h	; be1a  EEEEEEEEE

; ----------------------------------------------------------------------
; DATOS salas_datos_zona_12: 9 bytes, uno por sala de la zona 12: los 4 bits
;   altos a 0xCA4C y los bajos a 0xCA4D (p00:58AB); lo leen p00:58AB (9 bytes)
;   0xbe23..0xbe2c  (9 bytes)
DATA_salas_datos_zona_12:
	defb 061h,061h,061h,061h,023h,023h,023h,023h,023h	; be23  aaaa#####

; ----------------------------------------------------------------------
; DATOS salas_datos_zona_13: 7 bytes, uno por sala de la zona 13: los 4 bits
;   altos a 0xCA4C y los bajos a 0xCA4D (p00:58AB); lo leen p00:58AB (7 bytes)
;   0xbe2c..0xbe33  (7 bytes)
DATA_salas_datos_zona_13:
	defb 061h,023h,023h,023h,023h,023h,023h	; be2c

; ----------------------------------------------------------------------
; DATOS salas_datos_zona_14: 6 bytes, uno por sala de la zona 14: los 4 bits
;   altos a 0xCA4C y los bajos a 0xCA4D (p00:58AB); lo leen p00:58AB (6 bytes)
;   0xbe33..0xbe39  (6 bytes)
DATA_salas_datos_zona_14:
	defb 061h,061h,061h,061h,023h,023h	; be33

; ----------------------------------------------------------------------
; DATOS salas_datos_zona_15: 5 bytes, uno por sala de la zona 15: los 4 bits
;   altos a 0xCA4C y los bajos a 0xCA4D (p00:58AB); lo leen p00:58AB (5 bytes)
;   0xbe39..0xbe3e  (5 bytes)
DATA_salas_datos_zona_15:
	defb 061h,001h,001h,001h,001h	; be39

; ----------------------------------------------------------------------
; DATOS salas_datos_zona_16: 4 bytes, uno por sala de la zona 16: los 4 bits
;   altos a 0xCA4C y los bajos a 0xCA4D (p00:58AB); lo leen p00:58AB (4 bytes)
;   0xbe3e..0xbe42  (4 bytes)
DATA_salas_datos_zona_16:
	defb 061h,061h,061h,061h	; be3e

; ----------------------------------------------------------------------
; DATOS salas_datos_zona_17: 6 bytes, uno por sala de la zona 17: los 4 bits
;   altos a 0xCA4C y los bajos a 0xCA4D (p00:58AB); lo leen p00:58AB (6 bytes)
;   0xbe42..0xbe48  (6 bytes)
DATA_salas_datos_zona_17:
	defb 001h,002h,002h,002h,002h,002h	; be42

; ----------------------------------------------------------------------
; DATOS salas_datos_zona_18: 20 bytes, uno por sala de la zona 18: los 4 bits
;   altos a 0xCA4C y los bajos a 0xCA4D (p00:58AB); lo leen p00:58AB (20
;   bytes)
;   0xbe48..0xbe5c  (20 bytes)
DATA_salas_datos_zona_18:
	defb 001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h	; be48  ................
	defb 001h,001h,001h,001h	; be58

; ----------------------------------------------------------------------
; DATOS salas_datos_zona_19: 6 bytes, uno por sala de la zona 19: los 4 bits
;   altos a 0xCA4C y los bajos a 0xCA4D (p00:58AB); lo leen p00:58AB (6 bytes)
;   0xbe5c..0xbe62  (6 bytes)
DATA_salas_datos_zona_19:
	defb 001h,001h,001h,001h,001h,023h	; be5c

; ----------------------------------------------------------------------
; DATOS sin identificar  0xbe62..0xbe63  (1 bytes)
DATA_BE62:
	defb 045h	; be62

; ----------------------------------------------------------------------
; DATOS salas_0xCA76_datos: 58 bytes, uno por cada valor de 0xCA76: los 4 bits
;   altos a L y los bajos a H (p00:566F); lo leen p00:566F (58 bytes)
;   0xbe63..0xbe9d  (58 bytes)
DATA_salas_0xCA76_datos:
	defb 007h,005h,025h,005h,005h,061h,061h,001h,001h,001h,001h,001h,001h,001h,001h,005h	; be63  ..%..aa.........
	defb 003h,002h,003h,003h,003h,005h,005h,005h,045h,021h,021h,021h,021h,021h,021h,021h	; be73  ........E!!!!!!!
	defb 021h,021h,021h,021h,021h,021h,005h,005h,005h,067h,067h,067h,067h,067h,067h,067h	; be83  !!!!!!...ggggggg
	defb 067h,067h,045h,023h,023h,023h,023h,023h,001h,007h	; be93  ggE#####..

; ----------------------------------------------------------------------
; DATOS resto_BE9D: lo apuntan con el banco puesto p12:6808 (0xBE9D), p12:6811
;   (0xBEBC), p12:682C (0xBEC5), p12:6835 (0xBEDA), p12:681B (0xBEE7); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p12:6808, p12:6811, p12:682C, p12:6835, p12:681B (355 bytes)
;   0xbe9d..0xc000  (355 bytes)
DATA_resto_BE9D:
	defb 010h,040h,018h,018h,018h,058h,018h,078h,028h,038h,038h,088h,050h,088h,060h,038h	; be9d  .@...X.x(88.P.`8
	defb 060h,050h,078h,058h,080h,0a0h,088h,070h,090h,018h,090h,058h,090h,088h,0ffh,030h	; bead  `PxX...p...X...0
	defb 010h,038h,0a0h,070h,030h,070h,080h,0ffh,030h,010h,028h,028h,038h,028h,050h,048h	; bebd  .8.p0p..0.((8(PH
	defb 068h,048h,090h,048h,048h,080h,028h,0a0h,048h,0a0h,068h,0a0h,0ffh,058h,028h,058h	; becd  hH.HH.(.H.h..X(X
	defb 048h,058h,068h,058h,088h,068h,028h,068h,088h,0ffh,040h,030h,040h,040h,040h,050h	; bedd  HXhX.h(h..@0@@@P
	defb 040h,060h,040h,070h,040h,080h,094h,030h,094h,040h,094h,050h,094h,060h,094h,070h	; beed  @`@p@..0.@.P.`.p
	defb 094h,080h,050h,02ch,060h,02ch,070h,02ch,080h,02ch,050h,08ch,060h,08ch,070h,08ch	; befd  ..P,`,p,.,P.`.p.
	defb 080h,08ch,0ffh,000h,00ah,002h,000h,00ch,002h,003h,000h,00bh,003h,002h,00bh,003h	; bf0d  ................
	defb 00eh,00bh,004h,002h,00bh,004h,003h,00bh,004h,00dh,00bh,004h,00eh,00bh,007h,00eh	; bf1d  ................
	defb 00bh,0ffh,000h,00ah,002h,000h,00ch,002h,003h,005h,00bh,003h,007h,00bh,003h,012h	; bf2d  ................
	defb 00bh,004h,007h,00bh,004h,008h,00bh,004h,012h,00bh,004h,013h,00bh,007h,00fh,00bh	; bf3d  ................
	defb 009h,003h,002h,0ffh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; bf4d  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,021h,01fh,0ffh,0ffh,0ffh,0ffh,010h	; bf5d  .........!......
	defb 00fh,01fh,000h,000h,000h,000h,000h,001h,012h,021h,011h,011h,010h,000h,000h,000h	; bf6d  .........!......
	defb 000h,000h,000h,002h,01fh,000h,01fh,0ffh,0ffh,0ffh,0ffh,0ffh,010h,000h,000h,000h	; bf7d  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; bf8d  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,021h,0ddh,0eeh,0ffh,0ffh,0ffh,010h	; bf9d  .........!......
	defb 0f2h,0f0h,000h,000h,000h,000h,000h,000h,011h,012h,0f1h,011h,000h,000h,000h,000h	; bfad  ................
	defb 000h,000h,000h,000h,021h,0f0h,02fh,0ffh,0ffh,0feh,0eeh,0efh,010h,000h,000h,000h	; bfbd  ....!./.........
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; bfcd  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,002h,022h,022h,021h,01fh,0ffh,0f1h,000h	; bfdd  .........""!....
	defb 0f1h,0f0h,000h,000h,000h,000h,000h,000h,001h,014h,0f1h,010h,000h,000h,000h,000h	; bfed  ................
	defb 000h,000h,000h	; bffd
