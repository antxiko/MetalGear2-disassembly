; ==========================================================================
; METAL GEAR 2 SOLID SNAKE - Konami (1990) - MSX2 - MegaROM RC-767 de 512 KB (Konami SCC) - banco 44 (se ejecuta en 0x8000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x08000


; ----------------------------------------------------------------------
; DATOS tabla_colores_8000: 5 punteros a colores de dibujo (los usa hasta el
;   indice 4; p00:4DA0); lo leen p00:4DA0 (10 bytes)
;   0x8000..0x800a  (10 bytes)
DATA_tabla_colores_8000:
	defw 0800ah,0800eh,0800fh,08010h,08012h	; 8000

; ----------------------------------------------------------------------
; DATOS colores_800A: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0x800a..0x800e  (4 bytes)
DATA_colores_800A:
	defb 013h,06fh,045h,082h	; 800a

; ----------------------------------------------------------------------
; DATOS colores_800E: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); se solapan 2 bloques:
;   (colores_800F 800F-8010); lo leen p00:4C26 (2 bytes)
;   0x800e..0x8010  (2 bytes)
DATA_colores_800E:
	defb 058h,04fh	; 800e

; ----------------------------------------------------------------------
; DATOS colores_8010: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (2 bytes)
;   0x8010..0x8012  (2 bytes)
DATA_colores_8010:
	defb 048h,0afh	; 8010

; ----------------------------------------------------------------------
; DATOS colores_8012: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (2 bytes)
;   0x8012..0x8014  (2 bytes)
DATA_colores_8012:
	defb 048h,0adh	; 8012

; ----------------------------------------------------------------------
; DATOS lista_8014: 8 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x8000); lo leen p00:4C26, p00:4C0C (41 bytes)
;   0x8014..0x803d  (41 bytes)
DATA_lista_8014:
	defb 006h,000h,001h,057h,080h	; 8014
	defb 04eh,000h,007h,087h,080h	; 8019
	defb 04eh,001h,015h,067h,081h	; 801e
	defb 097h,000h,023h,047h,082h	; 8023
	defb 002h,002h,040h,06fh,084h	; 8028
	defb 003h,003h,042h,07fh,084h	; 802d
	defb 001h,001h,045h,097h,084h	; 8032
	defb 07ah,001h,046h,09fh,084h	; 8037
	defb 0ffh	; 803c

; ----------------------------------------------------------------------
; DATOS lista_803D: 5 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x8000); lo leen p00:4C26, p00:4C0C (26 bytes)
;   0x803d..0x8057  (26 bytes)
DATA_lista_803D:
	defb 05ah,001h,081h,03fh,088h	; 803d
	defb 044h,000h,09bh,0dfh,089h	; 8042
	defb 0b6h,000h,09fh,01fh,08ah	; 8047
	defb 041h,003h,0d5h,02fh,08fh	; 804c
	defb 041h,004h,0d6h,03fh,08fh	; 8051
	defb 0ffh	; 8056

; ----------------------------------------------------------------------
; DATOS dibujo_8057: 6 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 0 de la lista 0x8014 (p00:4D92, p00:4DF5); lo leen p00:4C26,
;   p00:4C0C (48 bytes)
;   0x8057..0x8087  (48 bytes)
DATA_dibujo_8057:
	defb 0ffh,000h,000h,002h,000h,000h,000h,020h	; 8057  .......
	defb 0ffh,080h,080h,080h,080h,080h,080h,080h	; 805f  ........
	defb 0ffh,000h,000h,000h,000h,000h,000h,000h	; 8067  ........
	defb 0ffh,0c8h,0b2h,0c0h,080h,080h,080h,080h	; 806f  ........
	defb 0ffh,086h,083h,081h,0c0h,0e0h,0ffh,080h	; 8077  ........
	defb 0ffh,006h,003h,081h,0c0h,060h,0ffh,000h	; 807f  .....`..

; ----------------------------------------------------------------------
; DATOS dibujo_8087: 14 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 1 de la lista 0x8014 (p00:4D92, p00:4DF5); lo leen p00:4C26,
;   p00:4C0C (224 bytes)
;   0x8087..0x8167  (224 bytes)
DATA_dibujo_8087:
	defb 0feh,001h,000h,002h,000h,006h,000h,003h,000h,001h,000h,002h,000h,001h,000h,001h	; 8087  ................
	defb 0ffh,000h,080h,000h,080h,000h,080h,018h,08ch,000h,080h,000h,080h,000h,080h,000h	; 8097  ................
	defb 0ffh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,004h,002h,000h,000h,000h	; 80a7  ................
	defb 0ffh,000h,080h,000h,080h,000h,042h,080h,040h,080h,000h,0c0h,040h,080h,010h,080h	; 80b7  ......B.@...@...
	defb 0bfh,080h,080h,040h,000h,040h,040h,080h,040h,080h,040h,000h,040h,080h,000h,080h	; 80c7  ...@.@@.@.@.@...
	defb 09fh,0dfh,0bfh,080h,0bfh,0c0h,0beh,0c0h,09fh,080h,0dfh,0a0h,09fh,080h,09fh,0a0h	; 80d7  ................
	defb 0c3h,09bh,0cfh,0a0h,0dfh,080h,0dfh,0a0h,0ddh,080h,0dfh,0a0h,09fh,0c0h,09fh,0a0h	; 80e7  ................
	defb 0f0h,0fdh,0e3h,0f0h,0cfh,0a0h,09fh,0c0h,09fh,080h,0dfh,0a0h,0bfh,0c0h,0bfh,080h	; 80f7  ................
	defb 0feh,001h,00ch,002h,000h,006h,080h,003h,0c0h,001h,060h,002h,0feh,000h,000h,001h	; 8107  ..........`.....
	defb 07fh,0ffh,0e4h,00ah,0bfh,040h,09fh,000h,08fh,000h,087h,000h,083h,000h,081h,000h	; 8117  .....@..........
	defb 0ffh,0ffh,010h,083h,043h,014h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 8127  ....C...........
	defb 0ffh,0ffh,008h,083h,0d3h,0a8h,0ffh,080h,0ffh,080h,0ffh,080h,0ffh,080h,0ffh,080h	; 8137  ................
	defb 0ffh,000h,080h,000h,080h,000h,080h,000h,080h,000h,080h,000h,000h,0c0h,080h,060h	; 8147  ...............`
	defb 09fh,0d0h,0a0h,080h,0b0h,0c0h,0b8h,0c0h,09ch,080h,0deh,0a0h,09fh,080h,09fh,0a0h	; 8157  ................

; ----------------------------------------------------------------------
; DATOS dibujo_8167: 14 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 2 de la lista 0x8014 (p00:4D92, p00:4DF5); lo leen p00:4C26,
;   p00:4C0C (224 bytes)
;   0x8167..0x8247  (224 bytes)
DATA_dibujo_8167:
	defb 0ffh,0ffh,000h,000h,0ffh,000h,0feh,001h,0f9h,007h,0e7h,01fh,01dh,0f3h,021h,0ffh	; 8167  ..............!.
	defb 0ffh,0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,000h,0ffh	; 8177  ................
	defb 0ffh,0ffh,040h,080h,05fh,080h,05fh,080h,05fh,080h,05fh,080h,05fh,080h,000h,0ffh	; 8187  ..@._._._._._...
	defb 0ffh,0ffh,040h,080h,05fh,080h,05fh,080h,03fh,0c0h,04fh,090h,017h,0c8h,000h,0ffh	; 8197  ..@._._.?.O.....
	defb 0ffh,0ffh,010h,021h,0e6h,010h,0f3h,00ch,0fch,003h,0f9h,004h,0f2h,009h,000h,0ffh	; 81a7  ...!............
	defb 0ffh,0ffh,000h,000h,0ffh,000h,0ffh,000h,0e7h,000h,0f3h,00ch,0ffh,000h,000h,0ffh	; 81b7  ................
	defb 0ffh,0ffh,0bfh,0c0h,0a0h,0dfh,0a0h,0dfh,0a0h,0dfh,0a0h,0dfh,0a0h,0dfh,080h,0ffh	; 81c7  ................
	defb 0ffh,0ffh,0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 81d7  ................
	defb 0ffh,0ffh,040h,080h,059h,082h,05fh,080h,03fh,0c0h,053h,084h,05fh,080h,000h,0ffh	; 81e7  ..@.Y._.?.S._...
	defb 0ffh,0ffh,0ffh,000h,000h,0ffh,001h,0ffh,083h,0feh,06eh,0fdh,018h,0f7h,008h,0ffh	; 81f7  ..........n.....
	defb 0ffh,0ffh,040h,080h,05fh,080h,051h,082h,058h,087h,05fh,080h,05fh,080h,000h,0ffh	; 8207  ..@._.Q.X._._...
	defb 0ffh,0ffh,0bfh,0c0h,0c0h,0bfh,0e0h,09fh,0d0h,08fh,0d8h,087h,0dch,083h,080h,0ffh	; 8217  ................
	defb 0ffh,0ffh,0bfh,0c0h,0a0h,0dfh,0a0h,0dfh,0a8h,0dfh,0a0h,0dfh,0a2h,0dfh,080h,0ffh	; 8227  ................
	defb 0ffh,0ffh,080h,0c0h,0bfh,0c0h,0afh,0d0h,0a7h,0d8h,0a3h,0dch,0a1h,0deh,080h,0ffh	; 8237  ................

; ----------------------------------------------------------------------
; DATOS dibujo_8247: 23 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 3 de la lista 0x8014 (p00:4D92, p00:4DF5); lo leen p00:4C26,
;   p00:4C0C (552 bytes)
;   0x8247..0x846f  (552 bytes)
DATA_dibujo_8247:
	defb 0ffh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,0ffh,000h,0ffh,0f0h,000h,0f8h,0c0h,000h,0e0h,080h,000h,0c0h,080h,000h,090h,000h	; 8247  ........................
	defb 0fch,0ffh,000h,000h,0feh,0e0h,000h,0f0h,000h,000h,088h,000h,080h,000h,000h,080h,000h,000h,080h,000h,000h,080h,000h,000h	; 825f  ........................
	defb 0ffh,000h,000h,080h,000h,000h,080h,000h,000h,080h,000h,000h,080h,00eh,000h,080h,01fh,00eh,080h,03fh,01fh,000h,040h,03fh	; 8277  ...................?..@?
	defb 0feh,001h,000h,000h,001h,000h,000h,003h,000h,000h,003h,000h,000h,001h,000h,000h,087h,001h,000h,0cfh,083h,000h,000h,0c7h	; 828f  ........................
	defb 0adh,0aah,050h,0b9h,0a4h,040h,0e7h,090h,000h,09fh,080h,000h,0bfh,0c0h,000h,0bfh,0c0h,000h,0bfh,080h,000h,0bfh,080h,000h	; 82a7  ..P..@..................
	defb 0ffh,000h,000h,080h,004h,004h,088h,014h,01ch,084h,016h,038h,088h,02ch,010h,086h,018h,000h,09ch,000h,000h,080h,000h,000h	; 82bf  ...........8.,..........
	defb 0ffh,0bfh,000h,0bfh,080h,000h,0bfh,0c0h,000h,0bfh,080h,000h,09fh,0a0h,000h,09fh,080h,000h,09fh,0c0h,040h,0cfh,0d0h,000h	; 82d7  ....................@...
	defb 0c6h,0c7h,038h,07ch,0feh,080h,0cbh,0c4h,000h,03eh,038h,000h,0feh,0e0h,000h,0feh,000h,000h,0f8h,000h,000h,000h,000h,000h	; 82ef  ..8|.....>8.............
	defb 0ffh,0ffh,000h,000h,000h,0ffh,000h,000h,0ffh,000h,03fh,0c0h,01fh,03bh,0c0h,01bh,03bh,0c0h,000h,024h,0c0h,01fh,03bh,0c0h	; 8307  ..........?........$....
	defb 0ffh,0ffh,000h,000h,000h,0ffh,000h,000h,0ffh,002h,0fdh,001h,0fah,069h,001h,06ah,069h,001h,002h,091h,001h,0fah,069h,001h	; 831f  .............i.ji.....i.
	defb 09bh,0bbh,040h,000h,024h,0c0h,01fh,03bh,0c0h,01bh,03bh,0c0h,000h,024h,0c0h,03fh,000h,0c0h,03fh,03fh,0c0h,000h,07fh,0ffh	; 8337  ..@.$........$.?..??....
	defb 06ah,068h,001h,002h,091h,001h,0fah,069h,001h,06ah,069h,001h,002h,091h,001h,0feh,001h,001h,0feh,0ffh,001h,000h,0ffh,0ffh	; 834f  jh.....i.ji.............
	defb 0ffh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,0ffh,000h,0ffh,0ffh,000h,0ffh,0ffh,000h,0ffh,0f0h,000h,0ffh,0c0h,000h,0e4h,000h	; 8367  ........................
	defb 0ffh,0ffh,000h,03fh,040h,0ffh,020h,05fh,0ffh,020h,05fh,0ffh,020h,05fh,0ffh,020h,05fh,0ffh,000h,0ffh,007h,000h,01fh,000h	; 837f  ...?@. _. _. _. _.......
	defb 03fh,0ffh,000h,007h,038h,00fh,001h,00eh,000h,000h,003h,000h,000h,001h,000h,001h,002h,000h,000h,001h,000h,000h,001h,000h	; 8397  ?...8...................
	defb 0ffh,0bfh,000h,0bfh,086h,000h,0bfh,0c3h,000h,0bfh,081h,000h,09fh,0a0h,000h,09fh,080h,000h,09fh,0dfh,040h,0cfh,0d0h,000h	; 83af  ....................@...
	defb 0f9h,0fdh,006h,014h,09ah,00fh,0a9h,0bdh,016h,0c3h,003h,01ch,0d6h,036h,009h,0e3h,00bh,000h,0fch,005h,000h,0feh,000h,000h	; 83c7  .............6..........
	defb 0c0h,03ah,001h,001h,00dh,000h,000h,002h,000h,000h,013h,000h,008h,001h,000h,000h,001h,000h,000h,001h,000h,000h,003h,000h	; 83df  .:......................
	defb 09fh,0bfh,040h,087h,0a8h,040h,081h,0deh,060h,0c0h,0c3h,03ch,085h,094h,07bh,0b0h,0f1h,04fh,0a0h,0a4h,05fh,0e6h,0e6h,019h	; 83f7  ..@..@..`..<..{..O.._...
	defb 0ffh,000h,000h,000h,000h,000h,000h,000h,000h,000h,080h,000h,000h,0c0h,000h,000h,0f0h,080h,000h,0f8h,0e0h,040h,007h,0f8h	; 840f  .....................@..
	defb 0ffh,000h,000h,080h,000h,000h,080h,000h,000h,080h,000h,000h,080h,000h,000h,080h,007h,000h,080h,07fh,007h,000h,000h,07fh	; 8427  ........................
	defb 0feh,000h,000h,001h,002h,001h,000h,007h,003h,000h,03fh,007h,004h,0f9h,01fh,006h,0ffh,0f9h,040h,09fh,0ffh,000h,000h,0ffh	; 843f  ..........?.......@.....
	defb 002h,003h,0fch,0fdh,0feh,000h,00bh,004h,000h,0ffh,0e8h,000h,0ffh,000h,000h,0ffh,000h,000h,000h,000h,000h,000h,000h,000h	; 8457  ........................

; ----------------------------------------------------------------------
; DATOS dibujo_846F: 2 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 4 de la lista 0x8014 (p00:4D92, p00:4DF5); lo leen p00:4C26,
;   p00:4C0C (16 bytes)
;   0x846f..0x847f  (16 bytes)
DATA_dibujo_846F:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,000h,0ffh,000h	; 846f  ........
	defb 000h,000h,000h,000h,000h,000h,000h,000h	; 8477  ........

; ----------------------------------------------------------------------
; DATOS dibujo_847F: 3 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 5 de la lista 0x8014 (p00:4D92, p00:4DF5); lo leen p00:4C26,
;   p00:4C0C (24 bytes)
;   0x847f..0x8497  (24 bytes)
DATA_dibujo_847F:
	defb 0ffh,000h,000h,000h,000h,000h,000h,000h	; 847f  ........
	defb 0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh	; 8487  ........
	defb 080h,080h,080h,080h,080h,080h,080h,080h	; 848f  ........

; ----------------------------------------------------------------------
; DATOS dibujo_8497: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 6 de la lista 0x8014 (p00:4D92, p00:4DF5); lo leen p00:4C26,
;   p00:4C0C (8 bytes)
;   0x8497..0x849f  (8 bytes)
DATA_dibujo_8497:
	defb 07fh,07fh,07fh,07fh,07fh,07fh,07fh,07fh	; 8497  ........

; ----------------------------------------------------------------------
; DATOS dibujo_849F: 58 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 7 de la lista 0x8014 (p00:4D92, p00:4DF5); lo leen p00:4C26,
;   p00:4C0C (928 bytes)
;   0x849f..0x883f  (928 bytes)
DATA_dibujo_849F:
	defb 0ffh,0ffh,0ffh,0d0h,0d1h,0feh,0d1h,0feh,0d1h,0feh,0d1h,0feh,0d1h,0feh,0d1h,0feh	; 849f  ................
	defb 0d1h,0feh,0d1h,0feh,0d1h,0feh,0d1h,0feh,0d1h,0feh,0d1h,0feh,0d1h,0feh,0d1h,0feh	; 84af  ................
	defb 0ffh,0ffh,07fh,00bh,08bh,07fh,08bh,07fh,08bh,07fh,08bh,07fh,08bh,07fh,08bh,07fh	; 84bf  ................
	defb 08bh,07fh,08bh,07fh,08bh,07fh,08bh,07fh,08bh,07fh,08bh,07fh,08bh,07fh,08bh,07fh	; 84cf  ................
	defb 000h,0ffh,000h,0ffh,080h,0ffh,080h,0ffh,0c0h,07fh,0c0h,07fh,0c0h,07fh,0c0h,07fh	; 84df  ................
	defb 060h,0bfh,060h,0bfh,060h,0bfh,060h,0bfh,030h,0dfh,030h,0dfh,030h,0dfh,030h,0dfh	; 84ef  `.`.`.`.0.0.0.0.
	defb 018h,0efh,018h,0efh,018h,0efh,018h,0efh,00ch,0f7h,00ch,0f7h,00ch,0f7h,00ch,0f7h	; 84ff  ................
	defb 006h,0fbh,006h,0fbh,006h,0fbh,006h,0fbh,003h,0fdh,003h,0fdh,003h,0fdh,003h,0fdh	; 850f  ................
	defb 06eh,081h,06ch,083h,06dh,083h,06dh,083h,06ah,086h,06ah,086h,06ah,086h,06ah,086h	; 851f  n.l.m.m.j.j.j.j.
	defb 074h,08ch,074h,08ch,074h,08ch,074h,08ch,06ah,098h,06ah,098h,06ah,098h,06ah,098h	; 852f  t.t.t.t.j.j.j.j.
	defb 056h,0b0h,056h,0b0h,056h,0b0h,056h,0b0h,02eh,0e0h,02eh,0e0h,02eh,0e0h,02eh,0e0h	; 853f  V.V.V.V.........
	defb 04eh,0c0h,04eh,0c0h,04eh,0c0h,04eh,0c0h,0aeh,080h,0aeh,080h,0aeh,080h,0aeh,080h	; 854f  N.N.N.N.........
	defb 020h,0dfh,020h,0dfh,020h,0dfh,030h,0dfh,030h,0dfh,030h,0dfh,030h,0dfh,034h,0dfh	; 855f   . . .0.0.0.0.4.
	defb 034h,0dfh,034h,0dfh,034h,0dfh,036h,0dfh,036h,0dfh,036h,0dfh,036h,0dfh,036h,0dfh	; 856f  4.4.4.6.6.6.6.6.
	defb 036h,0dfh,016h,0efh,016h,0efh,016h,0efh,016h,0efh,00fh,0f7h,00eh,0f7h,00fh,0f7h	; 857f  6...............
	defb 00fh,0f7h,007h,0fbh,007h,0fbh,007h,0fbh,007h,0fbh,003h,0fdh,003h,0fdh,001h,0ffh	; 858f  ................
	defb 06eh,080h,06eh,080h,06eh,080h,066h,088h,066h,088h,066h,088h,066h,088h,046h,0a8h	; 859f  n.n.n.f.f.f.f.F.
	defb 046h,0a8h,046h,0a8h,046h,0a8h,00eh,0e8h,00eh,0e8h,02eh,0e8h,0eeh,0e8h,06eh,0e8h	; 85af  F.F.F.........n.
	defb 06eh,0e8h,06eh,0e8h,06eh,0e8h,06eh,0e8h,06eh,0e8h,06eh,0e8h,066h,0e0h,066h,0e0h	; 85bf  n.n.n.n.n.n.f.f.
	defb 06eh,0e0h,0eeh,0e0h,04eh,0c0h,04eh,0c0h,06eh,0c0h,06eh,0c0h,02eh,080h,02eh,080h	; 85cf  n...N.N.n.n.....
	defb 0c6h,0f9h,0a5h,0f8h,0a7h,0f8h,0a3h,0fch,0a5h,0fah,0aeh,0ffh,0f6h,0f8h,0b1h,0eeh	; 85df  ................
	defb 0c1h,0feh,0a3h,0fch,0a6h,0ffh,0bfh,0ffh,0e7h,0ffh,0f3h,0ffh,0fbh,0dfh,0ddh,0ffh	; 85ef  ................
	defb 0d1h,0feh,0d1h,0feh,0d0h,0ffh,0d0h,0ffh,0dfh,0ffh,0c0h,0ffh,0ffh,0ffh,0ffh,0ffh	; 85ff  ................
	defb 08bh,07fh,08bh,07fh,00bh,0ffh,00bh,0ffh,0fbh,0ffh,003h,0ffh,0ffh,0ffh,0ffh,0ffh	; 860f  ................
	defb 000h,000h,0ffh,000h,080h,07fh,080h,07fh,08fh,07fh,088h,07fh,08bh,07fh,08bh,07fh	; 861f  ................
	defb 000h,000h,0ffh,000h,001h,0feh,001h,0feh,0f1h,0feh,011h,0feh,0d1h,0feh,0d1h,0feh	; 862f  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,003h,0ffh,0fbh,0ffh,00bh,0ffh	; 863f  ................
	defb 08bh,07fh,08bh,07fh,08bh,07fh,08bh,07fh,08bh,07fh,088h,07fh,08fh,07fh,000h,0ffh	; 864f  ................
	defb 0d1h,0feh,0d1h,0feh,0d1h,0feh,0d1h,0feh,0d1h,0feh,011h,0feh,0f0h,0ffh,001h,0ffh	; 865f  ................
	defb 000h,000h,0ffh,000h,000h,0ffh,000h,0ffh,0ffh,0ffh,000h,0ffh,0ffh,0ffh,0ffh,0ffh	; 866f  ................
	defb 0ffh,0ffh,0bfh,0dfh,09bh,0ech,08bh,0fch,08bh,0fch,0aah,0fdh,08bh,0fch,088h,0ffh	; 867f  ................
	defb 0ddh,0a2h,0edh,0bah,0bdh,0fah,0adh,0fah,0bdh,0eah,06dh,0fah,07dh,0fah,06dh,0bah	; 868f  ..........m.}.m.
	defb 03ch,0ebh,02dh,0fah,03dh,0fah,02dh,0fah,03dh,0eah,02dh,0fah,03dh,0fah,02dh,0fah	; 869f  <.-.=.-.=.-.=.-.
	defb 03dh,0eah,02dh,0fah,07dh,0fah,06dh,0fah,07dh,0eah,0edh,0bah,0bdh,0fah,0aah,0ffh	; 86af  =.-.}.m.}.......
	defb 07dh,083h,001h,0ffh,001h,0ffh,001h,0ffh,003h,0feh,003h,0feh,002h,0feh,002h,0feh	; 86bf  }...............
	defb 004h,0feh,004h,0feh,004h,0feh,004h,0feh,008h,0feh,00ah,0fch,00ah,0fch,00ah,0fch	; 86cf  ................
	defb 012h,0fch,012h,0fch,016h,0f8h,016h,0f8h,026h,0f8h,026h,0f8h,026h,0f8h,02eh,0f0h	; 86df  ........&.&.&...
	defb 04eh,0f0h,04eh,0f0h,04eh,0f0h,04eh,0f0h,08eh,0f0h,09eh,0e0h,09eh,0e0h,09eh,0e0h	; 86ef  N.N.N.N.........
	defb 08eh,0e0h,08eh,0e0h,08eh,0e0h,086h,0e8h,0a6h,0c8h,0a6h,0c8h,0a6h,0c8h,086h,0e8h	; 86ff  ................
	defb 0f7h,008h,00ch,0fbh,000h,0ffh,018h,0f7h,008h,0f7h,010h,0ffh,030h,0efh,060h,0dfh	; 870f  ............0.`.
	defb 0feh,021h,011h,0feh,031h,0eeh,031h,0eeh,070h,0efh,020h,0ffh,018h,0f7h,010h,0ffh	; 871f  .!..1.1.p. .....
	defb 0c1h,0feh,030h,0efh,020h,0ffh,018h,0f7h,000h,0ffh,008h,0ffh,020h,0dfh,000h,0ffh	; 872f  ..0. ....... ...
	defb 000h,0ffh,0f8h,00fh,008h,0ffh,008h,0ffh,06ch,0dbh,068h,09fh,02ch,0dbh,06ch,0dbh	; 873f  ........l.h.,.l.
	defb 000h,0ffh,070h,0efh,000h,0ffh,077h,0e8h,004h,0fbh,07fh,0ffh,06ah,0ffh,055h,0ffh	; 874f  ..p...w.....j.U.
	defb 000h,0ffh,00eh,0fdh,000h,0ffh,00eh,0fdh,040h,0ffh,0feh,0fdh,0aah,0fdh,05ah,0fdh	; 875f  ........@.....Z.
	defb 07fh,0eah,05dh,0f7h,07fh,0eah,07fh,0ffh,071h,0ffh,064h,0ffh,03fh,0c2h,002h,0ffh	; 876f  ..].....q.d.?...
	defb 0fah,0adh,0dah,07dh,0fah,0adh,0fah,0fdh,002h,0fdh,002h,0fdh,0fch,003h,000h,0ffh	; 877f  ...}............
	defb 068h,09fh,02eh,0ddh,06ch,0dfh,06bh,09eh,02bh,0deh,068h,0dfh,069h,09fh,029h,0dfh	; 878f  h...l.k.+.h.i.).
	defb 02eh,080h,02eh,080h,02eh,080h,02eh,080h,02eh,080h,02eh,080h,02eh,080h,02eh,080h	; 879f  ................
	defb 02fh,080h,02fh,080h,02fh,080h,02fh,080h,02eh,081h,02eh,081h,02eh,081h,02eh,081h	; 87af  /./././.........
	defb 02ch,083h,02ch,083h,02ch,083h,02ch,083h,028h,087h,028h,087h,028h,087h,028h,087h	; 87bf  ,.,.,.,.(.(.(.(.
	defb 030h,08fh,030h,08fh,031h,08eh,031h,08eh,021h,09eh,022h,09dh,022h,09dh,022h,09dh	; 87cf  0.0.1.1.!.".".".
	defb 042h,0bdh,044h,0bbh,044h,0bbh,044h,0bbh,004h,0ffh,003h,0ffh,002h,0fdh,080h,0ffh	; 87df  B.D.D.D.........
	defb 0ffh,000h,000h,0ffh,007h,0ffh,005h,0ffh,007h,0fdh,007h,0fdh,005h,0ffh,00fh,0fdh	; 87ef  ................
	defb 0ffh,000h,000h,0ffh,0f0h,0ffh,050h,0ffh,0f0h,05fh,0f0h,05fh,050h,0ffh,0f8h,05fh	; 87ff  ......P.._._P.._
	defb 0ffh,020h,012h,0ffh,01ah,0f5h,018h,0f7h,02ch,0fbh,034h,0efh,006h,0fdh,002h,0ffh	; 880f  . ......,.4.....
	defb 003h,0feh,006h,0fdh,002h,0fdh,004h,0ffh,004h,0ffh,002h,0fdh,002h,0ffh,000h,0ffh	; 881f  ................
	defb 000h,0ffh,0d5h,02ah,02ah,0ffh,02ah,0ffh,000h,0ffh,000h,0ffh,015h,0ffh,0ffh,0f5h	; 882f  ...**.*.........

; ----------------------------------------------------------------------
; DATOS dibujo_883F: 26 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 0 de la lista 0x803D (p00:4D92, p00:4DF5); lo leen p00:4C26,
;   p00:4C0C (416 bytes)
;   0x883f..0x89df  (416 bytes)
DATA_dibujo_883F:
	defb 000h,0ffh,060h,09fh,08ch,0fbh,088h,0f7h,004h,0fbh,00ch,0fbh,06ch,0dbh,0ech,05bh	; 883f  ..`.........l..[
	defb 095h,0ffh,0f5h,01fh,03fh,0dfh,01fh,0e0h,000h,0ffh,0ffh,0ffh,0f7h,00ch,00ch,0fbh	; 884f  ....?...........
	defb 06ch,0dbh,06ch,0dbh,0e8h,0d7h,0e4h,01bh,00ch,0fbh,0f4h,0fbh,058h,0a7h,030h,0efh	; 885f  l.l.........X.0.
	defb 0ffh,000h,000h,0ffh,006h,0fbh,00bh,0fbh,006h,0fbh,01dh,0c2h,009h,0c6h,02fh,0c0h	; 886f  ............../.
	defb 0ffh,000h,000h,0ffh,018h,0efh,0ech,0efh,018h,0efh,0f4h,00bh,0e6h,01bh,0fbh,007h	; 887f  ................
	defb 027h,0c0h,031h,0c0h,030h,0cfh,02fh,0dfh,01fh,0ffh,007h,0ffh,001h,0ffh,000h,0ffh	; 888f  '.1.0./.........
	defb 0fbh,007h,073h,00fh,003h,0ffh,0fbh,0ffh,0ffh,0ffh,0feh,0ffh,0feh,0ffh,000h,0ffh	; 889f  ..s.............
	defb 004h,0ffh,00ch,0fbh,000h,0ffh,00ch,0fbh,00ch,0fbh,058h,0f7h,030h,0efh,020h,0ffh	; 88af  ..........X.0. .
	defb 0feh,0feh,040h,084h,052h,088h,046h,090h,04eh,0a0h,00eh,0c0h,02eh,080h,02eh,080h	; 88bf  ..@.R.F.N.......
	defb 000h,000h,0bfh,000h,087h,007h,000h,07fh,0ffh,0ffh,080h,07fh,080h,07fh,080h,07fh	; 88cf  ................
	defb 000h,000h,0ffh,000h,077h,077h,000h,0ffh,0ffh,0ffh,001h,0ffh,001h,0ffh,001h,0ffh	; 88df  ....ww..........
	defb 000h,000h,0ffh,000h,077h,077h,000h,0ffh,0ffh,0ffh,080h,07fh,080h,07fh,080h,07fh	; 88ef  ....ww..........
	defb 000h,000h,0ffh,000h,070h,070h,000h,0ffh,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 88ff  ....pp..........
	defb 07fh,000h,07fh,000h,05fh,020h,07bh,004h,053h,02ch,081h,0feh,0ffh,0ffh,006h,0fdh	; 890f  ...._ {.S,......
	defb 0feh,001h,0deh,021h,0feh,001h,0deh,021h,09ah,065h,000h,0ffh,0ffh,0ffh,000h,0ffh	; 891f  ...!...!.e......
	defb 07fh,080h,080h,0ffh,080h,0ffh,080h,0ffh,0c0h,07fh,0c0h,07fh,0c0h,07fh,0c0h,07fh	; 892f  ................
	defb 0afh,0c0h,0afh,0c0h,0afh,0c0h,0afh,0c0h,02eh,081h,02eh,081h,02eh,081h,02eh,081h	; 893f  ................
	defb 07fh,07fh,020h,000h,05fh,080h,02fh,0c0h,017h,0e0h,00bh,0f0h,004h,0f9h,003h,0fdh	; 894f  .. ._./.........
	defb 000h,0ffh,05fh,0e0h,0c0h,0ffh,0ffh,0ffh,0cfh,07fh,0c7h,07fh,0c3h,07fh,0c1h,07fh	; 895f  .._.............
	defb 0e7h,0efh,0c3h,00ch,014h,0efh,0f7h,0efh,0f7h,0efh,0f7h,0efh,0f7h,0efh,0f7h,0efh	; 896f  ................
	defb 0f7h,0efh,0f7h,0efh,0f7h,0efh,0f7h,0efh,0f7h,0efh,0f7h,0efh,0f7h,0efh,0f7h,0efh	; 897f  ................
	defb 0ffh,0ffh,0fdh,003h,003h,0ffh,0ffh,0ffh,0f2h,0feh,0eah,0f6h,0dah,0e6h,0bah,0c6h	; 898f  ................
	defb 040h,03fh,040h,0ffh,0b0h,06fh,090h,07fh,098h,077h,08ch,07bh,09eh,075h,032h,0efh	; 899f  @?@..o...w.{.u2.
	defb 0fdh,002h,082h,07fh,086h,07dh,08ch,07bh,088h,07fh,09ch,077h,070h,0efh,080h,07fh	; 89af  .....}.{...wp...
	defb 019h,0efh,01bh,0eeh,01ah,0efh,01eh,0edh,00ch,0f7h,00ch,0f7h,00ch,0f7h,00ch,0f7h	; 89bf  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0c0h,0ffh,0dfh,0ffh,0d0h,0ffh	; 89cf  ................

; ----------------------------------------------------------------------
; DATOS dibujo_89DF: 4 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 1 de la lista 0x803D (p00:4D92, p00:4DF5); lo leen p00:4C26,
;   p00:4C0C (64 bytes)
;   0x89df..0x8a1f  (64 bytes)
DATA_dibujo_89DF:
	defb 0ffh,0ffh,000h,000h,000h,0ffh,000h,0ffh,000h,000h,000h,000h,0ffh,000h,0ffh,0ffh	; 89df  ................
	defb 000h,000h,000h,000h,000h,000h,008h,000h,000h,004h,000h,000h,000h,000h,000h,000h	; 89ef  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,018h,000h,020h,004h,020h,004h,000h,018h	; 89ff  .......... . ...
	defb 000h,000h,000h,000h,000h,000h,000h,000h,008h,000h,020h,002h,031h,000h,0ffh,000h	; 8a0f  .......... .1...

; ----------------------------------------------------------------------
; DATOS dibujo_8A1F: 54 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 2 de la lista 0x803D (p00:4D92, p00:4DF5); lo leen p00:4C26,
;   p00:4C0C (1296 bytes)
;   0x8a1f..0x8f2f  (1296 bytes)
DATA_dibujo_8A1F:
	defb 0ffh,0f0h,00fh,010h,01fh,00fh,010h,0f8h,00fh,010h,0f8h,00fh,013h,01bh,00ch,012h,01ah,00dh,0f2h,01ah,00dh,0f2h,0fah,00dh	; 8a1f  ........................
	defb 0ffh,00fh,0f0h,008h,0f8h,0f0h,008h,01fh,0f0h,008h,01fh,0f0h,0c8h,0d8h,030h,048h,058h,0b0h,04fh,058h,0b0h,04fh,05fh,0b0h	; 8a37  ..............0HX.OX.O_.
	defb 00fh,091h,0e0h,0a8h,0aah,050h,0f4h,0f4h,008h,05ah,05ah,0a4h,0ebh,0eah,014h,0e7h,037h,018h,027h,096h,018h,007h,017h,018h	; 8a4f  .....P...ZZ.....7.'.....
	defb 0aeh,0a8h,050h,092h,093h,06dh,0dch,05ch,023h,0cfh,04fh,030h,035h,0b5h,04ah,05fh,09fh,020h,0bfh,04fh,000h,08ch,002h,000h	; 8a67  ..P..m.\#.O05.J_. .O....
	defb 00fh,02eh,030h,00fh,0cfh,0f0h,03eh,03eh,0c1h,0ffh,0ffh,000h,07dh,07fh,082h,0fah,0fbh,005h,0e1h,0e8h,01fh,094h,02fh,003h	; 8a7f  ..0...>>....}........./.
	defb 0a1h,0aeh,047h,0e0h,0f1h,01fh,0c7h,0c7h,03fh,0b0h,0b0h,050h,080h,083h,04fh,08eh,08eh,051h,0b1h,0b6h,00fh,0a0h,0b1h,01fh	; 8a97  ..G.....?..P..O..Q......
	defb 0ffh,000h,0e0h,040h,0b8h,0f8h,0f0h,0f5h,0fch,0ebh,0eah,0ech,005h,0f4h,0f6h,003h,012h,0f8h,0ebh,00ah,0f4h,057h,0aeh,0f8h	; 8aaf  ...@.................W..
	defb 0cfh,080h,000h,083h,080h,07fh,0ffh,0ffh,000h,0fch,0fch,003h,0feh,0feh,001h,0ffh,0ffh,000h,0ffh,0ffh,000h,0ffh,0ffh,000h	; 8ac7  ........................
	defb 003h,0f6h,0fch,043h,0b3h,0fch,061h,090h,0feh,0c3h,032h,0fch,003h,0f2h,0fch,003h,012h,0fch,0ebh,00ah,0f4h,057h,0aeh,0f8h	; 8adf  ...C..a...2..........W..
	defb 043h,0b6h,0fch,003h,0f2h,0fch,0a1h,0b0h,05eh,01bh,01ah,0e4h,007h,006h,0f8h,083h,082h,07ch,0a3h,0a2h,05ch,083h,082h,07ch	; 8af7  C.......^........|..\..|
	defb 0a5h,0afh,05ah,0b6h,0b6h,049h,0cbh,0ddh,034h,0e4h,0e2h,018h,093h,0d3h,060h,0d5h,0d2h,020h,0b5h,0aah,040h,0f3h,0ech,000h	; 8b0f  ..Z..I..4.....`.. ..@...
	defb 087h,0a3h,040h,083h,0cch,070h,095h,09eh,068h,0a6h,097h,078h,082h,0aah,07ch,0deh,0d7h,028h,0a2h,0abh,05ch,0d6h,0f0h,028h	; 8b27  ..@..p..h..x..|..(..\..(
	defb 0d0h,02ah,01fh,084h,06ah,03fh,020h,08ah,07fh,049h,079h,036h,001h,0c5h,07eh,011h,099h,06eh,03ah,05ah,005h,01dh,02dh,002h	; 8b3f  .*..j? ..Iy6..~..n:Z..-.
	defb 0ffh,000h,000h,043h,0bfh,0fch,0f8h,0fdh,004h,003h,006h,0fch,003h,006h,0fch,003h,006h,0fch,083h,086h,07ch,0c3h,0c6h,03ch	; 8b57  ...C................|..<
	defb 0e3h,0e6h,01ch,0f3h,0f7h,00ch,043h,0c2h,0bch,003h,0bah,0fch,003h,0bah,0fch,003h,0aah,0fch,003h,0bah,0fch,043h,042h,0bch	; 8b6f  ......C..............CB.
	defb 0ffh,0ffh,000h,080h,080h,07fh,080h,080h,07fh,0c0h,080h,000h,0ffh,0c0h,000h,0a0h,0e0h,05fh,0f0h,0d8h,02fh,0afh,0ffh,050h	; 8b87  ................._../..P
	defb 0ffh,0feh,000h,003h,002h,0fch,003h,002h,0fch,007h,002h,000h,0ffh,002h,000h,003h,002h,0fch,003h,002h,0fch,0ffh,0feh,000h	; 8b9f  ........................
	defb 0a5h,0afh,05ah,0b6h,0b6h,049h,0cbh,0ddh,034h,0e4h,0e2h,018h,09bh,0d3h,060h,0d5h,0d2h,020h,0b5h,0aah,040h,0f3h,0ech,000h	; 8bb7  ..Z..I..4.....`.. ..@...
	defb 0e0h,01eh,00fh,082h,072h,03dh,08fh,04fh,070h,09fh,01fh,060h,01fh,09fh,0e0h,03fh,03ch,0c0h,03eh,038h,0c0h,02ch,029h,0d0h	; 8bcf  ....r=.Op..`...?<.>8.,).
	defb 000h,039h,000h,038h,0c6h,03ch,061h,09bh,07eh,021h,059h,07eh,025h,05dh,07ah,031h,0d9h,07eh,021h,0d9h,06eh,021h,059h,07eh	; 8be7  .9.8.<a.~!Y~%]z1.~!.n!Y~
	defb 031h,0d9h,07eh,021h,0d9h,06eh,021h,0d9h,07eh,031h,0d9h,07eh,021h,055h,06eh,021h,0d1h,07eh,005h,0c5h,07ah,023h,09bh,07ch	; 8bff  1.~!.n!.~1.~!Un!.~..z#.|
	defb 041h,0bdh,07eh,001h,0e5h,07eh,019h,0d9h,066h,03dh,0bdh,042h,05bh,0dah,024h,067h,0a4h,018h,03eh,0d9h,000h,080h,02dh,000h	; 8c17  A.~..~..f=.B[.$g..>...-.
	defb 000h,000h,0ffh,01fh,01fh,0e0h,0ffh,0f0h,000h,019h,010h,0e0h,01ah,010h,0e0h,01ah,010h,0e0h,01ch,010h,0e0h,019h,010h,0e0h	; 8c2f  ........................
	defb 000h,000h,0ffh,0ffh,0ffh,000h,0ffh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 8c47  ........................
	defb 000h,000h,0ffh,0f8h,0f8h,007h,0ffh,00fh,000h,018h,008h,007h,098h,008h,007h,018h,008h,007h,01ch,00ch,003h,01ah,00ah,005h	; 8c5f  ........................
	defb 018h,010h,0e0h,018h,010h,0e0h,018h,010h,0e0h,018h,010h,0e0h,018h,010h,0e0h,018h,010h,0e0h,018h,010h,0e0h,018h,010h,0e0h	; 8c77  ........................
	defb 01ah,00eh,005h,01ah,00eh,005h,01ah,00ah,005h,01ah,00ah,005h,01ah,00ah,005h,01ch,00ch,003h,018h,008h,007h,018h,008h,007h	; 8c8f  ........................
	defb 01ah,012h,0e0h,01ah,011h,0e0h,01ah,011h,0e0h,01ah,011h,0e0h,01ah,011h,0e0h,01ah,011h,0e0h,018h,012h,0e0h,018h,010h,0e0h	; 8ca7  ........................
	defb 018h,008h,007h,018h,008h,007h,018h,008h,007h,018h,008h,007h,018h,008h,007h,01ch,00ch,003h,01ah,00ah,005h,01ah,00eh,005h	; 8cbf  ........................
	defb 018h,010h,0e0h,018h,010h,0e0h,018h,010h,0e0h,018h,012h,0e0h,018h,011h,0e0h,01ah,010h,0e0h,01ah,010h,0e0h,01fh,010h,0e0h	; 8cd7  ........................
	defb 01ah,00eh,005h,01ah,00ah,005h,01ah,04ah,005h,01ah,00ah,005h,05ch,00ch,003h,018h,008h,007h,058h,008h,007h,0f8h,008h,007h	; 8cef  .......J....\.....X.....
	defb 005h,00dh,0fah,005h,005h,0fah,00dh,00dh,0f2h,000h,003h,0ffh,000h,000h,0ffh,005h,005h,0ffh,000h,000h,0fah,000h,000h,0ffh	; 8d07  ........................
	defb 050h,058h,0afh,050h,050h,0afh,058h,058h,0a7h,000h,0f0h,0ffh,000h,000h,0ffh,050h,050h,0ffh,000h,000h,0afh,000h,000h,0ffh	; 8d1f  PX.PP.XX.......PP.......
	defb 000h,000h,0ffh,000h,01fh,0ffh,000h,020h,0ffh,00ah,02ah,0fah,000h,020h,0ffh,01fh,01fh,0e0h,002h,003h,0fdh,004h,006h,0fbh	; 8d37  ....... ..*.. ..........
	defb 010h,010h,0efh,000h,0dch,0ffh,022h,032h,0ddh,0aah,0aah,0adh,082h,0c2h,07dh,0fch,0fch,003h,004h,006h,0fbh,004h,004h,0fbh	; 8d4f  ......"2......}.........
	defb 010h,010h,0efh,008h,00ch,0f7h,004h,006h,0fbh,004h,006h,0fbh,003h,003h,0fch,007h,00dh,0f8h,03fh,03fh,0c0h,067h,0c2h,080h	; 8d67  ..................??.g..
	defb 000h,000h,0ffh,000h,000h,0ffh,001h,001h,0feh,0c2h,0c3h,03dh,0b2h,0f2h,04dh,0cch,05eh,033h,0feh,0feh,001h,03bh,013h,000h	; 8d7f  ...........=..M.^3......
	defb 008h,018h,0f7h,009h,009h,0f6h,005h,005h,0fah,006h,004h,0f8h,003h,003h,0fch,016h,01ch,0e8h,00fh,00fh,0f0h,00ch,008h,0f0h	; 8d97  ........................
	defb 0ffh,0ffh,000h,0b1h,054h,000h,0ffh,0ffh,000h,0ffh,0ffh,000h,0ffh,0ffh,000h,0eah,0eah,015h,0ffh,0ffh,000h,080h,080h,07fh	; 8daf  ....T...................
	defb 0ffh,0ffh,000h,08ch,0a6h,000h,0ffh,0ffh,000h,0ffh,0ffh,000h,0ffh,0ffh,000h,0abh,0abh,054h,0ffh,0ffh,000h,081h,081h,07eh	; 8dc7  .................T.....~
	defb 0e0h,0e0h,01fh,090h,038h,06fh,0c8h,0cch,037h,068h,0ach,017h,0f8h,0f8h,007h,070h,098h,00fh,0e0h,0f0h,01fh,038h,098h,007h	; 8ddf  ....8o..7h.....p.....8..
	defb 000h,000h,0ffh,000h,000h,0ffh,040h,040h,0ffh,0e0h,0e0h,0ffh,000h,000h,0ffh,055h,055h,0d5h,000h,000h,0ffh,000h,000h,0ffh	; 8df7  ......@@.......UU.......
	defb 0e7h,0f7h,018h,0e7h,0f7h,018h,0e7h,0f7h,018h,0e7h,0f7h,018h,0e7h,0f6h,018h,0e7h,0f7h,018h,0e7h,0f4h,018h,0e7h,0f4h,018h	; 8e0f  ........................
	defb 0e7h,0f7h,018h,0e7h,0d4h,018h,0e7h,0f7h,018h,0e7h,0f7h,018h,0e7h,094h,018h,0e7h,0f7h,018h,0e7h,094h,018h,0e7h,094h,018h	; 8e27  ........................
	defb 0e7h,0f7h,018h,0e7h,014h,018h,0e7h,0f7h,018h,0e7h,0f7h,018h,0e7h,014h,018h,0e7h,0f7h,018h,0e7h,014h,018h,0e7h,014h,018h	; 8e3f  ........................
	defb 0e7h,0f7h,018h,0e7h,0f7h,018h,0e7h,0f7h,018h,0e7h,0f7h,018h,0e7h,0f6h,018h,0e7h,0f4h,018h,0e7h,0f4h,018h,0e7h,0f4h,018h	; 8e57  ........................
	defb 0e7h,0f7h,018h,0e7h,0d4h,018h,0e4h,094h,018h,0e4h,014h,018h,0e4h,014h,018h,0c4h,014h,018h,084h,014h,018h,004h,014h,018h	; 8e6f  ........................
	defb 0e7h,0f7h,018h,0e7h,094h,018h,084h,014h,018h,084h,014h,018h,084h,014h,018h,084h,014h,018h,084h,014h,018h,084h,014h,018h	; 8e87  ........................
	defb 0e7h,0f7h,018h,0e7h,014h,018h,004h,014h,018h,004h,014h,018h,004h,014h,018h,004h,014h,018h,004h,014h,018h,004h,014h,018h	; 8e9f  ........................
	defb 0e7h,0f7h,018h,0e7h,0d4h,018h,0f7h,084h,018h,010h,0e1h,0ffh,000h,010h,0ffh,0e7h,0f7h,018h,0e5h,084h,018h,083h,0a8h,000h	; 8eb7  ........................
	defb 0e7h,014h,018h,004h,014h,018h,014h,004h,018h,014h,0e5h,0fbh,000h,010h,0ffh,0e7h,0f7h,018h,004h,006h,018h,000h,01ch,000h	; 8ecf  ........................
	defb 0e7h,014h,018h,084h,014h,018h,094h,004h,018h,014h,0e5h,0fbh,000h,010h,0ffh,0e7h,0f7h,018h,084h,006h,018h,080h,01ch,000h	; 8ee7  ........................
	defb 0ffh,000h,080h,0c0h,000h,0c0h,020h,040h,0e0h,010h,020h,0f0h,008h,010h,0f8h,004h,00ah,0fch,002h,005h,0feh,001h,003h,0feh	; 8eff  ...... @.. .............
	defb 0ffh,002h,001h,083h,000h,007h,085h,002h,00fh,089h,006h,01fh,019h,0c6h,03fh,029h,096h,07fh,049h,036h,0ffh,049h,036h,0ffh	; 8f17  ..............?)..I6.I6.

; ----------------------------------------------------------------------
; DATOS dibujo_8F2F: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 3 de la lista 0x803D (p00:4D92, p00:4DF5); lo leen p00:4C26,
;   p00:4C0C (16 bytes)
;   0x8f2f..0x8f3f  (16 bytes)
DATA_dibujo_8F2F:
	defb 037h,03eh,023h,03eh,03fh,03eh,001h,000h,03fh,03eh,023h,03eh,037h,03eh,03fh,000h	; 8f2f  7>#>?>..?>#>7>?.

; ----------------------------------------------------------------------
; DATOS dibujo_8F3F: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 4 de la lista 0x803D (p00:4D92, p00:4DF5); lo leen p00:4C26,
;   p00:4C0C (16 bytes)
;   0x8f3f..0x8f4f  (16 bytes)
DATA_dibujo_8F3F:
	defb 037h,03eh,023h,03eh,03fh,03eh,001h,000h,03fh,03eh,023h,03eh,037h,03eh,03fh,000h	; 8f3f  7>#>?>..?>#>7>?.

; ----------------------------------------------------------------------
; DATOS lista_8F4F: 6 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x0000); lo leen p00:4C0C (31 bytes)
;   0x8f4f..0x8f6e  (31 bytes)
DATA_lista_8F4F:
	defb 043h,005h,050h,088h,08fh	; 8f4f
	defb 042h,00eh,053h,0b8h,08fh	; 8f54
	defb 042h,00ah,055h,0d8h,08fh	; 8f59
	defb 084h,00ah,057h,0f8h,08fh	; 8f5e
	defb 049h,005h,060h,058h,090h	; 8f63
	defb 086h,00ah,070h,0e8h,090h	; 8f68
	defb 0ffh	; 8f6d

; ----------------------------------------------------------------------
; DATOS lista_8F6E: 5 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x0000); lo leen p00:4C0C (26 bytes)
;   0x8f6e..0x8f88  (26 bytes)
DATA_lista_8F6E:
	defb 042h,008h,001h,078h,091h	; 8f6e
	defb 042h,009h,003h,098h,091h	; 8f73
	defb 084h,008h,005h,0b8h,091h	; 8f78
	defb 044h,008h,009h,018h,092h	; 8f7d
	defb 084h,008h,00dh,058h,092h	; 8f82
	defb 0ffh	; 8f87

; ----------------------------------------------------------------------
; DATOS dibujo_8F88: 3 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 0 de la lista 0x8F4F (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (48 bytes)
;   0x8f88..0x8fb8  (48 bytes)
DATA_dibujo_8F88:
	defb 030h,0dfh,030h,0dfh,030h,0dfh,0ffh,000h,006h,0fbh,006h,0fbh,006h,0fbh,0ffh,000h	; 8f88  0.0.0...........
	defb 0ffh,0ffh,000h,0bfh,080h,0ffh,0ffh,000h,0ffh,0ffh,000h,0bfh,080h,0ffh,0ffh,000h	; 8f98  ................
	defb 0feh,0ffh,001h,0fch,001h,0feh,0ffh,000h,0feh,0ffh,001h,0fch,001h,0feh,0feh,000h	; 8fa8  ................

; ----------------------------------------------------------------------
; DATOS dibujo_8FB8: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 1 de la lista 0x8F4F (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (32 bytes)
;   0x8fb8..0x8fd8  (32 bytes)
DATA_dibujo_8FB8:
	defb 040h,07fh,03fh,040h,03fh,040h,000h,000h,042h,07bh,039h,042h,039h,042h,000h,000h	; 8fb8  @.?@?@..B{9B9B..
	defb 010h,0dfh,0cfh,010h,0cfh,010h,000h,000h,002h,0fbh,0f9h,002h,0f9h,002h,000h,000h	; 8fc8  ................

; ----------------------------------------------------------------------
; DATOS dibujo_8FD8: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 2 de la lista 0x8F4F (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (32 bytes)
;   0x8fd8..0x8ff8  (32 bytes)
DATA_dibujo_8FD8:
	defb 0ffh,0ffh,080h,03fh,080h,0ffh,000h,000h,0ffh,0ffh,080h,03fh,080h,0ffh,000h,000h	; 8fd8  ...?.......?....
	defb 0feh,0ffh,002h,0fch,000h,0feh,000h,000h,0feh,0ffh,002h,0fch,000h,0feh,000h,000h	; 8fe8  ................

; ----------------------------------------------------------------------
; DATOS dibujo_8FF8: 4 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 3 de la lista 0x8F4F (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (96 bytes)
;   0x8ff8..0x9058  (96 bytes)
DATA_dibujo_8FF8:
	defb 0efh,030h,020h,06fh,0b0h,020h,02fh,0f0h,020h,01fh,01fh,01fh,0fdh,0f6h,004h,005h,0feh,004h,001h,0fah,000h,001h,001h,001h	; 8ff8  .0 o. /. ...............
	defb 0cfh,04fh,010h,0d0h,01fh,000h,0f0h,03fh,020h,0f0h,0f0h,0f0h,0f9h,001h,002h,0feh,007h,004h,0fch,007h,004h,0ffh,0ffh,0ffh	; 9010  .O.....? ...............
	defb 001h,0feh,000h,07dh,081h,001h,03fh,0c1h,001h,01fh,01fh,01fh,0f1h,0feh,000h,005h,0f9h,001h,003h,0fdh,001h,000h,000h,000h	; 9028  ...}..?.................
	defb 07fh,0ffh,000h,080h,03fh,000h,060h,09fh,000h,000h,000h,000h,007h,0ffh,000h,0bch,003h,000h,07eh,081h,000h,000h,000h,000h	; 9040  ....?.`...........~.....

; ----------------------------------------------------------------------
; DATOS dibujo_9058: 9 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 4 de la lista 0x8F4F (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (144 bytes)
;   0x9058..0x90e8  (144 bytes)
DATA_dibujo_9058:
	defb 080h,000h,0ffh,07fh,0c0h,07fh,0d2h,07fh,0c0h,06dh,0c0h,07fh,0d0h,07fh,0c0h,06fh	; 9058  .........m.....o
	defb 000h,000h,0ffh,0ffh,000h,0ffh,024h,0ffh,000h,0dbh,000h,0ffh,004h,0ffh,000h,0fbh	; 9068  ......$.........
	defb 0c0h,07fh,0d0h,07fh,0c0h,06fh,0c0h,07fh,0d2h,07fh,0c0h,06dh,0c0h,07fh,0c0h,07fh	; 9078  .....o.....m....
	defb 000h,0ffh,004h,0ffh,000h,0fbh,000h,0ffh,024h,0ffh,000h,0dbh,000h,0ffh,000h,0ffh	; 9088  ........$.......
	defb 0ffh,000h,0c0h,07fh,0c0h,060h,0d0h,072h,0c2h,068h,0c0h,07ch,0d0h,07eh,0c0h,06fh	; 9098  .....`.r.h.|.~.o
	defb 0ffh,000h,080h,07fh,080h,040h,080h,052h,092h,040h,080h,040h,080h,050h,090h,040h	; 90a8  .....@.R.@.@.P.@
	defb 0ffh,000h,000h,0ffh,000h,000h,000h,024h,024h,000h,000h,000h,000h,004h,004h,000h	; 90b8  .......$$.......
	defb 080h,040h,080h,050h,090h,040h,080h,040h,080h,052h,092h,040h,080h,040h,080h,040h	; 90c8  .@.P.@.@.R.@.@.@
	defb 0c0h,07fh,090h,07fh,080h,04fh,080h,04fh,092h,057h,090h,041h,080h,041h,080h,040h	; 90d8  .....O.O.W.A.A.@

; ----------------------------------------------------------------------
; DATOS dibujo_90E8: 6 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 5 de la lista 0x8F4F (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (144 bytes)
;   0x90e8..0x9178  (144 bytes)
DATA_dibujo_90E8:
	defb 07fh,0ffh,040h,020h,0bfh,020h,050h,09fh,010h,028h,088h,008h,037h,0a7h,024h,03ah,0a3h,022h,035h,0a1h,021h,036h,0a4h,024h	; 90e8  ..@ . P..(..7.$:."5.!6.$
	defb 0cfh,04fh,050h,030h,0bfh,020h,050h,09fh,010h,028h,088h,008h,035h,0a5h,026h,03ah,0a3h,022h,035h,0a1h,021h,036h,0a4h,024h	; 9100  .OP0. P..(..5.&:."5.!6.$
	defb 07fh,0ffh,07fh,000h,0bfh,000h,05fh,080h,000h,02bh,084h,000h,033h,0a0h,020h,03bh,0a0h,020h,035h,0a0h,020h,036h,0a4h,024h	; 9118  ......_..+..3. .. 5. 6.$
	defb 0fch,0fch,001h,002h,0fah,001h,006h,0f4h,001h,00ch,008h,001h,0d8h,0dch,001h,038h,0ach,001h,068h,04ch,001h,048h,06ch,001h	; 9130  ...............8..hL.Hl.
	defb 080h,080h,081h,082h,0fah,081h,0b6h,0c4h,081h,0ach,0c8h,081h,098h,0dch,081h,0b8h,0ach,081h,068h,04ch,001h,048h,06ch,001h	; 9148  ..................hL.Hl.
	defb 0fch,0fch,0fdh,0fah,002h,001h,0d6h,094h,091h,04ch,088h,001h,0d8h,09ch,081h,0b8h,0ach,081h,068h,04ch,001h,048h,06ch,001h	; 9160  .........L........hL.Hl.

; ----------------------------------------------------------------------
; DATOS dibujo_9178: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 0 de la lista 0x8F6E (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (32 bytes)
;   0x9178..0x9198  (32 bytes)
DATA_dibujo_9178:
	defb 09bh,0e4h,044h,07bh,022h,03dh,012h,01dh,012h,01dh,012h,01dh,012h,01dh,027h,038h	; 9178  ..D{"=........'8
	defb 099h,067h,0d2h,02eh,086h,07eh,0cch,03ch,0d8h,038h,058h,0b8h,0e8h,018h,0e4h,01ch	; 9188  .g...~.<.8X.....

; ----------------------------------------------------------------------
; DATOS dibujo_9198: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 1 de la lista 0x8F6E (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (32 bytes)
;   0x9198..0x91b8  (32 bytes)
DATA_dibujo_9198:
	defb 017h,01bh,017h,01bh,00fh,00fh,00bh,00dh,00bh,00fh,00fh,009h,007h,007h,000h,000h	; 9198  ................
	defb 03eh,036h,04ch,07ch,0dch,0ech,0fch,0ech,0bch,0bch,09ch,09ch,000h,000h,000h,000h	; 91a8  >6L|............

; ----------------------------------------------------------------------
; DATOS dibujo_91B8: 4 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 2 de la lista 0x8F6E (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (96 bytes)
;   0x91b8..0x9218  (96 bytes)
DATA_dibujo_91B8:
	defb 000h,000h,000h,000h,000h,000h,00fh,00fh,000h,017h,01bh,00ch,023h,037h,00ch,045h,07ch,003h,09ch,0ech,003h,0aeh,0dfh,001h	; 91b8  ............#7.E|.......
	defb 000h,000h,000h,000h,000h,000h,038h,038h,000h,034h,02ch,018h,0e2h,0f6h,018h,031h,0bfh,0c0h,03dh,03bh,0c0h,065h,07bh,080h	; 91d0  ......88.4,....1..=..e{.
	defb 02eh,031h,000h,02eh,031h,000h,02eh,031h,000h,02ch,033h,000h,025h,03bh,000h,025h,03bh,000h,033h,03fh,000h,01dh,01dh,002h	; 91e8  .1..1..1.,3.%..%..3?....
	defb 074h,08ch,000h,074h,08ch,000h,072h,08eh,000h,092h,0eeh,000h,0e6h,0feh,000h,07ah,07ah,004h,022h,02ah,01ch,026h,036h,018h	; 9200  t..t..r........zz."*.&6.

; ----------------------------------------------------------------------
; DATOS dibujo_9218: 4 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 3 de la lista 0x8F6E (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (64 bytes)
;   0x9218..0x9258  (64 bytes)
DATA_dibujo_9218:
	defb 000h,000h,000h,000h,000h,000h,001h,001h,003h,002h,006h,005h,006h,005h,00ch,00bh	; 9218  ................
	defb 000h,000h,000h,000h,000h,000h,0e0h,0e0h,0c8h,038h,012h,0eeh,041h,0ffh,0fch,0ffh	; 9228  .........8..A...
	defb 0fch,0e3h,061h,09fh,002h,0ffh,07dh,0feh,0fbh,0fch,0f9h,0ffh,03fh,03fh,000h,000h	; 9238  ..a...}.....??..
	defb 0deh,03eh,07eh,09eh,05ch,0bch,090h,070h,0b0h,070h,060h,0e0h,0c0h,0c0h,080h,080h	; 9248  .>~.\..p.p`.....

; ----------------------------------------------------------------------
; DATOS dibujo_9258: 4 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 4 de la lista 0x8F6E (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (96 bytes)
;   0x9258..0x92b8  (96 bytes)
DATA_dibujo_9258:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,050h,03ch,060h,0f9h,0feh,000h,0d7h,0efh,000h,070h,0ffh,000h	; 9258  ............P<`......p..
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,028h,054h,07ch,0ach,090h,07ch,0d4h,0c8h,02ch,028h,0f0h,004h	; 9270  ............(T|..|..,(..
	defb 009h,00fh,000h,076h,07fh,008h,09dh,0deh,060h,084h,0b7h,078h,0cfh,0cfh,030h,07fh,07fh,000h,03eh,03eh,000h,000h,000h,000h	; 9288  ...v....`..x..0...>>....
	defb 0deh,0e1h,000h,035h,0cbh,000h,0a1h,05fh,000h,09eh,07fh,000h,035h,0f6h,008h,0f8h,0e3h,01ch,0ffh,0ffh,000h,07fh,07fh,000h	; 92a0  ...5..._....5...........

; ----------------------------------------------------------------------
; DATOS tabla_colores_92B8: 15 punteros a colores de dibujo (los usa hasta el
;   indice 14; p00:4DA0); lo leen p00:4DA0 (30 bytes)
;   0x92b8..0x92d6  (30 bytes)
DATA_tabla_colores_92B8:
	defw 092d6h,092dah,092deh,092e2h,092e6h,092e8h,092eah,092ech	; 92b8
	defw 092f0h,092f4h,092f6h,092f8h,092fch,092feh,09300h	; 92c8

; ----------------------------------------------------------------------
; DATOS colores_92D6: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6E24 (4 bytes)
;   0x92d6..0x92da  (4 bytes)
DATA_colores_92D6:
	defb 002h,034h,078h,0bch	; 92d6

; ----------------------------------------------------------------------
; DATOS colores_92DA: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6E24 (4 bytes)
;   0x92da..0x92de  (4 bytes)
DATA_colores_92DA:
	defb 002h,037h,08ch,0deh	; 92da

; ----------------------------------------------------------------------
; DATOS colores_92DE: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6E24 (4 bytes)
;   0x92de..0x92e2  (4 bytes)
DATA_colores_92DE:
	defb 002h,034h,0bch,0deh	; 92de

; ----------------------------------------------------------------------
; DATOS colores_92E2: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6E24 (4 bytes)
;   0x92e2..0x92e6  (4 bytes)
DATA_colores_92E2:
	defb 002h,034h,07bh,0ceh	; 92e2

; ----------------------------------------------------------------------
; DATOS colores_92E6: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6E24 (2 bytes)
;   0x92e6..0x92e8  (2 bytes)
DATA_colores_92E6:
	defb 002h,03ch	; 92e6

; ----------------------------------------------------------------------
; DATOS colores_92E8: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6E24 (2 bytes)
;   0x92e8..0x92ea  (2 bytes)
DATA_colores_92E8:
	defb 024h,0bch	; 92e8

; ----------------------------------------------------------------------
; DATOS colores_92EA: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6E24 (2 bytes)
;   0x92ea..0x92ec  (2 bytes)
DATA_colores_92EA:
	defb 047h,028h	; 92ea

; ----------------------------------------------------------------------
; DATOS colores_92EC: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6E24 (4 bytes)
;   0x92ec..0x92f0  (4 bytes)
DATA_colores_92EC:
	defb 003h,047h,0bch,0deh	; 92ec

; ----------------------------------------------------------------------
; DATOS colores_92F0: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6E24 (4 bytes)
;   0x92f0..0x92f4  (4 bytes)
DATA_colores_92F0:
	defb 003h,0bch,024h,078h	; 92f0

; ----------------------------------------------------------------------
; DATOS colores_92F4: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6E24 (2 bytes)
;   0x92f4..0x92f6  (2 bytes)
DATA_colores_92F4:
	defb 023h,0bch	; 92f4

; ----------------------------------------------------------------------
; DATOS colores_92F6: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6E24 (2 bytes)
;   0x92f6..0x92f8  (2 bytes)
DATA_colores_92F6:
	defb 047h,08bh	; 92f6

; ----------------------------------------------------------------------
; DATOS colores_92F8: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6E24 (4 bytes)
;   0x92f8..0x92fc  (4 bytes)
DATA_colores_92F8:
	defb 002h,034h,0abh,0cdh	; 92f8

; ----------------------------------------------------------------------
; DATOS colores_92FC: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6E24 (2 bytes)
;   0x92fc..0x92fe  (2 bytes)
DATA_colores_92FC:
	defb 004h,08dh	; 92fc

; ----------------------------------------------------------------------
; DATOS colores_92FE: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6E24 (2 bytes)
;   0x92fe..0x9300  (2 bytes)
DATA_colores_92FE:
	defb 004h,078h	; 92fe

; ----------------------------------------------------------------------
; DATOS colores_9300: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6E24 (2 bytes)
;   0x9300..0x9302  (2 bytes)
DATA_colores_9300:
	defb 007h,08dh	; 9300

; ----------------------------------------------------------------------
; DATOS lista_9302: 2 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x92B8); lo leen p01:6E24 (11 bytes)
;   0x9302..0x930d  (11 bytes)
DATA_lista_9302:
	defb 001h,000h,0c0h,0aah,097h	; 9302
	defb 0a2h,000h,0c1h,07ah,0ach	; 9307
	defb 0ffh	; 930c

; ----------------------------------------------------------------------
; DATOS lista_930D: 4 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x92B8); lo leen p01:6E24 (21 bytes)
;   0x930d..0x9322  (21 bytes)
DATA_lista_930D:
	defb 001h,000h,080h,0aah,097h	; 930d
	defb 087h,001h,081h,062h,097h	; 9312
	defb 084h,002h,088h,00ah,098h	; 9317
	defb 09ah,000h,08ch,06ah,098h	; 931c
	defb 0ffh	; 9321

; ----------------------------------------------------------------------
; DATOS lista_9322: 3 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x92B8); lo leen p01:6E24 (16 bytes)
;   0x9322..0x9332  (16 bytes)
DATA_lista_9322:
	defb 001h,000h,0c0h,0aah,097h	; 9322
	defb 085h,003h,0c1h,0dah,09ah	; 9327
	defb 09ch,000h,0c6h,052h,09bh	; 932c
	defb 0ffh	; 9331

; ----------------------------------------------------------------------
; DATOS lista_9332: 5 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x92B8); lo leen p01:6E24 (26 bytes)
;   0x9332..0x934c  (26 bytes)
DATA_lista_9332:
	defb 001h,000h,0c0h,0aah,097h	; 9332
	defb 001h,006h,0c1h,0f2h,09dh	; 9337
	defb 001h,007h,0c2h,0fah,09dh	; 933c
	defb 041h,006h,0c3h,002h,09eh	; 9341
	defb 09dh,000h,0c4h,012h,09eh	; 9346
	defb 0ffh	; 934b

; ----------------------------------------------------------------------
; DATOS lista_934C: 5 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x92B8); lo leen p01:6E24 (26 bytes)
;   0x934c..0x9366  (26 bytes)
DATA_lista_934C:
	defb 001h,000h,0c0h,0aah,097h	; 934c
	defb 042h,00ah,0c1h,0cah,0a0h	; 9351
	defb 084h,003h,0c3h,0eah,0a0h	; 9356
	defb 082h,007h,0c7h,04ah,0a1h	; 935b
	defb 098h,000h,0c9h,07ah,0a1h	; 9360
	defb 0ffh	; 9365

; ----------------------------------------------------------------------
; DATOS lista_9366: 3 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x92B8); lo leen p01:6E24 (16 bytes)
;   0x9366..0x9376  (16 bytes)
DATA_lista_9366:
	defb 001h,000h,0c0h,0aah,097h	; 9366
	defb 042h,008h,0c1h,0bah,0a3h	; 936b
	defb 09fh,008h,0c3h,0dah,0a3h	; 9370
	defb 0ffh	; 9375

; ----------------------------------------------------------------------
; DATOS lista_9376: 5 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x92B8); lo leen p01:6E24 (26 bytes)
;   0x9376..0x9390  (26 bytes)
DATA_lista_9376:
	defb 001h,000h,0c0h,0aah,097h	; 9376
	defb 041h,004h,0c1h,0c2h,0a6h	; 937b
	defb 041h,005h,0c2h,0d2h,0a6h	; 9380
	defb 044h,009h,0c3h,0e2h,0a6h	; 9385
	defb 098h,000h,0c7h,022h,0a7h	; 938a
	defb 0ffh	; 938f

; ----------------------------------------------------------------------
; DATOS lista_9390: 2 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x92B8); lo leen p01:6E24 (11 bytes)
;   0x9390..0x939b  (11 bytes)
DATA_lista_9390:
	defb 001h,000h,0c0h,0aah,097h	; 9390
	defb 0a1h,000h,0c1h,062h,0a9h	; 9395
	defb 0ffh	; 939a

; ----------------------------------------------------------------------
; DATOS lista_939B: 2 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x92B8); lo leen p01:6E24 (11 bytes)
;   0x939b..0x93a6  (11 bytes)
DATA_lista_939B:
	defb 001h,000h,0c0h,0aah,097h	; 939b
	defb 0afh,000h,0c1h,0aah,0afh	; 93a0
	defb 0ffh	; 93a5

; ----------------------------------------------------------------------
; DATOS lista_93A6: 2 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x92B8); lo leen p01:6E24 (11 bytes)
;   0x93a6..0x93b1  (11 bytes)
DATA_lista_93A6:
	defb 001h,000h,080h,0aah,097h	; 93a6
	defb 0a6h,000h,081h,0aah,0afh	; 93ab
	defb 0ffh	; 93b0

; ----------------------------------------------------------------------
; DATOS lista_93B1: 5 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x92B8); lo leen p01:6E24 (26 bytes)
;   0x93b1..0x93cb  (26 bytes)
DATA_lista_93B1:
	defb 001h,000h,0c0h,0aah,097h	; 93b1
	defb 043h,004h,0c1h,0b2h,0b6h	; 93b6
	defb 083h,00bh,0c4h,0e2h,0b6h	; 93bb
	defb 082h,002h,0c7h,02ah,0b7h	; 93c0
	defb 099h,000h,0c9h,05ah,0b7h	; 93c5
	defb 0ffh	; 93ca

; ----------------------------------------------------------------------
; DATOS lista_93CB: 5 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x92B8); lo leen p01:6E24 (26 bytes)
;   0x93cb..0x93e5  (26 bytes)
DATA_lista_93CB:
	defb 001h,000h,0c0h,0aah,097h	; 93cb
	defb 041h,00ch,0c1h,012h,0b4h	; 93d0
	defb 041h,00dh,0c2h,022h,0b4h	; 93d5
	defb 041h,00eh,0c3h,032h,0b4h	; 93da
	defb 09ah,000h,0c4h,042h,0b4h	; 93df
	defb 0ffh	; 93e4

; ----------------------------------------------------------------------
; DATOS tabla_dibujos_93E5: 12 punteros a listas de dibujos (p01:6E1E: el
;   indice en A); detras, en 0x93FD, la tabla de mosaicos de p01:70B7; lo leen
;   p01:6E1E (24 bytes)
;   0x93e5..0x93fd  (24 bytes)
DATA_tabla_dibujos_93E5:
	defw 0930dh,09322h,09302h,09376h,0934ch,09366h,09390h,09332h	; 93e5
	defw 093b1h,0939bh,093cbh,093a6h	; 93f5  -> DATA_lista_93B1 DATA_lista_939B DATA_lista_93CB DATA_lista_93A6

; ----------------------------------------------------------------------
; DATOS tabla_mosaicos_93FD: 12 punteros a mosaicos de 6 x 4 caracteres
;   (p01:70BA: el indice en A; BC = 0x0604 en p01:70BD); lo leen p01:70BA (24
;   bytes)
;   0x93fd..0x9415  (24 bytes)
DATA_tabla_mosaicos_93FD:
	defw 09415h,09445h,094bdh,0945dh,0948dh,094a5h,0942dh,09475h	; 93fd
	defw 09505h,094d5h,0951dh,094edh	; 940d  -> DATA_mosaico_9505 DATA_mosaico_94D5 DATA_mosaico_951D DATA_mosaico_94ED

; ----------------------------------------------------------------------
; DATOS mosaico_9415: un mosaico de 6 x 4 caracteres (p00:510F por p01:70F2);
;   lo leen p01:70C0 (24 bytes)
;   0x9415..0x942d  (24 bytes)
DATA_mosaico_9415:
	defb 081h,082h,083h,084h	; 9415
	defb 088h,089h,08ah,08bh	; 9419
	defb 08ch,08dh,08eh,08fh	; 941d
	defb 090h,091h,092h,093h	; 9421
	defb 094h,095h,096h,087h	; 9425
	defb 085h,097h,098h,086h	; 9429

; ----------------------------------------------------------------------
; DATOS mosaico_942D: un mosaico de 6 x 4 caracteres (p00:510F por p01:70F2);
;   lo leen p01:70C0 (24 bytes)
;   0x942d..0x9445  (24 bytes)
DATA_mosaico_942D:
	defb 0c3h,0c4h,0c5h,0c6h	; 942d
	defb 0c7h,0c8h,0c9h,0cah	; 9431
	defb 0cbh,0cch,0cdh,0ceh	; 9435
	defb 0cfh,0d0h,0d1h,0d2h	; 9439
	defb 0d3h,0d4h,0d5h,0d6h	; 943d
	defb 0c1h,0d7h,0d8h,0c2h	; 9441

; ----------------------------------------------------------------------
; DATOS mosaico_9445: un mosaico de 6 x 4 caracteres (p00:510F por p01:70F2);
;   lo leen p01:70C0 (24 bytes)
;   0x9445..0x945d  (24 bytes)
DATA_mosaico_9445:
	defb 0c1h,0c2h,0c3h,0c4h	; 9445
	defb 0c5h,0c6h,0c7h,0c8h	; 9449
	defb 0c9h,0cah,0cbh,0cch	; 944d
	defb 0cdh,0ceh,0cfh,0d0h	; 9451
	defb 0d1h,0d2h,0d3h,0d4h	; 9455
	defb 0c0h,0d5h,0d6h,0d7h	; 9459

; ----------------------------------------------------------------------
; DATOS mosaico_945D: un mosaico de 6 x 4 caracteres (p00:510F por p01:70F2);
;   lo leen p01:70C0 (24 bytes)
;   0x945d..0x9475  (24 bytes)
DATA_mosaico_945D:
	defb 0c1h,0c2h,0c3h,0c7h	; 945d
	defb 0c8h,0c9h,0cah,0cbh	; 9461
	defb 0cch,0cdh,0ceh,0c4h	; 9465
	defb 0cfh,0d0h,0d1h,0c5h	; 9469
	defb 0d2h,0d3h,0d4h,0c6h	; 946d
	defb 000h,0d5h,0d6h,0d7h	; 9471

; ----------------------------------------------------------------------
; DATOS mosaico_9475: un mosaico de 6 x 4 caracteres (p00:510F por p01:70F2);
;   lo leen p01:70C0 (24 bytes)
;   0x9475..0x948d  (24 bytes)
DATA_mosaico_9475:
	defb 0c4h,0c5h,0c1h,0c6h	; 9475
	defb 0c7h,0c8h,0c3h,0c9h	; 9479
	defb 0cah,0cbh,0cch,0cdh	; 947d
	defb 0ceh,0cfh,0d0h,0d1h	; 9481
	defb 0c2h,0d2h,0d3h,0d4h	; 9485
	defb 0d5h,0d6h,0d7h,0d8h	; 9489

; ----------------------------------------------------------------------
; DATOS mosaico_948D: un mosaico de 6 x 4 caracteres (p00:510F por p01:70F2);
;   lo leen p01:70C0 (24 bytes)
;   0x948d..0x94a5  (24 bytes)
DATA_mosaico_948D:
	defb 0c3h,0c7h,0c4h,0c9h	; 948d
	defb 0c5h,0c8h,0c6h,0cah	; 9491
	defb 0cbh,0cch,0cdh,0ceh	; 9495
	defb 0c1h,0c2h,0cfh,0d0h	; 9499
	defb 0d1h,0d2h,0d3h,0d4h	; 949d
	defb 0d5h,0d6h,0d7h,0d8h	; 94a1

; ----------------------------------------------------------------------
; DATOS mosaico_94A5: un mosaico de 6 x 4 caracteres (p00:510F por p01:70F2);
;   lo leen p01:70C0 (24 bytes)
;   0x94a5..0x94bd  (24 bytes)
DATA_mosaico_94A5:
	defb 0c1h,0c3h,0c4h,0c5h	; 94a5
	defb 0c6h,0c7h,0c8h,0c9h	; 94a9
	defb 0cah,0cbh,0cch,0cdh	; 94ad
	defb 0ceh,0cfh,0d0h,0d1h	; 94b1
	defb 0d2h,0d3h,0d4h,0d5h	; 94b5
	defb 0c2h,0d6h,0d7h,0d8h	; 94b9

; ----------------------------------------------------------------------
; DATOS mosaico_94BD: un mosaico de 6 x 4 caracteres (p00:510F por p01:70F2);
;   lo leen p01:70C0 (24 bytes)
;   0x94bd..0x94d5  (24 bytes)
DATA_mosaico_94BD:
	defb 0c1h,0c2h,0c3h,0c4h	; 94bd
	defb 0c5h,0c6h,0c7h,0c8h	; 94c1
	defb 0c9h,0cah,0cbh,0cch	; 94c5
	defb 0cdh,0ceh,0cfh,0d0h	; 94c9
	defb 0d1h,0d2h,0d3h,0d4h	; 94cd
	defb 0d5h,0d6h,0d7h,0d8h	; 94d1

; ----------------------------------------------------------------------
; DATOS mosaico_94D5: un mosaico de 6 x 4 caracteres (p00:510F por p01:70F2);
;   lo leen p01:70C0 (24 bytes)
;   0x94d5..0x94ed  (24 bytes)
DATA_mosaico_94D5:
	defb 0c1h,0c2h,0c3h,0c4h	; 94d5
	defb 0c5h,0c6h,0c7h,0c8h	; 94d9
	defb 0c9h,0cah,0cbh,0cch	; 94dd
	defb 0cdh,0ceh,0cfh,0d0h	; 94e1
	defb 0d1h,0d2h,0d3h,0d4h	; 94e5
	defb 0d5h,0d6h,0d7h,0d8h	; 94e9

; ----------------------------------------------------------------------
; DATOS mosaico_94ED: un mosaico de 6 x 4 caracteres (p00:510F por p01:70F2);
;   lo leen p01:70C0 (24 bytes)
;   0x94ed..0x9505  (24 bytes)
DATA_mosaico_94ED:
	defb 081h,082h,083h,084h	; 94ed
	defb 085h,086h,087h,088h	; 94f1
	defb 089h,08ah,08bh,08ch	; 94f5
	defb 08dh,08eh,08fh,090h	; 94f9
	defb 091h,092h,093h,094h	; 94fd
	defb 095h,096h,097h,098h	; 9501

; ----------------------------------------------------------------------
; DATOS mosaico_9505: un mosaico de 6 x 4 caracteres (p00:510F por p01:70F2);
;   lo leen p01:70C0 (24 bytes)
;   0x9505..0x951d  (24 bytes)
DATA_mosaico_9505:
	defb 0c4h,0c5h,0c6h,0c9h	; 9505
	defb 0cah,0cbh,0cch,0cdh	; 9509
	defb 0ceh,0cfh,0d0h,0d1h	; 950d
	defb 0d2h,0d3h,0d4h,0d5h	; 9511
	defb 0d6h,0d7h,0c1h,0c2h	; 9515
	defb 0c7h,0d8h,0c3h,0c8h	; 9519

; ----------------------------------------------------------------------
; DATOS mosaico_951D: un mosaico de 6 x 4 caracteres (p00:510F por p01:70F2);
;   lo leen p01:70C0 (24 bytes)
;   0x951d..0x9535  (24 bytes)
DATA_mosaico_951D:
	defb 0c4h,0c5h,0c6h,0c7h	; 951d
	defb 0c8h,0c9h,0cah,0cbh	; 9521
	defb 0cch,0cdh,0ceh,0cfh	; 9525
	defb 0d0h,0d1h,0d2h,0d3h	; 9529
	defb 0d4h,0d5h,0d6h,0d7h	; 952d
	defb 0c1h,0d8h,0c2h,0c3h	; 9531

; ----------------------------------------------------------------------
; DATOS mosaicos_9535: 156 bytes detras de mosaico_951D que empiezan por
;   palabras de 6 en 6 (0x954D, 0x9553, 0x9559...) que apuntan dentro de ellos
;   mismos, como una tabla de mosaicos; ningun lector del listado llega a
;   ellos ni los apunta ninguna tabla declarada
;   0x9535..0x95d1  (156 bytes)
DATA_mosaicos_9535:
	defb 04dh,095h,053h,095h,059h,095h,05fh,095h,065h,095h,06bh,095h,071h,095h,077h,095h	; 9535  M.S.Y._.e.k.q.w.
	defb 07dh,095h,083h,095h,089h,095h,08fh,095h,020h,008h,002h,002h,095h,095h,020h,008h	; 9545  }....... ..... .
	defb 001h,002h,09dh,095h,020h,008h,002h,002h,0a1h,095h,020h,008h,001h,002h,0a5h,095h	; 9555  .... ..... .....
	defb 020h,010h,002h,001h,0a9h,095h,020h,008h,002h,002h,0adh,095h,020h,008h,001h,002h	; 9565   ..... ..... ...
	defb 0b1h,095h,020h,008h,002h,002h,0b5h,095h,020h,000h,001h,002h,0c1h,095h,020h,008h	; 9575  .. ..... ..... .
	defb 001h,002h,0b9h,095h,020h,008h,001h,002h,0c5h,095h,020h,008h,001h,002h,0bdh,095h	; 9585  .... ..... .....
	defb 0c9h,095h,0cdh,095h,0d1h,095h,0d5h,095h,0d9h,095h,0dbh,095h,0ddh,095h,0e1h,095h	; 9595  ................
	defb 0e5h,095h,0e7h,095h,0e9h,095h,0ebh,095h,0edh,095h,0f1h,095h,0f5h,095h,0f7h,095h	; 95a5  ................
	defb 0f9h,095h,0fdh,095h,001h,096h,003h,096h,005h,096h,007h,096h,009h,096h,00bh,096h	; 95b5  ................
	defb 00dh,096h,00fh,096h,095h,096h,097h,098h,09eh,09fh,097h,098h	; 95c5  ............

; ----------------------------------------------------------------------
; DATOS mosaico_95D1: un mosaico de 2 x 2 caracteres (p01:70D0, BC = 0x0202);
;   lo leen p01:70DE (4 bytes)
;   0x95d1..0x95d5  (4 bytes)
DATA_mosaico_95D1:
	defb 0a0h,0a1h	; 95d1
	defb 097h,0a2h	; 95d3

; ----------------------------------------------------------------------
; DATOS bytes_95D5: 397 bytes de numeros de caracter (0xA3, 0xA4, 0x97...)
;   como los de los mosaicos, entre mosaico_95D1 y dibujo_9762; ningun lector
;   del listado llega a ellos ni los apunta ninguna tabla declarada
;   0x95d5..0x9762  (397 bytes)
DATA_bytes_95D5:
	defb 0a3h,0a4h,097h,0a5h,0d2h,0d3h,0e0h,0e1h,0d2h,0d3h,0d6h,0d7h,0dfh,0e0h,0e1h,0e2h	; 95d5  ................
	defb 0d3h,0d4h,0ddh,0deh,0d3h,0d7h,0dfh,0e0h,0d3h,0d4h,0d6h,0d7h,0deh,0dfh,0e0h,0e1h	; 95e5  ................
	defb 0d4h,0d5h,0e0h,0e1h,0d2h,0d3h,0d6h,0d7h,0deh,0dfh,0e0h,0d7h,0d2h,0d3h,0e5h,0e6h	; 95f5  ................
	defb 092h,093h,0a5h,0a6h,0d6h,0d7h,0e0h,0e1h,0d5h,0d6h,0dch,0ddh,029h,096h,02fh,096h	; 9605  ............)./.
	defb 035h,096h,03bh,096h,041h,096h,047h,096h,04dh,096h,053h,096h,059h,096h,05fh,096h	; 9615  5...A.G.M.S.Y._.
	defb 065h,096h,06bh,096h,010h,000h,001h,003h,071h,096h,008h,000h,002h,003h,077h,096h	; 9625  e.k.....q.....w.
	defb 010h,000h,001h,003h,07dh,096h,010h,000h,001h,003h,083h,096h,010h,008h,001h,003h	; 9635  ....}...........
	defb 089h,096h,010h,000h,001h,003h,08fh,096h,010h,000h,001h,004h,095h,096h,010h,000h	; 9645  ................
	defb 002h,003h,09bh,096h,008h,000h,002h,003h,0b1h,096h,008h,000h,002h,003h,0a1h,096h	; 9655  ................
	defb 008h,010h,002h,001h,0b7h,096h,008h,000h,002h,003h,0abh,096h,0bdh,096h,0c0h,096h	; 9665  ................
	defb 0c3h,096h,0c6h,096h,0cch,096h,0d2h,096h,0d8h,096h,0dbh,096h,0deh,096h,0e1h,096h	; 9675  ................
	defb 0e4h,096h,0e7h,096h,0eah,096h,0edh,096h,0f0h,096h,0f3h,096h,0f6h,096h,0f9h,096h	; 9685  ................
	defb 0fch,096h,000h,097h,004h,097h,008h,097h,00eh,097h,014h,097h,01ah,097h,020h,097h	; 9695  .............. .
	defb 026h,097h,02ch,097h,032h,097h,038h,097h,03eh,097h,044h,097h,04ah,097h,050h,097h	; 96a5  &.,.2.8.>.D.J.P.
	defb 056h,097h,05ch,097h,05eh,097h,060h,097h,08ch,08dh,08eh,099h,09ah,09bh,09ch,09ah	; 96b5  V.\.^.`.........
	defb 09dh,0c5h,0c6h,0c7h,0c9h,0cah,0cbh,0c5h,0c6h,0d8h,0d9h,0dah,0dbh,0c5h,0c6h,0dch	; 96c5  ................
	defb 0ddh,0deh,0dfh,0c9h,0cah,0cbh,0d9h,0dah,0dbh,0dch,0ddh,0deh,0cch,0cdh,0ceh,0d8h	; 96d5  ................
	defb 0cdh,0d9h,0dah,0dbh,0dch,0cch,0cdh,0ceh,0d9h,0dah,0dbh,0dch,0ddh,0deh,0cah,0cbh	; 96e5  ................
	defb 0cch,0d9h,0dah,0dbh,0cah,0dch,0ddh,0cbh,0cch,0cdh,0ceh,0d9h,0dah,0dbh,0dch,0cbh	; 96f5  ................
	defb 0ddh,0deh,0dfh,0cah,0cbh,0cch,0ceh,0cfh,0d0h,0d9h,0cbh,0dah,0ceh,0cfh,0dbh,0dch	; 9705  ................
	defb 0cbh,0ddh,0ceh,0cfh,0d0h,0c5h,0c6h,0c7h,0c9h,0cah,0cbh,0d9h,0dah,0dbh,0dch,0ddh	; 9715  ................
	defb 0deh,0dfh,0e0h,0e1h,0e2h,0e3h,0e4h,0e7h,0c6h,0e9h,0e8h,0e3h,0eah,0c5h,0ebh,0ech	; 9725  ................
	defb 0edh,0eeh,0efh,085h,086h,087h,089h,08ah,08bh,099h,09ah,09bh,09ch,09dh,09eh,09fh	; 9735  ................
	defb 0a0h,0a1h,0a2h,0a3h,0a4h,0cah,0cbh,0cch,0ceh,0cfh,0d0h,0d9h,0cbh,0dah,0dbh,0dch	; 9745  ................
	defb 0ddh,0cah,0cbh,0deh,0dfh,0cfh,0d0h,0cah,0ceh,0d9h,0dah,0dbh,0ceh	; 9755  .............

; ----------------------------------------------------------------------
; DATOS dibujo_9762: 7 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 1 de la lista 0x930D (p00:4D92, p00:4DF5); se solapan 13
;   bloques: (dibujo_97AA 97AA-97B2) (dibujo_97AA 97AA-97B2) (dibujo_97AA
;   97AA-97B2) (dibujo_97AA 97AA-97B2) (dibujo_97AA 97AA-97B2) (dibujo_97AA
;   97AA-97B2) (dibujo_97AA 97AA-97B2) (dibujo_97AA 97AA-97B2) (dibujo_97AA
;   97AA-97B2) (dibujo_97AA 97AA-97B2) (dibujo_97AA 97AA-97B2) (dibujo_97AA
;   97AA-97B2); lo leen p01:6E24 (168 bytes)
;   0x9762..0x980a  (168 bytes)
DATA_dibujo_9762:
	defb 041h,006h,040h,060h,087h,060h,030h,041h,030h,000h,000h,000h,083h,007h,083h,087h,00fh,087h,00fh,09fh,00fh,01fh,03fh,01fh	; 9762  A.@`.`0A0.............?.
	defb 08ch,062h,08ch,0e0h,006h,060h,011h,0e2h,011h,000h,009h,000h,0ffh,0ffh,0ffh,0ech,0ffh,0ffh,0c8h,0ffh,0ffh,0fah,0ffh,0fdh	; 977a  .b...`..................
	defb 000h,061h,000h,020h,040h,020h,080h,040h,080h,004h,008h,004h,0fch,0feh,0fch,0d6h,0ffh,0feh,07eh,0feh,0feh,02eh,0feh,0feh	; 9792  .a. @ .@..........~.....
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,002h,000h,002h,004h,00bh,004h,002h,07ch,002h,008h,094h,008h,080h,087h,080h	; 97aa  ................|.......
	defb 008h,008h,004h,020h,022h,021h,014h,035h,034h,019h,078h,078h,0a9h,0e8h,0e8h,059h,0d8h,0d9h,058h,0d9h,0d8h,058h,0d8h,0d8h	; 97c2  ... "!.54.xx...Y..X..X..
	defb 0d1h,02dh,0d1h,021h,0ddh,021h,081h,07dh,081h,001h,0fdh,001h,001h,0fdh,001h,001h,0f9h,001h,003h,0fbh,003h,006h,0f7h,007h	; 97da  .-.!.!.}................
	defb 0fch,002h,0ech,0fch,002h,0cch,0fch,002h,0d4h,0f8h,004h,098h,0f0h,00ch,0b0h,0e0h,018h,0e0h,0e4h,018h,0e4h,0e9h,015h,029h	; 97f2  .......................)

; ----------------------------------------------------------------------
; DATOS dibujo_980A: 4 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 2 de la lista 0x930D (p00:4D92, p00:4DF5); lo leen p01:6E24
;   (96 bytes)
;   0x980a..0x986a  (96 bytes)
DATA_dibujo_980A:
	defb 01fh,05fh,01fh,03ch,03fh,03fh,037h,038h,03ch,033h,0a1h,03ch,078h,0c0h,077h,098h,040h,0b7h,0ach,044h,09bh,09ch,06bh,084h	; 980a  ._.<??78<3.<x.w.@..D..k.
	defb 000h,0ffh,0ffh,0fdh,00dh,082h,0f6h,016h,009h,0c3h,000h,03dh,09dh,080h,07ah,0d6h,018h,025h,068h,00fh,0b0h,072h,085h,06ah	; 9822  ...........=..z..%h..r.j
	defb 0a7h,07fh,07fh,06bh,017h,08bh,0f8h,007h,0c8h,0c7h,000h,03bh,080h,000h,07fh,0feh,0dch,001h,02fh,090h,02eh,005h,00ah,005h	; 983a  ...k............../.....
	defb 006h,018h,004h,080h,080h,080h,040h,0c1h,040h,001h,0c6h,001h,082h,045h,080h,060h,002h,0e0h,060h,001h,0a0h,0b0h,023h,040h	; 9852  ......@.@....E.`..`...#@

; ----------------------------------------------------------------------
; DATOS dibujo_986A: 26 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 3 de la lista 0x930D (p00:4D92, p00:4DF5); lo leen p01:6E24
;   (624 bytes)
;   0x986a..0x9ada  (624 bytes)
DATA_dibujo_986A:
	defb 0b0h,0e8h,0a0h,0a0h,0d4h,080h,048h,068h,048h,052h,074h,052h,000h,07ah,004h,017h,07bh,013h,084h,0ffh,084h,0a3h,0ffh,0a3h	; 986a  ......HhHRtR.z..{.......
	defb 018h,07eh,018h,008h,035h,000h,004h,058h,008h,01ch,01ch,014h,007h,0bfh,01dh,03fh,0ebh,022h,076h,0e5h,02dh,0fbh,0ach,024h	; 9882  .~..5..X.......?."v.-..$
	defb 000h,083h,000h,020h,021h,020h,010h,045h,030h,031h,06fh,02bh,007h,039h,000h,0afh,073h,010h,04eh,0cfh,0b1h,054h,0dfh,0abh	; 989a  ... ! .E01o+.9..s.N..T..
	defb 0d0h,0b1h,0a0h,060h,0f8h,078h,058h,0e0h,060h,090h,0e9h,0e8h,0d9h,0e1h,021h,099h,0e1h,061h,010h,0eah,0e8h,0fch,006h,004h	; 98b2  ...`.xX.`.....!..a......
	defb 01ch,0e7h,003h,038h,0cfh,007h,0b8h,0e7h,0a7h,09ch,073h,013h,08ch,0fbh,08bh,046h,07dh,045h,002h,0bdh,001h,023h,0beh,0a2h	; 98ca  ...8......s....F}E...#..
	defb 057h,0a1h,089h,0b2h,065h,02dh,0dah,06dh,045h,0dch,07bh,058h,044h,08ch,084h,081h,066h,000h,0c2h,043h,043h,0c3h,0e6h,0c2h	; 98e2  W...e-.mE.{XD...f..CC...
	defb 0f9h,03eh,006h,069h,0deh,056h,0b5h,06eh,02ah,0dbh,0e4h,084h,069h,0f6h,006h,03dh,0fah,0cah,084h,07bh,07bh,0e3h,01eh,01eh	; 98fa  .>.i.V.n*...i..=...{{...
	defb 0fch,036h,034h,0fch,076h,074h,0f4h,07bh,078h,0fdh,0fbh,0f9h,0fdh,0fbh,0f9h,0fch,0ffh,0fch,0fch,0ffh,0fch,0fch,0feh,0fch	; 9912  .64.vt.{x...............
	defb 0a3h,0feh,0a2h,0d1h,07eh,050h,061h,03eh,020h,029h,01fh,009h,098h,01fh,098h,048h,00fh,048h,020h,00fh,020h,011h,002h,011h	; 992a  ....~Pa> ).....H.H . ...
	defb 0e7h,0fdh,0e1h,0f0h,0ffh,0f0h,0c0h,060h,040h,087h,04fh,007h,08fh,035h,000h,098h,07ch,018h,080h,0f0h,080h,020h,01ch,020h	; 9942  .......`@.O..5..|.... .
	defb 0b9h,0c6h,0c6h,01dh,0e2h,002h,00dh,04ah,00ah,07fh,0b9h,0b9h,06fh,09dh,09dh,06fh,0f5h,075h,01fh,037h,017h,03fh,077h,037h	; 995a  .......J....o..o.u.7.?w7
	defb 053h,00ch,0cch,029h,017h,026h,01eh,0f9h,019h,04fh,0fch,04ch,027h,0ffh,027h,080h,0ffh,080h,093h,0ffh,093h,008h,0ffh,008h	; 9972  S..).&...O.L'.'.........
	defb 02fh,0fbh,0dbh,0afh,0b7h,057h,0deh,0e7h,026h,0f1h,03fh,031h,0c4h,0ffh,0c4h,018h,0ffh,018h,0e0h,0ffh,0e0h,000h,0ffh,000h	; 998a  /....W..&.?1............
	defb 0b0h,0e8h,0a0h,0a0h,0d4h,080h,048h,068h,048h,053h,072h,052h,000h,077h,000h,010h,078h,010h,084h,0ffh,084h,0a3h,0ffh,0a3h	; 99a2  ......HhHSrR.w..x.......
	defb 018h,07eh,018h,008h,035h,000h,004h,058h,008h,01ch,09ch,014h,007h,03fh,01dh,03fh,0ebh,022h,076h,0e5h,02dh,0fbh,0ach,024h	; 99ba  .~..5..X.....?.?."v.-..$
	defb 000h,083h,000h,018h,03dh,018h,030h,02dh,020h,001h,003h,003h,007h,019h,000h,0afh,073h,010h,04eh,0cfh,0b1h,054h,0dfh,0abh	; 99d2  ....=.0- .......s.N..T..
	defb 0b0h,0e8h,0a0h,0a0h,0d4h,080h,048h,068h,048h,051h,071h,050h,001h,07bh,001h,017h,07bh,013h,084h,0ffh,084h,0a3h,0ffh,0a3h	; 99ea  ......HhHQqP.{..{.......
	defb 000h,083h,000h,010h,009h,010h,000h,055h,008h,031h,06fh,02bh,007h,039h,000h,0afh,073h,010h,04eh,0cfh,0b1h,054h,0dfh,0abh	; 9a02  .......U.1o+.9..s.N..T..
	defb 0e7h,0fdh,0e1h,0f0h,0ffh,0f0h,0c4h,060h,047h,080h,050h,000h,08fh,037h,007h,08fh,077h,002h,080h,0ech,080h,020h,010h,020h	; 9a1a  .......`G.P..7..w.... .
	defb 0b9h,0c6h,0c6h,01dh,0e2h,002h,08dh,00ah,08ah,03fh,079h,039h,0efh,09dh,09dh,06fh,095h,095h,01fh,0f7h,017h,03fh,037h,037h	; 9a32  .........?y9...o.....?77
	defb 0e7h,0fdh,0e1h,0f0h,0ffh,0f0h,0c1h,061h,041h,087h,04fh,007h,08fh,035h,000h,098h,07ch,018h,080h,0f0h,080h,020h,01ch,020h	; 9a4a  .......aA.O..5..|.... .
	defb 0b9h,0c6h,0c6h,01dh,0e2h,002h,08dh,08ah,0cah,09fh,019h,0f9h,04fh,08dh,0fdh,067h,0c5h,07dh,013h,023h,01fh,039h,071h,03fh	; 9a62  ............O..g.}.#.9q?
	defb 02dh,0f8h,09fh,08eh,0f4h,016h,09eh,0e7h,046h,0d1h,03fh,011h,0c4h,0ffh,0c4h,018h,0ffh,018h,0e0h,0ffh,0e0h,000h,0ffh,000h	; 9a7a  -.......F.?.............
	defb 0e7h,0fdh,0e1h,0f0h,0ffh,0f0h,0c0h,061h,040h,080h,04fh,000h,08dh,037h,002h,09fh,07fh,01fh,080h,0f4h,080h,020h,018h,020h	; 9a92  .......a@.O..7....... .
	defb 0b9h,0c6h,0c6h,01dh,0e2h,002h,00dh,0cah,00ah,0bfh,039h,0f9h,08fh,01dh,0fdh,04fh,095h,075h,00fh,087h,037h,027h,047h,03fh	; 9aaa  ..........9....O.u..7'G?
	defb 027h,0e3h,0bbh,093h,0e3h,01fh,098h,0f1h,01eh,0c5h,039h,005h,0c4h,0ffh,0c4h,018h,0ffh,018h,0e0h,0ffh,0e0h,000h,0ffh,000h	; 9ac2  '.........9.............

; ----------------------------------------------------------------------
; DATOS dibujo_9ADA: 5 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 1 de la lista 0x9322 (p00:4D92, p00:4DF5); lo leen p01:6E24
;   (120 bytes)
;   0x9ada..0x9b52  (120 bytes)
DATA_dibujo_9ADA:
	defb 000h,000h,000h,001h,001h,001h,001h,001h,001h,003h,003h,003h,003h,003h,003h,007h,007h,007h,004h,004h,004h,01bh,018h,019h	; 9ada  ........................
	defb 0f9h,0f9h,0f6h,0fdh,0fdh,0fah,0ffh,0ffh,0ffh,0e0h,0efh,0e7h,0dfh,0ech,0c3h,03fh,04bh,074h,0ffh,020h,052h,0ffh,009h,0b6h	; 9af2  ...............?Kt. R...
	defb 0ffh,0bfh,03fh,0ffh,07fh,07fh,0ffh,0ffh,0ffh,0fch,003h,003h,0ffh,004h,0fah,0ffh,0f4h,008h,0ffh,004h,078h,0ffh,0f4h,008h	; 9b0a  ..?.................x...
	defb 0fch,0fch,0fch,0feh,0feh,0feh,0ffh,0ffh,0ffh,07fh,0ffh,0ffh,083h,077h,043h,0c0h,031h,040h,0c4h,03bh,063h,0c2h,03dh,061h	; 9b22  .............wC.1@..c.=a
	defb 02fh,024h,023h,05fh,048h,047h,07fh,056h,049h,0bfh,0afh,090h,07bh,024h,044h,060h,094h,054h,040h,0eah,028h,0cfh,034h,0e2h	; 9b3a  /$#_HG.VI...{$D`.T@.(.4.

; ----------------------------------------------------------------------
; DATOS dibujo_9B52: 28 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 2 de la lista 0x9322 (p00:4D92, p00:4DF5); lo leen p01:6E24
;   (672 bytes)
;   0x9b52..0x9df2  (672 bytes)
DATA_dibujo_9B52:
	defb 03ch,0efh,0c3h,0fbh,03fh,014h,079h,097h,086h,03bh,0d4h,0d4h,08eh,07bh,05ah,02ch,07ch,03ch,03ch,012h,000h,099h,0eeh,084h	; 9b52  <...?.y......{Z,|<<.....
	defb 07dh,0feh,082h,0f2h,0f3h,00dh,082h,0fbh,07dh,0a2h,07fh,025h,003h,00fh,002h,001h,023h,001h,0f2h,08fh,08eh,043h,0d1h,041h	; 9b6a  }.......}..%....#....C.A
	defb 0a1h,077h,060h,080h,071h,060h,080h,070h,060h,010h,0e8h,0e0h,000h,0fch,0f8h,080h,0fdh,078h,07bh,087h,083h,0bah,057h,052h	; 9b82  .w`.q`.p`........x{...WR
	defb 0b0h,0ddh,058h,092h,0e8h,062h,041h,0f6h,026h,063h,0cdh,00dh,05fh,0ebh,02bh,046h,07fh,039h,008h,077h,037h,027h,07bh,018h	; 9b9a  ..X..bA.&c.._.+F.9.w7'{.
	defb 05eh,07eh,042h,02eh,0ddh,010h,0cah,07dh,074h,0abh,0feh,0f6h,02bh,0deh,0d6h,007h,0fah,0fah,04bh,0fdh,0b5h,0b9h,0deh,046h	; 9bb2  ^~B....}t...+.....K....F
	defb 094h,0ddh,0b5h,064h,0bbh,0b8h,0bfh,047h,044h,0ceh,07fh,071h,0fdh,03fh,03ah,07fh,083h,080h,09eh,067h,061h,080h,07fh,07fh	; 9bca  ...d...GD..q.?:....ga...
	defb 0f9h,016h,010h,071h,0bfh,0b8h,0b0h,0fbh,0fbh,0bah,0fdh,07dh,02fh,058h,0c8h,05fh,0b8h,098h,05fh,0f0h,0d0h,0dfh,060h,040h	; 9be2  ...q.......}/X._.._...`@
	defb 037h,05fh,008h,07ah,017h,015h,03bh,00eh,00ch,03dh,02ah,02ah,0bch,023h,0a2h,096h,02bh,08ah,096h,02bh,08ah,053h,01fh,05fh	; 9bfa  7_.z.....=**.#..+..+.S._
	defb 042h,0adh,0bdh,0efh,051h,050h,0bdh,0efh,0edh,050h,0dch,050h,082h,07dh,050h,0f3h,003h,003h,04fh,0b8h,0b0h,048h,0bfh,0b7h	; 9c12  B...QP...P.P.}P...O..H..
	defb 0c1h,0beh,0beh,0e3h,05dh,05dh,033h,0cdh,08dh,0dbh,065h,045h,06bh,0b4h,024h,0fdh,052h,052h,0e5h,09ah,092h,02fh,0f2h,0f0h	; 9c2a  ....]]3...eEk.$.RR.../..
	defb 0efh,0f1h,0f1h,0cfh,0f1h,0f1h,09fh,0e3h,0e3h,09fh,063h,063h,09fh,0e3h,0e3h,0bfh,0c7h,0c7h,0feh,087h,086h,0beh,04fh,04eh	; 9c42  ..........cc..........ON
	defb 059h,017h,057h,048h,017h,047h,04dh,00ah,04ah,027h,00ch,024h,023h,006h,022h,011h,003h,011h,002h,000h,003h,000h,001h,000h	; 9c5a  Y.WH.GM.J'.$#.".........
	defb 031h,0ffh,0d5h,0eeh,06fh,02eh,098h,06fh,007h,09fh,0e6h,0e6h,09fh,078h,078h,0efh,090h,090h,0b3h,02ch,0ach,030h,02fh,02fh	; 9c72  1...o..o.....xx....,.0//
	defb 0f6h,0efh,0edh,068h,057h,043h,01dh,0f2h,0e2h,0edh,01ah,01ah,0cdh,036h,036h,097h,078h,068h,03bh,0f4h,0c4h,027h,0f9h,0d9h	; 9c8a  ...hWC.......66.xh...'..
	defb 07ch,09fh,09ch,0f8h,03fh,038h,0b1h,07fh,031h,073h,0deh,052h,0e3h,0deh,0c2h,0e7h,074h,064h,0c7h,0edh,0c5h,00ch,0cah,008h	; 9ca2  |...?8..1s.R....td......
	defb 0e1h,09eh,09eh,06fh,073h,053h,03eh,02fh,02eh,000h,03fh,000h,000h,000h,000h,000h,000h,000h,000h,010h,000h,020h,00eh,020h	; 9cba  ...osS>/..?.......... .
	defb 0deh,033h,022h,0fch,0aeh,08ch,068h,0fch,068h,000h,0f8h,000h,000h,000h,000h,000h,001h,000h,000h,003h,000h,000h,01fh,000h	; 9cd2  .3"...h.h...............
	defb 019h,00ch,009h,012h,038h,013h,014h,078h,017h,020h,050h,007h,070h,0a0h,03fh,041h,0e0h,05fh,0a2h,040h,03eh,004h,080h,07ch	; 9cea  ....8..x. P.p.?A._.@>..|
	defb 07dh,0feh,082h,0f2h,0f3h,00dh,082h,0fbh,07dh,0a2h,07fh,025h,003h,00fh,002h,001h,023h,001h,0f2h,08fh,08eh,05bh,0fdh,059h	; 9d02  }.......}..%....#....[.Y
	defb 0b3h,0dfh,05bh,097h,0ech,064h,040h,0f3h,020h,063h,0cdh,00dh,05fh,0ebh,02bh,046h,07fh,039h,008h,077h,037h,027h,07bh,018h	; 9d1a  ..[..d@. c.._.+F.9.w7'{.
	defb 05eh,0feh,042h,0aeh,0ddh,090h,04ah,07dh,074h,0abh,0feh,0f6h,02bh,0deh,0d6h,007h,0fah,0fah,04bh,0fdh,0b5h,0b9h,0deh,046h	; 9d32  ^.B...J}t...+.....K....F
	defb 0bch,0e5h,0a5h,040h,09bh,080h,0bfh,047h,044h,0ceh,07fh,071h,0fdh,03fh,03ah,07fh,083h,080h,09eh,067h,061h,080h,07fh,07fh	; 9d4a  ...@...GD..q.?:....ga...
	defb 07dh,0feh,082h,0f2h,0f3h,00dh,082h,0fbh,07dh,0a2h,07fh,025h,003h,00fh,002h,001h,023h,001h,0f2h,08fh,08eh,003h,0e1h,001h	; 9d62  }.......}..%....#.......
	defb 0b0h,0deh,058h,092h,0ebh,062h,041h,0f6h,026h,063h,0cdh,00dh,05fh,0ebh,02bh,046h,07fh,039h,008h,077h,037h,027h,07bh,018h	; 9d7a  ..X..bA.&c.._.+F.9.w7'{.
	defb 05eh,07eh,042h,02eh,05dh,090h,0cah,07dh,074h,0abh,0feh,0f6h,02bh,0deh,0d6h,007h,0fah,0fah,04bh,0fdh,0b5h,0b9h,0deh,046h	; 9d92  ^~B.]..}t...+.....K....F
	defb 094h,0b5h,09dh,064h,0bbh,0b8h,0bfh,047h,044h,0ceh,07fh,071h,0fdh,03fh,03ah,07fh,083h,080h,09eh,067h,061h,080h,07fh,07fh	; 9daa  ...d...GD..q.?:....ga...
	defb 031h,0ffh,0d5h,0e0h,064h,020h,080h,079h,000h,098h,0efh,0e7h,09fh,077h,077h,0efh,090h,090h,0b7h,028h,0a8h,030h,02fh,02fh	; 9dc2  1...d .y.....ww....(.0//
	defb 0f6h,0efh,0edh,028h,057h,003h,0ddh,0b2h,0a2h,02dh,0dah,0dah,0cdh,036h,036h,097h,078h,068h,03bh,0f4h,0c4h,027h,0f9h,0d9h	; 9dda  ...(W....-...66.xh...'..

; ----------------------------------------------------------------------
; DATOS dibujo_9DF2: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 1 de la lista 0x9332 (p00:4D92, p00:4DF5); lo leen p01:6E24 (8
;   bytes)
;   0x9df2..0x9dfa  (8 bytes)
DATA_dibujo_9DF2:
	defb 0f8h,0fch,0feh,0feh,0ffh,0ffh,0ffh,0ffh	; 9df2  ........

; ----------------------------------------------------------------------
; DATOS dibujo_9DFA: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 2 de la lista 0x9332 (p00:4D92, p00:4DF5); lo leen p01:6E24 (8
;   bytes)
;   0x9dfa..0x9e02  (8 bytes)
DATA_dibujo_9DFA:
	defb 000h,000h,008h,008h,004h,000h,002h,001h	; 9dfa  ........

; ----------------------------------------------------------------------
; DATOS dibujo_9E02: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 3 de la lista 0x9332 (p00:4D92, p00:4DF5); lo leen p01:6E24
;   (16 bytes)
;   0x9e02..0x9e12  (16 bytes)
DATA_dibujo_9E02:
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0feh,000h,0feh,000h,0f8h,000h,0e0h,000h,000h,00ch	; 9e02  ................

; ----------------------------------------------------------------------
; DATOS dibujo_9E12: 29 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 4 de la lista 0x9332 (p00:4D92, p00:4DF5) (sigue en el banco
;   45, en 0xA000); lo leen p01:6E24 (494 bytes)
;   0x9e12..0xa000  (494 bytes)
DATA_dibujo_9E12:
	defb 001h,009h,001h,000h,060h,000h,000h,0c1h,000h,001h,083h,001h,003h,007h,003h,002h,007h,003h,000h,00fh,001h,007h,00dh,004h	; 9e12  ....`...................
	defb 030h,0f0h,02fh,024h,0c4h,01bh,0c0h,0a2h,0bfh,0aah,06eh,055h,07eh,0feh,081h,0f7h,0ffh,008h,06eh,0feh,091h,0dah,0eeh,025h	; 9e2a  0./$......nU~.....n....%
	defb 0f0h,0dfh,010h,0f0h,0efh,000h,0f8h,0efh,008h,0fch,0e7h,004h,0e8h,0f7h,010h,0d8h,0e7h,020h,0c8h,0f7h,030h,0c8h,0ffh,038h	; 9e42  ................. ..0..8
	defb 005h,00fh,006h,006h,01fh,007h,001h,01dh,002h,007h,015h,004h,007h,005h,004h,002h,005h,001h,008h,01eh,009h,01fh,038h,018h	; 9e5a  ......................8.
	defb 0b4h,0ech,04bh,0b2h,0eah,04dh,082h,0fah,07dh,044h,0beh,0bbh,0ech,0d2h,013h,0aah,0d6h,055h,0bah,0c6h,045h,07bh,0efh,0ach	; 9e72  ..K..M..}D.......U..E{..
	defb 080h,0ffh,070h,092h,0f9h,070h,081h,0eeh,060h,0a2h,0dfh,042h,0a2h,0cfh,042h,021h,0c7h,0c1h,003h,0e4h,0e0h,080h,0f2h,070h	; 9e8a  ..p..p..`..B..B!.......p
	defb 005h,01fh,005h,000h,004h,000h,010h,000h,03eh,01ch,01ch,05dh,000h,010h,000h,082h,024h,082h,088h,00ah,089h,086h,00ch,084h	; 9ea2  ........>..]....$.......
	defb 0abh,03fh,07ch,058h,0ffh,04fh,04ah,076h,066h,004h,05dh,034h,0a8h,022h,090h,048h,00ah,058h,064h,024h,050h,016h,01bh,026h	; 9eba  .?|X.OJvf.]4.".H.Xd$P..&
	defb 007h,0f8h,0f8h,0afh,029h,028h,053h,058h,04ch,009h,03ch,00eh,002h,001h,002h,011h,057h,010h,044h,075h,04ch,01ah,070h,038h	; 9ed2  ....)(SXL.<.....W.DuL.p8
	defb 0d0h,0e0h,020h,0cch,0f4h,034h,018h,0f0h,0e0h,0f0h,0b0h,080h,064h,0ceh,04ah,018h,01eh,006h,02ah,0beh,076h,08ah,0f7h,0f7h	; 9eea  .. ..4......d.J...*.v...
	defb 000h,006h,000h,046h,00ch,044h,020h,007h,020h,01eh,002h,01eh,000h,028h,000h,004h,02ch,004h,000h,00fh,000h,001h,015h,001h	; 9f02  ...F.D . ....(..,.......
	defb 014h,01ah,02ch,016h,095h,02eh,013h,056h,02fh,059h,05bh,067h,00eh,0cfh,071h,08bh,0cbh,0f5h,042h,003h,0bdh,012h,09fh,0edh	; 9f1a  ..,....V/Y[g..q...B.....
	defb 06ch,05eh,052h,038h,064h,026h,019h,0b9h,094h,0e7h,063h,084h,0fch,07ch,073h,0fbh,0efh,00ch,02fh,0f4h,054h,093h,0ffh,0afh	; 9f32  l^R8d&....c..|s.../.T...
	defb 016h,0edh,0edh,0deh,0e5h,025h,0deh,0e9h,029h,01bh,07dh,0fdh,0bbh,0d5h,055h,073h,0adh,0adh,0f6h,06bh,06bh,0f6h,0ebh,0ebh	; 9f4a  .....%..).}...Us...kk...
	defb 0f2h,0e2h,083h,049h,03bh,02eh,017h,00bh,002h,000h,07fh,000h,022h,0fdh,030h,000h,0a8h,000h,029h,01bh,016h,05ah,05fh,05bh	; 9f62  ...I........".0...)..Z_[
	defb 0fdh,0deh,042h,0cch,0ffh,013h,0a6h,0ffh,0c9h,01ah,0f7h,035h,038h,07fh,02fh,01eh,0adh,005h,05fh,0d8h,0b0h,0dbh,0ech,02ch	; 9f7a  ..B........58./..._....,
	defb 0feh,0c7h,0c7h,0fch,00eh,00eh,07ch,08eh,08eh,03ch,0ceh,0ceh,078h,09ch,09ch,0f8h,01ch,018h,0b8h,058h,058h,073h,0bbh,0b0h	; 9f92  ......|..<..x......XXs..
	defb 000h,001h,000h,00eh,006h,00eh,014h,007h,01ch,028h,00eh,038h,058h,01eh,078h,030h,01ch,070h,071h,03ch,071h,061h,038h,061h	; 9faa  .........(.8X.x0.pq<qa8a
	defb 001h,030h,000h,006h,00fh,007h,00dh,00bh,00ah,00dh,015h,006h,00dh,097h,006h,002h,08fh,003h,005h,047h,005h,00ch,03fh,08ch	; 9fc2  .0.................G..?.
	defb 0bah,0d5h,055h,06fh,090h,090h,09fh,0efh,06fh,0beh,0cfh,04eh,07ch,09fh,09ch,0f8h,00eh,008h,0f0h,09dh,090h,001h,0ffh,001h	; 9fda  ..Uo....o..N|...........
	defb 0e7h,074h,067h,0c3h,0f6h,0c3h,081h,0c3h,081h,000h,0b1h,000h,039h,079h	; 9ff2  .tg.........9y
