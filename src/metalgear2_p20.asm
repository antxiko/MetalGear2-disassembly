; ==========================================================================
; METAL GEAR 2 SOLID SNAKE - Konami (1990) - MSX2 - MegaROM RC-767 de 512 KB (Konami SCC) - banco 20 (se ejecuta en 0xa000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x0a000


; ----------------------------------------------------------------------
; DATOS partitura_A000: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6A, 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xa000..0xa006  (6 bytes)
DATA_partitura_A000:
	defb 0f5h,0f9h,0b4h,0a4h,0fbh,010h	; a000

; ----------------------------------------------------------------------
; DATOS partitura_A006: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6A, 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (16 bytes)
;   0xa006..0xa016  (16 bytes)
DATA_partitura_A006:
	defb 0f5h,0f9h,0b4h,0a4h,0fbh,010h,0d0h,0f5h,061h,0a0h,000h,0b0h,000h,061h,0a0h,000h	; a006  ........a....a..

; ----------------------------------------------------------------------
; DATOS partitura_A016: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6A, 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (10 bytes)
;   0xa016..0xa020  (10 bytes)
DATA_partitura_A016:
	defb 020h,000h,061h,0a0h,000h,0b0h,000h,061h,0a0h,000h	; a016   .a....a..

; ----------------------------------------------------------------------
; DATOS partitura_A020: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6A, 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xa020..0xa023  (3 bytes)
DATA_partitura_A020:
	defb 0b0h,000h,061h	; a020

; ----------------------------------------------------------------------
; DATOS partitura_A023: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6A, 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xa023..0xa02e  (11 bytes)
DATA_partitura_A023:
	defb 0a0h,000h,061h,020h,000h,0fbh,002h,0d0h,061h,0a0h,000h	; a023  ..a ....a..

; ----------------------------------------------------------------------
; DATOS partitura_A02E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa02e..0xa02f  (1 bytes)
DATA_partitura_A02E:
	defb 0b0h	; a02e

; ----------------------------------------------------------------------
; DATOS partitura_A02F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xa02f..0xa040  (17 bytes)
DATA_partitura_A02F:
	defb 000h,061h,0a0h,000h,020h,000h,061h,0a0h,000h,0b0h,000h,061h,0a0h,000h,0b0h,000h	; a02f  .a.. .a....a....
	defb 061h	; a03f

; ----------------------------------------------------------------------
; DATOS partitura_A040: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xa040..0xa046  (6 bytes)
DATA_partitura_A040:
	defb 0a0h,000h,061h,020h,000h,0d0h	; a040

; ----------------------------------------------------------------------
; DATOS partitura_A046: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xa046..0xa051  (11 bytes)
DATA_partitura_A046:
	defb 061h,0a0h,000h,0b0h,000h,061h,0a0h,000h,020h,000h,041h	; a046  a....a.. .A

; ----------------------------------------------------------------------
; DATOS partitura_A051: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (13 bytes)
;   0xa051..0xa05e  (13 bytes)
DATA_partitura_A051:
	defb 061h,031h,041h,051h,061h,062h,050h,070h,070h,070h,070h,0fdh,000h	; a051  a1AQabPpppp..

; ----------------------------------------------------------------------
; DATOS partitura_A05E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa05e..0xa05f  (1 bytes)
DATA_partitura_A05E:
	defb 0a0h	; a05e

; ----------------------------------------------------------------------
; DATOS partitura_A05F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6A, 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa05f..0xa060  (1 bytes)
DATA_partitura_A05F:
	defb 0feh	; a05f

; ----------------------------------------------------------------------
; DATOS partitura_A060: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6A, 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (9 bytes)
;   0xa060..0xa069  (9 bytes)
DATA_partitura_A060:
	defb 001h,0e9h,010h,0c1h,0f0h,004h,031h,0eah,008h	; a060  ......1..

; ----------------------------------------------------------------------
; DATOS partitura_A069: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6A, 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xa069..0xa082  (25 bytes)
DATA_partitura_A069:
	defb 0edh,062h,0ebh,087h,013h,0b1h,0dbh,001h,0d1h,00eh,0edh,006h,000h,0edh,062h,0d2h	; a069  .b............b.
	defb 0afh,08eh,0edh,006h,080h,0edh,062h,0afh,0d1h	; a079  ......b..

; ----------------------------------------------------------------------
; DATOS partitura_A082: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6A, 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (13 bytes)
;   0xa082..0xa08f  (13 bytes)
DATA_partitura_A082:
	defb 00eh,0edh,006h,000h,0edh,062h,0d2h,0afh,08eh,0edh,006h,080h,0edh	; a082  .....b.......

; ----------------------------------------------------------------------
; DATOS partitura_A08F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xa08f..0xa091  (2 bytes)
DATA_partitura_A08F:
	defb 062h,0adh	; a08f

; ----------------------------------------------------------------------
; DATOS partitura_A091: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6A, 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (12 bytes)
;   0xa091..0xa09d  (12 bytes)
DATA_partitura_A091:
	defb 0feh,001h,0e9h,008h,0c2h,0eah,006h,0ebh,019h,027h,031h,0dbh	; a091  .........'1.

; ----------------------------------------------------------------------
; DATOS partitura_A09D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6A, 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa09d..0xa0a5  (8 bytes)
DATA_partitura_A09D:
	defb 002h,0f5h,0d1h,000h,0d0h,000h,0d1h,070h	; a09d  .......p

; ----------------------------------------------------------------------
; DATOS partitura_A0A5: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6A, 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (34 bytes)
;   0xa0a5..0xa0c7  (34 bytes)
DATA_partitura_A0A5:
	defb 000h,0a0h,050h,000h,0d0h,030h,0d1h,0a0h,000h,0d0h,020h,0d1h,0a0h,000h,0d0h,000h	; a0a5  ..P..0.... .....
	defb 0d1h,070h,000h,0fbh,008h,0eah,006h,0ebh,019h,027h,031h,0dbh,002h,0f5h,0d1h,040h	; a0b5  .p.......'1....@
	defb 0d0h,040h	; a0c5

; ----------------------------------------------------------------------
; DATOS partitura_A0C7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6A, 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (20 bytes)
;   0xa0c7..0xa0db  (20 bytes)
DATA_partitura_A0C7:
	defb 0d1h,0b0h,040h,0d0h,020h,0d1h,090h,040h,0d0h,070h,020h,0d1h,040h,0d0h,060h,020h	; a0c7  ..@. ..@.p .@.`
	defb 0d1h,040h,0d0h,040h	; a0d7

; ----------------------------------------------------------------------
; DATOS partitura_A0DB: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6A, 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (14 bytes)
;   0xa0db..0xa0e9  (14 bytes)
DATA_partitura_A0DB:
	defb 0d1h,0b0h,040h,0fbh,008h,0eeh,002h,0e9h,004h,0eah,006h,0edh,015h,0ebh	; a0db  ..@...........

; ----------------------------------------------------------------------
; DATOS partitura_A0E9: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6A, 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (10 bytes)
;   0xa0e9..0xa0f3  (10 bytes)
DATA_partitura_A0E9:
	defb 089h,068h,001h,0f5h,0d2h,000h,050h,0a0h,050h,070h	; a0e9  .h....P.Pp

; ----------------------------------------------------------------------
; DATOS partitura_A0F3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6A, 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (26 bytes)
;   0xa0f3..0xa10d  (26 bytes)
DATA_partitura_A0F3:
	defb 0d1h,000h,0d2h,0a0h,0d1h,030h,0fbh,010h,0e9h,004h,0eah,006h,0edh,015h,0ebh,089h	; a0f3  .....0..........
	defb 068h,001h,0f5h,0d2h,020h,070h,0d1h,000h,0d2h,070h	; a103  h... p...p

; ----------------------------------------------------------------------
; DATOS partitura_A10D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (16 bytes)
;   0xa10d..0xa11d  (16 bytes)
DATA_partitura_A10D:
	defb 090h,0d1h,020h,000h,050h,0fbh,008h,0e9h,004h,0eah,006h,0edh,015h,0ebh,089h,068h	; a10d  .. .P..........h

; ----------------------------------------------------------------------
; DATOS partitura_A11D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (23 bytes)
;   0xa11d..0xa134  (23 bytes)
DATA_partitura_A11D:
	defb 001h,0f5h,0d2h,020h,070h,0d1h,000h,0d2h,070h,090h,0d1h,020h,000h,050h,0fbh,007h	; a11d  ... p...p.. .P..
	defb 0d2h,020h,070h,0efh,0fdh,05fh,0a0h	; a12d

; ----------------------------------------------------------------------
; DATOS partitura_A134: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6A, 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xa134..0xa136  (2 bytes)
DATA_partitura_A134:
	defb 0feh,001h	; a134

; ----------------------------------------------------------------------
; DATOS partitura_A136: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6A, 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (5 bytes)
;   0xa136..0xa13b  (5 bytes)
DATA_partitura_A136:
	defb 0e9h,010h,0f0h,003h,051h	; a136

; ----------------------------------------------------------------------
; DATOS partitura_A13B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6A, 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (47 bytes)
;   0xa13b..0xa16a  (47 bytes)
DATA_partitura_A13B:
	defb 0f5h,0f1h,009h,017h,001h,013h,0eah,00bh,0ebh,027h,033h,0b1h,0dbh,002h,0d1h,00eh	; a13b  .........'3.....
	defb 000h,0d2h,0aeh,0dch,0ech,0eah,001h,0f6h,0f8h,017h,0a0h,0f1h,009h,017h,001h,013h	; a14b  ................
	defb 0eah,00bh,0ebh,027h,033h,0b1h,0dbh,002h,08eh,080h,0aeh,0dch,0ech,0eah,001h	; a15b  ...'3..........

; ----------------------------------------------------------------------
; DATOS partitura_A16A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6A, 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xa16a..0xa170  (6 bytes)
DATA_partitura_A16A:
	defb 0f6h,0f8h,017h,0a0h,0fbh,002h	; a16a

; ----------------------------------------------------------------------
; DATOS partitura_A170: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6A, 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (47 bytes)
;   0xa170..0xa19f  (47 bytes)
DATA_partitura_A170:
	defb 0feh,001h,0f1h,009h,025h,001h,016h,0e9h,010h,0eah,00bh,0ebh,027h,033h,071h,0dbh	; a170  ....%.......'3q.
	defb 002h,0f0h,003h,041h,0d2h,002h,079h,050h,0a0h,0d1h,030h,025h,0d2h,0a0h,078h,002h	; a180  ...A..yP..0%..x.
	defb 079h,050h,0a0h,0d1h,030h,025h,030h,058h,0f1h,009h,025h,001h,016h,0eah,00bh	; a190  yP..0%0X..%....

; ----------------------------------------------------------------------
; DATOS partitura_A19F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6A, 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (19 bytes)
;   0xa19f..0xa1b2  (19 bytes)
DATA_partitura_A19F:
	defb 0ebh,027h,033h,071h,0dbh,002h,0f0h,003h,041h,0d2h,042h,0b9h,090h,0d1h,020h,070h	; a19f  .'3q....A.B... p
	defb 065h,020h,0d2h	; a1af

; ----------------------------------------------------------------------
; DATOS partitura_A1B2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6A, 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa1b2..0xa1b3  (1 bytes)
DATA_partitura_A1B2:
	defb 0b8h	; a1b2

; ----------------------------------------------------------------------
; DATOS partitura_A1B3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6A, 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xa1b3..0xa1b6  (3 bytes)
DATA_partitura_A1B3:
	defb 042h,0b9h,090h	; a1b3

; ----------------------------------------------------------------------
; DATOS partitura_A1B6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6A, 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (13 bytes)
;   0xa1b6..0xa1c3  (13 bytes)
DATA_partitura_A1B6:
	defb 0d1h,020h,070h,065h,070h,098h,0dch,0f0h,000h,0e9h,004h,0f1h,085h	; a1b6  . pep........

; ----------------------------------------------------------------------
; DATOS partitura_A1C3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6A, 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xa1c3..0xa1c6  (3 bytes)
DATA_partitura_A1C3:
	defb 053h,001h,009h	; a1c3

; ----------------------------------------------------------------------
; DATOS partitura_A1C6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6A, 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (13 bytes)
;   0xa1c6..0xa1d3  (13 bytes)
DATA_partitura_A1C6:
	defb 0f3h,001h,0eah,007h,0edh,016h,0ebh,089h,065h,002h,0f5h,0d2h,000h	; a1c6  ........e....

; ----------------------------------------------------------------------
; DATOS partitura_A1D3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6A, 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (16 bytes)
;   0xa1d3..0xa1e3  (16 bytes)
DATA_partitura_A1D3:
	defb 050h,0a0h,050h,070h,0d1h,000h,0d2h,0a0h,0d1h,030h,0fbh,018h,0e9h,004h,0f1h,085h	; a1d3  P.Pp.....0......

; ----------------------------------------------------------------------
; DATOS partitura_A1E3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xa1e3..0xa1f5  (18 bytes)
DATA_partitura_A1E3:
	defb 053h,001h,009h,0f3h,001h,0eah,007h,0edh,016h,0ebh,089h,065h,002h,0f5h,0d2h,020h	; a1e3  S..........e...
	defb 070h,0d1h	; a1f3

; ----------------------------------------------------------------------
; DATOS partitura_A1F5: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (13 bytes)
;   0xa1f5..0xa202  (13 bytes)
DATA_partitura_A1F5:
	defb 000h,0d2h,070h,090h,0d1h,020h,000h,050h,0fbh,008h,0fdh,034h,0a1h	; a1f5  ..p.. .P...4.

; ----------------------------------------------------------------------
; DATOS partitura_A202: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6A, 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (10 bytes)
;   0xa202..0xa20c  (10 bytes)
DATA_partitura_A202:
	defb 0feh,001h,0e9h,008h,0eah,00dh,0ebh,059h,037h,031h	; a202  .......Y71

; ----------------------------------------------------------------------
; DATOS partitura_A20C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6A, 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xa20c..0xa20f  (3 bytes)
DATA_partitura_A20C:
	defb 0f5h,0f4h,052h	; a20c

; ----------------------------------------------------------------------
; DATOS partitura_A20F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6A, 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xa20f..0xa220  (17 bytes)
DATA_partitura_A20F:
	defb 052h,017h,01ch,0d4h,003h,003h,0f8h,01ch,000h,0d5h,000h,051h,0a1h,0d4h,031h,0fbh	; a20f  R..........Q..1.
	defb 010h	; a21f

; ----------------------------------------------------------------------
; DATOS partitura_A220: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6A, 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xa220..0xa222  (2 bytes)
DATA_partitura_A220:
	defb 0feh,001h	; a220

; ----------------------------------------------------------------------
; DATOS partitura_A222: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6A, 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xa222..0xa234  (18 bytes)
DATA_partitura_A222:
	defb 0f2h,001h,0e9h,010h,0eeh,001h,0eah,007h,0ebh,027h,033h,071h,0dbh,002h,0f0h,003h	; a222  .........'3q....
	defb 041h,0d2h	; a232

; ----------------------------------------------------------------------
; DATOS partitura_A234: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6A, 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xa234..0xa246  (18 bytes)
DATA_partitura_A234:
	defb 004h,079h,050h,0a0h,0d1h,030h,025h,0d2h,0a0h,078h,002h,079h,050h,0a0h,0d1h,030h	; a234  .yP..0%..x.yP..0
	defb 025h,030h	; a244

; ----------------------------------------------------------------------
; DATOS partitura_A246: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6A, 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (21 bytes)
;   0xa246..0xa25b  (21 bytes)
DATA_partitura_A246:
	defb 058h,0f2h,001h,0eeh,001h,0eah,007h,0ebh,027h,033h,071h,0dbh,002h,0f0h,003h,041h	; a246  X.......'3q....A
	defb 0d2h,042h,0b9h,090h,0d1h	; a256

; ----------------------------------------------------------------------
; DATOS partitura_A25B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6A, 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa25b..0xa25c  (1 bytes)
DATA_partitura_A25B:
	defb 020h	; a25b

; ----------------------------------------------------------------------
; DATOS partitura_A25C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6A, 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (27 bytes)
;   0xa25c..0xa277  (27 bytes)
DATA_partitura_A25C:
	defb 070h,065h,020h,0d2h,0b8h,042h,0b9h,090h,0d1h,020h,070h,065h,070h,096h,0f0h,000h	; a25c  pe ..B... pep...
	defb 0dch,0efh,0e9h,008h,0f5h,0f8h,023h,0eah,00dh,0ebh,059h	; a26c  ......#...Y

; ----------------------------------------------------------------------
; DATOS partitura_A277: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6A, 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (26 bytes)
;   0xa277..0xa291  (26 bytes)
DATA_partitura_A277:
	defb 037h,041h,0d4h,001h,0f8h,009h,001h,001h,0f8h,023h,001h,0f8h,009h,001h,001h,0f8h	; a277  7A.......#......
	defb 023h,001h,0f8h,009h,001h,001h,0f8h,023h,001h,0f8h	; a287  #......#..

; ----------------------------------------------------------------------
; DATOS partitura_A291: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6A, 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xa291..0xa2a2  (17 bytes)
DATA_partitura_A291:
	defb 009h,001h,001h,0f8h,014h,001h,0d5h,001h,051h,0a1h,0fbh,002h,0f8h,023h,0eah,00dh	; a291  ........Q....#..
	defb 0ebh	; a2a1

; ----------------------------------------------------------------------
; DATOS partitura_A2A2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xa2a2..0xa2bb  (25 bytes)
DATA_partitura_A2A2:
	defb 059h,037h,041h,0d4h,021h,0f8h,009h,021h,021h,0f8h,023h,021h,0f8h,009h,021h,021h	; a2a2  Y7A.!..!!.#!..!!
	defb 0f8h,023h,021h,0f8h,009h,021h,021h,0f8h,023h	; a2b2  .#!..!!.#

; ----------------------------------------------------------------------
; DATOS partitura_A2BB: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa2bb..0xa2bc  (1 bytes)
DATA_partitura_A2BB:
	defb 021h	; a2bb

; ----------------------------------------------------------------------
; DATOS partitura_A2BC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa2bc..0xa2c4  (8 bytes)
DATA_partitura_A2BC:
	defb 0f8h,009h,021h,021h,0f8h,014h,021h,0d5h	; a2bc  ..!!..!.

; ----------------------------------------------------------------------
; DATOS partitura_A2C4: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (5 bytes)
;   0xa2c4..0xa2c9  (5 bytes)
DATA_partitura_A2C4:
	defb 021h,071h,0d4h,001h,0f8h	; a2c4

; ----------------------------------------------------------------------
; DATOS partitura_A2C9: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa2c9..0xa2d1  (8 bytes)
DATA_partitura_A2C9:
	defb 023h,0eah,00dh,0ebh,059h,037h,041h,0d4h	; a2c9  #...Y7A.

; ----------------------------------------------------------------------
; DATOS partitura_A2D1: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xa2d1..0xa2dc  (11 bytes)
DATA_partitura_A2D1:
	defb 021h,0f8h,009h,021h,021h,0f8h,023h,021h,0f8h,009h,021h	; a2d1  !..!!.#!..!

; ----------------------------------------------------------------------
; DATOS partitura_A2DC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xa2dc..0xa2e7  (11 bytes)
DATA_partitura_A2DC:
	defb 021h,0f8h,023h,021h,0d5h,071h,071h,071h,071h,071h,071h	; a2dc  !.#!.qqqqqq

; ----------------------------------------------------------------------
; DATOS partitura_A2E7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xa2e7..0xa2ed  (6 bytes)
DATA_partitura_A2E7:
	defb 071h,071h,071h,0fdh,002h,0a2h	; a2e7

; ----------------------------------------------------------------------
; DATOS partitura_A2ED: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6A, 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (5 bytes)
;   0xa2ed..0xa2f2  (5 bytes)
DATA_partitura_A2ED:
	defb 0feh,001h,0e9h,010h,0f0h	; a2ed

; ----------------------------------------------------------------------
; DATOS partitura_A2F2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6A, 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xa2f2..0xa2f5  (3 bytes)
DATA_partitura_A2F2:
	defb 003h,042h,0f8h	; a2f2

; ----------------------------------------------------------------------
; DATOS partitura_A2F5: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6A, 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xa2f5..0xa2f8  (3 bytes)
DATA_partitura_A2F5:
	defb 052h,0f5h,0eah	; a2f5

; ----------------------------------------------------------------------
; DATOS partitura_A2F8: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6A, 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (5 bytes)
;   0xa2f8..0xa2fd  (5 bytes)
DATA_partitura_A2F8:
	defb 009h,0ebh,027h,043h,0b1h	; a2f8

; ----------------------------------------------------------------------
; DATOS partitura_A2FD: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6A, 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa2fd..0xa305  (8 bytes)
DATA_partitura_A2FD:
	defb 0dbh,002h,0d2h,07eh,070h,05eh,0dch,0ech	; a2fd  ...~p^..

; ----------------------------------------------------------------------
; DATOS partitura_A305: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6A, 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa305..0xa306  (1 bytes)
DATA_partitura_A305:
	defb 0eah	; a305

; ----------------------------------------------------------------------
; DATOS partitura_A306: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6A, 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa306..0xa30e  (8 bytes)
DATA_partitura_A306:
	defb 001h,050h,0eah,009h,0ebh,027h,043h,0b1h	; a306  .P...'C.

; ----------------------------------------------------------------------
; DATOS partitura_A30E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6A, 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa30e..0xa316  (8 bytes)
DATA_partitura_A30E:
	defb 0dbh,002h,03eh,030h,05eh,0dch,0ech,0eah	; a30e  ..>0^...

; ----------------------------------------------------------------------
; DATOS partitura_A316: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6A, 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa316..0xa317  (1 bytes)
DATA_partitura_A316:
	defb 001h	; a316

; ----------------------------------------------------------------------
; DATOS partitura_A317: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6A, 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xa317..0xa31d  (6 bytes)
DATA_partitura_A317:
	defb 050h,0fbh,002h,0f0h,000h,0dch	; a317

; ----------------------------------------------------------------------
; DATOS partitura_A31D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6A, 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa31d..0xa31e  (1 bytes)
DATA_partitura_A31D:
	defb 0f8h	; a31d

; ----------------------------------------------------------------------
; DATOS partitura_A31E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6A, 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa31e..0xa326  (8 bytes)
DATA_partitura_A31E:
	defb 052h,0e9h,008h,0eah,00eh,0ebh,059h,037h	; a31e  R.....Y7

; ----------------------------------------------------------------------
; DATOS partitura_A326: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6A, 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xa326..0xa33f  (25 bytes)
DATA_partitura_A326:
	defb 051h,0f5h,0d4h,003h,003h,000h,0d5h,000h,051h,0a1h,0d4h,031h,0fbh,008h,0eah,00eh	; a326  Q.......Q..1....
	defb 0ebh,059h,037h,051h,0f5h,0d4h,043h,043h,040h	; a336  .Y7Q..CC@

; ----------------------------------------------------------------------
; DATOS partitura_A33F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6A, 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (94 bytes)
;   0xa33f..0xa39d  (94 bytes)
DATA_partitura_A33F:
	defb 0d5h,040h,071h,0b1h,0d4h,071h,0fbh,008h,0d6h,002h,002h,0f5h,0f8h,002h,0eah,00ch	; a33f  .@q..q..........
	defb 0ebh,029h,047h,002h,0d1h,031h,0f8h,009h,0eah,009h,0d2h,001h,001h,0fbh,004h,0f8h	; a34f  .)G..1..........
	defb 002h,0eah,00ah,0d2h,000h,050h,0a0h,050h,070h,0d1h,000h,0d2h,0a0h,0d1h,030h,0f5h	; a35f  .....P.Pp.....0.
	defb 0f8h,002h,0eah,00ch,0d1h,031h,0f8h,009h,0eah,009h,0d2h,001h,001h,0fbh,004h,0f8h	; a36f  .....1..........
	defb 002h,0eah,00ah,0d2h,000h,050h,0a0h,050h,070h,0d1h,000h,0d2h,0a0h,0d1h,030h,0d6h	; a37f  .....P.Pp.....0.
	defb 002h,002h,0f5h,0f8h,002h,0eah,00ch,0ebh,029h,047h,002h,0d1h,051h,0f8h	; a38f  ........)G..Q.

; ----------------------------------------------------------------------
; DATOS partitura_A39D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xa39d..0xa3a8  (11 bytes)
DATA_partitura_A39D:
	defb 009h,0eah,009h,0d2h,021h,021h,0fbh,004h,0f8h,002h,0eah	; a39d  ....!!.....

; ----------------------------------------------------------------------
; DATOS partitura_A3A8: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (24 bytes)
;   0xa3a8..0xa3c0  (24 bytes)
DATA_partitura_A3A8:
	defb 00ah,0d2h,020h,070h,0d1h,000h,0d2h,070h,090h,0d1h,020h,000h,050h,0d6h,002h,002h	; a3a8  .. p...p.. .P...
	defb 0f5h,0f8h,002h,0eah,00ch,0ebh,029h,047h	; a3b8  ......)G

; ----------------------------------------------------------------------
; DATOS partitura_A3C0: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (24 bytes)
;   0xa3c0..0xa3d8  (24 bytes)
DATA_partitura_A3C0:
	defb 002h,0d1h,051h,0f8h,009h,0eah,009h,0d2h,021h,021h,0fbh,002h,0f8h,002h,0eah,00ch	; a3c0  ..Q.....!!......
	defb 0d1h,051h,0e9h,010h,0ebh,029h,045h,003h	; a3d0  .Q...)E.

; ----------------------------------------------------------------------
; DATOS partitura_A3D8: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (10 bytes)
;   0xa3d8..0xa3e2  (10 bytes)
DATA_partitura_A3D8:
	defb 0dbh,002h,0f0h,003h,032h,078h,0d8h,0fdh,0edh,0a2h	; a3d8  ....2x....

; ----------------------------------------------------------------------
; DATOS partitura_A3E2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6A, 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xa3e2..0xa3e8  (6 bytes)
DATA_partitura_A3E2:
	defb 0f5h,0f9h,0cah,0a4h,0fbh,010h	; a3e2

; ----------------------------------------------------------------------
; DATOS partitura_A3E8: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6A, 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (168 bytes)
;   0xa3e8..0xa490  (168 bytes)
DATA_partitura_A3E8:
	defb 0f5h,0f9h,0cah,0a4h,0fbh,008h,0eah,005h,0ebh,019h,027h,031h,0dbh,001h,0f5h,0d1h	; a3e8  ..........'1....
	defb 040h,0d0h,040h,0d1h,0b0h,040h,0d0h,020h,0d1h,090h,040h,0d0h,070h,020h,0d1h,040h	; a3f8  @.@..@. ..@.p .@
	defb 0d0h,060h,020h,0d1h,040h,0d0h,040h,0d1h,0b0h,040h,0fbh,008h,0dch,0d6h,003h,002h	; a408  .` .@.@..@......
	defb 0f5h,0eah,00ch,0ebh,029h,047h,002h,0d2h,0a1h,0eah,009h,0d3h,071h,071h,0fbh,004h	; a418  ....)G......qq..
	defb 0e9h,004h,0c2h,0eah,005h,0ebh,009h,017h,001h,0d2h,001h,051h,0a1h,051h,071h,0d1h	; a428  ...........Q.Qq.
	defb 001h,0d2h,0a0h,0e9h,008h,0f5h,0eah,00ch,0ebh,029h,047h,002h,0d2h,0a1h,0eah,009h	; a438  .........)G.....
	defb 0d3h,071h,071h,0fbh,004h,0e9h,004h,0c2h,0ebh,009h,017h,001h,0eah,005h,0d2h,001h	; a448  .qq.............
	defb 051h,0a1h,051h,071h,0d1h,001h,0d2h,0a0h,0e9h,008h,0d6h,003h,002h,0f5h,0eah,00ch	; a458  Q.Qq............
	defb 0ebh,029h,047h,002h,0d1h,001h,0eah,009h,0d3h,091h,091h,0fbh,004h,0e9h,004h,0c2h	; a468  .)G.............
	defb 0eah,005h,0ebh,009h,017h,001h,0d2h,021h,071h,0d1h,001h,0d2h,071h,091h,0d1h,021h	; a478  .......!q...q..!
	defb 000h,0e9h,008h,0d6h,003h,002h,0f5h,0eah	; a488  ........

; ----------------------------------------------------------------------
; DATOS partitura_A490: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6A, 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (37 bytes)
;   0xa490..0xa4b5  (37 bytes)
DATA_partitura_A490:
	defb 00ch,0ebh,029h,047h,002h,0d1h,001h,0eah,009h,0d3h,091h,091h,0fbh,002h,0eah,00ch	; a490  ..)G............
	defb 0d1h,001h,0e9h,010h,0ebh,029h,045h,003h,0dbh,002h,0f0h,004h,032h,028h,0f0h,000h	; a4a0  .....)E.....2(..
	defb 0d8h,0fdh,0e2h,0a3h,0feh	; a4b0

; ----------------------------------------------------------------------
; DATOS partitura_A4B5: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6A, 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xa4b5..0xa4c6  (17 bytes)
DATA_partitura_A4B5:
	defb 004h,0e9h,008h,0d0h,0b0h,000h,020h,000h,0b0h,000h,020h,000h,0b0h,0a0h,020h,000h	; a4b5  ...... ... ... .
	defb 070h	; a4c5

; ----------------------------------------------------------------------
; DATOS partitura_A4C6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6A, 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (22 bytes)
;   0xa4c6..0xa4dc  (22 bytes)
DATA_partitura_A4C6:
	defb 000h,020h,000h,0fah,0feh,001h,0e9h,008h,0eah,005h,0ebh,019h,027h,031h,0dbh,001h	; a4c6  . ..........'1..
	defb 0d1h,000h,0d0h,000h,0d1h,070h	; a4d6

; ----------------------------------------------------------------------
; DATOS partitura_A4DC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6A, 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xa4dc..0xa4e7  (11 bytes)
DATA_partitura_A4DC:
	defb 000h,0a0h,050h,000h,0d0h,030h,0d1h,0a0h,000h,0d0h,020h	; a4dc  ..P..0....

; ----------------------------------------------------------------------
; DATOS partitura_A4E7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6A, 0x6B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (9 bytes)
;   0xa4e7..0xa4f0  (9 bytes)
DATA_partitura_A4E7:
	defb 0d1h,0a0h,000h,0d0h,000h,0d1h,070h,000h,0fah	; a4e7  ......p..

; ----------------------------------------------------------------------
; DATOS partitura_A4F0: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x75 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa4f0..0xa4f1  (1 bytes)
DATA_partitura_A4F0:
	defb 0ffh	; a4f0

; ----------------------------------------------------------------------
; DATOS partitura_A4F1: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xa4f1..0xa4f3  (2 bytes)
DATA_partitura_A4F1:
	defb 0feh,004h	; a4f1

; ----------------------------------------------------------------------
; DATOS partitura_A4F3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa4f3..0xa4fb  (8 bytes)
DATA_partitura_A4F3:
	defb 0e9h,006h,0d0h,050h,060h,0d0h,0a0h,0a0h	; a4f3  ...P`...

; ----------------------------------------------------------------------
; DATOS partitura_A4FB: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa4fb..0xa4fc  (1 bytes)
DATA_partitura_A4FB:
	defb 070h	; a4fb

; ----------------------------------------------------------------------
; DATOS partitura_A4FC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa4fc..0xa4fd  (1 bytes)
DATA_partitura_A4FC:
	defb 0a0h	; a4fc

; ----------------------------------------------------------------------
; DATOS partitura_A4FD: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xa4fd..0xa504  (7 bytes)
DATA_partitura_A4FD:
	defb 0a1h,070h,0a1h,0a0h,071h,0a0h,0a0h	; a4fd

; ----------------------------------------------------------------------
; DATOS partitura_A504: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa504..0xa505  (1 bytes)
DATA_partitura_A504:
	defb 070h	; a504

; ----------------------------------------------------------------------
; DATOS partitura_A505: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa505..0xa50d  (8 bytes)
DATA_partitura_A505:
	defb 0a0h,0a0h,0a0h,070h,0a0h,0a1h,070h,0a0h	; a505  ...p..p.

; ----------------------------------------------------------------------
; DATOS partitura_A50D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa50d..0xa515  (8 bytes)
DATA_partitura_A50D:
	defb 070h,070h,0a0h,071h,0a0h,070h,0a0h,050h	; a50d  pp.q.p.P

; ----------------------------------------------------------------------
; DATOS partitura_A515: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa515..0xa51d  (8 bytes)
DATA_partitura_A515:
	defb 061h,0a0h,070h,0a0h,0a1h,070h,0a1h,0a0h	; a515  a.p..p..

; ----------------------------------------------------------------------
; DATOS partitura_A51D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa51d..0xa525  (8 bytes)
DATA_partitura_A51D:
	defb 071h,0a0h,0a0h,070h,0a0h,0a0h,0a0h,070h	; a51d  q..p...p

; ----------------------------------------------------------------------
; DATOS partitura_A525: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xa525..0xa52b  (6 bytes)
DATA_partitura_A525:
	defb 0a0h,0a1h,070h,0a0h,070h,070h	; a525

; ----------------------------------------------------------------------
; DATOS partitura_A52B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xa52b..0xa52d  (2 bytes)
DATA_partitura_A52B:
	defb 070h,071h	; a52b

; ----------------------------------------------------------------------
; DATOS partitura_A52D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa52d..0xa52e  (1 bytes)
DATA_partitura_A52D:
	defb 070h	; a52d

; ----------------------------------------------------------------------
; DATOS partitura_A52E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa52e..0xa52f  (1 bytes)
DATA_partitura_A52E:
	defb 070h	; a52e

; ----------------------------------------------------------------------
; DATOS partitura_A52F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa52f..0xa537  (8 bytes)
DATA_partitura_A52F:
	defb 070h,0d0h,050h,061h,0a0h,070h,0a0h,0a1h	; a52f  p.Pa.p..

; ----------------------------------------------------------------------
; DATOS partitura_A537: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa537..0xa53f  (8 bytes)
DATA_partitura_A537:
	defb 070h,0a1h,0a0h,071h,0a0h,0a0h,070h,0a0h	; a537  p..q..p.

; ----------------------------------------------------------------------
; DATOS partitura_A53F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa53f..0xa547  (8 bytes)
DATA_partitura_A53F:
	defb 0a0h,0a0h,070h,0a0h,0a1h,070h,0a0h,070h	; a53f  ..p..p.p

; ----------------------------------------------------------------------
; DATOS partitura_A547: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa547..0xa54f  (8 bytes)
DATA_partitura_A547:
	defb 070h,0a0h,071h,0a0h,070h,0a0h,050h,061h	; a547  p.q.p.Pa

; ----------------------------------------------------------------------
; DATOS partitura_A54F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa54f..0xa557  (8 bytes)
DATA_partitura_A54F:
	defb 0a0h,070h,0a0h,0a1h,070h,0a1h,0a0h,071h	; a54f  .p..p..q

; ----------------------------------------------------------------------
; DATOS partitura_A557: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (9 bytes)
;   0xa557..0xa560  (9 bytes)
DATA_partitura_A557:
	defb 0a0h,0a0h,070h,0a0h,0a0h,0a0h,0a0h,0a0h,070h	; a557  ..p.....p

; ----------------------------------------------------------------------
; DATOS partitura_A560: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xa560..0xa562  (2 bytes)
DATA_partitura_A560:
	defb 0a0h,070h	; a560

; ----------------------------------------------------------------------
; DATOS partitura_A562: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (10 bytes)
;   0xa562..0xa56c  (10 bytes)
DATA_partitura_A562:
	defb 0a0h,070h,071h,070h,070h,070h,070h,070h,0f9h,002h	; a562  .pqppppp..

; ----------------------------------------------------------------------
; DATOS partitura_A56C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xa56c..0xa573  (7 bytes)
DATA_partitura_A56C:
	defb 0aah,0f9h,002h,0aah,0fdh,0f8h,0a4h	; a56c

; ----------------------------------------------------------------------
; DATOS partitura_A573: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xa573..0xa57a  (7 bytes)
DATA_partitura_A573:
	defb 0feh,001h,0e9h,006h,0ech,0eah,00bh	; a573

; ----------------------------------------------------------------------
; DATOS partitura_A57A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xa57a..0xa580  (6 bytes)
DATA_partitura_A57A:
	defb 0ebh,00ah,01bh,051h,0dbh,002h	; a57a

; ----------------------------------------------------------------------
; DATOS partitura_A580: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (19 bytes)
;   0xa580..0xa593  (19 bytes)
DATA_partitura_A580:
	defb 0d4h,090h,090h,0feh,001h,0e9h,006h,0ech,0eah,00bh,0ebh,00ah,01bh,051h,0dbh,002h	; a580  .............Q..
	defb 0f9h,02dh,0aah	; a590

; ----------------------------------------------------------------------
; DATOS partitura_A593: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa593..0xa59b  (8 bytes)
DATA_partitura_A593:
	defb 0feh,001h,0e9h,006h,0eah,00bh,0ebh,00ah	; a593  ........

; ----------------------------------------------------------------------
; DATOS partitura_A59B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (34 bytes)
;   0xa59b..0xa5bd  (34 bytes)
DATA_partitura_A59B:
	defb 01bh,041h,0dbh,002h,0f9h,082h,0aah,0feh,001h,0e9h,006h,0eah,00bh,0ebh,00ah,01bh	; a59b  .A..............
	defb 051h,0dbh,002h,0f9h,0d6h,0aah,0feh,001h,0e9h,006h,0eah,00bh,0ebh,00ah,01bh,051h	; a5ab  Q..............Q
	defb 0dbh,002h	; a5bb

; ----------------------------------------------------------------------
; DATOS partitura_A5BD: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xa5bd..0xa5c3  (6 bytes)
DATA_partitura_A5BD:
	defb 0f9h,009h,0abh,0fdh,083h,0a5h	; a5bd

; ----------------------------------------------------------------------
; DATOS partitura_A5C3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (20 bytes)
;   0xa5c3..0xa5d7  (20 bytes)
DATA_partitura_A5C3:
	defb 0feh,001h,0e9h,006h,0f6h,0f8h,002h,0eah,00bh,0ebh,009h,037h,005h,0d6h,010h,001h	; a5c3  ...........7....
	defb 0f0h,002h,043h,0d1h	; a5d3

; ----------------------------------------------------------------------
; DATOS partitura_A5D7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (16 bytes)
;   0xa5d7..0xa5e7  (16 bytes)
DATA_partitura_A5D7:
	defb 090h,090h,0feh,001h,0e9h,006h,0f6h,0d8h,0f8h,054h,0eah,006h,0ebh,00ah,02bh,003h	; a5d7  .........T....+.

; ----------------------------------------------------------------------
; DATOS partitura_A5E7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (37 bytes)
;   0xa5e7..0xa60c  (37 bytes)
DATA_partitura_A5E7:
	defb 0f5h,0d1h,090h,070h,060h,0fbh,004h,090h,020h,070h,000h,0f5h,090h,070h,060h,0fbh	; a5e7  ...p`... p...p`.
	defb 004h,090h,020h,070h,000h,0f8h,002h,0eah,00ah,0ebh,009h,037h,005h,0d6h,010h,001h	; a5f7  .. p.......7....
	defb 090h,090h,0d8h,0f0h,000h	; a607

; ----------------------------------------------------------------------
; DATOS partitura_A60C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xa60c..0xa617  (11 bytes)
DATA_partitura_A60C:
	defb 0f8h,054h,0eah,006h,0ebh,00ah,02bh,003h,0f5h,0d1h,090h	; a60c  .T....+....

; ----------------------------------------------------------------------
; DATOS partitura_A617: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xa617..0xa630  (25 bytes)
DATA_partitura_A617:
	defb 070h,060h,0fbh,004h,090h,020h,070h,000h,0f5h,090h,070h,060h,0fbh,004h,0f8h,002h	; a617  p`... p...p`....
	defb 0ebh,009h,03bh,091h,0d6h,010h,001h,0f0h,002h	; a627  .........

; ----------------------------------------------------------------------
; DATOS partitura_A630: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (36 bytes)
;   0xa630..0xa654  (36 bytes)
DATA_partitura_A630:
	defb 043h,0d2h,060h,060h,071h,0feh,001h,0e9h,006h,0f6h,0f8h,002h,0eah,00ah,0ebh,009h	; a630  C.``q...........
	defb 037h,005h,0d6h,010h,001h,0d1h,0b0h,0b0h,0d8h,0f8h,054h,0eah,006h,0ebh,00ah,02bh	; a640  7.........T....+
	defb 003h,0f5h,0d1h,0b0h	; a650

; ----------------------------------------------------------------------
; DATOS partitura_A654: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (41 bytes)
;   0xa654..0xa67d  (41 bytes)
DATA_partitura_A654:
	defb 090h,080h,0fbh,004h,0b0h,040h,090h,020h,0f5h,0b0h,090h,080h,0fbh,004h,0b0h,040h	; a654  .....@. .......@
	defb 090h,020h,0f8h,002h,0eah,00ah,0ebh,009h,037h,005h,0d6h,010h,001h,0b0h,0b0h,0d8h	; a664  . ......7.......
	defb 0f0h,000h,0f8h,054h,0eah,006h,0ebh,00ah,02bh	; a674  ...T....+

; ----------------------------------------------------------------------
; DATOS partitura_A67D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (16 bytes)
;   0xa67d..0xa68d  (16 bytes)
DATA_partitura_A67D:
	defb 003h,0f5h,0d1h,0b0h,090h,080h,0fbh,004h,0b0h,040h,090h,020h,0f5h,0b0h,090h,080h	; a67d  .........@. ....

; ----------------------------------------------------------------------
; DATOS partitura_A68D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (52 bytes)
;   0xa68d..0xa6c1  (52 bytes)
DATA_partitura_A68D:
	defb 0fbh,002h,0b0h,090h,0b0h,090h,0d2h,090h,0d1h,080h,0d2h,080h,0d1h,070h,060h,050h	; a68d  .............p`P
	defb 0feh,001h,0e9h,006h,0f6h,0d8h,0f8h,054h,0eah,006h,0ebh,00ah,02bh,003h,0f5h,0d1h	; a69d  .......T....+...
	defb 090h,0d2h,090h,0d1h,070h,0d2h,090h,0fbh,010h,0feh,001h,0e9h,006h,0f6h,0d8h,0f8h	; a6ad  ....p...........
	defb 054h,0eah,006h,0ebh	; a6bd

; ----------------------------------------------------------------------
; DATOS partitura_A6C1: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xa6c1..0xa6d2  (17 bytes)
DATA_partitura_A6C1:
	defb 00ah,02bh,003h,0f5h,0d1h,0b0h,0d2h,0b0h,0d1h,090h,0d2h,0b0h,0fbh,010h,0fdh,0d9h	; a6c1  .+..............
	defb 0a5h	; a6d1

; ----------------------------------------------------------------------
; DATOS partitura_A6D2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (38 bytes)
;   0xa6d2..0xa6f8  (38 bytes)
DATA_partitura_A6D2:
	defb 0feh,001h,0e9h,006h,0f4h,042h,042h,00dh,00dh,0eah,00fh,0ebh,00ah,02bh,021h,0dbh	; a6d2  .....BB......+!.
	defb 002h,0d4h,090h,090h,0feh,001h,0e9h,006h,0f4h,042h,042h,04bh,04bh,0eah,00eh,0ebh	; a6e2  .........BBKK...
	defb 00ah,02bh,021h,0dbh,002h,0f9h	; a6f2

; ----------------------------------------------------------------------
; DATOS partitura_A6F8: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xa6f8..0xa6ff  (7 bytes)
DATA_partitura_A6F8:
	defb 02dh,0aah,0feh,001h,0e9h,006h,0f4h	; a6f8

; ----------------------------------------------------------------------
; DATOS partitura_A6FF: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (24 bytes)
;   0xa6ff..0xa717  (24 bytes)
DATA_partitura_A6FF:
	defb 042h,042h,04bh,04bh,0eah,00eh,0ebh,00ah,02bh,021h,0dbh,002h,0f9h,082h,0aah,0feh	; a6ff  BBKK....+!......
	defb 001h,0e9h,006h,0f4h,042h,042h,04bh,04bh	; a70f  ....BBKK

; ----------------------------------------------------------------------
; DATOS partitura_A717: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (34 bytes)
;   0xa717..0xa739  (34 bytes)
DATA_partitura_A717:
	defb 0eah,00eh,0ebh,00ah,02bh,021h,0dbh,002h,0f9h,0d6h,0aah,0feh,001h,0e9h,006h,0f4h	; a717  ....+!..........
	defb 042h,042h,04bh,04bh,0eah,00eh,0ebh,00ah,02bh,021h,0dbh,002h,0f9h,009h,0abh,0fdh	; a727  BBKK....+!......
	defb 0e6h,0a6h	; a737

; ----------------------------------------------------------------------
; DATOS partitura_A739: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (15 bytes)
;   0xa739..0xa748  (15 bytes)
DATA_partitura_A739:
	defb 0feh,001h,0e9h,006h,0f8h,002h,0eah,00bh,0ebh,009h,037h,005h,0d6h,010h,001h	; a739  ..........7....

; ----------------------------------------------------------------------
; DATOS partitura_A748: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (50 bytes)
;   0xa748..0xa77a  (50 bytes)
DATA_partitura_A748:
	defb 0f0h,002h,078h,0d1h,070h,070h,0feh,001h,0e9h,006h,0f8h,002h,0d6h,010h,001h,0f0h	; a748  ..x.pp..........
	defb 002h,078h,0eah,009h,0ebh,009h,03bh,091h,0dbh,003h,0d2h,070h,060h,020h,04ch,070h	; a758  .x.........p` Lp
	defb 060h,020h,040h,0c0h,040h,0c0h,040h,0d1h,090h,040h,0d2h,090h,0d1h,070h,020h,0d2h	; a768  ` @.@.@..@...p .
	defb 070h,0d1h	; a778

; ----------------------------------------------------------------------
; DATOS partitura_A77A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (31 bytes)
;   0xa77a..0xa799  (31 bytes)
DATA_partitura_A77A:
	defb 060h,010h,0eah,00bh,0ebh,009h,037h,005h,070h,070h,0eah,009h,0ebh,009h,03bh,091h	; a77a  `.....7.pp......
	defb 0dbh,003h,0d2h,070h,060h,020h,04ch,0d1h,070h,060h,020h,040h,0c0h,040h,0c0h	; a78a  ...p` L.p` @.@.

; ----------------------------------------------------------------------
; DATOS partitura_A799: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xa799..0xa79b  (2 bytes)
DATA_partitura_A799:
	defb 040h,090h	; a799

; ----------------------------------------------------------------------
; DATOS partitura_A79B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (134 bytes)
;   0xa79b..0xa821  (134 bytes)
DATA_partitura_A79B:
	defb 070h,060h,041h,060h,070h,090h,0feh,001h,0e9h,006h,0f8h,002h,0d6h,010h,001h,0f0h	; a79b  p`A`p...........
	defb 002h,078h,0eah,00bh,0ebh,009h,037h,005h,0d6h,010h,001h,0d1h,090h,090h,0eah,009h	; a7ab  .x....7.........
	defb 0ebh,009h,03bh,091h,0dbh,003h,0d2h,090h,080h,040h,06ch,090h,080h,040h,060h,0c0h	; a7bb  .........@l..@`.
	defb 060h,0c0h,060h,0d1h,0b0h,060h,0d2h,0b0h,0d1h,090h,040h,0d2h,090h,0d1h,080h,030h	; a7cb  `.`..`....@....0
	defb 0eah,00bh,0ebh,009h,037h,005h,090h,090h,0eah,009h,0ebh,009h,03bh,091h,0dbh,003h	; a7db  ....7...........
	defb 0d1h,090h,080h,040h,06ch,0d2h,090h,080h,040h,060h,0c0h,060h,0c0h,060h,0b0h,090h	; a7eb  ...@l...@`.`.`..
	defb 0c0h,080h,0c0h,070h,060h,050h,0feh,001h,0e9h,006h,0f8h,002h,0d6h,010h,001h,0f0h	; a7fb  ...p`P..........
	defb 002h,078h,0eah,009h,0ebh,009h,03bh,091h,0dbh,003h,0f5h,0d2h,090h,0d3h,090h,0b0h	; a80b  .x..............
	defb 0d2h,001h,031h,060h,0fbh,002h	; a81b

; ----------------------------------------------------------------------
; DATOS partitura_A821: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (15 bytes)
;   0xa821..0xa830  (15 bytes)
DATA_partitura_A821:
	defb 0d1h,007h,0eah,008h,0d0h,000h,0d1h,070h,0a0h,050h,0d2h,0a0h,0d1h,090h,040h	; a821  .......p.P....@

; ----------------------------------------------------------------------
; DATOS partitura_A830: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (21 bytes)
;   0xa830..0xa845  (21 bytes)
DATA_partitura_A830:
	defb 0d2h,090h,0eah,009h,0f5h,0d2h,090h,0d3h,090h,0b0h,0d2h,001h,031h,060h,0fbh,002h	; a830  ............1`..
	defb 0d1h,067h,0eah,008h,0a0h	; a840

; ----------------------------------------------------------------------
; DATOS partitura_A845: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (22 bytes)
;   0xa845..0xa85b  (22 bytes)
DATA_partitura_A845:
	defb 0d2h,0a0h,0d0h,000h,0d1h,000h,0d0h,010h,0d1h,010h,0d0h,030h,0d1h,030h,0feh,001h	; a845  ...........0.0..
	defb 0e9h,006h,0f8h,002h,0d6h,010h	; a855

; ----------------------------------------------------------------------
; DATOS partitura_A85B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (21 bytes)
;   0xa85b..0xa870  (21 bytes)
DATA_partitura_A85B:
	defb 001h,0f0h,002h,078h,0eah,009h,0ebh,009h,03bh,091h,0dbh,003h,0f5h,0d2h,0b0h,0d3h	; a85b  ...x............
	defb 0b0h,0d2h,010h,021h,051h	; a86b

; ----------------------------------------------------------------------
; DATOS partitura_A870: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (22 bytes)
;   0xa870..0xa886  (22 bytes)
DATA_partitura_A870:
	defb 080h,0fbh,002h,0d1h,027h,0eah,008h,0d0h,020h,0d1h,080h,0d0h,000h,0d1h,070h,000h	; a870  ....'... .....p.
	defb 0b0h,060h,0d2h,0b0h,0eah,009h	; a880

; ----------------------------------------------------------------------
; DATOS partitura_A886: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (19 bytes)
;   0xa886..0xa899  (19 bytes)
DATA_partitura_A886:
	defb 0f5h,0d2h,0b0h,0d3h,0b0h,0d2h,010h,021h,051h,080h,0fbh,002h,0d1h,087h,093h,0a3h	; a886  .......!Q.......
	defb 0fdh,04eh,0a7h	; a896

; ----------------------------------------------------------------------
; DATOS partitura_A899: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xa899..0xa89c  (3 bytes)
DATA_partitura_A899:
	defb 0feh,001h,0e9h	; a899

; ----------------------------------------------------------------------
; DATOS partitura_A89C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (26 bytes)
;   0xa89c..0xa8b6  (26 bytes)
DATA_partitura_A89C:
	defb 006h,0eeh,081h,0f8h,002h,0eah,00bh,0ebh,009h,037h,005h,0d6h,010h,001h,0f0h,002h	; a89c  .........7......
	defb 066h,0d1h,030h,030h,0feh,001h,0e9h,006h,0eeh,081h	; a8ac  f.00......

; ----------------------------------------------------------------------
; DATOS partitura_A8B6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xa8b6..0xa8b8  (2 bytes)
DATA_partitura_A8B6:
	defb 0f8h,002h	; a8b6

; ----------------------------------------------------------------------
; DATOS partitura_A8B8: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (19 bytes)
;   0xa8b8..0xa8cb  (19 bytes)
DATA_partitura_A8B8:
	defb 0d6h,010h,001h,0f0h,002h,066h,0c0h,0eah,005h,0ebh,009h,01bh,091h,0dbh,002h,0d2h	; a8b8  .....f..........
	defb 070h,060h,020h	; a8c8

; ----------------------------------------------------------------------
; DATOS partitura_A8CB: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xa8cb..0xa8d6  (11 bytes)
DATA_partitura_A8CB:
	defb 04ch,070h,060h,020h,040h,0c0h,040h,0c0h,040h,0d1h,090h	; a8cb  Lp` @.@.@..

; ----------------------------------------------------------------------
; DATOS partitura_A8D6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xa8d6..0xa8d9  (3 bytes)
DATA_partitura_A8D6:
	defb 040h,0d2h,090h	; a8d6

; ----------------------------------------------------------------------
; DATOS partitura_A8D9: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (29 bytes)
;   0xa8d9..0xa8f6  (29 bytes)
DATA_partitura_A8D9:
	defb 0d1h,070h,020h,0d2h,070h,0d1h,060h,0eah,00bh,0ebh,009h,037h,005h,030h,030h,0eah	; a8d9  .p .p.`....7.00.
	defb 005h,0ebh,009h,01bh,091h,0dbh,003h,0c0h,0d2h,070h,060h,020h,04ch	; a8e9  .........p` L

; ----------------------------------------------------------------------
; DATOS partitura_A8F6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (36 bytes)
;   0xa8f6..0xa91a  (36 bytes)
DATA_partitura_A8F6:
	defb 0d1h,070h,060h,020h,040h,0c0h,040h,0c0h,040h,090h,070h,060h,040h,0eah,009h,0ebh	; a8f6  .p` @.@.@.p`@...
	defb 009h,03bh,0d2h,010h,020h,040h,0feh,001h,0e9h,006h,0eeh,081h,0f8h,002h,0d6h,010h	; a906  .... @..........
	defb 001h,0f0h,002h,066h	; a916

; ----------------------------------------------------------------------
; DATOS partitura_A91A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (29 bytes)
;   0xa91a..0xa937  (29 bytes)
DATA_partitura_A91A:
	defb 0eah,00bh,0ebh,009h,03bh,005h,0d6h,010h,001h,0d1h,050h,050h,0c0h,0eah,005h,0ebh	; a91a  ..........PP....
	defb 009h,01bh,091h,0dbh,002h,0d2h,090h,080h,040h,06ch,090h,080h,040h	; a92a  ........@l..@

; ----------------------------------------------------------------------
; DATOS partitura_A937: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xa937..0xa942  (11 bytes)
DATA_partitura_A937:
	defb 060h,0c0h,060h,0c0h,060h,0d1h,0b0h,060h,0d2h,0b0h,0d1h	; a937  `.`.`..`...

; ----------------------------------------------------------------------
; DATOS partitura_A942: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (16 bytes)
;   0xa942..0xa952  (16 bytes)
DATA_partitura_A942:
	defb 090h,040h,0d2h,090h,0d1h,080h,0eah,00bh,0ebh,009h,037h,005h,050h,050h,0eah,005h	; a942  .@........7.PP..

; ----------------------------------------------------------------------
; DATOS partitura_A952: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (37 bytes)
;   0xa952..0xa977  (37 bytes)
DATA_partitura_A952:
	defb 0ebh,009h,01bh,091h,0dbh,003h,0c0h,0d1h,090h,080h,040h,06ch,0d2h,090h,080h,040h	; a952  ..........@l...@
	defb 060h,0c0h,060h,0c0h,060h,0b0h,090h,0c0h,080h,0c0h,070h,060h,050h,0feh,001h,0e9h	; a962  `.`.`.....p`P...
	defb 006h,0efh,0eeh,081h,0f8h	; a972

; ----------------------------------------------------------------------
; DATOS partitura_A977: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa977..0xa978  (1 bytes)
DATA_partitura_A977:
	defb 002h	; a977

; ----------------------------------------------------------------------
; DATOS partitura_A978: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (37 bytes)
;   0xa978..0xa99d  (37 bytes)
DATA_partitura_A978:
	defb 0d6h,010h,001h,0f0h,002h,078h,0eah,006h,0ebh,009h,01bh,091h,0dbh,003h,0f5h,0d2h	; a978  .....x..........
	defb 090h,0d3h,090h,0b0h,0d2h,001h,031h,060h,0fbh,002h,0d1h,007h,0d0h,000h,0d1h,070h	; a988  ......1`.......p
	defb 0a0h,050h,0d2h,0a0h,0d1h	; a998

; ----------------------------------------------------------------------
; DATOS partitura_A99D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (79 bytes)
;   0xa99d..0xa9ec  (79 bytes)
DATA_partitura_A99D:
	defb 090h,040h,0d2h,090h,0f5h,0d2h,090h,0d3h,090h,0b0h,0d2h,001h,031h,060h,0fbh,002h	; a99d  .@..........1`..
	defb 0d1h,067h,0a0h,0d2h,0a0h,0d0h,000h,0d1h,000h,0d0h,010h,0d1h,010h,0d0h,030h,0feh	; a9ad  .g............0.
	defb 001h,0e9h,006h,0efh,0c0h,0eeh,081h,0f8h,002h,0d6h,010h,001h,0f0h,002h,078h,0eah	; a9bd  ..............x.
	defb 006h,0ebh,009h,01bh,091h,0dbh,003h,0f5h,0d2h,0b0h,0d3h,0b0h,0d2h,010h,021h,051h	; a9cd  ..............!Q
	defb 080h,0fbh,002h,0d1h,027h,0d0h,020h,0d1h,080h,0d0h,000h,0d1h,070h,000h,0b0h	; a9dd  ....'. .....p..

; ----------------------------------------------------------------------
; DATOS partitura_A9EC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa9ec..0xa9ed  (1 bytes)
DATA_partitura_A9EC:
	defb 060h	; a9ec

; ----------------------------------------------------------------------
; DATOS partitura_A9ED: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (10 bytes)
;   0xa9ed..0xa9f7  (10 bytes)
DATA_partitura_A9ED:
	defb 0d2h,0b0h,0f5h,0d2h,0b0h,0d3h,0b0h,0d2h,010h,021h	; a9ed  .........!

; ----------------------------------------------------------------------
; DATOS partitura_A9F7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xa9f7..0xa9fe  (7 bytes)
DATA_partitura_A9F7:
	defb 051h,080h,0fbh,002h,0d1h,087h,093h	; a9f7

; ----------------------------------------------------------------------
; DATOS partitura_A9FE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (59 bytes)
;   0xa9fe..0xaa39  (59 bytes)
DATA_partitura_A9FE:
	defb 0a2h,0fdh,0b0h,0a8h,0d0h,0f5h,0a0h,0a0h,070h,0a1h,0a0h,070h,0a0h,0fbh,003h,0e9h	; a9fe  ........p..p....
	defb 001h,072h,072h,0e9h,006h,0a0h,070h,0a0h,0a0h,070h,0a0h,0a0h,0f5h,0a0h,0a0h,070h	; aa0e  .rr...p..p.....p
	defb 0a1h,0a0h,070h,0a0h,0fbh,003h,070h,070h,070h,070h,070h,070h,070h,070h,0fah,0d5h	; aa1e  ..p...pppppppp..
	defb 090h,0d4h,001h,0d5h,090h,0d4h,001h,0d5h,090h,0d4h,041h	; aa2e  ..........A

; ----------------------------------------------------------------------
; DATOS partitura_AA39: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (5 bytes)
;   0xaa39..0xaa3e  (5 bytes)
DATA_partitura_AA39:
	defb 0d5h,090h,0d4h,031h,021h	; aa39

; ----------------------------------------------------------------------
; DATOS partitura_AA3E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xaa3e..0xaa42  (4 bytes)
DATA_partitura_AA3E:
	defb 001h,0d5h,090h,0d4h	; aa3e

; ----------------------------------------------------------------------
; DATOS partitura_AA42: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (79 bytes)
;   0xaa42..0xaa91  (79 bytes)
DATA_partitura_AA42:
	defb 001h,0d5h,090h,0d4h,021h,0d5h,090h,0d4h,030h,090h,0d5h,090h,090h,0d4h,070h,0d5h	; aa42  ....!...0.....p.
	defb 070h,070h,0d4h,060h,0d5h,060h,0d4h,090h,090h,0d5h,090h,0d4h,001h,0d5h,090h,0d4h	; aa52  pp.`.`..........
	defb 021h,0d5h,090h,0d4h,041h,0d5h,090h,0d4h,031h,021h,001h,0d5h,090h,0d4h,001h,0d5h	; aa62  !...A...1!......
	defb 090h,0d4h,021h,0d5h,090h,0d4h,030h,090h,070h,060h,041h,0d5h,060h,070h,090h,0fah	; aa72  ..!...0.p`A.`p..
	defb 0d4h,0b0h,0b0h,0d5h,0b0h,0d4h,021h,0d5h,0b0h,0d4h,021h,0d5h,0b0h,0d4h,061h	; aa82  ......!...!...a

; ----------------------------------------------------------------------
; DATOS partitura_AA91: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (75 bytes)
;   0xaa91..0xaadc  (75 bytes)
DATA_partitura_AA91:
	defb 0d5h,0b0h,0d4h,051h,041h,021h,0d5h,0b0h,0d4h,021h,0d5h,0b0h,0d4h,041h,0d5h,0b0h	; aa91  ...QA!...!...A..
	defb 0d4h,050h,0b0h,0d5h,0b0h,0b0h,0d4h,090h,0d5h,090h,090h,0d4h,080h,0d5h,080h,0d4h	; aaa1  .P..............
	defb 0b0h,0b0h,0d5h,0b0h,0d4h,021h,0d5h,0b0h,0d4h,041h,0d5h,0b0h,0d4h,061h,0d5h,0b0h	; aab1  .....!...A...a..
	defb 0d4h,051h,041h,021h,090h,080h,040h,060h,0c0h,060h,0c0h,060h,0b0h,090h,0c0h,080h	; aac1  .QA!..@`.`.`....
	defb 0c0h,070h,060h,050h,0fah,0f5h,0d4h,090h,0d5h,090h,0b0h	; aad1  .p`P.......

; ----------------------------------------------------------------------
; DATOS partitura_AADC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xaadc..0xaae4  (8 bytes)
DATA_partitura_AADC:
	defb 0d4h,001h,031h,060h,0fbh,003h,090h,040h	; aadc  ..1`...@

; ----------------------------------------------------------------------
; DATOS partitura_AAE4: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xaae4..0xaaec  (8 bytes)
DATA_partitura_AAE4:
	defb 070h,020h,0d5h,090h,0d4h,060h,010h,0d5h	; aae4  p ...`..

; ----------------------------------------------------------------------
; DATOS partitura_AAEC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (75 bytes)
;   0xaaec..0xab37  (75 bytes)
DATA_partitura_AAEC:
	defb 060h,0f5h,0d4h,090h,0d5h,090h,0b0h,0d4h,001h,031h,060h,0fbh,003h,040h,0d5h,040h	; aaec  `........1`..@.@
	defb 0d4h,060h,0d5h,060h,0d4h,070h,0d5h,070h,0d4h,090h,0d5h,090h,0fah,0f5h,0d4h,0b0h	; aafc  .`.`.p.p........
	defb 0d5h,0b0h,0d4h,010h,021h,051h,080h,0fbh,003h,0b0h,060h,090h,040h,0d5h,0b0h,0d4h	; ab0c  ....!Q....`.@...
	defb 080h,030h,0d5h,080h,0f5h,0d4h,0b0h,0d5h,0b0h,0d4h,010h,021h,051h,080h,0fbh,003h	; ab1c  .0.........!Q...
	defb 060h,0d5h,060h,0d4h,080h,0d5h,080h,0d4h,090h,0d5h,090h	; ab2c  `.`........

; ----------------------------------------------------------------------
; DATOS partitura_AB37: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xab37..0xab3b  (4 bytes)
DATA_partitura_AB37:
	defb 0d4h,0b0h,0d5h,0b0h	; ab37

; ----------------------------------------------------------------------
; DATOS partitura_AB3B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x79 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xab3b..0xab3c  (1 bytes)
DATA_partitura_AB3B:
	defb 0fah	; ab3b

; ----------------------------------------------------------------------
; DATOS partitura_AB3C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xab3c..0xab3f  (3 bytes)
DATA_partitura_AB3C:
	defb 0feh,004h,0d1h	; ab3c

; ----------------------------------------------------------------------
; DATOS partitura_AB3F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xab3f..0xab43  (4 bytes)
DATA_partitura_AB3F:
	defb 0e9h,006h,0f5h,060h	; ab3f

; ----------------------------------------------------------------------
; DATOS partitura_AB43: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xab43..0xab47  (4 bytes)
DATA_partitura_AB43:
	defb 060h,070h,070h,080h	; ab43

; ----------------------------------------------------------------------
; DATOS partitura_AB47: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xab47..0xab4b  (4 bytes)
DATA_partitura_AB47:
	defb 080h,091h,060h,060h	; ab47

; ----------------------------------------------------------------------
; DATOS partitura_AB4B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xab4b..0xab4f  (4 bytes)
DATA_partitura_AB4B:
	defb 070h,070h,080h,080h	; ab4b

; ----------------------------------------------------------------------
; DATOS partitura_AB4F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (33 bytes)
;   0xab4f..0xab70  (33 bytes)
DATA_partitura_AB4F:
	defb 091h,0fbh,00dh,0e9h,006h,0d0h,0f5h,061h,0b1h,0a1h,0fbh,00ah,061h,0d0h,0b1h,0d0h	; ab4f  .......a....a...
	defb 0e9h,006h,0f5h,061h,0b1h,0a1h,0fbh,008h,0d1h,060h,060h,060h,060h,070h,070h,070h	; ab5f  ...a.....````ppp
	defb 070h	; ab6f

; ----------------------------------------------------------------------
; DATOS partitura_AB70: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (5 bytes)
;   0xab70..0xab75  (5 bytes)
DATA_partitura_AB70:
	defb 080h,080h,080h,080h,090h	; ab70

; ----------------------------------------------------------------------
; DATOS partitura_AB75: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xab75..0xab7c  (7 bytes)
DATA_partitura_AB75:
	defb 090h,090h,090h,0d0h,0e9h,006h,003h	; ab75

; ----------------------------------------------------------------------
; DATOS partitura_AB7C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (59 bytes)
;   0xab7c..0xabb7  (59 bytes)
DATA_partitura_AB7C:
	defb 0b0h,0a0h,0a0h,0a0h,0b9h,0d1h,000h,000h,000h,000h,001h,001h,000h,001h,000h,001h	; ab7c  ................
	defb 0d0h,003h,0b0h,0a0h,0a0h,0a0h,0b9h,0d1h,000h,000h,000h,000h,001h,001h,000h,000h	; ab8c  ................
	defb 000h,000h,000h,000h,0d1h,0e9h,006h,0f5h,090h,060h,070h,080h,091h,080h,080h,091h	; ab9c  .........`p.....
	defb 060h,070h,080h,090h,090h,090h,0fbh,008h,0fdh,03ch,0abh	; abac  `p.......<.

; ----------------------------------------------------------------------
; DATOS partitura_ABB7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (44 bytes)
;   0xabb7..0xabe3  (44 bytes)
DATA_partitura_ABB7:
	defb 0feh,001h,0e9h,006h,0eah,00bh,0ebh,009h,027h,0b1h,0d9h,0d6h,020h,002h,0f0h,007h	; abb7  ........'... ...
	defb 055h,0d4h,071h,081h,0c3h,05bh,073h,083h,0a5h,081h,071h,051h,071h,051h,031h,0e9h	; abc7  U.q..[s...qQqQ1.
	defb 00ch,02ch,0e9h,006h,007h,0d5h,0bbh,0d4h,003h,02fh,037h,0b7h	; abd7  .,......./7.

; ----------------------------------------------------------------------
; DATOS partitura_ABE3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (44 bytes)
;   0xabe3..0xac0f  (44 bytes)
DATA_partitura_ABE3:
	defb 0d3h,027h,03bh,0c2h,000h,0d4h,0e9h,00ch,089h,0e9h,006h,073h,061h,091h,0c1h,0d3h	; abe3  .'.........sa...
	defb 001h,021h,031h,061h,091h,0d2h,031h,021h,0d3h,067h,093h,0e9h,006h,0eah,00ah,0ebh	; abf3  .!1a..1!.g......
	defb 019h,02ah,002h,0d6h,010h,001h,0d2h,0f5h,0a5h,0a5h,0a5h,095h	; ac03  .*..........

; ----------------------------------------------------------------------
; DATOS partitura_AC0F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xac0f..0xac11  (2 bytes)
DATA_partitura_AC0F:
	defb 095h,095h	; ac0f

; ----------------------------------------------------------------------
; DATOS partitura_AC11: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (49 bytes)
;   0xac11..0xac42  (49 bytes)
DATA_partitura_AC11:
	defb 075h,075h,055h,055h,053h,0fbh,002h,0e9h,00ch,0eah,00dh,0ebh,009h,027h,0b1h,0dbh	; ac11  uuUUS........'..
	defb 002h,0d6h,010h,003h,0f0h,007h,03fh,0d4h,05fh,05fh,0dch,0d8h,0e9h,006h,0eah,00ah	; ac21  ......?.__......
	defb 0ebh,009h,017h,003h,0d6h,010h,002h,0f0h,007h,004h,0d4h,070h,070h,070h,070h,071h	; ac31  ...........ppppq
	defb 070h	; ac41

; ----------------------------------------------------------------------
; DATOS partitura_AC42: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xac42..0xac46  (4 bytes)
DATA_partitura_AC42:
	defb 070h,071h,070h,070h	; ac42

; ----------------------------------------------------------------------
; DATOS partitura_AC46: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xac46..0xac4e  (8 bytes)
DATA_partitura_AC46:
	defb 070h,070h,070h,070h,080h,080h,080h,080h	; ac46  pppp....

; ----------------------------------------------------------------------
; DATOS partitura_AC4E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (39 bytes)
;   0xac4e..0xac75  (39 bytes)
DATA_partitura_AC4E:
	defb 081h,080h,080h,0d3h,031h,030h,030h,030h,030h,030h,030h,020h,020h,020h,020h,021h	; ac4e  ....1000000    !
	defb 020h,020h,021h,020h,020h,020h,020h,020h,020h,030h,030h,030h,030h,031h,030h,030h	; ac5e    !      0000100
	defb 0d4h,0b1h,0b0h,0b0h,0b0h,0b0h,0b0h	; ac6e

; ----------------------------------------------------------------------
; DATOS partitura_AC75: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (9 bytes)
;   0xac75..0xac7e  (9 bytes)
DATA_partitura_AC75:
	defb 0b0h,0e9h,006h,0eah,00ch,0ebh,009h,027h,051h	; ac75  .......'Q

; ----------------------------------------------------------------------
; DATOS partitura_AC7E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (36 bytes)
;   0xac7e..0xaca2  (36 bytes)
DATA_partitura_AC7E:
	defb 0d6h,010h,002h,0f0h,005h,072h,0d5h,073h,083h,0d4h,033h,023h,053h,073h,033h,0d3h	; ac7e  .....r.s..3#Ss3.
	defb 003h,0d4h,0b3h,073h,0d3h,033h,023h,0e9h,001h,0bfh,05fh,03fh,02fh,08fh,07fh,0d8h	; ac8e  ...s.3#..._?/...
	defb 0dch,0fdh,0b7h,0abh	; ac9e

; ----------------------------------------------------------------------
; DATOS partitura_ACA2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (12 bytes)
;   0xaca2..0xacae  (12 bytes)
DATA_partitura_ACA2:
	defb 0feh,001h,0f6h,0f8h,002h,0e9h,006h,0eah,008h,0ebh,009h,037h	; aca2  ...........7

; ----------------------------------------------------------------------
; DATOS partitura_ACAE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (65 bytes)
;   0xacae..0xacef  (65 bytes)
DATA_partitura_ACAE:
	defb 021h,0d6h,005h,001h,0f5h,0d2h,080h,070h,080h,070h,050h,030h,050h,030h,0fbh,016h	; acae  !......p.pP0P0..
	defb 0f5h,0b0h,080h,0b0h,080h,070h,050h,070h,050h,0b0h,080h,0b0h,080h,070h,050h,070h	; acbe  .....pPpP....pPp
	defb 050h,0fbh,002h,0f1h,014h,002h,001h,007h,0e9h,006h,0f0h,007h,03fh,0eah,00fh,0ebh	; acce  P...........?...
	defb 009h,037h,0b1h,0d6h,010h,001h,0f0h,005h,072h,0f5h,0d4h,08fh,02fh,03fh,0d5h,0bfh	; acde  .7......r.../?..
	defb 0fbh	; acee

; ----------------------------------------------------------------------
; DATOS partitura_ACEF: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (61 bytes)
;   0xacef..0xad2c  (61 bytes)
DATA_partitura_ACEF:
	defb 002h,0f1h,00ah,025h,001h,005h,0e9h,006h,0eah,00eh,0ebh,009h,037h,0b1h,0d6h,010h	; acef  ...%........7...
	defb 001h,0f0h,007h,033h,0d4h,053h,0d3h,053h,0d2h,009h,0f6h,0f8h,002h,0eah,00bh,0ebh	; acff  ...3.S.S........
	defb 01ah,037h,002h,0d2h,050h,050h,050h,050h,051h,051h,050h,051h,050h,051h,0f1h,00ah	; ad0f  .7..PPPPQQPQPQ..
	defb 025h,001h,005h,0eah,00eh,0ebh,009h,037h,0b1h,0d4h,053h,0d3h,053h	; ad1f  %......7..S.S

; ----------------------------------------------------------------------
; DATOS partitura_AD2C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xad2c..0xad33  (7 bytes)
DATA_partitura_AD2C:
	defb 0d2h,029h,0f6h,0f8h,002h,0eah,00bh	; ad2c

; ----------------------------------------------------------------------
; DATOS partitura_AD33: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xad33..0xad37  (4 bytes)
DATA_partitura_AD33:
	defb 0ebh,01ah,037h,002h	; ad33

; ----------------------------------------------------------------------
; DATOS partitura_AD37: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (9 bytes)
;   0xad37..0xad40  (9 bytes)
DATA_partitura_AD37:
	defb 0d2h,070h,070h,070h,070h,071h,071h,070h,070h	; ad37  .ppppqqpp

; ----------------------------------------------------------------------
; DATOS partitura_AD40: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (10 bytes)
;   0xad40..0xad4a  (10 bytes)
DATA_partitura_AD40:
	defb 070h,070h,070h,070h,0d8h,0f1h,002h,026h,001h,010h	; ad40  pppp...&..

; ----------------------------------------------------------------------
; DATOS partitura_AD4A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (29 bytes)
;   0xad4a..0xad67  (29 bytes)
DATA_partitura_AD4A:
	defb 0e9h,006h,0eah,00bh,0ebh,009h,037h,0b1h,0d6h,010h,001h,0f0h,007h,065h,0d3h,07fh	; ad4a  ......7......e..
	defb 087h,0d2h,037h,02fh,037h,0d3h,0b7h,0d8h,0f6h,0f8h,00ah,0e9h,006h	; ad5a  ..7/7........

; ----------------------------------------------------------------------
; DATOS partitura_AD67: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (34 bytes)
;   0xad67..0xad89  (34 bytes)
DATA_partitura_AD67:
	defb 0eah,008h,0ebh,009h,037h,003h,0d6h,002h,001h,0f5h,0d2h,070h,080h,070h,050h,070h	; ad67  ....7......p.pPp
	defb 050h,071h,070h,080h,0b0h,080h,070h,050h,071h,0fbh,004h,0dch,0d8h,0f0h,000h,0fdh	; ad77  Pqp...pPq.......
	defb 0a2h,0ach	; ad87

; ----------------------------------------------------------------------
; DATOS partitura_AD89: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xad89..0xad8b  (2 bytes)
DATA_partitura_AD89:
	defb 0feh,001h	; ad89

; ----------------------------------------------------------------------
; DATOS partitura_AD8B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (28 bytes)
;   0xad8b..0xada7  (28 bytes)
DATA_partitura_AD8B:
	defb 0f8h,01dh,0e9h,00ch,0eah,009h,0ebh,009h,05bh,0f1h,0d8h,0f0h,007h,021h,0f5h,0d1h	; ad8b  ........[....!..
	defb 070h,07eh,0fbh,006h,070h,076h,0f8h,002h,0e9h,006h,0eah,007h	; ad9b  p~..pv......

; ----------------------------------------------------------------------
; DATOS partitura_ADA7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (23 bytes)
;   0xada7..0xadbe  (23 bytes)
DATA_partitura_ADA7:
	defb 0ebh,009h,037h,021h,0d6h,002h,001h,0f5h,0d1h,020h,0d2h,0b0h,0d1h,020h,0d2h,0b0h	; ada7  ..7!..... ... ..
	defb 080h,070h,050h,020h,0fbh,008h,0d8h	; adb7

; ----------------------------------------------------------------------
; DATOS partitura_ADBE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (9 bytes)
;   0xadbe..0xadc7  (9 bytes)
DATA_partitura_ADBE:
	defb 0f8h,002h,0e9h,006h,0eah,007h,0ebh,009h,037h	; adbe  ........7

; ----------------------------------------------------------------------
; DATOS partitura_ADC7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (22 bytes)
;   0xadc7..0xaddd  (22 bytes)
DATA_partitura_ADC7:
	defb 021h,0d6h,002h,001h,0f5h,0d1h,020h,0d2h,0b0h,0d1h,020h,0d2h,0b0h,080h,070h,050h	; adc7  !..... ... ...pP
	defb 020h,0fbh,004h,0d1h,030h,050h	; add7

; ----------------------------------------------------------------------
; DATOS partitura_ADDD: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xaddd..0xadde  (1 bytes)
DATA_partitura_ADDD:
	defb 030h	; addd

; ----------------------------------------------------------------------
; DATOS partitura_ADDE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (22 bytes)
;   0xadde..0xadf4  (22 bytes)
DATA_partitura_ADDE:
	defb 020h,030h,020h,000h,020h,000h,020h,000h,0d2h,0b0h,0d1h,000h,020h,030h,000h,0d2h	; adde   0 . . ..... 0..
	defb 0b0h,0d1h,000h,020h,000h,0d2h	; adee

; ----------------------------------------------------------------------
; DATOS partitura_ADF4: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xadf4..0xadfc  (8 bytes)
DATA_partitura_ADF4:
	defb 0b0h,0d1h,000h,0d2h,0b0h,080h,070h,0d3h	; adf4  ......p.

; ----------------------------------------------------------------------
; DATOS partitura_ADFC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (22 bytes)
;   0xadfc..0xae12  (22 bytes)
DATA_partitura_ADFC:
	defb 070h,0b0h,0d2h,020h,050h,070h,0b0h,0d1h,070h,0d8h,0f8h,002h,0e9h,006h,0f0h,007h	; adfc  p.. Pp..p.......
	defb 021h,0ebh,009h,037h,041h,0d6h	; ae0c

; ----------------------------------------------------------------------
; DATOS partitura_AE12: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xae12..0xae1d  (11 bytes)
DATA_partitura_AE12:
	defb 002h,001h,0eah,00fh,0d5h,053h,0eah,008h,0d3h,050h,070h	; ae12  .....S...Pp

; ----------------------------------------------------------------------
; DATOS partitura_AE1D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (22 bytes)
;   0xae1d..0xae33  (22 bytes)
DATA_partitura_AE1D:
	defb 080h,0a0h,0d2h,000h,020h,030h,050h,070h,0eeh,002h,080h,0efh,0a0h,0d1h,000h,023h	; ae1d  .... 0Pp.......#
	defb 0eah,00bh,0ebh,01ah,037h,002h	; ae2d

; ----------------------------------------------------------------------
; DATOS partitura_AE33: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (32 bytes)
;   0xae33..0xae53  (32 bytes)
DATA_partitura_AE33:
	defb 0d2h,020h,020h,021h,021h,020h,021h,020h,021h,0ebh,009h,037h,031h,0eah,00fh,0d5h	; ae33  .  !! ! !..71...
	defb 053h,0eah,00ah,0d3h,050h,070h,080h,0a0h,0d2h,000h,020h,030h,050h,070h,0eeh,002h	; ae43  S...Pp.... 0Pp..

; ----------------------------------------------------------------------
; DATOS partitura_AE53: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xae53..0xae54  (1 bytes)
DATA_partitura_AE53:
	defb 080h	; ae53

; ----------------------------------------------------------------------
; DATOS partitura_AE54: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (55 bytes)
;   0xae54..0xae8b  (55 bytes)
DATA_partitura_AE54:
	defb 0efh,0a0h,0d1h,000h,023h,0ebh,01ah,037h,002h,0eah,00bh,0d2h,020h,020h,021h,021h	; ae54  ....#..7....  !!
	defb 020h,020h,020h,020h,020h,020h,0d8h,0f2h,001h,0e9h,006h,0eah,00bh,0ebh,009h,037h	; ae64        .........7
	defb 0b1h,0d6h,010h,005h,0f0h,007h,03ah,0d5h,07fh,087h,0d4h,037h,02fh,037h,0d5h,0b7h	; ae74  ......:....7/7..
	defb 0d8h,0f8h,002h,0e9h,006h,0eah,00eh	; ae84

; ----------------------------------------------------------------------
; DATOS partitura_AE8B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (40 bytes)
;   0xae8b..0xaeb3  (40 bytes)
DATA_partitura_AE8B:
	defb 0ebh,01ah,037h,051h,0d6h,010h,002h,0f0h,005h,072h,0d4h,073h,083h,0d3h,033h,023h	; ae8b  ..7Q.....r.s..3#
	defb 053h,073h,033h,0d2h,003h,0d3h,0b3h,073h,0d2h,033h,023h,0e9h,001h,0bfh,05fh,03fh	; ae9b  Ss3....s.3#..._?
	defb 02fh,08fh,07fh,0d8h,0dch,0fdh,089h,0adh	; aeab  /.......

; ----------------------------------------------------------------------
; DATOS partitura_AEB3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (14 bytes)
;   0xaeb3..0xaec1  (14 bytes)
DATA_partitura_AEB3:
	defb 0feh,001h,0f8h,002h,0e9h,006h,0eah,00ah,0ebh,009h,037h,0c1h,0d9h,0d6h	; aeb3  ..........7...

; ----------------------------------------------------------------------
; DATOS partitura_AEC1: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xaec1..0xaec2  (1 bytes)
DATA_partitura_AEC1:
	defb 010h	; aec1

; ----------------------------------------------------------------------
; DATOS partitura_AEC2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (43 bytes)
;   0xaec2..0xaeed  (43 bytes)
DATA_partitura_AEC2:
	defb 001h,0f0h,007h,053h,0d2h,071h,081h,0c3h,05bh,073h,083h,0a5h,081h,071h,051h,071h	; aec2  ...S.q..[s...qQq
	defb 051h,031h,0e9h,00ch,02ch,0e9h,006h,007h,0d3h,0bbh,0d2h,003h,02fh,037h,0b7h,0d1h	; aed2  Q1..,......./7..
	defb 027h,03bh,0c2h,000h,0d2h,0e9h,00ch,089h,0e9h,006h,073h	; aee2  '.........s

; ----------------------------------------------------------------------
; DATOS partitura_AEED: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (65 bytes)
;   0xaeed..0xaf2e  (65 bytes)
DATA_partitura_AEED:
	defb 061h,091h,0c1h,0d1h,001h,021h,031h,061h,091h,0d0h,031h,021h,0d1h,067h,093h,0e9h	; aeed  a....!1a..1!.g..
	defb 006h,0f5h,0eah,00bh,0ebh,01ah,037h,002h,0d6h,010h,001h,0f0h,005h,072h,0d1h,071h	; aefd  ......7......r.q
	defb 0d3h,021h,0d4h,081h,0fbh,002h,0d1h,071h,0d3h,021h,0d4h,071h,0f5h,0d1h,051h,0d3h	; af0d  .!.....q.!.q..Q.
	defb 021h,0d4h,071h,0fbh,002h,0d1h,051h,0d4h,061h,091h,0d1h,031h,0d4h,061h,091h,0d1h	; af1d  !.q...Q.a..1.a..
	defb 031h	; af2d

; ----------------------------------------------------------------------
; DATOS partitura_AF2E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (62 bytes)
;   0xaf2e..0xaf6c  (62 bytes)
DATA_partitura_AF2E:
	defb 0d4h,061h,091h,0f5h,0d1h,021h,0d4h,0b1h,051h,0fbh,002h,0d1h,021h,0d4h,0b1h,0d8h	; af2e  .a...!..Q...!...
	defb 0fch,002h,0fch,0aeh,0e9h,006h,0f0h,007h,031h,0eah,00ch,0ebh,00ah,037h,041h,0d6h	; af3e  ........1....7A.
	defb 010h,001h,0d2h,080h,070h,080h,0a0h,085h,081h,081h,081h,0a0h,080h,0a0h,0d1h,000h	; af4e  ....p...........
	defb 0d2h,0a1h,0ebh,01ah,037h,003h,0d3h,0a1h,0a1h,0a0h,0a1h,0a0h,0a1h,0ebh	; af5e  ....7.........

; ----------------------------------------------------------------------
; DATOS partitura_AF6C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xaf6c..0xaf72  (6 bytes)
DATA_partitura_AF6C:
	defb 00ah,037h,041h,0d2h,080h,070h	; af6c

; ----------------------------------------------------------------------
; DATOS partitura_AF72: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xaf72..0xaf79  (7 bytes)
DATA_partitura_AF72:
	defb 080h,0a0h,085h,081h,081h,081h,0b0h	; af72

; ----------------------------------------------------------------------
; DATOS partitura_AF79: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (15 bytes)
;   0xaf79..0xaf88  (15 bytes)
DATA_partitura_AF79:
	defb 080h,0b0h,0d1h,020h,0d2h,071h,0ebh,01ah,037h,003h,0d3h,0b1h,0b1h,0b0h,0b0h	; af79  ... .q..7......

; ----------------------------------------------------------------------
; DATOS partitura_AF88: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (12 bytes)
;   0xaf88..0xaf94  (12 bytes)
DATA_partitura_AF88:
	defb 0b0h,0b0h,0b0h,0b0h,0d8h,0e9h,006h,0eah,007h,0ebh,009h,037h	; af88  ...........7

; ----------------------------------------------------------------------
; DATOS partitura_AF94: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (23 bytes)
;   0xaf94..0xafab  (23 bytes)
DATA_partitura_AF94:
	defb 003h,0d6h,002h,001h,0f5h,0d2h,070h,080h,070h,050h,070h,050h,071h,070h,080h,0b0h	; af94  ......p.pPpPqp..
	defb 080h,070h,050h,071h,0fbh,004h,0d8h	; afa4

; ----------------------------------------------------------------------
; DATOS partitura_AFAB: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (27 bytes)
;   0xafab..0xafc6  (27 bytes)
DATA_partitura_AFAB:
	defb 0e9h,00ch,0eah,00bh,0ebh,009h,037h,0b1h,0d6h,010h,001h,0f0h,007h,072h,0dbh,003h	; afab  ......7......r..
	defb 0d2h,07fh,0f0h,007h,003h,0ech,0eah,003h,07fh,0dch,0d8h	; afbb  ...........

; ----------------------------------------------------------------------
; DATOS partitura_AFC6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xafc6..0xafca  (4 bytes)
DATA_partitura_AFC6:
	defb 0f0h,000h,0fdh,0b3h	; afc6

; ----------------------------------------------------------------------
; DATOS partitura_AFCA: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xafca..0xafcb  (1 bytes)
DATA_partitura_AFCA:
	defb 0aeh	; afca

; ----------------------------------------------------------------------
; DATOS partitura_AFCB: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xafcb..0xafd1  (6 bytes)
DATA_partitura_AFCB:
	defb 0feh,001h,0e9h,006h,0eah,00ch	; afcb

; ----------------------------------------------------------------------
; DATOS partitura_AFD1: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (29 bytes)
;   0xafd1..0xafee  (29 bytes)
DATA_partitura_AFD1:
	defb 0ebh,009h,037h,0b1h,0d9h,0d6h,020h,002h,0f0h,007h,055h,0d4h,071h,081h,0c3h,05bh	; afd1  ..7... ...U.q..[
	defb 073h,083h,0a5h,081h,071h,051h,071h,051h,031h,0e9h,00ch,02ch,0e9h	; afe1  s...qQqQ1..,.

; ----------------------------------------------------------------------
; DATOS partitura_AFEE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (40 bytes)
;   0xafee..0xb016  (40 bytes)
DATA_partitura_AFEE:
	defb 006h,007h,0d5h,0bbh,0d4h,003h,02fh,037h,0b7h,0d3h,027h,03bh,0c2h,000h,0d4h,0e9h	; afee  ....../7..'.....
	defb 00ch,089h,0e9h,006h,073h,061h,091h,0c1h,0d3h,001h,021h,031h,061h,091h,0d2h,031h	; affe  ....sa....!1a..1
	defb 021h,0d3h,067h,093h,0e9h,006h,0f5h,0eah	; b00e  !.g.....

; ----------------------------------------------------------------------
; DATOS partitura_B016: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (15 bytes)
;   0xb016..0xb025  (15 bytes)
DATA_partitura_B016:
	defb 00bh,0ebh,01ah,037h,002h,0d6h,010h,001h,0f0h,005h,072h,0d1h,021h,0d2h,021h	; b016  ...7......r.!.!

; ----------------------------------------------------------------------
; DATOS partitura_B025: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (10 bytes)
;   0xb025..0xb02f  (10 bytes)
DATA_partitura_B025:
	defb 0d3h,081h,0fbh,002h,0d1h,021h,0d2h,021h,0d3h,071h	; b025  .....!.!.q

; ----------------------------------------------------------------------
; DATOS partitura_B02F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xb02f..0xb048  (25 bytes)
DATA_partitura_B02F:
	defb 0f5h,0d1h,001h,0d2h,021h,0d3h,071h,0fbh,002h,0d1h,001h,0d3h,061h,091h,0d2h,0b1h	; b02f  ....!.q.....a...
	defb 0d3h,061h,091h,0d2h,0b1h,0d3h,061h,091h,0f5h	; b03f  .a....a..

; ----------------------------------------------------------------------
; DATOS partitura_B048: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (30 bytes)
;   0xb048..0xb066  (30 bytes)
DATA_partitura_B048:
	defb 0d2h,081h,0d3h,0b1h,051h,0fbh,002h,0d2h,081h,0d3h,0b1h,0d8h,0fch,002h,012h,0b0h	; b048  ....Q...........
	defb 0e9h,006h,0f0h,007h,031h,0eeh,082h,0c1h,0eah,005h,0dbh,002h,0ebh,017h	; b058  ....1.........

; ----------------------------------------------------------------------
; DATOS partitura_B066: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (65 bytes)
;   0xb066..0xb0a7  (65 bytes)
DATA_partitura_B066:
	defb 027h,041h,0d6h,010h,001h,0d2h,080h,070h,080h,0a0h,085h,081h,081h,081h,0a0h,080h	; b066  'A.....p........
	defb 0a0h,0d1h,000h,0dch,0efh,0eah,00ch,0ebh,01ah,037h,002h,0d5h,0a1h,0a1h,0a0h,0a1h	; b076  .........7......
	defb 0a0h,0a1h,0eah,005h,0dbh,002h,0eeh,082h,0ebh,017h,027h,041h,0c1h,0d2h,080h,070h	; b086  ..........'A...p
	defb 080h,0a0h,083h,0c1h,081h,081h,081h,0b0h,080h,0b0h,0d1h,020h,0dch,0efh,0eah,00ch	; b096  ........... ....
	defb 0ebh	; b0a6

; ----------------------------------------------------------------------
; DATOS partitura_B0A7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xb0a7..0xb0b8  (17 bytes)
DATA_partitura_B0A7:
	defb 00ah,037h,002h,0d5h,0b1h,0b1h,0b0h,0b0h,0b0h,0b0h,0b0h,0b0h,0d8h,0e9h,006h,0eah	; b0a7  .7..............
	defb 00dh	; b0b7

; ----------------------------------------------------------------------
; DATOS partitura_B0B8: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (16 bytes)
;   0xb0b8..0xb0c8  (16 bytes)
DATA_partitura_B0B8:
	defb 0ebh,01ah,077h,003h,0d6h,010h,002h,0f0h,007h,004h,0d4h,070h,070h,070h,070h,071h	; b0b8  ..w........ppppq

; ----------------------------------------------------------------------
; DATOS partitura_B0C8: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (64 bytes)
;   0xb0c8..0xb108  (64 bytes)
DATA_partitura_B0C8:
	defb 070h,070h,071h,070h,070h,070h,070h,070h,070h,080h,080h,080h,080h,081h,080h,080h	; b0c8  ppqpppppp.......
	defb 0d3h,031h,030h,030h,030h,030h,030h,030h,020h,020h,020h,020h,021h,020h,020h,021h	; b0d8  .1000000    !  !
	defb 020h,020h,020h,020h,020h,020h,030h,030h,030h,030h,031h,030h,030h,0d4h,0b1h,0b0h	; b0e8        0000100...
	defb 0b0h,0b0h,0b0h,0b0h,0b0h,0e9h,00ch,0eeh,082h,0c0h,0eah,007h,0ebh,007h,017h,0b1h	; b0f8  ................

; ----------------------------------------------------------------------
; DATOS partitura_B108: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (36 bytes)
;   0xb108..0xb12c  (36 bytes)
DATA_partitura_B108:
	defb 0d6h,010h,001h,0f0h,007h,072h,0dbh,003h,0d2h,07eh,0e9h,006h,0efh,0eah,00fh,0ebh	; b108  .....r...~......
	defb 009h,037h,031h,0d5h,0b3h,073h,0d4h,033h,023h,0e9h,001h,0bfh,05fh,03fh,02fh,08fh	; b118  .71..s.3#..._?/.
	defb 07fh,0dch,0d8h,0f0h	; b128

; ----------------------------------------------------------------------
; DATOS partitura_B12C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xb12c..0xb130  (4 bytes)
DATA_partitura_B12C:
	defb 000h,0fdh,0cbh,0afh	; b12c

; ----------------------------------------------------------------------
; DATOS partitura_B130: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x82 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xb130..0xb137  (7 bytes)
DATA_partitura_B130:
	defb 0feh,004h,0e9h,004h,0d1h,097h,0f5h	; b130

; ----------------------------------------------------------------------
; DATOS partitura_B137: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x82 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (33 bytes)
;   0xb137..0xb158  (33 bytes)
DATA_partitura_B137:
	defb 060h,060h,060h,060h,060h,060h,060h,060h,070h,070h,070h,070h,070h,070h,070h,070h	; b137  ````````pppppppp
	defb 083h,063h,0fbh,006h,0e9h,009h,073h,083h,083h,0e9h,004h,0f5h,060h,0fbh,019h,06fh	; b147  .c....s.....`..o
	defb 0ffh	; b157

; ----------------------------------------------------------------------
; DATOS partitura_B158: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x82 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xb158..0xb159  (1 bytes)
DATA_partitura_B158:
	defb 0ffh	; b158

; ----------------------------------------------------------------------
; DATOS partitura_B159: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x82 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (12 bytes)
;   0xb159..0xb165  (12 bytes)
DATA_partitura_B159:
	defb 0feh,001h,0f6h,0f8h,002h,0d6h,030h,001h,0e9h,008h,0eah,008h	; b159  ......0.....

; ----------------------------------------------------------------------
; DATOS partitura_B165: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x82 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xb165..0xb177  (18 bytes)
DATA_partitura_B165:
	defb 0ebh,009h,027h,091h,0d4h,0b3h,077h,093h,0d3h,007h,0d4h,0b3h,097h,073h,067h,023h	; b165  ..'...w......sg#
	defb 077h,063h	; b175

; ----------------------------------------------------------------------
; DATOS partitura_B177: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x82 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xb177..0xb17b  (4 bytes)
DATA_partitura_B177:
	defb 047h,023h,003h,0e9h	; b177

; ----------------------------------------------------------------------
; DATOS partitura_B17B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x82 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xb17b..0xb181  (6 bytes)
DATA_partitura_B17B:
	defb 009h,003h,0d5h,093h,07fh,0ffh	; b17b

; ----------------------------------------------------------------------
; DATOS partitura_B181: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x82 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (31 bytes)
;   0xb181..0xb1a0  (31 bytes)
DATA_partitura_B181:
	defb 0feh,001h,0f8h,002h,0e9h,008h,0f0h,007h,031h,0d6h,004h,002h,0eah,007h,0ebh,00ah	; b181  ........1.......
	defb 016h,091h,0d3h,073h,0d2h,027h,023h,005h,021h,023h,045h,041h,041h,021h,023h	; b191  ...s.'#.!#EAA!#

; ----------------------------------------------------------------------
; DATOS partitura_B1A0: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x82 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xb1a0..0xb1b2  (18 bytes)
DATA_partitura_B1A0:
	defb 0d3h,093h,073h,0d2h,027h,023h,025h,021h,023h,043h,0e9h,009h,0d3h,093h,0d2h,023h	; b1a0  ..s.'#%!#C.....#
	defb 02fh,0ffh	; b1b0

; ----------------------------------------------------------------------
; DATOS partitura_B1B2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x82 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (35 bytes)
;   0xb1b2..0xb1d5  (35 bytes)
DATA_partitura_B1B2:
	defb 0feh,001h,0f8h,002h,0e9h,008h,0f0h,007h,031h,0d6h,004h,002h,0eah,007h,0ebh,00ah	; b1b2  ........1.......
	defb 016h,091h,0d2h,023h,077h,063h,045h,061h,073h,095h,0b1h,091h,071h,063h,023h,023h	; b1c2  ...#wcEas...qc##
	defb 0b7h,093h,075h	; b1d2

; ----------------------------------------------------------------------
; DATOS partitura_B1D5: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x82 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (9 bytes)
;   0xb1d5..0xb1de  (9 bytes)
DATA_partitura_B1D5:
	defb 061h,073h,093h,0e9h,009h,043h,063h,07fh,0ffh	; b1d5  as...Cc..

; ----------------------------------------------------------------------
; DATOS partitura_B1DE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x82 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xb1de..0xb1f7  (25 bytes)
DATA_partitura_B1DE:
	defb 0feh,001h,0e9h,009h,0c1h,0e9h,008h,0eeh,081h,0f0h,007h,031h,0d6h,004h,002h,0eah	; b1de  ...........1....
	defb 004h,0edh,013h,0ebh,087h,013h,0f1h,0d2h,023h	; b1ee  ........#

; ----------------------------------------------------------------------
; DATOS partitura_B1F7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x82 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (24 bytes)
;   0xb1f7..0xb20f  (24 bytes)
DATA_partitura_B1F7:
	defb 077h,063h,045h,061h,073h,095h,0b1h,091h,071h,063h,023h,023h,0b7h,093h,075h,061h	; b1f7  wcEas...qc##..ua
	defb 073h,093h,0e9h,009h,043h,063h,07ch,0ffh	; b207  s...Cc|.

; ----------------------------------------------------------------------
; DATOS partitura_B20F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA0 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (12 bytes)
;   0xb20f..0xb21b  (12 bytes)
DATA_partitura_B20F:
	defb 0feh,004h,0d1h,0f5h,0e9h,004h,060h,0e9h,003h,060h,0fbh,002h	; b20f  ......`..`..

; ----------------------------------------------------------------------
; DATOS partitura_B21B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA0 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (24 bytes)
;   0xb21b..0xb233  (24 bytes)
DATA_partitura_B21B:
	defb 0f5h,0e9h,004h,070h,0e9h,003h,070h,0fbh,002h,0f5h,0e9h,004h,080h,0e9h,003h,080h	; b21b  ...p..p.........
	defb 0fbh,002h,0f5h,0e9h,004h,090h,0e9h,003h	; b22b  ........

; ----------------------------------------------------------------------
; DATOS partitura_B233: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA0 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xb233..0xb23a  (7 bytes)
DATA_partitura_B233:
	defb 090h,0fbh,002h,0e9h,00eh,0d0h,0f5h	; b233

; ----------------------------------------------------------------------
; DATOS partitura_B23A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA0 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (38 bytes)
;   0xb23a..0xb260  (38 bytes)
DATA_partitura_B23A:
	defb 0a3h,0fbh,014h,0a0h,0b2h,0a3h,0f5h,0a3h,0fbh,006h,0d1h,060h,060h,060h,060h,070h	; b23a  ...........````p
	defb 070h,070h,070h,080h,080h,080h,080h,090h,090h,090h,090h,0f5h,0e9h,00eh,0d0h,0a3h	; b24a  ppp.............
	defb 0a3h,0a0h,0a2h,0d1h,0e9h,001h	; b25a

; ----------------------------------------------------------------------
; DATOS partitura_B260: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA0 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (26 bytes)
;   0xb260..0xb27a  (26 bytes)
DATA_partitura_B260:
	defb 098h,089h,078h,068h,069h,068h,0fbh,003h,0e9h,00eh,0d0h,0a3h,0a3h,0a0h,0a2h,0d1h	; b260  ..xhih..........
	defb 060h,060h,060h,060h,0f5h,0d0h,0e9h,00eh,0a3h,0a3h	; b270  ````......

; ----------------------------------------------------------------------
; DATOS partitura_B27A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA0 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (14 bytes)
;   0xb27a..0xb288  (14 bytes)
DATA_partitura_B27A:
	defb 0a0h,0a2h,0d1h,0e9h,001h,098h,089h,078h,068h,069h,068h,0fbh,003h,0e9h	; b27a  .......xhih...

; ----------------------------------------------------------------------
; DATOS partitura_B288: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA0 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (33 bytes)
;   0xb288..0xb2a9  (33 bytes)
DATA_partitura_B288:
	defb 00eh,0d0h,0a3h,0a3h,0e9h,007h,0d1h,060h,060h,060h,060h,070h,070h,070h,070h,080h	; b288  .......````pppp.
	defb 080h,080h,080h,090h,090h,090h,090h,0e9h,00eh,0d0h,0f5h,0b3h,072h,0a0h,0a3h,073h	; b298  ............r..s
	defb 0fbh	; b2a8

; ----------------------------------------------------------------------
; DATOS partitura_B2A9: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA0 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xb2a9..0xb2b4  (11 bytes)
DATA_partitura_B2A9:
	defb 003h,0b0h,0a2h,0b0h,0a2h,0b0h,0a0h,000h,0a0h,070h,070h	; b2a9  .........pp

; ----------------------------------------------------------------------
; DATOS sin identificar  0xb2b4..0xb2cb  (23 bytes)
DATA_B2B4:
	defb 070h,070h,0f5h,0b3h,072h,0a0h,0a3h,073h,0fbh,003h,0b3h,072h,0a0h,0a0h,0a1h,0a0h	; b2b4  pp..r..s...r....
	defb 070h,070h,000h,0a0h,0fdh,036h,0b2h	; b2c4

; ----------------------------------------------------------------------
; DATOS partitura_B2CB: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA0 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xb2cb..0xb2ce  (3 bytes)
DATA_partitura_B2CB:
	defb 0feh,001h,0e9h	; b2cb

; ----------------------------------------------------------------------
; DATOS partitura_B2CE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA0 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (56 bytes)
;   0xb2ce..0xb306  (56 bytes)
DATA_partitura_B2CE:
	defb 00eh,0c3h,0e9h,00eh,0eeh,081h,0c1h,0ech,0eah,005h,0d6h,004h,001h,0f0h,00fh,032h	; b2ce  ...............2
	defb 0f9h,0adh,0b6h,0b5h,075h,0e9h,00eh,0c1h,0eeh,082h,0d6h,010h,001h,0eah,006h,0d3h	; b2de  ....u...........
	defb 09fh,09fh,09fh,077h,053h,071h,0efh,0e9h,00eh,0c0h,0eeh,001h,0eah,008h,0edh,017h	; b2ee  ...wSq..........
	defb 0ebh,087h,016h,0f1h,0d6h,020h,001h,0f0h	; b2fe  ..... ..

; ----------------------------------------------------------------------
; DATOS partitura_B306: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA0 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (24 bytes)
;   0xb306..0xb31e  (24 bytes)
DATA_partitura_B306:
	defb 00fh,041h,0f9h,0c2h,0b6h,0f9h,0d1h,0b6h,0d1h,000h,020h,0eah,008h,0edh,017h,0ebh	; b306  .A........ .....
	defb 087h,016h,0f1h,0f9h,0c2h,0b6h,0f9h,0d1h	; b316  ........

; ----------------------------------------------------------------------
; DATOS partitura_B31E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA0 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (19 bytes)
;   0xb31e..0xb331  (19 bytes)
DATA_partitura_B31E:
	defb 0b6h,0e9h,007h,0eeh,081h,0ech,0c1h,0eah,005h,0ebh,008h,017h,071h,0dbh,002h,0d8h	; b31e  ............q...
	defb 0f9h,0f9h,0b6h	; b32e

; ----------------------------------------------------------------------
; DATOS partitura_B331: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA0 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xb331..0xb334  (3 bytes)
DATA_partitura_B331:
	defb 0f9h,04ch,0b7h	; b331

; ----------------------------------------------------------------------
; DATOS sin identificar  0xb334..0xb340  (12 bytes)
DATA_B334:
	defb 090h,0b0h,0f9h,0f9h,0b6h,0f9h,04ch,0b7h,0efh,0fdh,0d0h,0b2h	; b334  ......L.....

; ----------------------------------------------------------------------
; DATOS partitura_B340: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA0 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (72 bytes)
;   0xb340..0xb388  (72 bytes)
DATA_partitura_B340:
	defb 0feh,001h,0e9h,00eh,0c3h,0e9h,00eh,0eeh,001h,0eah,004h,0ebh,007h,013h,041h,0c0h	; b340  ..............A.
	defb 0f9h,09dh,0b7h,0b0h,0f9h,09dh,0b7h,0efh,0e9h,00eh,0eeh,001h,0eah,005h,0ebh,007h	; b350  ................
	defb 013h,041h,0c0h,0f9h,09dh,0b7h,0b0h,0f9h,09dh,0b7h,0efh,0e9h,00eh,0f0h,00fh,022h	; b360  .A............."
	defb 0eah,008h,0ebh,009h,01bh,0a1h,0d8h,0f5h,0d3h,093h,0fbh,008h,0f5h,0b3h,0fbh,004h	; b370  ................
	defb 0d2h,003h,003h,000h,0d3h,0b0h,0d2h,005h	; b380  ........

; ----------------------------------------------------------------------
; DATOS sin identificar  0xb388..0xb396  (14 bytes)
DATA_B388:
	defb 0f5h,0d3h,093h,0fbh,008h,0f5h,0b3h,0fbh,008h,0f0h,000h,0fdh,045h,0b3h	; b388  ............E.

; ----------------------------------------------------------------------
; DATOS partitura_B396: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA0 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (15 bytes)
;   0xb396..0xb3a5  (15 bytes)
DATA_partitura_B396:
	defb 0feh,001h,0f8h,04bh,0e9h,00eh,0eah,00fh,0ebh,00bh,037h,0f1h,0d7h,010h,030h	; b396  ...K......7...0

; ----------------------------------------------------------------------
; DATOS partitura_B3A5: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA0 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xb3a5..0xb3be  (25 bytes)
DATA_partitura_B3A5:
	defb 0d5h,093h,0d8h,0f8h,04bh,0e9h,00eh,0eah,00fh,0edh,01bh,0ebh,089h,02bh,041h,0d5h	; b3a5  ....K........+A.
	defb 0f5h,093h,0fbh,004h,0f5h,053h,0fbh,004h,0f5h	; b3b5  .....S...

; ----------------------------------------------------------------------
; DATOS partitura_B3BE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA0 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (12 bytes)
;   0xb3be..0xb3ca  (12 bytes)
DATA_partitura_B3BE:
	defb 023h,0fbh,004h,0f5h,073h,0fbh,004h,0f5h,093h,0fbh,004h,0f5h	; b3be  #...s.......

; ----------------------------------------------------------------------
; DATOS partitura_B3CA: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA0 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xb3ca..0xb3dc  (18 bytes)
DATA_partitura_B3CA:
	defb 053h,0fbh,004h,0f5h,023h,0fbh,004h,0f5h,073h,0fbh,004h,0f8h,04bh,0e9h,00eh,0eah	; b3ca  S...#...s...K...
	defb 00fh,0edh	; b3da

; ----------------------------------------------------------------------
; DATOS partitura_B3DC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA0 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (33 bytes)
;   0xb3dc..0xb3fd  (33 bytes)
DATA_partitura_B3DC:
	defb 01bh,0ebh,089h,02bh,031h,0dbh,003h,0d5h,0f5h,093h,0fbh,004h,0f5h,053h,0fbh,004h	; b3dc  ...+1........S..
	defb 0f5h,023h,0fbh,004h,0f5h,073h,0fbh,004h,0f5h,093h,0fbh,004h,0f5h,053h,0fbh,004h	; b3ec  .#...s.......S..
	defb 0f5h	; b3fc

; ----------------------------------------------------------------------
; DATOS partitura_B3FD: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA0 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (30 bytes)
;   0xb3fd..0xb41b  (30 bytes)
DATA_partitura_B3FD:
	defb 023h,0fbh,004h,0f5h,073h,0fbh,004h,0f8h,04bh,0e9h,00eh,0eah,00fh,0ebh,00ah,02bh	; b3fd  #...s...K......+
	defb 081h,0dbh,003h,0d4h,026h,0d5h,090h,093h,0e9h,002h,098h,0b9h,0d4h,008h	; b40d  ....&.........

; ----------------------------------------------------------------------
; DATOS partitura_B41B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA0 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xb41b..0xb41f  (4 bytes)
DATA_partitura_B41B:
	defb 0e9h,00eh,0d5h,096h	; b41b

; ----------------------------------------------------------------------
; DATOS partitura_B41F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA0 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (26 bytes)
;   0xb41f..0xb439  (26 bytes)
DATA_partitura_B41F:
	defb 040h,0d4h,043h,0e9h,002h,008h,029h,048h,0e9h,00eh,0d5h,076h,070h,0b3h,0d4h,023h	; b41f  @.C...)H...vp..#
	defb 0d5h,090h,092h,0b0h,0b2h,0d4h,000h,002h,040h,042h	; b42f  ........@B

; ----------------------------------------------------------------------
; DATOS sin identificar  0xb439..0xb45e  (37 bytes)
DATA_B439:
	defb 026h,0d5h,090h,093h,0e9h,002h,098h,0b9h,0d4h,008h,0e9h,00eh,0d5h,096h,040h,0d4h	; b439  &.............@.
	defb 043h,0e9h,002h,008h,029h,048h,0e9h,00eh,0d5h,076h,0d4h,020h,0d5h,053h,073h,047h	; b449  C...)H...v. .SsG
	defb 0b7h,0dch,0fdh,0a8h,0b3h	; b459

; ----------------------------------------------------------------------
; DATOS partitura_B45E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA0 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (67 bytes)
;   0xb45e..0xb4a1  (67 bytes)
DATA_partitura_B45E:
	defb 0feh,001h,0e9h,00eh,0c3h,0f6h,0f8h,047h,0e9h,00eh,0eah,009h,0ebh,00ah,02bh,021h	; b45e  .......G......+!
	defb 0dbh,002h,0f9h,09dh,0b7h,0b0h,0f9h,09dh,0b7h,0b0h,0f8h,047h,0e9h,00eh,0eah,009h	; b46e  ...........G....
	defb 0ebh,00ah,02bh,021h,0dbh,002h,0f9h,09dh,0b7h,0b0h,0f9h,09dh,0b7h,0b0h,0f8h,054h	; b47e  ..+!...........T
	defb 0e9h,007h,0eah,006h,0ebh,008h,017h,011h,0dbh,001h,0d8h,0f0h,000h,0f9h,0f9h,0b6h	; b48e  ................
	defb 0f9h,04ch,0b7h	; b49e

; ----------------------------------------------------------------------
; DATOS sin identificar  0xb4a1..0xb4af  (14 bytes)
DATA_B4A1:
	defb 090h,0b0h,0f9h,0f9h,0b6h,0f9h,04ch,0b7h,090h,0b0h,0dch,0fdh,063h,0b4h	; b4a1  ......L.....c.

; ----------------------------------------------------------------------
; DATOS partitura_B4AF: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA0 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xb4af..0xb4b3  (4 bytes)
DATA_partitura_B4AF:
	defb 0feh,001h,0e9h,00eh	; b4af

; ----------------------------------------------------------------------
; DATOS partitura_B4B3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA0 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (38 bytes)
;   0xb4b3..0xb4d9  (38 bytes)
DATA_partitura_B4B3:
	defb 0c3h,0f8h,047h,0e9h,007h,0c2h,0e9h,00eh,0eeh,081h,0eah,004h,0ebh,007h,013h,061h	; b4b3  ..G............a
	defb 0f5h,0d2h,090h,0d1h,000h,040h,0fbh,004h,070h,0d2h,090h,0d1h,000h,040h,0f5h,0d2h	; b4c3  .....@..p....@..
	defb 090h,0d1h,000h,040h,0fbh,004h	; b4d3

; ----------------------------------------------------------------------
; DATOS partitura_B4D9: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA0 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (57 bytes)
;   0xb4d9..0xb512  (57 bytes)
DATA_partitura_B4D9:
	defb 070h,0d2h,090h,0d1h,000h,040h,0f5h,0d2h,090h,0d1h,020h,050h,0fbh,004h,070h,0d2h	; b4d9  p....@.... P..p.
	defb 090h,0d1h,020h,050h,0f5h,0d2h,070h,0b0h,0d1h,020h,0fbh,004h,050h,0d2h,070h,0e9h	; b4e9  .. P..p.. ..P.p.
	defb 007h,0d1h,020h,0f8h,002h,0e9h,00eh,0eah,007h,0f0h,00fh,023h,0efh,0eah,007h,0edh	; b4f9  .. ........#....
	defb 044h,0ebh,087h,014h,0f1h,0d6h,010h,001h,0d3h	; b509  D........

; ----------------------------------------------------------------------
; DATOS partitura_B512: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA0 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xb512..0xb514  (2 bytes)
DATA_partitura_B512:
	defb 09fh,09fh	; b512

; ----------------------------------------------------------------------
; DATOS partitura_B514: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA0 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (49 bytes)
;   0xb514..0xb545  (49 bytes)
DATA_partitura_B514:
	defb 09fh,077h,053h,073h,0f8h,002h,0e9h,00eh,0d6h,010h,001h,0f0h,00fh,052h,0f5h,0eah	; b514  .wSs.........R..
	defb 006h,0edh,043h,0ebh,087h,018h,0f1h,0d3h,047h,0eah,008h,0edh,036h,0ebh,087h,016h	; b524  ..C.....G...6...
	defb 0f1h,0d2h,040h,020h,04dh,090h,070h,0f0h,00fh,051h,09dh,0f0h,00fh,072h,050h,040h	; b534  ..@ M.p..Q...rP@
	defb 051h	; b544

; ----------------------------------------------------------------------
; DATOS partitura_B545: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA0 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (50 bytes)
;   0xb545..0xb577  (50 bytes)
DATA_partitura_B545:
	defb 0e9h,002h,0d2h,028h,049h,058h,0e9h,00eh,070h,050h,075h,057h,0fbh,002h,0f8h,01dh	; b545  ...(IX..pPuW....
	defb 0e9h,00eh,0eah,009h,0ebh,00ah,02ah,0b1h,0f0h,00fh,021h,0d8h,0f5h,0d2h,053h,0fbh	; b555  ......*...!...S.
	defb 004h,0f5h,043h,0fbh,004h,0f5h,023h,0fbh,004h,043h,043h,0f8h,007h,0eah,00ch,040h	; b565  ..C...#..CC....@
	defb 020h,045h	; b575

; ----------------------------------------------------------------------
; DATOS sin identificar  0xb577..0xb593  (28 bytes)
DATA_B577:
	defb 0f8h,01dh,0eah,009h,0f5h,053h,0fbh,004h,0f5h,043h,0fbh,004h,0f5h,023h,0fbh,004h	; b577  .....S...C...#..
	defb 0f5h,043h,0fbh,004h,0f0h,000h,0dch,0f0h,000h,0fdh,0b4h,0b4h	; b587  .C..........

; ----------------------------------------------------------------------
; DATOS partitura_B593: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA0 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (26 bytes)
;   0xb593..0xb5ad  (26 bytes)
DATA_partitura_B593:
	defb 0feh,001h,0e9h,00eh,0c3h,0f8h,002h,0e9h,00eh,0eah,009h,0edh,017h,0ebh,087h,016h	; b593  ................
	defb 0d1h,0d6h,020h,001h,0f0h,00fh,041h,0f9h,0adh,0b6h	; b5a3  .. ...A...

; ----------------------------------------------------------------------
; DATOS partitura_B5AD: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA0 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (47 bytes)
;   0xb5ad..0xb5dc  (47 bytes)
DATA_partitura_B5AD:
	defb 0b5h,073h,023h,0f9h,0adh,0b6h,0bdh,0f8h,002h,0e9h,00eh,0eah,009h,0edh,017h,0ebh	; b5ad  .s#.............
	defb 087h,016h,0d1h,0d6h,020h,001h,0f0h,00fh,041h,0f9h,0c2h,0b6h,0f9h,0d1h,0b6h,0d1h	; b5bd  .... ...A.......
	defb 000h,020h,0eah,009h,0edh,017h,0ebh,087h,016h,0d1h,0f9h,0c2h,0b6h,0f9h,0d1h	; b5cd  . .............

; ----------------------------------------------------------------------
; DATOS partitura_B5DC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA0 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xb5dc..0xb5e0  (4 bytes)
DATA_partitura_B5DC:
	defb 0b6h,0d1h,000h,020h	; b5dc

; ----------------------------------------------------------------------
; DATOS partitura_B5E0: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA0 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (9 bytes)
;   0xb5e0..0xb5e9  (9 bytes)
DATA_partitura_B5E0:
	defb 0f8h,002h,0e9h,00eh,0eah,00ah,0ebh,00ah,01bh	; b5e0  .........

; ----------------------------------------------------------------------
; DATOS partitura_B5E9: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA0 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (9 bytes)
;   0xb5e9..0xb5f2  (9 bytes)
DATA_partitura_B5E9:
	defb 0f1h,0dbh,002h,0f0h,00fh,063h,0f9h,0d6h,0b7h	; b5e9  .....c...

; ----------------------------------------------------------------------
; DATOS sin identificar  0xb5f2..0xb602  (16 bytes)
DATA_B5F2:
	defb 0edh,074h,0eah,009h,0ebh,087h,017h,0d1h,0f0h,00fh,033h,0b7h,0dch,0fdh,098h,0b5h	; b5f2  .t........3.....

; ----------------------------------------------------------------------
; DATOS partitura_B602: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA0 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xb602..0xb61b  (25 bytes)
DATA_partitura_B602:
	defb 0feh,001h,0e9h,00eh,0c3h,0f8h,002h,0e9h,007h,0c3h,0eeh,081h,0e9h,00eh,0eah,005h	; b602  ................
	defb 0edh,013h,0ebh,087h,013h,0f1h,0d6h,010h,001h	; b612  .........

; ----------------------------------------------------------------------
; DATOS partitura_B61B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA0 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (43 bytes)
;   0xb61b..0xb646  (43 bytes)
DATA_partitura_B61B:
	defb 0f0h,00fh,012h,0f9h,0adh,0b6h,0b5h,073h,023h,0f9h,0adh,0b6h,0bbh,0f8h,002h,0e9h	; b61b  .......s#.......
	defb 00eh,0eah,006h,0edh,034h,0ebh,087h,016h,0f1h,0f0h,00fh,053h,0f9h,00ch,0b8h,0e9h	; b62b  ....4......S....
	defb 00eh,0eah,005h,0eeh,081h,0b7h,0eah,008h,0eeh,083h,0e9h	; b63b  ...........

; ----------------------------------------------------------------------
; DATOS partitura_B646: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA0 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (22 bytes)
;   0xb646..0xb65c  (22 bytes)
DATA_partitura_B646:
	defb 007h,0c1h,0ech,0eah,003h,0d3h,070h,090h,0b0h,0d2h,000h,020h,040h,050h,070h,020h	; b646  ......p.... @Pp
	defb 040h,050h,070h,090h,0b0h,0efh	; b656

; ----------------------------------------------------------------------
; DATOS partitura_B65C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA0 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xb65c..0xb667  (11 bytes)
DATA_partitura_B65C:
	defb 0e9h,00eh,0eah,006h,0edh,034h,0ebh,087h,016h,0f1h,0f9h	; b65c  .....4.....

; ----------------------------------------------------------------------
; DATOS partitura_B667: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA0 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (13 bytes)
;   0xb667..0xb674  (13 bytes)
DATA_partitura_B667:
	defb 00ch,0b8h,0e9h,007h,0eah,005h,0eeh,081h,0bfh,0eah,008h,0e9h,007h	; b667  .............

; ----------------------------------------------------------------------
; DATOS partitura_B674: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA0 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (41 bytes)
;   0xb674..0xb69d  (41 bytes)
DATA_partitura_B674:
	defb 0d3h,0b0h,0d2h,000h,020h,040h,050h,070h,090h,0b0h,070h,090h,0b0h,0d1h,000h,020h	; b674  .... @Pp..p....
	defb 040h,050h,070h,0efh,0f8h,002h,0e9h,00eh,0eeh,081h,0c1h,0eah,006h,0ebh,009h,01bh	; b684  @Pp.............
	defb 0f1h,0dbh,002h,0f0h,00fh,053h,0f9h,0d6h,0b7h	; b694  .....S...

; ----------------------------------------------------------------------
; DATOS sin identificar  0xb69d..0xb6ad  (16 bytes)
DATA_B69D:
	defb 0edh,073h,0eah,006h,0f0h,00fh,023h,0ebh,087h,017h,0d1h,0b5h,0efh,0fdh,007h,0b6h	; b69d  .s....#.........

; ----------------------------------------------------------------------
; DATOS sonido_B6AD: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0xA0 (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392
;   (16 bytes)
;   0xb6ad..0xb6bd  (16 bytes)
DATA_sonido_B6AD:
	defb 0f5h,0d1h,000h,0d2h,0b0h,0d1h,00dh,0fbh,002h,020h,000h,027h,0d2h,091h,0b1h,0d1h	; b6ad  ......... .'....

; ----------------------------------------------------------------------
; DATOS partitura_B6BD: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA0 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xb6bd..0xb6c4  (7 bytes)
DATA_partitura_B6BD:
	defb 001h,0d2h,0b0h,090h,0fah,0e9h,00eh	; b6bd

; ----------------------------------------------------------------------
; DATOS partitura_B6C4: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA0 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xb6c4..0xb6dd  (25 bytes)
DATA_partitura_B6C4:
	defb 0f5h,0d1h,000h,0d2h,0b0h,0d1h,00dh,0fbh,002h,020h,000h,029h,0fah,0e9h,002h,0d2h	; b6c4  ......... .)....
	defb 0b8h,0d1h,009h,028h,0e9h,00eh,0d2h,0b0h,090h	; b6d4  ...(.....

; ----------------------------------------------------------------------
; DATOS partitura_B6DD: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA0 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xb6dd..0xb6ef  (18 bytes)
DATA_partitura_B6DD:
	defb 0b5h,0eah,006h,0edh,035h,0ebh,087h,017h,071h,0e9h,007h,0d3h,070h,090h,0b0h,0d2h	; b6dd  ....5...q...p...
	defb 000h,020h	; b6ed

; ----------------------------------------------------------------------
; DATOS partitura_B6EF: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA0 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xb6ef..0xb708  (25 bytes)
DATA_partitura_B6EF:
	defb 040h,050h,070h,020h,040h,050h,070h,090h,0b0h,0fah,0d2h,020h,040h,050h,070h,090h	; b6ef  @Pp @Pp.... @Pp.
	defb 0b0h,0d1h,000h,020h,040h,050h,070h,090h,0b0h	; b6ff  ... @Pp..

; ----------------------------------------------------------------------
; DATOS partitura_B708: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA0 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (32 bytes)
;   0xb708..0xb728  (32 bytes)
DATA_partitura_B708:
	defb 0d0h,000h,020h,040h,0eah,004h,0d2h,050h,070h,090h,0b0h,0d1h,000h,020h,040h,050h	; b708  .. @...Pp.... @P
	defb 070h,090h,0b0h,0d0h,000h,020h,040h,050h,070h,0eah,005h,0d2h,050h,070h,090h,0b0h	; b718  p.... @Pp...Pp..

; ----------------------------------------------------------------------
; DATOS partitura_B728: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA0 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xb728..0xb733  (11 bytes)
DATA_partitura_B728:
	defb 0d1h,000h,020h,040h,050h,070h,090h,0b0h,0d0h,000h,020h	; b728  .. @Pp....

; ----------------------------------------------------------------------
; DATOS partitura_B733: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA0 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (69 bytes)
;   0xb733..0xb778  (69 bytes)
DATA_partitura_B733:
	defb 040h,050h,070h,0eah,004h,0d2h,090h,0b0h,0d1h,000h,020h,040h,050h,070h,090h,0b0h	; b733  @Pp....... @Pp..
	defb 0d0h,000h,020h,040h,050h,070h,090h,0b0h,0fah,0d2h,020h,040h,050h,070h,090h,0b0h	; b743  .. @Pp.... @Pp..
	defb 0d1h,000h,020h,040h,050h,070h,090h,0b0h,0d0h,000h,020h,040h,0eah,004h,0d2h,070h	; b753  .. @Pp.... @...p
	defb 090h,0b0h,0d1h,000h,020h,040h,050h,070h,090h,0b0h,0d0h,000h,020h,040h,050h,070h	; b763  .... @Pp.... @Pp
	defb 090h,0eah,005h,0d2h,040h	; b773

; ----------------------------------------------------------------------
; DATOS partitura_B778: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA0 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xb778..0xb77f  (7 bytes)
DATA_partitura_B778:
	defb 050h,070h,090h,0b0h,0d1h,000h,020h	; b778

; ----------------------------------------------------------------------
; DATOS partitura_B77F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA0 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (26 bytes)
;   0xb77f..0xb799  (26 bytes)
DATA_partitura_B77F:
	defb 040h,050h,070h,090h,0b0h,0d0h,000h,020h,040h,050h,0eah,004h,0d2h,090h,0b0h,0d1h	; b77f  @Pp.... @P......
	defb 000h,020h,040h,050h,070h,090h,0b0h,0d0h,000h,020h	; b78f  . @Pp....

; ----------------------------------------------------------------------
; DATOS sin identificar  0xb799..0xb79d  (4 bytes)
DATA_B799:
	defb 040h,050h,070h,0fah	; b799

; ----------------------------------------------------------------------
; DATOS sonido_B79D: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0xA0 (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392
;   (54 bytes)
;   0xb79d..0xb7d3  (54 bytes)
DATA_sonido_B79D:
	defb 0f5h,0d2h,090h,0d1h,000h,040h,0fbh,004h,070h,0d2h,090h,0d1h,000h,040h,0f5h,0d2h	; b79d  .....@..p....@..
	defb 090h,0d1h,000h,040h,0fbh,004h,070h,0d2h,090h,0d1h,000h,040h,0f5h,0d2h,090h,0d1h	; b7ad  ...@..p....@....
	defb 020h,050h,0fbh,004h,070h,0d2h,090h,0d1h,020h,050h,0f5h,0d2h,070h,0b0h,0d1h,020h	; b7bd   P..p... P..p..
	defb 0fbh,004h,050h,0d2h,070h,0d1h	; b7cd

; ----------------------------------------------------------------------
; DATOS partitura_B7D3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA0 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (33 bytes)
;   0xb7d3..0xb7f4  (33 bytes)
DATA_partitura_B7D3:
	defb 020h,0d2h,0fah,0d1h,02bh,0e9h,002h,0d2h,098h,0b9h,0d1h,008h,0e9h,00eh,04bh,0e9h	; b7d3   ...+.........K.
	defb 002h,008h,029h,048h,0e9h,00eh,07bh,0e9h,002h,058h,049h,028h,0e9h,00eh,040h,020h	; b7e3  ..)H..{..XI(..@
	defb 04dh	; b7f3

; ----------------------------------------------------------------------
; DATOS sin identificar  0xb7f4..0xb80c  (24 bytes)
DATA_B7F4:
	defb 02bh,0e9h,002h,0d2h,098h,0b9h,0d1h,008h,0e9h,00eh,04bh,0e9h,002h,008h,029h,048h	; b7f4  +.........K...)H
	defb 0e9h,00eh,077h,057h,040h,020h,045h,0fah	; b804  ..wW@ E.

; ----------------------------------------------------------------------
; DATOS sonido_B80C: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0xA0 (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392
;   (18 bytes)
;   0xb80c..0xb81e  (18 bytes)
DATA_sonido_B80C:
	defb 0d3h,097h,0d2h,000h,0d3h,0b0h,0d2h,001h,0e9h,002h,0d3h,098h,0b9h,0d2h,008h,0d3h	; b80c  ................
	defb 0e9h,00eh	; b81c

; ----------------------------------------------------------------------
; DATOS partitura_B81E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA0 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (20 bytes)
;   0xb81e..0xb832  (20 bytes)
DATA_partitura_B81E:
	defb 097h,0d2h,050h,040h,051h,0e9h,002h,0d3h,098h,0b9h,0d2h,008h,0d3h,0e9h,00eh,097h	; b81e  ..P@Q...........
	defb 0d2h,020h,000h,021h	; b82e

; ----------------------------------------------------------------------
; DATOS partitura_B832: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA0 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xb832..0xb833  (1 bytes)
DATA_partitura_B832:
	defb 0e9h	; b832

; ----------------------------------------------------------------------
; DATOS partitura_B833: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA0 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xb833..0xb839  (6 bytes)
DATA_partitura_B833:
	defb 002h,0d3h,0b8h,0d2h,009h,028h	; b833

; ----------------------------------------------------------------------
; DATOS partitura_B839: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA0 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xb839..0xb83a  (1 bytes)
DATA_partitura_B839:
	defb 0fah	; b839

; ----------------------------------------------------------------------
; DATOS partitura_B83A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA5 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (10 bytes)
;   0xb83a..0xb844  (10 bytes)
DATA_partitura_B83A:
	defb 0feh,004h,0e9h,002h,0d0h,0b1h,0d1h,071h,061h,061h	; b83a  .......qaa

; ----------------------------------------------------------------------
; DATOS partitura_B844: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA5 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xb844..0xb848  (4 bytes)
DATA_partitura_B844:
	defb 071h,081h,0e9h,004h	; b844

; ----------------------------------------------------------------------
; DATOS partitura_B848: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA5 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xb848..0xb859  (17 bytes)
DATA_partitura_B848:
	defb 091h,091h,091h,0d0h,0e9h,006h,0b1h,011h,0d1h,0e9h,004h,060h,060h,060h,070h,080h	; b848  ...........```p.
	defb 090h	; b858

; ----------------------------------------------------------------------
; DATOS partitura_B859: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA5 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (39 bytes)
;   0xb859..0xb880  (39 bytes)
DATA_partitura_B859:
	defb 0e9h,006h,0d0h,0b3h,073h,071h,011h,0b1h,011h,0e9h,004h,0d1h,091h,091h,091h,0d0h	; b859  ....sq..........
	defb 0e9h,006h,0b1h,011h,0e9h,004h,0d1h,060h,060h,060h,070h,080h,090h,0e9h,006h,0d0h	; b869  .......```p.....
	defb 0b1h,011h,071h,011h,071h,071h,0e9h	; b879

; ----------------------------------------------------------------------
; DATOS partitura_B880: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA5 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xb880..0xb888  (8 bytes)
DATA_partitura_B880:
	defb 004h,0f5h,0d1h,070h,0fbh,012h,0f5h,060h	; b880  ...p...`

; ----------------------------------------------------------------------
; DATOS partitura_B888: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA5 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xb888..0xb890  (8 bytes)
DATA_partitura_B888:
	defb 0fbh,009h,0f5h,060h,0fbh,007h,063h,0ffh	; b888  ...`..c.

; ----------------------------------------------------------------------
; DATOS partitura_B890: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA5 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xb890..0xb896  (6 bytes)
DATA_partitura_B890:
	defb 0feh,001h,0e9h,006h,0eah,00ah	; b890

; ----------------------------------------------------------------------
; DATOS partitura_B896: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA5 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (22 bytes)
;   0xb896..0xb8ac  (22 bytes)
DATA_partitura_B896:
	defb 0ebh,00ah,017h,081h,0d3h,007h,007h,003h,053h,073h,0d4h,0a7h,0a7h,0a3h,0d3h,033h	; b896  ........Ss.....3
	defb 053h,0ebh,012h,022h,011h,0e9h	; b8a6

; ----------------------------------------------------------------------
; DATOS partitura_B8AC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA5 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xb8ac..0xb8af  (3 bytes)
DATA_partitura_B8AC:
	defb 009h,04fh,0ffh	; b8ac

; ----------------------------------------------------------------------
; DATOS partitura_B8AF: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA5 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (32 bytes)
;   0xb8af..0xb8cf  (32 bytes)
DATA_partitura_B8AF:
	defb 0feh,001h,0e9h,006h,0eah,008h,0ebh,087h,01ah,0f1h,0edh,024h,0f0h,00fh,072h,0d3h	; b8af  ...........$..r.
	defb 05fh,0abh,08fh,0d2h,01bh,0edh,004h,0ebh,081h,012h,011h,0e9h,009h,0d2h,08fh,0ffh	; b8bf  _...............

; ----------------------------------------------------------------------
; DATOS partitura_B8CF: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA5 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xb8cf..0xb8d2  (3 bytes)
DATA_partitura_B8CF:
	defb 0feh,001h,0f8h	; b8cf

; ----------------------------------------------------------------------
; DATOS partitura_B8D2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA5 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (33 bytes)
;   0xb8d2..0xb8f3  (33 bytes)
DATA_partitura_B8D2:
	defb 011h,0e9h,006h,0eah,00fh,0edh,019h,0ebh,089h,027h,051h,0f0h,00fh,064h,0d3h,0afh	; b8d2  .........'Q..d..
	defb 0d2h,03bh,01fh,08bh,0e9h,009h,0edh,026h,0ebh,081h,016h,051h,0f0h,00fh,073h,03fh	; b8e2  .......&...Q..s?
	defb 0ffh	; b8f2

; ----------------------------------------------------------------------
; DATOS partitura_B8F3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA5 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xb8f3..0xb8f5  (2 bytes)
DATA_partitura_B8F3:
	defb 0feh,001h	; b8f3

; ----------------------------------------------------------------------
; DATOS partitura_B8F5: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA5 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (38 bytes)
;   0xb8f5..0xb91b  (38 bytes)
DATA_partitura_B8F5:
	defb 0f6h,0e9h,006h,0eah,00fh,0ebh,009h,037h,003h,0f4h,04bh,04bh,04bh,023h,0d4h,007h	; b8f5  .......7..KKK#..
	defb 007h,003h,053h,073h,0d5h,0a7h,0a7h,0a3h,0d4h,033h,053h,0ebh,012h,022h,021h,0e9h	; b905  ..Ss.....3S.."!.
	defb 009h,0f6h,0f1h,009h,002h,001h	; b915

; ----------------------------------------------------------------------
; DATOS partitura_B91B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA5 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xb91b..0xb91f  (4 bytes)
DATA_partitura_B91B:
	defb 009h,0d4h,04fh,0ffh	; b91b

; ----------------------------------------------------------------------
; DATOS partitura_B91F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA5 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xb91f..0xb930  (17 bytes)
DATA_partitura_B91F:
	defb 0feh,001h,0f8h,011h,0e9h,006h,0c2h,0eeh,081h,0eah,009h,0edh,026h,0ebh,087h,017h	; b91f  ............&...
	defb 091h	; b92f

; ----------------------------------------------------------------------
; DATOS partitura_B930: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA5 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (27 bytes)
;   0xb930..0xb94b  (27 bytes)
DATA_partitura_B930:
	defb 0f0h,00fh,064h,0d3h,0afh,0d2h,03bh,01fh,08bh,0e9h,009h,0eah,007h,0edh,016h,0ebh	; b930  ..d.............
	defb 081h,016h,071h,0e9h,009h,0f0h,00fh,072h,0d2h,03dh,0ffh	; b940  ..q....r.=.

; ----------------------------------------------------------------------
; DATOS partitura_B94B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA5 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xb94b..0xb95d  (18 bytes)
DATA_partitura_B94B:
	defb 0feh,001h,0f8h,054h,0e9h,006h,0eah,007h,0ebh,00ah,02dh,001h,0d9h,0d7h,002h,001h	; b94b  ...T......-.....
	defb 0f0h,00fh	; b95b

; ----------------------------------------------------------------------
; DATOS partitura_B95D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA5 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (32 bytes)
;   0xb95d..0xb97d  (32 bytes)
DATA_partitura_B95D:
	defb 031h,0d1h,001h,021h,031h,001h,073h,001h,083h,001h,0a1h,031h,081h,071h,003h,031h	; b95d  1..!1.s....1.q.1
	defb 0d2h,0a1h,0d1h,031h,0d2h,081h,0d1h,031h,0d2h,073h,0d1h,031h,0d2h,081h,0d1h,031h	; b96d  ...1...1.s.1...1

; ----------------------------------------------------------------------
; DATOS partitura_B97D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA5 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xb97d..0xb97e  (1 bytes)
DATA_partitura_B97D:
	defb 0d2h	; b97d

; ----------------------------------------------------------------------
; DATOS partitura_B97E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA5 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xb97e..0xb990  (18 bytes)
DATA_partitura_B97E:
	defb 0a1h,0d1h,031h,0f8h,011h,0eah,00fh,0edh,0a3h,0ebh,087h,017h,071h,0e9h,009h,0d2h	; b97e  ..1.........q...
	defb 0afh,0ffh	; b98e

; ----------------------------------------------------------------------
; DATOS partitura_B990: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA5 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (46 bytes)
;   0xb990..0xb9be  (46 bytes)
DATA_partitura_B990:
	defb 0feh,001h,0f8h,054h,0e9h,006h,0c0h,0eeh,081h,0eah,005h,0ebh,001h,01dh,001h,0f0h	; b990  ...T............
	defb 00fh,031h,0d1h,001h,021h,031h,001h,073h,001h,083h,001h,0a1h,031h,081h,071h,003h	; b9a0  .1..!1.s....1.q.
	defb 031h,0d2h,0a1h,0d1h,031h,0d2h,081h,0d1h,031h,0d2h,073h,0d1h,031h,0d2h	; b9b0  1...1...1.s.1.

; ----------------------------------------------------------------------
; DATOS partitura_B9BE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA5 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (23 bytes)
;   0xb9be..0xb9d5  (23 bytes)
DATA_partitura_B9BE:
	defb 081h,0d1h,031h,0d2h,0a1h,0d1h,030h,0efh,0f8h,011h,0e9h,009h,0eah,00eh,0edh,0a2h	; b9be  ..1...0.........
	defb 0ebh,087h,017h,071h,0d3h,08fh,0ffh	; b9ce

; ----------------------------------------------------------------------
; DATOS partitura_B9D5: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xb9d5..0xb9d6  (1 bytes)
DATA_partitura_B9D5:
	defb 0feh	; b9d5

; ----------------------------------------------------------------------
; DATOS partitura_B9D6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xb9d6..0xb9e7  (17 bytes)
DATA_partitura_B9D6:
	defb 001h,0e9h,006h,0eeh,008h,0eah,008h,0ebh,007h,01bh,071h,0d4h,007h,0d5h,08fh,0d4h	; b9d6  ..........q.....
	defb 040h	; b9e6

; ----------------------------------------------------------------------
; DATOS partitura_B9E7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xb9e7..0xb9ee  (7 bytes)
DATA_partitura_B9E7:
	defb 030h,020h,0e9h,008h,01fh,0c0h,0ffh	; b9e7

; ----------------------------------------------------------------------
; DATOS partitura_B9EE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (43 bytes)
;   0xb9ee..0xba19  (43 bytes)
DATA_partitura_B9EE:
	defb 0feh,001h,0e9h,006h,0c2h,0eeh,00ah,0eah,004h,0ech,0d6h,006h,001h,0f0h,00fh,043h	; b9ee  ...............C
	defb 0d4h,007h,0eah,005h,0eeh,082h,0ebh,006h,024h,021h,0d2h,0b0h,080h,050h,020h,080h	; b9fe  ........$!...P .
	defb 050h,020h,0d3h,0b0h,0d2h,050h,020h,0d3h,0b0h,080h,0d2h	; ba0e  P ...P ....

; ----------------------------------------------------------------------
; DATOS partitura_BA19: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (19 bytes)
;   0xba19..0xba2c  (19 bytes)
DATA_partitura_BA19:
	defb 020h,0d3h,0b0h,080h,050h,040h,030h,020h,001h,010h,030h,070h,0a0h,0d2h,010h,040h	; ba19   ...P@0 ..0p...@
	defb 070h,0a8h,0ffh	; ba29

; ----------------------------------------------------------------------
; DATOS partitura_BA2C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xba2c..0xba34  (8 bytes)
DATA_partitura_BA2C:
	defb 0feh,001h,0e9h,006h,0c3h,0eeh,00ah,0eah	; ba2c  ........

; ----------------------------------------------------------------------
; DATOS partitura_BA34: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (24 bytes)
;   0xba34..0xba4c  (24 bytes)
DATA_partitura_BA34:
	defb 004h,0ech,0d6h,006h,001h,0f0h,00fh,043h,0d4h,007h,0eah,005h,0eeh,002h,0ebh,006h	; ba34  .......C........
	defb 024h,021h,0d2h,0b0h,080h,050h,020h,080h	; ba44  $!...P .

; ----------------------------------------------------------------------
; DATOS partitura_BA4C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (27 bytes)
;   0xba4c..0xba67  (27 bytes)
DATA_partitura_BA4C:
	defb 050h,020h,0d3h,0b0h,0d2h,050h,020h,0d3h,0b0h,080h,0d2h,020h,0d3h,0b0h,080h,050h	; ba4c  P ...P .... ...P
	defb 040h,030h,020h,001h,010h,030h,070h,0a0h,0d2h,010h,040h	; ba5c  @0 ..0p...@

; ----------------------------------------------------------------------
; DATOS partitura_BA67: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xba67..0xba6a  (3 bytes)
DATA_partitura_BA67:
	defb 070h,0a8h,0ffh	; ba67

; ----------------------------------------------------------------------
; DATOS partitura_BA6A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (32 bytes)
;   0xba6a..0xba8a  (32 bytes)
DATA_partitura_BA6A:
	defb 0feh,001h,0f8h,04bh,0e9h,006h,0eah,00fh,0edh,01ch,0ebh,089h,02bh,071h,0dbh,004h	; ba6a  ...K........+q..
	defb 0d6h,006h,001h,0f0h,00fh,043h,0d4h,007h,0d5h,08fh,0d4h,040h,030h,020h,0e9h,008h	; ba7a  .....C.....@0 ..

; ----------------------------------------------------------------------
; DATOS partitura_BA8A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xba8a..0xba95  (11 bytes)
DATA_partitura_BA8A:
	defb 0edh,01ch,0ebh,089h,02bh,071h,0dbh,001h,01fh,0c0h,0ffh	; ba8a  ....+q.....

; ----------------------------------------------------------------------
; DATOS partitura_BA95: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (24 bytes)
;   0xba95..0xbaad  (24 bytes)
DATA_partitura_BA95:
	defb 0feh,001h,0f6h,0f8h,047h,0e9h,006h,0eah,00ch,0edh,02ch,0ebh,089h,02bh,021h,0dbh	; ba95  ....G.....,..+!.
	defb 002h,0d6h,006h,001h,0f0h,00fh,063h,0d0h	; baa5  ......c.

; ----------------------------------------------------------------------
; DATOS partitura_BAAD: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xbaad..0xbabe  (17 bytes)
DATA_partitura_BAAD:
	defb 070h,030h,000h,0d1h,0b0h,070h,030h,000h,0d2h,0b0h,0eah,00bh,0edh,02ch,0ebh,087h	; baad  p0...p0......,..
	defb 017h	; babd

; ----------------------------------------------------------------------
; DATOS partitura_BABE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (28 bytes)
;   0xbabe..0xbada  (28 bytes)
DATA_partitura_BABE:
	defb 031h,081h,0d1h,021h,0d2h,0b1h,0dbh,004h,0d1h,059h,0dbh,002h,040h,030h,020h,0edh	; babe  1..!.....Y..@0 .
	defb 02ch,0ebh,087h,027h,061h,0dbh,001h,0e9h,008h,01fh,0c0h,0ffh	; bace  ,..'a.......

; ----------------------------------------------------------------------
; DATOS partitura_BADA: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (15 bytes)
;   0xbada..0xbae9  (15 bytes)
DATA_partitura_BADA:
	defb 0feh,001h,0f8h,04bh,0e9h,006h,0eah,00ah,0eeh,088h,0edh,016h,0ebh,089h,01bh	; bada  ...K...........

; ----------------------------------------------------------------------
; DATOS partitura_BAE9: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (43 bytes)
;   0xbae9..0xbb14  (43 bytes)
DATA_partitura_BAE9:
	defb 071h,0dbh,003h,0d6h,006h,001h,0f0h,00fh,043h,0d4h,007h,0d8h,0f0h,000h,0efh,0dch	; bae9  q.......C.......
	defb 0f8h,047h,0eah,00ah,0ebh,00ah,03bh,021h,0d2h,0b0h,080h,050h,020h,080h,050h,020h	; baf9  .G.....!...P .P
	defb 0d3h,0b0h,0d2h,050h,020h,0d3h,0b0h,080h,0d2h,020h,0d3h	; bb09  ...P .... .

; ----------------------------------------------------------------------
; DATOS partitura_BB14: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xbb14..0xbb15  (1 bytes)
DATA_partitura_BB14:
	defb 0b0h	; bb14

; ----------------------------------------------------------------------
; DATOS partitura_BB15: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xbb15..0xbb2e  (25 bytes)
DATA_partitura_BB15:
	defb 080h,050h,040h,030h,020h,001h,010h,030h,070h,0a0h,0d2h,010h,040h,070h,0f0h,00fh	; bb15  .P@0 ..0p...@p..
	defb 022h,0edh,018h,0ebh,083h,037h,031h,0abh,0ffh	; bb25  "....71..

; ----------------------------------------------------------------------
; DATOS partitura_BB2E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (27 bytes)
;   0xbb2e..0xbb49  (27 bytes)
DATA_partitura_BB2E:
	defb 0feh,001h,0f8h,047h,0e9h,006h,0eah,00ch,0edh,029h,0ebh,089h,02bh,021h,0dbh,002h	; bb2e  ...G.....)..+!..
	defb 0d6h,006h,001h,0f0h,00fh,062h,0d0h,030h,000h,0d1h,070h	; bb3e  .....b.0..p

; ----------------------------------------------------------------------
; DATOS partitura_BB49: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (32 bytes)
;   0xbb49..0xbb69  (32 bytes)
DATA_partitura_BB49:
	defb 060h,030h,000h,0d2h,070h,060h,0eah,00bh,0edh,01ch,0ebh,087h,017h,031h,051h,0b1h	; bb49  `0..p`.......1Q.
	defb 081h,0dbh,004h,0d1h,029h,0dbh,002h,010h,000h,0d2h,0b0h,0edh,02ch,0ebh,087h,027h	; bb59  ....).......,..'

; ----------------------------------------------------------------------
; DATOS partitura_BB69: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xbb69..0xbb71  (8 bytes)
DATA_partitura_BB69:
	defb 061h,0dbh,001h,0e9h,008h,07fh,0c0h,0ffh	; bb69  a.......

; ----------------------------------------------------------------------
; DATOS partitura_BB71: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xbb71..0xbb73  (2 bytes)
DATA_partitura_BB71:
	defb 0feh,001h	; bb71

; ----------------------------------------------------------------------
; DATOS partitura_BB73: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (40 bytes)
;   0xbb73..0xbb9b  (40 bytes)
DATA_partitura_BB73:
	defb 0f8h,047h,0e9h,006h,0c2h,0eeh,081h,0eah,007h,0edh,015h,0ebh,089h,01bh,021h,0dbh	; bb73  .G............!.
	defb 001h,0d6h,006h,001h,0f0h,00fh,053h,0d0h,070h,030h,000h,0d1h,0b0h,070h,030h,000h	; bb83  ......S.p0...p0.
	defb 0d2h,0b0h,0eah,006h,0edh,015h,0ebh,087h	; bb93  ........

; ----------------------------------------------------------------------
; DATOS partitura_BB9B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xbb9b..0xbbac  (17 bytes)
DATA_partitura_BB9B:
	defb 017h,041h,081h,0d1h,021h,0d2h,0b1h,0d1h,059h,040h,030h,020h,0e9h,008h,01dh,0c0h	; bb9b  .A..!...Y@0 ....
	defb 0ffh	; bbab

; ----------------------------------------------------------------------
; DATOS partitura_BBAC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x98 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (10 bytes)
;   0xbbac..0xbbb6  (10 bytes)
DATA_partitura_BBAC:
	defb 0feh,002h,0e3h,005h,0f5h,0e4h,00eh,040h,020h,0e4h	; bbac  .......@ .

; ----------------------------------------------------------------------
; DATOS partitura_BBB6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x98 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (13 bytes)
;   0xbbb6..0xbbc3  (13 bytes)
DATA_partitura_BBB6:
	defb 010h,020h,023h,0fbh,010h,0f5h,0e4h,00eh,050h,020h,0e4h,010h,030h	; bbb6  . #.....P ..0

; ----------------------------------------------------------------------
; DATOS partitura_BBC3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x98 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (49 bytes)
;   0xbbc3..0xbbf4  (49 bytes)
DATA_partitura_BBC3:
	defb 023h,0fbh,003h,0f5h,0e4h,00eh,060h,020h,0e4h,010h,040h,023h,0fbh,003h,0f5h,0e4h	; bbc3  #.....` ..@#....
	defb 00eh,070h,020h,0e4h,010h,050h,023h,0fbh,003h,0f5h,0e4h,00eh,080h,020h,0e4h,010h	; bbd3  .p ..P#...... ..
	defb 060h,023h,0fbh,004h,0e3h,004h,0f5h,0e4h,00eh,080h,020h,0e4h,010h,060h,023h,0fbh	; bbe3  `#........ ..`#.
	defb 010h	; bbf3

; ----------------------------------------------------------------------
; DATOS partitura_BBF4: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x98 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (40 bytes)
;   0xbbf4..0xbc1c  (40 bytes)
DATA_partitura_BBF4:
	defb 0e3h,003h,0f5h,0e4h,00eh,080h,020h,0e4h,010h,060h,023h,0fbh,044h,0feh,002h,0e3h	; bbf4  ...... ..`#.D...
	defb 002h,0f5h,0e4h,00eh,090h,01fh,0e4h,010h,070h,022h,0fbh,080h,0feh,002h,0e3h,002h	; bc04  ........p"......
	defb 0f5h,0e4h,00eh,090h,01fh,0e4h,010h,070h	; bc14  .......p

; ----------------------------------------------------------------------
; DATOS partitura_BC1C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x98 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (48 bytes)
;   0xbc1c..0xbc4c  (48 bytes)
DATA_partitura_BC1C:
	defb 022h,0fbh,004h,0f5h,0e4h,00eh,090h,01eh,0e4h,010h,070h,021h,0fbh,004h,0f5h,0e4h	; bc1c  ".........p!....
	defb 00eh,090h,01dh,0e4h,010h,070h,020h,0fbh,004h,0f5h,0e4h,00eh,090h,01ch,0e4h,010h	; bc2c  .....p .........
	defb 070h,01fh,0fbh,004h,0f5h,0e4h,00eh,090h,01bh,0e4h,010h,070h,01eh,0fbh,004h,0f5h	; bc3c  p..........p....

; ----------------------------------------------------------------------
; DATOS partitura_BC4C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x98 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (21 bytes)
;   0xbc4c..0xbc61  (21 bytes)
DATA_partitura_BC4C:
	defb 0e4h,00eh,090h,01ah,0e4h,010h,070h,01dh,0fbh,002h,0f5h,0e4h,00eh,090h,019h,0e4h	; bc4c  ......p.........
	defb 010h,070h,01ch,0fbh,0ffh	; bc5c

; ----------------------------------------------------------------------
; DATOS partitura_BC61: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x98 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (52 bytes)
;   0xbc61..0xbc95  (52 bytes)
DATA_partitura_BC61:
	defb 0feh,002h,0e2h,00ah,0f5h,000h,024h,0fbh,010h,0f5h,010h,024h,0fbh,003h,0f5h,020h	; bc61  ......$....$...
	defb 024h,0fbh,00ah,0e2h,008h,0f5h,020h,024h,0fbh,010h,0e2h,006h,0f5h,020h,024h,0fbh	; bc71  $..... $..... $.
	defb 044h,0feh,002h,0e2h,004h,0f5h,050h,024h,0fbh,080h,0feh,002h,0e2h,020h,030h,024h	; bc81  D.....P$..... 0$
	defb 0e2h,010h,040h,023h	; bc91

; ----------------------------------------------------------------------
; DATOS partitura_BC95: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x98 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (15 bytes)
;   0xbc95..0xbca4  (15 bytes)
DATA_partitura_BC95:
	defb 040h,022h,050h,021h,050h,020h,050h,01fh,050h,01eh,0f5h,050h,01dh,0fbh,0ffh	; bc95  @"P!P P.P..P...

; ----------------------------------------------------------------------
; DATOS partitura_BCA4: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x98 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (19 bytes)
;   0xbca4..0xbcb7  (19 bytes)
DATA_partitura_BCA4:
	defb 0feh,002h,0e2h,00ah,0f5h,000h,014h,0fbh,010h,0f5h,010h,014h,0fbh,003h,0f5h,020h	; bca4  ...............
	defb 014h,0fbh,00ah	; bcb4

; ----------------------------------------------------------------------
; DATOS partitura_BCB7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x98 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (26 bytes)
;   0xbcb7..0xbcd1  (26 bytes)
DATA_partitura_BCB7:
	defb 0e2h,008h,0f5h,020h,014h,0fbh,010h,0e2h,006h,0f5h,020h,014h,0fbh,044h,0feh,002h	; bcb7  ... ...... ..D..
	defb 0e2h,004h,0f5h,040h,014h,0fbh,080h,0feh,002h,0e2h	; bcc7  ...@......

; ----------------------------------------------------------------------
; DATOS partitura_BCD1: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x98 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xbcd1..0xbcd4  (3 bytes)
DATA_partitura_BCD1:
	defb 020h,030h,020h	; bcd1

; ----------------------------------------------------------------------
; DATOS partitura_BCD4: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x98 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (19 bytes)
;   0xbcd4..0xbce7  (19 bytes)
DATA_partitura_BCD4:
	defb 0e2h,010h,040h,01fh,040h,01eh,050h,01dh,050h,01ch,050h,01bh,050h,01ah,0f5h,050h	; bcd4  ..@.@.P.P.P.P..P
	defb 019h,0fbh,0ffh	; bce4

; ----------------------------------------------------------------------
; DATOS partitura_BCE7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x98 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (35 bytes)
;   0xbce7..0xbd0a  (35 bytes)
DATA_partitura_BCE7:
	defb 0feh,002h,0f8h,009h,0e2h,005h,0f5h,014h,020h,003h,023h,0fbh,010h,0f5h,024h,020h	; bce7  ........ .#...$
	defb 013h,023h,0fbh,003h,0f5h,034h,020h,023h,023h,0fbh,003h,0f5h,044h,020h,033h,023h	; bcf7  .#...4 ##...D 3#
	defb 0fbh,003h,0f5h	; bd07

; ----------------------------------------------------------------------
; DATOS partitura_BD0A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x98 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (46 bytes)
;   0xbd0a..0xbd38  (46 bytes)
DATA_partitura_BD0A:
	defb 054h,020h,043h,023h,0fbh,004h,0e2h,004h,0f5h,054h,020h,043h,023h,0fbh,010h,0f8h	; bd0a  T C#.....T C#...
	defb 04bh,0e2h,003h,0f5h,054h,020h,043h,023h,0fbh,011h,0f5h,064h,020h,053h,023h,0fbh	; bd1a  K...T C#...d S#.
	defb 011h,0f5h,074h,020h,063h,023h,0fbh,011h,0f5h,084h,020h,073h,023h,0fbh	; bd2a  ..t c#.... s#.

; ----------------------------------------------------------------------
; DATOS partitura_BD38: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x98 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (27 bytes)
;   0xbd38..0xbd53  (27 bytes)
DATA_partitura_BD38:
	defb 011h,0feh,002h,0f8h,04bh,0e2h,002h,0f5h,094h,020h,083h,023h,0fbh,080h,0feh,002h	; bd38  ....K.... .#....
	defb 0f8h,04bh,0e2h,002h,0f5h,094h,020h,083h,023h,0fbh,0ffh	; bd48  .K.... .#..

; ----------------------------------------------------------------------
; DATOS partitura_BD53: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x98 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (35 bytes)
;   0xbd53..0xbd76  (35 bytes)
DATA_partitura_BD53:
	defb 0feh,002h,0f6h,0f8h,009h,0e2h,00ah,0f5h,005h,020h,0fbh,010h,0f5h,015h,020h,0fbh	; bd53  ......... .... .
	defb 003h,0f5h,025h,020h,0fbh,00ah,0e2h,008h,0f5h,025h,020h,0fbh,010h,0e2h,006h,0f5h	; bd63  ..% .....% .....
	defb 025h,020h,0fbh	; bd73

; ----------------------------------------------------------------------
; DATOS partitura_BD76: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x98 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (23 bytes)
;   0xbd76..0xbd8d  (23 bytes)
DATA_partitura_BD76:
	defb 044h,0feh,002h,0f8h,009h,0e2h,004h,0f5h,095h,020h,0fbh,080h,0feh,002h,0f8h,009h	; bd76  D........ ......
	defb 0e2h,004h,0f5h,095h,020h,0fbh,0ffh	; bd86

; ----------------------------------------------------------------------
; DATOS partitura_BD8D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x98 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (12 bytes)
;   0xbd8d..0xbd99  (12 bytes)
DATA_partitura_BD8D:
	defb 0feh,002h,0f8h,009h,0e2h,00ah,0f5h,007h,020h,0fbh,010h,0f5h	; bd8d  ........ ...

; ----------------------------------------------------------------------
; DATOS partitura_BD99: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x98 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (9 bytes)
;   0xbd99..0xbda2  (9 bytes)
DATA_partitura_BD99:
	defb 017h,020h,0fbh,003h,0f5h,027h,020h,0fbh,00ah	; bd99  . ...' ..

; ----------------------------------------------------------------------
; DATOS partitura_BDA2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x98 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (5 bytes)
;   0xbda2..0xbda7  (5 bytes)
DATA_partitura_BDA2:
	defb 0e2h,008h,0f5h,027h,020h	; bda2

; ----------------------------------------------------------------------
; DATOS partitura_BDA7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x98 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (9 bytes)
;   0xbda7..0xbdb0  (9 bytes)
DATA_partitura_BDA7:
	defb 0fbh,010h,0e2h,006h,0f5h,027h,020h,0fbh,044h	; bda7  .....' .D

; ----------------------------------------------------------------------
; DATOS partitura_BDB0: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x98 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (22 bytes)
;   0xbdb0..0xbdc6  (22 bytes)
DATA_partitura_BDB0:
	defb 0feh,002h,0f8h,009h,0e2h,004h,0f5h,097h,020h,0fbh,080h,0feh,002h,0f8h,009h,0e2h	; bdb0  ........ .......
	defb 004h,0f5h,097h,020h,0fbh,0ffh	; bdc0

; ----------------------------------------------------------------------
; DATOS partitura_BDC6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x98 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xbdc6..0xbdc8  (2 bytes)
DATA_partitura_BDC6:
	defb 0feh,002h	; bdc6

; ----------------------------------------------------------------------
; DATOS partitura_BDC8: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x98 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (37 bytes)
;   0xbdc8..0xbded  (37 bytes)
DATA_partitura_BDC8:
	defb 0f8h,009h,0e2h,00ah,0f5h,005h,010h,0fbh,010h,0f5h,015h,010h,0fbh,003h,0f5h,025h	; bdc8  ...............%
	defb 010h,0fbh,00ah,0e2h,008h,0f5h,025h,010h,0fbh,010h,0e2h,006h,0f5h,025h,010h,0fbh	; bdd8  ......%......%..
	defb 044h,0feh,002h,0f8h,009h	; bde8

; ----------------------------------------------------------------------
; DATOS partitura_BDED: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x98 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xbded..0xbdff  (18 bytes)
DATA_partitura_BDED:
	defb 0e2h,004h,0f5h,065h,010h,0fbh,080h,0feh,002h,0f8h,009h,0e2h,004h,0f5h,065h,010h	; bded  ...e..........e.
	defb 0fbh,0ffh	; bdfd

; ----------------------------------------------------------------------
; DATOS partitura_BDFF: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x98 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (28 bytes)
;   0xbdff..0xbe1b  (28 bytes)
DATA_partitura_BDFF:
	defb 0feh,002h,0f8h,009h,0e2h,00ah,0f5h,007h,010h,0fbh,010h,0f5h,017h,010h,0fbh,003h	; bdff  ................
	defb 0f5h,027h,010h,0fbh,00ah,0e2h,008h,0f5h,027h,010h,0fbh,010h	; be0f  .'......'...

; ----------------------------------------------------------------------
; DATOS partitura_BE1B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x98 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (29 bytes)
;   0xbe1b..0xbe38  (29 bytes)
DATA_partitura_BE1B:
	defb 0e2h,006h,0f5h,027h,010h,0fbh,044h,0feh,002h,0f8h,009h,0e2h,004h,0f5h,067h,010h	; be1b  ...'..D.......g.
	defb 0fbh,080h,0feh,002h,0f8h,009h,0e2h,004h,0f5h,067h,010h,0fbh,0ffh	; be2b  .........g...

; ----------------------------------------------------------------------
; DATOS partitura_BE38: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x93, 0x98 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xbe38..0xbe3e  (6 bytes)
DATA_partitura_BE38:
	defb 0feh,002h,0f9h,015h,0bfh,0ffh	; be38

; ----------------------------------------------------------------------
; DATOS partitura_BE3E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x93 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xbe3e..0xbe44  (6 bytes)
DATA_partitura_BE3E:
	defb 0feh,002h,0f9h,00fh,0bfh,0ffh	; be3e

; ----------------------------------------------------------------------
; DATOS partitura_BE44: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x93 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xbe44..0xbe47  (3 bytes)
DATA_partitura_BE44:
	defb 0feh,002h,0e2h	; be44

; ----------------------------------------------------------------------
; DATOS partitura_BE47: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x93 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xbe47..0xbe4b  (4 bytes)
DATA_partitura_BE47:
	defb 001h,0a9h,000h,067h	; be47

; ----------------------------------------------------------------------
; DATOS partitura_BE4B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x93 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xbe4b..0xbe4e  (3 bytes)
DATA_partitura_BE4B:
	defb 010h,06ch,000h	; be4b

; ----------------------------------------------------------------------
; DATOS partitura_BE4E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x93 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xbe4e..0xbe59  (11 bytes)
DATA_partitura_BE4E:
	defb 064h,080h,057h,000h,058h,000h,049h,080h,03ah,080h,0ffh	; be4e  d.W.X.I.:..

; ----------------------------------------------------------------------
; DATOS partitura_BE59: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x93 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xbe59..0xbe5d  (4 bytes)
DATA_partitura_BE59:
	defb 0feh,002h,0e0h,002h	; be59

; ----------------------------------------------------------------------
; DATOS partitura_BE5D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x93 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (13 bytes)
;   0xbe5d..0xbe6a  (13 bytes)
DATA_partitura_BE5D:
	defb 0feh,002h,0f8h,04bh,0e2h,001h,0c2h,000h,0c3h,010h,0a2h,000h,0a1h	; be5d  ...K.........

; ----------------------------------------------------------------------
; DATOS partitura_BE6A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x93 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xbe6a..0xbe83  (25 bytes)
DATA_partitura_BE6A:
	defb 080h,0a4h,000h,0a3h,000h,0a2h,080h,0a3h,080h,0a4h,000h,0a5h,000h,0a4h,000h,0a5h	; be6a  ................
	defb 080h,0a4h,000h,0a5h,080h,0a6h,000h,0a7h,080h	; be7a  .........

; ----------------------------------------------------------------------
; DATOS partitura_BE83: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x93 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (35 bytes)
;   0xbe83..0xbea6  (35 bytes)
DATA_partitura_BE83:
	defb 0a8h,000h,042h,000h,043h,010h,042h,000h,041h,080h,044h,000h,043h,000h,042h,080h	; be83  ..B.C.B.A.D.C.B.
	defb 043h,080h,044h,000h,045h,000h,044h,000h,045h,080h,044h,000h,045h,080h,046h,000h	; be93  C.D.E.D.E.D.E.F.
	defb 047h,080h,048h	; bea3

; ----------------------------------------------------------------------
; DATOS partitura_BEA6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x93 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xbea6..0xbeae  (8 bytes)
DATA_partitura_BEA6:
	defb 000h,022h,000h,023h,010h,022h,000h,021h	; bea6  .".#.".!

; ----------------------------------------------------------------------
; DATOS partitura_BEAE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x93 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xbeae..0xbec7  (25 bytes)
DATA_partitura_BEAE:
	defb 080h,024h,000h,023h,000h,022h,080h,023h,080h,024h,000h,025h,000h,024h,000h,025h	; beae  .$.#.".#.$.%.$.%
	defb 080h,024h,000h,025h,080h,026h,000h,027h,080h	; bebe  .$.%.&.'.

; ----------------------------------------------------------------------
; DATOS partitura_BEC7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x93 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xbec7..0xbece  (7 bytes)
DATA_partitura_BEC7:
	defb 028h,000h,002h,000h,003h,010h,002h	; bec7

; ----------------------------------------------------------------------
; DATOS partitura_BECE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x93 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (12 bytes)
;   0xbece..0xbeda  (12 bytes)
DATA_partitura_BECE:
	defb 000h,001h,080h,004h,000h,003h,000h,002h,080h,003h,080h,004h	; bece  ............

; ----------------------------------------------------------------------
; DATOS partitura_BEDA: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x93 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xbeda..0xbeec  (18 bytes)
DATA_partitura_BEDA:
	defb 000h,005h,000h,004h,000h,005h,080h,004h,000h,005h,080h,006h,000h,007h,080h,008h	; beda  ................
	defb 000h,0ffh	; beea

; ----------------------------------------------------------------------
; DATOS partitura_BEEC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x93 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xbeec..0xbef2  (6 bytes)
DATA_partitura_BEEC:
	defb 0feh,002h,0f8h,028h,0e2h,001h	; beec

; ----------------------------------------------------------------------
; DATOS partitura_BEF2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x93 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xbef2..0xbf03  (17 bytes)
DATA_partitura_BEF2:
	defb 0c9h,000h,087h,010h,08ch,000h,084h,080h,087h,000h,088h,000h,089h,080h,08ah,080h	; bef2  ................
	defb 0ffh	; bf02

; ----------------------------------------------------------------------
; DATOS partitura_BF03: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x93 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xbf03..0xbf09  (6 bytes)
DATA_partitura_BF03:
	defb 0feh,002h,0f9h,015h,0bfh,0ffh	; bf03

; ----------------------------------------------------------------------
; DATOS partitura_BF09: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x93 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xbf09..0xbf0f  (6 bytes)
DATA_partitura_BF09:
	defb 0feh,002h,0f9h,00fh,0bfh,0ffh	; bf09

; ----------------------------------------------------------------------
; DATOS partitura_BF0F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x93 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xbf0f..0xbf12  (3 bytes)
DATA_partitura_BF0F:
	defb 0feh,002h,0f8h	; bf0f

; ----------------------------------------------------------------------
; DATOS partitura_BF12: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x93, 0x98 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (28 bytes)
;   0xbf12..0xbf2e  (28 bytes)
DATA_partitura_BF12:
	defb 009h,0e0h,005h,0feh,002h,0f8h,009h,0e0h,002h,0e2h,001h,0c3h,000h,086h,010h,08ah	; bf12  ................
	defb 000h,085h,080h,085h,000h,087h,000h,086h,080h,085h,080h,0fah	; bf22  ............

; ----------------------------------------------------------------------
; DATOS partitura_BF2E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xbf2e..0xbf34  (6 bytes)
DATA_partitura_BF2E:
	defb 0feh,002h,0f8h,00dh,0e2h,010h	; bf2e

; ----------------------------------------------------------------------
; DATOS partitura_BF34: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xbf34..0xbf35  (1 bytes)
DATA_partitura_BF34:
	defb 0f5h	; bf34

; ----------------------------------------------------------------------
; DATOS partitura_BF35: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xbf35..0xbf39  (4 bytes)
DATA_partitura_BF35:
	defb 050h,02dh,0fbh,0ffh	; bf35

; ----------------------------------------------------------------------
; DATOS partitura_BF39: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xbf39..0xbf44  (11 bytes)
DATA_partitura_BF39:
	defb 0feh,002h,0f8h,00dh,0e2h,010h,0f5h,050h,022h,0fbh,0ffh	; bf39  .......P"..

; ----------------------------------------------------------------------
; DATOS partitura_BF44: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xbf44..0xbf4c  (8 bytes)
DATA_partitura_BF44:
	defb 0feh,002h,0f6h,0f8h,005h,0f5h,0e2h,004h	; bf44  ........

; ----------------------------------------------------------------------
; DATOS partitura_BF4C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (5 bytes)
;   0xbf4c..0xbf51  (5 bytes)
DATA_partitura_BF4C:
	defb 051h,0deh,0e2h,001h,061h	; bf4c

; ----------------------------------------------------------------------
; DATOS partitura_BF51: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (5 bytes)
;   0xbf51..0xbf56  (5 bytes)
DATA_partitura_BF51:
	defb 0c0h,061h,0c1h,0fbh,0ffh	; bf51

; ----------------------------------------------------------------------
; DATOS partitura_BF56: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xbf56..0xbf5a  (4 bytes)
DATA_partitura_BF56:
	defb 0feh,002h,0e0h,006h	; bf56

; ----------------------------------------------------------------------
; DATOS partitura_BF5A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xbf5a..0xbf5e  (4 bytes)
DATA_partitura_BF5A:
	defb 0feh,002h,0e0h,004h	; bf5a

; ----------------------------------------------------------------------
; DATOS partitura_BF5E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (27 bytes)
;   0xbf5e..0xbf79  (27 bytes)
DATA_partitura_BF5E:
	defb 0feh,002h,0f8h,01ah,0e2h,003h,050h,010h,050h,011h,050h,012h,050h,013h,050h,014h	; bf5e  ......P.P.P.P.P.
	defb 050h,015h,060h,016h,070h,017h,080h,018h,090h,019h,0a0h	; bf6e  P.`.p......

; ----------------------------------------------------------------------
; DATOS partitura_BF79: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (39 bytes)
;   0xbf79..0xbfa0  (39 bytes)
DATA_partitura_BF79:
	defb 01ah,0b0h,01bh,0b0h,01ch,0b0h,01dh,0b0h,01eh,0b0h,01fh,0b0h,020h,0b0h,021h,0b0h	; bf79  ............ .!.
	defb 022h,0b0h,023h,0b0h,024h,0b0h,025h,0b0h,026h,0b0h,027h,0b0h,028h,0b0h,029h,0b0h	; bf89  ".#.$.%.&.'.(.).
	defb 02ah,0b0h,02bh,0b0h,02ch,0b0h,02dh	; bf99

; ----------------------------------------------------------------------
; DATOS partitura_BFA0: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (75 bytes)
;   0xbfa0..0xbfeb  (75 bytes)
DATA_partitura_BFA0:
	defb 0b0h,02eh,0b0h,02fh,0b0h,030h,0e2h,006h,0b0h,031h,0b0h,032h,0b0h,033h,0b0h,034h	; bfa0  .../.0...1.2.3.4
	defb 0b0h,035h,0b0h,036h,0b0h,037h,0b0h,038h,0b0h,039h,0b0h,03ah,0b0h,03bh,0b0h,03ch	; bfb0  .5.6.7.8.9.:...<
	defb 0b0h,03dh,0b0h,03eh,0b0h,03fh,0a0h,040h,0a0h,041h,0a0h,042h,0e2h,009h,0a0h,043h	; bfc0  .=.>.?.@.A.B...C
	defb 0a0h,044h,0a0h,045h,0a0h,046h,0a0h,047h,0a0h,048h,0a0h,049h,0a0h,04ah,0a0h,04bh	; bfd0  .D.E.F.G.H.I.J.K
	defb 0a0h,04ch,0a0h,04dh,0a0h,04eh,0a0h,04fh,0a0h,050h,0ffh	; bfe0  .L.M.N.O.P.

; ----------------------------------------------------------------------
; DATOS sin identificar  0xbfeb..0xc000  (21 bytes)
DATA_BFEB:
	defb 004h,0d6h,006h,001h,0f0h,00bh,072h,0f5h,0d3h,035h,039h,03fh,035h,035h,033h,03fh	; bfeb  ......r..59?553?
	defb 0fbh,002h,0fah,07bh,00ch	; bffb
