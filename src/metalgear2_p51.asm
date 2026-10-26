; ==========================================================================
; METAL GEAR 2 SOLID SNAKE - Konami (1990) - MSX2 - MegaROM RC-767 de 512 KB (Konami SCC) - banco 51 (se ejecuta en 0xa000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x0a000


; ----------------------------------------------------------------------
; DATOS mensaje_9FFC_cola: mensaje letra a letra (p01:66C4): letras hasta 0xFF
;   o 0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina (sigue del banco 50); lo leen p09:A50D (23 bytes)
;   0xa000..0xa017  (23 bytes)
DATA_mensaje_9FFC_cola:
	defb 0e5h,0f8h,025h,03eh,050h,034h,030h,03ch,0e4h,0e4h,0e4h,0feh,029h,02fh,02bh,03ah	; a000  ..%>P40<....)/+:
	defb 0e5h,01dh,018h,00bh,015h,00fh,0fbh	; a010

; ----------------------------------------------------------------------
; DATOS mensaje_A017: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (31 bytes)
;   0xa017..0xa036  (31 bytes)
DATA_mensaje_A017:
	defb 002h,07ch,0f8h,044h,0b4h,0d2h,082h,0bfh,044h,034h,026h,04ah,0e6h,01dh,018h,00bh	; a017  .|.D....D4&J....
	defb 015h,00fh,0e5h,0feh,03eh,048h,02ch,050h,034h,071h,037h,02bh,037h,0e0h,0fbh	; a027  ....>H,P4q7+7..

; ----------------------------------------------------------------------
; DATOS mensaje_A036: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (11 bytes)
;   0xa036..0xa041  (11 bytes)
DATA_mensaje_A036:
	defb 002h,076h,094h,08fh,0ebh,08bh,0d0h,071h,0e0h,0e0h,0fbh	; a036  .v.....q...

; ----------------------------------------------------------------------
; DATOS mensaje_A041: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (13 bytes)
;   0xa041..0xa04e  (13 bytes)
DATA_mensaje_A041:
	defb 003h,076h,0e4h,0e4h,0e4h,094h,0e5h,094h,08fh,0ebh,08bh,0d0h,0fbh	; a041  .v...........

; ----------------------------------------------------------------------
; DATOS mensaje_A04E: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (11 bytes)
;   0xa04e..0xa059  (11 bytes)
DATA_mensaje_A04E:
	defb 003h,07ch,0e4h,0e4h,0e4h,025h,0e5h,050h,034h,030h,0fbh	; a04e  .|...%.P40.

; ----------------------------------------------------------------------
; DATOS mensaje_A059: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (90 bytes)
;   0xa059..0xa0b3  (90 bytes)
DATA_mensaje_A059:
	defb 003h,07ch,050h,034h,030h,0e5h,048h,071h,067h,04ch,0e4h,0e4h,0e4h,0feh,0f8h,07eh	; a059  .|P40.HqgL.....~
	defb 03dh,0f8h,02eh,030h,02ah,025h,04dh,02dh,039h,02ah,071h,034h,044h,034h,026h,0e6h	; a069  =..0*%M-9*q4D4&.
	defb 0fdh,031h,065h,04dh,02eh,038h,062h,02ah,04ch,060h,0e4h,0e4h,0e4h,0feh,0a7h,0d2h	; a079  .1eM.8b*L`......
	defb 082h,080h,08bh,060h,0e5h,035h,072h,052h,038h,0a7h,0d2h,082h,080h,08bh,060h,0b4h	; a089  ...`.5rR8.....`.
	defb 0a1h,0adh,051h,0feh,040h,044h,030h,046h,037h,025h,04dh,02ch,02eh,038h,051h,030h	; a099  ..Q.@D0F7%M,.8Q0
	defb 039h,02ah,071h,034h,050h,0e4h,0e4h,0e4h,0feh,0fbh	; a0a9  9*q4P.....

; ----------------------------------------------------------------------
; DATOS mensaje_A0B3: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (94 bytes)
;   0xa0b3..0xa111  (94 bytes)
DATA_mensaje_A0B3:
	defb 003h,076h,0f8h,04ah,0f8h,036h,03dh,0f8h,07eh,03eh,038h,02dh,03eh,059h,046h,037h	; a0b3  .v.J.6=.~>8->YF7
	defb 026h,04dh,052h,05dh,0e6h,0feh,094h,08fh,0ebh,08bh,0d0h,0e1h,0feh,02eh,052h,061h	; a0c3  &MR]..........Ra
	defb 02eh,033h,0b4h,0a1h,0adh,03dh,0f8h,02eh,051h,030h,071h,02ah,04ch,038h,0e4h,0e4h	; a0d3  .3...=..Q0q*L8..
	defb 0feh,0f8h,027h,0f8h,010h,03dh,0f8h,052h,0f8h,038h,03dh,0f8h,02eh,051h,040h,044h	; a0e3  ..'..=.R.8=..Q@D
	defb 030h,046h,037h,0f8h,063h,050h,027h,0f8h,028h,05dh,0e6h,0fdh,094h,08fh,0ebh,08bh	; a0f3  0F7.cP'.(]......
	defb 0d0h,0e1h,0feh,043h,05dh,05dh,0e5h,043h,05dh,05dh,0e4h,0e4h,0e4h,0fbh	; a103  ...C]].C]]....

; ----------------------------------------------------------------------
; DATOS mensaje_A111: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (84 bytes)
;   0xa111..0xa165  (84 bytes)
DATA_mensaje_A111:
	defb 003h,07ch,047h,027h,026h,026h,03dh,04ah,0e4h,0e4h,0e4h,050h,034h,030h,0e5h,039h	; a111  .|G'&&=J...P40.9
	defb 052h,0f8h,052h,047h,03dh,0f8h,024h,051h,0f8h,018h,0feh,037h,02bh,037h,026h,04dh	; a121  R.RG=.$Q...7+7&M
	defb 050h,0e6h,0feh,0f8h,027h,0f8h,010h,053h,061h,052h,039h,0b4h,0d2h,082h,08fh,081h	; a131  P...'..SaR9.....
	defb 02ah,0e4h,0e4h,0e4h,050h,02ah,04dh,0e6h,0fdh,0e4h,0e4h,0e4h,0b3h,0adh,097h,0adh	; a141  *...P*M.........
	defb 05dh,050h,0e6h,0feh,043h,034h,026h,026h,0f8h,052h,03ah,046h,055h,04ch,025h,028h	; a151  ]P..C4&&.R:FUL%(
	defb 034h,03dh,03ah,0fbh	; a161

; ----------------------------------------------------------------------
; DATOS mensaje_A165: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (23 bytes)
;   0xa165..0xa17c  (23 bytes)
DATA_mensaje_A165:
	defb 003h,076h,086h,09fh,03dh,08ch,088h,0ebh,093h,051h,047h,027h,026h,035h,061h,0e5h	; a165  .v..=....QG'&5a.
	defb 0f8h,018h,034h,02ah,071h,034h,0fbh	; a175

; ----------------------------------------------------------------------
; DATOS mensaje_A17C: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (52 bytes)
;   0xa17c..0xa1b0  (52 bytes)
DATA_mensaje_A17C:
	defb 003h,07ch,025h,0e5h,025h,04ch,053h,038h,027h,0e4h,0e4h,0e4h,0feh,02eh,04eh,0e4h	; a17c  .|%.%LS8'.....N.
	defb 0e4h,0bch,080h,051h,025h,02dh,04dh,085h,0ebh,0bch,007h,04ah,0e6h,033h,04eh,02ah	; a18c  ...Q%-M....J.3N*
	defb 04bh,0feh,0e4h,0e4h,0e4h,0bfh,0aah,0ebh,090h,0e5h,036h,02ah,026h,0f8h,060h,03eh	; a19c  K.........6*&.`>
	defb 0e4h,0e4h,0e4h,0fbh	; a1ac

; ----------------------------------------------------------------------
; DATOS mensaje_A1B0: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (10 bytes)
;   0xa1b0..0xa1ba  (10 bytes)
DATA_mensaje_A1B0:
	defb 002h,076h,036h,02ah,026h,0f8h,060h,03eh,0e1h,0fbh	; a1b0  .v6*&.`>..

; ----------------------------------------------------------------------
; DATOS mensaje_A1BA: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (12 bytes)
;   0xa1ba..0xa1c6  (12 bytes)
DATA_mensaje_A1BA:
	defb 003h,07ch,0e4h,0e4h,0e4h,025h,0e5h,047h,027h,05dh,046h,0fbh	; a1ba  .|...%.G']F.

; ----------------------------------------------------------------------
; DATOS mensaje_A1C6: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (13 bytes)
;   0xa1c6..0xa1d3  (13 bytes)
DATA_mensaje_A1C6:
	defb 003h,07ch,0e4h,0e4h,0e4h,09bh,0a6h,0adh,087h,0e4h,0e4h,0e4h,0ffh	; a1c6  .|...........

; ----------------------------------------------------------------------
; DATOS mensaje_A1D3: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (10 bytes)
;   0xa1d3..0xa1dd  (10 bytes)
DATA_mensaje_A1D3:
	defb 002h,07eh,01dh,018h,00bh,015h,00fh,0e0h,0e0h,0fbh	; a1d3  .~........

; ----------------------------------------------------------------------
; DATOS mensaje_A1DD: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (15 bytes)
;   0xa1dd..0xa1ec  (15 bytes)
DATA_mensaje_A1DD:
	defb 003h,076h,0e4h,0e4h,0e4h,0e4h,0a1h,08fh,0a8h,0e4h,0e4h,0afh,080h,0e1h,0fbh	; a1dd  .v.............

; ----------------------------------------------------------------------
; DATOS mensaje_A1EC: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (30 bytes)
;   0xa1ec..0xa20a  (30 bytes)
DATA_mensaje_A1EC:
	defb 002h,07fh,01dh,018h,00bh,015h,00fh,071h,0e0h,0e0h,084h,0a9h,05dh,0e6h,0feh,0e4h	; a1ec  .......q....]...
	defb 0e4h,0e4h,0e4h,011h,01ch,00fh,023h,000h,010h,019h,022h,05dh,0e0h,0fbh	; a1fc  ......#..."]..

; ----------------------------------------------------------------------
; DATOS mensaje_A20A: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (17 bytes)
;   0xa20a..0xa21b  (17 bytes)
DATA_mensaje_A20A:
	defb 003h,076h,011h,01ch,00fh,023h,0e4h,0e4h,000h,010h,019h,022h,0e4h,0e4h,0e4h,0e4h	; a20a  .v...#....."....
	defb 0fbh	; a21a

; ----------------------------------------------------------------------
; DATOS mensaje_A21B: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (122 bytes)
;   0xa21b..0xa295  (122 bytes)
DATA_mensaje_A21B:
	defb 07fh,02bh,02fh,043h,03ah,02eh,03dh,099h,08bh,03eh,050h,034h,04bh,032h,052h,0e0h	; a21b  .+/C:.=..>P4K2R.
	defb 0e0h,0feh,0c6h,093h,0aah,0beh,0cfh,090h,03eh,0f8h,07bh,04eh,037h,026h,02ch,0e6h	; a22b  ........>.{N7&,.
	defb 0fdh,061h,027h,05dh,0e5h,01dh,018h,00bh,015h,00fh,0e1h,0a0h,085h,08bh,03dh,04ah	; a23b  .a']..........=J
	defb 030h,044h,05dh,0e6h,0feh,02eh,02eh,03eh,0f8h,018h,03dh,053h,030h,037h,048h,071h	; a24b  0D]....>..=S07Hq
	defb 037h,047h,026h,026h,0e6h,0feh,02fh,071h,02fh,038h,02eh,02eh,02ah,04bh,0f8h,076h	; a25b  7G&&../q/8..*K.v
	defb 035h,02fh,04eh,071h,0e0h,0feh,026h,026h,02ah,0e4h,0e4h,026h,043h,031h,055h,03ah	; a26b  5/Nq..&&*..&C1U:
	defb 0e4h,0e4h,02ch,03ah,041h,02ah,028h,04eh,0e0h,0fdh,050h,02ah,071h,034h,039h,0e4h	; a27b  ..,:A*(N..P*q49.
	defb 0e4h,0e4h,099h,099h,099h,0c8h,0e4h,0e4h,0e4h,0fbh	; a28b  ..........

; ----------------------------------------------------------------------
; DATOS mensaje_A295: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (22 bytes)
;   0xa295..0xa2ab  (22 bytes)
DATA_mensaje_A295:
	defb 003h,076h,010h,019h,022h,0e0h,0e4h,0e4h,0e4h,0e4h,084h,0a9h,03eh,025h,02bh,04bh	; a295  .v..".......>%+K
	defb 046h,052h,05ch,071h,0e0h,0fbh	; a2a5

; ----------------------------------------------------------------------
; DATOS mensaje_A2AB: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (34 bytes)
;   0xa2ab..0xa2cd  (34 bytes)
DATA_mensaje_A2AB:
	defb 002h,07eh,029h,0ebh,026h,0e0h,01dh,018h,00bh,015h,00fh,0feh,0e4h,0e4h,0e4h,047h	; a2ab  .~).&..........G
	defb 027h,05dh,046h,059h,072h,0e0h,0feh,031h,02eh,030h,048h,031h,043h,032h,037h,02ch	; a2bb  ']FYr..1.0H1C27,
	defb 04eh,0fbh	; a2cb

; ----------------------------------------------------------------------
; DATOS mensaje_A2CD: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (12 bytes)
;   0xa2cd..0xa2d9  (12 bytes)
DATA_mensaje_A2CD:
	defb 003h,07ch,01dh,018h,00bh,015h,00fh,0e4h,0e4h,0e4h,0e1h,0fbh	; a2cd  .|..........

; ----------------------------------------------------------------------
; DATOS mensaje_A2D9: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (23 bytes)
;   0xa2d9..0xa2f0  (23 bytes)
DATA_mensaje_A2D9:
	defb 003h,076h,050h,02ah,071h,034h,0e4h,0e4h,0e4h,0feh,031h,02eh,030h,086h,0d1h,082h	; a2d9  .vP*q4....1.0...
	defb 088h,081h,030h,04ah,027h,02ah,0fbh	; a2e9

; ----------------------------------------------------------------------
; DATOS mensaje_A2F0: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (23 bytes)
;   0xa2f0..0xa307  (23 bytes)
DATA_mensaje_A2F0:
	defb 002h,07eh,050h,030h,03eh,0e4h,0e4h,0e4h,0feh,035h,074h,071h,038h,0f8h,06fh,051h	; a2f0  .~P0>....5tq8.oQ
	defb 0f8h,041h,030h,037h,02ch,04dh,0fbh	; a300

; ----------------------------------------------------------------------
; DATOS mensaje_A307: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (12 bytes)
;   0xa307..0xa313  (12 bytes)
DATA_mensaje_A307:
	defb 003h,07ch,0e4h,0e4h,0e4h,029h,02ah,030h,026h,050h,03ch,0fbh	; a307  .|...)*0&P<.

; ----------------------------------------------------------------------
; DATOS mensaje_A313: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (28 bytes)
;   0xa313..0xa32f  (28 bytes)
DATA_mensaje_A313:
	defb 002h,076h,08bh,085h,08fh,039h,026h,0e5h,0feh,0c6h,093h,0aah,0c2h,0c9h,0cfh,090h	; a313  .v...9&.........
	defb 03eh,025h,025h,0f8h,018h,028h,037h,047h,0f8h,053h,05dh,0fbh	; a323  >%%..(7G.S].

; ----------------------------------------------------------------------
; DATOS mensaje_A32F: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (76 bytes)
;   0xa32f..0xa37b  (76 bytes)
DATA_mensaje_A32F:
	defb 002h,07ch,035h,053h,027h,050h,04ah,0e6h,050h,034h,030h,034h,035h,0e4h,0e4h,0e4h	; a32f  .|5S'PJ.P4045...
	defb 0feh,0f8h,035h,0f8h,00ch,0f8h,048h,039h,092h,0adh,08ah,081h,0f8h,00fh,0f8h,01ah	; a33f  ..5...H9........
	defb 0e5h,047h,038h,084h,0a7h,0adh,0c4h,0cfh,087h,08dh,0feh,0adh,08bh,0d1h,0e5h,047h	; a34f  .G8............G
	defb 038h,093h,087h,08bh,0d1h,0bfh,08fh,081h,08fh,081h,081h,0adh,053h,02eh,052h,0feh	; a35f  8...........S.R.
	defb 039h,0f8h,007h,0f8h,034h,0f8h,04bh,060h,0e4h,0e4h,0e4h,0fbh	; a36f  9...4.K`....

; ----------------------------------------------------------------------
; DATOS mensaje_A37B: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (11 bytes)
;   0xa37b..0xa386  (11 bytes)
DATA_mensaje_A37B:
	defb 003h,076h,0e4h,0e4h,0e4h,082h,0adh,0a1h,081h,02fh,0fbh	; a37b  .v......./.

; ----------------------------------------------------------------------
; DATOS mensaje_A386: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (217 bytes)
;   0xa386..0xa45f  (217 bytes)
DATA_mensaje_A386:
	defb 002h,07ch,082h,0adh,0a1h,081h,0e1h,033h,027h,03ch,0e5h,033h,027h,02ah,047h,030h	; a386  .|.....3'<.3'*G0
	defb 04eh,039h,026h,050h,0e4h,0e4h,0e4h,0feh,050h,034h,030h,03ch,0e5h,089h,0bch,0a2h	; a396  N9&P....P40<....
	defb 03dh,02eh,04fh,0e4h,0e4h,0feh,04ah,02ch,02bh,02ah,02fh,04eh,034h,03dh,0e6h,0fdh	; a3a6  =.O...J,+*/N4=..
	defb 050h,034h,030h,03dh,099h,099h,03ah,0e4h,0e4h,0e4h,05dh,026h,003h,0f8h,025h,0f8h	; a3b6  P40=..:...]&..%.
	defb 035h,0f8h,00ch,0f8h,044h,0f8h,03ah,0f8h,046h,03dh,0c7h,0feh,0ebh,0a6h,0adh,0bch	; a3c6  5...D.:.F=......
	defb 0e5h,0abh,0a8h,08bh,0d0h,0abh,042h,027h,02bh,03dh,099h,094h,08bh,0e6h,0feh,050h	; a3d6  ......B'+=.....P
	defb 034h,030h,03dh,099h,099h,03eh,0f8h,045h,0f8h,007h,0f8h,034h,0f8h,04bh,051h,094h	; a3e6  40=..>.E...4.KQ.
	defb 0adh,095h,090h,047h,03eh,030h,071h,037h,0feh,094h,090h,08ch,03dh,037h,02ah,04bh	; a3f6  ...G>0q7....=7*K
	defb 03ah,056h,03dh,063h,034h,03dh,0e6h,0fdh,0bch,0aah,043h,044h,04eh,03ah,039h,071h	; a406  :V=c4=....CDN:9q
	defb 037h,0e4h,0e4h,0f8h,032h,071h,087h,0aah,03ah,039h,071h,037h,0e4h,0e4h,0feh,085h	; a416  7...2q..:9q7....
	defb 084h,047h,0f8h,018h,050h,02dh,053h,036h,02ah,039h,026h,02ch,04bh,026h,03ah,03ch	; a426  .G..P-S6*9&,K&:<
	defb 0e6h,0feh,0e4h,0e4h,0e4h,084h,0a3h,089h,03ch,0e6h,050h,034h,030h,047h,099h,099h	; a436  ........<.P40G..
	defb 047h,0e4h,0e4h,0e4h,0feh,0f8h,03ah,033h,027h,03ah,038h,04ch,036h,02ah,04eh,037h	; a446  G.....:3':8L6*N7
	defb 026h,04dh,03dh,04ah,0e6h,02bh,071h,038h,0fbh	; a456  &M=J.+q8.

; ----------------------------------------------------------------------
; DATOS mensaje_A45F: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (73 bytes)
;   0xa45f..0xa4a8  (73 bytes)
DATA_mensaje_A45F:
	defb 002h,076h,0e4h,0e4h,0e4h,094h,08fh,0ebh,08bh,0d0h,0e6h,08ch,088h,0ebh,093h,051h	; a45f  .v.............Q
	defb 048h,046h,037h,061h,027h,030h,037h,0feh,01dh,01eh,00ch,039h,052h,02ah,03ah,0e1h	; a46f  HF7a'07....9R*:.
	defb 0feh,026h,02ch,04bh,0f8h,04ah,053h,050h,060h,047h,084h,0a7h,0adh,0c4h,0cfh,087h	; a47f  .&,K.JSP`G......
	defb 08dh,0adh,08bh,0d1h,038h,047h,039h,0feh,04dh,038h,08fh,081h,0b0h,082h,053h,026h	; a48f  ....8G9.M8....S&
	defb 026h,052h,059h,072h,039h,026h,03dh,02ah,0fbh	; a49f  &RYr9&=*.

; ----------------------------------------------------------------------
; DATOS mensaje_A4A8: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (46 bytes)
;   0xa4a8..0xa4d6  (46 bytes)
DATA_mensaje_A4A8:
	defb 003h,07ch,0e4h,0e4h,0e4h,033h,027h,060h,047h,039h,026h,050h,0e6h,0feh,039h,052h	; a4a8  .|...3'`G9&P..9R
	defb 037h,026h,027h,02ah,0e4h,0e4h,0e4h,033h,027h,0e5h,0f8h,07eh,053h,0e4h,0e4h,0f8h	; a4b8  7&'*...3'..~S...
	defb 07eh,053h,0f8h,079h,034h,02ch,0feh,02ah,052h,059h,034h,02ah,04bh,0fbh	; a4c8  ~S.y4,.*RY4*K.

; ----------------------------------------------------------------------
; DATOS mensaje_A4D6: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (9 bytes)
;   0xa4d6..0xa4df  (9 bytes)
DATA_mensaje_A4D6:
	defb 003h,076h,0f8h,07eh,0e4h,0e4h,0e4h,0e1h,0fbh	; a4d6  .v.~.....

; ----------------------------------------------------------------------
; DATOS mensaje_A4DF: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (18 bytes)
;   0xa4df..0xa4f1  (18 bytes)
DATA_mensaje_A4DF:
	defb 002h,07ch,01dh,018h,00bh,015h,00fh,0e5h,029h,02ch,02fh,052h,03eh,026h,04dh,03dh	; a4df  .|......),/R>&M=
	defb 0e1h,0fbh	; a4ef

; ----------------------------------------------------------------------
; DATOS mensaje_A4F1: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (21 bytes)
;   0xa4f1..0xa506  (21 bytes)
DATA_mensaje_A4F1:
	defb 003h,076h,0e4h,0e4h,0e4h,026h,048h,0e5h,085h,0b7h,087h,03eh,026h,039h,026h,0e6h	; a4f1  .v...&H....>&9&.
	defb 086h,09fh,03eh,0e1h,0fbh	; a501

; ----------------------------------------------------------------------
; DATOS mensaje_A506: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (42 bytes)
;   0xa506..0xa530  (42 bytes)
DATA_mensaje_A506:
	defb 003h,07ch,03fh,038h,04ch,04ah,0e4h,0e4h,0e4h,065h,036h,03ah,0bch,087h,08bh,0adh	; a506  .|?8LJ...e6:....
	defb 08bh,0d1h,0afh,08bh,0d0h,0feh,060h,047h,039h,026h,050h,0e6h,090h,0d0h,0adh,08ch	; a516  ......`G9&P.....
	defb 053h,039h,02ah,071h,034h,03dh,02ah,030h,04bh,0fbh	; a526  S9*q4=*0K.

; ----------------------------------------------------------------------
; DATOS mensaje_A530: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (9 bytes)
;   0xa530..0xa539  (9 bytes)
DATA_mensaje_A530:
	defb 002h,076h,0f8h,07ah,0f8h,052h,03eh,0e1h,0fbh	; a530  .v.z.R>..

; ----------------------------------------------------------------------
; DATOS mensaje_A539: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (182 bytes)
;   0xa539..0xa5ef  (182 bytes)
DATA_mensaje_A539:
	defb 002h,07ch,0e4h,0e4h,0e4h,026h,035h,061h,05dh,02dh,0e5h,0feh,026h,035h,061h,05dh	; a539  .|...&5a]-..&5a]
	defb 02dh,088h,0cfh,089h,0adh,051h,02ah,052h,053h,028h,034h,02eh,038h,053h,025h,071h	; a549  -....Q*RS(4.8S%q
	defb 034h,0feh,0e6h,050h,034h,030h,053h,043h,05dh,0f8h,07eh,03dh,0f8h,02eh,051h,03eh	; a559  4..P40SC].~=..Q>
	defb 030h,071h,037h,026h,034h,02eh,04fh,0e6h,0fdh,0f8h,01ch,060h,047h,02ch,04dh,030h	; a569  0q7&4.O....`G,M0
	defb 02ch,039h,04dh,04ah,027h,039h,0f8h,044h,0f8h,07ah,025h,026h,05dh,071h,034h,0e4h	; a579  ,9MJ'9.D.z%&]q4.
	defb 0e4h,0feh,09bh,0a6h,0adh,087h,0e4h,099h,0adh,08fh,0ebh,071h,037h,026h,027h,0f8h	; a589  ...........q7&'.
	defb 036h,053h,050h,03dh,0f8h,04fh,0e6h,0feh,099h,0adh,08ah,0a0h,060h,08bh,0adh,08bh	; a599  6SP=.O......`...
	defb 060h,0e4h,0e4h,0e4h,081h,0adh,092h,0a7h,060h,0e6h,0feh,060h,047h,026h,036h,047h	; a5a9  `.......`..`G&6G
	defb 039h,03ah,02ah,03ah,029h,063h,028h,037h,026h,034h,0e6h,0fdh,050h,034h,030h,0e5h	; a5b9  9:*:)c(7&4..P40.
	defb 085h,0b7h,087h,047h,08ch,088h,0ebh,093h,047h,039h,03ah,047h,02ah,047h,031h,037h	; a5c9  ...G....G9:G*G17
	defb 037h,0feh,0e4h,0e4h,0e4h,061h,02eh,043h,060h,047h,029h,026h,02ah,02dh,037h,026h	; a5d9  7....a.C`G)&*-7&
	defb 02bh,034h,02ah,071h,034h,0fbh	; a5e9

; ----------------------------------------------------------------------
; DATOS mensaje_A5EF: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (9 bytes)
;   0xa5ef..0xa5f8  (9 bytes)
DATA_mensaje_A5EF:
	defb 002h,076h,0c1h,082h,0a1h,081h,051h,0e1h,0fbh	; a5ef  .v....Q..

; ----------------------------------------------------------------------
; DATOS mensaje_A5F8: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (71 bytes)
;   0xa5f8..0xa63f  (71 bytes)
DATA_mensaje_A5F8:
	defb 002h,07ch,033h,027h,0e4h,0e4h,0e4h,060h,047h,05dh,046h,05dh,071h,034h,0e6h,0feh	; a5f8  .|3'...`G]F]q4..
	defb 0f8h,036h,053h,050h,03eh,050h,034h,030h,03dh,027h,02dh,0f8h,049h,04eh,051h,08ah	; a608  .6SP>P40='-.INQ.
	defb 081h,0b2h,03ah,039h,071h,037h,0feh,086h,0d2h,09ah,030h,034h,03dh,0e6h,0feh,04ah	; a618  ..:9q7....04=..J
	defb 02ch,050h,02ah,04bh,039h,026h,02dh,061h,0e5h,0f8h,039h,0f8h,029h,0f8h,048h,039h	; a628  ,P*K9&-a..9.).H9
	defb 0a7h,0a4h,082h,060h,0e4h,0e4h,0fbh	; a638

; ----------------------------------------------------------------------
; DATOS mensaje_A63F: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (39 bytes)
;   0xa63f..0xa666  (39 bytes)
DATA_mensaje_A63F:
	defb 002h,076h,0a9h,08dh,0c5h,08bh,0d2h,0adh,0e4h,089h,09fh,0d1h,095h,092h,0c9h,0ebh	; a63f  .v..............
	defb 053h,038h,038h,03dh,071h,037h,026h,0feh,039h,02ah,071h,034h,052h,05dh,0e6h,04ah	; a64f  S88=q7&.9*q4R].J
	defb 02ch,025h,04dh,02eh,038h,05dh,0fbh	; a65f

; ----------------------------------------------------------------------
; DATOS mensaje_A666: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (149 bytes)
;   0xa666..0xa6fb  (149 bytes)
DATA_mensaje_A666:
	defb 002h,07ch,033h,04eh,0f8h,003h,0f8h,070h,0e5h,050h,034h,030h,048h,085h,0b7h,087h	; a666  .|3N...p.P40H...
	defb 03eh,03fh,061h,026h,08dh,081h,085h,091h,051h,0feh,0e4h,0e4h,0e4h,050h,034h,030h	; a676  >?a&....Q....P40
	defb 034h,035h,03eh,08dh,0adh,08bh,0d1h,088h,0adh,051h,027h,062h,050h,04eh,0e5h,0feh	; a686  45>......Q'bPN..
	defb 0a7h,09bh,0d1h,0ebh,0b5h,095h,087h,03ah,02fh,04eh,0e4h,0e4h,0e4h,0feh,01dh,01eh	; a696  .......:/N......
	defb 00ch,03ah,0f8h,049h,04dh,030h,02ah,039h,02ah,071h,034h,03dh,04ah,0e6h,0fdh,060h	; a6a6  .:.IM0*9*q4=J..`
	defb 047h,0e5h,089h,082h,085h,081h,03eh,030h,037h,039h,026h,050h,0e6h,0feh,0f8h,003h	; a6b6  G.....>079&P....
	defb 0f8h,03eh,03dh,0f8h,07eh,03dh,0f8h,02eh,030h,02ah,030h,04bh,039h,02ah,071h,034h	; a6c6  .>=.~=..0*0K9*q4
	defb 050h,034h,030h,038h,035h,053h,071h,0feh,037h,0f8h,01ch,060h,03eh,026h,04fh,052h	; a6d6  P4085Sq.7..`>&OR
	defb 039h,0f8h,026h,051h,030h,071h,034h,050h,0e6h,0feh,0e4h,0e4h,0e4h,0f8h,052h,047h	; a6e6  9.&Q0q4P......RG
	defb 02eh,04fh,030h,034h,0fbh	; a6f6

; ----------------------------------------------------------------------
; DATOS mensaje_A6FB: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (17 bytes)
;   0xa6fb..0xa70c  (17 bytes)
DATA_mensaje_A6FB:
	defb 002h,076h,085h,0a9h,03ah,03eh,0e4h,0e4h,0e4h,033h,04eh,0f8h,003h,0f8h,070h,0e1h	; a6fb  .v..:>...3N...p.
	defb 0fbh	; a70b

; ----------------------------------------------------------------------
; DATOS mensaje_A70C: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (46 bytes)
;   0xa70c..0xa73a  (46 bytes)
DATA_mensaje_A70C:
	defb 002h,07ch,0f8h,00bh,071h,037h,039h,026h,050h,0e6h,0e4h,0e4h,0e4h,050h,034h,030h	; a70c  .|..q79&P....P40
	defb 034h,035h,03dh,0f8h,046h,03dh,0c0h,0a8h,0a7h,0feh,0adh,03dh,085h,065h,03eh,026h	; a71c  45=.F=.....=.e>&
	defb 036h,043h,060h,047h,03dh,02eh,071h,037h,026h,034h,03dh,03ch,0e6h,0fbh	; a72c  6C`G=.q7&4=<..

; ----------------------------------------------------------------------
; DATOS mensaje_A73A: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (12 bytes)
;   0xa73a..0xa746  (12 bytes)
DATA_mensaje_A73A:
	defb 002h,07eh,029h,0ebh,026h,0e0h,0e0h,029h,043h,034h,032h,0fbh	; a73a  .~).&..)C42.

; ----------------------------------------------------------------------
; DATOS mensaje_A746: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (13 bytes)
;   0xa746..0xa753  (13 bytes)
DATA_mensaje_A746:
	defb 003h,076h,0e4h,0e4h,0e4h,039h,053h,026h,093h,081h,0a9h,05dh,0fbh	; a746  .v...9S&...].

; ----------------------------------------------------------------------
; DATOS mensaje_A753: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (18 bytes)
;   0xa753..0xa765  (18 bytes)
DATA_mensaje_A753:
	defb 002h,07ch,0e4h,0e4h,0e4h,026h,02bh,043h,030h,074h,027h,0e6h,01dh,018h,00bh,015h	; a753  .|...&+C0t'.....
	defb 00fh,0fbh	; a763

; ----------------------------------------------------------------------
; DATOS mensaje_A765: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (22 bytes)
;   0xa765..0xa77b  (22 bytes)
DATA_mensaje_A765:
	defb 002h,07eh,029h,027h,0e0h,0e4h,0e4h,0e4h,094h,08fh,0ebh,08bh,0d0h,0e5h,0feh,01dh	; a765  .~)'............
	defb 018h,00bh,015h,00fh,0e0h,0fbh	; a775

; ----------------------------------------------------------------------
; DATOS mensaje_A77B: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (12 bytes)
;   0xa77b..0xa787  (12 bytes)
DATA_mensaje_A77B:
	defb 003h,07ch,04ah,02ch,0b2h,0bfh,0b4h,060h,0e4h,0e4h,0e4h,0fbh	; a77b  .|J,...`....

; ----------------------------------------------------------------------
; DATOS mensaje_A787: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (24 bytes)
;   0xa787..0xa79f  (24 bytes)
DATA_mensaje_A787:
	defb 002h,076h,0e4h,0e4h,0e4h,031h,02eh,030h,048h,032h,034h,039h,0feh,0e4h,0e4h,0e4h	; a787  .v...1.0H249....
	defb 0c6h,093h,0aah,0c2h,0c9h,0cfh,090h,0fbh	; a797  ........

; ----------------------------------------------------------------------
; DATOS mensaje_A79F: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (17 bytes)
;   0xa79f..0xa7b0  (17 bytes)
DATA_mensaje_A79F:
	defb 002h,07eh,02bh,044h,03eh,02ah,050h,04bh,052h,039h,0e5h,01dh,018h,00bh,015h,00fh	; a79f  .~+D>*PKR9......
	defb 0fbh	; a7af

; ----------------------------------------------------------------------
; DATOS mensaje_A7B0: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (30 bytes)
;   0xa7b0..0xa7ce  (30 bytes)
DATA_mensaje_A7B0:
	defb 002h,07ch,01dh,018h,00bh,015h,00fh,0e5h,026h,033h,054h,043h,030h,074h,027h,0e0h	; a7b0  .|......&3TC0t'.
	defb 0feh,09eh,0a8h,09bh,0f8h,054h,0f8h,023h,03dh,038h,02eh,04fh,041h,0fbh	; a7c0  .....T.#=8.OA.

; ----------------------------------------------------------------------
; DATOS mensaje_A7CE: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (66 bytes)
;   0xa7ce..0xa810  (66 bytes)
DATA_mensaje_A7CE:
	defb 002h,07eh,039h,03ah,071h,0e5h,09eh,0a8h,09bh,03eh,0bfh,0b4h,02ah,0e6h,0fdh,050h	; a7ce  .~9:q....>..*..P
	defb 030h,047h,02eh,02eh,02ah,04bh,039h,052h,038h,02ah,0b8h,0cfh,08bh,0d1h,091h,0feh	; a7de  0G..*K9R8*......
	defb 030h,04ah,027h,038h,030h,034h,052h,059h,072h,053h,02eh,03dh,083h,0a9h,0c0h,0ebh	; a7ee  0J'804RYrS.=....
	defb 0feh,08fh,0ebh,03eh,0f8h,04eh,053h,050h,02ah,04bh,03fh,04bh,02ah,052h,03dh,059h	; a7fe  ...>.NSP*K?K*R=Y
	defb 072h,0fbh	; a80e

; ----------------------------------------------------------------------
; DATOS mensaje_A810: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (27 bytes)
;   0xa810..0xa82b  (27 bytes)
DATA_mensaje_A810:
	defb 002h,076h,094h,08fh,0ebh,08bh,0d0h,0e5h,004h,0f8h,052h,060h,026h,035h,04eh,036h	; a810  .v........R`&5N6
	defb 03ah,039h,071h,0feh,037h,031h,031h,047h,027h,0e0h,0fbh	; a820  :9q.711G'..

; ----------------------------------------------------------------------
; DATOS mensaje_A82B: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (28 bytes)
;   0xa82b..0xa847  (28 bytes)
DATA_mensaje_A82B:
	defb 002h,07eh,043h,071h,037h,02ch,04eh,0e0h,01dh,018h,00bh,015h,00fh,0e5h,0feh,025h	; a82b  .~Cq7,N........%
	defb 052h,034h,03ah,050h,034h,031h,047h,052h,053h,025h,04dh,0fbh	; a83b  R4:P41GRS%M.

; ----------------------------------------------------------------------
; DATOS mensaje_A847: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (26 bytes)
;   0xa847..0xa861  (26 bytes)
DATA_mensaje_A847:
	defb 002h,07eh,09fh,099h,0a7h,02ah,04bh,02ch,031h,03ch,037h,029h,026h,034h,052h,059h	; a847  .~...*K,1<7)&4RY
	defb 072h,0feh,0e4h,0e4h,0e4h,085h,0ebh,0bch,006h,0fbh	; a857  r.........

; ----------------------------------------------------------------------
; DATOS mensaje_A861: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (23 bytes)
;   0xa861..0xa878  (23 bytes)
DATA_mensaje_A861:
	defb 002h,07ch,025h,039h,034h,03dh,025h,038h,03ah,036h,026h,037h,026h,02ch,050h,0e5h	; a861  .|%94=%8:6&7&,P.
	defb 0feh,01dh,018h,00bh,015h,00fh,0fbh	; a871

; ----------------------------------------------------------------------
; DATOS mensaje_A878: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (9 bytes)
;   0xa878..0xa881  (9 bytes)
DATA_mensaje_A878:
	defb 003h,076h,094h,08fh,0ebh,08bh,0d0h,0e1h,0fbh	; a878  .v.......

; ----------------------------------------------------------------------
; DATOS mensaje_A881: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (36 bytes)
;   0xa881..0xa8a5  (36 bytes)
DATA_mensaje_A881:
	defb 002h,07ch,0e4h,0e4h,0e4h,033h,027h,04ah,0e5h,0f8h,021h,0e4h,0e4h,0e4h,0feh,01dh	; a881  .|...3'J..!.....
	defb 01eh,00ch,086h,0d2h,087h,081h,0adh,03dh,094h,08fh,0ebh,08bh,0d0h,0e4h,09eh,0a8h	; a891  .......=........
	defb 089h,0c2h,0c8h,0fbh	; a8a1

; ----------------------------------------------------------------------
; DATOS mensaje_A8A5: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (56 bytes)
;   0xa8a5..0xa8dd  (56 bytes)
DATA_mensaje_A8A5:
	defb 002h,07ch,01dh,019h,016h,013h,00eh,000h,01dh,018h,00bh,015h,00fh,03ch,0e4h,0e4h	; a8a5  .|...........<..
	defb 0e4h,0feh,029h,034h,053h,026h,029h,027h,047h,03dh,03eh,0f8h,059h,059h,0e6h,086h	; a8b5  ..)4S&)'G=>.YY..
	defb 0d2h,082h,0a7h,0d2h,087h,030h,037h,0feh,09eh,0a8h,09bh,0f8h,054h,0f8h,023h,051h	; a8c5  .....07.....T.#Q
	defb 034h,031h,02dh,043h,030h,074h,027h,0fbh	; a8d5  41-C0t'.

; ----------------------------------------------------------------------
; DATOS mensaje_A8DD: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (19 bytes)
;   0xa8dd..0xa8f0  (19 bytes)
DATA_mensaje_A8DD:
	defb 003h,076h,0e4h,0e4h,0e4h,061h,02eh,02ah,060h,025h,071h,034h,02eh,038h,053h,025h	; a8dd  .v...a.*`%q4.8S%
	defb 04dh,0e1h,0fbh	; a8ed

; ----------------------------------------------------------------------
; DATOS mensaje_A8F0: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (35 bytes)
;   0xa8f0..0xa913  (35 bytes)
DATA_mensaje_A8F0:
	defb 002h,07ch,033h,04eh,071h,0e1h,0f8h,036h,053h,050h,03dh,0f8h,04fh,034h,035h,03dh	; a8f0  .|3Nq..6SP=.O45=
	defb 0b8h,081h,09ah,0d2h,082h,0f8h,048h,039h,0feh,02ch,061h,02bh,0a2h,0adh,087h,060h	; a900  ......H9.,a+...`
	defb 030h,074h,0fbh	; a910

; ----------------------------------------------------------------------
; DATOS mensaje_A913: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (66 bytes)
;   0xa913..0xa955  (66 bytes)
DATA_mensaje_A913:
	defb 002h,076h,033h,027h,05dh,071h,0e0h,0e4h,0e4h,0e4h,029h,047h,026h,05dh,030h,034h	; a913  .v3']q....)G&]04
	defb 05ch,0e6h,0feh,094h,08fh,0ebh,08bh,0d0h,0e4h,09eh,0a8h,089h,0c2h,0c8h,0e5h,0f8h	; a923  \...............
	defb 07eh,03dh,0a5h,082h,08dh,081h,0e4h,0e4h,0e4h,0feh,085h,0a8h,0aeh,0a7h,0ebh,0e4h	; a933  ~=..............
	defb 084h,0a7h,0adh,0c4h,0cfh,087h,03dh,0b2h,0ebh,0a8h,0bch,0a1h,0b8h,0a7h,08ch,0feh	; a943  ......=.........
	defb 093h,0fbh	; a953

; ----------------------------------------------------------------------
; DATOS mensaje_A955: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (13 bytes)
;   0xa955..0xa962  (13 bytes)
DATA_mensaje_A955:
	defb 002h,07ch,0e4h,0e4h,0e4h,0f8h,052h,035h,053h,026h,05dh,050h,0fbh	; a955  .|....R5S&]P.

; ----------------------------------------------------------------------
; DATOS mensaje_A962: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (19 bytes)
;   0xa962..0xa975  (19 bytes)
DATA_mensaje_A962:
	defb 003h,076h,033h,052h,039h,03eh,05ah,03eh,039h,026h,0e6h,034h,030h,02ah,03ah,0e4h	; a962  .v3R9>Z>9&.40*:.
	defb 0e4h,0e4h,0fbh	; a972

; ----------------------------------------------------------------------
; DATOS mensaje_A975: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (20 bytes)
;   0xa975..0xa989  (20 bytes)
DATA_mensaje_A975:
	defb 002h,07ch,033h,052h,039h,02eh,038h,04ah,04ch,0e5h,09eh,0a8h,09bh,0f8h,054h,0f8h	; a975  .|3R9.8JL.....T.
	defb 023h,03eh,0e1h,0fbh	; a985

; ----------------------------------------------------------------------
; DATOS mensaje_A989: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (31 bytes)
;   0xa989..0xa9a8  (31 bytes)
DATA_mensaje_A989:
	defb 002h,076h,0a0h,08dh,0adh,086h,060h,089h,0adh,08fh,087h,093h,030h,034h,052h,05dh	; a989  .v....`.....04R]
	defb 053h,0e4h,0e4h,0e4h,0feh,089h,093h,0bdh,053h,0f8h,07dh,059h,039h,026h,0fbh	; a999  S.......S.}Y9&.

; ----------------------------------------------------------------------
; DATOS mensaje_A9A8: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (64 bytes)
;   0xa9a8..0xa9e8  (64 bytes)
DATA_mensaje_A9A8:
	defb 002h,07ch,0bfh,0b4h,039h,03dh,03ch,0e4h,0e4h,0e4h,04ah,02ah,071h,034h,0e6h,0feh	; a9a8  .|..9=<...J*q4..
	defb 089h,0aeh,08fh,0a0h,08dh,0adh,086h,03dh,027h,046h,02eh,044h,08bh,0d1h,0b4h,0d1h	; a9b8  .......='F.D....
	defb 091h,051h,030h,037h,0feh,029h,026h,037h,04ah,02ah,071h,034h,050h,0e6h,0feh,01dh	; a9c8  .Q07.)&7J*q4P...
	defb 018h,00bh,015h,00fh,0e5h,0a0h,08dh,0adh,086h,02ah,030h,037h,0e4h,0e4h,0e4h,0fbh	; a9d8  .........*07....

; ----------------------------------------------------------------------
; DATOS mensaje_A9E8: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (17 bytes)
;   0xa9e8..0xa9f9  (17 bytes)
DATA_mensaje_A9E8:
	defb 002h,076h,08bh,0d1h,082h,099h,08ch,082h,03eh,002h,005h,001h,0e4h,006h,002h,05dh	; a9e8  .v......>......]
	defb 0fbh	; a9f8

; ----------------------------------------------------------------------
; DATOS mensaje_A9F9: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (105 bytes)
;   0xa9f9..0xaa62  (105 bytes)
DATA_mensaje_A9F9:
	defb 002h,07ch,01dh,018h,00bh,015h,00fh,0e5h,0f8h,01ch,03dh,038h,02eh,04fh,09eh,0a8h	; a9f9  .|........=8.O..
	defb 09bh,03eh,0bfh,0b4h,04ah,0e6h,0feh,08fh,0abh,0ebh,0beh,0a8h,03dh,0f8h,062h,03ah	; aa09  .>..J.......=.b:
	defb 0f8h,044h,02bh,039h,087h,0a9h,0bdh,08ch,053h,025h,04dh,052h,05dh,02dh,0feh,061h	; aa19  .D+9....S%MR]-.a
	defb 0e4h,0e4h,0e4h,033h,03dh,02fh,02bh,03dh,0f8h,02ch,0f8h,06eh,0f8h,02dh,03ah,026h	; aa29  ...3=/+=.,.n.-:&
	defb 04dh,04bh,030h,026h,050h,0e6h,0fdh,09eh,0a8h,09bh,0f8h,054h,0f8h,023h,03eh,0c6h	; aa39  MK0&P......T.#>.
	defb 093h,0aah,0c2h,0c9h,0cfh,090h,0f8h,054h,0f8h,023h,03dh,02eh,038h,051h,0feh,08bh	; aa49  .......T.#=.8Q..
	defb 0adh,0c3h,081h,030h,037h,026h,034h,050h,0fbh	; aa59  ...07&4P.

; ----------------------------------------------------------------------
; DATOS mensaje_AA62: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (43 bytes)
;   0xaa62..0xaa8d  (43 bytes)
DATA_mensaje_AA62:
	defb 002h,076h,0c6h,093h,0aah,0c2h,0c9h,0cfh,090h,03eh,0bfh,0b4h,05dh,0e6h,08bh,0adh	; aa62  .v.......>..]...
	defb 0c3h,081h,039h,026h,0e6h,0feh,02fh,02bh,03ah,09eh,0a8h,09bh,051h,0f8h,014h,0f8h	; aa72  ..9&../+:...Q...
	defb 030h,031h,04dh,0e6h,0e4h,0e4h,0e4h,026h,026h,039h,0fbh	; aa82  01M....&&9.

; ----------------------------------------------------------------------
; DATOS mensaje_AA8D: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (66 bytes)
;   0xaa8d..0xaacf  (66 bytes)
DATA_mensaje_AA8D:
	defb 002h,07ch,087h,0a9h,0bdh,08ch,041h,039h,04bh,090h,085h,09fh,090h,053h,025h,04dh	; aa8d  .|....A9K....S%M
	defb 050h,0e6h,0feh,02eh,03dh,0f8h,007h,03ah,040h,04dh,026h,0f8h,045h,0f8h,007h,0f8h	; aa9d  P...=..:@M&.E...
	defb 034h,0f8h,04bh,053h,025h,04dh,03dh,0e6h,0feh,033h,03dh,083h,0a9h,0c0h,0ebh,08fh	; aaad  4.KS%M=..3=.....
	defb 0ebh,060h,029h,04ch,04eh,04dh,050h,0e4h,0e4h,0e4h,0feh,026h,02bh,043h,030h,074h	; aabd  .`)LNMP....&+C0t
	defb 027h,0fbh	; aacd

; ----------------------------------------------------------------------
; DATOS mensaje_AACF: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (26 bytes)
;   0xaacf..0xaae9  (26 bytes)
DATA_mensaje_AACF:
	defb 002h,076h,09ah,0d1h,0ebh,0cfh,0e0h,02eh,052h,039h,038h,02eh,04fh,03ah,0e4h,0e4h	; aacf  .v......R98.O:..
	defb 0e4h,0feh,083h,0a9h,0c0h,0ebh,08fh,0ebh,053h,0fbh	; aadf  ........S.

; ----------------------------------------------------------------------
; DATOS mensaje_AAE9: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (25 bytes)
;   0xaae9..0xab02  (25 bytes)
DATA_mensaje_AAE9:
	defb 003h,078h,0e4h,0e4h,0e4h,057h,046h,052h,0e6h,0feh,0f8h,044h,0b4h,0d2h,082h,0bfh	; aae9  .x...WFR...D....
	defb 0e4h,0e4h,0e4h,050h,0e4h,034h,0e4h,030h,0fbh	; aaf9  ...P.4.0.

; ----------------------------------------------------------------------
; DATOS mensaje_AB02: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (9 bytes)
;   0xab02..0xab0b  (9 bytes)
DATA_mensaje_AB02:
	defb 002h,076h,09dh,0ebh,0a7h,0ebh,0e0h,0e1h,0fbh	; ab02  .v.......

; ----------------------------------------------------------------------
; DATOS mensaje_AB0B: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (9 bytes)
;   0xab0b..0xab14  (9 bytes)
DATA_mensaje_AB0B:
	defb 003h,078h,029h,061h,04fh,026h,034h,0e1h,0fbh	; ab0b  .x)aO&4..

; ----------------------------------------------------------------------
; DATOS mensaje_AB14: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (38 bytes)
;   0xab14..0xab3a  (38 bytes)
DATA_mensaje_AB14:
	defb 003h,076h,09bh,082h,0ebh,0cfh,0e4h,0e4h,0e4h,0f8h,065h,063h,04fh,026h,030h,034h	; ab14  .v........ecO&04
	defb 0e6h,0feh,060h,0e5h,061h,027h,030h,034h,0e1h,0e4h,0e4h,0e4h,02eh,052h,039h,038h	; ab24  ..`.a'04.....R98
	defb 02eh,04fh,043h,060h,0e1h,0fbh	; ab34

; ----------------------------------------------------------------------
; DATOS mensaje_AB3A: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (28 bytes)
;   0xab3a..0xab56  (28 bytes)
DATA_mensaje_AB3A:
	defb 078h,0a3h,087h,08eh,087h,030h,034h,060h,030h,074h,0e1h,0feh,0f8h,038h,02bh,037h	; ab3a  x....04`0t...8+7
	defb 026h,034h,04bh,026h,036h,060h,047h,0f8h,00bh,028h,04dh,0fbh	; ab4a  &4K&6`G..(M.

; ----------------------------------------------------------------------
; DATOS mensaje_AB56: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (9 bytes)
;   0xab56..0xab5f  (9 bytes)
DATA_mensaje_AB56:
	defb 003h,076h,0e4h,0e4h,0e4h,033h,027h,02ah,0fbh	; ab56  .v...3'*.

; ----------------------------------------------------------------------
; DATOS mensaje_AB5F: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (36 bytes)
;   0xab5f..0xab83  (36 bytes)
DATA_mensaje_AB5F:
	defb 078h,025h,06ch,0ebh,0e4h,0e4h,0e4h,02eh,03dh,08dh,081h,09bh,087h,0e5h,0feh,0a0h	; ab5f  x%l.....=.......
	defb 097h,03dh,0f8h,02dh,053h,02ch,04dh,030h,02ch,037h,0e4h,0e4h,0e4h,031h,071h,038h	; ab6f  .=.-S,M0,7...1q8
	defb 030h,034h,050h,0fbh	; ab7f

; ----------------------------------------------------------------------
; DATOS mensaje_AB83: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (26 bytes)
;   0xab83..0xab9d  (26 bytes)
DATA_mensaje_AB83:
	defb 078h,02eh,04eh,0e5h,092h,086h,02ah,04bh,027h,062h,071h,034h,0b4h,0d1h,082h,04ah	; ab83  x.N...*K'bq4...J
	defb 0e6h,0feh,036h,02ah,071h,037h,0e4h,0e4h,0e4h,0fbh	; ab93  ..6*q7....

; ----------------------------------------------------------------------
; DATOS mensaje_AB9D: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (29 bytes)
;   0xab9d..0xabba  (29 bytes)
DATA_mensaje_AB9D:
	defb 076h,034h,030h,02ah,03ah,0e4h,0e4h,0e4h,0f8h,051h,03ah,03eh,036h,02ah,026h,03ah	; ab9d  v40*:....Q:>6*&:
	defb 02ch,026h,0b4h,0d1h,082h,05dh,0e6h,0feh,034h,031h,02ah,04dh,0fbh	; abad  ,&...]..41*M.

; ----------------------------------------------------------------------
; DATOS mensaje_ABBA: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (21 bytes)
;   0xabba..0xabcf  (21 bytes)
DATA_mensaje_ABBA:
	defb 078h,0e4h,0e4h,0e4h,044h,052h,039h,0e5h,031h,052h,05dh,03dh,03ch,0e6h,01dh,018h	; abba  x...DR9.1R]=<...
	defb 00bh,015h,00fh,0e1h,0fbh	; abca

; ----------------------------------------------------------------------
; DATOS mensaje_ABCF: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (25 bytes)
;   0xabcf..0xabe8  (25 bytes)
DATA_mensaje_ABCF:
	defb 076h,026h,048h,0e4h,0e4h,0e4h,0feh,043h,05dh,048h,04bh,039h,02dh,04eh,062h,026h	; abcf  v&H....C]HK9-Nb&
	defb 02dh,039h,026h,02eh,038h,053h,025h,04dh,0fbh	; abdf  -9&.8S%M.

; ----------------------------------------------------------------------
; DATOS mensaje_ABE8: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (11 bytes)
;   0xabe8..0xabf3  (11 bytes)
DATA_mensaje_ABE8:
	defb 003h,078h,0e4h,0e4h,0e4h,043h,0e4h,02fh,0e4h,02ah,0fbh	; abe8  .x...C./.*.

; ----------------------------------------------------------------------
; DATOS mensaje_ABF3: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (14 bytes)
;   0xabf3..0xac01  (14 bytes)
DATA_mensaje_ABF3:
	defb 003h,076h,033h,027h,05dh,0e4h,0e4h,0e4h,09dh,0ebh,0a7h,0ebh,0e1h,0fbh	; abf3  .v3'].........

; ----------------------------------------------------------------------
; DATOS mensaje_AC01: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (20 bytes)
;   0xac01..0xac15  (20 bytes)
DATA_mensaje_AC01:
	defb 002h,078h,01dh,018h,00bh,015h,00fh,0e1h,043h,02fh,02ah,0e4h,0e4h,0e4h,050h,034h	; ac01  .x......C/*...P4
	defb 030h,051h,0e1h,0fbh	; ac11

; ----------------------------------------------------------------------
; DATOS mensaje_AC15: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (26 bytes)
;   0xac15..0xac2f  (26 bytes)
DATA_mensaje_AC15:
	defb 003h,076h,0e4h,0e4h,0e4h,09bh,09bh,09bh,0feh,0e4h,0e4h,0e4h,045h,02ah,028h,03dh	; ac15  .v..........E*(=
	defb 087h,0a8h,09eh,051h,04ah,066h,027h,02ah,0e1h,0fbh	; ac25  ...QJf'*..

; ----------------------------------------------------------------------
; DATOS mensaje_AC2F: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (21 bytes)
;   0xac2f..0xac44  (21 bytes)
DATA_mensaje_AC2F:
	defb 002h,078h,0e4h,0e4h,0e4h,039h,052h,05dh,06ch,0e4h,0e4h,0e4h,0b4h,0d2h,082h,0b8h	; ac2f  .x...9R]l.......
	defb 0adh,02bh,036h,026h,0fbh	; ac3f

; ----------------------------------------------------------------------
; DATOS mensaje_AC44: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (38 bytes)
;   0xac44..0xac6a  (38 bytes)
DATA_mensaje_AC44:
	defb 002h,076h,09dh,0ebh,0a7h,0ebh,0e5h,0f8h,014h,0f8h,030h,0f8h,045h,092h,0adh,043h	; ac44  .v........0.E..C
	defb 060h,0ebh,0f8h,013h,03ah,03eh,030h,04dh,0e6h,0feh,0e4h,0e4h,0e4h,036h,026h,037h	; ac54  `...:>0M.....6&7
	defb 02eh,04eh,04dh,02ah,0e1h,0fbh	; ac64

; ----------------------------------------------------------------------
; DATOS mensaje_AC6A: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (18 bytes)
;   0xac6a..0xac7c  (18 bytes)
DATA_mensaje_AC6A:
	defb 003h,078h,0e4h,0e4h,0e4h,033h,04eh,071h,0e5h,0c5h,0aah,0c7h,0ebh,0b5h,039h,03dh	; ac6a  .x...3Nq......9=
	defb 0e1h,0fbh	; ac7a

; ----------------------------------------------------------------------
; DATOS mensaje_AC7C: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (17 bytes)
;   0xac7c..0xac8d  (17 bytes)
DATA_mensaje_AC7C:
	defb 076h,033h,03dh,0a5h,082h,08ch,05dh,038h,0f8h,044h,0b4h,0d2h,082h,0bfh,05dh,039h	; ac7c  v3=...]8.D....]9
	defb 0fbh	; ac8c

; ----------------------------------------------------------------------
; DATOS mensaje_AC8D: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (15 bytes)
;   0xac8d..0xac9c  (15 bytes)
DATA_mensaje_AC8D:
	defb 002h,078h,034h,031h,02ah,071h,034h,050h,0e5h,01dh,018h,00bh,015h,00fh,0fbh	; ac8d  .x41*q4P.......

; ----------------------------------------------------------------------
; DATOS mensaje_AC9C: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (7 bytes)
;   0xac9c..0xaca3  (7 bytes)
DATA_mensaje_AC9C:
	defb 003h,076h,0e4h,0e4h,0e4h,0e4h,0fbh	; ac9c

; ----------------------------------------------------------------------
; DATOS mensaje_ACA3: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (8 bytes)
;   0xaca3..0xacab  (8 bytes)
DATA_mensaje_ACA3:
	defb 078h,061h,027h,030h,034h,03dh,0e1h,0fbh	; aca3  xa'04=..

; ----------------------------------------------------------------------
; DATOS mensaje_ACAB: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (21 bytes)
;   0xacab..0xacc0  (21 bytes)
DATA_mensaje_ACAB:
	defb 076h,026h,048h,0e5h,086h,09fh,053h,02eh,052h,039h,03ah,0beh,0b4h,0adh,05dh,038h	; acab  v&H...S.R9:...]8
	defb 03eh,0e4h,0e4h,0e4h,0fbh	; acbb

; ----------------------------------------------------------------------
; DATOS mensaje_ACC0: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (15 bytes)
;   0xacc0..0xaccf  (15 bytes)
DATA_mensaje_ACC0:
	defb 078h,043h,06ch,0e5h,081h,0a1h,0ebh,0b4h,053h,035h,053h,071h,037h,0e1h,0fbh	; acc0  xCl.....S5Sq7..

; ----------------------------------------------------------------------
; DATOS mensaje_ACCF: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (21 bytes)
;   0xaccf..0xace4  (21 bytes)
DATA_mensaje_ACCF:
	defb 003h,076h,047h,071h,038h,03eh,048h,02ch,0b2h,082h,0a7h,0d1h,082h,031h,04eh,062h	; accf  .vGq8>H,.....1Nb
	defb 04ah,02ah,071h,034h,0fbh	; acdf

; ----------------------------------------------------------------------
; DATOS mensaje_ACE4: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (31 bytes)
;   0xace4..0xad03  (31 bytes)
DATA_mensaje_ACE4:
	defb 078h,01dh,018h,00bh,015h,00fh,0e5h,09eh,0a8h,09bh,0f8h,054h,0f8h,023h,03dh,02eh	; ace4  x..........T.#=.
	defb 038h,05dh,02dh,061h,0e4h,0e4h,0e4h,0feh,0bfh,0b4h,04bh,030h,026h,050h,0fbh	; acf4  8]-a......K0&P.

; ----------------------------------------------------------------------
; DATOS mensaje_AD03: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (22 bytes)
;   0xad03..0xad19  (22 bytes)
DATA_mensaje_AD03:
	defb 002h,076h,04bh,030h,026h,0e1h,0feh,08dh,0cfh,08bh,0d2h,087h,053h,038h,04eh,034h	; ad03  .vK0&.......S8N4
	defb 071h,037h,0e4h,0e4h,0e4h,0fbh	; ad13

; ----------------------------------------------------------------------
; DATOS mensaje_AD19: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (74 bytes)
;   0xad19..0xad63  (74 bytes)
DATA_mensaje_AD19:
	defb 078h,025h,071h,034h,050h,02dh,059h,072h,039h,026h,03dh,04ah,0e6h,0feh,0e4h,0e4h	; ad19  x%q4P-Yr9&=J....
	defb 0e4h,085h,0a9h,061h,02eh,02ah,03ah,085h,0adh,086h,0adh,02fh,04eh,037h,04dh,052h	; ad29  ...a.*:..../N7MR
	defb 05dh,02dh,061h,0feh,0e4h,0e4h,0e4h,0bbh,0adh,08bh,0d2h,0bdh,093h,051h,038h,062h	; ad39  ]-a..........Q8b
	defb 030h,034h,04bh,030h,026h,03dh,0e6h,0feh,039h,03ah,02ah,037h,053h,02ah,04ch,053h	; ad49  04K0&=..9:*7S*LS
	defb 02ah,02ah,04eh,037h,026h,04dh,03eh,05ah,04ah,0fbh	; ad59  **N7&M>ZJ.

; ----------------------------------------------------------------------
; DATOS mensaje_AD63: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (15 bytes)
;   0xad63..0xad72  (15 bytes)
DATA_mensaje_AD63:
	defb 003h,076h,099h,093h,0e1h,0e4h,0e4h,0e4h,0f8h,01ch,061h,02eh,03ah,0e1h,0fbh	; ad63  .v........a.:..

; ----------------------------------------------------------------------
; DATOS mensaje_AD72: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (62 bytes)
;   0xad72..0xadb0  (62 bytes)
DATA_mensaje_AD72:
	defb 078h,033h,04eh,053h,0f8h,018h,036h,02dh,034h,052h,05dh,02dh,061h,047h,027h,035h	; ad72  x3NS..6-4R]-aG'5
	defb 074h,071h,038h,03dh,038h,02eh,04fh,0feh,060h,03ah,056h,04bh,04eh,035h,072h,071h	; ad82  tq8=8.O.`:VKN5rq
	defb 037h,0e4h,0e4h,0e4h,0feh,08fh,0abh,0ebh,0beh,0a8h,03dh,083h,0a9h,0c0h,0ebh,08fh	; ad92  7.........=.....
	defb 0ebh,02eh,027h,051h,03dh,066h,071h,037h,026h,071h,0feh,034h,050h,0fbh	; ada2  ..'Q=fq7&q.4P.

; ----------------------------------------------------------------------
; DATOS mensaje_ADB0: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (11 bytes)
;   0xadb0..0xadbb  (11 bytes)
DATA_mensaje_ADB0:
	defb 002h,076h,084h,087h,0b4h,0d2h,082h,02ah,0e1h,0e0h,0fbh	; adb0  .v.....*...

; ----------------------------------------------------------------------
; DATOS mensaje_ADBB: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (61 bytes)
;   0xadbb..0xadf8  (61 bytes)
DATA_mensaje_ADBB:
	defb 078h,02eh,02eh,03dh,0f8h,07bh,0f8h,046h,047h,09ah,0cfh,08bh,03ah,039h,071h,037h	; adbb  x..=.{.FG...:9q7
	defb 02fh,053h,030h,037h,026h,04dh,050h,0e6h,0feh,085h,0a9h,04bh,04ah,04ch,03eh,048h	; adcb  /S07&MP....KJL>H
	defb 02ch,036h,02ah,043h,028h,039h,026h,038h,0e5h,09eh,0a8h,09bh,0f8h,054h,0f8h,023h	; addb  ,6*C(9&8.....T.#
	defb 0feh,03dh,0a4h,081h,081h,091h,03dh,037h,053h,02ah,04ch,04ah,0fbh	; adeb  .=....=7S*LJ.

; ----------------------------------------------------------------------
; DATOS mensaje_ADF8: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (20 bytes)
;   0xadf8..0xae0c  (20 bytes)
DATA_mensaje_ADF8:
	defb 076h,099h,093h,02fh,053h,030h,02ah,0e1h,0e4h,0e4h,0e4h,086h,09fh,03eh,061h,027h	; adf8  v../S0*......>a'
	defb 031h,04dh,0e1h,0fbh	; ae08

; ----------------------------------------------------------------------
; DATOS mensaje_AE0C: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (94 bytes)
;   0xae0c..0xae6a  (94 bytes)
DATA_mensaje_AE0C:
	defb 078h,050h,034h,030h,0e5h,0f8h,041h,060h,043h,038h,026h,03ah,039h,04dh,050h,0e6h	; ae0c  xP40..A`C8&:9MP.
	defb 0feh,047h,027h,031h,02eh,030h,0b4h,0d2h,082h,09dh,082h,051h,025h,036h,046h,034h	; ae1c  .G'1.0.....Q%6F4
	defb 026h,030h,03ch,0e6h,0feh,09ah,0d2h,082h,085h,0f8h,007h,053h,071h,037h,04dh,03dh	; ae2c  &0<........Sq7M=
	defb 04ah,0e6h,02eh,02eh,052h,038h,02eh,0e4h,0e4h,0e4h,0feh,033h,04eh,03ah,0e5h,02eh	; ae3c  J...R8.....3N:..
	defb 052h,039h,0f8h,067h,03ah,025h,071h,034h,052h,060h,031h,047h,03dh,0e6h,0fdh,02eh	; ae4c  R9.g:%q4R`1G=...
	defb 03dh,043h,043h,060h,03eh,029h,02fh,043h,04bh,039h,026h,050h,0e0h,0fbh	; ae5c  =CC`>)/CK9&P..

; ----------------------------------------------------------------------
; DATOS mensaje_AE6A: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (19 bytes)
;   0xae6a..0xae7d  (19 bytes)
DATA_mensaje_AE6A:
	defb 076h,02eh,02eh,04fh,05fh,04ah,026h,039h,0e4h,0e4h,0e4h,0a0h,0a7h,03eh,031h,04dh	; ae6a  v..O_J&9.....>1M
	defb 039h,04ah,0fbh	; ae7a

; ----------------------------------------------------------------------
; DATOS mensaje_AE7D: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (44 bytes)
;   0xae7d..0xaea9  (44 bytes)
DATA_mensaje_AE7D:
	defb 078h,093h,082h,090h,0d2h,082h,02fh,04eh,04dh,038h,026h,02dh,039h,026h,02ah,04bh	; ae7d  x...../NM8&-9&*K
	defb 08bh,0d1h,082h,099h,08ch,082h,0feh,02ah,028h,04dh,050h,03ch,0e6h,0feh,002h,005h	; ae8d  .......*(MP<....
	defb 001h,0e4h,008h,007h,03ch,0e6h,01dh,018h,00bh,015h,00fh,0fbh	; ae9d  ....<.......

; ----------------------------------------------------------------------
; DATOS mensaje_AEA9: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (34 bytes)
;   0xaea9..0xaecb  (34 bytes)
DATA_mensaje_AEA9:
	defb 078h,033h,04eh,02ah,04bh,0e5h,085h,0ebh,0bch,051h,089h,0c4h,0ebh,030h,037h,029h	; aea9  x3N*K....Q...07)
	defb 026h,034h,050h,0e6h,0feh,085h,0ebh,0bch,005h,0e5h,036h,02ah,071h,037h,0e4h,0e4h	; aeb9  &4P.......6*q7..
	defb 0e4h,0fbh	; aec9

; ----------------------------------------------------------------------
; DATOS mensaje_AECB: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (20 bytes)
;   0xaecb..0xaedf  (20 bytes)
DATA_mensaje_AECB:
	defb 078h,059h,072h,025h,03ch,0e5h,01dh,018h,00bh,015h,00fh,0e4h,0e4h,0e4h,043h,034h	; aecb  xYr%<.........C4
	defb 025h,038h,060h,0fbh	; aedb

; ----------------------------------------------------------------------
; DATOS mensaje_AEDF: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (8 bytes)
;   0xaedf..0xaee7  (8 bytes)
DATA_mensaje_AEDF:
	defb 002h,076h,09dh,0ebh,0a7h,0ebh,0e0h,0fbh	; aedf  .v......

; ----------------------------------------------------------------------
; DATOS mensaje_AEE7: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (9 bytes)
;   0xaee7..0xaef0  (9 bytes)
DATA_mensaje_AEE7:
	defb 003h,078h,028h,071h,0e1h,0e4h,0e4h,0e4h,0fbh	; aee7  .x(q.....

; ----------------------------------------------------------------------
; DATOS mensaje_AEF0: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (24 bytes)
;   0xaef0..0xaf08  (24 bytes)
DATA_mensaje_AEF0:
	defb 076h,0f8h,01ch,03dh,03eh,0e5h,0f8h,07ah,0f8h,052h,0f8h,059h,0f8h,023h,03dh,050h	; aef0  v..=>..z.R.Y.#=P
	defb 02ah,04eh,03dh,089h,093h,0bdh,05dh,0fbh	; af00  *N=...].

; ----------------------------------------------------------------------
; DATOS mensaje_AF08: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (27 bytes)
;   0xaf08..0xaf23  (27 bytes)
DATA_mensaje_AF08:
	defb 078h,0e4h,0e4h,0e4h,059h,072h,025h,0e5h,0f8h,021h,034h,035h,03eh,0e1h,0feh,0e4h	; af08  x...Yr%..!45>...
	defb 0e4h,0e4h,039h,052h,037h,0f8h,019h,027h,03dh,0e1h,0fbh	; af18  ..9R7..'=..

; ----------------------------------------------------------------------
; DATOS mensaje_AF23: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (19 bytes)
;   0xaf23..0xaf36  (19 bytes)
DATA_mensaje_AF23:
	defb 003h,076h,026h,02bh,037h,026h,04eh,062h,026h,036h,060h,047h,025h,028h,04dh,0e4h	; af23  .v&+7&Nb&6`G%(M.
	defb 0e4h,0e4h,0fbh	; af33

; ----------------------------------------------------------------------
; DATOS mensaje_AF36: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (12 bytes)
;   0xaf36..0xaf42  (12 bytes)
DATA_mensaje_AF36:
	defb 003h,078h,0e4h,0e4h,0e4h,0e4h,050h,02ah,071h,034h,050h,0fbh	; af36  .x....P*q4P.

; ----------------------------------------------------------------------
; DATOS resto_AF42: lo apuntan con el banco puesto p00:4151 (0xB000); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p00:4151 (663 bytes)
;   0xaf42..0xb1d9  (663 bytes)
DATA_resto_AF42:
	defb 003h,076h,02eh,035h,04bh,01dh,018h,00bh,015h,00fh,0e4h,0e4h,0e4h,0feh,0f8h,03bh	; af42  .v.5K...........
	defb 0f8h,049h,0c7h,081h,0adh,093h,03ah,093h,082h,090h,0d0h,087h,0fbh,003h,077h,01dh	; af52  .I....:.......w.
	defb 018h,00bh,015h,00fh,0e4h,0e4h,0e4h,025h,026h,02ah,050h,04bh,05ah,0e5h,0feh,0f8h	; af62  .......%&*PKZ...
	defb 028h,0f8h,069h,0f8h,07dh,04ch,05dh,039h,0fbh,003h,077h,04ah,030h,0e4h,0e4h,0e4h	; af72  (.i.}L]9..wJ0...
	defb 019h,01ah,00fh,01ch,00bh,01eh,013h,019h,018h,0feh,013h,018h,01eh,01ch,01fh,00eh	; af82  ................
	defb 00fh,000h,010h,001h,002h,005h,085h,081h,08bh,0fdh,047h,027h,026h,035h,061h,0e5h	; af92  ..........G'&5a.
	defb 085h,087h,095h,0adh,031h,04dh,0e6h,02bh,044h,03dh,0feh,095h,0adh,0a0h,03eh,0b3h	; afa2  ....1M.+D=....>.
	defb 0adh,0b4h,0bdh,0ebh,0a6h,0adh,0bch,03ah,0f8h,03bh,0f8h,049h,0e5h,0feh,0a6h,090h	; afb2  .......:...I....
	defb 02fh,04eh,037h,026h,04dh,090h,0cbh,089h,03dh,0f8h,038h,0f8h,05ch,0f8h,00fh,0f8h	; afc2  /N7&M...=.8.\...
	defb 01ah,086h,0feh,084h,0e4h,09eh,0a8h,09bh,051h,0b8h,0cfh,08bh,0d1h,031h,04dh,02eh	; afd2  ........Q....1M.
	defb 038h,0fdh,01dh,018h,00bh,015h,00fh,0e5h,089h,0adh,085h,081h,03dh,08bh,0adh,09ch	; afe2  8...........=...
	defb 081h,086h,0feh,0f8h,057h,0f8h,043h,03eh,052h,03dh,027h,08dh,0adh,08ah,0ebh,03dh	; aff2  ....W.C>R='....=
	defb 08ch,081h,0cfh,090h,051h,0feh,0f8h,049h,04eh,037h,044h,04fh,0fbh,003h,076h,0a6h	; b002  ....Q..IN7DO..v.
	defb 0b4h,0d0h,0ebh,0e4h,0e4h,0e4h,08ch,081h,0cfh,090h,051h,026h,04eh,04dh,0ffh,003h	; b012  ..........Q&NM..
	defb 077h,02eh,03dh,0a9h,0ebh,0b8h,0ebh,0f8h,02eh,03dh,030h,04fh,026h,089h,082h,092h	; b022  w.=......=0O&...
	defb 0adh,053h,0feh,092h,086h,03dh,081h,0adh,083h,081h,0e6h,025h,02ah,026h,089h,082h	; b032  .S...=.....%*&..
	defb 092h,0adh,053h,0feh,02bh,044h,03dh,081h,090h,05dh,0e6h,0fbh,003h,077h,02eh,03dh	; b042  ..S.+D=..]...w.=
	defb 0a9h,0ebh,0b8h,0ebh,03eh,0f8h,057h,0f8h,043h,03eh,052h,03dh,027h,03dh,042h,02ah	; b052  ....>.W.C>R='=B*
	defb 0feh,0e5h,0f8h,00eh,030h,073h,08dh,0adh,08ah,0ebh,053h,094h,081h,0b7h,082h,02fh	; b062  ....0s....S..../
	defb 04eh,037h,0feh,026h,04dh,0e6h,09fh,090h,03dh,086h,088h,0adh,03ah,034h,026h,030h	; b072  N7.&M...=...:4&0
	defb 037h,088h,081h,0feh,089h,087h,030h,037h,02ch,04eh,04dh,03eh,05ah,05dh,0fbh,002h	; b082  7.....07,NM>Z]..
	defb 076h,0a9h,0ebh,0b8h,0ebh,03dh,0f8h,06dh,02eh,027h,0a9h,0adh,0b4h,03eh,0e1h,0fbh	; b092  v....=.m.'...>..
	defb 003h,077h,0f8h,01ch,0e5h,02bh,044h,053h,0f8h,018h,037h,026h,04dh,033h,03dh,043h	; b0a2  .w...+DS..7&M3=C
	defb 043h,0e4h,0e4h,0e4h,0feh,0f8h,027h,0f8h,010h,051h,0f8h,046h,0f8h,031h,038h,030h	; b0b2  C.....'..Q.F.180
	defb 034h,00ah,0f8h,00ah,046h,052h,0f8h,010h,0e6h,0feh,034h,05dh,030h,0e5h,032h,043h	; b0c2  4...FR....4]0.2C
	defb 026h,0f8h,02ah,0f8h,04eh,060h,03eh,02bh,02ah,039h,026h,02ah,0feh,047h,030h,04eh	; b0d2  &.*.N`>+*9&*.G0N
	defb 039h,026h,0e6h,0fdh,02fh,04bh,03ah,092h,086h,03ah,0f8h,056h,0f8h,018h,02fh,04eh	; b0e2  9&../K:..:.V../N
	defb 034h,0f8h,02fh,0f8h,01bh,047h,0a9h,0ebh,0feh,0b8h,0ebh,03eh,036h,02ah,028h,039h	; b0f2  4./..G.....>6*(9
	defb 026h,0e6h,092h,086h,051h,09fh,098h,09bh,08ch,0feh,086h,0ebh,0e4h,0a7h,0d1h,082h	; b102  &...Q...........
	defb 08bh,060h,085h,087h,0a6h,0adh,031h,04dh,034h,046h,0feh,05dh,0fbh,003h,076h,050h	; b112  .`....1M4F.]..vP
	defb 02ah,071h,034h,0e6h,0feh,0e4h,0e4h,0e4h,09eh,0a8h,09bh,0f8h,054h,0f8h,023h,03dh	; b122  *q4.........T.#=
	defb 081h,090h,03eh,0e1h,0fbh,003h,077h,027h,045h,0e4h,0e4h,0e4h,09eh,0a8h,09bh,0f8h	; b132  ..>...w'E.......
	defb 054h,0f8h,023h,03dh,029h,02ch,062h,03ah,0f8h,056h,0feh,030h,052h,02bh,053h,027h	; b142  T.#=),b:.V.0R+S'
	defb 046h,02eh,043h,04eh,037h,026h,04dh,0e6h,0fdh,08dh,0cfh,086h,0adh,031h,04eh,062h	; b152  F.CN7&M......1Nb
	defb 02bh,044h,03dh,0a9h,0ebh,0b8h,0ebh,0f8h,02eh,03ah,0feh,093h,082h,083h,081h,02fh	; b162  +D=......:...../
	defb 04eh,04dh,03eh,05ah,05dh,0e6h,0feh,025h,02ah,026h,089h,082h,092h,0adh,05dh,0fbh	; b172  NM>Z]..%*&....].
	defb 002h,076h,036h,043h,04ch,025h,02ah,026h,089h,082h,092h,0adh,051h,02fh,053h,032h	; b182  .v6CL%*&....Q/S2
	defb 062h,026h,0feh,026h,052h,05dh,039h,0e4h,0e4h,0e4h,0fbh,003h,077h,01dh,018h,00bh	; b192  b&.&R]9.....w...
	defb 015h,00fh,0e4h,0e4h,0e4h,0feh,0f8h,01ch,057h,03dh,091h,082h,08bh,0adh,03eh,08bh	; b1a2  ........W=....>.
	defb 0d1h,082h,099h,08ch,082h,0feh,002h,005h,001h,0e4h,009h,006h,060h,029h,02eh,039h	; b1b2  ............`).9
	defb 027h,0e6h,0fdh,0e4h,0e4h,0e4h,089h,082h,082h,0adh,051h,026h,03dh,04dh,0feh,0e4h	; b1c2  '.........Q&=M..
	defb 0e4h,0e4h,019h,020h,00fh,01ch,0fbh	; b1d2

; ----------------------------------------------------------------------
; DATOS letrero_B1D9: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p01:6328 (11 bytes)
;   0xb1d9..0xb1e4  (11 bytes)
DATA_letrero_B1D9:
	defb 051h,0e5h,095h,0d1h,082h,08bh,0d1h,030h,034h,0e6h,0ffh	; b1d9  Q......04..

; ----------------------------------------------------------------------
; DATOS letrero_B1E4: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p01:635C (21 bytes)
;   0xb1e4..0xb1f9  (21 bytes)
DATA_letrero_B1E4:
	defb 030h,02ah,030h,0e5h,036h,02ah,026h,044h,035h,053h,0feh,039h,026h,03dh,060h,031h	; b1e4  0*0.6*&D5S.9&=`1
	defb 037h,04ah,027h,0e0h,0ffh	; b1f4

; ----------------------------------------------------------------------
; DATOS letrero_B1F9: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (7 bytes)
;   0xb1f9..0xb200  (7 bytes)
DATA_letrero_B1F9:
	defb 08ah,085h,094h,03dh,09dh,097h,0ffh	; b1f9

; ----------------------------------------------------------------------
; DATOS letrero_B200: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (6 bytes)
;   0xb200..0xb206  (6 bytes)
DATA_letrero_B200:
	defb 099h,093h,03dh,09bh,0adh,0ffh	; b200

; ----------------------------------------------------------------------
; DATOS letrero_B206: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (8 bytes)
;   0xb206..0xb20e  (8 bytes)
DATA_letrero_B206:
	defb 09ch,0beh,03dh,096h,088h,0aeh,0a6h,0ffh	; b206  ..=.....

; ----------------------------------------------------------------------
; DATOS letrero_B20E: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (10 bytes)
;   0xb20e..0xb218  (10 bytes)
DATA_letrero_B20E:
	defb 09eh,097h,086h,0adh,03dh,044h,054h,027h,060h,0ffh	; b20e  ....=DT'`.

; ----------------------------------------------------------------------
; DATOS letrero_B218: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (8 bytes)
;   0xb218..0xb220  (8 bytes)
DATA_letrero_B218:
	defb 097h,0b5h,09fh,03dh,030h,053h,026h,0ffh	; b218  ...=0S&.

; ----------------------------------------------------------------------
; DATOS letrero_B220: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (10 bytes)
;   0xb220..0xb22a  (10 bytes)
DATA_letrero_B220:
	defb 0bdh,0b0h,090h,0cbh,0cfh,087h,0a7h,08ch,093h,0ffh	; b220  ..........

; ----------------------------------------------------------------------
; DATOS letrero_B22A: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (9 bytes)
;   0xb22a..0xb233  (9 bytes)
DATA_letrero_B22A:
	defb 08fh,0bdh,089h,03dh,031h,026h,053h,04bh,0ffh	; b22a  ...=1&SK.

; ----------------------------------------------------------------------
; DATOS letrero_B233: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (7 bytes)
;   0xb233..0xb23a  (7 bytes)
DATA_letrero_B233:
	defb 0bdh,094h,094h,03dh,02ah,050h,0ffh	; b233

; ----------------------------------------------------------------------
; DATOS letrero_B23A: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (10 bytes)
;   0xb23a..0xb244  (10 bytes)
DATA_letrero_B23A:
	defb 089h,094h,09fh,000h,0c3h,0a6h,0b8h,081h,0a0h,0ffh	; b23a  ..........

; ----------------------------------------------------------------------
; DATOS letrero_B244: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (10 bytes)
;   0xb244..0xb24e  (10 bytes)
DATA_letrero_B244:
	defb 0bch,0a7h,0adh,087h,03dh,080h,086h,0beh,0adh,0ffh	; b244  ....=.....

; ----------------------------------------------------------------------
; DATOS tabla_B24E: 59 punteros a letreros (cabecera 0x800A del banco 50); lo
;   leen p01:61E6 (118 bytes)
;   0xb24e..0xb2c4  (118 bytes)
DATA_tabla_B24E:
	defw 0b2c4h,0b2cah,0b2d2h,0b2d2h,0b2d8h,0b2e1h,0b2eah,0b2f6h	; b24e
	defw 0b2fah,0b306h,0b30eh,0b312h,0b317h,0b31ch,0b323h,0b327h	; b25e
	defw 0b32fh,0b336h,0b33ch,0b345h,0b345h,0b34ch,0b354h,0b35ch	; b26e
	defw 0b362h,0b366h,0b36ch,0b374h,0b374h,0b37ah,0b37fh,0b387h	; b27e
	defw 0b38fh,0b398h,0b39eh,0b3a4h,0b3aah,0b3b0h,0b3b6h,0b3bch	; b28e
	defw 0b3c2h,0b3c8h,0b3ceh,0b3ceh,0b3d3h,0b3dah,0b3e3h,0b3ech	; b29e
	defw 0b3f5h,0b1f9h,0b200h,0b206h,0b20eh,0b218h,0b220h,0b22ah	; b2ae
	defw 0b233h,0b23ah,0b244h	; b2be  -> DATA_letrero_B233 DATA_letrero_B23A DATA_letrero_B244

; ----------------------------------------------------------------------
; DATOS letrero_B2C4: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (6 bytes)
;   0xb2c4..0xb2ca  (6 bytes)
DATA_letrero_B2C4:
	defb 099h,0adh,0bch,0aeh,0adh,0ffh	; b2c4

; ----------------------------------------------------------------------
; DATOS letrero_B2CA: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (8 bytes)
;   0xb2ca..0xb2d2  (8 bytes)
DATA_letrero_B2CA:
	defb 08ah,0bfh,09eh,08bh,0adh,0aeh,0adh,0ffh	; b2ca  ........

; ----------------------------------------------------------------------
; DATOS letrero_B2D2: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (6 bytes)
;   0xb2d2..0xb2d8  (6 bytes)
DATA_letrero_B2D2:
	defb 0b0h,0a9h,097h,0ebh,0bch,0ffh	; b2d2

; ----------------------------------------------------------------------
; DATOS letrero_B2D8: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (9 bytes)
;   0xb2d8..0xb2e1  (9 bytes)
DATA_letrero_B2D8:
	defb 08fh,081h,087h,082h,09fh,08ah,081h,0a8h,0ffh	; b2d8  .........

; ----------------------------------------------------------------------
; DATOS letrero_B2E1: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (9 bytes)
;   0xb2e1..0xb2ea  (9 bytes)
DATA_letrero_B2E1:
	defb 0a7h,0a2h,089h,0adh,09fh,08ah,081h,0a8h,0ffh	; b2e1  .........

; ----------------------------------------------------------------------
; DATOS letrero_B2EA: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (12 bytes)
;   0xb2ea..0xb2f6  (12 bytes)
DATA_letrero_B2EA:
	defb 0c5h,0a6h,08ch,090h,0cfh,087h,0e4h,0bdh,087h,0b8h,0adh,0ffh	; b2ea  ............

; ----------------------------------------------------------------------
; DATOS letrero_B2F6: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (4 bytes)
;   0xb2f6..0xb2fa  (4 bytes)
DATA_letrero_B2F6:
	defb 0b4h,0a6h,081h,0ffh	; b2f6

; ----------------------------------------------------------------------
; DATOS letrero_B2FA: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (12 bytes)
;   0xb2fa..0xb306  (12 bytes)
DATA_letrero_B2FA:
	defb 085h,0a2h,09bh,0a6h,0ebh,0b4h,0d1h,0e4h,09eh,0cfh,093h,0ffh	; b2fa  ............

; ----------------------------------------------------------------------
; DATOS letrero_B306: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (8 bytes)
;   0xb306..0xb30e  (8 bytes)
DATA_letrero_B306:
	defb 0a0h,0a7h,0d2h,087h,085h,0aeh,08ch,0ffh	; b306  ........

; ----------------------------------------------------------------------
; DATOS letrero_B30E: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (4 bytes)
;   0xb30e..0xb312  (4 bytes)
DATA_letrero_B30E:
	defb 09eh,082h,08ch,0ffh	; b30e

; ----------------------------------------------------------------------
; DATOS letrero_B312: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (5 bytes)
;   0xb312..0xb317  (5 bytes)
DATA_letrero_B312:
	defb 0a6h,081h,08fh,0ebh,0ffh	; b312

; ----------------------------------------------------------------------
; DATOS letrero_B317: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (5 bytes)
;   0xb317..0xb31c  (5 bytes)
DATA_letrero_B317:
	defb 0abh,081h,0a3h,0ebh,0ffh	; b317

; ----------------------------------------------------------------------
; DATOS letrero_B31C: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (7 bytes)
;   0xb31c..0xb323  (7 bytes)
DATA_letrero_B31C:
	defb 08ah,081h,0a9h,0adh,08ah,0ebh,0ffh	; b31c

; ----------------------------------------------------------------------
; DATOS letrero_B323: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (4 bytes)
;   0xb323..0xb327  (4 bytes)
DATA_letrero_B323:
	defb 08fh,0bdh,089h,0ffh	; b323

; ----------------------------------------------------------------------
; DATOS letrero_B327: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (8 bytes)
;   0xb327..0xb32f  (8 bytes)
DATA_letrero_B327:
	defb 08eh,082h,0aeh,0adh,086h,0d2h,082h,0ffh	; b327  ........

; ----------------------------------------------------------------------
; DATOS letrero_B32F: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (7 bytes)
;   0xb32f..0xb336  (7 bytes)
DATA_letrero_B32F:
	defb 094h,081h,093h,0beh,0d1h,080h,0ffh	; b32f

; ----------------------------------------------------------------------
; DATOS letrero_B336: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (6 bytes)
;   0xb336..0xb33c  (6 bytes)
DATA_letrero_B336:
	defb 0aeh,08ch,09eh,08ch,087h,0ffh	; b336

; ----------------------------------------------------------------------
; DATOS letrero_B33C: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (9 bytes)
;   0xb33c..0xb345  (9 bytes)
DATA_letrero_B33C:
	defb 0c1h,0bbh,081h,0e4h,080h,0ebh,09eh,0ebh,0ffh	; b33c  .........

; ----------------------------------------------------------------------
; DATOS letrero_B345: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (7 bytes)
;   0xb345..0xb34c  (7 bytes)
DATA_letrero_B345:
	defb 08ah,0adh,08eh,0c1h,0adh,0c0h,0ffh	; b345

; ----------------------------------------------------------------------
; DATOS letrero_B34C: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (8 bytes)
;   0xb34c..0xb354  (8 bytes)
DATA_letrero_B34C:
	defb 0b4h,0a6h,081h,08fh,0adh,090h,086h,0ffh	; b34c  ........

; ----------------------------------------------------------------------
; DATOS letrero_B354: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (8 bytes)
;   0xb354..0xb35c  (8 bytes)
DATA_letrero_B354:
	defb 099h,0adh,0b0h,0a6h,081h,0b8h,0ebh,0ffh	; b354  ........

; ----------------------------------------------------------------------
; DATOS letrero_B35C: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (6 bytes)
;   0xb35c..0xb362  (6 bytes)
DATA_letrero_B35C:
	defb 0b8h,0adh,0c1h,0ebh,0a8h,0ffh	; b35c

; ----------------------------------------------------------------------
; DATOS letrero_B362: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (4 bytes)
;   0xb362..0xb366  (4 bytes)
DATA_letrero_B362:
	defb 0bdh,088h,091h,0ffh	; b362

; ----------------------------------------------------------------------
; DATOS letrero_B366: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (6 bytes)
;   0xb366..0xb36c  (6 bytes)
DATA_letrero_B366:
	defb 085h,0b6h,0b0h,08ch,0a7h,0ffh	; b366

; ----------------------------------------------------------------------
; DATOS letrero_B36C: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (8 bytes)
;   0xb36c..0xb374  (8 bytes)
DATA_letrero_B36C:
	defb 085h,08dh,0cfh,093h,092h,0ebh,0c5h,0ffh	; b36c  ........

; ----------------------------------------------------------------------
; DATOS letrero_B374: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (6 bytes)
;   0xb374..0xb37a  (6 bytes)
DATA_letrero_B374:
	defb 08fh,09eh,0b2h,000h,0e1h,0ffh	; b374

; ----------------------------------------------------------------------
; DATOS letrero_B37A: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (5 bytes)
;   0xb37a..0xb37f  (5 bytes)
DATA_letrero_B37A:
	defb 0bfh,0aah,0ebh,090h,0ffh	; b37a

; ----------------------------------------------------------------------
; DATOS letrero_B37F: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (8 bytes)
;   0xb37f..0xb387  (8 bytes)
DATA_letrero_B37F:
	defb 0a9h,0cfh,0bch,000h,085h,0ebh,0bch,0ffh	; b37f  ........

; ----------------------------------------------------------------------
; DATOS letrero_B387: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (8 bytes)
;   0xb387..0xb38f  (8 bytes)
DATA_letrero_B387:
	defb 0bfh,0a8h,0ebh,000h,085h,0ebh,0bch,0ffh	; b387  ........

; ----------------------------------------------------------------------
; DATOS letrero_B38F: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (9 bytes)
;   0xb38f..0xb398  (9 bytes)
DATA_letrero_B38F:
	defb 0b0h,0a9h,0ebh,0adh,000h,085h,0ebh,0bch,0ffh	; b38f  .........

; ----------------------------------------------------------------------
; DATOS letrero_B398: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (6 bytes)
;   0xb398..0xb39e  (6 bytes)
DATA_letrero_B398:
	defb 085h,0ebh,0bch,000h,002h,0ffh	; b398

; ----------------------------------------------------------------------
; DATOS letrero_B39E: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (6 bytes)
;   0xb39e..0xb3a4  (6 bytes)
DATA_letrero_B39E:
	defb 085h,0ebh,0bch,000h,003h,0ffh	; b39e

; ----------------------------------------------------------------------
; DATOS letrero_B3A4: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (6 bytes)
;   0xb3a4..0xb3aa  (6 bytes)
DATA_letrero_B3A4:
	defb 085h,0ebh,0bch,000h,004h,0ffh	; b3a4

; ----------------------------------------------------------------------
; DATOS letrero_B3AA: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (6 bytes)
;   0xb3aa..0xb3b0  (6 bytes)
DATA_letrero_B3AA:
	defb 085h,0ebh,0bch,000h,005h,0ffh	; b3aa

; ----------------------------------------------------------------------
; DATOS letrero_B3B0: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (6 bytes)
;   0xb3b0..0xb3b6  (6 bytes)
DATA_letrero_B3B0:
	defb 085h,0ebh,0bch,000h,006h,0ffh	; b3b0

; ----------------------------------------------------------------------
; DATOS letrero_B3B6: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (6 bytes)
;   0xb3b6..0xb3bc  (6 bytes)
DATA_letrero_B3B6:
	defb 085h,0ebh,0bch,000h,007h,0ffh	; b3b6

; ----------------------------------------------------------------------
; DATOS letrero_B3BC: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (6 bytes)
;   0xb3bc..0xb3c2  (6 bytes)
DATA_letrero_B3BC:
	defb 085h,0ebh,0bch,000h,008h,0ffh	; b3bc

; ----------------------------------------------------------------------
; DATOS letrero_B3C2: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (6 bytes)
;   0xb3c2..0xb3c8  (6 bytes)
DATA_letrero_B3C2:
	defb 085h,0ebh,0bch,000h,009h,0ffh	; b3c2

; ----------------------------------------------------------------------
; DATOS letrero_B3C8: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (6 bytes)
;   0xb3c8..0xb3ce  (6 bytes)
DATA_letrero_B3C8:
	defb 085h,0ebh,0bch,000h,00ah,0ffh	; b3c8

; ----------------------------------------------------------------------
; DATOS letrero_B3CE: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (5 bytes)
;   0xb3ce..0xb3d3  (5 bytes)
DATA_letrero_B3CE:
	defb 08ch,0c5h,0a9h,0ebh,0ffh	; b3ce

; ----------------------------------------------------------------------
; DATOS letrero_B3D3: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (7 bytes)
;   0xb3d3..0xb3da  (7 bytes)
DATA_letrero_B3D3:
	defb 085h,0ebh,093h,0a7h,0cfh,0b4h,0ffh	; b3d3

; ----------------------------------------------------------------------
; DATOS letrero_B3DA: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (9 bytes)
;   0xb3da..0xb3e3  (9 bytes)
DATA_letrero_B3DA:
	defb 00ch,002h,000h,0a9h,0ebh,08bh,0d2h,0adh,0ffh	; b3da  .........

; ----------------------------------------------------------------------
; DATOS letrero_B3E3: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (9 bytes)
;   0xb3e3..0xb3ec  (9 bytes)
DATA_letrero_B3E3:
	defb 00ch,003h,000h,0a9h,0ebh,08bh,0d2h,0adh,0ffh	; b3e3  .........

; ----------------------------------------------------------------------
; DATOS letrero_B3EC: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (9 bytes)
;   0xb3ec..0xb3f5  (9 bytes)
DATA_letrero_B3EC:
	defb 00ch,004h,000h,0a9h,0ebh,08bh,0d2h,0adh,0ffh	; b3ec  .........

; ----------------------------------------------------------------------
; DATOS letrero_B3F5: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (5 bytes)
;   0xb3f5..0xb3fa  (5 bytes)
DATA_letrero_B3F5:
	defb 0b8h,0adh,0a3h,087h,0ffh	; b3f5

; ----------------------------------------------------------------------
; DATOS tabla_B3FA: 21 punteros a letreros (cabecera 0x8004 del banco 50); lo
;   leen p01:61E6 (42 bytes)
;   0xb3fa..0xb424  (42 bytes)
DATA_tabla_B3FA:
	defw 0b424h,0b42ah,0b430h,0b435h,0b43ah,0b43fh,0b444h,0b44ah	; b3fa
	defw 0b44eh,0b452h,0b456h,0b45bh,0b461h,0b465h,0b46bh,0b46fh	; b40a
	defw 0b473h,0b479h,0b47fh,0b483h,0b429h	; b41a

; ----------------------------------------------------------------------
; DATOS letrero_B424: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; se solapan 2 bloques: (letrero_B429 B429-B42A); lo leen p00:4950 (6
;   bytes)
;   0xb424..0xb42a  (6 bytes)
DATA_letrero_B424:
	defb 01dh,018h,00bh,015h,00fh,0ffh	; b424

; ----------------------------------------------------------------------
; DATOS letrero_B42A: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (6 bytes)
;   0xb42a..0xb430  (6 bytes)
DATA_letrero_B42A:
	defb 086h,0d0h,0adh,0c0h,0a8h,0ffh	; b42a

; ----------------------------------------------------------------------
; DATOS letrero_B430: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (5 bytes)
;   0xb430..0xb435  (5 bytes)
DATA_letrero_B430:
	defb 09dh,0ebh,0a7h,0ebh,0ffh	; b430

; ----------------------------------------------------------------------
; DATOS letrero_B435: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (5 bytes)
;   0xb435..0xb43a  (5 bytes)
DATA_letrero_B435:
	defb 09eh,08ch,08fh,0ebh,0ffh	; b435

; ----------------------------------------------------------------------
; DATOS letrero_B43A: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (5 bytes)
;   0xb43a..0xb43f  (5 bytes)
DATA_letrero_B43A:
	defb 098h,0a8h,0bbh,0adh,0ffh	; b43a

; ----------------------------------------------------------------------
; DATOS letrero_B43F: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (5 bytes)
;   0xb43f..0xb444  (5 bytes)
DATA_letrero_B43F:
	defb 088h,08ch,0a6h,0ebh,0ffh	; b43f

; ----------------------------------------------------------------------
; DATOS letrero_B444: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (6 bytes)
;   0xb444..0xb44a  (6 bytes)
DATA_letrero_B444:
	defb 094h,08fh,0ebh,08bh,0d0h,0ffh	; b444

; ----------------------------------------------------------------------
; DATOS letrero_B44A: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (4 bytes)
;   0xb44a..0xb44e  (4 bytes)
DATA_letrero_B44A:
	defb 09eh,0a8h,09bh,0ffh	; b44a

; ----------------------------------------------------------------------
; DATOS letrero_B44E: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (4 bytes)
;   0xb44e..0xb452  (4 bytes)
DATA_letrero_B44E:
	defb 0c6h,093h,0aah,0ffh	; b44e

; ----------------------------------------------------------------------
; DATOS letrero_B452: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (4 bytes)
;   0xb452..0xb456  (4 bytes)
DATA_letrero_B452:
	defb 010h,019h,022h,0ffh	; b452

; ----------------------------------------------------------------------
; DATOS letrero_B456: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (5 bytes)
;   0xb456..0xb45b  (5 bytes)
DATA_letrero_B456:
	defb 00ch,019h,01dh,01dh,0ffh	; b456

; ----------------------------------------------------------------------
; DATOS letrero_B45B: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (6 bytes)
;   0xb45b..0xb461  (6 bytes)
DATA_letrero_B45B:
	defb 00ch,016h,00bh,00dh,015h,0ffh	; b45b

; ----------------------------------------------------------------------
; DATOS letrero_B461: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (4 bytes)
;   0xb461..0xb465  (4 bytes)
DATA_letrero_B461:
	defb 00dh,019h,01ah,0ffh	; b461

; ----------------------------------------------------------------------
; DATOS letrero_B465: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (6 bytes)
;   0xb465..0xb46b  (6 bytes)
DATA_letrero_B465:
	defb 0a6h,0adh,095h,0adh,0b0h,0ffh	; b465

; ----------------------------------------------------------------------
; DATOS letrero_B46B: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (4 bytes)
;   0xb46b..0xb46f  (4 bytes)
DATA_letrero_B46B:
	defb 01ch,00fh,00eh,0ffh	; b46b

; ----------------------------------------------------------------------
; DATOS letrero_B46F: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (4 bytes)
;   0xb46f..0xb473  (4 bytes)
DATA_letrero_B46F:
	defb 00ch,019h,022h,0ffh	; b46f

; ----------------------------------------------------------------------
; DATOS letrero_B473: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (6 bytes)
;   0xb473..0xb479  (6 bytes)
DATA_letrero_B473:
	defb 0c5h,0a9h,0bbh,08fh,0ebh,0ffh	; b473

; ----------------------------------------------------------------------
; DATOS letrero_B479: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (6 bytes)
;   0xb479..0xb47f  (6 bytes)
DATA_letrero_B479:
	defb 0c3h,081h,0aah,0cfh,093h,0ffh	; b479

; ----------------------------------------------------------------------
; DATOS letrero_B47F: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (4 bytes)
;   0xb47f..0xb483  (4 bytes)
DATA_letrero_B47F:
	defb 02eh,061h,047h,0ffh	; b47f

; ----------------------------------------------------------------------
; DATOS letrero_B483: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (4 bytes)
;   0xb483..0xb487  (4 bytes)
DATA_letrero_B483:
	defb 041h,026h,030h,0ffh	; b483

; ----------------------------------------------------------------------
; DATOS tabla_mensajes_B487: tabla de 19 punteros (0x9D2C-0x9F7D) a los
;   mensajes de p50:9D2C-9FA8, que tampoco apunta ninguna tabla que se lea;
;   ninguna rutina del listado lee esta tabla
;   0xb487..0xb4ad  (38 bytes)
DATA_tabla_mensajes_B487:
	defb 02ch,09dh,057h,09dh,06ch,09dh,0a5h,09dh,0b5h,09dh,0f8h,09dh,004h,09eh,019h,09eh	; b487  ,.W.l...........
	defb 054h,09eh,06ch,09eh,0a6h,09eh,0bch,09eh,0ceh,09eh,0e4h,09eh,000h,09fh,021h,09fh	; b497  T.l...........!.
	defb 046h,09fh,068h,09fh,07dh,09fh	; b4a7

; ----------------------------------------------------------------------
; DATOS letrero_B4AD: letrero (p00:4918): [fila][columna] y letras; 0xFE otra
;   posicion, 0xFF acaba; lo leen p01:64BD (25 bytes)
;   0xb4ad..0xb4c6  (25 bytes)
DATA_letrero_B4AD:
	defb 030h,008h,021h,00fh,00bh,01ah,019h,018h,000h,01dh,00fh,016h,00fh,00dh,01eh,0feh	; b4ad  0.!.............
	defb 088h,060h,019h,01ah,01eh,013h,019h,018h,0ffh	; b4bd  .`.......

; ----------------------------------------------------------------------
; DATOS letrero_B4C6: letrero (p00:4918): [fila][columna] y letras; 0xFE otra
;   posicion, 0xFF acaba; lo leen p01:64BD (19 bytes)
;   0xb4c6..0xb4d9  (19 bytes)
DATA_letrero_B4C6:
	defb 020h,008h,00fh,01bh,01fh,013h,01ah,017h,00fh,018h,01eh,000h,01dh,00fh,016h,00fh	; b4c6   ...............
	defb 00dh,01eh,0ffh	; b4d6

; ----------------------------------------------------------------------
; DATOS tabla_B4D9: 14 punteros a letreros (cabecera 0x8046 del banco 50); lo
;   leen p01:61E6 (28 bytes)
;   0xb4d9..0xb4f5  (28 bytes)
DATA_tabla_B4D9:
	defw 0b4f5h,0b546h,0b59ah,0b5edh,0b4f5h,0b63bh,0b690h,0b6e7h	; b4d9
	defw 0b70eh,0b808h,0b761h,0b7b3h,0b866h,0b4f5h	; b4e9

; ----------------------------------------------------------------------
; DATOS letrero_B4F5: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (9 bytes)
;   0xb4f5..0xb4fe  (9 bytes)
DATA_letrero_B4F5:
	defb 039h,03ah,047h,039h,026h,000h,0e0h,0e0h,0ffh	; b4f5  9:G9&....

; ----------------------------------------------------------------------
; DATOS tabla_B4FE: 36 punteros a letreros (cabecera 0x8048 del banco 50); lo
;   leen p01:61E6 (72 bytes)
;   0xb4fe..0xb546  (72 bytes)
DATA_tabla_B4FE:
	defw 0b4f5h,0b89ah,0ba39h,0bb19h,0b943h,0b8f2h,0b4f5h,0b9e7h	; b4fe
	defw 0b99fh,0baf4h,0ba77h,0babfh,0bbf4h,0bb84h,0bb5ah,0bb5ah	; b50e
	defw 0bc4eh,0bd04h,0bd25h,0bd46h,0bce7h,0bce7h,0bce7h,0bce7h	; b51e
	defw 0bce7h,0bce7h,0bce7h,0bce7h,0bce7h,0bc94h,0b4f5h,0bbbch	; b52e
	defw 0bd68h,0bdbbh,0be0dh,0b4f5h	; b53e  -> DATA_letrero_BD68 DATA_letrero_BDBB DATA_letrero_BE0D DATA_letrero_B4F5

; ----------------------------------------------------------------------
; DATOS letrero_B546: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (84 bytes)
;   0xb546..0xb59a  (84 bytes)
DATA_letrero_B546:
	defb 099h,0adh,0bch,0aeh,0adh,000h,000h,0e8h,0c0h,0a9h,0cfh,08fh,017h,00ah,003h,010h	; b546  ................
	defb 0e9h,0feh,080h,0a1h,0a7h,085h,0f8h,016h,0f8h,06fh,08dh,081h,08bh,086h,0c4h,08ch	; b556  .........o......
	defb 093h,0a8h,038h,030h,037h,08ah,081h,0a5h,082h,0feh,02fh,04eh,037h,026h,04dh,08dh	; b566  ..807...../N7&M.
	defb 09fh,084h,0ebh,093h,09eh,090h,0cfh,087h,0c4h,08ch,093h,0a8h,0e6h,08ah,081h,0feh	; b576  ................
	defb 0a9h,0adh,08ah,0ebh,08eh,082h,090h,0d0h,087h,085h,0e6h,08fh,09eh,09dh,086h,0d1h	; b586  ................
	defb 082h,085h,0e6h,0ffh	; b596

; ----------------------------------------------------------------------
; DATOS letrero_B59A: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (83 bytes)
;   0xb59a..0xb5ed  (83 bytes)
DATA_letrero_B59A:
	defb 08ah,0bfh,09eh,08bh,0adh,0aeh,0adh,000h,0e8h,081h,0adh,0b0h,0a6h,0a0h,017h,002h	; b59a  ................
	defb 002h,0e9h,0feh,080h,0a1h,0a7h,085h,03dh,089h,0aeh,08fh,088h,081h,0a7h,0d2h,082h	; b5aa  .......=........
	defb 01dh,017h,011h,0e6h,08bh,0d2h,0cfh,093h,0feh,086h,0ebh,051h,029h,030h,036h,05fh	; b5ba  ...........Q)06_
	defb 02dh,04dh,038h,09bh,0a8h,084h,0ebh,093h,03ah,039h,04dh,0e6h,08ah,081h,0feh,0a9h	; b5ca  -M8.....:9M.....
	defb 0adh,08ah,0ebh,08eh,082h,090h,0d0h,087h,085h,0e6h,08fh,09eh,09dh,086h,0d1h,082h	; b5da  ................
	defb 085h,0e6h,0ffh	; b5ea

; ----------------------------------------------------------------------
; DATOS letrero_B5ED: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (78 bytes)
;   0xb5ed..0xb63b  (78 bytes)
DATA_letrero_B5ED:
	defb 0b0h,0a9h,097h,0ebh,0bch,000h,000h,0e8h,017h,007h,009h,0e9h,0feh,080h,0a1h,0a7h	; b5ed  ................
	defb 085h,08dh,081h,0e5h,090h,0d0h,087h,099h,091h,08bh,0adh,085h,0adh,08bh,086h,099h	; b5fd  ................
	defb 09ch,0adh,0feh,08bh,0d1h,0a7h,0d1h,082h,0b8h,0adh,0e6h,0b4h,0a1h,0adh,03ah,093h	; b60d  ..............:.
	defb 082h,08fh,091h,031h,04dh,038h,0bdh,087h,0feh,099h,091h,031h,04dh,0e6h,0a6h,0cfh	; b61d  ...1M8.....1M...
	defb 085h,090h,092h,0adh,03eh,08fh,0ebh,0b1h,0cfh,093h,0f8h,02eh,0e6h,0ffh	; b62d  ....>.........

; ----------------------------------------------------------------------
; DATOS letrero_B63B: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (85 bytes)
;   0xb63b..0xb690  (85 bytes)
DATA_letrero_B63B:
	defb 08fh,081h,087h,082h,09fh,08ah,081h,0a8h,000h,0e8h,08ch,092h,0c9h,0adh,0aeh,0ebh	; b63b  ................
	defb 0e9h,0feh,088h,081h,08fh,081h,08bh,086h,0e5h,08fh,081h,087h,082h,09fh,08ah,081h	; b64b  ................
	defb 0a8h,0e6h,0a9h,0ebh,0b8h,0ebh,0f8h,04eh,0feh,03dh,08bh,0d2h,082h,0b4h,0d1h,0adh	; b65b  .......N.=......
	defb 051h,085h,0ebh,08eh,0a8h,081h,0bch,082h,02fh,032h,0e5h,08bh,0d2h,0cfh,0feh,093h	; b66b  Q......./2......
	defb 086h,0ebh,060h,099h,0cfh,08bh,0d0h,031h,04dh,0e6h,0a9h,0ebh,0b8h,0ebh,0f8h,04eh	; b67b  ..`....1M......N
	defb 085h,098h,082h,0e6h,0ffh	; b68b

; ----------------------------------------------------------------------
; DATOS letrero_B690: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (87 bytes)
;   0xb690..0xb6e7  (87 bytes)
DATA_letrero_B690:
	defb 0a7h,0a2h,089h,0adh,09fh,08ah,081h,0a8h,000h,0e8h,017h,005h,008h,0bch,0a6h,0b2h	; b690  ................
	defb 0adh,0e9h,0feh,08bh,0d1h,0f8h,057h,0a2h,087h,08bh,08dh,0adh,0f8h,022h,0f8h,078h	; b6a0  ......W......".x
	defb 09dh,082h,08bh,086h,03ah,04ah,04ch,099h,0cfh,08bh,0d0h,0feh,0b2h,03dh,09fh,08ah	; b6b0  ....:JL......=..
	defb 081h,0a8h,038h,0a2h,087h,09ah,0d2h,082h,051h,0a2h,087h,08bh,03ah,04ah,04dh,085h	; b6c0  ..8.....Q...:JM.
	defb 0ebh,0feh,08eh,0a8h,08eh,082h,08ah,060h,09dh,082h,089h,082h,051h,08bh,0d1h,082h	; b6d0  .......`....Q...
	defb 08dh,081h,060h,02bh,04dh,0e6h,0ffh	; b6e0

; ----------------------------------------------------------------------
; DATOS letrero_B6E7: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (39 bytes)
;   0xb6e7..0xb70e  (39 bytes)
DATA_letrero_B6E7:
	defb 0c5h,0a6h,08ch,090h,0cfh,087h,0e4h,0bdh,087h,0b8h,0adh,0feh,09ch,0adh,088h,081h	; b6e7  ................
	defb 085h,098h,082h,039h,088h,081h,0feh,0a7h,0d2h,082h,089h,082h,08dh,081h,098h,082h	; b6f7  ...9............
	defb 0bdh,0feh,087h,0a3h,087h,0e6h,0ffh	; b707

; ----------------------------------------------------------------------
; DATOS letrero_B70E: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (83 bytes)
;   0xb70e..0xb761  (83 bytes)
DATA_letrero_B70E:
	defb 0b4h,0a6h,081h,000h,000h,0e8h,017h,000h,008h,009h,0e9h,0feh,08bh,0d2h,0cfh,093h	; b70e  ................
	defb 086h,0ebh,060h,08dh,0cfh,093h,0e5h,09dh,09bh,087h,060h,0f8h,032h,0f8h,02eh,051h	; b71e  ..`.......`.2..Q
	defb 0f8h,07dh,04dh,038h,0feh,085h,081h,08bh,0d1h,082h,0e6h,08fh,0adh,090h,086h,053h	; b72e  .}M8...........S
	defb 025h,04eh,062h,0a9h,0ebh,0b8h,0ebh,0f8h,02eh,03ah,027h,0feh,036h,04dh,0e6h,0a9h	; b73e  %Nb......:'.6M..
	defb 0ebh,0b8h,0ebh,0f8h,04eh,03ah,08ah,081h,0b8h,081h,002h,007h,089h,08dh,0cfh,093h	; b74e  ....N:..........
	defb 085h,0e6h,0ffh	; b75e

; ----------------------------------------------------------------------
; DATOS letrero_B761: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (82 bytes)
;   0xb761..0xb7b3  (82 bytes)
DATA_letrero_B761:
	defb 0a0h,0a7h,0d2h,087h,0f8h,008h,0aeh,08ch,000h,0e8h,00bh,00ch,00dh,000h,017h,003h	; b761  ................
	defb 006h,00bh,003h,0e9h,0feh,0c1h,082h,0bch,082h,090h,0adh,080h,091h,0f8h,06fh,08bh	; b771  ..............o.
	defb 0d1h,0a7h,0d1h,082h,0b8h,0adh,0e6h,0bdh,087h,099h,091h,0feh,031h,04dh,038h,00dh	; b781  ............1M8.
	defb 018h,002h,0aeh,08ch,051h,02ah,058h,0f8h,007h,03ah,09bh,0adh,08bh,0d1h,091h,031h	; b791  ....Q*X..:.....1
	defb 04dh,0e6h,0feh,02ah,058h,0f8h,02eh,060h,03dh,08bh,0a5h,082h,03eh,086h,088h,0adh	; b7a1  M..*X..`=...>...
	defb 0e6h,0ffh	; b7b1

; ----------------------------------------------------------------------
; DATOS letrero_B7B3: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (85 bytes)
;   0xb7b3..0xb808  (85 bytes)
DATA_letrero_B7B3:
	defb 09eh,082h,08ch,000h,000h,0e8h,0b4h,0cbh,0a7h,0ebh,003h,0e9h,0feh,08bh,085h,088h	; b7b3  ................
	defb 048h,08dh,0adh,08ah,0ebh,051h,0f8h,056h,0f8h,018h,031h,04dh,03dh,03ah,036h,02ah	; b7c3  H....Q.V..1M=:6*
	defb 027h,0b8h,09fh,0ebh,0feh,0aah,0c1h,0cfh,093h,0e6h,0f8h,05ch,0f8h,006h,0a2h,0ebh	; b7d3  '..........\....
	defb 0bch,03dh,085h,081h,0b4h,0d2h,03ah,047h,036h,02ah,028h,04dh,0feh,0e6h,08bh,0d2h	; b7e3  .=....:G6*(M....
	defb 0cfh,093h,086h,0ebh,060h,0c5h,0a9h,081h,0a3h,0ebh,03dh,0f8h,03eh,0f8h,060h,041h	; b7f3  ....`.....=.>.`A
	defb 03eh,030h,04dh,0e6h,0ffh	; b803

; ----------------------------------------------------------------------
; DATOS letrero_B808: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (94 bytes)
;   0xb808..0xb866  (94 bytes)
DATA_letrero_B808:
	defb 085h,0a2h,09bh,0a6h,0ebh,0b4h,0d1h,0e4h,09eh,0cfh,093h,000h,0e8h,09bh,0c8h,0adh	; b808  ................
	defb 093h,0a0h,001h,008h,0e9h,0feh,025h,04bh,049h,04dh,020h,01ch,00bh,017h,03ah,08fh	; b818  ......%KIM ...:.
	defb 081h,084h,082h,060h,02bh,04dh,085h,0a2h,09bh,0a6h,0ebh,0feh,0b4h,0d1h,0e4h,09eh	; b828  ...`+M..........
	defb 0cfh,093h,0e6h,08bh,0d2h,0cfh,093h,086h,0ebh,060h,08dh,0cfh,093h,0e5h,0f8h,032h	; b838  .........`.....2
	defb 0f8h,02eh,051h,0feh,0f8h,07dh,04dh,038h,085h,081h,08bh,0d1h,082h,0e6h,0f8h,007h	; b848  ..Q..}M8........
	defb 03ah,0f8h,03bh,04eh,062h,0f8h,018h,028h,039h,02ch,039h,04dh,0e6h,0ffh	; b858  :..Nb..(9,9M..

; ----------------------------------------------------------------------
; DATOS letrero_B866: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (52 bytes)
;   0xb866..0xb89a  (52 bytes)
DATA_letrero_B866:
	defb 0a6h,081h,08fh,0ebh,000h,000h,0e8h,014h,01ch,000h,01eh,019h,015h,00bh,013h,0e9h	; b866  ................
	defb 0e6h,0feh,061h,02eh,03ah,060h,047h,027h,071h,037h,026h,04dh,002h,001h,001h,083h	; b876  ..a.:`G'q7&M....
	defb 0adh,0a6h,081h,08fh,0ebh,0e6h,0feh,08bh,0a5h,082h,09dh,082h,09dh,082h,03eh,09bh	; b886  ..............>.
	defb 0a1h,081h,0e6h,0ffh	; b896

; ----------------------------------------------------------------------
; DATOS letrero_B89A: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (88 bytes)
;   0xb89a..0xb8f2  (88 bytes)
DATA_letrero_B89A:
	defb 08fh,0bdh,089h,000h,000h,0e8h,0a6h,0cfh,086h,0ebh,0e4h,08ch,093h,0a6h,081h,085h	; b89a  ................
	defb 0ebh,0e9h,0feh,0b6h,0adh,085h,081h,03ah,03fh,02bh,036h,05fh,02bh,0e5h,01dh,018h	; b8aa  .......:?+6_+...
	defb 00bh,015h,00fh,080h,081h,0a5h,082h,03dh,0feh,08fh,0bdh,089h,0e6h,089h,0bch,087h	; b8ba  .......=........
	defb 039h,0f8h,03ah,0f8h,02fh,03ah,03eh,081h,086h,096h,086h,047h,09ah,091h,0a5h,082h	; b8ca  9.:./:>....G....
	defb 0feh,0e6h,030h,02ah,030h,0e4h,0e4h,0e4h,0f8h,032h,03dh,08bh,0a5h,082h,09dh,082h	; b8da  ..0*0....2=.....
	defb 09dh,082h,03eh,09bh,0a1h,081h,0e6h,0ffh	; b8ea  ..>.....

; ----------------------------------------------------------------------
; DATOS letrero_B8F2: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (81 bytes)
;   0xb8f2..0xb943  (81 bytes)
DATA_letrero_B8F2:
	defb 0c1h,0bbh,0c9h,0e4h,080h,0ebh,09eh,0ebh,000h,000h,0e8h,01dh,0e4h,01ah,0e4h,01dh	; b8f2  ................
	defb 0e9h,0feh,092h,086h,02ah,04bh,03dh,0b8h,0a1h,0ebh,0b4h,053h,099h,0adh,0b1h,0adh	; b902  ....*K=....S....
	defb 031h,04dh,0c1h,082h,0b8h,0adh,090h,0feh,0d2h,0cfh,086h,0e6h,08ah,081h,0a9h,0adh	; b912  1M..............
	defb 093h,0e4h,0c3h,0ebh,093h,094h,0ebh,0e4h,08ch,0c6h,08bh,0d0h,0a8h,0feh,038h,026h	; b922  ..............8&
	defb 050h,04eh,0e5h,0b4h,0d1h,082h,0b8h,0adh,03ah,03dh,044h,0a4h,082h,089h,082h,0e6h	; b932  PN......:=D.....
	defb 0ffh	; b942

; ----------------------------------------------------------------------
; DATOS letrero_B943: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (92 bytes)
;   0xb943..0xb99f  (92 bytes)
DATA_letrero_B943:
	defb 0aeh,08ch,09eh,08ch,087h,0e8h,0a6h,081h,080h,0cfh,093h,0e4h,09bh,0cbh,081h,08ch	; b943  ................
	defb 0e4h,09eh,08ch,087h,0e9h,0feh,02eh,04eh,051h,08eh,082h,0beh,031h,04dh,038h,0bch	; b953  .......NQ...1M8.
	defb 087h,0aeh,08ch,0e4h,083h,0a7h,080h,060h,019h,003h,0b1h,0feh,0ebh,0b4h,053h,003h	; b963  .......`......S.
	defb 0bdh,081h,03ah,039h,04ch,0e5h,041h,04ch,0f8h,060h,047h,029h,033h,02ch,039h,04ch	; b973  ..:9L.AL.`G)3,9L
	defb 08fh,081h,0feh,086h,0d1h,082h,0f8h,028h,0f8h,069h,053h,03dh,063h,04dh,0e6h,0a0h	; b983  .......(.iS=cM..
	defb 0a7h,0d2h,087h,0f8h,008h,0aeh,08ch,03ah,047h,085h,0e6h,0ffh	; b993  .......:G...

; ----------------------------------------------------------------------
; DATOS letrero_B99F: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (72 bytes)
;   0xb99f..0xb9e7  (72 bytes)
DATA_letrero_B99F:
	defb 0b4h,0a6h,081h,08fh,0adh,090h,086h,0feh,02eh,04eh,051h,08eh,082h,0beh,031h,04dh	; b99f  .........NQ...1M
	defb 038h,0b4h,0a6h,081h,053h,0a9h,0ebh,0b8h,0ebh,0f8h,02eh,03ah,030h,04fh,0feh,026h	; b9af  8...S......:0O.&
	defb 089h,082h,092h,0adh,038h,039h,071h,037h,027h,036h,04dh,0e6h,0c5h,0a9h,081h,0a3h	; b9bf  ....89q7'6M.....
	defb 0ebh,03dh,030h,02ah,0feh,02dh,034h,0b4h,0a6h,081h,047h,0bch,082h,0a5h,082h,03ah	; b9cf  .=0*.-4...G....:
	defb 099h,0adh,098h,082h,031h,04dh,0e6h,0ffh	; b9df  ....1M..

; ----------------------------------------------------------------------
; DATOS letrero_B9E7: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (82 bytes)
;   0xb9e7..0xba39  (82 bytes)
DATA_letrero_B9E7:
	defb 08ah,0adh,08eh,0c1h,0adh,0c0h,0feh,02eh,04eh,051h,08eh,082h,0beh,031h,04dh,038h	; b9e7  ........NQ...1M8
	defb 0f8h,034h,0f8h,046h,060h,03dh,019h,003h,0b1h,0ebh,0b4h,053h,003h,0bdh,0feh,081h	; b9f7  .4.F`=.....S....
	defb 03ah,039h,04ch,0e5h,041h,04ch,0f8h,060h,047h,029h,033h,02ch,039h,04ch,0f8h,03bh	; ba07  :9L.AL.`G)3,9L..
	defb 0f8h,034h,0f8h,028h,0f8h,069h,053h,039h,053h,0feh,02ch,039h,04dh,0e6h,0f8h,034h	; ba17  .4.(.iS9S.,9M..4
	defb 0f8h,02eh,03ah,0f8h,02eh,053h,04eh,062h,09eh,0adh,08fh,0adh,03ah,047h,061h,04dh	; ba27  ..:..SNb....:GaM
	defb 0e6h,0ffh	; ba37

; ----------------------------------------------------------------------
; DATOS letrero_BA39: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (62 bytes)
;   0xba39..0xba77  (62 bytes)
DATA_letrero_BA39:
	defb 08eh,082h,0aeh,0adh,086h,0d2h,082h,000h,0e8h,095h,089h,08ch,000h,010h,006h,001h	; ba39  ................
	defb 001h,0e9h,0feh,02eh,04eh,051h,036h,02ah,027h,038h,0c5h,0a9h,081h,0a3h,0ebh,051h	; ba49  ....NQ6*'8.....Q
	defb 0f8h,046h,0f8h,031h,03ah,0f8h,02eh,0f8h,007h,0f8h,000h,0f8h,004h,03dh,0feh,0aeh	; ba59  .F.1:........=..
	defb 0a1h,0adh,051h,0f8h,018h,04dh,02eh,038h,053h,060h,02bh,04dh,0e6h,0ffh	; ba69  ..Q..M.8S`+M..

; ----------------------------------------------------------------------
; DATOS letrero_BA77: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (72 bytes)
;   0xba77..0xbabf  (72 bytes)
DATA_letrero_BA77:
	defb 0b8h,0adh,0c1h,0ebh,0a8h,0feh,08fh,0cfh,086h,0d1h,082h,0beh,0adh,03dh,061h,02eh	; ba77  .............=a.
	defb 03ah,060h,047h,025h,04dh,04ah,027h,039h,0b8h,0adh,0c1h,0feh,0ebh,0a8h,03dh,099h	; ba87  :`G%MJ'9......=.
	defb 089h,0e6h,0b3h,0adh,0b4h,0bdh,0ebh,0a6h,0adh,0bch,026h,02bh,03dh,0bbh,0adh,0c4h	; ba97  ..........&+=...
	defb 0d2h,0feh,082h,053h,03eh,04bh,04eh,037h,026h,04dh,0e6h,08bh,0a5h,082h,09dh,082h	; baa7  ...S>KN7&M......
	defb 09dh,082h,03eh,09bh,0a1h,081h,0e6h,0ffh	; bab7  ..>.....

; ----------------------------------------------------------------------
; DATOS letrero_BABF: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (53 bytes)
;   0xbabf..0xbaf4  (53 bytes)
DATA_letrero_BABF:
	defb 0bdh,088h,091h,0feh,093h,081h,0a9h,033h,027h,059h,0f8h,06fh,03dh,085h,097h,08dh	; babf  .......3'Y.o=...
	defb 081h,03dh,0b2h,09fh,0bdh,088h,091h,0e6h,02ah,039h,0feh,04ch,059h,074h,027h,064h	; bacf  .=......*9.LYt'd
	defb 039h,08bh,0aah,0a2h,098h,05dh,0e6h,0feh,08bh,0a5h,082h,09dh,082h,09dh,082h,03eh	; badf  9....].........>
	defb 09bh,0a1h,081h,0e6h,0ffh	; baef

; ----------------------------------------------------------------------
; DATOS letrero_BAF4: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (37 bytes)
;   0xbaf4..0xbb19  (37 bytes)
DATA_letrero_BAF4:
	defb 099h,0adh,0b0h,0a6h,081h,0b8h,0ebh,0feh,0f8h,03ah,0f8h,02fh,060h,03dh,0a7h,0a5h	; baf4  .........:./`=..
	defb 082h,085h,090h,03eh,039h,030h,0e6h,08bh,0a5h,082h,09dh,082h,09dh,082h,03eh,0feh	; bb04  ...>90........>.
	defb 09bh,0a1h,081h,0e6h,0ffh	; bb14

; ----------------------------------------------------------------------
; DATOS letrero_BB19: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (65 bytes)
;   0xbb19..0xbb5a  (65 bytes)
DATA_letrero_BB19:
	defb 094h,081h,093h,0beh,0d1h,080h,0feh,087h,0a6h,0a3h,09fh,060h,047h,0f8h,032h,09ah	; bb19  ...........`G.2.
	defb 0a8h,03dh,04ah,027h,03ah,0f8h,018h,028h,04dh,080h,0adh,08bh,0b2h,0ebh,0feh,0b0h	; bb29  .=J':..(M.......
	defb 0a8h,0e6h,02eh,04eh,051h,08eh,082h,0beh,031h,04eh,062h,026h,02ah,039h,04dh,087h	; bb39  ...NQ...1Nb&*9M.
	defb 0a6h,0a3h,09fh,060h,0feh,047h,0f8h,018h,028h,04dh,04ah,027h,03ah,039h,04dh,0e6h	; bb49  ...`.G..(MJ':9M.
	defb 0ffh	; bb59

; ----------------------------------------------------------------------
; DATOS letrero_BB5A: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (42 bytes)
;   0xbb5a..0xbb84  (42 bytes)
DATA_letrero_BB5A:
	defb 08fh,09eh,0b2h,0feh,0bdh,081h,084h,0a6h,0c1h,03ah,025h,071h,034h,08fh,09eh,0b2h	; bb5a  .........:%q4...
	defb 0e6h,034h,065h,04bh,04eh,033h,027h,03ah,03eh,0feh,039h,026h,0e6h,08bh,0a5h,082h	; bb6a  .4eKN3':>.9&....
	defb 09dh,082h,09dh,082h,03eh,09bh,0a1h,081h,0e6h,0ffh	; bb7a  ....>.....

; ----------------------------------------------------------------------
; DATOS letrero_BB84: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (56 bytes)
;   0xbb84..0xbbbc  (56 bytes)
DATA_letrero_BB84:
	defb 085h,08dh,0cfh,093h,092h,0ebh,0c5h,0feh,094h,08fh,0ebh,08bh,0d0h,03dh,0aah,0cfh	; bb84  .............=..
	defb 085h,0ebh,03ah,025h,071h,034h,085h,08dh,0cfh,093h,092h,0ebh,0c5h,0feh,0e6h,0b3h	; bb94  ..:%q4..........
	defb 0adh,0b4h,0bdh,0ebh,0a6h,0adh,0bch,03dh,089h,0cfh,085h,053h,0aah,087h,084h,0adh	; bba4  .......=...S....
	defb 02fh,04eh,037h,0feh,026h,04dh,0e6h,0ffh	; bbb4  /N7.&M..

; ----------------------------------------------------------------------
; DATOS letrero_BBBC: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (56 bytes)
;   0xbbbc..0xbbf4  (56 bytes)
DATA_letrero_BBBC:
	defb 085h,0ebh,093h,0a7h,0cfh,0b4h,0feh,09eh,0a8h,09bh,03dh,03dh,02eh,030h,034h,0b1h	; bbbc  ..........==.04.
	defb 0ebh,0a0h,085h,0ebh,093h,0a7h,0cfh,0b4h,0e6h,02eh,03dh,0f8h,046h,0feh,03ah,019h	; bbcc  ..........=.F.:.
	defb 013h,016h,013h,022h,03dh,09eh,081h,087h,0aah,09bh,0c9h,0a8h,0a0h,053h,02ah,02ch	; bbdc  ..."=........S*,
	defb 02fh,04eh,037h,0feh,026h,04dh,0e6h,0ffh	; bbec  /N7.&M..

; ----------------------------------------------------------------------
; DATOS letrero_BBF4: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (90 bytes)
;   0xbbf4..0xbc4e  (90 bytes)
DATA_letrero_BBF4:
	defb 085h,0b6h,0b0h,08ch,0a7h,000h,0e8h,01ah,016h,085h,0a8h,000h,09dh,0abh,081h,093h	; bbf4  ................
	defb 0e9h,0feh,083h,0adh,0f8h,008h,0a7h,0b7h,090h,0ebh,0a0h,099h,081h,0b2h,082h,03dh	; bc04  ...............=
	defb 0beh,083h,0adh,0f8h,06fh,085h,0b6h,0b0h,08ch,0feh,0a7h,0e6h,02ch,030h,072h,044h	; bc14  ....o.......,0rD
	defb 0e5h,03eh,039h,0f8h,034h,0e5h,03eh,039h,05fh,043h,04ch,0e5h,039h,044h,05dh,0f8h	; bc24  .>9.4.>9_CL.9D].
	defb 067h,0feh,03ah,02bh,02ch,0e6h,002h,006h,08ah,081h,0f8h,003h,0f8h,02eh,0e5h,002h	; bc34  g.:+,...........
	defb 02ah,026h,0e5h,002h,085h,0c5h,08dh,0a8h,0e6h,0ffh	; bc44  *&........

; ----------------------------------------------------------------------
; DATOS letrero_BC4E: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (70 bytes)
;   0xbc4e..0xbc94  (70 bytes)
DATA_letrero_BC4E:
	defb 0bfh,0aah,0ebh,090h,0feh,094h,08fh,0ebh,08bh,0d0h,053h,02ch,04eh,034h,0bfh,0aah	; bc4e  ..........S,N4..
	defb 0ebh,090h,0e6h,0b3h,0adh,0b4h,0bdh,0ebh,0a6h,0adh,0feh,0bch,03dh,09eh,0ebh,087h	; bc5e  ............=...
	defb 053h,0a2h,090h,0ebh,09bh,02fh,04eh,037h,026h,04dh,0e6h,08bh,0a5h,082h,09dh,082h	; bc6e  S..../N7&M......
	defb 0feh,09dh,082h,03eh,09bh,0a1h,081h,0e6h,094h,08fh,0ebh,08bh,0d0h,03dh,03ah,029h	; bc7e  ...>.........=:)
	defb 026h,053h,031h,04dh,0e6h,0ffh	; bc8e

; ----------------------------------------------------------------------
; DATOS letrero_BC94: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (83 bytes)
;   0xbc94..0xbce7  (83 bytes)
DATA_letrero_BC94:
	defb 08ch,0c5h,0a9h,0ebh,000h,000h,0e8h,09fh,08dh,08ch,0e4h,08ch,0c5h,0a9h,0ebh,0e9h	; bc94  ................
	defb 0feh,0b4h,0a1h,090h,083h,0ebh,092h,0a8h,0e5h,016h,01ah,0aeh,08ch,051h,036h,02ah	; bca4  .............Q6*
	defb 071h,034h,086h,0d2h,082h,097h,0feh,0adh,08dh,081h,03dh,0a6h,0cfh,085h,0ebh,0f8h	; bcb4  q4........=.....
	defb 06fh,08ch,0c5h,0a9h,0ebh,0e6h,085h,086h,0b1h,0adh,086h,0adh,038h,0feh,02ah,02ah	; bcc4  o...........8.**
	defb 04eh,037h,026h,04dh,0e6h,081h,0aah,03eh,0a1h,08fh,0a7h,0cfh,087h,0b0h,0a9h,081h	; bcd4  N7&M...>........
	defb 05dh,0e6h,0ffh	; bce4

; ----------------------------------------------------------------------
; DATOS letrero_BCE7: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (29 bytes)
;   0xbce7..0xbd04  (29 bytes)
DATA_letrero_BCE7:
	defb 085h,0ebh,0bch,0feh,0b3h,0adh,0b4h,0bdh,0ebh,0a6h,0adh,0bch,060h,08bh,0a5h,082h	; bce7  ............`...
	defb 02fh,04eh,037h,026h,04dh,013h,00dh,085h,0ebh,0feh,0bch,0e6h,0ffh	; bcf7  /N7&M........

; ----------------------------------------------------------------------
; DATOS letrero_BD04: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (33 bytes)
;   0xbd04..0xbd25  (33 bytes)
DATA_letrero_BD04:
	defb 0a9h,0cfh,0bch,0e4h,085h,0ebh,0bch,0feh,085h,0ebh,0bch,002h,02ah,04bh,004h,051h	; bd04  ............*K.Q
	defb 0b8h,081h,0a5h,082h,031h,04dh,09eh,08ch,08fh,0ebh,0e4h,085h,0ebh,0feh,0bch,0e6h	; bd14  ....1M..........
	defb 0ffh	; bd24

; ----------------------------------------------------------------------
; DATOS letrero_BD25: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (33 bytes)
;   0xbd25..0xbd46  (33 bytes)
DATA_letrero_BD25:
	defb 0bfh,0a8h,0ebh,0e4h,085h,0ebh,0bch,0feh,085h,0ebh,0bch,005h,02ah,04bh,007h,051h	; bd25  ............*K.Q
	defb 0b8h,081h,0a5h,082h,031h,04dh,09eh,08ch,08fh,0ebh,0e4h,085h,0ebh,0feh,0bch,0e6h	; bd35  ....1M..........
	defb 0ffh	; bd45

; ----------------------------------------------------------------------
; DATOS letrero_BD46: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (34 bytes)
;   0xbd46..0xbd68  (34 bytes)
DATA_letrero_BD46:
	defb 0b0h,0a7h,0ebh,0adh,0e4h,085h,0ebh,0bch,0feh,085h,0ebh,0bch,008h,02ah,04bh,00ah	; bd46  .............*K.
	defb 051h,0b8h,081h,0a5h,082h,031h,04dh,09eh,08ch,08fh,0ebh,0e4h,085h,0ebh,0feh,0bch	; bd56  Q....1M.........
	defb 0e6h,0ffh	; bd66

; ----------------------------------------------------------------------
; DATOS letrero_BD68: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (83 bytes)
;   0xbd68..0xbdbb  (83 bytes)
DATA_letrero_BD68:
	defb 00dh,0a9h,0ebh,08bh,0d2h,0adh,000h,000h,0e8h,00ch,002h,0a4h,095h,0cfh,093h,0e9h	; bd68  ................
	defb 0feh,08bh,0d2h,0cfh,093h,086h,0ebh,060h,08fh,081h,0a7h,0d2h,087h,03dh,085h,081h	; bd78  .......`.....=..
	defb 09bh,087h,053h,060h,02bh,04dh,0feh,0afh,0d1h,082h,095h,087h,0e5h,0bfh,08fh,095h	; bd88  ..S`+M..........
	defb 087h,0e5h,099h,0a0h,083h,0cfh,0b0h,0e5h,091h,094h,09bh,0c9h,0feh,0cfh,08bh,0d1h	; bd98  ................
	defb 0e5h,090h,0d2h,089h,0a9h,0ebh,093h,0e5h,087h,0a6h,0cfh,085h,0ebh,051h,040h,02ch	; bda8  .............Q@,
	defb 045h,0e6h,0ffh	; bdb8

; ----------------------------------------------------------------------
; DATOS letrero_BDBB: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (82 bytes)
;   0xbdbb..0xbe0d  (82 bytes)
DATA_letrero_BDBB:
	defb 00dh,0a9h,0ebh,08bh,0d2h,0adh,000h,000h,0e8h,00ch,003h,0a4h,095h,0cfh,093h,0e9h	; bdbb  ................
	defb 0feh,08bh,0d2h,0cfh,093h,086h,0ebh,060h,08fh,081h,0a7h,0d2h,087h,03dh,085h,081h	; bdcb  .......`.....=..
	defb 09bh,087h,053h,060h,02bh,04dh,0feh,09eh,0a1h,038h,09fh,0ebh,093h,0c1h,0ebh,0a8h	; bddb  ..S`+M...8......
	defb 03dh,093h,09eh,093h,095h,0e5h,09eh,0a1h,038h,09bh,0a6h,0adh,0feh,087h,09bh,0a8h	; bdeb  =.......8.......
	defb 093h,0e5h,0afh,0d1h,082h,095h,087h,03dh,0c7h,092h,093h,095h,051h,040h,02ch,045h	; bdfb  .......=....Q@,E
	defb 0e6h,0ffh	; be0b

; ----------------------------------------------------------------------
; DATOS letrero_BE0D: letrero (p00:4950): letras hasta 0xFF, 0xFE salta de
;   linea; lo leen p00:4950 (81 bytes)
;   0xbe0d..0xbe5e  (81 bytes)
DATA_letrero_BE0D:
	defb 00dh,0a9h,0ebh,08bh,0d2h,0adh,000h,000h,0e8h,00ch,004h,0a4h,095h,0cfh,093h,0e9h	; be0d  ................
	defb 0feh,08bh,0d2h,0cfh,093h,086h,0ebh,060h,08fh,081h,0a7h,0d2h,087h,03dh,085h,081h	; be1d  .......`.....=..
	defb 09bh,087h,053h,060h,02bh,04dh,0feh,08ch,0a6h,081h,08ch,099h,0a0h,0e5h,095h,0abh	; be2d  ..S`+M..........
	defb 093h,0a7h,038h,08bh,090h,0a1h,0adh,090h,0d2h,082h,0e5h,08ch,0feh,0c3h,0b1h,0cfh	; be3d  ..8.............
	defb 092h,0c9h,0e5h,090h,0ebh,0b5h,0e5h,089h,0ebh,09ah,0ebh,051h,040h,02ch,045h,0e6h	; be4d  ...........Q@,E.
	defb 0ffh	; be5d

; ----------------------------------------------------------------------
; DATOS restos_finales_BE5E: 418 bytes al final del banco detras del ultimo
;   bloque que se lee (letrero_BE0D): ningun lector del listado llega a ellos
;   ni los apunta ninguna tabla declarada
;   0xbe5e..0xc000  (418 bytes)
DATA_restos_finales_BE5E:
	defb 0ffh,01dh,01eh,00eh,00fh,00fh,019h,012h,013h,018h,019h,090h,00bh,00bh,084h,023h	; be5e  ...............#
	defb 024h,08ah,001h,002h,014h,015h,08ah,018h,019h,01fh,020h,018h,019h,0ffh,025h,020h	; be6e  $......... ...%
	defb 018h,019h,01dh,01eh,00eh,00fh,00bh,00bh,084h,00eh,00fh,00bh,00bh,084h,012h,013h	; be7e  ................
	defb 018h,019h,090h,018h,019h,00eh,00fh,01fh,020h,001h,002h,0ffh,01fh,020h,018h,019h	; be8e  ........ .... ..
	defb 014h,015h,08ah,018h,019h,00eh,00fh,00bh,00bh,084h,01ah,01ch,018h,019h,090h,016h	; be9e  ................
	defb 017h,00bh,00bh,084h,01dh,01eh,00eh,00fh,00bh,00bh,084h,018h,019h,0ffh,01fh,020h	; beae  ...............
	defb 001h,002h,009h,00ah,090h,025h,020h,001h,002h,003h,004h,00fh,019h,0ffh,012h,013h	; bebe  .....% .........
	defb 001h,002h,03fh,040h,00fh,019h,00eh,00fh,00bh,00bh,084h,012h,013h,018h,019h,090h	; bece  ..?@............
	defb 00fh,019h,009h,00ah,00eh,00fh,001h,002h,01ah,01ch,001h,002h,0ffh,014h,015h,08ah	; bede  ................
	defb 001h,002h,01dh,01eh,001h,002h,00eh,00fh,00bh,00bh,084h,01ah,01ch,018h,019h,090h	; beee  ................
	defb 00bh,00bh,084h,012h,013h,001h,002h,01ah,01ch,00bh,00bh,084h,012h,013h,018h,019h	; befe  ................
	defb 0ffh,035h,004h,032h,004h,037h,004h,031h,006h,029h,008h,02ah,004h,02bh,004h,02bh	; bf0e  .5.2.7.1.).*.+.+
	defb 004h,02ah,004h,028h,004h,036h,0ffh,035h,004h,028h,004h,02ah,004h,031h,006h,026h	; bf1e  .*.(.6.5.(.*.1.&
	defb 004h,034h,004h,02eh,002h,032h,0ffh,02ch,004h,026h,004h,030h,006h,02ah,008h,033h	; bf2e  .4...2.,.&.0.*.3
	defb 004h,034h,004h,032h,004h,02ch,004h,034h,004h,026h,004h,030h,006h,030h,006h,02eh	; bf3e  .4.2.,.4.&.0.0..
	defb 002h,031h,006h,02ch,0ffh,029h,004h,02ah,004h,030h,006h,032h,008h,033h,004h,034h	; bf4e  .1.,.).*.0.2.3.4
	defb 004h,032h,004h,02ch,004h,034h,004h,026h,004h,030h,006h,030h,006h,02eh,002h,031h	; bf5e  .2.,.4.&.0.0...1
	defb 006h,02ch,0ffh,030h,006h,037h,004h,035h,004h,02eh,002h,028h,008h,028h,004h,032h	; bf6e  .,.0.7.5...(.(.2
	defb 004h,030h,006h,033h,004h,032h,004h,035h,004h,02ah,0ffh,028h,004h,02dh,004h,026h	; bf7e  .0.3.2.5.*.(.-.&
	defb 004h,034h,004h,026h,004h,028h,004h,036h,004h,02ah,004h,034h,008h,029h,004h,02ah	; bf8e  .4.&.(.6.*.4.).*
	defb 004h,035h,004h,02eh,002h,02ch,004h,031h,0ffh,028h,004h,02dh,004h,026h,004h,034h	; bf9e  .5...,.1.(.-.&.4
	defb 004h,026h,004h,028h,004h,036h,004h,02ah,004h,034h,008h,035h,004h,037h,004h,033h	; bfae  .&.(.6.*.4.5.7.3
	defb 004h,033h,004h,032h,004h,034h,004h,036h,0ffh,02ch,004h,026h,004h,030h,006h,02ah	; bfbe  .3.2.4.6.,.&.0.*
	defb 008h,029h,004h,02ah,004h,035h,004h,02eh,002h,02ch,004h,031h,0ffh,030h,006h,02ah	; bfce  .).*.5...,.1.0.*
	defb 004h,028h,004h,02dh,004h,026h,004h,031h,006h,02eh,002h,028h,004h,026h,004h,02fh	; bfde  .(.-.&.1...(.&./
	defb 008h,029h,004h,02ah,004h,035h,004h,02eh,002h,02ch,004h,031h,0ffh,0ffh,0ffh,0ffh	; bfee  .).*.5...,.1....
	defb 0ffh,0ffh	; bffe
