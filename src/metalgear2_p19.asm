; ==========================================================================
; METAL GEAR 2 SOLID SNAKE - Konami (1990) - MSX2 - MegaROM RC-767 de 512 KB (Konami SCC) - banco 19 (se ejecuta en 0xa000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x0a000


; ----------------------------------------------------------------------
; DATOS partitura_A000: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x74 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xa000..0xa006  (6 bytes)
DATA_partitura_A000:
	defb 060h,0d3h,000h,0d4h,060h,0b0h	; a000

; ----------------------------------------------------------------------
; DATOS partitura_A006: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x74 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (16 bytes)
;   0xa006..0xa016  (16 bytes)
DATA_partitura_A006:
	defb 090h,060h,0fbh,006h,0d5h,010h,060h,0b0h,0d4h,040h,090h,0d3h,020h,0d4h,090h,070h	; a006  .`....`..@.. ..p

; ----------------------------------------------------------------------
; DATOS partitura_A016: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x74 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (10 bytes)
;   0xa016..0xa020  (10 bytes)
DATA_partitura_A016:
	defb 0d3h,000h,0d4h,070h,0d5h,070h,0d4h,000h,050h,0a0h	; a016  ...p.p..P.

; ----------------------------------------------------------------------
; DATOS partitura_A020: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x74 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xa020..0xa023  (3 bytes)
DATA_partitura_A020:
	defb 0fdh,0b0h,09fh	; a020

; ----------------------------------------------------------------------
; DATOS partitura_A023: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x74 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xa023..0xa02e  (11 bytes)
DATA_partitura_A023:
	defb 0feh,001h,0f5h,0f0h,003h,023h,0e9h,008h,0eah,00ch,0ebh	; a023  .....#.....

; ----------------------------------------------------------------------
; DATOS partitura_A02E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x74 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa02e..0xa02f  (1 bytes)
DATA_partitura_A02E:
	defb 019h	; a02e

; ----------------------------------------------------------------------
; DATOS partitura_A02F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x74 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xa02f..0xa040  (17 bytes)
DATA_partitura_A02F:
	defb 05dh,001h,0d6h,004h,002h,0d2h,083h,0f0h,000h,0d8h,0eah,009h,0ebh,009h,065h,004h	; a02f  ].............e.
	defb 0f4h	; a03f

; ----------------------------------------------------------------------
; DATOS partitura_A040: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x74 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xa040..0xa046  (6 bytes)
DATA_partitura_A040:
	defb 023h,00ah,01ah,052h,0c1h,0d4h	; a040

; ----------------------------------------------------------------------
; DATOS partitura_A046: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x74 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xa046..0xa051  (11 bytes)
DATA_partitura_A046:
	defb 090h,070h,040h,0b0h,040h,0a0h,040h,090h,070h,040h,0b0h	; a046  .p@.@.@.p@.

; ----------------------------------------------------------------------
; DATOS partitura_A051: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x74 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (13 bytes)
;   0xa051..0xa05e  (13 bytes)
DATA_partitura_A051:
	defb 040h,0a0h,040h,090h,070h,040h,0b0h,040h,0a0h,040h,090h,070h,040h	; a051  @.@.p@.@.@.p@

; ----------------------------------------------------------------------
; DATOS partitura_A05E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x74 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa05e..0xa05f  (1 bytes)
DATA_partitura_A05E:
	defb 0b0h	; a05e

; ----------------------------------------------------------------------
; DATOS partitura_A05F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x74 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa05f..0xa060  (1 bytes)
DATA_partitura_A05F:
	defb 040h	; a05f

; ----------------------------------------------------------------------
; DATOS partitura_A060: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x74 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (9 bytes)
;   0xa060..0xa069  (9 bytes)
DATA_partitura_A060:
	defb 0a0h,040h,090h,070h,040h,0b0h,040h,0a0h,040h	; a060  .@.p@.@.@

; ----------------------------------------------------------------------
; DATOS partitura_A069: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x74 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xa069..0xa082  (25 bytes)
DATA_partitura_A069:
	defb 090h,070h,040h,0b0h,040h,0a0h,040h,090h,070h,040h,0b0h,040h,0a0h,040h,090h,0fbh	; a069  .p@.@.@.p@.@.@..
	defb 002h,0f0h,003h,021h,0eah,00ch,0ebh,019h,05dh	; a079  ...!....]

; ----------------------------------------------------------------------
; DATOS partitura_A082: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x74 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (13 bytes)
;   0xa082..0xa08f  (13 bytes)
DATA_partitura_A082:
	defb 001h,0d6h,004h,002h,0d2h,0a3h,0f0h,000h,0d8h,0eah,009h,0ebh,009h	; a082  .............

; ----------------------------------------------------------------------
; DATOS partitura_A08F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x74 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xa08f..0xa091  (2 bytes)
DATA_partitura_A08F:
	defb 065h,004h	; a08f

; ----------------------------------------------------------------------
; DATOS partitura_A091: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x74 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (12 bytes)
;   0xa091..0xa09d  (12 bytes)
DATA_partitura_A091:
	defb 0f4h,023h,00ah,01ah,052h,0f5h,0d3h,010h,0d4h,060h,0d3h,000h	; a091  .#..R....`..

; ----------------------------------------------------------------------
; DATOS partitura_A09D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x74 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa09d..0xa0a5  (8 bytes)
DATA_partitura_A09D:
	defb 0d4h,060h,0b0h,090h,060h,0fbh,003h,0d3h	; a09d  .`..`...

; ----------------------------------------------------------------------
; DATOS partitura_A0A5: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x74 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (34 bytes)
;   0xa0a5..0xa0c7  (34 bytes)
DATA_partitura_A0A5:
	defb 010h,0d4h,060h,0d3h,000h,0f0h,003h,021h,0eah,00ch,0ebh,019h,05dh,001h,0d6h,004h	; a0a5  ..`....!....]...
	defb 002h,0d2h,0b3h,0f0h,000h,0d8h,0eah,009h,0ebh,009h,065h,004h,0f4h,023h,00ah,01ah	; a0b5  ..........e..#..
	defb 052h,0f5h	; a0c5

; ----------------------------------------------------------------------
; DATOS partitura_A0C7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x74 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (20 bytes)
;   0xa0c7..0xa0db  (20 bytes)
DATA_partitura_A0C7:
	defb 0d3h,010h,0d4h,060h,0d3h,000h,0d4h,060h,0b0h,090h,060h,0fbh,003h,0d3h,010h,0d4h	; a0c7  ...`...`..`.....
	defb 060h,0d3h,000h,0f0h	; a0d7

; ----------------------------------------------------------------------
; DATOS partitura_A0DB: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x74 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (14 bytes)
;   0xa0db..0xa0e9  (14 bytes)
DATA_partitura_A0DB:
	defb 003h,021h,0eah,00ch,0ebh,019h,05dh,001h,0d6h,004h,002h,0d2h,0a3h,0f0h	; a0db  .!....].......

; ----------------------------------------------------------------------
; DATOS partitura_A0E9: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x74 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (10 bytes)
;   0xa0e9..0xa0f3  (10 bytes)
DATA_partitura_A0E9:
	defb 000h,0d8h,0eah,008h,0ebh,009h,065h,004h,0f4h,023h	; a0e9  ......e..#

; ----------------------------------------------------------------------
; DATOS partitura_A0F3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x74 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (26 bytes)
;   0xa0f3..0xa10d  (26 bytes)
DATA_partitura_A0F3:
	defb 00ah,01ah,052h,0f5h,0d3h,010h,0d4h,060h,0d3h,000h,0d4h,060h,0b0h,090h,060h,0fbh	; a0f3  ..R....`...`..`.
	defb 003h,0d3h,010h,0d4h,060h,0d3h,000h,0f0h,003h,021h	; a103  ....`....!

; ----------------------------------------------------------------------
; DATOS partitura_A10D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x74 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (16 bytes)
;   0xa10d..0xa11d  (16 bytes)
DATA_partitura_A10D:
	defb 0eah,00ch,0ebh,019h,05dh,001h,0d6h,004h,002h,0d2h,0b3h,0f0h,000h,0d8h,0eah,009h	; a10d  ....]...........

; ----------------------------------------------------------------------
; DATOS partitura_A11D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x74 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (23 bytes)
;   0xa11d..0xa134  (23 bytes)
DATA_partitura_A11D:
	defb 0ebh,009h,065h,004h,0f4h,023h,00ah,01ah,052h,0f5h,0d3h,010h,0d4h,060h,0d3h,000h	; a11d  ..e..#..R....`..
	defb 0d4h,060h,0b0h,090h,060h,0fbh,002h	; a12d

; ----------------------------------------------------------------------
; DATOS partitura_A134: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x74 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xa134..0xa136  (2 bytes)
DATA_partitura_A134:
	defb 0eah,006h	; a134

; ----------------------------------------------------------------------
; DATOS partitura_A136: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x74 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (5 bytes)
;   0xa136..0xa13b  (5 bytes)
DATA_partitura_A136:
	defb 0d5h,010h,060h,0b0h,0d4h	; a136

; ----------------------------------------------------------------------
; DATOS partitura_A13B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x74 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (47 bytes)
;   0xa13b..0xa16a  (47 bytes)
DATA_partitura_A13B:
	defb 040h,090h,0d3h,020h,0d4h,090h,070h,0d3h,000h,0d4h,070h,0fdh,023h,0a0h,0d0h,0e9h	; a13b  @.. ..p...p.#...
	defb 008h,061h,0b0h,000h,062h,0a0h,000h,060h,0e9h,004h,000h,000h,0e9h,008h,000h,0b0h	; a14b  .a..b..`........
	defb 020h,0b0h,000h,0b0h,000h,062h,0a0h,000h,060h,0e9h,004h,000h,000h,0e9h,008h	; a15b   ....b..`......

; ----------------------------------------------------------------------
; DATOS partitura_A16A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x74 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xa16a..0xa170  (6 bytes)
DATA_partitura_A16A:
	defb 000h,0b0h,0e9h,004h,030h,030h	; a16a

; ----------------------------------------------------------------------
; DATOS partitura_A170: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x74 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (47 bytes)
;   0xa170..0xa19f  (47 bytes)
DATA_partitura_A170:
	defb 0e9h,008h,062h,0b0h,0fah,0f0h,003h,024h,0e9h,008h,0eah,00ch,0ebh,019h,05dh,002h	; a170  ..b....$......].
	defb 0d6h,004h,002h,0d2h,053h,0f0h,000h,0d8h,0ebh,009h,067h,002h,0d5h,0b0h,090h,060h	; a180  ....S.....g....`
	defb 0f5h,0d4h,010h,0d5h,060h,0d4h,000h,0d5h,060h,0b0h,090h,060h,0fbh,003h,0f0h	; a190  ....`...`..`...

; ----------------------------------------------------------------------
; DATOS partitura_A19F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x74 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (19 bytes)
;   0xa19f..0xa1b2  (19 bytes)
DATA_partitura_A19F:
	defb 003h,024h,0ebh,019h,05dh,002h,0d6h,004h,002h,0d2h,073h,0f0h,000h,0d8h,0ebh,009h	; a19f  .$..].....s.....
	defb 067h,002h,0d5h	; a1af

; ----------------------------------------------------------------------
; DATOS partitura_A1B2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x74 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa1b2..0xa1b3  (1 bytes)
DATA_partitura_A1B2:
	defb 0b0h	; a1b2

; ----------------------------------------------------------------------
; DATOS partitura_A1B3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x74 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xa1b3..0xa1b6  (3 bytes)
DATA_partitura_A1B3:
	defb 090h,060h,0fah	; a1b3

; ----------------------------------------------------------------------
; DATOS partitura_A1B6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (13 bytes)
;   0xa1b6..0xa1c3  (13 bytes)
DATA_partitura_A1B6:
	defb 0feh,004h,0f5h,0e9h,001h,035h,045h,055h,0e9h,009h,061h,003h,001h	; a1b6  .....5EU..a..

; ----------------------------------------------------------------------
; DATOS partitura_A1C3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xa1c3..0xa1c6  (3 bytes)
DATA_partitura_A1C3:
	defb 021h,003h,0a3h	; a1c3

; ----------------------------------------------------------------------
; DATOS partitura_A1C6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (13 bytes)
;   0xa1c6..0xa1d3  (13 bytes)
DATA_partitura_A1C6:
	defb 001h,0a1h,001h,0a1h,003h,0fbh,003h,0e9h,001h,035h,045h,055h,0e9h	; a1c6  .........5EU.

; ----------------------------------------------------------------------
; DATOS partitura_A1D3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (16 bytes)
;   0xa1d3..0xa1e3  (16 bytes)
DATA_partitura_A1D3:
	defb 009h,061h,003h,001h,021h,003h,0a3h,001h,0a1h,001h,0a1h,070h,070h,0b1h,0f5h,0e9h	; a1d3  .a..!......pp...

; ----------------------------------------------------------------------
; DATOS partitura_A1E3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xa1e3..0xa1f5  (18 bytes)
DATA_partitura_A1E3:
	defb 009h,063h,071h,021h,073h,073h,001h,061h,003h,0a1h,071h,001h,0e9h,001h,075h,075h	; a1e3  .cq!ss.a..q...uu
	defb 075h,0e9h	; a1f3

; ----------------------------------------------------------------------
; DATOS partitura_A1F5: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (13 bytes)
;   0xa1f5..0xa202  (13 bytes)
DATA_partitura_A1F5:
	defb 009h,073h,001h,071h,073h,003h,001h,0e9h,001h,005h,005h,005h,075h	; a1f5  .s.qs.......u

; ----------------------------------------------------------------------
; DATOS partitura_A202: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (10 bytes)
;   0xa202..0xa20c  (10 bytes)
DATA_partitura_A202:
	defb 075h,075h,0e9h,009h,021h,003h,071h,021h,0fbh,002h	; a202  uu..!.q!..

; ----------------------------------------------------------------------
; DATOS partitura_A20C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xa20c..0xa20f  (3 bytes)
DATA_partitura_A20C:
	defb 0fdh,0b6h,0a1h	; a20c

; ----------------------------------------------------------------------
; DATOS partitura_A20F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xa20f..0xa220  (17 bytes)
DATA_partitura_A20F:
	defb 0feh,001h,0f5h,0eah,00bh,0ebh,009h,047h,021h,0e9h,001h,0d4h,005h,055h,035h,0e9h	; a20f  .......G!....U5.
	defb 009h	; a21f

; ----------------------------------------------------------------------
; DATOS partitura_A220: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xa220..0xa222  (2 bytes)
DATA_partitura_A220:
	defb 061h,0c5h	; a220

; ----------------------------------------------------------------------
; DATOS partitura_A222: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xa222..0xa234  (18 bytes)
DATA_partitura_A222:
	defb 0ebh,009h,047h,071h,035h,005h,003h,005h,0fbh,004h,0f5h,0eah,00bh,0ebh,009h,047h	; a222  ..Gq5..........G
	defb 004h,0e9h	; a232

; ----------------------------------------------------------------------
; DATOS partitura_A234: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xa234..0xa246  (18 bytes)
DATA_partitura_A234:
	defb 009h,0d4h,051h,051h,051h,051h,061h,061h,061h,061h,061h,081h,081h,081h,061h,081h	; a234  ..QQQQaaaaa...a.
	defb 081h,0e9h	; a244

; ----------------------------------------------------------------------
; DATOS partitura_A246: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (21 bytes)
;   0xa246..0xa25b  (21 bytes)
DATA_partitura_A246:
	defb 001h,065h,055h,035h,0e9h,009h,051h,051h,051h,051h,061h,061h,061h,061h,061h,03dh	; a246  .eU5..QQQQaaaaa=
	defb 0fbh,002h,0fdh,00fh,0a2h	; a256

; ----------------------------------------------------------------------
; DATOS partitura_A25B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa25b..0xa25c  (1 bytes)
DATA_partitura_A25B:
	defb 0feh	; a25b

; ----------------------------------------------------------------------
; DATOS partitura_A25C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (27 bytes)
;   0xa25c..0xa277  (27 bytes)
DATA_partitura_A25C:
	defb 001h,0f5h,0f6h,0f8h,028h,0eah,00ch,0ebh,00ah,047h,021h,0e9h,001h,0d5h,005h,055h	; a25c  ....(....G!....U
	defb 035h,0e9h,009h,061h,0f8h,00ah,0eah,003h,0ebh,007h,017h	; a26c  5..a.......

; ----------------------------------------------------------------------
; DATOS partitura_A277: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (26 bytes)
;   0xa277..0xa291  (26 bytes)
DATA_partitura_A277:
	defb 001h,0e9h,001h,0d6h,010h,001h,0d1h,0c5h,0c5h,005h,055h,035h,0e9h,009h,061h,0eah	; a277  ..........U5..a.
	defb 002h,0e9h,001h,005h,0e9h,009h,0d5h,0f1h,023h,025h	; a287  ........#%

; ----------------------------------------------------------------------
; DATOS partitura_A291: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xa291..0xa2a2  (17 bytes)
DATA_partitura_A291:
	defb 001h,006h,0eah,00dh,0ebh,00ah,043h,003h,0d4h,035h,005h,003h,005h,0fbh,004h,0f5h	; a291  ......C..5......
	defb 0f6h	; a2a1

; ----------------------------------------------------------------------
; DATOS partitura_A2A2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xa2a2..0xa2bb  (25 bytes)
DATA_partitura_A2A2:
	defb 0f8h,028h,0eah,00eh,0ebh,00ah,047h,021h,0e9h,009h,0d5h,051h,0f8h,023h,051h,051h	; a2a2  .(....G!...Q.#QQ
	defb 0f8h,028h,051h,061h,0f8h,023h,061h,061h,061h	; a2b2  .(Qa.#aaa

; ----------------------------------------------------------------------
; DATOS partitura_A2BB: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa2bb..0xa2bc  (1 bytes)
DATA_partitura_A2BB:
	defb 061h	; a2bb

; ----------------------------------------------------------------------
; DATOS partitura_A2BC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa2bc..0xa2c4  (8 bytes)
DATA_partitura_A2BC:
	defb 0f8h,028h,081h,0f8h,023h,081h,081h,0f8h	; a2bc  .(..#...

; ----------------------------------------------------------------------
; DATOS partitura_A2C4: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (5 bytes)
;   0xa2c4..0xa2c9  (5 bytes)
DATA_partitura_A2C4:
	defb 028h,061h,081h,0f8h,023h	; a2c4

; ----------------------------------------------------------------------
; DATOS partitura_A2C9: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa2c9..0xa2d1  (8 bytes)
DATA_partitura_A2C9:
	defb 081h,0f8h,028h,0ebh,00ah,041h,001h,0e9h	; a2c9  ..(..A..

; ----------------------------------------------------------------------
; DATOS partitura_A2D1: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xa2d1..0xa2dc  (11 bytes)
DATA_partitura_A2D1:
	defb 001h,065h,055h,035h,0e9h,009h,0ebh,00ah,047h,021h,051h	; a2d1  .eU5....G!Q

; ----------------------------------------------------------------------
; DATOS partitura_A2DC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xa2dc..0xa2e7  (11 bytes)
DATA_partitura_A2DC:
	defb 0f8h,023h,051h,051h,0f8h,028h,051h,061h,0f8h,023h,061h	; a2dc  .#QQ.(Qa.#a

; ----------------------------------------------------------------------
; DATOS partitura_A2E7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xa2e7..0xa2ed  (6 bytes)
DATA_partitura_A2E7:
	defb 061h,061h,061h,0f1h,023h,028h	; a2e7

; ----------------------------------------------------------------------
; DATOS partitura_A2ED: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (5 bytes)
;   0xa2ed..0xa2f2  (5 bytes)
DATA_partitura_A2ED:
	defb 001h,008h,0eah,007h,0ech	; a2ed

; ----------------------------------------------------------------------
; DATOS partitura_A2F2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xa2f2..0xa2f5  (3 bytes)
DATA_partitura_A2F2:
	defb 03dh,0fbh,002h	; a2f2

; ----------------------------------------------------------------------
; DATOS partitura_A2F5: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xa2f5..0xa2f8  (3 bytes)
DATA_partitura_A2F5:
	defb 0fdh,05bh,0a2h	; a2f5

; ----------------------------------------------------------------------
; DATOS partitura_A2F8: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (5 bytes)
;   0xa2f8..0xa2fd  (5 bytes)
DATA_partitura_A2F8:
	defb 0feh,001h,0f6h,0f8h,005h	; a2f8

; ----------------------------------------------------------------------
; DATOS partitura_A2FD: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa2fd..0xa305  (8 bytes)
DATA_partitura_A2FD:
	defb 0deh,001h,072h,002h,0e9h,009h,0f5h,0d2h	; a2fd  ..r.....

; ----------------------------------------------------------------------
; DATOS partitura_A305: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa305..0xa306  (1 bytes)
DATA_partitura_A305:
	defb 051h	; a305

; ----------------------------------------------------------------------
; DATOS partitura_A306: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa306..0xa30e  (8 bytes)
DATA_partitura_A306:
	defb 061h,0fbh,020h,0deh,001h,072h,002h,0f5h	; a306  a. ..r..

; ----------------------------------------------------------------------
; DATOS partitura_A30E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa30e..0xa316  (8 bytes)
DATA_partitura_A30E:
	defb 0d0h,003h,0d1h,003h,0fbh,010h,0fdh,0f8h	; a30e  ........

; ----------------------------------------------------------------------
; DATOS partitura_A316: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa316..0xa317  (1 bytes)
DATA_partitura_A316:
	defb 0a2h	; a316

; ----------------------------------------------------------------------
; DATOS partitura_A317: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xa317..0xa31d  (6 bytes)
DATA_partitura_A317:
	defb 0feh,001h,0f5h,0f8h,002h,0eah	; a317

; ----------------------------------------------------------------------
; DATOS partitura_A31D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa31d..0xa31e  (1 bytes)
DATA_partitura_A31D:
	defb 00ah	; a31d

; ----------------------------------------------------------------------
; DATOS partitura_A31E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa31e..0xa326  (8 bytes)
DATA_partitura_A31E:
	defb 0ebh,009h,047h,021h,0e9h,001h,0d6h,010h	; a31e  ..G!....

; ----------------------------------------------------------------------
; DATOS partitura_A326: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xa326..0xa33f  (25 bytes)
DATA_partitura_A326:
	defb 001h,0d1h,005h,055h,035h,0e9h,009h,061h,0d8h,0f8h,00ah,0eah,005h,0ebh,007h,017h	; a326  ...U5..a........
	defb 001h,0e9h,001h,0d6h,010h,001h,0d2h,005h,055h	; a336  ........U

; ----------------------------------------------------------------------
; DATOS partitura_A33F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (94 bytes)
;   0xa33f..0xa39d  (94 bytes)
DATA_partitura_A33F:
	defb 035h,0e9h,009h,061h,0eah,003h,0e9h,001h,005h,055h,035h,0e9h,009h,0d5h,0f8h,005h	; a33f  5..a.....U5.....
	defb 0dbh,001h,0deh,001h,052h,002h,0d2h,005h,005h,0eah,006h,003h,0eah,007h,005h,0fbh	; a34f  ....R...........
	defb 004h,0f0h,004h,0a1h,0f5h,0f8h,002h,0eah,00bh,0ebh,009h,037h,021h,0e9h,009h,0dbh	; a35f  ...........7!...
	defb 001h,0d6h,005h,001h,0d1h,051h,0ech,0eah,002h,051h,0eah,001h,051h,0ebh,009h,037h	; a36f  .....Q...Q..Q..7
	defb 021h,0eah,00bh,051h,061h,0ech,0eah,002h,061h,0eah,001h,065h,0ebh,009h,037h,021h	; a37f  !..Qa...a..e..7!
	defb 0eah,00bh,081h,0ech,0eah,002h,081h,0eah,001h,081h,0ebh,009h,037h,021h	; a38f  ............7!

; ----------------------------------------------------------------------
; DATOS partitura_A39D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xa39d..0xa3a8  (11 bytes)
DATA_partitura_A39D:
	defb 0eah,00bh,061h,081h,0ech,0eah,001h,081h,0eah,00bh,0ebh	; a39d  ..a........

; ----------------------------------------------------------------------
; DATOS partitura_A3A8: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (24 bytes)
;   0xa3a8..0xa3c0  (24 bytes)
DATA_partitura_A3A8:
	defb 009h,037h,021h,0e9h,001h,065h,055h,035h,0e9h,009h,051h,0ech,0eah,002h,051h,0eah	; a3a8  .7!..eU5..Q...Q.
	defb 001h,051h,0eah,00bh,0ebh,009h,037h,021h	; a3b8  .Q....7!

; ----------------------------------------------------------------------
; DATOS partitura_A3C0: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (24 bytes)
;   0xa3c0..0xa3d8  (24 bytes)
DATA_partitura_A3C0:
	defb 051h,061h,0ech,0eah,002h,061h,0eah,001h,065h,0f8h,005h,0d8h,0f0h,004h,031h,0eah	; a3c0  Qa...a..e.....1.
	defb 003h,0d0h,03dh,0fbh,002h,0fdh,017h,0a3h	; a3d0  ..=.....

; ----------------------------------------------------------------------
; DATOS partitura_A3D8: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (10 bytes)
;   0xa3d8..0xa3e2  (10 bytes)
DATA_partitura_A3D8:
	defb 0feh,001h,0f5h,0eah,00ah,0ebh,009h,047h,021h,0e9h	; a3d8  .......G!.

; ----------------------------------------------------------------------
; DATOS partitura_A3E2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xa3e2..0xa3e8  (6 bytes)
DATA_partitura_A3E2:
	defb 001h,0d6h,010h,001h,0d2h,005h	; a3e2

; ----------------------------------------------------------------------
; DATOS partitura_A3E8: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (168 bytes)
;   0xa3e8..0xa490  (168 bytes)
DATA_partitura_A3E8:
	defb 055h,035h,0e9h,009h,061h,0eah,005h,0ebh,007h,017h,001h,0e9h,001h,0d6h,010h,001h	; a3e8  U5..a...........
	defb 0d1h,005h,055h,035h,0e9h,009h,061h,0eah,003h,0e9h,001h,005h,055h,035h,0e9h,009h	; a3f8  ..U5..a.....U5..
	defb 0d5h,0d8h,0dbh,001h,0deh,001h,052h,002h,0d2h,065h,065h,0eah,006h,063h,0eah,007h	; a408  ......R..ee..c..
	defb 065h,0fbh,004h,0f0h,004h,071h,0f5h,0eah,00bh,0ebh,009h,037h,021h,0dbh,001h,0e9h	; a418  e....q.....7!...
	defb 009h,0d6h,010h,001h,0d1h,001h,0ech,0eah,002h,001h,0eah,001h,001h,0eah,00bh,0ebh	; a428  ................
	defb 009h,037h,021h,001h,001h,0ech,0eah,002h,001h,0eah,001h,005h,0eah,00bh,0ebh,009h	; a438  .7!.............
	defb 037h,021h,031h,0ech,0eah,002h,031h,0eah,001h,031h,0eah,00bh,0ebh,009h,037h,021h	; a448  7!1...1..1....7!
	defb 0d1h,001h,001h,0ech,0eah,001h,001h,0eah,00bh,0ebh,009h,037h,021h,0e9h,001h,035h	; a458  ...........7!..5
	defb 005h,005h,0e9h,009h,001h,0ech,0eah,002h,001h,0eah,001h,001h,0eah,00bh,0ebh,009h	; a468  ................
	defb 037h,021h,001h,001h,0ech,0eah,002h,001h,0eah,001h,005h,0d8h,0f0h,004h,031h,0d1h	; a478  7!............1.
	defb 0eah,003h,08dh,0fbh,002h,0fdh,0d8h,0a3h	; a488  ........

; ----------------------------------------------------------------------
; DATOS partitura_A490: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (37 bytes)
;   0xa490..0xa4b5  (37 bytes)
DATA_partitura_A490:
	defb 0feh,001h,0f5h,0e9h,00eh,0c2h,0eeh,002h,0eah,006h,0edh,014h,0ebh,087h,017h,071h	; a490  ...............q
	defb 0f0h,005h,071h,0dbh,002h,0f5h,0d0h,045h,030h,040h,0d1h,0b7h,0d0h,071h,061h,041h	; a4a0  ..q....E0@...qaA
	defb 033h,043h,061h,05bh,041h	; a4b0

; ----------------------------------------------------------------------
; DATOS partitura_A4B5: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xa4b5..0xa4c6  (17 bytes)
DATA_partitura_A4B5:
	defb 001h,027h,0d1h,073h,0d0h,003h,0fbh,002h,0d1h,0bfh,0ech,0eah,002h,0bch,0fdh,090h	; a4b5  .'.s............
	defb 0a4h	; a4c5

; ----------------------------------------------------------------------
; DATOS partitura_A4C6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (22 bytes)
;   0xa4c6..0xa4dc  (22 bytes)
DATA_partitura_A4C6:
	defb 0feh,001h,0e9h,00eh,0c0h,0d9h,0d6h,006h,003h,0f5h,0e9h,00eh,0eah,006h,0edh,024h	; a4c6  ...............$
	defb 0ebh,087h,017h,0d1h,0f0h,005h	; a4d6

; ----------------------------------------------------------------------
; DATOS partitura_A4DC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xa4dc..0xa4e7  (11 bytes)
DATA_partitura_A4DC:
	defb 072h,0dbh,002h,0d3h,0b7h,0d2h,047h,037h,067h,057h,097h	; a4dc  r.....G7gW.

; ----------------------------------------------------------------------
; DATOS partitura_A4E7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (9 bytes)
;   0xa4e7..0xa4f0  (9 bytes)
DATA_partitura_A4E7:
	defb 077h,047h,0fbh,002h,0d6h,004h,002h,0eah,004h	; a4e7  wG.......

; ----------------------------------------------------------------------
; DATOS partitura_A4F0: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa4f0..0xa4f1  (1 bytes)
DATA_partitura_A4F0:
	defb 0edh	; a4f0

; ----------------------------------------------------------------------
; DATOS partitura_A4F1: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xa4f1..0xa4f3  (2 bytes)
DATA_partitura_A4F1:
	defb 013h,0ebh	; a4f1

; ----------------------------------------------------------------------
; DATOS partitura_A4F3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa4f3..0xa4fb  (8 bytes)
DATA_partitura_A4F3:
	defb 089h,037h,002h,0f5h,0b1h,091h,0b1h,061h	; a4f3  .7.....a

; ----------------------------------------------------------------------
; DATOS partitura_A4FB: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa4fb..0xa4fc  (1 bytes)
DATA_partitura_A4FB:
	defb 0fbh	; a4fb

; ----------------------------------------------------------------------
; DATOS partitura_A4FC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa4fc..0xa4fd  (1 bytes)
DATA_partitura_A4FC:
	defb 003h	; a4fc

; ----------------------------------------------------------------------
; DATOS partitura_A4FD: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xa4fd..0xa504  (7 bytes)
DATA_partitura_A4FD:
	defb 0b1h,091h,0b1h,060h,0fdh,0c6h,0a4h	; a4fd

; ----------------------------------------------------------------------
; DATOS partitura_A504: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa504..0xa505  (1 bytes)
DATA_partitura_A504:
	defb 0feh	; a504

; ----------------------------------------------------------------------
; DATOS partitura_A505: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa505..0xa50d  (8 bytes)
DATA_partitura_A505:
	defb 001h,0f6h,0f8h,009h,0d9h,0d7h,030h,005h	; a505  ......0.

; ----------------------------------------------------------------------
; DATOS partitura_A50D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa50d..0xa515  (8 bytes)
DATA_partitura_A50D:
	defb 0f5h,0e9h,00eh,0eah,00eh,0edh,064h,0ebh	; a50d  ......d.

; ----------------------------------------------------------------------
; DATOS partitura_A515: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa515..0xa51d  (8 bytes)
DATA_partitura_A515:
	defb 087h,037h,0d1h,0d4h,04fh,03fh,02fh,02fh	; a515  .7..O?//

; ----------------------------------------------------------------------
; DATOS partitura_A51D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa51d..0xa525  (8 bytes)
DATA_partitura_A51D:
	defb 0fbh,002h,0d5h,0bfh,0ech,0eah,003h,0b7h	; a51d  ........

; ----------------------------------------------------------------------
; DATOS partitura_A525: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xa525..0xa52b  (6 bytes)
DATA_partitura_A525:
	defb 0eah,002h,0b7h,0fdh,004h,0a5h	; a525

; ----------------------------------------------------------------------
; DATOS partitura_A52B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xa52b..0xa52d  (2 bytes)
DATA_partitura_A52B:
	defb 0feh,001h	; a52b

; ----------------------------------------------------------------------
; DATOS partitura_A52D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa52d..0xa52e  (1 bytes)
DATA_partitura_A52D:
	defb 0f8h	; a52d

; ----------------------------------------------------------------------
; DATOS partitura_A52E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa52e..0xa52f  (1 bytes)
DATA_partitura_A52E:
	defb 008h	; a52e

; ----------------------------------------------------------------------
; DATOS partitura_A52F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa52f..0xa537  (8 bytes)
DATA_partitura_A52F:
	defb 0d9h,0d6h,010h,003h,0e9h,00eh,0eah,00ah	; a52f  ........

; ----------------------------------------------------------------------
; DATOS partitura_A537: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa537..0xa53f  (8 bytes)
DATA_partitura_A537:
	defb 0edh,024h,0ebh,087h,037h,0d1h,0f0h,005h	; a537  .$..7...

; ----------------------------------------------------------------------
; DATOS partitura_A53F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa53f..0xa547  (8 bytes)
DATA_partitura_A53F:
	defb 072h,0dbh,002h,0f5h,0d3h,0b7h,0d2h,047h	; a53f  r......G

; ----------------------------------------------------------------------
; DATOS partitura_A547: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa547..0xa54f  (8 bytes)
DATA_partitura_A547:
	defb 037h,067h,057h,097h,077h,047h,0fbh,002h	; a547  7gW.wG..

; ----------------------------------------------------------------------
; DATOS partitura_A54F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa54f..0xa557  (8 bytes)
DATA_partitura_A54F:
	defb 0d6h,008h,002h,0edh,016h,0ebh,089h,037h	; a54f  .......7

; ----------------------------------------------------------------------
; DATOS partitura_A557: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (9 bytes)
;   0xa557..0xa560  (9 bytes)
DATA_partitura_A557:
	defb 002h,0f5h,0b1h,091h,0b1h,061h,0fbh,004h,0fdh	; a557  .....a...

; ----------------------------------------------------------------------
; DATOS partitura_A560: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xa560..0xa562  (2 bytes)
DATA_partitura_A560:
	defb 02bh,0a5h	; a560

; ----------------------------------------------------------------------
; DATOS partitura_A562: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (10 bytes)
;   0xa562..0xa56c  (10 bytes)
DATA_partitura_A562:
	defb 0feh,001h,0f8h,007h,0d9h,0d6h,009h,002h,0e9h,00eh	; a562  ..........

; ----------------------------------------------------------------------
; DATOS partitura_A56C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xa56c..0xa573  (7 bytes)
DATA_partitura_A56C:
	defb 0eah,009h,0edh,022h,0ebh,087h,037h	; a56c

; ----------------------------------------------------------------------
; DATOS partitura_A573: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xa573..0xa57a  (7 bytes)
DATA_partitura_A573:
	defb 071h,0f0h,005h,071h,0dbh,002h,0f5h	; a573

; ----------------------------------------------------------------------
; DATOS partitura_A57A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xa57a..0xa580  (6 bytes)
DATA_partitura_A57A:
	defb 0d1h,045h,030h,040h,0d2h,0b7h	; a57a

; ----------------------------------------------------------------------
; DATOS partitura_A580: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (19 bytes)
;   0xa580..0xa593  (19 bytes)
DATA_partitura_A580:
	defb 0d1h,071h,061h,041h,033h,043h,061h,05bh,041h,001h,027h,0d2h,073h,0d1h,003h,0fbh	; a580  .qaA3Ca[A.'.s...
	defb 002h,0d2h,0bfh	; a590

; ----------------------------------------------------------------------
; DATOS partitura_A593: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa593..0xa59b  (8 bytes)
DATA_partitura_A593:
	defb 0d8h,0ech,0eah,002h,0bfh,0fdh,062h,0a5h	; a593  ......b.

; ----------------------------------------------------------------------
; DATOS partitura_A59B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (34 bytes)
;   0xa59b..0xa5bd  (34 bytes)
DATA_partitura_A59B:
	defb 0feh,001h,0e9h,007h,0d9h,0d6h,008h,002h,0eah,005h,0edh,022h,0ebh,087h,017h,0d1h	; a59b  ..........."....
	defb 0f0h,005h,071h,0eeh,001h,0c1h,0e9h,00eh,0dbh,001h,0f5h,0d1h,045h,030h,040h,0d2h	; a5ab  ..q.........E0@.
	defb 0b7h,0d1h	; a5bb

; ----------------------------------------------------------------------
; DATOS partitura_A5BD: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xa5bd..0xa5c3  (6 bytes)
DATA_partitura_A5BD:
	defb 071h,061h,041h,033h,043h,061h	; a5bd

; ----------------------------------------------------------------------
; DATOS partitura_A5C3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (20 bytes)
;   0xa5c3..0xa5d7  (20 bytes)
DATA_partitura_A5C3:
	defb 05bh,041h,001h,027h,0d2h,073h,0d1h,003h,0fbh,002h,0d2h,0bfh,0d8h,0ech,0eah,001h	; a5c3  [A.'.s..........
	defb 0beh,0fdh,09bh,0a5h	; a5d3

; ----------------------------------------------------------------------
; DATOS partitura_A5D7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x81 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (16 bytes)
;   0xa5d7..0xa5e7  (16 bytes)
DATA_partitura_A5D7:
	defb 0feh,001h,0e9h,007h,0c1h,0eeh,088h,0eah,005h,0ech,0d4h,015h,000h,0d5h,0b0h,0a7h	; a5d7  ................

; ----------------------------------------------------------------------
; DATOS partitura_A5E7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x81 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (37 bytes)
;   0xa5e7..0xa60c  (37 bytes)
DATA_partitura_A5E7:
	defb 0a0h,0b0h,0d4h,0ebh,007h,016h,061h,0eah,005h,0e9h,00eh,009h,0efh,0feh,004h,0d0h	; a5e7  ......a.........
	defb 0e9h,007h,0f5h,0a3h,0fbh,020h,0feh,004h,0d0h,0e9h,007h,0f5h,0a3h,0fbh,01ch,0a7h	; a5f7  ..... ..........
	defb 0a3h,0a3h,0fdh,0f4h,0a5h	; a607

; ----------------------------------------------------------------------
; DATOS partitura_A60C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x81 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xa60c..0xa617  (11 bytes)
DATA_partitura_A60C:
	defb 0feh,001h,0e9h,007h,0c3h,0eeh,008h,0eah,005h,0ech,0d4h	; a60c  ...........

; ----------------------------------------------------------------------
; DATOS partitura_A617: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x81 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xa617..0xa630  (25 bytes)
DATA_partitura_A617:
	defb 015h,000h,0d5h,0b0h,0a7h,0a0h,0b0h,0d4h,0ebh,007h,016h,061h,0eah,005h,0e9h,00eh	; a617  ...........a....
	defb 008h,0efh,0feh,001h,0e9h,007h,0eeh,081h,0c2h	; a627  .........

; ----------------------------------------------------------------------
; DATOS partitura_A630: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x81 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (36 bytes)
;   0xa630..0xa654  (36 bytes)
DATA_partitura_A630:
	defb 0eah,004h,0ebh,003h,027h,002h,0f5h,0d0h,000h,010h,020h,030h,000h,010h,020h,030h	; a630  ....'..... 0.. 0
	defb 000h,010h,020h,030h,000h,010h,020h,030h,0fbh,004h,0f5h,0d1h,0a0h,0b0h,0d0h,000h	; a640  .. 0.. 0........
	defb 010h,0fbh,00fh,0d1h	; a650

; ----------------------------------------------------------------------
; DATOS partitura_A654: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x81 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (41 bytes)
;   0xa654..0xa67d  (41 bytes)
DATA_partitura_A654:
	defb 0a0h,0feh,001h,0e9h,007h,0c2h,0f5h,0d0h,000h,010h,020h,030h,000h,010h,020h,030h	; a654  .......... 0.. 0
	defb 000h,010h,020h,030h,000h,010h,020h,030h,0fbh,004h,0f5h,0d1h,0a0h,0b0h,0d0h,000h	; a664  .. 0.. 0........
	defb 010h,0fbh,00ch,0d0h,030h,010h,070h,040h,000h	; a674  ....0.p@.

; ----------------------------------------------------------------------
; DATOS partitura_A67D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x81 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (16 bytes)
;   0xa67d..0xa68d  (16 bytes)
DATA_partitura_A67D:
	defb 0d1h,0a0h,0d0h,000h,0d1h,0a0h,0d0h,040h,010h,0d1h,0a0h,070h,0a0h,0fdh,029h,0a6h	; a67d  .......@...p..).

; ----------------------------------------------------------------------
; DATOS partitura_A68D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x81 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (52 bytes)
;   0xa68d..0xa6c1  (52 bytes)
DATA_partitura_A68D:
	defb 0feh,001h,0f6h,0f8h,002h,0e9h,007h,0eeh,082h,0c1h,0eah,006h,0edh,016h,0ebh,087h	; a68d  ................
	defb 017h,0f1h,0d6h,006h,001h,0f0h,008h,063h,0d2h,010h,0d3h,0a0h,0d2h,04dh,060h,030h	; a69d  .......c.....M`0
	defb 097h,0f8h,012h,0efh,0edh,024h,0eah,00ah,0d3h,000h,030h,060h,090h,0d2h,000h,030h	; a6ad  .....$....0`...0
	defb 060h,090h,0d1h,000h	; a6bd

; ----------------------------------------------------------------------
; DATOS partitura_A6C1: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x81 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xa6c1..0xa6d2  (17 bytes)
DATA_partitura_A6C1:
	defb 030h,060h,090h,0feh,001h,0f1h,002h,00ah,001h,00ah,0e9h,007h,0eah,00ch,0edh,052h	; a6c1  0`.............R
	defb 0ebh	; a6d1

; ----------------------------------------------------------------------
; DATOS partitura_A6D2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x81 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (38 bytes)
;   0xa6d2..0xa6f8  (38 bytes)
DATA_partitura_A6D2:
	defb 087h,027h,081h,0d9h,0d6h,026h,003h,0f0h,008h,044h,0d3h,08fh,07fh,06fh,07fh,0afh	; a6d2  .'...&...D...o..
	defb 0d2h,01fh,04fh,0d3h,07fh,0feh,001h,0e9h,007h,0d3h,08fh,07fh,06fh,07fh,0afh,0d2h	; a6e2  ..O.........o...
	defb 01fh,04fh,0afh,0fdh,0c4h,0a6h	; a6f2

; ----------------------------------------------------------------------
; DATOS partitura_A6F8: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x81 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xa6f8..0xa6ff  (7 bytes)
DATA_partitura_A6F8:
	defb 0feh,001h,0f8h,04bh,0e9h,007h,0eah	; a6f8

; ----------------------------------------------------------------------
; DATOS partitura_A6FF: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x81 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (24 bytes)
;   0xa6ff..0xa717  (24 bytes)
DATA_partitura_A6FF:
	defb 00fh,0edh,037h,0ebh,087h,027h,041h,0f0h,008h,063h,0d4h,015h,000h,0d5h,0b0h,0a7h	; a6ff  ..7..'A..c......
	defb 0a0h,0b0h,0d4h,0e9h,00eh,00ch,0feh,001h	; a70f  ........

; ----------------------------------------------------------------------
; DATOS partitura_A717: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x81 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (34 bytes)
;   0xa717..0xa739  (34 bytes)
DATA_partitura_A717:
	defb 0f2h,001h,0e9h,007h,0eeh,084h,0eah,008h,0edh,052h,0ebh,087h,017h,0d1h,0d9h,0d6h	; a717  .........R......
	defb 026h,003h,0f0h,008h,063h,0d3h,08fh,07fh,06fh,07fh,0afh,0d2h,01fh,04fh,0d3h,07fh	; a727  &...c...o....O..
	defb 0feh,001h	; a737

; ----------------------------------------------------------------------
; DATOS partitura_A739: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x81 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (15 bytes)
;   0xa739..0xa748  (15 bytes)
DATA_partitura_A739:
	defb 0e9h,007h,0d3h,08fh,07fh,06fh,07fh,0afh,0d2h,01fh,04fh,0afh,0fdh,015h,0a7h	; a739  .....o....O....

; ----------------------------------------------------------------------
; DATOS partitura_A748: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x81 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (50 bytes)
;   0xa748..0xa77a  (50 bytes)
DATA_partitura_A748:
	defb 0feh,001h,0f8h,002h,0e9h,007h,0eah,00bh,0edh,018h,0ebh,087h,027h,061h,0d6h,006h	; a748  ............'a..
	defb 001h,0f0h,008h,043h,0d2h,010h,0d3h,0a0h,0d2h,04dh,060h,030h,095h,0d1h,030h,020h	; a758  ...C.....M`0..0
	defb 09dh,0feh,001h,0f8h,04bh,0e9h,007h,0eah,00fh,0ebh,00ah,047h,003h,0d7h,020h,002h	; a768  ....K......G.. .
	defb 0f5h,0d4h	; a778

; ----------------------------------------------------------------------
; DATOS partitura_A77A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x81 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (31 bytes)
;   0xa77a..0xa799  (31 bytes)
DATA_partitura_A77A:
	defb 001h,0fbh,020h,0f5h,0d5h,0a1h,0fbh,020h,0feh,001h,0e9h,007h,0f5h,0d4h,001h,0fbh	; a77a  .. .... ........
	defb 020h,0f5h,0d5h,0a1h,0fbh,019h,0d4h,043h,011h,073h,041h,0a1h,0fdh,069h,0a7h	; a78a   ......C.sA..i.

; ----------------------------------------------------------------------
; DATOS partitura_A799: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x81 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xa799..0xa79b  (2 bytes)
DATA_partitura_A799:
	defb 0feh,001h	; a799

; ----------------------------------------------------------------------
; DATOS partitura_A79B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x81 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (134 bytes)
;   0xa79b..0xa821  (134 bytes)
DATA_partitura_A79B:
	defb 0f8h,002h,0e9h,007h,0eah,00bh,0edh,018h,0ebh,087h,027h,061h,0d6h,006h,001h,0f0h	; a79b  ..........'a....
	defb 008h,043h,0d3h,070h,070h,07dh,0d2h,000h,000h,005h,090h,090h,09dh,0d8h,0dch,0f0h	; a7ab  .C.pp}..........
	defb 000h,0feh,001h,0f8h,04bh,0e9h,007h,0eah,004h,0ebh,00fh,0eah,001h,0f5h,0d0h,000h	; a7bb  ....K...........
	defb 010h,020h,030h,000h,010h,020h,030h,000h,010h,020h,030h,000h,010h,020h,030h,0fbh	; a7cb  . 0.. 0.. 0.. 0.
	defb 004h,0f5h,0d1h,0a0h,0b0h,0d0h,000h,010h,0fbh,010h,0feh,001h,0e9h,007h,0f5h,0d0h	; a7db  ................
	defb 000h,010h,020h,030h,000h,010h,020h,030h,000h,010h,020h,030h,000h,010h,020h,030h	; a7eb  .. 0.. 0.. 0.. 0
	defb 0fbh,004h,0f5h,0d1h,0a0h,0b0h,0d0h,000h,010h,0fbh,00ch,0d0h,030h,010h,070h,040h	; a7fb  ............0.p@
	defb 000h,0d1h,0a0h,0d0h,000h,0d1h,0a0h,0d0h,040h,010h,0d1h,0a0h,070h,0a0h,0d0h,010h	; a80b  ........@...p...
	defb 0d1h,070h,0a0h,0fdh,0bch,0a7h	; a81b

; ----------------------------------------------------------------------
; DATOS partitura_A821: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x83 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (15 bytes)
;   0xa821..0xa830  (15 bytes)
DATA_partitura_A821:
	defb 0feh,001h,0e9h,00fh,0f0h,002h,036h,0ech,0eah,00ah,0d5h,00fh,0fdh,02ch,0a8h	; a821  ......6......,.

; ----------------------------------------------------------------------
; DATOS partitura_A830: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x83 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (21 bytes)
;   0xa830..0xa845  (21 bytes)
DATA_partitura_A830:
	defb 0feh,001h,0e9h,001h,0c4h,0eah,005h,0ebh,027h,0f0h,000h,0d0h,074h,004h,014h,064h	; a830  ........'...t..d
	defb 004h,014h,0fdh,03ch,0a8h	; a840

; ----------------------------------------------------------------------
; DATOS partitura_A845: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x83 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (22 bytes)
;   0xa845..0xa85b  (22 bytes)
DATA_partitura_A845:
	defb 0feh,001h,0f1h,094h,015h,001h,00ah,0f3h,001h,0e9h,00fh,0f0h,002h,035h,0ech,0eah	; a845  .............5..
	defb 00ah,0d4h,00fh,0fdh,057h,0a8h	; a855

; ----------------------------------------------------------------------
; DATOS partitura_A85B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x83 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (21 bytes)
;   0xa85b..0xa870  (21 bytes)
DATA_partitura_A85B:
	defb 0feh,001h,0f2h,001h,0f3h,001h,0e9h,00ah,0eeh,08fh,0f0h,002h,035h,0ech,0eah,00ah	; a85b  ............5...
	defb 0d4h,00fh,0fdh,06ch,0a8h	; a86b

; ----------------------------------------------------------------------
; DATOS partitura_A870: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x83 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (22 bytes)
;   0xa870..0xa886  (22 bytes)
DATA_partitura_A870:
	defb 0feh,001h,0f8h,052h,0e9h,001h,0eah,004h,0ebh,009h,01bh,001h,0d0h,074h,004h,014h	; a870  ...R.........t..
	defb 064h,004h,014h,0fdh,07dh,0a8h	; a880

; ----------------------------------------------------------------------
; DATOS partitura_A886: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x83 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (19 bytes)
;   0xa886..0xa899  (19 bytes)
DATA_partitura_A886:
	defb 0feh,001h,0e9h,00fh,0f0h,002h,011h,0eah,001h,0d0h,07fh,0e9h,001h,0f0h,002h,001h	; a886  ................
	defb 0e9h,00fh,07fh	; a896

; ----------------------------------------------------------------------
; DATOS partitura_A899: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x83 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xa899..0xa89c  (3 bytes)
DATA_partitura_A899:
	defb 0fdh,091h,0a8h	; a899

; ----------------------------------------------------------------------
; DATOS partitura_A89C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA6 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (26 bytes)
;   0xa89c..0xa8b6  (26 bytes)
DATA_partitura_A89C:
	defb 0feh,004h,0d0h,0e9h,006h,060h,060h,060h,061h,0e9h,003h,030h,030h,031h,041h,041h	; a89c  .....```a..001AA
	defb 041h,051h,051h,051h,061h,060h,060h,06fh,0feh,001h	; a8ac  AQQQa``o..

; ----------------------------------------------------------------------
; DATOS partitura_A8B6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA6 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xa8b6..0xa8b8  (2 bytes)
DATA_partitura_A8B6:
	defb 0c9h,0ffh	; a8b6

; ----------------------------------------------------------------------
; DATOS partitura_A8B8: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA6 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (19 bytes)
;   0xa8b8..0xa8cb  (19 bytes)
DATA_partitura_A8B8:
	defb 0feh,001h,0e9h,006h,0eeh,081h,0c0h,0eah,008h,0ebh,007h,012h,004h,0f0h,003h,031h	; a8b8  ...............1
	defb 0d1h,040h,030h	; a8c8

; ----------------------------------------------------------------------
; DATOS partitura_A8CB: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA6 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xa8cb..0xa8d6  (11 bytes)
DATA_partitura_A8CB:
	defb 020h,012h,070h,060h,050h,042h,070h,080h,090h,0abh,0ffh	; a8cb   .p`PBp....

; ----------------------------------------------------------------------
; DATOS partitura_A8D6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA6 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xa8d6..0xa8d9  (3 bytes)
DATA_partitura_A8D6:
	defb 0feh,001h,0e9h	; a8d6

; ----------------------------------------------------------------------
; DATOS partitura_A8D9: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA6 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (29 bytes)
;   0xa8d9..0xa8f6  (29 bytes)
DATA_partitura_A8D9:
	defb 006h,0eeh,081h,0c0h,0eah,008h,0ebh,007h,012h,004h,0f0h,003h,031h,0d1h,010h,000h	; a8d9  ............1...
	defb 0d2h,0b0h,0a2h,0d1h,040h,030h,020h,012h,040h,050h,060h,07bh,0ffh	; a8e9  ....@0 .@P`{.

; ----------------------------------------------------------------------
; DATOS partitura_A8F6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA6 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (36 bytes)
;   0xa8f6..0xa91a  (36 bytes)
DATA_partitura_A8F6:
	defb 0feh,001h,0f8h,002h,0e9h,006h,0eah,00eh,0ebh,039h,037h,051h,0d6h,004h,001h,0f0h	; a8f6  .........97Q....
	defb 003h,031h,0d1h,040h,030h,020h,012h,0f8h,012h,070h,060h,050h,042h,0f8h,002h,070h	; a906  .1.@0 ...p`PB..p
	defb 080h,090h,0ach,0ffh	; a916

; ----------------------------------------------------------------------
; DATOS partitura_A91A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA6 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (29 bytes)
;   0xa91a..0xa937  (29 bytes)
DATA_partitura_A91A:
	defb 0feh,001h,0f1h,0a5h,028h,001h,002h,0f3h,001h,0e9h,006h,0eah,00fh,0ebh,039h,0a3h	; a91a  ....(.........9.
	defb 003h,0d4h,040h,030h,020h,0ebh,009h,018h,051h,0e9h,00ch,01ch,0ffh	; a92a  ..@0 ...Q....

; ----------------------------------------------------------------------
; DATOS partitura_A937: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA6 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xa937..0xa942  (11 bytes)
DATA_partitura_A937:
	defb 0feh,001h,0f2h,001h,0e9h,006h,0c1h,0eah,00bh,0eeh,0a0h	; a937  ...........

; ----------------------------------------------------------------------
; DATOS partitura_A942: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA6 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (16 bytes)
;   0xa942..0xa952  (16 bytes)
DATA_partitura_A942:
	defb 0ebh,029h,0a3h,003h,0d4h,040h,030h,020h,0ebh,009h,018h,051h,0e9h,00ch,01bh,0ffh	; a942  .)...@0 ...Q....

; ----------------------------------------------------------------------
; DATOS partitura_A952: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA6 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (37 bytes)
;   0xa952..0xa977  (37 bytes)
DATA_partitura_A952:
	defb 0feh,001h,0f8h,002h,0e9h,006h,0eah,00eh,0ebh,039h,037h,051h,0d6h,014h,001h,0f0h	; a952  .........97Q....
	defb 003h,032h,0d1h,010h,000h,0d2h,0b0h,0a2h,0f8h,012h,0d1h,040h,030h,020h,012h,0f8h	; a962  .2.........@0 ..
	defb 002h,040h,050h,060h,07ch	; a972

; ----------------------------------------------------------------------
; DATOS partitura_A977: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA6 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa977..0xa978  (1 bytes)
DATA_partitura_A977:
	defb 0ffh	; a977

; ----------------------------------------------------------------------
; DATOS partitura_A978: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA6 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (37 bytes)
;   0xa978..0xa99d  (37 bytes)
DATA_partitura_A978:
	defb 0feh,001h,0e9h,006h,0eah,00eh,0ebh,039h,037h,051h,0d6h,014h,001h,0f0h,003h,032h	; a978  .......97Q.....2
	defb 0d2h,0a0h,090h,080h,072h,0f8h,012h,0d1h,010h,000h,0d2h,0b0h,0a2h,0f8h,002h,0d1h	; a988  ....r...........
	defb 010h,020h,030h,04ch,0ffh	; a998

; ----------------------------------------------------------------------
; DATOS partitura_A99D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x85 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (79 bytes)
;   0xa99d..0xa9ec  (79 bytes)
DATA_partitura_A99D:
	defb 0feh,002h,0e3h,003h,0e4h,000h,020h,040h,020h,041h,020h,042h,030h,043h,040h,044h	; a99d  ...... @ A B0C@D
	defb 050h,045h,060h,046h,070h,047h,080h,048h,080h,049h,080h,04ah,070h,04bh,070h,04ch	; a9ad  PE`FpG.H.I.JpKpL
	defb 070h,04dh,060h,04eh,060h,04fh,060h,050h,050h,051h,050h,052h,050h,053h,040h,054h	; a9bd  pM`N`O`PPQPRPS@T
	defb 040h,055h,040h,056h,030h,057h,030h,058h,030h,059h,020h,05ah,020h,05bh,020h,05ch	; a9cd  @U@V0W0X0Y Z [ \
	defb 020h,05dh,020h,05eh,020h,05fh,020h,060h,020h,061h,020h,062h,020h,063h,0ffh	; a9dd   ] ^ _ ` a b c.

; ----------------------------------------------------------------------
; DATOS partitura_A9EC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x85 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa9ec..0xa9ed  (1 bytes)
DATA_partitura_A9EC:
	defb 0ffh	; a9ec

; ----------------------------------------------------------------------
; DATOS partitura_A9ED: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x85 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (10 bytes)
;   0xa9ed..0xa9f7  (10 bytes)
DATA_partitura_A9ED:
	defb 0feh,002h,0f8h,015h,0e2h,002h,000h,040h,010h,041h	; a9ed  .......@.A

; ----------------------------------------------------------------------
; DATOS partitura_A9F7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x85 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xa9f7..0xa9fe  (7 bytes)
DATA_partitura_A9F7:
	defb 020h,042h,030h,043h,040h,044h,050h	; a9f7

; ----------------------------------------------------------------------
; DATOS partitura_A9FE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x85 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (59 bytes)
;   0xa9fe..0xaa39  (59 bytes)
DATA_partitura_A9FE:
	defb 045h,060h,046h,070h,047h,080h,048h,080h,049h,080h,04ah,070h,04bh,070h,04ch,070h	; a9fe  E`FpG.H.I.JpKpLp
	defb 04dh,060h,04eh,060h,04fh,060h,050h,050h,051h,050h,052h,050h,053h,040h,054h,040h	; aa0e  M`N`O`PPQPRPS@T@
	defb 055h,040h,056h,030h,057h,030h,058h,030h,059h,020h,05ah,020h,05bh,020h,05ch,010h	; aa1e  U@V0W0X0Y Z [ \.
	defb 05dh,010h,05eh,010h,05fh,010h,060h,000h,061h,000h,062h	; aa2e  ].^._.`.a.b

; ----------------------------------------------------------------------
; DATOS partitura_AA39: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x85 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (5 bytes)
;   0xaa39..0xaa3e  (5 bytes)
DATA_partitura_AA39:
	defb 000h,063h,0e0h,024h,0ffh	; aa39

; ----------------------------------------------------------------------
; DATOS partitura_AA3E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x85 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xaa3e..0xaa42  (4 bytes)
DATA_partitura_AA3E:
	defb 0feh,002h,0f8h,005h	; aa3e

; ----------------------------------------------------------------------
; DATOS partitura_AA42: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x85 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (79 bytes)
;   0xaa42..0xaa91  (79 bytes)
DATA_partitura_AA42:
	defb 0e0h,002h,0e2h,002h,000h,040h,010h,041h,020h,042h,030h,043h,040h,044h,050h,045h	; aa42  .....@.A B0C@DPE
	defb 060h,046h,070h,047h,080h,048h,080h,049h,080h,04ah,070h,04bh,070h,04ch,070h,04dh	; aa52  `FpG.H.I.JpKpLpM
	defb 060h,04eh,060h,04fh,060h,050h,050h,051h,050h,052h,050h,053h,040h,054h,040h,055h	; aa62  `N`O`PPQPRPS@T@U
	defb 040h,056h,030h,057h,030h,058h,030h,059h,020h,05ah,020h,05bh,020h,05ch,010h,05dh	; aa72  @V0W0X0Y Z [ \.]
	defb 010h,05eh,010h,05fh,010h,060h,000h,061h,000h,062h,000h,063h,0e0h,022h,0ffh	; aa82  .^._.`.a.b.c.".

; ----------------------------------------------------------------------
; DATOS partitura_AA91: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x85 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (75 bytes)
;   0xaa91..0xaadc  (75 bytes)
DATA_partitura_AA91:
	defb 0feh,002h,0f8h,01ah,0e0h,006h,0e2h,002h,000h,040h,010h,041h,020h,042h,030h,043h	; aa91  .........@.A B0C
	defb 040h,044h,050h,045h,060h,046h,070h,047h,080h,048h,080h,049h,080h,04ah,070h,04bh	; aaa1  @DPE`FpG.H.I.JpK
	defb 070h,04ch,070h,04dh,060h,04eh,060h,04fh,060h,050h,050h,051h,050h,052h,050h,053h	; aab1  pLpM`N`O`PPQPRPS
	defb 040h,054h,040h,055h,040h,056h,030h,057h,030h,058h,030h,059h,020h,05ah,020h,05bh	; aac1  @T@U@V0W0X0Y Z [
	defb 020h,05ch,010h,05dh,010h,05eh,010h,05fh,010h,060h,000h	; aad1   \.].^._.`.

; ----------------------------------------------------------------------
; DATOS partitura_AADC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x85 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xaadc..0xaae4  (8 bytes)
DATA_partitura_AADC:
	defb 061h,000h,062h,000h,063h,0e0h,01eh,0ffh	; aadc  a.b.c...

; ----------------------------------------------------------------------
; DATOS partitura_AAE4: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x85 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xaae4..0xaaec  (8 bytes)
DATA_partitura_AAE4:
	defb 0feh,002h,0f8h,01ah,0e0h,008h,0e2h,002h	; aae4  ........

; ----------------------------------------------------------------------
; DATOS partitura_AAEC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x85 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (75 bytes)
;   0xaaec..0xab37  (75 bytes)
DATA_partitura_AAEC:
	defb 000h,040h,010h,041h,020h,042h,030h,043h,040h,044h,050h,045h,060h,046h,070h,047h	; aaec  .@.A B0C@DPE`FpG
	defb 080h,048h,080h,049h,080h,04ah,070h,04bh,070h,04ch,070h,04dh,060h,04eh,060h,04fh	; aafc  .H.I.JpKpLpM`N`O
	defb 060h,050h,050h,051h,050h,052h,050h,053h,040h,054h,040h,055h,040h,056h,030h,057h	; ab0c  `PPQPRPS@T@U@V0W
	defb 030h,058h,030h,059h,020h,05ah,020h,05bh,020h,05ch,010h,05dh,010h,05eh,010h,05fh	; ab1c  0X0Y Z [ \.].^._
	defb 010h,060h,000h,061h,000h,062h,000h,063h,0e0h,01ch,0ffh	; ab2c  .`.a.b.c...

; ----------------------------------------------------------------------
; DATOS partitura_AB37: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x86 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xab37..0xab3a  (3 bytes)
DATA_partitura_AB37:
	defb 0f9h,0c2h,0aeh	; ab37

; ----------------------------------------------------------------------
; DATOS fin_tras_llamada_AB3A: el 0xFF tras la llamada 0xF9 a 0xAEC2: lo
;   llamado acaba en su propio 0xFF (no en 0xFA) y el canal se calla alli, asi
;   que este no se lee
;   0xab3a..0xab3b  (1 bytes)
DATA_fin_tras_llamada_AB3A:
	defb 0ffh	; ab3a

; ----------------------------------------------------------------------
; DATOS partitura_AB3B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x86 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xab3b..0xab3c  (1 bytes)
DATA_partitura_AB3B:
	defb 0f9h	; ab3b

; ----------------------------------------------------------------------
; DATOS partitura_AB3C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x86 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xab3c..0xab3e  (2 bytes)
DATA_partitura_AB3C:
	defb 02eh,0afh	; ab3c

; ----------------------------------------------------------------------
; DATOS fin_tras_llamada_AB3E: el 0xFF tras la llamada 0xF9 a 0xAF2E: lo
;   llamado acaba en su propio 0xFF (no en 0xFA) y el canal se calla alli, asi
;   que este no se lee
;   0xab3e..0xab3f  (1 bytes)
DATA_fin_tras_llamada_AB3E:
	defb 0ffh	; ab3e

; ----------------------------------------------------------------------
; DATOS partitura_AB3F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x86 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xab3f..0xab42  (3 bytes)
DATA_partitura_AB3F:
	defb 0f9h,0c6h,0afh	; ab3f

; ----------------------------------------------------------------------
; DATOS fin_tras_llamada_AB42: el 0xFF tras la llamada 0xF9 a 0xAFC6: lo
;   llamado acaba en su propio 0xFF (no en 0xFA) y el canal se calla alli, asi
;   que este no se lee
;   0xab42..0xab43  (1 bytes)
DATA_fin_tras_llamada_AB42:
	defb 0ffh	; ab42

; ----------------------------------------------------------------------
; DATOS partitura_AB43: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x86 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xab43..0xab46  (3 bytes)
DATA_partitura_AB43:
	defb 0f9h,0a7h,0b0h	; ab43

; ----------------------------------------------------------------------
; DATOS fin_tras_llamada_AB46: el 0xFF tras la llamada 0xF9 a 0xB0A7: lo
;   llamado acaba en su propio 0xFF (no en 0xFA) y el canal se calla alli, asi
;   que este no se lee
;   0xab46..0xab47  (1 bytes)
DATA_fin_tras_llamada_AB46:
	defb 0ffh	; ab46

; ----------------------------------------------------------------------
; DATOS partitura_AB47: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x86 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xab47..0xab4a  (3 bytes)
DATA_partitura_AB47:
	defb 0f9h,008h,0b1h	; ab47

; ----------------------------------------------------------------------
; DATOS fin_tras_llamada_AB4A: el 0xFF tras la llamada 0xF9 a 0xB108: lo
;   llamado acaba en su propio 0xFF (no en 0xFA) y el canal se calla alli, asi
;   que este no se lee
;   0xab4a..0xab4b  (1 bytes)
DATA_fin_tras_llamada_AB4A:
	defb 0ffh	; ab4a

; ----------------------------------------------------------------------
; DATOS partitura_AB4B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x86 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xab4b..0xab4e  (3 bytes)
DATA_partitura_AB4B:
	defb 0f9h,0d5h,0b1h	; ab4b

; ----------------------------------------------------------------------
; DATOS fin_tras_llamada_AB4E: el 0xFF tras la llamada 0xF9 a 0xB1D5: lo
;   llamado acaba en su propio 0xFF (no en 0xFA) y el canal se calla alli, asi
;   que este no se lee
;   0xab4e..0xab4f  (1 bytes)
DATA_fin_tras_llamada_AB4E:
	defb 0ffh	; ab4e

; ----------------------------------------------------------------------
; DATOS partitura_AB4F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (33 bytes)
;   0xab4f..0xab70  (33 bytes)
DATA_partitura_AB4F:
	defb 0feh,002h,0e0h,004h,0e2h,002h,000h,020h,000h,021h,000h,022h,010h,023h,010h,024h	; ab4f  ....... .!.".#.$
	defb 010h,025h,020h,026h,020h,027h,020h,028h,030h,029h,030h,02ah,030h,02bh,0e2h,003h	; ab5f  .% & ' (0)0*0+..
	defb 000h	; ab6f

; ----------------------------------------------------------------------
; DATOS partitura_AB70: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (5 bytes)
;   0xab70..0xab75  (5 bytes)
DATA_partitura_AB70:
	defb 02ch,000h,02dh,000h,02eh	; ab70

; ----------------------------------------------------------------------
; DATOS partitura_AB75: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xab75..0xab7c  (7 bytes)
DATA_partitura_AB75:
	defb 000h,02fh,000h,030h,000h,031h,0ffh	; ab75

; ----------------------------------------------------------------------
; DATOS partitura_AB7C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (59 bytes)
;   0xab7c..0xabb7  (59 bytes)
DATA_partitura_AB7C:
	defb 0feh,002h,0e1h,002h,0e4h,000h,001h,0e4h,001h,002h,0e4h,002h,003h,0e4h,003h,004h	; ab7c  ................
	defb 0e4h,004h,005h,0e4h,005h,0e4h,006h,006h,0e4h,007h,007h,0e4h,008h,008h,0e4h,009h	; ab8c  ................
	defb 009h,0e4h,00ah,00ah,0e4h,00bh,00ah,0e4h,00ch,00ah,0e4h,00dh,009h,0e4h,00eh,008h	; ab9c  ................
	defb 0e4h,00fh,008h,0e4h,010h,008h,0e4h,011h,007h,0e4h,012h	; abac  ...........

; ----------------------------------------------------------------------
; DATOS partitura_ABB7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (44 bytes)
;   0xabb7..0xabe3  (44 bytes)
DATA_partitura_ABB7:
	defb 007h,0e1h,00ah,0e4h,013h,006h,0e4h,014h,006h,0e4h,015h,005h,0e4h,016h,005h,0e4h	; abb7  ................
	defb 017h,004h,0e4h,018h,004h,0e4h,019h,004h,0e4h,01ah,004h,0e4h,01bh,004h,0e4h,01ch	; abc7  ................
	defb 004h,0e4h,01dh,003h,0e4h,01eh,002h,0e4h,01fh,001h,000h,0ffh	; abd7  ............

; ----------------------------------------------------------------------
; DATOS partitura_ABE3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (44 bytes)
;   0xabe3..0xac0f  (44 bytes)
DATA_partitura_ABE3:
	defb 0feh,002h,0f6h,0f8h,00dh,0e2h,002h,000h,020h,010h,021h,020h,022h,030h,023h,040h	; abe3  ........ .! "0#@
	defb 024h,050h,025h,060h,026h,070h,027h,080h,028h,090h,029h,0a0h,02ah,0b0h,02bh,0e2h	; abf3  $P%`&p'.(.).*.+.
	defb 003h,000h,02ch,000h,02dh,000h,02eh,000h,02fh,000h,030h,000h	; ac03  ..,.-.../.0.

; ----------------------------------------------------------------------
; DATOS partitura_AC0F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xac0f..0xac11  (2 bytes)
DATA_partitura_AC0F:
	defb 031h,0ffh	; ac0f

; ----------------------------------------------------------------------
; DATOS partitura_AC11: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (49 bytes)
;   0xac11..0xac42  (49 bytes)
DATA_partitura_AC11:
	defb 0feh,002h,0e0h,009h,0f8h,002h,0e2h,001h,0c3h,020h,0a2h,034h,0a1h,060h,0a1h,020h	; ac11  ......... .4.`.
	defb 0a0h,0f0h,0e0h,004h,0e2h,001h,043h,020h,042h,034h,041h,060h,041h,020h,040h,0f0h	; ac21  ......C B4A`A @.
	defb 0e0h,004h,0e2h,001h,023h,020h,022h,034h,021h,060h,021h,020h,020h,0f0h,0e0h,004h	; ac31  ....# "4!`!  ...
	defb 0e2h	; ac41

; ----------------------------------------------------------------------
; DATOS partitura_AC42: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xac42..0xac46  (4 bytes)
DATA_partitura_AC42:
	defb 001h,003h,020h,002h	; ac42

; ----------------------------------------------------------------------
; DATOS partitura_AC46: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xac46..0xac4e  (8 bytes)
DATA_partitura_AC46:
	defb 034h,001h,060h,001h,020h,000h,0f0h,0ffh	; ac46  4.`. ...

; ----------------------------------------------------------------------
; DATOS partitura_AC4E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (39 bytes)
;   0xac4e..0xac75  (39 bytes)
DATA_partitura_AC4E:
	defb 0feh,002h,0f6h,0f8h,00dh,0e0h,006h,0e2h,002h,000h,020h,010h,021h,020h,022h,030h	; ac4e  .......... .! "0
	defb 023h,040h,024h,050h,025h,060h,026h,070h,027h,080h,028h,090h,029h,0a0h,02ah,0b0h	; ac5e  #@$P%`&p'.(.).*.
	defb 02bh,0e2h,003h,000h,02ch,000h,02dh	; ac6e

; ----------------------------------------------------------------------
; DATOS partitura_AC75: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (9 bytes)
;   0xac75..0xac7e  (9 bytes)
DATA_partitura_AC75:
	defb 000h,02eh,000h,02fh,000h,030h,000h,031h,0ffh	; ac75  .../.0.1.

; ----------------------------------------------------------------------
; DATOS partitura_AC7E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (36 bytes)
;   0xac7e..0xaca2  (36 bytes)
DATA_partitura_AC7E:
	defb 0feh,002h,0f6h,0f8h,00dh,0e0h,009h,0e2h,002h,000h,020h,010h,021h,020h,022h,030h	; ac7e  .......... .! "0
	defb 023h,040h,024h,050h,025h,060h,026h,070h,027h,080h,028h,090h,029h,0a0h,02ah,0b0h	; ac8e  #@$P%`&p'.(.).*.
	defb 02bh,0e2h,003h,000h	; ac9e

; ----------------------------------------------------------------------
; DATOS partitura_ACA2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (12 bytes)
;   0xaca2..0xacae  (12 bytes)
DATA_partitura_ACA2:
	defb 02ch,000h,02dh,000h,02eh,000h,02fh,000h,030h,000h,031h,0ffh	; aca2  ,.-.../.0.1.

; ----------------------------------------------------------------------
; DATOS partitura_ACAE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x87 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (65 bytes)
;   0xacae..0xacef  (65 bytes)
DATA_partitura_ACAE:
	defb 0feh,002h,0e3h,001h,0e4h,014h,0a0h,020h,060h,014h,0e2h,001h,0a3h,015h,0a2h,026h	; acae  ....... `......&
	defb 093h,09fh,084h,01dh,082h,059h,086h,0bdh,087h,03dh,086h,0b6h,089h,09eh,085h,0e9h	; acbe  .....Y...=......
	defb 08bh,0e9h,086h,0ceh,08ch,034h,08dh,0b6h,08eh,09eh,043h,09fh,044h,01dh,042h,059h	; acce  .....4....C.D.BY
	defb 046h,0bdh,047h,03dh,046h,0b6h,049h,09eh,045h,0e9h,04bh,0e9h,046h,0ceh,04ch,034h	; acde  F.G=F.I.E.K.F.L4
	defb 0ffh	; acee

; ----------------------------------------------------------------------
; DATOS partitura_ACEF: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x87 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (61 bytes)
;   0xacef..0xad2c  (61 bytes)
DATA_partitura_ACEF:
	defb 0feh,002h,0e2h,001h,060h,010h,040h,014h,040h,015h,040h,016h,040h,01fh,030h,01dh	; acef  ....`.@.@.@.@.0.
	defb 030h,019h,030h,01dh,030h,00dh,030h,016h,030h,01eh,020h,019h,020h,019h,020h,01eh	; acff  0.0.0.0.0. . . .
	defb 020h,014h,020h,016h,020h,01eh,010h,01fh,010h,01dh,010h,019h,010h,01dh,000h,01dh	; ad0f   . . ...........
	defb 000h,016h,000h,01eh,000h,019h,000h,019h,000h,01eh,000h,014h,0ffh	; ad1f  .............

; ----------------------------------------------------------------------
; DATOS partitura_AD2C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x87 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xad2c..0xad33  (7 bytes)
DATA_partitura_AD2C:
	defb 0feh,002h,0f6h,0f8h,014h,0e2h,001h	; ad2c

; ----------------------------------------------------------------------
; DATOS partitura_AD33: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x87 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xad33..0xad37  (4 bytes)
DATA_partitura_AD33:
	defb 0c2h,010h,0c4h,000h	; ad33

; ----------------------------------------------------------------------
; DATOS partitura_AD37: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x87 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (9 bytes)
;   0xad37..0xad40  (9 bytes)
DATA_partitura_AD37:
	defb 0feh,002h,0f8h,014h,0e2h,001h,0f9h,058h,0adh	; ad37  .......X.

; ----------------------------------------------------------------------
; DATOS partitura_AD40: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x87 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (10 bytes)
;   0xad40..0xad4a  (10 bytes)
DATA_partitura_AD40:
	defb 0feh,002h,0f8h,014h,0e2h,001h,0c0h,0d0h,0c1h,000h	; ad40  ..........

; ----------------------------------------------------------------------
; DATOS partitura_AD4A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x87 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (29 bytes)
;   0xad4a..0xad67  (29 bytes)
DATA_partitura_AD4A:
	defb 0feh,002h,0f8h,014h,0e2h,001h,0c1h,0a0h,0c2h,040h,0c5h,000h,0c7h,000h,0c3h,015h	; ad4a  .........@......
	defb 0c2h,026h,0b3h,09fh,0a4h,01dh,0a2h,059h,0a6h,0bdh,0a7h,03dh,0a6h	; ad5a  .&.....Y...=.

; ----------------------------------------------------------------------
; DATOS partitura_AD67: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x87 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (34 bytes)
;   0xad67..0xad89  (34 bytes)
DATA_partitura_AD67:
	defb 0b6h,0a9h,09eh,0a5h,0e9h,0abh,0e9h,0a6h,0ceh,0ach,034h,0adh,0b6h,0aeh,09eh,023h	; ad67  ..........4....#
	defb 09fh,024h,01dh,022h,059h,026h,0bdh,027h,03dh,026h,0b6h,029h,09eh,025h,0e9h,02bh	; ad77  .$."Y&.'=&.).%.+
	defb 0e9h,026h	; ad87

; ----------------------------------------------------------------------
; DATOS partitura_AD89: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x87 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xad89..0xad8b  (2 bytes)
DATA_partitura_AD89:
	defb 0ceh,02ch	; ad89

; ----------------------------------------------------------------------
; DATOS partitura_AD8B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x87 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (28 bytes)
;   0xad8b..0xada7  (28 bytes)
DATA_partitura_AD8B:
	defb 034h,02dh,0b6h,02eh,09eh,002h,059h,006h,0bdh,007h,03dh,006h,0b6h,009h,09eh,005h	; ad8b  4-....Y...=.....
	defb 0e9h,00bh,0e9h,006h,0ceh,00ch,034h,00dh,0b6h,00eh,09eh,0ffh	; ad9b  ......4.....

; ----------------------------------------------------------------------
; DATOS partitura_ADA7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x88 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (23 bytes)
;   0xada7..0xadbe  (23 bytes)
DATA_partitura_ADA7:
	defb 0feh,004h,0e9h,004h,0d1h,097h,0f5h,060h,060h,060h,060h,060h,060h,060h,060h,070h	; ada7  .......````````p
	defb 070h,070h,070h,070h,070h,070h,070h	; adb7

; ----------------------------------------------------------------------
; DATOS partitura_ADBE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x88 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (9 bytes)
;   0xadbe..0xadc7  (9 bytes)
DATA_partitura_ADBE:
	defb 083h,063h,0fbh,003h,0f5h,061h,061h,062h,060h	; adbe  .c...aab`

; ----------------------------------------------------------------------
; DATOS partitura_ADC7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x88 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (22 bytes)
;   0xadc7..0xaddd  (22 bytes)
DATA_partitura_ADC7:
	defb 071h,072h,070h,071h,083h,063h,0fbh,003h,0e9h,009h,073h,087h,0feh,001h,0e9h,004h	; adc7  qrpq.c....s.....
	defb 0f5h,0c0h,0fbh,019h,0cfh,0ffh	; add7

; ----------------------------------------------------------------------
; DATOS partitura_ADDD: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x88 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xaddd..0xadde  (1 bytes)
DATA_partitura_ADDD:
	defb 0ffh	; addd

; ----------------------------------------------------------------------
; DATOS partitura_ADDE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x88 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (22 bytes)
;   0xadde..0xadf4  (22 bytes)
DATA_partitura_ADDE:
	defb 0feh,001h,0f6h,0f8h,002h,0d6h,030h,006h,0e9h,008h,0f0h,007h,01fh,0eah,008h,0ebh	; adde  ......0.........
	defb 009h,027h,091h,0d4h,0b3h,077h	; adee

; ----------------------------------------------------------------------
; DATOS partitura_ADF4: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x88 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xadf4..0xadfc  (8 bytes)
DATA_partitura_ADF4:
	defb 093h,0d3h,007h,0d4h,0b3h,097h,073h,067h	; adf4  ......sg

; ----------------------------------------------------------------------
; DATOS partitura_ADFC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x88 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (22 bytes)
;   0xadfc..0xae12  (22 bytes)
DATA_partitura_ADFC:
	defb 0d3h,0eeh,088h,023h,077h,0eeh,090h,063h,0eeh,0a0h,047h,0eeh,0b0h,023h,0eeh,0c0h	; adfc  ...#w..c..G..#..
	defb 003h,0eeh,0d0h,0e9h,009h,003h	; ae0c

; ----------------------------------------------------------------------
; DATOS partitura_AE12: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x88 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xae12..0xae1d  (11 bytes)
DATA_partitura_AE12:
	defb 0d6h,001h,040h,0eeh,0e0h,0d4h,093h,0eeh,0f0h,07fh,0ffh	; ae12  ..@........

; ----------------------------------------------------------------------
; DATOS partitura_AE1D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x88 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (22 bytes)
;   0xae1d..0xae33  (22 bytes)
DATA_partitura_AE1D:
	defb 0feh,001h,0f8h,002h,0e9h,008h,0f0h,001h,031h,0d6h,004h,002h,0eah,007h,0ebh,00ah	; ae1d  ........1.......
	defb 016h,091h,0d3h,073h,0d2h,027h	; ae2d

; ----------------------------------------------------------------------
; DATOS partitura_AE33: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x88 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (32 bytes)
;   0xae33..0xae53  (32 bytes)
DATA_partitura_AE33:
	defb 023h,005h,021h,023h,0d6h,020h,010h,0f0h,001h,015h,045h,041h,041h,021h,023h,0d3h	; ae33  #.!#. ....EAA!#.
	defb 093h,073h,0d2h,027h,023h,025h,021h,023h,043h,0e9h,009h,0d3h,093h,0d2h,023h,02fh	; ae43  .s.'#%!#C.....#/

; ----------------------------------------------------------------------
; DATOS partitura_AE53: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x88 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xae53..0xae54  (1 bytes)
DATA_partitura_AE53:
	defb 0ffh	; ae53

; ----------------------------------------------------------------------
; DATOS partitura_AE54: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x88 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (55 bytes)
;   0xae54..0xae8b  (55 bytes)
DATA_partitura_AE54:
	defb 0feh,001h,0f8h,002h,0e9h,008h,0f0h,001h,032h,0d6h,004h,002h,0eah,007h,0ebh,00ah	; ae54  ........2.......
	defb 016h,091h,0d2h,023h,077h,063h,0f0h,001h,014h,0d6h,004h,004h,045h,061h,073h,0eeh	; ae64  ...#wc......Eas.
	defb 090h,095h,0b1h,091h,071h,063h,023h,023h,0b7h,0d6h,010h,020h,093h,075h,061h,073h	; ae74  ....qc##... .uas
	defb 093h,0e9h,009h,043h,063h,07fh,0ffh	; ae84

; ----------------------------------------------------------------------
; DATOS partitura_AE8B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x88 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (40 bytes)
;   0xae8b..0xaeb3  (40 bytes)
DATA_partitura_AE8B:
	defb 0feh,001h,0f8h,002h,0e9h,009h,0c1h,0e9h,008h,0eeh,090h,0f0h,001h,033h,0d6h,004h	; ae8b  .............3..
	defb 002h,0eah,004h,0edh,013h,0ebh,087h,013h,0f1h,0d2h,023h,077h,063h,045h,061h,0d6h	; ae9b  ..........#wcEa.
	defb 004h,00ah,073h,095h,0b1h,091h,071h,063h	; aeab  ..s...qc

; ----------------------------------------------------------------------
; DATOS partitura_AEB3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x88 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (14 bytes)
;   0xaeb3..0xaec1  (14 bytes)
DATA_partitura_AEB3:
	defb 023h,023h,0b7h,093h,075h,061h,073h,093h,0e9h,009h,043h,063h,07ch,0ffh	; aeb3  ##..uas...Cc|.

; ----------------------------------------------------------------------
; DATOS partitura_AEC1: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x95 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xaec1..0xaec2  (1 bytes)
DATA_partitura_AEC1:
	defb 0ffh	; aec1

; ----------------------------------------------------------------------
; DATOS partitura_AEC2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x86, 0x94 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (43 bytes)
;   0xaec2..0xaeed  (43 bytes)
DATA_partitura_AEC2:
	defb 0feh,002h,0e2h,00ah,0c7h,000h,0e1h,002h,0e4h,01fh,00ch,0e4h,01eh,00bh,0e4h,01dh	; aec2  ................
	defb 00bh,0e4h,01ch,00bh,0e4h,01fh,00bh,0e4h,019h,00ch,0e4h,01fh,00bh,0e4h,01dh,00ah	; aed2  ................
	defb 0e4h,01fh,009h,0e3h,002h,090h,060h,090h,040h,090h,010h	; aee2  ......`.@..

; ----------------------------------------------------------------------
; DATOS partitura_AEED: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x86, 0x94 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (65 bytes)
;   0xaeed..0xaf2e  (65 bytes)
DATA_partitura_AEED:
	defb 090h,003h,090h,040h,0f5h,090h,042h,090h,021h,090h,020h,000h,090h,0fbh,002h,0f5h	; aeed  ...@..B.!. .....
	defb 070h,012h,020h,021h,070h,021h,090h,010h,000h,090h,080h,020h,0fbh,003h,0f5h,050h	; aefd  p. !p!..... ...P
	defb 012h,020h,021h,050h,021h,040h,010h,000h,090h,032h,000h,0fbh,004h,0f5h,040h,020h	; af0d  . !P!@...2....@
	defb 020h,010h,030h,020h,030h,020h,000h,090h,023h,003h,056h,000h,0fbh,003h,0e0h,030h	; af1d   .0 0 ..#.V....0
	defb 0ffh	; af2d

; ----------------------------------------------------------------------
; DATOS partitura_AF2E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x86, 0x94 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (62 bytes)
;   0xaf2e..0xaf6c  (62 bytes)
DATA_partitura_AF2E:
	defb 0feh,002h,0e2h,002h,0c1h,0c0h,0c2h,0a0h,0c4h,000h,0c6h,000h,0c7h,000h,0a1h,0a0h	; af2e  ................
	defb 0a2h,080h,0a3h,0e0h,0a5h,0e0h,0a6h,0e0h,081h,080h,082h,060h,083h,0b0h,085h,0b0h	; af3e  ...........`....
	defb 086h,0b0h,061h,080h,062h,060h,063h,0b0h,065h,0b0h,066h,0b0h,041h,080h,042h,060h	; af4e  ..a.b`c.e.f.A.B`
	defb 043h,0b0h,045h,0b0h,046h,0b0h,021h,080h,022h,060h,023h,0b0h,025h,0b0h	; af5e  C.E.F.!."`#.%.

; ----------------------------------------------------------------------
; DATOS partitura_AF6C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x86, 0x94 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xaf6c..0xaf72  (6 bytes)
DATA_partitura_AF6C:
	defb 026h,0b0h,001h,080h,002h,060h	; af6c

; ----------------------------------------------------------------------
; DATOS partitura_AF72: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x86, 0x94 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xaf72..0xaf79  (7 bytes)
DATA_partitura_AF72:
	defb 003h,0b0h,005h,0b0h,006h,0b0h,0ffh	; af72

; ----------------------------------------------------------------------
; DATOS partitura_AF79: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x94 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (15 bytes)
;   0xaf79..0xaf88  (15 bytes)
DATA_partitura_AF79:
	defb 0feh,002h,0e0h,002h,0e2h,003h,0c1h,0c0h,0c2h,0a0h,0c4h,000h,0c6h,000h,0c7h	; af79  ...............

; ----------------------------------------------------------------------
; DATOS partitura_AF88: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x94 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (12 bytes)
;   0xaf88..0xaf94  (12 bytes)
DATA_partitura_AF88:
	defb 000h,0a1h,0a0h,0a2h,080h,0a3h,0e0h,0a5h,0e0h,0a6h,0e0h,081h	; af88  ............

; ----------------------------------------------------------------------
; DATOS partitura_AF94: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x94 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (23 bytes)
;   0xaf94..0xafab  (23 bytes)
DATA_partitura_AF94:
	defb 080h,082h,060h,083h,0b0h,085h,0b0h,086h,0b0h,061h,080h,062h,060h,063h,0b0h,065h	; af94  ..`......a.b`c.e
	defb 0b0h,066h,0b0h,041h,080h,042h,060h	; afa4

; ----------------------------------------------------------------------
; DATOS partitura_AFAB: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x94 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (27 bytes)
;   0xafab..0xafc6  (27 bytes)
DATA_partitura_AFAB:
	defb 043h,0b0h,045h,0b0h,046h,0b0h,021h,080h,022h,060h,023h,0b0h,025h,0b0h,026h,0b0h	; afab  C.E.F.!."`#.%.&.
	defb 001h,080h,002h,060h,003h,0b0h,005h,0b0h,006h,0b0h,0ffh	; afbb  ...`.......

; ----------------------------------------------------------------------
; DATOS partitura_AFC6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x86, 0x94 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xafc6..0xafca  (4 bytes)
DATA_partitura_AFC6:
	defb 0feh,002h,0f8h,028h	; afc6

; ----------------------------------------------------------------------
; DATOS partitura_AFCA: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x86, 0x94 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xafca..0xafcb  (1 bytes)
DATA_partitura_AFCA:
	defb 0f5h	; afca

; ----------------------------------------------------------------------
; DATOS partitura_AFCB: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x86, 0x94 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xafcb..0xafd1  (6 bytes)
DATA_partitura_AFCB:
	defb 0e2h,003h,0c5h,000h,0c8h,000h	; afcb

; ----------------------------------------------------------------------
; DATOS partitura_AFD1: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x86, 0x94 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (29 bytes)
;   0xafd1..0xafee  (29 bytes)
DATA_partitura_AFD1:
	defb 0c9h,000h,0e2h,001h,064h,000h,0fbh,003h,0e2h,001h,0f5h,000h,050h,0a6h,000h,0a2h	; afd1  ....d.......P...
	defb 000h,0a3h,000h,0a4h,000h,0a5h,000h,0a6h,000h,0fbh,006h,0f5h,0c4h	; afe1  .............

; ----------------------------------------------------------------------
; DATOS partitura_AFEE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x86, 0x94 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (40 bytes)
;   0xafee..0xb016  (40 bytes)
DATA_partitura_AFEE:
	defb 0f0h,0c1h,0f0h,0c6h,0f0h,0c3h,0f0h,0c8h,0f0h,0c3h,0f0h,0c5h,0f0h,0c7h,0f0h,0c5h	; afee  ................
	defb 0f0h,0c6h,0f0h,0c7h,0f0h,0cah,0f0h,0c8h,0f0h,0c9h,0f0h,0ceh,0f0h,0fbh,002h,0f5h	; affe  ................
	defb 0a1h,0d0h,0afh,0d0h,0a3h,0d0h,0a4h,0d0h	; b00e  ........

; ----------------------------------------------------------------------
; DATOS partitura_B016: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x86, 0x94 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (15 bytes)
;   0xb016..0xb025  (15 bytes)
DATA_partitura_B016:
	defb 0a8h,0d0h,0a6h,0d0h,0a7h,0d0h,0a8h,0d0h,0a9h,0d0h,0aah,0d0h,0abh,0d0h,0ach	; b016  ...............

; ----------------------------------------------------------------------
; DATOS partitura_B025: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x86, 0x94 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (10 bytes)
;   0xb025..0xb02f  (10 bytes)
DATA_partitura_B025:
	defb 0d0h,0adh,0d0h,0aeh,0d0h,0fbh,004h,083h,0e0h,084h	; b025  ..........

; ----------------------------------------------------------------------
; DATOS partitura_B02F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x86, 0x94 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xb02f..0xb048  (25 bytes)
DATA_partitura_B02F:
	defb 0e0h,085h,0e0h,086h,0e0h,087h,0e0h,088h,0e0h,089h,0e0h,08ah,0e0h,08bh,0e0h,08ch	; b02f  ................
	defb 0e0h,08dh,0b0h,08eh,0e0h,08fh,0e0h,0feh,002h	; b03f  .........

; ----------------------------------------------------------------------
; DATOS partitura_B048: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x86, 0x94 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (30 bytes)
;   0xb048..0xb066  (30 bytes)
DATA_partitura_B048:
	defb 0f8h,028h,0e2h,001h,064h,0e0h,065h,0e0h,066h,0e0h,067h,0e0h,068h,0e0h,069h,0e0h	; b048  .(..d.e.f.g.h.i.
	defb 06ah,0e0h,06bh,0e0h,06ch,0e0h,06eh,0d0h,06eh,0e0h,06fh,0e0h,045h,0e0h	; b058  j.k.l.n.n.o.E.

; ----------------------------------------------------------------------
; DATOS partitura_B066: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x86, 0x94 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (65 bytes)
;   0xb066..0xb0a7  (65 bytes)
DATA_partitura_B066:
	defb 046h,0e0h,047h,0e0h,048h,0e0h,049h,0e0h,04ah,0e0h,04bh,0e0h,04ch,0e0h,04dh,0e0h	; b066  F.G.H.I.J.K.L.M.
	defb 04eh,0e0h,04fh,0e0h,025h,0e0h,026h,0e0h,027h,0e0h,028h,0e0h,029h,0e0h,02ah,0e0h	; b076  N.O.%.&.'.(.).*.
	defb 02bh,0e0h,02ch,0e0h,02dh,0e0h,02eh,0e0h,02fh,0e0h,005h,0e0h,006h,0e0h,007h,0e0h	; b086  +.,.-.../.......
	defb 008h,0e0h,009h,0e0h,00ah,0e0h,00bh,0e0h,00ch,0e0h,00dh,0e0h,00eh,0e0h,00fh,0e0h	; b096  ................
	defb 0ffh	; b0a6

; ----------------------------------------------------------------------
; DATOS partitura_B0A7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x86, 0x94 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xb0a7..0xb0b8  (17 bytes)
DATA_partitura_B0A7:
	defb 0feh,002h,0f6h,0f8h,026h,0f5h,0e2h,003h,0c8h,000h,0c5h,000h,0c6h,000h,0c7h,000h	; b0a7  ....&...........
	defb 0e2h	; b0b7

; ----------------------------------------------------------------------
; DATOS partitura_B0B8: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x86, 0x94 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (16 bytes)
;   0xb0b8..0xb0c8  (16 bytes)
DATA_partitura_B0B8:
	defb 001h,0c8h,000h,0fbh,004h,0e2h,004h,0c5h,050h,0c6h,000h,0c7h,000h,0c8h,000h,0c9h	; b0b8  ........P.......

; ----------------------------------------------------------------------
; DATOS partitura_B0C8: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x86, 0x94 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (64 bytes)
;   0xb0c8..0xb108  (64 bytes)
DATA_partitura_B0C8:
	defb 000h,0cah,000h,0cbh,000h,0a7h,0f0h,0a8h,0f0h,0a9h,0f0h,0aah,0f0h,0abh,0f0h,0ach	; b0c8  ................
	defb 0f0h,0adh,0f0h,0aeh,0f0h,089h,0d0h,08ah,0d0h,08bh,0d0h,08ch,0d0h,08dh,0d0h,08eh	; b0d8  ................
	defb 0d0h,069h,0e0h,06ah,0e0h,06bh,0e0h,06ch,0e0h,06dh,0e0h,06eh,0e0h,06fh,0e0h,04bh	; b0e8  .i.j.k.l.m.n.o.K
	defb 0e0h,04ch,0e0h,04dh,0e0h,04eh,0e0h,04fh,0e0h,00ah,0e0h,00bh,0e0h,00ch,0e0h,0ffh	; b0f8  .L.M.N.O........

; ----------------------------------------------------------------------
; DATOS partitura_B108: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x86, 0x94 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (36 bytes)
;   0xb108..0xb12c  (36 bytes)
DATA_partitura_B108:
	defb 0feh,002h,0f8h,027h,0e2h,001h,0f5h,0c5h,030h,002h,040h,0c7h,090h,009h,030h,0c4h	; b108  ...'....0.@...0.
	defb 000h,074h,099h,0fbh,009h,0f5h,0e2h,002h,0c5h,000h,0c6h,000h,0c7h,000h,0e2h,001h	; b118  .t..............
	defb 0c8h,000h,0fbh,007h	; b128

; ----------------------------------------------------------------------
; DATOS partitura_B12C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x86, 0x94 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xb12c..0xb130  (4 bytes)
DATA_partitura_B12C:
	defb 0e2h,003h,0c5h,050h	; b12c

; ----------------------------------------------------------------------
; DATOS partitura_B130: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x86, 0x94 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xb130..0xb137  (7 bytes)
DATA_partitura_B130:
	defb 0c6h,000h,0c7h,000h,0c8h,000h,0c9h	; b130

; ----------------------------------------------------------------------
; DATOS partitura_B137: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x86, 0x94 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (33 bytes)
;   0xb137..0xb158  (33 bytes)
DATA_partitura_B137:
	defb 000h,0cah,000h,0cbh,000h,0a7h,0f0h,0a8h,0f0h,0a9h,0f0h,0aah,0f0h,0abh,0f0h,0ach	; b137  ................
	defb 0f0h,0adh,0f0h,0aeh,0f0h,089h,0d0h,08ah,0d0h,08bh,0d0h,08ch,0d0h,08dh,0d0h,08eh	; b147  ................
	defb 0d0h	; b157

; ----------------------------------------------------------------------
; DATOS partitura_B158: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x86, 0x94 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xb158..0xb159  (1 bytes)
DATA_partitura_B158:
	defb 069h	; b158

; ----------------------------------------------------------------------
; DATOS partitura_B159: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x86, 0x94 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (12 bytes)
;   0xb159..0xb165  (12 bytes)
DATA_partitura_B159:
	defb 0e0h,06ah,0e0h,06bh,0e0h,06ch,0e0h,06dh,0e0h,06eh,0e0h,06fh	; b159  .j.k.l.m.n.o

; ----------------------------------------------------------------------
; DATOS partitura_B165: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x86, 0x94 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xb165..0xb177  (18 bytes)
DATA_partitura_B165:
	defb 0e0h,04bh,0e0h,04ch,0e0h,04dh,0e0h,04eh,0e0h,04fh,0e0h,00ah,0e0h,00bh,0e0h,00ch	; b165  .K.L.M.N.O......
	defb 0e0h,0ffh	; b175

; ----------------------------------------------------------------------
; DATOS partitura_B177: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x94 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xb177..0xb17b  (4 bytes)
DATA_partitura_B177:
	defb 0feh,002h,0f8h,028h	; b177

; ----------------------------------------------------------------------
; DATOS partitura_B17B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x94 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xb17b..0xb181  (6 bytes)
DATA_partitura_B17B:
	defb 0f5h,0e2h,003h,0c4h,050h,0c6h	; b17b

; ----------------------------------------------------------------------
; DATOS partitura_B181: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x94 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (31 bytes)
;   0xb181..0xb1a0  (31 bytes)
DATA_partitura_B181:
	defb 000h,0c7h,000h,0e2h,001h,0c3h,050h,0fbh,008h,0e2h,002h,0c5h,050h,0c6h,000h,0c7h	; b181  ......P.....P...
	defb 000h,0c8h,000h,0c8h,000h,0cah,000h,0c4h,000h,0a7h,0f0h,0a4h,0f0h,0a6h,0f0h	; b191  ...............

; ----------------------------------------------------------------------
; DATOS partitura_B1A0: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x94 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xb1a0..0xb1b2  (18 bytes)
DATA_partitura_B1A0:
	defb 0aah,0f0h,0a4h,0f0h,0ach,0f0h,0a5h,0f0h,0a4h,0f0h,089h,0d0h,086h,0d0h,08bh,0d0h	; b1a0  ................
	defb 085h,0d0h	; b1b0

; ----------------------------------------------------------------------
; DATOS partitura_B1B2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x94 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (35 bytes)
;   0xb1b2..0xb1d5  (35 bytes)
DATA_partitura_B1B2:
	defb 08dh,0d0h,086h,0d0h,069h,0e0h,066h,0e0h,065h,0e0h,06ch,0e0h,06dh,040h,063h,0e0h	; b1b2  ....i.f.e.l.m@c.
	defb 066h,0e0h,04bh,0e0h,045h,0e0h,046h,0e0h,047h,0e0h,046h,0e0h,007h,0e0h,006h,0e0h	; b1c2  f.K.E.F.G.F.....
	defb 008h,0e0h,0ffh	; b1d2

; ----------------------------------------------------------------------
; DATOS partitura_B1D5: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x86, 0x94 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (9 bytes)
;   0xb1d5..0xb1de  (9 bytes)
DATA_partitura_B1D5:
	defb 0feh,002h,0f8h,028h,0e2h,003h,0c4h,050h,0c5h	; b1d5  ...(...P.

; ----------------------------------------------------------------------
; DATOS partitura_B1DE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x86, 0x94 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xb1de..0xb1f7  (25 bytes)
DATA_partitura_B1DE:
	defb 000h,0c6h,000h,0e2h,001h,0c7h,000h,0e2h,002h,0c4h,050h,0c5h,000h,0c6h,000h,0c7h	; b1de  ..........P.....
	defb 000h,0c7h,080h,0c9h,000h,0c3h,000h,0a6h,0f0h	; b1ee  .........

; ----------------------------------------------------------------------
; DATOS partitura_B1F7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x86, 0x94 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (24 bytes)
;   0xb1f7..0xb20f  (24 bytes)
DATA_partitura_B1F7:
	defb 0a3h,0f0h,0a5h,0f0h,0a9h,0f0h,0a3h,0f0h,0abh,0f0h,0a4h,0f0h,0a3h,0f0h,088h,0d0h	; b1f7  ................
	defb 085h,0d0h,08ah,0d0h,084h,0d0h,08ch,0d0h	; b207  ........

; ----------------------------------------------------------------------
; DATOS partitura_B20F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x86, 0x94 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (12 bytes)
;   0xb20f..0xb21b  (12 bytes)
DATA_partitura_B20F:
	defb 085h,0d0h,065h,0e0h,065h,0e0h,064h,0e0h,06bh,0e0h,06ch,040h	; b20f  ..e.e.d.k.l@

; ----------------------------------------------------------------------
; DATOS partitura_B21B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x86, 0x94 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (24 bytes)
;   0xb21b..0xb233  (24 bytes)
DATA_partitura_B21B:
	defb 065h,0e0h,065h,0e0h,064h,0e0h,06bh,0e0h,06ch,0e0h,065h,0e0h,067h,0e0h,04ah,0e0h	; b21b  e.e.d.k.l.e.g.J.
	defb 044h,0e0h,045h,0e0h,046h,0e0h,045h,0e0h	; b22b  D.E.F.E.

; ----------------------------------------------------------------------
; DATOS partitura_B233: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x86, 0x94 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xb233..0xb23a  (7 bytes)
DATA_partitura_B233:
	defb 006h,0e0h,005h,0e0h,007h,0e0h,0ffh	; b233

; ----------------------------------------------------------------------
; DATOS partitura_B23A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (38 bytes)
;   0xb23a..0xb260  (38 bytes)
DATA_partitura_B23A:
	defb 0feh,004h,0e9h,00ch,0f5h,0a7h,0a7h,0a7h,007h,0fbh,004h,0feh,004h,0e9h,00ch,0d0h	; b23a  ................
	defb 0a7h,075h,000h,01eh,021h,000h,0a6h,075h,000h,01eh,021h,000h,0a6h,075h,000h,01eh	; b24a  .u..!..u..!..u..
	defb 021h,000h,0a6h,075h,000h,000h	; b25a

; ----------------------------------------------------------------------
; DATOS partitura_B260: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (26 bytes)
;   0xb260..0xb27a  (26 bytes)
DATA_partitura_B260:
	defb 070h,070h,000h,0a0h,000h,0a5h,0a0h,020h,070h,070h,070h,0feh,004h,0e9h,00ch,0f5h	; b260  pp..... ppp.....
	defb 0a7h,007h,0a7h,007h,0fbh,002h,0feh,004h,0e9h,00ch	; b270  ..........

; ----------------------------------------------------------------------
; DATOS partitura_B27A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xb27a..0xb281  (7 bytes)
DATA_partitura_B27A:
	defb 0a7h,007h,0a7h,007h,0a7h,007h,0a7h	; b27a

; ----------------------------------------------------------------------
; DATOS partituras_B281: 1 partitura entera (de la primera nota a su 0xFF o
;   salto) que no lee ninguno de los sonidos 0x01-0xEF tocados con
;   tools/partituras.py
;   0xb281..0xb288  (7 bytes)
DATA_partituras_B281:
	defb 004h,070h,0d1h,001h,0fdh,045h,0b2h	; b281

; ----------------------------------------------------------------------
; DATOS partitura_B288: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (33 bytes)
;   0xb288..0xb2a9  (33 bytes)
DATA_partitura_B288:
	defb 0feh,001h,0e9h,00ch,0f5h,0cfh,0fbh,008h,0feh,001h,0e9h,00ch,0eeh,082h,0c1h,0ech	; b288  ................
	defb 0eah,004h,0f0h,009h,024h,0d3h,0afh,0afh,08fh,08fh,0afh,0afh,08fh,08fh,0efh,0feh	; b298  ....$...........
	defb 001h	; b2a8

; ----------------------------------------------------------------------
; DATOS partitura_B2A9: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (34 bytes)
;   0xb2a9..0xb2cb  (34 bytes)
DATA_partitura_B2A9:
	defb 0e9h,00ch,0eeh,084h,0eah,004h,0d6h,010h,001h,0dbh,002h,0d4h,08fh,08fh,08fh,08fh	; b2a9  ................
	defb 0feh,001h,0e9h,00ch,0eeh,084h,0eah,004h,0d6h,010h,001h,0dbh,002h,0d4h,08fh,08fh	; b2b9  ................
	defb 08fh,08dh	; b2c9

; ----------------------------------------------------------------------
; DATOS salto_final_B2CB: el salto final 0xFD a 0xB290: en lo tocado con
;   tools/partituras.py (hasta 75 s o hasta que el estado se repite) no se
;   llega a leer
;   0xb2cb..0xb2ce  (3 bytes)
DATA_salto_final_B2CB:
	defb 0fdh,090h,0b2h	; b2cb

; ----------------------------------------------------------------------
; DATOS partitura_B2CE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (56 bytes)
;   0xb2ce..0xb306  (56 bytes)
DATA_partitura_B2CE:
	defb 0feh,001h,0e9h,00ch,0f5h,0cfh,0fbh,008h,0feh,001h,0e9h,00ch,0eeh,088h,0f5h,0eah	; b2ce  ................
	defb 009h,0edh,072h,0ebh,087h,017h,0f1h,0dbh,003h,0d6h,010h,001h,0d4h,07fh,0eah,003h	; b2de  ..r.............
	defb 07fh,0eah,009h,05fh,0eah,003h,05fh,0fbh,002h,0efh,0feh,001h,0e9h,00ch,0eeh,004h	; b2ee  ..._.._.........
	defb 0ech,0eah,004h,0d6h,010h,001h,0d4h,08fh	; b2fe  ........

; ----------------------------------------------------------------------
; DATOS partitura_B306: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (21 bytes)
;   0xb306..0xb31b  (21 bytes)
DATA_partitura_B306:
	defb 08fh,08fh,08fh,0feh,001h,0e9h,00ch,0eeh,004h,0eah,004h,0d6h,010h,001h,0dbh,002h	; b306  ................
	defb 0d5h,08fh,08fh,08fh,08fh	; b316

; ----------------------------------------------------------------------
; DATOS salto_final_B31B: el salto final 0xFD a 0xB2D6: en lo tocado con
;   tools/partituras.py (hasta 75 s o hasta que el estado se repite) no se
;   llega a leer
;   0xb31b..0xb31e  (3 bytes)
DATA_salto_final_B31B:
	defb 0fdh,0d6h,0b2h	; b31b

; ----------------------------------------------------------------------
; DATOS partitura_B31E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (19 bytes)
;   0xb31e..0xb331  (19 bytes)
DATA_partitura_B31E:
	defb 0feh,001h,0f8h,04bh,0e9h,00ch,0eah,00eh,0edh,017h,0ebh,087h,037h,091h,0d6h,010h	; b31e  ...K........7...
	defb 001h,0f5h,0d4h	; b32e

; ----------------------------------------------------------------------
; DATOS partitura_B331: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (15 bytes)
;   0xb331..0xb340  (15 bytes)
DATA_partitura_B331:
	defb 007h,0d5h,0a7h,08fh,0fbh,004h,0feh,001h,0f8h,04bh,0e9h,00ch,0f5h,0eah,00eh	; b331  .........K.....

; ----------------------------------------------------------------------
; DATOS partitura_B340: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (75 bytes)
;   0xb340..0xb38b  (75 bytes)
DATA_partitura_B340:
	defb 0edh,075h,0ebh,087h,037h,0f1h,0d6h,010h,001h,0dbh,004h,0d4h,07fh,0eah,004h,07fh	; b340  .u..7...........
	defb 0eah,00fh,0edh,017h,0ebh,087h,037h,0f1h,0dbh,002h,05fh,0ech,0eah,004h,05fh,0fbh	; b350  ......7..._..._.
	defb 002h,0feh,001h,0f8h,04bh,0e9h,00ch,0eah,00eh,0ebh,019h,037h,0a1h,0d6h,010h,001h	; b360  ....K......7....
	defb 0d5h,08fh,08fh,08fh,08fh,0feh,001h,0f8h,04bh,0e9h,00ch,0eah,00eh,0ebh,019h,037h	; b370  ........K......7
	defb 0a1h,0d6h,010h,001h,0dbh,002h,0d5h,08fh,08fh,08fh,08fh	; b380  ...........

; ----------------------------------------------------------------------
; DATOS salto_final_B38B: el salto final 0xFD a 0xB337: en lo tocado con
;   tools/partituras.py (hasta 75 s o hasta que el estado se repite) no se
;   llega a leer
;   0xb38b..0xb38e  (3 bytes)
DATA_salto_final_B38B:
	defb 0fdh,037h,0b3h	; b38b

; ----------------------------------------------------------------------
; DATOS partitura_B38E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xb38e..0xb391  (3 bytes)
DATA_partitura_B38E:
	defb 0feh,001h,0f6h	; b38e

; ----------------------------------------------------------------------
; DATOS partitura_B391: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (5 bytes)
;   0xb391..0xb396  (5 bytes)
DATA_partitura_B391:
	defb 0f8h,047h,0e9h,00ch,0eah	; b391

; ----------------------------------------------------------------------
; DATOS partitura_B396: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (15 bytes)
;   0xb396..0xb3a5  (15 bytes)
DATA_partitura_B396:
	defb 00bh,0edh,032h,0ebh,087h,037h,0c1h,0d6h,010h,001h,0dbh,003h,0f0h,009h,051h	; b396  ..2..7........Q

; ----------------------------------------------------------------------
; DATOS partitura_B3A5: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xb3a5..0xb3be  (25 bytes)
DATA_partitura_B3A5:
	defb 0d2h,05bh,0edh,027h,031h,051h,07fh,0edh,032h,05bh,0edh,027h,031h,051h,0d1h,00bh	; b3a5  .[.'1Q..2[.'1Q..
	defb 0d2h,0a3h,079h,051h,071h,0a1h,0d1h,00dh,021h	; b3b5  ..yQq...!

; ----------------------------------------------------------------------
; DATOS partitura_B3BE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (12 bytes)
;   0xb3be..0xb3ca  (12 bytes)
DATA_partitura_B3BE:
	defb 0e9h,004h,037h,027h,0d2h,0a7h,0d1h,007h,0d2h,077h,057h,0e9h	; b3be  ..7'.....wW.

; ----------------------------------------------------------------------
; DATOS partitura_B3CA: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xb3ca..0xb3dc  (18 bytes)
DATA_partitura_B3CA:
	defb 00ch,07bh,083h,0feh,001h,0f1h,04bh,00dh,001h,008h,0e9h,00ch,0eah,00ch,0edh,055h	; b3ca  .{....K........U
	defb 0ebh,087h	; b3da

; ----------------------------------------------------------------------
; DATOS partitura_B3DC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (33 bytes)
;   0xb3dc..0xb3fd  (33 bytes)
DATA_partitura_B3DC:
	defb 037h,0c1h,0d6h,010h,001h,0dbh,004h,0f0h,009h,051h,0d2h,0afh,0f6h,0f8h,00dh,0e9h	; b3dc  7........Q......
	defb 001h,0f0h,009h,002h,0d8h,0e9h,00ch,0ech,0eah,004h,0a3h,0f0h,009h,051h,0f1h,04bh	; b3ec  .............Q.K
	defb 00dh	; b3fc

; ----------------------------------------------------------------------
; DATOS partitura_B3FD: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (30 bytes)
;   0xb3fd..0xb41b  (30 bytes)
DATA_partitura_B3FD:
	defb 001h,00fh,0eah,00ch,0edh,017h,0ebh,087h,037h,0c1h,0a3h,093h,073h,00fh,0f6h,0f8h	; b3fd  ........7...s...
	defb 00dh,0e9h,001h,0f0h,009h,002h,0e9h,00ch,0ech,0eah,004h,007h,0f0h,009h	; b40d  ..............

; ----------------------------------------------------------------------
; DATOS partitura_B41B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xb41b..0xb41f  (4 bytes)
DATA_partitura_B41B:
	defb 051h,0f1h,04bh,00dh	; b41b

; ----------------------------------------------------------------------
; DATOS partitura_B41F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (63 bytes)
;   0xb41f..0xb45e  (63 bytes)
DATA_partitura_B41F:
	defb 001h,018h,0edh,017h,0ebh,087h,037h,0c1h,0eah,00ch,023h,033h,0edh,037h,0ebh,087h	; b41f  ......7...#3.7..
	defb 037h,0c1h,0dbh,004h,0d2h,0afh,0e9h,001h,0f0h,009h,002h,0e9h,00ch,0f6h,0f8h,00dh	; b42f  7...............
	defb 0ech,0eah,003h,0a3h,0f1h,04bh,00dh,001h,018h,0f0h,009h,051h,0eah,00ch,0edh,017h	; b43f  .....K.....Q....
	defb 0ebh,087h,037h,0c1h,0dbh,003h,0a3h,093h,073h,0d1h,025h,00fh,0e9h,001h,0f0h	; b44f  ..7.....s.%....

; ----------------------------------------------------------------------
; DATOS partitura_B45E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (81 bytes)
;   0xb45e..0xb4af  (81 bytes)
DATA_partitura_B45E:
	defb 009h,002h,0e9h,00ch,0f6h,0f8h,00dh,0ech,0eah,002h,001h,0f0h,009h,051h,0f1h,04bh	; b45e  .............Q.K
	defb 00dh,001h,018h,0edh,017h,0ebh,087h,037h,0c1h,0dbh,003h,0eah,00ch,023h,033h,0feh	; b46e  .......7.....#3.
	defb 001h,0f6h,0f8h,024h,0e9h,00ch,0eah,00ch,0edh,017h,0ebh,087h,037h,0c1h,0d6h,004h	; b47e  ...$........7...
	defb 001h,0dbh,002h,0f0h,009h,041h,0d1h,030h,050h,00fh,0e9h,001h,0f0h,009h,002h,0e9h	; b48e  .....A.0P.......
	defb 00ch,0ech,0eah,002h,005h,0f0h,009h,041h,0edh,017h,0ebh,087h,037h,0c1h,0dbh,002h	; b49e  .......A....7...
	defb 0eah	; b4ae

; ----------------------------------------------------------------------
; DATOS partitura_B4AF: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xb4af..0xb4b3  (4 bytes)
DATA_partitura_B4AF:
	defb 00ch,0d1h,071h,050h	; b4af

; ----------------------------------------------------------------------
; DATOS partitura_B4B3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (38 bytes)
;   0xb4b3..0xb4d9  (38 bytes)
DATA_partitura_B4B3:
	defb 072h,000h,020h,030h,050h,00fh,0e9h,001h,0f0h,009h,002h,0e9h,00ch,0ech,0eah,002h	; b4b3  r. 0P...........
	defb 00bh,0f0h,009h,041h,0edh,017h,0ebh,087h,037h,0c1h,0eah,00ch,0d1h,000h,020h,0feh	; b4c3  ...A....7..... .
	defb 001h,0f6h,0f8h,024h,0e9h,00ch	; b4d3

; ----------------------------------------------------------------------
; DATOS partitura_B4D9: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (56 bytes)
;   0xb4d9..0xb511  (56 bytes)
DATA_partitura_B4D9:
	defb 0eah,00ch,0edh,017h,0ebh,087h,037h,0c1h,0d6h,004h,001h,0dbh,002h,0f0h,009h,041h	; b4d9  ......7........A
	defb 0d1h,030h,050h,00fh,0f0h,009h,002h,0ech,0eah,002h,005h,0f0h,009h,041h,0edh,017h	; b4e9  .0P..........A..
	defb 0ebh,087h,037h,0c1h,0dbh,002h,0eah,00ch,0d1h,071h,050h,072h,001h,0dbh,004h,0d0h	; b4f9  ..7......qPr....
	defb 00fh,0ech,0f0h,009h,001h,0eah,003h,00fh	; b509  ........

; ----------------------------------------------------------------------
; DATOS salto_final_B511: el salto final 0xFD a 0xB3CD: en lo tocado con
;   tools/partituras.py (hasta 75 s o hasta que el estado se repite) no se
;   llega a leer
;   0xb511..0xb514  (3 bytes)
DATA_salto_final_B511:
	defb 0fdh,0cdh,0b3h	; b511

; ----------------------------------------------------------------------
; DATOS partitura_B514: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (49 bytes)
;   0xb514..0xb545  (49 bytes)
DATA_partitura_B514:
	defb 0feh,001h,0e9h,00ch,0eeh,081h,0c1h,0f8h,047h,0eah,007h,0edh,032h,0ebh,087h,017h	; b514  ........G...2...
	defb 0c1h,0d6h,010h,001h,0dbh,001h,0f0h,009h,052h,0d2h,05bh,031h,051h,07fh,05bh,031h	; b524  ........R.[1Q.[1
	defb 051h,0d1h,00bh,0d2h,0a3h,079h,051h,071h,0a1h,0d1h,00dh,021h,0e9h,004h,037h,027h	; b534  Q....yQq...!..7'
	defb 0d2h	; b544

; ----------------------------------------------------------------------
; DATOS partitura_B545: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (70 bytes)
;   0xb545..0xb58b  (70 bytes)
DATA_partitura_B545:
	defb 0a7h,0d1h,007h,0d2h,077h,057h,0e9h,00ch,07bh,083h,0feh,001h,0f2h,001h,0e9h,00ch	; b545  ....wW..{.......
	defb 0f0h,009h,052h,0eeh,081h,0eah,007h,0edh,012h,0ebh,087h,017h,0c1h,0d6h,010h,001h	; b555  ..R.............
	defb 0dbh,002h,0d2h,0afh,0ech,0eah,001h,0a3h,0eah,007h,0edh,012h,0ebh,087h,017h,0c1h	; b565  ................
	defb 0a3h,093h,073h,00fh,0ech,0eah,001h,007h,0edh,012h,0ebh,087h,017h,0c1h,0eah,004h	; b575  ..s.............
	defb 023h,033h,0edh,012h,0ebh,087h	; b585

; ----------------------------------------------------------------------
; DATOS partitura_B58B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xb58b..0xb593  (8 bytes)
DATA_partitura_B58B:
	defb 017h,0c1h,0dbh,002h,0d2h,0afh,0ech,0eah	; b58b  ........

; ----------------------------------------------------------------------
; DATOS partitura_B593: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (26 bytes)
;   0xb593..0xb5ad  (26 bytes)
DATA_partitura_B593:
	defb 001h,0a3h,0eah,007h,0edh,012h,0ebh,087h,017h,0c1h,0dbh,001h,0a3h,093h,073h,0d1h	; b593  ..............s.
	defb 025h,00fh,0ech,0eah,001h,001h,0edh,012h,0ebh,087h	; b5a3  %.........

; ----------------------------------------------------------------------
; DATOS partitura_B5AD: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (47 bytes)
;   0xb5ad..0xb5dc  (47 bytes)
DATA_partitura_B5AD:
	defb 017h,0c1h,0dbh,001h,0eah,007h,023h,033h,0feh,001h,0f8h,024h,0e9h,00ch,0eeh,081h	; b5ad  ......#3...$....
	defb 0eah,006h,0edh,012h,0ebh,087h,017h,0c1h,0d6h,004h,001h,0dbh,002h,0f0h,009h,041h	; b5bd  ...............A
	defb 0d1h,030h,050h,00fh,0ech,0f0h,009h,002h,0eah,001h,005h,0edh,012h,0ebh,087h	; b5cd  .0P............

; ----------------------------------------------------------------------
; DATOS partitura_B5DC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xb5dc..0xb5e0  (4 bytes)
DATA_partitura_B5DC:
	defb 017h,0c1h,0f0h,009h	; b5dc

; ----------------------------------------------------------------------
; DATOS partitura_B5E0: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (9 bytes)
;   0xb5e0..0xb5e9  (9 bytes)
DATA_partitura_B5E0:
	defb 041h,0dbh,001h,0eah,006h,0d1h,071h,050h,072h	; b5e0  A.....qPr

; ----------------------------------------------------------------------
; DATOS partitura_B5E9: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xb5e9..0xb602  (25 bytes)
DATA_partitura_B5E9:
	defb 000h,020h,030h,050h,00fh,0f0h,009h,002h,0ech,0eah,001h,00bh,0f0h,009h,041h,0edh	; b5e9  . 0P..........A.
	defb 012h,0ebh,087h,017h,0c1h,0eah,006h,0d1h,000h	; b5f9  .........

; ----------------------------------------------------------------------
; DATOS partitura_B602: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xb602..0xb61b  (25 bytes)
DATA_partitura_B602:
	defb 020h,0feh,001h,0f8h,024h,0e9h,00ch,0eeh,081h,0eah,006h,0edh,012h,0ebh,087h,017h	; b602   ...$...........
	defb 0c1h,0d6h,004h,001h,0dbh,001h,0f0h,009h,041h	; b612  ........A

; ----------------------------------------------------------------------
; DATOS partitura_B61B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (40 bytes)
;   0xb61b..0xb643  (40 bytes)
DATA_partitura_B61B:
	defb 0d1h,030h,050h,00fh,0f0h,009h,002h,0ech,0eah,001h,005h,0f0h,009h,041h,0edh,012h	; b61b  .0P..........A..
	defb 0ebh,087h,017h,0c1h,0eah,006h,0d1h,071h,050h,072h,001h,0dbh,002h,0eeh,081h,0f0h	; b62b  .......qPr......
	defb 009h,001h,0d0h,00fh,0ech,0eah,001h,00fh	; b63b  ........

; ----------------------------------------------------------------------
; DATOS salto_final_B643: el salto final 0xFD a 0xB54F: en lo tocado con
;   tools/partituras.py (hasta 75 s o hasta que el estado se repite) no se
;   llega a leer
;   0xb643..0xb646  (3 bytes)
DATA_salto_final_B643:
	defb 0fdh,04fh,0b5h	; b643

; ----------------------------------------------------------------------
; DATOS partitura_B646: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (22 bytes)
;   0xb646..0xb65c  (22 bytes)
DATA_partitura_B646:
	defb 0feh,001h,0f8h,009h,0e9h,00ch,0f0h,009h,071h,0eah,006h,0edh,052h,0ebh,087h,015h	; b646  ........q...R...
	defb 0f1h,0d6h,010h,001h,0f5h,0d2h	; b656

; ----------------------------------------------------------------------
; DATOS partitura_B65C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xb65c..0xb667  (11 bytes)
DATA_partitura_B65C:
	defb 057h,037h,00fh,0fbh,003h,057h,037h,0d8h,0f8h,009h,0eah	; b65c  W7...W7....

; ----------------------------------------------------------------------
; DATOS partitura_B667: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (13 bytes)
;   0xb667..0xb674  (13 bytes)
DATA_partitura_B667:
	defb 00ah,0ebh,009h,037h,031h,0e9h,004h,0d4h,087h,0d3h,007h,037h,0e9h	; b667  ...71......7.

; ----------------------------------------------------------------------
; DATOS partitura_B674: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (46 bytes)
;   0xb674..0xb6a2  (46 bytes)
DATA_partitura_B674:
	defb 002h,087h,0d2h,007h,027h,037h,087h,0d1h,007h,0feh,001h,0f8h,009h,0e9h,00ch,0eah	; b674  ....'7..........
	defb 00bh,0edh,0d2h,0ebh,087h,027h,0d1h,0dbh,003h,0f0h,009h,073h,0d3h,0afh,0afh,08fh	; b684  .....'.....s....
	defb 08fh,0afh,0afh,08fh,08fh,0feh,001h,0f8h,009h,0e9h,00ch,0d8h,0f0h,000h	; b694  ..............

; ----------------------------------------------------------------------
; DATOS partitura_B6A2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (27 bytes)
;   0xb6a2..0xb6bd  (27 bytes)
DATA_partitura_B6A2:
	defb 0eah,00bh,0ebh,019h,03bh,051h,0f5h,0d2h,073h,023h,053h,003h,053h,003h,033h,053h	; b6a2  .....Q..s#S.S.3S
	defb 073h,023h,053h,003h,053h,003h,033h,053h,0feh,001h,0f8h	; b6b2  s#S.S.3S...

; ----------------------------------------------------------------------
; DATOS partitura_B6BD: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xb6bd..0xb6c4  (7 bytes)
DATA_partitura_B6BD:
	defb 009h,0e9h,00ch,0eah,00bh,0ebh,019h	; b6bd

; ----------------------------------------------------------------------
; DATOS partitura_B6C4: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xb6c4..0xb6d6  (18 bytes)
DATA_partitura_B6C4:
	defb 03bh,051h,0f5h,0d2h,073h,033h,053h,003h,053h,003h,033h,053h,073h,033h,053h,003h	; b6c4  .Q..s3S.S.3Ss3S.
	defb 053h,003h	; b6d4

; ----------------------------------------------------------------------
; DATOS partituras_B6D6: 1 partitura entera (de la primera nota a su 0xFF o
;   salto) que no lee ninguno de los sonidos 0x01-0xEF tocados con
;   tools/partituras.py
;   0xb6d6..0xb6dd  (7 bytes)
DATA_partituras_B6D6:
	defb 0d3h,083h,0d2h,053h,0fdh,07dh,0b6h	; b6d6

; ----------------------------------------------------------------------
; DATOS partitura_B6DD: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xb6dd..0xb6ef  (18 bytes)
DATA_partitura_B6DD:
	defb 0feh,001h,0f8h,009h,0e9h,00ch,0f0h,009h,071h,0eah,006h,0edh,052h,0ebh,087h,015h	; b6dd  ........q...R...
	defb 0f1h,0d6h	; b6ed

; ----------------------------------------------------------------------
; DATOS partitura_B6EF: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xb6ef..0xb708  (25 bytes)
DATA_partitura_B6EF:
	defb 010h,001h,0f5h,0d2h,007h,0d3h,0a7h,08fh,0fbh,003h,0d2h,007h,0d3h,0a7h,0f8h,009h	; b6ef  ................
	defb 0eah,004h,0ebh,009h,017h,071h,0eeh,001h,0e9h	; b6ff  .....q...

; ----------------------------------------------------------------------
; DATOS partitura_B708: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (32 bytes)
;   0xb708..0xb728  (32 bytes)
DATA_partitura_B708:
	defb 002h,0cbh,0e9h,004h,0d3h,0d8h,087h,0d3h,007h,037h,0e9h,002h,087h,0d2h,007h,027h	; b708  .........7.....'
	defb 037h,093h,0feh,001h,0e9h,00ch,0f9h,07ah,0b7h,0f9h,07ah,0b7h,0feh,001h,0f8h,009h	; b718  7......z..z.....

; ----------------------------------------------------------------------
; DATOS partitura_B728: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xb728..0xb733  (11 bytes)
DATA_partitura_B728:
	defb 0e9h,00ch,0d8h,0f0h,000h,0eah,00bh,0ebh,019h,03bh,051h	; b728  ..........Q

; ----------------------------------------------------------------------
; DATOS partitura_B733: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (65 bytes)
;   0xb733..0xb774  (65 bytes)
DATA_partitura_B733:
	defb 0f5h,0d2h,0c1h,003h,033h,0d3h,0a3h,0d2h,023h,0d3h,083h,083h,083h,0a3h,0d2h,003h	; b733  ....3...#.......
	defb 033h,0d3h,0a3h,0d2h,023h,0d3h,083h,0d2h,053h,0d3h,083h,0a1h,0feh,001h,0f8h,009h	; b743  3...#...S.......
	defb 0e9h,00ch,0eah,00bh,0ebh,019h,03bh,051h,0f5h,0d2h,0c1h,003h,0a3h,0d3h,0a3h,0d2h	; b753  .......Q........
	defb 023h,0d3h,083h,083h,083h,0a3h,0d2h,003h,0a3h,0d3h,0a3h,0d2h,023h,0d3h,083h,0d2h	; b763  #...........#...
	defb 073h	; b773

; ----------------------------------------------------------------------
; DATOS partituras_B774: 1 partitura entera (de la primera nota a su 0xFF o
;   salto) que no lee ninguno de los sonidos 0x01-0xEF tocados con
;   tools/partituras.py
;   0xb774..0xb77a  (6 bytes)
DATA_partituras_B774:
	defb 003h,0d3h,081h,0fdh,01ah,0b7h	; b774

; ----------------------------------------------------------------------
; DATOS sonido_B77A: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x9D (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392
;   (5 bytes)
;   0xb77a..0xb77f  (5 bytes)
DATA_sonido_B77A:
	defb 0feh,001h,0f8h,009h,0e9h	; b77a

; ----------------------------------------------------------------------
; DATOS partitura_B77F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (84 bytes)
;   0xb77f..0xb7d3  (84 bytes)
DATA_partitura_B77F:
	defb 001h,0f5h,0eah,009h,0d8h,0ebh,029h,037h,031h,0d1h,075h,0eah,003h,0d3h,025h,0eah	; b77f  ......)71.u...%.
	defb 009h,0d1h,025h,0eah,003h,0d1h,075h,0eah,009h,0d2h,0a5h,0eah,003h,025h,0eah,009h	; b78f  ..%...u......%..
	defb 075h,0eah,003h,0a5h,0eah,009h,025h,0eah,003h,075h,0eah,009h,0d3h,0a5h,0eah,003h	; b79f  u.....%..u......
	defb 0d2h,025h,0eah,009h,0d3h,075h,0eah,003h,0a5h,0eah,009h,025h,0eah,003h,075h,0fbh	; b7af  .%...u.....%..u.
	defb 004h,0f5h,0eah,009h,0d1h,055h,0eah,003h,0d3h,005h,0eah,009h,0d1h,005h,0eah,003h	; b7bf  .....U..........
	defb 055h,0eah,009h,0d2h	; b7cf

; ----------------------------------------------------------------------
; DATOS partitura_B7D3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (42 bytes)
;   0xb7d3..0xb7fd  (42 bytes)
DATA_partitura_B7D3:
	defb 085h,0eah,003h,0d1h,005h,0eah,009h,0d2h,055h,0eah,003h,085h,0eah,009h,005h,0eah	; b7d3  ........U.......
	defb 003h,055h,0eah,009h,0d3h,085h,0eah,003h,0d2h,005h,0eah,009h,0d3h,055h,0eah,003h	; b7e3  .U...........U..
	defb 085h,0eah,009h,005h,0eah,003h,055h,0fbh,004h,0fah	; b7f3  ......U...

; ----------------------------------------------------------------------
; DATOS partitura_B7FD: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (33 bytes)
;   0xb7fd..0xb81e  (33 bytes)
DATA_partitura_B7FD:
	defb 0feh,004h,0e9h,002h,0d0h,0f5h,004h,002h,027h,0fbh,00eh,0d1h,0e9h,001h,094h,065h	; b7fd  ........'......e
	defb 064h,094h,095h,094h,094h,095h,094h,094h,095h,094h,0e9h,002h,0d0h,0f5h,004h,002h	; b80d  d...............
	defb 024h	; b81d

; ----------------------------------------------------------------------
; DATOS partitura_B81E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (20 bytes)
;   0xb81e..0xb832  (20 bytes)
DATA_partitura_B81E:
	defb 012h,0fbh,00fh,0d1h,094h,062h,0d0h,0a4h,072h,0d0h,004h,002h,024h,012h,004h,002h	; b81e  .....b..r...$...
	defb 074h,0d1h,082h,0d0h	; b82e

; ----------------------------------------------------------------------
; DATOS partitura_B832: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xb832..0xb833  (1 bytes)
DATA_partitura_B832:
	defb 004h	; b832

; ----------------------------------------------------------------------
; DATOS partitura_B833: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xb833..0xb839  (6 bytes)
DATA_partitura_B833:
	defb 002h,027h,004h,072h,074h,0d1h	; b833

; ----------------------------------------------------------------------
; DATOS partitura_B839: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xb839..0xb83a  (1 bytes)
DATA_partitura_B839:
	defb 072h	; b839

; ----------------------------------------------------------------------
; DATOS partitura_B83A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (10 bytes)
;   0xb83a..0xb844  (10 bytes)
DATA_partitura_B83A:
	defb 0d0h,0f5h,004h,002h,027h,0fbh,002h,004h,002h,074h	; b83a  ....'....t

; ----------------------------------------------------------------------
; DATOS partitura_B844: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xb844..0xb848  (4 bytes)
DATA_partitura_B844:
	defb 0d1h,072h,0d0h,0a4h	; b844

; ----------------------------------------------------------------------
; DATOS partitura_B848: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xb848..0xb859  (17 bytes)
DATA_partitura_B848:
	defb 072h,0e9h,001h,0d1h,064h,065h,064h,0e9h,002h,0d0h,004h,002h,027h,004h,07ah,0f5h	; b848  r...ded.....'.z.
	defb 004h	; b858

; ----------------------------------------------------------------------
; DATOS partitura_B859: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (39 bytes)
;   0xb859..0xb880  (39 bytes)
DATA_partitura_B859:
	defb 002h,007h,0fbh,003h,074h,072h,074h,072h,074h,072h,004h,072h,0e9h,001h,0d1h,094h	; b859  ....trtrtr.r....
	defb 065h,063h,060h,094h,085h,094h,0e9h,002h,0d0h,0f5h,004h,002h,027h,0fbh,006h,004h	; b869  ec`.........'...
	defb 022h,004h,027h,0a2h,0e9h,001h,0d1h	; b879

; ----------------------------------------------------------------------
; DATOS partitura_B880: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xb880..0xb888  (8 bytes)
DATA_partitura_B880:
	defb 094h,065h,064h,0e9h,002h,0f5h,0d0h,004h	; b880  .ed.....

; ----------------------------------------------------------------------
; DATOS partitura_B888: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xb888..0xb890  (8 bytes)
DATA_partitura_B888:
	defb 002h,027h,0fbh,007h,077h,0e9h,001h,0d1h	; b888  .'..w...

; ----------------------------------------------------------------------
; DATOS partitura_B890: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xb890..0xb896  (6 bytes)
DATA_partitura_B890:
	defb 064h,065h,064h,0fdh,017h,0b8h	; b890

; ----------------------------------------------------------------------
; DATOS partitura_B896: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (22 bytes)
;   0xb896..0xb8ac  (22 bytes)
DATA_partitura_B896:
	defb 0feh,001h,0e9h,002h,0eah,00bh,0ebh,009h,01bh,031h,0dbh,003h,0d4h,04fh,0d5h,0bfh	; b896  .........1...O..
	defb 0d4h,094h,072h,094h,0a2h,094h	; b8a6

; ----------------------------------------------------------------------
; DATOS partitura_B8AC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xb8ac..0xb8af  (3 bytes)
DATA_partitura_B8AC:
	defb 072h,044h,0d5h	; b8ac

; ----------------------------------------------------------------------
; DATOS partitura_B8AF: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (32 bytes)
;   0xb8af..0xb8cf  (32 bytes)
DATA_partitura_B8AF:
	defb 0b2h,0d4h,04fh,0d5h,0bfh,0d4h,094h,072h,094h,0a2h,0b4h,0d3h,042h,0c7h,0d4h,04fh	; b8af  ..O....r....B..O
	defb 0d5h,0bfh,0d4h,094h,072h,094h,0a2h,094h,072h,044h,0d5h,0b2h,0d4h,04fh,0d5h,0bfh	; b8bf  ....r...rD...O..

; ----------------------------------------------------------------------
; DATOS partitura_B8CF: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xb8cf..0xb8d2  (3 bytes)
DATA_partitura_B8CF:
	defb 0d4h,094h,072h	; b8cf

; ----------------------------------------------------------------------
; DATOS partitura_B8D2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (33 bytes)
;   0xb8d2..0xb8f3  (33 bytes)
DATA_partitura_B8D2:
	defb 094h,0a2h,0b4h,0d3h,042h,0d4h,0b4h,072h,0eah,00bh,0ebh,009h,01bh,031h,0dbh,003h	; b8d2  ....B..r.....1..
	defb 0d4h,047h,047h,0d5h,0b7h,0d4h,027h,047h,0b7h,0d5h,0b7h,0d4h,067h,047h,047h,0d5h	; b8e2  .GG...'G....gGG.
	defb 0b7h	; b8f2

; ----------------------------------------------------------------------
; DATOS partitura_B8F3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xb8f3..0xb8f5  (2 bytes)
DATA_partitura_B8F3:
	defb 0d4h,027h	; b8f3

; ----------------------------------------------------------------------
; DATOS partitura_B8F5: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (38 bytes)
;   0xb8f5..0xb91b  (38 bytes)
DATA_partitura_B8F5:
	defb 047h,0d5h,0b7h,0d4h,027h,047h,077h,027h,097h,097h,077h,027h,097h,0b7h,047h,047h	; b8f5  G...'Gw'..w'..GG
	defb 0d5h,0b7h,0d4h,027h,047h,0d5h,0b7h,0d4h,027h,037h,0eah,00bh,0ebh,009h,01bh,031h	; b905  ...'G...'7.....1
	defb 0dbh,003h,0d4h,047h,047h,0d5h	; b915

; ----------------------------------------------------------------------
; DATOS partitura_B91B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xb91b..0xb91f  (4 bytes)
DATA_partitura_B91B:
	defb 0b7h,0d4h,027h,047h	; b91b

; ----------------------------------------------------------------------
; DATOS partitura_B91F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xb91f..0xb930  (17 bytes)
DATA_partitura_B91F:
	defb 0b7h,0d5h,0b7h,0d4h,067h,047h,047h,0d5h,0b7h,0d4h,027h,047h,0b7h,0d5h,0b4h,0d4h	; b91f  ....gGG...'G....
	defb 06ah	; b92f

; ----------------------------------------------------------------------
; DATOS partitura_B930: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (27 bytes)
;   0xb930..0xb94b  (27 bytes)
DATA_partitura_B930:
	defb 077h,027h,097h,097h,077h,027h,097h,0b7h,047h,047h,0d5h,0b7h,0d4h,027h,0d5h,0b4h	; b930  w'..w'..GG...'..
	defb 0d4h,022h,0c4h,04fh,0c2h,0eah,00bh,0ebh,009h,01bh,041h	; b940  .".O......A

; ----------------------------------------------------------------------
; DATOS partitura_B94B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xb94b..0xb95d  (18 bytes)
DATA_partitura_B94B:
	defb 0dbh,003h,0d4h,077h,077h,027h,077h,047h,047h,0d5h,0b7h,0d4h,047h,027h,097h,0d3h	; b94b  ...ww'wGG...G'..
	defb 027h,007h	; b95b

; ----------------------------------------------------------------------
; DATOS partitura_B95D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (32 bytes)
;   0xb95d..0xb97d  (32 bytes)
DATA_partitura_B95D:
	defb 0d4h,047h,077h,0b7h,047h,077h,077h,027h,077h,047h,047h,0d5h,0b7h,0d4h,047h,027h	; b95d  .Gw.Gww'wGG...G'
	defb 097h,0d3h,027h,0d4h,007h,0d5h,097h,0d4h,027h,0d5h,0b7h,0d4h,037h,0fdh,0dah,0b8h	; b96d  ..'.....'...7...

; ----------------------------------------------------------------------
; DATOS partitura_B97D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xb97d..0xb97e  (1 bytes)
DATA_partitura_B97D:
	defb 0ffh	; b97d

; ----------------------------------------------------------------------
; DATOS partitura_B97E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xb97e..0xb990  (18 bytes)
DATA_partitura_B97E:
	defb 0feh,001h,0e9h,002h,0f8h,009h,0eah,00eh,0ebh,009h,02bh,021h,0dbh,003h,0d4h,04fh	; b97e  ..........+!...O
	defb 0d5h,0bfh	; b98e

; ----------------------------------------------------------------------
; DATOS partitura_B990: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (46 bytes)
;   0xb990..0xb9be  (46 bytes)
DATA_partitura_B990:
	defb 0d4h,094h,072h,094h,0a2h,094h,072h,044h,0d5h,0b2h,0d4h,04fh,0d5h,0bfh,0d4h,094h	; b990  ..r...rD...O....
	defb 072h,094h,0a2h,0b4h,0d3h,042h,0c7h,0d4h,04fh,0d5h,0bfh,0d4h,094h,072h,094h,0a2h	; b9a0  r....B..O....r..
	defb 094h,072h,044h,0d5h,0b2h,0d4h,04fh,0d5h,0bfh,0d4h,094h,072h,094h,0a2h	; b9b0  .rD...O....r..

; ----------------------------------------------------------------------
; DATOS partitura_B9BE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (23 bytes)
;   0xb9be..0xb9d5  (23 bytes)
DATA_partitura_B9BE:
	defb 0b4h,0d3h,042h,0d4h,0b4h,072h,0eah,00eh,0ebh,009h,02bh,021h,0dbh,003h,0d4h,047h	; b9be  ..B..r....+!...G
	defb 047h,0d5h,0b7h,0d4h,027h,047h,0b7h	; b9ce

; ----------------------------------------------------------------------
; DATOS partitura_B9D5: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xb9d5..0xb9d6  (1 bytes)
DATA_partitura_B9D5:
	defb 0d5h	; b9d5

; ----------------------------------------------------------------------
; DATOS partitura_B9D6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xb9d6..0xb9e7  (17 bytes)
DATA_partitura_B9D6:
	defb 0b7h,0d4h,067h,047h,047h,0d5h,0b7h,0d4h,027h,047h,0d5h,0b7h,0d4h,027h,047h,077h	; b9d6  ..gGG...'G...'Gw
	defb 027h	; b9e6

; ----------------------------------------------------------------------
; DATOS partitura_B9E7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xb9e7..0xb9ee  (7 bytes)
DATA_partitura_B9E7:
	defb 097h,097h,077h,027h,097h,0b7h,047h	; b9e7

; ----------------------------------------------------------------------
; DATOS partitura_B9EE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (43 bytes)
;   0xb9ee..0xba19  (43 bytes)
DATA_partitura_B9EE:
	defb 047h,0d5h,0b7h,0d4h,027h,047h,0d5h,0b7h,0d4h,027h,037h,0eah,00eh,0ebh,009h,02bh	; b9ee  G...'G...'7....+
	defb 021h,0dbh,003h,0d4h,047h,047h,0d5h,0b7h,0d4h,027h,047h,0b7h,0d5h,0b7h,0d4h,067h	; b9fe  !...GG...'G....g
	defb 047h,047h,0d5h,0b7h,0d4h,027h,047h,0b7h,0d5h,0b4h,0d4h	; ba0e  GG...'G....

; ----------------------------------------------------------------------
; DATOS partitura_BA19: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (19 bytes)
;   0xba19..0xba2c  (19 bytes)
DATA_partitura_BA19:
	defb 06ah,077h,027h,097h,097h,077h,027h,097h,0b7h,047h,047h,0d5h,0b7h,0d4h,027h,0d5h	; ba19  jw'..w'..GG...'.
	defb 0b4h,0d4h,022h	; ba29

; ----------------------------------------------------------------------
; DATOS partitura_BA2C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xba2c..0xba34  (8 bytes)
DATA_partitura_BA2C:
	defb 0c4h,04fh,0c2h,0eah,00eh,0ebh,009h,02bh	; ba2c  .O.....+

; ----------------------------------------------------------------------
; DATOS partitura_BA34: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (24 bytes)
;   0xba34..0xba4c  (24 bytes)
DATA_partitura_BA34:
	defb 021h,0dbh,003h,0d4h,077h,077h,027h,077h,047h,047h,0d5h,0b7h,0d4h,047h,027h,097h	; ba34  !...ww'wGG...G'.
	defb 0d3h,027h,007h,0d4h,047h,077h,0b7h,047h	; ba44  .'..Gw.G

; ----------------------------------------------------------------------
; DATOS partitura_BA4C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (27 bytes)
;   0xba4c..0xba67  (27 bytes)
DATA_partitura_BA4C:
	defb 077h,077h,027h,077h,047h,047h,0d5h,0b7h,0d4h,047h,027h,097h,0d3h,027h,0d4h,007h	; ba4c  ww'wGG...G'..'..
	defb 0d5h,097h,0d4h,027h,0d5h,0b7h,0d4h,037h,0fdh,0c4h,0b9h	; ba5c  ...'...7...

; ----------------------------------------------------------------------
; DATOS partitura_BA67: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xba67..0xba6a  (3 bytes)
DATA_partitura_BA67:
	defb 0feh,001h,0e9h	; ba67

; ----------------------------------------------------------------------
; DATOS partitura_BA6A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (32 bytes)
;   0xba6a..0xba8a  (32 bytes)
DATA_partitura_BA6A:
	defb 002h,0f6h,0f8h,010h,0eah,008h,0edh,016h,0ebh,089h,03bh,041h,0dbh,002h,0d6h,006h	; ba6a  ...........A....
	defb 001h,0f0h,00fh,042h,0d2h,044h,0cah,074h,0cah,094h,072h,094h,0a2h,094h,072h,044h	; ba7a  ...B.D.t..r...rD

; ----------------------------------------------------------------------
; DATOS partitura_BA8A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xba8a..0xba95  (11 bytes)
DATA_partitura_BA8A:
	defb 0d3h,0b2h,0d2h,044h,0cah,074h,0cah,094h,072h,094h,0a2h	; ba8a  ...D.t..r..

; ----------------------------------------------------------------------
; DATOS partitura_BA95: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (24 bytes)
;   0xba95..0xbaad  (24 bytes)
DATA_partitura_BA95:
	defb 0b4h,0d1h,042h,0c7h,0d2h,044h,0cah,074h,0cah,094h,072h,094h,0a2h,094h,072h,044h	; ba95  ..B..D.t..r...rD
	defb 0d3h,0b2h,0f8h,011h,0eah,00ch,0d2h,044h	; baa5  .......D

; ----------------------------------------------------------------------
; DATOS partitura_BAAD: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xbaad..0xbabe  (17 bytes)
DATA_partitura_BAAD:
	defb 0cah,074h,0cah,094h,072h,094h,0a2h,0b4h,0d1h,042h,0d2h,0b4h,072h,0f8h,015h,0eah	; baad  .t..r....B..r...
	defb 00bh	; babd

; ----------------------------------------------------------------------
; DATOS partitura_BABE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (28 bytes)
;   0xbabe..0xbada  (28 bytes)
DATA_partitura_BABE:
	defb 0ebh,00ah,02ch,011h,0dbh,001h,0d8h,0f0h,000h,0d2h,0c4h,072h,07ch,06fh,072h,07ch	; babe  ..,........r|or|
	defb 067h,067h,072h,077h,06fh,0b7h,0d3h,047h,0d2h,047h,067h,0d3h	; bace  ggrwo..G.Gg.

; ----------------------------------------------------------------------
; DATOS partitura_BADA: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (15 bytes)
;   0xbada..0xbae9  (15 bytes)
DATA_partitura_BADA:
	defb 077h,0d2h,07ch,06ah,07fh,0cfh,04fh,044h,04ah,044h,047h,04fh,0c2h,0f8h,015h	; bada  w.|j..ODJDGO...

; ----------------------------------------------------------------------
; DATOS partitura_BAE9: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (43 bytes)
;   0xbae9..0xbb14  (43 bytes)
DATA_partitura_BAE9:
	defb 0eah,00bh,0ebh,00ah,02bh,011h,0dbh,001h,0d8h,0f0h,000h,0d2h,0c7h,07fh,0f8h,011h	; bae9  ....+...........
	defb 0eah,00dh,0d6h,008h,001h,0f0h,00fh,024h,0d1h,067h,0d8h,0f0h,000h,0f8h,015h,0eah	; baf9  .......$.g......
	defb 00bh,0dbh,001h,0c4h,0d2h,072h,07ch,0f8h,011h,0eah,00dh	; bb09  .....r|....

; ----------------------------------------------------------------------
; DATOS partitura_BB14: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xbb14..0xbb15  (1 bytes)
DATA_partitura_BB14:
	defb 0d6h	; bb14

; ----------------------------------------------------------------------
; DATOS partitura_BB15: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xbb15..0xbb2e  (25 bytes)
DATA_partitura_BB15:
	defb 008h,001h,0f0h,00fh,024h,0eah,00fh,0d1h,062h,067h,0c7h,0f8h,015h,0eah,00bh,0d8h	; bb15  ....$...bg......
	defb 0f0h,000h,0d2h,07ch,06ah,0c7h,0f8h,011h,0eah	; bb25  ...|j....

; ----------------------------------------------------------------------
; DATOS partitura_BB2E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (27 bytes)
;   0xbb2e..0xbb49  (27 bytes)
DATA_partitura_BB2E:
	defb 00ch,0f0h,00fh,042h,0d6h,008h,001h,0d1h,064h,0c2h,0c4h,06ah,0f8h,010h,0eah,00dh	; bb2e  ...B....d..j....
	defb 0d2h,0b4h,0c2h,0c7h,0c4h,06ah,0d1h,024h,0c2h,0c7h,0cfh	; bb3e  .....j.$...

; ----------------------------------------------------------------------
; DATOS partitura_BB49: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (32 bytes)
;   0xbb49..0xbb69  (32 bytes)
DATA_partitura_BB49:
	defb 0d3h,094h,072h,094h,0a2h,0b4h,0d2h,042h,0d3h,0b4h,072h,0d2h,044h,042h,0c4h,04fh	; bb49  ..r....B..r.DB.O
	defb 0c2h,0f8h,015h,0eah,00bh,0ebh,00ah,02bh,011h,0dbh,002h,0d8h,0f0h,000h,0d2h,07fh	; bb59  .......+........

; ----------------------------------------------------------------------
; DATOS partitura_BB69: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xbb69..0xbb71  (8 bytes)
DATA_partitura_BB69:
	defb 0bch,0f8h,039h,0eah,009h,0d6h,008h,001h	; bb69  ..9.....

; ----------------------------------------------------------------------
; DATOS partitura_BB71: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xbb71..0xbb73  (2 bytes)
DATA_partitura_BB71:
	defb 0f0h,00fh	; bb71

; ----------------------------------------------------------------------
; DATOS partitura_BB73: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (40 bytes)
;   0xbb73..0xbb9b  (40 bytes)
DATA_partitura_BB73:
	defb 024h,0d3h,042h,0c4h,072h,0c4h,072h,06fh,094h,092h,0c4h,092h,0c4h,092h,0c4h,092h	; bb73  $.B.r.ro........
	defb 074h,0d4h,0b2h,0d3h,0c4h,04ah,0c7h,0d8h,0f0h,000h,0f8h,015h,0eah,00bh,0d2h,07fh	; bb83  t....J..........
	defb 0bch,0f8h,039h,0eah,009h,0d6h,008h,001h	; bb93  ..9.....

; ----------------------------------------------------------------------
; DATOS partitura_BB9B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xbb9b..0xbbac  (17 bytes)
DATA_partitura_BB9B:
	defb 0f0h,00fh,024h,0d3h,042h,0c4h,072h,0c4h,072h,067h,077h,094h,092h,0c4h,092h,0c4h	; bb9b  ..$.B.r.rgw.....
	defb 092h	; bbab

; ----------------------------------------------------------------------
; DATOS partitura_BBAC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (10 bytes)
;   0xbbac..0xbbb6  (10 bytes)
DATA_partitura_BBAC:
	defb 0c4h,092h,024h,062h,097h,097h,0b7h,0fdh,0bah,0bah	; bbac  ..$b......

; ----------------------------------------------------------------------
; DATOS partitura_BBB6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (13 bytes)
;   0xbbb6..0xbbc3  (13 bytes)
DATA_partitura_BBB6:
	defb 0feh,001h,0e9h,002h,0eeh,081h,0c2h,0f8h,010h,0eah,004h,0edh,013h	; bbb6  .............

; ----------------------------------------------------------------------
; DATOS partitura_BBC3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (49 bytes)
;   0xbbc3..0xbbf4  (49 bytes)
DATA_partitura_BBC3:
	defb 0ebh,089h,01bh,041h,0dbh,001h,0d6h,006h,001h,0f0h,00fh,042h,0d2h,044h,0cah,074h	; bbc3  ...A.......B.D.t
	defb 0cah,094h,072h,094h,0a2h,094h,072h,044h,0d3h,0b2h,0d2h,044h,0cah,074h,0cah,094h	; bbd3  ..r...rD...D.t..
	defb 072h,094h,0a2h,0b4h,0d1h,042h,0c7h,0d2h,044h,0cah,074h,0cah,094h,072h,094h,0a2h	; bbe3  r....B..D.t..r..
	defb 094h	; bbf3

; ----------------------------------------------------------------------
; DATOS partitura_BBF4: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (40 bytes)
;   0xbbf4..0xbc1c  (40 bytes)
DATA_partitura_BBF4:
	defb 072h,044h,0d3h,0b2h,0f8h,011h,0eah,006h,0d2h,044h,0cah,074h,0cah,094h,072h,094h	; bbf4  rD.......D.t..r.
	defb 0a2h,0b4h,0d1h,042h,0d2h,0b4h,0f8h,015h,0eah,00ch,0ebh,00ah,02bh,011h,0dbh,001h	; bc04  ...B........+...
	defb 0d8h,0f0h,000h,0d2h,0c4h,042h,04ch,04fh	; bc14  .....BLO

; ----------------------------------------------------------------------
; DATOS partitura_BC1C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (48 bytes)
;   0xbc1c..0xbc4c  (48 bytes)
DATA_partitura_BC1C:
	defb 042h,04ch,047h,047h,042h,047h,04fh,04fh,0d3h,0b7h,0bfh,0d2h,04ch,04ah,0d3h,0bfh	; bc1c  BLGGBGOO....LJ..
	defb 0cfh,0d2h,02fh,024h,02ah,024h,027h,0d3h,0bfh,0c2h,0f8h,015h,0eah,00bh,0ebh,00ah	; bc2c  ../$*$'.........
	defb 02bh,011h,0dbh,001h,0d8h,0f0h,000h,0d2h,0c7h,04fh,0f8h,011h,0eah,00ch,0d6h,008h	; bc3c  +........O......

; ----------------------------------------------------------------------
; DATOS partitura_BC4C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (21 bytes)
;   0xbc4c..0xbc61  (21 bytes)
DATA_partitura_BC4C:
	defb 001h,0f0h,00fh,024h,0d1h,047h,0d8h,0f0h,000h,0f8h,015h,0eah,00bh,0dbh,001h,0c4h	; bc4c  ...$.G..........
	defb 0d2h,042h,04ch,0f8h,011h	; bc5c

; ----------------------------------------------------------------------
; DATOS partitura_BC61: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (52 bytes)
;   0xbc61..0xbc95  (52 bytes)
DATA_partitura_BC61:
	defb 0eah,00ch,0d6h,008h,001h,0f0h,00fh,024h,0d1h,022h,027h,0c7h,0f8h,015h,0eah,00bh	; bc61  .......$."'.....
	defb 0d8h,0f0h,000h,0d2h,04ch,04ah,0c7h,0f8h,011h,0eah,00ch,0f0h,00fh,042h,0d6h,008h	; bc71  ....LJ.......B..
	defb 001h,0d1h,04ch,02ah,0f8h,011h,0eah,00ch,0d2h,074h,0c2h,0c7h,0c4h,0f8h,010h,0eah	; bc81  ..L*.....t......
	defb 00dh,02ah,074h,0c2h	; bc91

; ----------------------------------------------------------------------
; DATOS partitura_BC95: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (15 bytes)
;   0xbc95..0xbca4  (15 bytes)
DATA_partitura_BC95:
	defb 0c7h,0cfh,0eeh,081h,0c2h,0eah,005h,0d3h,094h,072h,094h,0a2h,0b4h,0d2h,042h	; bc95  .........r....B

; ----------------------------------------------------------------------
; DATOS partitura_BCA4: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (19 bytes)
;   0xbca4..0xbcb7  (19 bytes)
DATA_partitura_BCA4:
	defb 0d3h,0b4h,072h,0d2h,044h,042h,0c4h,04fh,0f8h,015h,0eah,00bh,0ebh,00ah,02bh,011h	; bca4  ..r.DB.O......+.
	defb 0dbh,002h,0d8h	; bcb4

; ----------------------------------------------------------------------
; DATOS partitura_BCB7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (26 bytes)
;   0xbcb7..0xbcd1  (26 bytes)
DATA_partitura_BCB7:
	defb 0f0h,000h,0d2h,02fh,07ch,0f8h,039h,0eah,009h,0d6h,008h,001h,0f0h,00fh,024h,0d3h	; bcb7  .../|.9.......$.
	defb 0c2h,0c4h,042h,0c4h,042h,04fh,064h,062h,0c4h,062h	; bcc7  ..B.BOdb.b

; ----------------------------------------------------------------------
; DATOS partitura_BCD1: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xbcd1..0xbcd4  (3 bytes)
DATA_partitura_BCD1:
	defb 0c4h,062h,0c4h	; bcd1

; ----------------------------------------------------------------------
; DATOS partitura_BCD4: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (19 bytes)
;   0xbcd4..0xbce7  (19 bytes)
DATA_partitura_BCD4:
	defb 062h,044h,0d4h,072h,0d4h,0c4h,0bah,0c7h,0d8h,0f0h,000h,0f8h,015h,0eah,00bh,0d2h	; bcd4  bD.r............
	defb 02fh,07ch,0f8h	; bce4

; ----------------------------------------------------------------------
; DATOS partitura_BCE7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (35 bytes)
;   0xbce7..0xbd0a  (35 bytes)
DATA_partitura_BCE7:
	defb 039h,0eah,009h,0d6h,008h,001h,0f0h,00fh,024h,0d3h,0c2h,0c4h,042h,0c4h,042h,047h	; bce7  9.......$...B.BG
	defb 047h,064h,062h,0c4h,062h,0c4h,062h,0c4h,062h,0d4h,094h,0d3h,042h,067h,067h,067h	; bcf7  Gdb.b.b.b...Bggg
	defb 0fdh,00ah,0bch	; bd07

; ----------------------------------------------------------------------
; DATOS partitura_BD0A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (46 bytes)
;   0xbd0a..0xbd38  (46 bytes)
DATA_partitura_BD0A:
	defb 0feh,001h,0e9h,002h,0f8h,039h,0eah,007h,0edh,016h,0ebh,089h,03bh,041h,0dbh,002h	; bd0a  .....9.......A..
	defb 0d6h,020h,001h,0f0h,00fh,042h,0d3h,044h,0cah,074h,0cah,094h,072h,094h,0a2h,094h	; bd1a  . ...B.D.t..r...
	defb 072h,044h,0d4h,0b2h,0d3h,044h,0cah,074h,0cah,094h,072h,094h,0a2h,0b4h	; bd2a  rD...D.t..r...

; ----------------------------------------------------------------------
; DATOS partitura_BD38: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (27 bytes)
;   0xbd38..0xbd53  (27 bytes)
DATA_partitura_BD38:
	defb 0d2h,042h,0c7h,0d3h,044h,0cah,074h,0cah,094h,072h,094h,0a2h,094h,072h,044h,0d4h	; bd38  .B..D.t..r...rD.
	defb 0b2h,0d3h,044h,0cah,074h,0cah,0d3h,094h,072h,094h,0a2h	; bd48  ..D.t...r..

; ----------------------------------------------------------------------
; DATOS partitura_BD53: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (35 bytes)
;   0xbd53..0xbd76  (35 bytes)
DATA_partitura_BD53:
	defb 0b4h,0d2h,042h,0d3h,0b4h,072h,0f8h,039h,0eah,008h,0edh,027h,0ebh,089h,03bh,041h	; bd53  ..B..r.9...'...A
	defb 0dbh,002h,0d6h,010h,001h,0f0h,00fh,042h,0d3h,0b4h,072h,0c4h,097h,062h,074h,092h	; bd63  .......B..r..bt.
	defb 0b4h,0c2h,074h	; bd73

; ----------------------------------------------------------------------
; DATOS partitura_BD76: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (23 bytes)
;   0xbd76..0xbd8d  (23 bytes)
DATA_partitura_BD76:
	defb 09ah,0c7h,0b4h,072h,0c4h,097h,062h,074h,092h,0b4h,0c2h,094h,0c2h,074h,0c2h,094h	; bd76  ...r..bt.....t..
	defb 0c2h,0d2h,044h,0c2h,0d3h,0b4h,0c2h	; bd86

; ----------------------------------------------------------------------
; DATOS partitura_BD8D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (12 bytes)
;   0xbd8d..0xbd99  (12 bytes)
DATA_partitura_BD8D:
	defb 0d2h,024h,0d3h,09ah,0b4h,0b2h,097h,077h,097h,0c4h,097h,072h	; bd8d  .$.....w...r

; ----------------------------------------------------------------------
; DATOS partitura_BD99: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (9 bytes)
;   0xbd99..0xbda2  (9 bytes)
DATA_partitura_BD99:
	defb 094h,072h,094h,0a2h,094h,072h,0c4h,047h,062h	; bd99  .r...r.Gb

; ----------------------------------------------------------------------
; DATOS partitura_BDA2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (5 bytes)
;   0xbda2..0xbda7  (5 bytes)
DATA_partitura_BDA2:
	defb 074h,092h,0f8h,039h,0eah	; bda2

; ----------------------------------------------------------------------
; DATOS partitura_BDA7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (9 bytes)
;   0xbda7..0xbdb0  (9 bytes)
DATA_partitura_BDA7:
	defb 008h,0edh,027h,0ebh,089h,03bh,041h,0dbh,002h	; bda7  ..'...A..

; ----------------------------------------------------------------------
; DATOS partitura_BDB0: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (22 bytes)
;   0xbdb0..0xbdc6  (22 bytes)
DATA_partitura_BDB0:
	defb 0d6h,010h,001h,0f0h,00fh,042h,0d3h,0b4h,072h,0c4h,09ah,0d3h,094h,0c2h,0d3h,0b4h	; bdb0  .....B..r.......
	defb 072h,0b4h,092h,094h,0d3h,092h	; bdc0

; ----------------------------------------------------------------------
; DATOS partitura_BDC6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xbdc6..0xbdc8  (2 bytes)
DATA_partitura_BDC6:
	defb 094h,0c2h	; bdc6

; ----------------------------------------------------------------------
; DATOS partitura_BDC8: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (37 bytes)
;   0xbdc8..0xbded  (37 bytes)
DATA_partitura_BDC8:
	defb 0d3h,0b4h,072h,0c4h,097h,062h,074h,092h,0b4h,0c2h,094h,0c2h,074h,09ah,0d2h,044h	; bdc8  ..r..bt.....t..D
	defb 0c2h,0d3h,0b4h,0c2h,0d2h,024h,0d3h,09ah,0b7h,097h,077h,097h,094h,072h,094h,0a2h	; bdd8  .....$....w..r..
	defb 0b4h,0d2h,042h,0d3h,0b4h	; bde8

; ----------------------------------------------------------------------
; DATOS partitura_BDED: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xbded..0xbdff  (18 bytes)
DATA_partitura_BDED:
	defb 072h,094h,072h,0c4h,04fh,0c2h,0f8h,011h,0eah,00eh,0edh,02ah,0ebh,089h,03bh,011h	; bded  r.r.O......*....
	defb 0dbh,002h	; bdfd

; ----------------------------------------------------------------------
; DATOS partitura_BDFF: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (28 bytes)
;   0xbdff..0xbe1b  (28 bytes)
DATA_partitura_BDFF:
	defb 0d6h,010h,001h,0f0h,00fh,042h,0d2h,044h,062h,074h,092h,0b4h,0d1h,042h,0c4h,0d2h	; bdff  .....B.Dbt...B..
	defb 072h,0c4h,0b2h,0c4h,0b2h,09fh,0d1h,024h,022h,0c4h,022h,0c4h	; be0f  r......$".".

; ----------------------------------------------------------------------
; DATOS partitura_BE1B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (29 bytes)
;   0xbe1b..0xbe38  (29 bytes)
DATA_partitura_BE1B:
	defb 022h,024h,022h,0d2h,0b4h,042h,0c4h,07ah,0c7h,044h,062h,074h,092h,0b4h,0d1h,042h	; be1b  "$"..B.z.Dbt...B
	defb 0c4h,0d2h,072h,0c4h,0b2h,0c4h,0b2h,097h,0b7h,0d1h,024h,022h,0c4h	; be2b  ..r.......$".

; ----------------------------------------------------------------------
; DATOS partitura_BE38: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xbe38..0xbe3e  (6 bytes)
DATA_partitura_BE38:
	defb 022h,0c4h,022h,024h,022h,0d2h	; be38

; ----------------------------------------------------------------------
; DATOS partitura_BE3E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xbe3e..0xbe44  (6 bytes)
DATA_partitura_BE3E:
	defb 064h,092h,0d1h,027h,027h,037h	; be3e

; ----------------------------------------------------------------------
; DATOS partitura_BE44: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xbe44..0xbe47  (3 bytes)
DATA_partitura_BE44:
	defb 0fdh,059h,0bdh	; be44

; ----------------------------------------------------------------------
; DATOS partitura_BE47: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xbe47..0xbe4b  (4 bytes)
DATA_partitura_BE47:
	defb 0feh,001h,0e9h,002h	; be47

; ----------------------------------------------------------------------
; DATOS partitura_BE4B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xbe4b..0xbe4e  (3 bytes)
DATA_partitura_BE4B:
	defb 0c2h,0eeh,081h	; be4b

; ----------------------------------------------------------------------
; DATOS partitura_BE4E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xbe4e..0xbe59  (11 bytes)
DATA_partitura_BE4E:
	defb 0eah,005h,0edh,014h,0ebh,089h,01bh,041h,0dbh,001h,0d6h	; be4e  .......A...

; ----------------------------------------------------------------------
; DATOS partitura_BE59: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xbe59..0xbe5d  (4 bytes)
DATA_partitura_BE59:
	defb 020h,001h,0f0h,00fh	; be59

; ----------------------------------------------------------------------
; DATOS partitura_BE5D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (13 bytes)
;   0xbe5d..0xbe6a  (13 bytes)
DATA_partitura_BE5D:
	defb 042h,0d3h,044h,0cah,074h,0cah,094h,072h,094h,0a2h,094h,072h,044h	; be5d  B.D.t..r...rD

; ----------------------------------------------------------------------
; DATOS partitura_BE6A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xbe6a..0xbe83  (25 bytes)
DATA_partitura_BE6A:
	defb 0d4h,0b2h,0d3h,044h,0cah,074h,0cah,094h,072h,094h,0a2h,0b4h,0d2h,042h,0c7h,0d3h	; be6a  ...D.t..r....B..
	defb 044h,0cah,074h,0cah,094h,072h,094h,0a2h,094h	; be7a  D.t..r...

; ----------------------------------------------------------------------
; DATOS partitura_BE83: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (35 bytes)
;   0xbe83..0xbea6  (35 bytes)
DATA_partitura_BE83:
	defb 072h,044h,0d4h,0b2h,0d3h,044h,0cah,074h,0cah,0d3h,094h,072h,094h,0a2h,0b4h,0d2h	; be83  rD...D.t...r....
	defb 042h,0d3h,0b4h,072h,0eeh,081h,0eah,006h,0edh,014h,0ebh,089h,01bh,041h,0dbh,001h	; be93  B..r.........A..
	defb 0d6h,010h,001h	; bea3

; ----------------------------------------------------------------------
; DATOS partitura_BEA6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xbea6..0xbeae  (8 bytes)
DATA_partitura_BEA6:
	defb 0f0h,00fh,042h,0d3h,0b4h,072h,0c4h,097h	; bea6  ..B..r..

; ----------------------------------------------------------------------
; DATOS partitura_BEAE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xbeae..0xbec7  (25 bytes)
DATA_partitura_BEAE:
	defb 062h,074h,092h,0b4h,0c2h,074h,09ah,0c7h,0b4h,072h,0c4h,097h,062h,074h,092h,0b4h	; beae  bt...t...r..bt..
	defb 0c2h,094h,0c2h,074h,0c2h,094h,0c2h,0d2h,044h	; bebe  ...t....D

; ----------------------------------------------------------------------
; DATOS partitura_BEC7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xbec7..0xbece  (7 bytes)
DATA_partitura_BEC7:
	defb 0c2h,0d3h,0b4h,0c2h,0d2h,024h,0d3h	; bec7

; ----------------------------------------------------------------------
; DATOS partitura_BECE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (12 bytes)
;   0xbece..0xbeda  (12 bytes)
DATA_partitura_BECE:
	defb 09ah,0b4h,0b2h,097h,077h,097h,0c4h,097h,072h,094h,072h,094h	; bece  ....w...r.r.

; ----------------------------------------------------------------------
; DATOS partitura_BEDA: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xbeda..0xbeec  (18 bytes)
DATA_partitura_BEDA:
	defb 0a2h,094h,072h,0c4h,047h,062h,074h,092h,0efh,0eeh,081h,0eah,005h,0edh,024h,0ebh	; beda  ..r.Gbt.......$.
	defb 089h,01bh	; beea

; ----------------------------------------------------------------------
; DATOS partitura_BEEC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xbeec..0xbef2  (6 bytes)
DATA_partitura_BEEC:
	defb 041h,0dbh,001h,0d6h,010h,001h	; beec

; ----------------------------------------------------------------------
; DATOS partitura_BEF2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xbef2..0xbf03  (17 bytes)
DATA_partitura_BEF2:
	defb 0f0h,00fh,042h,0d3h,0b4h,072h,0c4h,09ah,0d3h,094h,0c2h,0d3h,0b4h,072h,0b4h,092h	; bef2  ..B..r.......r..
	defb 094h	; bf02

; ----------------------------------------------------------------------
; DATOS partitura_BF03: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xbf03..0xbf09  (6 bytes)
DATA_partitura_BF03:
	defb 0d3h,092h,094h,0c2h,0d3h,0b4h	; bf03

; ----------------------------------------------------------------------
; DATOS partitura_BF09: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xbf09..0xbf0f  (6 bytes)
DATA_partitura_BF09:
	defb 072h,0c4h,097h,062h,074h,092h	; bf09

; ----------------------------------------------------------------------
; DATOS partitura_BF0F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xbf0f..0xbf12  (3 bytes)
DATA_partitura_BF0F:
	defb 0b4h,0c2h,094h	; bf0f

; ----------------------------------------------------------------------
; DATOS partitura_BF12: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (28 bytes)
;   0xbf12..0xbf2e  (28 bytes)
DATA_partitura_BF12:
	defb 0c2h,074h,09ah,0d2h,044h,0c2h,0d3h,0b4h,0c2h,0d2h,024h,0d3h,09ah,0b7h,097h,077h	; bf12  .t..D.....$....w
	defb 097h,094h,072h,094h,0a2h,0b4h,0d2h,042h,0d3h,0b4h,072h,094h	; bf22  ..r....B..r.

; ----------------------------------------------------------------------
; DATOS partitura_BF2E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xbf2e..0xbf34  (6 bytes)
DATA_partitura_BF2E:
	defb 072h,0c4h,04fh,0eeh,081h,0c2h	; bf2e

; ----------------------------------------------------------------------
; DATOS partitura_BF34: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xbf34..0xbf35  (1 bytes)
DATA_partitura_BF34:
	defb 0eah	; bf34

; ----------------------------------------------------------------------
; DATOS partitura_BF35: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xbf35..0xbf39  (4 bytes)
DATA_partitura_BF35:
	defb 008h,0edh,026h,0ebh	; bf35

; ----------------------------------------------------------------------
; DATOS partitura_BF39: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xbf39..0xbf44  (11 bytes)
DATA_partitura_BF39:
	defb 089h,02bh,011h,0dbh,001h,0d6h,010h,001h,0f0h,00fh,042h	; bf39  .+........B

; ----------------------------------------------------------------------
; DATOS partitura_BF44: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xbf44..0xbf4c  (8 bytes)
DATA_partitura_BF44:
	defb 0d2h,044h,062h,074h,092h,0b4h,0d1h,042h	; bf44  .Dbt...B

; ----------------------------------------------------------------------
; DATOS partitura_BF4C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (5 bytes)
;   0xbf4c..0xbf51  (5 bytes)
DATA_partitura_BF4C:
	defb 0c4h,0d2h,072h,0c4h,0b2h	; bf4c

; ----------------------------------------------------------------------
; DATOS partitura_BF51: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (5 bytes)
;   0xbf51..0xbf56  (5 bytes)
DATA_partitura_BF51:
	defb 0c4h,0b2h,09fh,0d1h,024h	; bf51

; ----------------------------------------------------------------------
; DATOS partitura_BF56: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xbf56..0xbf5a  (4 bytes)
DATA_partitura_BF56:
	defb 022h,0c4h,022h,0c4h	; bf56

; ----------------------------------------------------------------------
; DATOS partitura_BF5A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xbf5a..0xbf5e  (4 bytes)
DATA_partitura_BF5A:
	defb 022h,024h,022h,0d2h	; bf5a

; ----------------------------------------------------------------------
; DATOS partitura_BF5E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (27 bytes)
;   0xbf5e..0xbf79  (27 bytes)
DATA_partitura_BF5E:
	defb 0b4h,042h,0c4h,07ah,0c7h,044h,062h,074h,092h,0b4h,0d1h,042h,0c4h,0d2h,072h,0c4h	; bf5e  .B.z.Dbt...B..r.
	defb 0b2h,0c4h,0b2h,097h,0b7h,0d1h,024h,022h,0c4h,022h,0c4h	; bf6e  ......$".".

; ----------------------------------------------------------------------
; DATOS partitura_BF79: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (13 bytes)
;   0xbf79..0xbf86  (13 bytes)
DATA_partitura_BF79:
	defb 022h,024h,022h,0d2h,064h,092h,0d1h,027h,027h,037h,0fdh,097h,0beh	; bf79  "$".d..''7...

; ----------------------------------------------------------------------
; DATOS relleno_ff: 122 bytes a 0xFF hasta el final del banco: relleno; lo
;   leen nadie (122 bytes)
;   0xbf86..0xc000  (122 bytes)
DATA_relleno_ff:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf86  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf96  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfa6  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfb6  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfc6  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfd6  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfe6  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bff6  ..........
