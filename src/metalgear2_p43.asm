; ==========================================================================
; METAL GEAR 2 SOLID SNAKE - Konami (1990) - MSX2 - MegaROM RC-767 de 512 KB (Konami SCC) - banco 43 (se ejecuta en 0xa000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x0a000


; ----------------------------------------------------------------------
; DATOS dibujo_9FD3_cola: 3 caracteres de 8x8 a 2 bits por punto (16 bytes
;   cada uno), ficha 29 de la lista 0x880B (p00:4D92, p00:4DF5) (sigue del
;   banco 42); lo leen p00:4C0C (3 bytes)
;   0xa000..0xa003  (3 bytes)
DATA_dibujo_9FD3_cola:
	defb 000h,000h,000h	; a000

; ----------------------------------------------------------------------
; DATOS dibujo_A003: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 30 de la lista 0x880B (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (16 bytes)
;   0xa003..0xa013  (16 bytes)
DATA_dibujo_A003:
	defb 0bfh,040h,0bfh,040h,0bfh,040h,0bfh,040h,0bfh,040h,0bfh,050h,0afh,040h,000h,000h	; a003  .@.@.@.@.@.P.@..

; ----------------------------------------------------------------------
; DATOS dibujo_A013: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 31 de la lista 0x880B (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (16 bytes)
;   0xa013..0xa023  (16 bytes)
DATA_dibujo_A013:
	defb 0ffh,0ffh,0ffh,000h,000h,000h,000h,000h,0ffh,000h,000h,000h,0ffh,000h,0ffh,0ffh	; a013  ................

; ----------------------------------------------------------------------
; DATOS dibujo_A023: 3 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 0 de la lista 0x88AC (p00:4D92, p00:4DF5); lo leen p00:4C0C (24
;   bytes)
;   0xa023..0xa03b  (24 bytes)
DATA_dibujo_A023:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; a023  ........
	defb 000h,000h,000h,000h,000h,000h,000h,000h	; a02b  ........
	defb 0ffh,07fh,03fh,01fh,00fh,007h,003h,001h	; a033  ..?.....

; ----------------------------------------------------------------------
; DATOS dibujo_A03B: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 1 de la lista 0x88AC (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (32 bytes)
;   0xa03b..0xa05b  (32 bytes)
DATA_dibujo_A03B:
	defb 03fh,040h,03fh,040h,03fh,040h,03fh,040h,03fh,040h,03fh,040h,03fh,040h,03fh,040h	; a03b  ?@?@?@?@?@?@?@?@
	defb 080h,000h,080h,07fh,0ffh,000h,0ffh,000h,080h,000h,080h,07fh,0ffh,000h,0ffh,000h	; a04b  ................

; ----------------------------------------------------------------------
; DATOS dibujo_A05B: 3 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 2 de la lista 0x88AC (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (48 bytes)
;   0xa05b..0xa08b  (48 bytes)
DATA_dibujo_A05B:
	defb 07fh,040h,07fh,040h,07fh,040h,07fh,040h,07fh,040h,07fh,040h,07fh,040h,07fh,040h	; a05b  .@.@.@.@.@.@.@.@
	defb 000h,07fh,07fh,07fh,07fh,040h,07fh,040h,000h,07fh,07fh,07fh,07fh,040h,07fh,040h	; a06b  .....@.@.....@.@
	defb 000h,0ffh,0ffh,0ffh,0ffh,000h,0ffh,000h,000h,0ffh,0ffh,0ffh,0ffh,000h,0ffh,000h	; a07b  ................

; ----------------------------------------------------------------------
; DATOS dibujo_A08B: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 3 de la lista 0x88AC (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (16 bytes)
;   0xa08b..0xa09b  (16 bytes)
DATA_dibujo_A08B:
	defb 0ffh,0ffh,0dbh,0b6h,0ffh,0ffh,0dbh,0b6h,0ffh,0ffh,0dbh,0b6h,0ffh,0ffh,0dbh,0b6h	; a08b  ................

; ----------------------------------------------------------------------
; DATOS dibujo_A09B: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 4 de la lista 0x88AC (p00:4D92, p00:4DF5); lo leen p00:4C0C (8
;   bytes)
;   0xa09b..0xa0a3  (8 bytes)
DATA_dibujo_A09B:
	defb 080h,0c0h,0e0h,0f0h,0f8h,0fch,0feh,0ffh	; a09b  ........

; ----------------------------------------------------------------------
; DATOS dibujo_A0A3: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 5 de la lista 0x88AC (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (16 bytes)
;   0xa0a3..0xa0b3  (16 bytes)
DATA_dibujo_A0A3:
	defb 0ffh,0ffh,0ffh,000h,000h,000h,000h,000h,000h,000h,0ffh,000h,000h,000h,0ffh,0ffh	; a0a3  ................

; ----------------------------------------------------------------------
; DATOS dibujo_A0B3: 2 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 6 de la lista 0x88AC (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (48 bytes)
;   0xa0b3..0xa0e3  (48 bytes)
DATA_dibujo_A0B3:
	defb 00fh,0ffh,00fh,0ffh,008h,00fh,0ffh,00bh,00ch,0ffh,0cbh,0cch,0ffh,04bh,04ch,0ffh,048h,04fh,0ffh,04bh,04ch,0ffh,04fh,04fh	; a0b3  .............KL.HO.KL.OO
	defb 0f0h,0ffh,0f0h,0f7h,018h,0f0h,0f7h,0f8h,010h,0f7h,0fbh,013h,0f7h,0fah,012h,0f7h,01ah,0f2h,0f7h,0fah,012h,0f7h,0fah,0f2h	; a0cb  ........................

; ----------------------------------------------------------------------
; DATOS dibujo_A0E3: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 7 de la lista 0x88AC (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (16 bytes)
;   0xa0e3..0xa0f3  (16 bytes)
DATA_dibujo_A0E3:
	defb 07fh,07fh,03fh,03fh,01fh,01fh,04fh,00fh,067h,007h,073h,003h,079h,001h,07ch,001h	; a0e3  ..??..O.g.s.y.|.

; ----------------------------------------------------------------------
; DATOS dibujo_A0F3: 1 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 8 de la lista 0x88AC (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (24 bytes)
;   0xa0f3..0xa10b  (24 bytes)
DATA_dibujo_A0F3:
	defb 0ffh,001h,0feh,0ffh,003h,0fch,0ffh,005h,0f8h,0fdh,00bh,0f0h,0f9h,017h,0e0h,0f1h,02fh,0c0h,0e1h,05fh,080h,041h,03fh,000h	; a0f3  ................/.._.A?.

; ----------------------------------------------------------------------
; DATOS dibujo_A10B: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 9 de la lista 0x88AC (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (16 bytes)
;   0xa10b..0xa11b  (16 bytes)
DATA_dibujo_A10B:
	defb 001h,001h,001h,001h,001h,001h,001h,001h,001h,003h,001h,003h,001h,003h,001h,003h	; a10b  ................

; ----------------------------------------------------------------------
; DATOS dibujo_A11B: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 10 de la lista 0x88AC (p00:4D92, p00:4DF5); lo leen p00:4C0C (8
;   bytes)
;   0xa11b..0xa123  (8 bytes)
DATA_dibujo_A11B:
	defb 0ffh,000h,000h,000h,000h,000h,000h,000h	; a11b  ........

; ----------------------------------------------------------------------
; DATOS dibujo_A123: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 11 de la lista 0x88AC (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (16 bytes)
;   0xa123..0xa133  (16 bytes)
DATA_dibujo_A123:
	defb 0ffh,000h,0ffh,000h,0ffh,020h,0dfh,020h,0ffh,000h,0fdh,004h,0f9h,002h,0ffh,000h	; a123  ..... . ........

; ----------------------------------------------------------------------
; DATOS dibujo_A133: 12 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 12 de la lista 0x88AC (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (192 bytes)
;   0xa133..0xa1f3  (192 bytes)
DATA_dibujo_A133:
	defb 080h,0ffh,083h,0c0h,08fh,0c0h,09fh,0c0h,09fh,0c0h,0bfh,0c0h,09fh,0c0h,0bfh,0c0h	; a133  ................
	defb 0bfh,0c0h,0bfh,0c0h,0bfh,0c0h,0bfh,0c0h,0bfh,0c0h,0bfh,0c0h,0bfh,0c0h,0bfh,0c0h	; a143  ................
	defb 09fh,0c0h,08fh,0c0h,082h,0c0h,0ffh,0ffh,080h,0ffh,0a3h,0c0h,0b7h,0c0h,0bfh,0c0h	; a153  ................
	defb 0e7h,030h,0c7h,060h,087h,0c0h,06fh,080h,0efh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; a163  .0.`..o.........
	defb 0ffh,000h,0ffh,000h,0fdh,000h,0d8h,000h,0ffh,0ffh,000h,0ffh,083h,000h,0dfh,000h	; a173  ................
	defb 000h,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,002h,0fdh,022h,0efh,050h,0dfh,020h	; a183  ...........".P.
	defb 0ffh,000h,0c3h,000h,0b9h,03ch,0c7h,04ah,0cdh,054h,099h,028h,0b1h,052h,0c3h,03ch	; a193  .....<.J.T.(.R.<
	defb 0bfh,0c0h,0bfh,0c0h,0b7h,0c0h,0a5h,0c0h,0ffh,0ffh,0c0h,080h,0bfh,0c0h,0ffh,0ffh	; a1a3  ................
	defb 0ffh,000h,0fbh,000h,0fbh,000h,0d3h,000h,0ffh,0ffh,000h,000h,0ffh,000h,0ffh,0ffh	; a1b3  ................
	defb 0ffh,000h,0ffh,000h,07dh,000h,055h,000h,0ffh,0ffh,000h,000h,0ffh,000h,0ffh,0ffh	; a1c3  ....}.U.........
	defb 01fh,008h,01fh,008h,01fh,008h,01fh,00fh,00ch,007h,00fh,004h,00fh,004h,00fh,004h	; a1d3  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,003h,0fch,007h,0f8h,00ch,0f1h,018h	; a1e3  ................

; ----------------------------------------------------------------------
; DATOS dibujo_A1F3: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 13 de la lista 0x88AC (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (16 bytes)
;   0xa1f3..0xa203  (16 bytes)
DATA_dibujo_A1F3:
	defb 0ffh,000h,0dfh,020h,09fh,060h,001h,0feh,0ffh,000h,0ffh,0eah,0ffh,000h,0ffh,0f6h	; a1f3  ... .`..........

; ----------------------------------------------------------------------
; DATOS lista_A203: 24 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x0000); lo leen p00:4C0C, p00:4C26 (121 bytes)
;   0xa203..0xa27c  (121 bytes)
DATA_lista_A203:
	defb 001h,00bh,001h,098h,0a3h	; a203
	defb 002h,016h,004h,0a0h,0a3h	; a208
	defb 045h,00bh,006h,0b0h,0a3h	; a20d
	defb 003h,010h,011h,000h,0a4h	; a212
	defb 043h,010h,014h,018h,0a4h	; a217
	defb 042h,00bh,01eh,048h,0a4h	; a21c
	defb 04bh,000h,020h,068h,0a4h	; a221
	defb 043h,016h,030h,018h,0a5h	; a226
	defb 044h,001h,033h,048h,0a5h	; a22b
	defb 042h,000h,037h,088h,0a5h	; a230
	defb 092h,010h,039h,0a8h,0a5h	; a235
	defb 045h,00bh,051h,058h,0a7h	; a23a
	defb 046h,002h,056h,0a8h,0a7h	; a23f
	defb 046h,000h,05ch,008h,0a8h	; a244
	defb 043h,011h,062h,068h,0a8h	; a249
	defb 046h,003h,065h,098h,0a8h	; a24e
	defb 089h,00bh,06bh,0f8h,0a8h	; a253
	defb 042h,004h,075h,0d0h,0a9h	; a258
	defb 041h,00dh,077h,0f0h,0a9h	; a25d
	defb 044h,00bh,07bh,000h,0aah	; a262
	defb 082h,00fh,078h,040h,0aah	; a267
	defb 042h,004h,04eh,070h,0aah	; a26c
	defb 042h,001h,002h,090h,0aah	; a271
	defb 041h,00dh,07ah,0b0h,0aah	; a276
	defb 0ffh	; a27b

; ----------------------------------------------------------------------
; DATOS lista_A27C: 22 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x0000); lo leen p00:4C0C, p00:4C26 (111 bytes)
;   0xa27c..0xa2eb  (111 bytes)
DATA_lista_A27C:
	defb 006h,015h,081h,0c0h,0aah	; a27c
	defb 04fh,015h,087h,0f0h,0aah	; a281
	defb 044h,011h,096h,0e0h,0abh	; a286
	defb 042h,015h,09ah,020h,0ach	; a28b
	defb 086h,015h,09ch,040h,0ach	; a290
	defb 001h,015h,0a4h,0d0h,0ach	; a295
	defb 003h,00dh,0a5h,0d8h,0ach	; a29a
	defb 002h,003h,0a8h,0f0h,0ach	; a29f
	defb 001h,00bh,0aah,000h,0adh	; a2a4
	defb 057h,003h,0abh,008h,0adh	; a2a9
	defb 045h,011h,0c2h,078h,0aeh	; a2ae
	defb 042h,015h,0c7h,0c8h,0aeh	; a2b3
	defb 041h,00dh,0c9h,0e8h,0aeh	; a2b8
	defb 051h,002h,0cah,0f8h,0aeh	; a2bd
	defb 046h,009h,0d5h,0a8h,0afh	; a2c2
	defb 041h,00fh,0dbh,008h,0b0h	; a2c7
	defb 08ah,011h,0e1h,018h,0b0h	; a2cc
	defb 08ah,00dh,0ebh,008h,0b1h	; a2d1
	defb 086h,00fh,0f6h,0f8h,0b1h	; a2d6
	defb 082h,003h,0fch,088h,0b2h	; a2db
	defb 041h,015h,0e0h,0b8h,0b2h	; a2e0
	defb 042h,011h,0feh,000h,0ach	; a2e5
	defb 0ffh	; a2ea

; ----------------------------------------------------------------------
; DATOS lista_A2EB: 19 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x0000); lo leen p00:4C0C (96 bytes)
;   0xa2eb..0xa34b  (96 bytes)
DATA_lista_A2EB:
	defb 00ah,019h,001h,0c8h,0b2h	; a2eb
	defb 002h,00eh,00bh,018h,0b3h	; a2f0
	defb 04dh,00fh,00dh,028h,0b3h	; a2f5
	defb 044h,00ch,01ah,0f8h,0b3h	; a2fa
	defb 041h,00fh,01eh,038h,0b4h	; a2ff
	defb 044h,005h,020h,048h,0b4h	; a304
	defb 043h,013h,024h,088h,0b4h	; a309
	defb 044h,00dh,027h,0b8h,0b4h	; a30e
	defb 041h,014h,02bh,0f8h,0b4h	; a313
	defb 082h,014h,02ch,008h,0b5h	; a318
	defb 001h,00dh,030h,038h,0b5h	; a31d
	defb 001h,015h,031h,040h,0b5h	; a322
	defb 043h,019h,032h,048h,0b5h	; a327
	defb 041h,00eh,035h,078h,0b5h	; a32c
	defb 042h,006h,036h,088h,0b5h	; a331
	defb 042h,007h,038h,0a8h,0b5h	; a336
	defb 044h,008h,03ah,0c8h,0b5h	; a33b
	defb 098h,006h,040h,008h,0b6h	; a340
	defb 081h,00eh,058h,048h,0b8h	; a345
	defb 0ffh	; a34a

; ----------------------------------------------------------------------
; DATOS lista_A34B: 13 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x0000); lo leen p00:4C0C, p00:4CB2 (66 bytes)
;   0xa34b..0xa38d  (66 bytes)
DATA_lista_A34B:
	defb 00bh,01bh,081h,060h,0b8h	; a34b
	defb 001h,017h,08ch,0b8h,0b8h	; a350
	defb 001h,00bh,08dh,0c0h,0b8h	; a355
	defb 043h,008h,090h,0c8h,0b8h	; a35a
	defb 042h,01bh,093h,0f8h,0b8h	; a35f
	defb 082h,008h,095h,018h,0b9h	; a364
	defb 001h,01bh,0a3h,048h,0b9h	; a369
	defb 045h,008h,0a4h,050h,0b9h	; a36e
	defb 041h,00ah,0a9h,0a0h,0b9h	; a373
	defb 041h,017h,0aah,0b0h,0b9h	; a378
	defb 041h,01ah,0abh,0c0h,0b9h	; a37d
	defb 098h,01ah,0ach,0d0h,0b9h	; a382
	defb 08ah,007h,0c4h,010h,0bch	; a387
	defb 0ffh	; a38c

; ----------------------------------------------------------------------
; DATOS lista_A38D: 2 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x0000); lo leen p00:4C0C (11 bytes)
;   0xa38d..0xa398  (11 bytes)
DATA_lista_A38D:
	defb 001h,007h,001h,000h,0bdh	; a38d
	defb 042h,007h,002h,008h,0bdh	; a392
	defb 0ffh	; a397

; ----------------------------------------------------------------------
; DATOS dibujo_A398: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 0 de la lista 0xA203 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (8 bytes)
;   0xa398..0xa3a0  (8 bytes)
DATA_dibujo_A398:
	defb 000h,000h,000h,000h,000h,000h,000h,000h	; a398  ........

; ----------------------------------------------------------------------
; DATOS dibujo_A3A0: 2 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 1 de la lista 0xA203 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (16 bytes)
;   0xa3a0..0xa3b0  (16 bytes)
DATA_dibujo_A3A0:
	defb 002h,010h,000h,045h,000h,020h,002h,040h	; a3a0  ...E. .@
	defb 000h,020h,008h,000h,004h,020h,000h,000h	; a3a8  . ... ..

; ----------------------------------------------------------------------
; DATOS dibujo_A3B0: 5 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 2 de la lista 0xA203 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (80 bytes)
;   0xa3b0..0xa400  (80 bytes)
DATA_dibujo_A3B0:
	defb 000h,054h,054h,05eh,01eh,0beh,02ah,0abh,0a3h,0f7h,055h,05dh,054h,0feh,0bah,0bah	; a3b0  .TT^..*...U]T...
	defb 000h,054h,054h,05eh,01ah,0bah,028h,0a8h,0a0h,0f4h,054h,05ch,008h,008h,000h,000h	; a3c0  .TT^..(...T\....
	defb 000h,000h,000h,000h,004h,00ch,042h,0c2h,000h,010h,041h,043h,008h,018h,000h,000h	; a3d0  ......B...AC....
	defb 0a5h,0a7h,000h,000h,012h,012h,0c0h,0c0h,010h,010h,028h,03ah,002h,002h,060h,060h	; a3e0  ..........(:..``
	defb 000h,000h,010h,030h,086h,086h,020h,030h,009h,00bh,030h,070h,006h,006h,000h,000h	; a3f0  ...0.. 0..0p....

; ----------------------------------------------------------------------
; DATOS dibujo_A400: 3 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 3 de la lista 0xA203 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (24 bytes)
;   0xa400..0xa418  (24 bytes)
DATA_dibujo_A400:
	defb 000h,0a2h,0c0h,0e4h,0f0h,0f9h,0fch,0feh	; a400  ........
	defb 000h,010h,000h,042h,000h,000h,004h,000h	; a408  ...B....
	defb 009h,001h,02bh,081h,001h,000h,004h,080h	; a410  ..+.....

; ----------------------------------------------------------------------
; DATOS dibujo_A418: 3 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 4 de la lista 0xA203 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (48 bytes)
;   0xa418..0xa448  (48 bytes)
DATA_dibujo_A418:
	defb 000h,000h,000h,000h,0d3h,000h,0ffh,002h,0ffh,000h,0ffh,040h,0ffh,001h,0ffh,000h	; a418  ...........@....
	defb 002h,000h,020h,000h,001h,000h,0e3h,000h,0ffh,000h,0ffh,000h,0ffh,020h,0ffh,004h	; a428  .. .......... ..
	defb 0ffh,000h,0ffh,008h,0ffh,000h,0ffh,001h,0ffh,040h,0bfh,000h,0ffh,002h,0ffh,000h	; a438  .........@......

; ----------------------------------------------------------------------
; DATOS dibujo_A448: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 5 de la lista 0xA203 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (32 bytes)
;   0xa448..0xa468  (32 bytes)
DATA_dibujo_A448:
	defb 07fh,044h,03fh,032h,0efh,009h,07fh,08ch,0bfh,0c4h,0ffh,022h,07fh,092h,0bfh,040h	; a448  .D?2......."...@
	defb 040h,000h,0c2h,002h,084h,004h,000h,000h,080h,000h,088h,008h,090h,010h,010h,090h	; a458  @...............

; ----------------------------------------------------------------------
; DATOS dibujo_A468: 11 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 6 de la lista 0xA203 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (176 bytes)
;   0xa468..0xa518  (176 bytes)
DATA_dibujo_A468:
	defb 0e8h,0c8h,093h,093h,0b7h,0b7h,0f7h,0f7h,0ffh,0ffh,0efh,0ffh,043h,0cfh,008h,041h	; a468  ............C..A
	defb 067h,023h,039h,039h,09dh,09dh,0dfh,0dfh,0ffh,0ffh,0ffh,0ffh,0ddh,0ffh,00ch,0c9h	; a478  g#99............
	defb 023h,023h,039h,039h,09fh,09dh,0feh,0deh,0fch,0feh,0f4h,0fch,0d4h,0e4h,080h,0c0h	; a488  ##99............
	defb 0ffh,0ffh,0feh,0ffh,0feh,0ffh,0fah,0feh,0fdh,0f8h,0f4h,0f8h,0f0h,0f8h,0e8h,0f0h	; a498  ................
	defb 0fah,0fbh,07eh,01eh,0fch,07ch,0feh,083h,09eh,01fh,03eh,03eh,07eh,07fh,07dh,07eh	; a4a8  ..~..|....>>~.}~
	defb 0feh,0ffh,07eh,01eh,0fch,07eh,0f8h,0fch,0f8h,03ch,07eh,00ch,0fch,03fh,0fch,0feh	; a4b8  ..~..~...<~..?..
	defb 078h,07ch,03ch,03ch,0fch,0beh,0feh,0feh,0fch,0feh,0f0h,0f8h,0f0h,0f8h,0c0h,0e0h	; a4c8  x|<<............
	defb 023h,023h,039h,039h,00fh,01dh,00fh,00fh,007h,00fh,007h,007h,001h,003h,000h,001h	; a4d8  ##99............
	defb 0e9h,0c9h,09dh,09dh,0bdh,0bdh,0ffh,0ffh,0f3h,0f7h,0e1h,0f2h,0a0h,0c0h,080h,080h	; a4e8  ................
	defb 0ffh,0ffh,07fh,01fh,0ffh,07eh,0feh,0ffh,0feh,03eh,07fh,00fh,0feh,03fh,0feh,0feh	; a4f8  .....~...>...?..
	defb 000h,000h,000h,000h,008h,000h,040h,000h,028h,000h,020h,080h,020h,080h,000h,0c0h	; a508  ......@.(. . ...

; ----------------------------------------------------------------------
; DATOS dibujo_A518: 3 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 7 de la lista 0xA203 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (48 bytes)
;   0xa518..0xa548  (48 bytes)
DATA_dibujo_A518:
	defb 000h,0ffh,007h,0fch,010h,0f0h,0e2h,020h,000h,000h,040h,000h,004h,000h,000h,000h	; a518  ....... ..@.....
	defb 000h,0ffh,080h,0ffh,031h,00ch,008h,000h,000h,000h,040h,000h,002h,000h,000h,000h	; a528  ....1.....@.....
	defb 000h,0ffh,000h,0ffh,0c0h,07fh,019h,006h,002h,000h,008h,000h,040h,000h,000h,000h	; a538  ............@...

; ----------------------------------------------------------------------
; DATOS dibujo_A548: 4 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 8 de la lista 0xA203 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (64 bytes)
;   0xa548..0xa588  (64 bytes)
DATA_dibujo_A548:
	defb 060h,03fh,068h,03fh,040h,03fh,010h,07fh,010h,07fh,0d8h,07fh,088h,07fh,0a0h,07fh	; a548  `?h?@?..........
	defb 060h,01fh,024h,01bh,020h,01fh,02ah,017h,010h,00fh,01ch,00fh,020h,01fh,022h,01dh	; a558  `.$. .*..... .".
	defb 0c2h,07fh,080h,07fh,0c0h,03fh,0c0h,03fh,041h,03fh,060h,01fh,030h,00fh,030h,00fh	; a568  .....?.?A?`.0.0.
	defb 040h,03fh,04ch,033h,03ah,017h,038h,007h,035h,00bh,010h,00fh,000h,01fh,010h,01fh	; a578  @?L3:.8.5.......

; ----------------------------------------------------------------------
; DATOS dibujo_A588: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 9 de la lista 0xA203 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (32 bytes)
;   0xa588..0xa5a8  (32 bytes)
DATA_dibujo_A588:
	defb 0eeh,0cch,0bbh,08eh,008h,006h,074h,073h,0feh,01dh,012h,00fh,0e9h,0e7h,018h,0f7h	; a588  ......ts........
	defb 079h,000h,0f8h,098h,078h,0b0h,030h,0e0h,07bh,0e3h,0f7h,046h,0ebh,0cch,052h,09ch	; a598  y...x.0.{..F..R.

; ----------------------------------------------------------------------
; DATOS dibujo_A5A8: 18 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 10 de la lista 0xA203 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (432 bytes)
;   0xa5a8..0xa758  (432 bytes)
DATA_dibujo_A5A8:
	defb 0cch,0cch,0ffh,0cah,0dbh,0fbh,020h,020h,031h,081h,001h,011h,0c4h,000h,000h,0e1h,000h,000h,0f0h,000h,000h,0fch,000h,000h	; a5a8  ......  1...............
	defb 008h,008h,0ech,065h,064h,0f4h,0c0h,0c0h,0cah,000h,080h,0c2h,080h,0b0h,0b8h,010h,090h,0f0h,0e9h,0e0h,0e0h,081h,080h,0c0h	; a5c0  ...ed...................
	defb 0a4h,060h,066h,021h,060h,067h,009h,040h,04dh,082h,040h,04bh,0c0h,040h,04ah,0e8h,008h,00ch,0ffh,000h,003h,0feh,000h,000h	; a5d8  .`f!`g.@M.@K.@J.........
	defb 001h,0a0h,0e0h,064h,060h,0e0h,050h,040h,0c0h,000h,080h,0c0h,001h,078h,078h,001h,084h,0fch,0c1h,0c2h,0c2h,093h,080h,080h	; a5f0  ...d`.P@.....xx.........
	defb 001h,0e0h,0e0h,040h,0c0h,0d0h,085h,080h,080h,001h,080h,0c0h,080h,0e0h,0feh,000h,080h,0e0h,008h,000h,0c0h,080h,080h,080h	; a608  ...@....................
	defb 01ch,03fh,0ffh,019h,03fh,07fh,008h,000h,02eh,000h,008h,02ch,024h,024h,02ch,002h,000h,008h,000h,000h,008h,048h,008h,008h	; a620  .?..?......,$$,......H..
	defb 00ch,00ch,0ffh,009h,04bh,0efh,000h,000h,067h,009h,001h,023h,020h,020h,022h,080h,000h,002h,012h,002h,002h,000h,000h,000h	; a638  ....K...g..#  ".........
	defb 0feh,001h,001h,0feh,000h,01eh,0e0h,003h,03fh,0f8h,001h,047h,0e4h,000h,003h,0d9h,003h,003h,0fdh,001h,00fh,0f0h,007h,00fh	; a650  ........?..G............
	defb 0feh,001h,001h,0feh,000h,000h,0feh,001h,00fh,0f8h,001h,007h,0f0h,000h,001h,0fch,000h,000h,0ffh,001h,001h,0f0h,007h,00fh	; a668  ........................
	defb 03fh,000h,0c0h,0bfh,0c0h,0c0h,0ffh,080h,080h,0c7h,0d0h,0f8h,0bfh,0a0h,0e0h,04fh,040h,0c0h,083h,0c0h,0c0h,061h,060h,0e0h	; a680  ?..............O@....a`.
	defb 0ffh,000h,000h,0fbh,000h,000h,0cbh,005h,000h,02fh,020h,020h,09fh,086h,0c0h,02fh,014h,080h,01fh,028h,080h,01fh,028h,080h	; a698  ........./  .../...(..(.
	defb 000h,000h,0ffh,01eh,028h,080h,03bh,040h,080h,07eh,018h,000h,03fh,050h,000h,031h,01ch,080h,031h,010h,080h,01fh,000h,0e0h	; a6b0  ....(..@.~..?P.1..1.....
	defb 01fh,008h,0c0h,03fh,018h,080h,01fh,00dh,080h,05fh,044h,0c0h,01eh,002h,0c2h,001h,002h,0c0h,007h,007h,0e7h,008h,008h,0ffh	; a6c8  ...?....._D.............
	defb 0ffh,040h,000h,0beh,001h,000h,05eh,034h,000h,0afh,098h,080h,01bh,000h,080h,003h,000h,0c0h,001h,001h,0f5h,003h,003h,0ffh	; a6e0  .@....^4................
	defb 0ffh,000h,000h,0ffh,000h,000h,0efh,040h,000h,08ch,088h,000h,093h,013h,013h,0feh,0feh,0ffh,0a4h,0a4h,0ffh,000h,000h,0ffh	; a6f8  .......@................
	defb 080h,088h,03fh,080h,0a4h,03fh,0c0h,052h,01fh,0e0h,008h,00fh,0f0h,004h,007h,0b0h,004h,007h,0e0h,004h,007h,0c0h,000h,007h	; a710  ..?..?.R................
	defb 0f0h,000h,007h,0f8h,00ah,007h,0f8h,00ah,003h,0f8h,00ah,003h,0f8h,00ah,003h,0f8h,008h,003h,0f8h,012h,003h,0f8h,014h,007h	; a728  ........................
	defb 0f0h,004h,007h,0f0h,000h,007h,0e6h,000h,00fh,0d0h,008h,01fh,0a0h,010h,03fh,084h,020h,03fh,000h,062h,07fh,01ch,07fh,07fh	; a740  ..............?. ?.b....

; ----------------------------------------------------------------------
; DATOS dibujo_A758: 5 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 11 de la lista 0xA203 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (80 bytes)
;   0xa758..0xa7a8  (80 bytes)
DATA_dibujo_A758:
	defb 07fh,07fh,06eh,06eh,054h,054h,05dh,05ch,059h,058h,057h,052h,004h,004h,0d4h,050h	; a758  ..nnTT]\YXWR...P
	defb 0cbh,0c8h,065h,060h,03eh,028h,08ah,008h,0d2h,000h,0d6h,000h,0cch,080h,0e4h,080h	; a768  ..e`>(..........
	defb 0f9h,001h,0f4h,080h,024h,000h,0b9h,081h,0e1h,0c1h,0e0h,040h,06ah,002h,034h,004h	; a778  ....$......@j.4.
	defb 0f2h,0f8h,09bh,0d8h,005h,050h,06bh,072h,049h,050h,0c9h,040h,0cfh,000h,0fbh,008h	; a788  .....PkrIP.@....
	defb 06ch,04ah,0b6h,012h,0a4h,002h,0f6h,012h,0aeh,0c2h,07ch,0c0h,046h,0fah,091h,0fch	; a798  lJ........|.F...

; ----------------------------------------------------------------------
; DATOS dibujo_A7A8: 6 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 12 de la lista 0xA203 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (96 bytes)
;   0xa7a8..0xa808  (96 bytes)
DATA_dibujo_A7A8:
	defb 000h,0dch,004h,0e7h,040h,0b4h,020h,0d8h,020h,0ddh,009h,055h,000h,01bh,00ah,00bh	; a7a8  ....@. . ..U....
	defb 024h,022h,018h,017h,002h,00dh,020h,01dh,044h,037h,008h,047h,014h,0afh,000h,037h	; a7b8  $".... .D7.G...7
	defb 000h,000h,032h,08eh,001h,07fh,020h,06bh,08ch,0b4h,043h,0cfh,001h,0b3h,001h,059h	; a7c8  ..2... k..C....Y
	defb 002h,003h,000h,00bh,094h,09fh,0a3h,0bch,024h,01bh,000h,0ffh,050h,06dh,028h,034h	; a7d8  ........$...Pm(4
	defb 000h,020h,001h,00ah,040h,047h,0b8h,0bbh,078h,067h,060h,05dh,092h,0efh,081h,0bah	; a7e8  . ..@G..xg`]....
	defb 000h,0c6h,002h,08eh,001h,089h,003h,00bh,020h,05dh,009h,055h,000h,01bh,00ah,00bh	; a7f8  ........ ].U....

; ----------------------------------------------------------------------
; DATOS dibujo_A808: 6 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 13 de la lista 0xA203 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (96 bytes)
;   0xa808..0xa868  (96 bytes)
DATA_dibujo_A808:
	defb 0f1h,000h,0fdh,001h,0ddh,049h,04fh,06fh,05ah,078h,0e9h,0f8h,0cch,0dch,0a2h,0a2h	; a808  .....IOoZx......
	defb 0c0h,000h,0f8h,008h,05ch,000h,0aeh,002h,0dah,000h,0a6h,020h,004h,0c0h,03fh,060h	; a818  ....\...... ..?`
	defb 0efh,003h,0b6h,092h,012h,0c2h,028h,0e0h,0fdh,0f8h,02eh,0e0h,0efh,0e1h,08bh,061h	; a828  ......(........a
	defb 02eh,0e0h,07bh,0e2h,0c7h,0c4h,05eh,0d5h,00ah,094h,06eh,034h,0c7h,025h,09bh,011h	; a838  ..{...^...n4.%..
	defb 0a4h,080h,022h,020h,053h,041h,057h,044h,0dbh,0ceh,0dbh,0ceh,0fbh,0eeh,036h,01eh	; a848  .." SAWD......6.
	defb 037h,01eh,0f7h,0deh,0f7h,0dfh,0f6h,0dfh,076h,0dfh,055h,0ffh,055h,0ffh,0d5h,0f7h	; a858  7.......v.U.U...

; ----------------------------------------------------------------------
; DATOS dibujo_A868: 3 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 14 de la lista 0xA203 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (48 bytes)
;   0xa868..0xa898  (48 bytes)
DATA_dibujo_A868:
	defb 0ffh,000h,000h,0ffh,000h,0ffh,000h,000h,000h,0ffh,000h,000h,000h,000h,000h,000h	; a868  ................
	defb 0feh,000h,000h,0feh,000h,0feh,000h,006h,000h,0f6h,000h,016h,000h,016h,000h,016h	; a878  ................
	defb 0ffh,000h,080h,07fh,080h,07fh,080h,060h,080h,06fh,080h,068h,080h,068h,080h,068h	; a888  .......`.o.h.h.h

; ----------------------------------------------------------------------
; DATOS dibujo_A898: 6 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 15 de la lista 0xA203 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (96 bytes)
;   0xa898..0xa8f8  (96 bytes)
DATA_dibujo_A898:
	defb 0e0h,09fh,0e0h,09fh,0c0h,0bfh,0c0h,0bfh,0c0h,0bfh,0c0h,0bfh,0e0h,09fh,0c0h,0bfh	; a898  ................
	defb 000h,0feh,008h,0f6h,002h,0fch,006h,0f8h,002h,0fch,000h,0feh,002h,0fch,000h,0feh	; a8a8  ................
	defb 000h,0feh,000h,0feh,000h,0feh,000h,0a4h,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; a8b8  ................
	defb 000h,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,0ffh,080h,0ffh	; a8c8  ................
	defb 0e0h,09fh,0c0h,0bfh,0e0h,09fh,0c0h,0b5h,080h,080h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; a8d8  ................
	defb 000h,07fh,03fh,040h,03fh,040h,03fh,040h,03fh,040h,03fh,040h,0ffh,0ffh,001h,0feh	; a8e8  ..?@?@?@?@?@....

; ----------------------------------------------------------------------
; DATOS dibujo_A8F8: 9 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 16 de la lista 0xA203 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (216 bytes)
;   0xa8f8..0xa9d0  (216 bytes)
DATA_dibujo_A8F8:
	defb 0e7h,019h,0feh,0a7h,07fh,0c0h,0adh,07fh,0c0h,010h,0dfh,083h,03dh,0ffh,080h,096h,0f7h,000h,0edh,0fdh,010h,0f4h,05ch,088h	; a8f8  ............=.........\.
	defb 067h,0e0h,007h,07dh,07ch,001h,0ddh,0dch,001h,0aeh,0aeh,000h,05bh,0dbh,000h,024h,084h,000h,000h,000h,0c0h,07bh,05fh,040h	; a910  g..}|.......[..$.....{_@
	defb 0f0h,01fh,0e4h,0e2h,062h,080h,09fh,00fh,000h,0d0h,030h,0e0h,0a3h,063h,0c0h,0c4h,04ch,088h,0aah,09bh,030h,055h,037h,040h	; a928  ....b.....0..c..L...0U7@
	defb 0c3h,000h,0c3h,081h,0bch,021h,07ch,07eh,000h,069h,049h,000h,0a2h,03ch,002h,0cdh,08eh,001h,0a2h,0b3h,000h,050h,058h,000h	; a940  .....!|~.iI..<.......PX.
	defb 013h,0fch,089h,0a2h,0fch,049h,0a2h,064h,045h,008h,044h,041h,053h,047h,004h,043h,047h,020h,009h,039h,020h,00ah,06ah,000h	; a958  .....I.dE.DASG.CG .9 .j.
	defb 07bh,072h,000h,007h,0feh,060h,082h,0ffh,018h,021h,0ffh,054h,0edh,0ffh,000h,025h,0efh,00ah,013h,0ffh,000h,0d1h,0d7h,000h	; a970  {r...`...!.T...%........
	defb 0c9h,0f8h,000h,002h,0feh,070h,000h,0ffh,0eah,005h,0ffh,090h,08ch,0fdh,042h,0bch,0f9h,003h,05fh,0fdh,002h,012h,0f0h,0a1h	; a988  .....p........B..._.....
	defb 0efh,0ech,003h,0b7h,024h,013h,017h,010h,0c7h,0a9h,008h,0c1h,0f9h,001h,000h,0a4h,004h,0c0h,0efh,00eh,000h,0cbh,08ah,060h	; a9a0  ....$..................`
	defb 04eh,0a4h,001h,05ah,0c0h,001h,0b2h,0e0h,009h,016h,0a0h,009h,043h,010h,008h,066h,008h,000h,077h,006h,000h,039h,001h,000h	; a9b8  N..Z........C..f..w..9..

; ----------------------------------------------------------------------
; DATOS dibujo_A9D0: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 17 de la lista 0xA203 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (32 bytes)
;   0xa9d0..0xa9f0  (32 bytes)
DATA_dibujo_A9D0:
	defb 000h,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,0ffh,000h,0ffh,0ffh,0ffh,0ffh,000h,000h	; a9d0  ................
	defb 020h,09fh,0bfh,0ffh,0ffh,0ffh,000h,000h,0ffh,000h,0f3h,0f7h,0edh,0edh,000h,000h	; a9e0   ...............

; ----------------------------------------------------------------------
; DATOS dibujo_A9F0: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 18 de la lista 0xA203 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (16 bytes)
;   0xa9f0..0xaa00  (16 bytes)
DATA_dibujo_A9F0:
	defb 0ffh,0ffh,0ffh,000h,000h,0ffh,000h,0ffh,0ffh,000h,0ffh,0ffh,0ffh,000h,0ffh,0ffh	; a9f0  ................

; ----------------------------------------------------------------------
; DATOS dibujo_AA00: 4 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 19 de la lista 0xA203 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (64 bytes)
;   0xaa00..0xaa40  (64 bytes)
DATA_dibujo_AA00:
	defb 000h,000h,000h,000h,000h,000h,008h,008h,01ch,01ch,000h,000h,000h,000h,000h,000h	; aa00  ................
	defb 000h,000h,000h,000h,004h,01ch,006h,03eh,02eh,03eh,000h,000h,000h,000h,000h,000h	; aa10  .......>.>......
	defb 000h,000h,00ch,01ch,006h,03eh,047h,07fh,069h,079h,03eh,03eh,000h,000h,000h,000h	; aa20  .....>G.iy>>....
	defb 000h,000h,000h,021h,032h,002h,063h,0c3h,069h,069h,02ah,02ah,000h,000h,000h,000h	; aa30  ...!2.c.ii**....

; ----------------------------------------------------------------------
; DATOS dibujo_AA40: 2 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 20 de la lista 0xA203 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (48 bytes)
;   0xaa40..0xaa70  (48 bytes)
DATA_dibujo_AA40:
	defb 00fh,0ffh,0f0h,0f8h,0ffh,0f0h,0ffh,0f8h,0f7h,07fh,078h,0f7h,078h,07fh,0f0h,07fh,07fh,0f0h,078h,07fh,0f0h,07fh,07fh,0f0h	; aa40  ..........x.x.....x.....
	defb 0f0h,0ffh,00fh,017h,0ffh,00fh,0f7h,01fh,0efh,0f6h,01eh,0efh,016h,0feh,00fh,0f6h,0feh,00fh,016h,0feh,00fh,0f6h,0feh,00fh	; aa58  ........................

; ----------------------------------------------------------------------
; DATOS dibujo_AA70: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 21 de la lista 0xA203 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (32 bytes)
;   0xaa70..0xaa90  (32 bytes)
DATA_dibujo_AA70:
	defb 000h,07fh,03fh,07fh,03fh,07fh,040h,000h,07fh,040h,03fh,07fh,03fh,07fh,000h,000h	; aa70  ..?.?.@..@?.?...
	defb 000h,0feh,0fch,0feh,0fch,0feh,002h,000h,0feh,002h,0fch,0feh,0fch,0feh,000h,000h	; aa80  ................

; ----------------------------------------------------------------------
; DATOS dibujo_AA90: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 22 de la lista 0xA203 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (32 bytes)
;   0xaa90..0xaab0  (32 bytes)
DATA_dibujo_AA90:
	defb 004h,008h,020h,040h,018h,001h,002h,088h,010h,020h,001h,000h,04ch,010h,000h,000h	; aa90  .. @..... ..L...
	defb 000h,000h,040h,000h,000h,000h,000h,002h,000h,000h,010h,020h,002h,004h,000h,000h	; aaa0  ..@........ ....

; ----------------------------------------------------------------------
; DATOS dibujo_AAB0: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 23 de la lista 0xA203 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (16 bytes)
;   0xaab0..0xaac0  (16 bytes)
DATA_dibujo_AAB0:
	defb 0ffh,0ffh,0bfh,0c0h,080h,0ffh,080h,0ffh,0bfh,0c0h,0ffh,0bfh,0ffh,080h,0ffh,0ffh	; aab0  ................

; ----------------------------------------------------------------------
; DATOS dibujo_AAC0: 6 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 0 de la lista 0xA27C (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (48 bytes)
;   0xaac0..0xaaf0  (48 bytes)
DATA_dibujo_AAC0:
	defb 003h,005h,009h,0f1h,031h,051h,091h,011h	; aac0  ....1Q..
	defb 0f1h,011h,011h,011h,011h,011h,011h,01fh	; aac8  ........
	defb 011h,011h,011h,011h,011h,011h,011h,011h	; aad0  ........
	defb 091h,051h,031h,0f1h,009h,005h,003h,0ffh	; aad8  .Q1.....
	defb 000h,000h,000h,0ffh,000h,000h,000h,0ffh	; aae0  ........
	defb 080h,080h,080h,0ffh,001h,001h,001h,0ffh	; aae8  ........

; ----------------------------------------------------------------------
; DATOS dibujo_AAF0: 15 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 1 de la lista 0xA27C (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (240 bytes)
;   0xaaf0..0xabe0  (240 bytes)
DATA_dibujo_AAF0:
	defb 0ffh,0ffh,0ffh,0ffh,000h,0ffh,000h,000h,0ffh,0ffh,0ffh,0ffh,000h,0ffh,000h,000h	; aaf0  ................
	defb 07fh,0ffh,07fh,0ffh,000h,07fh,000h,000h,0feh,0ffh,0feh,0ffh,000h,0feh,000h,000h	; ab00  ................
	defb 0cch,06eh,0cch,0aeh,02ch,0ceh,01ch,00eh,0fch,0f6h,0fch,0fah,002h,0fch,001h,000h	; ab10  .n..,...........
	defb 000h,000h,080h,080h,000h,0c0h,01fh,000h,0f0h,0f0h,0f8h,0f8h,000h,0fch,003h,000h	; ab20  ................
	defb 0c0h,0ech,0cch,0eeh,0cch,0eeh,0cch,0eeh,0cch,0eeh,0cch,0eeh,0cch,0eeh,00ch,08eh	; ab30  ................
	defb 0cch,0eeh,0cch,0eeh,0cch,0eeh,0cch,0eeh,0cch,0eeh,0cch,0eeh,0cch,0eeh,0cch,0eeh	; ab40  ................
	defb 01ch,08eh,01ch,08dh,018h,08bh,010h,080h,01fh,08fh,02fh,08fh,0c0h,00fh,080h,000h	; ab50  ........../.....
	defb 0cch,0eeh,0cch,0ech,0c8h,0e9h,0c0h,0e0h,0cfh,0efh,0dfh,0dfh,080h,0bfh,000h,000h	; ab60  ................
	defb 04ch,06eh,00ch,02eh,00ch,00eh,01ch,00eh,014h,006h,010h,002h,010h,000h,011h,000h	; ab70  Ln..............
	defb 001h,0cfh,000h,06fh,000h,02fh,000h,08fh,000h,0cfh,000h,06fh,004h,02fh,000h,08fh	; ab80  ...o./.....o./..
	defb 000h,0cfh,000h,06fh,000h,02fh,002h,00fh,000h,0ffh,000h,0ffh,000h,0ffh,020h,0ffh	; ab90  ...o./........ .
	defb 000h,0cch,000h,066h,000h,033h,000h,000h,000h,0ffh,040h,0ffh,002h,0ffh,000h,0ffh	; aba0  ...f.3....@.....
	defb 000h,019h,000h,08ch,000h,0c6h,000h,0e0h,000h,0ffh,002h,0ffh,012h,0ffh,040h,0ffh	; abb0  ..............@.
	defb 07eh,07eh,0beh,0beh,0c0h,0deh,0c0h,0e0h,0c6h,0e6h,0c8h,0eah,0cch,0ech,0cch,0eeh	; abc0  ~~..............
	defb 0fch,0fch,0f8h,0fah,004h,0f6h,00ch,00eh,0cch,0ceh,08ch,0aeh,04ch,06eh,0cch,0eeh	; abd0  ............Ln..

; ----------------------------------------------------------------------
; DATOS dibujo_ABE0: 4 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 2 de la lista 0xA27C (p00:4D92, p00:4DF5); se solapan 4
;   bloques: (dibujo_AC00 AC00-AC20) (dibujo_AC00 AC00-AC20) (dibujo_AC00
;   AC00-AC20); lo leen p00:4C0C, p00:4C26 (64 bytes)
;   0xabe0..0xac20  (64 bytes)
DATA_dibujo_ABE0:
	defb 0dfh,080h,0c0h,09fh,0c0h,080h,0dfh,09fh,0dfh,080h,0c0h,09fh,0c0h,080h,09fh,0dfh	; abe0  ................
	defb 0ffh,000h,000h,0ffh,000h,000h,0ffh,0ffh,0ffh,000h,000h,0ffh,000h,000h,0ffh,0ffh	; abf0  ................
	defb 022h,033h,022h,022h,0eeh,0eeh,000h,000h,0ffh,0ffh,000h,000h,000h,000h,0ffh,0ffh	; ac00  "3""............
	defb 022h,033h,022h,022h,0eeh,0eeh,000h,000h,0ffh,0ffh,004h,004h,004h,004h,0ffh,0ffh	; ac10  "3""............

; ----------------------------------------------------------------------
; DATOS dibujo_AC20: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 3 de la lista 0xA27C (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (32 bytes)
;   0xac20..0xac40  (32 bytes)
DATA_dibujo_AC20:
	defb 010h,08ch,01ch,08eh,01ch,08eh,01ch,08eh,01ch,08eh,01ch,08eh,01ch,08eh,07ch,00eh	; ac20  ..............|.
	defb 01ch,08eh,01ch,08eh,01ch,08eh,01ch,08eh,01ch,08eh,01ch,08eh,01ch,08eh,01ch,08eh	; ac30  ................

; ----------------------------------------------------------------------
; DATOS dibujo_AC40: 6 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 4 de la lista 0xA27C (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (144 bytes)
;   0xac40..0xacd0  (144 bytes)
DATA_dibujo_AC40:
	defb 0f7h,0fah,0e2h,0f7h,0fah,002h,00fh,002h,002h,0efh,002h,002h,0f7h,0fah,0e2h,0f7h,0fah,002h,00fh,002h,002h,0efh,002h,000h	; ac40  ........................
	defb 0efh,05fh,007h,0efh,05fh,000h,0ffh,040h,000h,040h,040h,000h,000h,08fh,000h,082h,0ffh,000h,012h,0ffh,000h,040h,0ffh,000h	; ac58  ._.._..@.@@..........@..
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,000h,0ffh,000h,000h,000h,000h,000h,000h,0ffh,000h,024h,07fh,000h,000h,0ffh,000h,004h,0ffh,000h	; ac70  ...............$........
	defb 0fbh,0fah,0f8h,0fbh,0fah,000h,0fbh,002h,000h,007h,002h,000h,012h,0f8h,000h,040h,0ffh,000h,092h,0dfh,000h,020h,0ffh,000h	; ac88  ...............@..... ..
	defb 0dfh,05fh,05fh,09fh,05fh,040h,0c0h,040h,040h,0dfh,040h,040h,0dfh,05fh,05fh,0dfh,05fh,040h,0c0h,040h,040h,0dfh,040h,040h	; aca0  .__._@.@@.@@.__._@.@@.@@
	defb 0f7h,0fah,0e2h,0f5h,0fah,002h,00fh,002h,002h,0efh,002h,002h,0f7h,0fah,0e2h,0f7h,0fah,002h,00fh,002h,002h,0efh,002h,002h	; acb8  ........................

; ----------------------------------------------------------------------
; DATOS dibujo_ACD0: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 5 de la lista 0xA27C (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (8 bytes)
;   0xacd0..0xacd8  (8 bytes)
DATA_dibujo_ACD0:
	defb 0ffh,0ffh,0ffh,0ffh,0fch,0f0h,0c0h,000h	; acd0  ........

; ----------------------------------------------------------------------
; DATOS dibujo_ACD8: 3 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 6 de la lista 0xA27C (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (24 bytes)
;   0xacd8..0xacf0  (24 bytes)
DATA_dibujo_ACD8:
	defb 0ffh,000h,000h,000h,000h,000h,000h,000h	; acd8  ........
	defb 0f7h,0f7h,0f7h,0f7h,0f6h,0f6h,0f6h,0f6h	; ace0  ........
	defb 0f7h,0f4h,0f4h,0f4h,0e8h,0e8h,0eah,0e0h	; ace8  ........

; ----------------------------------------------------------------------
; DATOS dibujo_ACF0: 2 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 7 de la lista 0xA27C (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (16 bytes)
;   0xacf0..0xad00  (16 bytes)
DATA_dibujo_ACF0:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h	; acf0  ........
	defb 007h,01fh,07fh,0ffh,0ffh,0ffh,0ffh,000h	; acf8  ........

; ----------------------------------------------------------------------
; DATOS dibujo_AD00: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 8 de la lista 0xA27C (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (8 bytes)
;   0xad00..0xad08  (8 bytes)
DATA_dibujo_AD00:
	defb 0efh,0efh,0efh,0efh,0efh,0efh,0efh,0efh	; ad00  ........

; ----------------------------------------------------------------------
; DATOS dibujo_AD08: 23 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 9 de la lista 0xA27C (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (368 bytes)
;   0xad08..0xae78  (368 bytes)
DATA_dibujo_AD08:
	defb 0ffh,0ffh,000h,000h,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; ad08  ................
	defb 002h,001h,00fh,000h,03fh,000h,0ffh,000h,07fh,080h,07fh,080h,07fh,080h,07fh,080h	; ad18  ....?...........
	defb 078h,06fh,03bh,07ch,03bh,04ch,03fh,044h,03bh,044h,03fh,042h,037h,04ch,03fh,044h	; ad28  xo.|.L?D.D?B7L?D
	defb 0fdh,001h,0ffh,003h,0fbh,007h,0f7h,04fh,0f7h,01dh,0efh,01fh,0ffh,031h,0ffh,0ffh	; ad38  .......O.....1..
	defb 00ah,0f5h,00ah,0f5h,00ah,0f5h,00ah,0f5h,00dh,0f2h,00dh,0f2h,00dh,0f2h,008h,0f0h	; ad48  ................
	defb 00fh,0ffh,0ffh,00fh,0ffh,00fh,0ffh,00fh,0ffh,007h,0ffh,007h,0ffh,007h,0ffh,007h	; ad58  ................
	defb 03fh,040h,03fh,048h,03fh,050h,03fh,040h,03fh,040h,03fh,040h,03fh,040h,000h,000h	; ad68  ?@?H?P?@?@?@?@..
	defb 0efh,0efh,0efh,0efh,0efh,0efh,0efh,0efh,0efh,06fh,0efh,06fh,0efh,06fh,0efh,06fh	; ad78  .........o.o.o.o
	defb 0efh,02fh,0efh,02fh,0efh,02fh,0efh,02fh,0efh,00fh,0efh,00fh,0efh,00fh,00fh,00fh	; ad88  ././././........
	defb 0c3h,003h,0f0h,000h,0fch,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,000h,000h	; ad98  ................
	defb 0c0h,0c0h,0f0h,0f0h,03ch,03ch,00fh,00fh,0c3h,003h,0f0h,000h,0fch,000h,0ffh,000h	; ada8  ....<<..........
	defb 0c0h,0c0h,0f0h,0f0h,0bch,0bch,08fh,08fh,003h,043h,030h,040h,03ch,040h,000h,000h	; adb8  .........C0@<@..
	defb 003h,0c3h,0f0h,000h,0fch,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; adc8  ................
	defb 0ffh,055h,0aah,000h,0aah,000h,0aah,000h,0aah,000h,0ffh,055h,0ffh,055h,0ffh,055h	; add8  .U.........U.U.U
	defb 0d1h,01fh,0d3h,01dh,0d3h,01dh,0d7h,019h,0d3h,01dh,0d3h,01dh,0d1h,01fh,0d3h,01dh	; ade8  ................
	defb 000h,00fh,017h,0f8h,0f7h,01fh,0f7h,018h,0ffh,0ffh,055h,055h,0ffh,055h,0aah,000h	; adf8  ..........UU.U..
	defb 020h,0c0h,0d0h,01fh,0dfh,090h,0dfh,010h,0ffh,0ffh,055h,055h,0ffh,055h,0aah,000h	; ae08   .........UU.U..
	defb 031h,03fh,013h,0ddh,0d3h,01dh,0dfh,011h,0f3h,0fdh,013h,01dh,0d1h,01fh,0d1h,01fh	; ae18  1?..............
	defb 0aah,000h,0aah,000h,0ffh,055h,0ffh,055h,0aah,000h,0ffh,000h,000h,000h,0ffh,0ffh	; ae28  .....U.U........
	defb 0d7h,019h,0d3h,01dh,0d1h,01fh,0d3h,01dh,0d7h,019h,0d3h,01dh,01fh,011h,0ffh,0ffh	; ae38  ................
	defb 000h,000h,055h,055h,07fh,055h,07fh,055h,040h,06ah,07fh,07fh,0ffh,000h,000h,000h	; ae48  ..UU.U.U@j......
	defb 000h,000h,055h,055h,0ffh,055h,0ffh,055h,000h,0aah,0ffh,0ffh,0ffh,000h,000h,000h	; ae58  ..UU.U.U........
	defb 000h,001h,056h,057h,0feh,057h,0feh,057h,002h,0abh,0feh,0ffh,0ffh,000h,000h,000h	; ae68  ..VW.W.W........

; ----------------------------------------------------------------------
; DATOS dibujo_AE78: 5 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 10 de la lista 0xA27C (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (80 bytes)
;   0xae78..0xaec8  (80 bytes)
DATA_dibujo_AE78:
	defb 089h,06dh,089h,06bh,08dh,06dh,08bh,06bh,089h,06dh,089h,06bh,089h,069h,089h,069h	; ae78  .m.k.m.k.m.k.i.i
	defb 018h,016h,018h,016h,0f8h,0f6h,018h,016h,018h,016h,018h,016h,018h,016h,018h,016h	; ae88  ................
	defb 0a5h,0e5h,0a5h,0e5h,0a5h,0e5h,0a5h,0e5h,0a5h,0e5h,0a5h,0e5h,0e5h,0e5h,07eh,07eh	; ae98  ..............~~
	defb 022h,033h,022h,022h,066h,066h,000h,000h,0ffh,0ffh,0ffh,0ffh,000h,000h,0ffh,0ffh	; aea8  "3""ff..........
	defb 027h,037h,027h,027h,067h,067h,007h,007h,0ffh,0ffh,0ffh,0ffh,00fh,00fh,0ffh,0ffh	; aeb8  '7''gg..........

; ----------------------------------------------------------------------
; DATOS dibujo_AEC8: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 11 de la lista 0xA27C (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (32 bytes)
;   0xaec8..0xaee8  (32 bytes)
DATA_dibujo_AEC8:
	defb 0ffh,000h,0ffh,000h,0ffh,000h,000h,000h,000h,004h,000h,000h,000h,020h,000h,000h	; aec8  ............. ..
	defb 0ffh,000h,0ffh,000h,0ffh,000h,000h,000h,000h,010h,000h,001h,000h,000h,000h,000h	; aed8  ................

; ----------------------------------------------------------------------
; DATOS dibujo_AEE8: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 12 de la lista 0xA27C (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (16 bytes)
;   0xaee8..0xaef8  (16 bytes)
DATA_dibujo_AEE8:
	defb 0f7h,000h,0f7h,000h,0f7h,000h,0f3h,004h,0f7h,000h,0f7h,000h,0f7h,000h,0f7h,000h	; aee8  ................

; ----------------------------------------------------------------------
; DATOS dibujo_AEF8: 17 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 13 de la lista 0xA27C (p00:4D92, p00:4DF5); se solapan 4
;   bloques: (dibujo_AFA8 AFA8-B008) (dibujo_AFA8 AFA8-B008) (dibujo_AFA8
;   AFA8-B008); lo leen p00:4C0C, p00:4C26 (272 bytes)
;   0xaef8..0xb008  (272 bytes)
DATA_dibujo_AEF8:
	defb 000h,000h,0ffh,000h,000h,0ffh,040h,09fh,000h,0ffh,000h,0ffh,000h,0fdh,000h,0ffh	; aef8  ......@.........
	defb 000h,000h,0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; af08  ................
	defb 000h,000h,083h,014h,002h,03dh,004h,09bh,000h,0ffh,000h,0bfh,000h,0ffh,000h,0ffh	; af18  .....=..........
	defb 000h,000h,0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,000h	; af28  ................
	defb 000h,003h,000h,000h,000h,000h,010h,010h,0f8h,0f8h,030h,0f4h,01ch,03eh,003h,013h	; af38  ..........0..>..
	defb 000h,003h,002h,002h,000h,000h,000h,000h,0c0h,0c0h,0f2h,0f2h,03ch,03ch,0ffh,0ffh	; af48  ............<<..
	defb 000h,003h,000h,000h,000h,000h,000h,000h,0c0h,0c0h,0f0h,0f0h,03ch,03ch,00fh,00fh	; af58  ............<<..
	defb 000h,003h,002h,002h,000h,000h,000h,000h,0c0h,0c0h,032h,0f2h,00ch,03ch,003h,00fh	; af68  ..........2..<..
	defb 0c0h,0c0h,030h,0f0h,00ch,03ch,003h,00fh,000h,003h,000h,000h,000h,000h,000h,000h	; af78  ..0..<..........
	defb 000h,003h,000h,000h,000h,000h,000h,000h,0c0h,0c0h,030h,0f0h,00ch,03ch,003h,00fh	; af88  ..........0..<..
	defb 0c0h,0c0h,030h,0f0h,04ch,0fch,003h,08fh,000h,083h,000h,080h,040h,0c0h,000h,000h	; af98  ..0.L.......@...
	defb 0ffh,003h,0fdh,00eh,0f5h,038h,0dfh,0e0h,07fh,080h,0fdh,002h,0fdh,000h,0ffh,000h	; afa8  .....8..........
	defb 07fh,080h,0bfh,000h,0ffh,000h,0ffh,000h,0ffh,003h,0bdh,00eh,0f7h,038h,0dfh,0e0h	; afb8  .............8..
	defb 0ffh,003h,0fdh,00eh,0f7h,038h,0dfh,0e0h,07fh,080h,0ffh,000h,0ffh,000h,0ffh,000h	; afc8  .....8..........
	defb 07fh,080h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,003h,0fdh,00eh,0f7h,038h,0dfh,0e0h	; afd8  .............8..
	defb 0ffh,003h,0fdh,00eh,0f7h,038h,0dfh,0e0h,07fh,080h,0ffh,000h,0ffh,000h,0ffh,003h	; afe8  .....8..........
	defb 0ffh,003h,0f9h,00ah,0efh,068h,0dbh,044h,0f7h,0c8h,07fh,0a0h,0ffh,000h,0ffh,000h	; aff8  .....h.D........

; ----------------------------------------------------------------------
; DATOS dibujo_B008: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 15 de la lista 0xA27C (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (16 bytes)
;   0xb008..0xb018  (16 bytes)
DATA_dibujo_B008:
	defb 00fh,0fah,00fh,01fh,007h,00eh,009h,00fh,000h,001h,000h,000h,000h,000h,000h,000h	; b008  ................

; ----------------------------------------------------------------------
; DATOS dibujo_B018: 10 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 16 de la lista 0xA27C (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (240 bytes)
;   0xb018..0xb108  (240 bytes)
DATA_dibujo_B018:
	defb 038h,0d6h,020h,038h,0d6h,020h,038h,0d6h,020h,038h,0d6h,020h,038h,0d6h,020h,038h,0d6h,020h,038h,0d6h,020h,038h,0d6h,020h	; b018  8. 8. 8. 8. 8. 8. 8. 8.
	defb 038h,0d6h,020h,038h,0d6h,020h,038h,0d6h,020h,038h,0d6h,020h,038h,0d6h,020h,038h,0d6h,020h,038h,0d6h,020h,0d8h,016h,0c0h	; b030  8. 8. 8. 8. 8. 8. 8. ...
	defb 0ffh,000h,000h,000h,0ffh,000h,000h,000h,000h,066h,066h,000h,033h,022h,000h,0aah,033h,088h,0bbh,022h,099h,0aah,022h,088h	; b048  .........ff.3"..3.."..".
	defb 0ffh,000h,000h,080h,07fh,000h,080h,060h,000h,086h,066h,000h,082h,062h,000h,08ah,062h,008h,08ah,062h,008h,08ah,062h,008h	; b060  .......`..f..b..b..b..b.
	defb 0feh,000h,000h,000h,0feh,000h,008h,006h,000h,078h,076h,000h,038h,036h,000h,0b8h,036h,080h,0b8h,036h,080h,0b8h,036h,080h	; b078  .........xv.86..6..6..6.
	defb 0ffh,000h,000h,000h,0ffh,000h,080h,000h,080h,0a6h,026h,080h,0b3h,022h,080h,0aah,033h,088h,0bbh,022h,099h,0aah,022h,088h	; b090  ..........&.."..3.."..".
	defb 0e8h,016h,010h,000h,0feh,000h,000h,000h,000h,063h,063h,000h,033h,023h,000h,0abh,033h,088h,0bbh,023h,098h,0abh,023h,088h	; b0a8  .........cc.3#..3..#..#.
	defb 0fdh,003h,002h,002h,0fch,000h,000h,000h,000h,06dh,06dh,000h,036h,024h,002h,0aeh,034h,08ah,0beh,024h,09ah,0beh,024h,09ah	; b0c0  .........mm.6$..4..$..$.
	defb 07fh,080h,080h,080h,07fh,000h,000h,000h,000h,066h,066h,000h,033h,022h,000h,0aah,033h,088h,0bbh,022h,099h,0aah,022h,088h	; b0d8  .........ff.3"..3.."..".
	defb 0ffh,000h,000h,080h,0ffh,000h,0c0h,0c0h,000h,0e6h,0e6h,000h,0e3h,0e2h,010h,0eah,0ebh,010h,0edh,0ech,011h,0efh,0eeh,011h	; b0f0  ........................

; ----------------------------------------------------------------------
; DATOS dibujo_B108: 10 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 17 de la lista 0xA27C (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (240 bytes)
;   0xb108..0xb1f8  (240 bytes)
DATA_dibujo_B108:
	defb 000h,0ffh,000h,01fh,080h,000h,030h,080h,00fh,03fh,088h,000h,01ch,088h,000h,01ch,088h,001h,03dh,089h,000h,03dh,089h,000h	; b108  ......0..?........=..=..
	defb 000h,0ffh,000h,0dbh,000h,000h,000h,000h,0ffh,0ffh,000h,000h,000h,000h,000h,000h,000h,055h,055h,055h,000h,055h,055h,000h	; b120  .................UUU.UU.
	defb 001h,0ffh,000h,0fdh,001h,000h,01dh,011h,0e0h,0d9h,011h,020h,01dh,011h,020h,01dh,011h,020h,019h,011h,020h,01dh,011h,020h	; b138  ........... .. .. .. ..
	defb 07dh,089h,000h,03ch,088h,001h,07ch,088h,001h,03ch,088h,001h,01ch,088h,001h,03dh,089h,000h,07dh,089h,000h,01dh,089h,000h	; b150  }..<..|..<.....=..}.....
	defb 03ch,08ch,003h,03fh,088h,000h,03ch,088h,000h,01ch,088h,000h,03fh,08fh,000h,039h,089h,002h,03dh,089h,000h,07ch,088h,001h	; b168  <..?..<.....?..9..=..|..
	defb 07ch,088h,001h,03ch,088h,001h,01dh,089h,000h,03dh,089h,000h,03ch,088h,001h,03ch,088h,000h,008h,088h,007h,0ffh,0ffh,000h	; b180  |..<.....=..<..<........
	defb 000h,0ffh,07fh,040h,0ffh,0bfh,000h,0ffh,0ffh,003h,0ffh,0ffh,04fh,0ffh,0bch,03ch,0fch,0f3h,0f0h,0f0h,0cfh,0c0h,0c0h,03fh	; b198  ...@........O..<.......?
	defb 00fh,0ffh,0fch,03ch,0fch,0f3h,0f0h,0f0h,0cfh,0c0h,0c0h,03eh,000h,000h,0f8h,000h,000h,0e0h,000h,000h,080h,000h,000h,000h	; b1b0  ...<.......>............
	defb 00fh,0ffh,0fch,03ch,0fch,0f3h,0f0h,0f0h,0cfh,0c0h,0c0h,03eh,000h,000h,0f8h,000h,000h,0e0h,000h,000h,080h,000h,000h,0ffh	; b1c8  ...<.......>............
	defb 000h,0ffh,07fh,000h,0ffh,0ffh,000h,0ffh,0ffh,003h,0ffh,0ffh,00fh,0ffh,0fch,03ch,0fch,0f3h,0f0h,0f0h,0cfh,0c0h,0c0h,03eh	; b1e0  ...............<.......>

; ----------------------------------------------------------------------
; DATOS dibujo_B1F8: 6 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 18 de la lista 0xA27C (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (144 bytes)
;   0xb1f8..0xb288  (144 bytes)
DATA_dibujo_B1F8:
	defb 000h,0ffh,0ffh,0feh,0ffh,0feh,002h,001h,0feh,060h,067h,098h,028h,027h,0d8h,080h,017h,060h,0a8h,017h,068h,080h,077h,000h	; b1f8  .........`g.('...`..h.w.
	defb 093h,0dbh,000h,080h,090h,04fh,09fh,094h,0e4h,050h,050h,0afh,07bh,030h,094h,014h,054h,08bh,01fh,014h,004h,0ffh,0ffh,000h	; b210  .....O...PP.{0..T.......
	defb 000h,000h,000h,008h,00eh,001h,00eh,030h,001h,010h,050h,02fh,07bh,0a0h,024h,004h,084h,07bh,0efh,084h,094h,0ffh,0ffh,000h	; b228  .......0..P/{.$..{......
	defb 000h,0c1h,000h,000h,0c2h,001h,003h,0dch,010h,010h,0c0h,00fh,01bh,0a0h,024h,021h,081h,01eh,00eh,0a7h,034h,07fh,0ffh,000h	; b240  ..............$!....4...
	defb 008h,098h,006h,094h,0b4h,00bh,08fh,084h,0f4h,010h,010h,0efh,07bh,020h,0a4h,084h,084h,07bh,0efh,0e4h,0f4h,0ffh,0ffh,000h	; b258  ............{ ...{......
	defb 000h,040h,080h,000h,060h,080h,000h,020h,0c0h,000h,010h,0e0h,060h,030h,0a0h,000h,00ch,0f0h,06eh,045h,0d4h,0ffh,0ffh,000h	; b270  .@..`.. ....`0....nE....

; ----------------------------------------------------------------------
; DATOS dibujo_B288: 2 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 19 de la lista 0xA27C (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (48 bytes)
;   0xb288..0xb2b8  (48 bytes)
DATA_dibujo_B288:
	defb 0ffh,000h,000h,0ffh,000h,000h,0ffh,000h,000h,000h,000h,0feh,024h,066h,080h,000h,07eh,080h,034h,07eh,098h,024h,07eh,098h	; b288  ............$f..~.4~.$~.
	defb 018h,066h,098h,000h,07eh,080h,07eh,07eh,0c8h,07eh,07eh,092h,000h,000h,000h,03fh,040h,000h,03fh,040h,000h,03fh,040h,000h	; b2a0  .f..~.~~.~~....?@.?@.?@.

; ----------------------------------------------------------------------
; DATOS dibujo_B2B8: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 20 de la lista 0xA27C (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (16 bytes)
;   0xb2b8..0xb2c8  (16 bytes)
DATA_dibujo_B2B8:
	defb 033h,091h,022h,080h,066h,080h,000h,080h,07fh,080h,07fh,080h,000h,080h,07fh,080h	; b2b8  3.".f...........

; ----------------------------------------------------------------------
; DATOS dibujo_B2C8: 10 caracteres de 8x8 a 1 bit por punto (8 bytes cada
;   uno), ficha 0 de la lista 0xA2EB (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (80 bytes)
;   0xb2c8..0xb318  (80 bytes)
DATA_dibujo_B2C8:
	defb 00fh,01fh,00fh,00fh,01fh,01fh,03fh,00fh	; b2c8  ......?.
	defb 0f0h,0f8h,0f0h,0f0h,0f8h,0f8h,0f1h,0f0h	; b2d0  ........
	defb 000h,000h,000h,000h,000h,004h,010h,01ch	; b2d8  ........
	defb 000h,000h,010h,024h,0ffh,0ffh,0ffh,0ffh	; b2e0  ...$....
	defb 000h,000h,000h,000h,000h,000h,000h,000h	; b2e8  ........
	defb 00fh,00fh,00fh,00fh,00fh,00fh,00fh,00fh	; b2f0  ........
	defb 0ffh,0ffh,0ffh,0ffh,000h,000h,000h,000h	; b2f8  ........
	defb 000h,000h,000h,000h,0ffh,0ffh,0ffh,0ffh	; b300  ........
	defb 0f0h,0f0h,0f0h,0f0h,0f0h,0f0h,0f0h,0f0h	; b308  ........
	defb 0ffh,0ffh,0ffh,0ffh,030h,020h,020h,004h	; b310  ....0  .

; ----------------------------------------------------------------------
; DATOS dibujo_B318: 2 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 1 de la lista 0xA2EB (p00:4D92, p00:4DF5); lo leen p00:4C0C (16
;   bytes)
;   0xb318..0xb328  (16 bytes)
DATA_dibujo_B318:
	defb 0ffh,0feh,0fch,0f8h,0f0h,0e0h,0c0h,080h	; b318  ........
	defb 001h,003h,007h,00fh,01fh,03fh,07fh,0ffh	; b320  .....?..

; ----------------------------------------------------------------------
; DATOS dibujo_B328: 13 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 2 de la lista 0xA2EB (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (208 bytes)
;   0xb328..0xb3f8  (208 bytes)
DATA_dibujo_B328:
	defb 000h,0ffh,000h,0ffh,000h,0ffh,001h,0feh,005h,0fah,000h,0ffh,004h,0fah,013h,0ech	; b328  ................
	defb 0d6h,009h,0a0h,05fh,0d2h,02dh,020h,0dfh,008h,0f7h,000h,0ffh,000h,0ffh,000h,0ffh	; b338  ..._.- .........
	defb 000h,0ffh,000h,0ffh,000h,0ffh,080h,07fh,088h,077h,000h,0ffh,020h,05fh,0c0h,03fh	; b348  .........w.. _.?
	defb 050h,0afh,080h,07fh,040h,03fh,050h,0afh,080h,07fh,0a0h,05fh,000h,0ffh,080h,07fh	; b358  P...@?P...._....
	defb 000h,0ffh,000h,0ffh,008h,0f7h,020h,0dfh,012h,0edh,058h,0a7h,043h,0b8h,09dh,042h	; b368  ...... ...X.C..B
	defb 09dh,022h,0f3h,004h,0a4h,05bh,035h,0cah,040h,0bfh,010h,0efh,008h,0f7h,000h,0ffh	; b378  ."...[5.@.......
	defb 0f5h,002h,0ffh,000h,0afh,050h,03dh,0c2h,046h,0b8h,017h,0e8h,005h,0fah,042h,0bdh	; b388  .....P=.F.....B.
	defb 00bh,0f4h,001h,0feh,001h,0fch,00bh,0f4h,001h,0feh,001h,0feh,000h,0ffh,001h,0feh	; b398  ................
	defb 003h,0fch,012h,0edh,009h,0f2h,013h,0ech,045h,0bah,016h,0e8h,002h,0fdh,007h,0f8h	; b3a8  ........E.......
	defb 000h,0ffh,042h,0bdh,010h,0efh,048h,0b7h,024h,0dah,09eh,041h,06bh,094h,0fah,001h	; b3b8  ..B...H.$..Ak...
	defb 000h,0ffh,000h,0ffh,000h,0ffh,010h,0efh,000h,0ffh,0dah,025h,090h,04fh,0eeh,011h	; b3c8  ...........%.O..
	defb 0e0h,01fh,050h,0afh,068h,017h,0a0h,05fh,0f0h,00fh,060h,09fh,088h,037h,0c0h,03fh	; b3d8  ..P.h.._..`..7.?
	defb 0edh,002h,007h,0f8h,008h,0f7h,000h,0fdh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; b3e8  ................

; ----------------------------------------------------------------------
; DATOS dibujo_B3F8: 4 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 3 de la lista 0xA2EB (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (64 bytes)
;   0xb3f8..0xb438  (64 bytes)
DATA_dibujo_B3F8:
	defb 0ffh,000h,0feh,000h,0f7h,008h,0bfh,000h,0ffh,008h,0fdh,002h,0ffh,000h,0bfh,040h	; b3f8  ...............@
	defb 0ffh,000h,0bfh,042h,0ffh,000h,0efh,000h,0ffh,000h,0fbh,004h,0ffh,040h,0f7h,000h	; b408  ...B.........@..
	defb 0ffh,000h,0f7h,008h,0ffh,000h,0bdh,000h,0ffh,040h,0ffh,010h,0ffh,001h,0dfh,000h	; b418  .........@......
	defb 0ffh,000h,07fh,082h,0ffh,000h,0ffh,000h,0dfh,004h,0ffh,000h,0fdh,000h,0f7h,008h	; b428  ................

; ----------------------------------------------------------------------
; DATOS dibujo_B438: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 4 de la lista 0xA2EB (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (16 bytes)
;   0xb438..0xb448  (16 bytes)
DATA_dibujo_B438:
	defb 098h,067h,0f1h,00ah,0aah,015h,0fch,003h,0eah,015h,0fbh,004h,0b7h,000h,0ffh,000h	; b438  .g..............

; ----------------------------------------------------------------------
; DATOS dibujo_B448: 4 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 5 de la lista 0xA2EB (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (64 bytes)
;   0xb448..0xb488  (64 bytes)
DATA_dibujo_B448:
	defb 0e9h,090h,0e3h,084h,0c9h,090h,0e3h,084h,0c9h,090h,0e3h,084h,0c9h,090h,0e3h,084h	; b448  ................
	defb 0aah,0aah,0c4h,088h,0e1h,082h,0f4h,088h,0d9h,082h,0ech,080h,0c7h,090h,0e3h,080h	; b458  ................
	defb 0aah,0aah,044h,088h,011h,022h,044h,088h,011h,022h,044h,088h,0ffh,000h,000h,000h	; b468  ..D.."D.."D.....
	defb 0feh,081h,0deh,0a1h,0fah,085h,0feh,081h,0deh,0a1h,0feh,081h,0f6h,089h,0feh,081h	; b478  ................

; ----------------------------------------------------------------------
; DATOS dibujo_B488: 3 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 6 de la lista 0xA2EB (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (48 bytes)
;   0xb488..0xb4b8  (48 bytes)
DATA_dibujo_B488:
	defb 001h,000h,021h,000h,001h,000h,005h,000h,041h,000h,001h,000h,0ffh,000h,0ffh,000h	; b488  ..!.....A.......
	defb 002h,000h,020h,000h,000h,000h,004h,000h,040h,000h,000h,000h,0ffh,000h,0ffh,000h	; b498  .. .....@.......
	defb 080h,000h,0c0h,000h,0e4h,000h,0f0h,000h,0f8h,000h,0dch,000h,0feh,001h,0fbh,004h	; b4a8  ................

; ----------------------------------------------------------------------
; DATOS dibujo_B4B8: 4 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 7 de la lista 0xA2EB (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (64 bytes)
;   0xb4b8..0xb4f8  (64 bytes)
DATA_dibujo_B4B8:
	defb 001h,0f1h,013h,0e3h,087h,077h,00fh,0ffh,03fh,0cfh,01fh,0efh,00fh,0ffh,00fh,0ffh	; b4b8  .....w..?.......
	defb 00fh,0ffh,00eh,0feh,08ch,07ch,088h,078h,0e0h,010h,0c0h,030h,000h,0f0h,000h,0f0h	; b4c8  .....|.x...0....
	defb 0f0h,0ffh,0f1h,0feh,0f0h,0ffh,0f1h,0feh,0f9h,0f6h,0e0h,0efh,0c0h,0cfh,080h,08fh	; b4d8  ................
	defb 000h,00fh,000h,00fh,000h,00fh,001h,00eh,013h,01ch,031h,03eh,070h,07fh,0f1h,0feh	; b4e8  ..........1>p...

; ----------------------------------------------------------------------
; DATOS dibujo_B4F8: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 8 de la lista 0xA2EB (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (16 bytes)
;   0xb4f8..0xb508  (16 bytes)
DATA_dibujo_B4F8:
	defb 0ffh,080h,0afh,080h,09fh,080h,0cdh,080h,087h,080h,083h,080h,089h,080h,080h,080h	; b4f8  ................

; ----------------------------------------------------------------------
; DATOS dibujo_B508: 2 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 9 de la lista 0xA2EB (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (48 bytes)
;   0xb508..0xb538  (48 bytes)
DATA_dibujo_B508:
	defb 0aah,0aah,055h,088h,000h,033h,042h,080h,01ch,0e8h,000h,003h,0f2h,000h,004h,0b8h,000h,003h,0fch,000h,000h,0eeh,000h,000h	; b508  ..U..3B.................
	defb 000h,0ffh,0ffh,024h,0e7h,0c3h,05ah,0dbh,081h,03eh,0adh,099h,03eh,0bdh,099h,05eh,0dbh,081h,03ch,0e7h,0c3h,000h,0ffh,0ffh	; b520  ...$..Z..>..>..^..<.....

; ----------------------------------------------------------------------
; DATOS dibujo_B538: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 10 de la lista 0xA2EB (p00:4D92, p00:4DF5); lo leen p00:4C0C (8
;   bytes)
;   0xb538..0xb540  (8 bytes)
DATA_dibujo_B538:
	defb 00fh,03ch,0f0h,0c3h,00fh,03ch,0f0h,0c3h	; b538  .<...<..

; ----------------------------------------------------------------------
; DATOS dibujo_B540: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 11 de la lista 0xA2EB (p00:4D92, p00:4DF5); lo leen p00:4C0C (8
;   bytes)
;   0xb540..0xb548  (8 bytes)
DATA_dibujo_B540:
	defb 0ffh,0ffh,0ffh,0ffh,0aah,055h,000h,000h	; b540  .....U..

; ----------------------------------------------------------------------
; DATOS dibujo_B548: 3 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 12 de la lista 0xA2EB (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (48 bytes)
;   0xb548..0xb578  (48 bytes)
DATA_dibujo_B548:
	defb 08fh,0f0h,0bch,0c3h,0b0h,00fh,083h,03ch,08fh,0f0h,0bch,0c3h,0b0h,00fh,083h,03ch	; b548  .......<.......<
	defb 00fh,0f0h,000h,0c3h,0f0h,00fh,0c3h,03ch,00fh,0f0h,03ch,0c3h,0f0h,00fh,0c3h,03ch	; b558  .......<..<....<
	defb 0cfh,0b0h,080h,0c3h,0b0h,00fh,083h,03ch,08fh,0f0h,0bch,0c3h,0b0h,00fh,083h,03ch	; b568  .......<.......<

; ----------------------------------------------------------------------
; DATOS dibujo_B578: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 13 de la lista 0xA2EB (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (16 bytes)
;   0xb578..0xb588  (16 bytes)
DATA_dibujo_B578:
	defb 000h,00fh,000h,03ch,000h,0f0h,000h,0c3h,000h,00fh,0ffh,0c3h,000h,0ffh,000h,0ffh	; b578  ...<............

; ----------------------------------------------------------------------
; DATOS dibujo_B588: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 14 de la lista 0xA2EB (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (32 bytes)
;   0xb588..0xb5a8  (32 bytes)
DATA_dibujo_B588:
	defb 0f8h,0ffh,0f8h,0ffh,0f8h,0ffh,0f8h,0ffh,0f8h,0afh,0f8h,05fh,0f8h,007h,0fbh,007h	; b588  ..........._....
	defb 01fh,0ffh,01fh,0ffh,01fh,0ffh,01fh,0ffh,01fh,0feh,01fh,0fdh,01fh,0fah,07fh,0f0h	; b598  ................

; ----------------------------------------------------------------------
; DATOS dibujo_B5A8: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 15 de la lista 0xA2EB (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (32 bytes)
;   0xb5a8..0xb5c8  (32 bytes)
DATA_dibujo_B5A8:
	defb 0f5h,00ch,0b5h,04ch,0f5h,00ch,0f5h,00ch,0f5h,00ch,0d5h,02ch,0f5h,08ch,0f5h,00ch	; b5a8  ...L.......,....
	defb 0f0h,00fh,0f7h,00bh,0d5h,02ch,0f4h,00ch,0f5h,00ch,0f5h,00ch,0f5h,04ch,0f5h,00ch	; b5b8  .....,.......L..

; ----------------------------------------------------------------------
; DATOS dibujo_B5C8: 4 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 16 de la lista 0xA2EB (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (64 bytes)
;   0xb5c8..0xb608  (64 bytes)
DATA_dibujo_B5C8:
	defb 0cch,099h,0d5h,0ffh,0b3h,0e6h,0d5h,0ffh,0cch,099h,0d5h,0ffh,0b3h,0e6h,0d5h,0ffh	; b5c8  ................
	defb 0cch,059h,0d5h,07fh,0f3h,066h,0d5h,07fh,0cch,059h,0d5h,07fh,0f3h,066h,0d5h,07fh	; b5d8  .Y...f...Y...f..
	defb 0cch,099h,055h,0ffh,033h,066h,055h,0ffh,0cch,099h,055h,0ffh,033h,066h,055h,0ffh	; b5e8  ..U.3fU...U.3fU.
	defb 0cch,059h,0d5h,07fh,0f3h,066h,095h,03fh,04ch,059h,0d5h,07fh,0f3h,066h,0d5h,0ffh	; b5f8  .Y...f.?LY...f..

; ----------------------------------------------------------------------
; DATOS dibujo_B608: 24 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 17 de la lista 0xA2EB (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (576 bytes)
;   0xb608..0xb848  (576 bytes)
DATA_dibujo_B608:
	defb 08ch,048h,0d1h,08eh,048h,0d0h,08ch,048h,0d1h,08eh,048h,0d0h,08ch,048h,0d1h,08eh,048h,0d0h,08ch,048h,0d1h,08eh,048h,0d0h	; b608  .H..H..H..H..H..H..H..H.
	defb 08ch,048h,0d1h,08eh,048h,0d0h,08ch,048h,0d1h,00eh,048h,060h,08ch,008h,0d1h,08eh,048h,0d0h,08ch,048h,0f1h,00eh,008h,060h	; b620  .H..H..H..H`....H..H...`
	defb 0ffh,000h,0ffh,000h,0ffh,0ffh,000h,000h,0ffh,000h,000h,0ffh,0ffh,0ffh,000h,055h,055h,02ah,066h,022h,044h,0ffh,055h,0aah	; b638  ...............UU*f"D.U.
	defb 07fh,000h,0ffh,080h,07fh,0ffh,000h,000h,07fh,000h,000h,07fh,0ffh,0ffh,000h,055h,055h,02ah,066h,022h,044h,0ffh,055h,0aah	; b650  ...............UU*f"D.U.
	defb 0fbh,000h,0ffh,004h,0fbh,0ffh,000h,000h,0fbh,000h,000h,0fbh,0ffh,0ffh,000h,054h,055h,02bh,064h,021h,045h,0feh,055h,0abh	; b668  ...............TU+d!E.U.
	defb 098h,089h,055h,0feh,055h,0abh,066h,023h,055h,0feh,055h,0abh,098h,088h,055h,0feh,055h,0abh,066h,023h,055h,0feh,054h,0aah	; b680  ..U.U.f#U.U...U.U.f#U.T.
	defb 0dfh,000h,0ffh,020h,0dfh,0ffh,000h,000h,0dfh,000h,000h,0dfh,0ffh,0ffh,000h,055h,055h,0aah,066h,062h,084h,07fh,055h,0aah	; b698  ... ...........UU.fb..U.
	defb 0ffh,000h,0ffh,000h,0ffh,0ffh,000h,000h,0ffh,000h,000h,0ffh,0ffh,0ffh,000h,0d5h,0d5h,02ah,0e6h,0a2h,044h,0ffh,0d5h,02ah	; b6b0  .................*..D..*
	defb 098h,089h,055h,0feh,055h,0abh,066h,023h,055h,0feh,055h,0abh,098h,089h,055h,0feh,055h,0abh,066h,023h,055h,0feh,055h,0abh	; b6c8  ..U.U.f#U.U...U.U.f#U.U.
	defb 098h,084h,05dh,0f8h,054h,0adh,068h,024h,05dh,0f0h,054h,0a6h,098h,080h,05dh,0f8h,054h,0adh,060h,024h,05dh,0f0h,050h,0a6h	; b6e0  ..].T.h$].T...].T.`$].P.
	defb 089h,048h,0d5h,08fh,04dh,0d2h,08eh,04ah,0d5h,00fh,04dh,062h,089h,008h,0d5h,08fh,04dh,0d2h,00eh,04ah,0d5h,00fh,00dh,062h	; b6f8  .H..M..J..Mb....M..J...b
	defb 098h,084h,05dh,0f8h,054h,0adh,068h,024h,05dh,0f8h,054h,0adh,098h,084h,05dh,0f8h,054h,0adh,068h,024h,05dh,0f8h,054h,0adh	; b710  ..].T.h$].T...].T.h$].T.
	defb 089h,048h,0d5h,08fh,04dh,0d2h,08eh,04ah,0d5h,08fh,04dh,0d2h,089h,048h,0d5h,08fh,04dh,0d2h,08eh,04ah,0d5h,08fh,04dh,0d2h	; b728  .H..M..J..M..H..M..J..M.
	defb 0e8h,008h,0e7h,008h,0c8h,0d7h,088h,04ah,057h,088h,048h,0d7h,088h,048h,0d7h,089h,048h,0d7h,088h,048h,0d7h,08ch,048h,0d7h	; b740  .......JW.H..H..H..H..H.
	defb 08ch,048h,0d1h,08eh,048h,0d0h,08ch,048h,0d1h,08eh,048h,0d0h,08ch,048h,0d1h,00eh,088h,090h,00ch,008h,0d1h,00eh,008h,0e0h	; b758  .H..H..H..H..H..........
	defb 088h,008h,0d7h,00ah,048h,067h,088h,048h,0d7h,088h,048h,0d3h,088h,048h,0d1h,08ch,048h,0d0h,08ch,048h,0d1h,08eh,048h,0d0h	; b770  ....Hg.H..H..H..H..H..H.
	defb 088h,008h,0d7h,00ah,048h,067h,088h,048h,0d7h,088h,048h,0d7h,089h,048h,0d7h,088h,048h,0d7h,08ah,048h,0d7h,088h,048h,0d7h	; b788  ....Hg.H..H..H..H..H..H.
	defb 088h,048h,0d7h,08ah,048h,0d7h,088h,048h,0d7h,089h,048h,0d7h,088h,048h,0d7h,088h,048h,0d7h,088h,04ah,0d7h,088h,048h,0d7h	; b7a0  .H..H..H..H..H..H..J..H.
	defb 08eh,008h,0d1h,00eh,048h,060h,08ch,048h,0d1h,08eh,048h,0d0h,08ch,048h,0d1h,08eh,048h,0d0h,08ch,048h,0d1h,08eh,048h,0d0h	; b7b8  ....H`.H..H..H..H..H..H.
	defb 008h,000h,0fdh,000h,004h,0f6h,028h,004h,0fdh,008h,004h,0fdh,008h,004h,0fdh,008h,004h,0fdh,008h,024h,0fdh,008h,004h,0fdh	; b7d0  ......(............$....
	defb 008h,004h,0fdh,008h,004h,0fdh,048h,004h,0fdh,000h,004h,0f6h,008h,000h,0fdh,048h,004h,0fdh,008h,004h,0ffh,000h,000h,0f6h	; b7e8  ......H........H........
	defb 0ffh,000h,0ffh,080h,07fh,0ffh,080h,040h,0ffh,080h,040h,0dfh,08fh,04fh,0d0h,08dh,04dh,0d2h,08eh,04ah,0d4h,08fh,04dh,0d2h	; b800  .......@..@..O..M..J..M.
	defb 0ffh,000h,0ffh,000h,0ffh,0ffh,000h,000h,0fdh,000h,004h,0fdh,0f8h,0f4h,00dh,058h,054h,02dh,068h,024h,04dh,0f8h,054h,0adh	; b818  ...............XT-h$M.T.
	defb 08ch,048h,0d1h,00eh,0c8h,0d0h,00ch,008h,0f1h,00eh,008h,0d0h,00ch,048h,0d1h,08eh,048h,0d0h,08ch,048h,0d1h,08eh,048h,0d0h	; b830  .H...........H..H..H..H.

; ----------------------------------------------------------------------
; DATOS dibujo_B848: 1 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 18 de la lista 0xA2EB (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (24 bytes)
;   0xb848..0xb860  (24 bytes)
DATA_dibujo_B848:
	defb 080h,08fh,000h,080h,0bch,000h,000h,0b0h,040h,000h,083h,040h,080h,08fh,000h,0ffh,0c3h,000h,000h,0ffh,000h,000h,0ffh,000h	; b848  ........@..@............

; ----------------------------------------------------------------------
; DATOS dibujo_B860: 11 caracteres de 8x8 a 1 bit por punto (8 bytes cada
;   uno), ficha 0 de la lista 0xA34B (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4CB2 (88 bytes)
;   0xb860..0xb8b8  (88 bytes)
DATA_dibujo_B860:
	defb 000h,000h,000h,000h,000h,000h,000h,000h	; b860  ........
	defb 0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh	; b868  ........
	defb 0feh,0feh,0feh,0feh,0feh,0feh,0feh,0fch	; b870  ........
	defb 0fch,0fch,0f8h,0f8h,0f0h,0e0h,0e0h,0e0h	; b878  ........
	defb 0e0h,0e0h,0e0h,0e0h,0e0h,0e0h,0e0h,0e0h	; b880  ........
	defb 0c0h,0c0h,080h,080h,080h,080h,080h,080h	; b888  ........
	defb 0fch,0f8h,0f8h,0f8h,0f0h,0f0h,0f0h,0e0h	; b890  ........
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0feh,0f8h,000h	; b898  ........
	defb 01fh,01fh,00fh,000h,000h,000h,000h,000h	; b8a0  ........
	defb 0e0h,0c0h,0c0h,080h,000h,000h,000h,000h	; b8a8  ........
	defb 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h	; b8b0  ........

; ----------------------------------------------------------------------
; DATOS dibujo_B8B8: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 1 de la lista 0xA34B (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4CB2 (8 bytes)
;   0xb8b8..0xb8c0  (8 bytes)
DATA_dibujo_B8B8:
	defb 07fh,07fh,07fh,07fh,07fh,0ffh,0ffh,0bfh	; b8b8  ........

; ----------------------------------------------------------------------
; DATOS dibujo_B8C0: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 2 de la lista 0xA34B (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4CB2 (8 bytes)
;   0xb8c0..0xb8c8  (8 bytes)
DATA_dibujo_B8C0:
	defb 077h,077h,077h,0f7h,0f7h,077h,0e7h,0e7h	; b8c0  www..w..

; ----------------------------------------------------------------------
; DATOS dibujo_B8C8: 3 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 3 de la lista 0xA34B (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4CB2 (48 bytes)
;   0xb8c8..0xb8f8  (48 bytes)
DATA_dibujo_B8C8:
	defb 09fh,09fh,05fh,05fh,0dfh,05fh,0bfh,03fh,0bfh,03fh,0bfh,03fh,0bfh,03fh,0bfh,03fh	; b8c8  ..__._.?.?.?.?.?
	defb 0ffh,03fh,0ffh,03fh,07fh,03fh,07fh,03fh,07fh,03fh,07fh,03fh,07fh,03fh,0ffh,03fh	; b8d8  .?.?.?.?.?.?.?.?
	defb 01fh,01fh,03fh,01fh,03fh,01fh,07fh,01fh,0ffh,01fh,07fh,09fh,05fh,09fh,01fh,01fh	; b8e8  ..?.?......._...

; ----------------------------------------------------------------------
; DATOS dibujo_B8F8: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 4 de la lista 0xA34B (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4CB2 (32 bytes)
;   0xb8f8..0xb918  (32 bytes)
DATA_dibujo_B8F8:
	defb 01bh,010h,01bh,000h,01bh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; b8f8  ................
	defb 09eh,060h,0deh,020h,0deh,020h,0deh,000h,0deh,000h,0fch,000h,0fch,000h,0fch,000h	; b908  .`. . ..........

; ----------------------------------------------------------------------
; DATOS dibujo_B918: 2 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 5 de la lista 0xA34B (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4CB2 (48 bytes)
;   0xb918..0xb948  (48 bytes)
DATA_dibujo_B918:
	defb 002h,0f8h,0f9h,002h,0f8h,0f9h,002h,0f9h,0f8h,002h,0f9h,0f8h,003h,0f8h,0f8h,002h,0f8h,0f8h,000h,0fch,0fch,001h,0fdh,0feh	; b918  ........................
	defb 001h,0fbh,0fch,001h,0fbh,0fch,002h,0feh,0fch,006h,0fah,0fch,006h,0fbh,0fdh,000h,0ffh,0ffh,000h,0ffh,0ffh,001h,0feh,0ffh	; b930  ........................

; ----------------------------------------------------------------------
; DATOS dibujo_B948: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 6 de la lista 0xA34B (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4CB2 (8 bytes)
;   0xb948..0xb950  (8 bytes)
DATA_dibujo_B948:
	defb 0bfh,0bfh,0f7h,0e7h,0ffh,0efh,0e7h,0ffh	; b948  ........

; ----------------------------------------------------------------------
; DATOS dibujo_B950: 5 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 7 de la lista 0xA34B (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4CB2 (80 bytes)
;   0xb950..0xb9a0  (80 bytes)
DATA_dibujo_B950:
	defb 0efh,0efh,0efh,0efh,0efh,0efh,0cfh,0cfh,0cfh,0cfh,04fh,04fh,08fh,00bh,08fh,00bh	; b950  ..........OO....
	defb 08fh,00bh,04bh,04bh,04fh,04fh,0cfh,0cfh,04fh,04fh,02fh,02fh,03fh,03fh,01fh,01fh	; b960  ..KKOO..OO//??..
	defb 0e7h,0e7h,0e7h,0e7h,0d7h,0d7h,077h,0d5h,0d7h,0f5h,097h,0b5h,0fdh,0bdh,0efh,0efh	; b970  ......w.........
	defb 0b7h,0d7h,0b7h,0d7h,06fh,0afh,0efh,0eeh,05fh,05eh,03dh,03ch,0ddh,0dch,0fch,0fch	; b980  ....o..._^=<....
	defb 0cbh,01dh,0cbh,01dh,085h,00eh,086h,00fh,083h,006h,087h,004h,046h,003h,046h,00fh	; b990  ............F.F.

; ----------------------------------------------------------------------
; DATOS dibujo_B9A0: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 8 de la lista 0xA34B (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4CB2 (16 bytes)
;   0xb9a0..0xb9b0  (16 bytes)
DATA_dibujo_B9A0:
	defb 0fch,0bch,09eh,0feh,0feh,0deh,0ffh,0dfh,0ffh,0dfh,09fh,0ffh,0bbh,0dbh,0bbh,0dbh	; b9a0  ................

; ----------------------------------------------------------------------
; DATOS dibujo_B9B0: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 9 de la lista 0xA34B (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4CB2 (16 bytes)
;   0xb9b0..0xb9c0  (16 bytes)
DATA_dibujo_B9B0:
	defb 03ch,040h,03ch,0c2h,07eh,081h,0fbh,004h,0c0h,033h,000h,081h,07fh,000h,0ffh,07eh	; b9b0  <@<.~....3.....~

; ----------------------------------------------------------------------
; DATOS dibujo_B9C0: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 10 de la lista 0xA34B (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4CB2 (16 bytes)
;   0xb9c0..0xb9d0  (16 bytes)
DATA_dibujo_B9C0:
	defb 07eh,0bdh,07fh,02fh,0ffh,02fh,0efh,0efh,0efh,02fh,0ffh,00fh,0ffh,01fh,0ffh,00bh	; b9c0  ~.././.../......

; ----------------------------------------------------------------------
; DATOS dibujo_B9D0: 24 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 11 de la lista 0xA34B (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4CB2 (576 bytes)
;   0xb9d0..0xbc10  (576 bytes)
DATA_dibujo_B9D0:
	defb 0cfh,0f0h,0ffh,0bfh,0c0h,0ffh,040h,080h,0ffh,00ch,030h,0ffh,0cch,070h,0ffh,04ch,0fch,0fbh,04ch,0fch,0fbh,03bh,0b3h,08ch	; b9d0  ......@...0..p.L..L.....
	defb 0e7h,000h,0ffh,0c3h,000h,0ffh,099h,018h,0e7h,01ch,01ch,0e3h,05fh,05dh,0a3h,03dh,03fh,0c3h,03ch,03ah,0c6h,0bdh,0bbh,046h	; b9e8  ............_].=?.<:...F
	defb 04eh,0f0h,0ffh,04eh,0f0h,0ffh,002h,000h,0ffh,030h,0c0h,0ffh,030h,0c0h,0ffh,031h,0f1h,0eeh,031h,0f1h,0eeh,0edh,0cdh,032h	; ba00  N..N.....0..0..1..1....2
	defb 0b9h,010h,07fh,0b9h,010h,07fh,0aah,016h,07dh,02bh,097h,0fch,02bh,093h,0f8h,02fh,091h,0feh,09dh,013h,0feh,0d4h,018h,03fh	; ba18  ........}+..+../.......?
	defb 073h,0f3h,084h,0c4h,0cch,03bh,0bfh,08ch,073h,061h,01eh,0ffh,0d8h,03fh,0ffh,08ch,04fh,0cfh,090h,05fh,0dfh,0a0h,07fh,0ffh	; ba30  s.......sa...?..O.._....
	defb 0ffh,0fbh,004h,07eh,07eh,081h,03dh,03ch,0c3h,09bh,018h,0e7h,09ah,019h,0e7h,0ffh,03dh,0c3h,05fh,0bdh,0e7h,01ah,099h,0e7h	; ba48  ...~~.=<........=._.....
	defb 0cfh,0cfh,010h,013h,033h,0ech,0f9h,031h,0ceh,00ch,0f0h,0ffh,0e4h,0f8h,0ffh,036h,038h,03fh,012h,07ch,07fh,080h,0fch,0ffh	; ba60  ....3..1.......68?.|....
	defb 0d0h,018h,03fh,0c4h,010h,03fh,0c6h,008h,03fh,0c6h,008h,03fh,0c6h,008h,03fh,0dah,00ch,03fh,093h,044h,077h,093h,044h,077h	; ba78  ..?..?..?..?..?..?.Dw.Dw
	defb 00ch,07fh,0f7h,045h,032h,0ffh,0beh,080h,07fh,060h,060h,09fh,03fh,03fh,0c0h,01fh,01ch,0e3h,01eh,059h,0e7h,01ch,017h,0ebh	; ba90  ...E2....``.??.....Y....
	defb 065h,0f9h,0beh,029h,091h,0feh,0f3h,003h,0fch,007h,007h,0f8h,0ffh,0ffh,000h,07fh,07fh,080h,0feh,0feh,001h,0f9h,0f8h,007h	; baa8  e..)....................
	defb 093h,044h,077h,0d8h,00eh,07fh,0d0h,00ch,03fh,0d0h,00ch,03fh,0dah,00ah,03fh,0d0h,002h,037h,0d0h,000h,037h,0d9h,00ah,03fh	; bac0  .Dw.....?..?..?..7..7..?
	defb 0ebh,01ch,017h,0f1h,032h,02fh,0b1h,062h,04fh,0d3h,042h,03fh,0f3h,032h,04fh,0b6h,043h,04fh,0c4h,063h,07fh,0f6h,071h,00fh	; bad8  ....2/.bO.B?.2O.CO.c..q.
	defb 0b4h,019h,07fh,0b4h,019h,07fh,0a4h,019h,07fh,0a5h,018h,07fh,0b4h,018h,07fh,0a6h,008h,06fh,0a5h,008h,06fh,0b5h,018h,07fh	; baf0  .................o..o...
	defb 046h,04dh,0fbh,09eh,04bh,0f1h,08fh,01fh,0f1h,0eeh,017h,0f1h,0d7h,037h,0e1h,0ddh,037h,0e3h,09ch,03fh,0e7h,0bah,01fh,0edh	; bb08  FM..K........7..7..?....
	defb 0d9h,00ah,03fh,0d9h,00ah,03fh,0e9h,00ah,01fh,0e9h,00ah,01fh,0e9h,00ah,01fh,0e8h,00bh,01eh,0e0h,00bh,01eh,0e1h,00ah,01fh	; bb20  ..?..?..................
	defb 0e2h,008h,01fh,0e0h,009h,01fh,0e9h,002h,01fh,0ebh,002h,01fh,0e5h,000h,01dh,0e3h,006h,01fh,0e1h,006h,01fh,0f0h,00eh,00fh	; bb38  ........................
	defb 04fh,007h,0f9h,00ch,01bh,0f3h,04dh,01eh,0f3h,01fh,03eh,0e3h,01fh,036h,0e3h,03fh,01eh,0e3h,03fh,016h,0e3h,015h,036h,0e3h	; bb50  O.....M...>..6.?..?...6.
	defb 014h,037h,0e3h,01fh,035h,0e3h,016h,037h,0e1h,09fh,037h,0e1h,01ch,037h,0e3h,099h,038h,0e3h,02ch,089h,0f3h,0cah,09dh,0f7h	; bb68  .7..5..7..7..7..8.,.....
	defb 08eh,05dh,0f7h,0ceh,01dh,0f7h,05eh,00dh,0f7h,0c6h,00fh,07bh,06ch,007h,0bbh,0deh,083h,01dh,0eeh,0c3h,005h,0feh,063h,001h	; bb80  .]....^....{l.........c.
	defb 0feh,0feh,000h,0f4h,0f4h,000h,0ffh,0ffh,000h,0b1h,081h,07eh,0c0h,0c0h,03fh,0ffh,0c1h,000h,0cbh,0c0h,000h,0fdh,082h,040h	; bb98  ...........~..?........@
	defb 0d6h,0d6h,069h,0d7h,0d5h,06ah,095h,0d5h,06ah,0afh,0afh,050h,06bh,06bh,094h,09fh,09fh,060h,0ffh,0efh,000h,0ffh,09fh,000h	; bbb0  ..i..j..j..Pkk...`......
	defb 0feh,073h,001h,0ffh,0fbh,001h,0ffh,04fh,001h,0deh,04eh,001h,0ffh,07fh,001h,0feh,04eh,000h,0dfh,04fh,001h,0ffh,03fh,000h	; bbc8  .s.....O..N.....N..O..?.
	defb 0c5h,0c0h,03eh,0fdh,0c0h,000h,0fdh,0beh,040h,0cfh,0cfh,030h,0ffh,0c3h,000h,0ffh,0ffh,000h,0ffh,0feh,000h,0ffh,0bdh,000h	; bbe0  ..>.....@..0............
	defb 0deh,05eh,000h,0fch,0e4h,000h,0ffh,0ffh,000h,081h,066h,0ffh,070h,080h,0ffh,07fh,0ffh,080h,0ffh,07fh,080h,0ffh,001h,080h	; bbf8  .^........f.p...........

; ----------------------------------------------------------------------
; DATOS dibujo_BC10: 10 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 12 de la lista 0xA34B (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4CB2 (240 bytes)
;   0xbc10..0xbd00  (240 bytes)
DATA_dibujo_BC10:
	defb 0fbh,0a2h,0e3h,0e1h,051h,041h,0e5h,059h,041h,0e1h,041h,041h,0f9h,05dh,041h,0e7h,07ah,063h,0deh,05eh,05eh,0c8h,0dch,05ch	; bc10  ....QA.YA.AA.]A.zc.^^..\
	defb 0a4h,01fh,006h,0bch,01fh,00eh,09dh,027h,00eh,096h,033h,01ch,095h,036h,01ch,09dh,03fh,019h,09fh,03dh,019h,01fh,02dh,009h	; bc28  .......'..3..6..?..=..-.
	defb 00bh,0ebh,0fbh,00bh,0ebh,0fbh,09bh,06bh,07bh,0dbh,0abh,03bh,01bh,0fbh,03bh,0fbh,0dbh,09bh,0fbh,0dbh,09bh,0f7h,0d7h,097h	; bc40  .......k{...............
	defb 0f7h,004h,047h,0c3h,0a2h,083h,0cbh,0b2h,083h,0c3h,082h,083h,0f3h,0bbh,083h,0cch,0f4h,0c4h,0bfh,0bch,0bch,0dbh,0bch,0bch	; bc58  ..G.....................
	defb 082h,0bch,0bch,000h,098h,018h,0c8h,0ffh,000h,071h,003h,000h,0ffh,07eh,07eh,091h,08bh,0fbh,081h,087h,0c7h,0ffh,081h,0ffh	; bc70  .........q...~~.........
	defb 07bh,09bh,0fbh,03bh,0dbh,0fbh,07bh,0bbh,03bh,05bh,07bh,05bh,0abh,0abh,02bh,0b3h,0b3h,033h,0b2h,072h,032h,0deh,0deh,09eh	; bc88  {.....{..[{[..+..3.r2...
	defb 0f3h,0a2h,0e3h,0e9h,051h,041h,0cdh,071h,041h,0c1h,041h,041h,0d1h,079h,041h,0ebh,072h,063h,0deh,05eh,05eh,0d8h,0dch,05ch	; bca0  ....QA.qA.AA.yA.rc.^^..\
	defb 0e7h,004h,047h,0d3h,0a2h,083h,0bbh,0c2h,083h,0e3h,0e2h,0e3h,0c3h,0e3h,083h,0a4h,0c4h,084h,0bfh,0bch,0bch,0fbh,0bch,0bch	; bcb8  ..G.....................
	defb 0c0h,0dch,05ch,0ebh,0ffh,001h,001h,0c3h,000h,07eh,0ffh,07eh,0c9h,081h,0f9h,019h,0bfh,0ffh,025h,07fh,0ffh,0dfh,0dfh,0ffh	; bcd0  ..\......~.~......%.....
	defb 0bch,0bch,0fch,0fch,07ch,0fch,0deh,05eh,0feh,0dch,04ch,0fch,0feh,06eh,0feh,0eeh,0eeh,0feh,06fh,0efh,0ffh,02bh,0ebh,0fbh	; bce8  ....|..^..L..n....o..+..

; ----------------------------------------------------------------------
; DATOS dibujo_BD00: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 0 de la lista 0xA38D (p00:4D92, p00:4DF5); lo leen p00:4C0C (8
;   bytes)
;   0xbd00..0xbd08  (8 bytes)
DATA_dibujo_BD00:
	defb 000h,048h,000h,002h,040h,000h,000h,008h	; bd00  .H..@...

; ----------------------------------------------------------------------
; DATOS dibujo_BD08: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 1 de la lista 0xA38D (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (32 bytes)
;   0xbd08..0xbd28  (32 bytes)
DATA_dibujo_BD08:
	defb 07fh,000h,02dh,002h,01fh,000h,00fh,000h,045h,002h,003h,000h,001h,000h,008h,000h	; bd08  ..-.....E.......
	defb 080h,000h,0c4h,000h,0e0h,000h,0f0h,040h,0f9h,000h,0f4h,008h,0feh,000h,0bfh,040h	; bd18  .......@.......@

; ----------------------------------------------------------------------
; DATOS tabla_colores_BD28: 1 punteros a colores de dibujo (los usa hasta el
;   indice 0; p00:4DA0); lo leen p00:4DA0 (2 bytes)
;   0xbd28..0xbd2a  (2 bytes)
DATA_tabla_colores_BD28:
	defw 0bd2ah	; bd28  -> DATA_colores_BD2A

; ----------------------------------------------------------------------
; DATOS colores_BD2A: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0xbd2a..0xbd2e  (4 bytes)
DATA_colores_BD2A:
	defb 003h,0cfh,07ah,0bdh	; bd2a

; ----------------------------------------------------------------------
; DATOS lista_BD2E: 2 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0xBD28); lo leen p00:4C26 (11 bytes)
;   0xbd2e..0xbd39  (11 bytes)
DATA_lista_BD2E:
	defb 048h,000h,060h,039h,0bdh	; bd2e
	defb 088h,000h,068h,0b9h,0bdh	; bd33
	defb 0ffh	; bd38

; ----------------------------------------------------------------------
; DATOS dibujo_BD39: 8 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 0 de la lista 0xBD2E (p00:4D92, p00:4DF5); lo leen p00:4C26
;   (128 bytes)
;   0xbd39..0xbdb9  (128 bytes)
DATA_dibujo_BD39:
	defb 013h,01dh,017h,019h,01bh,01dh,013h,01dh,00fh,003h,00fh,00bh,00fh,00fh,00fh,00bh	; bd39  ................
	defb 0d8h,0e0h,0c8h,0b8h,098h,068h,0a8h,058h,0f8h,088h,0d8h,0e8h,0d0h,0b0h,0b0h,0d0h	; bd49  .....h.X........
	defb 01fh,019h,01fh,019h,01fh,01fh,00fh,00fh,003h,003h,001h,001h,000h,000h,000h,000h	; bd59  ................
	defb 0f0h,090h,0d0h,0f0h,0f0h,0b0h,0f8h,098h,0d8h,0b8h,098h,0f8h,0f0h,0f0h,060h,060h	; bd69  ..............``
	defb 009h,006h,00bh,00ch,00eh,009h,00ah,00dh,009h,00eh,00dh,00bh,01fh,011h,01bh,015h	; bd79  ................
	defb 0f8h,0d8h,0f8h,088h,0c8h,0b8h,0d8h,0a8h,0e8h,098h,0f0h,090h,0f0h,0d0h,0f0h,0b0h	; bd89  ................
	defb 01fh,017h,017h,01bh,013h,01fh,01fh,013h,01fh,019h,00fh,00fh,007h,007h,000h,000h	; bd99  ................
	defb 0b0h,0d0h,0b8h,0d8h,0fch,0cch,0fch,0fch,0f8h,0f8h,0c0h,0c0h,000h,000h,000h,000h	; bda9  ................

; ----------------------------------------------------------------------
; DATOS dibujo_BDB9: 8 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 1 de la lista 0xBD2E (p00:4D92, p00:4DF5); lo leen p00:4C26
;   (192 bytes)
;   0xbdb9..0xbe79  (192 bytes)
DATA_dibujo_BDB9:
	defb 003h,003h,000h,007h,004h,003h,005h,004h,003h,00fh,00fh,000h,014h,01fh,003h,026h,03fh,001h,02fh,033h,000h,06bh,054h,000h	; bdb9  ...............&?./3.kT.
	defb 080h,080h,000h,0c0h,040h,080h,0e0h,020h,0c0h,0e0h,0a0h,040h,060h,0e0h,000h,0d8h,0f8h,000h,0dch,0a4h,000h,0ach,054h,000h	; bdd1  ....@.. ...@`.........T.
	defb 05dh,06ah,000h,07eh,07dh,000h,04eh,07fh,000h,05fh,07fh,020h,027h,03fh,008h,01fh,01bh,000h,01fh,013h,000h,017h,019h,000h	; bde9  ]j.~}.N.._. '?..........
	defb 04ch,0f4h,000h,0f4h,04ch,000h,07ch,0fch,000h,0c4h,0fch,030h,008h,0f8h,060h,0f0h,0f0h,000h,070h,0d0h,000h,0f0h,0c0h,000h	; be01  L...L.|....0..`...p.....
	defb 001h,001h,000h,003h,002h,001h,007h,004h,003h,007h,007h,000h,01eh,01fh,000h,023h,03fh,000h,049h,076h,000h,05ch,06bh,000h	; be19  ...............#?.Iv.\k.
	defb 0c0h,0c0h,000h,0e0h,020h,0c0h,060h,020h,0c0h,0e0h,0e0h,000h,020h,0e0h,0c0h,030h,0f0h,040h,0d8h,0e8h,000h,0c8h,038h,000h	; be31  .... .` .... ..0.@....8.
	defb 07bh,04ch,000h,07fh,05bh,000h,06fh,07fh,010h,040h,07fh,01eh,020h,03fh,002h,01fh,01fh,000h,017h,01fh,000h,013h,01dh,000h	; be49  {L..[.o..@.. ?..........
	defb 078h,098h,000h,0ffh,0ffh,000h,0ffh,0ffh,000h,0f8h,0f8h,000h,0c8h,0f8h,010h,0f0h,0f0h,000h,0f0h,0f0h,000h,0d0h,0b0h,000h	; be61  x.......................

; ----------------------------------------------------------------------
; DATOS restos_finales_BE79: 391 bytes al final del banco detras del ultimo
;   bloque que se lee (dibujo_BDB9): ningun lector del listado llega a ellos
;   ni los apunta ninguna tabla declarada
;   0xbe79..0xc000  (391 bytes)
DATA_restos_finales_BE79:
	defb 000h,0c0h,0ffh,084h,014h,018h,008h,004h,005h,000h,083h,002h,001h,001h,004h,000h	; be79  ................
	defb 002h,0a0h,093h,090h,050h,008h,008h,004h,000h,000h,004h,00ch,088h,088h,0f0h,040h	; be89  ....P..........@
	defb 040h,020h,030h,008h,00ch,004h,003h,002h,081h,003h,006h,001h,081h,002h,00ah,000h	; be99  @ 0.............
	defb 002h,080h,002h,040h,002h,000h,000h,02ah,029h,046h,084h,05fh,004h,0dfh,05fh,04eh	; bea9  ...@...*)F._.._N
	defb 064h,09fh,0e7h,0a9h,0f6h,046h,079h,0cfh,0e9h,08fh,09eh,044h,01eh,0deh,05eh,05eh	; beb9  d....Fy....D..^^
	defb 072h,0bfh,008h,068h,009h,07eh,01ch,02ah,049h,018h,008h,07fh,041h,014h,07fh,024h	; bec9  r..h.~.*I...A..$
	defb 018h,036h,020h,0feh,0ffh,0ffh,05dh,009h,000h,082h,028h,07fh,003h,0ffh,082h,03fh	; bed9  .6 ...]...(....?
	defb 01ah,009h,000h,082h,002h,0d0h,004h,0ffh,081h,04fh,008h,000h,083h,004h,03fh,07fh	; bee9  .........O....?.
	defb 003h,0ffh,082h,07fh,017h,008h,000h,082h,080h,05ch,005h,0ffh,081h,0e4h,005h,000h	; bef9  .........\......
	defb 000h,001h,004h,020h,0e0h,002h,004h,030h,0f0h,000h,000h,080h,0f8h,00dh,000h,002h	; bf09  ... ...0........
	defb 001h,00dh,000h,002h,080h,082h,0c0h,080h,00ch,000h,002h,001h,00ch,000h,081h,080h	; bf19  ................
	defb 003h,0c0h,002h,080h,000h,004h,034h,004h,02eh,002h,032h,0ffh,02ch,004h,026h,004h	; bf29  ......4...2.,.&.
	defb 030h,006h,02ah,008h,033h,004h,034h,004h,032h,004h,02ch,004h,034h,004h,026h,004h	; bf39  0.*.3.4.2.,.4.&.
	defb 030h,006h,030h,006h,02eh,002h,031h,006h,02ch,0ffh,029h,004h,02ah,004h,030h,006h	; bf49  0.0...1.,.).*.0.
	defb 032h,008h,033h,004h,034h,004h,032h,004h,02ch,004h,034h,004h,026h,004h,030h,006h	; bf59  2.3.4.2.,.4.&.0.
	defb 030h,006h,02eh,002h,031h,006h,02ch,0ffh,030h,006h,037h,004h,035h,004h,02eh,002h	; bf69  0...1.,.0.7.5...
	defb 028h,008h,028h,004h,032h,004h,030h,006h,033h,004h,032h,004h,035h,004h,02ah,0ffh	; bf79  (.(.2.0.3.2.5.*.
	defb 028h,004h,02dh,004h,026h,004h,034h,004h,026h,004h,028h,004h,036h,004h,02ah,004h	; bf89  (.-.&.4.&.(.6.*.
	defb 034h,008h,029h,004h,02ah,004h,035h,004h,02eh,002h,02ch,004h,031h,0ffh,028h,004h	; bf99  4.).*.5...,.1.(.
	defb 02dh,004h,026h,004h,034h,004h,026h,004h,028h,004h,036h,004h,02ah,004h,034h,008h	; bfa9  -.&.4.&.(.6.*.4.
	defb 035h,004h,037h,004h,033h,004h,033h,004h,032h,004h,034h,004h,036h,0ffh,02ch,004h	; bfb9  5.7.3.3.2.4.6.,.
	defb 026h,004h,030h,006h,02ah,008h,029h,004h,02ah,004h,035h,004h,02eh,002h,02ch,004h	; bfc9  &.0.*.).*.5...,.
	defb 031h,0ffh,030h,006h,02ah,004h,028h,004h,02dh,004h,026h,004h,031h,006h,02eh,002h	; bfd9  1.0.*.(.-.&.1...
	defb 028h,004h,026h,004h,02fh,008h,029h,004h,02ah,004h,035h,004h,02eh,002h,02ch,004h	; bfe9  (.&./.).*.5...,.
	defb 031h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bff9
