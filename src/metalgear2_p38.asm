; ==========================================================================
; METAL GEAR 2 SOLID SNAKE - Konami (1990) - MSX2 - MegaROM RC-767 de 512 KB (Konami SCC) - banco 38 (se ejecuta en 0x8000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x08000


; ----------------------------------------------------------------------
; DATOS lista_8000: 17 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x0000); lo leen p00:4C0C (86 bytes)
;   0x8000..0x8056  (86 bytes)
DATA_lista_8000:
	defb 063h,000h,001h,02ah,083h	; 8000
	defb 048h,001h,024h,05ah,085h	; 8005
	defb 086h,002h,02ch,0dah,085h	; 800a
	defb 001h,003h,05dh,032h,08ah	; 800f
	defb 041h,003h,05fh,04ah,08ah	; 8014
	defb 042h,003h,035h,0b2h,086h	; 8019
	defb 041h,003h,05eh,03ah,08ah	; 801e
	defb 041h,004h,037h,0d2h,086h	; 8023
	defb 087h,003h,038h,0e2h,086h	; 8028
	defb 085h,002h,03fh,08ah,087h	; 802d
	defb 042h,006h,044h,002h,088h	; 8032
	defb 043h,001h,046h,022h,088h	; 8037
	defb 094h,001h,049h,052h,088h	; 803c
	defb 090h,001h,060h,05ah,08ah	; 8041
	defb 089h,001h,072h,0dah,08bh	; 8046
	defb 044h,007h,07ch,0b2h,08ch	; 804b
	defb 083h,001h,032h,06ah,086h	; 8050
	defb 0ffh	; 8055

; ----------------------------------------------------------------------
; DATOS lista_8056: 25 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x0000); lo leen p00:4C0C (126 bytes)
;   0x8056..0x80d4  (126 bytes)
DATA_lista_8056:
	defb 04ch,001h,081h,0f2h,08ch	; 8056
	defb 001h,002h,090h,0b2h,08dh	; 805b
	defb 045h,005h,091h,0bah,08dh	; 8060
	defb 041h,000h,096h,00ah,08eh	; 8065
	defb 084h,001h,097h,01ah,08eh	; 806a
	defb 090h,000h,0a0h,07ah,08eh	; 806f
	defb 001h,008h,0c0h,0fah,08fh	; 8074
	defb 041h,008h,0c1h,002h,090h	; 8079
	defb 084h,008h,0c2h,012h,090h	; 807e
	defb 084h,009h,0c6h,072h,090h	; 8083
	defb 083h,011h,0cah,0d2h,090h	; 8088
	defb 042h,001h,0d0h,01ah,091h	; 808d
	defb 041h,00ah,0d2h,03ah,091h	; 8092
	defb 084h,004h,0d3h,04ah,091h	; 8097
	defb 084h,006h,0d7h,0aah,091h	; 809c
	defb 041h,00bh,0e0h,00ah,092h	; 80a1
	defb 083h,01ah,0e1h,01ah,092h	; 80a6
	defb 043h,00ch,0e4h,062h,092h	; 80ab
	defb 042h,00bh,0e7h,092h,092h	; 80b0
	defb 001h,001h,0f0h,0b2h,092h	; 80b5
	defb 049h,00dh,0f1h,0bah,092h	; 80ba
	defb 082h,00dh,0fah,04ah,093h	; 80bf
	defb 043h,007h,0fch,07ah,093h	; 80c4
	defb 081h,01ah,0e9h,0aah,093h	; 80c9
	defb 083h,010h,0eah,0c2h,093h	; 80ce
	defb 0ffh	; 80d3

; ----------------------------------------------------------------------
; DATOS lista_80D4: 26 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x0000); lo leen p00:4C0C (131 bytes)
;   0x80d4..0x8157  (131 bytes)
DATA_lista_80D4:
	defb 050h,001h,001h,00ah,094h	; 80d4
	defb 042h,00eh,011h,00ah,095h	; 80d9
	defb 09ah,00fh,013h,02ah,095h	; 80de
	defb 082h,00ch,02dh,09ah,097h	; 80e3
	defb 081h,00eh,02fh,0cah,097h	; 80e8
	defb 041h,001h,030h,0e2h,097h	; 80ed
	defb 084h,001h,034h,0f2h,097h	; 80f2
	defb 001h,000h,050h,052h,098h	; 80f7
	defb 001h,00ah,051h,05ah,098h	; 80fc
	defb 04fh,001h,052h,062h,098h	; 8101
	defb 087h,005h,061h,052h,099h	; 8106
	defb 081h,009h,068h,0fah,099h	; 810b
	defb 085h,007h,069h,012h,09ah	; 8110
	defb 001h,008h,040h,0fah,08fh	; 8115
	defb 041h,008h,041h,002h,090h	; 811a
	defb 084h,008h,042h,012h,090h	; 811f
	defb 084h,009h,046h,072h,090h	; 8124
	defb 083h,011h,04ah,0d2h,090h	; 8129
	defb 042h,001h,04dh,01ah,091h	; 812e
	defb 041h,00ah,04fh,03ah,091h	; 8133
	defb 084h,004h,038h,04ah,091h	; 8138
	defb 084h,006h,03ch,0aah,091h	; 813d
	defb 001h,001h,070h,0b2h,092h	; 8142
	defb 049h,00dh,071h,0bah,092h	; 8147
	defb 082h,00dh,07ah,04ah,093h	; 814c
	defb 043h,007h,07ch,07ah,093h	; 8151
	defb 0ffh	; 8156

; ----------------------------------------------------------------------
; DATOS lista_8157: 14 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x0000); lo leen p00:4C0C (71 bytes)
;   0x8157..0x819e  (71 bytes)
DATA_lista_8157:
	defb 042h,001h,0d0h,01ah,091h	; 8157
	defb 041h,00ah,0d2h,03ah,091h	; 815c
	defb 084h,004h,0d3h,04ah,091h	; 8161
	defb 084h,006h,0d7h,0aah,091h	; 8166
	defb 041h,00bh,0dfh,00ah,092h	; 816b
	defb 083h,01ah,0e0h,01ah,092h	; 8170
	defb 043h,00ch,0e3h,062h,092h	; 8175
	defb 042h,00bh,0e6h,092h,092h	; 817a
	defb 081h,01ah,0e8h,0aah,093h	; 817f
	defb 083h,010h,0e9h,0c2h,093h	; 8184
	defb 001h,001h,0f0h,0b2h,092h	; 8189
	defb 049h,00dh,0f1h,0bah,092h	; 818e
	defb 082h,00dh,0fah,04ah,093h	; 8193
	defb 043h,007h,0fch,07ah,093h	; 8198
	defb 0ffh	; 819d

; ----------------------------------------------------------------------
; DATOS lista_819E: 24 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x0000); lo leen p00:4C0C (121 bytes)
;   0x819e..0x8217  (121 bytes)
DATA_lista_819E:
	defb 04fh,001h,031h,08ah,09ah	; 819e
	defb 091h,005h,040h,07ah,09bh	; 81a3
	defb 081h,003h,051h,02ah,09dh	; 81a8
	defb 041h,001h,052h,042h,09dh	; 81ad
	defb 050h,001h,001h,00ah,094h	; 81b2
	defb 042h,00eh,011h,00ah,095h	; 81b7
	defb 09ah,00fh,013h,02ah,095h	; 81bc
	defb 082h,00ch,02dh,09ah,097h	; 81c1
	defb 081h,00eh,02fh,0cah,097h	; 81c6
	defb 041h,001h,030h,0e2h,097h	; 81cb
	defb 042h,001h,054h,01ah,091h	; 81d0
	defb 041h,00ah,056h,03ah,091h	; 81d5
	defb 084h,004h,057h,04ah,091h	; 81da
	defb 084h,006h,05bh,0aah,091h	; 81df
	defb 041h,00bh,05fh,00ah,092h	; 81e4
	defb 083h,01ah,060h,01ah,092h	; 81e9
	defb 043h,00ch,063h,062h,092h	; 81ee
	defb 042h,00bh,066h,092h,092h	; 81f3
	defb 081h,01ah,068h,0aah,093h	; 81f8
	defb 083h,010h,069h,0c2h,093h	; 81fd
	defb 001h,001h,070h,0b2h,092h	; 8202
	defb 049h,00dh,071h,0bah,092h	; 8207
	defb 082h,00dh,07ah,04ah,093h	; 820c
	defb 043h,007h,07ch,07ah,093h	; 8211
	defb 0ffh	; 8216

; ----------------------------------------------------------------------
; DATOS lista_8217: 22 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x0000); lo leen p00:4C0C (111 bytes)
;   0x8217..0x8286  (111 bytes)
DATA_lista_8217:
	defb 044h,001h,081h,052h,09dh	; 8217
	defb 002h,021h,092h,092h,09dh	; 821c
	defb 013h,022h,094h,0a2h,09dh	; 8221
	defb 001h,013h,0a7h,03ah,09eh	; 8226
	defb 005h,001h,0a8h,042h,09eh	; 822b
	defb 003h,021h,0adh,06ah,09eh	; 8230
	defb 003h,005h,0b0h,082h,09eh	; 8235
	defb 05dh,00dh,0b3h,09ah,09eh	; 823a
	defb 048h,001h,0d0h,06ah,0a0h	; 823f
	defb 042h,025h,0d8h,0eah,0a0h	; 8244
	defb 041h,013h,0dah,00ah,0a1h	; 8249
	defb 041h,024h,0dbh,01ah,0a1h	; 824e
	defb 041h,021h,0dch,02ah,0a1h	; 8253
	defb 088h,022h,0ddh,03ah,0a1h	; 8258
	defb 042h,001h,0e5h,01ah,091h	; 825d
	defb 041h,00ah,0e7h,03ah,091h	; 8262
	defb 084h,004h,0e8h,04ah,091h	; 8267
	defb 084h,006h,0ech,0aah,091h	; 826c
	defb 001h,001h,0f0h,0b2h,092h	; 8271
	defb 049h,00dh,0f1h,0bah,092h	; 8276
	defb 082h,00dh,0fah,04ah,093h	; 827b
	defb 043h,007h,0fch,07ah,093h	; 8280
	defb 0ffh	; 8285

; ----------------------------------------------------------------------
; DATOS lista_8286: 1 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x0000); lo leen p00:4C0C (6 bytes)
;   0x8286..0x828c  (6 bytes)
DATA_lista_8286:
	defb 04ch,001h,001h,0f2h,08ch	; 8286
	defb 0ffh	; 828b

; ----------------------------------------------------------------------
; DATOS lista_828C: 6 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x6433); lo leen p00:4C26 (31 bytes)
;   0x828c..0x82ab  (31 bytes)
DATA_lista_828C:
	defb 041h,00dh,043h,00ah,092h	; 828c
	defb 083h,013h,044h,01ah,092h	; 8291
	defb 043h,00eh,047h,062h,092h	; 8296
	defb 042h,00dh,04ah,092h,092h	; 829b
	defb 081h,013h,04ch,0aah,093h	; 82a0
	defb 083h,00fh,04dh,0c2h,093h	; 82a5
	defb 0ffh	; 82aa

; ----------------------------------------------------------------------
; DATOS lista_82AB: 23 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x6648); se solapan 2 bloques: (lista_82D3 82D3-831F); lo leen
;   p00:4C26 (116 bytes)
;   0x82ab..0x831f  (116 bytes)
DATA_lista_82AB:
	defb 063h,00ah,001h,02ah,083h	; 82ab
	defb 048h,000h,024h,05ah,085h	; 82b0
	defb 001h,00ah,060h,052h,098h	; 82b5
	defb 001h,00bh,061h,05ah,098h	; 82ba
	defb 04fh,000h,062h,062h,098h	; 82bf
	defb 087h,00bh,071h,052h,099h	; 82c4
	defb 081h,00ch,078h,0fah,099h	; 82c9
	defb 085h,00dh,079h,012h,09ah	; 82ce
	defb 04ch,000h,081h,0f2h,08ch	; 82d3
	defb 041h,00eh,0e0h,00ah,092h	; 82d8
	defb 083h,02fh,0e1h,01ah,092h	; 82dd
	defb 043h,00fh,0e4h,062h,092h	; 82e2
	defb 042h,00eh,0e7h,092h,092h	; 82e7
	defb 081h,02fh,0e9h,0aah,093h	; 82ec
	defb 083h,010h,0eah,0c2h,093h	; 82f1
	defb 001h,000h,0f0h,0b2h,092h	; 82f6
	defb 049h,011h,0f1h,0bah,092h	; 82fb
	defb 082h,011h,0fah,04ah,093h	; 8300
	defb 043h,00dh,0fch,07ah,093h	; 8305
	defb 04fh,000h,0b1h,08ah,09ah	; 830a
	defb 091h,00bh,0c0h,07ah,09bh	; 830f
	defb 081h,012h,0d1h,02ah,09dh	; 8314
	defb 041h,000h,0d2h,042h,09dh	; 8319
	defb 0ffh	; 831e

; ----------------------------------------------------------------------
; DATOS lista_831F: 2 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x6648); lo leen p00:4C26 (11 bytes)
;   0x831f..0x832a  (11 bytes)
DATA_lista_831F:
	defb 049h,00ah,001h,02ah,083h	; 831f
	defb 048h,000h,024h,05ah,085h	; 8324
	defb 0ffh	; 8329

; ----------------------------------------------------------------------
; DATOS dibujo_832A: 9 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 0 de la lista 0x831F (p00:4D92, p00:4DF5); se solapan 2
;   bloques: (dibujo_832A 832A-855A); lo leen p00:4C26, p00:4C0C (560 bytes)
;   0x832a..0x855a  (560 bytes)
DATA_dibujo_832A:
	defb 000h,000h,000h,0ffh,0ffh,000h,0b9h,044h,0bbh,000h,0efh,010h,0cfh,020h,09bh,044h	; 832a  .......D..... .D
	defb 0bbh,000h,0feh,001h,0fch,002h,0b9h,044h,0bbh,000h,0efh,010h,0cfh,020h,09bh,044h	; 833a  .......D..... .D
	defb 001h,000h,001h,0fch,0fdh,000h,0b9h,044h,0b9h,000h,0edh,010h,0cdh,020h,099h,044h	; 834a  .......D..... .D
	defb 0b9h,000h,0fdh,000h,0fdh,000h,0b9h,044h,0b9h,000h,0edh,010h,0cdh,020h,099h,044h	; 835a  .......D..... .D
	defb 000h,000h,00bh,0efh,0e1h,002h,0a1h,05ah,0b9h,002h,0f9h,002h,0e1h,002h,0a1h,04eh	; 836a  .......Z.......N
	defb 0a7h,008h,0e7h,008h,0e1h,002h,0a1h,05ah,0b9h,002h,0f9h,002h,0e1h,002h,0a1h,04eh	; 837a  .......Z.......N
	defb 000h,000h,058h,0a7h,040h,000h,0a8h,044h,0bah,000h,0eeh,010h,0c3h,020h,082h,044h	; 838a  ..X.@..D..... .D
	defb 08bh,000h,0deh,001h,0fch,002h,099h,044h,09bh,000h,0a5h,010h,083h,020h,083h,044h	; 839a  .......D..... .D
	defb 0b9h,000h,0d2h,001h,0e4h,002h,0a9h,044h,0a3h,000h,0e7h,010h,0c7h,020h,08bh,044h	; 83aa  .......D..... .D
	defb 0ffh,000h,0ffh,07fh,0c0h,07fh,0d2h,07fh,0d2h,06dh,0c0h,07fh,0d0h,07fh,0d0h,06fh	; 83ba  .........m.....o
	defb 0ffh,000h,0ffh,0ffh,000h,0ffh,024h,0ffh,024h,0dbh,000h,0ffh,004h,0ffh,004h,0fbh	; 83ca  ......$.$.......
	defb 0c0h,07fh,0d0h,07fh,0d0h,06fh,0c0h,07fh,0d2h,07fh,0d2h,06dh,0c0h,07fh,0c0h,07fh	; 83da  .....o.....m....
	defb 000h,0ffh,004h,0ffh,004h,0fbh,000h,0ffh,024h,0ffh,024h,0dbh,000h,0ffh,000h,0ffh	; 83ea  ........$.$.....
	defb 000h,000h,03fh,040h,03fh,040h,02dh,052h,02dh,040h,03fh,040h,02fh,050h,02fh,040h	; 83fa  ..?@?@-R-@?@/P/@
	defb 000h,000h,0ffh,000h,0ffh,000h,0dbh,024h,0dbh,000h,0ffh,000h,0fbh,004h,0fbh,000h	; 840a  .......$........
	defb 03fh,040h,02fh,050h,02fh,040h,03fh,040h,02dh,052h,02dh,040h,03fh,040h,03fh,040h	; 841a  ?@/P/@?@-R-@?@?@
	defb 0ffh,000h,0fbh,004h,0fbh,000h,0ffh,000h,0dbh,024h,0dbh,000h,0ffh,000h,0ffh,000h	; 842a  .........$......
	defb 000h,000h,0ffh,040h,0dfh,060h,0cdh,072h,0ddh,060h,0c7h,078h,0d3h,07ch,0d1h,06eh	; 843a  ...@.`.r.`.x.|.n
	defb 000h,000h,07fh,080h,03fh,0c0h,03bh,0e4h,02bh,0d0h,007h,0f8h,007h,0fch,005h,0fah	; 844a  ....?...+.......
	defb 000h,07fh,010h,07fh,010h,06fh,020h,05fh,032h,05fh,02ah,045h,03ch,043h,03eh,041h	; 845a  .....o _2_*E<C>A
	defb 0ffh,000h,0ffh,07fh,0c0h,03fh,0e4h,03fh,0d0h,00bh,0f8h,007h,0fch,007h,0fah,001h	; 846a  .....?.?........
	defb 000h,03fh,000h,01fh,080h,00fh,0c0h,040h,0d2h,060h,0c2h,065h,0c0h,067h,0c0h,067h	; 847a  .?.....@.`.e.g.g
	defb 000h,0ffh,004h,0ffh,004h,0fbh,000h,000h,024h,000h,024h,0dbh,000h,0ffh,000h,0ffh	; 848a  ........$.$.....
	defb 0c0h,07fh,0d0h,07fh,0d0h,06fh,040h,000h,052h,000h,0d2h,06dh,0c0h,07fh,0c0h,07fh	; 849a  .....o@.R..m....
	defb 0ffh,000h,0ffh,07fh,0c0h,07fh,052h,007h,042h,005h,0c0h,067h,0d0h,067h,0c0h,067h	; 84aa  ......R.B..g.g.g
	defb 0c0h,067h,0d0h,067h,0c0h,067h,0c0h,067h,0d2h,067h,0c2h,065h,0c0h,067h,0c0h,067h	; 84ba  .g.g.g.g.g.e.g.g
	defb 0f7h,000h,0e3h,067h,0c0h,067h,0d2h,067h,0c2h,065h,0c0h,067h,0d0h,067h,0c0h,067h	; 84ca  ...g.g.g.e.g.g.g
	defb 0f7h,000h,0e7h,067h,0c0h,067h,0d2h,067h,0c2h,065h,0c0h,067h,0d0h,067h,0c0h,067h	; 84da  ...g.g.g.e.g.g.g
	defb 0c0h,067h,0d0h,067h,0d0h,067h,000h,007h,052h,007h,0d2h,06dh,0c0h,07fh,0c0h,07fh	; 84ea  .g.g.g..R..m....
	defb 0c0h,07ch,0d0h,07ch,0d0h,06ch,0c0h,07ch,0d2h,07ch,0d2h,06dh,0c0h,07fh,0c0h,07fh	; 84fa  .|.|.l.|.|.m....
	defb 000h,0ffh,004h,0ffh,004h,0fbh,000h,000h,0a4h,000h,024h,0dbh,000h,0ffh,000h,0ffh	; 850a  ..........$.....
	defb 080h,00fh,080h,047h,080h,063h,000h,000h,012h,000h,0d2h,06dh,0c0h,07fh,0c0h,07fh	; 851a  ...G.c.....m....
	defb 033h,040h,029h,050h,02ch,040h,03eh,040h,02dh,052h,02dh,040h,03fh,040h,03fh,040h	; 852a  3@)P,@>@-R-@?@?@
	defb 000h,000h,027h,040h,027h,040h,035h,042h,025h,040h,027h,040h,037h,040h,027h,040h	; 853a  ..'@'@5B%@'@7@'@
	defb 000h,000h,0e7h,000h,0e7h,040h,0d5h,062h,0c7h,060h,0c3h,064h,0d1h,066h,0c0h,067h	; 854a  .....@.b.`.d.f.g

; ----------------------------------------------------------------------
; DATOS dibujo_855A: 8 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 1 de la lista 0x8000 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (128 bytes)
;   0x855a..0x85da  (128 bytes)
DATA_dibujo_855A:
	defb 000h,0ffh,000h,0ffh,000h,0ffh,002h,0b9h,044h,0bbh,000h,0efh,010h,0cfh,020h,09bh	; 855a  ........D..... .
	defb 0ffh,000h,000h,0ffh,000h,0ffh,002h,0b9h,044h,0bbh,000h,0efh,010h,0cfh,020h,09bh	; 856a  ........D..... .
	defb 002h,0fdh,002h,0fdh,002h,0fdh,002h,0b9h,046h,0b9h,002h,0edh,012h,0cdh,022h,099h	; 857a  ........F.....".
	defb 010h,0edh,010h,0e5h,01ch,0e1h,004h,0b1h,044h,0b9h,004h,0f9h,01ch,0e1h,010h,0a5h	; 858a  ........D.......
	defb 000h,0ffh,000h,07fh,000h,03fh,042h,059h,004h,04bh,010h,017h,020h,033h,044h,065h	; 859a  .....?BY.K.. 3De
	defb 002h,0fdh,002h,0fdh,002h,07dh,042h,079h,006h,059h,012h,01dh,022h,035h,046h,065h	; 85aa  .....}By.Y.."5Fe
	defb 000h,084h,001h,0c1h,002h,0e3h,004h,0b6h,040h,0b8h,000h,0ech,010h,0ceh,020h,09bh	; 85ba  ........@..... .
	defb 008h,0d8h,008h,0d8h,002h,0feh,00ah,0beh,042h,0beh,002h,0feh,01eh,0e2h,010h,0a1h	; 85ca  ........B.......

; ----------------------------------------------------------------------
; DATOS dibujo_85DA: 6 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 2 de la lista 0x8000 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (144 bytes)
;   0x85da..0x866a  (144 bytes)
DATA_dibujo_85DA:
	defb 0c3h,03ch,0c3h,0ffh,0f1h,071h,0ffh,0e3h,063h,09ch,080h,080h,080h,000h,0ffh,080h,000h,0ffh,07fh,080h,0ffh,0ffh,0f1h,071h	; 85da  .<...q..c..............q
	defb 0c3h,03ch,0c3h,0ffh,0c7h,0c7h,0ffh,08eh,08eh,071h,000h,000h,000h,000h,0ffh,000h,000h,0ffh,0feh,000h,0ffh,0ffh,0c7h,0c7h	; 85f2  .<.......q..............
	defb 0ffh,0e3h,063h,09ch,080h,080h,080h,000h,0ffh,080h,000h,0ffh,07fh,080h,0ffh,0ffh,0f1h,071h,0ffh,0e3h,063h,09ch,080h,080h	; 860a  ..c..............q..c...
	defb 0ffh,08eh,08eh,071h,000h,000h,000h,000h,0ffh,000h,000h,0ffh,0feh,000h,0ffh,0ffh,0c7h,0c7h,0ffh,08eh,08eh,071h,000h,000h	; 8622  ...q.................q..
	defb 080h,000h,0ffh,07fh,080h,0ffh,07fh,080h,0ffh,0ffh,0f1h,071h,0ffh,0e3h,063h,09ch,080h,080h,010h,0cfh,020h,020h,09bh,044h	; 863a  ...........q..c.....  .D
	defb 000h,000h,0ffh,0feh,000h,0ffh,0feh,000h,0ffh,0ffh,0c7h,0c7h,0ffh,08eh,08eh,071h,000h,000h,010h,0cfh,020h,020h,09bh,044h	; 8652  ...............q....  .D

; ----------------------------------------------------------------------
; DATOS dibujo_866A: 3 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 16 de la lista 0x8000 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (72 bytes)
;   0x866a..0x86b2  (72 bytes)
DATA_dibujo_866A:
	defb 07fh,03fh,040h,07fh,02fh,050h,06fh,02fh,040h,07fh,03fh,040h,07fh,02dh,052h,0c3h,000h,03ch,0e1h,000h,01eh,0f0h,000h,00fh	; 866a  .?@./Po/@.?@.-R..<......
	defb 0ffh,0ffh,000h,0ffh,0fbh,004h,0fbh,0fbh,000h,0ffh,0ffh,000h,0ffh,0fbh,004h,0c3h,000h,03ch,0e1h,000h,01eh,0f0h,000h,00fh	; 8682  .................<......
	defb 077h,02fh,040h,067h,03fh,040h,067h,03fh,040h,067h,03fh,040h,067h,03fh,040h,0c3h,000h,024h,0e1h,000h,006h,0f0h,000h,007h	; 869a  w/@g?@g?@g?@g?@..$......

; ----------------------------------------------------------------------
; DATOS dibujo_86B2: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 5 de la lista 0x8000 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (32 bytes)
;   0x86b2..0x86d2  (32 bytes)
DATA_dibujo_86B2:
	defb 07fh,043h,07fh,007h,03fh,00fh,0bfh,01eh,0dfh,01ch,0dfh,018h,08fh,000h,00fh,001h	; 86b2  .C..?...........
	defb 017h,003h,037h,007h,07bh,003h,0f3h,002h,0e1h,000h,0c1h,000h,086h,000h,00eh,000h	; 86c2  ..7.{...........

; ----------------------------------------------------------------------
; DATOS dibujo_86D2: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 7 de la lista 0x8000 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (16 bytes)
;   0x86d2..0x86e2  (16 bytes)
DATA_dibujo_86D2:
	defb 0c3h,0ffh,03ch,000h,078h,000h,0f0h,000h,0e1h,000h,0c3h,000h,087h,000h,00fh,000h	; 86d2  ..<.x...........

; ----------------------------------------------------------------------
; DATOS dibujo_86E2: 7 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 8 de la lista 0x8000 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (168 bytes)
;   0x86e2..0x878a  (168 bytes)
DATA_dibujo_86E2:
	defb 000h,0fch,003h,03ch,080h,000h,078h,080h,000h,070h,080h,000h,061h,080h,000h,063h,0a0h,000h,077h,0f0h,000h,07fh,0f0h,000h	; 86e2  ...<..x..p..a..c..w.....
	defb 01eh,001h,00fh,03eh,001h,00fh,07eh,001h,007h,0feh,000h,003h,0feh,000h,021h,0feh,000h,031h,0feh,000h,079h,0feh,001h,03dh	; 86fa  ...>..~.......!..1..y..=
	defb 0feh,001h,01fh,0feh,001h,00fh,07eh,001h,007h,07eh,000h,043h,07eh,000h,061h,07eh,000h,071h,0feh,000h,079h,0feh,001h,03dh	; 8712  ......~..~.C~.a~.q..y..=
	defb 000h,03ch,0c3h,03ch,001h,001h,07ah,001h,001h,0f2h,001h,001h,0e6h,000h,001h,0c6h,000h,001h,08eh,000h,001h,00eh,001h,005h	; 872a  .<.<..z.................
	defb 000h,001h,0ffh,0feh,0feh,0ffh,0ffh,000h,000h,00fh,080h,000h,01eh,080h,000h,000h,0ffh,000h,00fh,0ffh,00fh,067h,0ffh,067h	; 8742  .....................g.g
	defb 000h,0fdh,006h,038h,01dh,01eh,018h,01dh,01eh,018h,01dh,01eh,098h,01dh,01eh,0d8h,01dh,01eh,0f8h,01dh,01eh,0f8h,01dh,01eh	; 875a  ...8....................
	defb 080h,0dfh,0e0h,08ch,0d8h,0e8h,08eh,0d8h,0e8h,08fh,0d8h,0e8h,08fh,0d8h,0e8h,08bh,0d8h,0e8h,089h,0d8h,0e8h,088h,0d8h,0e8h	; 8772  ........................

; ----------------------------------------------------------------------
; DATOS dibujo_878A: 5 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 9 de la lista 0x8000 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (120 bytes)
;   0x878a..0x8802  (120 bytes)
DATA_dibujo_878A:
	defb 080h,055h,02ah,0aah,055h,02ah,040h,095h,02ah,040h,095h,02ah,060h,095h,00ah,020h,095h,00ah,010h,005h,00ah,010h,005h,00ah	; 878a  .U*.U*@.*@.*`.. ........
	defb 038h,005h,002h,078h,005h,002h,074h,081h,002h,064h,081h,002h,042h,081h,000h,006h,081h,000h,00fh,000h,000h,01fh,000h,000h	; 87a2  8..x..t..d..B...........
	defb 0ffh,011h,001h,0ffh,013h,003h,0ffh,0a7h,007h,0ffh,0efh,00fh,0ffh,0deh,01eh,0ffh,0fch,03ch,0ffh,0f8h,078h,0ffh,0f0h,0f0h	; 87ba  .................<..x...
	defb 0feh,01fh,001h,0ffh,00fh,000h,0ffh,086h,000h,0ffh,0c3h,001h,0ffh,0e6h,002h,0ffh,0f4h,000h,0ffh,078h,000h,0ffh,038h,000h	; 87d2  ...................x..8.
	defb 000h,0ffh,000h,07fh,080h,03fh,060h,080h,01fh,074h,082h,00dh,060h,080h,007h,040h,080h,003h,006h,080h,001h,00fh,080h,000h	; 87ea  .....?`..t..`..@........

; ----------------------------------------------------------------------
; DATOS dibujo_8802: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 10 de la lista 0x8000 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (32 bytes)
;   0x8802..0x8822  (32 bytes)
DATA_dibujo_8802:
	defb 007h,0a7h,005h,0a3h,005h,0a3h,005h,0a3h,005h,0a3h,055h,053h,005h,0f3h,0f5h,0f3h	; 8802  ..........US....
	defb 070h,07ah,050h,03ah,050h,03ah,050h,03ah,050h,03ah,055h,035h,050h,03fh,0dfh,0bfh	; 8812  pzP:P:P:P:U5P?..

; ----------------------------------------------------------------------
; DATOS dibujo_8822: 3 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 11 de la lista 0x8000 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (48 bytes)
;   0x8822..0x8852  (48 bytes)
DATA_dibujo_8822:
	defb 000h,055h,0aah,0ffh,000h,055h,000h,055h,000h,055h,000h,0aah,000h,000h,000h,055h	; 8822  .U...U.U.U.....U
	defb 000h,055h,0aah,0ffh,000h,055h,000h,055h,000h,055h,000h,055h,000h,055h,000h,055h	; 8832  .U...U.U.U.U.U.U
	defb 000h,055h,000h,055h,000h,055h,000h,055h,000h,055h,055h,0aah,000h,000h,0ffh,000h	; 8842  .U.U.U.U.UU.....

; ----------------------------------------------------------------------
; DATOS dibujo_8852: 20 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 12 de la lista 0x8000 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (480 bytes)
;   0x8852..0x8a32  (480 bytes)
DATA_dibujo_8852:
	defb 0cbh,06fh,083h,0c8h,06ch,080h,0cbh,06ch,080h,0cah,06fh,080h,0cah,06fh,080h,0cah,06fh,080h,0cah,06fh,080h,0cah,06fh,080h	; 8852  .o..l..l..o..o..o..o..o.
	defb 0cah,06fh,080h,0cah,06fh,080h,0cah,06fh,080h,0cah,06fh,080h,0cah,06fh,080h,0cah,06fh,080h,0cah,06fh,080h,0cah,06fh,080h	; 886a  .o..o..o..o..o..o..o..o.
	defb 059h,0aeh,053h,059h,0aeh,053h,059h,0aeh,053h,059h,0aeh,053h,059h,0aeh,053h,059h,0aeh,053h,059h,0aeh,053h,059h,0aeh,053h	; 8882  Y.SY.SY.SY.SY.SY.SY.SY.S
	defb 0ffh,000h,0ffh,080h,000h,080h,0ffh,000h,080h,0ffh,07fh,080h,0ffh,040h,0bfh,0c0h,040h,080h,0c0h,07fh,080h,0ffh,040h,080h	; 889a  .............@..@.....@.
	defb 0e0h,055h,080h,0eah,05fh,080h,0e0h,055h,080h,0e0h,055h,080h,0e0h,055h,080h,0e0h,04ah,080h,0e0h,040h,080h,0e0h,055h,080h	; 88b2  .U.._..U..U..U..J..@..U.
	defb 0c0h,07fh,080h,0c0h,070h,080h,0ceh,061h,08eh,0ceh,067h,088h,0c8h,069h,080h,0cfh,068h,080h,0c8h,06dh,080h,0cah,06fh,080h	; 88ca  ....p..a..g..i..h..m..o.
	defb 0c8h,06dh,080h,0c8h,06dh,080h,0c8h,06dh,080h,0c8h,06dh,080h,0c8h,06dh,080h,0cdh,06ah,080h,0c8h,06ch,080h,0cfh,06ah,080h	; 88e2  .m..m..m..m..m..j..l..j.
	defb 0ffh,000h,0ffh,001h,000h,001h,0ffh,000h,001h,0ffh,0feh,001h,0ffh,000h,0ffh,003h,000h,003h,003h,0fch,003h,0fdh,002h,003h	; 88fa  ........................
	defb 001h,056h,003h,0adh,0fah,003h,005h,052h,003h,005h,052h,003h,005h,052h,003h,005h,0aah,003h,005h,002h,003h,005h,052h,003h	; 8912  .V.....R..R..R........R.
	defb 001h,0feh,003h,001h,006h,003h,079h,096h,063h,079h,0eeh,013h,019h,08eh,013h,0f9h,00eh,013h,019h,06eh,013h,099h,0eeh,013h	; 892a  ......y.cy.........n....
	defb 019h,06eh,013h,019h,06eh,013h,019h,06eh,013h,019h,06eh,013h,019h,06eh,013h,059h,02eh,013h,019h,02eh,013h,0d9h,02eh,053h	; 8942  .n..n..n..n..n.Y.......S
	defb 0edh,048h,080h,0edh,048h,080h,0edh,048h,080h,0edh,048h,080h,0edh,048h,080h,0edh,048h,080h,0edh,048h,080h,0edh,048h,080h	; 895a  .H..H..H..H..H..H..H..H.
	defb 059h,0eeh,013h,059h,0eeh,013h,059h,0eeh,013h,059h,0eeh,013h,059h,0eeh,013h,059h,0eeh,013h,059h,0eeh,013h,059h,0eeh,013h	; 8972  Y..Y..Y..Y..Y..Y..Y..Y..
	defb 0ffh,000h,0ffh,000h,000h,000h,0ffh,000h,000h,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,000h,000h,000h,0ffh,000h,0ffh,000h,000h	; 898a  ........................
	defb 0ffh,000h,0ffh,000h,000h,000h,0ffh,010h,000h,0d7h,0efh,010h,0d7h,038h,0c7h,010h,038h,000h,000h,0ffh,000h,0ffh,000h,000h	; 89a2  .............8..8.......
	defb 000h,0c7h,000h,03ah,08dh,032h,03ah,087h,038h,03ah,0bfh,000h,000h,0c5h,000h,0ffh,000h,000h,000h,055h,000h,0aah,0ffh,000h	; 89ba  ...:.2:.8:.........U....
	defb 000h,0ffh,000h,04ch,0a5h,048h,05ch,0e5h,018h,05ch,0fdh,000h,000h,0a3h,000h,0ffh,000h,000h,000h,055h,000h,0aah,0ffh,000h	; 89d2  ...L.H\..\.........U....
	defb 000h,0ffh,000h,004h,00ah,004h,0f5h,00eh,0f1h,0f5h,0ffh,000h,000h,00ah,000h,0fdh,002h,000h,000h,055h,000h,0aah,0ffh,000h	; 89ea  ...................U....
	defb 000h,0ffh,000h,000h,000h,000h,0ffh,000h,0ffh,0ffh,0ffh,000h,000h,000h,000h,0ffh,000h,000h,000h,055h,000h,0aah,0ffh,000h	; 8a02  ...................U....
	defb 000h,080h,000h,09fh,040h,09fh,08fh,02fh,080h,0c7h,073h,084h,0c3h,06bh,080h,0c1h,065h,080h,0c8h,06eh,080h,0c8h,06dh,080h	; 8a1a  ....@../..s..k..e..n..m.

; ----------------------------------------------------------------------
; DATOS dibujo_8A32: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 3 de la lista 0x8000 (p00:4D92, p00:4DF5); lo leen p00:4C0C (8
;   bytes)
;   0x8a32..0x8a3a  (8 bytes)
DATA_dibujo_8A32:
	defb 01eh,03ch,078h,0f0h,0e1h,0c3h,087h,00fh	; 8a32  .<x.....

; ----------------------------------------------------------------------
; DATOS dibujo_8A3A: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 6 de la lista 0x8000 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (16 bytes)
;   0x8a3a..0x8a4a  (16 bytes)
DATA_dibujo_8A3A:
	defb 07fh,0e1h,07fh,0c3h,07fh,087h,07fh,08fh,07fh,09eh,07fh,0bch,07fh,0f8h,07fh,0f0h	; 8a3a  ................

; ----------------------------------------------------------------------
; DATOS dibujo_8A4A: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 4 de la lista 0x8000 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (16 bytes)
;   0x8a4a..0x8a5a  (16 bytes)
DATA_dibujo_8A4A:
	defb 07eh,0e0h,07ch,0c0h,07ch,084h,07ch,08ch,07fh,09eh,07fh,0bch,07fh,0f8h,07fh,0f0h	; 8a4a  ~.|.|.|.........

; ----------------------------------------------------------------------
; DATOS dibujo_8A5A: 16 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 13 de la lista 0x8000 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (384 bytes)
;   0x8a5a..0x8bda  (384 bytes)
DATA_dibujo_8A5A:
	defb 078h,0ffh,0ffh,03bh,007h,0c7h,01bh,006h,0e6h,00bh,006h,0f6h,083h,006h,07eh,0c3h,006h,026h,0fbh,01eh,006h,0fbh,01eh,006h	; 8a5a  x.............~..&......
	defb 000h,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0ffh,000h,00fh,000h,0f0h,01eh,000h,0e1h,000h,000h,000h,07fh,02fh,050h,06fh,02fh,040h	; 8a72  .................../Po/@
	defb 000h,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0ffh,000h,00fh,000h,0f0h,01eh,000h,0e1h,000h,000h,000h,0ffh,0fbh,004h,0fbh,0fbh,000h	; 8a8a  ........................
	defb 000h,0ffh,0ffh,0ffh,0ffh,0ffh,0c0h,0bfh,080h,0efh,040h,0d0h,0feh,040h,0c1h,0e0h,040h,0c0h,0ffh,05fh,0c0h,0dfh,03fh,000h	; 8aa2  ..........@..@..@.._..?.
	defb 038h,0efh,0efh,0bch,0e0h,0e3h,0beh,060h,061h,03fh,060h,0e0h,03fh,060h,0e0h,03bh,068h,064h,039h,068h,066h,028h,078h,067h	; 8aba  8......`a?`.?`..hd9hf(xg
	defb 07ah,01fh,086h,03ah,01fh,0c6h,01ah,01fh,0e6h,01ah,01fh,0e6h,09ah,01fh,066h,0dah,01fh,026h,0fah,01fh,006h,0fah,01fh,006h	; 8ad2  z..:..........f..&......
	defb 028h,078h,067h,02ch,078h,063h,02eh,078h,061h,027h,0f8h,060h,027h,0f8h,060h,02bh,078h,064h,029h,078h,066h,028h,078h,067h	; 8aea  (xg,xc.xa'.`'.`+xd)xf(xg
	defb 028h,078h,067h,02ch,078h,063h,02eh,078h,061h,02fh,078h,060h,02fh,078h,060h,02bh,078h,064h,029h,078h,066h,028h,078h,067h	; 8b02  (xg,xc.xa/x`/x`+xd)xf(xg
	defb 078h,01fh,087h,03fh,01fh,0c7h,01ah,01fh,0e2h,01fh,01ch,0e2h,09fh,01ch,062h,0c3h,000h,03eh,0e3h,000h,01eh,0f3h,000h,00ch	; 8b1a  x..?..........b..>......
	defb 000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,0ffh,0ffh,000h,0c3h,000h,03ch,0e1h,000h,01eh,0f0h,000h,00fh	; 8b32  .................<......
	defb 000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,07fh,03fh,040h,07fh,03fh,040h,0c3h,000h,03ch,0e1h,000h,01eh,0f0h,000h,00fh	; 8b4a  ..........?@.?@..<......
	defb 02ch,0f8h,0e3h,0eeh,0f8h,0e1h,0cfh,0b8h,080h,0dfh,078h,0c0h,0dbh,078h,0c4h,0e1h,040h,0deh,0f0h,040h,0cfh,0f8h,000h,007h	; 8b62  ,.........x..x..@..@....
	defb 000h,0ffh,0feh,0feh,0ffh,0feh,006h,0fbh,006h,0feh,0fbh,006h,0feh,0fbh,006h,0c7h,002h,03eh,0e7h,002h,01eh,0f7h,000h,008h	; 8b7a  .................>......
	defb 000h,0ffh,0ffh,0ffh,07fh,0ffh,0c0h,07fh,0c0h,0dfh,07fh,0c0h,0dfh,07fh,0c0h,0e3h,040h,0dch,0e1h,040h,0deh,0f0h,000h,00fh	; 8b92  ................@..@....
	defb 000h,07fh,07fh,03fh,07fh,07fh,020h,07fh,060h,02fh,07fh,060h,02fh,07fh,060h,02bh,078h,064h,029h,078h,066h,028h,078h,067h	; 8baa  ...?.. .`/.`/.`+xd)xf(xg
	defb 002h,0ffh,0feh,0fah,0ffh,0feh,002h,0ffh,006h,0fah,0ffh,006h,0fah,0ffh,006h,0fah,01fh,006h,0fah,01fh,006h,0fah,01fh,006h	; 8bc2  ........................

; ----------------------------------------------------------------------
; DATOS dibujo_8BDA: 9 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 14 de la lista 0x8000 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (216 bytes)
;   0x8bda..0x8cb2  (216 bytes)
DATA_dibujo_8BDA:
	defb 088h,0f8h,067h,0ech,0f8h,063h,0eeh,0b8h,061h,0efh,0b8h,060h,0efh,0b8h,060h,0ebh,030h,064h,0e9h,030h,066h,0f8h,000h,007h	; 8bda  ..g..c..a..`..`.0d.0f...
	defb 002h,0ffh,0feh,0feh,0ffh,0feh,000h,0ffh,000h,01fh,01bh,0e4h,01bh,01bh,0e0h,01fh,01fh,000h,0ffh,0fbh,004h,0fbh,0fbh,000h	; 8bf2  ........................
	defb 062h,007h,086h,03ah,007h,0deh,01ah,01fh,0e6h,002h,01fh,006h,082h,01fh,006h,0dah,01fh,026h,0fah,01fh,006h,0fah,01fh,006h	; 8c0a  b..:.............&......
	defb 010h,041h,00fh,010h,041h,00fh,038h,041h,007h,03dh,041h,003h,05fh,001h,021h,0cfh,001h,031h,087h,001h,079h,0c2h,001h,03dh	; 8c22  .A..A.8A.=A._.!..1..y..=
	defb 079h,01eh,086h,03eh,01bh,0c6h,01eh,01bh,0e6h,01eh,01bh,0e6h,09eh,01bh,066h,0c6h,003h,03eh,0e6h,003h,01eh,0f6h,000h,009h	; 8c3a  y..>..........f..>......
	defb 000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,067h,03fh,040h,067h,03fh,040h,0c3h,000h,024h,0e1h,000h,006h,0f0h,000h,007h	; 8c52  .........g?@g?@..$......
	defb 000h,0ffh,001h,0fch,0ffh,003h,001h,005h,007h,04dh,0c9h,00bh,01fh,051h,011h,00fh,021h,031h,007h,041h,079h,0c2h,081h,0bdh	; 8c6a  .........M...Q..!1.Ay...
	defb 000h,07fh,07fh,07fh,07fh,07fh,000h,07fh,000h,07fh,028h,050h,06eh,028h,040h,078h,038h,040h,07ch,02fh,050h,06ch,02fh,040h	; 8c82  ..........(Pn(@x8@|/Pl/@
	defb 001h,055h,001h,0a9h,0fdh,001h,003h,055h,001h,003h,055h,001h,007h,051h,001h,007h,051h,001h,00fh,051h,001h,00bh,051h,005h	; 8c9a  .U.....U..U..Q..Q..Q..Q.

; ----------------------------------------------------------------------
; DATOS dibujo_8CB2: 4 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 15 de la lista 0x8000 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (64 bytes)
;   0x8cb2..0x8cf2  (64 bytes)
DATA_dibujo_8CB2:
	defb 0aah,0d5h,0aah,0d5h,09dh,0e2h,0ffh,080h,0f8h,087h,0fch,083h,0feh,081h,0ffh,080h	; 8cb2  ................
	defb 0dbh,025h,0dbh,025h,0bbh,045h,0ffh,001h,01fh,0e1h,03fh,0c1h,07fh,081h,0ffh,001h	; 8cc2  .%.%.E....?.....
	defb 0ffh,0ffh,0ffh,080h,080h,080h,0ffh,080h,0ffh,0ffh,0ffh,080h,09ah,0e5h,0aah,0d5h	; 8cd2  ................
	defb 0ffh,0ffh,0ffh,001h,001h,001h,0ffh,001h,0ffh,0ffh,0ffh,001h,0d1h,02fh,0bbh,045h	; 8ce2  ............./.E

; ----------------------------------------------------------------------
; DATOS dibujo_8CF2: 12 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 0 de la lista 0x8056 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (192 bytes)
;   0x8cf2..0x8db2  (192 bytes)
DATA_dibujo_8CF2:
	defb 0ffh,000h,0e0h,060h,0d9h,062h,0d8h,061h,0d9h,062h,0c9h,05ah,0d9h,062h,0d8h,061h	; 8cf2  ...`.b.a.b.Z.b.a
	defb 0ffh,000h,000h,000h,099h,022h,098h,0a1h,099h,022h,089h,01ah,099h,022h,098h,0a1h	; 8d02  ....."..."..."..
	defb 0ffh,000h,001h,000h,099h,020h,099h,0a0h,099h,020h,089h,018h,099h,020h,099h,0a0h	; 8d12  ..... ... ... ..
	defb 0d9h,062h,0c9h,05ah,0d9h,062h,0d8h,061h,0d9h,062h,0c9h,05ah,0d9h,062h,0c0h,040h	; 8d22  .b.Z.b.a.b.Z.b.@
	defb 099h,022h,089h,01ah,099h,022h,098h,0a1h,099h,022h,089h,01ah,099h,022h,000h,000h	; 8d32  ."..."..."..."..
	defb 099h,020h,089h,018h,099h,020h,099h,0a0h,099h,020h,089h,018h,099h,020h,001h,000h	; 8d42  . ... ... ... ..
	defb 0ffh,000h,080h,01fh,0bbh,004h,0b9h,006h,0bbh,004h,093h,024h,0bbh,004h,0b9h,006h	; 8d52  ...........$....
	defb 0ffh,000h,000h,0ffh,0bbh,044h,039h,046h,0bbh,044h,093h,064h,0bbh,044h,039h,046h	; 8d62  .....D9F.D.d.D9F
	defb 0ffh,000h,001h,0feh,0b9h,046h,039h,046h,0b9h,046h,091h,066h,0b9h,046h,039h,046h	; 8d72  .....F9F.F.f.F9F
	defb 0bbh,004h,093h,024h,0bbh,004h,0b9h,006h,0bbh,004h,093h,024h,0bbh,004h,080h,03fh	; 8d82  ...$.......$...?
	defb 0bbh,044h,093h,064h,0bbh,044h,039h,046h,0bbh,044h,093h,064h,0bbh,044h,000h,0ffh	; 8d92  .D.d.D9F.D.d.D..
	defb 0b9h,046h,091h,066h,0b9h,046h,039h,046h,0b9h,046h,091h,066h,0b9h,046h,001h,0feh	; 8da2  .F.f.F9F.F.f.F..

; ----------------------------------------------------------------------
; DATOS dibujo_8DB2: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 1 de la lista 0x8056 (p00:4D92, p00:4DF5); lo leen p00:4C0C (8
;   bytes)
;   0x8db2..0x8dba  (8 bytes)
DATA_dibujo_8DB2:
	defb 000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 8db2  ........

; ----------------------------------------------------------------------
; DATOS dibujo_8DBA: 5 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 2 de la lista 0x8056 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (80 bytes)
;   0x8dba..0x8e0a  (80 bytes)
DATA_dibujo_8DBA:
	defb 0c2h,098h,0c5h,09ah,0c2h,098h,0c2h,098h,0cah,090h,0cah,090h,0cah,090h,0cah,090h	; 8dba  ................
	defb 0ach,006h,054h,0aeh,0ach,006h,0ach,006h,0a4h,00eh,0a4h,00eh,0a4h,00eh,0a4h,00eh	; 8dca  ..T.............
	defb 004h,016h,0c4h,096h,0c4h,096h,0c4h,096h,0c4h,096h,0c4h,096h,0c4h,096h,0c4h,096h	; 8dda  ................
	defb 0aah,000h,055h,0aah,0aah,000h,0aah,000h,0aah,000h,0aah,000h,0aah,000h,0aah,000h	; 8dea  ..U.............
	defb 0c4h,096h,0c4h,096h,0c4h,096h,0c4h,096h,0c4h,096h,0c4h,096h,0c4h,096h,0c4h,096h	; 8dfa  ................

; ----------------------------------------------------------------------
; DATOS dibujo_8E0A: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 3 de la lista 0x8056 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (16 bytes)
;   0x8e0a..0x8e1a  (16 bytes)
DATA_dibujo_8E0A:
	defb 055h,0aah,066h,0aah,044h,088h,055h,0aah,055h,0aah,055h,0aah,000h,0aah,000h,000h	; 8e0a  U.f.D.U.U.U.....

; ----------------------------------------------------------------------
; DATOS dibujo_8E1A: 4 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 4 de la lista 0x8056 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (96 bytes)
;   0x8e1a..0x8e7a  (96 bytes)
DATA_dibujo_8E1A:
	defb 07fh,000h,000h,040h,000h,000h,05fh,000h,000h,05fh,000h,000h,05fh,001h,001h,05fh,002h,002h,05fh,004h,004h,05fh,008h,008h	; 8e1a  ...@.._.._.._.._.._.._..
	defb 0ffh,000h,001h,007h,004h,001h,0ffh,004h,001h,0ffh,084h,081h,0ffh,014h,011h,0ffh,034h,031h,0ffh,074h,071h,0ffh,0e4h,0e1h	; 8e32  ................41.tq...
	defb 05fh,001h,001h,05fh,003h,003h,05fh,007h,007h,05fh,00eh,00eh,05fh,00ch,00ch,040h,01fh,000h,05fh,01fh,000h,07fh,080h,000h	; 8e4a  _.._.._.._.._..@.._.....
	defb 0ffh,0c4h,0c1h,0ffh,084h,081h,0ffh,004h,001h,0ffh,004h,001h,0ffh,014h,011h,007h,0fch,001h,0ffh,0fch,001h,0feh,001h,000h	; 8e62  ........................

; ----------------------------------------------------------------------
; DATOS dibujo_8E7A: 16 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 5 de la lista 0x8056 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (384 bytes)
;   0x8e7a..0x8ffa  (384 bytes)
DATA_dibujo_8E7A:
	defb 0feh,000h,000h,0f9h,078h,006h,0c3h,07ah,004h,0c3h,072h,004h,0cbh,062h,004h,0dbh,042h,004h,03bh,012h,0c4h,07bh,012h,084h	; 8e7a  ....x..z..r..b..B....{..
	defb 03bh,052h,084h,03bh,052h,084h,03ah,052h,084h,03bh,053h,084h,03ch,057h,080h,03bh,054h,080h,038h,050h,080h,038h,05ch,080h	; 8e92  .R..R.:R..S.<W..T.8P.8\.
	defb 0ffh,0ffh,000h,0ffh,000h,000h,001h,000h,000h,0ffh,0feh,000h,003h,0fah,004h,0fbh,002h,004h,0fbh,0fah,0fch,003h,002h,004h	; 8eaa  ........................
	defb 035h,06ah,080h,036h,06ah,080h,034h,068h,080h,035h,06ah,080h,015h,06ah,080h,015h,06ah,080h,015h,06ah,080h,000h,040h,080h	; 8ec2  5j.6j.4h.5j..j..j..j..@.
	defb 05bh,0b2h,004h,05bh,0b2h,004h,05bh,0b2h,004h,05bh,0b2h,004h,07bh,0b2h,004h,07bh,0b2h,004h,07bh,0b2h,004h,0fbh,0f2h,0c4h	; 8eda  [..[..[..[..{..{..{.....
	defb 07fh,000h,000h,05fh,07fh,000h,040h,07fh,000h,044h,07fh,000h,040h,06fh,000h,046h,067h,000h,046h,067h,004h,046h,067h,004h	; 8ef2  ..._..@..D..@o.Fg.Fg.Fg.
	defb 046h,067h,004h,046h,067h,004h,046h,067h,004h,0c6h,0e7h,004h,006h,0e7h,004h,0e6h,007h,004h,006h,007h,004h,006h,007h,004h	; 8f0a  Fg.Fg.Fg................
	defb 046h,0a7h,004h,0a6h,0e7h,004h,046h,0a7h,004h,046h,0a7h,004h,056h,0a7h,004h,056h,0a7h,004h,056h,0a7h,004h,056h,0a7h,004h	; 8f22  F.....F..F..V..V..V..V..
	defb 056h,0afh,004h,066h,0afh,004h,046h,08fh,004h,056h,0afh,004h,056h,0abh,000h,056h,0abh,000h,002h,0abh,000h,002h,003h,000h	; 8f3a  V..f..F..V..V..V........
	defb 0ffh,0ffh,000h,0ffh,000h,000h,000h,000h,000h,0ffh,0ffh,000h,000h,0ffh,000h,0ffh,000h,000h,0ffh,0ffh,0ffh,000h,000h,000h	; 8f52  ........................
	defb 046h,067h,004h,046h,067h,004h,046h,067h,004h,046h,067h,004h,046h,067h,004h,046h,067h,004h,046h,067h,004h,046h,067h,004h	; 8f6a  Fg.Fg.Fg.Fg.Fg.Fg.Fg.Fg.
	defb 0ffh,0ffh,000h,0bdh,000h,000h,042h,042h,000h,05ah,0ffh,000h,0a5h,05ah,000h,05ah,000h,000h,0bdh,0bdh,0bdh,000h,000h,000h	; 8f82  ......BB.Z...Z.Z........
	defb 03fh,040h,080h,03fh,03fh,0c0h,000h,0ffh,000h,000h,000h,000h,080h,07fh,0ffh,080h,07fh,0ffh,080h,07fh,0ffh,080h,07fh,0ffh	; 8f9a  ?@.??...................
	defb 0feh,003h,000h,0feh,0ffh,000h,000h,0ffh,000h,000h,000h,000h,000h,0feh,0feh,000h,0feh,0feh,000h,0feh,0feh,000h,0feh,0feh	; 8fb2  ........................
	defb 0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,000h,000h,000h,000h,018h,0efh,0ffh,018h,0efh,0ffh,018h,0efh,0ffh,018h,0efh,0ffh	; 8fca  ........................
	defb 0efh,000h,010h,0e7h,0e7h,010h,010h,0f7h,000h,000h,010h,000h,000h,0e7h,0e7h,000h,0ffh,0ffh,000h,0ffh,0ffh,000h,0ffh,0ffh	; 8fe2  ........................

; ----------------------------------------------------------------------
; DATOS dibujo_8FFA: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 6 de la lista 0x8056 (p00:4D92, p00:4DF5); lo leen p00:4C0C (8
;   bytes)
;   0x8ffa..0x9002  (8 bytes)
DATA_dibujo_8FFA:
	defb 01eh,03ch,078h,0f0h,0e1h,0c3h,087h,00fh	; 8ffa  .<x.....

; ----------------------------------------------------------------------
; DATOS dibujo_9002: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 7 de la lista 0x8056 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (16 bytes)
;   0x9002..0x9012  (16 bytes)
DATA_dibujo_9002:
	defb 0e1h,0ffh,03ch,000h,078h,000h,0f0h,000h,0e1h,000h,0c3h,000h,087h,000h,00fh,000h	; 9002  ..<.x...........

; ----------------------------------------------------------------------
; DATOS dibujo_9012: 4 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 8 de la lista 0x8056 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (96 bytes)
;   0x9012..0x9072  (96 bytes)
DATA_dibujo_9012:
	defb 061h,07fh,080h,07ch,040h,080h,038h,040h,080h,030h,040h,080h,021h,040h,080h,003h,040h,080h,047h,040h,080h,04fh,040h,080h	; 9012  a..|@.8@.0@.!@..@.G@.O@.
	defb 05eh,040h,080h,07ch,040h,080h,038h,040h,080h,030h,040h,080h,021h,040h,080h,003h,040h,080h,047h,040h,080h,04fh,040h,080h	; 902a  ^@.|@.8@.0@.!@..@.G@.O@.
	defb 067h,079h,080h,03ah,000h,086h,07eh,000h,086h,076h,000h,086h,067h,000h,086h,045h,000h,086h,001h,000h,086h,009h,000h,086h	; 9042  gy.:..~..v..g..E........
	defb 018h,000h,086h,03ah,000h,086h,07eh,000h,086h,076h,000h,086h,067h,000h,086h,045h,000h,086h,001h,000h,086h,009h,000h,086h	; 905a  ...:..~..v..g..E........

; ----------------------------------------------------------------------
; DATOS dibujo_9072: 4 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 9 de la lista 0x8056 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (96 bytes)
;   0x9072..0x90d2  (96 bytes)
DATA_dibujo_9072:
	defb 0ffh,01fh,0e0h,0cbh,02bh,004h,0cbh,06fh,040h,0cfh,0efh,0c0h,0cbh,0ebh,044h,0cbh,0efh,0e0h,0cfh,0afh,0a0h,0cfh,02fh,020h	; 9072  ....+..o@.....D......./
	defb 0c0h,02fh,020h,0c0h,028h,007h,0c3h,06fh,040h,0c5h,0efh,0c0h,0c0h,0ebh,0c0h,0c0h,0efh,0e0h,0c4h,0afh,0a0h,0c0h,02bh,020h	; 908a  ./ .(..o@.............+
	defb 0c0h,02fh,020h,0c4h,02fh,000h,0c0h,06bh,040h,0c0h,0efh,0c0h,0c4h,0efh,0c0h,0c0h,0ebh,0e0h,0c0h,0afh,0a0h,0c0h,02fh,020h	; 90a2  ./ ./..k@............./
	defb 0c0h,020h,020h,0c0h,02fh,000h,0c0h,06fh,040h,0c4h,0efh,0c0h,0c0h,0ebh,0c0h,0c0h,0efh,0e0h,0c4h,0afh,0a0h,0c0h,02bh,020h	; 90ba  .  ./..o@.............+

; ----------------------------------------------------------------------
; DATOS dibujo_90D2: 3 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 10 de la lista 0x8056 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (72 bytes)
;   0x90d2..0x911a  (72 bytes)
DATA_dibujo_90D2:
	defb 000h,0ffh,070h,07fh,080h,07fh,03fh,080h,07fh,020h,08fh,060h,02fh,08fh,06fh,02fh,08fh,06fh,02fh,08fh,06fh,02fh,08fh,06fh	; 90d2  ..p...?.. .`/.o/.o/.o/.o
	defb 000h,0ffh,0f0h,0ffh,000h,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 90ea  ........................
	defb 000h,0f0h,0e0h,0c4h,010h,0c0h,0c0h,014h,0c0h,0c0h,010h,0c0h,0c4h,010h,0c0h,0c0h,014h,0c0h,0c0h,010h,0c0h,0c0h,010h,0c0h	; 9102  ........................

; ----------------------------------------------------------------------
; DATOS dibujo_911A: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 11 de la lista 0x8056 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (32 bytes)
;   0x911a..0x913a  (32 bytes)
DATA_dibujo_911A:
	defb 003h,002h,003h,002h,003h,002h,003h,002h,003h,002h,003h,002h,0feh,0ffh,0fdh,000h	; 911a  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0ffh,0ffh,0ffh,000h	; 912a  ................

; ----------------------------------------------------------------------
; DATOS dibujo_913A: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 12 de la lista 0x8056 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (16 bytes)
;   0x913a..0x914a  (16 bytes)
DATA_dibujo_913A:
	defb 07fh,001h,041h,001h,049h,01dh,05dh,01dh,041h,001h,055h,015h,041h,001h,0ffh,0ffh	; 913a  ..A.I.].A.U.A...

; ----------------------------------------------------------------------
; DATOS dibujo_914A: 4 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 13 de la lista 0x8056 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (96 bytes)
;   0x914a..0x91aa  (96 bytes)
DATA_dibujo_914A:
	defb 000h,0ffh,0ffh,0ffh,000h,000h,0ffh,0ffh,01eh,0c3h,080h,000h,087h,080h,000h,08fh,080h,080h,09fh,080h,081h,0beh,081h,082h	; 914a  ........................
	defb 000h,0ffh,0ffh,0ffh,000h,000h,0ffh,0ffh,01eh,0c3h,000h,000h,087h,000h,000h,0ffh,000h,000h,0ffh,000h,0feh,003h,0fch,002h	; 9162  ........................
	defb 000h,0ffh,0ffh,0ffh,000h,000h,0ffh,0ffh,01eh,0c3h,000h,000h,087h,000h,000h,0feh,001h,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 917a  ........................
	defb 000h,0ffh,0ffh,0ffh,000h,000h,0ffh,0ffh,01eh,0c3h,000h,000h,087h,000h,000h,00fh,000h,080h,01eh,080h,041h,0bch,040h,081h	; 9192  ....................A.@.

; ----------------------------------------------------------------------
; DATOS dibujo_91AA: 4 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 14 de la lista 0x8056 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (96 bytes)
;   0x91aa..0x920a  (96 bytes)
DATA_dibujo_91AA:
	defb 07ch,0f8h,084h,0f8h,071h,008h,0e8h,063h,018h,0e8h,063h,038h,0e8h,063h,078h,068h,0e3h,0f8h,07bh,0f0h,0ebh,07bh,0f3h,0c8h	; 91aa  |...q..c..c8.cxh..{..{..
	defb 05eh,01eh,047h,026h,08eh,02fh,027h,08fh,02eh,027h,08fh,02ch,027h,08fh,028h,02fh,087h,020h,0aeh,006h,0a1h,0aeh,086h,023h	; 91c2  ^.G&./'..'.,'.(/. .....#
	defb 078h,0f3h,088h,0f8h,073h,008h,0e8h,063h,018h,0e8h,063h,038h,0e8h,063h,078h,068h,0e3h,0f8h,07bh,0f0h,0ebh,07bh,0f3h,0c8h	; 91da  x...s..c..c8.cxh..{..{..
	defb 02eh,086h,027h,026h,08eh,02fh,027h,08fh,02eh,027h,08fh,02ch,027h,08fh,028h,02fh,087h,020h,0aeh,006h,0a1h,0aeh,086h,023h	; 91f2  ..'&./'..'.,'.(/. .....#

; ----------------------------------------------------------------------
; DATOS dibujo_920A: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 15 de la lista 0x8056 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (16 bytes)
;   0x920a..0x921a  (16 bytes)
DATA_dibujo_920A:
	defb 07fh,0ffh,0c8h,0f8h,08fh,094h,0a7h,08ah,0b1h,087h,0a8h,093h,0a4h,09bh,0a4h,09bh	; 920a  ................

; ----------------------------------------------------------------------
; DATOS dibujo_921A: 3 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 16 de la lista 0x8056 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (72 bytes)
;   0x921a..0x9262  (72 bytes)
DATA_dibujo_921A:
	defb 0ffh,000h,0ffh,0aah,055h,0aah,0ffh,055h,0aah,055h,055h,0aah,0ffh,000h,0ffh,000h,000h,0ffh,0f4h,0f4h,0ffh,060h,060h,0ffh	; 921a  ....U..U.UU..........``.
	defb 0ffh,000h,0ffh,0aah,055h,0aah,0feh,055h,0aah,055h,055h,0aah,0ffh,000h,0ffh,000h,000h,0ffh,0aah,0aah,0ffh,000h,000h,0ffh	; 9232  ....U..U.UU.............
	defb 0fdh,001h,0fch,026h,0c0h,03eh,0e2h,0ach,052h,0ceh,05ch,0a2h,012h,030h,0ceh,022h,060h,09eh,022h,060h,09eh,022h,060h,09eh	; 924a  ...&.>..R.\..0."`."`."`.

; ----------------------------------------------------------------------
; DATOS dibujo_9262: 3 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 17 de la lista 0x8056 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (48 bytes)
;   0x9262..0x9292  (48 bytes)
DATA_dibujo_9262:
	defb 025h,07bh,025h,07bh,025h,07bh,025h,07bh,025h,07bh,03dh,07bh,000h,0ffh,0ffh,0ffh	; 9262  %{%{%{%{%{={....
	defb 0a5h,07bh,0a5h,07bh,0a5h,07bh,0a5h,07bh,0a5h,07bh,0bdh,07bh,000h,0ffh,0ffh,0ffh	; 9272  .{.{.{.{.{.{....
	defb 0a5h,07bh,0a5h,07bh,0a5h,07bh,0a5h,07bh,0a5h,07bh,0bdh,07bh,001h,0ffh,0ffh,0ffh	; 9282  .{.{.{.{.{.{....

; ----------------------------------------------------------------------
; DATOS dibujo_9292: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 18 de la lista 0x8056 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (32 bytes)
;   0x9292..0x92b2  (32 bytes)
DATA_dibujo_9292:
	defb 0ach,097h,0bdh,08bh,0b8h,096h,0b1h,0ach,0c2h,0f9h,08fh,07fh,000h,07fh,080h,000h	; 9292  ................
	defb 000h,0ffh,0ffh,0ffh,000h,000h,0aah,0aah,0ffh,0aah,0ffh,0ffh,000h,0ffh,000h,000h	; 92a2  ................

; ----------------------------------------------------------------------
; DATOS dibujo_92B2: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 19 de la lista 0x8056 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (8 bytes)
;   0x92b2..0x92ba  (8 bytes)
DATA_dibujo_92B2:
	defb 0ffh,0ffh,0ffh,0ffh,000h,0ffh,000h,000h	; 92b2  ........

; ----------------------------------------------------------------------
; DATOS dibujo_92BA: 9 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 20 de la lista 0x8056 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (144 bytes)
;   0x92ba..0x934a  (144 bytes)
DATA_dibujo_92BA:
	defb 000h,0ffh,080h,000h,080h,000h,09fh,01fh,090h,010h,097h,017h,097h,017h,097h,017h	; 92ba  ................
	defb 000h,0ffh,000h,000h,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 92ca  ................
	defb 000h,0ffh,001h,000h,001h,000h,0f9h,0f8h,009h,008h,0e9h,0e8h,0e9h,0e8h,0e9h,0e8h	; 92da  ................
	defb 097h,017h,097h,017h,097h,017h,097h,017h,097h,017h,097h,017h,097h,017h,097h,017h	; 92ea  ................
	defb 0e9h,0e8h,0e9h,0e8h,0e9h,0e8h,0e9h,0e8h,0e9h,0e8h,0e9h,0e8h,0e9h,0e8h,0e9h,0e8h	; 92fa  ................
	defb 097h,017h,097h,017h,097h,017h,097h,017h,090h,010h,09fh,01fh,080h,000h,080h,000h	; 930a  ................
	defb 0e9h,0e8h,0e9h,0e8h,0e9h,0e8h,0e9h,0e8h,009h,008h,0f9h,0f8h,001h,000h,001h,000h	; 931a  ................
	defb 0e9h,0e8h,0e8h,0e8h,0e8h,0e8h,0efh,0efh,0e0h,0e0h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 932a  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,007h,007h,0f7h,0f7h,017h,017h,017h,017h	; 933a  ................

; ----------------------------------------------------------------------
; DATOS dibujo_934A: 2 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 21 de la lista 0x8056 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (48 bytes)
;   0x934a..0x937a  (48 bytes)
DATA_dibujo_934A:
	defb 00fh,0ffh,000h,01fh,008h,007h,01ch,008h,007h,0dch,0c8h,007h,05fh,048h,007h,05fh,04bh,004h,05fh,048h,007h,05fh,04fh,000h	; 934a  ............_H._K._H._O.
	defb 0f0h,0ffh,000h,0f8h,010h,0e0h,038h,010h,0e0h,03bh,013h,0e0h,0fah,012h,0e0h,0fah,0d2h,020h,0fah,012h,0e0h,0fah,0f2h,000h	; 9362  ......8.......... ......

; ----------------------------------------------------------------------
; DATOS dibujo_937A: 3 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 22 de la lista 0x8056 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (48 bytes)
;   0x937a..0x93aa  (48 bytes)
DATA_dibujo_937A:
	defb 0ffh,0ffh,0ffh,080h,0c0h,080h,0c0h,080h,0ffh,080h,0ffh,0bfh,0ffh,080h,0ffh,0ffh	; 937a  ................
	defb 0ffh,0ffh,0ffh,000h,000h,000h,000h,000h,0ffh,000h,0ffh,0ffh,0ffh,000h,0ffh,0ffh	; 938a  ................
	defb 0ffh,0ffh,0ffh,001h,003h,001h,003h,001h,0ffh,001h,0ffh,0fdh,0ffh,001h,0ffh,0ffh	; 939a  ................

; ----------------------------------------------------------------------
; DATOS dibujo_93AA: 1 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 23 de la lista 0x8056 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (24 bytes)
;   0x93aa..0x93c2  (24 bytes)
DATA_dibujo_93AA:
	defb 062h,020h,0deh,072h,050h,0aeh,0bah,028h,0d6h,05eh,094h,06ah,026h,040h,0beh,0f2h,002h,0fch,002h,003h,0fch,000h,0feh,000h	; 93aa  b .rP..(.^.j&@..........

; ----------------------------------------------------------------------
; DATOS dibujo_93C2: 3 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 24 de la lista 0x8056 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (72 bytes)
;   0x93c2..0x940a  (72 bytes)
DATA_dibujo_93C2:
	defb 07fh,080h,000h,0ffh,0ffh,0ffh,000h,0ffh,07fh,038h,0ffh,07fh,025h,0fbh,07fh,0a5h,0a5h,039h,0a5h,0a5h,039h,025h,0fbh,07fh	; 93c2  .........8..%....9..9%..
	defb 0ffh,000h,000h,0ffh,0ffh,0ffh,000h,0ffh,0ffh,038h,0ffh,0ffh,0a5h,07bh,0ffh,0a5h,0a5h,039h,0a5h,0a5h,039h,0a5h,07bh,0ffh	; 93da  .........8...{...9..9.{.
	defb 0ffh,001h,001h,0ffh,0ffh,0ffh,001h,0ffh,0ffh,039h,0ffh,0ffh,0a5h,07bh,0ffh,0a5h,0a5h,039h,0a5h,0a5h,039h,0a5h,07bh,0ffh	; 93f2  .........9...{...9..9.{.

; ----------------------------------------------------------------------
; DATOS dibujo_940A: 16 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 0 de la lista 0x80D4 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (256 bytes)
;   0x940a..0x950a  (256 bytes)
DATA_dibujo_940A:
	defb 0edh,012h,0feh,001h,0e9h,004h,0feh,001h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 940a  ................
	defb 0c2h,0f5h,0b3h,0a4h,00bh,004h,08fh,090h,08fh,0b0h,08fh,070h,05fh,0a0h,07fh,000h	; 941a  ...........p_...
	defb 001h,0fch,03dh,0bah,045h,0c0h,045h,0c8h,04dh,0c0h,04dh,0c0h,045h,0c0h,045h,0c0h	; 942a  ..=.E.E.M.M.E.E.
	defb 0b3h,054h,069h,08eh,0e9h,01eh,0b2h,001h,0f2h,000h,062h,098h,0aah,055h,027h,0d8h	; 943a  .Ti.......b..U'.
	defb 0f9h,082h,00ch,03dh,000h,0ddh,0deh,021h,073h,08ch,021h,0d6h,0a1h,0d2h,0a5h,00ah	; 944a  ...=...!s.!.....
	defb 03bh,044h,087h,068h,086h,049h,04eh,091h,04ch,093h,05ch,0a3h,0fch,002h,0fch,002h	; 945a  .D.h.IN.L.\.....
	defb 038h,046h,038h,047h,03fh,040h,038h,047h,038h,046h,0f8h,086h,078h,006h,0f8h,007h	; 946a  8F8G?@8G8F..x...
	defb 021h,01eh,020h,017h,020h,053h,060h,010h,060h,019h,020h,019h,031h,008h,030h,009h	; 947a  !. . S`.`. .1.0.
	defb 0fch,002h,0fch,002h,0f6h,009h,0c6h,039h,046h,031h,044h,0a2h,0c4h,022h,004h,0e2h	; 948a  .......9F1D.."..
	defb 073h,042h,0ffh,000h,031h,021h,080h,0ffh,0b1h,0efh,0b1h,0efh,010h,000h,0ffh,000h	; 949a  sB..1!..........
	defb 0fbh,003h,078h,087h,0f1h,00eh,0feh,000h,006h,0e0h,005h,0f8h,0feh,000h,0ffh,000h	; 94aa  ..x.............
	defb 005h,003h,007h,0f8h,084h,07ah,07ch,083h,064h,083h,0bch,043h,07ch,082h,0ffh,000h	; 94ba  .....z|.d..C|...
	defb 0ceh,008h,0ffh,000h,0c6h,084h,002h,0fdh,0c6h,0bdh,0c6h,0bdh,042h,000h,0ffh,000h	; 94ca  ............B...
	defb 0dbh,024h,03fh,0c0h,0cbh,034h,03fh,0c0h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 94da  .$?..4?.........
	defb 0efh,010h,0feh,00eh,06fh,000h,070h,048h,01fh,040h,01fh,010h,027h,030h,047h,064h	; 94ea  ....o.pH.@..'0Gd
	defb 0efh,010h,0feh,00eh,0efh,000h,0f0h,008h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 94fa  ................

; ----------------------------------------------------------------------
; DATOS dibujo_950A: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 1 de la lista 0x80D4 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (32 bytes)
;   0x950a..0x952a  (32 bytes)
DATA_dibujo_950A:
	defb 01ch,0a2h,01dh,083h,00ch,0d3h,08fh,050h,0c7h,028h,0c7h,028h,0e6h,009h,0e2h,015h	; 950a  .......P.(.(....
	defb 00fh,010h,0afh,070h,00dh,0f2h,0f5h,008h,0f5h,008h,0f5h,008h,005h,0f8h,005h,080h	; 951a  ...p............

; ----------------------------------------------------------------------
; DATOS dibujo_952A: 26 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 2 de la lista 0x80D4 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (624 bytes)
;   0x952a..0x979a  (624 bytes)
DATA_dibujo_952A:
	defb 0d8h,060h,00fh,0a1h,041h,00ch,0b0h,041h,01ch,0a4h,059h,020h,09ch,020h,086h,02ah,041h,006h,0d3h,001h,01ah,077h,000h,03ah	; 952a  .`..A..A..Y . .*A....w.:
	defb 000h,000h,0ffh,0abh,000h,038h,0afh,000h,03fh,0aeh,001h,038h,0c0h,000h,0f8h,0a8h,000h,03fh,069h,080h,03bh,02ch,000h,0fbh	; 9542  .....8..?..8.....?i..,..
	defb 000h,000h,0ffh,0b2h,000h,003h,0feh,000h,0ffh,02fh,0d0h,000h,000h,000h,000h,000h,000h,0ffh,0ffh,000h,0ffh,000h,000h,0ffh	; 955a  ........./..............
	defb 019h,00ch,0e1h,012h,008h,0e3h,012h,000h,0e3h,0c0h,000h,01fh,041h,000h,0d7h,0c4h,000h,0d7h,0c6h,000h,0d7h,0c6h,000h,0d7h	; 9572  ............A...........
	defb 00dh,040h,08fh,092h,060h,003h,022h,070h,003h,032h,060h,003h,016h,020h,007h,0b0h,020h,083h,092h,020h,083h,092h,020h,083h	; 958a  .@..`."p.2`.. .. .. .. .
	defb 0e2h,004h,0b2h,0e3h,004h,0b2h,026h,000h,0bah,02ah,000h,0bah,042h,000h,0f7h,052h,000h,0f3h,011h,002h,0f1h,034h,001h,0f0h	; 95a2  ......&..*..B..R.....4..
	defb 0feh,000h,0ffh,021h,000h,001h,0bdh,000h,03dh,05ch,030h,042h,0e6h,038h,082h,00eh,070h,082h,0f6h,040h,087h,054h,020h,047h	; 95ba  ...!....=\0B.8..p..@.T G
	defb 092h,020h,083h,096h,020h,087h,090h,020h,083h,08ah,030h,083h,0eeh,000h,08fh,0c2h,000h,0bfh,098h,000h,0bfh,054h,000h,077h	; 95d2  . .. .. ..0..........T.w
	defb 0a6h,000h,0e0h,0afh,000h,0e0h,06ch,002h,0e0h,048h,004h,0c1h,05bh,000h,0c1h,053h,004h,0c1h,056h,00ch,0d0h,043h,00ch,0c0h	; 95ea  ......l..H..[..S..V..C..
	defb 0f5h,000h,0f7h,002h,004h,009h,01dh,000h,0cfh,0c8h,000h,0e0h,097h,0c0h,030h,0cbh,000h,028h,02dh,000h,0ech,009h,000h,00ch	; 9602  ..............0..(-.....
	defb 05ah,040h,01fh,016h,060h,007h,036h,040h,007h,066h,000h,007h,074h,000h,047h,060h,000h,07fh,0b8h,000h,03fh,0ceh,000h,00fh	; 961a  Z@..`.6@.f..t.G`....?...
	defb 065h,010h,027h,065h,010h,027h,075h,010h,027h,075h,000h,027h,045h,010h,067h,095h,0e0h,007h,005h,000h,007h,003h,000h,07fh	; 9632  e.'e.'u.'u.'E.g.........
	defb 02bh,074h,080h,0c0h,000h,080h,0ffh,000h,0ffh,0abh,074h,080h,0c0h,000h,080h,0ffh,000h,0ffh,000h,000h,07fh,07fh,000h,07fh	; 964a  +t........t.............
	defb 008h,003h,0f8h,014h,000h,0f0h,0d3h,000h,093h,094h,000h,077h,0abh,000h,0bfh,0c6h,000h,09eh,0c5h,001h,09ch,0e5h,042h,09dh	; 9662  ...........w..........B.
	defb 0c7h,000h,0feh,006h,001h,0fch,096h,001h,0fch,0feh,001h,0fch,0b6h,041h,004h,006h,001h,004h,006h,001h,0fch,0feh,001h,0fch	; 967a  .............A..........
	defb 018h,000h,073h,046h,008h,063h,04eh,000h,06fh,052h,000h,07fh,04ch,000h,07eh,041h,000h,07fh,040h,000h,07fh,041h,000h,07fh	; 9692  ..sF.cN.oR..L.~A..@..A..
	defb 000h,000h,07fh,03ch,000h,07fh,026h,018h,043h,0bch,000h,07fh,0a6h,018h,043h,0bch,000h,07fh,0a6h,018h,043h,03ch,000h,07fh	; 96aa  ...<..&.C.....C.....C<..
	defb 026h,018h,043h,03ch,000h,07fh,0a6h,018h,043h,0bch,000h,07fh,026h,018h,043h,000h,000h,07fh,07fh,000h,000h,000h,000h,000h	; 96c2  &.C<....C...&.C.........
	defb 0b6h,041h,004h,086h,001h,084h,006h,001h,0fch,0feh,001h,0fch,0c7h,001h,0c4h,084h,003h,084h,004h,002h,004h,000h,000h,005h	; 96da  .A......................
	defb 006h,001h,0b0h,00fh,000h,0ffh,00fh,000h,0bfh,0c0h,000h,0ffh,040h,000h,0f3h,041h,000h,0feh,000h,000h,0bfh,000h,000h,0ffh	; 96f2  ............@..A........
	defb 03ah,0c0h,00fh,0fdh,000h,0ffh,03eh,000h,0ffh,040h,000h,07fh,040h,000h,070h,02fh,000h,0ffh,0c0h,000h,07fh,000h,000h,0ffh	; 970a  :.....>..@..@.p/........
	defb 0c2h,003h,0d4h,003h,002h,0fch,001h,06ah,094h,069h,002h,094h,069h,002h,0fch,0abh,000h,0fdh,042h,000h,07eh,023h,001h,03fh	; 9722  .......j.i..i.....B.~#.?
	defb 0f0h,000h,01fh,014h,000h,01fh,010h,000h,01bh,014h,000h,01bh,0e4h,000h,00bh,0f0h,000h,0fbh,014h,000h,01fh,030h,020h,0bfh	; 973a  .....................0 .
	defb 00fh,000h,03fh,049h,000h,07fh,002h,004h,079h,002h,006h,07fh,006h,006h,03fh,009h,000h,03fh,00ch,000h,03ch,00fh,000h,03fh	; 9752  ..?I....y.....?..?..<..?
	defb 03ah,000h,07eh,089h,000h,0ffh,001h,020h,0cfh,091h,030h,0ffh,032h,030h,07eh,04ah,000h,07eh,03ah,000h,03eh,0f2h,000h,0f6h	; 976a  :.~.... ..0.20~J.~:.>...
	defb 08eh,001h,00ch,07ch,003h,078h,06ch,003h,058h,0c7h,000h,08ch,0c3h,000h,08fh,0d5h,060h,08dh,040h,000h,0beh,086h,020h,0ffh	; 9782  ...|.xl.X.......`.@... .

; ----------------------------------------------------------------------
; DATOS dibujo_979A: 2 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 3 de la lista 0x80D4 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (48 bytes)
;   0x979a..0x97ca  (48 bytes)
DATA_dibujo_979A:
	defb 066h,064h,09ah,0aah,028h,0d6h,05ah,018h,066h,012h,010h,02eh,094h,090h,04ch,09fh,050h,02fh,0ffh,03fh,000h,0f0h,070h,00fh	; 979a  fd..(.Z.f.....L.P/.?..p.
	defb 0bch,088h,07fh,090h,080h,054h,088h,083h,05bh,083h,083h,04bh,08ch,084h,04fh,0a9h,082h,06ch,0a7h,084h,068h,0e7h,0e6h,008h	; 97b2  .....T..[..K..O..l..h...

; ----------------------------------------------------------------------
; DATOS dibujo_97CA: 1 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 4 de la lista 0x80D4 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (24 bytes)
;   0x97ca..0x97e2  (24 bytes)
DATA_dibujo_97CA:
	defb 0d5h,0a8h,004h,055h,0a8h,084h,0d3h,0a8h,004h,0d2h,029h,000h,034h,0cbh,000h,0e8h,016h,000h,0c1h,02ch,001h,000h,018h,0c3h	; 97ca  ...U......).4......,....

; ----------------------------------------------------------------------
; DATOS dibujo_97E2: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 5 de la lista 0x80D4 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (16 bytes)
;   0x97e2..0x97f2  (16 bytes)
DATA_dibujo_97E2:
	defb 0fbh,004h,0c7h,0c8h,0fbh,004h,007h,018h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 97e2  ................

; ----------------------------------------------------------------------
; DATOS dibujo_97F2: 4 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 6 de la lista 0x80D4 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (96 bytes)
;   0x97f2..0x9852  (96 bytes)
DATA_dibujo_97F2:
	defb 0cah,06fh,000h,0cah,06fh,000h,0cah,06fh,000h,0cah,0efh,000h,0cah,02fh,0c0h,00ah,02fh,000h,00ah,0efh,000h,0cah,02fh,000h	; 97f2  .o..o..o...../../...../.
	defb 00ah,04fh,000h,0aah,0efh,000h,00ah,04fh,000h,00ah,04fh,000h,00ah,05fh,000h,00ah,0bfh,000h,00ah,01fh,000h,04ah,01fh,000h	; 980a  .O.....O..O.._.......J..
	defb 0fah,007h,000h,002h,003h,000h,0feh,003h,0fch,0feh,0ffh,000h,000h,001h,000h,0feh,001h,000h,000h,055h,000h,0a8h,0fdh,000h	; 9822  ...................U....
	defb 000h,055h,000h,000h,055h,000h,000h,055h,000h,000h,055h,000h,000h,055h,000h,054h,0a9h,000h,000h,001h,000h,0ffh,000h,000h	; 983a  .U..U..U..U..U.T........

; ----------------------------------------------------------------------
; DATOS dibujo_9852: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 7 de la lista 0x80D4 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (8 bytes)
;   0x9852..0x985a  (8 bytes)
DATA_dibujo_9852:
	defb 0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh	; 9852  ........

; ----------------------------------------------------------------------
; DATOS dibujo_985A: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 8 de la lista 0x80D4 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (8 bytes)
;   0x985a..0x9862  (8 bytes)
DATA_dibujo_985A:
	defb 040h,040h,040h,040h,040h,040h,040h,040h	; 985a  @@@@@@@@

; ----------------------------------------------------------------------
; DATOS dibujo_9862: 15 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 9 de la lista 0x80D4 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (240 bytes)
;   0x9862..0x9952  (240 bytes)
DATA_dibujo_9862:
	defb 0ffh,000h,080h,07fh,080h,040h,080h,05fh,080h,05fh,0a0h,020h,0a0h,020h,0a0h,020h	; 9862  .....@._._. . .
	defb 0ffh,000h,080h,07fh,080h,000h,080h,03fh,040h,09fh,030h,010h,008h,018h,004h,00ch	; 9872  .......?@.0.....
	defb 0ffh,000h,001h,0feh,001h,000h,001h,0feh,001h,0feh,001h,000h,000h,001h,000h,001h	; 9882  ................
	defb 0ffh,000h,000h,0ffh,000h,080h,000h,0bfh,000h,0bfh,040h,040h,040h,040h,040h,040h	; 9892  ..........@@@@@@
	defb 0ffh,000h,001h,0feh,001h,000h,001h,0feh,002h,0fch,006h,002h,004h,00ch,008h,018h	; 98a2  ................
	defb 0ffh,000h,003h,0fch,003h,000h,003h,07ch,003h,0fch,003h,000h,001h,002h,001h,002h	; 98b2  .......|........
	defb 004h,00ch,004h,00ch,004h,00ch,004h,00ch,004h,00ch,004h,00ch,004h,00ch,004h,00ch	; 98c2  ................
	defb 008h,018h,008h,018h,008h,018h,008h,018h,008h,018h,008h,018h,008h,018h,008h,018h	; 98d2  ................
	defb 004h,00ch,008h,018h,010h,030h,020h,060h,040h,0c0h,040h,0c0h,040h,0c0h,0ffh,000h	; 98e2  .....0 `@.@.@...
	defb 000h,001h,000h,001h,000h,001h,000h,001h,000h,001h,000h,001h,000h,001h,0ffh,000h	; 98f2  ................
	defb 040h,040h,040h,040h,040h,040h,040h,040h,040h,040h,040h,040h,040h,040h,0ffh,000h	; 9902  @@@@@@@@@@@@@@..
	defb 008h,018h,004h,00ch,002h,006h,001h,003h,000h,001h,000h,001h,000h,001h,0ffh,000h	; 9912  ................
	defb 040h,0f5h,040h,0f5h,040h,0f5h,040h,0f5h,040h,0f5h,055h,0eah,040h,0e0h,05fh,0e0h	; 9922  @.@.@.@.@.U.@._.
	defb 040h,0f5h,04ah,0ffh,040h,0f5h,040h,0f5h,040h,0f5h,040h,0f5h,040h,0f5h,040h,0f5h	; 9932  @.J.@.@.@.@.@.@.
	defb 040h,0f5h,040h,0f5h,040h,0f5h,040h,0f5h,040h,0f5h,055h,0eah,000h,080h,0ffh,000h	; 9942  @.@.@.@.@.U.....

; ----------------------------------------------------------------------
; DATOS dibujo_9952: 7 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 10 de la lista 0x80D4 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (168 bytes)
;   0x9952..0x99fa  (168 bytes)
DATA_dibujo_9952:
	defb 000h,000h,000h,000h,070h,008h,000h,000h,038h,000h,000h,0f8h,0a0h,080h,080h,0a0h,080h,080h,0a0h,080h,080h,0a0h,080h,080h	; 9952  ....p...8...............
	defb 000h,000h,001h,002h,01ch,001h,000h,000h,019h,001h,001h,01fh,001h,001h,003h,001h,001h,003h,001h,001h,003h,001h,001h,003h	; 996a  ........................
	defb 000h,000h,000h,000h,070h,008h,000h,000h,038h,000h,000h,0f8h,0a0h,080h,080h,0a0h,080h,080h,0a0h,080h,080h,0ffh,0ffh,0ffh	; 9982  ....p...8...............
	defb 000h,000h,001h,002h,01ch,001h,000h,000h,019h,001h,001h,01fh,081h,001h,003h,081h,001h,003h,081h,001h,003h,0ffh,0ffh,0ffh	; 999a  ........................
	defb 04ah,013h,0a4h,04ah,013h,0a4h,04ah,013h,0a4h,04ah,013h,0a4h,048h,013h,0a4h,048h,010h,0a4h,048h,010h,0a7h,04bh,013h,0a7h	; 99b2  J..J..J..J..H..H..H..K..
	defb 048h,010h,0a7h,048h,010h,0a0h,040h,01fh,0a0h,05fh,000h,0a0h,040h,000h,0a0h,04fh,00fh,0bfh,040h,000h,0b5h,04ah,000h,0b5h	; 99ca  H..H..@.._..@..O..@..J..
	defb 048h,010h,0a5h,04ah,010h,0a5h,048h,010h,0a5h,048h,010h,0a5h,048h,010h,0a5h,048h,010h,0a2h,048h,010h,0a0h,048h,010h,0a5h	; 99e2  H..J..H..H..H..H..H..H..

; ----------------------------------------------------------------------
; DATOS dibujo_99FA: 1 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 11 de la lista 0x80D4 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (24 bytes)
;   0x99fa..0x9a12  (24 bytes)
DATA_dibujo_99FA:
	defb 000h,080h,07eh,01ch,0a2h,040h,000h,0beh,05ch,000h,080h,000h,000h,0a2h,044h,000h,0a2h,044h,000h,0a2h,044h,000h,080h,000h	; 99fa  ..~..@..\.....D..D..D...

; ----------------------------------------------------------------------
; DATOS dibujo_9A12: 5 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 12 de la lista 0x80D4 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (120 bytes)
;   0x9a12..0x9a8a  (120 bytes)
DATA_dibujo_9A12:
	defb 0ffh,080h,000h,0b8h,080h,007h,09fh,09ch,063h,0afh,0aeh,051h,0b7h,097h,068h,0bbh,08bh,074h,0fdh,085h,03ah,0fdh,0a3h,01ch	; 9a12  ........c..Q..h..t..:...
	defb 0ffh,000h,000h,078h,000h,087h,0ffh,03ch,0c3h,0ffh,01eh,0e1h,0ffh,00fh,0f0h,0ffh,087h,078h,0c3h,0ffh,000h,0ffh,0ffh,000h	; 9a2a  ...x...<.........x......
	defb 0ffh,001h,000h,079h,001h,086h,0f9h,03bh,0c4h,0f7h,017h,0e8h,0efh,00fh,0f0h,0dfh,097h,068h,0ffh,0a3h,05ch,0fdh,0e3h,01ch	; 9a42  ...y.............h..\...
	defb 0fdh,0b3h,00ch,0fdh,0bbh,004h,0bdh,0bfh,040h,0bfh,09fh,060h,0bfh,08fh,070h,0bfh,087h,078h,0ffh,083h,03ch,0fdh,0a3h,01ch	; 9a5a  ........@..`..p..x..<...
	defb 0fdh,0b3h,00ch,0fdh,0bbh,004h,0bdh,0bfh,040h,0bfh,09fh,060h,0bfh,08fh,070h,0bfh,087h,078h,0ffh,083h,03ch,0ffh,0ffh,000h	; 9a72  ........@..`..p..x..<...

; ----------------------------------------------------------------------
; DATOS dibujo_9A8A: 15 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 0 de la lista 0x819E (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (240 bytes)
;   0x9a8a..0x9b7a  (240 bytes)
DATA_dibujo_9A8A:
	defb 0a5h,0f8h,0a5h,0f8h,085h,0d8h,085h,0d8h,0b5h,0d8h,0b5h,0d8h,0a5h,0c8h,0a5h,0c8h	; 9a8a  ................
	defb 0bdh,0c8h,0bdh,0c8h,0b5h,0c0h,0b5h,0c0h,0adh,0c4h,0adh,0c4h,0a9h,0c0h,0a9h,0c0h	; 9a9a  ................
	defb 0a5h,0c8h,0a5h,0c8h,0a5h,0c8h,0a5h,0c8h,0a5h,0c8h,0a5h,0c8h,0a5h,0c8h,0a5h,0c8h	; 9aaa  ................
	defb 0a0h,0dfh,0bfh,0c0h,0a0h,0c0h,0bfh,0c0h,0b0h,0cfh,0bfh,0c0h,0b0h,0c0h,0bfh,0c0h	; 9aba  ................
	defb 0a8h,0c7h,0afh,0c0h,0a8h,0c0h,0afh,0c0h,0a4h,0cbh,0a7h,0c8h,0a4h,0c8h,0a7h,0c8h	; 9aca  ................
	defb 0a6h,0c9h,0a7h,0c8h,0a6h,0c8h,0a6h,0c9h,0a5h,0c8h,0a5h,0c8h,0a5h,0c8h,0a5h,0c8h	; 9ada  ................
	defb 0a5h,0c8h,025h,048h,025h,048h,025h,0c8h,0e5h,008h,0e5h,008h,005h,068h,0c5h,028h	; 9aea  ..%H%H%......h.(
	defb 025h,0c8h,0e5h,008h,005h,028h,0e5h,008h,005h,0e8h,0e5h,008h,005h,008h,0f5h,008h	; 9afa  %....(..........
	defb 000h,0ffh,0ffh,000h,000h,000h,0ffh,000h,000h,0ffh,0ffh,000h,000h,000h,0ffh,000h	; 9b0a  ................
	defb 0d1h,042h,0d1h,042h,0d1h,042h,0d1h,042h,0d1h,042h,0d1h,042h,0d1h,042h,0d1h,042h	; 9b1a  .B.B.B.B.B.B.B.B
	defb 000h,0ffh,0ffh,000h,000h,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh	; 9b2a  ................
	defb 00dh,058h,0adh,0f8h,00dh,058h,00dh,058h,00dh,058h,00dh,0b8h,00dh,018h,04dh,018h	; 9b3a  .X...X.X.X....M.
	defb 001h,054h,001h,054h,001h,054h,001h,054h,001h,054h,055h,0a8h,001h,000h,0fdh,000h	; 9b4a  .T.T.T.T.TU.....
	defb 001h,054h,0a9h,0fch,001h,054h,001h,054h,001h,054h,001h,054h,001h,054h,001h,054h	; 9b5a  .T...T.T.T.T.T.T
	defb 001h,054h,001h,054h,001h,054h,001h,054h,001h,054h,055h,0a8h,001h,000h,0ffh,000h	; 9b6a  .T.T.T.T.TU.....

; ----------------------------------------------------------------------
; DATOS dibujo_9B7A: 17 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 1 de la lista 0x819E (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (408 bytes)
;   0x9b7a..0x9d12  (408 bytes)
DATA_dibujo_9B7A:
	defb 000h,0ffh,000h,080h,000h,000h,080h,000h,000h,080h,000h,07fh,0ffh,07fh,07fh,0c0h,040h,07fh,0c0h,040h,040h,0dfh,05fh,07fh	; 9b7a  ................@..@@._.
	defb 000h,0ffh,000h,000h,000h,000h,000h,000h,000h,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,000h,0ffh,0ffh,0ffh	; 9b92  ........................
	defb 000h,0ffh,000h,000h,000h,000h,000h,000h,000h,000h,000h,0ffh,0ffh,0ffh,0ffh,0d1h,091h,093h,0d1h,091h,093h,0d1h,091h,093h	; 9baa  ........................
	defb 06dh,0a5h,025h,06dh,0a5h,025h,06dh,0a5h,025h,06dh,0a5h,025h,06dh,0a5h,025h,02dh,025h,025h,02dh,025h,0e5h,0edh,0e5h,0e5h	; 9bc2  m.%m.%m.%m.%m.%-%%-%....
	defb 0fdh,0f5h,0f5h,00dh,005h,005h,005h,0fdh,005h,0fdh,005h,005h,005h,005h,005h,0fdh,0fdh,0fdh,001h,001h,055h,0a9h,001h,055h	; 9bda  ....................U..U
	defb 001h,001h,0feh,0f9h,003h,004h,001h,005h,008h,001h,009h,012h,005h,019h,022h,005h,029h,042h,005h,049h,092h,025h,049h,092h	; 9bf2  ..............".)B.I.%I.
	defb 027h,047h,082h,027h,047h,082h,023h,047h,082h,023h,047h,082h,02bh,04bh,082h,02bh,04bh,082h,023h,04bh,082h,023h,04bh,082h	; 9c0a  'G.'G.#G.#G.+K.+K.#K.#K.
	defb 017h,053h,082h,017h,053h,082h,007h,053h,082h,007h,053h,082h,027h,06bh,082h,027h,06bh,082h,007h,06bh,082h,007h,06bh,082h	; 9c22  .S..S..S..S.'k.'k..k..k.
	defb 025h,049h,092h,025h,049h,092h,025h,049h,092h,025h,049h,092h,025h,049h,092h,025h,049h,092h,025h,049h,092h,025h,049h,092h	; 9c3a  %I.%I.%I.%I.%I.%I.%I.%I.
	defb 0a4h,0c9h,092h,024h,049h,092h,024h,049h,092h,024h,048h,093h,025h,049h,093h,025h,049h,093h,024h,049h,092h,025h,049h,093h	; 9c52  ...$I.$I.$H.%I.%I.$I.%I.
	defb 026h,04ah,092h,027h,04bh,093h,024h,04ah,090h,027h,04bh,093h,025h,04ch,094h,027h,04fh,097h,020h,04ch,090h,027h,04fh,097h	; 9c6a  &J.'K.$J.'K.%L.'O. L.'O.
	defb 02ah,048h,099h,02fh,04fh,09fh,020h,048h,090h,02fh,04fh,09fh,034h,050h,093h,03fh,05fh,09fh,020h,050h,080h,03fh,05fh,09fh	; 9c82  *H./O. H./O.4P.?_. P.?_.
	defb 028h,060h,0a7h,03fh,07fh,0bfh,000h,060h,080h,03fh,07fh,0bfh,050h,040h,0cfh,000h,040h,080h,07fh,07fh,0ffh,000h,000h,0ffh	; 9c9a  (`.?...`.?..P@..@.......
	defb 000h,0ffh,000h,001h,001h,000h,001h,001h,000h,001h,001h,0feh,0ffh,0ffh,0feh,003h,003h,0feh,003h,003h,002h,0ffh,0ffh,0feh	; 9cb2  ........................
	defb 007h,005h,0fch,0ffh,0fdh,0fch,007h,005h,004h,007h,005h,0fch,00dh,009h,0fah,0fdh,0f9h,0fah,00dh,009h,00ah,00dh,009h,0fah	; 9cca  ........................
	defb 01dh,011h,0f2h,0fdh,0f1h,0f2h,01dh,011h,012h,00dh,001h,0f2h,035h,029h,0e2h,0f5h,0e9h,0e2h,035h,029h,022h,035h,029h,0e2h	; 9ce2  ............5)....5)"5).
	defb 065h,049h,0d2h,0e5h,0c9h,0d2h,065h,049h,052h,0e5h,0c9h,0d2h,0e5h,089h,092h,0e5h,089h,092h,0e5h,089h,092h,0e5h,089h,092h	; 9cfa  eI....eIR...............

; ----------------------------------------------------------------------
; DATOS sin identificar  0x9d12..0x9d2a  (24 bytes)
DATA_9D12:
	defb 000h,000h,0ffh,0ffh,0ffh,0ffh,000h,000h,000h,0ffh,0ffh,0ffh,056h,042h,056h,000h	; 9d12  ............VBV.
	defb 000h,000h,0ffh,0ffh,0ffh,000h,000h,0ffh	; 9d22  ........

; ----------------------------------------------------------------------
; DATOS dibujo_9D2A: 1 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 2 de la lista 0x819E (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (24 bytes)
;   0x9d2a..0x9d42  (24 bytes)
DATA_dibujo_9D2A:
	defb 000h,0ffh,000h,0ffh,000h,000h,0ffh,0ffh,0ffh,0ffh,000h,000h,0d7h,081h,095h,0ffh,0ffh,0ffh,0ffh,000h,000h,000h,0ffh,000h	; 9d2a  ........................

; ----------------------------------------------------------------------
; DATOS dibujo_9D42: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 3 de la lista 0x819E (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (16 bytes)
;   0x9d42..0x9d52  (16 bytes)
DATA_dibujo_9D42:
	defb 080h,0ffh,0bfh,0ffh,080h,0a0h,084h,0d6h,0a0h,0c8h,0a0h,0c4h,0a0h,0cah,0a4h,0c9h	; 9d42  ................

; ----------------------------------------------------------------------
; DATOS dibujo_9D52: 4 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 0 de la lista 0x8217 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (64 bytes)
;   0x9d52..0x9d92  (64 bytes)
DATA_dibujo_9D52:
	defb 0feh,0ffh,080h,081h,080h,081h,000h,0ffh,0feh,0ffh,080h,081h,080h,081h,000h,0ffh	; 9d52  ................
	defb 001h,000h,001h,07eh,001h,07eh,0ffh,000h,001h,000h,001h,07eh,001h,07eh,0ffh,000h	; 9d62  ...~.~.....~.~..
	defb 0feh,0ffh,080h,081h,080h,0c1h,0e0h,01fh,00eh,00fh,000h,079h,000h,07dh,0feh,001h	; 9d72  ...........y.}..
	defb 001h,000h,081h,0feh,081h,0beh,01fh,0e0h,0f1h,0f0h,081h,086h,081h,082h,001h,0feh	; 9d82  ................

; ----------------------------------------------------------------------
; DATOS dibujo_9D92: 2 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 1 de la lista 0x8217 (p00:4D92, p00:4DF5); lo leen p00:4C0C (16
;   bytes)
;   0x9d92..0x9da2  (16 bytes)
DATA_dibujo_9D92:
	defb 089h,0ffh,0a2h,0ffh,0c1h,0ffh,089h,0ffh	; 9d92  ........
	defb 021h,0ffh,00bh,0ffh,003h,0ffh,085h,0ffh	; 9d9a  !.......

; ----------------------------------------------------------------------
; DATOS dibujo_9DA2: 19 caracteres de 8x8 a 1 bit por punto (8 bytes cada
;   uno), ficha 2 de la lista 0x8217 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (152 bytes)
;   0x9da2..0x9e3a  (152 bytes)
DATA_dibujo_9DA2:
	defb 000h,06eh,06eh,06eh,000h,06eh,06eh,06eh	; 9da2  .nnn.nnn
	defb 000h,0beh,0b2h,0b2h,080h,0beh,0b2h,0b2h	; 9daa  ........
	defb 000h,06eh,06eh,000h,06eh,06eh,000h,0ffh	; 9db2  .nn.nn..
	defb 000h,0beh,0beh,080h,0beh,0beh,000h,0ffh	; 9dba  ........
	defb 0feh,0fdh,0fdh,0fbh,0fbh,0fbh,0f7h,0ffh	; 9dc2  ........
	defb 000h,0ffh,0ffh,0ffh,000h,07fh,000h,0ffh	; 9dca  ........
	defb 0ffh,0ffh,0ffh,0ffh,0dfh,0cbh,0b4h,07fh	; 9dd2  ........
	defb 0ffh,0ffh,0ffh,0dfh,0abh,075h,0fdh,0feh	; 9dda  .....u..
	defb 0ffh,0ffh,0dfh,0dfh,081h,03ch,000h,06fh	; 9de2  .....<.o
	defb 0ffh,0fbh,0fbh,0fbh,0e3h,008h,000h,056h	; 9dea  .......V
	defb 000h,06fh,000h,06fh,000h,06fh,000h,06fh	; 9df2  .o.o.o.o
	defb 040h,056h,040h,056h,040h,056h,040h,056h	; 9dfa  @V@V@V@V
	defb 000h,06fh,000h,06fh,000h,06fh,000h,0ffh	; 9e02  .o.o.o..
	defb 000h,056h,040h,056h,040h,056h,000h,0ffh	; 9e0a  .V@V@V..
	defb 07fh,080h,0dfh,0dfh,0efh,0efh,0efh,0ffh	; 9e12  ........
	defb 0f0h,00fh,0efh,0dfh,0dfh,0bfh,0bfh,0ffh	; 9e1a  ........
	defb 0ffh,0ffh,0ffh,0ffh,083h,07dh,07dh,07dh	; 9e22  .....}}}
	defb 07fh,0bfh,0dfh,0dfh,0efh,0efh,0f7h,0ffh	; 9e2a  ........
	defb 000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9e32  ........

; ----------------------------------------------------------------------
; DATOS dibujo_9E3A: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 3 de la lista 0x8217 (p00:4D92, p00:4DF5); lo leen p00:4C0C (8
;   bytes)
;   0x9e3a..0x9e42  (8 bytes)
DATA_dibujo_9E3A:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0e0h,0dfh,0bfh	; 9e3a  ........

; ----------------------------------------------------------------------
; DATOS dibujo_9E42: 5 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 4 de la lista 0x8217 (p00:4D92, p00:4DF5); lo leen p00:4C0C (40
;   bytes)
;   0x9e42..0x9e6a  (40 bytes)
DATA_dibujo_9E42:
	defb 001h,001h,001h,001h,001h,001h,001h,001h	; 9e42  ........
	defb 001h,001h,001h,001h,001h,001h,001h,0ffh	; 9e4a  ........
	defb 000h,000h,000h,000h,000h,000h,000h,0ffh	; 9e52  ........
	defb 0ffh,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh	; 9e5a  ........
	defb 000h,000h,000h,000h,000h,000h,000h,000h	; 9e62  ........

; ----------------------------------------------------------------------
; DATOS dibujo_9E6A: 3 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 5 de la lista 0x8217 (p00:4D92, p00:4DF5); lo leen p00:4C0C (24
;   bytes)
;   0x9e6a..0x9e82  (24 bytes)
DATA_dibujo_9E6A:
	defb 000h,000h,000h,000h,000h,000h,000h,000h	; 9e6a  ........
	defb 080h,080h,080h,080h,080h,080h,080h,080h	; 9e72  ........
	defb 001h,001h,001h,001h,001h,001h,001h,001h	; 9e7a  ........

; ----------------------------------------------------------------------
; DATOS dibujo_9E82: 3 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 6 de la lista 0x8217 (p00:4D92, p00:4DF5); lo leen p00:4C0C (24
;   bytes)
;   0x9e82..0x9e9a  (24 bytes)
DATA_dibujo_9E82:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9e82  ........
	defb 07fh,07fh,07fh,07fh,0ffh,0ffh,0ffh,0ffh	; 9e8a  ........
	defb 0ffh,000h,000h,000h,000h,000h,000h,000h	; 9e92  ........

; ----------------------------------------------------------------------
; DATOS dibujo_9E9A: 29 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 7 de la lista 0x8217 (p00:4D92, p00:4DF5) (sigue en el banco
;   39, en 0xA000); lo leen p00:4C0C (358 bytes)
;   0x9e9a..0xa000  (358 bytes)
DATA_dibujo_9E9A:
	defb 0ffh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0ffh,0ffh	; 9e9a  ................
	defb 07fh,080h,07fh,080h,000h,0ffh,000h,080h,000h,080h,000h,080h,000h,080h,000h,080h	; 9eaa  ................
	defb 0ffh,000h,0ffh,000h,000h,0ffh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 9eba  ................
	defb 070h,050h,070h,050h,070h,050h,070h,050h,03fh,02fh,03fh,028h,038h,028h,038h,028h	; 9eca  pPpPpPpP?/?(8(8(
	defb 000h,080h,000h,080h,000h,080h,000h,080h,000h,080h,000h,080h,000h,080h,000h,080h	; 9eda  ................
	defb 000h,080h,000h,080h,000h,080h,000h,080h,000h,080h,000h,080h,000h,080h,0ffh,0ffh	; 9eea  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,0ffh,0ffh,0ffh,000h,000h,000h,000h,000h	; 9efa  ................
	defb 01ch,014h,01ch,014h,01ch,014h,01ch,014h,00eh,00ah,00eh,00ah,00eh,00ah,00fh,00bh	; 9f0a  ................
	defb 007h,005h,007h,005h,007h,005h,007h,005h,003h,003h,003h,003h,003h,003h,003h,003h	; 9f1a  ................
	defb 000h,0ffh,000h,0ffh,055h,0d5h,07fh,0d5h,07fh,0d5h,055h,0d5h,000h,080h,000h,0ffh	; 9f2a  ....U.....U.....
	defb 000h,0ffh,000h,0ffh,054h,057h,0fch,057h,0fch,057h,054h,057h,000h,003h,000h,0ffh	; 9f3a  ....TW.W.WTW....
	defb 000h,0ffh,000h,000h,0ffh,0ffh,071h,073h,003h,003h,070h,070h,000h,000h,000h,000h	; 9f4a  ......qs..pp....
	defb 000h,0ffh,000h,000h,0ffh,0ffh,080h,000h,0a2h,03eh,0beh,03eh,080h,000h,080h,000h	; 9f5a  .........>.>....
	defb 080h,0ffh,0c0h,080h,0ffh,0ffh,0c0h,080h,0c2h,082h,0a0h,0a0h,0a0h,0a0h,0a0h,0a0h	; 9f6a  ................
	defb 0bfh,0c0h,0bfh,0c0h,0bfh,0c0h,0bfh,0c0h,080h,0ffh,080h,080h,0bfh,0ffh,0c0h,0bfh	; 9f7a  ................
	defb 0ffh,07fh,0c6h,07fh,0ffh,07fh,0ffh,000h,000h,0ffh,000h,000h,0ffh,0ffh,000h,0ffh	; 9f8a  ................
	defb 0ffh,0ffh,009h,0ffh,0ffh,0ffh,0ffh,000h,000h,0ffh,000h,000h,0ffh,0ffh,000h,0ffh	; 9f9a  ................
	defb 0ffh,000h,0ffh,01eh,0ffh,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh,0ffh,000h,0ffh	; 9faa  ................
	defb 0ffh,000h,080h,000h,080h,000h,09fh,01fh,090h,010h,097h,017h,097h,017h,097h,017h	; 9fba  ................
	defb 0ffh,000h,000h,000h,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9fca  ................
	defb 0ffh,000h,001h,000h,001h,000h,0f9h,0f8h,009h,008h,0e9h,0e8h,0e9h,0e8h,0e9h,0e8h	; 9fda  ................
	defb 001h,0ffh,001h,001h,0ffh,0ffh,081h,001h,081h,001h,081h,001h,081h,001h,081h,001h	; 9fea  ................
	defb 0ffh,0ffh,01bh,013h,01bh,013h	; 9ffa
