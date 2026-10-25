; ==========================================================================
; METAL GEAR 2 SOLID SNAKE - Konami (1990) - MSX2 - MegaROM RC-767 de 512 KB (Konami SCC) - banco 45 (se ejecuta en 0xa000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x0a000


; ----------------------------------------------------------------------
; DATOS dibujo_9E12_cola: 29 caracteres de 8x8 a 3 bits por punto (24 bytes
;   cada uno), ficha 4 de la lista 0x9332 (p00:4D92, p00:4DF5) (sigue del
;   banco 44); lo leen p01:6E24 (202 bytes)
;   0xa000..0xa0ca  (202 bytes)
DATA_dibujo_9E12_cola:
	defb 039h,070h,0e8h,064h,0e0h,0d0h,0c4h,0c4h,0a2h,08ch,005h,01fh,005h,000h,004h,000h,010h,000h,03eh,01ch,01ch,05dh,000h,010h	; a000  9p.d..............>..]..
	defb 000h,080h,026h,080h,086h,00fh,086h,080h,000h,080h,007h,0f8h,0f8h,0afh,029h,028h,053h,058h,04ch,009h,03ch,00eh,002h,001h	; a018  ..&...........)(SXL.<...
	defb 002h,031h,07fh,030h,078h,049h,048h,002h,004h,000h,044h,07ah,042h,038h,064h,026h,019h,0b9h,094h,0e7h,063h,084h,0fch,07ch	; a030  .1.0xIH...DzB8d&....c..|
	defb 073h,0fbh,0efh,00ch,02fh,0f4h,054h,093h,0ffh,0afh,005h,01fh,005h,000h,004h,000h,010h,000h,03eh,01ch,01ch,05dh,000h,010h	; a048  s.../.T...........>..]..
	defb 000h,085h,022h,081h,084h,001h,08ch,086h,00ch,084h,007h,0f8h,0f8h,0afh,029h,028h,053h,058h,04ch,009h,03ch,00eh,002h,001h	; a060  .."...........)(SXL.<...
	defb 002h,069h,017h,040h,054h,01dh,074h,01ah,070h,038h,0f2h,0e2h,083h,049h,03bh,02eh,017h,00bh,002h,000h,07fh,000h,022h,0fdh	; a078  .i.@T.t.p8...I........".
	defb 030h,000h,0a8h,000h,02fh,011h,00fh,04ch,05fh,053h,0fdh,0deh,042h,0cch,0ffh,013h,0a6h,0ffh,0c9h,01ah,0f7h,035h,038h,07fh	; a090  0.../..L_S..B........58.
	defb 02fh,01eh,0adh,005h,09fh,058h,070h,05bh,0ech,0ach,00bh,03eh,00ah,000h,001h,001h,00dh,00bh,00ah,00dh,015h,006h,00dh,097h	; a0a8  /....Xp[...>............
	defb 006h,002h,08fh,003h,005h,047h,005h,00ch,03fh,08ch	; a0c0  .....G..?.

; ----------------------------------------------------------------------
; DATOS dibujo_A0CA: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 1 de la lista 0x934C (p00:4D92, p00:4DF5); lo leen p01:6E24
;   (32 bytes)
;   0xa0ca..0xa0ea  (32 bytes)
DATA_dibujo_A0CA:
	defb 07fh,000h,0bfh,000h,0bfh,000h,09fh,000h,08fh,000h,00fh,000h,087h,080h,003h,080h	; a0ca  ................
	defb 002h,002h,00ch,00ch,000h,000h,083h,000h,0c7h,000h,0feh,000h,0fch,000h,0f9h,000h	; a0da  ................

; ----------------------------------------------------------------------
; DATOS dibujo_A0EA: 4 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 2 de la lista 0x934C (p00:4D92, p00:4DF5); lo leen p01:6E24
;   (96 bytes)
;   0xa0ea..0xa14a  (96 bytes)
DATA_dibujo_A0EA:
	defb 09fh,060h,067h,00fh,0f3h,0f0h,09eh,06eh,061h,03fh,0d9h,0c7h,02fh,0dfh,0dfh,05dh,0bdh,0bfh,09dh,05dh,05fh,03bh,0fbh,0bfh	; a0ea  .`g....na?../..]...]_...
	defb 07bh,0b9h,0c4h,035h,0dch,0eah,0dah,02ch,035h,0f5h,08eh,0aah,0fah,087h,0f5h,0dbh,086h,0d4h,0e8h,0a7h,0efh,0eeh,0b1h,0abh	; a102  {..5...,5...............
	defb 03bh,0bbh,03fh,03dh,0bdh,03fh,074h,077h,077h,000h,040h,00fh,011h,031h,02eh,027h,0e7h,058h,0cfh,04ch,032h,08fh,088h,075h	; a11a  ..?=.?tww.@..1.'.X.L2..u
	defb 0f7h,0b0h,0b2h,0b7h,0f8h,0f2h,00fh,0f0h,04ah,0d9h,0eeh,034h,0ech,0dbh,016h,0fah,0fdh,007h,0fdh,0feh,003h,03eh,0bbh,041h	; a132  ........J..4.........>.A

; ----------------------------------------------------------------------
; DATOS dibujo_A14A: 2 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 3 de la lista 0x934C (p00:4D92, p00:4DF5); lo leen p01:6E24
;   (48 bytes)
;   0xa14a..0xa17a  (48 bytes)
DATA_dibujo_A14A:
	defb 081h,07ch,083h,021h,0feh,001h,0f0h,0ffh,000h,07fh,0ffh,0ffh,03fh,0ffh,0ffh,07eh,0ffh,0ffh,03ch,0ffh,0ffh,011h,0ffh,0ffh	; a14a  .|.!........?..~..<.....
	defb 081h,0ffh,0ffh,0f3h,0ffh,0ffh,070h,0f8h,007h,0fch,0ffh,000h,080h,0ffh,000h,03ch,0ffh,000h,072h,000h,0e1h,0c8h,0e0h,018h	; a162  ......p........<..r.....

; ----------------------------------------------------------------------
; DATOS dibujo_A17A: 24 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 4 de la lista 0x934C (p00:4D92, p00:4DF5); lo leen p01:6E24
;   (576 bytes)
;   0xa17a..0xa3ba  (576 bytes)
DATA_dibujo_A17A:
	defb 08ch,0ffh,08ch,0e6h,07fh,026h,0e6h,039h,000h,0d3h,09ch,030h,0abh,04eh,05ah,0f8h,08fh,081h,0f9h,057h,050h,0a1h,0f7h,0e0h	; a17a  .....&.9...0.NZ....WP...
	defb 0a9h,0fbh,0e9h,0a4h,0fdh,0a4h,094h,0edh,0a4h,0a8h,055h,010h,098h,0edh,0c8h,0cch,075h,064h,070h,09bh,010h,080h,0ebh,080h	; a192  ..........U.....udp.....
	defb 01eh,01eh,0e1h,033h,03fh,0cch,03ah,03fh,0c5h,01dh,01fh,0e3h,00dh,00eh,0f2h,001h,001h,0feh,000h,000h,0ffh,080h,080h,07fh	; a1aa  ...3?.:?................
	defb 05ah,07fh,0aah,045h,0c2h,0c0h,0a2h,08bh,0a2h,000h,057h,00dh,014h,067h,04bh,05ch,0fah,0fbh,062h,07dh,09dh,044h,07ah,0bbh	; a1c2  Z..E......W..gK\..b}.Dz.
	defb 0b2h,07fh,04eh,030h,0fch,0c8h,0a9h,0e0h,0d1h,0a8h,062h,050h,028h,062h,0d1h,062h,06fh,099h,063h,06dh,098h,062h,066h,09bh	; a1da  ..N0......bP(b.bo.cm.bf.
	defb 003h,012h,002h,003h,013h,003h,042h,0abh,042h,0abh,0afh,0ebh,069h,0b4h,0a0h,0d5h,07fh,03dh,035h,0ebh,0e9h,088h,0ffh,074h	; a1f2  ......B.B...i....=5....t
	defb 075h,073h,088h,0f0h,0f7h,00dh,05ah,05bh,0a6h,04eh,04ch,0b0h,0c4h,0c6h,03ah,026h,022h,0dah,004h,03dh,0ech,088h,0f4h,050h	; a20a  us....Z[.NL...:&"..=...P
	defb 068h,06eh,094h,014h,01ah,0e8h,0d4h,0dah,028h,07ch,0f6h,084h,02ch,0f6h,054h,018h,06eh,028h,03ah,04eh,00ah,030h,0ech,020h	; a222  hn......(|..,.T.n(:N.0.
	defb 0beh,07eh,0c1h,05fh,03fh,060h,0afh,09fh,0b0h,0d7h,0cfh,0d8h,06bh,0e7h,07ch,0b5h,0f3h,0beh,0dbh,0f8h,0dbh,0efh,07eh,06eh	; a23a  .~._?`......k.|.......~n
	defb 004h,004h,0fbh,0c8h,0c8h,037h,0f8h,0f8h,007h,0f0h,0f0h,00fh,0e6h,0e7h,01ah,0f2h,0e0h,012h,045h,001h,04ch,0f2h,000h,013h	; a252  .....7............E.L...
	defb 0d7h,0fah,02ah,07eh,077h,083h,00dh,00eh,0fah,054h,0fah,0d8h,008h,078h,008h,0bbh,0f5h,0c5h,07eh,0e7h,0e6h,080h,0f3h,040h	; a26a  ..*~w....T...x....~....@
	defb 0f0h,05ch,050h,060h,0bch,0a0h,0c4h,07ch,044h,080h,0f9h,080h,008h,0f9h,008h,000h,0f1h,000h,051h,0f2h,050h,084h,0e6h,086h	; a282  .\P`...|D.........Q.P...
	defb 076h,0bfh,0b7h,03bh,05fh,0dbh,0deh,0e5h,0a4h,0efh,0f2h,0d2h,0d1h,0ffh,0dfh,0efh,07eh,06eh,071h,09fh,091h,09ch,0efh,06ch	; a29a  v..._...........~nq....l
	defb 07eh,0e7h,087h,063h,0e3h,09ch,0b8h,0f8h,0c7h,02eh,0feh,031h,003h,0c7h,004h,0c0h,021h,001h,0f0h,098h,090h,038h,0dch,018h	; a2b2  ~..c.......1....!....8..
	defb 031h,0dfh,0d1h,07ch,09fh,083h,0c3h,0c3h,03ch,0bch,0bdh,043h,0fdh,0efh,003h,005h,0fdh,0fdh,003h,003h,003h,002h,003h,002h	; a2ca  1..|....<..C............
	defb 0c0h,085h,085h,081h,041h,001h,081h,001h,000h,000h,001h,001h,001h,003h,001h,082h,087h,080h,004h,09ah,000h,01ch,015h,014h	; a2e2  ....A...................
	defb 05ah,07fh,0aah,045h,0fah,0c0h,0bah,0ffh,0bah,064h,0dfh,05dh,06ch,0d7h,055h,042h,0feh,0c3h,07eh,07dh,0bdh,044h,07ah,0bbh	; a2fa  Z..E.....d.]l.UB..~}.Dz.
	defb 0b2h,07fh,04eh,030h,0fdh,0c8h,0a8h,0e3h,0d0h,0a9h,063h,051h,028h,063h,0d0h,063h,06fh,099h,063h,06dh,098h,062h,066h,09bh	; a312  ..N0......cQ(c.co.cm.bf.
	defb 003h,012h,002h,003h,0f3h,003h,0c2h,0ebh,0c2h,0cbh,06fh,04bh,019h,0fch,018h,0f5h,0ffh,0fdh,035h,0ebh,0e9h,088h,0ffh,074h	; a32a  ..........oK......5....t
	defb 05ah,07fh,0aah,045h,0c2h,0c0h,0aah,0b3h,0aah,044h,057h,025h,004h,05fh,073h,05ch,0fah,0fbh,062h,07dh,09dh,044h,07ah,0bbh	; a342  Z..E.....DW%._s\..b}.Dz.
	defb 0b2h,07fh,04eh,030h,0fch,0c8h,0a9h,0e0h,0d1h,0a8h,062h,053h,029h,063h,0d0h,062h,06fh,099h,063h,06dh,098h,062h,066h,09bh	; a35a  ..N0......bS)c.bo.cm.bf.
	defb 003h,012h,002h,003h,013h,003h,042h,02bh,042h,0abh,0efh,0abh,069h,034h,0a0h,0d5h,07fh,03dh,035h,0ebh,0e9h,088h,0ffh,074h	; a372  ......B+B...i4...=5....t
	defb 0d7h,0fah,02ah,07eh,077h,083h,00dh,00eh,0fah,054h,0fah,0d8h,064h,002h,07ch,0b9h,0c7h,0b9h,0ffh,0f7h,0c7h,0feh,0f7h,076h	; a38a  ..*~w....T..d.|........v
	defb 001h,0f3h,0c1h,07ch,09fh,083h,0c3h,0c3h,03ch,0bch,0bdh,043h,0fdh,0efh,003h,005h,0fdh,0fdh,003h,003h,003h,002h,003h,002h	; a3a2  ...|....<..C............

; ----------------------------------------------------------------------
; DATOS dibujo_A3BA: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 1 de la lista 0x9366 (p00:4D92, p00:4DF5); lo leen p01:6E24
;   (32 bytes)
;   0xa3ba..0xa3da  (32 bytes)
DATA_dibujo_A3BA:
	defb 000h,000h,008h,000h,010h,000h,001h,000h,005h,000h,041h,040h,0c0h,080h,0c0h,080h	; a3ba  ..........A@....
	defb 002h,002h,001h,000h,001h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a3ca  ................

; ----------------------------------------------------------------------
; DATOS dibujo_A3DA: 31 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 2 de la lista 0x9366 (p00:4D92, p00:4DF5); lo leen p01:6E24
;   (744 bytes)
;   0xa3da..0xa6c2  (744 bytes)
DATA_dibujo_A3DA:
	defb 000h,000h,000h,011h,000h,000h,003h,000h,000h,05bh,000h,000h,08fh,000h,000h,000h,000h,000h,0bch,00ch,003h,02eh,000h,001h	; a3da  .........[..............
	defb 0f8h,000h,000h,01ch,000h,0e0h,047h,040h,0b8h,0ffh,078h,000h,0ffh,07eh,000h,07fh,000h,000h,040h,040h,080h,0ffh,07fh,000h	; a3f2  ......G@..x..~....@@....
	defb 0c0h,000h,000h,0e0h,000h,008h,0f0h,020h,00ch,0f8h,060h,004h,0fch,0f0h,002h,0ech,060h,012h,066h,004h,012h,0f4h,0c4h,062h	; a40a  ....... ..`.....`.f....b
	defb 0c0h,080h,000h,0c0h,080h,000h,0c0h,080h,000h,0c0h,080h,000h,0c0h,080h,000h,0e0h,080h,060h,038h,008h,030h,003h,030h,0b0h	; a422  .................`8.0.0.
	defb 023h,001h,000h,001h,000h,000h,004h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0c7h,0c8h,037h	; a43a  #......................7
	defb 0ffh,090h,000h,0e3h,01ch,01eh,0fbh,017h,007h,0f6h,00dh,00dh,00eh,018h,039h,003h,01eh,01eh,000h,000h,000h,0b4h,043h,0bfh	; a452  ..............9.......C.
	defb 0b4h,074h,062h,07eh,0ceh,0c0h,07eh,08ch,080h,03eh,0e0h,0e0h,070h,070h,08ch,0fch,008h,000h,000h,000h,002h,09dh,0f1h,006h	; a46a  .tb~..~..>..pp..........
	defb 017h,021h,0b0h,033h,003h,0a0h,090h,030h,0a1h,092h,020h,0a0h,005h,0a2h,0a1h,009h,0a1h,0a2h,05eh,024h,061h,05bh,02eh,060h	; a482  .!.3...0.. .......^$a[.`
	defb 0e3h,0e4h,01bh,0f0h,0f0h,00fh,079h,059h,086h,01fh,006h,060h,00fh,001h,010h,0afh,060h,080h,0d6h,0e4h,002h,0fbh,0d0h,026h	; a49a  ......yY...`....`......&
	defb 00dh,01eh,0f1h,01eh,011h,0e0h,0e1h,0c0h,000h,0c8h,0c8h,008h,096h,032h,024h,032h,029h,015h,0ffh,082h,001h,05bh,0c8h,007h	; a4b2  .............2$2)....[..
	defb 05fh,0d1h,026h,057h,041h,0a6h,073h,001h,006h,023h,001h,006h,0e1h,003h,004h,049h,003h,084h,015h,0c7h,008h,0b7h,051h,08eh	; a4ca  _.&WA.s..#.....I......Q.
	defb 01ch,02eh,021h,00ch,027h,020h,006h,027h,020h,026h,013h,030h,027h,013h,030h,003h,011h,010h,00bh,011h,018h,00bh,011h,018h	; a4e2  ..!.' .' &.0'.0.........
	defb 05bh,001h,0e6h,02ah,0a8h,047h,06bh,0e9h,006h,07bh,06dh,086h,02eh,0a8h,047h,03ah,01ch,0c7h,073h,014h,08fh,0d0h,087h,00eh	; a4fa  [..*.Gk..{m...G:..s.....
	defb 075h,02ah,0c5h,0ebh,08ch,073h,086h,0b3h,04ch,0cfh,041h,03ch,0e3h,0a1h,01ch,076h,0b5h,008h,0feh,03dh,080h,0eeh,06dh,090h	; a512  u*...s..L.A<...v...=..m.
	defb 097h,051h,0eeh,067h,0b9h,0c6h,0a6h,030h,0ceh,0c6h,072h,08ch,004h,0b4h,048h,042h,0a0h,018h,022h,000h,098h,082h,000h,098h	; a52a  .Q.g...0..r...HB..".....
	defb 011h,009h,018h,01dh,004h,018h,00dh,004h,018h,00ah,000h,01eh,003h,000h,00eh,00dh,00ch,002h,007h,006h,000h,003h,002h,000h	; a542  ........................
	defb 0cbh,082h,004h,0a7h,085h,040h,087h,086h,079h,00ch,091h,06fh,035h,0b3h,04ch,01fh,08dh,040h,006h,086h,079h,0a7h,040h,01dh	; a55a  .....@..y..o5.L..@..y.@.
	defb 08eh,0edh,010h,0ceh,02bh,0d0h,0e5h,010h,0ebh,075h,08eh,0f1h,098h,0e4h,00ah,0dbh,014h,00ah,057h,0a2h,05ch,0abh,02ah,0d4h	; a572  ....+....u........W.\.*.
	defb 08bh,008h,090h,099h,018h,080h,0b9h,018h,000h,079h,030h,000h,0f8h,030h,000h,0f8h,060h,000h,0d4h,0d8h,000h,0eah,090h,00ch	; a58a  .........y0..0..`.......
	defb 0fdh,060h,000h,07bh,079h,004h,058h,03bh,007h,0a6h,03fh,000h,03fh,019h,000h,009h,000h,000h,000h,000h,000h,000h,000h,000h	; a5a2  .`.{y.X...?.?...........
	defb 0cfh,0edh,010h,027h,054h,0a8h,0efh,008h,0f0h,0deh,012h,0a1h,0feh,026h,001h,0f7h,007h,000h,01fh,00fh,000h,07bh,01bh,004h	; a5ba  ...'T........&.......{..
	defb 0d8h,024h,01ah,0bch,042h,03ch,03eh,040h,0beh,02fh,052h,0bch,025h,05bh,0bch,039h,045h,0bah,039h,041h,0beh,030h,008h,0f7h	; a5d2  .$..B<>@./R.%[.9E.9A.0..
	defb 017h,021h,0b0h,033h,003h,0a0h,090h,030h,0a1h,092h,020h,0a0h,004h,0a0h,0a1h,00bh,0a2h,0a0h,05fh,025h,060h,05bh,02eh,060h	; a5ea  .!.3...0.. ......._%`[.`
	defb 0e3h,0e4h,01bh,0f0h,0f0h,00fh,079h,059h,086h,01fh,006h,060h,0cfh,081h,010h,08fh,000h,000h,0d6h,0e4h,002h,0fbh,0d0h,026h	; a602  ......yY...`...........&
	defb 00dh,01eh,0f1h,01eh,011h,0e0h,0e1h,0c0h,000h,0d4h,0cch,000h,080h,000h,000h,032h,029h,015h,0ffh,082h,001h,05bh,0c8h,007h	; a61a  ...............2)....[..
	defb 0e3h,0e4h,01bh,0f0h,0f0h,00fh,079h,059h,086h,01fh,006h,060h,00fh,081h,090h,04fh,080h,0c0h,0d6h,0e4h,002h,0fbh,0d0h,026h	; a632  ......yY...`...O.......&
	defb 00dh,01eh,0f1h,01eh,011h,0e0h,0e1h,0c0h,000h,0d4h,0d4h,014h,08ah,032h,038h,032h,029h,015h,0ffh,082h,001h,05bh,0c8h,007h	; a64a  .............282)....[..
	defb 0cbh,082h,004h,0a7h,085h,040h,087h,086h,079h,00ch,091h,06fh,035h,0b3h,04ch,01fh,08dh,040h,014h,080h,060h,0a7h,047h,018h	; a662  .....@..y..o5.L..@..`.G.
	defb 08eh,0edh,010h,0ceh,02bh,0d0h,0e5h,010h,0ebh,075h,08eh,0f1h,098h,0e4h,00ah,0dbh,014h,00ah,077h,022h,01ch,02bh,0aah,054h	; a67a  ....+....u........w".+.T
	defb 0f7h,060h,00dh,07dh,070h,000h,058h,03bh,007h,0a6h,03fh,000h,03fh,019h,000h,009h,000h,000h,000h,000h,000h,000h,000h,000h	; a692  .`.}p.X...?.?...........
	defb 04fh,06dh,090h,0e7h,054h,028h,0efh,008h,0f0h,0deh,012h,0a1h,0feh,026h,001h,0f7h,007h,000h,01fh,00fh,000h,07bh,01bh,004h	; a6aa  Om..T(.......&.......{..

; ----------------------------------------------------------------------
; DATOS dibujo_A6C2: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 1 de la lista 0x9376 (p00:4D92, p00:4DF5); lo leen p01:6E24
;   (16 bytes)
;   0xa6c2..0xa6d2  (16 bytes)
DATA_dibujo_A6C2:
	defb 000h,007h,003h,00fh,007h,01fh,00fh,03fh,01fh,07eh,01fh,07ch,01fh,0fch,03fh,0f9h	; a6c2  .......?.~.|..?.

; ----------------------------------------------------------------------
; DATOS dibujo_A6D2: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 2 de la lista 0x9376 (p00:4D92, p00:4DF5); lo leen p01:6E24
;   (16 bytes)
;   0xa6d2..0xa6e2  (16 bytes)
DATA_dibujo_A6D2:
	defb 0ffh,0ffh,0feh,0feh,0f8h,0f8h,0f0h,0f0h,060h,06ch,0c0h,0dch,084h,0bah,084h,0bbh	; a6d2  ........`l......

; ----------------------------------------------------------------------
; DATOS dibujo_A6E2: 4 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 3 de la lista 0x9376 (p00:4D92, p00:4DF5); lo leen p01:6E24
;   (64 bytes)
;   0xa6e2..0xa722  (64 bytes)
DATA_dibujo_A6E2:
	defb 0ffh,0ffh,001h,001h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0e0h,000h,0f0h	; a6e2  ................
	defb 003h,086h,003h,003h,023h,023h,071h,071h,024h,024h,004h,004h,00ch,08ch,00ch,08ch	; a6f2  ....##qq$$......
	defb 01ch,0dch,018h,098h,010h,0d0h,000h,0c0h,000h,080h,000h,098h,000h,038h,000h,0b8h	; a702  .............8..
	defb 000h,098h,000h,000h,021h,021h,071h,071h,063h,043h,0c6h,096h,080h,0b0h,0c1h,0e1h	; a712  ....!!qqcC......

; ----------------------------------------------------------------------
; DATOS dibujo_A722: 24 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 4 de la lista 0x9376 (p00:4D92, p00:4DF5); lo leen p01:6E24
;   (576 bytes)
;   0xa722..0xa962  (576 bytes)
DATA_dibujo_A722:
	defb 0d0h,0f8h,0d0h,0f8h,0e8h,0e8h,0f0h,06ch,060h,0e0h,05eh,050h,0e8h,01eh,018h,0dch,03eh,03ch,0dch,03eh,03ch,0dch,03fh,03ch	; a722  .......l`.^P....><.><.?<
	defb 03fh,0fbh,03bh,03ch,0f3h,033h,07ch,0f3h,073h,05eh,0f1h,051h,02fh,0f4h,024h,02fh,0feh,02eh,01fh,0f6h,016h,01fh,0f2h,012h	; a73a  ?..<.3|.s^.Q/.$/........
	defb 0ffh,04fh,040h,06fh,09fh,090h,062h,09eh,09dh,00bh,0f7h,0f4h,018h,0f7h,0e7h,09bh,077h,064h,0dch,03bh,02bh,0ffh,029h,009h	; a752  .O@o..b.........wd..+.).
	defb 083h,0fch,07ch,0e0h,0ffh,01fh,03eh,03fh,0c1h,0beh,0bfh,041h,0ffh,0ffh,000h,006h,0ffh,0f9h,078h,087h,087h,01ch,0fbh,01bh	; a76a  ..|...>?...A......x.....
	defb 06ch,09fh,09ch,036h,0cfh,0ceh,016h,0efh,0eeh,014h,0efh,0ech,038h,0c7h,0c4h,038h,0c6h,0c4h,0f8h,006h,006h,0fah,006h,006h	; a782  l..6........8..8........
	defb 03dh,0f6h,032h,07dh,0eeh,06ah,002h,0e7h,001h,000h,043h,000h,008h,010h,000h,011h,024h,001h,002h,006h,006h,010h,01fh,011h	; a79a  =.2}.j....C.....$.......
	defb 0ech,057h,054h,078h,0ach,088h,0d0h,074h,070h,074h,0deh,054h,03eh,059h,008h,03eh,0bfh,027h,007h,094h,01ch,09fh,04eh,006h	; a7b2  .WTx...tpt.T>Y.>.'....N.
	defb 001h,04eh,000h,067h,0f9h,079h,001h,00eh,006h,028h,057h,0a3h,0d7h,038h,0a8h,099h,0e6h,0e6h,01ch,0fbh,09bh,0feh,07dh,07dh	; a7ca  .N.g.y...(W..8........}}
	defb 007h,028h,008h,02eh,03bh,03ah,035h,06bh,02bh,021h,07eh,03eh,031h,06eh,02eh,033h,02ch,02ch,01bh,034h,014h,01ah,035h,014h	; a7e2  .(...:5k+!~>1n.3,,.4..5.
	defb 096h,0e9h,089h,006h,0b9h,019h,007h,0d8h,018h,083h,01dh,01dh,09eh,025h,001h,0aah,0f1h,0b5h,025h,0feh,03ah,01eh,003h,002h	; a7fa  .............%....%.:...
	defb 07fh,0bbh,0b8h,079h,0b5h,0b6h,0b2h,0dbh,09dh,0deh,067h,041h,068h,0f7h,0e7h,0d6h,079h,071h,02ah,0f5h,051h,0c4h,0bah,0b8h	; a812  ...y......gAh...yq*.Q...
	defb 00ch,013h,000h,006h,00ah,002h,005h,00fh,003h,002h,007h,001h,009h,00bh,008h,005h,004h,004h,002h,003h,002h,000h,001h,000h	; a82a  ........................
	defb 00ah,089h,009h,001h,0e3h,001h,03dh,0b2h,032h,002h,04fh,002h,08fh,015h,004h,008h,0cfh,08fh,084h,066h,004h,088h,0bch,088h	; a842  ......=.2.O........f....
	defb 0fbh,005h,005h,071h,09eh,090h,0abh,07dh,02dh,06ah,0d7h,057h,056h,0abh,0abh,0d4h,06fh,04fh,02dh,0d6h,016h,06fh,098h,018h	; a85a  ...q...}-j.WV...oO-..o..
	defb 0dfh,0deh,0deh,00dh,06ah,008h,004h,02fh,005h,003h,01eh,002h,003h,00fh,003h,001h,007h,001h,000h,003h,000h,000h,000h,000h	; a872  ....j../................
	defb 09bh,0e5h,0e5h,0d7h,029h,029h,0e7h,0dah,0dah,0efh,017h,017h,01eh,0ffh,0feh,0fch,0feh,0fch,000h,0f9h,000h,002h,003h,003h	; a88a  ....))..................
	defb 0ffh,083h,083h,0ffh,082h,082h,0ffh,084h,084h,0ffh,049h,049h,07fh,0f1h,071h,03fh,0e3h,023h,03eh,0ceh,04eh,078h,098h,098h	; a8a2  ..........II..q?.#>.Nx..
	defb 03dh,0f6h,032h,07dh,0eeh,06ah,002h,0e7h,001h,000h,043h,000h,008h,013h,000h,013h,027h,003h,006h,004h,004h,011h,019h,011h	; a8ba  =.2}.j....C.....'.......
	defb 001h,04eh,000h,067h,0f9h,079h,001h,0feh,006h,060h,0b7h,023h,017h,018h,018h,099h,0e6h,0e6h,01ch,0fbh,09bh,0feh,07dh,07dh	; a8d2  .N.g.y...`.#..........}}
	defb 03dh,0f6h,032h,07dh,0eeh,06ah,002h,0e7h,001h,000h,043h,000h,008h,010h,000h,014h,022h,005h,003h,005h,001h,010h,01fh,011h	; a8ea  =.2}.j....C.....".......
	defb 0ech,057h,054h,078h,0ach,088h,0d0h,074h,070h,074h,0deh,054h,03eh,059h,008h,0beh,03fh,027h,007h,094h,01ch,09fh,04eh,006h	; a902  .WTx...tpt.T>Y..?'....N.
	defb 001h,04eh,000h,067h,0f9h,079h,001h,00eh,006h,068h,027h,073h,0d7h,078h,0e8h,099h,0e6h,0e6h,01ch,0fbh,09bh,0feh,07dh,07dh	; a91a  .N.g.y...h's.x........}}
	defb 00ah,089h,009h,001h,0e3h,001h,03dh,0b2h,032h,002h,04fh,002h,083h,018h,003h,00fh,0c9h,088h,080h,067h,007h,088h,0bch,088h	; a932  ......=.2.O........g....
	defb 0fbh,005h,005h,071h,09eh,090h,083h,075h,005h,04ah,097h,047h,0eeh,053h,0d3h,0f4h,03fh,03fh,06dh,0b6h,0b6h,02fh,0d8h,018h	; a94a  ...q...u.J.G.S..??m../..

; ----------------------------------------------------------------------
; DATOS dibujo_A962: 33 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 1 de la lista 0x9390 (p00:4D92, p00:4DF5); lo leen p01:6E24
;   (792 bytes)
;   0xa962..0xac7a  (792 bytes)
DATA_dibujo_A962:
	defb 081h,000h,087h,080h,000h,083h,002h,000h,003h,002h,000h,003h,001h,000h,001h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a962  ........................
	defb 02bh,000h,03bh,013h,000h,033h,021h,000h,061h,021h,000h,061h,040h,000h,0c0h,080h,000h,080h,080h,000h,080h,000h,000h,000h	; a97a  +....3!.a!.a@...........
	defb 006h,001h,0ffh,005h,003h,0feh,002h,007h,0fdh,009h,007h,0fah,00ah,007h,0fbh,019h,002h,0f2h,019h,00bh,0f8h,011h,00ch,0f0h	; a992  ........................
	defb 0f7h,0f8h,00fh,03fh,0ffh,0c0h,087h,087h,078h,0e0h,080h,01fh,0c8h,05ch,037h,0c0h,0e0h,03fh,0c9h,07eh,076h,043h,0c3h,0bch	; a9aa  ...?....x....\7..?.~vC..
	defb 0f7h,00fh,0f8h,0ffh,0ffh,000h,0f0h,0f0h,00fh,001h,001h,0feh,01fh,01fh,0e0h,077h,058h,088h,0f8h,078h,007h,0f7h,0fah,008h	; a9c2  ...............wX..x....
	defb 080h,0c0h,07fh,0f0h,0c0h,03fh,0e0h,0f0h,01fh,0f0h,0f0h,00fh,0f0h,0f0h,00fh,038h,0f0h,0cfh,0f8h,0d0h,007h,078h,0f0h,087h	; a9da  .....?.........8.....x..
	defb 001h,00fh,0f1h,011h,00ch,0f0h,011h,008h,0f0h,012h,008h,0f0h,012h,005h,0f0h,035h,003h,0f0h,055h,005h,0f4h,0a0h,01fh,0e2h	; a9f2  ...............5..U.....
	defb 0c3h,0bfh,03ch,0c6h,047h,039h,0e7h,0fbh,0f8h,063h,0e1h,09dh,089h,0f8h,076h,064h,0fdh,0fbh,082h,0efh,085h,001h,006h,002h	; aa0a  ..<.G9...c....vd........
	defb 0e8h,0f8h,017h,0f0h,037h,00fh,0e4h,0f8h,01bh,003h,0f3h,0fch,0dch,0fch,023h,0dfh,0f1h,020h,0efh,0fbh,01bh,0d0h,0ffh,030h	; aa22  ....7.........#.. .....0
	defb 05ch,070h,0a7h,06ch,0f0h,097h,0a4h,0d8h,05bh,0e4h,0f8h,01bh,0f4h,0f8h,00bh,07ch,0f8h,08bh,0dch,0f4h,0e7h,03ch,0f8h,023h	; aa3a  \p.l....[......|.....<.#
	defb 06ch,006h,0e4h,0ach,01ch,0ech,048h,015h,040h,05ch,01ah,058h,01ch,02ch,00ch,00ch,075h,045h,04fh,073h,023h,01dh,03ah,03ah	; aa52  l.....H.@\.X.,..uEOs#.::
	defb 000h,003h,001h,040h,061h,040h,000h,045h,000h,001h,001h,001h,004h,011h,04ch,033h,0fbh,04bh,087h,0cfh,08dh,0e7h,0e6h,0e2h	; aa6a  ...@a@.E......L3.K......
	defb 0a0h,0f0h,060h,041h,081h,081h,040h,0e0h,0c0h,0c0h,080h,080h,09ch,0d2h,04ch,0c7h,0fbh,0a0h,0d0h,0c1h,020h,069h,06ah,098h	; aa82  ..`A..@.......L..... ij.
	defb 01ah,03eh,017h,00ah,09ch,085h,05eh,05ch,048h,00ah,00eh,004h,046h,01ah,0d8h,00ch,0f8h,082h,05ch,0f1h,063h,0cdh,0f4h,036h	; aa9a  .>....^\H...F.....\.c..6
	defb 0bch,0bfh,09fh,036h,0afh,007h,023h,03eh,012h,0a9h,037h,091h,0cbh,054h,0d0h,091h,01eh,08ah,016h,05fh,00fh,007h,04bh,00ah	; aab2  ...6..#>..7..T....._..K.
	defb 0cbh,03eh,006h,09fh,0f7h,083h,0e8h,0bfh,091h,0b0h,07bh,049h,0e1h,076h,012h,0d1h,0f7h,033h,0e3h,0e4h,028h,048h,099h,094h	; aaca  .>........{I.v...3..(H..
	defb 074h,075h,08ch,0efh,0fdh,011h,0ffh,0feh,000h,03fh,037h,0c0h,033h,03fh,0c8h,090h,09ah,069h,0a4h,039h,059h,0ach,0c7h,0cah	; aae2  tu.......?7.3?...i.9Y...
	defb 03ah,0e9h,06dh,0f2h,0c9h,0cdh,0b2h,0f8h,0bch,014h,0eeh,08ah,094h,0ech,048h,0b4h,0dch,049h,0f0h,0d8h,009h,07bh,068h,083h	; aafa  :.m...........H..I...{h.
	defb 003h,00dh,008h,003h,00eh,02ah,031h,007h,071h,030h,004h,0f0h,070h,002h,0f0h,0f4h,001h,0f4h,0e4h,000h,0e4h,0c2h,000h,0c6h	; ab12  .....*1.q0..p...........
	defb 08ch,07eh,010h,0beh,0f1h,08eh,0deh,0c0h,0bfh,0ffh,080h,0ffh,001h,028h,003h,001h,003h,001h,000h,000h,000h,000h,028h,000h	; ab2a  .~...........(........(.
	defb 018h,008h,006h,020h,020h,03fh,0e1h,081h,0beh,040h,000h,0ffh,066h,042h,0feh,0b0h,0dah,0b0h,002h,007h,002h,007h,00ch,004h	; ab42  ...  ?...@..fB..........
	defb 038h,0a8h,0c0h,028h,078h,050h,020h,070h,090h,0b0h,010h,094h,024h,000h,006h,012h,060h,013h,052h,040h,053h,022h,000h,033h	; ab5a  8..(xP p....$...`.R@S".3
	defb 004h,01ch,004h,08eh,01dh,08dh,007h,00dh,084h,043h,006h,0c2h,020h,000h,0e0h,0d8h,000h,0f8h,028h,000h,038h,008h,000h,008h	; ab72  .........C.. .....(.8...
	defb 005h,07eh,000h,00eh,0ffh,0f1h,044h,066h,0bah,088h,0fch,08ch,000h,000h,000h,000h,000h,001h,001h,000h,001h,001h,000h,001h	; ab8a  .~....Df................
	defb 06ch,006h,0e4h,0ach,01ch,0ech,048h,015h,040h,05ch,01ah,058h,01ch,02ch,00ch,00dh,075h,045h,04fh,073h,023h,01dh,03ah,03ah	; aba2  l.....H.@\.X.,..uEOs#.::
	defb 000h,003h,001h,040h,061h,040h,000h,045h,000h,021h,031h,021h,000h,001h,000h,07bh,0dbh,05bh,087h,0cfh,08dh,0e7h,0e6h,0e2h	; abba  ...@a@.E.!1!...{.[......
	defb 0a0h,0f0h,060h,041h,081h,081h,040h,0e0h,0c0h,0c1h,083h,081h,090h,0d0h,040h,0c7h,0fdh,0a5h,0d0h,0c1h,020h,069h,06ah,098h	; abd2  ..`A..@.......@..... ij.
	defb 01ah,03eh,017h,00ah,09ch,085h,05eh,05ch,048h,00ah,00eh,004h,006h,01ah,018h,08ch,0f8h,082h,05ch,0f1h,063h,0cdh,0f4h,036h	; abea  .>....^\H.........\.c..6
	defb 000h,003h,001h,040h,061h,040h,000h,045h,000h,001h,001h,001h,004h,011h,064h,033h,0fbh,04bh,087h,0cfh,08dh,0e7h,0e6h,0e2h	; ac02  ...@a@.E......d3.K......
	defb 0a0h,0f0h,060h,041h,081h,081h,040h,0e0h,0c0h,0c0h,080h,080h,09dh,0d1h,04fh,0c7h,0fbh,000h,0d0h,0c1h,020h,069h,06ah,098h	; ac1a  ..`A..@.......O..... ij.
	defb 01ah,03eh,017h,00ah,09ch,085h,05eh,05ch,048h,00ah,00eh,004h,046h,01ah,058h,00ch,0f8h,082h,05ch,0f1h,063h,0cdh,0f4h,036h	; ac32  .>....^\H...F.X...\.c..6
	defb 08eh,070h,01eh,0beh,0c0h,0bfh,0f5h,0c0h,0dfh,0c1h,0ebh,0c1h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,028h,000h	; ac4a  .p....................(.
	defb 001h,001h,01fh,0c1h,081h,0beh,06fh,000h,0ffh,0fch,046h,0fch,000h,0f2h,000h,000h,002h,000h,002h,007h,002h,007h,00ch,004h	; ac62  ......o...F.............

; ----------------------------------------------------------------------
; DATOS dibujo_AC7A: 34 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 1 de la lista 0x9302 (p00:4D92, p00:4DF5); lo leen p01:6E24
;   (816 bytes)
;   0xac7a..0xafaa  (816 bytes)
DATA_dibujo_AC7A:
	defb 000h,000h,000h,000h,000h,000h,007h,000h,000h,03ch,03bh,03bh,07ch,05fh,05fh,07eh,05bh,059h,07fh,059h,058h,07fh,058h,058h	; ac7a  .........<..|__~[Y.YX.XX
	defb 000h,000h,000h,000h,000h,000h,083h,082h,082h,07eh,081h,081h,02eh,0d1h,0d1h,01ch,0e3h,0e3h,03ch,0c3h,0c3h,0fch,003h,003h	; ac92  .........~........<.....
	defb 000h,000h,000h,0feh,080h,080h,09fh,078h,078h,03fh,0dch,0dch,03fh,0dch,0dch,03fh,0ceh,0ceh,01fh,0eeh,0eeh,01fh,0eeh,0eeh	; acaa  .......xx?..?..?........
	defb 000h,000h,004h,004h,000h,006h,082h,080h,082h,083h,080h,083h,0c1h,0c2h,0c1h,0c1h,040h,041h,0c1h,040h,041h,0c1h,040h,041h	; acc2  ................@A.@A.@A
	defb 07fh,058h,058h,07fh,04ch,04ch,07fh,06ch,06ch,07fh,07ch,07ch,07fh,076h,076h,0ffh,0d0h,0d0h,0f0h,0cfh,0cfh,078h,0c7h,047h	; acda  .XX.LL.ll.||.vv......x.G
	defb 0feh,001h,001h,0ffh,000h,000h,0ffh,000h,000h,0deh,021h,021h,084h,07bh,07bh,0c0h,03fh,03fh,0f0h,03fh,00fh,07dh,09fh,082h	; acf2  ..........!!.{{.??.?.}..
	defb 01eh,0e7h,0e7h,09fh,066h,066h,00fh,0f6h,0f6h,00fh,0f6h,0f6h,00fh,0f4h,0f4h,04fh,0f0h,0b0h,0dfh,0e0h,020h,01fh,06eh,0eeh	; ad0a  ....ff.........O.... .n.
	defb 0c1h,041h,041h,0c0h,041h,040h,040h,0e0h,0e0h,0a0h,050h,050h,091h,060h,061h,0d1h,028h,029h,0d3h,078h,07bh,092h,0f8h,0fbh	; ad22  .AA.A@@...PP.`a.().x{...
	defb 05fh,0e0h,060h,0b0h,0d7h,0d0h,040h,0a0h,000h,000h,0c0h,000h,00bh,08eh,00ch,000h,0d8h,040h,000h,061h,020h,06ch,008h,00ch	; ad3a  _.`...@..........@.a l..
	defb 03ch,0c7h,0c7h,0ffh,082h,082h,03ch,0e3h,020h,01eh,032h,012h,01eh,0b3h,012h,05fh,05bh,05bh,02fh,037h,023h,027h,03dh,0a9h	; ad52  <.....<. .2...._[[/7#'=.
	defb 0a1h,0e1h,061h,080h,0c0h,080h,014h,018h,008h,023h,021h,021h,040h,049h,040h,007h,083h,0a6h,05dh,0ffh,044h,0e6h,0dfh,005h	; ad6a  ..a......#!!@I@...].D...
	defb 03ah,0d8h,0dbh,0fah,008h,00bh,07ah,08ch,00bh,0fah,08ch,08bh,078h,09ch,099h,0f8h,01ch,019h,0e9h,01ch,009h,0e9h,01eh,009h	; ad82  :.....z.....x...........
	defb 06fh,01bh,018h,07ch,097h,004h,06fh,0f9h,071h,036h,0ffh,03ah,03bh,03fh,03ch,01fh,01bh,018h,00eh,04dh,00dh,04fh,06ch,04ch	; ad9a  o..|..o.q6.:.?<....M.OlL
	defb 057h,0fch,0b8h,0f7h,0ach,088h,0ffh,0cch,088h,0fbh,0c6h,004h,0aah,0d7h,045h,009h,0fch,0ceh,049h,0b4h,096h,0fdh,068h,06ah	; adb2  W.............E...I...hj
	defb 05eh,0f3h,091h,024h,0ffh,0c7h,01dh,0ffh,0e2h,043h,0bch,0bch,037h,0c8h,0c8h,0dfh,060h,060h,079h,0b7h,0b7h,07fh,093h,093h	; adca  ^..$.....C..7...``y.....
	defb 06dh,09eh,08dh,0ech,0beh,02ch,0c8h,06eh,048h,08ch,06eh,00ch,08ch,0deh,08ch,01ch,0beh,01ch,03ch,0feh,03ch,0fch,0feh,0fch	; ade2  m....,.nH.n.......<.<...
	defb 047h,074h,044h,007h,03ch,004h,027h,01ch,004h,027h,03eh,026h,017h,00eh,006h,013h,00fh,003h,003h,00fh,003h,001h,007h,001h	; adfa  GtD.<.'..'>&............
	defb 0e6h,0feh,0e6h,0e0h,0a2h,0a0h,0e1h,0b1h,081h,0c3h,07eh,032h,0beh,06bh,069h,0f2h,05fh,05dh,0cch,057h,044h,0c0h,068h,040h	; ae12  ..........~2.ki._].WD.h@
	defb 07bh,06dh,04dh,0dbh,07ch,02ch,00dh,0feh,0f6h,0e5h,0deh,0deh,0f7h,06ah,06ah,097h,0fah,072h,007h,08bh,003h,028h,03eh,039h	; ae2a  {mM.|,.......jj..r...(>9
	defb 0fdh,0feh,0fdh,0f9h,0fch,0f9h,0fah,0fch,0fah,0f2h,0f8h,0f2h,0e4h,070h,064h,0c9h,060h,049h,000h,0c4h,011h,060h,00eh,0e1h	; ae42  .............pd.`I...`..
	defb 000h,003h,000h,000h,001h,000h,000h,000h,000h,001h,000h,001h,001h,000h,003h,002h,000h,006h,002h,000h,006h,001h,000h,00fh	; ae5a  ........................
	defb 0f7h,0cbh,0cbh,064h,0dfh,043h,030h,0fch,030h,00ch,077h,014h,03fh,06fh,020h,01dh,036h,012h,00fh,01fh,00fh,000h,000h,000h	; ae72  ...d.C0.0.w.?o .6.......
	defb 0deh,0afh,0a6h,043h,0fdh,0cdh,017h,02bh,00bh,07eh,0e3h,042h,08ch,0f2h,070h,0fch,004h,004h,0e0h,0f8h,0e0h,000h,000h,000h	; ae8a  ...C...+.~.B..p.........
	defb 004h,0ceh,005h,00eh,098h,00bh,00ch,018h,00fh,01ch,030h,017h,019h,030h,01fh,039h,020h,02fh,033h,060h,03fh,073h,0e0h,07fh	; aea2  ..........0..0.9 /3`?s..
	defb 05fh,0e0h,060h,0b0h,0d7h,0d0h,040h,0a0h,000h,000h,0c0h,000h,00bh,08eh,00ch,006h,0d9h,041h,007h,067h,027h,068h,008h,008h	; aeba  _.`...@..........A.g'h..
	defb 03ch,0c7h,0c7h,0ffh,082h,082h,03ch,0e3h,020h,01eh,032h,012h,01eh,0b3h,012h,05fh,05bh,05bh,0afh,0b7h,0a3h,027h,03dh,029h	; aed2  <.....<. .2...._[[...'=)
	defb 0a1h,0e1h,061h,080h,0c0h,080h,014h,018h,008h,037h,039h,009h,044h,07dh,07ch,003h,0a3h,082h,05dh,0dfh,044h,0e6h,0dfh,005h	; aeea  ..a......79.D}|...].D...
	defb 05fh,0e0h,060h,0b0h,0d7h,0d0h,040h,0a0h,000h,000h,0c0h,000h,00bh,08eh,00ch,000h,0d8h,040h,000h,060h,022h,06eh,008h,00eh	; af02  _.`...@..........@.`"n..
	defb 03ch,0c7h,0c7h,0ffh,082h,082h,03ch,0e3h,020h,01eh,032h,012h,01eh,0b3h,012h,05fh,05bh,05bh,02fh,0b7h,023h,027h,03dh,029h	; af1a  <.....<. .2...._[[/.#'=)
	defb 0a1h,0e1h,061h,080h,0c0h,080h,014h,018h,008h,023h,021h,021h,040h,045h,050h,013h,08bh,0b2h,05dh,0ffh,044h,0e6h,0dfh,005h	; af32  ..a......#!!@EP...].D...
	defb 0e6h,0feh,0e6h,0e0h,0a2h,0a0h,0e1h,0b1h,081h,0c3h,07eh,032h,0beh,06bh,069h,0f0h,05fh,05fh,0c8h,05ch,048h,0c0h,060h,040h	; af4a  ..........~2.ki.__.\H.`@
	defb 07bh,06dh,04dh,0dbh,07ch,02ch,00dh,0feh,0f6h,0e5h,0deh,0deh,0f7h,06ah,06ah,017h,0fah,0f2h,007h,00bh,003h,018h,01eh,019h	; af62  {mM.|,.......jj.........
	defb 0f3h,0d8h,0d3h,067h,0dbh,043h,036h,0ffh,035h,008h,074h,010h,03fh,06fh,020h,01dh,036h,012h,00fh,01fh,00fh,000h,000h,000h	; af7a  ...g.C6.5.t.?o .6.......
	defb 0beh,06fh,0a6h,0abh,055h,045h,05fh,0bbh,09bh,01eh,033h,012h,08ch,0f2h,070h,0fch,004h,004h,0e0h,0f8h,0e0h,000h,000h,000h	; af92  .o..UE_...3...p.........

; ----------------------------------------------------------------------
; DATOS dibujo_AFAA: 38 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 1 de la lista 0x93A6 (p00:4D92, p00:4DF5); se solapan 2
;   bloques: (dibujo_AFAA AFAA-B412); lo leen p01:6E24 (1128 bytes)
;   0xafaa..0xb412  (1128 bytes)
DATA_dibujo_AFAA:
	defb 030h,058h,010h,023h,0b4h,020h,047h,0ebh,040h,00fh,0d7h,000h,01fh,0a7h,000h,02eh,09eh,011h,02ch,09ch,013h,028h,038h,037h	; afaa  0X.#. G.@.........,..(87
	defb 000h,000h,000h,0ffh,0efh,00fh,0ffh,0ffh,000h,0ffh,0ffh,000h,00fh,00fh,0f0h,000h,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh	; afc2  ........................
	defb 007h,005h,005h,0f3h,00ch,00ch,0fch,0ffh,003h,0feh,0ffh,001h,0ffh,0ffh,000h,07fh,07fh,080h,003h,003h,0fch,00fh,00fh,0f0h	; afda  ........................
	defb 030h,02fh,020h,0c1h,05ah,040h,0e6h,025h,024h,021h,0c7h,0c1h,0b6h,0d7h,056h,095h,0e7h,065h,0c6h,0f6h,036h,0c0h,0f1h,030h	; aff2  0/ .Z@.%$!....V..e..6..0
	defb 00fh,07fh,030h,050h,07fh,06fh,040h,07bh,070h,052h,07eh,07eh,076h,02fh,029h,070h,038h,030h,071h,010h,011h,040h,035h,020h	; b00a  ..0P.o@{pR~~v/)p80q..@5
	defb 080h,080h,07fh,0e0h,0e0h,01fh,07fh,0ffh,080h,03fh,03fh,000h,01fh,09fh,000h,02fh,07fh,030h,01fh,03fh,010h,00fh,05fh,080h	; b022  .........??..../.0.?.._.
	defb 03fh,03fh,0c0h,0e0h,0efh,01fh,0c2h,0cfh,022h,08fh,0cbh,008h,090h,0b5h,010h,060h,0a0h,0a0h,0c4h,040h,044h,0d0h,058h,043h	; b03a  ??......"......`...@D.XC
	defb 080h,0f3h,070h,008h,0f1h,0f0h,08ch,0f1h,0b0h,0bch,0e0h,060h,078h,094h,094h,072h,0feh,07eh,072h,06eh,06eh,034h,02ah,028h	; b052  ..p........`x..r.~rnn4*(
	defb 044h,024h,023h,051h,03ah,020h,037h,07dh,04dh,0f9h,07eh,006h,0ach,0efh,053h,0a7h,0e7h,058h,0b3h,073h,04ch,0d0h,070h,02fh	; b06a  D$#Q: 7}M.~...S..X.sL.p/
	defb 066h,05fh,0a9h,0d6h,0dfh,069h,042h,0bbh,03dh,092h,07bh,06dh,022h,0fbh,0ddh,0c6h,0ffh,039h,0c2h,0ffh,03dh,047h,07fh,0b8h	; b082  f_...iB.=.{m"....9..=G..
	defb 0e2h,022h,01ch,09bh,05dh,069h,017h,098h,0e8h,044h,0cbh,0bbh,079h,0ffh,086h,07fh,0ffh,080h,070h,0f0h,08fh,030h,0f0h,0cfh	; b09a  ."..]i...D..y.....p..0..
	defb 064h,09ah,018h,086h,07ah,07ah,032h,0feh,0ceh,0fah,0ffh,006h,09ah,09eh,066h,01ah,01eh,0e6h,030h,03ch,0cch,075h,07bh,089h	; b0b2  d...zz2.......f...0<.u{.
	defb 058h,0f8h,027h,069h,0b9h,016h,06dh,09dh,012h,076h,08eh,009h,033h,04fh,00ch,03bh,017h,014h,039h,01fh,01eh,01dh,00bh,00ah	; b0ca  X.'i..m..v..3O....9.....
	defb 0c2h,0fah,03dh,0c1h,0f9h,03eh,0dfh,0f2h,020h,0d7h,0e4h,024h,0f1h,0feh,010h,0fbh,0feh,00ah,0fdh,0ffh,003h,0eeh,0e7h,011h	; b0e2  ..=..>.. ..$............
	defb 038h,0f8h,0c7h,038h,0f8h,0c7h,0ddh,03dh,022h,03fh,05fh,040h,06fh,09fh,090h,0ffh,00fh,000h,0ffh,00fh,000h,0dfh,03fh,020h	; b0fa  8..8...="?_@o.........?
	defb 065h,07bh,099h,0edh,0f3h,011h,0cdh,0f6h,034h,0ddh,0eah,028h,09ch,0eah,068h,03ch,0dah,0d8h,038h,0deh,0d8h,038h,0d4h,0d0h	; b112  e{......4..(..h<..8..8..
	defb 01eh,00dh,00dh,01eh,045h,005h,08eh,0c1h,081h,006h,0c9h,009h,082h,095h,085h,006h,033h,003h,007h,032h,006h,02bh,033h,02bh	; b12a  ....E...........3..2.+3+
	defb 0dfh,0cch,02ch,0a3h,0e8h,062h,038h,0dfh,0c7h,017h,0efh,0e8h,01fh,0f0h,0f0h,08fh,0ffh,07fh,044h,0fbh,0b8h,0a4h,07ch,05bh	; b142  ..,..b8...........D...|[
	defb 0f6h,0cfh,0c9h,01ah,037h,095h,0d0h,0efh,02fh,024h,0dfh,0dbh,0edh,07eh,072h,0d9h,0feh,0e6h,0c0h,0bfh,0bfh,001h,03eh,0feh	; b15a  ....7.../$...~r.......>.
	defb 038h,0d0h,0d0h,030h,0c8h,0c0h,072h,08ah,082h,0e1h,010h,000h,0e0h,030h,020h,0c2h,071h,040h,0a4h,077h,024h,066h,0f3h,062h	; b172  8..0..r......0 .q@.w$f.b
	defb 0c9h,00dh,0c9h,0bch,032h,0bch,094h,0e2h,09ch,0e4h,0c0h,0fch,08ch,040h,03ch,0c4h,000h,07ch,0e7h,001h,07fh,0c1h,0c0h,0dfh	; b18a  ....2........@<..|......
	defb 0c7h,0b7h,0b8h,0e8h,0d8h,0d7h,038h,027h,027h,01fh,013h,013h,000h,01fh,000h,000h,00ch,000h,000h,027h,000h,087h,097h,087h	; b1a2  ......8''..........'....
	defb 0e6h,0f9h,018h,0cdh,0f3h,031h,01bh,0e6h,0e2h,0f5h,08eh,084h,00bh,0fdh,009h,036h,0ffh,036h,0ech,0feh,0ech,0fdh,0f0h,0f1h	; b1ba  .....1.........6.6......
	defb 0ech,0afh,0ach,0cch,02bh,008h,0deh,063h,052h,087h,0cfh,08fh,0c6h,08bh,0eah,04bh,017h,067h,08bh,01dh,0cdh,089h,00fh,0cfh	; b1d2  ....+..cR......K.g......
	defb 00fh,07fh,030h,050h,07fh,06fh,040h,07bh,070h,052h,07eh,07eh,076h,02fh,029h,070h,038h,030h,071h,012h,010h,043h,034h,020h	; b1ea  ..0P.o@{pR~~v/)p80q..C4
	defb 080h,080h,07fh,0e0h,0e0h,01fh,07fh,0ffh,080h,03fh,03fh,000h,01fh,09fh,000h,02fh,07fh,030h,01fh,03fh,010h,08fh,09fh,080h	; b202  .........??..../.0.?....
	defb 03fh,03fh,0c0h,0e0h,0efh,01fh,0c2h,0cfh,022h,08fh,0cbh,008h,090h,0b5h,010h,060h,0a0h,0a0h,0c8h,05eh,04ch,0cah,047h,046h	; b21a  ??......"......`...^L.GF
	defb 040h,020h,020h,051h,03ah,020h,037h,07dh,04dh,0f9h,07eh,006h,0ach,0efh,053h,0a7h,0e7h,058h,0b3h,073h,04ch,0d0h,070h,02fh	; b232  @  Q: 7}M.~...S..X.sL.p/
	defb 006h,01fh,009h,0d6h,0dfh,069h,042h,0bbh,03dh,092h,07bh,06dh,022h,0fbh,0ddh,0c6h,0ffh,039h,0c2h,0ffh,03dh,047h,07fh,0b8h	; b24a  .....iB.=.{m"....9..=G..
	defb 0e0h,020h,000h,09bh,05dh,069h,017h,098h,0e8h,044h,0cbh,0bbh,079h,0ffh,086h,07fh,0ffh,080h,070h,0f0h,08fh,030h,0f0h,0cfh	; b262  . ..]i...D..y.....p..0..
	defb 00fh,07fh,030h,050h,07fh,06fh,040h,07bh,070h,052h,07eh,07eh,076h,02fh,029h,070h,038h,030h,070h,010h,010h,040h,034h,022h	; b27a  ..0P.o@{pR~~v/)p80p..@4"
	defb 080h,080h,07fh,0e0h,0e0h,01fh,07fh,0ffh,080h,03fh,03fh,000h,01fh,09fh,000h,02fh,07fh,030h,01fh,03fh,010h,08fh,05fh,080h	; b292  .........??..../.0.?.._.
	defb 03fh,03fh,0c0h,0e0h,0efh,01fh,0c2h,0cfh,022h,08fh,0cbh,008h,090h,0b5h,010h,060h,0a0h,0a0h,0c0h,040h,040h,0c2h,040h,05ah	; b2aa  ??......"......`...@@.@Z
	defb 044h,025h,022h,051h,03ah,020h,037h,07dh,04dh,0f9h,07eh,006h,0ach,0efh,053h,0a7h,0e7h,058h,0b3h,073h,04ch,0d0h,070h,02fh	; b2c2  D%"Q: 7}M.~...S..X.sL.p/
	defb 066h,05fh,029h,0d6h,0dfh,069h,042h,0bbh,03dh,092h,07bh,06dh,022h,0fbh,0ddh,0c6h,0ffh,039h,0c2h,0ffh,03dh,047h,07fh,0b8h	; b2da  f_)..iB.=.{m"....9..=G..
	defb 0ech,02eh,014h,09bh,05dh,069h,017h,098h,0e8h,044h,0cbh,0bbh,079h,0ffh,086h,07fh,0ffh,080h,070h,0f0h,08fh,030h,0f0h,0cfh	; b2f2  ....]i...D..y.....p..0..
	defb 0dfh,0cch,02ch,0a4h,0e0h,067h,030h,0c8h,0c0h,01fh,0e7h,0e7h,017h,0efh,0e8h,09ch,0fbh,07bh,047h,0ffh,0b7h,0a0h,07fh,058h	; b30a  ..,..g0..........{G....X
	defb 0f6h,0cfh,0c9h,09ah,037h,095h,050h,06fh,06fh,0a4h,0ffh,0dbh,0adh,0deh,052h,079h,0beh,0a6h,0e0h,0dfh,0dfh,0c1h,03eh,03eh	; b322  ....7.Poo.....Ry......>>
	defb 00fh,07fh,030h,050h,07fh,06fh,040h,07bh,070h,052h,07eh,07eh,076h,02fh,029h,070h,038h,030h,070h,010h,010h,042h,034h,020h	; b33a  ..0P.o@{pR~~v/)p80p..B4
	defb 046h,025h,020h,051h,03ah,020h,037h,07dh,04dh,0f9h,07eh,006h,0ach,0efh,053h,0a7h,0e7h,058h,0b3h,073h,04ch,0d0h,070h,02fh	; b352  F% Q: 7}M.~...S..X.sL.p/
	defb 03fh,03fh,0c0h,0e0h,0efh,01fh,0c2h,0cfh,022h,08fh,0cbh,008h,090h,0b5h,010h,060h,0a0h,0a0h,0c0h,040h,040h,0dah,040h,042h	; b36a  ??......"......`...@@.@B
	defb 0fch,02eh,004h,09bh,05dh,069h,017h,098h,0e8h,044h,0cbh,0bbh,079h,0ffh,086h,07fh,0ffh,080h,070h,0f0h,08fh,030h,0f0h,0cfh	; b382  ....]i...D..y.....p..0..
	defb 080h,080h,07fh,0e0h,0e0h,01fh,07fh,0ffh,080h,03fh,03fh,000h,01fh,09fh,000h,02fh,07fh,030h,01fh,03fh,010h,08fh,05fh,000h	; b39a  .........??..../.0.?.._.
	defb 03fh,03fh,0c0h,0e0h,0efh,01fh,0c2h,0cfh,022h,08fh,0cbh,008h,090h,0b5h,010h,060h,0a0h,0a0h,0c4h,040h,044h,0d3h,058h,040h	; b3b2  ??......"......`...@D.X@
	defb 047h,024h,020h,051h,03ah,020h,037h,07dh,04dh,0f9h,07eh,006h,0ach,0efh,053h,0a7h,0e7h,058h,0b3h,073h,04ch,0d0h,070h,02fh	; b3ca  G$ Q: 7}M.~...S..X.sL.p/
	defb 0e6h,05fh,029h,0d6h,0dfh,069h,042h,0bbh,03dh,092h,07bh,06dh,022h,0fbh,0ddh,0c6h,0ffh,039h,0c2h,0ffh,03dh,047h,07fh,0b8h	; b3e2  ._)..iB.=.{m"....9..=G..
	defb 0feh,022h,000h,09bh,05dh,069h,017h,098h,0e8h,044h,0cbh,0bbh,079h,0ffh,086h,07fh,0ffh,080h,070h,0f0h,08fh,030h,0f0h,0cfh	; b3fa  ."..]i...D..y.....p..0..

; ----------------------------------------------------------------------
; DATOS dibujo_B412: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 1 de la lista 0x93CB (p00:4D92, p00:4DF5); lo leen p01:6E24
;   (16 bytes)
;   0xb412..0xb422  (16 bytes)
DATA_dibujo_B412:
	defb 002h,001h,001h,000h,000h,000h,000h,000h,001h,001h,002h,002h,004h,004h,008h,008h	; b412  ................

; ----------------------------------------------------------------------
; DATOS dibujo_B422: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 2 de la lista 0x93CB (p00:4D92, p00:4DF5); lo leen p01:6E24
;   (16 bytes)
;   0xb422..0xb432  (16 bytes)
DATA_dibujo_B422:
	defb 0e9h,016h,040h,0bfh,000h,0ffh,003h,0ffh,08fh,07fh,0beh,0beh,0f0h,0f0h,000h,000h	; b422  ..@.............

; ----------------------------------------------------------------------
; DATOS dibujo_B432: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 3 de la lista 0x93CB (p00:4D92, p00:4DF5); lo leen p01:6E24
;   (16 bytes)
;   0xb432..0xb442  (16 bytes)
DATA_dibujo_B432:
	defb 080h,058h,080h,000h,001h,061h,001h,0c1h,003h,003h,007h,007h,00eh,00eh,01ch,01ch	; b432  .X...a..........

; ----------------------------------------------------------------------
; DATOS dibujo_B442: 26 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 4 de la lista 0x93CB (p00:4D92, p00:4DF5); lo leen p01:6E24
;   (624 bytes)
;   0xb442..0xb6b2  (624 bytes)
DATA_dibujo_B442:
	defb 06fh,057h,050h,05fh,032h,032h,0aeh,0ffh,0f1h,08dh,07fh,072h,0b5h,06eh,06ah,00fh,0f8h,008h,05fh,0feh,062h,0e2h,09fh,09dh	; b442  oWP_22.....r.nj..._.b...
	defb 0aeh,0f3h,052h,0b8h,0c6h,045h,03ah,0ceh,0c1h,074h,093h,083h,0c7h,0a8h,028h,0dch,034h,013h,069h,0bah,0b6h,09bh,07dh,024h	; b45a  ..R..E:..t....(.4.i...}$
	defb 0fch,07fh,003h,04ch,07fh,0b3h,07fh,0a0h,0a0h,0fdh,07eh,042h,04eh,07fh,0b1h,0a0h,0d1h,041h,0e0h,008h,000h,040h,042h,080h	; b472  ...L......~BN....A...@B.
	defb 0deh,023h,022h,0fah,005h,004h,0e5h,01bh,01bh,0ffh,0c1h,0c1h,0ffh,062h,062h,07fh,0afh,0afh,0bdh,0d7h,0d5h,0beh,0c7h,0c6h	; b48a  .#"..........bb.........
	defb 04eh,0fbh,04bh,073h,09dh,00dh,04dh,0f6h,072h,01eh,012h,010h,005h,000h,000h,001h,071h,001h,040h,081h,000h,080h,081h,080h	; b4a2  N.Ks..M.r.......q.@.....
	defb 0ceh,0f2h,071h,07ch,08ch,002h,0f0h,0d8h,0c8h,021h,079h,091h,0f3h,0dfh,053h,0aeh,07fh,06eh,0e8h,0b6h,0a0h,0fch,0dbh,0d8h	; b4ba  ..q|.....!y...S..n......
	defb 00bh,005h,005h,033h,02eh,02ch,07dh,07bh,07ah,08fh,0d4h,094h,001h,003h,001h,001h,025h,009h,096h,05bh,076h,0ceh,083h,03bh	; b4d2  ...3.,}{z.......%..[v...
	defb 05ah,0e7h,026h,063h,0ffh,0dfh,013h,0fdh,0edh,0abh,0efh,057h,083h,065h,07dh,0c5h,0f6h,0fah,0ach,07fh,073h,035h,04eh,0cah	; b4ea  Z.&c.......W.e}.....s5N.
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,001h,000h,001h,002h,000h,007h,04dh,005h,033h,05fh,00fh,07bh,06dh,065h	; b502  ................M.3_.{me
	defb 0fbh,0ddh,0ddh,05fh,0efh,069h,06ch,0ffh,05eh,06fh,0fah,05ah,06eh,0f9h,059h,0deh,0a1h,0a1h,0dfh,023h,023h,0e7h,079h,019h	; b51a  ..._.il.^o.Zn.Y....##.y.
	defb 036h,0fch,039h,09ch,0fah,09bh,051h,0b3h,02eh,07ah,0cfh,045h,03ch,0e6h,0e3h,098h,0bch,07fh,027h,0bfh,0d9h,097h,0ddh,0e9h	; b532  6.9...Q..z.E<.....'.....
	defb 075h,01eh,09ah,0b5h,0eeh,06ah,0b8h,0eah,067h,068h,01ah,097h,056h,074h,0e9h,0cah,0ech,0f5h,0e4h,09ah,09bh,0fbh,057h,014h	; b54a  u....j..gh..Vt........W.
	defb 077h,069h,069h,03dh,063h,023h,03fh,033h,031h,01eh,033h,010h,01ah,01fh,01ch,009h,01fh,00fh,00dh,01bh,00ah,006h,01bh,001h	; b562  wii=c#?31.3.............
	defb 02dh,0beh,0d2h,013h,09ch,0ech,089h,079h,079h,073h,057h,055h,003h,09fh,007h,006h,0bdh,009h,080h,0f7h,0a4h,0c0h,026h,000h	; b57a  -......yysWU..........&.
	defb 0ebh,0ach,094h,093h,0fch,0ach,08bh,0fdh,0d5h,027h,0fch,068h,05ah,097h,0b5h,06dh,0eah,09ah,07fh,05dh,00ch,01eh,0cch,045h	; b592  .........'.hZ..m...]...E
	defb 0bch,0d4h,053h,0f2h,02ah,02dh,0f8h,008h,007h,0e4h,0b4h,0bbh,0f0h,0d0h,0cfh,0e8h,068h,057h,024h,0a4h,0dbh,0d0h,0d0h,02fh	; b5aa  ..S.*-..........hW$..../
	defb 005h,00eh,006h,007h,00ch,005h,006h,00ch,004h,001h,004h,005h,006h,004h,002h,006h,006h,000h,002h,000h,006h,001h,000h,003h	; b5c2  ........................
	defb 080h,048h,080h,02fh,03eh,036h,000h,066h,000h,00ah,01dh,015h,01eh,02fh,00fh,004h,069h,000h,0c0h,0ffh,04ah,0fbh,0f2h,032h	; b5da  .H./>6.f...../..i...J..2
	defb 01dh,045h,016h,04eh,086h,08dh,002h,066h,005h,0abh,0b9h,058h,07eh,03eh,0b5h,025h,0deh,01bh,04ah,0beh,035h,03ah,0fah,0c5h	; b5f2  .E.N...f...X~>.%..J.5:..
	defb 020h,0a0h,0dfh,080h,080h,07fh,000h,000h,0ffh,000h,000h,0ffh,001h,000h,0ffh,001h,000h,0ffh,082h,000h,0beh,06ch,000h,0fch	; b60a   ....................l..
	defb 079h,040h,080h,0b3h,02dh,0dah,0ffh,071h,08eh,0eeh,02ah,0d5h,065h,020h,05fh,079h,000h,07fh,03fh,000h,03fh,000h,000h,000h	; b622  y@..-..q..*.e _y..?.?...
	defb 00bh,005h,005h,033h,02eh,02ch,07dh,07bh,07ah,08fh,0d4h,094h,001h,003h,001h,019h,03dh,019h,02ch,0d7h,014h,010h,07bh,011h	; b63a  ...3.,}{z.......=.,...{.
	defb 006h,084h,001h,09ch,0fah,09bh,051h,0b3h,02eh,07ah,0cfh,045h,03ch,0e6h,0e3h,098h,0bch,07fh,027h,0bfh,0d9h,097h,0ddh,0e9h	; b652  ......Q..z.E<.....'.....
	defb 00bh,005h,005h,033h,02eh,02ch,07dh,07bh,07ah,08fh,0d4h,094h,001h,003h,001h,005h,011h,02dh,0d6h,067h,04ah,0eeh,08bh,033h	; b66a  ...3.,}{z........-.gJ..3
	defb 080h,048h,080h,02fh,03eh,036h,000h,060h,000h,000h,010h,000h,03ah,02eh,025h,01dh,07bh,01ah,0c0h,0f1h,040h,0fbh,0f2h,032h	; b682  .H./>6.`....:.%.{...@..2
	defb 01dh,045h,016h,04eh,086h,08dh,002h,066h,005h,06bh,0b9h,018h,0feh,0beh,035h,0a5h,05eh,01bh,04ah,0beh,035h,03ah,0fah,0c5h	; b69a  .E.N...f.k....5.^.J.5:..

; ----------------------------------------------------------------------
; DATOS dibujo_B6B2: 3 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 1 de la lista 0x93B1 (p00:4D92, p00:4DF5); lo leen p01:6E24
;   (48 bytes)
;   0xb6b2..0xb6e2  (48 bytes)
DATA_dibujo_B6B2:
	defb 0feh,0fbh,07fh,0fbh,03fh,03dh,0cfh,07dh,0efh,07dh,0dfh,0fdh,0bdh,0fah,0fch,0ebh	; b6b2  ....?=.}.}......
	defb 0d8h,0fch,0c0h,0fch,0e0h,078h,0e0h,070h,0c0h,061h,080h,043h,081h,0c3h,001h,083h	; b6c2  .....x.p.a.C....
	defb 0fch,05eh,0e8h,0fch,000h,0f8h,000h,0f0h,000h,000h,000h,000h,000h,011h,000h,023h	; b6d2  .^.............#

; ----------------------------------------------------------------------
; DATOS dibujo_B6E2: 3 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 2 de la lista 0x93B1 (p00:4D92, p00:4DF5); lo leen p01:6E24
;   (72 bytes)
;   0xb6e2..0xb72a  (72 bytes)
DATA_dibujo_B6E2:
	defb 000h,070h,030h,041h,084h,000h,000h,099h,018h,000h,00bh,001h,020h,057h,001h,040h,0b1h,02fh,000h,0d1h,03fh,030h,0d1h,06eh	; b6e2  .p0A........ W.@./..?0.n
	defb 080h,047h,001h,004h,011h,000h,024h,010h,010h,024h,041h,001h,024h,00bh,0d0h,002h,021h,0fch,000h,020h,0dfh,000h,017h,0ech	; b6fa  .G....$..$A.$...!.. ....
	defb 000h,030h,000h,000h,091h,000h,000h,043h,000h,000h,0b0h,010h,000h,0cch,084h,000h,07bh,0c2h,000h,0e5h,019h,0d0h,02fh,02eh	; b712  .0.....C........{...../.

; ----------------------------------------------------------------------
; DATOS dibujo_B72A: 2 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 3 de la lista 0x93B1 (p00:4D92, p00:4DF5); lo leen p01:6E24
;   (48 bytes)
;   0xb72a..0xb75a  (48 bytes)
DATA_dibujo_B72A:
	defb 001h,000h,000h,001h,000h,000h,000h,001h,000h,003h,003h,003h,004h,006h,006h,00ah,00eh,00eh,014h,01ch,01ch,03ch,03ch,03ch	; b72a  .....................<<<
	defb 002h,005h,003h,005h,00bh,007h,00bh,013h,00fh,01bh,007h,017h,016h,02eh,01eh,00ch,05ch,01ch,019h,0b9h,039h,031h,073h,073h	; b742  ................\...91ss

; ----------------------------------------------------------------------
; DATOS dibujo_B75A: 25 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 4 de la lista 0x93B1 (p00:4D92, p00:4DF5); lo leen p01:6E24
;   (600 bytes)
;   0xb75a..0xb9b2  (600 bytes)
DATA_dibujo_B75A:
	defb 020h,07ch,020h,011h,07fh,011h,081h,0a5h,081h,0c6h,05eh,046h,06ch,0bch,02ch,001h,062h,000h,002h,09ch,000h,011h,093h,011h	; b75a   | .......^Fl.,.b.......
	defb 019h,0dfh,065h,0beh,0afh,0c6h,06fh,07fh,0afh,0c7h,0e2h,042h,003h,085h,001h,000h,013h,000h,000h,001h,000h,080h,090h,080h	; b772  ..e...o....B............
	defb 0fbh,09fh,09bh,077h,0ffh,077h,0bch,0ffh,0bch,070h,0fch,070h,060h,0f8h,060h,000h,0e2h,000h,040h,0c0h,040h,0e0h,030h,020h	; b78a  ...w.w...p.p`.`...@.@.0
	defb 0fbh,0eeh,0e4h,0c5h,0bfh,0bah,008h,0f4h,007h,000h,00fh,003h,003h,006h,002h,005h,01eh,004h,007h,0a6h,006h,030h,063h,0b1h	; b7a2  .....................0c.
	defb 08ch,05dh,00ch,048h,094h,080h,084h,0cah,040h,060h,064h,0a0h,0a1h,0b5h,041h,083h,092h,062h,033h,0f1h,0d1h,055h,067h,0a2h	; b7ba  .].H....@`d...A..b3..Ug.
	defb 000h,048h,010h,06ch,0b6h,014h,0e0h,055h,000h,01eh,0adh,0ech,02fh,037h,0d6h,02eh,0beh,0ddh,0feh,032h,001h,0e8h,0b6h,097h	; b7d2  .H.l...U..../7.....2....
	defb 0e8h,07bh,068h,0f4h,0fdh,074h,0feh,0efh,06eh,0bfh,0e7h,027h,0ffh,062h,062h,053h,0feh,06eh,0cbh,0efh,0f7h,0dbh,0fdh,0e9h	; b7ea  .{h..t..n..'.bbS.n......
	defb 0fbh,0cfh,0cbh,01eh,071h,011h,0ebh,095h,094h,032h,0fch,03dh,0bdh,0e1h,0a2h,0ffh,0dfh,0d9h,09fh,07fh,01fh,086h,07fh,006h	; b802  ....q....2.=............
	defb 07fh,0d4h,090h,0bch,09fh,05ah,0bdh,0fah,07ah,0fdh,0bah,03ah,0fdh,0f2h,0f2h,0fbh,0f4h,0f4h,073h,0edh,06dh,0f7h,0e9h,0e9h	; b81a  .....Z..z..:......s.m...
	defb 0f5h,0dfh,0dah,067h,076h,07ah,034h,02fh,02ch,01ch,026h,004h,015h,02fh,004h,023h,03fh,020h,010h,01ch,017h,015h,01dh,013h	; b832  ...gvz4/,.&../.#? ......
	defb 0fdh,047h,045h,071h,0adh,0adh,0c4h,0f2h,0c0h,002h,0c7h,002h,01eh,005h,005h,01fh,0beh,09eh,0bfh,0efh,0afh,045h,0bbh,021h	; b84a  .GEq.................E.!
	defb 0c0h,0bfh,080h,0e0h,0d7h,0c0h,0f9h,0ebh,0e9h,07ch,0f5h,074h,07eh,0f3h,072h,03eh,0fbh,0bah,0beh,07bh,07ah,0feh,07bh,07ah	; b862  .........|.t~.r>...{z.{z
	defb 077h,089h,009h,0e7h,099h,099h,0c7h,079h,079h,0c6h,07bh,07ah,0eeh,093h,092h,06ch,0b7h,034h,07ch,0e6h,064h,09ch,0f6h,094h	; b87a  w......yy.{z...l.4|.d...
	defb 00ah,007h,002h,00ch,006h,004h,005h,007h,005h,000h,007h,001h,004h,007h,004h,002h,002h,002h,002h,003h,002h,002h,003h,002h	; b892  ........................
	defb 002h,065h,000h,001h,003h,001h,0beh,0cfh,04eh,0e1h,0ffh,061h,001h,001h,001h,000h,000h,000h,000h,0f3h,000h,0afh,0b3h,0d3h	; b8aa  .e......N..a............
	defb 047h,078h,0b8h,023h,07fh,0e3h,0c0h,061h,040h,000h,040h,000h,000h,000h,000h,000h,004h,000h,000h,002h,000h,000h,001h,000h	; b8c2  Gx.#...a@.@.............
	defb 019h,0dfh,065h,0beh,0afh,0c6h,06fh,07fh,0afh,0c7h,0e2h,042h,003h,085h,001h,000h,013h,000h,000h,001h,000h,088h,098h,088h	; b8da  ..e...o....B............
	defb 0fbh,0eeh,0e4h,0c5h,0bfh,0bah,008h,0f4h,007h,000h,00fh,003h,003h,006h,002h,005h,01eh,004h,067h,0f6h,066h,0b0h,0dbh,0d1h	; b8f2  ..................g.f...
	defb 018h,04ch,008h,060h,0b0h,020h,0e0h,055h,000h,01eh,0adh,0ech,02fh,037h,0d6h,02eh,0beh,0ddh,0feh,032h,001h,0e8h,0b6h,097h	; b90a  .L.`. .U..../7.....2....
	defb 0e8h,07ah,068h,0f4h,0fdh,074h,0feh,0efh,06eh,0bfh,0e7h,027h,0ffh,062h,062h,053h,0feh,06eh,0cbh,0efh,0f7h,0dbh,0fdh,0e9h	; b922  .zh..t..n..'.bbS.n......
	defb 003h,01fh,003h,01eh,071h,011h,0ebh,095h,094h,032h,0fch,03dh,0bdh,0e1h,0a2h,0ffh,0dfh,0d9h,09fh,07fh,01fh,086h,07fh,006h	; b93a  ....q....2.=............
	defb 0fbh,0eeh,0e4h,0c5h,0bfh,0bah,008h,0f4h,007h,000h,00fh,003h,003h,006h,002h,005h,01eh,004h,027h,046h,026h,010h,083h,071h	; b952  ..................'F&..q
	defb 004h,050h,00ch,06ch,0b6h,014h,0e0h,055h,000h,01eh,0adh,0ech,02fh,037h,0d6h,02eh,0beh,0ddh,0feh,032h,001h,0e8h,0b6h,097h	; b96a  .P.l...U..../7.....2....
	defb 00ah,007h,002h,00ch,004h,004h,004h,007h,004h,000h,007h,001h,004h,006h,004h,002h,002h,002h,002h,003h,002h,002h,003h,002h	; b982  ........................
	defb 002h,065h,000h,039h,003h,039h,000h,000h,000h,079h,0dfh,099h,0c0h,0bfh,080h,000h,000h,000h,000h,083h,000h,0afh,0b3h,0d3h	; b99a  .e.9.9...y..............

; ----------------------------------------------------------------------
; DATOS tabla_colores_B9B2: 4 punteros a colores de dibujo (los usa hasta el
;   indice 3; p00:4DA0); lo leen p00:4DA0 (8 bytes)
;   0xb9b2..0xb9ba  (8 bytes)
DATA_tabla_colores_B9B2:
	defw 0b9bah,0b9bch,0b9c0h,0b9c4h	; b9b2  -> DATA_colores_B9BA DATA_colores_B9BC DATA_colores_B9C0 DATA_colores_B9C4

; ----------------------------------------------------------------------
; DATOS colores_B9BA: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6F9D (2 bytes)
;   0xb9ba..0xb9bc  (2 bytes)
DATA_colores_B9BA:
	defb 003h,0cfh	; b9ba

; ----------------------------------------------------------------------
; DATOS colores_B9BC: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6F9D (4 bytes)
;   0xb9bc..0xb9c0  (4 bytes)
DATA_colores_B9BC:
	defb 002h,037h,08bh,0cfh	; b9bc

; ----------------------------------------------------------------------
; DATOS colores_B9C0: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6F9D (4 bytes)
;   0xb9c0..0xb9c4  (4 bytes)
DATA_colores_B9C0:
	defb 002h,038h,0bch,0efh	; b9c0

; ----------------------------------------------------------------------
; DATOS colores_B9C4: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6F9D (4 bytes)
;   0xb9c4..0xb9c8  (4 bytes)
DATA_colores_B9C4:
	defb 003h,078h,0bch,0efh	; b9c4

; ----------------------------------------------------------------------
; DATOS lista_B9C8: 3 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0xB9B2); lo leen p01:6F9D (16 bytes)
;   0xb9c8..0xb9d8  (16 bytes)
DATA_lista_B9C8:
	defb 043h,000h,01bh,0ebh,0b9h	; b9c8
	defb 083h,001h,01eh,01bh,0bah	; b9cd
	defb 081h,002h,021h,063h,0bah	; b9d2
	defb 0ffh	; b9d7

; ----------------------------------------------------------------------
; DATOS resto_B9D8: lo apuntan con el banco puesto p01:7134 (0xB9D8); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p01:7134 (9 bytes)
;   0xb9d8..0xb9e1  (9 bytes)
DATA_resto_B9D8:
	defb 000h,01eh,021h,01bh,01fh,020h,01ch,01dh,000h	; b9d8  ..!.. ...

; ----------------------------------------------------------------------
; DATOS lista_B9E1: 1 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0xB9B2); lo leen p01:6F9D (6 bytes)
;   0xb9e1..0xb9e7  (6 bytes)
DATA_lista_B9E1:
	defb 084h,003h,001h,07bh,0bah	; b9e1
	defb 0ffh	; b9e6

; ----------------------------------------------------------------------
; DATOS mosaico_B9E7: un mosaico de 2 x 2 caracteres, un byte cada uno
;   (p00:510F; BC = 0x0202 en quien llama); lo leen p01:714A (4 bytes)
;   0xb9e7..0xb9eb  (4 bytes)
DATA_mosaico_B9E7:
	defb 001h,002h	; b9e7
	defb 003h,004h	; b9e9

; ----------------------------------------------------------------------
; DATOS dibujo_B9EB: 3 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 0 de la lista 0xB9C8 (p00:4D92, p00:4DF5); lo leen p01:6F9D
;   (48 bytes)
;   0xb9eb..0xba1b  (48 bytes)
DATA_dibujo_B9EB:
	defb 000h,000h,000h,000h,000h,000h,001h,001h,002h,003h,005h,006h,006h,005h,00bh,00dh	; b9eb  ................
	defb 00fh,00bh,01fh,01fh,02fh,037h,03dh,02dh,01bh,01ah,002h,003h,006h,005h,007h,007h	; b9fb  ..../7=-........
	defb 0ech,09ch,078h,098h,0b0h,070h,0e0h,0e0h,040h,0c0h,0c0h,040h,080h,080h,000h,000h	; ba0b  ..x..p..@..@....

; ----------------------------------------------------------------------
; DATOS dibujo_BA1B: 3 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 1 de la lista 0xB9C8 (p00:4D92, p00:4DF5); lo leen p01:6F9D
;   (72 bytes)
;   0xba1b..0xba63  (72 bytes)
DATA_dibujo_BA1B:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,0c1h,0c1h,0c1h,0a1h,061h,0e1h,06ch,0adh,0ech,0a0h,0dah,0f7h,053h,06bh,07ch	; ba1b  .............a.l.....Sk|
	defb 022h,03dh,037h,011h,016h,01fh,065h,07eh,077h,082h,0ffh,0d3h,001h,0ffh,089h,061h,0ffh,065h,0c3h,0ffh,0dbh,086h,0feh,0a6h	; ba33  "=7...e~w......a.e......
	defb 046h,05ah,0beh,0c6h,0c8h,0bah,0ceh,050h,0eah,09fh,070h,0ddh,03fh,0f2h,03fh,0dfh,0cah,0dfh,00ch,008h,00ch,008h,000h,008h	; ba4b  FZ.....P..p.?.?.........

; ----------------------------------------------------------------------
; DATOS dibujo_BA63: 1 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 2 de la lista 0xB9C8 (p00:4D92, p00:4DF5); lo leen p01:6F9D
;   (24 bytes)
;   0xba63..0xba7b  (24 bytes)
DATA_dibujo_BA63:
	defb 000h,000h,000h,070h,070h,070h,0b8h,088h,0d8h,038h,0c8h,0c8h,018h,028h,0e8h,058h,0a8h,058h,03ch,0c4h,03ch,0e4h,0d4h,02ch	; ba63  ...ppp...8...(.X.X<.<..,

; ----------------------------------------------------------------------
; DATOS dibujo_BA7B: 4 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 0 de la lista 0xB9E1 (p00:4D92, p00:4DF5); lo leen p01:6F9D
;   (96 bytes)
;   0xba7b..0xbadb  (96 bytes)
DATA_dibujo_BA7B:
	defb 000h,000h,000h,001h,001h,001h,002h,003h,003h,003h,003h,003h,007h,007h,005h,00fh,00dh,009h,013h,011h,01fh,00eh,00ch,00fh	; ba7b  ........................
	defb 0e0h,0e0h,0e0h,030h,010h,0f0h,010h,0d0h,0f0h,028h,008h,0d8h,0fch,02ch,0b4h,0eeh,0deh,0e2h,0dah,03eh,04ah,03fh,01fh,0d1h	; ba93  ...0.....(...,.....>J?..
	defb 01fh,01bh,01bh,01fh,012h,012h,01fh,012h,01bh,01fh,016h,017h,02fh,026h,036h,07dh,04ch,06eh,07fh,079h,07dh,00fh,00fh,00fh	; baab  ............/&6}Ln.y}...
	defb 0ffh,0e7h,0e5h,0ffh,043h,05bh,0ffh,061h,06dh,0ffh,073h,073h,0ffh,07fh,07fh,0feh,0feh,0feh,0e0h,0e0h,0e0h,080h,080h,080h	; bac3  ....C[.am.ss............

; ----------------------------------------------------------------------
; DATOS resto_BADB: lo apuntan con el banco puesto p01:7231 (0xBADB); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p01:7231 (1317 bytes)
;   0xbadb..0xc000  (1317 bytes)
DATA_resto_BADB:
	defb 010h,010h,07fh,010h,02eh,024h,044h,05fh,02ah,02ah,05fh,0cah,05fh,048h,04ah,051h	; badb  .....$D_**_._HJQ
	defb 008h,03eh,014h,07fh,01ch,01dh,050h,04fh,000h,044h,054h,04ch,064h,04ch,092h,021h	; baeb  .>....PO.DTLdL.!
	defb 010h,010h,07fh,010h,03fh,031h,051h,05fh,008h,008h,03eh,02ah,07fh,014h,022h,041h	; bafb  ....?1Q_..>*.."A
	defb 008h,03eh,014h,07fh,022h,03eh,022h,03eh,000h,07fh,008h,00ch,00ah,008h,008h,008h	; bb0b  .>..">">........
	defb 000h,028h,02bh,04eh,0a8h,028h,029h,027h,008h,049h,02ah,008h,008h,014h,022h,041h	; bb1b  .(+N.()'.I*..."A
	defb 07eh,008h,0bdh,0bdh,0bdh,0bdh,081h,0ffh,008h,014h,03eh,041h,03eh,010h,022h,03eh	; bb2b  ~.........>A>.">
	defb 03eh,03eh,03eh,01ch,036h,055h,014h,02ch,024h,03ch,04ch,036h,015h,024h,024h,044h	; bb3b  >>>.6U.,$<L6.$$D
	defb 03ch,024h,068h,018h,066h,0bdh,024h,03ch,02ah,07fh,041h,03eh,00ch,07fh,008h,018h	; bb4b  <$h.f.$<*.A>....
	defb 000h,018h,024h,042h,0bdh,014h,024h,04ch,01ch,024h,07fh,05eh,052h,054h,051h,08fh	; bb5b  ..$B..$L.$.^RTQ.
	defb 008h,010h,03eh,024h,024h,07fh,014h,022h,020h,03eh,040h,03eh,002h,02ah,012h,069h	; bb6b  ..>$$.." >@>.*.i
	defb 048h,05fh,0f2h,06ah,0dah,064h,0d6h,049h,014h,03eh,01ch,01ch,07fh,02ah,05dh,03eh	; bb7b  H_.j.d.I.>...*]>
	defb 07fh,049h,07fh,03eh,03eh,008h,07fh,008h,022h,002h,072h,027h,062h,002h,072h,072h	; bb8b  .I.>>...".r'b.rr
	defb 03eh,022h,03eh,022h,03eh,03eh,015h,067h,008h,07fh,01ch,01ch,000h,03eh,022h,03eh	; bb9b  >">">>.g.....>">
	defb 009h,03eh,00ch,07fh,018h,02eh,04eh,00eh,018h,024h,042h,0bdh,000h,07eh,042h,07eh	; bbab  .>....N..$B..~B~
	defb 018h,024h,05ah,081h,07eh,002h,004h,038h,07fh,049h,07fh,049h,05dh,06bh,049h,07fh	; bbbb  .$Z.~..8.I.I]kI.
	defb 008h,07fh,055h,024h,043h,03eh,008h,07fh,028h,028h,05fh,0e4h,046h,044h,046h,044h	; bbcb  ..U$C>..((_.FDFD
	defb 000h,008h,008h,008h,02eh,028h,028h,07fh,000h,074h,024h,0f4h,028h,07ah,0a9h,02fh	; bbdb  .....((..t$.(z./
	defb 028h,02fh,078h,02fh,030h,06fh,02fh,02fh,000h,008h,008h,07fh,008h,008h,008h,03eh	; bbeb  (/x/0o//.......>
	defb 000h,07fh,014h,03dh,06eh,014h,025h,043h,000h,008h,04fh,015h,004h,02ch,04ah,011h	; bbfb  ...=n.%C..O..,J.
	defb 008h,07fh,02ah,03eh,07fh,03eh,008h,018h,008h,03eh,022h,03eh,022h,03eh,022h,03eh	; bc0b  ..*>.>...>">">">
	defb 004h,0ffh,0a4h,0ffh,0a2h,0bfh,0eah,006h,084h,048h,011h,0dfh,000h,01eh,052h,09eh	; bc1b  .........H....R.
	defb 008h,07fh,05dh,010h,03eh,03eh,008h,07fh,022h,072h,012h,027h,072h,022h,022h,02fh	; bc2b  ..].>>.."r.'r""/
	defb 02eh,0a2h,0aah,0aah,0eah,0a4h,02ah,031h,072h,004h,07fh,07ah,04ah,04ah,04ah,092h	; bc3b  ......*1r..zJJJ.
	defb 008h,008h,008h,00eh,008h,008h,008h,07fh,00eh,04eh,0ffh,068h,05fh,08bh,015h,02bh	; bc4b  .........N.h_..+
	defb 008h,02ah,02ah,03eh,008h,049h,049h,07fh,000h,010h,01ah,055h,050h,050h,091h,00eh	; bc5b  .**>.II....UPP..
	defb 008h,07fh,03eh,03eh,03eh,000h,07fh,022h,008h,03ch,025h,03eh,024h,07fh,014h,06ch	; bc6b  ..>>>..".<%>$..l
	defb 008h,008h,009h,07eh,01ch,02ah,049h,018h,000h,02ah,02ah,07fh,02ah,02eh,020h,03fh	; bc7b  ...~.*I..**.*. ?
	defb 000h,03eh,014h,07fh,055h,067h,041h,07fh,0a1h,0f9h,0a5h,075h,025h,0fdh,0a9h,0abh	; bc8b  .>..UgA....u%...
	defb 028h,03eh,048h,008h,03eh,008h,008h,07fh,0f8h,04fh,05ah,06ah,0cah,0d4h,0e6h,089h	; bc9b  (>H.>....OZj....
	defb 055h,024h,07fh,074h,075h,022h,072h,025h,08ah,05fh,01fh,0d2h,02dh,05eh,092h,09eh	; bcab  U$.tu"r%._..-^..
	defb 008h,03eh,008h,03eh,03eh,004h,07fh,014h,03eh,004h,008h,07fh,008h,008h,018h,008h	; bcbb  .>.>>...>.......
	defb 022h,07fh,000h,075h,075h,075h,075h,053h,008h,014h,022h,07fh,008h,03eh,008h,07fh	; bccb  "..uuuuS.."..>..
	defb 000h,05eh,06ah,0aeh,06ah,0aeh,02ah,0dfh,03eh,022h,03eh,008h,02eh,028h,058h,047h	; bcdb  .^j.j.*.>">..(XG
	defb 01ch,024h,068h,017h,069h,01ah,004h,038h,024h,024h,05fh,0c4h,04eh,055h,04eh,044h	; bceb  .$h.i..8$$_.NUND
	defb 000h,008h,008h,07fh,008h,014h,022h,041h,000h,004h,057h,0fdh,055h,076h,051h,08fh	; bcfb  ......"A..W.UvQ.
	defb 000h,008h,07fh,049h,07fh,008h,008h,008h,084h,05fh,004h,0c4h,00eh,004h,044h,09fh	; bd0b  ...I....._....D.
	defb 008h,028h,07fh,051h,075h,053h,071h,006h,000h,038h,008h,008h,014h,014h,022h,041h	; bd1b  .(.QuSq..8...."A
	defb 008h,07fh,03eh,03eh,03eh,01ch,02ah,049h,08ah,05fh,004h,0ceh,04eh,04eh,060h,09fh	; bd2b  ..>>>.*I._..NN`.
	defb 044h,06eh,074h,0afh,022h,06fh,0aah,026h,02eh,04eh,0bfh,042h,0bfh,032h,02ah,026h	; bd3b  Dnt."o.&.N.B.2*&
	defb 008h,07fh,049h,055h,063h,041h,041h,043h,03eh,02ah,03eh,02ah,07fh,011h,021h,04eh	; bd4b  ..IUcAAC>*>*..!N
	defb 008h,07fh,008h,07fh,055h,05dh,05dh,04bh,010h,010h,07fh,014h,024h,07ch,00eh,032h	; bd5b  ....U]]K....$|.2
	defb 000h,008h,008h,008h,008h,014h,022h,041h,020h,03eh,048h,03eh,028h,07fh,008h,008h	; bd6b  ......"A >H>(...
	defb 045h,05fh,0e4h,05fh,05fh,05fh,04ah,046h,000h,008h,008h,02ah,02ah,049h,008h,018h	; bd7b  E_.___JF...**I..
	defb 07ah,02dh,036h,063h,01ch,03eh,015h,067h,010h,064h,0ffh,075h,075h,075h,029h,072h	; bd8b  z-6c.>.g.d.uuu)r
	defb 008h,07fh,01ch,07fh,029h,066h,02ah,031h,000h,07fh,05dh,041h,05dh,055h,05dh,043h	; bd9b  ....)f*1..]A]U]C
	defb 075h,004h,0ffh,024h,034h,0a5h,0b3h,0c1h,020h,077h,055h,0feh,005h,075h,057h,074h	; bdab  u..$4... wU..uWt
	defb 048h,07fh,0adh,025h,077h,0ebh,025h,022h,000h,008h,07fh,014h,014h,008h,014h,063h	; bdbb  H..%w.%".......c
	defb 008h,02eh,028h,07fh,02ah,049h,006h,038h,02eh,02ah,04eh,0c4h,05fh,04eh,055h,055h	; bdcb  ..(.*I.8.*N._NUU
	defb 008h,07fh,010h,01eh,012h,012h,02ah,044h,084h,05fh,004h,0dfh,004h,00ah,053h,09dh	; bddb  ......*D._....S.
	defb 014h,014h,015h,076h,014h,014h,035h,057h,008h,0feh,0c8h,0ffh,0c8h,0dch,02ah,049h	; bdeb  ...v..5W......*I
	defb 07eh,042h,07eh,048h,07eh,044h,055h,062h,018h,024h,07eh,081h,07eh,05ah,06ah,008h	; bdfb  ~B~H~DUb.$~.~Zj.
	defb 00fh,011h,02ah,004h,01fh,071h,011h,01fh,000h,07eh,042h,07eh,042h,07eh,042h,07eh	; be0b  ..*..q...~B~B~B~
	defb 008h,07fh,020h,03eh,022h,03eh,03eh,03eh,008h,07fh,049h,05dh,055h,05dh,05dh,043h	; be1b  .. >">>>..I]U]]C
	defb 077h,055h,077h,041h,041h,041h,041h,043h,010h,0ffh,028h,04eh,0d6h,04ah,044h,05bh	; be2b  wUwAAAAC..(N.JD[
	defb 07fh,055h,052h,07fh,023h,072h,022h,076h,020h,0feh,020h,03ch,07ch,0bch,024h,02ch	; be3b  .UR.#r"v . <|.$,
	defb 008h,07fh,041h,02ah,014h,03eh,055h,01ch,03fh,029h,03fh,029h,03fh,029h,029h,04bh	; be4b  ..A*.>U.?)?)?))K
	defb 008h,07fh,02ah,02ah,07fh,01ch,02ah,049h,046h,0aah,054h,0aah,0f1h,04eh,0eah,0eeh	; be5b  ..**..*IF.T..N..
	defb 000h,008h,07fh,008h,01ch,02ah,05dh,008h,00eh,0eeh,04eh,0eeh,044h,06eh,084h,01fh	; be6b  .....*]...N.Dn..
	defb 010h,010h,07fh,011h,011h,021h,021h,046h,008h,02ah,01ch,03fh,001h,03fh,001h,03fh	; be7b  .....!!F.*.?.?.?
	defb 008h,07fh,022h,022h,022h,022h,024h,07fh,00eh,0eah,0feh,0e4h,0eah,0ffh,0eah,00eh	; be8b  ..""""$.........
	defb 008h,014h,03eh,041h,03eh,00ah,00ch,008h,004h,04ah,01fh,000h,01fh,025h,046h,004h	; be9b  ..>A>....J...%F.
	defb 008h,03eh,014h,055h,000h,02ah,029h,046h,084h,05fh,004h,0dfh,05fh,04eh,064h,09fh	; beab  .>.U.*)F._.._Nd.
	defb 0e7h,0a9h,0f6h,046h,079h,0cfh,0e9h,08fh,09eh,044h,01eh,0deh,05eh,05eh,072h,0bfh	; bebb  ...Fy....D..^^r.
	defb 008h,068h,009h,07eh,01ch,02ah,049h,018h,008h,07fh,041h,014h,07fh,024h,018h,036h	; becb  .h.~.*I...A..$.6
	defb 020h,0feh,0ffh,0ffh,05dh,009h,000h,082h,028h,07fh,003h,0ffh,082h,03fh,01ah,009h	; bedb   ...]...(....?..
	defb 000h,082h,002h,0d0h,004h,0ffh,081h,04fh,008h,000h,083h,004h,03fh,07fh,003h,0ffh	; beeb  .......O....?...
	defb 082h,07fh,017h,008h,000h,082h,080h,05ch,005h,0ffh,081h,0e4h,005h,000h,000h,001h	; befb  .......\........
	defb 004h,020h,0e0h,002h,004h,030h,0f0h,000h,000h,080h,0f8h,00dh,000h,002h,001h,00dh	; bf0b  . ...0..........
	defb 000h,002h,080h,082h,0c0h,080h,00ch,000h,002h,001h,00ch,000h,081h,080h,003h,0c0h	; bf1b  ................
	defb 002h,080h,000h,004h,034h,004h,02eh,002h,032h,0ffh,02ch,004h,026h,004h,030h,006h	; bf2b  ....4...2.,.&.0.
	defb 02ah,008h,033h,004h,034h,004h,032h,004h,02ch,004h,034h,004h,026h,004h,030h,006h	; bf3b  *.3.4.2.,.4.&.0.
	defb 030h,006h,02eh,002h,031h,006h,02ch,0ffh,029h,004h,02ah,004h,030h,006h,032h,008h	; bf4b  0...1.,.).*.0.2.
	defb 033h,004h,034h,004h,032h,004h,02ch,004h,034h,004h,026h,004h,030h,006h,030h,006h	; bf5b  3.4.2.,.4.&.0.0.
	defb 02eh,002h,031h,006h,02ch,0ffh,030h,006h,037h,004h,035h,004h,02eh,002h,028h,008h	; bf6b  ..1.,.0.7.5...(.
	defb 028h,004h,032h,004h,030h,006h,033h,004h,032h,004h,035h,004h,02ah,0ffh,028h,004h	; bf7b  (.2.0.3.2.5.*.(.
	defb 02dh,004h,026h,004h,034h,004h,026h,004h,028h,004h,036h,004h,02ah,004h,034h,008h	; bf8b  -.&.4.&.(.6.*.4.
	defb 029h,004h,02ah,004h,035h,004h,02eh,002h,02ch,004h,031h,0ffh,028h,004h,02dh,004h	; bf9b  ).*.5...,.1.(.-.
	defb 026h,004h,034h,004h,026h,004h,028h,004h,036h,004h,02ah,004h,034h,008h,035h,004h	; bfab  &.4.&.(.6.*.4.5.
	defb 037h,004h,033h,004h,033h,004h,032h,004h,034h,004h,036h,0ffh,02ch,004h,026h,004h	; bfbb  7.3.3.2.4.6.,.&.
	defb 030h,006h,02ah,008h,029h,004h,02ah,004h,035h,004h,02eh,002h,02ch,004h,031h,0ffh	; bfcb  0.*.).*.5...,.1.
	defb 030h,006h,02ah,004h,028h,004h,02dh,004h,026h,004h,031h,006h,02eh,002h,028h,004h	; bfdb  0.*.(.-.&.1...(.
	defb 026h,004h,02fh,008h,029h,004h,02ah,004h,035h,004h,02eh,002h,02ch,004h,031h,0ffh	; bfeb  &./.).*.5...,.1.
	defb 0ffh,0ffh,0ffh,0ffh,0ffh	; bffb
