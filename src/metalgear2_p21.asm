; ==========================================================================
; METAL GEAR 2 SOLID SNAKE - Konami (1990) - MSX2 - MegaROM RC-767 de 512 KB (Konami SCC) - banco 21 (se ejecuta en 0xa000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x0a000


; ----------------------------------------------------------------------
; DATOS partitura_A000: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xa000..0xa006  (6 bytes)
DATA_partitura_A000:
	defb 0feh,002h,0f5h,0e2h,008h,040h	; a000

; ----------------------------------------------------------------------
; DATOS partitura_A006: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (16 bytes)
;   0xa006..0xa016  (16 bytes)
DATA_partitura_A006:
	defb 040h,020h,040h,040h,040h,020h,040h,0e2h,001h,010h,040h,0fbh,002h,0e0h,020h,0ffh	; a006  @ @@@ @...@... .

; ----------------------------------------------------------------------
; DATOS partitura_A016: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (10 bytes)
;   0xa016..0xa020  (10 bytes)
DATA_partitura_A016:
	defb 0feh,002h,0e0h,002h,0f5h,0e2h,004h,040h,03ah,020h	; a016  .......@:

; ----------------------------------------------------------------------
; DATOS partitura_A020: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xa020..0xa023  (3 bytes)
DATA_partitura_A020:
	defb 03ah,040h,03ah	; a020

; ----------------------------------------------------------------------
; DATOS partitura_A023: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xa023..0xa02e  (11 bytes)
DATA_partitura_A023:
	defb 020h,03ah,0e2h,001h,010h,03ah,0fbh,004h,0e0h,01eh,0ffh	; a023   :...:.....

; ----------------------------------------------------------------------
; DATOS partitura_A02E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa02e..0xa02f  (1 bytes)
DATA_partitura_A02E:
	defb 0feh	; a02e

; ----------------------------------------------------------------------
; DATOS partitura_A02F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xa02f..0xa040  (17 bytes)
DATA_partitura_A02F:
	defb 002h,0e0h,004h,0f5h,0e2h,008h,010h,038h,000h,038h,010h,038h,000h,038h,0e2h,001h	; a02f  .......8.8.8.8..
	defb 000h	; a03f

; ----------------------------------------------------------------------
; DATOS partitura_A040: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xa040..0xa046  (6 bytes)
DATA_partitura_A040:
	defb 038h,0fbh,002h,0e0h,01ch,0ffh	; a040

; ----------------------------------------------------------------------
; DATOS partitura_A046: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xa046..0xa051  (11 bytes)
DATA_partitura_A046:
	defb 0feh,002h,0f8h,009h,0e2h,001h,0f5h,0c2h,0d7h,0c2h,0b7h	; a046  ...........

; ----------------------------------------------------------------------
; DATOS partitura_A051: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (13 bytes)
;   0xa051..0xa05e  (13 bytes)
DATA_partitura_A051:
	defb 0c2h,097h,0c2h,077h,0c2h,057h,0c2h,037h,0c2h,017h,0c1h,0f7h,0c1h	; a051  ...w.W.7.....

; ----------------------------------------------------------------------
; DATOS partitura_A05E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa05e..0xa05f  (1 bytes)
DATA_partitura_A05E:
	defb 0d7h	; a05e

; ----------------------------------------------------------------------
; DATOS partitura_A05F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa05f..0xa060  (1 bytes)
DATA_partitura_A05F:
	defb 0c1h	; a05f

; ----------------------------------------------------------------------
; DATOS partitura_A060: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (9 bytes)
;   0xa060..0xa069  (9 bytes)
DATA_partitura_A060:
	defb 0b7h,0c1h,097h,0c1h,077h,0c1h,057h,0c1h,047h	; a060  ....w.W.G

; ----------------------------------------------------------------------
; DATOS partitura_A069: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xa069..0xa082  (25 bytes)
DATA_partitura_A069:
	defb 0c1h,03fh,0c1h,03bh,0c1h,037h,0c1h,03ah,0c1h,03bh,0c1h,03ah,0c1h,03bh,0fbh,004h	; a069  .?...7.:...:....
	defb 0f5h,0a1h,03bh,0a1h,03ah,0fbh,008h,0f5h,021h	; a079  ....:...!

; ----------------------------------------------------------------------
; DATOS partitura_A082: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (13 bytes)
;   0xa082..0xa08f  (13 bytes)
DATA_partitura_A082:
	defb 03bh,021h,03ah,0fbh,004h,0f5h,001h,03bh,001h,03ah,0fbh,004h,0ffh	; a082  .!:......:...

; ----------------------------------------------------------------------
; DATOS partitura_A08F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xa08f..0xa091  (2 bytes)
DATA_partitura_A08F:
	defb 0feh,002h	; a08f

; ----------------------------------------------------------------------
; DATOS partitura_A091: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (12 bytes)
;   0xa091..0xa09d  (12 bytes)
DATA_partitura_A091:
	defb 0f6h,0f8h,009h,0e0h,002h,0e2h,001h,0f5h,0c2h,0d9h,0c2h,0b9h	; a091  ............

; ----------------------------------------------------------------------
; DATOS partitura_A09D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa09d..0xa0a5  (8 bytes)
DATA_partitura_A09D:
	defb 0c2h,099h,0c2h,079h,0c2h,059h,0c2h,039h	; a09d  ...y.Y.9

; ----------------------------------------------------------------------
; DATOS partitura_A0A5: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (34 bytes)
;   0xa0a5..0xa0c7  (34 bytes)
DATA_partitura_A0A5:
	defb 0c2h,019h,0c1h,0f8h,0c1h,0d9h,0c1h,0b9h,0c1h,099h,0c1h,079h,0c1h,059h,0c1h,049h	; a0a5  ...........y.Y.I
	defb 0c1h,041h,0c1h,03dh,0c1h,039h,0c1h,03ch,0c1h,03dh,0c1h,03ch,0c1h,03dh,0fbh,004h	; a0b5  .A.=.9.<.=.<.=..
	defb 0f5h,0a1h	; a0c5

; ----------------------------------------------------------------------
; DATOS partitura_A0C7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (20 bytes)
;   0xa0c7..0xa0db  (20 bytes)
DATA_partitura_A0C7:
	defb 03dh,0a1h,03ch,0fbh,008h,0f5h,021h,03dh,021h,03ch,0fbh,004h,0f5h,001h,03dh,001h	; a0c7  =.<...!=!<....=.
	defb 03ch,0fbh,003h,0ffh	; a0d7

; ----------------------------------------------------------------------
; DATOS partitura_A0DB: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (14 bytes)
;   0xa0db..0xa0e9  (14 bytes)
DATA_partitura_A0DB:
	defb 0feh,002h,0f8h,005h,0e2h,001h,0f5h,083h,0d7h,083h,097h,083h,057h,083h	; a0db  ............W.

; ----------------------------------------------------------------------
; DATOS partitura_A0E9: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (10 bytes)
;   0xa0e9..0xa0f3  (10 bytes)
DATA_partitura_A0E9:
	defb 017h,082h,0d7h,082h,097h,082h,067h,082h,037h,082h	; a0e9  ......g.7.

; ----------------------------------------------------------------------
; DATOS partitura_A0F3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (26 bytes)
;   0xa0f3..0xa10d  (26 bytes)
DATA_partitura_A0F3:
	defb 017h,081h,0e7h,081h,0c7h,081h,0a7h,081h,097h,081h,087h,081h,07fh,081h,06bh,081h	; a0f3  ..............k.
	defb 057h,081h,04ah,081h,03bh,081h,02ah,081h,020h,0fbh	; a103  W.J...*. .

; ----------------------------------------------------------------------
; DATOS partitura_A10D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (16 bytes)
;   0xa10d..0xa11d  (16 bytes)
DATA_partitura_A10D:
	defb 004h,0f5h,021h,01dh,021h,01ah,0fbh,008h,0f5h,001h,01dh,001h,01ah,0fbh,008h,0ffh	; a10d  ..!.!...........

; ----------------------------------------------------------------------
; DATOS partitura_A11D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (23 bytes)
;   0xa11d..0xa134  (23 bytes)
DATA_partitura_A11D:
	defb 0feh,002h,0f8h,009h,0e0h,003h,0e2h,001h,0f5h,0c2h,0d7h,0c2h,0b7h,0c2h,097h,0c2h	; a11d  ................
	defb 077h,0c2h,057h,0c2h,037h,0c2h,017h	; a12d

; ----------------------------------------------------------------------
; DATOS partitura_A134: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xa134..0xa136  (2 bytes)
DATA_partitura_A134:
	defb 0c1h,0f7h	; a134

; ----------------------------------------------------------------------
; DATOS partitura_A136: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (5 bytes)
;   0xa136..0xa13b  (5 bytes)
DATA_partitura_A136:
	defb 0c1h,0d7h,0c1h,0b7h,0c1h	; a136

; ----------------------------------------------------------------------
; DATOS partitura_A13B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (47 bytes)
;   0xa13b..0xa16a  (47 bytes)
DATA_partitura_A13B:
	defb 097h,0c1h,077h,0c1h,057h,0c1h,047h,0c1h,03fh,0c1h,03bh,0c1h,037h,0c1h,03ah,0c1h	; a13b  ..w.W.G.?...7.:.
	defb 03bh,0c1h,03ah,0c1h,03bh,0fbh,004h,0f5h,0a1h,03bh,0a1h,03ah,0fbh,008h,0f5h,021h	; a14b  ..:........:...!
	defb 03bh,021h,03ah,0fbh,004h,0f5h,001h,03bh,001h,03ah,0fbh,002h,001h,03bh,0ffh	; a15b  .!:......:.....

; ----------------------------------------------------------------------
; DATOS partitura_A16A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xa16a..0xa170  (6 bytes)
DATA_partitura_A16A:
	defb 0feh,002h,0f8h,009h,0e0h,005h	; a16a

; ----------------------------------------------------------------------
; DATOS partitura_A170: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (47 bytes)
;   0xa170..0xa19f  (47 bytes)
DATA_partitura_A170:
	defb 0e2h,001h,0f5h,0c2h,0d5h,0c2h,0b5h,0c2h,095h,0c2h,075h,0c2h,055h,0c2h,035h,0c2h	; a170  ..........u.U.5.
	defb 015h,0c1h,0f5h,0c1h,0d5h,0c1h,0b5h,0c1h,095h,0c1h,075h,0c1h,055h,0c1h,045h,0c1h	; a180  ..........u.U.E.
	defb 03dh,0c1h,039h,0c1h,035h,0c1h,038h,0c1h,039h,0c1h,038h,0c1h,039h,0fbh,004h	; a190  =.9.5.8.9.8.9..

; ----------------------------------------------------------------------
; DATOS partitura_A19F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (19 bytes)
;   0xa19f..0xa1b2  (19 bytes)
DATA_partitura_A19F:
	defb 0f5h,0a1h,039h,0a1h,038h,0fbh,008h,0f5h,021h,039h,021h,038h,0fbh,004h,001h,039h	; a19f  ..9.8...!9!8...9
	defb 001h,038h,0ffh	; a1af

; ----------------------------------------------------------------------
; DATOS partitura_A1B2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x8F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa1b2..0xa1b3  (1 bytes)
DATA_partitura_A1B2:
	defb 0ffh	; a1b2

; ----------------------------------------------------------------------
; DATOS partitura_A1B3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x90 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xa1b3..0xa1b6  (3 bytes)
DATA_partitura_A1B3:
	defb 0feh,001h,0e9h	; a1b3

; ----------------------------------------------------------------------
; DATOS partitura_A1B6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x90 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (13 bytes)
;   0xa1b6..0xa1c3  (13 bytes)
DATA_partitura_A1B6:
	defb 00fh,0f0h,002h,036h,0ebh,047h,01ah,0f1h,0eah,00eh,0d5h,00fh,0ffh	; a1b6  ...6.G.......

; ----------------------------------------------------------------------
; DATOS partitura_A1C3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x90 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xa1c3..0xa1c6  (3 bytes)
DATA_partitura_A1C3:
	defb 0feh,001h,0e9h	; a1c3

; ----------------------------------------------------------------------
; DATOS partitura_A1C6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x90 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (13 bytes)
;   0xa1c6..0xa1d3  (13 bytes)
DATA_partitura_A1C6:
	defb 00fh,0f0h,007h,036h,0ebh,047h,01ah,0f1h,0eah,00eh,0d5h,07fh,0ffh	; a1c6  ...6.G.......

; ----------------------------------------------------------------------
; DATOS partitura_A1D3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x90 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (16 bytes)
;   0xa1d3..0xa1e3  (16 bytes)
DATA_partitura_A1D3:
	defb 0feh,001h,0e9h,00fh,0f0h,007h,036h,0ebh,047h,01ah,0f1h,0eah,00eh,0d5h,0afh,0ffh	; a1d3  ......6.G.......

; ----------------------------------------------------------------------
; DATOS partitura_A1E3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x90 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xa1e3..0xa1f5  (18 bytes)
DATA_partitura_A1E3:
	defb 0feh,001h,0f8h,028h,0e9h,00fh,0f0h,007h,074h,0ebh,057h,01ah,0f1h,0eah,00fh,0d5h	; a1e3  ...(....t.W.....
	defb 00fh,0ffh	; a1f3

; ----------------------------------------------------------------------
; DATOS partitura_A1F5: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x90 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (13 bytes)
;   0xa1f5..0xa202  (13 bytes)
DATA_partitura_A1F5:
	defb 0feh,001h,0f1h,0a8h,023h,001h,007h,0f3h,001h,0e9h,00fh,0f0h,007h	; a1f5  ....#........

; ----------------------------------------------------------------------
; DATOS partitura_A202: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x90 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (10 bytes)
;   0xa202..0xa20c  (10 bytes)
DATA_partitura_A202:
	defb 037h,0ebh,057h,01ah,0f1h,0eah,00fh,0d4h,00fh,0ffh	; a202  7.W.......

; ----------------------------------------------------------------------
; DATOS partitura_A20C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x90 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xa20c..0xa20f  (3 bytes)
DATA_partitura_A20C:
	defb 0feh,001h,0f2h	; a20c

; ----------------------------------------------------------------------
; DATOS partitura_A20F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x90 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xa20f..0xa220  (17 bytes)
DATA_partitura_A20F:
	defb 001h,0f3h,001h,0e9h,00fh,0eeh,08fh,0f0h,007h,036h,0ebh,027h,01ah,0f1h,0eah,00ch	; a20f  .........6.'....
	defb 0d4h	; a21f

; ----------------------------------------------------------------------
; DATOS partitura_A220: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x90 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xa220..0xa222  (2 bytes)
DATA_partitura_A220:
	defb 00fh,0ffh	; a220

; ----------------------------------------------------------------------
; DATOS partitura_A222: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x90 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xa222..0xa234  (18 bytes)
DATA_partitura_A222:
	defb 0feh,001h,0f8h,014h,0e9h,00fh,0f0h,007h,074h,0ebh,057h,01ah,0f1h,0eah,00fh,0d5h	; a222  ........t.W.....
	defb 00fh,0ffh	; a232

; ----------------------------------------------------------------------
; DATOS partitura_A234: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x90 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xa234..0xa246  (18 bytes)
DATA_partitura_A234:
	defb 0feh,001h,0f8h,014h,0e9h,00fh,0f0h,007h,074h,0ebh,057h,01ah,0f1h,0eah,00fh,0d4h	; a234  ........t.W.....
	defb 00fh,0ffh	; a244

; ----------------------------------------------------------------------
; DATOS partitura_A246: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x91 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (21 bytes)
;   0xa246..0xa25b  (21 bytes)
DATA_partitura_A246:
	defb 0feh,002h,0e3h,002h,0f5h,0e4h,00eh,080h,020h,0e4h,010h,060h,023h,0fbh,010h,0f5h	; a246  ........ ..`#...
	defb 0e4h,00eh,080h,01fh,0e4h	; a256

; ----------------------------------------------------------------------
; DATOS partitura_A25B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x91 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa25b..0xa25c  (1 bytes)
DATA_partitura_A25B:
	defb 010h	; a25b

; ----------------------------------------------------------------------
; DATOS partitura_A25C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x91 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (27 bytes)
;   0xa25c..0xa277  (27 bytes)
DATA_partitura_A25C:
	defb 060h,022h,0fbh,004h,0f5h,0e4h,00eh,080h,01eh,0e4h,010h,060h,021h,0fbh,004h,0f5h	; a25c  `".........`!...
	defb 0e4h,00eh,080h,01dh,0e4h,010h,060h,020h,0fbh,004h,0f5h	; a26c  ......` ...

; ----------------------------------------------------------------------
; DATOS partitura_A277: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x91 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (26 bytes)
;   0xa277..0xa291  (26 bytes)
DATA_partitura_A277:
	defb 0e4h,00eh,080h,01ch,0e4h,010h,060h,01fh,0fbh,004h,0f5h,0e4h,00eh,080h,01bh,0e4h	; a277  ......`.........
	defb 010h,060h,01eh,0fbh,004h,0f5h,0e4h,00eh,080h,01ah	; a287  .`........

; ----------------------------------------------------------------------
; DATOS partitura_A291: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x91 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xa291..0xa2a2  (17 bytes)
DATA_partitura_A291:
	defb 0e4h,010h,060h,01dh,0fbh,002h,0f5h,0e4h,00eh,080h,019h,0e4h,010h,060h,01ch,0fbh	; a291  ..`..........`..
	defb 0ffh	; a2a1

; ----------------------------------------------------------------------
; DATOS partitura_A2A2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x91 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xa2a2..0xa2bb  (25 bytes)
DATA_partitura_A2A2:
	defb 0feh,002h,0e2h,020h,010h,024h,0e2h,010h,020h,023h,020h,022h,020h,021h,020h,020h	; a2a2  ... .$.. # " !
	defb 020h,01fh,020h,01eh,0f5h,020h,01dh,0fbh,0ffh	; a2b2   . .. ...

; ----------------------------------------------------------------------
; DATOS partitura_A2BB: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x91 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa2bb..0xa2bc  (1 bytes)
DATA_partitura_A2BB:
	defb 0feh	; a2bb

; ----------------------------------------------------------------------
; DATOS partitura_A2BC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x91 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa2bc..0xa2c4  (8 bytes)
DATA_partitura_A2BC:
	defb 002h,0e2h,004h,0f5h,020h,014h,0fbh,0ffh	; a2bc  .... ...

; ----------------------------------------------------------------------
; DATOS partitura_A2C4: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x91 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (5 bytes)
;   0xa2c4..0xa2c9  (5 bytes)
DATA_partitura_A2C4:
	defb 0feh,002h,0f8h,04bh,0e2h	; a2c4

; ----------------------------------------------------------------------
; DATOS partitura_A2C9: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x91 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa2c9..0xa2d1  (8 bytes)
DATA_partitura_A2C9:
	defb 002h,0f5h,084h,020h,073h,023h,0fbh,0ffh	; a2c9  ... s#..

; ----------------------------------------------------------------------
; DATOS partitura_A2D1: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x91 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xa2d1..0xa2dc  (11 bytes)
DATA_partitura_A2D1:
	defb 0feh,002h,0f8h,009h,0e2h,004h,0f5h,035h,020h,0fbh,0ffh	; a2d1  .......5 ..

; ----------------------------------------------------------------------
; DATOS partitura_A2DC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x91 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xa2dc..0xa2e7  (11 bytes)
DATA_partitura_A2DC:
	defb 0feh,002h,0f8h,009h,0e2h,004h,0f5h,037h,020h,0fbh,0ffh	; a2dc  .......7 ..

; ----------------------------------------------------------------------
; DATOS partitura_A2E7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x91 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xa2e7..0xa2ed  (6 bytes)
DATA_partitura_A2E7:
	defb 0feh,002h,0f8h,009h,0e2h,004h	; a2e7

; ----------------------------------------------------------------------
; DATOS partitura_A2ED: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x91 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (5 bytes)
;   0xa2ed..0xa2f2  (5 bytes)
DATA_partitura_A2ED:
	defb 0f5h,025h,010h,0fbh,0ffh	; a2ed

; ----------------------------------------------------------------------
; DATOS partitura_A2F2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x91 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xa2f2..0xa2f5  (3 bytes)
DATA_partitura_A2F2:
	defb 0feh,002h,0f8h	; a2f2

; ----------------------------------------------------------------------
; DATOS partitura_A2F5: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x91 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xa2f5..0xa2f8  (3 bytes)
DATA_partitura_A2F5:
	defb 009h,0e2h,004h	; a2f5

; ----------------------------------------------------------------------
; DATOS partitura_A2F8: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x91 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (5 bytes)
;   0xa2f8..0xa2fd  (5 bytes)
DATA_partitura_A2F8:
	defb 0f5h,027h,010h,0fbh,0ffh	; a2f8

; ----------------------------------------------------------------------
; DATOS partitura_A2FD: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x91, 0x92 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa2fd..0xa305  (8 bytes)
DATA_partitura_A2FD:
	defb 0f9h,02eh,0a3h,0fch,002h,0fdh,0a2h,0ffh	; a2fd  ........

; ----------------------------------------------------------------------
; DATOS partitura_A305: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x92 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa305..0xa306  (1 bytes)
DATA_partitura_A305:
	defb 0ffh	; a305

; ----------------------------------------------------------------------
; DATOS partitura_A306: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x92 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa306..0xa30e  (8 bytes)
DATA_partitura_A306:
	defb 0f9h,095h,0a3h,0fch,002h,006h,0a3h,0ffh	; a306  ........

; ----------------------------------------------------------------------
; DATOS partitura_A30E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x92 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa30e..0xa316  (8 bytes)
DATA_partitura_A30E:
	defb 0f9h,0bfh,0a3h,0fch,002h,00eh,0a3h,0ffh	; a30e  ........

; ----------------------------------------------------------------------
; DATOS partitura_A316: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x92 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa316..0xa317  (1 bytes)
DATA_partitura_A316:
	defb 0f9h	; a316

; ----------------------------------------------------------------------
; DATOS partitura_A317: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x92 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xa317..0xa31d  (6 bytes)
DATA_partitura_A317:
	defb 0ech,0a3h,0fch,002h,016h,0a3h	; a317

; ----------------------------------------------------------------------
; DATOS partitura_A31D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x92 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa31d..0xa31e  (1 bytes)
DATA_partitura_A31D:
	defb 0ffh	; a31d

; ----------------------------------------------------------------------
; DATOS partitura_A31E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x92 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa31e..0xa326  (8 bytes)
DATA_partitura_A31E:
	defb 0f9h,044h,0a4h,0fch,002h,01eh,0a3h,0ffh	; a31e  .D......

; ----------------------------------------------------------------------
; DATOS partitura_A326: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x91, 0x92, 0x96, 0x97 (lo mide tools/partituras.py
;   ejecutandolo); lo leen p16:4392 (25 bytes)
;   0xa326..0xa33f  (25 bytes)
DATA_partitura_A326:
	defb 0f9h,09ch,0a4h,0fch,002h,026h,0a3h,0ffh,0feh,002h,0f5h,0e3h,001h,0e4h,004h,0a0h	; a326  .....&..........
	defb 030h,0e1h,001h,0e4h,01fh,008h,0e2h,001h,073h	; a336  0.......s

; ----------------------------------------------------------------------
; DATOS partitura_A33F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x91, 0x92, 0x96, 0x97 (lo mide tools/partituras.py
;   ejecutandolo); lo leen p16:4392 (94 bytes)
;   0xa33f..0xa39d  (94 bytes)
DATA_partitura_A33F:
	defb 000h,074h,000h,075h,000h,0e3h,001h,0e4h,000h,090h,009h,090h,00dh,0e3h,001h,0e4h	; a33f  .t.u............
	defb 01fh,068h,000h,0e4h,004h,030h,030h,0e1h,001h,0e4h,01fh,003h,0e2h,001h,033h,000h	; a34f  .h...00.......3.
	defb 034h,000h,035h,000h,0e3h,001h,0e4h,000h,040h,009h,040h,00dh,0e3h,001h,0e4h,01fh	; a35f  4.5.....@.@.....
	defb 038h,000h,0e4h,004h,010h,030h,0e1h,001h,0e4h,01fh,001h,0e2h,001h,013h,000h,014h	; a36f  8....0..........
	defb 000h,015h,000h,0e3h,001h,0e4h,000h,010h,009h,010h,00dh,0e3h,001h,0e4h,01fh,018h	; a37f  ................
	defb 000h,0e0h,004h,0e0h,00ch,0fah,0feh,001h,0f8h,015h,0f5h,0e9h,001h,0eah	; a38f  ..............

; ----------------------------------------------------------------------
; DATOS partitura_A39D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x92, 0x96, 0x97 (lo mide tools/partituras.py ejecutandolo);
;   lo leen p16:4392 (11 bytes)
;   0xa39d..0xa3a8  (11 bytes)
DATA_partitura_A39D:
	defb 002h,0d2h,080h,0a0h,0d1h,000h,020h,040h,060h,080h,0a0h	; a39d  ...... @`..

; ----------------------------------------------------------------------
; DATOS partitura_A3A8: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x92, 0x96, 0x97 (lo mide tools/partituras.py ejecutandolo);
;   lo leen p16:4392 (24 bytes)
;   0xa3a8..0xa3c0  (24 bytes)
DATA_partitura_A3A8:
	defb 0d0h,000h,020h,030h,040h,050h,060h,070h,080h,090h,0a0h,0b1h,0eah,001h,050h,060h	; a3a8  .. 0@P`p......P`
	defb 070h,080h,090h,0a0h,0b1h,0cbh,0fah,0feh	; a3b8  p.......

; ----------------------------------------------------------------------
; DATOS partitura_A3C0: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x92, 0x96, 0x97 (lo mide tools/partituras.py ejecutandolo);
;   lo leen p16:4392 (24 bytes)
;   0xa3c0..0xa3d8  (24 bytes)
DATA_partitura_A3C0:
	defb 001h,0f6h,0f8h,015h,0eeh,081h,0f5h,0e9h,001h,0c1h,0eah,001h,0d2h,080h,0a0h,0d1h	; a3c0  ................
	defb 000h,020h,040h,060h,080h,0a0h,0d0h,000h	; a3d0  . @`....

; ----------------------------------------------------------------------
; DATOS partitura_A3D8: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x92, 0x96, 0x97 (lo mide tools/partituras.py ejecutandolo);
;   lo leen p16:4392 (10 bytes)
;   0xa3d8..0xa3e2  (10 bytes)
DATA_partitura_A3D8:
	defb 020h,030h,040h,050h,060h,070h,080h,090h,0a0h,0b1h	; a3d8   0@P`p....

; ----------------------------------------------------------------------
; DATOS partitura_A3E2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x92, 0x96, 0x97 (lo mide tools/partituras.py ejecutandolo);
;   lo leen p16:4392 (6 bytes)
;   0xa3e2..0xa3e8  (6 bytes)
DATA_partitura_A3E2:
	defb 0eah,001h,050h,060h,070h,080h	; a3e2

; ----------------------------------------------------------------------
; DATOS partitura_A3E8: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x92, 0x96, 0x97 (lo mide tools/partituras.py ejecutandolo);
;   lo leen p16:4392 (168 bytes)
;   0xa3e8..0xa490  (168 bytes)
DATA_partitura_A3E8:
	defb 090h,0a0h,0cbh,0fah,0feh,002h,0f8h,043h,0e2h,001h,0f5h,0c1h,020h,0c1h,060h,0c3h	; a3e8  .......C.... .`.
	defb 080h,0c2h,000h,0c4h,000h,0c6h,000h,0c8h,000h,0c9h,000h,0c3h,000h,0c4h,000h,0c5h	; a3f8  ................
	defb 000h,0c6h,000h,0c7h,000h,0c8h,000h,041h,060h,043h,080h,042h,000h,044h,000h,046h	; a408  .......A`C.B.D.F
	defb 000h,048h,000h,049h,000h,043h,000h,044h,000h,045h,000h,046h,000h,047h,000h,048h	; a418  .H.I.C.D.E.F.G.H
	defb 000h,001h,060h,003h,080h,002h,000h,004h,000h,006h,000h,008h,000h,009h,000h,003h	; a428  ..`.............
	defb 000h,004h,000h,005h,000h,006h,000h,007h,000h,008h,000h,0fah,0feh,002h,0f8h,014h	; a438  ................
	defb 0e2h,001h,0f5h,0c1h,0a0h,0c2h,000h,0a2h,080h,0a3h,000h,0a9h,000h,0a5h,000h,0a9h	; a448  ................
	defb 000h,0a4h,000h,0a5h,000h,0a6h,000h,0a7h,000h,0a8h,000h,0a9h,000h,0aah,000h,042h	; a458  ...............B
	defb 000h,042h,080h,043h,000h,049h,000h,045h,000h,049h,000h,044h,000h,045h,000h,046h	; a468  .B.C.I.E.I.D.E.F
	defb 000h,047h,000h,048h,000h,049h,000h,04ah,000h,002h,000h,002h,080h,003h,000h,009h	; a478  .G.H.I.J........
	defb 000h,005h,000h,009h,000h,004h,000h,005h	; a488  ........

; ----------------------------------------------------------------------
; DATOS partitura_A490: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x92, 0x96, 0x97 (lo mide tools/partituras.py ejecutandolo);
;   lo leen p16:4392 (37 bytes)
;   0xa490..0xa4b5  (37 bytes)
DATA_partitura_A490:
	defb 000h,006h,000h,007h,000h,008h,000h,009h,000h,00ah,000h,0fah,0feh,002h,0f8h,014h	; a490  ................
	defb 0e2h,001h,0c4h,030h,0c4h,000h,0c1h,0a0h,0c2h,000h,082h,080h,083h,000h,089h,000h	; a4a0  ...0............
	defb 085h,000h,089h,000h,084h	; a4b0

; ----------------------------------------------------------------------
; DATOS partitura_A4B5: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x92, 0x96, 0x97 (lo mide tools/partituras.py ejecutandolo);
;   lo leen p16:4392 (17 bytes)
;   0xa4b5..0xa4c6  (17 bytes)
DATA_partitura_A4B5:
	defb 000h,085h,000h,086h,000h,087h,000h,088h,000h,089h,000h,08ah,000h,042h,000h,042h	; a4b5  .............B.B
	defb 080h	; a4c5

; ----------------------------------------------------------------------
; DATOS partitura_A4C6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x92, 0x96, 0x97 (lo mide tools/partituras.py ejecutandolo);
;   lo leen p16:4392 (22 bytes)
;   0xa4c6..0xa4dc  (22 bytes)
DATA_partitura_A4C6:
	defb 043h,000h,049h,000h,045h,000h,049h,000h,044h,000h,045h,000h,046h,000h,047h,000h	; a4c6  C.I.E.I.D.E.F.G.
	defb 048h,000h,049h,000h,04ah,000h	; a4d6

; ----------------------------------------------------------------------
; DATOS partitura_A4DC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x92, 0x96, 0x97 (lo mide tools/partituras.py ejecutandolo);
;   lo leen p16:4392 (11 bytes)
;   0xa4dc..0xa4e7  (11 bytes)
DATA_partitura_A4DC:
	defb 002h,000h,002h,080h,003h,000h,009h,000h,005h,000h,009h	; a4dc  ...........

; ----------------------------------------------------------------------
; DATOS partitura_A4E7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x92, 0x96, 0x97 (lo mide tools/partituras.py ejecutandolo);
;   lo leen p16:4392 (9 bytes)
;   0xa4e7..0xa4f0  (9 bytes)
DATA_partitura_A4E7:
	defb 000h,004h,000h,005h,000h,006h,000h,007h,000h	; a4e7  .........

; ----------------------------------------------------------------------
; DATOS partitura_A4F0: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x92, 0x96, 0x97 (lo mide tools/partituras.py ejecutandolo);
;   lo leen p16:4392 (1 bytes)
;   0xa4f0..0xa4f1  (1 bytes)
DATA_partitura_A4F0:
	defb 008h	; a4f0

; ----------------------------------------------------------------------
; DATOS partitura_A4F1: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x92, 0x96, 0x97 (lo mide tools/partituras.py ejecutandolo);
;   lo leen p16:4392 (2 bytes)
;   0xa4f1..0xa4f3  (2 bytes)
DATA_partitura_A4F1:
	defb 000h,0fah	; a4f1

; ----------------------------------------------------------------------
; DATOS partitura_A4F3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x96 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa4f3..0xa4fb  (8 bytes)
DATA_partitura_A4F3:
	defb 0f9h,02eh,0a3h,0fch,004h,0f3h,0a4h,0ffh	; a4f3  ........

; ----------------------------------------------------------------------
; DATOS partitura_A4FB: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x96 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa4fb..0xa4fc  (1 bytes)
DATA_partitura_A4FB:
	defb 0ffh	; a4fb

; ----------------------------------------------------------------------
; DATOS partitura_A4FC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x96 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa4fc..0xa4fd  (1 bytes)
DATA_partitura_A4FC:
	defb 0ffh	; a4fc

; ----------------------------------------------------------------------
; DATOS partitura_A4FD: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x96 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xa4fd..0xa504  (7 bytes)
DATA_partitura_A4FD:
	defb 0f9h,095h,0a3h,0fch,004h,0fdh,0a4h	; a4fd

; ----------------------------------------------------------------------
; DATOS partitura_A504: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x96 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa504..0xa505  (1 bytes)
DATA_partitura_A504:
	defb 0ffh	; a504

; ----------------------------------------------------------------------
; DATOS partitura_A505: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x96 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa505..0xa50d  (8 bytes)
DATA_partitura_A505:
	defb 0f9h,0bfh,0a3h,0fch,004h,005h,0a5h,0ffh	; a505  ........

; ----------------------------------------------------------------------
; DATOS partitura_A50D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x96 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa50d..0xa515  (8 bytes)
DATA_partitura_A50D:
	defb 0f9h,0ech,0a3h,0fch,004h,00dh,0a5h,0ffh	; a50d  ........

; ----------------------------------------------------------------------
; DATOS partitura_A515: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x96 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa515..0xa51d  (8 bytes)
DATA_partitura_A515:
	defb 0f9h,044h,0a4h,0fch,004h,015h,0a5h,0ffh	; a515  .D......

; ----------------------------------------------------------------------
; DATOS partitura_A51D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x96 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa51d..0xa525  (8 bytes)
DATA_partitura_A51D:
	defb 0f9h,09ch,0a4h,0fch,004h,01dh,0a5h,0ffh	; a51d  ........

; ----------------------------------------------------------------------
; DATOS partitura_A525: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x97 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xa525..0xa52b  (6 bytes)
DATA_partitura_A525:
	defb 0feh,002h,0e0h,008h,0f9h,02eh	; a525

; ----------------------------------------------------------------------
; DATOS partitura_A52B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x97 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xa52b..0xa52d  (2 bytes)
DATA_partitura_A52B:
	defb 0a3h,0ffh	; a52b

; ----------------------------------------------------------------------
; DATOS partitura_A52D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x97 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa52d..0xa52e  (1 bytes)
DATA_partitura_A52D:
	defb 0ffh	; a52d

; ----------------------------------------------------------------------
; DATOS partitura_A52E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x97 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa52e..0xa52f  (1 bytes)
DATA_partitura_A52E:
	defb 0ffh	; a52e

; ----------------------------------------------------------------------
; DATOS partitura_A52F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x97 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa52f..0xa537  (8 bytes)
DATA_partitura_A52F:
	defb 0feh,002h,0e0h,008h,0f9h,095h,0a3h,0ffh	; a52f  ........

; ----------------------------------------------------------------------
; DATOS partitura_A537: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x97 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa537..0xa53f  (8 bytes)
DATA_partitura_A537:
	defb 0feh,002h,0e0h,008h,0f9h,0bfh,0a3h,0ffh	; a537  ........

; ----------------------------------------------------------------------
; DATOS partitura_A53F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x97 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa53f..0xa547  (8 bytes)
DATA_partitura_A53F:
	defb 0feh,002h,0e0h,008h,0f9h,0ech,0a3h,0ffh	; a53f  ........

; ----------------------------------------------------------------------
; DATOS partitura_A547: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x97 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa547..0xa54f  (8 bytes)
DATA_partitura_A547:
	defb 0feh,002h,0e0h,008h,0f9h,044h,0a4h,0ffh	; a547  .....D..

; ----------------------------------------------------------------------
; DATOS partitura_A54F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x97 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa54f..0xa557  (8 bytes)
DATA_partitura_A54F:
	defb 0feh,002h,0e0h,008h,0f9h,09ch,0a4h,0ffh	; a54f  ........

; ----------------------------------------------------------------------
; DATOS partitura_A557: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x99 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xa557..0xa55a  (3 bytes)
DATA_partitura_A557:
	defb 0f9h,0a4h,0a6h	; a557

; ----------------------------------------------------------------------
; DATOS partituras_A55A: 1 partitura entera (de la primera nota a su 0xFF o
;   salto) que no lee ninguno de los sonidos 0x01-0xEF tocados con
;   tools/partituras.py
;   0xa55a..0xa56c  (18 bytes)
DATA_partituras_A55A:
	defb 0f9h,0c7h,0a6h,0f9h,003h,0a7h,0f9h,018h,0a7h,0f9h,03bh,0a7h,0f9h,0c7h,0a6h,0fdh	; a55a  ................
	defb 066h,0a5h	; a56a

; ----------------------------------------------------------------------
; DATOS partitura_A56C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x99 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xa56c..0xa573  (7 bytes)
DATA_partitura_A56C:
	defb 0f9h,05dh,0a7h,0f9h,066h,0a7h,0f9h	; a56c

; ----------------------------------------------------------------------
; DATOS partitura_A573: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x99 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xa573..0xa57a  (7 bytes)
DATA_partitura_A573:
	defb 07fh,0a7h,0f9h,05dh,0a7h,0f9h,066h	; a573

; ----------------------------------------------------------------------
; DATOS partitura_A57A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x99 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xa57a..0xa57b  (1 bytes)
DATA_partitura_A57A:
	defb 0a7h	; a57a

; ----------------------------------------------------------------------
; DATOS partituras_A57B: 1 partitura entera (de la primera nota a su 0xFF o
;   salto) que no lee ninguno de los sonidos 0x01-0xEF tocados con
;   tools/partituras.py
;   0xa57b..0xa593  (24 bytes)
DATA_partituras_A57B:
	defb 0f9h,07fh,0a7h,0f9h,09bh,0a7h,0f9h,0bah,0a7h,0f9h,0d7h,0a7h,0f9h,0f6h,0a7h,0f9h	; a57b  ................
	defb 0f6h,0a7h,0f9h,07fh,0a7h,0fdh,08dh,0a5h	; a58b  ........

; ----------------------------------------------------------------------
; DATOS partitura_A593: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x99 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xa593..0xa59b  (8 bytes)
DATA_partitura_A593:
	defb 0f9h,014h,0a8h,0f9h,01dh,0a8h,0f9h,01dh	; a593  ........

; ----------------------------------------------------------------------
; DATOS partitura_A59B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x99 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (10 bytes)
;   0xa59b..0xa5a5  (10 bytes)
DATA_partitura_A59B:
	defb 0a8h,0f9h,01dh,0a8h,0f9h,014h,0a8h,0f9h,01dh,0a8h	; a59b  ..........

; ----------------------------------------------------------------------
; DATOS partituras_A5A5: 1 partitura entera (de la primera nota a su 0xFF o
;   salto) que no lee ninguno de los sonidos 0x01-0xEF tocados con
;   tools/partituras.py
;   0xa5a5..0xa5bd  (24 bytes)
DATA_partituras_A5A5:
	defb 0f9h,036h,0a8h,0f9h,063h,0a8h,0f9h,082h,0a8h,0f9h,09fh,0a8h,0f9h,0beh,0a8h,0f9h	; a5a5  .6..c...........
	defb 0beh,0a8h,0f9h,036h,0a8h,0fdh,0b7h,0a5h	; a5b5  ...6....

; ----------------------------------------------------------------------
; DATOS partitura_A5BD: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x99 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xa5bd..0xa5c3  (6 bytes)
DATA_partitura_A5BD:
	defb 0f9h,015h,0a9h,0f9h,020h,0a9h	; a5bd

; ----------------------------------------------------------------------
; DATOS partitura_A5C3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x99 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (12 bytes)
;   0xa5c3..0xa5cf  (12 bytes)
DATA_partitura_A5C3:
	defb 0f9h,020h,0a9h,0f9h,020h,0a9h,0f9h,015h,0a9h,0f9h,020h,0a9h	; a5c3  . .. ..... .

; ----------------------------------------------------------------------
; DATOS partituras_A5CF: 1 partitura entera (de la primera nota a su 0xFF o
;   salto) que no lee ninguno de los sonidos 0x01-0xEF tocados con
;   tools/partituras.py
;   0xa5cf..0xa5e7  (24 bytes)
DATA_partituras_A5CF:
	defb 0f9h,03bh,0a9h,0f9h,06ah,0a9h,0f9h,09eh,0a9h,0f9h,0ceh,0a9h,0f9h,002h,0aah,0f9h	; a5cf  ....j...........
	defb 002h,0aah,0f9h,03bh,0a9h,0fdh,0e1h,0a5h	; a5df  ........

; ----------------------------------------------------------------------
; DATOS partitura_A5E7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x99 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xa5e7..0xa5f9  (18 bytes)
DATA_partitura_A5E7:
	defb 0f9h,05bh,0aah,0f9h,05bh,0aah,0f9h,05bh,0aah,0f9h,05bh,0aah,0f9h,05bh,0aah,0f9h	; a5e7  .[..[..[..[..[..
	defb 05bh,0aah	; a5f7

; ----------------------------------------------------------------------
; DATOS partituras_A5F9: 1 partitura entera (de la primera nota a su 0xFF o
;   salto) que no lee ninguno de los sonidos 0x01-0xEF tocados con
;   tools/partituras.py
;   0xa5f9..0xa617  (30 bytes)
DATA_partituras_A5F9:
	defb 0f9h,05bh,0aah,0f9h,05bh,0aah,0f9h,05bh,0aah,0f9h,089h,0aah,0f9h,0b6h,0aah,0f9h	; a5f9  .[..[..[........
	defb 0e2h,0aah,0f9h,009h,0abh,0f9h,05bh,0aah,0f9h,05bh,0aah,0fdh,00eh,0a6h	; a609  ......[..[....

; ----------------------------------------------------------------------
; DATOS partitura_A617: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x99 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xa617..0xa630  (25 bytes)
DATA_partitura_A617:
	defb 0feh,001h,0e9h,006h,0c2h,0f9h,031h,0abh,0eah,005h,0f9h,060h,0abh,0eah,006h,0f9h	; a617  ......1....`....
	defb 060h,0abh,0f9h,060h,0abh,0f9h,031h,0abh,0f9h	; a627  `..`..1..

; ----------------------------------------------------------------------
; DATOS partitura_A630: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x99 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xa630..0xa632  (2 bytes)
DATA_partitura_A630:
	defb 060h,0abh	; a630

; ----------------------------------------------------------------------
; DATOS partituras_A632: 1 partitura entera (de la primera nota a su 0xFF o
;   salto) que no lee ninguno de los sonidos 0x01-0xEF tocados con
;   tools/partituras.py
;   0xa632..0xa654  (34 bytes)
DATA_partituras_A632:
	defb 0f9h,060h,0abh,0f9h,060h,0abh,0eah,006h,0f9h,060h,0abh,0f9h,08bh,0abh,0f9h,0b9h	; a632  .`..`....`......
	defb 0abh,0f9h,000h,0ach,0f9h,024h,0ach,0eah,006h,0f9h,060h,0abh,0f9h,060h,0abh,0fdh	; a642  .....$....`..`..
	defb 04bh,0a6h	; a652

; ----------------------------------------------------------------------
; DATOS partitura_A654: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x99 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (15 bytes)
;   0xa654..0xa663  (15 bytes)
DATA_partitura_A654:
	defb 0f9h,04bh,0ach,0f9h,075h,0ach,0f9h,09dh,0ach,0f9h,04bh,0ach,0f9h,075h,0ach	; a654  .K..u.....K..u.

; ----------------------------------------------------------------------
; DATOS partituras_A663: 1 partitura entera (de la primera nota a su 0xFF o
;   salto) que no lee ninguno de los sonidos 0x01-0xEF tocados con
;   tools/partituras.py
;   0xa663..0xa67d  (26 bytes)
DATA_partituras_A663:
	defb 0f9h,09dh,0ach,0f9h,0c1h,0ach,0f9h,006h,0adh,0f9h,048h,0adh,0f9h,08dh,0adh,043h	; a663  ..........H....C
	defb 0f9h,08dh,0adh,083h,0f9h,09dh,0ach,0fdh,077h,0a6h	; a673  ........w.

; ----------------------------------------------------------------------
; DATOS partitura_A67D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x99 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (15 bytes)
;   0xa67d..0xa68c  (15 bytes)
DATA_partitura_A67D:
	defb 0f9h,0b5h,0adh,0f9h,0e4h,0adh,0f9h,029h,0aeh,0f9h,0b5h,0adh,0f9h,0e4h,0adh	; a67d  .......).......

; ----------------------------------------------------------------------
; DATOS partituras_A68C: 1 partitura entera (de la primera nota a su 0xFF o
;   salto) que no lee ninguno de los sonidos 0x01-0xEF tocados con
;   tools/partituras.py
;   0xa68c..0xa6a4  (24 bytes)
DATA_partituras_A68C:
	defb 0f9h,029h,0aeh,0f9h,04dh,0aeh,0f9h,08ch,0aeh,0f9h,0d0h,0aeh,0f9h,00fh,0afh,0f9h	; a68c  .)..M...........
	defb 03dh,0afh,0f9h,029h,0aeh,0fdh,09eh,0a6h	; a69c  =..)....

; ----------------------------------------------------------------------
; DATOS sonido_A6A4: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x99 (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392
;   (29 bytes)
;   0xa6a4..0xa6c1  (29 bytes)
DATA_sonido_A6A4:
	defb 0feh,004h,0e9h,006h,0f5h,0b0h,000h,000h,000h,0b1h,000h,000h,0b0h,000h,0a0h,000h	; a6a4  ................
	defb 001h,0a0h,000h,000h,000h,0b0h,000h,001h,0b0h,000h,001h,0b0h,000h	; a6b4  .............

; ----------------------------------------------------------------------
; DATOS partitura_A6C1: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x99 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (5 bytes)
;   0xa6c1..0xa6c6  (5 bytes)
DATA_partitura_A6C1:
	defb 001h,0a0h,000h,0fbh,018h	; a6c1

; ----------------------------------------------------------------------
; DATOS partituras_A6C6: 5 partituras enteras (de la primera nota a su 0xFF o
;   salto) que no lee ninguno de los sonidos 0x01-0xEF tocados con
;   tools/partituras.py
;   0xa6c6..0xa75d  (151 bytes)
DATA_partituras_A6C6:
	defb 0fah,0e9h,006h,0f5h,0b0h,000h,000h,000h,0b1h,000h,000h,0b0h,000h,0a0h,000h,001h	; a6c6  ................
	defb 0a0h,000h,000h,000h,0b0h,000h,001h,0b0h,000h,001h,0b0h,000h,001h,0a0h,000h,0fbh	; a6d6  ................
	defb 007h,0b0h,000h,000h,000h,0b1h,000h,000h,0b0h,000h,001h,0a0h,000h,000h,000h,0a0h	; a6e6  ................
	defb 0b0h,0b0h,0b0h,0b1h,0b0h,0b0h,0b1h,0b1h,040h,050h,060h,060h,0fah,0e9h,006h,0d0h	; a6f6  ........@P``....
	defb 0f5h,0b0h,000h,000h,000h,061h,000h,000h,0a0h,000h,0a0h,000h,061h,0a0h,000h,0fbh	; a706  .....a......a...
	defb 010h,0fah,0e9h,006h,0d0h,0f5h,0b0h,000h,000h,000h,061h,000h,000h,0a0h,000h,0a0h	; a716  ..........a.....
	defb 000h,061h,0a0h,000h,0fbh,007h,0b0h,000h,000h,000h,061h,000h,000h,0a0h,000h,0a0h	; a726  .a........a.....
	defb 000h,061h,060h,060h,0fah,0e9h,006h,0d0h,0f5h,0b0h,000h,000h,000h,061h,000h,000h	; a736  .a``.........a..
	defb 0a0h,000h,0a0h,000h,061h,0a0h,000h,0a0h,0a0h,0a0h,0a0h,061h,0a0h,001h,000h,0a0h	; a746  ....a......a....
	defb 000h,061h,0a0h,000h,0fbh,008h,0fah	; a756

; ----------------------------------------------------------------------
; DATOS sonido_A75D: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x99 (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392
;   (29 bytes)
;   0xa75d..0xa77a  (29 bytes)
DATA_sonido_A75D:
	defb 0feh,001h,0e9h,00ch,0f5h,0cfh,0fbh,004h,0fah,0e9h,00ch,0eah,00bh,0ebh,00ah,01bh	; a75d  ................
	defb 041h,0d6h,010h,002h,0f5h,0d5h,061h,061h,060h,061h,061h,061h,061h	; a76d  A.....aa`aaaa

; ----------------------------------------------------------------------
; DATOS partitura_A77A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x99 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (31 bytes)
;   0xa77a..0xa799  (31 bytes)
DATA_partitura_A77A:
	defb 061h,060h,0fbh,004h,0fah,0ech,0e9h,00ch,0c2h,0eah,007h,0f0h,002h,071h,0d3h,06fh	; a77a  a`...........q.o
	defb 0edh,044h,08fh,09bh,0d2h,013h,0d3h,0bbh,083h,06fh,08fh,09bh,0d2h,013h,03ch	; a78a  .D.......o....<

; ----------------------------------------------------------------------
; DATOS partitura_A799: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x99 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xa799..0xa79b  (2 bytes)
DATA_partitura_A799:
	defb 0dch,0fah	; a799

; ----------------------------------------------------------------------
; DATOS partituras_A79B: 4 partituras enteras (de la primera nota a su 0xFF o
;   salto) que no lee ninguno de los sonidos 0x01-0xEF tocados con
;   tools/partituras.py
;   0xa79b..0xa814  (121 bytes)
DATA_partituras_A79B:
	defb 0e9h,006h,0eah,00bh,0ebh,00ah,01bh,041h,0d6h,010h,002h,0f5h,0d5h,063h,063h,0d4h	; a79b  .......A.....cc.
	defb 011h,0d5h,061h,081h,093h,0c3h,080h,090h,0b1h,061h,081h,091h,0fbh,004h,0fah,0e9h	; a7ab  ..a......a......
	defb 006h,0eah,00bh,0ebh,00ah,01bh,041h,0d6h,010h,002h,0f5h,0d5h,043h,043h,0b1h,041h	; a7bb  ......A.....CC.A
	defb 001h,073h,0c3h,060h,070h,091h,041h,061h,071h,0fbh,004h,0fah,0e9h,006h,0eah,00bh	; a7cb  .s.`p.Aaq.......
	defb 0ebh,00ah,01bh,041h,0d6h,010h,002h,0f5h,0d5h,063h,063h,0d4h,011h,0d5h,061h,081h	; a7db  ...A.....cc...a.
	defb 093h,0c3h,080h,090h,0b1h,061h,081h,091h,0fbh,004h,0fah,0f2h,001h,0e9h,00ch,0c0h	; a7eb  .....a..........
	defb 0ech,0eah,007h,0d6h,006h,001h,0f0h,001h,044h,0d1h,01bh,0d2h,0b1h,0d1h,011h,0d2h	; a7fb  ........D.......
	defb 0b7h,0d3h,047h,0d2h,0b7h,0b7h,067h,0b6h,0fah	; a80b  ..G...g..

; ----------------------------------------------------------------------
; DATOS sonido_A814: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x99 (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392
;   (13 bytes)
;   0xa814..0xa821  (13 bytes)
DATA_sonido_A814:
	defb 0feh,001h,0e9h,00ch,0f5h,0cfh,0fbh,004h,0fah,0e9h,00ch,0eah,00bh	; a814  .............

; ----------------------------------------------------------------------
; DATOS partitura_A821: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x99 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (15 bytes)
;   0xa821..0xa830  (15 bytes)
DATA_partitura_A821:
	defb 0ebh,00ah,01bh,041h,0d6h,010h,002h,0f5h,0d4h,061h,061h,060h,061h,061h,061h	; a821  ...A.....aa`aaa

; ----------------------------------------------------------------------
; DATOS partitura_A830: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x99 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xa830..0xa836  (6 bytes)
DATA_partitura_A830:
	defb 061h,061h,060h,0fbh,004h,0fah	; a830

; ----------------------------------------------------------------------
; DATOS partituras_A836: 5 partituras enteras (de la primera nota a su 0xFF o
;   salto) que no lee ninguno de los sonidos 0x01-0xEF tocados con
;   tools/partituras.py
;   0xa836..0xa915  (223 bytes)
DATA_partituras_A836:
	defb 0e9h,00ch,0eah,00ch,0ebh,00ah,01bh,041h,0d6h,010h,002h,0f5h,0d4h,061h,061h,060h	; a836  .......A.....aa`
	defb 061h,061h,061h,061h,061h,060h,0fbh,007h,061h,061h,060h,061h,060h,0e9h,006h,060h	; a846  aaaaa`..aa`a`..`
	defb 060h,060h,060h,061h,060h,060h,061h,061h,060h,060h,060h,060h,0fah,0e9h,006h,0eah	; a856  ```a``aa````....
	defb 00ch,0ebh,00ah,01bh,041h,0d6h,010h,002h,0f5h,0d4h,063h,063h,0d3h,011h,0d4h,061h	; a866  ....A.....cc...a
	defb 081h,093h,0c3h,080h,090h,0b1h,061h,081h,091h,0fbh,004h,0fah,0e9h,006h,0eah,00ah	; a876  ......a.........
	defb 0ebh,00ah,01bh,041h,0d6h,010h,002h,0f5h,0d4h,043h,043h,0b1h,041h,061h,073h,0c3h	; a886  ...A.....CC.Aas.
	defb 060h,070h,091h,041h,061h,071h,0fbh,004h,0fah,0e9h,006h,0eah,00bh,0ebh,00ah,01bh	; a896  `p.Aaq..........
	defb 041h,0d6h,010h,002h,0f5h,0d4h,063h,063h,0d4h,011h,0d5h,061h,081h,093h,0c3h,080h	; a8a6  A.....cc...a....
	defb 090h,0b1h,061h,081h,091h,0fbh,004h,0fah,0e9h,006h,0eah,00bh,0ebh,00ah,01bh,041h	; a8b6  ..a............A
	defb 0d6h,010h,002h,0f5h,0d5h,060h,060h,060h,060h,061h,060h,060h,060h,060h,061h,061h	; a8c6  .....````a````aa
	defb 060h,060h,0fbh,002h,0f5h,040h,040h,040h,040h,041h,040h,040h,040h,040h,041h,041h	; a8d6  ``...@@@@A@@@@AA
	defb 040h,040h,0fbh,002h,0f5h,030h,030h,030h,030h,031h,030h,030h,030h,030h,031h,031h	; a8e6  @@...00001000011
	defb 030h,030h,0fbh,002h,020h,020h,020h,020h,021h,020h,020h,020h,020h,021h,021h,020h	; a8f6  00..    !    !!
	defb 020h,040h,040h,040h,040h,041h,040h,040h,040h,040h,041h,041h,040h,040h,0fah	; a906   @@@@A@@@@AA@@.

; ----------------------------------------------------------------------
; DATOS sonido_A915: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x99 (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392
;   (5 bytes)
;   0xa915..0xa91a  (5 bytes)
DATA_sonido_A915:
	defb 0feh,001h,0f8h,015h,0e9h	; a915

; ----------------------------------------------------------------------
; DATOS partitura_A91A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x99 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (29 bytes)
;   0xa91a..0xa937  (29 bytes)
DATA_partitura_A91A:
	defb 00ch,0f5h,0cfh,0fbh,004h,0fah,0f8h,04bh,0e9h,00ch,0eah,00fh,0ebh,009h,04bh,021h	; a91a  .......K......K!
	defb 0d6h,010h,002h,0f5h,0d5h,061h,061h,060h,061h,061h,061h,061h,061h	; a92a  .....aa`aaaaa

; ----------------------------------------------------------------------
; DATOS partitura_A937: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x99 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xa937..0xa93b  (4 bytes)
DATA_partitura_A937:
	defb 060h,0fbh,004h,0fah	; a937

; ----------------------------------------------------------------------
; DATOS partituras_A93B: 5 partituras enteras (de la primera nota a su 0xFF o
;   salto) que no lee ninguno de los sonidos 0x01-0xEF tocados con
;   tools/partituras.py
;   0xa93b..0xaa5b  (288 bytes)
DATA_partituras_A93B:
	defb 0f8h,04bh,0e9h,00ch,0eah,00fh,0ebh,009h,04bh,021h,0d6h,010h,002h,0f5h,0d5h,061h	; a93b  .K......K!.....a
	defb 061h,060h,061h,061h,061h,061h,061h,060h,0fbh,007h,061h,061h,060h,061h,060h,0e9h	; a94b  a`aaaaa`..aa`a`.
	defb 006h,060h,060h,060h,060h,061h,060h,060h,061h,061h,060h,060h,060h,060h,0fah,0f8h	; a95b  .````a``aa````..
	defb 04bh,0e9h,006h,0eah,00fh,0f5h,0ebh,00ah,02bh,021h,0d6h,010h,002h,0dbh,002h,0d5h	; a96b  K.......+!......
	defb 063h,0dbh,007h,063h,0dbh,002h,0d4h,011h,0d5h,061h,081h,093h,0ech,0eah,002h,093h	; a97b  c..c.....a......
	defb 0eah,00fh,0ebh,00ah,02bh,011h,080h,090h,0ebh,00ah,02bh,021h,0b1h,061h,081h,091h	; a98b  ....+.....+!.a..
	defb 0fbh,004h,0fah,0f8h,04bh,0e9h,006h,0eah,00fh,0ebh,009h,04bh,021h,0d6h,010h,002h	; a99b  ....K......K!...
	defb 0f5h,0d5h,043h,0dbh,007h,043h,0dbh,002h,0b1h,041h,061h,073h,0ech,0eah,002h,073h	; a9ab  ..C..C...Aas...s
	defb 0eah,00fh,0ebh,009h,04bh,011h,060h,070h,0ebh,009h,04bh,021h,091h,041h,061h,071h	; a9bb  ....K.`p..K!.Aaq
	defb 0fbh,004h,0fah,0f8h,04bh,0e9h,006h,0eah,00fh,0f5h,0ebh,00ah,02bh,021h,0d6h,010h	; a9cb  ....K.......+!..
	defb 002h,0dbh,002h,0d5h,063h,0dbh,007h,063h,0dbh,002h,0d4h,011h,0d5h,061h,081h,093h	; a9db  ....c..c.....a..
	defb 0ech,0eah,002h,093h,0eah,00fh,0ebh,00ah,02bh,011h,080h,090h,0ebh,00ah,02bh,021h	; a9eb  ........+.....+!
	defb 0b1h,061h,081h,091h,0fbh,004h,0fah,0f8h,04bh,0e9h,006h,0eah,00fh,0ebh,009h,016h	; a9fb  .a......K.......
	defb 003h,0d6h,010h,002h,0f5h,0d4h,060h,060h,060h,060h,061h,060h,060h,060h,060h,061h	; aa0b  ......````a````a
	defb 061h,060h,060h,0fbh,002h,0f5h,040h,040h,040h,040h,041h,040h,040h,040h,040h,041h	; aa1b  a``...@@@@A@@@@A
	defb 041h,040h,040h,0fbh,002h,0f5h,030h,030h,030h,030h,031h,030h,030h,030h,030h,031h	; aa2b  A@@...0000100001
	defb 031h,030h,030h,0fbh,002h,020h,020h,020h,020h,021h,020h,020h,020h,020h,021h,021h	; aa3b  100..    !    !!
	defb 020h,020h,040h,040h,040h,040h,041h,040h,040h,040h,040h,041h,041h,040h,040h,0fah	; aa4b    @@@@A@@@@AA@@.

; ----------------------------------------------------------------------
; DATOS sonido_AA5B: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x99 (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392
;   (46 bytes)
;   0xaa5b..0xaa89  (46 bytes)
DATA_sonido_AA5B:
	defb 0feh,001h,0e9h,00ch,0f6h,0f4h,052h,009h,009h,009h,0eah,00ah,0ebh,009h,03bh,002h	; aa5b  ......R.........
	defb 0f5h,0d3h,060h,0d2h,010h,060h,0d3h,060h,0d2h,040h,060h,0d3h,060h,0d2h,010h,060h	; aa6b  ..`..`.`.@`.`..`
	defb 0d3h,060h,0d2h,060h,010h,040h,060h,0d3h,060h,0d2h,010h,0fbh,004h,0fah	; aa7b  .`.`.@`.`.....

; ----------------------------------------------------------------------
; DATOS partituras_AA89: 4 partituras enteras (de la primera nota a su 0xFF o
;   salto) que no lee ninguno de los sonidos 0x01-0xEF tocados con
;   tools/partituras.py
;   0xaa89..0xab31  (168 bytes)
DATA_partituras_AA89:
	defb 0e9h,00ch,0f6h,0f4h,052h,009h,009h,009h,0eah,00ah,0ebh,009h,03bh,002h,0f5h,0d3h	; aa89  ....R...........
	defb 040h,0b0h,0d2h,040h,0d3h,040h,0d2h,020h,040h,0d3h,040h,0b0h,0d2h,040h,0d3h,040h	; aa99  @..@.@. @.@..@.@
	defb 0d2h,040h,0d3h,0b0h,0d2h,020h,040h,0d3h,040h,0b0h,0fbh,004h,0fah,0e9h,00ch,0f6h	; aaa9  .@... @.@.......
	defb 0f4h,052h,009h,009h,009h,0eah,00ah,0ebh,009h,03bh,002h,0f5h,0d3h,060h,0d2h,010h	; aab9  .R...........`..
	defb 060h,0d3h,060h,0d2h,040h,060h,0d3h,060h,0d2h,010h,060h,0d3h,060h,0d2h,060h,010h	; aac9  `.`.@`.`..`.`.`.
	defb 040h,060h,0d3h,060h,0d2h,010h,0fbh,004h,0fah,0f6h,0f1h,002h,003h,001h,007h,0e9h	; aad9  @`.`............
	defb 00ch,0f0h,001h,055h,0eah,00ch,0edh,01ah,0ebh,089h,037h,0b1h,0dbh,003h,0d6h,006h	; aae9  ...U......7.....
	defb 001h,0d3h,06bh,041h,061h,08bh,031h,041h,067h,031h,041h,061h,0b1h,097h,087h,0fah	; aaf9  ..kAa.1Ag1Aa....
	defb 0f6h,0f1h,002h,003h,001h,007h,0e9h,00ch,0f0h,001h,055h,0eah,00ch,0edh,01ah,0ebh	; ab09  ..........U.....
	defb 089h,037h,0b1h,0dbh,003h,0d6h,006h,001h,0d3h,06bh,041h,061h,08bh,031h,041h,067h	; ab19  .7.......kAa.1Ag
	defb 031h,041h,061h,0b1h,097h,0d2h,047h,0fah	; ab29  1Aa...G.

; ----------------------------------------------------------------------
; DATOS sonido_AB31: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x99 (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392
;   (6 bytes)
;   0xab31..0xab37  (6 bytes)
DATA_sonido_AB31:
	defb 0e9h,006h,0eeh,081h,0f4h,052h	; ab31

; ----------------------------------------------------------------------
; DATOS partitura_AB37: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x99 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xab37..0xab3b  (4 bytes)
DATA_partitura_AB37:
	defb 009h,009h,009h,0eah	; ab37

; ----------------------------------------------------------------------
; DATOS partitura_AB3B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x99 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xab3b..0xab3c  (1 bytes)
DATA_partitura_AB3B:
	defb 005h	; ab3b

; ----------------------------------------------------------------------
; DATOS partitura_AB3C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x99 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xab3c..0xab3f  (3 bytes)
DATA_partitura_AB3C:
	defb 0ebh,009h,01bh	; ab3c

; ----------------------------------------------------------------------
; DATOS partitura_AB3F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x99 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xab3f..0xab43  (4 bytes)
DATA_partitura_AB3F:
	defb 002h,0e9h,00ch,0f5h	; ab3f

; ----------------------------------------------------------------------
; DATOS partitura_AB43: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x99 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xab43..0xab47  (4 bytes)
DATA_partitura_AB43:
	defb 0d3h,060h,0d2h,010h	; ab43

; ----------------------------------------------------------------------
; DATOS partitura_AB47: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x99 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xab47..0xab4b  (4 bytes)
DATA_partitura_AB47:
	defb 060h,0d3h,060h,0d2h	; ab47

; ----------------------------------------------------------------------
; DATOS partitura_AB4B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x99 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xab4b..0xab4f  (4 bytes)
DATA_partitura_AB4B:
	defb 040h,060h,0d3h,060h	; ab4b

; ----------------------------------------------------------------------
; DATOS partitura_AB4F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x99 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (33 bytes)
;   0xab4f..0xab70  (33 bytes)
DATA_partitura_AB4F:
	defb 0d2h,010h,060h,0d3h,060h,0d2h,060h,010h,040h,060h,0d3h,060h,0d2h,010h,0fbh,004h	; ab4f  ..`.`.`.@`.`....
	defb 0fah,0e9h,006h,0f4h,052h,009h,009h,009h,0ebh,009h,01bh,002h,0e9h,00ch,0f5h,0d3h	; ab5f  ....R...........
	defb 060h	; ab6f

; ----------------------------------------------------------------------
; DATOS partitura_AB70: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x99 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (5 bytes)
;   0xab70..0xab75  (5 bytes)
DATA_partitura_AB70:
	defb 0d2h,010h,060h,0d3h,060h	; ab70

; ----------------------------------------------------------------------
; DATOS partitura_AB75: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x99 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xab75..0xab7c  (7 bytes)
DATA_partitura_AB75:
	defb 0d2h,040h,060h,0d3h,060h,0d2h,010h	; ab75

; ----------------------------------------------------------------------
; DATOS partitura_AB7C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x99 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (15 bytes)
;   0xab7c..0xab8b  (15 bytes)
DATA_partitura_AB7C:
	defb 060h,0d3h,060h,0d2h,060h,010h,040h,060h,0d3h,060h,0d2h,010h,0fbh,004h,0fah	; ab7c  `.`.`.@`.`.....

; ----------------------------------------------------------------------
; DATOS partituras_AB8B: 4 partituras enteras (de la primera nota a su 0xFF o
;   salto) que no lee ninguno de los sonidos 0x01-0xEF tocados con
;   tools/partituras.py
;   0xab8b..0xac4b  (192 bytes)
DATA_partituras_AB8B:
	defb 0e9h,006h,0f4h,052h,009h,009h,009h,0eah,006h,0ebh,009h,01bh,002h,0e9h,00ch,0f5h	; ab8b  ...R............
	defb 0d3h,040h,0b0h,0d2h,040h,0d3h,040h,0d2h,020h,040h,0d3h,040h,0b0h,0d2h,040h,0d3h	; ab9b  .@..@.@. @.@..@.
	defb 040h,0d2h,040h,0d3h,0b0h,0d2h,020h,040h,0d3h,040h,0b0h,0fbh,004h,0fah,0e9h,006h	; abab  @.@... @.@......
	defb 0f4h,052h,009h,009h,009h,0eah,006h,0ebh,009h,01bh,002h,0e9h,00ch,0f5h,0d3h,060h	; abbb  .R.............`
	defb 0d2h,010h,060h,0d3h,060h,0d2h,040h,060h,0d3h,060h,0d2h,010h,060h,0d3h,060h,0d2h	; abcb  ..`.`.@`.`..`.`.
	defb 060h,010h,040h,060h,0d3h,060h,0d2h,010h,0fbh,003h,0d3h,060h,0d2h,010h,060h,0d3h	; abdb  `.@`.`.....`..`.
	defb 060h,0d2h,040h,060h,0d3h,060h,0d2h,010h,060h,0d3h,060h,0d2h,060h,010h,040h,060h	; abeb  `.@`.`..`.`.`.@`
	defb 0e9h,006h,0d3h,060h,0fah,0f2h,001h,0e9h,00ch,0eah,00bh,0edh,019h,0ebh,089h,037h	; abfb  ...`...........7
	defb 0b1h,0dbh,002h,0d6h,006h,001h,0f0h,001h,044h,0d2h,01bh,0d3h,0b1h,0d2h,011h,0d3h	; ac0b  ........D.......
	defb 0b7h,0d4h,047h,0d3h,0b7h,0b7h,067h,0b7h,0fah,0f2h,001h,0e9h,00ch,0eah,00bh,0edh	; ac1b  ..G...g.........
	defb 019h,0ebh,089h,037h,0b1h,0dbh,002h,0d6h,006h,001h,0f0h,001h,044h,0d2h,01bh,0d3h	; ac2b  ...7........D...
	defb 0b1h,0d2h,011h,0d3h,0b7h,0d4h,047h,0d3h,0b7h,0b7h,067h,0b7h,0e9h,006h,0c2h,0fah	; ac3b  ......G...g.....

; ----------------------------------------------------------------------
; DATOS sonido_AC4B: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x99 (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392
;   (3 bytes)
;   0xac4b..0xac4e  (3 bytes)
DATA_sonido_AC4B:
	defb 0feh,001h,0e9h	; ac4b

; ----------------------------------------------------------------------
; DATOS partitura_AC4E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x99 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (39 bytes)
;   0xac4e..0xac75  (39 bytes)
DATA_partitura_AC4E:
	defb 00ch,0f8h,009h,0eah,008h,0ebh,00ah,02bh,001h,0f5h,0d4h,060h,0d3h,010h,060h,0d4h	; ac4e  .......+...`..`.
	defb 060h,0d3h,040h,060h,0d4h,060h,0d3h,010h,060h,0d4h,060h,0d3h,060h,010h,040h,060h	; ac5e  `.@`.`..`.`.`.@`
	defb 0d4h,060h,0d3h,010h,0fbh,004h,0fah	; ac6e

; ----------------------------------------------------------------------
; DATOS partitura_AC75: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x99 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (9 bytes)
;   0xac75..0xac7e  (9 bytes)
DATA_partitura_AC75:
	defb 0e9h,00ch,0f8h,009h,0eah,008h,0ebh,00ah,02bh	; ac75  ........+

; ----------------------------------------------------------------------
; DATOS partitura_AC7E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x99 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (36 bytes)
;   0xac7e..0xaca2  (36 bytes)
DATA_partitura_AC7E:
	defb 001h,0f5h,0d4h,060h,0d3h,010h,060h,0d4h,060h,0d3h,040h,060h,0d4h,060h,0d3h,010h	; ac7e  ...`..`.`.@`.`..
	defb 060h,0d4h,060h,0d3h,060h,010h,040h,060h,0d4h,060h,0d3h,010h,0fbh,004h,0fah,0f8h	; ac8e  `.`.`.@`.`......
	defb 04bh,0e9h,00ch,0eah	; ac9e

; ----------------------------------------------------------------------
; DATOS partitura_ACA2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x99 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (12 bytes)
;   0xaca2..0xacae  (12 bytes)
DATA_partitura_ACA2:
	defb 007h,0edh,071h,0ebh,084h,034h,0f1h,0dbh,004h,0f0h,001h,071h	; aca2  ..q..4.....q

; ----------------------------------------------------------------------
; DATOS partitura_ACAE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x99 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (19 bytes)
;   0xacae..0xacc1  (19 bytes)
DATA_partitura_ACAE:
	defb 0d3h,06fh,0edh,044h,08fh,09bh,0d2h,013h,0d3h,0bbh,083h,06fh,08fh,09bh,0d2h,013h	; acae  .o.D.......o....
	defb 03fh,0dch,0fah	; acbe

; ----------------------------------------------------------------------
; DATOS partituras_ACC1: 4 partituras enteras (de la primera nota a su 0xFF o
;   salto) que no lee ninguno de los sonidos 0x01-0xEF tocados con
;   tools/partituras.py
;   0xacc1..0xadb5  (244 bytes)
DATA_partituras_ACC1:
	defb 0e9h,006h,0f0h,001h,021h,0f4h,00dh,00ah,00ah,012h,0eah,00bh,0ebh,009h,03eh,011h	; acc1  ....!.........>.
	defb 0dbh,001h,0d6h,020h,001h,0d1h,019h,0eah,00dh,013h,0d2h,0b3h,0ebh,009h,037h,031h	; acd1  ... ..........71
	defb 0f8h,00dh,0eah,00dh,0d4h,0b1h,0d3h,011h,0f4h,00dh,00ah,00ah,012h,0eah,00bh,0ebh	; ace1  ................
	defb 009h,03eh,011h,0c3h,0d2h,087h,09bh,0c3h,0b7h,085h,0d1h,01bh,011h,0d2h,0bbh,085h	; acf1  .>..............
	defb 097h,0c5h,087h,0c9h,0fah,0e9h,006h,0f0h,001h,021h,0f4h,00dh,00ah,00ah,012h,0eah	; ad01  .........!......
	defb 00bh,0ebh,009h,03eh,011h,0dbh,001h,0d6h,020h,001h,0d2h,0b9h,0eah,00dh,0b3h,093h	; ad11  ...>.... .......
	defb 0ebh,009h,037h,031h,0f8h,00dh,0eah,00dh,0d4h,091h,0b1h,0f4h,00dh,00ah,00ah,012h	; ad21  ..71............
	defb 0eah,00bh,0ebh,009h,03eh,011h,0c3h,0d2h,067h,077h,0c7h,097h,065h,0bbh,0b1h,09bh	; ad31  ....>...gw..e...
	defb 065h,075h,0c3h,0c3h,065h,0cbh,0fah,0e9h,006h,0f0h,001h,021h,0f4h,00dh,00ah,00ah	; ad41  eu..e......!....
	defb 012h,0eah,00bh,0ebh,009h,03eh,011h,0dbh,001h,0d6h,020h,001h,0d1h,019h,0eah,00dh	; ad51  .....>.... .....
	defb 013h,0d2h,0b3h,0ebh,009h,037h,031h,0f8h,00dh,0eah,00dh,0d4h,0b1h,0d3h,011h,0f4h	; ad61  .....71.........
	defb 00dh,00ah,00ah,012h,0eah,00bh,0ebh,009h,03eh,011h,0c3h,0d2h,087h,09bh,0c3h,0b7h	; ad71  ........>.......
	defb 085h,0d1h,01bh,011h,0d2h,0bbh,085h,097h,0c5h,087h,0c9h,0fah,0f8h,002h,0e9h,00ch	; ad81  ................
	defb 0eah,009h,0edh,01ah,0ebh,089h,037h,0b1h,0dbh,003h,0d6h,004h,001h,0f0h,001h,041h	; ad91  ......7........A
	defb 0d2h,062h,0d1h,018h,0d2h,0b1h,091h,0b2h,0d1h,048h,061h,081h,062h,0b8h,091h,0b1h	; ada1  .b.......Ha.b...
	defb 091h,080h,068h,0fah	; adb1

; ----------------------------------------------------------------------
; DATOS sonido_ADB5: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x99 (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392
;   (9 bytes)
;   0xadb5..0xadbe  (9 bytes)
DATA_sonido_ADB5:
	defb 0feh,001h,0eeh,081h,0e9h,006h,0c2h,0e9h,00ch	; adb5  .........

; ----------------------------------------------------------------------
; DATOS partitura_ADBE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x99 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (9 bytes)
;   0xadbe..0xadc7  (9 bytes)
DATA_partitura_ADBE:
	defb 0f8h,009h,0eah,004h,0ebh,009h,01bh,001h,0f5h	; adbe  .........

; ----------------------------------------------------------------------
; DATOS partitura_ADC7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x99 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (22 bytes)
;   0xadc7..0xaddd  (22 bytes)
DATA_partitura_ADC7:
	defb 0d4h,060h,0d3h,010h,060h,0d4h,060h,0d3h,040h,060h,0d4h,060h,0d3h,010h,060h,0d4h	; adc7  .`..`.`.@`.`..`.
	defb 060h,0d3h,060h,010h,040h,060h	; add7

; ----------------------------------------------------------------------
; DATOS partitura_ADDD: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x99 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xaddd..0xadde  (1 bytes)
DATA_partitura_ADDD:
	defb 0d4h	; addd

; ----------------------------------------------------------------------
; DATOS partitura_ADDE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x99 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (22 bytes)
;   0xadde..0xadf4  (22 bytes)
DATA_partitura_ADDE:
	defb 060h,0d3h,010h,0fbh,004h,0fah,0e9h,006h,0e9h,00ch,0f8h,009h,0eah,004h,0ebh,009h	; adde  `...............
	defb 01bh,001h,0f5h,0d4h,060h,0d3h	; adee

; ----------------------------------------------------------------------
; DATOS partitura_ADF4: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x99 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xadf4..0xadfc  (8 bytes)
DATA_partitura_ADF4:
	defb 010h,060h,0d4h,060h,0d3h,040h,060h,0d4h	; adf4  .`.`.@`.

; ----------------------------------------------------------------------
; DATOS partitura_ADFC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x99 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (22 bytes)
;   0xadfc..0xae12  (22 bytes)
DATA_partitura_ADFC:
	defb 060h,0d3h,010h,060h,0d4h,060h,0d3h,060h,010h,040h,060h,0d4h,060h,0d3h,010h,0fbh	; adfc  `..`.`.`.@`.`...
	defb 003h,0d4h,060h,0d3h,010h,060h	; ae0c

; ----------------------------------------------------------------------
; DATOS partitura_AE12: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x99 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xae12..0xae1d  (11 bytes)
DATA_partitura_AE12:
	defb 0d4h,060h,0d3h,040h,060h,0d4h,060h,0d3h,010h,060h,0d4h	; ae12  .`.@`.`..`.

; ----------------------------------------------------------------------
; DATOS partitura_AE1D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x99 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (22 bytes)
;   0xae1d..0xae33  (22 bytes)
DATA_partitura_AE1D:
	defb 060h,0d3h,060h,010h,040h,060h,0e9h,006h,0d4h,060h,0efh,0fah,0f8h,04bh,0e9h,00ch	; ae1d  `.`.@`...`...K..
	defb 0eah,007h,0edh,071h,0ebh,084h	; ae2d

; ----------------------------------------------------------------------
; DATOS partitura_AE33: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x99 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (26 bytes)
;   0xae33..0xae4d  (26 bytes)
DATA_partitura_AE33:
	defb 034h,0f1h,0dbh,004h,0f0h,001h,071h,0d3h,09fh,0edh,044h,0bfh,0d2h,01bh,043h,03bh	; ae33  4.....q...D...C.
	defb 0d3h,0b3h,09fh,0bfh,0d2h,01bh,043h,06fh,0dch,0fah	; ae43  ......Co..

; ----------------------------------------------------------------------
; DATOS partituras_AE4D: 5 partituras enteras (de la primera nota a su 0xFF o
;   salto) que no lee ninguno de los sonidos 0x01-0xEF tocados con
;   tools/partituras.py
;   0xae4d..0xaf6c  (287 bytes)
DATA_partituras_AE4D:
	defb 0e9h,006h,0f0h,001h,021h,0f4h,00dh,00ah,00ah,012h,0eah,00bh,0ebh,009h,03eh,011h	; ae4d  ....!.........>.
	defb 0dbh,001h,0d6h,016h,001h,0d2h,099h,093h,083h,0ebh,009h,037h,031h,0f8h,00dh,0eah	; ae5d  ...........71...
	defb 00ch,0d3h,041h,061h,0c3h,0f4h,00dh,00ah,00ah,012h,0ebh,009h,03eh,011h,0eah,00bh	; ae6d  ..Aa........>...
	defb 0d2h,047h,06bh,0c3h,087h,045h,09bh,091h,08bh,045h,067h,0c5h,047h,0c9h,0fah,0e9h	; ae7d  .Gk..E...Eg.G...
	defb 006h,0f0h,001h,021h,0f4h,00dh,00ah,00ah,012h,0eah,00bh,0ebh,009h,03eh,011h,0dbh	; ae8d  ...!.........>..
	defb 001h,0d6h,016h,001h,0d2h,073h,0c3h,0c1h,072h,0c0h,062h,0c0h,0ebh,009h,037h,031h	; ae9d  .....s..r.b...71
	defb 0f8h,00dh,0eah,00ch,0d3h,021h,041h,0c3h,0f4h,00dh,00ah,00ah,012h,0ebh,009h,03eh	; aead  .....!A........>
	defb 011h,0eah,00bh,0d2h,027h,047h,0c7h,067h,025h,07bh,071h,06bh,025h,045h,0c3h,0c3h	; aebd  ....'G.g%{qk%E..
	defb 025h,0cbh,0fah,0e9h,006h,0f0h,001h,021h,0f4h,00dh,00ah,00ah,012h,0eah,00bh,0ebh	; aecd  %......!........
	defb 009h,03eh,011h,0dbh,001h,0d6h,016h,001h,0d2h,099h,093h,083h,0ebh,009h,037h,031h	; aedd  .>............71
	defb 0f8h,00dh,0eah,00ch,0d3h,041h,061h,0c3h,0f4h,00dh,00ah,00ah,012h,0ebh,009h,03eh	; aeed  .....Aa........>
	defb 011h,0eah,00bh,0d2h,047h,06bh,0c3h,087h,045h,09bh,091h,08bh,045h,067h,0c5h,047h	; aefd  ....Gk..E...Eg.G
	defb 0c9h,0fah,0f8h,002h,0e9h,006h,0c2h,0e9h,00ch,0eeh,082h,0eah,006h,0edh,016h,0ebh	; af0d  ................
	defb 089h,037h,0b1h,0dbh,002h,0d6h,004h,001h,0f0h,001h,041h,0d2h,062h,0d1h,018h,0d2h	; af1d  .7........A.b...
	defb 0b1h,091h,0b2h,0d1h,048h,061h,081h,062h,0b8h,091h,0b1h,091h,080h,068h,043h,0fah	; af2d  ....Ha.b.....hC.
	defb 0f8h,002h,0e9h,006h,0e9h,00ch,0eeh,082h,0eah,006h,0edh,016h,0ebh,089h,037h,0b1h	; af3d  ..............7.
	defb 0dbh,002h,0d6h,004h,001h,0f0h,001h,041h,0d2h,062h,0d1h,018h,0d2h,0b1h,091h,0b2h	; af4d  .......A.b......
	defb 0d1h,048h,061h,081h,062h,0b8h,091h,0b1h,091h,080h,068h,0e9h,006h,084h,0fah	; af5d  .Ha.b.....h....

; ----------------------------------------------------------------------
; DATOS partitura_AF6C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xaf6c..0xaf72  (6 bytes)
DATA_partitura_AF6C:
	defb 0feh,001h,0e9h,00fh,0c0h,0eeh	; af6c

; ----------------------------------------------------------------------
; DATOS partitura_AF72: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xaf72..0xaf79  (7 bytes)
DATA_partitura_AF72:
	defb 090h,0e9h,008h,0f0h,007h,062h,0eah	; af72

; ----------------------------------------------------------------------
; DATOS partitura_AF79: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (15 bytes)
;   0xaf79..0xaf88  (15 bytes)
DATA_partitura_AF79:
	defb 007h,0edh,052h,0ebh,087h,014h,0f1h,0d4h,01fh,0d3h,01fh,0e9h,00fh,00eh,0ffh	; af79  ..R............

; ----------------------------------------------------------------------
; DATOS partitura_AF88: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (12 bytes)
;   0xaf88..0xaf94  (12 bytes)
DATA_partitura_AF88:
	defb 0feh,001h,0e9h,008h,0f0h,007h,06fh,0eah,00bh,0ebh,009h,037h	; af88  ......o....7

; ----------------------------------------------------------------------
; DATOS partitura_AF94: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (23 bytes)
;   0xaf94..0xafab  (23 bytes)
DATA_partitura_AF94:
	defb 0a1h,0d5h,001h,071h,061h,0d4h,019h,0d5h,001h,071h,061h,0d4h,019h,0eah,00ah,0ebh	; af94  ...qa....qa.....
	defb 001h,047h,0f1h,0e9h,00fh,00fh,0ffh	; afa4

; ----------------------------------------------------------------------
; DATOS partitura_AFAB: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (27 bytes)
;   0xafab..0xafc6  (27 bytes)
DATA_partitura_AFAB:
	defb 0feh,001h,0e9h,008h,0dbh,002h,0f0h,007h,06fh,0eah,009h,0ebh,007h,0f8h,0f1h,0d4h	; afab  ........o.......
	defb 001h,071h,061h,0d3h,019h,0d4h,001h,071h,061h,0d3h,019h	; afbb  .qa....qa..

; ----------------------------------------------------------------------
; DATOS partitura_AFC6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xafc6..0xafca  (4 bytes)
DATA_partitura_AFC6:
	defb 0e9h,00fh,00fh,0ffh	; afc6

; ----------------------------------------------------------------------
; DATOS partitura_AFCA: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xafca..0xafcb  (1 bytes)
DATA_partitura_AFCA:
	defb 0feh	; afca

; ----------------------------------------------------------------------
; DATOS partitura_AFCB: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xafcb..0xafd1  (6 bytes)
DATA_partitura_AFCB:
	defb 001h,0f6h,0f8h,04bh,0e9h,008h	; afcb

; ----------------------------------------------------------------------
; DATOS partitura_AFD1: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (29 bytes)
;   0xafd1..0xafee  (29 bytes)
DATA_partitura_AFD1:
	defb 0f0h,007h,06fh,0eah,00fh,0ebh,009h,057h,0a1h,0d5h,001h,071h,061h,0d4h,019h,0d5h	; afd1  ..o....W...qa...
	defb 001h,071h,061h,0d4h,019h,0ebh,047h,047h,0f1h,0e9h,00fh,00fh,0ffh	; afe1  .qa...GG.....

; ----------------------------------------------------------------------
; DATOS partitura_AFEE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (40 bytes)
;   0xafee..0xb016  (40 bytes)
DATA_partitura_AFEE:
	defb 0feh,001h,0f8h,04bh,0e9h,00fh,0c0h,0eeh,097h,0e9h,008h,0f0h,007h,06fh,0eah,008h	; afee  ...K.........o..
	defb 0ebh,007h,017h,0f1h,0d5h,001h,071h,061h,0d4h,019h,0d5h,001h,071h,061h,0d4h,019h	; affe  ......qa....qa..
	defb 0ebh,017h,017h,0f1h,0e9h,00fh,00eh,0ffh	; b00e  ........

; ----------------------------------------------------------------------
; DATOS partitura_B016: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (15 bytes)
;   0xb016..0xb025  (15 bytes)
DATA_partitura_B016:
	defb 0feh,001h,0f8h,009h,0e9h,008h,0f0h,007h,062h,0eah,00ch,0edh,052h,0ebh,087h	; b016  ........b...R..

; ----------------------------------------------------------------------
; DATOS partitura_B025: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (10 bytes)
;   0xb025..0xb02f  (10 bytes)
DATA_partitura_B025:
	defb 037h,0d1h,0d4h,01fh,0d3h,01fh,0e9h,00fh,00fh,0ffh	; b025  7.........

; ----------------------------------------------------------------------
; DATOS partitura_B02F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xb02f..0xb048  (25 bytes)
DATA_partitura_B02F:
	defb 0feh,001h,0f8h,009h,0e9h,008h,0f0h,007h,062h,0eah,00ch,0edh,052h,0ebh,087h,037h	; b02f  ........b...R..7
	defb 0d1h,0d3h,07fh,0d2h,07fh,0e9h,00fh,08fh,0ffh	; b03f  .........

; ----------------------------------------------------------------------
; DATOS partitura_B048: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (30 bytes)
;   0xb048..0xb066  (30 bytes)
DATA_partitura_B048:
	defb 0feh,001h,0f8h,009h,0e9h,00fh,0c1h,0e9h,008h,0eeh,082h,0f0h,007h,062h,0eah,008h	; b048  .............b..
	defb 0edh,051h,0ebh,087h,017h,0f1h,0d3h,07fh,0d2h,07fh,0e9h,00fh,08dh,0ffh	; b058  .Q............

; ----------------------------------------------------------------------
; DATOS partitura_B066: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (65 bytes)
;   0xb066..0xb0a7  (65 bytes)
DATA_partitura_B066:
	defb 0feh,004h,0e9h,009h,0d0h,0f5h,0b3h,0a3h,0a3h,0a3h,0a1h,011h,071h,0a1h,0b3h,0a3h	; b066  ............q...
	defb 0a3h,0a3h,0a1h,071h,0a3h,0b3h,0a3h,0a3h,0a3h,0a1h,071h,0a1h,071h,0b3h,0a3h,0a3h	; b076  ...q......q.q...
	defb 0a3h,0a1h,011h,070h,070h,0a1h,0fbh,002h,0feh,004h,0e9h,009h,0d0h,0a3h,0a3h,071h	; b086  ...pp..........q
	defb 0a3h,0a1h,073h,0a3h,0a3h,0a3h,071h,0a3h,0a1h,073h,0a3h,0a3h,0a3h,071h,0a3h,0a1h	; b096  ..s...q..s...q..
	defb 073h	; b0a6

; ----------------------------------------------------------------------
; DATOS partitura_B0A7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xb0a7..0xb0b8  (17 bytes)
DATA_partitura_B0A7:
	defb 0a3h,0a3h,0a3h,071h,0a3h,0a1h,0e9h,002h,075h,075h,075h,0e9h,009h,0a3h,0fdh,066h	; b0a7  ...q....uuu....f
	defb 0b0h	; b0b7

; ----------------------------------------------------------------------
; DATOS partitura_B0B8: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (16 bytes)
;   0xb0b8..0xb0c8  (16 bytes)
DATA_partitura_B0B8:
	defb 0feh,001h,0e9h,009h,0eeh,084h,0eah,008h,0ebh,009h,01bh,051h,0f5h,0d4h,003h,003h	; b0b8  ...........Q....

; ----------------------------------------------------------------------
; DATOS partitura_B0C8: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (64 bytes)
;   0xb0c8..0xb108  (64 bytes)
DATA_partitura_B0C8:
	defb 003h,003h,001h,0d3h,001h,0d4h,001h,0a1h,003h,003h,003h,003h,001h,0d3h,001h,0d4h	; b0c8  ................
	defb 003h,003h,003h,003h,003h,001h,0d3h,001h,0d4h,001h,0a1h,003h,003h,003h,003h,001h	; b0d8  ................
	defb 0d3h,001h,0d4h,003h,0fbh,002h,0f0h,000h,0feh,001h,0e9h,009h,0eeh,084h,0eah,008h	; b0e8  ................
	defb 0ebh,009h,01bh,051h,0d5h,093h,093h,0d4h,091h,0d5h,093h,091h,0d4h,033h,0d5h,093h	; b0f8  ...Q.........3..

; ----------------------------------------------------------------------
; DATOS partitura_B108: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (36 bytes)
;   0xb108..0xb12c  (36 bytes)
DATA_partitura_B108:
	defb 083h,083h,0d4h,081h,0d5h,083h,081h,0d4h,023h,0d5h,083h,093h,093h,0d4h,091h,0d5h	; b108  ........#.......
	defb 093h,091h,0d4h,033h,0d5h,093h,083h,083h,0d4h,081h,0d5h,083h,081h,0d4h,023h,0d5h	; b118  ...3..........#.
	defb 083h,0fdh,0b8h,0b0h	; b128

; ----------------------------------------------------------------------
; DATOS partitura_B12C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xb12c..0xb130  (4 bytes)
DATA_partitura_B12C:
	defb 0feh,001h,0e9h,009h	; b12c

; ----------------------------------------------------------------------
; DATOS partitura_B130: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xb130..0xb137  (7 bytes)
DATA_partitura_B130:
	defb 0eeh,004h,0eah,008h,0ebh,009h,01bh	; b130

; ----------------------------------------------------------------------
; DATOS partitura_B137: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (33 bytes)
;   0xb137..0xb158  (33 bytes)
DATA_partitura_B137:
	defb 051h,0f5h,0d4h,003h,003h,003h,003h,001h,0d3h,001h,0d4h,001h,0a1h,003h,003h,003h	; b137  Q...............
	defb 003h,001h,0d3h,001h,0d4h,003h,003h,003h,003h,003h,001h,0d3h,001h,0d4h,001h,0a1h	; b147  ................
	defb 003h	; b157

; ----------------------------------------------------------------------
; DATOS partitura_B158: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xb158..0xb159  (1 bytes)
DATA_partitura_B158:
	defb 003h	; b158

; ----------------------------------------------------------------------
; DATOS partitura_B159: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (12 bytes)
;   0xb159..0xb165  (12 bytes)
DATA_partitura_B159:
	defb 003h,003h,001h,0d3h,001h,0d4h,003h,0fbh,002h,0f0h,000h,0feh	; b159  ............

; ----------------------------------------------------------------------
; DATOS partitura_B165: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xb165..0xb177  (18 bytes)
DATA_partitura_B165:
	defb 001h,0e9h,009h,0eeh,004h,0eah,008h,0ebh,009h,01bh,051h,0d5h,093h,093h,0d4h,091h	; b165  ..........Q.....
	defb 0d5h,093h	; b175

; ----------------------------------------------------------------------
; DATOS partitura_B177: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xb177..0xb17b  (4 bytes)
DATA_partitura_B177:
	defb 091h,0d4h,033h,0d5h	; b177

; ----------------------------------------------------------------------
; DATOS partitura_B17B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xb17b..0xb181  (6 bytes)
DATA_partitura_B17B:
	defb 093h,083h,083h,0d4h,081h,0d5h	; b17b

; ----------------------------------------------------------------------
; DATOS partitura_B181: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (31 bytes)
;   0xb181..0xb1a0  (31 bytes)
DATA_partitura_B181:
	defb 083h,081h,0d4h,023h,0d5h,083h,093h,093h,0d4h,091h,0d5h,093h,091h,0d4h,033h,0d5h	; b181  ...#..........3.
	defb 093h,083h,083h,0d4h,081h,0d5h,083h,081h,0d4h,023h,0d5h,083h,0fdh,02ch,0b1h	; b191  .........#...,.

; ----------------------------------------------------------------------
; DATOS partitura_B1A0: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xb1a0..0xb1b2  (18 bytes)
DATA_partitura_B1A0:
	defb 0feh,001h,0f8h,04bh,0e9h,009h,0eah,00fh,0ebh,00ah,03bh,031h,0f0h,00dh,022h,0dbh	; b1a0  ...K.......1..".
	defb 002h,0f5h	; b1b0

; ----------------------------------------------------------------------
; DATOS partitura_B1B2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (35 bytes)
;   0xb1b2..0xb1d5  (35 bytes)
DATA_partitura_B1B2:
	defb 0d4h,003h,003h,003h,003h,001h,0d3h,001h,0d4h,001h,0a1h,003h,003h,003h,003h,001h	; b1b2  ................
	defb 0d3h,001h,0d4h,003h,003h,003h,003h,003h,001h,0d3h,001h,0d4h,001h,0a1h,003h,003h	; b1c2  ................
	defb 003h,003h,001h	; b1d2

; ----------------------------------------------------------------------
; DATOS partitura_B1D5: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (9 bytes)
;   0xb1d5..0xb1de  (9 bytes)
DATA_partitura_B1D5:
	defb 0d3h,001h,0d4h,003h,0fbh,002h,0f0h,000h,0feh	; b1d5  .........

; ----------------------------------------------------------------------
; DATOS partitura_B1DE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xb1de..0xb1f7  (25 bytes)
DATA_partitura_B1DE:
	defb 001h,0f8h,04bh,0e9h,009h,0eah,00fh,0ebh,00ah,03bh,061h,0dbh,002h,0d5h,093h,093h	; b1de  ..K.......a.....
	defb 0d4h,091h,0d5h,093h,091h,0d4h,033h,0d5h,093h	; b1ee  ......3..

; ----------------------------------------------------------------------
; DATOS partitura_B1F7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (24 bytes)
;   0xb1f7..0xb20f  (24 bytes)
DATA_partitura_B1F7:
	defb 083h,083h,0d4h,081h,0d5h,083h,081h,0d4h,023h,0d5h,083h,093h,093h,0d4h,091h,0d5h	; b1f7  ........#.......
	defb 093h,091h,0d4h,033h,0d5h,093h,083h,083h	; b207  ...3....

; ----------------------------------------------------------------------
; DATOS partitura_B20F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (12 bytes)
;   0xb20f..0xb21b  (12 bytes)
DATA_partitura_B20F:
	defb 0d4h,081h,0d5h,083h,081h,0d4h,023h,0d5h,083h,0fdh,0a0h,0b1h	; b20f  ......#.....

; ----------------------------------------------------------------------
; DATOS partitura_B21B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (24 bytes)
;   0xb21b..0xb233  (24 bytes)
DATA_partitura_B21B:
	defb 0feh,001h,0e9h,009h,0f1h,00dh,050h,001h,00ah,0eah,00eh,0edh,094h,0ebh,087h,027h	; b21b  ......P........'
	defb 0f1h,0dbh,004h,0f0h,00dh,074h,0f5h,0d4h	; b22b  .....t..

; ----------------------------------------------------------------------
; DATOS partitura_B233: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xb233..0xb23a  (7 bytes)
DATA_partitura_B233:
	defb 07bh,07bh,06bh,06bh,05bh,05bh,03bh	; b233

; ----------------------------------------------------------------------
; DATOS partitura_B23A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (38 bytes)
;   0xb23a..0xb260  (38 bytes)
DATA_partitura_B23A:
	defb 03bh,0fbh,002h,0feh,001h,0f1h,089h,00dh,001h,00ah,0e9h,009h,0eah,00eh,0edh,094h	; b23a  ................
	defb 0ebh,087h,027h,0f1h,0dbh,004h,0f0h,00dh,072h,0f5h,0d3h,009h,06dh,0d4h,0b9h,0d3h	; b24a  ..'.....r...m...
	defb 05dh,0fbh,002h,0fdh,01bh,0b2h	; b25a

; ----------------------------------------------------------------------
; DATOS partitura_B260: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (26 bytes)
;   0xb260..0xb27a  (26 bytes)
DATA_partitura_B260:
	defb 0feh,001h,0e9h,009h,0c2h,0eeh,083h,0f2h,001h,0eah,00ah,0edh,093h,0ebh,081h,027h	; b260  ...............'
	defb 0f1h,0dbh,003h,0f0h,00dh,074h,0d4h,07bh,07bh,06bh	; b270  .....t.{{k

; ----------------------------------------------------------------------
; DATOS partitura_B27A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (14 bytes)
;   0xb27a..0xb288  (14 bytes)
DATA_partitura_B27A:
	defb 06bh,05bh,05bh,03bh,03bh,07bh,07bh,06bh,06bh,05bh,05bh,03bh,038h,0feh	; b27a  k[[..{{kk[[.8.

; ----------------------------------------------------------------------
; DATOS partitura_B288: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (33 bytes)
;   0xb288..0xb2a9  (33 bytes)
DATA_partitura_B288:
	defb 001h,0f2h,001h,0e9h,009h,0eeh,082h,0eah,008h,0edh,094h,0ebh,087h,027h,0f1h,0dbh	; b288  .............'..
	defb 004h,0f0h,00dh,071h,0f5h,0d3h,069h,0d2h,00dh,0d3h,059h,0bdh,0fbh,002h,0fdh,060h	; b298  ...q..i...Y....`
	defb 0b2h	; b2a8

; ----------------------------------------------------------------------
; DATOS partitura_B2A9: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (34 bytes)
;   0xb2a9..0xb2cb  (34 bytes)
DATA_partitura_B2A9:
	defb 0feh,001h,0f8h,047h,0e9h,009h,0eah,00ch,0ebh,00ah,03bh,071h,0dbh,002h,0d8h,0f0h	; b2a9  ...G.......q....
	defb 000h,0f5h,0d2h,001h,031h,0a1h,091h,0a1h,031h,001h,031h,091h,021h,031h,081h,001h	; b2b9  ....1...1.1.!1..
	defb 031h,0a1h	; b2c9

; ----------------------------------------------------------------------
; DATOS partitura_B2CB: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xb2cb..0xb2ce  (3 bytes)
DATA_partitura_B2CB:
	defb 021h,031h,091h	; b2cb

; ----------------------------------------------------------------------
; DATOS partitura_B2CE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (56 bytes)
;   0xb2ce..0xb306  (56 bytes)
DATA_partitura_B2CE:
	defb 001h,021h,031h,061h,091h,0d1h,001h,0d3h,081h,0d2h,001h,051h,0d3h,071h,081h,0d2h	; b2ce  .!1a.......Q.q..
	defb 001h,021h,051h,081h,071h,081h,021h,001h,031h,0a1h,001h,031h,091h,021h,031h,071h	; b2de  .!Q.q.!.1..1.!1q
	defb 0a1h,001h,081h,0fbh,002h,0feh,001h,0f8h,012h,0e9h,009h,0eah,00dh,0edh,044h,0ebh	; b2ee  ..............D.
	defb 087h,037h,0f1h,0dbh,002h,0f0h,008h,081h	; b2fe  .7......

; ----------------------------------------------------------------------
; DATOS partitura_B306: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (24 bytes)
;   0xb306..0xb31e  (24 bytes)
DATA_partitura_B306:
	defb 0d1h,031h,0d2h,091h,0d1h,005h,031h,0d2h,091h,0d1h,009h,021h,0d2h,081h,0b5h,0d1h	; b306  .1....1....!....
	defb 021h,0d2h,081h,0b9h,0d1h,031h,0d2h,091h	; b316  !....1..

; ----------------------------------------------------------------------
; DATOS partitura_B31E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (19 bytes)
;   0xb31e..0xb331  (19 bytes)
DATA_partitura_B31E:
	defb 0d1h,005h,031h,0d2h,091h,0d1h,009h,021h,0d2h,081h,0b5h,0d1h,021h,0d2h,081h,059h	; b31e  ..1....!....!..Y
	defb 0fdh,0a9h,0b2h	; b32e

; ----------------------------------------------------------------------
; DATOS partitura_B331: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (15 bytes)
;   0xb331..0xb340  (15 bytes)
DATA_partitura_B331:
	defb 0feh,001h,0f8h,047h,0e9h,009h,0c2h,0d8h,0f0h,000h,0eeh,081h,0eah,005h,0ebh	; b331  ...G...........

; ----------------------------------------------------------------------
; DATOS partitura_B340: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (78 bytes)
;   0xb340..0xb38e  (78 bytes)
DATA_partitura_B340:
	defb 007h,017h,0b1h,0dbh,002h,0f5h,0d2h,001h,031h,0a1h,091h,0a1h,031h,001h,031h,091h	; b340  ........1...1.1.
	defb 021h,031h,081h,001h,031h,0a1h,021h,031h,091h,001h,021h,031h,061h,091h,0d1h,001h	; b350  !1..1.!1..!1a...
	defb 0d3h,081h,0d2h,001h,051h,0d3h,071h,081h,0d2h,001h,021h,051h,081h,071h,081h,021h	; b360  ....Q.q...!Q.q.!
	defb 001h,031h,0a1h,001h,031h,091h,021h,031h,071h,0a1h,001h,081h,0fbh,002h,0feh,001h	; b370  .1..1.!1q.......
	defb 0f8h,012h,0e9h,009h,0eeh,081h,0eah,007h,0edh,031h,0ebh,087h,017h,0f1h	; b380  .........1....

; ----------------------------------------------------------------------
; DATOS partitura_B38E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xb38e..0xb391  (3 bytes)
DATA_partitura_B38E:
	defb 0dbh,002h,0f0h	; b38e

; ----------------------------------------------------------------------
; DATOS partitura_B391: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (5 bytes)
;   0xb391..0xb396  (5 bytes)
DATA_partitura_B391:
	defb 008h,081h,0d1h,031h,0d2h	; b391

; ----------------------------------------------------------------------
; DATOS partitura_B396: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (15 bytes)
;   0xb396..0xb3a5  (15 bytes)
DATA_partitura_B396:
	defb 091h,0d1h,005h,031h,0d2h,091h,0d1h,009h,021h,0d2h,081h,0b5h,0d1h,021h,0d2h	; b396  ...1....!....!.

; ----------------------------------------------------------------------
; DATOS partitura_B3A5: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xb3a5..0xb3be  (25 bytes)
DATA_partitura_B3A5:
	defb 081h,0b9h,0d1h,031h,0d2h,091h,0d1h,005h,031h,0d2h,091h,0d1h,009h,021h,0d2h,091h	; b3a5  ...1....1....!..
	defb 0b5h,0d1h,021h,0d2h,081h,056h,0fdh,031h,0b3h	; b3b5  ..!..V.1.

; ----------------------------------------------------------------------
; DATOS partitura_B3BE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (12 bytes)
;   0xb3be..0xb3ca  (12 bytes)
DATA_partitura_B3BE:
	defb 0feh,001h,0e9h,012h,0eah,006h,0d4h,09fh,097h,0d3h,053h,04bh	; b3be  ..........SK

; ----------------------------------------------------------------------
; DATOS partitura_B3CA: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xb3ca..0xb3dc  (18 bytes)
DATA_partitura_B3CA:
	defb 05fh,097h,0d4h,09fh,0d3h,06fh,067h,027h,0d4h,04fh,05fh,04fh,047h,057h,04fh,0fdh	; b3ca  _....og'.O_OGWO.
	defb 0beh,0b3h	; b3da

; ----------------------------------------------------------------------
; DATOS partitura_B3DC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (33 bytes)
;   0xb3dc..0xb3fd  (33 bytes)
DATA_partitura_B3DC:
	defb 0feh,001h,0e9h,012h,0eeh,084h,0ech,0eah,005h,0d4h,09fh,097h,0d3h,053h,04bh,05fh	; b3dc  .............SK_
	defb 097h,0d4h,09fh,0d3h,06fh,067h,027h,0d4h,04fh,05fh,04fh,047h,057h,04fh,0fdh,0dch	; b3ec  ....og'.O_OGWO..
	defb 0b3h	; b3fc

; ----------------------------------------------------------------------
; DATOS partitura_B3FD: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (30 bytes)
;   0xb3fd..0xb41b  (30 bytes)
DATA_partitura_B3FD:
	defb 0feh,001h,0e9h,012h,0eeh,004h,0ech,0c1h,0eah,004h,0d4h,09fh,097h,0d3h,053h,04bh	; b3fd  ..............SK
	defb 05fh,097h,0d4h,09fh,0d3h,06fh,067h,027h,0d4h,04fh,05fh,04fh,047h,057h	; b40d  _....og'.O_OGW

; ----------------------------------------------------------------------
; DATOS partitura_B41B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xb41b..0xb41f  (4 bytes)
DATA_partitura_B41B:
	defb 04dh,0fdh,0fdh,0b3h	; b41b

; ----------------------------------------------------------------------
; DATOS partitura_B41F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (63 bytes)
;   0xb41f..0xb45e  (63 bytes)
DATA_partitura_B41F:
	defb 0feh,001h,0f8h,04bh,0e9h,012h,0eah,00fh,0edh,042h,0ebh,087h,017h,0f1h,0dbh,003h	; b41f  ...K.....B......
	defb 0d5h,09dh,0ech,0eah,005h,099h,0edh,045h,0ebh,087h,038h,0f1h,0dbh,004h,0eah,00fh	; b42f  .......E..8.....
	defb 0d4h,053h,04bh,05dh,0ech,0eah,005h,051h,0eah,00fh,0edh,045h,0ebh,087h,037h,0f1h	; b43f  .SK]...Q...E..7.
	defb 097h,0d5h,09dh,0ech,0eah,005h,091h,0eah,00fh,0edh,045h,0ebh,087h,037h,0f1h	; b44f  ..........E..7.

; ----------------------------------------------------------------------
; DATOS partitura_B45E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (81 bytes)
;   0xb45e..0xb4af  (81 bytes)
DATA_partitura_B45E:
	defb 0d4h,06dh,0ech,0eah,008h,069h,0feh,001h,0f8h,04bh,0e9h,012h,0eah,00fh,0edh,045h	; b45e  .m...i...K.....E
	defb 0ebh,087h,037h,0f1h,0dbh,004h,027h,0d5h,04dh,0ech,0eah,005h,041h,0eah,00fh,0edh	; b46e  ..7...'.M...A...
	defb 045h,0ebh,087h,037h,0f1h,05dh,0ech,0eah,005h,051h,0eah,00fh,0edh,045h,0ebh,087h	; b47e  E..7.]...Q...E..
	defb 037h,0f1h,04dh,0ech,0eah,008h,049h,0eah,00fh,0edh,035h,0ebh,087h,037h,0f1h,0dbh	; b48e  7.M...I...5..7..
	defb 004h,057h,0dbh,006h,047h,0ech,0eah,008h,041h,0eah,007h,041h,0eah,006h,041h,0eah	; b49e  .W..G...A..A..A.
	defb 005h	; b4ae

; ----------------------------------------------------------------------
; DATOS partitura_B4AF: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xb4af..0xb4b3  (4 bytes)
DATA_partitura_B4AF:
	defb 041h,0fdh,01fh,0b4h	; b4af

; ----------------------------------------------------------------------
; DATOS partitura_B4B3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (38 bytes)
;   0xb4b3..0xb4d9  (38 bytes)
DATA_partitura_B4B3:
	defb 0feh,001h,0f1h,089h,025h,001h,018h,0e9h,012h,0ech,0eah,00fh,0edh,0a1h,0ebh,087h	; b4b3  ....%...........
	defb 037h,0a1h,0dbh,003h,0f0h,00bh,051h,0d1h,007h,0edh,017h,0d2h,0bbh,063h,093h,087h	; b4c3  7.....Q......c..
	defb 091h,0b1h,0d1h,007h,027h,0dbh	; b4d3

; ----------------------------------------------------------------------
; DATOS partitura_B4D9: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (57 bytes)
;   0xb4d9..0xb512  (57 bytes)
DATA_partitura_B4D9:
	defb 004h,04fh,0f6h,0f8h,025h,0ech,0e9h,001h,0f0h,00bh,002h,0e9h,012h,0eah,002h,041h	; b4d9  .O..%..........A
	defb 0feh,001h,0f1h,089h,025h,001h,018h,0e9h,012h,0f0h,00bh,051h,0eah,00fh,0edh,017h	; b4e9  ....%......Q....
	defb 0ebh,087h,037h,0f1h,0dbh,003h,0d1h,021h,001h,0d2h,0b1h,095h,0b1h,081h,091h,0e9h	; b4f9  ..7....!........
	defb 004h,0b5h,0d1h,005h,025h,0e9h,012h,043h,0d2h	; b509  ....%..C.

; ----------------------------------------------------------------------
; DATOS partitura_B512: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xb512..0xb514  (2 bytes)
DATA_partitura_B512:
	defb 09dh,0e9h	; b512

; ----------------------------------------------------------------------
; DATOS partitura_B514: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (49 bytes)
;   0xb514..0xb545  (49 bytes)
DATA_partitura_B514:
	defb 001h,0f0h,00bh,002h,0e9h,012h,0f6h,0f8h,025h,0ech,0eah,003h,091h,0eah,002h,091h	; b514  ........%.......
	defb 0eah,001h,091h,0f1h,089h,025h,001h,018h,0f0h,00bh,051h,0eah,00fh,0edh,017h,0ebh	; b524  .....%....Q.....
	defb 087h,037h,0f1h,0dbh,004h,087h,09dh,0e9h,001h,0f0h,00bh,002h,0e9h,012h,0f6h,0f8h	; b534  .7..............
	defb 025h	; b544

; ----------------------------------------------------------------------
; DATOS partitura_B545: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (70 bytes)
;   0xb545..0xb58b  (70 bytes)
DATA_partitura_B545:
	defb 0ech,0eah,003h,091h,0f0h,00bh,051h,0f1h,089h,025h,001h,018h,0eah,00fh,0edh,017h	; b545  ......Q..%......
	defb 0ebh,087h,037h,0f1h,04dh,0e9h,001h,0f0h,00bh,002h,0e9h,012h,0f6h,0f8h,025h,0ech	; b555  ..7.M.........%.
	defb 0eah,003h,041h,0f0h,00bh,051h,0f1h,089h,025h,001h,018h,0eah,00fh,0edh,017h,0ebh	; b565  ..A..Q..%.......
	defb 087h,037h,0f1h,05fh,04dh,0e9h,001h,0f0h,00bh,002h,0e9h,012h,0ech,0eah,003h,0f6h	; b575  .7._M...........
	defb 0f8h,025h,041h,0fdh,0b3h,0b4h	; b585

; ----------------------------------------------------------------------
; DATOS partitura_B58B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xb58b..0xb593  (8 bytes)
DATA_partitura_B58B:
	defb 0feh,001h,0e9h,009h,0eeh,081h,0c2h,0f2h	; b58b  ........

; ----------------------------------------------------------------------
; DATOS partitura_B593: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (26 bytes)
;   0xb593..0xb5ad  (26 bytes)
DATA_partitura_B593:
	defb 000h,0f2h,001h,0e9h,012h,0eah,00ah,0f0h,00bh,052h,0edh,0a1h,0ebh,087h,016h,0b1h	; b593  .........R......
	defb 0dbh,004h,0d1h,007h,0d2h,0bbh,063h,093h,087h,091h	; b5a3  ......c...

; ----------------------------------------------------------------------
; DATOS partitura_B5AD: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (47 bytes)
;   0xb5ad..0xb5dc  (47 bytes)
DATA_partitura_B5AD:
	defb 0b1h,0d1h,007h,027h,04fh,0f8h,002h,041h,021h,001h,0f2h,002h,0d2h,0b1h,095h,0b1h	; b5ad  ...'O..A!.......
	defb 081h,091h,0e9h,004h,0b5h,0d1h,005h,025h,0e9h,012h,043h,0d2h,09fh,093h,087h,09fh	; b5bd  .......%..C.....
	defb 04fh,05fh,0dbh,006h,047h,0e9h,001h,0f0h,00bh,002h,0e9h,012h,0ech,0eah,006h	; b5cd  O_..G..........

; ----------------------------------------------------------------------
; DATOS partitura_B5DC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xb5dc..0xb5e0  (4 bytes)
DATA_partitura_B5DC:
	defb 041h,0eah,005h,041h	; b5dc

; ----------------------------------------------------------------------
; DATOS partitura_B5E0: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (9 bytes)
;   0xb5e0..0xb5e9  (9 bytes)
DATA_partitura_B5E0:
	defb 0eah,004h,041h,0eah,003h,041h,0fdh,092h,0b5h	; b5e0  ..A..A...

; ----------------------------------------------------------------------
; DATOS partitura_B5E9: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xb5e9..0xb602  (25 bytes)
DATA_partitura_B5E9:
	defb 0feh,001h,0f8h,002h,0e9h,012h,0eah,009h,0edh,071h,0ebh,087h,037h,0a1h,0dbh,003h	; b5e9  .........q..7...
	defb 0f0h,00bh,031h,0d2h,0c2h,044h,0edh,035h,067h	; b5f9  ..1..D.5g

; ----------------------------------------------------------------------
; DATOS partitura_B602: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xb602..0xb61b  (25 bytes)
DATA_partitura_B602:
	defb 037h,033h,0d3h,0bbh,0d2h,09dh,0ech,0eah,003h,091h,0eah,009h,0edh,035h,0ebh,087h	; b602  73...........5..
	defb 037h,0a1h,0b7h,0d1h,0ebh,089h,017h,0a1h,00dh	; b612  7........

; ----------------------------------------------------------------------
; DATOS partitura_B61B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (43 bytes)
;   0xb61b..0xb646  (43 bytes)
DATA_partitura_B61B:
	defb 0ech,0eah,003h,001h,0eah,009h,0edh,035h,0ebh,087h,037h,0a1h,0ebh,087h,037h,0a1h	; b61b  .......5..7...7.
	defb 0d2h,04dh,0ech,0eah,004h,045h,0eah,003h,043h,0feh,001h,0f8h,002h,0e9h,012h,0eah	; b62b  .M...E..C.......
	defb 009h,0edh,035h,0ebh,087h,037h,0a1h,05fh,0ech,0eah,004h	; b63b  ..5..7._...

; ----------------------------------------------------------------------
; DATOS partitura_B646: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (22 bytes)
;   0xb646..0xb65c  (22 bytes)
DATA_partitura_B646:
	defb 057h,0eah,009h,0edh,035h,0ebh,087h,037h,0a1h,0dbh,003h,02dh,0ech,0eah,002h,021h	; b646  W...5..7...-...!
	defb 0eah,009h,0edh,035h,0ebh,087h	; b656

; ----------------------------------------------------------------------
; DATOS partitura_B65C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xb65c..0xb667  (11 bytes)
DATA_partitura_B65C:
	defb 037h,0a1h,0d3h,0b3h,0d2h,00bh,027h,0dbh,005h,0d3h,0bdh	; b65c  7.....'....

; ----------------------------------------------------------------------
; DATOS partitura_B667: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (13 bytes)
;   0xb667..0xb674  (13 bytes)
DATA_partitura_B667:
	defb 0ech,0eah,004h,0b5h,0eah,003h,0b1h,0eah,002h,0b1h,0fdh,0e9h,0b5h	; b667  .............

; ----------------------------------------------------------------------
; DATOS partitura_B674: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (46 bytes)
;   0xb674..0xb6a2  (46 bytes)
DATA_partitura_B674:
	defb 0feh,001h,0f8h,002h,0e9h,012h,0eeh,082h,0c1h,0eah,005h,0edh,032h,0ebh,087h,017h	; b674  ............2...
	defb 0f1h,0dbh,002h,0f0h,00bh,031h,0d2h,0c3h,043h,067h,037h,033h,0d3h,0bbh,0d2h,095h	; b684  .....1..Cg73....
	defb 0efh,0eah,007h,0edh,034h,0ebh,087h,017h,0b1h,0dbh,004h,02dh,0ech,0eah	; b694  ....4......-..

; ----------------------------------------------------------------------
; DATOS partitura_B6A2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (27 bytes)
;   0xb6a2..0xb6bd  (27 bytes)
DATA_partitura_B6A2:
	defb 003h,023h,0eeh,082h,0eah,005h,0edh,032h,0ebh,089h,017h,0a1h,0d1h,00dh,0efh,0feh	; b6a2  .#.....2........
	defb 001h,0f8h,002h,0e9h,012h,0ebh,087h,017h,0a1h,0eah,008h	; b6b2  ...........

; ----------------------------------------------------------------------
; DATOS partitura_B6BD: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xb6bd..0xb6c4  (7 bytes)
DATA_partitura_B6BD:
	defb 0d2h,00fh,0ech,0eah,004h,007h,0eah	; b6bd

; ----------------------------------------------------------------------
; DATOS partitura_B6C4: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xb6c4..0xb6dd  (25 bytes)
DATA_partitura_B6C4:
	defb 008h,0edh,032h,0ebh,087h,017h,0f1h,02dh,0ech,0eah,004h,02bh,0eeh,082h,0eah,005h	; b6c4  ..2....-...+....
	defb 0edh,032h,0ebh,087h,017h,0a1h,0dbh,003h,02dh	; b6d4  .2......-

; ----------------------------------------------------------------------
; DATOS partitura_B6DD: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xb6dd..0xb6ef  (18 bytes)
DATA_partitura_B6DD:
	defb 0ech,0eah,003h,021h,0eah,005h,0edh,032h,0ebh,087h,017h,0f1h,0d3h,0b3h,0d2h,00bh	; b6dd  ...!...2........
	defb 027h,0d3h	; b6ed

; ----------------------------------------------------------------------
; DATOS partitura_B6EF: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x9F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xb6ef..0xb708  (25 bytes)
DATA_partitura_B6EF:
	defb 0b5h,0efh,0eah,008h,0dbh,005h,087h,0f0h,000h,0ech,0eah,005h,081h,0eah,004h,081h	; b6ef  ................
	defb 0eah,003h,081h,0eah,002h,081h,0fdh,074h,0b6h	; b6ff  .......t.

; ----------------------------------------------------------------------
; DATOS partitura_B708: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x89 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (32 bytes)
;   0xb708..0xb728  (32 bytes)
DATA_partitura_B708:
	defb 0feh,004h,0e9h,006h,0d0h,0b1h,0adh,0b1h,0a7h,021h,001h,021h,0b1h,0adh,0b1h,0a5h	; b708  .........!.!....
	defb 0d1h,090h,090h,080h,080h,070h,070h,060h,060h,0d0h,0b1h,0adh,0b1h,0a7h,021h,001h	; b718  .....pp``.....!.

; ----------------------------------------------------------------------
; DATOS partitura_B728: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x89 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xb728..0xb733  (11 bytes)
DATA_partitura_B728:
	defb 021h,0b1h,0adh,0b1h,0a1h,0d1h,0e9h,001h,063h,063h,063h	; b728  !.......ccc

; ----------------------------------------------------------------------
; DATOS partitura_B733: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x89 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (69 bytes)
;   0xb733..0xb778  (69 bytes)
DATA_partitura_B733:
	defb 063h,063h,063h,073h,073h,073h,073h,073h,073h,083h,083h,083h,093h,093h,093h,0feh	; b733  cccssssss.......
	defb 004h,0e9h,006h,0d0h,0b1h,0adh,0b1h,0a7h,021h,001h,021h,0b1h,0adh,0b1h,0a5h,0d1h	; b743  ........!.!.....
	defb 090h,090h,080h,080h,070h,070h,060h,060h,0d0h,0b1h,0adh,0b1h,0a7h,021h,001h,021h	; b753  ....pp``.....!.!
	defb 0b1h,0adh,0b1h,0a1h,0d1h,0e9h,001h,063h,063h,063h,063h,063h,063h,073h,073h,073h	; b763  .......ccccccsss
	defb 073h,073h,073h,083h,083h	; b773

; ----------------------------------------------------------------------
; DATOS partitura_B778: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x89 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xb778..0xb77f  (7 bytes)
DATA_partitura_B778:
	defb 083h,093h,093h,093h,0fdh,008h,0b7h	; b778

; ----------------------------------------------------------------------
; DATOS partitura_B77F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x89 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (84 bytes)
;   0xb77f..0xb7d3  (84 bytes)
DATA_partitura_B77F:
	defb 0feh,001h,0eeh,082h,0e9h,006h,0c1h,0d6h,004h,001h,0eah,006h,0ebh,009h,026h,001h	; b77f  ..............&.
	defb 0f5h,0d2h,090h,0d1h,000h,030h,060h,030h,000h,0d2h,090h,0d1h,000h,030h,070h,060h	; b78f  .....0`0.....0p`
	defb 030h,0d2h,090h,0d1h,000h,030h,060h,030h,000h,070h,060h,030h,090h,070h,060h,0d2h	; b79f  0....0`0.p`0.p`.
	defb 090h,0d1h,000h,030h,060h,030h,000h,0d2h,090h,0d1h,000h,0fbh,003h,0d2h,090h,0d1h	; b7af  ...0`0..........
	defb 000h,030h,060h,030h,000h,0d2h,090h,0d1h,000h,030h,070h,060h,030h,0d2h,090h,0d1h	; b7bf  .0`0.....0p`0...
	defb 000h,030h,060h,030h	; b7cf

; ----------------------------------------------------------------------
; DATOS partitura_B7D3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x89 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (42 bytes)
;   0xb7d3..0xb7fd  (42 bytes)
DATA_partitura_B7D3:
	defb 000h,070h,060h,030h,090h,070h,060h,0d2h,090h,0d1h,000h,030h,060h,030h,000h,0feh	; b7d3  .p`0.p`....0`0..
	defb 001h,0e9h,006h,0eeh,082h,0c1h,0d6h,004h,001h,0eah,006h,0ebh,009h,026h,001h,0f5h	; b7e3  .............&..
	defb 0d2h,0a0h,0d1h,010h,040h,070h,040h,010h,0d2h,0a0h	; b7f3  ....@p@...

; ----------------------------------------------------------------------
; DATOS partitura_B7FD: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x89 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (33 bytes)
;   0xb7fd..0xb81e  (33 bytes)
DATA_partitura_B7FD:
	defb 0d1h,010h,040h,080h,070h,040h,0d2h,0a0h,0d1h,010h,040h,070h,040h,010h,080h,070h	; b7fd  ..@.p@....@p@..p
	defb 040h,0a0h,080h,070h,0d2h,0a0h,0d1h,010h,040h,070h,040h,010h,0d2h,0a0h,0d1h,010h	; b80d  @..p....@p@.....
	defb 0fbh	; b81d

; ----------------------------------------------------------------------
; DATOS partitura_B81E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x89 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (20 bytes)
;   0xb81e..0xb832  (20 bytes)
DATA_partitura_B81E:
	defb 003h,0d2h,0a0h,0d1h,010h,040h,070h,040h,010h,0d2h,0a0h,0d1h,010h,040h,080h,070h	; b81e  .....@p@.....@.p
	defb 040h,0d2h,0a0h,0d1h	; b82e

; ----------------------------------------------------------------------
; DATOS partitura_B832: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x89 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xb832..0xb833  (1 bytes)
DATA_partitura_B832:
	defb 010h	; b832

; ----------------------------------------------------------------------
; DATOS partitura_B833: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x89 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xb833..0xb839  (6 bytes)
DATA_partitura_B833:
	defb 040h,070h,040h,010h,080h,070h	; b833

; ----------------------------------------------------------------------
; DATOS partitura_B839: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x89 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xb839..0xb83a  (1 bytes)
DATA_partitura_B839:
	defb 040h	; b839

; ----------------------------------------------------------------------
; DATOS partitura_B83A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x89 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (10 bytes)
;   0xb83a..0xb844  (10 bytes)
DATA_partitura_B83A:
	defb 0a0h,080h,070h,0d2h,0a0h,0d1h,010h,040h,070h,040h	; b83a  ..p....@p@

; ----------------------------------------------------------------------
; DATOS partitura_B844: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x89 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xb844..0xb848  (4 bytes)
DATA_partitura_B844:
	defb 010h,0fdh,07fh,0b7h	; b844

; ----------------------------------------------------------------------
; DATOS partitura_B848: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x89 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xb848..0xb859  (17 bytes)
DATA_partitura_B848:
	defb 0feh,001h,0f6h,0f8h,00ah,0e9h,006h,0f0h,00fh,011h,0d6h,050h,001h,0eah,00ah,0ebh	; b848  ...........P....
	defb 00ah	; b858

; ----------------------------------------------------------------------
; DATOS partitura_B859: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x89 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (39 bytes)
;   0xb859..0xb880  (39 bytes)
DATA_partitura_B859:
	defb 02bh,002h,0f5h,0d1h,031h,031h,031h,031h,031h,031h,031h,031h,0fbh,008h,0feh,001h	; b859  +...11111111....
	defb 0f8h,00ah,0e9h,006h,0f0h,00fh,011h,0eah,00ah,0ebh,00ah,02bh,002h,0d6h,050h,001h	; b869  ...........+..P.
	defb 0f5h,0d1h,041h,041h,041h,041h,041h	; b879

; ----------------------------------------------------------------------
; DATOS partitura_B880: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x89 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xb880..0xb888  (8 bytes)
DATA_partitura_B880:
	defb 041h,041h,041h,0fbh,008h,0fdh,048h,0b8h	; b880  AAA...H.

; ----------------------------------------------------------------------
; DATOS partitura_B888: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x89 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xb888..0xb890  (8 bytes)
DATA_partitura_B888:
	defb 0feh,001h,0e9h,006h,0f4h,054h,052h,052h	; b888  .....TRR

; ----------------------------------------------------------------------
; DATOS partitura_B890: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x89 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xb890..0xb896  (6 bytes)
DATA_partitura_B890:
	defb 003h,0d6h,004h,001h,0eah,007h	; b890

; ----------------------------------------------------------------------
; DATOS partitura_B896: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x89 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (22 bytes)
;   0xb896..0xb8ac  (22 bytes)
DATA_partitura_B896:
	defb 0ebh,00ah,027h,003h,0f5h,0d2h,090h,0d1h,000h,030h,060h,030h,000h,0d2h,090h,0d1h	; b896  ..'......0`0....
	defb 000h,030h,070h,060h,030h,0d2h	; b8a6

; ----------------------------------------------------------------------
; DATOS partitura_B8AC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x89 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xb8ac..0xb8af  (3 bytes)
DATA_partitura_B8AC:
	defb 090h,0d1h,000h	; b8ac

; ----------------------------------------------------------------------
; DATOS partitura_B8AF: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x89 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (32 bytes)
;   0xb8af..0xb8cf  (32 bytes)
DATA_partitura_B8AF:
	defb 030h,060h,030h,000h,070h,060h,030h,090h,070h,060h,0d2h,090h,0d1h,000h,030h,060h	; b8af  0`0.p`0.p`....0`
	defb 030h,000h,0d2h,090h,0d1h,000h,0fbh,003h,0d2h,090h,0d1h,000h,030h,060h,030h,000h	; b8bf  0...........0`0.

; ----------------------------------------------------------------------
; DATOS partitura_B8CF: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x89 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xb8cf..0xb8d2  (3 bytes)
DATA_partitura_B8CF:
	defb 0d2h,090h,0d1h	; b8cf

; ----------------------------------------------------------------------
; DATOS partitura_B8D2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x89 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (33 bytes)
;   0xb8d2..0xb8f3  (33 bytes)
DATA_partitura_B8D2:
	defb 000h,030h,070h,060h,030h,0d2h,090h,0d1h,000h,030h,060h,030h,000h,070h,060h,030h	; b8d2  .0p`0....0`0.p`0
	defb 090h,070h,060h,0d2h,090h,0d1h,000h,030h,060h,030h,000h,0d2h,090h,0d1h,000h,0feh	; b8e2  .p`....0`0......
	defb 001h	; b8f2

; ----------------------------------------------------------------------
; DATOS partitura_B8F3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x89 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xb8f3..0xb8f5  (2 bytes)
DATA_partitura_B8F3:
	defb 0e9h,006h	; b8f3

; ----------------------------------------------------------------------
; DATOS partitura_B8F5: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x89 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (38 bytes)
;   0xb8f5..0xb91b  (38 bytes)
DATA_partitura_B8F5:
	defb 0f4h,054h,052h,052h,003h,0d6h,004h,001h,0eah,007h,0ebh,00ah,027h,003h,0f5h,0d2h	; b8f5  .TRR........'...
	defb 0a0h,0d1h,010h,040h,070h,040h,010h,0d2h,0a0h,0d1h,010h,040h,080h,070h,040h,0d2h	; b905  ...@p@.....@.p@.
	defb 0a0h,0d1h,010h,040h,070h,040h	; b915

; ----------------------------------------------------------------------
; DATOS partitura_B91B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x89 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xb91b..0xb91f  (4 bytes)
DATA_partitura_B91B:
	defb 010h,080h,070h,040h	; b91b

; ----------------------------------------------------------------------
; DATOS partitura_B91F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x89 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xb91f..0xb930  (17 bytes)
DATA_partitura_B91F:
	defb 0a0h,080h,070h,0d2h,0a0h,0d1h,010h,040h,070h,040h,010h,0d2h,0a0h,0d1h,010h,0fbh	; b91f  ..p....@p@......
	defb 003h	; b92f

; ----------------------------------------------------------------------
; DATOS partitura_B930: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x89 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (27 bytes)
;   0xb930..0xb94b  (27 bytes)
DATA_partitura_B930:
	defb 0d2h,0a0h,0d1h,010h,040h,070h,040h,010h,0d2h,0a0h,0d1h,010h,040h,080h,070h,040h	; b930  ....@p@.....@.p@
	defb 0d2h,0a0h,0d1h,010h,040h,070h,040h,010h,080h,070h,040h	; b940  ....@p@..p@

; ----------------------------------------------------------------------
; DATOS partitura_B94B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x89 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xb94b..0xb95d  (18 bytes)
DATA_partitura_B94B:
	defb 0a0h,080h,070h,0d2h,0a0h,0d1h,010h,040h,070h,040h,010h,0d2h,0a0h,0d1h,010h,0fdh	; b94b  ..p....@p@......
	defb 088h,0b8h	; b95b

; ----------------------------------------------------------------------
; DATOS partitura_B95D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x89 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (32 bytes)
;   0xb95d..0xb97d  (32 bytes)
DATA_partitura_B95D:
	defb 0feh,001h,0f8h,04bh,0e9h,006h,0eah,00dh,0ebh,009h,027h,071h,0dbh,002h,0f0h,00fh	; b95d  ...K......'q....
	defb 056h,0d6h,070h,003h,0d4h,095h,065h,0d3h,035h,02dh,0d4h,095h,065h,0d3h,035h,025h	; b96d  V.p...e.5-..e.5%

; ----------------------------------------------------------------------
; DATOS partitura_B97D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x89 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xb97d..0xb97e  (1 bytes)
DATA_partitura_B97D:
	defb 067h	; b97d

; ----------------------------------------------------------------------
; DATOS partitura_B97E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x89 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xb97e..0xb990  (18 bytes)
DATA_partitura_B97E:
	defb 0d4h,095h,065h,0d3h,035h,02dh,0d4h,095h,065h,0d3h,035h,025h,063h,053h,0feh,001h	; b97e  ..e.5-..e.5%cS..
	defb 0f8h,04bh	; b98e

; ----------------------------------------------------------------------
; DATOS partitura_B990: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x89 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (46 bytes)
;   0xb990..0xb9be  (46 bytes)
DATA_partitura_B990:
	defb 0e9h,006h,0eah,00dh,0ebh,009h,027h,071h,0dbh,002h,0f0h,00fh,056h,0d6h,060h,003h	; b990  ......'q....V.`.
	defb 0d4h,0a5h,095h,0d3h,045h,03dh,0d4h,0a5h,095h,0d3h,045h,035h,077h,0d4h,0a5h,095h	; b9a0  ....E=....E5w...
	defb 0d3h,045h,03dh,0d4h,0a5h,095h,0d3h,045h,035h,073h,063h,0fdh,05dh,0b9h	; b9b0  .E=....E5sc.].

; ----------------------------------------------------------------------
; DATOS partitura_B9BE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x89 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (23 bytes)
;   0xb9be..0xb9d5  (23 bytes)
DATA_partitura_B9BE:
	defb 0feh,001h,0f8h,04bh,0e9h,006h,0eeh,088h,0ech,0eah,006h,0d6h,070h,003h,0f0h,00fh	; b9be  ...K........p...
	defb 056h,0d4h,097h,065h,0d3h,035h,02dh	; b9ce

; ----------------------------------------------------------------------
; DATOS partitura_B9D5: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x89 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xb9d5..0xb9d6  (1 bytes)
DATA_partitura_B9D5:
	defb 0d4h	; b9d5

; ----------------------------------------------------------------------
; DATOS partitura_B9D6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x89 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xb9d6..0xb9e7  (17 bytes)
DATA_partitura_B9D6:
	defb 095h,065h,0d3h,035h,025h,067h,0d4h,095h,065h,0d3h,035h,02dh,0d4h,095h,065h,0d3h	; b9d6  .e.5%g..e.5-..e.
	defb 035h	; b9e6

; ----------------------------------------------------------------------
; DATOS partitura_B9E7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x89 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xb9e7..0xb9ee  (7 bytes)
DATA_partitura_B9E7:
	defb 025h,063h,051h,0feh,001h,0f8h,04bh	; b9e7

; ----------------------------------------------------------------------
; DATOS partitura_B9EE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x89 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (43 bytes)
;   0xb9ee..0xba19  (43 bytes)
DATA_partitura_B9EE:
	defb 0e9h,006h,0eeh,088h,0ech,0eah,006h,0f0h,00fh,057h,0d6h,060h,003h,0d4h,0a7h,095h	; b9ee  .........W.`....
	defb 0d3h,045h,03dh,0d4h,0a5h,095h,0d3h,045h,035h,077h,0d4h,0a5h,095h,0d3h,045h,03dh	; b9fe  .E=....E5w....E=
	defb 0d4h,0a5h,095h,0d3h,045h,035h,073h,061h,0fdh,0beh,0b9h	; ba0e  ....E5sa...

; ----------------------------------------------------------------------
; DATOS partitura_BA19: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x80 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (19 bytes)
;   0xba19..0xba2c  (19 bytes)
DATA_partitura_BA19:
	defb 0feh,004h,0e9h,00bh,0f5h,0b7h,0b1h,0b5h,0a0h,0a0h,0a0h,0a0h,01bh,0fbh,003h,0b7h	; ba19  ................
	defb 0b1h,0b5h,0a0h	; ba29

; ----------------------------------------------------------------------
; DATOS partitura_BA2C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x80 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xba2c..0xba34  (8 bytes)
DATA_partitura_BA2C:
	defb 0a0h,0a0h,0a0h,015h,0b5h,0fdh,019h,0bah	; ba2c  ........

; ----------------------------------------------------------------------
; DATOS partitura_BA34: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x80 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (24 bytes)
;   0xba34..0xba4c  (24 bytes)
DATA_partitura_BA34:
	defb 0feh,001h,0eeh,081h,0e9h,00bh,0c1h,0dbh,002h,0eah,006h,0edh,022h,0ebh,087h,014h	; ba34  ............"...
	defb 0f1h,0f0h,007h,022h,0d2h,0afh,0ech,0eah	; ba44  ..."....

; ----------------------------------------------------------------------
; DATOS partitura_BA4C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x80 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (27 bytes)
;   0xba4c..0xba67  (27 bytes)
DATA_partitura_BA4C:
	defb 002h,0a1h,0ebh,087h,014h,0f1h,0eah,005h,061h,071h,0ech,0eah,002h,071h,0e9h,001h	; ba4c  ........aq...q..
	defb 0c2h,0c5h,0c4h,0c5h,0c4h,0c5h,0c4h,0c7h,0e9h,00bh,0c0h	; ba5c  ...........

; ----------------------------------------------------------------------
; DATOS partitura_BA67: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x80 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xba67..0xba6a  (3 bytes)
DATA_partitura_BA67:
	defb 0c2h,0eah,006h	; ba67

; ----------------------------------------------------------------------
; DATOS partitura_BA6A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x80 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (32 bytes)
;   0xba6a..0xba8a  (32 bytes)
DATA_partitura_BA6A:
	defb 0ebh,087h,014h,0f1h,0d2h,0afh,0ech,0eah,002h,0a1h,0ebh,087h,014h,0f1h,0eah,005h	; ba6a  ................
	defb 061h,071h,0ebh,087h,014h,0f1h,0d0h,017h,0feh,001h,0eeh,081h,0e9h,00bh,0c1h,0eah	; ba7a  aq..............

; ----------------------------------------------------------------------
; DATOS partitura_BA8A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x80 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xba8a..0xba95  (11 bytes)
DATA_partitura_BA8A:
	defb 006h,0edh,022h,0ebh,087h,014h,0f1h,0d2h,0afh,0ech,0eah	; ba8a  .."........

; ----------------------------------------------------------------------
; DATOS partitura_BA95: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x80 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (24 bytes)
;   0xba95..0xbaad  (24 bytes)
DATA_partitura_BA95:
	defb 002h,0a1h,0eah,005h,0ebh,087h,014h,0f1h,061h,071h,0ech,0eah,002h,071h,0e9h,001h	; ba95  ........aq...q..
	defb 0cah,0cah,0cah,0cah,0cfh,0c5h,0e9h,00bh	; baa5  ........

; ----------------------------------------------------------------------
; DATOS partitura_BAAD: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x80 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xbaad..0xbabe  (17 bytes)
DATA_partitura_BAAD:
	defb 0c1h,0eah,005h,0ebh,087h,014h,0f1h,0d1h,005h,0d2h,0b5h,0a5h,0dch,09bh,0fdh,034h	; baad  ...............4
	defb 0bah	; babd

; ----------------------------------------------------------------------
; DATOS partitura_BABE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x80 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (28 bytes)
;   0xbabe..0xbada  (28 bytes)
DATA_partitura_BABE:
	defb 0feh,001h,0f1h,094h,046h,001h,00ah,0d9h,0d6h,0f0h,001h,0e9h,00bh,0eah,00fh,0ebh	; babe  ....F...........
	defb 019h,047h,051h,0f5h,0d5h,047h,041h,045h,040h,070h,060h,070h	; bace  .GQ..GAE@p`p

; ----------------------------------------------------------------------
; DATOS partitura_BADA: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x80 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (15 bytes)
;   0xbada..0xbae9  (15 bytes)
DATA_partitura_BADA:
	defb 0cbh,0fbh,003h,047h,041h,045h,040h,070h,060h,070h,0c5h,0a5h,0fdh,0beh,0bah	; bada  ...GAE@p`p.....

; ----------------------------------------------------------------------
; DATOS partitura_BAE9: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x80 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (43 bytes)
;   0xbae9..0xbb14  (43 bytes)
DATA_partitura_BAE9:
	defb 0feh,001h,0f8h,00ah,0e9h,00bh,0eah,008h,0edh,031h,0ebh,087h,071h,0f1h,0f0h,007h	; bae9  .........1..q...
	defb 022h,0d2h,0afh,0ech,0eah,001h,0f0h,007h,003h,0a1h,0f0h,007h,022h,0ebh,087h,071h	; baf9  "..........."..q
	defb 0f1h,0eah,008h,061h,071h,0ech,0f0h,007h,003h,0eah,001h	; bb09  ...aq......

; ----------------------------------------------------------------------
; DATOS partitura_BB14: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x80 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xbb14..0xbb15  (1 bytes)
DATA_partitura_BB14:
	defb 071h	; bb14

; ----------------------------------------------------------------------
; DATOS partitura_BB15: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x80 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xbb15..0xbb2e  (25 bytes)
DATA_partitura_BB15:
	defb 0f8h,009h,0eeh,082h,0f0h,007h,051h,0eah,005h,0ebh,009h,027h,002h,0e9h,001h,0c2h	; bb15  ......Q....'....
	defb 0d2h,065h,0d1h,0a4h,065h,024h,0d2h,0a5h,054h	; bb25  .e..e$..T

; ----------------------------------------------------------------------
; DATOS partitura_BB2E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x80 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (27 bytes)
;   0xbb2e..0xbb49  (27 bytes)
DATA_partitura_BB2E:
	defb 0d0h,027h,0e9h,00bh,0ech,0eah,001h,020h,0c2h,0efh,0f8h,00ah,0edh,031h,0f0h,007h	; bb2e  .'..... .....1..
	defb 022h,0eah,008h,0ebh,087h,071h,0f1h,0d2h,0afh,0ech,0eah	; bb3e  "....q.....

; ----------------------------------------------------------------------
; DATOS partitura_BB49: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x80 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (32 bytes)
;   0xbb49..0xbb69  (32 bytes)
DATA_partitura_BB49:
	defb 001h,0f0h,007h,003h,0a1h,0f0h,007h,022h,0ebh,087h,071h,0f1h,0eah,008h,061h,071h	; bb49  ......."..q...aq
	defb 0f8h,009h,0edh,031h,0eah,008h,0ebh,087h,074h,0f1h,0d0h,019h,0feh,001h,0f8h,00ah	; bb59  ...1....t.......

; ----------------------------------------------------------------------
; DATOS partitura_BB69: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x80 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xbb69..0xbb71  (8 bytes)
DATA_partitura_BB69:
	defb 0e9h,00bh,0eah,008h,0edh,031h,0ebh,087h	; bb69  .....1..

; ----------------------------------------------------------------------
; DATOS partitura_BB71: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x80 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xbb71..0xbb73  (2 bytes)
DATA_partitura_BB71:
	defb 071h,0f1h	; bb71

; ----------------------------------------------------------------------
; DATOS partitura_BB73: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x80 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (40 bytes)
;   0xbb73..0xbb9b  (40 bytes)
DATA_partitura_BB73:
	defb 0d2h,0afh,0ech,0eah,001h,0f0h,007h,003h,0a1h,0eah,008h,0ebh,087h,074h,0f1h,0f0h	; bb73  .............t..
	defb 007h,022h,061h,071h,0ech,0eah,001h,0f0h,007h,003h,071h,0f8h,009h,0eah,00ah,0ebh	; bb83  ."aq......q.....
	defb 009h,047h,003h,0d2h,0e9h,001h,0f0h,007h	; bb93  .G......

; ----------------------------------------------------------------------
; DATOS partitura_BB9B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x80 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xbb9b..0xbbac  (17 bytes)
DATA_partitura_BB9B:
	defb 092h,02ah,07ah,01ah,0d1h,02ah,0d2h,0afh,0f0h,007h,093h,0ech,0eah,001h,0a5h,0e9h	; bb9b  .*z..*..........
	defb 00bh	; bbab

; ----------------------------------------------------------------------
; DATOS partitura_BBAC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x80 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (10 bytes)
;   0xbbac..0xbbb6  (10 bytes)
DATA_partitura_BBAC:
	defb 0a1h,0f8h,009h,0f0h,007h,003h,0eah,008h,0edh,034h	; bbac  .........4

; ----------------------------------------------------------------------
; DATOS partitura_BBB6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x80 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (13 bytes)
;   0xbbb6..0xbbc3  (13 bytes)
DATA_partitura_BBB6:
	defb 0ebh,087h,076h,0f1h,0d1h,005h,0d2h,0b5h,0a5h,09dh,0fdh,0e9h,0bah	; bbb6  ..v..........

; ----------------------------------------------------------------------
; DATOS partitura_BBC3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x80 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (49 bytes)
;   0xbbc3..0xbbf4  (49 bytes)
DATA_partitura_BBC3:
	defb 0feh,001h,0f8h,00ah,0e9h,00bh,0eah,008h,0edh,031h,0ebh,087h,071h,0f1h,0f0h,007h	; bbc3  .........1..q...
	defb 022h,0d2h,02fh,0ech,0eah,001h,0f0h,007h,003h,021h,0f0h,007h,022h,0ebh,087h,071h	; bbd3  "./......!.."..q
	defb 0f1h,0eah,008h,011h,021h,0ech,0f0h,007h,003h,0eah,001h,021h,0f8h,009h,0eah,00ah	; bbe3  ....!......!....
	defb 0edh	; bbf3

; ----------------------------------------------------------------------
; DATOS partitura_BBF4: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x80 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (40 bytes)
;   0xbbf4..0xbc1c  (40 bytes)
DATA_partitura_BBF4:
	defb 031h,0ebh,009h,047h,003h,0e9h,001h,0f0h,007h,093h,0d2h,065h,0d1h,0a4h,065h,024h	; bbf4  1..G.......e..e$
	defb 0d2h,0a5h,054h,0d0h,02ah,0e9h,00bh,0ech,0eah,001h,021h,0c1h,0f8h,00ah,0f0h,007h	; bc04  ..T.*.....!.....
	defb 022h,0eah,008h,0ebh,087h,071h,0f1h,0d2h	; bc14  "....q..

; ----------------------------------------------------------------------
; DATOS partitura_BC1C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x80 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (48 bytes)
;   0xbc1c..0xbc4c  (48 bytes)
DATA_partitura_BC1C:
	defb 02fh,0ech,0eah,001h,0f0h,007h,003h,021h,0f0h,007h,022h,0ebh,087h,071h,0f1h,0eah	; bc1c  /......!.."..q..
	defb 008h,011h,021h,0f8h,009h,0eah,008h,0edh,031h,0ebh,087h,074h,0f1h,0d1h,079h,0feh	; bc2c  ..!.....1..t..y.
	defb 001h,0f8h,00ah,0e9h,00bh,0eah,008h,0edh,031h,0ebh,087h,071h,0f1h,0d2h,02fh,0ech	; bc3c  ........1..q../.

; ----------------------------------------------------------------------
; DATOS partitura_BC4C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x80 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (21 bytes)
;   0xbc4c..0xbc61  (21 bytes)
DATA_partitura_BC4C:
	defb 0eah,001h,0f0h,007h,003h,021h,0eah,008h,0ebh,087h,074h,0f1h,0f0h,007h,022h,011h	; bc4c  .....!....t...".
	defb 021h,0ech,0eah,001h,0f0h	; bc5c

; ----------------------------------------------------------------------
; DATOS partitura_BC61: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x80 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (52 bytes)
;   0xbc61..0xbc95  (52 bytes)
DATA_partitura_BC61:
	defb 007h,093h,021h,0f8h,009h,0eah,00ah,0ebh,009h,047h,003h,0d2h,0e9h,001h,0c4h,06ah	; bc61  ..!......G.....j
	defb 0aah,07ah,0aah,0d1h,06fh,0f0h,007h,097h,0ech,0eah,001h,060h,0e9h,00bh,061h,0f8h	; bc71  .z..o......`..a.
	defb 009h,0f0h,007h,003h,0eah,008h,0edh,034h,0ebh,087h,076h,0f1h,0d2h,075h,065h,055h	; bc81  .......4..v..ueU
	defb 04dh,0fdh,0c3h,0bbh	; bc91

; ----------------------------------------------------------------------
; DATOS partitura_BC95: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x80 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (15 bytes)
;   0xbc95..0xbca4  (15 bytes)
DATA_partitura_BC95:
	defb 0feh,001h,0f8h,00ah,0e9h,00bh,0eah,008h,0edh,031h,0ebh,087h,071h,0f1h,0d2h	; bc95  .........1..q..

; ----------------------------------------------------------------------
; DATOS partitura_BCA4: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x80 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (19 bytes)
;   0xbca4..0xbcb7  (19 bytes)
DATA_partitura_BCA4:
	defb 06fh,0ech,0f0h,007h,022h,0eah,001h,0f0h,007h,003h,061h,0f0h,007h,022h,0ebh,087h	; bca4  o...".....a.."..
	defb 071h,0f1h,0eah	; bcb4

; ----------------------------------------------------------------------
; DATOS partitura_BCB7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x80 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (26 bytes)
;   0xbcb7..0xbcd1  (26 bytes)
DATA_partitura_BCB7:
	defb 008h,0d3h,081h,091h,0ech,0f0h,007h,003h,0eah,001h,091h,0f8h,009h,0eah,005h,0ebh	; bcb7  ................
	defb 009h,027h,002h,0e9h,001h,0f0h,007h,093h,0d3h,0a5h	; bcc7  .'........

; ----------------------------------------------------------------------
; DATOS partitura_BCD1: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x80 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xbcd1..0xbcd4  (3 bytes)
DATA_partitura_BCD1:
	defb 0d1h,024h,0d2h	; bcd1

; ----------------------------------------------------------------------
; DATOS partitura_BCD4: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x80 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (19 bytes)
;   0xbcd4..0xbce7  (19 bytes)
DATA_partitura_BCD4:
	defb 0a5h,064h,025h,0d3h,0a4h,0d1h,06ah,0ech,0eah,001h,0e9h,00bh,061h,0c1h,0f8h,00ah	; bcd4  .d%...j.....a...
	defb 0f0h,007h,022h	; bce4

; ----------------------------------------------------------------------
; DATOS partitura_BCE7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x80 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (35 bytes)
;   0xbce7..0xbd0a  (35 bytes)
DATA_partitura_BCE7:
	defb 0eah,008h,0edh,031h,0ebh,087h,071h,0f1h,0d2h,06fh,0ech,0eah,001h,0f0h,007h,003h	; bce7  ...1..q..o......
	defb 061h,0f0h,007h,022h,0ebh,087h,071h,0c1h,0eah,008h,0d3h,081h,091h,0f8h,009h,0edh	; bcf7  a.."..q.........
	defb 031h,0eah,008h	; bd07

; ----------------------------------------------------------------------
; DATOS partitura_BD0A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x80 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (46 bytes)
;   0xbd0a..0xbd38  (46 bytes)
DATA_partitura_BD0A:
	defb 0ebh,087h,074h,0f1h,0d1h,019h,0feh,001h,0f8h,00ah,0e9h,00bh,0eah,008h,0edh,031h	; bd0a  ..t............1
	defb 0ebh,087h,071h,0f1h,0d2h,06fh,0ech,0eah,001h,0f0h,007h,003h,061h,0f0h,007h,022h	; bd1a  ..q..o......a.."
	defb 0ebh,087h,071h,0f1h,0eah,008h,0d3h,081h,091h,0ech,0f0h,007h,003h,0eah	; bd2a  ..q...........

; ----------------------------------------------------------------------
; DATOS partitura_BD38: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x80 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (27 bytes)
;   0xbd38..0xbd53  (27 bytes)
DATA_partitura_BD38:
	defb 001h,091h,0f8h,009h,0f0h,007h,051h,0eah,004h,0eeh,082h,0ebh,009h,017h,001h,0e9h	; bd38  ......Q.........
	defb 001h,0c2h,0d2h,024h,065h,074h,0a5h,014h,075h,0d1h,024h	; bd48  ...$et..u.$

; ----------------------------------------------------------------------
; DATOS partitura_BD53: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x80 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (35 bytes)
;   0xbd53..0xbd76  (35 bytes)
DATA_partitura_BD53:
	defb 0d2h,0a5h,0a4h,0d1h,06ah,0ech,0eah,001h,062h,0e9h,00bh,061h,0efh,0f8h,009h,0f0h	; bd53  ....j...b..a....
	defb 007h,003h,0edh,044h,0ebh,087h,076h,0f1h,0eah,008h,0d2h,025h,015h,005h,0d3h,0bdh	; bd63  ...D..v....%....
	defb 0fdh,095h,0bch	; bd73

; ----------------------------------------------------------------------
; DATOS partitura_BD76: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA1 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (23 bytes)
;   0xbd76..0xbd8d  (23 bytes)
DATA_partitura_BD76:
	defb 0feh,004h,0e9h,003h,0d0h,0b1h,0d1h,091h,091h,060h,060h,091h,091h,095h,093h,061h	; bd76  .........``....a
	defb 071h,081h,091h,0d0h,0a1h,0a1h,0a1h	; bd86

; ----------------------------------------------------------------------
; DATOS partitura_BD8D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA1 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (12 bytes)
;   0xbd8d..0xbd99  (12 bytes)
DATA_partitura_BD8D:
	defb 0d1h,091h,091h,0d1h,091h,091h,091h,091h,081h,081h,081h,081h	; bd8d  ............

; ----------------------------------------------------------------------
; DATOS partitura_BD99: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA1 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (9 bytes)
;   0xbd99..0xbda2  (9 bytes)
DATA_partitura_BD99:
	defb 071h,071h,071h,071h,061h,061h,061h,063h,0ffh	; bd99  qqqqaaac.

; ----------------------------------------------------------------------
; DATOS partitura_BDA2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA1 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (5 bytes)
;   0xbda2..0xbda7  (5 bytes)
DATA_partitura_BDA2:
	defb 0feh,001h,0e9h,006h,0ech	; bda2

; ----------------------------------------------------------------------
; DATOS partitura_BDA7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA1 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (9 bytes)
;   0xbda7..0xbdb0  (9 bytes)
DATA_partitura_BDA7:
	defb 0c1h,0eah,006h,0d6h,030h,001h,0f0h,00fh,072h	; bda7  ....0...r

; ----------------------------------------------------------------------
; DATOS partitura_BDB0: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA1 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (22 bytes)
;   0xbdb0..0xbdc6  (22 bytes)
DATA_partitura_BDB0:
	defb 0d2h,092h,0b2h,0d1h,008h,002h,022h,031h,0eah,005h,031h,0eah,004h,031h,0eah,003h	; bdb0  ......"1..1..1..
	defb 031h,0eah,002h,031h,0eah,001h	; bdc0

; ----------------------------------------------------------------------
; DATOS partitura_BDC6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA1 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0xbdc6..0xbdc8  (2 bytes)
DATA_partitura_BDC6:
	defb 033h,0ffh	; bdc6

; ----------------------------------------------------------------------
; DATOS partitura_BDC8: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA1 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (37 bytes)
;   0xbdc8..0xbded  (37 bytes)
DATA_partitura_BDC8:
	defb 0feh,001h,0e9h,006h,0ech,0c1h,0eah,006h,0d6h,030h,001h,0f0h,00fh,072h,0d1h,032h	; bdc8  .........0...r.2
	defb 052h,068h,062h,082h,091h,0eah,005h,091h,0eah,004h,091h,0eah,003h,091h,0eah,002h	; bdd8  Rhb.............
	defb 091h,0eah,001h,093h,0ffh	; bde8

; ----------------------------------------------------------------------
; DATOS partitura_BDED: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA1 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xbded..0xbdff  (18 bytes)
DATA_partitura_BDED:
	defb 0feh,001h,0f8h,04bh,0e9h,006h,0eah,00fh,0ebh,009h,03bh,031h,0d6h,020h,002h,0f0h	; bded  ...K.......1. ..
	defb 00fh,018h	; bdfd

; ----------------------------------------------------------------------
; DATOS partitura_BDFF: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA1 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (28 bytes)
;   0xbdff..0xbe1b  (28 bytes)
DATA_partitura_BDFF:
	defb 0d5h,092h,082h,072h,061h,0ebh,009h,03bh,011h,050h,040h,021h,0d4h,090h,090h,090h	; bdff  ...ra....P@!....
	defb 0b0h,0b0h,0b0h,0ebh,009h,03bh,091h,0dbh,002h,0d3h,00fh,0ffh	; be0f  ............

; ----------------------------------------------------------------------
; DATOS partitura_BE1B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA1 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (29 bytes)
;   0xbe1b..0xbe38  (29 bytes)
DATA_partitura_BE1B:
	defb 0feh,001h,0f6h,0f8h,04bh,0e9h,006h,0eah,00fh,0ebh,009h,03bh,031h,0d6h,020h,002h	; be1b  ....K.......1. .
	defb 0f0h,00fh,018h,0d4h,092h,082h,072h,061h,0ebh,009h,03bh,011h,050h	; be2b  ......ra....P

; ----------------------------------------------------------------------
; DATOS partitura_BE38: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA1 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xbe38..0xbe3e  (6 bytes)
DATA_partitura_BE38:
	defb 040h,020h,0d5h,0b0h,090h,090h	; be38

; ----------------------------------------------------------------------
; DATOS partitura_BE3E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA1 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xbe3e..0xbe44  (6 bytes)
DATA_partitura_BE3E:
	defb 090h,0b0h,0b0h,0b0h,0ebh,009h	; be3e

; ----------------------------------------------------------------------
; DATOS partitura_BE44: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA1 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xbe44..0xbe47  (3 bytes)
DATA_partitura_BE44:
	defb 03bh,091h,0dbh	; be44

; ----------------------------------------------------------------------
; DATOS partitura_BE47: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA1 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xbe47..0xbe4b  (4 bytes)
DATA_partitura_BE47:
	defb 002h,0d4h,00fh,0ffh	; be47

; ----------------------------------------------------------------------
; DATOS partitura_BE4B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA1 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xbe4b..0xbe4e  (3 bytes)
DATA_partitura_BE4B:
	defb 0feh,001h,0f8h	; be4b

; ----------------------------------------------------------------------
; DATOS partitura_BE4E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA1 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xbe4e..0xbe59  (11 bytes)
DATA_partitura_BE4E:
	defb 054h,0e9h,004h,0eah,006h,0ebh,009h,03bh,011h,0f5h,0d1h	; be4e  T..........

; ----------------------------------------------------------------------
; DATOS partitura_BE59: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA1 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xbe59..0xbe5d  (4 bytes)
DATA_partitura_BE59:
	defb 0b0h,0a0h,090h,080h	; be59

; ----------------------------------------------------------------------
; DATOS partitura_BE5D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA1 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (13 bytes)
;   0xbe5d..0xbe6a  (13 bytes)
DATA_partitura_BE5D:
	defb 0fbh,005h,070h,060h,050h,040h,0f5h,0b0h,0a0h,090h,080h,0fbh,004h	; be5d  ..p`P@.......

; ----------------------------------------------------------------------
; DATOS partitura_BE6A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA1 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xbe6a..0xbe83  (25 bytes)
DATA_partitura_BE6A:
	defb 0eah,005h,0b0h,0a0h,090h,080h,0eah,004h,0b0h,0a0h,090h,080h,0eah,003h,0b0h,0a0h	; be6a  ................
	defb 090h,080h,0eah,002h,0b0h,0a0h,090h,080h,0ffh	; be7a  .........

; ----------------------------------------------------------------------
; DATOS partitura_BE83: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA1 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (35 bytes)
;   0xbe83..0xbea6  (35 bytes)
DATA_partitura_BE83:
	defb 0feh,001h,0f8h,002h,0e9h,006h,0eah,00bh,0ebh,009h,03bh,071h,0d6h,040h,003h,0f0h	; be83  ...........q.@..
	defb 00fh,073h,0d1h,032h,052h,068h,062h,082h,0dbh,001h,0f0h,00fh,074h,0ebh,009h,03bh	; be93  .s.2Rhb.....t...
	defb 0a1h,09fh,0ffh	; bea3

; ----------------------------------------------------------------------
; DATOS partitura_BEA6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA1 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xbea6..0xbeae  (8 bytes)
DATA_partitura_BEA6:
	defb 0feh,001h,0f8h,002h,0e9h,006h,0eah,00bh	; bea6  ........

; ----------------------------------------------------------------------
; DATOS partitura_BEAE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0xA1 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0xbeae..0xbec7  (25 bytes)
DATA_partitura_BEAE:
	defb 0ebh,009h,03bh,071h,0d6h,030h,003h,0f0h,00fh,074h,0d2h,092h,0b2h,0d1h,008h,002h	; beae  ...q.0...t......
	defb 022h,0dbh,001h,0ebh,009h,03bh,081h,03fh,0ffh	; bebe  "......?.

; ----------------------------------------------------------------------
; DATOS partitura_BEC7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x84 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (7 bytes)
;   0xbec7..0xbece  (7 bytes)
DATA_partitura_BEC7:
	defb 0feh,001h,0e9h,010h,0c0h,0ech,0eah	; bec7

; ----------------------------------------------------------------------
; DATOS partitura_BECE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x84 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (12 bytes)
;   0xbece..0xbeda  (12 bytes)
DATA_partitura_BECE:
	defb 004h,0f0h,00fh,001h,0d0h,03fh,02fh,01fh,02fh,0fdh,0d2h,0beh	; bece  .....?/./...

; ----------------------------------------------------------------------
; DATOS partitura_BEDA: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x84 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (18 bytes)
;   0xbeda..0xbeec  (18 bytes)
DATA_partitura_BEDA:
	defb 0feh,001h,0e9h,010h,0eeh,081h,0ech,0eah,004h,0d6h,020h,002h,0f0h,00fh,044h,0c1h	; beda  .......... ...D.
	defb 0d2h,03fh	; beea

; ----------------------------------------------------------------------
; DATOS partitura_BEEC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x84 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xbeec..0xbef2  (6 bytes)
DATA_partitura_BEEC:
	defb 02fh,01fh,02fh,0fdh,0eah,0beh	; beec

; ----------------------------------------------------------------------
; DATOS partitura_BEF2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x84 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0xbef2..0xbf03  (17 bytes)
DATA_partitura_BEF2:
	defb 0feh,001h,0f6h,0f8h,012h,0e9h,010h,0eah,006h,0edh,0a2h,0ebh,087h,01fh,011h,0d6h	; bef2  ................
	defb 001h	; bf02

; ----------------------------------------------------------------------
; DATOS partitura_BF03: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x84 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xbf03..0xbf09  (6 bytes)
DATA_partitura_BF03:
	defb 010h,0f0h,00fh,046h,0d2h,03fh	; bf03

; ----------------------------------------------------------------------
; DATOS partitura_BF09: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x84 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xbf09..0xbf0f  (6 bytes)
DATA_partitura_BF09:
	defb 02fh,01fh,02fh,0fdh,007h,0bfh	; bf09

; ----------------------------------------------------------------------
; DATOS partitura_BF0F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x84 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (3 bytes)
;   0xbf0f..0xbf12  (3 bytes)
DATA_partitura_BF0F:
	defb 0feh,001h,0f8h	; bf0f

; ----------------------------------------------------------------------
; DATOS partitura_BF12: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x84 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (28 bytes)
;   0xbf12..0xbf2e  (28 bytes)
DATA_partitura_BF12:
	defb 054h,0e9h,008h,0eah,005h,0ebh,00ah,027h,001h,0d2h,090h,0d1h,030h,060h,0d2h,090h	; bf12  T......'....0`..
	defb 0d1h,020h,030h,060h,0d2h,090h,0d1h,030h,060h,0d2h,090h,0d1h	; bf22  . 0`...0`...

; ----------------------------------------------------------------------
; DATOS partitura_BF2E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x84 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (6 bytes)
;   0xbf2e..0xbf34  (6 bytes)
DATA_partitura_BF2E:
	defb 020h,030h,060h,090h,0fdh,00fh	; bf2e

; ----------------------------------------------------------------------
; DATOS partitura_BF34: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x84 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0xbf34..0xbf35  (1 bytes)
DATA_partitura_BF34:
	defb 0bfh	; bf34

; ----------------------------------------------------------------------
; DATOS partitura_BF35: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x84 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xbf35..0xbf39  (4 bytes)
DATA_partitura_BF35:
	defb 0feh,001h,0f8h,002h	; bf35

; ----------------------------------------------------------------------
; DATOS partitura_BF39: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x84 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0xbf39..0xbf44  (11 bytes)
DATA_partitura_BF39:
	defb 0e9h,008h,0eah,00ch,0edh,015h,0ebh,087h,016h,071h,0f0h	; bf39  .........q.

; ----------------------------------------------------------------------
; DATOS partitura_BF44: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x84 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (8 bytes)
;   0xbf44..0xbf4c  (8 bytes)
DATA_partitura_BF44:
	defb 00fh,034h,0f9h,066h,0bfh,0fdh,046h,0bfh	; bf44  .4.f..F.

; ----------------------------------------------------------------------
; DATOS partitura_BF4C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x84 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (5 bytes)
;   0xbf4c..0xbf51  (5 bytes)
DATA_partitura_BF4C:
	defb 0feh,001h,0f8h,002h,0eeh	; bf4c

; ----------------------------------------------------------------------
; DATOS partitura_BF51: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x84 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (5 bytes)
;   0xbf51..0xbf56  (5 bytes)
DATA_partitura_BF51:
	defb 088h,0e9h,008h,0c1h,0eah	; bf51

; ----------------------------------------------------------------------
; DATOS partitura_BF56: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x84 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xbf56..0xbf5a  (4 bytes)
DATA_partitura_BF56:
	defb 006h,0edh,013h,0ebh	; bf56

; ----------------------------------------------------------------------
; DATOS partitura_BF5A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x84 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0xbf5a..0xbf5e  (4 bytes)
DATA_partitura_BF5A:
	defb 087h,016h,0f1h,0f0h	; bf5a

; ----------------------------------------------------------------------
; DATOS partitura_BF5E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x84 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (27 bytes)
;   0xbf5e..0xbf79  (27 bytes)
DATA_partitura_BF5E:
	defb 00fh,036h,0f9h,066h,0bfh,0fdh,060h,0bfh,0d4h,085h,095h,0d3h,007h,0d4h,083h,097h	; bf5e  .6.f..`.........
	defb 085h,0d3h,029h,0d4h,0b5h,089h,075h,065h,0abh,041h,051h	; bf6e  ..)...ue.AQ

; ----------------------------------------------------------------------
; DATOS partitura_BF79: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x84 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (9 bytes)
;   0xbf79..0xbf82  (9 bytes)
DATA_partitura_BF79:
	defb 061h,071h,085h,075h,0b5h,085h,0d3h,027h,0fah	; bf79  aq.u...'.

; ----------------------------------------------------------------------
; DATOS restos_finales_BF82: 126 bytes al final del banco, detras de la ultima
;   partitura: no los lee ni el codigo ni ninguno de los sonidos tocados con
;   tools/partituras.py
;   0xbf82..0xc000  (126 bytes)
DATA_restos_finales_BF82:
	defb 0f0h,00fh,073h,0d1h,035h,0f0h,00eh,071h,0eah,00bh,0ebh,007h,017h,0f1h,015h,0d2h	; bf82  ..s.5..q........
	defb 083h,0eah,00eh,0edh,017h,0ebh,089h,037h,0b1h,0d2h,085h,079h,0f6h,0f8h,009h,0d3h	; bf92  .......7...y....
	defb 031h,0eah,00ah,0ebh,007h,017h,071h,051h,0e9h,004h,07ah,0edh,024h,0ebh,087h,027h	; bfa2  1.....qQ..z.$..'
	defb 005h,085h,0a5h,0d2h,005h,016h,0e9h,00ch,0f1h,011h,048h,001h,020h,0eah,00eh,0edh	; bfb2  ..........H. ...
	defb 017h,0ebh,089h,037h,0b1h,0d2h,085h,075h,0a3h,0f0h,00fh,054h,0eah,00fh,037h,0f0h	; bfc2  ...7...u...T..7.
	defb 00eh,052h,0eah,00eh,053h,073h,0fah,0feh,001h,0efh,0eeh,001h,0e9h,00ch,0f8h,009h	; bfd2  .R..Ss..........
	defb 0eah,00ch,0edh,014h,0ebh,089h,027h,0f1h,0dbh,004h,0d6h,006h,001h,0f0h,00bh,072h	; bfe2  ......'........r
	defb 0f5h,0d3h,035h,039h,03fh,035h,035h,033h,03fh,0fbh,002h,0fah,07bh,00ch	; bff2  ..59?553?...{.
