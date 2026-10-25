; ==========================================================================
; METAL GEAR 2 SOLID SNAKE - Konami (1990) - MSX2 - MegaROM RC-767 de 512 KB (Konami SCC) - banco 59 (se ejecuta en 0xa000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x0a000


; ----------------------------------------------------------------------
; DATOS partitura_A000: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xa000..0xa006  (6 bytes)
DATA_partitura_A000:
	defb 0feh,001h,0e9h,003h,0c2h,0e9h	; a000

; ----------------------------------------------------------------------
; DATOS partitura_A006: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (16 bytes)
;   0xa006..0xa016  (16 bytes)
DATA_partitura_A006:
	defb 002h,0eah,008h,0d2h,060h,0d8h,090h,0d1h,000h,030h,060h,090h,0d0h,000h,030h,0e9h	; a006  ....`....0`...0.

; ----------------------------------------------------------------------
; DATOS partitura_A016: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (10 bytes)
;   0xa016..0xa020  (10 bytes)
DATA_partitura_A016:
	defb 003h,0f0h,003h,041h,0ebh,002h,038h,001h,06ah,0ffh	; a016  ...A..8.j.

; ----------------------------------------------------------------------
; DATOS partitura_A020: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xa020..0xa023  (3 bytes)
DATA_partitura_A020:
	defb 0feh,001h,0e9h	; a020

; ----------------------------------------------------------------------
; DATOS partitura_A023: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xa023..0xa02e  (11 bytes)
DATA_partitura_A023:
	defb 003h,0c0h,0e9h,002h,0eah,009h,0d2h,060h,0d8h,090h,0d2h	; a023  .......`...

; ----------------------------------------------------------------------
; DATOS partitura_A02E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa02e..0xa02f  (1 bytes)
DATA_partitura_A02E:
	defb 000h	; a02e

; ----------------------------------------------------------------------
; DATOS partitura_A02F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xa02f..0xa040  (17 bytes)
DATA_partitura_A02F:
	defb 030h,060h,090h,0d1h,000h,030h,0e9h,003h,0f0h,003h,042h,0ebh,002h,038h,001h,06ch	; a02f  0`...0....B..8.l
	defb 0ffh	; a03f

; ----------------------------------------------------------------------
; DATOS partitura_A040: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xa040..0xa046  (6 bytes)
DATA_partitura_A040:
	defb 0feh,001h,0e9h,002h,0eah,009h	; a040

; ----------------------------------------------------------------------
; DATOS partitura_A046: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xa046..0xa051  (11 bytes)
DATA_partitura_A046:
	defb 0d6h,010h,010h,0d2h,000h,0d8h,030h,060h,090h,0d1h,000h	; a046  ......0`...

; ----------------------------------------------------------------------
; DATOS partitura_A051: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (13 bytes)
;   0xa051..0xa05e  (13 bytes)
DATA_partitura_A051:
	defb 030h,060h,090h,0e9h,003h,0f0h,003h,041h,0ebh,002h,038h,001h,0d0h	; a051  0`.....A..8..

; ----------------------------------------------------------------------
; DATOS partitura_A05E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa05e..0xa05f  (1 bytes)
DATA_partitura_A05E:
	defb 00dh	; a05e

; ----------------------------------------------------------------------
; DATOS partitura_A05F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa05f..0xa060  (1 bytes)
DATA_partitura_A05F:
	defb 0ffh	; a05f

; ----------------------------------------------------------------------
; DATOS partitura_A060: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (9 bytes)
;   0xa060..0xa069  (9 bytes)
DATA_partitura_A060:
	defb 0feh,001h,0f8h,009h,0e9h,002h,0eah,00fh,0d6h	; a060  .........

; ----------------------------------------------------------------------
; DATOS partitura_A069: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xa069..0xa082  (25 bytes)
DATA_partitura_A069:
	defb 010h,010h,0d3h,060h,0d8h,090h,0d2h,000h,030h,060h,090h,0d1h,000h,030h,0e9h,003h	; a069  ...`....0`...0..
	defb 0f0h,003h,042h,0ebh,002h,038h,001h,06dh,0ffh	; a079  ..B..8.m.

; ----------------------------------------------------------------------
; DATOS partitura_A082: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (13 bytes)
;   0xa082..0xa08f  (13 bytes)
DATA_partitura_A082:
	defb 0feh,001h,0f6h,0f8h,009h,0e9h,002h,0eah,00fh,0d6h,010h,010h,0d3h	; a082  .............

; ----------------------------------------------------------------------
; DATOS partitura_A08F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xa08f..0xa091  (2 bytes)
DATA_partitura_A08F:
	defb 030h,0d8h	; a08f

; ----------------------------------------------------------------------
; DATOS partitura_A091: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (12 bytes)
;   0xa091..0xa09d  (12 bytes)
DATA_partitura_A091:
	defb 060h,090h,0d2h,000h,030h,060h,090h,0d1h,000h,0e9h,003h,0f0h	; a091  `...0`......

; ----------------------------------------------------------------------
; DATOS partitura_A09D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa09d..0xa0a5  (8 bytes)
DATA_partitura_A09D:
	defb 003h,032h,0ebh,002h,038h,001h,03dh,0ffh	; a09d  .2..8.=.

; ----------------------------------------------------------------------
; DATOS partitura_A0A5: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (34 bytes)
;   0xa0a5..0xa0c7  (34 bytes)
DATA_partitura_A0A5:
	defb 0feh,001h,0f8h,009h,0e9h,002h,0eah,00fh,0d6h,010h,010h,0d3h,000h,0d8h,030h,060h	; a0a5  ..............0`
	defb 090h,0d2h,000h,030h,060h,090h,0e9h,003h,0f0h,003h,032h,0ebh,002h,038h,001h,0d1h	; a0b5  ...0`.....2..8..
	defb 00dh,0ffh	; a0c5

; ----------------------------------------------------------------------
; DATOS partitura_A0C7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (20 bytes)
;   0xa0c7..0xa0db  (20 bytes)
DATA_partitura_A0C7:
	defb 0feh,001h,0f8h,009h,0e9h,002h,0eah,00fh,0d6h,008h,008h,0d2h,060h,0d8h,090h,0d1h	; a0c7  ............`...
	defb 000h,030h,060h,090h	; a0d7

; ----------------------------------------------------------------------
; DATOS partitura_A0DB: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (14 bytes)
;   0xa0db..0xa0e9  (14 bytes)
DATA_partitura_A0DB:
	defb 0d0h,000h,030h,0e9h,003h,0f0h,003h,041h,0ebh,002h,038h,001h,06dh,0ffh	; a0db  ..0....A..8.m.

; ----------------------------------------------------------------------
; DATOS partitura_A0E9: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (10 bytes)
;   0xa0e9..0xa0f3  (10 bytes)
DATA_partitura_A0E9:
	defb 0feh,001h,0f8h,009h,0eeh,081h,0e9h,002h,0eah,00ah	; a0e9  ..........

; ----------------------------------------------------------------------
; DATOS partitura_A0F3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (26 bytes)
;   0xa0f3..0xa10d  (26 bytes)
DATA_partitura_A0F3:
	defb 0d6h,008h,008h,0d2h,060h,0d8h,090h,0d1h,000h,030h,060h,090h,0d0h,000h,030h,0e9h	; a0f3  ....`....0`...0.
	defb 003h,0f0h,003h,041h,0ebh,002h,038h,001h,06dh,0ffh	; a103  ...A..8.m.

; ----------------------------------------------------------------------
; DATOS partitura_A10D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (16 bytes)
;   0xa10d..0xa11d  (16 bytes)
DATA_partitura_A10D:
	defb 0feh,004h,0e9h,001h,0d1h,061h,061h,063h,063h,073h,073h,073h,083h,093h,093h,0feh	; a10d  .....aaccsss....

; ----------------------------------------------------------------------
; DATOS partitura_A11D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (23 bytes)
;   0xa11d..0xa134  (23 bytes)
DATA_partitura_A11D:
	defb 004h,0e9h,006h,0d0h,0f5h,0b1h,001h,071h,001h,0a1h,001h,071h,001h,0a1h,001h,071h	; a11d  .......q...q...q
	defb 021h,0fbh,004h,0feh,004h,0e9h,006h	; a12d

; ----------------------------------------------------------------------
; DATOS partitura_A134: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xa134..0xa136  (2 bytes)
DATA_partitura_A134:
	defb 0d0h,0f5h	; a134

; ----------------------------------------------------------------------
; DATOS partitura_A136: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (5 bytes)
;   0xa136..0xa13b  (5 bytes)
DATA_partitura_A136:
	defb 0b1h,001h,071h,001h,0a1h	; a136

; ----------------------------------------------------------------------
; DATOS partitura_A13B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (47 bytes)
;   0xa13b..0xa16a  (47 bytes)
DATA_partitura_A13B:
	defb 001h,071h,001h,0a1h,001h,071h,021h,0fbh,004h,0feh,004h,0e9h,006h,0d0h,001h,0b1h	; a13b  .q...q!.........
	defb 000h,000h,0a0h,0a0h,001h,021h,071h,0a0h,0a0h,000h,000h,0a0h,0a0h,071h,021h,0d1h	; a14b  .....!q......q!.
	defb 060h,070h,080h,090h,0d0h,0a0h,0a0h,071h,011h,021h,011h,021h,070h,070h,0a0h	; a15b  `p.....q.!.!pp.

; ----------------------------------------------------------------------
; DATOS partitura_A16A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xa16a..0xa170  (6 bytes)
DATA_partitura_A16A:
	defb 0a0h,071h,021h,011h,0a0h,0a0h	; a16a

; ----------------------------------------------------------------------
; DATOS partitura_A170: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (47 bytes)
;   0xa170..0xa19f  (47 bytes)
DATA_partitura_A170:
	defb 010h,020h,0a0h,0a0h,011h,021h,011h,021h,0d1h,060h,070h,080h,090h,0d0h,070h,070h	; a170  . ...!.!.`p...pp
	defb 070h,070h,071h,021h,0a0h,0a0h,021h,0a1h,021h,0e9h,001h,077h,077h,077h,0e9h,006h	; a180  ppq!..!.!..www..
	defb 071h,021h,070h,070h,000h,0a0h,0feh,004h,0e9h,006h,0d0h,070h,070h,0a0h,0a0h	; a190  q!pp.......pp..

; ----------------------------------------------------------------------
; DATOS partitura_A19F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (19 bytes)
;   0xa19f..0xa1b2  (19 bytes)
DATA_partitura_A19F:
	defb 000h,000h,0a0h,070h,070h,070h,0a0h,0a0h,000h,000h,0a0h,070h,070h,070h,0a0h,0a0h	; a19f  ...ppp.....ppp..
	defb 000h,000h,0a0h	; a1af

; ----------------------------------------------------------------------
; DATOS partitura_A1B2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa1b2..0xa1b3  (1 bytes)
DATA_partitura_A1B2:
	defb 070h	; a1b2

; ----------------------------------------------------------------------
; DATOS partitura_A1B3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xa1b3..0xa1b6  (3 bytes)
DATA_partitura_A1B3:
	defb 0e9h,001h,0d1h	; a1b3

; ----------------------------------------------------------------------
; DATOS partitura_A1B6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (13 bytes)
;   0xa1b6..0xa1c3  (13 bytes)
DATA_partitura_A1B6:
	defb 003h,003h,003h,003h,003h,003h,003h,003h,0d0h,073h,073h,073h,073h	; a1b6  .........ssss

; ----------------------------------------------------------------------
; DATOS partitura_A1C3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xa1c3..0xa1c6  (3 bytes)
DATA_partitura_A1C3:
	defb 0fdh,01ch,0a1h	; a1c3

; ----------------------------------------------------------------------
; DATOS partitura_A1C6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (13 bytes)
;   0xa1c6..0xa1d3  (13 bytes)
DATA_partitura_A1C6:
	defb 0feh,001h,0e9h,006h,0c5h,0feh,001h,0e9h,006h,0c2h,0eah,005h,0edh	; a1c6  .............

; ----------------------------------------------------------------------
; DATOS partitura_A1D3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (16 bytes)
;   0xa1d3..0xa1e3  (16 bytes)
DATA_partitura_A1D3:
	defb 082h,0ebh,082h,032h,004h,0f0h,00fh,017h,0d6h,004h,001h,0d2h,057h,0f0h,00fh,036h	; a1d3  ...2........W..6

; ----------------------------------------------------------------------
; DATOS partitura_A1E3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xa1e3..0xa1f5  (18 bytes)
DATA_partitura_A1E3:
	defb 0eah,005h,0edh,012h,0ebh,087h,01bh,0f1h,0d8h,0e9h,001h,0d1h,087h,077h,067h,0e9h	; a1e3  .............wg.
	defb 006h,05fh	; a1f3

; ----------------------------------------------------------------------
; DATOS partitura_A1F5: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (13 bytes)
;   0xa1f5..0xa202  (13 bytes)
DATA_partitura_A1F5:
	defb 0ebh,009h,03bh,031h,0d2h,090h,0b0h,0d1h,000h,020h,030h,0d2h,0b0h	; a1f5  ...1..... 0..

; ----------------------------------------------------------------------
; DATOS partitura_A202: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (10 bytes)
;   0xa202..0xa20c  (10 bytes)
DATA_partitura_A202:
	defb 0d1h,000h,020h,030h,020h,000h,0d2h,0b0h,0d1h,030h	; a202  .. 0 ....0

; ----------------------------------------------------------------------
; DATOS partitura_A20C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xa20c..0xa20f  (3 bytes)
DATA_partitura_A20C:
	defb 0d2h,0b0h,0d1h	; a20c

; ----------------------------------------------------------------------
; DATOS partitura_A20F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xa20f..0xa220  (17 bytes)
DATA_partitura_A20F:
	defb 000h,020h,030h,020h,000h,0ebh,087h,01bh,0f1h,0d2h,0bah,0d1h,001h,021h,031h,0e9h	; a20f  . 0 .........!1.
	defb 001h	; a21f

; ----------------------------------------------------------------------
; DATOS partitura_A220: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xa220..0xa222  (2 bytes)
DATA_partitura_A220:
	defb 0b7h,0a7h	; a220

; ----------------------------------------------------------------------
; DATOS partitura_A222: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xa222..0xa234  (18 bytes)
DATA_partitura_A222:
	defb 097h,0e9h,006h,0dbh,003h,08fh,0d8h,0ech,0eah,002h,083h,0eah,005h,0ebh,087h,01bh	; a222  ................
	defb 0f1h,0e9h	; a232

; ----------------------------------------------------------------------
; DATOS partitura_A234: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xa234..0xa246  (18 bytes)
DATA_partitura_A234:
	defb 001h,0d1h,087h,0a7h,0b7h,0e9h,006h,080h,0feh,001h,0e9h,006h,0c2h,0eah,005h,0edh	; a234  ................
	defb 082h,0ebh	; a244

; ----------------------------------------------------------------------
; DATOS partitura_A246: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (21 bytes)
;   0xa246..0xa25b  (21 bytes)
DATA_partitura_A246:
	defb 082h,032h,004h,0f0h,00fh,015h,0d6h,004h,001h,0d2h,077h,0f0h,00fh,035h,0eah,005h	; a246  .2........w..5..
	defb 0edh,012h,0ebh,087h,01bh	; a256

; ----------------------------------------------------------------------
; DATOS partitura_A25B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa25b..0xa25c  (1 bytes)
DATA_partitura_A25B:
	defb 0f1h	; a25b

; ----------------------------------------------------------------------
; DATOS partitura_A25C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (27 bytes)
;   0xa25c..0xa277  (27 bytes)
DATA_partitura_A25C:
	defb 0d8h,0e9h,001h,0d1h,0a7h,097h,087h,0e9h,006h,07fh,0ebh,009h,03bh,031h,0d2h,040h	; a25c  .............1.@
	defb 0d1h,010h,020h,040h,050h,010h,020h,040h,050h,040h,020h	; a26c  .. @P. @P@

; ----------------------------------------------------------------------
; DATOS partitura_A277: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (26 bytes)
;   0xa277..0xa291  (26 bytes)
DATA_partitura_A277:
	defb 010h,050h,010h,020h,040h,050h,040h,020h,010h,0ebh,087h,01bh,0f1h,0c9h,0d1h,021h	; a277  .P. @P@ .......!
	defb 041h,051h,0e9h,001h,0d0h,017h,007h,0d1h,0b7h,0e9h	; a287  AQ........

; ----------------------------------------------------------------------
; DATOS partitura_A291: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xa291..0xa2a2  (17 bytes)
DATA_partitura_A291:
	defb 006h,0dbh,003h,0afh,0d8h,0ech,0eah,002h,0a3h,0eah,005h,0ebh,087h,01bh,0f1h,0e9h	; a291  ................
	defb 001h	; a2a1

; ----------------------------------------------------------------------
; DATOS partitura_A2A2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xa2a2..0xa2bb  (25 bytes)
DATA_partitura_A2A2:
	defb 0d1h,0a7h,0d0h,007h,017h,0e9h,006h,0d1h,0a0h,0feh,001h,0e9h,00ch,0c0h,0eeh,001h	; a2a2  ................
	defb 0ech,0eah,008h,0d6h,006h,001h,0f0h,00fh,043h	; a2b2  ........C

; ----------------------------------------------------------------------
; DATOS partitura_A2BB: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa2bb..0xa2bc  (1 bytes)
DATA_partitura_A2BB:
	defb 0d2h	; a2bb

; ----------------------------------------------------------------------
; DATOS partitura_A2BC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa2bc..0xa2c4  (8 bytes)
DATA_partitura_A2BC:
	defb 003h,025h,031h,0d3h,0b2h,0d2h,000h,020h	; a2bc  .%1....

; ----------------------------------------------------------------------
; DATOS partitura_A2C4: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (5 bytes)
;   0xa2c4..0xa2c9  (5 bytes)
DATA_partitura_A2C4:
	defb 030h,050h,060h,080h,060h	; a2c4

; ----------------------------------------------------------------------
; DATOS partitura_A2C9: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa2c9..0xa2d1  (8 bytes)
DATA_partitura_A2C9:
	defb 071h,0c0h,010h,020h,030h,050h,060h,080h	; a2c9  q.. 0P`.

; ----------------------------------------------------------------------
; DATOS partitura_A2D1: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xa2d1..0xa2dc  (11 bytes)
DATA_partitura_A2D1:
	defb 090h,0b0h,090h,0b1h,0c0h,050h,060h,080h,090h,0b0h,0d1h	; a2d1  .....P`....

; ----------------------------------------------------------------------
; DATOS partitura_A2DC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xa2dc..0xa2e7  (11 bytes)
DATA_partitura_A2DC:
	defb 000h,020h,030h,0d2h,0b0h,0d1h,000h,0efh,0feh,001h,0e9h	; a2dc  . 0........

; ----------------------------------------------------------------------
; DATOS partitura_A2E7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xa2e7..0xa2ed  (6 bytes)
DATA_partitura_A2E7:
	defb 006h,0c2h,0eah,006h,0d6h,004h	; a2e7

; ----------------------------------------------------------------------
; DATOS partitura_A2ED: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (5 bytes)
;   0xa2ed..0xa2f2  (5 bytes)
DATA_partitura_A2ED:
	defb 001h,0ebh,007h,03bh,041h	; a2ed

; ----------------------------------------------------------------------
; DATOS partitura_A2F2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xa2f2..0xa2f5  (3 bytes)
DATA_partitura_A2F2:
	defb 0d1h,060h,020h	; a2f2

; ----------------------------------------------------------------------
; DATOS partitura_A2F5: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xa2f5..0xa2f8  (3 bytes)
DATA_partitura_A2F5:
	defb 030h,050h,060h	; a2f5

; ----------------------------------------------------------------------
; DATOS partitura_A2F8: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (5 bytes)
;   0xa2f8..0xa2fd  (5 bytes)
DATA_partitura_A2F8:
	defb 050h,060h,080h,090h,050h	; a2f8

; ----------------------------------------------------------------------
; DATOS partitura_A2FD: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa2fd..0xa305  (8 bytes)
DATA_partitura_A2FD:
	defb 060h,080h,090h,080h,090h,0b0h,0d0h,000h	; a2fd  `.......

; ----------------------------------------------------------------------
; DATOS partitura_A305: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa305..0xa306  (1 bytes)
DATA_partitura_A305:
	defb 0d1h	; a305

; ----------------------------------------------------------------------
; DATOS partitura_A306: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa306..0xa30e  (8 bytes)
DATA_partitura_A306:
	defb 080h,090h,0b0h,0d0h,000h,0d1h,0b0h,0d0h	; a306  ........

; ----------------------------------------------------------------------
; DATOS partitura_A30E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa30e..0xa316  (8 bytes)
DATA_partitura_A30E:
	defb 000h,020h,030h,0d1h,0b0h,0d0h,000h,020h	; a30e  . 0....

; ----------------------------------------------------------------------
; DATOS partitura_A316: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa316..0xa317  (1 bytes)
DATA_partitura_A316:
	defb 030h	; a316

; ----------------------------------------------------------------------
; DATOS partitura_A317: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xa317..0xa31d  (6 bytes)
DATA_partitura_A317:
	defb 0f0h,000h,0d8h,0fdh,0cbh,0a1h	; a317

; ----------------------------------------------------------------------
; DATOS partitura_A31D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa31d..0xa31e  (1 bytes)
DATA_partitura_A31D:
	defb 0feh	; a31d

; ----------------------------------------------------------------------
; DATOS partitura_A31E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa31e..0xa326  (8 bytes)
DATA_partitura_A31E:
	defb 001h,0e9h,006h,0c5h,0feh,001h,0f1h,002h	; a31e  ........

; ----------------------------------------------------------------------
; DATOS partitura_A326: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xa326..0xa33f  (25 bytes)
DATA_partitura_A326:
	defb 04ah,001h,006h,0e9h,00ch,0eah,00ch,0edh,019h,0ebh,089h,02bh,091h,0dbh,003h,0d6h	; a326  J..........+....
	defb 040h,001h,0f0h,00fh,027h,0d2h,017h,0d3h,0b2h	; a336  @...'....

; ----------------------------------------------------------------------
; DATOS partitura_A33F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (94 bytes)
;   0xa33f..0xa39d  (94 bytes)
DATA_partitura_A33F:
	defb 0d2h,000h,029h,056h,030h,0d3h,087h,0b1h,0e9h,001h,0d2h,027h,037h,0d3h,0b7h,0d2h	; a33f  ..)V0......'7...
	defb 0e9h,00ch,025h,0feh,001h,0f1h,002h,041h,001h,00eh,0e9h,00ch,0eah,00ch,0edh,019h	; a34f  ..%....A........
	defb 0ebh,089h,02bh,091h,0dbh,003h,0d6h,010h,001h,0f0h,00fh,025h,0d2h,037h,012h,020h	; a35f  ..+........%.7.
	defb 049h,076h,050h,0d3h,0b7h,0d2h,011h,0e9h,001h,047h,057h,017h,0e9h,00ch,045h,0feh	; a36f  IvP......GW...E.
	defb 001h,0f6h,0f8h,023h,0e9h,006h,0eah,00fh,0ebh,00bh,03bh,031h,0d5h,093h,093h,0e9h	; a37f  ...#.......1....
	defb 001h,0b7h,0b7h,0b7h,0e9h,006h,0b3h,0b1h,0b1h,0b3h,0e9h,001h,0b7h,0b7h	; a38f  ..............

; ----------------------------------------------------------------------
; DATOS partitura_A39D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xa39d..0xa3a8  (11 bytes)
DATA_partitura_A39D:
	defb 0b7h,0e9h,006h,0b3h,0b1h,0b1h,0b3h,0b3h,0e9h,001h,0b7h	; a39d  ...........

; ----------------------------------------------------------------------
; DATOS partitura_A3A8: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (24 bytes)
;   0xa3a8..0xa3c0  (24 bytes)
DATA_partitura_A3A8:
	defb 0b7h,0b7h,0e9h,006h,0b1h,0b1h,0b3h,0b1h,0b1h,0e9h,001h,0b7h,0b7h,0b7h,0e9h,006h	; a3a8  ................
	defb 0b3h,0b1h,0b1h,0b3h,0b3h,0b1h,0b1h,0e9h	; a3b8  ........

; ----------------------------------------------------------------------
; DATOS partitura_A3C0: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (24 bytes)
;   0xa3c0..0xa3d8  (24 bytes)
DATA_partitura_A3C0:
	defb 001h,0b7h,0b7h,0b7h,0e9h,006h,0b3h,0b1h,0b1h,0feh,001h,0f6h,0f8h,023h,0e9h,006h	; a3c0  .............#..
	defb 0eah,00fh,0ebh,00ah,02bh,021h,0dbh,002h	; a3d0  ....+!..

; ----------------------------------------------------------------------
; DATOS partitura_A3D8: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (10 bytes)
;   0xa3d8..0xa3e2  (10 bytes)
DATA_partitura_A3D8:
	defb 0d5h,0b3h,0d4h,0b2h,0a0h,073h,072h,060h,053h,052h	; a3d8  .....sr`SR

; ----------------------------------------------------------------------
; DATOS partitura_A3E2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xa3e2..0xa3e8  (6 bytes)
DATA_partitura_A3E2:
	defb 040h,023h,023h,0fdh,022h,0a3h	; a3e2

; ----------------------------------------------------------------------
; DATOS partitura_A3E8: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (168 bytes)
;   0xa3e8..0xa490  (168 bytes)
DATA_partitura_A3E8:
	defb 0feh,001h,0e9h,006h,0c5h,0feh,001h,0f2h,001h,0e9h,00ch,0eeh,082h,0c0h,0eah,008h	; a3e8  ................
	defb 0ebh,007h,017h,0d1h,0d6h,010h,001h,0f0h,00fh,027h,0d2h,017h,0d3h,0b2h,0d2h,000h	; a3f8  .........'......
	defb 029h,056h,030h,0d3h,087h,0b1h,0e9h,001h,0d2h,027h,037h,0d3h,0b7h,0d2h,0e9h,00ch	; a408  )V0......'7.....
	defb 024h,0feh,001h,0f2h,001h,0e9h,00ch,0eeh,082h,0c0h,0eah,008h,0ebh,007h,017h,0d1h	; a418  $...............
	defb 0d6h,010h,001h,0f0h,00fh,025h,0d2h,037h,012h,020h,049h,076h,050h,0d3h,0b7h,0d2h	; a428  .....%.7. IvP...
	defb 011h,0e9h,001h,047h,057h,017h,0e9h,00ch,044h,0feh,001h,0f8h,002h,0eeh,081h,0e9h	; a438  ...GW...D.......
	defb 006h,0eah,008h,0ebh,009h,03bh,011h,0d6h,010h,001h,0f0h,00fh,011h,0dbh,003h,0d2h	; a448  ................
	defb 001h,021h,031h,061h,0c1h,081h,097h,080h,090h,080h,090h,080h,090h,080h,090h,080h	; a458  .!1a............
	defb 060h,030h,020h,001h,021h,031h,061h,091h,0b1h,0d1h,007h,0d2h,0b0h,0d1h,000h,0d2h	; a468  `0 .!1a.........
	defb 0b0h,0d1h,000h,0d2h,0b0h,0d1h,000h,0d2h,0b0h,0d1h,000h,0d2h,0b0h,090h,060h,030h	; a478  ..............`0
	defb 001h,021h,031h,061h,091h,0b1h,0d1h,001h	; a488  .!1a....

; ----------------------------------------------------------------------
; DATOS partitura_A490: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (37 bytes)
;   0xa490..0xa4b5  (37 bytes)
DATA_partitura_A490:
	defb 021h,030h,0d2h,0b0h,0d1h,000h,020h,030h,0d2h,0b0h,0d1h,000h,020h,030h,0d2h,0b0h	; a490  !0.... 0.... 0..
	defb 0d1h,000h,020h,030h,020h,030h,050h,0d8h,0feh,001h,0f8h,002h,0e9h,006h,0eah,008h	; a4a0  .. 0 0P.........
	defb 0d6h,004h,001h,0ebh,009h	; a4b0

; ----------------------------------------------------------------------
; DATOS partitura_A4B5: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xa4b5..0xa4c6  (17 bytes)
DATA_partitura_A4B5:
	defb 03bh,011h,0d1h,060h,020h,030h,050h,060h,050h,060h,080h,090h,050h,060h,080h,090h	; a4b5  ...` 0P`P`..P`..
	defb 080h	; a4c5

; ----------------------------------------------------------------------
; DATOS partitura_A4C6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (22 bytes)
;   0xa4c6..0xa4dc  (22 bytes)
DATA_partitura_A4C6:
	defb 090h,0b0h,0d0h,000h,0d1h,080h,090h,0b0h,0d0h,000h,0d1h,0b0h,0d0h,000h,020h,030h	; a4c6  .............. 0
	defb 0d1h,0b0h,0eah,008h,0d0h,000h	; a4d6

; ----------------------------------------------------------------------
; DATOS partitura_A4DC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xa4dc..0xa4e7  (11 bytes)
DATA_partitura_A4DC:
	defb 020h,030h,020h,030h,050h,0f0h,000h,0d8h,0fdh,0edh,0a3h	; a4dc   0 0P......

; ----------------------------------------------------------------------
; DATOS partitura_A4E7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (9 bytes)
;   0xa4e7..0xa4f0  (9 bytes)
DATA_partitura_A4E7:
	defb 0feh,001h,0e9h,006h,0c5h,0feh,001h,0f8h,04bh	; a4e7  ........K

; ----------------------------------------------------------------------
; DATOS partitura_A4F0: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa4f0..0xa4f1  (1 bytes)
DATA_partitura_A4F0:
	defb 0e9h	; a4f0

; ----------------------------------------------------------------------
; DATOS partitura_A4F1: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xa4f1..0xa4f3  (2 bytes)
DATA_partitura_A4F1:
	defb 006h,0eah	; a4f1

; ----------------------------------------------------------------------
; DATOS partitura_A4F3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa4f3..0xa4fb  (8 bytes)
DATA_partitura_A4F3:
	defb 005h,0edh,082h,0ebh,084h,032h,004h,0f0h	; a4f3  .....2..

; ----------------------------------------------------------------------
; DATOS partitura_A4FB: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa4fb..0xa4fc  (1 bytes)
DATA_partitura_A4FB:
	defb 00fh	; a4fb

; ----------------------------------------------------------------------
; DATOS partitura_A4FC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa4fc..0xa4fd  (1 bytes)
DATA_partitura_A4FC:
	defb 017h	; a4fc

; ----------------------------------------------------------------------
; DATOS partitura_A4FD: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xa4fd..0xa504  (7 bytes)
DATA_partitura_A4FD:
	defb 0d6h,004h,001h,0d2h,057h,0f0h,00fh	; a4fd

; ----------------------------------------------------------------------
; DATOS partitura_A504: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa504..0xa505  (1 bytes)
DATA_partitura_A504:
	defb 036h	; a504

; ----------------------------------------------------------------------
; DATOS partitura_A505: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa505..0xa50d  (8 bytes)
DATA_partitura_A505:
	defb 0eah,005h,0edh,012h,0ebh,087h,01bh,0f1h	; a505  ........

; ----------------------------------------------------------------------
; DATOS partitura_A50D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa50d..0xa515  (8 bytes)
DATA_partitura_A50D:
	defb 0d8h,0e9h,001h,0d1h,087h,077h,067h,0e9h	; a50d  .....wg.

; ----------------------------------------------------------------------
; DATOS partitura_A515: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa515..0xa51d  (8 bytes)
DATA_partitura_A515:
	defb 006h,05fh,0ebh,009h,03bh,031h,0d2h,090h	; a515  ._...1..

; ----------------------------------------------------------------------
; DATOS partitura_A51D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa51d..0xa525  (8 bytes)
DATA_partitura_A51D:
	defb 0b0h,0d1h,000h,020h,030h,0d2h,0b0h,0d1h	; a51d  ... 0...

; ----------------------------------------------------------------------
; DATOS partitura_A525: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xa525..0xa52b  (6 bytes)
DATA_partitura_A525:
	defb 000h,020h,030h,020h,000h,0d2h	; a525

; ----------------------------------------------------------------------
; DATOS partitura_A52B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xa52b..0xa52d  (2 bytes)
DATA_partitura_A52B:
	defb 0b0h,0d1h	; a52b

; ----------------------------------------------------------------------
; DATOS partitura_A52D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa52d..0xa52e  (1 bytes)
DATA_partitura_A52D:
	defb 030h	; a52d

; ----------------------------------------------------------------------
; DATOS partitura_A52E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa52e..0xa52f  (1 bytes)
DATA_partitura_A52E:
	defb 0d2h	; a52e

; ----------------------------------------------------------------------
; DATOS partitura_A52F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa52f..0xa537  (8 bytes)
DATA_partitura_A52F:
	defb 0b0h,0d1h,000h,020h,030h,020h,000h,0ebh	; a52f  ... 0 ..

; ----------------------------------------------------------------------
; DATOS partitura_A537: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa537..0xa53f  (8 bytes)
DATA_partitura_A537:
	defb 087h,01bh,0f1h,0d2h,0bah,0d1h,001h,021h	; a537  .......!

; ----------------------------------------------------------------------
; DATOS partitura_A53F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa53f..0xa547  (8 bytes)
DATA_partitura_A53F:
	defb 031h,0e9h,001h,0b7h,0a7h,097h,0e9h,006h	; a53f  1.......

; ----------------------------------------------------------------------
; DATOS partitura_A547: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa547..0xa54f  (8 bytes)
DATA_partitura_A547:
	defb 0dbh,003h,08fh,0d8h,0ech,0eah,002h,083h	; a547  ........

; ----------------------------------------------------------------------
; DATOS partitura_A54F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa54f..0xa557  (8 bytes)
DATA_partitura_A54F:
	defb 0eah,005h,0ebh,087h,01bh,0f1h,0e9h,001h	; a54f  ........

; ----------------------------------------------------------------------
; DATOS partitura_A557: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (9 bytes)
;   0xa557..0xa560  (9 bytes)
DATA_partitura_A557:
	defb 0d1h,087h,0a7h,0b7h,0e9h,006h,083h,0feh,001h	; a557  .........

; ----------------------------------------------------------------------
; DATOS partitura_A560: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xa560..0xa562  (2 bytes)
DATA_partitura_A560:
	defb 0f8h,04bh	; a560

; ----------------------------------------------------------------------
; DATOS partitura_A562: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (10 bytes)
;   0xa562..0xa56c  (10 bytes)
DATA_partitura_A562:
	defb 0e9h,006h,0eah,005h,0edh,082h,0ebh,082h,032h,004h	; a562  ........2.

; ----------------------------------------------------------------------
; DATOS partitura_A56C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xa56c..0xa573  (7 bytes)
DATA_partitura_A56C:
	defb 0f0h,00fh,015h,0d6h,004h,001h,0d2h	; a56c

; ----------------------------------------------------------------------
; DATOS partitura_A573: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xa573..0xa57a  (7 bytes)
DATA_partitura_A573:
	defb 077h,0f0h,00fh,035h,0eah,005h,0edh	; a573

; ----------------------------------------------------------------------
; DATOS partitura_A57A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xa57a..0xa580  (6 bytes)
DATA_partitura_A57A:
	defb 012h,0ebh,087h,01bh,0f1h,0d8h	; a57a

; ----------------------------------------------------------------------
; DATOS partitura_A580: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (19 bytes)
;   0xa580..0xa593  (19 bytes)
DATA_partitura_A580:
	defb 0e9h,001h,0d1h,0a7h,097h,087h,0e9h,006h,07fh,0ebh,009h,03bh,031h,0d2h,040h,0d1h	; a580  ............1.@.
	defb 010h,020h,040h	; a590

; ----------------------------------------------------------------------
; DATOS partitura_A593: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa593..0xa59b  (8 bytes)
DATA_partitura_A593:
	defb 050h,010h,020h,040h,050h,040h,020h,010h	; a593  P. @P@ .

; ----------------------------------------------------------------------
; DATOS partitura_A59B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (34 bytes)
;   0xa59b..0xa5bd  (34 bytes)
DATA_partitura_A59B:
	defb 050h,010h,020h,040h,050h,040h,020h,010h,0ebh,087h,01bh,0f1h,0c9h,0d1h,021h,041h	; a59b  P. @P@ .......!A
	defb 051h,0e9h,001h,0d0h,017h,007h,0d1h,0b7h,0e9h,006h,0dbh,003h,0afh,0d8h,0ech,0eah	; a5ab  Q...............
	defb 002h,0a3h	; a5bb

; ----------------------------------------------------------------------
; DATOS partitura_A5BD: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xa5bd..0xa5c3  (6 bytes)
DATA_partitura_A5BD:
	defb 0eah,005h,0ebh,087h,01bh,0f1h	; a5bd

; ----------------------------------------------------------------------
; DATOS partitura_A5C3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (20 bytes)
;   0xa5c3..0xa5d7  (20 bytes)
DATA_partitura_A5C3:
	defb 0e9h,001h,0d1h,0a7h,0d0h,007h,017h,0e9h,006h,0d1h,0a3h,0feh,001h,0f8h,002h,0e9h	; a5c3  ................
	defb 00ch,0eah,009h,0edh	; a5d3

; ----------------------------------------------------------------------
; DATOS partitura_A5D7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (16 bytes)
;   0xa5d7..0xa5e7  (16 bytes)
DATA_partitura_A5D7:
	defb 019h,0ebh,089h,02bh,091h,0dbh,003h,0d6h,006h,001h,0f0h,00fh,044h,0d2h,003h,025h	; a5d7  ...+........D..%

; ----------------------------------------------------------------------
; DATOS partitura_A5E7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (37 bytes)
;   0xa5e7..0xa60c  (37 bytes)
DATA_partitura_A5E7:
	defb 031h,0d3h,0b2h,0d2h,000h,020h,030h,050h,060h,080h,060h,072h,010h,020h,030h,050h	; a5e7  1.... 0P`.`r. 0P
	defb 060h,080h,090h,0b0h,090h,0b2h,050h,060h,080h,090h,0b0h,0eah,008h,0d1h,000h,020h	; a5f7  `.....P`.......
	defb 030h,0d2h,0b0h,0d1h,000h	; a607

; ----------------------------------------------------------------------
; DATOS partitura_A60C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xa60c..0xa617  (11 bytes)
DATA_partitura_A60C:
	defb 020h,0feh,001h,0f8h,002h,0e9h,006h,0eah,00bh,0ebh,009h	; a60c   ..........

; ----------------------------------------------------------------------
; DATOS partitura_A617: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xa617..0xa630  (25 bytes)
DATA_partitura_A617:
	defb 03bh,091h,0dbh,003h,0f0h,00fh,023h,0d6h,006h,001h,0d2h,036h,060h,066h,090h,096h	; a617  ......#....6`f..
	defb 0d1h,000h,007h,0d8h,0f0h,000h,0fdh,0ech,0a4h	; a627  .........

; ----------------------------------------------------------------------
; DATOS partitura_A630: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (36 bytes)
;   0xa630..0xa654  (36 bytes)
DATA_partitura_A630:
	defb 0feh,001h,0e9h,006h,0c5h,0feh,001h,0f8h,04bh,0e9h,006h,0eah,00fh,0ebh,009h,047h	; a630  ........K......G
	defb 011h,0f5h,0d4h,001h,001h,001h,001h,001h,001h,0fbh,008h,0feh,001h,0f8h,04bh,0e9h	; a640  ..............K.
	defb 006h,0eah,00fh,0ebh	; a650

; ----------------------------------------------------------------------
; DATOS partitura_A654: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (41 bytes)
;   0xa654..0xa67d  (41 bytes)
DATA_partitura_A654:
	defb 009h,047h,011h,0f5h,0d4h,021h,021h,021h,021h,021h,021h,0fbh,008h,0feh,001h,0f8h	; a654  .G...!!!!!!.....
	defb 002h,0e9h,00ch,0eah,00ah,0edh,019h,0ebh,089h,02bh,091h,0dbh,003h,0d6h,006h,001h	; a664  .........+......
	defb 0f0h,00fh,044h,0d4h,003h,025h,031h,0d5h,0b2h	; a674  ..D..%1..

; ----------------------------------------------------------------------
; DATOS partitura_A67D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (16 bytes)
;   0xa67d..0xa68d  (16 bytes)
DATA_partitura_A67D:
	defb 0d4h,000h,020h,030h,050h,060h,080h,060h,072h,010h,020h,030h,050h,060h,080h,090h	; a67d  .. 0P`.`r. 0P`..

; ----------------------------------------------------------------------
; DATOS partitura_A68D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x76 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (52 bytes)
;   0xa68d..0xa6c1  (52 bytes)
DATA_partitura_A68D:
	defb 0b0h,090h,0b2h,050h,060h,080h,090h,0b0h,0d3h,000h,020h,030h,0d4h,0b0h,0d3h,000h	; a68d  ...P`..... 0....
	defb 020h,0feh,001h,0f8h,002h,0e9h,006h,0eah,00bh,0ebh,009h,03bh,091h,0dbh,003h,0f0h	; a69d   ...............
	defb 00fh,024h,0d6h,006h,001h,0d3h,0b6h,0b0h,0d2h,026h,050h,056h,080h,087h,0d8h,0f0h	; a6ad  .$.......&PV....
	defb 000h,0fdh,035h,0a6h	; a6bd

; ----------------------------------------------------------------------
; DATOS partitura_A6C1: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x78 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xa6c1..0xa6d2  (17 bytes)
DATA_partitura_A6C1:
	defb 0feh,001h,0e9h,009h,0eah,008h,0eeh,002h,0edh,013h,0ebh,084h,013h,0a1h,0f0h,013h	; a6c1  ................
	defb 032h	; a6d1

; ----------------------------------------------------------------------
; DATOS partitura_A6D2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x78 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (38 bytes)
;   0xa6d2..0xa6f8  (38 bytes)
DATA_partitura_A6D2:
	defb 0d1h,02fh,0efh,0feh,001h,0e9h,006h,0c2h,0eeh,003h,0eah,003h,0ech,0f0h,012h,035h	; a6d2  ./.............5
	defb 0f5h,0d2h,021h,031h,021h,031h,021h,031h,0fbh,003h,021h,031h,021h,061h,051h,061h	; a6e2  ..!1!1!1..!1!aQa
	defb 0f5h,081h,091h,081h,091h,081h	; a6f2

; ----------------------------------------------------------------------
; DATOS partitura_A6F8: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x78 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xa6f8..0xa6ff  (7 bytes)
DATA_partitura_A6F8:
	defb 091h,0fbh,002h,081h,091h,081h,091h	; a6f8

; ----------------------------------------------------------------------
; DATOS partitura_A6FF: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x78 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (24 bytes)
;   0xa6ff..0xa717  (24 bytes)
DATA_partitura_A6FF:
	defb 081h,091h,081h,091h,081h,091h,081h,091h,0efh,0feh,001h,0e9h,006h,0eeh,003h,0eah	; a6ff  ................
	defb 003h,0ech,0f0h,012h,035h,0f5h,0d2h,021h	; a70f  ....5..!

; ----------------------------------------------------------------------
; DATOS partitura_A717: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x78 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (34 bytes)
;   0xa717..0xa739  (34 bytes)
DATA_partitura_A717:
	defb 031h,021h,031h,021h,031h,0fbh,003h,021h,031h,021h,061h,051h,061h,0f5h,081h,091h	; a717  1!1!1..!1!aQa...
	defb 081h,091h,081h,091h,0fbh,002h,081h,091h,081h,091h,080h,0eeh,081h,0eah,006h,0edh	; a727  ................
	defb 014h,0ebh	; a737

; ----------------------------------------------------------------------
; DATOS partitura_A739: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x78 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (15 bytes)
;   0xa739..0xa748  (15 bytes)
DATA_partitura_A739:
	defb 087h,024h,041h,0f0h,014h,032h,0d0h,02bh,0efh,0feh,001h,0eeh,088h,0e9h,006h	; a739  .$A..2.+.......

; ----------------------------------------------------------------------
; DATOS partitura_A748: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x78 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (50 bytes)
;   0xa748..0xa77a  (50 bytes)
DATA_partitura_A748:
	defb 0eah,007h,0ebh,007h,027h,003h,0f5h,0d4h,030h,030h,091h,031h,095h,0fbh,003h,030h	; a748  ....'...00.1...0
	defb 030h,091h,031h,0b1h,0d4h,001h,031h,0f5h,0d4h,020h,020h,081h,021h,085h,0fbh,004h	; a758  0.1...1..  .!...
	defb 0efh,0feh,001h,0eeh,088h,0e9h,006h,0eah,007h,0ebh,007h,027h,003h,0f5h,0d4h,030h	; a768  ...........'...0
	defb 030h,091h	; a778

; ----------------------------------------------------------------------
; DATOS partitura_A77A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x78 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (31 bytes)
;   0xa77a..0xa799  (31 bytes)
DATA_partitura_A77A:
	defb 031h,095h,0fbh,003h,030h,030h,091h,031h,0b1h,001h,031h,0f5h,020h,020h,081h,021h	; a77a  1...00.1..1.  .!
	defb 085h,0fbh,003h,060h,060h,051h,090h,090h,081h,0d3h,001h,0d4h,0b1h,0efh,0fdh	; a78a  ...``Q.........

; ----------------------------------------------------------------------
; DATOS partitura_A799: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x78 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xa799..0xa79b  (2 bytes)
DATA_partitura_A799:
	defb 0d5h,0a6h	; a799

; ----------------------------------------------------------------------
; DATOS partitura_A79B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x78 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (134 bytes)
;   0xa79b..0xa821  (134 bytes)
DATA_partitura_A79B:
	defb 0feh,001h,0e9h,006h,0eah,006h,0edh,015h,0ebh,087h,043h,0f1h,0d6h,040h,001h,0f0h	; a79b  ..........C..@..
	defb 013h,033h,0d1h,067h,0eah,009h,0eeh,088h,0d8h,0ebh,007h,01bh,021h,0d4h,020h,030h	; a7ab  .3.g........!. 0
	defb 060h,050h,090h,080h,0d3h,000h,0d4h,0b0h,080h,090h,0d3h,000h,0d4h,0b0h,0e9h,003h	; a7bb  `P..............
	defb 0d3h,020h,010h,000h,0d4h,0b0h,0a0h,090h,080h,070h,0efh,0feh,001h,0e9h,006h,0c1h	; a7cb  . .......p......
	defb 0eah,004h,0d8h,0ebh,003h,0b7h,002h,0d3h,091h,0d2h,021h,081h,051h,061h,081h,0d3h	; a7db  ..........!.Qa..
	defb 021h,0d2h,031h,021h,091h,081h,051h,0d3h,061h,0d2h,091h,081h,001h,051h,061h,0d3h	; a7eb  !.1!..Q.a....Qa.
	defb 091h,0d2h,081h,061h,051h,0d2h,021h,031h,0d3h,021h,0d2h,021h,081h,051h,061h,081h	; a7fb  ...aQ.!1.!.!.Qa.
	defb 0d3h,051h,0d2h,031h,021h,091h,081h,051h,0d2h,061h,051h,091h,081h,0d1h,001h,0d2h	; a80b  .Q.1!..Q.aQ.....
	defb 0b1h,0f8h,048h,0d0h,061h,051h	; a81b

; ----------------------------------------------------------------------
; DATOS partitura_A821: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x78 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (15 bytes)
;   0xa821..0xa830  (15 bytes)
DATA_partitura_A821:
	defb 091h,081h,0feh,001h,0e9h,006h,0c1h,0eah,004h,0ebh,003h,0b7h,002h,0d3h,091h	; a821  ...............

; ----------------------------------------------------------------------
; DATOS partitura_A830: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x78 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (21 bytes)
;   0xa830..0xa845  (21 bytes)
DATA_partitura_A830:
	defb 0d2h,021h,081h,051h,061h,081h,0d3h,021h,0d2h,031h,021h,091h,081h,051h,0d3h,061h	; a830  .!.Qa..!.1!..Q.a
	defb 0d2h,091h,081h,001h,051h	; a840

; ----------------------------------------------------------------------
; DATOS partitura_A845: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x78 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (22 bytes)
;   0xa845..0xa85b  (22 bytes)
DATA_partitura_A845:
	defb 061h,0d3h,091h,0d2h,081h,061h,051h,0d2h,021h,031h,0d3h,021h,0d2h,021h,081h,051h	; a845  a....aQ.!1.!.!.Q
	defb 061h,081h,0d3h,051h,0d2h,031h	; a855

; ----------------------------------------------------------------------
; DATOS partitura_A85B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x78 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (21 bytes)
;   0xa85b..0xa870  (21 bytes)
DATA_partitura_A85B:
	defb 021h,091h,081h,051h,0d1h,021h,091h,081h,051h,061h,091h,0d1h,020h,0d2h,090h,080h	; a85b  !..Q.!..Qa.. ...
	defb 050h,090h,080h,050h,020h	; a86b

; ----------------------------------------------------------------------
; DATOS partitura_A870: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x78 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (22 bytes)
;   0xa870..0xa886  (22 bytes)
DATA_partitura_A870:
	defb 080h,050h,0feh,001h,0eeh,008h,0e9h,006h,0eah,007h,0ebh,007h,027h,003h,0f5h,0d4h	; a870  .P..........'...
	defb 030h,030h,091h,031h,095h,0fbh	; a880

; ----------------------------------------------------------------------
; DATOS partitura_A886: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x78 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (19 bytes)
;   0xa886..0xa899  (19 bytes)
DATA_partitura_A886:
	defb 003h,030h,030h,091h,031h,0b1h,0d4h,001h,031h,0f5h,0d4h,020h,020h,081h,021h,085h	; a886  .00.1...1..  .!.
	defb 0fbh,004h,0efh	; a896

; ----------------------------------------------------------------------
; DATOS partitura_A899: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x78 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xa899..0xa89c  (3 bytes)
DATA_partitura_A899:
	defb 0feh,001h,0eeh	; a899

; ----------------------------------------------------------------------
; DATOS partitura_A89C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x78 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (26 bytes)
;   0xa89c..0xa8b6  (26 bytes)
DATA_partitura_A89C:
	defb 008h,0e9h,006h,0eah,007h,0ebh,007h,027h,003h,0f5h,0d4h,030h,030h,091h,031h,095h	; a89c  .......'...00.1.
	defb 0fbh,003h,030h,030h,091h,031h,0b1h,001h,031h,0f5h	; a8ac  ..00.1..1.

; ----------------------------------------------------------------------
; DATOS partitura_A8B6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x78 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xa8b6..0xa8b8  (2 bytes)
DATA_partitura_A8B6:
	defb 020h,020h	; a8b6

; ----------------------------------------------------------------------
; DATOS partitura_A8B8: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x78 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (19 bytes)
;   0xa8b8..0xa8cb  (19 bytes)
DATA_partitura_A8B8:
	defb 081h,021h,085h,0fbh,003h,060h,060h,051h,090h,090h,081h,0d3h,001h,0d4h,0b1h,0efh	; a8b8  .!...``Q........
	defb 0fdh,0d6h,0a7h	; a8c8

; ----------------------------------------------------------------------
; DATOS partitura_A8CB: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x78 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xa8cb..0xa8d6  (11 bytes)
DATA_partitura_A8CB:
	defb 0feh,001h,0f6h,0f8h,002h,0e9h,006h,0eah,00ah,0ebh,004h	; a8cb  ...........

; ----------------------------------------------------------------------
; DATOS partitura_A8D6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x78 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xa8d6..0xa8d9  (3 bytes)
DATA_partitura_A8D6:
	defb 053h,051h,0d6h	; a8d6

; ----------------------------------------------------------------------
; DATOS partitura_A8D9: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x78 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (29 bytes)
;   0xa8d9..0xa8f6  (29 bytes)
DATA_partitura_A8D9:
	defb 040h,001h,0f0h,013h,032h,0d1h,067h,0f8h,04bh,0eah,00fh,0d8h,0ebh,00bh,02bh,011h	; a8d9  @...2.g.K.....+.
	defb 0d4h,020h,030h,060h,050h,090h,080h,0d3h,000h,0d4h,0b0h,080h,090h	; a8e9  . 0`P........

; ----------------------------------------------------------------------
; DATOS partitura_A8F6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x78 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (36 bytes)
;   0xa8f6..0xa91a  (36 bytes)
DATA_partitura_A8F6:
	defb 0d3h,000h,0d4h,0b0h,0e9h,003h,0eah,00bh,0ebh,033h,033h,033h,0d3h,020h,010h,000h	; a8f6  .........333. ..
	defb 0d4h,0b0h,0a0h,090h,080h,070h,0feh,001h,0f8h,043h,0e9h,006h,0eah,00ch,0edh,017h	; a906  .....p...C......
	defb 0ebh,091h,033h,011h	; a916

; ----------------------------------------------------------------------
; DATOS partitura_A91A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x78 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (29 bytes)
;   0xa91a..0xa937  (29 bytes)
DATA_partitura_A91A:
	defb 0f0h,012h,035h,0f5h,0d2h,021h,031h,021h,031h,021h,031h,0fbh,003h,021h,031h,021h	; a91a  ..5..!1!1!1..!1!
	defb 061h,051h,061h,0f5h,081h,091h,081h,091h,081h,091h,0fbh,002h,0edh	; a92a  aQa..........

; ----------------------------------------------------------------------
; DATOS partitura_A937: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x78 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xa937..0xa942  (11 bytes)
DATA_partitura_A937:
	defb 018h,081h,091h,081h,091h,081h,091h,0edh,019h,081h,091h	; a937  ...........

; ----------------------------------------------------------------------
; DATOS partitura_A942: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x78 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (16 bytes)
;   0xa942..0xa952  (16 bytes)
DATA_partitura_A942:
	defb 081h,091h,081h,091h,0feh,001h,0f8h,043h,0e9h,006h,0eah,00ch,0edh,017h,0ebh,091h	; a942  .......C........

; ----------------------------------------------------------------------
; DATOS partitura_A952: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x78 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (37 bytes)
;   0xa952..0xa977  (37 bytes)
DATA_partitura_A952:
	defb 033h,011h,0f0h,012h,035h,0f5h,0d2h,021h,031h,021h,031h,021h,031h,0fbh,003h,021h	; a952  3...5..!1!1!1..!
	defb 031h,021h,061h,051h,061h,0f5h,081h,091h,081h,091h,081h,091h,0fbh,002h,0edh,019h	; a962  1!aQa...........
	defb 081h,091h,081h,091h,081h	; a972

; ----------------------------------------------------------------------
; DATOS partitura_A977: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x78 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa977..0xa978  (1 bytes)
DATA_partitura_A977:
	defb 091h	; a977

; ----------------------------------------------------------------------
; DATOS partitura_A978: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x78 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (37 bytes)
;   0xa978..0xa99d  (37 bytes)
DATA_partitura_A978:
	defb 0f8h,009h,0eah,00ch,0ebh,033h,039h,002h,0d3h,020h,0d4h,090h,080h,050h,090h,080h	; a978  .....39.. ...P..
	defb 050h,020h,080h,050h,020h,0d5h,090h,0feh,001h,0f8h,046h,0e9h,006h,0eah,00fh,0ebh	; a988  P .P .....F.....
	defb 01bh,027h,003h,0f5h,0d5h	; a998

; ----------------------------------------------------------------------
; DATOS partitura_A99D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x78 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (79 bytes)
;   0xa99d..0xa9ec  (79 bytes)
DATA_partitura_A99D:
	defb 030h,030h,091h,031h,095h,0fbh,003h,030h,030h,091h,0d5h,031h,0eah,00fh,0f8h,023h	; a99d  00.1...00..1...#
	defb 0b1h,0d4h,001h,031h,0f8h,046h,0eah,00fh,0f5h,0d5h,020h,020h,081h,021h,085h,0fbh	; a9ad  ...1.F....  .!..
	defb 004h,0feh,001h,0f8h,046h,0e9h,006h,0eah,00fh,0ebh,01bh,027h,003h,0f5h,0d5h,030h	; a9bd  ....F......'...0
	defb 030h,091h,031h,095h,0fbh,003h,030h,030h,091h,031h,0f8h,023h,0eah,00fh,0b1h,0d4h	; a9cd  0.1...00.1.#....
	defb 001h,031h,0f8h,046h,0eah,00fh,0f5h,0d5h,020h,020h,081h,021h,085h,0fbh,003h	; a9dd  .1.F....  .!...

; ----------------------------------------------------------------------
; DATOS partitura_A9EC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x78 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa9ec..0xa9ed  (1 bytes)
DATA_partitura_A9EC:
	defb 0eah	; a9ec

; ----------------------------------------------------------------------
; DATOS partitura_A9ED: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x78 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (10 bytes)
;   0xa9ed..0xa9f7  (10 bytes)
DATA_partitura_A9ED:
	defb 00fh,0f8h,023h,0d5h,060h,060h,051h,090h,090h,081h	; a9ed  ..#.``Q...

; ----------------------------------------------------------------------
; DATOS partitura_A9F7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x78 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xa9f7..0xa9fe  (7 bytes)
DATA_partitura_A9F7:
	defb 0d4h,001h,0d5h,0b1h,0fdh,00ch,0a9h	; a9f7

; ----------------------------------------------------------------------
; DATOS partitura_A9FE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x78 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (59 bytes)
;   0xa9fe..0xaa39  (59 bytes)
DATA_partitura_A9FE:
	defb 0feh,001h,0f8h,002h,0e9h,009h,0eah,00eh,0ebh,024h,037h,0a1h,0f0h,013h,022h,0d6h	; a9fe  .........$7...".
	defb 050h,001h,0d1h,09fh,0feh,001h,0f8h,054h,0e9h,006h,0eah,006h,0d8h,0ebh,033h,0b7h	; aa0e  P......T......3.
	defb 003h,0d3h,091h,0d2h,021h,081h,051h,061h,081h,0d3h,021h,0d2h,031h,021h,091h,081h	; aa1e  ....!.Qa..!.1!..
	defb 051h,0d3h,061h,0d2h,091h,081h,001h,051h,061h,0d3h,091h	; aa2e  Q.a....Qa..

; ----------------------------------------------------------------------
; DATOS partitura_AA39: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x78 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (5 bytes)
;   0xaa39..0xaa3e  (5 bytes)
DATA_partitura_AA39:
	defb 0d2h,081h,061h,051h,0d2h	; aa39

; ----------------------------------------------------------------------
; DATOS partitura_AA3E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x78 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xaa3e..0xaa42  (4 bytes)
DATA_partitura_AA3E:
	defb 021h,031h,0d3h,021h	; aa3e

; ----------------------------------------------------------------------
; DATOS partitura_AA42: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x78 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (79 bytes)
;   0xaa42..0xaa91  (79 bytes)
DATA_partitura_AA42:
	defb 0d2h,021h,081h,051h,061h,081h,0d3h,051h,0d2h,031h,021h,091h,081h,051h,0f8h,052h	; aa42  .!.Qa..Q.1!..Q.R
	defb 0d2h,061h,051h,091h,081h,0d1h,001h,0d2h,0b1h,0f8h,048h,0d1h,061h,051h,091h,081h	; aa52  .aQ.......H.aQ..
	defb 0d0h,001h,0d1h,0b1h,0feh,001h,0f8h,054h,0e9h,006h,0eah,006h,0ebh,033h,0b7h,003h	; aa62  .......T.....3..
	defb 0d3h,091h,0d2h,021h,081h,051h,061h,081h,0d3h,021h,0d2h,031h,021h,091h,081h,051h	; aa72  ...!.Qa..!.1!..Q
	defb 0d3h,061h,0d2h,091h,081h,001h,051h,061h,0d3h,091h,0d2h,081h,061h,051h,0d2h	; aa82  .a....Qa....aQ.

; ----------------------------------------------------------------------
; DATOS partitura_AA91: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x78 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (75 bytes)
;   0xaa91..0xaadc  (75 bytes)
DATA_partitura_AA91:
	defb 021h,031h,0d3h,021h,0d2h,021h,081h,051h,061h,081h,0d3h,051h,0d2h,031h,021h,091h	; aa91  !1.!.!.Qa..Q.1!.
	defb 081h,051h,0f8h,019h,0eah,00ch,0ebh,00ah,057h,003h,0d1h,021h,091h,081h,051h,061h	; aaa1  .Q......W..!..Qa
	defb 091h,0f8h,047h,0eah,008h,0ebh,033h,0b7h,002h,0d1h,020h,0d2h,090h,080h,050h,090h	; aab1  ..G...3... ...P.
	defb 080h,050h,020h,080h,050h,020h,0d3h,090h,0feh,001h,0f8h,02ah,0e9h,006h,0eah,004h	; aac1  .P .P .....*....
	defb 0ebh,033h,0b7h,002h,0f5h,0d3h,090h,0d2h,030h,050h,060h	; aad1  .3......0P`

; ----------------------------------------------------------------------
; DATOS partitura_AADC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x78 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xaadc..0xaae4  (8 bytes)
DATA_partitura_AADC:
	defb 080h,090h,0d3h,080h,0d2h,050h,060h,030h	; aadc  .....P`0

; ----------------------------------------------------------------------
; DATOS partitura_AAE4: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x78 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xaae4..0xaaec  (8 bytes)
DATA_partitura_AAE4:
	defb 050h,060h,0d3h,030h,0d2h,080h,090h,060h	; aae4  P`.0...`

; ----------------------------------------------------------------------
; DATOS partitura_AAEC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x78 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (75 bytes)
;   0xaaec..0xab37  (75 bytes)
DATA_partitura_AAEC:
	defb 080h,050h,0d3h,060h,0d2h,030h,050h,060h,030h,080h,0fbh,002h,0f5h,0d3h,090h,0d2h	; aaec  .P.`.0P`0.......
	defb 030h,050h,060h,080h,090h,0d3h,080h,0d2h,050h,060h,030h,050h,060h,0d3h,030h,0d2h	; aafc  0P`.....P`0P`.0.
	defb 080h,090h,060h,080h,050h,0d3h,060h,0d2h,030h,050h,060h,030h,080h,0fbh,002h,0feh	; ab0c  ..`.P.`.0P`0....
	defb 001h,0f8h,02ah,0e9h,006h,0eah,004h,0ebh,033h,0b7h,002h,0f5h,0d3h,090h,0d2h,030h	; ab1c  ..*.....3......0
	defb 050h,060h,080h,090h,0d3h,080h,0d2h,050h,060h,030h,050h	; ab2c  P`.....P`0P

; ----------------------------------------------------------------------
; DATOS partitura_AB37: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x78 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xab37..0xab3b  (4 bytes)
DATA_partitura_AB37:
	defb 060h,0d3h,030h,0d2h	; ab37

; ----------------------------------------------------------------------
; DATOS partitura_AB3B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x78 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xab3b..0xab3c  (1 bytes)
DATA_partitura_AB3B:
	defb 080h	; ab3b

; ----------------------------------------------------------------------
; DATOS partitura_AB3C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x78 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xab3c..0xab3f  (3 bytes)
DATA_partitura_AB3C:
	defb 090h,060h,080h	; ab3c

; ----------------------------------------------------------------------
; DATOS partitura_AB3F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x78 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xab3f..0xab43  (4 bytes)
DATA_partitura_AB3F:
	defb 050h,0d3h,060h,0d2h	; ab3f

; ----------------------------------------------------------------------
; DATOS partitura_AB43: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x78 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xab43..0xab47  (4 bytes)
DATA_partitura_AB43:
	defb 030h,050h,060h,030h	; ab43

; ----------------------------------------------------------------------
; DATOS partitura_AB47: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x78 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xab47..0xab4b  (4 bytes)
DATA_partitura_AB47:
	defb 080h,0fbh,002h,0f5h	; ab47

; ----------------------------------------------------------------------
; DATOS partitura_AB4B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x78 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xab4b..0xab4f  (4 bytes)
DATA_partitura_AB4B:
	defb 0d3h,090h,0d2h,030h	; ab4b

; ----------------------------------------------------------------------
; DATOS partitura_AB4F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x78 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (33 bytes)
;   0xab4f..0xab70  (33 bytes)
DATA_partitura_AB4F:
	defb 050h,060h,080h,090h,0d3h,080h,0d2h,050h,060h,030h,050h,060h,0d3h,030h,0d2h,080h	; ab4f  P`.....P`0P`.0..
	defb 090h,060h,080h,050h,0d3h,060h,0d2h,030h,050h,060h,030h,080h,0fbh,002h,0fdh,012h	; ab5f  .`.P.`.0P`0.....
	defb 0aah	; ab6f

; ----------------------------------------------------------------------
; DATOS partitura_AB70: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x78 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (5 bytes)
;   0xab70..0xab75  (5 bytes)
DATA_partitura_AB70:
	defb 0feh,001h,0f8h,002h,0e9h	; ab70

; ----------------------------------------------------------------------
; DATOS partitura_AB75: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x78 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xab75..0xab7c  (7 bytes)
DATA_partitura_AB75:
	defb 009h,0eah,00eh,0ebh,024h,047h,0a1h	; ab75

; ----------------------------------------------------------------------
; DATOS partitura_AB7C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x78 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (59 bytes)
;   0xab7c..0xabb7  (59 bytes)
DATA_partitura_AB7C:
	defb 0f0h,013h,032h,0dbh,002h,0d6h,030h,001h,0d1h,03fh,0f0h,000h,0feh,001h,0f8h,04bh	; ab7c  ..2...0..?.....K
	defb 0e9h,009h,0eah,00dh,0edh,025h,0ebh,087h,029h,091h,0d4h,023h,0edh,02ah,037h,093h	; ab8c  .....%..)..#.*7.
	defb 087h,033h,063h,05fh,0edh,062h,0eah,00fh,02fh,0feh,001h,0f8h,04bh,0e9h,009h,0eah	; ab9c  .3c_.b../...K...
	defb 00dh,0edh,025h,0ebh,087h,029h,091h,0d4h,023h,0edh,02ah	; abac  ..%..)..#.*

; ----------------------------------------------------------------------
; DATOS partitura_ABB7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x78 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (44 bytes)
;   0xabb7..0xabe3  (44 bytes)
DATA_partitura_ABB7:
	defb 037h,093h,087h,033h,063h,02fh,0f8h,050h,0dbh,005h,0dch,0ebh,053h,03ah,002h,0eah	; abb7  7..3c/.P....S:..
	defb 00fh,0e9h,006h,0d4h,021h,091h,081h,051h,061h,091h,0f8h,002h,0eah,00ch,0ebh,032h	; abc7  ....!..Qa......2
	defb 027h,091h,0f0h,014h,042h,0d6h,040h,001h,0d0h,02bh,0d8h,0f0h	; abd7  '...B.@..+..

; ----------------------------------------------------------------------
; DATOS partitura_ABE3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x78 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (44 bytes)
;   0xabe3..0xac0f  (44 bytes)
DATA_partitura_ABE3:
	defb 000h,0dch,0feh,001h,0f8h,012h,0f0h,000h,0e9h,006h,0eah,007h,0edh,013h,0ebh,087h	; abe3  ................
	defb 033h,011h,0f5h,0d2h,051h,061h,051h,061h,051h,061h,0fbh,003h,081h,091h,081h,091h	; abf3  3...QaQaQa......
	defb 081h,091h,0f5h,0d2h,0b1h,0d1h,001h,0d2h,0b1h,0d1h,001h,0d2h	; ac03  ............

; ----------------------------------------------------------------------
; DATOS partitura_AC0F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x78 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xac0f..0xac11  (2 bytes)
DATA_partitura_AC0F:
	defb 0b1h,0d1h	; ac0f

; ----------------------------------------------------------------------
; DATOS partitura_AC11: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x78 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (49 bytes)
;   0xac11..0xac42  (49 bytes)
DATA_partitura_AC11:
	defb 001h,0fbh,004h,0feh,001h,0f8h,011h,0f0h,000h,0e9h,006h,0eah,007h,0edh,013h,0ebh	; ac11  ................
	defb 087h,033h,011h,0f5h,0d2h,051h,061h,051h,061h,051h,061h,0fbh,003h,081h,091h,081h	; ac21  .3...QaQaQa.....
	defb 091h,081h,091h,0f5h,0d2h,0b1h,0d1h,001h,0d2h,0b1h,0d1h,001h,0d2h,0b1h,0d1h,001h	; ac31  ................
	defb 0fbh	; ac41

; ----------------------------------------------------------------------
; DATOS partitura_AC42: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x78 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xac42..0xac46  (4 bytes)
DATA_partitura_AC42:
	defb 004h,0fdh,088h,0abh	; ac42

; ----------------------------------------------------------------------
; DATOS partitura_AC46: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x78 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xac46..0xac4e  (8 bytes)
DATA_partitura_AC46:
	defb 0feh,001h,0f8h,002h,0e9h,009h,0eah,00eh	; ac46  ........

; ----------------------------------------------------------------------
; DATOS partitura_AC4E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x78 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (39 bytes)
;   0xac4e..0xac75  (39 bytes)
DATA_partitura_AC4E:
	defb 0ebh,024h,047h,0a1h,0f0h,013h,032h,0d6h,040h,001h,0d1h,02fh,0f0h,000h,0feh,001h	; ac4e  .$G...2.@../....
	defb 0f8h,04bh,0e9h,009h,0eeh,08dh,0eah,007h,0edh,012h,0ebh,086h,016h,0f1h,0d4h,025h	; ac5e  .K.............%
	defb 037h,093h,087h,033h,063h,05fh,0edh	; ac6e

; ----------------------------------------------------------------------
; DATOS partitura_AC75: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x78 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (9 bytes)
;   0xac75..0xac7e  (9 bytes)
DATA_partitura_AC75:
	defb 062h,0eah,00ah,02dh,0feh,001h,0f8h,04bh,0e9h	; ac75  b..-...K.

; ----------------------------------------------------------------------
; DATOS partitura_AC7E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x78 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (36 bytes)
;   0xac7e..0xaca2  (36 bytes)
DATA_partitura_AC7E:
	defb 009h,0eeh,08dh,0eah,007h,0edh,012h,0ebh,086h,016h,0f1h,0d4h,025h,037h,093h,087h	; ac7e  ............%7..
	defb 033h,063h,02dh,0f8h,050h,0c1h,0ebh,043h,03ah,002h,0eah,00bh,0e9h,006h,0d4h,021h	; ac8e  3c-.P..C:......!
	defb 091h,081h,051h,060h	; ac9e

; ----------------------------------------------------------------------
; DATOS partitura_ACA2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x78 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (12 bytes)
;   0xaca2..0xacae  (12 bytes)
DATA_partitura_ACA2:
	defb 0f8h,002h,0efh,0eah,00ah,0ebh,032h,027h,091h,0f0h,014h,042h	; aca2  ......2'...B

; ----------------------------------------------------------------------
; DATOS partitura_ACAE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x78 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (65 bytes)
;   0xacae..0xacef  (65 bytes)
DATA_partitura_ACAE:
	defb 0d6h,040h,001h,0d1h,09bh,0f0h,000h,0d8h,0feh,001h,0f8h,012h,0f0h,000h,0e9h,006h	; acae  .@..............
	defb 0c2h,0eeh,082h,0eah,004h,0edh,012h,0ebh,087h,012h,0f1h,0f5h,0d2h,051h,061h,051h	; acbe  .............QaQ
	defb 061h,051h,061h,0fbh,003h,081h,091h,081h,091h,081h,091h,0f5h,0d2h,0b1h,0d1h,001h	; acce  aQa.............
	defb 0d2h,0b1h,0d1h,001h,0d2h,0b1h,0d1h,001h,0fbh,003h,0d2h,0b1h,0d1h,001h,0d2h,0b1h	; acde  ................
	defb 0d1h	; acee

; ----------------------------------------------------------------------
; DATOS partitura_ACEF: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x78 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (61 bytes)
;   0xacef..0xad2c  (61 bytes)
DATA_partitura_ACEF:
	defb 001h,0d2h,0b0h,0efh,0feh,001h,0f8h,011h,0f0h,000h,0e9h,006h,0c2h,0eeh,082h,0eah	; acef  ................
	defb 004h,0edh,012h,0ebh,087h,012h,0f1h,0f5h,0d2h,051h,061h,051h,061h,051h,061h,0fbh	; acff  .........QaQaQa.
	defb 003h,081h,091h,081h,091h,081h,091h,0f5h,0d2h,0b1h,0d1h,001h,0d2h,0b1h,0d1h,001h	; ad0f  ................
	defb 0d2h,0b1h,0d1h,001h,0fbh,003h,0d2h,0b1h,0d1h,001h,0d2h,0b1h,0d1h	; ad1f  .............

; ----------------------------------------------------------------------
; DATOS partitura_AD2C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x78 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xad2c..0xad33  (7 bytes)
DATA_partitura_AD2C:
	defb 001h,0d2h,0b0h,0efh,0fdh,05ch,0ach	; ad2c

; ----------------------------------------------------------------------
; DATOS partitura_AD33: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xad33..0xad37  (4 bytes)
DATA_partitura_AD33:
	defb 0feh,004h,0e9h,00bh	; ad33

; ----------------------------------------------------------------------
; DATOS partitura_AD37: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (9 bytes)
;   0xad37..0xad40  (9 bytes)
DATA_partitura_AD37:
	defb 0a0h,0b0h,000h,0a0h,0b0h,000h,010h,000h,000h	; ad37  .........

; ----------------------------------------------------------------------
; DATOS partitura_AD40: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (10 bytes)
;   0xad40..0xad4a  (10 bytes)
DATA_partitura_AD40:
	defb 010h,020h,000h,0a0h,0b0h,000h,0a0h,0b0h,000h,010h	; ad40  . ........

; ----------------------------------------------------------------------
; DATOS partitura_AD4A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (29 bytes)
;   0xad4a..0xad67  (29 bytes)
DATA_partitura_AD4A:
	defb 000h,000h,010h,020h,000h,063h,000h,000h,010h,000h,000h,010h,000h,000h,010h,000h	; ad4a  ... .c..........
	defb 000h,010h,000h,000h,010h,000h,000h,010h,020h,000h,0fdh,033h,0adh	; ad5a  ........ ..3.

; ----------------------------------------------------------------------
; DATOS partitura_AD67: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (34 bytes)
;   0xad67..0xad89  (34 bytes)
DATA_partitura_AD67:
	defb 0feh,001h,0d9h,0d6h,001h,001h,0e9h,008h,0f0h,007h,011h,0eah,005h,0edh,014h,0ebh	; ad67  ................
	defb 089h,026h,003h,0e9h,00bh,0eeh,001h,0c1h,0d1h,000h,0d0h,000h,0d1h,070h,030h,0a0h	; ad77  .&...........p0.
	defb 050h,0fdh	; ad87

; ----------------------------------------------------------------------
; DATOS partitura_AD89: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xad89..0xad8b  (2 bytes)
DATA_partitura_AD89:
	defb 07fh,0adh	; ad89

; ----------------------------------------------------------------------
; DATOS partitura_AD8B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (28 bytes)
;   0xad8b..0xada7  (28 bytes)
DATA_partitura_AD8B:
	defb 0feh,001h,0f6h,0f1h,023h,02ah,001h,004h,0d9h,0d6h,010h,002h,0e9h,00bh,0eah,00fh	; ad8b  ....#*..........
	defb 0ebh,01ah,037h,031h,0d4h,000h,001h,000h,001h,001h,031h,051h	; ad9b  ..71......1Q

; ----------------------------------------------------------------------
; DATOS partitura_ADA7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (23 bytes)
;   0xada7..0xadbe  (23 bytes)
DATA_partitura_ADA7:
	defb 000h,001h,000h,001h,001h,031h,051h,061h,0c7h,0c5h,0c1h,0d3h,000h,0d4h,070h,030h	; ada7  .....1Qa......p0
	defb 0d3h,010h,0d4h,0a1h,0fdh,08bh,0adh	; adb7

; ----------------------------------------------------------------------
; DATOS partitura_ADBE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (9 bytes)
;   0xadbe..0xadc7  (9 bytes)
DATA_partitura_ADBE:
	defb 0feh,001h,0f2h,001h,0e9h,004h,0c0h,0d9h,0d6h	; adbe  .........

; ----------------------------------------------------------------------
; DATOS partitura_ADC7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (22 bytes)
;   0xadc7..0xaddd  (22 bytes)
DATA_partitura_ADC7:
	defb 010h,003h,0e9h,00bh,0eah,007h,0ebh,009h,027h,001h,0eeh,010h,0d4h,000h,001h,000h	; adc7  ........'.......
	defb 001h,001h,031h,051h,000h,001h	; add7

; ----------------------------------------------------------------------
; DATOS partitura_ADDD: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xaddd..0xadde  (1 bytes)
DATA_partitura_ADDD:
	defb 000h	; addd

; ----------------------------------------------------------------------
; DATOS partitura_ADDE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (22 bytes)
;   0xadde..0xadf4  (22 bytes)
DATA_partitura_ADDE:
	defb 001h,001h,031h,051h,061h,0c7h,0c5h,0c1h,0eeh,088h,0d3h,000h,0d4h,070h,030h,0d3h	; adde  ..1Qa........p0.
	defb 010h,0d4h,0a1h,0fdh,0d1h,0adh	; adee

; ----------------------------------------------------------------------
; DATOS partitura_ADF4: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xadf4..0xadfc  (8 bytes)
DATA_partitura_ADF4:
	defb 0feh,001h,0f8h,01dh,0d9h,0d6h,002h,001h	; adf4  ........

; ----------------------------------------------------------------------
; DATOS partitura_ADFC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (22 bytes)
;   0xadfc..0xae12  (22 bytes)
DATA_partitura_ADFC:
	defb 0e9h,008h,0f0h,007h,011h,0e9h,00bh,0eah,005h,0edh,013h,0ebh,089h,026h,001h,0d1h	; adfc  .............&..
	defb 001h,071h,0a1h,0fdh,0f4h,0adh	; ae0c

; ----------------------------------------------------------------------
; DATOS partitura_AE12: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xae12..0xae1d  (11 bytes)
DATA_partitura_AE12:
	defb 0feh,001h,0f8h,01dh,0d9h,0d6h,001h,001h,0e9h,008h,0f0h	; ae12  ...........

; ----------------------------------------------------------------------
; DATOS partitura_AE1D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (22 bytes)
;   0xae1d..0xae33  (22 bytes)
DATA_partitura_AE1D:
	defb 007h,011h,0eah,005h,0edh,013h,0ebh,089h,026h,001h,0e9h,00bh,0c0h,0d1h,0d0h,001h	; ae1d  ........&.......
	defb 0d1h,031h,051h,0fdh,02ah,0aeh	; ae2d

; ----------------------------------------------------------------------
; DATOS partitura_AE33: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (32 bytes)
;   0xae33..0xae53  (32 bytes)
DATA_partitura_AE33:
	defb 0feh,004h,0e9h,008h,0d0h,0f5h,010h,010h,021h,0fbh,01dh,010h,010h,0e9h,001h,0d1h	; ae33  ........!.......
	defb 074h,085h,094h,0e9h,008h,0d0h,0f5h,070h,0fbh,008h,0a0h,000h,000h,000h,020h,0f5h	; ae43  t......p...... .

; ----------------------------------------------------------------------
; DATOS partitura_AE53: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xae53..0xae54  (1 bytes)
DATA_partitura_AE53:
	defb 000h	; ae53

; ----------------------------------------------------------------------
; DATOS partitura_AE54: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (55 bytes)
;   0xae54..0xae8b  (55 bytes)
DATA_partitura_AE54:
	defb 0fbh,007h,020h,000h,000h,000h,0a0h,0a0h,000h,000h,020h,0f5h,000h,0fbh,007h,020h	; ae54  .. ....... ....
	defb 000h,000h,000h,0a0h,000h,000h,000h,020h,0f5h,000h,0fbh,007h,020h,000h,000h,000h	; ae64  ....... .... ...
	defb 0f5h,0a0h,0a0h,000h,000h,020h,000h,000h,000h,0fbh,002h,0a0h,000h,000h,000h,020h	; ae74  ..... .........
	defb 0f5h,000h,0fbh,007h,020h,000h,000h	; ae84

; ----------------------------------------------------------------------
; DATOS partitura_AE8B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (40 bytes)
;   0xae8b..0xaeb3  (40 bytes)
DATA_partitura_AE8B:
	defb 000h,0a0h,0a0h,000h,000h,020h,0f5h,000h,0fbh,007h,020h,000h,000h,000h,0a0h,000h	; ae8b  ..... .... .....
	defb 000h,000h,020h,0f5h,000h,0fbh,007h,020h,000h,000h,000h,0e9h,004h,070h,070h,0a1h	; ae9b  .. .... .....pp.
	defb 0a1h,070h,070h,071h,071h,071h,071h,090h	; aeab  .ppqqqq.

; ----------------------------------------------------------------------
; DATOS partitura_AEB3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (14 bytes)
;   0xaeb3..0xaec1  (14 bytes)
DATA_partitura_AEB3:
	defb 090h,091h,091h,091h,091h,091h,0a1h,0a1h,0f5h,0b7h,077h,0b1h,0a5h,077h	; aeb3  ..........w..w

; ----------------------------------------------------------------------
; DATOS partitura_AEC1: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xaec1..0xaec2  (1 bytes)
DATA_partitura_AEC1:
	defb 0fbh	; aec1

; ----------------------------------------------------------------------
; DATOS partitura_AEC2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (43 bytes)
;   0xaec2..0xaeed  (43 bytes)
DATA_partitura_AEC2:
	defb 003h,0b7h,077h,070h,070h,0a1h,0a1h,070h,070h,0a1h,0a1h,071h,0a1h,0f5h,0b7h,077h	; aec2  ..wpp..pp..q...w
	defb 0b1h,0a5h,077h,0fbh,003h,070h,070h,0a1h,0a1h,070h,070h,0a1h,0a1h,070h,070h,0a1h	; aed2  ..w..pp..pp..pp.
	defb 0d1h,060h,070h,081h,091h,091h,0d0h,071h,0d1h,071h,0d0h	; aee2  .`p....q.q.

; ----------------------------------------------------------------------
; DATOS partitura_AEED: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (65 bytes)
;   0xaeed..0xaf2e  (65 bytes)
DATA_partitura_AEED:
	defb 070h,0d1h,060h,070h,080h,0d0h,0f5h,0b7h,073h,0a1h,0a3h,005h,073h,023h,0fbh,003h	; aeed  p.`p....s...s#..
	defb 0b7h,073h,0a1h,0a3h,001h,0a3h,071h,071h,071h,071h,0f5h,0b7h,077h,0a1h,0a3h,0a1h	; aefd  .s....qqqq..w...
	defb 073h,023h,0fbh,002h,0b5h,0a1h,073h,073h,0b5h,0a1h,073h,023h,0b5h,0a1h,073h,0a3h	; af0d  s#....ss..s#..s.
	defb 071h,071h,071h,071h,0d1h,061h,071h,081h,091h,0d0h,0f5h,0b7h,073h,0a1h,0a3h,005h	; af1d  qqqq.aq.....s...
	defb 073h	; af2d

; ----------------------------------------------------------------------
; DATOS partitura_AF2E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xaf2e..0xaf32  (4 bytes)
DATA_partitura_AF2E:
	defb 023h,0fbh,003h,0b7h	; af2e

; ----------------------------------------------------------------------
; DATOS sin identificar  0xaf32..0xaf94  (98 bytes)
DATA_AF32:
	defb 073h,0a1h,0a3h,001h,0a3h,071h,071h,071h,071h,0f5h,0b7h,077h,0a1h,0a3h,0a1h,073h	; af32  s....qqqq..w...s
	defb 023h,0fbh,003h,0b7h,077h,071h,075h,071h,071h,071h,071h,0d0h,0f5h,0b7h,077h,0a1h	; af42  #...wquqqqq...w.
	defb 0b5h,077h,0fbh,003h,0b7h,073h,0b3h,0e9h,001h,0d1h,094h,065h,074h,084h,095h,094h	; af52  .w...s.....et...
	defb 0e9h,004h,0d0h,051h,065h,0d0h,0f5h,0b7h,077h,0a1h,0a5h,077h,0fbh,002h,0b7h,073h	; af62  ...Qe...w..w...s
	defb 0b3h,090h,090h,091h,091h,090h,090h,091h,090h,090h,091h,091h,070h,070h,0a1h,071h	; af72  ............pp.q
	defb 070h,070h,091h,0a1h,091h,0a1h,071h,0a1h,0a1h,071h,0a0h,0a0h,0a1h,071h,0a1h,0fdh	; af82  pp....q..q...q..
	defb 0bbh,0aeh	; af92

; ----------------------------------------------------------------------
; DATOS partitura_AF94: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (23 bytes)
;   0xaf94..0xafab  (23 bytes)
DATA_partitura_AF94:
	defb 0feh,001h,0e9h,008h,0ech,0eah,006h,0f0h,002h,096h,0d6h,010h,001h,0d3h,08fh,0afh	; af94  ................
	defb 0bfh,0d2h,017h,030h,010h,0d3h,0b0h	; afa4

; ----------------------------------------------------------------------
; DATOS partitura_AFAB: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (27 bytes)
;   0xafab..0xafc6  (27 bytes)
DATA_partitura_AFAB:
	defb 0d2h,010h,0d3h,0b0h,0a0h,0b0h,0a0h,08fh,0afh,0bfh,0d2h,017h,0d1h,030h,010h,0d2h	; afab  .............0..
	defb 0b0h,0d1h,010h,0d2h,0b0h,0a0h,0b0h,0a0h,0eah,00ah,0ebh	; afbb  ...........

; ----------------------------------------------------------------------
; DATOS partitura_AFC6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xafc6..0xafca  (4 bytes)
DATA_partitura_AFC6:
	defb 009h,01bh,031h,0dbh	; afc6

; ----------------------------------------------------------------------
; DATOS partitura_AFCA: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xafca..0xafcb  (1 bytes)
DATA_partitura_AFCA:
	defb 005h	; afca

; ----------------------------------------------------------------------
; DATOS partitura_AFCB: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xafcb..0xafd1  (6 bytes)
DATA_partitura_AFCB:
	defb 0d5h,0f9h,0bfh,0b9h,0f9h,0bfh	; afcb

; ----------------------------------------------------------------------
; DATOS partitura_AFD1: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (29 bytes)
;   0xafd1..0xafee  (29 bytes)
DATA_partitura_AFD1:
	defb 0b9h,0eah,00bh,0ebh,009h,01bh,041h,0dbh,002h,0f5h,0d4h,083h,083h,080h,082h,083h	; afd1  ......A.........
	defb 0fbh,002h,0f5h,063h,063h,060h,062h,063h,0fbh,002h,0f5h,083h,083h	; afe1  ...cc`bc.....

; ----------------------------------------------------------------------
; DATOS partitura_AFEE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (40 bytes)
;   0xafee..0xb016  (40 bytes)
DATA_partitura_AFEE:
	defb 080h,082h,083h,0fbh,002h,063h,063h,060h,062h,063h,060h,060h,061h,060h,060h,061h	; afee  .....cc`bc``a``a
	defb 060h,060h,060h,060h,060h,060h,060h,060h,0eah,00bh,0ebh,009h,01bh,041h,0dbh,002h	; affe  ````````.....A..
	defb 0d3h,0f9h,0e0h,0b9h,0d4h,0f9h,0f0h,0b9h	; b00e  ........

; ----------------------------------------------------------------------
; DATOS partitura_B016: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (15 bytes)
;   0xb016..0xb025  (15 bytes)
DATA_partitura_B016:
	defb 0d3h,010h,0d4h,060h,061h,062h,061h,0d3h,010h,0d4h,0b0h,0a0h,080h,060h,040h	; b016  ...`aba......`@

; ----------------------------------------------------------------------
; DATOS partitura_B025: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (10 bytes)
;   0xb025..0xb02f  (10 bytes)
DATA_partitura_B025:
	defb 030h,010h,0eah,00bh,0ebh,009h,01bh,041h,0dbh,002h	; b025  0......A..

; ----------------------------------------------------------------------
; DATOS partitura_B02F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xb02f..0xb036  (7 bytes)
DATA_partitura_B02F:
	defb 0d3h,0f9h,0e0h,0b9h,0f9h,01ah,0bah	; b02f

; ----------------------------------------------------------------------
; DATOS sin identificar  0xb036..0xb0c8  (146 bytes)
DATA_B036:
	defb 0d4h,0f9h,02ah,0bah,0eah,00bh,0ebh,009h,01bh,041h,0dbh,002h,0d4h,080h,060h,081h	; b036  ..*......A....`.
	defb 0b1h,080h,060h,081h,0d3h,011h,0d4h,080h,060h,081h,0d3h,031h,0d4h,080h,060h,081h	; b046  ..`.....`..1..`.
	defb 0d3h,061h,0d4h,080h,060h,081h,0b0h,0a0h,080h,060h,080h,060h,081h,0b1h,080h,060h	; b056  .a..`....`.`...`
	defb 081h,0d3h,011h,0d4h,080h,060h,081h,0d3h,031h,0d4h,080h,060h,081h,0d3h,061h,0d4h	; b066  .....`..1..`..a.
	defb 080h,060h,081h,0b0h,0b2h,0feh,001h,0e9h,008h,0eah,00bh,0ebh,009h,01bh,041h,0dbh	; b076  .`............A.
	defb 002h,0d4h,080h,060h,081h,0b1h,080h,060h,081h,0d3h,011h,0d4h,080h,060h,081h,0d3h	; b086  ...`...`.....`..
	defb 031h,0d4h,080h,060h,081h,0d3h,061h,0d4h,080h,060h,081h,0b0h,0a0h,080h,060h,080h	; b096  1..`..a..`....`.
	defb 060h,081h,0b1h,080h,060h,081h,0d3h,011h,0d4h,080h,060h,081h,0d3h,031h,0d4h,080h	; b0a6  `...`.....`..1..
	defb 060h,081h,0d3h,061h,030h,010h,0d4h,0b0h,0d3h,010h,0d4h,0b0h,0a0h,0b0h,0a0h,0fdh	; b0b6  `..a0...........
	defb 0d2h,0afh	; b0c6

; ----------------------------------------------------------------------
; DATOS partitura_B0C8: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (64 bytes)
;   0xb0c8..0xb108  (64 bytes)
DATA_partitura_B0C8:
	defb 0feh,001h,0e9h,008h,0ech,0c1h,0eah,005h,0f0h,002h,096h,0d6h,010h,001h,0d3h,08fh	; b0c8  ................
	defb 0afh,0bfh,0d2h,017h,030h,010h,0d3h,0b0h,0d2h,010h,0d3h,0b0h,0a0h,0b0h,0a0h,08fh	; b0d8  ....0...........
	defb 0afh,0bfh,0d2h,017h,0d1h,030h,090h,0d2h,0b0h,0d1h,010h,0d2h,0b0h,0a0h,0eah,00bh	; b0e8  .....0..........
	defb 0ebh,009h,01bh,031h,0dbh,005h,0d4h,0f9h,0bfh,0b9h,0f9h,0bfh,0b9h,0ech,0c1h,0eah	; b0f8  ...1............

; ----------------------------------------------------------------------
; DATOS partitura_B108: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (36 bytes)
;   0xb108..0xb12c  (36 bytes)
DATA_partitura_B108:
	defb 007h,0f0h,002h,094h,0d6h,010h,001h,0d2h,08bh,081h,0a1h,0b5h,0a9h,085h,069h,045h	; b108  ..............iE
	defb 035h,013h,08bh,081h,0a1h,0b7h,0d1h,013h,0d2h,083h,0b5h,0a9h,080h,086h,065h,0ech	; b118  5.............e.
	defb 0c1h,0eah,007h,0f0h	; b128

; ----------------------------------------------------------------------
; DATOS partitura_B12C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xb12c..0xb130  (4 bytes)
DATA_partitura_B12C:
	defb 002h,043h,0d6h,010h	; b12c

; ----------------------------------------------------------------------
; DATOS partitura_B130: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xb130..0xb137  (7 bytes)
DATA_partitura_B130:
	defb 001h,0d3h,047h,087h,0d1h,010h,011h	; b130

; ----------------------------------------------------------------------
; DATOS partitura_B137: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (33 bytes)
;   0xb137..0xb158  (33 bytes)
DATA_partitura_B137:
	defb 0d2h,0b0h,0b1h,0d1h,010h,011h,0d2h,0b0h,0b1h,080h,080h,0d1h,011h,0d3h,037h,067h	; b137  ..............7g
	defb 0d2h,0b0h,0b1h,0a0h,0a1h,0b0h,0b1h,0a0h,0a1h,0b0h,0a0h,080h,060h,0d3h,0bfh,0d2h	; b147  ............`...
	defb 037h	; b157

; ----------------------------------------------------------------------
; DATOS partitura_B158: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xb158..0xb159  (1 bytes)
DATA_partitura_B158:
	defb 087h	; b158

; ----------------------------------------------------------------------
; DATOS partitura_B159: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (12 bytes)
;   0xb159..0xb165  (12 bytes)
DATA_partitura_B159:
	defb 085h,069h,045h,067h,0ech,0eah,007h,0c1h,0f0h,002h,043h,0d6h	; b159  .iEg......C.

; ----------------------------------------------------------------------
; DATOS partitura_B165: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xb165..0xb177  (18 bytes)
DATA_partitura_B165:
	defb 010h,001h,0d2h,012h,0d3h,082h,0d2h,012h,042h,0d3h,080h,0b0h,0d2h,010h,030h,0d8h	; b165  ........B.....0.
	defb 0d1h,010h	; b175

; ----------------------------------------------------------------------
; DATOS partitura_B177: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xb177..0xb17b  (4 bytes)
DATA_partitura_B177:
	defb 0d2h,0b0h,0a0h,0b1h	; b177

; ----------------------------------------------------------------------
; DATOS partitura_B17B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xb17b..0xb181  (6 bytes)
DATA_partitura_B17B:
	defb 0a0h,080h,060h,0a0h,080h,060h	; b17b

; ----------------------------------------------------------------------
; DATOS partitura_B181: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xb181..0xb193  (18 bytes)
DATA_partitura_B181:
	defb 081h,060h,040h,010h,0d2h,032h,0d3h,0a2h,0d2h,032h,062h,0d3h,060h,0a0h,0d2h,011h	; b181  .`@..2...2b.`...
	defb 0d1h,030h	; b191

; ----------------------------------------------------------------------
; DATOS sin identificar  0xb193..0xb233  (160 bytes)
DATA_B193:
	defb 010h,0d2h,0b0h,0d1h,011h,0d2h,0b0h,0a0h,080h,0a0h,0b0h,0d1h,011h,0d2h,030h,060h	; b193  ..............0`
	defb 080h,0a0h,08fh,085h,0b5h,083h,0a7h,087h,067h,0a5h,0ech,0c1h,0eah,007h,0f0h,002h	; b1a3  ........g.......
	defb 024h,0d6h,010h,001h,0d2h,080h,060h,081h,0b1h,080h,060h,081h,0d1h,011h,0d2h,080h	; b1b3  $.....`...`.....
	defb 060h,081h,0d1h,031h,0d2h,080h,060h,081h,0d1h,061h,0d2h,080h,060h,081h,0b0h,0a0h	; b1c3  `..1..`..a..`...
	defb 080h,060h,080h,060h,081h,0b1h,080h,060h,081h,0d1h,011h,0d2h,080h,060h,081h,0d1h	; b1d3  .`.`...`.....`..
	defb 031h,0d2h,080h,060h,081h,0d1h,061h,0d2h,080h,060h,081h,0d2h,060h,062h,0ech,0eah	; b1e3  1..`..a..`..`b..
	defb 007h,0d2h,080h,060h,081h,0b1h,080h,060h,081h,0d1h,011h,0d2h,080h,060h,081h,0d1h	; b1f3  ...`...`.....`..
	defb 031h,0d2h,080h,060h,081h,0d1h,061h,0d2h,080h,060h,081h,0b0h,0a0h,080h,060h,080h	; b203  1..`..a..`....`.
	defb 060h,081h,0b1h,080h,060h,081h,0d1h,011h,0d2h,080h,060h,081h,0d1h,031h,0d2h,080h	; b213  `...`.....`..1..
	defb 060h,081h,0d1h,061h,030h,010h,0d2h,0b0h,0d1h,010h,0d2h,0b0h,0a0h,0fdh,005h,0b1h	; b223  `..a0...........

; ----------------------------------------------------------------------
; DATOS partitura_B233: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xb233..0xb23a  (7 bytes)
DATA_partitura_B233:
	defb 0feh,001h,0e9h,008h,0f8h,023h,0eah	; b233

; ----------------------------------------------------------------------
; DATOS partitura_B23A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (38 bytes)
;   0xb23a..0xb260  (38 bytes)
DATA_partitura_B23A:
	defb 00bh,0ebh,009h,03bh,011h,0dbh,005h,0d6h,030h,002h,0f5h,0d5h,080h,080h,081h,080h	; b23a  ........0.......
	defb 080h,081h,080h,080h,081h,080h,080h,080h,080h,0fbh,007h,080h,080h,081h,080h,080h	; b24a  ................
	defb 081h,0eah,00bh,0d4h,030h,010h	; b25a

; ----------------------------------------------------------------------
; DATOS partitura_B260: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (26 bytes)
;   0xb260..0xb27a  (26 bytes)
DATA_partitura_B260:
	defb 0d5h,0b0h,0d4h,010h,0d5h,0b0h,0a0h,0b0h,0a0h,0c2h,0f8h,011h,0eah,007h,0edh,026h	; b260  ...............&
	defb 0ebh,087h,01bh,091h,0dbh,003h,0f0h,002h,094h,0d6h	; b270  ..........

; ----------------------------------------------------------------------
; DATOS partitura_B27A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (14 bytes)
;   0xb27a..0xb288  (14 bytes)
DATA_partitura_B27A:
	defb 010h,001h,0d3h,08bh,081h,0a1h,0b5h,0a9h,085h,069h,045h,035h,013h,08bh	; b27a  .........iE5..

; ----------------------------------------------------------------------
; DATOS partitura_B288: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (33 bytes)
;   0xb288..0xb2a9  (33 bytes)
DATA_partitura_B288:
	defb 081h,0a1h,0b7h,0d2h,013h,0d3h,083h,0b5h,0a9h,084h,0e9h,004h,0feh,004h,0f8h,005h	; b288  ................
	defb 0d1h,030h,030h,031h,031h,041h,041h,051h,0feh,001h,0c3h,0e9h,008h,0f8h,00dh,0eah	; b298  .0011AAQ........
	defb 00ch	; b2a8

; ----------------------------------------------------------------------
; DATOS partitura_B2A9: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (34 bytes)
;   0xb2a9..0xb2cb  (34 bytes)
DATA_partitura_B2A9:
	defb 0ebh,00ah,02bh,021h,0dbh,003h,0d8h,0f0h,000h,0f5h,0f9h,04bh,0bah,080h,0d5h,080h	; b2a9  ..+!.......K....
	defb 0d4h,030h,0d5h,080h,0fbh,002h,0f5h,0f9h,05eh,0bah,060h,0d5h,060h,0d4h,010h,0d5h	; b2b9  .0......^.`.`...
	defb 060h,0fbh	; b2c9

; ----------------------------------------------------------------------
; DATOS partitura_B2CB: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xb2cb..0xb2ce  (3 bytes)
DATA_partitura_B2CB:
	defb 002h,0f5h,0f9h	; b2cb

; ----------------------------------------------------------------------
; DATOS partitura_B2CE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (56 bytes)
;   0xb2ce..0xb306  (56 bytes)
DATA_partitura_B2CE:
	defb 04bh,0bah,080h,0d5h,080h,0d4h,030h,0d5h,080h,0fbh,002h,0f9h,05eh,0bah,060h,0d5h	; b2ce  K.....0.....^.`.
	defb 060h,0d4h,010h,0d5h,060h,060h,060h,0d4h,060h,030h,0d5h,060h,060h,0d4h,060h,030h	; b2de  `...```.`0.``.`0
	defb 0d4h,010h,030h,040h,060h,080h,0a0h,0b0h,0d3h,010h,0e9h,001h,0f8h,054h,0eah,004h	; b2ee  ..0@`........T..
	defb 0ech,0d8h,0f0h,000h,0f9h,071h,0bah,0eah	; b2fe  .....q..

; ----------------------------------------------------------------------
; DATOS partitura_B306: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (24 bytes)
;   0xb306..0xb31e  (24 bytes)
DATA_partitura_B306:
	defb 002h,0f9h,071h,0bah,0eah,004h,0f9h,08dh,0bah,0eah,002h,0f9h,071h,0bah,0f8h,00dh	; b306  ..q.........q...
	defb 0eah,00ch,0ebh,00ah,02bh,011h,0e9h,008h	; b316  ....+...

; ----------------------------------------------------------------------
; DATOS partitura_B31E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (19 bytes)
;   0xb31e..0xb331  (19 bytes)
DATA_partitura_B31E:
	defb 0f5h,0f9h,04bh,0bah,080h,0d5h,080h,0d4h,030h,080h,0fbh,002h,0f5h,0f9h,05eh,0bah	; b31e  ..K.....0.....^.
	defb 060h,0d4h,060h	; b32e

; ----------------------------------------------------------------------
; DATOS partitura_B331: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (15 bytes)
;   0xb331..0xb340  (15 bytes)
DATA_partitura_B331:
	defb 0d3h,010h,060h,0fbh,002h,0e9h,001h,0f8h,054h,0eah,004h,0ech,0d8h,0f0h,000h	; b331  ..`.....T......

; ----------------------------------------------------------------------
; DATOS partitura_B340: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xb340..0xb352  (18 bytes)
DATA_partitura_B340:
	defb 0f9h,071h,0bah,0eah,002h,0f9h,071h,0bah,0eah,004h,0f9h,08dh,0bah,0eah,002h,0f9h	; b340  .q....q.........
	defb 071h,0bah	; b350

; ----------------------------------------------------------------------
; DATOS sin identificar  0xb352..0xb3dc  (138 bytes)
DATA_B352:
	defb 0f8h,00dh,0eah,00ch,0ebh,00ah,02bh,021h,0e9h,008h,0f5h,0d5h,040h,040h,0b0h,0d4h	; b352  ......+!....@@..
	defb 040h,0fbh,003h,040h,0d5h,040h,0b0h,040h,0f5h,0d5h,040h,040h,0b0h,0d4h,040h,0fbh	; b362  @..@.@.@..@@..@.
	defb 003h,040h,0d5h,040h,0b0h,040h,0f5h,0d5h,060h,060h,0d4h,010h,060h,0fbh,003h,060h	; b372  .@.@.@..``..`..`
	defb 0d5h,060h,0d4h,010h,0d5h,060h,0f5h,0d5h,060h,060h,0d4h,010h,060h,0fbh,002h,0ebh	; b382  .`...`..``..`...
	defb 00ah,03bh,041h,060h,062h,063h,0e9h,008h,0f8h,051h,0eah,008h,0ebh,01ah,01bh,021h	; b392  ..A`bc...Q.....!
	defb 0dbh,002h,0d8h,0f0h,000h,0f5h,0d1h,033h,0fbh,00fh,0f8h,046h,0eah,00dh,0d6h,010h	; b3a2  .......3...F....
	defb 001h,0f0h,002h,043h,0d4h,0b0h,0b2h,0d8h,0f0h,000h,0f8h,051h,0eah,008h,0ebh,01ah	; b3b2  ...C.......Q....
	defb 01bh,021h,0dbh,002h,0d8h,0f0h,000h,0f5h,0d1h,033h,0fbh,00eh,030h,010h,0d2h,0b0h	; b3c2  .!.......3..0...
	defb 0d1h,010h,0d2h,0b0h,0a0h,0b0h,0a0h,0fdh,0a3h,0b2h	; b3d2  ..........

; ----------------------------------------------------------------------
; DATOS partitura_B3DC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (33 bytes)
;   0xb3dc..0xb3fd  (33 bytes)
DATA_partitura_B3DC:
	defb 0feh,001h,0e9h,008h,0f1h,011h,048h,001h,010h,0eah,00dh,0edh,028h,0ebh,087h,02bh	; b3dc  ......H.....(..+
	defb 091h,0dbh,005h,0f0h,002h,093h,0d6h,010h,001h,0d2h,08fh,0afh,0bfh,0d1h,017h,030h	; b3ec  ...............0
	defb 010h	; b3fc

; ----------------------------------------------------------------------
; DATOS partitura_B3FD: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (30 bytes)
;   0xb3fd..0xb41b  (30 bytes)
DATA_partitura_B3FD:
	defb 0d2h,0b0h,0d1h,010h,0d2h,0b0h,0a0h,0b0h,0a0h,08fh,0afh,0bfh,0d1h,017h,0eah,00bh	; b3fd  ................
	defb 0d1h,030h,010h,0d2h,0b0h,0d1h,010h,0d2h,0b0h,0a0h,0b0h,0a0h,0f6h,0f8h	; b40d  .0............

; ----------------------------------------------------------------------
; DATOS partitura_B41B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xb41b..0xb41f  (4 bytes)
DATA_partitura_B41B:
	defb 011h,0eah,00ah,0edh	; b41b

; ----------------------------------------------------------------------
; DATOS partitura_B41F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (63 bytes)
;   0xb41f..0xb45e  (63 bytes)
DATA_partitura_B41F:
	defb 028h,0ebh,087h,02bh,091h,0dbh,005h,0f0h,002h,094h,0d6h,010h,001h,0d3h,08bh,081h	; b41f  (..+............
	defb 0a1h,0b5h,0a9h,085h,069h,045h,035h,013h,08bh,081h,0a1h,0b7h,0d2h,013h,0d3h,083h	; b42f  ....iE5.........
	defb 0b5h,0a9h,085h,0a9h,0f6h,0f6h,0f8h,011h,0eah,00bh,0edh,028h,0ebh,087h,02bh,091h	; b43f  ...........(..+.
	defb 0dbh,005h,0f0h,002h,094h,0d6h,010h,001h,0d2h,08bh,081h,0a1h,0b5h,0a9h,085h	; b44f  ...............

; ----------------------------------------------------------------------
; DATOS partitura_B45E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (81 bytes)
;   0xb45e..0xb4af  (81 bytes)
DATA_partitura_B45E:
	defb 069h,045h,035h,013h,08bh,081h,0a1h,0b7h,0d1h,013h,0d2h,083h,0b5h,0a9h,080h,086h	; b45e  iE5.............
	defb 067h,0f8h,012h,0eah,00ch,0edh,028h,0ebh,087h,02bh,091h,0dbh,005h,0f0h,002h,042h	; b46e  g.....(..+.....B
	defb 0d6h,010h,001h,0d3h,047h,087h,0eah,00ah,0ebh,009h,02bh,011h,0d1h,010h,011h,0d2h	; b47e  ....G.....+.....
	defb 0b0h,0b1h,0d1h,010h,011h,0d2h,0b0h,0b1h,080h,080h,0d1h,011h,0eah,00ch,0edh,028h	; b48e  ...............(
	defb 0ebh,087h,02bh,091h,0d3h,037h,067h,0eah,00ah,0ebh,009h,02bh,011h,0d2h,0b0h,0b1h	; b49e  ..+..7g....+....
	defb 0a0h	; b4ae

; ----------------------------------------------------------------------
; DATOS partitura_B4AF: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xb4af..0xb4b3  (4 bytes)
DATA_partitura_B4AF:
	defb 0a1h,0b0h,0b1h,0a0h	; b4af

; ----------------------------------------------------------------------
; DATOS partitura_B4B3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (38 bytes)
;   0xb4b3..0xb4d9  (38 bytes)
DATA_partitura_B4B3:
	defb 0a1h,0b0h,0a0h,080h,060h,0eah,00ch,0edh,028h,0ebh,087h,02bh,091h,0d3h,0bfh,0d2h	; b4b3  ....`...(..+....
	defb 037h,087h,085h,069h,045h,069h,0eah,00bh,0edh,028h,0ebh,087h,02bh,091h,0dbh,005h	; b4c3  7..iEi...(..+...
	defb 0f0h,002h,043h,0d6h,010h,001h	; b4d3

; ----------------------------------------------------------------------
; DATOS partitura_B4D9: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (57 bytes)
;   0xb4d9..0xb512  (57 bytes)
DATA_partitura_B4D9:
	defb 0d2h,012h,0d3h,082h,0d2h,012h,042h,0d3h,080h,0b0h,0d2h,010h,030h,0d8h,0f8h,015h	; b4d9  ......B.....0...
	defb 0eah,008h,0ebh,089h,02bh,031h,0d1h,010h,0d2h,0b0h,0a0h,0b1h,0a0h,080h,060h,0a0h	; b4e9  ....+1........`.
	defb 080h,060h,081h,060h,040h,010h,0f8h,012h,0eah,00bh,0ebh,087h,02bh,091h,0d2h,032h	; b4f9  .`.`@.......+..2
	defb 0d3h,0a2h,0d2h,032h,062h,0d3h,060h,0a0h,0d2h	; b509  ...2b.`..

; ----------------------------------------------------------------------
; DATOS partitura_B512: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xb512..0xb514  (2 bytes)
DATA_partitura_B512:
	defb 011h,0f8h	; b512

; ----------------------------------------------------------------------
; DATOS partitura_B514: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (12 bytes)
;   0xb514..0xb520  (12 bytes)
DATA_partitura_B514:
	defb 015h,0eah,008h,0ebh,089h,02bh,031h,0d1h,030h,010h,0d2h,0b0h	; b514  .....+1.0...

; ----------------------------------------------------------------------
; DATOS sin identificar  0xb520..0xb5ad  (141 bytes)
DATA_B520:
	defb 0d1h,011h,0d2h,0b0h,0a0h,080h,0a0h,0b0h,0d1h,011h,0f8h,011h,0eah,00eh,0ebh,087h	; b520  ................
	defb 02bh,091h,0d2h,030h,060h,080h,0a0h,0eah,00ch,08fh,085h,0b5h,083h,0a7h,087h,067h	; b530  +..0`..........g
	defb 0a7h,0f8h,054h,0eah,007h,0ebh,01ah,01bh,021h,0dbh,002h,0d8h,0f0h,000h,0f5h,0d2h	; b540  ..T.....!.......
	defb 083h,0fbh,00fh,0f8h,002h,0eah,00ah,0f0h,002h,034h,0d6h,010h,001h,0d1h,060h,062h	; b550  .........4....`b
	defb 0d8h,0f0h,000h,0eah,007h,0ebh,01ah,01bh,021h,0dbh,002h,0d8h,0f0h,000h,0f5h,0d2h	; b560  ........!.......
	defb 083h,0fbh,00ah,0feh,004h,0f8h,005h,0d1h,0e9h,004h,030h,030h,031h,031h,030h,030h	; b570  ..........001100
	defb 041h,040h,040h,041h,041h,0e9h,008h,0feh,001h,0f8h,054h,0eah,007h,0ebh,01ah,01bh	; b580  A@@AA.....T.....
	defb 021h,0dbh,002h,0d2h,083h,083h,0ebh,00ah,02bh,011h,0eah,00dh,0f8h,042h,0d4h,030h	; b590  !.......+....B.0
	defb 010h,0d5h,0b0h,0d4h,010h,0d5h,0b0h,0a0h,0b0h,0a0h,0fdh,044h,0b4h	; b5a0  ...........D.

; ----------------------------------------------------------------------
; DATOS partitura_B5AD: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (47 bytes)
;   0xb5ad..0xb5dc  (47 bytes)
DATA_partitura_B5AD:
	defb 0feh,001h,0e9h,008h,0eeh,091h,0f8h,046h,0eah,008h,0ebh,00ah,03bh,021h,0dbh,005h	; b5ad  .......F.....!..
	defb 0f5h,0d5h,080h,080h,081h,080h,080h,081h,080h,080h,081h,080h,080h,080h,080h,0fbh	; b5bd  ................
	defb 007h,080h,080h,081h,080h,080h,081h,0eah,00bh,0d4h,030h,010h,0d5h,0b0h,0d4h	; b5cd  ..........0....

; ----------------------------------------------------------------------
; DATOS partitura_B5DC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xb5dc..0xb5e0  (4 bytes)
DATA_partitura_B5DC:
	defb 010h,0d5h,0b0h,0a0h	; b5dc

; ----------------------------------------------------------------------
; DATOS partitura_B5E0: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (9 bytes)
;   0xb5e0..0xb5e9  (9 bytes)
DATA_partitura_B5E0:
	defb 0b0h,0a0h,0f8h,046h,0eah,00dh,0ebh,00ah,02bh	; b5e0  ...F....+

; ----------------------------------------------------------------------
; DATOS partitura_B5E9: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xb5e9..0xb602  (25 bytes)
DATA_partitura_B5E9:
	defb 021h,0dbh,005h,0d5h,0f9h,0bfh,0b9h,0f9h,0bfh,0b9h,0f8h,04bh,0eah,00fh,0ebh,009h	; b5e9  !..........K....
	defb 03bh,021h,0dbh,002h,0f5h,0d5h,083h,083h,080h	; b5f9  .!.......

; ----------------------------------------------------------------------
; DATOS partitura_B602: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xb602..0xb61b  (25 bytes)
DATA_partitura_B602:
	defb 082h,083h,0fbh,002h,0f5h,063h,063h,060h,062h,063h,0fbh,002h,0f5h,083h,083h,080h	; b602  .....cc`bc......
	defb 082h,083h,0fbh,002h,063h,063h,060h,062h,063h	; b612  ....cc`bc

; ----------------------------------------------------------------------
; DATOS partitura_B61B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (43 bytes)
;   0xb61b..0xb646  (43 bytes)
DATA_partitura_B61B:
	defb 060h,060h,061h,060h,060h,061h,060h,060h,060h,060h,060h,060h,060h,060h,0f8h,04bh	; b61b  ``a``a````````.K
	defb 0eah,00fh,0ebh,009h,03bh,021h,0dbh,002h,0d4h,0f9h,0e0h,0b9h,0d5h,0f9h,0f0h,0b9h	; b62b  .....!..........
	defb 0d4h,010h,0d5h,060h,061h,062h,061h,0d4h,010h,0d5h,0b0h	; b63b  ...`aba....

; ----------------------------------------------------------------------
; DATOS partitura_B646: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (22 bytes)
;   0xb646..0xb65c  (22 bytes)
DATA_partitura_B646:
	defb 0a0h,080h,060h,040h,030h,010h,0f8h,04bh,0eah,00fh,0ebh,009h,03bh,021h,0dbh,002h	; b646  ..`@0..K.....!..
	defb 0d4h,0f9h,0e0h,0b9h,0f9h,01ah	; b656

; ----------------------------------------------------------------------
; DATOS partitura_B65C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xb65c..0xb65d  (1 bytes)
DATA_partitura_B65C:
	defb 0bah	; b65c

; ----------------------------------------------------------------------
; DATOS sin identificar  0xb65d..0xb6ef  (146 bytes)
DATA_B65D:
	defb 0d5h,0f9h,02ah,0bah,0f8h,046h,0eah,00fh,0ebh,009h,03bh,021h,0dbh,002h,0d5h,080h	; b65d  ..*..F.....!....
	defb 060h,081h,0b1h,080h,060h,081h,0d4h,011h,0d5h,080h,060h,081h,0d4h,031h,0d5h,080h	; b66d  `...`.....`..1..
	defb 060h,081h,0d4h,061h,0d5h,080h,060h,081h,0b0h,0a0h,080h,060h,080h,060h,081h,0b1h	; b67d  `..a..`....`.`..
	defb 080h,060h,081h,0d4h,011h,0d5h,080h,060h,081h,0d4h,031h,0d5h,080h,060h,081h,0d4h	; b68d  .`.....`..1..`..
	defb 061h,0d5h,080h,060h,081h,0b0h,0b2h,0f8h,046h,0eah,00fh,0ebh,009h,03bh,021h,0dbh	; b69d  a..`....F.....!.
	defb 002h,0d5h,080h,060h,081h,0b1h,080h,060h,081h,0d4h,011h,0d5h,080h,060h,081h,0d4h	; b6ad  ...`...`.....`..
	defb 031h,0d5h,080h,060h,081h,0d4h,061h,0d5h,080h,060h,081h,0b0h,0a0h,080h,060h,080h	; b6bd  1..`..a..`....`.
	defb 060h,081h,0b1h,080h,060h,081h,0d4h,011h,0d5h,080h,060h,081h,0d4h,031h,0d5h,080h	; b6cd  `...`.....`..1..
	defb 060h,081h,0d4h,061h,030h,010h,0d5h,0b0h,0d4h,010h,0d5h,0b0h,0a0h,0b0h,0a0h,0fdh	; b6dd  `..a0...........
	defb 0f3h,0b5h	; b6ed

; ----------------------------------------------------------------------
; DATOS partitura_B6EF: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xb6ef..0xb708  (25 bytes)
DATA_partitura_B6EF:
	defb 0feh,001h,0e9h,008h,0f8h,011h,0eah,00ch,0edh,028h,0ebh,087h,02bh,091h,0dbh,005h	; b6ef  .........(..+...
	defb 0f0h,002h,096h,0d6h,010h,001h,0d4h,08fh,0afh	; b6ff  .........

; ----------------------------------------------------------------------
; DATOS partitura_B708: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (32 bytes)
;   0xb708..0xb728  (32 bytes)
DATA_partitura_B708:
	defb 0bfh,0d3h,017h,030h,010h,0d4h,0b0h,0d3h,010h,0d4h,0b0h,0a0h,0b0h,0a0h,08fh,0afh	; b708  ...0............
	defb 0bfh,0d3h,017h,0eah,00ah,0d2h,030h,010h,0d3h,0b0h,0d2h,010h,0d3h,0b0h,0a0h,0b0h	; b718  ......0.........

; ----------------------------------------------------------------------
; DATOS partitura_B728: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xb728..0xb733  (11 bytes)
DATA_partitura_B728:
	defb 0a0h,0f8h,015h,0eah,00ah,0edh,028h,0ebh,087h,02bh,0b1h	; b728  ......(..+.

; ----------------------------------------------------------------------
; DATOS partitura_B733: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (69 bytes)
;   0xb733..0xb778  (69 bytes)
DATA_partitura_B733:
	defb 0dbh,003h,0f0h,002h,092h,0d6h,010h,001h,0f9h,0a9h,0bah,0f8h,011h,0eah,00fh,0ebh	; b733  ................
	defb 00ah,02bh,0d1h,0dbh,003h,0f0h,002h,094h,0d6h,020h,001h,0f9h,0c3h,0bah,0f8h,002h	; b743  .+....... ......
	defb 0eah,00dh,0d3h,060h,080h,0a0h,0b0h,0d2h,010h,030h,040h,060h,0f8h,002h,0eah,00ah	; b753  ...`.....0@`....
	defb 0edh,01bh,0ebh,089h,02bh,091h,0dbh,003h,0f0h,002h,042h,0d6h,010h,001h,0f9h,0ddh	; b763  ....+.....B.....
	defb 0bah,0f0h,002h,076h,0ebh	; b773

; ----------------------------------------------------------------------
; DATOS partitura_B778: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xb778..0xb77f  (7 bytes)
DATA_partitura_B778:
	defb 089h,02bh,0c1h,03fh,087h,0b7h,0b5h	; b778

; ----------------------------------------------------------------------
; DATOS partitura_B77F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (24 bytes)
;   0xb77f..0xb797  (24 bytes)
DATA_partitura_B77F:
	defb 0a9h,085h,0a9h,0f8h,002h,0eah,00ah,0edh,019h,0ebh,089h,02bh,091h,0dbh,003h,0f0h	; b77f  ...........+....
	defb 002h,041h,0d6h,010h,001h,0f9h,0f3h,0bah	; b78f  .A......

; ----------------------------------------------------------------------
; DATOS sin identificar  0xb797..0xb832  (155 bytes)
DATA_B797:
	defb 0d1h,017h,0f8h,011h,0eah,00fh,0ebh,009h,03bh,051h,0dbh,003h,0f0h,002h,024h,0d6h	; b797  .........Q....$.
	defb 006h,001h,0d3h,080h,060h,081h,0b1h,080h,060h,081h,0d2h,011h,0d3h,080h,060h,081h	; b7a7  ....`...`.....`.
	defb 0d2h,031h,0d3h,080h,060h,081h,0d2h,061h,0d3h,080h,060h,081h,0b0h,0a0h,080h,060h	; b7b7  .1..`..a..`....`
	defb 080h,060h,081h,0b1h,080h,060h,081h,0d2h,011h,0d3h,080h,060h,081h,0d2h,031h,0d3h	; b7c7  .`...`.....`..1.
	defb 080h,060h,081h,0d2h,061h,0d3h,080h,060h,081h,0f8h,002h,0eah,00bh,0d2h,0b0h,0b2h	; b7d7  .`..a..`........
	defb 0f8h,011h,0eah,00fh,0ebh,009h,03bh,041h,0dbh,002h,0d3h,080h,060h,081h,0b1h,080h	; b7e7  .......A....`...
	defb 060h,081h,0d2h,011h,0d3h,080h,060h,081h,0d2h,031h,0d3h,080h,060h,081h,0d2h,061h	; b7f7  `.....`..1..`..a
	defb 0d3h,080h,060h,081h,0b0h,0a0h,080h,060h,080h,060h,081h,0b1h,080h,060h,081h,0d2h	; b807  ..`....`.`...`..
	defb 011h,0d3h,080h,060h,081h,0d2h,031h,0d3h,080h,060h,081h,0d2h,061h,030h,010h,0d3h	; b817  ...`..1..`..a0..
	defb 0b0h,0d2h,010h,0d3h,0b0h,0a0h,0b0h,0a0h,0fdh,03eh,0b7h	; b827  .........>.

; ----------------------------------------------------------------------
; DATOS partitura_B832: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xb832..0xb833  (1 bytes)
DATA_partitura_B832:
	defb 0feh	; b832

; ----------------------------------------------------------------------
; DATOS partitura_B833: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xb833..0xb839  (6 bytes)
DATA_partitura_B833:
	defb 001h,0e9h,008h,0eeh,081h,0c1h	; b833

; ----------------------------------------------------------------------
; DATOS partitura_B839: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xb839..0xb83a  (1 bytes)
DATA_partitura_B839:
	defb 0f8h	; b839

; ----------------------------------------------------------------------
; DATOS partitura_B83A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (10 bytes)
;   0xb83a..0xb844  (10 bytes)
DATA_partitura_B83A:
	defb 011h,0eah,008h,0edh,026h,0ebh,087h,01bh,091h,0dbh	; b83a  ....&.....

; ----------------------------------------------------------------------
; DATOS partitura_B844: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xb844..0xb848  (4 bytes)
DATA_partitura_B844:
	defb 003h,0f0h,002h,096h	; b844

; ----------------------------------------------------------------------
; DATOS partitura_B848: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xb848..0xb859  (17 bytes)
DATA_partitura_B848:
	defb 0d6h,010h,001h,0d3h,08fh,0afh,0bfh,0d2h,017h,030h,010h,0d3h,0b0h,0d2h,010h,0d3h	; b848  .........0......
	defb 0b0h	; b858

; ----------------------------------------------------------------------
; DATOS partitura_B859: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (39 bytes)
;   0xb859..0xb880  (39 bytes)
DATA_partitura_B859:
	defb 0a0h,0b0h,0a0h,08fh,0afh,0bfh,0d2h,015h,0eah,009h,0d1h,030h,010h,0d2h,0b0h,0d1h	; b859  ...........0....
	defb 010h,0d2h,0b0h,0a0h,0b0h,0a0h,0c1h,0f8h,015h,0eah,006h,0edh,023h,0ebh,087h,01bh	; b869  ............#...
	defb 091h,0dbh,002h,0f0h,002h,092h,0d6h	; b879

; ----------------------------------------------------------------------
; DATOS partitura_B880: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xb880..0xb888  (8 bytes)
DATA_partitura_B880:
	defb 010h,001h,0f9h,0a9h,0bah,0f8h,011h,0eah	; b880  ........

; ----------------------------------------------------------------------
; DATOS partitura_B888: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xb888..0xb890  (8 bytes)
DATA_partitura_B888:
	defb 008h,0edh,023h,0ebh,087h,01bh,0b1h,0dbh	; b888  ..#.....

; ----------------------------------------------------------------------
; DATOS partitura_B890: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xb890..0xb896  (6 bytes)
DATA_partitura_B890:
	defb 002h,0f0h,002h,094h,0d6h,010h	; b890

; ----------------------------------------------------------------------
; DATOS partitura_B896: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (22 bytes)
;   0xb896..0xb8ac  (22 bytes)
DATA_partitura_B896:
	defb 001h,0f9h,0c3h,0bah,0f8h,002h,0eah,005h,0d3h,060h,080h,0a0h,0b0h,0d2h,010h,030h	; b896  .........`.....0
	defb 0c1h,0f8h,002h,0eah,005h,0edh	; b8a6

; ----------------------------------------------------------------------
; DATOS partitura_B8AC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xb8ac..0xb8af  (3 bytes)
DATA_partitura_B8AC:
	defb 024h,0ebh,087h	; b8ac

; ----------------------------------------------------------------------
; DATOS partitura_B8AF: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (32 bytes)
;   0xb8af..0xb8cf  (32 bytes)
DATA_partitura_B8AF:
	defb 01bh,0c1h,0dbh,003h,0f0h,002h,094h,0d6h,010h,001h,0d2h,012h,0d3h,082h,0d2h,012h	; b8af  ................
	defb 042h,030h,040h,0eah,008h,0ebh,009h,02bh,031h,0d2h,040h,041h,030h,031h,040h,041h	; b8bf  B0@....+1.@A01@A

; ----------------------------------------------------------------------
; DATOS partitura_B8CF: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xb8cf..0xb8d2  (3 bytes)
DATA_partitura_B8CF:
	defb 030h,031h,010h	; b8cf

; ----------------------------------------------------------------------
; DATOS partitura_B8D2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (33 bytes)
;   0xb8d2..0xb8f3  (33 bytes)
DATA_partitura_B8D2:
	defb 010h,041h,0c1h,0eah,005h,0edh,024h,0ebh,087h,01bh,071h,0d3h,0b2h,062h,0b2h,0d2h	; b8d2  .A....$...q..b..
	defb 032h,010h,030h,0eah,008h,0ebh,009h,02bh,031h,0d2h,030h,031h,010h,011h,030h,031h	; b8e2  2.0....+1.01..01
	defb 010h	; b8f2

; ----------------------------------------------------------------------
; DATOS partitura_B8F3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xb8f3..0xb8f5  (2 bytes)
DATA_partitura_B8F3:
	defb 011h,030h	; b8f3

; ----------------------------------------------------------------------
; DATOS partitura_B8F5: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (38 bytes)
;   0xb8f5..0xb91b  (38 bytes)
DATA_partitura_B8F5:
	defb 010h,0d3h,0b0h,0a0h,0eah,005h,0edh,024h,0ebh,087h,01bh,0b1h,0c1h,0f0h,002h,076h	; b8f5  .......$.......v
	defb 0d2h,03fh,087h,0b7h,0b5h,0a9h,085h,0a7h,0c1h,0f8h,002h,0eah,005h,0edh,023h,0ebh	; b905  .?............#.
	defb 087h,01bh,071h,0dbh,002h,0f0h	; b915

; ----------------------------------------------------------------------
; DATOS partitura_B91B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xb91b..0xb91f  (4 bytes)
DATA_partitura_B91B:
	defb 002h,042h,0d6h,010h	; b91b

; ----------------------------------------------------------------------
; DATOS partitura_B91F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xb91f..0xb923  (4 bytes)
DATA_partitura_B91F:
	defb 001h,0f9h,0f3h,0bah	; b91f

; ----------------------------------------------------------------------
; DATOS sin identificar  0xb923..0xb9bf  (156 bytes)
DATA_B923:
	defb 0d1h,015h,0f8h,011h,0eah,00eh,0ebh,009h,03bh,041h,0dbh,003h,0f0h,002h,024h,0d6h	; b923  .........A....$.
	defb 006h,001h,0d2h,080h,060h,081h,0b1h,080h,060h,081h,0d1h,011h,0d2h,080h,060h,081h	; b933  ....`...`.....`.
	defb 0d1h,031h,0d2h,080h,060h,081h,0d1h,061h,0d2h,080h,060h,081h,0b0h,0a0h,080h,060h	; b943  .1..`..a..`....`
	defb 080h,060h,081h,0b1h,080h,060h,081h,0d1h,011h,0d2h,080h,060h,081h,0d1h,031h,0d2h	; b953  .`...`.....`..1.
	defb 080h,060h,081h,0d1h,061h,0d2h,080h,060h,081h,0f8h,002h,0eah,00bh,0d3h,060h,062h	; b963  .`..a..`......`b
	defb 0f8h,011h,0eah,00eh,0ebh,009h,03bh,041h,0dbh,002h,0d2h,080h,060h,081h,0b1h,080h	; b973  .......A....`...
	defb 060h,081h,0d1h,011h,0d2h,080h,060h,081h,0d1h,031h,0d2h,080h,060h,081h,0d1h,061h	; b983  `.....`..1..`..a
	defb 0d2h,080h,060h,081h,0b0h,0a0h,080h,060h,080h,060h,081h,0b1h,080h,060h,081h,0d1h	; b993  ..`....`.`...`..
	defb 011h,0d2h,080h,060h,081h,0d1h,031h,0d2h,080h,060h,081h,0d1h,061h,030h,010h,0d2h	; b9a3  ...`..1..`..a0..
	defb 0b0h,0d1h,010h,0d2h,0b0h,0a0h,0b0h,0a0h,0c1h,0fdh,085h,0b8h	; b9b3  ............

; ----------------------------------------------------------------------
; DATOS sonido_B9BF: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392
;   (22 bytes)
;   0xb9bf..0xb9d5  (22 bytes)
DATA_sonido_B9BF:
	defb 0f5h,080h,080h,081h,080h,080h,081h,080h,080h,081h,080h,080h,080h,080h,0fbh,002h	; b9bf  ................
	defb 0f5h,060h,060h,061h,060h,060h	; b9cf

; ----------------------------------------------------------------------
; DATOS partitura_B9D5: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xb9d5..0xb9d6  (1 bytes)
DATA_partitura_B9D5:
	defb 061h	; b9d5

; ----------------------------------------------------------------------
; DATOS partitura_B9D6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xb9d6..0xb9e7  (17 bytes)
DATA_partitura_B9D6:
	defb 060h,060h,061h,060h,060h,060h,060h,0fbh,002h,0fah,0f5h,010h,011h,010h,011h,010h	; b9d6  ``a````.........
	defb 011h	; b9e6

; ----------------------------------------------------------------------
; DATOS partitura_B9E7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xb9e7..0xb9ee  (7 bytes)
DATA_partitura_B9E7:
	defb 010h,011h,010h,010h,010h,010h,0fbh	; b9e7

; ----------------------------------------------------------------------
; DATOS partitura_B9EE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (43 bytes)
;   0xb9ee..0xba19  (43 bytes)
DATA_partitura_B9EE:
	defb 002h,0fah,0b0h,0b1h,0b0h,0b1h,0b0h,0b1h,0b0h,0b1h,0b0h,0b0h,0b0h,0b0h,0b0h,0b1h	; b9ee  ................
	defb 0b0h,0b1h,0b0h,0b1h,0b0h,0b1h,0b0h,0a0h,080h,060h,0f5h,080h,080h,081h,0fbh,008h	; b9fe  .........`......
	defb 060h,061h,062h,061h,060h,010h,030h,040h,060h,0a0h,0b0h	; ba0e  `aba`.0@`..

; ----------------------------------------------------------------------
; DATOS partitura_BA19: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (16 bytes)
;   0xba19..0xba29  (16 bytes)
DATA_partitura_BA19:
	defb 0fah,0f5h,030h,031h,030h,031h,030h,031h,030h,031h,030h,030h,030h,030h,0fbh,002h	; ba19  ..010101010000..

; ----------------------------------------------------------------------
; DATOS sin identificar  0xba29..0xba4b  (34 bytes)
DATA_BA29:
	defb 0fah,0f5h,040h,040h,041h,040h,040h,041h,040h,040h,041h,040h,040h,040h,040h,0fbh	; ba29  ..@@A@@A@@A@@@@.
	defb 002h,0f5h,060h,060h,061h,060h,060h,061h,060h,060h,061h,060h,060h,060h,060h,0fbh	; ba39  ..``a``a``a````.
	defb 002h,0fah	; ba49

; ----------------------------------------------------------------------
; DATOS sonido_BA4B: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392
;   (1 bytes)
;   0xba4b..0xba4c  (1 bytes)
DATA_sonido_BA4B:
	defb 0d5h	; ba4b

; ----------------------------------------------------------------------
; DATOS partitura_BA4C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (27 bytes)
;   0xba4c..0xba67  (27 bytes)
DATA_partitura_BA4C:
	defb 080h,080h,0d4h,030h,080h,0d5h,080h,080h,0d4h,030h,080h,0d5h,080h,080h,0d4h,030h	; ba4c  ...0.....0.....0
	defb 080h,0fah,0d5h,060h,060h,0d4h,010h,060h,0d5h,060h,060h	; ba5c  ...``..`.``

; ----------------------------------------------------------------------
; DATOS partitura_BA67: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xba67..0xba6a  (3 bytes)
DATA_partitura_BA67:
	defb 0d4h,010h,060h	; ba67

; ----------------------------------------------------------------------
; DATOS partitura_BA6A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (32 bytes)
;   0xba6a..0xba8a  (32 bytes)
DATA_partitura_BA6A:
	defb 0d5h,060h,060h,0d4h,010h,060h,0fah,0d2h,014h,025h,034h,044h,055h,064h,074h,085h	; ba6a  .``..`...%4DUdt.
	defb 094h,0a4h,0b5h,0d1h,004h,014h,025h,034h,044h,055h,064h,074h,085h,094h,0a4h,0b5h	; ba7a  ......%4DUdt....

; ----------------------------------------------------------------------
; DATOS partitura_BA8A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xba8a..0xba95  (11 bytes)
DATA_partitura_BA8A:
	defb 0d0h,004h,0fah,0d3h,0a4h,0b5h,0d2h,014h,024h,035h,044h	; ba8a  ........$5D

; ----------------------------------------------------------------------
; DATOS partitura_BA95: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (24 bytes)
;   0xba95..0xbaad  (24 bytes)
DATA_partitura_BA95:
	defb 054h,065h,074h,084h,095h,0a4h,0b4h,0d1h,005h,014h,024h,035h,044h,054h,065h,074h	; ba95  Tet.......$5DTet
	defb 084h,095h,0a4h,0fah,0d2h,03bh,011h,031h	; baa5  .......1

; ----------------------------------------------------------------------
; DATOS partitura_BAAD: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xbaad..0xbabe  (17 bytes)
DATA_partitura_BAAD:
	defb 045h,035h,013h,0d3h,0b1h,0d2h,01dh,0d3h,0b1h,0d2h,01dh,03bh,011h,031h,045h,035h	; baad  E5...........1E5
	defb 013h	; babd

; ----------------------------------------------------------------------
; DATOS partitura_BABE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (28 bytes)
;   0xbabe..0xbada  (28 bytes)
DATA_partitura_BABE:
	defb 085h,069h,0b5h,0a9h,0fah,0d1h,03bh,011h,031h,045h,035h,013h,0d2h,0b1h,0d1h,01dh	; babe  .i......1E5.....
	defb 0d2h,0b1h,0d1h,01dh,03bh,011h,031h,045h,035h,013h,085h,069h	; bace  ......1E5..i

; ----------------------------------------------------------------------
; DATOS partitura_BADA: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (15 bytes)
;   0xbada..0xbae9  (15 bytes)
DATA_partitura_BADA:
	defb 0b0h,0b6h,0fah,0d2h,012h,0d3h,082h,0d2h,012h,042h,030h,040h,061h,08fh,0d3h	; bada  .........B0@a..

; ----------------------------------------------------------------------
; DATOS partitura_BAE9: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (28 bytes)
;   0xbae9..0xbb05  (28 bytes)
DATA_partitura_BAE9:
	defb 0b2h,062h,0b2h,0d2h,032h,010h,030h,041h,06fh,0fah,0d2h,042h,012h,042h,082h,010h	; bae9  .b..2.0Ao..B.B..
	defb 030h,040h,060h,08fh,062h,032h,062h,0a2h,030h,060h,081h,0afh	; baf9  0@`.b2b.0`..

; ----------------------------------------------------------------------
; DATOS sin identificar  0xbb05..0xbb14  (15 bytes)
DATA_BB05:
	defb 0f0h,002h,074h,0bfh,0b5h,0d1h,035h,0d2h,0b3h,0d1h,017h,0d2h,0b7h,0a7h,0fah	; bb05  ..t...5........

; ----------------------------------------------------------------------
; DATOS partitura_BB14: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xbb14..0xbb15  (1 bytes)
DATA_partitura_BB14:
	defb 0ffh	; bb14

; ----------------------------------------------------------------------
; DATOS partitura_BB15: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xbb15..0xbb2e  (25 bytes)
DATA_partitura_BB15:
	defb 0feh,001h,0e9h,008h,0eah,005h,0c1h,0ebh,007h,016h,001h,0f9h,016h,0bfh,0f9h,016h	; bb15  ................
	defb 0bfh,0f9h,029h,0bfh,0f9h,029h,0bfh,0f9h,016h	; bb25  ..)..)...

; ----------------------------------------------------------------------
; DATOS partitura_BB2E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (27 bytes)
;   0xbb2e..0xbb49  (27 bytes)
DATA_partitura_BB2E:
	defb 0bfh,0f9h,016h,0bfh,0f9h,029h,0bfh,0d1h,0f5h,090h,0b0h,090h,050h,000h,050h,0fbh	; bb2e  .....)......P.P.
	defb 002h,090h,0b0h,0feh,001h,0e9h,010h,0eeh,002h,0c1h,0eah	; bb3e  ...........

; ----------------------------------------------------------------------
; DATOS partitura_BB49: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (32 bytes)
;   0xbb49..0xbb69  (32 bytes)
DATA_partitura_BB49:
	defb 007h,0edh,033h,0ebh,087h,017h,0d1h,0dbh,002h,0f0h,005h,031h,0d2h,04fh,0d3h,096h	; bb49  ..3........1.O..
	defb 0d2h,028h,04fh,0d3h,096h,0d2h,056h,0dch,0feh,001h,0e9h,010h,0eeh,002h,0c1h,0eah	; bb59  .(O...V.........

; ----------------------------------------------------------------------
; DATOS partitura_BB69: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xbb69..0xbb71  (8 bytes)
DATA_partitura_BB69:
	defb 007h,0edh,033h,0ebh,087h,017h,0d1h,0dbh	; bb69  ..3.....

; ----------------------------------------------------------------------
; DATOS partitura_BB71: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xbb71..0xbb73  (2 bytes)
DATA_partitura_BB71:
	defb 002h,0f0h	; bb71

; ----------------------------------------------------------------------
; DATOS partitura_BB73: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (37 bytes)
;   0xbb73..0xbb98  (37 bytes)
DATA_partitura_BB73:
	defb 005h,051h,0d2h,057h,077h,087h,0a2h,082h,0feh,001h,0eeh,002h,0e9h,010h,0c1h,0eah	; bb73  .Q.Ww...........
	defb 007h,0edh,033h,0ebh,087h,017h,0d1h,0dbh,001h,0f0h,005h,051h,0d2h,057h,077h,007h	; bb83  ..3........Q.Ww.
	defb 005h,0fch,002h,041h,0bbh	; bb93

; ----------------------------------------------------------------------
; DATOS sin identificar  0xbb98..0xbb9b  (3 bytes)
DATA_BB98:
	defb 0fdh,015h,0bbh	; bb98

; ----------------------------------------------------------------------
; DATOS partitura_BB9B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xbb9b..0xbbac  (17 bytes)
DATA_partitura_BB9B:
	defb 0feh,001h,0e9h,008h,0eeh,081h,0eah,004h,0c2h,0ebh,007h,016h,001h,0f9h,016h,0bfh	; bb9b  ................
	defb 0f9h	; bbab

; ----------------------------------------------------------------------
; DATOS partitura_BBAC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (10 bytes)
;   0xbbac..0xbbb6  (10 bytes)
DATA_partitura_BBAC:
	defb 016h,0bfh,0f9h,029h,0bfh,0f9h,029h,0bfh,0f9h,016h	; bbac  ...)..)...

; ----------------------------------------------------------------------
; DATOS partitura_BBB6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (13 bytes)
;   0xbbb6..0xbbc3  (13 bytes)
DATA_partitura_BBB6:
	defb 0bfh,0f9h,016h,0bfh,0f9h,029h,0bfh,0d1h,0f5h,090h,0b0h,090h,050h	; bbb6  .....)......P

; ----------------------------------------------------------------------
; DATOS partitura_BBC3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (49 bytes)
;   0xbbc3..0xbbf4  (49 bytes)
DATA_partitura_BBC3:
	defb 000h,050h,0fbh,002h,090h,0feh,001h,0e9h,010h,0c2h,0eah,006h,0edh,033h,0ebh,087h	; bbc3  .P...........3..
	defb 017h,0d1h,0dbh,002h,0f0h,005h,031h,0d1h,04fh,0d2h,096h,0d1h,028h,04fh,0d2h,096h	; bbd3  ......1.O...(O..
	defb 0d1h,055h,0dch,0feh,001h,0e9h,010h,0c2h,0eah,006h,0edh,033h,0ebh,087h,017h,0d1h	; bbe3  .U.........3....
	defb 0dbh	; bbf3

; ----------------------------------------------------------------------
; DATOS partitura_BBF4: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (37 bytes)
;   0xbbf4..0xbc19  (37 bytes)
DATA_partitura_BBF4:
	defb 002h,0f0h,005h,051h,0d1h,057h,077h,087h,0a2h,081h,0feh,001h,0e9h,010h,0c2h,0eah	; bbf4  ...Q.Ww.........
	defb 006h,0edh,033h,0ebh,087h,017h,0d1h,0dbh,001h,0f0h,005h,051h,0d1h,057h,077h,007h	; bc04  ..3........Q.Ww.
	defb 004h,0fch,002h,0c8h,0bbh	; bc14

; ----------------------------------------------------------------------
; DATOS sin identificar  0xbc19..0xbc1c  (3 bytes)
DATA_BC19:
	defb 0fdh,09bh,0bbh	; bc19

; ----------------------------------------------------------------------
; DATOS partitura_BC1C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (48 bytes)
;   0xbc1c..0xbc4c  (48 bytes)
DATA_partitura_BC1C:
	defb 0feh,001h,0f8h,042h,0e9h,008h,0eah,004h,0ebh,007h,026h,001h,0f9h,016h,0bfh,0f9h	; bc1c  ...B......&.....
	defb 016h,0bfh,0f9h,029h,0bfh,0f9h,029h,0bfh,0f9h,016h,0bfh,0f9h,016h,0bfh,0f9h,029h	; bc2c  ...)..)........)
	defb 0bfh,0eah,002h,0f9h,029h,0bfh,0feh,001h,0f8h,009h,0e9h,010h,0eah,00ah,0edh,013h	; bc3c  ....)...........

; ----------------------------------------------------------------------
; DATOS partitura_BC4C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (21 bytes)
;   0xbc4c..0xbc61  (21 bytes)
DATA_partitura_BC4C:
	defb 0ebh,087h,037h,0d1h,0dbh,002h,0f0h,005h,021h,0d2h,04fh,0d3h,095h,0ech,0eah,002h	; bc4c  ..7.....!.O.....
	defb 0f8h,002h,090h,0eah,004h	; bc5c

; ----------------------------------------------------------------------
; DATOS partitura_BC61: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (52 bytes)
;   0xbc61..0xbc95  (52 bytes)
DATA_partitura_BC61:
	defb 0edh,081h,0ebh,087h,017h,0d1h,0d2h,028h,0f8h,009h,0eah,00ah,0edh,013h,0ebh,087h	; bc61  .......(........
	defb 037h,0d1h,04fh,0d3h,095h,0ech,0eah,002h,0f8h,002h,090h,0eah,004h,0edh,081h,0ebh	; bc71  7.O.............
	defb 087h,017h,0d1h,0d2h,058h,0dch,0feh,001h,0f8h,009h,0e9h,010h,0eah,00ah,0edh,013h	; bc81  ....X...........
	defb 0ebh,087h,037h,0d1h	; bc91

; ----------------------------------------------------------------------
; DATOS partitura_BC95: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (15 bytes)
;   0xbc95..0xbca4  (15 bytes)
DATA_partitura_BC95:
	defb 0dbh,001h,0f0h,005h,051h,0d2h,057h,077h,087h,0a2h,082h,071h,0feh,001h,0f8h	; bc95  ....Q.Ww...q...

; ----------------------------------------------------------------------
; DATOS partitura_BCA4: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (19 bytes)
;   0xbca4..0xbcb7  (19 bytes)
DATA_partitura_BCA4:
	defb 009h,0e9h,010h,0eah,00ah,0edh,013h,0ebh,087h,037h,0d1h,0dbh,001h,0f0h,005h,051h	; bca4  .........7.....Q
	defb 0d2h,057h,077h	; bcb4

; ----------------------------------------------------------------------
; DATOS partitura_BCB7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (26 bytes)
;   0xbcb7..0xbcd1  (26 bytes)
DATA_partitura_BCB7:
	defb 006h,0ech,0eah,001h,0f8h,002h,000h,0f8h,009h,0eah,00ah,0ebh,087h,037h,0d1h,006h	; bcb7  .............7..
	defb 0ech,0eah,001h,0f8h,002h,000h,0fch,002h,042h,0bch	; bcc7  ........B.

; ----------------------------------------------------------------------
; DATOS sin identificar  0xbcd1..0xbcd4  (3 bytes)
DATA_BCD1:
	defb 0fdh,01ch,0bch	; bcd1

; ----------------------------------------------------------------------
; DATOS partitura_BCD4: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (19 bytes)
;   0xbcd4..0xbce7  (19 bytes)
DATA_partitura_BCD4:
	defb 0feh,001h,0f5h,0e9h,008h,0f6h,0f8h,04eh,0eah,007h,0edh,012h,0ebh,087h,036h,0f1h	; bcd4  .......N......6.
	defb 0d6h,001h,003h	; bce4

; ----------------------------------------------------------------------
; DATOS partitura_BCE7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (35 bytes)
;   0xbce7..0xbd0a  (35 bytes)
DATA_partitura_BCE7:
	defb 0f0h,005h,051h,0d2h,0b5h,0d1h,005h,073h,0d2h,0b5h,0d1h,005h,073h,0d2h,075h,095h	; bce7  ..Q....s....s.u.
	defb 0d1h,0e9h,010h,0ebh,087h,015h,0f1h,0f1h,04eh,003h,001h,014h,058h,0ech,0f6h,0f8h	; bcf7  ........N...X...
	defb 003h,0eah,001h	; bd07

; ----------------------------------------------------------------------
; DATOS partitura_BD0A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (46 bytes)
;   0xbd0a..0xbd38  (46 bytes)
DATA_partitura_BD0A:
	defb 050h,0d8h,0fbh,002h,0feh,001h,0f6h,0f8h,04eh,0dbh,001h,0e9h,008h,0f0h,005h,062h	; bd0a  P.......N......b
	defb 0eah,007h,0edh,012h,0ebh,087h,034h,0f1h,0d2h,0b5h,095h,049h,021h,0e9h,002h,04bh	; bd1a  ......4....I!..K
	defb 07bh,0e9h,00fh,00fh,0ech,0e9h,010h,0eah,001h,001h,0ebh,087h,034h,0f1h	; bd2a  {...........4.

; ----------------------------------------------------------------------
; DATOS partitura_BD38: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (27 bytes)
;   0xbd38..0xbd53  (27 bytes)
DATA_partitura_BD38:
	defb 0eah,007h,0e9h,008h,0b5h,095h,049h,021h,0e9h,002h,04bh,07bh,0bbh,0e9h,018h,0ech	; bd38  ......I!..K{....
	defb 0eah,004h,0b0h,0eah,007h,0ebh,087h,034h,0f1h,0e9h,010h	; bd48  .......4...

; ----------------------------------------------------------------------
; DATOS partitura_BD53: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (35 bytes)
;   0xbd53..0xbd76  (35 bytes)
DATA_partitura_BD53:
	defb 0d1h,00dh,0dch,0feh,001h,0f6h,0f8h,04eh,0e9h,008h,0f0h,005h,051h,0eah,007h,0ebh	; bd53  .......N....Q...
	defb 087h,034h,0f1h,0edh,012h,0d1h,005h,0d2h,0a5h,0d1h,031h,007h,0d2h,0a5h,0d1h,071h	; bd63  .4........1....q
	defb 087h,075h,003h	; bd73

; ----------------------------------------------------------------------
; DATOS partitura_BD76: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (23 bytes)
;   0xbd76..0xbd8d  (23 bytes)
DATA_partitura_BD76:
	defb 055h,035h,013h,0feh,001h,0f6h,0f8h,04eh,0e9h,008h,0eah,007h,0ebh,087h,034h,0f1h	; bd76  U5.....N......4.
	defb 0d1h,005h,0d2h,0a5h,0d1h,031h,007h	; bd86

; ----------------------------------------------------------------------
; DATOS partitura_BD8D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (9 bytes)
;   0xbd8d..0xbd96  (9 bytes)
DATA_partitura_BD8D:
	defb 0d2h,0a5h,083h,07fh,04fh,0fch,002h,00eh,0bdh	; bd8d  ....O....

; ----------------------------------------------------------------------
; DATOS sin identificar  0xbd96..0xbd99  (3 bytes)
DATA_BD96:
	defb 0fdh,0d4h,0bch	; bd96

; ----------------------------------------------------------------------
; DATOS partitura_BD99: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (9 bytes)
;   0xbd99..0xbda2  (9 bytes)
DATA_partitura_BD99:
	defb 0feh,001h,0eeh,081h,0e9h,008h,0c2h,0f8h,04eh	; bd99  ........N

; ----------------------------------------------------------------------
; DATOS partitura_BDA2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (5 bytes)
;   0xbda2..0xbda7  (5 bytes)
DATA_partitura_BDA2:
	defb 0f9h,038h,0bfh,0f2h,001h	; bda2

; ----------------------------------------------------------------------
; DATOS partitura_BDA7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (9 bytes)
;   0xbda7..0xbdb0  (9 bytes)
DATA_partitura_BDA7:
	defb 058h,0ech,0eah,001h,050h,0f8h,04eh,0f9h,038h	; bda7  X...P.N.8

; ----------------------------------------------------------------------
; DATOS partitura_BDB0: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (22 bytes)
;   0xbdb0..0xbdc6  (22 bytes)
DATA_partitura_BDB0:
	defb 0bfh,0f2h,001h,055h,0ech,0eah,001h,050h,0e9h,008h,052h,0feh,001h,0f8h,04eh,0eeh	; bdb0  ...U...P..R...N.
	defb 081h,0dbh,001h,0e9h,008h,0c2h	; bdc0

; ----------------------------------------------------------------------
; DATOS partitura_BDC6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xbdc6..0xbdc8  (2 bytes)
DATA_partitura_BDC6:
	defb 0f0h,005h	; bdc6

; ----------------------------------------------------------------------
; DATOS partitura_BDC8: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (37 bytes)
;   0xbdc8..0xbded  (37 bytes)
DATA_partitura_BDC8:
	defb 072h,0eah,004h,0edh,011h,0ebh,087h,014h,0a1h,0d2h,0b5h,095h,049h,021h,0e9h,002h	; bdc8  r...........I!..
	defb 04bh,07bh,0e9h,00fh,00fh,0ech,0e9h,010h,0eah,001h,001h,0ebh,087h,014h,0a1h,0eah	; bdd8  K{..............
	defb 004h,0e9h,008h,0b5h,095h	; bde8

; ----------------------------------------------------------------------
; DATOS partitura_BDED: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xbded..0xbdff  (18 bytes)
DATA_partitura_BDED:
	defb 049h,021h,0e9h,002h,04bh,07bh,0bbh,0e9h,018h,0ech,0eah,002h,0b0h,0eah,004h,0ebh	; bded  I!..K{..........
	defb 087h,014h	; bdfd

; ----------------------------------------------------------------------
; DATOS partitura_BDFF: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (28 bytes)
;   0xbdff..0xbe1b  (28 bytes)
DATA_partitura_BDFF:
	defb 0a1h,0e9h,010h,0d1h,00dh,0dch,0feh,001h,0f8h,04eh,0e9h,008h,0f0h,005h,051h,0eeh	; bdff  .........N....Q.
	defb 081h,0dbh,001h,0eah,004h,0edh,011h,0ebh,087h,014h,0a1h,0d1h	; be0f  ............

; ----------------------------------------------------------------------
; DATOS partitura_BE1B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (29 bytes)
;   0xbe1b..0xbe38  (29 bytes)
DATA_partitura_BE1B:
	defb 005h,0d2h,0a5h,0d1h,031h,007h,0d2h,0a5h,0d1h,071h,087h,075h,003h,055h,035h,013h	; be1b  ....1....q.u.U5.
	defb 0feh,001h,0f8h,04eh,0e9h,008h,0eeh,081h,0eah,004h,0edh,011h,0ebh	; be2b  ...N.........

; ----------------------------------------------------------------------
; DATOS partitura_BE38: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xbe38..0xbe3e  (6 bytes)
DATA_partitura_BE38:
	defb 087h,014h,0a1h,0d1h,005h,0d2h	; be38

; ----------------------------------------------------------------------
; DATOS partitura_BE3E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xbe3e..0xbe44  (6 bytes)
DATA_partitura_BE3E:
	defb 0a5h,0d1h,031h,007h,0d2h,0a5h	; be3e

; ----------------------------------------------------------------------
; DATOS partitura_BE44: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xbe44..0xbe47  (3 bytes)
DATA_partitura_BE44:
	defb 083h,07fh,04ch	; be44

; ----------------------------------------------------------------------
; DATOS partitura_BE47: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xbe47..0xbe4b  (4 bytes)
DATA_partitura_BE47:
	defb 0fch,002h,0bbh,0bdh	; be47

; ----------------------------------------------------------------------
; DATOS sin identificar  0xbe4b..0xbe4e  (3 bytes)
DATA_BE4B:
	defb 0fdh,099h,0bdh	; be4b

; ----------------------------------------------------------------------
; DATOS partitura_BE4E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xbe4e..0xbe59  (11 bytes)
DATA_partitura_BE4E:
	defb 0feh,001h,0f9h,05eh,0bfh,0f9h,05eh,0bfh,0feh,001h,0f9h	; be4e  ...^..^....

; ----------------------------------------------------------------------
; DATOS partitura_BE59: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xbe59..0xbe5d  (4 bytes)
DATA_partitura_BE59:
	defb 07ah,0bfh,0f9h,07ah	; be59

; ----------------------------------------------------------------------
; DATOS partitura_BE5D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (13 bytes)
;   0xbe5d..0xbe6a  (13 bytes)
DATA_partitura_BE5D:
	defb 0bfh,0feh,001h,0f8h,009h,0e9h,008h,0eah,00dh,0ebh,01ah,03bh,091h	; be5d  .............

; ----------------------------------------------------------------------
; DATOS partitura_BE6A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xbe6a..0xbe83  (25 bytes)
DATA_partitura_BE6A:
	defb 0d4h,013h,0d3h,013h,053h,083h,0d4h,033h,0d3h,033h,073h,0a3h,0d4h,053h,0d3h,053h	; be6a  ....S..3.3s..S.S
	defb 0d2h,083h,073h,083h,073h,083h,073h,0feh,001h	; be7a  ..s.s.s..

; ----------------------------------------------------------------------
; DATOS partitura_BE83: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (35 bytes)
;   0xbe83..0xbea6  (35 bytes)
DATA_partitura_BE83:
	defb 0f8h,009h,0e9h,008h,0eah,00dh,0ebh,01ah,039h,051h,0d4h,013h,0d3h,013h,053h,083h	; be83  ........9Q....S.
	defb 0d4h,033h,0d3h,033h,073h,0a3h,0d4h,003h,0d3h,003h,083h,0d2h,013h,0d4h,003h,0d3h	; be93  .3.3s...........
	defb 003h,073h,0d2h	; bea3

; ----------------------------------------------------------------------
; DATOS partitura_BEA6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (5 bytes)
;   0xbea6..0xbeab  (5 bytes)
DATA_partitura_BEA6:
	defb 003h,0fch,002h,056h,0beh	; bea6

; ----------------------------------------------------------------------
; DATOS sin identificar  0xbeab..0xbeae  (3 bytes)
DATA_BEAB:
	defb 0fdh,04eh,0beh	; beab

; ----------------------------------------------------------------------
; DATOS partitura_BEAE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xbeae..0xbec7  (25 bytes)
DATA_partitura_BEAE:
	defb 0feh,001h,0f9h,099h,0bfh,0f9h,099h,0bfh,0feh,001h,0e9h,008h,0c1h,0f9h,0bah,0bfh	; beae  ................
	defb 003h,0f9h,0bah,0bfh,001h,0feh,001h,0f8h,009h	; bebe  .........

; ----------------------------------------------------------------------
; DATOS partitura_BEC7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xbec7..0xbece  (7 bytes)
DATA_partitura_BEC7:
	defb 0e9h,008h,0eah,00dh,0ebh,01ah,03bh	; bec7

; ----------------------------------------------------------------------
; DATOS partitura_BECE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (12 bytes)
;   0xbece..0xbeda  (12 bytes)
DATA_partitura_BECE:
	defb 091h,0d4h,0c1h,083h,0d3h,033h,073h,0a3h,0d4h,0a3h,0d3h,053h	; bece  .....3s....S

; ----------------------------------------------------------------------
; DATOS partitura_BEDA: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xbeda..0xbeec  (18 bytes)
DATA_partitura_BEDA:
	defb 083h,0d2h,033h,0d3h,003h,0d2h,003h,003h,003h,003h,003h,003h,001h,0feh,001h,0f8h	; beda  ..3.............
	defb 009h,0e9h	; beea

; ----------------------------------------------------------------------
; DATOS partitura_BEEC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xbeec..0xbef2  (6 bytes)
DATA_partitura_BEEC:
	defb 008h,0eah,00dh,0ebh,01ah,039h	; beec

; ----------------------------------------------------------------------
; DATOS partitura_BEF2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xbef2..0xbf03  (17 bytes)
DATA_partitura_BEF2:
	defb 051h,0d4h,0c1h,083h,0d3h,033h,073h,0a3h,0d4h,0a3h,0d3h,053h,083h,0d2h,033h,0d4h	; bef2  Q....3s....S..3.
	defb 073h	; bf02

; ----------------------------------------------------------------------
; DATOS partitura_BF03: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xbf03..0xbf09  (6 bytes)
DATA_partitura_BF03:
	defb 0d3h,073h,0d2h,003h,073h,0d4h	; bf03

; ----------------------------------------------------------------------
; DATOS partitura_BF09: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xbf09..0xbf0f  (6 bytes)
DATA_partitura_BF09:
	defb 073h,0d3h,053h,0a3h,0d2h,041h	; bf09

; ----------------------------------------------------------------------
; DATOS partitura_BF0F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xbf0f..0xbf12  (3 bytes)
DATA_partitura_BF0F:
	defb 0fch,002h,0b6h	; bf0f

; ----------------------------------------------------------------------
; DATOS partitura_BF12: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xbf12..0xbf13  (1 bytes)
DATA_partitura_BF12:
	defb 0beh	; bf12

; ----------------------------------------------------------------------
; DATOS sin identificar  0xbf13..0xbf16  (3 bytes)
DATA_BF13:
	defb 0fdh,0aeh,0beh	; bf13

; ----------------------------------------------------------------------
; DATOS sonido_BF16: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x9E (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392
;   (24 bytes)
;   0xbf16..0xbf2e  (24 bytes)
DATA_sonido_BF16:
	defb 0f5h,0d1h,0b0h,0d0h,000h,0d1h,0b0h,070h,040h,070h,0fbh,002h,0b0h,0d0h,000h,0d1h	; bf16  .......p@p......
	defb 0b0h,070h,0fah,0f5h,0d1h,090h,0b0h,090h	; bf26  .p......

; ----------------------------------------------------------------------
; DATOS partitura_BF2E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xbf2e..0xbf34  (6 bytes)
DATA_partitura_BF2E:
	defb 050h,000h,050h,0fbh,002h,090h	; bf2e

; ----------------------------------------------------------------------
; DATOS partitura_BF34: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xbf34..0xbf35  (1 bytes)
DATA_partitura_BF34:
	defb 0b0h	; bf34

; ----------------------------------------------------------------------
; DATOS partitura_BF35: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xbf35..0xbf39  (4 bytes)
DATA_partitura_BF35:
	defb 090h,050h,0fah,0e9h	; bf35

; ----------------------------------------------------------------------
; DATOS partitura_BF39: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xbf39..0xbf44  (11 bytes)
DATA_partitura_BF39:
	defb 008h,0eah,005h,0edh,011h,0ebh,087h,014h,0f1h,0d6h,001h	; bf39  ...........

; ----------------------------------------------------------------------
; DATOS partitura_BF44: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xbf44..0xbf4c  (8 bytes)
DATA_partitura_BF44:
	defb 003h,0f0h,005h,072h,0d2h,0b5h,0d1h,005h	; bf44  ...r....

; ----------------------------------------------------------------------
; DATOS partitura_BF4C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (5 bytes)
;   0xbf4c..0xbf51  (5 bytes)
DATA_partitura_BF4C:
	defb 073h,0d2h,0b5h,0d1h,005h	; bf4c

; ----------------------------------------------------------------------
; DATOS partitura_BF51: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (5 bytes)
;   0xbf51..0xbf56  (5 bytes)
DATA_partitura_BF51:
	defb 073h,0d2h,075h,095h,0d1h	; bf51

; ----------------------------------------------------------------------
; DATOS partitura_BF56: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xbf56..0xbf5a  (4 bytes)
DATA_partitura_BF56:
	defb 0e9h,010h,0ebh,087h	; bf56

; ----------------------------------------------------------------------
; DATOS partitura_BF5A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xbf5a..0xbf5e  (4 bytes)
DATA_partitura_BF5A:
	defb 013h,0f1h,0d8h,0fah	; bf5a

; ----------------------------------------------------------------------
; DATOS partitura_BF5E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (27 bytes)
;   0xbf5e..0xbf79  (27 bytes)
DATA_partitura_BF5E:
	defb 0f5h,0e9h,008h,0f8h,009h,0eah,00dh,0ebh,00ah,03bh,091h,0d4h,093h,0d3h,093h,0d2h	; bf5e  ................
	defb 007h,0fbh,002h,0f5h,0d4h,053h,0d3h,053h,097h,0fbh,002h	; bf6e  .....S.S...

; ----------------------------------------------------------------------
; DATOS partitura_BF79: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (39 bytes)
;   0xbf79..0xbfa0  (39 bytes)
DATA_partitura_BF79:
	defb 0fah,0f5h,0e9h,008h,0f8h,009h,0eah,00dh,0ebh,01ah,03bh,091h,0d4h,093h,0d3h,093h	; bf79  ................
	defb 0d2h,003h,0d3h,093h,0fbh,002h,0f5h,0d4h,053h,0d3h,053h,093h,053h,0fbh,002h,0fah	; bf89  ........S.S.S...
	defb 0e9h,008h,0f8h,009h,0eah,00dh,0ebh	; bf99

; ----------------------------------------------------------------------
; DATOS partitura_BFA0: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (54 bytes)
;   0xbfa0..0xbfd6  (54 bytes)
DATA_partitura_BFA0:
	defb 00ah,03bh,091h,0d4h,0c1h,0d3h,043h,0b3h,0d2h,047h,0d3h,043h,0b3h,0d2h,047h,0d3h	; bfa0  ......C..G.C..G.
	defb 003h,073h,0d2h,007h,0d3h,003h,073h,0d2h,005h,0fah,0f5h,0e9h,008h,0f8h,009h,0eah	; bfb0  .s....s.........
	defb 00dh,0ebh,01ah,03bh,091h,0d3h,043h,0b3h,0b3h,043h,043h,0b3h,0b3h,043h,003h,073h	; bfc0  ......C..CC..C.s
	defb 073h,003h,003h,073h,073h,0fah	; bfd0

; ----------------------------------------------------------------------
; DATOS sin identificar  0xbfd6..0xc000  (42 bytes)
DATA_BFD6:
	defb 09bh,0cch,0cbh,0cbh,0bah,0aah,0abh,0abh,0aah,0aah,0aah,0b9h,099h,022h,029h,0a9h	; bfd6  .............").
	defb 009h,099h,0aah,02ah,099h,092h,022h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; bfe6  ...*..".........
	defb 000h,000h,000h,00bh,099h,092h,020h,092h,000h,000h	; bff6  ...... ...
