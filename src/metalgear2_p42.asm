; ==========================================================================
; METAL GEAR 2 SOLID SNAKE - Konami (1990) - MSX2 - MegaROM RC-767 de 512 KB (Konami SCC) - banco 42 (se ejecuta en 0x8000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x08000


; ----------------------------------------------------------------------
; DATOS lista_8000: 30 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x6433); lo leen p00:4C26, p00:4C0C (151 bytes)
;   0x8000..0x8097  (151 bytes)
DATA_lista_8000:
	defb 001h,00ch,001h,0b6h,080h	; 8000
	defb 043h,00ch,002h,0beh,080h	; 8005
	defb 042h,004h,005h,0eeh,080h	; 800a
	defb 042h,008h,007h,00eh,081h	; 800f
	defb 042h,004h,009h,02eh,081h	; 8014
	defb 042h,007h,00bh,04eh,081h	; 8019
	defb 041h,005h,020h,06eh,081h	; 801e
	defb 042h,004h,021h,07eh,081h	; 8023
	defb 0a3h,00ah,023h,09eh,081h	; 8028
	defb 048h,012h,026h,0e6h,081h	; 802d
	defb 082h,00ah,02eh,066h,082h	; 8032
	defb 044h,012h,030h,096h,082h	; 8037
	defb 001h,012h,034h,0d6h,082h	; 803c
	defb 041h,012h,035h,0deh,082h	; 8041
	defb 041h,007h,036h,0eeh,082h	; 8046
	defb 001h,012h,037h,0feh,082h	; 804b
	defb 04ah,012h,038h,006h,083h	; 8050
	defb 042h,012h,050h,0a6h,083h	; 8055
	defb 001h,007h,052h,0c6h,083h	; 805a
	defb 043h,012h,053h,0ceh,083h	; 805f
	defb 045h,012h,058h,0feh,083h	; 8064
	defb 042h,00ch,05eh,04eh,084h	; 8069
	defb 003h,00ch,060h,06eh,084h	; 806e
	defb 045h,00ch,063h,086h,084h	; 8073
	defb 041h,00ah,068h,0d6h,084h	; 8078
	defb 082h,00ah,069h,0e6h,084h	; 807d
	defb 044h,00ah,070h,016h,085h	; 8082
	defb 087h,00bh,074h,056h,085h	; 8087
	defb 042h,00ch,07bh,0feh,085h	; 808c
	defb 042h,008h,07dh,01eh,086h	; 8091
	defb 0ffh	; 8096

; ----------------------------------------------------------------------
; DATOS sin identificar  0x8097..0x80b6  (31 bytes)
DATA_8097:
	defb 053h,00ah,030h,0deh,082h,04fh,019h,050h,0eeh,082h,003h,000h,060h,0feh,082h,045h	; 8097  S.0..O.P....`..E
	defb 01ah,063h,006h,083h,041h,01bh,068h,0a6h,083h,082h,01bh,069h,0c6h,083h,0ffh	; 80a7  .c..A.h....i...

; ----------------------------------------------------------------------
; DATOS dibujo_80B6: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 0 de la lista 0x8000 (p00:4D92, p00:4DF5); lo leen p00:4C26,
;   p00:4C0C (8 bytes)
;   0x80b6..0x80be  (8 bytes)
DATA_dibujo_80B6:
	defb 001h,07fh,07fh,0ffh,001h,07fh,07fh,0ffh	; 80b6  ........

; ----------------------------------------------------------------------
; DATOS dibujo_80BE: 3 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 1 de la lista 0x8000 (p00:4D92, p00:4DF5); lo leen p00:4C26,
;   p00:4C0C (48 bytes)
;   0x80be..0x80ee  (48 bytes)
DATA_dibujo_80BE:
	defb 0feh,0feh,080h,0feh,080h,0feh,000h,000h,0feh,0feh,080h,0feh,080h,0feh,000h,000h	; 80be  ................
	defb 001h,000h,0ffh,080h,0bfh,0c0h,01fh,000h,0f1h,0f0h,087h,0f8h,083h,0fch,001h,000h	; 80ce  ................
	defb 07eh,07eh,040h,03eh,060h,01eh,0f0h,000h,006h,006h,07ch,002h,07eh,000h,0ffh,000h	; 80de  ~~@>`.....|.~...

; ----------------------------------------------------------------------
; DATOS dibujo_80EE: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 2 de la lista 0x8000 (p00:4D92, p00:4DF5); lo leen p00:4C26,
;   p00:4C0C (32 bytes)
;   0x80ee..0x810e  (32 bytes)
DATA_dibujo_80EE:
	defb 000h,000h,0fch,0feh,0fch,082h,08ch,08eh,0fch,082h,08ch,08eh,0fch,082h,08ch,08eh	; 80ee  ................
	defb 0fch,082h,08ch,08eh,0fch,082h,08ch,08eh,0fch,082h,08ch,08eh,0fch,082h,001h,0ffh	; 80fe  ................

; ----------------------------------------------------------------------
; DATOS dibujo_810E: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 3 de la lista 0x8000 (p00:4D92, p00:4DF5); lo leen p00:4C26,
;   p00:4C0C (32 bytes)
;   0x810e..0x812e  (32 bytes)
DATA_dibujo_810E:
	defb 0fch,0feh,0fch,0feh,080h,082h,0fch,0feh,080h,082h,0fch,0feh,080h,082h,0fch,0feh	; 810e  ................
	defb 080h,082h,0fch,0feh,080h,082h,0fch,0feh,080h,082h,0fch,0feh,080h,082h,001h,0ffh	; 811e  ................

; ----------------------------------------------------------------------
; DATOS dibujo_812E: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 4 de la lista 0x8000 (p00:4D92, p00:4DF5); lo leen p00:4C26,
;   p00:4C0C (32 bytes)
;   0x812e..0x814e  (32 bytes)
DATA_dibujo_812E:
	defb 000h,0ffh,07fh,080h,047h,083h,05fh,082h,01fh,040h,017h,000h,04bh,084h,057h,088h	; 812e  ....G._..@..K.W.
	defb 000h,0feh,0feh,000h,0e2h,0c4h,0fah,044h,0fah,004h,0fah,000h,0fah,004h,05ah,004h	; 813e  .......D......Z.

; ----------------------------------------------------------------------
; DATOS dibujo_814E: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 5 de la lista 0x8000 (p00:4D92, p00:4DF5); lo leen p00:4C26,
;   p00:4C0C (32 bytes)
;   0x814e..0x816e  (32 bytes)
DATA_dibujo_814E:
	defb 082h,0ddh,090h,0cfh,092h,08dh,0dbh,0c4h,09fh,0c0h,0bfh,0ffh,080h,0ffh,000h,000h	; 814e  ................
	defb 08ch,0f6h,02ch,0d6h,00ch,0f6h,05ch,0a6h,0fch,006h,0dch,0feh,000h,0aeh,000h,000h	; 815e  ..,...\.........

; ----------------------------------------------------------------------
; DATOS dibujo_816E: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 6 de la lista 0x8000 (p00:4D92, p00:4DF5); lo leen p00:4C26,
;   p00:4C0C (16 bytes)
;   0x816e..0x817e  (16 bytes)
DATA_dibujo_816E:
	defb 0e0h,07fh,0e0h,07fh,0c0h,07fh,0c0h,07fh,0c0h,07fh,0c0h,07fh,0e0h,07fh,0c0h,07fh	; 816e  ................

; ----------------------------------------------------------------------
; DATOS dibujo_817E: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 7 de la lista 0x8000 (p00:4D92, p00:4DF5); lo leen p00:4C26,
;   p00:4C0C (32 bytes)
;   0x817e..0x819e  (32 bytes)
DATA_dibujo_817E:
	defb 000h,0feh,000h,0feh,002h,0fch,006h,0f8h,002h,0fch,000h,0feh,002h,0fch,000h,0feh	; 817e  ................
	defb 000h,0feh,000h,0feh,000h,0feh,000h,0feh,05ah,0a4h,000h,000h,0ffh,0ffh,0ffh,0ffh	; 818e  ........Z.......

; ----------------------------------------------------------------------
; DATOS dibujo_819E: 35 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 8 de la lista 0x8000 (p00:4D92, p00:4DF5); se solapan 65
;   bloques: (dibujo_81E6 81E6-8266) (dibujo_81E6 81E6-8266) (dibujo_81E6
;   81E6-8266) (dibujo_81E6 81E6-8266) (dibujo_8266 8266-8296) (dibujo_8266
;   8266-8296) (dibujo_8266 8266-8296) (dibujo_8266 8266-8296) (dibujo_8296
;   8296-82D6) (dibujo_8296 8296-82D6) (dibujo_8296 8296-82D6) (dibujo_8296
;   8296-82D6) (dibujo_82D6 82D6-82DE) (dibujo_82D6 82D6-82DE) (dibujo_82D6
;   82D6-82DE) (dibujo_82D6 82D6-82DE) (dibujo_82DE 82DE-82EE) (dibujo_82DE
;   82DE-82EE) (dibujo_82DE 82DE-82EE) (dibujo_82DE 82DE-82EE) (dibujo_82EE
;   82EE-82FE) (dibujo_82EE 82EE-82FE) (dibujo_82EE 82EE-82FE) (dibujo_82EE
;   82EE-82FE) (dibujo_82FE 82FE-8306) (dibujo_82FE 82FE-8306) (dibujo_82FE
;   82FE-8306) (dibujo_82FE 82FE-8306) (dibujo_8306 8306-83A6) (dibujo_8306
;   8306-83A6) (dibujo_8306 8306-83A6) (dibujo_8306 8306-83A6) (dibujo_83A6
;   83A6-83C6) (dibujo_83A6 83A6-83C6) (dibujo_83A6 83A6-83C6) (dibujo_83A6
;   83A6-83C6) (dibujo_83C6 83C6-83CE) (dibujo_83C6 83C6-83CE) (dibujo_83C6
;   83C6-83CE) (dibujo_83C6 83C6-83CE) (dibujo_83CE 83CE-83FE) (dibujo_83CE
;   83CE-83FE) (dibujo_83CE 83CE-83FE) (dibujo_83CE 83CE-83FE) (dibujo_83FE
;   83FE-844E) (dibujo_83FE 83FE-844E) (dibujo_83FE 83FE-844E) (dibujo_83FE
;   83FE-844E) (dibujo_844E 844E-846E) (dibujo_844E 844E-846E) (dibujo_844E
;   844E-846E) (dibujo_844E 844E-846E) (dibujo_846E 846E-8486) (dibujo_846E
;   846E-8486) (dibujo_846E 846E-8486) (dibujo_846E 846E-8486) (dibujo_8486
;   8486-84D6) (dibujo_8486 8486-84D6) (dibujo_8486 8486-84D6) (dibujo_8486
;   8486-84D6) (dibujo_84D6 84D6-84E6) (dibujo_84D6 84D6-84E6) (dibujo_84D6
;   84D6-84E6) (dibujo_84D6 84D6-84E6); lo leen p00:4C26, p00:4C0C (840 bytes)
;   0x819e..0x84e6  (840 bytes)
DATA_dibujo_819E:
	defb 0c0h,07fh,03fh,0c0h,07fh,03fh,0c0h,07fh,03fh,0c0h,07fh,03fh,0cah,075h,03fh,0ffh,07fh,07fh,0ffh,000h,000h,0ffh,000h,000h	; 819e  ..?..?..?..?.u?.........
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0ffh,000h,000h,0ffh,0ffh,000h,000h,001h,001h,0ffh,001h,0ffh,0ffh,001h,0ffh,0ffh	; 81b6  ........................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,001h,0ffh,001h,001h,0ffh,0ffh,000h,000h,080h,040h,07fh,0c0h,07fh,03fh,0c0h,07fh,03fh	; 81ce  ................@...?..?
	defb 056h,000h,056h,000h,056h,000h,056h,000h,054h,002h,054h,002h,054h,002h,054h,002h,050h,004h,050h,004h,050h,005h,050h,004h	; 81e6  V.V.V.V.T.T.T.T.P.P.P.P.
	defb 052h,008h,051h,008h,050h,008h,050h,008h,040h,010h,040h,010h,040h,010h,040h,010h,040h,020h,040h,020h,04fh,02eh,049h,028h	; 81fe  R.Q.P.P.@.@.@.@.@ @ O.I(
	defb 00fh,040h,000h,040h,006h,04eh,000h,058h,006h,0dfh,000h,0fdh,000h,0fbh,0ffh,0ffh,014h,0ffh,014h,0ffh,014h,0ffh,014h,0ffh	; 8216  .@.@.N.X................
	defb 014h,07fh,014h,07fh,014h,07fh,014h,07fh,014h,03fh,014h,03fh,014h,03fh,034h,0ffh,044h,01fh,084h,01fh,004h,01fh,004h,01fh	; 822e  .........?.?.?4.D.......
	defb 004h,00fh,004h,00fh,004h,00fh,004h,00fh,004h,007h,004h,007h,004h,007h,064h,067h,000h,003h,060h,063h,000h,003h,060h,063h	; 8246  ..............dg..`c..`c
	defb 000h,055h,000h,0dfh,000h,0ffh,0ffh,0ffh,000h,0feh,0ffh,03eh,040h,0ffh,05eh,060h,0ffh,070h,060h,0ffh,070h,06eh,0efh,07ah	; 825e  .U.........>@.^`.p`.pn.z
	defb 06ch,0efh,07eh,068h,0ebh,07eh,06bh,0ebh,000h,0ffh,0feh,07ch,082h,0fdh,078h,086h,0fbh,000h,00eh,0ffh,000h,0f6h,0efh,040h	; 8276  l.~h.~k....|..x........@
	defb 0b6h,0ffh,000h,0d6h,0bfh,080h,0d6h,0ffh,001h,0ffh,001h,033h,001h,003h,0ddh,003h,070h,072h,000h,002h,071h,072h,001h,002h	; 828e  ...........3....pr..qr..
	defb 070h,074h,000h,004h,006h,004h,042h,0fch,002h,068h,0b2h,048h,006h,048h,006h,058h,006h,010h,006h,010h,006h,010h,006h,030h	; 82a6  pt....B..h.H.H.X.......0
	defb 006h,020h,006h,020h,006h,020h,016h,060h,016h,040h,016h,040h,016h,040h,016h,0c0h,016h,080h,016h,080h,056h,080h,0d6h,080h	; 82be  . . . .`.@.@.@......V...
	defb 056h,056h,056h,056h,056h,056h,056h,056h,000h,003h,060h,063h,000h,003h,060h,063h,000h,055h,000h,0dfh,000h,0ffh,0ffh,0ffh	; 82d6  VVVVVVVV..`c..`c.U......
	defb 07bh,015h,07bh,015h,07bh,015h,07bh,015h,05fh,033h,05fh,033h,05fh,033h,05fh,033h,080h,080h,080h,080h,080h,080h,080h,080h	; 82ee  {.{.{.{._3_3_3_3........
	defb 000h,0ffh,000h,033h,001h,003h,0fdh,003h,001h,023h,001h,00bh,001h,023h,001h,003h,080h,000h,080h,000h,000h,000h,000h,0ffh	; 8306  ...3.....#...#..........
	defb 080h,000h,0cbh,010h,090h,030h,080h,010h,003h,003h,001h,003h,003h,003h,041h,0ffh,001h,067h,0bdh,043h,001h,043h,001h,043h	; 831e  .....0........A..g.C.C.C
	defb 080h,010h,080h,000h,080h,010h,080h,010h,080h,000h,080h,000h,080h,000h,080h,010h,001h,043h,001h,00bh,001h,003h,011h,013h	; 8336  .................C......
	defb 001h,013h,001h,003h,001h,023h,001h,007h,000h,0ffh,000h,010h,080h,000h,0ffh,000h,080h,000h,080h,000h,080h,020h,080h,000h	; 834e  .....#............... ..
	defb 001h,003h,001h,013h,001h,003h,001h,003h,001h,003h,001h,023h,001h,003h,001h,003h,080h,000h,080h,000h,080h,011h,080h,010h	; 8366  ...........#............
	defb 080h,019h,080h,03bh,020h,07fh,0ffh,0ffh,001h,023h,001h,023h,001h,023h,001h,023h,001h,033h,001h,077h,021h,0ffh,0ffh,0ffh	; 837e  .... ....#.#.#.#.3.w!...
	defb 001h,003h,001h,003h,001h,003h,001h,003h,001h,003h,001h,067h,001h,0ffh,0ffh,0ffh,000h,0ffh,000h,010h,080h,000h,0ffh,000h	; 8396  ...........g............
	defb 000h,000h,000h,000h,000h,020h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0ffh,000h,000h,08bh,010h,010h,030h,000h,010h	; 83ae  ..... ...............0..
	defb 0efh,0ffh,0efh,0efh,0ffh,0ffh,0ffh,0efh,000h,000h,000h,000h,000h,000h,000h,002h,000h,002h,000h,066h,000h,0ffh,0ffh,0ffh	; 83c6  ...................f....
	defb 000h,0ffh,000h,032h,000h,002h,0fdh,002h,000h,020h,000h,008h,000h,020h,000h,000h,000h,000h,000h,000h,000h,000h,041h,0ffh	; 83de  ...2..... ... ........A.
	defb 000h,061h,0beh,041h,000h,041h,000h,040h,000h,0ffh,000h,010h,080h,000h,0ffh,000h,080h,080h,080h,080h,080h,0a0h,080h,080h	; 83f6  .a.A.A.@................
	defb 040h,040h,040h,040h,040h,040h,040h,07fh,020h,060h,03bh,060h,020h,060h,020h,060h,010h,070h,010h,070h,010h,070h,010h,070h	; 840e  @@@@@@@. `.` ` `.p.p.p.p
	defb 018h,078h,018h,078h,018h,078h,018h,078h,014h,07ch,014h,07ch,014h,07dh,014h,07ch,016h,07fh,016h,07fh,016h,07fh,017h,07fh	; 8426  .x.x.x.x.|.|.}.|........
	defb 014h,07fh,014h,07fh,014h,07fh,014h,07fh,014h,07fh,014h,07fh,014h,07fh,014h,07fh,0d0h,001h,0d0h,001h,0d0h,001h,0d0h,001h	; 843e  ........................
	defb 0d0h,001h,010h,001h,0f0h,001h,000h,001h,08bh,0c0h,08bh,0c0h,08bh,0c0h,08bh,0c0h,08bh,0c0h,088h,0c0h,08fh,0c0h,080h,0c0h	; 8456  ........................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0c0h,0dfh,0d0h,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0ffh,000h,0ffh,0ffh,0ffh,0ffh,0ffh,003h,0fbh,00bh	; 846e  ........................
	defb 0d0h,001h,0d0h,001h,0d0h,001h,0d0h,001h,0d0h,001h,0d0h,001h,0d0h,001h,0d0h,001h,08bh,0c0h,08bh,0c0h,08bh,0c0h,08bh,0c0h	; 8486  ........................
	defb 08bh,0c0h,08bh,0c0h,08bh,0c0h,08bh,0c0h,0d0h,001h,0d0h,001h,0d0h,000h,0d0h,000h,0dfh,000h,0c0h,000h,0ffh,000h,0ffh,000h	; 849e  ........................
	defb 0ffh,0ffh,000h,0ffh,000h,000h,000h,000h,0ffh,000h,000h,000h,0ffh,000h,0ffh,000h,08bh,0c0h,00bh,0c0h,00bh,000h,00bh,000h	; 84b6  ........................
	defb 0fbh,000h,003h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,0ffh,000h,0ffh,000h,0ffh,0ffh,0ffh,0ffh,000h,0ffh,0ffh,0ffh,000h	; 84ce  ........................

; ----------------------------------------------------------------------
; DATOS dibujo_84E6: 2 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 25 de la lista 0x8000 (p00:4D92, p00:4DF5); lo leen p00:4C26,
;   p00:4C0C (48 bytes)
;   0x84e6..0x8516  (48 bytes)
DATA_dibujo_84E6:
	defb 01fh,0e0h,0f0h,0ffh,007h,0f0h,01ch,007h,0f0h,01ch,007h,0f0h,0dfh,007h,030h,05fh,004h,0b0h,05fh,007h,0b0h,05fh,000h,0b0h	; 84e6  ..............0_.._.._..
	defb 0f8h,007h,00fh,0ffh,0e0h,00fh,038h,0e0h,00fh,038h,0e0h,00fh,0fbh,0e0h,00ch,0fah,020h,00dh,0fah,0e0h,00dh,0fah,000h,00dh	; 84fe  ......8..8...... .......

; ----------------------------------------------------------------------
; DATOS dibujo_8516: 4 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 26 de la lista 0x8000 (p00:4D92, p00:4DF5); lo leen p00:4C26,
;   p00:4C0C (64 bytes)
;   0x8516..0x8556  (64 bytes)
DATA_dibujo_8516:
	defb 0ffh,000h,0ffh,0ffh,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 8516  ................
	defb 0b7h,093h,0ffh,0ffh,0b7h,093h,0ffh,0ffh,0b7h,093h,0ffh,0ffh,0b7h,093h,0ffh,0ffh	; 8526  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,0ffh,000h	; 8536  ................
	defb 0fbh,0fdh,0ffh,0f9h,0ffh,0ffh,0ffh,0ffh,0fbh,0fdh,0ffh,0f9h,0ffh,0ffh,0ffh,0ffh	; 8546  ................

; ----------------------------------------------------------------------
; DATOS dibujo_8556: 7 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 27 de la lista 0x8000 (p00:4D92, p00:4DF5); lo leen p00:4C26,
;   p00:4C0C (168 bytes)
;   0x8556..0x85fe  (168 bytes)
DATA_dibujo_8556:
	defb 08fh,060h,0e0h,08dh,067h,0e0h,0ach,047h,0c0h,0edh,007h,080h,0edh,087h,000h,0edh,087h,000h,0cdh,0a7h,020h,08dh,0e7h,060h	; 8556  .`..g..G............ ..`
	defb 08dh,067h,0e0h,08dh,067h,0e0h,0adh,047h,0c0h,0edh,007h,080h,0edh,087h,000h,0edh,087h,000h,0cdh,0a7h,020h,08dh,0e7h,060h	; 856e  .g..g..G............ ..`
	defb 08dh,067h,0e0h,08dh,067h,0e0h,0adh,047h,0c0h,0edh,007h,080h,0edh,087h,000h,0edh,087h,000h,0e8h,080h,000h,0ffh,000h,000h	; 8586  .g..g..G................
	defb 0f9h,006h,00eh,0d9h,0c6h,00eh,01bh,0c4h,00ch,0dfh,0c0h,008h,0dfh,0c8h,000h,01fh,0e8h,000h,07dh,0eah,002h,0f9h,00eh,006h	; 859e  ..................}.....
	defb 0d9h,0c6h,00eh,0d9h,0c6h,00eh,0dbh,0c4h,00ch,0dfh,0c0h,008h,0dfh,0c8h,000h,0dfh,0c8h,000h,0ddh,0cah,002h,0d9h,0ceh,006h	; 85b6  ........................
	defb 0d9h,0c6h,00eh,0d9h,0c6h,00eh,01bh,0e4h,00ch,07fh,0e0h,008h,0ffh,008h,000h,0dfh,0c8h,000h,01fh,008h,000h,0ffh,000h,000h	; 85ce  ........................
	defb 083h,0fdh,000h,0bfh,0fdh,000h,0a7h,0e5h,018h,0a7h,0e5h,000h,0bfh,0fdh,000h,0bfh,0e5h,000h,0bfh,0fdh,000h,0ffh,081h,000h	; 85e6  ........................

; ----------------------------------------------------------------------
; DATOS dibujo_85FE: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 28 de la lista 0x8000 (p00:4D92, p00:4DF5); lo leen p00:4C26,
;   p00:4C0C (32 bytes)
;   0x85fe..0x861e  (32 bytes)
DATA_dibujo_85FE:
	defb 0ffh,0ffh,080h,0ffh,080h,0c0h,080h,0c0h,08fh,0c0h,088h,0c0h,08bh,0c0h,08bh,0c0h	; 85fe  ................
	defb 0ffh,0ffh,000h,0ffh,000h,001h,000h,001h,0f0h,001h,010h,001h,0d0h,001h,0d0h,001h	; 860e  ................

; ----------------------------------------------------------------------
; DATOS dibujo_861E: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 29 de la lista 0x8000 (p00:4D92, p00:4DF5); lo leen p00:4C26,
;   p00:4C0C (32 bytes)
;   0x861e..0x863e  (32 bytes)
DATA_dibujo_861E:
	defb 000h,000h,000h,000h,0ffh,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 861e  ................
	defb 000h,000h,000h,000h,0feh,000h,000h,0feh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 862e  ................

; ----------------------------------------------------------------------
; DATOS sin identificar  0x863e..0x870a  (204 bytes)
DATA_863E:
	defb 098h,086h,09ah,086h,09eh,086h,0a0h,086h,0a4h,086h,0a6h,086h,0aah,086h,0aeh,086h	; 863e  ................
	defb 0b0h,086h,0b2h,086h,0b6h,086h,0bah,086h,0beh,086h,0c0h,086h,0c2h,086h,0c4h,086h	; 864e  ................
	defb 0c6h,086h,0c8h,086h,0cah,086h,0cch,086h,0ceh,086h,0ceh,086h,0d0h,086h,0d4h,086h	; 865e  ................
	defb 0d8h,086h,0d9h,086h,0ddh,086h,0e1h,086h,0e3h,086h,0e3h,086h,0e5h,086h,0e9h,086h	; 866e  ................
	defb 0ebh,086h,0efh,086h,0f3h,086h,0f5h,086h,0f7h,086h,0f9h,086h,0fbh,086h,0fbh,086h	; 867e  ................
	defb 0ffh,086h,003h,087h,004h,087h,006h,087h,008h,087h,012h,0cfh,014h,05fh,026h,078h	; 868e  ............._&x
	defb 014h,058h,014h,06fh,057h,08ch,015h,08fh,015h,0cfh,046h,038h,015h,067h,04ah,03fh	; 869e  .X.oW.....F8.gJ?
	defb 014h,078h,034h,05ch,03ch,0bfh,078h,014h,034h,0cfh,012h,078h,045h,0cfh,067h,0abh	; 86ae  .x4\<.x.4..xE.g.
	defb 04fh,078h,014h,056h,04fh,056h,012h,08eh,012h,048h,012h,045h,014h,028h,018h,0efh	; 86be  Ox.VOV...H.E.(..
	defb 01fh,048h,012h,08fh,04eh,0bch,01fh,025h,084h,0bch,02eh,028h,047h,056h,0f1h,037h	; 86ce  .H..N..%...(GV.7
	defb 08fh,0bch,045h,04fh,025h,045h,0afh,045h,06fh,07ah,01dh,048h,0efh,045h,067h,018h	; 86de  ..EO%E.Eoz.H.Eg.
	defb 0cfh,04ch,013h,05fh,08bh,058h,047h,058h,024h,078h,0afh,08eh,027h,045h,067h,0adh	; 86ee  .L._.XGX$x..'Eg.
	defb 0efh,078h,03fh,014h,056h,08fh,056h,07fh,015h,06fh,014h,0ach	; 86fe  .x?.V.V..o..

; ----------------------------------------------------------------------
; DATOS lista_870A: 28 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x0000); lo leen p00:4C0C (141 bytes)
;   0x870a..0x8797  (141 bytes)
DATA_lista_870A:
	defb 002h,00bh,001h,013h,089h	; 870a
	defb 002h,001h,003h,023h,089h	; 870f
	defb 04ah,001h,005h,033h,089h	; 8714
	defb 045h,00eh,00fh,0d3h,089h	; 8719
	defb 042h,02bh,014h,023h,08ah	; 871e
	defb 082h,001h,016h,043h,08ah	; 8723
	defb 086h,001h,018h,073h,08ah	; 8728
	defb 001h,00bh,01eh,003h,08bh	; 872d
	defb 041h,001h,01fh,00bh,08bh	; 8732
	defb 083h,001h,020h,01bh,08bh	; 8737
	defb 003h,008h,027h,063h,08bh	; 873c
	defb 001h,015h,02ah,07bh,08bh	; 8741
	defb 001h,001h,02bh,083h,08bh	; 8746
	defb 062h,001h,02ch,08bh,08bh	; 874b
	defb 042h,00dh,04eh,0abh,08dh	; 8750
	defb 081h,001h,050h,0cbh,08dh	; 8755
	defb 047h,00dh,051h,0e3h,08dh	; 875a
	defb 083h,001h,058h,053h,08eh	; 875f
	defb 049h,027h,05bh,09bh,08eh	; 8764
	defb 044h,01ah,064h,02bh,08fh	; 8769
	defb 041h,024h,068h,06bh,08fh	; 876e
	defb 086h,01ah,069h,07bh,08fh	; 8773
	defb 001h,00ch,06fh,00bh,090h	; 8778
	defb 082h,001h,070h,013h,090h	; 877d
	defb 042h,00dh,072h,043h,090h	; 8782
	defb 04ch,02ah,074h,063h,090h	; 8787
	defb 042h,020h,023h,023h,091h	; 878c
	defb 082h,001h,025h,043h,091h	; 8791
	defb 0ffh	; 8796

; ----------------------------------------------------------------------
; DATOS lista_8797: 23 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x0000); lo leen p00:4C0C (116 bytes)
;   0x8797..0x880b  (116 bytes)
DATA_lista_8797:
	defb 007h,019h,090h,073h,091h	; 8797
	defb 04ah,012h,097h,0abh,091h	; 879c
	defb 093h,019h,0a1h,04bh,092h	; 87a1
	defb 041h,003h,0b5h,013h,094h	; 87a6
	defb 041h,005h,0b6h,023h,094h	; 87ab
	defb 005h,018h,0b8h,033h,094h	; 87b0
	defb 002h,025h,0bdh,05bh,094h	; 87b5
	defb 045h,025h,0bfh,06bh,094h	; 87ba
	defb 058h,015h,0c4h,0bbh,094h	; 87bf
	defb 001h,008h,0dfh,03bh,096h	; 87c4
	defb 003h,00ch,0e0h,043h,096h	; 87c9
	defb 041h,00ah,0e3h,05bh,096h	; 87ce
	defb 041h,028h,0e4h,06bh,096h	; 87d3
	defb 086h,028h,0e5h,07bh,096h	; 87d8
	defb 001h,028h,0ebh,00bh,097h	; 87dd
	defb 001h,029h,0ech,013h,097h	; 87e2
	defb 042h,028h,0edh,01bh,097h	; 87e7
	defb 081h,027h,0efh,03bh,097h	; 87ec
	defb 042h,00dh,0f0h,053h,097h	; 87f1
	defb 042h,027h,0f2h,073h,097h	; 87f6
	defb 04ah,001h,0f4h,093h,097h	; 87fb
	defb 081h,001h,0feh,033h,098h	; 8800
	defb 081h,027h,0ffh,04bh,098h	; 8805
	defb 0ffh	; 880a

; ----------------------------------------------------------------------
; DATOS lista_880B: 32 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x0000); lo leen p00:4C0C (161 bytes)
;   0x880b..0x88ac  (161 bytes)
DATA_lista_880B:
	defb 04ch,001h,081h,063h,098h	; 880b
	defb 043h,00ah,08dh,023h,099h	; 8810
	defb 047h,00bh,090h,053h,099h	; 8815
	defb 041h,000h,097h,0c3h,099h	; 881a
	defb 083h,00ah,098h,0d3h,099h	; 881f
	defb 082h,003h,09bh,01bh,09ah	; 8824
	defb 002h,00ch,0a0h,04bh,09ah	; 8829
	defb 04ch,00eh,0a2h,05bh,09ah	; 882e
	defb 001h,005h,0b0h,01bh,09bh	; 8833
	defb 001h,00ch,0b1h,023h,09bh	; 8838
	defb 001h,007h,0b2h,02bh,09bh	; 883d
	defb 049h,001h,0b3h,033h,09bh	; 8842
	defb 043h,00ch,0bch,0c3h,09bh	; 8847
	defb 001h,003h,0bfh,0f3h,09bh	; 884c
	defb 046h,02ah,0c0h,0fbh,09bh	; 8851
	defb 042h,004h,0c6h,05bh,09ch	; 8856
	defb 041h,002h,0c8h,07bh,09ch	; 885b
	defb 041h,005h,0c9h,08bh,09ch	; 8860
	defb 041h,008h,0cah,09bh,09ch	; 8865
	defb 041h,006h,0cbh,0abh,09ch	; 886a
	defb 041h,003h,0cch,0bbh,09ch	; 886f
	defb 041h,007h,0cdh,0cbh,09ch	; 8874
	defb 091h,003h,0d0h,0dbh,09ch	; 8879
	defb 088h,005h,0e1h,073h,09eh	; 887e
	defb 083h,009h,0ebh,033h,09fh	; 8883
	defb 081h,006h,0eeh,07bh,09fh	; 8888
	defb 082h,003h,0e9h,093h,09fh	; 888d
	defb 001h,001h,0f0h,0c3h,09fh	; 8892
	defb 001h,00bh,0f1h,0cbh,09fh	; 8897
	defb 043h,003h,0f2h,0d3h,09fh	; 889c
	defb 041h,00dh,0f5h,003h,0a0h	; 88a1
	defb 041h,028h,0f6h,013h,0a0h	; 88a6
	defb 0ffh	; 88ab

; ----------------------------------------------------------------------
; DATOS lista_88AC: 14 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x0000); lo leen p00:4C0C (71 bytes)
;   0x88ac..0x88f3  (71 bytes)
DATA_lista_88AC:
	defb 003h,023h,081h,023h,0a0h	; 88ac
	defb 042h,027h,084h,03bh,0a0h	; 88b1
	defb 043h,022h,086h,05bh,0a0h	; 88b6
	defb 041h,015h,089h,08bh,0a0h	; 88bb
	defb 001h,023h,08ah,09bh,0a0h	; 88c0
	defb 041h,024h,090h,0a3h,0a0h	; 88c5
	defb 082h,020h,091h,0b3h,0a0h	; 88ca
	defb 041h,002h,0f0h,0e3h,0a0h	; 88cf
	defb 081h,020h,0f1h,0f3h,0a0h	; 88d4
	defb 041h,020h,0f2h,00bh,0a1h	; 88d9
	defb 001h,00bh,0eeh,01bh,0a1h	; 88de
	defb 041h,001h,0efh,023h,0a1h	; 88e3
	defb 04ch,001h,0f3h,033h,0a1h	; 88e8
	defb 041h,02ch,0ffh,0f3h,0a1h	; 88ed
	defb 0ffh	; 88f2

; ----------------------------------------------------------------------
; DATOS lista_88F3: 3 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x65B7); lo leen p00:4C26 (16 bytes)
;   0x88f3..0x8903  (16 bytes)
DATA_lista_88F3:
	defb 044h,013h,0d4h,02bh,08fh	; 88f3
	defb 041h,014h,0d8h,06bh,08fh	; 88f8
	defb 086h,013h,0d9h,07bh,08fh	; 88fd
	defb 0ffh	; 8902

; ----------------------------------------------------------------------
; DATOS lista_8903: 3 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x6648); lo leen p00:4C26 (16 bytes)
;   0x8903..0x8913  (16 bytes)
DATA_lista_8903:
	defb 044h,020h,0d4h,02bh,08fh	; 8903
	defb 041h,01fh,0d8h,06bh,08fh	; 8908
	defb 086h,020h,0d9h,07bh,08fh	; 890d
	defb 0ffh	; 8912

; ----------------------------------------------------------------------
; DATOS dibujo_8913: 2 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 0 de la lista 0x870A (p00:4D92, p00:4DF5); lo leen p00:4C0C (16
;   bytes)
;   0x8913..0x8923  (16 bytes)
DATA_dibujo_8913:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 8913  ........
	defb 000h,000h,000h,000h,000h,000h,000h,000h	; 891b  ........

; ----------------------------------------------------------------------
; DATOS dibujo_8923: 2 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 1 de la lista 0x870A (p00:4D92, p00:4DF5); lo leen p00:4C0C (16
;   bytes)
;   0x8923..0x8933  (16 bytes)
DATA_dibujo_8923:
	defb 0ffh,046h,000h,000h,000h,000h,000h,000h	; 8923  .F......
	defb 000h,000h,000h,000h,0ffh,0ffh,0ffh,0ffh	; 892b  ........

; ----------------------------------------------------------------------
; DATOS dibujo_8933: 10 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 2 de la lista 0x870A (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (160 bytes)
;   0x8933..0x89d3  (160 bytes)
DATA_dibujo_8933:
	defb 00eh,006h,004h,002h,000h,000h,000h,000h,0ffh,000h,01fh,020h,03fh,0c0h,0ffh,000h	; 8933  ........... ?...
	defb 00fh,000h,006h,000h,000h,000h,015h,015h,015h,015h,015h,015h,015h,015h,015h,000h	; 8943  ................
	defb 0c1h,000h,000h,000h,000h,000h,055h,055h,055h,055h,055h,055h,055h,055h,055h,000h	; 8953  ......UUUUUUUUU.
	defb 02eh,004h,006h,004h,006h,004h,006h,004h,006h,004h,006h,004h,006h,004h,006h,004h	; 8963  ................
	defb 006h,004h,006h,004h,006h,004h,006h,004h,0fdh,006h,0fdh,006h,0fdh,006h,0fdh,006h	; 8973  ................
	defb 076h,004h,076h,004h,076h,004h,076h,004h,076h,004h,076h,004h,076h,004h,076h,004h	; 8983  v.v.v.v.v.v.v.v.
	defb 076h,004h,076h,004h,076h,004h,076h,004h,08dh,076h,08dh,076h,08dh,076h,08dh,076h	; 8993  v.v.v.v..v.v.v.v
	defb 057h,040h,057h,040h,056h,040h,057h,040h,054h,040h,054h,040h,056h,040h,056h,040h	; 89a3  W@W@V@W@T@T@V@V@
	defb 057h,040h,057h,040h,057h,040h,057h,040h,0e8h,057h,0e8h,057h,0e8h,057h,0e8h,057h	; 89b3  W@W@W@W@.W.W.W.W
	defb 0ffh,000h,0efh,000h,0d7h,008h,0edh,010h,0fdh,002h,0bfh,000h,0bfh,040h,0ffh,000h	; 89c3  .............@..

; ----------------------------------------------------------------------
; DATOS dibujo_89D3: 5 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 3 de la lista 0x870A (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (80 bytes)
;   0x89d3..0x8a23  (80 bytes)
DATA_dibujo_89D3:
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0f7h,008h,0ffh	; 89d3  ................
	defb 006h,0f3h,00eh,0e3h,00ch,0e9h,024h,0dbh,014h,0dah,004h,0d9h,016h,0ebh,006h,0f3h	; 89e3  ......$.........
	defb 000h,0ffh,000h,0dfh,040h,0cfh,030h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 89f3  ....@.0.........
	defb 080h,000h,0ffh,000h,000h,0dfh,0eeh,0eeh,080h,000h,0ffh,000h,000h,0ffh,0ffh,0ffh	; 8a03  ................
	defb 001h,000h,0ffh,000h,001h,0feh,0ffh,0feh,001h,000h,0ffh,000h,001h,0feh,0dfh,0deh	; 8a13  ................

; ----------------------------------------------------------------------
; DATOS dibujo_8A23: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 4 de la lista 0x870A (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (32 bytes)
;   0x8a23..0x8a43  (32 bytes)
DATA_dibujo_8A23:
	defb 0fdh,006h,0f5h,006h,0e5h,006h,0f5h,00eh,0fdh,006h,0fdh,006h,0fdh,006h,0fdh,006h	; 8a23  ................
	defb 0fdh,006h,0fdh,006h,0fdh,006h,0fdh,006h,0fdh,006h,0fdh,006h,0fdh,006h,0fdh,006h	; 8a33  ................

; ----------------------------------------------------------------------
; DATOS dibujo_8A43: 2 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 5 de la lista 0x870A (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (48 bytes)
;   0x8a43..0x8a73  (48 bytes)
DATA_dibujo_8A43:
	defb 0f0h,04fh,097h,0f0h,04fh,096h,0f0h,04fh,096h,0f0h,04fh,094h,0f0h,04fh,095h,0f0h,04fh,096h,0f0h,04fh,092h,0f0h,04fh,097h	; 8a43  .O..O..O..O..O..O..O..O.
	defb 0f0h,04fh,097h,0f0h,04fh,097h,0f0h,04fh,097h,0f0h,04fh,097h,0f0h,04fh,097h,0f0h,04fh,097h,0f0h,04fh,097h,0f0h,04fh,097h	; 8a5b  .O..O..O..O..O..O..O..O.

; ----------------------------------------------------------------------
; DATOS dibujo_8A73: 6 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 6 de la lista 0x870A (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (144 bytes)
;   0x8a73..0x8b03  (144 bytes)
DATA_dibujo_8A73:
	defb 000h,0ffh,0f7h,000h,0ffh,0dfh,000h,0ffh,00fh,000h,0ffh,000h,000h,0ffh,000h,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,000h	; 8a73  ........................
	defb 000h,0ffh,0ffh,000h,0ffh,0ffh,000h,0ffh,0ffh,000h,0ffh,000h,000h,0ffh,000h,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,000h	; 8a8b  ........................
	defb 006h,0fdh,0f2h,006h,0fdh,0f2h,006h,0fdh,0f2h,006h,0fdh,002h,006h,0fdh,002h,0fdh,006h,000h,0ffh,0ffh,000h,000h,0ffh,000h	; 8aa3  ........................
	defb 000h,0ffh,097h,000h,0ffh,0bfh,000h,0ffh,0ffh,000h,0ffh,007h,000h,0ffh,007h,0f0h,00fh,017h,0f0h,0cfh,017h,0f0h,04fh,097h	; 8abb  ......................O.
	defb 0f0h,00fh,097h,010h,0efh,017h,0f0h,00fh,0f7h,000h,0ffh,007h,000h,0ffh,007h,000h,0ffh,0afh,000h,0ffh,0f7h,000h,0ffh,0ffh	; 8ad3  ........................
	defb 000h,0fbh,053h,000h,0fbh,073h,000h,0fbh,033h,006h,0fdh,012h,006h,0fdh,072h,006h,0fdh,052h,006h,0fdh,072h,006h,0fdh,072h	; 8aeb  ..S..s..3.....r..R..r..r

; ----------------------------------------------------------------------
; DATOS dibujo_8B03: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 7 de la lista 0x870A (p00:4D92, p00:4DF5); lo leen p00:4C0C (8
;   bytes)
;   0x8b03..0x8b0b  (8 bytes)
DATA_dibujo_8B03:
	defb 07fh,03fh,01fh,00fh,007h,003h,001h,000h	; 8b03  .?......

; ----------------------------------------------------------------------
; DATOS dibujo_8B0B: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 8 de la lista 0x870A (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (16 bytes)
;   0x8b0b..0x8b1b  (16 bytes)
DATA_dibujo_8B0B:
	defb 0c7h,005h,067h,085h,037h,0c5h,01fh,0e5h,00bh,0f1h,003h,0f9h,007h,0fdh,005h,0ffh	; 8b0b  ..g.7...........

; ----------------------------------------------------------------------
; DATOS dibujo_8B1B: 3 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 9 de la lista 0x870A (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (72 bytes)
;   0x8b1b..0x8b63  (72 bytes)
DATA_dibujo_8B1B:
	defb 006h,0fdh,072h,006h,0fdh,072h,006h,0fdh,062h,006h,0fdh,072h,006h,0fdh,032h,006h,0fdh,012h,006h,0fdh,072h,006h,0fdh,072h	; 8b1b  ..r..r..b..r..2.....r..r
	defb 0f0h,04fh,097h,0f0h,04fh,097h,0f0h,04fh,097h,0f0h,04fh,090h,0f0h,04fh,090h,0ffh,040h,080h,07fh,0ffh,000h,080h,0ffh,000h	; 8b33  .O..O..O..O..O..@.......
	defb 006h,0fdh,072h,006h,0fdh,072h,006h,0fdh,072h,006h,0fdh,072h,006h,0fdh,072h,006h,0fdh,072h,006h,0fdh,072h,006h,0fdh,072h	; 8b4b  ..r..r..r..r..r..r..r..r

; ----------------------------------------------------------------------
; DATOS dibujo_8B63: 3 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 10 de la lista 0x870A (p00:4D92, p00:4DF5); lo leen p00:4C0C (24
;   bytes)
;   0x8b63..0x8b7b  (24 bytes)
DATA_dibujo_8B63:
	defb 0ffh,0ffh,0ffh,0ffh,0f7h,0ffh,0fbh,071h	; 8b63  .......q
	defb 008h,09dh,0bfh,0ffh,0bfh,0ffh,0ffh,0ffh	; 8b6b  ........
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 8b73  ........

; ----------------------------------------------------------------------
; DATOS dibujo_8B7B: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 11 de la lista 0x870A (p00:4D92, p00:4DF5); lo leen p00:4C0C (8
;   bytes)
;   0x8b7b..0x8b83  (8 bytes)
DATA_dibujo_8B7B:
	defb 001h,001h,001h,001h,001h,001h,001h,001h	; 8b7b  ........

; ----------------------------------------------------------------------
; DATOS dibujo_8B83: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 12 de la lista 0x870A (p00:4D92, p00:4DF5); lo leen p00:4C0C (8
;   bytes)
;   0x8b83..0x8b8b  (8 bytes)
DATA_dibujo_8B83:
	defb 0ffh,0feh,0fch,0fch,0feh,0feh,0ffh,0ffh	; 8b83  ........

; ----------------------------------------------------------------------
; DATOS dibujo_8B8B: 34 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 13 de la lista 0x870A (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (544 bytes)
;   0x8b8b..0x8dab  (544 bytes)
DATA_dibujo_8B8B:
	defb 0bfh,0c0h,0bfh,0c0h,0bfh,0c0h,09fh,0c0h,09fh,0c0h,08fh,0c0h,082h,0c0h,0ffh,0ffh	; 8b8b  ................
	defb 0ffh,000h,0ffh,000h,0fbh,000h,0f1h,008h,0f9h,006h,0ffh,000h,0ffh,000h,0ffh,0ffh	; 8b9b  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0fbh,000h,0e0h,000h,0ffh,0ffh	; 8bab  ................
	defb 000h,0ffh,0ffh,080h,0ffh,080h,0ffh,080h,0ffh,040h,0ffh,040h,0ffh,040h,0ffh,040h	; 8bbb  .........@.@.@.@
	defb 07fh,080h,07fh,080h,07fh,0c0h,07fh,0c0h,03fh,0a0h,03fh,0a0h,01fh,090h,01fh,090h	; 8bcb  ........?.?.....
	defb 00fh,088h,00fh,088h,007h,084h,007h,084h,003h,082h,003h,082h,001h,081h,001h,081h	; 8bdb  ................
	defb 07fh,020h,07fh,020h,07fh,020h,07fh,020h,03fh,010h,03fh,010h,03fh,010h,03fh,010h	; 8beb  . . . . ?.?.?.?.
	defb 0f8h,00ch,0f8h,00ch,0fch,006h,0fch,006h,0feh,003h,0feh,003h,0ffh,001h,0ffh,001h	; 8bfb  ................
	defb 0fch,002h,0fch,002h,0f8h,005h,0f8h,005h,0f2h,009h,0f2h,009h,0e6h,011h,0e6h,011h	; 8c0b  ................
	defb 0ceh,021h,0ceh,021h,09eh,041h,09eh,041h,03eh,081h,03eh,081h,07eh,001h,07eh,001h	; 8c1b  .!.!.A.A>.>.~.~.
	defb 0fdh,003h,0fdh,003h,0fbh,006h,0fbh,006h,0f7h,00ch,0f7h,00ch,0efh,018h,0efh,018h	; 8c2b  ................
	defb 0dfh,030h,0dfh,030h,0bfh,060h,0bfh,060h,07fh,0c0h,07fh,0c0h,0ffh,080h,0ffh,080h	; 8c3b  .0.0.`.`........
	defb 000h,080h,000h,080h,000h,080h,000h,080h,000h,080h,000h,080h,000h,080h,000h,080h	; 8c4b  ................
	defb 080h,0ffh,087h,0c0h,08fh,080h,09fh,095h,09fh,0d5h,0bfh,0d5h,0bfh,0d5h,0aah,0d5h	; 8c5b  ................
	defb 000h,0ffh,0c2h,000h,0e7h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 8c6b  ................
	defb 000h,0c0h,000h,0c0h,040h,0e0h,040h,0e0h,020h,0b0h,020h,0b0h,010h,098h,010h,098h	; 8c7b  ....@.@. . .....
	defb 008h,08ch,008h,08ch,004h,086h,004h,086h,002h,083h,002h,083h,001h,081h,001h,081h	; 8c8b  ................
	defb 0feh,001h,0feh,001h,0feh,001h,0feh,001h,0feh,001h,0feh,001h,0feh,001h,0feh,001h	; 8c9b  ................
	defb 0fch,003h,0fch,003h,0f8h,005h,0f8h,005h,0f2h,009h,0f2h,009h,0e6h,011h,0e6h,011h	; 8cab  ................
	defb 0ceh,021h,0ceh,021h,09eh,041h,09eh,041h,03eh,081h,03eh,081h,07eh,001h,07eh,001h	; 8cbb  .!.!.A.A>.>.~.~.
	defb 060h,0c8h,060h,0c8h,060h,0c8h,060h,0c8h,060h,0c8h,060h,0c8h,077h,0c8h,077h,0c8h	; 8ccb  `.`.`.`.`.`.w.w.
	defb 00bh,002h,00bh,002h,00bh,002h,00bh,002h,00bh,002h,00bh,002h,0fbh,002h,0fbh,002h	; 8cdb  ................
	defb 080h,0c0h,080h,0c0h,0c0h,060h,0c0h,060h,0e0h,030h,0e0h,030h,0f0h,018h,0f0h,018h	; 8ceb  .....`.`.0.0....
	defb 01fh,008h,01fh,008h,01fh,008h,01fh,009h,00eh,007h,00dh,006h,00fh,004h,00fh,004h	; 8cfb  ................
	defb 007h,002h,007h,002h,007h,002h,007h,002h,003h,001h,003h,001h,003h,001h,003h,001h	; 8d0b  ................
	defb 001h,081h,001h,081h,001h,081h,001h,081h,081h,0c1h,081h,0c1h,081h,0c1h,081h,0c1h	; 8d1b  ................
	defb 041h,061h,041h,061h,041h,061h,041h,061h,021h,031h,021h,031h,021h,031h,021h,031h	; 8d2b  AaAaAaAa!1!1!1!1
	defb 011h,019h,011h,019h,011h,019h,011h,019h,009h,00dh,009h,00dh,009h,00dh,009h,00dh	; 8d3b  ................
	defb 005h,007h,005h,007h,005h,007h,005h,007h,002h,003h,002h,003h,002h,003h,002h,003h	; 8d4b  ................
	defb 001h,001h,001h,001h,001h,001h,001h,001h,001h,081h,001h,081h,001h,081h,001h,081h	; 8d5b  ................
	defb 081h,041h,081h,041h,081h,041h,081h,041h,0e1h,0e1h,001h,0e1h,0c1h,021h,0c1h,021h	; 8d6b  .A.A.A.A.....!.!
	defb 0e1h,011h,0e1h,011h,0e1h,011h,0e1h,011h,0f1h,009h,0f1h,009h,0f1h,009h,0f1h,009h	; 8d7b  ................
	defb 0f9h,005h,0e9h,005h,0e9h,015h,0f9h,005h,0f5h,003h,0f5h,00bh,0fdh,003h,0ffh,0ffh	; 8d8b  ................
	defb 07fh,020h,07fh,020h,07fh,020h,07fh,020h,03fh,010h,03fh,010h,03fh,010h,03fh,01fh	; 8d9b  . . . . ?.?.?.?.

; ----------------------------------------------------------------------
; DATOS dibujo_8DAB: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 14 de la lista 0x870A (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (32 bytes)
;   0x8dab..0x8dcb  (32 bytes)
DATA_dibujo_8DAB:
	defb 0e1h,017h,0e1h,017h,0e1h,017h,0e1h,017h,0c1h,02fh,0c1h,02fh,0c1h,02fh,0c1h,02fh	; 8dab  ........././././
	defb 081h,05fh,081h,05fh,081h,05fh,081h,05fh,001h,0bfh,001h,0bfh,001h,0bfh,001h,0bfh	; 8dbb  ._._._._........

; ----------------------------------------------------------------------
; DATOS dibujo_8DCB: 1 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 15 de la lista 0x870A (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (24 bytes)
;   0x8dcb..0x8de3  (24 bytes)
DATA_dibujo_8DCB:
	defb 0f9h,004h,001h,0f9h,004h,001h,0f9h,004h,001h,0f9h,004h,001h,0f1h,00ah,001h,0f1h,00ah,001h,0f1h,00ah,001h,0f1h,0fah,001h	; 8dcb  ........................

; ----------------------------------------------------------------------
; DATOS dibujo_8DE3: 7 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 16 de la lista 0x870A (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (112 bytes)
;   0x8de3..0x8e53  (112 bytes)
DATA_dibujo_8DE3:
	defb 001h,07fh,001h,07fh,001h,07fh,001h,07fh,001h,07fh,001h,07fh,001h,07fh,001h,07fh	; 8de3  ................
	defb 002h,07eh,002h,07eh,002h,07eh,002h,07eh,005h,07dh,005h,07dh,005h,07dh,005h,07dh	; 8df3  .~.~.~.~.}.}.}.}
	defb 009h,07bh,009h,07bh,009h,07bh,009h,07bh,011h,077h,011h,077h,011h,077h,011h,077h	; 8e03  .{.{.{.{.w.w.w.w
	defb 021h,06fh,021h,06fh,021h,06fh,021h,06fh,041h,05fh,041h,05fh,041h,05fh,041h,05fh	; 8e13  !o!o!o!oA_A_A_A_
	defb 001h,03fh,001h,03fh,001h,03fh,001h,03fh,001h,07fh,001h,07fh,001h,07fh,001h,07fh	; 8e23  .?.?.?.?........
	defb 0ffh,07fh,0ffh,07fh,0ffh,07fh,0ffh,07fh,0feh,07fh,0feh,07fh,0feh,07fh,0feh,07fh	; 8e33  ................
	defb 0fdh,07eh,0fdh,07eh,0fdh,07eh,0fdh,07eh,0fbh,07ch,0fbh,07ch,0fbh,07ch,0fbh,07ch	; 8e43  .~.~.~.~.|.|.|.|

; ----------------------------------------------------------------------
; DATOS dibujo_8E53: 3 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 17 de la lista 0x870A (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (72 bytes)
;   0x8e53..0x8e9b  (72 bytes)
DATA_dibujo_8E53:
	defb 0f7h,008h,070h,0f7h,008h,070h,0f7h,008h,070h,0ffh,007h,070h,0e0h,01fh,060h,0e1h,010h,060h,0ebh,010h,060h,0ffh,000h,060h	; 8e53  ..p..p..p..p..`..`..`..`
	defb 0dfh,020h,040h,0dfh,020h,040h,0dfh,020h,040h,0dfh,020h,040h,0bfh,040h,000h,0bfh,040h,000h,0bfh,040h,000h,0ffh,0ffh,000h	; 8e6b  . @. @. @. @.@..@..@....
	defb 0fch,003h,005h,0fch,003h,005h,0fch,003h,005h,0fch,003h,005h,0fah,0f5h,00bh,00ah,0f5h,00bh,0fah,005h,00bh,0fah,005h,00bh	; 8e83  ........................

; ----------------------------------------------------------------------
; DATOS dibujo_8E9B: 9 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 18 de la lista 0x870A (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (144 bytes)
;   0x8e9b..0x8f2b  (144 bytes)
DATA_dibujo_8E9B:
	defb 0ffh,001h,001h,001h,001h,001h,001h,001h,001h,003h,001h,003h,001h,003h,001h,003h	; 8e9b  ................
	defb 009h,017h,009h,017h,009h,017h,009h,017h,011h,02fh,011h,02fh,011h,02fh,011h,02fh	; 8eab  ........././././
	defb 021h,05fh,021h,05fh,021h,05fh,021h,05fh,041h,0bfh,041h,0bfh,041h,0bfh,041h,0bfh	; 8ebb  !_!_!_!_A.A.A.A.
	defb 002h,07eh,002h,07eh,002h,07eh,002h,07eh,005h,07dh,005h,07dh,005h,07dh,005h,07dh	; 8ecb  .~.~.~.~.}.}.}.}
	defb 009h,07bh,009h,07bh,009h,07bh,009h,07bh,011h,077h,011h,077h,011h,077h,011h,077h	; 8edb  .{.{.{.{.w.w.w.w
	defb 021h,06fh,021h,06fh,021h,06fh,021h,06fh,041h,05fh,041h,05fh,041h,05fh,041h,05fh	; 8eeb  !o!o!o!oA_A_A_A_
	defb 081h,0bfh,081h,0bfh,081h,0bfh,081h,0bfh,001h,07fh,001h,07fh,001h,07fh,001h,07fh	; 8efb  ................
	defb 001h,07fh,001h,07fh,001h,07fh,001h,07fh,001h,07fh,001h,07fh,001h,07fh,001h,07fh	; 8f0b  ................
	defb 0ffh,003h,0ffh,003h,0ffh,003h,0ffh,003h,0fdh,005h,0fdh,005h,0fdh,005h,005h,005h	; 8f1b  ................

; ----------------------------------------------------------------------
; DATOS dibujo_8F2B: 4 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 19 de la lista 0x870A (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (64 bytes)
;   0x8f2b..0x8f6b  (64 bytes)
DATA_dibujo_8F2B:
	defb 0ffh,0ffh,000h,0ffh,0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 8f2b  ................
	defb 0c8h,0dbh,000h,0ffh,0c8h,0dbh,000h,0ffh,0c8h,0dbh,000h,0ffh,0c8h,0dbh,000h,0ffh	; 8f3b  ................
	defb 0bdh,07fh,0bdh,047h,0bdh,07fh,081h,07fh,0f7h,0efh,014h,0efh,014h,0efh,01ch,0ffh	; 8f4b  ...G............
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,000h,0ffh,0ffh	; 8f5b  ................

; ----------------------------------------------------------------------
; DATOS dibujo_8F6B: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 20 de la lista 0x870A (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (16 bytes)
;   0x8f6b..0x8f7b  (16 bytes)
DATA_dibujo_8F6B:
	defb 0ffh,000h,0ffh,000h,001h,001h,07fh,001h,047h,03dh,07fh,03dh,07fh,001h,047h,005h	; 8f6b  ........G=.=..G.

; ----------------------------------------------------------------------
; DATOS dibujo_8F7B: 6 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 21 de la lista 0x870A (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (144 bytes)
;   0x8f7b..0x900b  (144 bytes)
DATA_dibujo_8F7B:
	defb 0ffh,00fh,010h,0fah,00dh,010h,00bh,00ch,0e0h,06ah,00dh,0e0h,06ah,02dh,0c0h,06ah,06dh,080h,06ah,0edh,000h,06ah,0edh,000h	; 8f7b  .........j..j-.jm.j..j..
	defb 0ffh,0f0h,001h,05fh,090h,001h,0d0h,010h,00eh,016h,0d0h,00eh,016h,0d2h,00ch,016h,0d6h,008h,0d6h,03eh,000h,036h,03eh,000h	; 8f93  ..._...............>.6>.
	defb 06ah,0cdh,020h,06ah,08dh,060h,06ah,00dh,0e0h,06ah,00dh,0e0h,06ah,02dh,0c0h,06ah,06dh,080h,06ah,0edh,000h,06ah,0edh,000h	; 8fab  j. j.`j..j..j-.jm.j..j..
	defb 016h,0dch,002h,016h,0d8h,006h,016h,0d0h,00eh,016h,0d0h,00eh,016h,0d2h,00ch,016h,0d6h,008h,016h,0deh,000h,016h,0deh,000h	; 8fc3  ........................
	defb 06ah,0cdh,020h,06ah,08dh,060h,06ah,00dh,0e0h,06ah,00dh,0e0h,06ah,02dh,0c0h,06ah,06dh,080h,008h,088h,000h,0ffh,0ffh,000h	; 8fdb  j. j.`j..j..j-.jm.......
	defb 0d6h,03ch,002h,036h,038h,006h,016h,0d0h,00eh,016h,0d0h,00eh,016h,0d2h,00ch,016h,0d6h,008h,010h,018h,000h,0ffh,0ffh,000h	; 8ff3  .<.68...................

; ----------------------------------------------------------------------
; DATOS dibujo_900B: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 22 de la lista 0x870A (p00:4D92, p00:4DF5); lo leen p00:4C0C (8
;   bytes)
;   0x900b..0x9013  (8 bytes)
DATA_dibujo_900B:
	defb 080h,080h,080h,080h,040h,040h,040h,040h	; 900b  ....@@@@

; ----------------------------------------------------------------------
; DATOS dibujo_9013: 2 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 23 de la lista 0x870A (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (48 bytes)
;   0x9013..0x9043  (48 bytes)
DATA_dibujo_9013:
	defb 000h,080h,07fh,004h,0c4h,03fh,040h,0e0h,01fh,021h,0b1h,00fh,010h,098h,007h,008h,08ch,003h,004h,086h,001h,002h,083h,000h	; 9013  .....?@..!..............
	defb 050h,051h,0feh,020h,023h,0fch,002h,007h,0f8h,006h,00dh,0f0h,04eh,059h,0e0h,01eh,031h,0c0h,03eh,061h,080h,07eh,0c1h,000h	; 902b  PQ. #.......NY..1.>a.~..

; ----------------------------------------------------------------------
; DATOS dibujo_9043: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 24 de la lista 0x870A (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (32 bytes)
;   0x9043..0x9063  (32 bytes)
DATA_dibujo_9043:
	defb 0ffh,001h,0ffh,001h,0ffh,001h,0ffh,001h,0fdh,003h,0fdh,003h,0fdh,003h,0fdh,003h	; 9043  ................
	defb 0f9h,005h,0f9h,005h,0f9h,005h,0f9h,005h,0f1h,00bh,0f1h,00bh,0f1h,00bh,0f1h,00bh	; 9053  ................

; ----------------------------------------------------------------------
; DATOS dibujo_9063: 12 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 25 de la lista 0x870A (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (192 bytes)
;   0x9063..0x9123  (192 bytes)
DATA_dibujo_9063:
	defb 07fh,080h,000h,080h,000h,080h,01fh,09fh,010h,090h,017h,097h,017h,097h,017h,097h	; 9063  ................
	defb 0ffh,000h,000h,000h,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9073  ................
	defb 0ffh,000h,001h,000h,001h,000h,0f9h,0f8h,009h,008h,0e9h,0e8h,0e9h,0e8h,0e9h,0e8h	; 9083  ................
	defb 017h,097h,017h,097h,017h,097h,017h,097h,017h,097h,017h,097h,017h,097h,017h,097h	; 9093  ................
	defb 0e9h,0e8h,0e9h,0e8h,0e9h,0e8h,0e9h,0e8h,0e9h,0e8h,0e9h,0e8h,0e9h,0e8h,0e9h,0e8h	; 90a3  ................
	defb 017h,097h,017h,097h,017h,097h,010h,090h,01fh,09fh,000h,080h,000h,080h,07fh,080h	; 90b3  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,000h,000h,0ffh,000h	; 90c3  ................
	defb 0e9h,0e8h,0e9h,0e8h,0e9h,0e8h,009h,008h,0f9h,0f8h,001h,000h,001h,000h,0ffh,000h	; 90d3  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0e0h,0e0h,0efh,0efh,0e8h,0e8h,0e8h,0e8h,0e9h,0e8h	; 90e3  ................
	defb 0e9h,0e8h,0e8h,0e8h,0e8h,0e8h,0efh,0efh,0e0h,0e0h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 90f3  ................
	defb 097h,017h,017h,017h,017h,017h,0f7h,0f7h,007h,007h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9103  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,007h,007h,0f7h,0f7h,017h,017h,017h,017h,097h,017h	; 9113  ................

; ----------------------------------------------------------------------
; DATOS dibujo_9123: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 26 de la lista 0x870A (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (32 bytes)
;   0x9123..0x9143  (32 bytes)
DATA_dibujo_9123:
	defb 000h,000h,0ffh,000h,000h,0ffh,0ffh,000h,0ffh,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9123  ................
	defb 000h,000h,0ffh,000h,000h,0ffh,0ffh,000h,0ffh,000h,0ffh,0f9h,0ffh,0fdh,0ffh,0dfh	; 9133  ................

; ----------------------------------------------------------------------
; DATOS dibujo_9143: 2 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 27 de la lista 0x870A (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (48 bytes)
;   0x9143..0x9173  (48 bytes)
DATA_dibujo_9143:
	defb 0ffh,000h,000h,006h,0fdh,002h,0f6h,00dh,0f2h,016h,0edh,012h,016h,0edh,012h,006h,0fdh,032h,006h,0fdh,0b2h,006h,0fdh,0f2h	; 9143  .................2......
	defb 0ffh,000h,000h,060h,0dfh,000h,0ffh,040h,09fh,0f0h,04fh,090h,0f0h,04fh,090h,0f0h,04fh,097h,0f0h,04fh,097h,0f0h,04fh,097h	; 915b  ...`...@..O..O..O..O..O.

; ----------------------------------------------------------------------
; DATOS dibujo_9173: 7 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 0 de la lista 0x8797 (p00:4D92, p00:4DF5); lo leen p00:4C0C (56
;   bytes)
;   0x9173..0x91ab  (56 bytes)
DATA_dibujo_9173:
	defb 000h,000h,000h,010h,028h,010h,000h,001h	; 9173  ....(...
	defb 000h,002h,000h,000h,028h,075h,020h,008h	; 917b  ....(u .
	defb 000h,000h,000h,000h,000h,000h,000h,000h	; 9183  ........
	defb 000h,000h,000h,010h,000h,002h,000h,040h	; 918b  .......@
	defb 000h,000h,020h,000h,000h,004h,000h,000h	; 9193  .. .....
	defb 0c0h,0fah,020h,000h,000h,002h,0f0h,000h	; 919b  .. .....
	defb 000h,000h,000h,000h,000h,006h,002h,000h	; 91a3  ........

; ----------------------------------------------------------------------
; DATOS dibujo_91AB: 10 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 1 de la lista 0x8797 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (160 bytes)
;   0x91ab..0x924b  (160 bytes)
DATA_dibujo_91AB:
	defb 000h,0ffh,000h,0ffh,010h,0ffh,000h,0ffh,000h,0ffh,004h,0ffh,006h,0ffh,0ffh,000h	; 91ab  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,040h,0ffh,004h,0ffh,099h,06eh	; 91bb  ..........@....n
	defb 010h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,001h,0ffh,000h,0ffh,000h,0ffh,0b5h,04eh	; 91cb  ...............N
	defb 000h,0ffh,000h,0ffh,020h,0efh,000h,0cfh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 91db  .... ...........
	defb 000h,0ffh,000h,0ffh,008h,0fbh,000h,0f3h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 91eb  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,020h,0efh,000h,0cfh,000h,0ffh,0ffh,000h	; 91fb  ........ .......
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,008h,0fbh,000h,0f3h,000h,0ffh,0ffh,000h	; 920b  ................
	defb 002h,0ffh,000h,0ffh,020h,0ffh,000h,0ffh,008h,0ffh,00ch,0ffh,040h,0ffh,0ffh,000h	; 921b  .... .......@...
	defb 000h,0ffh,000h,0ffh,002h,0ffh,000h,0ffh,000h,0ffh,018h,0ffh,020h,0ffh,0ffh,000h	; 922b  ............ ...
	defb 001h,0ffh,000h,0ffh,000h,0ffh,020h,0ffh,000h,0ffh,000h,0ffh,004h,0ffh,0ffh,000h	; 923b  ...... .........

; ----------------------------------------------------------------------
; DATOS dibujo_924B: 19 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 2 de la lista 0x8797 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (456 bytes)
;   0x924b..0x9413  (456 bytes)
DATA_dibujo_924B:
	defb 000h,001h,001h,000h,003h,001h,004h,003h,001h,00ch,007h,001h,008h,00bh,001h,018h,001h,001h,018h,013h,001h,008h,00bh,001h	; 924b  ........................
	defb 038h,027h,001h,038h,023h,001h,030h,023h,001h,070h,043h,001h,078h,041h,001h,070h,061h,001h,030h,021h,001h,038h,003h,001h	; 9263  8'.8#.0#.pC.xA.pa.0!.8..
	defb 010h,013h,001h,018h,013h,001h,018h,017h,001h,03ch,023h,001h,078h,061h,001h,030h,021h,001h,030h,011h,001h,038h,013h,001h	; 927b  .........<#.xa.0!.0..8..
	defb 010h,013h,001h,034h,033h,001h,038h,013h,001h,038h,033h,001h,030h,023h,001h,070h,061h,001h,078h,063h,001h,030h,023h,001h	; 9293  ...43.8..83.0#.pa.xc.0#.
	defb 030h,037h,001h,030h,013h,001h,038h,013h,001h,038h,011h,001h,074h,021h,001h,070h,021h,001h,038h,013h,001h,038h,0d7h,001h	; 92ab  07.0..8..8..t!.p!.8..8..
	defb 01ch,00bh,000h,01ch,00bh,000h,01eh,00dh,000h,00fh,002h,000h,00ah,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 92c3  ........................
	defb 000h,080h,000h,000h,0c0h,080h,040h,0a0h,080h,040h,0f0h,0c0h,060h,0d8h,0c0h,070h,0ech,0e0h,060h,0deh,0c0h,050h,0efh,0c0h	; 92db  ......@..@..`..p..`..P..
	defb 044h,0e3h,0d8h,044h,0e3h,0d8h,064h,0f3h,0e8h,062h,0f1h,0ech,042h,0e1h,0dch,066h,0f1h,0e8h,064h,0f3h,0e8h,040h,0e3h,0dch	; 92f3  D..D..d..b..B..f..d..@..
	defb 068h,0f7h,0e0h,048h,0e7h,0d0h,048h,0e7h,0d0h,004h,0c3h,0b8h,046h,0e1h,0d8h,064h,0f3h,0e8h,068h,0f3h,0e4h,068h,0e3h,0f4h	; 930b  h..H..H.....F..d..h..h..
	defb 048h,0f7h,0c0h,00ch,0d3h,0a0h,048h,0e3h,0d4h,04ch,0e3h,0d0h,064h,0f3h,0e8h,066h,0f1h,0e8h,046h,0e1h,0d8h,064h,0f3h,0e8h	; 9323  H.....H..L..d..f..F..d..
	defb 06ch,0f3h,0e0h,068h,0f3h,0e4h,048h,0e3h,0d4h,048h,0e3h,0d4h,004h,0d1h,0aah,064h,0f1h,0eah,048h,0e3h,0d4h,048h,0e3h,0d4h	; 933b  l..h..H..H.....d..H..H..
	defb 07ch,0fbh,0f8h,0ech,0e3h,0f0h,066h,071h,0e8h,088h,027h,050h,068h,087h,010h,010h,0efh,000h,000h,0ffh,000h,000h,0ffh,000h	; 9353  |.....fq..'Ph...........
	defb 000h,0ffh,0ffh,0ffh,0ffh,0ffh,07dh,07dh,0ffh,098h,018h,07fh,0e7h,000h,018h,01ch,003h,000h,008h,007h,000h,000h,007h,000h	; 936b  ......}}................
	defb 000h,0ffh,0ffh,0ffh,0ffh,0ffh,0f5h,0f5h,0ffh,065h,060h,0fah,01ah,005h,0e0h,090h,00fh,060h,060h,09fh,000h,000h,0ffh,000h	; 9383  .........e`......``.....
	defb 000h,0ffh,0ffh,0ffh,0ffh,0ffh,05ah,05ah,0ffh,094h,010h,07bh,06bh,084h,010h,011h,0eeh,000h,000h,0ffh,000h,000h,0ffh,000h	; 939b  ......ZZ...{k...........
	defb 000h,0ffh,0ffh,0ffh,0ffh,0ffh,0f6h,0f6h,0ffh,041h,050h,0eeh,02fh,000h,0d0h,0b9h,046h,000h,010h,0efh,000h,000h,0ffh,000h	; 93b3  .........AP./...F.......
	defb 000h,0ffh,0ffh,0ffh,0ffh,0ffh,07dh,07dh,0ffh,098h,018h,07fh,0e7h,000h,018h,01ch,0e3h,000h,008h,0f7h,000h,000h,0ffh,000h	; 93cb  ......}}................
	defb 000h,0ffh,0ffh,07fh,0ffh,0ffh,045h,0e9h,0d3h,00bh,0d0h,0a4h,046h,0e1h,0d8h,066h,0f1h,0e8h,068h,0f3h,0e4h,06ah,0e1h,0f4h	; 93e3  ......E.....F..f..h..j..
	defb 000h,0ffh,0ffh,0feh,0ffh,0ffh,092h,04fh,003h,0e0h,05bh,001h,0f8h,0a3h,001h,070h,0a3h,001h,030h,057h,001h,078h,061h,001h	; 93fb  .......O..[....p..0W.xa.

; ----------------------------------------------------------------------
; DATOS dibujo_9413: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 3 de la lista 0x8797 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (16 bytes)
;   0x9413..0x9423  (16 bytes)
DATA_dibujo_9413:
	defb 000h,0ffh,000h,0ffh,000h,0ffh,0ffh,000h,0ffh,000h,000h,000h,0ffh,0ffh,0ffh,000h	; 9413  ................

; ----------------------------------------------------------------------
; DATOS dibujo_9423: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 4 de la lista 0x8797 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (16 bytes)
;   0x9423..0x9433  (16 bytes)
DATA_dibujo_9423:
	defb 0ffh,000h,004h,0fbh,06ah,0ffh,000h,0ffh,076h,0ffh,000h,0ffh,0ffh,000h,0ffh,000h	; 9423  ....j...v.......

; ----------------------------------------------------------------------
; DATOS dibujo_9433: 5 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 5 de la lista 0x8797 (p00:4D92, p00:4DF5); lo leen p00:4C0C (40
;   bytes)
;   0x9433..0x945b  (40 bytes)
DATA_dibujo_9433:
	defb 0ffh,0ffh,0dfh,0fbh,0ffh,0ffh,0feh,0dfh	; 9433  ........
	defb 0ffh,0dfh,0ffh,0fdh,0ffh,0ffh,0dfh,0ffh	; 943b  ........
	defb 0ffh,0dfh,0ffh,0f9h,0f9h,0ffh,0bfh,0ffh	; 9443  ........
	defb 0ffh,0bfh,0ffh,0f7h,0f7h,0ffh,0beh,0ffh	; 944b  ........
	defb 0ffh,0feh,0ffh,0ffh,0fbh,0cfh,0dfh,0ffh	; 9453  ........

; ----------------------------------------------------------------------
; DATOS dibujo_945B: 2 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 6 de la lista 0x8797 (p00:4D92, p00:4DF5); lo leen p00:4C0C (16
;   bytes)
;   0x945b..0x946b  (16 bytes)
DATA_dibujo_945B:
	defb 0ffh,0ffh,0ffh,0ffh,0fdh,0efh,0ffh,0ffh	; 945b  ........
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9463  ........

; ----------------------------------------------------------------------
; DATOS dibujo_946B: 5 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 7 de la lista 0x8797 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (80 bytes)
;   0x946b..0x94bb  (80 bytes)
DATA_dibujo_946B:
	defb 0ffh,000h,0feh,001h,0ffh,000h,0ffh,000h,08bh,054h,0ffh,000h,0ffh,000h,0ffh,000h	; 946b  .........T......
	defb 0ffh,000h,0fdh,002h,0ffh,000h,0ffh,000h,0f7h,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 947b  ................
	defb 0ffh,000h,0f9h,006h,0f9h,006h,0f7h,008h,0ffh,000h,0ffh,000h,0ffh,000h,0bfh,000h	; 948b  ................
	defb 0ffh,000h,0efh,010h,0d7h,028h,0efh,010h,0ffh,000h,0feh,000h,0ffh,000h,0ffh,000h	; 949b  .....(..........
	defb 0ffh,000h,0ffh,000h,0e7h,000h,09bh,024h,0f7h,008h,0f9h,006h,0bfh,040h,0ffh,000h	; 94ab  .......$.....@..

; ----------------------------------------------------------------------
; DATOS dibujo_94BB: 24 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 8 de la lista 0x8797 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (384 bytes)
;   0x94bb..0x963b  (384 bytes)
DATA_dibujo_94BB:
	defb 0c3h,0d0h,0c3h,0d0h,093h,090h,08bh,099h,083h,090h,0c3h,0d0h,053h,0d0h,083h,090h	; 94bb  ............S...
	defb 043h,0d0h,083h,090h,083h,092h,0c7h,0d4h,043h,0d0h,0e3h,0f0h,0a3h,0b0h,083h,090h	; 94cb  C.......C.......
	defb 0c3h,0d0h,043h,0d0h,067h,0f4h,0e3h,0f0h,043h,0d0h,093h,090h,083h,091h,003h,090h	; 94db  ..C.g...C.......
	defb 043h,0d0h,0a3h,0b1h,083h,090h,083h,090h,0c3h,0d0h,0c3h,0d0h,0a3h,0b0h,083h,090h	; 94eb  C...............
	defb 0c0h,009h,0c1h,089h,0c9h,009h,0c2h,00bh,0c7h,00fh,0e6h,02fh,0c2h,00bh,0c3h,00bh	; 94fb  .........../....
	defb 0c1h,009h,0cah,00bh,0c3h,00bh,0c1h,009h,0d1h,099h,0d9h,019h,0c3h,00bh,0c3h,00bh	; 950b  ................
	defb 0c1h,009h,0c5h,00dh,0c3h,00bh,0c3h,00bh,0c1h,009h,0c1h,009h,0c5h,08dh,0c2h,00bh	; 951b  ................
	defb 0c1h,009h,0c5h,00dh,0c7h,00fh,0c2h,00bh,0e3h,02bh,0e1h,069h,0c1h,009h,0c2h,00bh	; 952b  .........+.i....
	defb 0c0h,00bh,0c2h,00dh,0c6h,009h,0c4h,019h,0d0h,029h,0f0h,009h,0e0h,009h,0c0h,009h	; 953b  .........)......
	defb 003h,0d0h,043h,0b0h,063h,090h,023h,098h,00bh,094h,00fh,090h,007h,090h,003h,090h	; 954b  ..C.c.#.........
	defb 04ch,0ffh,070h,0f0h,0e4h,0f4h,060h,0dfh,048h,0d4h,0eeh,0f0h,087h,090h,0c3h,0d0h	; 955b  L.p...`.H.......
	defb 050h,0ffh,05eh,05dh,03eh,03fh,00fh,0fbh,055h,06dh,070h,009h,0e8h,009h,0c0h,009h	; 956b  P.^]>?..Ump.....
	defb 0c0h,009h,0c0h,009h,0c0h,009h,0c0h,009h,0c0h,009h,0c0h,009h,0c0h,009h,0c0h,009h	; 957b  ................
	defb 003h,090h,003h,090h,003h,090h,003h,090h,003h,090h,003h,090h,003h,090h,003h,090h	; 958b  ................
	defb 001h,0ffh,020h,020h,000h,000h,000h,0ffh,008h,008h,000h,000h,0ffh,010h,0ffh,000h	; 959b  ..  ............
	defb 000h,0ffh,000h,000h,010h,010h,000h,0ffh,002h,002h,000h,000h,0ffh,020h,0ffh,000h	; 95ab  ............. ..
	defb 0c0h,009h,0c0h,009h,0e0h,029h,0c0h,009h,0c0h,009h,0c4h,00dh,0c0h,009h,0c0h,009h	; 95bb  .....)..........
	defb 0c0h,009h,0c4h,00dh,0c0h,009h,0c2h,00bh,0c0h,009h,0c0h,009h,0c0h,049h,0c0h,009h	; 95cb  .............I..
	defb 0c0h,009h,0c0h,009h,0d0h,019h,0c0h,009h,0c0h,009h,0e0h,069h,0c0h,009h,0c2h,00bh	; 95db  ...........i....
	defb 0c0h,009h,0c0h,009h,0c0h,009h,0c0h,089h,0c0h,009h,0c0h,009h,0c8h,009h,0c0h,009h	; 95eb  ................
	defb 003h,090h,013h,090h,003h,090h,003h,090h,003h,091h,003h,090h,043h,0d0h,003h,090h	; 95fb  ............C...
	defb 003h,090h,023h,0b0h,003h,090h,003h,090h,007h,094h,003h,090h,003h,090h,003h,090h	; 960b  ..#.............
	defb 003h,090h,013h,090h,003h,090h,003h,090h,00bh,099h,013h,090h,003h,090h,003h,090h	; 961b  ................
	defb 003h,090h,003h,090h,003h,090h,043h,0d0h,003h,090h,003h,090h,003h,091h,003h,090h	; 962b  ......C.........

; ----------------------------------------------------------------------
; DATOS dibujo_963B: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 9 de la lista 0x8797 (p00:4D92, p00:4DF5); lo leen p00:4C0C (8
;   bytes)
;   0x963b..0x9643  (8 bytes)
DATA_dibujo_963B:
	defb 0c3h,0e3h,0c7h,0e7h,0e7h,0f7h,0d7h,0f7h	; 963b  ........

; ----------------------------------------------------------------------
; DATOS dibujo_9643: 3 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 10 de la lista 0x8797 (p00:4D92, p00:4DF5); lo leen p00:4C0C (24
;   bytes)
;   0x9643..0x965b  (24 bytes)
DATA_dibujo_9643:
	defb 080h,080h,080h,080h,040h,040h,040h,040h	; 9643  ....@@@@
	defb 000h,000h,000h,000h,000h,000h,000h,0ffh	; 964b  ........
	defb 000h,000h,000h,000h,080h,080h,080h,080h	; 9653  ........

; ----------------------------------------------------------------------
; DATOS dibujo_965B: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 11 de la lista 0x8797 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (16 bytes)
;   0x965b..0x966b  (16 bytes)
DATA_dibujo_965B:
	defb 0ffh,0c0h,0ffh,0c0h,0ffh,0c0h,0ffh,0c0h,0f7h,0e0h,0ffh,0e0h,0fbh,0e0h,0f1h,0e0h	; 965b  ................

; ----------------------------------------------------------------------
; DATOS dibujo_966B: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 12 de la lista 0x8797 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (16 bytes)
;   0x966b..0x967b  (16 bytes)
DATA_dibujo_966B:
	defb 0ffh,0ffh,0ffh,000h,000h,000h,000h,000h,0ffh,000h,0ffh,0ffh,0ffh,000h,0ffh,0ffh	; 966b  ................

; ----------------------------------------------------------------------
; DATOS dibujo_967B: 6 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 13 de la lista 0x8797 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (144 bytes)
;   0x967b..0x970b  (144 bytes)
DATA_dibujo_967B:
	defb 0f7h,0f7h,0f8h,017h,0e0h,0f8h,014h,0e0h,0f8h,0d4h,0e0h,038h,057h,0e0h,0b8h,057h,0e3h,0b8h,057h,0e0h,0b8h,057h,0e7h,0b8h	; 967b  ...........8W..W..W..W..
	defb 0efh,0efh,01fh,0e0h,00fh,01fh,020h,00fh,01fh,023h,00fh,01ch,0e2h,00fh,01dh,0e2h,0cfh,01dh,0e2h,00fh,01dh,0e2h,0efh,01dh	; 9693  ...... ..#..............
	defb 0ffh,0ffh,0ffh,080h,0ffh,0ffh,080h,0ffh,0ffh,07fh,080h,0ffh,0ffh,0ffh,000h,0ffh,0bfh,000h,0ffh,0bfh,000h,0bfh,080h,000h	; 96ab  ........................
	defb 0ffh,0ffh,0ffh,000h,0ffh,0ffh,000h,0ffh,0ffh,0ffh,000h,0ffh,0ffh,0ffh,000h,0ffh,0ffh,000h,0ffh,0ffh,000h,0ffh,001h,000h	; 96c3  ........................
	defb 0ffh,0ffh,0ffh,000h,0ffh,0ffh,000h,0ffh,0ffh,0ffh,000h,0ffh,0ffh,0ffh,000h,0ffh,0bfh,000h,0ffh,0bfh,000h,0bfh,080h,000h	; 96db  ........................
	defb 0feh,0feh,0ffh,000h,0feh,0ffh,000h,0feh,0ffh,0feh,000h,0ffh,0feh,0feh,001h,0ffh,0ffh,000h,0ffh,0ffh,000h,0ffh,001h,000h	; 96f3  ........................

; ----------------------------------------------------------------------
; DATOS dibujo_970B: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 14 de la lista 0x8797 (p00:4D92, p00:4DF5); lo leen p00:4C0C (8
;   bytes)
;   0x970b..0x9713  (8 bytes)
DATA_dibujo_970B:
	defb 0bfh,0bfh,0bfh,0bfh,0bfh,0bfh,0bfh,0bfh	; 970b  ........

; ----------------------------------------------------------------------
; DATOS dibujo_9713: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 15 de la lista 0x8797 (p00:4D92, p00:4DF5); lo leen p00:4C0C (8
;   bytes)
;   0x9713..0x971b  (8 bytes)
DATA_dibujo_9713:
	defb 001h,001h,001h,001h,001h,001h,001h,001h	; 9713  ........

; ----------------------------------------------------------------------
; DATOS dibujo_971B: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 16 de la lista 0x8797 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (32 bytes)
;   0x971b..0x973b  (32 bytes)
DATA_dibujo_971B:
	defb 0ffh,001h,0ffh,0ffh,001h,0ffh,0ffh,0ffh,0ffh,001h,0ffh,001h,0ffh,0ffh,0ffh,0ffh	; 971b  ................
	defb 0bfh,000h,0ffh,0ffh,040h,0bfh,0ffh,0ffh,0bfh,000h,0ffh,000h,0ffh,0ffh,0ffh,0ffh	; 972b  ....@...........

; ----------------------------------------------------------------------
; DATOS dibujo_973B: 1 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 17 de la lista 0x8797 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (24 bytes)
;   0x973b..0x9753  (24 bytes)
DATA_dibujo_973B:
	defb 06eh,06ch,07ch,046h,044h,07ch,07eh,07ch,07ch,002h,000h,000h,07eh,07ch,07ch,046h,044h,07ch,06eh,06ch,07ch,002h,000h,000h	; 973b  nl|FD|~||...~||FD|nl|...

; ----------------------------------------------------------------------
; DATOS dibujo_9753: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 18 de la lista 0x8797 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (32 bytes)
;   0x9753..0x9773  (32 bytes)
DATA_dibujo_9753:
	defb 080h,07fh,0c0h,03fh,060h,01fh,030h,00fh,018h,007h,00ch,003h,006h,001h,003h,000h	; 9753  ...?`.0.........
	defb 0ffh,000h,0c0h,03fh,06fh,01fh,030h,00fh,018h,007h,00ch,003h,006h,001h,003h,000h	; 9763  ...?o.0.........

; ----------------------------------------------------------------------
; DATOS dibujo_9773: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 19 de la lista 0x8797 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (32 bytes)
;   0x9773..0x9793  (32 bytes)
DATA_dibujo_9773:
	defb 001h,001h,0ffh,003h,005h,0fdh,0f9h,00bh,0f1h,017h,0e1h,02fh,0c1h,05fh,001h,03fh	; 9773  .........../._.?
	defb 0ffh,001h,0ffh,003h,0fdh,005h,0f9h,00bh,0f1h,017h,0e1h,02fh,0c1h,05fh,001h,03fh	; 9783  .........../._.?

; ----------------------------------------------------------------------
; DATOS dibujo_9793: 10 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 20 de la lista 0x8797 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (160 bytes)
;   0x9793..0x9833  (160 bytes)
DATA_dibujo_9793:
	defb 0ffh,000h,0bbh,033h,0ffh,000h,0bbh,033h,0ffh,000h,0bbh,033h,0ffh,000h,0bbh,033h	; 9793  ...3...3...3...3
	defb 000h,0ffh,0ffh,000h,0efh,000h,0e7h,008h,0cfh,030h,0ffh,000h,0ffh,000h,0ffh,000h	; 97a3  .........0......
	defb 0ffh,002h,0fdh,002h,0ffh,000h,0ffh,010h,0dfh,020h,0efh,010h,0ffh,000h,0ffh,000h	; 97b3  ......... ......
	defb 0bfh,0c0h,0bfh,0c0h,0bfh,0c0h,0bfh,0c0h,0bfh,0c0h,0bfh,0c0h,0bfh,0c0h,0bfh,0c0h	; 97c3  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,003h,0fch,007h,0f8h,00ch,0f1h,018h	; 97d3  ................
	defb 0ffh,000h,0ffh,000h,0fdh,000h,0d8h,000h,0ffh,0ffh,000h,0ffh,083h,000h,0cfh,000h	; 97e3  ................
	defb 09fh,0c0h,08fh,0c0h,082h,0c0h,0ffh,0ffh,080h,0ffh,0a3h,0c0h,0b7h,0c0h,0bfh,0c0h	; 97f3  ................
	defb 0e7h,030h,0c7h,060h,087h,0c0h,06fh,080h,0efh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 9803  .0.`..o.........
	defb 0feh,0ffh,080h,081h,086h,0bdh,0beh,0bdh,0beh,081h,0beh,081h,0beh,081h,000h,0ffh	; 9813  ................
	defb 000h,0ffh,0feh,001h,0eeh,001h,0e6h,009h,0cfh,030h,0ffh,000h,0ffh,000h,0ffh,000h	; 9823  .........0......

; ----------------------------------------------------------------------
; DATOS dibujo_9833: 1 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 21 de la lista 0x8797 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (24 bytes)
;   0x9833..0x984b  (24 bytes)
DATA_dibujo_9833:
	defb 0c7h,000h,000h,0bbh,000h,038h,079h,03ch,040h,07ch,0feh,000h,07ch,0feh,000h,07ch,0d6h,000h,039h,044h,000h,09bh,020h,018h	; 9833  .....8y<@|..|..|..9D.. .

; ----------------------------------------------------------------------
; DATOS dibujo_984B: 1 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 22 de la lista 0x8797 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (24 bytes)
;   0x984b..0x9863  (24 bytes)
DATA_dibujo_984B:
	defb 06eh,000h,07ch,046h,000h,07ch,07eh,000h,07ch,002h,000h,000h,07eh,000h,07ch,046h,000h,07ch,06eh,000h,07ch,002h,000h,000h	; 984b  n.|F.|~.|...~.|F.|n.|...

; ----------------------------------------------------------------------
; DATOS dibujo_9863: 12 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 0 de la lista 0x880B (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (192 bytes)
;   0x9863..0x9923  (192 bytes)
DATA_dibujo_9863:
	defb 0a2h,080h,0e6h,0a2h,0cch,0c4h,0c4h,080h,0a2h,080h,0e6h,0a2h,0cch,0c4h,080h,080h	; 9863  ................
	defb 022h,000h,066h,022h,0cch,044h,044h,000h,022h,000h,066h,022h,0cch,044h,000h,000h	; 9873  ".f".DD.".f".D..
	defb 022h,0ddh,066h,022h,0cch,044h,044h,000h,022h,000h,066h,022h,0cch,044h,000h,000h	; 9883  ".f".DD.".f".D..
	defb 0a2h,0ddh,0e6h,0a2h,0cch,0c4h,0c4h,080h,0a2h,080h,0e6h,0a2h,0cch,0c4h,080h,080h	; 9893  ................
	defb 0ffh,0ffh,066h,022h,0cch,044h,044h,000h,022h,000h,066h,022h,0cch,044h,0ffh,000h	; 98a3  ..f".DD.".f".D..
	defb 021h,003h,062h,026h,0c5h,04ch,04bh,018h,015h,032h,02bh,066h,057h,0cch,0bfh,080h	; 98b3  !.b&.LK..2+fW...
	defb 0ddh,023h,0bah,066h,075h,0cch,0ebh,018h,0d5h,032h,0abh,066h,057h,0cch,0bfh,080h	; 98c3  .#.fu....2.fW...
	defb 0dch,023h,0bah,067h,076h,0cdh,0bah,045h,0dch,023h,0bah,067h,076h,0cdh,0feh,001h	; 98d3  .#.gv..E.#.gv...
	defb 0dch,022h,0bah,066h,076h,0cch,0bah,044h,0dch,022h,0bah,066h,076h,0cch,0feh,000h	; 98e3  .".fv..D.".fv...
	defb 0dch,022h,0bah,066h,076h,0cch,0bah,044h,0dch,022h,0bah,066h,0bah,000h,0feh,0dch	; 98f3  .".fv..D.".f....
	defb 0ddh,022h,0bbh,066h,077h,0cch,0bbh,044h,0ddh,022h,0bbh,066h,0bbh,000h,0ffh,0ddh	; 9903  .".fw..D.".f....
	defb 0ddh,022h,0bbh,066h,077h,0cch,0bbh,044h,0ddh,022h,0bbh,066h,077h,0cch,0ffh,000h	; 9913  .".fw..D.".fw...

; ----------------------------------------------------------------------
; DATOS dibujo_9923: 3 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 1 de la lista 0x880B (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (48 bytes)
;   0x9923..0x9953  (48 bytes)
DATA_dibujo_9923:
	defb 0ffh,0ffh,00fh,00fh,01eh,0ffh,03ch,0ffh,078h,0ffh,0f0h,0ffh,0e1h,0ffh,0ffh,000h	; 9923  ......<.x.......
	defb 0ffh,0ffh,00fh,00fh,01eh,0ffh,03ch,0ffh,078h,0ffh,0f0h,0ffh,0e1h,0ffh,0c3h,0ffh	; 9933  ......<.x.......
	defb 0ffh,0ffh,00fh,00fh,01fh,0ffh,03dh,0ffh,079h,0ffh,0f1h,0ffh,0e1h,0ffh,0c3h,0ffh	; 9943  ......=.y.......

; ----------------------------------------------------------------------
; DATOS dibujo_9953: 7 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 2 de la lista 0x880B (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (112 bytes)
;   0x9953..0x99c3  (112 bytes)
DATA_dibujo_9953:
	defb 022h,01ch,066h,02ah,0cch,054h,044h,008h,022h,00ch,066h,02ah,0cch,044h,000h,011h	; 9953  ".f*.TD.".f*.D..
	defb 022h,000h,066h,022h,0cch,064h,044h,018h,022h,095h,066h,032h,0cch,064h,000h,010h	; 9963  ".f".dD.".f2.d..
	defb 022h,000h,066h,033h,0cch,066h,044h,003h,022h,004h,066h,02ah,040h,07dh,0ddh,0ffh	; 9973  ".f3.fD.".f*@}..
	defb 022h,09ch,066h,02ah,0cch,054h,044h,088h,022h,04ch,066h,02ah,0cch,044h,000h,051h	; 9983  ".f*.TD."Lf*.D.Q
	defb 022h,000h,066h,022h,0cch,044h,044h,080h,022h,0c8h,066h,03ah,0cch,074h,000h,020h	; 9993  ".f".DD.".f:.t.
	defb 023h,000h,067h,022h,0cdh,076h,045h,01ah,023h,00ch,066h,033h,0cch,075h,001h,068h	; 99a3  #.g".vE.#.f3.u.h
	defb 022h,0dch,066h,032h,0cch,054h,044h,018h,022h,00ch,066h,02ah,0cch,044h,000h,01fh	; 99b3  ".f2.TD.".f*.D..

; ----------------------------------------------------------------------
; DATOS dibujo_99C3: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 3 de la lista 0x880B (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (16 bytes)
;   0x99c3..0x99d3  (16 bytes)
DATA_dibujo_99C3:
	defb 0ffh,087h,0ffh,00fh,0ffh,01fh,0fdh,03fh,0fdh,07bh,0fdh,0f3h,0fdh,0e3h,0ffh,0c3h	; 99c3  .......?.{......

; ----------------------------------------------------------------------
; DATOS dibujo_99D3: 3 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 4 de la lista 0x880B (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (72 bytes)
;   0x99d3..0x9a1b  (72 bytes)
DATA_dibujo_99D3:
	defb 0f2h,0f2h,000h,066h,03bh,080h,0cch,077h,000h,044h,009h,0b2h,022h,004h,0d9h,066h,022h,099h,0cch,066h,011h,0ffh,000h,000h	; 99d3  ...f...w.D.."..f"..f....
	defb 0f3h,0f3h,000h,066h,0bah,001h,0cch,076h,001h,044h,028h,093h,022h,004h,0d9h,066h,022h,099h,0cch,064h,013h,0ffh,000h,000h	; 99eb  ...f...v.D(."..f"..d....
	defb 07fh,047h,0f8h,07fh,04fh,0f0h,07fh,05eh,0e1h,07fh,07ch,0c3h,07fh,038h,087h,07fh,030h,08fh,07fh,021h,09eh,07fh,003h,0bch	; 9a03  .G..O..^..|..8..0..!....

; ----------------------------------------------------------------------
; DATOS dibujo_9A1B: 2 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 5 de la lista 0x880B (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (48 bytes)
;   0x9a1b..0x9a4b  (48 bytes)
DATA_dibujo_9A1B:
	defb 021h,017h,0c8h,062h,022h,004h,0c5h,044h,008h,04ah,009h,010h,014h,010h,023h,02ah,022h,045h,056h,044h,089h,0beh,080h,001h	; 9a1b  !..b"..D.J....#*"EVD....
	defb 0ddh,001h,022h,0bah,022h,044h,075h,044h,088h,0eah,009h,010h,0d4h,010h,023h,0aah,022h,045h,056h,044h,089h,0beh,080h,001h	; 9a33  .."."DuD......#."EVD....

; ----------------------------------------------------------------------
; DATOS dibujo_9A4B: 2 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 6 de la lista 0x880B (p00:4D92, p00:4DF5); lo leen p00:4C0C (16
;   bytes)
;   0x9a4b..0x9a5b  (16 bytes)
DATA_dibujo_9A4B:
	defb 0ffh,07fh,07fh,07fh,07fh,07fh,07fh,07fh	; 9a4b  ........
	defb 07fh,07fh,07fh,07fh,07fh,07fh,07fh,07fh	; 9a53  ........

; ----------------------------------------------------------------------
; DATOS dibujo_9A5B: 12 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 7 de la lista 0x880B (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (192 bytes)
;   0x9a5b..0x9b1b  (192 bytes)
DATA_dibujo_9A5B:
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0fdh,002h,0f8h,002h,0fah,002h	; 9a5b  ................
	defb 0fah,007h,0fah,007h,0fah,007h,0fah,007h,0fah,007h,0fah,007h,0fbh,007h,0fbh,007h	; 9a6b  ................
	defb 07fh,000h,07fh,000h,07fh,018h,07fh,038h,047h,070h,08fh,0e0h,01fh,0c0h,03fh,080h	; 9a7b  .......8Gp....?.
	defb 0fah,007h,0f2h,00fh,0e2h,017h,0c2h,027h,0cah,007h,0fah,007h,0fah,007h,0fah,007h	; 9a8b  .......'........
	defb 0fah,007h,0f2h,00fh,0e2h,017h,0c2h,027h,0cah,007h,0fah,007h,0fbh,007h,0fbh,007h	; 9a9b  .......'........
	defb 0fah,007h,0fah,007h,0fah,007h,0fah,007h,0fah,007h,0fah,007h,0fah,007h,0fah,007h	; 9aab  ................
	defb 0fah,007h,0fah,007h,0f8h,003h,0feh,007h,0feh,007h,0f9h,006h,0ffh,000h,0fah,007h	; 9abb  ................
	defb 0fah,007h,0fah,007h,0fah,067h,0fah,077h,08ah,03bh,0c6h,01fh,0e2h,00fh,0f2h,007h	; 9acb  .....g.w........
	defb 0feh,003h,0fah,007h,0fah,007h,0fah,007h,0fah,007h,0fah,007h,0fah,007h,0fah,007h	; 9adb  ................
	defb 07fh,000h,03fh,040h,01fh,020h,00fh,010h,04fh,000h,07fh,000h,07fh,000h,07fh,000h	; 9aeb  ..?@. ..O.......
	defb 0fah,007h,0fah,007h,0fah,007h,0fah,007h,0fah,007h,0fah,007h,0fah,0ffh,002h,0ffh	; 9afb  ................
	defb 07fh,000h,07fh,000h,07fh,000h,07fh,000h,07fh,000h,07fh,000h,07eh,07fh,000h,07eh	; 9b0b  ............~..~

; ----------------------------------------------------------------------
; DATOS dibujo_9B1B: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 8 de la lista 0x880B (p00:4D92, p00:4DF5); lo leen p00:4C0C (8
;   bytes)
;   0x9b1b..0x9b23  (8 bytes)
DATA_dibujo_9B1B:
	defb 080h,080h,080h,080h,080h,080h,080h,080h	; 9b1b  ........

; ----------------------------------------------------------------------
; DATOS dibujo_9B23: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 9 de la lista 0x880B (p00:4D92, p00:4DF5); lo leen p00:4C0C (8
;   bytes)
;   0x9b23..0x9b2b  (8 bytes)
DATA_dibujo_9B23:
	defb 000h,000h,000h,000h,000h,000h,000h,000h	; 9b23  ........

; ----------------------------------------------------------------------
; DATOS dibujo_9B2B: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 10 de la lista 0x880B (p00:4D92, p00:4DF5); lo leen p00:4C0C (8
;   bytes)
;   0x9b2b..0x9b33  (8 bytes)
DATA_dibujo_9B2B:
	defb 000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9b2b  ........

; ----------------------------------------------------------------------
; DATOS dibujo_9B33: 9 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 11 de la lista 0x880B (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (144 bytes)
;   0x9b33..0x9bc3  (144 bytes)
DATA_dibujo_9B33:
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,000h,000h	; 9b33  ................
	defb 0ffh,000h,0b7h,048h,0fbh,004h,0afh,050h,0e7h,018h,0efh,010h,0c6h,039h,000h,000h	; 9b43  ...H...P.....9..
	defb 0bfh,040h,0d7h,028h,0f7h,008h,0e5h,01ah,0dbh,024h,0efh,010h,0dfh,020h,000h,000h	; 9b53  .@.(.....$... ..
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0dfh,020h,0efh,010h,0e6h,019h,09dh,062h,000h,000h	; 9b63  ....... .....b..
	defb 0ffh,000h,0ffh,018h,0ffh,03ch,0dbh,03ch,0e7h,018h,0ffh,000h,0ffh,000h,0ffh,000h	; 9b73  .....<.<........
	defb 0ffh,000h,0ffh,000h,0ffh,000h,000h,0ffh,0ffh,0ffh,0ffh,000h,000h,0ffh,0ffh,0ffh	; 9b83  ................
	defb 0d7h,03ch,0d7h,03ch,0d7h,03ch,0d7h,03ch,0d7h,03ch,0d7h,03ch,0ffh,03ch,0ffh,000h	; 9b93  .<.<.<.<.<.<.<..
	defb 0d7h,03ch,0d7h,03ch,0d7h,03ch,0d7h,03ch,0d7h,03ch,0d7h,03ch,0ffh,03ch,000h,000h	; 9ba3  .<.<.<.<.<.<.<..
	defb 07fh,081h,07fh,081h,0ffh,0ffh,0ffh,07eh,0bfh,042h,0bfh,042h,0ffh,03ch,0d7h,03ch	; 9bb3  .......~.B.B.<.<

; ----------------------------------------------------------------------
; DATOS dibujo_9BC3: 3 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 12 de la lista 0x880B (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (48 bytes)
;   0x9bc3..0x9bf3  (48 bytes)
DATA_dibujo_9BC3:
	defb 002h,000h,002h,000h,002h,000h,002h,000h,001h,000h,001h,000h,001h,000h,001h,000h	; 9bc3  ................
	defb 000h,003h,001h,003h,001h,003h,001h,003h,001h,003h,001h,003h,001h,003h,001h,003h	; 9bd3  ................
	defb 000h,0ffh,0ffh,0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 9be3  ................

; ----------------------------------------------------------------------
; DATOS dibujo_9BF3: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 13 de la lista 0x880B (p00:4D92, p00:4DF5); lo leen p00:4C0C (8
;   bytes)
;   0x9bf3..0x9bfb  (8 bytes)
DATA_dibujo_9BF3:
	defb 000h,000h,000h,000h,000h,000h,000h,000h	; 9bf3  ........

; ----------------------------------------------------------------------
; DATOS dibujo_9BFB: 6 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 14 de la lista 0x880B (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (96 bytes)
;   0x9bfb..0x9c5b  (96 bytes)
DATA_dibujo_9BFB:
	defb 097h,017h,097h,017h,097h,017h,097h,017h,097h,017h,097h,017h,097h,017h,097h,017h	; 9bfb  ................
	defb 097h,017h,097h,017h,097h,017h,090h,010h,09fh,01fh,080h,000h,080h,000h,0ffh,000h	; 9c0b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,000h,000h,0ffh,000h	; 9c1b  ................
	defb 0e9h,0e8h,0e9h,0e8h,0e9h,0e8h,009h,008h,0f9h,0f8h,001h,000h,001h,000h,0ffh,000h	; 9c2b  ................
	defb 0e9h,0e8h,0e9h,0e8h,0e9h,0e8h,0e9h,0e8h,0e9h,0e8h,0e9h,0e8h,0e9h,0e8h,0e9h,0e8h	; 9c3b  ................
	defb 000h,0ffh,000h,000h,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9c4b  ................

; ----------------------------------------------------------------------
; DATOS dibujo_9C5B: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 15 de la lista 0x880B (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (32 bytes)
;   0x9c5b..0x9c7b  (32 bytes)
DATA_dibujo_9C5B:
	defb 080h,000h,080h,000h,080h,002h,082h,002h,080h,000h,080h,000h,080h,000h,080h,000h	; 9c5b  ................
	defb 081h,001h,081h,001h,081h,001h,081h,001h,080h,000h,080h,000h,080h,000h,080h,000h	; 9c6b  ................

; ----------------------------------------------------------------------
; DATOS dibujo_9C7B: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 16 de la lista 0x880B (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (16 bytes)
;   0x9c7b..0x9c8b  (16 bytes)
DATA_dibujo_9C7B:
	defb 0d1h,0ceh,0ceh,0d1h,0ddh,0c2h,0dfh,0c0h,03eh,001h,01bh,004h,0f3h,00ch,000h,000h	; 9c7b  ........>.......

; ----------------------------------------------------------------------
; DATOS dibujo_9C8B: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 17 de la lista 0x880B (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (16 bytes)
;   0x9c8b..0x9c9b  (16 bytes)
DATA_dibujo_9C8B:
	defb 080h,000h,080h,000h,0c0h,040h,0c0h,040h,0a0h,060h,0a0h,060h,090h,070h,090h,070h	; 9c8b  .....@.@.`.`.p.p

; ----------------------------------------------------------------------
; DATOS dibujo_9C9B: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 18 de la lista 0x880B (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (16 bytes)
;   0x9c9b..0x9cab  (16 bytes)
DATA_dibujo_9C9B:
	defb 05fh,0c0h,05fh,0c0h,05fh,0c0h,05fh,0c0h,06fh,0e0h,06fh,0e0h,06fh,0e0h,06fh,0e0h	; 9c9b  _._._._.o.o.o.o.

; ----------------------------------------------------------------------
; DATOS dibujo_9CAB: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 19 de la lista 0x880B (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (16 bytes)
;   0x9cab..0x9cbb  (16 bytes)
DATA_dibujo_9CAB:
	defb 081h,07fh,081h,07fh,081h,07fh,081h,07fh,081h,07fh,081h,07fh,081h,07fh,081h,07fh	; 9cab  ................

; ----------------------------------------------------------------------
; DATOS dibujo_9CBB: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 20 de la lista 0x880B (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (16 bytes)
;   0x9cbb..0x9ccb  (16 bytes)
DATA_dibujo_9CBB:
	defb 0ffh,0ffh,0ffh,001h,0f7h,009h,0f7h,001h,0ffh,001h,0ffh,001h,0ffh,001h,0ffh,001h	; 9cbb  ................

; ----------------------------------------------------------------------
; DATOS dibujo_9CCB: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 21 de la lista 0x880B (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (16 bytes)
;   0x9ccb..0x9cdb  (16 bytes)
DATA_dibujo_9CCB:
	defb 05fh,0c0h,0dfh,0c0h,0dfh,0c0h,0dfh,0c0h,0dfh,0c0h,0dfh,0c0h,0dfh,0c0h,0dfh,0c0h	; 9ccb  _...............

; ----------------------------------------------------------------------
; DATOS dibujo_9CDB: 17 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 22 de la lista 0x880B (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (408 bytes)
;   0x9cdb..0x9e73  (408 bytes)
DATA_dibujo_9CDB:
	defb 0ffh,0ffh,000h,0fch,000h,001h,0f5h,008h,001h,0f5h,000h,001h,0f9h,000h,003h,0f9h,000h,003h,0f9h,000h,003h,0f9h,000h,003h	; 9cdb  ........................
	defb 0f1h,002h,005h,0f1h,002h,005h,0f1h,002h,005h,0f1h,002h,005h,0e1h,006h,009h,0e1h,006h,009h,0e1h,006h,009h,0e1h,006h,009h	; 9cf3  ........................
	defb 0c1h,00eh,011h,0c1h,00eh,011h,0c1h,00eh,011h,0c1h,00eh,011h,081h,01eh,021h,081h,01eh,021h,081h,01eh,021h,081h,01eh,021h	; 9d0b  ..............!..!..!..!
	defb 001h,03eh,041h,001h,03eh,041h,001h,03eh,041h,001h,03eh,041h,001h,07eh,081h,001h,07eh,081h,001h,07eh,081h,001h,07eh,081h	; 9d23  .>A.>A.>A.>A.~..~..~..~.
	defb 015h,00ah,0d5h,015h,00ah,0d1h,001h,01eh,081h,001h,01eh,081h,021h,01eh,0a1h,021h,01eh,0a1h,081h,03eh,001h,001h,03eh,001h	; 9d3b  ............!..!...>..>.
	defb 041h,03eh,081h,041h,03eh,0c1h,001h,07eh,081h,001h,07eh,081h,001h,07eh,001h,001h,07eh,001h,0c1h,03eh,041h,0c1h,03eh,041h	; 9d53  A>.A>..~..~..~..~..>A.>A
	defb 005h,07ah,085h,005h,07ah,081h,001h,07eh,081h,001h,07eh,081h,001h,07eh,081h,000h,07ch,083h,000h,078h,084h,000h,078h,084h	; 9d6b  .z..z..~..~..~..|..x..x.
	defb 001h,078h,085h,001h,078h,085h,001h,070h,089h,001h,070h,089h,003h,070h,08bh,003h,070h,08bh,001h,062h,091h,001h,062h,091h	; 9d83  .x..x..p..p..p..p..b..b.
	defb 005h,062h,095h,005h,062h,095h,041h,006h,0e1h,041h,006h,0a1h,009h,046h,0a9h,009h,046h,0a9h,001h,00eh,0c1h,001h,00eh,0c1h	; 9d9b  .b..b.A..A...F..F.......
	defb 0ffh,0ffh,000h,0bfh,040h,000h,0afh,010h,040h,0afh,000h,040h,0bfh,000h,040h,0bfh,000h,040h,0bfh,000h,040h,0ffh,000h,000h	; 9db3  ....@...@..@..@..@..@...
	defb 0feh,001h,003h,0beh,001h,043h,0feh,001h,003h,0d4h,003h,02bh,0fch,000h,000h,0eah,000h,014h,093h,000h,06ch,000h,000h,000h	; 9dcb  .....C.....+........l...
	defb 0ffh,000h,000h,0c3h,022h,01ch,0e3h,012h,02ch,05eh,062h,081h,0dfh,0c3h,020h,0dfh,002h,020h,05eh,042h,0a1h,0ffh,0ffh,000h	; 9de3  ...."...,^b... .. ^B....
	defb 0dfh,05fh,020h,0d5h,040h,03fh,0eah,040h,015h,0ffh,027h,000h,0e7h,064h,018h,0c0h,055h,02ah,0ffh,03fh,000h,0c0h,000h,000h	; 9dfb  ._ .@?.@..'..d..U*.?....
	defb 0ffh,0ffh,000h,055h,000h,0ffh,0aah,000h,055h,0ffh,0e7h,000h,0e7h,024h,018h,000h,055h,0aah,0ffh,0ffh,000h,000h,000h,000h	; 9e13  ...U....U....$..U.......
	defb 0ffh,0ffh,000h,055h,000h,0ffh,0aah,000h,055h,0ffh,0e7h,000h,0e7h,024h,018h,000h,055h,0aah,0ffh,0ffh,000h,001h,001h,000h	; 9e2b  ...U....U....$..U.......
	defb 0ffh,0ffh,000h,055h,000h,0ffh,0aah,000h,055h,0ffh,0e7h,000h,0e7h,024h,018h,000h,055h,0aah,0ffh,0ffh,000h,040h,000h,000h	; 9e43  ...U....U....$..U....@..
	defb 0fdh,0fdh,002h,055h,001h,0feh,0abh,001h,054h,0ffh,0e7h,000h,0e5h,025h,01ah,001h,055h,0aah,0feh,0feh,000h,000h,000h,000h	; 9e5b  ...U....T....%..U.......

; ----------------------------------------------------------------------
; DATOS dibujo_9E73: 8 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 23 de la lista 0x880B (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (192 bytes)
;   0x9e73..0x9f33  (192 bytes)
DATA_dibujo_9E73:
	defb 0ffh,0ffh,000h,080h,000h,07fh,090h,000h,07fh,080h,000h,06fh,080h,040h,07fh,080h,040h,07fh,080h,040h,07fh,080h,040h,07fh	; 9e73  ...........o.@..@..@..@.
	defb 0c0h,078h,00fh,0c0h,078h,00fh,0c0h,078h,00fh,0c0h,078h,00fh,0a0h,03ch,007h,0a0h,03ch,007h,0a0h,03ch,007h,0a0h,03ch,007h	; 9e8b  .x..x..x..x..<..<..<..<.
	defb 090h,01eh,003h,090h,01eh,003h,090h,01eh,003h,090h,01eh,003h,088h,00fh,001h,088h,00fh,001h,088h,00fh,001h,088h,00fh,001h	; 9ea3  ........................
	defb 084h,007h,001h,084h,007h,001h,084h,007h,001h,084h,007h,001h,082h,003h,001h,082h,003h,001h,082h,003h,001h,082h,003h,001h	; 9ebb  ........................
	defb 090h,010h,010h,090h,010h,000h,080h,000h,000h,080h,000h,000h,0c0h,040h,020h,0c0h,040h,020h,0c0h,040h,020h,0c0h,040h,020h	; 9ed3  .............@ .@ .@ .@
	defb 0a0h,020h,010h,0a0h,020h,010h,0a0h,020h,010h,0a0h,020h,010h,092h,012h,00ah,092h,012h,008h,090h,010h,008h,090h,010h,008h	; 9eeb  . .. .. .. .............
	defb 088h,008h,004h,088h,008h,004h,088h,008h,004h,088h,008h,004h,084h,004h,002h,084h,004h,002h,094h,014h,012h,094h,014h,002h	; 9f03  ........................
	defb 0ffh,0ffh,000h,0ffh,0ffh,000h,0ffh,000h,000h,0ffh,0f3h,0f3h,000h,000h,000h,000h,000h,000h,000h,02ch,0d3h,000h,028h,028h	; 9f1b  ...................,..((

; ----------------------------------------------------------------------
; DATOS dibujo_9F33: 3 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 24 de la lista 0x880B (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (72 bytes)
;   0x9f33..0x9f7b  (72 bytes)
DATA_dibujo_9F33:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,087h,0cfh,0ffh,003h,08fh,0b7h,043h,08bh,0b7h,047h,08bh,0b7h,0c7h,089h,0b7h,0c7h,089h,087h,0f7h	; 9f33  ...........C..G.........
	defb 088h,097h,0e7h,088h,097h,0e7h,088h,097h,0e7h,00ch,013h,0e3h,004h,01bh,0e3h,088h,087h,0f7h,0f8h,087h,087h,008h,0b7h,0c7h	; 9f4b  ........................
	defb 08fh,0b7h,040h,08fh,0b7h,040h,0cfh,016h,020h,0ffh,00ch,000h,0ffh,078h,000h,0ffh,0f0h,000h,0ffh,0e1h,000h,0ffh,0ffh,0ffh	; 9f63  ..@..@.. ....x..........

; ----------------------------------------------------------------------
; DATOS dibujo_9F7B: 1 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 25 de la lista 0x880B (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (24 bytes)
;   0x9f7b..0x9f93  (24 bytes)
DATA_dibujo_9F7B:
	defb 000h,000h,0ffh,07fh,080h,000h,0bfh,0c1h,001h,001h,081h,07fh,081h,001h,07fh,0a9h,001h,07fh,081h,029h,07fh,081h,001h,07fh	; 9f7b  ...................)....

; ----------------------------------------------------------------------
; DATOS dibujo_9F93: 2 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 26 de la lista 0x880B (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (48 bytes)
;   0x9f93..0x9fc3  (48 bytes)
DATA_dibujo_9F93:
	defb 0ffh,00fh,0f0h,008h,01fh,0e7h,00bh,01ch,0e7h,08bh,09ch,067h,088h,09fh,067h,08bh,09ch,067h,088h,09fh,067h,08fh,09fh,060h	; 9f93  ...........g..g..g..g..`
	defb 0ffh,0f0h,00fh,010h,0f8h,0e7h,0d0h,038h,0e7h,0d1h,039h,0e6h,011h,0f9h,0e6h,0d1h,039h,0e6h,011h,0f9h,0e6h,0f1h,0f9h,006h	; 9fab  .......8..9.....9.......

; ----------------------------------------------------------------------
; DATOS dibujo_9FC3: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 27 de la lista 0x880B (p00:4D92, p00:4DF5); lo leen p00:4C0C (8
;   bytes)
;   0x9fc3..0x9fcb  (8 bytes)
DATA_dibujo_9FC3:
	defb 0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh	; 9fc3  ........

; ----------------------------------------------------------------------
; DATOS dibujo_9FCB: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 28 de la lista 0x880B (p00:4D92, p00:4DF5); lo leen p00:4C0C (8
;   bytes)
;   0x9fcb..0x9fd3  (8 bytes)
DATA_dibujo_9FCB:
	defb 040h,040h,040h,040h,040h,040h,040h,040h	; 9fcb  @@@@@@@@

; ----------------------------------------------------------------------
; DATOS dibujo_9FD3: 3 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 29 de la lista 0x880B (p00:4D92, p00:4DF5) (sigue en el banco
;   43, en 0xA000); lo leen p00:4C0C (45 bytes)
;   0x9fd3..0xa000  (45 bytes)
DATA_dibujo_9FD3:
	defb 0ffh,001h,0ffh,001h,0ffh,001h,0ffh,001h,0ffh,001h,0f7h,009h,0f7h,001h,001h,001h	; 9fd3  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0feh,000h,0fah,004h,0fah,000h,000h,000h	; 9fe3  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0dfh,020h,0dfh	; 9ff3  ........... .
