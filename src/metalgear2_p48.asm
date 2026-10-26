; ==========================================================================
; METAL GEAR 2 SOLID SNAKE - Konami (1990) - MSX2 - MegaROM RC-767 de 512 KB (Konami SCC) - banco 48 (se ejecuta en 0x8000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x08000


; ----------------------------------------------------------------------
; DATOS cabecera_48: 12 punteros del banco 48 (p01:6082...): 8000 tabla de
;   conversaciones por frecuencia, 8002-800A, 800E y 8010-8014 conversaciones,
;   800C 36 parejas, 8016 un mensaje; lo leen p01:6085 (24 bytes)
;   0x8000..0x8018  (24 bytes)
DATA_cabecera_48:
	defw 08037h,08452h,08533h,08542h,084b1h,084edh,0be76h,082aah	; 8000
	defw 0850bh,08498h,0847ah,08018h	; 8010  -> DATA_conversacion_850B DATA_conversacion_8498 DATA_conversacion_847A DATA_mensaje_8018

; ----------------------------------------------------------------------
; DATOS mensaje_8018: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:64EE (31 bytes)
;   0x8018..0x8037  (31 bytes)
DATA_mensaje_8018:
	defb 002h,076h,02eh,035h,04bh,01dh,019h,016h,013h,00eh,000h,01dh,018h,00bh,015h,00fh	; 8018  .v.5K...........
	defb 0e6h,0feh,084h,082h,093h,082h,03ch,053h,026h,043h,031h,0e4h,0e4h,0e4h,0ffh	; 8028  ......<S&C1....

; ----------------------------------------------------------------------
; DATOS conversaciones: 8 punteros a conversaciones (p01:6088: el indice en
;   A); lo leen p01:6088 (16 bytes)
;   0x8037..0x8047  (16 bytes)
DATA_conversaciones:
	defw 08047h,080afh,08112h,0813fh,08188h,081cah,08296h,082a9h	; 8037

; ----------------------------------------------------------------------
; DATOS conversacion_8047: 16 fichas [cabeza][condiciones][zona
;   sala][accion][puntero], cada una con sus 0xFE [espera][accion][puntero], y
;   un 0xFF (p01:608B); lo leen p01:608B (104 bytes)
;   0x8047..0x80af  (104 bytes)
DATA_conversacion_8047:
	defb 002h,053h,0a1h,000h,036h,096h,003h,050h,07ah,0a1h,000h,0f2h,09dh,004h,04ch,05eh	; 8047  .S..6..Pz.....L^
	defb 02fh,0a1h,000h,0b3h,09dh,004h,03eh,03fh,062h,0a1h,000h,0d4h,09bh,003h,0a4h,0a5h	; 8057  /.....>?b.......
	defb 035h,000h,058h,09fh,003h,021h,071h,05ah,001h,015h,084h,082h,008h,009h,003h,006h	; 8067  5.X..!qZ........
	defb 000h,0b8h,09ah,003h,00fh,010h,08eh,000h,0b8h,09ah,003h,014h,015h,088h,001h,004h	; 8077  ................
	defb 084h,001h,058h,000h,0b6h,09eh,001h,08ch,001h,00eh,084h,001h,08dh,001h,0f7h,083h	; 8087  ..X.............
	defb 001h,08bh,000h,08ah,09eh,081h,06ch,000h,003h,001h,0edh,083h,081h,06ch,000h,009h	; 8097  ......l......l..
	defb 001h,0edh,083h,000h,001h,0d4h,083h,0ffh	; 80a7  ........

; ----------------------------------------------------------------------
; DATOS conversacion_80AF: 15 fichas [cabeza][condiciones][zona
;   sala][accion][puntero], cada una con sus 0xFE [espera][accion][puntero], y
;   un 0xFF (p01:608B); lo leen p01:608B (99 bytes)
;   0x80af..0x8112  (99 bytes)
DATA_conversacion_80AF:
	defb 002h,07ah,052h,000h,0e9h,095h,002h,07ah,051h,000h,0e9h,095h,003h,07bh,050h,07ah	; 80af  .zR....zQ....{Pz
	defb 000h,0afh,095h,002h,047h,049h,000h,0afh,094h,082h,040h,07dh,013h,004h,000h,047h	; 80bf  ....GI....@}...G
	defb 094h,082h,040h,07eh,013h,004h,000h,094h,093h,002h,078h,03ah,000h,07fh,092h,002h	; 80cf  ..@~......x:....
	defb 02ch,081h,000h,054h,095h,002h,03bh,03fh,001h,01ch,084h,004h,021h,071h,080h,05ah	; 80df  ,..T...?....!q.Z
	defb 000h,0f9h,091h,004h,021h,071h,07fh,05ah,000h,0afh,091h,004h,020h,082h,01fh,05ah	; 80ef  ....!q.Z.... ..Z
	defb 000h,000h,093h,001h,083h,001h,041h,084h,001h,096h,000h,00eh,096h,001h,094h,001h	; 80ff  ......A.........
	defb 01ch,084h,0ffh	; 810f

; ----------------------------------------------------------------------
; DATOS conversacion_8112: 7 fichas [cabeza][condiciones][zona
;   sala][accion][puntero], cada una con sus 0xFE [espera][accion][puntero], y
;   un 0xFF (p01:608B); lo leen p01:608B (45 bytes)
;   0x8112..0x813f  (45 bytes)
DATA_conversacion_8112:
	defb 002h,046h,049h,000h,08eh,0a3h,002h,03ah,078h,000h,0fdh,0a2h,002h,03ch,079h,000h	; 8112  .FI....:x....<y.
	defb 0cdh,0a1h,002h,038h,097h,000h,03fh,0a1h,002h,039h,098h,000h,03fh,0a1h,004h,01fh	; 8122  ...8..?..9..?...
	defb 075h,05ah,099h,000h,024h,0a0h,002h,076h,00eh,000h,0c3h,09fh,0ffh	; 8132  uZ..$..v.....

; ----------------------------------------------------------------------
; DATOS conversacion_813F: 10 fichas [cabeza][condiciones][zona
;   sala][accion][puntero], cada una con sus 0xFE [espera][accion][puntero], y
;   un 0xFF (p01:608B); lo leen p01:608B (73 bytes)
;   0x813f..0x8188  (73 bytes)
DATA_conversacion_813F:
	defb 002h,09ah,084h,000h,0e1h,088h,0feh,001h,000h,044h,089h,0feh,001h,000h,07ah,089h	; 813f  .........D....z.
	defb 002h,04ch,07ah,000h,0cch,087h,001h,085h,000h,0e7h,08bh,003h,092h,086h,05ah,000h	; 814f  .Lz...........Z.
	defb 090h,08ah,003h,087h,01ch,01bh,000h,0c3h,08dh,003h,014h,015h,088h,000h,037h,08dh	; 815f  ..............7.
	defb 002h,089h,058h,000h,0e0h,08ah,002h,00ch,08ah,000h,0c3h,08ah,002h,05ah,07ah,001h	; 816f  ..X..........Zz.
	defb 0b2h,083h,002h,059h,07ah,001h,096h,083h,0ffh	; 817f  ...Yz....

; ----------------------------------------------------------------------
; DATOS conversacion_8188: 8 fichas [cabeza][condiciones][zona
;   sala][accion][puntero], cada una con sus 0xFE [espera][accion][puntero], y
;   un 0xFF (p01:608B); lo leen p01:608B (66 bytes)
;   0x8188..0x81ca  (66 bytes)
DATA_conversacion_8188:
	defb 002h,050h,07ah,000h,0b9h,0b5h,0feh,001h,000h,0ffh,0b5h,0feh,001h,000h,01eh,0b6h	; 8188  .Pz.............
	defb 003h,03fh,03eh,062h,000h,033h,0b2h,003h,037h,036h,09dh,000h,0a9h,0b1h,002h,033h	; 8198  .?>b.3..76.....3
	defb 032h,000h,01bh,0b1h,003h,087h,01ch,01bh,000h,042h,0b0h,003h,015h,014h,088h,000h	; 81a8  2........B......
	defb 02eh,0afh,003h,010h,00fh,08eh,000h,02fh,0aeh,082h,009h,008h,003h,006h,000h,009h	; 81b8  ......./........
	defb 0adh,0ffh	; 81c8

; ----------------------------------------------------------------------
; DATOS conversacion_81CA: 5 fichas [cabeza][condiciones][zona
;   sala][accion][puntero], cada una con sus 0xFE [espera][accion][puntero], y
;   un 0xFF (p01:608B); lo leen p01:608B (204 bytes)
;   0x81ca..0x8296  (204 bytes)
DATA_conversacion_81CA:
	defb 003h,074h,026h,02eh,001h,04bh,084h,002h,073h,023h,000h,080h,0ach,003h,072h,022h	; 81ca  .t&..K..s#....r"
	defb 05ah,000h,088h,0aah,0feh,001h,000h,0c6h,0aah,0feh,001h,000h,0d5h,0aah,0feh,001h	; 81da  Z...............
	defb 000h,0ffh,0aah,0feh,001h,000h,021h,0abh,0feh,001h,000h,043h,0abh,0feh,001h,000h	; 81ea  ......!....C....
	defb 050h,0abh,0feh,001h,000h,0dah,0abh,0feh,001h,000h,0e8h,0abh,0feh,001h,000h,024h	; 81fa  P..............$
	defb 0ach,0feh,001h,000h,032h,0ach,0feh,001h,000h,080h,0ach,002h,071h,00eh,001h,04bh	; 820a  ....2.......q..K
	defb 084h,003h,00dh,070h,09bh,000h,048h,0a5h,0feh,001h,000h,067h,0a5h,0feh,001h,000h	; 821a  ...p..H....g....
	defb 072h,0a5h,0feh,001h,000h,089h,0a5h,0feh,001h,000h,0a0h,0a5h,0feh,001h,000h,006h	; 822a  r...............
	defb 0a6h,0feh,001h,000h,012h,0a6h,0feh,001h,000h,04bh,0a6h,0feh,001h,000h,068h,0a6h	; 823a  .........K....h.
	defb 0feh,001h,000h,085h,0a6h,0feh,001h,000h,0a1h,0a6h,0feh,001h,000h,052h,0a7h,0feh	; 824a  .............R..
	defb 001h,000h,07dh,0a7h,0feh,001h,000h,030h,0a8h,0feh,001h,000h,03fh,0a8h,0feh,001h	; 825a  ..}....0....?...
	defb 000h,0d3h,0a8h,0feh,001h,000h,0e8h,0a8h,0feh,001h,000h,04eh,0a9h,0feh,001h,000h	; 826a  ...........N....
	defb 062h,0a9h,0feh,001h,000h,0a4h,0a9h,0feh,001h,000h,0b5h,0a9h,0feh,001h,000h,0beh	; 827a  b...............
	defb 0a9h,0feh,001h,000h,04fh,0aah,0feh,001h,000h,077h,0aah,0ffh	; 828a  ....O....w..

; ----------------------------------------------------------------------
; DATOS conversacion_8296: 2 fichas [cabeza][condiciones][zona
;   sala][accion][puntero], cada una con sus 0xFE [espera][accion][puntero], y
;   un 0xFF (p01:608B); lo leen p01:608B (19 bytes)
;   0x8296..0x82a9  (19 bytes)
DATA_conversacion_8296:
	defb 002h,072h,023h,000h,0b3h,0a4h,003h,072h,021h,05ah,000h,0b3h,0a4h,0feh,001h,000h	; 8296  .r#....r!Z......
	defb 01eh,0a5h,0ffh	; 82a6

; ----------------------------------------------------------------------
; DATOS conversacion_82A9: 0 fichas [cabeza][condiciones][zona
;   sala][accion][puntero], cada una con sus 0xFE [espera][accion][puntero], y
;   un 0xFF (p01:608B); lo leen p01:608B (1 bytes)
;   0x82a9..0x82aa  (1 bytes)
DATA_conversacion_82A9:
	defb 0ffh	; 82a9

; ----------------------------------------------------------------------
; DATOS conversacion_82AA: 16 fichas [cabeza][condiciones][zona
;   sala][accion][puntero], cada una con sus 0xFE [espera][accion][puntero], y
;   un 0xFF (p01:608B); lo leen p01:636D (236 bytes)
;   0x82aa..0x8396  (236 bytes)
DATA_conversacion_82AA:
	defb 083h,04eh,04fh,08fh,012h,002h,000h,046h,0b3h,0feh,001h,000h,0a4h,0b3h,0feh,001h	; 82aa  .NO....F........
	defb 000h,016h,0b4h,0feh,001h,000h,00fh,0b5h,0feh,001h,000h,01ch,0b5h,0feh,001h,000h	; 82ba  ................
	defb 058h,0b5h,0feh,001h,000h,06dh,0b5h,005h,05bh,04ch,05eh,02fh,0a1h,000h,0b3h,09dh	; 82ca  X....m..[L^/....
	defb 006h,05dh,030h,05fh,049h,0a1h,06fh,000h,08ch,09fh,084h,060h,042h,041h,011h,013h	; 82da  .]0_I.o....`BA..
	defb 004h,000h,0cfh,0b8h,0feh,001h,000h,0e6h,0b8h,0feh,001h,000h,004h,0b9h,004h,061h	; 82ea  ...............a
	defb 03eh,062h,03fh,000h,057h,0b9h,0feh,001h,000h,0a9h,0b9h,0feh,001h,000h,0bah,0b9h	; 82fa  >b?.W...........
	defb 0feh,001h,000h,029h,0bah,0feh,001h,000h,03dh,0bah,083h,092h,034h,063h,00dh,005h	; 830a  ...)....=...4c..
	defb 000h,080h,08bh,084h,064h,02bh,06dh,05ch,00ah,000h,000h,0fah,08ah,083h,065h,01dh	; 831a  ....d+m\......e.
	defb 09eh,00fh,000h,000h,071h,08dh,082h,019h,018h,00bh,005h,000h,059h,088h,0feh,001h	; 832a  ....q.......Y...
	defb 000h,09eh,088h,0feh,001h,000h,0afh,088h,0feh,001h,000h,0e1h,088h,0feh,001h,000h	; 833a  ................
	defb 044h,089h,0feh,001h,000h,07ah,089h,082h,066h,067h,009h,002h,000h,0f4h,09eh,002h	; 834a  D....z..fg......
	defb 068h,013h,000h,0edh,08ch,083h,012h,058h,033h,007h,00bh,000h,099h,0b8h,0feh,001h	; 835a  h......X3.......
	defb 000h,0b2h,0b8h,0feh,001h,000h,0bah,0b8h,083h,069h,00dh,070h,007h,00ch,000h,0b4h	; 836a  .........i.p....
	defb 096h,083h,094h,06ah,016h,001h,003h,000h,04ch,085h,083h,004h,06bh,06ch,000h,008h	; 837a  ...j....L...kl..
	defb 000h,0cdh,099h,082h,06eh,002h,000h,006h,000h,0c2h,097h,0ffh	; 838a  ....n.......

; ----------------------------------------------------------------------
; DATOS al_azar_8396: [n] y n mensajes y n umbrales (0-99): uno al azar
;   (p01:6142, p01:6172); lo leen p01:6142 (28 bytes)
;   0x8396..0x83b2  (28 bytes)
DATA_al_azar_8396:
	defb 009h,000h,000h,0d3h,085h,05dh,086h,0e7h,086h,038h,087h,080h,087h,0cch,087h,0eah	; 8396  .....]...8......
	defb 087h,025h,088h,01eh,023h,028h,02dh,032h,037h,05ah,05fh,064h	; 83a6  .%..#(-27Z_d

; ----------------------------------------------------------------------
; DATOS al_azar_83B2: [n] y n mensajes y n umbrales (0-99): uno al azar
;   (p01:6142, p01:6172); lo leen p01:6142 (34 bytes)
;   0x83b2..0x83d4  (34 bytes)
DATA_al_azar_83B2:
	defb 00bh,000h,000h,0adh,089h,0fdh,089h,036h,08ah,090h,08ah,080h,087h,0cch,087h,0eah	; 83b2  .......6........
	defb 087h,00fh,08ch,055h,08ch,09eh,08ch,019h,01eh,023h,028h,02dh,032h,04bh,050h,055h	; 83c2  ...U.....#(-2KPU
	defb 05ah,064h	; 83d2

; ----------------------------------------------------------------------
; DATOS al_azar_83D4: [n] y n mensajes y n umbrales (0-99): uno al azar
;   (p01:6142, p01:6172); lo leen p01:6142 (25 bytes)
;   0x83d4..0x83ed  (25 bytes)
DATA_al_azar_83D4:
	defb 008h,000h,000h,036h,096h,070h,096h,02ch,097h,090h,097h,06eh,098h,0b8h,09ah,0c7h	; 83d4  ...6.p.,...n....
	defb 09ch,019h,023h,02dh,037h,041h,04bh,055h,064h	; 83e4  ..#-7AKUd

; ----------------------------------------------------------------------
; DATOS al_azar_83ED: [n] y n mensajes y n umbrales (0-99): uno al azar
;   (p01:6142, p01:6172); lo leen p01:6142 (10 bytes)
;   0x83ed..0x83f7  (10 bytes)
DATA_al_azar_83ED:
	defb 003h,000h,000h,0f0h,097h,014h,098h,014h,03ch,064h	; 83ed  ........<d

; ----------------------------------------------------------------------
; DATOS al_azar_83F7: [n] y n mensajes y n umbrales (0-99): uno al azar
;   (p01:6142, p01:6172); lo leen p01:6142 (13 bytes)
;   0x83f7..0x8404  (13 bytes)
DATA_al_azar_83F7:
	defb 004h,000h,000h,06eh,098h,00fh,099h,06eh,099h,014h,028h,03ch,064h	; 83f7  ...n...n..(<d

; ----------------------------------------------------------------------
; DATOS al_azar_8404: [n] y n mensajes y n umbrales (0-99): uno al azar
;   (p01:6142, p01:6172); lo leen p01:6142 (10 bytes)
;   0x8404..0x840e  (10 bytes)
DATA_al_azar_8404:
	defb 003h,0fah,099h,07bh,09ah,0b8h,09ah,028h,050h,064h	; 8404  ...{...(Pd

; ----------------------------------------------------------------------
; DATOS al_azar_840E: [n] y n mensajes y n umbrales (0-99): uno al azar
;   (p01:6142, p01:6172); lo leen p01:6142 (7 bytes)
;   0x840e..0x8415  (7 bytes)
DATA_al_azar_840E:
	defb 002h,071h,09bh,0b2h,09bh,032h,064h	; 840e

; ----------------------------------------------------------------------
; DATOS al_azar_8415: [n] y n mensajes y n umbrales (0-99): uno al azar
;   (p01:6142, p01:6172); lo leen p01:6142 (7 bytes)
;   0x8415..0x841c  (7 bytes)
DATA_al_azar_8415:
	defb 002h,045h,09ch,0c7h,09ch,050h,064h	; 8415

; ----------------------------------------------------------------------
; DATOS al_azar_841C: [n] y n mensajes y n umbrales (0-99): uno al azar
;   (p01:6142, p01:6172); lo leen p01:6142 (37 bytes)
;   0x841c..0x8441  (37 bytes)
DATA_al_azar_841C:
	defb 00ch,000h,000h,0eeh,08dh,040h,08eh,060h,08eh,08fh,08eh,0c9h,08eh,008h,08fh,034h	; 841c  .....@.`.......4
	defb 08fh,0b2h,08fh,071h,090h,0ebh,090h,06ch,091h,01eh,028h,032h,037h,03ch,041h,046h	; 842c  ...q...l..(27<AF
	defb 04bh,050h,055h,05ah,064h	; 843c

; ----------------------------------------------------------------------
; DATOS al_azar_8441: [n] y n mensajes y n umbrales (0-99): uno al azar
;   (p01:6142, p01:6172); lo leen p01:6142 (10 bytes)
;   0x8441..0x844b  (10 bytes)
DATA_al_azar_8441:
	defb 003h,000h,000h,0b2h,08fh,071h,090h,028h,046h,064h	; 8441  .....q.(Fd

; ----------------------------------------------------------------------
; DATOS al_azar_844B: [n] y n mensajes y n umbrales (0-99): uno al azar
;   (p01:6142, p01:6172); lo leen p01:6142 (7 bytes)
;   0x844b..0x8452  (7 bytes)
DATA_al_azar_844B:
	defb 002h,000h,000h,0c8h,0ach,032h,064h	; 844b

; ----------------------------------------------------------------------
; DATOS conversacion_8452: 1 fichas [cabeza][condiciones][zona
;   sala][accion][puntero], cada una con sus 0xFE [espera][accion][puntero], y
;   un 0xFF (p01:608B); lo leen p01:636D (40 bytes)
;   0x8452..0x847a  (40 bytes)
DATA_conversacion_8452:
	defb 000h,000h,0b6h,0b7h,0feh,001h,000h,0c8h,0b7h,0feh,001h,000h,0d9h,0b7h,0feh,001h	; 8452  ................
	defb 000h,0f7h,0b7h,0feh,001h,000h,02eh,0b8h,0feh,001h,000h,046h,0b8h,0feh,001h,000h	; 8462  ...........F....
	defb 070h,0b8h,0feh,001h,000h,083h,0b8h,0ffh	; 8472  p.......

; ----------------------------------------------------------------------
; DATOS conversacion_847A: 1 fichas [cabeza][condiciones][zona
;   sala][accion][puntero], cada una con sus 0xFE [espera][accion][puntero], y
;   un 0xFF (p01:608B); lo leen p01:636D (30 bytes)
;   0x847a..0x8498  (30 bytes)
DATA_conversacion_847A:
	defb 000h,000h,03ch,0bbh,0feh,020h,000h,05bh,0bbh,0feh,020h,000h,067h,0bbh,0feh,020h	; 847a  ..<.. .[.. .g..
	defb 000h,0adh,0bch,0feh,020h,000h,0c2h,0bch,0feh,020h,000h,004h,0bdh,0ffh	; 848a  .... .... ....

; ----------------------------------------------------------------------
; DATOS conversacion_8498: 1 fichas [cabeza][condiciones][zona
;   sala][accion][puntero], cada una con sus 0xFE [espera][accion][puntero], y
;   un 0xFF (p01:608B); lo leen p01:636D (25 bytes)
;   0x8498..0x84b1  (25 bytes)
DATA_conversacion_8498:
	defb 000h,000h,057h,0b9h,0feh,020h,000h,0a9h,0b9h,0feh,020h,000h,0bah,0b9h,0feh,020h	; 8498  ..W.. .... ....
	defb 000h,029h,0bah,0feh,020h,000h,03dh,0bah,0ffh	; 84a8  .).. .=..

; ----------------------------------------------------------------------
; DATOS conversacion_84B1: 1 fichas [cabeza][condiciones][zona
;   sala][accion][puntero], cada una con sus 0xFE [espera][accion][puntero], y
;   un 0xFF (p01:608B); lo leen p01:636D (60 bytes)
;   0x84b1..0x84ed  (60 bytes)
DATA_conversacion_84B1:
	defb 000h,000h,042h,0afh,0feh,001h,000h,05fh,0afh,0feh,001h,000h,07bh,0afh,0feh,001h	; 84b1  ..B...._....{...
	defb 000h,00fh,0b0h,0feh,010h,000h,021h,0b0h,0feh,001h,000h,04eh,0b0h,0feh,001h,000h	; 84c1  ......!....N....
	defb 091h,0b0h,0feh,001h,000h,0a2h,0b0h,0feh,001h,000h,01fh,0b1h,0feh,001h,000h,037h	; 84d1  ...............7
	defb 0b1h,0feh,001h,000h,082h,0b1h,0feh,001h,000h,09dh,0b1h,0ffh	; 84e1  ............

; ----------------------------------------------------------------------
; DATOS conversacion_84ED: 1 fichas [cabeza][condiciones][zona
;   sala][accion][puntero], cada una con sus 0xFE [espera][accion][puntero], y
;   un 0xFF (p01:608B); lo leen p01:636D (30 bytes)
;   0x84ed..0x850b  (30 bytes)
DATA_conversacion_84ED:
	defb 000h,000h,033h,0bdh,0feh,001h,000h,052h,0bdh,0feh,001h,000h,06ch,0bdh,0feh,001h	; 84ed  ..3....R....l...
	defb 000h,094h,0bdh,0feh,001h,000h,0b4h,0bdh,0feh,020h,000h,0cbh,0bdh,0ffh	; 84fd  ......... ....

; ----------------------------------------------------------------------
; DATOS conversacion_850B: 1 fichas [cabeza][condiciones][zona
;   sala][accion][puntero], cada una con sus 0xFE [espera][accion][puntero], y
;   un 0xFF (p01:608B); lo leen p01:636D (40 bytes)
;   0x850b..0x8533  (40 bytes)
DATA_conversacion_850B:
	defb 000h,000h,059h,0bah,0feh,001h,000h,062h,0bah,0feh,001h,000h,07ah,0bah,0feh,001h	; 850b  ..Y....b....z...
	defb 000h,082h,0bah,0feh,001h,000h,0c7h,0bah,0feh,001h,000h,0cfh,0bah,0feh,001h,000h	; 851b  ................
	defb 00eh,0bbh,0feh,001h,000h,019h,0bbh,0ffh	; 852b  ........

; ----------------------------------------------------------------------
; DATOS conversacion_8533: 1 fichas [cabeza][condiciones][zona
;   sala][accion][puntero], cada una con sus 0xFE [espera][accion][puntero], y
;   un 0xFF (p01:608B); lo leen p01:636D (15 bytes)
;   0x8533..0x8542  (15 bytes)
DATA_conversacion_8533:
	defb 000h,000h,0dfh,0bdh,0feh,001h,000h,0feh,0bdh,0feh,001h,000h,03eh,0beh,0ffh	; 8533  ............>..

; ----------------------------------------------------------------------
; DATOS conversacion_8542: 1 fichas [cabeza][condiciones][zona
;   sala][accion][puntero], cada una con sus 0xFE [espera][accion][puntero], y
;   un 0xFF (p01:608B); lo leen p01:636D (10 bytes)
;   0x8542..0x854c  (10 bytes)
DATA_conversacion_8542:
	defb 000h,000h,04ah,0beh,0feh,0a0h,000h,05bh,0beh,0ffh	; 8542  ..J....[..

; ----------------------------------------------------------------------
; DATOS mensaje_854C: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (135 bytes)
;   0x854c..0x85d3  (135 bytes)
DATA_mensaje_854C:
	defb 002h,078h,050h,034h,030h,0e5h,09dh,0ebh,0a7h,0ebh,0e4h,0e4h,0feh,09dh,0ebh,0a7h	; 854c  .xP40...........
	defb 0ebh,0e4h,09dh,0abh,081h,093h,0e6h,0fdh,0b4h,0d0h,0ebh,094h,0a7h,08ch,093h,038h	; 855c  ...............8
	defb 030h,037h,026h,071h,02ah,056h,036h,0f8h,03eh,0feh,02ah,04bh,0b3h,0adh,0b4h,0bdh	; 856c  07&q*V6.>.*K....
	defb 0ebh,0a6h,0adh,0bch,03ah,0f8h,03bh,0f8h,049h,030h,037h,026h,0feh,04dh,03dh,0e6h	; 857c  ....:...I07&.M=.
	defb 0fdh,05dh,02ah,04bh,0e5h,02eh,02eh,03dh,05dh,026h,034h,026h,03dh,02eh,038h,039h	; 858c  .]*K...=]&4&=.89
	defb 04bh,0feh,050h,02ah,04dh,02ah,04bh,0e4h,0e4h,0feh,029h,048h,02ch,03ah,034h,037h	; 859c  K.P*M*K...)H,:47
	defb 04dh,038h,029h,047h,027h,050h,0e6h,0fdh,08bh,0d1h,082h,099h,08ch,082h,03eh,002h	; 85ac  M8)G'P........>.
	defb 005h,001h,0e4h,002h,006h,04ah,0e6h,0feh,0f8h,07bh,0f8h,071h,030h,037h,0e1h,0e4h	; 85bc  .....J...{.q07..
	defb 0e4h,0e4h,059h,072h,025h,03ch,0fbh	; 85cc

; ----------------------------------------------------------------------
; DATOS mensaje_85D3: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:616C (138 bytes)
;   0x85d3..0x865d  (138 bytes)
DATA_mensaje_85D3:
	defb 002h,078h,0b3h,0adh,0b4h,0bdh,0ebh,0beh,0a8h,03dh,089h,082h,0b7h,082h,03eh,0f8h	; 85d3  .x.......=....>.
	defb 045h,0f8h,007h,003h,0feh,02ah,026h,0e5h,0f8h,045h,0f8h,02eh,005h,02ah,026h,05dh	; 85e3  E....*&..E...*&]
	defb 037h,0e6h,0fdh,002h,02ah,026h,053h,0f8h,046h,0f8h,005h,0f8h,022h,0f8h,078h,0f8h	; 85f3  7...*&S.F...".x.
	defb 02ah,0e5h,085h,087h,098h,082h,089h,0e5h,0feh,083h,0f8h,02fh,0e6h,0fdh,003h,02ah	; 8603  *........../...*
	defb 026h,03eh,0bbh,0cfh,086h,0e5h,004h,02ah,026h,03eh,088h,0adh,086h,0d1h,0feh,082h	; 8613  &>.....*&>......
	defb 02ah,026h,03eh,036h,09bh,0aah,080h,0e5h,005h,02ah,026h,03eh,0f8h,012h,0f8h,023h	; 8623  *&>6.....*&>...#
	defb 034h,0feh,035h,03dh,0f8h,038h,02ah,036h,09bh,0aah,080h,0e6h,0fdh,00ch,002h,03eh	; 8633  4.5=.8*6.......>
	defb 0bfh,086h,0e5h,0b8h,0adh,0a3h,087h,089h,0e5h,00ch,003h,03eh,0f8h,034h,0feh,089h	; 8643  ...........>.4..
	defb 082h,04ah,0e4h,0e4h,0e4h,059h,072h,025h,03ch,0fbh	; 8653  .J...Yr%<.

; ----------------------------------------------------------------------
; DATOS mensaje_865D: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:616C (138 bytes)
;   0x865d..0x86e7  (138 bytes)
DATA_mensaje_865D:
	defb 002h,078h,0b3h,0adh,0b4h,0bdh,0ebh,0beh,0a8h,03ah,03eh,083h,0a9h,0c0h,0ebh,08fh	; 865d  .x.......:>.....
	defb 0ebh,053h,0feh,003h,0f8h,072h,025h,04dh,050h,0e6h,0fdh,0f8h,04ah,083h,0a9h,0c0h	; 866d  .S...r%MP...J...
	defb 0ebh,08fh,0ebh,053h,005h,010h,0e5h,004h,010h,0e5h,003h,010h,0feh,0e5h,002h,010h	; 867d  ...S............
	defb 03ah,0f8h,020h,043h,04ch,0e5h,0f8h,036h,083h,0a9h,0c0h,0ebh,08fh,0ebh,03eh,0feh	; 868d  :. CL..6......>.
	defb 003h,010h,0e5h,00ch,002h,0e5h,00ch,003h,03ah,038h,043h,04dh,03dh,0e6h,0fdh,02eh	; 869d  ........:8CM=...
	defb 02eh,03dh,083h,0a9h,0c0h,0ebh,08fh,0ebh,03eh,019h,01fh,01eh,00fh,01ch,0feh,012h	; 86ad  .=......>.......
	defb 00fh,00bh,020h,00fh,018h,038h,035h,053h,071h,037h,0f8h,027h,0f8h,010h,060h,0feh	; 86bd  .. ..85Sq7.'..`.
	defb 04ah,062h,039h,026h,038h,026h,02dh,039h,026h,03dh,04ah,0e6h,0fdh,050h,02ah,071h	; 86cd  Jb9&8&-9&=J..P*q
	defb 034h,0e1h,0e4h,0e4h,0e4h,059h,072h,025h,03ch,0fbh	; 86dd  4....Yr%<.

; ----------------------------------------------------------------------
; DATOS mensaje_86E7: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:616C (81 bytes)
;   0x86e7..0x8738  (81 bytes)
DATA_mensaje_86E7:
	defb 002h,078h,093h,081h,0a9h,039h,04bh,005h,010h,03ah,025h,04dh,050h,0e6h,0feh,005h	; 86e7  .x...9K..:%MP...
	defb 010h,03eh,03ch,0f8h,012h,0f8h,023h,034h,035h,03dh,0f8h,038h,02ah,036h,0f8h,01eh	; 86f7  .><...#45=.8*6..
	defb 0f8h,069h,039h,0feh,03dh,0fdh,05dh,02ah,04bh,08ah,082h,094h,0e5h,08bh,0d2h,087h	; 8707  .i9.=.]*K.......
	defb 0bch,082h,0e5h,0aah,0cfh,085h,0feh,0ebh,0a8h,0ebh,0a0h,0e5h,08bh,0d1h,087h,08bh	; 8717  ................
	defb 0d0h,039h,052h,02ah,053h,025h,04dh,0feh,03dh,0e4h,0e4h,0e4h,059h,072h,025h,03ch	; 8727  .9R*S%M.=...Yr%<
	defb 0fbh	; 8737

; ----------------------------------------------------------------------
; DATOS mensaje_8738: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:616C (72 bytes)
;   0x8738..0x8780  (72 bytes)
DATA_mensaje_8738:
	defb 002h,078h,0f8h,00eh,02ah,026h,03dh,0b8h,08ch,093h,08bh,0d1h,0ebh,093h,03eh,00ch	; 8738  .x..*&=.......>.
	defb 003h,03dh,0b2h,0feh,09fh,08bh,0d2h,0a7h,0f8h,02fh,041h,036h,039h,053h,071h,037h	; 8748  .=......./A69Sq7
	defb 026h,04dh,050h,0e6h,0fdh,03ah,056h,0f8h,04bh,03ah,036h,02ah,028h,04dh,02dh,061h	; 8758  &MP..:V.K:6*(M-a
	defb 0b2h,09fh,08bh,0d2h,0a7h,086h,0feh,03ah,03eh,0f8h,013h,051h,036h,02dh,037h,03ch	; 8768  .......:>..Q6-7<
	defb 0e4h,0e4h,0e4h,059h,072h,025h,03ch,0fbh	; 8778  ...Yr%<.

; ----------------------------------------------------------------------
; DATOS mensaje_8780: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:616C (76 bytes)
;   0x8780..0x87cc  (76 bytes)
DATA_mensaje_8780:
	defb 002h,078h,0b3h,0adh,0b4h,0bdh,0ebh,0a6h,0adh,0bch,03ah,03eh,0f8h,044h,05bh,026h	; 8780  .x........:>.D[&
	defb 03dh,02eh,061h,0feh,047h,034h,035h,053h,026h,04dh,03dh,0e6h,0f8h,035h,0f8h,00ch	; 8790  =.a.G45S&M=..5..
	defb 0f8h,00eh,02eh,02ch,03dh,0f8h,03ah,08eh,0feh,082h,089h,0b4h,0e4h,0e4h,0e4h,0fdh	; 87a0  ...,=.:.........
	defb 0a0h,0b4h,0d0h,086h,039h,02eh,061h,047h,034h,035h,05dh,02ah,04bh,0aeh,081h,03eh	; 87b0  ....9.aG45]*K..>
	defb 0feh,039h,026h,050h,0e4h,0e4h,0e4h,059h,072h,025h,03ch,0fbh	; 87c0  .9&P...Yr%<.

; ----------------------------------------------------------------------
; DATOS mensaje_87CC: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4, p01:616C (30 bytes)
;   0x87cc..0x87ea  (30 bytes)
DATA_mensaje_87CC:
	defb 002h,078h,0f8h,01ch,03eh,08fh,081h,09fh,0adh,0b0h,053h,050h,04dh,026h,03dh,0e0h	; 87cc  .x..>.....SPM&=.
	defb 0e4h,0e4h,0e4h,0feh,025h,038h,03ah,030h,037h,0e5h,0b2h,0a1h,0adh,0fbh	; 87dc  ....%8:07.....

; ----------------------------------------------------------------------
; DATOS mensaje_87EA: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:616C (59 bytes)
;   0x87ea..0x8825  (59 bytes)
DATA_mensaje_87EA:
	defb 002h,078h,02eh,02eh,03dh,0bch,080h,03eh,031h,065h,037h,089h,0adh,0c4h,0d1h,0ebh	; 87ea  .x..=..>1e7.....
	defb 08fh,032h,0feh,026h,054h,074h,02fh,04eh,037h,04dh,03dh,0e6h,0fdh,033h,04eh,05ch	; 87fa  .2.&Tt/N7M=..3N\
	defb 04eh,03dh,013h,00dh,085h,0ebh,0bch,053h,039h,026h,038h,025h,02dh,0feh,04bh,04eh	; 880a  N=.....S9&8%-.KN
	defb 039h,026h,050h,0e4h,0e4h,0e4h,059h,072h,025h,03ch,0fbh	; 881a  9&P...Yr%<.

; ----------------------------------------------------------------------
; DATOS mensaje_8825: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:616C (52 bytes)
;   0x8825..0x8859  (52 bytes)
DATA_mensaje_8825:
	defb 002h,078h,0f8h,022h,0f8h,078h,0f8h,02ah,03ah,03eh,02eh,03dh,0a5h,082h,08ah,081h	; 8825  .x.".x.*:>.=....
	defb 03dh,0b6h,0adh,0c1h,082h,0feh,053h,050h,02ah,04dh,09eh,0cfh,0c5h,053h,025h,04dh	; 8835  =.....SP*M...S%M
	defb 050h,0e6h,0fdh,0f8h,047h,0f8h,002h,030h,037h,0f8h,018h,037h,0e4h,0e4h,0e4h,059h	; 8845  P...G..07..7...Y
	defb 072h,025h,03ch,0fbh	; 8855

; ----------------------------------------------------------------------
; DATOS mensaje_8859: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (69 bytes)
;   0x8859..0x889e  (69 bytes)
DATA_mensaje_8859:
	defb 002h,078h,01dh,018h,00bh,015h,00fh,0e0h,050h,034h,030h,0e4h,0e4h,0e4h,0feh,08bh	; 8859  .x......P40.....
	defb 0d2h,082h,08fh,081h,053h,062h,04eh,035h,072h,071h,037h,036h,02ah,043h,071h,0feh	; 8869  ....SbN5rq76*Cq.
	defb 035h,072h,071h,034h,03dh,0e0h,0e0h,034h,031h,02dh,037h,0e0h,0fdh,0e4h,0e4h,0e4h	; 8879  5rq4=..41-7.....
	defb 09eh,0a8h,09bh,0f8h,054h,0f8h,023h,038h,08dh,0cfh,08bh,0d2h,087h,053h,038h,0feh	; 8889  ....T.#8.....S8.
	defb 04eh,034h,03dh,03ah,0fbh	; 8899

; ----------------------------------------------------------------------
; DATOS mensaje_889E: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (17 bytes)
;   0x889e..0x88af  (17 bytes)
DATA_mensaje_889E:
	defb 002h,076h,061h,02eh,05dh,0e1h,0e0h,0e4h,0e4h,0e4h,0f8h,02fh,0f8h,02dh,03eh,0e1h	; 889e  .va.]....../.->.
	defb 0fbh	; 88ae

; ----------------------------------------------------------------------
; DATOS mensaje_88AF: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (50 bytes)
;   0x88af..0x88e1  (50 bytes)
DATA_mensaje_88AF:
	defb 002h,078h,0e4h,0e4h,0e4h,050h,02ah,04bh,039h,026h,0e6h,0f8h,067h,02ah,02ch,030h	; 88af  .x...P*K9&..g*,0
	defb 02fh,04eh,037h,0feh,034h,02ah,04bh,0e6h,08fh,0abh,0ebh,0beh,0a8h,03dh,061h,02eh	; 88bf  /N7.4*K......=a.
	defb 02ah,05dh,038h,029h,0feh,047h,027h,02dh,061h,0e4h,0e4h,0e4h,033h,027h,05dh,050h	; 88cf  *]8).G'-a...3']P
	defb 0e0h,0fbh	; 88df

; ----------------------------------------------------------------------
; DATOS mensaje_88E1: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (99 bytes)
;   0x88e1..0x8944  (99 bytes)
DATA_mensaje_88E1:
	defb 002h,078h,01dh,018h,00bh,015h,00fh,0e0h,0f8h,006h,0e4h,0e4h,0e4h,0f8h,006h,053h	; 88e1  .x.............S
	defb 031h,04dh,03dh,0e6h,0feh,050h,034h,030h,03dh,0f8h,000h,02ah,04bh,0e4h,0e4h,0e4h	; 88f1  1M=..P40=..*K...
	defb 083h,0a9h,0c0h,0ebh,08fh,0ebh,0feh,03dh,0f8h,006h,053h,031h,04dh,0e6h,0fdh,033h	; 8901  .......=..S1M..3
	defb 04eh,02ah,04bh,0e4h,0e4h,0e4h,0f8h,004h,02ah,04bh,03eh,0c7h,0adh,0c5h,03dh,04ah	; 8911  N*K.....*K>...=J
	defb 0feh,027h,039h,0f8h,006h,053h,02bh,02eh,028h,04dh,050h,0e6h,0f8h,03eh,038h,027h	; 8921  .'9..S+.(MP..>8'
	defb 030h,04fh,02ah,0feh,04bh,03eh,0f8h,034h,03dh,039h,053h,04eh,04dh,0f8h,006h,053h	; 8931  0O*.K>.4=9SNM..S
	defb 031h,04dh,0fbh	; 8941

; ----------------------------------------------------------------------
; DATOS mensaje_8944: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (54 bytes)
;   0x8944..0x897a  (54 bytes)
DATA_mensaje_8944:
	defb 003h,076h,0f8h,03eh,057h,02ah,04bh,0f8h,034h,03dh,0f8h,006h,0e4h,0e4h,0e4h,0f8h	; 8944  .v.>W*K.4=......
	defb 004h,02ah,04bh,0c7h,0adh,0c5h,0feh,0f8h,006h,0e4h,0e4h,0e4h,0f8h,000h,02ah,04bh	; 8954  .*K...........*K
	defb 083h,0a9h,0c0h,0ebh,08fh,0ebh,0f8h,006h,0e1h,0feh,0f8h,006h,03dh,09eh,0cfh,0c5h	; 8964  ............=...
	defb 053h,060h,02bh,034h,039h,0fbh	; 8974

; ----------------------------------------------------------------------
; DATOS mensaje_897A: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (51 bytes)
;   0x897a..0x89ad  (51 bytes)
DATA_mensaje_897A:
	defb 002h,078h,01dh,018h,00bh,015h,00fh,0e0h,02ah,04eh,04bh,050h,034h,030h,03dh,0a0h	; 897a  .x......*NKP40=.
	defb 08dh,0adh,0feh,086h,03ah,0f8h,013h,053h,036h,02ah,039h,02ah,071h,034h,044h,034h	; 898a  ....:..S6*9*q4D4
	defb 026h,0e6h,0feh,05dh,02dh,061h,03eh,048h,02ch,02bh,037h,071h,0e0h,043h,071h,037h	; 899a  &..]-a>H,+7q.Cq7
	defb 04dh,050h,0fbh	; 89aa

; ----------------------------------------------------------------------
; DATOS mensaje_89AD: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:616C (80 bytes)
;   0x89ad..0x89fd  (80 bytes)
DATA_mensaje_89AD:
	defb 002h,078h,08fh,0abh,0ebh,0beh,0a8h,03eh,034h,02ah,02fh,007h,001h,001h,0a1h,0ebh	; 89ad  .x.....>4*/.....
	defb 093h,0a8h,0feh,0e5h,0f8h,045h,0f8h,007h,002h,010h,0e5h,0f8h,045h,0f8h,02eh,002h	; 89bd  .....E......E...
	defb 010h,0e5h,002h,001h,010h,0e5h,0feh,003h,001h,010h,0e5h,004h,001h,010h,0e5h,005h	; 89cd  ................
	defb 001h,010h,0e8h,01ch,0e9h,0e6h,0fdh,003h,001h,010h,03ah,0f8h,062h,045h,02bh,03dh	; 89dd  ..........:.bE+=
	defb 0c0h,0a6h,0adh,0b8h,053h,025h,04dh,0feh,050h,0e4h,0e4h,059h,072h,025h,03ch,0fbh	; 89ed  ....S%M.P..Yr%<.

; ----------------------------------------------------------------------
; DATOS mensaje_89FD: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:616C (57 bytes)
;   0x89fd..0x8a36  (57 bytes)
DATA_mensaje_89FD:
	defb 002h,078h,08fh,0abh,0ebh,0beh,0a8h,03eh,0b3h,0adh,0b4h,0bdh,0ebh,0a6h,0adh,0bch	; 89fd  .x.....>........
	defb 0b6h,0adh,0feh,081h,086h,051h,0f8h,018h,050h,034h,032h,04dh,04ah,027h,03ah,0f8h	; 8a0d  .....Q..P42MJ':.
	defb 01fh,04bh,04eh,034h,0f8h,016h,0feh,0f8h,026h,0f8h,048h,039h,086h,0d2h,092h,0adh	; 8a1d  .KN4....&.H9....
	defb 04ah,0e4h,0e4h,0e4h,059h,072h,025h,03ch,0fbh	; 8a2d  J...Yr%<.

; ----------------------------------------------------------------------
; DATOS mensaje_8A36: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:616C (90 bytes)
;   0x8a36..0x8a90  (90 bytes)
DATA_mensaje_8A36:
	defb 002h,078h,083h,0a9h,0c0h,0ebh,08fh,0ebh,03eh,004h,0f8h,072h,025h,04dh,050h,0e6h	; 8a36  .x......>..r%MP.
	defb 0f8h,062h,083h,0a9h,0feh,0c0h,0ebh,08fh,0ebh,053h,00ch,002h,0e5h,002h,010h,0e5h	; 8a46  .b.......S......
	defb 002h,001h,010h,03ah,038h,0feh,043h,04ch,0e6h,0fdh,0f8h,046h,0f8h,005h,083h,0a9h	; 8a56  ...:8.CL...F....
	defb 0c0h,0ebh,08fh,0ebh,053h,002h,010h,0e5h,003h,001h,010h,0e5h,0feh,0f8h,050h,083h	; 8a66  ....S.........P.
	defb 0a9h,0c0h,0ebh,08fh,0ebh,053h,002h,010h,0e5h,004h,001h,010h,03ah,038h,0feh,043h	; 8a76  .....S......:8.C
	defb 04dh,050h,0e4h,0e4h,0e4h,059h,072h,025h,03ch,0fbh	; 8a86  MP...Yr%<.

; ----------------------------------------------------------------------
; DATOS mensaje_8A90: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4, p01:616C (51 bytes)
;   0x8a90..0x8ac3  (51 bytes)
DATA_mensaje_8A90:
	defb 002h,078h,002h,001h,010h,02ah,04bh,003h,001h,010h,03ah,03eh,0a6h,08dh,0adh,085h	; 8a90  .x...*K...:>....
	defb 081h,0b8h,0feh,0adh,053h,025h,071h,034h,03eh,05ah,0e6h,031h,02eh,030h,02bh,036h	; 8aa0  ....S%q4>Z.1.0+6
	defb 026h,02dh,061h,0feh,082h,0adh,0bch,082h,03ah,039h,04dh,050h,0e4h,0e4h,059h,072h	; 8ab0  &-a.....:9MP..Yr
	defb 025h,03ch,0fbh	; 8ac0

; ----------------------------------------------------------------------
; DATOS mensaje_8AC3: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (29 bytes)
;   0x8ac3..0x8ae0  (29 bytes)
DATA_mensaje_8AC3:
	defb 002h,078h,043h,04ah,026h,03dh,0a2h,0a7h,03eh,089h,0adh,0c3h,08ch,047h,036h,02ah	; 8ac3  .xCJ&=..>....G6*
	defb 028h,039h,0feh,026h,050h,0e4h,0e4h,0e4h,059h,072h,025h,03ch,0fbh	; 8ad3  (9.&P...Yr%<.

; ----------------------------------------------------------------------
; DATOS mensaje_8AE0: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (26 bytes)
;   0x8ae0..0x8afa  (26 bytes)
DATA_mensaje_8AE0:
	defb 002h,078h,0b4h,0a6h,081h,08fh,0adh,090h,086h,039h,04bh,004h,010h,03ah,025h,04dh	; 8ae0  .x.......9K..:%M
	defb 050h,0feh,0e4h,0e4h,0e4h,059h,072h,025h,03ch,0fbh	; 8af0  P....Yr%<.

; ----------------------------------------------------------------------
; DATOS mensaje_8AFA: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (134 bytes)
;   0x8afa..0x8b80  (134 bytes)
DATA_mensaje_8AFA:
	defb 002h,078h,01dh,018h,00bh,015h,00fh,0e5h,08fh,0abh,0ebh,0beh,0a8h,03ah,0c3h,0a6h	; 8afa  .x...........:..
	defb 08bh,0d1h,0feh,0ebh,093h,02eh,027h,02ah,087h,0adh,0a9h,0adh,0f8h,06fh,03dh,0c0h	; 8b0a  ......'*.....o=.
	defb 0a6h,0adh,0b8h,053h,0feh,025h,071h,034h,060h,030h,074h,0e1h,0fdh,033h,02eh,02ah	; 8b1a  ...S.%q4`0t..3.*
	defb 04bh,099h,0adh,0b0h,0a6h,081h,0b8h,0ebh,053h,025h,04eh,062h,087h,0feh,0a9h,0bdh	; 8b2a  K.......S%Nb....
	defb 08ch,051h,038h,063h,02eh,028h,04bh,04eh,04dh,050h,0e6h,0fdh,099h,0adh,0b0h,0a6h	; 8b3a  .Q8c.(KNMP......
	defb 081h,0b8h,0ebh,03eh,0b3h,0adh,0b4h,0bdh,0ebh,0beh,0a8h,03dh,0feh,002h,010h,03dh	; 8b4a  ...>.......=...=
	defb 0f8h,04ah,03ah,025h,04dh,03eh,05ah,04ah,0e6h,0fdh,085h,0adh,08bh,0d0h,08ah,081h	; 8b5a  .J:%M>ZJ........
	defb 03dh,0f8h,028h,03ah,0f8h,018h,034h,02eh,038h,053h,025h,04dh,0feh,03dh,0e4h,0e4h	; 8b6a  =.(:..4.8S%M.=..
	defb 0e4h,059h,072h,025h,03ch,0fbh	; 8b7a

; ----------------------------------------------------------------------
; DATOS mensaje_8B80: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (103 bytes)
;   0x8b80..0x8be7  (103 bytes)
DATA_mensaje_8B80:
	defb 002h,0deh,084h,0a9h,05dh,0e6h,09bh,0c8h,0adh,03dh,0ebh,0f8h,052h,05dh,0e6h,033h	; 8b80  ....]....=..R].3
	defb 02eh,02ah,04bh,0feh,0b8h,081h,0bfh,060h,02bh,04dh,03dh,03eh,0f8h,062h,045h,02bh	; 8b90  .*K....`+M=>.bE+
	defb 03dh,02ah,05bh,053h,040h,0feh,026h,034h,038h,02bh,05dh,02dh,05dh,05bh,0e6h,0fdh	; 8ba0  =*[S@.&48+]-][..
	defb 026h,036h,047h,03eh,0f8h,050h,045h,02bh,05dh,053h,025h,04dh,08bh,0d1h,0adh,085h	; 8bb0  &6G>.PE+]S%M....
	defb 0adh,0feh,05dh,02dh,02ah,058h,045h,02bh,053h,02ah,050h,04dh,052h,05dh,0e6h,0fdh	; 8bc0  ..]-*XE+S*PMR]..
	defb 033h,03dh,08bh,0d1h,0adh,085h,0adh,051h,03dh,053h,031h,039h,0feh,0e4h,0e4h,0e4h	; 8bd0  3=.....Q=S19....
	defb 027h,043h,02ch,048h,04eh,04ah,0fbh	; 8be0

; ----------------------------------------------------------------------
; DATOS mensaje_8BE7: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (40 bytes)
;   0x8be7..0x8c0f  (40 bytes)
DATA_mensaje_8BE7:
	defb 002h,078h,0f8h,02ch,0f8h,06eh,0f8h,02dh,03dh,0f8h,046h,03dh,02eh,038h,03eh,050h	; 8be7  .x.,.n.-=.F=.8>P
	defb 034h,030h,060h,047h,050h,02ah,0feh,04bh,039h,026h,050h,0e6h,0feh,0b2h,0a1h,0adh	; 8bf7  40`GP*.K9&P.....
	defb 0e4h,0e4h,0e4h,059h,072h,025h,03ch,0fbh	; 8c07  ...Yr%<.

; ----------------------------------------------------------------------
; DATOS mensaje_8C0F: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:616C (70 bytes)
;   0x8c0f..0x8c55  (70 bytes)
DATA_mensaje_8C0F:
	defb 002h,078h,0b3h,0adh,0b4h,0bdh,0ebh,0beh,0a8h,038h,08fh,0abh,0ebh,0beh,0a8h,03dh	; 8c0f  .x.......8.....=
	defb 08ch,081h,0feh,0b1h,0adh,03eh,029h,039h,059h,04ah,0e6h,0fdh,036h,043h,04ch,040h	; 8c1f  .....>)9YJ..6CL@
	defb 034h,036h,03dh,0beh,0a8h,03eh,08ch,081h,089h,082h,060h,036h,0feh,039h,053h,071h	; 8c2f  46=..>....`6.9Sq
	defb 037h,026h,04dh,038h,026h,027h,02eh,038h,059h,072h,039h,026h,0e1h,0feh,0e4h,0e4h	; 8c3f  7&M8&'.8Yr9&....
	defb 0e4h,059h,072h,025h,03ch,0fbh	; 8c4f

; ----------------------------------------------------------------------
; DATOS mensaje_8C55: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:616C (73 bytes)
;   0x8c55..0x8c9e  (73 bytes)
DATA_mensaje_8C55:
	defb 002h,078h,080h,084h,0b4h,0d0h,08bh,0adh,03ah,03eh,03dh,071h,037h,039h,026h,02dh	; 8c55  .x......:>=q79&-
	defb 061h,0fdh,0b3h,0adh,0b4h,0bdh,0ebh,0beh,0a8h,038h,08fh,0abh,0ebh,0beh,0a8h,03eh	; 8c65  a........8.....>
	defb 0f8h,045h,0f8h,007h,0feh,060h,036h,039h,053h,071h,037h,026h,04dh,071h,037h,026h	; 8c75  .E...`69Sq7&Mq7&
	defb 027h,02eh,061h,047h,034h,0feh,035h,03dh,082h,0abh,08ah,051h,02bh,026h,034h,02dh	; 8c85  '.aG4.5=...Q+&4-
	defb 061h,0feh,0e4h,0e4h,059h,072h,025h,03ch,0fbh	; 8c95  a...Yr%<.

; ----------------------------------------------------------------------
; DATOS mensaje_8C9E: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:616C (79 bytes)
;   0x8c9e..0x8ced  (79 bytes)
DATA_mensaje_8C9E:
	defb 002h,078h,0b3h,0adh,0b4h,0bdh,0ebh,0a6h,0adh,0bch,03ah,03eh,029h,029h,02ch,03dh	; 8c9e  .x........:>)),=
	defb 02eh,061h,0feh,047h,034h,035h,053h,026h,04dh,060h,030h,074h,027h,0e1h,0fdh,05dh	; 8cae  .a.G45S&M`0t'..]
	defb 02ah,04bh,0e5h,02eh,061h,047h,034h,035h,053h,0f8h,030h,0f8h,049h,04ch,060h,02bh	; 8cbe  *K..aG45S.0.IL`+
	defb 04dh,0feh,0f8h,055h,02fh,039h,02ah,02ch,04eh,0f8h,02fh,0f8h,02dh,053h,034h,02ch	; 8cce  M..U/9*,N./.-S4,
	defb 02fh,052h,025h,04dh,0feh,03dh,04ah,0e4h,0e4h,0e4h,059h,072h,025h,03ch,0fbh	; 8cde  /R%M.=J...Yr%<.

; ----------------------------------------------------------------------
; DATOS mensaje_8CED: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (74 bytes)
;   0x8ced..0x8d37  (74 bytes)
DATA_mensaje_8CED:
	defb 002h,078h,03eh,04dh,062h,04dh,095h,09dh,0adh,03dh,084h,086h,094h,0abh,02ah,04bh	; 8ced  .x>MbM...=....*K
	defb 038h,04ch,0feh,04ah,032h,034h,039h,04ch,02eh,03dh,031h,039h,04bh,030h,026h,050h	; 8cfd  8L.J249L.=19K0&P
	defb 0e6h,0fdh,025h,04dh,02ch,038h,086h,0d1h,0cfh,0e5h,086h,0d1h,0cfh,038h,0f8h,006h	; 8d0d  ..%M,8.......8..
	defb 053h,030h,037h,0feh,0f8h,018h,036h,02ah,04dh,050h,0e6h,0f8h,047h,0f8h,002h,030h	; 8d1d  S07...6*MP..G..0
	defb 037h,0feh,0e4h,0e4h,0e4h,059h,072h,025h,03ch,0fbh	; 8d2d  7....Yr%<.

; ----------------------------------------------------------------------
; DATOS mensaje_8D37: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (58 bytes)
;   0x8d37..0x8d71  (58 bytes)
DATA_mensaje_8D37:
	defb 002h,078h,08fh,081h,087h,082h,09fh,08ah,081h,0a8h,03eh,099h,081h,0adh,0bch,00eh	; 8d37  .x........>.....
	defb 03ah,08eh,0feh,082h,0beh,031h,04dh,034h,046h,03ah,03bh,043h,03dh,0f8h,062h,0f8h	; 8d47  :....1M4F:.C=.b.
	defb 04ah,03dh,0bfh,086h,089h,0feh,03ah,025h,04dh,071h,037h,02bh,026h,034h,02dh,061h	; 8d57  J=....:%Mq7+&4-a
	defb 0e6h,0fdh,0e4h,0e4h,0e4h,059h,072h,025h,03ch,0fbh	; 8d67  .....Yr%<.

; ----------------------------------------------------------------------
; DATOS mensaje_8D71: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (82 bytes)
;   0x8d71..0x8dc3  (82 bytes)
DATA_mensaje_8D71:
	defb 002h,078h,084h,087h,0b4h,0d2h,082h,041h,03dh,0bch,080h,03eh,08bh,0adh,0f8h,049h	; 8d71  .x.....A=..>...I
	defb 0f8h,01ah,051h,040h,0feh,032h,055h,034h,046h,03ah,03bh,04ch,02ah,034h,046h,04bh	; 8d81  ..Q@.2U4F:.L*4FK
	defb 04eh,034h,04bh,030h,026h,0feh,050h,0e6h,0fdh,060h,047h,084h,082h,086h,0d1h,082h	; 8d91  N4K0&.P..`G.....
	defb 08bh,0d2h,090h,05dh,02ah,04bh,01ah,0e4h,00ch,0feh,060h,085h,0adh,08fh,0adh,03ah	; 8da1  ...]*K....`....:
	defb 099h,085h,081h,060h,02bh,04dh,03eh,05ah,04ah,0feh,0e4h,0e4h,0e4h,059h,072h,025h	; 8db1  ...`+M>ZJ....Yr%
	defb 03ch,0fbh	; 8dc1

; ----------------------------------------------------------------------
; DATOS mensaje_8DC3: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (43 bytes)
;   0x8dc3..0x8dee  (43 bytes)
DATA_mensaje_8DC3:
	defb 002h,078h,0b0h,0a9h,097h,0ebh,0bch,0e1h,0feh,0e4h,0e4h,0e4h,08fh,0abh,0ebh,0beh	; 8dc3  .x..............
	defb 0a8h,03dh,002h,001h,02ah,026h,03dh,0f8h,050h,03ah,0feh,025h,04dh,071h,037h,02bh	; 8dd3  .=..*&=.P:.%Mq7+
	defb 026h,034h,050h,0e4h,0e4h,0e4h,059h,072h,025h,03ch,0fbh	; 8de3  &4P...Yr%<.

; ----------------------------------------------------------------------
; DATOS mensaje_8DEE: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:616C (82 bytes)
;   0x8dee..0x8e40  (82 bytes)
DATA_mensaje_8DEE:
	defb 002h,079h,083h,081h,0a4h,082h,038h,09ah,086h,0d2h,082h,0f8h,01ah,03dh,035h,053h	; 8dee  .y....8......=5S
	defb 026h,03eh,086h,0feh,0d2h,082h,09bh,051h,02ah,052h,059h,04dh,02ah,061h,027h,02ah	; 8dfe  &>.....Q*RYM*a'*
	defb 060h,03eh,039h,026h,0feh,0fdh,086h,0d2h,082h,09bh,051h,089h,087h,09bh,087h,030h	; 8e0e  `>9&......Q....0
	defb 037h,039h,031h,065h,02bh,02eh,0feh,038h,051h,031h,04dh,08dh,081h,08bh,0adh,0f8h	; 8e1e  791e+..8Q1M.....
	defb 074h,053h,025h,04dh,02ah,061h,027h,02ah,0feh,05dh,0e4h,0e4h,0e4h,019h,020h,00fh	; 8e2e  tS%M*a'*.].... .
	defb 01ch,0fbh	; 8e3e

; ----------------------------------------------------------------------
; DATOS mensaje_8E40: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:616C (32 bytes)
;   0x8e40..0x8e60  (32 bytes)
DATA_mensaje_8E40:
	defb 002h,079h,08bh,0d2h,082h,0aeh,081h,053h,0f8h,052h,0f8h,069h,03dh,026h,030h,051h	; 8e40  .y.....S.R.i=&0Q
	defb 036h,04ah,02ch,031h,0feh,04dh,03dh,05dh,0e4h,0e4h,0e4h,019h,020h,00fh,01ch,0fbh	; 8e50  6J,1.M=].... ...

; ----------------------------------------------------------------------
; DATOS mensaje_8E60: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:616C (47 bytes)
;   0x8e60..0x8e8f  (47 bytes)
DATA_mensaje_8E60:
	defb 002h,079h,02fh,026h,057h,043h,060h,025h,02bh,04bh,046h,05ah,0f8h,038h,02bh,03dh	; 8e60  .y/&WC`%+KFZ.8+=
	defb 063h,063h,04dh,0feh,034h,046h,03ah,08ah,081h,0b8h,081h,0b1h,0adh,03dh,0bch,0a7h	; 8e70  ccM.4F:......=..
	defb 0d2h,087h,051h,030h,0feh,04fh,0e0h,0e4h,0e4h,0e4h,019h,020h,00fh,01ch,0fbh	; 8e80  ..Q0.O..... ...

; ----------------------------------------------------------------------
; DATOS mensaje_8E8F: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:616C (58 bytes)
;   0x8e8f..0x8ec9  (58 bytes)
DATA_mensaje_8E8F:
	defb 002h,079h,08ah,0bdh,081h,0bdh,0a8h,038h,03eh,08dh,081h,08bh,0adh,0f8h,048h,0b1h	; 8e8f  .y.....8>.....H.
	defb 0adh,085h,081h,0feh,03dh,0a2h,0adh,0b8h,081h,060h,0e5h,0f8h,038h,02bh,03dh,063h	; 8e9f  ....=....`..8+=c
	defb 04dh,081h,08bh,053h,088h,0feh,0cfh,092h,081h,0a5h,082h,081h,0adh,038h,039h,04dh	; 8eaf  M..S.........89M
	defb 0e6h,0feh,0e4h,0e4h,0e4h,019h,020h,00fh,01ch,0fbh	; 8ebf  ...... ...

; ----------------------------------------------------------------------
; DATOS mensaje_8EC9: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:616C (63 bytes)
;   0x8ec9..0x8f08  (63 bytes)
DATA_mensaje_8EC9:
	defb 002h,079h,02fh,063h,030h,02fh,038h,026h,027h,03dh,03eh,0f8h,031h,03dh,08ch,086h	; 8ec9  .y/c0/8&'=>.1=..
	defb 09eh,03ah,030h,0feh,03dh,063h,02eh,052h,060h,02ch,04dh,047h,03dh,05dh,0e6h,0feh	; 8ed9  .:0.=c.R`,MG=]..
	defb 033h,03dh,0f8h,031h,03dh,08ch,086h,09eh,03eh,08fh,081h,087h,091h,030h,034h,038h	; 8ee9  3=.1=...>....048
	defb 02bh,0feh,03ah,060h,02bh,04dh,0e6h,0e4h,0e4h,0e4h,019h,020h,00fh,01ch,0fbh	; 8ef9  +.:`+M..... ...

; ----------------------------------------------------------------------
; DATOS mensaje_8F08: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:616C (44 bytes)
;   0x8f08..0x8f34  (44 bytes)
DATA_mensaje_8F08:
	defb 002h,079h,0f8h,03ah,0f8h,02fh,060h,03dh,099h,0adh,0b8h,0adh,03ah,0a2h,099h,0adh	; 8f08  .y.:./`=....:...
	defb 085h,081h,093h,082h,0feh,03eh,039h,026h,0e6h,0feh,0f8h,027h,0f8h,010h,051h,030h	; 8f18  .....>9&...'..Q0
	defb 052h,059h,04fh,0e6h,0e4h,0e4h,0e4h,019h,020h,00fh,01ch,0fbh	; 8f28  RYO..... ...

; ----------------------------------------------------------------------
; DATOS mensaje_8F34: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:616C (126 bytes)
;   0x8f34..0x8fb2  (126 bytes)
DATA_mensaje_8F34:
	defb 002h,079h,08bh,0d2h,087h,0b2h,03dh,004h,001h,0f8h,010h,0f8h,069h,03eh,0b1h,0ebh	; 8f34  .y....=.....i>..
	defb 0a0h,051h,02fh,02dh,0feh,04dh,065h,02bh,05dh,0e6h,08bh,0d2h,082h,085h,03dh,034h	; 8f44  .Q/-.Me+].....=4
	defb 046h,081h,041h,088h,091h,0feh,083h,086h,053h,025h,036h,043h,071h,037h,026h,04dh	; 8f54  F.A.....S%6Cq7&M
	defb 03dh,060h,025h,034h,043h,03dh,0feh,085h,081h,092h,0adh,053h,03ah,064h,02ch,039h	; 8f64  =`%4C=.....S:d,9
	defb 071h,037h,026h,04dh,0e6h,0fdh,0f8h,047h,0f8h,002h,0f8h,074h,053h,047h,071h,038h	; 8f74  q7&M...G...tSGq8
	defb 047h,092h,081h,085h,030h,037h,026h,04dh,0f8h,028h,0feh,0f8h,069h,05dh,0e6h,05dh	; 8f84  G...07&M.(..i].]
	defb 02ah,04bh,08bh,0d2h,087h,0b2h,004h,001h,0f8h,010h,03eh,0c5h,0a9h,0feh,081h,051h	; 8f94  *K........>....Q
	defb 02fh,02dh,034h,042h,027h,053h,026h,026h,0e6h,019h,020h,00fh,01ch,0fbh	; 8fa4  /-4B'S&&.. ...

; ----------------------------------------------------------------------
; DATOS mensaje_8FB2: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:616C (191 bytes)
;   0x8fb2..0x9071  (191 bytes)
DATA_mensaje_8FB2:
	defb 002h,079h,0f8h,034h,0f8h,010h,051h,029h,054h,039h,027h,02fh,026h,0e5h,026h,035h	; 8fb2  .y.4..Q)T9'/&.&5
	defb 061h,03ah,002h,001h,0feh,001h,00dh,00dh,0f8h,003h,0f8h,02eh,03eh,03dh,043h,039h	; 8fc2  a:..........>=C9
	defb 026h,0f8h,060h,053h,026h,026h,0e6h,0fdh,0f8h,043h,0f8h,04eh,03ah,0f8h,034h,0f8h	; 8fd2  &.`S&&...C.N:.4.
	defb 010h,051h,086h,0d1h,082h,08bh,0d1h,082h,031h,04dh,038h,02bh,0feh,03ah,0f8h,043h	; 8fe2  .Q......1M8+.:.C
	defb 029h,052h,038h,0f8h,034h,029h,052h,03dh,02fh,05dh,02dh,083h,097h,0a8h,0afh,0feh	; 8ff2  )R8.4)R=/]-.....
	defb 0ebh,051h,08bh,0d2h,082h,0a2h,082h,031h,04dh,0e6h,0fdh,038h,04ch,0f8h,049h,04eh	; 9002  .Q.....1M..8L.IN
	defb 034h,0f8h,034h,03dh,084h,0adh,0bch,051h,0f8h,043h,029h,052h,043h,060h,0feh,03fh	; 9012  4.4=...Q.C)RC`.?
	defb 02bh,0f8h,02eh,056h,04dh,02ah,04bh,05dh,0e6h,02fh,04bh,03ah,088h,091h,083h,086h	; 9022  +..VM*K]./K:....
	defb 0feh,053h,027h,031h,02ch,039h,04dh,034h,046h,0e5h,025h,034h,043h,03dh,03eh,034h	; 9032  .S'1,9M4F.%4C=>4
	defb 04bh,0feh,02bh,053h,033h,03dh,0f8h,069h,0e5h,03ah,064h,04dh,0e6h,0fdh,05dh,02ah	; 9042  K.+S3=.i.:dM..]*
	defb 04bh,0b4h,0d1h,0ebh,08ch,051h,03dh,044h,039h,053h,04bh,03dh,0c5h,0a9h,0feh,081h	; 9052  K....Q=D9SK=....
	defb 03eh,086h,088h,0adh,05dh,0e6h,0e4h,0e4h,0e4h,019h,020h,00fh,01ch,0feh,0fbh	; 9062  >...]..... ....

; ----------------------------------------------------------------------
; DATOS mensaje_9071: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:616C (122 bytes)
;   0x9071..0x90eb  (122 bytes)
DATA_mensaje_9071:
	defb 002h,079h,0b8h,083h,086h,051h,03dh,045h,02eh,038h,03eh,025h,071h,037h,047h,0b6h	; 9071  .y...Q=E.8>%q7G.
	defb 0cfh,08fh,0feh,081h,03ah,03eh,026h,037h,03eh,026h,02dh,039h,026h,0e6h,0fdh,0b4h	; 9081  ....:>&7>&-9&...
	defb 0a1h,0adh,048h,099h,03ah,036h,026h,034h,0b8h,083h,086h,060h,061h,03dh,092h,0feh	; 9091  ..H.:6&4...`a=..
	defb 081h,0bch,03dh,09ah,0aah,082h,0bch,02ah,051h,0f8h,018h,03bh,02ah,04eh,04dh,030h	; 90a1  ..=....*Q...*NM0
	defb 091h,0feh,082h,085h,030h,034h,0f8h,028h,0f8h,069h,047h,08ch,081h,092h,081h,02fh	; 90b1  ....04.(.iG..../
	defb 04eh,04dh,0e6h,0fdh,05dh,02ah,04bh,0e5h,083h,086h,03dh,0c5h,0a6h,0cfh,093h,09bh	; 90c1  NM..]*K...=.....
	defb 0cch,0ebh,0a0h,060h,0feh,091h,0bdh,051h,03eh,02ch,03dh,03eh,086h,088h,0adh,05dh	; 90d1  ...`...Q>,=>...]
	defb 0e6h,0feh,0e4h,0e4h,0e4h,019h,020h,00fh,01ch,0fbh	; 90e1  ...... ...

; ----------------------------------------------------------------------
; DATOS mensaje_90EB: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:616C (129 bytes)
;   0x90eb..0x916c  (129 bytes)
DATA_mensaje_90EB:
	defb 002h,079h,048h,071h,037h,030h,043h,027h,052h,05dh,0e5h,060h,02bh,04dh,052h,05dh	; 90eb  .yHq70C'R].`+MR]
	defb 038h,026h,0feh,027h,02ah,052h,059h,060h,085h,087h,08bh,0adh,051h,047h,071h,037h	; 90fb  8&.'*RY`....QGq7
	defb 0b4h,0cfh,089h,0feh,082h,031h,04dh,0e6h,0fdh,08dh,081h,089h,082h,030h,034h,0f8h	; 910b  .....1M......04.
	defb 028h,03dh,081h,0a1h,0ebh,0b4h,051h,026h,05dh,02bh,0feh,0e5h,0f8h,069h,035h,053h	; 911b  (=....Q&]+...i5S
	defb 071h,037h,047h,011h,00bh,017h,00fh,000h,019h,020h,00fh,0feh,01ch,03ah,039h,071h	; 912b  q7G...... ...:9q
	defb 034h,0f8h,027h,0f8h,010h,051h,08eh,082h,0b7h,082h,030h,037h,03eh,0feh,026h,02dh	; 913b  4.'..Q....07>.&-
	defb 039h,026h,0e6h,0fdh,0f8h,027h,0f8h,010h,051h,03eh,056h,043h,030h,0e5h,080h,0adh	; 914b  9&...'..Q>VC0...
	defb 0b4h,051h,02ah,02dh,04dh,03dh,0feh,05dh,0e6h,0e4h,0e4h,0e4h,019h,020h,00fh,01ch	; 915b  .Q*-M=.]..... ..
	defb 0fbh	; 916b

; ----------------------------------------------------------------------
; DATOS mensaje_916C: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:616C (67 bytes)
;   0x916c..0x91af  (67 bytes)
DATA_mensaje_916C:
	defb 002h,079h,039h,053h,030h,034h,080h,08dh,03dh,0a7h,0d2h,082h,053h,039h,053h,031h	; 916c  .y9S04..=...S9S1
	defb 090h,03dh,0feh,0a7h,0d2h,082h,051h,031h,02ch,039h,02ch,030h,0e5h,039h,053h,030h	; 917c  .=....Q1,9,0.9S0
	defb 034h,039h,044h,0feh,05dh,03dh,0a7h,0d2h,082h,053h,011h,00bh,017h,00fh,000h,019h	; 918c  49D.]=...S......
	defb 020h,00fh,01ch,0feh,051h,031h,02ch,039h,02ch,031h,04dh,0e6h,0e4h,0e4h,019h,020h	; 919c   ...Q1,9,1M....
	defb 00fh,01ch,0fbh	; 91ac

; ----------------------------------------------------------------------
; DATOS mensaje_91AF: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (74 bytes)
;   0x91af..0x91f9  (74 bytes)
DATA_mensaje_91AF:
	defb 002h,079h,021h,013h,01dh,0e4h,019h,012h,013h,019h,0e4h,0e4h,0e4h,0feh,012h,05dh	; 91af  .y!............]
	defb 02dh,053h,0f8h,055h,0f8h,05dh,059h,02ah,0e1h,0feh,039h,04dh,042h,061h,0e0h,02eh	; 91bf  -S.U.]Y*..9MBa..
	defb 04eh,03eh,0e4h,0e4h,0e4h,0bbh,0b4h,08fh,0a8h,031h,0feh,027h,059h,05dh,04ah,0e6h	; 91cf  N>.......1.'Y]J.
	defb 0fdh,01dh,018h,00bh,015h,00fh,0e6h,047h,027h,050h,02ah,071h,034h,03eh,05ah,05dh	; 91df  .......G'P*q4>Z]
	defb 0e6h,0feh,0e4h,0e4h,0e4h,019h,020h,00fh,01ch,0fbh	; 91ef  ...... ...

; ----------------------------------------------------------------------
; DATOS mensaje_91F9: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (134 bytes)
;   0x91f9..0x927f  (134 bytes)
DATA_mensaje_91F9:
	defb 002h,079h,021h,013h,01dh,0e4h,019h,012h,013h,019h,0e4h,0e4h,0e4h,02fh,02ah,02fh	; 91f9  .y!........../*/
	defb 03ah,04ah,0feh,052h,060h,044h,04fh,0e6h,02eh,04eh,03eh,0a2h,0b4h,060h,03eh,039h	; 9209  :J.R`DO..N>..`>9
	defb 02ch,037h,08ch,0feh,082h,0b4h,05dh,0e6h,017h,00bh,01ch,020h,03dh,08bh,0d1h,082h	; 9219  ,7....].... =...
	defb 099h,08ch,082h,053h,0feh,050h,02ah,04dh,0e6h,0fdh,034h,05dh,030h,012h,053h,0f8h	; 9229  ...S.P*M..4]0.S.
	defb 055h,0f8h,05dh,059h,039h,03dh,051h,0f8h,047h,0f8h,002h,030h,04fh,04ah,0feh,0e6h	; 9239  U.]Y9=Q.G..0OJ..
	defb 080h,0adh,0b2h,082h,060h,047h,039h,052h,060h,047h,039h,02ah,071h,034h,052h,0feh	; 9249  ....`G9R`G9*q4R.
	defb 05dh,0e6h,086h,09fh,03eh,02fh,02ah,02fh,03ah,044h,037h,026h,034h,05dh,02dh,039h	; 9259  ]...>/*/:D7&4]-9
	defb 0feh,052h,05dh,04ah,0e6h,0fdh,001h,002h,005h,001h,0e4h,006h,002h,017h,0e4h,0e4h	; 9269  .R]J............
	defb 0e4h,019h,020h,00fh,01ch,0fbh	; 9279

; ----------------------------------------------------------------------
; DATOS mensaje_927F: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (129 bytes)
;   0x927f..0x9300  (129 bytes)
DATA_mensaje_927F:
	defb 002h,079h,08ch,097h,0ebh,087h,03ah,02eh,052h,039h,02eh,038h,051h,026h,027h,03dh	; 927f  .y....:.R9.8Q&'=
	defb 03eh,039h,0feh,052h,05dh,053h,09ch,0beh,03eh,0b6h,0cfh,089h,082h,03dh,08bh,0d2h	; 928f  >9.R]S..>....=..
	defb 087h,0a7h,0d2h,0feh,082h,038h,039h,04dh,0e6h,0fdh,0bch,087h,09ch,0beh,039h,04bh	; 929f  .....89M......9K
	defb 093h,082h,0bfh,051h,029h,038h,030h,037h,094h,081h,0feh,0b7h,082h,051h,03bh,02bh	; 92af  ...Q)807.....Q.+
	defb 0e5h,02ah,050h,051h,03eh,053h,030h,037h,02ah,04bh,048h,0feh,026h,037h,034h,065h	; 92bf  .*PQ>S07*KH.&74e
	defb 04dh,0e6h,0fdh,086h,08dh,081h,090h,0d1h,082h,053h,029h,029h,026h,03dh,060h,0f8h	; 92cf  M........S))&=`.
	defb 038h,048h,02dh,0b4h,0feh,0d2h,082h,08fh,081h,060h,034h,065h,04dh,03dh,03eh,02fh	; 92df  8H-......`4eM=>/
	defb 02dh,034h,0f8h,060h,053h,026h,0feh,026h,0e6h,0e4h,0e4h,0e4h,019h,020h,00fh,01ch	; 92ef  -4.`S&.&..... ..
	defb 0fbh	; 92ff

; ----------------------------------------------------------------------
; DATOS mensaje_9300: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (148 bytes)
;   0x9300..0x9394  (148 bytes)
DATA_mensaje_9300:
	defb 002h,079h,09eh,0a1h,048h,02eh,02ch,047h,036h,039h,04bh,00dh,0a9h,0ebh,08bh,0d2h	; 9300  .y..H.,G69K.....
	defb 0adh,03dh,0feh,0f8h,046h,03ah,025h,04dh,059h,072h,039h,026h,02ah,0e6h,0feh,00dh	; 9310  .=..F:%MYr9&*...
	defb 0a9h,0ebh,08bh,0d2h,0adh,03dh,0f8h,046h,060h,047h,00ch,003h,0a4h,095h,0cfh,093h	; 9320  .....=.F`G......
	defb 0feh,03dh,0f8h,046h,0f8h,033h,03ah,0f8h,047h,0f8h,067h,030h,037h,044h,04fh,0e6h	; 9330  .=.F.3:.G.g07DO.
	defb 0fdh,09eh,0a1h,038h,09fh,0ebh,093h,0c1h,0ebh,0a8h,03dh,093h,09eh,093h,095h,0e5h	; 9340  ...8......=.....
	defb 09eh,0feh,0a1h,038h,09bh,0a6h,0adh,087h,09bh,0a8h,093h,03dh,093h,09eh,093h,095h	; 9350  ...8.......=....
	defb 0e5h,0afh,0feh,0d1h,082h,095h,087h,038h,0c7h,092h,093h,095h,053h,0a1h,095h,0d1h	; 9360  .......8....S...
	defb 0ebh,03dh,0f8h,046h,0feh,03ah,025h,04dh,0e6h,0fdh,099h,093h,051h,04ah,063h,04ah	; 9370  .=.F.:%M....QJcJ
	defb 032h,04dh,03ah,03eh,0b4h,0d1h,082h,0bfh,0adh,05dh,0feh,0e6h,0e4h,0e4h,0e4h,019h	; 9380  2M:>.....]......
	defb 020h,00fh,01ch,0fbh	; 9390

; ----------------------------------------------------------------------
; DATOS mensaje_9394: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (179 bytes)
;   0x9394..0x9447  (179 bytes)
DATA_mensaje_9394:
	defb 002h,079h,098h,082h,0a7h,0d1h,082h,08ah,0adh,03dh,08fh,081h,08bh,0d2h,0f8h,061h	; 9394  .y.......=.....a
	defb 0e1h,0e4h,0e4h,0feh,033h,027h,02fh,039h,085h,08dh,081h,08eh,0ebh,0b8h,051h,040h	; 93a4  ....3'/9......Q@
	defb 02ch,045h,039h,03ah,0feh,02ah,053h,025h,04eh,062h,090h,0d1h,082h,0abh,060h,02bh	; 93b4  ,E9:.*S%Nb....`+
	defb 04dh,053h,0e4h,0e4h,0fdh,033h,027h,05dh,071h,0e0h,0e4h,0e4h,0e4h,090h,0d2h,089h	; 93c4  MS...3']q.......
	defb 0a9h,0ebh,093h,051h,047h,0feh,071h,037h,04dh,02ah,0e1h,090h,0d2h,089h,0a9h,0ebh	; 93d4  ...QG.q7M*......
	defb 093h,053h,025h,04eh,062h,039h,0feh,052h,038h,02ah,039h,04dh,0e6h,0fdh,0a7h,0d1h	; 93e4  .S%Nb9.R8*9M....
	defb 082h,08ah,0adh,03eh,090h,0d2h,089h,0a9h,0ebh,093h,03dh,093h,082h,0a8h,0feh,081h	; 93f4  ...>......=.....
	defb 038h,0f8h,008h,0f8h,01bh,030h,037h,08fh,0adh,08eh,038h,0aeh,0a0h,0b4h,0d2h,082h	; 9404  8....07...8.....
	defb 0f8h,05ch,0feh,03ah,039h,04dh,052h,05dh,0e6h,00dh,002h,003h,012h,003h,003h,019h	; 9414  .\.:9MR]........
	defb 002h,002h,0e4h,0feh,0e4h,0e4h,095h,093h,082h,0a8h,081h,0e6h,0fdh,090h,0d2h,089h	; 9424  ................
	defb 0a9h,0ebh,093h,051h,02fh,053h,030h,037h,044h,04fh,0feh,0e4h,0e4h,0e4h,019h,020h	; 9434  ...Q/S07DO.....
	defb 00fh,01ch,0fbh	; 9444

; ----------------------------------------------------------------------
; DATOS mensaje_9447: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (104 bytes)
;   0x9447..0x94af  (104 bytes)
DATA_mensaje_9447:
	defb 002h,079h,033h,027h,05dh,0e0h,090h,0d2h,089h,0a9h,0ebh,093h,039h,04bh,00dh,0a9h	; 9447  .y3'].......9K..
	defb 0ebh,08bh,0feh,0d2h,0adh,03dh,0f8h,046h,03ah,025h,04dh,059h,072h,039h,026h,02ah	; 9457  .....=.F:%MYr9&*
	defb 0e1h,00dh,0a9h,0ebh,0feh,08bh,0d2h,0adh,03dh,0f8h,046h,060h,047h,00ch,002h,0a4h	; 9467  ........=.F`G...
	defb 095h,0cfh,093h,03ah,0f8h,047h,0f8h,067h,0feh,030h,037h,044h,04fh,0e6h,0fdh,090h	; 9477  ...:.G.g.07DO...
	defb 0d2h,089h,0a9h,0ebh,093h,053h,0f8h,049h,071h,037h,026h,04dh,0e6h,033h,04eh,060h	; 9487  .....S.Iq7&M.3N`
	defb 0feh,0a7h,0d1h,082h,08ah,0adh,051h,0f8h,008h,0f8h,01bh,060h,02bh,04dh,0e6h,0feh	; 9497  ......Q....`+M..
	defb 0e4h,0e4h,0e4h,019h,020h,00fh,01ch,0fbh	; 94a7  .... ...

; ----------------------------------------------------------------------
; DATOS mensaje_94AF: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (133 bytes)
;   0x94af..0x9534  (133 bytes)
DATA_mensaje_94AF:
	defb 002h,079h,090h,0ebh,0b5h,039h,04bh,0e4h,0e4h,0e4h,047h,027h,050h,02ah,071h,037h	; 94af  .y...9K...G'P*q7
	defb 026h,04dh,0feh,038h,029h,047h,027h,053h,0e5h,00dh,0a9h,0ebh,08bh,0d2h,0adh,03dh	; 94bf  &M.8)G'S.......=
	defb 00ch,004h,0a4h,0feh,095h,0cfh,093h,03dh,0f8h,046h,03ah,0f8h,049h,071h,037h,026h	; 94cf  .......=.F:.Iq7&
	defb 04dh,0e6h,0fdh,097h,0b5h,09fh,061h,047h,051h,029h,063h,02bh,04ah,032h,04dh,03ah	; 94df  M.....aGQ)c+J2M:
	defb 03eh,047h,071h,0feh,037h,02eh,026h,059h,072h,039h,026h,02ah,0e6h,0fdh,085h,0adh	; 94ef  >Gq.7.&Yr9&*....
	defb 088h,081h,039h,026h,053h,090h,0ebh,0b5h,09dh,0adh,0bbh,0d1h,0ebh,03dh,0feh,029h	; 94ff  ..9&S........=.)
	defb 026h,030h,026h,09fh,08dh,051h,030h,071h,037h,04dh,052h,05dh,053h,0e4h,0e4h,0feh	; 950f  &0&..Q0q7MR]S...
	defb 0f8h,01ch,061h,0e5h,034h,065h,03ah,026h,02eh,027h,02ah,0e6h,0feh,0e4h,0e4h,0e4h	; 951f  ..a.4e:&.'*.....
	defb 019h,020h,00fh,01ch,0fbh	; 952f

; ----------------------------------------------------------------------
; DATOS mensajes_9534: 1 mensaje con el formato de p01:66C4 (letras hasta 0xFF
;   o 0xFB) a los que no apunta ninguna de las tablas de mensajes que lee el
;   codigo
;   0x9534..0x9554  (32 bytes)
DATA_mensajes_9534:
	defb 002h,079h,08fh,0bdh,089h,060h,085h,0b3h,0a0h,086h,02bh,053h,050h,02ah,04dh,05ch	; 9534  .y...`....+SP*M\
	defb 0e6h,0feh,027h,043h,02ch,036h,02ah,028h,0e4h,0e4h,0e4h,019h,020h,00fh,01ch,0fbh	; 9544  ..'C,6*(.... ...

; ----------------------------------------------------------------------
; DATOS mensaje_9554: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (91 bytes)
;   0x9554..0x95af  (91 bytes)
DATA_mensaje_9554:
	defb 002h,079h,087h,08bh,0d0h,09fh,051h,038h,046h,04dh,03ah,03eh,089h,0cfh,0c5h,026h	; 9554  .y....Q8FM:>...&
	defb 071h,067h,0feh,026h,03dh,0f8h,034h,051h,008h,085h,081h,03ah,0f8h,010h,02dh,037h	; 9564  qg.&=.4Q...:..-7
	defb 03dh,044h,0e5h,033h,03dh,0feh,057h,005h,0beh,0d1h,082h,085h,0adh,026h,02bh,051h	; 9574  =D.3=.W......&+Q
	defb 038h,046h,04dh,0e6h,0feh,0f8h,002h,0f8h,00dh,038h,02bh,02ch,05ch,0e6h,0fdh,033h	; 9584  8FM......8+,\..3
	defb 04eh,060h,047h,0b8h,0a1h,039h,04bh,085h,0b6h,055h,031h,04ch,051h,03dh,045h,0feh	; 9594  N`G..9K..U1LQ=E.
	defb 052h,05dh,039h,0e4h,0e4h,0e4h,019h,020h,00fh,01ch,0fbh	; 95a4  R]9.... ...

; ----------------------------------------------------------------------
; DATOS mensaje_95AF: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (58 bytes)
;   0x95af..0x95e9  (58 bytes)
DATA_mensaje_95AF:
	defb 002h,079h,01dh,018h,00bh,015h,00fh,0e5h,048h,036h,03eh,0a2h,0adh,08ch,08fh,0ebh	; 95af  .y......H6>.....
	defb 05dh,0e6h,0feh,08ch,0bbh,060h,03eh,02ah,035h,0f8h,067h,03eh,039h,026h,0e6h,025h	; 95bf  ]....`>*5.g>9&.%
	defb 034h,043h,051h,036h,0feh,02ah,028h,0e0h,039h,03ah,02ah,0bfh,086h,03ah,039h,04dh	; 95cf  4CQ6.*(.9:*..:9M
	defb 03dh,047h,053h,025h,04dh,0feh,03eh,05ah,05dh,0fbh	; 95df  =GS%M.>Z].

; ----------------------------------------------------------------------
; DATOS mensaje_95E9: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (37 bytes)
;   0x95e9..0x960e  (37 bytes)
DATA_mensaje_95E9:
	defb 002h,079h,0a6h,081h,08fh,0ebh,038h,08ch,0c5h,0a9h,0ebh,03dh,085h,0adh,053h,025h	; 95e9  .y....8....=..S%
	defb 04eh,062h,0feh,085h,083h,0adh,09dh,082h,08bh,0d0h,086h,03dh,02ah,050h,04ch,03ah	; 95f9  Nb.........=*PL:
	defb 039h,04dh,05ch,0feh,0fbh	; 9609

; ----------------------------------------------------------------------
; DATOS mensaje_960E: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (40 bytes)
;   0x960e..0x9636  (40 bytes)
DATA_mensaje_960E:
	defb 002h,079h,08dh,086h,0aeh,081h,08dh,0adh,08dh,0adh,08ah,0ebh,03eh,08fh,0bdh,089h	; 960e  .y..........>...
	defb 03dh,02dh,0feh,045h,04ch,060h,0f8h,018h,028h,04dh,04ah,027h,03ah,039h,04dh,0feh	; 961e  =-.EL`..(MJ':9M.
	defb 0e4h,0e4h,0e4h,019h,020h,00fh,01ch,0fbh	; 962e  .... ...

; ----------------------------------------------------------------------
; DATOS mensaje_9636: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4, p01:616C (58 bytes)
;   0x9636..0x9670  (58 bytes)
DATA_mensaje_9636:
	defb 002h,077h,034h,034h,02ah,027h,065h,02bh,0f8h,028h,03eh,034h,034h,02ah,027h,0e6h	; 9636  .w44*'e+.(>44*'.
	defb 034h,029h,031h,0feh,065h,02bh,0f8h,028h,03eh,034h,029h,031h,0e6h,0f8h,03ah,0f8h	; 9646  4)1.e+.(>4)1..:.
	defb 02fh,038h,08bh,0d1h,0ebh,092h,0c9h,0feh,0adh,0b0h,0b1h,0ebh,0a0h,03dh,0f8h,015h	; 9656  /8...........=..
	defb 0f8h,072h,05dh,0e4h,0e4h,019h,020h,00fh,01ch,0fbh	; 9666  .r]... ...

; ----------------------------------------------------------------------
; DATOS mensaje_9670: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:616C (68 bytes)
;   0x9670..0x96b4  (68 bytes)
DATA_mensaje_9670:
	defb 002h,077h,095h,0adh,0a0h,03eh,08dh,0cfh,08bh,0d2h,087h,051h,02fh,02dh,04dh,02eh	; 9670  .w...>.....Q/-M.
	defb 038h,060h,0feh,092h,086h,051h,099h,081h,0b4h,0d2h,031h,04dh,02eh,038h,060h,03eh	; 9680  8`...Q....1M.8`>
	defb 039h,026h,0e6h,0feh,02eh,04eh,043h,060h,0f8h,018h,034h,080h,087h,08bh,0d2h,0adh	; 9690  9&...NC`..4.....
	defb 083h,081h,0aeh,03dh,02eh,0feh,038h,03eh,050h,031h,04eh,04fh,0e4h,0e4h,0e4h,019h	; 96a0  ...=..8>P1NO....
	defb 020h,00fh,01ch,0fbh	; 96b0

; ----------------------------------------------------------------------
; DATOS mensaje_96B4: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (120 bytes)
;   0x96b4..0x972c  (120 bytes)
DATA_mensaje_96B4:
	defb 002h,077h,08fh,0cfh,0c5h,0e4h,089h,0ebh,0bch,05dh,0e6h,0c0h,093h,094h,0a0h,03dh	; 96b4  .w.......].....=
	defb 099h,098h,0feh,081h,0e4h,09ah,0a8h,093h,0adh,0e8h,0f8h,062h,0c0h,093h,094h,0a0h	; 96c4  ...........b....
	defb 03dh,0f8h,02ch,0f8h,06eh,0f8h,02dh,0feh,0e9h,060h,04ah,02ch,036h,02ah,050h,04eh	; 96d4  =.,.n.-..`J,6*PN
	defb 034h,091h,082h,08bh,0adh,0f8h,061h,05dh,0fdh,047h,038h,047h,038h,090h,0d2h,082h	; 96e4  4.....a].G8G8...
	defb 08dh,0adh,0f8h,03ah,08eh,082h,0f8h,046h,03ah,08bh,0a5h,0feh,082h,02fh,04eh,037h	; 96f4  ...:...F:..../N7
	defb 026h,034h,047h,03dh,05dh,0e6h,093h,0a7h,08dh,091h,03ah,085h,0feh,081h,0bch,087h	; 9704  &4G=].....:.....
	defb 0f8h,060h,0f8h,061h,053h,02ah,02ah,04eh,037h,026h,04dh,03eh,05ah,05dh,0e6h,0feh	; 9714  .`.aS**N7&M>Z]..
	defb 0e4h,0e4h,0e4h,019h,020h,00fh,01ch,0fbh	; 9724  .... ...

; ----------------------------------------------------------------------
; DATOS mensaje_972C: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:616C (100 bytes)
;   0x972c..0x9790  (100 bytes)
DATA_mensaje_972C:
	defb 002h,077h,092h,086h,03dh,0f8h,076h,0f8h,02fh,03ah,039h,071h,037h,02ah,052h,053h	; 972c  .w..=.v./:9q7*RS
	defb 028h,04fh,0e6h,081h,0feh,0cfh,092h,0adh,030h,037h,033h,03dh,090h,081h,086h,051h	; 973c  (O......073=...Q
	defb 08bh,0d1h,0beh,031h,04dh,0feh,092h,086h,03dh,0f8h,022h,0f8h,078h,085h,0adh,048h	; 974c  ...1M...=.".x..H
	defb 0b1h,0ebh,0a0h,0bbh,0b3h,081h,094h,0ebh,0feh,03ah,039h,071h,034h,036h,047h,04ch	; 975c  .........:9q46GL
	defb 060h,02ah,052h,053h,028h,04fh,0e6h,0fdh,0f8h,018h,028h,039h,02ah,071h,034h,047h	; 976c  `*RS(O....(9*q4G
	defb 03dh,053h,0f8h,018h,028h,037h,02ch,04dh,03eh,05ah,0feh,05dh,0e4h,0e4h,0e4h,019h	; 977c  =S..(7,M>Z.]....
	defb 020h,00fh,01ch,0fbh	; 978c

; ----------------------------------------------------------------------
; DATOS mensaje_9790: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:616C (50 bytes)
;   0x9790..0x97c2  (50 bytes)
DATA_mensaje_9790:
	defb 002h,077h,09dh,086h,0d1h,082h,053h,085h,0adh,0b6h,0adh,03ah,060h,02bh,039h,026h	; 9790  .w....S....:`+9&
	defb 038h,026h,0feh,027h,0b4h,0d2h,082h,086h,0d2h,082h,051h,08eh,082h,092h,081h,030h	; 97a0  8&.'......Q....0
	defb 037h,088h,081h,0feh,085h,087h,051h,034h,037h,04fh,0e4h,0e4h,0e4h,019h,020h,00fh	; 97b0  7.....Q47O.... .
	defb 01ch,0fbh	; 97c0

; ----------------------------------------------------------------------
; DATOS mensaje_97C2: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (46 bytes)
;   0x97c2..0x97f0  (46 bytes)
DATA_mensaje_97C2:
	defb 002h,077h,09dh,09bh,087h,0b6h,0adh,08bh,0adh,051h,0a4h,082h,089h,082h,03ah,036h	; 97c2  .w.......Q....:6
	defb 02ah,026h,0feh,0e5h,09bh,0cbh,0adh,08ch,03dh,02bh,04eh,0f8h,067h,02ah,04bh,0f8h	; 97d2  *&......=+N.g*K.
	defb 03bh,0f8h,049h,032h,04ah,0feh,0e4h,0e4h,0e4h,019h,020h,00fh,01ch,0fbh	; 97e2  ..I2J..... ...

; ----------------------------------------------------------------------
; DATOS mensaje_97F0: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:616C (36 bytes)
;   0x97f0..0x9814  (36 bytes)
DATA_mensaje_97F0:
	defb 002h,077h,09dh,09bh,087h,060h,093h,0a6h,0cfh,087h,039h,061h,03dh,0f8h,007h,03ah	; 97f0  .w...`....9a=..:
	defb 02ah,02ch,04eh,0feh,04dh,02eh,038h,047h,08fh,081h,08dh,091h,05dh,0e4h,0e4h,019h	; 9800  *,N.M.8G....]...
	defb 020h,00fh,01ch,0fbh	; 9810

; ----------------------------------------------------------------------
; DATOS mensaje_9814: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:616C (31 bytes)
;   0x9814..0x9833  (31 bytes)
DATA_mensaje_9814:
	defb 002h,077h,0f8h,062h,045h,02bh,03dh,093h,0a6h,0cfh,087h,03ah,03eh,0f8h,049h,04dh	; 9814  .w.bE+=....:>.IM
	defb 02eh,038h,053h,060h,0feh,02bh,04dh,0e4h,0e4h,0e4h,019h,020h,00fh,01ch,0fbh	; 9824  .8S`.+M.... ...

; ----------------------------------------------------------------------
; DATOS mensajes_9833: 1 mensaje con el formato de p01:66C4 (letras hasta 0xFF
;   o 0xFB) a los que no apunta ninguna de las tablas de mensajes que lee el
;   codigo
;   0x9833..0x986e  (59 bytes)
DATA_mensajes_9833:
	defb 002h,077h,08ah,0ebh,090h,0a6h,081h,093h,03eh,0f8h,057h,02bh,051h,04ah,044h,038h	; 9833  .w......>.W+QJD8
	defb 04ch,0e5h,08fh,0feh,081h,09fh,0adh,0b0h,051h,03eh,02ah,071h,037h,0a2h,098h,085h	; 9843  L.......Q>*q7...
	defb 0b1h,02ah,04bh,0a2h,0feh,098h,085h,0b1h,041h,031h,062h,048h,02ch,081h,0bch,082h	; 9853  .*K.....A1bH,...
	defb 030h,04fh,0feh,0e4h,0e4h,0e4h,019h,020h,00fh,01ch,0fbh	; 9863  0O..... ...

; ----------------------------------------------------------------------
; DATOS mensaje_986E: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:616C (161 bytes)
;   0x986e..0x990f  (161 bytes)
DATA_mensaje_986E:
	defb 002h,077h,092h,086h,03ah,0f8h,056h,0f8h,018h,02fh,04eh,04dh,0f8h,02fh,0f8h,01bh	; 986e  .w..:.V../NM./..
	defb 0e5h,033h,03dh,05dh,026h,026h,0feh,035h,03eh,0a2h,087h,08bh,03ah,04ah,04dh,047h	; 987e  .3=]&&.5>...:JMG
	defb 03dh,0e6h,05dh,026h,03ah,03eh,0f8h,006h,0feh,03ah,04ah,04dh,047h,03dh,05dh,0e6h	; 988e  =.]&:>...:JMG=].
	defb 0fdh,0f8h,006h,03eh,0b4h,0d2h,082h,084h,0adh,03ah,029h,026h,037h,081h,090h,0beh	; 989e  ...>.....:)&7...
	defb 0d2h,082h,0feh,085h,0adh,03ah,029h,04ah,033h,004h,005h,001h,0a1h,0ebh,093h,0a8h	; 98ae  .....:)J3.......
	defb 031h,031h,045h,0feh,0e6h,02ah,058h,045h,02bh,03fh,038h,036h,060h,093h,09dh,082h	; 98be  11E..*XE+?86`...
	defb 047h,039h,026h,086h,0feh,0d2h,0a7h,043h,060h,038h,061h,026h,037h,030h,043h,027h	; 98ce  G9&....C`8a&70C'
	defb 0e6h,0fdh,0f8h,006h,051h,034h,037h,05ah,03ah,089h,082h,0bch,082h,030h,04fh,0e6h	; 98de  ....Q47Z:....0O.
	defb 0f8h,006h,051h,034h,0feh,037h,034h,04bh,031h,055h,02fh,043h,084h,082h,08dh,0adh	; 98ee  ..Q4.74K1U/C....
	defb 03dh,02ah,043h,028h,03ah,0feh,03eh,026h,04eh,0e4h,0e4h,0e4h,019h,020h,00fh,01ch	; 98fe  =*C(:.>&N.... ..
	defb 0fbh	; 990e

; ----------------------------------------------------------------------
; DATOS mensaje_990F: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:616C (95 bytes)
;   0x990f..0x996e  (95 bytes)
DATA_mensaje_990F:
	defb 002h,077h,0f8h,041h,0f8h,006h,03dh,030h,033h,027h,039h,049h,02ah,0e5h,0b4h,0a1h	; 990f  .w.A..=03'9I*...
	defb 0adh,03ah,0feh,03eh,0f8h,013h,051h,036h,02dh,04fh,0e6h,026h,02ch,04bh,0f8h,006h	; 991f  .:.>..Q6-O.&,K..
	defb 086h,0d1h,082h,08bh,0d1h,0feh,082h,0bfh,0ebh,091h,060h,047h,0f8h,041h,0f8h,006h	; 992f  ..........`G.A..
	defb 051h,085h,0adh,0b6h,0adh,03ah,02dh,031h,0feh,02eh,038h,03eh,060h,02bh,039h,026h	; 993f  Q....:-1..8>`+9&
	defb 0e6h,0fdh,033h,027h,026h,027h,038h,02eh,04fh,060h,03eh,09dh,09bh,087h,0b6h,0adh	; 994f  ..3'&'8.O`>.....
	defb 08bh,0adh,0feh,060h,031h,031h,046h,0e4h,0e4h,0e4h,019h,020h,00fh,01ch,0fbh	; 995f  ...`11F.... ...

; ----------------------------------------------------------------------
; DATOS mensaje_996E: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:616C (95 bytes)
;   0x996e..0x99cd  (95 bytes)
DATA_mensaje_996E:
	defb 002h,077h,0f8h,041h,0f8h,006h,051h,035h,026h,02fh,02ch,031h,04dh,03ah,03eh,085h	; 996e  .w.A..Q5&/,1M:>.
	defb 085h,093h,02ah,0feh,04bh,08dh,0cfh,090h,030h,0e5h,029h,048h,049h,063h,03dh,036h	; 997e  ..*.K...0.)HIc=6
	defb 02dh,03ch,03dh,038h,0feh,02eh,04fh,043h,060h,049h,071h,02ch,04ch,038h,0f8h,007h	; 998e  -<=8..OC`Iq,L8..
	defb 04fh,030h,037h,049h,02ch,0fdh,02eh,03dh,0f8h,060h,0f8h,061h,060h,0f8h,041h,0f8h	; 999e  O07I,..=.`.a`.A.
	defb 006h,051h,02dh,031h,02eh,038h,053h,060h,02bh,04dh,0feh,052h,05dh,053h,0e4h,0e4h	; 99ae  .Q-1.8S`+M.R]S..
	defb 0e4h,060h,02bh,052h,02ah,0e1h,0feh,0e4h,0e4h,0e4h,019h,020h,00fh,01ch,0fbh	; 99be  .`+R*...... ...

; ----------------------------------------------------------------------
; DATOS mensaje_99CD: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (45 bytes)
;   0x99cd..0x99fa  (45 bytes)
DATA_mensaje_99CD:
	defb 002h,077h,08bh,0d2h,082h,0a1h,0adh,02ah,04bh,03dh,0f8h,03bh,0f8h,049h,03eh,09bh	; 99cd  .w.....*K=...I>.
	defb 085h,098h,082h,05dh,0feh,0e6h,091h,082h,09bh,082h,089h,082h,02ah,04bh,0f8h,03bh	; 99dd  ...]........*K..
	defb 0f8h,049h,032h,04ah,0feh,0e4h,0e4h,0e4h,019h,020h,00fh,01ch,0fbh	; 99ed  .I2J..... ...

; ----------------------------------------------------------------------
; DATOS mensaje_99FA: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:616C (129 bytes)
;   0x99fa..0x9a7b  (129 bytes)
DATA_mensaje_99FA:
	defb 002h,077h,09ch,0a7h,089h,0c5h,08fh,0ebh,03dh,0f8h,03ah,038h,027h,08eh,087h,0bch	; 99fa  .w......=.:8'...
	defb 03eh,05dh,026h,0feh,034h,026h,003h,006h,001h,086h,0aah,0e6h,0c5h,0aah,0c6h,0a6h	; 9a0a  >]&.4&..........
	defb 02bh,03dh,099h,0adh,0feh,0bfh,0adh,03dh,08ch,0c4h,0ebh,0bch,060h,08bh,085h,081h	; 9a1a  +=.....=....`...
	defb 03ah,038h,04bh,028h,04bh,0feh,04eh,037h,026h,04dh,0f8h,028h,0f8h,069h,053h,039h	; 9a2a  :8K(K.N7&M.(.iS9
	defb 053h,026h,0e6h,0fdh,09ch,0a7h,089h,0c5h,08fh,0ebh,03dh,0b4h,0d0h,087h,092h,0adh	; 9a3a  S&........=.....
	defb 03eh,08dh,0adh,085h,0feh,081h,0f8h,046h,05dh,0e6h,08fh,081h,08dh,081h,051h,038h	; 9a4a  >......F].....Q8
	defb 038h,03dh,028h,037h,0e5h,0f8h,025h,0feh,03dh,089h,082h,0b1h,086h,03ah,0f8h,049h	; 9a5a  8=(7..%.=....:.I
	defb 04dh,0f8h,03eh,03ah,029h,038h,032h,0e0h,0feh,0e4h,0e4h,0e4h,019h,020h,00fh,01ch	; 9a6a  M.>:)82...... ..
	defb 0fbh	; 9a7a

; ----------------------------------------------------------------------
; DATOS mensaje_9A7B: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:616C (61 bytes)
;   0x9a7b..0x9ab8  (61 bytes)
DATA_mensaje_9A7B:
	defb 002h,077h,09ch,0a7h,03dh,081h,0adh,083h,081h,051h,0f8h,013h,03ah,031h,04dh,039h	; 9a7b  .w..=....Q..:1M9
	defb 0e6h,0a9h,0ebh,0feh,0b8h,0ebh,0f8h,02eh,03dh,0b4h,091h,0b7h,082h,051h,030h,052h	; 9a8b  ........=....Q0R
	defb 059h,04fh,0e6h,0feh,09ch,0a7h,03eh,02bh,044h,03dh,0b5h,0b4h,0d2h,082h,03ah,026h	; 9a9b  YO....>+D=....:&
	defb 04dh,052h,05dh,0e6h,0feh,0e4h,0e4h,0e4h,019h,020h,00fh,01ch,0fbh	; 9aab  MR]...... ...

; ----------------------------------------------------------------------
; DATOS mensaje_9AB8: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4, p01:616C (185 bytes)
;   0x9ab8..0x9b71  (185 bytes)
DATA_mensaje_9AB8:
	defb 002h,077h,04ah,027h,0f8h,012h,048h,092h,086h,09ch,081h,086h,03ah,02ah,052h,031h	; 9ab8  .wJ'..H.....:*R1
	defb 04dh,02eh,038h,0feh,03eh,0a5h,082h,09ch,081h,0f8h,02eh,053h,04ch,03dh,0b4h,0d2h	; 9ac8  M.8.>......SL=..
	defb 082h,09dh,082h,0a3h,0e5h,0feh,0b4h,0d2h,0ebh,0b4h,0e4h,088h,08ch,0a6h,0ebh,03ah	; 9ad8  ...............:
	defb 02bh,026h,037h,044h,04fh,0e6h,0feh,048h,036h,03dh,030h,04bh,039h,026h,02eh,038h	; 9ae8  +&7DO..H6=0K9&.8
	defb 03eh,039h,026h,0e6h,0fdh,0f8h,003h,0f8h,03eh,0e5h,027h,035h,060h,0f8h,016h,0f8h	; 9af8  >9&.....>.'5`...
	defb 026h,089h,0a2h,0adh,038h,030h,037h,03eh,034h,0feh,04bh,026h,037h,026h,034h,02eh	; 9b08  &...807>4.K&7&4.
	defb 038h,047h,025h,04dh,0e6h,0feh,08bh,0adh,0f8h,06fh,030h,037h,0f8h,044h,0b4h,0d2h	; 9b18  8G%M.....o07.D..
	defb 082h,0bfh,039h,0f8h,04fh,05dh,0e6h,0feh,08bh,0d1h,082h,099h,08ch,082h,03eh,002h	; 9b28  ..9.O]........>.
	defb 005h,001h,0e4h,00ah,004h,05dh,0e6h,0fdh,0b4h,0d2h,082h,09dh,082h,0a7h,0d2h,082h	; 9b38  .....]..........
	defb 03eh,02eh,071h,035h,047h,035h,05dh,053h,0feh,0e4h,0e4h,0e4h,087h,0b4h,0a6h,0a7h	; 9b48  >.q5G5]S........
	defb 0d2h,082h,0a7h,03dh,044h,032h,03dh,02eh,038h,0feh,039h,052h,02ah,02bh,02ch,039h	; 9b58  ...=D2=.8.9R*+,9
	defb 04ah,0e4h,0e4h,0e4h,019h,020h,00fh,01ch,0fbh	; 9b68  J.... ...

; ----------------------------------------------------------------------
; DATOS mensaje_9B71: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:616C (65 bytes)
;   0x9b71..0x9bb2  (65 bytes)
DATA_mensaje_9B71:
	defb 002h,077h,048h,044h,03dh,0f8h,046h,060h,03eh,08bh,0a7h,0d2h,087h,03dh,02eh,038h	; 9b71  .wHD=.F`>....=.8
	defb 03eh,050h,031h,0feh,04eh,04fh,0e6h,03eh,02ah,03dh,025h,04bh,049h,04dh,085h,0adh	; 9b81  >P1.NO.>*=%KIM..
	defb 085h,087h,051h,038h,0feh,054h,031h,043h,030h,092h,086h,03dh,08eh,0adh,0b3h,081h	; 9b91  ..Q8.T1C0..=....
	defb 051h,02ah,052h,059h,038h,0feh,04dh,052h,05dh,0e4h,0e4h,0e4h,019h,020h,00fh,01ch	; 9ba1  Q*RY8.MR].... ..
	defb 0fbh	; 9bb1

; ----------------------------------------------------------------------
; DATOS mensaje_9BB2: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:616C (34 bytes)
;   0x9bb2..0x9bd4  (34 bytes)
DATA_mensaje_9BB2:
	defb 002h,077h,0bbh,0adh,093h,082h,03dh,08ch,081h,0cfh,090h,051h,02fh,053h,032h,0e6h	; 9bb2  .w....=....Q/S2.
	defb 061h,02eh,0feh,02ah,03ah,025h,04dh,03eh,05ah,05dh,0e4h,0e4h,0e4h,019h,020h,00fh	; 9bc2  a..*:%M>Z].... .
	defb 01ch,0fbh	; 9bd2

; ----------------------------------------------------------------------
; DATOS mensaje_9BD4: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (113 bytes)
;   0x9bd4..0x9c45  (113 bytes)
DATA_mensaje_9BD4:
	defb 002h,077h,048h,036h,03dh,0f8h,041h,0f8h,006h,03ah,0f8h,047h,0f8h,002h,030h,04fh	; 9bd4  .wH6=.A..:.G..0O
	defb 0e6h,0f8h,041h,0f8h,006h,060h,0feh,048h,036h,03dh,081h,090h,051h,0a5h,08eh,082h	; 9be4  ..A..`.H6=..Q...
	defb 030h,04fh,0e6h,09ch,0a3h,047h,0a4h,0feh,085h,03dh,0b3h,081h,08bh,091h,047h,005h	; 9bf4  0O...G...=....G.
	defb 08bh,0d1h,0a8h,081h,0e5h,0f8h,041h,0f8h,006h,047h,0feh,005h,08bh,0d1h,0a8h,081h	; 9c04  ......A..G......
	defb 05dh,0e6h,0fdh,092h,086h,053h,099h,0cfh,0c7h,082h,030h,034h,04bh,09eh,0b5h,0a8h	; 9c14  ]....S....04K...
	defb 0e4h,0bfh,0a6h,0feh,08ch,093h,051h,03ch,04bh,028h,0e6h,0bdh,0ebh,08ch,093h,03dh	; 9c24  ......Q<K(.....=
	defb 02fh,02bh,03ah,048h,0feh,036h,053h,026h,04dh,0e4h,0e4h,0e4h,019h,020h,00fh,01ch	; 9c34  /+:H.6S&M.... ..
	defb 0fbh	; 9c44

; ----------------------------------------------------------------------
; DATOS mensaje_9C45: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:616C (130 bytes)
;   0x9c45..0x9cc7  (130 bytes)
DATA_mensaje_9C45:
	defb 002h,077h,021h,013h,01dh,0e5h,019h,012h,013h,019h,0e4h,0e4h,0e4h,021h,013h,01dh	; 9c45  .w!..........!..
	defb 03eh,082h,0feh,0c9h,08ch,089h,0adh,08bh,0adh,030h,073h,027h,03dh,08bh,0d2h,082h	; 9c55  >........0s'=...
	defb 0a7h,0d0h,087h,0feh,088h,081h,0e5h,019h,012h,013h,019h,03eh,084h,099h,081h,084h	; 9c65  ...........>....
	defb 030h,073h,027h,0e4h,0feh,0e4h,0e4h,0e1h,0fdh,061h,035h,04bh,047h,080h,0a1h,0a7h	; 9c75  0s'......a5KG...
	defb 085h,03dh,030h,073h,027h,046h,026h,05dh,0e6h,0feh,09eh,0a8h,09bh,03eh,080h,0a1h	; 9c85  .=0s'F&].....>..
	defb 0a7h,085h,03ah,03eh,026h,035h,061h,047h,026h,071h,0feh,034h,02eh,038h,053h,039h	; 9c95  ..:>&5aG&q.4.8S9
	defb 026h,03eh,05ah,05dh,053h,0e1h,0fdh,09eh,08ch,08fh,0ebh,0e4h,09fh,0a6h,0ebh,039h	; 9ca5  &>Z]S..........9
	defb 04bh,050h,02ah,04dh,02ah,047h,030h,0feh,04eh,052h,0e4h,0e4h,0e4h,019h,020h,00fh	; 9cb5  KP*M*G0.NR.... .
	defb 01ch,0fbh	; 9cc5

; ----------------------------------------------------------------------
; DATOS mensaje_9CC7: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:616C (137 bytes)
;   0x9cc7..0x9d50  (137 bytes)
DATA_mensaje_9CC7:
	defb 002h,077h,02eh,043h,071h,034h,02eh,038h,053h,025h,04eh,062h,09eh,087h,0bch,097h	; 9cc7  .w.Cq4.8S%Nb....
	defb 0a8h,0e4h,0feh,09fh,0a6h,0ebh,03ah,0f8h,07bh,0f8h,071h,030h,037h,044h,04fh,0e6h	; 9cd7  ......:.{.q07DO.
	defb 0feh,047h,038h,027h,035h,03dh,08ah,0bdh,081h,0bdh,0a8h,0e4h,09eh,08ch,08fh,0ebh	; 9ce7  .G8'5=..........
	defb 05dh,0feh,0e6h,059h,036h,03ah,048h,02ch,03ah,034h,036h,0f8h,04fh,05dh,0e6h,0fdh	; 9cf7  ]..Y6:H,:46.O]..
	defb 080h,081h,0bbh,080h,09eh,0adh,060h,047h,025h,04dh,0e6h,02ah,04eh,03ah,033h,027h	; 9d07  ......`G%M.*N:3'
	defb 0feh,05dh,052h,030h,037h,044h,04dh,038h,026h,026h,0e6h,039h,03ah,02ah,085h,081h	; 9d17  .]R07DM8&&.9:*..
	defb 088h,0feh,091h,080h,0adh,051h,05dh,030h,037h,02ch,04eh,04dh,05dh,04fh,027h,0e6h	; 9d27  .....Q]07,NM]O'.
	defb 0fdh,08bh,0d1h,082h,099h,08ch,082h,03eh,002h,005h,001h,0e4h,004h,009h,05dh,0e6h	; 9d37  .......>......].
	defb 0feh,0e4h,0e4h,0e4h,019h,020h,00fh,01ch,0fbh	; 9d47  ..... ...

; ----------------------------------------------------------------------
; DATOS mensajes_9D50: 1 mensaje con el formato de p01:66C4 (letras hasta 0xFF
;   o 0xFB) a los que no apunta ninguna de las tablas de mensajes que lee el
;   codigo
;   0x9d50..0x9db3  (99 bytes)
DATA_mensajes_9D50:
	defb 002h,077h,029h,059h,035h,072h,052h,0e5h,08ch,097h,0ebh,087h,02fh,052h,0e1h,0e4h	; 9d50  .w)Y5rR...../R..
	defb 0e4h,0feh,050h,034h,030h,0e5h,086h,0d0h,0a7h,0ebh,0e6h,0feh,0c3h,0c3h,03eh,036h	; 9d60  ..P40.........>6
	defb 04ch,03ah,026h,071h,035h,072h,071h,034h,03dh,0e6h,0fdh,0f8h,044h,0b4h,0d2h,082h	; 9d70  L:&q5rq4=...D...
	defb 0bfh,0e4h,0e4h,0e4h,0a0h,08dh,0adh,086h,0e5h,047h,071h,0feh,037h,026h,071h,034h	; 9d80  .........Gq.7&q4
	defb 02ah,04bh,0e6h,0feh,08bh,0d1h,082h,099h,08ch,082h,03eh,002h,005h,001h,0e4h,00ah	; 9d90  *K........>.....
	defb 00ah,0e4h,0e4h,0feh,02eh,052h,061h,025h,033h,063h,03ah,02bh,037h,03ch,0e6h,0bdh	; 9da0  .....Ra%3c:+7<..
	defb 0ebh,081h,0fbh	; 9db0

; ----------------------------------------------------------------------
; DATOS mensaje_9DB3: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (63 bytes)
;   0x9db3..0x9df2  (63 bytes)
DATA_mensaje_9DB3:
	defb 002h,077h,01dh,018h,00bh,015h,00fh,0e0h,080h,081h,092h,0a0h,053h,047h,028h,037h	; 9db3  .w..........SG(7
	defb 026h,0feh,04dh,0e0h,0e0h,031h,065h,037h,03dh,08eh,082h,0beh,09ah,0adh,0e5h,0bfh	; 9dc3  &.M..1e7=.......
	defb 086h,0feh,051h,031h,037h,04fh,0e0h,0f8h,028h,0f8h,069h,053h,039h,026h,05ch,0e6h	; 9dd3  ..Q17O..(.iS9&\.
	defb 08ch,0c6h,0ebh,0feh,08ch,086h,0ebh,060h,031h,037h,04dh,052h,05dh,0e0h,0fbh	; 9de3  .......`17MR]..

; ----------------------------------------------------------------------
; DATOS mensaje_9DF2: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (152 bytes)
;   0x9df2..0x9e8a  (152 bytes)
DATA_mensaje_9DF2:
	defb 002h,077h,01dh,018h,00bh,015h,00fh,0e0h,00ch,013h,011h,000h,00ch,019h,01dh,01dh	; 9df2  .w..............
	defb 03eh,0feh,047h,03eh,048h,02bh,044h,03dh,0b4h,0d2h,082h,085h,0adh,060h,03eh,039h	; 9e02  >.G>H+D=.....`>9
	defb 026h,0feh,0e6h,0ebh,0f8h,052h,03dh,086h,0d2h,082h,0b4h,0adh,05dh,0e6h,050h,02ah	; 9e12  &....R=.....].P*
	defb 04dh,039h,0feh,0e1h,08bh,0b4h,0d2h,082h,03eh,03eh,02fh,045h,039h,0e6h,0fdh,0a9h	; 9e22  M9......>>/E9...
	defb 081h,08dh,081h,03ah,039h,04eh,0e6h,02eh,02eh,060h,02bh,044h,053h,043h,0feh,02dh	; 9e32  ...:9N...`+DSC.-
	defb 04dh,02eh,038h,03eh,060h,02bh,052h,03dh,05dh,0e0h,033h,030h,037h,050h,0feh,04eh	; 9e42  M.8>`+R=].307P.N
	defb 050h,04eh,053h,02bh,044h,03ah,030h,037h,048h,04eh,04dh,02eh,038h,047h,0feh,039h	; 9e52  PNS+D:07HNM.8G.9
	defb 026h,0e6h,0fdh,0f8h,03fh,0f8h,035h,0f8h,00ch,053h,02bh,044h,03ah,02ah,02ah,071h	; 9e62  &...?.5..S+D:**q
	defb 037h,026h,04dh,052h,05dh,0feh,0e0h,02eh,027h,027h,052h,051h,026h,03dh,04dh,0feh	; 9e72  7&MR]...''RQ&=M.
	defb 0e4h,0e4h,0e4h,019h,020h,00fh,01ch,0fbh	; 9e82  .... ...

; ----------------------------------------------------------------------
; DATOS mensaje_9E8A: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (44 bytes)
;   0x9e8a..0x9eb6  (44 bytes)
DATA_mensaje_9E8A:
	defb 002h,077h,09fh,098h,09bh,08ch,086h,0ebh,0a7h,0d1h,082h,08bh,03dh,098h,082h,0bch	; 9e8a  .w..........=...
	defb 053h,0feh,034h,02ah,026h,03dh,060h,0a9h,0ebh,0b8h,0ebh,053h,02bh,02ah,039h,026h	; 9e9a  S.4*&=`....S+*9&
	defb 03eh,0feh,05ah,05dh,0e4h,0e4h,0e4h,019h,020h,00fh,01ch,0fbh	; 9eaa  >.Z].... ...

; ----------------------------------------------------------------------
; DATOS mensaje_9EB6: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (62 bytes)
;   0x9eb6..0x9ef4  (62 bytes)
DATA_mensaje_9EB6:
	defb 002h,077h,0b4h,0a6h,081h,0b1h,0adh,03eh,0b4h,0a6h,081h,08fh,0adh,090h,086h,051h	; 9eb6  .w.....>.......Q
	defb 036h,0feh,02ah,028h,062h,0a9h,0ebh,0b8h,0ebh,0f8h,02eh,03ah,038h,027h,028h,026h	; 9ec6  6.*(b......:8'(&
	defb 02fh,04eh,0feh,04dh,052h,05dh,053h,0e6h,085h,081h,08bh,0d1h,082h,03eh,09dh,09bh	; 9ed6  /N.MR]S......>..
	defb 087h,060h,0feh,060h,02bh,04dh,0e4h,0e4h,0e4h,019h,020h,00fh,01ch,0fbh	; 9ee6  .`.`+M.... ...

; ----------------------------------------------------------------------
; DATOS mensaje_9EF4: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (100 bytes)
;   0x9ef4..0x9f58  (100 bytes)
DATA_mensaje_9EF4:
	defb 002h,077h,029h,047h,026h,02bh,071h,037h,0e5h,095h,0a2h,091h,03ah,039h,071h,037h	; 9ef4  .w)G&+q7....:9q7
	defb 044h,0feh,034h,04bh,061h,027h,05dh,0e1h,0feh,093h,087h,081h,03dh,0b8h,0adh,0c1h	; 9f04  D.4Ka'].....=...
	defb 0ebh,0a8h,060h,0e6h,0fdh,02eh,04eh,04ah,04ch,02fh,02bh,03eh,08bh,0d1h,082h,099h	; 9f14  ..`...NJL/+>....
	defb 08ch,082h,051h,09ch,0feh,0adh,089h,082h,031h,04dh,0e6h,0fdh,0f8h,025h,03dh,08bh	; 9f24  ..Q.....1M...%=.
	defb 0d1h,082h,099h,08ch,082h,03eh,0c3h,0cfh,088h,0ebh,0b4h,03dh,0feh,082h,0a6h,03dh	; 9f34  .....>.....=...=
	defb 08bh,0d0h,08bh,0adh,03ah,03dh,071h,037h,026h,04dh,0e6h,0feh,0e4h,0e4h,0e4h,019h	; 9f44  ....:=q7&M......
	defb 020h,00fh,01ch,0fbh	; 9f54

; ----------------------------------------------------------------------
; DATOS mensaje_9F58: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (52 bytes)
;   0x9f58..0x9f8c  (52 bytes)
DATA_mensaje_9F58:
	defb 002h,077h,08bh,0d1h,082h,099h,08ch,082h,051h,09ch,0adh,089h,082h,031h,04dh,0e6h	; 9f58  .w......Q....1M.
	defb 0feh,08bh,0d1h,082h,099h,08ch,082h,03eh,08fh,0cfh,0c5h,089h,0ebh,0bch,060h,029h	; 9f68  .......>......`)
	defb 0feh,02ch,04dh,0e6h,085h,081h,0bch,087h,030h,04fh,0e6h,0feh,0e4h,0e4h,0e4h,019h	; 9f78  .,M.....0O......
	defb 020h,00fh,01ch,0fbh	; 9f88

; ----------------------------------------------------------------------
; DATOS mensaje_9F8C: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (55 bytes)
;   0x9f8c..0x9fc3  (55 bytes)
DATA_mensaje_9F8C:
	defb 002h,077h,094h,08fh,0ebh,08bh,0d0h,02ah,04bh,047h,04bh,071h,034h,0bfh,0aah,0ebh	; 9f8c  .w.....*KGKq4...
	defb 090h,03eh,0feh,029h,033h,04bh,02ch,088h,081h,0b4h,0d2h,082h,086h,084h,087h,0b2h	; 9f9c  .>.)3K,.........
	defb 082h,086h,0adh,0feh,05dh,0e6h,0feh,0bfh,0aah,0ebh,090h,03dh,084h,0adh,0bch,051h	; 9fac  ....]......=...Q
	defb 02ah,028h,037h,044h,04fh,0e6h,0fbh	; 9fbc

; ----------------------------------------------------------------------
; DATOS mensaje_9FC3: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina (sigue en el banco 49, en 0xA000); lo leen p01:60B4
;   (61 bytes)
;   0x9fc3..0xa000  (61 bytes)
DATA_mensaje_9FC3:
	defb 002h,07ah,010h,019h,022h,000h,012h,019h,01fh,018h,00eh,060h,03eh,061h,027h,030h	; 9fc3  .z.."......`>a'0
	defb 037h,089h,0feh,0ebh,0bch,097h,0ebh,0a0h,03ah,0f8h,057h,0f8h,05ch,03dh,0f8h,066h	; 9fd3  7.......:.W.\=.f
	defb 0f8h,03eh,051h,036h,02ah,027h,03dh,0feh,02ah,03ch,0e1h,0f8h,03ah,0f8h,02fh,03ah	; 9fe3  .>Q6*'=.*<..:./:
	defb 0f8h,057h,0f8h,05ch,053h,03ah,025h,027h,038h,026h,027h,03dh,0feh	; 9ff3  .W.\S:%'8&'=.
