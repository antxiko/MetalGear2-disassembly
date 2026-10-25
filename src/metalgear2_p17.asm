; ==========================================================================
; METAL GEAR 2 SOLID SNAKE - Konami (1990) - MSX2 - MegaROM RC-767 de 512 KB (Konami SCC) - banco 17 (se ejecuta en 0x6000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x06000


; ----------------------------------------------------------------------
; DATOS sonido_6000: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x48, 0xAA (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (50 bytes)
;   0x6000..0x6032  (50 bytes)
DATA_sonido_6000:
	defb 080h,07fh,090h,060h,090h,040h,080h,020h,080h,0f0h,080h,0d0h,080h,0b0h,080h,090h	; 6000  ...`.@. ........
	defb 080h,080h,000h,07fh,000h,080h,020h,0d0h,080h,0b0h,080h,088h,0a0h,0e0h,020h,048h	; 6010  ...... ....... H
	defb 060h,070h,07fh,070h,060h,048h,020h,0e0h,0a0h,088h,080h,0b0h,080h,0d0h,020h,080h	; 6020  `p.p`H ....... .
	defb 000h,07fh	; 6030

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6032..0x60b2  (128 bytes)
DATA_6032:
	defb 000h,07fh,07ah,072h,06ah,060h,052h,042h,030h,010h,0f0h,0c0h,0a8h,098h,08ah,084h	; 6032  ..zrj`RB0.......
	defb 080h,07fh,000h,080h,060h,000h,080h,030h,0e0h,080h,000h,0c0h,080h,0d0h,0b0h,080h	; 6042  ....`..0........
	defb 080h,000h,07fh,07dh,07ah,077h,075h,072h,070h,000h,080h,082h,085h,087h,08ah,08ch	; 6052  ...}zwurp.......
	defb 090h,050h,090h,0a0h,090h,0c0h,000h,030h,060h,070h,07fh,050h,020h,0f0h,0c0h,090h	; 6062  .P.....0`p.P ...
	defb 080h,080h,080h,080h,080h,080h,080h,010h,080h,080h,080h,080h,080h,080h,080h,080h	; 6072  ................
	defb 070h,080h,050h,080h,028h,080h,008h,080h,0e8h,080h,0c8h,080h,0a8h,080h,088h,080h	; 6082  p.P.(...........
	defb 080h,080h,080h,080h,080h,080h,080h,080h,07fh,080h,080h,080h,080h,080h,080h,080h	; 6092  ................
	defb 080h,090h,080h,0b8h,080h,0e0h,080h,008h,080h,008h,080h,0e0h,080h,0b8h,080h,090h	; 60a2  ................

; ----------------------------------------------------------------------
; DATOS sonido_60B2: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x40, 0x4E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (64 bytes)
;   0x60b2..0x60f2  (64 bytes)
DATA_sonido_60B2:
	defb 080h,098h,0b8h,0e0h,020h,050h,068h,07fh,068h,050h,020h,0f0h,0d0h,0b8h,0a8h,090h	; 60b2  .... Ph.hP .....
	defb 090h,0b8h,080h,000h,080h,040h,080h,07fh,080h,040h,080h,000h,080h,0c0h,090h,090h	; 60c2  .....@...@......
	defb 080h,000h,07fh,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,088h	; 60d2  ................
	defb 0a0h,0b8h,0e0h,010h,030h,044h,05ah,06ah,078h,07fh,080h,080h,080h,080h,080h,080h	; 60e2  ....0DZjx.......

; ----------------------------------------------------------------------
; DATOS sin identificar  0x60f2..0x6112  (32 bytes)
DATA_60F2:
	defb 080h,080h,080h,080h,07fh,080h,090h,0c0h,0e8h,010h,030h,010h,0e8h,0c0h,090h,080h	; 60f2  ..........0.....
	defb 07fh,080h,07fh,080h,07fh,080h,040h,080h,010h,080h,0d0h,080h,0a0h,080h,080h,080h	; 6102  ......@.........

; ----------------------------------------------------------------------
; DATOS sonido_6112: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x25, 0x2E, 0x42, 0x44, 0x45, 0x46, 0x4C, 0x60, 0x76, 0x77 y 6 mas
;   (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392 (96 bytes)
;   0x6112..0x6172  (96 bytes)
DATA_sonido_6112:
	defb 080h,07fh,080h,060h,080h,038h,080h,018h,080h,0f8h,080h,0d0h,080h,0b0h,080h,090h	; 6112  ...`.8..........
	defb 080h,084h,08ah,09ah,0b2h,0e0h,000h,018h,020h,018h,080h,080h,080h,080h,080h,080h	; 6122  ........ .......
	defb 080h,0f0h,070h,000h,080h,0d0h,028h,0d0h,080h,0b0h,0e0h,0b0h,080h,090h,0a0h,090h	; 6132  ..p...(.........
	defb 080h,086h,090h,0a0h,0c0h,0e8h,008h,01ah,020h,01ah,008h,0e8h,0c0h,0a0h,090h,086h	; 6142  ........ .......
	defb 000h,010h,020h,02ch,038h,044h,050h,058h,060h,050h,040h,034h,028h,01ch,010h,008h	; 6152  .. ,8DPX`P@4(...
	defb 000h,0f0h,0e0h,0d4h,0c8h,0bch,0b0h,0a8h,0a0h,0b0h,0c0h,0cch,0d8h,0e4h,0f0h,0f8h	; 6162  ................

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6172..0x61b2  (64 bytes)
DATA_6172:
	defb 080h,060h,050h,024h,00ch,018h,000h,0d0h,0dah,0e0h,0c4h,0c0h,0c0h,0bah,0e6h,0f0h	; 6172  .`P$............
	defb 0e6h,0c4h,0b0h,0bah,0dah,0e0h,0d0h,0dah,0c4h,0bah,0c4h,0bah,092h,090h,0a0h,090h	; 6182  ................
	defb 080h,0b0h,0f0h,005h,0bah,0c0h,030h,013h,0d0h,0b0h,050h,0f4h,010h,040h,05ch,060h	; 6192  ......0...P..@\`
	defb 090h,0b0h,0f8h,008h,0e4h,0b2h,036h,01ah,0b2h,020h,05ah,0f8h,020h,0f8h,040h,060h	; 61a2  ......6.. Z. .@`

; ----------------------------------------------------------------------
; DATOS sonido_61B2: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x2A, 0x2F, 0x36, 0x37, 0x3E, 0x40, 0x4A, 0x4B, 0x63, 0x6F y 25
;   mas (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392 (224
;   bytes)
;   0x61b2..0x6292  (224 bytes)
DATA_sonido_61B2:
	defb 080h,0d0h,020h,07fh,040h,000h,0c0h,080h,0d0h,020h,07fh,030h,0d0h,080h,0d0h,030h	; 61b2  .. .@.... .0...0
	defb 07fh,030h,0d0h,080h,0b0h,0e0h,018h,0e0h,0b0h,080h,090h,0a0h,0b0h,0a0h,090h,080h	; 61c2  .0..............
	defb 0a0h,090h,0a0h,0ach,0f0h,00ah,016h,000h,090h,000h,020h,040h,060h,050h,038h,01ch	; 61d2  .......... @`P8.
	defb 0f2h,0e2h,0d6h,0d0h,0d0h,0dah,0dch,0e0h,0e2h,0e2h,0e2h,0e0h,0dch,0d8h,0d0h,0b0h	; 61e2  ................
	defb 080h,0aah,0c8h,000h,024h,040h,05ch,070h,07fh,06ah,04ah,026h,000h,0d0h,0a8h,08ch	; 61f2  ....$@\p.jJ&....
	defb 080h,0aah,0c8h,000h,024h,040h,05ch,070h,07fh,06ah,04ah,026h,000h,0d0h,0a8h,08ch	; 6202  ....$@\p.jJ&....
	defb 080h,07fh,080h,07fh,080h,07fh,080h,07fh,080h,07fh,080h,07fh,080h,07fh,080h,07fh	; 6212  ................
	defb 080h,070h,080h,050h,080h,030h,080h,010h,080h,0f0h,080h,0d0h,080h,0b0h,080h,090h	; 6222  .p.P.0..........
	defb 080h,07fh,080h,090h,0a6h,0c8h,0e2h,000h,01ah,030h,042h,054h,062h,06ch,076h,07ch	; 6232  .........0BTblv|
	defb 07fh,07ch,076h,06ch,062h,054h,042h,030h,01ah,000h,0e2h,0c8h,0a6h,090h,08ch,084h	; 6242  .|vlbTB0........
	defb 080h,0c8h,020h,07fh,030h,0c8h,080h,090h,0a8h,0c0h,0e0h,000h,020h,038h,050h,060h	; 6252  .. .0....... 8P`
	defb 070h,078h,07ch,07fh,07ch,078h,070h,060h,050h,038h,020h,000h,0e0h,0c0h,0a8h,090h	; 6262  px|.|xp`P8 .....
	defb 080h,0c8h,010h,000h,0fah,0fch,0f0h,000h,0e0h,0a0h,0f0h,002h,012h,026h,020h,012h	; 6272  .............& .
	defb 010h,008h,006h,000h,0fah,0f5h,0f2h,0f5h,00ch,002h,0fch,0f5h,0e5h,0dah,0d0h,09ah	; 6282  ................

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6292..0x62b2  (32 bytes)
DATA_6292:
	defb 000h,068h,040h,004h,000h,026h,040h,0f5h,010h,040h,020h,0d0h,0f0h,000h,0c0h,080h	; 6292  .h@..&@..@ .....
	defb 0d0h,030h,0c0h,0a0h,0b0h,0c0h,080h,0d0h,0f0h,040h,010h,0c0h,0d4h,000h,0c0h,0e0h	; 62a2  .0.......@......

; ----------------------------------------------------------------------
; DATOS sonido_62B2: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x44, 0x9E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (32 bytes)
;   0x62b2..0x62d2  (32 bytes)
DATA_sonido_62B2:
	defb 080h,000h,000h,000h,070h,070h,000h,000h,080h,080h,080h,000h,000h,000h,000h,070h	; 62b2  ....pp.........p
	defb 070h,070h,080h,07fh,080h,080h,0c0h,000h,020h,034h,040h,034h,020h,000h,0c0h,080h	; 62c2  pp...... 4@4 ...

; ----------------------------------------------------------------------
; DATOS sin identificar  0x62d2..0x62f2  (32 bytes)
DATA_62D2:
	defb 040h,070h,040h,018h,048h,050h,0e8h,0c8h,0e8h,000h,000h,0c8h,0d8h,0e0h,0c0h,096h	; 62d2  @p@.HP..........
	defb 0c0h,018h,0c0h,0b0h,0b4h,0b0h,098h,088h,060h,07fh,060h,018h,030h,050h,030h,038h	; 62e2  ........`.`.0P08

; ----------------------------------------------------------------------
; DATOS sonido_62F2: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x6A, 0x6B, 0x70, 0x71, 0x72, 0x74, 0x77, 0x78, 0x79, 0x7A y 13
;   mas (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392 (160
;   bytes)
;   0x62f2..0x6392  (160 bytes)
DATA_sonido_62F2:
	defb 090h,088h,090h,09ch,0b0h,0c0h,0e0h,026h,070h,07ch,070h,056h,040h,020h,010h,0fch	; 62f2  .......&p|pV@ ..
	defb 0e0h,0fch,010h,024h,040h,054h,072h,07fh,070h,026h,0e0h,0c0h,0b0h,09ch,090h,088h	; 6302  ...$@Tr.p&......
	defb 090h,0d0h,020h,00ch,0bch,0aah,0e6h,0dch,0bch,0e3h,040h,030h,0e0h,0d0h,010h,006h	; 6312  .. .......@0....
	defb 0e4h,00ch,070h,050h,0e0h,0d0h,010h,000h,0d0h,0f0h,040h,020h,0c4h,0c0h,0f0h,090h	; 6322  ..pP......@ ....
	defb 080h,000h,060h,070h,05ch,050h,040h,042h,032h,012h,0f6h,010h,000h,0c0h,0b4h,0ach	; 6332  ..`p\P@B2.......
	defb 0bch,0d3h,0f0h,002h,000h,0f0h,0c3h,09ch,0bch,0bch,09ch,098h,0a0h,0ach,0b4h,094h	; 6342  ................
	defb 080h,000h,070h,023h,0f2h,0e0h,0dch,0cch,0c4h,0c4h,0d0h,0d4h,0e0h,0f0h,0f4h,0feh	; 6352  ..p#............
	defb 010h,01ah,026h,034h,030h,034h,034h,02ch,03ch,022h,014h,0fch,0ech,0cch,0b0h,090h	; 6362  ..&4044,<"......
	defb 080h,0c4h,0c0h,0c0h,006h,0e4h,030h,01ah,070h,03ah,040h,040h,0fch,016h,0c0h,090h	; 6372  ......0.p:@@....
	defb 0c4h,0c0h,0c0h,004h,0e8h,030h,018h,070h,03ch,040h,040h,0feh,013h,0e0h,0a0h,090h	; 6382  .....0.p<@@.....

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6392..0x63f2  (96 bytes)
DATA_6392:
	defb 080h,0a0h,0c0h,0cch,0c0h,0bch,0c0h,0c4h,0e0h,024h,0f0h,058h,04ch,04ah,03ch,050h	; 6392  .........$.XLJ<P
	defb 07fh,060h,040h,030h,040h,046h,040h,046h,03ch,020h,0c6h,0f2h,0a4h,0b4h,0b6h,0a0h	; 63a2  .`@0@F@F< ......
	defb 000h,000h,000h,000h,000h,000h,000h,000h,040h,07fh,07fh,07fh,040h,000h,000h,000h	; 63b2  ........@...@...
	defb 0c0h,080h,080h,080h,080h,080h,0c0h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 63c2  ................
	defb 000h,07fh,07ah,078h,06ch,05ch,03ch,024h,000h,0e0h,0c6h,0a8h,092h,08ah,084h,080h	; 63d2  ..zxl\<$........
	defb 000h,07fh,07fh,07fh,07fh,07fh,07fh,07fh,000h,080h,080h,080h,080h,080h,080h,080h	; 63e2  ................

; ----------------------------------------------------------------------
; DATOS sonido_63F2: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x1C (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392
;   (32 bytes)
;   0x63f2..0x6412  (32 bytes)
DATA_sonido_63F2:
	defb 080h,080h,0e8h,018h,038h,066h,078h,07fh,080h,080h,080h,080h,080h,080h,080h,09ch	; 63f2  ....8fx.........
	defb 080h,0dch,080h,020h,0d0h,080h,07fh,080h,0d0h,020h,080h,0dch,080h,09ch,080h,088h	; 6402  ... ..... ......

; ----------------------------------------------------------------------
; DATOS resto_6412: lo apuntan con el banco puesto p16:4968 (0x6430); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p16:4968 (32 bytes)
;   0x6412..0x6432  (32 bytes)
DATA_resto_6412:
	defb 080h,07fh,050h,0f0h,0a2h,0a0h,0a6h,0d0h,0f4h,022h,020h,044h,044h,010h,024h,022h	; 6412  ..P......" DD.$"
	defb 0e0h,0e2h,0fch,0dch,0e0h,00ch,014h,03ch,05ch,070h,060h,030h,0f0h,090h,0f0h,0a0h	; 6422  .......<\p`0....

; ----------------------------------------------------------------------
; DATOS sonido_6432: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x7C (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392
;   (2 bytes)
;   0x6432..0x6434  (2 bytes)
DATA_sonido_6432:
	defb 03ah,064h	; 6432

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6434..0x643a  (6 bytes)
DATA_6434:
	defb 076h,064h,076h,064h,076h,064h	; 6434

; ----------------------------------------------------------------------
; DATOS sonido_643A: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x7C (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392
;   (25 bytes)
;   0x643a..0x6453  (25 bytes)
DATA_sonido_643A:
	defb 01fh,01eh,01dh,02ch,02bh,02ah,02bh,02ch,01bh,02ah,039h,02ah,02bh,01ah,029h,038h	; 643a  ...,+*+,.*9*+.)8
	defb 029h,02ah,029h,028h,027h,028h,039h,028h,027h	; 644a  )*)('(9('

; ----------------------------------------------------------------------
; DATOS resto_6453: lo apuntan con el banco puesto p16:47A0 (0x6475); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p16:47A0 (36 bytes)
;   0x6453..0x6477  (36 bytes)
DATA_resto_6453:
	defb 026h,027h,028h,027h,026h,025h,026h,027h,026h,025h,024h,025h,026h,025h,024h,023h	; 6453  &'('&%&'&%$%&%$#
	defb 024h,025h,024h,023h,022h,023h,024h,023h,022h,021h,022h,033h,022h,021h,022h,041h	; 6463  $%$#"#$#"!"3"!"A
	defb 022h,021h,0ffh,0ffh	; 6473

; ----------------------------------------------------------------------
; DATOS sonido_6477: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x6A, 0x6B, 0x6C, 0x6D, 0x6E, 0x6F, 0x70, 0x71, 0x72, 0x73 y 26
;   mas (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392 (18
;   bytes)
;   0x6477..0x6489  (18 bytes)
DATA_sonido_6477:
	defb 09fh,064h,0abh,064h,0b7h,064h,0bfh,064h,0c7h,064h,0d3h,064h,0dfh,064h,0ebh,064h	; 6477  .d.d.d.d.d.d.d.d
	defb 0f6h,064h	; 6487

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6489..0x648b  (2 bytes)
DATA_6489:
	defb 001h,065h	; 6489

; ----------------------------------------------------------------------
; DATOS sonido_648B: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x9F, 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (2 bytes)
;   0x648b..0x648d  (2 bytes)
DATA_sonido_648B:
	defb 00dh,065h	; 648b

; ----------------------------------------------------------------------
; DATOS sin identificar  0x648d..0x648f  (2 bytes)
DATA_648D:
	defb 019h,065h	; 648d

; ----------------------------------------------------------------------
; DATOS sonido_648F: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x76, 0x77, 0x7A, 0x84, 0x89, 0x8D, 0x9C, 0xA0, 0xA1, 0xA2 y 4 mas
;   (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392 (6 bytes)
;   0x648f..0x6495  (6 bytes)
DATA_sonido_648F:
	defb 025h,065h,039h,065h,051h,065h	; 648f

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6495..0x6499  (4 bytes)
DATA_6495:
	defb 05fh,065h,06bh,065h	; 6495

; ----------------------------------------------------------------------
; DATOS sonido_6499: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x70, 0x71, 0x78, 0x88, 0x99, 0xA3 (lo mide tools/partituras.py
;   ejecutandolo); lo leen p16:4392 (17 bytes)
;   0x6499..0x64aa  (17 bytes)
DATA_sonido_6499:
	defb 087h,065h,093h,065h,09fh,065h,0f5h,011h,022h,011h,020h,01fh,02eh,01fh,020h,0fbh	; 6499  .e.e.e..". ... .
	defb 0e0h	; 64a9

; ----------------------------------------------------------------------
; DATOS sin identificar  0x64aa..0x64ab  (1 bytes)
DATA_64AA:
	defb 0ffh	; 64aa

; ----------------------------------------------------------------------
; DATOS sonido_64AB: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x79, 0x83, 0x90, 0x99, 0x9A, 0xA2, 0xA3, 0xA4, 0xA8 (lo mide
;   tools/partituras.py ejecutandolo); lo leen p16:4392 (11 bytes)
;   0x64ab..0x64b6  (11 bytes)
DATA_sonido_64AB:
	defb 0f5h,010h,011h,012h,011h,010h,01fh,01eh,01fh,0fbh,0e0h	; 64ab  ...........

; ----------------------------------------------------------------------
; DATOS sin identificar  0x64b6..0x64b7  (1 bytes)
DATA_64B6:
	defb 0ffh	; 64b6

; ----------------------------------------------------------------------
; DATOS sonido_64B7: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x6A, 0x6B, 0x6D, 0x6E, 0x74, 0x8C, 0xA6 (lo mide
;   tools/partituras.py ejecutandolo); lo leen p16:4392 (7 bytes)
;   0x64b7..0x64be  (7 bytes)
DATA_sonido_64B7:
	defb 0f5h,041h,04eh,042h,04dh,0fbh,0e0h	; 64b7

; ----------------------------------------------------------------------
; DATOS sin identificar  0x64be..0x64bf  (1 bytes)
DATA_64BE:
	defb 0ffh	; 64be

; ----------------------------------------------------------------------
; DATOS sonido_64BF: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x6A, 0x6B, 0x7C (lo mide tools/partituras.py ejecutandolo); lo
;   leen p16:4392 (7 bytes)
;   0x64bf..0x64c6  (7 bytes)
DATA_sonido_64BF:
	defb 0f5h,051h,05eh,052h,05dh,0fbh,0e0h	; 64bf

; ----------------------------------------------------------------------
; DATOS sin identificar  0x64c6..0x64c7  (1 bytes)
DATA_64C6:
	defb 0ffh	; 64c6

; ----------------------------------------------------------------------
; DATOS sonido_64C7: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x70, 0x72, 0x7B, 0x7D, 0x9E, 0xA7 (lo mide tools/partituras.py
;   ejecutandolo); lo leen p16:4392 (11 bytes)
;   0x64c7..0x64d2  (11 bytes)
DATA_sonido_64C7:
	defb 0f5h,04fh,040h,04eh,041h,04dh,042h,04eh,041h,0fbh,0e0h	; 64c7  .O@NAMBNA..

; ----------------------------------------------------------------------
; DATOS sin identificar  0x64d2..0x64d3  (1 bytes)
DATA_64D2:
	defb 0ffh	; 64d2

; ----------------------------------------------------------------------
; DATOS sonido_64D3: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0xA7 (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392
;   (11 bytes)
;   0x64d3..0x64de  (11 bytes)
DATA_sonido_64D3:
	defb 0f5h,05fh,050h,05eh,051h,05dh,052h,05eh,051h,0fbh,0e0h	; 64d3  ._P^Q]R^Q..

; ----------------------------------------------------------------------
; DATOS sin identificar  0x64de..0x64df  (1 bytes)
DATA_64DE:
	defb 0ffh	; 64de

; ----------------------------------------------------------------------
; DATOS sonido_64DF: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x6C, 0x6F, 0x71, 0x72, 0x73, 0x7B, 0x7E, 0x7F, 0x80, 0x82 y 3 mas
;   (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392 (11 bytes)
;   0x64df..0x64ea  (11 bytes)
DATA_sonido_64DF:
	defb 0f5h,011h,022h,011h,020h,01fh,02eh,01fh,020h,0fbh,0e0h	; 64df  ..". ... ..

; ----------------------------------------------------------------------
; DATOS sin identificar  0x64ea..0x64eb  (1 bytes)
DATA_64EA:
	defb 0ffh	; 64ea

; ----------------------------------------------------------------------
; DATOS sonido_64EB: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x6C, 0x6F, 0x81, 0x9C (lo mide tools/partituras.py ejecutandolo);
;   lo leen p16:4392 (10 bytes)
;   0x64eb..0x64f5  (10 bytes)
DATA_sonido_64EB:
	defb 0f5h,011h,012h,011h,010h,01fh,01fh,010h,0fbh,0a0h	; 64eb  ..........

; ----------------------------------------------------------------------
; DATOS sin identificar  0x64f5..0x64f6  (1 bytes)
DATA_64F5:
	defb 0ffh	; 64f5

; ----------------------------------------------------------------------
; DATOS sonido_64F6: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x73, 0x9D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (10 bytes)
;   0x64f6..0x6500  (10 bytes)
DATA_sonido_64F6:
	defb 0f5h,02fh,02eh,02fh,020h,021h,022h,021h,0fbh,0e0h	; 64f6  ././ !"!..

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6500..0x650d  (13 bytes)
DATA_6500:
	defb 0ffh,0f5h,012h,024h,012h,020h,01eh,02ch,01eh,020h,0fbh,0e0h,0ffh	; 6500  ...$. .,. ...

; ----------------------------------------------------------------------
; DATOS sonido_650D: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x9F, 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (11 bytes)
;   0x650d..0x6518  (11 bytes)
DATA_sonido_650D:
	defb 0f5h,020h,02fh,02eh,02fh,020h,021h,022h,021h,0fbh,0e0h	; 650d  . /./ !"!..

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6518..0x6525  (13 bytes)
DATA_6518:
	defb 0ffh,0f5h,030h,03fh,03eh,03fh,030h,031h,032h,031h,0fbh,0e0h,0ffh	; 6518  ..0?>?0121...

; ----------------------------------------------------------------------
; DATOS sonido_6525: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x9C (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392
;   (19 bytes)
;   0x6525..0x6538  (19 bytes)
DATA_sonido_6525:
	defb 0f5h,020h,02fh,02eh,02dh,02ch,02dh,02eh,02fh,020h,021h,022h,023h,024h,023h,022h	; 6525  . /.-,-./ !"#$#"
	defb 021h,0fbh,0e0h	; 6535

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6538..0x6539  (1 bytes)
DATA_6538:
	defb 0ffh	; 6538

; ----------------------------------------------------------------------
; DATOS sonido_6539: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0xA2, 0xA3 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (23 bytes)
;   0x6539..0x6550  (23 bytes)
DATA_sonido_6539:
	defb 020h,02fh,02eh,02dh,02eh,02fh,020h,021h,022h,021h,0f5h,010h,01fh,01eh,01dh,01eh	; 6539   /.-./ !"!......
	defb 01fh,010h,011h,012h,011h,0fbh,0e0h	; 6549

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6550..0x6551  (1 bytes)
DATA_6550:
	defb 0ffh	; 6550

; ----------------------------------------------------------------------
; DATOS sonido_6551: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x76, 0x77, 0x7A, 0x84, 0x89, 0x8D, 0xA0, 0xA1, 0xA3, 0xA5 y 2 mas
;   (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392 (13 bytes)
;   0x6551..0x655e  (13 bytes)
DATA_sonido_6551:
	defb 0f5h,010h,01fh,01eh,01dh,01eh,01fh,010h,011h,012h,011h,0fbh,0e0h	; 6551  .............

; ----------------------------------------------------------------------
; DATOS sin identificar  0x655e..0x6587  (41 bytes)
DATA_655E:
	defb 0ffh,0f5h,040h,04fh,04eh,04fh,040h,041h,042h,041h,0fbh,0e0h,0ffh,030h,03fh,03eh	; 655e  ..@ONO@ABA...0?>
	defb 03fh,030h,031h,032h,031h,030h,02fh,02eh,02fh,020h,021h,022h,021h,0f5h,010h,01fh	; 656e  ?01210/./ !"!...
	defb 01eh,01fh,010h,011h,012h,011h,0fbh,0e0h,0ffh	; 657e  .........

; ----------------------------------------------------------------------
; DATOS sonido_6587: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x78 (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392
;   (11 bytes)
;   0x6587..0x6592  (11 bytes)
DATA_sonido_6587:
	defb 0f5h,020h,02eh,02dh,02eh,020h,022h,024h,022h,0fbh,0e0h	; 6587  . .-. "$"..

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6592..0x6593  (1 bytes)
DATA_6592:
	defb 0ffh	; 6592

; ----------------------------------------------------------------------
; DATOS sonido_6593: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x78 (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392
;   (11 bytes)
;   0x6593..0x659e  (11 bytes)
DATA_sonido_6593:
	defb 0f5h,010h,01eh,01dh,01eh,010h,012h,014h,012h,0fbh,0e0h	; 6593  ...........

; ----------------------------------------------------------------------
; DATOS sin identificar  0x659e..0x659f  (1 bytes)
DATA_659E:
	defb 0ffh	; 659e

; ----------------------------------------------------------------------
; DATOS sonido_659F: datos de sonido que lee el motor de p16 al tocar los
;   sonidos 0x78 (lo mide tools/partituras.py ejecutandolo); lo leen p16:4392
;   (10 bytes)
;   0x659f..0x65a9  (10 bytes)
DATA_sonido_659F:
	defb 0f5h,010h,01dh,01bh,01dh,010h,013h,016h,013h,0fbh	; 659f  ..........

; ----------------------------------------------------------------------
; DATOS sonidos: 171 palabras: la del sonido 0 (0xFFE0, no se pide) y un
;   puntero por sonido del 1 al 0xAA a su cabecera (p16:4063: 0x65A9 + 2 x
;   numero); 0x6A-0xAA son las musicas, con su banco en p16:4CF9; lo leen
;   p16:406F (342 bytes)
;   0x65a9..0x66ff  (342 bytes)
DATA_sonidos:
	defw 0ffe0h,066ffh,06711h,06723h,06731h,06737h,0673dh,06741h	; 65a9
	defw 06747h,0674dh,06753h,06759h,0675fh,06765h,0676bh,06771h	; 65b9
	defw 06777h,0677dh,06783h,06789h,0678fh,06795h,0679bh,067a1h	; 65c9
	defw 067a7h,067adh,067b3h,067b9h,067bfh,067c5h,067cbh,067d1h	; 65d9
	defw 067d7h,067ddh,067e3h,067e9h,067efh,067f5h,067fbh,06801h	; 65e9
	defw 06807h,0680dh,06813h,06819h,0681fh,06825h,0682bh,06831h	; 65f9
	defw 06837h,0683dh,06843h,06849h,0684fh,06855h,0685bh,06861h	; 6609
	defw 06867h,0686dh,06873h,06879h,0687fh,06885h,0688bh,06891h	; 6619
	defw 06897h,0689dh,068a3h,068a9h,068afh,068b5h,068bbh,068c1h	; 6629
	defw 068c7h,068cdh,068d3h,068d9h,068dfh,068e5h,068ebh,068f1h	; 6639
	defw 068f7h,068fdh,06903h,06909h,0690fh,06915h,0691bh,06921h	; 6649
	defw 06927h,0692dh,06933h,06939h,0693fh,06945h,0694bh,06951h	; 6659
	defw 06957h,0695dh,06963h,06969h,0696fh,06975h,0697bh,06981h	; 6669
	defw 06987h,0698dh,06993h,069a1h,069afh,069bdh,069cbh,069d9h	; 6679
	defw 069e7h,069f5h,06a03h,06a11h,06a1fh,06a2dh,06a3bh,06a49h	; 6689
	defw 06a57h,06a65h,06a73h,06a81h,06a8fh,06a9dh,06aabh,06ab9h	; 6699
	defw 06ac7h,06ad5h,06ae3h,06af1h,06affh,06b0dh,06b1bh,06b29h	; 66a9
	defw 06b37h,06b45h,06b53h,06b61h,06b6fh,06b81h,06b93h,06ba5h	; 66b9
	defw 06bb7h,06bc9h,06bdbh,06bedh,06bffh,06c11h,06c23h,06c35h	; 66c9
	defw 06c47h,06c59h,06c6bh,06c7dh,06c8fh,06ca1h,06cb3h,06cc5h	; 66d9
	defw 06cd7h,06ce9h,06cfbh,06d0dh,06d1fh,06d31h,06d43h,06d55h	; 66e9
	defw 06d67h,06d79h,06d8bh	; 66f9  -> DATA_cabecera_6D67 DATA_cabecera_6D79 DATA_cabecera_6D8B

; ----------------------------------------------------------------------
; DATOS cabecera_66FF: cabecera del sonido 0x01 (p16:4074): [canales
;   FF][prioridad FF] y 8 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (18 bytes)
;   0x66ff..0x6711  (18 bytes)
DATA_cabecera_66FF:
	defb 0ffh,0ffh	; 66ff
	defb 09dh,06dh	; 6701
	defb 09dh,06dh	; 6703
	defb 09dh,06dh	; 6705
	defb 09dh,06dh	; 6707
	defb 09dh,06dh	; 6709
	defb 09dh,06dh	; 670b
	defb 09dh,06dh	; 670d
	defb 09dh,06dh	; 670f

; ----------------------------------------------------------------------
; DATOS cabecera_6711: cabecera del sonido 0x02 (p16:4074): [canales
;   FF][prioridad E0] y 8 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (18 bytes)
;   0x6711..0x6723  (18 bytes)
DATA_cabecera_6711:
	defb 0ffh,0e0h	; 6711
	defb 09dh,06dh	; 6713
	defb 09dh,06dh	; 6715
	defb 09dh,06dh	; 6717
	defb 09dh,06dh	; 6719
	defb 09dh,06dh	; 671b
	defb 09dh,06dh	; 671d
	defb 09dh,06dh	; 671f
	defb 09dh,06dh	; 6721

; ----------------------------------------------------------------------
; DATOS cabecera_6723: cabecera del sonido 0x03 (p16:4074): [canales
;   CF][prioridad E0] y 6 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (14 bytes)
;   0x6723..0x6731  (14 bytes)
DATA_cabecera_6723:
	defb 0cfh,0e0h	; 6723
	defb 09dh,06dh	; 6725
	defb 09dh,06dh	; 6727
	defb 09dh,06dh	; 6729
	defb 09dh,06dh	; 672b
	defb 09dh,06dh	; 672d
	defb 09dh,06dh	; 672f

; ----------------------------------------------------------------------
; DATOS cabecera_6731: cabecera del sonido 0x04 (p16:4074): [canales
;   30][prioridad 90] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x6731..0x6737  (6 bytes)
DATA_cabecera_6731:
	defb 030h,090h	; 6731
	defb 09dh,06dh	; 6733
	defb 09dh,06dh	; 6735

; ----------------------------------------------------------------------
; DATOS cabecera_6737: cabecera del sonido 0x05 (p16:4074): [canales
;   30][prioridad E0] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x6737..0x673d  (6 bytes)
DATA_cabecera_6737:
	defb 030h,0e0h	; 6737
	defb 09dh,06dh	; 6739
	defb 09dh,06dh	; 673b

; ----------------------------------------------------------------------
; DATOS cabecera_673D: cabecera del sonido 0x06 (p16:4074): [canales
;   10][prioridad FE] y 1 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (4 bytes)
;   0x673d..0x6741  (4 bytes)
DATA_cabecera_673D:
	defb 010h,0feh	; 673d
	defb 09eh,06dh	; 673f

; ----------------------------------------------------------------------
; DATOS cabecera_6741: cabecera del sonido 0x07 (p16:4074): [canales
;   30][prioridad 90] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x6741..0x6747  (6 bytes)
DATA_cabecera_6741:
	defb 030h,090h	; 6741
	defb 0b6h,06dh	; 6743
	defb 0f1h,06dh	; 6745

; ----------------------------------------------------------------------
; DATOS cabecera_6747: cabecera del sonido 0x08 (p16:4074): [canales
;   30][prioridad 50] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x6747..0x674d  (6 bytes)
DATA_cabecera_6747:
	defb 030h,050h	; 6747
	defb 02eh,06eh	; 6749
	defb 045h,06eh	; 674b

; ----------------------------------------------------------------------
; DATOS cabecera_674D: cabecera del sonido 0x09 (p16:4074): [canales
;   30][prioridad 20] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x674d..0x6753  (6 bytes)
DATA_cabecera_674D:
	defb 030h,020h	; 674d
	defb 05eh,06eh	; 674f
	defb 09bh,06eh	; 6751

; ----------------------------------------------------------------------
; DATOS cabecera_6753: cabecera del sonido 0x0A (p16:4074): [canales
;   30][prioridad 20] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x6753..0x6759  (6 bytes)
DATA_cabecera_6753:
	defb 030h,020h	; 6753
	defb 0c2h,06eh	; 6755
	defb 002h,06fh	; 6757

; ----------------------------------------------------------------------
; DATOS cabecera_6759: cabecera del sonido 0x0B (p16:4074): [canales
;   30][prioridad 30] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x6759..0x675f  (6 bytes)
DATA_cabecera_6759:
	defb 030h,030h	; 6759
	defb 03fh,06fh	; 675b
	defb 07eh,06fh	; 675d

; ----------------------------------------------------------------------
; DATOS cabecera_675F: cabecera del sonido 0x0C (p16:4074): [canales
;   30][prioridad 01] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x675f..0x6765  (6 bytes)
DATA_cabecera_675F:
	defb 030h,001h	; 675f
	defb 0c1h,06fh	; 6761
	defb 0e1h,06fh	; 6763

; ----------------------------------------------------------------------
; DATOS cabecera_6765: cabecera del sonido 0x0D (p16:4074): [canales
;   30][prioridad 30] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x6765..0x676b  (6 bytes)
DATA_cabecera_6765:
	defb 030h,030h	; 6765
	defb 0f8h,06fh	; 6767
	defb 046h,070h	; 6769

; ----------------------------------------------------------------------
; DATOS cabecera_676B: cabecera del sonido 0x0E (p16:4074): [canales
;   30][prioridad 30] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x676b..0x6771  (6 bytes)
DATA_cabecera_676B:
	defb 030h,030h	; 676b
	defb 0b3h,070h	; 676d
	defb 007h,071h	; 676f

; ----------------------------------------------------------------------
; DATOS cabecera_6771: cabecera del sonido 0x0F (p16:4074): [canales
;   30][prioridad 51] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x6771..0x6777  (6 bytes)
DATA_cabecera_6771:
	defb 030h,051h	; 6771
	defb 044h,071h	; 6773
	defb 0bbh,071h	; 6775

; ----------------------------------------------------------------------
; DATOS cabecera_6777: cabecera del sonido 0x10 (p16:4074): [canales
;   30][prioridad 51] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x6777..0x677d  (6 bytes)
DATA_cabecera_6777:
	defb 030h,051h	; 6777
	defb 03ch,072h	; 6779
	defb 099h,072h	; 677b

; ----------------------------------------------------------------------
; DATOS cabecera_677D: cabecera del sonido 0x11 (p16:4074): [canales
;   30][prioridad 20] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x677d..0x6783  (6 bytes)
DATA_cabecera_677D:
	defb 030h,020h	; 677d
	defb 0ceh,072h	; 677f
	defb 0f5h,072h	; 6781

; ----------------------------------------------------------------------
; DATOS cabecera_6783: cabecera del sonido 0x12 (p16:4074): [canales
;   30][prioridad 20] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x6783..0x6789  (6 bytes)
DATA_cabecera_6783:
	defb 030h,020h	; 6783
	defb 020h,073h	; 6785
	defb 042h,073h	; 6787

; ----------------------------------------------------------------------
; DATOS cabecera_6789: cabecera del sonido 0x13 (p16:4074): [canales
;   30][prioridad 40] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x6789..0x678f  (6 bytes)
DATA_cabecera_6789:
	defb 030h,040h	; 6789
	defb 063h,073h	; 678b
	defb 0b3h,073h	; 678d

; ----------------------------------------------------------------------
; DATOS cabecera_678F: cabecera del sonido 0x14 (p16:4074): [canales
;   30][prioridad 52] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x678f..0x6795  (6 bytes)
DATA_cabecera_678F:
	defb 030h,052h	; 678f
	defb 0f0h,073h	; 6791
	defb 02ch,074h	; 6793

; ----------------------------------------------------------------------
; DATOS cabecera_6795: cabecera del sonido 0x15 (p16:4074): [canales
;   30][prioridad 4F] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x6795..0x679b  (6 bytes)
DATA_cabecera_6795:
	defb 030h,04fh	; 6795
	defb 04bh,075h	; 6797
	defb 0f5h,075h	; 6799

; ----------------------------------------------------------------------
; DATOS cabecera_679B: cabecera del sonido 0x16 (p16:4074): [canales
;   30][prioridad 40] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x679b..0x67a1  (6 bytes)
DATA_cabecera_679B:
	defb 030h,040h	; 679b
	defb 09eh,076h	; 679d
	defb 0a2h,076h	; 679f

; ----------------------------------------------------------------------
; DATOS cabecera_67A1: cabecera del sonido 0x17 (p16:4074): [canales
;   30][prioridad 30] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x67a1..0x67a7  (6 bytes)
DATA_cabecera_67A1:
	defb 030h,030h	; 67a1
	defb 018h,077h	; 67a3
	defb 053h,077h	; 67a5

; ----------------------------------------------------------------------
; DATOS cabecera_67A7: cabecera del sonido 0x18 (p16:4074): [canales
;   30][prioridad 80] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x67a7..0x67ad  (6 bytes)
DATA_cabecera_67A7:
	defb 030h,080h	; 67a7
	defb 07eh,077h	; 67a9
	defb 09dh,077h	; 67ab

; ----------------------------------------------------------------------
; DATOS cabecera_67AD: cabecera del sonido 0x19 (p16:4074): [canales
;   30][prioridad 80] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x67ad..0x67b3  (6 bytes)
DATA_cabecera_67AD:
	defb 030h,080h	; 67ad
	defb 0beh,077h	; 67af
	defb 0f3h,077h	; 67b1

; ----------------------------------------------------------------------
; DATOS cabecera_67B3: cabecera del sonido 0x1A (p16:4074): [canales
;   30][prioridad 20] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x67b3..0x67b9  (6 bytes)
DATA_cabecera_67B3:
	defb 030h,020h	; 67b3
	defb 01ah,078h	; 67b5
	defb 068h,078h	; 67b7

; ----------------------------------------------------------------------
; DATOS cabecera_67B9: cabecera del sonido 0x1B (p16:4074): [canales
;   30][prioridad 80] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x67b9..0x67bf  (6 bytes)
DATA_cabecera_67B9:
	defb 030h,080h	; 67b9
	defb 0d3h,078h	; 67bb
	defb 0eeh,078h	; 67bd

; ----------------------------------------------------------------------
; DATOS cabecera_67BF: cabecera del sonido 0x1C (p16:4074): [canales
;   30][prioridad 50] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x67bf..0x67c5  (6 bytes)
DATA_cabecera_67BF:
	defb 030h,050h	; 67bf
	defb 007h,079h	; 67c1
	defb 046h,079h	; 67c3

; ----------------------------------------------------------------------
; DATOS cabecera_67C5: cabecera del sonido 0x1D (p16:4074): [canales
;   30][prioridad 30] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x67c5..0x67cb  (6 bytes)
DATA_cabecera_67C5:
	defb 030h,030h	; 67c5
	defb 083h,079h	; 67c7
	defb 0dbh,079h	; 67c9

; ----------------------------------------------------------------------
; DATOS cabecera_67CB: cabecera del sonido 0x1E (p16:4074): [canales
;   30][prioridad 01] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x67cb..0x67d1  (6 bytes)
DATA_cabecera_67CB:
	defb 030h,001h	; 67cb
	defb 045h,07ah	; 67cd
	defb 06ah,07ah	; 67cf

; ----------------------------------------------------------------------
; DATOS cabecera_67D1: cabecera del sonido 0x1F (p16:4074): [canales
;   30][prioridad 01] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x67d1..0x67d7  (6 bytes)
DATA_cabecera_67D1:
	defb 030h,001h	; 67d1
	defb 08bh,07ah	; 67d3
	defb 0c1h,07ah	; 67d5

; ----------------------------------------------------------------------
; DATOS cabecera_67D7: cabecera del sonido 0x20 (p16:4074): [canales
;   30][prioridad 01] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x67d7..0x67dd  (6 bytes)
DATA_cabecera_67D7:
	defb 030h,001h	; 67d7
	defb 000h,07bh	; 67d9
	defb 01dh,07bh	; 67db

; ----------------------------------------------------------------------
; DATOS cabecera_67DD: cabecera del sonido 0x21 (p16:4074): [canales
;   30][prioridad 30] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x67dd..0x67e3  (6 bytes)
DATA_cabecera_67DD:
	defb 030h,030h	; 67dd
	defb 036h,07bh	; 67df
	defb 0a1h,07bh	; 67e1

; ----------------------------------------------------------------------
; DATOS cabecera_67E3: cabecera del sonido 0x22 (p16:4074): [canales
;   30][prioridad 20] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x67e3..0x67e9  (6 bytes)
DATA_cabecera_67E3:
	defb 030h,020h	; 67e3
	defb 008h,07ch	; 67e5
	defb 049h,07ch	; 67e7

; ----------------------------------------------------------------------
; DATOS cabecera_67E9: cabecera del sonido 0x23 (p16:4074): [canales
;   30][prioridad 90] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x67e9..0x67ef  (6 bytes)
DATA_cabecera_67E9:
	defb 030h,090h	; 67e9
	defb 08eh,07ch	; 67eb
	defb 09fh,07ch	; 67ed

; ----------------------------------------------------------------------
; DATOS cabecera_67EF: cabecera del sonido 0x24 (p16:4074): [canales
;   30][prioridad 40] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x67ef..0x67f5  (6 bytes)
DATA_cabecera_67EF:
	defb 030h,040h	; 67ef
	defb 0b0h,07ch	; 67f1
	defb 0eah,07ch	; 67f3

; ----------------------------------------------------------------------
; DATOS cabecera_67F5: cabecera del sonido 0x25 (p16:4074): [canales
;   30][prioridad 60] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x67f5..0x67fb  (6 bytes)
DATA_cabecera_67F5:
	defb 030h,060h	; 67f5
	defb 01eh,07dh	; 67f7
	defb 05dh,07dh	; 67f9

; ----------------------------------------------------------------------
; DATOS cabecera_67FB: cabecera del sonido 0x26 (p16:4074): [canales
;   30][prioridad 98] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x67fb..0x6801  (6 bytes)
DATA_cabecera_67FB:
	defb 030h,098h	; 67fb
	defb 0a6h,07dh	; 67fd
	defb 0eeh,07dh	; 67ff

; ----------------------------------------------------------------------
; DATOS cabecera_6801: cabecera del sonido 0x27 (p16:4074): [canales
;   30][prioridad 02] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x6801..0x6807  (6 bytes)
DATA_cabecera_6801:
	defb 030h,002h	; 6801
	defb 038h,07eh	; 6803
	defb 061h,07eh	; 6805

; ----------------------------------------------------------------------
; DATOS cabecera_6807: cabecera del sonido 0x28 (p16:4074): [canales
;   30][prioridad 90] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x6807..0x680d  (6 bytes)
DATA_cabecera_6807:
	defb 030h,090h	; 6807
	defb 08ah,07eh	; 6809
	defb 0dfh,07eh	; 680b

; ----------------------------------------------------------------------
; DATOS cabecera_680D: cabecera del sonido 0x29 (p16:4074): [canales
;   30][prioridad 90] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x680d..0x6813  (6 bytes)
DATA_cabecera_680D:
	defb 030h,090h	; 680d
	defb 07eh,07fh	; 680f
	defb 0d2h,07fh	; 6811

; ----------------------------------------------------------------------
; DATOS cabecera_6813: cabecera del sonido 0x2A (p16:4074): [canales
;   30][prioridad 20] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x6813..0x6819  (6 bytes)
DATA_cabecera_6813:
	defb 030h,020h	; 6813
	defb 06ah,080h	; 6815
	defb 0cfh,080h	; 6817

; ----------------------------------------------------------------------
; DATOS cabecera_6819: cabecera del sonido 0x2B (p16:4074): [canales
;   30][prioridad 20] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x6819..0x681f  (6 bytes)
DATA_cabecera_6819:
	defb 030h,020h	; 6819
	defb 036h,081h	; 681b
	defb 041h,081h	; 681d

; ----------------------------------------------------------------------
; DATOS cabecera_681F: cabecera del sonido 0x2C (p16:4074): [canales
;   30][prioridad 20] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x681f..0x6825  (6 bytes)
DATA_cabecera_681F:
	defb 030h,020h	; 681f
	defb 04ch,081h	; 6821
	defb 057h,081h	; 6823

; ----------------------------------------------------------------------
; DATOS cabecera_6825: cabecera del sonido 0x2D (p16:4074): [canales
;   30][prioridad 20] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x6825..0x682b  (6 bytes)
DATA_cabecera_6825:
	defb 030h,020h	; 6825
	defb 062h,081h	; 6827
	defb 06dh,081h	; 6829

; ----------------------------------------------------------------------
; DATOS cabecera_682B: cabecera del sonido 0x2E (p16:4074): [canales
;   30][prioridad 80] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x682b..0x6831  (6 bytes)
DATA_cabecera_682B:
	defb 030h,080h	; 682b
	defb 078h,081h	; 682d
	defb 0cah,081h	; 682f

; ----------------------------------------------------------------------
; DATOS cabecera_6831: cabecera del sonido 0x2F (p16:4074): [canales
;   30][prioridad 20] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x6831..0x6837  (6 bytes)
DATA_cabecera_6831:
	defb 030h,020h	; 6831
	defb 008h,082h	; 6833
	defb 017h,082h	; 6835

; ----------------------------------------------------------------------
; DATOS cabecera_6837: cabecera del sonido 0x30 (p16:4074): [canales
;   30][prioridad 20] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x6837..0x683d  (6 bytes)
DATA_cabecera_6837:
	defb 030h,020h	; 6837
	defb 028h,082h	; 6839
	defb 0beh,082h	; 683b

; ----------------------------------------------------------------------
; DATOS cabecera_683D: cabecera del sonido 0x31 (p16:4074): [canales
;   30][prioridad 20] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x683d..0x6843  (6 bytes)
DATA_cabecera_683D:
	defb 030h,020h	; 683d
	defb 055h,083h	; 683f
	defb 07ah,083h	; 6841

; ----------------------------------------------------------------------
; DATOS cabecera_6843: cabecera del sonido 0x32 (p16:4074): [canales
;   30][prioridad 20] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x6843..0x6849  (6 bytes)
DATA_cabecera_6843:
	defb 030h,020h	; 6843
	defb 09fh,083h	; 6845
	defb 0c2h,083h	; 6847

; ----------------------------------------------------------------------
; DATOS cabecera_6849: cabecera del sonido 0x33 (p16:4074): [canales
;   30][prioridad 20] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x6849..0x684f  (6 bytes)
DATA_cabecera_6849:
	defb 030h,020h	; 6849
	defb 0e7h,083h	; 684b
	defb 00ah,084h	; 684d

; ----------------------------------------------------------------------
; DATOS cabecera_684F: cabecera del sonido 0x34 (p16:4074): [canales
;   30][prioridad 20] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x684f..0x6855  (6 bytes)
DATA_cabecera_684F:
	defb 030h,020h	; 684f
	defb 02fh,084h	; 6851
	defb 055h,084h	; 6853

; ----------------------------------------------------------------------
; DATOS cabecera_6855: cabecera del sonido 0x35 (p16:4074): [canales
;   30][prioridad 90] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x6855..0x685b  (6 bytes)
DATA_cabecera_6855:
	defb 030h,090h	; 6855
	defb 07bh,084h	; 6857
	defb 0a9h,084h	; 6859

; ----------------------------------------------------------------------
; DATOS cabecera_685B: cabecera del sonido 0x36 (p16:4074): [canales
;   30][prioridad 10] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x685b..0x6861  (6 bytes)
DATA_cabecera_685B:
	defb 030h,010h	; 685b
	defb 0cch,084h	; 685d
	defb 0e7h,084h	; 685f

; ----------------------------------------------------------------------
; DATOS cabecera_6861: cabecera del sonido 0x37 (p16:4074): [canales
;   30][prioridad 10] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x6861..0x6867  (6 bytes)
DATA_cabecera_6861:
	defb 030h,010h	; 6861
	defb 0fch,084h	; 6863
	defb 017h,085h	; 6865

; ----------------------------------------------------------------------
; DATOS cabecera_6867: cabecera del sonido 0x38 (p16:4074): [canales
;   30][prioridad 20] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x6867..0x686d  (6 bytes)
DATA_cabecera_6867:
	defb 030h,020h	; 6867
	defb 02ch,085h	; 6869
	defb 065h,085h	; 686b

; ----------------------------------------------------------------------
; DATOS cabecera_686D: cabecera del sonido 0x39 (p16:4074): [canales
;   30][prioridad 20] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x686d..0x6873  (6 bytes)
DATA_cabecera_686D:
	defb 030h,020h	; 686d
	defb 0a5h,085h	; 686f
	defb 0e4h,085h	; 6871

; ----------------------------------------------------------------------
; DATOS cabecera_6873: cabecera del sonido 0x3A (p16:4074): [canales
;   30][prioridad 20] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x6873..0x6879  (6 bytes)
DATA_cabecera_6873:
	defb 030h,020h	; 6873
	defb 007h,086h	; 6875
	defb 056h,086h	; 6877

; ----------------------------------------------------------------------
; DATOS cabecera_6879: cabecera del sonido 0x3B (p16:4074): [canales
;   30][prioridad 40] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x6879..0x687f  (6 bytes)
DATA_cabecera_6879:
	defb 030h,040h	; 6879
	defb 08fh,086h	; 687b
	defb 0d7h,086h	; 687d

; ----------------------------------------------------------------------
; DATOS cabecera_687F: cabecera del sonido 0x3C (p16:4074): [canales
;   30][prioridad 20] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x687f..0x6885  (6 bytes)
DATA_cabecera_687F:
	defb 030h,020h	; 687f
	defb 0f2h,086h	; 6881
	defb 008h,087h	; 6883

; ----------------------------------------------------------------------
; DATOS cabecera_6885: cabecera del sonido 0x3D (p16:4074): [canales
;   30][prioridad 20] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x6885..0x688b  (6 bytes)
DATA_cabecera_6885:
	defb 030h,020h	; 6885
	defb 021h,087h	; 6887
	defb 037h,087h	; 6889

; ----------------------------------------------------------------------
; DATOS cabecera_688B: cabecera del sonido 0x3E (p16:4074): [canales
;   30][prioridad 20] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x688b..0x6891  (6 bytes)
DATA_cabecera_688B:
	defb 030h,020h	; 688b
	defb 050h,087h	; 688d
	defb 070h,087h	; 688f

; ----------------------------------------------------------------------
; DATOS cabecera_6891: cabecera del sonido 0x3F (p16:4074): [canales
;   30][prioridad 20] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x6891..0x6897  (6 bytes)
DATA_cabecera_6891:
	defb 030h,020h	; 6891
	defb 08dh,087h	; 6893
	defb 0a6h,087h	; 6895

; ----------------------------------------------------------------------
; DATOS cabecera_6897: cabecera del sonido 0x40 (p16:4074): [canales
;   30][prioridad 20] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x6897..0x689d  (6 bytes)
DATA_cabecera_6897:
	defb 030h,020h	; 6897
	defb 0c1h,087h	; 6899
	defb 00ah,088h	; 689b

; ----------------------------------------------------------------------
; DATOS cabecera_689D: cabecera del sonido 0x41 (p16:4074): [canales
;   30][prioridad 80] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x689d..0x68a3  (6 bytes)
DATA_cabecera_689D:
	defb 030h,080h	; 689d
	defb 05bh,088h	; 689f
	defb 068h,088h	; 68a1

; ----------------------------------------------------------------------
; DATOS cabecera_68A3: cabecera del sonido 0x42 (p16:4074): [canales
;   30][prioridad 80] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x68a3..0x68a9  (6 bytes)
DATA_cabecera_68A3:
	defb 030h,080h	; 68a3
	defb 083h,088h	; 68a5
	defb 0b0h,088h	; 68a7

; ----------------------------------------------------------------------
; DATOS cabecera_68A9: cabecera del sonido 0x43 (p16:4074): [canales
;   30][prioridad 51] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x68a9..0x68af  (6 bytes)
DATA_cabecera_68A9:
	defb 030h,051h	; 68a9
	defb 0ddh,088h	; 68ab
	defb 026h,089h	; 68ad

; ----------------------------------------------------------------------
; DATOS cabecera_68AF: cabecera del sonido 0x44 (p16:4074): [canales
;   30][prioridad 80] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x68af..0x68b5  (6 bytes)
DATA_cabecera_68AF:
	defb 030h,080h	; 68af
	defb 071h,089h	; 68b1
	defb 0ceh,089h	; 68b3

; ----------------------------------------------------------------------
; DATOS cabecera_68B5: cabecera del sonido 0x45 (p16:4074): [canales
;   30][prioridad 80] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x68b5..0x68bb  (6 bytes)
DATA_cabecera_68B5:
	defb 030h,080h	; 68b5
	defb 031h,08ah	; 68b7
	defb 06ch,08ah	; 68b9

; ----------------------------------------------------------------------
; DATOS cabecera_68BB: cabecera del sonido 0x46 (p16:4074): [canales
;   30][prioridad 80] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x68bb..0x68c1  (6 bytes)
DATA_cabecera_68BB:
	defb 030h,080h	; 68bb
	defb 0a9h,08ah	; 68bd
	defb 0adh,08ah	; 68bf

; ----------------------------------------------------------------------
; DATOS cabecera_68C1: cabecera del sonido 0x47 (p16:4074): [canales
;   30][prioridad 80] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x68c1..0x68c7  (6 bytes)
DATA_cabecera_68C1:
	defb 030h,080h	; 68c1
	defb 03dh,08bh	; 68c3
	defb 07bh,08bh	; 68c5

; ----------------------------------------------------------------------
; DATOS cabecera_68C7: cabecera del sonido 0x48 (p16:4074): [canales
;   30][prioridad 80] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x68c7..0x68cd  (6 bytes)
DATA_cabecera_68C7:
	defb 030h,080h	; 68c7
	defb 0b8h,08bh	; 68c9
	defb 041h,08ch	; 68cb

; ----------------------------------------------------------------------
; DATOS cabecera_68CD: cabecera del sonido 0x49 (p16:4074): [canales
;   30][prioridad 30] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x68cd..0x68d3  (6 bytes)
DATA_cabecera_68CD:
	defb 030h,030h	; 68cd
	defb 0ceh,08ch	; 68cf
	defb 015h,08dh	; 68d1

; ----------------------------------------------------------------------
; DATOS cabecera_68D3: cabecera del sonido 0x4A (p16:4074): [canales
;   30][prioridad 90] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x68d3..0x68d9  (6 bytes)
DATA_cabecera_68D3:
	defb 030h,090h	; 68d3
	defb 05ch,08dh	; 68d5
	defb 0beh,08dh	; 68d7

; ----------------------------------------------------------------------
; DATOS cabecera_68D9: cabecera del sonido 0x4B (p16:4074): [canales
;   30][prioridad 80] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x68d9..0x68df  (6 bytes)
DATA_cabecera_68D9:
	defb 030h,080h	; 68d9
	defb 067h,08eh	; 68db
	defb 0b2h,08eh	; 68dd

; ----------------------------------------------------------------------
; DATOS cabecera_68DF: cabecera del sonido 0x4C (p16:4074): [canales
;   30][prioridad 20] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x68df..0x68e5  (6 bytes)
DATA_cabecera_68DF:
	defb 030h,020h	; 68df
	defb 0ffh,08eh	; 68e1
	defb 03fh,08fh	; 68e3

; ----------------------------------------------------------------------
; DATOS cabecera_68E5: cabecera del sonido 0x4D (p16:4074): [canales
;   30][prioridad 30] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x68e5..0x68eb  (6 bytes)
DATA_cabecera_68E5:
	defb 030h,030h	; 68e5
	defb 088h,08fh	; 68e7
	defb 0ach,08fh	; 68e9

; ----------------------------------------------------------------------
; DATOS cabecera_68EB: cabecera del sonido 0x4E (p16:4074): [canales
;   30][prioridad 90] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x68eb..0x68f1  (6 bytes)
DATA_cabecera_68EB:
	defb 030h,090h	; 68eb
	defb 0d4h,08fh	; 68ed
	defb 05dh,090h	; 68ef

; ----------------------------------------------------------------------
; DATOS cabecera_68F1: cabecera del sonido 0x4F (p16:4074): [canales
;   30][prioridad 50] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x68f1..0x68f7  (6 bytes)
DATA_cabecera_68F1:
	defb 030h,050h	; 68f1
	defb 0eah,090h	; 68f3
	defb 01dh,091h	; 68f5

; ----------------------------------------------------------------------
; DATOS cabecera_68F7: cabecera del sonido 0x50 (p16:4074): [canales
;   30][prioridad 80] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x68f7..0x68fd  (6 bytes)
DATA_cabecera_68F7:
	defb 030h,080h	; 68f7
	defb 050h,091h	; 68f9
	defb 079h,091h	; 68fb

; ----------------------------------------------------------------------
; DATOS cabecera_68FD: cabecera del sonido 0x51 (p16:4074): [canales
;   30][prioridad 10] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x68fd..0x6903  (6 bytes)
DATA_cabecera_68FD:
	defb 030h,010h	; 68fd
	defb 09ah,091h	; 68ff
	defb 0adh,091h	; 6901

; ----------------------------------------------------------------------
; DATOS cabecera_6903: cabecera del sonido 0x52 (p16:4074): [canales
;   30][prioridad 10] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x6903..0x6909  (6 bytes)
DATA_cabecera_6903:
	defb 030h,010h	; 6903
	defb 0c6h,091h	; 6905
	defb 0d9h,091h	; 6907

; ----------------------------------------------------------------------
; DATOS cabecera_6909: cabecera del sonido 0x53 (p16:4074): [canales
;   30][prioridad 80] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x6909..0x690f  (6 bytes)
DATA_cabecera_6909:
	defb 030h,080h	; 6909
	defb 0f2h,091h	; 690b
	defb 042h,092h	; 690d

; ----------------------------------------------------------------------
; DATOS cabecera_690F: cabecera del sonido 0x54 (p16:4074): [canales
;   30][prioridad E0] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x690f..0x6915  (6 bytes)
DATA_cabecera_690F:
	defb 030h,0e0h	; 690f
	defb 09eh,092h	; 6911
	defb 02eh,093h	; 6913

; ----------------------------------------------------------------------
; DATOS cabecera_6915: cabecera del sonido 0x55 (p16:4074): [canales
;   30][prioridad 28] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x6915..0x691b  (6 bytes)
DATA_cabecera_6915:
	defb 030h,028h	; 6915
	defb 0c8h,093h	; 6917
	defb 009h,094h	; 6919

; ----------------------------------------------------------------------
; DATOS cabecera_691B: cabecera del sonido 0x56 (p16:4074): [canales
;   30][prioridad 30] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x691b..0x6921  (6 bytes)
DATA_cabecera_691B:
	defb 030h,030h	; 691b
	defb 048h,094h	; 691d
	defb 084h,094h	; 691f

; ----------------------------------------------------------------------
; DATOS cabecera_6921: cabecera del sonido 0x57 (p16:4074): [canales
;   30][prioridad 40] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x6921..0x6927  (6 bytes)
DATA_cabecera_6921:
	defb 030h,040h	; 6921
	defb 0c1h,094h	; 6923
	defb 0eeh,094h	; 6925

; ----------------------------------------------------------------------
; DATOS cabecera_6927: cabecera del sonido 0x58 (p16:4074): [canales
;   30][prioridad 80] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x6927..0x692d  (6 bytes)
DATA_cabecera_6927:
	defb 030h,080h	; 6927
	defb 01dh,095h	; 6929
	defb 01dh,095h	; 692b

; ----------------------------------------------------------------------
; DATOS cabecera_692D: cabecera del sonido 0x59 (p16:4074): [canales
;   30][prioridad 90] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x692d..0x6933  (6 bytes)
DATA_cabecera_692D:
	defb 030h,090h	; 692d
	defb 01eh,095h	; 692f
	defb 067h,095h	; 6931

; ----------------------------------------------------------------------
; DATOS cabecera_6933: cabecera del sonido 0x5A (p16:4074): [canales
;   30][prioridad 08] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x6933..0x6939  (6 bytes)
DATA_cabecera_6933:
	defb 030h,008h	; 6933
	defb 0a8h,095h	; 6935
	defb 0dfh,095h	; 6937

; ----------------------------------------------------------------------
; DATOS cabecera_6939: cabecera del sonido 0x5B (p16:4074): [canales
;   30][prioridad 08] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x6939..0x693f  (6 bytes)
DATA_cabecera_6939:
	defb 030h,008h	; 6939
	defb 01ah,096h	; 693b
	defb 030h,096h	; 693d

; ----------------------------------------------------------------------
; DATOS cabecera_693F: cabecera del sonido 0x5C (p16:4074): [canales
;   30][prioridad 60] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x693f..0x6945  (6 bytes)
DATA_cabecera_693F:
	defb 030h,060h	; 693f
	defb 049h,096h	; 6941
	defb 060h,096h	; 6943

; ----------------------------------------------------------------------
; DATOS cabecera_6945: cabecera del sonido 0x5D (p16:4074): [canales
;   30][prioridad 40] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x6945..0x694b  (6 bytes)
DATA_cabecera_6945:
	defb 030h,040h	; 6945
	defb 079h,096h	; 6947
	defb 0c1h,096h	; 6949

; ----------------------------------------------------------------------
; DATOS cabecera_694B: cabecera del sonido 0x5E (p16:4074): [canales
;   30][prioridad 02] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x694b..0x6951  (6 bytes)
DATA_cabecera_694B:
	defb 030h,002h	; 694b
	defb 0dch,096h	; 694d
	defb 0f5h,096h	; 694f

; ----------------------------------------------------------------------
; DATOS cabecera_6951: cabecera del sonido 0x5F (p16:4074): [canales
;   30][prioridad 50] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x6951..0x6957  (6 bytes)
DATA_cabecera_6951:
	defb 030h,050h	; 6951
	defb 012h,097h	; 6953
	defb 013h,097h	; 6955

; ----------------------------------------------------------------------
; DATOS cabecera_6957: cabecera del sonido 0x60 (p16:4074): [canales
;   30][prioridad 30] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x6957..0x695d  (6 bytes)
DATA_cabecera_6957:
	defb 030h,030h	; 6957
	defb 014h,097h	; 6959
	defb 081h,097h	; 695b

; ----------------------------------------------------------------------
; DATOS cabecera_695D: cabecera del sonido 0x61 (p16:4074): [canales
;   30][prioridad 30] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x695d..0x6963  (6 bytes)
DATA_cabecera_695D:
	defb 030h,030h	; 695d
	defb 0edh,097h	; 695f
	defb 01ch,098h	; 6961

; ----------------------------------------------------------------------
; DATOS cabecera_6963: cabecera del sonido 0x62 (p16:4074): [canales
;   30][prioridad 60] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x6963..0x6969  (6 bytes)
DATA_cabecera_6963:
	defb 030h,060h	; 6963
	defb 04fh,098h	; 6965
	defb 0ceh,098h	; 6967

; ----------------------------------------------------------------------
; DATOS cabecera_6969: cabecera del sonido 0x63 (p16:4074): [canales
;   30][prioridad 20] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x6969..0x696f  (6 bytes)
DATA_cabecera_6969:
	defb 030h,020h	; 6969
	defb 08eh,099h	; 696b
	defb 0aeh,099h	; 696d

; ----------------------------------------------------------------------
; DATOS cabecera_696F: cabecera del sonido 0x64 (p16:4074): [canales
;   30][prioridad 90] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x696f..0x6975  (6 bytes)
DATA_cabecera_696F:
	defb 030h,090h	; 696f
	defb 0cbh,099h	; 6971
	defb 040h,09ah	; 6973

; ----------------------------------------------------------------------
; DATOS cabecera_6975: cabecera del sonido 0x65 (p16:4074): [canales
;   30][prioridad 38] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x6975..0x697b  (6 bytes)
DATA_cabecera_6975:
	defb 030h,038h	; 6975
	defb 09dh,09ah	; 6977
	defb 002h,09bh	; 6979

; ----------------------------------------------------------------------
; DATOS cabecera_697B: cabecera del sonido 0x66 (p16:4074): [canales
;   30][prioridad 38] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x697b..0x6981  (6 bytes)
DATA_cabecera_697B:
	defb 030h,038h	; 697b
	defb 059h,09bh	; 697d
	defb 085h,09bh	; 697f

; ----------------------------------------------------------------------
; DATOS cabecera_6981: cabecera del sonido 0x67 (p16:4074): [canales
;   30][prioridad 30] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x6981..0x6987  (6 bytes)
DATA_cabecera_6981:
	defb 030h,030h	; 6981
	defb 0cch,09bh	; 6983
	defb 03eh,09ch	; 6985

; ----------------------------------------------------------------------
; DATOS cabecera_6987: cabecera del sonido 0x68 (p16:4074): [canales
;   30][prioridad 28] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x6987..0x698d  (6 bytes)
DATA_cabecera_6987:
	defb 030h,028h	; 6987
	defb 0b2h,09ch	; 6989
	defb 0edh,09ch	; 698b

; ----------------------------------------------------------------------
; DATOS cabecera_698D: cabecera del sonido 0x69 (p16:4074): [canales
;   30][prioridad 90] y 2 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (6 bytes)
;   0x698d..0x6993  (6 bytes)
DATA_cabecera_698D:
	defb 030h,090h	; 698d
	defb 014h,09dh	; 698f
	defb 04ah,09dh	; 6991

; ----------------------------------------------------------------------
; DATOS cabecera_6993: cabecera del sonido 0x6A (p16:4074): [canales
;   CF][prioridad E0] y 6 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (14 bytes)
;   0x6993..0x69a1  (14 bytes)
DATA_cabecera_6993:
	defb 0cfh,0e0h	; 6993
	defb 000h,0a0h	; 6995
	defb 05fh,0a0h	; 6997
	defb 034h,0a1h	; 6999
	defb 002h,0a2h	; 699b
	defb 0edh,0a2h	; 699d
	defb 0e2h,0a3h	; 699f

; ----------------------------------------------------------------------
; DATOS cabecera_69A1: cabecera del sonido 0x6B (p16:4074): [canales
;   CF][prioridad E0] y 6 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (14 bytes)
;   0x69a1..0x69af  (14 bytes)
DATA_cabecera_69A1:
	defb 0cfh,0e0h	; 69a1
	defb 006h,0a0h	; 69a3
	defb 091h,0a0h	; 69a5
	defb 070h,0a1h	; 69a7
	defb 020h,0a2h	; 69a9
	defb 01dh,0a3h	; 69ab
	defb 0e8h,0a3h	; 69ad

; ----------------------------------------------------------------------
; DATOS cabecera_69AF: cabecera del sonido 0x6C (p16:4074): [canales
;   CF][prioridad E0] y 6 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (14 bytes)
;   0x69af..0x69bd  (14 bytes)
DATA_cabecera_69AF:
	defb 0cfh,0e0h	; 69af
	defb 000h,0a0h	; 69b1
	defb 02fh,0a0h	; 69b3
	defb 05eh,0a0h	; 69b5
	defb 09dh,0a0h	; 69b7
	defb 0f3h,0a0h	; 69b9
	defb 03bh,0a1h	; 69bb

; ----------------------------------------------------------------------
; DATOS cabecera_69BD: cabecera del sonido 0x6D (p16:4074): [canales
;   CF][prioridad E0] y 6 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (14 bytes)
;   0x69bd..0x69cb  (14 bytes)
DATA_cabecera_69BD:
	defb 0cfh,0e0h	; 69bd
	defb 077h,0a2h	; 69bf
	defb 0c9h,0a2h	; 69c1
	defb 09dh,0a3h	; 69c3
	defb 0b5h,0a4h	; 69c5
	defb 060h,0a5h	; 69c7
	defb 0ffh,0a6h	; 69c9

; ----------------------------------------------------------------------
; DATOS cabecera_69CB: cabecera del sonido 0x6E (p16:4074): [canales
;   CF][prioridad E0] y 6 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (14 bytes)
;   0x69cb..0x69d9  (14 bytes)
DATA_cabecera_69CB:
	defb 0cfh,0e0h	; 69cb
	defb 091h,0a2h	; 69cd
	defb 0f5h,0a2h	; 69cf
	defb 0c0h,0a3h	; 69d1
	defb 0dch,0a4h	; 69d3
	defb 080h,0a5h	; 69d5
	defb 017h,0a7h	; 69d7

; ----------------------------------------------------------------------
; DATOS cabecera_69D9: cabecera del sonido 0x6F (p16:4074): [canales
;   CF][prioridad E0] y 6 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (14 bytes)
;   0x69d9..0x69e7  (14 bytes)
DATA_cabecera_69D9:
	defb 0cfh,0e0h	; 69d9
	defb 0d9h,0a8h	; 69db
	defb 052h,0a9h	; 69dd
	defb 077h,0a9h	; 69df
	defb 0f7h,0a9h	; 69e1
	defb 039h,0aah	; 69e3
	defb 0dch,0aah	; 69e5

; ----------------------------------------------------------------------
; DATOS cabecera_69E7: cabecera del sonido 0x70 (p16:4074): [canales
;   CF][prioridad E0] y 6 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (14 bytes)
;   0x69e7..0x69f5  (14 bytes)
DATA_cabecera_69E7:
	defb 0cfh,0e0h	; 69e7
	defb 075h,0abh	; 69e9
	defb 00fh,0ach	; 69eb
	defb 037h,0adh	; 69ed
	defb 0fch,0adh	; 69ef
	defb 0edh,0aeh	; 69f1
	defb 025h,0b0h	; 69f3

; ----------------------------------------------------------------------
; DATOS cabecera_69F5: cabecera del sonido 0x71 (p16:4074): [canales
;   CF][prioridad E0] y 6 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (14 bytes)
;   0x69f5..0x6a03  (14 bytes)
DATA_cabecera_69F5:
	defb 0cfh,0e0h	; 69f5
	defb 065h,0b1h	; 69f7
	defb 0f7h,0b1h	; 69f9
	defb 07ah,0b2h	; 69fb
	defb 006h,0b3h	; 69fd
	defb 0a5h,0b3h	; 69ff
	defb 01bh,0b4h	; 6a01

; ----------------------------------------------------------------------
; DATOS cabecera_6A03: cabecera del sonido 0x72 (p16:4074): [canales
;   CF][prioridad E0] y 6 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (14 bytes)
;   0x6a03..0x6a11  (14 bytes)
DATA_cabecera_6A03:
	defb 0cfh,0e0h	; 6a03
	defb 0d9h,0b4h	; 6a05
	defb 012h,0b5h	; 6a07
	defb 0e0h,0b5h	; 6a09
	defb 05ch,0b6h	; 6a0b
	defb 033h,0b7h	; 6a0d
	defb 039h,0b8h	; 6a0f

; ----------------------------------------------------------------------
; DATOS cabecera_6A11: cabecera del sonido 0x73 (p16:4074): [canales
;   CF][prioridad E0] y 6 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (14 bytes)
;   0x6a11..0x6a1f  (14 bytes)
DATA_cabecera_6A11:
	defb 0cfh,0e0h	; 6a11
	defb 030h,0b9h	; 6a13
	defb 0d6h,0b9h	; 6a15
	defb 0adh,0bah	; 6a17
	defb 073h,0bbh	; 6a19
	defb 0b7h,0bch	; 6a1b
	defb 0a7h,0bdh	; 6a1d

; ----------------------------------------------------------------------
; DATOS cabecera_6A1F: cabecera del sonido 0x74 (p16:4074): [canales
;   CF][prioridad E0] y 6 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (14 bytes)
;   0x6a1f..0x6a2d  (14 bytes)
DATA_cabecera_6A1F:
	defb 0cfh,0e0h	; 6a1f
	defb 080h,09dh	; 6a21
	defb 00bh,09eh	; 6a23
	defb 094h,09eh	; 6a25
	defb 01eh,09fh	; 6a27
	defb 0a0h,09fh	; 6a29
	defb 023h,0a0h	; 6a2b

; ----------------------------------------------------------------------
; DATOS cabecera_6A2D: cabecera del sonido 0x75 (p16:4074): [canales
;   CF][prioridad E0] y 6 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (14 bytes)
;   0x6a2d..0x6a3b  (14 bytes)
DATA_cabecera_6A2D:
	defb 0cfh,0e0h	; 6a2d
	defb 0f0h,0a4h	; 6a2f
	defb 0f0h,0a4h	; 6a31
	defb 0f0h,0a4h	; 6a33
	defb 0f0h,0a4h	; 6a35
	defb 0f0h,0a4h	; 6a37
	defb 0f0h,0a4h	; 6a39

; ----------------------------------------------------------------------
; DATOS cabecera_6A3B: cabecera del sonido 0x76 (p16:4074): [canales
;   CF][prioridad E0] y 6 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (14 bytes)
;   0x6a3b..0x6a49  (14 bytes)
DATA_cabecera_6A3B:
	defb 0cfh,0e0h	; 6a3b
	defb 00dh,0a1h	; 6a3d
	defb 0c6h,0a1h	; 6a3f
	defb 01dh,0a3h	; 6a41
	defb 0e8h,0a3h	; 6a43
	defb 0e7h,0a4h	; 6a45
	defb 030h,0a6h	; 6a47

; ----------------------------------------------------------------------
; DATOS cabecera_6A49: cabecera del sonido 0x77 (p16:4074): [canales
;   CF][prioridad E0] y 6 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (14 bytes)
;   0x6a49..0x6a57  (14 bytes)
DATA_cabecera_6A49:
	defb 0cfh,0e0h	; 6a49
	defb 000h,0a0h	; 6a4b
	defb 069h,0a0h	; 6a4d
	defb 036h,0a1h	; 6a4f
	defb 0d3h,0a1h	; 6a51
	defb 05ch,0a2h	; 6a53
	defb 03fh,0a3h	; 6a55

; ----------------------------------------------------------------------
; DATOS cabecera_6A57: cabecera del sonido 0x78 (p16:4074): [canales
;   CF][prioridad E0] y 6 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (14 bytes)
;   0x6a57..0x6a65  (14 bytes)
DATA_cabecera_6A57:
	defb 0cfh,0e0h	; 6a57
	defb 0c1h,0a6h	; 6a59
	defb 09bh,0a7h	; 6a5b
	defb 0cbh,0a8h	; 6a5d
	defb 0feh,0a9h	; 6a5f
	defb 070h,0abh	; 6a61
	defb 046h,0ach	; 6a63

; ----------------------------------------------------------------------
; DATOS cabecera_6A65: cabecera del sonido 0x79 (p16:4074): [canales
;   CF][prioridad E0] y 6 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (14 bytes)
;   0x6a65..0x6a73  (14 bytes)
DATA_cabecera_6A65:
	defb 0cfh,0e0h	; 6a65
	defb 0f1h,0a4h	; 6a67
	defb 073h,0a5h	; 6a69
	defb 0c3h,0a5h	; 6a6b
	defb 0d2h,0a6h	; 6a6d
	defb 039h,0a7h	; 6a6f
	defb 099h,0a8h	; 6a71

; ----------------------------------------------------------------------
; DATOS cabecera_6A73: cabecera del sonido 0x7A (p16:4074): [canales
;   CF][prioridad E0] y 6 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (14 bytes)
;   0x6a73..0x6a81  (14 bytes)
DATA_cabecera_6A73:
	defb 0cfh,0e0h	; 6a73
	defb 000h,0a0h	; 6a75
	defb 051h,0a0h	; 6a77
	defb 09fh,0a1h	; 6a79
	defb 0bch,0a2h	; 6a7b
	defb 0a8h,0a3h	; 6a7d
	defb 07ah,0a5h	; 6a7f

; ----------------------------------------------------------------------
; DATOS cabecera_6A81: cabecera del sonido 0x7B (p16:4074): [canales
;   CF][prioridad E0] y 6 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (14 bytes)
;   0x6a81..0x6a8f  (14 bytes)
DATA_cabecera_6A81:
	defb 0cfh,0e0h	; 6a81
	defb 03ch,0abh	; 6a83
	defb 0b7h,0abh	; 6a85
	defb 0a2h,0ach	; 6a87
	defb 089h,0adh	; 6a89
	defb 0b3h,0aeh	; 6a8b
	defb 0cbh,0afh	; 6a8d

; ----------------------------------------------------------------------
; DATOS cabecera_6A8F: cabecera del sonido 0x7C (p16:4074): [canales
;   CF][prioridad E0] y 6 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (14 bytes)
;   0x6a8f..0x6a9d  (14 bytes)
DATA_cabecera_6A8F:
	defb 0cfh,0e0h	; 6a8f
	defb 0b6h,0a1h	; 6a91
	defb 00fh,0a2h	; 6a93
	defb 05bh,0a2h	; 6a95
	defb 0f8h,0a2h	; 6a97
	defb 017h,0a3h	; 6a99
	defb 0d8h,0a3h	; 6a9b

; ----------------------------------------------------------------------
; DATOS cabecera_6A9D: cabecera del sonido 0x7D (p16:4074): [canales
;   CF][prioridad E0] y 6 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (14 bytes)
;   0x6a9d..0x6aab  (14 bytes)
DATA_cabecera_6A9D:
	defb 0cfh,0e0h	; 6a9d
	defb 090h,0a4h	; 6a9f
	defb 0c6h,0a4h	; 6aa1
	defb 004h,0a5h	; 6aa3
	defb 02bh,0a5h	; 6aa5
	defb 062h,0a5h	; 6aa7
	defb 09bh,0a5h	; 6aa9

; ----------------------------------------------------------------------
; DATOS cabecera_6AAB: cabecera del sonido 0x7E (p16:4074): [canales
;   CF][prioridad E0] y 6 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (14 bytes)
;   0x6aab..0x6ab9  (14 bytes)
DATA_cabecera_6AAB:
	defb 0cfh,0e0h	; 6aab
	defb 0f2h,0beh	; 6aad
	defb 012h,0bfh	; 6aaf
	defb 034h,0bfh	; 6ab1
	defb 051h,0bfh	; 6ab3
	defb 079h,0bfh	; 6ab5
	defb 0a0h,0bfh	; 6ab7

; ----------------------------------------------------------------------
; DATOS cabecera_6AB9: cabecera del sonido 0x7F (p16:4074): [canales
;   CF][prioridad E0] y 6 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (14 bytes)
;   0x6ab9..0x6ac7  (14 bytes)
DATA_cabecera_6AB9:
	defb 0cfh,0e0h	; 6ab9
	defb 033h,0adh	; 6abb
	defb 067h,0adh	; 6abd
	defb 08bh,0adh	; 6abf
	defb 0beh,0adh	; 6ac1
	defb 0f4h,0adh	; 6ac3
	defb 012h,0aeh	; 6ac5

; ----------------------------------------------------------------------
; DATOS cabecera_6AC7: cabecera del sonido 0x80 (p16:4074): [canales
;   CF][prioridad E0] y 6 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (14 bytes)
;   0x6ac7..0x6ad5  (14 bytes)
DATA_cabecera_6AC7:
	defb 0cfh,0e0h	; 6ac7
	defb 019h,0bah	; 6ac9
	defb 034h,0bah	; 6acb
	defb 0beh,0bah	; 6acd
	defb 0e9h,0bah	; 6acf
	defb 0c3h,0bbh	; 6ad1
	defb 095h,0bch	; 6ad3

; ----------------------------------------------------------------------
; DATOS cabecera_6AD5: cabecera del sonido 0x81 (p16:4074): [canales
;   CF][prioridad E0] y 6 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (14 bytes)
;   0x6ad5..0x6ae3  (14 bytes)
DATA_cabecera_6AD5:
	defb 0cfh,0e0h	; 6ad5
	defb 0d7h,0a5h	; 6ad7
	defb 00ch,0a6h	; 6ad9
	defb 08dh,0a6h	; 6adb
	defb 0f8h,0a6h	; 6add
	defb 048h,0a7h	; 6adf
	defb 099h,0a7h	; 6ae1

; ----------------------------------------------------------------------
; DATOS cabecera_6AE3: cabecera del sonido 0x82 (p16:4074): [canales
;   CF][prioridad E0] y 6 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (14 bytes)
;   0x6ae3..0x6af1  (14 bytes)
DATA_cabecera_6AE3:
	defb 0cfh,0e0h	; 6ae3
	defb 030h,0b1h	; 6ae5
	defb 058h,0b1h	; 6ae7
	defb 059h,0b1h	; 6ae9
	defb 081h,0b1h	; 6aeb
	defb 0b2h,0b1h	; 6aed
	defb 0deh,0b1h	; 6aef

; ----------------------------------------------------------------------
; DATOS cabecera_6AF1: cabecera del sonido 0x83 (p16:4074): [canales
;   CF][prioridad E0] y 6 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (14 bytes)
;   0x6af1..0x6aff  (14 bytes)
DATA_cabecera_6AF1:
	defb 0cfh,0e0h	; 6af1
	defb 021h,0a8h	; 6af3
	defb 030h,0a8h	; 6af5
	defb 045h,0a8h	; 6af7
	defb 05bh,0a8h	; 6af9
	defb 070h,0a8h	; 6afb
	defb 086h,0a8h	; 6afd

; ----------------------------------------------------------------------
; DATOS cabecera_6AFF: cabecera del sonido 0x84 (p16:4074): [canales
;   CF][prioridad E0] y 6 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (14 bytes)
;   0x6aff..0x6b0d  (14 bytes)
DATA_cabecera_6AFF:
	defb 0cfh,0e0h	; 6aff
	defb 0c7h,0beh	; 6b01
	defb 0dah,0beh	; 6b03
	defb 0f2h,0beh	; 6b05
	defb 00fh,0bfh	; 6b07
	defb 035h,0bfh	; 6b09
	defb 04ch,0bfh	; 6b0b

; ----------------------------------------------------------------------
; DATOS cabecera_6B0D: cabecera del sonido 0x85 (p16:4074): [canales
;   CF][prioridad E0] y 6 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (14 bytes)
;   0x6b0d..0x6b1b  (14 bytes)
DATA_cabecera_6B0D:
	defb 0cfh,0e0h	; 6b0d
	defb 09dh,0a9h	; 6b0f
	defb 0ech,0a9h	; 6b11
	defb 0edh,0a9h	; 6b13
	defb 03eh,0aah	; 6b15
	defb 091h,0aah	; 6b17
	defb 0e4h,0aah	; 6b19

; ----------------------------------------------------------------------
; DATOS cabecera_6B1B: cabecera del sonido 0x86 (p16:4074): [canales
;   CF][prioridad E0] y 6 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (14 bytes)
;   0x6b1b..0x6b29  (14 bytes)
DATA_cabecera_6B1B:
	defb 0cfh,0e0h	; 6b1b
	defb 037h,0abh	; 6b1d
	defb 03bh,0abh	; 6b1f
	defb 03fh,0abh	; 6b21
	defb 043h,0abh	; 6b23
	defb 047h,0abh	; 6b25
	defb 04bh,0abh	; 6b27

; ----------------------------------------------------------------------
; DATOS cabecera_6B29: cabecera del sonido 0x87 (p16:4074): [canales
;   CF][prioridad E0] y 6 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (14 bytes)
;   0x6b29..0x6b37  (14 bytes)
DATA_cabecera_6B29:
	defb 0cfh,0e0h	; 6b29
	defb 0aeh,0ach	; 6b2b
	defb 0efh,0ach	; 6b2d
	defb 02ch,0adh	; 6b2f
	defb 037h,0adh	; 6b31
	defb 040h,0adh	; 6b33
	defb 04ah,0adh	; 6b35

; ----------------------------------------------------------------------
; DATOS cabecera_6B37: cabecera del sonido 0x88 (p16:4074): [canales
;   CF][prioridad E0] y 6 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (14 bytes)
;   0x6b37..0x6b45  (14 bytes)
DATA_cabecera_6B37:
	defb 0cfh,0e0h	; 6b37
	defb 0a7h,0adh	; 6b39
	defb 0ddh,0adh	; 6b3b
	defb 0deh,0adh	; 6b3d
	defb 01dh,0aeh	; 6b3f
	defb 054h,0aeh	; 6b41
	defb 08bh,0aeh	; 6b43

; ----------------------------------------------------------------------
; DATOS cabecera_6B45: cabecera del sonido 0x89 (p16:4074): [canales
;   CF][prioridad E0] y 6 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (14 bytes)
;   0x6b45..0x6b53  (14 bytes)
DATA_cabecera_6B45:
	defb 0cfh,0e0h	; 6b45
	defb 008h,0b7h	; 6b47
	defb 07fh,0b7h	; 6b49
	defb 048h,0b8h	; 6b4b
	defb 088h,0b8h	; 6b4d
	defb 05dh,0b9h	; 6b4f
	defb 0beh,0b9h	; 6b51

; ----------------------------------------------------------------------
; DATOS cabecera_6B53: cabecera del sonido 0x8A (p16:4074): [canales
;   CF][prioridad E0] y 6 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (14 bytes)
;   0x6b53..0x6b61  (14 bytes)
DATA_cabecera_6B53:
	defb 0cfh,0e0h	; 6b53
	defb 02eh,0bfh	; 6b55
	defb 039h,0bfh	; 6b57
	defb 044h,0bfh	; 6b59
	defb 056h,0bfh	; 6b5b
	defb 05ah,0bfh	; 6b5d
	defb 05eh,0bfh	; 6b5f

; ----------------------------------------------------------------------
; DATOS cabecera_6B61: cabecera del sonido 0x8B (p16:4074): [canales
;   CF][prioridad E0] y 6 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (14 bytes)
;   0x6b61..0x6b6f  (14 bytes)
DATA_cabecera_6B61:
	defb 0cfh,0e0h	; 6b61
	defb 04fh,0abh	; 6b63
	defb 07ch,0abh	; 6b65
	defb 0e3h,0abh	; 6b67
	defb 011h,0ach	; 6b69
	defb 04eh,0ach	; 6b6b
	defb 07eh,0ach	; 6b6d

; ----------------------------------------------------------------------
; DATOS cabecera_6B6F: cabecera del sonido 0x8C (p16:4074): [canales
;   FF][prioridad E0] y 8 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (18 bytes)
;   0x6b6f..0x6b81  (18 bytes)
DATA_cabecera_6B6F:
	defb 0ffh,0e0h	; 6b6f
	defb 000h,0a0h	; 6b71
	defb 020h,0a0h	; 6b73
	defb 040h,0a0h	; 6b75
	defb 060h,0a0h	; 6b77
	defb 082h,0a0h	; 6b79
	defb 0a5h,0a0h	; 6b7b
	defb 0c7h,0a0h	; 6b7d
	defb 0e9h,0a0h	; 6b7f

; ----------------------------------------------------------------------
; DATOS cabecera_6B81: cabecera del sonido 0x8D (p16:4074): [canales
;   FF][prioridad E0] y 8 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (18 bytes)
;   0x6b81..0x6b93  (18 bytes)
DATA_cabecera_6B81:
	defb 0ffh,0e0h	; 6b81
	defb 0d5h,0b9h	; 6b83
	defb 0eeh,0b9h	; 6b85
	defb 02ch,0bah	; 6b87
	defb 06ah,0bah	; 6b89
	defb 095h,0bah	; 6b8b
	defb 0dah,0bah	; 6b8d
	defb 02eh,0bbh	; 6b8f
	defb 071h,0bbh	; 6b91

; ----------------------------------------------------------------------
; DATOS cabecera_6B93: cabecera del sonido 0x8E (p16:4074): [canales
;   FF][prioridad E0] y 8 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (18 bytes)
;   0x6b93..0x6ba5  (18 bytes)
DATA_cabecera_6B93:
	defb 0ffh,0e0h	; 6b93
	defb 000h,0a0h	; 6b95
	defb 016h,0a0h	; 6b97
	defb 02eh,0a0h	; 6b99
	defb 046h,0a0h	; 6b9b
	defb 08fh,0a0h	; 6b9d
	defb 0dbh,0a0h	; 6b9f
	defb 01dh,0a1h	; 6ba1
	defb 06ah,0a1h	; 6ba3

; ----------------------------------------------------------------------
; DATOS cabecera_6BA5: cabecera del sonido 0x8F (p16:4074): [canales
;   FF][prioridad E0] y 8 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (18 bytes)
;   0x6ba5..0x6bb7  (18 bytes)
DATA_cabecera_6BA5:
	defb 0ffh,0e0h	; 6ba5
	defb 0b2h,0a1h	; 6ba7
	defb 0b2h,0a1h	; 6ba9
	defb 0b2h,0a1h	; 6bab
	defb 0b2h,0a1h	; 6bad
	defb 0b2h,0a1h	; 6baf
	defb 0b2h,0a1h	; 6bb1
	defb 0b2h,0a1h	; 6bb3
	defb 0b2h,0a1h	; 6bb5

; ----------------------------------------------------------------------
; DATOS cabecera_6BB7: cabecera del sonido 0x90 (p16:4074): [canales
;   FF][prioridad E0] y 8 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (18 bytes)
;   0x6bb7..0x6bc9  (18 bytes)
DATA_cabecera_6BB7:
	defb 0ffh,0e0h	; 6bb7
	defb 0b3h,0a1h	; 6bb9
	defb 0c3h,0a1h	; 6bbb
	defb 0d3h,0a1h	; 6bbd
	defb 0e3h,0a1h	; 6bbf
	defb 0f5h,0a1h	; 6bc1
	defb 00ch,0a2h	; 6bc3
	defb 022h,0a2h	; 6bc5
	defb 034h,0a2h	; 6bc7

; ----------------------------------------------------------------------
; DATOS cabecera_6BC9: cabecera del sonido 0x91 (p16:4074): [canales
;   FF][prioridad E0] y 8 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (18 bytes)
;   0x6bc9..0x6bdb  (18 bytes)
DATA_cabecera_6BC9:
	defb 0ffh,0e0h	; 6bc9
	defb 046h,0a2h	; 6bcb
	defb 0a2h,0a2h	; 6bcd
	defb 0bbh,0a2h	; 6bcf
	defb 0c4h,0a2h	; 6bd1
	defb 0d1h,0a2h	; 6bd3
	defb 0dch,0a2h	; 6bd5
	defb 0e7h,0a2h	; 6bd7
	defb 0f2h,0a2h	; 6bd9

; ----------------------------------------------------------------------
; DATOS cabecera_6BDB: cabecera del sonido 0x92 (p16:4074): [canales
;   FF][prioridad E0] y 8 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (18 bytes)
;   0x6bdb..0x6bed  (18 bytes)
DATA_cabecera_6BDB:
	defb 0ffh,0e0h	; 6bdb
	defb 0fdh,0a2h	; 6bdd
	defb 005h,0a3h	; 6bdf
	defb 005h,0a3h	; 6be1
	defb 006h,0a3h	; 6be3
	defb 00eh,0a3h	; 6be5
	defb 016h,0a3h	; 6be7
	defb 01eh,0a3h	; 6be9
	defb 026h,0a3h	; 6beb

; ----------------------------------------------------------------------
; DATOS cabecera_6BED: cabecera del sonido 0x93 (p16:4074): [canales
;   FF][prioridad E0] y 8 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (18 bytes)
;   0x6bed..0x6bff  (18 bytes)
DATA_cabecera_6BED:
	defb 0ffh,0e0h	; 6bed
	defb 038h,0beh	; 6bef
	defb 03eh,0beh	; 6bf1
	defb 044h,0beh	; 6bf3
	defb 059h,0beh	; 6bf5
	defb 05dh,0beh	; 6bf7
	defb 0ech,0beh	; 6bf9
	defb 003h,0bfh	; 6bfb
	defb 009h,0bfh	; 6bfd

; ----------------------------------------------------------------------
; DATOS cabecera_6BFF: cabecera del sonido 0x94 (p16:4074): [canales
;   FF][prioridad E0] y 8 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (18 bytes)
;   0x6bff..0x6c11  (18 bytes)
DATA_cabecera_6BFF:
	defb 0ffh,0e0h	; 6bff
	defb 0c2h,0aeh	; 6c01
	defb 02eh,0afh	; 6c03
	defb 079h,0afh	; 6c05
	defb 0c6h,0afh	; 6c07
	defb 0a7h,0b0h	; 6c09
	defb 008h,0b1h	; 6c0b
	defb 077h,0b1h	; 6c0d
	defb 0d5h,0b1h	; 6c0f

; ----------------------------------------------------------------------
; DATOS cabecera_6C11: cabecera del sonido 0x95 (p16:4074): [canales
;   FF][prioridad E0] y 8 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (18 bytes)
;   0x6c11..0x6c23  (18 bytes)
DATA_cabecera_6C11:
	defb 0ffh,0e0h	; 6c11
	defb 0c1h,0aeh	; 6c13
	defb 0c1h,0aeh	; 6c15
	defb 0c1h,0aeh	; 6c17
	defb 0c1h,0aeh	; 6c19
	defb 0c1h,0aeh	; 6c1b
	defb 0c1h,0aeh	; 6c1d
	defb 0c1h,0aeh	; 6c1f
	defb 0c1h,0aeh	; 6c21

; ----------------------------------------------------------------------
; DATOS cabecera_6C23: cabecera del sonido 0x96 (p16:4074): [canales
;   FF][prioridad E0] y 8 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (18 bytes)
;   0x6c23..0x6c35  (18 bytes)
DATA_cabecera_6C23:
	defb 0ffh,0e0h	; 6c23
	defb 0f3h,0a4h	; 6c25
	defb 0fbh,0a4h	; 6c27
	defb 0fch,0a4h	; 6c29
	defb 0fdh,0a4h	; 6c2b
	defb 005h,0a5h	; 6c2d
	defb 00dh,0a5h	; 6c2f
	defb 015h,0a5h	; 6c31
	defb 01dh,0a5h	; 6c33

; ----------------------------------------------------------------------
; DATOS cabecera_6C35: cabecera del sonido 0x97 (p16:4074): [canales
;   FF][prioridad E0] y 8 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (18 bytes)
;   0x6c35..0x6c47  (18 bytes)
DATA_cabecera_6C35:
	defb 0ffh,0e0h	; 6c35
	defb 025h,0a5h	; 6c37
	defb 02dh,0a5h	; 6c39
	defb 02eh,0a5h	; 6c3b
	defb 02fh,0a5h	; 6c3d
	defb 037h,0a5h	; 6c3f
	defb 03fh,0a5h	; 6c41
	defb 047h,0a5h	; 6c43
	defb 04fh,0a5h	; 6c45

; ----------------------------------------------------------------------
; DATOS cabecera_6C47: cabecera del sonido 0x98 (p16:4074): [canales
;   FF][prioridad E0] y 8 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (18 bytes)
;   0x6c47..0x6c59  (18 bytes)
DATA_cabecera_6C47:
	defb 0ffh,0e0h	; 6c47
	defb 0ach,0bbh	; 6c49
	defb 061h,0bch	; 6c4b
	defb 0a4h,0bch	; 6c4d
	defb 0e7h,0bch	; 6c4f
	defb 053h,0bdh	; 6c51
	defb 08dh,0bdh	; 6c53
	defb 0c6h,0bdh	; 6c55
	defb 0ffh,0bdh	; 6c57

; ----------------------------------------------------------------------
; DATOS cabecera_6C59: cabecera del sonido 0x99 (p16:4074): [canales
;   FF][prioridad E0] y 8 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (18 bytes)
;   0x6c59..0x6c6b  (18 bytes)
DATA_cabecera_6C59:
	defb 0ffh,0e0h	; 6c59
	defb 057h,0a5h	; 6c5b
	defb 06ch,0a5h	; 6c5d
	defb 093h,0a5h	; 6c5f
	defb 0bdh,0a5h	; 6c61
	defb 0e7h,0a5h	; 6c63
	defb 017h,0a6h	; 6c65
	defb 054h,0a6h	; 6c67
	defb 07dh,0a6h	; 6c69

; ----------------------------------------------------------------------
; DATOS cabecera_6C6B: cabecera del sonido 0x9A (p16:4074): [canales
;   FF][prioridad E0] y 8 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (18 bytes)
;   0x6c6b..0x6c7d  (18 bytes)
DATA_cabecera_6C6B:
	defb 0ffh,0e0h	; 6c6b
	defb 033h,0aeh	; 6c6d
	defb 094h,0afh	; 6c6f
	defb 0c8h,0b0h	; 6c71
	defb 033h,0b2h	; 6c73
	defb 0dch,0b3h	; 6c75
	defb 0adh,0b5h	; 6c77
	defb 0efh,0b6h	; 6c79
	defb 032h,0b8h	; 6c7b

; ----------------------------------------------------------------------
; DATOS cabecera_6C7D: cabecera del sonido 0x9B (p16:4074): [canales
;   FF][prioridad E0] y 8 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (18 bytes)
;   0x6c7d..0x6c8f  (18 bytes)
DATA_cabecera_6C7D:
	defb 0ffh,0e0h	; 6c7d
	defb 06ch,0afh	; 6c7f
	defb 088h,0afh	; 6c81
	defb 0abh,0afh	; 6c83
	defb 0cah,0afh	; 6c85
	defb 0eeh,0afh	; 6c87
	defb 016h,0b0h	; 6c89
	defb 02fh,0b0h	; 6c8b
	defb 048h,0b0h	; 6c8d

; ----------------------------------------------------------------------
; DATOS cabecera_6C8F: cabecera del sonido 0x9C (p16:4074): [canales
;   FF][prioridad E0] y 8 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (18 bytes)
;   0x6c8f..0x6ca1  (18 bytes)
DATA_cabecera_6C8F:
	defb 0ffh,0e0h	; 6c8f
	defb 066h,0b0h	; 6c91
	defb 0b8h,0b0h	; 6c93
	defb 02ch,0b1h	; 6c95
	defb 0a0h,0b1h	; 6c97
	defb 01bh,0b2h	; 6c99
	defb 060h,0b2h	; 6c9b
	defb 0a9h,0b2h	; 6c9d
	defb 031h,0b3h	; 6c9f

; ----------------------------------------------------------------------
; DATOS cabecera_6CA1: cabecera del sonido 0x9D (p16:4074): [canales
;   FF][prioridad E0] y 8 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (18 bytes)
;   0x6ca1..0x6cb3  (18 bytes)
DATA_cabecera_6CA1:
	defb 0ffh,0e0h	; 6ca1
	defb 03ah,0b2h	; 6ca3
	defb 088h,0b2h	; 6ca5
	defb 0ceh,0b2h	; 6ca7
	defb 01eh,0b3h	; 6ca9
	defb 08eh,0b3h	; 6cab
	defb 014h,0b5h	; 6cad
	defb 046h,0b6h	; 6caf
	defb 0ddh,0b6h	; 6cb1

; ----------------------------------------------------------------------
; DATOS cabecera_6CB3: cabecera del sonido 0x9E (p16:4074): [canales
;   FF][prioridad E0] y 8 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (18 bytes)
;   0x6cb3..0x6cc5  (18 bytes)
DATA_cabecera_6CB3:
	defb 0ffh,0e0h	; 6cb3
	defb 014h,0bbh	; 6cb5
	defb 015h,0bbh	; 6cb7
	defb 09bh,0bbh	; 6cb9
	defb 01ch,0bch	; 6cbb
	defb 0d4h,0bch	; 6cbd
	defb 099h,0bdh	; 6cbf
	defb 04eh,0beh	; 6cc1
	defb 0aeh,0beh	; 6cc3

; ----------------------------------------------------------------------
; DATOS cabecera_6CC5: cabecera del sonido 0x9F (p16:4074): [canales
;   FF][prioridad E0] y 8 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (18 bytes)
;   0x6cc5..0x6cd7  (18 bytes)
DATA_cabecera_6CC5:
	defb 0ffh,0e0h	; 6cc5
	defb 0beh,0b3h	; 6cc7
	defb 0dch,0b3h	; 6cc9
	defb 0fdh,0b3h	; 6ccb
	defb 01fh,0b4h	; 6ccd
	defb 0b3h,0b4h	; 6ccf
	defb 08bh,0b5h	; 6cd1
	defb 0e9h,0b5h	; 6cd3
	defb 074h,0b6h	; 6cd5

; ----------------------------------------------------------------------
; DATOS cabecera_6CD7: cabecera del sonido 0xA0 (p16:4074): [canales
;   FF][prioridad E0] y 8 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (18 bytes)
;   0x6cd7..0x6ce9  (18 bytes)
DATA_cabecera_6CD7:
	defb 0ffh,0e0h	; 6cd7
	defb 00fh,0b2h	; 6cd9
	defb 0cbh,0b2h	; 6cdb
	defb 040h,0b3h	; 6cdd
	defb 096h,0b3h	; 6cdf
	defb 05eh,0b4h	; 6ce1
	defb 0afh,0b4h	; 6ce3
	defb 093h,0b5h	; 6ce5
	defb 002h,0b6h	; 6ce7

; ----------------------------------------------------------------------
; DATOS cabecera_6CE9: cabecera del sonido 0xA1 (p16:4074): [canales
;   FF][prioridad E0] y 8 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (18 bytes)
;   0x6ce9..0x6cfb  (18 bytes)
DATA_cabecera_6CE9:
	defb 0ffh,0e0h	; 6ce9
	defb 076h,0bdh	; 6ceb
	defb 0a2h,0bdh	; 6ced
	defb 0c8h,0bdh	; 6cef
	defb 0edh,0bdh	; 6cf1
	defb 01bh,0beh	; 6cf3
	defb 04bh,0beh	; 6cf5
	defb 083h,0beh	; 6cf7
	defb 0a6h,0beh	; 6cf9

; ----------------------------------------------------------------------
; DATOS cabecera_6CFB: cabecera del sonido 0xA2 (p16:4074): [canales
;   FF][prioridad E0] y 8 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (18 bytes)
;   0x6cfb..0x6d0d  (18 bytes)
DATA_cabecera_6CFB:
	defb 0ffh,0e0h	; 6cfb
	defb 042h,0a9h	; 6cfd
	defb 0ech,0aah	; 6cff
	defb 075h,0ach	; 6d01
	defb 0c7h,0adh	; 6d03
	defb 072h,0afh	; 6d05
	defb 07bh,0b1h	; 6d07
	defb 0cah,0b3h	; 6d09
	defb 045h,0b5h	; 6d0b

; ----------------------------------------------------------------------
; DATOS cabecera_6D0D: cabecera del sonido 0xA3 (p16:4074): [canales
;   FF][prioridad E0] y 8 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (18 bytes)
;   0x6d0d..0x6d1f  (18 bytes)
DATA_cabecera_6D0D:
	defb 0ffh,0e0h	; 6d0d
	defb 0bdh,0b6h	; 6d0f
	defb 01eh,0b8h	; 6d11
	defb 05dh,0b9h	; 6d13
	defb 04ch,0bah	; 6d15
	defb 069h,0bbh	; 6d17
	defb 04ch,0bch	; 6d19
	defb 038h,0bdh	; 6d1b
	defb 06ah,0beh	; 6d1d

; ----------------------------------------------------------------------
; DATOS cabecera_6D1F: cabecera del sonido 0xA4 (p16:4074): [canales
;   FF][prioridad E0] y 8 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (18 bytes)
;   0x6d1f..0x6d31  (18 bytes)
DATA_cabecera_6D1F:
	defb 0ffh,0e0h	; 6d1f
	defb 07ah,0a7h	; 6d21
	defb 0b6h,0a8h	; 6d23
	defb 042h,0aah	; 6d25
	defb 042h,0ach	; 6d27
	defb 053h,0aeh	; 6d29
	defb 0d1h,0afh	; 6d2b
	defb 037h,0b1h	; 6d2d
	defb 091h,0b3h	; 6d2f

; ----------------------------------------------------------------------
; DATOS cabecera_6D31: cabecera del sonido 0xA5 (p16:4074): [canales
;   FF][prioridad E0] y 8 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (18 bytes)
;   0x6d31..0x6d43  (18 bytes)
DATA_cabecera_6D31:
	defb 0ffh,0e0h	; 6d31
	defb 03ah,0b8h	; 6d33
	defb 090h,0b8h	; 6d35
	defb 0afh,0b8h	; 6d37
	defb 0cfh,0b8h	; 6d39
	defb 0f3h,0b8h	; 6d3b
	defb 01fh,0b9h	; 6d3d
	defb 04bh,0b9h	; 6d3f
	defb 090h,0b9h	; 6d41

; ----------------------------------------------------------------------
; DATOS cabecera_6D43: cabecera del sonido 0xA6 (p16:4074): [canales
;   FF][prioridad E0] y 8 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (18 bytes)
;   0x6d43..0x6d55  (18 bytes)
DATA_cabecera_6D43:
	defb 0ffh,0e0h	; 6d43
	defb 09ch,0a8h	; 6d45
	defb 0b8h,0a8h	; 6d47
	defb 0d6h,0a8h	; 6d49
	defb 0f6h,0a8h	; 6d4b
	defb 01ah,0a9h	; 6d4d
	defb 037h,0a9h	; 6d4f
	defb 052h,0a9h	; 6d51
	defb 078h,0a9h	; 6d53

; ----------------------------------------------------------------------
; DATOS cabecera_6D55: cabecera del sonido 0xA7 (p16:4074): [canales
;   FF][prioridad E0] y 8 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (18 bytes)
;   0x6d55..0x6d67  (18 bytes)
DATA_cabecera_6D55:
	defb 0ffh,0e0h	; 6d55
	defb 0dch,0b5h	; 6d57
	defb 01bh,0b6h	; 6d59
	defb 067h,0b6h	; 6d5b
	defb 0a2h,0b6h	; 6d5d
	defb 0c4h,0b6h	; 6d5f
	defb 028h,0b7h	; 6d61
	defb 078h,0b7h	; 6d63
	defb 0d3h,0b7h	; 6d65

; ----------------------------------------------------------------------
; DATOS cabecera_6D67: cabecera del sonido 0xA8 (p16:4074): [canales
;   FF][prioridad E0] y 8 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (18 bytes)
;   0x6d67..0x6d79  (18 bytes)
DATA_cabecera_6D67:
	defb 0ffh,0e0h	; 6d67
	defb 033h,0b8h	; 6d69
	defb 044h,0b8h	; 6d6b
	defb 059h,0b8h	; 6d6d
	defb 080h,0b8h	; 6d6f
	defb 096h,0b8h	; 6d71
	defb 0ach,0b8h	; 6d73
	defb 0d2h,0b8h	; 6d75
	defb 0f5h,0b8h	; 6d77

; ----------------------------------------------------------------------
; DATOS cabecera_6D79: cabecera del sonido 0xA9 (p16:4074): [canales
;   FF][prioridad E0] y 8 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (18 bytes)
;   0x6d79..0x6d8b  (18 bytes)
DATA_cabecera_6D79:
	defb 0ffh,0e0h	; 6d79
	defb 01bh,0b9h	; 6d7b
	defb 0e7h,0b9h	; 6d7d
	defb 08ah,0bah	; 6d7f
	defb 049h,0bbh	; 6d81
	defb 0f4h,0bbh	; 6d83
	defb 0d1h,0bch	; 6d85
	defb 0b0h,0bdh	; 6d87
	defb 0ceh,0beh	; 6d89

; ----------------------------------------------------------------------
; DATOS cabecera_6D8B: cabecera del sonido 0xAA (p16:4074): [canales
;   FF][prioridad E0] y 8 punteros, uno por canal (p16:411A); lo leen p16:4074
;   (18 bytes)
;   0x6d8b..0x6d9d  (18 bytes)
DATA_cabecera_6D8B:
	defb 0ffh,0e0h	; 6d8b
	defb 0fdh,0b7h	; 6d8d
	defb 096h,0b8h	; 6d8f
	defb 07dh,0b9h	; 6d91
	defb 07eh,0b9h	; 6d93
	defb 067h,0bah	; 6d95
	defb 0b6h,0bbh	; 6d97
	defb 00ah,0bdh	; 6d99
	defb 047h,0beh	; 6d9b

; ----------------------------------------------------------------------
; DATOS partitura_6D9D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x01, 0x02, 0x03, 0x04, 0x05 (lo mide tools/partituras.py
;   ejecutandolo); lo leen p16:4392 (1 bytes)
;   0x6d9d..0x6d9e  (1 bytes)
DATA_partitura_6D9D:
	defb 0ffh	; 6d9d

; ----------------------------------------------------------------------
; DATOS partitura_6D9E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x06 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (24 bytes)
;   0x6d9e..0x6db6  (24 bytes)
DATA_partitura_6D9E:
	defb 0feh,001h,0f8h,015h,0eah,00fh,0e9h,001h,0ebh,001h,088h,000h,0d1h,004h,074h,044h	; 6d9e  ..............tD
	defb 074h,0ebh,001h,023h,000h,0d0h,009h,0ffh	; 6dae  t..#....

; ----------------------------------------------------------------------
; DATOS partitura_6DB6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x07 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (59 bytes)
;   0x6db6..0x6df1  (59 bytes)
DATA_partitura_6DB6:
	defb 0feh,002h,0e2h,001h,031h,0b0h,032h,000h,033h,000h,034h,000h,005h,000h,006h,000h	; 6db6  ....1.2.3.4.....
	defb 007h,000h,008h,000h,009h,000h,0e0h,010h,0e2h,001h,022h,000h,023h,000h,024h,000h	; 6dc6  ..........".#.$.
	defb 0e0h,013h,0e2h,001h,001h,080h,002h,000h,003h,000h,004h,000h,0e0h,015h,0e2h,001h	; 6dd6  ................
	defb 002h,000h,003h,000h,004h,000h,0e0h,020h,0fdh,0b8h,06dh	; 6de6  ....... ..m

; ----------------------------------------------------------------------
; DATOS partitura_6DF1: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x07 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (61 bytes)
;   0x6df1..0x6e2e  (61 bytes)
DATA_partitura_6DF1:
	defb 0feh,002h,0f8h,005h,0e2h,001h,0c1h,0b0h,0c2h,000h,0c3h,000h,0c4h,000h,005h,000h	; 6df1  ................
	defb 006h,000h,007h,000h,008h,000h,009h,000h,0e0h,010h,0e2h,001h,072h,000h,073h,000h	; 6e01  ............r.s.
	defb 074h,000h,0e0h,013h,0e2h,001h,001h,080h,002h,000h,003h,000h,004h,000h,0e0h,015h	; 6e11  t...............
	defb 0e2h,001h,002h,000h,003h,000h,004h,000h,0e0h,020h,0fdh,0f5h,06dh	; 6e21  ......... ..m

; ----------------------------------------------------------------------
; DATOS partitura_6E2E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x08 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (23 bytes)
;   0x6e2e..0x6e45  (23 bytes)
DATA_partitura_6E2E:
	defb 0feh,002h,0e2h,004h,000h,070h,010h,070h,020h,070h,010h,070h,000h,070h,0e2h,00ah	; 6e2e  .....p.p p.p.p..
	defb 000h,070h,0e2h,00eh,000h,070h,0ffh	; 6e3e

; ----------------------------------------------------------------------
; DATOS partitura_6E45: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x08 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0x6e45..0x6e5e  (25 bytes)
DATA_partitura_6E45:
	defb 0feh,002h,0f8h,005h,0e2h,004h,0a0h,070h,0b0h,070h,0c0h,070h,090h,070h,040h,070h	; 6e45  .......p.p.p.p@p
	defb 0e2h,00ah,030h,070h,0e2h,00eh,010h,070h,0ffh	; 6e55  ..0p...p.

; ----------------------------------------------------------------------
; DATOS partitura_6E5E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x09 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (61 bytes)
;   0x6e5e..0x6e9b  (61 bytes)
DATA_partitura_6E5E:
	defb 0feh,002h,0e1h,001h,0e4h,01fh,00ah,0e4h,01ah,008h,0e4h,018h,007h,0e4h,014h,007h	; 6e5e  ................
	defb 0e4h,010h,007h,0e4h,00ah,007h,0e4h,006h,007h,0e4h,004h,007h,0e4h,002h,007h,006h	; 6e6e  ................
	defb 0e4h,006h,007h,0e4h,004h,007h,0e4h,002h,007h,002h,0e4h,014h,004h,0e4h,010h,003h	; 6e7e  ................
	defb 0e4h,00ah,003h,0e4h,006h,002h,0e4h,004h,002h,0e4h,002h,001h,0ffh	; 6e8e  .............

; ----------------------------------------------------------------------
; DATOS partitura_6E9B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x09 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (39 bytes)
;   0x6e9b..0x6ec2  (39 bytes)
DATA_partitura_6E9B:
	defb 0feh,002h,0f8h,005h,0e2h,001h,082h,050h,062h,080h,063h,000h,062h,0f0h,063h,050h	; 6e9b  .......Pb.c.b.cP
	defb 063h,0a0h,064h,000h,064h,080h,065h,000h,000h,000h,002h,0f0h,003h,050h,003h,0a0h	; 6eab  c.d.d.e......P..
	defb 004h,000h,004h,080h,005h,000h,0ffh	; 6ebb

; ----------------------------------------------------------------------
; DATOS partitura_6EC2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x0A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (64 bytes)
;   0x6ec2..0x6f02  (64 bytes)
DATA_partitura_6EC2:
	defb 0feh,002h,0f8h,026h,0e2h,001h,0b2h,030h,0e1h,001h,0e4h,01fh,009h,0e2h,001h,062h	; 6ec2  ...&...0.......b
	defb 050h,062h,060h,062h,0f0h,062h,0e0h,063h,040h,063h,080h,063h,0e0h,064h,070h,065h	; 6ed2  Pb`b.b.c@c.c.dpe
	defb 000h,005h,000h,022h,0f0h,023h,050h,023h,0a0h,024h,000h,024h,080h,025h,000h,026h	; 6ee2  ...".#P#.$.$.%.&
	defb 000h,007h,000h,008h,000h,002h,0f0h,003h,050h,003h,0a0h,004h,000h,004h,080h,0ffh	; 6ef2  ........P.......

; ----------------------------------------------------------------------
; DATOS partitura_6F02: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x0A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (61 bytes)
;   0x6f02..0x6f3f  (61 bytes)
DATA_partitura_6F02:
	defb 0feh,002h,0f8h,028h,0e2h,001h,0c2h,020h,0f8h,00ch,0c2h,050h,0c2h,060h,0c2h,0f0h	; 6f02  ...(... ...P.`..
	defb 0c2h,0e0h,0c3h,040h,0c3h,080h,0c3h,0e0h,0c4h,070h,0c5h,000h,005h,000h,032h,0f0h	; 6f12  ...@.....p....2.
	defb 033h,050h,033h,0a0h,034h,000h,034h,080h,035h,000h,036h,000h,007h,000h,008h,000h	; 6f22  3P3.4.4.5.6.....
	defb 002h,0f0h,003h,050h,003h,0a0h,004h,000h,004h,080h,005h,000h,0ffh	; 6f32  ...P.........

; ----------------------------------------------------------------------
; DATOS partitura_6F3F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x0B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (63 bytes)
;   0x6f3f..0x6f7e  (63 bytes)
DATA_partitura_6F3F:
	defb 0feh,002h,0e0h,002h,0e2h,001h,051h,000h,051h,020h,051h,040h,051h,060h,051h,080h	; 6f3f  ......Q.Q Q@Q`Q.
	defb 031h,000h,030h,0f0h,040h,0e0h,040h,0d0h,050h,0c0h,050h,0b0h,050h,0a8h,050h,0a0h	; 6f4f  1.0.@.@.P.P.P.P.
	defb 050h,098h,050h,090h,021h,000h,021h,020h,021h,040h,021h,060h,021h,080h,021h,000h	; 6f5f  P.P.!.! !@!`!.!.
	defb 020h,0f0h,020h,0e0h,020h,0d0h,020h,0c0h,020h,0b0h,020h,0a8h,020h,0a0h,0ffh	; 6f6f   . . . . . . ..

; ----------------------------------------------------------------------
; DATOS partitura_6F7E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x0B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (67 bytes)
;   0x6f7e..0x6fc1  (67 bytes)
DATA_partitura_6F7E:
	defb 0feh,002h,0f8h,005h,0e2h,001h,0a1h,000h,0a1h,020h,0a1h,040h,0a1h,060h,0a1h,080h	; 6f7e  ......... .@.`..
	defb 081h,000h,090h,0f0h,0a0h,0e0h,0b0h,0d0h,0b0h,0c0h,0b0h,0b0h,0b0h,0a8h,0b0h,0a0h	; 6f8e  ................
	defb 0b0h,098h,0b0h,090h,001h,000h,001h,020h,001h,040h,001h,060h,001h,080h,001h,000h	; 6f9e  ....... .@.`....
	defb 000h,0f0h,000h,0e0h,000h,0d0h,000h,0c0h,000h,0b0h,000h,0a8h,000h,0a0h,000h,098h	; 6fae  ................
	defb 000h,090h,0ffh	; 6fbe

; ----------------------------------------------------------------------
; DATOS partitura_6FC1: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x0C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (32 bytes)
;   0x6fc1..0x6fe1  (32 bytes)
DATA_partitura_6FC1:
	defb 0feh,002h,0e2h,001h,0e5h,009h,000h,010h,092h,080h,0e8h,0e3h,001h,0e4h,003h,060h	; 6fc1  ...............`
	defb 00ah,0e0h,006h,0e3h,001h,0e4h,002h,030h,009h,0e0h,006h,0e3h,001h,000h,009h,0ffh	; 6fd1  .......0........

; ----------------------------------------------------------------------
; DATOS partitura_6FE1: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x0C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (23 bytes)
;   0x6fe1..0x6ff8  (23 bytes)
DATA_partitura_6FE1:
	defb 0feh,002h,0f8h,005h,0e2h,001h,000h,019h,0f8h,00dh,000h,009h,0e0h,005h,0e2h,001h	; 6fe1  ................
	defb 000h,009h,0f8h,00dh,000h,009h,0ffh	; 6ff1

; ----------------------------------------------------------------------
; DATOS partitura_6FF8: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x0D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (78 bytes)
;   0x6ff8..0x7046  (78 bytes)
DATA_partitura_6FF8:
	defb 0feh,002h,0e2h,001h,0a3h,000h,0e1h,001h,0e4h,01fh,009h,0e3h,001h,0e4h,01eh,090h	; 6ff8  ................
	defb 046h,0e4h,01ah,080h,030h,0e1h,003h,0e4h,01fh,009h,0e4h,01dh,008h,0e4h,018h,007h	; 7008  F...0...........
	defb 0e1h,002h,0e4h,012h,006h,0e1h,003h,0e4h,01fh,005h,0e4h,01dh,005h,0e4h,018h,005h	; 7018  ................
	defb 0e1h,002h,0e4h,012h,005h,0e4h,01fh,003h,0e4h,01dh,003h,0e4h,018h,003h,0e4h,012h	; 7028  ................
	defb 003h,0e4h,01fh,002h,0e4h,01dh,002h,0e4h,018h,002h,0e4h,012h,002h,0ffh	; 7038  ..............

; ----------------------------------------------------------------------
; DATOS partitura_7046: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x0D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (109 bytes)
;   0x7046..0x70b3  (109 bytes)
DATA_partitura_7046:
	defb 0feh,002h,0f8h,028h,0e2h,001h,0c3h,016h,037h,000h,00ah,000h,067h,000h,0f8h,020h	; 7046  ...(....7...g..
	defb 0c2h,000h,0c3h,000h,0c3h,060h,0c3h,090h,0c4h,020h,0c4h,0a0h,0a4h,080h,0a4h,0feh	; 7056  .....`... ......
	defb 0a5h,0f0h,0a7h,052h,0a9h,040h,062h,000h,063h,000h,063h,060h,063h,090h,064h,020h	; 7066  ...R.@b.c.c`c.d
	defb 064h,0a0h,064h,080h,064h,0feh,065h,0f0h,067h,052h,069h,040h,043h,090h,044h,020h	; 7076  d.d.d.e.gRi@C.D
	defb 044h,0a0h,044h,080h,044h,0feh,045h,0f0h,047h,052h,049h,040h,023h,090h,024h,020h	; 7086  D.D.D.E.GRI@#.$
	defb 024h,0a0h,024h,080h,024h,0feh,025h,0f0h,027h,052h,029h,040h,003h,090h,004h,020h	; 7096  $.$.$.%.'R)@...
	defb 004h,0a0h,004h,080h,004h,0feh,005h,0f0h,007h,052h,009h,040h,0ffh	; 70a6  .........R.@.

; ----------------------------------------------------------------------
; DATOS partitura_70B3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x0E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (84 bytes)
;   0x70b3..0x7107  (84 bytes)
DATA_partitura_70B3:
	defb 0feh,002h,0e1h,001h,0e4h,000h,004h,0e4h,003h,005h,0e4h,010h,006h,0e4h,009h,007h	; 70b3  ................
	defb 0e4h,008h,008h,0e4h,007h,009h,0e4h,006h,006h,0e4h,005h,006h,0e4h,004h,006h,0e4h	; 70c3  ................
	defb 003h,006h,0e4h,002h,006h,0e4h,001h,006h,0e1h,003h,0e4h,000h,006h,0e1h,001h,0e4h	; 70d3  ................
	defb 000h,001h,0e4h,003h,001h,0e4h,010h,001h,0e4h,009h,001h,0e4h,008h,001h,0e4h,007h	; 70e3  ................
	defb 001h,0e4h,006h,001h,0e4h,005h,001h,0e4h,004h,001h,0e4h,003h,001h,0e4h,002h,001h	; 70f3  ................
	defb 0e4h,001h,001h,0ffh	; 7103

; ----------------------------------------------------------------------
; DATOS partitura_7107: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x0E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (61 bytes)
;   0x7107..0x7144  (61 bytes)
DATA_partitura_7107:
	defb 0feh,002h,0f8h,005h,0e2h,001h,051h,020h,061h,080h,072h,000h,082h,080h,093h,000h	; 7107  ......Q a.r.....
	defb 0a3h,080h,074h,000h,074h,080h,075h,000h,075h,080h,076h,000h,076h,080h,077h,000h	; 7117  ..t.t.u.u.v.v.w.
	defb 077h,080h,078h,000h,002h,000h,002h,080h,003h,000h,003h,080h,004h,000h,004h,080h	; 7127  w.x.............
	defb 005h,000h,005h,080h,006h,000h,006h,080h,007h,000h,007h,080h,0ffh	; 7137  .............

; ----------------------------------------------------------------------
; DATOS partitura_7144: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x0F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (119 bytes)
;   0x7144..0x71bb  (119 bytes)
DATA_partitura_7144:
	defb 0feh,002h,0e0h,003h,0e2h,001h,0b3h,080h,0b4h,000h,0a5h,000h,083h,080h,075h,000h	; 7144  ..............u.
	defb 0a1h,080h,0a2h,040h,0a3h,000h,0a4h,0e0h,0a5h,0c0h,0a8h,000h,0a1h,080h,0a2h,040h	; 7154  ...@...........@
	defb 0a3h,000h,0a4h,0e0h,0a5h,0c0h,0a8h,000h,092h,080h,093h,040h,094h,000h,095h,0e0h	; 7164  ...........@....
	defb 096h,0c0h,099h,000h,062h,080h,063h,040h,064h,000h,065h,0e0h,066h,0c0h,069h,000h	; 7174  ....b.c@d.e.f.i.
	defb 053h,080h,054h,040h,055h,000h,056h,0e0h,057h,0c0h,05ah,000h,043h,080h,044h,040h	; 7184  S.T@U.V.W.Z.C.D@
	defb 045h,000h,046h,0e0h,037h,0c0h,03ah,000h,034h,080h,035h,040h,036h,000h,037h,0e0h	; 7194  E.F.7.:.4.5@6.7.
	defb 038h,0c0h,03bh,000h,024h,080h,025h,040h,026h,000h,027h,0e0h,018h,0c0h,01bh,000h	; 71a4  8...$.%@&.'.....
	defb 015h,080h,016h,040h,017h,000h,0ffh	; 71b4

; ----------------------------------------------------------------------
; DATOS partitura_71BB: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x0F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (129 bytes)
;   0x71bb..0x723c  (129 bytes)
DATA_partitura_71BB:
	defb 0feh,002h,0f8h,028h,0e2h,001h,0c2h,080h,0c4h,000h,0b5h,000h,043h,080h,075h,000h	; 71bb  ...(........C.u.
	defb 0f8h,027h,0c1h,080h,0c2h,040h,0c3h,000h,0c4h,0e0h,0c5h,0c0h,0c8h,000h,0f8h,017h	; 71cb  .'...@..........
	defb 0c1h,080h,0c2h,040h,0c3h,000h,0c4h,0e0h,0c5h,0c0h,0c8h,000h,092h,080h,093h,040h	; 71db  ...@...........@
	defb 094h,000h,095h,0e0h,096h,0c0h,099h,000h,072h,080h,073h,040h,074h,000h,075h,0e0h	; 71eb  ........r.s@t.u.
	defb 076h,0c0h,079h,000h,043h,080h,044h,040h,045h,000h,046h,0e0h,047h,0c0h,04ah,000h	; 71fb  v.y.C.D@E.F.G.J.
	defb 023h,080h,024h,040h,025h,000h,026h,0e0h,027h,0c0h,02ah,000h,024h,080h,025h,040h	; 720b  #.$@%.&.'.*.$.%@
	defb 026h,000h,027h,0e0h,028h,0c0h,02bh,000h,004h,080h,005h,040h,006h,000h,007h,0e0h	; 721b  &.'.(.+....@....
	defb 008h,0c0h,00bh,000h,005h,080h,006h,040h,007h,000h,008h,0e0h,009h,0c0h,00ch,000h	; 722b  .......@........
	defb 0ffh	; 723b

; ----------------------------------------------------------------------
; DATOS partitura_723C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x10 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (93 bytes)
;   0x723c..0x7299  (93 bytes)
DATA_partitura_723C:
	defb 0feh,002h,0e3h,001h,0e4h,008h,090h,020h,0e4h,00ch,090h,01ch,0e4h,010h,090h,018h	; 723c  ....... ........
	defb 0e4h,013h,090h,016h,0e4h,016h,080h,012h,0e4h,018h,080h,010h,0e4h,01fh,081h,00ah	; 724c  ................
	defb 001h,00ah,0e4h,008h,040h,020h,0e4h,00ch,040h,01ch,0e4h,010h,040h,018h,0e4h,013h	; 725c  ....@ ..@...@...
	defb 040h,016h,0e4h,016h,040h,012h,0e4h,018h,040h,010h,0e4h,01fh,041h,00ah,00ah,00ah	; 726c  @...@...@...A...
	defb 0e4h,008h,020h,020h,0e4h,00ch,020h,01ch,0e4h,010h,020h,018h,0e4h,013h,010h,016h	; 727c  ..  .. ... .....
	defb 0e4h,016h,010h,012h,0e4h,018h,000h,010h,0e4h,01fh,001h,00ah,0ffh	; 728c  .............

; ----------------------------------------------------------------------
; DATOS partitura_7299: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x10 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (53 bytes)
;   0x7299..0x72ce  (53 bytes)
DATA_partitura_7299:
	defb 0feh,002h,0f8h,025h,0e2h,001h,0b1h,000h,0a2h,000h,0a3h,000h,0a8h,080h,0a6h,070h	; 7299  ...%...........p
	defb 0a3h,040h,0a2h,080h,002h,080h,031h,000h,032h,000h,033h,000h,038h,080h,036h,070h	; 72a9  .@....1.2.3.8.6p
	defb 033h,040h,032h,080h,002h,080h,001h,000h,002h,000h,003h,000h,008h,080h,006h,070h	; 72b9  3@2............p
	defb 003h,040h,002h,080h,0ffh	; 72c9

; ----------------------------------------------------------------------
; DATOS partitura_72CE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x11 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (39 bytes)
;   0x72ce..0x72f5  (39 bytes)
DATA_partitura_72CE:
	defb 0feh,002h,0e0h,001h,0e2h,001h,021h,000h,020h,0c0h,020h,0a0h,020h,080h,020h,060h	; 72ce  ......!. . . . `
	defb 020h,040h,020h,038h,020h,030h,000h,007h,000h,006h,001h,000h,000h,0c0h,000h,0a0h	; 72de   @ 8 0..........
	defb 000h,080h,000h,060h,000h,040h,0ffh	; 72ee

; ----------------------------------------------------------------------
; DATOS partitura_72F5: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x11 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (43 bytes)
;   0x72f5..0x7320  (43 bytes)
DATA_partitura_72F5:
	defb 0feh,002h,0f8h,005h,0e2h,001h,081h,000h,080h,0c0h,080h,0a0h,080h,080h,080h,060h	; 72f5  ...............`
	defb 080h,040h,080h,038h,080h,030h,000h,007h,000h,006h,001h,000h,000h,0c0h,000h,0a0h	; 7305  .@.8.0..........
	defb 000h,080h,000h,060h,000h,040h,000h,038h,000h,030h,0ffh	; 7315  ...`.@.8.0.

; ----------------------------------------------------------------------
; DATOS partitura_7320: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x12 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (34 bytes)
;   0x7320..0x7342  (34 bytes)
DATA_partitura_7320:
	defb 0feh,002h,0e1h,001h,0e4h,01fh,009h,0e4h,006h,009h,0e4h,01ah,009h,0e0h,003h,0e2h	; 7320  ................
	defb 001h,041h,0fdh,040h,0fdh,040h,0edh,0e0h,003h,0e2h,001h,021h,0fdh,020h,0fdh,020h	; 7330  .A.@.@.....!. .
	defb 0edh,0ffh	; 7340

; ----------------------------------------------------------------------
; DATOS partitura_7342: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x12 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (33 bytes)
;   0x7342..0x7363  (33 bytes)
DATA_partitura_7342:
	defb 0feh,002h,0f8h,002h,0e2h,001h,0a1h,0fdh,0a0h,0fdh,0a0h,0edh,0e0h,003h,0e2h,001h	; 7342  ................
	defb 021h,0fdh,020h,0fdh,020h,0edh,0e0h,003h,0e2h,001h,001h,0fdh,000h,0fdh,000h,0edh	; 7352  !. . ...........
	defb 0ffh	; 7362

; ----------------------------------------------------------------------
; DATOS partitura_7363: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x13 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (80 bytes)
;   0x7363..0x73b3  (80 bytes)
DATA_partitura_7363:
	defb 0feh,002h,0e2h,001h,0b2h,000h,0a3h,050h,095h,000h,0e1h,001h,0e4h,01fh,00bh,0e4h	; 7363  .......P........
	defb 01eh,00ah,0e4h,01dh,009h,0e4h,01ch,009h,0e4h,01bh,009h,0e4h,01ah,009h,0e4h,019h	; 7373  ................
	defb 009h,0e4h,018h,009h,0e4h,017h,009h,000h,0e4h,014h,005h,0e4h,010h,005h,0e4h,00ah	; 7383  ................
	defb 005h,0e4h,006h,005h,0e4h,004h,005h,0e4h,002h,005h,0e4h,019h,003h,0e4h,018h,003h	; 7393  ................
	defb 0e4h,017h,003h,0e4h,014h,003h,0e4h,010h,003h,0eah,00ah,003h,0e4h,006h,003h,0ffh	; 73a3  ................

; ----------------------------------------------------------------------
; DATOS partitura_73B3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x13 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (61 bytes)
;   0x73b3..0x73f0  (61 bytes)
DATA_partitura_73B3:
	defb 0feh,002h,0f8h,028h,0e2h,001h,0c2h,000h,0f8h,009h,0c1h,050h,0c2h,060h,0c2h,0f0h	; 73b3  ...(.......P.`..
	defb 0c2h,0e0h,0c3h,040h,0c3h,080h,0c3h,0e0h,0c4h,070h,0c5h,000h,000h,000h,032h,0f0h	; 73c3  ...@.....p....2.
	defb 033h,050h,033h,0a0h,034h,000h,034h,080h,035h,000h,036h,000h,000h,000h,000h,000h	; 73d3  3P3.4.4.5.6.....
	defb 002h,0f0h,003h,050h,003h,0a0h,004h,000h,004h,080h,005h,000h,0ffh	; 73e3  ...P.........

; ----------------------------------------------------------------------
; DATOS partitura_73F0: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x14 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (60 bytes)
;   0x73f0..0x742c  (60 bytes)
DATA_partitura_73F0:
	defb 0f9h,06eh,074h,084h,0e0h,085h,0e0h,086h,0e0h,087h,0e0h,084h,0e0h,086h,0e0h,08ah	; 73f0  .nt.............
	defb 0e0h,087h,0e0h,08ch,0e0h,08dh,0e0h,08eh,0e0h,075h,0e0h,076h,0e0h,077h,0e0h,078h	; 7400  .........u.v.w.x
	defb 0e0h,068h,0e0h,06ah,0e0h,069h,0e0h,065h,0e0h,056h,0e0h,057h,0e0h,058h,0e0h,059h	; 7410  .h.j.i.e.V.W.X.Y
	defb 0e0h,04ah,0e0h,04bh,0e0h,046h,0e0h,036h,0e0h,037h,0e0h,0ffh	; 7420  .J.K.F.6.7..

; ----------------------------------------------------------------------
; DATOS partitura_742C: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x14, 0x67 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (287 bytes)
;   0x742c..0x754b  (287 bytes)
DATA_partitura_742C:
	defb 0f9h,0e0h,074h,064h,0e0h,065h,0e0h,066h,0e0h,067h,0e0h,064h,0e0h,066h,0e0h,06ah	; 742c  ..td.e.f.g.d.f.j
	defb 0e0h,067h,0e0h,08ch,0e0h,06dh,0e0h,06eh,0e0h,045h,0e0h,046h,0e0h,047h,0e0h,048h	; 743c  .g...m.n.E.F.G.H
	defb 0e0h,048h,0e0h,03ah,0e0h,049h,0e0h,035h,0e0h,026h,0e0h,027h,0e0h,028h,0e0h,029h	; 744c  .H.:.I.5.&.'.(.)
	defb 0e0h,02ah,0e0h,02bh,0e0h,006h,0e0h,006h,0e0h,007h,0e0h,008h,0e0h,009h,0e0h,00ah	; 745c  .*.+............
	defb 0e0h,0ffh,0feh,002h,0e1h,001h,0e4h,01fh,00ah,00ah,0e4h,018h,009h,0e2h,001h,0c2h	; 746c  ................
	defb 050h,0cah,000h,0c8h,000h,074h,000h,020h,050h,0b6h,000h,0b2h,000h,0b3h,000h,0b4h	; 747c  P....t. P.......
	defb 000h,0b5h,000h,0b6h,000h,0c4h,0f0h,0c1h,0f0h,0c5h,0f0h,0c3h,0f0h,0c8h,0f0h,0c3h	; 748c  ................
	defb 0f0h,0c5h,0f0h,0c7h,0f0h,0c5h,0f0h,0c6h,0f0h,0c7h,0f0h,0cah,0f0h,0c8h,0f0h,0c9h	; 749c  ................
	defb 0f0h,0ceh,0f0h,0b2h,0d0h,0bfh,0d0h,0b3h,0d0h,0b4h,0a0h,0b4h,0d0h,0b7h,0d0h,0b8h	; 74ac  ................
	defb 0d0h,0b9h,0d0h,0bah,0d0h,0bbh,0d0h,0bch,0d0h,0bdh,0d0h,093h,0e0h,094h,0e0h,095h	; 74bc  ................
	defb 0e0h,096h,0e0h,093h,0e0h,098h,0e0h,099h,0e0h,097h,0e0h,095h,0e0h,09ch,0e0h,09dh	; 74cc  ................
	defb 0b0h,09fh,0e0h,0fah,0feh,002h,0f8h,028h,0e2h,001h,0c2h,050h,0cah,000h,0c8h,000h	; 74dc  .......(...P....
	defb 074h,000h,010h,050h,0b6h,000h,0b2h,000h,0b3h,000h,0b4h,000h,0b5h,000h,0b6h,000h	; 74ec  t..P............
	defb 0c4h,0f0h,0c1h,0f0h,0c5h,0f0h,0c3h,0f0h,0c8h,0f0h,0c3h,0f0h,0c5h,0f0h,0c7h,0f0h	; 74fc  ................
	defb 0c5h,0f0h,0c6h,0f0h,0c7h,0f0h,0cah,0f0h,0c8h,0f0h,0c9h,0f0h,0ceh,0f0h,0a2h,0d0h	; 750c  ................
	defb 0afh,0d0h,0a3h,0d0h,0a4h,0d0h,0a4h,0d0h,0a7h,0d0h,0a8h,0d0h,0a9h,0d0h,0aah,0d0h	; 751c  ................
	defb 0abh,0d0h,0ach,0d0h,0adh,0d0h,083h,0e0h,084h,0e0h,085h,0e0h,086h,0e0h,083h,0e0h	; 752c  ................
	defb 088h,0e0h,089h,0e0h,087h,0e0h,085h,0e0h,08ch,0e0h,08dh,0b0h,08fh,0e0h,0fah	; 753c  ...............

; ----------------------------------------------------------------------
; DATOS partitura_754B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x15 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (170 bytes)
;   0x754b..0x75f5  (170 bytes)
DATA_partitura_754B:
	defb 0feh,002h,0e1h,001h,0e4h,01fh,009h,007h,0e4h,018h,006h,0e2h,001h,092h,050h,09ah	; 754b  ..............P.
	defb 000h,098h,000h,074h,000h,000h,070h,0a6h,000h,072h,000h,073h,000h,074h,000h,075h	; 755b  ...t..p..r.s.t.u
	defb 000h,076h,000h,084h,0f0h,081h,0f0h,085h,0f0h,083h,0f0h,088h,0f0h,083h,0f0h,085h	; 756b  .v..............
	defb 0f0h,087h,0f0h,085h,0f0h,086h,0f0h,087h,0f0h,08ah,0f0h,088h,0f0h,089h,0f0h,08eh	; 757b  ................
	defb 0f0h,072h,0d0h,07fh,0d0h,073h,0d0h,074h,0a0h,074h,0d0h,077h,0d0h,078h,0d0h,079h	; 758b  .r...s.t.t.w.x.y
	defb 0d0h,07ah,0d0h,07bh,0d0h,07ch,0d0h,07dh,0d0h,063h,0e0h,064h,0e0h,065h,0e0h,066h	; 759b  .z.{.|.}.c.d.e.f
	defb 0e0h,063h,0e0h,068h,0e0h,069h,0e0h,067h,0e0h,065h,0e0h,06ch,0e0h,06dh,0b0h,06fh	; 75ab  .c.h.i.g.e.l.m.o
	defb 0e0h,054h,0e0h,055h,0e0h,056h,0e0h,057h,0e0h,054h,0e0h,056h,0e0h,05ah,0e0h,057h	; 75bb  .T.U.V.W.T.V.Z.W
	defb 0e0h,05ch,0e0h,05dh,0e0h,05eh,0e0h,045h,0e0h,046h,0e0h,047h,0e0h,048h,0e0h,048h	; 75cb  .\.].^.E.F.G.H.H
	defb 0e0h,04ah,0e0h,049h,0e0h,045h,0e0h,036h,0e0h,037h,0e0h,038h,0e0h,029h,0e0h,02ah	; 75db  .J.I.E.6.7.8.).*
	defb 0e0h,02bh,0e0h,026h,0e0h,016h,0e0h,017h,0e0h,0ffh	; 75eb  .+.&......

; ----------------------------------------------------------------------
; DATOS partitura_75F5: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x15 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (169 bytes)
;   0x75f5..0x769e  (169 bytes)
DATA_partitura_75F5:
	defb 0feh,002h,0f8h,028h,0e2h,001h,062h,050h,06ah,000h,068h,000h,034h,000h,010h,050h	; 75f5  ...(..bPj.h.4..P
	defb 056h,000h,052h,000h,053h,000h,054h,000h,055h,000h,056h,000h,064h,0f0h,061h,0f0h	; 7605  V.R.S.T.U.V.d.a.
	defb 065h,0f0h,063h,0f0h,068h,0f0h,063h,0f0h,065h,0f0h,067h,0f0h,065h,0f0h,066h,0f0h	; 7615  e.c.h.c.e.g.e.f.
	defb 067h,0f0h,06ah,0f0h,068h,0f0h,069h,0f0h,06eh,0f0h,055h,0d0h,05fh,0d0h,053h,0d0h	; 7625  g.j.h.i.n.U._.S.
	defb 054h,0d0h,054h,0d0h,057h,0d0h,058h,0d0h,059h,0d0h,05ah,0d0h,05bh,0d0h,05ch,0d0h	; 7635  T.T.W.X.Y.Z.[.\.
	defb 05dh,0d0h,043h,0e0h,044h,0e0h,045h,0e0h,046h,0e0h,043h,0e0h,048h,0e0h,049h,0e0h	; 7645  ].C.D.E.F.C.H.I.
	defb 047h,0e0h,045h,0e0h,04ch,0e0h,04dh,0b0h,04fh,0e0h,034h,0e0h,035h,0e0h,036h,0e0h	; 7655  G.E.L.M.O.4.5.6.
	defb 037h,0e0h,034h,0e0h,036h,0e0h,03ah,0e0h,037h,0e0h,03ch,0e0h,03dh,0e0h,03eh,0e0h	; 7665  7.4.6.:.7.<.=.>.
	defb 025h,0e0h,026h,0e0h,027h,0e0h,028h,0e0h,028h,0e0h,02ah,0e0h,029h,0e0h,025h,0e0h	; 7675  %.&.'.(.(.*.).%.
	defb 016h,0e0h,017h,0e0h,018h,0e0h,019h,0e0h,01ah,0e0h,01bh,0e0h,016h,0e0h,016h,0e0h	; 7685  ................
	defb 007h,0e0h,008h,0e0h,009h,0e0h,00ah,0e0h,0ffh	; 7695  .........

; ----------------------------------------------------------------------
; DATOS partitura_769E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x16 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (4 bytes)
;   0x769e..0x76a2  (4 bytes)
DATA_partitura_769E:
	defb 0f9h,0a6h,076h,0ffh	; 769e

; ----------------------------------------------------------------------
; DATOS partitura_76A2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x16 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (118 bytes)
;   0x76a2..0x7718  (118 bytes)
DATA_partitura_76A2:
	defb 0f9h,0deh,076h,0ffh,0feh,002h,0e0h,003h,0e2h,001h,0f5h,021h,055h,021h,04fh,0fbh	; 76a2  ..v........!U!O.
	defb 006h,0f5h,021h,055h,021h,04fh,0fbh,006h,0f5h,021h,055h,021h,04fh,0fbh,008h,0f5h	; 76b2  ..!U!O...!U!O...
	defb 011h,055h,011h,04fh,0fbh,003h,0f5h,011h,055h,011h,04fh,0fbh,003h,0f5h,011h,055h	; 76c2  .U.O....U.O....U
	defb 011h,04fh,0fbh,003h,0f5h,001h,055h,001h,04fh,0fbh,002h,0fah,0feh,002h,0f8h,005h	; 76d2  .O....U.O.......
	defb 0e2h,001h,0f5h,061h,053h,061h,042h,0fbh,006h,0f5h,071h,053h,071h,042h,0fbh,006h	; 76e2  ...aSaB...qSqB..
	defb 0f5h,081h,053h,081h,042h,0fbh,008h,0f5h,061h,053h,061h,042h,0fbh,003h,0f5h,041h	; 76f2  ..S.B...aSaB...A
	defb 053h,041h,042h,0fbh,003h,0f5h,011h,053h,011h,042h,0fbh,003h,0f5h,001h,053h,001h	; 7702  SAB....S.B....S.
	defb 042h,0fbh,003h,001h,042h,0fah	; 7712

; ----------------------------------------------------------------------
; DATOS partitura_7718: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x17 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (59 bytes)
;   0x7718..0x7753  (59 bytes)
DATA_partitura_7718:
	defb 0feh,002h,0e3h,001h,0e4h,008h,0a0h,013h,0e4h,018h,090h,012h,0e4h,000h,0a0h,011h	; 7718  ................
	defb 0e4h,003h,090h,011h,0b0h,022h,0e4h,002h,030h,010h,0e4h,008h,030h,013h,0e4h,018h	; 7728  ....."..0...0...
	defb 020h,012h,0e4h,000h,040h,011h,0e4h,003h,040h,011h,0e0h,004h,0e2h,004h,050h,020h	; 7738   ...@...@.....P
	defb 000h,000h,030h,020h,000h,000h,0e2h,006h,010h,020h,0ffh	; 7748  ..0 ..... .

; ----------------------------------------------------------------------
; DATOS partitura_7753: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x17 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (43 bytes)
;   0x7753..0x777e  (43 bytes)
DATA_partitura_7753:
	defb 0feh,002h,0f8h,01ch,0e2h,001h,0b1h,000h,0a0h,0e8h,090h,0c8h,0e0h,004h,0f8h,00dh	; 7753  ................
	defb 0e2h,001h,000h,0a0h,000h,0d0h,000h,090h,0e0h,004h,0f8h,01ch,0e2h,004h,030h,050h	; 7763  ..............0P
	defb 000h,000h,010h,050h,000h,000h,0e2h,006h,000h,050h,0ffh	; 7773  ...P.....P.

; ----------------------------------------------------------------------
; DATOS partitura_777E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x18 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (31 bytes)
;   0x777e..0x779d  (31 bytes)
DATA_partitura_777E:
	defb 0feh,002h,0e2h,002h,050h,020h,070h,020h,050h,020h,040h,020h,0e2h,004h,020h,020h	; 777e  ....P p P @ ..
	defb 030h,020h,020h,020h,010h,020h,020h,020h,010h,020h,000h,020h,000h,020h,0ffh	; 778e  0   .   . . . .

; ----------------------------------------------------------------------
; DATOS partitura_779D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x18 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (33 bytes)
;   0x779d..0x77be  (33 bytes)
DATA_partitura_779D:
	defb 0feh,002h,0f8h,023h,0e2h,002h,070h,025h,090h,025h,070h,025h,050h,025h,0e2h,004h	; 779d  ...#..p%.%p%P%..
	defb 020h,025h,030h,025h,020h,025h,010h,025h,020h,025h,010h,025h,000h,025h,000h,025h	; 77ad   %0% %.% %.%.%.%
	defb 0ffh	; 77bd

; ----------------------------------------------------------------------
; DATOS partitura_77BE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x19 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (53 bytes)
;   0x77be..0x77f3  (53 bytes)
DATA_partitura_77BE:
	defb 0feh,002h,0e1h,004h,0e4h,003h,006h,0e4h,001h,006h,0e4h,002h,006h,0e4h,003h,006h	; 77be  ................
	defb 0e4h,004h,005h,0e4h,005h,005h,0e4h,006h,004h,0e4h,007h,004h,0e4h,008h,003h,0e4h	; 77ce  ................
	defb 009h,003h,0e4h,00ah,002h,0e4h,00bh,002h,0e4h,00ch,001h,0e4h,00dh,001h,0e4h,00eh	; 77de  ................
	defb 001h,0e4h,00fh,001h,0ffh	; 77ee

; ----------------------------------------------------------------------
; DATOS partitura_77F3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x19 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (39 bytes)
;   0x77f3..0x781a  (39 bytes)
DATA_partitura_77F3:
	defb 0feh,002h,0f8h,00ch,0e2h,004h,0c2h,060h,0c2h,080h,0c2h,0a0h,0c2h,0c0h,0b2h,0e0h	; 77f3  .......`........
	defb 0a3h,000h,093h,020h,083h,040h,073h,060h,063h,080h,053h,0a0h,043h,0c0h,033h,0e0h	; 7803  ... .@s`c.S.C.3.
	defb 024h,000h,014h,040h,004h,080h,0ffh	; 7813

; ----------------------------------------------------------------------
; DATOS partitura_781A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x1A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (78 bytes)
;   0x781a..0x7868  (78 bytes)
DATA_partitura_781A:
	defb 0feh,002h,0e2h,001h,093h,000h,0e1h,001h,0e4h,01fh,008h,0e3h,001h,0e4h,01eh,080h	; 781a  ................
	defb 046h,0e4h,01ah,070h,030h,0e1h,003h,0e4h,01fh,008h,0e4h,01dh,007h,0e4h,018h,006h	; 782a  F..p0...........
	defb 0e1h,002h,0e4h,012h,005h,0e1h,003h,0e4h,01fh,004h,0e4h,01dh,004h,0e4h,018h,004h	; 783a  ................
	defb 0e1h,002h,0e4h,012h,005h,0e4h,01fh,002h,0e4h,01dh,002h,0e4h,018h,002h,0e4h,012h	; 784a  ................
	defb 002h,0e4h,01fh,001h,0e4h,01dh,001h,0e4h,018h,001h,0e4h,012h,001h,0ffh	; 785a  ..............

; ----------------------------------------------------------------------
; DATOS partitura_7868: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x1A (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (107 bytes)
;   0x7868..0x78d3  (107 bytes)
DATA_partitura_7868:
	defb 0feh,002h,0f8h,026h,0e2h,001h,0c2h,086h,037h,000h,00ah,000h,067h,000h,0c2h,000h	; 7868  ...&....7...g...
	defb 0b3h,000h,0b3h,060h,0b3h,090h,0b4h,020h,0b4h,0a0h,094h,080h,094h,0feh,095h,0f0h	; 7878  ...`... ........
	defb 097h,052h,099h,040h,062h,000h,063h,000h,063h,060h,063h,090h,064h,020h,064h,0a0h	; 7888  .R.@b.c.c`c.d d.
	defb 064h,080h,064h,0feh,065h,0f0h,067h,052h,069h,040h,043h,090h,044h,020h,044h,0a0h	; 7898  d.d.e.gRi@C.D D.
	defb 044h,080h,044h,0feh,045h,0f0h,047h,052h,049h,040h,023h,090h,024h,020h,024h,0a0h	; 78a8  D.D.E.GRI@#.$ $.
	defb 024h,080h,024h,0feh,025h,0f0h,027h,052h,029h,040h,003h,090h,004h,020h,004h,0a0h	; 78b8  $.$.%.'R)@... ..
	defb 004h,080h,004h,0feh,005h,0f0h,007h,052h,009h,040h,0ffh	; 78c8  .......R.@.

; ----------------------------------------------------------------------
; DATOS partitura_78D3: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x1B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (27 bytes)
;   0x78d3..0x78ee  (27 bytes)
DATA_partitura_78D3:
	defb 0feh,002h,0e0h,002h,0e2h,004h,040h,039h,000h,008h,020h,039h,000h,008h,020h,039h	; 78d3  ......@9.. 9.. 9
	defb 000h,008h,020h,039h,000h,008h,0e2h,002h,000h,039h,0ffh	; 78e3  .. 9.....9.

; ----------------------------------------------------------------------
; DATOS partitura_78EE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x1B (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0x78ee..0x7907  (25 bytes)
DATA_partitura_78EE:
	defb 0feh,002h,0f8h,01ch,0e2h,004h,070h,038h,000h,008h,040h,038h,000h,008h,040h,038h	; 78ee  ......p8..@8..@8
	defb 000h,008h,040h,038h,000h,008h,000h,038h,0ffh	; 78fe  ..@8...8.

; ----------------------------------------------------------------------
; DATOS partitura_7907: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x1C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (63 bytes)
;   0x7907..0x7946  (63 bytes)
DATA_partitura_7907:
	defb 0feh,002h,0e0h,002h,0e2h,001h,041h,00eh,040h,0d0h,040h,0f2h,041h,00eh,040h,0d0h	; 7907  ......A.@.@.A.@.
	defb 040h,0f2h,031h,00eh,030h,0d0h,030h,0f2h,031h,00eh,030h,0d0h,030h,0f2h,021h,00eh	; 7917  @.1.0.0.1.0.0.!.
	defb 020h,0d0h,020h,0f2h,021h,00eh,020h,0d0h,020h,0f2h,0f5h,011h,00eh,010h,0d0h,010h	; 7927   . .!. . .......
	defb 0f2h,0fbh,003h,0f5h,001h,00eh,000h,0d0h,000h,0f2h,0fbh,002h,001h,00eh,0ffh	; 7937  ...............

; ----------------------------------------------------------------------
; DATOS partitura_7946: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x1C (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (61 bytes)
;   0x7946..0x7983  (61 bytes)
DATA_partitura_7946:
	defb 0feh,002h,0f8h,058h,0e2h,001h,071h,00eh,070h,0d0h,070h,0f2h,071h,00eh,070h,0d0h	; 7946  ...X..q.p.p.q.p.
	defb 070h,0f2h,041h,00eh,040h,0d0h,040h,0f2h,041h,00eh,040h,0d0h,040h,0f2h,031h,00eh	; 7956  p.A.@.@.A.@.@.1.
	defb 030h,0d0h,030h,0f2h,031h,00eh,030h,0d0h,030h,0f2h,0f5h,011h,00eh,010h,0d0h,010h	; 7966  0.0.1.0.0.......
	defb 0f2h,0fbh,003h,0f5h,001h,00eh,000h,0d0h,000h,0f2h,0fbh,003h,0ffh	; 7976  .............

; ----------------------------------------------------------------------
; DATOS partitura_7983: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x1D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (88 bytes)
;   0x7983..0x79db  (88 bytes)
DATA_partitura_7983:
	defb 0feh,002h,0e0h,003h,0e2h,001h,090h,0a0h,091h,020h,091h,06ch,092h,015h,093h,04ch	; 7983  ......... .l...L
	defb 094h,000h,0f5h,082h,0f0h,083h,010h,0fbh,004h,080h,080h,080h,090h,080h,0a0h,080h	; 7993  ................
	defb 0b0h,080h,0c0h,080h,0d0h,080h,0e0h,080h,0f0h,081h,000h,0f5h,052h,0f0h,053h,010h	; 79a3  ............R.S.
	defb 0fbh,004h,050h,070h,050h,080h,050h,090h,050h,0a0h,050h,0b0h,050h,0c0h,050h,0d0h	; 79b3  ..PpP.P.P.P.P.P.
	defb 050h,0e0h,050h,0f0h,0f5h,022h,0f0h,023h,010h,0fbh,004h,020h,060h,020h,070h,020h	; 79c3  P.P..".#... ` p
	defb 080h,020h,090h,020h,0a0h,020h,0b0h,0ffh	; 79d3  . . . ..

; ----------------------------------------------------------------------
; DATOS partitura_79DB: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x1D (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (106 bytes)
;   0x79db..0x7a45  (106 bytes)
DATA_partitura_79DB:
	defb 0feh,002h,0f8h,00bh,0e2h,001h,0c0h,0a0h,0c1h,020h,0c1h,06ch,0c2h,015h,0c3h,04ch	; 79db  ......... .l...L
	defb 0c4h,000h,0f8h,02ah,0f5h,0a2h,0f0h,0a3h,010h,0fbh,004h,0f8h,002h,0a0h,080h,0a0h	; 79eb  ...*............
	defb 090h,0a0h,0a0h,0a0h,0b0h,0a0h,0c0h,0a0h,0d0h,0a0h,0e0h,0a0h,0f0h,0a1h,000h,0f8h	; 79fb  ................
	defb 02ah,0f5h,042h,0f0h,033h,010h,0fbh,004h,0f8h,002h,040h,070h,040h,080h,040h,090h	; 7a0b  *.B.3.....@p@.@.
	defb 040h,0a0h,040h,0b0h,040h,0c0h,040h,0d0h,040h,0e0h,040h,0f0h,0f8h,02ah,0f5h,012h	; 7a1b  @.@.@.@.@.@..*..
	defb 0f0h,013h,010h,0fbh,004h,0f8h,002h,010h,060h,010h,070h,010h,080h,010h,090h,010h	; 7a2b  ........`.p.....
	defb 0a0h,010h,0b0h,010h,0c0h,010h,0d0h,010h,0e0h,0ffh	; 7a3b  ..........

; ----------------------------------------------------------------------
; DATOS partitura_7A45: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x1E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (37 bytes)
;   0x7a45..0x7a6a  (37 bytes)
DATA_partitura_7A45:
	defb 0feh,002h,0e1h,001h,0e4h,00fh,003h,0e4h,000h,004h,0e4h,003h,005h,0e4h,006h,006h	; 7a45  ................
	defb 0e4h,00fh,007h,0e1h,003h,0e4h,00dh,006h,0e4h,003h,005h,0e4h,006h,004h,0e4h,00ah	; 7a55  ................
	defb 003h,0e4h,00eh,002h,0ffh	; 7a65

; ----------------------------------------------------------------------
; DATOS partitura_7A6A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x1E (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (33 bytes)
;   0x7a6a..0x7a8b  (33 bytes)
DATA_partitura_7A6A:
	defb 0feh,002h,0f8h,009h,0e2h,001h,095h,006h,0f8h,00dh,090h,008h,0e0h,005h,0e2h,001h	; 7a6a  ................
	defb 0f8h,009h,035h,006h,0f8h,00dh,000h,008h,0e0h,005h,0f8h,009h,005h,006h,0e0h,005h	; 7a7a  ..5.............
	defb 0ffh	; 7a8a

; ----------------------------------------------------------------------
; DATOS partitura_7A8B: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x1F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (54 bytes)
;   0x7a8b..0x7ac1  (54 bytes)
DATA_partitura_7A8B:
	defb 0feh,002h,0e1h,001h,0e4h,01fh,003h,0e4h,010h,004h,0e4h,013h,005h,0e4h,016h,006h	; 7a8b  ................
	defb 0e4h,01fh,007h,0e1h,003h,0e4h,01dh,006h,0e4h,013h,005h,0e4h,016h,004h,0e4h,01ah	; 7a9b  ................
	defb 003h,0e4h,01eh,002h,0e1h,003h,0e4h,01dh,002h,0e4h,013h,002h,0e4h,016h,002h,0e4h	; 7aab  ................
	defb 01ah,002h,0e4h,01eh,001h,0ffh	; 7abb

; ----------------------------------------------------------------------
; DATOS partitura_7AC1: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x1F (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (63 bytes)
;   0x7ac1..0x7b00  (63 bytes)
DATA_partitura_7AC1:
	defb 0feh,002h,0f8h,005h,0e2h,001h,0c4h,000h,0c5h,000h,0c6h,000h,0c2h,000h,0c2h,030h	; 7ac1  ...............0
	defb 0e2h,002h,000h,008h,0e2h,001h,046h,000h,047h,000h,048h,000h,043h,000h,043h,030h	; 7ad1  ......F.G.H.C.C0
	defb 0e2h,001h,004h,000h,005h,000h,006h,000h,002h,000h,002h,030h,0e2h,002h,000h,008h	; 7ae1  ...........0....
	defb 0e2h,001h,006h,000h,007h,000h,008h,000h,003h,000h,003h,030h,004h,000h,0ffh	; 7af1  ...........0...

; ----------------------------------------------------------------------
; DATOS partitura_7B00: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x20 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (29 bytes)
;   0x7b00..0x7b1d  (29 bytes)
DATA_partitura_7B00:
	defb 0feh,002h,0e1h,001h,0e4h,01fh,006h,0e4h,01eh,007h,0e4h,01dh,008h,0e2h,004h,000h	; 7b00  ................
	defb 00ah,0e1h,001h,0e4h,01fh,001h,0e4h,01eh,001h,0e4h,01dh,001h,0ffh	; 7b10  .............

; ----------------------------------------------------------------------
; DATOS partitura_7B1D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x20 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (25 bytes)
;   0x7b1d..0x7b36  (25 bytes)
DATA_partitura_7B1D:
	defb 0feh,002h,0f8h,014h,0e2h,001h,030h,056h,050h,04fh,070h,049h,0e0h,004h,0f8h,01ah	; 7b1d  ......0VPOpI....
	defb 0e2h,001h,000h,056h,000h,04fh,000h,049h,0ffh	; 7b2d  ...V.O.I.

; ----------------------------------------------------------------------
; DATOS partitura_7B36: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x21 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (107 bytes)
;   0x7b36..0x7ba1  (107 bytes)
DATA_partitura_7B36:
	defb 0feh,002h,0e1h,001h,0e4h,01fh,00ah,005h,0e3h,001h,0e4h,01fh,090h,020h,0e4h,01eh	; 7b36  ............. ..
	defb 090h,080h,0e2h,001h,0a1h,060h,0a2h,000h,0a5h,000h,0a3h,000h,0a2h,000h,0a2h,080h	; 7b46  .....`..........
	defb 0a2h,0d0h,0a3h,030h,0a3h,080h,0a3h,0d0h,0a4h,030h,0a5h,000h,0a5h,080h,0a6h,000h	; 7b56  ...0.....0......
	defb 0a6h,080h,072h,080h,072h,0d0h,073h,030h,073h,080h,073h,0d0h,074h,030h,075h,000h	; 7b66  ..r.r.s0s.s.t0u.
	defb 075h,080h,076h,000h,076h,080h,052h,080h,052h,0d0h,053h,030h,053h,080h,053h,0d0h	; 7b76  u.v.v.R.R.S0S.S.
	defb 054h,030h,055h,000h,055h,080h,056h,000h,056h,080h,022h,080h,022h,0d0h,023h,030h	; 7b86  T0U.U.V.V.".".#0
	defb 023h,080h,023h,0d0h,024h,030h,025h,000h,025h,080h,0ffh	; 7b96  #.#.$0%.%..

; ----------------------------------------------------------------------
; DATOS partitura_7BA1: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x21 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (103 bytes)
;   0x7ba1..0x7c08  (103 bytes)
DATA_partitura_7BA1:
	defb 0feh,002h,0f8h,028h,0e2h,001h,0c2h,010h,0c3h,070h,0f8h,014h,0c1h,060h,0c2h,000h	; 7ba1  ...(.....p...`..
	defb 0c5h,000h,0c3h,000h,0c2h,000h,0c2h,080h,0c2h,0d0h,0c3h,030h,0c3h,080h,0c3h,0d0h	; 7bb1  ...........0....
	defb 0c4h,030h,0c5h,000h,0c5h,080h,0c6h,000h,0c6h,080h,082h,080h,082h,0d0h,083h,030h	; 7bc1  .0.............0
	defb 083h,080h,083h,0d0h,084h,030h,085h,000h,085h,080h,086h,000h,086h,080h,042h,080h	; 7bd1  .....0........B.
	defb 042h,0d0h,043h,030h,043h,080h,043h,0d0h,044h,030h,045h,000h,045h,080h,046h,000h	; 7be1  B.C0C.C.D0E.E.F.
	defb 046h,080h,022h,080h,022h,0d0h,023h,030h,023h,080h,023h,0d0h,024h,030h,025h,000h	; 7bf1  F.".".#0#.#.$0%.
	defb 025h,080h,026h,000h,026h,080h,0ffh	; 7c01

; ----------------------------------------------------------------------
; DATOS partitura_7C08: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x22 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (65 bytes)
;   0x7c08..0x7c49  (65 bytes)
DATA_partitura_7C08:
	defb 0feh,002h,0e0h,002h,0e2h,001h,054h,000h,052h,000h,051h,000h,050h,080h,053h,000h	; 7c08  ......T.R.Q.P.S.
	defb 052h,000h,051h,080h,051h,000h,050h,0c0h,050h,080h,050h,060h,050h,042h,050h,030h	; 7c18  R.Q.Q.P.P.P`PBP0
	defb 023h,000h,022h,000h,021h,080h,021h,000h,020h,0c0h,020h,080h,020h,060h,020h,042h	; 7c28  #.".!.!. . . ` B
	defb 020h,030h,003h,000h,002h,000h,001h,080h,001h,000h,000h,0c0h,000h,080h,000h,060h	; 7c38   0.............`
	defb 0ffh	; 7c48

; ----------------------------------------------------------------------
; DATOS partitura_7C49: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x22 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (69 bytes)
;   0x7c49..0x7c8e  (69 bytes)
DATA_partitura_7C49:
	defb 0feh,002h,0f8h,005h,0e2h,001h,094h,000h,092h,000h,091h,000h,090h,080h,093h,000h	; 7c49  ................
	defb 092h,000h,091h,080h,091h,000h,090h,0c0h,090h,080h,090h,060h,090h,042h,090h,030h	; 7c59  ...........`.B.0
	defb 023h,000h,022h,000h,021h,080h,021h,000h,020h,0c0h,020h,080h,020h,060h,020h,042h	; 7c69  #.".!.!. . . ` B
	defb 020h,030h,003h,000h,002h,000h,001h,080h,001h,000h,000h,0c0h,000h,080h,000h,060h	; 7c79   0.............`
	defb 000h,042h,000h,030h,0ffh	; 7c89

; ----------------------------------------------------------------------
; DATOS partitura_7C8E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x23 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0x7c8e..0x7c9f  (17 bytes)
DATA_partitura_7C8E:
	defb 0feh,002h,0e3h,008h,0e4h,006h,0f5h,060h,009h,0fbh,034h,0f5h,020h,009h,0fbh,006h	; 7c8e  .......`..4. ...
	defb 0ffh	; 7c9e

; ----------------------------------------------------------------------
; DATOS partitura_7C9F: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x23 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (17 bytes)
;   0x7c9f..0x7cb0  (17 bytes)
DATA_partitura_7C9F:
	defb 0feh,002h,0f8h,005h,0e2h,008h,0f5h,095h,009h,0fbh,034h,0f5h,005h,009h,0fbh,006h	; 7c9f  ..........4.....
	defb 0ffh	; 7caf

; ----------------------------------------------------------------------
; DATOS partitura_7CB0: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x24 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (58 bytes)
;   0x7cb0..0x7cea  (58 bytes)
DATA_partitura_7CB0:
	defb 0feh,002h,0e0h,003h,0e2h,001h,0f5h,030h,01ah,030h,018h,040h,014h,040h,015h,050h	; 7cb0  .......0.0.@.@.P
	defb 016h,050h,017h,050h,018h,050h,019h,050h,01ah,050h,01bh,000h,019h,0fbh,004h,000h	; 7cc0  .P.P.P.P.P......
	defb 01ah,000h,018h,000h,014h,000h,015h,000h,016h,000h,017h,000h,018h,000h,019h,000h	; 7cd0  ................
	defb 01ah,000h,01bh,000h,019h,000h,018h,000h,017h,0ffh	; 7ce0  ..........

; ----------------------------------------------------------------------
; DATOS partitura_7CEA: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x24 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (52 bytes)
;   0x7cea..0x7d1e  (52 bytes)
DATA_partitura_7CEA:
	defb 0feh,002h,0f8h,003h,0e2h,001h,0f5h,040h,02ah,050h,028h,060h,024h,070h,025h,080h	; 7cea  .......@*P(`$p%.
	defb 026h,090h,027h,090h,028h,090h,029h,090h,02ah,090h,02bh,090h,02ch,000h,02ch,000h	; 7cfa  &.'.(.).*.+.,.,.
	defb 02dh,0fbh,004h,000h,027h,000h,028h,000h,029h,000h,02ah,000h,02bh,000h,02ch,000h	; 7d0a  -...'.(.).*.+.,.
	defb 02ch,000h,02dh,0ffh	; 7d1a

; ----------------------------------------------------------------------
; DATOS partitura_7D1E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x25 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (63 bytes)
;   0x7d1e..0x7d5d  (63 bytes)
DATA_partitura_7D1E:
	defb 0feh,002h,0e3h,001h,0e4h,000h,040h,0d0h,050h,0b0h,060h,0a0h,070h,0b0h,0e0h,009h	; 7d1e  ......@.P.`.p...
	defb 0e2h,001h,041h,020h,051h,050h,061h,0c0h,000h,0d0h,000h,0b0h,0e1h,001h,0e4h,000h	; 7d2e  ..A QPa.........
	defb 006h,0e4h,004h,006h,0e4h,008h,007h,0e4h,00ch,008h,0e4h,010h,009h,0e4h,014h,008h	; 7d3e  ................
	defb 0e4h,018h,008h,0e1h,003h,0e4h,003h,007h,006h,005h,004h,003h,002h,001h,0ffh	; 7d4e  ...............

; ----------------------------------------------------------------------
; DATOS partitura_7D5D: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x25 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (73 bytes)
;   0x7d5d..0x7da6  (73 bytes)
DATA_partitura_7D5D:
	defb 0feh,002h,0f8h,005h,0e2h,001h,031h,000h,050h,0e0h,070h,0d0h,050h,0c8h,0f8h,009h	; 7d5d  ......1.P.p.P...
	defb 0e0h,008h,0e2h,001h,081h,040h,041h,040h,051h,060h,061h,080h,000h,0f0h,000h,0d0h	; 7d6d  .....@A@Q`a.....
	defb 0f8h,042h,021h,060h,031h,070h,041h,080h,041h,090h,041h,0a0h,041h,0b0h,041h,0c0h	; 7d7d  .B!`1pA.A.A.A.A.
	defb 041h,0e0h,042h,000h,032h,020h,032h,040h,022h,060h,022h,080h,022h,0a0h,012h,0c0h	; 7d8d  A.B.2 2@"`"."...
	defb 012h,0e0h,013h,000h,003h,020h,003h,040h,0ffh	; 7d9d  ..... .@.

; ----------------------------------------------------------------------
; DATOS partitura_7DA6: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x26 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (72 bytes)
;   0x7da6..0x7dee  (72 bytes)
DATA_partitura_7DA6:
	defb 0feh,002h,0e0h,001h,0e2h,001h,0f5h,011h,000h,011h,008h,011h,010h,021h,018h,021h	; 7da6  .............!.!
	defb 020h,021h,028h,021h,030h,021h,038h,021h,040h,031h,048h,031h,050h,031h,058h,021h	; 7db6   !(!0!8!@1H1P1X!
	defb 060h,021h,068h,021h,070h,021h,078h,021h,080h,001h,028h,001h,030h,001h,038h,001h	; 7dc6  `!h!p!x!..(.0.8.
	defb 040h,001h,048h,001h,050h,001h,058h,0fbh,002h,001h,060h,001h,068h,001h,070h,001h	; 7dd6  @.H.P.X...`.h.p.
	defb 078h,0e0h,020h,0fch,002h,0a6h,07dh,0ffh	; 7de6  x. ...}.

; ----------------------------------------------------------------------
; DATOS partitura_7DEE: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x26 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (74 bytes)
;   0x7dee..0x7e38  (74 bytes)
DATA_partitura_7DEE:
	defb 0feh,002h,0f8h,005h,0f5h,0e2h,001h,031h,000h,041h,008h,051h,010h,061h,018h,071h	; 7dee  .......1.A.Q.a.q
	defb 020h,081h,028h,091h,030h,0a1h,038h,0b1h,040h,0c1h,048h,0c1h,050h,0c1h,058h,0c1h	; 7dfe   .(.0.8.@.H.P.X.
	defb 060h,0c1h,068h,0b1h,070h,0a1h,078h,091h,080h,001h,028h,001h,030h,001h,038h,001h	; 7e0e  `.h.p.x...(.0.8.
	defb 040h,001h,048h,001h,050h,001h,058h,0fbh,002h,001h,060h,001h,068h,001h,070h,001h	; 7e1e  @.H.P.X...`.h.p.
	defb 078h,001h,080h,0e0h,020h,0fch,002h,0eeh,07dh,0ffh	; 7e2e  x... ...}.

; ----------------------------------------------------------------------
; DATOS partitura_7E38: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x27 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (41 bytes)
;   0x7e38..0x7e61  (41 bytes)
DATA_partitura_7E38:
	defb 0feh,002h,0e0h,002h,0e2h,004h,012h,06eh,0e2h,001h,0f5h,012h,070h,012h,06dh,012h	; 7e38  .......n....p.m.
	defb 068h,012h,064h,012h,062h,012h,060h,012h,05dh,0fbh,004h,0f5h,002h,068h,002h,064h	; 7e48  h.d.b.`.]....h.d
	defb 002h,062h,002h,060h,002h,05dh,0fbh,004h,0ffh	; 7e58  .b.`.]...

; ----------------------------------------------------------------------
; DATOS partitura_7E61: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x27 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (41 bytes)
;   0x7e61..0x7e8a  (41 bytes)
DATA_partitura_7E61:
	defb 0feh,002h,0f8h,005h,0e2h,004h,042h,06eh,0e2h,001h,0f5h,042h,070h,042h,06dh,042h	; 7e61  ......Bn...BpBmB
	defb 068h,042h,064h,042h,062h,042h,060h,042h,05dh,0fbh,004h,0f5h,002h,068h,002h,064h	; 7e71  hBdBbB`B]....h.d
	defb 002h,062h,002h,060h,002h,05dh,0fbh,003h,0ffh	; 7e81  .b.`.]...

; ----------------------------------------------------------------------
; DATOS partitura_7E8A: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x28 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (85 bytes)
;   0x7e8a..0x7edf  (85 bytes)
DATA_partitura_7E8A:
	defb 0feh,002h,0f5h,0f9h,033h,07fh,0fbh,006h,0e0h,028h,0f9h,033h,07fh,0e0h,050h,0f5h	; 7e8a  ....3....(.3..P.
	defb 0f9h,033h,07fh,0fbh,006h,0e0h,028h,0f5h,0f9h,033h,07fh,0fbh,004h,0e0h,050h,0f5h	; 7e9a  .3....(..3....P.
	defb 0f9h,033h,07fh,0fbh,007h,0e0h,028h,0f5h,0f9h,033h,07fh,0fbh,005h,0e0h,050h,0f5h	; 7eaa  .3....(..3....P.
	defb 0f9h,033h,07fh,0fbh,007h,0e0h,028h,0f5h,0f9h,033h,07fh,0fbh,003h,0e0h,050h,0f5h	; 7eba  .3....(..3....P.
	defb 0f9h,033h,07fh,0fbh,006h,0e0h,028h,0f5h,0f9h,033h,07fh,0fbh,002h,0ddh,0e0h,0c0h	; 7eca  .3....(..3......
	defb 0e0h,0c0h,0fdh,08ah,07eh	; 7eda

; ----------------------------------------------------------------------
; DATOS partitura_7EDF: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x28 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (159 bytes)
;   0x7edf..0x7f7e  (159 bytes)
DATA_partitura_7EDF:
	defb 0feh,002h,0f5h,0f9h,059h,07fh,0fbh,006h,0e0h,028h,0f9h,059h,07fh,0e0h,050h,0f5h	; 7edf  ....Y....(.Y..P.
	defb 0f9h,059h,07fh,0fbh,006h,0e0h,028h,0f5h,0f9h,059h,07fh,0fbh,004h,0e0h,050h,0f5h	; 7eef  .Y....(..Y....P.
	defb 0f9h,059h,07fh,0fbh,007h,0e0h,028h,0f5h,0f9h,059h,07fh,0fbh,005h,0e0h,050h,0f5h	; 7eff  .Y....(..Y....P.
	defb 0f9h,059h,07fh,0fbh,007h,0e0h,028h,0f5h,0f9h,059h,07fh,0fbh,003h,0e0h,050h,0f5h	; 7f0f  .Y....(..Y....P.
	defb 0f9h,059h,07fh,0fbh,006h,0e0h,028h,0f5h,0f9h,059h,07fh,0fbh,002h,0e0h,0c0h,0e0h	; 7f1f  .Y....(..Y......
	defb 0c0h,0fdh,0dfh,07eh,0feh,002h,0e2h,001h,0a2h,030h,0e1h,001h,0e4h,01fh,004h,0e2h	; 7f2f  ...~.....0......
	defb 001h,032h,050h,032h,060h,032h,0f0h,032h,0e0h,023h,040h,023h,080h,023h,0e0h,024h	; 7f3f  .2P2`2.2.#@#.#.$
	defb 070h,015h,000h,015h,000h,002h,0f0h,003h,050h,0fah,0feh,002h,0f8h,026h,0e2h,001h	; 7f4f  p.......P....&..
	defb 0c2h,050h,0f8h,00ch,0c2h,050h,0b2h,060h,0a2h,0f0h,092h,0e0h,083h,040h,073h,080h	; 7f5f  .P...P.`.....@s.
	defb 063h,0e0h,054h,070h,045h,000h,036h,000h,027h,000h,018h,000h,009h,000h,0fah	; 7f6f  c.TpE.6.'......

; ----------------------------------------------------------------------
; DATOS partitura_7F7E: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x29 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (84 bytes)
;   0x7f7e..0x7fd2  (84 bytes)
DATA_partitura_7F7E:
	defb 0feh,002h,0f5h,0f9h,026h,080h,0fbh,006h,0e0h,028h,0f9h,026h,080h,0e0h,050h,0f5h	; 7f7e  ....&....(.&..P.
	defb 0f9h,026h,080h,0fbh,006h,0e0h,028h,0f5h,0f9h,026h,080h,0fbh,004h,0e0h,050h,0f5h	; 7f8e  .&....(..&....P.
	defb 0f9h,026h,080h,0fbh,007h,0e0h,028h,0f5h,0f9h,026h,080h,0fbh,005h,0e0h,050h,0f5h	; 7f9e  .&....(..&....P.
	defb 0f9h,026h,080h,0fbh,006h,0e0h,028h,0f5h,0f9h,026h,080h,0fbh,002h,0e0h,050h,0f5h	; 7fae  .&....(..&....P.
	defb 0f9h,026h,080h,0fbh,006h,0e0h,028h,0f5h,0f9h,026h,080h,0fbh,004h,0e0h,0c0h,0e0h	; 7fbe  .&....(..&......
	defb 0c0h,0fdh,07eh,07fh	; 7fce

; ----------------------------------------------------------------------
; DATOS partitura_7FD2: partitura de canal que lee el motor de p16 al tocar
;   los sonidos 0x29 (lo mide tools/partituras.py ejecutandolo); lo leen
;   p16:4392 (46 bytes)
;   0x7fd2..0x8000  (46 bytes)
DATA_partitura_7FD2:
	defb 0feh,002h,0f5h,0f9h,047h,080h,0fbh,006h,0e0h,028h,0f9h,047h,080h,0e0h,050h,0f5h	; 7fd2  ....G....(.G..P.
	defb 0f9h,047h,080h,0fbh,006h,0e0h,028h,0f5h,0f9h,047h,080h,0fbh,004h,0e0h,050h,0f5h	; 7fe2  .G....(..G....P.
	defb 0f9h,047h,080h,0fbh,007h,0e0h,028h,0f5h,0f9h,047h,080h,0fbh,005h,0e0h	; 7ff2  .G....(..G....
