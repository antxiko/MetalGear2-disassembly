; ==========================================================================
; METAL GEAR 2 SOLID SNAKE - Konami (1990) - MSX2 - MegaROM RC-767 de 512 KB (Konami SCC) - banco 41 (se ejecuta en 0xa000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x0a000


; ----------------------------------------------------------------------
; DATOS dibujo_9FE6_cola: 5 caracteres de 8x8 a 2 bits por punto (16 bytes
;   cada uno), ficha 2 de la lista 0x9068 (p00:4D92, p00:4DF5) (sigue del
;   banco 40); lo leen p00:4C0C (54 bytes)
;   0xa000..0xa036  (54 bytes)
DATA_dibujo_9FE6_cola:
	defb 0edh,010h,0ffh,061h,0b7h,020h,0afh,0a8h,04fh,00ch,0f7h,0b4h,0ffh,090h,0e7h,000h	; a000  ...a. ..O.......
	defb 03fh,0c0h,0bfh,004h,0fbh,082h,0ffh,000h,07eh,040h,0efh,051h,0e2h,09ch,0d1h,080h	; a010  ?.......~@.Q....
	defb 0efh,020h,0dfh,018h,0efh,009h,0cfh,0cbh,07fh,062h,0f7h,012h,0ffh,000h,0ffh,000h	; a020  . .......b......
	defb 0cfh,014h,0ffh,006h,0f7h,004h	; a030

; ----------------------------------------------------------------------
; DATOS dibujo_A036: 5 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 3 de la lista 0x9068 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (80 bytes)
;   0xa036..0xa086  (80 bytes)
DATA_dibujo_A036:
	defb 0fbh,01bh,0f7h,004h,0f4h,003h,0fch,00bh,0ffh,000h,0ffh,001h,0ffh,00ch,0f3h,033h	; a036  ...............3
	defb 0fbh,01bh,0f7h,044h,0f4h,063h,0fch,06bh,0ffh,060h,0ffh,041h,0ffh,04ch,0f3h,033h	; a046  ...D.c.k.`.A.L.3
	defb 0cfh,0cbh,07fh,060h,0f4h,013h,0fch,003h,0ffh,000h,0dfh,001h,0ffh,00ch,0f3h,033h	; a056  ...`...........3
	defb 0d3h,003h,0fdh,035h,02eh,0c6h,02ah,0c0h,02fh,0c3h,077h,080h,0dfh,012h,0b5h,0b1h	; a066  ...5..*./.w.....
	defb 0dfh,0d8h,073h,030h,0eeh,009h,03eh,001h,0fch,0c3h,0fch,003h,0f7h,044h,0fdh,00dh	; a076  ..s0..>......D..

; ----------------------------------------------------------------------
; DATOS dibujo_A086: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 4 de la lista 0x9068 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (32 bytes)
;   0xa086..0xa0a6  (32 bytes)
DATA_dibujo_A086:
	defb 0ech,024h,0cbh,003h,0ffh,024h,0efh,010h,0c0h,01eh,0e1h,000h,0ffh,001h,0e4h,000h	; a086  .$...$..........
	defb 0ech,024h,0cbh,083h,07fh,024h,06fh,010h,0c0h,01eh,0e1h,040h,0ffh,0c1h,0e4h,040h	; a096  .$...$o....@...@

; ----------------------------------------------------------------------
; DATOS dibujo_A0A6: 19 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 5 de la lista 0x9068 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (456 bytes)
;   0xa0a6..0xa26e  (456 bytes)
DATA_dibujo_A0A6:
	defb 0c8h,0cfh,000h,078h,067h,000h,0f0h,017h,000h,0fch,003h,000h,0feh,001h,000h,0d8h,017h,010h,0f8h,007h,000h,0f0h,00fh,000h	; a0a6  ...xg...................
	defb 0f0h,02fh,000h,0f0h,0cbh,004h,054h,049h,002h,032h,02dh,000h,0f0h,06fh,000h,0d0h,04dh,002h,0e2h,0d9h,004h,0e4h,05bh,000h	; a0be  ./....TI.2-..o..M.....[.
	defb 060h,01fh,000h,060h,05dh,002h,092h,089h,004h,0f4h,00bh,000h,0e0h,01fh,000h,0c0h,03bh,004h,044h,099h,022h,022h,0ddh,000h	; a0d6  `..`].............D.""..
	defb 0cch,0cbh,000h,07ch,063h,000h,0f4h,013h,000h,0ffh,000h,000h,0ffh,000h,000h,0d8h,017h,010h,0f8h,007h,000h,0f0h,00fh,000h	; a0ee  ...|c...................
	defb 0f7h,000h,000h,0fbh,000h,000h,0feh,00dh,001h,0eeh,011h,001h,0ech,013h,003h,0fch,003h,003h,0f7h,004h,000h,0fdh,00dh,000h	; a106  ........................
	defb 000h,0ffh,000h,003h,0ech,010h,014h,063h,08bh,08ch,073h,003h,007h,0f8h,000h,01fh,061h,080h,0bfh,04ch,000h,033h,0f3h,000h	; a11e  .......c..s.....a..L.3..
	defb 000h,0ffh,000h,0c0h,02eh,011h,031h,0c6h,0c8h,098h,067h,0e0h,0e0h,01fh,000h,0f0h,0c7h,0c8h,0fch,0f2h,041h,0d7h,010h,000h	; a136  ......1...g.........A...
	defb 000h,0ffh,000h,000h,0bbh,044h,045h,098h,022h,022h,0ddh,001h,002h,0fdh,001h,003h,0dch,020h,023h,099h,045h,0ffh,000h,000h	; a14e  .....DE.""....... #.E...
	defb 000h,0ffh,000h,000h,0ddh,022h,0e2h,019h,004h,024h,0dbh,0c0h,010h,0efh,0e0h,01ch,0e3h,0e0h,0f2h,001h,000h,0cbh,0cah,000h	; a166  ....."...$..............
	defb 0fdh,038h,000h,0b7h,090h,000h,0ffh,0dah,000h,06eh,001h,001h,0deh,091h,001h,09fh,000h,000h,0ffh,001h,001h,0ffh,000h,000h	; a17e  .8.......n..............
	defb 0ffh,000h,000h,07eh,040h,000h,0ffh,011h,010h,03eh,0dch,0dch,011h,0e0h,0e0h,01fh,0e0h,0e0h,0f3h,000h,000h,0cbh,0cah,000h	; a196  ...~@....>..............
	defb 0f7h,060h,000h,07fh,068h,000h,0ffh,008h,000h,02fh,0c0h,0c0h,01fh,0e8h,0e0h,01fh,0e0h,0e0h,0f3h,000h,000h,0cbh,0cah,000h	; a1ae  .`..h..../..............
	defb 06bh,02bh,000h,0dah,012h,000h,07ch,080h,080h,03fh,0d1h,0c0h,0bbh,040h,040h,07dh,010h,010h,0ffh,081h,000h,0dfh,058h,000h	; a1c6  k+....|..?...@@}......X.
	defb 0afh,0a8h,000h,04fh,00ch,000h,0f4h,0b3h,003h,0feh,091h,003h,0efh,000h,000h,0f7h,0c3h,0c3h,0bfh,019h,001h,0efh,0ach,000h	; a1de  ...O....................
	defb 000h,0ffh,000h,003h,0b8h,044h,044h,09bh,023h,024h,0dbh,003h,007h,0f8h,000h,01fh,0c1h,020h,03fh,08ch,040h,073h,0b3h,000h	; a1f6  .....DD.#$....... ?.@s..
	defb 000h,0ffh,000h,0c0h,01dh,022h,022h,0d9h,0c4h,094h,06bh,0e0h,0e0h,01fh,000h,0f0h,0cbh,0c4h,0fch,0f1h,042h,0d6h,011h,000h	; a20e  .....""...k.........B...
	defb 0cfh,0c8h,000h,07fh,060h,000h,0f4h,013h,003h,0fch,003h,003h,0ffh,000h,000h,0dfh,001h,000h,0ffh,00ch,000h,0f3h,033h,000h	; a226  ....`.................3.
	defb 0ech,024h,000h,0cbh,003h,000h,03fh,0c4h,0c0h,09fh,060h,0e0h,0feh,01eh,01eh,0f1h,0c0h,0c0h,0ffh,0f1h,040h,0d4h,010h,000h	; a23e  .$....?...`.........@...
	defb 0f0h,02fh,000h,0f0h,00dh,002h,032h,0c9h,0c4h,094h,06bh,0e0h,0f0h,00fh,000h,0f0h,0cbh,0c4h,0fch,0f1h,042h,0d6h,011h,000h	; a256  ./....2...k.........B...

; ----------------------------------------------------------------------
; DATOS dibujo_A26E: 6 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 6 de la lista 0x9068 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (144 bytes)
;   0xa26e..0xa2fe  (144 bytes)
DATA_dibujo_A26E:
	defb 0ech,024h,080h,0cbh,003h,080h,0ffh,024h,080h,0efh,010h,080h,0c0h,01eh,080h,0e1h,000h,080h,0dfh,001h,0a0h,0a4h,000h,0c0h	; a26e  .$.....$................
	defb 0fbh,01bh,0c0h,0f7h,006h,0c0h,093h,042h,0e0h,0bdh,00ch,0e0h,0fbh,002h,0e0h,0b7h,054h,0c0h,0bfh,01eh,0c0h,0f7h,014h,0c0h	; a286  .......B........T.......
	defb 0ffh,000h,0c0h,0bfh,048h,0c0h,0bfh,00ch,0c0h,0fbh,008h,080h,0ffh,008h,000h,0f9h,000h,080h,09fh,040h,0e0h,0bbh,000h,0ffh	; a29e  ....H..............@....
	defb 0ffh,000h,000h,0feh,000h,0c0h,0afh,051h,0c0h,0a2h,01ch,0c0h,0f1h,000h,0e0h,0bfh,040h,0f0h,097h,020h,0e0h,0dfh,001h,0e0h	; a2b6  .......Q........@.. ....
	defb 0fdh,000h,0f8h,0bdh,041h,0f8h,09eh,022h,0f8h,0dch,004h,0f0h,0fbh,003h,0f0h,0d9h,020h,0f0h,09fh,043h,0f0h,0b9h,001h,0f0h	; a2ce  ....A.."........ ..C....
	defb 0fdh,005h,0f0h,0dfh,022h,0f8h,09fh,041h,0f8h,0bfh,006h,0f0h,0fbh,002h,0f0h,0bbh,042h,0f0h,097h,024h,0e0h,0dfh,000h,0e0h	; a2e6  ...."..A........B..$....

; ----------------------------------------------------------------------
; DATOS dibujo_A2FE: 1 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 7 de la lista 0x9068 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (24 bytes)
;   0xa2fe..0xa316  (24 bytes)
DATA_dibujo_A2FE:
	defb 000h,000h,0ffh,0d1h,000h,03fh,039h,0c0h,00eh,098h,0e0h,087h,0f0h,000h,00fh,038h,0c0h,0cfh,0bdh,0f0h,043h,0d7h,010h,000h	; a2fe  .....?9........8....C...

; ----------------------------------------------------------------------
; DATOS dibujo_A316: 8 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 8 de la lista 0x9068 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (192 bytes)
;   0xa316..0xa3d6  (192 bytes)
DATA_dibujo_A316:
	defb 0e0h,03fh,024h,0f3h,03fh,03bh,0d4h,05ch,01fh,0b4h,01ch,017h,0ffh,01fh,01fh,0deh,05fh,01eh,0b3h,03fh,033h,0c0h,07fh,04ch	; a316  .?$.?..\........_..?3..L
	defb 0ffh,001h,001h,0ffh,041h,001h,0beh,022h,003h,0deh,006h,007h,0fch,00ch,00fh,0fch,03ch,01fh,0d3h,05fh,01bh,0b0h,01fh,012h	; a32e  ....A.."........<.._....
	defb 0ffh,0c0h,0c0h,0ffh,0e2h,0e0h,03dh,034h,0f0h,03bh,030h,0f0h,03fh,030h,0f0h,07fh,074h,0f0h,0cbh,0fah,0e8h,005h,0fch,04ch	; a346  ......=4..0.?0..t......L
	defb 0ffh,000h,000h,0ffh,044h,000h,0bbh,023h,001h,0deh,002h,003h,0feh,002h,003h,0ffh,023h,003h,0dfh,046h,003h,0ffh,0ffh,0ffh	; a35e  ....D..#........#..F....
	defb 0ffh,000h,000h,0ffh,022h,000h,0ddh,0c4h,0c0h,03bh,020h,0e0h,01fh,010h,0f0h,01fh,01ch,0fch,0f3h,0feh,0feh,001h,0ffh,035h	; a376  ...."..... ............5
	defb 0ffh,0ffh,0ffh,0feh,03fh,03fh,0feh,06fh,03eh,0beh,023h,03fh,0f1h,01fh,01fh,0ffh,04fh,00fh,0bfh,027h,007h,0deh,003h,002h	; a38e  ....??.o>.#?....O..'....
	defb 0fdh,007h,007h,0fch,047h,006h,0bdh,027h,005h,0dah,00eh,00bh,0fah,00eh,00fh,0fbh,02fh,00fh,0dfh,04eh,00fh,0ffh,0ffh,0ffh	; a3a6  ....G..'......../..N....
	defb 0ffh,0ffh,0ffh,0feh,03fh,03fh,0feh,0efh,0feh,03eh,023h,0ffh,011h,01fh,0ffh,01fh,01fh,0ffh,0f3h,0ffh,0ffh,001h,0ffh,035h	; a3be  ....??...>#............5

; ----------------------------------------------------------------------
; DATOS dibujo_A3D6: 3 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 9 de la lista 0x9068 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (72 bytes)
;   0xa3d6..0xa41e  (72 bytes)
DATA_dibujo_A3D6:
	defb 01fh,0a0h,000h,01fh,0a3h,003h,01ch,0a4h,007h,01eh,0a6h,005h,03fh,08fh,00fh,037h,09ch,01fh,027h,0e6h,027h,063h,077h,077h	; a3d6  ............?..7..'.'cww
	defb 000h,0ffh,000h,003h,003h,003h,0fch,004h,007h,0feh,006h,005h,00fh,0ffh,00fh,017h,01ch,01fh,0e7h,026h,027h,0e3h,077h,077h	; a3ee  ...................&'.ww
	defb 000h,0ffh,000h,080h,080h,080h,07fh,060h,0e0h,03fh,030h,0f0h,0b0h,0bfh,0f0h,078h,0f8h,0f8h,0dfh,0d8h,0d8h,09fh,0bch,0bch	; a406  .......`.?0....x........

; ----------------------------------------------------------------------
; DATOS dibujo_A41E: 1 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 10 de la lista 0x9068 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (24 bytes)
;   0xa41e..0xa436  (24 bytes)
DATA_dibujo_A41E:
	defb 004h,039h,03fh,008h,033h,03fh,000h,01fh,01fh,000h,00fh,00fh,000h,00fh,00fh,000h,007h,007h,000h,087h,001h,006h,0f9h,000h	; a41e  .9?.3?..................

; ----------------------------------------------------------------------
; DATOS dibujo_A436: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 0 de la lista 0x90A0 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (32 bytes)
;   0xa436..0xa456  (32 bytes)
DATA_dibujo_A436:
	defb 000h,07fh,07eh,001h,07eh,03fh,07eh,03fh,07eh,03fh,07eh,03fh,07eh,03fh,000h,000h	; a436  ..~.~?~?~?~?~?..
	defb 000h,041h,040h,021h,060h,031h,070h,039h,078h,03dh,07ch,03fh,07eh,03fh,000h,000h	; a446  .A@!`1p9x=|?~?..

; ----------------------------------------------------------------------
; DATOS dibujo_A456: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 1 de la lista 0x90A0 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (32 bytes)
;   0xa456..0xa476  (32 bytes)
DATA_dibujo_A456:
	defb 001h,0feh,001h,080h,001h,0beh,001h,0beh,001h,0beh,001h,0beh,001h,0beh,0ffh,000h	; a456  ................
	defb 001h,0feh,001h,080h,041h,0feh,061h,0feh,071h,0feh,079h,0feh,07dh,0feh,001h,0feh	; a466  ....A.a.q.y.}...

; ----------------------------------------------------------------------
; DATOS dibujo_A476: 1 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 2 de la lista 0x90A0 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (24 bytes)
;   0xa476..0xa48e  (24 bytes)
DATA_dibujo_A476:
	defb 07fh,000h,000h,041h,03eh,000h,041h,000h,01eh,041h,000h,00eh,041h,000h,006h,041h,000h,002h,041h,000h,000h,0ffh,0ffh,0ffh	; a476  ...A>.A..A..A..A..A.....

; ----------------------------------------------------------------------
; DATOS dibujo_A48E: 2 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 3 de la lista 0x90A0 (p00:4D92, p00:4DF5); lo leen p00:4C0C (16
;   bytes)
;   0xa48e..0xa49e  (16 bytes)
DATA_dibujo_A48E:
	defb 000h,000h,000h,000h,000h,000h,000h,000h	; a48e  ........
	defb 080h,080h,080h,080h,080h,080h,080h,080h	; a496  ........

; ----------------------------------------------------------------------
; DATOS dibujo_A49E: 3 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 4 de la lista 0x90A0 (p00:4D92, p00:4DF5); lo leen p00:4C0C (24
;   bytes)
;   0xa49e..0xa4b6  (24 bytes)
DATA_dibujo_A49E:
	defb 080h,080h,080h,080h,080h,080h,080h,080h	; a49e  ........
	defb 000h,000h,000h,000h,000h,000h,000h,000h	; a4a6  ........
	defb 000h,0ffh,04ch,098h,030h,060h,000h,000h	; a4ae  ..L.0`..

; ----------------------------------------------------------------------
; DATOS dibujo_A4B6: 3 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 5 de la lista 0x90A0 (p00:4D92, p00:4DF5); lo leen p00:4C0C (24
;   bytes)
;   0xa4b6..0xa4ce  (24 bytes)
DATA_dibujo_A4B6:
	defb 00fh,00fh,00fh,00fh,00fh,00fh,00fh,00fh	; a4b6  ........
	defb 00fh,00fh,00fh,00fh,00fh,00fh,00fh,000h	; a4be  ........
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h	; a4c6  ........

; ----------------------------------------------------------------------
; DATOS dibujo_A4CE: 23 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 6 de la lista 0x90A0 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (368 bytes)
;   0xa4ce..0xa63e  (368 bytes)
DATA_dibujo_A4CE:
	defb 040h,0c0h,040h,0c0h,040h,0c0h,040h,0c0h,040h,0c0h,040h,0c0h,040h,0c0h,040h,0c0h	; a4ce  @.@.@.@.@.@.@.@.
	defb 001h,002h,001h,002h,001h,002h,001h,002h,001h,002h,001h,002h,001h,002h,001h,002h	; a4de  ................
	defb 0d0h,0b0h,0d0h,0b0h,0d0h,0b0h,0d0h,0b0h,0d0h,0b0h,0d4h,0b4h,0d5h,0b5h,0ffh,000h	; a4ee  ................
	defb 000h,000h,000h,000h,000h,000h,055h,000h,055h,000h,000h,055h,020h,020h,0ffh,000h	; a4fe  ......U.U..U  ..
	defb 001h,002h,001h,002h,001h,002h,001h,002h,001h,002h,041h,042h,0c9h,0cah,0ffh,000h	; a50e  ..........AB....
	defb 081h,082h,081h,0bah,081h,082h,081h,0bah,081h,082h,081h,082h,081h,082h,0ffh,000h	; a51e  ................
	defb 0d0h,0b0h,0d0h,0b0h,0d0h,0b0h,0d0h,0b0h,0d0h,0b0h,0d0h,0b0h,0d0h,0b0h,0d0h,0b0h	; a52e  ................
	defb 081h,082h,081h,0bah,081h,082h,081h,0bah,081h,082h,081h,0bah,081h,082h,081h,0bah	; a53e  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,080h,000h,0c0h,080h,060h,0c0h,020h	; a54e  .............`.
	defb 0e0h,010h,0e0h,010h,0e0h,010h,0e0h,010h,0e0h,010h,0e0h,010h,0e0h,010h,0e0h,010h	; a55e  ................
	defb 0e0h,010h,0e0h,010h,0e0h,010h,0e0h,010h,0e0h,010h,0e0h,010h,0e0h,010h,0efh,010h	; a56e  ................
	defb 0f1h,00eh,001h,0f0h,0f1h,00eh,0f1h,00eh,0e1h,01eh,081h,07eh,001h,0feh,0ffh,000h	; a57e  ...........~....
	defb 000h,0ffh,040h,0c0h,040h,0c0h,040h,0c0h,040h,0c0h,040h,0e2h,040h,0f7h,07fh,080h	; a58e  ..@.@.@.@.@.@...
	defb 000h,0ffh,000h,000h,000h,000h,000h,000h,000h,000h,000h,044h,000h,0ddh,0ffh,000h	; a59e  ...........D....
	defb 001h,0feh,001h,002h,001h,002h,001h,002h,001h,002h,001h,046h,001h,076h,0ffh,000h	; a5ae  ...........F.v..
	defb 080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,0ffh,000h	; a5be  ................
	defb 001h,002h,001h,002h,001h,002h,001h,002h,001h,002h,001h,002h,001h,002h,001h,002h	; a5ce  ................
	defb 020h,040h,020h,040h,020h,040h,020h,040h,010h,060h,010h,060h,010h,060h,010h,060h	; a5de   @ @ @ @.`.`.`.`
	defb 00ah,074h,00ah,064h,00ah,064h,00ah,065h,009h,066h,009h,066h,009h,066h,009h,076h	; a5ee  .t.d.d.e.f.f.f.v
	defb 009h,076h,009h,066h,009h,066h,009h,066h,009h,066h,009h,066h,009h,066h,009h,076h	; a5fe  .v.f.f.f.f.f.f.v
	defb 000h,0ffh,0eeh,0ffh,000h,0ffh,000h,0ffh,000h,011h,000h,0ffh,000h,0ffh,0ffh,000h	; a60e  ................
	defb 000h,0ffh,000h,0fch,000h,000h,0ffh,000h,000h,0f0h,000h,0fch,001h,001h,003h,0e3h	; a61e  ................
	defb 001h,081h,01bh,01bh,0bdh,025h,0bdh,065h,099h,079h,083h,063h,080h,078h,0ffh,0ffh	; a62e  .....%.e.y.c.x..

; ----------------------------------------------------------------------
; DATOS dibujo_A63E: 8 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 7 de la lista 0x90A0 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (128 bytes)
;   0xa63e..0xa6be  (128 bytes)
DATA_dibujo_A63E:
	defb 000h,000h,0ffh,0ffh,0c0h,0ffh,080h,0ffh,080h,0ffh,080h,0ffh,080h,0ffh,080h,0ffh	; a63e  ................
	defb 000h,000h,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; a64e  ................
	defb 0f0h,00fh,00fh,0ffh,0f0h,00fh,0f0h,00fh,0f0h,00fh,0f0h,00fh,0f0h,00fh,0f0h,00fh	; a65e  ................
	defb 005h,003h,005h,003h,005h,003h,005h,003h,009h,007h,009h,007h,009h,007h,009h,007h	; a66e  ................
	defb 071h,007h,079h,00fh,079h,00fh,079h,00fh,0f9h,00fh,0f9h,00fh,0f9h,00fh,0f1h,007h	; a67e  q.y.y.y.........
	defb 0f1h,007h,0f9h,00fh,0f9h,00fh,0f9h,00fh,0f9h,00fh,0f9h,00fh,0f9h,00fh,0f1h,007h	; a68e  ................
	defb 0ffh,000h,000h,0ffh,000h,000h,000h,000h,000h,000h,001h,001h,001h,001h,001h,001h	; a69e  ................
	defb 0ffh,000h,001h,0feh,001h,000h,001h,000h,003h,001h,003h,001h,003h,001h,003h,001h	; a6ae  ................

; ----------------------------------------------------------------------
; DATOS dibujo_A6BE: 7 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 8 de la lista 0x90A0 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (112 bytes)
;   0xa6be..0xa72e  (112 bytes)
DATA_dibujo_A6BE:
	defb 007h,07ch,003h,000h,0ffh,000h,007h,07ch,003h,000h,0ffh,000h,0ffh,000h,0ffh,000h	; a6be  .|.....|........
	defb 0ffh,0ffh,0ffh,000h,000h,0ffh,000h,000h,0ffh,000h,065h,0ffh,020h,0ffh,000h,0ffh	; a6ce  ..........e. ...
	defb 06eh,06eh,06eh,000h,000h,06eh,000h,000h,000h,000h,06eh,06eh,000h,06eh,000h,000h	; a6de  nnn..n....nn.n..
	defb 0eeh,0eeh,0eeh,000h,000h,0eeh,000h,000h,000h,000h,0eeh,0eeh,000h,0eeh,000h,000h	; a6ee  ................
	defb 0ffh,0ffh,0ffh,000h,080h,0ffh,080h,0ffh,080h,0ffh,080h,0ffh,080h,0ffh,080h,0ffh	; a6fe  ................
	defb 0ffh,0ffh,0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; a70e  ................
	defb 0ffh,0ffh,07fh,000h,040h,07fh,040h,07fh,040h,07fh,040h,07fh,040h,07fh,040h,07fh	; a71e  ....@.@.@.@.@.@.

; ----------------------------------------------------------------------
; DATOS dibujo_A72E: 5 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 9 de la lista 0x90A0 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (80 bytes)
;   0xa72e..0xa77e  (80 bytes)
DATA_dibujo_A72E:
	defb 000h,0fch,0fah,0fch,002h,0fch,002h,0fch,002h,0fch,002h,0fch,002h,0fch,002h,0fch	; a72e  ................
	defb 002h,0fch,002h,0fch,002h,0fch,002h,0fch,002h,0fch,002h,0fch,002h,0fch,002h,0fch	; a73e  ................
	defb 002h,0fch,002h,0fch,002h,0fch,002h,0fch,002h,0fch,002h,0fch,002h,0fch,0feh,000h	; a74e  ................
	defb 080h,0ffh,080h,0ffh,080h,0ffh,080h,0ffh,080h,0ffh,0ffh,0ffh,07fh,080h,000h,000h	; a75e  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,0ffh,0ffh,0ffh,000h,000h,000h	; a76e  ................

; ----------------------------------------------------------------------
; DATOS dibujo_A77E: 3 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 10 de la lista 0x90A0 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (48 bytes)
;   0xa77e..0xa7ae  (48 bytes)
DATA_dibujo_A77E:
	defb 0ffh,000h,000h,0ffh,0ffh,000h,0ffh,000h,0f0h,000h,0e0h,007h,0c0h,01fh,083h,03fh	; a77e  ...............?
	defb 0ffh,000h,000h,0ffh,09fh,060h,03fh,0c0h,000h,000h,000h,0ffh,000h,0ffh,0ffh,0ffh	; a78e  .....`?.........
	defb 0ffh,000h,000h,0ffh,0fbh,004h,0f7h,008h,01fh,000h,00fh,0c0h,007h,0f0h,083h,0f8h	; a79e  ................

; ----------------------------------------------------------------------
; DATOS dibujo_A7AE: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 11 de la lista 0x90A0 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (32 bytes)
;   0xa7ae..0xa7ce  (32 bytes)
DATA_dibujo_A7AE:
	defb 001h,0feh,0fdh,0feh,005h,006h,005h,006h,005h,006h,005h,006h,005h,006h,005h,006h	; a7ae  ................
	defb 005h,006h,005h,006h,005h,006h,005h,006h,005h,006h,005h,006h,005h,006h,005h,006h	; a7be  ................

; ----------------------------------------------------------------------
; DATOS dibujo_A7CE: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 12 de la lista 0x90A0 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (16 bytes)
;   0xa7ce..0xa7de  (16 bytes)
DATA_dibujo_A7CE:
	defb 000h,07fh,07fh,000h,000h,000h,000h,000h,040h,040h,040h,040h,040h,040h,040h,040h	; a7ce  ........@@@@@@@@

; ----------------------------------------------------------------------
; DATOS dibujo_A7DE: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 13 de la lista 0x90A0 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (16 bytes)
;   0xa7de..0xa7ee  (16 bytes)
DATA_dibujo_A7DE:
	defb 0ffh,0ffh,060h,0e0h,07fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,0ffh,0ffh	; a7de  ..`.............

; ----------------------------------------------------------------------
; DATOS dibujo_A7EE: 4 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 14 de la lista 0x90A0 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (64 bytes)
;   0xa7ee..0xa82e  (64 bytes)
DATA_dibujo_A7EE:
	defb 0bfh,000h,0bfh,000h,0bfh,000h,0bfh,000h,0bfh,000h,0bfh,000h,0bfh,000h,0bfh,000h	; a7ee  ................
	defb 0ffh,001h,0ffh,001h,0ffh,001h,0ffh,001h,0ffh,001h,0ffh,001h,0ffh,001h,0ffh,001h	; a7fe  ................
	defb 0bfh,000h,0bfh,000h,0ffh,0bfh,000h,0bfh,0ffh,0bfh,0bfh,000h,0ffh,0ffh,0ffh,0ffh	; a80e  ................
	defb 0ffh,001h,0ffh,001h,0ffh,0ffh,001h,0ffh,0ffh,0ffh,0ffh,001h,0ffh,0ffh,0ffh,0ffh	; a81e  ................

; ----------------------------------------------------------------------
; DATOS dibujo_A82E: 3 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 15 de la lista 0x90A0 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (72 bytes)
;   0xa82e..0xa876  (72 bytes)
DATA_dibujo_A82E:
	defb 0ffh,000h,000h,000h,0ffh,0ffh,000h,000h,000h,000h,000h,000h,0ffh,0ffh,000h,0bfh,0bfh,000h,0bfh,0bfh,000h,000h,040h,000h	; a82e  ......................@.
	defb 0ffh,000h,000h,000h,0ffh,0ffh,000h,000h,000h,000h,000h,000h,0ffh,0ffh,000h,0ffh,0ffh,000h,0ffh,0ffh,000h,001h,000h,001h	; a846  ........................
	defb 010h,092h,05ah,010h,082h,05ah,000h,082h,05ah,000h,082h,042h,000h,082h,07eh,000h,0feh,07eh,000h,000h,000h,0ffh,000h,000h	; a85e  ..Z..Z..Z..B..~..~......

; ----------------------------------------------------------------------
; DATOS dibujo_A876: 31 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 16 de la lista 0x90A0 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (744 bytes)
;   0xa876..0xab5e  (744 bytes)
DATA_dibujo_A876:
	defb 0fdh,000h,001h,081h,000h,001h,07fh,000h,03dh,0ffh,03ch,041h,0ffh,0bdh,041h,0ffh,09fh,060h,0f0h,0e7h,037h,0d8h,090h,058h	; a876  ........=.<A..A..`..7..X
	defb 0ffh,080h,080h,083h,080h,080h,0ffh,082h,0fah,0feh,0f8h,084h,0ffh,0fbh,085h,0ffh,0f3h,009h,017h,0c7h,0d1h,027h,003h,025h	; a88e  .....................'.%
	defb 0ffh,0bfh,07fh,0efh,0a0h,060h,0f8h,0a0h,067h,0f0h,0a3h,06ch,0f0h,0a7h,068h,0f0h,0a7h,068h,0f0h,0a7h,068h,0f0h,0a7h,068h	; a8a6  .....`..g..l..h..h..h..h
	defb 0ffh,0fbh,0fdh,0e7h,003h,005h,017h,003h,0e5h,007h,0c3h,035h,007h,0e3h,015h,007h,0e3h,015h,007h,0e3h,015h,007h,0e3h,015h	; a8be  ...........5............
	defb 0f0h,0a7h,068h,0f0h,0a0h,06fh,0ffh,0a0h,060h,0e1h,0a1h,063h,0e0h,0a0h,061h,0efh,080h,06fh,0ffh,0cfh,030h,0ffh,0f0h,08fh	; a8d6  ..h..o..`..c..a..o..0...
	defb 007h,0e3h,015h,007h,003h,0f5h,0f7h,003h,005h,007h,003h,085h,007h,003h,005h,0efh,003h,0edh,0ffh,0e7h,019h,0ffh,01fh,0e3h	; a8ee  ........................
	defb 0ffh,0ffh,0ffh,0ffh,006h,005h,007h,006h,005h,003h,002h,003h,003h,003h,003h,001h,001h,001h,000h,000h,000h,0ffh,0ffh,0ffh	; a906  ........................
	defb 03ch,0b4h,04ch,078h,068h,098h,070h,070h,090h,063h,040h,0a0h,066h,042h,0a2h,06ch,044h,0a4h,068h,040h,0a0h,078h,048h,0a8h	; a91e  <.Lxh.pp.c@.fB.lD.h@.xH.
	defb 03eh,019h,024h,09eh,00dh,050h,0aeh,00ch,042h,026h,004h,0d2h,0a6h,084h,0d2h,046h,044h,0f2h,0a6h,024h,072h,0a6h,024h,072h	; a936  >.$..P..B&.....FD..$r.$r
	defb 078h,048h,0a8h,07eh,04eh,0a8h,07eh,04ch,0aah,07eh,04ch,0aah,07eh,04ch,0aah,07eh,04ch,0aah,07eh,024h,0d2h,00eh,004h,0f2h	; a94e  xH.~N.~L.~L.~L.~L.~$....
	defb 026h,024h,0f2h,0a6h,024h,072h,0a6h,024h,072h,0a6h,024h,072h,0aeh,024h,072h,0aeh,024h,062h,07eh,048h,0c6h,000h,000h,0ffh	; a966  &$..$r.$r.$r.$r.$b~H....
	defb 088h,008h,00eh,098h,00eh,008h,09eh,008h,008h,098h,008h,008h,09ch,00ch,00ch,09ch,00ch,00eh,09eh,00ch,00ch,08ch,00ch,00ch	; a97e  ........................
	defb 0dfh,080h,040h,0dfh,080h,040h,0dfh,080h,040h,0dfh,080h,040h,0efh,0a0h,060h,0efh,0a0h,060h,0efh,0a0h,060h,0efh,0a0h,060h	; a996  ..@..@..@..@..`..`..`..`
	defb 0f0h,0a0h,06eh,0e0h,0aeh,070h,0feh,0b0h,070h,0f0h,0b0h,070h,0f8h,0b8h,078h,0fch,0a0h,062h,0e2h,0a0h,060h,0f8h,038h,0f8h	; a9ae  ..n..p..p..p..x..b..`.8.
	defb 001h,00fh,0f0h,001h,0efh,010h,0e1h,00fh,010h,001h,00fh,010h,011h,01fh,020h,011h,01fh,0e0h,0d1h,01fh,020h,011h,00fh,020h	; a9c6  .............. ..... ..
	defb 0f7h,0b0h,070h,0f7h,0b0h,070h,0f7h,0b0h,070h,0f7h,0b0h,070h,0fbh,0b8h,078h,0fbh,0b8h,078h,0fbh,0b8h,078h,0fbh,038h,0f8h	; a9de  ..p..p..p..p..x..x..x.8.
	defb 07dh,0bch,07ch,07dh,0bch,07ch,07dh,0bch,07ch,07dh,0bch,07ch,07dh,0bch,07ch,07dh,0bch,07ch,07dh,0bch,07ch,07dh,0bdh,07dh	; a9f6  }.|}.|}.|}.|}.|}.|}.|}.}
	defb 07fh,0bfh,07fh,061h,0a0h,060h,07eh,0beh,07eh,07eh,0beh,07eh,07eh,0beh,07eh,07eh,0beh,07eh,07eh,0beh,07eh,0ffh,0ffh,0ffh	; aa0e  ...a.`~.~~.~~.~~.~~.~...
	defb 07ch,0bch,07ch,07ch,0b0h,072h,07ch,0bch,07ch,07ch,0bch,07ch,07eh,0bch,07ch,07ch,0bch,07ch,07ch,0bch,07ch,07fh,0bfh,07fh	; aa26  |.||.r|.||.|~.||.||.|...
	defb 000h,000h,0ffh,0c0h,0ffh,000h,07fh,080h,000h,040h,040h,0c0h,048h,05fh,0c0h,048h,050h,0c7h,04dh,040h,0d2h,04fh,040h,0d0h	; aa3e  .........@@.H_.HP.M@.O@.
	defb 000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,000h,001h,001h,001h,001h,0fdh,001h,045h,001h,0b9h,0edh,001h,011h,0fdh,001h,001h	; aa56  ...............E........
	defb 001h,001h,0fdh,001h,0fdh,001h,0fdh,001h,001h,045h,001h,081h,07dh,001h,081h,045h,001h,081h,07dh,001h,081h,045h,001h,081h	; aa6e  .........E..}..E..}..E..
	defb 007h,0fdh,001h,007h,0fdh,001h,007h,0fdh,001h,007h,0fdh,001h,007h,0fdh,001h,0ffh,0fdh,001h,003h,001h,0fdh,001h,001h,001h	; aa86  ........................
	defb 04fh,040h,0d0h,04fh,040h,0d0h,049h,040h,0d4h,049h,044h,0d0h,049h,040h,0d4h,049h,040h,0d4h,049h,040h,0d4h,049h,040h,0d0h	; aa9e  O@.O@.I@.ID.I@.I@.I@.I@.
	defb 001h,001h,0edh,001h,0edh,001h,0edh,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,0edh,0edh,001h,001h,001h,001h,001h	; aab6  ........................
	defb 000h,000h,0ffh,000h,0fch,000h,0fdh,001h,001h,0fdh,001h,001h,0fdh,001h,001h,0fdh,001h,001h,0fdh,001h,001h,0fdh,001h,001h	; aace  ........................
	defb 088h,008h,00fh,098h,00bh,00ch,098h,00ah,00dh,098h,00ah,00dh,098h,00ah,00dh,098h,00ah,00dh,098h,00ah,00dh,088h,00ah,00dh	; aae6  ........................
	defb 088h,00ah,00dh,098h,00ah,00dh,098h,00ah,00dh,098h,00ah,00dh,098h,00ah,00dh,098h,00ah,00dh,098h,00ah,00dh,088h,00ah,00dh	; aafe  ........................
	defb 0ffh,0feh,000h,081h,082h,000h,0bdh,082h,000h,0bdh,082h,000h,0b5h,092h,000h,0b5h,082h,010h,0a5h,082h,000h,0bdh,082h,000h	; ab16  ........................
	defb 036h,03eh,07fh,022h,03eh,07fh,000h,000h,041h,03eh,000h,041h,03eh,03eh,07fh,022h,03eh,07fh,036h,03eh,07fh,000h,000h,041h	; ab2e  6>.">...A>.A>>.">.6>...A
	defb 0ffh,000h,000h,0ffh,000h,000h,080h,055h,055h,080h,000h,000h,0ffh,000h,000h,080h,040h,03eh,0beh,000h,040h,080h,000h,000h	; ab46  .......UU.......@>..@...

; ----------------------------------------------------------------------
; DATOS dibujo_AB5E: 3 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 0 de la lista 0x90F6 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (24 bytes)
;   0xab5e..0xab76  (24 bytes)
DATA_dibujo_AB5E:
	defb 000h,000h,000h,000h,000h,000h,000h,000h	; ab5e  ........
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,080h	; ab66  ........
	defb 001h,001h,001h,001h,001h,001h,001h,001h	; ab6e  ........

; ----------------------------------------------------------------------
; DATOS dibujo_AB76: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 1 de la lista 0x90F6 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (8 bytes)
;   0xab76..0xab7e  (8 bytes)
DATA_dibujo_AB76:
	defb 000h,000h,000h,000h,000h,000h,000h,0ffh	; ab76  ........

; ----------------------------------------------------------------------
; DATOS dibujo_AB7E: 4 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 2 de la lista 0x90F6 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (64 bytes)
;   0xab7e..0xabbe  (64 bytes)
DATA_dibujo_AB7E:
	defb 040h,080h,040h,080h,040h,080h,040h,080h,040h,080h,040h,080h,040h,080h,040h,0bfh	; ab7e  @.@.@.@.@.@.@.@.
	defb 040h,080h,040h,080h,040h,080h,040h,080h,040h,080h,040h,080h,040h,080h,040h,080h	; ab8e  @.@.@.@.@.@.@.@.
	defb 001h,000h,001h,000h,001h,000h,001h,000h,001h,000h,001h,000h,001h,000h,001h,0feh	; ab9e  ................
	defb 07fh,000h,07fh,080h,07fh,080h,07fh,080h,07fh,080h,07fh,080h,07fh,080h,07fh,080h	; abae  ................

; ----------------------------------------------------------------------
; DATOS dibujo_ABBE: 2 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 3 de la lista 0x90F6 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (16 bytes)
;   0xabbe..0xabce  (16 bytes)
DATA_dibujo_ABBE:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; abbe  ........
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h	; abc6  ........

; ----------------------------------------------------------------------
; DATOS dibujo_ABCE: 4 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 4 de la lista 0x90F6 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (64 bytes)
;   0xabce..0xac0e  (64 bytes)
DATA_dibujo_ABCE:
	defb 03fh,080h,03fh,080h,03fh,080h,03fh,080h,03fh,080h,03fh,080h,03fh,080h,03fh,080h	; abce  ?.?.?.?.?.?.?.?.
	defb 0ffh,000h,0ffh,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h	; abde  ................
	defb 03fh,080h,03fh,080h,03fh,080h,080h,0ffh,000h,080h,03fh,080h,03fh,080h,03fh,080h	; abee  ?.?.?.....?.?.?.
	defb 03fh,080h,03fh,080h,03fh,080h,03fh,080h,03fh,080h,03fh,080h,03fh,080h,000h,080h	; abfe  ?.?.?.?.?.?.?...

; ----------------------------------------------------------------------
; DATOS dibujo_AC0E: 3 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 5 de la lista 0x90F6 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (48 bytes)
;   0xac0e..0xac3e  (48 bytes)
DATA_dibujo_AC0E:
	defb 084h,0c0h,084h,0c0h,084h,0c0h,084h,0c0h,084h,0c0h,084h,0c0h,084h,0c0h,084h,0c0h	; ac0e  ................
	defb 085h,0c0h,085h,0c0h,085h,0c0h,085h,0c0h,084h,0c0h,084h,0c0h,084h,0c0h,084h,0c0h	; ac1e  ................
	defb 09fh,0c0h,09fh,0c0h,09fh,0c0h,09fh,0c0h,08fh,0c0h,08fh,0c0h,08fh,0c0h,08fh,0c0h	; ac2e  ................

; ----------------------------------------------------------------------
; DATOS dibujo_AC3E: 4 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 6 de la lista 0x90F6 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (64 bytes)
;   0xac3e..0xac7e  (64 bytes)
DATA_dibujo_AC3E:
	defb 006h,003h,006h,003h,006h,003h,006h,003h,00eh,003h,00eh,003h,00eh,003h,00eh,003h	; ac3e  ................
	defb 01eh,023h,01eh,023h,01eh,023h,01eh,023h,09eh,023h,09eh,023h,09eh,023h,09eh,023h	; ac4e  .#.#.#.#.#.#.#.#
	defb 09eh,023h,09eh,023h,09eh,023h,09eh,023h,09eh,023h,09eh,023h,09eh,023h,09eh,023h	; ac5e  .#.#.#.#.#.#.#.#
	defb 09eh,023h,09eh,023h,09eh,023h,09eh,023h,002h,003h,0feh,01fh,0e0h,01fh,0e0h,01fh	; ac6e  .#.#.#.#........

; ----------------------------------------------------------------------
; DATOS dibujo_AC7E: 4 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 7 de la lista 0x90F6 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (64 bytes)
;   0xac7e..0xacbe  (64 bytes)
DATA_dibujo_AC7E:
	defb 000h,000h,000h,003h,001h,006h,003h,00ch,003h,004h,003h,00ch,007h,008h,007h,0f8h	; ac7e  ................
	defb 000h,0d3h,0d1h,02eh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; ac8e  ................
	defb 000h,072h,030h,0cfh,0feh,001h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; ac9e  .r0.............
	defb 000h,000h,000h,080h,000h,080h,080h,040h,080h,040h,080h,040h,080h,060h,0c0h,03fh	; acae  .......@.@.@.`.?

; ----------------------------------------------------------------------
; DATOS dibujo_ACBE: 7 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 8 de la lista 0x90F6 (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (168 bytes)
;   0xacbe..0xad66  (168 bytes)
DATA_dibujo_ACBE:
	defb 000h,000h,000h,07fh,07fh,000h,080h,0ffh,000h,080h,0c0h,000h,080h,0c0h,03fh,0bfh,0c0h,000h,0bfh,0c0h,000h,0bfh,0c0h,000h	; acbe  ..............?.........
	defb 000h,000h,000h,0ffh,0ffh,000h,000h,0ffh,000h,000h,000h,000h,000h,000h,0ffh,0ffh,000h,000h,0ffh,000h,000h,0ffh,000h,000h	; acd6  ........................
	defb 000h,000h,000h,0ffh,0ffh,000h,000h,0ffh,000h,000h,000h,000h,000h,000h,0bfh,03fh,080h,000h,03fh,000h,080h,03fh,000h,080h	; acee  ...............?..?..?..
	defb 000h,000h,000h,0feh,0feh,000h,002h,0ffh,000h,002h,003h,000h,002h,003h,0fch,0feh,003h,000h,0feh,003h,000h,0feh,003h,000h	; ad06  ........................
	defb 087h,0c0h,000h,087h,0c0h,000h,087h,0c0h,000h,080h,0c0h,007h,084h,0c0h,000h,087h,0c0h,000h,087h,0c0h,000h,087h,0c0h,000h	; ad1e  ........................
	defb 0e2h,003h,01ch,0e2h,003h,01ch,0e2h,003h,01ch,002h,023h,0dch,002h,023h,01ch,0c2h,023h,01ch,0c2h,023h,01ch,0c2h,023h,01ch	; ad36  ..........#..#..#..#..#.
	defb 084h,0c0h,000h,084h,0c0h,000h,084h,0c0h,000h,084h,0c0h,000h,080h,0c0h,000h,0bfh,0f8h,000h,087h,0f8h,000h,087h,0f8h,000h	; ad4e  ........................

; ----------------------------------------------------------------------
; DATOS lista_AD66: 17 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x0000); lo leen p00:4C0C (86 bytes)
;   0xad66..0xadbc  (86 bytes)
DATA_lista_AD66:
	defb 046h,00ch,003h,02dh,0aeh	; ad66
	defb 042h,008h,010h,08dh,0aeh	; ad6b
	defb 043h,00ch,012h,0adh,0aeh	; ad70
	defb 043h,008h,015h,0ddh,0aeh	; ad75
	defb 082h,002h,018h,00dh,0afh	; ad7a
	defb 004h,000h,020h,03dh,0afh	; ad7f
	defb 042h,002h,024h,05dh,0afh	; ad84
	defb 043h,00ch,026h,07dh,0afh	; ad89
	defb 048h,00ch,032h,0adh,0afh	; ad8e
	defb 081h,002h,03ah,02dh,0b0h	; ad93
	defb 042h,005h,043h,045h,0b0h	; ad98
	defb 083h,01bh,048h,065h,0b0h	; ad9d
	defb 083h,008h,04bh,0adh,0b0h	; ada2
	defb 04ah,002h,04eh,0f5h,0b0h	; ada7
	defb 045h,000h,059h,095h,0b1h	; adac
	defb 093h,005h,05eh,0e5h,0b1h	; adb1
	defb 082h,002h,072h,0adh,0b3h	; adb6
	defb 0ffh	; adbb

; ----------------------------------------------------------------------
; DATOS lista_ADBC: 13 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x0000); lo leen p00:4C0C (66 bytes)
;   0xadbc..0xadfe  (66 bytes)
DATA_lista_ADBC:
	defb 04fh,007h,081h,0ddh,0b3h	; adbc
	defb 042h,002h,090h,0cdh,0b4h	; adc1
	defb 042h,005h,092h,0edh,0b4h	; adc6
	defb 082h,007h,094h,00dh,0b5h	; adcb
	defb 00fh,003h,0a0h,03dh,0b5h	; add0
	defb 043h,005h,0b0h,0b5h,0b5h	; add5
	defb 042h,007h,0b3h,0e5h,0b5h	; adda
	defb 087h,007h,0b5h,005h,0b6h	; addf
	defb 002h,004h,0c0h,065h,0b6h	; ade4
	defb 042h,004h,0c2h,075h,0b6h	; ade9
	defb 087h,004h,0c4h,095h,0b6h	; adee
	defb 047h,007h,0d0h,03dh,0b7h	; adf3
	defb 085h,007h,0d7h,0adh,0b7h	; adf8
	defb 0ffh	; adfd

; ----------------------------------------------------------------------
; DATOS lista_ADFE: 5 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x0000); lo leen p00:4C0C (26 bytes)
;   0xadfe..0xae18  (26 bytes)
DATA_lista_ADFE:
	defb 082h,009h,0a6h,025h,0b8h	; adfe
	defb 046h,009h,0a8h,055h,0b8h	; ae03
	defb 041h,017h,0aeh,0b5h,0b8h	; ae08
	defb 041h,018h,0afh,0c5h,0b8h	; ae0d
	defb 043h,009h,09dh,0d5h,0b8h	; ae12
	defb 0ffh	; ae17

; ----------------------------------------------------------------------
; DATOS lista_AE18: 4 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x6648); lo leen p00:4C26 (21 bytes)
;   0xae18..0xae2d  (21 bytes)
DATA_lista_AE18:
	defb 082h,000h,0a6h,025h,0b8h	; ae18
	defb 046h,000h,0a8h,055h,0b8h	; ae1d
	defb 041h,01eh,0aeh,0b5h,0b8h	; ae22
	defb 041h,021h,0afh,0c5h,0b8h	; ae27
	defb 0ffh	; ae2c

; ----------------------------------------------------------------------
; DATOS dibujo_AE2D: 6 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 0 de la lista 0xAD66 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (96 bytes)
;   0xae2d..0xae8d  (96 bytes)
DATA_dibujo_AE2D:
	defb 0e5h,0e4h,0fah,0fah,0b9h,0b9h,0deh,0deh,0afh,08eh,0d7h,0d7h,0abh,0a3h,0d7h,0d7h	; ae2d  ................
	defb 055h,044h,0aah,0aah,055h,011h,0abh,0aah,055h,044h,0aah,0aah,0ffh,0ffh,0ffh,0ffh	; ae3d  UD..U...UD......
	defb 0ffh,080h,0ffh,0c0h,0ffh,0e0h,0ffh,0f0h,0bfh,0b8h,0dfh,0dch,0afh,0aeh,0d7h,0d7h	; ae4d  ................
	defb 075h,074h,0bah,0bah,05dh,01dh,0aeh,0aeh,057h,047h,0abh,0abh,0ffh,0ffh,0ffh,0ffh	; ae5d  ut..]...WG......
	defb 0abh,08bh,0d7h,0d7h,0abh,0a3h,0d7h,0d7h,0abh,08bh,0d7h,0d7h,0abh,0a3h,0d7h,0d7h	; ae6d  ................
	defb 0abh,08bh,0d7h,0d7h,0ebh,0e3h,0f7h,0f7h,0bbh,0bbh,0dfh,0dfh,0afh,0afh,0d7h,0d7h	; ae7d  ................

; ----------------------------------------------------------------------
; DATOS dibujo_AE8D: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 1 de la lista 0xAD66 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (32 bytes)
;   0xae8d..0xaead  (32 bytes)
DATA_dibujo_AE8D:
	defb 0ffh,0ffh,0ffh,080h,0fdh,082h,0dfh,0a0h,0fbh,084h,0feh,081h,0bfh,0c0h,000h,000h	; ae8d  ................
	defb 0feh,0feh,07eh,080h,0fch,002h,0deh,020h,0fah,004h,0feh,000h,0deh,020h,000h,000h	; ae9d  ..~.... ..... ..

; ----------------------------------------------------------------------
; DATOS dibujo_AEAD: 3 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 2 de la lista 0xAD66 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (48 bytes)
;   0xaead..0xaedd  (48 bytes)
DATA_dibujo_AEAD:
	defb 000h,0ffh,000h,080h,002h,080h,020h,080h,004h,080h,001h,080h,040h,080h,0ffh,0ffh	; aead  ...... .....@...
	defb 001h,0ffh,081h,001h,003h,001h,021h,001h,005h,001h,001h,001h,021h,001h,0ffh,0ffh	; aebd  ......!.....!...
	defb 001h,0ffh,081h,001h,0c3h,001h,0e1h,001h,0b5h,041h,0f9h,001h,0edh,011h,001h,001h	; aecd  .........A......

; ----------------------------------------------------------------------
; DATOS dibujo_AEDD: 3 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 3 de la lista 0xAD66 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (48 bytes)
;   0xaedd..0xaf0d  (48 bytes)
DATA_dibujo_AEDD:
	defb 0feh,0feh,07eh,080h,0fch,002h,0deh,020h,0fah,024h,0deh,018h,016h,024h,000h,000h	; aedd  ..~.... .$...$..
	defb 0feh,0feh,07eh,080h,0dch,002h,0beh,020h,0f2h,044h,0feh,008h,0deh,020h,000h,000h	; aeed  ..~.... .D... ..
	defb 0efh,08fh,09fh,010h,0fdh,0e2h,0cfh,0a0h,0fbh,094h,0feh,081h,0afh,0d0h,000h,000h	; aefd  ................

; ----------------------------------------------------------------------
; DATOS dibujo_AF0D: 2 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 4 de la lista 0xAD66 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (48 bytes)
;   0xaf0d..0xaf3d  (48 bytes)
DATA_dibujo_AF0D:
	defb 07eh,0feh,000h,0beh,000h,000h,01ch,002h,000h,02eh,000h,000h,002h,004h,000h,002h,000h,000h,020h,000h,000h,0ffh,0ffh,0ffh	; af0d  ~................. .....
	defb 000h,0ffh,000h,080h,080h,000h,0c2h,080h,000h,0c0h,0a0h,000h,0f4h,080h,000h,0f9h,080h,000h,0bch,0c0h,000h,001h,001h,001h	; af25  ........................

; ----------------------------------------------------------------------
; DATOS dibujo_AF3D: 4 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 5 de la lista 0xAD66 (p00:4D92, p00:4DF5); lo leen p00:4C0C (32
;   bytes)
;   0xaf3d..0xaf5d  (32 bytes)
DATA_dibujo_AF3D:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; af3d  ........
	defb 0ffh,0ffh,0efh,0efh,0ffh,0efh,0ffh,0efh	; af45  ........
	defb 0efh,0efh,0ebh,0afh,0aah,0a8h,000h,000h	; af4d  ........
	defb 0ffh,0ffh,0ffh,0dfh,0dfh,08bh,002h,000h	; af55  ........

; ----------------------------------------------------------------------
; DATOS dibujo_AF5D: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 6 de la lista 0xAD66 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (32 bytes)
;   0xaf5d..0xaf7d  (32 bytes)
DATA_dibujo_AF5D:
	defb 0ffh,000h,07fh,000h,04ah,000h,000h,000h,090h,0ffh,0d1h,000h,0fbh,000h,0ffh,000h	; af5d  ....J...........
	defb 0ffh,000h,0ffh,000h,0bbh,000h,0a8h,000h,084h,0ffh,095h,000h,0dfh,000h,0ffh,000h	; af6d  ................

; ----------------------------------------------------------------------
; DATOS dibujo_AF7D: 3 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 7 de la lista 0xAD66 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (48 bytes)
;   0xaf7d..0xafad  (48 bytes)
DATA_dibujo_AF7D:
	defb 0fdh,001h,0e9h,001h,0ffh,001h,0ffh,001h,0f5h,001h,0ffh,001h,0fdh,001h,0f9h,001h	; af7d  ................
	defb 0fdh,001h,0ffh,001h,0f9h,001h,0ffh,001h,0fdh,001h,0ffh,001h,0e9h,001h,0fdh,001h	; af8d  ................
	defb 0ffh,0ffh,000h,000h,0b6h,000h,0f7h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; af9d  ................

; ----------------------------------------------------------------------
; DATOS dibujo_AFAD: 8 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 8 de la lista 0xAD66 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (128 bytes)
;   0xafad..0xb02d  (128 bytes)
DATA_dibujo_AFAD:
	defb 0b1h,0a1h,0b1h,0a1h,0b1h,0a1h,0b1h,0a1h,0b1h,0a1h,0b1h,0a1h,0b1h,0a1h,0b1h,0a1h	; afad  ................
	defb 031h,021h,031h,021h,031h,021h,031h,021h,031h,0a1h,031h,0a1h,031h,0a1h,031h,0a1h	; afbd  1!1!1!1!1.1.1.1.
	defb 0eeh,0ffh,055h,0ffh,0bbh,0ffh,0ffh,000h,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; afcd  ..U.............
	defb 0e1h,011h,0e1h,011h,0e1h,011h,0e1h,011h,0f1h,009h,0f1h,009h,0f1h,009h,0f1h,009h	; afdd  ................
	defb 0f9h,005h,0f9h,005h,0f9h,005h,0e9h,005h,0fdh,003h,0edh,003h,045h,003h,003h,001h	; afed  ............E...
	defb 0ffh,0ffh,001h,000h,0b6h,001h,0f6h,001h,0feh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; affd  ................
	defb 067h,0a0h,061h,0a0h,06fh,0a0h,067h,0a0h,06fh,0a0h,067h,0a0h,06fh,0a0h,063h,0a0h	; b00d  g.a.o.g.o.g.o.c.
	defb 0f4h,007h,0e4h,007h,084h,007h,0e4h,007h,0c4h,007h,0f4h,007h,0c4h,007h,0e4h,007h	; b01d  ................

; ----------------------------------------------------------------------
; DATOS dibujo_B02D: 1 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 9 de la lista 0xAD66 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (24 bytes)
;   0xb02d..0xb045  (24 bytes)
DATA_dibujo_B02D:
	defb 0b1h,061h,021h,0b1h,061h,021h,0b1h,061h,021h,031h,021h,021h,0c1h,0e1h,001h,0c1h,021h,001h,0c1h,021h,001h,0c1h,021h,001h	; b02d  .a!.a!.a!1!!....!..!..!.

; ----------------------------------------------------------------------
; DATOS dibujo_B045: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 10 de la lista 0xAD66 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (32 bytes)
;   0xb045..0xb065  (32 bytes)
DATA_dibujo_B045:
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; b045  ................
	defb 0ffh,0eeh,0ffh,055h,0ffh,0bbh,0ffh,055h,0ffh,0eeh,0ffh,055h,0ffh,0bbh,0ffh,055h	; b055  ...U...U...U...U

; ----------------------------------------------------------------------
; DATOS dibujo_B065: 3 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 11 de la lista 0xAD66 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (72 bytes)
;   0xb065..0xb0ad  (72 bytes)
DATA_dibujo_B065:
	defb 000h,00ch,0ffh,07fh,07fh,0ffh,060h,0efh,0ffh,000h,0ffh,0e0h,01fh,0ffh,01fh,07fh,0ffh,0f8h,07fh,0ffh,0ffh,000h,07fh,0ffh	; b065  ......`.................
	defb 000h,0ffh,0ffh,0ffh,0ffh,0ffh,01fh,0feh,0ffh,00fh,0ffh,01fh,0e0h,0f7h,0efh,0f0h,0ffh,070h,0ffh,0ffh,0ffh,000h,0ffh,0ffh	; b07d  .................p......
	defb 001h,0feh,0feh,0ffh,0feh,0feh,0ffh,03eh,0feh,0f1h,07eh,0feh,001h,0feh,0f0h,00fh,0feh,00eh,0ffh,0feh,0feh,001h,0feh,0feh	; b095  .......>..~.............

; ----------------------------------------------------------------------
; DATOS dibujo_B0AD: 3 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 12 de la lista 0xAD66 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (72 bytes)
;   0xb0ad..0xb0f5  (72 bytes)
DATA_dibujo_B0AD:
	defb 080h,000h,0ffh,088h,008h,0ffh,020h,0a8h,0ffh,008h,0a8h,0ffh,000h,088h,0ffh,080h,0ffh,000h,05fh,0b8h,018h,0ffh,0ffh,0ffh	; b0ad  ...... ..........._.....
	defb 000h,000h,0ffh,000h,07ch,0ffh,000h,07ch,0ffh,000h,000h,0ffh,07eh,07eh,0abh,07eh,0fbh,03ah,0bfh,042h,002h,0ffh,0ffh,0ffh	; b0c5  ....|..|....~~.~.:.B....
	defb 001h,001h,0ffh,011h,011h,0ffh,005h,015h,0ffh,011h,015h,0ffh,001h,011h,0ffh,001h,0ffh,001h,0dfh,039h,019h,0ffh,0ffh,0ffh	; b0dd  ...................9....

; ----------------------------------------------------------------------
; DATOS dibujo_B0F5: 10 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 13 de la lista 0xAD66 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (160 bytes)
;   0xb0f5..0xb195  (160 bytes)
DATA_dibujo_B0F5:
	defb 000h,0ffh,000h,0ffh,000h,0e7h,020h,0fbh,018h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; b0f5  ...... .........
	defb 000h,0ffh,000h,0ffh,000h,0efh,010h,0dfh,020h,0ffh,000h,0fbh,004h,0ffh,000h,0ffh	; b105  ........ .......
	defb 000h,0fdh,0fdh,0ffh,085h,0f8h,08dh,0f0h,098h,0e0h,097h,0e0h,066h,081h,094h,0e3h	; b115  ............f...
	defb 018h,0efh,0efh,0ffh,0e7h,008h,0e7h,008h,000h,000h,0fdh,002h,090h,06fh,000h,0ffh	; b125  .............o..
	defb 0c2h,07ch,042h,0fch,062h,03ch,072h,01ch,032h,01ch,0d2h,01ch,0cch,010h,05ch,09eh	; b135  .|B.b<r.2.....\.
	defb 090h,0e7h,090h,0e7h,094h,0e3h,064h,083h,0eeh,0f1h,098h,0e7h,094h,0e3h,090h,0e7h	; b145  ......d.........
	defb 052h,09ch,012h,0dch,052h,09ch,00ch,0d0h,05dh,09eh,0d2h,01ch,052h,09ch,052h,09ch	; b155  R...R...]...R.R.
	defb 006h,081h,0f2h,0f9h,080h,0fch,080h,0fdh,0fdh,0fdh,0fdh,080h,0fdh,080h,000h,000h	; b165  ................
	defb 008h,0f7h,0bdh,042h,000h,000h,018h,0efh,0efh,0ffh,0e7h,008h,0e7h,008h,000h,000h	; b175  ...B............
	defb 0cch,010h,0dch,01eh,003h,03ch,082h,07ch,07eh,0fch,03eh,040h,03eh,040h,000h,000h	; b185  .....<.|~.>@>@..

; ----------------------------------------------------------------------
; DATOS dibujo_B195: 5 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 14 de la lista 0xAD66 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (80 bytes)
;   0xb195..0xb1e5  (80 bytes)
DATA_dibujo_B195:
	defb 00dh,07bh,00dh,07bh,00dh,07bh,00dh,07bh,00dh,07bh,00dh,07bh,00dh,07bh,00dh,07bh	; b195  .{.{.{.{.{.{.{.{
	defb 00ch,07bh,00ch,07bh,00ch,07bh,00ch,07bh,00dh,07ah,00dh,07ah,00dh,07ah,00dh,07ah	; b1a5  .{.{.{.{.z.z.z.z
	defb 00fh,078h,00fh,078h,00fh,078h,00ch,078h,008h,07fh,007h,078h,007h,078h,007h,078h	; b1b5  .x.x.x.x...x.x.x
	defb 00fh,070h,00fh,070h,00fh,070h,00fh,070h,01fh,060h,01fh,060h,01fh,060h,01fh,060h	; b1c5  .p.p.p.p.`.`.`.`
	defb 03fh,040h,03fh,040h,03fh,040h,03fh,040h,06fh,000h,06fh,000h,042h,000h,000h,000h	; b1d5  ?@?@?@?@o.o.B...

; ----------------------------------------------------------------------
; DATOS dibujo_B1E5: 19 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 15 de la lista 0xAD66 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (456 bytes)
;   0xb1e5..0xb3ad  (456 bytes)
DATA_dibujo_B1E5:
	defb 000h,0feh,001h,000h,001h,002h,051h,002h,005h,001h,002h,009h,089h,002h,019h,009h,012h,029h,009h,032h,049h,009h,072h,089h	; b1e5  ......Q..........).2I.r.
	defb 080h,0ffh,000h,0c8h,0c0h,000h,0a0h,0a0h,040h,0b5h,0b0h,040h,0a8h,0a8h,040h,0a4h,0a4h,048h,0a2h,0a2h,04ch,0a1h,0a1h,04eh	; b1fd  ........@..@..@..H..L..N
	defb 0fbh,008h,000h,03bh,028h,000h,0f8h,00fh,000h,0f0h,010h,000h,03fh,03fh,080h,075h,0b5h,00ah,0ffh,07bh,000h,037h,0b5h,008h	; b215  ....(.......??.u...{.7..
	defb 07fh,000h,000h,055h,000h,02ah,0c0h,03fh,040h,080h,080h,000h,0ffh,0ffh,000h,055h,055h,0aah,0ffh,0bbh,000h,0ffh,055h,000h	; b22d  ...U.*.?@......UU.....U.
	defb 079h,002h,004h,059h,003h,004h,0c3h,038h,042h,082h,083h,000h,0ffh,0ffh,000h,055h,055h,0aah,0ffh,0bbh,000h,0ffh,055h,000h	; b245  y..Y...8B......UU.....U.
	defb 000h,000h,0ffh,054h,001h,080h,02ah,02bh,080h,054h,001h,080h,02ah,02bh,080h,054h,001h,080h,02ah,02bh,080h,000h,0ffh,000h	; b25d  ...T..*+.T..*+.T..*+....
	defb 029h,011h,0e6h,009h,031h,084h,009h,031h,084h,001h,001h,084h,029h,011h,0e6h,009h,031h,084h,009h,031h,084h,001h,001h,084h	; b275  )...1..1....)...1..1....
	defb 030h,000h,004h,068h,010h,0a3h,049h,031h,000h,011h,021h,002h,001h,001h,08eh,019h,021h,0c6h,099h,0a1h,004h,081h,081h,004h	; b28d  0..h..I1..!.....!.......
	defb 01ch,003h,000h,070h,00fh,010h,068h,013h,029h,0c0h,033h,041h,0c0h,03fh,040h,0c0h,03fh,040h,0c0h,0bfh,040h,020h,05fh,020h	; b2a5  ...p..h.).3A.?@.?@..@ _
	defb 010h,0e0h,008h,000h,0f8h,044h,002h,0feh,040h,003h,0fdh,040h,003h,0edh,040h,013h,0edh,010h,003h,07dh,000h,087h,079h,080h	; b2bd  .....D..@..@..@....}..y.
	defb 0b0h,08fh,030h,06dh,052h,00dh,03fh,030h,000h,04fh,08fh,050h,090h,060h,00fh,014h,06bh,014h,090h,020h,010h,091h,048h,010h	; b2d5  ..0mR.?0.O.P.`..k.. ..H.
	defb 007h,0fbh,000h,01fh,0e7h,000h,0cdh,00dh,030h,0f9h,0f9h,002h,021h,021h,0c6h,071h,0a1h,00eh,0b1h,0a1h,00eh,0b1h,021h,00eh	; b2ed  ........0...!!.q......!.
	defb 081h,06ch,000h,090h,060h,013h,090h,06fh,010h,093h,07ch,010h,09fh,07fh,01fh,09fh,06fh,01fh,093h,06ch,010h,013h,06ch,010h	; b305  .l..`..o..|.....o..l..l.
	defb 0a1h,021h,00eh,021h,021h,0c6h,071h,0a1h,006h,0b1h,021h,006h,0b1h,021h,00eh,0b3h,023h,00ch,0bdh,02dh,000h,0b1h,031h,002h	; b31d  .!.!!.q...!..!..#..-..1.
	defb 093h,06ch,010h,013h,02ch,010h,013h,028h,010h,0d3h,0ach,010h,043h,058h,080h,021h,020h,0c0h,010h,010h,06fh,0ffh,0ffh,000h	; b335  .l..,..(....CX.! ...o...
	defb 0b1h,021h,00eh,0b1h,021h,00eh,0b1h,021h,00eh,0a1h,021h,00eh,0b2h,022h,00dh,0a4h,0a4h,00bh,028h,028h,0d6h,0ffh,0ffh,000h	; b34d  .!..!..!..!.."....((....
	defb 03fh,0beh,000h,037h,0b5h,008h,03fh,0bbh,000h,030h,0b0h,008h,030h,030h,04fh,03fh,03fh,040h,03fh,03fh,0c0h,0ffh,0ffh,000h	; b365  ?..7..?..0..00O??@??....
	defb 03fh,0bfh,000h,037h,0b5h,008h,03fh,0bbh,000h,037h,0b5h,008h,03fh,0beh,000h,037h,0b5h,008h,03fh,0bbh,000h,037h,0b5h,008h	; b37d  ?..7..?..7..?..7..?..7..
	defb 03fh,0beh,000h,037h,0b5h,008h,03fh,0bbh,000h,037h,0b5h,008h,03fh,0beh,000h,037h,0b5h,008h,03fh,0bbh,000h,037h,0b5h,008h	; b395  ?..7..?..7..?..7..?..7..

; ----------------------------------------------------------------------
; DATOS dibujo_B3AD: 2 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 16 de la lista 0xAD66 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (48 bytes)
;   0xb3ad..0xb3dd  (48 bytes)
DATA_dibujo_B3AD:
	defb 071h,0aeh,020h,07eh,0bfh,03eh,072h,0b3h,03ah,06eh,0b3h,03eh,07eh,0b3h,03ah,07eh,0bfh,03eh,071h,0aeh,020h,06fh,0a0h,020h	; b3ad  q. ~.>r.:n.>~.:~.>q. o.
	defb 08ch,077h,004h,07ch,0ffh,07ch,064h,0c7h,054h,05ch,0e7h,07ch,074h,0c7h,054h,07ch,0ffh,07ch,08ch,077h,004h,0f4h,007h,004h	; b3c5  .w.|.|d.T\.|t.T|.|.w....

; ----------------------------------------------------------------------
; DATOS dibujo_B3DD: 15 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 0 de la lista 0xADBC (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (240 bytes)
;   0xb3dd..0xb4cd  (240 bytes)
DATA_dibujo_B3DD:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; b3dd  ................
	defb 022h,022h,066h,044h,0cch,088h,044h,044h,022h,022h,066h,044h,0cch,088h,000h,000h	; b3ed  ""fD..DD""fD....
	defb 0ffh,000h,022h,099h,044h,033h,000h,0bbh,000h,0ddh,022h,099h,044h,0bbh,000h,0ffh	; b3fd  ..".D3....".D...
	defb 0ffh,000h,022h,099h,044h,0b3h,000h,0bbh,002h,0dah,022h,090h,04ch,0bah,004h,0b5h	; b40d  ..".D.....".L...
	defb 0ffh,000h,022h,099h,044h,033h,000h,0bbh,022h,022h,066h,044h,044h,033h,000h,000h	; b41d  ..".D3..""fDD3..
	defb 000h,0f2h,026h,094h,04ch,0bah,004h,0b6h,000h,0d0h,026h,094h,04ch,0bah,004h,0b6h	; b42d  ..&.L.....&.L...
	defb 0ffh,000h,022h,019h,0c4h,0b3h,040h,05bh,022h,02ah,062h,040h,044h,003h,000h,000h	; b43d  .."...@["*b@D...
	defb 022h,022h,066h,044h,0cch,088h,044h,044h,022h,022h,066h,044h,000h,0ffh,0ffh,000h	; b44d  ""fD..DD""fD....
	defb 000h,0d0h,026h,094h,04ch,03ah,004h,0b6h,020h,028h,066h,044h,044h,032h,000h,000h	; b45d  ..&.L:.. (fDD2..
	defb 000h,080h,026h,084h,04ch,0a8h,004h,0bch,000h,0d4h,026h,094h,04ch,0bah,004h,0b6h	; b46d  ..&.L.....&.L...
	defb 0ffh,000h,022h,099h,044h,033h,000h,0bbh,022h,02ah,062h,040h,044h,003h,000h,000h	; b47d  ..".D3.."*b@D...
	defb 0ffh,000h,022h,099h,044h,033h,000h,0bbh,022h,022h,066h,044h,044h,000h,000h,000h	; b48d  ..".D3..""fDD...
	defb 0ffh,000h,0ffh,000h,080h,07fh,080h,072h,080h,072h,080h,072h,08dh,00dh,0f4h,00bh	; b49d  .......r.r.r....
	defb 0ffh,000h,0ffh,000h,000h,0ffh,000h,000h,000h,000h,000h,000h,0ffh,0ffh,044h,0bbh	; b4ad  ..............D.
	defb 0ffh,000h,0ffh,000h,000h,0ffh,000h,001h,000h,001h,000h,001h,0feh,0ffh,044h,0bbh	; b4bd  ..............D.

; ----------------------------------------------------------------------
; DATOS dibujo_B4CD: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 1 de la lista 0xADBC (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (32 bytes)
;   0xb4cd..0xb4ed  (32 bytes)
DATA_dibujo_B4CD:
	defb 0ffh,000h,0ffh,000h,0ffh,000h,000h,000h,000h,000h,0ffh,0ffh,0ffh,000h,0ffh,000h	; b4cd  ................
	defb 0feh,000h,0feh,000h,0feh,000h,000h,000h,000h,000h,0feh,0feh,0feh,000h,0feh,000h	; b4dd  ................

; ----------------------------------------------------------------------
; DATOS dibujo_B4ED: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 2 de la lista 0xADBC (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (32 bytes)
;   0xb4ed..0xb50d  (32 bytes)
DATA_dibujo_B4ED:
	defb 044h,000h,022h,000h,066h,022h,0cch,044h,000h,000h,000h,000h,000h,0ffh,000h,000h	; b4ed  D.".f".D........
	defb 044h,000h,022h,000h,066h,022h,0cch,044h,000h,000h,000h,000h,000h,0feh,000h,000h	; b4fd  D.".f".D........

; ----------------------------------------------------------------------
; DATOS dibujo_B50D: 2 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 3 de la lista 0xADBC (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (48 bytes)
;   0xb50d..0xb53d  (48 bytes)
DATA_dibujo_B50D:
	defb 080h,072h,000h,080h,072h,000h,080h,072h,000h,080h,07fh,000h,0f2h,00dh,000h,00fh,082h,00dh,08dh,07fh,000h,080h,072h,000h	; b50d  .r..r..r..............r.
	defb 080h,040h,000h,080h,060h,000h,080h,070h,000h,080h,07fh,000h,0f2h,00dh,000h,00fh,082h,00dh,08dh,07fh,000h,080h,072h,000h	; b525  .@..`..p..............r.

; ----------------------------------------------------------------------
; DATOS dibujo_B53D: 15 caracteres de 8x8 a 1 bit por punto (8 bytes cada
;   uno), ficha 4 de la lista 0xADBC (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (120 bytes)
;   0xb53d..0xb5b5  (120 bytes)
DATA_dibujo_B53D:
	defb 0ffh,0ffh,081h,081h,099h,099h,099h,099h	; b53d  ........
	defb 0ffh,0ffh,0f1h,0f1h,0f9h,0f9h,0f9h,0f9h	; b545  ........
	defb 0ffh,0ffh,081h,081h,0f9h,0f9h,0f9h,0f9h	; b54d  ........
	defb 099h,099h,099h,099h,099h,099h,081h,081h	; b555  ........
	defb 0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h	; b55d  ........
	defb 081h,081h,09fh,09fh,09fh,09fh,081h,081h	; b565  ........
	defb 081h,081h,0f9h,0f9h,0f9h,0f9h,081h,081h	; b56d  ........
	defb 081h,081h,099h,099h,099h,099h,081h,081h	; b575  ........
	defb 081h,081h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h	; b57d  ........
	defb 0ffh,0ffh,099h,099h,099h,099h,099h,099h	; b585  ........
	defb 0ffh,0ffh,081h,081h,09fh,09fh,09fh,09fh	; b58d  ........
	defb 0ffh,0c3h,0c3h,0c3h,081h,0c3h,0e7h,0ffh	; b595  ........
	defb 0ffh,0e7h,0c3h,081h,0c3h,0c3h,0c3h,0ffh	; b59d  ........
	defb 0ffh,0ffh,051h,056h,051h,057h,0b7h,0ffh	; b5a5  ..QVQW..
	defb 0ffh,0edh,0eah,08ah,06ah,08ah,0ffh,0ffh	; b5ad  ....j...

; ----------------------------------------------------------------------
; DATOS dibujo_B5B5: 3 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 5 de la lista 0xADBC (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (48 bytes)
;   0xb5b5..0xb5e5  (48 bytes)
DATA_dibujo_B5B5:
	defb 07fh,000h,07fh,03fh,04fh,010h,04fh,010h,04fh,010h,04fh,010h,040h,000h,07fh,000h	; b5b5  ...?O.O.O.O.@...
	defb 0ffh,000h,0fdh,0feh,0f9h,002h,0f9h,002h,0f9h,002h,0f9h,002h,001h,002h,0ffh,000h	; b5c5  ................
	defb 03fh,000h,03fh,03fh,00fh,010h,00fh,010h,04fh,000h,04fh,000h,040h,000h,067h,000h	; b5d5  ?.??....O.O.@.g.

; ----------------------------------------------------------------------
; DATOS dibujo_B5E5: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 6 de la lista 0xADBC (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (32 bytes)
;   0xb5e5..0xb605  (32 bytes)
DATA_dibujo_B5E5:
	defb 0f1h,0feh,0f5h,00ch,0f5h,0fch,0f5h,0fch,0f5h,0fch,0f5h,0fch,005h,00ch,0f5h,0fch	; b5e5  ................
	defb 00fh,0ffh,05fh,0c0h,05fh,0cfh,05fh,0cfh,05fh,0cfh,05fh,0cfh,050h,0c0h,05fh,0cfh	; b5f5  .._._._._._.P._.

; ----------------------------------------------------------------------
; DATOS dibujo_B605: 7 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 7 de la lista 0xADBC (p00:4D92, p00:4DF5); se solapan 19
;   bloques: (dibujo_B665 B665-B675) (dibujo_B665 B665-B675) (dibujo_B665
;   B665-B675) (dibujo_B665 B665-B675) (dibujo_B665 B665-B675) (dibujo_B665
;   B665-B675) (dibujo_B675 B675-B695) (dibujo_B675 B675-B695) (dibujo_B675
;   B675-B695) (dibujo_B675 B675-B695) (dibujo_B675 B675-B695) (dibujo_B675
;   B675-B695) (dibujo_B695 B695-B73D) (dibujo_B695 B695-B73D) (dibujo_B695
;   B695-B73D) (dibujo_B695 B695-B73D) (dibujo_B695 B695-B73D) (dibujo_B695
;   B695-B73D); lo leen p00:4C0C (312 bytes)
;   0xb605..0xb73d  (312 bytes)
DATA_dibujo_B605:
	defb 0f7h,0fah,004h,0f7h,00ah,004h,0f7h,0fah,004h,0f7h,0fah,004h,0f7h,0fah,004h,0f7h,0fah,004h,007h,00ah,004h,0f7h,0fah,004h	; b605  ........................
	defb 05fh,08fh,040h,05fh,080h,040h,077h,0a7h,040h,077h,0a7h,040h,073h,0a3h,040h,073h,0a3h,040h,070h,0a0h,040h,079h,0a9h,040h	; b61d  _.@_.@w.@w.@s.@s.@p.@y.@
	defb 0e7h,08dh,042h,0f7h,095h,042h,0e7h,08dh,042h,0f7h,095h,042h,0e7h,08dh,042h,0f7h,095h,042h,0e7h,08dh,042h,0f7h,095h,042h	; b635  ..B..B..B..B..B..B..B..B
	defb 08eh,0b2h,004h,0beh,0b2h,004h,08eh,0b2h,004h,0beh,0b2h,004h,08eh,0b2h,004h,0beh,0b2h,004h,08eh,0b2h,004h,0beh,0b2h,004h	; b64d  ........................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0ffh,0ffh,0ffh,000h,000h,0ffh,0ffh,000h	; b665  ........................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,07fh,082h,07fh,0bah,047h,082h,07fh,082h,0ffh,0feh,0dfh,028h,0dfh,028h,0ffh,038h	; b67d  ............G......(.(.8
	defb 00fh,08fh,060h,02fh,0a8h,040h,06fh,0e8h,003h,06fh,0e8h,082h,07dh,0eah,080h,05dh,0cah,0a0h,01dh,08ah,0e0h,01dh,08ah,060h	; b695  ..`/.@o..o..}..].......`
	defb 00dh,08ah,060h,02dh,0aah,040h,06dh,0eah,000h,06dh,0eah,080h,07dh,0eah,080h,05dh,0cah,0a0h,01dh,08ah,0e0h,01dh,08ah,060h	; b6ad  ..`-.@m..m..}..].......`
	defb 00dh,08ah,060h,02dh,0aah,040h,06dh,0eah,000h,06dh,0eah,080h,07dh,0eah,080h,05dh,0cah,0a0h,01dh,08ah,0e0h,018h,088h,060h	; b6c5  ..`-.@m..m..}..].......`
	defb 0ffh,054h,000h,0ffh,054h,000h,0ffh,054h,000h,0ffh,000h,000h,0c3h,03eh,0c0h,0ffh,002h,080h,07fh,0bah,038h,047h,082h,000h	; b6dd  .T..T..T.....>......8G..
	defb 0f0h,0f8h,006h,0f2h,01ah,004h,016h,0deh,000h,0d6h,01eh,008h,0d7h,01eh,008h,0d5h,01ch,00ah,031h,0d8h,00eh,031h,038h,006h	; b6f5  ..................1..18.
	defb 0d0h,018h,006h,0d2h,01ah,004h,0d6h,01eh,000h,0d6h,01eh,008h,0d7h,01eh,008h,0d5h,01ch,00ah,0d1h,018h,00eh,0d1h,018h,006h	; b70d  ........................
	defb 0d0h,018h,006h,0d2h,01ah,004h,036h,0deh,000h,036h,03eh,008h,0d7h,01eh,008h,0d5h,01ch,00ah,0d1h,018h,00eh,011h,018h,006h	; b725  ......6..6>.............

; ----------------------------------------------------------------------
; DATOS dibujo_B73D: 7 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 11 de la lista 0xADBC (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (112 bytes)
;   0xb73d..0xb7ad  (112 bytes)
DATA_dibujo_B73D:
	defb 0a0h,0c4h,0a1h,0c1h,0a2h,0c3h,0a4h,0c6h,090h,0e4h,090h,0e0h,090h,0e0h,094h,0e4h	; b73d  ................
	defb 088h,0e4h,089h,0e1h,08ah,0e3h,08ch,0e6h,084h,0e8h,084h,0e8h,084h,0e8h,084h,0e8h	; b74d  ................
	defb 086h,0e8h,087h,0e9h,086h,0e9h,086h,0e8h,085h,0e8h,085h,0e8h,085h,0e8h,085h,0e8h	; b75d  ................
	defb 084h,0e9h,004h,069h,004h,069h,004h,0e9h,0c4h,029h,0c4h,029h,004h,069h,0c4h,029h	; b76d  ...i.i...).).i.)
	defb 024h,0c9h,0e4h,009h,004h,029h,0e4h,009h,004h,0e9h,0e4h,009h,004h,009h,0f4h,009h	; b77d  $....)..........
	defb 004h,0f9h,0f4h,009h,004h,009h,0fch,001h,004h,0f9h,0fch,001h,000h,005h,0fch,001h	; b78d  ................
	defb 000h,0fdh,0fch,001h,000h,001h,0feh,001h,000h,0ffh,000h,001h,0ffh,000h,001h,0feh	; b79d  ................

; ----------------------------------------------------------------------
; DATOS dibujo_B7AD: 5 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 12 de la lista 0xADBC (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (120 bytes)
;   0xb7ad..0xb825  (120 bytes)
DATA_dibujo_B7AD:
	defb 000h,0ffh,001h,0fch,0ffh,001h,000h,003h,001h,044h,047h,001h,002h,045h,003h,012h,011h,003h,022h,031h,003h,042h,061h,003h	; b7ad  .........DG..E...."1.Ba.
	defb 006h,043h,005h,006h,003h,005h,006h,003h,005h,046h,043h,005h,00ch,047h,009h,01ch,017h,009h,02ch,037h,009h,04ch,067h,009h	; b7c5  .C.......FC..G....,7.Lg.
	defb 01ch,04fh,011h,01ch,00fh,011h,01ch,00fh,011h,05ch,04fh,011h,03ch,057h,029h,03ch,017h,029h,03ch,017h,029h,03ch,017h,029h	; b7dd  .O.......\O.<W)<.)<.)<.)
	defb 06ch,037h,049h,06ch,037h,049h,06ch,037h,049h,06ch,037h,049h,06ch,0f7h,009h,06ch,0f7h,009h,06ch,0f7h,009h,06ch,0f7h,009h	; b7f5  l7Il7Il7Il7Il..l..l..l..
	defb 080h,07fh,000h,0ffh,07fh,000h,080h,000h,000h,0c4h,046h,000h,0c0h,084h,000h,0d0h,090h,000h,0e0h,0b0h,000h,0c4h,0a4h,000h	; b80d  ..........F.............

; ----------------------------------------------------------------------
; DATOS dibujo_B825: 2 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 0 de la lista 0xADFE (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (48 bytes)
;   0xb825..0xb855  (48 bytes)
DATA_dibujo_B825:
	defb 0ffh,000h,0ffh,000h,000h,000h,000h,000h,000h,000h,0ffh,000h,0ffh,000h,000h,0ffh,040h,040h,0ffh,040h,040h,0bfh,07fh,07fh	; b825  ................@@.@@...
	defb 0ffh,000h,0ffh,000h,000h,000h,000h,000h,000h,000h,0ffh,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh,0feh,0feh	; b83d  ........................

; ----------------------------------------------------------------------
; DATOS dibujo_B855: 6 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 1 de la lista 0xADFE (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (96 bytes)
;   0xb855..0xb8b5  (96 bytes)
DATA_dibujo_B855:
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0e0h,000h,0efh,000h,0e8h,000h,0e8h,000h	; b855  ................
	defb 097h,080h,017h,000h,017h,000h,0f7h,000h,007h,000h,0ffh,000h,0ffh,000h,0ffh,000h	; b865  ................
	defb 0a5h,0c8h,025h,048h,025h,048h,025h,0c8h,065h,088h,0e5h,008h,0a5h,0c8h,0e5h,008h	; b875  ..%H%H%.e.......
	defb 025h,048h,0e5h,008h,045h,068h,0e5h,008h,005h,028h,0e5h,008h,02dh,020h,0fdh,000h	; b885  %H..Eh...(..- ..
	defb 00dh,090h,0fdh,000h,015h,010h,0fdh,000h,005h,0c8h,0fdh,000h,009h,008h,0fdh,000h	; b895  ................
	defb 001h,0e4h,0fdh,000h,005h,004h,0fdh,000h,001h,0f0h,003h,002h,0ffh,000h,001h,0feh	; b8a5  ................

; ----------------------------------------------------------------------
; DATOS dibujo_B8B5: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 2 de la lista 0xADFE (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (16 bytes)
;   0xb8b5..0xb8c5  (16 bytes)
DATA_dibujo_B8B5:
	defb 000h,000h,0ffh,0ffh,07eh,07eh,066h,07eh,042h,07eh,07eh,07eh,07eh,07eh,07eh,000h	; b8b5  ....~~f~B~~~~~~.

; ----------------------------------------------------------------------
; DATOS dibujo_B8C5: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 3 de la lista 0xADFE (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (16 bytes)
;   0xb8c5..0xb8d5  (16 bytes)
DATA_dibujo_B8C5:
	defb 000h,000h,000h,000h,07eh,07eh,066h,07eh,042h,07eh,07eh,07eh,07eh,07eh,07eh,000h	; b8c5  ....~~f~B~~~~~~.

; ----------------------------------------------------------------------
; DATOS dibujo_B8D5: 3 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 4 de la lista 0xADFE (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (48 bytes)
;   0xb8d5..0xb905  (48 bytes)
DATA_dibujo_B8D5:
	defb 080h,000h,0bfh,03fh,08fh,010h,08fh,010h,08fh,010h,08fh,010h,08fh,010h,08fh,070h	; b8d5  ...?...........p
	defb 000h,000h,0ffh,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; b8e5  ................
	defb 001h,000h,0fdh,0fch,0f1h,008h,0f1h,008h,0f1h,008h,0f1h,008h,0f1h,008h,0f1h,00eh	; b8f5  ................

; ----------------------------------------------------------------------
; DATOS tabla_colores_B905: 1 punteros a colores de dibujo (los usa hasta el
;   indice 0; p00:4DA0); lo leen p00:4DA0 (2 bytes)
;   0xb905..0xb907  (2 bytes)
DATA_tabla_colores_B905:
	defw 0b907h	; b905  -> DATA_colores_B907

; ----------------------------------------------------------------------
; DATOS colores_B907: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6EFE (2 bytes)
;   0xb907..0xb909  (2 bytes)
DATA_colores_B907:
	defb 007h,08fh	; b907

; ----------------------------------------------------------------------
; DATOS lista_B909: 1 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0xB905); lo leen p01:6EFE (6 bytes)
;   0xb909..0xb90f  (6 bytes)
DATA_lista_B909:
	defb 050h,000h,0e0h,00fh,0b9h	; b909
	defb 0ffh	; b90e

; ----------------------------------------------------------------------
; DATOS dibujo_B90F: 16 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 0 de la lista 0xB909 (p00:4D92, p00:4DF5); lo leen p01:6EFE
;   (256 bytes)
;   0xb90f..0xba0f  (256 bytes)
DATA_dibujo_B90F:
	defb 007h,007h,00bh,00ch,018h,01fh,01fh,010h,018h,01fh,038h,037h,038h,037h,018h,017h	; b90f  ..........8787..
	defb 0c0h,0c0h,0e0h,0e0h,0f0h,0f0h,0d0h,030h,030h,0f0h,018h,0f8h,018h,0f8h,010h,0f0h	; b91f  .......00.......
	defb 018h,017h,017h,01fh,038h,037h,037h,03fh,033h,03fh,018h,01fh,010h,01fh,01fh,01fh	; b92f  ....877?3?......
	defb 010h,0f0h,0f0h,0f0h,018h,0f8h,0f8h,0f8h,098h,0f8h,030h,0f0h,010h,0f0h,0f0h,0f0h	; b93f  ..........0.....
	defb 000h,000h,000h,000h,000h,000h,0ffh,0ffh,0ffh,0a0h,0b0h,0ffh,0b0h,0ffh,0a0h,0ffh	; b94f  ................
	defb 000h,000h,000h,000h,000h,000h,0f0h,0f0h,0f0h,050h,03dh,0dfh,03fh,0d5h,037h,0ddh	; b95f  .........P=.?.7.
	defb 0a0h,0ffh,0ffh,0ffh,0a0h,0ffh,0a0h,0ffh,0ffh,0ffh,003h,003h,003h,003h,003h,003h	; b96f  ................
	defb 055h,0ffh,0ffh,0ffh,01fh,0ffh,010h,0f0h,0f0h,0f0h,040h,0c0h,040h,0c0h,040h,0c0h	; b97f  U.........@.@.@.
	defb 01fh,01fh,01fh,010h,017h,01fh,03fh,033h,038h,037h,038h,037h,018h,017h,018h,01fh	; b98f  ......?38787....
	defb 0f0h,0f0h,0d0h,030h,0f0h,0f0h,098h,0f8h,018h,0f8h,018h,0f8h,010h,0f0h,030h,0f0h	; b99f  ...0..........0.
	defb 038h,037h,03fh,03fh,014h,01fh,012h,01dh,016h,01dh,01fh,01bh,00bh,00fh,006h,005h	; b9af  87??............
	defb 018h,0f8h,0f8h,0f8h,050h,0f0h,0d0h,0f0h,050h,0f0h,0f0h,0f0h,0e0h,0e0h,040h,0c0h	; b9bf  ....P...P.....@.
	defb 000h,000h,000h,000h,000h,000h,00fh,00fh,00fh,00ah,0bch,0fbh,0fch,0abh,0ech,0bbh	; b9cf  ................
	defb 000h,000h,000h,000h,000h,000h,0ffh,0ffh,0ffh,005h,00dh,0ffh,00dh,0ffh,005h,0ffh	; b9df  ................
	defb 0aah,0ffh,0ffh,0ffh,0f8h,0ffh,008h,00fh,00fh,00fh,002h,003h,002h,003h,002h,003h	; b9ef  ................
	defb 005h,0ffh,0ffh,0ffh,005h,0ffh,005h,0ffh,0ffh,0ffh,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h	; b9ff  ................

; ----------------------------------------------------------------------
; DATOS resto_BA0F: lo apuntan con el banco puesto p01:6E10 (0xBBA0), p01:6F30
;   (0xBC04); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p01:6E10, p01:6F30 (607 bytes)
;   0xba0f..0xbc6e  (607 bytes)
DATA_resto_BA0F:
	defb 000h,080h,0f8h,00ah,000h,086h,001h,003h,00fh,01eh,0fdh,0ffh,004h,000h,08ch,001h	; ba0f  ................
	defb 003h,00fh,01fh,03dh,0f3h,0efh,0dfh,03dh,039h,0feh,0ffh,00ah,000h,086h,001h,002h	; ba1f  ...=...=9.......
	defb 00dh,013h,02eh,0dfh,004h,000h,08ch,001h,002h,00ch,012h,02eh,0dch,030h,0e0h,0c2h	; ba2f  .............0..
	defb 0c6h,001h,0feh,004h,000h,08ch,080h,0c0h,0f0h,0f8h,0bch,08fh,087h,083h,098h,09eh	; ba3f  ................
	defb 0bfh,0ffh,00ah,000h,086h,080h,0c0h,0f0h,078h,0bfh,0ffh,004h,000h,08ch,080h,0c0h	; ba4f  ........x.......
	defb 0b0h,0c8h,0f4h,0fbh,0fch,0ffh,0e7h,0e1h,0c0h,0ffh,00ah,000h,086h,080h,040h,0b0h	; ba5f  ..............@.
	defb 0c8h,075h,0fbh,006h,000h,087h,001h,003h,007h,006h,002h,002h,001h,003h,000h,090h	; ba6f  .u..............
	defb 001h,003h,00fh,01eh,03ch,0f0h,0e0h,0c0h,007h,00fh,00fh,00eh,0deh,03ch,00dh,002h	; ba7f  ....<........<..
	defb 006h,000h,087h,001h,002h,005h,007h,003h,003h,001h,003h,000h,096h,001h,002h,00dh	; ba8f  ................
	defb 013h,02fh,0dfh,03fh,0ffh,0f8h,0f0h,0f0h,0f1h,0e1h,033h,00fh,002h,0e0h,0cch,01ch	; ba9f  ./.?......3.....
	defb 01ch,01fh,01fh,005h,03fh,09bh,07fh,078h,0c0h,000h,000h,030h,001h,001h,061h,0e1h	; baaf  ....?..x...0..a.
	defb 0e1h,0c1h,001h,001h,081h,0bfh,0cfh,00fh,00eh,00fh,007h,03fh,0f3h,0e3h,0e3h,0e0h	; babf  ...........?....
	defb 0e0h,005h,0c0h,0adh,087h,0b8h,0c0h,000h,000h,0cfh,0feh,0feh,09eh,01eh,01eh,03eh	; bacf  ...............>
	defb 0feh,0feh,07eh,07eh,0ceh,00eh,00fh,00fh,007h,080h,08fh,09fh,09fh,0bfh,0bfh,0a3h	; badf  ..~~............
	defb 081h,080h,080h,07ch,073h,070h,070h,0e0h,0e0h,007h,0fbh,0fch,0feh,0fch,0e0h,0c0h	; baef  ...|spp.........
	defb 080h,003h,001h,08dh,0e0h,01ch,003h,000h,000h,0ffh,0f0h,0e0h,0e0h,0c0h,0c0h,0dch	; baff  ................
	defb 0feh,003h,0ffh,08dh,0f3h,0f0h,0f0h,0e0h,0e0h,0fch,007h,003h,001h,003h,01fh,03fh	; bb0f  ...............?
	defb 07fh,003h,0feh,095h,0ffh,01fh,003h,000h,000h,080h,0c0h,0f0h,078h,03ch,00fh,037h	; bb1f  ............x<.7
	defb 0fbh,0fch,0f0h,0f0h,0e0h,0e3h,0ech,0f0h,040h,006h,000h,087h,080h,0c0h,0e0h,060h	; bb2f  ........@......`
	defb 040h,040h,080h,003h,000h,090h,080h,040h,0b0h,0c8h,0f4h,0fbh,0cch,007h,003h,00fh	; bb3f  @@.....@........
	defb 00fh,01fh,01fh,01ch,0b0h,040h,006h,000h,087h,080h,040h,0a0h,0e0h,0c0h,0c0h,080h	; bb4f  .....@....@.....
	defb 003h,000h,085h,004h,005h,004h,002h,002h,004h,003h,007h,000h,002h,0a0h,002h,0e0h	; bb5f  ................
	defb 081h,0c0h,004h,080h,007h,000h,003h,007h,003h,003h,002h,002h,081h,003h,007h,000h	; bb6f  ................
	defb 003h,0e0h,082h,0a0h,0c0h,004h,080h,007h,000h,089h,001h,003h,007h,00fh,01fh,03fh	; bb7f  ...............?
	defb 07fh,0f1h,080h,008h,000h,088h,080h,0c0h,0e0h,0f0h,0f8h,0fch,01eh,002h,007h,000h	; bb8f  ................
	defb 000h,000h,080h,0ffh,0a0h,004h,005h,007h,00fh,00fh,00dh,01dh,01ch,018h,03ch,038h	; bb9f  ..............<8
	defb 030h,030h,018h,01ch,00fh,000h,020h,000h,040h,0c0h,0c0h,0e0h,0e0h,0f0h,070h,0b0h	; bbaf  00.... .@.....p.
	defb 030h,030h,060h,0e0h,0c0h,005h,000h,002h,002h,088h,003h,007h,003h,007h,00fh,00fh	; bbbf  00`.............
	defb 007h,003h,00ah,000h,085h,080h,040h,0c0h,0c0h,080h,007h,000h,002h,002h,084h,003h	; bbcf  ......@.........
	defb 007h,007h,006h,003h,00ch,082h,006h,003h,007h,000h,089h,040h,0c0h,0c0h,0e0h,060h	; bbdf  ...........@...`
	defb 030h,030h,060h,0c0h,00ah,000h,081h,001h,003h,003h,081h,001h,00ch,000h,085h,080h	; bbef  00`.............
	defb 0c0h,0c0h,080h,000h,000h,00ch,0bch,023h,0bch,03ah,0bch,054h,0bch,000h,080h,0f8h	; bbff  .......#.:.T....
	defb 086h,004h,00ah,011h,020h,040h,0f1h,004h,011h,081h,01fh,008h,000h,083h,080h,040h	; bc0f  .... @.........@
	defb 0e0h,00ah,000h,000h,000h,080h,0f8h,081h,01fh,004h,011h,086h,0f1h,040h,020h,011h	; bc1f  .............@ .
	defb 00ah,004h,00ah,000h,083h,0e0h,040h,080h,008h,000h,000h,000h,080h,0f8h,08bh,004h	; bc2f  ......@.........
	defb 00ch,014h,027h,040h,080h,040h,027h,014h,00ch,004h,008h,000h,081h,0e0h,003h,020h	; bc3f  ..'@.@'........
	defb 081h,0e0h,008h,000h,000h,000h,080h,0f8h,084h,004h,006h,005h,0fch,003h,080h,084h	; bc4f  ................
	defb 0fch,005h,006h,004h,008h,000h,085h,080h,040h,020h,040h,080h,008h,000h,000h	; bc5f  ........@ @....

; ----------------------------------------------------------------------
; DATOS rachas_BC6E: datos en rachas a la VRAM (p00:453E: n < 0x80 repite, n >
;   0x80 copia n & 0x7F, 0x80 cambia de destino, 0 acaba); lo leen p01:6FB8
;   (299 bytes)
;   0xbc6e..0xbd99  (299 bytes)
DATA_rachas_BC6E:
	defb 0a0h,002h,000h,083h,06dh,03fh,061h,0ceh,099h,093h,0a8h,0d0h,0d5h,07fh,034h,05fh	; bc6e  ....m?a.......4_
	defb 008h,001h,006h,03ch,0e6h,013h,0cbh,06ah,026h,094h,0dfh,0eah,0dah,012h,026h,0cch	; bc7e  ...<...j&.....&.
	defb 070h,005h,000h,089h,01eh,031h,066h,06ch,057h,02fh,02ah,000h,00bh,005h,000h,08ch	; bc8e  p....1flW/*.....
	defb 018h,0ech,034h,094h,0d8h,068h,020h,014h,024h,0ech,0d8h,030h,005h,000h,002h,004h	; bc9e  ..4..h .$..0....
	defb 08ah,006h,00ah,049h,033h,065h,054h,0c0h,096h,0a9h,0b0h,003h,000h,08dh,004h,008h	; bcae  ...I3eT.........
	defb 008h,010h,030h,0f0h,0b0h,008h,06fh,096h,01ch,00ch,09ch,007h,000h,089h,004h,006h	; bcbe  ..0...o.........
	defb 00ch,01ah,02bh,03fh,069h,056h,04fh,009h,000h,0e7h,040h,0f0h,090h,068h,0e0h,0f0h	; bcce  ..+?iVO...@..h..
	defb 060h,0ebh,051h,0d8h,0edh,0b7h,070h,049h,0d2h,0a7h,0b4h,0e0h,0c9h,0a0h,095h,04eh	; bcde  `.Q...pI.......N
	defb 038h,0b5h,086h,039h,0e4h,052h,01bh,08ah,04eh,054h,01eh,09ah,031h,075h,0adh,0d2h	; bcee  8..9.R..NT..1u..
	defb 07ch,014h,0aeh,027h,012h,048h,00fh,036h,02dh,058h,04bh,01fh,036h,05fh,06ah,030h	; bcfe  |..'.H.6-XK.6_j0
	defb 000h,048h,078h,0c6h,01bh,0adh,0e4h,074h,0b0h,0a8h,0e0h,064h,0ceh,08ah,052h,02ch	; bd0e  .Hx....t...d..R,
	defb 000h,000h,004h,000h,004h,004h,00bh,01ch,02bh,040h,050h,0a0h,0a4h,080h,020h,059h	; bd1e  ........+@P... Y
	defb 040h,000h,000h,002h,004h,000h,088h,078h,09ch,052h,004h,071h,00ch,024h,015h,001h	; bd2e  @......x.R.q.$..
	defb 002h,006h,000h,084h,001h,010h,020h,020h,003h,000h,083h,018h,020h,030h,006h,000h	; bd3e  ......  .... 0..
	defb 0aah,080h,060h,000h,000h,008h,030h,008h,000h,0e0h,030h,022h,000h,040h,0c8h,090h	; bd4e  ..`...0...0".@..
	defb 084h,008h,000h,024h,090h,04ch,001h,036h,000h,04eh,038h,004h,006h,009h,034h,008h	; bd5e  ...$.L.6.N8...4.
	defb 044h,000h,015h,001h,086h,002h,007h,01dh,001h,002h,038h,004h,000h,09ch,02ch,068h	; bd6e  D.........8...,h
	defb 050h,010h,000h,000h,020h,034h,009h,067h,030h,000h,030h,010h,002h,009h,006h,003h	; bd7e  P... 4.g0.0.....
	defb 007h,002h,004h,000h,004h,000h,002h,0c8h,01ch,0c0h,000h	; bd8e  ...........

; ----------------------------------------------------------------------
; DATOS rachas_BD99: datos en rachas a la VRAM (p00:453E: n < 0x80 repite, n >
;   0x80 copia n & 0x7F, 0x80 cambia de destino, 0 acaba); lo leen p01:6FB8
;   (272 bytes)
;   0xbd99..0xbea9  (272 bytes)
DATA_rachas_BD99:
	defb 006h,000h,098h,00bh,00eh,00bh,018h,020h,034h,012h,00bh,00fh,006h,000h,000h,030h	; bd99  ....... 4......0
	defb 016h,026h,0bah,0f1h,073h,032h,04ch,008h,010h,070h,080h,008h,000h,0a8h,01bh,007h	; bda9  .&..s2L..p......
	defb 00eh,017h,03fh,02fh,01fh,00fh,00fh,006h,000h,000h,010h,036h,066h,0feh,0ffh,0afh	; bdb9  ..?/.......6f...
	defb 0eeh,0fch,0f8h,0f0h,0f0h,080h,000h,000h,008h,008h,004h,006h,002h,00eh,013h,009h	; bdc9  ................
	defb 006h,001h,000h,000h,001h,002h,007h,000h,099h,080h,000h,000h,0c0h,0a0h,0d0h,0c0h	; bdd9  ................
	defb 028h,024h,018h,000h,008h,008h,004h,002h,006h,00fh,01fh,00fh,007h,001h,000h,000h	; bde9  ($..............
	defb 001h,002h,007h,000h,08ah,080h,000h,000h,0c0h,060h,0b0h,0f0h,038h,03ch,018h,008h	; bdf9  .........`..8<..
	defb 000h,090h,004h,034h,038h,064h,042h,055h,02eh,038h,000h,010h,02ch,062h,046h,056h	; be09  ...48dBU.8..,bFV
	defb 02ch,010h,010h,000h,090h,004h,034h,028h,05ch,07eh,07fh,03eh,038h,000h,010h,03ch	; be19  ,.....4(\~.>8..<
	defb 05eh,07eh,07eh,03ch,010h,00ah,000h,08ch,080h,0c0h,062h,011h,019h,007h,00bh,001h	; be29  ^~~<......b.....
	defb 005h,007h,002h,007h,005h,000h,002h,004h,002h,008h,092h,0b0h,0d8h,088h,09ch,0d4h	; be39  ................
	defb 064h,038h,0f0h,070h,000h,000h,080h,040h,022h,031h,009h,00fh,00fh,005h,007h,081h	; be49  d8.p...@"1......
	defb 003h,004h,000h,002h,004h,002h,008h,0a3h,0b0h,078h,0f8h,07ch,0bch,0fch,0f8h,0f0h	; be59  .........x.|....
	defb 0f0h,000h,000h,010h,010h,020h,020h,060h,010h,030h,008h,008h,004h,004h,003h,002h	; be69  .....  `.0......
	defb 004h,000h,000h,040h,02dh,043h,026h,094h,078h,010h,008h,004h,000h,081h,080h,003h	; be79  ...@-C&.x.......
	defb 000h,002h,010h,003h,020h,093h,070h,010h,038h,018h,01ch,00ch,00fh,006h,004h,000h	; be89  .... .p.8.......
	defb 000h,040h,01bh,03fh,0feh,0fch,078h,010h,008h,004h,000h,083h,080h,000h,000h,000h	; be99  .@.?..x.........

; ----------------------------------------------------------------------
; DATOS restos_finales_BEA9: 343 bytes al final del banco detras del ultimo
;   bloque que se lee (rachas_BD99): ningun lector del listado llega a ellos
;   ni los apunta ninguna tabla declarada
;   0xbea9..0xc000  (343 bytes)
DATA_restos_finales_BEA9:
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
