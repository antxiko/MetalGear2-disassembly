; ==========================================================================
; METAL GEAR 2 SOLID SNAKE - Konami (1990) - MSX2 - MegaROM RC-767 de 512 KB (Konami SCC) - banco 23 (se ejecuta en 0xa000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x0a000


; ----------------------------------------------------------------------
; DATOS partitura_A000: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xa000..0xa006  (6 bytes)
DATA_partitura_A000:
	defb 0feh,004h,0e9h,005h,0d1h,0f5h	; a000

; ----------------------------------------------------------------------
; DATOS partitura_A006: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (16 bytes)
;   0xa006..0xa016  (16 bytes)
DATA_partitura_A006:
	defb 091h,060h,060h,091h,060h,060h,060h,060h,070h,080h,0fbh,020h,0f5h,0d0h,071h,0a1h	; a006  .``.````p.. ..q.

; ----------------------------------------------------------------------
; DATOS partitura_A016: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (10 bytes)
;   0xa016..0xa020  (10 bytes)
DATA_partitura_A016:
	defb 0a1h,023h,071h,0d1h,060h,070h,080h,090h,091h,060h	; a016  .#q.`p...`

; ----------------------------------------------------------------------
; DATOS partitura_A020: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xa020..0xa023  (3 bytes)
DATA_partitura_A020:
	defb 060h,060h,060h	; a020

; ----------------------------------------------------------------------
; DATOS partitura_A023: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xa023..0xa02e  (11 bytes)
DATA_partitura_A023:
	defb 070h,080h,0fbh,002h,0d0h,071h,0a1h,0a1h,023h,071h,0d1h	; a023  p....q..#q.

; ----------------------------------------------------------------------
; DATOS partitura_A02E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa02e..0xa02f  (1 bytes)
DATA_partitura_A02E:
	defb 060h	; a02e

; ----------------------------------------------------------------------
; DATOS partitura_A02F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xa02f..0xa040  (17 bytes)
DATA_partitura_A02F:
	defb 070h,080h,090h,091h,060h,060h,060h,060h,070h,080h,0d0h,071h,0a1h,0a1h,023h,071h	; a02f  p...````p..q..#q
	defb 0d1h	; a03f

; ----------------------------------------------------------------------
; DATOS partitura_A040: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xa040..0xa046  (6 bytes)
DATA_partitura_A040:
	defb 060h,070h,080h,090h,0d0h,070h	; a040

; ----------------------------------------------------------------------
; DATOS partitura_A046: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xa046..0xa051  (11 bytes)
DATA_partitura_A046:
	defb 070h,0a0h,0a0h,0d1h,060h,070h,080h,090h,0fdh,000h,0a0h	; a046  p...`p.....

; ----------------------------------------------------------------------
; DATOS partitura_A051: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (13 bytes)
;   0xa051..0xa05e  (13 bytes)
DATA_partitura_A051:
	defb 0feh,001h,0e9h,005h,0c2h,0e9h,00ah,0ech,0eah,007h,0f0h,00fh,044h	; a051  ............D

; ----------------------------------------------------------------------
; DATOS partitura_A05E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa05e..0xa05f  (1 bytes)
DATA_partitura_A05E:
	defb 0d6h	; a05e

; ----------------------------------------------------------------------
; DATOS partitura_A05F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa05f..0xa060  (1 bytes)
DATA_partitura_A05F:
	defb 010h	; a05f

; ----------------------------------------------------------------------
; DATOS partitura_A060: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (9 bytes)
;   0xa060..0xa069  (9 bytes)
DATA_partitura_A060:
	defb 001h,0d2h,002h,030h,085h,0a1h,0b2h,070h,0d1h	; a060  ...0...p.

; ----------------------------------------------------------------------
; DATOS partitura_A069: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xa069..0xa082  (25 bytes)
DATA_partitura_A069:
	defb 025h,051h,032h,000h,082h,030h,0d0h,000h,0d1h,080h,030h,000h,025h,0d2h,0b1h,0d1h	; a069  %Q2..0....0.%...
	defb 073h,0e9h,00ah,0f0h,00fh,044h,0d6h,010h,001h	; a079  s....D...

; ----------------------------------------------------------------------
; DATOS partitura_A082: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (13 bytes)
;   0xa082..0xa08f  (13 bytes)
DATA_partitura_A082:
	defb 0eah,007h,0ech,0d3h,002h,030h,081h,080h,000h,030h,080h,0d2h,000h	; a082  .....0...0...

; ----------------------------------------------------------------------
; DATOS partitura_A08F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xa08f..0xa091  (2 bytes)
DATA_partitura_A08F:
	defb 0d3h,080h	; a08f

; ----------------------------------------------------------------------
; DATOS partitura_A091: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (12 bytes)
;   0xa091..0xa09d  (12 bytes)
DATA_partitura_A091:
	defb 0b2h,070h,0d2h,022h,0d3h,070h,0d2h,020h,0d3h,0b0h,0d2h,070h	; a091  .p.".p. ...p

; ----------------------------------------------------------------------
; DATOS partitura_A09D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa09d..0xa0a5  (8 bytes)
DATA_partitura_A09D:
	defb 020h,0e9h,001h,036h,025h,006h,0e9h,00ah	; a09d   ..6%...

; ----------------------------------------------------------------------
; DATOS partitura_A0A5: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (34 bytes)
;   0xa0a5..0xa0c7  (34 bytes)
DATA_partitura_A0A5:
	defb 081h,0e9h,001h,036h,025h,006h,0e9h,00ah,0d1h,001h,0e9h,001h,0d2h,086h,035h,006h	; a0a5  ...6%.........5.
	defb 0e9h,00ah,0d1h,031h,0e9h,001h,026h,0d2h,0a5h,056h,0e9h,00ah,0d1h,051h,0e9h,001h	; a0b5  ...1..&..V...Q..
	defb 026h,0d2h	; a0c5

; ----------------------------------------------------------------------
; DATOS partitura_A0C7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (20 bytes)
;   0xa0c7..0xa0db  (20 bytes)
DATA_partitura_A0C7:
	defb 0b5h,076h,0e9h,00ah,0d1h,051h,0e9h,001h,026h,0d2h,0b5h,076h,0e9h,00ah,0d1h,071h	; a0c7  .v...Q..&..v...q
	defb 0e9h,005h,0e9h,00ah	; a0d7

; ----------------------------------------------------------------------
; DATOS partitura_A0DB: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (14 bytes)
;   0xa0db..0xa0e9  (14 bytes)
DATA_partitura_A0DB:
	defb 0ech,0eah,007h,0f0h,00fh,044h,0d6h,010h,001h,0d2h,002h,030h,085h,0a1h	; a0db  .....D.....0..

; ----------------------------------------------------------------------
; DATOS partitura_A0E9: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (10 bytes)
;   0xa0e9..0xa0f3  (10 bytes)
DATA_partitura_A0E9:
	defb 0b2h,070h,0d1h,025h,051h,032h,000h,082h,030h,0d0h	; a0e9  .p.%Q2..0.

; ----------------------------------------------------------------------
; DATOS partitura_A0F3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (26 bytes)
;   0xa0f3..0xa10d  (26 bytes)
DATA_partitura_A0F3:
	defb 000h,0d1h,080h,030h,000h,025h,0d2h,0b1h,0d1h,073h,0e9h,00ah,0f0h,00fh,044h,0d6h	; a0f3  ...0.%...s....D.
	defb 010h,001h,0eah,007h,0ech,0d3h,002h,030h,081h,080h	; a103  .......0..

; ----------------------------------------------------------------------
; DATOS partitura_A10D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (16 bytes)
;   0xa10d..0xa11d  (16 bytes)
DATA_partitura_A10D:
	defb 000h,030h,080h,0d2h,000h,0d3h,080h,0b2h,070h,0d2h,022h,0d3h,070h,0d2h,020h,0d3h	; a10d  .0......p.".p. .

; ----------------------------------------------------------------------
; DATOS partitura_A11D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (23 bytes)
;   0xa11d..0xa134  (23 bytes)
DATA_partitura_A11D:
	defb 0b0h,0d2h,070h,020h,0e9h,001h,036h,025h,006h,0e9h,00ah,081h,0e9h,001h,036h,025h	; a11d  ..p ..6%......6%
	defb 006h,0e9h,00ah,0d1h,001h,0e9h,001h	; a12d

; ----------------------------------------------------------------------
; DATOS partitura_A134: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xa134..0xa136  (2 bytes)
DATA_partitura_A134:
	defb 0d2h,086h	; a134

; ----------------------------------------------------------------------
; DATOS partitura_A136: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (5 bytes)
;   0xa136..0xa13b  (5 bytes)
DATA_partitura_A136:
	defb 035h,006h,0e9h,00ah,0d1h	; a136

; ----------------------------------------------------------------------
; DATOS partitura_A13B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (47 bytes)
;   0xa13b..0xa16a  (47 bytes)
DATA_partitura_A13B:
	defb 031h,0e9h,001h,026h,0d2h,0a5h,056h,0e9h,00ah,0d1h,051h,0e9h,001h,026h,0d2h,0b5h	; a13b  1..&..V...Q..&..
	defb 076h,0e9h,00ah,0d1h,051h,020h,030h,0e9h,005h,050h,0e9h,005h,0eah,00bh,0ebh,00ah	; a14b  v...Q 0..P......
	defb 01bh,051h,0dbh,002h,0d4h,001h,001h,001h,0d5h,073h,071h,071h,071h,071h,071h	; a15b  .Q.......sqqqqq

; ----------------------------------------------------------------------
; DATOS partitura_A16A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xa16a..0xa170  (6 bytes)
DATA_partitura_A16A:
	defb 071h,071h,0d4h,001h,001h,001h	; a16a

; ----------------------------------------------------------------------
; DATOS partitura_A170: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (47 bytes)
;   0xa170..0xa19f  (47 bytes)
DATA_partitura_A170:
	defb 023h,021h,021h,021h,021h,021h,021h,021h,0e9h,005h,0eah,00bh,0ebh,00ah,01bh,051h	; a170  #!!!!!!!.......Q
	defb 0dbh,002h,0d4h,001h,001h,001h,0d5h,073h,071h,071h,071h,071h,071h,071h,071h,0d4h	; a180  .......sqqqqqqq.
	defb 001h,0d5h,0b1h,0a1h,073h,071h,071h,071h,071h,071h,071h,071h,0fdh,051h,0a0h	; a190  ....sqqqqqqq.Q.

; ----------------------------------------------------------------------
; DATOS partitura_A19F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (19 bytes)
;   0xa19f..0xa1b2  (19 bytes)
DATA_partitura_A19F:
	defb 0feh,001h,0e9h,005h,0f6h,0f0h,000h,0d8h,0f8h,051h,0eah,008h,0ebh,00ah,02bh,0f1h	; a19f  .........Q....+.
	defb 0dbh,002h,0d1h	; a1af

; ----------------------------------------------------------------------
; DATOS partitura_A1B2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa1b2..0xa1b3  (1 bytes)
DATA_partitura_A1B2:
	defb 037h	; a1b2

; ----------------------------------------------------------------------
; DATOS partitura_A1B3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xa1b3..0xa1b6  (3 bytes)
DATA_partitura_A1B3:
	defb 037h,037h,037h	; a1b3

; ----------------------------------------------------------------------
; DATOS partitura_A1B6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (13 bytes)
;   0xa1b6..0xa1c3  (13 bytes)
DATA_partitura_A1B6:
	defb 037h,037h,037h,037h,037h,037h,037h,037h,0eah,008h,0ebh,00ah,02bh	; a1b6  77777777....+

; ----------------------------------------------------------------------
; DATOS partitura_A1C3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xa1c3..0xa1c6  (3 bytes)
DATA_partitura_A1C3:
	defb 0f1h,0dbh,002h	; a1c3

; ----------------------------------------------------------------------
; DATOS partitura_A1C6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (13 bytes)
;   0xa1c6..0xa1d3  (13 bytes)
DATA_partitura_A1C6:
	defb 0d1h,037h,037h,037h,037h,037h,037h,037h,037h,037h,037h,037h,037h	; a1c6  .777777777777

; ----------------------------------------------------------------------
; DATOS partitura_A1D3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (16 bytes)
;   0xa1d3..0xa1e3  (16 bytes)
DATA_partitura_A1D3:
	defb 0eah,008h,0ebh,00ah,02bh,0f1h,0dbh,002h,0d1h,037h,037h,037h,037h,037h,037h,037h	; a1d3  ....+....7777777

; ----------------------------------------------------------------------
; DATOS partitura_A1E3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xa1e3..0xa1f5  (18 bytes)
DATA_partitura_A1E3:
	defb 037h,037h,037h,037h,037h,0eah,008h,0ebh,00ah,02bh,0f1h,0dbh,002h,0d1h,037h,037h	; a1e3  77777....+....77
	defb 037h,037h	; a1f3

; ----------------------------------------------------------------------
; DATOS partitura_A1F5: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (13 bytes)
;   0xa1f5..0xa202  (13 bytes)
DATA_partitura_A1F5:
	defb 037h,037h,037h,037h,037h,037h,037h,037h,0f8h,002h,0eah,009h,0ebh	; a1f5  77777777.....

; ----------------------------------------------------------------------
; DATOS partitura_A202: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (10 bytes)
;   0xa202..0xa20c  (10 bytes)
DATA_partitura_A202:
	defb 009h,03bh,003h,0f0h,00fh,044h,0d6h,010h,001h,0d2h	; a202  .....D....

; ----------------------------------------------------------------------
; DATOS partitura_A20C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xa20c..0xa20f  (3 bytes)
DATA_partitura_A20C:
	defb 071h,071h,071h	; a20c

; ----------------------------------------------------------------------
; DATOS partitura_A20F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xa20f..0xa220  (17 bytes)
DATA_partitura_A20F:
	defb 0b3h,0b1h,0d6h,001h,001h,0f8h,011h,0eah,009h,0ebh,00ah,027h,004h,0d1h,070h,0b0h	; a20f  ...........'..p.
	defb 0d0h	; a21f

; ----------------------------------------------------------------------
; DATOS partitura_A220: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xa220..0xa222  (2 bytes)
DATA_partitura_A220:
	defb 030h,050h	; a220

; ----------------------------------------------------------------------
; DATOS partitura_A222: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xa222..0xa234  (18 bytes)
DATA_partitura_A222:
	defb 070h,030h,0d1h,0b0h,070h,0d0h,030h,0d1h,0b0h,070h,0d0h,020h,0d6h,010h,001h,0d6h	; a222  p0..p.0..p. ....
	defb 010h,001h	; a232

; ----------------------------------------------------------------------
; DATOS partitura_A234: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xa234..0xa246  (18 bytes)
DATA_partitura_A234:
	defb 0f8h,002h,0eah,009h,0ebh,009h,03bh,003h,0d2h,071h,071h,071h,0d1h,023h,021h,0f8h	; a234  .........qqq.#!.
	defb 011h,0ebh	; a244

; ----------------------------------------------------------------------
; DATOS partitura_A246: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (21 bytes)
;   0xa246..0xa25b  (21 bytes)
DATA_partitura_A246:
	defb 009h,027h,004h,0eah,00ah,0d6h,001h,001h,0d1h,020h,040h,060h,070h,090h,060h,020h	; a246  .'....... @`p.`
	defb 090h,0d0h,000h,020h,0d1h	; a256

; ----------------------------------------------------------------------
; DATOS partitura_A25B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa25b..0xa25c  (1 bytes)
DATA_partitura_A25B:
	defb 090h	; a25b

; ----------------------------------------------------------------------
; DATOS partitura_A25C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (27 bytes)
;   0xa25c..0xa277  (27 bytes)
DATA_partitura_A25C:
	defb 020h,0f8h,002h,0eah,009h,0ebh,009h,03bh,003h,0f0h,00fh,044h,0d6h,010h,001h,0d2h	; a25c   ..........D....
	defb 071h,071h,071h,0b3h,0b1h,0d6h,001h,001h,0f8h,011h,0eah	; a26c  qqq........

; ----------------------------------------------------------------------
; DATOS partitura_A277: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (26 bytes)
;   0xa277..0xa291  (26 bytes)
DATA_partitura_A277:
	defb 009h,0ebh,00ah,027h,004h,0d1h,070h,0b0h,0d0h,030h,050h,070h,030h,0d1h,0b0h,070h	; a277  ...'..p..0Pp0..p
	defb 0d0h,030h,0d1h,0b0h,070h,0d0h,020h,0d6h,010h,001h	; a287  .0..p. ...

; ----------------------------------------------------------------------
; DATOS partitura_A291: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xa291..0xa2a2  (17 bytes)
DATA_partitura_A291:
	defb 0f8h,002h,0eah,009h,0ebh,009h,03bh,003h,0d2h,071h,071h,071h,0d1h,023h,021h,0d6h	; a291  .........qqq.#!.
	defb 001h	; a2a1

; ----------------------------------------------------------------------
; DATOS partitura_A2A2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xa2a2..0xa2bb  (25 bytes)
DATA_partitura_A2A2:
	defb 001h,0f8h,011h,0ebh,009h,027h,004h,0eah,00ah,0d1h,0b0h,0d0h,000h,020h,030h,050h	; a2a2  .....'....... 0P
	defb 030h,020h,030h,050h,070h,090h,0b0h,0fdh,09fh	; a2b2  0 0Pp....

; ----------------------------------------------------------------------
; DATOS partitura_A2BB: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa2bb..0xa2bc  (1 bytes)
DATA_partitura_A2BB:
	defb 0a1h	; a2bb

; ----------------------------------------------------------------------
; DATOS partitura_A2BC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa2bc..0xa2c4  (8 bytes)
DATA_partitura_A2BC:
	defb 0feh,001h,0e9h,005h,0f8h,023h,0eah,00fh	; a2bc  .....#..

; ----------------------------------------------------------------------
; DATOS partitura_A2C4: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (5 bytes)
;   0xa2c4..0xa2c9  (5 bytes)
DATA_partitura_A2C4:
	defb 0ebh,00ah,03bh,021h,0dbh	; a2c4

; ----------------------------------------------------------------------
; DATOS partitura_A2C9: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa2c9..0xa2d1  (8 bytes)
DATA_partitura_A2C9:
	defb 002h,0f5h,0d4h,001h,001h,001h,0fbh,004h	; a2c9  ........

; ----------------------------------------------------------------------
; DATOS partitura_A2D1: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xa2d1..0xa2dc  (11 bytes)
DATA_partitura_A2D1:
	defb 0d5h,0f5h,071h,071h,071h,0fbh,004h,0f5h,081h,081h,081h	; a2d1  ..qqq......

; ----------------------------------------------------------------------
; DATOS partitura_A2DC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xa2dc..0xa2e7  (11 bytes)
DATA_partitura_A2DC:
	defb 0fbh,004h,0a1h,0a1h,0a1h,0a1h,0a1h,0a1h,0b1h,0b1h,0b1h	; a2dc  ...........

; ----------------------------------------------------------------------
; DATOS partitura_A2E7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xa2e7..0xa2ed  (6 bytes)
DATA_partitura_A2E7:
	defb 0b1h,0b1h,0b1h,0eah,00fh,0ebh	; a2e7

; ----------------------------------------------------------------------
; DATOS partitura_A2ED: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (5 bytes)
;   0xa2ed..0xa2f2  (5 bytes)
DATA_partitura_A2ED:
	defb 00ah,03bh,021h,0dbh,002h	; a2ed

; ----------------------------------------------------------------------
; DATOS partitura_A2F2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xa2f2..0xa2f5  (3 bytes)
DATA_partitura_A2F2:
	defb 0f5h,0d4h,001h	; a2f2

; ----------------------------------------------------------------------
; DATOS partitura_A2F5: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xa2f5..0xa2f8  (3 bytes)
DATA_partitura_A2F5:
	defb 001h,001h,0fbh	; a2f5

; ----------------------------------------------------------------------
; DATOS partitura_A2F8: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (5 bytes)
;   0xa2f8..0xa2fd  (5 bytes)
DATA_partitura_A2F8:
	defb 004h,0d5h,0f5h,071h,071h	; a2f8

; ----------------------------------------------------------------------
; DATOS partitura_A2FD: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa2fd..0xa305  (8 bytes)
DATA_partitura_A2FD:
	defb 071h,0fbh,004h,0f5h,081h,081h,081h,0fbh	; a2fd  q.......

; ----------------------------------------------------------------------
; DATOS partitura_A305: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa305..0xa306  (1 bytes)
DATA_partitura_A305:
	defb 004h	; a305

; ----------------------------------------------------------------------
; DATOS partitura_A306: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa306..0xa30e  (8 bytes)
DATA_partitura_A306:
	defb 0a1h,0a1h,0a1h,0a1h,0a1h,0a1h,0b1h,0b1h	; a306  ........

; ----------------------------------------------------------------------
; DATOS partitura_A30E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa30e..0xa316  (8 bytes)
DATA_partitura_A30E:
	defb 0b1h,0b1h,0b1h,0b1h,0eah,00fh,0ebh,00ah	; a30e  ........

; ----------------------------------------------------------------------
; DATOS partitura_A316: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa316..0xa317  (1 bytes)
DATA_partitura_A316:
	defb 03bh	; a316

; ----------------------------------------------------------------------
; DATOS partitura_A317: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xa317..0xa31d  (6 bytes)
DATA_partitura_A317:
	defb 021h,0dbh,002h,0f5h,0d4h,001h	; a317

; ----------------------------------------------------------------------
; DATOS partitura_A31D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa31d..0xa31e  (1 bytes)
DATA_partitura_A31D:
	defb 001h	; a31d

; ----------------------------------------------------------------------
; DATOS partitura_A31E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa31e..0xa326  (8 bytes)
DATA_partitura_A31E:
	defb 001h,0fbh,004h,0d5h,0f5h,071h,071h,071h	; a31e  .....qqq

; ----------------------------------------------------------------------
; DATOS partitura_A326: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xa326..0xa33f  (25 bytes)
DATA_partitura_A326:
	defb 0fbh,004h,0f5h,081h,081h,081h,0fbh,004h,0a1h,0a1h,0a1h,0a1h,0a1h,0a1h,0b1h,0b1h	; a326  ................
	defb 0b1h,0b1h,0b1h,0b1h,0eah,00fh,0ebh,00ah,03bh	; a336  .........

; ----------------------------------------------------------------------
; DATOS partitura_A33F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (94 bytes)
;   0xa33f..0xa39d  (94 bytes)
DATA_partitura_A33F:
	defb 021h,0dbh,002h,0f5h,0d4h,001h,001h,001h,0fbh,004h,0d5h,0f5h,071h,071h,071h,0fbh	; a33f  !...........qqq.
	defb 004h,0f5h,081h,081h,081h,0fbh,004h,0a1h,0a1h,0a1h,0a1h,0a1h,0a1h,0b1h,0b1h,0b1h	; a34f  ................
	defb 0b1h,0b1h,0b1h,0eah,00fh,0ebh,00ah,03bh,031h,0dbh,002h,0d4h,001h,001h,001h,0d5h	; a35f  ........1.......
	defb 073h,071h,071h,071h,071h,071h,071h,071h,0d4h,001h,001h,001h,023h,021h,021h,021h	; a36f  sqqqqqqq....#!!!
	defb 021h,021h,021h,021h,0eah,00fh,0ebh,00ah,03bh,031h,0dbh,002h,0d4h,001h,001h,001h	; a37f  !!!!.....1......
	defb 0d5h,073h,071h,071h,071h,071h,071h,071h,071h,0d4h,001h,0d5h,0b1h,0a1h	; a38f  .sqqqqqqq.....

; ----------------------------------------------------------------------
; DATOS partitura_A39D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xa39d..0xa3a8  (11 bytes)
DATA_partitura_A39D:
	defb 073h,071h,071h,071h,071h,071h,071h,071h,0fdh,0bch,0a2h	; a39d  sqqqqqqq...

; ----------------------------------------------------------------------
; DATOS partitura_A3A8: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (24 bytes)
;   0xa3a8..0xa3c0  (24 bytes)
DATA_partitura_A3A8:
	defb 0feh,001h,0e9h,00ah,0f6h,0f8h,002h,0eah,00ah,0ebh,009h,03bh,091h,0dbh,004h,0f0h	; a3a8  ................
	defb 00fh,044h,0d6h,010h,001h,0d2h,002h,030h	; a3b8  .D.....0

; ----------------------------------------------------------------------
; DATOS partitura_A3C0: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (24 bytes)
;   0xa3c0..0xa3d8  (24 bytes)
DATA_partitura_A3C0:
	defb 085h,0a1h,0b2h,070h,0d1h,025h,051h,032h,000h,082h,030h,0d0h,000h,0d1h,080h,030h	; a3c0  ...p.%Q2..0....0
	defb 000h,025h,0d2h,0b1h,0d1h,073h,0e9h,00ah	; a3d0  .%...s..

; ----------------------------------------------------------------------
; DATOS partitura_A3D8: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (10 bytes)
;   0xa3d8..0xa3e2  (10 bytes)
DATA_partitura_A3D8:
	defb 0f8h,012h,0eah,00ah,0ebh,009h,03bh,091h,0dbh,004h	; a3d8  ..........

; ----------------------------------------------------------------------
; DATOS partitura_A3E2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xa3e2..0xa3e8  (6 bytes)
DATA_partitura_A3E2:
	defb 0f0h,00fh,044h,0d6h,010h,001h	; a3e2

; ----------------------------------------------------------------------
; DATOS partitura_A3E8: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (168 bytes)
;   0xa3e8..0xa490  (168 bytes)
DATA_partitura_A3E8:
	defb 0eah,00dh,0d3h,002h,030h,081h,080h,000h,030h,080h,0d2h,000h,0d3h,080h,0b2h,070h	; a3e8  ....0...0......p
	defb 0d2h,022h,0d3h,070h,0d2h,020h,0d3h,0b0h,0d2h,070h,020h,0e9h,001h,036h,025h,006h	; a3f8  .".p. ...p ..6%.
	defb 0e9h,00ah,081h,0e9h,001h,036h,025h,006h,0e9h,00ah,0d1h,001h,0e9h,001h,0d2h,086h	; a408  .....6%.........
	defb 035h,006h,0e9h,00ah,0d1h,031h,0eah,00ch,0e9h,001h,026h,0d2h,0a5h,056h,0e9h,00ah	; a418  5....1....&..V..
	defb 0eah,00bh,0d1h,051h,0e9h,001h,026h,0d2h,0b5h,076h,0e9h,00ah,0d1h,051h,0e9h,001h	; a428  ...Q..&..v...Q..
	defb 026h,0d2h,0b5h,076h,0e9h,00ah,0d1h,071h,0e9h,00ah,0f6h,0f8h,002h,0eah,00ah,0ebh	; a438  &..v...q........
	defb 009h,03bh,091h,0dbh,004h,0f0h,00fh,044h,0d6h,010h,001h,0d2h,002h,030h,085h,0a1h	; a448  .......D.....0..
	defb 0b2h,070h,0d1h,025h,051h,032h,000h,082h,030h,0d0h,000h,0d1h,080h,030h,000h,025h	; a458  .p.%Q2..0....0.%
	defb 0d2h,0b1h,0d1h,073h,0e9h,00ah,0f8h,012h,0eah,00ah,0ebh,009h,03bh,091h,0dbh,004h	; a468  ...s............
	defb 0f0h,00fh,044h,0d6h,010h,001h,0eah,00dh,0d3h,002h,030h,081h,080h,000h,030h,080h	; a478  ..D.......0...0.
	defb 0d2h,000h,0d3h,080h,0b2h,070h,0d2h,022h	; a488  .....p."

; ----------------------------------------------------------------------
; DATOS partitura_A490: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (37 bytes)
;   0xa490..0xa4b5  (37 bytes)
DATA_partitura_A490:
	defb 0d3h,070h,0d2h,020h,0d3h,0b0h,0d2h,070h,020h,0e9h,001h,036h,025h,006h,0e9h,00ah	; a490  .p. ...p ..6%...
	defb 081h,0e9h,001h,036h,025h,006h,0e9h,00ah,0d1h,001h,0e9h,001h,0d2h,086h,035h,006h	; a4a0  ...6%.........5.
	defb 0e9h,00ah,0d1h,031h,0eah	; a4b0

; ----------------------------------------------------------------------
; DATOS partitura_A4B5: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xa4b5..0xa4c6  (17 bytes)
DATA_partitura_A4B5:
	defb 00ch,0e9h,001h,026h,0d2h,0a5h,056h,0e9h,00ah,0eah,00bh,0d1h,051h,0e9h,001h,026h	; a4b5  ...&..V.....Q..&
	defb 0d2h	; a4c5

; ----------------------------------------------------------------------
; DATOS partitura_A4C6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (22 bytes)
;   0xa4c6..0xa4dc  (22 bytes)
DATA_partitura_A4C6:
	defb 0b5h,076h,0e9h,00ah,0d1h,051h,020h,030h,050h,070h,0e9h,005h,0f8h,002h,0eah,009h	; a4c6  .v...Q 0Pp......
	defb 0ebh,009h,03bh,003h,0f0h,00fh	; a4d6

; ----------------------------------------------------------------------
; DATOS partitura_A4DC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xa4dc..0xa4e7  (11 bytes)
DATA_partitura_A4DC:
	defb 044h,0d6h,010h,001h,0d0h,001h,0d1h,031h,031h,073h,071h	; a4dc  D......11sq

; ----------------------------------------------------------------------
; DATOS partitura_A4E7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (9 bytes)
;   0xa4e7..0xa4f0  (9 bytes)
DATA_partitura_A4E7:
	defb 0eah,003h,070h,0eah,002h,070h,0f8h,012h,0eah	; a4e7  ..p..p...

; ----------------------------------------------------------------------
; DATOS partitura_A4F0: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa4f0..0xa4f1  (1 bytes)
DATA_partitura_A4F0:
	defb 00ah	; a4f0

; ----------------------------------------------------------------------
; DATOS partitura_A4F1: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xa4f1..0xa4f3  (2 bytes)
DATA_partitura_A4F1:
	defb 0edh,018h	; a4f1

; ----------------------------------------------------------------------
; DATOS partitura_A4F3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa4f3..0xa4fb  (8 bytes)
DATA_partitura_A4F3:
	defb 0ebh,087h,017h,071h,0d2h,071h,051h,0b1h	; a4f3  ...q.qQ.

; ----------------------------------------------------------------------
; DATOS partitura_A4FB: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa4fb..0xa4fc  (1 bytes)
DATA_partitura_A4FB:
	defb 073h	; a4fb

; ----------------------------------------------------------------------
; DATOS partitura_A4FC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa4fc..0xa4fd  (1 bytes)
DATA_partitura_A4FC:
	defb 0eah	; a4fc

; ----------------------------------------------------------------------
; DATOS partitura_A4FD: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xa4fd..0xa504  (7 bytes)
DATA_partitura_A4FD:
	defb 009h,0ebh,009h,03bh,003h,0d1h,031h	; a4fd

; ----------------------------------------------------------------------
; DATOS partitura_A504: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa504..0xa505  (1 bytes)
DATA_partitura_A504:
	defb 031h	; a504

; ----------------------------------------------------------------------
; DATOS partitura_A505: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa505..0xa50d  (8 bytes)
DATA_partitura_A505:
	defb 031h,093h,091h,0eah,003h,090h,0eah,002h	; a505  1.......

; ----------------------------------------------------------------------
; DATOS partitura_A50D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa50d..0xa515  (8 bytes)
DATA_partitura_A50D:
	defb 090h,0f8h,012h,0edh,018h,0ebh,087h,017h	; a50d  ........

; ----------------------------------------------------------------------
; DATOS partitura_A515: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa515..0xa51d  (8 bytes)
DATA_partitura_A515:
	defb 071h,0eah,00ah,0d2h,091h,061h,0d1h,021h	; a515  q....a.!

; ----------------------------------------------------------------------
; DATOS partitura_A51D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa51d..0xa525  (8 bytes)
DATA_partitura_A51D:
	defb 0d2h,093h,0e9h,005h,0f8h,002h,0eah,009h	; a51d  ........

; ----------------------------------------------------------------------
; DATOS partitura_A525: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xa525..0xa52b  (6 bytes)
DATA_partitura_A525:
	defb 0ebh,009h,03bh,003h,0f0h,00fh	; a525

; ----------------------------------------------------------------------
; DATOS partitura_A52B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xa52b..0xa52d  (2 bytes)
DATA_partitura_A52B:
	defb 044h,0d6h	; a52b

; ----------------------------------------------------------------------
; DATOS partitura_A52D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa52d..0xa52e  (1 bytes)
DATA_partitura_A52D:
	defb 010h	; a52d

; ----------------------------------------------------------------------
; DATOS partitura_A52E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa52e..0xa52f  (1 bytes)
DATA_partitura_A52E:
	defb 001h	; a52e

; ----------------------------------------------------------------------
; DATOS partitura_A52F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa52f..0xa537  (8 bytes)
DATA_partitura_A52F:
	defb 0d1h,031h,031h,031h,073h,071h,0eah,003h	; a52f  .111sq..

; ----------------------------------------------------------------------
; DATOS partitura_A537: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa537..0xa53f  (8 bytes)
DATA_partitura_A537:
	defb 070h,0eah,002h,070h,0f8h,012h,0eah,00ah	; a537  p..p....

; ----------------------------------------------------------------------
; DATOS partitura_A53F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa53f..0xa547  (8 bytes)
DATA_partitura_A53F:
	defb 0edh,018h,0ebh,087h,017h,071h,0d2h,071h	; a53f  .....q.q

; ----------------------------------------------------------------------
; DATOS partitura_A547: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa547..0xa54f  (8 bytes)
DATA_partitura_A547:
	defb 0e9h,001h,0d2h,056h,0b5h,0d1h,026h,0e9h	; a547  ...V..&.

; ----------------------------------------------------------------------
; DATOS partitura_A54F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa54f..0xa557  (8 bytes)
DATA_partitura_A54F:
	defb 005h,033h,0f8h,002h,0eah,009h,0ebh,009h	; a54f  .3......

; ----------------------------------------------------------------------
; DATOS partitura_A557: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (9 bytes)
;   0xa557..0xa560  (9 bytes)
DATA_partitura_A557:
	defb 03bh,003h,0d1h,031h,031h,031h,0b3h,0b1h,0f8h	; a557  ...111...

; ----------------------------------------------------------------------
; DATOS partitura_A560: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xa560..0xa562  (2 bytes)
DATA_partitura_A560:
	defb 012h,0eah	; a560

; ----------------------------------------------------------------------
; DATOS partitura_A562: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (10 bytes)
;   0xa562..0xa56c  (10 bytes)
DATA_partitura_A562:
	defb 00ah,0edh,018h,0ebh,087h,017h,071h,0d2h,0e9h,001h	; a562  ......q...

; ----------------------------------------------------------------------
; DATOS partitura_A56C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xa56c..0xa573  (7 bytes)
DATA_partitura_A56C:
	defb 076h,0b5h,0d1h,036h,0e9h,005h,052h	; a56c

; ----------------------------------------------------------------------
; DATOS partitura_A573: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xa573..0xa57a  (7 bytes)
DATA_partitura_A573:
	defb 0d2h,0b0h,0d1h,073h,0fdh,0a8h,0a3h	; a573

; ----------------------------------------------------------------------
; DATOS partitura_A57A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xa57a..0xa580  (6 bytes)
DATA_partitura_A57A:
	defb 0e9h,005h,0f0h,000h,0eah,005h	; a57a

; ----------------------------------------------------------------------
; DATOS partitura_A580: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (19 bytes)
;   0xa580..0xa593  (19 bytes)
DATA_partitura_A580:
	defb 0ebh,00ah,03bh,003h,0d6h,001h,001h,0f5h,0d0h,030h,020h,030h,020h,000h,0d1h,0b0h	; a580  .........0 0 ...
	defb 0d0h,000h,0d1h	; a590

; ----------------------------------------------------------------------
; DATOS partitura_A593: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa593..0xa59b  (8 bytes)
DATA_partitura_A593:
	defb 0b0h,0fbh,003h,0f5h,0d0h,050h,030h,050h	; a593  .....P0P

; ----------------------------------------------------------------------
; DATOS partitura_A59B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (34 bytes)
;   0xa59b..0xa5bd  (34 bytes)
DATA_partitura_A59B:
	defb 030h,020h,0d1h,0b0h,0d0h,020h,0d1h,0b0h,0fbh,003h,0f5h,0d0h,030h,020h,030h,020h	; a59b  0 ... ......0 0
	defb 000h,0d1h,080h,0d0h,000h,0d1h,080h,0fbh,003h,0d0h,050h,030h,050h,030h,020h,0d1h	; a5ab  ..........P0P0 .
	defb 0a0h,0d0h	; a5bb

; ----------------------------------------------------------------------
; DATOS partitura_A5BD: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xa5bd..0xa5c3  (6 bytes)
DATA_partitura_A5BD:
	defb 020h,0d1h,0a0h,0f5h,0d0h,050h	; a5bd

; ----------------------------------------------------------------------
; DATOS partitura_A5C3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (20 bytes)
;   0xa5c3..0xa5d7  (20 bytes)
DATA_partitura_A5C3:
	defb 030h,050h,030h,0d0h,020h,0d1h,0b0h,0d0h,020h,0d1h,0b0h,0fbh,002h,0eah,007h,0ebh	; a5c3  0P0. ... .......
	defb 00ah,03bh,003h,0d6h	; a5d3

; ----------------------------------------------------------------------
; DATOS partitura_A5D7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (16 bytes)
;   0xa5d7..0xa5e7  (16 bytes)
DATA_partitura_A5D7:
	defb 001h,001h,0f5h,0d0h,030h,020h,030h,020h,000h,0d1h,0b0h,0d0h,000h,0d1h,0b0h,0fbh	; a5d7  ....0 0 ........

; ----------------------------------------------------------------------
; DATOS partitura_A5E7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (37 bytes)
;   0xa5e7..0xa60c  (37 bytes)
DATA_partitura_A5E7:
	defb 003h,0f5h,0d0h,050h,030h,050h,030h,020h,0d1h,0b0h,0d0h,020h,0d1h,0b0h,0fbh,003h	; a5e7  ...P0P0 ... ....
	defb 0f5h,0d0h,030h,020h,030h,020h,000h,0d1h,080h,0d0h,000h,0d1h,080h,0fbh,003h,0d0h	; a5f7  ..0 0 ..........
	defb 050h,030h,050h,030h,020h	; a607

; ----------------------------------------------------------------------
; DATOS partitura_A60C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xa60c..0xa617  (11 bytes)
DATA_partitura_A60C:
	defb 0d1h,0a0h,0d0h,020h,0d1h,0a0h,0d0h,050h,030h,050h,030h	; a60c  ... ...P0P0

; ----------------------------------------------------------------------
; DATOS partitura_A617: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xa617..0xa630  (25 bytes)
DATA_partitura_A617:
	defb 0d0h,020h,0d1h,0b0h,0d0h,020h,0d1h,0b0h,0d0h,050h,030h,050h,030h,050h,070h,090h	; a617  . ... ...P0P0Pp.
	defb 0b0h,0eah,005h,0ebh,00ah,03bh,003h,0d6h,001h	; a627  .........

; ----------------------------------------------------------------------
; DATOS partitura_A630: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (36 bytes)
;   0xa630..0xa654  (36 bytes)
DATA_partitura_A630:
	defb 001h,0f5h,0d0h,030h,020h,030h,020h,000h,0d1h,0b0h,0d0h,000h,0d1h,0b0h,0fbh,003h	; a630  ...0 0 .........
	defb 0f5h,0d0h,050h,030h,050h,030h,020h,0d1h,0b0h,0d0h,020h,0d1h,0b0h,0fbh,003h,0f5h	; a640  ..P0P0 ... .....
	defb 0d0h,030h,020h,030h	; a650

; ----------------------------------------------------------------------
; DATOS partitura_A654: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (41 bytes)
;   0xa654..0xa67d  (41 bytes)
DATA_partitura_A654:
	defb 020h,000h,0d1h,080h,0d0h,000h,0d1h,080h,0fbh,003h,0d0h,050h,030h,050h,030h,020h	; a654   ..........P0P0
	defb 0d1h,0a0h,0d0h,020h,0d1h,0a0h,0f5h,0d0h,050h,030h,050h,030h,0d0h,020h,0d1h,0b0h	; a664  ... ....P0P0. ..
	defb 0d0h,020h,0d1h,0b0h,0fbh,002h,0eah,007h,0ebh	; a674  . .......

; ----------------------------------------------------------------------
; DATOS partitura_A67D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (16 bytes)
;   0xa67d..0xa68d  (16 bytes)
DATA_partitura_A67D:
	defb 00ah,03bh,003h,0d6h,001h,001h,0f5h,0d0h,030h,020h,030h,020h,000h,0d1h,0b0h,0d0h	; a67d  ........0 0 ....

; ----------------------------------------------------------------------
; DATOS partitura_A68D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (52 bytes)
;   0xa68d..0xa6c1  (52 bytes)
DATA_partitura_A68D:
	defb 000h,0d1h,0b0h,0fbh,003h,0f5h,0d0h,050h,030h,050h,030h,020h,0d1h,0b0h,0d0h,020h	; a68d  .......P0P0 ...
	defb 0d1h,0b0h,0fbh,003h,0f5h,0d0h,030h,020h,030h,020h,000h,0d1h,080h,0d0h,000h,0d1h	; a69d  ......0 0 ......
	defb 080h,0fbh,003h,0d0h,050h,030h,050h,030h,020h,0d1h,0a0h,0d0h,020h,0d1h,0a0h,0d0h	; a6ad  ....P0P0 ... ...
	defb 050h,030h,050h,030h	; a6bd

; ----------------------------------------------------------------------
; DATOS partitura_A6C1: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xa6c1..0xa6d2  (17 bytes)
DATA_partitura_A6C1:
	defb 0d0h,020h,0d1h,0b0h,0d0h,020h,0d1h,0b0h,0d0h,050h,030h,050h,030h,050h,070h,090h	; a6c1  . ... ...P0P0Pp.
	defb 0b0h	; a6d1

; ----------------------------------------------------------------------
; DATOS partitura_A6D2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (38 bytes)
;   0xa6d2..0xa6f8  (38 bytes)
DATA_partitura_A6D2:
	defb 0eah,009h,0ebh,009h,03bh,003h,0f0h,00fh,044h,0d6h,010h,001h,0d1h,001h,001h,001h	; a6d2  ........D.......
	defb 033h,031h,0eah,003h,030h,0eah,002h,030h,0eeh,081h,0c0h,0eah,006h,0edh,015h,0ebh	; a6e2  31..0..0........
	defb 087h,017h,071h,0d2h,0c1h,071h	; a6f2

; ----------------------------------------------------------------------
; DATOS partitura_A6F8: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xa6f8..0xa6ff  (7 bytes)
DATA_partitura_A6F8:
	defb 051h,0b1h,070h,0efh,0eah,009h,0ebh	; a6f8

; ----------------------------------------------------------------------
; DATOS partitura_A6FF: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (24 bytes)
;   0xa6ff..0xa717  (24 bytes)
DATA_partitura_A6FF:
	defb 009h,03bh,003h,0d1h,001h,001h,001h,063h,061h,0eah,003h,060h,0eah,002h,060h,0c2h	; a6ff  .......ca..`..`.
	defb 0eeh,081h,0edh,015h,0ebh,087h,017h,071h	; a70f  .......q

; ----------------------------------------------------------------------
; DATOS partitura_A717: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (34 bytes)
;   0xa717..0xa739  (34 bytes)
DATA_partitura_A717:
	defb 0eah,006h,0d2h,091h,061h,0d1h,021h,0d2h,090h,0efh,0eah,009h,0ebh,009h,03bh,003h	; a717  ....a.!.........
	defb 0f0h,00fh,044h,0d6h,010h,001h,0d1h,001h,001h,001h,033h,031h,0eah,003h,030h,0eah	; a727  ..D.......31..0.
	defb 002h,030h	; a737

; ----------------------------------------------------------------------
; DATOS partitura_A739: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (15 bytes)
;   0xa739..0xa748  (15 bytes)
DATA_partitura_A739:
	defb 0eeh,081h,0c0h,0eah,005h,0edh,014h,0ebh,087h,017h,071h,0d2h,0c1h,071h,0e9h	; a739  ..........q..q.

; ----------------------------------------------------------------------
; DATOS partitura_A748: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (50 bytes)
;   0xa748..0xa77a  (50 bytes)
DATA_partitura_A748:
	defb 001h,0d2h,056h,0b5h,0d1h,026h,0e9h,005h,030h,0efh,0eah,009h,0ebh,009h,03bh,003h	; a748  ..V..&..0.......
	defb 0d1h,001h,001h,001h,073h,071h,0eeh,081h,0c2h,0eah,005h,0edh,014h,0ebh,087h,017h	; a758  ....sq..........
	defb 071h,0d2h,0e9h,001h,076h,0b5h,0d1h,036h,0e9h,005h,052h,0d2h,0b0h,0d1h,070h,0fdh	; a768  q...v..6..R...p.
	defb 07ah,0a5h	; a778

; ----------------------------------------------------------------------
; DATOS partitura_A77A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (31 bytes)
;   0xa77a..0xa799  (31 bytes)
DATA_partitura_A77A:
	defb 0feh,004h,0e9h,00ah,0d0h,0f5h,070h,0a0h,0a0h,0a0h,0a0h,0a0h,070h,0a0h,070h,0a0h	; a77a  ......p.....p.p.
	defb 070h,0a0h,0fbh,003h,070h,0a0h,0a0h,0a0h,0a0h,0a0h,070h,0a0h,070h,0e9h,001h	; a78a  p...p.....p.p..

; ----------------------------------------------------------------------
; DATOS partitura_A799: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xa799..0xa79b  (2 bytes)
DATA_partitura_A799:
	defb 0d1h,061h	; a799

; ----------------------------------------------------------------------
; DATOS partitura_A79B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (134 bytes)
;   0xa79b..0xa821  (134 bytes)
DATA_partitura_A79B:
	defb 062h,064h,074h,074h,084h,074h,0e9h,00ah,0d0h,0f5h,070h,0a0h,0a0h,0a0h,0a0h,0a0h	; a79b  bdtt.t....p.....
	defb 070h,0a0h,070h,0a0h,070h,0a0h,0fbh,003h,070h,0a0h,0a0h,0a0h,0a0h,0a0h,0e9h,001h	; a7ab  p.p.p...p.......
	defb 0d1h,094h,084h,074h,064h,094h,084h,074h,084h,062h,063h,072h,072h,083h,092h,0e9h	; a7bb  ...td..t.bcrr...
	defb 001h,0f5h,0d1h,081h,097h,079h,079h,099h,079h,079h,081h,097h,0d0h,0a9h,0a9h,079h	; a7cb  .....yy.yy.....y
	defb 0a9h,0a9h,0fbh,008h,0e9h,001h,0f5h,0d1h,081h,097h,079h,079h,099h,079h,079h,081h	; a7db  ..........yy.yy.
	defb 097h,0d0h,0a9h,0a9h,079h,0a9h,0a9h,0fbh,003h,0d1h,099h,099h,099h,099h,099h,099h	; a7eb  ....y...........
	defb 099h,099h,099h,0e9h,00ah,092h,0e9h,001h,0f5h,0d1h,081h,097h,079h,079h,099h,079h	; a7fb  ............yy.y
	defb 079h,081h,097h,0d0h,0a9h,0a9h,079h,0a9h,0a9h,0fbh,003h,0d1h,0e9h,00ah,090h,090h	; a80b  y.....y.........
	defb 090h,090h,090h,090h,090h,090h	; a81b

; ----------------------------------------------------------------------
; DATOS partitura_A821: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (15 bytes)
;   0xa821..0xa830  (15 bytes)
DATA_partitura_A821:
	defb 090h,090h,0e9h,001h,074h,074h,0e9h,00ah,0d0h,0a0h,0f5h,0e9h,00ah,0d1h,072h	; a821  ....tt........r

; ----------------------------------------------------------------------
; DATOS partitura_A830: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (21 bytes)
;   0xa830..0xa845  (21 bytes)
DATA_partitura_A830:
	defb 060h,060h,060h,072h,060h,060h,060h,072h,060h,060h,060h,0e9h,001h,061h,067h,069h	; a830  ```r```r```..agi
	defb 079h,089h,099h,099h,0e9h	; a840

; ----------------------------------------------------------------------
; DATOS partitura_A845: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (22 bytes)
;   0xa845..0xa85b  (22 bytes)
DATA_partitura_A845:
	defb 00ah,072h,060h,060h,060h,072h,060h,060h,060h,072h,060h,060h,061h,0d0h,071h,070h	; a845  .r```r```r``a.qp
	defb 0a1h,0d1h,092h,080h,080h,080h	; a855

; ----------------------------------------------------------------------
; DATOS partitura_A85B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (21 bytes)
;   0xa85b..0xa870  (21 bytes)
DATA_partitura_A85B:
	defb 092h,080h,080h,080h,092h,080h,080h,080h,0e9h,001h,071h,087h,069h,069h,079h,079h	; a85b  ..........q.iiyy
	defb 089h,0e9h,00ah,092h,080h	; a86b

; ----------------------------------------------------------------------
; DATOS partitura_A870: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (22 bytes)
;   0xa870..0xa886  (22 bytes)
DATA_partitura_A870:
	defb 080h,080h,092h,080h,080h,080h,092h,080h,080h,080h,0e9h,001h,064h,064h,074h,074h	; a870  ............ddtt
	defb 084h,084h,0e9h,00ah,090h,090h	; a880

; ----------------------------------------------------------------------
; DATOS partitura_A886: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (19 bytes)
;   0xa886..0xa899  (19 bytes)
DATA_partitura_A886:
	defb 090h,0f5h,0e9h,001h,0d1h,071h,087h,089h,089h,099h,089h,089h,071h,0d0h,077h,0a9h	; a886  .....q......q.w.
	defb 079h,0a9h,079h	; a896

; ----------------------------------------------------------------------
; DATOS partitura_A899: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xa899..0xa89c  (3 bytes)
DATA_partitura_A899:
	defb 0a9h,0fbh,007h	; a899

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa89c..0xa8b6  (26 bytes)
DATA_A89C:
	defb 0d1h,071h,087h,089h,089h,0d0h,0a9h,079h,0a9h,0d1h,061h,062h,064h,074h,074h,084h	; a89c  .q.....y..abdtt.
	defb 094h,094h,094h,094h,094h,094h,094h,0fdh,087h,0a8h	; a8ac  ..........

; ----------------------------------------------------------------------
; DATOS partitura_A8B6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xa8b6..0xa8b8  (2 bytes)
DATA_partitura_A8B6:
	defb 0feh,001h	; a8b6

; ----------------------------------------------------------------------
; DATOS partitura_A8B8: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (19 bytes)
;   0xa8b8..0xa8cb  (19 bytes)
DATA_partitura_A8B8:
	defb 0e9h,00ah,0eah,00bh,0ebh,00ah,01bh,021h,0dbh,002h,0d6h,010h,002h,0f5h,0d5h,090h	; a8b8  .......!........
	defb 090h,090h,090h	; a8c8

; ----------------------------------------------------------------------
; DATOS partitura_A8CB: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xa8cb..0xa8d6  (11 bytes)
DATA_partitura_A8CB:
	defb 090h,090h,091h,091h,091h,0fbh,002h,0f5h,070h,070h,070h	; a8cb  ........ppp

; ----------------------------------------------------------------------
; DATOS partitura_A8D6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xa8d6..0xa8d9  (3 bytes)
DATA_partitura_A8D6:
	defb 070h,070h,070h	; a8d6

; ----------------------------------------------------------------------
; DATOS partitura_A8D9: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (29 bytes)
;   0xa8d9..0xa8f6  (29 bytes)
DATA_partitura_A8D9:
	defb 071h,071h,071h,0fbh,002h,0d8h,0e9h,00ah,0eah,00bh,0ebh,00ah,01bh,021h,0dbh,002h	; a8d9  qqq..........!..
	defb 0d6h,010h,002h,0d5h,0f5h,090h,090h,090h,090h,090h,090h,091h,091h	; a8e9  .............

; ----------------------------------------------------------------------
; DATOS partitura_A8F6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (36 bytes)
;   0xa8f6..0xa91a  (36 bytes)
DATA_partitura_A8F6:
	defb 091h,0fbh,002h,070h,070h,070h,070h,070h,070h,071h,071h,071h,070h,070h,070h,070h	; a8f6  ...ppppppqqqpppp
	defb 070h,070h,072h,040h,060h,070h,0d8h,0e9h,00ah,0eah,00ah,0ebh,009h,01bh,031h,0dbh	; a906  ppr@`p........1.
	defb 002h,0d5h,0d6h,010h	; a916

; ----------------------------------------------------------------------
; DATOS partitura_A91A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (29 bytes)
;   0xa91a..0xa937  (29 bytes)
DATA_partitura_A91A:
	defb 002h,0f5h,092h,090h,090h,090h,092h,090h,090h,090h,092h,090h,090h,090h,0b1h,091h	; a91a  ................
	defb 071h,092h,090h,090h,090h,092h,090h,090h,090h,072h,070h,070h,070h	; a92a  q........rppp

; ----------------------------------------------------------------------
; DATOS partitura_A937: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xa937..0xa942  (11 bytes)
DATA_partitura_A937:
	defb 072h,060h,080h,090h,0b2h,0b0h,0b0h,0b0h,0b2h,0b0h,0b0h	; a937  r`.........

; ----------------------------------------------------------------------
; DATOS partitura_A942: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (16 bytes)
;   0xa942..0xa952  (16 bytes)
DATA_partitura_A942:
	defb 0b0h,0b2h,0b0h,0b0h,0b0h,0d4h,011h,0d5h,0b1h,091h,0b2h,0b0h,0b0h,0b0h,0b2h,0b0h	; a942  ................

; ----------------------------------------------------------------------
; DATOS partitura_A952: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (37 bytes)
;   0xa952..0xa977  (37 bytes)
DATA_partitura_A952:
	defb 0b0h,0b0h,0b2h,0b0h,0b0h,0b0h,020h,040h,060h,080h,0b0h,0d4h,010h,0e9h,00ah,0eah	; a952  ...... @`.......
	defb 00ah,0ebh,009h,01bh,031h,0dbh,002h,0d6h,010h,002h,0d5h,092h,090h,090h,090h,092h	; a962  ....1...........
	defb 090h,090h,090h,092h,090h	; a972

; ----------------------------------------------------------------------
; DATOS partitura_A977: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa977..0xa978  (1 bytes)
DATA_partitura_A977:
	defb 090h	; a977

; ----------------------------------------------------------------------
; DATOS partitura_A978: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (37 bytes)
;   0xa978..0xa99d  (37 bytes)
DATA_partitura_A978:
	defb 090h,090h,040h,060h,070h,090h,070h,092h,090h,090h,090h,092h,090h,090h,090h,092h	; a978  ..@`p.p.........
	defb 090h,090h,090h,090h,020h,040h,060h,070h,090h,0b2h,0b0h,0b0h,0b0h,0b2h,0b0h,0b0h	; a988  .... @`p........
	defb 0b0h,0b2h,0b0h,0b0h,0b0h	; a998

; ----------------------------------------------------------------------
; DATOS partitura_A99D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (79 bytes)
;   0xa99d..0xa9ec  (79 bytes)
DATA_partitura_A99D:
	defb 0b0h,060h,080h,090h,0b0h,090h,0b2h,0b0h,0b0h,0b0h,0b2h,0b0h,0b0h,0b0h,0b2h,0b0h	; a99d  .`..............
	defb 0b0h,0b0h,0b0h,040h,060h,0b2h,0e9h,00ah,0eah,00ah,0d8h,0edh,054h,0ebh,087h,03bh	; a9ad  ...@`.......T...
	defb 0d1h,0dbh,004h,0f0h,002h,072h,0d5h,09bh,0ech,0eah,004h,09bh,0edh,054h,0ebh,087h	; a9bd  .....r.......T..
	defb 01bh,0d1h,0dbh,004h,0bbh,0ech,0eah,004h,0b5h,0eah,00bh,0ebh,009h,01bh,021h,0dbh	; a9cd  ..............!.
	defb 002h,0d4h,060h,040h,020h,0d5h,0b0h,090h,060h,092h,090h,090h,090h,092h,090h	; a9dd  ..`@ ...`......

; ----------------------------------------------------------------------
; DATOS partitura_A9EC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa9ec..0xa9ed  (1 bytes)
DATA_partitura_A9EC:
	defb 090h	; a9ec

; ----------------------------------------------------------------------
; DATOS partitura_A9ED: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (10 bytes)
;   0xa9ed..0xa9f7  (10 bytes)
DATA_partitura_A9ED:
	defb 090h,092h,090h,090h,090h,092h,090h,090h,090h,0b2h	; a9ed  ..........

; ----------------------------------------------------------------------
; DATOS partitura_A9F7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xa9f7..0xa9fe  (7 bytes)
DATA_partitura_A9F7:
	defb 0b0h,0b0h,0b0h,0b2h,0b0h,0b0h,0b0h	; a9f7

; ----------------------------------------------------------------------
; DATOS partitura_A9FE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (37 bytes)
;   0xa9fe..0xaa23  (37 bytes)
DATA_partitura_A9FE:
	defb 0b2h,0b0h,0b0h,0b0h,0b2h,060h,0b0h,0d3h,020h,0e9h,00ah,0eah,00ch,0ebh,00ah,03bh	; a9fe  .....`.. .......
	defb 011h,0dbh,005h,0f0h,002h,072h,0d6h,010h,001h,0f5h,0d3h,0b2h,0b0h,0b0h,0b0h,0b2h	; aa0e  .....r..........
	defb 0b0h,0b0h,0b0h,0fbh,008h	; aa1e

; ----------------------------------------------------------------------
; DATOS sin identificar  0xaa23..0xaa42  (31 bytes)
DATA_AA23:
	defb 0e9h,00ah,0eah,00ch,0ebh,00ah,03bh,011h,0dbh,005h,0f0h,002h,072h,0d6h,010h,001h	; aa23  ............r...
	defb 0f5h,0d2h,012h,010h,010h,010h,012h,010h,010h,010h,0fbh,008h,0fdh,007h,0aah	; aa33  ...............

; ----------------------------------------------------------------------
; DATOS partitura_AA42: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (79 bytes)
;   0xaa42..0xaa91  (79 bytes)
DATA_partitura_AA42:
	defb 0feh,001h,0e9h,00ah,0eah,00bh,0ebh,00ah,01bh,021h,0dbh,002h,0d6h,010h,002h,0f5h	; aa42  .........!......
	defb 0d4h,090h,090h,090h,090h,090h,090h,091h,091h,091h,0fbh,002h,0f5h,070h,070h,070h	; aa52  .............ppp
	defb 070h,070h,070h,071h,071h,071h,0fbh,002h,0d8h,0e9h,00ah,0eah,00bh,0ebh,00ah,01bh	; aa62  pppqqq..........
	defb 021h,0dbh,002h,0d4h,0d6h,010h,002h,0f5h,090h,090h,090h,090h,090h,090h,091h,091h	; aa72  !...............
	defb 091h,0fbh,002h,070h,070h,070h,070h,070h,070h,071h,071h,071h,070h,070h,070h	; aa82  ...ppppppqqqppp

; ----------------------------------------------------------------------
; DATOS partitura_AA91: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (75 bytes)
;   0xaa91..0xaadc  (75 bytes)
DATA_partitura_AA91:
	defb 070h,070h,070h,072h,040h,060h,070h,0d8h,0e9h,00ah,0eah,00ah,0ebh,009h,01bh,031h	; aa91  pppr@`p........1
	defb 0dbh,002h,0d6h,010h,002h,0d4h,0f5h,092h,090h,090h,090h,092h,090h,090h,090h,092h	; aaa1  ................
	defb 090h,090h,090h,0b1h,091h,071h,092h,090h,090h,090h,092h,090h,090h,090h,072h,070h	; aab1  .....q........rp
	defb 070h,070h,072h,060h,080h,090h,0b2h,0b0h,0b0h,0b0h,0b2h,0b0h,0b0h,0b0h,0b2h,0b0h	; aac1  ppr`............
	defb 0b0h,0b0h,0d3h,011h,0d4h,0b1h,091h,0b2h,0b0h,0b0h,0b0h	; aad1  ...........

; ----------------------------------------------------------------------
; DATOS partitura_AADC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xaadc..0xaae4  (8 bytes)
DATA_partitura_AADC:
	defb 0b2h,0b0h,0b0h,0b0h,0b2h,0b0h,0b0h,0b0h	; aadc  ........

; ----------------------------------------------------------------------
; DATOS partitura_AAE4: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xaae4..0xaaec  (8 bytes)
DATA_partitura_AAE4:
	defb 020h,040h,060h,080h,0b0h,0d3h,010h,0e9h	; aae4   @`.....

; ----------------------------------------------------------------------
; DATOS partitura_AAEC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (75 bytes)
;   0xaaec..0xab37  (75 bytes)
DATA_partitura_AAEC:
	defb 00ah,0eah,00bh,0ebh,009h,01bh,031h,0dbh,002h,0d6h,010h,002h,0d4h,092h,090h,090h	; aaec  ......1.........
	defb 090h,092h,090h,090h,090h,092h,090h,090h,090h,090h,040h,060h,070h,090h,070h,092h	; aafc  ..........@`p.p.
	defb 090h,090h,090h,092h,090h,090h,090h,092h,090h,090h,090h,090h,020h,040h,060h,070h	; ab0c  ............ @`p
	defb 090h,0b2h,0b0h,0b0h,0b0h,0b2h,0b0h,0b0h,0b0h,0b2h,0b0h,0b0h,0b0h,0b0h,060h,080h	; ab1c  ..............`.
	defb 090h,0b0h,090h,0b2h,0b0h,0b0h,0b0h,0b2h,0b0h,0b0h,0b0h	; ab2c  ...........

; ----------------------------------------------------------------------
; DATOS partitura_AB37: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xab37..0xab3b  (4 bytes)
DATA_partitura_AB37:
	defb 0b2h,0b0h,0b0h,0b0h	; ab37

; ----------------------------------------------------------------------
; DATOS partitura_AB3B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xab3b..0xab3c  (1 bytes)
DATA_partitura_AB3B:
	defb 0b0h	; ab3b

; ----------------------------------------------------------------------
; DATOS partitura_AB3C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xab3c..0xab3f  (3 bytes)
DATA_partitura_AB3C:
	defb 040h,060h,0b2h	; ab3c

; ----------------------------------------------------------------------
; DATOS partitura_AB3F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xab3f..0xab43  (4 bytes)
DATA_partitura_AB3F:
	defb 0e9h,00ah,0eah,00ah	; ab3f

; ----------------------------------------------------------------------
; DATOS partitura_AB43: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xab43..0xab47  (4 bytes)
DATA_partitura_AB43:
	defb 0d8h,0edh,054h,0ebh	; ab43

; ----------------------------------------------------------------------
; DATOS partitura_AB47: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xab47..0xab4b  (4 bytes)
DATA_partitura_AB47:
	defb 087h,03bh,0d1h,0dbh	; ab47

; ----------------------------------------------------------------------
; DATOS partitura_AB4B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xab4b..0xab4f  (4 bytes)
DATA_partitura_AB4B:
	defb 004h,0f0h,002h,072h	; ab4b

; ----------------------------------------------------------------------
; DATOS partitura_AB4F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (33 bytes)
;   0xab4f..0xab70  (33 bytes)
DATA_partitura_AB4F:
	defb 0d4h,09bh,0ech,0eah,004h,09bh,0edh,054h,0ebh,087h,01bh,0d1h,0dbh,004h,0bbh,0ech	; ab4f  .......T........
	defb 0eah,004h,0b5h,0eah,00bh,0ebh,009h,01bh,021h,0dbh,002h,0d3h,060h,040h,020h,0d4h	; ab5f  ........!...`@ .
	defb 0b0h	; ab6f

; ----------------------------------------------------------------------
; DATOS partitura_AB70: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (5 bytes)
;   0xab70..0xab75  (5 bytes)
DATA_partitura_AB70:
	defb 090h,060h,092h,090h,090h	; ab70

; ----------------------------------------------------------------------
; DATOS partitura_AB75: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xab75..0xab7c  (7 bytes)
DATA_partitura_AB75:
	defb 090h,092h,090h,090h,090h,092h,090h	; ab75

; ----------------------------------------------------------------------
; DATOS partitura_AB7C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (59 bytes)
;   0xab7c..0xabb7  (59 bytes)
DATA_partitura_AB7C:
	defb 090h,090h,092h,090h,090h,090h,0b2h,0b0h,0b0h,0b0h,0b2h,0b0h,0b0h,0b0h,0b2h,0b0h	; ab7c  ................
	defb 0b0h,0b0h,0b2h,060h,0b0h,0d3h,020h,0e9h,00ah,0eah,00bh,0ebh,009h,01bh,061h,0dbh	; ab8c  ...`.. .......a.
	defb 002h,0d6h,010h,002h,0d4h,0b2h,0b0h,0b0h,0b0h,0b2h,0b0h,0b0h,0b0h,0d3h,012h,010h	; ab9c  ................
	defb 010h,010h,012h,010h,010h,010h,022h,020h,020h,020h,022h	; abac  ......"   "

; ----------------------------------------------------------------------
; DATOS partitura_ABB7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (29 bytes)
;   0xabb7..0xabd4  (29 bytes)
DATA_partitura_ABB7:
	defb 020h,020h,020h,042h,040h,040h,040h,060h,040h,020h,0d4h,060h,0b0h,0d3h,020h,0d4h	; abb7     B@@@`@ .`.. .
	defb 0b2h,0b0h,0b0h,0b0h,0b2h,0b0h,0b0h,0b0h,0d3h,012h,010h,010h,010h	; abc7  .............

; ----------------------------------------------------------------------
; DATOS sin identificar  0xabd4..0xac42  (110 bytes)
DATA_ABD4:
	defb 012h,010h,010h,010h,022h,020h,020h,020h,022h,020h,020h,020h,042h,040h,040h,040h	; abd4  ...."   "   B@@@
	defb 060h,040h,020h,0d4h,060h,0d3h,010h,040h,0e9h,00ah,0eah,00bh,0ebh,00ah,01bh,061h	; abe4  `@ .`..@.......a
	defb 0dbh,002h,0d3h,012h,010h,010h,010h,012h,010h,010h,010h,032h,030h,030h,030h,032h	; abf4  ...........20002
	defb 030h,030h,030h,042h,040h,040h,040h,042h,040h,040h,040h,062h,060h,060h,060h,080h	; ac04  000B@@@B@@@b```.
	defb 060h,040h,0d4h,080h,0d3h,010h,040h,012h,010h,010h,010h,012h,010h,010h,010h,032h	; ac14  `@....@........2
	defb 030h,030h,030h,032h,030h,030h,030h,042h,040h,040h,040h,042h,040h,040h,040h,062h	; ac24  0002000B@@@B@@@b
	defb 060h,060h,060h,080h,060h,040h,0d4h,060h,0b0h,0d3h,020h,0fdh,093h,0abh	; ac34  ```.`@.`.. ...

; ----------------------------------------------------------------------
; DATOS partitura_AC42: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xac42..0xac46  (4 bytes)
DATA_partitura_AC42:
	defb 0e9h,00ah,0f8h,046h	; ac42

; ----------------------------------------------------------------------
; DATOS partitura_AC46: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xac46..0xac4e  (8 bytes)
DATA_partitura_AC46:
	defb 0eah,00fh,0ebh,00ah,03bh,031h,0dbh,002h	; ac46  .....1..

; ----------------------------------------------------------------------
; DATOS partitura_AC4E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (39 bytes)
;   0xac4e..0xac75  (39 bytes)
DATA_partitura_AC4E:
	defb 0d6h,010h,002h,0f5h,0d5h,090h,090h,090h,090h,090h,090h,091h,091h,091h,0fbh,002h	; ac4e  ................
	defb 0f5h,070h,070h,070h,070h,070h,070h,071h,071h,071h,0fbh,002h,0e9h,00ah,0f8h,046h	; ac5e  .ppppppqqq.....F
	defb 0eah,00fh,0ebh,00ah,03bh,031h,0dbh	; ac6e

; ----------------------------------------------------------------------
; DATOS partitura_AC75: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (9 bytes)
;   0xac75..0xac7e  (9 bytes)
DATA_partitura_AC75:
	defb 002h,0d6h,010h,002h,0d5h,0f5h,090h,090h,090h	; ac75  .........

; ----------------------------------------------------------------------
; DATOS partitura_AC7E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (36 bytes)
;   0xac7e..0xaca2  (36 bytes)
DATA_partitura_AC7E:
	defb 090h,090h,090h,091h,091h,091h,0fbh,002h,070h,070h,070h,070h,070h,070h,071h,071h	; ac7e  ........ppppppqq
	defb 071h,070h,070h,070h,070h,070h,070h,072h,040h,060h,070h,0d8h,0e9h,00ah,0f8h,04bh	; ac8e  qppppppr@`p....K
	defb 0eah,00fh,0ebh,019h	; ac9e

; ----------------------------------------------------------------------
; DATOS partitura_ACA2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (12 bytes)
;   0xaca2..0xacae  (12 bytes)
DATA_partitura_ACA2:
	defb 03bh,041h,0dbh,002h,0d6h,010h,002h,0d5h,0f5h,092h,090h,090h	; aca2  .A..........

; ----------------------------------------------------------------------
; DATOS partitura_ACAE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (65 bytes)
;   0xacae..0xacef  (65 bytes)
DATA_partitura_ACAE:
	defb 090h,092h,090h,090h,090h,092h,090h,090h,090h,0b1h,091h,071h,092h,090h,090h,090h	; acae  ...........q....
	defb 092h,090h,090h,090h,072h,070h,070h,070h,072h,060h,080h,090h,0b2h,0b0h,0b0h,0b0h	; acbe  ....rpppr`......
	defb 0b2h,0b0h,0b0h,0b0h,0b2h,0b0h,0b0h,0b0h,0d4h,011h,0d5h,0b1h,091h,0b2h,0b0h,0b0h	; acce  ................
	defb 0b0h,0b2h,0b0h,0b0h,0b0h,0b2h,050h,0b0h,0b0h,020h,040h,060h,080h,0b0h,0d4h,010h	; acde  ......P.. @`....
	defb 0d8h	; acee

; ----------------------------------------------------------------------
; DATOS partitura_ACEF: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (61 bytes)
;   0xacef..0xad2c  (61 bytes)
DATA_partitura_ACEF:
	defb 0e9h,00ah,0f8h,04bh,0eah,00fh,0ebh,054h,03bh,041h,0dbh,002h,0d6h,010h,002h,0d5h	; acef  ...K...T.A......
	defb 092h,090h,090h,090h,092h,090h,090h,090h,092h,090h,090h,090h,090h,040h,060h,070h	; acff  .............@`p
	defb 090h,070h,092h,090h,090h,090h,092h,090h,090h,090h,092h,090h,090h,090h,090h,020h	; ad0f  .p.............
	defb 040h,060h,070h,090h,0b2h,0b0h,0b0h,0b0h,0b2h,0b0h,0b0h,0b0h,0b2h	; ad1f  @`p..........

; ----------------------------------------------------------------------
; DATOS partitura_AD2C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xad2c..0xad33  (7 bytes)
DATA_partitura_AD2C:
	defb 0b0h,0b0h,0b0h,0b0h,060h,080h,090h	; ad2c

; ----------------------------------------------------------------------
; DATOS partitura_AD33: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xad33..0xad37  (4 bytes)
DATA_partitura_AD33:
	defb 0b0h,090h,0b2h,0b0h	; ad33

; ----------------------------------------------------------------------
; DATOS partitura_AD37: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (9 bytes)
;   0xad37..0xad40  (9 bytes)
DATA_partitura_AD37:
	defb 0b0h,0b0h,0b2h,0b0h,0b0h,0b0h,0b2h,0b0h,0b0h	; ad37  .........

; ----------------------------------------------------------------------
; DATOS partitura_AD40: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (10 bytes)
;   0xad40..0xad4a  (10 bytes)
DATA_partitura_AD40:
	defb 0b0h,0b0h,040h,060h,0b2h,0e9h,00ah,0f8h,050h,0eah	; ad40  ..@`....P.

; ----------------------------------------------------------------------
; DATOS partitura_AD4A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (29 bytes)
;   0xad4a..0xad67  (29 bytes)
DATA_partitura_AD4A:
	defb 00fh,0d8h,0edh,054h,0ebh,087h,03bh,091h,0dbh,004h,0f0h,002h,072h,0d5h,09bh,0ech	; ad4a  ...T........r...
	defb 0eah,004h,09bh,0eah,00ch,0edh,054h,0ebh,087h,03bh,091h,0dbh,004h	; ad5a  ......T......

; ----------------------------------------------------------------------
; DATOS partitura_AD67: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (34 bytes)
;   0xad67..0xad89  (34 bytes)
DATA_partitura_AD67:
	defb 0bbh,0ech,0eah,004h,0b5h,0f8h,023h,0eah,00fh,0ebh,009h,03bh,041h,0dbh,002h,0d4h	; ad67  ......#.....A...
	defb 060h,040h,020h,0d5h,0b0h,090h,060h,092h,090h,090h,090h,092h,090h,090h,090h,092h	; ad77  `@ ...`.........
	defb 090h,090h	; ad87

; ----------------------------------------------------------------------
; DATOS partitura_AD89: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xad89..0xad8b  (2 bytes)
DATA_partitura_AD89:
	defb 090h,092h	; ad89

; ----------------------------------------------------------------------
; DATOS partitura_AD8B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (28 bytes)
;   0xad8b..0xada7  (28 bytes)
DATA_partitura_AD8B:
	defb 090h,090h,090h,0b2h,0b0h,0b0h,0b0h,0b2h,0b0h,0b0h,0b0h,0b2h,0b0h,0b0h,0b0h,0b2h	; ad8b  ................
	defb 060h,0b0h,0d4h,020h,0e9h,00ah,0f8h,04bh,0eah,00fh,0ebh,00ah	; ad9b  `.. ...K....

; ----------------------------------------------------------------------
; DATOS partitura_ADA7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (23 bytes)
;   0xada7..0xadbe  (23 bytes)
DATA_partitura_ADA7:
	defb 02bh,051h,0d6h,010h,002h,0dbh,002h,0d5h,0b2h,0b0h,0b0h,0b0h,0b2h,0b0h,0b0h,0b0h	; ada7  +Q..............
	defb 0d4h,012h,010h,010h,010h,012h,010h	; adb7

; ----------------------------------------------------------------------
; DATOS partitura_ADBE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (9 bytes)
;   0xadbe..0xadc7  (9 bytes)
DATA_partitura_ADBE:
	defb 010h,010h,022h,020h,020h,020h,022h,020h,020h	; adbe  .."   "

; ----------------------------------------------------------------------
; DATOS partitura_ADC7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (22 bytes)
;   0xadc7..0xaddd  (22 bytes)
DATA_partitura_ADC7:
	defb 020h,042h,040h,040h,040h,060h,040h,020h,0d5h,060h,0b0h,0d4h,020h,0d5h,0b2h,0b0h	; adc7   B@@@`@ .`.. ...
	defb 0b0h,0b0h,0b2h,0b0h,0b0h,0b0h	; add7

; ----------------------------------------------------------------------
; DATOS partitura_ADDD: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xaddd..0xadde  (1 bytes)
DATA_partitura_ADDD:
	defb 0d4h	; addd

; ----------------------------------------------------------------------
; DATOS partitura_ADDE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xadde..0xade2  (4 bytes)
DATA_partitura_ADDE:
	defb 012h,010h,010h,010h	; adde

; ----------------------------------------------------------------------
; DATOS sin identificar  0xade2..0xae53  (113 bytes)
DATA_ADE2:
	defb 012h,010h,010h,010h,022h,020h,020h,020h,022h,020h,020h,020h,042h,040h,040h,040h	; ade2  ...."   "   B@@@
	defb 060h,040h,020h,0d5h,060h,0d4h,010h,040h,0e9h,00ah,0f8h,04bh,0eah,00fh,0ebh,00ah	; adf2  `@ .`..@...K....
	defb 02bh,051h,0dbh,002h,0d4h,012h,010h,010h,010h,012h,010h,010h,010h,032h,030h,030h	; ae02  +Q...........200
	defb 030h,032h,030h,030h,030h,042h,040h,040h,040h,042h,040h,040h,040h,062h,060h,060h	; ae12  02000B@@@B@@@b``
	defb 060h,080h,060h,040h,0d5h,080h,0d4h,010h,040h,012h,010h,010h,010h,012h,010h,010h	; ae22  `.`@....@.......
	defb 010h,032h,030h,030h,030h,032h,030h,030h,030h,042h,040h,040h,040h,042h,040h,040h	; ae32  .20002000B@@@B@@
	defb 040h,062h,060h,060h,060h,080h,060h,040h,0d5h,060h,0b0h,0d4h,020h,0d8h,0fdh,09fh	; ae42  @b```.`@.`.. ...
	defb 0adh	; ae52

; ----------------------------------------------------------------------
; DATOS partitura_AE53: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xae53..0xae54  (1 bytes)
DATA_partitura_AE53:
	defb 0feh	; ae53

; ----------------------------------------------------------------------
; DATOS partitura_AE54: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (55 bytes)
;   0xae54..0xae8b  (55 bytes)
DATA_partitura_AE54:
	defb 001h,0e9h,00ah,0f8h,00dh,0eah,009h,0ebh,007h,03bh,0b1h,0dbh,001h,0f0h,002h,072h	; ae54  ...............r
	defb 0d6h,010h,001h,0d3h,095h,0eah,007h,0d2h,040h,0d3h,090h,0d2h,040h,0d3h,090h,0d2h	; ae64  ........@...@...
	defb 040h,0d3h,090h,0eah,009h,0d3h,095h,0eah,007h,0d2h,090h,0d3h,090h,0d2h,090h,0d3h	; ae74  @...............
	defb 090h,0d2h,090h,0d3h,090h,0eah,009h	; ae84

; ----------------------------------------------------------------------
; DATOS partitura_AE8B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (40 bytes)
;   0xae8b..0xaeb3  (40 bytes)
DATA_partitura_AE8B:
	defb 0d3h,075h,0eah,007h,0d2h,020h,0d3h,070h,0d2h,020h,0d3h,070h,0d2h,020h,0d3h,070h	; ae8b  .u... .p. .p. .p
	defb 0eah,009h,0d3h,075h,0eah,007h,0d2h,070h,0d3h,070h,0d2h,070h,0d3h,070h,0d2h,070h	; ae9b  ...u...p.p.p.p.p
	defb 0d3h,070h,0e9h,00ah,0f8h,00dh,0eah,009h	; aeab  .p......

; ----------------------------------------------------------------------
; DATOS partitura_AEB3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (14 bytes)
;   0xaeb3..0xaec1  (14 bytes)
DATA_partitura_AEB3:
	defb 0ebh,007h,03bh,0b1h,0dbh,002h,0f0h,002h,072h,0d6h,010h,001h,0d3h,095h	; aeb3  ........r.....

; ----------------------------------------------------------------------
; DATOS partitura_AEC1: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xaec1..0xaec2  (1 bytes)
DATA_partitura_AEC1:
	defb 0eah	; aec1

; ----------------------------------------------------------------------
; DATOS partitura_AEC2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (43 bytes)
;   0xaec2..0xaeed  (43 bytes)
DATA_partitura_AEC2:
	defb 007h,0d2h,040h,0d3h,090h,0d2h,040h,0d3h,090h,0d2h,040h,0d3h,090h,0eah,009h,0d3h	; aec2  ..@...@...@.....
	defb 095h,0eah,007h,0d2h,090h,0d3h,090h,0d2h,090h,0d3h,090h,0d2h,090h,0d3h,090h,0eah	; aed2  ................
	defb 009h,0d3h,075h,0eah,007h,0d2h,020h,0d3h,070h,0d2h,020h	; aee2  ..u... .p.

; ----------------------------------------------------------------------
; DATOS partitura_AEED: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (65 bytes)
;   0xaeed..0xaf2e  (65 bytes)
DATA_partitura_AEED:
	defb 0d3h,070h,0d2h,020h,0d3h,070h,0eah,009h,0d3h,075h,0eah,007h,0d2h,070h,0d3h,070h	; aeed  .p. .p...u...p.p
	defb 0d2h,070h,0eah,008h,0d3h,040h,060h,070h,0e9h,00ah,0f8h,00dh,0eah,009h,0ebh,012h	; aefd  .p...@`p........
	defb 01bh,091h,0dbh,004h,0f0h,002h,072h,0d6h,010h,001h,0d4h,09bh,0d3h,005h,0d4h,0b1h	; af0d  ......r.........
	defb 091h,071h,09bh,078h,060h,080h,090h,0bbh,0d3h,025h,011h,0d4h,0b1h,091h,0bbh,0f0h	; af1d  .q.x`....%......
	defb 002h	; af2d

; ----------------------------------------------------------------------
; DATOS partitura_AF2E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (62 bytes)
;   0xaf2e..0xaf6c  (62 bytes)
DATA_partitura_AF2E:
	defb 074h,0d3h,0bbh,0e9h,00ah,0f6h,0f8h,002h,0eah,008h,0edh,028h,0ebh,087h,03bh,091h	; af2e  t..........(....
	defb 0dbh,004h,0f0h,002h,072h,0d3h,092h,0b1h,0d2h,006h,002h,021h,046h,0d3h,092h,0b1h	; af3e  ....r......!F...
	defb 0d2h,006h,002h,022h,040h,020h,000h,062h,0d3h,0b2h,0d2h,011h,026h,022h,041h,066h	; af4e  ..."@ .b....&"Af
	defb 0d3h,0b2h,0d2h,011h,026h,022h,042h,060h,040h,020h,062h,0e9h,00ah,0f8h	; af5e  ....&"B`@ b...

; ----------------------------------------------------------------------
; DATOS partitura_AF6C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xaf6c..0xaf72  (6 bytes)
DATA_partitura_AF6C:
	defb 054h,0eah,005h,0edh,051h,0ebh	; af6c

; ----------------------------------------------------------------------
; DATOS partitura_AF72: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xaf72..0xaf79  (7 bytes)
DATA_partitura_AF72:
	defb 087h,03bh,091h,0dbh,004h,0f0h,002h	; af72

; ----------------------------------------------------------------------
; DATOS partitura_AF79: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (15 bytes)
;   0xaf79..0xaf88  (15 bytes)
DATA_partitura_AF79:
	defb 043h,0d3h,00bh,04bh,02bh,06bh,0f8h,014h,0eah,006h,0edh,071h,0d1h,00bh,0edh	; af79  C..K+k.....q...

; ----------------------------------------------------------------------
; DATOS partitura_AF88: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (12 bytes)
;   0xaf88..0xaf94  (12 bytes)
DATA_partitura_AF88:
	defb 051h,0ebh,087h,03bh,091h,04bh,02bh,06bh,0e9h,00ah,0f8h,012h	; af88  Q....K+k....

; ----------------------------------------------------------------------
; DATOS partitura_AF94: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (23 bytes)
;   0xaf94..0xafab  (23 bytes)
DATA_partitura_AF94:
	defb 0eeh,001h,0eah,00fh,0ebh,00ah,03bh,011h,0dbh,004h,0f0h,002h,072h,0d6h,020h,001h	; af94  ............r. .
	defb 0f5h,0d2h,062h,060h,060h,060h,062h	; afa4

; ----------------------------------------------------------------------
; DATOS partitura_AFAB: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (5 bytes)
;   0xafab..0xafb0  (5 bytes)
DATA_partitura_AFAB:
	defb 060h,060h,060h,0fbh,008h	; afab

; ----------------------------------------------------------------------
; DATOS sin identificar  0xafb0..0xafd1  (33 bytes)
DATA_AFB0:
	defb 0e9h,00ah,0f8h,002h,0eah,00fh,0ebh,00ah,03bh,011h,0dbh,004h,0f0h,002h,072h,0d6h	; afb0  ..............r.
	defb 020h,001h,0f5h,0d2h,082h,080h,080h,080h,082h,080h,080h,080h,0fbh,008h,0fdh,090h	; afc0   ...............
	defb 0afh	; afd0

; ----------------------------------------------------------------------
; DATOS partitura_AFD1: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (29 bytes)
;   0xafd1..0xafee  (29 bytes)
DATA_partitura_AFD1:
	defb 0feh,001h,0e9h,00ah,0f8h,00dh,0eah,00ah,0ebh,007h,03bh,071h,0dbh,001h,0f0h,002h	; afd1  ...........q....
	defb 072h,0d6h,010h,001h,0d3h,045h,0eah,008h,090h,040h,090h,040h,090h	; afe1  r....E...@.@.

; ----------------------------------------------------------------------
; DATOS partitura_AFEE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (40 bytes)
;   0xafee..0xb016  (40 bytes)
DATA_partitura_AFEE:
	defb 040h,0eah,00ah,0d3h,045h,0eah,008h,0d2h,040h,0d3h,040h,0d2h,040h,0d3h,040h,0d2h	; afee  @...E...@.@.@.@.
	defb 040h,0d3h,040h,0eah,00ah,0d3h,025h,0eah,008h,0d3h,070h,020h,070h,020h,070h,020h	; affe  @.@...%...p p p
	defb 0eah,00ah,0d3h,025h,0eah,008h,0d2h,020h	; b00e  ...%...

; ----------------------------------------------------------------------
; DATOS partitura_B016: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (15 bytes)
;   0xb016..0xb025  (15 bytes)
DATA_partitura_B016:
	defb 0d3h,020h,0d2h,020h,0d3h,020h,0d2h,020h,0d3h,020h,0e9h,00ah,0f8h,00dh,0eah	; b016  . . . . . .....

; ----------------------------------------------------------------------
; DATOS partitura_B025: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (10 bytes)
;   0xb025..0xb02f  (10 bytes)
DATA_partitura_B025:
	defb 00ah,0ebh,007h,03bh,071h,0dbh,002h,0f0h,002h,072h	; b025  ....q....r

; ----------------------------------------------------------------------
; DATOS partitura_B02F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xb02f..0xb048  (25 bytes)
DATA_partitura_B02F:
	defb 0d6h,010h,001h,0d3h,045h,0eah,008h,090h,040h,090h,040h,090h,040h,0eah,00ah,0d3h	; b02f  ....E...@.@.@...
	defb 045h,0eah,008h,0d2h,040h,0d3h,040h,0d2h,040h	; b03f  E...@.@.@

; ----------------------------------------------------------------------
; DATOS partitura_B048: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (30 bytes)
;   0xb048..0xb066  (30 bytes)
DATA_partitura_B048:
	defb 0d3h,040h,0d2h,040h,0d3h,040h,0eah,00ah,0d3h,025h,0eah,008h,0d3h,070h,020h,070h	; b048  .@.@.@...%...p p
	defb 020h,070h,020h,0eah,00ah,0d3h,025h,0eah,008h,0d2h,020h,0d3h,020h,0d2h	; b058   p ...%... . .

; ----------------------------------------------------------------------
; DATOS partitura_B066: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (65 bytes)
;   0xb066..0xb0a7  (65 bytes)
DATA_partitura_B066:
	defb 020h,0eah,009h,0d4h,0b0h,0d3h,010h,020h,0e9h,00ah,0f4h,00dh,025h,025h,025h,0eah	; b066   ...... ....%%%.
	defb 008h,0ebh,012h,01bh,091h,0dbh,004h,0f0h,002h,072h,0d6h,010h,001h,0d3h,04bh,075h	; b076  .........r....Ku
	defb 061h,041h,021h,04bh,028h,010h,030h,040h,06bh,095h,081h,061h,041h,06bh,0f0h,002h	; b086  aA!K(.0@k..aAk..
	defb 074h,06bh,0e9h,00ah,0f8h,002h,0efh,0eeh,081h,0c1h,0eah,005h,0edh,014h,0ebh,087h	; b096  tk..............
	defb 01bh	; b0a6

; ----------------------------------------------------------------------
; DATOS partitura_B0A7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xb0a7..0xb0b8  (17 bytes)
DATA_partitura_B0A7:
	defb 091h,0dbh,002h,0f0h,002h,072h,0d3h,092h,0b1h,0d2h,006h,002h,021h,046h,0d3h,092h	; b0a7  .....r......!F..
	defb 0b1h	; b0b7

; ----------------------------------------------------------------------
; DATOS partitura_B0B8: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (16 bytes)
;   0xb0b8..0xb0c8  (16 bytes)
DATA_partitura_B0B8:
	defb 0d2h,006h,002h,022h,040h,020h,000h,062h,0d3h,0b2h,0d2h,011h,026h,022h,041h,066h	; b0b8  ..."@ .b....&"Af

; ----------------------------------------------------------------------
; DATOS partitura_B0C8: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (64 bytes)
;   0xb0c8..0xb108  (64 bytes)
DATA_partitura_B0C8:
	defb 0d3h,0b2h,0d2h,011h,026h,022h,042h,060h,040h,020h,0f8h,002h,0eah,004h,062h,0e9h	; b0c8  ....&"B`@ ....b.
	defb 00ah,0eeh,081h,0f8h,054h,0eah,003h,0edh,052h,0ebh,087h,01bh,091h,0dbh,003h,0f0h	; b0d8  ....T...R.......
	defb 002h,043h,0d3h,00bh,04bh,02bh,06bh,0eah,004h,0f8h,014h,0d1h,00bh,04bh,02bh,069h	; b0e8  .C..K+k......K+i
	defb 0e9h,00ah,0f8h,054h,0eah,006h,0ebh,00bh,02bh,011h,0dbh,004h,0f0h,000h,0d8h,0f5h	; b0f8  ...T....+.......

; ----------------------------------------------------------------------
; DATOS partitura_B108: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (14 bytes)
;   0xb108..0xb116  (14 bytes)
DATA_partitura_B108:
	defb 0d2h,090h,0d1h,090h,0d2h,090h,0d1h,040h,0d2h,090h,0d1h,040h,0fbh,010h	; b108  .......@...@..

; ----------------------------------------------------------------------
; DATOS sin identificar  0xb116..0xb137  (33 bytes)
DATA_B116:
	defb 0e9h,00ah,0f8h,054h,0eah,006h,0ebh,00bh,02bh,011h,0dbh,004h,0f0h,000h,0d8h,0f5h	; b116  ...T....+.......
	defb 0d2h,0b0h,0d1h,0b0h,0d2h,0b0h,0d1h,060h,0d2h,0b0h,0d1h,060h,0fbh,010h,0fdh,0f8h	; b126  .......`...`....
	defb 0b0h	; b136

; ----------------------------------------------------------------------
; DATOS partitura_B137: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (33 bytes)
;   0xb137..0xb158  (33 bytes)
DATA_partitura_B137:
	defb 0feh,001h,0e9h,00ah,0f8h,002h,0eah,00ch,0ebh,019h,03bh,041h,0dbh,002h,0f0h,002h	; b137  ...........A....
	defb 045h,0d6h,010h,001h,0d3h,090h,090h,090h,0d2h,020h,020h,020h,0ebh,009h,03bh,081h	; b147  E........   ....
	defb 041h	; b157

; ----------------------------------------------------------------------
; DATOS partitura_B158: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xb158..0xb159  (1 bytes)
DATA_partitura_B158:
	defb 073h	; b158

; ----------------------------------------------------------------------
; DATOS partitura_B159: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (12 bytes)
;   0xb159..0xb165  (12 bytes)
DATA_partitura_B159:
	defb 0ebh,019h,03bh,041h,090h,090h,090h,0d1h,020h,040h,070h,0dbh	; b159  ...A.... @p.

; ----------------------------------------------------------------------
; DATOS partitura_B165: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xb165..0xb177  (18 bytes)
DATA_partitura_B165:
	defb 004h,061h,041h,021h,0dbh,002h,0d3h,090h,090h,090h,0d2h,020h,020h,020h,0dbh,004h	; b165  .aA!.......   ..
	defb 041h,073h	; b175

; ----------------------------------------------------------------------
; DATOS partitura_B177: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xb177..0xb17b  (4 bytes)
DATA_partitura_B177:
	defb 0dbh,002h,090h,090h	; b177

; ----------------------------------------------------------------------
; DATOS partitura_B17B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xb17b..0xb181  (6 bytes)
DATA_partitura_B17B:
	defb 090h,0d1h,020h,040h,070h,0dbh	; b17b

; ----------------------------------------------------------------------
; DATOS partitura_B181: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (31 bytes)
;   0xb181..0xb1a0  (31 bytes)
DATA_partitura_B181:
	defb 004h,061h,041h,071h,0e9h,00ah,0f8h,002h,0eah,00ch,0ebh,019h,03bh,041h,0dbh,002h	; b181  .aAq.........A..
	defb 0f0h,002h,045h,0d6h,010h,001h,0d3h,090h,090h,090h,0d2h,020h,020h,020h,0ebh	; b191  ..E........   .

; ----------------------------------------------------------------------
; DATOS partitura_B1A0: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xb1a0..0xb1b2  (18 bytes)
DATA_partitura_B1A0:
	defb 009h,03bh,081h,041h,073h,0ebh,019h,03bh,041h,090h,090h,090h,0d1h,020h,040h,070h	; b1a0  ...As...A.... @p
	defb 0dbh,004h	; b1b0

; ----------------------------------------------------------------------
; DATOS partitura_B1B2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (35 bytes)
;   0xb1b2..0xb1d5  (35 bytes)
DATA_partitura_B1B2:
	defb 061h,041h,021h,0dbh,002h,0d3h,090h,090h,090h,0d2h,020h,020h,020h,0dbh,004h,041h	; b1b2  aA!.......   ..A
	defb 073h,0dbh,002h,090h,090h,090h,0d1h,020h,040h,070h,0dbh,004h,062h,0d2h,040h,060h	; b1c2  s...... @p..b.@`
	defb 070h,0e9h,00ah	; b1d2

; ----------------------------------------------------------------------
; DATOS partitura_B1D5: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (9 bytes)
;   0xb1d5..0xb1de  (9 bytes)
DATA_partitura_B1D5:
	defb 0f8h,002h,0eah,00ah,0edh,017h,0ebh,087h,017h	; b1d5  .........

; ----------------------------------------------------------------------
; DATOS partitura_B1DE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xb1de..0xb1f7  (25 bytes)
DATA_partitura_B1DE:
	defb 071h,0dbh,001h,0f0h,002h,053h,0d6h,004h,001h,0d3h,092h,0d2h,072h,060h,040h,020h	; b1de  q....S......r`@
	defb 042h,002h,042h,020h,0d3h,0b0h,0d2h,000h,0d3h	; b1ee  B.B .....

; ----------------------------------------------------------------------
; DATOS partitura_B1F7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (24 bytes)
;   0xb1f7..0xb20f  (24 bytes)
DATA_partitura_B1F7:
	defb 090h,0b0h,070h,092h,0d2h,072h,060h,040h,020h,042h,0eah,009h,0d1h,000h,0d2h,0b0h	; b1f7  ..p..r`@ B......
	defb 090h,0d1h,020h,000h,0d2h,0b0h,0eah,008h	; b207  .. .....

; ----------------------------------------------------------------------
; DATOS partitura_B20F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (12 bytes)
;   0xb20f..0xb21b  (12 bytes)
DATA_partitura_B20F:
	defb 0d1h,040h,020h,000h,0eah,00ah,0d3h,040h,060h,070h,0b2h,0d2h	; b20f  .@ ....@`p..

; ----------------------------------------------------------------------
; DATOS partitura_B21B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (24 bytes)
;   0xb21b..0xb233  (24 bytes)
DATA_partitura_B21B:
	defb 092h,080h,060h,040h,062h,022h,062h,040h,010h,020h,0d3h,0b0h,0d2h,010h,0d3h,090h	; b21b  ..`@b"b@. ......
	defb 0b2h,0d2h,092h,080h,060h,040h,062h,0eah	; b22b  ....`@b.

; ----------------------------------------------------------------------
; DATOS partitura_B233: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xb233..0xb23a  (7 bytes)
DATA_partitura_B233:
	defb 009h,0d1h,020h,010h,0d2h,0b0h,0d1h	; b233

; ----------------------------------------------------------------------
; DATOS partitura_B23A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (38 bytes)
;   0xb23a..0xb260  (38 bytes)
DATA_partitura_B23A:
	defb 040h,020h,010h,0eah,008h,060h,040h,020h,010h,0d2h,0b0h,0d1h,010h,0e9h,00ah,0f8h	; b23a  @ ...`@ ........
	defb 002h,0eah,008h,0edh,018h,0ebh,083h,017h,0b1h,0dbh,003h,0f0h,002h,042h,0d6h,006h	; b24a  .............B..
	defb 001h,0d1h,040h,020h,000h,021h	; b25a

; ----------------------------------------------------------------------
; DATOS partitura_B260: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (26 bytes)
;   0xb260..0xb27a  (26 bytes)
DATA_partitura_B260:
	defb 046h,040h,020h,000h,061h,076h,040h,020h,000h,021h,046h,040h,020h,000h,062h,070h	; b260  F@ .av@ .!F@ .bp
	defb 060h,040h,092h,060h,040h,020h,041h,066h,060h,040h	; b270  `@.`@ Af`@

; ----------------------------------------------------------------------
; DATOS partitura_B27A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (14 bytes)
;   0xb27a..0xb288  (14 bytes)
DATA_partitura_B27A:
	defb 020h,081h,096h,060h,040h,020h,041h,066h,060h,040h,020h,082h,090h,080h	; b27a   ..`@ Af`@ ...

; ----------------------------------------------------------------------
; DATOS partitura_B288: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (33 bytes)
;   0xb288..0xb2a9  (33 bytes)
DATA_partitura_B288:
	defb 060h,0b2h,0e9h,00ah,0f8h,054h,0eah,006h,0edh,015h,0ebh,088h,01bh,051h,0dbh,002h	; b288  `....T.......Q..
	defb 0f0h,002h,072h,0d8h,0d3h,090h,090h,090h,0d2h,020h,020h,020h,041h,073h,090h,0d1h	; b298  ..r......   As..
	defb 020h	; b2a8

; ----------------------------------------------------------------------
; DATOS partitura_B2A9: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (34 bytes)
;   0xb2a9..0xb2cb  (34 bytes)
DATA_partitura_B2A9:
	defb 040h,072h,0d2h,090h,0d1h,020h,040h,092h,0d3h,0b0h,0b0h,0b0h,0d2h,040h,040h,040h	; b2a9  @r... @......@@@
	defb 061h,093h,0b0h,0d1h,040h,060h,092h,0b0h,090h,070h,060h,040h,020h,0f8h,002h,0eah	; b2b9  a...@`...p`@ ...
	defb 009h,0edh	; b2c9

; ----------------------------------------------------------------------
; DATOS partitura_B2CB: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xb2cb..0xb2ce  (3 bytes)
DATA_partitura_B2CB:
	defb 028h,0ebh,088h	; b2cb

; ----------------------------------------------------------------------
; DATOS partitura_B2CE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (56 bytes)
;   0xb2ce..0xb306  (56 bytes)
DATA_partitura_B2CE:
	defb 01bh,071h,0dbh,003h,0d3h,090h,090h,090h,0d2h,020h,020h,020h,041h,073h,0d3h,090h	; b2ce  .q.......   As..
	defb 0d2h,020h,040h,072h,0d3h,090h,0d2h,020h,040h,092h,0d3h,0b0h,0b0h,0b0h,0d2h,040h	; b2de  . @r... @......@
	defb 040h,040h,061h,093h,0d3h,0b0h,0d2h,040h,060h,090h,070h,060h,0f0h,002h,034h,0b2h	; b2ee  @@a....@`.p`..4.
	defb 0eah,00bh,0edh,018h,0ebh,089h,027h,091h	; b2fe  ......'.

; ----------------------------------------------------------------------
; DATOS partitura_B306: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (24 bytes)
;   0xb306..0xb31e  (24 bytes)
DATA_partitura_B306:
	defb 060h,0b0h,0d1h,020h,0e9h,00ah,0f8h,002h,0eah,00ah,0edh,019h,0ebh,087h,037h,081h	; b306  `.. ..........7.
	defb 0dbh,003h,0f0h,002h,074h,0d1h,068h,0d2h	; b316  ....t.h.

; ----------------------------------------------------------------------
; DATOS partitura_B31E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (19 bytes)
;   0xb31e..0xb331  (19 bytes)
DATA_partitura_B31E:
	defb 060h,0b0h,0d1h,020h,068h,0d2h,060h,0b0h,0d1h,020h,095h,072h,062h,045h,060h,040h	; b31e  `.. h.`.. .rbE`@
	defb 020h,0d2h,060h	; b32e

; ----------------------------------------------------------------------
; DATOS partitura_B331: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (10 bytes)
;   0xb331..0xb33b  (10 bytes)
DATA_partitura_B331:
	defb 0b0h,0d1h,020h,068h,0d2h,060h,0b0h,0d1h,020h,068h	; b331  .. h.`.. h

; ----------------------------------------------------------------------
; DATOS sin identificar  0xb33b..0xb391  (86 bytes)
DATA_B33B:
	defb 0d2h,060h,0b0h,0d1h,020h,095h,072h,062h,045h,060h,040h,020h,0d2h,060h,0d1h,010h	; b33b  .`.. .rbE`@ .`..
	defb 040h,0e9h,00ah,0f8h,002h,0eah,00ah,0edh,019h,0ebh,087h,037h,081h,0dbh,003h,0f0h	; b34b  @..........7....
	defb 002h,074h,0d1h,088h,0d2h,080h,0d1h,010h,030h,088h,0d2h,080h,0d1h,010h,040h,0b5h	; b35b  .t......0.....@.
	defb 092h,082h,065h,080h,060h,040h,0d2h,080h,0d1h,010h,040h,088h,0d2h,080h,0d1h,010h	; b36b  ..e.`@....@.....
	defb 030h,088h,0d2h,080h,0d1h,010h,040h,0b5h,092h,082h,065h,080h,060h,040h,0d2h,060h	; b37b  0.....@...e.`@.`
	defb 0b0h,0d1h,020h,0fdh,00ah,0b3h	; b38b

; ----------------------------------------------------------------------
; DATOS partitura_B391: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (5 bytes)
;   0xb391..0xb396  (5 bytes)
DATA_partitura_B391:
	defb 0feh,001h,0e9h,00ah,0eeh	; b391

; ----------------------------------------------------------------------
; DATOS partitura_B396: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (15 bytes)
;   0xb396..0xb3a5  (15 bytes)
DATA_partitura_B396:
	defb 081h,0c1h,0eah,006h,0ebh,009h,01bh,041h,0dbh,002h,0f0h,002h,035h,0d6h,010h	; b396  .......A....5..

; ----------------------------------------------------------------------
; DATOS partitura_B3A5: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xb3a5..0xb3be  (25 bytes)
DATA_partitura_B3A5:
	defb 001h,0d3h,090h,090h,090h,0d2h,020h,020h,020h,0ebh,009h,01bh,081h,041h,073h,0ebh	; b3a5  ......   ....As.
	defb 019h,01bh,041h,090h,090h,090h,0d1h,020h,040h	; b3b5  ..A.... @

; ----------------------------------------------------------------------
; DATOS partitura_B3BE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (12 bytes)
;   0xb3be..0xb3ca  (12 bytes)
DATA_partitura_B3BE:
	defb 070h,0dbh,003h,061h,041h,021h,0dbh,002h,0d3h,090h,090h,090h	; b3be  p..aA!......

; ----------------------------------------------------------------------
; DATOS partitura_B3CA: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xb3ca..0xb3dc  (18 bytes)
DATA_partitura_B3CA:
	defb 0d2h,020h,020h,020h,0dbh,003h,041h,073h,0dbh,002h,090h,090h,090h,0d1h,020h,040h	; b3ca  .   ..As...... @
	defb 070h,0dbh	; b3da

; ----------------------------------------------------------------------
; DATOS partitura_B3DC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (33 bytes)
;   0xb3dc..0xb3fd  (33 bytes)
DATA_partitura_B3DC:
	defb 003h,061h,041h,071h,0e9h,00ah,0eeh,081h,0eah,006h,0ebh,019h,01bh,041h,0dbh,002h	; b3dc  .aAq.........A..
	defb 0f0h,002h,045h,0d6h,010h,001h,0d3h,090h,090h,090h,0d2h,020h,020h,020h,0ebh,009h	; b3ec  ..E........   ..
	defb 01bh	; b3fc

; ----------------------------------------------------------------------
; DATOS partitura_B3FD: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (30 bytes)
;   0xb3fd..0xb41b  (30 bytes)
DATA_partitura_B3FD:
	defb 081h,041h,073h,0ebh,01ah,01bh,041h,090h,090h,090h,0d1h,020h,040h,070h,0dbh,004h	; b3fd  .As...A.... @p..
	defb 061h,041h,021h,0dbh,002h,0d3h,090h,090h,090h,0d2h,020h,020h,020h,0dbh	; b40d  aA!.......   .

; ----------------------------------------------------------------------
; DATOS partitura_B41B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xb41b..0xb41f  (4 bytes)
DATA_partitura_B41B:
	defb 004h,041h,073h,0dbh	; b41b

; ----------------------------------------------------------------------
; DATOS partitura_B41F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (63 bytes)
;   0xb41f..0xb45e  (63 bytes)
DATA_partitura_B41F:
	defb 002h,090h,090h,090h,0d1h,020h,040h,070h,0dbh,002h,062h,0d2h,040h,0e9h,00ah,0efh	; b41f  ..... @p..b.@...
	defb 0c1h,0eeh,081h,0eah,004h,0ech,0f0h,002h,054h,0d6h,010h,001h,0d3h,092h,0d2h,072h	; b42f  ........T......r
	defb 060h,040h,020h,042h,002h,042h,020h,0d3h,0b0h,0d2h,000h,0d3h,090h,0b0h,070h,092h	; b43f  `@ B.B .......p.
	defb 0d2h,072h,060h,040h,020h,042h,0d1h,000h,0d2h,0b0h,090h,0d1h,020h,000h,0d2h	; b44f  .r`@ B...... ..

; ----------------------------------------------------------------------
; DATOS partitura_B45E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (81 bytes)
;   0xb45e..0xb4af  (81 bytes)
DATA_partitura_B45E:
	defb 0b0h,0d1h,040h,020h,000h,0d3h,040h,060h,070h,0b2h,0d2h,092h,080h,060h,040h,062h	; b45e  ..@ ..@`p....`@b
	defb 022h,062h,040h,010h,020h,0d3h,0b0h,0d2h,010h,0d3h,090h,0b2h,0d2h,092h,080h,060h	; b46e  "b@. ..........`
	defb 040h,062h,0d1h,020h,010h,0d2h,0b0h,0d1h,040h,020h,010h,060h,040h,020h,010h,0e9h	; b47e  @b. ....@ .`@ ..
	defb 00ah,0c1h,0efh,0eeh,081h,0eah,004h,0edh,014h,0ebh,087h,017h,071h,0dbh,002h,0f0h	; b48e  ............q...
	defb 002h,042h,0d6h,006h,001h,0d1h,040h,020h,000h,021h,046h,040h,020h,000h,061h,076h	; b49e  .B....@ .!F@ .av
	defb 040h	; b4ae

; ----------------------------------------------------------------------
; DATOS partitura_B4AF: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xb4af..0xb4b3  (4 bytes)
DATA_partitura_B4AF:
	defb 020h,000h,021h,046h	; b4af

; ----------------------------------------------------------------------
; DATOS partitura_B4B3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (38 bytes)
;   0xb4b3..0xb4d9  (38 bytes)
DATA_partitura_B4B3:
	defb 040h,020h,000h,062h,070h,060h,040h,092h,060h,040h,020h,041h,066h,060h,040h,020h	; b4b3  @ .bp`@.`@ Af`@
	defb 081h,096h,060h,040h,020h,041h,066h,060h,040h,020h,082h,090h,080h,060h,0b0h,0c1h	; b4c3  ..`@ Af`@ ...`..
	defb 0e9h,00ah,0efh,0eah,004h,0edh	; b4d3

; ----------------------------------------------------------------------
; DATOS partitura_B4D9: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (57 bytes)
;   0xb4d9..0xb512  (57 bytes)
DATA_partitura_B4D9:
	defb 013h,0ebh,088h,01bh,041h,0dbh,001h,0f0h,002h,072h,0d8h,0d3h,090h,090h,090h,0d2h	; b4d9  ....A....r......
	defb 020h,020h,020h,041h,073h,090h,0d1h,020h,040h,072h,0d2h,090h,0d1h,020h,040h,092h	; b4e9     As.. @r... @.
	defb 0d3h,0b0h,0b0h,0b0h,0d2h,040h,040h,040h,061h,093h,0b0h,0d1h,040h,060h,092h,0b0h	; b4f9  .....@@@a...@`..
	defb 090h,070h,060h,0c1h,0eah,003h,0ech,0d3h,090h	; b509  .p`......

; ----------------------------------------------------------------------
; DATOS partitura_B512: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xb512..0xb514  (2 bytes)
DATA_partitura_B512:
	defb 090h,090h	; b512

; ----------------------------------------------------------------------
; DATOS partitura_B514: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (49 bytes)
;   0xb514..0xb545  (49 bytes)
DATA_partitura_B514:
	defb 0d2h,020h,020h,020h,041h,073h,0d3h,090h,0d2h,020h,040h,072h,0d3h,090h,0d2h,020h	; b514  .   As... @r...
	defb 040h,092h,0d3h,0b0h,0b0h,0b0h,0d2h,040h,040h,040h,061h,093h,0d3h,0b0h,0d2h,040h	; b524  @......@@@a....@
	defb 060h,090h,070h,060h,0f0h,002h,034h,0b2h,0eah,004h,060h,0b0h,0d1h,020h,0c0h,0e9h	; b534  `.p`..4...`.. ..
	defb 00ah	; b544

; ----------------------------------------------------------------------
; DATOS partitura_B545: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA4 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (52 bytes)
;   0xb545..0xb579  (52 bytes)
DATA_partitura_B545:
	defb 0efh,0eeh,081h,0eah,006h,0edh,013h,0ebh,087h,017h,081h,0dbh,002h,0f0h,002h,074h	; b545  ...............t
	defb 0d1h,068h,0d2h,060h,0b0h,0d1h,020h,068h,0d2h,060h,0b0h,0d1h,020h,0eah,004h,095h	; b555  .h.`.. h.`.. ...
	defb 072h,062h,045h,0eah,006h,060h,040h,020h,0d2h,060h,0b0h,0d1h,020h,068h,0d2h,060h	; b565  rbE..`@ .`.. h.`
	defb 0b0h,0d1h,020h,068h	; b575

; ----------------------------------------------------------------------
; DATOS sin identificar  0xb579..0xb5dc  (99 bytes)
DATA_B579:
	defb 0d2h,060h,0b0h,0d1h,020h,0eah,004h,095h,072h,062h,045h,0eah,005h,060h,040h,020h	; b579  .`.. ...rbE..`@
	defb 0d2h,060h,0d1h,010h,040h,0e9h,00ah,0efh,0eeh,081h,0eah,006h,0edh,013h,0ebh,087h	; b589  .`..@...........
	defb 017h,081h,0dbh,002h,0f0h,002h,074h,0d1h,088h,0d2h,080h,0d1h,010h,040h,088h,0d2h	; b599  ......t......@..
	defb 080h,0d1h,010h,040h,0eah,004h,0b5h,092h,082h,065h,0eah,006h,080h,060h,040h,0d2h	; b5a9  ...@.....e...`@.
	defb 080h,0d1h,010h,040h,088h,0d2h,080h,0d1h,010h,040h,088h,0d2h,080h,0d1h,010h,040h	; b5b9  ...@.....@.....@
	defb 0eah,004h,0b5h,092h,082h,065h,0eah,005h,080h,060h,040h,0d2h,060h,0b0h,0d1h,020h	; b5c9  .....e...`@.`..
	defb 0fdh,043h,0b5h	; b5d9

; ----------------------------------------------------------------------
; DATOS partitura_B5DC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA7 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xb5dc..0xb5e0  (4 bytes)
DATA_partitura_B5DC:
	defb 0feh,004h,0d0h,0e9h	; b5dc

; ----------------------------------------------------------------------
; DATOS partitura_B5E0: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA7 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (9 bytes)
;   0xb5e0..0xb5e9  (9 bytes)
DATA_partitura_B5E0:
	defb 007h,060h,063h,0e9h,001h,043h,042h,0e9h,007h	; b5e0  .`c..CB..

; ----------------------------------------------------------------------
; DATOS partitura_B5E9: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA7 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xb5e9..0xb602  (25 bytes)
DATA_partitura_B5E9:
	defb 030h,030h,040h,040h,050h,050h,050h,050h,050h,060h,060h,060h,063h,0e9h,001h,043h	; b5e9  00@@PPPPP```c..C
	defb 042h,0e9h,007h,030h,030h,040h,040h,050h,050h	; b5f9  B..00@@PP

; ----------------------------------------------------------------------
; DATOS partitura_B602: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA7 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xb602..0xb61b  (25 bytes)
DATA_partitura_B602:
	defb 050h,060h,060h,060h,066h,064h,063h,065h,060h,060h,060h,064h,050h,050h,050h,065h	; b602  P```fdce```dPPPe
	defb 0e9h,001h,043h,042h,052h,0e9h,007h,06fh,0ffh	; b612  ..CBR..o.

; ----------------------------------------------------------------------
; DATOS partitura_B61B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA7 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (43 bytes)
;   0xb61b..0xb646  (43 bytes)
DATA_partitura_B61B:
	defb 0feh,001h,0dbh,003h,0e9h,007h,0c1h,0eah,009h,0ebh,017h,017h,0a1h,0d6h,006h,002h	; b61b  ................
	defb 0f0h,005h,022h,0d1h,000h,00fh,000h,01fh,0eah,003h,0ech,0d8h,0f0h,005h,002h,015h	; b62b  ..".............
	defb 0f1h,002h,00dh,001h,008h,0eah,009h,0ebh,017h,017h,004h	; b63b  ...........

; ----------------------------------------------------------------------
; DATOS partitura_B646: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA7 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (22 bytes)
;   0xb646..0xb65c  (22 bytes)
DATA_partitura_B646:
	defb 0d6h,002h,002h,0f0h,005h,022h,0d2h,070h,073h,083h,0d1h,015h,040h,030h,020h,014h	; b646  .....".ps...@0 .
	defb 040h,030h,020h,016h,0dch,0e9h	; b656

; ----------------------------------------------------------------------
; DATOS partitura_B65C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA7 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xb65c..0xb667  (11 bytes)
DATA_partitura_B65C:
	defb 00eh,00ah,0ech,0eah,001h,0d8h,0f0h,005h,002h,001h,0ffh	; b65c  ...........

; ----------------------------------------------------------------------
; DATOS partitura_B667: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA7 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (13 bytes)
;   0xb667..0xb674  (13 bytes)
DATA_partitura_B667:
	defb 0feh,001h,0e9h,007h,0eah,00bh,0ebh,007h,017h,0c1h,0f0h,005h,023h	; b667  ............#

; ----------------------------------------------------------------------
; DATOS partitura_B674: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA7 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (46 bytes)
;   0xb674..0xb6a2  (46 bytes)
DATA_partitura_B674:
	defb 0d2h,030h,03fh,030h,05fh,0ech,0eah,002h,055h,0eah,00bh,0ebh,017h,017h,004h,000h	; b674  .0?0_...U.......
	defb 003h,003h,0ebh,007h,017h,0c1h,035h,0ech,0eah,002h,031h,03fh,0eah,00bh,0ebh,007h	; b684  ......5...1?....
	defb 017h,0c1h,0e9h,00eh,04bh,0ech,0eah,001h,0d8h,0f0h,005h,003h,041h,0ffh	; b694  ....K.......A.

; ----------------------------------------------------------------------
; DATOS partitura_B6A2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA7 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (27 bytes)
;   0xb6a2..0xb6bd  (27 bytes)
DATA_partitura_B6A2:
	defb 0feh,001h,0f8h,028h,0f0h,006h,058h,0e9h,007h,0eah,00dh,0ebh,009h,037h,0a1h,0d4h	; b6a2  ...(..X......7..
	defb 000h,00fh,000h,01eh,00fh,0e9h,00eh,01bh,00bh,0ech,0eah	; b6b2  ...........

; ----------------------------------------------------------------------
; DATOS partitura_B6BD: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA7 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xb6bd..0xb6c4  (7 bytes)
DATA_partitura_B6BD:
	defb 001h,0d8h,0f0h,006h,008h,001h,0ffh	; b6bd

; ----------------------------------------------------------------------
; DATOS partitura_B6C4: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA7 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xb6c4..0xb6dd  (25 bytes)
DATA_partitura_B6C4:
	defb 0feh,001h,0f1h,002h,00dh,001h,008h,0dbh,003h,0e9h,007h,0eah,00eh,0ebh,019h,027h	; b6c4  ...............'
	defb 0a1h,0d6h,048h,002h,0f0h,005h,022h,0d1h,000h	; b6d4  ..H..."..

; ----------------------------------------------------------------------
; DATOS partitura_B6DD: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA7 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xb6dd..0xb6ef  (18 bytes)
DATA_partitura_B6DD:
	defb 00fh,000h,01fh,0f6h,0f8h,00dh,0eah,003h,0ech,0d8h,0f0h,005h,002h,015h,0f1h,002h	; b6dd  ................
	defb 00dh,001h	; b6ed

; ----------------------------------------------------------------------
; DATOS partitura_B6EF: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA7 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xb6ef..0xb708  (25 bytes)
DATA_partitura_B6EF:
	defb 008h,0eah,00eh,0ebh,019h,027h,004h,0d6h,048h,002h,0f0h,005h,022h,0d2h,070h,073h	; b6ef  .....'..H...".ps
	defb 083h,0ebh,019h,027h,0a1h,0d1h,015h,040h,030h	; b6ff  ...'...@0

; ----------------------------------------------------------------------
; DATOS partitura_B708: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA7 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (32 bytes)
;   0xb708..0xb728  (32 bytes)
DATA_partitura_B708:
	defb 020h,014h,0f1h,00ah,023h,001h,002h,040h,030h,020h,016h,0f1h,002h,00dh,001h,008h	; b708   ...#..@0 ......
	defb 0dch,0e9h,00eh,00bh,0f6h,0f8h,00dh,0ech,0eah,001h,0d8h,0f0h,005h,002h,001h,0ffh	; b718  ................

; ----------------------------------------------------------------------
; DATOS partitura_B728: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA7 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xb728..0xb733  (11 bytes)
DATA_partitura_B728:
	defb 0feh,001h,0f2h,001h,0e9h,007h,0dbh,003h,0eah,00eh,0ebh	; b728  ...........

; ----------------------------------------------------------------------
; DATOS partitura_B733: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA7 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (69 bytes)
;   0xb733..0xb778  (69 bytes)
DATA_partitura_B733:
	defb 019h,027h,0a1h,0d6h,050h,002h,0f0h,005h,022h,0d2h,070h,07fh,070h,08fh,0f8h,00dh	; b733  .'..P...".p.p...
	defb 0ech,0eah,002h,0d8h,0f0h,005h,002h,085h,0f2h,001h,0eah,00eh,0ebh,019h,027h,004h	; b743  ..............'.
	defb 0f0h,005h,022h,0d6h,050h,002h,030h,033h,033h,0ebh,019h,027h,0a1h,085h,0b0h,0a0h	; b753  ..".P.033..'....
	defb 090h,084h,0b0h,0a0h,090h,086h,0dch,0e9h,00eh,08bh,0f8h,00dh,0ech,0eah,001h,0d8h	; b763  ................
	defb 0f0h,005h,002h,081h,0ffh	; b773

; ----------------------------------------------------------------------
; DATOS partitura_B778: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA7 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xb778..0xb77f  (7 bytes)
DATA_partitura_B778:
	defb 0feh,001h,0f8h,002h,0e9h,007h,0eah	; b778

; ----------------------------------------------------------------------
; DATOS partitura_B77F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA7 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (84 bytes)
;   0xb77f..0xb7d3  (84 bytes)
DATA_partitura_B77F:
	defb 00ah,0edh,018h,0ebh,009h,037h,0c1h,0d6h,002h,001h,0f0h,005h,022h,0d1h,0c1h,0b0h	; b77f  .....7......"...
	defb 0d0h,000h,0d1h,070h,030h,000h,0d2h,0b0h,0d1h,000h,0d2h,070h,030h,000h,0d3h,0b0h	; b78f  ...p0......p0...
	defb 0d2h,000h,0d3h,070h,030h,010h,030h,050h,070h,080h,0e9h,001h,005h,075h,085h,0a5h	; b79f  ...p0.0Pp....u..
	defb 0d2h,005h,01fh,045h,055h,074h,084h,0a4h,0d1h,004h,014h,0e9h,007h,00fh,0d2h,0e9h	; b7af  ...EUt..........
	defb 00eh,01bh,0e9h,002h,004h,044h,084h,0e9h,007h,0d1h,00fh,0ech,0eah,001h,0d8h,0f0h	; b7bf  .....D..........
	defb 005h,002h,003h,0ffh	; b7cf

; ----------------------------------------------------------------------
; DATOS partitura_B7D3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA7 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (42 bytes)
;   0xb7d3..0xb7fd  (42 bytes)
DATA_partitura_B7D3:
	defb 0feh,001h,0f8h,002h,0dbh,001h,0e9h,007h,0eah,005h,0edh,012h,0ebh,007h,017h,0c1h	; b7d3  ................
	defb 0d6h,002h,001h,0f0h,005h,022h,0eeh,001h,0c1h,0d1h,0c1h,0b0h,0d0h,000h,0d1h,070h	; b7e3  .....".........p
	defb 030h,000h,0d2h,0b0h,0d1h,000h,0d2h,070h,030h,000h	; b7f3  0......p0.

; ----------------------------------------------------------------------
; DATOS partitura_B7FD: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA7 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (33 bytes)
;   0xb7fd..0xb81e  (33 bytes)
DATA_partitura_B7FD:
	defb 0d3h,0b0h,0d2h,000h,0d3h,070h,030h,010h,030h,050h,070h,080h,0e9h,001h,056h,075h	; b7fd  .....p0.0Pp...Vu
	defb 085h,0a5h,0d2h,005h,01fh,045h,055h,074h,084h,0a4h,0d1h,004h,014h,0e9h,007h,00fh	; b80d  .....EUt........
	defb 0d2h	; b81d

; ----------------------------------------------------------------------
; DATOS partitura_B81E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA7 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (20 bytes)
;   0xb81e..0xb832  (20 bytes)
DATA_partitura_B81E:
	defb 0e9h,00eh,01bh,0e9h,002h,004h,044h,084h,0e9h,007h,0d1h,00fh,0ech,0eah,001h,0d8h	; b81e  ......D.........
	defb 0f0h,005h,002h,001h	; b82e

; ----------------------------------------------------------------------
; DATOS partitura_B832: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA7 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xb832..0xb833  (1 bytes)
DATA_partitura_B832:
	defb 0ffh	; b832

; ----------------------------------------------------------------------
; DATOS partitura_B833: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA8 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xb833..0xb839  (6 bytes)
DATA_partitura_B833:
	defb 0feh,001h,0e9h,00fh,0f0h,002h	; b833

; ----------------------------------------------------------------------
; DATOS partitura_B839: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA8 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xb839..0xb83a  (1 bytes)
DATA_partitura_B839:
	defb 038h	; b839

; ----------------------------------------------------------------------
; DATOS partitura_B83A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA8 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (10 bytes)
;   0xb83a..0xb844  (10 bytes)
DATA_partitura_B83A:
	defb 0ech,0eah,009h,0eeh,087h,0d4h,00fh,0fdh,040h,0b8h	; b83a  ........@.

; ----------------------------------------------------------------------
; DATOS partitura_B844: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA8 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xb844..0xb848  (4 bytes)
DATA_partitura_B844:
	defb 0feh,001h,0e9h,001h	; b844

; ----------------------------------------------------------------------
; DATOS partitura_B848: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA8 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xb848..0xb859  (17 bytes)
DATA_partitura_B848:
	defb 0c4h,0eah,005h,0ebh,027h,0f0h,000h,0d0h,074h,004h,014h,064h,004h,014h,0fdh,050h	; b848  ....'...t..d...P
	defb 0b8h	; b858

; ----------------------------------------------------------------------
; DATOS partitura_B859: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA8 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (39 bytes)
;   0xb859..0xb880  (39 bytes)
DATA_partitura_B859:
	defb 0feh,001h,0e9h,00eh,0c1h,0eeh,082h,0eah,006h,0edh,013h,0ebh,087h,014h,0f1h,0dbh	; b859  ................
	defb 003h,0d9h,0d6h,001h,010h,0f0h,002h,053h,0d3h,0afh,08fh,0afh,08fh,0d2h,00fh,0d3h	; b869  .......S........
	defb 0afh,0d2h,00fh,03fh,0fdh,071h,0b8h	; b879

; ----------------------------------------------------------------------
; DATOS partitura_B880: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA8 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xb880..0xb888  (8 bytes)
DATA_partitura_B880:
	defb 0feh,001h,0f8h,052h,0e9h,001h,0eah,004h	; b880  ...R....

; ----------------------------------------------------------------------
; DATOS partitura_B888: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA8 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xb888..0xb890  (8 bytes)
DATA_partitura_B888:
	defb 0ebh,009h,01bh,001h,0d0h,074h,004h,014h	; b888  .....t..

; ----------------------------------------------------------------------
; DATOS partitura_B890: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA8 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xb890..0xb896  (6 bytes)
DATA_partitura_B890:
	defb 064h,004h,014h,0fdh,08dh,0b8h	; b890

; ----------------------------------------------------------------------
; DATOS partitura_B896: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA8 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (22 bytes)
;   0xb896..0xb8ac  (22 bytes)
DATA_partitura_B896:
	defb 0feh,001h,0f1h,094h,01ch,001h,00ah,0f3h,001h,0e9h,00fh,0f0h,002h,037h,0ech,0eah	; b896  .............7..
	defb 00ah,0d4h,00fh,0fdh,0a8h,0b8h	; b8a6

; ----------------------------------------------------------------------
; DATOS partitura_B8AC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA8 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xb8ac..0xb8af  (3 bytes)
DATA_partitura_B8AC:
	defb 0feh,001h,0f8h	; b8ac

; ----------------------------------------------------------------------
; DATOS partitura_B8AF: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA8 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (32 bytes)
;   0xb8af..0xb8cf  (32 bytes)
DATA_partitura_B8AF:
	defb 005h,0e9h,00eh,0c1h,0eeh,082h,0eah,008h,0edh,022h,0ebh,087h,037h,0b1h,0dbh,002h	; b8af  ........."..7...
	defb 0d9h,0d6h,001h,006h,0f0h,002h,053h,0d2h,03fh,01fh,03fh,01fh,05fh,03fh,05fh,08fh	; b8bf  ......S.?.?._?_.

; ----------------------------------------------------------------------
; DATOS partitura_B8CF: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA8 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xb8cf..0xb8d2  (3 bytes)
DATA_partitura_B8CF:
	defb 0fdh,0c7h,0b8h	; b8cf

; ----------------------------------------------------------------------
; DATOS partitura_B8D2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA8 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (33 bytes)
;   0xb8d2..0xb8f3  (33 bytes)
DATA_partitura_B8D2:
	defb 0feh,001h,0f8h,005h,0e9h,00eh,0eah,00bh,0edh,023h,0ebh,087h,037h,0b1h,0dbh,002h	; b8d2  .........#..7...
	defb 0d9h,0d6h,001h,006h,0f0h,002h,053h,0d2h,03fh,01fh,03fh,01fh,05fh,03fh,05fh,08fh	; b8e2  ......S.?.?._?_.
	defb 0fdh	; b8f2

; ----------------------------------------------------------------------
; DATOS partitura_B8F3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA8 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xb8f3..0xb8f5  (2 bytes)
DATA_partitura_B8F3:
	defb 0eah,0b8h	; b8f3

; ----------------------------------------------------------------------
; DATOS partitura_B8F5: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA8 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (38 bytes)
;   0xb8f5..0xb91b  (38 bytes)
DATA_partitura_B8F5:
	defb 0feh,001h,0f8h,005h,0e9h,00eh,0eah,00bh,0edh,023h,0ebh,087h,037h,0b1h,0dbh,002h	; b8f5  .........#..7...
	defb 0d9h,0d6h,001h,010h,0f0h,002h,053h,0d3h,0afh,08fh,0afh,08fh,0d2h,00fh,0d3h,0afh	; b905  ......S.........
	defb 0d2h,00fh,03fh,0fdh,00ch,0b9h	; b915

; ----------------------------------------------------------------------
; DATOS partitura_B91B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xb91b..0xb91f  (4 bytes)
DATA_partitura_B91B:
	defb 0feh,004h,0e9h,002h	; b91b

; ----------------------------------------------------------------------
; DATOS partitura_B91F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xb91f..0xb930  (17 bytes)
DATA_partitura_B91F:
	defb 0d0h,0f5h,004h,002h,007h,004h,002h,007h,004h,002h,007h,004h,02ah,0fbh,003h,004h	; b91f  ............*...
	defb 002h	; b92f

; ----------------------------------------------------------------------
; DATOS partitura_B930: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (27 bytes)
;   0xb930..0xb94b  (27 bytes)
DATA_partitura_B930:
	defb 007h,004h,002h,007h,0e9h,001h,0d1h,084h,065h,064h,081h,062h,065h,064h,094h,095h	; b930  ........ed.bed..
	defb 094h,095h,094h,094h,0feh,004h,0e9h,002h,0d0h,004h,072h	; b940  ..........r

; ----------------------------------------------------------------------
; DATOS partitura_B94B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xb94b..0xb95d  (18 bytes)
DATA_partitura_B94B:
	defb 007h,004h,002h,027h,004h,002h,027h,004h,072h,024h,0a2h,004h,072h,027h,074h,002h	; b94b  ...'..'.r$..r't.
	defb 027h,0e9h	; b95b

; ----------------------------------------------------------------------
; DATOS partitura_B95D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (32 bytes)
;   0xb95d..0xb97d  (32 bytes)
DATA_partitura_B95D:
	defb 001h,0d1h,094h,065h,064h,065h,074h,084h,0d0h,0e9h,002h,0a4h,0d1h,092h,0d0h,0b3h	; b95d  ...edet.........
	defb 0d1h,060h,060h,060h,060h,0feh,004h,0e9h,002h,0f5h,0d0h,024h,072h,004h,0a2h,024h	; b96d  .````......$r..$

; ----------------------------------------------------------------------
; DATOS partitura_B97D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xb97d..0xb97e  (1 bytes)
DATA_partitura_B97D:
	defb 0d1h	; b97d

; ----------------------------------------------------------------------
; DATOS partitura_B97E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xb97e..0xb990  (18 bytes)
DATA_partitura_B97E:
	defb 082h,0d0h,004h,0a2h,0fbh,003h,0d0h,074h,0d1h,060h,060h,060h,0d0h,074h,0d1h,060h	; b97e  .......t.```.t.`
	defb 061h,0d0h	; b98e

; ----------------------------------------------------------------------
; DATOS partitura_B990: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (46 bytes)
;   0xb990..0xb9be  (46 bytes)
DATA_partitura_B990:
	defb 004h,072h,0d1h,081h,081h,071h,061h,0f5h,0d0h,027h,004h,002h,0fbh,002h,024h,072h	; b990  .r...qa..'....$r
	defb 004h,002h,071h,0d1h,061h,061h,061h,091h,061h,061h,061h,0d0h,0f5h,004h,002h,027h	; b9a0  ..q.aaa.aaa....'
	defb 0fbh,003h,004h,072h,0e9h,001h,0d1h,064h,065h,064h,0feh,004h,0e9h,002h	; b9b0  ...r...ded....

; ----------------------------------------------------------------------
; DATOS partitura_B9BE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (23 bytes)
;   0xb9be..0xb9d5  (23 bytes)
DATA_partitura_B9BE:
	defb 0f5h,0d0h,027h,004h,002h,0fbh,002h,027h,074h,0a2h,027h,074h,072h,004h,072h,0a7h	; b9be  ..'....'t.'tr.r.
	defb 004h,072h,0a7h,004h,072h,0e9h,001h	; b9ce

; ----------------------------------------------------------------------
; DATOS partitura_B9D5: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xb9d5..0xb9d6  (1 bytes)
DATA_partitura_B9D5:
	defb 0d1h	; b9d5

; ----------------------------------------------------------------------
; DATOS partitura_B9D6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xb9d6..0xb9e7  (17 bytes)
DATA_partitura_B9D6:
	defb 064h,065h,064h,0e9h,002h,0d0h,0a4h,072h,0e9h,001h,0d1h,064h,065h,064h,0fdh,01bh	; b9d6  ded....r...ded..
	defb 0b9h	; b9e6

; ----------------------------------------------------------------------
; DATOS partitura_B9E7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xb9e7..0xb9ee  (7 bytes)
DATA_partitura_B9E7:
	defb 0feh,001h,0e9h,002h,0eah,00ah,0ebh	; b9e7

; ----------------------------------------------------------------------
; DATOS partitura_B9EE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (43 bytes)
;   0xb9ee..0xba19  (43 bytes)
DATA_partitura_B9EE:
	defb 009h,01bh,031h,0dbh,002h,0d4h,0a7h,0d3h,027h,037h,047h,057h,077h,087h,057h,0a7h	; b9ee  ..1.....'7GWw.W.
	defb 087h,077h,057h,037h,027h,007h,0d4h,0a7h,0d3h,037h,077h,087h,097h,0a7h,087h,077h	; b9fe  .wW7'....7w....w
	defb 057h,0d4h,0a7h,0d3h,027h,037h,047h,057h,077h,087h,077h	; ba0e  W...'7GWw.w

; ----------------------------------------------------------------------
; DATOS partitura_BA19: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (19 bytes)
;   0xba19..0xba2c  (19 bytes)
DATA_partitura_BA19:
	defb 0feh,001h,0e9h,002h,0eah,00ah,0ebh,009h,01bh,031h,0dbh,002h,0d4h,057h,057h,077h	; ba19  .........1...WWw
	defb 077h,087h,087h	; ba29

; ----------------------------------------------------------------------
; DATOS partitura_BA2C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xba2c..0xba34  (8 bytes)
DATA_partitura_BA2C:
	defb 097h,097h,0a7h,0d3h,057h,037h,027h,017h	; ba2c  ....W7'.

; ----------------------------------------------------------------------
; DATOS partitura_BA34: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (24 bytes)
;   0xba34..0xba4c  (24 bytes)
DATA_partitura_BA34:
	defb 007h,0d4h,084h,0aah,0feh,001h,0e9h,002h,0eah,00ah,0ebh,009h,01bh,031h,0dbh,002h	; ba34  .............1..
	defb 0d3h,0a7h,0a7h,087h,087h,077h,077h,057h	; ba44  .....wwW

; ----------------------------------------------------------------------
; DATOS partitura_BA4C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (27 bytes)
;   0xba4c..0xba67  (27 bytes)
DATA_partitura_BA4C:
	defb 057h,037h,037h,027h,027h,017h,007h,0d4h,0a7h,0d3h,027h,037h,077h,087h,097h,0a7h	; ba4c  W77''.....'7w...
	defb 087h,077h,057h,0d4h,0a7h,0d3h,027h,037h,047h,057h,077h	; ba5c  .wW...'7GWw

; ----------------------------------------------------------------------
; DATOS partitura_BA67: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xba67..0xba6a  (3 bytes)
DATA_partitura_BA67:
	defb 087h,077h,0feh	; ba67

; ----------------------------------------------------------------------
; DATOS partitura_BA6A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (32 bytes)
;   0xba6a..0xba8a  (32 bytes)
DATA_partitura_BA6A:
	defb 001h,0e9h,002h,0eah,00ah,0ebh,009h,01bh,031h,0dbh,002h,0d4h,047h,047h,057h,057h	; ba6a  ........1...GGWW
	defb 087h,087h,097h,097h,0a7h,0d3h,027h,037h,047h,057h,087h,097h,0a7h,0fdh,0e7h,0b9h	; ba7a  ......'7GW......

; ----------------------------------------------------------------------
; DATOS partitura_BA8A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xba8a..0xba95  (11 bytes)
DATA_partitura_BA8A:
	defb 0feh,001h,0e9h,002h,0eah,008h,0ebh,009h,02bh,011h,0dbh	; ba8a  ........+..

; ----------------------------------------------------------------------
; DATOS partitura_BA95: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (24 bytes)
;   0xba95..0xbaad  (24 bytes)
DATA_partitura_BA95:
	defb 003h,0d6h,005h,002h,0f0h,00fh,044h,0c4h,0d2h,0a2h,0c7h,0a4h,0c2h,0c7h,0a4h,0c7h	; ba95  ......D.........
	defb 0afh,0c2h,0c4h,0a2h,0c7h,0a4h,0cah,0a5h	; baa5  ........

; ----------------------------------------------------------------------
; DATOS partitura_BAAD: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xbaad..0xbabe  (17 bytes)
DATA_partitura_BAAD:
	defb 0c5h,0a5h,0c5h,0a5h,0c6h,0a2h,0c7h,0a4h,0c2h,0c7h,0a4h,0c7h,0afh,0c2h,0c4h,0a2h	; baad  ................
	defb 0c7h	; babd

; ----------------------------------------------------------------------
; DATOS partitura_BABE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (28 bytes)
;   0xbabe..0xbada  (28 bytes)
DATA_partitura_BABE:
	defb 0a4h,0c2h,0c7h,0a4h,0a2h,0c4h,02fh,0c2h,0feh,001h,0e9h,002h,0eah,00ah,0ebh,009h	; babe  ....../.........
	defb 01bh,031h,0dbh,002h,0d5h,057h,057h,077h,077h,087h,087h,097h	; bace  .1...WWww...

; ----------------------------------------------------------------------
; DATOS partitura_BADA: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (15 bytes)
;   0xbada..0xbae9  (15 bytes)
DATA_partitura_BADA:
	defb 097h,0eah,007h,0d2h,0c4h,0a2h,0c7h,0a4h,0c2h,0c7h,0a4h,0c2h,0c7h,0c4h,07ah	; bada  ..............z

; ----------------------------------------------------------------------
; DATOS partitura_BAE9: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (43 bytes)
;   0xbae9..0xbb14  (43 bytes)
DATA_partitura_BAE9:
	defb 0feh,001h,0e9h,002h,0eah,008h,0ebh,009h,01bh,021h,0dbh,002h,0d6h,005h,002h,0f0h	; bae9  .........!......
	defb 00fh,044h,0c4h,0d3h,0a2h,0c7h,0a4h,0c2h,0c7h,0a7h,0d2h,0c4h,072h,0cfh,0c4h,0a2h	; baf9  .D..........r...
	defb 0c7h,0a4h,0a2h,0c7h,0a7h,0c4h,072h,0c4h,072h,0c7h,03fh	; bb09  ......r.r.?

; ----------------------------------------------------------------------
; DATOS partitura_BB14: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xbb14..0xbb15  (1 bytes)
DATA_partitura_BB14:
	defb 0cfh	; bb14

; ----------------------------------------------------------------------
; DATOS partitura_BB15: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xbb15..0xbb2e  (25 bytes)
DATA_partitura_BB15:
	defb 0c4h,0a2h,0c7h,077h,0a7h,0c4h,0a2h,0c7h,0a4h,0a2h,0c7h,0a7h,0c4h,072h,0c4h,072h	; bb15  ...w.........r.r
	defb 0c7h,0feh,001h,0e9h,004h,0eah,009h,0ebh,009h	; bb25  .........

; ----------------------------------------------------------------------
; DATOS partitura_BB2E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (27 bytes)
;   0xbb2e..0xbb49  (27 bytes)
DATA_partitura_BB2E:
	defb 01bh,031h,0dbh,003h,0d6h,005h,002h,0f0h,00fh,044h,0d2h,03fh,037h,037h,0e9h,002h	; bb2e  .1.......D.?77..
	defb 0d2h,0c4h,0a2h,0c7h,0afh,0cah,0c9h,05ah,0fdh,08ah,0bah	; bb3e  .......Z...

; ----------------------------------------------------------------------
; DATOS partitura_BB49: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (32 bytes)
;   0xbb49..0xbb69  (32 bytes)
DATA_partitura_BB49:
	defb 0feh,001h,0e9h,002h,0f8h,009h,0eah,00eh,0ebh,009h,02bh,021h,0dbh,002h,0d5h,0a7h	; bb49  ..........+!....
	defb 0d4h,027h,037h,047h,057h,077h,087h,057h,0a7h,087h,077h,057h,037h,027h,007h,0d5h	; bb59  .'7GWw.W..wW7'..

; ----------------------------------------------------------------------
; DATOS partitura_BB69: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xbb69..0xbb71  (8 bytes)
DATA_partitura_BB69:
	defb 0a7h,0d4h,037h,077h,087h,097h,0a7h,087h	; bb69  ..7w....

; ----------------------------------------------------------------------
; DATOS partitura_BB71: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xbb71..0xbb73  (2 bytes)
DATA_partitura_BB71:
	defb 077h,057h	; bb71

; ----------------------------------------------------------------------
; DATOS partitura_BB73: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (40 bytes)
;   0xbb73..0xbb9b  (40 bytes)
DATA_partitura_BB73:
	defb 0d5h,0a7h,0d4h,027h,037h,047h,057h,077h,087h,077h,0feh,001h,0e9h,002h,0f8h,009h	; bb73  ...'7GWw.w......
	defb 0eah,00eh,0ebh,009h,02bh,021h,0dbh,002h,0d5h,057h,057h,077h,077h,087h,087h,097h	; bb83  ....+!...WWww...
	defb 097h,0a7h,0d4h,057h,037h,027h,017h,007h	; bb93  ...W7'..

; ----------------------------------------------------------------------
; DATOS partitura_BB9B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xbb9b..0xbbac  (17 bytes)
DATA_partitura_BB9B:
	defb 0d5h,084h,0aah,0feh,001h,0e9h,002h,0f8h,009h,0eah,00eh,0ebh,009h,02bh,021h,0dbh	; bb9b  .............+!.
	defb 002h	; bbab

; ----------------------------------------------------------------------
; DATOS partitura_BBAC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (10 bytes)
;   0xbbac..0xbbb6  (10 bytes)
DATA_partitura_BBAC:
	defb 0d4h,0a7h,0a7h,087h,087h,077h,077h,057h,057h,037h	; bbac  .....wwWW7

; ----------------------------------------------------------------------
; DATOS partitura_BBB6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (13 bytes)
;   0xbbb6..0xbbc3  (13 bytes)
DATA_partitura_BBB6:
	defb 037h,027h,027h,017h,007h,0d5h,0a7h,0d4h,027h,037h,077h,087h,097h	; bbb6  7''.....'7w..

; ----------------------------------------------------------------------
; DATOS partitura_BBC3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (49 bytes)
;   0xbbc3..0xbbf4  (49 bytes)
DATA_partitura_BBC3:
	defb 0a7h,087h,077h,057h,0d5h,0a7h,0d4h,027h,037h,047h,057h,077h,087h,077h,0feh,001h	; bbc3  ..wW...'7GWw.w..
	defb 0e9h,002h,0f8h,009h,0eah,00eh,0ebh,009h,02bh,021h,0dbh,002h,0d5h,047h,047h,057h	; bbd3  ........+!...GGW
	defb 057h,087h,087h,097h,097h,0a7h,0d4h,027h,037h,047h,057h,087h,097h,0a7h,0fdh,049h	; bbe3  W......'7GW....I
	defb 0bbh	; bbf3

; ----------------------------------------------------------------------
; DATOS partitura_BBF4: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (40 bytes)
;   0xbbf4..0xbc1c  (40 bytes)
DATA_partitura_BBF4:
	defb 0feh,001h,0e9h,002h,0f8h,04bh,0eah,00ah,0ebh,00ah,03bh,011h,0dbh,001h,0d6h,005h	; bbf4  .....K..........
	defb 002h,0f0h,00fh,044h,0c4h,0d2h,072h,0c7h,077h,0c7h,074h,0c7h,07fh,0c2h,0c4h,072h	; bc04  ...D..r.w.t....r
	defb 0c7h,074h,0cah,075h,0c5h,075h,0c5h,075h	; bc14  .t.u.u.u

; ----------------------------------------------------------------------
; DATOS partitura_BC1C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (48 bytes)
;   0xbc1c..0xbc4c  (48 bytes)
DATA_partitura_BC1C:
	defb 0c6h,072h,0c7h,074h,0c2h,0c7h,074h,0c7h,07fh,0c2h,0c4h,072h,0c7h,074h,0c2h,0c7h	; bc1c  .r.t..t....r.t..
	defb 074h,072h,0c4h,07fh,0c2h,0feh,001h,0e9h,002h,0f8h,04bh,0eah,008h,0ebh,00ah,03bh	; bc2c  tr........K.....
	defb 011h,0dbh,003h,0d6h,005h,002h,0f0h,00fh,044h,0c4h,0d1h,01ah,004h,0c2h,0d2h,0a4h	; bc3c  ........D.......

; ----------------------------------------------------------------------
; DATOS partitura_BC4C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (21 bytes)
;   0xbc4c..0xbc61  (21 bytes)
DATA_partitura_BC4C:
	defb 0c2h,0d1h,004h,0c2h,0d2h,0a4h,0c2h,0d1h,004h,0d2h,0aah,0c4h,0d2h,072h,0c7h,074h	; bc4c  .............r.t
	defb 0cah,074h,0cfh,0d1h,02ah	; bc5c

; ----------------------------------------------------------------------
; DATOS partitura_BC61: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (52 bytes)
;   0xbc61..0xbc95  (52 bytes)
DATA_partitura_BC61:
	defb 0feh,001h,0e9h,002h,0f8h,04bh,0eah,008h,0ebh,00ah,03bh,011h,0dbh,003h,0d6h,005h	; bc61  .....K..........
	defb 002h,0f0h,00fh,044h,0c4h,0d2h,072h,0c7h,074h,0cah,0d1h,017h,004h,012h,0d1h,0cfh	; bc71  ...D..r.t.......
	defb 0d2h,0c4h,072h,0c7h,074h,072h,0c7h,0d1h,017h,004h,012h,0c4h,012h,0c7h,0e9h,004h	; bc81  ..r.tr..........
	defb 0d2h,07fh,0e9h,002h	; bc91

; ----------------------------------------------------------------------
; DATOS partitura_BC95: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (15 bytes)
;   0xbc95..0xbca4  (15 bytes)
DATA_partitura_BC95:
	defb 0c4h,072h,0c7h,0d1h,017h,007h,0c4h,0d2h,072h,0c7h,074h,072h,0c7h,0d1h,017h	; bc95  .r......r.tr...

; ----------------------------------------------------------------------
; DATOS partitura_BCA4: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (19 bytes)
;   0xbca4..0xbcb7  (19 bytes)
DATA_partitura_BCA4:
	defb 004h,012h,0c4h,012h,0c7h,0feh,001h,0e9h,004h,0f8h,012h,0eah,009h,0ebh,009h,03bh	; bca4  ................
	defb 011h,0dbh,003h	; bcb4

; ----------------------------------------------------------------------
; DATOS partitura_BCB7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (26 bytes)
;   0xbcb7..0xbcd1  (26 bytes)
DATA_partitura_BCB7:
	defb 0d6h,005h,002h,0f0h,00fh,044h,0d1h,00fh,007h,007h,0e9h,002h,0d2h,0c4h,072h,0c7h	; bcb7  .....D........r.
	defb 074h,072h,0c4h,072h,0c9h,0cah,0aah,0fdh,0f4h,0bbh	; bcc7  tr.r......

; ----------------------------------------------------------------------
; DATOS partitura_BCD1: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xbcd1..0xbcd4  (3 bytes)
DATA_partitura_BCD1:
	defb 0feh,001h,0e9h	; bcd1

; ----------------------------------------------------------------------
; DATOS partitura_BCD4: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (19 bytes)
;   0xbcd4..0xbce7  (19 bytes)
DATA_partitura_BCD4:
	defb 002h,0f8h,012h,0eah,00ah,0ebh,00ah,03bh,011h,0dbh,003h,0d6h,005h,002h,0f0h,00fh	; bcd4  ................
	defb 044h,0c4h,0d2h	; bce4

; ----------------------------------------------------------------------
; DATOS partitura_BCE7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (35 bytes)
;   0xbce7..0xbd0a  (35 bytes)
DATA_partitura_BCE7:
	defb 052h,0c7h,057h,0c7h,054h,0c7h,05fh,0c2h,0c4h,052h,0c7h,054h,0cah,055h,0c5h,055h	; bce7  R.W.T._..R.T.U.U
	defb 0c5h,055h,0c6h,032h,0c7h,034h,0c2h,0c7h,034h,0c7h,05fh,0c2h,0c4h,052h,0c7h,054h	; bcf7  .U.2.4..4._..R.T
	defb 0c2h,0c7h,054h	; bd07

; ----------------------------------------------------------------------
; DATOS partitura_BD0A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (46 bytes)
;   0xbd0a..0xbd38  (46 bytes)
DATA_partitura_BD0A:
	defb 052h,0c4h,05fh,0c2h,0feh,001h,0e9h,002h,0eeh,081h,0c2h,0f8h,012h,0eah,004h,0ebh	; bd0a  R._.............
	defb 009h,01bh,021h,0dbh,002h,0d6h,005h,002h,0f0h,00fh,044h,0c4h,0d1h,01ah,004h,0c2h	; bd1a  ..!.......D.....
	defb 0d2h,0a4h,0c2h,0d1h,004h,0c2h,0d2h,0a4h,0c2h,0dbh,002h,0d1h,004h,0d2h	; bd2a  ..............

; ----------------------------------------------------------------------
; DATOS partitura_BD38: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (27 bytes)
;   0xbd38..0xbd53  (27 bytes)
DATA_partitura_BD38:
	defb 0aah,0c1h,0d2h,0eah,00ah,0ebh,00ah,02bh,011h,052h,0c7h,054h,0cah,054h,0cfh,05ah	; bd38  .......+.R.T.T.Z
	defb 0feh,001h,0e9h,002h,0f8h,010h,0eah,00ah,0ebh,009h,01bh	; bd48  ...........

; ----------------------------------------------------------------------
; DATOS partitura_BD53: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (35 bytes)
;   0xbd53..0xbd76  (35 bytes)
DATA_partitura_BD53:
	defb 031h,0dbh,003h,0d6h,005h,002h,0f0h,00fh,044h,0c4h,0d2h,052h,0c7h,054h,0cah,077h	; bd53  1.......D..R.T.w
	defb 074h,0a2h,0cfh,0c4h,052h,0c7h,054h,052h,0c7h,077h,074h,0a2h,0c4h,0a2h,0c7h,0e9h	; bd63  t...R.TR.wt.....
	defb 004h,0afh,0e9h	; bd73

; ----------------------------------------------------------------------
; DATOS partitura_BD76: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (23 bytes)
;   0xbd76..0xbd8d  (23 bytes)
DATA_partitura_BD76:
	defb 002h,0c4h,032h,0c7h,0a7h,077h,0c4h,052h,0c7h,054h,052h,0c7h,077h,074h,0a2h,0c4h	; bd76  ..2..w.R.TR.wt..
	defb 0a2h,0c7h,0feh,001h,0e9h,004h,0f8h	; bd86

; ----------------------------------------------------------------------
; DATOS partitura_BD8D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (12 bytes)
;   0xbd8d..0xbd99  (12 bytes)
DATA_partitura_BD8D:
	defb 012h,0eah,009h,0ebh,009h,03bh,011h,0dbh,003h,0d6h,005h,002h	; bd8d  ............

; ----------------------------------------------------------------------
; DATOS partitura_BD99: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (9 bytes)
;   0xbd99..0xbda2  (9 bytes)
DATA_partitura_BD99:
	defb 0f0h,00fh,044h,0d2h,09fh,087h,097h,0e9h,002h	; bd99  ..D......

; ----------------------------------------------------------------------
; DATOS partitura_BDA2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (5 bytes)
;   0xbda2..0xbda7  (5 bytes)
DATA_partitura_BDA2:
	defb 0d2h,0c4h,052h,0c7h,054h	; bda2

; ----------------------------------------------------------------------
; DATOS partitura_BDA7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (9 bytes)
;   0xbda7..0xbdb0  (9 bytes)
DATA_partitura_BDA7:
	defb 052h,0c4h,052h,0c9h,0cah,08ah,0fdh,0d1h,0bch	; bda7  R.R......

; ----------------------------------------------------------------------
; DATOS partitura_BDB0: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (22 bytes)
;   0xbdb0..0xbdc6  (22 bytes)
DATA_partitura_BDB0:
	defb 0feh,001h,0e9h,002h,0f8h,010h,0eah,00fh,0ebh,00ah,03bh,011h,0dbh,003h,0d6h,005h	; bdb0  ................
	defb 002h,0f0h,00fh,044h,0c4h,0d2h	; bdc0

; ----------------------------------------------------------------------
; DATOS partitura_BDC6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xbdc6..0xbdc8  (2 bytes)
DATA_partitura_BDC6:
	defb 0a2h,074h	; bdc6

; ----------------------------------------------------------------------
; DATOS partitura_BDC8: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (37 bytes)
;   0xbdc8..0xbded  (37 bytes)
DATA_partitura_BDC8:
	defb 052h,0a4h,0a2h,074h,052h,0d1h,017h,004h,0d2h,0a2h,0c4h,0d1h,01ah,0c4h,0d2h,0a2h	; bdc8  R..tR...........
	defb 074h,052h,0a4h,0a2h,074h,052h,0d1h,014h,002h,0d2h,0a4h,0d1h,012h,004h,0d2h,0a2h	; bdd8  tR..tR..........
	defb 0d1h,014h,002h,0c4h,0d2h	; bde8

; ----------------------------------------------------------------------
; DATOS partitura_BDED: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xbded..0xbdff  (18 bytes)
DATA_partitura_BDED:
	defb 0a2h,074h,052h,0a4h,0a2h,074h,052h,0d1h,017h,004h,0d2h,0a2h,0c4h,0d1h,01ah,0c4h	; bded  .tR..tR.........
	defb 0d2h,0a2h	; bdfd

; ----------------------------------------------------------------------
; DATOS partitura_BDFF: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (28 bytes)
;   0xbdff..0xbe1b  (28 bytes)
DATA_partitura_BDFF:
	defb 074h,052h,0a4h,0a2h,074h,052h,0d1h,017h,004h,0d2h,0e9h,004h,0a8h,0e9h,002h,0c0h	; bdff  tR..tR..........
	defb 0feh,001h,0e9h,002h,0f8h,010h,0eah,00fh,0ebh,00ah,03bh,011h	; be0f  ............

; ----------------------------------------------------------------------
; DATOS partitura_BE1B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (29 bytes)
;   0xbe1b..0xbe38  (29 bytes)
DATA_partitura_BE1B:
	defb 0dbh,003h,0d6h,005h,002h,0f0h,00fh,044h,0c4h,0d1h,05ah,032h,0c4h,014h,0c2h,034h	; be1b  .......D..Z2...4
	defb 0c2h,014h,0c2h,034h,01ah,0c4h,0d2h,0a2h,074h,052h,0a4h,0a2h,074h	; be2b  ...4....tR..t

; ----------------------------------------------------------------------
; DATOS partitura_BE38: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xbe38..0xbe3e  (6 bytes)
DATA_partitura_BE38:
	defb 052h,0a4h,072h,054h,0a2h,0c4h	; be38

; ----------------------------------------------------------------------
; DATOS partitura_BE3E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xbe3e..0xbe44  (6 bytes)
DATA_partitura_BE3E:
	defb 0d1h,0aah,0feh,001h,0e9h,002h	; be3e

; ----------------------------------------------------------------------
; DATOS partitura_BE44: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xbe44..0xbe47  (3 bytes)
DATA_partitura_BE44:
	defb 0f8h,015h,0eah	; be44

; ----------------------------------------------------------------------
; DATOS partitura_BE47: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xbe47..0xbe4b  (4 bytes)
DATA_partitura_BE47:
	defb 00ch,0ebh,00ah,03bh	; be47

; ----------------------------------------------------------------------
; DATOS partitura_BE4B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xbe4b..0xbe4e  (3 bytes)
DATA_partitura_BE4B:
	defb 011h,0dbh,001h	; be4b

; ----------------------------------------------------------------------
; DATOS partitura_BE4E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xbe4e..0xbe59  (11 bytes)
DATA_partitura_BE4E:
	defb 0d8h,0f0h,000h,0d2h,054h,072h,0a4h,0d1h,01ah,004h,0d2h	; be4e  ....Tr.....

; ----------------------------------------------------------------------
; DATOS partitura_BE59: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xbe59..0xbe5d  (4 bytes)
DATA_partitura_BE59:
	defb 0a7h,052h,074h,0a2h	; be59

; ----------------------------------------------------------------------
; DATOS partitura_BE5D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (13 bytes)
;   0xbe5d..0xbe6a  (13 bytes)
DATA_partitura_BE5D:
	defb 0d1h,017h,007h,0d2h,054h,072h,0a4h,0d1h,01ah,004h,0d2h,0a7h,0d1h	; be5d  ....Tr.......

; ----------------------------------------------------------------------
; DATOS partitura_BE6A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xbe6a..0xbe83  (25 bytes)
DATA_partitura_BE6A:
	defb 042h,057h,0d2h,0a4h,0d1h,01ah,03fh,014h,0d2h,0a2h,0c4h,0d1h,032h,0c4h,032h,0c4h	; be6a  BW....?.....2.2.
	defb 032h,014h,0d2h,0a2h,0c4h,0a2h,0c4h,052h,074h	; be7a  2......Rt

; ----------------------------------------------------------------------
; DATOS partitura_BE83: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (35 bytes)
;   0xbe83..0xbea6  (35 bytes)
DATA_partitura_BE83:
	defb 0a2h,0d1h,014h,0c2h,004h,0d2h,0a2h,0c4h,052h,074h,0a2h,0d1h,017h,037h,0feh,001h	; be83  ........Rt...7..
	defb 0e9h,002h,0f8h,015h,0eah,00ch,0ebh,00ah,03bh,011h,0dbh,001h,0d1h,041h,0e9h,004h	; be93  .............A..
	defb 05eh,0e9h,002h	; bea3

; ----------------------------------------------------------------------
; DATOS partitura_BEA6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xbea6..0xbeae  (8 bytes)
DATA_partitura_BEA6:
	defb 094h,05ah,034h,05ah,0c4h,0d2h,0a2h,0c4h	; bea6  .Z4Z....

; ----------------------------------------------------------------------
; DATOS partitura_BEAE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xbeae..0xbec7  (25 bytes)
DATA_partitura_BEAE:
	defb 0a2h,0d1h,034h,022h,054h,032h,070h,086h,074h,0a2h,0c4h,0d1h,0f8h,011h,0eah,008h	; beae  ..4"T2p.t.......
	defb 0d6h,006h,001h,0f0h,00fh,044h,058h,0eah,004h	; bebe  .....DX..

; ----------------------------------------------------------------------
; DATOS partitura_BEC7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xbec7..0xbece  (7 bytes)
DATA_partitura_BEC7:
	defb 0e9h,001h,041h,021h,0fdh,0b0h,0bdh	; bec7

; ----------------------------------------------------------------------
; DATOS partitura_BECE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (12 bytes)
;   0xbece..0xbeda  (12 bytes)
DATA_partitura_BECE:
	defb 0feh,001h,0e9h,002h,0c2h,0eeh,081h,0f8h,010h,0eah,009h,0ebh	; bece  ............

; ----------------------------------------------------------------------
; DATOS partitura_BEDA: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xbeda..0xbeec  (18 bytes)
DATA_partitura_BEDA:
	defb 009h,01bh,011h,0dbh,002h,0d6h,005h,002h,0f0h,00fh,044h,0c4h,0d2h,0a2h,074h,052h	; beda  ..........D...tR
	defb 0a4h,0a2h	; beea

; ----------------------------------------------------------------------
; DATOS partitura_BEEC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xbeec..0xbef2  (6 bytes)
DATA_partitura_BEEC:
	defb 074h,052h,0d1h,017h,004h,0d2h	; beec

; ----------------------------------------------------------------------
; DATOS partitura_BEF2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xbef2..0xbf03  (17 bytes)
DATA_partitura_BEF2:
	defb 0a2h,0c4h,0d1h,01ah,0c4h,0d2h,0a2h,074h,052h,0a4h,0a2h,074h,052h,0d1h,014h,002h	; bef2  .......tR..tR...
	defb 0d2h	; bf02

; ----------------------------------------------------------------------
; DATOS partitura_BF03: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xbf03..0xbf09  (6 bytes)
DATA_partitura_BF03:
	defb 0a4h,0d1h,012h,004h,0d2h,0a2h	; bf03

; ----------------------------------------------------------------------
; DATOS partitura_BF09: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xbf09..0xbf0f  (6 bytes)
DATA_partitura_BF09:
	defb 0d1h,014h,002h,0c4h,0d2h,0a2h	; bf09

; ----------------------------------------------------------------------
; DATOS partitura_BF0F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xbf0f..0xbf12  (3 bytes)
DATA_partitura_BF0F:
	defb 074h,052h,0a4h	; bf0f

; ----------------------------------------------------------------------
; DATOS partitura_BF12: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (28 bytes)
;   0xbf12..0xbf2e  (28 bytes)
DATA_partitura_BF12:
	defb 0a2h,074h,052h,0d1h,017h,004h,0d2h,0a2h,0c4h,0d1h,01ah,0c4h,0d2h,0a2h,074h,052h	; bf12  .tR...........tR
	defb 0a4h,0a2h,074h,052h,0d1h,017h,004h,0d2h,0e9h,004h,0a7h,0feh	; bf22  ..tR........

; ----------------------------------------------------------------------
; DATOS partitura_BF2E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xbf2e..0xbf34  (6 bytes)
DATA_partitura_BF2E:
	defb 001h,0e9h,002h,0efh,0eeh,081h	; bf2e

; ----------------------------------------------------------------------
; DATOS partitura_BF34: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xbf34..0xbf35  (1 bytes)
DATA_partitura_BF34:
	defb 0c2h	; bf34

; ----------------------------------------------------------------------
; DATOS partitura_BF35: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xbf35..0xbf39  (4 bytes)
DATA_partitura_BF35:
	defb 0f8h,010h,0eah,008h	; bf35

; ----------------------------------------------------------------------
; DATOS partitura_BF39: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xbf39..0xbf44  (11 bytes)
DATA_partitura_BF39:
	defb 0ebh,009h,01bh,021h,0dbh,002h,0d6h,005h,002h,0f0h,00fh	; bf39  ...!.......

; ----------------------------------------------------------------------
; DATOS partitura_BF44: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xbf44..0xbf4c  (8 bytes)
DATA_partitura_BF44:
	defb 044h,0c4h,0d1h,05ah,032h,0c4h,014h,0c2h	; bf44  D..Z2...

; ----------------------------------------------------------------------
; DATOS partitura_BF4C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (5 bytes)
;   0xbf4c..0xbf51  (5 bytes)
DATA_partitura_BF4C:
	defb 034h,0c2h,014h,0c2h,034h	; bf4c

; ----------------------------------------------------------------------
; DATOS partitura_BF51: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (5 bytes)
;   0xbf51..0xbf56  (5 bytes)
DATA_partitura_BF51:
	defb 01ah,0c4h,0d2h,0a2h,074h	; bf51

; ----------------------------------------------------------------------
; DATOS partitura_BF56: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xbf56..0xbf5a  (4 bytes)
DATA_partitura_BF56:
	defb 052h,0a4h,0a2h,074h	; bf56

; ----------------------------------------------------------------------
; DATOS partitura_BF5A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xbf5a..0xbf5e  (4 bytes)
DATA_partitura_BF5A:
	defb 052h,0a4h,072h,054h	; bf5a

; ----------------------------------------------------------------------
; DATOS partitura_BF5E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (27 bytes)
;   0xbf5e..0xbf79  (27 bytes)
DATA_partitura_BF5E:
	defb 0a2h,0c4h,0d1h,0aah,0feh,001h,0e9h,002h,0efh,0eeh,081h,0f8h,015h,0eah,006h,0ebh	; bf5e  ................
	defb 007h,01bh,031h,0dbh,002h,0d8h,0f0h,000h,0d2h,054h,072h	; bf6e  ..1......Tr

; ----------------------------------------------------------------------
; DATOS partitura_BF79: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (39 bytes)
;   0xbf79..0xbfa0  (39 bytes)
DATA_partitura_BF79:
	defb 0a4h,0d1h,01ah,004h,0d2h,0a7h,052h,074h,0a2h,0d1h,017h,007h,0d2h,054h,072h,0a4h	; bf79  ......Rt.....Tr.
	defb 0d1h,01ah,004h,0d2h,0a7h,0d1h,042h,057h,0d2h,0a4h,0d1h,01ah,03fh,014h,0d2h,0a2h	; bf89  ......BW....?...
	defb 0c4h,0d1h,032h,0c4h,032h,0c4h,032h	; bf99

; ----------------------------------------------------------------------
; DATOS partitura_BFA0: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA9 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (87 bytes)
;   0xbfa0..0xbff7  (87 bytes)
DATA_partitura_BFA0:
	defb 014h,0d2h,0a2h,0c4h,0a2h,0c4h,052h,074h,0a2h,0d1h,014h,0c2h,004h,0d2h,0a2h,0c4h	; bfa0  ......Rt........
	defb 052h,074h,0a2h,0d1h,017h,034h,0feh,001h,0e9h,002h,0efh,0eeh,081h,0c2h,0f8h,015h	; bfb0  Rt...4..........
	defb 0eah,006h,0ebh,007h,01bh,031h,0dbh,002h,0d1h,041h,0e9h,004h,05eh,0e9h,002h,094h	; bfc0  .....1...A..^...
	defb 05ah,034h,05ah,0c4h,0d2h,0a2h,0c4h,0a2h,0d1h,034h,022h,054h,032h,070h,086h,074h	; bfd0  Z4Z......4"T2p.t
	defb 0a4h,0f8h,011h,0eah,00ah,0d6h,006h,001h,0f0h,00fh,044h,0eah,008h,0a8h,0eah,004h	; bfe0  ..........D.....
	defb 0e9h,001h,091h,071h,0fdh,0ceh,0beh	; bff0

; ----------------------------------------------------------------------
; DATOS sin identificar  0xbff7..0xc000  (9 bytes)
DATA_BFF7:
	defb 021h,07eh,001h,00bh,00ch,000h,07dh,07bh,00ch	; bff7  !~....}{.
