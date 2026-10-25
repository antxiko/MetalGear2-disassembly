; ==========================================================================
; METAL GEAR 2 SOLID SNAKE - Konami (1990) - MSX2 - MegaROM RC-767 de 512 KB (Konami SCC) - banco 18 (se ejecuta en 0x8000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x08000


; ----------------------------------------------------------------------
; DATOS sonido_8000: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x29 (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392
;   (106 bytes)
;   0x8000..0x806a  (106 bytes)
DATA_sonido_8000:
	defb 050h,0f5h,0f9h,047h,080h,0fbh,006h,0e0h,028h,0f5h,0f9h,047h,080h,0fbh,002h,0e0h	; 8000  P..G....(..G....
	defb 050h,0f5h,0f9h,047h,080h,0fbh,006h,0e0h,028h,0f5h,0f9h,047h,080h,0fbh,004h,0e0h	; 8010  P..G....(..G....
	defb 0c0h,0e0h,0c0h,0fdh,0d2h,07fh,0feh,002h,0e0h,001h,0e2h,001h,020h,041h,020h,041h	; 8020  ............ A A
	defb 030h,041h,030h,041h,040h,041h,040h,041h,000h,041h,000h,041h,000h,041h,010h,041h	; 8030  0A0A@A@A.A.A.A.A
	defb 010h,041h,010h,041h,000h,041h,0fah,0feh,002h,0f8h,005h,0e2h,001h,020h,040h,0a0h	; 8040  .A.A.A....... @.
	defb 040h,0a0h,040h,0b0h,040h,0b0h,040h,0c0h,040h,0c0h,040h,000h,040h,000h,040h,000h	; 8050  @.@.@.@.@.@.@.@.
	defb 040h,010h,040h,010h,040h,010h,040h,000h,040h,0fah	; 8060  @.@.@.@.@.

; ----------------------------------------------------------------------
; DATOS partitura_806A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x2A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (101 bytes)
;   0x806a..0x80cf  (101 bytes)
DATA_partitura_806A:
	defb 0feh,002h,0e0h,001h,0e2h,001h,011h,030h,011h,000h,010h,0e3h,010h,0b0h,010h,0f6h	; 806a  .......0........
	defb 011h,030h,010h,0f0h,010h,0d0h,010h,0a0h,010h,0e0h,011h,010h,010h,0e0h,010h,0c0h	; 807a  .0..............
	defb 010h,090h,010h,0d0h,011h,000h,010h,0d0h,010h,0b0h,010h,080h,010h,0c0h,010h,0f0h	; 808a  ................
	defb 010h,0c0h,010h,0a0h,010h,070h,010h,0c0h,010h,0f0h,010h,0c0h,000h,0f0h,000h,0d0h	; 809a  .....p..........
	defb 000h,0a0h,000h,0e0h,001h,010h,000h,0e0h,000h,0c0h,000h,090h,000h,0d0h,001h,000h	; 80aa  ................
	defb 000h,0d0h,000h,0b0h,000h,080h,000h,0c0h,000h,0f0h,000h,0c0h,000h,0a0h,000h,070h	; 80ba  ...............p
	defb 000h,0c0h,000h,0f0h,0ffh	; 80ca

; ----------------------------------------------------------------------
; DATOS partitura_80CF: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x2A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (103 bytes)
;   0x80cf..0x8136  (103 bytes)
DATA_partitura_80CF:
	defb 0feh,002h,0f8h,049h,0e2h,001h,001h,030h,011h,000h,020h,0e3h,030h,0b0h,040h,0f6h	; 80cf  ...I...0.. .0.@.
	defb 051h,030h,050h,0f0h,050h,0d0h,050h,0a0h,050h,0e0h,051h,010h,050h,0e0h,050h,0c0h	; 80df  Q0P.P.P.P.Q.P.P.
	defb 050h,090h,050h,0d0h,051h,000h,050h,0d0h,050h,0b0h,050h,080h,050h,0c0h,050h,0f0h	; 80ef  P.P.Q.P.P.P.P.P.
	defb 050h,0c0h,050h,0a0h,050h,070h,050h,0c0h,050h,0f0h,050h,0c0h,000h,0f0h,000h,0d0h	; 80ff  P.P.PpP.P.P.....
	defb 000h,0a0h,000h,0e0h,001h,010h,000h,0e0h,000h,0c0h,000h,090h,000h,0d0h,001h,000h	; 810f  ................
	defb 000h,0d0h,000h,0b0h,000h,080h,000h,0c0h,000h,0f0h,000h,0c0h,000h,0a0h,000h,070h	; 811f  ...............p
	defb 000h,0c0h,000h,0f0h,000h,0c0h,0ffh	; 812f

; ----------------------------------------------------------------------
; DATOS partitura_8136: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x2B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0x8136..0x8141  (11 bytes)
DATA_partitura_8136:
	defb 0feh,002h,0e3h,008h,0e4h,000h,070h,0b2h,020h,0b2h,0ffh	; 8136  ......p. ..

; ----------------------------------------------------------------------
; DATOS partitura_8141: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x2B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0x8141..0x814c  (11 bytes)
DATA_partitura_8141:
	defb 0feh,002h,0f8h,01dh,0e2h,008h,080h,065h,000h,065h,0ffh	; 8141  .......e.e.

; ----------------------------------------------------------------------
; DATOS partitura_814C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x2C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0x814c..0x8157  (11 bytes)
DATA_partitura_814C:
	defb 0feh,002h,0e3h,008h,0e4h,000h,070h,0a1h,020h,0a1h,0ffh	; 814c  ......p. ..

; ----------------------------------------------------------------------
; DATOS partitura_8157: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x2C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0x8157..0x8162  (11 bytes)
DATA_partitura_8157:
	defb 0feh,002h,0f8h,01dh,0e2h,008h,080h,05ch,000h,05ch,0ffh	; 8157  .......\.\.

; ----------------------------------------------------------------------
; DATOS partitura_8162: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x2D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0x8162..0x816d  (11 bytes)
DATA_partitura_8162:
	defb 0feh,002h,0e3h,008h,0e4h,000h,070h,092h,020h,092h,0ffh	; 8162  ......p. ..

; ----------------------------------------------------------------------
; DATOS partitura_816D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x2D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0x816d..0x8178  (11 bytes)
DATA_partitura_816D:
	defb 0feh,002h,0f8h,01dh,0e2h,008h,080h,053h,000h,053h,0ffh	; 816d  .......S.S.

; ----------------------------------------------------------------------
; DATOS partitura_8178: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x2E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (82 bytes)
;   0x8178..0x81ca  (82 bytes)
DATA_partitura_8178:
	defb 0feh,002h,0e1h,001h,0e4h,01fh,001h,009h,001h,001h,0e2h,001h,072h,030h,070h,013h	; 8178  ............r0p.
	defb 070h,010h,070h,00ah,070h,009h,060h,008h,0e0h,003h,0e2h,001h,010h,013h,010h,010h	; 8188  p.p.p.`.........
	defb 010h,00ah,010h,009h,010h,008h,0feh,002h,0e1h,004h,0e4h,01fh,007h,0e4h,013h,007h	; 8198  ................
	defb 0e4h,015h,007h,0e4h,013h,007h,0e4h,015h,007h,0e4h,014h,007h,0e4h,017h,007h,0e4h	; 81a8  ................
	defb 013h,002h,0e4h,015h,002h,0e4h,013h,002h,0e4h,015h,002h,0e4h,014h,002h,0e4h,017h	; 81b8  ................
	defb 002h,0ffh	; 81c8

; ----------------------------------------------------------------------
; DATOS partitura_81CA: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x2E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (62 bytes)
;   0x81ca..0x8208  (62 bytes)
DATA_partitura_81CA:
	defb 0feh,002h,0f8h,042h,0e2h,001h,0c1h,0a0h,0b0h,090h,030h,080h,030h,070h,0f8h,01dh	; 81ca  ...B......0.0p..
	defb 030h,088h,030h,080h,030h,078h,030h,070h,030h,068h,0f8h,01ah,0e0h,003h,0e2h,001h	; 81da  0.0.0x0p0h......
	defb 000h,088h,000h,080h,000h,078h,000h,070h,000h,068h,0feh,002h,0f8h,003h,0e2h,001h	; 81ea  .....x.p.h......
	defb 0f5h,021h,050h,021h,090h,021h,070h,021h,060h,021h,0f0h,0fbh,006h,0ffh	; 81fa  .!P!.!p!`!....

; ----------------------------------------------------------------------
; DATOS partitura_8208: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x2F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (15 bytes)
;   0x8208..0x8217  (15 bytes)
DATA_partitura_8208:
	defb 0feh,002h,0f5h,0e2h,001h,055h,000h,054h,030h,056h,080h,042h,000h,0fbh,0ffh	; 8208  .....U.T0V.B...

; ----------------------------------------------------------------------
; DATOS partitura_8217: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x2F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0x8217..0x8228  (17 bytes)
DATA_partitura_8217:
	defb 0feh,002h,0f8h,04bh,0f5h,0e2h,001h,0a6h,000h,0a5h,030h,0a7h,080h,055h,000h,0fbh	; 8217  ...K......0..U..
	defb 0ffh	; 8227

; ----------------------------------------------------------------------
; DATOS partitura_8228: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x2F, 0x30 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (150 bytes)
;   0x8228..0x82be  (150 bytes)
DATA_partitura_8228:
	defb 0feh,002h,0e3h,001h,0f5h,0e4h,01fh,070h,02eh,0e4h,01eh,080h,031h,0e4h,01dh,080h	; 8228  .......p....1...
	defb 02dh,0e4h,01ch,080h,02eh,0e4h,01bh,080h,02dh,0e4h,01ah,090h,02eh,0fbh,002h,0e4h	; 8238  -.......-.......
	defb 01fh,040h,02eh,0e4h,01eh,040h,031h,0e4h,01dh,040h,02dh,0e4h,01ch,040h,02eh,0e4h	; 8248  .@...@1..@-..@..
	defb 01ah,020h,02eh,0e4h,01fh,020h,02eh,0e4h,01eh,020h,031h,0e4h,01dh,020h,02dh,0e4h	; 8258  . ... ... 1.. -.
	defb 01ch,020h,02eh,0e4h,01bh,020h,02dh,0e4h,01ah,020h,02eh,0e4h,01fh,010h,02eh,0e4h	; 8268  . ... -.. ......
	defb 01eh,010h,031h,0e4h,01dh,010h,02dh,0e4h,01ch,010h,02eh,0feh,002h,0e1h,004h,0e4h	; 8278  ..1...-.........
	defb 001h,007h,0e4h,002h,007h,0e4h,003h,006h,0e4h,004h,006h,0e4h,005h,005h,0e4h,006h	; 8288  ................
	defb 005h,0e4h,007h,004h,0e4h,008h,004h,0e4h,009h,004h,0e4h,00ah,004h,0e4h,00bh,003h	; 8298  ................
	defb 0e4h,00ch,003h,0e4h,00dh,003h,0e4h,00eh,002h,0e4h,00fh,002h,0e4h,010h,002h,0e4h	; 82a8  ................
	defb 011h,001h,0e4h,012h,000h,0ffh	; 82b8

; ----------------------------------------------------------------------
; DATOS partitura_82BE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x30 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (151 bytes)
;   0x82be..0x8355  (151 bytes)
DATA_partitura_82BE:
	defb 0feh,002h,0f8h,002h,0e2h,001h,050h,029h,060h,030h,060h,02dh,040h,02bh,050h,02dh	; 82be  ......P)`0`-@+P-
	defb 040h,029h,060h,030h,060h,02dh,040h,02bh,050h,02dh,040h,029h,060h,030h,060h,02dh	; 82ce  @)`0`-@+P-@)`0`-
	defb 040h,02bh,050h,02dh,000h,02dh,000h,029h,000h,030h,000h,02dh,000h,02bh,000h,02dh	; 82de  @+P-.-.).0.-.+.-
	defb 000h,029h,000h,030h,000h,02dh,000h,02bh,000h,02dh,0feh,002h,0f8h,00ch,0e2h,001h	; 82ee  .).0.-.+.-......
	defb 0c2h,000h,0c2h,010h,0c2h,020h,0c2h,030h,0c2h,040h,0c2h,050h,0c2h,060h,0c2h,070h	; 82fe  ..... .0.@.P.`.p
	defb 0c2h,080h,0c2h,0a0h,0c2h,0c0h,0c2h,0e0h,0e2h,002h,0c3h,000h,0c3h,040h,0c3h,080h	; 830e  .............@..
	defb 0c3h,0c0h,0c4h,000h,0c4h,040h,0c4h,080h,0c4h,0c0h,0c5h,000h,0c5h,040h,0c5h,080h	; 831e  .....@.......@..
	defb 0c5h,0c0h,0c6h,000h,0c6h,040h,0c6h,080h,0c6h,0c0h,0c7h,000h,0c7h,040h,0c7h,080h	; 832e  .....@.......@..
	defb 0a7h,0c0h,098h,000h,088h,040h,078h,080h,068h,0c0h,059h,000h,049h,040h,039h,080h	; 833e  .....@x.h.Y.I@9.
	defb 029h,0c0h,01ah,000h,00ah,040h,0ffh	; 834e

; ----------------------------------------------------------------------
; DATOS partitura_8355: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x31 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (37 bytes)
;   0x8355..0x837a  (37 bytes)
DATA_partitura_8355:
	defb 0feh,002h,0e3h,001h,0e4h,000h,0a1h,000h,051h,030h,061h,002h,061h,000h,060h,0e0h	; 8355  ........Q0a.a.`.
	defb 060h,0b0h,030h,013h,000h,000h,041h,000h,031h,030h,021h,002h,021h,000h,020h,0e0h	; 8365  `.0...A.10!.!. .
	defb 020h,0b0h,010h,013h,0ffh	; 8375

; ----------------------------------------------------------------------
; DATOS partitura_837A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x31 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (37 bytes)
;   0x837a..0x839f  (37 bytes)
DATA_partitura_837A:
	defb 0feh,002h,0f8h,009h,0e2h,001h,065h,000h,036h,030h,047h,002h,048h,000h,049h,0e0h	; 837a  ......e.60G.H.I.
	defb 048h,0b0h,017h,013h,000h,000h,005h,000h,006h,030h,007h,002h,008h,000h,009h,0e0h	; 838a  H........0......
	defb 008h,0b0h,007h,013h,0ffh	; 839a

; ----------------------------------------------------------------------
; DATOS partitura_839F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x32 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (35 bytes)
;   0x839f..0x83c2  (35 bytes)
DATA_partitura_839F:
	defb 0feh,002h,0e2h,001h,0f5h,067h,000h,066h,090h,067h,020h,066h,0d0h,066h,060h,067h	; 839f  .....g.f.g f.f`g
	defb 050h,0fbh,00ah,0f5h,007h,000h,006h,090h,007h,020h,006h,0d0h,006h,060h,007h,050h	; 83af  P........ ...`.P
	defb 0fbh,008h,0ffh	; 83bf

; ----------------------------------------------------------------------
; DATOS partitura_83C2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x32 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (37 bytes)
;   0x83c2..0x83e7  (37 bytes)
DATA_partitura_83C2:
	defb 0feh,002h,0f8h,015h,0e2h,001h,0f5h,0c7h,000h,0c6h,090h,0c7h,020h,0c6h,0d0h,0c6h	; 83c2  ............ ...
	defb 060h,0c7h,050h,0fbh,00ah,0f5h,027h,000h,026h,090h,027h,020h,026h,0d0h,026h,060h	; 83d2  `.P...'.&.' &.&`
	defb 027h,050h,0fbh,006h,0ffh	; 83e2

; ----------------------------------------------------------------------
; DATOS partitura_83E7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x33 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (35 bytes)
;   0x83e7..0x840a  (35 bytes)
DATA_partitura_83E7:
	defb 0feh,002h,0e2h,001h,0f5h,036h,060h,037h,030h,037h,080h,036h,0d0h,037h,050h,038h	; 83e7  .....6`707.6.7P8
	defb 040h,0fbh,006h,0f5h,016h,060h,017h,030h,017h,080h,016h,0d0h,017h,050h,018h,040h	; 83f7  @....`.0.....P.@
	defb 0fbh,004h,0ffh	; 8407

; ----------------------------------------------------------------------
; DATOS partitura_840A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x33 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (37 bytes)
;   0x840a..0x842f  (37 bytes)
DATA_partitura_840A:
	defb 0feh,002h,0f8h,023h,0e2h,001h,0f5h,065h,060h,066h,030h,066h,080h,065h,0d0h,066h	; 840a  ...#...e`f0f.e.f
	defb 050h,067h,040h,0fbh,006h,0f5h,005h,060h,005h,030h,006h,080h,005h,0d0h,006h,050h	; 841a  Pg@....`.0.....P
	defb 007h,040h,0fbh,004h,0ffh	; 842a

; ----------------------------------------------------------------------
; DATOS partitura_842F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x34 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (38 bytes)
;   0x842f..0x8455  (38 bytes)
DATA_partitura_842F:
	defb 0feh,002h,0e2h,002h,040h,00bh,050h,00ah,060h,00bh,050h,00ah,050h,00bh,040h,00ah	; 842f  ....@.P.`.P.P.@.
	defb 040h,00bh,030h,00ah,030h,00bh,020h,00ah,020h,00bh,010h,00ah,010h,00bh,0f5h,000h	; 843f  @.0.0. . .......
	defb 00ah,000h,00bh,0fbh,004h,0ffh	; 844f

; ----------------------------------------------------------------------
; DATOS partitura_8455: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x34 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (38 bytes)
;   0x8455..0x847b  (38 bytes)
DATA_partitura_8455:
	defb 0feh,002h,0f8h,005h,0e2h,002h,072h,000h,082h,018h,092h,000h,072h,018h,062h,000h	; 8455  ......r.....r.b.
	defb 052h,018h,042h,000h,042h,018h,022h,000h,022h,018h,012h,000h,012h,018h,0f5h,002h	; 8465  R.B.B.".".......
	defb 000h,002h,018h,0fbh,004h,0ffh	; 8475

; ----------------------------------------------------------------------
; DATOS partitura_847B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x35 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (46 bytes)
;   0x847b..0x84a9  (46 bytes)
DATA_partitura_847B:
	defb 0feh,002h,0e0h,020h,0f5h,0e2h,001h,050h,032h,060h,040h,070h,050h,000h,020h,000h	; 847b  ... ...P2`@pP. .
	defb 040h,000h,050h,030h,040h,040h,038h,050h,030h,0e0h,008h,0e2h,001h,000h,020h,000h	; 848b  @.P0@@8P0..... .
	defb 040h,000h,050h,000h,040h,010h,038h,020h,030h,0e0h,050h,0fbh,004h,0ffh	; 849b  @.P.@.8 0.P...

; ----------------------------------------------------------------------
; DATOS partitura_84A9: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x35 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (35 bytes)
;   0x84a9..0x84cc  (35 bytes)
DATA_partitura_84A9:
	defb 0feh,002h,0f8h,009h,0e2h,004h,0f5h,0a4h,049h,0a4h,030h,0fbh,02ah,0f5h,044h,049h	; 84a9  ........I.0.*.DI
	defb 044h,030h,0fbh,006h,0f5h,024h,049h,024h,030h,0fbh,004h,0f5h,004h,049h,004h,030h	; 84b9  D0...$I$0....I.0
	defb 0fbh,004h,0ffh	; 84c9

; ----------------------------------------------------------------------
; DATOS partitura_84CC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x36 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (27 bytes)
;   0x84cc..0x84e7  (27 bytes)
DATA_partitura_84CC:
	defb 0feh,002h,0e3h,002h,0f5h,0e4h,00eh,080h,019h,0e4h,010h,060h,01ch,0fbh,010h,0f5h	; 84cc  ...........`....
	defb 0e4h,00eh,040h,019h,0e4h,010h,020h,01ch,0fbh,006h,0ffh	; 84dc  ..@... ....

; ----------------------------------------------------------------------
; DATOS partitura_84E7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x36 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (21 bytes)
;   0x84e7..0x84fc  (21 bytes)
DATA_partitura_84E7:
	defb 0feh,002h,0f8h,047h,0e2h,002h,0f5h,084h,020h,073h,023h,0fbh,010h,0f5h,014h,020h	; 84e7  ...G.... s#....
	defb 003h,020h,0fbh,006h,0ffh	; 84f7

; ----------------------------------------------------------------------
; DATOS partitura_84FC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x37 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (27 bytes)
;   0x84fc..0x8517  (27 bytes)
DATA_partitura_84FC:
	defb 0feh,002h,0e3h,002h,0f5h,0e4h,00eh,060h,019h,0e4h,010h,040h,01ch,0fbh,010h,0f5h	; 84fc  .......`...@....
	defb 0e4h,00eh,010h,019h,0e4h,010h,000h,01ch,0fbh,008h,0ffh	; 850c  ...........

; ----------------------------------------------------------------------
; DATOS partitura_8517: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x37 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (21 bytes)
;   0x8517..0x852c  (21 bytes)
DATA_partitura_8517:
	defb 0feh,002h,0f8h,047h,0e2h,002h,0f5h,054h,020h,023h,023h,0fbh,010h,0f5h,014h,020h	; 8517  ...G...T ##....
	defb 003h,023h,0fbh,008h,0ffh	; 8527

; ----------------------------------------------------------------------
; DATOS partitura_852C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x38 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (57 bytes)
;   0x852c..0x8565  (57 bytes)
DATA_partitura_852C:
	defb 0feh,002h,0e0h,001h,0e2h,001h,022h,0a0h,022h,090h,022h,080h,022h,070h,022h,060h	; 852c  ......"."."."p"`
	defb 022h,050h,022h,040h,022h,030h,022h,020h,022h,010h,022h,000h,021h,0f0h,021h,0e0h	; 853c  "P"@"0" ".".!.!.
	defb 021h,0d0h,021h,0c0h,021h,0b0h,021h,0a0h,0e2h,002h,0f5h,021h,090h,021h,070h,0fbh	; 854c  !.!.!.!....!.!p.
	defb 008h,0f5h,001h,090h,001h,070h,0fbh,00ch,0ffh	; 855c  .....p...

; ----------------------------------------------------------------------
; DATOS partitura_8565: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x38 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (64 bytes)
;   0x8565..0x85a5  (64 bytes)
DATA_partitura_8565:
	defb 0feh,002h,0f8h,005h,0e2h,001h,062h,0a0h,062h,090h,062h,080h,062h,070h,062h,060h	; 8565  ......b.b.b.bpb`
	defb 062h,050h,062h,040h,062h,030h,062h,020h,062h,010h,062h,000h,061h,0f0h,061h,0e0h	; 8575  bPb@b0b b.b.a.a.
	defb 061h,0d0h,061h,0c0h,061h,0b0h,061h,0a0h,0e2h,002h,0f5h,061h,090h,061h,070h,0fbh	; 8585  a.a.a.a....a.ap.
	defb 008h,0f5h,021h,090h,021h,070h,0fbh,008h,0f5h,001h,090h,001h,070h,0fbh,004h,0ffh	; 8595  ..!.!p......p...

; ----------------------------------------------------------------------
; DATOS partitura_85A5: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x39 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (63 bytes)
;   0x85a5..0x85e4  (63 bytes)
DATA_partitura_85A5:
	defb 0feh,002h,0e3h,001h,0e4h,01fh,080h,030h,0e4h,009h,050h,040h,0e4h,000h,055h,000h	; 85a5  .......0..P@..U.
	defb 0e3h,001h,0e4h,002h,080h,010h,0e4h,008h,080h,013h,0e4h,018h,070h,012h,0e4h,000h	; 85b5  ............p...
	defb 080h,011h,0e4h,003h,080h,011h,080h,012h,0e4h,002h,020h,010h,0e4h,008h,020h,013h	; 85c5  .......... ... .
	defb 0e4h,018h,010h,012h,0e4h,000h,030h,011h,0e4h,003h,030h,011h,030h,012h,0ffh	; 85d5  ......0...0.0..

; ----------------------------------------------------------------------
; DATOS partitura_85E4: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x39 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (35 bytes)
;   0x85e4..0x8607  (35 bytes)
DATA_partitura_85E4:
	defb 0feh,002h,0f8h,026h,0e2h,001h,076h,030h,053h,060h,024h,090h,005h,000h,0f8h,00bh	; 85e4  ...&..v0S`$.....
	defb 001h,000h,000h,0e8h,010h,0c8h,0e0h,004h,0f8h,01dh,0e2h,001h,002h,000h,001h,0d0h	; 85f4  ................
	defb 001h,090h,0ffh	; 8604

; ----------------------------------------------------------------------
; DATOS partitura_8607: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x3A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (79 bytes)
;   0x8607..0x8656  (79 bytes)
DATA_partitura_8607:
	defb 0feh,002h,0e2h,001h,0a1h,090h,0e1h,001h,0e4h,01fh,00ah,0e3h,001h,0e4h,01eh,080h	; 8607  ................
	defb 046h,0e4h,01ah,070h,030h,0e1h,003h,0e4h,01fh,007h,0e4h,01dh,006h,0e4h,018h,005h	; 8617  F..p0...........
	defb 0e1h,001h,0e4h,012h,004h,0e4h,01fh,003h,0e4h,01dh,003h,0e4h,018h,003h,0e1h,001h	; 8627  ................
	defb 0e4h,012h,002h,0e4h,010h,002h,0e4h,00eh,002h,0e4h,00ch,002h,0e4h,00ah,002h,0e4h	; 8637  ................
	defb 008h,002h,0e4h,006h,002h,0e4h,004h,002h,0e4h,002h,002h,0e4h,000h,002h,0ffh	; 8647  ...............

; ----------------------------------------------------------------------
; DATOS partitura_8656: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x3A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (57 bytes)
;   0x8656..0x868f  (57 bytes)
DATA_partitura_8656:
	defb 0feh,002h,0f8h,023h,0e2h,001h,0c2h,036h,094h,000h,085h,000h,067h,000h,0f8h,009h	; 8656  ...#...6....g...
	defb 0c4h,000h,0a3h,060h,081h,0a0h,061h,060h,051h,020h,040h,0f0h,0e0h,004h,0e2h,001h	; 8666  ...`..a`Q @.....
	defb 0f8h,023h,002h,036h,004h,000h,005h,000h,007h,000h,0f8h,009h,004h,000h,003h,060h	; 8676  .#.6...........`
	defb 001h,0a0h,001h,060h,001h,020h,000h,0f0h,0ffh	; 8686  ...`. ...

; ----------------------------------------------------------------------
; DATOS partitura_868F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x3B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (72 bytes)
;   0x868f..0x86d7  (72 bytes)
DATA_partitura_868F:
	defb 0feh,002h,0e3h,001h,0e4h,000h,022h,000h,0e1h,002h,007h,0e4h,002h,006h,0e4h,001h	; 868f  ......".........
	defb 007h,0e4h,000h,005h,0e4h,003h,003h,0e4h,002h,004h,0e4h,001h,003h,0e4h,002h,003h	; 869f  ................
	defb 0e4h,001h,004h,0e4h,000h,002h,0e4h,003h,002h,0e4h,002h,002h,0e4h,001h,002h,0e4h	; 86af  ................
	defb 000h,002h,0e4h,002h,001h,0e4h,001h,002h,0e4h,000h,000h,0e4h,003h,000h,0e4h,002h	; 86bf  ................
	defb 000h,0e4h,001h,000h,0e4h,000h,000h,0ffh	; 86cf  ........

; ----------------------------------------------------------------------
; DATOS partitura_86D7: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x3B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (27 bytes)
;   0x86d7..0x86f2  (27 bytes)
DATA_partitura_86D7:
	defb 0feh,002h,0e2h,001h,0f8h,005h,013h,00ah,0f8h,01ah,0e2h,002h,000h,00bh,000h,00ah	; 86d7  ................
	defb 000h,009h,000h,00ah,000h,00dh,000h,00ch,000h,00bh,0ffh	; 86e7  ...........

; ----------------------------------------------------------------------
; DATOS partitura_86F2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x3C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (22 bytes)
;   0x86f2..0x8708  (22 bytes)
DATA_partitura_86F2:
	defb 0feh,002h,0e2h,001h,0e5h,009h,000h,002h,091h,080h,0e8h,0e1h,001h,0e4h,000h,006h	; 86f2  ................
	defb 0e0h,006h,0e1h,001h,002h,0ffh	; 8702

; ----------------------------------------------------------------------
; DATOS partitura_8708: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x3C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0x8708..0x8721  (25 bytes)
DATA_partitura_8708:
	defb 0feh,002h,0f8h,009h,0e2h,001h,0a5h,006h,0f8h,005h,070h,020h,0e0h,005h,0e2h,001h	; 8708  ..........p ....
	defb 0f8h,009h,005h,006h,0f8h,005h,000h,020h,0ffh	; 8718  ....... .

; ----------------------------------------------------------------------
; DATOS partitura_8721: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x3D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (22 bytes)
;   0x8721..0x8737  (22 bytes)
DATA_partitura_8721:
	defb 0feh,002h,0e2h,001h,0e5h,009h,000h,002h,091h,080h,0e8h,0e1h,001h,0e4h,000h,006h	; 8721  ................
	defb 0e0h,006h,0e1h,001h,002h,0ffh	; 8731

; ----------------------------------------------------------------------
; DATOS partitura_8737: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x3D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0x8737..0x8750  (25 bytes)
DATA_partitura_8737:
	defb 0feh,002h,0f8h,009h,0e2h,001h,0a5h,006h,0f8h,005h,070h,080h,0e0h,005h,0e2h,001h	; 8737  ..........p.....
	defb 0f8h,009h,005h,006h,0f8h,005h,000h,080h,0ffh	; 8747  .........

; ----------------------------------------------------------------------
; DATOS partitura_8750: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x3E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (32 bytes)
;   0x8750..0x8770  (32 bytes)
DATA_partitura_8750:
	defb 0feh,002h,0e2h,001h,0e5h,009h,000h,004h,091h,080h,0e8h,010h,0d0h,020h,080h,020h	; 8750  ............. .
	defb 070h,010h,060h,010h,050h,001h,000h,000h,080h,000h,070h,000h,060h,000h,050h,0ffh	; 8760  p.`.P.....p.`.P.

; ----------------------------------------------------------------------
; DATOS partitura_8770: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x3E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (29 bytes)
;   0x8770..0x878d  (29 bytes)
DATA_partitura_8770:
	defb 0feh,002h,0f8h,047h,0e2h,001h,0c1h,000h,050h,080h,040h,070h,030h,060h,020h,050h	; 8770  ...G....P.@p0` P
	defb 0f8h,015h,001h,000h,000h,080h,000h,070h,000h,060h,000h,050h,0ffh	; 8780  .......p.`.P.

; ----------------------------------------------------------------------
; DATOS partitura_878D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x3F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0x878d..0x87a6  (25 bytes)
DATA_partitura_878D:
	defb 0feh,002h,0e2h,002h,090h,02ch,060h,02ch,050h,02ch,040h,02ch,030h,02ch,050h,02ch	; 878d  .....,`,P,@,0,P,
	defb 030h,02ch,020h,02ch,010h,02ch,010h,02ch,0ffh	; 879d  0, ,.,.,.

; ----------------------------------------------------------------------
; DATOS partitura_87A6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x3F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (27 bytes)
;   0x87a6..0x87c1  (27 bytes)
DATA_partitura_87A6:
	defb 0feh,002h,0f8h,012h,0e2h,002h,0b0h,02ch,050h,02ch,040h,02ch,030h,02ch,020h,02ch	; 87a6  .......,P,@,0, ,
	defb 010h,02ch,010h,02ch,010h,02ch,000h,02ch,000h,02ch,0ffh	; 87b6  .,.,.,.,.,.

; ----------------------------------------------------------------------
; DATOS partitura_87C1: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x40 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (73 bytes)
;   0x87c1..0x880a  (73 bytes)
DATA_partitura_87C1:
	defb 0feh,002h,0e0h,001h,0e2h,001h,051h,0feh,050h,0feh,060h,0edh,060h,0b0h,050h,090h	; 87c1  ......Q.P.`.`.P.
	defb 032h,010h,031h,090h,031h,050h,031h,020h,030h,0e0h,030h,0a0h,021h,0feh,020h,0feh	; 87d1  2.1.1P1 0.0.!. .
	defb 020h,0edh,020h,0b0h,020h,090h,012h,010h,011h,090h,011h,050h,011h,020h,010h,0e0h	; 87e1   . . ......P. ..
	defb 010h,0a0h,001h,0feh,000h,0feh,000h,0edh,000h,0b0h,000h,090h,002h,010h,001h,090h	; 87f1  ................
	defb 001h,050h,001h,020h,000h,0e0h,000h,0a0h,0ffh	; 8801  .P. .....

; ----------------------------------------------------------------------
; DATOS partitura_880A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x40 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (81 bytes)
;   0x880a..0x885b  (81 bytes)
DATA_partitura_880A:
	defb 0feh,002h,0f8h,047h,0e2h,001h,0c1h,0feh,0c0h,0feh,0c0h,0edh,0c0h,0b0h,0c0h,090h	; 880a  ...G............
	defb 0f8h,03fh,062h,010h,061h,090h,061h,050h,061h,020h,060h,0e0h,060h,0a0h,0f8h,047h	; 881a  .?b.a.aPa `.`..G
	defb 021h,0feh,020h,0feh,020h,0edh,020h,0b0h,020h,090h,0f8h,03fh,002h,010h,001h,090h	; 882a  !. . . . ..?....
	defb 001h,050h,001h,020h,000h,0e0h,000h,0a0h,0f8h,047h,001h,0feh,000h,0feh,000h,0edh	; 883a  .P. .....G......
	defb 000h,0b0h,000h,090h,002h,010h,001h,090h,001h,050h,001h,020h,000h,0e0h,000h,0a0h	; 884a  .........P. ....
	defb 0ffh	; 885a

; ----------------------------------------------------------------------
; DATOS partitura_885B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x41 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (13 bytes)
;   0x885b..0x8868  (13 bytes)
DATA_partitura_885B:
	defb 0feh,002h,0e2h,004h,020h,03dh,0e2h,007h,010h,03dh,0fdh,05dh,088h	; 885b  .... =...=.].

; ----------------------------------------------------------------------
; DATOS partitura_8868: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x41 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (27 bytes)
;   0x8868..0x8883  (27 bytes)
DATA_partitura_8868:
	defb 0feh,002h,0f8h,005h,0e2h,004h,0c3h,05eh,0e2h,001h,0c3h,070h,0c3h,068h,0c3h,060h	; 8868  .......^...p.h.`
	defb 0c3h,058h,0c3h,050h,0c3h,048h,0c3h,050h,0fdh,06ch,088h	; 8878  .X.P.H.P.l.

; ----------------------------------------------------------------------
; DATOS partitura_8883: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x42 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (45 bytes)
;   0x8883..0x88b0  (45 bytes)
DATA_partitura_8883:
	defb 0feh,002h,0e0h,002h,0e2h,005h,060h,080h,081h,000h,080h,0c0h,060h,080h,061h,000h	; 8883  ......`.....`.a.
	defb 060h,0c0h,050h,080h,051h,000h,050h,0c0h,040h,080h,041h,000h,040h,0c0h,020h,080h	; 8893  `.P.Q.P.@.A.@. .
	defb 021h,000h,020h,0c0h,010h,080h,011h,000h,010h,0c0h,010h,080h,0ffh	; 88a3  !. ..........

; ----------------------------------------------------------------------
; DATOS partitura_88B0: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x42 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (45 bytes)
;   0x88b0..0x88dd  (45 bytes)
DATA_partitura_88B0:
	defb 0feh,002h,0f8h,042h,0e2h,005h,060h,080h,0c1h,000h,0c0h,0c0h,090h,080h,091h,000h	; 88b0  ...B..`.........
	defb 090h,0c0h,060h,080h,061h,000h,060h,0c0h,040h,080h,041h,000h,040h,0c0h,020h,080h	; 88c0  ..`.a.`.@.A.@. .
	defb 021h,000h,020h,0c0h,000h,080h,001h,000h,000h,0c0h,000h,080h,0ffh	; 88d0  !. ..........

; ----------------------------------------------------------------------
; DATOS partitura_88DD: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x43 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (73 bytes)
;   0x88dd..0x8926  (73 bytes)
DATA_partitura_88DD:
	defb 0feh,002h,0e3h,001h,0e4h,01fh,090h,0a0h,071h,020h,072h,06ch,074h,015h,075h,04ch	; 88dd  ........q rlt.uL
	defb 008h,000h,009h,000h,00ah,000h,0e2h,001h,076h,000h,077h,000h,078h,000h,079h,000h	; 88ed  ........v.w.x.y.
	defb 060h,0e0h,061h,000h,061h,080h,062h,000h,063h,000h,064h,000h,065h,000h,066h,000h	; 88fd  `.a.a.b.c.d.e.f.
	defb 067h,000h,068h,000h,069h,000h,030h,0e0h,031h,000h,031h,080h,032h,000h,033h,000h	; 890d  g.h.i.0.1.1.2.3.
	defb 034h,000h,035h,000h,036h,000h,037h,000h,0ffh	; 891d  4.5.6.7..

; ----------------------------------------------------------------------
; DATOS partitura_8926: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x43 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (75 bytes)
;   0x8926..0x8971  (75 bytes)
DATA_partitura_8926:
	defb 0feh,002h,0f8h,026h,0e2h,001h,0a0h,090h,0a1h,020h,0a2h,05ch,0a4h,005h,0a5h,03ch	; 8926  ...&..... .\...<
	defb 008h,000h,0f8h,02ah,085h,000h,086h,000h,087h,000h,088h,000h,0f8h,025h,0a0h,0b0h	; 8936  ...*.........%..
	defb 0a0h,0e0h,0a1h,040h,0a1h,0e0h,0a2h,0e0h,0a3h,0e0h,0a3h,030h,0a5h,0e0h,0a6h,0e0h	; 8946  ...@.......0....
	defb 0a7h,0e0h,0a8h,0e0h,000h,0b0h,000h,0e0h,001h,040h,001h,0e0h,002h,0e0h,003h,0e0h	; 8956  .........@......
	defb 003h,030h,005h,0e0h,006h,0e0h,007h,0e0h,008h,0e0h,0ffh	; 8966  .0.........

; ----------------------------------------------------------------------
; DATOS partitura_8971: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x44 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (93 bytes)
;   0x8971..0x89ce  (93 bytes)
DATA_partitura_8971:
	defb 0feh,002h,0e0h,002h,0e2h,001h,080h,0e0h,081h,030h,081h,090h,082h,000h,084h,000h	; 8971  .........0......
	defb 086h,000h,085h,000h,084h,000h,082h,000h,081h,090h,081h,030h,080h,0e0h,080h,0a0h	; 8981  ...........0....
	defb 041h,090h,041h,030h,040h,0e0h,040h,0a0h,041h,090h,041h,030h,040h,0e0h,040h,0a0h	; 8991  A.A0@.@.A.A0@.@.
	defb 021h,090h,021h,030h,020h,0e0h,020h,0a0h,021h,090h,021h,030h,020h,0e0h,020h,0a0h	; 89a1  !.!0 . .!.!0 . .
	defb 021h,090h,021h,030h,020h,0e0h,020h,0a0h,011h,090h,011h,030h,010h,0e0h,010h,0a0h	; 89b1  !.!0 . ....0....
	defb 011h,090h,011h,030h,010h,0e0h,010h,0a0h,011h,090h,011h,030h,0ffh	; 89c1  ...0.......0.

; ----------------------------------------------------------------------
; DATOS partitura_89CE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x44 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (99 bytes)
;   0x89ce..0x8a31  (99 bytes)
DATA_partitura_89CE:
	defb 0feh,002h,0f8h,042h,0e2h,001h,0c0h,0e0h,0c1h,030h,0c1h,090h,0c2h,000h,0c4h,000h	; 89ce  ...B.....0......
	defb 0f8h,04eh,0c6h,000h,0c5h,000h,0c4h,000h,0c2h,000h,0c1h,090h,0c1h,030h,0c0h,0e0h	; 89de  .N...........0..
	defb 0c0h,0a0h,061h,090h,061h,030h,060h,0e0h,060h,0a0h,061h,090h,061h,030h,060h,0e0h	; 89ee  ..a.a0`.`.a.a0`.
	defb 060h,0a0h,031h,090h,031h,030h,030h,0e0h,030h,0a0h,031h,090h,031h,030h,030h,0e0h	; 89fe  `.1.100.0.1.100.
	defb 030h,0a0h,031h,090h,031h,030h,030h,0e0h,030h,0a0h,001h,090h,001h,030h,000h,0e0h	; 8a0e  0.1.100.0....0..
	defb 000h,0a0h,001h,090h,001h,030h,000h,0e0h,000h,0a0h,001h,090h,001h,030h,000h,0e0h	; 8a1e  .....0.......0..
	defb 000h,0a0h,0ffh	; 8a2e

; ----------------------------------------------------------------------
; DATOS partitura_8A31: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x45 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (59 bytes)
;   0x8a31..0x8a6c  (59 bytes)
DATA_partitura_8A31:
	defb 0f9h,0b1h,08ah,0feh,002h,0e0h,003h,0e2h,001h,0f5h,011h,017h,011h,00fh,0fbh,006h	; 8a31  ................
	defb 0f5h,011h,017h,011h,00fh,0fbh,006h,0f5h,011h,017h,011h,00fh,0fbh,008h,0f5h,001h	; 8a41  ................
	defb 017h,001h,00fh,0fbh,003h,0f5h,001h,017h,001h,00fh,0fbh,003h,0f5h,001h,017h,001h	; 8a51  ................
	defb 00fh,0fbh,003h,0f5h,001h,017h,001h,00fh,0fbh,002h,0ffh	; 8a61  ...........

; ----------------------------------------------------------------------
; DATOS partitura_8A6C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x45 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (61 bytes)
;   0x8a6c..0x8aa9  (61 bytes)
DATA_partitura_8A6C:
	defb 0f9h,0f4h,08ah,0feh,002h,0f8h,005h,0e2h,001h,0f5h,061h,018h,061h,010h,0fbh,006h	; 8a6c  ..........a.a...
	defb 0f5h,071h,018h,071h,010h,0fbh,006h,0f5h,081h,018h,081h,010h,0fbh,008h,0f5h,061h	; 8a7c  .q.q...........a
	defb 018h,061h,010h,0fbh,003h,0f5h,041h,018h,041h,010h,0fbh,003h,0f5h,011h,018h,011h	; 8a8c  .a....A.A.......
	defb 010h,0fbh,003h,0f5h,001h,018h,001h,010h,0fbh,003h,001h,018h,0ffh	; 8a9c  .............

; ----------------------------------------------------------------------
; DATOS partitura_8AA9: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x46 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0x8aa9..0x8aad  (4 bytes)
DATA_partitura_8AA9:
	defb 0f9h,0b1h,08ah,0ffh	; 8aa9

; ----------------------------------------------------------------------
; DATOS partitura_8AAD: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x45, 0x46 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (144 bytes)
;   0x8aad..0x8b3d  (144 bytes)
DATA_partitura_8AAD:
	defb 0f9h,0f4h,08ah,0ffh,0feh,002h,0e1h,001h,0e4h,01fh,001h,009h,0e2h,001h,090h,020h	; 8aad  ...............
	defb 050h,00ah,090h,00bh,090h,00ch,090h,00dh,080h,00eh,0e1h,001h,009h,0e2h,001h,080h	; 8abd  P...............
	defb 021h,060h,008h,050h,009h,040h,00ah,0e1h,001h,001h,004h,0e2h,001h,040h,020h,030h	; 8acd  !`.P.@.......@ 0
	defb 020h,040h,00bh,040h,00ch,040h,00dh,040h,00eh,0e1h,001h,004h,0e2h,001h,030h,021h	; 8add   @.@.@.@......0!
	defb 020h,008h,020h,009h,010h,00ah,0fah,0feh,002h,0f8h,042h,0e2h,001h,0c1h,050h,071h	; 8aed   . .......B...Pq
	defb 000h,0f8h,025h,0b0h,012h,0a0h,011h,0a0h,010h,0a0h,00fh,080h,00eh,0f8h,042h,0c1h	; 8afd  ..%...........B.
	defb 000h,0f8h,025h,090h,012h,080h,011h,070h,010h,060h,00fh,050h,00eh,0f8h,042h,001h	; 8b0d  ..%....p.`.P..B.
	defb 050h,001h,000h,0f8h,025h,000h,012h,000h,011h,000h,010h,000h,00fh,000h,00eh,0f8h	; 8b1d  P...%...........
	defb 042h,001h,000h,0f8h,025h,000h,012h,000h,011h,000h,010h,000h,00fh,000h,00eh,0fah	; 8b2d  B...%...........

; ----------------------------------------------------------------------
; DATOS partitura_8B3D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x47 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (62 bytes)
;   0x8b3d..0x8b7b  (62 bytes)
DATA_partitura_8B3D:
	defb 0feh,002h,0e2h,001h,0b2h,030h,0e1h,001h,0e4h,01fh,008h,0e2h,001h,071h,050h,071h	; 8b3d  .....0.......qPq
	defb 060h,071h,0f0h,071h,0e0h,072h,040h,072h,080h,072h,0e0h,073h,070h,074h,000h,004h	; 8b4d  `q.q.r@r.r.spt..
	defb 000h,021h,0f0h,022h,050h,022h,0a0h,023h,000h,023h,080h,024h,000h,025h,000h,006h	; 8b5d  .!."P".#.#.$.%..
	defb 000h,007h,000h,001h,0f0h,002h,050h,002h,0a0h,003h,000h,003h,080h,0ffh	; 8b6d  ......P.......

; ----------------------------------------------------------------------
; DATOS partitura_8B7B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x47 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (61 bytes)
;   0x8b7b..0x8bb8  (61 bytes)
DATA_partitura_8B7B:
	defb 0feh,002h,0f8h,028h,0e2h,001h,0c2h,020h,0f8h,009h,0c1h,050h,0c1h,060h,0c1h,0f0h	; 8b7b  ...(... ...P.`..
	defb 0c1h,0e0h,0c2h,040h,0c2h,080h,0c2h,0e0h,0c3h,070h,0c4h,000h,004h,000h,031h,0f0h	; 8b8b  ...@.....p....1.
	defb 032h,050h,032h,0a0h,033h,000h,033h,080h,034h,000h,035h,000h,006h,000h,007h,000h	; 8b9b  2P2.3.3.4.5.....
	defb 001h,0f0h,002h,050h,002h,0a0h,003h,000h,003h,080h,004h,000h,0ffh	; 8bab  ...P.........

; ----------------------------------------------------------------------
; DATOS partitura_8BB8: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x48 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (137 bytes)
;   0x8bb8..0x8c41  (137 bytes)
DATA_partitura_8BB8:
	defb 0feh,002h,0e3h,001h,0e4h,01fh,090h,013h,083h,040h,0e2h,001h,083h,000h,084h,000h	; 8bb8  .........@......
	defb 085h,000h,086h,000h,087h,000h,088h,000h,089h,000h,065h,000h,066h,000h,067h,000h	; 8bc8  ..........e.f.g.
	defb 030h,066h,020h,058h,020h,062h,020h,05eh,040h,05ch,040h,05ah,040h,059h,040h,058h	; 8bd8  0f X b ^@\@Z@Y@X
	defb 040h,057h,040h,056h,040h,055h,040h,054h,040h,053h,040h,052h,040h,051h,040h,050h	; 8be8  @W@V@U@T@S@R@Q@P
	defb 040h,04fh,040h,04eh,040h,04dh,020h,058h,020h,062h,020h,05eh,020h,05ch,020h,05ah	; 8bf8  @O@N@M X b ^ \ Z
	defb 020h,059h,020h,058h,020h,057h,020h,056h,020h,055h,020h,054h,020h,053h,020h,052h	; 8c08   Y X W V U T S R
	defb 020h,051h,020h,050h,020h,04fh,020h,04eh,020h,04dh,000h,058h,000h,062h,000h,05eh	; 8c18   Q P O N M.X.b.^
	defb 000h,05ch,000h,05ah,000h,059h,000h,058h,000h,057h,000h,056h,000h,055h,000h,054h	; 8c28  .\.Z.Y.X.W.V.U.T
	defb 000h,053h,000h,052h,000h,051h,000h,050h,0ffh	; 8c38  .S.R.Q.P.

; ----------------------------------------------------------------------
; DATOS partitura_8C41: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x48 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (141 bytes)
;   0x8c41..0x8cce  (141 bytes)
DATA_partitura_8C41:
	defb 0feh,002h,0f8h,038h,0e2h,001h,0c1h,013h,0f8h,028h,0c2h,071h,0c3h,091h,0c4h,090h	; 8c41  ...8.....(.q....
	defb 0c8h,050h,0f8h,038h,0c4h,000h,0c3h,000h,0c2h,000h,0c1h,080h,0f8h,025h,0a0h,066h	; 8c51  .P.8.........%.f
	defb 090h,058h,080h,062h,070h,05eh,060h,05ch,060h,05ah,060h,059h,060h,058h,060h,057h	; 8c61  .X.bp^`\`Z`Y`X`W
	defb 060h,056h,060h,055h,060h,054h,060h,053h,060h,052h,060h,051h,060h,050h,070h,04fh	; 8c71  `V`U`T`S`R`Q`PpO
	defb 070h,04eh,070h,04dh,020h,058h,020h,062h,020h,05eh,020h,05ch,020h,05ah,020h,059h	; 8c81  pNpM X b ^ \ Z Y
	defb 020h,058h,020h,057h,020h,056h,020h,055h,020h,054h,020h,053h,020h,052h,020h,051h	; 8c91   X W V U T S R Q
	defb 020h,050h,020h,04fh,020h,04eh,020h,04dh,000h,058h,000h,062h,000h,05eh,000h,05ch	; 8ca1   P O N M.X.b.^.\
	defb 000h,05ah,000h,059h,000h,058h,000h,057h,000h,056h,000h,055h,000h,054h,000h,053h	; 8cb1  .Z.Y.X.W.V.U.T.S
	defb 000h,052h,000h,051h,000h,050h,000h,04fh,000h,04eh,000h,04dh,0ffh	; 8cc1  .R.Q.P.O.N.M.

; ----------------------------------------------------------------------
; DATOS partitura_8CCE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x49 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (71 bytes)
;   0x8cce..0x8d15  (71 bytes)
DATA_partitura_8CCE:
	defb 0feh,002h,0e3h,001h,0e4h,000h,010h,020h,020h,01fh,030h,01eh,040h,01dh,050h,01ch	; 8cce  .......  .0.@.P.
	defb 060h,01bh,070h,01ah,080h,019h,090h,018h,080h,017h,070h,016h,060h,015h,030h,020h	; 8cde  `.p.......p.`.0
	defb 030h,01fh,030h,01eh,030h,01dh,030h,01ch,030h,01bh,030h,01ah,030h,019h,030h,018h	; 8cee  0.0.0.0.0.0.0.0.
	defb 030h,017h,010h,020h,010h,01fh,010h,01eh,010h,01dh,010h,01ch,010h,01bh,010h,01ah	; 8cfe  0.. ............
	defb 010h,019h,010h,018h,010h,017h,0ffh	; 8d0e

; ----------------------------------------------------------------------
; DATOS partitura_8D15: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x49 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (71 bytes)
;   0x8d15..0x8d5c  (71 bytes)
DATA_partitura_8D15:
	defb 0feh,002h,0f8h,01ah,0e2h,001h,040h,020h,050h,01fh,060h,01eh,070h,01dh,080h,01ch	; 8d15  ......@ P.`.p...
	defb 090h,01bh,0a0h,01ah,0b0h,019h,0c0h,018h,0c0h,017h,0c0h,016h,0c0h,015h,010h,020h	; 8d25  ...............
	defb 010h,01fh,010h,01eh,010h,01dh,010h,01ch,010h,01bh,010h,01ah,010h,019h,010h,018h	; 8d35  ................
	defb 010h,017h,000h,020h,000h,01fh,000h,01eh,000h,01dh,000h,01ch,000h,01bh,000h,01ah	; 8d45  ... ............
	defb 000h,019h,000h,018h,000h,017h,0ffh	; 8d55

; ----------------------------------------------------------------------
; DATOS partitura_8D5C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x4A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (98 bytes)
;   0x8d5c..0x8dbe  (98 bytes)
DATA_partitura_8D5C:
	defb 0feh,002h,0e2h,001h,022h,010h,032h,050h,043h,030h,052h,0f0h,052h,050h,052h,010h	; 8d5c  ....".2PC0R.RPR.
	defb 052h,040h,052h,090h,053h,023h,053h,080h,053h,010h,052h,0a0h,0f5h,042h,070h,042h	; 8d6c  R@R.S#S.S.R..BpB
	defb 040h,042h,010h,041h,0f0h,041h,0a0h,042h,020h,042h,050h,042h,080h,042h,0a0h,042h	; 8d7c  @B.A.A.B BPB.B.B
	defb 0c0h,0fbh,008h,0f5h,052h,070h,052h,040h,052h,010h,051h,0f0h,051h,0a0h,052h,020h	; 8d8c  ....RpR@R.Q.Q.R
	defb 052h,050h,052h,080h,052h,0a0h,052h,0c0h,0fbh,014h,0f5h,022h,070h,022h,040h,022h	; 8d9c  RPR.R.R...."p"@"
	defb 010h,021h,0f0h,021h,0a0h,022h,020h,022h,050h,022h,080h,022h,0a0h,022h,0c0h,0fbh	; 8dac  .!.!." "P"."."..
	defb 002h,0ffh	; 8dbc

; ----------------------------------------------------------------------
; DATOS partitura_8DBE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x4A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (169 bytes)
;   0x8dbe..0x8e67  (169 bytes)
DATA_partitura_8DBE:
	defb 0feh,002h,0f8h,048h,0e2h,001h,063h,010h,073h,050h,084h,030h,093h,0f0h,0a3h,050h	; 8dbe  ...H..c.sP.0...P
	defb 0b3h,010h,0c3h,040h,0c3h,090h,0c4h,023h,0c4h,080h,0c4h,010h,0c3h,0a0h,0f5h,063h	; 8dce  ...@...#.......c
	defb 070h,063h,040h,063h,010h,062h,0f0h,062h,0a0h,063h,020h,063h,050h,063h,080h,063h	; 8dde  pc@c.b.b.c cPc.c
	defb 0a0h,063h,0c0h,0fbh,004h,0f5h,073h,070h,073h,040h,073h,010h,072h,0f0h,072h,0a0h	; 8dee  .c....sps@s.r.r.
	defb 073h,020h,073h,050h,073h,080h,083h,0a0h,073h,0c0h,0fbh,004h,0f5h,083h,070h,073h	; 8dfe  s sPs...s.....ps
	defb 040h,073h,010h,082h,0f0h,082h,0a0h,083h,020h,083h,050h,083h,080h,083h,0a0h,083h	; 8e0e  @s...... .P.....
	defb 0c0h,0fbh,008h,0f5h,093h,070h,093h,040h,093h,010h,092h,0f0h,092h,0a0h,093h,020h	; 8e1e  .....p.@.......
	defb 093h,050h,093h,080h,093h,0a0h,093h,0c0h,0fbh,008h,0f5h,0a3h,070h,0a3h,040h,0a3h	; 8e2e  .P..........p.@.
	defb 010h,0a2h,0f0h,0a2h,0a0h,0a3h,020h,0a3h,050h,0a3h,080h,0a3h,0a0h,0a3h,0c0h,0fbh	; 8e3e  ...... .P.......
	defb 004h,0f5h,003h,070h,003h,040h,003h,010h,002h,0f0h,002h,0a0h,003h,020h,003h,050h	; 8e4e  ...p.@....... .P
	defb 003h,080h,003h,0a0h,003h,0c0h,0fbh,002h,0ffh	; 8e5e  .........

; ----------------------------------------------------------------------
; DATOS partitura_8E67: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x4B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (75 bytes)
;   0x8e67..0x8eb2  (75 bytes)
DATA_partitura_8E67:
	defb 0feh,002h,0e2h,001h,022h,010h,032h,050h,043h,030h,052h,0f0h,052h,050h,052h,010h	; 8e67  ....".2PC0R.RPR.
	defb 052h,040h,052h,090h,053h,023h,053h,080h,053h,010h,052h,0a0h,0f5h,042h,070h,042h	; 8e77  R@R.S#S.S.R..BpB
	defb 040h,042h,010h,041h,0f0h,041h,0a0h,042h,020h,042h,050h,042h,080h,042h,0a0h,042h	; 8e87  @B.A.A.B BPB.B.B
	defb 0c0h,0fbh,002h,0f5h,022h,070h,022h,040h,022h,010h,021h,0f0h,021h,0a0h,022h,020h	; 8e97  ...."p"@".!.!."
	defb 022h,050h,022h,080h,022h,0a0h,022h,0c0h,0fbh,002h,0ffh	; 8ea7  "P"."."....

; ----------------------------------------------------------------------
; DATOS partitura_8EB2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x4B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (77 bytes)
;   0x8eb2..0x8eff  (77 bytes)
DATA_partitura_8EB2:
	defb 0feh,002h,0f8h,048h,0e2h,001h,0a3h,010h,0b3h,050h,0c4h,030h,0c3h,0f0h,0c3h,050h	; 8eb2  ...H.....P.0...P
	defb 0c3h,010h,0c3h,040h,0c3h,090h,0c4h,023h,0c4h,080h,0c4h,010h,0c3h,0a0h,0f5h,0c3h	; 8ec2  ...@...#........
	defb 070h,0c3h,040h,0c3h,010h,0c2h,0f0h,0c2h,0a0h,0c3h,020h,0c3h,050h,0c3h,080h,0c3h	; 8ed2  p.@....... .P...
	defb 0a0h,0c3h,0c0h,0fbh,002h,0f5h,023h,070h,023h,040h,023h,010h,022h,0f0h,022h,0a0h	; 8ee2  ......#p#@#.".".
	defb 023h,020h,023h,050h,023h,080h,023h,0a0h,023h,0c0h,0fbh,002h,0ffh	; 8ef2  # #P#.#.#....

; ----------------------------------------------------------------------
; DATOS partitura_8EFF: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x4C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (64 bytes)
;   0x8eff..0x8f3f  (64 bytes)
DATA_partitura_8EFF:
	defb 0feh,002h,0e2h,001h,091h,090h,0e1h,001h,0e4h,01fh,008h,0e3h,001h,0e4h,01eh,060h	; 8eff  ...............`
	defb 046h,0e4h,01ah,050h,030h,0e1h,005h,0e4h,01fh,005h,0e4h,01dh,004h,0e4h,018h,003h	; 8f0f  F..P0...........
	defb 0e1h,001h,0e4h,012h,002h,0e4h,01fh,001h,0e4h,01dh,001h,0e4h,018h,001h,0e1h,003h	; 8f1f  ................
	defb 0e4h,012h,001h,0e4h,010h,001h,0e4h,00eh,000h,0e4h,00ch,000h,0e4h,00ah,000h,0ffh	; 8f2f  ................

; ----------------------------------------------------------------------
; DATOS partitura_8F3F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x4C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (73 bytes)
;   0x8f3f..0x8f88  (73 bytes)
DATA_partitura_8F3F:
	defb 0feh,002h,0f8h,043h,0e2h,001h,0c1h,036h,0c2h,000h,0c3h,000h,0c4h,000h,0c3h,000h	; 8f3f  ...C...6........
	defb 0c2h,060h,0c1h,0a0h,0c1h,060h,0c1h,020h,0c0h,0f0h,0c0h,0d0h,021h,036h,022h,000h	; 8f4f  .`...`. ....!6".
	defb 023h,000h,024h,000h,023h,000h,022h,060h,021h,0a0h,021h,060h,021h,020h,020h,0f0h	; 8f5f  #.$.#."`!.!`!  .
	defb 020h,0d0h,001h,036h,002h,000h,003h,000h,004h,000h,003h,000h,002h,060h,001h,0a0h	; 8f6f   ..6.........`..
	defb 001h,060h,001h,020h,000h,0f0h,000h,0d0h,0ffh	; 8f7f  .`. .....

; ----------------------------------------------------------------------
; DATOS partitura_8F88: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x4D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (36 bytes)
;   0x8f88..0x8fac  (36 bytes)
DATA_partitura_8F88:
	defb 0feh,002h,0e0h,002h,0e2h,001h,0f5h,020h,070h,030h,066h,030h,060h,030h,058h,030h	; 8f88  ....... p0f0`0X0
	defb 053h,0fbh,004h,000h,070h,000h,066h,000h,060h,000h,058h,000h,053h,000h,070h,000h	; 8f98  S...p.f.`.X.S.p.
	defb 066h,000h,060h,0ffh	; 8fa8

; ----------------------------------------------------------------------
; DATOS partitura_8FAC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x4D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (40 bytes)
;   0x8fac..0x8fd4  (40 bytes)
DATA_partitura_8FAC:
	defb 0feh,002h,0f8h,005h,0e2h,001h,0f5h,070h,070h,080h,066h,090h,060h,090h,058h,090h	; 8fac  .......pp.f.`.X.
	defb 053h,0fbh,004h,040h,070h,030h,066h,020h,060h,010h,058h,000h,053h,000h,070h,000h	; 8fbc  S..@p0f `.X.S.p.
	defb 066h,000h,060h,000h,058h,000h,053h,0ffh	; 8fcc  f.`.X.S.

; ----------------------------------------------------------------------
; DATOS partitura_8FD4: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x4E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (137 bytes)
;   0x8fd4..0x905d  (137 bytes)
DATA_partitura_8FD4:
	defb 0feh,002h,0e3h,001h,0e4h,01fh,090h,013h,082h,040h,0e2h,001h,082h,000h,083h,000h	; 8fd4  .........@......
	defb 084h,000h,085h,000h,086h,000h,087h,000h,088h,000h,064h,000h,065h,000h,064h,000h	; 8fe4  ..........d.e.d.
	defb 030h,056h,020h,048h,020h,052h,020h,04eh,040h,04ch,040h,04ah,040h,049h,040h,048h	; 8ff4  0V H R N@L@J@I@H
	defb 040h,047h,040h,046h,040h,045h,040h,044h,040h,043h,040h,042h,040h,041h,040h,040h	; 9004  @G@F@E@D@C@B@A@@
	defb 040h,03fh,040h,03eh,040h,03dh,020h,048h,020h,052h,020h,04eh,020h,04ch,020h,04ah	; 9014  @?@>@= H R N L J
	defb 020h,049h,020h,048h,020h,047h,020h,046h,020h,045h,020h,044h,020h,043h,020h,042h	; 9024   I H G F E D C B
	defb 020h,041h,020h,040h,020h,03fh,020h,03eh,020h,03dh,000h,048h,000h,052h,000h,04eh	; 9034   A @ ? > =.H.R.N
	defb 000h,04ch,000h,04ah,000h,049h,000h,048h,000h,047h,000h,046h,000h,045h,000h,044h	; 9044  .L.J.I.H.G.F.E.D
	defb 000h,043h,000h,042h,000h,041h,000h,040h,0ffh	; 9054  .C.B.A.@.

; ----------------------------------------------------------------------
; DATOS partitura_905D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x4E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (141 bytes)
;   0x905d..0x90ea  (141 bytes)
DATA_partitura_905D:
	defb 0feh,002h,0f8h,03eh,0e2h,001h,0c1h,003h,0f8h,028h,0c1h,071h,0c2h,091h,0c3h,090h	; 905d  ...>.....(.q....
	defb 0c4h,050h,0f8h,03eh,0c3h,000h,0c4h,000h,0c2h,000h,0c1h,080h,0f8h,025h,0a0h,056h	; 906d  .P.>.........%.V
	defb 090h,048h,080h,052h,070h,04eh,060h,04ch,060h,04ah,060h,049h,060h,048h,060h,047h	; 907d  .H.RpN`L`J`I`H`G
	defb 060h,046h,060h,045h,060h,044h,060h,043h,060h,042h,060h,041h,060h,040h,070h,03fh	; 908d  `F`E`D`C`B`A`@p?
	defb 070h,03eh,070h,03dh,020h,048h,020h,052h,020h,04eh,020h,04ch,020h,04ah,020h,049h	; 909d  p>p= H R N L J I
	defb 020h,048h,020h,047h,020h,046h,020h,045h,020h,044h,020h,043h,020h,042h,020h,041h	; 90ad   H G F E D C B A
	defb 020h,040h,020h,03fh,020h,03eh,020h,03dh,000h,048h,000h,052h,000h,04eh,000h,04ch	; 90bd   @ ? > =.H.R.N.L
	defb 000h,04ah,000h,049h,000h,048h,000h,047h,000h,046h,000h,045h,000h,044h,000h,043h	; 90cd  .J.I.H.G.F.E.D.C
	defb 000h,042h,000h,041h,000h,040h,000h,03fh,000h,03eh,000h,03dh,0ffh	; 90dd  .B.A.@.?.>.=.

; ----------------------------------------------------------------------
; DATOS partitura_90EA: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x4F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (51 bytes)
;   0x90ea..0x911d  (51 bytes)
DATA_partitura_90EA:
	defb 0feh,002h,0e0h,003h,0e2h,001h,032h,033h,032h,013h,041h,0f3h,041h,0d3h,051h,0b3h	; 90ea  ......232.A.A.Q.
	defb 051h,093h,051h,073h,051h,053h,051h,043h,051h,03bh,051h,037h,051h,033h,0e2h,00bh	; 90fa  Q.QsQSQCQ.Q7Q3..
	defb 051h,037h,0e2h,001h,001h,053h,001h,043h,001h,03bh,001h,037h,001h,033h,0e2h,00dh	; 910a  Q7...S.C...7.3..
	defb 001h,037h,0ffh	; 911a

; ----------------------------------------------------------------------
; DATOS partitura_911D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x4F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (51 bytes)
;   0x911d..0x9150  (51 bytes)
DATA_partitura_911D:
	defb 0feh,002h,0f8h,009h,0e2h,001h,092h,035h,0a2h,015h,0b1h,0f5h,0c1h,0d5h,0c1h,0b5h	; 911d  .......5........
	defb 0c1h,095h,0c1h,075h,0c1h,055h,0c1h,045h,0c1h,03dh,0c1h,039h,0c1h,035h,0e2h,00bh	; 912d  ...u.U.E.=.9.5..
	defb 0c1h,039h,0e2h,001h,001h,055h,001h,045h,001h,03dh,001h,039h,001h,035h,0e2h,010h	; 913d  .9...U.E.=.9.5..
	defb 001h,039h,0ffh	; 914d

; ----------------------------------------------------------------------
; DATOS partitura_9150: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x50 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (41 bytes)
;   0x9150..0x9179  (41 bytes)
DATA_partitura_9150:
	defb 0feh,002h,0e1h,001h,0e4h,000h,003h,0e4h,002h,005h,0e4h,004h,007h,0e4h,006h,008h	; 9150  ................
	defb 0e4h,008h,009h,0e2h,003h,000h,008h,0e1h,001h,0e4h,000h,000h,0e4h,002h,001h,0e4h	; 9160  ................
	defb 004h,001h,0e4h,006h,002h,0e4h,008h,002h,0ffh	; 9170  .........

; ----------------------------------------------------------------------
; DATOS partitura_9179: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x50 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (33 bytes)
;   0x9179..0x919a  (33 bytes)
DATA_partitura_9179:
	defb 0feh,002h,0f8h,009h,0e2h,001h,0c1h,0a0h,0c1h,000h,0c0h,080h,0a0h,070h,080h,060h	; 9179  .............p.`
	defb 0e2h,003h,000h,008h,0e2h,001h,001h,0a0h,001h,000h,000h,080h,000h,070h,000h,060h	; 9189  .............p.`
	defb 0ffh	; 9199

; ----------------------------------------------------------------------
; DATOS partitura_919A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x51 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (19 bytes)
;   0x919a..0x91ad  (19 bytes)
DATA_partitura_919A:
	defb 0feh,002h,0e1h,001h,0e4h,01fh,006h,008h,0e0h,006h,0e1h,001h,003h,0e0h,006h,0e1h	; 919a  ................
	defb 001h,001h,0ffh	; 91aa

; ----------------------------------------------------------------------
; DATOS partitura_91AD: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x51 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0x91ad..0x91c6  (25 bytes)
DATA_partitura_91AD:
	defb 0feh,002h,0f8h,009h,0e2h,001h,0a5h,006h,0f8h,005h,061h,060h,0e0h,005h,0e2h,001h	; 91ad  ..........a`....
	defb 0f8h,009h,005h,006h,0f8h,005h,001h,060h,0ffh	; 91bd  .......`.

; ----------------------------------------------------------------------
; DATOS partitura_91C6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x52 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (19 bytes)
;   0x91c6..0x91d9  (19 bytes)
DATA_partitura_91C6:
	defb 0feh,002h,0e1h,001h,0e4h,01fh,004h,006h,0e0h,006h,0e1h,001h,002h,0e0h,006h,0e1h	; 91c6  ................
	defb 001h,000h,0ffh	; 91d6

; ----------------------------------------------------------------------
; DATOS partitura_91D9: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x52 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0x91d9..0x91f2  (25 bytes)
DATA_partitura_91D9:
	defb 0feh,002h,0f8h,009h,0e2h,001h,075h,006h,0f8h,005h,031h,060h,0e0h,005h,0e2h,001h	; 91d9  ......u...1`....
	defb 0f8h,009h,005h,006h,0f8h,005h,001h,060h,0ffh	; 91e9  .......`.

; ----------------------------------------------------------------------
; DATOS partitura_91F2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x53 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (80 bytes)
;   0x91f2..0x9242  (80 bytes)
DATA_partitura_91F2:
	defb 0feh,002h,0e0h,002h,0e2h,001h,064h,09ah,064h,030h,063h,070h,063h,020h,062h,0a0h	; 91f2  ......d.d0cpc b.
	defb 062h,050h,062h,010h,061h,0d0h,0f5h,064h,09ah,064h,030h,063h,070h,063h,020h,062h	; 9202  bPb.a..d.d0cpc b
	defb 0a0h,062h,050h,062h,010h,061h,0d0h,0fbh,002h,0f5h,034h,09ah,034h,030h,033h,070h	; 9212  .bPb.a....4.403p
	defb 033h,020h,032h,0a0h,032h,050h,032h,010h,031h,0d0h,0fbh,002h,0f5h,014h,09ah,014h	; 9222  3 2.2P2.1.......
	defb 030h,013h,070h,013h,020h,012h,0a0h,012h,050h,012h,010h,011h,0d0h,0fbh,002h,0ffh	; 9232  0.p. ...P.......

; ----------------------------------------------------------------------
; DATOS partitura_9242: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x53 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (92 bytes)
;   0x9242..0x929e  (92 bytes)
DATA_partitura_9242:
	defb 0feh,002h,0f8h,00ch,0e2h,001h,0c4h,09ah,0c4h,030h,0c3h,070h,0c3h,020h,0c2h,0a0h	; 9242  .........0.p. ..
	defb 0c2h,050h,0c2h,010h,0c1h,0d0h,0f8h,009h,0f5h,0c4h,09ah,0c4h,030h,0c3h,070h,0c3h	; 9252  .P..........0.p.
	defb 020h,0c2h,0a0h,0c2h,050h,0c2h,010h,0c1h,0d0h,0f8h,00ch,0fbh,002h,0f8h,009h,0f5h	; 9262   ...P...........
	defb 084h,09ah,084h,030h,083h,070h,083h,020h,082h,0a0h,082h,050h,082h,010h,081h,0d0h	; 9272  ...0.p. ...P....
	defb 0f8h,00ch,0fbh,002h,0f8h,009h,0f5h,024h,09ah,024h,030h,023h,070h,023h,020h,022h	; 9282  .......$.$0#p# "
	defb 0a0h,022h,050h,022h,010h,021h,0d0h,0f8h,00ch,0fbh,002h,0ffh	; 9292  ."P".!......

; ----------------------------------------------------------------------
; DATOS partitura_929E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x54 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (144 bytes)
;   0x929e..0x932e  (144 bytes)
DATA_partitura_929E:
	defb 0feh,002h,0e0h,002h,0e2h,001h,0a0h,0f0h,0a2h,080h,0a3h,000h,0a4h,000h,042h,080h	; 929e  ..............B.
	defb 034h,000h,0a1h,080h,0a2h,040h,0a3h,000h,0a4h,0e0h,0a5h,0c0h,0a6h,0a0h,0a2h,080h	; 92ae  4....@..........
	defb 0a3h,040h,0a4h,000h,0a5h,0e0h,0a6h,0c0h,0a7h,0a0h,0f5h,097h,000h,09ah,030h,093h	; 92be  .@............0.
	defb 090h,092h,000h,091h,030h,096h,090h,093h,080h,09dh,000h,095h,030h,093h,000h,094h	; 92ce  ....0.......0...
	defb 000h,095h,000h,096h,000h,0fbh,002h,097h,000h,098h,000h,099h,000h,093h,020h,096h	; 92de  .............. .
	defb 000h,067h,000h,06ah,030h,063h,090h,062h,000h,061h,030h,066h,090h,063h,080h,06dh	; 92ee  .g.j0c.b.a0f.c.m
	defb 000h,065h,030h,068h,000h,069h,000h,063h,020h,066h,000h,046h,000h,049h,030h,041h	; 92fe  .e0h.i.c f.F.I0A
	defb 090h,041h,000h,042h,030h,045h,090h,042h,080h,04ch,000h,044h,030h,047h,000h,048h	; 930e  .A.B0E.B.L.D0G.H
	defb 000h,042h,020h,045h,000h,025h,000h,028h,030h,021h,090h,024h,000h,026h,030h,0ffh	; 931e  .B E.%.(0!.$.&0.

; ----------------------------------------------------------------------
; DATOS partitura_932E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x54 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (154 bytes)
;   0x932e..0x93c8  (154 bytes)
DATA_partitura_932E:
	defb 0feh,002h,0f8h,028h,0e2h,001h,0c0h,0f0h,0c2h,080h,0c3h,000h,0c4h,000h,002h,080h	; 932e  ...(............
	defb 024h,000h,0c1h,080h,0c2h,040h,0c3h,000h,0c4h,0e0h,0c5h,0c0h,0c6h,0a0h,0c2h,080h	; 933e  $....@..........
	defb 0c3h,040h,0c4h,000h,0c5h,0e0h,0c6h,0c0h,0c7h,0a0h,0f5h,0f8h,064h,0c7h,000h,0cah	; 934e  .@..........d...
	defb 030h,0c3h,090h,0c2h,000h,0c1h,030h,0c6h,090h,0c3h,080h,0cdh,000h,0c5h,030h,0f8h	; 935e  0.....0.......0.
	defb 027h,0c3h,000h,0c4h,000h,0c5h,000h,0c6h,000h,0c7h,000h,0c8h,000h,0c9h,000h,0c3h	; 936e  '...............
	defb 020h,0c6h,000h,0fbh,002h,0f8h,064h,067h,000h,06ah,030h,063h,090h,062h,000h,061h	; 937e   .....dg.j0c.b.a
	defb 030h,066h,090h,063h,080h,06dh,000h,065h,030h,0f8h,027h,068h,000h,069h,000h,063h	; 938e  0f.c.m.e0.'h.i.c
	defb 020h,066h,000h,046h,000h,049h,030h,041h,090h,041h,000h,042h,030h,045h,090h,042h	; 939e   f.F.I0A.A.B0E.B
	defb 080h,04ch,000h,044h,030h,047h,000h,048h,000h,042h,020h,045h,000h,025h,000h,028h	; 93ae  .L.D0G.H.B E.%.(
	defb 030h,021h,090h,024h,000h,026h,030h,024h,090h,0ffh	; 93be  0!.$.&0$..

; ----------------------------------------------------------------------
; DATOS partitura_93C8: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x55 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (65 bytes)
;   0x93c8..0x9409  (65 bytes)
DATA_partitura_93C8:
	defb 0feh,002h,0e3h,001h,0e4h,014h,090h,020h,050h,014h,0e2h,001h,093h,015h,092h,026h	; 93c8  ....... P......&
	defb 083h,09fh,074h,01dh,072h,059h,076h,0bdh,077h,03dh,076h,0b6h,079h,09eh,075h,0e9h	; 93d8  ..t.rYv.w=v.y.u.
	defb 07bh,0e9h,076h,0ceh,07ch,034h,07dh,0b6h,07eh,09eh,043h,09fh,044h,01dh,042h,059h	; 93e8  {.v.|4}.~.C.D.BY
	defb 046h,0bdh,047h,03dh,046h,0b6h,049h,09eh,045h,0e9h,04bh,0e9h,046h,0ceh,04ch,034h	; 93f8  F.G=F.I.E.K.F.L4
	defb 0ffh	; 9408

; ----------------------------------------------------------------------
; DATOS partitura_9409: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x55 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (63 bytes)
;   0x9409..0x9448  (63 bytes)
DATA_partitura_9409:
	defb 0feh,002h,0f8h,014h,0e2h,001h,0c3h,015h,0c2h,026h,0b3h,09fh,0a4h,01dh,0a2h,059h	; 9409  .........&.....Y
	defb 0a6h,0bdh,0a7h,03dh,0a6h,0b6h,0a9h,09eh,0a5h,0e9h,0abh,0e9h,0a6h,0ceh,0ach,034h	; 9419  ...=...........4
	defb 0adh,0b6h,0aeh,09eh,023h,09fh,024h,01dh,022h,059h,026h,0bdh,027h,03dh,026h,0b6h	; 9429  ....#.$."Y&.'=&.
	defb 029h,09eh,025h,0e9h,02bh,0e9h,026h,0ceh,02ch,034h,02dh,0b6h,02eh,09eh,0ffh	; 9439  ).%.+.&.,4-....

; ----------------------------------------------------------------------
; DATOS partitura_9448: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x56 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (60 bytes)
;   0x9448..0x9484  (60 bytes)
DATA_partitura_9448:
	defb 0feh,002h,0e1h,001h,0e4h,000h,001h,009h,0e2h,001h,090h,020h,050h,00ah,090h,00bh	; 9448  ........... P...
	defb 090h,00ch,0e1h,001h,009h,0e2h,001h,080h,021h,060h,008h,050h,009h,040h,00ah,009h	; 9458  ........!`.P.@..
	defb 0e1h,001h,001h,002h,0e2h,001h,020h,020h,010h,00ah,010h,00bh,010h,00ch,0e1h,001h	; 9468  ......  ........
	defb 001h,0e2h,001h,010h,021h,000h,008h,000h,009h,000h,00ah,0ffh	; 9478  ....!.......

; ----------------------------------------------------------------------
; DATOS partitura_9484: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x56 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (61 bytes)
;   0x9484..0x94c1  (61 bytes)
DATA_partitura_9484:
	defb 0feh,002h,0f8h,025h,0e2h,001h,0c0h,012h,0b0h,011h,0a0h,010h,0a0h,00fh,080h,00eh	; 9484  ...%............
	defb 0f8h,002h,080h,020h,0f8h,025h,090h,012h,080h,011h,070h,010h,060h,00fh,050h,00eh	; 9494  ... .%....p.`.P.
	defb 0f8h,025h,000h,012h,000h,011h,000h,010h,000h,00fh,000h,00eh,0f8h,002h,000h,020h	; 94a4  .%.............
	defb 0f8h,025h,000h,012h,000h,011h,000h,010h,000h,00fh,000h,00eh,0ffh	; 94b4  .%...........

; ----------------------------------------------------------------------
; DATOS partitura_94C1: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x57 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (45 bytes)
;   0x94c1..0x94ee  (45 bytes)
DATA_partitura_94C1:
	defb 0feh,002h,0e0h,001h,0e2h,001h,000h,0e0h,000h,0e8h,000h,0f0h,000h,0f8h,000h,0e8h	; 94c1  ................
	defb 000h,0f0h,000h,0f8h,001h,000h,001h,020h,001h,040h,001h,060h,001h,080h,001h,0a0h	; 94d1  ....... .@.`....
	defb 001h,0c0h,001h,020h,001h,040h,001h,060h,001h,080h,001h,0a0h,0ffh	; 94e1  ... .@.`.....

; ----------------------------------------------------------------------
; DATOS partitura_94EE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x57 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (47 bytes)
;   0x94ee..0x951d  (47 bytes)
DATA_partitura_94EE:
	defb 0feh,002h,0f8h,005h,0e2h,001h,000h,0e0h,010h,0e8h,020h,0f0h,030h,0f8h,000h,0e8h	; 94ee  .......... .0...
	defb 000h,0f0h,000h,0f8h,041h,000h,051h,020h,061h,040h,061h,060h,061h,080h,061h,0a0h	; 94fe  ....A.Q a@a`a.a.
	defb 061h,0c0h,001h,020h,001h,040h,001h,060h,001h,080h,001h,0a0h,001h,0c0h,0ffh	; 950e  a.. .@.`.......

; ----------------------------------------------------------------------
; DATOS partitura_951D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x58 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0x951d..0x951e  (1 bytes)
DATA_partitura_951D:
	defb 0ffh	; 951d

; ----------------------------------------------------------------------
; DATOS partitura_951E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x59 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (73 bytes)
;   0x951e..0x9567  (73 bytes)
DATA_partitura_951E:
	defb 0feh,002h,0e3h,001h,0e4h,018h,043h,000h,0e4h,019h,052h,000h,0e4h,01ah,063h,000h	; 951e  ......C...R...c.
	defb 0e4h,01bh,062h,000h,0e4h,01ch,063h,000h,0e4h,01dh,053h,000h,0e4h,01dh,062h,000h	; 952e  ..b...c...S...b.
	defb 0e4h,01eh,063h,000h,0e4h,01ch,081h,080h,0e3h,003h,0e4h,01fh,063h,000h,061h,080h	; 953e  ..c.........c.a.
	defb 072h,000h,082h,080h,051h,080h,042h,000h,041h,0c0h,0e1h,002h,0e4h,004h,0f5h,005h	; 954e  r...Q.B.A.......
	defb 0fbh,0f8h,0e1h,002h,004h,003h,002h,001h,0ffh	; 955e  .........

; ----------------------------------------------------------------------
; DATOS partitura_9567: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x59 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (65 bytes)
;   0x9567..0x95a8  (65 bytes)
DATA_partitura_9567:
	defb 0feh,002h,0f8h,00ch,0e2h,001h,083h,000h,092h,000h,083h,000h,082h,000h,083h,000h	; 9567  ................
	defb 093h,000h,0f5h,0a2h,000h,0a3h,000h,0a1h,080h,0a3h,000h,0a1h,080h,0a2h,000h,0a2h	; 9577  ................
	defb 080h,091h,080h,082h,000h,0fbh,003h,0f8h,01ah,0e2h,002h,0f5h,011h,0feh,0fbh,0f0h	; 9587  ................
	defb 011h,0feh,0e2h,002h,021h,0feh,011h,0feh,001h,0feh,001h,0feh,001h,0feh,001h,0feh	; 9597  ....!...........
	defb 0ffh	; 95a7

; ----------------------------------------------------------------------
; DATOS partitura_95A8: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x5A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (55 bytes)
;   0x95a8..0x95df  (55 bytes)
DATA_partitura_95A8:
	defb 0feh,002h,0e0h,002h,0e2h,001h,030h,0c7h,030h,0b0h,040h,09ch,040h,08ah,050h,07bh	; 95a8  ......0.0.@.@.P{
	defb 050h,06dh,060h,060h,060h,05ah,060h,052h,050h,048h,050h,044h,050h,040h,050h,03dh	; 95b8  Pm```Z`RPHPDP@P=
	defb 000h,0c7h,000h,0b0h,000h,09ch,000h,08ah,000h,07bh,000h,06dh,000h,060h,000h,05ah	; 95c8  .........{.m.`.Z
	defb 000h,052h,000h,048h,000h,044h,0ffh	; 95d8

; ----------------------------------------------------------------------
; DATOS partitura_95DF: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x5A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (59 bytes)
;   0x95df..0x961a  (59 bytes)
DATA_partitura_95DF:
	defb 0feh,002h,0f8h,005h,0e2h,001h,050h,0c7h,060h,0b0h,070h,09ch,080h,08ah,090h,07bh	; 95df  ......P.`.p....{
	defb 0a0h,06dh,0b0h,060h,0c0h,05ah,0c0h,052h,080h,048h,080h,044h,080h,040h,080h,03dh	; 95ef  .m.`.Z.R.H.D.@.=
	defb 000h,0c7h,000h,0b0h,000h,09ch,000h,08ah,000h,07bh,000h,06dh,000h,060h,000h,05ah	; 95ff  .........{.m.`.Z
	defb 000h,052h,000h,048h,000h,044h,000h,040h,000h,03dh,0ffh	; 960f  .R.H.D.@.=.

; ----------------------------------------------------------------------
; DATOS partitura_961A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x5B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (22 bytes)
;   0x961a..0x9630  (22 bytes)
DATA_partitura_961A:
	defb 0feh,002h,0e2h,001h,0e5h,009h,000h,004h,091h,080h,0e8h,0e1h,001h,0e4h,000h,00ah	; 961a  ................
	defb 0e0h,006h,0e1h,001h,004h,0ffh	; 962a

; ----------------------------------------------------------------------
; DATOS partitura_9630: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x5B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0x9630..0x9649  (25 bytes)
DATA_partitura_9630:
	defb 0feh,002h,0f8h,009h,0e2h,001h,0c5h,006h,0f8h,005h,061h,009h,0e0h,005h,0e2h,001h	; 9630  ..........a.....
	defb 0f8h,009h,005h,006h,0f8h,005h,001h,009h,0ffh	; 9640  .........

; ----------------------------------------------------------------------
; DATOS partitura_9649: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x5C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (23 bytes)
;   0x9649..0x9660  (23 bytes)
DATA_partitura_9649:
	defb 0feh,002h,0e2h,002h,090h,023h,060h,023h,050h,023h,040h,023h,030h,023h,050h,023h	; 9649  .....#`#P#@#0#P#
	defb 030h,023h,020h,023h,010h,023h,0ffh	; 9659

; ----------------------------------------------------------------------
; DATOS partitura_9660: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x5C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0x9660..0x9679  (25 bytes)
DATA_partitura_9660:
	defb 0feh,002h,0f8h,012h,0e2h,002h,0c0h,023h,060h,023h,050h,023h,040h,023h,030h,023h	; 9660  .......#`#P#@#0#
	defb 020h,023h,010h,023h,000h,023h,000h,023h,0ffh	; 9670   #.#.#.#.

; ----------------------------------------------------------------------
; DATOS partitura_9679: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x5D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (72 bytes)
;   0x9679..0x96c1  (72 bytes)
DATA_partitura_9679:
	defb 0feh,002h,0e3h,001h,0e4h,000h,032h,000h,0e1h,002h,006h,0e4h,002h,003h,0e4h,001h	; 9679  ......2.........
	defb 004h,0e4h,000h,002h,0e4h,003h,001h,0e4h,002h,002h,0e4h,001h,001h,0e4h,002h,001h	; 9689  ................
	defb 0e4h,001h,002h,0e4h,000h,001h,0e4h,003h,001h,0e4h,002h,001h,0e4h,001h,001h,0e4h	; 9699  ................
	defb 000h,001h,0e4h,002h,001h,0e4h,001h,001h,0e4h,000h,000h,0e4h,003h,000h,0e4h,002h	; 96a9  ................
	defb 000h,0e4h,001h,000h,0e4h,000h,000h,0ffh	; 96b9  ........

; ----------------------------------------------------------------------
; DATOS partitura_96C1: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x5D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (27 bytes)
;   0x96c1..0x96dc  (27 bytes)
DATA_partitura_96C1:
	defb 0feh,002h,0e2h,001h,0f8h,005h,003h,00ah,0f8h,01ah,0e2h,002h,000h,00bh,000h,00ah	; 96c1  ................
	defb 000h,009h,000h,00ah,000h,00dh,000h,00ch,000h,00bh,0ffh	; 96d1  ...........

; ----------------------------------------------------------------------
; DATOS partitura_96DC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x5E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0x96dc..0x96f5  (25 bytes)
DATA_partitura_96DC:
	defb 0feh,002h,0e0h,002h,0e2h,001h,000h,042h,010h,050h,000h,060h,000h,030h,000h,050h	; 96dc  .......B.P.`.0.P
	defb 000h,060h,000h,050h,010h,048h,020h,040h,0ffh	; 96ec  .`.P.H @.

; ----------------------------------------------------------------------
; DATOS partitura_96F5: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x5E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (29 bytes)
;   0x96f5..0x9712  (29 bytes)
DATA_partitura_96F5:
	defb 0feh,002h,0f8h,005h,0e2h,001h,000h,032h,010h,040h,000h,050h,0f8h,01ah,000h,020h	; 96f5  .......2.@.P...
	defb 000h,040h,000h,050h,0f8h,005h,000h,040h,010h,038h,020h,030h,0ffh	; 9705  .@.P...@.8 0.

; ----------------------------------------------------------------------
; DATOS partitura_9712: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x5F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0x9712..0x9713  (1 bytes)
DATA_partitura_9712:
	defb 0ffh	; 9712

; ----------------------------------------------------------------------
; DATOS partitura_9713: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x5F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (1 bytes)
;   0x9713..0x9714  (1 bytes)
DATA_partitura_9713:
	defb 0ffh	; 9713

; ----------------------------------------------------------------------
; DATOS partitura_9714: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x60 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (109 bytes)
;   0x9714..0x9781  (109 bytes)
DATA_partitura_9714:
	defb 0feh,002h,0e1h,001h,0e4h,01fh,001h,009h,0e2h,001h,090h,020h,050h,00ah,090h,00bh	; 9714  ........... P...
	defb 090h,00ch,090h,00dh,080h,00eh,0e1h,001h,009h,0e2h,001h,080h,021h,060h,008h,050h	; 9724  ............!`.P
	defb 009h,040h,00ah,0e1h,001h,001h,004h,0feh,002h,0e3h,001h,0e4h,013h,053h,000h,0e4h	; 9734  .@...........S..
	defb 014h,062h,000h,0e4h,015h,073h,000h,0e4h,016h,072h,000h,0e4h,017h,073h,000h,0e4h	; 9744  .b...s...r...s..
	defb 018h,063h,000h,0f5h,0e3h,001h,0e4h,01dh,072h,000h,0e4h,01eh,073h,000h,0e4h,01ch	; 9754  .c......r...s...
	defb 071h,080h,0e3h,003h,0e4h,01fh,073h,000h,0fbh,008h,071h,080h,082h,000h,092h,080h	; 9764  q.....s...q.....
	defb 061h,080h,052h,000h,0e4h,01fh,051h,0c0h,042h,060h,033h,000h,0ffh	; 9774  a.R...Q.B`3..

; ----------------------------------------------------------------------
; DATOS partitura_9781: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x60 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (108 bytes)
;   0x9781..0x97ed  (108 bytes)
DATA_partitura_9781:
	defb 0feh,002h,0f8h,042h,0e2h,001h,0c1h,050h,071h,000h,0f8h,025h,0b0h,012h,0a0h,011h	; 9781  ...B...Pq..%....
	defb 0a0h,010h,0a0h,00fh,080h,00eh,0f8h,042h,0c1h,000h,0f8h,025h,090h,012h,080h,011h	; 9791  .......B...%....
	defb 070h,010h,060h,00fh,050h,00eh,0f8h,042h,001h,050h,001h,000h,0feh,002h,0f8h,00ch	; 97a1  p.`.P..B.P......
	defb 0e2h,001h,0a3h,000h,0b2h,000h,0a3h,000h,0a2h,000h,0a3h,000h,0b3h,000h,0f5h,0c2h	; 97b1  ................
	defb 000h,0c3h,000h,0c1h,080h,0c3h,000h,0c1h,080h,0c2h,000h,0fbh,008h,0c2h,080h,0b1h	; 97c1  ................
	defb 080h,0a2h,000h,0a1h,0c0h,092h,060h,081h,060h,083h,000h,081h,080h,082h,000h,082h	; 97d1  ......`.`.......
	defb 080h,071h,070h,062h,000h,061h,0c0h,052h,060h,041h,060h,0ffh	; 97e1  .qpb.a.R`A`.

; ----------------------------------------------------------------------
; DATOS partitura_97ED: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x61 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (47 bytes)
;   0x97ed..0x981c  (47 bytes)
DATA_partitura_97ED:
	defb 0feh,002h,0e0h,002h,0e2h,001h,082h,015h,072h,09fh,063h,01dh,064h,059h,065h,0bdh	; 97ed  ........r.c.dYe.
	defb 066h,03dh,057h,0b6h,058h,09eh,059h,0e9h,05ah,0e9h,04bh,0ceh,012h,015h,012h,09fh	; 97fd  f=W.X.Y.Z.K.....
	defb 013h,01dh,014h,059h,015h,0bdh,016h,03dh,017h,0b6h,018h,09eh,019h,0e9h,0ffh	; 980d  ...Y...=.......

; ----------------------------------------------------------------------
; DATOS partitura_981C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x61 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (51 bytes)
;   0x981c..0x984f  (51 bytes)
DATA_partitura_981C:
	defb 0feh,002h,0f8h,014h,0e2h,001h,0c2h,015h,0b2h,09fh,0a3h,01dh,0a4h,059h,0a5h,0bdh	; 981c  .............Y..
	defb 0a6h,03dh,097h,0b6h,098h,09eh,099h,0e9h,09ah,0e9h,08bh,0ceh,002h,015h,002h,09fh	; 982c  .=..............
	defb 003h,01dh,004h,059h,005h,0bdh,006h,03dh,007h,0b6h,008h,09eh,009h,0e9h,00ah,0e9h	; 983c  ...Y...=........
	defb 00bh,0ceh,0ffh	; 984c

; ----------------------------------------------------------------------
; DATOS partitura_984F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x62 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (127 bytes)
;   0x984f..0x98ce  (127 bytes)
DATA_partitura_984F:
	defb 0feh,002h,0e0h,003h,0e2h,001h,0c6h,000h,0c5h,010h,0c7h,000h,0a7h,000h,0a7h,080h	; 984f  ................
	defb 0a5h,000h,0a8h,000h,0a5h,000h,0a6h,000h,0a7h,000h,0a8h,000h,0a9h,000h,0b5h,000h	; 985f  ................
	defb 0b6h,000h,0b5h,000h,0a3h,000h,0a5h,010h,0a7h,000h,0a2h,000h,0a7h,080h,0a5h,000h	; 986f  ................
	defb 0a3h,000h,0a5h,000h,0a6h,000h,0a7h,000h,0a8h,000h,0a9h,000h,0a5h,000h,0a3h,000h	; 987f  ................
	defb 035h,000h,073h,000h,075h,010h,077h,000h,072h,000h,077h,080h,075h,000h,073h,000h	; 988f  5.s.u.w.r.w.u.s.
	defb 075h,000h,076h,000h,077h,000h,078h,000h,079h,000h,075h,000h,073h,000h,045h,000h	; 989f  u.v.w.x.y.u.s.E.
	defb 043h,000h,045h,010h,047h,000h,042h,000h,047h,080h,045h,000h,043h,000h,025h,000h	; 98af  C.E.G.B.G.E.C.%.
	defb 026h,000h,027h,000h,028h,000h,029h,000h,025h,000h,023h,000h,0f9h,053h,099h	; 98bf  &.'.(.).%.#..S.

; ----------------------------------------------------------------------
; DATOS partitura_98CE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x62 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (192 bytes)
;   0x98ce..0x998e  (192 bytes)
DATA_partitura_98CE:
	defb 0feh,002h,0f8h,028h,0e2h,001h,0c2h,000h,0c3h,010h,0c5h,000h,0c3h,090h,0c5h,080h	; 98ce  ...(............
	defb 0c3h,080h,0c5h,000h,0c8h,000h,0c4h,000h,029h,000h,0c6h,000h,0c7h,000h,0c8h,000h	; 98de  ........).......
	defb 065h,000h,066h,000h,064h,000h,0f8h,027h,0c3h,000h,0c5h,010h,0c7h,000h,0c2h,000h	; 98ee  e.f.d..'........
	defb 0c7h,080h,0c5h,000h,0c3h,000h,0c5h,000h,0c6h,000h,0c7h,000h,0c8h,000h,0c9h,000h	; 98fe  ................
	defb 0c5h,000h,0c3h,000h,005h,000h,083h,000h,085h,010h,087h,000h,082h,000h,087h,080h	; 990e  ................
	defb 085h,000h,083h,000h,085h,000h,086h,000h,087h,000h,088h,000h,089h,000h,085h,000h	; 991e  ................
	defb 083h,000h,045h,000h,043h,000h,045h,010h,047h,000h,042h,000h,047h,080h,045h,000h	; 992e  ..E.C.E.G.B.G.E.
	defb 043h,000h,045h,000h,046h,000h,047h,000h,048h,000h,049h,000h,045h,000h,043h,000h	; 993e  C.E.F.G.H.I.E.C.
	defb 045h,000h,0f9h,053h,099h,023h,000h,025h,010h,027h,000h,022h,000h,027h,080h,025h	; 994e  E..S.#.%.'.".'.%
	defb 000h,023h,000h,025h,000h,026h,000h,027h,000h,028h,000h,029h,000h,025h,000h,023h	; 995e  .#.%.&.'.(.).%.#
	defb 000h,005h,000h,003h,000h,005h,010h,007h,000h,002h,000h,007h,080h,005h,000h,003h	; 996e  ................
	defb 000h,005h,000h,006h,000h,007h,000h,008h,000h,009h,000h,005h,000h,003h,000h,0ffh	; 997e  ................

; ----------------------------------------------------------------------
; DATOS partitura_998E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x63 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (32 bytes)
;   0x998e..0x99ae  (32 bytes)
DATA_partitura_998E:
	defb 0feh,002h,0e2h,001h,0e5h,009h,000h,003h,091h,080h,0e8h,021h,000h,021h,010h,021h	; 998e  ...........!.!.!
	defb 020h,011h,030h,011h,040h,001h,000h,001h,010h,001h,020h,001h,030h,001h,040h,0ffh	; 999e   .0.@..... .0.@.

; ----------------------------------------------------------------------
; DATOS partitura_99AE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x63 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (29 bytes)
;   0x99ae..0x99cb  (29 bytes)
DATA_partitura_99AE:
	defb 0feh,002h,0f8h,047h,0e2h,001h,0c1h,000h,041h,010h,031h,020h,021h,030h,011h,040h	; 99ae  ...G....A.1 !0.@
	defb 0f8h,01ah,001h,000h,001h,010h,001h,020h,001h,030h,001h,040h,0ffh	; 99be  ....... .0.@.

; ----------------------------------------------------------------------
; DATOS partitura_99CB: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x64 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (117 bytes)
;   0x99cb..0x9a40  (117 bytes)
DATA_partitura_99CB:
	defb 0feh,002h,0e3h,001h,0e4h,013h,073h,000h,0e4h,014h,082h,000h,0e4h,015h,093h,000h	; 99cb  ......s.........
	defb 0e4h,016h,092h,000h,0e4h,017h,093h,000h,0e4h,018h,083h,000h,0e3h,001h,0e4h,01dh	; 99db  ................
	defb 092h,000h,0e4h,01eh,093h,000h,0e4h,01ch,091h,080h,0e3h,003h,0e4h,01fh,093h,000h	; 99eb  ................
	defb 091h,080h,0a2h,000h,0b2h,080h,081h,080h,072h,000h,0e4h,01fh,071h,0c0h,062h,060h	; 99fb  ........r...q.b`
	defb 053h,000h,0feh,002h,0e3h,003h,0f5h,0e4h,01fh,051h,000h,0e4h,01eh,051h,020h,0e4h	; 9a0b  S........Q...Q .
	defb 01ch,051h,000h,0e4h,01dh,051h,020h,0e4h,01fh,051h,000h,0fbh,010h,0f5h,0e4h,01fh	; 9a1b  .Q...Q ..Q......
	defb 021h,000h,0e4h,01eh,021h,020h,0e4h,01ch,021h,000h,0e4h,01dh,021h,020h,0e4h,01fh	; 9a2b  !...! ..!...! ..
	defb 021h,000h,0fbh,002h,0ffh	; 9a3b

; ----------------------------------------------------------------------
; DATOS partitura_9A40: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x64 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (93 bytes)
;   0x9a40..0x9a9d  (93 bytes)
DATA_partitura_9A40:
	defb 0feh,002h,0f8h,00ch,0e2h,001h,0a3h,000h,0b2h,000h,0a3h,000h,0a2h,000h,0a3h,000h	; 9a40  ................
	defb 0b3h,000h,0c2h,000h,0c3h,000h,0c1h,080h,0c3h,000h,0c1h,080h,0c2h,000h,0c2h,080h	; 9a50  ................
	defb 0b1h,080h,0a2h,000h,0a1h,0c0h,092h,060h,081h,060h,083h,000h,081h,080h,082h,000h	; 9a60  .......`.`......
	defb 082h,080h,071h,070h,062h,000h,061h,0c0h,052h,060h,041h,060h,0feh,002h,0f8h,005h	; 9a70  ..qpb.a.R`A`....
	defb 0e2h,001h,0f5h,053h,080h,054h,020h,053h,080h,054h,020h,053h,080h,0fbh,030h,0f5h	; 9a80  ...S.T S.T S..0.
	defb 023h,080h,024h,020h,023h,080h,024h,020h,023h,080h,0fbh,005h,0ffh	; 9a90  #.$ #.$ #....

; ----------------------------------------------------------------------
; DATOS partitura_9A9D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x65 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (101 bytes)
;   0x9a9d..0x9b02  (101 bytes)
DATA_partitura_9A9D:
	defb 0feh,002h,0f5h,0e3h,001h,0e4h,004h,0a0h,030h,0e1h,001h,0e4h,01fh,008h,0e2h,001h	; 9a9d  ........0.......
	defb 073h,000h,074h,000h,075h,000h,0e3h,001h,0e4h,000h,090h,009h,090h,00dh,0e3h,001h	; 9aad  s.t.u...........
	defb 0e4h,01fh,068h,000h,0e4h,004h,030h,030h,0e1h,001h,0e4h,01fh,003h,0e2h,001h,033h	; 9abd  ..h...00.......3
	defb 000h,034h,000h,035h,000h,0e3h,001h,0e4h,000h,040h,009h,040h,00dh,0e3h,001h,0e4h	; 9acd  .4.5.....@.@....
	defb 01fh,038h,000h,0e4h,004h,010h,030h,0e1h,001h,0e4h,01fh,001h,0e2h,001h,013h,000h	; 9add  .8....0.........
	defb 014h,000h,015h,000h,0e3h,001h,0e4h,000h,010h,009h,010h,00dh,0e3h,001h,0e4h,01fh	; 9aed  ................
	defb 018h,000h,0e0h,004h,0ffh	; 9afd

; ----------------------------------------------------------------------
; DATOS partitura_9B02: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x65 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (87 bytes)
;   0x9b02..0x9b59  (87 bytes)
DATA_partitura_9B02:
	defb 0feh,002h,0f8h,014h,0e2h,001h,0c1h,0a0h,0c2h,000h,0a2h,080h,0a3h,000h,0a9h,000h	; 9b02  ................
	defb 0a5h,000h,0a9h,000h,0a4h,000h,0a5h,000h,0a6h,000h,0a7h,000h,0a8h,000h,0a9h,000h	; 9b12  ................
	defb 0aah,000h,042h,000h,042h,080h,043h,000h,049h,000h,045h,000h,049h,000h,044h,000h	; 9b22  ..B.B.C.I.E.I.D.
	defb 045h,000h,046h,000h,047h,000h,048h,000h,049h,000h,04ah,000h,002h,000h,002h,080h	; 9b32  E.F.G.H.I.J.....
	defb 003h,000h,009h,000h,005h,000h,009h,000h,004h,000h,005h,000h,006h,000h,007h,000h	; 9b42  ................
	defb 008h,000h,009h,000h,00ah,000h,0ffh	; 9b52

; ----------------------------------------------------------------------
; DATOS partitura_9B59: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x66 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (44 bytes)
;   0x9b59..0x9b85  (44 bytes)
DATA_partitura_9B59:
	defb 0feh,002h,0e1h,001h,0e4h,001h,003h,0e4h,00ah,004h,0e1h,003h,0e4h,001h,003h,0e4h	; 9b59  ................
	defb 000h,004h,0e4h,008h,005h,0e4h,010h,006h,0e4h,000h,005h,004h,0e1h,004h,0e4h,001h	; 9b69  ................
	defb 001h,0e4h,003h,001h,0e4h,004h,001h,0e4h,005h,001h,000h,0ffh	; 9b79  ............

; ----------------------------------------------------------------------
; DATOS partitura_9B85: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x66 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (71 bytes)
;   0x9b85..0x9bcc  (71 bytes)
DATA_partitura_9B85:
	defb 0feh,002h,0f8h,005h,0e2h,001h,014h,09ah,024h,030h,033h,070h,043h,020h,052h,0a0h	; 9b85  ........$03pC R.
	defb 062h,050h,072h,010h,081h,0d0h,094h,09ah,0a4h,030h,083h,070h,083h,020h,082h,0a0h	; 9b95  bPr......0.p. ..
	defb 082h,050h,082h,010h,081h,0d0h,043h,070h,003h,070h,003h,020h,002h,0a0h,002h,050h	; 9ba5  .P....Cp.p. ...P
	defb 002h,010h,001h,0d0h,004h,09ah,004h,030h,003h,070h,003h,020h,002h,0a0h,002h,050h	; 9bb5  .......0.p. ...P
	defb 002h,010h,001h,0d0h,003h,070h,0ffh	; 9bc5

; ----------------------------------------------------------------------
; DATOS partitura_9BCC: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x67 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (114 bytes)
;   0x9bcc..0x9c3e  (114 bytes)
DATA_partitura_9BCC:
	defb 0f9h,06eh,074h,0feh,002h,0e2h,001h,0f5h,073h,09ah,073h,030h,072h,070h,072h,020h	; 9bcc  .nt.....s.s0rpr
	defb 072h,000h,071h,0c0h,071h,0a0h,071h,050h,071h,030h,071h,010h,0fbh,002h,0f5h,053h	; 9bdc  r.q.q.qPq0q....S
	defb 09ah,053h,030h,052h,070h,052h,020h,052h,000h,051h,0c0h,051h,0a0h,051h,050h,051h	; 9bec  .S0RpR R.Q.Q.QPQ
	defb 030h,051h,010h,0fbh,002h,033h,09ah,033h,030h,032h,070h,032h,020h,032h,000h,031h	; 9bfc  0Q...3.302p2 2.1
	defb 0c0h,031h,0a0h,031h,050h,031h,030h,031h,010h,023h,09ah,023h,030h,022h,070h,022h	; 9c0c  .1.1P101.#.#0"p"
	defb 020h,022h,000h,021h,0c0h,021h,0a0h,021h,050h,021h,030h,021h,010h,003h,09ah,003h	; 9c1c   ".!.!.!P!0!....
	defb 030h,002h,070h,002h,020h,002h,000h,001h,0c0h,001h,0a0h,001h,050h,001h,030h,001h	; 9c2c  0.p. .......P.0.
	defb 010h,0ffh	; 9c3c

; ----------------------------------------------------------------------
; DATOS partitura_9C3E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x67 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (116 bytes)
;   0x9c3e..0x9cb2  (116 bytes)
DATA_partitura_9C3E:
	defb 0f9h,0e0h,074h,0feh,002h,0f8h,009h,0e2h,001h,0f5h,0c3h,09ah,0c3h,030h,0c2h,070h	; 9c3e  ..t..........0.p
	defb 0c2h,020h,0c2h,000h,0c1h,0c0h,0c1h,0a0h,0c1h,050h,0c1h,030h,0c1h,010h,0fbh,002h	; 9c4e  . .......P.0....
	defb 0f5h,083h,09ah,083h,030h,082h,070h,082h,020h,082h,000h,081h,0c0h,081h,0a0h,081h	; 9c5e  ....0.p. .......
	defb 050h,081h,030h,081h,010h,0fbh,002h,043h,09ah,043h,030h,042h,070h,042h,020h,042h	; 9c6e  P.0....C.C0BpB B
	defb 000h,041h,0c0h,041h,0a0h,041h,050h,041h,030h,041h,010h,023h,09ah,023h,030h,022h	; 9c7e  .A.A.APA0A.#.#0"
	defb 070h,022h,020h,022h,000h,021h,0c0h,021h,0a0h,021h,050h,021h,030h,021h,010h,003h	; 9c8e  p" ".!.!.!P!0!..
	defb 09ah,003h,030h,002h,070h,002h,020h,002h,000h,001h,0c0h,001h,0a0h,001h,050h,001h	; 9c9e  ..0.p. .......P.
	defb 030h,001h,010h,0ffh	; 9cae

; ----------------------------------------------------------------------
; DATOS partitura_9CB2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x68 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (59 bytes)
;   0x9cb2..0x9ced  (59 bytes)
DATA_partitura_9CB2:
	defb 0feh,002h,0e1h,001h,0e4h,00fh,004h,0e4h,000h,005h,0e4h,003h,006h,0e4h,006h,007h	; 9cb2  ................
	defb 0e4h,00fh,008h,0e1h,002h,0e4h,00dh,007h,0e4h,003h,006h,0e4h,006h,005h,0e4h,00ah	; 9cc2  ................
	defb 004h,0e4h,00eh,003h,0e1h,001h,0e4h,00fh,002h,0e4h,000h,002h,0e4h,003h,002h,0e4h	; 9cd2  ................
	defb 006h,002h,0e4h,00fh,002h,0e1h,002h,0e4h,00dh,001h,0ffh	; 9ce2  ...........

; ----------------------------------------------------------------------
; DATOS partitura_9CED: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x68 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (39 bytes)
;   0x9ced..0x9d14  (39 bytes)
DATA_partitura_9CED:
	defb 0feh,002h,0f8h,00ch,0e2h,001h,091h,080h,0a2h,000h,0b2h,080h,0c3h,000h,0c3h,080h	; 9ced  ................
	defb 0c4h,000h,0c5h,000h,0e0h,004h,0e2h,001h,001h,080h,002h,000h,002h,080h,003h,000h	; 9cfd  ................
	defb 003h,080h,004h,000h,005h,000h,0ffh	; 9d0d

; ----------------------------------------------------------------------
; DATOS partitura_9D14: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x69 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (54 bytes)
;   0x9d14..0x9d4a  (54 bytes)
DATA_partitura_9D14:
	defb 0feh,002h,0e0h,004h,0f5h,0e2h,001h,012h,005h,011h,0e5h,021h,0c5h,021h,0a5h,031h	; 9d14  ...........!.!.1
	defb 085h,031h,065h,031h,045h,031h,025h,031h,015h,031h,00dh,031h,009h,031h,005h,0e2h	; 9d24  .1e1E1%1.1.1.1..
	defb 00bh,031h,009h,0fbh,004h,0e2h,001h,001h,025h,001h,015h,001h,00dh,001h,009h,001h	; 9d34  .1......%.......
	defb 005h,0e2h,013h,001h,009h,0ffh	; 9d44

; ----------------------------------------------------------------------
; DATOS partitura_9D4A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x69 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (54 bytes)
;   0x9d4a..0x9d80  (54 bytes)
DATA_partitura_9D4A:
	defb 0feh,002h,0f8h,009h,0f5h,0e2h,001h,062h,005h,071h,0e5h,081h,0c5h,091h,0a5h,0a1h	; 9d4a  .......b.q......
	defb 085h,0b1h,065h,0c1h,045h,0c1h,025h,0c1h,015h,0c1h,00dh,0c1h,009h,0c1h,005h,0e2h	; 9d5a  ..e.E.%.........
	defb 00bh,0c1h,009h,0fbh,004h,0e2h,001h,001h,025h,001h,015h,001h,00dh,001h,009h,001h	; 9d6a  ........%.......
	defb 005h,0e2h,013h,001h,009h,0ffh	; 9d7a

; ----------------------------------------------------------------------
; DATOS partitura_9D80: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x74 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (139 bytes)
;   0x9d80..0x9e0b  (139 bytes)
DATA_partitura_9D80:
	defb 0feh,004h,0d0h,0f5h,0e9h,004h,065h,0e9h,008h,000h,061h,000h,0a0h,000h,060h,0e9h	; 9d80  ......e...a...`.
	defb 004h,000h,000h,0e9h,008h,000h,0b0h,020h,0b0h,000h,0b0h,000h,060h,000h,000h,0a0h	; 9d90  ....... ....`...
	defb 000h,060h,0e9h,004h,000h,000h,0e9h,008h,000h,0b0h,020h,0e9h,001h,072h,071h,072h	; 9da0  .`........ ..rqr
	defb 0e9h,008h,070h,070h,070h,070h,070h,070h,030h,030h,040h,040h,050h,060h,060h,0b0h	; 9db0  ..pppppp00@@P``.
	defb 0a0h,010h,0a0h,060h,000h,000h,0a0h,000h,060h,0e9h,004h,000h,000h,0e9h,008h,000h	; 9dc0  ...`....`.......
	defb 0b0h,020h,0fbh,002h,0f9h,049h,0a1h,000h,000h,060h,0a0h,000h,061h,000h,0b0h,020h	; 9dd0  . ...I...`..a..
	defb 0a0h,070h,070h,070h,070h,070h,070h,070h,070h,000h,030h,040h,060h,060h,0f9h,049h	; 9de0  .pppppppp.0@``.I
	defb 0a1h,060h,000h,000h,0a0h,000h,061h,000h,0b0h,020h,030h,030h,040h,040h,050h,050h	; 9df0  .`....a.. 00@@PP
	defb 060h,060h,0a0h,0a0h,0a0h,0a0h,060h,060h,0fdh,080h,09dh	; 9e00  ``....``...

; ----------------------------------------------------------------------
; DATOS partitura_9E0B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x74 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (137 bytes)
;   0x9e0b..0x9e94  (137 bytes)
DATA_partitura_9E0B:
	defb 0feh,001h,0f5h,0f0h,003h,024h,0e9h,008h,0eah,00ch,0ebh,019h,05dh,002h,0d6h,004h	; 9e0b  .....$......]...
	defb 002h,0d2h,033h,0d8h,0f0h,000h,0ebh,009h,067h,002h,0d5h,090h,070h,040h,0b0h,040h	; 9e1b  ..3.....g...p@.@
	defb 0a0h,040h,090h,070h,040h,0b0h,040h,0a0h,040h,090h,070h,040h,0b0h,040h,0a0h,040h	; 9e2b  .@.p@.@.@.p@.@.@
	defb 090h,070h,040h,0b0h,040h,0a0h,040h,090h,070h,040h,0b0h,040h,0a0h,040h,090h,070h	; 9e3b  .p@.@.@.p@.@.@.p
	defb 040h,0b0h,040h,0a0h,040h,090h,070h,040h,0b0h,040h,0a0h,040h,090h,070h,040h,0fbh	; 9e4b  @.@.@.p@.@.@.p@.
	defb 002h,0f9h,075h,0a1h,0f5h,0d4h,010h,0d5h,060h,0d4h,000h,0d5h,060h,0b0h,090h,060h	; 9e5b  ..u.....`...`..`
	defb 0fbh,003h,0f9h,075h,0a1h,0d4h,010h,0d5h,060h,0d4h,000h,0d5h,060h,0b0h,090h,060h	; 9e6b  ...u....`...`..`
	defb 0d5h,010h,060h,0b0h,0d4h,040h,090h,0d3h,020h,0d4h,090h,070h,0d3h,000h,0d4h,070h	; 9e7b  ..`..@.. ..p...p
	defb 0d5h,070h,0d4h,000h,050h,0a0h,0fdh,00bh,09eh	; 9e8b  .p..P....

; ----------------------------------------------------------------------
; DATOS partitura_9E94: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x74 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (138 bytes)
;   0x9e94..0x9f1e  (138 bytes)
DATA_partitura_9E94:
	defb 0feh,001h,0f0h,003h,022h,0f5h,0f6h,0f8h,002h,0e9h,008h,0eah,00ch,0ebh,019h,05dh	; 9e94  ...."..........]
	defb 001h,0d6h,004h,002h,0d1h,013h,0d8h,0cfh,0c7h,0f1h,005h,009h,001h,010h,0eah,00ch	; 9ea4  ................
	defb 0edh,012h,0ebh,081h,014h,051h,0d3h,0a0h,0b0h,0d2h,040h,0e9h,010h,0abh,0e9h,008h	; 9eb4  .....Q....@.....
	defb 0c0h,0fbh,002h,0f5h,0feh,001h,0f0h,003h,022h,0f6h,0f8h,002h,0e9h,008h,0eah,00ch	; 9ec4  ........".......
	defb 0ebh,019h,05dh,001h,0d6h,003h,002h,0d1h,033h,0d8h,0e9h,010h,0f1h,005h,002h,001h	; 9ed4  ..].....3.......
	defb 008h,0eah,009h,0edh,012h,0ebh,081h,014h,071h,0d1h,00bh,0f6h,0f8h,002h,0e9h,008h	; 9ee4  ........q.......
	defb 0eah,00ch,0ebh,019h,05dh,001h,0d6h,003h,002h,0d1h,043h,0d8h,0f1h,005h,002h,001h	; 9ef4  ....].....C.....
	defb 008h,0eah,00dh,0edh,082h,0ebh,081h,014h,051h,0d3h,000h,010h,060h,0d2h,000h,0dbh	; 9f04  ........Q...`...
	defb 004h,0e9h,010h,0d2h,019h,0fbh,002h,0fdh,094h,09eh	; 9f14  ..........

; ----------------------------------------------------------------------
; DATOS partitura_9F1E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x74 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (130 bytes)
;   0x9f1e..0x9fa0  (130 bytes)
DATA_partitura_9F1E:
	defb 0feh,001h,0f0h,003h,022h,0f5h,0f6h,0f8h,002h,0e9h,008h,0eah,00ch,0ebh,019h,05dh	; 9f1e  ...."..........]
	defb 001h,0d6h,004h,002h,0d1h,063h,0d8h,0cfh,0c7h,0eeh,002h,0f2h,001h,0eah,009h,0edh	; 9f2e  .....c..........
	defb 012h,0ebh,081h,014h,051h,0c2h,0d3h,0a0h,0b0h,0d2h,040h,0e9h,010h,0aah,0efh,0fbh	; 9f3e  ....Q.....@.....
	defb 002h,0f5h,0f6h,0f8h,002h,0e9h,008h,0eah,00ch,0ebh,019h,05dh,001h,0d6h,003h,002h	; 9f4e  ...........]....
	defb 0d1h,083h,0d8h,0e9h,010h,0f2h,001h,0eah,009h,0edh,012h,0ebh,081h,014h,071h,0d2h	; 9f5e  ..............q.
	defb 06bh,0f6h,0f8h,002h,0e9h,008h,0eah,00ch,0ebh,019h,05dh,001h,0d6h,003h,002h,0d1h	; 9f6e  k.........].....
	defb 093h,0c0h,0d8h,0f2h,001h,0eah,007h,0edh,012h,0ebh,081h,014h,051h,0eeh,084h,0d3h	; 9f7e  ............Q...
	defb 000h,010h,060h,0d2h,010h,0e9h,010h,0d2h,018h,0e9h,008h,0c0h,0efh,0fbh,002h,0fdh	; 9f8e  ..`.............
	defb 01eh,09fh	; 9f9e

; ----------------------------------------------------------------------
; DATOS partitura_9FA0: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x74 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (96 bytes)
;   0x9fa0..0xa000  (96 bytes)
DATA_partitura_9FA0:
	defb 0feh,001h,0e9h,008h,0eah,00eh,0ebh,009h,065h,004h,0f4h,023h,00ah,01ah,052h,0d4h	; 9fa0  ........e..#..R.
	defb 0f5h,0b0h,040h,0a0h,040h,090h,070h,040h,0b0h,040h,0a0h,040h,090h,070h,040h,0fbh	; 9fb0  ..@.@.p@.@.@.p@.
	defb 008h,0eah,00eh,0ebh,009h,065h,004h,0f5h,0d3h,010h,0d4h,060h,0d3h,000h,0d4h,060h	; 9fc0  .....e.....`...`
	defb 0b0h,090h,060h,0d3h,010h,0d4h,060h,0d3h,000h,0d4h,060h,0b0h,090h,060h,0d3h,010h	; 9fd0  ..`...`...`..`..
	defb 0d4h,060h,0d3h,000h,0d4h,060h,0b0h,090h,060h,0d3h,010h,0d4h,060h,0d3h,000h,0d4h	; 9fe0  .`...`..`...`...
	defb 060h,0b0h,090h,060h,0fbh,002h,0eah,00eh,0ebh,009h,065h,004h,0f5h,0d3h,010h,0d4h	; 9ff0  `..`......e.....
