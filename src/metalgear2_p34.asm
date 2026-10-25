; ==========================================================================
; METAL GEAR 2 SOLID SNAKE - Konami (1990) - MSX2 - MegaROM RC-767 de 512 KB (Konami SCC) - banco 34 (se ejecuta en 0xa000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x0a000


; ----------------------------------------------------------------------
; DATOS dibujo_9FEB_cola: 24 caracteres de 8x8 a 2 bits por punto (16 bytes
;   cada uno), ficha 2 de la lista 0x7146 (p00:4D92, p00:4DF5) (sigue del
;   banco 33); lo leen p00:4C0C (363 bytes)
;   0xa000..0xa16b  (363 bytes)
DATA_dibujo_9FEB_cola:
	defb 067h,027h,027h,010h,000h,010h,000h,010h,000h,010h,000h,0f0h,0f0h,0ffh,0f0h,0ffh	; a000  g''.............
	defb 0ffh,0f0h,0f0h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,03fh,03fh,03fh	; a010  .............???
	defb 03fh,03fh,03fh,080h,000h,080h,000h,080h,000h,080h,000h,000h,000h,03fh,03fh,03fh	; a020  ???..........???
	defb 03fh,03fh,03fh,09fh,000h,09bh,002h,09fh,000h,09bh,002h,07fh,070h,0ffh,0ffh,0f0h	; a030  ???.........p...
	defb 0f0h,0f0h,0f0h,09fh,000h,09bh,002h,09fh,000h,09bh,002h,030h,030h,0f0h,0f0h,0f0h	; a040  ...........00...
	defb 0f0h,0f0h,0f0h,01fh,000h,01bh,002h,01fh,000h,01bh,002h,0ffh,0f0h,0ffh,0ffh,0f0h	; a050  ................
	defb 0f0h,0f0h,0f0h,01fh,000h,01bh,002h,01fh,000h,01bh,002h,0ffh,000h,0ffh,0ffh,000h	; a060  ................
	defb 000h,000h,000h,0feh,000h,06eh,048h,0feh,000h,06eh,048h,000h,000h,000h,000h,000h	; a070  .....nH..nH.....
	defb 000h,000h,000h,0feh,000h,06eh,048h,0feh,000h,06eh,048h,000h,000h,0ffh,0ffh,0ffh	; a080  .....nH..nH.....
	defb 0ffh,0ffh,0ffh,0feh,000h,06eh,048h,0feh,000h,06eh,048h,09fh,000h,09bh,002h,09fh	; a090  .....nH..nH.....
	defb 000h,09bh,002h,09fh,000h,09bh,002h,09fh,000h,080h,000h,01fh,000h,01bh,002h,01fh	; a0a0  ................
	defb 000h,01bh,002h,01fh,000h,01bh,002h,01fh,000h,000h,000h,0feh,000h,06eh,048h,0feh	; a0b0  .............nH.
	defb 000h,06eh,048h,0feh,000h,06eh,048h,0feh,000h,000h,000h,070h,0b0h,070h,0b0h,070h	; a0c0  .nH..nH....p.p.p
	defb 0b0h,070h,0b0h,070h,0b0h,070h,0b0h,070h,0b0h,070h,0b0h,060h,0a0h,070h,0b0h,070h	; a0d0  .p.p.p.p.p.`.p.p
	defb 0b0h,070h,0b0h,070h,0b0h,070h,0b0h,070h,0b0h,070h,0b0h,040h,080h,060h,0a0h,070h	; a0e0  .p.p.p.p.p.@.`.p
	defb 0b0h,070h,0b0h,070h,0b0h,070h,0b0h,070h,0b0h,070h,0b0h,040h,080h,07fh,0a0h,07fh	; a0f0  .p.p.p.p.p.@....
	defb 0bfh,070h,0b0h,070h,0b0h,070h,0b0h,070h,0b0h,070h,0b0h,060h,0a0h,07fh,0b0h,07fh	; a100  .p.p.p.p.p.`....
	defb 0bfh,070h,0b0h,070h,0b0h,070h,0b0h,070h,0b0h,070h,0b0h,040h,080h,07fh,0bfh,07fh	; a110  .p.p.p.p.p.@....
	defb 0bfh,07fh,0bfh,070h,0b0h,070h,0b0h,070h,0b0h,070h,0b0h,070h,0b0h,0bfh,030h,0bfh	; a120  ...p.p.p.p.p..0.
	defb 03fh,0b0h,030h,0b0h,030h,0b0h,030h,0b0h,030h,0b0h,030h,070h,0b0h,0b0h,030h,0b0h	; a130  ?.0.0.0.0.0p..0.
	defb 030h,0b0h,030h,0b0h,030h,0b0h,030h,0b0h,030h,0b0h,030h,030h,0b0h,0b0h,030h,0b0h	; a140  0.0.0.0.0.00..0.
	defb 030h,0b0h,030h,0b0h,030h,0b0h,030h,0b0h,030h,0b0h,030h,040h,080h,040h,080h,040h	; a150  0.0.0.0.0.0@.@.@
	defb 080h,040h,080h,040h,080h,040h,080h,040h,080h,040h,080h	; a160  .@.@.@.@.@.

; ----------------------------------------------------------------------
; DATOS dibujo_A16B: 8 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 3 de la lista 0x7146 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (128 bytes)
;   0xa16b..0xa1eb  (128 bytes)
DATA_dibujo_A16B:
	defb 000h,0ffh,000h,080h,000h,080h,000h,080h,000h,080h,000h,080h,000h,080h,000h,080h	; a16b  ................
	defb 000h,0ffh,000h,080h,080h,000h,080h,000h,080h,000h,080h,000h,080h,000h,080h,000h	; a17b  ................
	defb 000h,0ffh,080h,000h,080h,000h,080h,000h,080h,000h,080h,000h,080h,000h,080h,000h	; a18b  ................
	defb 000h,0ffh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a19b  ................
	defb 000h,0ffh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a1ab  ................
	defb 000h,0ffh,080h,010h,090h,000h,090h,000h,090h,000h,090h,000h,090h,000h,090h,000h	; a1bb  ................
	defb 000h,0ffh,080h,000h,080h,000h,080h,000h,080h,000h,080h,000h,080h,000h,080h,000h	; a1cb  ................
	defb 000h,0ffh,000h,080h,080h,000h,080h,000h,080h,000h,080h,000h,080h,000h,080h,000h	; a1db  ................

; ----------------------------------------------------------------------
; DATOS dibujo_A1EB: 4 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 4 de la lista 0x7146 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (64 bytes)
;   0xa1eb..0xa22b  (64 bytes)
DATA_dibujo_A1EB:
	defb 0ffh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; a1eb  ................
	defb 0bfh,0c0h,03fh,080h,03fh,080h,03fh,080h,03fh,080h,03fh,080h,03fh,080h,03fh,080h	; a1fb  ..?.?.?.?.?.?.?.
	defb 0bfh,0c0h,0bfh,0c0h,0bfh,0c0h,0bfh,0c0h,0bfh,0c0h,0bfh,0c0h,0bfh,0c0h,0bfh,0c0h	; a20b  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; a21b  ................

; ----------------------------------------------------------------------
; DATOS dibujo_A22B: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 5 de la lista 0x7146 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (32 bytes)
;   0xa22b..0xa24b  (32 bytes)
DATA_dibujo_A22B:
	defb 0ffh,01fh,0ffh,01fh,0ffh,01fh,0ffh,01fh,0ffh,01fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; a22b  ................
	defb 03fh,000h,0ffh,000h,0feh,001h,0feh,001h,0ffh,000h,0ffh,000h,0ffh,000h,0bfh,080h	; a23b  ?...............

; ----------------------------------------------------------------------
; DATOS dibujo_A24B: 13 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 6 de la lista 0x7146 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (208 bytes)
;   0xa24b..0xa31b  (208 bytes)
DATA_dibujo_A24B:
	defb 0ffh,0fch,0feh,0fdh,0feh,0fdh,0feh,0fdh,0feh,0fdh,0feh,0fdh,0feh,0fdh,0ffh,0ffh	; a24b  ................
	defb 0ffh,0fch,0feh,0fdh,0feh,0fdh,0feh,0fdh,0feh,0fdh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; a25b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,000h,0ffh,000h,0ffh,000h,0ffh,0c0h,0bfh	; a26b  ................
	defb 0c0h,0bfh,0c1h,0bfh,0c0h,0bfh,0c1h,0bfh,0c0h,0bfh,0c1h,0bfh,0c0h,0bfh,0c1h,0bfh	; a27b  ................
	defb 0c0h,03fh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; a28b  .?..............
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,01fh,01fh,01fh,0ffh,01fh,0ffh,01fh,0ffh,01fh,0ffh	; a29b  ................
	defb 003h,0e3h,003h,0fbh,003h,0fbh,003h,0fbh,003h,0fbh,003h,0fbh,003h,0fbh,01fh,0ffh	; a2ab  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0c0h,0e0h,0e0h,0dfh,0e0h,0dfh,0e0h,0dfh,0fch,0fbh	; a2bb  ................
	defb 0fch,0fbh,0fch,0fbh,0fch,0fbh,0fch,0fbh,0fch,0fbh,0fch,0fbh,0fch,0fbh,0fch,0fbh	; a2cb  ................
	defb 0fch,0c3h,0e0h,0dfh,0e0h,0dfh,0e0h,0dfh,0e0h,0dfh,0e0h,0dfh,0e0h,0dfh,0fch,0fbh	; a2db  ................
	defb 0fch,0c3h,0e0h,0dfh,0e0h,0dfh,0e0h,0dfh,0e0h,0dfh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; a2eb  ................
	defb 03fh,03fh,03fh,0bfh,03fh,0bfh,03fh,0bfh,03fh,0bfh,03fh,0bfh,03fh,0bfh,0ffh,0ffh	; a2fb  ???.?.?.?.?.?...
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fch,0feh,0feh,0fdh,0feh,0fdh,0feh,0fdh,0ffh,0ffh	; a30b  ................

; ----------------------------------------------------------------------
; DATOS dibujo_A31B: 1 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 7 de la lista 0x7146 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (24 bytes)
;   0xa31b..0xa333  (24 bytes)
DATA_dibujo_A31B:
	defb 01fh,0ffh,000h,01fh,07fh,080h,09fh,07fh,080h,0dfh,07fh,000h,05fh,0ffh,000h,0dfh,0ffh,000h,01fh,03fh,000h,01fh,0ffh,000h	; a31b  ............_......?....

; ----------------------------------------------------------------------
; DATOS lista_A333: 20 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x0000); lo leen p00:4C0C (101 bytes)
;   0xa333..0xa398  (101 bytes)
DATA_lista_A333:
	defb 045h,00ah,001h,0f4h,0a3h	; a333
	defb 048h,00bh,006h,044h,0a4h	; a338
	defb 043h,00bh,00eh,0c4h,0a4h	; a33d
	defb 08ch,00ah,011h,0f4h,0a4h	; a342
	defb 045h,01ah,020h,014h,0a6h	; a347
	defb 084h,009h,025h,064h,0a6h	; a34c
	defb 003h,008h,030h,0c4h,0a6h	; a351
	defb 04ah,000h,033h,0dch,0a6h	; a356
	defb 049h,001h,03dh,07ch,0a7h	; a35b
	defb 042h,002h,046h,00ch,0a8h	; a360
	defb 041h,00ch,049h,02ch,0a8h	; a365
	defb 041h,00dh,04bh,03ch,0a8h	; a36a
	defb 084h,001h,04ch,04ch,0a8h	; a36f
	defb 086h,003h,050h,0ach,0a8h	; a374
	defb 083h,007h,056h,03ch,0a9h	; a379
	defb 081h,00ch,059h,084h,0a9h	; a37e
	defb 041h,002h,05dh,09ch,0a9h	; a383
	defb 082h,000h,060h,0ach,0a9h	; a388
	defb 081h,00bh,048h,0dch,0a9h	; a38d
	defb 081h,00bh,04ah,0f4h,0a9h	; a392
	defb 0ffh	; a397

; ----------------------------------------------------------------------
; DATOS lista_A398: 14 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x0000); lo leen p00:4C0C (71 bytes)
;   0xa398..0xa3df  (71 bytes)
DATA_lista_A398:
	defb 001h,004h,090h,00ch,0aah	; a398
	defb 001h,010h,091h,014h,0aah	; a39d
	defb 001h,00fh,092h,01ch,0aah	; a3a2
	defb 042h,00fh,094h,024h,0aah	; a3a7
	defb 04dh,004h,096h,044h,0aah	; a3ac
	defb 04ah,019h,0a4h,014h,0abh	; a3b1
	defb 046h,006h,0b0h,0b4h,0abh	; a3b6
	defb 041h,010h,0b6h,014h,0ach	; a3bb
	defb 081h,004h,0b7h,024h,0ach	; a3c0
	defb 041h,00fh,0f9h,03ch,0ach	; a3c5
	defb 083h,004h,0fah,04ch,0ach	; a3ca
	defb 042h,00fh,0fdh,094h,0ach	; a3cf
	defb 042h,019h,0bah,0b4h,0ach	; a3d4
	defb 082h,004h,0bch,0d4h,0ach	; a3d9
	defb 0ffh	; a3de

; ----------------------------------------------------------------------
; DATOS lista_A3DF: 4 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x0000); lo leen p00:4C0C (21 bytes)
;   0xa3df..0xa3f4  (21 bytes)
DATA_lista_A3DF:
	defb 089h,018h,0efh,004h,0adh	; a3df
	defb 041h,00fh,0f9h,03ch,0ach	; a3e4
	defb 083h,004h,0fah,04ch,0ach	; a3e9
	defb 042h,00fh,0fdh,094h,0ach	; a3ee
	defb 0ffh	; a3f3

; ----------------------------------------------------------------------
; DATOS dibujo_A3F4: 5 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 0 de la lista 0xA333 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (80 bytes)
;   0xa3f4..0xa444  (80 bytes)
DATA_dibujo_A3F4:
	defb 07fh,0f6h,0dfh,0ffh,0fah,0d7h,0ffh,0fbh,07fh,0deh,0deh,0f7h,0ffh,0beh,0fbh,0efh	; a3f4  ................
	defb 0ffh,0fdh,0b7h,0ffh,0fdh,0bfh,0ffh,0edh,07fh,0ffh,0f7h,0ffh,0fdh,06fh,0dfh,0ffh	; a404  .............o..
	defb 0ffh,002h,0f7h,048h,0ffh,000h,0efh,012h,0efh,040h,0ffh,000h,0fdh,012h,0ffh,080h	; a414  ...H.....@......
	defb 0ffh,000h,0ffh,040h,0ffh,000h,0ffh,00ah,0bfh,040h,0ffh,004h,0ffh,000h,0ffh,008h	; a424  ...@.....@......
	defb 0ffh,020h,0f7h,00ah,0ffh,000h,0ffh,084h,0ffh,000h,0ffh,008h,0ffh,022h,0ffh,000h	; a434  . ..........."..

; ----------------------------------------------------------------------
; DATOS dibujo_A444: 8 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 1 de la lista 0xA333 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (128 bytes)
;   0xa444..0xa4c4  (128 bytes)
DATA_dibujo_A444:
	defb 000h,000h,040h,000h,000h,000h,00ah,000h,040h,020h,004h,000h,000h,000h,008h,000h	; a444  ..@.....@ ......
	defb 002h,000h,040h,008h,000h,000h,002h,010h,050h,010h,000h,000h,010h,002h,080h,000h	; a454  ..@.....P.......
	defb 07fh,000h,037h,008h,01fh,000h,08fh,000h,0cfh,000h,06dh,002h,02fh,000h,08fh,000h	; a464  ..7.......m./...
	defb 0cch,000h,046h,020h,023h,000h,080h,000h,0ceh,001h,06fh,000h,02bh,004h,08fh,000h	; a474  ..F #.....o.+...
	defb 07fh,000h,03fh,000h,01fh,000h,00dh,002h,007h,000h,083h,000h,011h,000h,000h,000h	; a484  ..?.............
	defb 002h,000h,088h,000h,0c0h,000h,0e2h,000h,0f0h,000h,0f8h,000h,0ech,010h,07eh,080h	; a494  ..............~.
	defb 022h,033h,027h,027h,0efh,0efh,011h,011h,0f1h,0f1h,051h,051h,091h,091h,011h,011h	; a4a4  "3''......QQ....
	defb 0a2h,0b3h,062h,062h,0eeh,0eeh,090h,010h,09fh,01fh,094h,014h,092h,012h,093h,013h	; a4b4  ..bb............

; ----------------------------------------------------------------------
; DATOS dibujo_A4C4: 3 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 2 de la lista 0xA333 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (48 bytes)
;   0xa4c4..0xa4f4  (48 bytes)
DATA_dibujo_A4C4:
	defb 02ah,0c4h,024h,0c8h,024h,0c8h,024h,0c8h,024h,0c8h,024h,0c8h,024h,0c8h,024h,0c8h	; a4c4  *.$.$.$.$.$.$.$.
	defb 035h,0d9h,031h,0d1h,02fh,0cfh,021h,0c1h,023h,0cbh,020h,0cch,022h,0cch,022h,0cch	; a4d4  5.1./.!.#. .".".
	defb 0a2h,04ch,0a2h,04ch,0a2h,00ch,0a2h,00ch,082h,00ch,082h,00ch,092h,01ch,092h,01ch	; a4e4  .L.L............

; ----------------------------------------------------------------------
; DATOS dibujo_A4F4: 12 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 3 de la lista 0xA333 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (288 bytes)
;   0xa4f4..0xa614  (288 bytes)
DATA_dibujo_A4F4:
	defb 001h,001h,001h,07fh,001h,001h,040h,000h,000h,05fh,01dh,000h,04ah,01fh,000h,05fh,015h,000h,055h,01fh,000h,05dh,05bh,040h	; a4f4  ......@.._..J.._..U..][@
	defb 000h,000h,000h,07eh,000h,000h,002h,000h,000h,0dah,0f8h,000h,06ah,0b0h,000h,0bah,0f8h,000h,06ah,0d0h,000h,072h,0bah,002h	; a50c  ...~........j.....j..r..
	defb 01dh,00fh,000h,057h,01dh,000h,05ah,017h,000h,057h,00fh,000h,05eh,01bh,000h,07fh,001h,001h,001h,001h,001h,0ffh,0ffh,0ffh	; a524  ...W..Z..W..^...........
	defb 058h,0e8h,000h,0eah,0b8h,000h,03ah,0d0h,000h,0eah,078h,000h,0bah,0d8h,000h,07eh,000h,000h,000h,000h,000h,0ffh,0ffh,0ffh	; a53c  X.....:...x....~........
	defb 001h,001h,001h,07fh,001h,001h,000h,000h,000h,0b5h,0fbh,000h,0deh,06fh,000h,0a5h,0fbh,000h,06fh,0deh,000h,0bah,0f7h,000h	; a554  .............o....o.....
	defb 0adh,0ffh,000h,0fbh,07dh,000h,05fh,0eeh,000h,0f5h,0ffh,000h,0bfh,0eeh,000h,07fh,001h,001h,001h,001h,001h,0ffh,0ffh,0ffh	; a56c  ....}._.................
	defb 013h,01fh,000h,05dh,016h,000h,04ah,01fh,000h,055h,01bh,000h,04eh,01fh,000h,05bh,015h,000h,04eh,01fh,000h,053h,05dh,040h	; a584  ...]..J..U..N..[..N..S]@
	defb 058h,0f8h,000h,0f0h,0e8h,000h,0eah,0b8h,000h,052h,0f8h,000h,0fah,0e8h,000h,0aah,078h,000h,07ah,0d8h,000h,0cah,0f2h,002h	; a59c  X........R......x.z.....
	defb 005h,080h,0fah,004h,080h,08ah,060h,011h,015h,018h,005h,005h,084h,062h,072h,022h,010h,058h,010h,009h,02dh,050h,029h,02bh	; a5b4  ......`......br".X..-P)+
	defb 057h,008h,0a8h,01dh,042h,0e2h,000h,024h,0b7h,000h,05bh,0ffh,010h,0a4h,0edh,008h,061h,0f1h,011h,042h,0c2h,022h,054h,0d4h	; a5cc  W...B..$..[.....a..B."T.
	defb 0f5h,000h,00ah,0e5h,000h,01ah,004h,020h,0f2h,000h,084h,08eh,060h,012h,01bh,010h,00ch,02dh,00ch,062h,073h,024h,013h,01bh	; a5e4  ....... ....`....-.bs$..
	defb 053h,000h,0a8h,000h,024h,0ach,004h,049h,0d9h,009h,052h,0f6h,051h,082h,0aah,050h,0a2h,0abh,04dh,080h,0b2h,042h,010h,0b5h	; a5fc  S...$..I..R.Q..P..M..B..

; ----------------------------------------------------------------------
; DATOS dibujo_A614: 5 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 4 de la lista 0xA333 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (80 bytes)
;   0xa614..0xa664  (80 bytes)
DATA_dibujo_A614:
	defb 096h,075h,065h,09ch,0bbh,057h,0d4h,0c2h,0ddh,037h,0afh,09dh,037h,0e8h,0dfh,034h	; a614  .ue..W...7..7..4
	defb 07eh,002h,06eh,0c5h,0d5h,019h,0e4h,037h,0d9h,07eh,087h,02bh,0f7h,05ch,0bfh,054h	; a624  ~.n....7.~.+.\.T
	defb 0fdh,001h,0b0h,08bh,03bh,0ech,0afh,078h,0a9h,075h,0b3h,088h,02dh,0fbh,0bbh,066h	; a634  .......x.u..-..f
	defb 0efh,090h,0e7h,046h,0ffh,030h,0f3h,0a8h,0f6h,04ch,0dah,077h,0e6h,053h,0ffh,04ah	; a644  ...F.0...L.w.S.J
	defb 0ffh,000h,0ffh,000h,0ffh,0c3h,0dfh,004h,0ffh,092h,0fbh,040h,0beh,088h,0ffh,02ah	; a654  ...........@...*

; ----------------------------------------------------------------------
; DATOS dibujo_A664: 4 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 5 de la lista 0xA333 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (96 bytes)
;   0xa664..0xa6c4  (96 bytes)
DATA_dibujo_A664:
	defb 0fch,003h,0f8h,038h,0c7h,0f3h,0d3h,02ch,09ch,0d7h,028h,088h,0d8h,027h,0ach,03bh,0c4h,0f0h,0d4h,02bh,08ah,0d9h,026h,07ch	; a664  ...8...,..(..'.....+..&|
	defb 0e2h,01dh,0d9h,0f9h,006h,064h,0ech,013h,0aah,014h,0ebh,0d2h,0e8h,017h,0dah,0b2h,04dh,068h,0dfh,020h,010h,0ebh,014h,0c8h	; a67c  .....d..........Mh. ....
	defb 044h,00ah,0bbh,061h,096h,0d8h,0e4h,01bh,026h,012h,0edh,05ah,0cbh,034h,02dh,025h,0dah,039h,095h,06ah,0dch,04bh,0b4h,0eah	; a694  D..a....&..Z.4-%.9.j.K..
	defb 004h,0e3h,078h,00bh,0d4h,0a3h,0cch,033h,034h,092h,06dh,0f5h,0a5h,05ah,0eah,0ach,053h,0f9h,0dbh,024h,0eah,0dbh,024h,06ah	; a6ac  ..x....34.m..Z..S..$..$j

; ----------------------------------------------------------------------
; DATOS dibujo_A6C4: 3 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 6 de la lista 0xA333 (p00:4D92, p00:4DF5); lo leen p00:4C0C (24
;   bytes)
;   0xa6c4..0xa6dc  (24 bytes)
DATA_dibujo_A6C4:
	defb 000h,000h,000h,000h,000h,000h,000h,000h	; a6c4  ........
	defb 000h,000h,000h,000h,080h,080h,080h,080h	; a6cc  ........
	defb 0c0h,0c0h,0c0h,0c0h,0e0h,0e0h,0e0h,0e0h	; a6d4  ........

; ----------------------------------------------------------------------
; DATOS dibujo_A6DC: 10 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 7 de la lista 0xA333 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (160 bytes)
;   0xa6dc..0xa77c  (160 bytes)
DATA_dibujo_A6DC:
	defb 07fh,080h,0fdh,002h,05fh,0a0h,07dh,082h,055h,0aah,050h,0afh,000h,0ffh,000h,000h	; a6dc  ...._.}.U.P.....
	defb 0bbh,022h,0d7h,004h,0cfh,008h,0efh,000h,0efh,000h,0efh,000h,0dfh,000h,0bfh,020h	; a6ec  .".............
	defb 0ffh,000h,077h,080h,06eh,099h,0ffh,000h,02ah,091h,04ch,0f7h,000h,0ffh,000h,000h	; a6fc  ..w.n...*.L.....
	defb 0dfh,000h,0dfh,010h,0e3h,000h,0fbh,002h,0fdh,000h,0fdh,000h,0ffh,000h,0fdh,000h	; a70c  ................
	defb 0ffh,000h,0efh,000h,0dfh,010h,0ffh,020h,0fbh,000h,0ffh,004h,0ffh,000h,0ffh,000h	; a71c  ....... ........
	defb 0fdh,002h,0efh,000h,0edh,00ah,055h,0a2h,04ch,0a3h,010h,0dfh,010h,09fh,020h,000h	; a72c  ......U.L..... .
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0e7h,000h,0dfh,004h,0dfh,004h,0ffh,018h	; a73c  ................
	defb 0bah,022h,0d4h,006h,0cch,00ah,0eeh,000h,0ech,002h,0e8h,006h,0f4h,002h,0f8h,000h	; a74c  ."..............
	defb 0f8h,006h,0ech,002h,0d8h,016h,0f8h,026h,0f8h,002h,0fch,006h,0f8h,006h,0fch,002h	; a75c  .......&........
	defb 0f8h,006h,074h,082h,068h,09eh,068h,096h,020h,09ah,044h,0feh,000h,0feh,000h,000h	; a76c  ..t.h.h. .D.....

; ----------------------------------------------------------------------
; DATOS dibujo_A77C: 9 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 8 de la lista 0xA333 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (144 bytes)
;   0xa77c..0xa80c  (144 bytes)
DATA_dibujo_A77C:
	defb 06eh,0e7h,06fh,0e7h,06fh,0e7h,068h,0e0h,06fh,0e0h,07fh,0ffh,07fh,0ffh,000h,000h	; a77c  n.o.o.h.o.......
	defb 000h,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,0ffh,000h,0ffh,0ffh,0ffh,0ffh,000h,000h	; a78c  ................
	defb 020h,09fh,0bfh,0ffh,0ffh,0ffh,000h,000h,0ffh,000h,0f3h,0f7h,0edh,0edh,000h,000h	; a79c   ...............
	defb 06eh,0e6h,06eh,0e6h,06eh,0e6h,06eh,0e6h,06eh,0e6h,06eh,0e6h,06eh,0e6h,06eh,0e6h	; a7ac  n.n.n.n.n.n.n.n.
	defb 06eh,0e6h,0eeh,0e6h,0eeh,0e6h,00eh,006h,0feh,006h,0feh,0feh,0feh,0feh,000h,000h	; a7bc  n...............
	defb 0feh,000h,0feh,000h,0feh,000h,0feh,000h,0fdh,001h,0fdh,001h,0fdh,001h,0fdh,001h	; a7cc  ................
	defb 0fbh,003h,0fbh,003h,0fbh,003h,0fbh,003h,0f7h,007h,0f7h,007h,0f7h,007h,0f7h,007h	; a7dc  ................
	defb 0e7h,007h,0ebh,00fh,0efh,007h,0ebh,007h,0dfh,017h,0dbh,017h,0dfh,017h,0dbh,017h	; a7ec  ................
	defb 0bfh,037h,0bbh,037h,0bfh,037h,0bbh,037h,07fh,077h,07fh,077h,07bh,077h,07fh,077h	; a7fc  .7.7.7.7.w.w{w.w

; ----------------------------------------------------------------------
; DATOS dibujo_A80C: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 9 de la lista 0xA333 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (32 bytes)
;   0xa80c..0xa82c  (32 bytes)
DATA_dibujo_A80C:
	defb 0efh,0e0h,0edh,0e0h,0edh,0e2h,0efh,0e0h,0efh,0e8h,0efh,0e8h,0efh,0e8h,0efh,0e8h	; a80c  ................
	defb 0efh,0ech,0efh,0ech,0efh,0ech,0efh,0ech,0efh,0eeh,0efh,0eeh,0efh,0eeh,0efh,0eeh	; a81c  ................

; ----------------------------------------------------------------------
; DATOS dibujo_A82C: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 10 de la lista 0xA333 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (16 bytes)
;   0xa82c..0xa83c  (16 bytes)
DATA_dibujo_A82C:
	defb 000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,000h	; a82c  ................

; ----------------------------------------------------------------------
; DATOS dibujo_A83C: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 11 de la lista 0xA333 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (16 bytes)
;   0xa83c..0xa84c  (16 bytes)
DATA_dibujo_A83C:
	defb 08dh,06dh,08bh,06bh,089h,069h,08fh,06fh,08dh,06dh,08bh,06bh,089h,069h,08fh,06fh	; a83c  .m.k.i.o.m.k.i.o

; ----------------------------------------------------------------------
; DATOS dibujo_A84C: 4 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 12 de la lista 0xA333 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (96 bytes)
;   0xa84c..0xa8ac  (96 bytes)
DATA_dibujo_A84C:
	defb 002h,07dh,000h,07eh,0fdh,000h,0feh,0fdh,000h,083h,080h,000h,0bfh,081h,000h,0feh,0fdh,000h,07eh,07dh,000h,001h,001h,000h	; a84c  .}.~..............~}....
	defb 080h,07eh,001h,0bfh,07fh,000h,0bfh,07fh,000h,0c1h,001h,000h,0fdh,041h,000h,0bfh,07fh,000h,0beh,07eh,000h,040h,040h,000h	; a864  .~...........A.....~.@@.
	defb 061h,07fh,000h,05ch,07fh,023h,047h,07fh,038h,056h,06fh,039h,057h,06fh,038h,044h,07fh,03bh,05fh,07fh,020h,040h,07fh,03fh	; a87c  a..\.#G.8Vo9Wo8D.._. @.?
	defb 085h,0fdh,000h,039h,0fdh,0c4h,0e1h,0fdh,01ch,069h,0f5h,09ch,0e9h,0f5h,01ch,021h,0fdh,0dch,0f9h,0fdh,004h,001h,0fdh,0fch	; a894  ...9.....i.....!........

; ----------------------------------------------------------------------
; DATOS dibujo_A8AC: 6 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 13 de la lista 0xA333 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (144 bytes)
;   0xa8ac..0xa93c  (144 bytes)
DATA_dibujo_A8AC:
	defb 090h,06fh,0efh,090h,06fh,0efh,098h,06fh,0e8h,09fh,068h,0e8h,098h,06fh,0efh,098h,06fh,0efh,098h,06fh,0e8h,09fh,068h,0e8h	; a8ac  .o..o..o..h..o..o..o..h.
	defb 009h,0f6h,0eeh,009h,0f6h,0eeh,009h,0f6h,00eh,0f9h,006h,00eh,009h,0f6h,0eeh,009h,0f6h,0eeh,009h,0f6h,00eh,0f9h,006h,00eh	; a8c4  ........................
	defb 000h,0ffh,0ffh,001h,0fdh,0feh,005h,0f5h,008h,0dfh,01fh,020h,07fh,07fh,080h,0fdh,0fdh,002h,0fdh,0fdh,000h,0ffh,0ffh,000h	; a8dc  ........... ............
	defb 000h,0ffh,0ffh,000h,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,000h,000h,0ffh,0ffh,001h,0fdh,0feh,007h,0f7h,008h,0dfh,01fh,020h	; a8f4  .......................
	defb 0efh,0e0h,0efh,0e0h,0efh,0efh,0efh,0e8h,0e8h,0efh,0efh,0efh,0efh,0edh,0edh,0eeh,0efh,0efh,0eeh,0efh,0eeh,0efh,0eeh,0eeh	; a90c  ........................
	defb 091h,0eeh,0cch,0d1h,0eeh,0cch,0f1h,0eeh,0ech,0e1h,0eeh,0ech,0e9h,0eeh,0ech,0edh,0eeh,0ech,0efh,0eeh,0eeh,0efh,0efh,0efh	; a924  ........................

; ----------------------------------------------------------------------
; DATOS dibujo_A93C: 3 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 14 de la lista 0xA333 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (72 bytes)
;   0xa93c..0xa984  (72 bytes)
DATA_dibujo_A93C:
	defb 0ffh,000h,0ffh,0ffh,000h,0ffh,0ffh,0ffh,000h,000h,0ffh,000h,0ffh,0c0h,0ffh,03fh,0f0h,0ffh,00fh,03fh,03ch,003h,00fh,00fh	; a93c  ...............?...?<...
	defb 0ffh,0c0h,0ffh,03fh,0f0h,0ffh,04fh,0ffh,0fch,003h,08fh,08fh,000h,083h,083h,000h,080h,080h,040h,0c0h,0c0h,000h,000h,000h	; a954  ...?..O...........@.....
	defb 0ffh,0e0h,000h,0ffh,0e2h,000h,00fh,01ah,0e8h,06fh,01ah,0e8h,06fh,01ah,0e8h,06bh,01fh,0e8h,06bh,01fh,0e8h,06eh,01eh,0eeh	; a96c  .........o..o..k..k..n..

; ----------------------------------------------------------------------
; DATOS dibujo_A984: 1 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 15 de la lista 0xA333 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (24 bytes)
;   0xa984..0xa99c  (24 bytes)
DATA_dibujo_A984:
	defb 0efh,0ceh,001h,0edh,0ceh,001h,0efh,0c8h,007h,0e7h,0c0h,00fh,0e7h,0d0h,00fh,0f7h,0c0h,03fh,0b7h,0c0h,03fh,077h,080h,07fh	; a984  .................?..?w..

; ----------------------------------------------------------------------
; DATOS dibujo_A99C: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 16 de la lista 0xA333 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (16 bytes)
;   0xa99c..0xa9ac  (16 bytes)
DATA_dibujo_A99C:
	defb 0ffh,0ffh,000h,000h,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,000h,000h	; a99c  ................

; ----------------------------------------------------------------------
; DATOS dibujo_A9AC: 2 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 17 de la lista 0xA333 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (48 bytes)
;   0xa9ac..0xa9dc  (48 bytes)
DATA_dibujo_A9AC:
	defb 080h,00bh,0fbh,00fh,030h,0ffh,03fh,040h,0f5h,0ffh,000h,0ffh,080h,03fh,080h,080h,040h,080h,095h,040h,095h,095h,04ah,095h	; a9ac  ....0.?@.....?..@..@..J.
	defb 020h,0d8h,0e7h,0f8h,004h,0fbh,0feh,000h,0ffh,0feh,001h,0feh,002h,0f9h,002h,002h,005h,002h,0aah,005h,0aah,0aah,055h,0aah	; a9c4   .....................U.

; ----------------------------------------------------------------------
; DATOS dibujo_A9DC: 1 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 18 de la lista 0xA333 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (24 bytes)
;   0xa9dc..0xa9f4  (24 bytes)
DATA_dibujo_A9DC:
	defb 000h,00fh,0ffh,0f8h,007h,0f0h,0f8h,0f7h,0f0h,0f8h,0f7h,0f0h,0f8h,0f7h,0f0h,0f8h,0f7h,0f0h,0ffh,0f0h,0f0h,0f0h,0f0h,0f0h	; a9dc  ........................

; ----------------------------------------------------------------------
; DATOS dibujo_A9F4: 1 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 19 de la lista 0xA333 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (24 bytes)
;   0xa9f4..0xaa0c  (24 bytes)
DATA_dibujo_A9F4:
	defb 000h,0e0h,0efh,02fh,0c0h,00fh,02fh,0cfh,00fh,02fh,0cfh,00fh,02fh,0cfh,00fh,02fh,0cfh,00fh,0efh,00fh,00fh,00fh,00fh,00fh	; a9f4  .../../../../../........

; ----------------------------------------------------------------------
; DATOS dibujo_AA0C: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 0 de la lista 0xA398 (p00:4D92, p00:4DF5); lo leen p00:4C0C (8
;   bytes)
;   0xaa0c..0xaa14  (8 bytes)
DATA_dibujo_AA0C:
	defb 0b6h,0b6h,0b6h,0b6h,0b6h,0b6h,0b6h,0b6h	; aa0c  ........

; ----------------------------------------------------------------------
; DATOS dibujo_AA14: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 1 de la lista 0xA398 (p00:4D92, p00:4DF5); lo leen p00:4C0C (8
;   bytes)
;   0xaa14..0xaa1c  (8 bytes)
DATA_dibujo_AA14:
	defb 07fh,07fh,07fh,07fh,07fh,07fh,07fh,07fh	; aa14  ........

; ----------------------------------------------------------------------
; DATOS dibujo_AA1C: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 2 de la lista 0xA398 (p00:4D92, p00:4DF5); lo leen p00:4C0C (8
;   bytes)
;   0xaa1c..0xaa24  (8 bytes)
DATA_dibujo_AA1C:
	defb 0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh	; aa1c  ........

; ----------------------------------------------------------------------
; DATOS dibujo_AA24: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 3 de la lista 0xA398 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (32 bytes)
;   0xaa24..0xaa44  (32 bytes)
DATA_dibujo_AA24:
	defb 001h,001h,003h,000h,005h,004h,00dh,000h,01dh,000h,02dh,020h,06dh,040h,0edh,080h	; aa24  ..........- m@..
	defb 06dh,080h,06dh,080h,06dh,080h,06dh,080h,06dh,080h,06dh,080h,06dh,080h,06dh,080h	; aa34  m.m.m.m.m.m.m.m.

; ----------------------------------------------------------------------
; DATOS dibujo_AA44: 13 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 4 de la lista 0xA398 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (208 bytes)
;   0xaa44..0xab14  (208 bytes)
DATA_dibujo_AA44:
	defb 080h,0c0h,098h,0c7h,09fh,0c0h,087h,0c0h,080h,0c0h,098h,0c7h,09fh,0c0h,087h,0c0h	; aa44  ................
	defb 000h,000h,008h,0f7h,0bfh,000h,0fdh,000h,000h,000h,000h,0ffh,0ffh,000h,0ffh,000h	; aa54  ................
	defb 000h,000h,000h,0ffh,09fh,060h,0cdh,002h,000h,000h,000h,0ffh,0ffh,000h,0ffh,000h	; aa64  .....`..........
	defb 000h,000h,000h,0ffh,0ffh,000h,0ffh,000h,000h,000h,000h,0ffh,0ffh,000h,0ffh,000h	; aa74  ................
	defb 002h,003h,00ah,0f3h,0fah,003h,0fah,003h,002h,003h,00ah,0f3h,0fah,003h,0fah,003h	; aa84  ................
	defb 0ffh,0ffh,080h,0ffh,080h,0c0h,09fh,0c0h,080h,0c0h,09dh,0c5h,09ch,0c1h,085h,0c0h	; aa94  ................
	defb 0ffh,0ffh,000h,0ffh,000h,000h,0ffh,000h,000h,000h,055h,055h,000h,055h,055h,000h	; aaa4  ..........UU.UU.
	defb 0ffh,0ffh,000h,0ffh,000h,000h,0ffh,000h,000h,000h,000h,0ffh,0ffh,000h,0ffh,000h	; aab4  ................
	defb 0feh,0ffh,002h,0ffh,002h,003h,0fah,003h,002h,003h,05ah,053h,01ah,043h,05ah,003h	; aac4  ..........ZS.CZ.
	defb 080h,0c0h,09dh,0c5h,09ch,0c1h,085h,0c0h,080h,0c0h,09fh,0c0h,0ffh,0ffh,000h,0ffh	; aad4  ................
	defb 000h,000h,055h,055h,000h,055h,055h,000h,000h,000h,0ffh,000h,0ffh,0ffh,000h,0ffh	; aae4  ..UU.UU.........
	defb 000h,000h,000h,0ffh,0ffh,000h,0ffh,000h,000h,000h,0ffh,000h,0ffh,0ffh,000h,0ffh	; aaf4  ................
	defb 002h,003h,05eh,053h,01ah,043h,05ah,003h,002h,003h,0fah,003h,0feh,0ffh,000h,0ffh	; ab04  ..^S.CZ.........

; ----------------------------------------------------------------------
; DATOS dibujo_AB14: 10 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 5 de la lista 0xA398 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (160 bytes)
;   0xab14..0xabb4  (160 bytes)
DATA_dibujo_AB14:
	defb 0ffh,080h,0bfh,000h,0bfh,020h,0bfh,010h,0b7h,000h,0b7h,004h,0b7h,002h,0b7h,001h	; ab14  ..... ..........
	defb 07eh,0edh,07eh,0edh,07eh,0edh,07eh,0edh,07dh,0eeh,07dh,0eeh,07dh,0eeh,078h,0eeh	; ab24  ~.~.~.~.}.}.}.x.
	defb 004h,0fbh,0fbh,000h,0fbh,004h,0ffh,000h,0dfh,000h,0dfh,020h,0fbh,000h,000h,000h	; ab34  ........... ....
	defb 000h,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,000h,000h	; ab44  ................
	defb 000h,0ffh,0ffh,000h,0e7h,000h,0dbh,004h,0dbh,004h,0e7h,018h,0ffh,000h,000h,000h	; ab54  ................
	defb 078h,0efh,07bh,0ech,07bh,0ech,073h,0ech,077h,0e8h,076h,0e8h,077h,0e8h,070h,0e8h	; ab64  x.{.{.s.w.v.w.p.
	defb 060h,0ffh,06fh,0f0h,06dh,0f0h,04fh,0f0h,05fh,0e0h,05fh,0e0h,057h,0e0h,008h,0e0h	; ab74  `.o.m.O._._.W...
	defb 000h,0ffh,0ffh,000h,0f3h,004h,0f3h,004h,0e7h,008h,0ffh,000h,0cch,011h,000h,000h	; ab84  ................
	defb 0ffh,0feh,0efh,0feh,0edh,0feh,0a5h,0feh,0a5h,0feh,001h,0feh,0ffh,000h,000h,000h	; ab94  ................
	defb 000h,07fh,015h,06ah,015h,040h,015h,040h,03fh,040h,021h,050h,03fh,040h,000h,000h	; aba4  ...j.@.@?@!P?@..

; ----------------------------------------------------------------------
; DATOS dibujo_ABB4: 6 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 6 de la lista 0xA398 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (96 bytes)
;   0xabb4..0xac14  (96 bytes)
DATA_dibujo_ABB4:
	defb 004h,0f8h,0fch,000h,0fch,000h,0f8h,000h,0f0h,004h,0e6h,008h,0e6h,008h,000h,000h	; abb4  ................
	defb 036h,000h,036h,000h,036h,000h,036h,000h,0b6h,000h,0b6h,000h,0b6h,000h,036h,000h	; abc4  6.6.6.6.......6.
	defb 006h,0e0h,0f6h,000h,036h,040h,096h,020h,0cah,010h,00ah,010h,0fah,000h,002h,000h	; abd4  ....6@. ........
	defb 0d6h,000h,0d6h,000h,0d6h,000h,0d6h,000h,0e6h,000h,0e6h,000h,0e6h,000h,006h,000h	; abe4  ................
	defb 021h,0deh,0cch,011h,0cfh,010h,0ffh,000h,09fh,020h,09fh,020h,03fh,040h,000h,000h	; abf4  !........ . ?@..
	defb 000h,0ffh,03fh,0c0h,037h,0c0h,077h,080h,071h,088h,078h,086h,07fh,080h,000h,000h	; ac04  ..?.7.w.q.x.....

; ----------------------------------------------------------------------
; DATOS dibujo_AC14: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 7 de la lista 0xA398 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (16 bytes)
;   0xac14..0xac24  (16 bytes)
DATA_dibujo_AC14:
	defb 07fh,000h,07fh,000h,07fh,000h,07fh,000h,07fh,000h,07fh,000h,0ffh,0ffh,000h,0ffh	; ac14  ................

; ----------------------------------------------------------------------
; DATOS dibujo_AC24: 1 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 8 de la lista 0xA398 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (24 bytes)
;   0xac24..0xac3c  (24 bytes)
DATA_dibujo_AC24:
	defb 080h,088h,077h,080h,088h,077h,080h,0cah,035h,080h,0dah,025h,080h,0fbh,004h,000h,07fh,080h,0ffh,000h,000h,000h,000h,000h	; ac24  ..w..w..5..%............

; ----------------------------------------------------------------------
; DATOS dibujo_AC3C: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 9 de la lista 0xA398 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (16 bytes)
;   0xac3c..0xac4c  (16 bytes)
DATA_dibujo_AC3C:
	defb 000h,000h,07fh,07fh,07fh,040h,07fh,040h,040h,07fh,040h,07fh,040h,03fh,000h,000h	; ac3c  .....@.@@.@.@?..

; ----------------------------------------------------------------------
; DATOS dibujo_AC4C: 3 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 10 de la lista 0xA398 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (72 bytes)
;   0xac4c..0xac94  (72 bytes)
DATA_dibujo_AC4C:
	defb 0ffh,000h,000h,0ffh,0ffh,00fh,018h,01fh,0e8h,01bh,01fh,0e8h,01fh,0f8h,008h,018h,0f8h,008h,00fh,0efh,01fh,0ffh,00fh,00fh	; ac4c  ........................
	defb 0ffh,000h,000h,0ffh,0ffh,0ffh,000h,0ffh,000h,0ffh,0ffh,000h,0ffh,000h,000h,000h,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; ac64  ........................
	defb 0ffh,000h,000h,0ffh,0ffh,0f0h,018h,0f8h,017h,0d8h,0f8h,017h,0f8h,01fh,010h,010h,017h,018h,0f0h,0f7h,0f8h,0ffh,0f0h,0f0h	; ac7c  ........................

; ----------------------------------------------------------------------
; DATOS dibujo_AC94: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 11 de la lista 0xA398 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (32 bytes)
;   0xac94..0xacb4  (32 bytes)
DATA_dibujo_AC94:
	defb 000h,000h,0ffh,0ffh,0ffh,000h,0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,000h	; ac94  ................
	defb 000h,000h,0feh,0feh,0feh,002h,0feh,002h,002h,0feh,002h,0fch,002h,0fch,000h,000h	; aca4  ................

; ----------------------------------------------------------------------
; DATOS dibujo_ACB4: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 12 de la lista 0xA398 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (32 bytes)
;   0xacb4..0xacd4  (32 bytes)
DATA_dibujo_ACB4:
	defb 000h,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,000h,000h,0feh,000h,0ffh,0feh,0ffh,0feh	; acb4  ................
	defb 000h,0feh,0beh,000h,0beh,040h,0feh,000h,000h,000h,0feh,000h,0ffh,0feh,0ffh,0feh	; acc4  .....@..........

; ----------------------------------------------------------------------
; DATOS dibujo_ACD4: 2 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 13 de la lista 0xA398 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (48 bytes)
;   0xacd4..0xad04  (48 bytes)
DATA_dibujo_ACD4:
	defb 000h,0ffh,000h,077h,080h,000h,076h,088h,000h,07fh,080h,000h,000h,000h,000h,07fh,000h,080h,080h,080h,07fh,080h,080h,07fh	; acd4  ...w..v.................
	defb 000h,0ffh,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh,000h,000h,000h,000h,000h,07fh,000h,080h,080h,080h,07fh,080h,080h,07fh	; acec  ........................

; ----------------------------------------------------------------------
; DATOS dibujo_AD04: 9 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 0 de la lista 0xA3DF (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (216 bytes)
;   0xad04..0xaddc  (216 bytes)
DATA_dibujo_AD04:
	defb 000h,000h,0ffh,0ffh,000h,0ffh,0ffh,0ffh,000h,000h,000h,000h,0ffh,0ffh,0ffh,07fh,07fh,055h,022h,022h,066h,055h,055h,0ffh	; ad04  .................U""fUU.
	defb 001h,001h,0feh,0ffh,001h,0feh,0ffh,0fdh,002h,003h,001h,002h,0fbh,0f9h,0fah,07bh,079h,052h,027h,025h,062h,053h,051h,0fah	; ad1c  ...............{yR'%bSQ.
	defb 000h,000h,07fh,07fh,000h,07fh,07fh,03fh,040h,0e0h,0a0h,040h,07fh,03fh,05fh,06fh,02fh,045h,072h,032h,046h,065h,025h,04fh	; ad34  .......?@..@.?_o/Er2Fe%O
	defb 0cfh,0cdh,09ah,053h,051h,0fah,037h,035h,062h,053h,051h,0fah,0cfh,0cdh,09ah,013h,011h,0bah,037h,035h,062h,053h,051h,0fah	; ad4c  ...SQ.75bSQ.......75bSQ.
	defb 07ch,03ch,049h,065h,025h,04fh,073h,033h,046h,065h,025h,04fh,07dh,03dh,048h,060h,020h,05fh,07eh,020h,05fh,061h,020h,05fh	; ad64  |<Ie%Os3Fe%O}=H` _~ _a _
	defb 061h,02eh,05bh,060h,020h,05fh,060h,020h,05fh,060h,020h,05fh,07fh,026h,040h,07fh,02ch,040h,062h,022h,042h,065h,025h,04fh	; ad7c  a.[` _` _` _.&@.,@b"Be%O
	defb 0cch,0cch,099h,055h,055h,0ffh,033h,033h,066h,055h,055h,0ffh,0ffh,0ffh,0aah,0ffh,000h,0ffh,0ffh,0ffh,000h,000h,000h,000h	; ad94  ...UU.33fUU.............
	defb 07ch,03ch,049h,075h,035h,05fh,073h,033h,046h,065h,025h,04fh,07fh,03fh,05ah,07fh,000h,07fh,07fh,07fh,000h,000h,000h,000h	; adac  |<Iu5_s3Fe%O.?Z.........
	defb 0cfh,0cdh,09ah,053h,051h,0fah,037h,035h,062h,057h,055h,0fah,0dfh,0ddh,08eh,0ffh,001h,0feh,0ffh,0ffh,000h,000h,000h,000h	; adc4  ...SQ.75bWU.............

; ----------------------------------------------------------------------
; DATOS lista_ADDC: 12 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x0000); lo leen p00:4C0C (61 bytes)
;   0xaddc..0xae19  (61 bytes)
DATA_lista_ADDC:
	defb 042h,000h,02ch,0a7h,0aeh	; addc
	defb 041h,001h,030h,0c7h,0aeh	; ade1
	defb 088h,001h,031h,0d7h,0aeh	; ade6
	defb 084h,002h,039h,097h,0afh	; adeb
	defb 001h,002h,040h,0f7h,0afh	; adf0
	defb 048h,002h,041h,0ffh,0afh	; adf5
	defb 044h,003h,049h,07fh,0b0h	; adfa
	defb 001h,004h,050h,0bfh,0b0h	; adff
	defb 043h,004h,051h,0c7h,0b0h	; ae04
	defb 085h,004h,054h,0f7h,0b0h	; ae09
	defb 041h,000h,059h,06fh,0b1h	; ae0e
	defb 041h,000h,05ah,07fh,0b1h	; ae13
	defb 0ffh	; ae18

; ----------------------------------------------------------------------
; DATOS lista_AE19: 21 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x0000); lo leen p00:4C0C, p00:4CA0 (106 bytes)
;   0xae19..0xae83  (106 bytes)
DATA_lista_AE19:
	defb 002h,022h,001h,08fh,0b1h	; ae19
	defb 047h,023h,003h,09fh,0b1h	; ae1e
	defb 046h,022h,00ah,00fh,0b2h	; ae23
	defb 04ah,024h,010h,06fh,0b2h	; ae28
	defb 042h,025h,024h,00fh,0b3h	; ae2d
	defb 048h,026h,026h,02fh,0b3h	; ae32
	defb 046h,027h,02eh,0afh,0b3h	; ae37
	defb 042h,028h,034h,00fh,0b4h	; ae3c
	defb 042h,029h,036h,02fh,0b4h	; ae41
	defb 042h,02bh,039h,04fh,0b4h	; ae46
	defb 041h,02ch,03bh,06fh,0b4h	; ae4b
	defb 041h,02dh,03ch,07fh,0b4h	; ae50
	defb 041h,02eh,03dh,08fh,0b4h	; ae55
	defb 0a2h,022h,03eh,09fh,0b4h	; ae5a
	defb 0a0h,022h,060h,0cfh,0b7h	; ae5f
	defb 087h,022h,081h,0cfh,0bah	; ae64
	defb 094h,027h,08ch,077h,0bbh	; ae69
	defb 084h,025h,0a0h,057h,0bdh	; ae6e
	defb 094h,02ch,0a8h,0b7h,0bdh	; ae73
	defb 082h,02ah,0bch,097h,0bfh	; ae78
	defb 082h,02eh,0c0h,0c7h,0bfh	; ae7d
	defb 0ffh	; ae82

; ----------------------------------------------------------------------
; DATOS lista_AE83: 7 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x6648); lo leen p00:4C26 (36 bytes)
;   0xae83..0xaea7  (36 bytes)
DATA_lista_AE83:
	defb 042h,000h,02ch,0a7h,0aeh	; ae83
	defb 041h,001h,030h,0c7h,0aeh	; ae88
	defb 088h,001h,031h,0d7h,0aeh	; ae8d
	defb 084h,002h,039h,097h,0afh	; ae92
	defb 001h,002h,040h,0f7h,0afh	; ae97
	defb 048h,002h,041h,0ffh,0afh	; ae9c
	defb 044h,003h,049h,07fh,0b0h	; aea1
	defb 0ffh	; aea6

; ----------------------------------------------------------------------
; DATOS dibujo_AEA7: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 0 de la lista 0xADDC (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (32 bytes)
;   0xaea7..0xaec7  (32 bytes)
DATA_dibujo_AEA7:
	defb 002h,085h,002h,0c1h,002h,0e1h,006h,0b5h,042h,0b9h,002h,0edh,012h,0cdh,022h,099h	; aea7  ........B.....".
	defb 050h,0a7h,010h,067h,01ch,021h,044h,041h,004h,049h,004h,001h,000h,01dh,04eh,05fh	; aeb7  P..g.!DA.I....N_

; ----------------------------------------------------------------------
; DATOS dibujo_AEC7: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 1 de la lista 0xADDC (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (16 bytes)
;   0xaec7..0xaed7  (16 bytes)
DATA_dibujo_AEC7:
	defb 080h,080h,000h,002h,002h,046h,044h,04ch,008h,008h,000h,020h,020h,064h,044h,044h	; aec7  .....FDL...  dDD

; ----------------------------------------------------------------------
; DATOS dibujo_AED7: 8 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 2 de la lista 0xADDC (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (192 bytes)
;   0xaed7..0xaf97  (192 bytes)
DATA_dibujo_AED7:
	defb 000h,000h,0ffh,004h,0efh,0ffh,0e1h,002h,0ffh,0bfh,05fh,0e0h,0b0h,032h,0c0h,0e8h,066h,080h,0d0h,0cch,000h,0d0h,0c8h,000h	; aed7  .........._..2..f.......
	defb 0bfh,01fh,0e0h,0e0h,062h,080h,082h,086h,000h,004h,04ch,000h,048h,048h,000h,000h,020h,000h,020h,064h,000h,044h,0c4h,000h	; aeef  ....b.....L.HH.. . d.D..
	defb 000h,000h,0ffh,0feh,0e1h,01fh,01eh,05eh,001h,043h,047h,000h,014h,004h,000h,006h,020h,000h,023h,060h,000h,045h,0c4h,000h	; af07  .......^.CG..... .#`.E..
	defb 001h,000h,0ffh,001h,0fch,0ffh,0fdh,000h,0ffh,0b9h,0c4h,07fh,0f9h,0c0h,03fh,02dh,030h,01fh,02dh,020h,01fh,039h,064h,01fh	; af1f  ..............?-0.- .9d.
	defb 0a0h,098h,000h,0b0h,098h,000h,08ch,0beh,000h,094h,08eh,000h,0c4h,0c6h,000h,0c0h,04eh,080h,0f8h,03bh,0c0h,0aeh,046h,0f8h	; af37  ................N.....F.
	defb 079h,060h,01fh,07dh,040h,03fh,03dh,060h,01fh,0d9h,054h,00fh,099h,010h,00fh,01dh,010h,00fh,02dh,020h,01fh,0d9h,0c4h,03fh	; af4f  y`.}@?=`..T.......- ...?
	defb 080h,0c0h,000h,080h,0a2h,000h,0c2h,0f6h,000h,0c4h,05ch,080h,0e0h,063h,080h,0f8h,039h,0c0h,0cch,02ch,0f0h,09fh,047h,0f8h	; af67  ..........\..c..9..,..G.
	defb 081h,081h,000h,003h,002h,001h,003h,042h,001h,047h,064h,003h,007h,0c4h,003h,00fh,0d8h,007h,01fh,030h,00fh,0fbh,0e4h,01fh	; af7f  .......B.Gd........0....

; ----------------------------------------------------------------------
; DATOS dibujo_AF97: 4 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 3 de la lista 0xADDC (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (96 bytes)
;   0xaf97..0xaff7  (96 bytes)
DATA_dibujo_AF97:
	defb 050h,058h,050h,010h,018h,010h,01ch,01eh,01ch,01fh,040h,000h,070h,04dh,04fh,068h,011h,01fh,0d0h,023h,03fh,0d0h,027h,03fh	; af97  PXP.......@.pMOh...#?.'?
	defb 05fh,040h,040h,060h,01dh,01fh,082h,079h,07dh,004h,0b3h,0fbh,048h,0b7h,0b7h,000h,0dfh,0ffh,020h,09bh,0dfh,044h,03bh,0bbh	; afaf  _@@`...y}...H..... ..D..
	defb 044h,044h,044h,0e0h,001h,000h,01fh,0a1h,0e1h,043h,0b8h,0bch,014h,0ebh,0fbh,006h,0d9h,0ffh,023h,09ch,0dfh,045h,03ah,0bbh	; afc7  DDD......C........#..E:.
	defb 046h,046h,046h,002h,002h,002h,002h,002h,002h,082h,046h,002h,0c6h,006h,006h,022h,0d2h,0c2h,032h,0d2h,0d2h,022h,086h,0c2h	; afdf  FFF.......F...."..2.."..

; ----------------------------------------------------------------------
; DATOS dibujo_AFF7: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 4 de la lista 0xADDC (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (8 bytes)
;   0xaff7..0xafff  (8 bytes)
DATA_dibujo_AFF7:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; aff7  ........

; ----------------------------------------------------------------------
; DATOS dibujo_AFFF: 8 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 5 de la lista 0xADDC (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (128 bytes)
;   0xafff..0xb07f  (128 bytes)
DATA_dibujo_AFFF:
	defb 008h,0afh,008h,0efh,002h,0e3h,040h,0e0h,00fh,080h,01fh,080h,03fh,000h,03fh,000h	; afff  ......@.....?.?.
	defb 000h,0a0h,01fh,080h,07fh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; b00f  ................
	defb 000h,0bbh,001h,01fh,0e0h,000h,0fch,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; b01f  ................
	defb 000h,0b9h,000h,0fdh,000h,0fdh,044h,07dh,000h,039h,0d0h,01dh,0c0h,00dh,0c4h,01dh	; b02f  ......D}.9......
	defb 07fh,000h,07fh,000h,07fh,000h,07fh,000h,03fh,000h,03fh,080h,007h,0c0h,041h,0e8h	; b03f  ........?.?...A.
	defb 080h,019h,080h,03dh,0c0h,01dh,0e4h,00dh,0e0h,009h,0e0h,00dh,0c0h,00dh,004h,01dh	; b04f  ...=............
	defb 07fh,000h,07fh,000h,03fh,000h,03fh,080h,01fh,080h,007h,0c0h,023h,0e0h,040h,0d8h	; b05f  ....?.?.....#.@.
	defb 0feh,000h,0fch,001h,0fch,001h,0f8h,003h,0f8h,003h,0f0h,007h,0e0h,00fh,004h,01fh	; b06f  ................

; ----------------------------------------------------------------------
; DATOS dibujo_B07F: 4 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 6 de la lista 0xADDC (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (64 bytes)
;   0xb07f..0xb0bf  (64 bytes)
DATA_dibujo_B07F:
	defb 050h,058h,010h,018h,000h,002h,000h,040h,00fh,000h,01fh,000h,03fh,000h,03fh,000h	; b07f  PX.....@....?.?.
	defb 040h,040h,01fh,000h,07fh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; b08f  @@..............
	defb 044h,044h,000h,001h,0e0h,000h,0fch,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; b09f  DD..............
	defb 046h,046h,002h,002h,002h,002h,002h,046h,006h,006h,0c2h,012h,0d2h,012h,0c2h,006h	; b0af  FF.....F........

; ----------------------------------------------------------------------
; DATOS dibujo_B0BF: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 7 de la lista 0xADDC (p00:4D92, p00:4DF5); lo leen p00:4C0C (8
;   bytes)
;   0xb0bf..0xb0c7  (8 bytes)
DATA_dibujo_B0BF:
	defb 01eh,03ch,078h,0f0h,0e1h,0c3h,087h,00fh	; b0bf  .<x.....

; ----------------------------------------------------------------------
; DATOS dibujo_B0C7: 3 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 8 de la lista 0xADDC (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (48 bytes)
;   0xb0c7..0xb0f7  (48 bytes)
DATA_dibujo_B0C7:
	defb 0e1h,0ffh,0fch,0c0h,0f8h,080h,070h,080h,061h,080h,043h,080h,007h,080h,08fh,080h	; b0c7  ......p.a.C.....
	defb 0e1h,0ffh,03ch,000h,078h,000h,0f0h,000h,0e1h,000h,0c3h,000h,087h,000h,00fh,000h	; b0d7  ..<.x...........
	defb 09eh,080h,0bch,080h,0f8h,080h,070h,080h,061h,080h,043h,080h,007h,080h,08fh,080h	; b0e7  ......p.a.C.....

; ----------------------------------------------------------------------
; DATOS dibujo_B0F7: 5 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 9 de la lista 0xADDC (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (120 bytes)
;   0xb0f7..0xb16f  (120 bytes)
DATA_dibujo_B0F7:
	defb 0e1h,0feh,001h,03dh,000h,001h,079h,000h,001h,0f1h,000h,001h,0e1h,000h,001h,0c3h,000h,001h,087h,000h,001h,00fh,000h,001h	; b0f7  ...=..y.................
	defb 01fh,000h,001h,03dh,000h,001h,079h,000h,001h,0f1h,000h,001h,0e1h,000h,001h,0c3h,000h,001h,087h,000h,001h,00fh,000h,001h	; b10f  ...=..y.................
	defb 0ffh,000h,0ffh,0ffh,000h,000h,0ffh,000h,000h,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b127  ........................
	defb 0ffh,000h,0ffh,07fh,080h,000h,07fh,080h,000h,060h,080h,01fh,06fh,08fh,01fh,06fh,08fh,01fh,06fh,08fh,01fh,06fh,08fh,01fh	; b13f  .........`..o..o..o..o..
	defb 0feh,001h,0ffh,0feh,001h,001h,0feh,001h,001h,006h,001h,0f9h,0feh,0f9h,0f9h,0feh,0f9h,0f9h,0feh,0f9h,0f9h,0feh,0f9h,0f9h	; b157  ........................

; ----------------------------------------------------------------------
; DATOS dibujo_B16F: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 10 de la lista 0xADDC (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (16 bytes)
;   0xb16f..0xb17f  (16 bytes)
DATA_dibujo_B16F:
	defb 099h,0a2h,089h,0dah,099h,0a2h,088h,0d1h,0a1h,0cah,0a1h,0c6h,0a1h,0cah,0a4h,0c9h	; b16f  ................

; ----------------------------------------------------------------------
; DATOS dibujo_B17F: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 11 de la lista 0xADDC (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (16 bytes)
;   0xb17f..0xb18f  (16 bytes)
DATA_dibujo_B17F:
	defb 098h,022h,088h,01ch,090h,028h,080h,0b2h,084h,026h,084h,046h,004h,096h,024h,0b6h	; b17f  ."...(...&.F..$.

; ----------------------------------------------------------------------
; DATOS dibujo_B18F: 2 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 0 de la lista 0xAE19 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4CA0 (16 bytes)
;   0xb18f..0xb19f  (16 bytes)
DATA_dibujo_B18F:
	defb 080h,0c0h,080h,0c0h,0c0h,080h,080h,088h	; b18f  ........
	defb 006h,040h,060h,000h,000h,000h,000h,000h	; b197  .@`.....

; ----------------------------------------------------------------------
; DATOS dibujo_B19F: 7 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 1 de la lista 0xAE19 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4CA0 (112 bytes)
;   0xb19f..0xb20f  (112 bytes)
DATA_dibujo_B19F:
	defb 03fh,080h,01fh,080h,04fh,060h,08fh,0b0h,00fh,080h,03fh,0b0h,03fh,0a0h,03fh,080h	; b19f  ?...O`....?.?.?.
	defb 02fh,038h,05fh,070h,0bfh,0e0h,07fh,0c0h,0ffh,080h,0ffh,000h,0ffh,000h,0ffh,000h	; b1af  /8_p............
	defb 054h,0d7h,074h,0f6h,055h,0d5h,057h,0d4h,05fh,0dch,07fh,0f0h,07fh,0c0h,07ch,0c3h	; b1bf  T.t.U.W._.....|.
	defb 054h,0d5h,056h,0d6h,05eh,0dch,05fh,0ddh,053h,0d0h,057h,0d4h,057h,0d4h,057h,0d4h	; b1cf  T.V.^._.S.W.W.W.
	defb 0cfh,0d0h,0efh,0e0h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; b1df  ................
	defb 0e7h,007h,0ffh,00fh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,001h,0ffh,001h,0ffh,001h	; b1ef  ................
	defb 03fh,020h,07fh,040h,0ffh,080h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; b1ff  ? .@............

; ----------------------------------------------------------------------
; DATOS dibujo_B20F: 6 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 2 de la lista 0xAE19 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4CA0 (96 bytes)
;   0xb20f..0xb26f  (96 bytes)
DATA_dibujo_B20F:
	defb 080h,07fh,080h,07fh,080h,07fh,000h,07fh,000h,07fh,000h,07fh,000h,07fh,000h,07fh	; b20f  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0feh,001h,0fch,001h,0fch,002h,0f8h	; b21f  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0feh,001h,0fch,002h,0f8h	; b22f  ................
	defb 000h,0ffh,000h,0ffh,03fh,080h,062h,0a0h,043h,083h,060h,080h,048h,080h,040h,080h	; b23f  ....?.b.C.`.H.@.
	defb 000h,0ffh,000h,0ffh,0dch,041h,046h,047h,0c2h,0c3h,002h,003h,002h,003h,002h,003h	; b24f  .....AFG........
	defb 080h,0ffh,080h,0ffh,000h,0ffh,000h,07fh,040h,03fh,020h,01fh,0a0h,09fh,0c0h,0cfh	; b25f  ........@? .....

; ----------------------------------------------------------------------
; DATOS dibujo_B26F: 10 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 3 de la lista 0xAE19 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4CA0 (160 bytes)
;   0xb26f..0xb30f  (160 bytes)
DATA_dibujo_B26F:
	defb 0d2h,0c9h,0c3h,0c8h,0e9h,0e4h,0ech,0e0h,0e4h,0e0h,0f6h,0f0h,0f2h,0f0h,0fah,0f8h	; b26f  ................
	defb 0b6h,080h,0a6h,080h,027h,000h,043h,001h,04ch,000h,08eh,000h,09ah,004h,09ch,000h	; b27f  ....'.C.L.......
	defb 0fah,0f8h,0f9h,0fbh,0fbh,0fbh,0f9h,0f8h,03ch,03ch,01ch,01ch,08eh,00eh,0c6h,006h	; b28f  ........<<......
	defb 09fh,002h,0b6h,08bh,0b6h,08ah,03ah,002h,06ah,012h,06ah,013h,04bh,032h,05bh,023h	; b29f  ......:.j.j.K2[#
	defb 0c4h,038h,0cdh,030h,078h,000h,002h,000h,082h,000h,0e0h,000h,0f0h,000h,0d1h,020h	; b2af  .8.0x..........
	defb 0f3h,003h,031h,001h,011h,041h,091h,0c1h,081h,0c1h,021h,081h,051h,009h,0e3h,01bh	; b2bf  ..1..A....!.Q...
	defb 003h,0fbh,007h,0fbh,007h,0fbh,0f7h,0fbh,087h,00bh,003h,0fbh,00ah,0f2h,016h,0e6h	; b2cf  ................
	defb 0beh,0beh,07eh,07eh,002h,002h,0f9h,001h,00ch,0f0h,07ch,0c0h,0c0h,0c0h,000h,000h	; b2df  ..~~......|.....
	defb 0f3h,0f3h,073h,070h,06fh,060h,0dfh,0c0h,0c1h,0deh,05dh,043h,043h,043h,080h,080h	; b2ef  ..spo`....]CCC..
	defb 03ch,033h,0d8h,018h,06fh,08fh,06eh,00dh,01dh,01ch,0feh,0feh,0ffh,0ffh,0f7h,0f7h	; b2ff  <3..o.n.........

; ----------------------------------------------------------------------
; DATOS dibujo_B30F: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 4 de la lista 0xAE19 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4CA0 (32 bytes)
;   0xb30f..0xb32f  (32 bytes)
DATA_dibujo_B30F:
	defb 0bfh,080h,03fh,080h,03fh,080h,0bfh,080h,0bfh,080h,0bfh,080h,03fh,080h,03fh,080h	; b30f  ..?.?.......?.?.
	defb 0feh,001h,0fdh,003h,0fch,002h,0fdh,001h,0fdh,003h,0fdh,003h,0fdh,003h,0f9h,00fh	; b31f  ................

; ----------------------------------------------------------------------
; DATOS dibujo_B32F: 8 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 5 de la lista 0xAE19 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4CA0 (128 bytes)
;   0xb32f..0xb3af  (128 bytes)
DATA_dibujo_B32F:
	defb 03fh,0f0h,01fh,0d8h,03fh,038h,01eh,0d8h,018h,0d8h,018h,0dah,018h,0deh,019h,0dfh	; b32f  ?...?8..........
	defb 06fh,078h,05fh,0f0h,07fh,060h,07fh,0c0h,07fh,0c0h,07fh,0c0h,07fh,0c0h,0ffh,0c0h	; b33f  ox_..`..........
	defb 087h,0a7h,00fh,04fh,01fh,098h,03fh,030h,0ffh,0e0h,05fh,040h,03fh,0a0h,03fh,0a0h	; b34f  ...O..?0.._@?.?.
	defb 0bfh,0c0h,03fh,080h,01fh,0c0h,01fh,0c0h,00fh,000h,0cfh,0c0h,0bfh,0b0h,03fh,060h	; b35f  ..?...........?`
	defb 001h,09fh,031h,031h,07dh,04dh,0ffh,080h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; b36f  ..11}M..........
	defb 0bch,0bch,03fh,03eh,07fh,040h,0ffh,080h,0ffh,080h,07fh,040h,03fh,0a0h,03fh,0a0h	; b37f  ..?>.@.....@?.?.
	defb 08fh,0f0h,0efh,060h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; b38f  ...`............
	defb 0ffh,080h,0fch,081h,0f9h,083h,0f9h,003h,0fch,001h,0fch,001h,0fch,001h,0feh,000h	; b39f  ................

; ----------------------------------------------------------------------
; DATOS dibujo_B3AF: 6 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 6 de la lista 0xAE19 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4CA0 (96 bytes)
;   0xb3af..0xb40f  (96 bytes)
DATA_dibujo_B3AF:
	defb 0bfh,080h,0bfh,080h,03fh,080h,03fh,080h,07fh,080h,07fh,000h,07fh,000h,0ffh,000h	; b3af  ....?.?.........
	defb 0feh,00eh,0f0h,00eh,0f1h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; b3bf  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,080h,03fh,080h,03fh,080h,07fh,000h,07fh,000h	; b3cf  ........?.?.....
	defb 037h,070h,097h,030h,087h,010h,0c7h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; b3df  7p.0............
	defb 0fbh,003h,0f9h,003h,0fdh,001h,0fch,001h,0fch,001h,0feh,000h,0feh,000h,0ffh,000h	; b3ef  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,001h,0ffh,003h,0feh,002h,0fch,000h,0fch,000h	; b3ff  ................

; ----------------------------------------------------------------------
; DATOS dibujo_B40F: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 7 de la lista 0xAE19 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4CA0 (32 bytes)
;   0xb40f..0xb42f  (32 bytes)
DATA_dibujo_B40F:
	defb 07ah,03eh,0dah,0feh,0dah,0feh,0a6h,0beh,09ch,09ch,080h,080h,080h,080h,000h,000h	; b40f  z>..............
	defb 0e0h,0e0h,0e0h,0e0h,0e0h,0a0h,0f0h,0f0h,0f0h,0b0h,0feh,0b0h,0ffh,0bch,0fbh,0bah	; b41f  ................

; ----------------------------------------------------------------------
; DATOS dibujo_B42F: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 8 de la lista 0xAE19 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4CA0 (32 bytes)
;   0xb42f..0xb44f  (32 bytes)
DATA_dibujo_B42F:
	defb 06fh,030h,06fh,030h,06fh,030h,0dfh,060h,0dfh,060h,0bfh,0c0h,07fh,080h,0ffh,000h	; b42f  o0o0o0.`.`......
	defb 0feh,000h,0feh,000h,0ffh,001h,0ffh,001h,0feh,003h,0feh,003h,0feh,003h,0ffh,001h	; b43f  ................

; ----------------------------------------------------------------------
; DATOS dibujo_B44F: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 9 de la lista 0xAE19 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4CA0 (32 bytes)
;   0xb44f..0xb46f  (32 bytes)
DATA_dibujo_B44F:
	defb 027h,098h,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,080h,000h,0ffh,000h,080h,000h,080h	; b44f  '...............
	defb 0fdh,002h,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,0ffh,000h,000h,000h,000h	; b45f  ................

; ----------------------------------------------------------------------
; DATOS dibujo_B46F: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 10 de la lista 0xAE19 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4CA0 (16 bytes)
;   0xb46f..0xb47f  (16 bytes)
DATA_dibujo_B46F:
	defb 07fh,080h,07fh,080h,07fh,080h,07fh,080h,07fh,080h,03fh,0c0h,01fh,000h,01fh,010h	; b46f  ..........?.....

; ----------------------------------------------------------------------
; DATOS dibujo_B47F: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 11 de la lista 0xAE19 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4CA0 (16 bytes)
;   0xb47f..0xb48f  (16 bytes)
DATA_dibujo_B47F:
	defb 000h,000h,000h,000h,080h,000h,080h,000h,080h,000h,040h,0c0h,0c0h,0c0h,0c0h,0c0h	; b47f  ..........@.....

; ----------------------------------------------------------------------
; DATOS dibujo_B48F: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 12 de la lista 0xAE19 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4CA0 (16 bytes)
;   0xb48f..0xb49f  (16 bytes)
DATA_dibujo_B48F:
	defb 0dfh,09fh,040h,0c0h,090h,0b0h,0b0h,030h,080h,080h,0c0h,080h,0c0h,080h,040h,0c0h	; b48f  ..@....0......@.

; ----------------------------------------------------------------------
; DATOS dibujo_B49F: 34 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 13 de la lista 0xAE19 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4CA0 (816 bytes)
;   0xb49f..0xb7cf  (816 bytes)
DATA_dibujo_B49F:
	defb 0bdh,039h,0c6h,0dah,0dbh,024h,076h,017h,0e8h,0d6h,0d3h,02ch,0f6h,0f3h,004h,09ch,0dfh,020h,008h,0cfh,000h,018h,0cfh,020h	; b49f  .9...$v....,..... .....
	defb 030h,033h,08ch,094h,087h,058h,0ech,06fh,090h,0d4h,0c7h,018h,078h,07fh,080h,030h,03fh,0c0h,000h,03fh,0c0h,000h,01fh,0e0h	; b4b7  03...X.o....x..0?..?....
	defb 01fh,0e0h,0e0h,080h,000h,000h,09eh,022h,0e1h,0e2h,042h,001h,03ah,09ah,099h,022h,082h,081h,0beh,03eh,001h,0b0h,000h,03fh	; b4cf  ......."..B.:.."...>...?
	defb 0ffh,000h,000h,000h,000h,000h,000h,000h,0ffh,01eh,01eh,012h,01eh,01eh,006h,01eh,01eh,00ch,01eh,01eh,018h,01eh,01eh,012h	; b4e7  ........................
	defb 000h,0ffh,000h,000h,0ffh,000h,000h,0efh,008h,034h,0a3h,004h,01ch,051h,04eh,0a8h,009h,036h,04ch,00bh,070h,094h,017h,0e8h	; b4ff  .........4...QN..6L.p...
	defb 017h,0f0h,000h,03fh,0c0h,000h,01fh,0a0h,020h,00fh,090h,010h,017h,090h,040h,070h,0a0h,050h,02fh,08fh,030h,050h,080h,01fh	; b517  ...?.... .....@p.P/.0P..
	defb 0a0h,02fh,010h,0e0h,007h,008h,0e0h,007h,008h,0e0h,007h,008h,0f8h,02fh,010h,038h,01fh,020h,0e8h,0efh,010h,01ch,01bh,0e4h	; b52f  ./.........../.8. ......
	defb 0b0h,09fh,060h,07ch,057h,0a8h,0f4h,0d7h,0a8h,0f4h,0d7h,0a8h,07ch,05fh,020h,0f0h,01fh,060h,0f4h,056h,020h,0fdh,056h,020h	; b547  ..`|W.......|_ ..`.V .V
	defb 03ch,03bh,0c4h,038h,03fh,0c0h,038h,03fh,0c0h,0f8h,0fbh,0c4h,03ch,039h,0c6h,038h,038h,0c3h,03ah,03ah,0c1h,03fh,03ah,0c5h	; b55f  <..8?.8?....<9.88.::.?:.
	defb 014h,0e4h,00ah,01ch,0e8h,007h,01ch,0e8h,005h,00eh,0e8h,005h,00dh,0e9h,006h,06ah,02bh,0c5h,06fh,02ch,050h,06ch,029h,051h	; b577  ...............j+.o,Pl)Q
	defb 0fch,038h,045h,0feh,0f8h,007h,00eh,008h,0f7h,00eh,008h,0f7h,0fch,0fch,003h,0c2h,0d2h,035h,073h,043h,0a4h,073h,043h,0a4h	; b58f  .8E..............5sC.sC.
	defb 0c3h,000h,0c3h,02eh,010h,090h,03eh,000h,081h,05dh,000h,0c1h,001h,000h,081h,0f9h,078h,0b9h,051h,040h,0b1h,059h,040h,0b9h	; b5a7  ......>..]......x.Q@.Y@.
	defb 054h,057h,020h,054h,057h,028h,054h,057h,028h,056h,054h,02bh,057h,054h,02bh,054h,054h,028h,057h,054h,028h,056h,054h,028h	; b5bf  TW TW(TW(VT+WT+TT(WT(VT(
	defb 078h,031h,041h,073h,022h,040h,0f3h,022h,0c0h,0fbh,02ah,0c0h,0fah,02ah,0c0h,0f8h,028h,0c1h,0e1h,021h,0ceh,0a3h,023h,0d4h	; b5d7  x1As"@."..*..*..(..!..#.
	defb 073h,043h,0a4h,073h,043h,0a4h,073h,043h,0a4h,073h,043h,0a4h,073h,043h,0a4h,0f2h,0e2h,025h,0f2h,0a2h,065h,0d3h,042h,085h	; b5ef  sC.sC.sC.sC.sC...%..e.B.
	defb 0a8h,080h,067h,0aeh,080h,067h,0ach,080h,061h,0a9h,080h,063h,0a1h,080h,063h,0aah,080h,066h,092h,080h,076h,0d2h,0c0h,036h	; b607  ..g..g..a..c..c..f..v..6
	defb 09fh,080h,07fh,003h,000h,0ffh,07ah,002h,0fdh,085h,001h,086h,003h,001h,002h,076h,002h,001h,0a6h,046h,041h,082h,000h,003h	; b61f  ......z........v...FA...
	defb 0b3h,0a2h,045h,0b3h,0a2h,045h,0a7h,0a6h,049h,0aah,0aah,050h,0bfh,0bah,040h,06fh,0eah,001h,07fh,0ach,043h,0beh,030h,08fh	; b637  ..E..E..I..P..@o....C.0.
	defb 0dbh,0c2h,005h,0a7h,082h,01dh,053h,003h,024h,0b3h,003h,044h,0bbh,01bh,0c4h,096h,01eh,0c9h,07fh,07eh,081h,0ffh,09eh,021h	; b64f  ......S.$..D.......~...!
	defb 082h,078h,07fh,042h,000h,003h,0b5h,031h,0b6h,0f9h,001h,0feh,002h,002h,0fdh,078h,000h,0ffh,084h,000h,087h,0b2h,000h,083h	; b667  .x.B...1.......x........
	defb 0c3h,083h,003h,0e3h,0a3h,003h,0cch,08ch,000h,040h,080h,07fh,0c0h,080h,000h,0ffh,03fh,08ch,0ffh,0bfh,019h,04bh,034h,034h	; b67f  .........@......?....K44
	defb 0c2h,0c0h,0c2h,0c7h,0c4h,0c2h,032h,030h,002h,003h,002h,0fdh,003h,000h,003h,0feh,0fch,0cfh,0feh,0fch,09bh,0ffh,003h,000h	; b697  ......20................
	defb 000h,03fh,040h,090h,01fh,040h,030h,01fh,060h,0b0h,03fh,0c0h,080h,03fh,0c0h,000h,03fh,0c0h,000h,03fh,0c0h,0c0h,0ffh,000h	; b6af  .?@..@0.`.?..?..?..?....
	defb 040h,040h,033h,07fh,07fh,000h,083h,000h,07fh,0c0h,000h,000h,0ffh,0ffh,000h,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh,000h	; b6c7  @@3.....................
	defb 000h,000h,0f3h,0ffh,0ffh,000h,0f8h,000h,0ffh,000h,000h,000h,0ffh,0ffh,000h,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh,000h	; b6df  ........................
	defb 062h,07ch,000h,063h,07ch,001h,040h,07ch,001h,041h,07dh,002h,0c3h,0fdh,002h,000h,0ffh,000h,000h,0fch,003h,003h,0f0h,00fh	; b6f7  b|.c|.@|.A}.............
	defb 09ah,020h,0a3h,0dah,020h,0a2h,0bbh,001h,082h,092h,020h,0a3h,092h,000h,083h,0b6h,000h,087h,0b6h,000h,087h,094h,000h,087h	; b70f  . .. ..... .............
	defb 00ah,0e0h,018h,013h,0c0h,03bh,03fh,087h,068h,063h,080h,043h,008h,000h,08fh,027h,000h,0bfh,0d8h,000h,0f8h,0a1h,006h,0e6h	; b727  ......?.hc.C...'........
	defb 01eh,012h,06dh,04dh,049h,0b6h,089h,089h,076h,0a5h,005h,0fah,017h,017h,0e8h,0efh,00fh,0f0h,017h,007h,018h,0cah,002h,00dh	; b73f  ..mMI...v...............
	defb 01fh,000h,0ffh,018h,000h,0f9h,018h,000h,0fah,01bh,001h,0fch,01bh,001h,0fch,089h,080h,07bh,08ch,080h,07dh,08ch,080h,07ch	; b757  .................{..}..|
	defb 0f3h,003h,0fch,079h,001h,0feh,01ch,000h,0dfh,00eh,000h,0cfh,007h,000h,0c7h,00fh,00fh,0cfh,047h,000h,087h,0e7h,000h,007h	; b76f  ...y..............G.....
	defb 090h,008h,0c8h,050h,000h,0c0h,060h,000h,0c0h,06fh,00fh,0c0h,043h,000h,0cfh,030h,080h,060h,038h,080h,060h,018h,0c0h,038h	; b787  ...P..`..o..C..0.`8.`..8
	defb 0c6h,0c0h,03eh,042h,040h,0beh,0e1h,0e0h,01fh,0b9h,0a8h,057h,0ech,0c4h,00bh,0dah,082h,01dh,0f2h,082h,03dh,0c6h,086h,079h	; b79f  ..>B@......W........=..y
	defb 063h,000h,003h,073h,000h,003h,039h,000h,019h,0a1h,000h,0a9h,0e9h,008h,0d5h,0a9h,008h,0b5h,0e9h,008h,0b7h,049h,008h,0b7h	; b7b7  c..s..9..............I..

; ----------------------------------------------------------------------
; DATOS dibujo_B7CF: 32 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 14 de la lista 0xAE19 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4CA0 (768 bytes)
;   0xb7cf..0xbacf  (768 bytes)
DATA_dibujo_B7CF:
	defb 0a5h,004h,08bh,0d5h,004h,09bh,0d4h,004h,09bh,054h,004h,01bh,056h,006h,019h,056h,006h,019h,06eh,006h,009h,07eh,03ah,005h	; b7cf  .........T..V..V..n..~:.
	defb 0f1h,071h,08eh,056h,050h,02fh,0f6h,050h,0afh,057h,050h,08fh,0d0h,0d0h,008h,0f3h,0d0h,02bh,059h,051h,0aah,076h,072h,08dh	; b7e7  .q.VP/.P.WP......+YQ.vr.
	defb 0fch,0ffh,000h,0fch,0ffh,000h,00eh,00bh,0f4h,0fah,00bh,0f0h,01eh,00bh,014h,0fch,00fh,0f0h,0cah,0cbh,030h,03bh,039h,0c2h	; b7ff  ....................0.9.
	defb 007h,0e0h,01fh,000h,0f8h,007h,002h,0f8h,003h,004h,0f8h,001h,001h,0fdh,002h,000h,0fch,001h,002h,0fch,003h,003h,0fbh,000h	; b817  ........................
	defb 004h,0f8h,005h,007h,0fbh,004h,005h,0f9h,006h,007h,0ffh,000h,003h,0ffh,000h,000h,0feh,000h,001h,0feh,001h,001h,0fch,001h	; b82f  ........................
	defb 001h,0fch,000h,003h,0f8h,000h,007h,0f8h,000h,00eh,0f4h,000h,00eh,0fch,000h,008h,0e0h,007h,00fh,0e7h,008h,01fh,0efh,010h	; b847  ........................
	defb 00fh,0f0h,00fh,01eh,0e0h,000h,038h,0c0h,000h,038h,0c0h,01fh,02fh,0cfh,030h,03fh,0ffh,000h,03fh,0edh,012h,03eh,0e4h,009h	; b85f  ......8..8../.0?..?..>..
	defb 000h,0ffh,000h,000h,0ffh,000h,004h,0f0h,007h,01fh,0e1h,002h,03ch,0c0h,006h,014h,0e1h,025h,031h,081h,005h,02bh,0c0h,04eh	; b877  ............<....%1..+.N
	defb 016h,0c4h,03bh,02dh,0cdh,032h,010h,080h,01fh,07eh,008h,016h,0bch,010h,02fh,0e3h,020h,007h,0f8h,0e0h,0d8h,062h,020h,050h	; b88f  ...-.2...~..../. ....b P
	defb 066h,086h,009h,045h,007h,008h,0d8h,00fh,010h,088h,00fh,010h,0b0h,01fh,020h,010h,01fh,020h,020h,03fh,0c0h,0e0h,0ffh,000h	; b8a7  f..E.......... ..  ?....
	defb 032h,034h,0c4h,0a2h,0b4h,044h,006h,0f0h,000h,004h,0f0h,000h,000h,0f4h,004h,005h,0f0h,001h,005h,0f0h,001h,005h,0f0h,001h	; b8bf  24...D..................
	defb 0bdh,039h,0c6h,0dbh,0dbh,024h,07eh,018h,0e7h,0d6h,0d0h,02fh,07eh,076h,089h,06bh,07bh,080h,042h,07bh,080h,046h,07bh,080h	; b8d7  .9...$~..../~v.k{.B{.F{.
	defb 046h,07bh,080h,0c6h,0fbh,000h,0dfh,06fh,090h,0afh,021h,0c2h,0abh,021h,0d2h,0e3h,0e3h,01ch,031h,031h,0cah,03eh,01fh,0e0h	; b8ef  F{.....o..!..!....11.>..
	defb 00ah,00bh,0e4h,0dch,01fh,0e0h,0e4h,003h,0fch,0a4h,003h,03ch,030h,003h,03ch,0b2h,001h,03eh,09ah,001h,01eh,0d8h,001h,01eh	; b907  ...........<0.<..>......
	defb 0d9h,000h,01fh,0fdh,03ch,03fh,06ch,000h,00fh,074h,000h,007h,0b6h,000h,087h,0f8h,020h,081h,060h,060h,09fh,05fh,01fh,0e0h	; b91f  ....<?l..t...... .``._..
	defb 07fh,07fh,080h,0f2h,0f0h,000h,0ach,020h,0c0h,0ebh,0c0h,023h,0ach,080h,06fh,0b3h,083h,07ch,08dh,08dh,072h,0f9h,0f9h,004h	; b937  ....... ...#..o..|..r...
	defb 05bh,019h,0e4h,00dh,00dh,0d2h,0a3h,083h,06ch,047h,0c0h,037h,032h,000h,0fbh,029h,000h,08dh,0c5h,030h,0b6h,0bbh,001h,082h	; b94f  [.......lG.72..)...0....
	defb 060h,03fh,000h,0a0h,0bfh,040h,0e1h,0f8h,007h,0fah,018h,0e6h,0cbh,008h,016h,045h,004h,08bh,09bh,022h,0e5h,0bah,03ah,0fdh	; b967  `?...@.........E..."..:.
	defb 000h,0ffh,000h,000h,0ffh,000h,000h,07fh,080h,040h,03fh,040h,0a0h,01fh,020h,090h,04fh,050h,070h,00fh,010h,048h,027h,028h	; b97f  .........@?@.. .OPp..H'(
	defb 057h,009h,0cah,0adh,080h,061h,057h,0c0h,031h,02ah,0e0h,018h,014h,0f0h,00ch,00ah,0f8h,006h,005h,0fch,003h,003h,0ffh,000h	; b997  W....aW.1*..............
	defb 00ah,002h,0cdh,0ffh,0c7h,038h,0b8h,0ffh,000h,000h,07fh,080h,0c0h,07fh,080h,040h,07fh,000h,0a0h,03fh,0c0h,0e0h,0ffh,000h	; b9af  .....8.........@...?....
	defb 0b8h,007h,088h,054h,003h,0c4h,0a8h,083h,060h,05ah,0c1h,032h,02eh,0e1h,01eh,010h,0f1h,00eh,000h,0ffh,000h,000h,0ffh,000h	; b9c7  ...T....`Z.2............
	defb 007h,0e0h,01fh,000h,0f8h,007h,005h,0f9h,006h,00ah,0f0h,003h,006h,0f6h,001h,00bh,0fbh,004h,003h,0fbh,004h,002h,0fbh,000h	; b9df  ........................
	defb 006h,0fbh,000h,006h,0fbh,000h,006h,0fbh,004h,019h,0e1h,002h,015h,0e1h,016h,017h,0e7h,008h,00ah,0e2h,01dh,01fh,0fch,003h	; b9f7  ........................
	defb 00fh,0fah,000h,007h,0feh,000h,003h,0f0h,000h,006h,0f0h,000h,006h,0f0h,000h,00ch,0e0h,000h,00ch,0e0h,000h,00fh,0efh,00fh	; ba0f  ........................
	defb 0ddh,005h,012h,08dh,00dh,002h,00ah,003h,00ch,01ah,003h,01ch,032h,003h,03ch,034h,006h,039h,064h,006h,079h,064h,006h,079h	; ba27  ............2.<4.9d.yd.y
	defb 018h,0c0h,000h,018h,0c0h,000h,038h,0c0h,000h,031h,080h,001h,039h,0e0h,041h,07dh,0e0h,001h,040h,000h,03fh,07fh,03fh,040h	; ba3f  ......8..1..9.A}..@.?.?@
	defb 0ffh,07fh,080h,079h,081h,07eh,0f6h,000h,007h,0c3h,000h,003h,0c3h,000h,0ffh,079h,078h,087h,0feh,0feh,001h,0ffh,06fh,090h	; ba57  ...y.~.........yx.....o.
	defb 001h,0ffh,000h,000h,0feh,001h,061h,086h,079h,064h,004h,008h,053h,080h,098h,0a5h,000h,031h,027h,009h,028h,04fh,00fh,06eh	; ba6f  ......a.yd..S....1'.(O.n
	defb 0f7h,027h,048h,0b5h,024h,0dbh,06ah,068h,097h,080h,000h,0fbh,0f1h,041h,0b6h,0e9h,080h,079h,014h,000h,030h,0c5h,008h,0e9h	; ba87  .'H.$.jh.....A...y..0...
	defb 00ah,0f0h,008h,005h,0f0h,001h,012h,0e0h,013h,004h,0e0h,007h,001h,0e1h,01eh,01eh,0ffh,000h,000h,0ffh,000h,000h,0ffh,000h	; ba9f  ........................
	defb 03bh,000h,0e3h,0c6h,0d0h,017h,064h,080h,047h,069h,081h,04eh,012h,003h,09ch,0a4h,007h,0b8h,0c8h,00fh,0f0h,0f0h,0ffh,000h	; bab7  ......d.Gi.N............

; ----------------------------------------------------------------------
; DATOS dibujo_BACF: 7 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 15 de la lista 0xAE19 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4CA0 (168 bytes)
;   0xbacf..0xbb77  (168 bytes)
DATA_dibujo_BACF:
	defb 07ah,078h,087h,0f9h,0f8h,006h,004h,0fch,002h,002h,0feh,001h,001h,0ffh,000h,000h,0fch,003h,002h,0f8h,006h,001h,0f8h,004h	; bacf  zx......................
	defb 0dbh,0c9h,020h,06dh,06dh,092h,09fh,01fh,060h,07fh,000h,0bfh,0d7h,0c0h,018h,02ah,020h,0cch,06ch,021h,057h,095h,011h,02fh	; bae7  .. mm...`......* .l!W../
	defb 000h,0ffh,000h,000h,0ffh,000h,000h,0ffh,000h,080h,0ffh,000h,05ch,041h,0beh,025h,020h,051h,0d5h,012h,023h,0d7h,0d0h,0e8h	; baff  ............\A.% Q..#...
	defb 010h,090h,0aeh,03fh,09eh,0a1h,0e9h,00fh,030h,008h,04fh,050h,058h,00fh,010h,0b0h,007h,098h,0b0h,007h,098h,040h,007h,0c8h	; bb17  ...?....0.OPX........@..
	defb 052h,011h,069h,0f9h,038h,0c4h,0f9h,0f8h,004h,01ah,0f8h,006h,00ch,0fch,002h,005h,0fch,003h,002h,0feh,001h,001h,0ffh,000h	; bb2f  R.i.8...................
	defb 080h,07fh,080h,080h,07fh,080h,0c0h,03fh,040h,0c0h,03fh,040h,060h,01fh,020h,060h,01fh,020h,090h,00fh,090h,070h,00fh,0d0h	; bb47  .......?@.?@`. `. ...p..
	defb 0feh,0fdh,002h,0f4h,081h,006h,0e6h,000h,007h,05eh,000h,01fh,060h,000h,07fh,09eh,01eh,0e1h,06dh,06dh,092h,0c9h,0c9h,024h	; bb5f  .........^..`.....mm...$

; ----------------------------------------------------------------------
; DATOS dibujo_BB77: 20 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 16 de la lista 0xAE19 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4CA0 (480 bytes)
;   0xbb77..0xbd57  (480 bytes)
DATA_dibujo_BB77:
	defb 05bh,09bh,08bh,09fh,05fh,04fh,0f9h,03dh,021h,0feh,01fh,01eh,0ech,01dh,00ch,0e4h,035h,004h,084h,024h,044h,09fh,0dfh,01fh	; bb77  [..._O.=!.......5..$D...
	defb 09fh,090h,090h,03fh,0b0h,090h,07fh,060h,020h,07fh,060h,020h,07fh,060h,020h,05fh,060h,0e0h,05fh,060h,0e0h,05fh,060h,0e0h	; bb8f  ...?...` .` .` _`._`._`.
	defb 03eh,00fh,00eh,035h,095h,015h,034h,09fh,014h,035h,095h,015h,03eh,01eh,01eh,02ch,014h,014h,029h,015h,011h,011h,025h,021h	; bba7  >..5..4..5..>..,..)...%!
	defb 024h,036h,045h,065h,077h,015h,00ch,07fh,00ch,008h,02bh,008h,050h,053h,010h,0a0h,0bbh,080h,0a0h,0b1h,080h,080h,0b2h,080h	; bbbf  $6Eew.....+.PS..........
	defb 08dh,0a7h,009h,0a1h,0a5h,029h,0a9h,0adh,0a1h,0c6h,0c6h,0c6h,048h,048h,053h,08fh,0adh,092h,09ch,0bdh,083h,091h,0b1h,08bh	; bbd7  .....)......HHS.........
	defb 0fdh,0ffh,02dh,024h,0feh,02ch,01eh,05eh,01eh,09fh,09fh,09fh,09fh,09fh,09fh,0dch,0dch,0dch,07eh,07eh,07eh,03eh,03eh,03eh	; bbef  ..-$.,.^..........~~~>>>
	defb 07bh,07bh,07bh,0bch,0feh,03ch,02fh,06fh,00fh,0cbh,0dbh,0cbh,0ach,0ffh,02ch,05fh,0ffh,0dfh,0dfh,0feh,0deh,02fh,0eeh,02eh	; bc07  {{{..</o......,_...../..
	defb 0efh,0eeh,0eeh,09fh,09eh,09eh,04fh,06eh,00eh,0cfh,0e8h,008h,0afh,0e8h,068h,069h,0ebh,069h,099h,0f9h,099h,0f1h,0f1h,0f1h	; bc1f  ......On......hi.i......
	defb 00eh,0ceh,00eh,03eh,03eh,03eh,0c6h,0c7h,0c6h,0c5h,0b7h,086h,0fdh,0bfh,0beh,0edh,0bfh,0aeh,0ech,0ebh,0cah,05eh,05eh,05eh	; bc37  ...>>>...............^^^
	defb 0ffh,080h,080h,057h,070h,040h,0c7h,0cch,0c4h,0e7h,0ech,0e4h,067h,06ch,064h,08fh,0d8h,0c8h,0cfh,098h,088h,097h,038h,018h	; bc4f  ...Wp@......gld.......8.
	defb 0e1h,0f9h,001h,0e1h,0f9h,001h,0c3h,0f2h,002h,0b3h,0f2h,012h,033h,0f2h,032h,006h,004h,004h,0c6h,0c4h,0c4h,0fch,0feh,0feh	; bc67  ............3.2.........
	defb 097h,038h,018h,0b7h,038h,018h,077h,068h,028h,037h,028h,068h,037h,028h,068h,06fh,050h,0d0h,0efh,0d0h,050h,0dfh,0e0h,060h	; bc7f  .8..8.wh(7(h7(hoP...P..`
	defb 03eh,00fh,00eh,035h,095h,015h,034h,09fh,014h,015h,0b5h,035h,01dh,02dh,02dh,01eh,027h,026h,01ch,021h,020h,01eh,023h,020h	; bc97  >..5..4....5.--.'&.! .#
	defb 0deh,023h,020h,0edh,013h,011h,0edh,013h,011h,0edh,011h,010h,0edh,011h,010h,0efh,013h,013h,08ch,05ch,00ch,070h,0f0h,070h	; bcaf  .# ................\.p.p
	defb 056h,0e6h,062h,036h,067h,026h,030h,067h,020h,030h,064h,023h,092h,036h,011h,0bah,032h,011h,098h,012h,031h,089h,04bh,058h	; bcc7  V.b6g&0g 0d#.6..2...1.KX
	defb 08dh,049h,058h,08ch,049h,058h,0a4h,045h,04ch,0aeh,04ch,044h,0aeh,04ch,044h,0b6h,046h,042h,0b7h,046h,042h,0d7h,026h,022h	; bcdf  .IX.IX.EL.LD.LD.FB.FB.&"
	defb 0dbh,023h,021h,0e3h,01bh,019h,0ffh,007h,004h,0d3h,03bh,003h,0a9h,06dh,011h,0ach,06eh,010h,0f4h,036h,008h,0d9h,019h,001h	; bcf7  .#!..........m..n..6....
	defb 0e5h,036h,006h,0feh,03dh,03dh,0eeh,039h,029h,0ceh,019h,009h,0feh,079h,079h,08fh,08ch,08ch,002h,0c2h,002h,081h,0f1h,001h	; bd0f  .6..==.9)....yy.........
	defb 00ch,0c8h,009h,00ch,0c8h,009h,00ch,0c8h,009h,019h,091h,013h,0d9h,0d1h,053h,0dbh,0d3h,0d1h,036h,027h,023h,037h,026h,022h	; bd27  ..............S...6'#7&"
	defb 0e7h,0f6h,0f2h,09fh,0fch,084h,0c7h,0c4h,0c4h,079h,079h,07eh,027h,027h,038h,02eh,0afh,030h,022h,02fh,020h,0f0h,0f3h,0f0h	; bd3f  .........yy~''8..0"/ ...

; ----------------------------------------------------------------------
; DATOS dibujo_BD57: 4 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 17 de la lista 0xAE19 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4CA0 (96 bytes)
;   0xbd57..0xbdb7  (96 bytes)
DATA_dibujo_BD57:
	defb 0d8h,038h,038h,0dfh,03fh,03fh,0d1h,031h,031h,0f7h,017h,037h,0d5h,035h,03fh,0f4h,014h,03eh,0fch,01ch,03eh,0f8h,036h,030h	; bd57  .88.??.11..7.5?..>..>.60
	defb 0f9h,001h,005h,0f8h,004h,002h,0f8h,004h,002h,0feh,006h,001h,0f8h,004h,000h,0fbh,003h,003h,0fdh,007h,007h,0fdh,003h,003h	; bd6f  ........................
	defb 003h,01bh,0a3h,012h,033h,04ah,032h,072h,08bh,023h,063h,09bh,047h,0e7h,017h,007h,0c7h,037h,06ch,06ch,06ch,0b9h,0fbh,0f9h	; bd87  ....3J2r.#c.G....7lll...
	defb 048h,0deh,0e0h,041h,0cdh,0f2h,040h,040h,05fh,001h,001h,020h,005h,027h,080h,025h,065h,016h,046h,067h,016h,044h,064h,014h	; bd9f  H..A..@@_.. .'.%e.Fg.Dd.

; ----------------------------------------------------------------------
; DATOS dibujo_BDB7: 20 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 18 de la lista 0xAE19 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4CA0 (480 bytes)
;   0xbdb7..0xbf97  (480 bytes)
DATA_dibujo_BDB7:
	defb 00eh,00eh,0c0h,03eh,03eh,000h,0c6h,0c6h,001h,0c5h,086h,001h,0e5h,086h,031h,0e5h,086h,031h,0cch,00eh,001h,0e4h,006h,030h	; bdb7  ...>>.........1..1.....0
	defb 03bh,0dbh,0e0h,06bh,0ebh,080h,06fh,06fh,0c0h,09fh,09fh,000h,0feh,0feh,000h,0fch,0fch,000h,000h,000h,001h,000h,000h,00fh	; bdcf  ...k..oo................
	defb 0c0h,080h,07fh,051h,030h,06fh,0f3h,0b1h,04eh,0c2h,083h,07ch,043h,003h,07dh,061h,003h,07eh,0e0h,001h,07fh,0c0h,000h,07fh	; bde7  ...Q0o..N..|C.}a.~......
	defb 001h,000h,0fch,08dh,004h,0f8h,08dh,08ch,070h,041h,0c0h,03ch,045h,0c0h,03ch,0c1h,080h,07ch,00dh,080h,0fch,005h,000h,0fch	; bdff  ........pA.<E.<..|......
	defb 0ffh,00ch,00fh,0fch,01eh,01ch,0f9h,03fh,038h,0d3h,03fh,070h,0b7h,04eh,0f1h,067h,085h,0e2h,0cfh,00ah,0c4h,09fh,014h,088h	; be17  .......?8.?p.N.g........
	defb 09eh,06eh,07ch,09ah,06eh,078h,09ah,06eh,078h,01ah,06eh,078h,09ah,06eh,0f8h,05ah,0aeh,0f8h,052h,0aeh,0f0h,036h,086h,0b0h	; be2f  .n|.nx.nx.nx.n.Z..R..6..
	defb 0fbh,084h,00fh,0f6h,088h,01eh,06ch,090h,03ch,059h,0a1h,078h,0b3h,0c2h,071h,0e7h,085h,062h,0cfh,08ah,044h,09fh,094h,008h	; be47  ......l.<Y.x..q..b..D...
	defb 04eh,0ceh,080h,05bh,0dfh,080h,055h,0dfh,084h,04fh,0ceh,081h,042h,0cch,08fh,040h,0c0h,08fh,0d9h,048h,097h,05bh,0d8h,087h	; be5f  N..[..U..O..B..@...H.[..
	defb 00eh,00eh,000h,01bh,01fh,000h,015h,01fh,004h,01fh,00eh,0f1h,002h,00ch,0ffh,0e0h,000h,0ffh,0f9h,003h,0feh,0dbh,0e3h,0dch	; be77  ........................
	defb 041h,0c0h,08fh,040h,0c0h,08fh,0ceh,04eh,081h,0dbh,05fh,080h,0d5h,05fh,084h,0cfh,04eh,081h,0c2h,04ch,08fh,0c0h,040h,08fh	; be8f  A..@...N.._.._..N..L..@.
	defb 0f8h,000h,0ffh,0e0h,000h,0ffh,04eh,00eh,0f1h,05bh,01fh,0e0h,015h,01fh,0e4h,01fh,00eh,0f1h,042h,00ch,0ffh,0e0h,000h,0ffh	; bea7  ......N..[........B.....
	defb 0d9h,048h,097h,0dbh,058h,087h,0c3h,040h,08fh,0c0h,040h,08fh,0ceh,04eh,081h,0dbh,05fh,080h,0d5h,05fh,084h,0cfh,04eh,091h	; bebf  .H..X..@..@..N.._.._..N.
	defb 0f1h,003h,0feh,0dbh,0e3h,0dch,0f0h,000h,0ffh,0e0h,000h,0ffh,04eh,00eh,0f1h,05bh,01fh,0e0h,015h,01fh,0e4h,01eh,00eh,0f0h	; bed7  ............N..[........
	defb 02eh,0ebh,000h,06fh,0e9h,000h,04fh,0cch,000h,04fh,04ch,080h,0cfh,0cfh,000h,05ch,0dch,003h,05dh,0d9h,006h,0dfh,0dch,003h	; beef  ...o..O..OL....\..].....
	defb 0c1h,000h,07fh,0c3h,001h,07eh,0c2h,003h,07ch,0c3h,003h,07dh,0c1h,003h,07eh,0d0h,0b1h,06fh,0f4h,0b0h,04fh,0ffh,080h,07fh	; bf07  .....~..|..}..~..o..O...
	defb 081h,000h,0fch,081h,080h,07ch,041h,0c0h,03ch,041h,0c0h,03ch,0c1h,080h,07ch,00dh,084h,0f8h,00dh,00ch,0f0h,0fdh,000h,0feh	; bf1f  .....|A.<A.<..|.........
	defb 054h,050h,004h,0f4h,0d0h,024h,0edh,0c9h,024h,0e7h,0c7h,030h,0f3h,0a3h,018h,0ffh,09eh,000h,0fbh,0ceh,000h,0bbh,0eeh,000h	; bf37  TP...$..$..0............
	defb 0e1h,0e1h,000h,0c0h,0c0h,020h,0c0h,040h,081h,0c1h,0c1h,000h,000h,000h,000h,000h,078h,000h,000h,000h,0f0h,001h,001h,0f8h	; bf4f  ..... .@........x.......
	defb 01fh,0c0h,000h,08fh,000h,0e0h,0cfh,000h,0e0h,067h,080h,0f0h,007h,0c0h,0f0h,0f7h,00ch,0f8h,00fh,00ch,000h,0f9h,0f8h,000h	; bf67  .........g..............
	defb 060h,041h,086h,063h,040h,08fh,066h,021h,04fh,070h,023h,047h,072h,021h,047h,0b1h,013h,026h,0bbh,013h,020h,038h,090h,022h	; bf7f  `A.c@.f!Op#Gr!G..&.. 8."

; ----------------------------------------------------------------------
; DATOS dibujo_BF97: 2 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 19 de la lista 0xAE19 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4CA0 (48 bytes)
;   0xbf97..0xbfc7  (48 bytes)
DATA_dibujo_BF97:
	defb 081h,001h,07eh,080h,000h,07eh,080h,001h,07fh,080h,001h,07fh,080h,001h,07eh,080h,081h,0feh,0c0h,0c1h,040h,0c0h,0c5h,0c0h	; bf97  ..~..~........~.....@...
	defb 001h,003h,0ffh,001h,003h,0ffh,003h,003h,0fdh,003h,003h,0ffh,000h,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh	; bfaf  ........................

; ----------------------------------------------------------------------
; DATOS dibujo_BFC7: 2 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 20 de la lista 0xAE19 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4CA0 (48 bytes)
;   0xbfc7..0xbff7  (48 bytes)
DATA_dibujo_BFC7:
	defb 038h,039h,040h,010h,011h,002h,010h,031h,026h,010h,031h,026h,090h,0b0h,027h,0d0h,0f7h,020h,0d3h,0f7h,023h,0d0h,0f7h,020h	; bfc7  89@....1&.1&..'.. ..#..
	defb 07ah,05eh,0b0h,07eh,076h,0a0h,03ch,02ch,080h,000h,0c0h,000h,001h,0f1h,000h,007h,0c7h,000h,03fh,0bfh,000h,036h,0b6h,000h	; bfdf  z^.~v.<,..........?..6..

; ----------------------------------------------------------------------
; DATOS sin identificar  0xbff7..0xc000  (9 bytes)
DATA_BFF7:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bff7  .........
