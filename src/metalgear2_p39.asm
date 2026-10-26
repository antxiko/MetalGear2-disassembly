; ==========================================================================
; METAL GEAR 2 SOLID SNAKE - Konami (1990) - MSX2 - MegaROM RC-767 de 512 KB (Konami SCC) - banco 39 (se ejecuta en 0xa000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x0a000


; ----------------------------------------------------------------------
; DATOS dibujo_9E9A_cola: 29 caracteres de 8x8 a 2 bits por punto (16 bytes
;   cada uno), ficha 7 de la lista 0x8217 (p00:4D92, p00:4DF5) (sigue del
;   banco 38); lo leen p00:4C0C (106 bytes)
;   0xa000..0xa06a  (106 bytes)
DATA_dibujo_9E9A_cola:
	defb 0fbh,0f3h,0fbh,0f3h,0ffh,0ffh,0fbh,0f3h,0ffh,0ffh,0feh,003h,002h,003h,002h,003h	; a000  ................
	defb 002h,003h,004h,006h,004h,006h,004h,006h,004h,006h,009h,00ch,009h,00ch,009h,00ch	; a010  ................
	defb 009h,00ch,0f3h,0f8h,0f3h,018h,013h,018h,033h,038h,027h,030h,027h,030h,027h,030h	; a020  ........38'0'0'0
	defb 027h,030h,04fh,060h,04fh,060h,04fh,060h,0cfh,0e0h,09fh,0c0h,09fh,0c0h,09fh,0c0h	; a030  '0O`O`O`........
	defb 09fh,0c0h,0bfh,000h,0bfh,000h,0bfh,000h,0bfh,000h,0fdh,009h,0fdh,009h,0fdh,009h	; a040  ................
	defb 0fdh,009h,009h,0f5h,009h,009h,0ffh,0ffh,001h,0fdh,0ffh,000h,0ffh,000h,000h,0ffh	; a050  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,0ffh,0ffh	; a060  ..........

; ----------------------------------------------------------------------
; DATOS dibujo_A06A: 8 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 8 de la lista 0x8217 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (128 bytes)
;   0xa06a..0xa0ea  (128 bytes)
DATA_dibujo_A06A:
	defb 07fh,080h,058h,0c0h,058h,0c0h,05fh,0c0h,05fh,0c0h,07fh,080h,05fh,0c0h,07fh,080h	; a06a  ..X.X._._..._...
	defb 0c0h,03fh,0ffh,000h,080h,000h,0ffh,000h,040h,0bfh,040h,0bfh,0bfh,0ffh,080h,0ffh	; a07a  .?......@.@.....
	defb 001h,002h,001h,002h,001h,000h,001h,002h,001h,002h,001h,002h,001h,002h,001h,002h	; a08a  ................
	defb 001h,002h,001h,002h,001h,002h,001h,002h,001h,002h,001h,002h,001h,002h,0ffh,000h	; a09a  ................
	defb 0a0h,000h,0c2h,040h,0c0h,040h,0ffh,000h,0c0h,07fh,0e0h,063h,0ffh,07fh,0ffh,07fh	; a0aa  ...@.@.....c....
	defb 081h,080h,081h,080h,081h,080h,0ffh,000h,001h,0feh,001h,0feh,0fdh,0fch,001h,0feh	; a0ba  ................
	defb 0ffh,0bfh,0c0h,080h,0c0h,080h,0c0h,080h,0e0h,040h,0e0h,040h,0e0h,040h,0e0h,040h	; a0ca  .........@.@.@.@
	defb 0aah,080h,0aah,080h,080h,080h,0ffh,000h,002h,0fdh,002h,0fdh,0fdh,0ffh,001h,0ffh	; a0da  ................

; ----------------------------------------------------------------------
; DATOS dibujo_A0EA: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 9 de la lista 0x8217 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (32 bytes)
;   0xa0ea..0xa10a  (32 bytes)
DATA_dibujo_A0EA:
	defb 004h,0ffh,004h,0ffh,004h,0ffh,004h,0ffh,004h,0ffh,004h,0ffh,0fbh,000h,0ffh,0ffh	; a0ea  ................
	defb 003h,003h,0ffh,0feh,0ffh,000h,0ffh,0ffh,0c3h,0c3h,000h,000h,0ffh,0ffh,045h,0ffh	; a0fa  ..............E.

; ----------------------------------------------------------------------
; DATOS dibujo_A10A: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 10 de la lista 0x8217 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (16 bytes)
;   0xa10a..0xa11a  (16 bytes)
DATA_dibujo_A10A:
	defb 0ffh,0ffh,000h,0ffh,07eh,081h,002h,081h,002h,081h,000h,0ffh,000h,0ffh,0ffh,000h	; a10a  ....~...........

; ----------------------------------------------------------------------
; DATOS dibujo_A11A: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 11 de la lista 0x8217 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (16 bytes)
;   0xa11a..0xa12a  (16 bytes)
DATA_dibujo_A11A:
	defb 000h,0ffh,07eh,081h,042h,0bdh,042h,0a5h,042h,0bdh,042h,0bdh,042h,0bdh,07eh,081h	; a11a  ..~.B.B.B.B.B.~.

; ----------------------------------------------------------------------
; DATOS dibujo_A12A: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 12 de la lista 0x8217 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (16 bytes)
;   0xa12a..0xa13a  (16 bytes)
DATA_dibujo_A12A:
	defb 0c0h,03fh,0c0h,03fh,0e2h,001h,0feh,001h,0c0h,03fh,0dbh,034h,0d8h,037h,0dbh,024h	; a12a  .?.?.....?.4.7.$

; ----------------------------------------------------------------------
; DATOS dibujo_A13A: 8 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 13 de la lista 0x8217 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (192 bytes)
;   0xa13a..0xa1fa  (192 bytes)
DATA_dibujo_A13A:
	defb 000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,000h,000h,081h,001h,000h,081h,001h,000h,0b8h,038h,000h,081h,001h,040h	; a13a  ...................8...@
	defb 000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,000h,000h,001h,000h,000h,001h,000h,000h,039h,038h,000h,001h,000h,002h	; a152  ..................98....
	defb 080h,07fh,000h,07fh,000h,080h,000h,000h,0ffh,0ffh,000h,000h,000h,0ffh,000h,078h,0b7h,000h,0ffh,000h,086h,0ffh,000h,0fch	; a16a  ...............x........
	defb 000h,000h,0ffh,05eh,05eh,0a1h,000h,000h,0ffh,0ffh,000h,000h,000h,0ffh,000h,07fh,080h,000h,0ffh,02ah,080h,0ffh,000h,080h	; a182  ...^^..............*....
	defb 0f5h,02ah,08ah,0ffh,000h,080h,0d7h,02ah,0a8h,0ffh,000h,080h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,000h,0ffh,0ffh	; a19a  .*.....*................
	defb 0ffh,000h,000h,0f2h,0edh,0edh,0ffh,000h,000h,0e0h,0dfh,0dfh,0ffh,000h,000h,0ffh,0ffh,000h,0ffh,000h,000h,0ffh,000h,000h	; a1b2  ........................
	defb 0fdh,000h,0feh,0fdh,000h,0feh,005h,0f8h,0feh,001h,000h,0feh,001h,000h,0feh,001h,000h,0feh,001h,000h,0feh,001h,000h,0feh	; a1ca  ........................
	defb 0f7h,008h,0f7h,0f7h,008h,0f7h,0f7h,008h,0f7h,0f7h,008h,0f7h,008h,0f7h,0ffh,008h,000h,0f7h,0ffh,000h,000h,000h,0ffh,0ffh	; a1e2  ........................

; ----------------------------------------------------------------------
; DATOS lista_A1FA: 27 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x0000); lo leen p00:4C0C, p00:4C26 (136 bytes)
;   0xa1fa..0xa282  (136 bytes)
DATA_lista_A1FA:
	defb 045h,000h,001h,0feh,0a3h	; a1fa
	defb 041h,000h,009h,04eh,0a4h	; a1ff
	defb 08dh,001h,00ah,05eh,0a4h	; a204
	defb 084h,001h,01bh,096h,0a5h	; a209
	defb 04eh,001h,01fh,0f6h,0a5h	; a20e
	defb 081h,001h,02dh,0d6h,0a6h	; a213
	defb 042h,00eh,02eh,0eeh,0a6h	; a218
	defb 042h,002h,030h,00eh,0a7h	; a21d
	defb 09ch,001h,032h,02eh,0a7h	; a222
	defb 041h,00eh,04eh,0ceh,0a9h	; a227
	defb 081h,001h,04fh,0deh,0a9h	; a22c
	defb 042h,017h,050h,0f6h,0a9h	; a231
	defb 042h,00dh,052h,016h,0aah	; a236
	defb 084h,004h,054h,036h,0aah	; a23b
	defb 043h,004h,058h,096h,0aah	; a240
	defb 084h,004h,05dh,0c6h,0aah	; a245
	defb 001h,00ah,061h,026h,0abh	; a24a
	defb 041h,00ah,062h,02eh,0abh	; a24f
	defb 041h,00bh,063h,03eh,0abh	; a254
	defb 083h,00bh,064h,04eh,0abh	; a259
	defb 041h,005h,067h,096h,0abh	; a25e
	defb 082h,00ch,068h,0a6h,0abh	; a263
	defb 086h,000h,06ah,0d6h,0abh	; a268
	defb 042h,001h,018h,066h,0ach	; a26d
	defb 081h,010h,01ah,086h,0ach	; a272
	defb 086h,002h,079h,09eh,0ach	; a277
	defb 082h,001h,05bh,02eh,0adh	; a27c
	defb 0ffh	; a281

; ----------------------------------------------------------------------
; DATOS lista_A282: 12 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x0000); lo leen p00:4C0C (61 bytes)
;   0xa282..0xa2bf  (61 bytes)
DATA_lista_A282:
	defb 047h,001h,081h,05eh,0adh	; a282
	defb 001h,000h,090h,0ceh,0adh	; a287
	defb 054h,001h,091h,0d6h,0adh	; a28c
	defb 092h,00dh,0a5h,016h,0afh	; a291
	defb 041h,006h,0b7h,0c6h,0b0h	; a296
	defb 084h,00dh,0b8h,0d6h,0b0h	; a29b
	defb 041h,007h,0bch,036h,0b1h	; a2a0
	defb 083h,00dh,0bdh,046h,0b1h	; a2a5
	defb 051h,001h,0c0h,08eh,0b1h	; a2aa
	defb 045h,004h,0d1h,09eh,0b2h	; a2af
	defb 055h,001h,0e5h,0eeh,0b2h	; a2b4
	defb 045h,004h,0fah,03eh,0b4h	; a2b9
	defb 0ffh	; a2be

; ----------------------------------------------------------------------
; DATOS lista_A2BF: 14 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x0000); lo leen p00:4C0C (71 bytes)
;   0xa2bf..0xa306  (71 bytes)
DATA_lista_A2BF:
	defb 051h,001h,040h,08eh,0b4h	; a2bf
	defb 044h,00fh,051h,09eh,0b5h	; a2c4
	defb 081h,00fh,055h,0deh,0b5h	; a2c9
	defb 056h,001h,065h,0f6h,0b5h	; a2ce
	defb 044h,00fh,07bh,056h,0b7h	; a2d3
	defb 081h,00fh,07fh,096h,0b7h	; a2d8
	defb 047h,001h,001h,05eh,0adh	; a2dd
	defb 001h,000h,010h,0ceh,0adh	; a2e2
	defb 054h,001h,011h,0d6h,0adh	; a2e7
	defb 092h,00dh,025h,016h,0afh	; a2ec
	defb 041h,006h,037h,0c6h,0b0h	; a2f1
	defb 084h,00dh,038h,0d6h,0b0h	; a2f6
	defb 041h,007h,03ch,036h,0b1h	; a2fb
	defb 083h,00dh,03dh,046h,0b1h	; a300
	defb 0ffh	; a305

; ----------------------------------------------------------------------
; DATOS lista_A306: 13 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x0000); lo leen p00:4C0C (66 bytes)
;   0xa306..0xa348  (66 bytes)
DATA_lista_A306:
	defb 056h,001h,081h,0aeh,0b7h	; a306
	defb 041h,008h,097h,00eh,0b9h	; a30b
	defb 081h,001h,098h,01eh,0b9h	; a310
	defb 041h,001h,099h,036h,0b9h	; a315
	defb 001h,005h,0a0h,046h,0b9h	; a31a
	defb 006h,017h,0a1h,04eh,0b9h	; a31f
	defb 048h,004h,0a7h,07eh,0b9h	; a324
	defb 083h,001h,0b0h,0feh,0b9h	; a329
	defb 044h,00eh,0c0h,046h,0bah	; a32e
	defb 086h,010h,0c4h,086h,0bah	; a333
	defb 090h,00dh,0d0h,016h,0bbh	; a338
	defb 055h,001h,0e5h,0eeh,0b2h	; a33d
	defb 045h,004h,0fah,03eh,0b4h	; a342
	defb 0ffh	; a347

; ----------------------------------------------------------------------
; DATOS lista_A348: 35 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x0000); lo leen p00:4C0C (176 bytes)
;   0xa348..0xa3f8  (176 bytes)
DATA_lista_A348:
	defb 006h,017h,020h,096h,0bch	; a348
	defb 042h,004h,026h,0c6h,0bch	; a34d
	defb 041h,009h,028h,0e6h,0bch	; a352
	defb 042h,013h,029h,0f6h,0bch	; a357
	defb 042h,008h,02bh,016h,0bdh	; a35c
	defb 085h,001h,030h,036h,0bdh	; a361
	defb 056h,001h,001h,0aeh,0b7h	; a366
	defb 041h,008h,017h,00eh,0b9h	; a36b
	defb 081h,001h,018h,01eh,0b9h	; a370
	defb 041h,001h,019h,036h,0b9h	; a375
	defb 056h,001h,065h,0f6h,0b5h	; a37a
	defb 044h,00fh,07bh,056h,0b7h	; a37f
	defb 081h,00fh,07fh,096h,0b7h	; a384
	defb 044h,00eh,040h,046h,0bah	; a389
	defb 086h,010h,044h,086h,0bah	; a38e
	defb 090h,00dh,050h,016h,0bbh	; a393
	defb 081h,001h,0e2h,0aeh,0bdh	; a398
	defb 044h,008h,081h,0c6h,0bdh	; a39d
	defb 042h,001h,085h,006h,0beh	; a3a2
	defb 001h,000h,090h,0ceh,0adh	; a3a7
	defb 054h,001h,091h,0d6h,0adh	; a3ac
	defb 092h,00dh,0a5h,016h,0afh	; a3b1
	defb 041h,006h,0b7h,0c6h,0b0h	; a3b6
	defb 084h,00dh,0b8h,0d6h,0b0h	; a3bb
	defb 041h,007h,0bch,036h,0b1h	; a3c0
	defb 083h,00dh,0bdh,046h,0b1h	; a3c5
	defb 051h,001h,0c0h,08eh,0b4h	; a3ca
	defb 044h,00fh,0d1h,09eh,0b5h	; a3cf
	defb 081h,00fh,0d5h,0deh,0b5h	; a3d4
	defb 056h,001h,0e5h,0f6h,0b5h	; a3d9
	defb 044h,00fh,0fbh,056h,0b7h	; a3de
	defb 081h,00fh,0ffh,096h,0b7h	; a3e3
	defb 044h,00eh,0d6h,046h,0bah	; a3e8
	defb 086h,010h,0dah,086h,0bah	; a3ed
	defb 042h,008h,0e0h,016h,0bdh	; a3f2
	defb 0ffh	; a3f7

; ----------------------------------------------------------------------
; DATOS lista_A3F8: 1 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x62D1); lo leen p00:4C26 (6 bytes)
;   0xa3f8..0xa3fe  (6 bytes)
DATA_lista_A3F8:
	defb 086h,042h,0eah,09eh,0ach	; a3f8
	defb 0ffh	; a3fd

; ----------------------------------------------------------------------
; DATOS dibujo_A3FE: 5 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 0 de la lista 0xA1FA (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (80 bytes)
;   0xa3fe..0xa44e  (80 bytes)
DATA_dibujo_A3FE:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ddh,099h,0ffh,0ffh,0ddh,099h,0ddh,099h,0ffh,0ffh	; a3fe  ................
	defb 0ddh,099h,0cch,000h,0ddh,099h,0ddh,099h,0ddh,099h,0ddh,099h,0ddh,099h,0ddh,099h	; a40e  ................
	defb 0bbh,0bbh,055h,011h,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh	; a41e  ..U.............
	defb 0b9h,0b9h,0b0h,030h,0f9h,0b9h,0d9h,099h,0d9h,099h,0d9h,099h,0ddh,099h,0ddh,099h	; a42e  ...0............
	defb 0ddh,099h,00ch,000h,09dh,099h,0bdh,0b9h,0bdh,0b9h,0b9h,0b9h,0bbh,0bbh,0bbh,0bbh	; a43e  ................

; ----------------------------------------------------------------------
; DATOS dibujo_A44E: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 1 de la lista 0xA1FA (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (16 bytes)
;   0xa44e..0xa45e  (16 bytes)
DATA_dibujo_A44E:
	defb 0ffh,0ffh,0ffh,07fh,0ffh,0bfh,0ddh,099h,0dfh,09fh,0ddh,099h,0ddh,099h,0ddh,099h	; a44e  ................

; ----------------------------------------------------------------------
; DATOS dibujo_A45E: 13 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 2 de la lista 0xA1FA (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (312 bytes)
;   0xa45e..0xa596  (312 bytes)
DATA_dibujo_A45E:
	defb 0ddh,099h,000h,0cch,000h,000h,0ddh,099h,000h,099h,0bbh,066h,099h,0bbh,066h,099h,0bbh,066h,09dh,0b9h,060h,09dh,0b9h,060h	; a45e  ...........f..f..f..`..`
	defb 0ddh,099h,000h,0cch,000h,000h,0ddh,099h,000h,099h,0bbh,066h,099h,0bbh,066h,099h,0bbh,066h,0d9h,09bh,006h,0d9h,09bh,006h	; a476  ...........f..f..f......
	defb 0ddh,099h,000h,0cch,000h,000h,0ddh,099h,000h,0d9h,09bh,006h,0d9h,09bh,006h,0d9h,09bh,006h,0d9h,09bh,006h,0d9h,09bh,006h	; a48e  ........................
	defb 0ddh,099h,000h,0cch,000h,000h,0ddh,099h,000h,09dh,0b9h,060h,09dh,0b9h,060h,09dh,0b9h,060h,09dh,0b9h,060h,09dh,0b9h,060h	; a4a6  ...........`..`..`..`..`
	defb 09dh,0b9h,060h,08ch,020h,060h,09dh,0b9h,060h,09dh,0b9h,060h,09dh,0b9h,060h,09dh,0b9h,060h,09dh,0b9h,060h,09dh,0b9h,060h	; a4be  ..`. `..`..`..`..`..`..`
	defb 0d9h,09bh,006h,0c0h,002h,006h,0d9h,09bh,006h,0d9h,09bh,006h,0d9h,09bh,006h,0d9h,09bh,006h,0d9h,09bh,006h,0d9h,09bh,006h	; a4d6  ........................
	defb 0ddh,099h,000h,0cch,000h,000h,0ddh,099h,000h,099h,0bbh,066h,099h,0bbh,066h,099h,0bbh,066h,0ddh,099h,000h,0ddh,099h,000h	; a4ee  ...........f..f..f......
	defb 09dh,0b9h,060h,08ch,020h,060h,09dh,0b9h,060h,09dh,0b9h,060h,09dh,0b9h,060h,09dh,0b9h,060h,0ddh,099h,000h,0ddh,099h,000h	; a506  ..`. `..`..`..`..`......
	defb 0d9h,09bh,006h,0c0h,002h,006h,0d9h,09bh,006h,0d9h,09bh,006h,0d9h,09bh,006h,0d9h,09bh,006h,0ddh,099h,000h,0ddh,099h,000h	; a51e  ........................
	defb 0bbh,0bbh,000h,011h,011h,000h,0bbh,0bbh,000h,0bbh,0ddh,066h,0bbh,0ddh,066h,0bbh,0ddh,066h,0bbh,0bbh,000h,0bbh,0bbh,000h	; a536  ...........f..f..f......
	defb 0bbh,0dbh,060h,033h,053h,060h,0bbh,0dbh,060h,0bbh,0dbh,060h,0bbh,0dbh,060h,0bbh,0dbh,060h,0bbh,0dbh,060h,0bbh,0dbh,060h	; a54e  ..`3S`..`..`..`..`..`..`
	defb 0d9h,09bh,006h,0c8h,002h,006h,0d9h,09bh,006h,099h,0bbh,066h,099h,0bbh,066h,099h,0bbh,066h,0ddh,099h,000h,0ddh,099h,000h	; a566  ...........f..f..f......
	defb 09dh,0b9h,060h,08ch,020h,060h,09dh,0b9h,060h,099h,0bbh,066h,099h,0bbh,066h,099h,0bbh,066h,0ddh,099h,000h,0ddh,099h,000h	; a57e  ..`. `..`..f..f..f......

; ----------------------------------------------------------------------
; DATOS dibujo_A596: 4 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 3 de la lista 0xA1FA (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (96 bytes)
;   0xa596..0xa5f6  (96 bytes)
DATA_dibujo_A596:
	defb 0f5h,0f7h,004h,0f5h,0f7h,004h,0f5h,0f7h,004h,0d5h,097h,004h,0f5h,0f7h,004h,0d5h,097h,004h,0d5h,097h,004h,0f5h,0f7h,004h	; a596  ........................
	defb 0d7h,097h,007h,0c4h,007h,004h,0d3h,094h,000h,0d9h,099h,000h,0d9h,099h,000h,0dfh,099h,000h,0dfh,099h,000h,0dbh,09dh,000h	; a5ae  ........................
	defb 0d8h,09fh,000h,0cfh,00fh,000h,0dfh,09fh,000h,0dfh,09bh,000h,0dfh,09bh,000h,0dfh,09ah,002h,0d8h,099h,000h,0d9h,099h,000h	; a5c6  ........................
	defb 0dbh,0fbh,0c0h,015h,0f1h,000h,0fbh,01bh,000h,0fbh,0fbh,000h,0dbh,09bh,000h,0dbh,09bh,000h,0dbh,09bh,000h,09bh,0dbh,000h	; a5de  ........................

; ----------------------------------------------------------------------
; DATOS dibujo_A5F6: 14 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 4 de la lista 0xA1FA (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (224 bytes)
;   0xa5f6..0xa6d6  (224 bytes)
DATA_dibujo_A5F6:
	defb 03bh,0dbh,0f5h,0f1h,0fbh,0dbh,0fbh,0dbh,0fbh,0dbh,0fbh,01bh,01bh,09bh,09bh,09bh	; a5f6  ................
	defb 000h,0ffh,0ffh,0ffh,0ffh,0ffh,099h,099h,0ffh,0ffh,0ffh,000h,000h,040h,040h,040h	; a606  .............@@@
	defb 000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ddh,099h,0ffh,0ffh,0ffh,000h,000h,040h,040h,040h	; a616  .............@@@
	defb 000h,0ffh,0ffh,0ffh,0fbh,0fdh,0dbh,09dh,0fdh,0f9h,0ffh,000h,000h,044h,044h,044h	; a626  .............DDD
	defb 000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ddh,099h,0ffh,0ffh,0ffh,000h,000h,000h,000h,000h	; a636  ................
	defb 000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,000h,000h,000h	; a646  ................
	defb 008h,0f4h,0f9h,0fdh,0f9h,0fdh,0f9h,0fdh,0f9h,0fdh,0f9h,004h,000h,044h,040h,044h	; a656  .............D@D
	defb 000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,040h,040h,040h	; a666  .............@@@
	defb 001h,0fdh,0ffh,0ffh,0ffh,0ffh,0ffh,0fdh,0ffh,0fdh,0ffh,001h,001h,009h,009h,009h	; a676  ................
	defb 0f8h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fbh,0ffh,0fbh,0ffh,0f8h,0f8h,0f9h,0f9h,0f9h	; a686  ................
	defb 03fh,0dfh,0ffh,0ffh,0ffh,0dfh,0ffh,0dfh,0ffh,0dfh,0ffh,01fh,01fh,09fh,09fh,09fh	; a696  ?...............
	defb 080h,0ffh,0ffh,0ffh,0ffh,0ffh,0fdh,0b9h,0ffh,0bfh,0ffh,080h,080h,090h,090h,090h	; a6a6  ................
	defb 003h,0ffh,0ffh,0ffh,0ffh,0ffh,0dfh,09fh,0ffh,0ffh,0ffh,003h,003h,013h,013h,013h	; a6b6  ................
	defb 0d7h,09bh,037h,03bh,0b7h,0bbh,0b7h,0bbh,0b7h,0bbh,0b7h,0bbh,0b7h,0bbh,0b7h,0bbh	; a6c6  ..7.............

; ----------------------------------------------------------------------
; DATOS dibujo_A6D6: 1 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 5 de la lista 0xA1FA (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (24 bytes)
;   0xa6d6..0xa6ee  (24 bytes)
DATA_dibujo_A6D6:
	defb 0d5h,097h,004h,0c5h,007h,004h,0d5h,097h,004h,0d5h,097h,004h,0d5h,097h,004h,0d5h,097h,004h,0d5h,097h,004h,0d5h,097h,004h	; a6d6  ........................

; ----------------------------------------------------------------------
; DATOS dibujo_A6EE: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 6 de la lista 0xA1FA (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (32 bytes)
;   0xa6ee..0xa70e  (32 bytes)
DATA_dibujo_A6EE:
	defb 000h,0ffh,0ffh,000h,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; a6ee  ................
	defb 03fh,0dfh,0bfh,05fh,03fh,05fh,0bfh,0dfh,0bfh,0dfh,0bfh,0dfh,0bfh,0dfh,0bfh,0dfh	; a6fe  ?.._?_..........

; ----------------------------------------------------------------------
; DATOS dibujo_A70E: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 7 de la lista 0xA1FA (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (32 bytes)
;   0xa70e..0xa72e  (32 bytes)
DATA_dibujo_A70E:
	defb 03fh,05fh,03fh,05fh,03fh,05fh,03fh,05fh,03fh,05fh,03fh,05fh,03fh,05fh,03fh,05fh	; a70e  ?_?_?_?_?_?_?_?_
	defb 0f3h,0f5h,0f3h,0f5h,0f3h,0f5h,0f3h,0f5h,0f3h,0f5h,0f3h,0f5h,0f3h,0f5h,0f3h,0f5h	; a71e  ................

; ----------------------------------------------------------------------
; DATOS dibujo_A72E: 28 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 8 de la lista 0xA1FA (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (672 bytes)
;   0xa72e..0xa9ce  (672 bytes)
DATA_dibujo_A72E:
	defb 05bh,07bh,040h,055h,071h,040h,05bh,07bh,040h,05bh,07bh,040h,05bh,07bh,040h,05bh,07bh,040h,05bh,07bh,040h,05bh,07bh,040h	; a72e  [{@Uq@[{@[{@[{@[{@[{@[{@
	defb 07fh,07fh,07fh,040h,07fh,040h,05fh,060h,040h,05fh,07fh,040h,05eh,07ah,040h,05eh,07ah,040h,05eh,07ah,040h,05fh,07fh,040h	; a746  ...@.@_`@_.@^z@^z@^z@_.@
	defb 0ffh,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,000h,0ffh,0ffh,000h,0ddh,099h,000h,0ddh,099h,000h,0ddh,099h,000h,0ffh,0ffh,000h	; a75e  ........................
	defb 0ffh,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,000h,0f9h,0f9h,000h,0dbh,09dh,000h,0dbh,09dh,000h,0dbh,09dh,000h,0ffh,0f9h,000h	; a776  ........................
	defb 0fdh,0ffh,0fch,005h,0ffh,004h,0fdh,007h,004h,0f5h,0f7h,004h,0d5h,097h,004h,0d5h,097h,004h,0d5h,097h,004h,0f5h,0f7h,004h	; a78e  ........................
	defb 058h,077h,040h,05fh,07fh,040h,05fh,07fh,040h,05eh,07ah,040h,05fh,07fh,040h,05fh,070h,040h,050h,074h,040h,054h,074h,040h	; a7a6  Xw@_.@_.@^z@_.@_p@Pt@Tt@
	defb 005h,0f7h,004h,0f5h,0f7h,004h,0f5h,0f7h,004h,0d5h,097h,004h,0f5h,0f7h,004h,0e5h,007h,004h,005h,007h,004h,005h,007h,004h	; a7be  ........................
	defb 0ffh,0ffh,07fh,0c0h,0ffh,040h,0bfh,0c0h,000h,09fh,09fh,000h,09fh,09fh,000h,0bfh,0dfh,000h,0bfh,0dfh,000h,0ffh,0dfh,040h	; a7d6  .....@.................@
	defb 0ffh,0ffh,0ffh,004h,0f5h,004h,0f1h,004h,000h,0f9h,0fdh,000h,0f9h,0fdh,000h,0f9h,0fdh,000h,0f9h,0fdh,000h,0f9h,0fdh,000h	; a7ee  ........................
	defb 0fdh,0ffh,0fch,001h,0ffh,000h,0ffh,001h,000h,0ffh,0ffh,000h,0fdh,0f9h,000h,0fdh,0f9h,000h,0fdh,0f9h,000h,0f9h,0fdh,000h	; a806  ........................
	defb 0c0h,0ffh,040h,0ffh,0ffh,000h,0ffh,0ffh,000h,09fh,0dfh,000h,09fh,0dfh,000h,0ffh,0c0h,040h,0c0h,090h,000h,0d0h,090h,000h	; a81e  ..@..............@......
	defb 0f7h,0f7h,007h,0f4h,0f7h,004h,0f5h,0f6h,004h,0f5h,0f7h,004h,0f5h,0f7h,004h,0f5h,0f7h,004h,0f5h,0f7h,004h,0f5h,0f7h,004h	; a836  ........................
	defb 0f7h,0f7h,007h,0f4h,0f7h,004h,0f3h,0f4h,000h,0f9h,0f9h,000h,0f9h,0f9h,000h,0ffh,0f9h,000h,0ffh,0f9h,000h,0fbh,0fdh,000h	; a84e  ........................
	defb 0dfh,0ffh,0c0h,01fh,0ffh,000h,0ffh,01fh,000h,0ffh,0ffh,000h,0dfh,09fh,000h,0dfh,09fh,000h,0dfh,09fh,000h,09fh,0dfh,000h	; a866  ........................
	defb 05bh,01fh,008h,0dbh,01fh,008h,05bh,01fh,008h,05bh,01fh,008h,0dbh,09fh,008h,0dbh,09fh,008h,0dbh,09fh,008h,0dbh,09fh,008h	; a87e  [.....[..[..............
	defb 05bh,07bh,050h,055h,061h,040h,05bh,07bh,040h,05bh,07bh,040h,05bh,07bh,040h,05bh,07bh,040h,05bh,07bh,040h,05bh,07bh,040h	; a896  [{PUa@[{@[{@[{@[{@[{@[{@
	defb 05bh,01fh,018h,0cbh,01fh,008h,05bh,01fh,008h,05bh,01fh,008h,0dbh,09fh,008h,0dbh,09fh,008h,0dbh,09fh,008h,0dbh,09fh,008h	; a8ae  [.....[..[..............
	defb 0ffh,0ffh,07fh,0c0h,0ffh,040h,0bfh,0c0h,000h,09fh,09fh,000h,09bh,09bh,000h,0fbh,09bh,000h,0fbh,09bh,000h,0bfh,0dfh,000h	; a8c6  .....@..................
	defb 0fbh,0ffh,0f8h,003h,0ffh,000h,0ffh,003h,000h,0ffh,0ffh,000h,0dfh,09bh,000h,0dfh,09bh,000h,0dfh,09bh,000h,0fbh,0ffh,000h	; a8de  ........................
	defb 0b7h,0bbh,000h,037h,03bh,000h,0b7h,0bbh,000h,0b7h,0bbh,000h,0dbh,09fh,008h,0dbh,09fh,008h,0dbh,09fh,008h,0dbh,09fh,008h	; a8f6  ...7....................
	defb 07fh,07fh,07fh,040h,07fh,040h,05fh,060h,040h,05fh,07fh,040h,05ch,07eh,042h,05ch,07eh,042h,05eh,07ch,040h,05fh,07fh,040h	; a90e  ...@.@_`@_.@\~B\~B^|@_.@
	defb 0ffh,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,000h,0ffh,0ffh,000h,099h,0ddh,044h,099h,0ddh,044h,0ddh,099h,000h,0ffh,0ffh,000h	; a926  ..............D..D......
	defb 0ffh,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,000h,0f9h,0f9h,000h,09bh,0ddh,040h,09bh,0ddh,040h,0dbh,09dh,000h,0ffh,0f9h,000h	; a93e  ..............@..@......
	defb 0fdh,0ffh,0fch,005h,0ffh,004h,0fdh,007h,004h,0fdh,0ffh,004h,09dh,0dfh,044h,09dh,0dfh,044h,0ddh,09fh,004h,0fdh,0ffh,004h	; a956  ..............D..D......
	defb 0ffh,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,000h,0ffh,0ffh,000h,0bbh,0bbh,000h,0bbh,0bbh,000h,0bbh,0bbh,000h,0ffh,0ffh,000h	; a96e  ........................
	defb 0fch,0ffh,004h,0ffh,0ffh,000h,0ffh,0ffh,000h,0ffh,0fbh,000h,0fbh,0ffh,000h,0ffh,0fch,004h,0f8h,0f9h,000h,0f9h,0f9h,000h	; a986  ........................
	defb 0fdh,0ffh,0fch,005h,0ffh,004h,0fdh,007h,004h,0f5h,0f7h,004h,0f5h,0f7h,004h,0f5h,0f7h,004h,0f5h,0f7h,004h,0f5h,0f7h,004h	; a99e  ........................
	defb 005h,0f7h,004h,0f5h,0f7h,004h,0f5h,0f7h,004h,0f5h,0f7h,004h,0f5h,0f7h,004h,0f5h,007h,004h,005h,047h,004h,045h,047h,004h	; a9b6  ...................G.EG.

; ----------------------------------------------------------------------
; DATOS dibujo_A9CE: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 9 de la lista 0xA1FA (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (16 bytes)
;   0xa9ce..0xa9de  (16 bytes)
DATA_dibujo_A9CE:
	defb 000h,07fh,03fh,040h,020h,040h,03fh,05fh,03fh,05fh,03fh,05fh,03fh,05fh,03fh,05fh	; a9ce  ..?@ @?_?_?_?_?_

; ----------------------------------------------------------------------
; DATOS dibujo_A9DE: 1 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 10 de la lista 0xA1FA (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (24 bytes)
;   0xa9de..0xa9f6  (24 bytes)
DATA_dibujo_A9DE:
	defb 0c0h,07fh,040h,0dfh,07fh,040h,0dfh,07fh,040h,0dfh,07fh,040h,0dfh,07fh,040h,0dfh,060h,040h,0c0h,060h,040h,0c0h,060h,040h	; a9de  ..@..@..@..@..@.`@.`@.`@

; ----------------------------------------------------------------------
; DATOS dibujo_A9F6: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 11 de la lista 0xA1FA (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (32 bytes)
;   0xa9f6..0xaa16  (32 bytes)
DATA_dibujo_A9F6:
	defb 07fh,07fh,07fh,07fh,07fh,07ch,07ch,07fh,07fh,07fh,07fh,07fh,07fh,07fh,0ffh,000h	; a9f6  .....||.........
	defb 0ffh,0feh,0ffh,0feh,0ffh,07eh,07fh,0feh,0ffh,0feh,0ffh,0feh,0ffh,0feh,0ffh,000h	; aa06  .....~..........

; ----------------------------------------------------------------------
; DATOS dibujo_AA16: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 12 de la lista 0xA1FA (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (32 bytes)
;   0xaa16..0xaa36  (32 bytes)
DATA_dibujo_AA16:
	defb 07fh,000h,000h,07fh,000h,000h,0ffh,0ffh,0aah,0aah,080h,080h,080h,080h,0ffh,0ffh	; aa16  ................
	defb 0fch,000h,000h,0fch,001h,001h,0ffh,0ffh,0aah,0aah,002h,002h,002h,002h,0ffh,0ffh	; aa26  ................

; ----------------------------------------------------------------------
; DATOS dibujo_AA36: 4 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 13 de la lista 0xA1FA (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (96 bytes)
;   0xaa36..0xaa96  (96 bytes)
DATA_dibujo_AA36:
	defb 0ffh,037h,0feh,080h,07eh,083h,080h,0feh,083h,080h,07eh,083h,080h,0feh,083h,080h,0feh,083h,080h,0feh,083h,080h,0feh,083h	; aa36  .7..~.....~.............
	defb 0ffh,07fh,0feh,001h,0ffh,080h,001h,0ffh,080h,001h,0c7h,0b8h,001h,0ffh,080h,001h,0d7h,0a8h,001h,0d7h,0a8h,001h,0ffh,080h	; aa4e  ........................
	defb 080h,0feh,083h,080h,0feh,083h,080h,0feh,083h,080h,0feh,083h,080h,0feh,083h,080h,0feh,083h,080h,0feh,083h,002h,000h,0fdh	; aa66  ........................
	defb 001h,0ffh,080h,001h,0ffh,080h,001h,0ffh,080h,001h,0ffh,080h,001h,0ffh,080h,001h,0ffh,080h,001h,0ffh,080h,081h,001h,07eh	; aa7e  .......................~

; ----------------------------------------------------------------------
; DATOS dibujo_AA96: 3 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 14 de la lista 0xA1FA (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (48 bytes)
;   0xaa96..0xaac6  (48 bytes)
DATA_dibujo_AA96:
	defb 0ffh,0ffh,00fh,0ffh,01eh,0ffh,03ch,0ffh,078h,0ffh,0ffh,000h,000h,000h,0ffh,0ffh	; aa96  ......<.x.......
	defb 0ffh,0ffh,01fh,0ffh,01fh,0ffh,03fh,0ffh,07fh,0ffh,0ffh,01fh,01fh,01fh,0ffh,0ffh	; aaa6  ......?.........
	defb 0ffh,0ffh,00fh,0ffh,01fh,0ffh,03fh,0ffh,07bh,0ffh,0ffh,003h,003h,003h,0ffh,0ffh	; aab6  ......?.{.......

; ----------------------------------------------------------------------
; DATOS dibujo_AAC6: 4 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 15 de la lista 0xA1FA (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (96 bytes)
;   0xaac6..0xab26  (96 bytes)
DATA_dibujo_AAC6:
	defb 0ffh,0ffh,000h,0fbh,0ffh,004h,0fah,0ffh,004h,0f8h,0ffh,004h,0fch,0ffh,004h,0ffh,0f8h,000h,0f8h,0f8h,000h,0ffh,0ffh,000h	; aac6  ........................
	defb 0ffh,0ffh,000h,040h,0ffh,03fh,040h,0ffh,03fh,07fh,0ffh,000h,078h,0ffh,000h,0ffh,000h,000h,000h,000h,000h,0ffh,0ffh,000h	; aade  ...@.?@.?...x...........
	defb 0ffh,0ffh,000h,003h,0ffh,0fch,002h,0ffh,0fch,0feh,0ffh,000h,078h,0ffh,000h,0ffh,000h,000h,000h,000h,000h,0ffh,0ffh,000h	; aaf6  ............x...........
	defb 0ffh,0ffh,000h,0cfh,0ffh,040h,0deh,0ffh,040h,0fch,0ffh,040h,0b8h,0ffh,040h,0ffh,080h,000h,080h,080h,000h,0ffh,0ffh,000h	; ab0e  .....@..@..@..@.........

; ----------------------------------------------------------------------
; DATOS dibujo_AB26: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 16 de la lista 0xA1FA (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (8 bytes)
;   0xab26..0xab2e  (8 bytes)
DATA_dibujo_AB26:
	defb 087h,0c3h,0e1h,0f0h,078h,03ch,01eh,00fh	; ab26  ....x<..

; ----------------------------------------------------------------------
; DATOS dibujo_AB2E: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 17 de la lista 0xA1FA (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (16 bytes)
;   0xab2e..0xab3e  (16 bytes)
DATA_dibujo_AB2E:
	defb 087h,0ffh,0c3h,000h,0e1h,000h,0f0h,000h,078h,000h,03ch,000h,01eh,000h,00fh,000h	; ab2e  ........x.<.....

; ----------------------------------------------------------------------
; DATOS dibujo_AB3E: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 18 de la lista 0xA1FA (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (16 bytes)
;   0xab3e..0xab4e  (16 bytes)
DATA_dibujo_AB3E:
	defb 087h,000h,0c3h,000h,0ffh,01eh,000h,0ffh,000h,0ffh,000h,0ffh,0ffh,000h,0ffh,000h	; ab3e  ................

; ----------------------------------------------------------------------
; DATOS dibujo_AB4E: 3 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 19 de la lista 0xA1FA (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (72 bytes)
;   0xab4e..0xab96  (72 bytes)
DATA_dibujo_AB4E:
	defb 0a0h,01fh,058h,083h,010h,070h,0a1h,010h,050h,0a0h,010h,050h,0a8h,010h,040h,0ach,010h,040h,0aeh,010h,040h,0afh,010h,040h	; ab4e  ..X..p..P..P..@..@..@..@
	defb 003h,0f8h,074h,0c9h,008h,00eh,0ebh,008h,00ch,0fbh,008h,00ch,07bh,000h,004h,03bh,000h,004h,01bh,000h,004h,00bh,000h,004h	; ab66  ..t.........{...........
	defb 0a7h,010h,050h,083h,010h,070h,0a1h,010h,050h,0a0h,010h,050h,0a8h,010h,040h,0ach,010h,040h,0aeh,010h,040h,0afh,010h,040h	; ab7e  ..P..p..P..P..@..@..@..@

; ----------------------------------------------------------------------
; DATOS dibujo_AB96: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 20 de la lista 0xA1FA (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (16 bytes)
;   0xab96..0xaba6  (16 bytes)
DATA_dibujo_AB96:
	defb 08bh,078h,0c9h,038h,0ebh,018h,0fbh,008h,07bh,080h,03bh,0c0h,01bh,0e0h,00bh,0f0h	; ab96  .x.8....{.......

; ----------------------------------------------------------------------
; DATOS dibujo_ABA6: 2 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 21 de la lista 0xA1FA (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (48 bytes)
;   0xaba6..0xabd6  (48 bytes)
DATA_dibujo_ABA6:
	defb 0a7h,0e7h,0b7h,083h,0e3h,093h,0a1h,0e1h,0b1h,0bfh,0f0h,0afh,0bfh,0f0h,0afh,0bfh,0f0h,0afh,0bfh,0f0h,0aeh,0bfh,071h,02dh	; aba6  ......................q-
	defb 083h,08fh,08bh,0c1h,0cfh,0c9h,0e3h,0efh,0ebh,0fbh,007h,0f3h,0fbh,007h,0f3h,0fbh,007h,0f3h,0fbh,007h,073h,0fbh,087h,0b3h	; abbe  ....................s...

; ----------------------------------------------------------------------
; DATOS dibujo_ABD6: 6 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 22 de la lista 0xA1FA (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (144 bytes)
;   0xabd6..0xac66  (144 bytes)
DATA_dibujo_ABD6:
	defb 0cbh,0b3h,070h,0c9h,0b1h,070h,0cbh,0b3h,070h,0cbh,0b3h,070h,0cbh,0b3h,070h,0cbh,0b3h,070h,0cbh,0b3h,070h,0fbh,0fbh,000h	; abd6  ..p..p..p..p..p..p..p...
	defb 0a3h,0bdh,00ch,083h,09dh,00ch,0a3h,0bdh,00ch,0a3h,0bdh,00ch,0a3h,0bdh,00ch,0a3h,0bdh,00ch,0a3h,0bdh,00ch,0bfh,0bfh,000h	; abee  ........................
	defb 03ch,05fh,02bh,03fh,05fh,02ch,03dh,05dh,02eh,03ch,05ch,02fh,03ch,05ch,027h,03ch,05ch,023h,03eh,05eh,021h,03fh,05fh,020h	; ac06  <_+?_,=].<\/<\'<\#>^!?_
	defb 03fh,05fh,028h,03fh,05fh,02ch,03dh,05dh,02eh,03ch,05ch,02fh,03ch,05ch,027h,03ch,05ch,023h,03eh,05eh,021h,03fh,05fh,020h	; ac1e  ?_(?_,=].<\/<\'<\#>^!?_
	defb 03fh,05fh,028h,03fh,05fh,02ch,03dh,05dh,02eh,030h,05fh,02fh,030h,05fh,02fh,030h,05fh,02fh,030h,05fh,02fh,031h,05eh,02eh	; ac36  ?_(?_,=].0_/0_/0_/0_/1^.
	defb 021h,05eh,02eh,031h,04eh,02eh,031h,05eh,02eh,031h,05eh,02eh,031h,05eh,02eh,031h,05eh,02eh,031h,05eh,02eh,03fh,05fh,020h	; ac4e  !^.1N.1^.1^.1^.1^.1^.?_

; ----------------------------------------------------------------------
; DATOS dibujo_AC66: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 23 de la lista 0xA1FA (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (32 bytes)
;   0xac66..0xac86  (32 bytes)
DATA_dibujo_AC66:
	defb 05dh,019h,00ch,080h,01dh,0d9h,04dh,0a9h,005h,0b1h,011h,0a9h,001h,0adh,004h,0aah	; ac66  ].....M.........
	defb 03bh,03bh,015h,091h,01bh,0dbh,04bh,0abh,003h,0b3h,013h,0abh,001h,0adh,004h,0aah	; ac76  ......K.........

; ----------------------------------------------------------------------
; DATOS dibujo_AC86: 1 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 24 de la lista 0xA1FA (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (24 bytes)
;   0xac86..0xac9e  (24 bytes)
DATA_dibujo_AC86:
	defb 098h,098h,023h,001h,000h,033h,09ah,099h,027h,094h,093h,02fh,08ah,085h,03dh,092h,08dh,03dh,0aah,095h,075h,04ah,035h,0f5h	; ac86  ..#..3..'../..=..=..uJ5.

; ----------------------------------------------------------------------
; DATOS dibujo_AC9E: 6 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 25 de la lista 0xA1FA (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (144 bytes)
;   0xac9e..0xad2e  (144 bytes)
DATA_dibujo_AC9E:
	defb 000h,0a0h,05fh,000h,07fh,080h,07fh,080h,000h,07fh,080h,000h,0ffh,0ffh,000h,0ffh,07fh,080h,0ffh,07fh,080h,07fh,000h,0ffh	; ac9e  .._.....................
	defb 000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh,0ffh,000h,0ffh,0ffh,000h,0ffh,0ffh,000h,0ffh,001h,0feh	; acb6  ........................
	defb 000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh,0ffh,000h,0ffh,07fh,080h,0ffh,07fh,080h,07fh,000h,0ffh	; acce  ........................
	defb 000h,000h,0feh,000h,0feh,000h,0feh,000h,000h,0feh,000h,000h,0feh,0feh,000h,0ffh,0ffh,000h,0ffh,0ffh,000h,0ffh,001h,0feh	; ace6  ........................
	defb 0eeh,07eh,010h,0c6h,07eh,038h,0feh,07eh,000h,080h,000h,000h,0feh,07eh,000h,0c6h,07eh,038h,0eeh,07eh,010h,000h,000h,000h	; acfe  .~..~8.~.....~..~8.~....
	defb 0eeh,07eh,07eh,0c6h,07eh,07eh,0feh,07eh,07eh,080h,000h,000h,0feh,07eh,07eh,0c6h,07eh,07eh,0eeh,07eh,07eh,000h,000h,000h	; ad16  .~~.~~.~~....~~.~~.~~...

; ----------------------------------------------------------------------
; DATOS dibujo_AD2E: 2 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 26 de la lista 0xA1FA (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (48 bytes)
;   0xad2e..0xad5e  (48 bytes)
DATA_dibujo_AD2E:
	defb 0f5h,0f7h,004h,015h,0f7h,0e4h,035h,0f7h,0c4h,075h,0f7h,084h,0f5h,0f7h,004h,0f5h,007h,004h,005h,007h,004h,0f5h,0f7h,004h	; ad2e  ......5..u..............
	defb 0dfh,0ffh,040h,0dfh,0ffh,040h,0deh,0ffh,041h,0dch,0ffh,043h,0d8h,0ffh,047h,0dfh,0f0h,040h,0d0h,0f0h,040h,0dfh,0ffh,040h	; ad46  ..@..@..A..C..G..@..@..@

; ----------------------------------------------------------------------
; DATOS dibujo_AD5E: 7 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 0 de la lista 0xA282 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (112 bytes)
;   0xad5e..0xadce  (112 bytes)
DATA_dibujo_AD5E:
	defb 0ffh,0ffh,098h,008h,098h,018h,07fh,080h,080h,000h,067h,090h,067h,080h,080h,000h	; ad5e  ..........g.g...
	defb 0ffh,0ffh,066h,022h,0cch,044h,0bbh,044h,022h,000h,0bbh,066h,077h,0cch,044h,000h	; ad6e  ..f".D.D"..fw.D.
	defb 0ffh,0ffh,018h,008h,018h,018h,0ffh,000h,000h,000h,0e7h,010h,0e7h,000h,000h,000h	; ad7e  ................
	defb 07fh,080h,067h,090h,067h,080h,07fh,080h,07fh,080h,067h,090h,067h,080h,07fh,080h	; ad8e  ..g.g.....g.g...
	defb 0ffh,000h,0e7h,010h,0e7h,000h,0ffh,000h,0ffh,000h,0e7h,010h,0e7h,000h,0ffh,000h	; ad9e  ................
	defb 0ddh,022h,0bbh,066h,077h,0cch,0bbh,044h,0ddh,022h,0bbh,066h,077h,0cch,0ffh,000h	; adae  .".fw..D.".fw...
	defb 0ddh,022h,0bbh,066h,077h,0cch,0bbh,044h,0ddh,022h,0bbh,066h,077h,0cch,0ffh,0ffh	; adbe  .".fw..D.".fw...

; ----------------------------------------------------------------------
; DATOS dibujo_ADCE: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 1 de la lista 0xA282 (p00:4D92, p00:4DF5); lo leen p00:4C0C (8
;   bytes)
;   0xadce..0xadd6  (8 bytes)
DATA_dibujo_ADCE:
	defb 000h,000h,000h,000h,000h,000h,000h,000h	; adce  ........

; ----------------------------------------------------------------------
; DATOS dibujo_ADD6: 20 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 2 de la lista 0xA282 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (320 bytes)
;   0xadd6..0xaf16  (320 bytes)
DATA_dibujo_ADD6:
	defb 008h,0f4h,0f9h,0fdh,0f9h,0fdh,089h,00dh,0f9h,0fdh,0f8h,004h,001h,045h,041h,045h	; add6  .............EAE
	defb 03bh,025h,03bh,001h,0ffh,001h,0fbh,0c5h,0fbh,0e1h,01fh,011h,01fh,001h,03fh,009h	; ade6  .%............?.
	defb 0b8h,048h,0bfh,007h,0ffh,000h,0bfh,047h,0bfh,00fh,0f0h,010h,0f0h,000h,0f8h,020h	; adf6  .H.....G.......
	defb 000h,000h,0ffh,0ffh,0ffh,000h,0ffh,0ffh,0ffh,0ffh,000h,000h,022h,000h,022h,022h	; ae06  ............".""
	defb 07fh,01dh,0f7h,035h,0e7h,065h,0c7h,0c5h,087h,085h,007h,005h,007h,005h,007h,007h	; ae16  ...5.e..........
	defb 000h,000h,080h,000h,0c0h,000h,0e0h,080h,0f0h,0c0h,078h,060h,03ch,030h,01eh,018h	; ae26  ..........x`<0..
	defb 000h,000h,000h,000h,001h,000h,003h,000h,007h,001h,00fh,003h,01eh,006h,03ch,00ch	; ae36  ..............<.
	defb 0fch,070h,0feh,078h,0efh,06ch,0e7h,066h,0e3h,063h,0e1h,061h,0e0h,060h,0e0h,0e0h	; ae46  .p.x.l.f.c.a.`..
	defb 000h,000h,000h,000h,000h,000h,080h,000h,0c0h,000h,0e0h,080h,0f0h,0c0h,078h,060h	; ae56  ..............x`
	defb 000h,000h,001h,000h,003h,000h,007h,001h,00fh,003h,01eh,006h,03ch,00ch,078h,018h	; ae66  ............<.x.
	defb 000h,0ffh,0ffh,0ffh,0ffh,0ffh,003h,000h,0ffh,0ffh,0ffh,000h,000h,040h,040h,040h	; ae76  .............@@@
	defb 000h,0ffh,0ffh,0ffh,0bfh,03fh,060h,060h,0ffh,0ffh,0ffh,000h,000h,000h,000h,000h	; ae86  .....?``........
	defb 000h,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,0ffh,0ffh,0ffh,000h,000h,000h,000h,000h	; ae96  ................
	defb 008h,0f4h,0f9h,0fdh,0f9h,0fdh,009h,00dh,0f9h,0fdh,0f8h,004h,001h,045h,041h,045h	; aea6  .............EAE
	defb 000h,0ffh,0ffh,0ffh,0ffh,0ffh,0c0h,040h,0ffh,0ffh,0ffh,000h,000h,040h,040h,040h	; aeb6  .......@.....@@@
	defb 000h,0ffh,0ffh,0ffh,0fdh,0fch,006h,006h,0ffh,0ffh,0ffh,000h,000h,000h,000h,000h	; aec6  ................
	defb 00fh,00ch,007h,006h,003h,003h,001h,001h,000h,000h,000h,000h,000h,000h,000h,000h	; aed6  ................
	defb 0f0h,030h,0e0h,060h,0c0h,0c0h,080h,080h,000h,000h,000h,000h,000h,000h,000h,000h	; aee6  .0.`............
	defb 000h,0ffh,0ffh,0ffh,0ffh,0ffh,060h,060h,0ffh,0ffh,0ffh,000h,000h,000h,000h,000h	; aef6  ......``........
	defb 000h,0ffh,0ffh,0ffh,0ffh,0ffh,00dh,00ch,0ffh,0ffh,0ffh,000h,000h,000h,000h,000h	; af06  ................

; ----------------------------------------------------------------------
; DATOS dibujo_AF16: 18 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 3 de la lista 0xA282 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (432 bytes)
;   0xaf16..0xb0c6  (432 bytes)
DATA_dibujo_AF16:
	defb 01bh,0ffh,0ech,0fbh,0ffh,00ch,09bh,01fh,0ech,0dbh,01fh,0ech,0fbh,0ffh,00ch,0fbh,01fh,0ech,01bh,01fh,0ech,01bh,01fh,0ech	; af16  ........................
	defb 0ffh,0ffh,0ffh,000h,0ffh,0ffh,0ffh,000h,0ffh,0ffh,0ffh,000h,000h,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh,0ffh,0ffh,000h	; af2e  ........................
	defb 0ffh,0ffh,0ffh,000h,0ffh,0ffh,0ffh,000h,0ffh,0ffh,0ffh,000h,006h,000h,0ffh,00dh,001h,0feh,01bh,003h,0fch,0ffh,0ffh,000h	; af46  ........................
	defb 0ffh,0ffh,0ffh,000h,0ffh,0ffh,0ffh,000h,0ffh,0ffh,0ffh,000h,0c0h,0c0h,03fh,080h,080h,07fh,000h,000h,0ffh,0ffh,0ffh,000h	; af5e  ..............?.........
	defb 0ffh,0ffh,0ffh,004h,0f5h,0ffh,0f1h,004h,0ffh,0f9h,0fdh,006h,009h,00dh,0f6h,009h,00dh,0f6h,009h,00dh,0f6h,0f9h,0fdh,006h	; af76  ........................
	defb 0ffh,0ffh,0ffh,000h,0ffh,0ffh,0ffh,000h,0ffh,0ffh,0ffh,000h,0c0h,040h,0bfh,0c0h,040h,0bfh,0c0h,040h,0bfh,0ffh,0ffh,000h	; af8e  .............@..@..@....
	defb 0ffh,0ffh,0ffh,000h,0ffh,0ffh,0ffh,000h,0ffh,0ffh,0ffh,000h,006h,006h,0f9h,003h,003h,0fch,001h,001h,0feh,0ffh,0ffh,000h	; afa6  ........................
	defb 0ffh,0ffh,0ffh,000h,0ffh,0ffh,0ffh,000h,0ffh,0ffh,0ffh,000h,0c0h,000h,0ffh,060h,000h,0ffh,0b0h,080h,07fh,0ffh,0ffh,000h	; afbe  ...............`........
	defb 0fbh,0ffh,0fch,00bh,0ffh,0fch,0fbh,00fh,0fch,0fbh,0ffh,00ch,01bh,01fh,0ech,01bh,01fh,0ech,01bh,01fh,0ech,0fbh,0ffh,00ch	; afd6  ........................
	defb 07fh,07fh,0ffh,040h,07fh,0ffh,05fh,060h,0ffh,05fh,07fh,0e0h,050h,070h,0efh,050h,070h,0efh,050h,070h,0efh,05fh,07fh,0e0h	; afee  ...@.._`._..Pp.Pp.Pp._..
	defb 050h,07fh,0efh,05fh,07fh,0e0h,051h,070h,0efh,053h,070h,0efh,05fh,07fh,0e0h,057h,070h,0efh,058h,078h,0e7h,05ch,07ch,0e3h	; b006  P.._..Qp.Sp._..Wp.Xx.\|.
	defb 007h,087h,000h,003h,083h,000h,001h,081h,000h,006h,086h,000h,085h,076h,000h,081h,077h,000h,0a3h,057h,000h,087h,057h,020h	; b01e  .............v..w..W..W
	defb 0e1h,0e1h,000h,0a1h,0a9h,000h,021h,021h,008h,061h,061h,000h,0e1h,0fdh,000h,061h,0fdh,000h,0a1h,0fdh,000h,0e1h,0fdh,000h	; b036  ......!!.aa....a........
	defb 087h,077h,000h,083h,077h,000h,081h,077h,000h,086h,077h,000h,085h,076h,000h,081h,077h,000h,0a3h,057h,000h,087h,057h,020h	; b04e  .w..w..w..w..v..w..W..W
	defb 0e1h,0fdh,000h,0a9h,0f5h,000h,021h,0f5h,008h,061h,0fdh,000h,0e1h,0fdh,000h,061h,0fdh,000h,0a1h,0fdh,000h,0e1h,0fdh,000h	; b066  ......!..a.....a........
	defb 00fh,0f0h,000h,000h,04fh,000h,000h,00fh,040h,000h,000h,000h,099h,09fh,000h,0c3h,0cfh,000h,0efh,0e7h,000h,0f3h,0ffh,000h	; b07e  ....O...@...............
	defb 0ffh,000h,000h,040h,0bfh,000h,000h,0bfh,040h,000h,000h,000h,099h,0ffh,000h,0c3h,0ffh,000h,0efh,0f7h,000h,0f3h,0ffh,000h	; b096  ...@....@...............
	defb 099h,09fh,000h,0ffh,0ffh,000h,004h,00bh,000h,000h,00bh,004h,0ffh,0ffh,000h,0ffh,0ffh,000h,0ffh,0ffh,000h,0ffh,0ffh,000h	; b0ae  ........................

; ----------------------------------------------------------------------
; DATOS dibujo_B0C6: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 4 de la lista 0xA282 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (16 bytes)
;   0xb0c6..0xb0d6  (16 bytes)
DATA_dibujo_B0C6:
	defb 099h,0ffh,0ffh,0ffh,004h,0fbh,000h,0fbh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b0c6  ................

; ----------------------------------------------------------------------
; DATOS dibujo_B0D6: 4 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 5 de la lista 0xA282 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (96 bytes)
;   0xb0d6..0xb136  (96 bytes)
DATA_dibujo_B0D6:
	defb 0ffh,0ffh,0ffh,000h,0ffh,0ffh,0ffh,000h,0ffh,0ffh,0ffh,000h,004h,085h,000h,081h,077h,000h,083h,077h,000h,087h,087h,020h	; b0d6  ................w..w...
	defb 0ffh,0ffh,0ffh,000h,0ffh,0ffh,0ffh,000h,0ffh,0ffh,0ffh,000h,0e1h,0e1h,000h,061h,0fdh,000h,0a1h,0fdh,000h,0e1h,0e1h,000h	; b0ee  ...............a........
	defb 0ffh,0ffh,0ffh,000h,0ffh,0ffh,0ffh,000h,0ffh,0ffh,0ffh,000h,004h,085h,000h,081h,077h,000h,083h,077h,000h,087h,087h,020h	; b106  ................w..w...
	defb 000h,0ffh,0ffh,0ffh,0ffh,000h,0ffh,0ffh,000h,006h,086h,000h,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,040h,0ffh,040h,040h,0bfh	; b11e  ...................@.@@.

; ----------------------------------------------------------------------
; DATOS dibujo_B136: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 6 de la lista 0xA282 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (16 bytes)
;   0xb136..0xb146  (16 bytes)
DATA_dibujo_B136:
	defb 000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,061h,0ffh,0ffh,000h,0ffh,000h,000h,000h,000h	; b136  .......a........

; ----------------------------------------------------------------------
; DATOS dibujo_B146: 3 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 7 de la lista 0xA282 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (72 bytes)
;   0xb146..0xb18e  (72 bytes)
DATA_dibujo_B146:
	defb 000h,0ffh,0ffh,0ffh,0ffh,000h,0ffh,0ffh,000h,006h,086h,000h,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh	; b146  ........................
	defb 008h,0f4h,0ffh,0f9h,0fdh,006h,0f9h,0fdh,006h,061h,065h,006h,0f9h,0fdh,006h,0f8h,004h,0ffh,001h,045h,0feh,041h,045h,0beh	; b15e  .........ae........E.AE.
	defb 0fbh,0fbh,0fbh,004h,0f5h,0ffh,0f1h,004h,0ffh,0f9h,0fdh,006h,0e1h,0e5h,006h,061h,0fdh,006h,0a1h,0fdh,006h,0e1h,0e5h,006h	; b176  ...............a........

; ----------------------------------------------------------------------
; DATOS dibujo_B18E: 17 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 8 de la lista 0xA282 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (272 bytes)
;   0xb18e..0xb29e  (272 bytes)
DATA_dibujo_B18E:
	defb 01fh,006h,01fh,006h,01fh,006h,08fh,083h,08fh,083h,08fh,083h,0c7h,0c1h,0c7h,0c1h	; b18e  ................
	defb 0c7h,0c1h,0e3h,0e0h,0e3h,0e0h,0e3h,0e0h,091h,090h,091h,090h,011h,010h,0d8h,0c8h	; b19e  ................
	defb 0dfh,0c7h,05fh,047h,01fh,007h,01fh,007h,05fh,047h,0dfh,0c7h,0dfh,0c7h,0dfh,0c7h	; b1ae  .._G...._G......
	defb 0efh,053h,0efh,041h,0ffh,040h,0f7h,028h,0f7h,021h,0ffh,023h,0ffh,093h,0ffh,091h	; b1be  .S.A.@.(.!.#....
	defb 000h,000h,0ffh,0ffh,0ffh,000h,0ffh,0ffh,0ffh,0ffh,0c0h,0c0h,080h,080h,000h,000h	; b1ce  ................
	defb 000h,000h,080h,000h,0c0h,000h,0e0h,080h,0f0h,0c0h,0f8h,0e0h,0bch,0b0h,0deh,0d8h	; b1de  ................
	defb 0cfh,0cch,0c7h,0c6h,0e3h,063h,0e1h,061h,0e0h,060h,0f0h,0b0h,0f0h,0b0h,0f0h,0b0h	; b1ee  .....c.a.`......
	defb 0f8h,058h,0f8h,058h,0f8h,058h,0fch,02ch,0fch,02ch,0fch,02ch,0feh,096h,0feh,096h	; b1fe  .X.X.X.,.,.,....
	defb 0dfh,0c7h,0dfh,0c7h,0dfh,0c7h,05fh,047h,01dh,005h,01ch,004h,05ch,044h,0deh,0c6h	; b20e  ......_G....\D..
	defb 0fbh,0f9h,08bh,089h,0c3h,0c1h,0e3h,0e0h,0cbh,0c8h,09bh,098h,03bh,038h,03bh,038h	; b21e  .............8.8
	defb 0cch,0cch,08ch,08ch,0ech,0e4h,0aeh,0a6h,08eh,086h,0ceh,0c6h,0afh,0a7h,0efh,0e7h	; b22e  ................
	defb 0e7h,0e1h,0e7h,0e1h,0f3h,0f0h,0f3h,0f0h,0d3h,0d0h,0d9h,0d8h,0d9h,0d8h,0c9h,0c8h	; b23e  ................
	defb 0c7h,0c1h,0e3h,0e0h,0e3h,0e0h,0e3h,0e0h,0f1h,0f0h,0f1h,0f0h,0f1h,0f0h,0f8h,0f8h	; b24e  ................
	defb 0feh,096h,0ffh,0cbh,0ffh,0cbh,0ffh,0cbh,0ffh,065h,0ffh,065h,0ffh,065h,0ffh,032h	; b25e  .........e.e.e.2
	defb 0ffh,094h,0ffh,0cah,0ffh,0cbh,0ffh,0cbh,0ffh,065h,0ffh,065h,0ffh,065h,0ffh,032h	; b26e  .........e.e.e.2
	defb 000h,000h,000h,000h,000h,000h,000h,000h,080h,080h,081h,080h,081h,080h,0c3h,0c0h	; b27e  ................
	defb 0c3h,0c1h,0c7h,0c1h,0e7h,063h,0efh,063h,0eeh,066h,0feh,0a6h,0fch,0ach,0fch,0ach	; b28e  .....c.c.f......

; ----------------------------------------------------------------------
; DATOS dibujo_B29E: 5 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 9 de la lista 0xA282 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (80 bytes)
;   0xb29e..0xb2ee  (80 bytes)
DATA_dibujo_B29E:
	defb 09fh,0e6h,03fh,0e6h,07fh,0e6h,0cfh,0f3h,09fh,0f3h,0bfh,0f3h,0e7h,0f9h,0cfh,0f9h	; b29e  ..?.............
	defb 0d8h,0c8h,058h,048h,01eh,007h,01ch,007h,05dh,047h,0dfh,0c7h,0deh,0c7h,0deh,0c7h	; b2ae  ..XH....]G......
	defb 0dfh,0f9h,0f3h,0fch,0e7h,0fch,0efh,0fch,0f9h,0feh,0f3h,0feh,0f7h,0feh,0fch,0ffh	; b2be  ................
	defb 0f9h,0ffh,0fbh,0ffh,0f6h,0f7h,0f4h,0f7h,0f5h,0f7h,0f3h,0f3h,0f2h,0f3h,003h,003h	; b2ce  ................
	defb 0ffh,032h,0ffh,032h,07fh,099h,0ffh,099h,0ffh,099h,03fh,0cch,07fh,0cch,0ffh,0cch	; b2de  .2.2......?.....

; ----------------------------------------------------------------------
; DATOS dibujo_B2EE: 21 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 10 de la lista 0xA282 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (336 bytes)
;   0xb2ee..0xb43e  (336 bytes)
DATA_dibujo_B2EE:
	defb 0fch,024h,0fdh,025h,0ffh,027h,07fh,017h,07dh,015h,07ch,014h,03ch,00ch,03eh,00eh	; b2ee  .$.%.'..}.|.<.>.
	defb 03ch,00ch,09dh,085h,09fh,087h,09fh,087h,04fh,043h,04eh,042h,04eh,042h,0e7h,0e1h	; b2fe  <.......OCNBNB..
	defb 01bh,018h,08bh,088h,0c3h,0c0h,0e3h,0e0h,0cbh,0c8h,09bh,098h,03bh,038h,03bh,038h	; b30e  .............8.8
	defb 0e7h,0e1h,0e7h,0e1h,093h,090h,093h,090h,013h,010h,099h,088h,019h,008h,0d9h,0c8h	; b31e  ................
	defb 01bh,018h,08bh,088h,0c3h,0c0h,0e3h,0e0h,0cbh,0c8h,0dbh,058h,0fbh,078h,0fbh,078h	; b32e  ...........X.x.x
	defb 0a7h,0a1h,0a7h,0a1h,0d3h,0d0h,0f3h,0f0h,0d3h,0d0h,099h,098h,0b9h,0b8h,0b9h,0b8h	; b33e  ................
	defb 0efh,0e7h,0efh,0e7h,0afh,0a7h,08fh,087h,0cfh,0c7h,0efh,067h,0efh,067h,0efh,067h	; b34e  ...........g.g.g
	defb 09ch,09ch,08ch,08ch,0c4h,0c4h,082h,082h,0f2h,0f2h,082h,082h,0bbh,0b9h,0bbh,0b9h	; b35e  ................
	defb 0efh,027h,0efh,027h,0efh,027h,07fh,017h,07fh,017h,07fh,017h,03fh,00fh,03fh,00fh	; b36e  .'.'.'......?.?.
	defb 09bh,099h,08bh,088h,0c3h,0c0h,0e3h,0e0h,0cbh,0c8h,09bh,098h,0bbh,0b8h,0bbh,0b8h	; b37e  ................
	defb 03fh,00fh,09fh,087h,09fh,087h,09fh,087h,0cfh,0c3h,0cfh,0c3h,0cfh,0c3h,0e7h,0e1h	; b38e  ?...............
	defb 09bh,098h,08bh,088h,0c3h,0c0h,0e3h,0e0h,0cbh,0c8h,09bh,098h,0bbh,0b8h,0bbh,0b8h	; b39e  ................
	defb 01bh,019h,08bh,088h,0c3h,0c0h,0e3h,0e0h,0cbh,0c8h,09bh,098h,03bh,038h,03bh,038h	; b3ae  .............8.8
	defb 0ddh,0c5h,0ddh,0c5h,0dfh,0c7h,0dfh,0c7h,05dh,045h,01ch,004h,01ch,004h,0deh,0c6h	; b3be  ........]E......
	defb 0dch,0c4h,0ddh,0c5h,0dfh,0c7h,0dfh,0c7h,05dh,045h,01ch,004h,01ch,004h,0deh,0c6h	; b3ce  ........]E......
	defb 0dch,0c4h,0ddh,0c5h,0dfh,0c7h,0dfh,0c7h,05dh,045h,01ch,004h,01fh,007h,0dch,0c4h	; b3de  ........]E......
	defb 09bh,098h,08bh,088h,0c3h,0c0h,0e3h,0e0h,0cbh,0c8h,0dbh,058h,0fbh,078h,0fbh,078h	; b3ee  ...........X.x.x
	defb 0fbh,038h,0ebh,028h,0e3h,020h,073h,010h,07bh,018h,07bh,018h,03bh,008h,03bh,008h	; b3fe  .8.(. s.{.{.....
	defb 03bh,008h,09fh,084h,09fh,084h,09fh,084h,0cfh,0c2h,0cfh,0c2h,0cfh,0c2h,0a7h,0a1h	; b40e  ................
	defb 0efh,0e7h,0efh,0e7h,0afh,0a7h,08fh,087h,0cfh,0c7h,0afh,0a7h,0efh,0e7h,0efh,0e7h	; b41e  ................
	defb 0e7h,0e1h,0a7h,0a1h,0f3h,0f0h,0b3h,0b0h,093h,090h,0c8h,0c8h,0a8h,0a8h,0e8h,0e8h	; b42e  ................

; ----------------------------------------------------------------------
; DATOS dibujo_B43E: 5 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 11 de la lista 0xA282 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (80 bytes)
;   0xb43e..0xb48e  (80 bytes)
DATA_dibujo_B43E:
	defb 0deh,0c7h,0dch,0c7h,0ddh,0c7h,0dfh,0c7h,05eh,047h,01eh,007h,01dh,005h,0dfh,0c7h	; b43e  ........^G......
	defb 0fbh,038h,0ebh,028h,0e3h,020h,073h,090h,07bh,098h,0fbh,098h,0bbh,0c8h,03bh,0c8h	; b44e  .8.(. s.{.......
	defb 07bh,0c8h,0dfh,0e4h,09fh,0e4h,0bfh,0e4h,0efh,0f2h,0cfh,0f2h,05fh,072h,037h,039h	; b45e  {..........._r79
	defb 027h,039h,0afh,0b9h,0dbh,0dch,0f3h,0fch,0d7h,0dch,09dh,09eh,039h,03eh,03bh,03eh	; b46e  '9..........9>.>
	defb 01eh,01fh,08ch,08fh,0c5h,0c7h,0e3h,0e3h,0f2h,0f2h,002h,002h,0fbh,0f9h,003h,001h	; b47e  ................

; ----------------------------------------------------------------------
; DATOS dibujo_B48E: 17 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 0 de la lista 0xA2BF (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (272 bytes)
;   0xb48e..0xb59e  (272 bytes)
DATA_dibujo_B48E:
	defb 0bfh,0dfh,0bfh,0d1h,0bfh,0c3h,03fh,0c7h,03fh,0d3h,03fh,0d9h,03fh,0dch,03fh,0dch	; b48e  ......?.?.?.?.?.
	defb 079h,06fh,0f3h,0dfh,0f3h,0dfh,0f3h,0dfh,0e6h,0bfh,0e6h,0bfh,0e6h,0bfh,0cch,07fh	; b49e  yo..............
	defb 0e7h,0fbh,0e7h,0fbh,0e7h,0fbh,0e7h,0fah,0e7h,0b8h,0e7h,038h,0e7h,03ah,0e7h,07bh	; b4ae  ...........8.:.{
	defb 083h,0e3h,007h,0c7h,007h,0c7h,007h,0c7h,00fh,08fh,00fh,08fh,00fh,08fh,01fh,01fh	; b4be  ................
	defb 000h,000h,0ffh,0ffh,0ffh,000h,0ffh,0ffh,0ffh,0ffh,003h,003h,001h,001h,000h,000h	; b4ce  ................
	defb 0f6h,0cbh,0f6h,083h,0feh,003h,0ech,017h,0ech,087h,0fch,0c7h,0f9h,0cfh,0f9h,08fh	; b4de  ................
	defb 060h,0f8h,060h,0f8h,060h,0f8h,0c1h,0f1h,0c1h,0f1h,0c1h,0f1h,083h,0e3h,083h,0e3h	; b4ee  `.`.`...........
	defb 000h,000h,001h,000h,003h,000h,007h,001h,00fh,003h,01fh,007h,03dh,00dh,07bh,01bh	; b4fe  ............=.{.
	defb 0f9h,02fh,0f3h,05fh,0f3h,0dfh,0f3h,0dfh,0e6h,0bfh,0e6h,0bfh,0e6h,0bfh,0cch,07fh	; b50e  ./._............
	defb 083h,0e3h,007h,0c7h,007h,0c7h,007h,0c7h,00fh,089h,00fh,089h,00fh,088h,01fh,013h	; b51e  ................
	defb 0f3h,033h,0e3h,063h,0c7h,0c6h,087h,086h,007h,006h,00fh,00dh,00fh,00dh,00fh,00dh	; b52e  .3.c............
	defb 01eh,01bh,01eh,01bh,01eh,01bh,03ch,037h,03ch,037h,03ch,037h,079h,06fh,079h,06fh	; b53e  ......<7<7<7yoyo
	defb 0e7h,0fbh,0e7h,0fah,0e7h,0f8h,0e7h,0f8h,0e7h,0fah,0e7h,0fbh,0e7h,0fbh,0e7h,0fbh	; b54e  ................
	defb 083h,0e3h,007h,0c7h,007h,0c7h,007h,0c7h,00fh,08bh,00fh,08bh,00fh,00bh,01fh,013h	; b55e  ................
	defb 01fh,013h,01fh,011h,02fh,037h,02fh,035h,02fh,031h,06fh,073h,06dh,075h,06fh,077h	; b56e  ..../7/5/1osmuow
	defb 000h,000h,000h,000h,000h,000h,000h,000h,001h,001h,081h,001h,081h,001h,0c3h,003h	; b57e  ................
	defb 0c3h,083h,0e3h,083h,0e7h,0c6h,0f7h,0c6h,077h,066h,07fh,065h,03fh,035h,03fh,035h	; b58e  ........wf.e?5?5

; ----------------------------------------------------------------------
; DATOS dibujo_B59E: 4 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 1 de la lista 0xA2BF (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (64 bytes)
;   0xb59e..0xb5de  (64 bytes)
DATA_dibujo_B59E:
	defb 0f9h,067h,0fch,067h,0feh,067h,0f3h,0cfh,0f9h,0cfh,0fdh,0cfh,0e7h,09fh,0f3h,09fh	; b59e  .g.g.g..........
	defb 07fh,04ch,07fh,04ch,0feh,099h,0ffh,099h,0ffh,099h,0fch,033h,0feh,033h,0ffh,033h	; b5ae  .L.L.......3.3.3
	defb 09fh,0ffh,0dfh,0ffh,06fh,0efh,02fh,0efh,0afh,0efh,0cfh,0cfh,04fh,0cfh,0c0h,0c0h	; b5be  ....o./.....O...
	defb 0fbh,09fh,0cfh,03fh,0e7h,03fh,0f7h,03fh,09fh,07fh,0cfh,07fh,0efh,07fh,03fh,0ffh	; b5ce  ...?.?.?......?.

; ----------------------------------------------------------------------
; DATOS dibujo_B5DE: 1 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 2 de la lista 0xA2BF (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (24 bytes)
;   0xb5de..0xb5f6  (24 bytes)
DATA_dibujo_B5DE:
	defb 01bh,013h,0e0h,01ah,012h,0e0h,078h,0e0h,000h,038h,0e0h,000h,0bah,0e2h,000h,0fbh,0e3h,000h,07bh,0e3h,000h,07bh,0e3h,000h	; b5de  ......x..8........{..{..

; ----------------------------------------------------------------------
; DATOS dibujo_B5F6: 22 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 3 de la lista 0xA2BF (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (352 bytes)
;   0xb5f6..0xb756  (352 bytes)
DATA_dibujo_B5F6:
	defb 0efh,0f7h,0efh,0f7h,0efh,0f5h,0efh,0f1h,0efh,0f3h,0eeh,0f7h,0eeh,0f7h,0eeh,0f7h	; b5f6  ................
	defb 087h,0e5h,087h,0e5h,00fh,0cbh,00fh,0cfh,00fh,0cbh,01fh,099h,01fh,09dh,01fh,09dh	; b606  ................
	defb 0ech,0f7h,0ech,0f7h,0ech,0f7h,0e8h,0feh,0e8h,0feh,0e8h,0feh,0f0h,0fch,0f0h,0fch	; b616  ................
	defb 03fh,039h,03fh,031h,03fh,023h,07fh,041h,07fh,04fh,07fh,041h,0bfh,0ddh,0bfh,0ddh	; b626  ?9?1?#.A.O.A....
	defb 0f0h,0fch,0e1h,0f9h,0e1h,0f9h,0e1h,0f9h,0c3h,0f3h,0c3h,0f3h,0c3h,0f3h,087h,0e7h	; b636  ................
	defb 0bfh,0d9h,03fh,0d1h,03fh,0c3h,03fh,0c7h,03fh,0d3h,03fh,0d9h,03fh,0ddh,03fh,0ddh	; b646  ..?.?.?.?.?.?.?.
	defb 087h,0e7h,087h,0e7h,00fh,0cfh,00fh,0cfh,00fh,0cbh,01fh,09bh,01fh,09bh,01fh,093h	; b656  ................
	defb 03fh,0d9h,03fh,0d1h,03fh,0c3h,03fh,0c7h,03fh,0d3h,03fh,0d9h,03fh,0ddh,03fh,0ddh	; b666  ?.?.?.?.?.?.?.?.
	defb 03fh,0d8h,03fh,0d1h,03fh,0c3h,03fh,0c7h,03fh,0d3h,03fh,0d9h,03fh,0dch,03fh,0dch	; b676  ?.?.?.?.?.?.?.?.
	defb 03fh,0d8h,03fh,0d1h,03fh,0c3h,03fh,0c7h,03fh,0d3h,03eh,0dbh,03eh,0dfh,03eh,0dfh	; b686  ?.?.?.?.?.>.>.>.
	defb 0e4h,03fh,0e4h,0bfh,0e4h,0ffh,0e8h,0feh,0e8h,0beh,0e8h,03eh,0f0h,03ch,0f0h,07ch	; b696  .?.........>.<.|
	defb 0f0h,03ch,0e1h,0b9h,0e1h,0f9h,0e1h,0f9h,0c3h,0f2h,0c3h,072h,0c3h,072h,087h,0e7h	; b6a6  .<.........r.r..
	defb 087h,0e7h,087h,0e7h,00fh,0c9h,00fh,0c9h,00fh,0c8h,017h,099h,017h,098h,017h,09bh	; b6b6  ................
	defb 03fh,033h,03fh,031h,02fh,037h,06fh,075h,06fh,071h,06fh,073h,0edh,0f5h,0efh,0f7h	; b6c6  ?3?1/7ouoqos....
	defb 0efh,0f7h,0efh,0f7h,0efh,0f5h,0efh,0f1h,0efh,0f3h,0efh,0f5h,0efh,0f7h,0efh,0f7h	; b6d6  ................
	defb 03fh,0d9h,03fh,0d1h,03fh,0c3h,03fh,0c7h,03fh,0d3h,03eh,0dbh,03eh,0dfh,03eh,0dfh	; b6e6  ?.?.?.?.?.>.>.>.
	defb 03ch,0dfh,03ch,0d7h,03ch,0c7h,038h,0ceh,038h,0deh,038h,0deh,030h,0dch,030h,0dch	; b6f6  <.<.<.8.8.8.0.0.
	defb 030h,0dch,021h,0f9h,021h,0f9h,021h,0f9h,043h,0f3h,043h,0f3h,043h,0f3h,087h,0e5h	; b706  0.!.!.!.C.C.C...
	defb 0bfh,0d8h,03fh,0d1h,03fh,0c3h,03fh,0c7h,03fh,0d3h,03fh,0d9h,03fh,0dch,03fh,0dch	; b716  ..?.?.?.?.?.?.?.
	defb 0e7h,0bbh,0e7h,0bbh,0e7h,0fbh,0e7h,0fbh,0e7h,0bah,0e7h,038h,0e7h,038h,0e7h,07bh	; b726  ...........8.8.{
	defb 0e7h,03bh,0e7h,0bbh,0e7h,0fbh,0e7h,0fbh,0e7h,0bah,0e7h,038h,0e7h,038h,0e7h,07bh	; b736  ...........8.8.{
	defb 0e7h,03bh,0e7h,0bbh,0e7h,0fbh,0e7h,0fbh,0e7h,0bah,0e7h,038h,0e7h,0f8h,0e7h,03bh	; b746  ...........8....

; ----------------------------------------------------------------------
; DATOS dibujo_B756: 4 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 4 de la lista 0xA2BF (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (64 bytes)
;   0xb756..0xb796  (64 bytes)
DATA_dibujo_B756:
	defb 0dfh,01ch,0d7h,014h,0c7h,004h,0ceh,009h,0deh,019h,0dfh,019h,0ddh,013h,0dch,013h	; b756  ................
	defb 07bh,0e3h,03bh,0e3h,0bbh,0e3h,0fbh,0e3h,07ah,0e2h,078h,0e0h,0b8h,0a0h,0fbh,0e3h	; b766  {.......z.x.....
	defb 0deh,013h,0fbh,027h,0f9h,027h,0fdh,027h,0f7h,04fh,0f3h,04fh,0fah,04eh,0ech,09ch	; b776  ...'.'.'.O.O.N..
	defb 0e4h,09ch,0f5h,09dh,0dbh,03bh,0cfh,03fh,0ebh,03bh,0b9h,079h,09ch,07ch,0dch,07ch	; b786  .......?...y.|.|

; ----------------------------------------------------------------------
; DATOS dibujo_B796: 1 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 5 de la lista 0xA2BF (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (24 bytes)
;   0xb796..0xb7ae  (24 bytes)
DATA_dibujo_B796:
	defb 078h,0f8h,000h,031h,0f1h,000h,0a3h,0e3h,000h,0c7h,0c7h,000h,04fh,04fh,080h,040h,040h,080h,0dfh,09fh,000h,0c0h,080h,000h	; b796  x..1........OO.@@.......

; ----------------------------------------------------------------------
; DATOS dibujo_B7AE: 22 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 0 de la lista 0xA306 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (352 bytes)
;   0xb7ae..0xb90e  (352 bytes)
DATA_dibujo_B7AE:
	defb 000h,000h,000h,000h,000h,000h,066h,022h,066h,066h,000h,000h,000h,000h,0ffh,0ffh	; b7ae  ......f"ff......
	defb 000h,000h,000h,000h,000h,000h,066h,022h,066h,066h,000h,000h,000h,000h,000h,000h	; b7be  ......f"ff......
	defb 080h,000h,0c0h,000h,0e0h,000h,0b6h,062h,0feh,066h,0fch,000h,0feh,000h,0ffh,000h	; b7ce  .......b.f......
	defb 07fh,080h,07fh,080h,07fh,080h,019h,0c4h,019h,080h,07fh,080h,07fh,080h,0ffh,0ffh	; b7de  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,099h,044h,099h,000h,0ffh,000h,0ffh,000h,0ffh,0ffh	; b7ee  .......D........
	defb 0ffh,000h,000h,000h,000h,000h,066h,022h,066h,066h,000h,000h,000h,000h,000h,000h	; b7fe  ......f"ff......
	defb 07fh,080h,07fh,080h,07fh,080h,019h,0c4h,019h,080h,07fh,080h,07fh,080h,07fh,080h	; b80e  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,099h,044h,099h,000h,0ffh,000h,0ffh,000h,0ffh,000h	; b81e  .......D........
	defb 07fh,080h,03bh,0e6h,077h,0cch,03bh,0c4h,05dh,0a2h,03bh,0e6h,077h,0cch,03bh,0c4h	; b82e  ....w...]...w...
	defb 0ffh,000h,0bbh,066h,077h,0cch,0bbh,044h,0ddh,022h,0bbh,066h,077h,0cch,0bbh,044h	; b83e  ...fw..D.".fw..D
	defb 000h,0ffh,0ffh,000h,0ffh,000h,099h,044h,099h,000h,0ffh,000h,0ffh,000h,0ffh,000h	; b84e  .......D........
	defb 080h,07fh,03fh,000h,01fh,000h,06bh,026h,067h,066h,003h,000h,001h,000h,000h,000h	; b85e  ..?...k&gf......
	defb 0ffh,001h,0ffh,001h,0ffh,001h,099h,045h,099h,001h,0ffh,001h,0ffh,001h,0ffh,0ffh	; b86e  .......E........
	defb 00fh,000h,00fh,000h,00fh,000h,029h,064h,069h,060h,00fh,000h,00fh,000h,00fh,000h	; b87e  ......)di`......
	defb 0ffh,001h,0ffh,001h,0ffh,001h,099h,045h,099h,001h,0ffh,001h,0ffh,001h,0ffh,001h	; b88e  .......E........
	defb 0ffh,001h,0bbh,067h,077h,0cdh,0bbh,045h,0ddh,023h,0bbh,067h,077h,0cdh,0bbh,045h	; b89e  ...gw..E.#.gw..E
	defb 0ffh,0ffh,066h,022h,0cch,044h,0bbh,044h,022h,000h,0bbh,066h,077h,0cch,044h,000h	; b8ae  ..f".D.D"..fw.D.
	defb 0ddh,022h,0bbh,066h,077h,0cch,0bbh,044h,0ddh,022h,0bbh,066h,077h,0cch,0ffh,000h	; b8be  .".fw..D.".fw...
	defb 0ffh,0ffh,066h,022h,0cch,044h,04bh,004h,022h,000h,06bh,026h,0c7h,04ch,044h,000h	; b8ce  ..f".DK.".k&.LD.
	defb 00fh,000h,06bh,026h,0c7h,04ch,04bh,004h,02dh,002h,06bh,026h,0c7h,04ch,04bh,004h	; b8de  ..k&.LK.-.k&.LK.
	defb 0ffh,0ffh,098h,008h,098h,018h,07fh,080h,080h,000h,067h,090h,067h,080h,080h,000h	; b8ee  ..........g.g...
	defb 0ffh,0ffh,018h,008h,018h,018h,0ffh,000h,000h,000h,0e7h,010h,0e7h,000h,000h,000h	; b8fe  ................

; ----------------------------------------------------------------------
; DATOS dibujo_B90E: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 1 de la lista 0xA306 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (16 bytes)
;   0xb90e..0xb91e  (16 bytes)
DATA_dibujo_B90E:
	defb 0c0h,0ffh,0ffh,080h,07fh,080h,099h,0c4h,019h,080h,07fh,080h,07fh,080h,07fh,080h	; b90e  ................

; ----------------------------------------------------------------------
; DATOS dibujo_B91E: 1 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 2 de la lista 0xA306 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (24 bytes)
;   0xb91e..0xb936  (24 bytes)
DATA_dibujo_B91E:
	defb 007h,0ffh,006h,0ffh,001h,000h,0ffh,001h,000h,099h,045h,000h,099h,001h,000h,0ffh,001h,000h,0ffh,001h,000h,0ffh,001h,000h	; b91e  ..........E.............

; ----------------------------------------------------------------------
; DATOS dibujo_B936: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 3 de la lista 0xA306 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (16 bytes)
;   0xb936..0xb946  (16 bytes)
DATA_dibujo_B936:
	defb 000h,000h,066h,022h,0cch,044h,044h,000h,022h,000h,066h,022h,0cch,044h,044h,000h	; b936  ..f".DD.".f".DD.

; ----------------------------------------------------------------------
; DATOS dibujo_B946: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 4 de la lista 0xA306 (p00:4D92, p00:4DF5); lo leen p00:4C0C (8
;   bytes)
;   0xb946..0xb94e  (8 bytes)
DATA_dibujo_B946:
	defb 018h,088h,0c8h,0e8h,0c8h,098h,038h,03fh	; b946  ......8?

; ----------------------------------------------------------------------
; DATOS dibujo_B94E: 6 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 5 de la lista 0xA306 (p00:4D92, p00:4DF5); lo leen p00:4C0C (48
;   bytes)
;   0xb94e..0xb97e  (48 bytes)
DATA_dibujo_B94E:
	defb 01eh,01eh,03ch,03ch,078h,078h,0f0h,0f0h	; b94e  ..<<xx..
	defb 0f0h,078h,03ch,09eh,08fh,087h,0c3h,0e1h	; b956  .x<.....
	defb 0f0h,078h,03ch,01eh,00fh,087h,0c3h,0e1h	; b95e  .x<.....
	defb 0f0h,0f8h,0fch,0feh,0ffh,0f7h,0f3h,0ffh	; b966  ........
	defb 0f0h,078h,03ch,01eh,00fh,087h,0c3h,0ffh	; b96e  .x<.....
	defb 0f3h,07bh,03fh,01fh,00fh,087h,0c3h,0ffh	; b976  .{?.....

; ----------------------------------------------------------------------
; DATOS dibujo_B97E: 8 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 6 de la lista 0xA306 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (128 bytes)
;   0xb97e..0xb9fe  (128 bytes)
DATA_dibujo_B97E:
	defb 000h,000h,0e1h,0ffh,0c3h,0ffh,0c3h,0ffh,087h,0ffh,087h,0ffh,00fh,0ffh,00fh,0ffh	; b97e  ................
	defb 0f1h,0f1h,071h,0f1h,031h,0f1h,011h,0f1h,009h,0f9h,081h,0f9h,0c1h,0f9h,0e1h,0f9h	; b98e  ..q.1...........
	defb 080h,080h,0e1h,0ffh,0c3h,0ffh,0c3h,0ffh,0e7h,0ffh,0e7h,0ffh,0ffh,0ffh,0ffh,0ffh	; b99e  ................
	defb 0feh,0ffh,0feh,0ffh,0fch,0ffh,0fch,0ffh,0fch,0ffh,0feh,0ffh,0deh,0c7h,0deh,0c7h	; b9ae  ................
	defb 019h,0d1h,019h,0d1h,019h,0d1h,019h,0d1h,069h,0e1h,069h,0e1h,0e9h,0e1h,0e9h,0e1h	; b9be  ........i.i.....
	defb 019h,011h,019h,011h,019h,011h,019h,011h,099h,091h,099h,091h,019h,091h,019h,091h	; b9ce  ................
	defb 09dh,099h,0cch,040h,0fdh,039h,0bdh,019h,08dh,009h,08dh,005h,09fh,013h,09bh,011h	; b9de  ...@.9..........
	defb 099h,011h,099h,011h,099h,011h,099h,011h,099h,011h,099h,011h,099h,011h,099h,011h	; b9ee  ................

; ----------------------------------------------------------------------
; DATOS dibujo_B9FE: 3 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 7 de la lista 0xA306 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (72 bytes)
;   0xb9fe..0xba46  (72 bytes)
DATA_dibujo_B9FE:
	defb 0d0h,0ffh,04fh,0d8h,0ffh,047h,0dch,0ffh,043h,0deh,0ffh,041h,0dfh,0ffh,040h,0d7h,0ffh,048h,0d3h,0ffh,04ch,0dfh,0ffh,040h	; b9fe  ..O..G..C..A..@..H..L..@
	defb 0f0h,0ffh,00fh,0d8h,0ffh,047h,0dch,0ffh,043h,0deh,0ffh,041h,0dfh,0ffh,040h,0d7h,0ffh,048h,0d3h,0ffh,04ch,0d1h,0ffh,04eh	; ba16  .....G..C..A..@..H..L..N
	defb 058h,078h,040h,058h,078h,040h,058h,078h,040h,05ah,07eh,040h,05fh,07eh,040h,059h,078h,040h,059h,078h,040h,05fh,07fh,040h	; ba2e  Xx@Xx@Xx@Z~@_~@Yx@Yx@_.@

; ----------------------------------------------------------------------
; DATOS dibujo_BA46: 4 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 8 de la lista 0xA306 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (64 bytes)
;   0xba46..0xba86  (64 bytes)
DATA_dibujo_BA46:
	defb 0ffh,000h,000h,0ffh,000h,0ffh,0ffh,000h,000h,000h,000h,000h,000h,000h,0ffh,0ffh	; ba46  ................
	defb 0ffh,000h,000h,0ffh,000h,0ffh,0ffh,000h,000h,000h,00ch,00ch,016h,01ah,0f3h,0f3h	; ba56  ................
	defb 0ffh,000h,000h,0ffh,000h,0ffh,0ffh,000h,000h,000h,030h,030h,058h,068h,0cfh,0cfh	; ba66  ..........00Xh..
	defb 0ffh,000h,000h,0ffh,000h,0ffh,0ffh,000h,000h,000h,000h,000h,000h,000h,000h,000h	; ba76  ................

; ----------------------------------------------------------------------
; DATOS dibujo_BA86: 6 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 9 de la lista 0xA306 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (144 bytes)
;   0xba86..0xbb16  (144 bytes)
DATA_dibujo_BA86:
	defb 0bfh,0c0h,000h,0bfh,0c0h,07fh,0bfh,0c0h,07fh,0bfh,0c0h,000h,080h,0c0h,000h,080h,0c0h,000h,080h,0c0h,000h,080h,080h,000h	; ba86  ........................
	defb 0fdh,003h,000h,0fdh,003h,0feh,0fdh,003h,0feh,0fdh,003h,000h,001h,003h,000h,031h,033h,000h,079h,04bh,020h,0ffh,0ffh,000h	; ba9e  ...............13.yK ...
	defb 0bfh,040h,000h,0bfh,040h,07fh,0bfh,040h,07fh,0bfh,040h,000h,080h,040h,000h,080h,040h,000h,080h,040h,000h,0ffh,0ffh,000h	; bab6  .@..@..@..@..@..@..@....
	defb 0fdh,003h,000h,0fdh,003h,0feh,0fdh,003h,0feh,0fdh,003h,000h,001h,003h,000h,001h,003h,000h,001h,003h,000h,0ffh,0ffh,000h	; bace  ........................
	defb 0bfh,0c0h,000h,0bfh,0c0h,07fh,0bfh,0c0h,07fh,0bfh,0c0h,000h,080h,0c0h,000h,08ch,0cch,000h,09eh,0d2h,008h,0f3h,0f3h,000h	; bae6  ........................
	defb 0fdh,003h,000h,0fdh,003h,0feh,0fdh,003h,0feh,0fdh,003h,000h,001h,003h,000h,001h,003h,000h,001h,003h,000h,001h,003h,000h	; bafe  ........................

; ----------------------------------------------------------------------
; DATOS dibujo_BB16: 16 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 10 de la lista 0xA306 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (384 bytes)
;   0xbb16..0xbc96  (384 bytes)
DATA_dibujo_BB16:
	defb 007h,087h,000h,003h,083h,000h,001h,081h,000h,006h,086h,000h,085h,076h,000h,081h,077h,000h,0a3h,057h,000h,087h,057h,020h	; bb16  .............v..w..W..W
	defb 0e1h,0e1h,000h,0a1h,0a9h,000h,021h,021h,008h,061h,061h,000h,0e1h,0fdh,000h,061h,0fdh,000h,0a1h,0fdh,000h,0e1h,0fdh,000h	; bb2e  ......!!.aa....a........
	defb 087h,077h,000h,083h,077h,000h,081h,077h,000h,086h,077h,000h,085h,076h,000h,081h,077h,000h,0a3h,057h,000h,087h,057h,020h	; bb46  .w..w..w..w..v..w..W..W
	defb 0e1h,0fdh,000h,0a9h,0f5h,000h,021h,0f5h,008h,061h,0fdh,000h,0e1h,0fdh,000h,061h,0fdh,000h,0a1h,0fdh,000h,0e1h,0fdh,000h	; bb5e  ......!..a.....a........
	defb 00fh,0f0h,000h,000h,04fh,000h,000h,00fh,040h,000h,000h,000h,099h,09fh,000h,0c3h,0cfh,000h,0efh,0e7h,000h,0f3h,0ffh,000h	; bb76  ....O...@...............
	defb 0ffh,000h,000h,040h,0bfh,000h,000h,0bfh,040h,000h,000h,000h,099h,0ffh,000h,0c3h,0ffh,000h,0efh,0f7h,000h,0f3h,0ffh,000h	; bb8e  ...@....@...............
	defb 099h,09fh,000h,0ffh,0ffh,000h,004h,00bh,000h,000h,00bh,004h,0ffh,0ffh,000h,0ffh,0ffh,000h,0ffh,0ffh,000h,0ffh,0ffh,000h	; bba6  ........................
	defb 099h,0ffh,000h,0ffh,0ffh,000h,004h,0fbh,000h,000h,0fbh,004h,0ffh,0ffh,000h,0ffh,0ffh,000h,0ffh,0ffh,000h,0ffh,0ffh,000h	; bbbe  ........................
	defb 0ffh,0ffh,0ffh,000h,0ffh,0ffh,0ffh,000h,0ffh,0ffh,0ffh,000h,004h,085h,000h,081h,077h,000h,083h,077h,000h,087h,087h,020h	; bbd6  ................w..w...
	defb 0ffh,0ffh,0ffh,000h,0ffh,0ffh,0ffh,000h,0ffh,0ffh,0ffh,000h,0e1h,0e1h,000h,061h,0fdh,000h,0a1h,0fdh,000h,0e1h,0e1h,000h	; bbee  ...............a........
	defb 0ffh,0ffh,0ffh,000h,0ffh,0ffh,0ffh,000h,0ffh,0ffh,0ffh,000h,004h,085h,000h,081h,077h,000h,083h,077h,000h,087h,087h,020h	; bc06  ................w..w...
	defb 000h,0ffh,0ffh,0ffh,0ffh,000h,0ffh,0ffh,000h,006h,086h,000h,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,040h,0ffh,040h,040h,0bfh	; bc1e  ...................@.@@.
	defb 000h,0ffh,0ffh,0ffh,0ffh,000h,0ffh,0ffh,000h,061h,061h,000h,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh	; bc36  .........aa.............
	defb 000h,0ffh,0ffh,0ffh,0ffh,000h,0ffh,0ffh,000h,006h,086h,000h,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh	; bc4e  ........................
	defb 008h,0f4h,0ffh,0f9h,0fdh,006h,0f9h,0fdh,006h,061h,065h,006h,0f9h,0fdh,006h,0f8h,004h,0ffh,001h,045h,0feh,041h,045h,0beh	; bc66  .........ae........E.AE.
	defb 0fbh,0fbh,0fbh,004h,0f5h,0ffh,0f1h,004h,0ffh,0f9h,0fdh,006h,0e1h,0e5h,006h,061h,0fdh,006h,0a1h,0fdh,006h,0e1h,0e5h,006h	; bc7e  ...............a........

; ----------------------------------------------------------------------
; DATOS dibujo_BC96: 6 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 0 de la lista 0xA348 (p00:4D92, p00:4DF5); lo leen p00:4C0C (48
;   bytes)
;   0xbc96..0xbcc6  (48 bytes)
DATA_dibujo_BC96:
	defb 078h,078h,03ch,03ch,01eh,01eh,00fh,00fh	; bc96  xx<<....
	defb 00fh,01eh,03ch,078h,0f0h,0e1h,0c3h,087h	; bc9e  ..<x....
	defb 00fh,01eh,03ch,078h,0f0h,0e1h,0c3h,0ffh	; bca6  ..<x....
	defb 00fh,01eh,03ch,079h,0f1h,0e1h,0c3h,087h	; bcae  ..<y....
	defb 00fh,01fh,03fh,07fh,0ffh,0efh,0cfh,0ffh	; bcb6  ..?.....
	defb 001h,08fh,0c7h,0c7h,0efh,0efh,0ffh,0ffh	; bcbe  ........

; ----------------------------------------------------------------------
; DATOS dibujo_BCC6: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 1 de la lista 0xA348 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (32 bytes)
;   0xbcc6..0xbce6  (32 bytes)
DATA_dibujo_BCC6:
	defb 000h,000h,087h,0ffh,0c3h,0ffh,0c3h,0ffh,0e1h,0ffh,0e1h,0ffh,0f0h,0ffh,0f0h,0ffh	; bcc6  ................
	defb 01fh,018h,01fh,011h,01fh,013h,01fh,017h,01fh,013h,01fh,019h,01fh,01ch,0ffh,0fch	; bcd6  ................

; ----------------------------------------------------------------------
; DATOS dibujo_BCE6: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 2 de la lista 0xA348 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (16 bytes)
;   0xbce6..0xbcf6  (16 bytes)
DATA_dibujo_BCE6:
	defb 04fh,01fh,05eh,01fh,05ch,01fh,058h,01fh,030h,03fh,021h,03fh,003h,03fh,07fh,07fh	; bce6  O.^.\.X.0?!?.?..

; ----------------------------------------------------------------------
; DATOS dibujo_BCF6: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 3 de la lista 0xA348 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (32 bytes)
;   0xbcf6..0xbd16  (32 bytes)
DATA_dibujo_BCF6:
	defb 01bh,0f3h,01ah,0f3h,03ah,0f3h,07ah,0f3h,0fah,0f3h,0fbh,0f3h,0dbh,0f3h,09bh,0f3h	; bcf6  ....:.z.........
	defb 01bh,0f3h,01ah,0f3h,03ah,0f3h,07ah,0f3h,0fah,0f3h,0fbh,0f3h,0dbh,0f3h,0fbh,0f3h	; bd06  ....:.z.........

; ----------------------------------------------------------------------
; DATOS dibujo_BD16: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 4 de la lista 0xA348 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (32 bytes)
;   0xbd16..0xbd36  (32 bytes)
DATA_dibujo_BD16:
	defb 018h,077h,018h,077h,018h,077h,018h,077h,018h,076h,018h,076h,018h,076h,018h,076h	; bd16  .w.w.w.w.v.v.v.v
	defb 019h,077h,019h,077h,019h,077h,019h,077h,019h,077h,019h,077h,019h,077h,019h,077h	; bd26  .w.w.w.w.w.w.w.w

; ----------------------------------------------------------------------
; DATOS dibujo_BD36: 5 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 5 de la lista 0xA348 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (120 bytes)
;   0xbd36..0xbdae  (120 bytes)
DATA_dibujo_BD36:
	defb 07fh,0ffh,080h,07fh,0ffh,080h,03fh,0ffh,0c0h,03fh,0ffh,0c0h,03fh,0ffh,0c0h,07fh,0ffh,080h,073h,0ebh,080h,073h,0ebh,080h	; bd36  ......?..?..?.....s..s..
	defb 01ah,01eh,008h,01ah,01eh,008h,01ah,01eh,008h,07ah,03eh,008h,07ah,07eh,008h,01ah,01eh,008h,01ah,01eh,008h,0fbh,0ffh,008h	; bd4e  .........z>.z~..........
	defb 017h,077h,010h,016h,077h,011h,014h,077h,013h,010h,077h,017h,000h,06fh,00fh,001h,06fh,00eh,003h,06fh,00ch,007h,06fh,008h	; bd66  .w..w..w..w..o..o..o..o.
	defb 018h,075h,011h,018h,075h,011h,018h,075h,011h,018h,075h,011h,01ah,073h,011h,01ah,073h,011h,01bh,073h,010h,01bh,073h,010h	; bd7e  .u..u..u..u..s..s..s..s.
	defb 0ddh,099h,000h,0cfh,003h,001h,0dfh,09fh,003h,0ddh,09fh,005h,0d1h,09fh,001h,0f9h,0b7h,011h,0f9h,0f7h,031h,0d9h,0f7h,051h	; bd96  ....................1..Q

; ----------------------------------------------------------------------
; DATOS dibujo_BDAE: 1 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 16 de la lista 0xA348 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (24 bytes)
;   0xbdae..0xbdc6  (24 bytes)
DATA_dibujo_BDAE:
	defb 0ddh,099h,000h,0cfh,003h,001h,0dfh,09fh,003h,0ddh,09fh,005h,0d1h,09fh,001h,0f9h,0b7h,011h,0f9h,0f7h,031h,0d9h,0f7h,051h	; bdae  ....................1..Q

; ----------------------------------------------------------------------
; DATOS dibujo_BDC6: 4 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 17 de la lista 0xA348 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (64 bytes)
;   0xbdc6..0xbe06  (64 bytes)
DATA_dibujo_BDC6:
	defb 07fh,080h,07fh,080h,07fh,080h,019h,0c4h,019h,080h,07fh,080h,07fh,080h,07fh,080h	; bdc6  ................
	defb 0c0h,0ffh,0ffh,080h,07fh,080h,099h,0c4h,019h,080h,07fh,080h,07fh,080h,07fh,080h	; bdd6  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,099h,044h,099h,000h,0ffh,000h,0ffh,000h,0ffh,000h	; bde6  .......D........
	defb 000h,0ffh,0ffh,000h,0ffh,000h,099h,044h,099h,000h,0ffh,000h,0ffh,000h,0ffh,000h	; bdf6  .......D........

; ----------------------------------------------------------------------
; DATOS dibujo_BE06: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 18 de la lista 0xA348 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (32 bytes)
;   0xbe06..0xbe26  (32 bytes)
DATA_dibujo_BE06:
	defb 07fh,080h,03bh,0e6h,077h,0cch,03bh,0c4h,05dh,0a2h,03bh,0e6h,077h,0cch,03bh,0c4h	; be06  ....w...]...w...
	defb 0ffh,000h,0bbh,066h,077h,0cch,0bbh,044h,0ddh,022h,0bbh,066h,077h,0cch,0bbh,044h	; be16  ...fw..D.".fw..D

; ----------------------------------------------------------------------
; DATOS tabla_colores_BE26: 2 punteros a colores de dibujo (los usa hasta el
;   indice 1; p00:4DA0); lo leen p00:4DA0 (4 bytes)
;   0xbe26..0xbe2a  (4 bytes)
DATA_tabla_colores_BE26:
	defw 0be2ah,0be2eh	; be26  -> DATA_colores_BE2A DATA_colores_BE2E

; ----------------------------------------------------------------------
; DATOS colores_BE2A: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0xbe2a..0xbe2e  (4 bytes)
DATA_colores_BE2A:
	defb 078h,036h,0abh,0cfh	; be2a

; ----------------------------------------------------------------------
; DATOS colores_BE2E: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0xbe2e..0xbe32  (4 bytes)
DATA_colores_BE2E:
	defb 036h,078h,0bch,0efh	; be2e

; ----------------------------------------------------------------------
; DATOS lista_BE32: 3 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0xBE26); lo leen p00:4C26 (16 bytes)
;   0xbe32..0xbe42  (16 bytes)
DATA_lista_BE32:
	defb 009h,000h,001h,042h,0beh	; be32
	defb 087h,001h,00ah,08ah,0beh	; be37
	defb 084h,000h,011h,032h,0bfh	; be3c
	defb 0ffh	; be41

; ----------------------------------------------------------------------
; DATOS dibujo_BE42: 9 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 0 de la lista 0xBE32 (p00:4D92, p00:4DF5); lo leen p00:4C26 (72
;   bytes)
;   0xbe42..0xbe8a  (72 bytes)
DATA_dibujo_BE42:
	defb 0b8h,0e2h,098h,0e0h,080h,08ch,0e0h,0c1h	; be42  ........
	defb 03eh,007h,01fh,003h,001h,00eh,0c5h,003h	; be4a  >.......
	defb 08fh,0c1h,0a9h,0c7h,0f3h,0c9h,0efh,0f1h	; be52  ........
	defb 080h,084h,099h,0e0h,081h,082h,098h,0c2h	; be5a  ........
	defb 00fh,067h,019h,056h,063h,0f1h,063h,031h	; be62  .g.Vc.c1
	defb 0a9h,0c3h,081h,087h,099h,081h,04dh,083h	; be6a  ......M.
	defb 08ch,099h,081h,0c1h,080h,08ah,0a9h,0c3h	; be72  ........
	defb 067h,033h,071h,03ah,03bh,0e3h,0e1h,009h	; be7a  g3q:....
	defb 0e1h,09dh,0c3h,031h,001h,0c1h,037h,081h	; be82  ...1..7.

; ----------------------------------------------------------------------
; DATOS dibujo_BE8A: 7 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 1 de la lista 0xBE32 (p00:4D92, p00:4DF5); lo leen p00:4C26
;   (168 bytes)
;   0xbe8a..0xbf32  (168 bytes)
DATA_dibujo_BE8A:
	defb 085h,0fch,005h,086h,0fch,006h,0ffh,0ffh,007h,0ffh,0ffh,001h,0c1h,0ffh,000h,0f0h,0ffh,000h,0bfh,0ffh,000h,09fh,0ffh,000h	; be8a  ........................
	defb 044h,000h,044h,0afh,084h,0afh,082h,082h,082h,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,0ffh,000h,0f8h,0ffh,000h,0ffh,0ffh,000h	; bea2  D.D.....................
	defb 079h,07fh,040h,041h,07fh,040h,0fdh,07fh,0c0h,0ffh,0ffh,080h,083h,0ffh,000h,00fh,0ffh,000h,079h,0ffh,000h,0f1h,0ffh,000h	; beba  y.@A.@............y.....
	defb 0f0h,0ffh,00eh,080h,0ffh,00eh,0c0h,0ffh,00eh,0b0h,0ffh,00eh,081h,0ffh,00eh,0a9h,0ffh,00fh,0cfh,0feh,007h,087h,0feh,003h	; bed2  ........................
	defb 01fh,0ffh,0f0h,01dh,0ffh,0f0h,01fh,0ffh,0f0h,01dh,0ffh,0f0h,01dh,0ffh,0f0h,03dh,0ffh,0f0h,0fdh,0ffh,0f0h,07dh,07fh,040h	; beea  ...............=.....}.@
	defb 0f0h,0ffh,00eh,080h,0ffh,00eh,0c0h,0ffh,00eh,0b0h,0ffh,00eh,081h,0ffh,00eh,0a9h,0ffh,00eh,0cfh,0ffh,004h,08eh,0ffh,000h	; bf02  ........................
	defb 01fh,0ffh,0f0h,01dh,0ffh,0f0h,01fh,0ffh,0f0h,01dh,0ffh,0f0h,01dh,0ffh,0f0h,03dh,0ffh,0f0h,0fdh,0ffh,070h,0fdh,0ffh,000h	; bf1a  ...............=....p...

; ----------------------------------------------------------------------
; DATOS dibujo_BF32: 4 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 2 de la lista 0xBE32 (p00:4D92, p00:4DF5); lo leen p00:4C26
;   (96 bytes)
;   0xbf32..0xbf92  (96 bytes)
DATA_dibujo_BF32:
	defb 03ch,038h,038h,0c4h,044h,05ch,07ah,07ah,07eh,076h,04eh,07eh,0ffh,06ch,07ch,0cfh,0feh,0ceh,0ffh,000h,000h,001h,000h,000h	; bf32  <88.D\zz~vN~.l|.........
	defb 00ch,000h,000h,0b8h,038h,038h,044h,044h,07ch,042h,042h,05eh,0fbh,0fah,0feh,077h,0ceh,0feh,07dh,0efh,0ffh,038h,0ffh,03ah	; bf4a  ....88DD|BB^...w..}..8.:
	defb 00ch,000h,000h,0b8h,038h,038h,044h,044h,07ch,042h,042h,06eh,0ffh,0feh,0feh,05fh,0e6h,0feh,06dh,0f7h,0ffh,038h,0ffh,03ah	; bf62  ....88DD|BBn..._..m..8.:
	defb 00ch,000h,000h,0b8h,038h,038h,044h,044h,07ch,042h,042h,07eh,0f3h,0f2h,0feh,077h,0ceh,0feh,06dh,0dfh,0ffh,038h,0ffh,03ah	; bf7a  ....88DD|BB~...w..m..8.:

; ----------------------------------------------------------------------
; DATOS restos_finales_BF92: 110 bytes al final del banco detras del ultimo
;   bloque que se lee (dibujo_BF32): ningun lector del listado llega a ellos
;   ni los apunta ninguna tabla declarada
;   0xbf92..0xc000  (110 bytes)
DATA_restos_finales_BF92:
	defb 004h,028h,004h,036h,004h,02ah,004h,034h,008h,029h,004h,02ah,004h,035h,004h,02eh	; bf92  .(.6.*.4.).*.5..
	defb 002h,02ch,004h,031h,0ffh,028h,004h,02dh,004h,026h,004h,034h,004h,026h,004h,028h	; bfa2  .,.1.(.-.&.4.&.(
	defb 004h,036h,004h,02ah,004h,034h,008h,035h,004h,037h,004h,033h,004h,033h,004h,032h	; bfb2  .6.*.4.5.7.3.3.2
	defb 004h,034h,004h,036h,0ffh,02ch,004h,026h,004h,030h,006h,02ah,008h,029h,004h,02ah	; bfc2  .4.6.,.&.0.*.).*
	defb 004h,035h,004h,02eh,002h,02ch,004h,031h,0ffh,030h,006h,02ah,004h,028h,004h,02dh	; bfd2  .5...,.1.0.*.(.-
	defb 004h,026h,004h,031h,006h,02eh,002h,028h,004h,026h,004h,02fh,008h,029h,004h,02ah	; bfe2  .&.1...(.&./.).*
	defb 004h,035h,004h,02eh,002h,02ch,004h,031h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bff2  .5...,.1......
