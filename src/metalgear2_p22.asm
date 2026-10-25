; ==========================================================================
; METAL GEAR 2 SOLID SNAKE - Konami (1990) - MSX2 - MegaROM RC-767 de 512 KB (Konami SCC) - banco 22 (se ejecuta en 0xa000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x0a000


; ----------------------------------------------------------------------
; DATOS partitura_A000: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xa000..0xa006  (6 bytes)
DATA_partitura_A000:
	defb 0feh,004h,0e9h,001h,076h,0b6h	; a000

; ----------------------------------------------------------------------
; DATOS partitura_A006: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (16 bytes)
;   0xa006..0xa016  (16 bytes)
DATA_partitura_A006:
	defb 0a6h,076h,0b6h,0a6h,076h,0b6h,0a6h,073h,072h,076h,076h,0a6h,076h,0b6h,0a6h,0feh	; a006  .v..v..srvv.v...

; ----------------------------------------------------------------------
; DATOS partitura_A016: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (10 bytes)
;   0xa016..0xa020  (10 bytes)
DATA_partitura_A016:
	defb 004h,0e9h,001h,0f5h,0b6h,0a6h,076h,0a6h,0b6h,026h	; a016  ......v..&

; ----------------------------------------------------------------------
; DATOS partitura_A020: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xa020..0xa023  (3 bytes)
DATA_partitura_A020:
	defb 0a6h,0a6h,016h	; a020

; ----------------------------------------------------------------------
; DATOS partitura_A023: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xa023..0xa02e  (11 bytes)
DATA_partitura_A023:
	defb 0a6h,026h,076h,026h,0a6h,0a6h,0a6h,0a6h,026h,076h,016h	; a023  .&v&....&v.

; ----------------------------------------------------------------------
; DATOS partitura_A02E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa02e..0xa02f  (1 bytes)
DATA_partitura_A02E:
	defb 026h	; a02e

; ----------------------------------------------------------------------
; DATOS partitura_A02F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xa02f..0xa040  (17 bytes)
DATA_partitura_A02F:
	defb 0a6h,016h,076h,016h,0a6h,016h,076h,026h,016h,076h,026h,0b6h,0a6h,076h,0a6h,0b6h	; a02f  ..v...v&.v&..v..
	defb 0a6h	; a03f

; ----------------------------------------------------------------------
; DATOS partitura_A040: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xa040..0xa046  (6 bytes)
DATA_partitura_A040:
	defb 016h,0a6h,016h,0a6h,026h,076h	; a040

; ----------------------------------------------------------------------
; DATOS partitura_A046: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xa046..0xa051  (11 bytes)
DATA_partitura_A046:
	defb 026h,0a6h,026h,0a6h,0a6h,026h,076h,016h,026h,0a6h,026h	; a046  &.&..&v.&.&

; ----------------------------------------------------------------------
; DATOS partitura_A051: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (13 bytes)
;   0xa051..0xa05e  (13 bytes)
DATA_partitura_A051:
	defb 076h,016h,0a6h,016h,076h,016h,0a6h,016h,076h,0fbh,002h,0feh,004h	; a051  v...v...v....

; ----------------------------------------------------------------------
; DATOS partitura_A05E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa05e..0xa05f  (1 bytes)
DATA_partitura_A05E:
	defb 0e9h	; a05e

; ----------------------------------------------------------------------
; DATOS partitura_A05F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa05f..0xa060  (1 bytes)
DATA_partitura_A05F:
	defb 001h	; a05f

; ----------------------------------------------------------------------
; DATOS partitura_A060: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (9 bytes)
;   0xa060..0xa069  (9 bytes)
DATA_partitura_A060:
	defb 0f9h,031h,0a4h,0f9h,06dh,0a4h,0fdh,015h,0a0h	; a060  .1..m....

; ----------------------------------------------------------------------
; DATOS partitura_A069: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xa069..0xa082  (25 bytes)
DATA_partitura_A069:
	defb 0feh,001h,0e9h,001h,0eeh,084h,0f5h,0eah,00ah,0ebh,004h,069h,011h,0d4h,006h,076h	; a069  ...........i...v
	defb 0d3h,006h,0d4h,036h,0a6h,0d3h,036h,0d4h,056h	; a079  ...6..6.V

; ----------------------------------------------------------------------
; DATOS partitura_A082: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (13 bytes)
;   0xa082..0xa08f  (13 bytes)
DATA_partitura_A082:
	defb 0d3h,006h,056h,0d4h,066h,0d3h,016h,066h,0d4h,076h,0d3h,076h,016h	; a082  ..V.f..f.v.v.

; ----------------------------------------------------------------------
; DATOS partitura_A08F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xa08f..0xa091  (2 bytes)
DATA_partitura_A08F:
	defb 0d4h,016h	; a08f

; ----------------------------------------------------------------------
; DATOS partitura_A091: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (12 bytes)
;   0xa091..0xa09d  (12 bytes)
DATA_partitura_A091:
	defb 0efh,0feh,001h,0e9h,001h,0eeh,084h,0f5h,0ebh,005h,01bh,021h	; a091  ...........!

; ----------------------------------------------------------------------
; DATOS partitura_A09D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa09d..0xa0a5  (8 bytes)
DATA_partitura_A09D:
	defb 0eah,00ah,0d4h,00dh,0d3h,002h,0eah,004h	; a09d  ........

; ----------------------------------------------------------------------
; DATOS partitura_A0A5: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (34 bytes)
;   0xa0a5..0xa0c7  (34 bytes)
DATA_partitura_A0A5:
	defb 00ah,0eah,00bh,0d5h,0a6h,0d4h,00dh,03dh,05dh,07dh,066h,056h,036h,0ebh,009h,01bh	; a0a5  .......=]}fV6...
	defb 041h,00dh,0e9h,003h,036h,0e9h,001h,00dh,05dh,00dh,07dh,066h,05dh,0ebh,009h,01bh	; a0b5  A...6...].}f]...
	defb 021h,0d4h	; a0c5

; ----------------------------------------------------------------------
; DATOS partitura_A0C7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (20 bytes)
;   0xa0c7..0xa0db  (20 bytes)
DATA_partitura_A0C7:
	defb 01dh,0d3h,012h,0eah,004h,01ah,0eah,00bh,0d5h,0b6h,0d4h,01dh,04dh,06dh,08dh,076h	; a0c7  ............Mm.v
	defb 066h,046h,0ebh,009h	; a0d7

; ----------------------------------------------------------------------
; DATOS partitura_A0DB: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (14 bytes)
;   0xa0db..0xa0e9  (14 bytes)
DATA_partitura_A0DB:
	defb 01bh,041h,01dh,0e9h,003h,046h,0d8h,0e9h,001h,01dh,06dh,01dh,08dh,076h	; a0db  .A...F....m..v

; ----------------------------------------------------------------------
; DATOS partitura_A0E9: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (10 bytes)
;   0xa0e9..0xa0f3  (10 bytes)
DATA_partitura_A0E9:
	defb 06dh,0fbh,002h,0efh,0feh,001h,0eeh,084h,0eah,00ah	; a0e9  m.........

; ----------------------------------------------------------------------
; DATOS partitura_A0F3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (26 bytes)
;   0xa0f3..0xa10d  (26 bytes)
DATA_partitura_A0F3:
	defb 0ebh,009h,01bh,021h,0dbh,002h,0f9h,0a6h,0a4h,0f9h,0d1h,0a4h,0f9h,0a6h,0a4h,0d4h	; a0f3  ...!............
	defb 0e9h,003h,096h,0e9h,001h,0d3h,096h,0eah,007h,096h	; a103  ..........

; ----------------------------------------------------------------------
; DATOS partitura_A10D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (16 bytes)
;   0xa10d..0xa11d  (16 bytes)
DATA_partitura_A10D:
	defb 0eah,00ah,0d4h,09dh,0e9h,003h,0a6h,0e9h,001h,0d3h,0a6h,0eah,007h,0a6h,0eah,00ah	; a10d  ................

; ----------------------------------------------------------------------
; DATOS partitura_A11D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (23 bytes)
;   0xa11d..0xa134  (23 bytes)
DATA_partitura_A11D:
	defb 0d4h,0adh,0d3h,036h,0a6h,0d3h,036h,026h,0d4h,096h,026h,016h,086h,0d3h,016h,006h	; a11d  ...6..6&..&.....
	defb 0d4h,076h,016h,0d4h,066h,066h,0fdh	; a12d

; ----------------------------------------------------------------------
; DATOS partitura_A134: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xa134..0xa136  (2 bytes)
DATA_partitura_A134:
	defb 092h,0a0h	; a134

; ----------------------------------------------------------------------
; DATOS partitura_A136: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (5 bytes)
;   0xa136..0xa13b  (5 bytes)
DATA_partitura_A136:
	defb 0feh,001h,0e9h,001h,0eah	; a136

; ----------------------------------------------------------------------
; DATOS partitura_A13B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (47 bytes)
;   0xa13b..0xa16a  (47 bytes)
DATA_partitura_A13B:
	defb 00dh,0ebh,009h,03bh,011h,0f6h,0f4h,042h,046h,023h,023h,0d4h,006h,076h,0d3h,006h	; a13b  .......BF##..v..
	defb 0d4h,036h,0a6h,0d3h,036h,0d4h,056h,0d3h,006h,056h,0d4h,066h,0d3h,016h,066h,0d4h	; a14b  .6..6.V..V.f..f.
	defb 076h,0d3h,076h,0ebh,009h,03bh,031h,01dh,0feh,001h,0e9h,001h,0ebh,009h,03bh	; a15b  v.v...1........

; ----------------------------------------------------------------------
; DATOS partitura_A16A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xa16a..0xa170  (6 bytes)
DATA_partitura_A16A:
	defb 021h,0f4h,042h,046h,023h,023h	; a16a

; ----------------------------------------------------------------------
; DATOS partitura_A170: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (47 bytes)
;   0xa170..0xa19f  (47 bytes)
DATA_partitura_A170:
	defb 0f5h,0eah,00fh,0d4h,00dh,0d3h,002h,0eah,008h,00ah,0eah,00eh,0d5h,0a6h,0d4h,00dh	; a170  ................
	defb 03dh,05dh,07dh,066h,056h,036h,00dh,0e9h,003h,036h,0e9h,001h,00dh,05dh,00dh,07dh	; a180  =]}fV6...6...].}
	defb 066h,05dh,0d4h,01dh,0d3h,012h,0eah,008h,01ah,0eah,00eh,0d5h,0b6h,0d4h,01dh	; a190  f].............

; ----------------------------------------------------------------------
; DATOS partitura_A19F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (19 bytes)
;   0xa19f..0xa1b2  (19 bytes)
DATA_partitura_A19F:
	defb 04dh,06dh,08dh,076h,066h,046h,01dh,0e9h,003h,046h,0d8h,0e9h,001h,01dh,06dh,01dh	; a19f  Mm.vfF...F....m.
	defb 08dh,076h,06dh	; a1af

; ----------------------------------------------------------------------
; DATOS partitura_A1B2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa1b2..0xa1b3  (1 bytes)
DATA_partitura_A1B2:
	defb 0fbh	; a1b2

; ----------------------------------------------------------------------
; DATOS partitura_A1B3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xa1b3..0xa1b6  (3 bytes)
DATA_partitura_A1B3:
	defb 002h,0feh,001h	; a1b3

; ----------------------------------------------------------------------
; DATOS partitura_A1B6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (13 bytes)
;   0xa1b6..0xa1c3  (13 bytes)
DATA_partitura_A1B6:
	defb 0eah,00fh,0ebh,00ah,03bh,021h,0dbh,002h,0f4h,042h,046h,023h,023h	; a1b6  .....!...BF##

; ----------------------------------------------------------------------
; DATOS partitura_A1C3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xa1c3..0xa1c6  (3 bytes)
DATA_partitura_A1C3:
	defb 0f9h,0f9h,0a4h	; a1c3

; ----------------------------------------------------------------------
; DATOS partitura_A1C6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (13 bytes)
;   0xa1c6..0xa1d3  (13 bytes)
DATA_partitura_A1C6:
	defb 0f9h,024h,0a5h,0f9h,0f9h,0a4h,0f9h,04bh,0a5h,0dch,0fdh,063h,0a1h	; a1c6  .$.....K...c.

; ----------------------------------------------------------------------
; DATOS partitura_A1D3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (16 bytes)
;   0xa1d3..0xa1e3  (16 bytes)
DATA_partitura_A1D3:
	defb 0feh,001h,0f8h,054h,0e9h,001h,0eah,00ah,0ebh,024h,02ch,003h,0d3h,0a6h,0d4h,0a6h	; a1d3  ...T.....$,.....

; ----------------------------------------------------------------------
; DATOS partitura_A1E3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xa1e3..0xa1f5  (18 bytes)
DATA_partitura_A1E3:
	defb 0d3h,056h,0d2h,0a6h,0eah,009h,0d3h,0a6h,0d2h,056h,0d1h,0a6h,0d2h,0a6h,0eah,00ah	; a1e3  .V.......V......
	defb 0d1h,056h	; a1f3

; ----------------------------------------------------------------------
; DATOS partitura_A1F5: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (13 bytes)
;   0xa1f5..0xa202  (13 bytes)
DATA_partitura_A1F5:
	defb 0d2h,0a6h,0d3h,0a6h,0d2h,056h,0d3h,0a6h,0eah,009h,0d2h,056h,0a6h	; a1f5  .....V.....V.

; ----------------------------------------------------------------------
; DATOS partitura_A202: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (10 bytes)
;   0xa202..0xa20c  (10 bytes)
DATA_partitura_A202:
	defb 056h,0feh,001h,0f8h,054h,0e9h,001h,0eah,006h,0ebh	; a202  V...T.....

; ----------------------------------------------------------------------
; DATOS partitura_A20C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xa20c..0xa20f  (3 bytes)
DATA_partitura_A20C:
	defb 011h,01ah,002h	; a20c

; ----------------------------------------------------------------------
; DATOS partitura_A20F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xa20f..0xa220  (17 bytes)
DATA_partitura_A20F:
	defb 0f5h,0f9h,07dh,0a5h,0f9h,0d9h,0a5h,082h,0d3h,013h,0d4h,0b2h,0fbh,002h,0feh,001h	; a20f  ..}.............
	defb 0f8h	; a21f

; ----------------------------------------------------------------------
; DATOS partitura_A220: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xa220..0xa222  (2 bytes)
DATA_partitura_A220:
	defb 054h,0e9h	; a220

; ----------------------------------------------------------------------
; DATOS partitura_A222: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xa222..0xa234  (18 bytes)
DATA_partitura_A222:
	defb 001h,0eah,007h,0ebh,022h,01dh,002h,0f9h,034h,0a6h,0d0h,016h,0d1h,036h,0d1h,036h	; a222  ...."...4....6.6
	defb 0a6h,036h	; a232

; ----------------------------------------------------------------------
; DATOS partitura_A234: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xa234..0xa246  (18 bytes)
DATA_partitura_A234:
	defb 026h,096h,026h,016h,086h,016h,006h,076h,006h,0ebh,022h,027h,002h,0eah,009h,0f8h	; a234  &.&....v.."'....
	defb 002h,0d6h	; a244

; ----------------------------------------------------------------------
; DATOS partitura_A246: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (21 bytes)
;   0xa246..0xa25b  (21 bytes)
DATA_partitura_A246:
	defb 010h,001h,0f0h,00fh,042h,0d1h,093h,0eah,005h,092h,0eah,009h,093h,0eah,005h,0f0h	; a246  ....B...........
	defb 000h,0d8h,092h,0fdh,003h	; a256

; ----------------------------------------------------------------------
; DATOS partitura_A25B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa25b..0xa25c  (1 bytes)
DATA_partitura_A25B:
	defb 0a2h	; a25b

; ----------------------------------------------------------------------
; DATOS partitura_A25C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (27 bytes)
;   0xa25c..0xa277  (27 bytes)
DATA_partitura_A25C:
	defb 0feh,001h,0e9h,001h,0eah,006h,0f4h,042h,026h,026h,00dh,0f5h,0ebh,010h,022h,002h	; a25c  .......B&&....".
	defb 0d2h,076h,0ebh,014h,03ah,002h,006h,006h,0ebh,010h,022h	; a26c  .v..:....."

; ----------------------------------------------------------------------
; DATOS partitura_A277: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (26 bytes)
;   0xa277..0xa291  (26 bytes)
DATA_partitura_A277:
	defb 002h,0d2h,0a6h,0ebh,014h,03ah,002h,036h,036h,0ebh,010h,022h,002h,0d1h,006h,0ebh	; a277  .....:.66.."....
	defb 014h,03ah,002h,0d2h,056h,056h,0ebh,010h,022h,002h	; a287  .:..VV..".

; ----------------------------------------------------------------------
; DATOS partitura_A291: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xa291..0xa2a2  (17 bytes)
DATA_partitura_A291:
	defb 0d1h,016h,0ebh,014h,03ah,002h,0d2h,066h,066h,0ebh,010h,012h,002h,0d6h,004h,004h	; a291  ....:..ff.......
	defb 0d2h	; a2a1

; ----------------------------------------------------------------------
; DATOS partitura_A2A2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xa2a2..0xa2bb  (25 bytes)
DATA_partitura_A2A2:
	defb 07dh,0d8h,0ech,019h,000h,0d3h,0a0h,090h,070h,0feh,001h,0e9h,001h,0eah,006h,0efh	; a2a2  }.......p.......
	defb 0f4h,042h,026h,026h,00dh,0f5h,0ebh,010h,022h	; a2b2  .B&&...."

; ----------------------------------------------------------------------
; DATOS partitura_A2BB: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa2bb..0xa2bc  (1 bytes)
DATA_partitura_A2BB:
	defb 002h	; a2bb

; ----------------------------------------------------------------------
; DATOS partitura_A2BC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa2bc..0xa2c4  (8 bytes)
DATA_partitura_A2BC:
	defb 0d3h,076h,0ebh,014h,03ah,002h,006h,006h	; a2bc  .v..:...

; ----------------------------------------------------------------------
; DATOS partitura_A2C4: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (5 bytes)
;   0xa2c4..0xa2c9  (5 bytes)
DATA_partitura_A2C4:
	defb 006h,0ebh,010h,011h,002h	; a2c4

; ----------------------------------------------------------------------
; DATOS partitura_A2C9: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa2c9..0xa2d1  (8 bytes)
DATA_partitura_A2C9:
	defb 0e9h,003h,076h,0e9h,001h,0ebh,014h,02ah	; a2c9  ..v....*

; ----------------------------------------------------------------------
; DATOS partitura_A2D1: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xa2d1..0xa2dc  (11 bytes)
DATA_partitura_A2D1:
	defb 002h,006h,006h,006h,006h,0ebh,010h,022h,002h,07dh,0eah	; a2d1  .......".}.

; ----------------------------------------------------------------------
; DATOS partitura_A2DC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xa2dc..0xa2e7  (11 bytes)
DATA_partitura_A2DC:
	defb 005h,0ech,0adh,091h,071h,061h,040h,0eah,006h,0ebh,010h	; a2dc  ....qa@....

; ----------------------------------------------------------------------
; DATOS partitura_A2E7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xa2e7..0xa2ed  (6 bytes)
DATA_partitura_A2E7:
	defb 022h,002h,00dh,0e9h,003h,036h	; a2e7

; ----------------------------------------------------------------------
; DATOS partitura_A2ED: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (5 bytes)
;   0xa2ed..0xa2f2  (5 bytes)
DATA_partitura_A2ED:
	defb 0e9h,001h,00dh,05dh,00dh	; a2ed

; ----------------------------------------------------------------------
; DATOS partitura_A2F2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xa2f2..0xa2f5  (3 bytes)
DATA_partitura_A2F2:
	defb 07dh,066h,05dh	; a2f2

; ----------------------------------------------------------------------
; DATOS partitura_A2F5: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xa2f5..0xa2f8  (3 bytes)
DATA_partitura_A2F5:
	defb 0ebh,010h,022h	; a2f5

; ----------------------------------------------------------------------
; DATOS partitura_A2F8: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (5 bytes)
;   0xa2f8..0xa2fd  (5 bytes)
DATA_partitura_A2F8:
	defb 002h,0d3h,086h,0ebh,014h	; a2f8

; ----------------------------------------------------------------------
; DATOS partitura_A2FD: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa2fd..0xa305  (8 bytes)
DATA_partitura_A2FD:
	defb 03ah,002h,016h,016h,016h,0ebh,010h,022h	; a2fd  :......"

; ----------------------------------------------------------------------
; DATOS partitura_A305: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa305..0xa306  (1 bytes)
DATA_partitura_A305:
	defb 002h	; a305

; ----------------------------------------------------------------------
; DATOS partitura_A306: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa306..0xa30e  (8 bytes)
DATA_partitura_A306:
	defb 0e9h,003h,086h,0ebh,014h,02ah,002h,0e9h	; a306  .....*..

; ----------------------------------------------------------------------
; DATOS partitura_A30E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa30e..0xa316  (8 bytes)
DATA_partitura_A30E:
	defb 001h,016h,016h,016h,016h,0ebh,010h,022h	; a30e  ......."

; ----------------------------------------------------------------------
; DATOS partitura_A316: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa316..0xa317  (1 bytes)
DATA_partitura_A316:
	defb 002h	; a316

; ----------------------------------------------------------------------
; DATOS partitura_A317: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xa317..0xa31d  (6 bytes)
DATA_partitura_A317:
	defb 08dh,0bdh,0a6h,01dh,0e9h,003h	; a317

; ----------------------------------------------------------------------
; DATOS partitura_A31D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa31d..0xa31e  (1 bytes)
DATA_partitura_A31D:
	defb 046h	; a31d

; ----------------------------------------------------------------------
; DATOS partitura_A31E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa31e..0xa326  (8 bytes)
DATA_partitura_A31E:
	defb 0e9h,001h,01dh,06dh,01dh,08dh,076h,06dh	; a31e  ...m..vm

; ----------------------------------------------------------------------
; DATOS partitura_A326: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xa326..0xa33f  (25 bytes)
DATA_partitura_A326:
	defb 0fbh,002h,0feh,001h,0f6h,0f4h,026h,00dh,026h,00dh,0f9h,097h,0a6h,0f9h,0eah,0a6h	; a326  ......&.&.......
	defb 0f9h,02fh,0a7h,0f9h,081h,0a7h,0fdh,0abh,0a2h	; a336  ./.......

; ----------------------------------------------------------------------
; DATOS partitura_A33F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (94 bytes)
;   0xa33f..0xa39d  (94 bytes)
DATA_partitura_A33F:
	defb 0feh,001h,0e9h,001h,0eah,006h,0f4h,042h,026h,026h,00dh,0f5h,0ebh,010h,022h,002h	; a33f  .......B&&....".
	defb 0d2h,006h,0ebh,014h,03ah,002h,0d3h,076h,076h,0ebh,010h,022h,002h,0d2h,036h,0ebh	; a34f  ....:..vv.."..6.
	defb 014h,03ah,002h,0d3h,0a6h,0a6h,0ebh,010h,022h,002h,0d2h,056h,0ebh,014h,03ah,002h	; a35f  .:......"..V..:.
	defb 006h,006h,0ebh,010h,022h,002h,066h,0ebh,014h,03ah,002h,016h,016h,0ebh,010h,022h	; a36f  ....".f..:....."
	defb 002h,0d6h,004h,004h,0d2h,02dh,0d8h,0d3h,089h,070h,060h,040h,020h,0feh,001h,0e9h	; a37f  .....-...p`@ ...
	defb 001h,0eah,006h,0f6h,0f4h,042h,026h,026h,00dh,0f5h,0ebh,010h,022h,002h	; a38f  .....B&&....".

; ----------------------------------------------------------------------
; DATOS partitura_A39D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xa39d..0xa3a8  (11 bytes)
DATA_partitura_A39D:
	defb 0d2h,006h,0ebh,014h,03ah,002h,0d3h,076h,076h,076h,0ebh	; a39d  ....:..vvv.

; ----------------------------------------------------------------------
; DATOS partitura_A3A8: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (24 bytes)
;   0xa3a8..0xa3c0  (24 bytes)
DATA_partitura_A3A8:
	defb 010h,022h,002h,0e9h,003h,0d2h,006h,0e9h,001h,0ebh,014h,02ah,002h,0d3h,076h,076h	; a3a8  .".........*..vv
	defb 076h,076h,0ebh,010h,022h,002h,0d2h,00dh	; a3b8  vv.."...

; ----------------------------------------------------------------------
; DATOS partitura_A3C0: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (24 bytes)
;   0xa3c0..0xa3d8  (24 bytes)
DATA_partitura_A3C0:
	defb 0ech,0eah,005h,03dh,021h,001h,0d3h,0a1h,090h,0ebh,010h,022h,002h,0eah,006h,0d3h	; a3c0  ...=!......"....
	defb 07dh,0e9h,003h,0a6h,0e9h,001h,07dh,0d2h	; a3d0  }.....}.

; ----------------------------------------------------------------------
; DATOS partitura_A3D8: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (10 bytes)
;   0xa3d8..0xa3e2  (10 bytes)
DATA_partitura_A3D8:
	defb 00dh,0d3h,07dh,0d2h,02dh,016h,00dh,0ebh,010h,022h	; a3d8  ..}.-...."

; ----------------------------------------------------------------------
; DATOS partitura_A3E2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xa3e2..0xa3e8  (6 bytes)
DATA_partitura_A3E2:
	defb 002h,0d2h,016h,0ebh,014h,03ah	; a3e2

; ----------------------------------------------------------------------
; DATOS partitura_A3E8: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (168 bytes)
;   0xa3e8..0xa490  (168 bytes)
DATA_partitura_A3E8:
	defb 002h,0d3h,086h,086h,086h,0ebh,010h,022h,002h,0e9h,003h,0d2h,016h,0e9h,001h,0ebh	; a3e8  ......."........
	defb 014h,02ah,002h,0d3h,086h,086h,086h,086h,0ebh,010h,022h,002h,0d2h,01dh,04dh,036h	; a3f8  .*........"...M6
	defb 0d3h,08dh,0e9h,003h,0b6h,0e9h,001h,08dh,0d2h,01dh,0d3h,08dh,0d2h,03dh,026h,01dh	; a408  .............=&.
	defb 0fbh,002h,0feh,001h,0f6h,0f4h,026h,00dh,026h,00dh,0f9h,0e5h,0a7h,0f9h,03ah,0a8h	; a418  ......&.&.....:.
	defb 0f9h,087h,0a8h,0f9h,0dbh,0a8h,0fdh,08ch,0a3h,0feh,004h,0e9h,001h,0b6h,016h,0a6h	; a428  ................
	defb 07dh,0a6h,016h,026h,0a6h,0a6h,0a6h,076h,0a6h,026h,0a6h,076h,0a6h,016h,0a6h,016h	; a438  }..&...v.&.v....
	defb 0a6h,076h,0a6h,016h,076h,026h,076h,026h,0a6h,016h,0a6h,076h,016h,0a6h,016h,0a6h	; a448  .v..v&v&...v....
	defb 026h,0a6h,0a6h,016h,076h,026h,0a6h,016h,0a6h,026h,076h,0a6h,016h,0a6h,026h,076h	; a458  &...v&...&v...&v
	defb 076h,026h,076h,0a6h,0fah,0feh,004h,0e9h,001h,0b6h,016h,0a6h,07dh,0a6h,016h,026h	; a468  v&v.........}..&
	defb 0a6h,0a6h,0a6h,076h,0a6h,026h,0a6h,016h,0a6h,026h,076h,0a6h,016h,076h,0a6h,016h	; a478  ...v.&...&v..v..
	defb 076h,026h,076h,026h,0a6h,016h,0a6h,026h	; a488  v&v&...&

; ----------------------------------------------------------------------
; DATOS partitura_A490: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (37 bytes)
;   0xa490..0xa4b5  (37 bytes)
DATA_partitura_A490:
	defb 076h,0a6h,016h,0a6h,026h,076h,076h,026h,076h,076h,0f5h,0b6h,076h,076h,0fbh,003h	; a490  v...&vv&vv..vv..
	defb 026h,0a6h,0b6h,076h,076h,0fah,0e9h,001h,0d4h,07dh,076h,0d3h,076h,0eah,007h,076h	; a4a0  &..vv....}v.v..v
	defb 0eah,00ah,0d4h,056h,076h	; a4b0

; ----------------------------------------------------------------------
; DATOS partitura_A4B5: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xa4b5..0xa4c6  (17 bytes)
DATA_partitura_A4B5:
	defb 0a6h,0eah,007h,0a6h,0eah,00ah,076h,0c6h,0d3h,076h,02dh,0d3h,036h,086h,0d4h,08dh	; a4b5  ......v..v-.6...
	defb 0adh	; a4c5

; ----------------------------------------------------------------------
; DATOS partitura_A4C6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (22 bytes)
;   0xa4c6..0xa4dc  (22 bytes)
DATA_partitura_A4C6:
	defb 0d3h,086h,01dh,0eah,007h,016h,0eah,00ah,02dh,03dh,0fah,0d4h,07dh,076h,0d3h,076h	; a4c6  ........-=..}v.v
	defb 0eah,007h,076h,0eah,00ah,0d4h	; a4d6

; ----------------------------------------------------------------------
; DATOS partitura_A4DC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xa4dc..0xa4e7  (11 bytes)
DATA_partitura_A4DC:
	defb 056h,076h,0adh,07dh,0d3h,076h,02dh,0e9h,003h,0d4h,0a6h	; a4dc  Vv.}.v-....

; ----------------------------------------------------------------------
; DATOS partitura_A4E7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (9 bytes)
;   0xa4e7..0xa4f0  (9 bytes)
DATA_partitura_A4E7:
	defb 0e9h,001h,0d3h,0a6h,0eah,007h,0a6h,0eah,00ah	; a4e7  .........

; ----------------------------------------------------------------------
; DATOS partitura_A4F0: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa4f0..0xa4f1  (1 bytes)
DATA_partitura_A4F0:
	defb 0d4h	; a4f0

; ----------------------------------------------------------------------
; DATOS partitura_A4F1: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xa4f1..0xa4f3  (2 bytes)
DATA_partitura_A4F1:
	defb 0adh,0d3h	; a4f1

; ----------------------------------------------------------------------
; DATOS partitura_A4F3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa4f3..0xa4fb  (8 bytes)
DATA_partitura_A4F3:
	defb 01dh,0d4h,0a6h,05dh,04dh,0fah,0e9h,001h	; a4f3  ...]M...

; ----------------------------------------------------------------------
; DATOS partitura_A4FB: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa4fb..0xa4fc  (1 bytes)
DATA_partitura_A4FB:
	defb 0d5h	; a4fb

; ----------------------------------------------------------------------
; DATOS partitura_A4FC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa4fc..0xa4fd  (1 bytes)
DATA_partitura_A4FC:
	defb 07dh	; a4fc

; ----------------------------------------------------------------------
; DATOS partitura_A4FD: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xa4fd..0xa504  (7 bytes)
DATA_partitura_A4FD:
	defb 076h,0d4h,076h,0eah,009h,076h,0eah	; a4fd

; ----------------------------------------------------------------------
; DATOS partitura_A504: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa504..0xa505  (1 bytes)
DATA_partitura_A504:
	defb 00dh	; a504

; ----------------------------------------------------------------------
; DATOS partitura_A505: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa505..0xa50d  (8 bytes)
DATA_partitura_A505:
	defb 0d5h,056h,076h,0a6h,0eah,009h,0a6h,0eah	; a505  .Vv.....

; ----------------------------------------------------------------------
; DATOS partitura_A50D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa50d..0xa515  (8 bytes)
DATA_partitura_A50D:
	defb 00fh,076h,0c6h,0d4h,076h,02dh,0d4h,036h	; a50d  .v..v-.6

; ----------------------------------------------------------------------
; DATOS partitura_A515: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa515..0xa51d  (8 bytes)
DATA_partitura_A515:
	defb 086h,0d5h,08dh,0adh,0d4h,086h,01dh,0eah	; a515  ........

; ----------------------------------------------------------------------
; DATOS partitura_A51D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa51d..0xa525  (8 bytes)
DATA_partitura_A51D:
	defb 009h,016h,0eah,00fh,02dh,03dh,0fah,0d5h	; a51d  ....-=..

; ----------------------------------------------------------------------
; DATOS partitura_A525: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xa525..0xa52b  (6 bytes)
DATA_partitura_A525:
	defb 07dh,076h,0d4h,076h,0eah,007h	; a525

; ----------------------------------------------------------------------
; DATOS partitura_A52B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xa52b..0xa52d  (2 bytes)
DATA_partitura_A52B:
	defb 076h,0eah	; a52b

; ----------------------------------------------------------------------
; DATOS partitura_A52D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa52d..0xa52e  (1 bytes)
DATA_partitura_A52D:
	defb 00fh	; a52d

; ----------------------------------------------------------------------
; DATOS partitura_A52E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa52e..0xa52f  (1 bytes)
DATA_partitura_A52E:
	defb 0d5h	; a52e

; ----------------------------------------------------------------------
; DATOS partitura_A52F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa52f..0xa537  (8 bytes)
DATA_partitura_A52F:
	defb 056h,076h,0adh,07dh,0d4h,076h,02dh,0e9h	; a52f  Vv.}.v-.

; ----------------------------------------------------------------------
; DATOS partitura_A537: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa537..0xa53f  (8 bytes)
DATA_partitura_A537:
	defb 003h,0d5h,0a6h,0e9h,001h,0d4h,0a6h,0eah	; a537  ........

; ----------------------------------------------------------------------
; DATOS partitura_A53F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa53f..0xa547  (8 bytes)
DATA_partitura_A53F:
	defb 009h,0a6h,0eah,00fh,0d5h,0adh,0d4h,01dh	; a53f  ........

; ----------------------------------------------------------------------
; DATOS partitura_A547: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa547..0xa54f  (8 bytes)
DATA_partitura_A547:
	defb 0a6h,05dh,04dh,0fah,0d5h,0e9h,003h,096h	; a547  .]M.....

; ----------------------------------------------------------------------
; DATOS partitura_A54F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa54f..0xa557  (8 bytes)
DATA_partitura_A54F:
	defb 0e9h,001h,0d4h,096h,0eah,009h,096h,0eah	; a54f  ........

; ----------------------------------------------------------------------
; DATOS partitura_A557: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (9 bytes)
;   0xa557..0xa560  (9 bytes)
DATA_partitura_A557:
	defb 00fh,0d5h,09dh,0e9h,003h,0a6h,0e9h,001h,0d4h	; a557  .........

; ----------------------------------------------------------------------
; DATOS partitura_A560: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xa560..0xa562  (2 bytes)
DATA_partitura_A560:
	defb 0a6h,0eah	; a560

; ----------------------------------------------------------------------
; DATOS partitura_A562: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (10 bytes)
;   0xa562..0xa56c  (10 bytes)
DATA_partitura_A562:
	defb 009h,0a6h,0eah,00fh,0d5h,0adh,0d4h,036h,0a6h,0d3h	; a562  .......6..

; ----------------------------------------------------------------------
; DATOS partitura_A56C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xa56c..0xa573  (7 bytes)
DATA_partitura_A56C:
	defb 036h,026h,0d4h,096h,026h,016h,086h	; a56c

; ----------------------------------------------------------------------
; DATOS partitura_A573: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xa573..0xa57a  (7 bytes)
DATA_partitura_A573:
	defb 0d3h,016h,006h,0d4h,076h,016h,0d4h	; a573

; ----------------------------------------------------------------------
; DATOS partitura_A57A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xa57a..0xa580  (6 bytes)
DATA_partitura_A57A:
	defb 066h,066h,0fah,0d3h,003h,0d4h	; a57a

; ----------------------------------------------------------------------
; DATOS partitura_A580: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (19 bytes)
;   0xa580..0xa593  (19 bytes)
DATA_partitura_A580:
	defb 0a2h,0d3h,053h,022h,0d3h,053h,032h,0a3h,072h,0d2h,003h,0d3h,0a2h,0d2h,053h,022h	; a580  ..S".S2.r.....S"
	defb 053h,032h,0a3h	; a590

; ----------------------------------------------------------------------
; DATOS partitura_A593: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa593..0xa59b  (8 bytes)
DATA_partitura_A593:
	defb 072h,0d1h,003h,0d2h,0a2h,0d1h,053h,022h	; a593  r.....S"

; ----------------------------------------------------------------------
; DATOS partitura_A59B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (34 bytes)
;   0xa59b..0xa5bd  (34 bytes)
DATA_partitura_A59B:
	defb 053h,032h,0a3h,072h,0d0h,003h,0d1h,0a2h,0d0h,053h,022h,0d1h,0a3h,0d0h,002h,0d1h	; a59b  S2.r.....S".....
	defb 073h,0a2h,033h,052h,023h,032h,0d2h,0a3h,0d1h,002h,0d2h,073h,0a2h,033h,052h,023h	; a5ab  s.3R#2.....s.3R#
	defb 032h,0d3h	; a5bb

; ----------------------------------------------------------------------
; DATOS partitura_A5BD: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xa5bd..0xa5c3  (6 bytes)
DATA_partitura_A5BD:
	defb 0a3h,0d2h,002h,0d3h,073h,0a2h	; a5bd

; ----------------------------------------------------------------------
; DATOS partitura_A5C3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (20 bytes)
;   0xa5c3..0xa5d7  (20 bytes)
DATA_partitura_A5C3:
	defb 033h,052h,023h,032h,0d4h,0a3h,0d3h,002h,0d4h,073h,0a2h,053h,072h,033h,052h,0a3h	; a5c3  3R#2.....s.Sr3R.
	defb 072h,0d3h,003h,0d4h	; a5d3

; ----------------------------------------------------------------------
; DATOS partitura_A5D7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (16 bytes)
;   0xa5d7..0xa5e7  (16 bytes)
DATA_partitura_A5D7:
	defb 0a2h,0fah,0ebh,024h,02ah,002h,0d3h,013h,0d4h,0b2h,0d3h,063h,032h,0d3h,063h,042h	; a5d7  ...$*......c2.cB

; ----------------------------------------------------------------------
; DATOS partitura_A5E7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (37 bytes)
;   0xa5e7..0xa60c  (37 bytes)
DATA_partitura_A5E7:
	defb 0b3h,082h,0d2h,013h,0d3h,0b2h,0d2h,063h,032h,063h,042h,0b3h,082h,0d1h,013h,0d2h	; a5e7  .......c2cB.....
	defb 0b2h,0d1h,063h,032h,063h,032h,0b3h,082h,0d0h,013h,0d1h,0b2h,0d0h,063h,032h,0d1h	; a5f7  ..c2c2.......c2.
	defb 0b3h,0d0h,012h,0d1h,083h	; a607

; ----------------------------------------------------------------------
; DATOS partitura_A60C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xa60c..0xa617  (11 bytes)
DATA_partitura_A60C:
	defb 0b2h,043h,062h,033h,042h,0d2h,0b3h,0d1h,012h,0d2h,083h	; a60c  .Cb3B......

; ----------------------------------------------------------------------
; DATOS partitura_A617: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xa617..0xa630  (25 bytes)
DATA_partitura_A617:
	defb 0b2h,043h,062h,033h,042h,0d3h,0b3h,0d2h,012h,0d3h,083h,0b2h,043h,062h,033h,042h	; a617  .Cb3B.......Cb3B
	defb 0d4h,0b3h,0d3h,012h,0d4h,083h,0b2h,063h,082h	; a627  .......c.

; ----------------------------------------------------------------------
; DATOS partitura_A630: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (36 bytes)
;   0xa630..0xa654  (36 bytes)
DATA_partitura_A630:
	defb 043h,062h,0b3h,0fah,0d1h,0f5h,0a6h,006h,056h,006h,0fbh,003h,0a6h,006h,0f5h,0b6h	; a630  Cb......V.......
	defb 016h,066h,016h,0fbh,003h,0b6h,016h,0f5h,0a6h,006h,056h,006h,0fbh,003h,0a6h,006h	; a640  .f........V.....
	defb 0f5h,0d0h,016h,0d1h	; a650

; ----------------------------------------------------------------------
; DATOS partitura_A654: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (41 bytes)
;   0xa654..0xa67d  (41 bytes)
DATA_partitura_A654:
	defb 036h,086h,036h,0fbh,002h,0eah,00bh,0f8h,024h,0ebh,021h,017h,002h,0d2h,086h,0d1h	; a654  6.6.....$.!.....
	defb 016h,056h,0b6h,0a6h,036h,0f8h,054h,0eah,007h,0ebh,022h,01dh,002h,0d1h,0f5h,0a6h	; a664  .V..6.T...".....
	defb 006h,056h,006h,0fbh,003h,0a6h,006h,0f5h,0b6h	; a674  .V.......

; ----------------------------------------------------------------------
; DATOS partitura_A67D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (16 bytes)
;   0xa67d..0xa68d  (16 bytes)
DATA_partitura_A67D:
	defb 016h,066h,016h,0fbh,003h,0b6h,016h,0d0h,006h,0d1h,026h,076h,026h,0d0h,006h,0d1h	; a67d  .f........&v&...

; ----------------------------------------------------------------------
; DATOS partitura_A68D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (52 bytes)
;   0xa68d..0xa6c1  (52 bytes)
DATA_partitura_A68D:
	defb 026h,076h,036h,0d0h,016h,0d1h,036h,086h,036h,0fah,0efh,0e9h,001h,0eah,007h,0ebh	; a68d  &v6...6.6.......
	defb 014h,03ah,002h,0d3h,026h,026h,026h,026h,0ebh,010h,022h,002h,07dh,0ebh,014h,03ah	; a69d  .:..&&&&..".}..:
	defb 002h,026h,026h,026h,0ebh,010h,022h,002h,07dh,026h,07dh,0ebh,014h,03ah,002h,036h	; a6ad  .&&&..".}&}..:.6
	defb 036h,036h,036h,0ebh	; a6bd

; ----------------------------------------------------------------------
; DATOS partitura_A6C1: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xa6c1..0xa6d2  (17 bytes)
DATA_partitura_A6C1:
	defb 010h,022h,002h,08dh,0ebh,014h,03ah,002h,036h,0f8h,002h,0eeh,001h,0f0h,00fh,052h	; a6c1  ."....:.6......R
	defb 0eah	; a6d1

; ----------------------------------------------------------------------
; DATOS partitura_A6D2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (38 bytes)
;   0xa6d2..0xa6f8  (38 bytes)
DATA_partitura_A6D2:
	defb 009h,0ebh,014h,029h,002h,0e9h,003h,0d6h,010h,001h,0d2h,0b6h,0e9h,001h,0d1h,00dh	; a6d2  ...)............
	defb 01dh,0d8h,0f0h,000h,0efh,0eah,008h,0fah,0eah,007h,0ebh,014h,03ah,002h,0f4h,026h	; a6e2  ............:..&
	defb 00dh,026h,00dh,0d3h,026h,026h	; a6f2

; ----------------------------------------------------------------------
; DATOS partitura_A6F8: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xa6f8..0xa6ff  (7 bytes)
DATA_partitura_A6F8:
	defb 026h,026h,0ebh,010h,022h,002h,07dh	; a6f8

; ----------------------------------------------------------------------
; DATOS partitura_A6FF: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (24 bytes)
;   0xa6ff..0xa717  (24 bytes)
DATA_partitura_A6FF:
	defb 0ebh,014h,03ah,002h,026h,026h,026h,0ebh,010h,022h,002h,07dh,026h,07dh,0d6h,019h	; a6ff  ..:.&&&..".}&}..
	defb 006h,0e9h,003h,0a6h,0e9h,001h,0d8h,0ebh	; a70f  ........

; ----------------------------------------------------------------------
; DATOS partitura_A717: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (34 bytes)
;   0xa717..0xa739  (34 bytes)
DATA_partitura_A717:
	defb 014h,03ah,002h,056h,056h,056h,056h,0ebh,010h,022h,002h,0adh,0ebh,014h,03ah,002h	; a717  .:.VVVV.."....:.
	defb 056h,0ebh,010h,022h,002h,0adh,09dh,0fah,0e9h,001h,0eah,007h,0ebh,014h,03ah,002h	; a727  V.."..........:.
	defb 0d3h,026h	; a737

; ----------------------------------------------------------------------
; DATOS partitura_A739: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (15 bytes)
;   0xa739..0xa748  (15 bytes)
DATA_partitura_A739:
	defb 026h,026h,026h,0ebh,010h,022h,002h,07dh,0ebh,014h,03ah,002h,026h,026h,026h	; a739  &&&..".}..:.&&&

; ----------------------------------------------------------------------
; DATOS partitura_A748: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (50 bytes)
;   0xa748..0xa77a  (50 bytes)
DATA_partitura_A748:
	defb 0ebh,010h,022h,002h,07dh,026h,07dh,0ebh,014h,03ah,002h,036h,036h,036h,036h,0ebh	; a748  ..".}&}..:.6666.
	defb 010h,022h,002h,08dh,0ebh,014h,03ah,002h,036h,0f8h,002h,0eah,009h,0ebh,014h,029h	; a758  ."....:.6......)
	defb 002h,0eeh,001h,0d6h,010h,001h,0f0h,00fh,052h,0e9h,003h,0d2h,0b6h,0e9h,001h,0d1h	; a768  ........R.......
	defb 00dh,01dh	; a778

; ----------------------------------------------------------------------
; DATOS partitura_A77A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (31 bytes)
;   0xa77a..0xa799  (31 bytes)
DATA_partitura_A77A:
	defb 0f0h,000h,0d8h,0eah,007h,0efh,0fah,0ebh,014h,03ah,002h,0f6h,0f4h,026h,00dh,026h	; a77a  .........:...&.&
	defb 00dh,0d3h,046h,046h,046h,046h,0ebh,010h,022h,002h,09dh,046h,0adh,0ebh,014h	; a78a  ..FFFF.."..F...

; ----------------------------------------------------------------------
; DATOS partitura_A799: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xa799..0xa79b  (2 bytes)
DATA_partitura_A799:
	defb 03ah,002h	; a799

; ----------------------------------------------------------------------
; DATOS partitura_A79B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (134 bytes)
;   0xa79b..0xa821  (134 bytes)
DATA_partitura_A79B:
	defb 056h,056h,056h,0ebh,010h,022h,002h,0adh,0ebh,022h,027h,002h,0d3h,036h,0a6h,0d2h	; a79b  VVV.."..."'..6..
	defb 036h,0ebh,010h,022h,002h,026h,0ebh,022h,027h,002h,0d3h,096h,026h,016h,086h,0d2h	; a7ab  6..".&."'...&...
	defb 016h,0ebh,010h,022h,002h,006h,0ebh,022h,027h,002h,0d3h,076h,006h,0f8h,002h,0ech	; a7bb  ..."..."'..v....
	defb 0eeh,001h,0f0h,00fh,052h,0d6h,010h,001h,0d2h,0eah,009h,0a2h,0eah,003h,0a3h,0eah	; a7cb  ....R...........
	defb 009h,0a4h,0eah,003h,0a1h,0f0h,000h,0d8h,0efh,0fah,0efh,0feh,001h,0e9h,001h,0eah	; a7db  ................
	defb 007h,0ebh,014h,03ah,002h,0d4h,076h,076h,076h,076h,0ebh,010h,022h,002h,0d3h,02dh	; a7eb  ...:..vvvv.."..-
	defb 0ebh,014h,03ah,002h,0d4h,076h,076h,076h,0ebh,010h,022h,002h,0d3h,02dh,0d4h,076h	; a7fb  ..:..vvv.."..-.v
	defb 0d3h,02dh,0ebh,014h,03ah,002h,0d4h,086h,086h,086h,086h,0ebh,010h,022h,002h,0d3h	; a80b  .-..:........"..
	defb 03dh,0d4h,086h,0f8h,002h,0eah	; a81b

; ----------------------------------------------------------------------
; DATOS partitura_A821: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (15 bytes)
;   0xa821..0xa830  (15 bytes)
DATA_partitura_A821:
	defb 009h,0ebh,014h,029h,002h,0f0h,00fh,052h,0d6h,010h,001h,0e9h,003h,0d1h,066h	; a821  ...)...R......f

; ----------------------------------------------------------------------
; DATOS partitura_A830: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (21 bytes)
;   0xa830..0xa845  (21 bytes)
DATA_partitura_A830:
	defb 0e9h,001h,07dh,08dh,0d8h,0f0h,000h,0eah,007h,0fah,0ebh,014h,03ah,002h,0f6h,0f4h	; a830  ..}.........:...
	defb 026h,00dh,026h,00dh,0d4h	; a840

; ----------------------------------------------------------------------
; DATOS partitura_A845: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (22 bytes)
;   0xa845..0xa85b  (22 bytes)
DATA_partitura_A845:
	defb 076h,076h,076h,076h,0ebh,010h,022h,002h,0d3h,02dh,0ebh,014h,03ah,002h,0d4h,076h	; a845  vvvv.."..-..:..v
	defb 076h,076h,0ebh,010h,022h,002h	; a855

; ----------------------------------------------------------------------
; DATOS partitura_A85B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (21 bytes)
;   0xa85b..0xa870  (21 bytes)
DATA_partitura_A85B:
	defb 0d3h,02dh,0d4h,076h,0d3h,02dh,0d6h,019h,006h,0e9h,003h,056h,0e9h,001h,0d8h,0ebh	; a85b  .-.v.-.....V....
	defb 014h,03ah,002h,0d4h,0a6h	; a86b

; ----------------------------------------------------------------------
; DATOS partitura_A870: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (22 bytes)
;   0xa870..0xa886  (22 bytes)
DATA_partitura_A870:
	defb 0a6h,0a6h,0a6h,0ebh,010h,022h,002h,0d3h,05dh,0ebh,014h,03ah,002h,0d4h,056h,0ebh	; a870  ....."..]..:..V.
	defb 010h,022h,002h,0d3h,05dh,04dh	; a880

; ----------------------------------------------------------------------
; DATOS partitura_A886: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (19 bytes)
;   0xa886..0xa899  (19 bytes)
DATA_partitura_A886:
	defb 0fah,0feh,001h,0e9h,001h,0eah,008h,0ebh,014h,03ah,002h,0d4h,076h,076h,076h,076h	; a886  .........:..vvvv
	defb 0ebh,010h,022h	; a896

; ----------------------------------------------------------------------
; DATOS partitura_A899: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xa899..0xa89c  (3 bytes)
DATA_partitura_A899:
	defb 002h,0d3h,02dh	; a899

; ----------------------------------------------------------------------
; DATOS partitura_A89C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (26 bytes)
;   0xa89c..0xa8b6  (26 bytes)
DATA_partitura_A89C:
	defb 0ebh,014h,03ah,002h,0d4h,076h,076h,076h,0ebh,010h,022h,002h,0d3h,02dh,0d4h,076h	; a89c  ..:..vvv.."..-.v
	defb 0d3h,02dh,0ebh,014h,03ah,002h,0d4h,086h,086h,086h	; a8ac  .-..:.....

; ----------------------------------------------------------------------
; DATOS partitura_A8B6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xa8b6..0xa8b8  (2 bytes)
DATA_partitura_A8B6:
	defb 086h,0ebh	; a8b6

; ----------------------------------------------------------------------
; DATOS partitura_A8B8: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (19 bytes)
;   0xa8b8..0xa8cb  (19 bytes)
DATA_partitura_A8B8:
	defb 010h,022h,002h,0d3h,03dh,0d4h,086h,0f8h,002h,0eah,009h,0ebh,014h,029h,002h,0e9h	; a8b8  ."..=........)..
	defb 003h,0f0h,00fh	; a8c8

; ----------------------------------------------------------------------
; DATOS partitura_A8CB: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xa8cb..0xa8d6  (11 bytes)
DATA_partitura_A8CB:
	defb 052h,0d6h,010h,001h,0d1h,066h,0e9h,001h,07dh,08dh,0f0h	; a8cb  R....f..}..

; ----------------------------------------------------------------------
; DATOS partitura_A8D6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xa8d6..0xa8d9  (3 bytes)
DATA_partitura_A8D6:
	defb 000h,0d8h,0eah	; a8d6

; ----------------------------------------------------------------------
; DATOS partitura_A8D9: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (29 bytes)
;   0xa8d9..0xa8f6  (29 bytes)
DATA_partitura_A8D9:
	defb 008h,0fah,0ebh,014h,03ah,002h,0f6h,0f4h,026h,00dh,026h,00dh,0d4h,096h,096h,096h	; a8d9  ....:...&.&.....
	defb 096h,0ebh,010h,022h,002h,0d3h,04dh,0d4h,096h,0d3h,05dh,0ebh,014h	; a8e9  ..."..M...]..

; ----------------------------------------------------------------------
; DATOS partitura_A8F6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (36 bytes)
;   0xa8f6..0xa91a  (36 bytes)
DATA_partitura_A8F6:
	defb 03ah,002h,0d4h,0a6h,0a6h,0a6h,0ebh,010h,022h,002h,0d3h,05dh,0ebh,022h,027h,002h	; a8f6  :......."..]."'.
	defb 0d4h,0a6h,0d3h,036h,0a6h,0ebh,010h,022h,002h,096h,0ebh,022h,027h,002h,026h,0d4h	; a906  ...6..."..."'.&.
	defb 096h,086h,0d3h,016h	; a916

; ----------------------------------------------------------------------
; DATOS partitura_A91A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (29 bytes)
;   0xa91a..0xa937  (29 bytes)
DATA_partitura_A91A:
	defb 086h,0ebh,010h,022h,002h,076h,0ebh,022h,027h,002h,006h,0d4h,076h,0ech,0f8h,002h	; a91a  ...".v."'...v...
	defb 0f0h,00fh,052h,0d6h,010h,001h,0d1h,0eah,009h,034h,0ech,0eah,004h	; a92a  ..R......4...

; ----------------------------------------------------------------------
; DATOS partitura_A937: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x77 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xa937..0xa942  (11 bytes)
DATA_partitura_A937:
	defb 031h,0eah,009h,034h,0eah,004h,031h,0f0h,000h,0d8h,0fah	; a937  1..4..1....

; ----------------------------------------------------------------------
; DATOS partitura_A942: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (16 bytes)
;   0xa942..0xa952  (16 bytes)
DATA_partitura_A942:
	defb 0feh,004h,0e9h,001h,0d1h,0f5h,064h,063h,064h,0fbh,003h,0f5h,074h,073h,074h,0fbh	; a942  ......dcd...tst.

; ----------------------------------------------------------------------
; DATOS partitura_A952: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (37 bytes)
;   0xa952..0xa977  (37 bytes)
DATA_partitura_A952:
	defb 003h,084h,083h,084h,094h,093h,094h,0e9h,001h,0d0h,0b4h,0d1h,073h,074h,074h,073h	; a952  ............stts
	defb 074h,0f5h,074h,073h,074h,074h,073h,074h,0fbh,003h,0d0h,028h,079h,0a8h,0d1h,072h	; a962  t.tsttst...(y..r
	defb 083h,0e9h,007h,090h,090h	; a972

; ----------------------------------------------------------------------
; DATOS partitura_A977: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa977..0xa978  (1 bytes)
DATA_partitura_A977:
	defb 090h	; a977

; ----------------------------------------------------------------------
; DATOS partitura_A978: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (37 bytes)
;   0xa978..0xa99d  (37 bytes)
DATA_partitura_A978:
	defb 093h,0d0h,0b3h,000h,000h,0a0h,0a0h,071h,0a0h,0a0h,000h,000h,0a0h,0a0h,071h,0a0h	; a978  .......q......q.
	defb 0a0h,000h,000h,000h,0a0h,071h,011h,000h,000h,000h,0a0h,071h,021h,0e9h,001h,0f5h	; a988  .....q.....q!...
	defb 0d1h,074h,073h,074h,074h	; a998

; ----------------------------------------------------------------------
; DATOS partitura_A99D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (79 bytes)
;   0xa99d..0xa9ec  (79 bytes)
DATA_partitura_A99D:
	defb 073h,074h,0fbh,004h,0d0h,028h,079h,0a8h,0d1h,072h,083h,0e9h,007h,090h,090h,090h	; a99d  st...(y..r......
	defb 093h,0d0h,0a3h,000h,000h,0a0h,0a0h,071h,0a0h,0a0h,000h,000h,0a0h,0a0h,071h,0a0h	; a9ad  .......q......q.
	defb 0a0h,023h,070h,070h,070h,070h,073h,0e9h,001h,0d1h,062h,063h,072h,073h,082h,083h	; a9bd  .#pppps...bcrs..
	defb 092h,093h,0f5h,0e9h,007h,0d1h,093h,060h,070h,080h,080h,093h,060h,070h,080h,080h	; a9cd  .......`p...`p..
	defb 093h,0e9h,001h,062h,063h,076h,086h,086h,0e9h,007h,091h,091h,0e9h,001h,063h	; a9dd  ...bcv........c

; ----------------------------------------------------------------------
; DATOS partitura_A9EC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa9ec..0xa9ed  (1 bytes)
DATA_partitura_A9EC:
	defb 063h	; a9ec

; ----------------------------------------------------------------------
; DATOS partitura_A9ED: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (10 bytes)
;   0xa9ed..0xa9f7  (10 bytes)
DATA_partitura_A9ED:
	defb 073h,073h,083h,083h,083h,0fbh,002h,0e9h,007h,0d1h	; a9ed  ss........

; ----------------------------------------------------------------------
; DATOS partitura_A9F7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xa9f7..0xa9fe  (7 bytes)
DATA_partitura_A9F7:
	defb 093h,060h,070h,080h,080h,093h,060h	; a9f7

; ----------------------------------------------------------------------
; DATOS partitura_A9FE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (59 bytes)
;   0xa9fe..0xaa39  (59 bytes)
DATA_partitura_A9FE:
	defb 070h,080h,080h,093h,0e9h,001h,062h,063h,076h,086h,086h,0e9h,007h,091h,091h,0e9h	; a9fe  p.....bcv.......
	defb 001h,063h,063h,073h,073h,083h,083h,083h,0e9h,007h,093h,060h,070h,080h,080h,091h	; aa0e  .ccss......`p...
	defb 091h,060h,090h,070h,080h,0e9h,001h,063h,063h,063h,063h,063h,063h,063h,063h,063h	; aa1e  .`.p...ccccccccc
	defb 063h,063h,063h,063h,063h,098h,009h,083h,084h,098h,099h	; aa2e  ccccc......

; ----------------------------------------------------------------------
; DATOS partitura_AA39: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (5 bytes)
;   0xaa39..0xaa3e  (5 bytes)
DATA_partitura_AA39:
	defb 098h,0e9h,001h,0d1h,063h	; aa39

; ----------------------------------------------------------------------
; DATOS partitura_AA3E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xaa3e..0xaa42  (4 bytes)
DATA_partitura_AA3E:
	defb 063h,063h,063h,063h	; aa3e

; ----------------------------------------------------------------------
; DATOS partitura_AA42: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (79 bytes)
;   0xaa42..0xaa91  (79 bytes)
DATA_partitura_AA42:
	defb 063h,063h,0e9h,007h,091h,0e9h,001h,063h,063h,063h,063h,063h,063h,063h,0e9h,007h	; aa42  cc.....ccccccc..
	defb 091h,091h,091h,0e9h,001h,098h,099h,098h,0e9h,007h,0d0h,0a0h,0a0h,0a0h,0a0h,063h	; aa52  ...............c
	defb 000h,0a0h,000h,0a0h,000h,0a0h,000h,0a0h,000h,0a0h,000h,0a0h,020h,0a0h,020h,0a0h	; aa62  ............ . .
	defb 020h,0a0h,020h,0a0h,062h,0a0h,0e9h,001h,0d1h,063h,063h,073h,073h,083h,083h,093h	; aa72   . .b....ccss...
	defb 098h,084h,084h,088h,098h,099h,098h,0e9h,001h,0d1h,063h,063h,063h,063h,063h	; aa82  ..........ccccc

; ----------------------------------------------------------------------
; DATOS partitura_AA91: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (75 bytes)
;   0xaa91..0xaadc  (75 bytes)
DATA_partitura_AA91:
	defb 063h,063h,0e9h,007h,091h,0e9h,001h,063h,063h,063h,063h,063h,063h,063h,0e9h,007h	; aa91  cc.....ccccccc..
	defb 091h,091h,091h,0e9h,001h,098h,099h,098h,0e9h,007h,0d0h,0a0h,0a0h,0a0h,0a0h,063h	; aaa1  ...............c
	defb 000h,0a0h,000h,0a0h,0f5h,000h,0a1h,0a0h,0d1h,091h,0d0h,0a0h,0a0h,0e9h,001h,008h	; aab1  ................
	defb 0a9h,0a8h,0e9h,007h,0d1h,060h,070h,0d0h,0a0h,0a0h,0fbh,002h,0a3h,0d0h,050h,050h	; aac1  .....`p.......PP
	defb 050h,050h,063h,000h,070h,0a0h,0a0h,000h,000h,0a0h,0d1h	; aad1  PPc.p......

; ----------------------------------------------------------------------
; DATOS partitura_AADC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xaadc..0xaae4  (8 bytes)
DATA_partitura_AADC:
	defb 090h,0e9h,001h,098h,099h,098h,098h,084h	; aadc  ........

; ----------------------------------------------------------------------
; DATOS partitura_AAE4: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xaae4..0xaaec  (8 bytes)
DATA_partitura_AAE4:
	defb 084h,088h,098h,099h,098h,0fdh,059h,0a9h	; aae4  ......Y.

; ----------------------------------------------------------------------
; DATOS partitura_AAEC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (75 bytes)
;   0xaaec..0xab37  (75 bytes)
DATA_partitura_AAEC:
	defb 0feh,001h,0e9h,007h,0eeh,081h,0c2h,0f8h,009h,0ech,0eah,004h,0d6h,003h,070h,0d3h	; aaec  ..............p.
	defb 00ch,0ech,0eah,005h,0d8h,0c1h,0f5h,0d1h,000h,070h,050h,0a0h,0fbh,005h,0e9h,001h	; aafc  .........pP.....
	defb 0d0h,003h,0d1h,0a3h,083h,073h,053h,033h,013h,0e9h,007h,000h,0d2h,070h,0d1h,000h	; ab0c  .....sS3.....p..
	defb 070h,000h,070h,050h,070h,000h,0d2h,080h,0d1h,000h,030h,080h,030h,000h,030h,020h	; ab1c  p.pPp.....0.0.0
	defb 0d2h,0a0h,0d1h,020h,050h,0a0h,050h,020h,050h,0f5h,000h	; ab2c  ... P.P P..

; ----------------------------------------------------------------------
; DATOS partitura_AB37: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xab37..0xab3b  (4 bytes)
DATA_partitura_AB37:
	defb 070h,050h,0a0h,0fbh	; ab37

; ----------------------------------------------------------------------
; DATOS partitura_AB3B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xab3b..0xab3c  (1 bytes)
DATA_partitura_AB3B:
	defb 009h	; ab3b

; ----------------------------------------------------------------------
; DATOS partitura_AB3C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xab3c..0xab3f  (3 bytes)
DATA_partitura_AB3C:
	defb 0e9h,001h,003h	; ab3c

; ----------------------------------------------------------------------
; DATOS partitura_AB3F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xab3f..0xab43  (4 bytes)
DATA_partitura_AB3F:
	defb 023h,043h,053h,073h	; ab3f

; ----------------------------------------------------------------------
; DATOS partitura_AB43: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xab43..0xab47  (4 bytes)
DATA_partitura_AB43:
	defb 083h,0a3h,0e9h,007h	; ab43

; ----------------------------------------------------------------------
; DATOS partitura_AB47: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xab47..0xab4b  (4 bytes)
DATA_partitura_AB47:
	defb 0d0h,000h,0d1h,070h	; ab47

; ----------------------------------------------------------------------
; DATOS partitura_AB4B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xab4b..0xab4f  (4 bytes)
DATA_partitura_AB4B:
	defb 050h,070h,000h,070h	; ab4b

; ----------------------------------------------------------------------
; DATOS partitura_AB4F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (33 bytes)
;   0xab4f..0xab70  (33 bytes)
DATA_partitura_AB4F:
	defb 050h,070h,000h,0d2h,080h,0d1h,000h,030h,080h,030h,000h,030h,020h,0d2h,0a0h,0d1h	; ab4f  Pp.....0.0.0 ...
	defb 020h,050h,0a0h,050h,020h,050h,0f5h,000h,070h,050h,070h,0fbh,003h,000h,020h,0c1h	; ab5f   P.P P..pPp... .
	defb 0ech	; ab6f

; ----------------------------------------------------------------------
; DATOS partitura_AB70: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (5 bytes)
;   0xab70..0xab75  (5 bytes)
DATA_partitura_AB70:
	defb 0eah,007h,0f0h,002h,072h	; ab70

; ----------------------------------------------------------------------
; DATOS partitura_AB75: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xab75..0xab7c  (7 bytes)
DATA_partitura_AB75:
	defb 0d6h,010h,001h,0d4h,0c3h,082h,0d3h	; ab75

; ----------------------------------------------------------------------
; DATOS partitura_AB7C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (59 bytes)
;   0xab7c..0xabb7  (59 bytes)
DATA_partitura_AB7C:
	defb 000h,0e9h,002h,038h,089h,008h,0e9h,007h,023h,0e9h,001h,058h,0a9h,0d3h,038h,058h	; ab7c  ...8....#..X..8X
	defb 029h,0d4h,0a8h,0e9h,007h,0d3h,0a5h,0c1h,082h,0d2h,000h,0e9h,002h,038h,089h,0e9h	; ab8c  )............8..
	defb 001h,0a8h,0d1h,008h,0e9h,007h,023h,0e9h,001h,058h,0a9h,0eeh,082h,0d1h,038h,0efh	; ab9c  ......#..X....8.
	defb 0e9h,007h,020h,000h,0d2h,0a3h,0c1h,0ech,0eah,007h,0f0h	; abac  .. ........

; ----------------------------------------------------------------------
; DATOS partitura_ABB7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (44 bytes)
;   0xabb7..0xabe3  (44 bytes)
DATA_partitura_ABB7:
	defb 002h,073h,0d6h,010h,001h,0d3h,0c3h,003h,0d2h,005h,0d3h,0a0h,080h,0d2h,024h,0e9h	; abb7  .s............$.
	defb 001h,0c1h,009h,0d3h,0a8h,0e9h,007h,0d2h,033h,0e9h,001h,008h,0d3h,089h,0d2h,038h	; abc7  ........3......8
	defb 0e9h,007h,02bh,0d3h,073h,0d2h,022h,0d3h,070h,0d2h,025h,0e9h	; abd7  ..+.s.".p.%.

; ----------------------------------------------------------------------
; DATOS partitura_ABE3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (44 bytes)
;   0xabe3..0xac0f  (44 bytes)
DATA_partitura_ABE3:
	defb 001h,0c1h,0c1h,0dbh,004h,0ebh,00ah,03bh,011h,024h,024h,028h,029h,028h,0e9h,007h	; abe3  .........$$()(..
	defb 0ech,0eah,007h,0f0h,002h,072h,0d6h,010h,001h,0d3h,083h,0a1h,0d2h,003h,0d3h,081h	; abf3  .....r..........
	defb 0a1h,0d2h,001h,0e9h,001h,038h,029h,038h,0e9h,007h,007h,0d2h	; ac03  .....8)8....

; ----------------------------------------------------------------------
; DATOS partitura_AC0F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xac0f..0xac11  (2 bytes)
DATA_partitura_AC0F:
	defb 031h,021h	; ac0f

; ----------------------------------------------------------------------
; DATOS partitura_AC11: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (49 bytes)
;   0xac11..0xac42  (49 bytes)
DATA_partitura_AC11:
	defb 001h,0d3h,0a1h,081h,071h,081h,071h,051h,031h,072h,020h,073h,0d2h,0e9h,001h,0c8h	; ac11  ....q.qQ1r s....
	defb 024h,024h,028h,028h,029h,028h,0e9h,007h,0ech,0eah,007h,0f0h,002h,072h,0d6h,010h	; ac21  $$(()(.......r..
	defb 001h,0d3h,083h,0a1h,0d2h,003h,0d3h,081h,0a1h,0d2h,001h,0e9h,001h,038h,029h,038h	; ac31  .............8)8
	defb 0e9h	; ac41

; ----------------------------------------------------------------------
; DATOS partitura_AC42: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xac42..0xac46  (4 bytes)
DATA_partitura_AC42:
	defb 007h,00dh,0d2h,0c1h	; ac42

; ----------------------------------------------------------------------
; DATOS partitura_AC46: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xac46..0xac4e  (8 bytes)
DATA_partitura_AC46:
	defb 0e9h,001h,0d3h,088h,0d2h,039h,088h,0a8h	; ac46  .....9..

; ----------------------------------------------------------------------
; DATOS partitura_AC4E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (39 bytes)
;   0xac4e..0xac75  (39 bytes)
DATA_partitura_AC4E:
	defb 0d1h,009h,0d2h,088h,0e9h,007h,0a7h,0e9h,001h,0d3h,0a8h,0d2h,059h,0a8h,0d1h,008h	; ac4e  ............Y...
	defb 029h,058h,0e9h,007h,0a7h,0d2h,0a3h,095h,070h,050h,072h,001h,0e9h,001h,0c1h,059h	; ac5e  )X......pPr....Y
	defb 038h,0e9h,007h,025h,0fdh,0fdh,0aah	; ac6e

; ----------------------------------------------------------------------
; DATOS partitura_AC75: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (9 bytes)
;   0xac75..0xac7e  (9 bytes)
DATA_partitura_AC75:
	defb 0feh,001h,0e9h,007h,0eeh,001h,0c3h,0f8h,009h	; ac75  .........

; ----------------------------------------------------------------------
; DATOS partitura_AC7E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (36 bytes)
;   0xac7e..0xaca2  (36 bytes)
DATA_partitura_AC7E:
	defb 0ech,0eah,003h,0d6h,002h,070h,0d2h,00bh,0e9h,007h,0c1h,0ech,0eah,007h,0f0h,002h	; ac7e  .....p..........
	defb 072h,0d7h,0a0h,001h,0d5h,083h,0a1h,0d4h,003h,0d5h,081h,0a1h,0d4h,001h,0e9h,001h	; ac8e  r...............
	defb 038h,029h,038h,0e9h	; ac9e

; ----------------------------------------------------------------------
; DATOS partitura_ACA2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (12 bytes)
;   0xaca2..0xacae  (12 bytes)
DATA_partitura_ACA2:
	defb 007h,007h,0d4h,073h,085h,081h,0a5h,0a1h,0d3h,002h,0d8h,0eah	; aca2  ...s........

; ----------------------------------------------------------------------
; DATOS partitura_ACAE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (65 bytes)
;   0xacae..0xacef  (65 bytes)
DATA_partitura_ACAE:
	defb 005h,0d1h,070h,0d0h,005h,020h,040h,050h,070h,080h,0a0h,0d0h,0c1h,0ech,0eah,002h	; acae  ..p.. @Pp.......
	defb 001h,0d7h,0a0h,001h,0eah,007h,0d5h,083h,0e9h,001h,0a8h,0d4h,009h,0d5h,088h,0e9h	; acbe  ................
	defb 007h,0a1h,0d4h,001h,0e9h,001h,038h,029h,038h,0e9h,007h,007h,0d5h,073h,085h,081h	; acce  ......8)8....s..
	defb 0a5h,0a1h,0d4h,003h,0eah,005h,0d8h,0e9h,001h,0d0h,003h,023h,043h,053h,073h,083h	; acde  ...........#CSs.
	defb 0a3h	; acee

; ----------------------------------------------------------------------
; DATOS partitura_ACEF: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (61 bytes)
;   0xacef..0xad2c  (61 bytes)
DATA_partitura_ACEF:
	defb 0e9h,007h,0d0h,0c1h,0eah,00bh,0ebh,009h,01bh,051h,0d4h,001h,0d5h,0a1h,0eah,00bh	; acef  .........Q......
	defb 0ebh,00ah,01bh,051h,0dbh,004h,0f0h,002h,072h,0d7h,0a0h,001h,0d4h,087h,083h,083h	; acff  ...Q....r.......
	defb 0a7h,0a3h,0a3h,087h,083h,083h,0a7h,0a3h,0a3h,0eah,00bh,0ebh,00ah,01bh,051h,0dbh	; ad0f  ..............Q.
	defb 004h,0f0h,002h,072h,0d7h,0a0h,001h,0d4h,057h,0d3h,003h,0d4h,053h	; ad1f  ...r....W...S

; ----------------------------------------------------------------------
; DATOS partitura_AD2C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xad2c..0xad33  (7 bytes)
DATA_partitura_AD2C:
	defb 073h,0d3h,023h,0d4h,083h,0d3h,033h	; ad2c

; ----------------------------------------------------------------------
; DATOS partitura_AD33: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xad33..0xad37  (4 bytes)
DATA_partitura_AD33:
	defb 0d4h,0a7h,0d3h,053h	; ad33

; ----------------------------------------------------------------------
; DATOS partitura_AD37: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (9 bytes)
;   0xad37..0xad40  (9 bytes)
DATA_partitura_AD37:
	defb 0d4h,0a3h,073h,0d3h,023h,073h,0d4h,073h,0eah	; ad37  ..s.#s.s.

; ----------------------------------------------------------------------
; DATOS partitura_AD40: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (10 bytes)
;   0xad40..0xad4a  (10 bytes)
DATA_partitura_AD40:
	defb 00bh,0edh,019h,0ebh,08ah,01bh,0d1h,0dbh,003h,0f0h	; ad40  ..........

; ----------------------------------------------------------------------
; DATOS partitura_AD4A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (29 bytes)
;   0xad4a..0xad67  (29 bytes)
DATA_partitura_AD4A:
	defb 002h,071h,0d6h,0a0h,001h,0d3h,0e9h,00eh,009h,0e9h,007h,0d4h,073h,0d3h,003h,0ebh	; ad4a  .q..........s...
	defb 00ah,01bh,041h,0d2h,001h,0d3h,0a1h,081h,071h,051h,031h,051h,031h	; ad5a  ..A.....qQ1Q1

; ----------------------------------------------------------------------
; DATOS partitura_AD67: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (34 bytes)
;   0xad67..0xad89  (34 bytes)
DATA_partitura_AD67:
	defb 021h,001h,073h,0c3h,0edh,019h,0ebh,08ah,01bh,051h,0dbh,003h,0d4h,073h,073h,0e9h	; ad67  !.s......Q...ss.
	defb 007h,0eah,00bh,0edh,019h,0ebh,08ah,01bh,0a1h,0dbh,003h,0f0h,002h,072h,0d7h,0a0h	; ad77  .............r..
	defb 001h,0e9h	; ad87

; ----------------------------------------------------------------------
; DATOS partitura_AD89: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xad89..0xad8b  (2 bytes)
DATA_partitura_AD89:
	defb 00eh,0d3h	; ad89

; ----------------------------------------------------------------------
; DATOS partitura_AD8B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (28 bytes)
;   0xad8b..0xada7  (28 bytes)
DATA_partitura_AD8B:
	defb 009h,0e9h,007h,0d4h,073h,0d3h,003h,0ebh,00ah,01bh,041h,0d2h,001h,0d3h,0a1h,081h	; ad8b  ....s.....A.....
	defb 071h,051h,031h,051h,031h,021h,001h,0d2h,021h,001h,0d3h,0a1h	; ad9b  qQ1Q1!..!...

; ----------------------------------------------------------------------
; DATOS partitura_ADA7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (23 bytes)
;   0xada7..0xadbe  (23 bytes)
DATA_partitura_ADA7:
	defb 081h,071h,051h,031h,021h,003h,033h,025h,000h,0d4h,0a0h,0d3h,004h,0e9h,001h,0c1h	; ada7  .qQ1!.3%........
	defb 009h,008h,0ebh,00ah,01bh,011h,078h	; adb7

; ----------------------------------------------------------------------
; DATOS partitura_ADBE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (9 bytes)
;   0xadbe..0xadc7  (9 bytes)
DATA_partitura_ADBE:
	defb 074h,074h,078h,078h,079h,078h,0fdh,086h,0ach	; adbe  ttxxyx...

; ----------------------------------------------------------------------
; DATOS partitura_ADC7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (22 bytes)
;   0xadc7..0xaddd  (22 bytes)
DATA_partitura_ADC7:
	defb 0feh,001h,0e9h,001h,0f8h,023h,0eah,004h,0ebh,00ah,037h,011h,0dbh,003h,0d4h,004h	; adc7  .....#....7.....
	defb 003h,004h,0eah,005h,004h,003h	; add7

; ----------------------------------------------------------------------
; DATOS partitura_ADDD: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xaddd..0xadde  (1 bytes)
DATA_partitura_ADDD:
	defb 004h	; addd

; ----------------------------------------------------------------------
; DATOS partitura_ADDE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (22 bytes)
;   0xadde..0xadf4  (22 bytes)
DATA_partitura_ADDE:
	defb 0eah,006h,004h,003h,004h,0eah,007h,004h,003h,004h,0eah,008h,004h,003h,004h,0eah	; adde  ................
	defb 009h,004h,003h,004h,0eah,00ah	; adee

; ----------------------------------------------------------------------
; DATOS partitura_ADF4: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xadf4..0xadfc  (8 bytes)
DATA_partitura_ADF4:
	defb 004h,003h,004h,0eah,00bh,004h,003h,004h	; adf4  ........

; ----------------------------------------------------------------------
; DATOS partitura_ADFC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (22 bytes)
;   0xadfc..0xae12  (22 bytes)
DATA_partitura_ADFC:
	defb 0eeh,081h,0e9h,007h,0f8h,04bh,0eah,00dh,0edh,017h,0ebh,089h,03bh,081h,0dbh,003h	; adfc  .....K..........
	defb 0f0h,002h,072h,0d7h,0a0h,001h	; ae0c

; ----------------------------------------------------------------------
; DATOS partitura_AE12: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xae12..0xae1d  (11 bytes)
DATA_partitura_AE12:
	defb 0d5h,083h,0a1h,0d4h,003h,0d5h,081h,0a1h,0d4h,001h,0e9h	; ae12  ...........

; ----------------------------------------------------------------------
; DATOS partitura_AE1D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (22 bytes)
;   0xae1d..0xae33  (22 bytes)
DATA_partitura_AE1D:
	defb 001h,038h,029h,038h,0e9h,007h,007h,0d5h,073h,085h,081h,0a5h,0a1h,0d4h,002h,0d8h	; ae1d  .8)8....s.......
	defb 0f8h,007h,0eah,007h,0d2h,070h	; ae2d

; ----------------------------------------------------------------------
; DATOS partitura_AE33: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (32 bytes)
;   0xae33..0xae53  (32 bytes)
DATA_partitura_AE33:
	defb 0d1h,005h,020h,040h,050h,070h,080h,0a0h,0d0h,001h,0ech,0eah,002h,001h,0edh,019h	; ae33  .. @Pp..........
	defb 0ebh,089h,03bh,081h,0dbh,003h,0d7h,0a0h,001h,0f8h,04bh,0eah,00dh,0d5h,083h,0e9h	; ae43  ..........K.....

; ----------------------------------------------------------------------
; DATOS partitura_AE53: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xae53..0xae54  (1 bytes)
DATA_partitura_AE53:
	defb 001h	; ae53

; ----------------------------------------------------------------------
; DATOS partitura_AE54: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (55 bytes)
;   0xae54..0xae8b  (55 bytes)
DATA_partitura_AE54:
	defb 0a8h,0d4h,009h,0d5h,088h,0e9h,007h,0a1h,0d4h,001h,0e9h,001h,038h,029h,038h,0e9h	; ae54  ............8)8.
	defb 007h,007h,0d5h,073h,085h,081h,0a5h,0a1h,0d4h,003h,0f8h,007h,0eah,007h,0d8h,0e9h	; ae64  ...s............
	defb 001h,0d1h,003h,023h,043h,053h,073h,083h,0a3h,0e9h,007h,0d0h,001h,0ech,0eah,002h	; ae74  ...#CSs.........
	defb 001h,0efh,0f8h,04bh,0eah,00bh,0d4h	; ae84

; ----------------------------------------------------------------------
; DATOS partitura_AE8B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (40 bytes)
;   0xae8b..0xaeb3  (40 bytes)
DATA_partitura_AE8B:
	defb 001h,0d5h,0a1h,0e9h,007h,0f8h,04bh,0eah,00fh,0ebh,009h,03bh,031h,0dbh,004h,0f0h	; ae8b  ......K.....1...
	defb 002h,072h,0d7h,0a0h,001h,0d5h,087h,083h,083h,0a7h,0a3h,0a3h,087h,083h,083h,0a7h	; ae9b  .r..............
	defb 0a3h,0a3h,0e9h,007h,0f8h,04bh,0eah,00fh	; aeab  .....K..

; ----------------------------------------------------------------------
; DATOS partitura_AEB3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (14 bytes)
;   0xaeb3..0xaec1  (14 bytes)
DATA_partitura_AEB3:
	defb 0ebh,009h,03bh,031h,0dbh,004h,0f0h,002h,072h,0d7h,0a0h,001h,0d5h,057h	; aeb3  ...1....r....W

; ----------------------------------------------------------------------
; DATOS partitura_AEC1: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xaec1..0xaec2  (1 bytes)
DATA_partitura_AEC1:
	defb 0d4h	; aec1

; ----------------------------------------------------------------------
; DATOS partitura_AEC2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (43 bytes)
;   0xaec2..0xaeed  (43 bytes)
DATA_partitura_AEC2:
	defb 003h,0d5h,053h,073h,0d4h,023h,0d5h,083h,0d4h,033h,0d5h,0a7h,0d4h,053h,0d5h,0a3h	; aec2  ..Ss.#...3...S..
	defb 073h,0d4h,023h,073h,0d5h,073h,0e9h,007h,0d8h,0f8h,04bh,0eah,00fh,0ebh,009h,03bh	; aed2  s.#s.s....K.....
	defb 0b1h,0dbh,003h,0f0h,002h,071h,0d4h,0e9h,00eh,009h,0e9h	; aee2  .....q.....

; ----------------------------------------------------------------------
; DATOS partitura_AEED: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (65 bytes)
;   0xaeed..0xaf2e  (65 bytes)
DATA_partitura_AEED:
	defb 007h,0ebh,009h,03bh,031h,0d5h,073h,0d4h,003h,0ebh,009h,03bh,021h,0d3h,001h,0d4h	; aeed  ....1.s.....!...
	defb 0a1h,081h,071h,051h,031h,051h,031h,021h,001h,077h,0ebh,009h,03bh,031h,0dbh,003h	; aefd  ..qQ1Q1!.w...1..
	defb 0d5h,073h,073h,0e9h,007h,0f8h,04bh,0d8h,0eah,00fh,0ebh,009h,03bh,0b1h,0dbh,003h	; af0d  .ss...K.........
	defb 0f0h,002h,072h,0e9h,00eh,0d4h,009h,0ebh,009h,03bh,031h,0e9h,007h,0d5h,073h,0d4h	; af1d  ..r.......1...s.
	defb 003h	; af2d

; ----------------------------------------------------------------------
; DATOS partitura_AF2E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (62 bytes)
;   0xaf2e..0xaf6c  (62 bytes)
DATA_partitura_AF2E:
	defb 0ebh,009h,03bh,021h,0d3h,001h,0d4h,0a1h,081h,071h,051h,031h,051h,031h,021h,001h	; af2e  ...!.....qQ1Q1!.
	defb 0d3h,021h,001h,0d4h,0a1h,081h,071h,051h,031h,021h,0ebh,009h,02bh,061h,003h,033h	; af3e  .!....qQ1!..+a.3
	defb 025h,000h,0d5h,0a0h,0d4h,004h,0e9h,001h,0ech,0eah,004h,001h,0eah,00fh,0ebh,009h	; af4e  %...............
	defb 03bh,021h,0dbh,003h,009h,008h,0ebh,009h,02bh,011h,078h,074h,074h,078h	; af5e  .!......+.xttx

; ----------------------------------------------------------------------
; DATOS partitura_AF6C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xaf6c..0xaf72  (6 bytes)
DATA_partitura_AF6C:
	defb 078h,079h,078h,0fdh,0fch,0adh	; af6c

; ----------------------------------------------------------------------
; DATOS partitura_AF72: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xaf72..0xaf79  (7 bytes)
DATA_partitura_AF72:
	defb 0feh,001h,0e9h,007h,0eeh,081h,0c1h	; af72

; ----------------------------------------------------------------------
; DATOS partitura_AF79: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (15 bytes)
;   0xaf79..0xaf88  (15 bytes)
DATA_partitura_AF79:
	defb 0f8h,00ah,0ech,0eah,001h,0f5h,0d1h,000h,070h,050h,0a0h,0fbh,002h,0eah,002h	; af79  ........pP.....

; ----------------------------------------------------------------------
; DATOS partitura_AF88: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (12 bytes)
;   0xaf88..0xaf94  (12 bytes)
DATA_partitura_AF88:
	defb 000h,070h,050h,0a0h,0eah,003h,000h,070h,0eeh,001h,0e9h,007h	; af88  .pP....p....

; ----------------------------------------------------------------------
; DATOS partitura_AF94: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (23 bytes)
;   0xaf94..0xafab  (23 bytes)
DATA_partitura_AF94:
	defb 0f6h,0f8h,002h,0eah,00ch,0edh,019h,0ebh,089h,03bh,081h,0dbh,003h,0f0h,002h,072h	; af94  ...............r
	defb 0d6h,040h,002h,0d4h,083h,0a1h,0d3h	; afa4

; ----------------------------------------------------------------------
; DATOS partitura_AFAB: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (27 bytes)
;   0xafab..0xafc6  (27 bytes)
DATA_partitura_AFAB:
	defb 003h,0d4h,081h,0a1h,0d3h,001h,0e9h,001h,038h,029h,038h,0e9h,007h,007h,0d4h,073h	; afab  ........8)8....s
	defb 085h,081h,0a5h,0a1h,0d3h,007h,0f8h,011h,0edh,01bh,0eah	; afbb  ...........

; ----------------------------------------------------------------------
; DATOS partitura_AFC6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xafc6..0xafca  (4 bytes)
DATA_partitura_AFC6:
	defb 00eh,0d6h,010h,001h	; afc6

; ----------------------------------------------------------------------
; DATOS partitura_AFCA: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xafca..0xafcb  (1 bytes)
DATA_partitura_AFCA:
	defb 0f0h	; afca

; ----------------------------------------------------------------------
; DATOS partitura_AFCB: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xafcb..0xafd1  (6 bytes)
DATA_partitura_AFCB:
	defb 002h,043h,0d3h,0e9h,002h,0a8h	; afcb

; ----------------------------------------------------------------------
; DATOS partitura_AFD1: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (29 bytes)
;   0xafd1..0xafee  (29 bytes)
DATA_partitura_AFD1:
	defb 0d2h,059h,078h,0e9h,007h,043h,0f0h,002h,072h,0f8h,002h,0edh,019h,0eah,00ch,0d6h	; afd1  .Yx..C..r.......
	defb 040h,002h,0d4h,083h,0e9h,001h,0a8h,0d3h,009h,0d4h,088h,0e9h,007h	; afe1  @............

; ----------------------------------------------------------------------
; DATOS partitura_AFEE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (40 bytes)
;   0xafee..0xb016  (40 bytes)
DATA_partitura_AFEE:
	defb 0a1h,0d3h,001h,0e9h,001h,038h,029h,038h,0e9h,007h,007h,0d4h,073h,085h,081h,0a5h	; afee  .....8)8....s...
	defb 0a1h,0d3h,00bh,0ebh,009h,03bh,021h,001h,0d4h,0a1h,0efh,0e9h,007h,0f8h,00ah,0eah	; affe  ......!.........
	defb 008h,0edh,015h,0ebh,089h,03bh,011h,0dbh	; b00e  ........

; ----------------------------------------------------------------------
; DATOS partitura_B016: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (15 bytes)
;   0xb016..0xb025  (15 bytes)
DATA_partitura_B016:
	defb 003h,0d6h,003h,001h,0f5h,0d2h,080h,0d1h,030h,000h,030h,080h,030h,000h,030h	; b016  ........0.0.0.0

; ----------------------------------------------------------------------
; DATOS partitura_B025: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (10 bytes)
;   0xb025..0xb02f  (10 bytes)
DATA_partitura_B025:
	defb 0fbh,002h,0f5h,0d2h,0a0h,0d1h,050h,020h,050h,0a0h	; b025  ......P P.

; ----------------------------------------------------------------------
; DATOS partitura_B02F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xb02f..0xb048  (25 bytes)
DATA_partitura_B02F:
	defb 050h,020h,050h,0fbh,002h,0f5h,0d2h,080h,0d1h,030h,000h,030h,080h,030h,000h,030h	; b02f  P P......0.0.0.0
	defb 0fbh,002h,0d2h,0a0h,0d1h,050h,030h,050h,0a0h	; b03f  .....P0P.

; ----------------------------------------------------------------------
; DATOS partitura_B048: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (30 bytes)
;   0xb048..0xb066  (30 bytes)
DATA_partitura_B048:
	defb 050h,030h,050h,0d2h,0a3h,0e9h,001h,0f8h,007h,0eah,007h,0edh,017h,0ebh,089h,03bh	; b048  P0P.............
	defb 011h,0dbh,002h,0d2h,053h,072h,082h,0a2h,0d1h,002h,022h,032h,052h,072h	; b058  ....Sr...."2Rr

; ----------------------------------------------------------------------
; DATOS partitura_B066: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (65 bytes)
;   0xb066..0xb0a7  (65 bytes)
DATA_partitura_B066:
	defb 0e9h,007h,0f8h,007h,0eah,006h,0edh,017h,0ebh,089h,02bh,051h,0dbh,003h,0f0h,002h	; b066  ..........+Q....
	defb 071h,0d1h,081h,0c1h,0c7h,0e9h,001h,0d2h,073h,082h,0a2h,0d1h,002h,022h,032h,052h	; b076  q.......s...."2R
	defb 072h,082h,0e9h,007h,0a1h,0c1h,0e9h,001h,0d2h,083h,0a2h,0d1h,002h,022h,032h,042h	; b086  r............"2B
	defb 072h,082h,0a2h,0e9h,007h,0d0h,001h,0c1h,0e9h,001h,0d1h,023h,032h,052h,072h,082h	; b096  r..........#2Rr.
	defb 0a2h	; b0a6

; ----------------------------------------------------------------------
; DATOS partitura_B0A7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xb0a7..0xb0b8  (17 bytes)
DATA_partitura_B0A7:
	defb 0d0h,002h,022h,032h,0e9h,007h,051h,0c1h,0c7h,0d2h,0e9h,001h,023h,033h,053h,073h	; b0a7  .."2..Q.....#3Ss
	defb 083h	; b0b7

; ----------------------------------------------------------------------
; DATOS partitura_B0B8: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (16 bytes)
;   0xb0b8..0xb0c8  (16 bytes)
DATA_partitura_B0B8:
	defb 0a3h,0d1h,003h,0e9h,007h,0b0h,070h,0d1h,020h,0d2h,0b0h,0d1h,070h,020h,0b0h,070h	; b0b8  ......p. ...p .p

; ----------------------------------------------------------------------
; DATOS partitura_B0C8: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (64 bytes)
;   0xb0c8..0xb108  (64 bytes)
DATA_partitura_B0C8:
	defb 0d0h,020h,0d1h,0b0h,070h,020h,0d2h,0b0h,070h,090h,0b0h,0e9h,007h,0f8h,012h,0eah	; b0c8  . ..p ..p.......
	defb 00dh,0edh,019h,0ebh,089h,03bh,081h,0dbh,003h,0f0h,002h,072h,0d6h,010h,001h,0d3h	; b0d8  ...........r....
	defb 083h,0a1h,0d2h,003h,0d3h,081h,0a1h,0d2h,001h,0e9h,001h,038h,029h,038h,0e9h,007h	; b0e8  ...........8)8..
	defb 007h,0eah,00ch,0d2h,031h,021h,001h,0d3h,0a1h,081h,071h,081h,071h,051h,031h,072h	; b0f8  ....1!....q.qQ1r

; ----------------------------------------------------------------------
; DATOS partitura_B108: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (36 bytes)
;   0xb108..0xb12c  (36 bytes)
DATA_partitura_B108:
	defb 0eah,00dh,020h,073h,0ech,0eah,004h,0e9h,001h,078h,0eah,00dh,0ebh,00ah,03bh,011h	; b108  .. s.....x......
	defb 0eah,00dh,0d2h,024h,024h,028h,028h,029h,028h,0e9h,007h,0f8h,012h,0eah,00dh,0edh	; b118  ...$$(()(.......
	defb 019h,0ebh,089h,03bh	; b128

; ----------------------------------------------------------------------
; DATOS partitura_B12C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xb12c..0xb130  (4 bytes)
DATA_partitura_B12C:
	defb 081h,0dbh,003h,0f0h	; b12c

; ----------------------------------------------------------------------
; DATOS partitura_B130: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xb130..0xb137  (7 bytes)
DATA_partitura_B130:
	defb 002h,071h,0d6h,010h,001h,0d3h,083h	; b130

; ----------------------------------------------------------------------
; DATOS partitura_B137: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (33 bytes)
;   0xb137..0xb158  (33 bytes)
DATA_partitura_B137:
	defb 0a1h,0d2h,003h,0d3h,081h,0a1h,0d2h,001h,0e9h,001h,038h,029h,038h,0e9h,007h,00dh	; b137  ..........8)8...
	defb 0eah,00ch,0d2h,0c1h,0f8h,011h,0e9h,001h,0d3h,088h,0d2h,039h,088h,0a8h,0d1h,009h	; b147  ...........9....
	defb 0d2h	; b157

; ----------------------------------------------------------------------
; DATOS partitura_B158: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xb158..0xb159  (1 bytes)
DATA_partitura_B158:
	defb 088h	; b158

; ----------------------------------------------------------------------
; DATOS partitura_B159: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (12 bytes)
;   0xb159..0xb165  (12 bytes)
DATA_partitura_B159:
	defb 0e9h,007h,0a7h,0e9h,001h,0d3h,0a8h,0d2h,059h,0a8h,0d1h,008h	; b159  ........Y...

; ----------------------------------------------------------------------
; DATOS partitura_B165: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xb165..0xb177  (18 bytes)
DATA_partitura_B165:
	defb 029h,058h,0e9h,007h,0a7h,0d2h,0a3h,095h,070h,050h,072h,0e9h,001h,00fh,059h,038h	; b165  )X......pPr...Y8
	defb 0e9h,007h	; b175

; ----------------------------------------------------------------------
; DATOS partitura_B177: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xb177..0xb17b  (4 bytes)
DATA_partitura_B177:
	defb 027h,0fdh,090h,0afh	; b177

; ----------------------------------------------------------------------
; DATOS partitura_B17B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xb17b..0xb181  (6 bytes)
DATA_partitura_B17B:
	defb 0feh,001h,0e9h,007h,0f8h,00ah	; b17b

; ----------------------------------------------------------------------
; DATOS partitura_B181: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (31 bytes)
;   0xb181..0xb1a0  (31 bytes)
DATA_partitura_B181:
	defb 0ebh,009h,017h,002h,0eah,001h,0d1h,000h,070h,050h,0a0h,0eah,002h,000h,070h,050h	; b181  ........pP....pP
	defb 0a0h,0eah,003h,000h,070h,0eah,004h,050h,0a0h,0eah,005h,000h,070h,0eah,006h	; b191  ....p..P....p..

; ----------------------------------------------------------------------
; DATOS partitura_B1A0: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xb1a0..0xb1b2  (18 bytes)
DATA_partitura_B1A0:
	defb 050h,0a0h,0e9h,007h,0f8h,00ah,0eah,007h,0edh,014h,0ebh,089h,03bh,011h,0dbh,003h	; b1a0  P...............
	defb 0d6h,003h	; b1b0

; ----------------------------------------------------------------------
; DATOS partitura_B1B2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (35 bytes)
;   0xb1b2..0xb1d5  (35 bytes)
DATA_partitura_B1B2:
	defb 001h,0d8h,0f5h,0d1h,000h,070h,050h,0a0h,0fbh,005h,0e9h,001h,0d0h,003h,0d1h,0a3h	; b1b2  .....pP.........
	defb 083h,073h,053h,033h,013h,0e9h,007h,000h,0d2h,070h,0d1h,000h,070h,000h,070h,050h	; b1c2  .sS3.....p..p.pP
	defb 070h,000h,0d2h	; b1d2

; ----------------------------------------------------------------------
; DATOS partitura_B1D5: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (9 bytes)
;   0xb1d5..0xb1de  (9 bytes)
DATA_partitura_B1D5:
	defb 080h,0d1h,000h,030h,080h,030h,000h,030h,020h	; b1d5  ...0.0.0

; ----------------------------------------------------------------------
; DATOS partitura_B1DE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xb1de..0xb1f7  (25 bytes)
DATA_partitura_B1DE:
	defb 0d2h,0a0h,0d1h,020h,050h,0a0h,050h,020h,050h,0f5h,000h,070h,050h,0a0h,0fbh,009h	; b1de  ... P.P P..pP...
	defb 0e9h,001h,003h,023h,043h,053h,073h,083h,0a3h	; b1ee  ...#CSs..

; ----------------------------------------------------------------------
; DATOS partitura_B1F7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (24 bytes)
;   0xb1f7..0xb20f  (24 bytes)
DATA_partitura_B1F7:
	defb 0e9h,007h,0d0h,000h,0d1h,070h,050h,070h,000h,070h,050h,070h,000h,0d2h,080h,0d1h	; b1f7  .....pPp.pPp....
	defb 000h,030h,080h,030h,000h,030h,020h,0d2h	; b207  .0.0.0 .

; ----------------------------------------------------------------------
; DATOS partitura_B20F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (12 bytes)
;   0xb20f..0xb21b  (12 bytes)
DATA_partitura_B20F:
	defb 0a0h,0d1h,020h,050h,0a0h,050h,020h,050h,0f5h,000h,070h,050h	; b20f  .. P.P P..pP

; ----------------------------------------------------------------------
; DATOS partitura_B21B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (24 bytes)
;   0xb21b..0xb233  (24 bytes)
DATA_partitura_B21B:
	defb 070h,0fbh,003h,000h,020h,0d2h,0a0h,0d1h,000h,0e9h,007h,0f8h,011h,0eah,00eh,0edh	; b21b  p... ...........
	defb 019h,0ebh,089h,03bh,081h,0dbh,003h,0f0h	; b22b  ........

; ----------------------------------------------------------------------
; DATOS partitura_B233: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xb233..0xb23a  (7 bytes)
DATA_partitura_B233:
	defb 002h,072h,0d6h,010h,001h,0d4h,0c3h	; b233

; ----------------------------------------------------------------------
; DATOS partitura_B23A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (38 bytes)
;   0xb23a..0xb260  (38 bytes)
DATA_partitura_B23A:
	defb 082h,0d3h,000h,0e9h,002h,038h,089h,008h,0e9h,007h,023h,0e9h,001h,058h,0a9h,0d3h	; b23a  .....8....#..X..
	defb 038h,058h,029h,0d4h,0a8h,0e9h,007h,0d3h,0a7h,0d4h,082h,0d3h,000h,0e9h,002h,038h	; b24a  8X)............8
	defb 089h,0e9h,001h,0a8h,0d2h,008h	; b25a

; ----------------------------------------------------------------------
; DATOS partitura_B260: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (26 bytes)
;   0xb260..0xb27a  (26 bytes)
DATA_partitura_B260:
	defb 0e9h,007h,023h,0e9h,001h,058h,0a9h,0eeh,082h,0d2h,038h,0efh,0e9h,007h,020h,000h	; b260  ..#..X....8... .
	defb 0d3h,0a5h,0e9h,007h,0f8h,011h,0eah,00eh,0edh,019h	; b270  ..........

; ----------------------------------------------------------------------
; DATOS partitura_B27A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (14 bytes)
;   0xb27a..0xb288  (14 bytes)
DATA_partitura_B27A:
	defb 0ebh,089h,03bh,081h,0dbh,003h,0f0h,002h,073h,0d6h,010h,001h,0d3h,0c3h	; b27a  ........s.....

; ----------------------------------------------------------------------
; DATOS partitura_B288: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (33 bytes)
;   0xb288..0xb2a9  (33 bytes)
DATA_partitura_B288:
	defb 003h,0d2h,005h,0d3h,0a0h,080h,0d2h,024h,0e9h,001h,0ech,0d8h,0eah,006h,001h,0d6h	; b288  .......$........
	defb 010h,001h,0eah,00eh,0edh,019h,0ebh,089h,03bh,081h,009h,0d3h,0a8h,0e9h,007h,0d2h	; b298  ................
	defb 033h	; b2a8

; ----------------------------------------------------------------------
; DATOS partitura_B2A9: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (34 bytes)
;   0xb2a9..0xb2cb  (34 bytes)
DATA_partitura_B2A9:
	defb 0e9h,001h,008h,0d3h,089h,0d2h,038h,0e9h,007h,02bh,0d3h,073h,0d2h,022h,0d3h,070h	; b2a9  ......8..+.s.".p
	defb 0d2h,025h,0e9h,001h,0d8h,0eah,004h,0ech,023h,0eah,00eh,0dbh,004h,0ebh,00ah,03bh	; b2b9  .%......#.......
	defb 011h,024h	; b2c9

; ----------------------------------------------------------------------
; DATOS partitura_B2CB: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xb2cb..0xb2ce  (3 bytes)
DATA_partitura_B2CB:
	defb 024h,028h,029h	; b2cb

; ----------------------------------------------------------------------
; DATOS partitura_B2CE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (56 bytes)
;   0xb2ce..0xb306  (56 bytes)
DATA_partitura_B2CE:
	defb 028h,0e9h,00eh,0f8h,051h,0eah,00dh,0ebh,00ah,03bh,0b1h,0dbh,001h,0d8h,0f0h,000h	; b2ce  (...Q...........
	defb 0d1h,009h,0e9h,007h,0f8h,007h,0eah,007h,0edh,016h,0ebh,089h,02bh,031h,0d2h,000h	; b2de  ............+1..
	defb 020h,030h,050h,0e9h,001h,074h,085h,0a5h,0d1h,005h,024h,0f8h,054h,0ebh,00ah,027h	; b2ee   0P..t....$.T..'
	defb 003h,0e9h,007h,030h,0d0h,030h,0d1h,020h	; b2fe  ...0.0.

; ----------------------------------------------------------------------
; DATOS partitura_B306: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (24 bytes)
;   0xb306..0xb31e  (24 bytes)
DATA_partitura_B306:
	defb 0d0h,020h,0d1h,000h,0d0h,000h,0d2h,0a0h,0d1h,0a0h,0d2h,080h,0d1h,080h,0d2h,070h	; b306  . .............p
	defb 0d1h,070h,0d2h,080h,0d1h,080h,0d2h,070h	; b316  .p.....p

; ----------------------------------------------------------------------
; DATOS partitura_B31E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (19 bytes)
;   0xb31e..0xb331  (19 bytes)
DATA_partitura_B31E:
	defb 0d1h,070h,0d2h,050h,0d1h,050h,0d2h,030h,0d1h,030h,023h,0f8h,007h,0edh,016h,0eah	; b31e  .p.P.P.0.0#.....
	defb 007h,0ebh,089h	; b32e

; ----------------------------------------------------------------------
; DATOS partitura_B331: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (15 bytes)
;   0xb331..0xb340  (15 bytes)
DATA_partitura_B331:
	defb 03bh,031h,0d2h,020h,030h,050h,060h,073h,0e9h,001h,0d1h,054h,023h,0d2h,0b4h	; b331  .1. 0P`s...T#..

; ----------------------------------------------------------------------
; DATOS partitura_B340: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (78 bytes)
;   0xb340..0xb38e  (78 bytes)
DATA_partitura_B340:
	defb 083h,074h,084h,0e9h,007h,0f8h,051h,0eah,00dh,0ebh,00ah,03bh,081h,0dbh,003h,0f0h	; b340  .t....Q.........
	defb 000h,0d1h,00fh,0c3h,0f8h,007h,0eah,007h,0edh,016h,0ebh,089h,02bh,031h,0d2h,000h	; b350  ............+1..
	defb 020h,030h,050h,0e9h,001h,074h,085h,0a5h,0d1h,005h,024h,0f8h,054h,0ebh,00ah,027h	; b360   0P..t....$.T..'
	defb 003h,0e9h,007h,030h,0d0h,030h,0d1h,020h,0d0h,020h,0d1h,000h,0d0h,000h,0d2h,0a0h	; b370  ...0.0. . ......
	defb 0d1h,0a0h,0d2h,080h,0d1h,080h,0d2h,070h,0d1h,070h,0d2h,080h,0d1h,080h	; b380  .......p.p....

; ----------------------------------------------------------------------
; DATOS partitura_B38E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xb38e..0xb391  (3 bytes)
DATA_partitura_B38E:
	defb 0d2h,070h,0d1h	; b38e

; ----------------------------------------------------------------------
; DATOS partitura_B391: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (5 bytes)
;   0xb391..0xb396  (5 bytes)
DATA_partitura_B391:
	defb 070h,0d2h,050h,0d1h,050h	; b391

; ----------------------------------------------------------------------
; DATOS partitura_B396: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (15 bytes)
;   0xb396..0xb3a5  (15 bytes)
DATA_partitura_B396:
	defb 0d2h,030h,0d1h,030h,0d0h,050h,0d1h,050h,0d0h,030h,0d1h,030h,0d0h,020h,0d1h	; b396  .0.0.P.P.0.0. .

; ----------------------------------------------------------------------
; DATOS partitura_B3A5: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xb3a5..0xb3be  (25 bytes)
DATA_partitura_B3A5:
	defb 020h,0d0h,000h,0d1h,000h,0a0h,0d2h,0a0h,0d1h,080h,0d2h,080h,0d1h,070h,0d2h,070h	; b3a5   ............p.p
	defb 0d1h,050h,0d2h,050h,0f8h,012h,0edh,019h,0ebh	; b3b5  .P.P.....

; ----------------------------------------------------------------------
; DATOS partitura_B3BE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (12 bytes)
;   0xb3be..0xb3ca  (12 bytes)
DATA_partitura_B3BE:
	defb 089h,03bh,031h,0dbh,003h,0d3h,00fh,0d1h,00fh,0fdh,0a2h,0b1h	; b3be  ..1.........

; ----------------------------------------------------------------------
; DATOS partitura_B3CA: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xb3ca..0xb3dc  (18 bytes)
DATA_partitura_B3CA:
	defb 0feh,001h,0e9h,007h,0f8h,002h,0ech,0eah,003h,0d6h,003h,070h,0d3h,00fh,0e9h,007h	; b3ca  ...........p....
	defb 0f8h,002h	; b3da

; ----------------------------------------------------------------------
; DATOS partitura_B3DC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (33 bytes)
;   0xb3dc..0xb3fd  (33 bytes)
DATA_partitura_B3DC:
	defb 0eah,00ah,0edh,019h,0ebh,089h,03bh,081h,0dbh,003h,0f0h,00eh,072h,0d6h,010h,001h	; b3dc  ............r...
	defb 0d2h,003h,021h,073h,001h,021h,071h,0e9h,001h,0a8h,099h,0a8h,0e9h,007h,077h,003h	; b3ec  ..!s.!q.......w.
	defb 035h	; b3fc

; ----------------------------------------------------------------------
; DATOS partitura_B3FD: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (30 bytes)
;   0xb3fd..0xb41b  (30 bytes)
DATA_partitura_B3FD:
	defb 031h,055h,051h,0e9h,00eh,079h,0e9h,007h,003h,0e9h,001h,028h,079h,008h,0e9h,007h	; b3fd  1UQ..y.....(y...
	defb 021h,071h,0e9h,001h,0a8h,099h,0a8h,0e9h,007h,0dbh,005h,077h,0d1h,003h	; b40d  !q.........w..

; ----------------------------------------------------------------------
; DATOS partitura_B41B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xb41b..0xb41f  (4 bytes)
DATA_partitura_B41B:
	defb 035h,031h,055h,051h	; b41b

; ----------------------------------------------------------------------
; DATOS partitura_B41F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (63 bytes)
;   0xb41f..0xb45e  (63 bytes)
DATA_partitura_B41F:
	defb 0f0h,00eh,092h,0dbh,003h,07bh,0f8h,011h,0eah,00fh,003h,0e9h,007h,0f8h,002h,0eah	; b41f  .....{..........
	defb 00ah,0edh,017h,0ebh,089h,01bh,081h,0dbh,003h,0f0h,002h,071h,0d6h,010h,001h,0d1h	; b42f  ...........q....
	defb 035h,021h,0e9h,002h,008h,029h,038h,0e9h,007h,052h,020h,0d2h,0a7h,0d1h,022h,050h	; b43f  5!...)8..R ..."P
	defb 035h,021h,0e9h,002h,008h,029h,038h,0e9h,001h,058h,029h,0d2h,0a8h,0e9h,007h	; b44f  5!...)8..X)....

; ----------------------------------------------------------------------
; DATOS partitura_B45E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (81 bytes)
;   0xb45e..0xb4af  (81 bytes)
DATA_partitura_B45E:
	defb 0d1h,0a7h,0f8h,012h,0d2h,073h,0e9h,007h,0f8h,002h,0eah,00ah,0edh,037h,0ebh,089h	; b45e  .....s.......7..
	defb 02bh,081h,0dbh,003h,0f0h,002h,072h,0d6h,010h,001h,0d2h,085h,071h,0e9h,002h,058h	; b46e  +.....r.....q..X
	defb 079h,088h,0e9h,001h,0a8h,089h,078h,0e9h,007h,0d1h,003h,0e9h,001h,0c8h,0d2h,0a9h	; b47e  y.....x.........
	defb 088h,0d1h,039h,028h,008h,0e9h,007h,053h,0d0h,004h,0d1h,0a0h,080h,070h,050h,030h	; b48e  ..9(...S.....pP0
	defb 020h,000h,0d2h,0b3h,0d1h,075h,0e9h,001h,0ech,0eah,003h,073h,0f8h,002h,0eah,00ah	; b49e   ....u.....s....
	defb 0ebh	; b4ae

; ----------------------------------------------------------------------
; DATOS partitura_B4AF: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xb4af..0xb4b3  (4 bytes)
DATA_partitura_B4AF:
	defb 00ah,02bh,011h,0dbh	; b4af

; ----------------------------------------------------------------------
; DATOS partitura_B4B3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (38 bytes)
;   0xb4b3..0xb4d9  (38 bytes)
DATA_partitura_B4B3:
	defb 004h,074h,074h,078h,079h,078h,0e9h,007h,0f8h,002h,0eah,00bh,0edh,019h,0ebh,089h	; b4b3  .ttxyx..........
	defb 03bh,081h,0dbh,003h,0f0h,002h,072h,0d6h,010h,001h,0d2h,003h,021h,073h,001h,021h	; b4c3  ......r.....!s.!
	defb 071h,0e9h,001h,0a8h,099h,0a8h	; b4d3

; ----------------------------------------------------------------------
; DATOS partitura_B4D9: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (57 bytes)
;   0xb4d9..0xb512  (57 bytes)
DATA_partitura_B4D9:
	defb 0ebh,009h,03bh,0b1h,0e9h,007h,07bh,0d1h,007h,057h,072h,0d0h,000h,0dbh,004h,0d1h	; b4d9  ......{..Wr.....
	defb 0b3h,0ech,0eah,004h,0e9h,001h,0b8h,0eah,00bh,0ebh,00ah,03bh,011h,0e9h,001h,074h	; b4e9  ...............t
	defb 074h,078h,078h,079h,078h,0e9h,007h,0f8h,002h,0eah,00bh,0edh,019h,0ebh,089h,03bh	; b4f9  txxyx...........
	defb 081h,0dbh,003h,0f0h,002h,071h,0d6h,010h,001h	; b509  .....q...

; ----------------------------------------------------------------------
; DATOS partitura_B512: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xb512..0xb514  (2 bytes)
DATA_partitura_B512:
	defb 0d2h,003h	; b512

; ----------------------------------------------------------------------
; DATOS partitura_B514: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (49 bytes)
;   0xb514..0xb545  (49 bytes)
DATA_partitura_B514:
	defb 021h,073h,001h,021h,071h,0e9h,001h,0a8h,099h,0a8h,0e9h,007h,0ebh,009h,03bh,0b1h	; b514  !s.!q...........
	defb 077h,0d1h,003h,03bh,033h,05bh,053h,07fh,074h,0e9h,001h,0ech,0eah,003h,071h,0eah	; b524  w...3[S.t.....q.
	defb 00bh,0ebh,00ah,03bh,011h,079h,078h,078h,074h,074h,078h,078h,079h,078h,0fdh,0d8h	; b534  .....yxxttxxyx..
	defb 0b3h	; b544

; ----------------------------------------------------------------------
; DATOS partitura_B545: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (70 bytes)
;   0xb545..0xb58b  (70 bytes)
DATA_partitura_B545:
	defb 0feh,001h,0e9h,007h,0eeh,081h,0c1h,0ech,0eah,002h,0d6h,003h,070h,0d3h,00dh,0e9h	; b545  ............p...
	defb 007h,0eeh,081h,0c1h,0eah,006h,0edh,015h,0ebh,089h,01bh,081h,0dbh,002h,0f0h,00eh	; b555  ................
	defb 072h,0d6h,010h,001h,0d2h,003h,021h,073h,001h,021h,071h,0e9h,001h,0a8h,099h,0a8h	; b565  r.....!s.!q.....
	defb 0e9h,007h,077h,003h,035h,031h,055h,051h,0e9h,00eh,079h,0e9h,007h,003h,0e9h,001h	; b575  ..w.51UQ..y.....
	defb 028h,079h,008h,0e9h,007h,021h	; b585

; ----------------------------------------------------------------------
; DATOS partitura_B58B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xb58b..0xb593  (8 bytes)
DATA_partitura_B58B:
	defb 071h,0e9h,001h,0a8h,099h,0a8h,0e9h,007h	; b58b  q.......

; ----------------------------------------------------------------------
; DATOS partitura_B593: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (26 bytes)
;   0xb593..0xb5ad  (26 bytes)
DATA_partitura_B593:
	defb 0dbh,003h,077h,0d1h,003h,035h,031h,055h,051h,0f0h,00eh,092h,0dbh,002h,07bh,0eah	; b593  ..w..51UQ.....{.
	defb 007h,003h,0e9h,007h,0efh,0eeh,081h,0eah,006h,0edh	; b5a3  ..........

; ----------------------------------------------------------------------
; DATOS partitura_B5AD: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (47 bytes)
;   0xb5ad..0xb5dc  (47 bytes)
DATA_partitura_B5AD:
	defb 013h,0ebh,089h,01bh,081h,0dbh,002h,0f0h,002h,072h,0d6h,010h,001h,0d1h,035h,021h	; b5ad  .........r....5!
	defb 0e9h,002h,008h,029h,038h,0e9h,007h,052h,020h,0d2h,0a7h,0d1h,022h,050h,035h,021h	; b5bd  ...)8..R ..."P5!
	defb 0e9h,002h,008h,029h,038h,0e9h,001h,058h,029h,0d2h,0a8h,0e9h,007h,0d1h,0a7h	; b5cd  ...)8..X)......

; ----------------------------------------------------------------------
; DATOS partitura_B5DC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xb5dc..0xb5e0  (4 bytes)
DATA_partitura_B5DC:
	defb 0d2h,073h,0efh,0eeh	; b5dc

; ----------------------------------------------------------------------
; DATOS partitura_B5E0: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (9 bytes)
;   0xb5e0..0xb5e9  (9 bytes)
DATA_partitura_B5E0:
	defb 081h,0eah,006h,0edh,013h,0ebh,089h,01bh,081h	; b5e0  .........

; ----------------------------------------------------------------------
; DATOS partitura_B5E9: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xb5e9..0xb602  (25 bytes)
DATA_partitura_B5E9:
	defb 0dbh,002h,0f0h,002h,072h,0d6h,010h,001h,0d2h,085h,071h,0e9h,002h,058h,079h,088h	; b5e9  ....r.....q..Xy.
	defb 0e9h,001h,0a8h,089h,078h,0e9h,007h,0d1h,003h	; b5f9  ....x....

; ----------------------------------------------------------------------
; DATOS partitura_B602: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xb602..0xb61b  (25 bytes)
DATA_partitura_B602:
	defb 0e9h,001h,0c8h,0d2h,0a9h,088h,0d1h,039h,028h,008h,0e9h,007h,053h,0d0h,004h,0d1h	; b602  .......9(...S...
	defb 0a0h,080h,070h,050h,030h,020h,000h,0d2h,0b3h	; b612  ..pP0 ...

; ----------------------------------------------------------------------
; DATOS partitura_B61B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (43 bytes)
;   0xb61b..0xb646  (43 bytes)
DATA_partitura_B61B:
	defb 0d1h,073h,0e9h,001h,0ech,0eah,002h,073h,0eah,00ah,0ebh,00ah,02bh,011h,0d2h,074h	; b61b  .s.....s....+..t
	defb 074h,078h,079h,078h,0e9h,007h,0efh,0c1h,0eeh,081h,0eah,007h,0edh,016h,0ebh,089h	; b62b  txyx............
	defb 01bh,081h,0dbh,002h,0f0h,002h,072h,0d6h,010h,001h,0d2h	; b63b  ......r....

; ----------------------------------------------------------------------
; DATOS partitura_B646: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (22 bytes)
;   0xb646..0xb65c  (22 bytes)
DATA_partitura_B646:
	defb 003h,021h,073h,001h,021h,071h,0e9h,001h,0a8h,099h,0a8h,0e9h,007h,0edh,004h,07bh	; b646  .!s.!q.........{
	defb 0d1h,007h,057h,072h,0d0h,000h	; b656

; ----------------------------------------------------------------------
; DATOS partitura_B65C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xb65c..0xb667  (11 bytes)
DATA_partitura_B65C:
	defb 0d1h,0b1h,0ech,0eah,002h,0e9h,001h,0b8h,0ebh,00ah,03bh	; b65c  ...........

; ----------------------------------------------------------------------
; DATOS partitura_B667: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (13 bytes)
;   0xb667..0xb674  (13 bytes)
DATA_partitura_B667:
	defb 011h,0eah,00ah,0dbh,003h,0e9h,001h,0d2h,074h,074h,078h,078h,079h	; b667  ........ttxxy

; ----------------------------------------------------------------------
; DATOS partitura_B674: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (46 bytes)
;   0xb674..0xb6a2  (46 bytes)
DATA_partitura_B674:
	defb 078h,0e9h,007h,0efh,0eeh,081h,0c1h,0eah,007h,0edh,016h,0ebh,089h,01bh,081h,0dbh	; b674  x...............
	defb 002h,0f0h,002h,071h,0d6h,010h,001h,0d2h,003h,021h,073h,001h,021h,071h,0e9h,001h	; b684  ...q.....!s.!q..
	defb 0a8h,099h,0a8h,0e9h,007h,0dbh,004h,077h,0d1h,003h,03bh,033h,05bh,053h	; b694  .......w...3[S

; ----------------------------------------------------------------------
; DATOS partitura_B6A2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA2 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (27 bytes)
;   0xb6a2..0xb6bd  (27 bytes)
DATA_partitura_B6A2:
	defb 07fh,072h,0e9h,001h,0ech,0eah,003h,071h,0eah,00ch,0ebh,00ah,03bh,011h,0d2h,079h	; b6a2  .r.....q.......y
	defb 078h,078h,074h,074h,078h,078h,079h,078h,0fdh,054h,0b5h	; b6b2  xxttxxyx.T.

; ----------------------------------------------------------------------
; DATOS partitura_B6BD: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xb6bd..0xb6c4  (7 bytes)
DATA_partitura_B6BD:
	defb 0feh,004h,0e9h,00ch,0d0h,0b5h,0a0h	; b6bd

; ----------------------------------------------------------------------
; DATOS partitura_B6C4: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xb6c4..0xb6dd  (25 bytes)
DATA_partitura_B6C4:
	defb 0a0h,0b3h,013h,0b5h,0a0h,0a0h,0a3h,0e9h,006h,0d1h,060h,060h,070h,070h,080h,080h	; b6c4  ..........``pp..
	defb 090h,090h,0d0h,0e9h,00ch,0b5h,0a0h,0a0h,0a3h	; b6d4  .........

; ----------------------------------------------------------------------
; DATOS partitura_B6DD: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xb6dd..0xb6ef  (18 bytes)
DATA_partitura_B6DD:
	defb 023h,0afh,0feh,001h,0cfh,0cfh,0cfh,0feh,004h,0e9h,00ch,0d0h,0a7h,017h,0a7h,017h	; b6dd  #...............
	defb 0a7h,017h	; b6ed

; ----------------------------------------------------------------------
; DATOS partitura_B6EF: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xb6ef..0xb708  (25 bytes)
DATA_partitura_B6EF:
	defb 0a7h,017h,0a7h,017h,0a7h,017h,0a7h,017h,0a7h,0e9h,006h,0d1h,060h,060h,060h,060h	; b6ef  ............````
	defb 070h,070h,070h,070h,080h,080h,080h,080h,090h	; b6ff  pppp.....

; ----------------------------------------------------------------------
; DATOS partitura_B708: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (32 bytes)
;   0xb708..0xb728  (32 bytes)
DATA_partitura_B708:
	defb 090h,090h,090h,0feh,004h,0e9h,00ch,0d0h,0b5h,0b3h,013h,010h,022h,01bh,010h,020h	; b708  ............"..
	defb 0b5h,0b3h,013h,010h,022h,013h,013h,010h,010h,010h,010h,010h,020h,0b5h,0b3h,013h	; b718  ...."....... ...

; ----------------------------------------------------------------------
; DATOS partitura_B728: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xb728..0xb733  (11 bytes)
DATA_partitura_B728:
	defb 010h,022h,01bh,010h,020h,0b5h,0b0h,012h,010h,022h,010h	; b728  .".. ....".

; ----------------------------------------------------------------------
; DATOS partitura_B733: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (31 bytes)
;   0xb733..0xb752  (31 bytes)
DATA_partitura_B733:
	defb 020h,0d1h,060h,060h,060h,060h,070h,070h,070h,070h,080h,080h,080h,080h,090h,090h	; b733   .````pppp......
	defb 090h,090h,0feh,004h,0f5h,0e9h,00ch,0d0h,0b0h,000h,000h,000h,020h,000h,000h	; b743  ............ ..

; ----------------------------------------------------------------------
; DATOS sin identificar  0xb752..0xb81e  (204 bytes)
DATA_B752:
	defb 000h,0a0h,0a0h,000h,000h,0e9h,002h,0d0h,053h,0d1h,083h,083h,073h,063h,063h,0fbh	; b752  ........S...scc.
	defb 003h,0e9h,00ch,0d0h,0b0h,000h,000h,000h,020h,000h,000h,000h,0a0h,000h,020h,000h	; b762  ........ ..... .
	defb 000h,0d1h,090h,090h,090h,0d0h,0b0h,000h,000h,000h,020h,000h,000h,000h,0a0h,0a0h	; b772  .......... .....
	defb 000h,000h,0e9h,002h,053h,0d1h,083h,083h,073h,063h,063h,0e9h,00ch,0d0h,0b0h,000h	; b782  ....S...scc.....
	defb 000h,000h,020h,000h,000h,000h,0a0h,0a0h,000h,000h,020h,000h,000h,000h,0b0h,000h	; b792  .. ....... .....
	defb 000h,000h,020h,000h,000h,000h,0a0h,0a0h,000h,000h,0e9h,002h,053h,0d1h,083h,083h	; b7a2  .. .........S...
	defb 073h,063h,063h,0d0h,0e9h,00ch,0b0h,000h,000h,000h,020h,000h,000h,000h,0e9h,006h	; b7b2  scc....... .....
	defb 0a0h,0d1h,090h,080h,070h,060h,060h,060h,060h,070h,070h,070h,080h,080h,090h,090h	; b7c2  ....p````ppp....
	defb 090h,0feh,004h,0e9h,00ch,0f5h,0d0h,0b0h,000h,000h,000h,070h,000h,0a0h,000h,000h	; b7d2  ...........p....
	defb 000h,000h,000h,070h,000h,000h,000h,0b0h,000h,000h,000h,020h,000h,000h,000h,0a0h	; b7e2  ...p....... ....
	defb 0a0h,000h,000h,000h,020h,000h,000h,0fbh,003h,0b0h,000h,000h,000h,070h,000h,0a0h	; b7f2  .... ........p..
	defb 000h,000h,000h,000h,000h,070h,000h,000h,000h,0b0h,000h,000h,000h,070h,000h,000h	; b802  .....p.......p..
	defb 000h,070h,070h,020h,000h,070h,070h,020h,000h,0fdh,045h,0b7h	; b812  .pp .pp ..E.

; ----------------------------------------------------------------------
; DATOS partitura_B81E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (20 bytes)
;   0xb81e..0xb832  (20 bytes)
DATA_partitura_B81E:
	defb 0feh,001h,0e9h,006h,0c2h,0e9h,00ch,0eah,008h,0edh,014h,0ebh,087h,01bh,0b1h,0dbh	; b81e  ................
	defb 002h,0d6h,006h,001h	; b82e

; ----------------------------------------------------------------------
; DATOS partitura_B832: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xb832..0xb833  (1 bytes)
DATA_partitura_B832:
	defb 0f0h	; b832

; ----------------------------------------------------------------------
; DATOS partitura_B833: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xb833..0xb839  (6 bytes)
DATA_partitura_B833:
	defb 00bh,072h,0d3h,0a9h,0a1h,0d2h	; b833

; ----------------------------------------------------------------------
; DATOS partitura_B839: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xb839..0xb83a  (1 bytes)
DATA_partitura_B839:
	defb 051h	; b839

; ----------------------------------------------------------------------
; DATOS partitura_B83A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (10 bytes)
;   0xb83a..0xb844  (10 bytes)
DATA_partitura_B83A:
	defb 011h,04bh,043h,05bh,051h,081h,0dbh,003h,05fh,0ech	; b83a  .KC[Q..._.

; ----------------------------------------------------------------------
; DATOS partitura_B844: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xb844..0xb848  (4 bytes)
DATA_partitura_B844:
	defb 0eah,002h,05fh,0eah	; b844

; ----------------------------------------------------------------------
; DATOS partitura_B848: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xb848..0xb859  (17 bytes)
DATA_partitura_B848:
	defb 008h,0edh,014h,0ebh,087h,01bh,0b1h,0dbh,002h,0d1h,00fh,05eh,0d8h,0eah,002h,0ebh	; b848  ...........^....
	defb 009h	; b858

; ----------------------------------------------------------------------
; DATOS partitura_B859: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (39 bytes)
;   0xb859..0xb880  (39 bytes)
DATA_partitura_B859:
	defb 01bh,091h,0d1h,050h,0feh,001h,0e9h,00ch,0eah,006h,0ebh,007h,01bh,0b1h,0dbh,002h	; b859  ...P............
	defb 0f0h,00eh,072h,0d1h,07dh,030h,050h,00dh,0d2h,0a0h,0d1h,000h,03ch,000h,0d2h,0a0h	; b869  ..r.}0P.....<...
	defb 0d1h,000h,0d2h,05dh,0c0h,0d1h,050h	; b879

; ----------------------------------------------------------------------
; DATOS partitura_B880: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xb880..0xb888  (8 bytes)
DATA_partitura_B880:
	defb 07dh,050h,070h,0ach,0a0h,080h,070h,08eh	; b880  }Pp...p.

; ----------------------------------------------------------------------
; DATOS partitura_B888: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xb888..0xb890  (8 bytes)
DATA_partitura_B888:
	defb 0a0h,05fh,0feh,001h,0e9h,00ch,0eah,008h	; b888  ._......

; ----------------------------------------------------------------------
; DATOS partitura_B890: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xb890..0xb896  (6 bytes)
DATA_partitura_B890:
	defb 0edh,014h,0ebh,087h,017h,0b1h	; b890

; ----------------------------------------------------------------------
; DATOS partitura_B896: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (22 bytes)
;   0xb896..0xb8ac  (22 bytes)
DATA_partitura_B896:
	defb 0dbh,002h,0d6h,006h,001h,0f0h,00bh,072h,0d2h,085h,07dh,0d3h,0a3h,0d2h,003h,013h	; b896  .......r..}.....
	defb 0d2h,085h,075h,0a3h,0d1h,035h	; b8a6

; ----------------------------------------------------------------------
; DATOS partitura_B8AC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xb8ac..0xb8af  (3 bytes)
DATA_partitura_B8AC:
	defb 015h,0d2h,083h	; b8ac

; ----------------------------------------------------------------------
; DATOS partitura_B8AF: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (32 bytes)
;   0xb8af..0xb8cf  (32 bytes)
DATA_partitura_B8AF:
	defb 0d2h,085h,079h,0d3h,031h,051h,073h,081h,0a1h,0d2h,001h,011h,0d2h,085h,075h,0a3h	; b8af  ..y.1Qs.......u.
	defb 037h,053h,073h,0feh,001h,0e9h,00ch,0eah,008h,0ebh,007h,01bh,0b1h,0dbh,002h,0d6h	; b8bf  7Ss.............

; ----------------------------------------------------------------------
; DATOS partitura_B8CF: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xb8cf..0xb8d2  (3 bytes)
DATA_partitura_B8CF:
	defb 006h,001h,0f0h	; b8cf

; ----------------------------------------------------------------------
; DATOS partitura_B8D2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xb8d2..0xb8d6  (4 bytes)
DATA_partitura_B8D2:
	defb 00bh,071h,0d2h,07dh	; b8d2

; ----------------------------------------------------------------------
; DATOS sin identificar  0xb8d6..0xb95d  (135 bytes)
DATA_B8D6:
	defb 030h,050h,00dh,0d3h,0a0h,0d2h,000h,03ch,000h,0d3h,0a0h,0d2h,000h,0d3h,057h,0eah	; b8d6  0P.....<......W.
	defb 005h,0e9h,006h,0d4h,050h,070h,080h,0a0h,0d3h,000h,010h,030h,050h,070h,080h,0a0h	; b8e6  ....Pp.....0Pp..
	defb 0d2h,000h,010h,030h,0eah,008h,0e9h,00ch,0d2h,050h,07dh,050h,070h,0ach,0a0h,080h	; b8f6  ...0.....P}Pp...
	defb 070h,08eh,0a0h,057h,0d4h,0eah,004h,0e9h,006h,0d4h,030h,050h,070h,080h,0a0h,0d3h	; b906  p..W......0Pp...
	defb 000h,010h,030h,050h,070h,080h,0a0h,0d2h,000h,010h,030h,050h,0feh,001h,0e9h,00ch	; b916  ..0Pp.....0P....
	defb 0eah,008h,0edh,014h,0ebh,087h,017h,0b1h,0dbh,002h,0d6h,006h,001h,0f0h,00bh,072h	; b926  ...............r
	defb 0d2h,085h,07dh,0d3h,0a3h,0d2h,003h,013h,0d2h,085h,075h,0a3h,035h,0d1h,015h,0d2h	; b936  ..}.......u.5...
	defb 083h,0d2h,085h,079h,0d3h,031h,051h,073h,081h,0a1h,0d2h,001h,011h,0d2h,085h,075h	; b946  ...y.1Qs.......u
	defb 0a3h,037h,053h,073h,0fdh,0c2h,0b8h	; b956

; ----------------------------------------------------------------------
; DATOS partitura_B95D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (32 bytes)
;   0xb95d..0xb97d  (32 bytes)
DATA_partitura_B95D:
	defb 0feh,001h,0e9h,00ch,0eah,00bh,0ebh,009h,01bh,0b1h,0dbh,003h,0d4h,0a5h,0a0h,0a0h	; b95d  ................
	defb 0a7h,0d3h,005h,000h,000h,003h,000h,0d4h,030h,070h,0a0h,0d3h,015h,010h,010h,017h	; b96d  ........0p......

; ----------------------------------------------------------------------
; DATOS partitura_B97D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xb97d..0xb97e  (1 bytes)
DATA_partitura_B97D:
	defb 0f5h	; b97d

; ----------------------------------------------------------------------
; DATOS partitura_B97E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xb97e..0xb990  (18 bytes)
DATA_partitura_B97E:
	defb 0eah,00bh,0ebh,009h,01bh,0b1h,0d4h,05fh,0ech,0eah,002h,05fh,0fbh,002h,0feh,001h	; b97e  ......._..._....
	defb 0e9h,006h	; b98e

; ----------------------------------------------------------------------
; DATOS partitura_B990: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (46 bytes)
;   0xb990..0xb9be  (46 bytes)
DATA_partitura_B990:
	defb 0c2h,0e9h,00ch,0ech,0eah,005h,0f0h,001h,073h,0d3h,057h,0d2h,007h,03fh,0d3h,087h	; b990  ........s.W..?..
	defb 0d2h,007h,0d3h,05dh,0c1h,057h,0d2h,037h,007h,057h,0d1h,00fh,0d2h,056h,0e9h,006h	; b9a0  ...].W.7.W...V..
	defb 0d4h,030h,050h,070h,080h,0a0h,0d3h,000h,010h,030h,050h,070h,080h,0a0h	; b9b0  .0Pp.....0Pp..

; ----------------------------------------------------------------------
; DATOS partitura_B9BE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (23 bytes)
;   0xb9be..0xb9d5  (23 bytes)
DATA_partitura_B9BE:
	defb 0d2h,000h,010h,030h,0feh,001h,0e9h,00ch,0eah,00bh,0ebh,009h,01bh,0b1h,0dbh,003h	; b9be  ...0............
	defb 0f5h,0d4h,031h,081h,0d3h,031h,0d4h	; b9ce

; ----------------------------------------------------------------------
; DATOS partitura_B9D5: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xb9d5..0xb9d6  (1 bytes)
DATA_partitura_B9D5:
	defb 039h	; b9d5

; ----------------------------------------------------------------------
; DATOS partitura_B9D6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xb9d6..0xb9e7  (17 bytes)
DATA_partitura_B9D6:
	defb 03fh,031h,081h,0d3h,031h,0d4h,033h,0d3h,031h,0d4h,033h,03fh,0fbh,002h,0feh,001h	; b9d6  ?1..1.3.1.3?....
	defb 0e9h	; b9e6

; ----------------------------------------------------------------------
; DATOS partitura_B9E7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xb9e7..0xb9ee  (7 bytes)
DATA_partitura_B9E7:
	defb 00ch,0eah,00bh,0ebh,009h,01bh,0b1h	; b9e7

; ----------------------------------------------------------------------
; DATOS partitura_B9EE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xb9ee..0xb9f2  (4 bytes)
DATA_partitura_B9EE:
	defb 0dbh,003h,0d4h,05eh	; b9ee

; ----------------------------------------------------------------------
; DATOS sin identificar  0xb9f2..0xba4c  (90 bytes)
DATA_B9F2:
	defb 030h,057h,0d3h,057h,0d4h,05fh,051h,0d3h,001h,051h,071h,081h,075h,0d4h,05eh,030h	; b9f2  0W.W._Q..Qq.u.^0
	defb 057h,0d3h,054h,0d4h,0a0h,080h,070h,055h,0a0h,0d3h,000h,056h,0d4h,030h,05fh,0feh	; ba02  W.T...pU...V.0_.
	defb 001h,0e9h,00ch,0eah,00bh,0ebh,009h,01bh,0b1h,0dbh,003h,0f5h,0d4h,031h,081h,0d3h	; ba12  .............1..
	defb 031h,0d4h,035h,0d3h,033h,0d4h,03fh,031h,081h,0d3h,031h,0d4h,035h,0d3h,033h,0d4h	; ba22  1.5.3.?1..1.5.3.
	defb 03fh,031h,081h,0d3h,031h,0d4h,039h,03fh,031h,081h,0d3h,031h,0d4h,033h,031h,0d3h	; ba32  ?1..1.9?1..1.31.
	defb 033h,0d4h,037h,032h,030h,032h,030h,0fdh,0e4h,0b9h	; ba42  3.72020...

; ----------------------------------------------------------------------
; DATOS partitura_BA4C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (27 bytes)
;   0xba4c..0xba67  (27 bytes)
DATA_partitura_BA4C:
	defb 0feh,001h,0e9h,00ch,0f8h,050h,0eah,00fh,0ebh,009h,03bh,0b1h,0dbh,003h,0d5h,0a5h	; ba4c  .....P..........
	defb 0a0h,0a0h,0a7h,0d4h,005h,000h,000h,003h,000h,0d5h,030h	; ba5c  ..........0

; ----------------------------------------------------------------------
; DATOS partitura_BA67: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xba67..0xba6a  (3 bytes)
DATA_partitura_BA67:
	defb 070h,0a0h,0d4h	; ba67

; ----------------------------------------------------------------------
; DATOS partitura_BA6A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (32 bytes)
;   0xba6a..0xba8a  (32 bytes)
DATA_partitura_BA6A:
	defb 015h,010h,010h,017h,0f5h,0eah,00fh,0ebh,009h,03bh,0f1h,0d5h,05fh,0ech,0eah,003h	; ba6a  ............_...
	defb 05fh,0fbh,002h,0feh,001h,0e9h,00ch,0f8h,009h,0eah,008h,0edh,052h,0ebh,087h,03bh	; ba7a  _...........R...

; ----------------------------------------------------------------------
; DATOS partitura_BA8A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xba8a..0xba95  (11 bytes)
DATA_partitura_BA8A:
	defb 0f1h,0dbh,002h,0f0h,00eh,073h,0d3h,057h,0d2h,007h,03fh	; ba8a  .....s.W..?

; ----------------------------------------------------------------------
; DATOS partitura_BA95: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (24 bytes)
;   0xba95..0xbaad  (24 bytes)
DATA_partitura_BA95:
	defb 0d3h,087h,0d2h,007h,0d3h,05fh,057h,0d2h,037h,007h,057h,0d1h,00fh,0d2h,057h,0e9h	; ba95  ....._W.7.W...W.
	defb 006h,0eah,007h,0f8h,002h,0edh,014h,0ebh	; baa5  ........

; ----------------------------------------------------------------------
; DATOS partitura_BAAD: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xbaad..0xbabe  (17 bytes)
DATA_partitura_BAAD:
	defb 089h,025h,021h,0d4h,030h,050h,070h,080h,0a0h,0d3h,000h,010h,030h,050h,070h,080h	; baad  .%!.0Pp.....0Pp.
	defb 0a0h	; babd

; ----------------------------------------------------------------------
; DATOS partitura_BABE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (28 bytes)
;   0xbabe..0xbada  (28 bytes)
DATA_partitura_BABE:
	defb 0d2h,000h,010h,030h,050h,0feh,001h,0e9h,00ch,0f5h,0f8h,023h,0eah,00fh,0ebh,019h	; babe  ...0P......#....
	defb 03bh,0f1h,0dbh,003h,0d5h,031h,081h,0d4h,031h,0d5h,039h,0f8h	; bace  .....1..1.9.

; ----------------------------------------------------------------------
; DATOS partitura_BADA: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (15 bytes)
;   0xbada..0xbae9  (15 bytes)
DATA_partitura_BADA:
	defb 009h,0edh,052h,0ebh,087h,017h,0f1h,03fh,0f8h,023h,0ebh,019h,03bh,0f1h,031h	; bada  ..R....?.#....1

; ----------------------------------------------------------------------
; DATOS partitura_BAE9: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (36 bytes)
;   0xbae9..0xbb0d  (36 bytes)
DATA_partitura_BAE9:
	defb 081h,0d4h,031h,0d5h,033h,0d4h,031h,0d5h,033h,0f8h,009h,0edh,052h,0ebh,087h,017h	; bae9  ..1.3.1.3...R...
	defb 0f1h,03fh,0fbh,002h,0feh,001h,0e9h,00ch,0f8h,050h,0eah,00fh,0ebh,009h,03bh,0b1h	; baf9  .?.......P......
	defb 0dbh,003h,0d5h,05eh	; bb09

; ----------------------------------------------------------------------
; DATOS sin identificar  0xbb0d..0xbb69  (92 bytes)
DATA_BB0D:
	defb 030h,057h,0d4h,057h,0d5h,05fh,051h,0d4h,001h,051h,071h,0a1h,085h,0d5h,05eh,030h	; bb0d  0W.W._Q..Qq...^0
	defb 057h,0d4h,054h,0d5h,0a0h,080h,070h,055h,0a0h,0d4h,000h,056h,0d5h,030h,05fh,0feh	; bb1d  W.T...pU...V.0_.
	defb 001h,0e9h,00ch,0f8h,050h,0eah,00fh,0ebh,009h,03bh,0b1h,0dbh,003h,0f5h,0d5h,031h	; bb2d  ....P..........1
	defb 081h,0d4h,031h,0d5h,035h,0d4h,033h,0d5h,03fh,031h,081h,0d4h,031h,0d5h,035h,0d4h	; bb3d  ..1.5.3.?1..1.5.
	defb 033h,0d5h,03fh,031h,081h,0d4h,031h,0d5h,039h,03fh,031h,081h,0d4h,031h,0d5h,033h	; bb4d  3.?1..1.9?1..1.3
	defb 031h,0d4h,033h,0d5h,037h,032h,030h,032h,030h,0fdh,0fdh,0bah	; bb5d  1.3.72020...

; ----------------------------------------------------------------------
; DATOS partitura_BB69: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xbb69..0xbb71  (8 bytes)
DATA_partitura_BB69:
	defb 0feh,001h,0e9h,00ch,0f6h,0f8h,011h,0eah	; bb69  ........

; ----------------------------------------------------------------------
; DATOS partitura_BB71: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xbb71..0xbb73  (2 bytes)
DATA_partitura_BB71:
	defb 00eh,0edh	; bb71

; ----------------------------------------------------------------------
; DATOS partitura_BB73: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (40 bytes)
;   0xbb73..0xbb9b  (40 bytes)
DATA_partitura_BB73:
	defb 014h,0ebh,087h,037h,0b1h,0dbh,004h,0d6h,006h,001h,0f0h,00eh,073h,0d3h,0a9h,0f0h	; bb73  ...7........s...
	defb 002h,051h,0a1h,0d2h,051h,011h,04bh,043h,05bh,051h,081h,0dbh,003h,05fh,0ech,0eah	; bb83  .Q..Q.KC[Q..._..
	defb 004h,057h,0eah,003h,057h,0eah,008h,0edh	; bb93  .W..W...

; ----------------------------------------------------------------------
; DATOS partitura_BB9B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xbb9b..0xbbac  (17 bytes)
DATA_partitura_BB9B:
	defb 014h,0ebh,087h,01bh,0f1h,0dbh,004h,0d1h,00fh,0eah,003h,05eh,0f8h,048h,0eah,00ch	; bb9b  ...........^.H..
	defb 0ebh	; bbab

; ----------------------------------------------------------------------
; DATOS partitura_BBAC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (10 bytes)
;   0xbbac..0xbbb6  (10 bytes)
DATA_partitura_BBAC:
	defb 009h,03bh,091h,0d2h,050h,0feh,001h,0e9h,00ch,0f8h	; bbac  ....P.....

; ----------------------------------------------------------------------
; DATOS partitura_BBB6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (13 bytes)
;   0xbbb6..0xbbc3  (13 bytes)
DATA_partitura_BBB6:
	defb 048h,0eah,00ch,0ebh,009h,03bh,0b1h,0dbh,002h,0f0h,00bh,0d1h,0d2h	; bbb6  H............

; ----------------------------------------------------------------------
; DATOS partitura_BBC3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (49 bytes)
;   0xbbc3..0xbbf4  (49 bytes)
DATA_partitura_BBC3:
	defb 07dh,030h,050h,00dh,0d3h,0a0h,0d2h,000h,03ch,000h,0d3h,0a0h,0d2h,000h,0d3h,05dh	; bbc3  }0P.....<......]
	defb 0c0h,0d2h,050h,07dh,050h,070h,0ach,0a0h,080h,070h,08eh,0a0h,05fh,0f9h,041h,0bfh	; bbd3  ..P}Pp...p.._.A.
	defb 0feh,001h,0e9h,00ch,0f6h,0f8h,011h,0eah,00dh,0ebh,009h,03bh,0f1h,0dbh,002h,0d6h	; bbe3  ................
	defb 006h	; bbf3

; ----------------------------------------------------------------------
; DATOS partitura_BBF4: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xbbf4..0xbbfa  (6 bytes)
DATA_partitura_BBF4:
	defb 001h,0f0h,00eh,071h,0d2h,07dh	; bbf4

; ----------------------------------------------------------------------
; DATOS sin identificar  0xbbfa..0xbc4c  (82 bytes)
DATA_BBFA:
	defb 030h,050h,00dh,0d3h,0a0h,0d2h,000h,03ch,000h,0d3h,0a0h,0d2h,000h,0d3h,057h,0eah	; bbfa  0P.....<......W.
	defb 00ch,0e9h,006h,0d4h,050h,070h,080h,0a0h,0d3h,000h,010h,030h,050h,070h,080h,0a0h	; bc0a  ....Pp.....0Pp..
	defb 0d2h,000h,010h,030h,0eah,00dh,0e9h,00ch,0d2h,050h,07dh,050h,070h,0ach,0a0h,080h	; bc1a  ...0.....P}Pp...
	defb 070h,08eh,0a0h,057h,0d4h,0eah,00ch,0e9h,006h,0d4h,030h,050h,070h,080h,0a0h,0d3h	; bc2a  p..W......0Pp...
	defb 000h,010h,030h,050h,070h,080h,0a0h,0d2h,000h,010h,030h,050h,0f9h,041h,0bfh,0fdh	; bc3a  ..0Pp.....0P.A..
	defb 0e3h,0bbh	; bc4a

; ----------------------------------------------------------------------
; DATOS partitura_BC4C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (21 bytes)
;   0xbc4c..0xbc61  (21 bytes)
DATA_partitura_BC4C:
	defb 0feh,001h,0e9h,006h,0c2h,0eeh,001h,0e9h,00ch,0f8h,011h,0eah,007h,0edh,012h,0ebh	; bc4c  ................
	defb 087h,017h,0f1h,0dbh,001h	; bc5c

; ----------------------------------------------------------------------
; DATOS partitura_BC61: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (52 bytes)
;   0xbc61..0xbc95  (52 bytes)
DATA_partitura_BC61:
	defb 0d6h,006h,001h,0f0h,00eh,022h,0d3h,0a9h,0a1h,0d2h,051h,011h,04bh,043h,05bh,051h	; bc61  ....."....Q.KC[Q
	defb 081h,0dbh,003h,05fh,0ech,0eah,002h,05fh,0eah,005h,0edh,011h,0ebh,087h,01bh,0f1h	; bc71  ..._..._........
	defb 0dbh,002h,0d1h,00fh,0eah,002h,05eh,0f8h,048h,0eah,003h,0d2h,050h,0feh,001h,0efh	; bc81  ......^.H...P...
	defb 0eeh,001h,0e9h,006h	; bc91

; ----------------------------------------------------------------------
; DATOS partitura_BC95: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (15 bytes)
;   0xbc95..0xbca4  (15 bytes)
DATA_partitura_BC95:
	defb 0e9h,00ch,0f8h,048h,0eah,006h,0edh,012h,0ebh,087h,01bh,0b1h,0dbh,002h,0f0h	; bc95  ...H...........

; ----------------------------------------------------------------------
; DATOS partitura_BCA4: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (19 bytes)
;   0xbca4..0xbcb7  (19 bytes)
DATA_partitura_BCA4:
	defb 00bh,0d1h,0d2h,07dh,030h,050h,00dh,0d3h,0a0h,0d2h,000h,03ch,000h,0d3h,0a0h,0d2h	; bca4  ...}0P.....<....
	defb 000h,0d3h,05dh	; bcb4

; ----------------------------------------------------------------------
; DATOS partitura_BCB7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (26 bytes)
;   0xbcb7..0xbcd1  (26 bytes)
DATA_partitura_BCB7:
	defb 0c0h,0d2h,050h,07dh,050h,070h,0ach,0a0h,080h,070h,08eh,0a0h,05dh,0e9h,006h,0ech	; bcb7  ..P}Pp...p..]...
	defb 0eah,003h,050h,0f9h,0d9h,0bfh,0feh,001h,0e9h,006h	; bcc7  ..P.......

; ----------------------------------------------------------------------
; DATOS partitura_BCD1: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xbcd1..0xbcd4  (3 bytes)
DATA_partitura_BCD1:
	defb 0efh,0eeh,001h	; bcd1

; ----------------------------------------------------------------------
; DATOS partitura_BCD4: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (19 bytes)
;   0xbcd4..0xbce7  (19 bytes)
DATA_partitura_BCD4:
	defb 0c2h,0e9h,00ch,0f8h,011h,0eah,007h,0ebh,009h,01bh,0b1h,0dbh,002h,0d6h,006h,001h	; bcd4  ................
	defb 0f0h,00bh,071h	; bce4

; ----------------------------------------------------------------------
; DATOS partitura_BCE7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xbce7..0xbce9  (2 bytes)
DATA_partitura_BCE7:
	defb 0d2h,07dh	; bce7

; ----------------------------------------------------------------------
; DATOS sin identificar  0xbce9..0xbd38  (79 bytes)
DATA_BCE9:
	defb 030h,050h,00dh,0d3h,0a0h,0d2h,000h,03ch,000h,0d3h,0a0h,0d2h,000h,0d3h,057h,0eah	; bce9  0P.....<......W.
	defb 006h,0e9h,006h,0d4h,050h,070h,080h,0a0h,0d3h,000h,010h,030h,050h,070h,080h,0a0h	; bcf9  ....Pp.....0Pp..
	defb 0d2h,000h,010h,030h,0eah,007h,0e9h,00ch,0d2h,050h,07dh,050h,070h,0ach,0a0h,080h	; bd09  ...0.....P}Pp...
	defb 070h,08eh,0a0h,057h,0d4h,0eah,006h,0e9h,006h,0d4h,030h,050h,070h,080h,0a0h,0d3h	; bd19  p..W......0Pp...
	defb 000h,010h,030h,050h,070h,080h,0a0h,0d2h,000h,0f9h,0d9h,0bfh,0fdh,0cdh,0bch	; bd29  ..0Pp..........

; ----------------------------------------------------------------------
; DATOS partitura_BD38: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (27 bytes)
;   0xbd38..0xbd53  (27 bytes)
DATA_partitura_BD38:
	defb 0feh,001h,0e9h,00ch,0f8h,015h,0eah,00ah,0ebh,009h,03bh,0b1h,0dbh,004h,0d3h,05fh	; bd38  ..............._
	defb 07fh,08fh,0dbh,001h,0d4h,053h,0d3h,053h,0d4h,053h,0d3h	; bd48  .....S.S.S.

; ----------------------------------------------------------------------
; DATOS partitura_BD53: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (35 bytes)
;   0xbd53..0xbd76  (35 bytes)
DATA_partitura_BD53:
	defb 073h,0d4h,053h,0d3h,053h,0a3h,073h,0d4h,053h,0d3h,053h,0d4h,053h,0d3h,073h,0d4h	; bd53  s.S.S.s.S.S.S.s.
	defb 053h,0d3h,053h,0a7h,0feh,001h,0e9h,00ch,0f8h,015h,0eah,00ah,0ebh,009h,03bh,0b1h	; bd63  S.S.............
	defb 0dbh,001h,0d4h	; bd73

; ----------------------------------------------------------------------
; DATOS partitura_BD76: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (23 bytes)
;   0xbd76..0xbd8d  (23 bytes)
DATA_partitura_BD76:
	defb 053h,0d3h,053h,0d4h,053h,0d3h,073h,0d4h,053h,0d3h,053h,0a3h,073h,0d4h,053h,0d3h	; bd76  S.S.S.s.S.S.s.S.
	defb 053h,0d4h,053h,0d3h,073h,0d4h,053h	; bd86

; ----------------------------------------------------------------------
; DATOS partitura_BD8D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (12 bytes)
;   0xbd8d..0xbd99  (12 bytes)
DATA_partitura_BD8D:
	defb 0d3h,053h,0a7h,0d4h,053h,0d3h,053h,0d4h,053h,0d3h,073h,0d4h	; bd8d  .S..S.S.S.s.

; ----------------------------------------------------------------------
; DATOS partitura_BD99: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (9 bytes)
;   0xbd99..0xbda2  (9 bytes)
DATA_partitura_BD99:
	defb 053h,0d3h,053h,0a3h,073h,0d4h,053h,0d3h,053h	; bd99  S.S.s.S.S

; ----------------------------------------------------------------------
; DATOS partitura_BDA2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (5 bytes)
;   0xbda2..0xbda7  (5 bytes)
DATA_partitura_BDA2:
	defb 0d4h,053h,0d3h,073h,0d4h	; bda2

; ----------------------------------------------------------------------
; DATOS partitura_BDA7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (9 bytes)
;   0xbda7..0xbdb0  (9 bytes)
DATA_partitura_BDA7:
	defb 053h,0d3h,053h,0a3h,073h,0feh,001h,0e9h,00ch	; bda7  S.S.s....

; ----------------------------------------------------------------------
; DATOS partitura_BDB0: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (22 bytes)
;   0xbdb0..0xbdc6  (22 bytes)
DATA_partitura_BDB0:
	defb 0f8h,015h,0eah,00ah,0ebh,009h,03bh,0b1h,0dbh,001h,0f5h,0d4h,031h,081h,0d3h,031h	; bdb0  ............1..1
	defb 0d4h,031h,071h,0d3h,031h,0d4h	; bdc0

; ----------------------------------------------------------------------
; DATOS partitura_BDC6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xbdc6..0xbdc8  (2 bytes)
DATA_partitura_BDC6:
	defb 031h,071h	; bdc6

; ----------------------------------------------------------------------
; DATOS partitura_BDC8: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (37 bytes)
;   0xbdc8..0xbded  (37 bytes)
DATA_partitura_BDC8:
	defb 0d4h,033h,0d3h,033h,0d4h,033h,0d3h,053h,0d4h,031h,081h,0d3h,031h,0d4h,031h,071h	; bdc8  .3.3.3.S.1..1.1q
	defb 0d3h,031h,0d4h,031h,071h,0d4h,033h,0d3h,033h,0d4h,033h,0d3h,053h,0fbh,002h,0feh	; bdd8  .1.1q.3.3.3.S...
	defb 001h,0e9h,00ch,0f8h,015h	; bde8

; ----------------------------------------------------------------------
; DATOS partitura_BDED: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (12 bytes)
;   0xbded..0xbdf9  (12 bytes)
DATA_partitura_BDED:
	defb 0eah,009h,0ebh,009h,03bh,0b1h,0dbh,001h,0d3h,053h,0d2h,053h	; bded  .........S.S

; ----------------------------------------------------------------------
; DATOS sin identificar  0xbdf9..0xbe6a  (113 bytes)
DATA_BDF9:
	defb 0d3h,053h,0d2h,073h,0d3h,053h,0d2h,053h,0a3h,073h,0d3h,053h,0d2h,053h,0d3h,053h	; bdf9  .S.s.S.S.s.S.S.S
	defb 0d2h,073h,0d3h,053h,0d2h,053h,0a7h,0d3h,053h,0d2h,053h,0d3h,053h,0d2h,073h,0d3h	; be09  .s.S.S..S.S.S.s.
	defb 053h,0d2h,053h,0a3h,073h,0d3h,053h,0d2h,053h,0d3h,053h,0d2h,073h,0d3h,053h,0d2h	; be19  S.S.s.S.S.S.s.S.
	defb 053h,0a3h,073h,0feh,001h,0e9h,00ch,0f8h,015h,0eah,009h,0ebh,009h,03bh,0b1h,0dbh	; be29  S.s.............
	defb 001h,0f5h,0d3h,031h,081h,0d2h,031h,0d3h,031h,071h,0d2h,031h,0d3h,031h,071h,0d3h	; be39  ...1..1.1q.1.1q.
	defb 033h,0d2h,033h,0d3h,033h,0d2h,053h,0d3h,031h,081h,0d2h,031h,0d3h,031h,071h,0d2h	; be49  3.3.3.S.1..1.1q.
	defb 031h,0d3h,031h,071h,0d3h,033h,0d2h,033h,0d3h,033h,0d2h,053h,0fbh,002h,0fdh,0e7h	; be59  1.1q.3.3.3.S....
	defb 0bdh	; be69

; ----------------------------------------------------------------------
; DATOS partitura_BE6A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xbe6a..0xbe83  (25 bytes)
DATA_partitura_BE6A:
	defb 0feh,001h,0e9h,00ch,0f8h,015h,0eah,00ah,0ebh,009h,03bh,0b1h,0dbh,004h,0d3h,01fh	; be6a  ................
	defb 00fh,01fh,0c1h,0dbh,001h,003h,073h,003h,0a3h	; be7a  ......s..

; ----------------------------------------------------------------------
; DATOS partitura_BE83: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (35 bytes)
;   0xbe83..0xbea6  (35 bytes)
DATA_partitura_BE83:
	defb 003h,073h,083h,083h,003h,073h,003h,0a3h,003h,073h,087h,0feh,001h,0e9h,00ch,0f8h	; be83  .s...s...s......
	defb 015h,0eah,00ah,0ebh,009h,03bh,0b1h,0dbh,001h,0d3h,003h,073h,003h,0a3h,003h,073h	; be93  ...........s...s
	defb 087h,003h,073h	; bea3

; ----------------------------------------------------------------------
; DATOS partitura_BEA6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xbea6..0xbeae  (8 bytes)
DATA_partitura_BEA6:
	defb 003h,0a3h,003h,073h,087h,003h,073h,003h	; bea6  ...s..s.

; ----------------------------------------------------------------------
; DATOS partitura_BEAE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xbeae..0xbec7  (25 bytes)
DATA_partitura_BEAE:
	defb 0a3h,003h,073h,087h,003h,073h,003h,0a3h,003h,073h,083h,051h,0feh,001h,0e9h,00ch	; beae  ..s..s...s.Q....
	defb 0f8h,015h,0eah,00ah,0ebh,009h,03bh,0b1h,0dbh	; bebe  .........

; ----------------------------------------------------------------------
; DATOS partitura_BEC7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xbec7..0xbece  (7 bytes)
DATA_partitura_BEC7:
	defb 001h,0f5h,0d3h,055h,03bh,0d4h,0a3h	; bec7

; ----------------------------------------------------------------------
; DATOS partitura_BECE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (12 bytes)
;   0xbece..0xbeda  (12 bytes)
DATA_partitura_BECE:
	defb 0d3h,053h,0d4h,0a3h,0d3h,081h,055h,035h,035h,0d4h,0a3h,0d3h	; bece  .S....U55...

; ----------------------------------------------------------------------
; DATOS partitura_BEDA: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xbeda..0xbeec  (18 bytes)
DATA_partitura_BEDA:
	defb 053h,0d4h,0a3h,0d3h,081h,0fbh,002h,0feh,001h,0e9h,00ch,0c1h,0f8h,015h,0eah,009h	; beda  S...............
	defb 0ebh,009h	; beea

; ----------------------------------------------------------------------
; DATOS partitura_BEEC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xbeec..0xbef2  (6 bytes)
DATA_partitura_BEEC:
	defb 03bh,0b1h,0dbh,001h,0d2h,003h	; beec

; ----------------------------------------------------------------------
; DATOS partitura_BEF2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xbef2..0xbef3  (1 bytes)
DATA_partitura_BEF2:
	defb 073h	; bef2

; ----------------------------------------------------------------------
; DATOS sin identificar  0xbef3..0xbf41  (78 bytes)
DATA_BEF3:
	defb 003h,0a3h,003h,073h,087h,003h,073h,003h,0a3h,003h,073h,087h,003h,073h,003h,0a3h	; bef3  ...s..s...s..s..
	defb 003h,073h,087h,003h,073h,003h,0a3h,003h,073h,083h,051h,0feh,001h,0e9h,00ch,0f8h	; bf03  .s..s...s.Q.....
	defb 015h,0eah,00bh,0ebh,009h,03bh,0b1h,0dbh,001h,0f5h,0d3h,055h,039h,0c1h,0eah,009h	; bf13  ...........U9...
	defb 0d3h,0a3h,0d2h,053h,0d3h,0a3h,0d2h,081h,0eah,00bh,0d3h,055h,035h,033h,0c1h,0eah	; bf23  ...S.......U53..
	defb 009h,0d3h,0a3h,0d2h,053h,0d3h,0a3h,0d2h,081h,0fbh,002h,0fdh,0e1h,0beh	; bf33  ....S.........

; ----------------------------------------------------------------------
; DATOS sonido_BF41: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392
;   (3 bytes)
;   0xbf41..0xbf44  (3 bytes)
DATA_sonido_BF41:
	defb 0feh,001h,0e9h	; bf41

; ----------------------------------------------------------------------
; DATOS partitura_BF44: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xbf44..0xbf4c  (8 bytes)
DATA_partitura_BF44:
	defb 00ch,0f1h,011h,048h,001h,020h,0eah,00eh	; bf44  ...H. ..

; ----------------------------------------------------------------------
; DATOS partitura_BF4C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (5 bytes)
;   0xbf4c..0xbf51  (5 bytes)
DATA_partitura_BF4C:
	defb 0edh,017h,0ebh,089h,037h	; bf4c

; ----------------------------------------------------------------------
; DATOS partitura_BF51: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (5 bytes)
;   0xbf51..0xbf56  (5 bytes)
DATA_partitura_BF51:
	defb 0b1h,0dbh,002h,0d6h,006h	; bf51

; ----------------------------------------------------------------------
; DATOS partitura_BF56: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xbf56..0xbf5a  (4 bytes)
DATA_partitura_BF56:
	defb 001h,0f0h,00bh,072h	; bf56

; ----------------------------------------------------------------------
; DATOS partitura_BF5A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xbf5a..0xbf5e  (4 bytes)
DATA_partitura_BF5A:
	defb 0d2h,085h,07dh,0f6h	; bf5a

; ----------------------------------------------------------------------
; DATOS partitura_BF5E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (27 bytes)
;   0xbf5e..0xbf79  (27 bytes)
DATA_partitura_BF5E:
	defb 0f8h,009h,0eah,00ch,0d3h,0a3h,0eah,00ah,0ebh,007h,017h,071h,0d2h,003h,013h,0f1h	; bf5e  ...........q....
	defb 011h,048h,001h,020h,0eah,00eh,0edh,017h,0ebh,089h,037h	; bf6e  .H. ......7

; ----------------------------------------------------------------------
; DATOS partitura_BF79: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (39 bytes)
;   0xbf79..0xbfa0  (39 bytes)
DATA_partitura_BF79:
	defb 0b1h,0d2h,085h,075h,0a3h,0eah,00ch,0edh,096h,0f0h,00fh,073h,0d1h,035h,0f0h,00eh	; bf79  ...u.......s.5..
	defb 071h,0eah,00bh,0ebh,007h,017h,0f1h,015h,0d2h,083h,0eah,00eh,0edh,017h,0ebh,089h	; bf89  q...............
	defb 037h,0b1h,0d2h,085h,079h,0f6h,0f8h	; bf99

; ----------------------------------------------------------------------
; DATOS partitura_BFA0: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (94 bytes)
;   0xbfa0..0xbffe  (94 bytes)
DATA_partitura_BFA0:
	defb 009h,0d3h,031h,0eah,00ah,0ebh,007h,017h,071h,051h,0e9h,004h,07ah,0edh,024h,0ebh	; bfa0  ..1.....qQ..z.$.
	defb 087h,027h,005h,085h,0a5h,0d2h,005h,016h,0e9h,00ch,0f1h,011h,048h,001h,020h,0eah	; bfb0  .'..........H. .
	defb 00eh,0edh,017h,0ebh,089h,037h,0b1h,0d2h,085h,075h,0a3h,0f0h,00fh,054h,0eah,00fh	; bfc0  .....7...u...T..
	defb 037h,0f0h,00eh,052h,0eah,00eh,053h,073h,0fah,0feh,001h,0efh,0eeh,001h,0e9h,00ch	; bfd0  7..R..Ss........
	defb 0f8h,009h,0eah,00ch,0edh,014h,0ebh,089h,027h,0f1h,0dbh,004h,0d6h,006h,001h,0f0h	; bfe0  ........'.......
	defb 00bh,072h,0f5h,0d3h,035h,039h,03fh,035h,035h,033h,03fh,0fbh,002h,0fah	; bff0  .r..59?553?...

; ----------------------------------------------------------------------
; DATOS sin identificar  0xbffe..0xc000  (2 bytes)
DATA_BFFE:
	defb 07bh,00ch	; bffe
