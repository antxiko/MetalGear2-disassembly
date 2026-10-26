; ==========================================================================
; METAL GEAR 2 SOLID SNAKE - Konami (1990) - MSX2 - MegaROM RC-767 de 512 KB (Konami SCC) - banco 54 (se ejecuta en 0xa000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x0a000


; ----------------------------------------------------------------------
; DATOS dibujo_A000: 2 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 0 de la lista 0xBFCD (p00:4D92, p00:4DF5); lo leen p13:9543 (16
;   bytes)
;   0xa000..0xa010  (16 bytes)
DATA_dibujo_A000:
	defb 000h,000h,000h,000h,000h,000h,000h,000h	; a000  ........
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; a008  ........

; ----------------------------------------------------------------------
; DATOS dibujo_A010: 9 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 1 de la lista 0xBFCD (p00:4D92, p00:4DF5); lo leen p13:9543 (72
;   bytes)
;   0xa010..0xa058  (72 bytes)
DATA_dibujo_A010:
	defb 0ffh,0ffh,068h,06bh,068h,00ah,09bh,0ffh	; a010  ..hkh...
	defb 0ffh,0ffh,0e6h,05ah,0dah,0c2h,05ah,0ffh	; a018  ...Z..Z.
	defb 0ffh,0ffh,0efh,04dh,0afh,0edh,0efh,0ffh	; a020  ...M....
	defb 0ffh,0ffh,0ceh,0b6h,0b6h,0b6h,0ceh,0ffh	; a028  ........
	defb 0ffh,0ffh,0dbh,0d7h,0cfh,0d7h,0dbh,0ffh	; a030  ........
	defb 0ffh,0ffh,0f7h,0f7h,0f3h,0f5h,0f3h,0ffh	; a038  ........
	defb 0ffh,0ffh,0feh,0ach,0aeh,0ceh,0eeh,09fh	; a040  ........
	defb 0ffh,0ffh,0ffh,077h,0e3h,0efh,073h,0ffh	; a048  ...w..s.
	defb 0ffh,0ffh,0ffh,01fh,03fh,0dfh,01fh,0ffh	; a050  ....?...

; ----------------------------------------------------------------------
; DATOS dibujo_A058: 38 caracteres de 8x8 a 1 bit por punto (8 bytes cada
;   uno), ficha 2 de la lista 0xBFCD (p00:4D92, p00:4DF5); lo leen p13:9543
;   (304 bytes)
;   0xa058..0xa188  (304 bytes)
DATA_dibujo_A058:
	defb 0ffh,0ffh,0ffh,0ffh,0feh,0feh,0feh,0fch	; a058  ........
	defb 0ffh,0ffh,0ffh,0ffh,007h,007h,007h,003h	; a060  ........
	defb 0ffh,0ffh,0ffh,0ffh,0f8h,0f8h,0f8h,0f0h	; a068  ........
	defb 0ffh,0ffh,0ffh,0ffh,01fh,01fh,01fh,00fh	; a070  ........
	defb 0ffh,0ffh,0ffh,0ffh,0f0h,0c0h,080h,000h	; a078  ........
	defb 0ffh,0ffh,0ffh,0ffh,000h,000h,000h,000h	; a080  ........
	defb 0ffh,0ffh,0ffh,0ffh,01fh,00fh,007h,003h	; a088  ........
	defb 0ffh,0ffh,0ffh,0ffh,0fch,0f8h,0f0h,0e0h	; a090  ........
	defb 0ffh,0ffh,0ffh,0ffh,003h,007h,00fh,01fh	; a098  ........
	defb 0fch,0fch,0fch,0f8h,0f8h,0f8h,0f8h,0f0h	; a0a0  ........
	defb 003h,003h,003h,001h,001h,001h,001h,000h	; a0a8  ........
	defb 0f0h,0f0h,0f0h,0e0h,0e0h,0e0h,0e0h,0c0h	; a0b0  ........
	defb 00fh,00eh,00eh,006h,006h,006h,007h,003h	; a0b8  ........
	defb 000h,000h,003h,007h,003h,000h,000h,000h	; a0c0  ........
	defb 000h,000h,0ffh,0ffh,0ffh,000h,000h,000h	; a0c8  ........
	defb 000h,000h,0ffh,0ffh,0ffh,0ffh,03fh,01fh	; a0d0  ......?.
	defb 003h,001h,000h,080h,0c0h,0c0h,0e0h,0f0h	; a0d8  ........
	defb 0e0h,0c0h,080h,000h,001h,001h,003h,007h	; a0e0  ........
	defb 01fh,03fh,07fh,0ffh,0ffh,0ffh,0ffh,0ffh	; a0e8  .?......
	defb 0f0h,0f0h,0f0h,0e0h,0e0h,0e0h,0e0h,0c0h	; a0f0  ........
	defb 020h,020h,020h,070h,070h,070h,070h,0f8h	; a0f8     pppp.
	defb 0c1h,0c1h,001h,003h,003h,003h,003h,007h	; a100  ........
	defb 003h,003h,003h,081h,081h,081h,080h,0c0h	; a108  ........
	defb 080h,0c0h,0f0h,0ffh,0ffh,0ffh,000h,000h	; a110  ........
	defb 000h,000h,000h,0fch,0feh,0fch,000h,000h	; a118  ........
	defb 00fh,00fh,007h,007h,007h,007h,006h,00ch	; a120  ........
	defb 0f0h,0e0h,0c0h,0c0h,080h,000h,001h,003h	; a128  ........
	defb 007h,003h,001h,001h,000h,080h,0c0h,0e0h	; a130  ........
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,07fh,03fh,01fh	; a138  ......?.
	defb 0c0h,0c0h,081h,081h,0ffh,0ffh,0ffh,0ffh	; a140  ........
	defb 0f8h,0f8h,0fch,0fch,0ffh,0ffh,0ffh,0ffh	; a148  ........
	defb 007h,007h,00fh,00fh,0ffh,0ffh,0ffh,0ffh	; a150  ........
	defb 0c0h,0c0h,0e0h,0e0h,0ffh,0ffh,0ffh,0ffh	; a158  ........
	defb 000h,000h,000h,000h,0ffh,0ffh,0ffh,0ffh	; a160  ........
	defb 008h,018h,030h,0e0h,0ffh,0ffh,0ffh,0ffh	; a168  ..0.....
	defb 007h,007h,00fh,01fh,0ffh,0ffh,0ffh,0ffh	; a170  ........
	defb 0f0h,0f0h,0f8h,0fch,0ffh,0ffh,0ffh,0ffh	; a178  ........
	defb 00fh,00fh,007h,003h,0ffh,0ffh,0ffh,0ffh	; a180  ........

; ----------------------------------------------------------------------
; DATOS resto_A188: lo apuntan con el banco puesto p13:954C (0xA188); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p13:954C (554 bytes)
;   0xa188..0xa3b2  (554 bytes)
DATA_resto_A188:
	defb 000h,020h,0f8h,00eh,000h,002h,0ffh,00eh,000h,002h,0ffh,00dh,000h,083h,07fh,0ffh	; a188  . ..............
	defb 0ffh,00dh,000h,083h,0c8h,0feh,0feh,00eh,000h,002h,001h,00eh,000h,002h,0ffh,00eh	; a198  ................
	defb 000h,002h,0fbh,00dh,000h,083h,09fh,0ffh,0ffh,00dh,000h,083h,0f0h,0ffh,0ffh,00eh	; a1a8  ................
	defb 000h,002h,0ffh,00eh,000h,002h,0ffh,00eh,010h,002h,0ffh,01eh,000h,082h,0ffh,07fh	; a1b8  ................
	defb 00eh,000h,002h,0ffh,00dh,000h,083h,007h,0ffh,0ffh,00dh,000h,003h,0feh,00dh,000h	; a1c8  ................
	defb 003h,007h,00dh,000h,003h,0ffh,00eh,000h,002h,0ffh,00eh,000h,002h,0ffh,008h,000h	; a1d8  ................
	defb 006h,010h,082h,0f8h,0f0h,010h,000h,002h,010h,005h,000h,002h,010h,081h,000h,006h	; a1e8  ................
	defb 010h,010h,000h,008h,010h,018h,000h,004h,010h,081h,000h,00bh,010h,007h,000h,002h	; a1f8  ................
	defb 001h,081h,002h,00ch,000h,002h,080h,00dh,000h,004h,001h,00eh,000h,003h,080h,01dh	; a208  ................
	defb 000h,082h,0c0h,080h,00eh,000h,002h,001h,082h,003h,004h,00ah,000h,083h,020h,0c0h	; a218  .............. .
	defb 080h,00ch,000h,083h,004h,003h,001h,00eh,000h,084h,080h,0c0h,040h,020h,008h,000h	; a228  ............@ ..
	defb 081h,09bh,003h,000h,086h,003h,00dh,013h,03fh,03fh,00ch,006h,000h,083h,0ffh,018h	; a238  ........??......
	defb 07fh,006h,0ffh,007h,000h,084h,0ddh,000h,000h,0c0h,003h,0ffh,081h,0f0h,008h,000h	; a248  ................
	defb 086h,080h,006h,00ch,03ch,0f8h,0f8h,00ah,000h,081h,00fh,003h,000h,086h,003h,00dh	; a258  ....<...........
	defb 013h,03fh,03fh,00ch,006h,000h,083h,0bdh,018h,07fh,006h,0ffh,007h,000h,084h,0f0h	; a268  .??.............
	defb 000h,000h,0c0h,003h,0ffh,081h,0f0h,009h,000h,085h,006h,00ch,03ch,0f8h,0f8h,00ah	; a278  ............<...
	defb 000h,08ah,00fh,000h,000h,001h,007h,00bh,00fh,01fh,01fh,006h,006h,000h,083h,0dbh	; a288  ................
	defb 018h,07eh,005h,0ffh,081h,0feh,007h,000h,088h,0f0h,000h,000h,080h,0ffh,0ffh,0fch	; a298  .~..............
	defb 0c0h,008h,000h,086h,018h,030h,070h,0e0h,0e0h,0c0h,00ah,000h,08ah,09bh,000h,000h	; a2a8  .....0p.........
	defb 001h,003h,007h,007h,00fh,00fh,003h,006h,000h,083h,0ffh,018h,07ch,005h,0ffh,081h	; a2b8  ............|...
	defb 0fch,007h,000h,088h,0ddh,000h,001h,003h,0ffh,0ffh,0f8h,080h,008h,000h,002h,0c0h	; a2c8  ................
	defb 002h,080h,00ch,000h,081h,00fh,003h,000h,002h,001h,084h,003h,00fh,00fh,001h,006h	; a2d8  ................
	defb 000h,084h,0dbh,018h,07ch,0feh,005h,0ffh,081h,080h,006h,000h,088h,0f0h,006h,006h	; a2e8  ....|...........
	defb 00eh,0fch,0fch,0f0h,0c0h,019h,000h,081h,01bh,004h,000h,083h,001h,007h,007h,008h	; a2f8  ................
	defb 000h,083h,0ffh,03ch,07eh,004h,0ffh,082h,0feh,080h,007h,000h,087h,0dch,004h,00ch	; a308  ...<~...........
	defb 0f8h,0f8h,0e0h,080h,01ah,000h,088h,07bh,007h,00fh,00fh,01fh,07fh,07fh,008h,008h	; a318  .......{........
	defb 000h,087h,07ah,086h,0feh,0feh,0f8h,0e0h,080h,00bh,000h,085h,05fh,007h,00fh,01fh	; a328  ..z........._...
	defb 00fh,00bh,000h,084h,0e0h,020h,0c0h,080h,00eh,000h,082h,06eh,01ch,01eh,000h,082h	; a338  ..... .....n....
	defb 02ch,018h,01eh,000h,082h,008h,018h,01fh,000h,081h,008h,01eh,000h,088h,09dh,048h	; a348  ,..............H
	defb 000h,022h,000h,04bh,000h,016h,008h,000h,089h,06dh,02fh,09dh,06ch,097h,029h,057h	; a358  .".K.....m/.l.)W
	defb 0abh,04eh,007h,000h,089h,0ebh,05ah,0b9h,0abh,0dch,0e9h,06ch,0b2h,0d6h,007h,000h	; a368  .N....Z....l....
	defb 088h,04dh,009h,0a2h,000h,08ah,020h,003h,090h,008h,000h,089h,0bah,005h,020h,084h	; a378  .M.... ....... .
	defb 000h,059h,020h,08dh,020h,007h,000h,089h,0ddh,03ah,08dh,036h,009h,0afh,055h,02ah	; a388  .Y . ....:.6..U*
	defb 027h,007h,000h,089h,0f6h,09ch,0b4h,0d6h,0bah,054h,06eh,0d8h,02fh,007h,000h,089h	; a398  '........Tn./...
	defb 0b2h,004h,030h,002h,040h,094h,00eh,0d0h,004h,000h	; a3a8  ..0.@.....

; ----------------------------------------------------------------------
; DATOS dibujo_A3B2: 4 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 0 de la lista 0xBF21 (p00:4D92, p00:4DF5); lo leen p13:952B
;   (64 bytes)
;   0xa3b2..0xa3f2  (64 bytes)
DATA_dibujo_A3B2:
	defb 070h,090h,070h,090h,070h,090h,0f0h,010h,0f0h,010h,0f0h,010h,0f0h,010h,0f0h,010h	; a3b2  p.p.p...........
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,00bh,03fh,0c9h,03fh,0c9h,03fh,0c8h	; a3c2  ..........?.?.?.
	defb 038h,0f8h,038h,0e8h,038h,0e8h,0b8h,068h,078h,0e8h,078h,098h,078h,088h,078h,088h	; a3d2  8.8.8..hx.x.x.x.
	defb 000h,007h,007h,000h,003h,003h,001h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a3e2  ................

; ----------------------------------------------------------------------
; DATOS dibujo_A3F2: 14 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 1 de la lista 0xBF21 (p00:4D92, p00:4DF5); lo leen p13:952B
;   (224 bytes)
;   0xa3f2..0xa4d2  (224 bytes)
DATA_dibujo_A3F2:
	defb 01dh,022h,001h,01fh,000h,007h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a3f2  ."..............
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0ffh,0e0h,0ffh,01eh,0fdh,003h,0ffh,0ffh,0ffh	; a402  ................
	defb 07fh,080h,060h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,002h,0ffh,0ffh,0ffh	; a412  ..`.............
	defb 0ffh,000h,000h,0ffh,0ffh,0ffh,0fch,0fch,0f8h,0f8h,0f0h,0f0h,060h,0e0h,080h,080h	; a422  ............`...
	defb 07fh,080h,060h,0ffh,0ffh,0ffh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a432  ..`.............
	defb 0f8h,00fh,004h,0ffh,0ffh,0ffh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a442  ................
	defb 010h,0feh,020h,0fch,0f0h,0f0h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a452  .. .............
	defb 0ffh,0ffh,0deh,0ffh,0deh,0ffh,022h,0ffh,0feh,0c3h,0feh,0ffh,003h,002h,003h,003h	; a462  ......".........
	defb 0e0h,0e7h,0e1h,0e2h,0f1h,0f1h,070h,0f0h,070h,0f0h,060h,0e0h,0e0h,0e0h,0e0h,0e0h	; a472  ......p.p.`.....
	defb 07eh,0feh,0beh,07eh,0f8h,0f8h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a482  ~..~............
	defb 078h,078h,048h,038h,048h,038h,048h,038h,028h,018h,028h,018h,028h,018h,010h,030h	; a492  xxH8H8H8(.(.(..0
	defb 000h,000h,000h,000h,0c0h,0c0h,030h,0f0h,088h,0f8h,0f8h,0f8h,0f0h,0f0h,0f8h,0f8h	; a4a2  ......0.........
	defb 000h,0ffh,0fbh,004h,0d7h,0ffh,03bh,047h,07fh,07fh,000h,000h,000h,000h,000h,000h	; a4b2  .......G........
	defb 0e1h,0feh,038h,0ffh,01fh,0ffh,0cfh,03fh,007h,0ffh,0f1h,00fh,002h,0ffh,0ffh,0ffh	; a4c2  ..8....?........

; ----------------------------------------------------------------------
; DATOS dibujo_A4D2: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 2 de la lista 0xBF21 (p00:4D92, p00:4DF5); lo leen p13:952B
;   (16 bytes)
;   0xa4d2..0xa4e2  (16 bytes)
DATA_dibujo_A4D2:
	defb 004h,00ch,00ch,004h,00ch,004h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a4d2  ................

; ----------------------------------------------------------------------
; DATOS dibujo_A4E2: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 3 de la lista 0xBF21 (p00:4D92, p00:4DF5); lo leen p13:952B
;   (16 bytes)
;   0xa4e2..0xa4f2  (16 bytes)
DATA_dibujo_A4E2:
	defb 01ah,006h,01eh,01eh,004h,00ch,00ch,004h,00ch,004h,00ch,004h,00ch,004h,00ch,004h	; a4e2  ................

; ----------------------------------------------------------------------
; DATOS dibujo_A4F2: 5 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 4 de la lista 0xBF21 (p00:4D92, p00:4DF5); lo leen p13:952B
;   (80 bytes)
;   0xa4f2..0xa542  (80 bytes)
DATA_dibujo_A4F2:
	defb 0e4h,004h,004h,004h,0e4h,004h,0c6h,0e6h,013h,090h,0afh,020h,05fh,040h,07eh,040h	; a4f2  ........... _@~@
	defb 0fdh,0fdh,03fh,03fh,01fh,01fh,006h,006h,0feh,018h,0f9h,060h,047h,030h,08ch,063h	; a502  ..??.......`G0.c
	defb 034h,0c7h,0e9h,00fh,03bh,03fh,0dah,01eh,0fbh,0ffh,01bh,01fh,09ah,01eh,0dfh,01bh	; a512  4....?..........
	defb 0aah,040h,0a2h,040h,0eeh,000h,010h,010h,0ffh,01fh,010h,010h,010h,010h,017h,017h	; a522  .@.@............
	defb 0dfh,000h,0e0h,000h,0efh,000h,009h,007h,0ech,003h,00fh,000h,023h,0c0h,02bh,0c0h	; a532  ............#.+.

; ----------------------------------------------------------------------
; DATOS dibujo_A542: 17 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 5 de la lista 0xBF21 (p00:4D92, p00:4DF5); lo leen p13:952B
;   (408 bytes)
;   0xa542..0xa6da  (408 bytes)
DATA_dibujo_A542:
	defb 000h,000h,000h,004h,00ch,008h,00ch,004h,008h,00ch,004h,008h,004h,005h,00bh,008h,003h,017h,013h,004h,00fh,006h,001h,00eh	; a542  ........................
	defb 000h,012h,0edh,0b6h,080h,07fh,080h,089h,076h,089h,0f6h,000h,0ffh,013h,000h,0ffh,0ffh,000h,003h,002h,001h,003h,003h,000h	; a55a  ........v...............
	defb 02ch,043h,09dh,0adh,062h,095h,06ah,0a8h,015h,0e2h,07dh,000h,0ffh,0e2h,000h,08fh,030h,0c0h,03fh,040h,0ffh,09fh,0dfh,060h	; a572  ,C..b.j...}.....0.?@...`
	defb 0e6h,008h,0f7h,0e7h,008h,0f7h,008h,000h,0f7h,008h,0f7h,000h,0ffh,008h,000h,0ffh,000h,000h,0c3h,000h,0ffh,0ffh,0feh,001h	; a58a  ........................
	defb 032h,005h,0f8h,002h,0fdh,000h,0ffh,000h,000h,08fh,072h,000h,0ffh,0ffh,000h,01fh,0e0h,000h,008h,077h,080h,00ch,0f3h,000h	; a5a2  2.........r........w....
	defb 0beh,000h,0ffh,0ffh,0feh,001h,0f3h,00dh,000h,089h,063h,01ch,0ffh,0ffh,000h,0f3h,00dh,000h,089h,063h,01ch,0ffh,0ffh,000h	; a5ba  ..........c........c....
	defb 081h,000h,003h,042h,000h,087h,0c2h,000h,087h,043h,000h,084h,046h,000h,083h,042h,000h,087h,044h,001h,08eh,044h,081h,00eh	; a5d2  ...B.....C..F..B..D..D..
	defb 044h,081h,00eh,044h,081h,00eh,044h,081h,00eh,0c8h,083h,01ch,0c8h,003h,01ch,0c0h,043h,01ch,0ech,093h,000h,0f3h,0cdh,000h	; a5ea  D..D..D.........C.......
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,001h,001h,002h,003h,002h,000h,007h,000h,001h,006h	; a602  ........................
	defb 0f3h,00dh,000h,089h,063h,01ch,0ffh,0ffh,000h,0ffh,001h,000h,089h,063h,01ch,0feh,0ffh,000h,079h,086h,000h,0ffh,0ffh,000h	; a61a  ....c........c....y.....
	defb 0ffh,0ffh,000h,0c1h,0f9h,006h,0a3h,0d0h,00fh,0fch,090h,007h,0e4h,0bbh,000h,0e4h,0bbh,000h,0f8h,0c7h,000h,0ffh,0e0h,000h	; a632  ........................
	defb 0ffh,0e0h,000h,010h,0c0h,02fh,077h,088h,077h,044h,000h,0bbh,054h,0bbh,000h,057h,0b8h,000h,081h,07eh,000h,0ffh,081h,000h	; a64a  ...../w.wD..T..W...~....
	defb 000h,000h,000h,000h,000h,000h,000h,001h,000h,000h,001h,000h,002h,000h,0fdh,07ah,081h,0fch,0f4h,000h,0fbh,005h,000h,0fbh	; a662  ...............z........
	defb 0fch,00ch,000h,0fch,0f4h,000h,0fch,0e4h,000h,0fch,00ch,000h,000h,000h,0ffh,0ffh,000h,0ffh,003h,000h,0ffh,000h,000h,0ffh	; a67a  ........................
	defb 083h,07ch,000h,082h,01dh,060h,081h,00eh,070h,00dh,00eh,0f0h,081h,0feh,000h,0feh,081h,000h,080h,0c1h,03eh,08ch,04dh,03eh	; a692  .|...`..p...........>.M>
	defb 000h,000h,000h,018h,038h,030h,038h,038h,000h,000h,03fh,0c0h,078h,080h,0ffh,0feh,000h,0ffh,00eh,0f0h,00fh,026h,0c8h,0f7h	; a6aa  ....8088..?.x........&..
	defb 0b2h,001h,07ch,041h,0beh,000h,05dh,0beh,01ch,041h,0bfh,000h,04fh,0b1h,000h,0ffh,083h,000h,0ffh,082h,000h,0ffh,0feh,000h	; a6c2  ..|A..]..A..O...........

; ----------------------------------------------------------------------
; DATOS dibujo_A6DA: 6 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 6 de la lista 0xBF21 (p00:4D92, p00:4DF5); lo leen p13:952B
;   (144 bytes)
;   0xa6da..0xa76a  (144 bytes)
DATA_dibujo_A6DA:
	defb 01bh,01fh,0e4h,0deh,01ah,0e5h,0ffh,01bh,0e4h,09fh,07bh,084h,0eeh,00ah,0f5h,06fh,00dh,0f2h,077h,006h,0f9h,077h,007h,0f8h	; a6da  ..........{....o..w..w..
	defb 0c8h,0f7h,0c0h,07fh,07fh,000h,007h,007h,003h,0e0h,000h,0ffh,003h,0f0h,0ffh,034h,069h,0bfh,070h,0fdh,01fh,0fah,0f4h,09fh	; a6f2  ...............4i.p.....
	defb 0efh,000h,0ffh,020h,020h,0dfh,0ffh,0ffh,000h,0efh,000h,0ffh,010h,010h,0efh,01fh,01fh,0e0h,000h,0ffh,000h,0ffh,0ffh,0ffh	; a70a  ...  ...................
	defb 0ffh,000h,0ffh,07fh,000h,0ffh,0ffh,0ffh,000h,07fh,000h,0ffh,080h,080h,07fh,080h,080h,07fh,000h,0ffh,000h,0ffh,0ffh,0ffh	; a722  ........................
	defb 07bh,000h,07fh,084h,073h,0ffh,0f4h,004h,0fbh,0f7h,000h,0ffh,07fh,008h,0f7h,008h,008h,0f7h,004h,004h,07bh,044h,07fh,044h	; a73a  {...s...............{D.D
	defb 0fch,0ffh,0ebh,0ffh,0feh,0f5h,0ffh,0feh,005h,0ffh,0feh,0f5h,0ffh,0feh,0e5h,0fch,0fch,0cbh,0fch,0fch,01bh,0ffh,0ffh,0e0h	; a752  ........................

; ----------------------------------------------------------------------
; DATOS dibujo_A76A: 11 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 7 de la lista 0xBF21 (p00:4D92, p00:4DF5); lo leen p13:952B
;   (264 bytes)
;   0xa76a..0xa872  (264 bytes)
DATA_dibujo_A76A:
	defb 0cdh,07ch,001h,0f9h,07ch,001h,079h,0fch,001h,073h,0f8h,003h,003h,0f8h,003h,0c0h,000h,000h,004h,0f3h,000h,0e7h,0f1h,006h	; a76a  .|..|.y..s..............
	defb 07fh,0ffh,0ffh,07fh,0ffh,0ffh,07fh,0ffh,0ffh,07fh,0ffh,0ffh,084h,07fh,0ffh,000h,000h,000h,001h,0eeh,000h,0c0h,0e0h,000h	; a782  ........................
	defb 0f5h,0fbh,0f3h,0e7h,0e8h,0e0h,0efh,0e0h,0e0h,0efh,0e0h,0e0h,0e0h,0e0h,0e0h,07fh,07fh,07fh,0f8h,04fh,04fh,037h,018h,01fh	; a79a  ...................OO7..
	defb 040h,020h,000h,0c0h,03fh,000h,01fh,0e0h,000h,0f0h,000h,000h,000h,000h,000h,0e1h,0fbh,0e0h,018h,0fch,0f8h,027h,0fch,0fch	; a7b2  @ ..?................'..
	defb 0beh,080h,080h,082h,082h,082h,083h,083h,083h,0bdh,080h,080h,082h,082h,082h,082h,082h,082h,0b8h,081h,0bfh,04eh,071h,07fh	; a7ca  .....................Nq.
	defb 020h,020h,020h,0dfh,026h,0ffh,029h,0ffh,0ffh,0dfh,026h,0ffh,0c0h,03fh,0ffh,040h,0ffh,0ffh,080h,0ffh,0ffh,0ffh,0ffh,0ffh	; a7e2     .&.)...&..?.@........
	defb 0fch,0fch,0fch,0fbh,0fch,0ffh,0e0h,0ffh,0ffh,087h,0f8h,0ffh,09fh,0e0h,0ffh,0c0h,03fh,0ffh,0c0h,0ffh,0ffh,0ffh,0ffh,0ffh	; a7fa  ................?.......
	defb 080h,000h,000h,0bfh,000h,000h,0ffh,0ffh,0ffh,0ffh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0ffh,07fh,080h,0ffh	; a812  ........................
	defb 00ah,001h,001h,0ebh,000h,000h,0fbh,0f0h,0f0h,0f0h,010h,010h,010h,010h,010h,010h,010h,010h,02fh,010h,0ffh,0f7h,008h,0ffh	; a82a  ................../.....
	defb 0c0h,03fh,0ffh,0ffh,0ffh,0ffh,033h,00fh,0ffh,000h,000h,000h,0e7h,000h,000h,00ah,0f1h,000h,0f2h,0f9h,000h,075h,0f8h,070h	; a842  .?....3..............u.p
	defb 07fh,03fh,0ffh,00bh,0ffh,0ffh,014h,00fh,0ffh,08ah,007h,0ffh,0f0h,003h,0ffh,0ffh,0f8h,0ffh,004h,0ffh,0ffh,0ffh,0ffh,0ffh	; a85a  .?......................

; ----------------------------------------------------------------------
; DATOS dibujo_A872: 8 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 8 de la lista 0xBF21 (p00:4D92, p00:4DF5); lo leen p13:952B
;   (192 bytes)
;   0xa872..0xa932  (192 bytes)
DATA_dibujo_A872:
	defb 001h,000h,001h,01eh,007h,006h,0ffh,078h,0f0h,0f8h,0ffh,000h,01fh,01fh,000h,001h,001h,000h,000h,000h,000h,000h,000h,000h	; a872  .......x................
	defb 000h,001h,001h,001h,001h,000h,01eh,001h,000h,07fh,013h,01fh,0ffh,07ch,07ch,0ffh,0ffh,000h,05fh,06fh,00fh,0ffh,0ffh,000h	; a88a  .............||..._o....
	defb 0ffh,0ffh,0ffh,000h,0ffh,000h,0c7h,0ffh,0ffh,0ffh,000h,000h,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,000h,0ffh,0ffh,000h	; a8a2  ........................
	defb 073h,08fh,000h,0f3h,04fh,040h,061h,03fh,038h,078h,037h,030h,03eh,01dh,01ch,01fh,00fh,000h,000h,000h,000h,000h,000h,000h	; a8ba  s...O@a?8x70>...........
	defb 0ddh,0cbh,088h,0ddh,0cbh,008h,01fh,01fh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a8d2  ........................
	defb 00ch,0cch,0f0h,0fch,0fch,000h,01fh,0ffh,000h,0c6h,03fh,000h,0e1h,01fh,000h,0ffh,0ffh,000h,0e1h,01fh,000h,0ffh,0ffh,000h	; a8ea  ..........?.............
	defb 01fh,0ffh,000h,007h,0ffh,000h,0f5h,00fh,000h,0fdh,077h,070h,08fh,077h,070h,0fdh,073h,070h,0ffh,099h,0f8h,0ffh,0ffh,000h	; a902  ..........wp.wp.sp......
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,008h,0e8h,0f0h,0c4h,034h,0f8h,00ch,0cch,0f0h	; a91a  ...................4....

; ----------------------------------------------------------------------
; DATOS dibujo_A932: 6 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 9 de la lista 0xBF21 (p00:4D92, p00:4DF5); lo leen p13:952B
;   (144 bytes)
;   0xa932..0xa9c2  (144 bytes)
DATA_dibujo_A932:
	defb 0f9h,000h,003h,010h,0e4h,003h,030h,034h,003h,0f0h,004h,003h,0f0h,006h,000h,008h,00dh,000h,00dh,00ah,000h,01bh,0fch,0f0h	; a932  ......04................
	defb 020h,0dfh,000h,010h,080h,06fh,057h,007h,0e8h,070h,00fh,0e0h,070h,001h,0b0h,058h,025h,098h,05ch,021h,08ch,06dh,000h,08ch	; a94a   ....oW..p..p..X%.\!.m..
	defb 07dh,000h,098h,07dh,000h,0b0h,06dh,080h,060h,06fh,08fh,040h,090h,010h,000h,010h,010h,000h,020h,020h,000h,0ffh,0ffh,000h	; a962  }..}..m.`o.@......  ....
	defb 002h,002h,000h,0ffh,0ffh,000h,0ffh,0ffh,000h,008h,008h,000h,078h,007h,000h,0c0h,020h,01fh,000h,0ffh,000h,01eh,0e1h,01eh	; a97a  ............x... .......
	defb 007h,078h,003h,0ffh,000h,002h,0ffh,000h,000h,000h,000h,000h,01dh,000h,000h,004h,024h,0c0h,003h,098h,060h,07dh,000h,000h	; a992  .x..............$...`}..
	defb 0eah,064h,060h,072h,084h,008h,032h,0cch,030h,0fdh,001h,000h,007h,007h,000h,03fh,000h,000h,000h,004h,0fbh,07ch,0fdh,000h	; a9aa  .d`r..2.0......?.....|..

; ----------------------------------------------------------------------
; DATOS dibujo_A9C2: 4 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 10 de la lista 0xBF21 (p00:4D92, p00:4DF5); lo leen p13:952B
;   (96 bytes)
;   0xa9c2..0xaa22  (96 bytes)
DATA_dibujo_A9C2:
	defb 0adh,03ah,0cah,0a7h,03fh,0c7h,0b8h,03fh,0c0h,0a7h,03fh,0c7h,020h,03fh,0c0h,068h,07fh,080h,057h,05fh,0a0h,028h,02fh,0d0h	; a9c2  .:..?..?..?. ?.h..W_.(/.
	defb 007h,006h,0fah,038h,02fh,0e8h,0f7h,0cch,0c4h,0efh,018h,008h,0efh,093h,083h,0aeh,0d7h,006h,059h,07fh,008h,03fh,03fh,000h	; a9da  ...8/.............Y..??.
	defb 0feh,0f8h,0f7h,006h,0fch,003h,0feh,0feh,001h,001h,003h,001h,000h,001h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a9f2  ........................
	defb 0efh,0c0h,03fh,0eeh,000h,0ffh,0eeh,000h,0ffh,010h,010h,0efh,01fh,01fh,0e0h,010h,010h,0efh,0ech,0ffh,0ech,0ech,0feh,0ech	; aa0a  ..?.....................

; ----------------------------------------------------------------------
; DATOS dibujo_AA22: 5 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 11 de la lista 0xBF21 (p00:4D92, p00:4DF5); lo leen p13:952B
;   (120 bytes)
;   0xaa22..0xaa9a  (120 bytes)
DATA_dibujo_AA22:
	defb 005h,005h,0fah,07fh,080h,0ffh,000h,07fh,07fh,00fh,01fh,01fh,000h,000h,000h,0c0h,000h,000h,0e0h,000h,000h,000h,0ffh,000h	; aa22  ........................
	defb 0ffh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0ffh,000h	; aa3a  ........................
	defb 01eh,0e1h,000h,0f3h,02fh,0feh,013h,0ffh,0feh,0fch,0feh,0fdh,002h,002h,001h,003h,002h,000h,002h,000h,001h,002h,002h,001h	; aa52  ..../...................
	defb 05ch,064h,084h,05ch,064h,084h,057h,06fh,080h,0b0h,0dfh,010h,0b7h,0d8h,01fh,0f8h,01fh,01fh,0bfh,0ffh,03fh,0b8h,0f8h,038h	; aa6a  \d.\d.Wo............?..8
	defb 010h,010h,010h,010h,010h,010h,050h,080h,010h,074h,0b4h,034h,05eh,0aah,0beh,074h,0b4h,0b4h,0d0h,0c0h,0d0h,010h,010h,010h	; aa82  ......P..t.4^..t........

; ----------------------------------------------------------------------
; DATOS dibujo_AA9A: 2 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 12 de la lista 0xBF21 (p00:4D92, p00:4DF5); lo leen p13:952B
;   (48 bytes)
;   0xaa9a..0xaaca  (48 bytes)
DATA_dibujo_AA9A:
	defb 007h,002h,003h,007h,002h,003h,00bh,004h,004h,016h,007h,009h,0f6h,0e6h,00fh,0b6h,0c4h,00fh,02eh,0c8h,01fh,06eh,08eh,01fh	; aa9a  .....................n..
	defb 0edh,049h,05eh,0edh,081h,096h,0d5h,091h,0bah,0f9h,0a9h,0beh,07dh,021h,03ah,07fh,03bh,038h,03fh,046h,010h,07bh,0eah,004h	; aab2  .I^.........}!:..8?F.{..

; ----------------------------------------------------------------------
; DATOS dibujo_AACA: 2 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 13 de la lista 0xBF21 (p00:4D92, p00:4DF5); lo leen p13:952B
;   (48 bytes)
;   0xaaca..0xaafa  (48 bytes)
DATA_dibujo_AACA:
	defb 0ffh,000h,0ffh,0ffh,000h,0ffh,0ffh,000h,0ffh,09fh,060h,0ffh,09fh,070h,0ffh,0ffh,070h,07fh,03fh,058h,09fh,0ffh,014h,017h	; aaca  ..........`..p..p.?X....
	defb 0ffh,000h,0ffh,0ffh,000h,0ffh,0ffh,000h,0ffh,0ffh,060h,0ffh,0ffh,070h,0ffh,0ffh,070h,07fh,03fh,058h,09fh,0ffh,014h,017h	; aae2  ..........`..p..p.?X....

; ----------------------------------------------------------------------
; DATOS dibujo_AAFA: 4 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 14 de la lista 0xBF21 (p00:4D92, p00:4DF5); lo leen p13:952B
;   (96 bytes)
;   0xaafa..0xab5a  (96 bytes)
DATA_dibujo_AAFA:
	defb 03eh,0a2h,0cfh,03eh,022h,0cfh,07dh,06fh,08ch,0f0h,08fh,000h,0d7h,068h,000h,09fh,0f0h,010h,03fh,0c9h,009h,0ffh,009h,009h	; aafa  >..>".}o.....h....?.....
	defb 03eh,0aeh,0cfh,03eh,02eh,0cfh,07dh,06fh,08ch,0f0h,08fh,000h,0d7h,068h,000h,09fh,0f0h,010h,03fh,0c9h,009h,0ffh,009h,009h	; ab12  >..>..}o.....h....?.....
	defb 0f0h,090h,090h,088h,0f0h,000h,064h,078h,080h,012h,0fch,0e0h,002h,0fch,000h,0feh,000h,000h,00ch,0f0h,000h,0fch,004h,004h	; ab2a  ......dx................
	defb 0f8h,0f8h,0f8h,0f0h,0f0h,0f0h,000h,000h,000h,0f8h,000h,000h,007h,0f8h,000h,031h,0feh,0c0h,0e3h,0fch,000h,0e4h,0fbh,000h	; ab42  ...............1........

; ----------------------------------------------------------------------
; DATOS dibujo_AB5A: 1 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 15 de la lista 0xBF21 (p00:4D92, p00:4DF5); lo leen p13:952B
;   (24 bytes)
;   0xab5a..0xab72  (24 bytes)
DATA_dibujo_AB5A:
	defb 060h,000h,07fh,0f0h,000h,0ffh,027h,007h,0d8h,0ffh,0dfh,000h,000h,0ffh,000h,000h,0ffh,000h,001h,0feh,000h,083h,0feh,0feh	; ab5a  `.....'.................

; ----------------------------------------------------------------------
; DATOS dibujo_AB72: 6 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 16 de la lista 0xBF21 (p00:4D92, p00:4DF5); lo leen p13:952B
;   (144 bytes)
;   0xab72..0xac02  (144 bytes)
DATA_dibujo_AB72:
	defb 0ffh,000h,0ffh,0ffh,000h,0ffh,0ffh,000h,0ffh,0ffh,000h,0ffh,0ffh,007h,0f8h,08ch,071h,0eeh,086h,064h,0d9h,0bfh,07bh,080h	; ab72  ................q..d..{.
	defb 0ffh,000h,0ffh,0ffh,000h,0ffh,0ffh,000h,0ffh,0ffh,000h,0ffh,0f9h,0f9h,006h,099h,002h,0fch,000h,007h,0f9h,0f8h,0ffh,001h	; ab8a  ........................
	defb 0ffh,000h,0ffh,0ffh,000h,0ffh,0ffh,000h,0ffh,0ffh,000h,0ffh,08fh,0f0h,00fh,0ebh,01ch,003h,055h,0eeh,0c1h,055h,0eeh,0c1h	; aba2  ..................U..U..
	defb 0ffh,000h,0ffh,0ffh,000h,0ffh,0ffh,000h,0ffh,0ffh,000h,0ffh,0ffh,007h,0f8h,0ech,071h,0eeh,0c6h,064h,0d9h,0bfh,07bh,080h	; abba  ................q..d..{.
	defb 0ffh,000h,0ffh,0ffh,000h,0ffh,0ffh,000h,0ffh,0ffh,000h,0ffh,0f9h,0f9h,006h,099h,002h,0fch,001h,007h,0f9h,0f9h,0ffh,001h	; abd2  ........................
	defb 0ffh,000h,0ffh,0ffh,000h,0ffh,0ffh,000h,0ffh,0ffh,000h,0ffh,08fh,0f0h,00fh,0ebh,01ch,003h,0d5h,0eeh,0c1h,0d5h,0eeh,0c1h	; abea  ........................

; ----------------------------------------------------------------------
; DATOS dibujo_AC02: 1 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 17 de la lista 0xBF21 (p00:4D92, p00:4DF5); lo leen p13:952B
;   (24 bytes)
;   0xac02..0xac1a  (24 bytes)
DATA_dibujo_AC02:
	defb 0f5h,09fh,0f9h,0f5h,0ffh,0f9h,054h,05eh,0f8h,005h,006h,000h,04dh,0beh,008h,0fbh,0fch,0f8h,0f1h,0ffh,0f0h,0f3h,03eh,0f1h	; ac02  ......T^....M.........>.

; ----------------------------------------------------------------------
; DATOS dibujo_AC1A: 1 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 18 de la lista 0xBF21 (p00:4D92, p00:4DF5); lo leen p13:952B
;   (24 bytes)
;   0xac1a..0xac32  (24 bytes)
DATA_dibujo_AC1A:
	defb 0e7h,0f2h,0efh,0ffh,0bfh,0ffh,0bfh,0ffh,0e0h,000h,000h,000h,07fh,000h,000h,04fh,03fh,07fh,0bfh,07fh,0ffh,0beh,07eh,0ffh	; ac1a  ...............O?.....~.

; ----------------------------------------------------------------------
; DATOS dibujo_AC32: 3 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 19 de la lista 0xBF21 (p00:4D92, p00:4DF5); lo leen p13:952B
;   (72 bytes)
;   0xac32..0xac7a  (72 bytes)
DATA_dibujo_AC32:
	defb 061h,038h,0f8h,0c4h,0c3h,0c0h,032h,00eh,002h,0ceh,03eh,00ch,0beh,07ch,036h,0bfh,06dh,036h,03fh,0ffh,03fh,0dfh,0bfh,092h	; ac32  a8....2...>..|6.m6?.?...
	defb 081h,07eh,000h,040h,0dfh,04fh,063h,0ech,000h,067h,0eeh,066h,061h,0aeh,040h,031h,076h,030h,033h,054h,020h,003h,044h,002h	; ac4a  .~.@.Oc..g.fa.@1v03T .D.
	defb 0bbh,003h,003h,0bbh,003h,003h,081h,001h,001h,0bch,000h,000h,0dfh,000h,000h,0dfh,007h,000h,0dfh,000h,040h,0dfh,000h,080h	; ac62  ....................@...

; ----------------------------------------------------------------------
; DATOS dibujo_AC7A: 3 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 20 de la lista 0xBF21 (p00:4D92, p00:4DF5); lo leen p13:952B
;   (72 bytes)
;   0xac7a..0xacc2  (72 bytes)
DATA_dibujo_AC7A:
	defb 07ch,042h,09ah,067h,010h,0b0h,000h,07fh,080h,0c0h,0c0h,03fh,0f7h,080h,008h,0fch,09ah,012h,0f7h,0b7h,038h,0ffh,080h,000h	; ac7a  |B.g.......?........8...
	defb 020h,016h,017h,0e1h,001h,002h,001h,0fdh,002h,03bh,03bh,0c4h,0fbh,042h,004h,063h,042h,004h,0e3h,0c2h,004h,0ebh,012h,014h	; ac92   ............B.cB.......
	defb 0ceh,0b1h,03eh,083h,01ch,01fh,000h,0ffh,000h,081h,081h,07eh,0ffh,000h,000h,0fbh,0c4h,0c7h,0fbh,0e4h,0e7h,0feh,011h,016h	; acaa  ..>........~............

; ----------------------------------------------------------------------
; DATOS dibujo_ACC2: 10 caracteres de 8x8 a 1 bit por punto (8 bytes cada
;   uno), ficha 0 de la lista 0xBF8B (p00:4D92, p00:4DF5); lo leen p13:9534
;   (80 bytes)
;   0xacc2..0xad12  (80 bytes)
DATA_dibujo_ACC2:
	defb 000h,000h,000h,000h,000h,0c0h,000h,000h	; acc2  ........
	defb 07fh,03fh,00fh,00fh,007h,007h,03fh,001h	; acca  .?....?.
	defb 0c0h,000h,000h,000h,000h,000h,000h,000h	; acd2  ........
	defb 000h,000h,000h,000h,000h,000h,000h,000h	; acda  ........
	defb 000h,000h,000h,000h,000h,000h,000h,000h	; ace2  ........
	defb 001h,001h,007h,000h,000h,001h,000h,01fh	; acea  ........
	defb 000h,000h,000h,000h,080h,0e0h,0f8h,0ffh	; acf2  ........
	defb 000h,000h,000h,000h,000h,000h,000h,080h	; acfa  ........
	defb 000h,000h,000h,001h,000h,000h,003h,01fh	; ad02  ........
	defb 0dch,0ffh,0fah,080h,000h,000h,000h,000h	; ad0a  ........

; ----------------------------------------------------------------------
; DATOS dibujo_AD12: 12 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 1 de la lista 0xBF8B (p00:4D92, p00:4DF5); lo leen p13:9534
;   (192 bytes)
;   0xad12..0xadd2  (192 bytes)
DATA_dibujo_AD12:
	defb 0ffh,000h,0c0h,038h,0c0h,00fh,030h,001h,0ffh,06eh,0f9h,019h,090h,000h,0f0h,00ch	; ad12  ...8..0..n......
	defb 0ffh,000h,077h,000h,004h,050h,081h,0c4h,0e1h,07fh,038h,0ffh,001h,014h,041h,099h	; ad22  ..w..P....8...A.
	defb 0ffh,000h,018h,000h,000h,0f0h,060h,0ffh,01bh,03fh,008h,017h,01dh,003h,07fh,003h	; ad32  ......`..?......
	defb 004h,0e8h,080h,060h,000h,000h,000h,040h,0c0h,000h,038h,0c4h,080h,0d8h,000h,000h	; ad42  ...`...@..8.....
	defb 0f0h,008h,0fdh,002h,085h,020h,002h,018h,060h,000h,002h,0fch,017h,0e8h,0fbh,064h	; ad52  ..... ..`......d
	defb 000h,08eh,000h,0c0h,087h,000h,0ffh,000h,0ffh,000h,0e2h,000h,031h,040h,001h,004h	; ad62  ............1@..
	defb 002h,00eh,038h,0f8h,067h,0e5h,03dh,000h,0ffh,01ch,02fh,03eh,00ch,00dh,053h,05fh	; ad72  ..8.g.=.../>..S_
	defb 03fh,000h,080h,080h,002h,087h,011h,0e9h,03fh,0c0h,000h,002h,01dh,01fh,0f6h,0feh	; ad82  ?.......?.......
	defb 00dh,08fh,02eh,0ffh,0c7h,0ffh,0dch,02fh,0fch,003h,09fh,0e8h,0ffh,073h,020h,000h	; ad92  ......./.....s .
	defb 073h,0f3h,000h,03eh,000h,0c4h,003h,0b8h,039h,006h,060h,060h,03bh,0f7h,048h,0ffh	; ada2  s..>....9.``..H.
	defb 023h,0ffh,0bfh,07fh,050h,0ffh,0e3h,0f0h,0c0h,0f9h,0bbh,0fbh,000h,01dh,080h,004h	; adb2  #...P...........
	defb 0e4h,0ffh,08eh,0ffh,03dh,0c7h,0fdh,003h,047h,0f8h,09ch,0ffh,079h,0ffh,08fh,07fh	; adc2  ....=...G...y...

; ----------------------------------------------------------------------
; DATOS dibujo_ADD2: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 2 de la lista 0xBF8B (p00:4D92, p00:4DF5); lo leen p13:9534
;   (16 bytes)
;   0xadd2..0xade2  (16 bytes)
DATA_dibujo_ADD2:
	defb 000h,000h,000h,000h,0f0h,000h,055h,028h,043h,0a4h,030h,007h,023h,09eh,07fh,058h	; add2  ......U(C.0.#..X

; ----------------------------------------------------------------------
; DATOS dibujo_ADE2: 4 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 3 de la lista 0xBF8B (p00:4D92, p00:4DF5); lo leen p13:9534
;   (64 bytes)
;   0xade2..0xae22  (64 bytes)
DATA_dibujo_ADE2:
	defb 0a6h,0b8h,020h,0c0h,080h,000h,000h,000h,000h,000h,000h,000h,0c0h,000h,07fh,080h	; ade2  .. .............
	defb 077h,008h,007h,000h,00fh,000h,000h,000h,000h,000h,000h,000h,001h,000h,03fh,000h	; adf2  w.............?.
	defb 033h,0cch,0f9h,006h,09fh,000h,000h,000h,000h,000h,000h,000h,0e0h,000h,0fch,000h	; ae02  3...............
	defb 039h,0c6h,0cfh,030h,074h,003h,003h,000h,000h,000h,000h,000h,000h,000h,00ch,000h	; ae12  9..0t...........

; ----------------------------------------------------------------------
; DATOS dibujo_AE22: 4 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 4 de la lista 0xBF8B (p00:4D92, p00:4DF5); lo leen p13:9534
;   (64 bytes)
;   0xae22..0xae62  (64 bytes)
DATA_dibujo_AE22:
	defb 0eah,0f8h,00ch,013h,006h,001h,0d0h,020h,0ffh,000h,08ch,0f3h,01bh,0fch,06ch,09fh	; ae22  ....... ......l.
	defb 000h,000h,000h,000h,030h,000h,006h,039h,09fh,00eh,060h,081h,0a0h,0a0h,000h,000h	; ae32  ....0..9..`.....
	defb 000h,000h,000h,000h,073h,000h,03eh,0c1h,003h,0fdh,0f3h,08fh,038h,038h,000h,000h	; ae42  ....s.>.....88..
	defb 03fh,000h,0feh,06dh,000h,0e1h,000h,001h,032h,075h,07fh,089h,001h,07fh,033h,00fh	; ae52  ?..m....2u....3.

; ----------------------------------------------------------------------
; DATOS dibujo_AE62: 14 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 5 de la lista 0xBF8B (p00:4D92, p00:4DF5); lo leen p13:9534
;   (224 bytes)
;   0xae62..0xaf42  (224 bytes)
DATA_dibujo_AE62:
	defb 0e8h,017h,03ch,0d7h,0ffh,000h,0f4h,008h,000h,0ffh,04fh,0ffh,09fh,0fch,0feh,000h	; ae62  ..<.......O.....
	defb 000h,0ffh,06fh,0fch,001h,000h,0feh,0c0h,0beh,07bh,001h,01fh,066h,000h,05ch,080h	; ae72  ..o......{..f.\.
	defb 0ffh,0f3h,0f1h,06fh,005h,01fh,02fh,01fh,043h,001h,078h,007h,0b9h,046h,014h,0ebh	; ae82  ...o../.C.x..F..
	defb 0c3h,0ffh,01ch,0ffh,000h,0ffh,000h,0fch,0cdh,033h,07fh,084h,000h,016h,048h,000h	; ae92  .........3....H.
	defb 0f7h,0ffh,019h,0deh,003h,03ch,000h,063h,020h,0edh,007h,001h,09eh,04fh,001h,0d6h	; aea2  .....<.c ....O..
	defb 0f0h,0e0h,0fch,030h,0ffh,0c4h,0e7h,000h,081h,000h,01fh,00eh,023h,01fh,0f0h,00fh	; aeb2  ...0........#...
	defb 000h,0ffh,039h,0fbh,0f7h,0ffh,0f8h,00bh,0e2h,003h,076h,007h,0bfh,001h,00fh,08fh	; aec2  ..9.......v.....
	defb 0e2h,002h,0e0h,000h,0f8h,071h,0efh,010h,09eh,061h,0dbh,026h,007h,001h,000h,000h	; aed2  .....q...a.&....
	defb 000h,0ffh,080h,03fh,084h,033h,008h,001h,0c0h,03fh,0fch,0fdh,000h,000h,080h,080h	; aee2  ...?.3...?......
	defb 03ch,0c7h,037h,0c8h,0f7h,008h,0ffh,014h,01fh,0e0h,003h,0e0h,099h,086h,001h,01eh	; aef2  <.7.............
	defb 003h,0c0h,004h,0dbh,087h,000h,0c0h,000h,000h,000h,040h,040h,0feh,0e8h,0feh,0dch	; af02  ..........@@....
	defb 0cfh,0cfh,0ffh,0bfh,05ch,0bfh,038h,0c7h,087h,000h,000h,020h,0f3h,08fh,07ch,01fh	; af12  ....\.8.... ..|.
	defb 09ch,080h,0f7h,0f8h,07fh,0afh,01fh,0e6h,07fh,080h,0f3h,00ch,09bh,0e4h,0f2h,0fdh	; af22  ................
	defb 0f2h,00dh,0ech,0fbh,0d0h,02fh,0c8h,0f8h,060h,002h,0f8h,0ffh,000h,0ffh,0a7h,0f8h	; af32  ...../..`.......

; ----------------------------------------------------------------------
; DATOS dibujo_AF42: 24 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 6 de la lista 0xBF8B (p00:4D92, p00:4DF5); lo leen p13:9534
;   (384 bytes)
;   0xaf42..0xb0c2  (384 bytes)
DATA_dibujo_AF42:
	defb 002h,005h,07ch,00ch,0feh,03bh,080h,07fh,03eh,007h,060h,01fh,00eh,0ffh,03bh,07fh	; af42  ..|.....>.`.....
	defb 0f0h,0efh,0ffh,006h,013h,0ffh,061h,0feh,030h,00fh,09bh,027h,076h,08fh,010h,0fdh	; af52  ......a.0..'v...
	defb 003h,0ffh,0ffh,0ffh,000h,0ffh,02eh,0d7h,0f8h,0ffh,000h,0ffh,080h,0ffh,002h,0fdh	; af62  ................
	defb 0fbh,0feh,0ffh,0ffh,051h,0bfh,020h,0ffh,070h,00fh,0ffh,000h,001h,0feh,000h,078h	; af72  ....Q. .p......x
	defb 080h,0ffh,000h,0ffh,000h,00eh,030h,071h,0ach,0dfh,0c3h,02ch,02ah,080h,000h,000h	; af82  ......0q...,*...
	defb 020h,0e4h,002h,0bfh,000h,01fh,000h,011h,000h,04dh,0bdh,042h,020h,000h,000h,000h	; af92   ........M.B ...
	defb 00dh,07fh,000h,0f1h,013h,0ffh,038h,038h,040h,0fdh,0bah,041h,000h,000h,003h,004h	; afa2  ......88@..A....
	defb 008h,0ffh,0f6h,0ffh,060h,0e8h,007h,007h,000h,0f0h,050h,0a3h,001h,000h,0bfh,040h	; afb2  ....`.....P....@
	defb 04fh,000h,0feh,001h,088h,01ch,083h,050h,0cah,0f5h,07fh,0f0h,000h,0ffh,03bh,0ffh	; afc2  O......P........
	defb 0e4h,0ffh,030h,0feh,080h,080h,072h,07fh,008h,02fh,000h,0c2h,090h,06ch,0f0h,03dh	; afd2  ..0...r../...l.=
	defb 0c7h,01fh,018h,0f0h,003h,007h,03fh,0f8h,089h,077h,0feh,001h,0fch,003h,0f8h,0f9h	; afe2  ......?..w......
	defb 020h,0efh,020h,0f0h,01eh,007h,0e9h,01eh,006h,0a0h,000h,00ah,000h,0c5h,079h,0feh	; aff2   . ...........y.
	defb 0f3h,0adh,03eh,03bh,0c0h,0c0h,0fah,00dh,0c3h,07ch,078h,09fh,014h,0ebh,033h,0cfh	; b002  ..>......|x...3.
	defb 098h,001h,000h,000h,0bch,0f5h,00ch,0ffh,0a0h,05fh,011h,0eeh,0e1h,01eh,0fch,003h	; b012  ........._......
	defb 0eeh,0f1h,0c3h,03fh,086h,047h,000h,0e0h,00fh,080h,07eh,000h,039h,0c0h,003h,020h	; b022  ...?.G....~.9..
	defb 070h,0ffh,041h,01fh,087h,06eh,049h,0b0h,0c0h,000h,000h,000h,000h,0ffh,0ffh,0ffh	; b032  p.A..nI.........
	defb 0fbh,004h,0d0h,0ffh,00ch,09fh,080h,07eh,007h,000h,000h,000h,000h,0ffh,0ffh,0ffh	; b042  .......~........
	defb 014h,000h,0ddh,002h,000h,0fdh,059h,0a0h,080h,000h,000h,000h,000h,0ffh,0ffh,0ffh	; b052  ......Y.........
	defb 039h,001h,08fh,00ah,071h,0d0h,067h,000h,000h,000h,000h,000h,000h,0ffh,0ffh,0ffh	; b062  9...q.g.........
	defb 0c0h,007h,03ch,003h,095h,000h,000h,000h,064h,000h,000h,000h,000h,0ffh,06bh,0f7h	; b072  ..<.....d.....k.
	defb 005h,0c7h,0e0h,003h,01eh,0e1h,081h,07fh,0efh,0ffh,0c4h,0ffh,03ch,0fbh,0e0h,008h	; b082  ............<...
	defb 000h,097h,008h,0f7h,027h,0d8h,0efh,0feh,029h,0d7h,034h,0cbh,000h,0aah,00eh,0f0h	; b092  ....'...).4.....
	defb 008h,0f7h,0bdh,042h,0deh,021h,01ah,0f5h,0dch,0e3h,01ah,0f5h,00ah,07dh,003h,000h	; b0a2  ...B.!.......}..
	defb 0f9h,006h,0bfh,0bch,0c0h,0ffh,0a2h,08ch,0fch,000h,010h,000h,0bch,041h,0d0h,0ffh	; b0b2  .............A..

; ----------------------------------------------------------------------
; DATOS dibujo_B0C2: 16 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 7 de la lista 0xBF8B (p00:4D92, p00:4DF5); lo leen p13:9534
;   (256 bytes)
;   0xb0c2..0xb1c2  (256 bytes)
DATA_dibujo_B0C2:
	defb 0ffh,060h,073h,08fh,000h,0ffh,0f0h,0ffh,0feh,0ffh,0fch,007h,01fh,000h,001h,000h	; b0c2  .`s.............
	defb 000h,0ffh,0feh,001h,0f8h,0ffh,04bh,0bfh,000h,0ffh,0f0h,03fh,0fah,03fh,0ffh,001h	; b0d2  ......K....?.?..
	defb 01fh,0feh,07fh,0f8h,0bch,0e0h,01ch,0e0h,07dh,0c0h,0bfh,0c0h,0f9h,096h,0c7h,0f8h	; b0e2  ........}.......
	defb 080h,000h,000h,000h,000h,000h,0e0h,000h,000h,000h,03eh,000h,0ffh,000h,0edh,0e0h	; b0f2  ..........>.....
	defb 000h,000h,000h,000h,000h,000h,000h,000h,00ch,000h,0cfh,000h,0fbh,018h,0fch,070h	; b102  ...............p
	defb 0ffh,040h,0c0h,038h,0c0h,000h,0c0h,000h,0c0h,000h,0c0h,000h,0c0h,000h,0c0h,000h	; b112  .@.8............
	defb 003h,003h,0ffh,0ffh,01fh,0ffh,060h,0e3h,000h,000h,000h,000h,000h,000h,000h,000h	; b122  ......`.........
	defb 001h,001h,0c4h,0cfh,006h,006h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; b132  ................
	defb 0bfh,0afh,03ch,07fh,000h,01fh,038h,038h,000h,000h,000h,000h,001h,000h,001h,000h	; b142  ..<...88........
	defb 0f8h,0e0h,0fch,060h,03eh,0c0h,007h,0f8h,019h,0f6h,0ffh,0ffh,05fh,0fch,003h,0feh	; b152  ...`>......._...
	defb 001h,000h,003h,000h,04fh,000h,0ffh,007h,03ch,003h,07fh,007h,0feh,003h,0e0h,01fh	; b162  ....O...<.......
	defb 0ffh,0e0h,0ffh,0f0h,01fh,0ffh,0feh,001h,01bh,0ffh,070h,0ffh,000h,0ffh,03ch,0ffh	; b172  ..........p...<.
	defb 0ffh,000h,0ffh,001h,0ffh,0ffh,07fh,0cch,0f7h,0cah,039h,0f6h,01ch,0ffh,000h,0ffh	; b182  ..........9.....
	defb 0feh,001h,0ffh,0ffh,0ffh,000h,0ffh,001h,082h,07fh,00eh,0f1h,000h,0ffh,063h,0ffh	; b192  ..............c.
	defb 000h,0ffh,081h,0ffh,0bch,07fh,0c7h,0f8h,03ch,0f3h,000h,0ffh,007h,0ffh,08eh,0ffh	; b1a2  ........<.......
	defb 0ffh,00ch,0fdh,003h,0ceh,037h,000h,0ffh,038h,0ffh,0e7h,0ffh,03bh,0ffh,000h,0ffh	; b1b2  .....7..8.......

; ----------------------------------------------------------------------
; DATOS dibujo_B1C2: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 8 de la lista 0xBF8B (p00:4D92, p00:4DF5); lo leen p13:9534
;   (16 bytes)
;   0xb1c2..0xb1d2  (16 bytes)
DATA_dibujo_B1C2:
	defb 0ffh,044h,0ceh,031h,088h,060h,05bh,004h,000h,000h,000h,09fh,0f7h,008h,018h,0e7h	; b1c2  .D.1.`[.........

; ----------------------------------------------------------------------
; DATOS dibujo_B1D2: 15 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 9 de la lista 0xBF8B (p00:4D92, p00:4DF5); lo leen p13:9534
;   (240 bytes)
;   0xb1d2..0xb2c2  (240 bytes)
DATA_dibujo_B1D2:
	defb 0c3h,03fh,0ffh,006h,0efh,011h,0fbh,007h,081h,07fh,0e3h,01fh,003h,0ffh,01bh,0e7h	; b1d2  .?..............
	defb 01fh,0e0h,087h,078h,088h,077h,0f7h,008h,0ffh,000h,09fh,064h,02fh,017h,03eh,0c1h	; b1e2  ...x.w.....d/.>.
	defb 0fah,07fh,0fah,0c7h,04fh,080h,067h,000h,0fch,003h,0ffh,001h,0bfh,040h,05fh,020h	; b1f2  ....O.g......@_
	defb 0c1h,000h,0c3h,000h,01eh,0a1h,003h,004h,080h,000h,03fh,0c0h,09bh,0e4h,0ffh,000h	; b202  ..........?.....
	defb 0ffh,0f8h,01eh,0e1h,0fbh,004h,0fbh,0c4h,0f0h,0ffh,0f7h,0f8h,0feh,0feh,07eh,0f8h	; b212  ..............~.
	defb 0f0h,000h,0e0h,000h,0cch,004h,07fh,080h,0ffh,008h,0ffh,012h,0ffh,0ffh,003h,03bh	; b222  ................
	defb 0b8h,047h,0feh,000h,0f9h,000h,030h,010h,0feh,0feh,0ffh,0ffh,0dfh,0e3h,077h,0fdh	; b232  .G....0.......w.
	defb 000h,0c0h,000h,01fh,0e0h,000h,000h,000h,01ch,01fh,0f0h,0ffh,0e7h,038h,07ch,0c3h	; b242  .............8|.
	defb 00fh,0f0h,07eh,080h,0f7h,008h,0ffh,000h,0ffh,003h,0c5h,03ah,091h,06eh,0ffh,000h	; b252  ..~........:.n..
	defb 0ffh,000h,07fh,083h,06fh,0a0h,0f3h,030h,0ffh,040h,0ffh,000h,073h,08fh,023h,0dfh	; b262  ....o..0.@..s.#.
	defb 0beh,041h,093h,06fh,00fh,0ffh,0ffh,0f0h,0ffh,003h,0b7h,000h,07fh,000h,0f8h,000h	; b272  .A.o............
	defb 000h,0ffh,086h,0f9h,0ffh,0a0h,0ffh,071h,0ffh,0c0h,0d3h,000h,0cdh,000h,001h,000h	; b282  .......q........
	defb 0ech,068h,0fbh,01ah,096h,0b6h,063h,06ch,0bbh,08bh,080h,02eh,0e6h,007h,0ddh,025h	; b292  .h....cl.......%
	defb 0eeh,0eeh,0ffh,0d1h,0ffh,0ffh,093h,093h,028h,0beh,057h,0f7h,083h,0cbh,04eh,07eh	; b2a2  ........(.W...N~
	defb 0f8h,0fbh,0c0h,0beh,0abh,0fbh,0feh,0feh,0bbh,0fbh,03dh,0bch,0b0h,0fdh,056h,09eh	; b2b2  ..........=...V.

; ----------------------------------------------------------------------
; DATOS dibujo_B2C2: 3 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 10 de la lista 0xBF8B (p00:4D92, p00:4DF5); lo leen p13:9534
;   (72 bytes)
;   0xb2c2..0xb30a  (72 bytes)
DATA_dibujo_B2C2:
	defb 01ch,063h,080h,028h,016h,0e9h,0ffh,038h,0c1h,06fh,0d0h,020h,0d9h,026h,0d8h,01fh,0fch,000h,0fch,080h,000h,0e0h,000h,000h	; b2c2  .c.(...8.o. .&..........
	defb 007h,0deh,020h,076h,0f9h,000h,080h,07fh,080h,021h,0ffh,000h,0ffh,0c1h,000h,0ffh,000h,000h,000h,000h,000h,000h,000h,000h	; b2da  .. v.....!..............
	defb 000h,0c0h,000h,007h,0d7h,000h,067h,0ffh,000h,002h,0ffh,000h,060h,09ch,060h,0e0h,010h,000h,0f0h,000h,000h,0f8h,0c0h,000h	; b2f2  ......g.....`.`.........

; ----------------------------------------------------------------------
; DATOS dibujo_B30A: 45 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 11 de la lista 0xBF8B (p00:4D92, p00:4DF5); lo leen p13:9534
;   (1080 bytes)
;   0xb30a..0xb742  (1080 bytes)
DATA_dibujo_B30A:
	defb 021h,03eh,000h,0ffh,000h,000h,0ffh,000h,000h,0e2h,00dh,00dh,0ffh,000h,000h,000h,000h,000h,0f4h,000h,000h,0a3h,024h,000h	; b30a  !>....................$.
	defb 0e3h,000h,0e3h,000h,08eh,000h,022h,03fh,01ch,040h,0f0h,080h,000h,001h,000h,030h,003h,000h,05fh,0feh,0a0h,0ffh,0ffh,0ffh	; b322  ......"?.@.....0.._.....
	defb 080h,003h,080h,000h,01fh,000h,067h,0ffh,000h,07fh,07fh,042h,001h,0fdh,001h,000h,0ffh,000h,0e0h,01fh,000h,000h,0fbh,0f8h	; b33a  ......g....B............
	defb 00fh,080h,00fh,008h,0feh,000h,0fch,0ffh,000h,099h,0ffh,066h,0c0h,0ffh,0c3h,07fh,08fh,00fh,039h,0c6h,000h,040h,0b8h,0b8h	; b352  ...........f......9..@..
	defb 0ffh,000h,0ffh,070h,000h,070h,000h,083h,000h,04ch,0ffh,0b1h,027h,0ffh,0d8h,000h,0f1h,071h,0bch,040h,000h,098h,000h,000h	; b36a  ...p.p...L..'....q.@....
	defb 02fh,000h,02fh,007h,000h,007h,000h,038h,000h,000h,0ffh,0d0h,08ch,00fh,003h,0c2h,0fdh,02fh,01eh,001h,000h,00fh,000h,000h	; b382  /./....8........./......
	defb 0bah,000h,0fbh,0c1h,000h,0c1h,03fh,0c0h,03fh,0c1h,03eh,0f1h,020h,0ddh,08eh,008h,0f7h,0e0h,03eh,0c1h,000h,0e0h,000h,000h	; b39a  ......?.?.>. .....>.....
	defb 001h,003h,000h,009h,00fh,006h,000h,0feh,0e0h,000h,0ffh,0cbh,00ch,0f3h,001h,0ffh,000h,000h,0ffh,060h,000h,001h,001h,000h	; b3b2  ...................`....
	defb 023h,0ffh,0fch,00fh,0ffh,0c0h,080h,0ffh,000h,052h,0ffh,080h,0ffh,0ffh,0e7h,0ffh,0ffh,01bh,0deh,0feh,020h,07ch,07ch,000h	; b3ca  #........R.......... ||.
	defb 000h,0ffh,000h,0e5h,01fh,000h,0f8h,0dfh,007h,039h,0ffh,0c6h,000h,0ffh,019h,016h,01fh,000h,078h,044h,000h,0feh,001h,000h	; b3e2  .........9........xD....
	defb 010h,0ffh,00dh,080h,0dfh,040h,078h,0ffh,082h,01ch,0ffh,01ch,000h,07bh,000h,0b9h,0fch,000h,041h,0e0h,000h,000h,08fh,000h	; b3fa  .....@x......{....A.....
	defb 000h,003h,000h,0ffh,000h,000h,02fh,000h,000h,0e8h,000h,000h,000h,000h,000h,000h,003h,001h,0e1h,00ch,005h,0feh,000h,01fh	; b412  ....../.................
	defb 0e3h,0c3h,022h,0ceh,0fdh,0ceh,0e9h,07bh,081h,000h,07fh,0b6h,0ech,0bfh,0c0h,0bfh,0cfh,038h,0ffh,07fh,0e3h,09ch,0efh,01ch	; b42a  .."....{.........8......
	defb 00dh,01fh,00eh,004h,0f2h,000h,0f8h,000h,000h,0e2h,012h,000h,071h,07eh,001h,008h,0e0h,08fh,001h,000h,07fh,002h,000h,0feh	; b442  ............q~..........
	defb 081h,0e0h,0c0h,003h,0e0h,000h,00fh,000h,000h,0bfh,0f0h,070h,087h,00ch,088h,003h,003h,0fch,0e0h,000h,0ffh,0c8h,0c0h,00fh	; b45a  ...........p............
	defb 0fdh,000h,000h,0ffh,000h,000h,0ffh,000h,000h,0f6h,00dh,00ah,0a0h,07ch,070h,08dh,0b0h,00fh,0c0h,000h,0ffh,018h,000h,0ffh	; b472  .............|p.........
	defb 0f0h,001h,001h,0e0h,007h,006h,0e8h,0ceh,020h,003h,0e0h,003h,07fh,000h,07fh,080h,000h,0ffh,000h,000h,0ffh,0f0h,000h,0ffh	; b48a  ........ ...............
	defb 0e4h,0ffh,000h,003h,02fh,003h,00ch,04fh,00fh,021h,077h,035h,080h,0ffh,000h,090h,0f0h,000h,041h,0ffh,000h,003h,07fh,003h	; b4a2  ..../..O.!w5......A.....
	defb 0a1h,0feh,05eh,060h,0e4h,084h,007h,07fh,077h,0c8h,0c8h,000h,002h,013h,011h,07ch,0ffh,083h,09eh,0fdh,07ah,071h,0e0h,0d1h	; b4ba  ..^`....w......|....zq..
	defb 080h,06bh,068h,029h,096h,096h,002h,08dh,00dh,00fh,000h,000h,0c3h,0dfh,09ch,014h,0f0h,064h,012h,000h,013h,0c0h,000h,0ffh	; b4d2  .kh).............d......
	defb 007h,0f8h,000h,011h,0ceh,0ceh,0a7h,058h,058h,000h,000h,000h,047h,0c0h,080h,02dh,03ch,011h,092h,000h,0f3h,000h,000h,0ffh	; b4ea  .......XX...G..-<.......
	defb 000h,0ffh,004h,01ch,0e3h,0e3h,0ffh,000h,000h,052h,000h,000h,003h,003h,000h,0b0h,0b8h,049h,008h,000h,0ffh,000h,000h,0ffh	; b502  .........R.......I......
	defb 078h,080h,000h,05eh,0a0h,0a0h,0e7h,000h,000h,03fh,000h,000h,0e7h,060h,080h,001h,000h,001h,078h,000h,0ffh,000h,000h,0ffh	; b51a  x..^.....?...`....x.....
	defb 0bch,043h,000h,07bh,000h,0e3h,014h,000h,0f4h,00bh,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh	; b532  .C.{....................
	defb 080h,05bh,000h,050h,0f8h,000h,0c8h,017h,0deh,0a0h,001h,0e0h,009h,000h,0ffh,000h,000h,0ffh,001h,000h,0ffh,00dh,000h,0fdh	; b54a  .[.P....................
	defb 000h,0c1h,001h,01fh,000h,000h,0e0h,000h,000h,007h,0ffh,0e0h,09ch,000h,09ch,000h,000h,0ffh,003h,000h,0ffh,0dfh,000h,0dfh	; b562  ........................
	defb 01fh,0c0h,0c0h,0e3h,000h,000h,008h,000h,000h,010h,000h,000h,014h,0c0h,0c0h,004h,01ch,098h,0b9h,006h,0fbh,01fh,000h,01fh	; b57a  ........................
	defb 0c7h,000h,0ffh,09eh,000h,0feh,0f0h,00ch,0f0h,0c6h,07fh,09fh,02ch,02fh,080h,080h,081h,000h,000h,00ch,000h,000h,078h,000h	; b592  ............,/........x.
	defb 038h,000h,078h,000h,007h,000h,078h,07fh,006h,0dfh,0ffh,00bh,000h,0ffh,000h,007h,09ch,000h,061h,041h,000h,000h,09fh,000h	; b5aa  8.x...x...........aA....
	defb 000h,00fh,001h,006h,0ffh,0cfh,03eh,0ffh,0feh,0ffh,000h,000h,000h,080h,000h,003h,0ffh,000h,02fh,03fh,010h,0e8h,0efh,007h	; b5c2  ......>.........../?....
	defb 087h,0ffh,0d9h,0e3h,0fch,0fch,0fbh,000h,000h,0d8h,007h,000h,040h,03fh,000h,067h,0ffh,088h,0ffh,0ffh,000h,09fh,0ffh,060h	; b5da  ............@?.g.......`
	defb 00dh,062h,000h,000h,07fh,000h,070h,07fh,000h,0ceh,0ffh,000h,0feh,08fh,001h,0fdh,01fh,002h,01eh,0ffh,0feh,00ah,0ffh,005h	; b5f2  .b....p.................
	defb 003h,0ffh,000h,07fh,09fh,000h,002h,0ffh,009h,000h,0ffh,004h,0c1h,0ffh,0f0h,0b8h,0ffh,007h,017h,0ffh,00fh,078h,0ffh,0a7h	; b60a  .....................x..
	defb 0fah,0ffh,084h,0e3h,0e0h,0c3h,0fch,088h,074h,09ch,0ffh,0fbh,0feh,0ffh,0f1h,03fh,0ffh,0c0h,01fh,0ffh,0fch,0ffh,0ffh,0e4h	; b622  ........t......?........
	defb 02ch,0c0h,03fh,043h,000h,0ffh,0fch,000h,0fch,0b1h,00fh,0b0h,0ffh,0ffh,0ach,018h,0ffh,000h,0f7h,0ffh,008h,0c0h,0ffh,002h	; b63a  ,.?C....................
	defb 000h,000h,0ffh,0ffh,000h,0ffh,008h,000h,008h,025h,0c2h,0e7h,0beh,0ffh,00eh,000h,0ffh,000h,0ceh,0ffh,000h,0bfh,0ffh,040h	; b652  .........%.............@
	defb 000h,000h,0ffh,087h,000h,0ffh,0e0h,000h,0e0h,00dh,00dh,000h,0b7h,0bfh,08bh,020h,0f3h,023h,054h,0ffh,000h,070h,0f0h,000h	; b66a  ............... .#T..p..
	defb 03ch,000h,0ffh,0c3h,000h,0c3h,019h,018h,001h,07eh,07eh,038h,0b8h,0b9h,081h,0e6h,000h,000h,00eh,0feh,000h,0d8h,0d8h,000h	; b682  <........~~8............
	defb 002h,000h,0ffh,087h,000h,0ffh,0fch,000h,0fch,040h,003h,040h,0fch,0eeh,010h,08eh,0e8h,060h,038h,000h,000h,06fh,060h,000h	; b69a  .........@.@.....`8..o`.
	defb 001h,0d1h,0d0h,035h,000h,037h,0cfh,000h,0ffh,001h,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh,01ch,000h,0ffh	; b6b2  ...5.7..................
	defb 0d0h,09fh,046h,0a1h,020h,081h,079h,000h,0ffh,0c0h,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh,00fh,000h,0ffh,078h,000h,0f8h	; b6ca  ..F. .y..............x..
	defb 0e0h,0feh,000h,01eh,0feh,000h,0c9h,0ffh,006h,0f0h,0ffh,00eh,01fh,0ffh,0e3h,0ffh,0ffh,07dh,0ffh,0ffh,000h,096h,0f7h,000h	; b6e2  .................}......
	defb 0c3h,0c3h,000h,0d0h,0dfh,000h,0e7h,0afh,00ah,0fch,07fh,01bh,083h,0feh,07ch,0ffh,0efh,000h,000h,0ffh,0f0h,0c0h,03ch,000h	; b6fa  ..............|.......<.
	defb 0f0h,0f0h,000h,03fh,0bfh,000h,060h,0ffh,000h,02bh,0efh,0efh,080h,0ffh,07fh,00fh,0ffh,0f0h,07fh,082h,000h,063h,0dfh,01fh	; b712  ...?..`..+...........c..
	defb 030h,03fh,003h,08fh,0ffh,000h,006h,0ffh,000h,0f0h,0ffh,081h,0fah,0ffh,0e5h,060h,0e7h,087h,083h,08fh,007h,093h,0fdh,030h	; b72a  0?.............`.......0

; ----------------------------------------------------------------------
; DATOS dibujo_B742: 43 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 12 de la lista 0xBF8B (p00:4D92, p00:4DF5); lo leen p13:9534
;   (1032 bytes)
;   0xb742..0xbb4a  (1032 bytes)
DATA_dibujo_B742:
	defb 03ch,0ffh,0d3h,0dfh,0ffh,006h,007h,0ffh,000h,07ch,0ffh,080h,007h,0ffh,0f8h,07eh,0ffh,08dh,0ffh,0efh,0e0h,0ffh,01fh,000h	; b742  <........|.....~........
	defb 0f8h,000h,0ffh,08fh,060h,0afh,0bch,0dbh,01bh,0ffh,001h,001h,061h,09eh,000h,0fch,038h,000h,001h,0c1h,000h,007h,0c0h,000h	; b75a  ....`.......a...8.......
	defb 0b1h,001h,0f0h,0e7h,03fh,0d8h,0efh,0dfh,0ffh,079h,0f9h,000h,0fch,000h,000h,00eh,000h,000h,028h,038h,018h,0b9h,0ffh,046h	; b772  ....?....y........(8...F
	defb 093h,0f0h,063h,001h,0ffh,0feh,0f5h,0ffh,0fah,0fch,0ffh,07ch,000h,002h,000h,0c0h,081h,001h,013h,013h,000h,0e7h,0ffh,018h	; b78a  ..c........|............
	defb 0f1h,032h,0c1h,0c6h,0ffh,018h,001h,0ffh,0feh,079h,0ffh,07bh,00ch,003h,000h,038h,0f8h,0c0h,0f3h,0ffh,00ch,087h,0ffh,07ah	; b7a2  .2.......y.{...8.......z
	defb 01eh,000h,01fh,003h,0c0h,003h,0ech,0fch,000h,0deh,0feh,0e6h,000h,0f0h,000h,078h,078h,000h,08fh,0ffh,070h,0feh,0ffh,0f7h	; b7ba  ...............xx...p...
	defb 0feh,008h,000h,009h,076h,000h,020h,0d9h,000h,00ch,013h,000h,0fch,000h,000h,0f8h,000h,000h,090h,0e0h,000h,013h,0ffh,00dh	; b7d2  ....v. .................
	defb 0fbh,03fh,03fh,000h,09fh,003h,020h,0c0h,000h,0dfh,020h,000h,020h,007h,000h,080h,05ch,000h,000h,021h,000h,0c1h,0dfh,0c0h	; b7ea  .??... ... . ...\..!....
	defb 080h,0ffh,027h,0f1h,0ffh,050h,000h,0ffh,0bah,086h,09fh,081h,0c0h,0ffh,0dah,086h,0ffh,060h,0a0h,0bch,09ch,05eh,0deh,0d0h	; b802  ..'..P...........`...^..
	defb 043h,07fh,024h,086h,079h,0deh,04bh,0f6h,08dh,000h,0d9h,0dah,049h,0b7h,04eh,000h,0ech,0fah,0efh,0d7h,028h,0f0h,0ffh,093h	; b81a  C.$.y.K.....I.N.....(...
	defb 0f0h,000h,000h,0feh,000h,000h,0bfh,000h,000h,0fch,003h,000h,004h,080h,000h,0a1h,0f2h,000h,098h,07dh,000h,060h,0ffh,09fh	; b832  ...................}.`..
	defb 043h,000h,000h,00fh,000h,000h,044h,000h,000h,000h,008h,000h,0e8h,010h,000h,087h,079h,008h,0ech,01fh,003h,0eeh,011h,000h	; b84a  C.....D.........y.......
	defb 0c0h,000h,000h,030h,000h,000h,01ch,000h,000h,020h,000h,000h,000h,0e6h,000h,009h,0ffh,000h,0efh,0ffh,000h,035h,0ffh,0c2h	; b862  ...0..... ...........5..
	defb 000h,000h,000h,001h,000h,000h,00fh,000h,000h,000h,001h,000h,000h,05fh,000h,08eh,0ffh,000h,0bfh,0ffh,000h,0ffh,0ffh,0dch	; b87a  ............._..........
	defb 00fh,000h,000h,0ffh,000h,000h,0e1h,000h,000h,000h,018h,000h,060h,0fdh,000h,03fh,0ffh,000h,0f8h,0ffh,007h,0bah,0fch,05ch	; b892  ............`..?.......\
	defb 07eh,0ffh,07eh,0c4h,0ffh,0ffh,00bh,0ffh,0fbh,0ffh,0ffh,00ah,04fh,04fh,008h,0ffh,0ffh,000h,000h,0ffh,000h,09fh,07fh,00fh	; b8aa  ~.~.........OO..........
	defb 09ch,0ffh,063h,009h,0ffh,0f6h,0fbh,0ffh,041h,0ffh,0ffh,020h,0fch,0ffh,000h,0a7h,05fh,000h,01eh,0feh,000h,080h,0ffh,000h	; b8c2  ..c.....A.. ...._.......
	defb 0fch,0ffh,000h,040h,0f7h,000h,000h,01fh,000h,0f9h,0ffh,088h,0ffh,0ffh,001h,0ffh,0ffh,01ch,0f3h,0ffh,0feh,0ffh,0ffh,0c0h	; b8da  ...@....................
	defb 0ffh,000h,000h,087h,078h,000h,034h,0ffh,000h,0d8h,0dbh,000h,00ah,0d7h,0d0h,0f6h,020h,000h,0feh,060h,000h,01eh,016h,008h	; b8f2  ....x.4......... ..`....
	defb 0e4h,01ah,000h,01ch,000h,000h,001h,062h,000h,001h,0afh,000h,09ah,0ffh,000h,0e1h,0ffh,000h,0ech,0efh,003h,039h,0fch,0c1h	; b90a  .......b.............9..
	defb 000h,0e5h,000h,005h,07ah,000h,02fh,0d0h,000h,09fh,0a5h,000h,08fh,0ffh,000h,0fch,0fdh,000h,0fbh,0e0h,018h,082h,000h,082h	; b922  ....z./.................
	defb 00fh,000h,000h,0c0h,003h,000h,030h,000h,000h,030h,0c4h,000h,0b2h,0fch,000h,0c6h,079h,000h,0cah,00bh,000h,0e0h,000h,0e0h	; b93a  ......0..0......y.......
	defb 000h,000h,000h,006h,00fh,000h,009h,033h,000h,0b8h,040h,000h,0e0h,000h,000h,000h,000h,000h,0ceh,0ffh,000h,027h,000h,0f7h	; b952  .......3..@..........'..
	defb 025h,0bfh,000h,000h,001h,000h,0b0h,0f0h,000h,00ch,00eh,000h,000h,000h,000h,000h,000h,000h,09eh,0ffh,000h,008h,08bh,064h	; b96a  %......................d
	defb 0c0h,0ffh,000h,01eh,0e0h,000h,044h,000h,000h,002h,0cah,000h,000h,000h,000h,000h,000h,000h,03dh,0ffh,000h,051h,001h,0feh	; b982  ......D...........=..Q..
	defb 006h,0afh,000h,000h,047h,000h,034h,0b3h,000h,04ch,0feh,000h,000h,073h,000h,000h,000h,000h,0dfh,0ffh,000h,009h,009h,0d0h	; b99a  ....G.4..L...s..........
	defb 0f7h,0ffh,0c6h,0ffh,0ffh,060h,033h,0fch,000h,00ch,073h,000h,003h,000h,000h,000h,000h,000h,0ffh,0ffh,000h,07fh,0ffh,07fh	; b9b2  .....`3...s.............
	defb 0e3h,0dfh,0c3h,0b9h,0ffh,028h,07eh,0ffh,000h,001h,01fh,000h,0f1h,000h,000h,000h,000h,000h,0ffh,0ffh,000h,0fdh,0fdh,0c5h	; b9ca  .....(~.................
	defb 015h,0fdh,0c8h,0feh,0ffh,001h,00ch,0ffh,000h,080h,080h,000h,080h,000h,000h,000h,000h,000h,0ffh,0ffh,000h,0cbh,0fdh,0f6h	; b9e2  ........................
	defb 0ceh,0feh,03ch,070h,0ffh,08fh,08fh,0cfh,040h,0d0h,051h,000h,000h,000h,000h,000h,000h,000h,0cdh,0ffh,000h,040h,0dah,0b5h	; b9fa  ..<p....@.Q..........@..
	defb 0e1h,0e1h,000h,078h,0f8h,080h,006h,07eh,000h,000h,097h,000h,000h,000h,000h,000h,000h,000h,08dh,0ffh,000h,095h,0d5h,02ah	; ba12  ...x...~...............*
	defb 0a0h,0a0h,000h,0f0h,0fdh,005h,046h,03fh,000h,094h,023h,000h,000h,000h,000h,000h,000h,000h,0edh,0ffh,000h,040h,080h,069h	; ba2a  ......F?..#..........@.i
	defb 03ah,07bh,040h,060h,0fdh,080h,0c5h,0f8h,000h,038h,0c0h,000h,001h,000h,000h,000h,000h,000h,070h,0ffh,000h,020h,000h,0b5h	; ba42  :{@`.....8........p.. ..
	defb 000h,000h,03eh,063h,001h,0f6h,0c8h,00ah,0f5h,003h,063h,09ch,006h,000h,0f6h,0c4h,000h,0efh,008h,000h,0feh,0b1h,004h,0b3h	; ba5a  ..>c......c.............
	defb 00ch,060h,09fh,001h,000h,0d5h,0bbh,000h,0ffh,000h,086h,059h,06eh,02ch,0c2h,0c0h,005h,0fah,002h,0d0h,026h,06eh,000h,0ffh	; ba72  .`.........Yn,......&n..
	defb 024h,024h,05bh,002h,04bh,0b4h,005h,005h,0cah,040h,003h,064h,00bh,001h,07eh,005h,040h,0a5h,001h,026h,0d9h,011h,091h,066h	; ba8a  $$[.K....@.d..~.@..&...f
	defb 0ffh,0d1h,02eh,024h,035h,08ah,07fh,0d2h,02dh,00bh,004h,06bh,0e7h,000h,0e7h,02ch,07ch,083h,057h,08dh,052h,0bdh,0b2h,00dh	; baa2  ...$5...-..k...,|.W.R...
	defb 0ffh,096h,069h,03fh,0b3h,04ch,0cbh,0ebh,022h,08dh,00dh,0c0h,039h,0d8h,021h,0cfh,0b4h,04bh,06fh,05dh,0b2h,05fh,0f2h,08dh	; baba  ..i?.L.."...9.!..Ko]._..
	defb 019h,09fh,082h,076h,0f5h,00bh,082h,0ddh,076h,00eh,0a7h,079h,0bfh,0e8h,057h,068h,097h,0feh,0cah,06dh,0b7h,01dh,042h,09dh	; bad2  ...v....v..y..Wh...m..B.
	defb 082h,0c7h,008h,008h,03bh,0f4h,0b0h,0ffh,003h,04ah,0eah,095h,01dh,085h,07ah,0a0h,0b3h,05ch,0d9h,0fdh,002h,006h,046h,0b9h	; baea  .........J....z..\....F.
	defb 0c3h,0d3h,02ch,024h,076h,089h,001h,0ach,053h,0c9h,0c9h,036h,022h,066h,089h,0e8h,0ddh,022h,004h,02ch,0d2h,018h,09ah,065h	; bb02  ..,$v...S..6"f...".,...e
	defb 066h,066h,010h,000h,040h,08bh,035h,0b3h,044h,05ch,051h,0aeh,0cah,010h,0efh,058h,059h,002h,020h,000h,0fdh,0ach,0a0h,05eh	; bb1a  ff..@.5.D\Q....XY. ....^
	defb 083h,000h,0e7h,000h,000h,0d9h,0c6h,088h,066h,008h,000h,0ffh,035h,080h,03dh,000h,000h,07eh,0b0h,084h,07bh,000h,000h,02ch	; bb32  ........f...5.=..~..{..,

; ----------------------------------------------------------------------
; DATOS resto_BB4A: lo apuntan con el banco puesto p01:7161 (0xBB4A); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p01:7161 (139 bytes)
;   0xbb4a..0xbbd5  (139 bytes)
DATA_resto_BB4A:
	defb 007h,000h,081h,043h,00eh,000h,083h,03dh,041h,010h,003h,000h,081h,055h,007h,000h	; bb4a  ...C...=A....U..
	defb 08ah,01ah,029h,02ch,03ah,05ah,04eh,04fh,050h,051h,052h,004h,000h,08bh,03ch,01bh	; bb5a  ..),:ZNOPQR...<.
	defb 01ch,01dh,049h,01eh,017h,01fh,045h,020h,003h,005h,000h,08bh,022h,053h,067h,068h	; bb6a  ..I...E ...."Sgh
	defb 069h,028h,02bh,023h,046h,021h,001h,005h,000h,08bh,004h,054h,063h,062h,064h,065h	; bb7a  i(+#F!.....Tcbde
	defb 066h,002h,024h,025h,059h,004h,000h,0aeh,05ch,026h,031h,032h,033h,034h,048h,019h	; bb8a  f.$%Y...\&1234H.
	defb 015h,016h,047h,027h,05dh,05eh,000h,000h,02fh,044h,057h,05bh,04ah,030h,02ah,018h	; bb9a  ..G']^../DW[J0*.
	defb 035h,02dh,02eh,038h,039h,04dh,000h,000h,005h,04ch,04bh,03eh,03bh,006h,037h,036h	; bbaa  5-.89M...LK>..76
	defb 012h,007h,008h,009h,00ah,00bh,004h,000h,088h,014h,03fh,00ch,042h,00dh,011h,00eh	; bbba  ..........?.B...
	defb 00fh,008h,000h,084h,013h,000h,000h,040h,009h,000h,000h	; bbca  .......@...

; ----------------------------------------------------------------------
; DATOS mosaico_BBD5: un mosaico de 12 x 16 caracteres, un byte cada uno
;   (p00:510F; BC = 0x0C10 en quien llama); lo leen p01:719C (192 bytes)
;   0xbbd5..0xbc95  (192 bytes)
DATA_mosaico_BBD5:
	defb 00bh,00ch,0a0h,017h,0a1h,0a2h,0a3h,0a4h,01dh,01eh,0a8h,00dh,0a9h,0aah,0abh,00eh	; bbd5  ................
	defb 080h,081h,082h,083h,00fh,074h,076h,077h,078h,079h,090h,091h,018h,019h,01ah,01bh	; bbe5  .....tvwxy......
	defb 084h,085h,086h,087h,01ch,097h,098h,099h,09ah,09bh,06ah,06bh,06ch,06dh,06eh,06fh	; bbf5  ..........jklmno
	defb 010h,069h,072h,073h,025h,02eh,066h,067h,046h,047h,056h,07bh,07ch,07dh,07eh,07fh	; bc05  .irs%.fgFGV{|}~.
	defb 02ah,011h,088h,089h,05ah,048h,049h,04ah,001h,002h,08ah,08bh,08ch,08dh,08eh,08fh	; bc15  *...ZHIJ........
	defb 027h,02bh,02ch,026h,057h,04bh,003h,005h,005h,006h,05bh,05ch,020h,07ah,045h,012h	; bc25  '+,&WK....[\ zE.
	defb 013h,070h,021h,028h,058h,068h,04ch,00ah,04dh,04eh,05dh,05eh,02dh,059h,071h,029h	; bc35  .p!(XhL.MN]^-Yq)
	defb 01fh,093h,094h,095h,096h,04fh,007h,008h,009h,050h,055h,05fh,092h,042h,043h,044h	; bc45  .....O...PU_.BCD
	defb 014h,09ch,09dh,022h,061h,062h,051h,052h,053h,054h,060h,0a7h,036h,038h,03ah,03bh	; bc55  ..."abQRST`.68:.
	defb 015h,016h,02fh,030h,031h,0a5h,0a6h,023h,032h,033h,034h,035h,037h,039h,024h,03ch	; bc65  ../01..#234579$<
	defb 0ach,0adh,0aeh,0afh,041h,0b0h,03dh,03eh,03fh,040h,0b1h,0b2h,0b3h,0b4h,0b5h,0b6h	; bc75  ....A.=>?@......
	defb 0b7h,0b8h,0b9h,0bah,0bbh,075h,063h,064h,065h,09eh,09fh,0bch,0bdh,0beh,0bfh,0c0h	; bc85  .....ucde.......

; ----------------------------------------------------------------------
; DATOS resto_BC95: lo apuntan con el banco puesto p01:717C (0xBC95); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p01:717C (62 bytes)
;   0xbc95..0xbcd3  (62 bytes)
DATA_resto_BC95:
	defb 0bch,0c2h,0cch,0cdh,0ceh,0cfh,0d0h,0d1h,0d1h,0d2h,0d3h,0d4h,0c2h,0c2h,0d5h,0d6h	; bc95  ................
	defb 0d7h,0d8h,0d9h,0dah,0dbh,0dch,0ddh,0deh,0c2h,0c2h,0dfh,0e0h,0e1h,0e2h,0e3h,0e4h	; bca5  ................
	defb 0e5h,0e6h,0e7h,0e8h,0c2h,0c2h,0e9h,0eah,0ebh,0ech,0edh,0edh,0eeh,0efh,0f0h,0f1h	; bcb5  ................
	defb 0c2h,0c1h,0c1h,0c3h,0c4h,0c5h,0c6h,0c7h,0c8h,0c9h,0cah,0cbh,0c1h,000h	; bcc5  ..............

; ----------------------------------------------------------------------
; DATOS mosaico_BCD3: un mosaico de 2 x 1 caracteres, un byte cada uno
;   (p00:510F; BC = 0x0201 en quien llama); lo leen p01:647D (2 bytes)
;   0xbcd3..0xbcd5  (2 bytes)
DATA_mosaico_BCD3:
	defb 005h	; bcd3
	defb 001h	; bcd4

; ----------------------------------------------------------------------
; DATOS bytes_BCD5: 6 bytes entre los mosaicos de 2 x 1 de 0xBCD3 y 0xBCDB,
;   como tres mosaicos mas de 2 x 1; ningun lector del listado llega a ellos
;   ni los apunta ninguna tabla declarada
;   0xbcd5..0xbcdb  (6 bytes)
DATA_bytes_BCD5:
	defb 01dh,01fh,006h,002h,01eh,020h	; bcd5

; ----------------------------------------------------------------------
; DATOS mosaico_BCDB: un mosaico de 2 x 1 caracteres, un byte cada uno
;   (p00:510F; BC = 0x0201 en quien llama); lo leen p01:647D (2 bytes)
;   0xbcdb..0xbcdd  (2 bytes)
DATA_mosaico_BCDB:
	defb 001h	; bcdb
	defb 016h	; bcdc

; ----------------------------------------------------------------------
; DATOS bytes_BCDD: 451 bytes de numeros de caracter entre mosaico_BCDB y
;   tabla_colores_BEA0; ningun lector del listado llega a ellos ni los apunta
;   ninguna tabla declarada
;   0xbcdd..0xbea0  (451 bytes)
DATA_bytes_BCDD:
	defb 007h,002h,017h,008h,012h,013h,008h,00bh,00bh,004h,018h,019h,00eh,014h,015h,00ah	; bcdd  ................
	defb 001h,002h,008h,01ah,01ch,008h,021h,022h,0ffh,014h,015h,00ah,009h,00ah,008h,01fh	; bced  ......!"........
	defb 020h,008h,001h,002h,008h,00bh,00ah,00eh,00ch,00dh,008h,009h,00ah,008h,001h,002h	; bcfd   ...............
	defb 008h,01ah,01ch,00eh,007h,008h,0ffh,025h,020h,008h,018h,019h,008h,03fh,040h,008h	; bd0d  .......% ....?@.
	defb 009h,00ah,008h,021h,022h,00eh,016h,017h,008h,018h,019h,008h,01ah,01ch,008h,007h	; bd1d  ...!"...........
	defb 008h,008h,009h,00ah,008h,016h,017h,0ffh,00eh,00fh,008h,00bh,00bh,004h,016h,017h	; bd2d  ................
	defb 008h,007h,008h,00eh,007h,008h,0ffh,00eh,00fh,008h,018h,019h,008h,01ah,01ch,008h	; bd3d  ................
	defb 01ah,01ch,008h,025h,020h,00eh,023h,024h,00ah,00eh,00fh,008h,00bh,00bh,004h,01fh	; bd4d  ...% .#$........
	defb 020h,008h,009h,00ah,0ffh,01ah,01ch,008h,018h,019h,008h,025h,020h,00eh,012h,013h	; bd5d   ..........% ...
	defb 008h,025h,020h,008h,001h,002h,008h,016h,017h,008h,003h,004h,008h,009h,00ah,008h	; bd6d  .% .............
	defb 00bh,00ah,0ffh,00ch,00dh,008h,018h,019h,008h,00bh,00ah,008h,00bh,00bh,004h,001h	; bd7d  ................
	defb 002h,008h,01fh,020h,008h,009h,00ah,0ffh,003h,004h,008h,00bh,00bh,004h,00ch,00dh	; bd8d  ... ............
	defb 00eh,003h,004h,008h,018h,019h,008h,01dh,01eh,008h,01dh,01eh,0ffh,014h,015h,00ah	; bd9d  ................
	defb 001h,002h,008h,01dh,01eh,008h,01fh,020h,008h,009h,00ah,008h,01ah,01ch,00eh,014h	; bdad  ....... ........
	defb 015h,00ah,00bh,00bh,004h,00bh,00ah,008h,00bh,00ah,008h,009h,00ah,008h,01ah,01ch	; bdbd  ................
	defb 0ffh,016h,017h,008h,001h,002h,008h,01fh,020h,008h,001h,002h,008h,01dh,01eh,008h	; bdcd  ........ .......
	defb 00eh,00fh,008h,001h,002h,00eh,014h,015h,00ah,001h,002h,008h,01ah,01ch,008h,005h	; bddd  ................
	defb 006h,008h,018h,019h,008h,021h,022h,008h,001h,002h,0ffh,009h,00bh,008h,01ah,01ch	; bded  .....!".........
	defb 008h,001h,002h,008h,016h,017h,008h,012h,013h,00eh,025h,020h,008h,009h,00ah,008h	; bdfd  ..........% ....
	defb 001h,002h,008h,00ch,00dh,008h,009h,00ah,008h,01ah,01ch,0ffh,00ch,00dh,008h,01ah	; be0d  ................
	defb 01ch,008h,009h,00ah,008h,025h,020h,00eh,009h,00bh,008h,018h,019h,008h,041h,042h	; be1d  .....% .......AB
	defb 0ffh,01ah,01bh,008h,009h,00ah,008h,01fh,020h,008h,018h,019h,008h,01ah,01ch,008h	; be2d  ........ .......
	defb 018h,019h,008h,021h,022h,00ah,00bh,00bh,004h,005h,006h,008h,00eh,00fh,00eh,014h	; be3d  ...!"...........
	defb 015h,00ah,001h,002h,008h,007h,008h,008h,016h,017h,008h,001h,002h,008h,01ah,01ch	; be4d  ................
	defb 0ffh,00ch,00dh,008h,009h,00ah,008h,018h,019h,008h,01ah,01ch,008h,00ch,00dh,008h	; be5d  ................
	defb 009h,00ah,00eh,012h,013h,008h,009h,00ah,008h,01dh,01eh,008h,00bh,00ah,008h,009h	; be6d  ................
	defb 00ah,008h,01ah,01ch,0ffh,01dh,01eh,008h,018h,019h,008h,00bh,00ah,008h,00bh,00bh	; be7d  ................
	defb 004h,007h,008h,00eh,01dh,01eh,008h,016h,017h,008h,001h,002h,008h,012h,013h,008h	; be8d  ................
	defb 009h,00ah,0ffh	; be9d

; ----------------------------------------------------------------------
; DATOS tabla_colores_BEA0: 24 punteros a colores de dibujo (los usa hasta el
;   indice 23; p00:4DA0); lo leen p00:4DA0 (48 bytes)
;   0xbea0..0xbed0  (48 bytes)
DATA_tabla_colores_BEA0:
	defw 0bed0h,0bed4h,0bed8h,0bedch,0bee0h,0bee4h,0bee8h,0beech	; bea0
	defw 0bef0h,0bef4h,0bef8h,0befch,0bf00h,0bf04h,0bf08h,0bf0ch	; beb0
	defw 0bf0eh,0bf12h,0bf16h,0bf17h,0bf19h,0bf1bh,0bf1dh,0bf1fh	; bec0

; ----------------------------------------------------------------------
; DATOS colores_BED0: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p13:952B (4 bytes)
;   0xbed0..0xbed4  (4 bytes)
DATA_colores_BED0:
	defb 001h,02fh,034h,07ah	; bed0

; ----------------------------------------------------------------------
; DATOS colores_BED4: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p13:952B (4 bytes)
;   0xbed4..0xbed8  (4 bytes)
DATA_colores_BED4:
	defb 007h,0afh,012h,03eh	; bed4

; ----------------------------------------------------------------------
; DATOS colores_BED8: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p13:952B (4 bytes)
;   0xbed8..0xbedc  (4 bytes)
DATA_colores_BED8:
	defb 012h,034h,0adh,0efh	; bed8

; ----------------------------------------------------------------------
; DATOS colores_BEDC: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p13:952B (4 bytes)
;   0xbedc..0xbee0  (4 bytes)
DATA_colores_BEDC:
	defb 00dh,0efh,067h,09ah	; bedc

; ----------------------------------------------------------------------
; DATOS colores_BEE0: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p13:952B (4 bytes)
;   0xbee0..0xbee4  (4 bytes)
DATA_colores_BEE0:
	defb 012h,03fh,049h,0adh	; bee0

; ----------------------------------------------------------------------
; DATOS colores_BEE4: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p13:952B (4 bytes)
;   0xbee4..0xbee8  (4 bytes)
DATA_colores_BEE4:
	defb 00ah,0efh,012h,07dh	; bee4

; ----------------------------------------------------------------------
; DATOS colores_BEE8: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p13:952B (4 bytes)
;   0xbee8..0xbeec  (4 bytes)
DATA_colores_BEE8:
	defb 001h,023h,04ah,0dfh	; bee8

; ----------------------------------------------------------------------
; DATOS colores_BEEC: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p13:952B (4 bytes)
;   0xbeec..0xbef0  (4 bytes)
DATA_colores_BEEC:
	defb 001h,023h,046h,07fh	; beec

; ----------------------------------------------------------------------
; DATOS colores_BEF0: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p13:952B (4 bytes)
;   0xbef0..0xbef4  (4 bytes)
DATA_colores_BEF0:
	defb 001h,023h,048h,09fh	; bef0

; ----------------------------------------------------------------------
; DATOS colores_BEF4: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p13:952B, p13:9543 (4
;   bytes)
;   0xbef4..0xbef8  (4 bytes)
DATA_colores_BEF4:
	defb 07fh,012h,034h,0adh	; bef4

; ----------------------------------------------------------------------
; DATOS colores_BEF8: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p13:952B (4 bytes)
;   0xbef8..0xbefc  (4 bytes)
DATA_colores_BEF8:
	defb 001h,023h,047h,08fh	; bef8

; ----------------------------------------------------------------------
; DATOS colores_BEFC: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p13:952B (4 bytes)
;   0xbefc..0xbf00  (4 bytes)
DATA_colores_BEFC:
	defb 012h,034h,069h,0efh	; befc

; ----------------------------------------------------------------------
; DATOS colores_BF00: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p13:952B (4 bytes)
;   0xbf00..0xbf04  (4 bytes)
DATA_colores_BF00:
	defb 014h,056h,09dh,0efh	; bf00

; ----------------------------------------------------------------------
; DATOS colores_BF04: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p13:952B, p13:9534 (4
;   bytes)
;   0xbf04..0xbf08  (4 bytes)
DATA_colores_BF04:
	defb 012h,036h,059h,0dfh	; bf04

; ----------------------------------------------------------------------
; DATOS colores_BF08: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p13:952B, p13:9543 (4
;   bytes)
;   0xbf08..0xbf0c  (4 bytes)
DATA_colores_BF08:
	defb 0bfh,013h,046h,09dh	; bf08

; ----------------------------------------------------------------------
; DATOS colores_BF0C: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p13:9534 (2 bytes)
;   0xbf0c..0xbf0e  (2 bytes)
DATA_colores_BF0C:
	defb 068h,09ah	; bf0c

; ----------------------------------------------------------------------
; DATOS colores_BF0E: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p13:9534 (4 bytes)
;   0xbf0e..0xbf12  (4 bytes)
DATA_colores_BF0E:
	defb 034h,068h,012h,09ah	; bf0e

; ----------------------------------------------------------------------
; DATOS colores_BF12: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p13:9534 (4 bytes)
;   0xbf12..0xbf16  (4 bytes)
DATA_colores_BF12:
	defb 07ah,089h,036h,0bch	; bf12

; ----------------------------------------------------------------------
; DATOS colores_BF16: 2 colores de 4 bits, dos por byte, para un dibujo de 1
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p13:9543 (1 bytes)
;   0xbf16..0xbf17  (1 bytes)
DATA_colores_BF16:
	defb 07bh	; bf16

; ----------------------------------------------------------------------
; DATOS colores_BF17: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p13:9534 (2 bytes)
;   0xbf17..0xbf19  (2 bytes)
DATA_colores_BF17:
	defb 034h,069h	; bf17

; ----------------------------------------------------------------------
; DATOS colores_BF19: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p13:9534 (2 bytes)
;   0xbf19..0xbf1b  (2 bytes)
DATA_colores_BF19:
	defb 046h,089h	; bf19

; ----------------------------------------------------------------------
; DATOS colores_BF1B: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p13:9534 (2 bytes)
;   0xbf1b..0xbf1d  (2 bytes)
DATA_colores_BF1B:
	defb 036h,089h	; bf1b

; ----------------------------------------------------------------------
; DATOS colores_BF1D: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p13:9534 (2 bytes)
;   0xbf1d..0xbf1f  (2 bytes)
DATA_colores_BF1D:
	defb 036h,08ah	; bf1d

; ----------------------------------------------------------------------
; DATOS colores_BF1F: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p13:9534 (2 bytes)
;   0xbf1f..0xbf21  (2 bytes)
DATA_colores_BF1F:
	defb 038h,09ah	; bf1f

; ----------------------------------------------------------------------
; DATOS lista_BF21: 21 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0xBEA0); lo leen p13:952B (106 bytes)
;   0xbf21..0xbf8b  (106 bytes)
DATA_lista_BF21:
	defb 044h,000h,001h,0b2h,0a3h	; bf21
	defb 04eh,003h,005h,0f2h,0a3h	; bf26
	defb 041h,001h,013h,0d2h,0a4h	; bf2b
	defb 041h,005h,014h,0e2h,0a4h	; bf30
	defb 045h,004h,015h,0f2h,0a4h	; bf35
	defb 091h,000h,01ah,042h,0a5h	; bf3a
	defb 086h,001h,02bh,0dah,0a6h	; bf3f
	defb 08bh,002h,031h,06ah,0a7h	; bf44
	defb 088h,003h,03ch,072h,0a8h	; bf49
	defb 086h,004h,044h,032h,0a9h	; bf4e
	defb 084h,005h,04ah,0c2h,0a9h	; bf53
	defb 085h,006h,04eh,022h,0aah	; bf58
	defb 082h,007h,053h,09ah,0aah	; bf5d
	defb 082h,00ah,055h,0cah,0aah	; bf62
	defb 084h,008h,057h,0fah,0aah	; bf67
	defb 081h,009h,05bh,05ah,0abh	; bf6c
	defb 086h,00ah,05ch,072h,0abh	; bf71
	defb 081h,00bh,062h,002h,0ach	; bf76
	defb 081h,00ch,063h,01ah,0ach	; bf7b
	defb 083h,00dh,064h,032h,0ach	; bf80
	defb 083h,00eh,067h,07ah,0ach	; bf85
	defb 0ffh	; bf8a

; ----------------------------------------------------------------------
; DATOS lista_BF8B: 13 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0xBEA0); lo leen p13:9534 (66 bytes)
;   0xbf8b..0xbfcd  (66 bytes)
DATA_lista_BF8B:
	defb 00ah,011h,001h,0c2h,0ach	; bf8b
	defb 04ch,010h,00bh,012h,0adh	; bf90
	defb 041h,013h,017h,0d2h,0adh	; bf95
	defb 044h,00dh,018h,0e2h,0adh	; bf9a
	defb 044h,014h,01ch,022h,0aeh	; bf9f
	defb 04eh,015h,020h,062h,0aeh	; bfa4
	defb 058h,016h,02eh,042h,0afh	; bfa9
	defb 050h,011h,046h,0c2h,0b0h	; bfae
	defb 041h,017h,056h,0c2h,0b1h	; bfb3
	defb 04fh,00fh,057h,0d2h,0b1h	; bfb8
	defb 083h,011h,066h,0c2h,0b2h	; bfbd
	defb 0adh,010h,069h,00ah,0b3h	; bfc2
	defb 0abh,010h,096h,042h,0b7h	; bfc7
	defb 0ffh	; bfcc

; ----------------------------------------------------------------------
; DATOS lista_BFCD: 3 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0xBEA0); lo leen p13:9543 (16 bytes)
;   0xbfcd..0xbfdd  (16 bytes)
DATA_lista_BFCD:
	defb 002h,00eh,0c1h,000h,0a0h	; bfcd
	defb 009h,012h,0c3h,010h,0a0h	; bfd2
	defb 026h,009h,0cch,058h,0a0h	; bfd7
	defb 0ffh	; bfdc

; ----------------------------------------------------------------------
; DATOS restos_finales_BFDD: 35 bytes al final del banco detras del ultimo
;   bloque que se lee (lista_BFCD): ningun lector del listado llega a ellos ni
;   los apunta ninguna tabla declarada
;   0xbfdd..0xc000  (35 bytes)
DATA_restos_finales_BFDD:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,002h,022h,022h,021h,01fh,0ffh,0f1h,000h	; bfdd  .........""!....
	defb 0f1h,0f0h,000h,000h,000h,000h,000h,000h,001h,014h,0f1h,010h,000h,000h,000h,000h	; bfed  ................
	defb 000h,000h,000h	; bffd
