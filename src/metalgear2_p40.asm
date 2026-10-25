; ==========================================================================
; METAL GEAR 2 SOLID SNAKE - Konami (1990) - MSX2 - MegaROM RC-767 de 512 KB (Konami SCC) - banco 40 (se ejecuta en 0x8000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x08000


; ----------------------------------------------------------------------
; DATOS lista_8000: 35 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x0000); lo leen p00:4C0C, p00:4C26 (176 bytes)
;   0x8000..0x80b0  (176 bytes)
DATA_lista_8000:
	defb 046h,03eh,001h,05eh,081h	; 8000
	defb 044h,025h,007h,0beh,081h	; 8005
	defb 045h,003h,00bh,0feh,081h	; 800a
	defb 043h,03eh,011h,04eh,082h	; 800f
	defb 081h,013h,017h,07eh,082h	; 8014
	defb 042h,003h,018h,096h,082h	; 8019
	defb 042h,013h,01ah,0b6h,082h	; 801e
	defb 041h,008h,021h,0d6h,082h	; 8023
	defb 082h,008h,022h,0e6h,082h	; 8028
	defb 044h,012h,026h,016h,083h	; 802d
	defb 081h,013h,02ah,056h,083h	; 8032
	defb 043h,00ah,02bh,06eh,083h	; 8037
	defb 041h,008h,02eh,09eh,083h	; 803c
	defb 081h,008h,02fh,0aeh,083h	; 8041
	defb 04eh,005h,030h,0c6h,083h	; 8046
	defb 083h,008h,03eh,0a6h,084h	; 804b
	defb 041h,000h,041h,0eeh,084h	; 8050
	defb 083h,013h,043h,0feh,084h	; 8055
	defb 042h,002h,046h,046h,085h	; 805a
	defb 086h,013h,048h,066h,085h	; 805f
	defb 086h,013h,050h,0f6h,085h	; 8064
	defb 082h,003h,056h,086h,086h	; 8069
	defb 083h,025h,058h,0b6h,086h	; 806e
	defb 085h,00ah,05bh,0feh,086h	; 8073
	defb 044h,020h,060h,076h,087h	; 8078
	defb 087h,005h,064h,0b6h,087h	; 807d
	defb 002h,014h,06bh,05eh,088h	; 8082
	defb 002h,015h,06dh,06eh,088h	; 8087
	defb 001h,016h,06fh,07eh,088h	; 808c
	defb 005h,003h,070h,086h,088h	; 8091
	defb 047h,032h,075h,0aeh,088h	; 8096
	defb 081h,008h,07ch,01eh,089h	; 809b
	defb 041h,00bh,07dh,036h,089h	; 80a0
	defb 082h,002h,07eh,046h,089h	; 80a5
	defb 041h,000h,04eh,076h,089h	; 80aa
	defb 0ffh	; 80af

; ----------------------------------------------------------------------
; DATOS sin identificar  0x80b0..0x80b6  (6 bytes)
DATA_80B0:
	defb 001h,003h,020h,086h,089h,0ffh	; 80b0

; ----------------------------------------------------------------------
; DATOS lista_80B6: 24 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x0000); lo leen p00:4C0C, p00:4C26 (121 bytes)
;   0x80b6..0x812f  (121 bytes)
DATA_lista_80B6:
	defb 005h,019h,081h,08eh,089h	; 80b6
	defb 001h,01ah,087h,0b6h,089h	; 80bb
	defb 044h,032h,08ch,0beh,089h	; 80c0
	defb 043h,01ch,090h,0feh,089h	; 80c5
	defb 041h,028h,09dh,02eh,08ah	; 80ca
	defb 042h,01fh,09eh,03eh,08ah	; 80cf
	defb 043h,003h,0a3h,05eh,08ah	; 80d4
	defb 043h,00bh,0a6h,08eh,08ah	; 80d9
	defb 041h,010h,0aah,0beh,08ah	; 80de
	defb 082h,016h,0b0h,0ceh,08ah	; 80e3
	defb 081h,002h,0b2h,0feh,08ah	; 80e8
	defb 042h,003h,0b4h,016h,08bh	; 80ed
	defb 084h,00eh,0b6h,036h,08bh	; 80f2
	defb 041h,019h,0bah,096h,08bh	; 80f7
	defb 081h,008h,0bbh,0a6h,08bh	; 80fc
	defb 084h,002h,0bch,0bdh,08bh	; 8101
	defb 08fh,002h,0c0h,01dh,08ch	; 8106
	defb 082h,00ch,0d0h,085h,08dh	; 810b
	defb 084h,00fh,0d2h,0b5h,08dh	; 8110
	defb 082h,013h,0dah,015h,08eh	; 8115
	defb 085h,013h,0e0h,045h,08eh	; 811a
	defb 082h,020h,0e5h,0bdh,08eh	; 811f
	defb 081h,011h,0e7h,0edh,08eh	; 8124
	defb 082h,002h,0e8h,005h,08fh	; 8129
	defb 0ffh	; 812e

; ----------------------------------------------------------------------
; DATOS lista_812F: 1 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x6433); lo leen p00:4C26 (6 bytes)
;   0x812f..0x8135  (6 bytes)
DATA_lista_812F:
	defb 085h,014h,06bh,0feh,086h	; 812f
	defb 0ffh	; 8134

; ----------------------------------------------------------------------
; DATOS sin identificar  0x8135..0x815e  (41 bytes)
DATA_8135:
	defb 003h,00ch,001h,05eh,081h,001h,015h,004h,0beh,081h,003h,014h,005h,0feh,081h,043h	; 8135  ...^...........C
	defb 014h,008h,04eh,082h,043h,000h,00ch,07eh,082h,041h,015h,00fh,096h,082h,04ah,016h	; 8145  ..N.C..~.A....J.
	defb 010h,0b6h,082h,046h,017h,01ah,0d6h,082h,0ffh	; 8155  ...F.....

; ----------------------------------------------------------------------
; DATOS dibujo_815E: 6 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 0 de la lista 0x8000 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (96 bytes)
;   0x815e..0x81be  (96 bytes)
DATA_dibujo_815E:
	defb 000h,0feh,07eh,080h,07eh,080h,000h,000h,000h,0feh,07eh,080h,07eh,080h,000h,000h	; 815e  ..~.~.....~.~...
	defb 0ffh,001h,081h,001h,081h,001h,0ffh,0ffh,000h,0feh,0feh,000h,0ffh,07fh,0ffh,0ffh	; 816e  ................
	defb 0ffh,001h,001h,081h,041h,081h,01fh,01fh,00fh,0f1h,079h,081h,07dh,081h,001h,001h	; 817e  ....A.....y.}...
	defb 0ffh,001h,081h,001h,081h,001h,0ffh,0ffh,0ffh,001h,081h,001h,081h,001h,0ffh,0ffh	; 818e  ................
	defb 010h,0eeh,04eh,090h,01eh,0a0h,0bdh,041h,078h,082h,072h,084h,066h,088h,011h,011h	; 819e  ..N....Ax.r.f...
	defb 0efh,001h,0b1h,021h,0e1h,041h,043h,003h,087h,005h,08dh,009h,099h,011h,0ffh,0ffh	; 81ae  ...!.AC.........

; ----------------------------------------------------------------------
; DATOS dibujo_81BE: 4 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 1 de la lista 0x8000 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (64 bytes)
;   0x81be..0x81fe  (64 bytes)
DATA_dibujo_81BE:
	defb 0efh,077h,088h,0eeh,088h,0eeh,088h,0eeh,088h,0eeh,088h,0eeh,088h,0eeh,088h,0eeh	; 81be  .w..............
	defb 080h,0e8h,08eh,0e6h,088h,0eeh,088h,0eeh,088h,0eeh,088h,0eeh,088h,0eeh,088h,0eeh	; 81ce  ................
	defb 088h,0eeh,088h,0eeh,088h,0eeh,088h,0eeh,088h,0eeh,088h,0eeh,088h,0eeh,088h,0eeh	; 81de  ................
	defb 088h,0eeh,088h,0eeh,088h,0eeh,088h,0eeh,088h,0eeh,088h,0eeh,008h,08eh,0e8h,06eh	; 81ee  ...............n

; ----------------------------------------------------------------------
; DATOS dibujo_81FE: 5 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 2 de la lista 0x8000 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (80 bytes)
;   0x81fe..0x824e  (80 bytes)
DATA_dibujo_81FE:
	defb 017h,068h,019h,068h,011h,066h,011h,066h,011h,066h,011h,066h,011h,066h,011h,066h	; 81fe  .h.h.f.f.f.f.f.f
	defb 011h,066h,011h,066h,011h,066h,011h,066h,011h,066h,011h,066h,011h,066h,011h,066h	; 820e  .f.f.f.f.f.f.f.f
	defb 011h,066h,091h,0e6h,091h,0a6h,091h,086h,081h,096h,089h,09eh,089h,09ah,089h,098h	; 821e  .f..............
	defb 008h,099h,008h,059h,008h,079h,018h,069h,010h,061h,010h,065h,010h,067h,011h,066h	; 822e  ...Y.y.i.a.e.g.f
	defb 011h,066h,011h,066h,011h,066h,011h,066h,011h,066h,011h,066h,071h,086h,091h,086h	; 823e  .f.f.f.f.f.fq...

; ----------------------------------------------------------------------
; DATOS dibujo_824E: 3 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 3 de la lista 0x8000 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (48 bytes)
;   0x824e..0x827e  (48 bytes)
DATA_dibujo_824E:
	defb 0efh,001h,011h,081h,021h,081h,0a3h,043h,075h,087h,075h,081h,065h,089h,011h,011h	; 824e  ....!..Cu.u.e...
	defb 090h,06eh,02eh,010h,03eh,000h,0cfh,083h,004h,006h,00eh,008h,018h,010h,0ffh,0ffh	; 825e  .n..>...........
	defb 000h,0feh,03eh,080h,01eh,080h,0f0h,0f0h,0f8h,006h,082h,000h,080h,000h,0ffh,0ffh	; 826e  ..>.............

; ----------------------------------------------------------------------
; DATOS dibujo_827E: 1 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 4 de la lista 0x8000 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (24 bytes)
;   0x827e..0x8296  (24 bytes)
DATA_dibujo_827E:
	defb 000h,000h,000h,080h,000h,022h,080h,022h,066h,0a0h,044h,044h,0f0h,000h,000h,0f8h,040h,004h,0b8h,024h,006h,0dch,002h,002h	; 827e  ....."."f.DD....@..$....

; ----------------------------------------------------------------------
; DATOS dibujo_8296: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 5 de la lista 0x8000 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (32 bytes)
;   0x8296..0x82b6  (32 bytes)
DATA_dibujo_8296:
	defb 000h,0ffh,000h,0ddh,022h,099h,044h,0bbh,000h,0ffh,000h,0bbh,044h,099h,022h,0ddh	; 8296  ....".D.....D.".
	defb 000h,0ffh,000h,0bbh,044h,099h,022h,0ddh,000h,0ffh,000h,0ddh,022h,099h,044h,0bbh	; 82a6  ....D.".....".D.

; ----------------------------------------------------------------------
; DATOS dibujo_82B6: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 6 de la lista 0x8000 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (32 bytes)
;   0x82b6..0x82d6  (32 bytes)
DATA_dibujo_82B6:
	defb 0ffh,000h,0ffh,022h,0ddh,044h,0bbh,000h,0ffh,000h,0ffh,044h,0bbh,022h,0ddh,000h	; 82b6  ...".D.....D."..
	defb 0ffh,000h,0ffh,044h,0bbh,022h,0ddh,000h,0ffh,000h,0ffh,022h,0ddh,044h,0bbh,000h	; 82c6  ...D.".....".D..

; ----------------------------------------------------------------------
; DATOS dibujo_82D6: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 7 de la lista 0x8000 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (16 bytes)
;   0x82d6..0x82e6  (16 bytes)
DATA_dibujo_82D6:
	defb 008h,06eh,008h,0aeh,088h,04eh,0a8h,02eh,090h,036h,098h,02ah,094h,024h,092h,026h	; 82d6  .n...N...6.*.$.&

; ----------------------------------------------------------------------
; DATOS dibujo_82E6: 2 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 8 de la lista 0x8000 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (48 bytes)
;   0x82e6..0x8316  (48 bytes)
DATA_dibujo_82E6:
	defb 07fh,000h,000h,01dh,080h,022h,099h,040h,004h,0abh,020h,000h,097h,030h,000h,09bh,028h,000h,095h,024h,000h,092h,026h,000h	; 82e6  .....".@.. ..0..(..$..&.
	defb 0feh,000h,000h,0b8h,000h,045h,099h,000h,023h,0d3h,002h,005h,0e7h,002h,00dh,0cfh,002h,01dh,09fh,012h,02dh,03fh,012h,06dh	; 82fe  .....E..#...........-?.m

; ----------------------------------------------------------------------
; DATOS dibujo_8316: 4 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 9 de la lista 0x8000 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (64 bytes)
;   0x8316..0x8356  (64 bytes)
DATA_dibujo_8316:
	defb 0ffh,000h,080h,07fh,0ffh,07fh,0ffh,000h,0ffh,07fh,09ah,01ah,0aah,02ah,0aah,02ah	; 8316  .............*.*
	defb 0ffh,000h,001h,0feh,0ffh,0feh,0ffh,000h,0ffh,0feh,0d1h,0d0h,0bbh,0bah,09bh,09ah	; 8326  ................
	defb 0aah,02ah,09dh,01dh,0ffh,07fh,0ffh,07fh,0f8h,078h,0fch,07ch,0feh,07eh,0ffh,07fh	; 8336  .*.......x.|.~..
	defb 0dbh,0dah,0bbh,0bah,0ffh,0feh,0ffh,0feh,01fh,01eh,03fh,03eh,07fh,07eh,0ffh,0feh	; 8346  ..........?>.~..

; ----------------------------------------------------------------------
; DATOS dibujo_8356: 1 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 10 de la lista 0x8000 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (24 bytes)
;   0x8356..0x836e  (24 bytes)
DATA_dibujo_8356:
	defb 010h,06eh,000h,00eh,010h,080h,09eh,000h,040h,08ch,021h,001h,080h,012h,020h,092h,008h,020h,090h,004h,020h,090h,002h,024h	; 8356  .n......@.!... .. .. ..$

; ----------------------------------------------------------------------
; DATOS dibujo_836E: 3 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 11 de la lista 0x8000 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (48 bytes)
;   0x836e..0x839e  (48 bytes)
DATA_dibujo_836E:
	defb 000h,0ffh,0ffh,000h,0ffh,000h,0e3h,01ah,0c1h,03dh,0c1h,03dh,0c5h,039h,0cdh,031h	; 836e  .........=.=.9.1
	defb 0cdh,031h,0cdh,031h,08dh,031h,083h,041h,09fh,061h,08dh,031h,0c1h,001h,0ddh,021h	; 837e  .1.1.1.A.a.1...!
	defb 0cdh,031h,0cdh,031h,0cdh,031h,0cdh,031h,0edh,011h,0dbh,003h,0e7h,007h,0ffh,0ffh	; 838e  .1.1.1.1........

; ----------------------------------------------------------------------
; DATOS dibujo_839E: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 12 de la lista 0x8000 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (16 bytes)
;   0x839e..0x83ae  (16 bytes)
DATA_dibujo_839E:
	defb 07eh,07eh,03eh,080h,09eh,040h,0a0h,020h,096h,036h,09ah,028h,094h,024h,092h,026h	; 839e  ~~>..@. .6.(.$.&

; ----------------------------------------------------------------------
; DATOS dibujo_83AE: 1 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 13 de la lista 0x8000 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (24 bytes)
;   0x83ae..0x83c6  (24 bytes)
DATA_dibujo_83AE:
	defb 0feh,0feh,000h,0fch,080h,001h,0f9h,080h,003h,003h,002h,005h,0e7h,0e2h,00dh,0cfh,082h,01dh,09fh,092h,02dh,03fh,012h,06dh	; 83ae  ....................-?.m

; ----------------------------------------------------------------------
; DATOS dibujo_83C6: 14 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 14 de la lista 0x8000 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (224 bytes)
;   0x83c6..0x84a6  (224 bytes)
DATA_dibujo_83C6:
	defb 0ffh,000h,000h,000h,07ch,07dh,07ch,07dh,000h,000h,000h,0fdh,07ch,07dh,07ch,07dh	; 83c6  ....|}|}....|}|}
	defb 0ffh,000h,000h,000h,0ffh,0ffh,0ffh,0ffh,000h,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh	; 83d6  ................
	defb 000h,000h,000h,0fdh,07ch,07dh,07ch,07dh,000h,000h,000h,0fdh,07ch,07dh,07ch,07dh	; 83e6  ....|}|}....|}|}
	defb 000h,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh	; 83f6  ................
	defb 07fh,0d2h,07fh,0d2h,07fh,0d2h,07fh,0d2h,07fh,0d2h,07fh,0d2h,07fh,0d2h,07fh,0d2h	; 8406  ................
	defb 07fh,0d2h,07fh,0d2h,07eh,0d2h,07eh,0d2h,07ch,0d0h,07fh,0d1h,07dh,0d1h,07dh,0d1h	; 8416  ....~.~.|...}.}.
	defb 07ch,0d0h,07ch,0d3h,07bh,0d3h,07bh,0d3h,070h,0d0h,078h,0d7h,077h,0d7h,077h,0d7h	; 8426  |.|.{.{.p.x.w.w.
	defb 060h,0c0h,070h,0cfh,06fh,0cfh,06fh,0cfh,060h,0c0h,060h,0dfh,05fh,0dfh,05fh,0dfh	; 8436  `.p.o.o.`.`._._.
	defb 03eh,06ah,03eh,06bh,03eh,06bh,03eh,06bh,03dh,06ah,03dh,06ah,03dh,06ah,03dh,06ah	; 8446  >j>k>k>k=j=j=j=j
	defb 03bh,06ah,03bh,06eh,03bh,06eh,03bh,06eh,037h,06ah,037h,06ah,037h,06ah,037h,06ah	; 8456  .j.n.n.n7j7j7j7j
	defb 02fh,06ah,02fh,07ah,02fh,07ah,02fh,07ah,01fh,06ah,01fh,06ah,01fh,06ah,01fh,06ah	; 8466  /j/z/z/z.j.j.j.j
	defb 0feh,000h,001h,001h,03eh,07fh,03eh,07fh,000h,000h,001h,07eh,03dh,07eh,03dh,07eh	; 8476  ....>.>....~=~=~
	defb 001h,000h,003h,07ch,03bh,07ch,03bh,07ch,003h,000h,007h,07ah,037h,07ah,037h,07ah	; 8486  ...|.|.|...z7z7z
	defb 007h,002h,02fh,072h,02fh,072h,02fh,072h,01fh,002h,01fh,062h,01fh,062h,01fh,062h	; 8496  ../r/r/r...b.b.b

; ----------------------------------------------------------------------
; DATOS dibujo_84A6: 3 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 15 de la lista 0x8000 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (72 bytes)
;   0x84a6..0x84ee  (72 bytes)
DATA_dibujo_84A6:
	defb 03fh,052h,0adh,03fh,052h,0adh,03fh,052h,0adh,03fh,052h,02dh,0ffh,052h,02dh,07fh,0d2h,02dh,07fh,0d2h,02dh,07fh,052h,02dh	; 84a6  ?R.?R.?R.?R-.R-..-..-.R-
	defb 0feh,0eeh,000h,0dch,090h,001h,0b9h,0a0h,003h,0f3h,040h,007h,0e7h,082h,00dh,0cfh,082h,01dh,09fh,08ah,035h,03fh,00ah,075h	; 84be  ..........@.........5?.u
	defb 000h,001h,0feh,001h,07eh,080h,03eh,07eh,080h,03eh,07eh,080h,000h,001h,0feh,001h,07eh,080h,03eh,07fh,080h,03dh,07eh,080h	; 84d6  ....~.>~.>~.....~.>..=~.

; ----------------------------------------------------------------------
; DATOS dibujo_84EE: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 16 de la lista 0x8000 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (16 bytes)
;   0x84ee..0x84fe  (16 bytes)
DATA_dibujo_84EE:
	defb 093h,025h,093h,025h,093h,025h,093h,025h,093h,025h,093h,025h,093h,025h,093h,025h	; 84ee  .%.%.%.%.%.%.%.%

; ----------------------------------------------------------------------
; DATOS dibujo_84FE: 3 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 17 de la lista 0x8000 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (72 bytes)
;   0x84fe..0x8546  (72 bytes)
DATA_dibujo_84FE:
	defb 0f2h,0e1h,005h,032h,021h,0c5h,032h,0e1h,005h,032h,0e1h,005h,0f2h,0f1h,005h,012h,011h,0e5h,012h,0f1h,005h,012h,0f1h,005h	; 84fe  ...2!.2..2..............
	defb 0fah,0f9h,005h,00ah,009h,0f5h,00ah,0f9h,005h,00ah,0f9h,005h,0feh,0fdh,001h,006h,005h,0f9h,006h,0fdh,001h,006h,0fdh,001h	; 8516  ........................
	defb 092h,081h,025h,092h,081h,025h,092h,081h,025h,092h,081h,025h,0d2h,0c1h,025h,052h,041h,0a5h,052h,0c1h,025h,052h,0c1h,025h	; 852e  ..%..%..%..%..%RA.R.%R.%

; ----------------------------------------------------------------------
; DATOS dibujo_8546: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 18 de la lista 0x8000 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (32 bytes)
;   0x8546..0x8566  (32 bytes)
DATA_dibujo_8546:
	defb 0a8h,089h,088h,089h,088h,089h,088h,089h,0a8h,089h,0a8h,0a9h,0a8h,0a9h,0a8h,0a9h	; 8546  ................
	defb 0a8h,0a1h,0a0h,0a1h,0a0h,0a1h,0a0h,0a1h,0a8h,0a1h,0a8h,0a9h,0a8h,0a9h,0a8h,0a9h	; 8556  ................

; ----------------------------------------------------------------------
; DATOS dibujo_8566: 6 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 19 de la lista 0x8000 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (144 bytes)
;   0x8566..0x85f6  (144 bytes)
DATA_dibujo_8566:
	defb 0ffh,03fh,000h,082h,002h,03dh,082h,03eh,001h,082h,03eh,001h,0bfh,01fh,000h,0a2h,002h,01dh,0a2h,00eh,011h,0a2h,00eh,011h	; 8566  .?...=.>..>.............
	defb 09fh,00fh,020h,092h,002h,02dh,092h,006h,021h,092h,006h,021h,097h,007h,020h,092h,002h,025h,092h,002h,025h,092h,002h,025h	; 857e  .. ..-..!..!.. ..%..%..%
	defb 096h,000h,021h,096h,000h,021h,096h,000h,021h,096h,000h,021h,092h,001h,025h,092h,001h,025h,092h,001h,025h,092h,001h,025h	; 8596  ..!..!..!..!..%..%..%..%
	defb 000h,0ffh,000h,000h,0ffh,000h,000h,000h,0ffh,000h,000h,000h,0ffh,000h,000h,052h,000h,0adh,040h,000h,0bfh,000h,0ffh,0ffh	; 85ae  ...............R..@.....
	defb 080h,0beh,040h,080h,0beh,040h,080h,080h,07eh,000h,000h,000h,0feh,000h,000h,06ch,000h,092h,004h,000h,0fah,000h,0ffh,0ffh	; 85c6  ..@..@..~......l........
	defb 002h,0ffh,001h,002h,0ffh,001h,002h,003h,0fdh,000h,001h,001h,0feh,001h,001h,0aah,001h,055h,002h,001h,0fdh,000h,0ffh,0ffh	; 85de  .................U......

; ----------------------------------------------------------------------
; DATOS dibujo_85F6: 6 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 20 de la lista 0x8000 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (144 bytes)
;   0x85f6..0x8686  (144 bytes)
DATA_dibujo_85F6:
	defb 082h,0feh,001h,082h,0feh,001h,002h,002h,07dh,000h,000h,000h,07fh,000h,000h,02ah,000h,055h,008h,000h,077h,000h,07fh,07fh	; 85f6  ........}......*.U..w...
	defb 0feh,000h,0ffh,0ffh,0feh,000h,080h,0beh,040h,080h,0beh,040h,0feh,0feh,001h,081h,080h,07eh,080h,0beh,040h,080h,0beh,040h	; 860e  ........@..@.....~..@..@
	defb 040h,07fh,080h,040h,03fh,0c0h,000h,000h,0ffh,000h,000h,080h,0ffh,000h,000h,0d3h,000h,02ch,080h,000h,07fh,080h,07fh,07fh	; 8626  @..@?............,......
	defb 0feh,002h,0fch,080h,0feh,000h,080h,0feh,000h,0b8h,0c2h,038h,080h,0c2h,038h,080h,0c2h,000h,080h,0feh,000h,000h,000h,000h	; 863e  ...........8..8.........
	defb 029h,052h,0a9h,029h,052h,0a9h,021h,052h,0a1h,021h,052h,0a1h,021h,052h,0a1h,021h,052h,0a1h,025h,052h,0a5h,02dh,052h,0adh	; 8656  )R.)R.!R.!R.!R.!R.%R.-R.
	defb 0ffh,000h,0ffh,0ffh,0ffh,000h,082h,0feh,001h,082h,0feh,001h,0ffh,07fh,000h,082h,002h,07dh,082h,07eh,001h,082h,07eh,001h	; 866e  .................}.~..~.

; ----------------------------------------------------------------------
; DATOS dibujo_8686: 2 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 21 de la lista 0x8000 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (48 bytes)
;   0x8686..0x86b6  (48 bytes)
DATA_dibujo_8686:
	defb 007h,000h,0f8h,00ch,003h,000h,0f9h,0f6h,000h,0fbh,0f4h,001h,00ah,005h,0f1h,009h,000h,000h,0fch,0f0h,000h,0ffh,0f8h,000h	; 8686  ........................
	defb 0e0h,000h,01fh,030h,0c0h,000h,09fh,06fh,000h,05fh,0afh,080h,0d0h,020h,00fh,0d0h,020h,000h,03fh,04fh,000h,0ffh,01fh,000h	; 869e  ...0...o._... .. .?O....

; ----------------------------------------------------------------------
; DATOS dibujo_86B6: 3 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 22 de la lista 0x8000 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (72 bytes)
;   0x86b6..0x86fe  (72 bytes)
DATA_dibujo_86B6:
	defb 0ffh,000h,000h,000h,0ffh,07fh,09fh,073h,07fh,09fh,066h,07fh,080h,07fh,060h,07fh,080h,000h,0d6h,055h,000h,0feh,07dh,000h	; 86b6  .......s..f...`....U..}.
	defb 0ffh,000h,000h,000h,0ffh,0ffh,0ffh,033h,0ffh,0ffh,066h,0ffh,000h,0ffh,000h,0ffh,000h,000h,055h,055h,000h,0ffh,0ffh,000h	; 86ce  .......3..f.......UU....
	defb 0feh,001h,000h,000h,0ffh,0ffh,0feh,030h,0fch,0feh,064h,0fch,002h,0fdh,000h,0feh,001h,001h,094h,055h,000h,0bch,07fh,001h	; 86e6  .......0..d........U....

; ----------------------------------------------------------------------
; DATOS dibujo_86FE: 5 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 23 de la lista 0x8000 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (120 bytes)
;   0x86fe..0x8776  (120 bytes)
DATA_dibujo_86FE:
	defb 000h,000h,000h,028h,0ffh,000h,038h,028h,010h,0ffh,0ffh,000h,020h,08fh,020h,08fh,020h,08fh,070h,050h,020h,0ffh,0ffh,000h	; 86fe  ...(..8(.... . . .pP ...
	defb 000h,000h,000h,080h,07fh,000h,000h,000h,000h,0ffh,0ffh,000h,000h,0ffh,000h,0d7h,038h,0c7h,000h,000h,000h,0ffh,0ffh,000h	; 8716  ................8.......
	defb 000h,000h,000h,000h,0ffh,000h,000h,000h,000h,0ffh,0ffh,000h,000h,0ffh,000h,0d7h,038h,0c7h,000h,000h,000h,0ffh,0ffh,000h	; 872e  ................8.......
	defb 00dh,00ch,000h,007h,0fah,004h,006h,006h,000h,0fch,0feh,000h,000h,0feh,000h,0fch,000h,0fch,000h,000h,000h,0feh,0feh,000h	; 8746  ........................
	defb 0b0h,030h,000h,0e0h,05fh,020h,060h,060h,000h,03fh,07fh,000h,000h,07fh,000h,03fh,000h,03fh,000h,000h,000h,07fh,07fh,000h	; 875e  .0.._ ``.?.....?.?......

; ----------------------------------------------------------------------
; DATOS dibujo_8776: 4 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 24 de la lista 0x8000 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (64 bytes)
;   0x8776..0x87b6  (64 bytes)
DATA_dibujo_8776:
	defb 0bfh,076h,0ffh,000h,0bfh,076h,0ffh,000h,0bfh,076h,0ffh,000h,0bfh,076h,0ffh,000h	; 8776  .v...v...v...v..
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,000h,0ffh,0ffh,0ffh	; 8786  ................
	defb 0ffh,0ffh,0ffh,000h,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 8796  ................
	defb 0dfh,004h,0dfh,004h,0dfh,004h,0dfh,004h,0ffh,03ch,0ffh,000h,0ffh,000h,0ffh,000h	; 87a6  .........<......

; ----------------------------------------------------------------------
; DATOS dibujo_87B6: 7 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 25 de la lista 0x8000 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (168 bytes)
;   0x87b6..0x885e  (168 bytes)
DATA_dibujo_87B6:
	defb 0f0h,01fh,00fh,002h,018h,00dh,0e3h,0f8h,00ch,0e2h,0f8h,00dh,0e2h,0f8h,00dh,0e2h,0f8h,00dh,0e2h,0f8h,00dh,0e2h,0f8h,00dh	; 87b6  ........................
	defb 0e2h,0f8h,00dh,0e2h,0f8h,00dh,0e2h,0f8h,00dh,0e2h,0f8h,00dh,0e2h,0f8h,00dh,0e2h,0f8h,00dh,0e2h,0f8h,00dh,0e2h,0f8h,00dh	; 87ce  ........................
	defb 0e2h,0f8h,00dh,0e2h,0f8h,00dh,0e2h,0f8h,00dh,0e2h,0f8h,00dh,0e2h,0f8h,00dh,0e2h,0f8h,00dh,0e7h,0f8h,00fh,000h,0ffh,0ffh	; 87e6  ........................
	defb 006h,0f1h,0f0h,020h,011h,0f0h,0a6h,017h,070h,026h,017h,0f0h,026h,017h,0f0h,0e6h,017h,010h,086h,017h,070h,0e6h,017h,0f0h	; 87fe  ... ....p&..&.......p...
	defb 026h,017h,0f0h,026h,017h,0f0h,026h,017h,0f0h,026h,017h,0f0h,026h,017h,0f0h,026h,017h,0f0h,026h,017h,0f0h,026h,017h,0f0h	; 8816  &..&..&..&..&..&..&..&..
	defb 0e6h,017h,010h,086h,017h,070h,0e6h,017h,0f0h,026h,017h,0f0h,026h,017h,0f0h,027h,017h,0f0h,0e7h,017h,0f0h,000h,0ffh,0ffh	; 882e  .....p...&..&..'........
	defb 07ch,002h,083h,040h,002h,0bfh,058h,01ah,0bfh,058h,002h,0bfh,040h,002h,0bfh,040h,01ah,0bfh,040h,002h,0bfh,000h,07eh,0ffh	; 8846  |..@..X..X..@..@..@...~.

; ----------------------------------------------------------------------
; DATOS dibujo_885E: 2 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 26 de la lista 0x8000 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (16 bytes)
;   0x885e..0x886e  (16 bytes)
DATA_dibujo_885E:
	defb 008h,01ch,008h,000h,008h,01ch,01ch,01ch	; 885e  ........
	defb 03eh,008h,008h,008h,000h,000h,000h,000h	; 8866  >.......

; ----------------------------------------------------------------------
; DATOS dibujo_886E: 2 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 27 de la lista 0x8000 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (16 bytes)
;   0x886e..0x887e  (16 bytes)
DATA_dibujo_886E:
	defb 018h,03ch,018h,000h,03ch,03ch,03ch,03ch	; 886e  .<..<<<<
	defb 018h,018h,018h,018h,000h,000h,000h,000h	; 8876  ........

; ----------------------------------------------------------------------
; DATOS dibujo_887E: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 28 de la lista 0x8000 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (8 bytes)
;   0x887e..0x8886  (8 bytes)
DATA_dibujo_887E:
	defb 000h,018h,018h,07eh,07eh,018h,018h,000h	; 887e  ...~~...

; ----------------------------------------------------------------------
; DATOS dibujo_8886: 5 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 29 de la lista 0x8000 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (40 bytes)
;   0x8886..0x88ae  (40 bytes)
DATA_dibujo_8886:
	defb 0ffh,0ffh,0ffh,0ffh,000h,0ffh,000h,000h	; 8886  ........
	defb 0e8h,0e8h,0e8h,0efh,0e0h,0ffh,0ffh,0ffh	; 888e  ........
	defb 017h,017h,017h,0f7h,007h,0ffh,0ffh,0ffh	; 8896  ........
	defb 0ffh,0ffh,0ffh,0ffh,0e0h,0efh,0e8h,0e8h	; 889e  ........
	defb 0ffh,0ffh,0ffh,0ffh,007h,0f7h,017h,017h	; 88a6  ........

; ----------------------------------------------------------------------
; DATOS dibujo_88AE: 7 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 30 de la lista 0x8000 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (112 bytes)
;   0x88ae..0x891e  (112 bytes)
DATA_dibujo_88AE:
	defb 0ffh,000h,000h,080h,000h,080h,01fh,09fh,010h,090h,017h,097h,017h,097h,017h,097h	; 88ae  ................
	defb 0ffh,000h,000h,000h,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 88be  ................
	defb 0ffh,000h,000h,001h,000h,001h,0f8h,0f9h,008h,009h,0e8h,0e9h,0e8h,0e9h,0e8h,0e9h	; 88ce  ................
	defb 017h,097h,017h,097h,017h,097h,017h,097h,017h,097h,017h,097h,017h,097h,017h,097h	; 88de  ................
	defb 0e8h,0e9h,0e8h,0e9h,0e8h,0e9h,0e8h,0e9h,0e8h,0e9h,0e8h,0e9h,0e8h,0e9h,0e8h,0e9h	; 88ee  ................
	defb 017h,097h,017h,097h,017h,097h,017h,097h,010h,090h,01fh,09fh,000h,080h,000h,080h	; 88fe  ................
	defb 0e8h,0e9h,0e8h,0e9h,0e8h,0e9h,0e8h,0e9h,008h,009h,0f8h,0f9h,000h,001h,000h,001h	; 890e  ................

; ----------------------------------------------------------------------
; DATOS dibujo_891E: 1 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 31 de la lista 0x8000 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (24 bytes)
;   0x891e..0x8936  (24 bytes)
DATA_dibujo_891E:
	defb 000h,000h,0ffh,000h,0ffh,000h,0ffh,055h,000h,0ffh,055h,000h,000h,000h,0ffh,000h,081h,002h,081h,0bdh,002h,081h,081h,07eh	; 891e  .......U..U............~

; ----------------------------------------------------------------------
; DATOS dibujo_8936: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 32 de la lista 0x8000 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (16 bytes)
;   0x8936..0x8946  (16 bytes)
DATA_dibujo_8936:
	defb 0ffh,0ffh,0ffh,000h,000h,000h,000h,000h,0ffh,000h,0ffh,0ffh,0ffh,000h,0ffh,0ffh	; 8936  ................

; ----------------------------------------------------------------------
; DATOS dibujo_8946: 2 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 33 de la lista 0x8000 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (48 bytes)
;   0x8946..0x8976  (48 bytes)
DATA_dibujo_8946:
	defb 0f7h,000h,007h,010h,0f7h,007h,010h,0f4h,007h,0d0h,034h,0c7h,050h,0b7h,047h,053h,0b4h,047h,050h,0b7h,047h,057h,0b0h,047h	; 8946  ..........4.P.GS.GP.GW.G
	defb 0efh,000h,0e0h,008h,0efh,0e0h,008h,02fh,0e0h,00bh,02ch,0e3h,00ah,0edh,0e2h,0cah,02dh,0e2h,00ah,0edh,0e2h,0eah,008h,0e2h	; 895e  ......./..,.....-.......

; ----------------------------------------------------------------------
; DATOS dibujo_8976: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 34 de la lista 0x8000 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (16 bytes)
;   0x8976..0x8986  (16 bytes)
DATA_dibujo_8976:
	defb 093h,035h,093h,035h,09bh,03dh,09bh,03dh,09bh,03dh,09bh,03dh,09bh,02dh,093h,025h	; 8976  .5.5.=.=.=.=.-.%

; ----------------------------------------------------------------------
; DATOS sin identificar  0x8986..0x898e  (8 bytes)
DATA_8986:
	defb 000h,000h,000h,000h,000h,000h,000h,000h	; 8986  ........

; ----------------------------------------------------------------------
; DATOS dibujo_898E: 5 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 0 de la lista 0x80B6 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (40 bytes)
;   0x898e..0x89b6  (40 bytes)
DATA_dibujo_898E:
	defb 0ffh,000h,000h,000h,000h,000h,000h,000h	; 898e  ........
	defb 0ffh,000h,0ffh,080h,080h,080h,080h,080h	; 8996  ........
	defb 087h,084h,09ch,094h,094h,094h,095h,096h	; 899e  ........
	defb 080h,080h,080h,080h,080h,080h,080h,080h	; 89a6  ........
	defb 000h,000h,000h,000h,000h,000h,000h,000h	; 89ae  ........

; ----------------------------------------------------------------------
; DATOS dibujo_89B6: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 1 de la lista 0x80B6 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (8 bytes)
;   0x89b6..0x89be  (8 bytes)
DATA_dibujo_89B6:
	defb 0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh	; 89b6  ........

; ----------------------------------------------------------------------
; DATOS dibujo_89BE: 4 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 2 de la lista 0x80B6 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (64 bytes)
;   0x89be..0x89fe  (64 bytes)
DATA_dibujo_89BE:
	defb 0f8h,0f6h,0f8h,0f6h,0f8h,0f6h,0f8h,0f6h,0f8h,0f6h,0f8h,0f6h,0f8h,0f6h,0f8h,0f6h	; 89be  ................
	defb 00fh,0efh,00fh,0efh,00fh,0efh,00fh,0efh,00fh,0efh,00fh,0efh,00fh,0efh,00fh,0efh	; 89ce  ................
	defb 0f8h,0f6h,0f8h,0f6h,0f8h,0f6h,0f8h,0f6h,0f8h,0f6h,0f8h,0f7h,0f8h,0f7h,0ffh,0ffh	; 89de  ................
	defb 00fh,0efh,00fh,0efh,00fh,0efh,00fh,0efh,00fh,0efh,00fh,0efh,00fh,0efh,0ffh,0ffh	; 89ee  ................

; ----------------------------------------------------------------------
; DATOS dibujo_89FE: 3 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 3 de la lista 0x80B6 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (48 bytes)
;   0x89fe..0x8a2e  (48 bytes)
DATA_dibujo_89FE:
	defb 0ffh,07fh,0c0h,0ffh,080h,0ffh,080h,0ffh,080h,0ffh,080h,0ffh,080h,0ffh,080h,0ffh	; 89fe  ................
	defb 0ffh,0fch,001h,0feh,0f1h,0feh,0a9h,096h,009h,0f6h,029h,096h,009h,0f6h,029h,096h	; 8a0e  ..........)...).
	defb 0ffh,0fch,003h,0feh,001h,0feh,001h,0feh,001h,0feh,001h,0feh,001h,0feh,001h,0feh	; 8a1e  ................

; ----------------------------------------------------------------------
; DATOS dibujo_8A2E: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 4 de la lista 0x80B6 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (16 bytes)
;   0x8a2e..0x8a3e  (16 bytes)
DATA_dibujo_8A2E:
	defb 000h,0ffh,000h,0ffh,0ffh,000h,000h,000h,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 8a2e  ................

; ----------------------------------------------------------------------
; DATOS dibujo_8A3E: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 5 de la lista 0x80B6 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (32 bytes)
;   0x8a3e..0x8a5e  (32 bytes)
DATA_dibujo_8A3E:
	defb 000h,0ffh,0ffh,000h,0ffh,000h,081h,07eh,07fh,080h,061h,080h,07fh,09eh,07fh,09eh	; 8a3e  .......~..a.....
	defb 07fh,080h,060h,080h,06eh,080h,06eh,080h,066h,080h,06eh,080h,06eh,080h,060h,080h	; 8a4e  ..`.n.n.f.n.n.`.

; ----------------------------------------------------------------------
; DATOS dibujo_8A5E: 3 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 6 de la lista 0x80B6 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (48 bytes)
;   0x8a5e..0x8a8e  (48 bytes)
DATA_dibujo_8A5E:
	defb 090h,006h,0f0h,086h,0c0h,0b6h,0c0h,036h,000h,006h,000h,0feh,000h,0feh,000h,0feh	; 8a5e  .......6........
	defb 030h,0edh,030h,0edh,030h,0edh,030h,0edh,0f0h,02dh,010h,001h,0f0h,009h,000h,0d9h	; 8a6e  0.0.0.0..-......
	defb 07ch,0fdh,0fch,0fdh,0fch,0fdh,0fch,0fdh,000h,0ffh,000h,000h,0ffh,0ffh,0ffh,000h	; 8a7e  |...............

; ----------------------------------------------------------------------
; DATOS dibujo_8A8E: 3 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 7 de la lista 0x80B6 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (48 bytes)
;   0x8a8e..0x8abe  (48 bytes)
DATA_dibujo_8A8E:
	defb 0d0h,0c0h,0dfh,0c0h,0dfh,0cfh,0dfh,0cfh,0dfh,0cfh,0ffh,0dfh,0dfh,0cfh,0ffh,0ffh	; 8a8e  ................
	defb 000h,000h,0ffh,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 8a9e  ................
	defb 017h,003h,0f7h,003h,0f7h,0f3h,0f7h,0f3h,0f7h,0f3h,0ffh,0f7h,0f7h,0f3h,0ffh,0ffh	; 8aae  ................

; ----------------------------------------------------------------------
; DATOS dibujo_8ABE: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 8 de la lista 0x80B6 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (16 bytes)
;   0x8abe..0x8ace  (16 bytes)
DATA_dibujo_8ABE:
	defb 000h,000h,0ffh,000h,080h,07fh,000h,000h,0ffh,0ffh,0ffh,000h,0ffh,0ffh,000h,000h	; 8abe  ................

; ----------------------------------------------------------------------
; DATOS dibujo_8ACE: 2 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 9 de la lista 0x80B6 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (48 bytes)
;   0x8ace..0x8afe  (48 bytes)
DATA_dibujo_8ACE:
	defb 000h,000h,000h,000h,000h,0ffh,070h,078h,0bfh,0d5h,0cch,04eh,0f5h,0cch,04eh,0cch,0fch,0bfh,079h,078h,0feh,000h,000h,0ffh	; 8ace  ......px...N..N...yx....
	defb 000h,000h,000h,000h,000h,0ffh,000h,000h,0ffh,0c0h,000h,03fh,0dah,000h,025h,000h,000h,0ffh,0afh,000h,050h,000h,000h,0ffh	; 8ae6  ...........?..%.....P...

; ----------------------------------------------------------------------
; DATOS dibujo_8AFE: 1 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 10 de la lista 0x80B6 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (24 bytes)
;   0x8afe..0x8b16  (24 bytes)
DATA_dibujo_8AFE:
	defb 0cfh,000h,008h,000h,000h,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh,000h,000h,000h,000h,0ffh,0ffh,000h,000h,000h,000h,000h	; 8afe  ........................

; ----------------------------------------------------------------------
; DATOS dibujo_8B16: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 11 de la lista 0x80B6 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (32 bytes)
;   0x8b16..0x8b36  (32 bytes)
DATA_dibujo_8B16:
	defb 040h,001h,0f8h,0b9h,0f8h,0b9h,0f8h,0b9h,0fah,0b9h,0feh,0b9h,0fch,001h,0f8h,001h	; 8b16  @...............
	defb 000h,001h,0fah,0e9h,0feh,0f9h,0bah,041h,0a6h,081h,004h,0fbh,0fch,003h,000h,0ffh	; 8b26  .......A........

; ----------------------------------------------------------------------
; DATOS dibujo_8B36: 4 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 12 de la lista 0x80B6 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (96 bytes)
;   0x8b36..0x8b96  (96 bytes)
DATA_dibujo_8B36:
	defb 0ffh,090h,067h,0f7h,038h,040h,0efh,0f0h,000h,01dh,0e5h,000h,0ffh,00dh,002h,0fah,018h,000h,0ffh,0ffh,000h,000h,000h,000h	; 8b36  ..g.8@..................
	defb 07fh,0c9h,032h,0ffh,04ch,020h,0ffh,047h,020h,0f8h,047h,020h,0ffh,040h,020h,0ffh,0c0h,020h,0ffh,0ffh,000h,000h,000h,000h	; 8b4e  ..2.L .G .G .@ .. ......
	defb 077h,082h,035h,037h,0c2h,000h,037h,0c2h,000h,037h,0c2h,000h,0b3h,0c2h,000h,0ffh,0c2h,000h,07fh,0ffh,000h,03fh,0ffh,000h	; 8b66  w.57..7..7...........?..
	defb 030h,0cfh,030h,037h,0c8h,000h,037h,0c9h,000h,037h,0c9h,000h,037h,0c8h,000h,03fh,04fh,000h,07fh,07fh,000h,000h,000h,000h	; 8b7e  0.07..7..7..7..?O.......

; ----------------------------------------------------------------------
; DATOS dibujo_8B96: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 13 de la lista 0x80B6 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (16 bytes)
;   0x8b96..0x8ba6  (16 bytes)
DATA_dibujo_8B96:
	defb 07fh,000h,080h,000h,080h,000h,098h,038h,080h,000h,098h,038h,080h,000h,098h,038h	; 8b96  .......8...8...8

; ----------------------------------------------------------------------
; DATOS dibujo_8BA6: 1 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 14 de la lista 0x80B6 (p00:4D92, p00:4DF5); se solapan 3
;   bloques: (dibujo_8BBD 8BBD-8C1D) (dibujo_8BBD 8BBD-8C1D); lo leen
;   p00:4C0C, p00:4C26 (119 bytes)
;   0x8ba6..0x8c1d  (119 bytes)
DATA_dibujo_8BA6:
	defb 080h,000h,0ffh,098h,000h,0c6h,080h,000h,0feh,080h,000h,0feh,080h,000h,0feh,0ffh,080h,07eh,000h,07eh,080h,080h,000h,001h	; 8ba6  .................~.~....
	defb 003h,0fch,0fch,001h,002h,0feh,007h,000h,0feh,001h,006h,0fch,001h,002h,0fch,001h,002h,0fch,001h,002h,0fch,001h,002h,0fch	; 8bbe  ........................
	defb 001h,002h,07eh,007h,000h,07eh,001h,006h,07ch,001h,002h,07ch,001h,002h,002h,003h,07ch,07eh,002h,000h,000h,000h,000h,001h	; 8bd6  ..~..~..|..|....|~......
	defb 0feh,001h,0ffh,0feh,001h,0ffh,0f8h,007h,0fch,0f0h,00ch,0f9h,070h,089h,0fah,0f0h,00bh,0fah,001h,0fbh,0fbh,004h,0fbh,000h	; 8bee  ............p...........
	defb 07fh,000h,07fh,07fh,000h,0ffh,01fh,0e0h,03fh,00fh,030h,09fh,00eh,091h,05fh,08fh,0d0h,0dfh,000h,0dfh,0dfh,020h,0dfh	; 8c06  ........?.0..._...... .

; ----------------------------------------------------------------------
; DATOS dibujo_8C1D: 15 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 16 de la lista 0x80B6 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (360 bytes)
;   0x8c1d..0x8d85  (360 bytes)
DATA_dibujo_8C1D:
	defb 07fh,000h,080h,07fh,000h,080h,0ffh,000h,0ffh,0ffh,000h,0ffh,0bfh,000h,0c0h,0c1h,000h,0beh,0e0h,03fh,080h,0e0h,03fh,080h	; 8c1d  ...................?..?.
	defb 0f6h,009h,000h,0f6h,009h,000h,0f6h,009h,0f0h,0f6h,009h,0f0h,0f6h,009h,010h,0f2h,029h,010h,010h,0e9h,010h,010h,0e9h,010h	; 8c35  ................).......
	defb 07fh,001h,080h,02bh,054h,081h,07fh,000h,080h,000h,07fh,080h,000h,000h,000h,0ffh,000h,000h,000h,001h,0feh,07eh,07fh,080h	; 8c4d  ...+T................~..
	defb 0e1h,03eh,081h,0ffh,000h,0feh,001h,000h,000h,001h,080h,001h,000h,07fh,000h,0c0h,000h,000h,0e0h,000h,000h,0f0h,000h,000h	; 8c65  .>......................
	defb 01fh,000h,0e0h,0ffh,03ch,000h,0e1h,022h,01ch,0fch,022h,000h,0fch,02eh,010h,0f4h,022h,010h,0f0h,022h,010h,0f0h,022h,010h	; 8c7d  ....<.."..".....".."..".
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 8c95  ........................
	defb 06ch,004h,090h,06ch,004h,090h,06ch,004h,090h,06ch,004h,090h,06fh,004h,093h,068h,007h,090h,06fh,000h,093h,06eh,002h,090h	; 8cad  l..l..l..l..o..h..o..n..
	defb 06fh,002h,091h,06fh,002h,091h,06fh,002h,091h,06eh,003h,090h,06fh,000h,090h,060h,01fh,080h,060h,000h,080h,07fh,000h,080h	; 8cc5  o..o..o..n..o..`..`.....
	defb 07fh,000h,080h,07fh,000h,080h,0ffh,07fh,000h,080h,000h,080h,080h,000h,080h,0feh,001h,0ffh,0cdh,012h,0ffh,0cbh,014h,0ffh	; 8cdd  ........................
	defb 0feh,001h,000h,0feh,001h,000h,0fch,0ffh,000h,001h,000h,001h,001h,000h,001h,07fh,080h,0ffh,0b3h,044h,0ffh,0d3h,024h,0ffh	; 8cf5  ...................D..$.
	defb 000h,026h,000h,024h,05ah,018h,024h,05ah,018h,024h,0dah,018h,0fch,002h,000h,000h,0feh,000h,000h,000h,000h,0ffh,000h,000h	; 8d0d  .&.$Z.$Z.$..............
	defb 000h,054h,054h,054h,000h,054h,000h,000h,000h,0ffh,055h,000h,0ffh,000h,000h,000h,000h,000h,0ffh,000h,000h,0ffh,07fh,008h	; 8d25  .TTT.T....U.............
	defb 0ffh,07fh,01ch,0ffh,07fh,000h,0ffh,07fh,036h,0ffh,07fh,000h,000h,000h,000h,000h,0ffh,000h,0ffh,0ffh,000h,0ffh,000h,0ffh	; 8d3d  ........6...............
	defb 087h,0e9h,01eh,083h,0e4h,01fh,083h,0dch,03fh,085h,0dah,03fh,017h,068h,03fh,0abh,054h,0ffh,02eh,0d1h,03eh,0ffh,000h,0ffh	; 8d55  ........?..?.h?.T...>...
	defb 0c4h,0f8h,01ch,08ch,0d0h,03ch,083h,0ddh,03eh,023h,09dh,07eh,06ah,014h,07eh,0d5h,02ah,0ffh,0b7h,0c8h,03fh,0ffh,000h,0ffh	; 8d6d  .....<..>#.~j.~.*...?...

; ----------------------------------------------------------------------
; DATOS dibujo_8D85: 2 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 17 de la lista 0x80B6 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (48 bytes)
;   0x8d85..0x8db5  (48 bytes)
DATA_dibujo_8D85:
	defb 000h,0ffh,000h,000h,080h,07fh,007h,098h,067h,021h,086h,079h,038h,081h,06fh,038h,086h,061h,021h,098h,067h,000h,0ffh,000h	; 8d85  ........g!.y8.o8.a!.g...
	defb 001h,0feh,001h,001h,002h,0fdh,0e1h,01ah,0e5h,085h,062h,09dh,01dh,082h,0f1h,01dh,062h,081h,085h,01ah,061h,001h,0feh,001h	; 8d9d  ..........b.....b...a...

; ----------------------------------------------------------------------
; DATOS dibujo_8DB5: 4 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 18 de la lista 0x80B6 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (96 bytes)
;   0x8db5..0x8e15  (96 bytes)
DATA_dibujo_8DB5:
	defb 0ffh,000h,080h,0ffh,080h,07fh,0aah,080h,02ah,0d5h,0aah,02ah,0d5h,0aah,02ah,0ffh,080h,02ah,0aah,080h,02ah,000h,000h,000h	; 8db5  ........*..*..*..*..*...
	defb 0ffh,000h,000h,0ffh,000h,0feh,0abh,000h,0aah,055h,0aah,0aah,055h,0aah,0aah,0ffh,000h,0aah,0abh,000h,0aah,000h,000h,000h	; 8dcd  .........U..U...........
	defb 080h,080h,07fh,000h,000h,080h,0beh,080h,03fh,0bdh,080h,003h,082h,0b8h,007h,095h,0a0h,01eh,08bh,0a0h,01eh,097h,080h,038h	; 8de5  ........?..............8
	defb 006h,004h,0fah,00eh,004h,002h,0feh,004h,0fah,0feh,004h,002h,006h,0fch,002h,07eh,084h,07ah,07eh,084h,07ah,0feh,004h,002h	; 8dfd  ...............~.z~.z...

; ----------------------------------------------------------------------
; DATOS dibujo_8E15: 2 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 19 de la lista 0x80B6 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (48 bytes)
;   0x8e15..0x8e45  (48 bytes)
DATA_dibujo_8E15:
	defb 081h,0beh,000h,081h,0a0h,01eh,081h,0a0h,01eh,0bfh,080h,000h,080h,080h,000h,080h,080h,07fh,000h,0ffh,0ffh,000h,000h,000h	; 8e15  ........................
	defb 004h,0fch,002h,004h,084h,07ah,004h,084h,07ah,0fch,004h,002h,004h,004h,002h,000h,000h,0feh,000h,0ffh,0ffh,000h,001h,001h	; 8e2d  .....z..z...............

; ----------------------------------------------------------------------
; DATOS dibujo_8E45: 5 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 20 de la lista 0x80B6 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (120 bytes)
;   0x8e45..0x8ebd  (120 bytes)
DATA_dibujo_8E45:
	defb 00ch,0f0h,00fh,018h,080h,07fh,031h,080h,07fh,0eah,008h,077h,000h,000h,000h,000h,000h,0ffh,000h,0ffh,0ffh,000h,000h,000h	; 8e45  ......1....w............
	defb 045h,0bah,044h,089h,000h,0feh,011h,080h,07eh,0ffh,000h,020h,000h,000h,000h,000h,000h,0ffh,000h,0ffh,0ffh,000h,000h,000h	; 8e5d  E.D.....~.. ............
	defb 000h,001h,001h,000h,001h,015h,000h,001h,001h,054h,0ffh,001h,0feh,0ffh,001h,000h,001h,001h,03ch,03ch,0c2h,000h,07ch,002h	; 8e75  .........T........<<..|.
	defb 0ffh,000h,0ffh,000h,000h,000h,001h,080h,07eh,0ffh,000h,000h,001h,0feh,000h,000h,080h,07fh,003h,080h,07fh,0f6h,000h,00fh	; 8e8d  ........~...............
	defb 0ffh,000h,0ffh,000h,000h,000h,001h,080h,07eh,0ffh,000h,000h,005h,0fah,004h,009h,080h,07eh,011h,080h,07eh,0bfh,000h,060h	; 8ea5  ........~........~..~..`

; ----------------------------------------------------------------------
; DATOS dibujo_8EBD: 2 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 21 de la lista 0x80B6 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (48 bytes)
;   0x8ebd..0x8eed  (48 bytes)
DATA_dibujo_8EBD:
	defb 01ch,07ch,0ffh,042h,07eh,043h,010h,0e6h,089h,028h,0c6h,081h,098h,0c6h,081h,048h,044h,0c3h,088h,000h,0c7h,099h,000h,0c7h	; 8ebd  .|.B~C...(.....HD.......
	defb 00eh,03eh,0ffh,021h,03fh,0a1h,008h,073h,0c4h,010h,063h,0c0h,04ch,063h,0c0h,024h,022h,0e1h,004h,000h,003h,0e8h,000h,0e7h	; 8ed5  .>.!?..s..c.Lc.$".......

; ----------------------------------------------------------------------
; DATOS dibujo_8EED: 1 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 22 de la lista 0x80B6 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (24 bytes)
;   0x8eed..0x8f05  (24 bytes)
DATA_dibujo_8EED:
	defb 0c0h,0c0h,000h,02fh,0e5h,02fh,0e0h,0e0h,0e0h,000h,000h,0ffh,0ffh,000h,000h,000h,000h,0ffh,000h,000h,000h,0ffh,000h,000h	; 8eed  ..././..................

; ----------------------------------------------------------------------
; DATOS dibujo_8F05: 2 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 23 de la lista 0x80B6 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (48 bytes)
;   0x8f05..0x8f35  (48 bytes)
DATA_dibujo_8F05:
	defb 0f8h,001h,0f6h,0feh,001h,0f0h,0feh,007h,0f0h,0feh,007h,0f0h,0feh,007h,0f0h,0feh,007h,0f0h,0feh,007h,0f0h,0feh,007h,0f0h	; 8f05  ........................
	defb 01fh,010h,0efh,0efh,010h,00fh,0efh,0f0h,00fh,0efh,0f0h,00fh,0efh,0f0h,00fh,0efh,0f0h,00fh,0efh,0f0h,00fh,0efh,0f0h,00fh	; 8f1d  ........................

; ----------------------------------------------------------------------
; DATOS lista_8F35: 49 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x0000); lo leen p00:4C0C, p00:4C26 (246 bytes)
;   0x8f35..0x902b  (246 bytes)
DATA_lista_8F35:
	defb 041h,000h,081h,03eh,091h	; 8f35
	defb 042h,003h,082h,04eh,091h	; 8f3a
	defb 001h,005h,084h,06eh,091h	; 8f3f
	defb 041h,005h,085h,076h,091h	; 8f44
	defb 004h,005h,086h,086h,091h	; 8f49
	defb 001h,006h,08ah,0a6h,091h	; 8f4e
	defb 001h,01bh,08bh,0aeh,091h	; 8f53
	defb 043h,019h,08ch,0b6h,091h	; 8f58
	defb 041h,001h,08fh,0e6h,091h	; 8f5d
	defb 042h,009h,090h,0f6h,091h	; 8f62
	defb 081h,00eh,092h,016h,092h	; 8f67
	defb 041h,01bh,093h,02eh,092h	; 8f6c
	defb 081h,013h,094h,03eh,092h	; 8f71
	defb 042h,00ch,095h,056h,092h	; 8f76
	defb 041h,005h,097h,076h,092h	; 8f7b
	defb 041h,001h,09bh,086h,092h	; 8f80
	defb 049h,003h,09ch,096h,092h	; 8f85
	defb 003h,01eh,0a5h,026h,093h	; 8f8a
	defb 081h,029h,0a8h,03eh,093h	; 8f8f
	defb 043h,020h,0a9h,056h,093h	; 8f94
	defb 002h,021h,0ach,086h,093h	; 8f99
	defb 042h,021h,0aeh,096h,093h	; 8f9e
	defb 001h,020h,0b0h,0b6h,093h	; 8fa3
	defb 044h,022h,0b1h,0beh,093h	; 8fa8
	defb 082h,013h,0bah,0feh,093h	; 8fad
	defb 043h,026h,0bch,02eh,094h	; 8fb2
	defb 081h,029h,0bfh,05eh,094h	; 8fb7
	defb 041h,027h,0c0h,076h,094h	; 8fbc
	defb 083h,027h,0c1h,086h,094h	; 8fc1
	defb 081h,00ah,0c4h,0ceh,094h	; 8fc6
	defb 081h,033h,0c5h,0e6h,094h	; 8fcb
	defb 041h,018h,0c6h,0feh,094h	; 8fd0
	defb 041h,02ch,0c7h,00eh,095h	; 8fd5
	defb 082h,024h,0cah,01eh,095h	; 8fda
	defb 082h,029h,0cch,04eh,095h	; 8fdf
	defb 082h,00ah,0ceh,07eh,095h	; 8fe4
	defb 08ch,02bh,0d0h,0aeh,095h	; 8fe9
	defb 084h,02dh,0dch,0ceh,096h	; 8fee
	defb 085h,011h,0e0h,02eh,097h	; 8ff3
	defb 042h,03fh,0e5h,0a6h,097h	; 8ff8
	defb 085h,017h,0e7h,0c6h,097h	; 8ffd
	defb 082h,02dh,0f0h,03eh,098h	; 9002
	defb 043h,02dh,0f2h,06eh,098h	; 9007
	defb 084h,020h,0f5h,09eh,098h	; 900c
	defb 085h,027h,0f9h,0feh,098h	; 9011
	defb 081h,004h,0feh,076h,099h	; 9016
	defb 081h,021h,0ffh,08eh,099h	; 901b
	defb 082h,013h,098h,0a6h,099h	; 9020
	defb 041h,025h,09ah,0d6h,099h	; 9025
	defb 0ffh	; 902a

; ----------------------------------------------------------------------
; DATOS lista_902B: 12 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x0000); lo leen p00:4C0C (61 bytes)
;   0x902b..0x9068  (61 bytes)
DATA_lista_902B:
	defb 003h,01dh,001h,0e6h,099h	; 902b
	defb 043h,040h,004h,0feh,099h	; 9030
	defb 045h,041h,007h,02eh,09ah	; 9035
	defb 001h,022h,010h,07eh,09ah	; 903a
	defb 055h,025h,011h,086h,09ah	; 903f
	defb 049h,041h,026h,0d6h,09bh	; 9044
	defb 041h,028h,02fh,066h,09ch	; 9049
	defb 042h,017h,030h,076h,09ch	; 904e
	defb 001h,040h,032h,096h,09ch	; 9053
	defb 042h,03eh,033h,09eh,09ch	; 9058
	defb 044h,03ah,040h,0beh,09ch	; 905d
	defb 091h,041h,04fh,0feh,09ch	; 9062
	defb 0ffh	; 9067

; ----------------------------------------------------------------------
; DATOS lista_9068: 11 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x0000); lo leen p00:4C0C (56 bytes)
;   0x9068..0x90a0  (56 bytes)
DATA_lista_9068:
	defb 045h,033h,081h,096h,09eh	; 9068
	defb 050h,034h,090h,0e6h,09eh	; 906d
	defb 045h,035h,0a0h,0e6h,09fh	; 9072
	defb 045h,036h,0a5h,036h,0a0h	; 9077
	defb 042h,035h,0aah,086h,0a0h	; 907c
	defb 093h,034h,0b0h,0a6h,0a0h	; 9081
	defb 086h,035h,0d0h,06eh,0a2h	; 9086
	defb 081h,036h,0d6h,0feh,0a2h	; 908b
	defb 088h,037h,0d7h,016h,0a3h	; 9090
	defb 083h,038h,0e0h,0d6h,0a3h	; 9095
	defb 081h,033h,0f0h,01eh,0a4h	; 909a
	defb 0ffh	; 909f

; ----------------------------------------------------------------------
; DATOS lista_90A0: 17 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x0000); lo leen p00:4C0C (86 bytes)
;   0x90a0..0x90f6  (86 bytes)
DATA_lista_90A0:
	defb 042h,025h,001h,036h,0a4h	; 90a0
	defb 042h,017h,003h,056h,0a4h	; 90a5
	defb 081h,01ch,005h,076h,0a4h	; 90aa
	defb 002h,02bh,008h,08eh,0a4h	; 90af
	defb 003h,019h,00ah,09eh,0a4h	; 90b4
	defb 003h,018h,00dh,0b6h,0a4h	; 90b9
	defb 057h,017h,010h,0ceh,0a4h	; 90be
	defb 048h,038h,028h,03eh,0a6h	; 90c3
	defb 047h,025h,030h,0beh,0a6h	; 90c8
	defb 045h,039h,038h,02eh,0a7h	; 90cd
	defb 043h,01fh,03dh,07eh,0a7h	; 90d2
	defb 042h,01bh,040h,0aeh,0a7h	; 90d7
	defb 041h,032h,042h,0ceh,0a7h	; 90dc
	defb 041h,010h,043h,0deh,0a7h	; 90e1
	defb 044h,020h,044h,0eeh,0a7h	; 90e6
	defb 083h,02bh,04dh,02eh,0a8h	; 90eb
	defb 09fh,01ch,050h,076h,0a8h	; 90f0
	defb 0ffh	; 90f5

; ----------------------------------------------------------------------
; DATOS lista_90F6: 9 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x0000); lo leen p00:4C0C, p00:4C26 (46 bytes)
;   0x90f6..0x9124  (46 bytes)
DATA_lista_90F6:
	defb 003h,01dh,081h,05eh,0abh	; 90f6
	defb 001h,01ch,084h,076h,0abh	; 90fb
	defb 044h,01dh,085h,07eh,0abh	; 9100
	defb 002h,01ch,0a0h,0beh,0abh	; 9105
	defb 044h,043h,0a2h,0ceh,0abh	; 910a
	defb 043h,01ch,0a6h,00eh,0ach	; 910f
	defb 044h,038h,0a9h,03eh,0ach	; 9114
	defb 044h,017h,0b0h,07eh,0ach	; 9119
	defb 087h,01ch,0b8h,0beh,0ach	; 911e
	defb 0ffh	; 9123

; ----------------------------------------------------------------------
; DATOS lista_9124: 5 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x62D1); lo leen p00:4C26 (26 bytes)
;   0x9124..0x913e  (26 bytes)
DATA_lista_9124:
	defb 005h,003h,070h,086h,088h	; 9124
	defb 047h,006h,075h,0aeh,088h	; 9129
	defb 081h,006h,07ch,01eh,089h	; 912e
	defb 041h,00bh,07dh,036h,089h	; 9133
	defb 082h,002h,07eh,046h,089h	; 9138
	defb 0ffh	; 913d

; ----------------------------------------------------------------------
; DATOS dibujo_913E: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 0 de la lista 0x8F35 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (16 bytes)
;   0x913e..0x914e  (16 bytes)
DATA_dibujo_913E:
	defb 065h,002h,000h,000h,055h,0aah,0aah,000h,055h,055h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 913e  e...U...UU......

; ----------------------------------------------------------------------
; DATOS dibujo_914E: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 1 de la lista 0x8F35 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (32 bytes)
;   0x914e..0x916e  (32 bytes)
DATA_dibujo_914E:
	defb 000h,000h,03eh,03fh,020h,025h,020h,021h,020h,021h,020h,025h,020h,021h,000h,03fh	; 914e  ..>? % ! ! % !.?
	defb 001h,000h,001h,000h,001h,000h,006h,00fh,001h,006h,001h,000h,001h,000h,001h,000h	; 915e  ................

; ----------------------------------------------------------------------
; DATOS dibujo_916E: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 2 de la lista 0x8F35 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (8 bytes)
;   0x916e..0x9176  (8 bytes)
DATA_dibujo_916E:
	defb 000h,000h,000h,000h,000h,000h,000h,000h	; 916e  ........

; ----------------------------------------------------------------------
; DATOS dibujo_9176: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 3 de la lista 0x8F35 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (16 bytes)
;   0x9176..0x9186  (16 bytes)
DATA_dibujo_9176:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0ffh,000h,000h,0ffh,000h,0ffh	; 9176  ................

; ----------------------------------------------------------------------
; DATOS dibujo_9186: 4 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 4 de la lista 0x8F35 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (32 bytes)
;   0x9186..0x91a6  (32 bytes)
DATA_dibujo_9186:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9186  ........
	defb 000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 918e  ........
	defb 0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh	; 9196  ........
	defb 0ffh,000h,000h,000h,000h,000h,000h,000h	; 919e  ........

; ----------------------------------------------------------------------
; DATOS dibujo_91A6: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 5 de la lista 0x8F35 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (8 bytes)
;   0x91a6..0x91ae  (8 bytes)
DATA_dibujo_91A6:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h	; 91a6  ........

; ----------------------------------------------------------------------
; DATOS dibujo_91AE: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 6 de la lista 0x8F35 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (8 bytes)
;   0x91ae..0x91b6  (8 bytes)
DATA_dibujo_91AE:
	defb 001h,001h,001h,001h,001h,001h,001h,001h	; 91ae  ........

; ----------------------------------------------------------------------
; DATOS dibujo_91B6: 3 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 7 de la lista 0x8F35 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (48 bytes)
;   0x91b6..0x91e6  (48 bytes)
DATA_dibujo_91B6:
	defb 0ffh,080h,0e0h,080h,0c0h,080h,0c0h,080h,0c0h,080h,0c0h,080h,0c0h,080h,0c0h,080h	; 91b6  ................
	defb 0c0h,080h,0c0h,080h,0c0h,080h,0c0h,080h,0c0h,080h,0c0h,080h,0c0h,080h,0c0h,080h	; 91c6  ................
	defb 0c0h,080h,0c0h,080h,0c0h,080h,0c0h,080h,0c0h,080h,0c0h,080h,0ffh,0ffh,0ffh,0ffh	; 91d6  ................

; ----------------------------------------------------------------------
; DATOS dibujo_91E6: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 8 de la lista 0x8F35 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (16 bytes)
;   0x91e6..0x91f6  (16 bytes)
DATA_dibujo_91E6:
	defb 0ffh,0feh,0ffh,0feh,0ffh,0feh,0ffh,0feh,0ffh,0feh,0ffh,0feh,001h,0feh,001h,0feh	; 91e6  ................

; ----------------------------------------------------------------------
; DATOS dibujo_91F6: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 9 de la lista 0x8F35 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (32 bytes)
;   0x91f6..0x9216  (32 bytes)
DATA_dibujo_91F6:
	defb 000h,000h,0ffh,07fh,080h,0ffh,080h,0ffh,080h,0ffh,080h,0ffh,080h,0ffh,080h,0ffh	; 91f6  ................
	defb 000h,000h,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 9206  ................

; ----------------------------------------------------------------------
; DATOS dibujo_9216: 1 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 10 de la lista 0x8F35 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (24 bytes)
;   0x9216..0x922e  (24 bytes)
DATA_dibujo_9216:
	defb 000h,000h,000h,006h,0f8h,0feh,002h,0fch,002h,003h,0fdh,002h,003h,0fdh,002h,003h,0fdh,002h,003h,0fdh,002h,003h,0fdh,002h	; 9216  ........................

; ----------------------------------------------------------------------
; DATOS dibujo_922E: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 11 de la lista 0x8F35 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (16 bytes)
;   0x922e..0x923e  (16 bytes)
DATA_dibujo_922E:
	defb 001h,002h,001h,002h,001h,002h,001h,002h,001h,002h,0f9h,0fah,001h,0feh,001h,0feh	; 922e  ................

; ----------------------------------------------------------------------
; DATOS dibujo_923E: 1 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 12 de la lista 0x8F35 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (24 bytes)
;   0x923e..0x9256  (24 bytes)
DATA_dibujo_923E:
	defb 0feh,001h,0ffh,0feh,0ffh,001h,0feh,0ffh,001h,0feh,0ffh,001h,0feh,0ffh,001h,0feh,0ffh,001h,0feh,0ffh,001h,0feh,0ffh,001h	; 923e  ........................

; ----------------------------------------------------------------------
; DATOS dibujo_9256: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 13 de la lista 0x8F35 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (32 bytes)
;   0x9256..0x9276  (32 bytes)
DATA_dibujo_9256:
	defb 0ffh,080h,080h,07fh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 9256  ................
	defb 0ffh,001h,001h,0feh,001h,0feh,001h,0feh,001h,0feh,001h,0feh,001h,0feh,001h,0feh	; 9266  ................

; ----------------------------------------------------------------------
; DATOS dibujo_9276: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 14 de la lista 0x8F35 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (16 bytes)
;   0x9276..0x9286  (16 bytes)
DATA_dibujo_9276:
	defb 080h,000h,080h,000h,080h,000h,080h,000h,080h,000h,0ffh,000h,080h,0ffh,080h,0ffh	; 9276  ................

; ----------------------------------------------------------------------
; DATOS dibujo_9286: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 15 de la lista 0x8F35 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (16 bytes)
;   0x9286..0x9296  (16 bytes)
DATA_dibujo_9286:
	defb 000h,0ffh,00ah,0e0h,000h,0ffh,00ah,0e0h,000h,0ffh,00ah,0e0h,000h,0ffh,00ah,0e0h	; 9286  ................

; ----------------------------------------------------------------------
; DATOS dibujo_9296: 9 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 16 de la lista 0x8F35 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (144 bytes)
;   0x9296..0x9326  (144 bytes)
DATA_dibujo_9296:
	defb 040h,0c0h,04ah,0c6h,04ah,0c6h,04ah,0c6h,04ah,0c6h,04ah,0c6h,042h,0ceh,040h,0c0h	; 9296  @.J.J.J.J.J.B.@.
	defb 040h,0c0h,040h,0c0h,054h,0d4h,01dh,09dh,000h,0ffh,000h,000h,000h,0ffh,0ffh,000h	; 92a6  @.@.T...........
	defb 000h,000h,000h,000h,02ah,02ah,0bfh,0bfh,000h,0ffh,000h,000h,000h,0ffh,0ffh,000h	; 92b6  ....**..........
	defb 001h,000h,009h,008h,029h,028h,0bdh,0beh,001h,0feh,001h,002h,001h,0feh,0ffh,000h	; 92c6  ....)(..........
	defb 0ffh,0ffh,000h,0ffh,000h,0ffh,000h,0feh,000h,0fch,000h,0f9h,000h,0f2h,0ffh,000h	; 92d6  ................
	defb 0ffh,0ffh,000h,0f0h,000h,021h,000h,043h,000h,086h,000h,00ch,000h,019h,0ffh,000h	; 92e6  .....!.C........
	defb 0f1h,0f0h,011h,0f0h,019h,098h,009h,038h,00dh,07ch,005h,0fch,007h,0beh,0ffh,000h	; 92f6  .......8.|......
	defb 000h,032h,000h,03fh,000h,020h,000h,055h,055h,0aah,083h,05ch,083h,04ch,0c7h,018h	; 9306  .2.?. .UU..\.L..
	defb 001h,042h,001h,0f2h,001h,002h,003h,054h,057h,0a8h,083h,05ch,083h,04ch,0c7h,018h	; 9316  .B.....TW..\.L..

; ----------------------------------------------------------------------
; DATOS dibujo_9326: 3 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 17 de la lista 0x8F35 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (24 bytes)
;   0x9326..0x933e  (24 bytes)
DATA_dibujo_9326:
	defb 0c6h,0feh,0c6h,0feh,0feh,0feh,002h,002h	; 9326  ........
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h	; 932e  ........
	defb 0f2h,0f2h,0e2h,0e2h,0c2h,0c2h,042h,042h	; 9336  ......BB

; ----------------------------------------------------------------------
; DATOS dibujo_933E: 1 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 18 de la lista 0x8F35 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (24 bytes)
;   0x933e..0x9356  (24 bytes)
DATA_dibujo_933E:
	defb 001h,001h,011h,023h,021h,06ch,043h,041h,05ch,003h,001h,0bch,007h,005h,07ch,00bh,00dh,078h,013h,015h,070h,0fbh,0fdh,0f8h	; 933e  ...#!lCA\.....|..x..p...

; ----------------------------------------------------------------------
; DATOS dibujo_9356: 3 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 19 de la lista 0x8F35 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (48 bytes)
;   0x9356..0x9386  (48 bytes)
DATA_dibujo_9356:
	defb 000h,000h,07fh,000h,07fh,03fh,07fh,03fh,07fh,03fh,07fh,03fh,07fh,03fh,07fh,03fh	; 9356  .....?.?.?.?.?.?
	defb 000h,000h,0ffh,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9366  ................
	defb 001h,000h,0fdh,000h,0fdh,0fch,0fdh,0fch,0fdh,0fch,0fdh,0fch,0fdh,0fch,0fdh,0fch	; 9376  ................

; ----------------------------------------------------------------------
; DATOS dibujo_9386: 2 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 20 de la lista 0x8F35 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (16 bytes)
;   0x9386..0x9396  (16 bytes)
DATA_dibujo_9386:
	defb 0feh,0fch,0f8h,0f0h,0e0h,0c0h,080h,000h	; 9386  ........
	defb 000h,001h,003h,007h,00fh,01fh,03fh,07fh	; 938e  ......?.

; ----------------------------------------------------------------------
; DATOS dibujo_9396: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 21 de la lista 0x8F35 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (32 bytes)
;   0x9396..0x93b6  (32 bytes)
DATA_dibujo_9396:
	defb 0ffh,0ffh,001h,000h,003h,000h,007h,000h,00fh,000h,01fh,000h,03fh,000h,07fh,000h	; 9396  ............?...
	defb 001h,0ffh,0fch,000h,0f8h,000h,0f0h,000h,0e0h,000h,0c0h,000h,080h,000h,000h,000h	; 93a6  ................

; ----------------------------------------------------------------------
; DATOS dibujo_93B6: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 22 de la lista 0x8F35 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (8 bytes)
;   0x93b6..0x93be  (8 bytes)
DATA_dibujo_93B6:
	defb 000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 93b6  ........

; ----------------------------------------------------------------------
; DATOS dibujo_93BE: 4 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 23 de la lista 0x8F35 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (64 bytes)
;   0x93be..0x93fe  (64 bytes)
DATA_dibujo_93BE:
	defb 047h,04fh,047h,04fh,04bh,04fh,04bh,04fh,04dh,04fh,04dh,04fh,04eh,04eh,04eh,04eh	; 93be  GOGOKOKOMOMONNNN
	defb 023h,043h,01fh,07fh,023h,043h,01fh,07fh,01fh,07fh,03fh,07fh,040h,040h,040h,040h	; 93ce  #C..#C....?.@@@@
	defb 000h,0fch,0fch,0feh,0c6h,0c6h,0feh,0feh,0c6h,0c6h,0feh,0feh,0c6h,0c6h,0feh,0feh	; 93de  ................
	defb 000h,03fh,01fh,07fh,023h,063h,01fh,07fh,023h,043h,01fh,07fh,023h,043h,01fh,07fh	; 93ee  .?..#c..#C..#C..

; ----------------------------------------------------------------------
; DATOS dibujo_93FE: 2 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 24 de la lista 0x8F35 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (48 bytes)
;   0x93fe..0x942e  (48 bytes)
DATA_dibujo_93FE:
	defb 091h,003h,020h,091h,003h,020h,091h,003h,020h,091h,003h,020h,091h,003h,020h,091h,003h,020h,091h,003h,020h,091h,003h,020h	; 93fe  .. .. .. .. .. .. .. ..
	defb 091h,003h,020h,090h,001h,022h,090h,001h,022h,090h,001h,022h,090h,000h,023h,090h,000h,023h,090h,000h,023h,090h,000h,020h	; 9416  .. .."..".."..#..#..#..

; ----------------------------------------------------------------------
; DATOS dibujo_942E: 3 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 25 de la lista 0x8F35 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (48 bytes)
;   0x942e..0x945e  (48 bytes)
DATA_dibujo_942E:
	defb 0f0h,00eh,080h,00eh,0c0h,00eh,0b0h,00eh,081h,00eh,0a9h,00eh,0cfh,007h,0ffh,000h	; 942e  ................
	defb 000h,000h,082h,000h,074h,000h,000h,000h,083h,000h,0ffh,000h,0ffh,0ffh,0ffh,000h	; 943e  ....t...........
	defb 01fh,0f0h,01dh,0f0h,01fh,0f0h,01dh,0f0h,01dh,0f0h,03dh,0f0h,0fdh,0f0h,0ffh,000h	; 944e  ..........=.....

; ----------------------------------------------------------------------
; DATOS dibujo_945E: 1 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 26 de la lista 0x8F35 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (24 bytes)
;   0x945e..0x9476  (24 bytes)
DATA_dibujo_945E:
	defb 0ffh,0ffh,0ffh,027h,037h,06fh,057h,04fh,047h,017h,00fh,0a7h,017h,00fh,067h,017h,00fh,067h,017h,00fh,067h,0e7h,0f7h,0efh	; 945e  ...'7oWOG.....g..g..g...

; ----------------------------------------------------------------------
; DATOS dibujo_9476: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 27 de la lista 0x8F35 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (16 bytes)
;   0x9476..0x9486  (16 bytes)
DATA_dibujo_9476:
	defb 0ffh,0ffh,0f7h,0efh,0efh,0e7h,0efh,0e7h,0efh,0e7h,0efh,0e7h,0efh,0e7h,0f7h,0efh	; 9476  ................

; ----------------------------------------------------------------------
; DATOS dibujo_9486: 3 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 28 de la lista 0x8F35 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (72 bytes)
;   0x9486..0x94ce  (72 bytes)
DATA_dibujo_9486:
	defb 02dh,025h,0c2h,02dh,067h,080h,059h,05fh,0a0h,003h,0bfh,040h,005h,07dh,082h,009h,07bh,084h,011h,077h,088h,0ffh,0ffh,000h	; 9486  -%.-g.Y_...@.}..{..w....
	defb 000h,0ffh,000h,0ffh,0feh,0ffh,089h,0f6h,0ffh,0adh,0d2h,0ffh,0f3h,08ch,0f3h,0ffh,080h,0ffh,0f3h,08ch,0f3h,0ffh,080h,0ffh	; 949e  ........................
	defb 028h,04fh,0bfh,028h,04fh,0b0h,024h,04fh,0b0h,024h,04fh,0b0h,026h,04bh,0b4h,026h,04bh,0b4h,025h,049h,0b6h,025h,049h,0b6h	; 94b6  (O.(O.$O.$O.&K.&K.%I.%I.

; ----------------------------------------------------------------------
; DATOS dibujo_94CE: 1 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 29 de la lista 0x8F35 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (24 bytes)
;   0x94ce..0x94e6  (24 bytes)
DATA_dibujo_94CE:
	defb 0eeh,000h,010h,090h,003h,04dh,0a0h,003h,01dh,040h,003h,0bdh,080h,003h,079h,084h,003h,075h,08ch,003h,065h,014h,013h,005h	; 94ce  .....M...@....y..u..e...

; ----------------------------------------------------------------------
; DATOS dibujo_94E6: 1 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 30 de la lista 0x8F35 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (24 bytes)
;   0x94e6..0x94fe  (24 bytes)
DATA_dibujo_94E6:
	defb 097h,028h,00fh,096h,029h,00fh,094h,02bh,00fh,090h,027h,007h,090h,027h,003h,090h,027h,003h,092h,025h,001h,092h,025h,001h	; 94e6  .(..)..+..'..'..'..%..%.

; ----------------------------------------------------------------------
; DATOS dibujo_94FE: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 31 de la lista 0x8F35 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (16 bytes)
;   0x94fe..0x950e  (16 bytes)
DATA_dibujo_94FE:
	defb 0f0h,0fdh,0f0h,0fdh,0e0h,0edh,0e0h,0edh,0c0h,0edh,0c0h,0edh,080h,0adh,080h,0adh	; 94fe  ................

; ----------------------------------------------------------------------
; DATOS dibujo_950E: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 32 de la lista 0x8F35 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (16 bytes)
;   0x950e..0x951e  (16 bytes)
DATA_dibujo_950E:
	defb 00bh,000h,009h,000h,029h,000h,029h,000h,0a9h,000h,0ffh,0feh,003h,0feh,003h,0feh	; 950e  ....).).........

; ----------------------------------------------------------------------
; DATOS dibujo_951E: 2 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 33 de la lista 0x8F35 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (48 bytes)
;   0x951e..0x954e  (48 bytes)
DATA_dibujo_951E:
	defb 070h,053h,040h,060h,04fh,040h,060h,05fh,040h,060h,05fh,040h,060h,05fh,040h,060h,05fh,040h,0e0h,0dfh,000h,0e0h,0dfh,000h	; 951e  pS@`O@`_@`_@`_@`_@......
	defb 00dh,099h,001h,005h,0f9h,001h,005h,0f9h,001h,005h,0f9h,001h,005h,0f9h,001h,005h,0f9h,001h,007h,0fbh,000h,007h,0fbh,000h	; 9536  ........................

; ----------------------------------------------------------------------
; DATOS dibujo_954E: 2 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 34 de la lista 0x8F35 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (48 bytes)
;   0x954e..0x957e  (48 bytes)
DATA_dibujo_954E:
	defb 040h,07fh,05fh,040h,06fh,05fh,020h,060h,03fh,030h,070h,0bfh,01fh,05fh,01fh,001h,059h,003h,011h,049h,007h,0f7h,0efh,0e7h	; 954e  @._@o_ `?0p.._..Y..I....
	defb 003h,0ffh,0fbh,003h,0f7h,0fbh,005h,005h,0ffh,00fh,00fh,0ffh,0fdh,0fdh,0fdh,021h,039h,063h,011h,009h,067h,0f7h,0efh,0e7h	; 9566  ...............!9c..g...

; ----------------------------------------------------------------------
; DATOS dibujo_957E: 2 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 35 de la lista 0x8F35 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (48 bytes)
;   0x957e..0x95ae  (48 bytes)
DATA_dibujo_957E:
	defb 0eeh,000h,010h,010h,0c0h,00eh,020h,0c0h,05eh,001h,0c1h,07ch,002h,0c0h,078h,024h,0c0h,072h,028h,0c0h,066h,031h,0d1h,060h	; 957e  ...... .^..|..x$.r(.f1.`
	defb 0efh,017h,008h,089h,011h,048h,0a1h,001h,000h,043h,003h,0b0h,085h,005h,07ah,085h,001h,070h,089h,001h,066h,011h,011h,000h	; 9596  .....H...C....z..p..f...

; ----------------------------------------------------------------------
; DATOS dibujo_95AE: 12 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 36 de la lista 0x8F35 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (288 bytes)
;   0x95ae..0x96ce  (288 bytes)
DATA_dibujo_95AE:
	defb 000h,080h,080h,008h,080h,080h,02ah,080h,080h,07fh,080h,080h,000h,000h,0ffh,080h,000h,000h,080h,000h,07fh,0ffh,0ffh,000h	; 95ae  ......*.................
	defb 000h,000h,0ffh,000h,07fh,0ffh,016h,040h,0c0h,002h,040h,0c0h,040h,000h,080h,040h,01eh,08eh,040h,01eh,080h,040h,000h,09eh	; 95c6  .......@..@.@..@..@..@..
	defb 040h,000h,080h,046h,018h,080h,040h,010h,081h,05ch,00ch,08dh,05ch,000h,08dh,050h,000h,081h,040h,000h,09fh,040h,000h,080h	; 95de  @..F..@..\..\..P..@..@..
	defb 000h,007h,04ah,000h,000h,04fh,000h,000h,04fh,000h,000h,04ch,000h,000h,04ch,001h,000h,04ch,001h,000h,04ch,002h,001h,04dh	; 95f6  ..J..O..O..L..L..L..L..M
	defb 000h,0ffh,0ffh,000h,000h,0ffh,000h,000h,0ffh,000h,000h,000h,088h,022h,077h,088h,066h,077h,088h,000h,077h,000h,0ffh,0afh	; 960e  ............."w.fw..w...
	defb 001h,0c1h,0f8h,001h,021h,0f8h,001h,011h,0f8h,001h,011h,034h,081h,011h,034h,001h,011h,034h,081h,011h,036h,081h,011h,036h	; 9626  ....!......4..4..4..6..6
	defb 081h,011h,034h,081h,011h,034h,001h,011h,034h,081h,011h,034h,0c1h,011h,034h,081h,011h,034h,001h,011h,034h,081h,011h,034h	; 963e  ..4..4..4..4..4..4..4..4
	defb 081h,011h,034h,081h,011h,034h,001h,011h,034h,081h,011h,034h,0c1h,011h,034h,001h,011h,034h,081h,011h,034h,001h,021h,0e8h	; 9656  ..4..4..4..4..4..4..4.!.
	defb 000h,0ffh,000h,000h,0ffh,0ffh,07fh,080h,080h,07fh,080h,080h,000h,000h,0ffh,000h,000h,000h,07fh,080h,080h,0ffh,0ffh,000h	; 966e  ........................
	defb 000h,0ffh,000h,000h,0ffh,0ffh,0ffh,000h,000h,0ffh,000h,000h,000h,000h,0ffh,000h,000h,000h,0ffh,000h,000h,0ffh,0ffh,000h	; 9686  ........................
	defb 000h,0feh,000h,000h,0feh,0feh,0feh,000h,000h,0feh,000h,000h,000h,000h,0ffh,000h,000h,000h,0feh,000h,000h,0feh,0feh,000h	; 969e  ........................
	defb 000h,0ffh,0ffh,03fh,000h,0c0h,01fh,00ch,0ech,013h,000h,0ech,013h,00ch,0e0h,033h,000h,0cch,0ffh,000h,000h,000h,000h,0ffh	; 96b6  ...?...........3........

; ----------------------------------------------------------------------
; DATOS dibujo_96CE: 4 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 37 de la lista 0x8F35 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (96 bytes)
;   0x96ce..0x972e  (96 bytes)
DATA_dibujo_96CE:
	defb 04bh,000h,034h,080h,07fh,000h,000h,080h,000h,04bh,0c0h,034h,04ch,0dfh,020h,060h,0dfh,000h,060h,0deh,007h,076h,0feh,00fh	; 96ce  K.4......K.4L. `..`..v..
	defb 0ffh,000h,000h,000h,0ffh,000h,000h,000h,000h,0ffh,000h,000h,000h,0ffh,000h,000h,0ffh,000h,000h,000h,0ffh,0ffh,000h,0ffh	; 96e6  ........................
	defb 0f8h,002h,004h,002h,0fch,000h,002h,000h,000h,0f6h,00ch,000h,066h,0f4h,000h,006h,0f4h,000h,006h,0f4h,0c0h,0feh,0fch,0e0h	; 96fe  ............f...........
	defb 000h,0ffh,000h,097h,000h,068h,000h,0ffh,000h,000h,080h,000h,04fh,0c0h,030h,060h,0cfh,010h,060h,0cfh,010h,07ch,0cfh,000h	; 9716  .....h......O.0`..`..|..

; ----------------------------------------------------------------------
; DATOS dibujo_972E: 5 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 38 de la lista 0x8F35 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (120 bytes)
;   0x972e..0x97a6  (120 bytes)
DATA_dibujo_972E:
	defb 0aeh,041h,071h,098h,020h,079h,0afh,033h,07fh,0b7h,039h,07fh,0bah,03dh,07fh,0adh,03eh,07fh,0b5h,03eh,07fh,0bah,007h,07fh	; 972e  .Aq. y.3..9..=..>..>....
	defb 07ch,003h,087h,018h,084h,0bch,067h,0dfh,0ffh,0cch,0bfh,0ffh,0d3h,0bfh,0ffh,0b7h,0fch,0ffh,0eeh,0b9h,0ffh,0fbh,0f7h,0ffh	; 9746  |.....g.................
	defb 07fh,000h,080h,008h,000h,0fbh,0ffh,0fbh,0ffh,0efh,099h,0ffh,0e7h,0fdh,0ffh,0f5h,07fh,0ffh,07ah,0bfh,0ffh,0dfh,0ffh,0ffh	; 975e  ..................z.....
	defb 0f5h,001h,01bh,061h,001h,0edh,0b9h,07fh,0ffh,077h,0efh,0ffh,04fh,0ffh,0ffh,0ddh,0fdh,0fdh,0f9h,0f9h,0f9h,089h,0f9h,0f9h	; 9776  ...a.....w..O...........
	defb 09dh,07fh,07fh,03bh,07fh,0ffh,07dh,0f3h,0ffh,07ah,0e7h,0ffh,075h,06fh,07fh,06ah,05fh,0ffh,0ffh,05dh,07fh,0fdh,05bh,07fh	; 978e  ......}..z..uo.j_..]..[.

; ----------------------------------------------------------------------
; DATOS dibujo_97A6: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 39 de la lista 0x8F35 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (32 bytes)
;   0x97a6..0x97c6  (32 bytes)
DATA_dibujo_97A6:
	defb 0a9h,056h,012h,0e9h,041h,0bch,092h,04ch,010h,0e6h,049h,0b6h,044h,03bh,025h,09ah	; 97a6  .V..A..L..I.D.%.
	defb 00ch,0e3h,090h,04eh,028h,0d7h,043h,0bch,040h,0abh,004h,0c9h,000h,0ddh,048h,0b6h	; 97b6  ...N(.C.@.....H.

; ----------------------------------------------------------------------
; DATOS dibujo_97C6: 5 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 40 de la lista 0x8F35 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (120 bytes)
;   0x97c6..0x983e  (120 bytes)
DATA_dibujo_97C6:
	defb 07dh,0ceh,0c8h,0fdh,0a6h,0a0h,0fdh,006h,000h,0d9h,06eh,06eh,06dh,0b3h,0b3h,0bbh,055h,051h,0bdh,046h,040h,0d9h,02eh,02ch	; 97c6  }.........nnm...UQ.F@..,
	defb 0f7h,02dh,0adh,0f7h,028h,0a8h,0e8h,02ch,0fah,00ch,03bh,048h,0ffh,000h,000h,000h,031h,04ah,000h,038h,044h,000h,036h,049h	; 97de  .-..(..,...H....1J.8D.6I
	defb 0dfh,028h,028h,0dfh,024h,024h,020h,030h,028h,030h,0efh,020h,0ffh,000h,000h,000h,028h,050h,000h,0c0h,027h,000h,006h,099h	; 97f6  .((.$$ 0(0. ....(P..'...
	defb 0feh,051h,051h,0feh,001h,001h,001h,001h,001h,000h,0ffh,000h,0ffh,000h,000h,000h,0a3h,044h,000h,004h,02ah,000h,038h,0c5h	; 980e  .QQ..............D..*.8.
	defb 0ddh,026h,026h,0fbh,006h,002h,003h,082h,042h,001h,0feh,000h,0ffh,000h,000h,001h,012h,0a4h,001h,0a2h,054h,001h,072h,004h	; 9826  .&&.....B...........T.r.

; ----------------------------------------------------------------------
; DATOS dibujo_983E: 2 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 41 de la lista 0x8F35 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (48 bytes)
;   0x983e..0x986e  (48 bytes)
DATA_dibujo_983E:
	defb 000h,0ffh,000h,0ffh,000h,000h,000h,0ffh,000h,000h,000h,000h,0ffh,000h,000h,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh,000h	; 983e  ........................
	defb 000h,0feh,001h,0feh,001h,000h,002h,0fch,000h,002h,000h,000h,0f6h,00ch,000h,006h,0f4h,000h,006h,0f4h,000h,066h,0f4h,000h	; 9856  .....................f..

; ----------------------------------------------------------------------
; DATOS dibujo_986E: 3 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 42 de la lista 0x8F35 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (48 bytes)
;   0x986e..0x989e  (48 bytes)
DATA_dibujo_986E:
	defb 07fh,0ffh,000h,0bfh,000h,080h,03fh,0bfh,03fh,0bfh,03fh,0bfh,07fh,07fh,03fh,0bfh	; 986e  ......?.?.?...?.
	defb 0ffh,0ffh,000h,0ffh,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 987e  ................
	defb 0feh,0fch,000h,0fah,000h,002h,0fch,0feh,0fch,0feh,0fch,0feh,0fdh,0fdh,0fch,0feh	; 988e  ................

; ----------------------------------------------------------------------
; DATOS dibujo_989E: 4 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 43 de la lista 0x8F35 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (96 bytes)
;   0x989e..0x98fe  (96 bytes)
DATA_dibujo_989E:
	defb 000h,07fh,07fh,040h,0ffh,0c0h,01fh,0ffh,0bfh,037h,0f7h,0b7h,02fh,0e3h,0afh,02bh,0f7h,0abh,023h,0ebh,0a3h,023h,0f7h,0a3h	; 989e  ...@.....7../..+..#..#..
	defb 004h,0dch,0dch,038h,08eh,03ch,0a8h,0deh,0adh,0d0h,0aeh,0d5h,0f0h,08eh,0f5h,098h,0deh,085h,088h,08eh,085h,088h,0deh,085h	; 98b6  ...8.<..................
	defb 023h,0ffh,0a3h,03fh,0ffh,0a1h,03fh,0ffh,0b1h,03fh,0ffh,0bfh,05fh,0ffh,0dfh,000h,0ffh,0ffh,000h,07fh,000h,000h,000h,03fh	; 98ce  #..?..?..?.._..........?
	defb 0d8h,0aeh,0d5h,0b8h,08eh,0b5h,0f0h,0deh,0a5h,0f0h,0feh,085h,0f8h,0feh,0fdh,004h,0feh,0fdh,000h,0fch,003h,000h,000h,0feh	; 98e6  ........................

; ----------------------------------------------------------------------
; DATOS dibujo_98FE: 5 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 44 de la lista 0x8F35 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (120 bytes)
;   0x98fe..0x9976  (120 bytes)
DATA_dibujo_98FE:
	defb 05fh,020h,07fh,02fh,0d0h,07fh,017h,0e8h,03fh,00bh,0f4h,01fh,085h,07ah,08fh,04fh,0b7h,048h,02fh,0dch,020h,01fh,0ebh,010h	; 98fe  _ ./....?....z.O.H/. ...
	defb 00fh,0fbh,000h,00fh,0f8h,000h,00fh,0feh,000h,009h,0f9h,000h,00bh,0f9h,000h,00bh,0f9h,000h,00bh,0f9h,000h,08bh,0f9h,080h	; 9916  ........................
	defb 0dfh,003h,001h,0cfh,003h,001h,08fh,003h,001h,087h,003h,001h,087h,003h,001h,087h,003h,031h,0c7h,003h,031h,09fh,007h,063h	; 992e  .................1..1..c
	defb 07ah,0f1h,0f8h,009h,0f0h,0f8h,009h,0d0h,0d8h,00fh,0f0h,0d8h,002h,0fdh,0f8h,0a0h,05fh,0fch,0f8h,007h,0ffh,000h,0ffh,000h	; 9946  z..............._.......
	defb 0c0h,0efh,0feh,020h,0f1h,03eh,010h,0f1h,01eh,0d1h,03bh,0dch,010h,0ffh,0dah,018h,0f5h,0deh,018h,0f5h,0deh,01fh,0f1h,0deh	; 995e  ... .>..................

; ----------------------------------------------------------------------
; DATOS dibujo_9976: 1 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 45 de la lista 0x8F35 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (24 bytes)
;   0x9976..0x998e  (24 bytes)
DATA_dibujo_9976:
	defb 001h,0feh,001h,0fch,0ffh,003h,0f8h,07fh,007h,0f0h,07fh,00fh,0a0h,03fh,01fh,0a0h,03fh,01fh,090h,01fh,02fh,090h,01fh,02fh	; 9976  .............?..?.../../

; ----------------------------------------------------------------------
; DATOS dibujo_998E: 1 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 46 de la lista 0x8F35 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (24 bytes)
;   0x998e..0x99a6  (24 bytes)
DATA_dibujo_998E:
	defb 0ffh,0ffh,000h,001h,000h,000h,003h,001h,001h,007h,001h,001h,00dh,003h,003h,01dh,003h,003h,03dh,007h,007h,07dh,007h,007h	; 998e  ..................=..}..

; ----------------------------------------------------------------------
; DATOS dibujo_99A6: 2 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 47 de la lista 0x8F35 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (48 bytes)
;   0x99a6..0x99d6  (48 bytes)
DATA_dibujo_99A6:
	defb 000h,000h,000h,0ffh,0ffh,000h,000h,0d6h,029h,000h,000h,0ffh,000h,000h,0ffh,000h,00ah,0eah,000h,000h,0ffh,000h,00ah,0eah	; 99a6  ........)...............
	defb 000h,001h,001h,0fch,0fdh,003h,000h,0a9h,057h,000h,021h,0dfh,000h,001h,0ffh,000h,001h,0ffh,000h,001h,0ffh,000h,001h,0ffh	; 99be  ........W.!.............

; ----------------------------------------------------------------------
; DATOS dibujo_99D6: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 48 de la lista 0x8F35 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (16 bytes)
;   0x99d6..0x99e6  (16 bytes)
DATA_dibujo_99D6:
	defb 000h,000h,081h,07fh,000h,000h,081h,07fh,000h,000h,081h,07fh,000h,000h,081h,07fh	; 99d6  ................

; ----------------------------------------------------------------------
; DATOS dibujo_99E6: 3 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 0 de la lista 0x902B (p00:4D92, p00:4DF5); lo leen p00:4C0C (24
;   bytes)
;   0x99e6..0x99fe  (24 bytes)
DATA_dibujo_99E6:
	defb 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0ffh	; 99e6  ........
	defb 000h,000h,000h,000h,000h,000h,000h,0ffh	; 99ee  ........
	defb 000h,00ch,000h,000h,00ch,000h,000h,0ffh	; 99f6  ........

; ----------------------------------------------------------------------
; DATOS dibujo_99FE: 3 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 1 de la lista 0x902B (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (48 bytes)
;   0x99fe..0x9a2e  (48 bytes)
DATA_dibujo_99FE:
	defb 080h,03fh,080h,03fh,080h,03fh,080h,03fh,080h,03fh,080h,03fh,080h,03fh,0ffh,000h	; 99fe  .?.?.?.?.?.?.?..
	defb 080h,03fh,098h,027h,080h,03fh,080h,03fh,098h,027h,080h,03fh,080h,03fh,0ffh,000h	; 9a0e  .?.'.?.?.'.?.?..
	defb 0ffh,03fh,0dfh,03fh,0cfh,03fh,0c7h,03fh,0c3h,03fh,0c1h,03fh,0ffh,000h,0ffh,000h	; 9a1e  .?.?.?.?.?.?....

; ----------------------------------------------------------------------
; DATOS dibujo_9A2E: 5 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 2 de la lista 0x902B (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (80 bytes)
;   0x9a2e..0x9a7e  (80 bytes)
DATA_dibujo_9A2E:
	defb 040h,07fh,058h,067h,040h,07fh,040h,07fh,058h,067h,040h,07fh,07fh,000h,000h,000h	; 9a2e  @.Xg@.@.Xg@.....
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,0ffh,000h,000h,000h	; 9a3e  ................
	defb 000h,0ffh,00ch,0f3h,000h,0ffh,000h,0ffh,00ch,0f3h,000h,0ffh,0ffh,000h,000h,000h	; 9a4e  ................
	defb 040h,07fh,040h,07fh,040h,07fh,040h,07fh,040h,07fh,040h,07fh,07fh,000h,000h,000h	; 9a5e  @.@.@.@.@.@.....
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,0ffh,000h,000h,000h	; 9a6e  ................

; ----------------------------------------------------------------------
; DATOS dibujo_9A7E: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 3 de la lista 0x902B (p00:4D92, p00:4DF5); lo leen p00:4C0C (8
;   bytes)
;   0x9a7e..0x9a86  (8 bytes)
DATA_dibujo_9A7E:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9a7e  ........

; ----------------------------------------------------------------------
; DATOS dibujo_9A86: 21 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 4 de la lista 0x902B (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (336 bytes)
;   0x9a86..0x9bd6  (336 bytes)
DATA_dibujo_9A86:
	defb 000h,0ffh,0efh,067h,0efh,067h,0efh,060h,0e0h,06fh,0eeh,066h,0eeh,066h,0eeh,066h	; 9a86  ...g.g.`.o.f.f.f
	defb 000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,0ffh,0ffh,07fh,0ffh,07fh,0ffh,000h	; 9a96  ................
	defb 000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h	; 9aa6  ................
	defb 00ch,0e6h,0ech,0e6h,0ech,0e6h,0ech,006h,00ch,0e6h,0ech,0e6h,0ech,0e6h,0ech,006h	; 9ab6  ................
	defb 0eeh,066h,0eeh,066h,0eeh,066h,0eeh,066h,0eeh,066h,0eeh,066h,0eeh,066h,0eeh,066h	; 9ac6  .f.f.f.f.f.f.f.f
	defb 000h,0ffh,0efh,067h,0efh,067h,0efh,060h,0e0h,060h,0efh,06fh,0ebh,06fh,0e8h,06fh	; 9ad6  ...g.g.`.`.o.o.o
	defb 000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,000h,0ffh,0ffh,0ffh,0ffh,000h,0ffh	; 9ae6  ................
	defb 00ch,0e6h,0ech,0e6h,0ech,0e6h,0ech,006h,00ch,006h,0fch,0feh,0fch,0feh,000h,0feh	; 9af6  ................
	defb 0e8h,06eh,0e8h,06eh,0e8h,06eh,0e8h,06eh,0e8h,06eh,0e8h,06eh,0e8h,06eh,0e8h,06eh	; 9b06  .n.n.n.n.n.n.n.n
	defb 000h,0ffh,0ffh,07fh,0ffh,07fh,0ffh,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h	; 9b16  ................
	defb 0eeh,066h,0eeh,066h,0eeh,066h,0eeh,066h,0e0h,06fh,0efh,067h,0efh,067h,0efh,060h	; 9b26  .f.f.f.f.o.g.g.`
	defb 0e8h,06eh,0e8h,06fh,0ebh,06ch,0efh,06fh,0e0h,060h,0efh,067h,0efh,067h,0efh,060h	; 9b36  .n.o.l.o.`.g.g.`
	defb 000h,000h,000h,0ffh,0ffh,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,000h	; 9b46  ................
	defb 000h,000h,000h,0feh,0fch,006h,0fch,0f6h,00ch,006h,0ech,0e6h,0ech,0e6h,0ech,006h	; 9b56  ................
	defb 000h,000h,000h,0ffh,0ffh,0ffh,0ffh,000h,000h,000h,000h,0ffh,07fh,0ffh,07fh,0ffh	; 9b66  ................
	defb 000h,000h,000h,0ffh,0ffh,0ffh,0ffh,000h,000h,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh	; 9b76  ................
	defb 080h,000h,080h,03fh,0bfh,000h,0bfh,03fh,080h,000h,0bfh,03fh,0bfh,03fh,0bfh,000h	; 9b86  ...?...?...?.?..
	defb 001h,000h,003h,0fch,0ffh,000h,0ffh,0f6h,003h,000h,0ffh,0fah,0ffh,0f4h,0ffh,000h	; 9b96  ................
	defb 001h,000h,000h,0ffh,0ffh,000h,0ffh,0fch,001h,000h,0ffh,0ffh,0ffh,0feh,0ffh,000h	; 9ba6  ................
	defb 000h,000h,000h,0ffh,0ffh,000h,0ffh,0fbh,001h,000h,0ffh,0fdh,0ffh,0f9h,0ffh,000h	; 9bb6  ................
	defb 000h,000h,000h,0ffh,0ffh,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,000h	; 9bc6  ................

; ----------------------------------------------------------------------
; DATOS dibujo_9BD6: 9 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 5 de la lista 0x902B (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (144 bytes)
;   0x9bd6..0x9c66  (144 bytes)
DATA_dibujo_9BD6:
	defb 000h,000h,0bfh,0ffh,080h,0ffh,0bfh,0ffh,080h,0bfh,080h,0bfh,09fh,0c0h,080h,0c0h	; 9bd6  ................
	defb 080h,0c0h,08fh,0dfh,080h,0dfh,08fh,0dfh,080h,0cfh,080h,0cfh,097h,0c0h,090h,0c0h	; 9be6  ................
	defb 080h,0d0h,083h,0d7h,080h,0d7h,083h,0d7h,088h,0d3h,088h,0d3h,089h,0d0h,088h,0d0h	; 9bf6  ................
	defb 000h,000h,0ffh,0ffh,000h,0ffh,0ffh,0ffh,000h,0ffh,000h,0ffh,0ffh,000h,000h,000h	; 9c06  ................
	defb 000h,000h,0ffh,0ffh,000h,0ffh,0e7h,0e7h,000h,0dbh,000h,0e7h,0ffh,000h,000h,000h	; 9c16  ................
	defb 000h,000h,0f3h,0ffh,000h,0f3h,0f3h,0fbh,000h,0ffh,000h,0ffh,0ffh,000h,000h,000h	; 9c26  ................
	defb 08ah,0d0h,08ah,0d0h,08ah,0d0h,08ah,0d0h,08ah,0d0h,08ah,0d0h,08ah,0d0h,08ah,0d0h	; 9c36  ................
	defb 07fh,0ffh,07fh,0ffh,07fh,0ffh,000h,000h,000h,0ffh,0ffh,0ffh,0ffh,000h,000h,000h	; 9c46  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,000h,0ffh,0ffh,0ffh,0ffh,000h,000h,000h	; 9c56  ................

; ----------------------------------------------------------------------
; DATOS dibujo_9C66: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 6 de la lista 0x902B (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (16 bytes)
;   0x9c66..0x9c76  (16 bytes)
DATA_dibujo_9C66:
	defb 097h,099h,097h,099h,097h,099h,097h,099h,097h,099h,097h,099h,097h,099h,097h,099h	; 9c66  ................

; ----------------------------------------------------------------------
; DATOS dibujo_9C76: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 7 de la lista 0x902B (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (32 bytes)
;   0x9c76..0x9c96  (32 bytes)
DATA_dibujo_9C76:
	defb 0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,0ffh,000h,080h,080h,080h,080h,0ffh,0ffh	; 9c76  ................
	defb 0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,0ffh,000h,000h,000h,000h,000h,0ffh,0ffh	; 9c86  ................

; ----------------------------------------------------------------------
; DATOS dibujo_9C96: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 8 de la lista 0x902B (p00:4D92, p00:4DF5); lo leen p00:4C0C (8
;   bytes)
;   0x9c96..0x9c9e  (8 bytes)
DATA_dibujo_9C96:
	defb 000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9c96  ........

; ----------------------------------------------------------------------
; DATOS dibujo_9C9E: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 9 de la lista 0x902B (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (32 bytes)
;   0x9c9e..0x9cbe  (32 bytes)
DATA_dibujo_9C9E:
	defb 0ffh,000h,0ffh,000h,0ffh,0ffh,0bfh,0c3h,0bfh,0c3h,0bfh,0c3h,0bfh,0c3h,0ffh,0ffh	; 9c9e  ................
	defb 0feh,000h,0feh,000h,0ffh,0ffh,0bfh,0c3h,0bfh,0c3h,0bfh,0c3h,0bfh,0c3h,0ffh,0ffh	; 9cae  ................

; ----------------------------------------------------------------------
; DATOS dibujo_9CBE: 4 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 10 de la lista 0x902B (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (64 bytes)
;   0x9cbe..0x9cfe  (64 bytes)
DATA_dibujo_9CBE:
	defb 0ffh,0ffh,080h,080h,0bfh,080h,0bfh,080h,0a2h,09dh,0a5h,09ah,0bfh,080h,0bfh,089h	; 9cbe  ................
	defb 0ffh,0ffh,001h,001h,0ffh,001h,0ffh,001h,027h,0d9h,057h,0a9h,0ffh,001h,0ffh,051h	; 9cce  ........'.W....Q
	defb 0bfh,080h,0bfh,08bh,0bfh,080h,0bfh,08dh,0bfh,080h,0bfh,08dh,0bfh,080h,0ffh,0ffh	; 9cde  ................
	defb 0ffh,001h,0ffh,061h,0ffh,001h,0ffh,051h,0ffh,001h,0ffh,0b1h,0ffh,001h,0ffh,0ffh	; 9cee  ...a...Q........

; ----------------------------------------------------------------------
; DATOS dibujo_9CFE: 17 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 11 de la lista 0x902B (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (408 bytes)
;   0x9cfe..0x9e96  (408 bytes)
DATA_dibujo_9CFE:
	defb 07fh,0ffh,000h,06fh,0dfh,030h,067h,0d7h,030h,067h,0d7h,030h,067h,0d7h,030h,047h,0f7h,030h,047h,0c7h,000h,07fh,0ffh,000h	; 9cfe  ...o.0g.0g.0g.0G.0G.....
	defb 000h,000h,000h,03fh,03fh,040h,000h,07fh,000h,03fh,03fh,040h,000h,07fh,000h,000h,07fh,000h,07fh,000h,000h,000h,000h,000h	; 9d16  ...??@...??@............
	defb 0ffh,0ffh,0ffh,019h,011h,011h,019h,011h,011h,019h,011h,011h,0f9h,0f1h,0f1h,011h,0f7h,019h,011h,0f7h,019h,0f5h,0f7h,019h	; 9d2e  ........................
	defb 0ffh,0ffh,0ffh,018h,010h,010h,018h,010h,010h,018h,010h,010h,01fh,01fh,01fh,017h,017h,019h,017h,017h,019h,017h,017h,019h	; 9d46  ........................
	defb 02eh,05ah,001h,02eh,05ah,001h,02eh,05ah,001h,02eh,05ah,001h,02eh,05ah,001h,02eh,05ah,001h,02eh,05ah,001h,02eh,05ah,001h	; 9d5e  .Z..Z..Z..Z..Z..Z..Z..Z.
	defb 000h,000h,000h,0fch,0feh,001h,000h,0feh,001h,0fch,0feh,001h,000h,0fch,001h,000h,0fch,001h,0fch,000h,001h,000h,000h,001h	; 9d76  ........................
	defb 002h,002h,001h,0f2h,0fah,001h,002h,0fah,001h,0f2h,0fah,001h,006h,0f2h,001h,006h,0f2h,001h,0f6h,002h,001h,006h,002h,001h	; 9d8e  ........................
	defb 00eh,00ah,001h,0ceh,0eah,001h,00eh,0eah,001h,0ceh,0eah,001h,00eh,0dah,001h,00eh,0dah,001h,0ceh,01ah,001h,00eh,01ah,001h	; 9da6  ........................
	defb 02eh,01ah,001h,02eh,09ah,001h,02eh,09ah,001h,02eh,09ah,001h,02eh,05ah,001h,02eh,05ah,001h,02eh,05ah,001h,02eh,05ah,001h	; 9dbe  .............Z..Z..Z..Z.
	defb 000h,000h,000h,0e0h,0f7h,000h,017h,0e7h,000h,0e4h,0f4h,003h,014h,0e4h,002h,014h,0e4h,002h,0e4h,004h,002h,004h,004h,002h	; 9dd6  ........................
	defb 000h,000h,000h,015h,0e5h,002h,0f0h,0e7h,000h,035h,025h,0c2h,030h,027h,040h,030h,027h,040h,037h,020h,040h,030h,020h,040h	; 9dee  .........5%.0'@0'@7 @0 @
	defb 004h,004h,002h,0e4h,0f4h,002h,014h,0e4h,002h,0e4h,0f4h,002h,014h,0e4h,002h,014h,0e4h,002h,0e4h,004h,002h,004h,004h,002h	; 9e06  ........................
	defb 004h,004h,002h,0e4h,0f4h,002h,014h,0e4h,002h,0e4h,0f4h,002h,014h,0e5h,002h,015h,0e5h,002h,0e7h,000h,000h,000h,000h,000h	; 9e1e  ........................
	defb 030h,020h,040h,035h,025h,042h,030h,027h,040h,035h,025h,042h,030h,027h,040h,030h,027h,040h,037h,020h,040h,030h,020h,040h	; 9e36  0 @5%B0'@5%B0'@0'@7 @0 @
	defb 030h,020h,040h,035h,025h,042h,030h,027h,040h,035h,025h,042h,030h,0a7h,040h,0b0h,0a7h,040h,0f7h,000h,000h,000h,000h,000h	; 9e4e  0 @5%B0'@5%B0.@..@......
	defb 07fh,0ffh,00fh,07eh,0ffh,01fh,07dh,0ffh,01fh,07bh,0ffh,01fh,07eh,0ffh,01fh,07fh,0efh,00fh,06fh,0f0h,000h,070h,0ffh,000h	; 9e66  ...~..}..{..~.....o..p..
	defb 07fh,0ffh,0f0h,0cfh,0ffh,0f8h,09fh,0ffh,0f8h,03fh,0ffh,0f8h,07fh,0ffh,0f8h,0ffh,0f7h,0f0h,0f7h,00fh,000h,00fh,0ffh,000h	; 9e7e  .........?..............

; ----------------------------------------------------------------------
; DATOS dibujo_9E96: 5 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 0 de la lista 0x9068 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (80 bytes)
;   0x9e96..0x9ee6  (80 bytes)
DATA_dibujo_9E96:
	defb 01fh,020h,01fh,024h,01bh,062h,01dh,0c0h,03fh,0c0h,01fh,062h,00dh,054h,00bh,010h	; 9e96  . .$.b..?..b.T..
	defb 00fh,000h,007h,00ah,005h,00ch,003h,018h,00fh,070h,03fh,0c4h,03bh,0a2h,01dh,040h	; 9ea6  .........p?....@
	defb 07fh,000h,03fh,022h,01dh,044h,01bh,000h,00fh,000h,00fh,044h,00bh,022h,005h,000h	; 9eb6  ..?".D.....D."..
	defb 01fh,020h,01fh,024h,01bh,062h,03dh,0c0h,03fh,0c0h,01fh,062h,00dh,054h,00bh,010h	; 9ec6  . .$.b=.?..b.T..
	defb 000h,080h,000h,080h,080h,060h,0c0h,020h,0e0h,011h,0f0h,04fh,0bbh,022h,0ddh,000h	; 9ed6  .....`. ...O."..

; ----------------------------------------------------------------------
; DATOS dibujo_9EE6: 16 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 1 de la lista 0x9068 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (256 bytes)
;   0x9ee6..0x9fe6  (256 bytes)
DATA_dibujo_9EE6:
	defb 0fbh,01bh,0f7h,006h,0f3h,002h,0fdh,00ch,0fbh,002h,0f7h,014h,0ffh,01eh,0f7h,014h	; 9ee6  ................
	defb 0ffh,020h,0ffh,0c8h,05fh,04ch,03bh,028h,0ffh,068h,0d9h,040h,0ffh,0c0h,0ffh,040h	; 9ef6  . .._L.(.h.@...@
	defb 07bh,01bh,077h,046h,093h,082h,0fdh,00ch,0fbh,002h,0f7h,014h,0ffh,01eh,0f7h,014h	; 9f06  {.wF............
	defb 0ffh,000h,0fdh,00ah,0ffh,00ch,0fbh,008h,0ffh,008h,0f9h,000h,0ffh,000h,0ffh,000h	; 9f16  ................
	defb 0fdh,038h,0b7h,090h,0ffh,0dah,06dh,000h,0dfh,091h,09dh,000h,0ffh,003h,075h,051h	; 9f26  .8....m.......uQ
	defb 0f5h,061h,07fh,06ah,0ffh,049h,0efh,082h,0dfh,09ah,0ebh,022h,0dfh,018h,0efh,008h	; 9f36  .a.j.I....."....
	defb 0fdh,038h,0b7h,090h,0ffh,0dah,06dh,000h,0dfh,090h,09fh,000h,0ffh,000h,077h,050h	; 9f46  .8....m.......wP
	defb 05bh,002h,0ffh,034h,0efh,020h,0efh,0e0h,09fh,010h,0ffh,030h,0ffh,060h,0bfh,020h	; 9f56  [..4. .....0.`.
	defb 0ffh,06ch,0d3h,002h,0fdh,004h,0dfh,04eh,0d7h,040h,0fbh,040h,0dfh,004h,0fbh,002h	; 9f66  .l.....N.@.@....
	defb 0f3h,003h,0fdh,005h,0feh,006h,0fah,000h,0ffh,003h,0f7h,000h,0ffh,002h,0fdh,00dh	; 9f76  ................
	defb 07fh,000h,07fh,040h,09fh,080h,0f1h,00eh,0e0h,01fh,0c0h,03fh,000h,0ffh,000h,0ffh	; 9f86  ...@.......?....
	defb 0ffh,000h,0ffh,008h,0ffh,00ch,0fbh,008h,0ffh,008h,079h,080h,01fh,0e0h,000h,0ffh	; 9f96  ..........y.....
	defb 0b8h,047h,0f8h,017h,0bch,05bh,05eh,099h,0feh,001h,0fch,003h,0f0h,00fh,080h,07fh	; 9fa6  .G...[^.........
	defb 00dh,0f5h,007h,0fah,007h,0f9h,00fh,0f6h,00bh,0f2h,00bh,0f2h,017h,0e4h,01fh,0e0h	; 9fb6  ................
	defb 0bdh,040h,0fdh,011h,0beh,05ah,05ch,094h,0fbh,003h,0f9h,000h,0ffh,003h,089h,071h	; 9fc6  .@...Z\........q
	defb 0f0h,06fh,0d0h,00fh,0f0h,00fh,0d0h,04fh,0d0h,04fh,0f0h,04fh,0d0h,00fh,060h,09fh	; 9fd6  .o.....O.O.O..`.

; ----------------------------------------------------------------------
; DATOS dibujo_9FE6: 5 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 2 de la lista 0x9068 (p00:4D92, p00:4DF5) (sigue en el banco
;   41, en 0xA000); lo leen p00:4C0C (26 bytes)
;   0x9fe6..0xa000  (26 bytes)
DATA_dibujo_9FE6:
	defb 0dfh,0d8h,073h,030h,0efh,008h,03bh,004h,0f3h,0c0h,0ffh,000h,0ffh,040h,0ffh,000h	; 9fe6  ..s0.........@..
	defb 06bh,02bh,0dah,012h,0fch,000h,0dfh,0b1h,0dbh,020h	; 9ff6  k+.......
