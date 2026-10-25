; ==========================================================================
; METAL GEAR 2 SOLID SNAKE - Konami (1990) - MSX2 - MegaROM RC-767 de 512 KB (Konami SCC) - banco 55 (se ejecuta en 0xa000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x0a000


; ----------------------------------------------------------------------
; DATOS partitura_A000: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xa000..0xa006  (6 bytes)
DATA_partitura_A000:
	defb 0f9h,083h,0a1h,0f0h,007h,001h	; a000

; ----------------------------------------------------------------------
; DATOS partitura_A006: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (16 bytes)
;   0xa006..0xa016  (16 bytes)
DATA_partitura_A006:
	defb 0d9h,0d6h,002h,001h,0eah,004h,0d0h,09bh,09bh,0f9h,083h,0a1h,0f0h,008h,001h,0d9h	; a006  ................

; ----------------------------------------------------------------------
; DATOS partitura_A016: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (10 bytes)
;   0xa016..0xa020  (10 bytes)
DATA_partitura_A016:
	defb 0d6h,002h,001h,0eah,004h,0d0h,03bh,03bh,03bh,03bh	; a016  ..........

; ----------------------------------------------------------------------
; DATOS partitura_A020: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xa020..0xa023  (3 bytes)
DATA_partitura_A020:
	defb 0f0h,007h,001h	; a020

; ----------------------------------------------------------------------
; DATOS partitura_A023: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xa023..0xa02e  (11 bytes)
DATA_partitura_A023:
	defb 0d9h,0d6h,002h,001h,0eah,004h,0d0h,0abh,0abh,0fdh,000h	; a023  ...........

; ----------------------------------------------------------------------
; DATOS partitura_A02E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa02e..0xa02f  (1 bytes)
DATA_partitura_A02E:
	defb 0a0h	; a02e

; ----------------------------------------------------------------------
; DATOS partitura_A02F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xa02f..0xa040  (17 bytes)
DATA_partitura_A02F:
	defb 0f9h,09ah,0a1h,0f0h,007h,001h,0d9h,0d6h,002h,001h,0eah,004h,0d0h,05bh,05bh,0f9h	; a02f  .............[[.
	defb 09ah	; a03f

; ----------------------------------------------------------------------
; DATOS partitura_A040: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xa040..0xa046  (6 bytes)
DATA_partitura_A040:
	defb 0a1h,0f0h,008h,001h,0d9h,0d6h	; a040

; ----------------------------------------------------------------------
; DATOS partitura_A046: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xa046..0xa051  (11 bytes)
DATA_partitura_A046:
	defb 002h,001h,0eah,003h,0d0h,0bbh,0bbh,0bbh,0bbh,0f0h,007h	; a046  ...........

; ----------------------------------------------------------------------
; DATOS partitura_A051: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (13 bytes)
;   0xa051..0xa05e  (13 bytes)
DATA_partitura_A051:
	defb 001h,0d9h,0d6h,002h,001h,0eah,004h,0d0h,07bh,08bh,0fdh,02fh,0a0h	; a051  ........{../.

; ----------------------------------------------------------------------
; DATOS partitura_A05E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa05e..0xa05f  (1 bytes)
DATA_partitura_A05E:
	defb 0f9h	; a05e

; ----------------------------------------------------------------------
; DATOS partitura_A05F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa05f..0xa060  (1 bytes)
DATA_partitura_A05F:
	defb 0b1h	; a05f

; ----------------------------------------------------------------------
; DATOS partitura_A060: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (9 bytes)
;   0xa060..0xa069  (9 bytes)
DATA_partitura_A060:
	defb 0a1h,0f6h,0f8h,009h,0edh,01dh,0ebh,082h,074h	; a060  ........t

; ----------------------------------------------------------------------
; DATOS partitura_A069: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xa069..0xa082  (25 bytes)
DATA_partitura_A069:
	defb 051h,0eah,00fh,0d5h,0b9h,0b5h,0b7h,0b9h,0b5h,0b7h,0f9h,0b1h,0a1h,0f6h,0edh,01dh	; a069  Q...............
	defb 0ebh,082h,074h,051h,0eah,00fh,0d4h,009h,005h	; a079  ..tQ.....

; ----------------------------------------------------------------------
; DATOS partitura_A082: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (13 bytes)
;   0xa082..0xa08f  (13 bytes)
DATA_partitura_A082:
	defb 00fh,009h,005h,00fh,009h,005h,00fh,0f6h,0edh,01dh,0ebh,082h,074h	; a082  ............t

; ----------------------------------------------------------------------
; DATOS partitura_A08F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xa08f..0xa091  (2 bytes)
DATA_partitura_A08F:
	defb 051h,0eah	; a08f

; ----------------------------------------------------------------------
; DATOS partitura_A091: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (12 bytes)
;   0xa091..0xa09d  (12 bytes)
DATA_partitura_A091:
	defb 00fh,0d4h,013h,01bh,017h,0d5h,0b3h,0bbh,0b7h,0fdh,05eh,0a0h	; a091  ..........^.

; ----------------------------------------------------------------------
; DATOS partitura_A09D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa09d..0xa0a5  (8 bytes)
DATA_partitura_A09D:
	defb 0f9h,0d4h,0a1h,0f8h,005h,0d9h,0d6h,002h	; a09d  ........

; ----------------------------------------------------------------------
; DATOS partitura_A0A5: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (34 bytes)
;   0xa0a5..0xa0c7  (34 bytes)
DATA_partitura_A0A5:
	defb 001h,0ebh,007h,035h,051h,0eah,006h,0d3h,081h,0b1h,0d2h,051h,021h,0b1h,051h,0d3h	; a0a5  ...5Q......Q!.Q.
	defb 0b1h,0d2h,021h,081h,051h,0d1h,021h,0d2h,0b1h,0f9h,0d4h,0a1h,0d9h,0d6h,002h,001h	; a0b5  ..!.Q.!.........
	defb 0ebh,007h	; a0c5

; ----------------------------------------------------------------------
; DATOS partitura_A0C7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (20 bytes)
;   0xa0c7..0xa0db  (20 bytes)
DATA_partitura_A0C7:
	defb 035h,051h,0eah,006h,0f5h,0d2h,071h,031h,001h,031h,071h,0b1h,0fbh,004h,0d9h,0d6h	; a0c7  5Q....q1.1q.....
	defb 002h,001h,0ebh,007h	; a0d7

; ----------------------------------------------------------------------
; DATOS partitura_A0DB: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (14 bytes)
;   0xa0db..0xa0e9  (14 bytes)
DATA_partitura_A0DB:
	defb 035h,051h,0eah,006h,0d2h,011h,041h,071h,0a1h,0d1h,011h,041h,0d3h,0b1h	; a0db  5Q....Aq...A..

; ----------------------------------------------------------------------
; DATOS partitura_A0E9: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (10 bytes)
;   0xa0e9..0xa0f3  (10 bytes)
DATA_partitura_A0E9:
	defb 0d2h,021h,051h,081h,0b1h,0d1h,021h,0fdh,09dh,0a0h	; a0e9  .!Q...!...

; ----------------------------------------------------------------------
; DATOS partitura_A0F3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (26 bytes)
;   0xa0f3..0xa10d  (26 bytes)
DATA_partitura_A0F3:
	defb 0f9h,0fah,0a1h,0f8h,009h,0ebh,087h,033h,071h,0eah,008h,0f0h,007h,032h,0edh,011h	; a0f3  .......3q....2..
	defb 0d1h,021h,0d2h,089h,0b1h,059h,0f9h,0fah,0a1h,0f8h	; a103  .!...Y....

; ----------------------------------------------------------------------
; DATOS partitura_A10D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (16 bytes)
;   0xa10d..0xa11d  (16 bytes)
DATA_partitura_A10D:
	defb 005h,0ech,0f0h,008h,001h,0d9h,0d6h,002h,001h,0eah,001h,0d0h,0bbh,0bbh,0bbh,0bbh	; a10d  ................

; ----------------------------------------------------------------------
; DATOS partitura_A11D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (23 bytes)
;   0xa11d..0xa134  (23 bytes)
DATA_partitura_A11D:
	defb 0f8h,009h,0ebh,087h,033h,071h,0eah,008h,0f0h,007h,032h,0edh,011h,0d2h,070h,0a0h	; a11d  ....3q....2...p.
	defb 045h,071h,0d3h,0a1h,0d2h,050h,080h	; a12d

; ----------------------------------------------------------------------
; DATOS partitura_A134: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xa134..0xa136  (2 bytes)
DATA_partitura_A134:
	defb 025h,051h	; a134

; ----------------------------------------------------------------------
; DATOS partitura_A136: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (5 bytes)
;   0xa136..0xa13b  (5 bytes)
DATA_partitura_A136:
	defb 0d3h,081h,0fdh,0f3h,0a0h	; a136

; ----------------------------------------------------------------------
; DATOS partitura_A13B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (47 bytes)
;   0xa13b..0xa16a  (47 bytes)
DATA_partitura_A13B:
	defb 0f9h,039h,0a2h,0c0h,0eeh,081h,0ebh,007h,012h,0f1h,0eah,004h,0f0h,007h,032h,0edh	; a13b  .9............2.
	defb 011h,0d1h,021h,0d2h,089h,0b1h,058h,0f9h,039h,0a2h,0ech,0f0h,008h,001h,0d9h,0d6h	; a14b  ..!...X.9.......
	defb 002h,001h,0eah,001h,0d0h,07bh,07bh,07bh,07bh,0c0h,0eeh,081h,0ebh,007h,012h	; a15b  .....{{{{......

; ----------------------------------------------------------------------
; DATOS partitura_A16A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xa16a..0xa170  (6 bytes)
DATA_partitura_A16A:
	defb 0f1h,0eah,004h,0f0h,007h,032h	; a16a

; ----------------------------------------------------------------------
; DATOS partitura_A170: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (47 bytes)
;   0xa170..0xa19f  (47 bytes)
DATA_partitura_A170:
	defb 0edh,011h,0d2h,070h,0a0h,045h,071h,0d3h,0a1h,0d2h,050h,080h,025h,051h,0d3h,080h	; a170  ...p.Eq...P.%Q..
	defb 0fdh,03bh,0a1h,0feh,001h,0f0h,007h,001h,0e9h,00eh,0d9h,0d6h,002h,001h,0eah,004h	; a180  ................
	defb 0d0h,07bh,07bh,07bh,07bh,09bh,09bh,09bh,09bh,0fah,0feh,001h,0f0h,007h,001h	; a190  .{{{{..........

; ----------------------------------------------------------------------
; DATOS partitura_A19F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (19 bytes)
;   0xa19f..0xa1b2  (19 bytes)
DATA_partitura_A19F:
	defb 0e9h,00eh,0d9h,0d6h,002h,001h,0eah,004h,0d0h,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh	; a19f  ................
	defb 0bbh,0fah,0feh	; a1af

; ----------------------------------------------------------------------
; DATOS partitura_A1B2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa1b2..0xa1b3  (1 bytes)
DATA_partitura_A1B2:
	defb 001h	; a1b2

; ----------------------------------------------------------------------
; DATOS partitura_A1B3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xa1b3..0xa1b6  (3 bytes)
DATA_partitura_A1B3:
	defb 0f6h,0f8h,009h	; a1b3

; ----------------------------------------------------------------------
; DATOS partitura_A1B6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (13 bytes)
;   0xa1b6..0xa1c3  (13 bytes)
DATA_partitura_A1B6:
	defb 0e9h,007h,0edh,01dh,0ebh,082h,074h,051h,0eah,00fh,0d4h,009h,005h	; a1b6  ......tQ.....

; ----------------------------------------------------------------------
; DATOS partitura_A1C3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xa1c3..0xa1c6  (3 bytes)
DATA_partitura_A1C3:
	defb 00fh,009h,005h	; a1c3

; ----------------------------------------------------------------------
; DATOS partitura_A1C6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (13 bytes)
;   0xa1c6..0xa1d3  (13 bytes)
DATA_partitura_A1C6:
	defb 00fh,009h,005h,00fh,0f5h,027h,027h,023h,02bh,027h,027h,0fbh,002h	; a1c6  .....''#+''..

; ----------------------------------------------------------------------
; DATOS partitura_A1D3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (16 bytes)
;   0xa1d3..0xa1e3  (16 bytes)
DATA_partitura_A1D3:
	defb 0fah,0feh,001h,0f8h,005h,0e9h,00eh,0d9h,0d6h,002h,001h,0ebh,007h,035h,051h,0eah	; a1d3  .............5Q.

; ----------------------------------------------------------------------
; DATOS partitura_A1E3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xa1e3..0xa1f5  (18 bytes)
DATA_partitura_A1E3:
	defb 006h,0f5h,0d2h,071h,031h,001h,031h,071h,0b1h,0fbh,004h,0f5h,0d2h,091h,051h,021h	; a1e3  ...q1.1q......Q!
	defb 051h,091h	; a1f3

; ----------------------------------------------------------------------
; DATOS partitura_A1F5: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (13 bytes)
;   0xa1f5..0xa202  (13 bytes)
DATA_partitura_A1F5:
	defb 0d1h,011h,0fbh,004h,0fah,0feh,001h,0f8h,009h,0e9h,00eh,0ebh,087h	; a1f5  .............

; ----------------------------------------------------------------------
; DATOS partitura_A202: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (10 bytes)
;   0xa202..0xa20c  (10 bytes)
DATA_partitura_A202:
	defb 033h,071h,0eah,008h,0f0h,007h,032h,0edh,011h,0d2h	; a202  3q....2...

; ----------------------------------------------------------------------
; DATOS partitura_A20C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xa20c..0xa20f  (3 bytes)
DATA_partitura_A20C:
	defb 030h,000h,030h	; a20c

; ----------------------------------------------------------------------
; DATOS partitura_A20F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xa20f..0xa220  (17 bytes)
DATA_partitura_A20F:
	defb 070h,0b5h,0d1h,000h,030h,070h,0d2h,0bah,030h,000h,030h,070h,0b5h,0d1h,000h,030h	; a20f  p...0p..0.0p...0
	defb 070h	; a21f

; ----------------------------------------------------------------------
; DATOS partitura_A220: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xa220..0xa222  (2 bytes)
DATA_partitura_A220:
	defb 0bah,0d2h	; a220

; ----------------------------------------------------------------------
; DATOS partitura_A222: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xa222..0xa234  (18 bytes)
DATA_partitura_A222:
	defb 050h,020h,050h,090h,0d1h,015h,020h,050h,090h,01ah,0d2h,050h,020h,050h,090h,0d1h	; a222  P P... P...P P..
	defb 015h,020h	; a232

; ----------------------------------------------------------------------
; DATOS partitura_A234: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xa234..0xa246  (18 bytes)
DATA_partitura_A234:
	defb 050h,090h,0d0h,01ah,0fah,0feh,001h,0e9h,00eh,0c0h,0eeh,081h,0ebh,007h,012h,0f1h	; a234  P...............
	defb 0eah,004h	; a244

; ----------------------------------------------------------------------
; DATOS partitura_A246: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (21 bytes)
;   0xa246..0xa25b  (21 bytes)
DATA_partitura_A246:
	defb 0f0h,007h,032h,0d2h,030h,000h,030h,070h,0b5h,0d1h,000h,030h,070h,0d2h,0bah,030h	; a246  ..2.0.0p...0p..0
	defb 000h,030h,070h,0b5h,0d1h	; a256

; ----------------------------------------------------------------------
; DATOS partitura_A25B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa25b..0xa25c  (1 bytes)
DATA_partitura_A25B:
	defb 000h	; a25b

; ----------------------------------------------------------------------
; DATOS partitura_A25C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (27 bytes)
;   0xa25c..0xa277  (27 bytes)
DATA_partitura_A25C:
	defb 030h,070h,0bah,0d2h,050h,020h,050h,090h,0d1h,015h,020h,050h,090h,01ah,0d2h,050h	; a25c  0p..P P... P...P
	defb 020h,050h,090h,0d1h,015h,020h,050h,090h,0d0h,019h,0fah	; a26c   P... P....

; ----------------------------------------------------------------------
; DATOS partitura_A277: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (26 bytes)
;   0xa277..0xa291  (26 bytes)
DATA_partitura_A277:
	defb 0feh,004h,0d1h,0f5h,0e9h,009h,090h,070h,080h,092h,092h,092h,070h,080h,092h,092h	; a277  .......p....p...
	defb 092h,092h,0e9h,001h,064h,073h,084h,093h,0fbh,004h	; a287  ....ds....

; ----------------------------------------------------------------------
; DATOS partitura_A291: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xa291..0xa2a2  (17 bytes)
DATA_partitura_A291:
	defb 0feh,004h,0d1h,0f5h,0e9h,009h,090h,070h,080h,092h,092h,092h,070h,080h,092h,092h	; a291  .......p....p...
	defb 092h	; a2a1

; ----------------------------------------------------------------------
; DATOS partitura_A2A2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xa2a2..0xa2bb  (25 bytes)
DATA_partitura_A2A2:
	defb 092h,0e9h,001h,064h,073h,084h,093h,0fbh,008h,0f5h,0e9h,009h,0d0h,062h,062h,0d1h	; a2a2  ...ds........bb.
	defb 092h,092h,070h,080h,092h,092h,092h,092h,0e9h	; a2b2  ..p......

; ----------------------------------------------------------------------
; DATOS partitura_A2BB: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa2bb..0xa2bc  (1 bytes)
DATA_partitura_A2BB:
	defb 001h	; a2bb

; ----------------------------------------------------------------------
; DATOS partitura_A2BC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa2bc..0xa2c4  (8 bytes)
DATA_partitura_A2BC:
	defb 064h,073h,084h,093h,0fbh,004h,0fch,002h	; a2bc  ds......

; ----------------------------------------------------------------------
; DATOS partitura_A2C4: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xa2c4..0xa2c6  (2 bytes)
DATA_partitura_A2C4:
	defb 091h,0a2h	; a2c4

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa2c6..0xa2c9  (3 bytes)
DATA_A2C6:
	defb 0fdh,077h,0a2h	; a2c6

; ----------------------------------------------------------------------
; DATOS partitura_A2C9: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa2c9..0xa2d1  (8 bytes)
DATA_partitura_A2C9:
	defb 0feh,001h,0e9h,009h,0c0h,0edh,014h,0ebh	; a2c9  ........

; ----------------------------------------------------------------------
; DATOS partitura_A2D1: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xa2d1..0xa2dc  (11 bytes)
DATA_partitura_A2D1:
	defb 089h,02dh,002h,0eah,009h,0d0h,0f5h,040h,040h,040h,070h	; a2d1  .-.....@@@p

; ----------------------------------------------------------------------
; DATOS partitura_A2DC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xa2dc..0xa2e7  (11 bytes)
DATA_partitura_A2DC:
	defb 070h,070h,060h,060h,060h,040h,040h,040h,020h,060h,0fbh	; a2dc  pp```@@@ `.

; ----------------------------------------------------------------------
; DATOS partitura_A2E7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xa2e7..0xa2ed  (6 bytes)
DATA_partitura_A2E7:
	defb 007h,040h,040h,040h,070h,070h	; a2e7

; ----------------------------------------------------------------------
; DATOS partitura_A2ED: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (5 bytes)
;   0xa2ed..0xa2f2  (5 bytes)
DATA_partitura_A2ED:
	defb 070h,060h,060h,060h,040h	; a2ed

; ----------------------------------------------------------------------
; DATOS partitura_A2F2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xa2f2..0xa2f5  (3 bytes)
DATA_partitura_A2F2:
	defb 040h,040h,020h	; a2f2

; ----------------------------------------------------------------------
; DATOS partitura_A2F5: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xa2f5..0xa2f8  (3 bytes)
DATA_partitura_A2F5:
	defb 0feh,001h,0e9h	; a2f5

; ----------------------------------------------------------------------
; DATOS partitura_A2F8: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (5 bytes)
;   0xa2f8..0xa2fd  (5 bytes)
DATA_partitura_A2F8:
	defb 009h,0c0h,0edh,014h,0ebh	; a2f8

; ----------------------------------------------------------------------
; DATOS partitura_A2FD: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa2fd..0xa305  (8 bytes)
DATA_partitura_A2FD:
	defb 089h,02dh,001h,0f5h,0eah,008h,0d1h,040h	; a2fd  .-.....@

; ----------------------------------------------------------------------
; DATOS partitura_A305: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa305..0xa306  (1 bytes)
DATA_partitura_A305:
	defb 0eah	; a305

; ----------------------------------------------------------------------
; DATOS partitura_A306: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa306..0xa30e  (8 bytes)
DATA_partitura_A306:
	defb 006h,040h,0eah,004h,040h,0eah,008h,070h	; a306  .@..@..p

; ----------------------------------------------------------------------
; DATOS partitura_A30E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa30e..0xa316  (8 bytes)
DATA_partitura_A30E:
	defb 0eah,006h,070h,0eah,004h,070h,0eah,008h	; a30e  ..p..p..

; ----------------------------------------------------------------------
; DATOS partitura_A316: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa316..0xa317  (1 bytes)
DATA_partitura_A316:
	defb 060h	; a316

; ----------------------------------------------------------------------
; DATOS partitura_A317: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xa317..0xa31d  (6 bytes)
DATA_partitura_A317:
	defb 0eah,006h,060h,0eah,004h,060h	; a317

; ----------------------------------------------------------------------
; DATOS partitura_A31D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa31d..0xa31e  (1 bytes)
DATA_partitura_A31D:
	defb 0eah	; a31d

; ----------------------------------------------------------------------
; DATOS partitura_A31E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa31e..0xa326  (8 bytes)
DATA_partitura_A31E:
	defb 008h,040h,0eah,006h,040h,0eah,004h,040h	; a31e  .@..@..@

; ----------------------------------------------------------------------
; DATOS partitura_A326: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xa326..0xa33f  (25 bytes)
DATA_partitura_A326:
	defb 0eah,008h,020h,060h,0fbh,008h,0edh,014h,0ebh,089h,02dh,001h,0f5h,0eah,008h,0d1h	; a326  .. `......-.....
	defb 040h,0eah,006h,040h,0eah,004h,040h,0eah,008h	; a336  @..@..@..

; ----------------------------------------------------------------------
; DATOS partitura_A33F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (91 bytes)
;   0xa33f..0xa39a  (91 bytes)
DATA_partitura_A33F:
	defb 070h,0eah,006h,070h,0eah,004h,070h,0eah,008h,060h,0eah,006h,060h,0eah,004h,060h	; a33f  p..p..p..`..`..`
	defb 0eah,008h,040h,0eah,006h,040h,0eah,004h,040h,0eah,008h,020h,060h,0fbh,007h,0eah	; a34f  ..@..@..@.. `...
	defb 008h,040h,0eah,006h,040h,0eah,004h,040h,0eah,008h,070h,0eah,006h,070h,0eah,004h	; a35f  .@..@..@..p..p..
	defb 070h,0eah,008h,060h,0eah,006h,060h,0eah,004h,060h,0eah,008h,040h,0eah,006h,040h	; a36f  p..`..`..`..@..@
	defb 0eah,007h,0f0h,003h,001h,0ebh,019h,027h,002h,0d0h,021h,0f9h,046h,0a8h,0f9h,046h	; a37f  .......'..!.F..F
	defb 0a8h,0f9h,046h,0a8h,0f9h,046h,0a8h,0fch,002h,0f5h,0a2h	; a38f  ..F..F.....

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa39a..0xa39d  (3 bytes)
DATA_A39A:
	defb 0fdh,0c9h,0a2h	; a39a

; ----------------------------------------------------------------------
; DATOS partitura_A39D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xa39d..0xa3a8  (11 bytes)
DATA_partitura_A39D:
	defb 0feh,001h,0f1h,089h,026h,001h,00ah,0f3h,001h,0f0h,000h	; a39d  ....&......

; ----------------------------------------------------------------------
; DATOS partitura_A3A8: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (24 bytes)
;   0xa3a8..0xa3c0  (24 bytes)
DATA_partitura_A3A8:
	defb 0e9h,009h,0ebh,009h,02ch,002h,0dbh,001h,0f5h,0eah,008h,0d1h,041h,0d0h,021h,001h	; a3a8  ....,.......A.!.
	defb 0d1h,0b1h,091h,071h,091h,0fbh,008h,0dch	; a3b8  ...q....

; ----------------------------------------------------------------------
; DATOS partitura_A3C0: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (24 bytes)
;   0xa3c0..0xa3d8  (24 bytes)
DATA_partitura_A3C0:
	defb 0feh,001h,0e9h,009h,0f1h,002h,00ah,001h,00ah,0eah,00ah,0edh,023h,0ebh,087h,033h	; a3c0  ............#..3
	defb 004h,0f0h,003h,021h,0d2h,042h,07fh,0f6h	; a3d0  ...!.B..

; ----------------------------------------------------------------------
; DATOS partitura_A3D8: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (10 bytes)
;   0xa3d8..0xa3e2  (10 bytes)
DATA_partitura_A3D8:
	defb 0f8h,00ah,0ech,0eah,003h,072h,0eah,002h,073h,0f1h	; a3d8  .....r..s.

; ----------------------------------------------------------------------
; DATOS partitura_A3E2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xa3e2..0xa3e8  (6 bytes)
DATA_partitura_A3E2:
	defb 002h,00ah,001h,00ah,0eah,009h	; a3e2

; ----------------------------------------------------------------------
; DATOS partitura_A3E8: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (168 bytes)
;   0xa3e8..0xa490  (168 bytes)
DATA_partitura_A3E8:
	defb 0ebh,087h,033h,004h,060h,020h,042h,0bfh,0f6h,0f8h,00ah,0ech,0eah,003h,0b3h,0eah	; a3e8  ..3.` B.........
	defb 002h,0b2h,0f1h,002h,00ah,001h,00ah,0eah,009h,0ebh,087h,023h,004h,090h,070h,091h	; a3f8  ...........#..p.
	defb 070h,06fh,0f6h,0f8h,00ah,0ech,0eah,003h,063h,0eah,002h,062h,0f1h,002h,00ah,001h	; a408  po......c..b....
	defb 00ah,0eah,008h,0ebh,087h,013h,004h,070h,060h,07fh,0f6h,0f8h,00ah,0ech,0eah,003h	; a418  .......p`.......
	defb 077h,0eah,002h,073h,0f1h,002h,00ah,001h,00ah,0eah,00ah,0edh,023h,0ebh,087h,033h	; a428  w..s........#..3
	defb 004h,0f0h,003h,021h,0d2h,042h,07fh,0f6h,0f8h,00ah,0ech,0eah,003h,072h,0eah,002h	; a438  ...!.B.......r..
	defb 073h,0f1h,002h,00ah,001h,00ah,0eah,009h,0ebh,087h,033h,004h,060h,020h,042h,0bfh	; a448  s.........3.` B.
	defb 0f6h,0f8h,00ah,0ech,0eah,003h,0b3h,0eah,002h,0b2h,0f1h,002h,00ah,001h,00ah,0eah	; a458  ................
	defb 009h,0ebh,087h,023h,004h,090h,070h,091h,070h,06fh,0f6h,0f8h,00ah,0ech,0eah,003h	; a468  ...#..p.po......
	defb 063h,0eah,002h,062h,0f1h,002h,00ah,001h,00ah,0eah,008h,0ebh,087h,013h,004h,070h	; a478  c..b...........p
	defb 060h,07fh,0f6h,0f8h,00ah,0ech,0eah,003h	; a488  `.......

; ----------------------------------------------------------------------
; DATOS partitura_A490: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (34 bytes)
;   0xa490..0xa4b2  (34 bytes)
DATA_partitura_A490:
	defb 077h,0eah,002h,071h,0f6h,0f8h,002h,0eah,00bh,0ebh,019h,037h,002h,0f0h,003h,001h	; a490  w..q.......7....
	defb 0d1h,021h,0f9h,08eh,0a8h,0f9h,08eh,0a8h,0f9h,08eh,0a8h,0f9h,08eh,0a8h,0fch,002h	; a4a0  .!..............
	defb 0c0h,0a3h	; a4b0

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa4b2..0xa4b5  (3 bytes)
DATA_A4B2:
	defb 0fdh,09dh,0a3h	; a4b2

; ----------------------------------------------------------------------
; DATOS partitura_A4B5: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xa4b5..0xa4c6  (17 bytes)
DATA_partitura_A4B5:
	defb 0feh,001h,0f2h,001h,0e9h,009h,0f0h,000h,0ebh,009h,02ch,002h,0dbh,001h,0c0h,0f5h	; a4b5  ..........,.....
	defb 0eah	; a4c5

; ----------------------------------------------------------------------
; DATOS partitura_A4C6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (22 bytes)
;   0xa4c6..0xa4dc  (22 bytes)
DATA_partitura_A4C6:
	defb 008h,0d0h,041h,041h,041h,041h,041h,041h,0d1h,0b1h,0fbh,007h,0d0h,041h,041h,041h	; a4c6  ..AAAAAA.....AAA
	defb 041h,041h,041h,0d1h,0b0h,0dch	; a4d6

; ----------------------------------------------------------------------
; DATOS partitura_A4DC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xa4dc..0xa4e7  (11 bytes)
DATA_partitura_A4DC:
	defb 0feh,001h,0e9h,009h,0eeh,081h,0c1h,0f5h,0f2h,001h,0eah	; a4dc  ...........

; ----------------------------------------------------------------------
; DATOS partitura_A4E7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (9 bytes)
;   0xa4e7..0xa4f0  (9 bytes)
DATA_partitura_A4E7:
	defb 003h,0ech,0f0h,003h,032h,0d2h,042h,07fh,072h	; a4e7  ....2.B.r

; ----------------------------------------------------------------------
; DATOS partitura_A4F0: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa4f0..0xa4f1  (1 bytes)
DATA_partitura_A4F0:
	defb 073h	; a4f0

; ----------------------------------------------------------------------
; DATOS partitura_A4F1: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xa4f1..0xa4f3  (2 bytes)
DATA_partitura_A4F1:
	defb 060h,020h	; a4f1

; ----------------------------------------------------------------------
; DATOS partitura_A4F3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa4f3..0xa4fb  (8 bytes)
DATA_partitura_A4F3:
	defb 042h,0bfh,0b3h,0b2h,090h,070h,091h,070h	; a4f3  B....p.p

; ----------------------------------------------------------------------
; DATOS partitura_A4FB: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa4fb..0xa4fc  (1 bytes)
DATA_partitura_A4FB:
	defb 06fh	; a4fb

; ----------------------------------------------------------------------
; DATOS partitura_A4FC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa4fc..0xa4fd  (1 bytes)
DATA_partitura_A4FC:
	defb 063h	; a4fc

; ----------------------------------------------------------------------
; DATOS partitura_A4FD: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xa4fd..0xa504  (7 bytes)
DATA_partitura_A4FD:
	defb 062h,070h,060h,07fh,079h,0eeh,081h	; a4fd

; ----------------------------------------------------------------------
; DATOS partitura_A504: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa504..0xa505  (1 bytes)
DATA_partitura_A504:
	defb 0c1h	; a504

; ----------------------------------------------------------------------
; DATOS partitura_A505: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa505..0xa50d  (8 bytes)
DATA_partitura_A505:
	defb 0f2h,001h,0eah,003h,0ech,0f0h,003h,032h	; a505  .......2

; ----------------------------------------------------------------------
; DATOS partitura_A50D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa50d..0xa515  (8 bytes)
DATA_partitura_A50D:
	defb 0d2h,042h,07fh,072h,073h,060h,020h,042h	; a50d  .B.rs` B

; ----------------------------------------------------------------------
; DATOS partitura_A515: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa515..0xa51d  (8 bytes)
DATA_partitura_A515:
	defb 0bfh,0b3h,0b2h,090h,070h,091h,070h,06fh	; a515  ....p.po

; ----------------------------------------------------------------------
; DATOS partitura_A51D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa51d..0xa525  (8 bytes)
DATA_partitura_A51D:
	defb 063h,062h,070h,060h,07fh,077h,0efh,0f8h	; a51d  cbp`.w..

; ----------------------------------------------------------------------
; DATOS partitura_A525: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xa525..0xa52b  (6 bytes)
DATA_partitura_A525:
	defb 002h,0eah,00bh,0ebh,019h,037h	; a525

; ----------------------------------------------------------------------
; DATOS partitura_A52B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xa52b..0xa52d  (2 bytes)
DATA_partitura_A52B:
	defb 002h,0f0h	; a52b

; ----------------------------------------------------------------------
; DATOS partitura_A52D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa52d..0xa52e  (1 bytes)
DATA_partitura_A52D:
	defb 003h	; a52d

; ----------------------------------------------------------------------
; DATOS partitura_A52E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa52e..0xa52f  (1 bytes)
DATA_partitura_A52E:
	defb 001h	; a52e

; ----------------------------------------------------------------------
; DATOS partitura_A52F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa52f..0xa537  (8 bytes)
DATA_partitura_A52F:
	defb 0d2h,0b1h,0f5h,0f8h,023h,0eah,00dh,0ebh	; a52f  ....#...

; ----------------------------------------------------------------------
; DATOS partitura_A537: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa537..0xa53f  (8 bytes)
DATA_partitura_A537:
	defb 019h,042h,001h,0d4h,040h,0d5h,0b0h,040h	; a537  .B..@..@

; ----------------------------------------------------------------------
; DATOS partitura_A53F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa53f..0xa547  (8 bytes)
DATA_partitura_A53F:
	defb 0d4h,070h,0d5h,040h,040h,0f8h,01ch,0eah	; a53f  .p.@@...

; ----------------------------------------------------------------------
; DATOS partitura_A547: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa547..0xa54f  (8 bytes)
DATA_partitura_A547:
	defb 00fh,0ebh,009h,046h,003h,0d5h,042h,042h	; a547  ...F..BB

; ----------------------------------------------------------------------
; DATOS partitura_A54F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa54f..0xa557  (8 bytes)
DATA_partitura_A54F:
	defb 040h,040h,042h,042h,042h,042h,0d5h,021h	; a54f  @@BBBB.!

; ----------------------------------------------------------------------
; DATOS partitura_A557: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xa557..0xa55d  (6 bytes)
DATA_partitura_A557:
	defb 0fbh,004h,0fch,002h,0dch,0a4h	; a557

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa55d..0xa560  (3 bytes)
DATA_A55D:
	defb 0fdh,0b5h,0a4h	; a55d

; ----------------------------------------------------------------------
; DATOS partitura_A560: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xa560..0xa562  (2 bytes)
DATA_partitura_A560:
	defb 0feh,001h	; a560

; ----------------------------------------------------------------------
; DATOS partitura_A562: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (10 bytes)
;   0xa562..0xa56c  (10 bytes)
DATA_partitura_A562:
	defb 0f8h,01ch,0e9h,009h,0edh,034h,0ebh,089h,02dh,001h	; a562  .....4..-.

; ----------------------------------------------------------------------
; DATOS partitura_A56C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xa56c..0xa573  (7 bytes)
DATA_partitura_A56C:
	defb 0f5h,0eah,00ah,0d1h,040h,040h,040h	; a56c

; ----------------------------------------------------------------------
; DATOS partitura_A573: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xa573..0xa57a  (7 bytes)
DATA_partitura_A573:
	defb 070h,070h,070h,060h,060h,060h,040h	; a573

; ----------------------------------------------------------------------
; DATOS partitura_A57A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xa57a..0xa580  (6 bytes)
DATA_partitura_A57A:
	defb 040h,040h,020h,060h,0fbh,008h	; a57a

; ----------------------------------------------------------------------
; DATOS partitura_A580: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (19 bytes)
;   0xa580..0xa593  (19 bytes)
DATA_partitura_A580:
	defb 0feh,001h,0e9h,009h,0f8h,01ch,0edh,014h,0ebh,089h,02dh,001h,0f5h,0eah,007h,0d1h	; a580  ..........-.....
	defb 040h,0eah,004h	; a590

; ----------------------------------------------------------------------
; DATOS partitura_A593: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa593..0xa59b  (8 bytes)
DATA_partitura_A593:
	defb 040h,0eah,002h,040h,0eah,007h,070h,0eah	; a593  @..@..p.

; ----------------------------------------------------------------------
; DATOS partitura_A59B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (34 bytes)
;   0xa59b..0xa5bd  (34 bytes)
DATA_partitura_A59B:
	defb 004h,070h,0eah,002h,070h,0eah,007h,060h,0eah,004h,060h,0eah,002h,060h,0eah,007h	; a59b  .p..p..`..`..`..
	defb 040h,0eah,004h,040h,0eah,002h,040h,0eah,007h,020h,060h,0fbh,008h,0edh,014h,0ebh	; a5ab  @..@..@.. `.....
	defb 089h,02dh	; a5bb

; ----------------------------------------------------------------------
; DATOS partitura_A5BD: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xa5bd..0xa5c3  (6 bytes)
DATA_partitura_A5BD:
	defb 001h,0f5h,0eah,007h,0d1h,040h	; a5bd

; ----------------------------------------------------------------------
; DATOS partitura_A5C3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (20 bytes)
;   0xa5c3..0xa5d7  (20 bytes)
DATA_partitura_A5C3:
	defb 0eah,004h,040h,0eah,002h,040h,0eah,007h,070h,0eah,004h,070h,0eah,002h,070h,0eah	; a5c3  ..@..@..p..p..p.
	defb 007h,060h,0eah,004h	; a5d3

; ----------------------------------------------------------------------
; DATOS partitura_A5D7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (16 bytes)
;   0xa5d7..0xa5e7  (16 bytes)
DATA_partitura_A5D7:
	defb 060h,0eah,002h,060h,0eah,007h,040h,0eah,004h,040h,0eah,002h,040h,0eah,007h,020h	; a5d7  `..`..@..@..@..

; ----------------------------------------------------------------------
; DATOS partitura_A5E7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (37 bytes)
;   0xa5e7..0xa60c  (37 bytes)
DATA_partitura_A5E7:
	defb 060h,0fbh,007h,0eah,007h,040h,0eah,004h,040h,0eah,002h,040h,0eah,007h,070h,0eah	; a5e7  `....@..@..@..p.
	defb 004h,070h,0eah,002h,070h,0eah,007h,060h,0eah,004h,060h,0eah,002h,060h,0eah,007h	; a5f7  .p..p..`..`..`..
	defb 040h,0eah,004h,040h,0eah	; a607

; ----------------------------------------------------------------------
; DATOS partitura_A60C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xa60c..0xa617  (11 bytes)
DATA_partitura_A60C:
	defb 002h,040h,0f8h,002h,0eah,00bh,0f0h,003h,002h,0ebh,019h	; a60c  .@.........

; ----------------------------------------------------------------------
; DATOS partitura_A617: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xa617..0xa630  (25 bytes)
DATA_partitura_A617:
	defb 037h,002h,0d2h,071h,0eah,00ch,0ebh,019h,037h,002h,0f0h,003h,032h,0d6h,020h,001h	; a617  7..q....7...2. .
	defb 0d1h,042h,040h,0ech,0d8h,0eah,003h,040h,0eah	; a627  .B@....@.

; ----------------------------------------------------------------------
; DATOS partitura_A630: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (36 bytes)
;   0xa630..0xa654  (36 bytes)
DATA_partitura_A630:
	defb 002h,040h,0f8h,01dh,0dbh,001h,0ebh,019h,037h,001h,0eah,007h,0d1h,040h,040h,0f5h	; a630  .@......7....@@.
	defb 0eah,006h,040h,0eah,005h,040h,0eah,004h,040h,040h,0eah,003h,040h,040h,0fbh,003h	; a640  ..@..@..@@..@@..
	defb 0f8h,002h,0dch,0d6h	; a650

; ----------------------------------------------------------------------
; DATOS partitura_A654: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (41 bytes)
;   0xa654..0xa67d  (41 bytes)
DATA_partitura_A654:
	defb 020h,001h,0eah,00ch,0ebh,019h,037h,002h,0d1h,021h,042h,040h,0ech,0d8h,0eah,003h	; a654   .....7..!B@....
	defb 040h,0eah,002h,040h,0f8h,01dh,0dbh,001h,0ebh,019h,037h,001h,0eah,007h,0d1h,040h	; a664  @..@......7....@
	defb 040h,0f5h,0eah,006h,040h,0eah,005h,040h,0eah	; a674  @...@..@.

; ----------------------------------------------------------------------
; DATOS partitura_A67D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (16 bytes)
;   0xa67d..0xa68d  (16 bytes)
DATA_partitura_A67D:
	defb 004h,040h,040h,0eah,003h,040h,040h,0fbh,003h,0dch,0f8h,002h,0eah,00bh,0ebh,019h	; a67d  .@@..@@.........

; ----------------------------------------------------------------------
; DATOS partitura_A68D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (52 bytes)
;   0xa68d..0xa6c1  (52 bytes)
DATA_partitura_A68D:
	defb 037h,002h,0f0h,003h,032h,0d6h,020h,001h,0d1h,061h,072h,070h,0ech,0d8h,0eah,003h	; a68d  7...2. ..arp....
	defb 070h,0eah,002h,070h,0f8h,01dh,0dbh,001h,0ebh,019h,037h,001h,0eah,007h,0d1h,040h	; a69d  p..p......7....@
	defb 040h,0f5h,0eah,006h,040h,0eah,005h,040h,0eah,004h,040h,040h,0eah,003h,040h,040h	; a6ad  @...@..@..@@..@@
	defb 0fbh,003h,0f8h,002h	; a6bd

; ----------------------------------------------------------------------
; DATOS partitura_A6C1: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xa6c1..0xa6d2  (17 bytes)
DATA_partitura_A6C1:
	defb 0dch,0eah,00bh,0ebh,019h,037h,002h,0d6h,020h,001h,0d1h,091h,0b2h,0b0h,0ech,0d8h	; a6c1  .....7.. .......
	defb 0eah	; a6d1

; ----------------------------------------------------------------------
; DATOS partitura_A6D2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (38 bytes)
;   0xa6d2..0xa6f8  (38 bytes)
DATA_partitura_A6D2:
	defb 003h,0b0h,0eah,002h,0b0h,0f8h,01dh,0dbh,001h,0ebh,019h,037h,001h,0eah,007h,0d1h	; a6d2  ...........7....
	defb 040h,040h,0f5h,0eah,006h,040h,0eah,005h,040h,0eah,004h,040h,040h,0eah,003h,040h	; a6e2  @@...@..@..@@..@
	defb 040h,0fbh,003h,040h,040h,0dch	; a6f2

; ----------------------------------------------------------------------
; DATOS partitura_A6F8: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xa6f8..0xa6fc  (4 bytes)
DATA_partitura_A6F8:
	defb 0fch,002h,080h,0a5h	; a6f8

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa6fc..0xa6ff  (3 bytes)
DATA_A6FC:
	defb 0fdh,060h,0a5h	; a6fc

; ----------------------------------------------------------------------
; DATOS partitura_A6FF: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (24 bytes)
;   0xa6ff..0xa717  (24 bytes)
DATA_partitura_A6FF:
	defb 0feh,001h,0e9h,009h,0eah,00fh,0ebh,029h,046h,003h,0f5h,0d5h,042h,042h,042h,042h	; a6ff  .......)F...BBBB
	defb 021h,042h,042h,042h,042h,021h,0fbh,004h	; a70f  !BBBB!..

; ----------------------------------------------------------------------
; DATOS partitura_A717: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (34 bytes)
;   0xa717..0xa739  (34 bytes)
DATA_partitura_A717:
	defb 0feh,001h,0e9h,009h,0eah,00fh,0ebh,009h,046h,003h,0f5h,0d4h,040h,0d5h,0b0h,040h	; a717  ........F...@..@
	defb 0d4h,070h,040h,0d5h,0b0h,042h,042h,040h,040h,042h,042h,042h,042h,040h,040h,0fbh	; a727  .p@..BB@@BBBB@@.
	defb 004h,0eah	; a737

; ----------------------------------------------------------------------
; DATOS partitura_A739: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (15 bytes)
;   0xa739..0xa748  (15 bytes)
DATA_partitura_A739:
	defb 00fh,0ebh,009h,046h,003h,0f5h,0d4h,040h,0d5h,0b0h,040h,0d4h,070h,040h,0d5h	; a739  ...F...@..@.p@.

; ----------------------------------------------------------------------
; DATOS partitura_A748: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (50 bytes)
;   0xa748..0xa77a  (50 bytes)
DATA_partitura_A748:
	defb 0b0h,0d5h,042h,042h,040h,040h,042h,042h,042h,042h,040h,040h,0fbh,003h,0d4h,040h	; a748  ..BB@@BBBB@@...@
	defb 0d5h,0b0h,040h,0d4h,070h,040h,0d5h,0b0h,0d5h,042h,042h,040h,040h,042h,042h,042h	; a758  ..@.p@...BB@@BBB
	defb 042h,0ebh,019h,0a5h,001h,0d4h,040h,040h,0eah,00ch,0ebh,019h,037h,002h,0f0h,003h	; a768  B.....@@....7...
	defb 032h,0d6h	; a778

; ----------------------------------------------------------------------
; DATOS partitura_A77A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (31 bytes)
;   0xa77a..0xa799  (31 bytes)
DATA_partitura_A77A:
	defb 020h,001h,0d2h,0b2h,0b0h,0ech,0d8h,0eah,003h,0b0h,0eah,002h,0b0h,0dbh,001h,0ebh	; a77a   ...............
	defb 019h,037h,001h,0eah,007h,0d2h,0b0h,0b0h,0f5h,0eah,006h,0b0h,0eah,005h,0b0h	; a78a  .7.............

; ----------------------------------------------------------------------
; DATOS partitura_A799: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xa799..0xa79b  (2 bytes)
DATA_partitura_A799:
	defb 0eah,004h	; a799

; ----------------------------------------------------------------------
; DATOS partitura_A79B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (134 bytes)
;   0xa79b..0xa821  (134 bytes)
DATA_partitura_A79B:
	defb 0b0h,0b0h,0eah,003h,0b0h,0b0h,0fbh,003h,0dch,0eah,00ch,0ebh,019h,037h,002h,0d6h	; a79b  .............7..
	defb 020h,001h,0d2h,091h,0b2h,0b0h,0ech,0d8h,0eah,003h,0b0h,0eah,002h,0b0h,0dbh,001h	; a7ab   ...............
	defb 0ebh,019h,037h,001h,0eah,007h,0d2h,0b0h,0b0h,0f5h,0eah,006h,0b0h,0eah,005h,0b0h	; a7bb  ..7.............
	defb 0eah,004h,0b0h,0b0h,0eah,003h,0b0h,0b0h,0fbh,003h,0dch,0eah,00bh,0ebh,019h,037h	; a7cb  ...............7
	defb 002h,0f0h,003h,032h,0d6h,020h,001h,0d1h,021h,042h,040h,0ech,0d8h,0eah,003h,040h	; a7db  ...2. ..!B@....@
	defb 0eah,002h,040h,0dbh,001h,0ebh,019h,037h,001h,0eah,007h,0d2h,0b0h,0b0h,0f5h,0eah	; a7eb  ..@....7........
	defb 006h,0b0h,0eah,005h,0b0h,0eah,004h,0b0h,0b0h,0eah,003h,0b0h,0b0h,0fbh,003h,0dch	; a7fb  ................
	defb 0eah,00bh,0ebh,019h,037h,002h,0d6h,020h,001h,0d1h,061h,072h,070h,0ech,0d8h,0eah	; a80b  ....7.. ..arp...
	defb 003h,070h,0eah,002h,070h,0dbh	; a81b

; ----------------------------------------------------------------------
; DATOS partitura_A821: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (15 bytes)
;   0xa821..0xa830  (15 bytes)
DATA_partitura_A821:
	defb 001h,0ebh,019h,037h,001h,0eah,007h,0d2h,0b0h,0b0h,0f5h,0eah,006h,0b0h,0eah	; a821  ...7...........

; ----------------------------------------------------------------------
; DATOS partitura_A830: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (19 bytes)
;   0xa830..0xa843  (19 bytes)
DATA_partitura_A830:
	defb 005h,0b0h,0eah,004h,0b0h,0b0h,0eah,003h,0b0h,0b0h,0fbh,003h,0b0h,0b0h,0dch,0fch	; a830  ................
	defb 002h,017h,0a7h	; a840

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa843..0xa846  (3 bytes)
DATA_A843:
	defb 0fdh,0ffh,0a6h	; a843

; ----------------------------------------------------------------------
; DATOS sonido_A846: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (21 bytes)
;   0xa846..0xa85b  (21 bytes)
DATA_sonido_A846:
	defb 0e9h,009h,0c0h,0e9h,001h,0eah,007h,0ebh,001h,018h,001h,0f5h,0d1h,044h,063h,074h	; a846  .............Dct
	defb 093h,0b4h,0d0h,023h,0fbh	; a856

; ----------------------------------------------------------------------
; DATOS partitura_A85B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (21 bytes)
;   0xa85b..0xa870  (21 bytes)
DATA_partitura_A85B:
	defb 002h,0eah,005h,0f5h,0d1h,044h,063h,074h,093h,0b4h,0d0h,023h,0fbh,002h,0eah,004h	; a85b  .....Dct...#....
	defb 0f5h,0d1h,044h,063h,074h	; a86b

; ----------------------------------------------------------------------
; DATOS partitura_A870: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (22 bytes)
;   0xa870..0xa886  (22 bytes)
DATA_partitura_A870:
	defb 093h,0b4h,0d0h,023h,0fbh,002h,0eah,003h,0f5h,0d1h,044h,063h,074h,093h,0b4h,0d0h	; a870  ...#......Dct...
	defb 023h,0fbh,002h,0eah,002h,0d1h	; a880

; ----------------------------------------------------------------------
; DATOS partitura_A886: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (19 bytes)
;   0xa886..0xa899  (19 bytes)
DATA_partitura_A886:
	defb 044h,063h,074h,093h,0b4h,0d0h,023h,0fah,0e9h,001h,0f6h,0f8h,019h,0eah,00fh,0ebh	; a886  Dct...#.........
	defb 001h,018h,001h	; a896

; ----------------------------------------------------------------------
; DATOS partitura_A899: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xa899..0xa89c  (3 bytes)
DATA_partitura_A899:
	defb 0f5h,0d1h,044h	; a899

; ----------------------------------------------------------------------
; DATOS partitura_A89C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (26 bytes)
;   0xa89c..0xa8b6  (26 bytes)
DATA_partitura_A89C:
	defb 063h,074h,093h,0b4h,0d0h,023h,0fbh,002h,0eah,00ch,0f5h,0d1h,044h,063h,074h,093h	; a89c  ct...#......Dct.
	defb 0b4h,0d0h,023h,0fbh,002h,0eah,00ah,0f5h,0d1h,044h	; a8ac  ..#......D

; ----------------------------------------------------------------------
; DATOS partitura_A8B6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xa8b6..0xa8b8  (2 bytes)
DATA_partitura_A8B6:
	defb 063h,074h	; a8b6

; ----------------------------------------------------------------------
; DATOS partitura_A8B8: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (19 bytes)
;   0xa8b8..0xa8cb  (19 bytes)
DATA_partitura_A8B8:
	defb 093h,0b4h,0d0h,023h,0fbh,002h,0eah,007h,0f5h,0d1h,044h,063h,074h,093h,0b4h,0d0h	; a8b8  ...#......Dct...
	defb 023h,0fbh,002h	; a8c8

; ----------------------------------------------------------------------
; DATOS partitura_A8CB: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xa8cb..0xa8d6  (11 bytes)
DATA_partitura_A8CB:
	defb 0eah,005h,0d1h,044h,063h,074h,093h,0b4h,0d0h,023h,0e9h	; a8cb  ...Dct...#.

; ----------------------------------------------------------------------
; DATOS partitura_A8D6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6D, 0x6E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xa8d6..0xa8d9  (3 bytes)
DATA_partitura_A8D6:
	defb 009h,0c0h,0fah	; a8d6

; ----------------------------------------------------------------------
; DATOS partitura_A8D9: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (29 bytes)
;   0xa8d9..0xa8f6  (29 bytes)
DATA_partitura_A8D9:
	defb 0feh,004h,0f5h,0e9h,001h,0b4h,014h,013h,0e9h,007h,010h,010h,010h,010h,010h,010h	; a8d9  ................
	defb 0b0h,010h,0b0h,010h,010h,010h,0b0h,010h,010h,010h,010h,010h,010h	; a8e9  .............

; ----------------------------------------------------------------------
; DATOS partitura_A8F6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (36 bytes)
;   0xa8f6..0xa91a  (36 bytes)
DATA_partitura_A8F6:
	defb 010h,010h,010h,010h,010h,010h,010h,020h,010h,010h,010h,0fbh,008h,0f5h,0e9h,001h	; a8f6  ....... ........
	defb 0a4h,014h,013h,0e9h,007h,010h,010h,010h,010h,010h,010h,0a0h,010h,0a0h,010h,010h	; a906  ................
	defb 010h,0a0h,010h,010h	; a916

; ----------------------------------------------------------------------
; DATOS partitura_A91A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (29 bytes)
;   0xa91a..0xa937  (29 bytes)
DATA_partitura_A91A:
	defb 010h,010h,010h,010h,010h,010h,010h,010h,010h,010h,010h,020h,010h,010h,010h,0fbh	; a91a  ........... ....
	defb 003h,0e9h,001h,0a4h,014h,013h,0e9h,007h,010h,010h,010h,010h,010h	; a92a  .............

; ----------------------------------------------------------------------
; DATOS partitura_A937: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xa937..0xa942  (11 bytes)
DATA_partitura_A937:
	defb 010h,0a0h,010h,0a0h,010h,010h,010h,0a0h,010h,010h,010h	; a937  ...........

; ----------------------------------------------------------------------
; DATOS partitura_A942: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (16 bytes)
;   0xa942..0xa952  (16 bytes)
DATA_partitura_A942:
	defb 010h,010h,010h,010h,010h,010h,010h,010h,061h,020h,010h,010h,010h,0fdh,0d9h,0a8h	; a942  ........a ......

; ----------------------------------------------------------------------
; DATOS partitura_A952: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (37 bytes)
;   0xa952..0xa977  (37 bytes)
DATA_partitura_A952:
	defb 0feh,001h,0ech,0e9h,00eh,0eah,003h,0f0h,008h,001h,0d0h,04fh,04fh,04fh,04fh,0f5h	; a952  ...........OOOO.
	defb 0ech,0eah,002h,0f0h,008h,001h,0d0h,02fh,02fh,0eah,003h,01fh,01ch,0eah,001h,012h	; a962  .......//.......
	defb 0fbh,002h,0fdh,052h,0a9h	; a972

; ----------------------------------------------------------------------
; DATOS partitura_A977: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa977..0xa978  (1 bytes)
DATA_partitura_A977:
	defb 0feh	; a977

; ----------------------------------------------------------------------
; DATOS partitura_A978: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (37 bytes)
;   0xa978..0xa99d  (37 bytes)
DATA_partitura_A978:
	defb 001h,0ech,0e9h,00eh,0f0h,008h,011h,0eah,003h,0f5h,0f1h,04ch,01ah,001h,00dh,0d1h	; a978  ...........L....
	defb 04fh,0f0h,008h,001h,0f6h,0f8h,01ah,04fh,0fbh,002h,0f1h,015h,01ah,001h,005h,0ech	; a988  O......O........
	defb 0f0h,008h,011h,0eah,002h	; a998

; ----------------------------------------------------------------------
; DATOS partitura_A99D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (79 bytes)
;   0xa99d..0xa9ec  (79 bytes)
DATA_partitura_A99D:
	defb 0d1h,02fh,0f0h,008h,001h,0f6h,0f8h,01ah,02fh,0f8h,015h,0e9h,007h,0f0h,007h,022h	; a99d  ./....../......"
	defb 0eah,005h,0edh,022h,0ebh,084h,013h,0f1h,0d2h,0e9h,00eh,06fh,06fh,0f1h,009h,01ah	; a9ad  ...".......oo...
	defb 001h,005h,0ech,0f0h,008h,011h,0eah,002h,0d1h,02fh,0f0h,008h,001h,0f6h,0f8h,01ah	; a9bd  ........./......
	defb 02fh,0f8h,009h,0e9h,007h,0f0h,007h,022h,0eah,005h,0edh,022h,0ebh,084h,013h,0f1h	; a9cd  /......"..."....
	defb 0d2h,0e9h,00eh,06fh,06ch,0f8h,005h,0e9h,007h,0d6h,010h,002h,0eah,00dh,0edh	; a9dd  ...ol..........

; ----------------------------------------------------------------------
; DATOS partitura_A9EC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa9ec..0xa9ed  (1 bytes)
DATA_partitura_A9EC:
	defb 015h	; a9ec

; ----------------------------------------------------------------------
; DATOS partitura_A9ED: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (10 bytes)
;   0xa9ed..0xa9f7  (10 bytes)
DATA_partitura_A9ED:
	defb 0ebh,087h,03dh,001h,0d1h,025h,0d8h,0fdh,077h,0a9h	; a9ed  ..=..%..w.

; ----------------------------------------------------------------------
; DATOS partitura_A9F7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xa9f7..0xa9fe  (7 bytes)
DATA_partitura_A9F7:
	defb 0feh,001h,0f8h,04bh,0e9h,007h,0f5h	; a9f7

; ----------------------------------------------------------------------
; DATOS partitura_A9FE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (59 bytes)
;   0xa9fe..0xaa39  (59 bytes)
DATA_partitura_A9FE:
	defb 0eah,00fh,0ebh,00ah,056h,001h,0d5h,097h,091h,093h,09bh,0ech,0eah,001h,095h,0fbh	; a9fe  ....V...........
	defb 004h,0f5h,0eah,00fh,0ebh,00ah,056h,001h,0d5h,077h,071h,073h,07bh,0ech,0eah,001h	; aa0e  ......V..wqs{...
	defb 075h,0fbh,002h,0f5h,0eah,00fh,0ebh,00ah,056h,001h,067h,061h,063h,06bh,0ech,0eah	; aa1e  u.......V.gack..
	defb 001h,065h,0fbh,002h,0fch,002h,00fh,0aah,0fdh,0f7h,0a9h	; aa2e  .e.........

; ----------------------------------------------------------------------
; DATOS partitura_AA39: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (5 bytes)
;   0xaa39..0xaa3e  (5 bytes)
DATA_partitura_AA39:
	defb 0feh,001h,0f8h,04ch,0f5h	; aa39

; ----------------------------------------------------------------------
; DATOS partitura_AA3E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xaa3e..0xaa42  (4 bytes)
DATA_partitura_AA3E:
	defb 0e9h,007h,0d9h,0d6h	; aa3e

; ----------------------------------------------------------------------
; DATOS partitura_AA42: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (79 bytes)
;   0xaa42..0xaa91  (79 bytes)
DATA_partitura_AA42:
	defb 003h,003h,0f0h,007h,052h,0eah,007h,0edh,025h,0ebh,085h,032h,002h,0d2h,097h,090h	; aa42  ....R...%..2....
	defb 0a0h,07dh,041h,071h,0a1h,0d1h,0e9h,00eh,04fh,0d8h,0f0h,007h,002h,0ech,0eah,001h	; aa52  .}Aq....O.......
	defb 040h,0fbh,002h,0f8h,015h,0d9h,0d6h,003h,003h,0e9h,007h,0eah,007h,0edh,025h,0ebh	; aa62  @.............%.
	defb 085h,032h,002h,0f0h,007h,051h,0d1h,097h,075h,057h,049h,007h,0d2h,0a5h,097h,07ah	; aa72  .2...Q..uWI....z
	defb 0eah,005h,0ebh,084h,013h,0f1h,0edh,022h,0f0h,007h,022h,0e9h,00eh,09fh,0e9h	; aa82  .......".."....

; ----------------------------------------------------------------------
; DATOS partitura_AA91: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (75 bytes)
;   0xaa91..0xaadc  (75 bytes)
DATA_partitura_AA91:
	defb 007h,0e9h,00eh,09eh,0e9h,007h,0c0h,0f8h,009h,0e9h,007h,0d9h,0d6h,003h,003h,0eah	; aa91  ................
	defb 007h,0edh,025h,0ebh,085h,032h,002h,0f0h,007h,051h,0d1h,097h,075h,057h,049h,007h	; aaa1  ..%..2...Q..uWI.
	defb 0d2h,0a5h,097h,07ah,0e9h,00eh,0eah,005h,0ebh,084h,013h,0f1h,0edh,022h,0f0h,007h	; aab1  ...z........."..
	defb 022h,09fh,09bh,0e9h,007h,0ech,0eah,001h,090h,0f8h,005h,0d6h,010h,002h,0eah,00dh	; aac1  "...............
	defb 0edh,015h,0ebh,087h,03dh,001h,0d1h,095h,0fdh,039h,0aah	; aad1  ....=....9.

; ----------------------------------------------------------------------
; DATOS partitura_AADC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xaadc..0xaae4  (8 bytes)
DATA_partitura_AADC:
	defb 0feh,001h,0eeh,081h,0f5h,0e9h,007h,0c1h	; aadc  ........

; ----------------------------------------------------------------------
; DATOS partitura_AAE4: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xaae4..0xaaec  (8 bytes)
DATA_partitura_AAE4:
	defb 0d9h,0d6h,003h,003h,0f0h,007h,052h,0eah	; aae4  ......R.

; ----------------------------------------------------------------------
; DATOS partitura_AAEC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (75 bytes)
;   0xaaec..0xab37  (75 bytes)
DATA_partitura_AAEC:
	defb 004h,0edh,012h,0ebh,087h,016h,002h,0d2h,097h,090h,0a0h,07dh,041h,071h,0a1h,0d1h	; aaec  ...........}Aq..
	defb 0e9h,00eh,04fh,0fbh,002h,0d8h,0efh,0e9h,007h,0d9h,0d6h,002h,002h,0eah,004h,0eeh	; aafc  ..O.............
	defb 081h,0edh,012h,0ebh,087h,016h,002h,0f0h,007h,051h,0c1h,0d1h,097h,075h,057h,049h	; ab0c  .........Q...uWI
	defb 007h,0d2h,0a5h,097h,079h,0f0h,007h,021h,0efh,0eah,004h,0edh,022h,0ebh,084h,012h	; ab1c  ....y..!...."...
	defb 0f1h,0e9h,00eh,0d1h,00fh,0d1h,06eh,0d9h,0d6h,002h,002h	; ab2c  ......n....

; ----------------------------------------------------------------------
; DATOS partitura_AB37: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xab37..0xab3b  (4 bytes)
DATA_partitura_AB37:
	defb 0e9h,007h,0eah,004h	; ab37

; ----------------------------------------------------------------------
; DATOS partitura_AB3B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xab3b..0xab3c  (1 bytes)
DATA_partitura_AB3B:
	defb 0eeh	; ab3b

; ----------------------------------------------------------------------
; DATOS partitura_AB3C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xab3c..0xab3f  (3 bytes)
DATA_partitura_AB3C:
	defb 081h,0edh,012h	; ab3c

; ----------------------------------------------------------------------
; DATOS partitura_AB3F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xab3f..0xab43  (4 bytes)
DATA_partitura_AB3F:
	defb 0ebh,087h,016h,002h	; ab3f

; ----------------------------------------------------------------------
; DATOS partitura_AB43: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xab43..0xab47  (4 bytes)
DATA_partitura_AB43:
	defb 0f0h,007h,051h,0d1h	; ab43

; ----------------------------------------------------------------------
; DATOS partitura_AB47: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xab47..0xab4b  (4 bytes)
DATA_partitura_AB47:
	defb 0c1h,097h,075h,057h	; ab47

; ----------------------------------------------------------------------
; DATOS partitura_AB4B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xab4b..0xab4f  (4 bytes)
DATA_partitura_AB4B:
	defb 049h,007h,0d2h,0a5h	; ab4b

; ----------------------------------------------------------------------
; DATOS partitura_AB4F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (33 bytes)
;   0xab4f..0xab70  (33 bytes)
DATA_partitura_AB4F:
	defb 097h,079h,0f0h,007h,021h,0efh,0eah,004h,0edh,022h,0ebh,084h,012h,0f1h,0e9h,00eh	; ab4f  .y..!...."......
	defb 0d1h,00fh,06bh,0efh,0eah,00dh,0e9h,007h,0edh,015h,0ebh,087h,03dh,001h,0d6h,010h	; ab5f  ..k.........=...
	defb 002h	; ab6f

; ----------------------------------------------------------------------
; DATOS partitura_AB70: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x6F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (5 bytes)
;   0xab70..0xab75  (5 bytes)
DATA_partitura_AB70:
	defb 0d0h,005h,0fdh,0dch,0aah	; ab70

; ----------------------------------------------------------------------
; DATOS partitura_AB75: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x70 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xab75..0xab7c  (7 bytes)
DATA_partitura_AB75:
	defb 0feh,004h,0e9h,009h,030h,040h,050h	; ab75

; ----------------------------------------------------------------------
; DATOS partitura_AB7C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x70 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (59 bytes)
;   0xab7c..0xabb7  (59 bytes)
DATA_partitura_AB7C:
	defb 050h,062h,0b2h,0a1h,0a0h,0a0h,071h,0b2h,0a2h,0a1h,0a1h,0a1h,030h,040h,050h,050h	; ab7c  Pb....q.....0@PP
	defb 062h,0b2h,0a1h,0a1h,0a1h,0b2h,0a2h,0a1h,0a1h,071h,0f5h,030h,040h,050h,050h,062h	; ab8c  b........q.0@PPb
	defb 0b2h,0a1h,0a0h,0a0h,071h,0b2h,0a2h,0a1h,0a1h,0a1h,030h,040h,050h,050h,062h,0b2h	; ab9c  ....q.....0@PPb.
	defb 0a1h,0a1h,0a1h,0b2h,0a2h,0a1h,0a1h,071h,0fbh,004h,0f5h	; abac  .......q...

; ----------------------------------------------------------------------
; DATOS partitura_ABB7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x70 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (44 bytes)
;   0xabb7..0xabe3  (44 bytes)
DATA_partitura_ABB7:
	defb 0a0h,0a0h,000h,0a0h,0a0h,000h,0a0h,0a1h,0a0h,000h,0a0h,000h,000h,071h,0a0h,0a0h	; abb7  .............q..
	defb 000h,0a0h,000h,0a0h,0a1h,0a0h,000h,021h,0fbh,003h,0a0h,0a0h,000h,0a0h,0a0h,000h	; abc7  .......!........
	defb 0a0h,0a1h,0a0h,000h,0a0h,000h,000h,071h,070h,000h,0a0h,070h	; abd7  .......qp..p

; ----------------------------------------------------------------------
; DATOS partitura_ABE3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x70 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (41 bytes)
;   0xabe3..0xac0c  (41 bytes)
DATA_partitura_ABE3:
	defb 000h,0a0h,070h,070h,0a0h,070h,070h,070h,030h,040h,050h,050h,062h,0b2h,0a1h,0a0h	; abe3  ..pp.ppp0@PPb...
	defb 0a0h,071h,0b2h,0a2h,0a1h,0a1h,0a1h,030h,040h,050h,050h,062h,0b2h,0a1h,0a1h,0a1h	; abf3  .q.....0@PPb....
	defb 0a2h,0a2h,0a1h,0a1h,0a1h,0fch,002h,096h,0abh	; ac03  .........

; ----------------------------------------------------------------------
; DATOS sin identificar  0xac0c..0xac0f  (3 bytes)
DATA_AC0C:
	defb 0fdh,075h,0abh	; ac0c

; ----------------------------------------------------------------------
; DATOS partitura_AC0F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x70 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xac0f..0xac11  (2 bytes)
DATA_partitura_AC0F:
	defb 0feh,001h	; ac0f

; ----------------------------------------------------------------------
; DATOS partitura_AC11: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x70 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (49 bytes)
;   0xac11..0xac42  (49 bytes)
DATA_partitura_AC11:
	defb 0e9h,009h,0d9h,0d6h,030h,003h,0eah,00ah,0ebh,009h,027h,005h,0d4h,0f5h,050h,0d3h	; ac11  ....0.....'...P.
	defb 050h,0d4h,050h,0d3h,000h,032h,0d4h,052h,031h,051h,081h,052h,052h,031h,011h,031h	; ac21  P.P..2.R1Q.RR1.1
	defb 0fbh,002h,0c1h,0eeh,001h,0dah,0d6h,001h,0eah,006h,0ebh,007h,017h,002h,0f5h,0d1h	; ac31  ................
	defb 000h	; ac41

; ----------------------------------------------------------------------
; DATOS partitura_AC42: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x70 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xac42..0xac46  (4 bytes)
DATA_partitura_AC42:
	defb 050h,080h,000h,071h	; ac42

; ----------------------------------------------------------------------
; DATOS partitura_AC46: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x70 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xac46..0xac4e  (8 bytes)
DATA_partitura_AC46:
	defb 000h,031h,000h,050h,000h,0d0h,000h,0d1h	; ac46  .1.P....

; ----------------------------------------------------------------------
; DATOS partitura_AC4E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x70 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (39 bytes)
;   0xac4e..0xac75  (39 bytes)
DATA_partitura_AC4E:
	defb 0a0h,080h,070h,000h,050h,080h,000h,071h,000h,031h,000h,030h,050h,0fbh,003h,0d1h	; ac4e  ..p.P..q.1.0P...
	defb 000h,050h,080h,000h,071h,000h,031h,000h,050h,000h,0d0h,000h,0d1h,0a0h,080h,070h	; ac5e  .P..q.1.P......p
	defb 000h,050h,080h,000h,071h,000h,031h	; ac6e

; ----------------------------------------------------------------------
; DATOS partitura_AC75: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x70 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (9 bytes)
;   0xac75..0xac7e  (9 bytes)
DATA_partitura_AC75:
	defb 000h,0c1h,0eeh,001h,0dah,0d6h,001h,0eah,006h	; ac75  .........

; ----------------------------------------------------------------------
; DATOS partitura_AC7E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x70 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (36 bytes)
;   0xac7e..0xaca2  (36 bytes)
DATA_partitura_AC7E:
	defb 0ebh,007h,017h,002h,0f5h,0d1h,020h,070h,0a0h,020h,091h,020h,051h,020h,070h,020h	; ac7e  ...... p. . Q p
	defb 0d0h,020h,0d0h,000h,0d1h,0a0h,090h,020h,070h,0a0h,020h,091h,020h,051h,020h,050h	; ac8e  . ..... p. . Q P
	defb 070h,0fbh,003h,0d1h	; ac9e

; ----------------------------------------------------------------------
; DATOS partitura_ACA2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x70 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (12 bytes)
;   0xaca2..0xacae  (12 bytes)
DATA_partitura_ACA2:
	defb 020h,070h,0a0h,020h,091h,020h,051h,020h,070h,020h,0d0h,020h	; aca2   p. . Q p .

; ----------------------------------------------------------------------
; DATOS partitura_ACAE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x70 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (65 bytes)
;   0xacae..0xacef  (65 bytes)
DATA_partitura_ACAE:
	defb 0d0h,000h,0d1h,0a0h,090h,020h,070h,0a0h,020h,091h,020h,051h,020h,0c1h,0eeh,001h	; acae  ..... p. . Q ...
	defb 0dah,0d6h,001h,0eah,006h,0ebh,007h,017h,002h,0f5h,0d1h,030h,080h,0b0h,030h,0a1h	; acbe  ...........0..0.
	defb 030h,061h,030h,080h,030h,0d0h,030h,0d0h,010h,0d1h,0b0h,0a0h,030h,080h,0b0h,030h	; acce  0a0.0.0.....0..0
	defb 0a1h,030h,061h,030h,060h,080h,0fbh,003h,0d1h,030h,080h,0b0h,030h,0a1h,030h,061h	; acde  .0a0`....0..0.0a
	defb 030h	; acee

; ----------------------------------------------------------------------
; DATOS partitura_ACEF: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x70 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (61 bytes)
;   0xacef..0xad2c  (61 bytes)
DATA_partitura_ACEF:
	defb 080h,030h,0d0h,030h,0d0h,010h,0d1h,0b0h,0a0h,0d8h,0eah,005h,0edh,034h,0ebh,089h	; acef  .0.0.........4..
	defb 017h,0b1h,0d1h,012h,002h,0d2h,0a3h,0eeh,001h,0dah,0d6h,002h,0eah,005h,0ebh,007h	; acff  ................
	defb 017h,002h,0f5h,0c1h,0d1h,000h,050h,080h,000h,071h,000h,031h,000h,050h,000h,0d0h	; ad0f  ......P..q.1.P..
	defb 000h,0d1h,0a0h,080h,070h,000h,050h,080h,000h,071h,000h,031h,000h	; ad1f  ....p.P..q.1.

; ----------------------------------------------------------------------
; DATOS partitura_AD2C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x70 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xad2c..0xad33  (7 bytes)
DATA_partitura_AD2C:
	defb 0fbh,002h,0efh,0d8h,0fch,002h,033h	; ad2c

; ----------------------------------------------------------------------
; DATOS partitura_AD33: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x70 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xad33..0xad34  (1 bytes)
DATA_partitura_AD33:
	defb 0ach	; ad33

; ----------------------------------------------------------------------
; DATOS sin identificar  0xad34..0xad37  (3 bytes)
DATA_AD34:
	defb 0fdh,00fh,0ach	; ad34

; ----------------------------------------------------------------------
; DATOS partitura_AD37: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x70 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (9 bytes)
;   0xad37..0xad40  (9 bytes)
DATA_partitura_AD37:
	defb 0feh,001h,0f6h,0f4h,050h,00dh,00ah,00dh,0d9h	; ad37  ....P....

; ----------------------------------------------------------------------
; DATOS partitura_AD40: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x70 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (10 bytes)
;   0xad40..0xad4a  (10 bytes)
DATA_partitura_AD40:
	defb 0d6h,030h,002h,0e9h,009h,0eah,00dh,0ebh,01ah,027h	; ad40  .0.......'

; ----------------------------------------------------------------------
; DATOS partitura_AD4A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x70 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (29 bytes)
;   0xad4a..0xad67  (29 bytes)
DATA_partitura_AD4A:
	defb 004h,0d4h,0f5h,050h,0d3h,050h,0d4h,050h,0d3h,000h,032h,0d4h,052h,031h,051h,081h	; ad4a  ...P.P.P..2.R1Q.
	defb 052h,052h,031h,011h,031h,0fbh,002h,0f4h,050h,00dh,00ah,00dh,0d9h	; ad5a  RR1.1...P....

; ----------------------------------------------------------------------
; DATOS partitura_AD67: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x70 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (34 bytes)
;   0xad67..0xad89  (34 bytes)
DATA_partitura_AD67:
	defb 0d6h,030h,002h,0eah,00dh,0ebh,01ah,027h,004h,0d4h,0f5h,050h,0d3h,050h,0d4h,050h	; ad67  .0.....'...P.P.P
	defb 0d3h,000h,032h,0d4h,052h,031h,051h,081h,052h,052h,031h,011h,031h,0fbh,004h,0f4h	; ad77  ..2.R1Q.RR1.1...
	defb 050h,00dh	; ad87

; ----------------------------------------------------------------------
; DATOS partitura_AD89: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x70 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xad89..0xad8b  (2 bytes)
DATA_partitura_AD89:
	defb 00ah,00dh	; ad89

; ----------------------------------------------------------------------
; DATOS partitura_AD8B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x70 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (28 bytes)
;   0xad8b..0xada7  (28 bytes)
DATA_partitura_AD8B:
	defb 0d9h,0d6h,030h,002h,0eah,00dh,0ebh,01ah,027h,004h,0d4h,0f5h,070h,0d3h,070h,0d4h	; ad8b  ..0.....'...p.p.
	defb 070h,0d3h,020h,052h,0d4h,072h,051h,071h,0a1h,072h,072h,051h	; ad9b  p. R.rQq.rrQ

; ----------------------------------------------------------------------
; DATOS partitura_ADA7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x70 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (23 bytes)
;   0xada7..0xadbe  (23 bytes)
DATA_partitura_ADA7:
	defb 031h,051h,0fbh,004h,0f4h,050h,00dh,00ah,00dh,0d9h,0d6h,030h,002h,0eah,00dh,0ebh	; ada7  1Q...P.....0....
	defb 01ah,027h,004h,0d4h,0f5h,080h,0d3h	; adb7

; ----------------------------------------------------------------------
; DATOS partitura_ADBE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x70 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (9 bytes)
;   0xadbe..0xadc7  (9 bytes)
DATA_partitura_ADBE:
	defb 080h,0d4h,080h,0d3h,030h,062h,0d4h,082h,061h	; adbe  ....0b..a

; ----------------------------------------------------------------------
; DATOS partitura_ADC7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x70 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (22 bytes)
;   0xadc7..0xaddd  (22 bytes)
DATA_partitura_ADC7:
	defb 081h,0b1h,082h,082h,061h,041h,061h,0fbh,004h,0f1h,009h,00dh,001h,009h,0eah,00bh	; adc7  ....aAa.........
	defb 0edh,054h,0ebh,089h,017h,0b1h	; add7

; ----------------------------------------------------------------------
; DATOS partitura_ADDD: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x70 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xaddd..0xadde  (1 bytes)
DATA_partitura_ADDD:
	defb 0f0h	; addd

; ----------------------------------------------------------------------
; DATOS partitura_ADDE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x70 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (22 bytes)
;   0xadde..0xadf4  (22 bytes)
DATA_partitura_ADDE:
	defb 005h,051h,0dbh,003h,0d1h,00fh,0f6h,0f8h,00dh,0f0h,005h,001h,0ech,0eah,003h,00fh	; adde  .Q..............
	defb 0eah,002h,00fh,007h,0dch,0f0h	; adee

; ----------------------------------------------------------------------
; DATOS partitura_ADF4: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x70 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (5 bytes)
;   0xadf4..0xadf9  (5 bytes)
DATA_partitura_ADF4:
	defb 000h,0fch,002h,061h,0adh	; adf4

; ----------------------------------------------------------------------
; DATOS sin identificar  0xadf9..0xadfc  (3 bytes)
DATA_ADF9:
	defb 0fdh,037h,0adh	; adf9

; ----------------------------------------------------------------------
; DATOS partitura_ADFC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x70 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (22 bytes)
;   0xadfc..0xae12  (22 bytes)
DATA_partitura_ADFC:
	defb 0feh,001h,0f8h,007h,0e9h,009h,0eah,005h,0edh,013h,0ebh,087h,037h,001h,0f5h,0d1h	; adfc  ............7...
	defb 000h,050h,080h,000h,071h,000h	; ae0c

; ----------------------------------------------------------------------
; DATOS partitura_AE12: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x70 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xae12..0xae1d  (11 bytes)
DATA_partitura_AE12:
	defb 031h,000h,050h,000h,0d0h,000h,0d1h,0a0h,080h,070h,000h	; ae12  1.P......p.

; ----------------------------------------------------------------------
; DATOS partitura_AE1D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x70 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (22 bytes)
;   0xae1d..0xae33  (22 bytes)
DATA_partitura_AE1D:
	defb 050h,080h,000h,071h,000h,031h,000h,030h,050h,0fbh,002h,0f8h,01dh,0dah,0d6h,002h	; ae1d  P..q.1.0P.......
	defb 0eah,006h,0ebh,009h,037h,001h	; ae2d

; ----------------------------------------------------------------------
; DATOS partitura_AE33: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x70 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (32 bytes)
;   0xae33..0xae53  (32 bytes)
DATA_partitura_AE33:
	defb 0f5h,0d1h,000h,050h,080h,000h,071h,000h,031h,000h,050h,000h,0d0h,000h,0d1h,0a0h	; ae33  ...P..q.1.P.....
	defb 080h,070h,000h,050h,080h,000h,071h,000h,031h,000h,030h,050h,0fbh,004h,0dah,0d6h	; ae43  .p.P..q.1.0P....

; ----------------------------------------------------------------------
; DATOS partitura_AE53: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x70 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xae53..0xae54  (1 bytes)
DATA_partitura_AE53:
	defb 002h	; ae53

; ----------------------------------------------------------------------
; DATOS partitura_AE54: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x70 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (55 bytes)
;   0xae54..0xae8b  (55 bytes)
DATA_partitura_AE54:
	defb 0eah,006h,0ebh,009h,037h,001h,0f5h,0d1h,020h,070h,0a0h,020h,091h,020h,051h,020h	; ae54  ....7... p. . Q
	defb 070h,020h,0d0h,020h,0d0h,000h,0d1h,0a0h,090h,020h,070h,0a0h,020h,091h,020h,051h	; ae64  p . ..... p. . Q
	defb 020h,050h,070h,0fbh,004h,0dah,0d6h,002h,0eah,006h,0ebh,009h,037h,001h,0f5h,0d1h	; ae74   Pp.........7...
	defb 030h,080h,0b0h,030h,0a1h,030h,061h	; ae84

; ----------------------------------------------------------------------
; DATOS partitura_AE8B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x70 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (40 bytes)
;   0xae8b..0xaeb3  (40 bytes)
DATA_partitura_AE8B:
	defb 030h,080h,030h,0d0h,030h,0d0h,010h,0d1h,0b0h,0a0h,030h,080h,0b0h,030h,0a1h,030h	; ae8b  0.0.0.....0..0.0
	defb 061h,030h,060h,080h,0fbh,003h,0d1h,030h,080h,0b0h,030h,0a1h,030h,061h,030h,080h	; ae9b  a0`....0..0.0a0.
	defb 030h,0d0h,030h,0d0h,010h,0d1h,0b0h,0a0h	; aeab  0.0.....

; ----------------------------------------------------------------------
; DATOS partitura_AEB3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x70 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (14 bytes)
;   0xaeb3..0xaec1  (14 bytes)
DATA_partitura_AEB3:
	defb 0f8h,005h,0d8h,0eah,00bh,0edh,034h,0ebh,089h,017h,0b1h,0d1h,012h,002h	; aeb3  ......4.......

; ----------------------------------------------------------------------
; DATOS partitura_AEC1: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x70 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xaec1..0xaec2  (1 bytes)
DATA_partitura_AEC1:
	defb 0d2h	; aec1

; ----------------------------------------------------------------------
; DATOS partitura_AEC2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x70 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (40 bytes)
;   0xaec2..0xaeea  (40 bytes)
DATA_partitura_AEC2:
	defb 0a3h,081h,0d8h,0f2h,001h,0eah,00bh,0edh,054h,0ebh,089h,017h,0b1h,0f0h,005h,051h	; aec2  ........T......Q
	defb 0dbh,003h,0d2h,07fh,0f8h,00dh,0f0h,005h,001h,0ech,0eah,003h,07fh,0eah,002h,07fh	; aed2  ................
	defb 077h,0dch,0f0h,000h,0fch,002h,028h,0aeh	; aee2  w.....(.

; ----------------------------------------------------------------------
; DATOS sin identificar  0xaeea..0xaeed  (3 bytes)
DATA_AEEA:
	defb 0fdh,0fch,0adh	; aeea

; ----------------------------------------------------------------------
; DATOS partitura_AEED: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x70 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (65 bytes)
;   0xaeed..0xaf2e  (65 bytes)
DATA_partitura_AEED:
	defb 0feh,001h,0f8h,01dh,0e9h,009h,0eah,007h,0ebh,009h,047h,001h,0f5h,0d1h,001h,081h	; aeed  ..........G.....
	defb 072h,032h,051h,0d0h,001h,0d1h,081h,001h,081h,072h,032h,031h,0fbh,002h,0f8h,007h	; aefd  r2Q......r21....
	defb 0eah,00ah,0edh,024h,0ebh,089h,017h,0d1h,0f0h,005h,051h,0f5h,0d2h,000h,010h,08fh	; af0d  ...$......Q.....
	defb 0f0h,005h,001h,0ech,0eah,003h,088h,0f0h,001h,051h,0eah,00ah,0edh,014h,0ebh,089h	; af1d  .........Q......
	defb 017h	; af2d

; ----------------------------------------------------------------------
; DATOS partitura_AF2E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x70 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (62 bytes)
;   0xaf2e..0xaf6c  (62 bytes)
DATA_partitura_AF2E:
	defb 0d1h,050h,070h,080h,070h,030h,00fh,0f0h,005h,001h,0ech,0eah,003h,003h,0eah,002h	; af2e  .Pp.p0..........
	defb 003h,0f0h,005h,051h,0eah,00ah,0edh,024h,0ebh,089h,017h,0d1h,000h,010h,08fh,0f0h	; af3e  ...Q...$........
	defb 005h,001h,0ech,0eah,003h,088h,0f0h,005h,051h,0eah,00ah,0edh,024h,0ebh,089h,017h	; af4e  ........Q...$...
	defb 0d1h,050h,070h,080h,070h,030h,0d1h,00fh,0f0h,005h,001h,0ech,0eah,003h	; af5e  .Pp.p0........

; ----------------------------------------------------------------------
; DATOS partitura_AF6C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x70 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xaf6c..0xaf72  (6 bytes)
DATA_partitura_AF6C:
	defb 003h,0eah,002h,003h,0eah,00ah	; af6c

; ----------------------------------------------------------------------
; DATOS partitura_AF72: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x70 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xaf72..0xaf79  (7 bytes)
DATA_partitura_AF72:
	defb 0edh,024h,0ebh,089h,017h,0d1h,0f0h	; af72

; ----------------------------------------------------------------------
; DATOS partitura_AF79: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x70 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (15 bytes)
;   0xaf79..0xaf88  (15 bytes)
DATA_partitura_AF79:
	defb 005h,051h,0f5h,0d2h,020h,030h,0afh,0f0h,005h,001h,0ech,0eah,003h,0a8h,0f0h	; af79  .Q.. 0.........

; ----------------------------------------------------------------------
; DATOS partitura_AF88: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x70 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (12 bytes)
;   0xaf88..0xaf94  (12 bytes)
DATA_partitura_AF88:
	defb 001h,051h,0eah,00ah,0edh,014h,0ebh,089h,017h,0d1h,070h,090h	; af88  .Q........p.

; ----------------------------------------------------------------------
; DATOS partitura_AF94: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x70 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (23 bytes)
;   0xaf94..0xafab  (23 bytes)
DATA_partitura_AF94:
	defb 0a0h,090h,050h,02fh,0f0h,005h,001h,0ech,0eah,003h,023h,0eah,002h,023h,0f0h,005h	; af94  ..P/......#..#..
	defb 051h,0eah,00ah,0edh,024h,0ebh,089h	; afa4

; ----------------------------------------------------------------------
; DATOS partitura_AFAB: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x70 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (27 bytes)
;   0xafab..0xafc6  (27 bytes)
DATA_partitura_AFAB:
	defb 017h,0d1h,020h,070h,0a0h,091h,050h,0d1h,02fh,0f0h,005h,001h,0ech,0eah,003h,023h	; afab  .. p..P./......#
	defb 0eah,00ah,0edh,024h,0ebh,089h,017h,0d1h,000h,0d2h,0a0h	; afbb  ...$.......

; ----------------------------------------------------------------------
; DATOS partitura_AFC6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x70 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xafc6..0xafca  (4 bytes)
DATA_partitura_AFC6:
	defb 0d1h,000h,0d2h,0a0h	; afc6

; ----------------------------------------------------------------------
; DATOS partitura_AFCA: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x70 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xafca..0xafcb  (1 bytes)
DATA_partitura_AFCA:
	defb 090h	; afca

; ----------------------------------------------------------------------
; DATOS partitura_AFCB: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x70 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xafcb..0xafd1  (6 bytes)
DATA_partitura_AFCB:
	defb 07fh,0f0h,005h,001h,0ech,0eah	; afcb

; ----------------------------------------------------------------------
; DATOS partitura_AFD1: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x70 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (29 bytes)
;   0xafd1..0xafee  (29 bytes)
DATA_partitura_AFD1:
	defb 003h,078h,0f8h,009h,0eah,00bh,0edh,034h,0ebh,089h,017h,0b1h,0f0h,005h,051h,0dbh	; afd1  .x.....4......Q.
	defb 002h,0f5h,0d2h,06bh,030h,050h,060h,080h,06bh,06bh,030h,050h,060h	; afe1  ...k0P`.kk0P`

; ----------------------------------------------------------------------
; DATOS partitura_AFEE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x70 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (40 bytes)
;   0xafee..0xb016  (40 bytes)
DATA_partitura_AFEE:
	defb 080h,0a2h,082h,063h,051h,0fbh,002h,0dch,0f0h,000h,0f8h,00dh,0eah,006h,0ebh,009h	; afee  ...cQ...........
	defb 045h,002h,0f5h,0d1h,000h,050h,080h,000h,071h,000h,031h,000h,050h,000h,0d0h,000h	; affe  E....P..q.1.P...
	defb 0d1h,0a0h,080h,070h,000h,050h,080h,000h	; b00e  ...p.P..

; ----------------------------------------------------------------------
; DATOS partitura_B016: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x70 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (12 bytes)
;   0xb016..0xb022  (12 bytes)
DATA_partitura_B016:
	defb 071h,000h,031h,000h,030h,050h,0fbh,002h,0fch,002h,00bh,0afh	; b016  q.1.0P......

; ----------------------------------------------------------------------
; DATOS sin identificar  0xb022..0xb025  (3 bytes)
DATA_B022:
	defb 0fdh,0edh,0aeh	; b022

; ----------------------------------------------------------------------
; DATOS partitura_B025: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x70 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (10 bytes)
;   0xb025..0xb02f  (10 bytes)
DATA_partitura_B025:
	defb 0feh,001h,0e9h,009h,0eah,007h,0ebh,009h,047h,001h	; b025  ........G.

; ----------------------------------------------------------------------
; DATOS partitura_B02F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x70 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xb02f..0xb048  (25 bytes)
DATA_partitura_B02F:
	defb 0c0h,0d1h,051h,002h,002h,001h,001h,0a1h,071h,051h,002h,002h,001h,051h,051h,002h	; b02f  ..Q.....qQ...QQ.
	defb 002h,001h,001h,0a1h,071h,051h,002h,002h,001h	; b03f  ....qQ...

; ----------------------------------------------------------------------
; DATOS partitura_B048: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x70 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (30 bytes)
;   0xb048..0xb066  (30 bytes)
DATA_partitura_B048:
	defb 050h,0dbh,002h,0c2h,0eeh,081h,0eah,005h,0edh,012h,0ebh,087h,014h,0f1h,0f0h,005h	; b048  P...............
	defb 051h,0f5h,0d2h,000h,010h,08fh,0f0h,005h,001h,0ech,0eah,002h,088h,0f0h	; b058  Q.............

; ----------------------------------------------------------------------
; DATOS partitura_B066: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x70 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (65 bytes)
;   0xb066..0xb0a7  (65 bytes)
DATA_partitura_B066:
	defb 005h,051h,0eah,005h,0ebh,087h,014h,0f1h,050h,070h,080h,070h,030h,00fh,0f0h,005h	; b066  .Q......Pp.p0...
	defb 001h,0ech,0eah,002h,003h,0eah,001h,003h,0f0h,005h,051h,0eah,005h,0ebh,087h,014h	; b076  ..........Q.....
	defb 0f1h,000h,010h,08fh,0f0h,005h,001h,0ech,0eah,002h,088h,0f0h,005h,051h,0eah,005h	; b086  .............Q..
	defb 0ebh,087h,014h,0f1h,050h,070h,080h,070h,030h,0d1h,00fh,0f0h,005h,001h,0ech,0eah	; b096  ....Pp.p0.......
	defb 002h	; b0a6

; ----------------------------------------------------------------------
; DATOS partitura_B0A7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x70 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xb0a7..0xb0b8  (17 bytes)
DATA_partitura_B0A7:
	defb 003h,0eah,001h,003h,0dbh,002h,0eeh,081h,0eah,005h,0edh,012h,0ebh,087h,014h,0f1h	; b0a7  ................
	defb 0f0h	; b0b7

; ----------------------------------------------------------------------
; DATOS partitura_B0B8: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x70 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (16 bytes)
;   0xb0b8..0xb0c8  (16 bytes)
DATA_partitura_B0B8:
	defb 005h,051h,0f5h,0d2h,020h,030h,0afh,0f0h,005h,001h,0ech,0eah,002h,0a8h,0f0h,005h	; b0b8  .Q.. 0..........

; ----------------------------------------------------------------------
; DATOS partitura_B0C8: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x70 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (64 bytes)
;   0xb0c8..0xb108  (64 bytes)
DATA_partitura_B0C8:
	defb 051h,0eah,005h,0ebh,087h,014h,0f1h,070h,090h,0a0h,090h,050h,02fh,0f0h,005h,001h	; b0c8  Q......p...P/...
	defb 0ech,0eah,002h,023h,0eah,001h,023h,0f0h,005h,051h,0eah,005h,0ebh,087h,014h,0f1h	; b0d8  ...#..#..Q......
	defb 020h,070h,0a0h,091h,050h,0d1h,02fh,0f0h,005h,001h,0ech,0eah,002h,023h,0eah,005h	; b0e8   p..P./......#..
	defb 0ebh,087h,014h,0f1h,000h,0d2h,0a0h,0d1h,000h,0d2h,0a0h,090h,07fh,0f0h,005h,001h	; b0f8  ................

; ----------------------------------------------------------------------
; DATOS partitura_B108: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x70 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (36 bytes)
;   0xb108..0xb12c  (36 bytes)
DATA_partitura_B108:
	defb 0ech,0eah,001h,078h,0eeh,082h,0eah,005h,0edh,012h,0ebh,087h,014h,0f1h,0f0h,005h	; b108  ...x............
	defb 051h,0dbh,002h,0d2h,06bh,030h,050h,060h,080h,06bh,06bh,030h,050h,060h,080h,0a2h	; b118  Q...k0P`.kk0P`..
	defb 082h,063h,051h,06bh	; b128

; ----------------------------------------------------------------------
; DATOS partitura_B12C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x70 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xb12c..0xb130  (4 bytes)
DATA_partitura_B12C:
	defb 030h,050h,060h,080h	; b12c

; ----------------------------------------------------------------------
; DATOS partitura_B130: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x70 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xb130..0xb137  (7 bytes)
DATA_partitura_B130:
	defb 06bh,06bh,030h,050h,060h,080h,0a2h	; b130

; ----------------------------------------------------------------------
; DATOS partitura_B137: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x70 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (33 bytes)
;   0xb137..0xb158  (33 bytes)
DATA_partitura_B137:
	defb 082h,062h,0dch,0efh,0f0h,000h,0d9h,0d6h,030h,002h,0eah,00eh,0ebh,01ah,027h,004h	; b137  .b......0.....'.
	defb 0f5h,0d5h,050h,0d4h,050h,0d5h,050h,0d4h,000h,032h,0d5h,052h,031h,051h,081h,052h	; b147  ..P.P.P..2.R1Q.R
	defb 052h	; b157

; ----------------------------------------------------------------------
; DATOS partitura_B158: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x70 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xb158..0xb159  (1 bytes)
DATA_partitura_B158:
	defb 031h	; b158

; ----------------------------------------------------------------------
; DATOS partitura_B159: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x70 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (9 bytes)
;   0xb159..0xb162  (9 bytes)
DATA_partitura_B159:
	defb 011h,031h,0fbh,002h,0d8h,0fch,002h,049h,0b0h	; b159  .1.....I.

; ----------------------------------------------------------------------
; DATOS sin identificar  0xb162..0xb165  (3 bytes)
DATA_B162:
	defb 0fdh,025h,0b0h	; b162

; ----------------------------------------------------------------------
; DATOS partitura_B165: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x71 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xb165..0xb177  (18 bytes)
DATA_partitura_B165:
	defb 0feh,004h,0d1h,0e9h,00bh,060h,070h,080h,094h,0d0h,013h,013h,0d1h,097h,0e9h,001h	; b165  .....`p.........
	defb 06eh,06dh	; b175

; ----------------------------------------------------------------------
; DATOS partitura_B177: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x71 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xb177..0xb17b  (4 bytes)
DATA_partitura_B177:
	defb 07eh,07eh,08dh,09eh	; b177

; ----------------------------------------------------------------------
; DATOS partitura_B17B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x71 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xb17b..0xb181  (6 bytes)
DATA_partitura_B17B:
	defb 0e9h,00bh,061h,085h,0d0h,013h	; b17b

; ----------------------------------------------------------------------
; DATOS partitura_B181: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x71 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (31 bytes)
;   0xb181..0xb1a0  (31 bytes)
DATA_partitura_B181:
	defb 011h,0d1h,060h,070h,083h,0d0h,013h,0e9h,001h,0d1h,06eh,07dh,07eh,08eh,08dh,09eh	; b181  ..`p......n}~...
	defb 0d1h,0e9h,00bh,060h,070h,080h,094h,0d0h,013h,013h,0d1h,097h,0e9h,001h,06eh	; b191  ...`p.........n

; ----------------------------------------------------------------------
; DATOS partitura_B1A0: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x71 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xb1a0..0xb1b2  (18 bytes)
DATA_partitura_B1A0:
	defb 06dh,07eh,07eh,08dh,09eh,0e9h,00bh,061h,085h,0d0h,013h,011h,0d1h,060h,070h,083h	; b1a0  m~~....a.....`p.
	defb 0d0h,013h	; b1b0

; ----------------------------------------------------------------------
; DATOS partitura_B1B2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x71 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (35 bytes)
;   0xb1b2..0xb1d5  (35 bytes)
DATA_partitura_B1B2:
	defb 0e9h,001h,0d1h,06eh,07dh,08eh,062h,062h,063h,063h,075h,075h,085h,085h,095h,0e9h	; b1b2  ...n}.bbccuu....
	defb 00bh,0d1h,091h,0d0h,0a1h,0d1h,093h,0f5h,0d0h,0b1h,0a1h,0d1h,093h,0fbh,006h,0d0h	; b1c2  ................
	defb 0b1h,0a1h,0d1h	; b1d2

; ----------------------------------------------------------------------
; DATOS partitura_B1D5: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x71 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (9 bytes)
;   0xb1d5..0xb1de  (9 bytes)
DATA_partitura_B1D5:
	defb 061h,081h,095h,0e9h,001h,064h,065h,074h,085h	; b1d5  a....det.

; ----------------------------------------------------------------------
; DATOS partitura_B1DE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x71 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xb1de..0xb1f7  (25 bytes)
DATA_partitura_B1DE:
	defb 0e9h,00bh,091h,0d0h,0a1h,0d1h,093h,0f5h,0d0h,0b1h,0a1h,0d1h,093h,0fbh,006h,0d0h	; b1de  ................
	defb 0b1h,0a1h,0d1h,071h,081h,097h,0fdh,065h,0b1h	; b1ee  ...q...e.

; ----------------------------------------------------------------------
; DATOS partitura_B1F7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x71 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (24 bytes)
;   0xb1f7..0xb20f  (24 bytes)
DATA_partitura_B1F7:
	defb 0feh,001h,0e9h,00bh,0c0h,0eeh,081h,0f0h,007h,042h,0eah,005h,0d9h,0d6h,001h,007h	; b1f7  .........B......
	defb 0edh,083h,0ebh,087h,017h,0b1h,0dbh,002h	; b207  ........

; ----------------------------------------------------------------------
; DATOS partitura_B20F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x71 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (12 bytes)
;   0xb20f..0xb21b  (12 bytes)
DATA_partitura_B20F:
	defb 0d1h,02fh,01fh,02fh,01eh,0c0h,0eeh,081h,0f0h,007h,042h,0eah	; b20f  ././......B.

; ----------------------------------------------------------------------
; DATOS partitura_B21B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x71 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (24 bytes)
;   0xb21b..0xb233  (24 bytes)
DATA_partitura_B21B:
	defb 005h,0d9h,0d6h,001h,007h,0edh,083h,0ebh,087h,017h,0b1h,0dbh,002h,0d1h,04fh,03fh	; b21b  ..............O?
	defb 04fh,03eh,0f5h,0e9h,001h,0c6h,0eeh,082h	; b22b  O>......

; ----------------------------------------------------------------------
; DATOS partitura_B233: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x71 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xb233..0xb23a  (7 bytes)
DATA_partitura_B233:
	defb 0e9h,00bh,0eah,005h,0f0h,007h,033h	; b233

; ----------------------------------------------------------------------
; DATOS partitura_B23A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x71 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (38 bytes)
;   0xb23a..0xb260  (38 bytes)
DATA_partitura_B23A:
	defb 0edh,024h,0ebh,089h,017h,0a1h,0dbh,002h,0c3h,0d3h,0a1h,0b5h,0a1h,0d2h,045h,0d3h	; b23a  .$............E.
	defb 0a1h,0d2h,09dh,0d3h,0a1h,0b5h,0a1h,0d2h,045h,0d3h,0a1h,0d1h,019h,0dch,0eah,006h	; b24a  ........E.......
	defb 0e9h,001h,0f0h,007h,061h,0ebh	; b25a

; ----------------------------------------------------------------------
; DATOS partitura_B260: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x71 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (26 bytes)
;   0xb260..0xb27a  (26 bytes)
DATA_partitura_B260:
	defb 007h,017h,002h,0d1h,096h,057h,016h,0d2h,096h,057h,016h,0d3h,096h,057h,016h,0d4h	; b260  .....W...W...W..
	defb 096h,057h,0fbh,002h,0d8h,0efh,0dch,0fdh,0f7h,0b1h	; b270  .W........

; ----------------------------------------------------------------------
; DATOS partitura_B27A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x71 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (14 bytes)
;   0xb27a..0xb288  (14 bytes)
DATA_partitura_B27A:
	defb 0feh,001h,0f1h,048h,005h,001h,009h,0e9h,00bh,0f0h,007h,02fh,0eah,00ch	; b27a  ...H......./..

; ----------------------------------------------------------------------
; DATOS partitura_B288: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x71 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (33 bytes)
;   0xb288..0xb2a9  (33 bytes)
DATA_partitura_B288:
	defb 0ebh,00ah,04ch,051h,0d3h,0c7h,0a0h,080h,080h,02ch,0edh,014h,0ebh,089h,039h,0b1h	; b288  ..LQ.....,....9.
	defb 0f0h,007h,032h,0d2h,070h,0d1h,010h,07dh,0f0h,001h,02fh,0ebh,00ah,04ch,051h,0d3h	; b298  ..2.p..}../..LQ.
	defb 0a0h	; b2a8

; ----------------------------------------------------------------------
; DATOS partitura_B2A9: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x71 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (34 bytes)
;   0xb2a9..0xb2cb  (34 bytes)
DATA_partitura_B2A9:
	defb 080h,080h,02ch,0f0h,007h,032h,0ebh,089h,039h,0b1h,0d2h,070h,0d1h,010h,07dh,0f1h	; b2a9  ..,..2..9..p..}.
	defb 048h,005h,001h,009h,0f0h,007h,02fh,0eah,00ch,0ebh,00ah,04ch,051h,0d2h,000h,0d3h	; b2b9  H...../....LQ...
	defb 0a0h,0a0h	; b2c9

; ----------------------------------------------------------------------
; DATOS partitura_B2CB: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x71 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xb2cb..0xb2ce  (3 bytes)
DATA_partitura_B2CB:
	defb 04ch,0edh,014h	; b2cb

; ----------------------------------------------------------------------
; DATOS partitura_B2CE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x71 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (56 bytes)
;   0xb2ce..0xb306  (56 bytes)
DATA_partitura_B2CE:
	defb 0ebh,089h,039h,0b1h,0f0h,007h,032h,0d2h,090h,0d1h,030h,09dh,0f0h,001h,02fh,0ebh	; b2ce  ..9...2...0.../.
	defb 00ah,04ch,051h,0d2h,000h,0d3h,0a0h,0a0h,04ch,0ebh,089h,039h,0b1h,0f0h,007h,032h	; b2de  .LQ.....L..9...2
	defb 0d2h,090h,0d1h,030h,099h,0f9h,092h,0b4h,0ech,0eah,001h,0f0h,007h,00fh,0e9h,00bh	; b2ee  ...0............
	defb 013h,0f9h,092h,0b4h,0d8h,0fdh,07ah,0b2h	; b2fe  ......z.

; ----------------------------------------------------------------------
; DATOS partitura_B306: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x71 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (24 bytes)
;   0xb306..0xb31e  (24 bytes)
DATA_partitura_B306:
	defb 0feh,001h,0f8h,04bh,0e9h,00bh,0eah,00eh,0ebh,00ah,047h,091h,0dbh,002h,0d5h,090h	; b306  ...K......G.....
	defb 0d4h,030h,0d5h,080h,0d4h,020h,0c9h,0d4h	; b316  .0... ..

; ----------------------------------------------------------------------
; DATOS partitura_B31E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x71 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (19 bytes)
;   0xb31e..0xb331  (19 bytes)
DATA_partitura_B31E:
	defb 030h,000h,077h,0e9h,001h,06eh,07dh,08eh,02eh,03dh,0d5h,0beh,0e9h,00bh,0d5h,081h	; b31e  0.w..n}..=......
	defb 0dbh,001h,0ebh	; b32e

; ----------------------------------------------------------------------
; DATOS partitura_B331: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x71 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (15 bytes)
;   0xb331..0xb340  (15 bytes)
DATA_partitura_B331:
	defb 00ah,04bh,051h,08bh,0dbh,002h,0ebh,00ah,047h,091h,0d4h,090h,080h,077h,0e9h	; b331  .KQ.....G....w.

; ----------------------------------------------------------------------
; DATOS partitura_B340: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x71 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (78 bytes)
;   0xb340..0xb38e  (78 bytes)
DATA_partitura_B340:
	defb 001h,06eh,0bdh,05eh,0aeh,04dh,09eh,0e9h,00bh,0eah,00eh,0ebh,00ah,047h,091h,0dbh	; b340  .n.^.M.......G..
	defb 002h,0d5h,0b0h,0d4h,050h,0d5h,0a0h,0d4h,040h,0c9h,0d4h,050h,020h,097h,0e9h,001h	; b350  ....P...@..P ...
	defb 08eh,0dbh,001h,0ebh,00ah,04bh,051h,09dh,0dbh,002h,0ebh,00ah,047h,091h,0aeh,04eh	; b360  .....KQ.....G..N
	defb 05dh,01eh,0e9h,00bh,0d5h,0a1h,0a1h,0c9h,0d4h,0b0h,0a0h,097h,0e9h,001h,08eh,0d3h	; b370  ]...............
	defb 01dh,0d4h,07eh,0d3h,00eh,0d4h,06dh,0beh,0f8h,01ch,0e9h,00bh,0eah,00fh	; b380  ..~...m.......

; ----------------------------------------------------------------------
; DATOS partitura_B38E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x71 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xb38e..0xb391  (3 bytes)
DATA_partitura_B38E:
	defb 0ebh,009h,06ah	; b38e

; ----------------------------------------------------------------------
; DATOS partitura_B391: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x71 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (5 bytes)
;   0xb391..0xb396  (5 bytes)
DATA_partitura_B391:
	defb 071h,0dbh,001h,0d5h,0f5h	; b391

; ----------------------------------------------------------------------
; DATOS partitura_B396: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x71 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (15 bytes)
;   0xb396..0xb3a5  (15 bytes)
DATA_partitura_B396:
	defb 031h,035h,0fbh,008h,067h,0f5h,031h,035h,0fbh,008h,067h,0dch,0fdh,006h,0b3h	; b396  15..g.15..g....

; ----------------------------------------------------------------------
; DATOS partitura_B3A5: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x71 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xb3a5..0xb3be  (25 bytes)
DATA_partitura_B3A5:
	defb 0feh,001h,0f8h,009h,0e9h,00bh,0f0h,007h,042h,0eah,007h,0d9h,0d6h,001h,004h,0edh	; b3a5  ........B.......
	defb 094h,0ebh,087h,027h,0b1h,0dbh,002h,0d2h,08fh	; b3b5  ...'.....

; ----------------------------------------------------------------------
; DATOS partitura_B3BE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x71 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (12 bytes)
;   0xb3be..0xb3ca  (12 bytes)
DATA_partitura_B3BE:
	defb 07fh,08fh,07fh,0f0h,007h,042h,0eah,007h,0d9h,0d6h,001h,004h	; b3be  .....B......

; ----------------------------------------------------------------------
; DATOS partitura_B3CA: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x71 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xb3ca..0xb3dc  (18 bytes)
DATA_partitura_B3CA:
	defb 0edh,094h,0ebh,087h,027h,0b1h,0dbh,002h,0d2h,0afh,09fh,0afh,09fh,0d8h,0d9h,0d6h	; b3ca  ....'...........
	defb 004h,002h	; b3da

; ----------------------------------------------------------------------
; DATOS partitura_B3DC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x71 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (33 bytes)
;   0xb3dc..0xb3fd  (33 bytes)
DATA_partitura_B3DC:
	defb 0f0h,007h,032h,0eah,00ah,0edh,023h,0ebh,089h,047h,0a1h,0dbh,001h,0c3h,0d2h,071h	; b3dc  ..2...#..G.....q
	defb 085h,071h,0d1h,015h,0d2h,071h,0d1h,06dh,0d2h,071h,085h,071h,0d1h,015h,0d2h,071h	; b3ec  .q...q.m.q.q...q
	defb 0d1h	; b3fc

; ----------------------------------------------------------------------
; DATOS partitura_B3FD: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x71 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (30 bytes)
;   0xb3fd..0xb41b  (30 bytes)
DATA_partitura_B3FD:
	defb 0a9h,0d0h,01bh,0d2h,071h,085h,071h,0d1h,015h,0d2h,071h,0d1h,06dh,0d2h,071h,085h	; b3fd  ....q.q...q.m.q.
	defb 071h,0d1h,015h,0d2h,071h,0d1h,0a9h,0d0h,017h,0dch,0d8h,0fdh,0a5h,0b3h	; b40d  q...q.........

; ----------------------------------------------------------------------
; DATOS partitura_B41B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x71 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xb41b..0xb41f  (4 bytes)
DATA_partitura_B41B:
	defb 0feh,001h,0e9h,00bh	; b41b

; ----------------------------------------------------------------------
; DATOS partitura_B41F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x71 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (63 bytes)
;   0xb41f..0xb45e  (63 bytes)
DATA_partitura_B41F:
	defb 0f0h,007h,042h,0eah,007h,0d9h,0d6h,001h,007h,0edh,084h,0ebh,087h,027h,0b1h,0dbh	; b41f  ..B..........'..
	defb 002h,0d1h,02fh,01fh,02fh,01fh,0f0h,007h,042h,0edh,094h,0eah,007h,0d9h,0d6h,001h	; b42f  .././...B.......
	defb 004h,0ebh,087h,027h,0b1h,0dbh,002h,0d1h,04fh,03fh,04fh,03fh,0d8h,0eeh,001h,0d9h	; b43f  ...'....O?O?....
	defb 0d6h,004h,002h,0f0h,007h,031h,0eah,006h,0edh,023h,0ebh,089h,017h,0f1h,0dbh	; b44f  .....1...#.....

; ----------------------------------------------------------------------
; DATOS partitura_B45E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x71 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (81 bytes)
;   0xb45e..0xb4af  (81 bytes)
DATA_partitura_B45E:
	defb 001h,0c5h,0d2h,071h,085h,071h,0d1h,015h,0d2h,071h,0d1h,06dh,0d2h,071h,085h,071h	; b45e  ...q.q...q.m.q.q
	defb 0d1h,015h,0d2h,071h,0d1h,0a9h,0d0h,01bh,0d2h,071h,085h,071h,0d1h,015h,0d2h,071h	; b46e  ...q.....q.q...q
	defb 0d1h,06dh,0d2h,071h,085h,071h,0d1h,015h,0d2h,071h,0d1h,0a9h,0d0h,015h,0efh,0dch	; b47e  .m.q.q...q......
	defb 0d8h,0fdh,01bh,0b4h,0f6h,0f8h,009h,0e9h,00bh,0eah,00ah,0f0h,007h,033h,0edh,023h	; b48e  .............3.#
	defb 0ebh,089h,047h,0a1h,0dbh,001h,0d3h,0a1h,0b5h,0a1h,0d2h,045h,0d3h,0a1h,0d2h,09dh	; b49e  ..G........E....
	defb 0d3h	; b4ae

; ----------------------------------------------------------------------
; DATOS partitura_B4AF: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x71 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xb4af..0xb4b3  (4 bytes)
DATA_partitura_B4AF:
	defb 0a1h,0b5h,0a1h,0d2h	; b4af

; ----------------------------------------------------------------------
; DATOS partitura_B4B3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x71 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (38 bytes)
;   0xb4b3..0xb4d9  (38 bytes)
DATA_partitura_B4B3:
	defb 045h,0d3h,0a1h,0d1h,019h,0f8h,052h,0dch,0eah,006h,0e9h,001h,0f0h,007h,061h,0edh	; b4b3  E.....R.......a.
	defb 015h,0ebh,08ah,007h,004h,0d1h,096h,057h,016h,0d2h,096h,057h,016h,0d3h,096h,057h	; b4c3  .......W...W...W
	defb 016h,0d4h,096h,057h,016h,0fah	; b4d3

; ----------------------------------------------------------------------
; DATOS partitura_B4D9: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x72 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (57 bytes)
;   0xb4d9..0xb512  (57 bytes)
DATA_partitura_B4D9:
	defb 0feh,004h,0e9h,006h,0d1h,0f5h,000h,000h,003h,000h,000h,000h,000h,009h,003h,001h	; b4d9  ................
	defb 0fbh,008h,001h,001h,001h,001h,001h,001h,001h,001h,0f5h,000h,000h,003h,000h,000h	; b4e9  ................
	defb 000h,000h,009h,003h,001h,0fbh,008h,0f5h,0d0h,0b0h,0d1h,000h,003h,000h,000h,001h	; b4f9  ................
	defb 001h,000h,000h,001h,0fbh,008h,0fdh,0d9h,0b4h	; b509  .........

; ----------------------------------------------------------------------
; DATOS partitura_B512: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x72 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xb512..0xb514  (2 bytes)
DATA_partitura_B512:
	defb 0feh,001h	; b512

; ----------------------------------------------------------------------
; DATOS partitura_B514: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x72 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (49 bytes)
;   0xb514..0xb545  (49 bytes)
DATA_partitura_B514:
	defb 0e9h,006h,0eeh,081h,0eah,004h,0ebh,003h,017h,002h,0f5h,0c0h,0d1h,001h,051h,081h	; b514  ..............Q.
	defb 001h,071h,031h,001h,051h,081h,001h,071h,0d0h,001h,0d1h,0a1h,0d1h,001h,051h,081h	; b524  .q1.Q..q......Q.
	defb 001h,071h,031h,001h,051h,081h,001h,031h,051h,070h,0fbh,002h,0efh,0eeh,081h,0ebh	; b534  .q1.Q..1Qp......
	defb 003h	; b544

; ----------------------------------------------------------------------
; DATOS partitura_B545: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x72 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (70 bytes)
;   0xb545..0xb58b  (70 bytes)
DATA_partitura_B545:
	defb 017h,002h,0f5h,0c0h,0d1h,021h,071h,0a1h,021h,091h,051h,021h,071h,0a1h,021h,091h	; b545  .....!q.!.Q!q.!.
	defb 0d0h,021h,001h,0d1h,021h,071h,0a1h,021h,091h,051h,021h,071h,0a1h,021h,051h,071h	; b555  .!..!q.!.Q!q.!Qq
	defb 090h,0fbh,002h,0eah,006h,0c1h,0ebh,007h,013h,002h,0f0h,007h,013h,0d3h,085h,0a5h	; b565  ................
	defb 0d2h,001h,0eah,00ah,0ebh,019h,027h,004h,0d6h,010h,001h,0f0h,007h,014h,0f5h,0d3h	; b575  ......'.........
	defb 071h,073h,073h,073h,071h,073h	; b585

; ----------------------------------------------------------------------
; DATOS partitura_B58B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x72 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xb58b..0xb593  (8 bytes)
DATA_partitura_B58B:
	defb 053h,0a1h,0fbh,004h,0ebh,019h,027h,004h	; b58b  S.....'.

; ----------------------------------------------------------------------
; DATOS partitura_B593: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x72 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (26 bytes)
;   0xb593..0xb5ad  (26 bytes)
DATA_partitura_B593:
	defb 0d6h,010h,001h,0f0h,007h,011h,0f5h,0d2h,001h,003h,003h,003h,001h,003h,0d3h,0a3h	; b593  ................
	defb 0d2h,031h,0fbh,004h,0e9h,00ch,0eeh,081h,0eah,008h	; b5a3  .1........

; ----------------------------------------------------------------------
; DATOS partitura_B5AD: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x72 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (47 bytes)
;   0xb5ad..0xb5dc  (47 bytes)
DATA_partitura_B5AD:
	defb 0edh,017h,0ebh,087h,025h,0f1h,0dbh,002h,0d6h,003h,001h,0f0h,007h,022h,0f5h,0c0h	; b5ad  ....%........"..
	defb 0d1h,000h,0d2h,0a0h,0d1h,000h,030h,020h,000h,000h,0d2h,0a0h,0d1h,007h,000h,0d2h	; b5bd  ......0 ........
	defb 0a0h,0d1h,000h,030h,020h,000h,000h,0d2h,0a0h,0d1h,056h,0fbh,002h,0dch,0d8h	; b5cd  ...0 .....V....

; ----------------------------------------------------------------------
; DATOS partitura_B5DC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x72 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xb5dc..0xb5e0  (4 bytes)
DATA_partitura_B5DC:
	defb 0efh,0fdh,012h,0b5h	; b5dc

; ----------------------------------------------------------------------
; DATOS partitura_B5E0: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x72 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (9 bytes)
;   0xb5e0..0xb5e9  (9 bytes)
DATA_partitura_B5E0:
	defb 0feh,001h,0f1h,00ah,025h,001h,004h,0e9h,006h	; b5e0  ....%....

; ----------------------------------------------------------------------
; DATOS partitura_B5E9: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x72 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xb5e9..0xb602  (25 bytes)
DATA_partitura_B5E9:
	defb 0eah,00eh,0ebh,019h,037h,031h,0f5h,0d4h,051h,053h,053h,053h,051h,053h,083h,0a1h	; b5e9  ....71..QSSSQS..
	defb 051h,053h,053h,053h,051h,053h,013h,031h,0fbh	; b5f9  QSSSQS.1.

; ----------------------------------------------------------------------
; DATOS partitura_B602: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x72 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xb602..0xb61b  (25 bytes)
DATA_partitura_B602:
	defb 002h,0f1h,00ah,025h,001h,004h,0ebh,019h,037h,031h,0f5h,0d4h,071h,073h,073h,073h	; b602  ...%....71..qsss
	defb 071h,073h,0a3h,0d3h,001h,0d4h,071h,073h,073h	; b612  qs....qss

; ----------------------------------------------------------------------
; DATOS partitura_B61B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x72 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (43 bytes)
;   0xb61b..0xb646  (43 bytes)
DATA_partitura_B61B:
	defb 073h,071h,073h,033h,051h,0fbh,002h,055h,075h,083h,0f1h,00ah,025h,001h,004h,0eah	; b61b  sqs3Q..Uu...%...
	defb 00fh,0ebh,019h,037h,031h,0f5h,0d4h,001h,003h,003h,003h,001h,003h,023h,031h,0fbh	; b62b  ...71........#1.
	defb 004h,0f5h,0d4h,051h,053h,053h,053h,051h,053h,073h,081h	; b63b  ...QSSSQSs.

; ----------------------------------------------------------------------
; DATOS partitura_B646: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x72 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (22 bytes)
;   0xb646..0xb65c  (22 bytes)
DATA_partitura_B646:
	defb 0fbh,004h,0f1h,00dh,028h,001h,00ah,0ebh,019h,037h,061h,0f5h,0d4h,00fh,01fh,00fh	; b646  ....(....7a.....
	defb 01fh,0fbh,002h,0fdh,0e0h,0b5h	; b656

; ----------------------------------------------------------------------
; DATOS partitura_B65C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x72 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xb65c..0xb667  (11 bytes)
DATA_partitura_B65C:
	defb 0feh,001h,0f8h,052h,0e9h,006h,0eah,007h,0ebh,01ah,037h	; b65c  ...R......7

; ----------------------------------------------------------------------
; DATOS partitura_B667: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x72 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (13 bytes)
;   0xb667..0xb674  (13 bytes)
DATA_partitura_B667:
	defb 001h,0f5h,0d1h,001h,051h,081h,001h,071h,031h,001h,051h,081h,001h	; b667  ....Q..q1.Q..

; ----------------------------------------------------------------------
; DATOS partitura_B674: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x72 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (46 bytes)
;   0xb674..0xb6a2  (46 bytes)
DATA_partitura_B674:
	defb 071h,0d0h,001h,0d1h,0a1h,0d1h,001h,051h,081h,001h,071h,031h,001h,051h,081h,001h	; b674  q......Q..q1.Q..
	defb 031h,051h,071h,0fbh,002h,0ebh,01ah,037h,001h,0f5h,0d1h,021h,071h,0a1h,021h,091h	; b684  1Qq....7...!q.!.
	defb 051h,021h,071h,0a1h,021h,091h,0d0h,021h,001h,0d1h,021h,071h,0a1h,021h	; b694  Q!q.!..!..!q.!

; ----------------------------------------------------------------------
; DATOS partitura_B6A2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x72 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (27 bytes)
;   0xb6a2..0xb6bd  (27 bytes)
DATA_partitura_B6A2:
	defb 091h,051h,021h,071h,0a1h,021h,051h,071h,091h,0fbh,002h,0f8h,00dh,0eah,009h,0ebh	; b6a2  .Q!q.!Qq........
	defb 009h,037h,071h,0f0h,007h,003h,0d6h,010h,001h,0d3h,085h	; b6b2  .7q........

; ----------------------------------------------------------------------
; DATOS partitura_B6BD: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x72 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xb6bd..0xb6c4  (7 bytes)
DATA_partitura_B6BD:
	defb 0a5h,0d2h,003h,0d8h,0f8h,002h,0eah	; b6bd

; ----------------------------------------------------------------------
; DATOS partitura_B6C4: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x72 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xb6c4..0xb6dd  (25 bytes)
DATA_partitura_B6C4:
	defb 00bh,0ebh,019h,03ch,003h,0d6h,005h,002h,0f0h,007h,005h,0f5h,0d2h,001h,003h,003h	; b6c4  ...<............
	defb 003h,001h,003h,0d3h,0a3h,0d2h,031h,0fbh,004h	; b6d4  ......1..

; ----------------------------------------------------------------------
; DATOS partitura_B6DD: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x72 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xb6dd..0xb6ef  (18 bytes)
DATA_partitura_B6DD:
	defb 0f8h,002h,0ebh,019h,03ch,003h,0d6h,002h,001h,0f0h,005h,001h,0f5h,0d2h,051h,053h	; b6dd  ....<.........QS
	defb 053h,053h	; b6ed

; ----------------------------------------------------------------------
; DATOS partitura_B6EF: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x72 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xb6ef..0xb708  (25 bytes)
DATA_partitura_B6EF:
	defb 051h,053h,033h,081h,0fbh,004h,0d8h,0f0h,000h,0f8h,052h,0eah,007h,0ebh,01ah,047h	; b6ef  QS3.......R....G
	defb 002h,0f5h,0d1h,000h,050h,0a0h,0d0h,030h,080h	; b6ff  ....P..0.

; ----------------------------------------------------------------------
; DATOS partitura_B708: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x72 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (32 bytes)
;   0xb708..0xb728  (32 bytes)
DATA_partitura_B708:
	defb 030h,0d1h,0a0h,050h,000h,0d2h,070h,0d1h,000h,050h,0a0h,050h,0a0h,0d1h,030h,000h	; b708  0..P..p..P.P..0.
	defb 050h,080h,0d0h,000h,0d1h,080h,050h,000h,0d2h,080h,0d1h,000h,0d2h,080h,0d1h,000h	; b718  P.....P.........

; ----------------------------------------------------------------------
; DATOS partitura_B728: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x72 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xb728..0xb733  (11 bytes)
DATA_partitura_B728:
	defb 050h,080h,050h,080h,0d0h,000h,0fbh,004h,0fdh,05ch,0b6h	; b728  P.P......\.

; ----------------------------------------------------------------------
; DATOS partitura_B733: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x72 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (69 bytes)
;   0xb733..0xb778  (69 bytes)
DATA_partitura_B733:
	defb 0feh,001h,0f8h,002h,0e9h,00ch,0eah,00ah,0edh,019h,0ebh,089h,047h,0e1h,0d6h,004h	; b733  ............G...
	defb 001h,0f0h,007h,032h,0d2h,058h,070h,080h,070h,030h,008h,0d3h,0a0h,0d2h,000h,031h	; b743  ...2.Xp.p0.....1
	defb 058h,070h,080h,070h,030h,000h,0d1h,00bh,0f8h,009h,0eah,00ch,0edh,01bh,0ebh,089h	; b753  Xp.p0...........
	defb 047h,0e1h,0d6h,004h,001h,0f0h,007h,033h,0d2h,078h,090h,0a0h,090h,050h,028h,000h	; b763  G......3.x...P(.
	defb 020h,051h,078h,090h,0a0h	; b773

; ----------------------------------------------------------------------
; DATOS partitura_B778: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x72 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xb778..0xb77f  (7 bytes)
DATA_partitura_B778:
	defb 090h,050h,020h,0d1h,02bh,0f8h,002h	; b778

; ----------------------------------------------------------------------
; DATOS partitura_B77F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x72 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (84 bytes)
;   0xb77f..0xb7d3  (84 bytes)
DATA_partitura_B77F:
	defb 0ebh,009h,048h,031h,0d2h,050h,070h,080h,070h,0a0h,080h,0d1h,000h,0d2h,0a0h,0eah	; b77f  ..H1.Pp.p.......
	defb 00ah,0edh,019h,0ebh,089h,047h,0e1h,0d6h,004h,001h,0f0h,007h,031h,0d1h,002h,036h	; b78f  .....G......1..6
	defb 020h,0d2h,0a0h,0d1h,020h,002h,076h,050h,030h,050h,021h,030h,0dbh,002h,00fh,0dch	; b79f   ... .vP0P!0....
	defb 0ech,0eah,002h,0d8h,0f0h,007h,002h,001h,0eah,00ch,0ebh,009h,048h,031h,0d9h,0d6h	; b7af  ............H1..
	defb 004h,001h,0f0h,007h,032h,000h,020h,030h,050h,070h,0eeh,081h,0eah,00ah,0edh,019h	; b7bf  ....2. 0Pp......
	defb 0ebh,089h,047h,0e1h	; b7cf

; ----------------------------------------------------------------------
; DATOS partitura_B7D3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x72 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (42 bytes)
;   0xb7d3..0xb7fd  (42 bytes)
DATA_partitura_B7D3:
	defb 0d6h,002h,001h,0f0h,007h,031h,0d1h,052h,086h,070h,030h,070h,052h,0d0h,006h,0d1h	; b7d3  .....1.R.p0pR...
	defb 0a0h,080h,070h,070h,080h,0dbh,002h,05fh,0ech,0eah,002h,0d8h,0f0h,007h,002h,052h	; b7e3  ..pp..._.......R
	defb 0eah,009h,0edh,019h,0ebh,089h,047h,0e1h,0f0h,007h	; b7f3  ......G...

; ----------------------------------------------------------------------
; DATOS partitura_B7FD: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x72 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (33 bytes)
;   0xb7fd..0xb81e  (33 bytes)
DATA_partitura_B7FD:
	defb 031h,0d6h,002h,001h,0d1h,051h,071h,080h,0efh,0eah,009h,0edh,018h,0ebh,085h,037h	; b7fd  1....Qq........7
	defb 0e1h,0dbh,002h,0d6h,008h,001h,0f0h,007h,022h,0f5h,0d1h,000h,0d2h,0a0h,0d1h,000h	; b80d  ........".......
	defb 030h	; b81d

; ----------------------------------------------------------------------
; DATOS partitura_B81E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x72 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (20 bytes)
;   0xb81e..0xb832  (20 bytes)
DATA_partitura_B81E:
	defb 020h,000h,000h,0d2h,0a0h,0d1h,007h,000h,0d2h,0a0h,0d1h,000h,030h,020h,000h,000h	; b81e   ...........0 ..
	defb 0d2h,0a0h,0d1h,057h	; b82e

; ----------------------------------------------------------------------
; DATOS partitura_B832: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x72 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xb832..0xb833  (1 bytes)
DATA_partitura_B832:
	defb 0fbh	; b832

; ----------------------------------------------------------------------
; DATOS partitura_B833: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x72 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xb833..0xb839  (6 bytes)
DATA_partitura_B833:
	defb 002h,0dch,0d8h,0fdh,033h,0b7h	; b833

; ----------------------------------------------------------------------
; DATOS partitura_B839: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x72 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xb839..0xb83a  (1 bytes)
DATA_partitura_B839:
	defb 0feh	; b839

; ----------------------------------------------------------------------
; DATOS partitura_B83A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x72 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (10 bytes)
;   0xb83a..0xb844  (10 bytes)
DATA_partitura_B83A:
	defb 001h,0dbh,001h,0e9h,00ch,0c0h,0eeh,081h,0eah,005h	; b83a  ..........

; ----------------------------------------------------------------------
; DATOS partitura_B844: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x72 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xb844..0xb848  (4 bytes)
DATA_partitura_B844:
	defb 0ebh,007h,015h,0f1h	; b844

; ----------------------------------------------------------------------
; DATOS partitura_B848: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x72 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xb848..0xb859  (17 bytes)
DATA_partitura_B848:
	defb 0d6h,004h,001h,0f0h,007h,033h,0d2h,058h,070h,080h,070h,030h,008h,0d3h,0a0h,0d2h	; b848  .....3.Xp.p0....
	defb 000h	; b858

; ----------------------------------------------------------------------
; DATOS partitura_B859: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x72 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (39 bytes)
;   0xb859..0xb880  (39 bytes)
DATA_partitura_B859:
	defb 031h,058h,070h,080h,070h,030h,000h,0d1h,00ah,0dch,0c1h,0eah,006h,0ebh,007h,015h	; b859  1Xp.p0..........
	defb 0f1h,0d6h,004h,001h,0f0h,007h,033h,0d2h,078h,090h,0a0h,090h,050h,028h,000h,020h	; b869  ......3.x...P(.
	defb 051h,078h,090h,0a0h,090h,050h,020h	; b879

; ----------------------------------------------------------------------
; DATOS partitura_B880: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x72 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xb880..0xb888  (8 bytes)
DATA_partitura_B880:
	defb 0d1h,029h,0ebh,003h,038h,002h,0c0h,0d2h	; b880  .)..8...

; ----------------------------------------------------------------------
; DATOS partitura_B888: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x72 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xb888..0xb890  (8 bytes)
DATA_partitura_B888:
	defb 050h,070h,080h,070h,0a0h,080h,0d1h,000h	; b888  Pp.p....

; ----------------------------------------------------------------------
; DATOS partitura_B890: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x72 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xb890..0xb896  (6 bytes)
DATA_partitura_B890:
	defb 0c0h,0dbh,002h,0eah,005h,0ebh	; b890

; ----------------------------------------------------------------------
; DATOS partitura_B896: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x72 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (22 bytes)
;   0xb896..0xb8ac  (22 bytes)
DATA_partitura_B896:
	defb 007h,015h,0f1h,0d6h,004h,001h,0f0h,007h,031h,0d1h,002h,036h,020h,0d2h,0a0h,0d1h	; b896  ........1..6 ...
	defb 020h,002h,076h,050h,030h,050h	; b8a6

; ----------------------------------------------------------------------
; DATOS partitura_B8AC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x72 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xb8ac..0xb8af  (3 bytes)
DATA_partitura_B8AC:
	defb 021h,030h,0dbh	; b8ac

; ----------------------------------------------------------------------
; DATOS partitura_B8AF: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x72 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (32 bytes)
;   0xb8af..0xb8cf  (32 bytes)
DATA_partitura_B8AF:
	defb 002h,00fh,0dch,0ech,0eah,001h,0d8h,0f0h,007h,002h,001h,0eah,005h,0ebh,003h,038h	; b8af  ...............8
	defb 002h,0d9h,0d6h,004h,001h,0f0h,007h,032h,000h,020h,030h,050h,0dch,0efh,0c0h,0dbh	; b8bf  .......2. 0P....

; ----------------------------------------------------------------------
; DATOS partitura_B8CF: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x72 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xb8cf..0xb8d2  (3 bytes)
DATA_partitura_B8CF:
	defb 002h,0eah,005h	; b8cf

; ----------------------------------------------------------------------
; DATOS partitura_B8D2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x72 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (33 bytes)
;   0xb8d2..0xb8f3  (33 bytes)
DATA_partitura_B8D2:
	defb 0ebh,007h,015h,0f1h,0d6h,002h,001h,0f0h,007h,031h,0d1h,052h,086h,070h,030h,070h	; b8d2  .........1.R.p0p
	defb 052h,0d0h,006h,0d1h,0a0h,080h,070h,070h,080h,05fh,0ech,0eah,001h,0d8h,0f0h,007h	; b8e2  R.....pp._......
	defb 002h	; b8f2

; ----------------------------------------------------------------------
; DATOS partitura_B8F3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x72 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xb8f3..0xb8f5  (2 bytes)
DATA_partitura_B8F3:
	defb 052h,0eah	; b8f3

; ----------------------------------------------------------------------
; DATOS partitura_B8F5: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x72 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (38 bytes)
;   0xb8f5..0xb91b  (38 bytes)
DATA_partitura_B8F5:
	defb 005h,0ebh,007h,015h,0f1h,0f0h,007h,031h,0d6h,002h,001h,0d1h,051h,071h,0dch,0eah	; b8f5  .......1....Qq..
	defb 009h,0edh,018h,0ebh,085h,037h,0e1h,0dbh,002h,0d6h,010h,001h,0f0h,007h,023h,0f5h	; b905  .....7........#.
	defb 0d2h,070h,050h,070h,0a0h,090h	; b915

; ----------------------------------------------------------------------
; DATOS partitura_B91B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x72 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xb91b..0xb91f  (4 bytes)
DATA_partitura_B91B:
	defb 070h,070h,050h,087h	; b91b

; ----------------------------------------------------------------------
; DATOS partitura_B91F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x72 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xb91f..0xb930  (17 bytes)
DATA_partitura_B91F:
	defb 070h,050h,070h,0a0h,090h,070h,070h,050h,0d1h,007h,0fbh,002h,0dch,0d8h,0fdh,039h	; b91f  pPp..ppP.......9
	defb 0b8h	; b92f

; ----------------------------------------------------------------------
; DATOS partitura_B930: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (27 bytes)
;   0xb930..0xb94b  (27 bytes)
DATA_partitura_B930:
	defb 0feh,004h,0e9h,007h,0d0h,0b3h,0a1h,0b7h,0b1h,0b7h,0a1h,0b5h,0b1h,0b5h,0a1h,0bbh	; b930  ................
	defb 0d1h,081h,060h,070h,080h,080h,091h,091h,0e9h,001h,062h	; b940  ..`p......b

; ----------------------------------------------------------------------
; DATOS partitura_B94B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xb94b..0xb95d  (18 bytes)
DATA_partitura_B94B:
	defb 063h,062h,063h,072h,073h,072h,073h,082h,083h,082h,083h,092h,09ah,0e9h,007h,0d0h	; b94b  cbcrsrs.........
	defb 0b3h,0a1h	; b95b

; ----------------------------------------------------------------------
; DATOS partitura_B95D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (32 bytes)
;   0xb95d..0xb97d  (32 bytes)
DATA_partitura_B95D:
	defb 0b7h,0b1h,0b7h,0a1h,0bfh,0a1h,0bdh,0d1h,080h,080h,083h,080h,080h,080h,080h,091h	; b95d  ................
	defb 091h,0feh,004h,0e9h,007h,0d1h,0f5h,083h,060h,060h,070h,070h,071h,081h,081h,060h	; b96d  ........``ppq..`

; ----------------------------------------------------------------------
; DATOS partitura_B97D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xb97d..0xb97e  (1 bytes)
DATA_partitura_B97D:
	defb 070h	; b97d

; ----------------------------------------------------------------------
; DATOS partitura_B97E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xb97e..0xb990  (18 bytes)
DATA_partitura_B97E:
	defb 0fbh,007h,081h,081h,060h,060h,070h,080h,081h,081h,081h,060h,070h,0feh,004h,0e9h	; b97e  ....``p....`p...
	defb 007h,0d1h	; b98e

; ----------------------------------------------------------------------
; DATOS partitura_B990: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (46 bytes)
;   0xb990..0xb9be  (46 bytes)
DATA_partitura_B990:
	defb 0f5h,083h,060h,060h,070h,070h,081h,081h,081h,060h,070h,0fbh,003h,081h,081h,060h	; b990  ..``pp...`p....`
	defb 070h,080h,090h,081h,091h,060h,060h,070h,080h,093h,0d0h,0a0h,0a0h,0a0h,0a0h,0a7h	; b9a0  p....``p........
	defb 0d1h,093h,0d0h,0a3h,0d1h,093h,0d0h,0a1h,0d1h,060h,070h,083h,060h,060h	; b9b0  .........`p.``

; ----------------------------------------------------------------------
; DATOS partitura_B9BE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (23 bytes)
;   0xb9be..0xb9d5  (23 bytes)
DATA_partitura_B9BE:
	defb 070h,070h,081h,081h,081h,060h,070h,081h,081h,081h,081h,060h,060h,070h,070h,080h	; b9be  pp...`p....``pp.
	defb 080h,090h,090h,0e9h,00eh,0d0h,0abh	; b9ce

; ----------------------------------------------------------------------
; DATOS partitura_B9D5: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xb9d5..0xb9d6  (1 bytes)
DATA_partitura_B9D5:
	defb 0ffh	; b9d5

; ----------------------------------------------------------------------
; DATOS partitura_B9D6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xb9d6..0xb9e7  (17 bytes)
DATA_partitura_B9D6:
	defb 0feh,001h,0e9h,007h,0c1h,0eeh,081h,0d9h,0d6h,001h,001h,0eah,005h,0edh,014h,0ebh	; b9d6  ................
	defb 089h	; b9e6

; ----------------------------------------------------------------------
; DATOS partitura_B9E7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xb9e7..0xb9ee  (7 bytes)
DATA_partitura_B9E7:
	defb 047h,021h,0f5h,0d1h,000h,050h,020h	; b9e7

; ----------------------------------------------------------------------
; DATOS partitura_B9EE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (43 bytes)
;   0xb9ee..0xba19  (43 bytes)
DATA_partitura_B9EE:
	defb 070h,000h,050h,020h,070h,000h,050h,020h,070h,000h,050h,020h,070h,0fbh,007h,0f5h	; b9ee  p.P p.P p.P p...
	defb 0d2h,0a0h,0d1h,030h,000h,050h,0fbh,006h,070h,080h,0a0h,0d0h,000h,020h,030h,0efh	; b9fe  ...0.P..p.... 0.
	defb 0feh,001h,0e9h,007h,0eeh,081h,0c2h,0edh,006h,0eah,007h	; ba0e  ...........

; ----------------------------------------------------------------------
; DATOS partitura_BA19: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (19 bytes)
;   0xba19..0xba2c  (19 bytes)
DATA_partitura_BA19:
	defb 0ebh,089h,03ah,0d1h,0dbh,003h,0d6h,004h,002h,0f0h,007h,052h,0d2h,00bh,033h,0afh	; ba19  ..:........R..3.
	defb 090h,0e9h,00eh	; ba29

; ----------------------------------------------------------------------
; DATOS partitura_BA2C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xba2c..0xba34  (8 bytes)
DATA_partitura_BA2C:
	defb 07eh,0e9h,007h,0ech,0eah,003h,0d8h,0f0h	; ba2c  ~.......

; ----------------------------------------------------------------------
; DATOS partitura_BA34: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (24 bytes)
;   0xba34..0xba4c  (24 bytes)
DATA_partitura_BA34:
	defb 007h,003h,070h,0eah,007h,0ebh,089h,03ah,0d1h,0d6h,004h,002h,0f0h,007h,052h,00bh	; ba34  ..p....:......R.
	defb 033h,0ach,0d1h,002h,0d2h,090h,070h,050h	; ba44  3.....pP

; ----------------------------------------------------------------------
; DATOS partitura_BA4C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (27 bytes)
;   0xba4c..0xba67  (27 bytes)
DATA_partitura_BA4C:
	defb 0e9h,00eh,07ch,0feh,001h,0e9h,007h,0c1h,0eeh,001h,0edh,017h,0eah,008h,0ebh,087h	; ba4c  ..|.............
	defb 01bh,091h,0dbh,003h,0d6h,004h,001h,0f0h,007h,051h,0d2h	; ba5c  .........Q.

; ----------------------------------------------------------------------
; DATOS partitura_BA67: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xba67..0xba6a  (3 bytes)
DATA_partitura_BA67:
	defb 082h,0d1h,000h	; ba67

; ----------------------------------------------------------------------
; DATOS partitura_BA6A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (32 bytes)
;   0xba6a..0xba8a  (32 bytes)
DATA_partitura_BA6A:
	defb 077h,033h,022h,0d2h,070h,0a7h,0d1h,053h,0e9h,002h,039h,0d2h,083h,0d1h,004h,053h	; ba6a  w3".p..S..9....S
	defb 0a4h,0e9h,007h,0d0h,003h,023h,0d1h,073h,0e9h,002h,0ech,0eah,002h,074h,0eah,008h	; ba7a  .....#.s.....t..

; ----------------------------------------------------------------------
; DATOS partitura_BA8A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xba8a..0xba95  (11 bytes)
DATA_partitura_BA8A:
	defb 0ebh,087h,01bh,091h,0d0h,023h,0d1h,074h,0e9h,007h,0d0h	; ba8a  .....#.t...

; ----------------------------------------------------------------------
; DATOS partitura_BA95: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (24 bytes)
;   0xba95..0xbaad  (24 bytes)
DATA_partitura_BA95:
	defb 027h,0d2h,002h,030h,0a5h,0d2h,071h,0d1h,001h,0d2h,0a1h,087h,0a7h,0e9h,00eh,0d1h	; ba95  '..0..q.........
	defb 02eh,0d4h,007h,0ech,0eah,001h,001h,0ffh	; baa5  ........

; ----------------------------------------------------------------------
; DATOS partitura_BAAD: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xbaad..0xbabe  (17 bytes)
DATA_partitura_BAAD:
	defb 0feh,001h,0f1h,014h,028h,001h,00ah,0e9h,007h,0eah,00fh,0f0h,00ah,03fh,0ebh,009h	; baad  ....(........?..
	defb 03bh	; babd

; ----------------------------------------------------------------------
; DATOS partitura_BABE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (28 bytes)
;   0xbabe..0xbada  (28 bytes)
DATA_partitura_BABE:
	defb 0b1h,0dbh,002h,0d6h,010h,002h,0f0h,009h,071h,0d4h,03dh,021h,00fh,0d5h,0a1h,0e9h	; babe  ........q.=!....
	defb 00eh,09fh,0f6h,0f8h,028h,0d8h,0ech,0eah,002h,092h,0f1h,014h	; bace  ....(.......

; ----------------------------------------------------------------------
; DATOS partitura_BADA: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (15 bytes)
;   0xbada..0xbae9  (15 bytes)
DATA_partitura_BADA:
	defb 028h,001h,00ah,0d6h,020h,002h,0eah,00fh,0ebh,009h,03bh,0b1h,0e9h,007h,0d4h	; bada  (... ..........

; ----------------------------------------------------------------------
; DATOS partitura_BAE9: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (43 bytes)
;   0xbae9..0xbb14  (43 bytes)
DATA_partitura_BAE9:
	defb 03dh,021h,00dh,0d5h,0a1h,093h,071h,0e9h,00eh,05fh,0f6h,0f8h,028h,0ech,0d8h,0eah	; bae9  =!....q.._..(...
	defb 002h,050h,0dch,0d8h,0feh,001h,0f8h,01ch,0e9h,007h,0eah,00fh,0ebh,009h,04bh,031h	; baf9  .P............K1
	defb 0dbh,001h,0f5h,0d4h,003h,0d5h,073h,0d4h,003h,0d5h,073h	; bb09  ......s...s

; ----------------------------------------------------------------------
; DATOS partitura_BB14: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xbb14..0xbb15  (1 bytes)
DATA_partitura_BB14:
	defb 0fbh	; bb14

; ----------------------------------------------------------------------
; DATOS partitura_BB15: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xbb15..0xbb2e  (25 bytes)
DATA_partitura_BB15:
	defb 007h,0d4h,003h,0d5h,0a3h,083h,073h,0feh,001h,0f6h,0f8h,01ch,0e9h,007h,0eah,00fh	; bb15  ......s.........
	defb 0ebh,009h,04bh,031h,0dbh,001h,0f5h,0d5h,053h	; bb25  ..K1....S

; ----------------------------------------------------------------------
; DATOS partitura_BB2E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (27 bytes)
;   0xbb2e..0xbb49  (27 bytes)
DATA_partitura_BB2E:
	defb 0d4h,003h,0fbh,002h,0f5h,0d5h,073h,0d4h,023h,0fbh,002h,0f5h,0d5h,083h,0d4h,033h	; bb2e  ......s.#......3
	defb 0fbh,002h,0d5h,0a3h,0d4h,053h,0d5h,0b3h,0d4h,073h,0f1h	; bb3e  .....S...s.

; ----------------------------------------------------------------------
; DATOS partitura_BB49: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (32 bytes)
;   0xbb49..0xbb69  (32 bytes)
DATA_partitura_BB49:
	defb 014h,028h,001h,00ah,0dbh,002h,0ebh,009h,03bh,0b1h,00fh,0f6h,0f8h,01ch,0ebh,009h	; bb49  .(..............
	defb 04bh,031h,0d5h,087h,0a7h,0dch,0f5h,0d4h,003h,0d5h,073h,0fbh,004h,0dbh,001h,0ebh	; bb59  K1........s.....

; ----------------------------------------------------------------------
; DATOS partitura_BB69: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xbb69..0xbb71  (8 bytes)
DATA_partitura_BB69:
	defb 009h,02bh,0b1h,0d5h,00fh,0ech,0eah,001h	; bb69  .+......

; ----------------------------------------------------------------------
; DATOS partitura_BB71: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xbb71..0xbb73  (2 bytes)
DATA_partitura_BB71:
	defb 001h,0ffh	; bb71

; ----------------------------------------------------------------------
; DATOS partitura_BB73: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (40 bytes)
;   0xbb73..0xbb9b  (40 bytes)
DATA_partitura_BB73:
	defb 0feh,001h,0f8h,016h,0e9h,007h,0d9h,0d6h,001h,001h,0eah,006h,0edh,025h,0ebh,08ah	; bb73  .............%..
	defb 049h,021h,0f5h,0d1h,000h,050h,020h,070h,000h,050h,020h,070h,000h,050h,020h,070h	; bb83  I!...P p.P p.P p
	defb 000h,050h,020h,070h,0fbh,007h,0f5h,0d2h	; bb93  .P p....

; ----------------------------------------------------------------------
; DATOS partitura_BB9B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xbb9b..0xbbac  (17 bytes)
DATA_partitura_BB9B:
	defb 0a0h,0d1h,030h,000h,050h,0fbh,006h,070h,080h,0a0h,0d0h,000h,020h,030h,050h,070h	; bb9b  ..0.P..p.... 0Pp
	defb 0d8h	; bbab

; ----------------------------------------------------------------------
; DATOS partitura_BBAC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (10 bytes)
;   0xbbac..0xbbb6  (10 bytes)
DATA_partitura_BBAC:
	defb 0dch,0feh,001h,0f8h,002h,0e9h,007h,0f0h,007h,052h	; bbac  .........R

; ----------------------------------------------------------------------
; DATOS partitura_BBB6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (13 bytes)
;   0xbbb6..0xbbc3  (13 bytes)
DATA_partitura_BBB6:
	defb 0eah,008h,0ebh,009h,02bh,091h,0dbh,001h,0d6h,004h,002h,0d2h,021h	; bbb6  ....+.......!

; ----------------------------------------------------------------------
; DATOS partitura_BBC3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (49 bytes)
;   0xbbc3..0xbbf4  (49 bytes)
DATA_partitura_BBC3:
	defb 031h,0c1h,0eeh,002h,0e9h,00eh,03eh,0efh,0e9h,007h,0c7h,0eah,007h,0d6h,003h,002h	; bbc3  1.....>.........
	defb 0edh,016h,0ebh,089h,027h,031h,0d2h,0a1h,071h,0c3h,0a1h,071h,0c3h,0a1h,071h,0eah	; bbd3  ....'1..q..q..q.
	defb 008h,0ebh,009h,03bh,041h,0d6h,004h,002h,0d2h,021h,031h,0c1h,0eeh,002h,0e9h,00eh	; bbe3  ....A....!1.....
	defb 03eh	; bbf3

; ----------------------------------------------------------------------
; DATOS partitura_BBF4: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (40 bytes)
;   0xbbf4..0xbc1c  (40 bytes)
DATA_partitura_BBF4:
	defb 0e9h,007h,0c7h,0efh,0eah,007h,0d6h,003h,002h,0edh,016h,0ebh,089h,027h,031h,0d2h	; bbf4  .............'1.
	defb 0a1h,0d1h,001h,0f8h,002h,0eah,008h,0ebh,009h,03bh,041h,0d6h,010h,001h,0d2h,031h	; bc04  ..........A....1
	defb 001h,0c3h,031h,051h,0c3h,0dch,0d8h,0feh	; bc14  ..1Q....

; ----------------------------------------------------------------------
; DATOS partitura_BC1C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (48 bytes)
;   0xbc1c..0xbc4c  (48 bytes)
DATA_partitura_BC1C:
	defb 001h,0f8h,007h,0e9h,007h,0eah,007h,0edh,016h,0ebh,081h,038h,021h,0d9h,0d6h,001h	; bc1c  ...........8!...
	defb 001h,0d3h,050h,070h,080h,0a0h,0d2h,000h,020h,030h,050h,070h,080h,0a0h,0d1h,000h	; bc2c  ..Pp.... 0Pp....
	defb 020h,030h,020h,000h,020h,0d2h,0a0h,070h,080h,0a0h,0d1h,020h,070h,090h,0a0h,090h	; bc3c   0 . ..p... p...

; ----------------------------------------------------------------------
; DATOS partitura_BC4C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (21 bytes)
;   0xbc4c..0xbc61  (21 bytes)
DATA_partitura_BC4C:
	defb 070h,090h,0a0h,070h,020h,0d2h,0a0h,0d1h,000h,0d2h,0a0h,080h,0a0h,0d1h,000h,020h	; bc4c  p..p ..........
	defb 030h,050h,070h,080h,0a0h	; bc5c

; ----------------------------------------------------------------------
; DATOS partitura_BC61: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (52 bytes)
;   0xbc61..0xbc95  (52 bytes)
DATA_partitura_BC61:
	defb 0d0h,000h,020h,030h,020h,000h,020h,0d1h,0a0h,050h,030h,020h,0d2h,0a0h,050h,0a0h	; bc61  .. 0 . ..P0 ..P.
	defb 070h,020h,0a0h,070h,0d1h,020h,0d2h,0a0h,0d1h,070h,0d0h,020h,0f8h,002h,0ebh,009h	; bc71  p .p. ...p. ....
	defb 03bh,021h,0e9h,001h,0d2h,074h,083h,0a4h,0d1h,004h,023h,034h,054h,073h,084h,0a4h	; bc81  .!...t....#4Ts..
	defb 0d0h,003h,024h,0e9h	; bc91

; ----------------------------------------------------------------------
; DATOS partitura_BC95: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (15 bytes)
;   0xbc95..0xbca4  (15 bytes)
DATA_partitura_BC95:
	defb 007h,031h,0c1h,0d6h,005h,002h,0f0h,007h,052h,0dbh,001h,0ebh,009h,02bh,0d1h	; bc95  .1......R....+.

; ----------------------------------------------------------------------
; DATOS partitura_BCA4: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (19 bytes)
;   0xbca4..0xbcb7  (19 bytes)
DATA_partitura_BCA4:
	defb 0d3h,073h,0d2h,037h,057h,0dbh,002h,0ebh,009h,02bh,0c1h,0e9h,015h,07fh,0ech,0eah	; bca4  .s.7W....+......
	defb 001h,071h,0ffh	; bcb4

; ----------------------------------------------------------------------
; DATOS partitura_BCB7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (26 bytes)
;   0xbcb7..0xbcd1  (26 bytes)
DATA_partitura_BCB7:
	defb 0feh,001h,0f8h,002h,0e9h,007h,0eah,00ah,0ebh,009h,02bh,0b1h,0dbh,002h,0d6h,010h	; bcb7  ..........+.....
	defb 001h,0f0h,007h,051h,0d1h,00dh,031h,0afh,091h,0e9h	; bcc7  ...Q..1...

; ----------------------------------------------------------------------
; DATOS partitura_BCD1: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xbcd1..0xbcd4  (3 bytes)
DATA_partitura_BCD1:
	defb 00eh,07fh,0ech	; bcd1

; ----------------------------------------------------------------------
; DATOS partitura_BCD4: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (19 bytes)
;   0xbcd4..0xbce7  (19 bytes)
DATA_partitura_BCD4:
	defb 0eah,001h,0d8h,0f0h,007h,002h,072h,0d6h,010h,002h,0eah,00ah,0ebh,009h,02bh,0b1h	; bcd4  ......r.......+.
	defb 0e9h,007h,0f0h	; bce4

; ----------------------------------------------------------------------
; DATOS partitura_BCE7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (35 bytes)
;   0xbce7..0xbd0a  (35 bytes)
DATA_partitura_BCE7:
	defb 007h,052h,0d1h,00dh,0d2h,031h,0adh,091h,071h,021h,051h,0e9h,00eh,0d1h,00fh,0ech	; bce7  .R...1..q!Q.....
	defb 0eah,001h,0d8h,0f0h,007h,003h,000h,0dch,0d8h,0feh,001h,0f8h,002h,0e9h,007h,0eah	; bcf7  ................
	defb 00ah,0ebh,009h	; bd07

; ----------------------------------------------------------------------
; DATOS partitura_BD0A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (46 bytes)
;   0xbd0a..0xbd38  (46 bytes)
DATA_partitura_BD0A:
	defb 02bh,091h,0dbh,003h,0d6h,004h,002h,0f0h,007h,052h,0d2h,00bh,033h,0afh,090h,0e9h	; bd0a  +........R..3...
	defb 00eh,07eh,0e9h,007h,0ech,0eah,002h,0d8h,0f0h,007h,003h,070h,0eah,00ah,0ebh,009h	; bd1a  .~.........p....
	defb 02bh,091h,0d6h,004h,002h,0f0h,007h,052h,00bh,033h,0ach,0d1h,002h,0d2h	; bd2a  +......R.3....

; ----------------------------------------------------------------------
; DATOS partitura_BD38: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (27 bytes)
;   0xbd38..0xbd53  (27 bytes)
DATA_partitura_BD38:
	defb 090h,070h,050h,0e9h,00eh,07dh,0e9h,007h,0ech,0eah,002h,0d8h,0f0h,007h,003h,070h	; bd38  .pP..}.........p
	defb 0feh,001h,0f8h,002h,0e9h,007h,0eah,00ah,0ebh,009h,02bh	; bd48  ..........+

; ----------------------------------------------------------------------
; DATOS partitura_BD53: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (35 bytes)
;   0xbd53..0xbd76  (35 bytes)
DATA_partitura_BD53:
	defb 091h,0dbh,002h,0d6h,004h,001h,0f0h,007h,051h,0d2h,082h,0d1h,000h,077h,033h,022h	; bd53  ........Q....w3"
	defb 0d2h,070h,0a7h,0d1h,053h,0e9h,002h,039h,0d2h,083h,0d1h,004h,053h,0a4h,0e9h,007h	; bd63  .p..S..9....S...
	defb 0d0h,003h,023h	; bd73

; ----------------------------------------------------------------------
; DATOS partitura_BD76: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (23 bytes)
;   0xbd76..0xbd8d  (23 bytes)
DATA_partitura_BD76:
	defb 0d1h,073h,0e9h,002h,0ech,0eah,002h,074h,0eah,00ah,0ebh,009h,02bh,091h,0d0h,023h	; bd76  .s.....t....+..#
	defb 0d1h,074h,0e9h,007h,0d0h,027h,0d2h	; bd86

; ----------------------------------------------------------------------
; DATOS partitura_BD8D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (12 bytes)
;   0xbd8d..0xbd99  (12 bytes)
DATA_partitura_BD8D:
	defb 002h,030h,0a5h,0d2h,071h,0d1h,001h,0d2h,0a1h,087h,0a7h,0e9h	; bd8d  .0..q.......

; ----------------------------------------------------------------------
; DATOS partitura_BD99: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (9 bytes)
;   0xbd99..0xbda2  (9 bytes)
DATA_partitura_BD99:
	defb 015h,0dbh,002h,0ebh,009h,02bh,0c1h,0d1h,02fh	; bd99  .....+../

; ----------------------------------------------------------------------
; DATOS partitura_BDA2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (5 bytes)
;   0xbda2..0xbda7  (5 bytes)
DATA_partitura_BDA2:
	defb 0ech,0eah,001h,021h,0ffh	; bda2

; ----------------------------------------------------------------------
; DATOS partitura_BDA7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (9 bytes)
;   0xbda7..0xbdb0  (9 bytes)
DATA_partitura_BDA7:
	defb 0feh,001h,0f8h,002h,0e9h,007h,0eeh,081h,0c1h	; bda7  .........

; ----------------------------------------------------------------------
; DATOS partitura_BDB0: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (22 bytes)
;   0xbdb0..0xbdc6  (22 bytes)
DATA_partitura_BDB0:
	defb 0eah,006h,0ebh,009h,01bh,0b1h,0dbh,002h,0d6h,010h,001h,0f0h,007h,051h,0d1h,00dh	; bdb0  .............Q..
	defb 031h,0afh,091h,075h,0efh,0eah	; bdc0

; ----------------------------------------------------------------------
; DATOS partitura_BDC6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xbdc6..0xbdc8  (2 bytes)
DATA_partitura_BDC6:
	defb 008h,0d6h	; bdc6

; ----------------------------------------------------------------------
; DATOS partitura_BDC8: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (37 bytes)
;   0xbdc8..0xbded  (37 bytes)
DATA_partitura_BDC8:
	defb 010h,002h,0f0h,007h,053h,0ebh,009h,03bh,091h,0d2h,001h,071h,031h,0a1h,071h,0d1h	; bdc8  ....S......q1.q.
	defb 021h,0e9h,00eh,029h,0eeh,081h,0eah,006h,0d6h,010h,001h,0e9h,007h,0ebh,009h,01bh	; bdd8  !..)............
	defb 091h,0f0h,007h,052h,0d1h	; bde8

; ----------------------------------------------------------------------
; DATOS partitura_BDED: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xbded..0xbdff  (18 bytes)
DATA_partitura_BDED:
	defb 00dh,0d2h,031h,0adh,091h,071h,021h,057h,0d3h,0efh,0d6h,010h,002h,0f0h,007h,053h	; bded  ..1..q!W.......S
	defb 0eah,00ah	; bdfd

; ----------------------------------------------------------------------
; DATOS partitura_BDFF: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (28 bytes)
;   0xbdff..0xbe1b  (28 bytes)
DATA_partitura_BDFF:
	defb 0ebh,009h,03bh,091h,031h,0d2h,001h,0d3h,081h,0d2h,031h,0e9h,00eh,078h,0dch,0d8h	; bdff  ....1.....1..x..
	defb 0feh,001h,0f8h,002h,0e9h,007h,0eah,009h,0ebh,009h,02bh,091h	; be0f  ..........+.

; ----------------------------------------------------------------------
; DATOS partitura_BE1B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (29 bytes)
;   0xbe1b..0xbe38  (29 bytes)
DATA_partitura_BE1B:
	defb 0dbh,002h,0d6h,004h,002h,0f0h,007h,052h,0d2h,051h,071h,0c1h,077h,0eeh,081h,0eah	; be1b  .......R.Qq.w...
	defb 006h,0ebh,009h,01bh,091h,033h,0afh,090h,0e9h,00eh,07dh,0e9h,007h	; be2b  .....3....}..

; ----------------------------------------------------------------------
; DATOS partitura_BE38: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xbe38..0xbe3e  (6 bytes)
DATA_partitura_BE38:
	defb 0c0h,0efh,0eah,008h,0ebh,009h	; be38

; ----------------------------------------------------------------------
; DATOS partitura_BE3E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xbe3e..0xbe44  (6 bytes)
DATA_partitura_BE3E:
	defb 02bh,091h,0d2h,051h,071h,0c1h	; be3e

; ----------------------------------------------------------------------
; DATOS partitura_BE44: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xbe44..0xbe47  (3 bytes)
DATA_partitura_BE44:
	defb 077h,0eeh,081h	; be44

; ----------------------------------------------------------------------
; DATOS partitura_BE47: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xbe47..0xbe4b  (4 bytes)
DATA_partitura_BE47:
	defb 0eah,006h,0ebh,009h	; be47

; ----------------------------------------------------------------------
; DATOS partitura_BE4B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xbe4b..0xbe4e  (3 bytes)
DATA_partitura_BE4B:
	defb 01bh,091h,033h	; be4b

; ----------------------------------------------------------------------
; DATOS partitura_BE4E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xbe4e..0xbe59  (11 bytes)
DATA_partitura_BE4E:
	defb 0ach,0d1h,002h,0d2h,090h,070h,050h,07eh,0efh,0eah,008h	; be4e  .....pP~...

; ----------------------------------------------------------------------
; DATOS partitura_BE59: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xbe59..0xbe5d  (4 bytes)
DATA_partitura_BE59:
	defb 0ebh,009h,02bh,051h	; be59

; ----------------------------------------------------------------------
; DATOS partitura_BE5D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (13 bytes)
;   0xbe5d..0xbe6a  (13 bytes)
DATA_partitura_BE5D:
	defb 0d3h,0a1h,071h,0c3h,0a1h,0d2h,001h,0feh,001h,0f8h,002h,0e9h,007h	; be5d  ..q..........

; ----------------------------------------------------------------------
; DATOS partitura_BE6A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xbe6a..0xbe83  (25 bytes)
DATA_partitura_BE6A:
	defb 0f0h,007h,051h,0eeh,081h,0c2h,0eah,005h,0ebh,009h,01bh,0d1h,0dbh,002h,0d6h,004h	; be6a  ..Q.............
	defb 001h,0f0h,009h,071h,0d2h,082h,0d1h,000h,077h	; be7a  ...q....w

; ----------------------------------------------------------------------
; DATOS partitura_BE83: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (35 bytes)
;   0xbe83..0xbea6  (35 bytes)
DATA_partitura_BE83:
	defb 033h,022h,0d2h,070h,0a7h,0d1h,053h,0e9h,002h,039h,0d2h,083h,0d1h,004h,053h,0a4h	; be83  3".p..S..9....S.
	defb 0e9h,007h,0d0h,003h,023h,0d1h,073h,0e9h,002h,0ech,0eah,002h,074h,0eah,006h,0ebh	; be93  ....#.s.....t...
	defb 009h,01bh,0d1h	; bea3

; ----------------------------------------------------------------------
; DATOS partitura_BEA6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xbea6..0xbeae  (8 bytes)
DATA_partitura_BEA6:
	defb 0d0h,023h,0d1h,074h,0e9h,007h,0d0h,024h	; bea6  .#.t...$

; ----------------------------------------------------------------------
; DATOS partitura_BEAE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xbeae..0xbec7  (25 bytes)
DATA_partitura_BEAE:
	defb 0efh,0eah,008h,0ebh,009h,037h,031h,0e9h,001h,0d2h,034h,053h,074h,094h,0a3h,0d1h	; beae  .....71...4St...
	defb 004h,024h,033h,054h,074h,083h,0a4h,0e9h,007h	; bebe  .$3Tt....

; ----------------------------------------------------------------------
; DATOS partitura_BEC7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xbec7..0xbece  (7 bytes)
DATA_partitura_BEC7:
	defb 0d0h,001h,0c1h,0eeh,081h,0eah,005h	; bec7

; ----------------------------------------------------------------------
; DATOS partitura_BECE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (12 bytes)
;   0xbece..0xbeda  (12 bytes)
DATA_partitura_BECE:
	defb 0ebh,009h,01bh,0d1h,0d2h,071h,0d1h,001h,0efh,0f0h,007h,062h	; bece  .....q.....b

; ----------------------------------------------------------------------
; DATOS partitura_BEDA: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xbeda..0xbeec  (18 bytes)
DATA_partitura_BEDA:
	defb 0eah,008h,0ebh,009h,02bh,091h,0d2h,007h,027h,0dbh,002h,0ebh,009h,02bh,0c1h,0e9h	; beda  ....+...'....+..
	defb 015h,0d2h	; beea

; ----------------------------------------------------------------------
; DATOS partitura_BEEC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x73 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xbeec..0xbef2  (6 bytes)
DATA_partitura_BEEC:
	defb 03fh,0ech,0eah,001h,031h,0ffh	; beec

; ----------------------------------------------------------------------
; DATOS partitura_BEF2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xbef2..0xbf03  (17 bytes)
DATA_partitura_BEF2:
	defb 0feh,001h,0f5h,0e9h,010h,0f0h,007h,002h,0eah,005h,0dbh,002h,0edh,0f1h,0ebh,087h	; bef2  ................
	defb 013h	; bf02

; ----------------------------------------------------------------------
; DATOS partitura_BF03: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xbf03..0xbf09  (6 bytes)
DATA_partitura_BF03:
	defb 0f1h,0d0h,09fh,0ech,0eah,002h	; bf03

; ----------------------------------------------------------------------
; DATOS partitura_BF09: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xbf09..0xbf0f  (6 bytes)
DATA_partitura_BF09:
	defb 0d8h,09fh,0eah,001h,09fh,09fh	; bf09

; ----------------------------------------------------------------------
; DATOS partitura_BF0F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xbf0f..0xbf12  (3 bytes)
DATA_partitura_BF0F:
	defb 0fdh,0f2h,0beh	; bf0f

; ----------------------------------------------------------------------
; DATOS partitura_BF12: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (28 bytes)
;   0xbf12..0xbf2e  (28 bytes)
DATA_partitura_BF12:
	defb 0feh,001h,0f5h,0e9h,010h,0f0h,007h,001h,0eeh,081h,0eah,003h,0dbh,002h,0edh,0f1h	; bf12  ................
	defb 0ebh,087h,013h,0f1h,0d0h,09fh,0ech,0eah,002h,0d8h,09fh,0eah	; bf22  ............

; ----------------------------------------------------------------------
; DATOS partitura_BF2E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xbf2e..0xbf34  (6 bytes)
DATA_partitura_BF2E:
	defb 001h,09fh,09fh,0fdh,012h,0bfh	; bf2e

; ----------------------------------------------------------------------
; DATOS partitura_BF34: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xbf34..0xbf35  (1 bytes)
DATA_partitura_BF34:
	defb 0feh	; bf34

; ----------------------------------------------------------------------
; DATOS partitura_BF35: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xbf35..0xbf39  (4 bytes)
DATA_partitura_BF35:
	defb 001h,0f1h,089h,00dh	; bf35

; ----------------------------------------------------------------------
; DATOS partitura_BF39: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xbf39..0xbf44  (11 bytes)
DATA_partitura_BF39:
	defb 001h,00ch,0e9h,010h,0f5h,0eah,00fh,0edh,066h,0ebh,087h	; bf39  ........f..

; ----------------------------------------------------------------------
; DATOS partitura_BF44: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xbf44..0xbf4c  (8 bytes)
DATA_partitura_BF44:
	defb 032h,006h,0d5h,09fh,0ech,0eah,006h,09fh	; bf44  2.......

; ----------------------------------------------------------------------
; DATOS partitura_BF4C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (5 bytes)
;   0xbf4c..0xbf51  (5 bytes)
DATA_partitura_BF4C:
	defb 0fbh,002h,0fdh,034h,0bfh	; bf4c

; ----------------------------------------------------------------------
; DATOS partitura_BF51: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (5 bytes)
;   0xbf51..0xbf56  (5 bytes)
DATA_partitura_BF51:
	defb 0feh,001h,0f2h,001h,0e9h	; bf51

; ----------------------------------------------------------------------
; DATOS partitura_BF56: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xbf56..0xbf5a  (4 bytes)
DATA_partitura_BF56:
	defb 010h,0eeh,0a0h,0c0h	; bf56

; ----------------------------------------------------------------------
; DATOS partitura_BF5A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xbf5a..0xbf5e  (4 bytes)
DATA_partitura_BF5A:
	defb 0eah,009h,0edh,054h	; bf5a

; ----------------------------------------------------------------------
; DATOS partitura_BF5E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (27 bytes)
;   0xbf5e..0xbf79  (27 bytes)
DATA_partitura_BF5E:
	defb 0ebh,087h,032h,004h,0d5h,09fh,0ech,0eah,004h,09fh,0eah,009h,0edh,054h,0ebh,087h	; bf5e  ..2..........T..
	defb 032h,004h,0d5h,09fh,0ech,0eah,004h,09eh,0fdh,051h,0bfh	; bf6e  2........Q.

; ----------------------------------------------------------------------
; DATOS partitura_BF79: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (39 bytes)
;   0xbf79..0xbfa0  (39 bytes)
DATA_partitura_BF79:
	defb 0feh,001h,0f8h,023h,0dbh,002h,0e9h,010h,0d9h,0d6h,003h,003h,0f0h,007h,053h,0eah	; bf79  ...#..........S.
	defb 003h,0edh,0f1h,0ebh,087h,012h,0f1h,0d2h,09fh,0ech,0eah,001h,0f0h,007h,003h,0d8h	; bf89  ................
	defb 09fh,09fh,09fh,0dch,0fdh,079h,0bfh	; bf99

; ----------------------------------------------------------------------
; DATOS partitura_BFA0: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x7E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (42 bytes)
;   0xbfa0..0xbfca  (42 bytes)
DATA_partitura_BFA0:
	defb 0feh,001h,0f8h,023h,0e9h,010h,0dbh,002h,0c0h,0eeh,082h,0d9h,0d6h,003h,003h,0f0h	; bfa0  ...#............
	defb 007h,053h,0eah,002h,0edh,0f1h,0ebh,087h,013h,0f1h,0d2h,09fh,0ech,0eah,001h,0f0h	; bfb0  .S..............
	defb 007h,003h,0d8h,09fh,09fh,09eh,0dch,0fdh,0a0h,0bfh	; bfc0  ..........

; ----------------------------------------------------------------------
; DATOS sin identificar  0xbfca..0xc000  (54 bytes)
DATA_BFCA:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; bfca  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,002h,022h,022h,021h,01fh	; bfda  ............""!.
	defb 0ffh,0f1h,000h,0f1h,0f0h,000h,000h,000h,000h,000h,000h,001h,014h,0f1h,010h,000h	; bfea  ................
	defb 000h,000h,000h,000h,000h,000h	; bffa
