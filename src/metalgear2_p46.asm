; ==========================================================================
; METAL GEAR 2 SOLID SNAKE - Konami (1990) - MSX2 - MegaROM RC-767 de 512 KB (Konami SCC) - banco 46 (se ejecuta en 0x8000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x08000


; ----------------------------------------------------------------------
; DATOS tabla_colores_8000: 13 punteros a colores de dibujo (los usa hasta el
;   indice 12; p00:4DA0); lo leen p00:4DA0 (26 bytes)
;   0x8000..0x801a  (26 bytes)
DATA_tabla_colores_8000:
	defw 0801ah,0801bh,0801ch,0801dh,0801fh,08021h,08023h,08025h	; 8000
	defw 08027h,0802bh,0802dh,08031h,08033h	; 8010

; ----------------------------------------------------------------------
; DATOS colores_801A: 2 colores de 4 bits, dos por byte, para un dibujo de 1
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6E08 (1 bytes)
;   0x801a..0x801b  (1 bytes)
DATA_colores_801A:
	defb 00ch	; 801a

; ----------------------------------------------------------------------
; DATOS colores_801B: 2 colores de 4 bits, dos por byte, para un dibujo de 1
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6E08 (1 bytes)
;   0x801b..0x801c  (1 bytes)
DATA_colores_801B:
	defb 09dh	; 801b

; ----------------------------------------------------------------------
; DATOS colores_801C: 2 colores de 4 bits, dos por byte, para un dibujo de 1
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6E08 (1 bytes)
;   0x801c..0x801d  (1 bytes)
DATA_colores_801C:
	defb 00ah	; 801c

; ----------------------------------------------------------------------
; DATOS colores_801D: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6E08 (2 bytes)
;   0x801d..0x801f  (2 bytes)
DATA_colores_801D:
	defb 007h,0cah	; 801d

; ----------------------------------------------------------------------
; DATOS colores_801F: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6E08 (2 bytes)
;   0x801f..0x8021  (2 bytes)
DATA_colores_801F:
	defb 009h,0adh	; 801f

; ----------------------------------------------------------------------
; DATOS colores_8021: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6E08 (2 bytes)
;   0x8021..0x8023  (2 bytes)
DATA_colores_8021:
	defb 079h,0ach	; 8021

; ----------------------------------------------------------------------
; DATOS colores_8023: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6E08 (2 bytes)
;   0x8023..0x8025  (2 bytes)
DATA_colores_8023:
	defb 079h,0cdh	; 8023

; ----------------------------------------------------------------------
; DATOS colores_8025: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6E08 (2 bytes)
;   0x8025..0x8027  (2 bytes)
DATA_colores_8025:
	defb 089h,0afh	; 8025

; ----------------------------------------------------------------------
; DATOS colores_8027: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6E08 (4 bytes)
;   0x8027..0x802b  (4 bytes)
DATA_colores_8027:
	defb 007h,08fh,0abh,0cdh	; 8027

; ----------------------------------------------------------------------
; DATOS colores_802B: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6E08 (2 bytes)
;   0x802b..0x802d  (2 bytes)
DATA_colores_802B:
	defb 0a7h,08fh	; 802b

; ----------------------------------------------------------------------
; DATOS colores_802D: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6E08 (4 bytes)
;   0x802d..0x8031  (4 bytes)
DATA_colores_802D:
	defb 01fh,045h,067h,089h	; 802d

; ----------------------------------------------------------------------
; DATOS colores_8031: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6E08 (2 bytes)
;   0x8031..0x8033  (2 bytes)
DATA_colores_8031:
	defb 01fh,046h	; 8031

; ----------------------------------------------------------------------
; DATOS colores_8033: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6E08 (4 bytes)
;   0x8033..0x8037  (4 bytes)
DATA_colores_8033:
	defb 001h,045h,067h,0afh	; 8033

; ----------------------------------------------------------------------
; DATOS lista_8037: 17 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x8000); lo leen p01:6E08 (86 bytes)
;   0x8037..0x808d  (86 bytes)
DATA_lista_8037:
	defb 005h,000h,081h,08dh,080h	; 8037
	defb 005h,001h,086h,0b5h,080h	; 803c
	defb 012h,002h,08bh,0ddh,080h	; 8041
	defb 018h,003h,09fh,06dh,081h	; 8046
	defb 046h,004h,0b7h,02dh,082h	; 804b
	defb 041h,005h,0bdh,08dh,082h	; 8050
	defb 041h,006h,0beh,09dh,082h	; 8055
	defb 041h,003h,0bfh,0adh,082h	; 805a
	defb 058h,007h,0c0h,0bdh,082h	; 805f
	defb 04ah,008h,0f0h,03dh,084h	; 8064
	defb 042h,009h,0fah,0ddh,084h	; 8069
	defb 082h,008h,0fch,0fdh,084h	; 806e
	defb 001h,00ah,0e0h,02dh,085h	; 8073
	defb 042h,00ah,0e1h,035h,085h	; 8078
	defb 041h,00bh,0e3h,055h,085h	; 807d
	defb 083h,00ah,0e4h,065h,085h	; 8082
	defb 086h,00ch,0e7h,0adh,085h	; 8087
	defb 0ffh	; 808c

; ----------------------------------------------------------------------
; DATOS dibujo_808D: 5 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 0 de la lista 0x8037 (p00:4D92, p00:4DF5); lo leen p01:6E08 (40
;   bytes)
;   0x808d..0x80b5  (40 bytes)
DATA_dibujo_808D:
	defb 000h,00fh,00fh,00fh,00eh,00ch,009h,003h	; 808d  ........
	defb 000h,0cfh,09fh,03fh,07eh,0fch,0f9h,0f3h	; 8095  ...?~...
	defb 000h,0c0h,090h,030h,070h,0f0h,0f0h,0f0h	; 809d  ...0p...
	defb 017h,017h,017h,017h,017h,017h,017h,000h	; 80a5  ........
	defb 077h,077h,077h,077h,077h,077h,077h,000h	; 80ad  wwwwwww.

; ----------------------------------------------------------------------
; DATOS dibujo_80B5: 5 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 1 de la lista 0x8037 (p00:4D92, p00:4DF5); lo leen p01:6E08 (40
;   bytes)
;   0x80b5..0x80dd  (40 bytes)
DATA_dibujo_80B5:
	defb 080h,080h,080h,080h,080h,080h,080h,080h	; 80b5  ........
	defb 0ffh,000h,000h,000h,000h,000h,000h,000h	; 80bd  ........
	defb 0ffh,001h,001h,001h,001h,001h,001h,001h	; 80c5  ........
	defb 001h,001h,001h,001h,001h,001h,001h,001h	; 80cd  ........
	defb 000h,000h,000h,000h,000h,000h,000h,000h	; 80d5  ........

; ----------------------------------------------------------------------
; DATOS dibujo_80DD: 18 caracteres de 8x8 a 1 bit por punto (8 bytes cada
;   uno), ficha 2 de la lista 0x8037 (p00:4D92, p00:4DF5); lo leen p01:6E08
;   (144 bytes)
;   0x80dd..0x816d  (144 bytes)
DATA_dibujo_80DD:
	defb 000h,000h,02ah,02ah,02ah,02ah,02ah,000h	; 80dd  ..*****.
	defb 000h,000h,0ffh,080h,080h,081h,081h,081h	; 80e5  ........
	defb 081h,081h,080h,080h,0ffh,000h,000h,000h	; 80ed  ........
	defb 000h,000h,0ffh,000h,0f1h,002h,002h,032h	; 80f5  .......2
	defb 013h,012h,0f2h,000h,0ffh,000h,000h,000h	; 80fd  ........
	defb 000h,000h,0ffh,000h,0c3h,024h,024h,023h	; 8105  .....$$#
	defb 0e0h,020h,027h,000h,0ffh,000h,000h,000h	; 810d  . '.....
	defb 000h,000h,0ffh,001h,0c1h,001h,001h,081h	; 8115  ........
	defb 041h,041h,081h,001h,0ffh,000h,000h,000h	; 811d  AA......
	defb 000h,000h,0ffh,080h,08fh,090h,090h,090h	; 8125  ........
	defb 090h,08fh,080h,0ffh,000h,000h,000h,000h	; 812d  ........
	defb 000h,000h,0ffh,000h,01ch,022h,022h,022h	; 8135  ....."""
	defb 03eh,022h,000h,0ffh,000h,000h,000h,000h	; 813d  >"......
	defb 000h,000h,0ffh,000h,040h,040h,040h,040h	; 8145  ....@@@@
	defb 040h,03ch,000h,0ffh,000h,000h,000h,000h	; 814d  @<......
	defb 000h,000h,0ffh,001h,081h,081h,081h,081h	; 8155  ........
	defb 081h,079h,001h,0ffh,000h,000h,000h,000h	; 815d  .y......
	defb 000h,000h,0ffh,081h,081h,081h,0ffh,000h	; 8165  ........

; ----------------------------------------------------------------------
; DATOS dibujo_816D: 24 caracteres de 8x8 a 1 bit por punto (8 bytes cada
;   uno), ficha 3 de la lista 0x8037 (p00:4D92, p00:4DF5); lo leen p01:6E08
;   (192 bytes)
;   0x816d..0x822d  (192 bytes)
DATA_dibujo_816D:
	defb 000h,000h,000h,070h,057h,051h,052h,077h	; 816d  ...pWQRw
	defb 000h,000h,000h,045h,045h,045h,045h,075h	; 8175  ...EEEEu
	defb 000h,000h,000h,0dch,010h,098h,010h,01ch	; 817d  ........
	defb 000h,03ch,040h,040h,040h,040h,040h,03ch	; 8185  .<@@@@@<
	defb 000h,03ch,042h,042h,042h,042h,042h,03ch	; 818d  .<BBBBB<
	defb 000h,03ch,002h,002h,002h,002h,002h,03ch	; 8195  .<.....<
	defb 000h,042h,042h,042h,042h,042h,042h,03ch	; 819d  .BBBBBB<
	defb 000h,03ch,002h,002h,002h,002h,002h,000h	; 81a5  .<......
	defb 000h,002h,002h,002h,002h,002h,002h,000h	; 81ad  ........
	defb 000h,03ch,042h,042h,042h,042h,042h,000h	; 81b5  .<BBBBB.
	defb 042h,042h,042h,042h,042h,03ch,000h,000h	; 81bd  BBBBB<..
	defb 002h,002h,002h,002h,002h,03ch,000h,000h	; 81c5  .....<..
	defb 040h,040h,040h,040h,040h,03ch,000h,000h	; 81cd  @@@@@<..
	defb 002h,002h,002h,002h,002h,002h,000h,000h	; 81d5  ........
	defb 000h,03ch,024h,024h,024h,03ch,000h,000h	; 81dd  .<$$$<..
	defb 000h,008h,008h,008h,008h,008h,000h,000h	; 81e5  ........
	defb 000h,03ch,004h,008h,010h,03ch,000h,000h	; 81ed  .<...<..
	defb 000h,03ch,004h,01ch,004h,03ch,000h,000h	; 81f5  .<...<..
	defb 000h,028h,028h,03ch,008h,008h,000h,000h	; 81fd  .((<....
	defb 000h,03ch,020h,03ch,004h,03ch,000h,000h	; 8205  .< <.<..
	defb 000h,03ch,020h,03ch,024h,03ch,000h,000h	; 820d  .< <$<..
	defb 000h,03ch,004h,004h,004h,004h,000h,000h	; 8215  .<......
	defb 000h,03ch,024h,03ch,024h,03ch,000h,000h	; 821d  .<$<$<..
	defb 000h,03ch,024h,03ch,004h,03ch,000h,000h	; 8225  .<$<.<..

; ----------------------------------------------------------------------
; DATOS dibujo_822D: 6 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 4 de la lista 0x8037 (p00:4D92, p00:4DF5); lo leen p01:6E08
;   (96 bytes)
;   0x822d..0x828d  (96 bytes)
DATA_dibujo_822D:
	defb 0f8h,087h,0ffh,080h,0f0h,08fh,0ffh,080h,0ffh,0ffh,000h,000h,000h,000h,000h,000h	; 822d  ................
	defb 083h,07ch,0ffh,000h,000h,0ffh,0ffh,000h,0ffh,0ffh,000h,000h,000h,000h,000h,000h	; 823d  .|..............
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,001h,0feh,002h,0fch,005h	; 824d  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,0ffh,000h,000h,000h,0ffh	; 825d  ................
	defb 0f8h,00bh,0f0h,016h,000h,0fch,0c0h,040h,080h,080h,000h,000h,000h,000h,000h,000h	; 826d  .......@........
	defb 0c3h,001h,0ffh,001h,0a3h,001h,0ffh,001h,0ffh,001h,0ffh,0ffh,000h,000h,000h,0ffh	; 827d  ................

; ----------------------------------------------------------------------
; DATOS dibujo_828D: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 5 de la lista 0x8037 (p00:4D92, p00:4DF5); lo leen p01:6E08
;   (16 bytes)
;   0x828d..0x829d  (16 bytes)
DATA_dibujo_828D:
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0e1h,0feh,0ffh,000h,0a3h,000h,0ffh,000h	; 828d  ................

; ----------------------------------------------------------------------
; DATOS dibujo_829D: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 6 de la lista 0x8037 (p00:4D92, p00:4DF5); lo leen p01:6E08
;   (16 bytes)
;   0x829d..0x82ad  (16 bytes)
DATA_dibujo_829D:
	defb 0ffh,0ffh,0ffh,080h,0ffh,080h,0c0h,0bfh,0ffh,080h,0e5h,080h,0ffh,080h,0d4h,0abh	; 829d  ................

; ----------------------------------------------------------------------
; DATOS dibujo_82AD: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 7 de la lista 0x8037 (p00:4D92, p00:4DF5); lo leen p01:6E08
;   (16 bytes)
;   0x82ad..0x82bd  (16 bytes)
DATA_dibujo_82AD:
	defb 000h,000h,05ah,05ah,052h,052h,05bh,05bh,000h,000h,000h,024h,000h,075h,000h,000h	; 82ad  ..ZZRR[[...$.u..

; ----------------------------------------------------------------------
; DATOS dibujo_82BD: 24 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 8 de la lista 0x8037 (p00:4D92, p00:4DF5); lo leen p01:6E08
;   (384 bytes)
;   0x82bd..0x843d  (384 bytes)
DATA_dibujo_82BD:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0ffh,000h,0d9h,011h,0dbh,012h,0dbh,012h	; 82bd  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0ffh,000h,052h,052h,056h,054h,056h,054h	; 82cd  ..........RRVTVT
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,00fh,0ffh,00fh,0ffh,08fh,0ffh,08fh,0ffh,08fh	; 82dd  ................
	defb 0d9h,011h,0dbh,012h,0dbh,012h,0c9h,009h,0ffh,03fh,0ffh,003h,0feh,007h,0fch,007h	; 82ed  .........?......
	defb 052h,052h,056h,054h,056h,054h,0b2h,0a2h,0ffh,04fh,0ffh,0fch,007h,0feh,003h,0feh	; 82fd  RRVTVT...O......
	defb 0ffh,08fh,0ffh,08fh,0ffh,08fh,07fh,04fh,0ffh,0cfh,0ffh,00fh,0ffh,00fh,0ffh,00fh	; 830d  .......O........
	defb 0fch,007h,0fch,007h,0fch,007h,0fch,007h,0fch,007h,0feh,007h,0ffh,003h,0ffh,0ffh	; 831d  ................
	defb 003h,0feh,003h,0feh,003h,0feh,003h,0feh,003h,0feh,007h,0feh,0ffh,0fch,0ffh,0ffh	; 832d  ................
	defb 0ffh,00fh,0ffh,00fh,0ffh,00fh,0ffh,00fh,0ffh,00fh,0ffh,00fh,0ffh,00fh,0ffh,0ffh	; 833d  ................
	defb 0ffh,0ffh,0ffh,0f0h,0ffh,0f0h,0fdh,0f1h,0fdh,0f1h,0fdh,0f1h,0fdh,0f1h,0fdh,0f1h	; 834d  ................
	defb 0ffh,0ffh,0ffh,000h,0ffh,000h,0e8h,008h,0ebh,00bh,0ebh,00ah,0e8h,008h,0ebh,00bh	; 835d  ................
	defb 0ffh,0ffh,0ffh,000h,0ffh,000h,043h,000h,0dfh,09ch,0dfh,010h,043h,000h,0dfh,09ch	; 836d  ......C.....C...
	defb 0fdh,0f1h,0fch,0f0h,0ffh,0f3h,0ffh,0f0h,0ffh,0f7h,0ffh,0f7h,0ffh,0f7h,0ffh,0f7h	; 837d  ................
	defb 0ebh,00ah,02bh,00ah,0ffh,0deh,0ffh,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 838d  ..+.............
	defb 0dfh,010h,0c3h,000h,0ffh,03ch,0ffh,000h,0ffh,0feh,0ffh,0feh,0ffh,0feh,0ffh,0feh	; 839d  .....<..........
	defb 0ffh,0f7h,0ffh,0f7h,0ffh,0f7h,0ffh,0f7h,0ffh,0f0h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 83ad  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 83bd  ................
	defb 0ffh,0feh,0ffh,0feh,0ffh,0feh,0ffh,0feh,0ffh,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 83cd  ................
	defb 0ffh,0ffh,0ffh,0f0h,0ffh,0f0h,0fch,0f0h,0ffh,0f3h,0ffh,0f0h,0ffh,0f0h,0ffh,0f0h	; 83dd  ................
	defb 0ffh,0ffh,0ffh,000h,0ffh,000h,00bh,00ah,069h,069h,06ah,04ah,06ah,04ah,06bh,04bh	; 83ed  ........iijJjJkK
	defb 0ffh,0ffh,0ffh,000h,0ffh,000h,0a3h,0a0h,02fh,02ch,0afh,0a0h,0a3h,0a0h,0afh,0ach	; 83fd  ......../,......
	defb 0ffh,0f0h,0ffh,0f0h,0ffh,0f0h,0ffh,0f0h,0ffh,0f7h,0ffh,0f7h,0ffh,0f7h,0ffh,0f7h	; 840d  ................
	defb 06bh,04ah,06bh,04ah,0ffh,0deh,0ffh,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 841d  kJkJ............
	defb 0afh,020h,0a3h,020h,0ffh,07ch,0ffh,000h,0ffh,0feh,0ffh,0feh,0ffh,0feh,0ffh,0feh	; 842d  . . .|..........

; ----------------------------------------------------------------------
; DATOS dibujo_843D: 10 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 9 de la lista 0x8037 (p00:4D92, p00:4DF5); lo leen p01:6E08
;   (160 bytes)
;   0x843d..0x84dd  (160 bytes)
DATA_dibujo_843D:
	defb 007h,007h,007h,005h,007h,005h,007h,005h,00bh,00dh,00bh,00dh,00bh,00dh,00bh,00dh	; 843d  ................
	defb 0e0h,0e0h,0e0h,0a0h,0e0h,0a0h,0e0h,0a0h,0d0h,0b0h,0d0h,0b0h,0d0h,0b0h,0d0h,0b0h	; 844d  ................
	defb 013h,01dh,013h,01dh,013h,01dh,013h,01dh,02bh,035h,02bh,035h,02bh,035h,02bh,035h	; 845d  ........+5+5+5+5
	defb 0c8h,0b8h,0c8h,0b8h,0c8h,0b8h,0c8h,0b8h,0d4h,0ach,0d4h,0ach,0d4h,0ach,0d4h,0ach	; 846d  ................
	defb 093h,0ffh,093h,0ffh,0a3h,0ffh,0a3h,0ffh,0a6h,0feh,0a6h,0feh,086h,0feh,086h,0feh	; 847d  ................
	defb 0c9h,0ffh,0c9h,0ffh,0c5h,0ffh,0c5h,0ffh,065h,07fh,065h,07fh,061h,07fh,061h,07fh	; 848d  ........e.e.a.a.
	defb 08ch,0fch,08ch,0fch,08ch,0fch,08ch,0fch,098h,0f8h,098h,0f8h,098h,0f8h,098h,0f8h	; 849d  ................
	defb 031h,03fh,031h,03fh,031h,03fh,031h,03fh,019h,01fh,019h,01fh,019h,01fh,019h,01fh	; 84ad  1?1?1?1?........
	defb 0b0h,0f0h,0b0h,0f0h,0b0h,0f0h,0b0h,0f0h,0e0h,0e0h,0e0h,0e0h,0e0h,0e0h,0e0h,0e0h	; 84bd  ................
	defb 00dh,00fh,00dh,00fh,00dh,00fh,00dh,00fh,007h,007h,007h,007h,007h,007h,007h,007h	; 84cd  ................

; ----------------------------------------------------------------------
; DATOS dibujo_84DD: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 10 de la lista 0x8037 (p00:4D92, p00:4DF5); lo leen p01:6E08
;   (32 bytes)
;   0x84dd..0x84fd  (32 bytes)
DATA_dibujo_84DD:
	defb 08bh,0d5h,08bh,0d5h,08bh,0ddh,08bh,0fdh,089h,0ffh,089h,0ffh,091h,0ffh,091h,0ffh	; 84dd  ................
	defb 0d1h,0abh,0d1h,0abh,0d1h,0bbh,0d1h,0bfh,091h,0ffh,091h,0ffh,089h,0ffh,089h,0ffh	; 84ed  ................

; ----------------------------------------------------------------------
; DATOS dibujo_84FD: 2 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 11 de la lista 0x8037 (p00:4D92, p00:4DF5); lo leen p01:6E08
;   (48 bytes)
;   0x84fd..0x852d  (48 bytes)
DATA_dibujo_84FD:
	defb 04bh,075h,000h,04bh,075h,000h,04bh,075h,000h,04bh,075h,000h,08bh,0f5h,000h,08bh,0d5h,020h,08bh,0d5h,020h,08bh,0d5h,020h	; 84fd  Ku.Ku.Ku.Ku...... .. ..
	defb 0d2h,0aeh,000h,0d2h,0aeh,000h,0d2h,0aeh,000h,0d2h,0aeh,000h,0d1h,0afh,000h,0d1h,0abh,004h,0d1h,0abh,004h,0d1h,0abh,004h	; 8515  ........................

; ----------------------------------------------------------------------
; DATOS dibujo_852D: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 12 de la lista 0x8037 (p00:4D92, p00:4DF5); lo leen p01:6E08 (8
;   bytes)
;   0x852d..0x8535  (8 bytes)
DATA_dibujo_852D:
	defb 000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 852d  ........

; ----------------------------------------------------------------------
; DATOS dibujo_8535: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 13 de la lista 0x8037 (p00:4D92, p00:4DF5); lo leen p01:6E08
;   (32 bytes)
;   0x8535..0x8555  (32 bytes)
DATA_dibujo_8535:
	defb 000h,000h,000h,0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 8535  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,0ffh,000h,0ffh,000h,0ffh,0ffh,000h	; 8545  ................

; ----------------------------------------------------------------------
; DATOS dibujo_8555: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 14 de la lista 0x8037 (p00:4D92, p00:4DF5); lo leen p01:6E08
;   (16 bytes)
;   0x8555..0x8565  (16 bytes)
DATA_dibujo_8555:
	defb 019h,00eh,0f9h,00eh,0f9h,00eh,0f9h,00eh,0f9h,00eh,0f9h,00eh,0f9h,00eh,0f9h,00eh	; 8555  ................

; ----------------------------------------------------------------------
; DATOS dibujo_8565: 3 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 15 de la lista 0x8037 (p00:4D92, p00:4DF5); lo leen p01:6E08
;   (72 bytes)
;   0x8565..0x85ad  (72 bytes)
DATA_dibujo_8565:
	defb 000h,000h,000h,00bh,0e2h,00ch,00bh,002h,00ch,0fbh,002h,00ch,0fbh,002h,00ch,0fbh,002h,00ch,0fbh,002h,00ch,0fbh,002h,00ch	; 8565  ........................
	defb 0fbh,002h,00ch,0fbh,002h,00ch,0fbh,002h,00ch,0fbh,002h,00ch,0ffh,002h,00ch,0f9h,006h,008h,0f1h,006h,008h,0f1h,006h,008h	; 857d  ........................
	defb 0f1h,006h,008h,0f1h,006h,008h,0f1h,006h,008h,0f1h,006h,008h,0f1h,0e6h,008h,011h,0e6h,008h,011h,0e8h,000h,0ffh,000h,000h	; 8595  ........................

; ----------------------------------------------------------------------
; DATOS dibujo_85AD: 6 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 16 de la lista 0x8037 (p00:4D92, p00:4DF5); lo leen p01:6E08
;   (144 bytes)
;   0x85ad..0x863d  (144 bytes)
DATA_dibujo_85AD:
	defb 000h,000h,000h,020h,000h,03fh,015h,013h,02dh,01dh,013h,031h,01fh,01eh,02fh,01eh,016h,027h,01bh,01bh,02eh,017h,015h,029h	; 85ad  ... .?..-..1../..'.....)
	defb 000h,000h,000h,000h,000h,0fch,0fch,0f0h,080h,0feh,08ah,08ah,0ffh,073h,073h,0ffh,063h,063h,0ffh,063h,063h,0efh,0f3h,0c3h	; 85c5  .............ss.cc.cc...
	defb 01fh,00bh,033h,01fh,016h,026h,01fh,008h,028h,01fh,003h,020h,000h,01fh,020h,03fh,007h,007h,01fh,01fh,01fh,00fh,00fh,00fh	; 85dd  ..3..&..(.. .. ?........
	defb 0dfh,0dbh,0e3h,0dfh,05bh,063h,0e3h,0c6h,03ah,0dfh,0e2h,002h,000h,0ffh,000h,0ffh,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 85f5  ....[c..:...............
	defb 0d7h,0dbh,0e3h,0ebh,06fh,073h,0f7h,017h,01bh,0ffh,0fbh,00bh,003h,0ffh,003h,0ffh,0e3h,0e3h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 860d  ....os..................
	defb 03ch,03ch,03ch,07eh,06eh,0ffh,0f9h,0ffh,0ffh,0e3h,0feh,07eh,0ffh,0fdh,0bdh,0f7h,0feh,066h,0dbh,0feh,05ah,0e7h,0feh,066h	; 8625  <<<~n......~.....f..Z..f

; ----------------------------------------------------------------------
; DATOS tabla_colores_863D: 21 punteros a colores de dibujo (los usa hasta el
;   indice 20; p00:4DA0); lo leen p00:4DA0 (42 bytes)
;   0x863d..0x8667  (42 bytes)
DATA_tabla_colores_863D:
	defw 08667h,08669h,0866bh,0866dh,0866fh,08671h,08673h,08675h	; 863d
	defw 08679h,0867dh,08681h,08685h,08689h,0868dh,08691h,08693h	; 864d
	defw 08697h,08699h,0869bh,0869dh,0869fh	; 865d

; ----------------------------------------------------------------------
; DATOS colores_8667: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6EF2 (2 bytes)
;   0x8667..0x8669  (2 bytes)
DATA_colores_8667:
	defb 007h,08fh	; 8667

; ----------------------------------------------------------------------
; DATOS colores_8669: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6EF2 (2 bytes)
;   0x8669..0x866b  (2 bytes)
DATA_colores_8669:
	defb 008h,0cfh	; 8669

; ----------------------------------------------------------------------
; DATOS colores_866B: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6EF2 (2 bytes)
;   0x866b..0x866d  (2 bytes)
DATA_colores_866B:
	defb 007h,08dh	; 866b

; ----------------------------------------------------------------------
; DATOS colores_866D: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6EF2 (2 bytes)
;   0x866d..0x866f  (2 bytes)
DATA_colores_866D:
	defb 00dh,0efh	; 866d

; ----------------------------------------------------------------------
; DATOS colores_866F: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6EF2 (2 bytes)
;   0x866f..0x8671  (2 bytes)
DATA_colores_866F:
	defb 00ch,0bfh	; 866f

; ----------------------------------------------------------------------
; DATOS colores_8671: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6EF2 (2 bytes)
;   0x8671..0x8673  (2 bytes)
DATA_colores_8671:
	defb 003h,0afh	; 8671

; ----------------------------------------------------------------------
; DATOS colores_8673: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6EF2 (2 bytes)
;   0x8673..0x8675  (2 bytes)
DATA_colores_8673:
	defb 007h,09ah	; 8673

; ----------------------------------------------------------------------
; DATOS colores_8675: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6EF2 (4 bytes)
;   0x8675..0x8679  (4 bytes)
DATA_colores_8675:
	defb 003h,078h,0abh,0cfh	; 8675

; ----------------------------------------------------------------------
; DATOS colores_8679: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6EF2 (4 bytes)
;   0x8679..0x867d  (4 bytes)
DATA_colores_8679:
	defb 007h,08bh,0cdh,0efh	; 8679

; ----------------------------------------------------------------------
; DATOS colores_867D: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6EF2 (4 bytes)
;   0x867d..0x8681  (4 bytes)
DATA_colores_867D:
	defb 007h,089h,0abh,0cfh	; 867d

; ----------------------------------------------------------------------
; DATOS colores_8681: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6EF2 (4 bytes)
;   0x8681..0x8685  (4 bytes)
DATA_colores_8681:
	defb 003h,078h,0cdh,0efh	; 8681

; ----------------------------------------------------------------------
; DATOS colores_8685: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6EF2 (4 bytes)
;   0x8685..0x8689  (4 bytes)
DATA_colores_8685:
	defb 007h,089h,0cdh,0efh	; 8685

; ----------------------------------------------------------------------
; DATOS sin identificar  0x8689..0x868d  (4 bytes)
DATA_8689:
	defb 007h,0afh,008h,09bh	; 8689

; ----------------------------------------------------------------------
; DATOS colores_868D: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6EF2 (4 bytes)
;   0x868d..0x8691  (4 bytes)
DATA_colores_868D:
	defb 003h,079h,0abh,0cfh	; 868d

; ----------------------------------------------------------------------
; DATOS colores_8691: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6EF2 (2 bytes)
;   0x8691..0x8693  (2 bytes)
DATA_colores_8691:
	defb 007h,0ach	; 8691

; ----------------------------------------------------------------------
; DATOS colores_8693: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6EF2 (4 bytes)
;   0x8693..0x8697  (4 bytes)
DATA_colores_8693:
	defb 003h,07ah,0bch,0dfh	; 8693

; ----------------------------------------------------------------------
; DATOS colores_8697: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6EF2 (2 bytes)
;   0x8697..0x8699  (2 bytes)
DATA_colores_8697:
	defb 007h,0bch	; 8697

; ----------------------------------------------------------------------
; DATOS colores_8699: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6EF2 (2 bytes)
;   0x8699..0x869b  (2 bytes)
DATA_colores_8699:
	defb 003h,0bch	; 8699

; ----------------------------------------------------------------------
; DATOS colores_869B: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6EF2 (2 bytes)
;   0x869b..0x869d  (2 bytes)
DATA_colores_869B:
	defb 00bh,0cfh	; 869b

; ----------------------------------------------------------------------
; DATOS colores_869D: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6EF2 (2 bytes)
;   0x869d..0x869f  (2 bytes)
DATA_colores_869D:
	defb 045h,06fh	; 869d

; ----------------------------------------------------------------------
; DATOS colores_869F: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6EF2 (2 bytes)
;   0x869f..0x86a1  (2 bytes)
DATA_colores_869F:
	defb 014h,05fh	; 869f

; ----------------------------------------------------------------------
; DATOS lista_86A1: 23 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x863D); lo leen p01:6EF2 (116 bytes)
;   0x86a1..0x8715  (116 bytes)
DATA_lista_86A1:
	defb 070h,000h,001h,015h,087h	; 86a1
	defb 042h,001h,033h,015h,08ah	; 86a6
	defb 041h,002h,035h,035h,08ah	; 86ab
	defb 042h,003h,036h,045h,08ah	; 86b0
	defb 042h,004h,038h,065h,08ah	; 86b5
	defb 041h,005h,03ah,085h,08ah	; 86ba
	defb 041h,006h,03bh,095h,08ah	; 86bf
	defb 0bah,007h,03ch,0a5h,08ah	; 86c4
	defb 09fh,008h,078h,015h,090h	; 86c9
	defb 08bh,009h,097h,0fdh,092h	; 86ce
	defb 085h,00ah,0a2h,005h,094h	; 86d3
	defb 082h,00bh,0a7h,07dh,094h	; 86d8
	defb 081h,00dh,0c5h,0adh,094h	; 86dd
	defb 042h,00eh,0c6h,0ddh,094h	; 86e2
	defb 042h,00fh,0c8h,0fdh,094h	; 86e7
	defb 044h,010h,0d2h,01dh,095h	; 86ec
	defb 041h,011h,0d6h,05dh,095h	; 86f1
	defb 041h,012h,0d7h,06dh,095h	; 86f6
	defb 086h,00fh,0d8h,07dh,095h	; 86fb
	defb 042h,013h,0f0h,00dh,096h	; 8700
	defb 041h,014h,0f2h,02dh,096h	; 8705
	defb 041h,013h,0f3h,03dh,096h	; 870a
	defb 041h,014h,0f4h,04dh,096h	; 870f
	defb 0ffh	; 8714

; ----------------------------------------------------------------------
; DATOS dibujo_8715: 48 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 0 de la lista 0x86A1 (p00:4D92, p00:4DF5); lo leen p01:6EF2
;   (768 bytes)
;   0x8715..0x8a15  (768 bytes)
DATA_dibujo_8715:
	defb 01dh,01bh,03fh,029h,02fh,03eh,03dh,03bh,00fh,00fh,00dh,00bh,007h,007h,000h,000h	; 8715  ..?)/>=.........
	defb 000h,000h,000h,0ffh,0ffh,000h,0ffh,0ffh,001h,0ffh,0fdh,003h,0ffh,0fdh,003h,002h	; 8725  ................
	defb 03fh,03eh,060h,0ffh,0c1h,03fh,0ffh,0ffh,0a8h,077h,06fh,0ffh,096h,0e9h,05dh,0fbh	; 8735  ?>`..?...wo...].
	defb 002h,003h,002h,003h,006h,005h,003h,003h,000h,000h,000h,000h,000h,000h,000h,000h	; 8745  ................
	defb 0feh,0ddh,0f7h,0bdh,00ah,0fbh,0f3h,0f2h,003h,002h,003h,002h,003h,003h,005h,006h	; 8755  ................
	defb 010h,0f0h,028h,0d8h,018h,0e8h,014h,0ech,044h,0fch,094h,06ch,0fch,0fch,014h,0fch	; 8765  ..(.....D..l....
	defb 000h,000h,0a0h,0e0h,010h,0f0h,010h,0f0h,010h,0f0h,060h,0a0h,040h,0c0h,080h,080h	; 8775  ..........`.@...
	defb 000h,003h,001h,002h,003h,003h,00fh,00bh,013h,01dh,03fh,020h,07fh,040h,080h,0ffh	; 8785  ..........? .@..
	defb 0c9h,037h,091h,06fh,0fdh,0ffh,0bdh,07fh,05fh,0bfh,0b8h,0e8h,0f0h,070h,060h,0a0h	; 8795  .7.o...._....p`.
	defb 0dfh,0e0h,0a0h,0ffh,0d7h,0b8h,068h,05fh,035h,02fh,01ah,017h,00bh,00fh,006h,006h	; 87a5  ......h_5/......
	defb 0f0h,010h,030h,0f0h,050h,0f0h,0a0h,0e0h,040h,0c0h,080h,080h,000h,000h,000h,000h	; 87b5  ..0.P...@.......
	defb 000h,000h,040h,0c0h,000h,0e0h,030h,0f0h,0dbh,0ech,067h,0deh,064h,0ddh,0c4h,07dh	; 87c5  ..@...0...g.d..}
	defb 0b9h,07eh,047h,0ffh,060h,0dfh,0bdh,0f2h,04fh,07fh,030h,03fh,00fh,00fh,000h,000h	; 87d5  .~G.`...O.0?....
	defb 0e4h,0fdh,014h,0fdh,019h,0feh,06fh,0ffh,090h,0f0h,060h,0e0h,080h,080h,000h,000h	; 87e5  ......o...`.....
	defb 061h,040h,053h,060h,026h,039h,01fh,017h,01eh,00fh,036h,01fh,009h,019h,000h,000h	; 87f5  a@S`&9....6.....
	defb 0a0h,060h,040h,0c0h,080h,080h,000h,000h,000h,000h,000h,080h,040h,080h,0c0h,0c0h	; 8805  .`@.........@...
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0ffh,000h,080h,07fh	; 8815  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,07ch,000h,0bfh,042h,042h,0bfh	; 8825  ..........|..BB.
	defb 07fh,0ffh,0ffh,0ffh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 8835  ................
	defb 0c3h,0bfh,0bbh,0ffh,03ch,07ch,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 8845  ....<|..........
	defb 000h,000h,000h,000h,000h,000h,007h,00ah,016h,00fh,01bh,01fh,015h,00eh,03ah,00dh	; 8855  ..............:.
	defb 000h,000h,000h,000h,040h,0a0h,0e0h,060h,058h,0e0h,0f4h,0fah,08eh,0fch,0e6h,0ffh	; 8865  ....@..`X.......
	defb 0d2h,03fh,09ah,07fh,02bh,0ffh,052h,0feh,0fch,0bch,0c0h,0c0h,000h,000h,000h,000h	; 8875  .?..+.R.........
	defb 001h,000h,001h,000h,001h,002h,064h,01fh,07fh,07fh,003h,006h,002h,007h,007h,003h	; 8885  ......d.........
	defb 0cdh,043h,02fh,0efh,0ffh,000h,000h,0ffh,0ffh,0ffh,0bfh,0c0h,000h,0ffh,0ffh,0ffh	; 8895  .C/.............
	defb 001h,002h,003h,003h,0ffh,001h,003h,0feh,0ffh,0fch,0feh,001h,000h,0ffh,0ffh,0ffh	; 88a5  ................
	defb 084h,07ch,0fah,0feh,0f2h,016h,092h,076h,05eh,0feh,05eh,0b2h,013h,0fdh,0f7h,0fdh	; 88b5  .|.....v^.^.....
	defb 006h,002h,006h,006h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 88c5  ................
	defb 014h,01dh,015h,01ch,01fh,015h,00ch,00bh,007h,007h,000h,000h,000h,000h,000h,000h	; 88d5  ................
	defb 09fh,0bfh,0a5h,09fh,0e5h,0dfh,064h,0dfh,0e4h,0dfh,024h,01fh,024h,01fh,034h,00fh	; 88e5  ......d...$.$.4.
	defb 011h,01fh,00fh,00fh,000h,000h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h	; 88f5  ................
	defb 000h,000h,0e0h,0e0h,0f0h,010h,0f8h,008h,0f4h,00ch,0e4h,01ch,0c4h,03ch,088h,078h	; 8905  .............<.x
	defb 04eh,071h,030h,01fh,05fh,07fh,060h,020h,000h,060h,030h,010h,016h,00fh,006h,009h	; 8915  Nq0._.` .`0.....
	defb 010h,0f0h,063h,0e3h,08bh,08ch,018h,014h,030h,020h,0a0h,0c0h,080h,040h,000h,000h	; 8925  ..c.....0 ...@..
	defb 00fh,00fh,03fh,030h,06fh,05fh,0fbh,0b4h,0efh,0b0h,0c7h,0b8h,0f0h,08fh,0bfh,0c0h	; 8935  ..?0o_..........
	defb 0f0h,0f0h,0dch,02ch,0f6h,0fah,0cdh,03fh,097h,06dh,0e3h,01dh,00dh,0f3h,0fdh,003h	; 8945  ...,...?.m......
	defb 00fh,00ch,01fh,010h,03fh,020h,03fh,020h,07fh,040h,07fh,040h,07fh,040h,0ffh,080h	; 8955  ....? ? .@.@.@..
	defb 030h,0f0h,0c8h,038h,0e4h,01ch,0f4h,00ch,0f2h,00eh,0fah,006h,0fah,006h,0f9h,007h	; 8965  0..8............
	defb 0ffh,080h,0bfh,0c0h,0bfh,0c0h,05fh,060h,047h,078h,020h,03fh,010h,01fh,00ch,00fh	; 8975  ......_`Gx ?....
	defb 0f9h,007h,0f9h,007h,0f1h,00fh,0f2h,00eh,0c2h,03eh,004h,0fch,008h,0f8h,030h,0f0h	; 8985  .........>....0.
	defb 00fh,00ch,01fh,014h,03dh,022h,03fh,022h,07ah,047h,07fh,049h,075h,05eh,0ffh,0a0h	; 8995  ....="?"zG.Iu^..
	defb 030h,0f0h,0c8h,038h,0e4h,01ch,0f4h,00ch,0f2h,00eh,07ah,086h,0fah,086h,0f9h,047h	; 89a5  0..8......z....G
	defb 0b9h,047h,0d9h,027h,0d1h,02fh,0f2h,00eh,0c2h,03eh,004h,0fch,008h,0f8h,030h,0f0h	; 89b5  .G.'./...>....0.
	defb 000h,000h,000h,000h,000h,000h,000h,000h,00ch,004h,012h,00eh,011h,00fh,061h,05fh	; 89c5  ..............a_
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,004h,056h,022h,0c6h,07ah	; 89d5  ............V".z
	defb 0a7h,0feh,0ffh,0bch,0fdh,09ah,069h,05eh,077h,04ah,0eeh,0b1h,0d3h,0bch,06ch,06fh	; 89e5  ......i^wJ....lo
	defb 0eeh,0fah,0fah,076h,0dah,036h,0f2h,00eh,0e7h,01dh,0c5h,03bh,00fh,0fbh,03eh,0feh	; 89f5  ...v.6........>.
	defb 0f0h,0f0h,00ch,0fch,0f2h,0feh,00dh,0ffh,017h,0edh,0c3h,03dh,00fh,0f3h,0ffh,00fh	; 8a05  ...........=....

; ----------------------------------------------------------------------
; DATOS dibujo_8A15: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 1 de la lista 0x86A1 (p00:4D92, p00:4DF5); lo leen p01:6EF2
;   (32 bytes)
;   0x8a15..0x8a35  (32 bytes)
DATA_dibujo_8A15:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,001h,000h,001h,003h,001h	; 8a15  ................
	defb 0feh,0fch,0feh,000h,0feh,000h,0feh,0feh,00eh,0fah,0feh,002h,000h,000h,000h,000h	; 8a25  ................

; ----------------------------------------------------------------------
; DATOS dibujo_8A35: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 2 de la lista 0x86A1 (p00:4D92, p00:4DF5); lo leen p01:6EF2
;   (16 bytes)
;   0x8a35..0x8a45  (16 bytes)
DATA_dibujo_8A35:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,001h,001h,003h,002h,006h,005h,00dh,00bh	; 8a35  ................

; ----------------------------------------------------------------------
; DATOS dibujo_8A45: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 3 de la lista 0x86A1 (p00:4D92, p00:4DF5); lo leen p01:6EF2
;   (32 bytes)
;   0x8a45..0x8a65  (32 bytes)
DATA_dibujo_8A45:
	defb 050h,0f0h,0a0h,0e0h,040h,0c0h,080h,080h,000h,000h,000h,000h,000h,000h,000h,000h	; 8a45  P...@...........
	defb 001h,0ffh,0fdh,003h,0fdh,0ffh,001h,0ffh,0fdh,003h,0fdh,0ffh,0ffh,0ffh,000h,000h	; 8a55  ................

; ----------------------------------------------------------------------
; DATOS dibujo_8A65: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 4 de la lista 0x86A1 (p00:4D92, p00:4DF5); lo leen p01:6EF2
;   (32 bytes)
;   0x8a65..0x8a85  (32 bytes)
DATA_dibujo_8A65:
	defb 07eh,0beh,082h,07eh,0fch,004h,0f8h,0f8h,040h,0c0h,080h,080h,000h,000h,000h,000h	; 8a65  ~..~....@.......
	defb 0a0h,060h,0a0h,060h,0c0h,0c0h,080h,080h,0c0h,0c0h,020h,0e0h,0e0h,020h,0c0h,0c0h	; 8a75  .`.`...... .. ..

; ----------------------------------------------------------------------
; DATOS dibujo_8A85: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 5 de la lista 0x86A1 (p00:4D92, p00:4DF5); lo leen p01:6EF2
;   (16 bytes)
;   0x8a85..0x8a95  (16 bytes)
DATA_dibujo_8A85:
	defb 068h,098h,0d0h,030h,0a0h,060h,040h,0c0h,080h,080h,000h,000h,000h,000h,000h,000h	; 8a85  h..0.`@.........

; ----------------------------------------------------------------------
; DATOS dibujo_8A95: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 6 de la lista 0x86A1 (p00:4D92, p00:4DF5); lo leen p01:6EF2
;   (16 bytes)
;   0x8a95..0x8aa5  (16 bytes)
DATA_dibujo_8A95:
	defb 000h,000h,000h,000h,001h,000h,003h,000h,006h,001h,00dh,002h,01bh,004h,037h,00ah	; 8a95  ..............7.

; ----------------------------------------------------------------------
; DATOS dibujo_8AA5: 58 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 7 de la lista 0x86A1 (p00:4D92, p00:4DF5); lo leen p01:6EF2
;   (1392 bytes)
;   0x8aa5..0x9015  (1392 bytes)
DATA_dibujo_8AA5:
	defb 01ch,034h,03ch,066h,022h,066h,062h,026h,066h,0f2h,056h,0d6h,0d4h,04ch,0cch,080h,080h,080h,080h,080h,080h,000h,000h,000h	; 8aa5  .4<f"fb&f.V..L..........
	defb 000h,000h,000h,00fh,00fh,000h,010h,01fh,000h,023h,03fh,000h,010h,03fh,027h,022h,03fh,034h,010h,02fh,004h,035h,02bh,001h	; 8abd  .........#?..?'"?4./.5+.
	defb 000h,000h,000h,0f0h,0f0h,000h,018h,0f8h,000h,0c4h,0fch,000h,066h,0beh,080h,022h,0feh,060h,0a3h,0ffh,060h,06bh,0bfh,020h	; 8ad5  ............f..".`..`k.
	defb 036h,01dh,000h,03bh,03eh,000h,04dh,07fh,004h,036h,07fh,002h,03fh,07fh,002h,077h,07fh,002h,07fh,07fh,044h,03fh,03fh,03fh	; 8aed  6...>.M..6..?..w....D???
	defb 0ebh,0bfh,080h,0d7h,07fh,001h,0bfh,0ffh,019h,0e6h,0feh,026h,0ceh,0feh,042h,0deh,0feh,042h,0ech,0fch,0a4h,0f8h,0f8h,0f8h	; 8b05  ...........&..B..B......
	defb 03ch,0fch,004h,0bch,07ch,094h,0bch,07ch,094h,0bch,07ch,084h,03ch,0fch,014h,03ch,0fch,014h,0b8h,0f8h,008h,0f0h,0f0h,0f0h	; 8b1d  <...|..|..|.<..<........
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,006h,007h,006h,003h,006h,003h,007h,006h,003h,003h,00eh,003h,00bh,016h,00bh	; 8b35  ........................
	defb 060h,060h,060h,020h,060h,020h,060h,0f8h,020h,0bah,064h,0bah,0bdh,063h,0bfh,0a3h,07dh,0bdh,097h,069h,0f9h,0efh,011h,0f1h	; 8b4d  ``` ` `. .d..c..}..i....
	defb 03ah,007h,03bh,079h,006h,07fh,01fh,060h,07fh,006h,079h,07fh,061h,01eh,01eh,079h,066h,066h,01fh,018h,018h,007h,007h,007h	; 8b65  :..y...`..y.a..yff......
	defb 01eh,0e2h,0e2h,0bch,044h,0c4h,078h,088h,088h,0f0h,010h,010h,0e0h,020h,020h,0c0h,040h,040h,080h,080h,080h,000h,000h,000h	; 8b7d  ....D.x......  .@@......
	defb 001h,001h,001h,002h,003h,002h,005h,006h,005h,00bh,00dh,00bh,016h,019h,017h,02ch,033h,02fh,059h,06eh,05fh,0d3h,0ach,0ddh	; 8b95  ...............,3/Yn_...
	defb 080h,080h,080h,060h,0e0h,0e0h,0b8h,058h,0d8h,036h,0ceh,0feh,07ah,086h,0beh,0f6h,00ah,0fah,0eeh,012h,0f2h,0deh,022h,0e2h	; 8bad  ...`...X.6..z.........".
	defb 0cfh,0b0h,0f7h,0c3h,0bch,0ffh,0c1h,0beh,0ffh,0c0h,0bfh,0ffh,0c0h,0ffh,0ffh,030h,03fh,03fh,00ch,00fh,00fh,003h,003h,003h	; 8bc5  ...............0??......
	defb 0beh,042h,0c2h,07eh,082h,082h,0fch,004h,004h,0f8h,008h,008h,0f0h,010h,010h,0e0h,020h,020h,0c0h,040h,040h,080h,080h,080h	; 8bdd  .B.~............  .@@...
	defb 007h,007h,007h,00ch,00fh,008h,00fh,00fh,008h,007h,007h,005h,00dh,00fh,00ch,014h,01fh,01ch,013h,01fh,017h,013h,01eh,010h	; 8bf5  ........................
	defb 0e0h,0e0h,0e0h,030h,0f0h,010h,0f0h,0f0h,030h,0e0h,0e0h,0e0h,0f0h,0f0h,0f0h,0f8h,0f8h,058h,0d8h,0f8h,098h,0d8h,038h,018h	; 8c0d  ...0....0........X....8.
	defb 013h,01ch,010h,013h,01ch,013h,013h,01ch,013h,013h,01ch,010h,013h,01ch,010h,01bh,01fh,013h,01dh,016h,012h,00fh,00fh,00fh	; 8c25  ........................
	defb 0f8h,038h,018h,0d8h,038h,0d8h,0f8h,038h,0d8h,0f8h,018h,018h,0f8h,018h,018h,0f8h,0d8h,0d8h,0f8h,038h,038h,0f0h,0f0h,0f0h	; 8c3d  .8..8..8...........88...
	defb 023h,03fh,020h,05fh,07fh,04fh,0beh,0ffh,090h,0bfh,0ffh,0afh,0bfh,0ffh,0bfh,0d7h,0ffh,093h,0ebh,0ffh,0ach,0ddh,0ffh,09fh	; 8c55  #? _.O..................
	defb 0f0h,0f0h,010h,0f8h,0f8h,0c8h,07ch,0fch,024h,0bch,0fch,014h,0fch,0fch,094h,0fah,0feh,0eeh,07dh,0ffh,017h,0feh,0ffh,0f7h	; 8c6d  ......|.$.........}.....
	defb 0c6h,0ffh,083h,047h,07fh,041h,047h,07fh,040h,067h,07fh,040h,073h,07fh,050h,06fh,07fh,04fh,033h,03fh,020h,01fh,01fh,01fh	; 8c85  ...G.AG.@g.@s.Po.O3? ...
	defb 07fh,0fch,036h,0ffh,079h,0bdh,0beh,0f2h,0eah,05ch,0f4h,074h,078h,0f8h,038h,0f8h,0f8h,0c8h,070h,0f0h,030h,0e0h,0e0h,0e0h	; 8c9d  ..6.y....\.tx.8...p.0...
	defb 00ah,00dh,00dh,01fh,01ch,01ch,02bh,036h,036h,03dh,027h,02fh,07bh,064h,044h,0efh,0f1h,091h,0f9h,0c7h,08fh,0fch,093h,08bh	; 8cb5  ......+66='/{dD.........
	defb 0a0h,060h,060h,0f0h,070h,070h,0a8h,0d8h,0d8h,0d8h,068h,0e8h,0bch,04ch,044h,0eeh,01eh,012h,01eh,0e6h,0e2h,05eh,0b2h,0a2h	; 8ccd  .``.pp....h..LD......^..
	defb 0ffh,0b0h,08fh,07fh,060h,04dh,07fh,040h,04fh,07fh,050h,04fh,03fh,020h,027h,01ch,013h,017h,01ah,015h,015h,015h,01eh,01eh	; 8ce5  ....`M.@O.PO? '.........
	defb 09eh,07ah,0e2h,09ch,06ch,064h,09ch,064h,0e4h,01ch,0f4h,0e4h,038h,0c8h,0c8h,030h,0d0h,0d0h,0b0h,050h,050h,050h,0f0h,0f0h	; 8cfd  .z..ld.d....8..0...PPP..
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,00ah,00dh,00dh,01fh,01ch,01ch,06bh,076h,076h,0fdh,087h,08fh,0fbh,084h,084h	; 8d15  ...............kvv......
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,0a0h,060h,060h,0f0h,070h,070h,0ach,0dch,0dch,0deh,062h,0e2h,0beh,042h,042h	; 8d2d  ..........``.pp....b..BB
	defb 0efh,0b1h,091h,0e9h,0f7h,09fh,0fch,0c3h,08bh,07fh,040h,04fh,03fh,030h,02dh,01fh,010h,01fh,00bh,00ch,00fh,015h,01fh,01fh	; 8d45  ..........@O?0-.........
	defb 0eeh,01ah,012h,00eh,0feh,0f2h,05eh,0a6h,0a2h,09ch,064h,0e4h,098h,078h,068h,010h,0f0h,0f0h,020h,0e0h,0e0h,050h,0f0h,0f0h	; 8d5d  ......^...d..xh... ..P..
	defb 001h,001h,001h,002h,003h,002h,005h,007h,004h,00bh,00fh,008h,017h,01fh,011h,02bh,03fh,022h,067h,07fh,045h,0bfh,0feh,09ah	; 8d75  ...............+?"g.E...
	defb 0c0h,0c0h,0c0h,0e0h,0e0h,060h,0f0h,0f0h,050h,0f8h,0e8h,0a8h,0fch,0d4h,054h,0eeh,0feh,0eah,0ffh,0d7h,0d1h,0fdh,07fh,074h	; 8d8d  .....`..P.....T........t
	defb 0dfh,0fdh,085h,06eh,07bh,042h,037h,03dh,021h,01bh,01eh,010h,00dh,00fh,008h,006h,007h,004h,003h,003h,002h,001h,001h,001h	; 8da5  ...n{B7=!...............
	defb 07bh,0bfh,0a9h,0f6h,0beh,092h,0ech,07ch,024h,0d8h,0f8h,048h,0b0h,0f0h,090h,060h,0e0h,020h,0c0h,0c0h,040h,080h,080h,080h	; 8dbd  {......|$..H...`. ..@...
	defb 000h,000h,000h,001h,001h,001h,006h,007h,006h,008h,00fh,008h,014h,01bh,018h,02dh,036h,032h,05bh,07dh,044h,046h,07fh,040h	; 8dd5  ...............-62[}DF.@
	defb 07fh,07fh,01fh,03fh,07fh,000h,004h,07fh,000h,07fh,07fh,07fh,078h,07fh,06fh,07fh,07fh,060h,000h,000h,000h,000h,000h,000h	; 8ded  ...?........x.o..`......
	defb 000h,000h,000h,000h,000h,000h,01fh,01fh,01fh,02bh,034h,02bh,060h,05fh,07fh,07ch,07fh,07fh,006h,005h,007h,00dh,00bh,00fh	; 8e05  .........+4+`_.|........
	defb 03ch,03ch,03ch,02ch,034h,02ch,0f4h,0ech,0fch,0c8h,078h,0d8h,068h,0d8h,0f8h,0d0h,0b0h,0f0h,0d0h,0b0h,0f0h,0a0h,060h,0e0h	; 8e1d  <<<,4,....x.h.........`.
	defb 00dh,00bh,00fh,013h,01eh,017h,02eh,035h,03fh,037h,02fh,03fh,04fh,070h,05fh,0e0h,09fh,0ffh,0ffh,0ffh,0ffh,000h,000h,000h	; 8e35  .......5?7/?Op_.........
	defb 000h,000h,000h,000h,000h,000h,00fh,00fh,00fh,017h,018h,017h,020h,03fh,02fh,01fh,01fh,01fh,003h,002h,003h,003h,002h,003h	; 8e4d  ............ ?/.........
	defb 030h,030h,030h,058h,068h,058h,0e8h,0d8h,0f8h,090h,070h,0b0h,050h,0b0h,0f0h,020h,0e0h,0e0h,020h,0e0h,0e0h,060h,0e0h,0e0h	; 8e65  000XhX....p.P.. .. ..`..
	defb 006h,005h,007h,006h,005h,007h,008h,00fh,00bh,00dh,00bh,00fh,019h,016h,01fh,020h,03fh,02fh,03eh,03fh,03fh,001h,001h,001h	; 8e7d  ............... ?/>??...
	defb 078h,078h,078h,094h,0ech,09ch,0c4h,0bch,0fch,074h,06ch,07ch,044h,07ch,05ch,064h,05ch,07ch,034h,02ch,03ch,034h,02ch,03ch	; 8e95  xxx......tl|D|\d\|4,<4,<
	defb 034h,02ch,03ch,034h,02ch,03ch,034h,02ch,03ch,062h,05eh,07eh,099h,0ffh,0bfh,0d9h,0bfh,0ffh,042h,07eh,07eh,03ch,03ch,03ch	; 8ead  4,<4,<4,<b^~......B~~<<<
	defb 018h,018h,018h,024h,03ch,02ch,046h,07ah,05eh,072h,04eh,07eh,034h,02ch,03ch,056h,06ah,05eh,072h,04eh,07eh,054h,06ch,07ch	; 8ec5  ...$<,Fz^rN~4,<Vj^rN~Tl|
	defb 036h,02ah,03eh,034h,02ch,03ch,034h,02ch,03ch,066h,05ah,07eh,083h,0fdh,0bfh,0d9h,0bfh,0ffh,042h,07eh,07eh,03ch,03ch,03ch	; 8edd  6*>4,<4,<fZ~......B~~<<<
	defb 001h,001h,000h,007h,0f9h,0f9h,0c7h,038h,038h,0f3h,00ch,00ch,073h,00ch,00ch,030h,00fh,00ch,002h,01dh,01ch,007h,019h,018h	; 8ef5  .......88...s..0........
	defb 000h,000h,000h,076h,08eh,00ah,0a6h,0dch,094h,0dch,07ah,04ah,038h,0f6h,0e6h,018h,0feh,016h,0cah,0fch,058h,046h,0beh,01ch	; 8f0d  ...v......zJ8.......XF..
	defb 007h,00bh,009h,003h,00eh,00ah,007h,00ch,004h,00ch,00bh,00bh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 8f25  ........................
	defb 09fh,063h,002h,0deh,020h,000h,0feh,000h,000h,072h,08ch,08ch,000h,0feh,0feh,038h,006h,006h,01eh,000h,000h,00eh,000h,000h	; 8f3d  .c.. ....r.....8........
	defb 0f0h,0f0h,0f0h,0e8h,0f8h,0c8h,0f8h,0f8h,028h,078h,078h,0f8h,0dch,0fch,084h,038h,0f8h,018h,0a0h,0e0h,020h,0f0h,0f0h,010h	; 8f55  ........(xx....8.... ...
	defb 000h,000h,000h,000h,003h,003h,001h,014h,016h,013h,019h,01dh,006h,01eh,00eh,00ch,03ch,006h,01ah,07ah,00ah,030h,0f0h,010h	; 8f6d  ................<..z.0..
	defb 01fh,07fh,00dh,072h,07fh,052h,03fh,07fh,032h,01dh,01fh,07dh,070h,070h,073h,003h,003h,003h,000h,000h,000h,000h,000h,000h	; 8f85  ...r.R?.2..}pps.........
	defb 059h,068h,05fh,056h,066h,05fh,059h,069h,05fh,04eh,076h,04fh,067h,078h,047h,03ch,03fh,030h,00fh,00fh,00ch,003h,003h,003h	; 8f9d  Yh_Vf_Yi_NvOgxG<?0......
	defb 020h,02ch,033h,040h,058h,067h,0c1h,0b0h,0ceh,0a3h,0c0h,0bch,056h,060h,059h,03dh,031h,02bh,01eh,01ah,016h,00ch,00ch,00ch	; 8fb5   ,3@Xg......V`Y=1+......
	defb 001h,003h,001h,01bh,01fh,001h,013h,03fh,003h,03fh,07fh,006h,037h,077h,00ch,05fh,07fh,00ch,061h,07fh,040h,03fh,03fh,03fh	; 8fcd  .......?.?..7w._..a.@???
	defb 000h,000h,000h,010h,01fh,010h,00fh,03fh,000h,07fh,07fh,067h,0bfh,0ffh,098h,079h,0fdh,013h,059h,0f9h,017h,05fh,0ffh,017h	; 8fe5  .......?...g...y..Y.._..
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,07fh,07fh,010h,030h,07fh,010h,070h,07fh,053h,030h,07fh,010h,070h,07eh,051h	; 8ffd  ............0..p.S0..p~Q

; ----------------------------------------------------------------------
; DATOS dibujo_9015: 31 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 8 de la lista 0x86A1 (p00:4D92, p00:4DF5); lo leen p01:6EF2
;   (744 bytes)
;   0x9015..0x92fd  (744 bytes)
DATA_dibujo_9015:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,004h,0fah,000h,03ch,006h,0c4h,0fch,006h,004h,09ch,006h,004h,07ch,006h,004h	; 9015  ............<........|..
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,001h,000h,000h,003h,020h,001h	; 902d  ...................... .
	defb 000h,000h,000h,00dh,003h,001h,01bh,007h,003h,035h,00fh,005h,06ah,01eh,02ah,0f4h,01ch,074h,0e8h,038h,0f8h,0d0h,070h,0f0h	; 9045  .........5..j.*..t.8..p.
	defb 06fh,018h,00bh,03fh,049h,00fh,056h,07bh,053h,02dh,037h,025h,03ah,05dh,018h,04bh,07ch,048h,03dh,03eh,03ch,000h,000h,000h	; 905d  o..?I.V{S-7%:].K|H=><...
	defb 0a0h,0e0h,0e0h,040h,0c0h,0c0h,080h,080h,080h,000h,000h,000h,080h,080h,080h,000h,080h,000h,080h,080h,080h,000h,000h,000h	; 9075  ...@....................
	defb 030h,06fh,07fh,077h,008h,06fh,077h,00fh,06fh,070h,00fh,07fh,077h,048h,07fh,037h,02fh,03fh,01fh,01fh,01fh,000h,000h,000h	; 908d  0o.w.ow.op..wH.7/?......
	defb 003h,00ch,00bh,027h,01bh,017h,06fh,012h,037h,02eh,053h,037h,067h,059h,07bh,061h,05eh,06dh,073h,04ch,075h,079h,047h,07bh	; 90a5  ...'..o.7.S7gY{a^msLuyG{
	defb 0a0h,058h,0f8h,0e0h,0fch,0ech,038h,0e6h,0eeh,054h,0eeh,0deh,02ah,0deh,0beh,096h,0fah,0feh,0aeh,0f2h,0feh,06ah,0f6h,0feh	; 90bd  .X....8..T..*........j..
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 90d5  ........................
	defb 0a1h,07fh,0ffh,0bdh,067h,0efh,0adh,07fh,0ffh,0a9h,077h,0efh,061h,0bfh,0efh,0fah,0ffh,0ffh,00ch,0feh,0feh,000h,0fch,0fch	; 90ed  ....g.....w.a...........
	defb 000h,000h,000h,001h,006h,000h,007h,003h,003h,001h,002h,000h,003h,002h,002h,003h,002h,003h,007h,008h,00fh,00fh,010h,01fh	; 9105  ........................
	defb 002h,00eh,002h,0d9h,06bh,049h,0e9h,0d8h,0c8h,0f1h,058h,050h,05bh,0edh,049h,02fh,0e3h,0e3h,099h,07bh,0f9h,0efh,01dh,0fdh	; 911d  ....kI....XP[.I/...{....
	defb 01fh,020h,039h,00fh,030h,03fh,01fh,020h,03fh,01fh,020h,03fh,007h,018h,01fh,00fh,010h,01fh,003h,00ch,00fh,001h,003h,003h	; 9135  . 9.0?. ?. ?............
	defb 0f7h,00dh,0fdh,04fh,0bdh,0fdh,0f5h,00fh,0fdh,0f6h,00eh,0feh,0ach,05ch,0fch,0e4h,01ch,0fch,088h,078h,0f8h,0e0h,0e0h,0e0h	; 914d  ...O.........\.....x....
	defb 01ch,003h,01fh,01ch,003h,01fh,01ch,003h,00fh,01ch,003h,000h,01ch,003h,010h,01ch,003h,01fh,008h,017h,01fh,003h,00fh,00fh	; 9165  ........................
	defb 0a4h,0ech,0e4h,0ach,0e4h,0e4h,0a0h,0e0h,0a0h,0a0h,0e0h,0a0h,0a0h,0e0h,0e0h,0a0h,0e0h,0e0h,0c0h,0e0h,0e0h,0c0h,0c0h,0c0h	; 917d  ........................
	defb 000h,000h,000h,018h,018h,018h,034h,02ch,03ch,03ch,03ch,03ch,035h,02dh,02dh,073h,04eh,07fh,075h,04fh,07fh,075h,04eh,06fh	; 9195  ......4,<<<<5--sN.uO.uNo
	defb 000h,000h,000h,018h,018h,018h,034h,02ch,03ch,03ch,03ch,03ch,0b4h,0ach,0ach,072h,0eeh,0feh,0b2h,0eeh,0feh,0b2h,0eeh,0eeh	; 91ad  ......4,<<<<...r........
	defb 075h,04eh,06eh,07dh,05fh,07fh,077h,06eh,07eh,073h,04eh,06fh,07bh,05fh,07fh,03ch,024h,024h,018h,018h,018h,000h,000h,000h	; 91c5  uNn}_.wn~sNo{_.<$$......
	defb 0b2h,0eeh,0eeh,0bah,0feh,0feh,036h,0eeh,0feh,0f2h,04eh,0eeh,0fah,0deh,0feh,03ch,024h,024h,018h,018h,018h,000h,000h,000h	; 91dd  ......6...N....<$$......
	defb 004h,008h,000h,002h,004h,000h,05dh,026h,04ch,0dah,027h,09eh,0b6h,04eh,03eh,06ah,09eh,07eh,0d4h,03ch,0fch,0a8h,078h,0f8h	; 91f5  ......]&L.'..N>j.~.<..x.
	defb 000h,000h,000h,000h,000h,000h,07ah,00dh,03dh,07fh,007h,05fh,07fh,000h,061h,030h,04fh,06fh,070h,028h,06fh,06fh,03fh,07fh	; 920d  ......z.=.._..a0Oop(oo?.
	defb 000h,000h,000h,000h,000h,000h,01ch,0e4h,0bch,0feh,0f2h,0feh,0ffh,001h,07fh,001h,0ffh,0ffh,001h,0a7h,0ffh,0ffh,0ffh,0ffh	; 9225  ........................
	defb 000h,000h,000h,050h,0b0h,010h,0d0h,0f0h,0d0h,0e8h,0f8h,0e8h,0a4h,0ach,0e4h,064h,06ch,0e4h,0ech,0e4h,0e4h,0ach,0e4h,0e4h	; 923d  ...P...........dl.......
	defb 00fh,00fh,00fh,030h,03fh,030h,06fh,05fh,04fh,0f0h,0bfh,0b0h,0e8h,0b7h,0a0h,0c7h,0b8h,080h,0b0h,0cfh,0c0h,09fh,0e0h,0f0h	; 9255  ...0?0o_O...............
	defb 097h,07fh,0ffh,017h,07fh,0ffh,017h,07fh,0ffh,017h,07fh,0ffh,096h,07eh,0feh,01ch,0fch,0fch,0f0h,0f0h,0f0h,000h,000h,000h	; 926d  .............~..........
	defb 0afh,0d0h,0d0h,0aeh,0d1h,0d9h,09eh,0e1h,0ebh,0beh,0c1h,08bh,05eh,061h,041h,037h,038h,030h,00fh,00fh,00fh,000h,000h,000h	; 9285  ............^aA780......
	defb 0d9h,027h,001h,0c9h,037h,021h,049h,0b7h,0a1h,007h,0fbh,0e3h,0beh,046h,006h,0fch,01ch,01ch,0f0h,0f0h,0f0h,000h,000h,000h	; 929d  .'..7!I......F..........
	defb 000h,000h,000h,006h,001h,000h,007h,007h,007h,01ah,01dh,018h,017h,017h,00fh,00fh,01fh,010h,011h,00fh,01fh,01ch,003h,01fh	; 92b5  ........................
	defb 09fh,0d0h,0ebh,09fh,0dbh,0e0h,09fh,0dbh,0e0h,09fh,0efh,0f0h,04fh,070h,07bh,034h,03bh,03fh,00fh,00fh,00fh,000h,000h,000h	; 92cd  ............Op{4.?......
	defb 000h,07fh,07bh,0b8h,04fh,0dah,099h,07eh,0fah,095h,06ah,0deh,002h,0fdh,0dfh,02fh,0dfh,0ffh,058h,03fh,07fh,000h,03fh,03fh	; 92e5  ..{.O..~..j..../..X?..??

; ----------------------------------------------------------------------
; DATOS dibujo_92FD: 11 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 9 de la lista 0x86A1 (p00:4D92, p00:4DF5); lo leen p01:6EF2
;   (264 bytes)
;   0x92fd..0x9405  (264 bytes)
DATA_dibujo_92FD:
	defb 000h,000h,000h,0c0h,0c0h,0c0h,0f8h,0f8h,038h,0f4h,08ch,004h,004h,0fch,004h,0c4h,024h,01ch,004h,01ch,0e4h,0d4h,03ch,014h	; 92fd  ........8.......$.....<.
	defb 03fh,03fh,03fh,05ch,063h,040h,067h,05bh,040h,07fh,047h,040h,04eh,041h,070h,071h,040h,04eh,07eh,040h,041h,07fh,040h,04eh	; 9315  ???\c@g[@.G@NApq@N~@A.@N
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,001h,001h,001h,002h,003h,002h,005h,006h,004h,00fh,00ch,008h,01fh,019h,010h	; 932d  ........................
	defb 060h,000h,000h,0f0h,020h,000h,0f8h,040h,000h,0fch,084h,000h,0feh,00eh,000h,0ffh,01eh,000h,0feh,03dh,000h,0fdh,03bh,001h	; 9345  `... ..@...........=....
	defb 0fah,0b6h,002h,0f4h,0ach,004h,0e8h,098h,008h,0d0h,0b0h,010h,0a0h,060h,020h,040h,0c0h,040h,080h,080h,080h,000h,000h,000h	; 935d  .............` @.@......
	defb 07bh,010h,004h,0f7h,020h,008h,06bh,0c0h,014h,037h,040h,008h,01fh,020h,000h,00fh,010h,000h,006h,009h,000h,001h,007h,001h	; 9375  {... .k..7@.. ..........
	defb 060h,000h,000h,0f0h,020h,000h,0f8h,040h,000h,0f8h,080h,004h,0f0h,000h,00eh,0e1h,000h,01eh,0c2h,001h,03ch,0c5h,003h,039h	; 938d  `... ..@............<..9
	defb 04ah,006h,0b2h,054h,00ch,0a4h,068h,018h,088h,050h,030h,090h,0a0h,060h,020h,040h,0c0h,040h,080h,080h,080h,000h,000h,000h	; 93a5  J..T..h..P0..` @.@......
	defb 004h,004h,004h,06eh,06ah,06ah,0bdh,0d3h,0b1h,07ah,08eh,01ah,0d4h,02ch,00ch,082h,07eh,006h,0fah,0feh,01ah,0fch,0fch,034h	; 93bd  ...njj...z...,..~......4
	defb 060h,000h,000h,0f0h,020h,000h,0f8h,040h,000h,0fch,080h,004h,0f8h,006h,00eh,0f1h,00eh,01eh,0e2h,01dh,03ch,0c5h,03bh,039h	; 93d5  `... ..@............<..9
	defb 0cah,036h,0b2h,054h,0ach,0a4h,068h,098h,088h,050h,0b0h,090h,0a0h,060h,020h,040h,0c0h,040h,080h,080h,080h,000h,000h,000h	; 93ed  .6.T..h..P...` @.@......

; ----------------------------------------------------------------------
; DATOS dibujo_9405: 5 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 10 de la lista 0x86A1 (p00:4D92, p00:4DF5); lo leen p01:6EF2
;   (120 bytes)
;   0x9405..0x947d  (120 bytes)
DATA_dibujo_9405:
	defb 007h,00ch,013h,006h,011h,02fh,045h,023h,05bh,0beh,061h,091h,077h,0cbh,0bbh,0aah,0deh,0feh,054h,07ch,07ch,038h,038h,038h	; 9405  ...../E#[.a.w.....T||888
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,001h,001h,000h,006h,001h,007h,005h,008h,00bh,016h,01fh,001h,027h,01fh,01eh	; 941d  .....................'..
	defb 000h,000h,000h,078h,000h,018h,072h,088h,0bch,06dh,0f3h,013h,073h,0fdh,0efh,019h,0ffh,0f7h,0fbh,01fh,097h,0deh,03eh,0feh	; 9435  ...x..r..m..s.........>.
	defb 05dh,003h,07fh,0f6h,001h,0fbh,0eah,071h,0fdh,0e1h,05eh,0feh,0ebh,0bch,0fch,0b9h,0efh,0ffh,0d3h,0ffh,0ffh,07eh,07eh,07eh	; 944d  ]......q..^..........~~~
	defb 0bch,0dch,05ch,0d8h,0f8h,0b8h,0d0h,0f0h,0b0h,0e0h,0e0h,0e0h,0c0h,0c0h,0c0h,080h,080h,080h,000h,000h,000h,000h,000h,000h	; 9465  ..\.....................

; ----------------------------------------------------------------------
; DATOS dibujo_947D: 2 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 11 de la lista 0x86A1 (p00:4D92, p00:4DF5); lo leen p01:6EF2
;   (48 bytes)
;   0x947d..0x94ad  (48 bytes)
DATA_dibujo_947D:
	defb 060h,000h,000h,0f0h,020h,000h,0f8h,040h,000h,0fch,080h,004h,0f8h,006h,00eh,0f1h,00eh,01eh,0e2h,01dh,03ch,0c5h,03bh,039h	; 947d  `... ..@............<..9
	defb 0cah,036h,0b2h,054h,0ach,0a4h,068h,098h,088h,050h,0b0h,090h,0a0h,060h,020h,040h,0c0h,040h,080h,080h,080h,000h,000h,000h	; 9495  .6.T..h..P...` @.@......

; ----------------------------------------------------------------------
; DATOS dibujo_94AD: 1 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 12 de la lista 0x86A1 (p00:4D92, p00:4DF5); lo leen p01:6EF2
;   (24 bytes)
;   0x94ad..0x94c5  (24 bytes)
DATA_dibujo_94AD:
	defb 090h,060h,06ch,068h,088h,0fah,05fh,08fh,0e9h,079h,09fh,0f9h,01fh,0efh,0e9h,0ffh,00fh,009h,0ffh,00fh,00fh,0f8h,0f8h,0f8h	; 94ad  .`lh.._..y..............

; ----------------------------------------------------------------------
; DATOS sin identificar  0x94c5..0x94dd  (24 bytes)
DATA_94C5:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 94c5  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h	; 94d5  ........

; ----------------------------------------------------------------------
; DATOS dibujo_94DD: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 13 de la lista 0x86A1 (p00:4D92, p00:4DF5); lo leen p01:6EF2
;   (32 bytes)
;   0x94dd..0x94fd  (32 bytes)
DATA_dibujo_94DD:
	defb 007h,000h,01fh,001h,03eh,003h,03eh,003h,07eh,003h,07eh,003h,07eh,003h,07fh,001h	; 94dd  ....>.>.~.~.~...
	defb 07fh,001h,07fh,000h,07fh,000h,03fh,001h,03eh,001h,01eh,001h,007h,000h,000h,000h	; 94ed  ......?.>.......

; ----------------------------------------------------------------------
; DATOS dibujo_94FD: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 14 de la lista 0x86A1 (p00:4D92, p00:4DF5); lo leen p01:6EF2
;   (32 bytes)
;   0x94fd..0x951d  (32 bytes)
DATA_dibujo_94FD:
	defb 000h,0e0h,0c0h,0b8h,0e0h,0dch,0e0h,0dch,0e0h,0deh,0e0h,0deh,0e0h,0deh,0c0h,0beh	; 94fd  ................
	defb 0c0h,0beh,080h,0feh,000h,0feh,0c0h,0bch,0c0h,0bch,0c0h,038h,000h,0e0h,000h,000h	; 950d  ...........8....

; ----------------------------------------------------------------------
; DATOS dibujo_951D: 4 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 15 de la lista 0x86A1 (p00:4D92, p00:4DF5); lo leen p01:6EF2
;   (64 bytes)
;   0x951d..0x955d  (64 bytes)
DATA_dibujo_951D:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,003h,003h,00ch,00fh,011h,01eh	; 951d  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0c0h,0c0h,030h,0f0h,088h,078h	; 952d  ............0..x
	defb 000h,000h,081h,081h,041h,041h,060h,061h,033h,033h,02ah,03bh,036h,03fh,012h,01fh	; 953d  ....AA`a33*.6?..
	defb 001h,001h,002h,002h,004h,004h,00ch,00ch,010h,018h,0b8h,0b8h,0e8h,0f8h,00ch,0fch	; 954d  ................

; ----------------------------------------------------------------------
; DATOS dibujo_955D: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 16 de la lista 0x86A1 (p00:4D92, p00:4DF5); lo leen p01:6EF2
;   (16 bytes)
;   0x955d..0x956d  (16 bytes)
DATA_dibujo_955D:
	defb 001h,001h,089h,081h,0c1h,080h,060h,040h,020h,020h,008h,00ah,080h,000h,020h,020h	; 955d  ......`@  ....

; ----------------------------------------------------------------------
; DATOS dibujo_956D: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 17 de la lista 0x86A1 (p00:4D92, p00:4DF5); lo leen p01:6EF2
;   (16 bytes)
;   0x956d..0x957d  (16 bytes)
DATA_dibujo_956D:
	defb 010h,011h,000h,000h,000h,000h,000h,000h,020h,020h,000h,000h,000h,000h,000h,0c0h	; 956d  ........  ......

; ----------------------------------------------------------------------
; DATOS dibujo_957D: 6 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 18 de la lista 0x86A1 (p00:4D92, p00:4DF5); lo leen p01:6EF2
;   (144 bytes)
;   0x957d..0x960d  (144 bytes)
DATA_dibujo_957D:
	defb 010h,007h,018h,020h,007h,038h,060h,00fh,030h,060h,00fh,030h,070h,003h,03ch,03ch,000h,01fh,00fh,000h,000h,000h,000h,000h	; 957d  ... .8`.0`.0p.<<........
	defb 008h,0e0h,018h,004h,0e0h,01ch,006h,0f0h,00ch,006h,0f0h,00ch,00eh,0c0h,03ch,03ch,000h,0f8h,0f0h,000h,000h,000h,000h,000h	; 9595  ..............<<........
	defb 0f0h,000h,0ffh,040h,003h,07ch,020h,007h,038h,060h,007h,078h,080h,00fh,0f0h,0c0h,007h,078h,070h,000h,03fh,03fh,000h,00fh	; 95ad  ...@.| .8`.x.....xp.??..
	defb 009h,000h,0f9h,00eh,0c0h,03eh,004h,0e0h,01ch,006h,0e0h,01eh,002h,0f0h,00eh,003h,0e0h,01fh,00fh,000h,0fch,0fch,000h,0f8h	; 95c5  .....>..................
	defb 080h,000h,080h,044h,000h,054h,030h,000h,030h,060h,000h,060h,040h,000h,040h,060h,000h,030h,074h,000h,01ah,03fh,010h,013h	; 95dd  ...D.T0.0`.`@.@`.0t..?..
	defb 021h,000h,031h,01eh,000h,006h,064h,000h,008h,026h,004h,00ch,04eh,000h,004h,00eh,002h,01ah,03fh,002h,01bh,0fch,018h,018h	; 95f5  !.1...d..&..N.....?.....

; ----------------------------------------------------------------------
; DATOS dibujo_960D: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 19 de la lista 0x86A1 (p00:4D92, p00:4DF5); lo leen p01:6EF2
;   (32 bytes)
;   0x960d..0x962d  (32 bytes)
DATA_dibujo_960D:
	defb 0bfh,0c0h,0abh,0c0h,0ffh,0ffh,096h,003h,003h,002h,0ffh,0ffh,0c0h,080h,0ffh,0ffh	; 960d  ................
	defb 0bfh,0c1h,097h,0c1h,0feh,0ffh,0beh,003h,002h,003h,0feh,0ffh,0c6h,087h,0fah,0fbh	; 961d  ................

; ----------------------------------------------------------------------
; DATOS dibujo_962D: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 20 de la lista 0x86A1 (p00:4D92, p00:4DF5); lo leen p01:6EF2
;   (16 bytes)
;   0x962d..0x963d  (16 bytes)
DATA_dibujo_962D:
	defb 0dfh,0dfh,0dfh,0dfh,0dfh,05fh,05fh,05fh,07fh,07fh,07fh,07fh,07fh,05fh,05fh,05fh	; 962d  .....___.....___

; ----------------------------------------------------------------------
; DATOS dibujo_963D: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 21 de la lista 0x86A1 (p00:4D92, p00:4DF5); lo leen p01:6EF2
;   (16 bytes)
;   0x963d..0x964d  (16 bytes)
DATA_dibujo_963D:
	defb 0fah,0fah,0fah,0fah,0fah,0fbh,0fah,0fbh,0fah,0fbh,0fah,0fbh,0feh,0ffh,0feh,0ffh	; 963d  ................

; ----------------------------------------------------------------------
; DATOS dibujo_964D: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 22 de la lista 0x86A1 (p00:4D92, p00:4DF5); lo leen p01:6EF2
;   (16 bytes)
;   0x964d..0x965d  (16 bytes)
DATA_dibujo_964D:
	defb 080h,0ffh,0aah,0d5h,07fh,07fh,042h,07fh,07eh,043h,07fh,07fh,07fh,060h,07fh,05fh	; 964d  ......B.~C...`._

; ----------------------------------------------------------------------
; DATOS resto_965D: lo apuntan con el banco puesto p01:6FFC (0x965D), p01:7067
;   (0x9663), p01:7008 (0x9667), p01:7014 (0x9677), p01:7020 (0x9677),
;   p01:6FE0 (0x96AB); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p01:6FFC, p01:7067, p01:7008, p01:7014, p01:7020,
;   p01:6FE0 (2117 bytes)
;   0x965d..0x9ea2  (2117 bytes)
DATA_resto_965D:
	defb 080h,0a0h,0a1h,08bh,080h,080h,080h,09fh,08bh,080h,081h,082h,082h,082h,082h,082h	; 965d  ................
	defb 082h,083h,080h,080h,080h,080h,080h,09eh,0bfh,080h,0bfh,084h,085h,085h,085h,085h	; 966d  ................
	defb 0beh,087h,087h,087h,087h,088h,086h,08ah,08ah,08ah,08ah,089h,086h,0bdh,0b9h,0bah	; 967d  ................
	defb 0bah,0bch,0b7h,0b8h,0bbh,080h,080h,080h,080h,080h,080h,080h,080h,080h,08ch,08eh	; 968d  ................
	defb 090h,092h,08dh,08fh,091h,093h,094h,096h,098h,09ah,095h,097h,099h,09bh,040h,048h	; 969d  ..............@H
	defb 038h,060h,020h,058h,020h,050h,028h,060h,010h,050h,010h,048h,030h,060h,018h,048h	; 96ad  8` X P(`.P.H0`.H
	defb 018h,060h,035h,000h,081h,020h,00ch,021h,081h,022h,00ah,000h,08eh,023h,028h,029h	; 96bd  .`5.. .!."...#()
	defb 029h,02ah,02bh,02ch,02dh,02bh,02eh,029h,029h,02fh,024h,00ah,000h,08eh,023h,030h	; 96cd  )*+,-+.))/$...#0
	defb 025h,025h,031h,032h,033h,033h,034h,035h,025h,025h,036h,024h,00ah,000h,08eh,023h	; 96dd  %%123345%%6$...#
	defb 037h,025h,025h,038h,026h,039h,027h,026h,03ah,025h,025h,03bh,024h,00ah,000h,083h	; 96ed  7%%8&9'&:%%.$...
	defb 023h,03ch,03dh,003h,03eh,082h,03fh,040h,003h,03eh,083h,041h,042h,024h,00ah,000h	; 96fd  #<=.>.?@.>.AB$..
	defb 083h,023h,043h,007h,008h,008h,083h,00bh,044h,024h,00ah,000h,086h,023h,043h,009h	; 970d  .#C.....D$...#C.
	defb 00ah,00ah,002h,003h,003h,085h,001h,00ah,00ch,044h,024h,00ah,000h,083h,023h,045h	; 971d  .........D$...#E
	defb 009h,008h,00ah,083h,00ch,046h,024h,00ah,000h,083h,023h,047h,009h,008h,00ah,083h	; 972d  .....F$...#G....
	defb 00ch,048h,024h,00ah,000h,083h,023h,053h,009h,008h,00ah,083h,00ch,049h,024h,00ah	; 973d  .H$...#S.....I$.
	defb 000h,083h,023h,054h,009h,008h,00ah,083h,00ch,04ah,024h,00ah,000h,085h,023h,054h	; 974d  ..#T.....J$...#T
	defb 009h,00ah,00fh,006h,00ah,083h,00ch,04ah,024h,00ah,000h,085h,023h,054h,009h,00ah	; 975d  .......J$...#T..
	defb 010h,006h,00ah,083h,00ch,04ah,024h,00ah,000h,085h,023h,055h,009h,00ah,010h,006h	; 976d  .....J$...#U....
	defb 00ah,083h,00ch,04bh,024h,00ah,000h,085h,023h,056h,009h,00ah,010h,006h,00ah,083h	; 977d  ...K$...#V......
	defb 00ch,04ch,024h,00ah,000h,085h,023h,057h,009h,00ah,011h,006h,00ah,083h,00ch,04dh	; 978d  .L$...#W.......M
	defb 024h,00ah,000h,083h,023h,04eh,009h,008h,00ah,083h,00ch,04fh,024h,00ah,000h,083h	; 979d  $...#N.....O$...
	defb 023h,050h,009h,008h,00ah,083h,00ch,04fh,024h,00ah,000h,083h,023h,050h,009h,008h	; 97ad  #P.....O$...#P..
	defb 00ah,083h,00ch,04fh,024h,00ah,000h,083h,023h,050h,009h,008h,00ah,083h,00ch,04fh	; 97bd  ...O$...#P.....O
	defb 024h,00ah,000h,083h,023h,051h,004h,003h,005h,082h,00dh,00eh,003h,005h,083h,006h	; 97cd  $...#Q..........
	defb 052h,024h,01dh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,03ch,042h	; 97dd  R$............<B
	defb 042h,042h,042h,042h,03ch,000h,008h,018h,008h,008h,008h,008h,008h,000h,03ch,042h	; 97ed  BBBB<.........<B
	defb 002h,01ch,020h,040h,07eh,000h,03ch,042h,002h,01ch,002h,042h,03ch,000h,00ch,014h	; 97fd  .. @~.<B...B<...
	defb 024h,044h,07eh,004h,004h,000h,07eh,040h,07ch,002h,002h,042h,03ch,000h,03ch,042h	; 980d  $D~...~@|..B<.<B
	defb 040h,07ch,042h,042h,03ch,000h,07eh,042h,044h,008h,010h,010h,010h,000h,03ch,042h	; 981d  @|BB<.~BD.....<B
	defb 042h,03ch,042h,042h,03ch,000h,03ch,042h,042h,03eh,002h,042h,03ch,000h,018h,024h	; 982d  B<BB<.<BB>.B<..$
	defb 042h,042h,07eh,042h,042h,000h,07ch,042h,042h,07ch,042h,042h,07ch,000h,01ch,022h	; 983d  BB~BB.|BB|BB|.."
	defb 040h,040h,040h,022h,01ch,000h,078h,044h,042h,042h,042h,044h,078h,000h,07eh,040h	; 984d  @@@"..xDBBBDx.~@
	defb 040h,07ch,040h,040h,07eh,000h,07eh,040h,040h,07ch,040h,040h,040h,000h,01ch,022h	; 985d  @|@@~.~@@|@@@.."
	defb 040h,046h,042h,022h,01ch,000h,042h,042h,042h,07eh,042h,042h,042h,000h,038h,010h	; 986d  @FB"..BBB~BBB.8.
	defb 010h,010h,010h,010h,038h,000h,002h,002h,002h,002h,002h,042h,03ch,000h,042h,044h	; 987d  ....8......B<.BD
	defb 048h,070h,048h,044h,042h,000h,040h,040h,040h,040h,040h,040h,07eh,000h,041h,063h	; 988d  HpHDB.@@@@@@~.Ac
	defb 055h,049h,041h,041h,041h,000h,042h,062h,052h,04ah,046h,042h,042h,000h,03ch,042h	; 989d  UIAAA.BbRJFBB.<B
	defb 042h,042h,042h,042h,03ch,000h,07ch,042h,042h,042h,07ch,040h,040h,000h,03ch,042h	; 98ad  BBBB<.|BBB|@@.<B
	defb 042h,042h,04ah,044h,03ah,000h,07ch,042h,042h,042h,07ch,044h,042h,000h,03ch,042h	; 98bd  BBJD:.|BBB|DB.<B
	defb 040h,03ch,002h,042h,03ch,000h,07fh,008h,008h,008h,008h,008h,008h,000h,042h,042h	; 98cd  @<.B<.........BB
	defb 042h,042h,042h,042h,03ch,000h,042h,042h,042h,042h,042h,024h,018h,000h,049h,049h	; 98dd  BBBB<.BBBBB$..II
	defb 049h,049h,049h,036h,022h,000h,042h,042h,024h,018h,024h,042h,042h,000h,041h,041h	; 98ed  III6".BB$.$BB.AA
	defb 022h,01ch,008h,008h,008h,000h,07eh,002h,004h,008h,010h,020h,07eh,000h,010h,078h	; 98fd  ".....~.... ~..x
	defb 020h,03ch,06ah,0b2h,064h,000h,000h,080h,084h,082h,082h,0a0h,040h,020h,01ch,000h	; 990d   <j.d.......@ ..
	defb 01ch,062h,002h,004h,018h,000h,03ch,000h,01ch,064h,008h,018h,06eh,000h,024h,07ah	; 991d  .b....<..d..n.$z
	defb 020h,03ch,062h,0a2h,06ch,000h,008h,044h,072h,0cah,048h,048h,050h,000h,010h,07ch	; 992d   <b.l..Dr.HHP..|
	defb 008h,07eh,004h,040h,03ch,000h,008h,010h,020h,040h,020h,010h,008h,000h,084h,0beh	; 993d  .~.@<... @ .....
	defb 084h,084h,084h,084h,048h,000h,078h,004h,008h,000h,000h,040h,03ch,000h,010h,07ch	; 994d  ....H.x....@<..|
	defb 008h,004h,000h,040h,03ch,000h,040h,020h,020h,020h,020h,022h,01ch,000h,008h,0feh	; 995d  ...@<.@    "....
	defb 018h,028h,018h,008h,030h,000h,048h,048h,0feh,048h,048h,040h,03ch,000h,04ch,034h	; 996d  .(..0.HH.HH@<.L4
	defb 008h,0feh,010h,020h,01ch,000h,040h,060h,0ceh,040h,040h,050h,08eh,000h,010h,07eh	; 997d  ... ..@`.@@P...~
	defb 010h,03ch,062h,002h,01ch,000h,000h,01ch,0e2h,002h,002h,004h,018h,000h,000h,0feh	; 998d  .<b.............
	defb 008h,010h,020h,020h,01ch,000h,040h,026h,038h,020h,040h,040h,03eh,000h,044h,0f2h	; 999d  ..  ..@&8 @@>.D.
	defb 044h,044h,09ch,026h,018h,000h,040h,04eh,050h,040h,040h,050h,04eh,000h,050h,05ch	; 99ad  DD.&..@NP@@PN.P\
	defb 072h,052h,0d6h,0aah,064h,000h,020h,02ch,0f2h,022h,066h,06ah,0a4h,000h,038h,054h	; 99bd  rR..d. ,."fj..8T
	defb 092h,092h,0a2h,0a2h,044h,000h,084h,0beh,084h,084h,09ch,0a6h,058h,000h,000h,0e4h	; 99cd  ....D.......X...
	defb 026h,044h,084h,088h,070h,000h,030h,008h,010h,054h,08ah,08ah,030h,000h,000h,000h	; 99dd  &D..p.0..T..0...
	defb 060h,050h,088h,006h,000h,000h,0beh,084h,0beh,084h,09ch,0a6h,058h,008h,07ch,008h	; 99ed  `P..........X.|.
	defb 07ch,008h,038h,04ch,030h,000h,070h,014h,014h,07eh,094h,0a4h,048h,000h,020h,0f4h	; 99fd  |.8L0.p..~..H. .
	defb 022h,060h,0a4h,044h,038h,000h,050h,05ch,072h,052h,0d2h,0a2h,064h,000h,020h,078h	; 9a0d  "`.D8.P\rR..d. x
	defb 020h,078h,020h,022h,01ch,000h,010h,04ch,052h,0e2h,024h,010h,008h,000h,020h,0bch	; 9a1d   x "...LR.$... .
	defb 0d2h,092h,092h,094h,020h,000h,008h,00eh,008h,008h,038h,04ch,032h,000h,030h,00ch	; 9a2d  .... .....8L2.0.
	defb 040h,05ch,062h,002h,03ch,000h,024h,042h,042h,052h,022h,004h,038h,000h,03ch,008h	; 9a3d  @\b.<.$BBR".8.<.
	defb 01ch,062h,012h,02ah,03ch,000h,024h,02ch,0f4h,024h,064h,064h,0a2h,000h,03ch,008h	; 9a4d  .b.*<.$,.$dd..<.
	defb 010h,03ch,042h,002h,03ch,000h,020h,02ch,0f2h,022h,062h,062h,0a4h,000h,010h,07ch	; 9a5d  .<B.<. ,."bb...|
	defb 020h,03ch,048h,040h,03ch,000h,010h,020h,020h,070h,052h,092h,08ch,001h,00ah,044h	; 9a6d   <H@<..  pR....D
	defb 072h,0cah,048h,048h,050h,001h,012h,07ch,008h,07eh,004h,040h,03ch,000h,010h,024h	; 9a7d  r.HHP..|.~.@<..$
	defb 04ah,084h,040h,020h,010h,002h,085h,0beh,084h,084h,084h,084h,048h,002h,075h,00ah	; 9a8d  J.@ ........H.u.
	defb 000h,000h,000h,080h,078h,002h,015h,07eh,008h,004h,000h,040h,03ch,002h,045h,022h	; 9a9d  ....x..~...@<.E"
	defb 020h,020h,020h,022h,01ch,002h,009h,0feh,018h,028h,018h,008h,030h,002h,049h,048h	; 9aad     ".....(..0.IH
	defb 0feh,048h,048h,040h,03ch,002h,04dh,034h,008h,0feh,010h,020h,01ch,002h,045h,062h	; 9abd  .HH@<.M4... ..Eb
	defb 0ceh,040h,040h,050h,08eh,002h,011h,07eh,010h,03ch,062h,002h,01ch,002h,005h,01eh	; 9acd  .@@P...~.<b.....
	defb 0e2h,002h,002h,004h,018h,002h,005h,0feh,008h,010h,020h,020h,01ch,002h,045h,022h	; 9add  ..........  ..E"
	defb 024h,038h,040h,040h,03eh,001h,08ah,0bdh,088h,088h,098h,0ach,050h,001h,002h,0e4h	; 9aed  $8@@>.......P...
	defb 026h,044h,084h,088h,070h,000h,031h,00ah,010h,054h,08ah,08ah,030h,000h,002h,001h	; 9afd  &D..p.1..T..0...
	defb 064h,052h,088h,006h,000h,002h,0bdh,088h,0bch,088h,098h,0ach,058h,002h,08dh,0beh	; 9b0d  dR..........X...
	defb 088h,088h,098h,0ach,050h,002h,005h,0e2h,026h,044h,084h,088h,070h,002h,035h,00ah	; 9b1d  ....P...&D..p.5.
	defb 010h,054h,08ah,08ah,030h,000h,004h,00ah,064h,050h,088h,006h,000h,002h,0bdh,08ah	; 9b2d  .T..0...dP......
	defb 0bch,088h,098h,0ach,058h,000h,000h,010h,03ch,010h,03ch,05ah,034h,000h,000h,000h	; 9b3d  ....X...<.<Z4...
	defb 000h,044h,042h,052h,020h,000h,000h,018h,000h,018h,024h,004h,008h,000h,000h,010h	; 9b4d  .DBR .....$.....
	defb 008h,03eh,004h,01ch,026h,000h,000h,000h,03ah,010h,01ch,032h,076h,000h,000h,000h	; 9b5d  .>..&...:..2v...
	defb 000h,01ch,062h,002h,00ch,000h,000h,000h,048h,02eh,072h,014h,008h,000h,000h,000h	; 9b6d  ..b.....H.r.....
	defb 050h,05ch,06ah,04ch,010h,000h,000h,008h,00eh,008h,018h,02eh,010h,000h,000h,010h	; 9b7d  P\jL............
	defb 014h,07ah,032h,052h,014h,000h,0feh,012h,014h,010h,010h,020h,040h,000h,006h,018h	; 9b8d  .z2R....... @...
	defb 030h,0d0h,010h,010h,010h,000h,010h,0feh,082h,082h,002h,004h,038h,000h,000h,0feh	; 9b9d  0...........8...
	defb 010h,010h,010h,010h,0feh,000h,008h,0feh,008h,018h,028h,048h,088h,000h,010h,07eh	; 9bad  ..........(H...~
	defb 012h,012h,022h,022h,044h,000h,020h,0fch,010h,010h,07eh,008h,008h,000h,03eh,042h	; 9bbd  ..""D. ...~...>B
	defb 082h,002h,004h,008h,030h,000h,040h,07eh,044h,084h,004h,008h,030h,000h,000h,0feh	; 9bcd  ....0.@~D...0...
	defb 002h,002h,002h,002h,0feh,000h,044h,0feh,044h,044h,044h,008h,030h,000h,0c0h,020h	; 9bdd  ......D.DDD.0..
	defb 0c2h,022h,004h,018h,0e0h,000h,0feh,002h,004h,008h,018h,024h,0c2h,000h,040h,0feh	; 9bed  .".........$..@.
	defb 042h,044h,044h,040h,03eh,000h,082h,042h,042h,022h,004h,008h,030h,000h,03eh,022h	; 9bfd  BDD@>..BB"..0.>"
	defb 0e2h,012h,00ch,008h,070h,000h,00ch,0f0h,010h,0feh,010h,010h,0e0h,000h,0a2h,0a2h	; 9c0d  ....p...........
	defb 0a2h,052h,004h,008h,070h,000h,07ch,000h,0feh,008h,008h,010h,060h,000h,040h,040h	; 9c1d  .R..p.|.....`.@@
	defb 070h,048h,044h,040h,040h,000h,008h,0feh,008h,008h,008h,010h,060h,000h,000h,07ch	; 9c2d  pHD@@.......`..|
	defb 000h,000h,000h,000h,0feh,000h,0feh,002h,022h,014h,008h,034h,0c2h,000h,07ch,000h	; 9c3d  ........"..4..|.
	defb 0feh,004h,038h,054h,092h,000h,004h,004h,004h,004h,008h,010h,0e0h,000h,048h,048h	; 9c4d  ..8T..........HH
	defb 044h,044h,044h,082h,082h,000h,080h,086h,0f8h,080h,080h,080h,07eh,000h,0feh,002h	; 9c5d  DDD.........~...
	defb 002h,002h,004h,008h,030h,000h,020h,050h,048h,088h,004h,002h,002h,000h,010h,0feh	; 9c6d  ....0. PH.......
	defb 010h,054h,054h,054h,092h,000h,0feh,002h,002h,004h,028h,010h,008h,000h,078h,006h	; 9c7d  .TTT......(...x.
	defb 070h,00ch,000h,078h,006h,000h,020h,020h,040h,044h,084h,082h,0feh,000h,004h,044h	; 9c8d  p..x..  @D.....D
	defb 024h,018h,018h,024h,0c0h,000h,0feh,020h,020h,0feh,020h,020h,01eh,000h,040h,0feh	; 9c9d  $..$...  .  ..@.
	defb 042h,044h,028h,020h,020h,000h,000h,0f8h,008h,008h,008h,008h,0feh,000h,000h,0feh	; 9cad  BD(  ...........
	defb 002h,0feh,002h,002h,0feh,000h,0feh,000h,0feh,002h,004h,008h,030h,000h,042h,042h	; 9cbd  ............0.BB
	defb 042h,042h,002h,004h,008h,000h,010h,050h,050h,052h,052h,094h,098h,000h,080h,080h	; 9ccd  BB.....PPRR.....
	defb 080h,080h,084h,098h,0e0h,000h,000h,0feh,082h,082h,082h,082h,0feh,000h,0feh,082h	; 9cdd  ................
	defb 082h,002h,004h,008h,030h,000h,0feh,002h,0feh,002h,004h,008h,070h,000h,0c0h,022h	; 9ced  ....0.......p.."
	defb 002h,002h,004h,008h,0f0h,001h,012h,07eh,012h,012h,022h,022h,044h,001h,022h,0fch	; 9cfd  .......~..""D.".
	defb 010h,010h,07eh,008h,008h,001h,03eh,044h,084h,004h,008h,010h,060h,001h,042h,07eh	; 9d0d  ..~...>D....`.B~
	defb 044h,084h,004h,008h,030h,001h,002h,0fch,004h,004h,004h,004h,0fch,001h,046h,0feh	; 9d1d  D...0.........F.
	defb 044h,044h,044h,008h,030h,000h,0c5h,020h,0c2h,022h,004h,018h,0e0h,005h,005h,07eh	; 9d2d  DDD.0.. .".....~
	defb 004h,008h,018h,024h,0c2h,005h,045h,0feh,042h,044h,044h,040h,03eh,005h,080h,042h	; 9d3d  ...$..E.BDD@>..B
	defb 042h,022h,004h,008h,030h,005h,03eh,022h,0e2h,012h,00ch,008h,070h,005h,00ch,0f0h	; 9d4d  B"..0.>"....p...
	defb 010h,0feh,010h,010h,0e0h,000h,0a5h,0a0h,0a2h,052h,004h,008h,070h,005h,07ch,000h	; 9d5d  .........R..p.|.
	defb 0feh,008h,008h,010h,060h,000h,045h,045h,070h,048h,044h,040h,040h,005h,04dh,048h	; 9d6d  ....`.EEpHD@@.MH
	defb 044h,044h,044h,082h,082h,005h,085h,086h,0f8h,080h,080h,080h,07eh,005h,005h,0feh	; 9d7d  DDD.........~...
	defb 002h,002h,004h,008h,030h,000h,025h,055h,048h,088h,004h,002h,002h,005h,015h,0feh	; 9d8d  ....0.%UH.......
	defb 010h,054h,054h,054h,092h,005h,015h,0feh,082h,082h,002h,004h,038h,002h,04dh,04ah	; 9d9d  .TTT........8.MJ
	defb 044h,044h,044h,082h,082h,002h,085h,086h,0f8h,080h,080h,080h,07eh,002h,005h,0feh	; 9dad  DDD.........~...
	defb 002h,002h,004h,008h,030h,000h,022h,055h,04ah,088h,004h,002h,002h,002h,015h,0feh	; 9dbd  ....0."UJ.......
	defb 010h,054h,054h,054h,092h,000h,000h,000h,03eh,002h,00ch,008h,010h,000h,000h,000h	; 9dcd  .TTT....>.......
	defb 006h,008h,038h,008h,008h,000h,000h,000h,008h,03eh,022h,002h,01ch,000h,000h,000h	; 9ddd  ..8......>".....
	defb 000h,03eh,008h,008h,03eh,000h,000h,000h,004h,03eh,00ch,014h,024h,000h,000h,000h	; 9ded  .>..>....>..$...
	defb 010h,07ch,014h,024h,048h,000h,000h,000h,020h,03eh,064h,004h,008h,000h,000h,000h	; 9dfd  .|.$H... >d.....
	defb 000h,02ah,02ah,002h,01ch,000h,000h,000h,020h,07eh,014h,008h,008h,000h,000h,000h	; 9e0d  .**..... ~......
	defb 000h,03ch,004h,004h,07eh,000h,000h,000h,07ch,004h,07ch,004h,07ch,000h,000h,000h	; 9e1d  .<..~...|.|.|...
	defb 07ch,044h,004h,008h,030h,018h,018h,018h,018h,018h,000h,018h,000h,000h,03eh,063h	; 9e2d  |D..0.........>c
	defb 063h,00eh,008h,000h,008h,000h,07ch,044h,05ch,050h,050h,050h,070h,000h,00eh,00ah	; 9e3d  c.....|D\PPPp...
	defb 00ah,00ah,03ah,022h,03eh,000h,000h,000h,000h,000h,018h,018h,000h,000h,000h,000h	; 9e4d  ..:">...........
	defb 000h,000h,000h,020h,010h,000h,000h,000h,000h,000h,060h,090h,060h,000h,060h,020h	; 9e5d  ... ......`.`.`
	defb 040h,000h,000h,000h,000h,000h,070h,060h,040h,040h,040h,060h,070h,000h,00eh,006h	; 9e6d  @.....p`@@@`p...
	defb 002h,002h,002h,006h,00eh,000h,008h,00ch,0feh,0ffh,0feh,00ch,008h,000h,000h,000h	; 9e7d  ................
	defb 000h,07fh,000h,000h,000h,07eh,081h,085h,095h,0bdh,091h,081h,07eh,000h,010h,01eh	; 9e8d  .....~......~...
	defb 022h,054h,008h,004h,000h	; 9e9d

; ----------------------------------------------------------------------
; DATOS tabla_colores_9EA2: 3 punteros a colores de dibujo (los usa hasta el
;   indice 2; p00:4DA0); lo leen p00:4DA0 (6 bytes)
;   0x9ea2..0x9ea8  (6 bytes)
DATA_tabla_colores_9EA2:
	defw 09ea8h,09eaah,09eaeh	; 9ea2  -> DATA_colores_9EA8 DATA_colores_9EAA DATA_colores_9EAE

; ----------------------------------------------------------------------
; DATOS colores_9EA8: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6F45 (2 bytes)
;   0x9ea8..0x9eaa  (2 bytes)
DATA_colores_9EA8:
	defb 0dfh,0e0h	; 9ea8

; ----------------------------------------------------------------------
; DATOS colores_9EAA: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6F45 (4 bytes)
;   0x9eaa..0x9eae  (4 bytes)
DATA_colores_9EAA:
	defb 05fh,018h,067h,0e0h	; 9eaa

; ----------------------------------------------------------------------
; DATOS colores_9EAE: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6F45 (4 bytes)
;   0x9eae..0x9eb2  (4 bytes)
DATA_colores_9EAE:
	defb 067h,08fh,013h,05ah	; 9eae

; ----------------------------------------------------------------------
; DATOS lista_9EB2: 6 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x9EA2); lo leen p01:6F45 (31 bytes)
;   0x9eb2..0x9ed1  (31 bytes)
DATA_lista_9EB2:
	defb 01ch,000h,001h,0d1h,09eh	; 9eb2
	defb 04bh,000h,01dh,0b1h,09fh	; 9eb7
	defb 04eh,001h,030h,061h,0a0h	; 9ebc
	defb 042h,002h,03eh,041h,0a1h	; 9ec1
	defb 0b7h,001h,040h,061h,0a1h	; 9ec6
	defb 086h,002h,07ah,089h,0a6h	; 9ecb
	defb 0ffh	; 9ed0

; ----------------------------------------------------------------------
; DATOS dibujo_9ED1: 28 caracteres de 8x8 a 1 bit por punto (8 bytes cada
;   uno), ficha 0 de la lista 0x9EB2 (p00:4D92, p00:4DF5); lo leen p01:6F45
;   (224 bytes)
;   0x9ed1..0x9fb1  (224 bytes)
DATA_dibujo_9ED1:
	defb 000h,000h,000h,006h,00fh,01fh,000h,07eh	; 9ed1  .......~
	defb 000h,000h,0f3h,073h,033h,000h,000h,000h	; 9ed9  ...s3...
	defb 000h,000h,09ch,09ch,09ch,000h,000h,000h	; 9ee1  ........
	defb 000h,000h,0e7h,0e7h,0e7h,000h,000h,000h	; 9ee9  ........
	defb 000h,000h,038h,038h,038h,000h,000h,000h	; 9ef1  ..888...
	defb 000h,000h,0f0h,070h,030h,000h,000h,000h	; 9ef9  ...p0...
	defb 000h,000h,0e0h,0e0h,0e0h,000h,000h,000h	; 9f01  ........
	defb 000h,03ch,05ah,066h,066h,066h,066h,042h	; 9f09  .<ZffffB
	defb 024h,066h,066h,066h,066h,05ah,03ch,000h	; 9f11  $ffffZ<.
	defb 000h,008h,018h,018h,018h,018h,018h,008h	; 9f19  ........
	defb 010h,018h,018h,018h,018h,018h,008h,000h	; 9f21  ........
	defb 000h,07ch,03ah,006h,006h,006h,006h,03ah	; 9f29  .|:....:
	defb 05ch,060h,060h,060h,060h,05ch,03eh,000h	; 9f31  \````\>.
	defb 000h,07ch,03ah,006h,006h,006h,006h,07ah	; 9f39  .|:....z
	defb 03ch,006h,006h,006h,006h,03ah,07ch,000h	; 9f41  <....:|.
	defb 000h,042h,066h,066h,066h,066h,066h,05ah	; 9f49  .BfffffZ
	defb 03ch,006h,006h,006h,006h,006h,002h,000h	; 9f51  <.......
	defb 000h,03eh,05ch,060h,060h,060h,060h,05ch	; 9f59  .>\````\
	defb 03ah,006h,006h,006h,006h,03ah,07ch,000h	; 9f61  :....:|.
	defb 000h,03eh,05ch,060h,060h,060h,060h,03ch	; 9f69  .>\````<
	defb 05ah,066h,066h,066h,066h,05ah,03ch,000h	; 9f71  ZffffZ<.
	defb 000h,07ch,03ah,006h,006h,006h,006h,002h	; 9f79  .|:.....
	defb 004h,006h,006h,006h,006h,006h,002h,000h	; 9f81  ........
	defb 000h,03ch,05ah,066h,066h,066h,066h,05ah	; 9f89  .<ZffffZ
	defb 03ch,066h,066h,066h,066h,05ah,03ch,000h	; 9f91  <ffffZ<.
	defb 000h,000h,000h,000h,000h,018h,018h,000h	; 9f99  ........
	defb 000h,000h,000h,000h,000h,000h,000h,000h	; 9fa1  ........
	defb 000h,000h,000h,000h,000h,000h,000h,07eh	; 9fa9  .......~

; ----------------------------------------------------------------------
; DATOS dibujo_9FB1: 11 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 1 de la lista 0x9EB2 (p00:4D92, p00:4DF5) (sigue en el banco
;   47, en 0xA000); lo leen p01:6F45 (79 bytes)
;   0x9fb1..0xa000  (79 bytes)
DATA_dibujo_9FB1:
	defb 000h,000h,001h,000h,000h,000h,007h,000h,00fh,000h,01fh,000h,000h,000h,000h,0ffh	; 9fb1  ................
	defb 0fch,000h,0fch,000h,000h,000h,0f0h,000h,0e0h,000h,0e0h,000h,000h,000h,000h,0ffh	; 9fc1  ................
	defb 0ffh,000h,0c4h,000h,0bdh,000h,0cch,000h,0f5h,000h,08ch,000h,0ffh,000h,000h,0ffh	; 9fd1  ................
	defb 0ffh,000h,02dh,000h,0e5h,000h,069h,000h,0edh,000h,02dh,000h,0ffh,000h,000h,0ffh	; 9fe1  ..-...i...-.....
	defb 0f8h,000h,018h,000h,068h,000h,068h,000h,068h,000h,018h,000h,0f8h,000h,000h	; 9ff1  ....h.h.h......
