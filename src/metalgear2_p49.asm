; ==========================================================================
; METAL GEAR 2 SOLID SNAKE - Konami (1990) - MSX2 - MegaROM RC-767 de 512 KB (Konami SCC) - banco 49 (se ejecuta en 0xa000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x0a000


; ----------------------------------------------------------------------
; DATOS mensaje_9FC3_cola: mensaje letra a letra (p01:66C4): letras hasta 0xFF
;   o 0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina (sigue del banco 48); lo leen p01:60B4 (36 bytes)
;   0xa000..0xa024  (36 bytes)
DATA_mensaje_9FC3_cola:
	defb 03eh,0f8h,052h,0f8h,069h,03dh,029h,047h,026h,0f8h,02eh,053h,04ch,05dh,0e6h,0fdh	; a000  >.R.i=)G&..SL]..
	defb 0f8h,021h,03ah,03eh,0a7h,085h,081h,060h,02bh,052h,039h,0feh,0e4h,0e4h,0e4h,019h	; a010  .!:>...`+R9.....
	defb 020h,00fh,01ch,0fbh	; a020

; ----------------------------------------------------------------------
; DATOS mensaje_A024: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (283 bytes)
;   0xa024..0xa13f  (283 bytes)
DATA_mensaje_A024:
	defb 002h,07ah,033h,04eh,03eh,0bbh,0adh,08bh,0d2h,062h,038h,03ah,087h,0adh,0a9h,0adh	; a024  .z3N>....b8:....
	defb 02fh,04eh,0feh,034h,0a2h,0a7h,0bdh,093h,05dh,0e6h,099h,093h,03eh,0f8h,03fh,0f8h	; a034  /N.4....]...>.?.
	defb 035h,0f8h,00ch,03ah,039h,052h,0feh,038h,003h,007h,001h,08bh,0d1h,047h,026h,04dh	; a044  5..:9R.8.....G&M
	defb 0e6h,0fdh,0b6h,0adh,090h,0d2h,082h,03eh,0a3h,087h,005h,001h,08dh,0adh,090h,0e5h	; a054  .......>........
	defb 0a5h,0ebh,0feh,0aah,0cfh,0c3h,02ah,04bh,0f8h,050h,080h,0b4h,080h,03ah,0bfh,0adh	; a064  ......*K.P...:..
	defb 0c5h,031h,04dh,0e6h,0feh,033h,03dh,099h,093h,03eh,029h,033h,04bh,02ch,09eh,0a8h	; a074  .1M..3=..>)3K,..
	defb 09bh,0f8h,054h,0f8h,023h,053h,0f8h,07bh,0feh,04eh,037h,02bh,034h,047h,03dh,05dh	; a084  ..T.#S.{.N7+4G=]
	defb 04fh,027h,0e6h,0fdh,099h,093h,03eh,0f8h,05ch,0f8h,006h,03ah,0beh,0adh,085h,0adh	; a094  O'....>.\..:....
	defb 060h,08bh,0d2h,082h,08bh,0adh,0feh,0f8h,01ah,05dh,0e6h,035h,02ah,05fh,02ch,038h	; a0a4  `........].5*_,8
	defb 088h,099h,081h,060h,038h,063h,0f8h,076h,071h,0feh,037h,030h,043h,027h,0e6h,033h	; a0b4  ...`8c.vq.70C'.3
	defb 03dh,02ch,032h,0e5h,057h,027h,036h,02ch,062h,04ch,0feh,03dh,0f8h,044h,055h,04bh	; a0c4  =,2.W'6,bL.=.DUK
	defb 026h,0e6h,0fdh,08bh,0d1h,08bh,0d2h,087h,03eh,02eh,02ch,047h,036h,0e4h,0e4h,0e4h	; a0d4  &.......>.,G6...
	defb 0feh,033h,027h,05dh,0e0h,09eh,0a1h,02ah,0c7h,092h,093h,053h,025h,04eh,062h,029h	; a0e4  .3']...*...S%Nb)
	defb 063h,0feh,02bh,04ah,032h,04bh,04eh,04dh,05ch,0e6h,0fdh,050h,034h,030h,03eh,0f8h	; a0f4  c.+J2KNM\..P40>.
	defb 01ch,0e5h,0c7h,092h,093h,03dh,016h,08ah,081h,0b5h,051h,034h,0feh,03dh,052h,05dh	; a104  .....=....Q4.=R]
	defb 038h,02eh,04fh,05dh,0e6h,0e4h,0e4h,0e4h,050h,04dh,026h,039h,0e6h,0feh,0f8h,03ah	; a114  8.O]....PM&9...:
	defb 0f8h,02fh,03ah,099h,0adh,0bdh,0ebh,0aeh,0ebh,048h,02fh,052h,03eh,039h,026h,050h	; a124  ./:......H/R>9&P
	defb 0feh,039h,0e1h,0e4h,0e4h,0e4h,019h,020h,00fh,01ch,0fbh	; a134  .9..... ...

; ----------------------------------------------------------------------
; DATOS mensaje_A13F: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (118 bytes)
;   0xa13f..0xa1b5  (118 bytes)
DATA_mensaje_A13F:
	defb 002h,07ah,02bh,044h,03dh,099h,094h,08bh,05dh,02dh,060h,03eh,039h,052h,03dh,08fh	; a13f  .z+D=...]-`>9R=.
	defb 09eh,0b2h,0feh,02ah,050h,02ah,04bh,052h,039h,0e6h,099h,090h,0d1h,082h,0a8h,081h	; a14f  ...*P*KR9.......
	defb 02ah,090h,0d2h,0feh,082h,0a8h,081h,03dh,08fh,09eh,0b2h,060h,025h,04dh,02eh,038h	; a15f  *......=...`%M.8
	defb 03eh,034h,030h,02ah,0feh,05dh,053h,0e4h,0e4h,0e4h,0fdh,025h,071h,033h,027h,033h	; a16f  >40*.]S....%q3'3
	defb 027h,0e5h,029h,060h,052h,03dh,08fh,09eh,0b2h,03eh,086h,0feh,0a7h,087h,090h,03eh	; a17f  '.)`R=...>.....>
	defb 030h,04fh,060h,039h,02dh,04eh,062h,026h,02dh,039h,026h,053h,0feh,025h,059h,03eh	; a18f  0O`9-Nb&-9&S.%Y>
	defb 030h,044h,037h,026h,039h,02dh,04eh,062h,039h,04bh,039h,026h,0e6h,0feh,0e4h,0e4h	; a19f  0D7&9-Nb9K9&....
	defb 0e4h,019h,020h,00fh,01ch,0fbh	; a1af

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa1b5..0xa1cd  (24 bytes)
DATA_A1B5:
	defb 0e4h,0e4h,0e4h,019h,020h,00fh,01ch,0fbh,0e4h,0e4h,0e4h,019h,020h,00fh,01ch,0fbh	; a1b5  .... ....... ...
	defb 0e4h,0e4h,0e4h,019h,020h,00fh,01ch,0fbh	; a1c5  .... ...

; ----------------------------------------------------------------------
; DATOS mensaje_A1CD: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (304 bytes)
;   0xa1cd..0xa2fd  (304 bytes)
DATA_mensaje_A1CD:
	defb 002h,07ah,033h,04eh,03eh,0b3h,0adh,0b4h,0bdh,0ebh,0e4h,0a2h,0a7h,09bh,087h,0aah	; a1cd  .z3N>...........
	defb 082h,05dh,0feh,04ah,0e6h,09bh,087h,0aah,082h,03eh,030h,071h,037h,03dh,038h,027h	; a1dd  .].J.....>0q7=8'
	defb 04ch,0e5h,0a3h,0feh,089h,082h,08dh,081h,03dh,095h,087h,08bh,0d2h,087h,090h,0d2h	; a1ed  L.......=.......
	defb 082h,060h,0f8h,03fh,0f8h,035h,0feh,0f8h,00ch,03ah,048h,02ch,002h,003h,001h,08bh	; a1fd  .`.?.5...:H,....
	defb 0d1h,026h,04dh,0e6h,0fdh,0b3h,0adh,0b4h,0bdh,0ebh,0a2h,0a7h,09bh,087h,0aah,082h	; a20d  .&M.............
	defb 03eh,0b6h,0adh,090h,0d2h,0feh,082h,053h,003h,001h,08dh,0adh,090h,0e5h,0f8h,046h	; a21d  >......S.......F
	defb 0f8h,005h,080h,0b4h,080h,05dh,02dh,03ah,0feh,08dh,081h,08eh,087h,031h,04dh,0e6h	; a22d  .....]-:.....1M.
	defb 0fdh,08fh,09eh,0b2h,03eh,030h,04fh,0e5h,003h,02ah,04bh,008h,095h,090h,085h,0adh	; a23d  ....>0O..*K.....
	defb 085h,0feh,087h,060h,027h,044h,0e5h,09dh,082h,0a6h,0adh,03eh,0a1h,08ch,05dh,02dh	; a24d  ...`'D.....>..]-
	defb 053h,029h,0feh,02eh,039h,027h,0e6h,081h,0bbh,0adh,08bh,085h,081h,0a7h,0d2h,082h	; a25d  S)..9'..........
	defb 03ah,04ah,04ch,0feh,08ch,082h,0b4h,091h,085h,0adh,060h,08fh,09eh,0b2h,053h,02ah	; a26d  :JL.......`...S*
	defb 028h,04dh,0e6h,0fdh,02eh,03dh,09bh,087h,0aah,082h,03eh,0a3h,089h,082h,08dh,081h	; a27d  (M...=....>.....
	defb 060h,030h,02ah,047h,0feh,08dh,081h,085h,087h,03ah,095h,090h,0c1h,091h,0b2h,0e5h	; a28d  `0*G.....:......
	defb 039h,02ch,02eh,038h,02ah,0feh,04bh,0b3h,0adh,0b4h,0bdh,0ebh,0a6h,0adh,0bch,060h	; a29d  9,.8*.K........`
	defb 03eh,0f8h,028h,0f8h,017h,053h,050h,04ch,0feh,03ah,030h,037h,026h,04dh,04bh,030h	; a2ad  >.(..SPL.:07&MK0
	defb 026h,0e6h,0fdh,026h,035h,061h,0e5h,039h,03ah,02ah,03dh,0a7h,0a4h,082h,060h,039h	; a2bd  &..&5a.9:*=...`9
	defb 026h,034h,09bh,0feh,087h,0aah,082h,03dh,089h,083h,03ah,02ah,052h,035h,053h,026h	; a2cd  &4.....=..:*R5S&
	defb 030h,037h,0f8h,06bh,051h,0feh,03fh,04dh,038h,043h,035h,053h,028h,034h,02eh,038h	; a2dd  07.kQ.?M8C5S(4.8
	defb 053h,025h,04dh,02ch,04bh,026h,0feh,05dh,0e4h,0e4h,0e4h,019h,020h,00fh,01ch,0fbh	; a2ed  S%M,K&.].... ...

; ----------------------------------------------------------------------
; DATOS mensaje_A2FD: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (145 bytes)
;   0xa2fd..0xa38e  (145 bytes)
DATA_mensaje_A2FD:
	defb 002h,07ah,029h,033h,04bh,02ch,0c1h,080h,03dh,081h,0cfh,08bh,0d1h,05dh,04fh,027h	; a2fd  .z)3K,..=....]O'
	defb 0e6h,0a3h,0feh,089h,082h,08dh,081h,060h,08dh,081h,08bh,091h,03eh,029h,038h,039h	; a30d  .......`....>)89
	defb 030h,026h,0e6h,0feh,05dh,053h,09ch,0beh,03eh,029h,029h,055h,04bh,026h,05dh,02ah	; a31d  0&..]S..>))UK&]*
	defb 04bh,039h,0e6h,039h,0feh,052h,060h,047h,034h,065h,04dh,05ch,0e6h,0fdh,038h,02ch	; a32d  K9.9.R`G4eM\..8,
	defb 03ah,0a9h,0ebh,08bh,0d2h,0adh,039h,052h,02ah,03eh,089h,082h,0bfh,091h,0feh,05dh	; a33d  :.....9R*>.....]
	defb 04fh,027h,039h,0e6h,03eh,048h,02ch,031h,037h,034h,0f8h,060h,053h,026h,026h,0e6h	; a34d  O'9.>H,174.`S&&.
	defb 0feh,08ch,0c6h,0ebh,08ch,0e4h,086h,0ebh,060h,031h,037h,04dh,052h,05dh,0e6h,0fdh	; a35d  ........`17MR]..
	defb 09ch,0beh,053h,08fh,09eh,0b2h,03dh,085h,0a6h,03dh,038h,02eh,04fh,03ah,0f8h,070h	; a36d  ..S...=..=8.O:.p
	defb 034h,0feh,0f8h,028h,03ah,031h,037h,04fh,0e6h,0e4h,0e4h,0e4h,019h,020h,00fh,01ch	; a37d  4..(:17O..... ..
	defb 0fbh	; a38d

; ----------------------------------------------------------------------
; DATOS mensaje_A38E: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (293 bytes)
;   0xa38e..0xa4b3  (293 bytes)
DATA_mensaje_A38E:
	defb 002h,07ah,033h,04eh,03eh,0e5h,0a2h,082h,0bch,087h,051h,047h,036h,038h,026h,050h	; a38e  .z3N>.....QG68&P
	defb 04eh,04dh,0feh,0b3h,0adh,0b4h,0bdh,0ebh,099h,0a0h,08ch,08fh,0ebh,059h,072h,039h	; a39e  NM...........Yr9
	defb 026h,02ah,039h,0feh,097h,0b5h,09fh,03eh,0f8h,03fh,0f8h,035h,0f8h,00ch,03ah,002h	; a3ae  &*9....>.?.5..:.
	defb 002h,009h,004h,08bh,0d1h,0e6h,0fdh,033h,03dh,0f8h,046h,060h,099h,0a0h,08ch,08fh	; a3be  .......3=.F`....
	defb 0ebh,03eh,0b1h,0cfh,08bh,0a8h,081h,0e5h,0feh,097h,0b5h,09fh,085h,03ah,05ch,02ch	; a3ce  .>...........:\,
	defb 030h,0e5h,08fh,081h,090h,0d2h,082h,003h,006h,0feh,02ah,04bh,003h,009h,08dh,0adh	; a3de  0.........*K....
	defb 090h,0e5h,0f8h,036h,0a5h,0ebh,0aah,0cfh,0c3h,02ah,04bh,0feh,08bh,0c0h,0a7h,080h	; a3ee  ...6.....*K.....
	defb 0e5h,081h,0a6h,087h,03ah,031h,052h,060h,026h,04dh,0e6h,0fdh,033h,03dh,09ch,0adh	; a3fe  ....:1R`&M..3=..
	defb 08bh,0d1h,03eh,099h,0a0h,08ch,08fh,0ebh,03dh,081h,083h,097h,0feh,0b5h,09fh,0f8h	; a40e  ..>.....=.......
	defb 008h,030h,034h,047h,03dh,05dh,04fh,027h,0e6h,081h,083h,097h,0b5h,09fh,0feh,03eh	; a41e  .04G=]O'.......>
	defb 088h,081h,085h,081h,0f8h,031h,053h,036h,04ah,02ch,0e5h,0f8h,052h,0f8h,03eh,060h	; a42e  .....1S6J,..R.>`
	defb 03eh,08ch,0feh,02ah,04bh,060h,04dh,02eh,038h,03eh,039h,026h,0e6h,0fdh,0e4h,0e4h	; a43e  >..*K`M.8>9&....
	defb 0e4h,08bh,0d1h,08bh,0d2h,087h,03eh,090h,0ebh,0b5h,0e6h,0feh,033h,027h,05dh,0e0h	; a44e  ......>.....3'].
	defb 0e1h,090h,0ebh,0b5h,05dh,0e6h,090h,0ebh,0b5h,053h,025h,04eh,0feh,062h,029h,063h	; a45e  ....]....S%N.b)c
	defb 02bh,0f8h,030h,032h,04dh,05ch,0e0h,0e0h,0feh,090h,0ebh,0b5h,051h,047h,071h,038h	; a46e  +.02M\......QGq8
	defb 04bh,052h,02ah,0e1h,0e1h,0fdh,0b3h,0adh,097h,0adh,05dh,0e6h,050h,034h,030h,03eh	; a47e  KR*.......].P40>
	defb 0f8h,01ch,0e5h,08fh,087h,099h,081h,0feh,0beh,0adh,03dh,0c4h,0b3h,051h,0f8h,047h	; a48e  ..........=..Q.G
	defb 0f8h,05dh,030h,034h,038h,02eh,04fh,05dh,0e6h,0feh,031h,043h,052h,0e4h,0e4h,0e4h	; a49e  .]048.O]..1CR...
	defb 019h,020h,00fh,01ch,0fbh	; a4ae

; ----------------------------------------------------------------------
; DATOS mensaje_A4B3: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (107 bytes)
;   0xa4b3..0xa51e  (107 bytes)
DATA_mensaje_A4B3:
	defb 002h,07dh,0a1h,095h,0d0h,0ebh,000h,0b3h,0beh,0ebh,093h,000h,09eh,0a8h,09bh,0e6h	; a4b3  .}..............
	defb 0feh,08bh,0d1h,093h,0ebh,000h,094h,0a0h,000h,0b4h,0cbh,0a6h,0ebh,090h,0e1h,0a0h	; a4c3  ................
	defb 0c9h,0feh,099h,090h,0ebh,0a0h,000h,09fh,0ebh,0a6h,0e6h,0fdh,0a0h,0c9h,000h,081h	; a4d3  ................
	defb 08ch,0a6h,0a8h,095h,0d0h,0ebh,000h,083h,0a0h,0feh,08ch,0c1h,0c9h,000h,0bch,0a8h	; a4e3  ................
	defb 093h,0e6h,094h,0b4h,0d2h,0ebh,000h,0feh,0a4h,0ebh,08ch,0c9h,0e5h,08bh,0d1h,093h	; a4f3  ................
	defb 0ebh,000h,080h,0adh,0feh,081h,0a7h,0b4h,0d2h,0ebh,093h,0e6h,0fdh,0a2h,0c9h,000h	; a503  ................
	defb 08fh,0c2h,0c8h,0ebh,0a7h,08bh,0c9h,0e4h,0e4h,0e4h,0fbh	; a513  ...........

; ----------------------------------------------------------------------
; DATOS mensaje_A51E: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (42 bytes)
;   0xa51e..0xa548  (42 bytes)
DATA_mensaje_A51E:
	defb 002h,076h,0e4h,0e4h,0e4h,039h,052h,03dh,02eh,038h,05dh,0e1h,0e4h,0e4h,0e4h,0feh	; a51e  .v...9R=.8].....
	defb 02fh,071h,067h,04ch,050h,02ah,04bh,052h,0e6h,0c6h,093h,0aah,0c2h,0c9h,0cfh,090h	; a52e  /qgLP*KR........
	defb 0feh,03ah,02bh,026h,037h,044h,04ah,027h,02ah,0fbh	; a53e  .:+&7DJ'*.

; ----------------------------------------------------------------------
; DATOS mensaje_A548: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (31 bytes)
;   0xa548..0xa567  (31 bytes)
DATA_mensaje_A548:
	defb 002h,07eh,029h,027h,0e5h,050h,02ah,071h,037h,02ch,04eh,034h,02ah,0e4h,0e4h,0e4h	; a548  .~)'.P*q7,N4*...
	defb 0feh,08fh,0cfh,0c5h,0e4h,089h,0ebh,0bch,03dh,0f8h,002h,0f8h,063h,051h,0fbh	; a558  ........=...cQ.

; ----------------------------------------------------------------------
; DATOS mensaje_A567: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (11 bytes)
;   0xa567..0xa572  (11 bytes)
DATA_mensaje_A567:
	defb 003h,076h,09eh,0a8h,09bh,0f8h,054h,0f8h,023h,0e1h,0fbh	; a567  .v....T.#..

; ----------------------------------------------------------------------
; DATOS mensaje_A572: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (23 bytes)
;   0xa572..0xa589  (23 bytes)
DATA_mensaje_A572:
	defb 002h,07eh,03fh,030h,064h,04ch,05dh,039h,0e5h,0feh,01dh,019h,016h,013h,00eh,000h	; a572  .~?0dL]9........
	defb 01dh,018h,00bh,015h,00fh,0e0h,0fbh	; a582

; ----------------------------------------------------------------------
; DATOS mensaje_A589: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (23 bytes)
;   0xa589..0xa5a0  (23 bytes)
DATA_mensaje_A589:
	defb 002h,076h,0c6h,093h,0aah,0beh,0cfh,090h,0f8h,054h,0f8h,023h,0e1h,0feh,0e4h,0e4h	; a589  .v.......T.#....
	defb 0e4h,061h,027h,030h,037h,0e0h,0fbh	; a599

; ----------------------------------------------------------------------
; DATOS mensaje_A5A0: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (102 bytes)
;   0xa5a0..0xa606  (102 bytes)
DATA_mensaje_A5A0:
	defb 002h,07eh,09eh,0a8h,09bh,038h,050h,030h,03eh,0c5h,0a6h,099h,03dh,0f8h,00fh,0f8h	; a5a0  .~...8P0>...=...
	defb 00bh,060h,04ah,02ch,0feh,0f8h,00bh,071h,037h,026h,034h,0e6h,02eh,038h,062h,02eh	; a5b0  .`J,...q7&4..8b.
	defb 033h,0f8h,07dh,059h,039h,026h,053h,0feh,026h,071h,030h,073h,03dh,0f8h,00fh,0f8h	; a5c0  3.}Y9&S.&q0s=...
	defb 01ah,039h,02ah,043h,059h,072h,071h,034h,0e6h,0fdh,050h,030h,047h,09eh,0a8h,09bh	; a5d0  .9*CYrq4..P0G...
	defb 038h,026h,071h,030h,074h,03ah,080h,0a1h,0a7h,085h,0feh,09dh,082h,0a2h,0adh,03dh	; a5e0  8&q0t:.........=
	defb 02fh,026h,0e5h,02eh,02eh,03dh,0f8h,07bh,0f8h,046h,03ah,036h,02ah,0feh,043h,071h	; a5f0  /&...=.{.F:6*.Cq
	defb 034h,03dh,059h,072h,0e6h,0fbh	; a600

; ----------------------------------------------------------------------
; DATOS mensaje_A606: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (12 bytes)
;   0xa606..0xa612  (12 bytes)
DATA_mensaje_A606:
	defb 002h,076h,09eh,0a8h,09bh,0f8h,054h,0f8h,023h,03eh,0e1h,0fbh	; a606  .v....T.#>..

; ----------------------------------------------------------------------
; DATOS mensaje_A612: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (57 bytes)
;   0xa612..0xa64b  (57 bytes)
DATA_mensaje_A612:
	defb 002h,07eh,02ah,04eh,03eh,031h,027h,059h,036h,0f8h,03eh,0e5h,02eh,02eh,02ah,04bh	; a612  .~*N>1'Y6.>...*K
	defb 08fh,0abh,0ebh,0feh,0beh,0a8h,03ah,027h,036h,02fh,04eh,034h,0e6h,02eh,02eh,02ah	; a622  ......:'6/N4...*
	defb 04bh,0f8h,062h,03ah,031h,0feh,027h,086h,0aah,03dh,038h,02eh,04fh,03ah,025h,04dh	; a632  K.b:1.'..=8.O:%M
	defb 034h,02ah,026h,0beh,0a8h,059h,0feh,072h,0fbh	; a642  4*&..Y.r.

; ----------------------------------------------------------------------
; DATOS mensaje_A64B: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (29 bytes)
;   0xa64b..0xa668  (29 bytes)
DATA_mensaje_A64B:
	defb 002h,076h,02ch,033h,071h,0e5h,043h,034h,037h,029h,02ch,04eh,02ah,071h,0e0h,0feh	; a64b  .v,3q.C47),N*q..
	defb 09eh,0a8h,09bh,03eh,08fh,0abh,0ebh,0beh,0a8h,0e4h,0e4h,0e4h,0fbh	; a65b  ...>.........

; ----------------------------------------------------------------------
; DATOS mensaje_A668: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (29 bytes)
;   0xa668..0xa685  (29 bytes)
DATA_mensaje_A668:
	defb 002h,07eh,01dh,018h,00bh,015h,00fh,0e5h,050h,030h,053h,026h,02ah,02fh,04eh,037h	; a668  .~......P0S&*/N7
	defb 026h,04dh,0feh,088h,0adh,093h,082h,053h,036h,02ch,02ah,0e1h,0fbh	; a678  &M.....S6,*..

; ----------------------------------------------------------------------
; DATOS mensaje_A685: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (28 bytes)
;   0xa685..0xa6a1  (28 bytes)
DATA_mensaje_A685:
	defb 002h,076h,0e4h,0e4h,0e4h,025h,052h,034h,053h,09ah,091h,0a5h,082h,05dh,02ah,04bh	; a685  .v...%R4S....]*K
	defb 05dh,0e6h,0feh,0e4h,0e4h,0e4h,031h,04dh,038h,0e1h,0e1h,0fbh	; a695  ].....1M8...

; ----------------------------------------------------------------------
; DATOS mensaje_A6A1: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (177 bytes)
;   0xa6a1..0xa752  (177 bytes)
DATA_mensaje_A6A1:
	defb 002h,07eh,033h,027h,0e4h,0e4h,0e4h,017h,00fh,01eh,00bh,016h,000h,011h,00fh,00bh	; a6a1  .~3'............
	defb 01ch,059h,0feh,072h,04ah,0e6h,01dh,018h,00bh,015h,00fh,0e6h,0feh,025h,04dh,03dh	; a6b1  .Y.rJ........%M=
	defb 059h,072h,0e5h,025h,04eh,053h,0e4h,0e4h,0e4h,02eh,02eh,03ah,0e6h,0feh,0fdh,025h	; a6c1  Yr.%NS.....:...%
	defb 034h,04bh,030h,026h,017h,00fh,01eh,00bh,016h,000h,011h,00fh,00bh,01ch,03eh,0feh	; a6d1  4K0&..........>.
	defb 031h,060h,03ah,085h,0adh,08dh,081h,030h,037h,029h,04dh,0e6h,004h,0f8h,053h,0f8h	; a6e1  1`:....07)M...S.
	defb 03eh,0e5h,0feh,025h,052h,034h,053h,099h,085h,081h,030h,034h,03dh,03eh,034h,052h	; a6f1  >..%R4S...04=>4R
	defb 039h,04dh,08bh,0feh,08ah,087h,09ah,0adh,0e4h,0e4h,0e4h,0fdh,0f8h,01ch,060h,03eh	; a701  9M............`>
	defb 0e5h,025h,03dh,08ch,082h,0bdh,081h,047h,03dh,0c3h,0abh,0ebh,051h,0feh,03fh,046h	; a711  .%=....G=...Q.?F
	defb 034h,085h,081h,0a7h,0d2h,082h,08fh,081h,0c5h,053h,0f8h,01fh,04bh,04eh,0e5h,0feh	; a721  4........S..KN..
	defb 02fh,04bh,03ah,033h,03dh,088h,081h,0a7h,0d2h,082h,0f8h,008h,08fh,081h,0c5h,03dh	; a731  /K:3=..........=
	defb 0a7h,0feh,0d2h,082h,08ah,0adh,047h,031h,031h,046h,04bh,04eh,037h,026h,04dh,0e6h	; a741  ......G11FKN7&M.
	defb 0fbh	; a751

; ----------------------------------------------------------------------
; DATOS mensaje_A752: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (43 bytes)
;   0xa752..0xa77d  (43 bytes)
DATA_mensaje_A752:
	defb 002h,076h,031h,04dh,038h,0e5h,025h,03dh,099h,081h,086h,0f8h,06fh,085h,087h,090h	; a752  .v1M8.%=....o...
	defb 0d2h,0b7h,082h,0feh,089h,08bh,0d1h,082h,0b1h,086h,03eh,017h,00fh,01eh,00bh,016h	; a762  ..........>.....
	defb 000h,011h,00fh,00bh,0feh,01ch,053h,0e4h,0e4h,0e4h,0fbh	; a772  ......S....

; ----------------------------------------------------------------------
; DATOS mensaje_A77D: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (179 bytes)
;   0xa77d..0xa830  (179 bytes)
DATA_mensaje_A77D:
	defb 002h,07eh,033h,03dh,0f8h,07dh,04ch,0e6h,017h,00fh,01eh,00bh,016h,000h,011h,00fh	; a77d  .~3=.}L.........
	defb 00bh,01ch,03eh,0feh,085h,087h,093h,082h,08ah,081h,09dh,089h,082h,08dh,0adh,08bh	; a78d  ..>.............
	defb 0d0h,059h,072h,0e6h,0feh,02eh,026h,036h,03dh,0b4h,091h,0a7h,0d2h,087h,03eh,085h	; a79d  .Yr...&6=.....>.
	defb 087h,051h,093h,082h,08ah,0feh,081h,030h,037h,03eh,059h,046h,037h,099h,0cfh,086h	; a7ad  .Q.....07>YF7...
	defb 02fh,04eh,04dh,0e6h,0fdh,0b3h,0adh,0b4h,0bdh,0ebh,0a6h,0adh,0bch,03eh,0f8h,035h	; a7bd  /NM..........>.5
	defb 0f8h,00ch,060h,0a4h,081h,081h,091h,0feh,085h,087h,051h,092h,03ah,0f8h,049h,04eh	; a7cd  ..`.......Q.:.IN
	defb 034h,0e6h,033h,03dh,0f8h,02eh,0e5h,0b8h,081h,08fh,0feh,081h,083h,097h,0a8h,0afh	; a7dd  4.3=............
	defb 0ebh,060h,025h,04dh,019h,013h,016h,013h,022h,051h,0feh,050h,053h,047h,03dh,03ah	; a7ed  .`%M...."Q.PSG=:
	defb 030h,04ah,027h,038h,030h,037h,026h,04dh,0e6h,0fdh,01dh,018h,00bh,015h,00fh,0e4h	; a7fd  0J'807&M........
	defb 0e4h,0e4h,02eh,02eh,043h,060h,0f8h,019h,028h,062h,0e5h,0feh,02eh,026h,036h,04bh	; a80d  ....C`..(b...&6K
	defb 03dh,087h,0aah,09eh,087h,053h,0f8h,018h,028h,037h,02bh,034h,059h,0feh,072h,04fh	; a81d  =....S..(7+4Y.rO
	defb 027h,0e1h,0fbh	; a82d

; ----------------------------------------------------------------------
; DATOS mensaje_A830: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (15 bytes)
;   0xa830..0xa83f  (15 bytes)
DATA_mensaje_A830:
	defb 003h,076h,00ch,013h,011h,0e4h,0e4h,0e4h,00ch,019h,01dh,01dh,0e1h,0e1h,0fbh	; a830  .v.............

; ----------------------------------------------------------------------
; DATOS mensaje_A83F: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (148 bytes)
;   0xa83f..0xa8d3  (148 bytes)
DATA_mensaje_A83F:
	defb 002h,07eh,048h,036h,059h,072h,0e0h,048h,036h,03eh,017h,00fh,01eh,00bh,016h,000h	; a83f  .~H6Yr.H6>......
	defb 011h,00fh,0feh,00bh,01ch,038h,019h,013h,016h,013h,022h,060h,0f8h,035h,0f8h,00ch	; a84f  .....8...."`.5..
	defb 051h,03ah,054h,04fh,027h,0feh,038h,034h,02ch,04bh,052h,061h,04dh,0e6h,048h,036h	; a85f  Q:TO'.84,KRaM.H6
	defb 04bh,03ah,050h,034h,030h,037h,0feh,03eh,039h,04bh,052h,0e0h,019h,013h,016h,013h	; a86f  K:P407.>9KR.....
	defb 022h,051h,0e6h,0fdh,085h,0aeh,087h,03eh,0f8h,052h,057h,04fh,030h,03dh,034h,046h	; a87f  "Q.....>.RWO0=4F
	defb 05dh,02dh,03ah,025h,04dh,0feh,03dh,060h,03eh,039h,026h,0e6h,09eh,0a8h,09bh,03eh	; a88f  ]-:%M.=`>9&....>
	defb 081h,08bh,03eh,036h,04ah,026h,0feh,053h,08bh,0adh,0b7h,082h,053h,04ah,050h,026h	; a89f  ..>6J&.S....SJP&
	defb 0e6h,026h,033h,026h,060h,02ch,04eh,0feh,071h,0e0h,0fdh,048h,036h,04bh,03dh,0b2h	; a8af  .&3&`,N.q..H6K=.
	defb 082h,0a2h,0adh,03ah,026h,036h,043h,060h,034h,028h,04bh,0feh,04eh,04dh,02ah,050h	; a8bf  ...:&6C`4(K.NM*P
	defb 02ah,04bh,052h,0fbh	; a8cf

; ----------------------------------------------------------------------
; DATOS mensaje_A8D3: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (21 bytes)
;   0xa8d3..0xa8e8  (21 bytes)
DATA_mensaje_A8D3:
	defb 002h,076h,0a3h,087h,09ah,0adh,051h,036h,02ah,050h,04eh,04dh,038h,0a3h,0cfh,085h	; a8d3  .v....Q6*PNM8...
	defb 081h,05dh,0feh,039h,0fbh	; a8e3

; ----------------------------------------------------------------------
; DATOS mensaje_A8E8: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (102 bytes)
;   0xa8e8..0xa94e  (102 bytes)
DATA_mensaje_A8E8:
	defb 002h,07eh,09eh,0a8h,09bh,03eh,050h,034h,030h,038h,0f8h,059h,059h,0e5h,089h,0aeh	; a8e8  .~...>P408.YY...
	defb 08fh,0a0h,08dh,0feh,0adh,086h,051h,0f8h,043h,0f8h,04eh,03ah,047h,071h,037h,026h	; a8f8  ......Q.C.N:Gq7&
	defb 04dh,03eh,05ah,05dh,0e6h,0f8h,059h,0feh,089h,082h,030h,037h,026h,034h,01dh,01eh	; a908  M>Z]..Y...07&4..
	defb 00ch,03dh,0f8h,051h,083h,0ebh,0b4h,0cbh,0adh,0feh,093h,053h,050h,034h,030h,037h	; a918  .=.Q.......SP407
	defb 02ch,04eh,034h,047h,03dh,059h,072h,0e6h,0fdh,08bh,0d1h,082h,099h,08ch,082h,053h	; a928  ,N4G=Yr........S
	defb 050h,02ah,04eh,062h,09bh,091h,082h,03dh,0a0h,0feh,08dh,0adh,086h,060h,0f8h,07bh	; a938  P*Nb...=.....`.{
	defb 0f8h,071h,060h,02bh,04dh,0fbh	; a948

; ----------------------------------------------------------------------
; DATOS mensaje_A94E: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (20 bytes)
;   0xa94e..0xa962  (20 bytes)
DATA_mensaje_A94E:
	defb 002h,076h,0c6h,093h,0aah,0beh,0cfh,090h,0e5h,0feh,025h,052h,034h,03eh,061h,027h	; a94e  .v........%R4>a'
	defb 031h,04dh,0e1h,0fbh	; a95e

; ----------------------------------------------------------------------
; DATOS mensaje_A962: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (66 bytes)
;   0xa962..0xa9a4  (66 bytes)
DATA_mensaje_A962:
	defb 002h,07eh,02bh,044h,038h,050h,030h,051h,041h,05dh,037h,04dh,085h,0c0h,03eh,090h	; a962  .~+D8P0QA]7M..>.
	defb 0d2h,0bdh,0feh,0a0h,0c5h,0a9h,0ebh,093h,059h,072h,0e6h,0bdh,087h,099h,03eh,09bh	; a972  ........Yr....>.
	defb 085h,098h,082h,0feh,059h,072h,0e6h,050h,030h,03eh,042h,071h,038h,026h,037h,0e5h	; a982  ....Yr.P0>Bq8&7.
	defb 09eh,0a8h,09bh,051h,0feh,034h,031h,02dh,037h,02ch,04eh,0e6h,01dh,018h,00bh,015h	; a992  ...Q.41-7,N.....
	defb 00fh,0fbh	; a9a2

; ----------------------------------------------------------------------
; DATOS mensaje_A9A4: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (17 bytes)
;   0xa9a4..0xa9b5  (17 bytes)
DATA_mensaje_A9A4:
	defb 002h,076h,050h,02ah,071h,034h,0e6h,025h,038h,060h,045h,02ah,028h,03ah,02ch,04dh	; a9a4  .vP*q4.%8`E*(:,M
	defb 0fbh	; a9b4

; ----------------------------------------------------------------------
; DATOS mensaje_A9B5: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (9 bytes)
;   0xa9b5..0xa9be  (9 bytes)
DATA_mensaje_A9B5:
	defb 003h,07eh,01dh,018h,00bh,015h,00fh,0e1h,0fbh	; a9b5  .~.......

; ----------------------------------------------------------------------
; DATOS mensaje_A9BE: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (145 bytes)
;   0xa9be..0xaa4f  (145 bytes)
DATA_mensaje_A9BE:
	defb 002h,07eh,045h,031h,046h,03dh,083h,0a9h,0adh,053h,02bh,044h,03dh,09bh,0c8h,0adh	; a9be  .~E1F=...S+D=...
	defb 060h,03ch,0feh,0e6h,039h,02ah,039h,02ah,088h,0cfh,089h,0adh,032h,052h,0e6h,02eh	; a9ce  `<..9*9*....2R..
	defb 043h,071h,034h,0feh,047h,052h,05dh,0e6h,0fdh,0e4h,0e4h,0e4h,033h,04eh,02ah,04bh	; a9de  Cq4.GR].....3N*K
	defb 050h,030h,03dh,0a4h,082h,0b4h,0adh,060h,0a5h,0feh,0b6h,09bh,0e4h,098h,0a8h,0bbh	; a9ee  P0=....`........
	defb 0adh,038h,026h,027h,0f8h,057h,0f8h,05ch,0f8h,00fh,0f8h,01ah,053h,02eh,0feh,03dh	; a9fe  .8&'.W.\....S..=
	defb 0f8h,045h,0f8h,060h,03ah,031h,052h,060h,026h,04dh,03dh,059h,072h,0e6h,08bh,0d1h	; aa0e  .E.`:1R`&M=Yr...
	defb 082h,0feh,099h,08ch,082h,002h,005h,001h,0e4h,005h,001h,060h,03eh,039h,032h,04dh	; aa1e  ...........`>92M
	defb 0e6h,0fdh,0f8h,057h,0f8h,05ch,03ah,02ah,052h,031h,04dh,02eh,038h,039h,04bh,0f8h	; aa2e  ...W.\:*R1M.89K.
	defb 074h,03ah,039h,071h,037h,0feh,02ch,04eh,04dh,059h,072h,04fh,027h,0e4h,0e4h,0e4h	; aa3e  t:9q7.,NMYrO'...
	defb 0fbh	; aa4e

; ----------------------------------------------------------------------
; DATOS mensaje_AA4F: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (40 bytes)
;   0xaa4f..0xaa77  (40 bytes)
DATA_mensaje_AA4F:
	defb 002h,076h,0f8h,044h,0b4h,0d2h,082h,0bfh,05dh,0e6h,045h,031h,046h,03dh,088h,0cfh	; aa4f  .v.D....].E1F=..
	defb 089h,0adh,08bh,0feh,086h,03ah,03eh,0f8h,069h,03ah,0f8h,01bh,027h,04ah,027h,03ah	; aa5f  .....:>.i:..'J':
	defb 045h,02ah,028h,03ah,02ch,04dh,0feh,0fbh	; aa6f  E*(:,M..

; ----------------------------------------------------------------------
; DATOS mensaje_AA77: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (17 bytes)
;   0xaa77..0xaa88  (17 bytes)
DATA_mensaje_AA77:
	defb 003h,07eh,025h,04ch,053h,038h,027h,0e6h,01dh,018h,00bh,015h,00fh,0e4h,0e4h,0e4h	; aa77  .~%LS8'.........
	defb 0fbh	; aa87

; ----------------------------------------------------------------------
; DATOS mensaje_AA88: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (62 bytes)
;   0xaa88..0xaac6  (62 bytes)
DATA_mensaje_AA88:
	defb 002h,07eh,09eh,0a8h,09bh,03eh,090h,0cbh,089h,057h,038h,08ch,0aah,0bdh,086h,080h	; aa88  .~...>...W8.....
	defb 057h,030h,0feh,02ah,03eh,039h,032h,052h,0e6h,033h,04eh,03ah,088h,081h,085h,081h	; aa98  W0.*>92R.3N:....
	defb 0f8h,031h,053h,036h,0feh,04ah,026h,08fh,081h,0c5h,0e5h,02eh,052h,039h,0b4h,0d2h	; aaa8  .1S6.J&.....R9..
	defb 082h,086h,0d2h,082h,060h,0feh,03eh,039h,029h,02fh,04bh,059h,072h,0fbh	; aab8  ....`.>9)/KYr.

; ----------------------------------------------------------------------
; DATOS mensaje_AAC6: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (15 bytes)
;   0xaac6..0xaad5  (15 bytes)
DATA_mensaje_AAC6:
	defb 002h,076h,025h,052h,034h,03eh,0e5h,0c6h,093h,0aah,0beh,0cfh,090h,0e1h,0fbh	; aac6  .v%R4>.........

; ----------------------------------------------------------------------
; DATOS mensaje_AAD5: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (42 bytes)
;   0xaad5..0xaaff  (42 bytes)
DATA_mensaje_AAD5:
	defb 002h,07eh,050h,030h,03eh,0aah,08bh,080h,057h,038h,028h,026h,057h,030h,02ah,03eh	; aad5  .~P0>...W8(&W0*>
	defb 039h,032h,0feh,052h,0e4h,0e4h,0e4h,0feh,033h,027h,059h,072h,0e0h,0feh,094h,08fh	; aae5  92.R....3'Yr....
	defb 0ebh,08bh,0d0h,039h,04bh,03eh,039h,032h,04dh,0fbh	; aaf5  ...9K>92M.

; ----------------------------------------------------------------------
; DATOS mensaje_AAFF: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (34 bytes)
;   0xaaff..0xab21  (34 bytes)
DATA_mensaje_AAFF:
	defb 003h,076h,094h,08fh,0ebh,08bh,0d0h,0e1h,0feh,0e4h,0e4h,0e4h,025h,052h,034h,04bh	; aaff  .v..........%R4K
	defb 051h,0b2h,083h,081h,030h,037h,02bh,034h,01dh,0feh,01eh,00ch,03dh,0f8h,051h,02ah	; ab0f  Q...07+4....=.Q*
	defb 0e1h,0fbh	; ab1f

; ----------------------------------------------------------------------
; DATOS mensaje_AB21: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (34 bytes)
;   0xab21..0xab43  (34 bytes)
DATA_mensaje_AB21:
	defb 002h,07eh,085h,098h,0b4h,0d2h,039h,04bh,089h,093h,0bdh,047h,050h,02ah,04dh,030h	; ab21  .~....9K...GP*M0
	defb 0e5h,09eh,0feh,0a8h,09bh,047h,0f8h,013h,051h,049h,04dh,030h,037h,026h,04dh,03eh	; ab31  .....G..QIM07&M>
	defb 05ah,0fbh	; ab41

; ----------------------------------------------------------------------
; DATOS mensaje_AB43: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (13 bytes)
;   0xab43..0xab50  (13 bytes)
DATA_mensaje_AB43:
	defb 002h,076h,064h,059h,039h,03dh,02ah,0e1h,033h,03dh,0f8h,051h,0fbh	; ab43  .vdY9=*.3=.Q.

; ----------------------------------------------------------------------
; DATOS mensaje_AB50: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (138 bytes)
;   0xab50..0xabda  (138 bytes)
DATA_mensaje_AB50:
	defb 002h,07eh,0f8h,044h,059h,074h,027h,064h,0e5h,094h,08fh,0ebh,08bh,0d0h,03eh,040h	; ab50  .~.DYt'd......>@
	defb 036h,027h,03dh,0feh,0f8h,051h,060h,03eh,039h,026h,0e6h,0c5h,0aah,03dh,083h,0ebh	; ab60  6'=..Q`>9&...=..
	defb 0b4h,0cbh,0adh,093h,059h,0feh,072h,0e6h,0fdh,050h,030h,04bh,053h,036h,02ah,043h	; ab70  ....Y.r..P0KS6*C
	defb 071h,034h,0f8h,028h,0e5h,02ah,03dh,059h,074h,05dh,0feh,02dh,03eh,039h,052h,038h	; ab80  q4.(.*=Yt].->9R8
	defb 02ah,092h,086h,03dh,0a4h,095h,09bh,0cch,0ebh,0a0h,051h,0feh,03bh,031h,052h,060h	; ab90  *..=......Q..1R`
	defb 03ah,056h,04dh,02eh,038h,053h,060h,02bh,034h,052h,059h,072h,0feh,0e6h,0fdh,02bh	; aba0  :VM.8S`+4RYr...+
	defb 071h,038h,086h,085h,081h,051h,027h,02ah,053h,071h,037h,02eh,03dh,0b3h,0adh,0feh	; abb0  q8...Q'*Sq7.=...
	defb 0b4h,0bdh,0ebh,0a6h,0adh,0bch,03dh,061h,02eh,02ah,03ah,08dh,0adh,0c5h,087h,030h	; abc0  ......=a.*:....0
	defb 0feh,037h,026h,04dh,03eh,05ah,059h,072h,0e6h,0fbh	; abd0  .7&M>ZYr..

; ----------------------------------------------------------------------
; DATOS mensaje_ABDA: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (14 bytes)
;   0xabda..0xabe8  (14 bytes)
DATA_mensaje_ABDA:
	defb 002h,076h,085h,098h,0b4h,0d2h,047h,0a0h,08dh,0adh,086h,051h,0e1h,0fbh	; abda  .v....G....Q..

; ----------------------------------------------------------------------
; DATOS mensaje_ABE8: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (60 bytes)
;   0xabe8..0xac24  (60 bytes)
DATA_mensaje_ABE8:
	defb 002h,07eh,026h,048h,0e5h,036h,02ah,043h,071h,034h,0f8h,028h,03ah,0f8h,032h,071h	; abe8  .~&H.6*Cq4.(:.2q
	defb 02fh,02bh,03ah,027h,0feh,062h,050h,04eh,034h,0e4h,0e4h,0e4h,050h,02ah,04dh,03dh	; abf8  /+:'.bPN4...P*M=
	defb 03eh,02ah,03dh,059h,074h,0feh,047h,092h,086h,03dh,0a4h,095h,09dh,0ebh,0a0h,051h	; ac08  >*=Yt.G..=.....Q
	defb 02bh,037h,026h,04dh,02eh,038h,0feh,05dh,02dh,059h,072h,0fbh	; ac18  +7&M.8.]-Yr.

; ----------------------------------------------------------------------
; DATOS mensaje_AC24: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (14 bytes)
;   0xac24..0xac32  (14 bytes)
DATA_mensaje_AC24:
	defb 003h,076h,037h,053h,02ah,04ch,03eh,039h,030h,02ah,0e4h,0e4h,0e4h,0fbh	; ac24  .v7S*L>90*....

; ----------------------------------------------------------------------
; DATOS mensaje_AC32: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (78 bytes)
;   0xac32..0xac80  (78 bytes)
DATA_mensaje_AC32:
	defb 003h,07eh,037h,053h,02ah,04ch,03eh,02ah,03dh,059h,074h,053h,0f8h,051h,038h,026h	; ac32  .~7S*L>*=YtS.Q8&
	defb 027h,02eh,038h,0feh,059h,072h,0e6h,034h,038h,028h,092h,086h,03dh,085h,0cfh,089h	; ac42  '.8.Yr.48(..=...
	defb 082h,051h,030h,037h,0feh,026h,04ah,027h,038h,047h,0e4h,0e4h,0e4h,02eh,03dh,0a5h	; ac52  .Q07.&J'8G....=.
	defb 082h,08ah,081h,03ah,0f8h,051h,0feh,0f8h,012h,0f8h,023h,03eh,026h,039h,026h,02ah	; ac62  ...:.Q....#>&9&*
	defb 04bh,03dh,0e6h,0fdh,033h,04eh,053h,037h,053h,02ah,04ch,059h,072h,0fbh	; ac72  K=..3NS7S*LYr.

; ----------------------------------------------------------------------
; DATOS mensaje_AC80: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (64 bytes)
;   0xac80..0xacc0  (64 bytes)
DATA_mensaje_AC80:
	defb 002h,07eh,094h,08fh,0ebh,08bh,0d0h,03eh,0f8h,051h,059h,072h,0e6h,0f8h,051h,030h	; ac80  .~.....>.QYr..Q0
	defb 02ah,026h,02dh,039h,0feh,026h,0f8h,02fh,0f8h,02dh,060h,043h,035h,064h,032h,037h	; ac90  *&-9.&./.-`C5d27
	defb 03eh,061h,027h,059h,072h,0e1h,0feh,034h,038h,028h,062h,0f8h,051h,0f8h,03dh,093h	; aca0  >a'Yr..48(b.Q.=.
	defb 081h,0a9h,038h,02ah,0e4h,0e4h,0e4h,0feh,0e4h,0e4h,0e4h,019h,020h,00fh,01ch,0fbh	; acb0  ..8*........ ...

; ----------------------------------------------------------------------
; DATOS sin identificar  0xacc0..0xacc8  (8 bytes)
DATA_ACC0:
	defb 0e4h,0e4h,0e4h,019h,020h,00fh,01ch,0fbh	; acc0  .... ...

; ----------------------------------------------------------------------
; DATOS mensaje_ACC8: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:616C (65 bytes)
;   0xacc8..0xad09  (65 bytes)
DATA_mensaje_ACC8:
	defb 002h,07eh,01dh,018h,00bh,015h,00fh,0e5h,09eh,0a8h,09bh,03eh,043h,05dh,044h,036h	; acc8  .~.........>C]D6
	defb 02ah,04bh,0feh,052h,02ah,0e1h,0e4h,0e4h,0e4h,02bh,071h,038h,032h,046h,04bh,04eh	; acd8  *K.R*....+q82FKN
	defb 037h,026h,04dh,0feh,03ah,035h,053h,026h,039h,026h,0e6h,03eh,048h,02ch,034h,031h	; ace8  7&M.:5S&9&.>H,41
	defb 02dh,037h,048h,071h,0feh,037h,02ch,04eh,0e6h,0e4h,0e4h,0e4h,019h,020h,00fh,01ch	; acf8  -7Hq.7,N..... ..
	defb 0fbh	; ad08

; ----------------------------------------------------------------------
; DATOS mensaje_AD09: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (294 bytes)
;   0xad09..0xae2f  (294 bytes)
DATA_mensaje_AD09:
	defb 002h,07bh,00ch,016h,00bh,00dh,015h,000h,00dh,019h,016h,019h,01ch,02ah,0e4h,0e4h	; ad09  .{...........*..
	defb 0feh,003h,0f8h,053h,055h,04eh,06fh,0f8h,03eh,02ah,04bh,02eh,03dh,0f8h,035h,0f8h	; ad19  ...SUNo.>*K.=.5.
	defb 00ch,060h,0f8h,06dh,0f8h,066h,03ah,0feh,039h,071h,037h,02bh,034h,048h,036h,05dh	; ad29  .`.m.f:.9q7+4H6]
	defb 0e6h,0f8h,003h,0f8h,03eh,03dh,088h,081h,0a9h,086h,0feh,03eh,050h,02ah,04bh,03ch	; ad39  ....>=.....>P*K<
	defb 06fh,0e6h,0fdh,018h,00bh,01dh,00bh,03dh,08fh,081h,090h,086h,0d1h,082h,0f8h,00dh	; ad49  o......=........
	defb 085h,0adh,086h,0feh,0d2h,082h,093h,087h,08bh,0d1h,0bfh,08fh,081h,0f8h,030h,0f8h	; ad59  ..............0.
	defb 033h,03dh,099h,081h,092h,0feh,087h,095h,0adh,0b4h,0d0h,05dh,0e6h,0fdh,09bh,0a6h	; ad69  3=.........]....
	defb 081h,0adh,0b0h,0e4h,08ch,08fh,0ebh,038h,08ch,0c4h,0ebh,0bbh,0c9h,0ebh,0feh,039h	; ad79  .......8.......9
	defb 089h,082h,0b1h,086h,051h,0f8h,04dh,0f8h,002h,038h,030h,037h,026h,04dh,0fdh,026h	; ad89  ....Q.M..807&M.&
	defb 026h,039h,0e5h,048h,036h,03eh,084h,0a9h,034h,035h,044h,037h,06fh,039h,0feh,0c5h	; ad99  &9.H6>..45D7o9..
	defb 0aah,03dh,0f8h,03ah,08eh,082h,048h,059h,072h,03ch,06fh,0e5h,083h,0a7h,0ebh,093h	; ada9  .=.:..HYr<o.....
	defb 0feh,03dh,027h,035h,073h,027h,048h,02fh,052h,05dh,0e6h,0fdh,05dh,02ah,04bh,02ah	; adb9  .='5s'H/R]..]*K*
	defb 028h,071h,037h,08bh,09eh,091h,053h,050h,04ch,026h,0e6h,0feh,0c5h,0aah,03dh,0f8h	; adc9  (q7...SPL&....=.
	defb 057h,02bh,03eh,0a5h,08eh,087h,060h,02bh,04dh,053h,04ah,0e5h,080h,0feh,09eh,090h	; add9  W+>...`+MSJ.....
	defb 0d1h,080h,03dh,0f8h,057h,02bh,03eh,033h,027h,03eh,026h,02ah,03ch,06fh,0fdh,01dh	; ade9  ..=.W+>3'>&*<o..
	defb 018h,00bh,015h,00fh,0e5h,043h,05ah,03eh,025h,052h,034h,03dh,029h,037h,039h,0feh	; adf9  .....CZ>%R4=)79.
	defb 044h,099h,081h,088h,0adh,038h,026h,02ch,02ah,0e4h,0e4h,0e4h,0fdh,086h,08fh,081h	; ae09  D....8&,*.......
	defb 030h,037h,04dh,05bh,0e5h,0feh,0aah,0ebh,0adh,0a9h,0adh,0b4h,0d0h,0ebh,0e4h,0e4h	; ae19  07M[............
	defb 0e4h,019h,020h,00fh,01ch,0fbh	; ae29

; ----------------------------------------------------------------------
; DATOS mensaje_AE2F: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (255 bytes)
;   0xae2f..0xaf2e  (255 bytes)
DATA_mensaje_AE2F:
	defb 002h,07bh,01ch,01fh,018h,018h,013h,018h,011h,000h,017h,00bh,018h,02ah,0e4h,0e4h	; ae2f  .{...........*..
	defb 0feh,047h,038h,0bdh,0a8h,08dh,0aah,094h,0e4h,084h,0a7h,0adh,0c4h,0cfh,087h,03dh	; ae3f  .G8............=
	defb 08fh,0feh,0adh,086h,0d2h,0a7h,0a6h,0adh,094h,0ebh,05dh,0e6h,002h,001h,001h,0a1h	; ae4f  ..........].....
	defb 0ebh,093h,0feh,0a8h,051h,00ah,0e5h,007h,00ah,0beh,0d2h,082h,060h,03eh,030h,04dh	; ae5f  ....Q.......`>0M
	defb 0e6h,0fdh,0bch,0ebh,0c4h,0adh,0b0h,060h,0a7h,087h,0b4h,0d2h,082h,086h,0d2h,082h	; ae6f  .......`........
	defb 085h,081h,0feh,02ah,04bh,091h,081h,09dh,082h,02fh,04eh,0e5h,0a5h,0ebh,0aah,0cfh	; ae7f  ...*K..../N.....
	defb 0c3h,03dh,092h,0feh,0aah,0a7h,0b5h,0a0h,03ah,08ah,0adh,085h,030h,034h,0e6h,0fdh	; ae8f  .=......:...04..
	defb 038h,037h,047h,025h,052h,034h,03dh,0f8h,041h,060h,03eh,029h,026h,036h,02dh,03ch	; ae9f  87G%R4=.A`>)&6-<
	defb 0feh,06fh,05bh,0e6h,043h,02fh,03ah,090h,0ebh,08fh,038h,09ch,0beh,05dh,0e6h,02eh	; aeaf  .o[.C/:...8..]..
	defb 026h,0feh,036h,051h,048h,04dh,03ah,03eh,093h,0a6h,0cfh,0c5h,051h,030h,02ah,02dh	; aebf  &.6QHM:>....Q0*-
	defb 037h,029h,0feh,026h,02eh,045h,030h,02ah,03ch,06fh,0e6h,0fdh,048h,036h,03dh,089h	; aecf  7).&.E0*<o..H6=.
	defb 0ebh,08ch,0f8h,02eh,03ah,030h,02ah,02dh,04eh,062h,0f8h,018h,02eh,044h,0feh,03eh	; aedf  ....:0*-Nb...D.>
	defb 025h,04dh,0e6h,0fdh,0e4h,0e4h,0e4h,034h,05dh,030h,0e5h,0aeh,08ch,053h,043h,050h	; aeef  %M.....4]0...SCP
	defb 04dh,0f8h,03eh,03ah,039h,0feh,0e6h,0f8h,044h,0f8h,026h,039h,03dh,03eh,04ah,0e5h	; aeff  M.>:9...D.&9=>J.
	defb 048h,036h,03dh,0f8h,041h,03dh,03eh,048h,0feh,02fh,051h,054h,072h,02ch,03ah,04ch	; af0f  H6=.A=>H./QTr,:L
	defb 04ah,027h,031h,04dh,052h,05dh,0feh,0e4h,0e4h,0e4h,019h,020h,00fh,01ch,0fbh	; af1f  J'1MR]..... ...

; ----------------------------------------------------------------------
; DATOS mensaje_AF2E: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; se solapan 6 bloques: (mensaje_AF42 AF42-B042)
;   (mensaje_AF5F AF5F-B042) (mensaje_AF7B AF7B-B042) (mensaje_B00F B00F-B042)
;   (mensaje_B021 B021-B042); lo leen p01:60B4 (276 bytes)
;   0xaf2e..0xb042  (276 bytes)
DATA_mensaje_AF2E:
	defb 002h,07bh,012h,013h,018h,00eh,0e4h,00eh,02ah,0e4h,0e4h,0e4h,0feh,02eh,03dh,0f8h	; af2e  .{......*.....=.
	defb 066h,0f8h,03eh,051h,02bh,026h,034h,05dh,02dh,060h,05dh,026h,03dh,0f8h,04fh,034h	; af3e  f.>Q+&4]-`]&=.O4
	defb 0feh,035h,053h,086h,0a2h,051h,03fh,048h,031h,0e6h,0fdh,041h,041h,0e4h,0e4h,08dh	; af4e  .5S..Q?H1..AA...
	defb 086h,08ah,081h,0b4h,0d1h,082h,0a7h,0d2h,082h,002h,09eh,0feh,0adh,003h,08dh,0adh	; af5e  ................
	defb 086h,0aah,0e5h,08ah,081h,089h,082h,0b4h,08eh,087h,003h,006h,0feh,001h,086h,0aah	; af6e  ................
	defb 0e5h,08ah,081h,089h,082h,089h,082h,0bch,005h,006h,001h,001h,0a1h,0feh,0ebh,093h	; af7e  ................
	defb 0a8h,0e6h,0fdh,09fh,08ah,081h,0a8h,0e5h,0bdh,0a8h,085h,0adh,09dh,082h,051h,033h	; af8e  ..............Q3
	defb 039h,028h,0e5h,0feh,090h,08fh,095h,082h,0a0h,08eh,082h,089h,082h,0bdh,0adh,060h	; af9e  9(.............`
	defb 043h,047h,04bh,04eh,0feh,034h,0f8h,01eh,03dh,02ah,026h,0f8h,05ch,0e6h,0fdh,089h	; afae  CGKN.4..=*&.\...
	defb 082h,0bch,02ah,04bh,03dh,08bh,0d2h,082h,08bh,0d0h,051h,02fh,04eh,034h,04bh,0feh	; afbe  ..*K=.....Q/N4K.
	defb 03fh,038h,034h,043h,04ch,047h,03ch,06fh,0e6h,0fdh,0f8h,030h,0f8h,00bh,028h,062h	; afce  ?84CLG<o...0..(b
	defb 08ah,081h,0b2h,0e5h,02ah,035h,0f8h,067h,039h,052h,05ch,03ch,06fh,0feh,0e4h,0e4h	; afde  ....*5.g9R\<o...
	defb 0e4h,038h,0f8h,019h,026h,037h,06fh,038h,02eh,04fh,05dh,053h,0e5h,08fh,081h,0feh	; afee  .8..&7o8.O]S....
	defb 087h,082h,09fh,08ah,081h,0a8h,03dh,093h,082h,0b4h,0d2h,082h,060h,0b4h,0b4h,0d2h	; affe  ......=.....`...
	defb 0feh,082h,03eh,02ah,050h,071h,037h,02bh,034h,0e6h,0fdh,08fh,081h,087h,082h,09fh	; b00e  ..>*Pq7+4.......
	defb 08ah,081h,0a8h,053h,025h,04eh,062h,0e5h,02eh,03dh,085h,0feh,081h,090h,0d2h,082h	; b01e  ...S%Nb..=......
	defb 051h,029h,038h,031h,02eh,038h,053h,060h,02bh,04dh,05bh,0feh,0e4h,0e4h,0e4h,019h	; b02e  Q)81.8S`+M[.....
	defb 020h,00fh,01ch,0fbh	; b03e

; ----------------------------------------------------------------------
; DATOS mensaje_B042: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; se solapan 4 bloques: (mensaje_B04E B04E-B11B)
;   (mensaje_B091 B091-B11B) (mensaje_B0A2 B0A2-B11B); lo leen p01:60B4 (217
;   bytes)
;   0xb042..0xb11b  (217 bytes)
DATA_mensaje_B042:
	defb 002h,07bh,01ch,00fh,00eh,000h,00ch,016h,00bh,01dh,01eh,00fh,01ch,02ah,0e4h,0feh	; b042  .{...........*..
	defb 025h,02ah,026h,0bdh,087h,099h,09eh,038h,030h,037h,030h,04bh,04eh,04dh,08eh,0feh	; b052  %*&....8070KNM..
	defb 0beh,083h,093h,03dh,0a8h,0a0h,0adh,0bdh,0f8h,044h,0f8h,00fh,0f8h,030h,03dh,080h	; b062  ...=.....D...0=.
	defb 0adh,08ah,0feh,091h,0f8h,03ch,0f8h,06ah,083h,0a7h,0ebh,093h,05dh,0e6h,0fdh,048h	; b072  .....<.j....]..H
	defb 036h,03dh,037h,03eh,0bfh,0ebh,0beh,0ebh,093h,0a6h,0cfh,0c5h,051h,03eh,0feh,04ch	; b082  6=7>........Q>.L
	defb 046h,055h,04bh,030h,0e5h,025h,026h,037h,03dh,025h,030h,061h,046h,051h,0feh,030h	; b092  FUK0.%&7=%0aFQ.0
	defb 037h,029h,026h,037h,02ah,04bh,093h,087h,081h,03dh,0b0h,0a9h,097h,0ebh,0feh,0bch	; b0a2  7)&7*K...=......
	defb 0e4h,0a6h,0adh,090h,0d0h,0ebh,060h,038h,061h,046h,051h,02fh,031h,0e6h,0fdh,01dh	; b0b2  ......`8aFQ/1...
	defb 018h,00bh,015h,00fh,0e5h,0b0h,0a9h,097h,0ebh,0bch,03ah,03eh,0b0h,0a9h,0feh,097h	; b0c2  ..........:>....
	defb 0ebh,0bch,060h,084h,082h,08fh,081h,030h,04fh,0e0h,048h,036h,047h,043h,0feh,034h	; b0d2  ..`....0O.H6GC.4
	defb 0e5h,039h,03ah,02ah,03dh,08bh,0d2h,082h,09ch,086h,03ah,0f8h,033h,051h,02ah,0feh	; b0e2  .9:*=.....:.3Q*.
	defb 02ch,030h,037h,026h,04dh,03eh,05ah,0e6h,0fdh,0b0h,0a9h,097h,0ebh,0bch,039h,04bh	; b0f2  ,07&M>Z.......9K
	defb 033h,052h,039h,0f8h,02dh,060h,047h,089h,082h,0feh,0b1h,086h,060h,02bh,04dh,05bh	; b102  3R9.-`G.....`+M[
	defb 0e6h,0e4h,0e4h,0e4h,019h,020h,00fh,01ch,0fbh	; b112  ..... ...

; ----------------------------------------------------------------------
; DATOS mensaje_B11B: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; se solapan 5 bloques: (mensaje_B11F B11F-B1A9)
;   (mensaje_B137 B137-B1A9) (mensaje_B182 B182-B1A9) (mensaje_B19D
;   B19D-B1A9); lo leen p01:60B4 (142 bytes)
;   0xb11b..0xb1a9  (142 bytes)
DATA_mensaje_B11B:
	defb 002h,07bh,01fh,016h,01eh,01ch,00bh,00ch,019h,022h,02ah,0e4h,0e4h,0e4h,0feh,01dh	; b11b  .{......."*.....
	defb 00bh,01dh,0e5h,011h,01dh,011h,00ah,0e5h,01fh,00eh,01eh,0f8h,030h,0f8h,003h,0f8h	; b12b  ............0...
	defb 01ah,060h,0feh,089h,0adh,08dh,081h,02fh,04eh,034h,09fh,0cfh,08bh,091h,0f8h,03ch	; b13b  .`...../N4.....<
	defb 0f8h,06ah,03dh,080h,0adh,0feh,08ah,091h,0bfh,08fh,081h,05dh,0e6h,0fdh,061h,026h	; b14b  .j=........]..a&
	defb 036h,047h,0f8h,03ah,08eh,082h,03dh,0c5h,0aah,05dh,0e6h,048h,036h,04bh,03eh,0feh	; b15b  6G.:..=..].H6K>.
	defb 043h,062h,034h,02bh,03fh,038h,036h,032h,05ah,03ah,0f8h,052h,051h,02eh,04fh,031h	; b16b  Cb4+?862Z:.RQ.O1
	defb 0e6h,0feh,0f8h,059h,0f8h,028h,03ah,025h,026h,037h,03ah,030h,037h,03eh,040h,04ch	; b17b  ...Y.(:%&7:07>@L
	defb 05dh,0e6h,0fdh,0ebh,0f8h,052h,05ah,036h,0e5h,02ah,034h,05ah,02dh,04dh,03dh,053h	; b18b  ]....RZ6.*4Z-M=S
	defb 0c0h,08ch,093h,05dh,0feh,05bh,0e4h,0e4h,0e4h,019h,020h,00fh,01ch,0fbh	; b19b  ...].[.... ...

; ----------------------------------------------------------------------
; DATOS mensaje_B1A9: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (138 bytes)
;   0xb1a9..0xb233  (138 bytes)
DATA_mensaje_B1A9:
	defb 002h,07bh,01ah,01ch,00fh,00eh,00bh,01eh,019h,01ch,02ah,0e4h,0e4h,0e4h,0feh,047h	; b1a9  .{........*....G
	defb 038h,0a9h,0cfh,087h,08ch,0e4h,089h,09eh,0adh,0bch,0f8h,030h,0f8h,033h,03dh,099h	; b1b9  8..........0.3=.
	defb 0adh,0feh,08fh,0ebh,05dh,0e6h,0b4h,0d0h,0adh,0b0h,0a8h,060h,03dh,0b1h,0a7h,0a6h	; b1c9  ....]......`=...
	defb 0f8h,03ah,051h,0feh,047h,071h,038h,047h,0f8h,04dh,0f8h,002h,038h,030h,037h,026h	; b1d9  .:Q.Gq8G.M..807&
	defb 04dh,0e6h,0fdh,0b4h,0d0h,0adh,0b0h,0a8h,060h,03dh,048h,036h,03eh,0f8h,052h,0f8h	; b1e9  M.......`=H6>.R.
	defb 069h,062h,039h,04eh,030h,0feh,037h,026h,04dh,0e6h,0c0h,093h,094h,0a0h,03dh,0f8h	; b1f9  ib9N0.7&M.....=.
	defb 050h,081h,083h,0a1h,0adh,060h,03eh,0feh,034h,071h,034h,0ebh,0f8h,052h,060h,003h	; b209  P....`>.4q4..R`.
	defb 089h,0f8h,046h,08fh,081h,051h,0b6h,0adh,0a1h,091h,0feh,02fh,032h,034h,038h,026h	; b219  ..F..Q...../248&
	defb 050h,04eh,037h,04dh,0e6h,019h,020h,00fh,01ch,0fbh	; b229  PN7M.. ...

; ----------------------------------------------------------------------
; DATOS mensaje_B233: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (275 bytes)
;   0xb233..0xb346  (275 bytes)
DATA_mensaje_B233:
	defb 002h,07bh,018h,013h,011h,012h,01eh,000h,01dh,013h,011h,012h,01eh,0e1h,0feh,01dh	; b233  .{..............
	defb 018h,00bh,015h,00fh,0e5h,0f8h,01ch,018h,013h,011h,012h,01eh,000h,01dh,013h,0feh	; b243  ................
	defb 011h,012h,01eh,038h,026h,071h,034h,02ah,0e1h,0e0h,029h,033h,04fh,030h,026h,0feh	; b253  ...8&q4*..)3O0&.
	defb 048h,036h,051h,092h,086h,03ah,043h,050h,030h,035h,043h,071h,034h,039h,0e6h,0fdh	; b263  H6Q..:CP05Cq49..
	defb 018h,013h,011h,012h,01eh,000h,01dh,013h,011h,012h,01eh,03eh,0f8h,062h,0c0h,0feh	; b273  ...........>.b..
	defb 093h,094h,0a0h,060h,0b0h,0a7h,0ebh,0adh,0c0h,0a9h,0ebh,0f8h,003h,0f8h,02eh,03ah	; b283  ...`...........:
	defb 0b4h,0d0h,0feh,0adh,0b0h,0a8h,0f8h,03ah,03ah,034h,02dh,034h,038h,026h,050h,04eh	; b293  .......::4-48&PN
	defb 04dh,0bbh,0adh,08dh,0feh,091h,03dh,0b1h,0a7h,0a6h,0bfh,08fh,081h,082h,0c9h,08ch	; b2a3  M.....=.........
	defb 0c3h,0ebh,0b5h,0fdh,03dh,0f8h,038h,02bh,03dh,02eh,04ch,05dh,0e6h,08ah,081h,08bh	; b2b3  ....=.8+=.L]....
	defb 0adh,03dh,085h,0a2h,09bh,0feh,0a6h,0ebh,0b4h,0d1h,08ch,0ebh,091h,051h,043h,038h	; b2c3  .=...........QC8
	defb 026h,0e5h,08ch,092h,0a8h,08ch,0feh,0e6h,048h,036h,03dh,031h,053h,034h,051h,0f8h	; b2d3  &.......H6=1S4Q.
	defb 067h,03ah,030h,034h,03dh,03eh,03fh,038h,0feh,03ah,054h,04ch,030h,02ah,026h,03ch	; b2e3  g:04=>?8.:TL0*&<
	defb 06fh,0e6h,0fdh,02eh,03dh,084h,0a9h,060h,02fh,028h,044h,034h,02eh,038h,053h,03ch	; b2f3  o...=..`/(D4.8S<
	defb 06fh,052h,05dh,0feh,0e0h,02eh,04eh,053h,031h,053h,034h,039h,02bh,080h,0adh,08ah	; b303  oR]...NS1S49+...
	defb 091h,0f8h,01ah,038h,026h,0feh,050h,04eh,04dh,049h,028h,052h,05dh,0e6h,0fdh,01dh	; b313  ...8&.PNMI(R]...
	defb 018h,00bh,015h,00fh,0e5h,025h,052h,034h,03dh,089h,082h,082h,0adh,047h,02eh,0feh	; b323  .....%R4=....G..
	defb 03dh,025h,034h,04ch,060h,029h,050h,04ch,02ah,039h,0feh,0e4h,0e4h,0e4h,019h,020h	; b333  =%4L`)PL*9.....
	defb 00fh,01ch,0fbh	; b343

; ----------------------------------------------------------------------
; DATOS mensaje_B346: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (94 bytes)
;   0xb346..0xb3a4  (94 bytes)
DATA_mensaje_B346:
	defb 002h,07bh,011h,01ch,00fh,023h,000h,010h,019h,022h,0e4h,0e4h,0e4h,0feh,0f8h,072h	; b346  .{...#...".....r
	defb 0f8h,066h,0e5h,09bh,0a6h,0adh,087h,0e4h,081h,0cbh,0ebh,0aeh,0ebh,0e6h,047h,038h	; b356  .f............G8
	defb 0feh,010h,019h,022h,000h,012h,019h,01fh,018h,00eh,0f8h,030h,0f8h,033h,0e6h,0fdh	; b366  ...".......0.3..
	defb 00ch,013h,011h,000h,00ch,019h,01dh,01dh,0f8h,028h,05dh,026h,03dh,010h,019h,022h	; b376  .........(]&=.."
	defb 03dh,0feh,08bh,0d2h,082h,0b2h,082h,051h,047h,036h,02fh,026h,057h,03dh,0f8h,04fh	; b386  =......QG6/&W=.O
	defb 0e6h,0feh,087h,0adh,08bh,0d2h,082h,006h,085h,081h,0e4h,0e4h,0e4h,0fbh	; b396  ..............

; ----------------------------------------------------------------------
; DATOS mensaje_B3A4: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (114 bytes)
;   0xb3a4..0xb416  (114 bytes)
DATA_mensaje_B3A4:
	defb 002h,076h,050h,02ah,071h,037h,026h,04dh,0e4h,0e4h,0e4h,048h,036h,03dh,0a4h,082h	; b3a4  .vP*q7&M...H6=..
	defb 08bh,0d1h,0feh,082h,02fh,03eh,0e6h,048h,036h,03dh,02eh,038h,03eh,089h,082h,099h	; b3b4  ..../>.H6=.8>...
	defb 081h,060h,025h,0feh,04dh,084h,0a9h,053h,026h,035h,062h,052h,04ah,02ch,030h,071h	; b3c4  .`%.M..S&5bRJ,0q
	defb 037h,026h,04dh,0fdh,0f8h,040h,071h,034h,047h,03dh,03eh,02ah,039h,04bh,05ah,03dh	; b3d4  7&M..@q4G=>*9KZ=
	defb 053h,02fh,039h,026h,0a9h,0feh,081h,08dh,081h,090h,0adh,090h,0d0h,087h,039h,099h	; b3e4  S/9&..........9.
	defb 0adh,08fh,0ebh,05dh,0e6h,08fh,0feh,081h,081h,0adh,034h,035h,03dh,05dh,04eh,047h	; b3f4  ...]......45=]NG
	defb 053h,033h,052h,02dh,026h,030h,0e5h,0feh,030h,034h,071h,037h,026h,034h,0e4h,0e4h	; b404  S3R-&0..04q7&4..
	defb 0e4h,0fbh	; b414

; ----------------------------------------------------------------------
; DATOS mensaje_B416: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (249 bytes)
;   0xb416..0xb50f  (249 bytes)
DATA_mensaje_B416:
	defb 002h,07bh,033h,027h,05dh,071h,034h,039h,0e6h,01dh,018h,00bh,015h,00fh,0e4h,0e4h	; b416  .{3']q49........
	defb 0e4h,059h,0feh,072h,0e5h,048h,036h,03dh,085h,089h,03eh,061h,027h,05dh,0e1h,039h	; b426  .Y.r.H6=..>a'].9
	defb 03ah,02ah,03dh,0feh,034h,030h,03ah,03eh,039h,04dh,05dh,04fh,027h,037h,0e4h,0e4h	; b436  :*=.40:>9M]O'7..
	defb 0e4h,0fdh,002h,001h,0f8h,053h,0f8h,03eh,0e5h,048h,036h,03eh,02eh,03dh,0f8h,035h	; b446  .....S.>.H6>.=.5
	defb 0f8h,00ch,060h,099h,0adh,0feh,08fh,0ebh,038h,04ah,062h,04eh,037h,026h,034h,0e6h	; b456  ..`.....8JbN7&4.
	defb 081h,0cbh,0ebh,0aeh,0ebh,0feh,03eh,0bch,081h,091h,057h,060h,099h,0adh,08fh,0ebh	; b466  ......>...W`....
	defb 038h,026h,027h,0f8h,002h,0f8h,063h,04bh,0feh,030h,026h,0e6h,0fdh,033h,03dh,02eh	; b476  8&'...cK.0&..3=.
	defb 04fh,0e5h,048h,036h,03eh,0f8h,04ah,053h,050h,03dh,0f8h,051h,038h,085h,0adh,0feh	; b486  O.H6>.JSP=.Q8...
	defb 088h,081h,053h,025h,071h,034h,0e6h,0fdh,048h,036h,03eh,0f8h,051h,03dh,0f8h,036h	; b496  ..S%q4..H6>.Q=.6
	defb 053h,050h,041h,0c1h,082h,0a1h,081h,0e5h,084h,0ebh,0feh,0bdh,0ebh,0e4h,0b3h,0e4h	; b4a6  SPA.............
	defb 09bh,0cbh,0adh,08ch,051h,02eh,02eh,04fh,044h,034h,053h,0feh,02dh,071h,02bh,074h	; b4b6  ....Q..OD4S.-q+t
	defb 02ch,08bh,0cfh,0c3h,081h,03ah,029h,050h,071h,034h,0e6h,0fdh,0f8h,036h,053h,050h	; b4c6  ,....:)Pq4...6SP
	defb 03eh,0f8h,051h,03ah,086h,0d2h,082h,09fh,051h,030h,046h,02fh,039h,02ah,0feh,071h	; b4d6  >.Q:....Q0F/9*.q
	defb 034h,04bh,030h,026h,0e6h,048h,036h,03eh,033h,03dh,02eh,038h,060h,0f8h,036h,053h	; b4e6  4K0&.H6>3=.8`.6S
	defb 0feh,050h,03dh,0f8h,02eh,033h,027h,0f8h,05bh,0f8h,07bh,0f8h,046h,051h,027h,04bh	; b4f6  .P=..3'.[.{.FQ'K
	defb 052h,060h,026h,034h,04bh,0feh,030h,026h,0fbh	; b506  R`&4K.0&.

; ----------------------------------------------------------------------
; DATOS mensaje_B50F: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (13 bytes)
;   0xb50f..0xb51c  (13 bytes)
DATA_mensaje_B50F:
	defb 002h,076h,033h,03dh,0f8h,051h,03dh,0f8h,066h,03eh,0e1h,0e0h,0fbh	; b50f  .v3=.Q=.f>...

; ----------------------------------------------------------------------
; DATOS mensaje_B51C: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (60 bytes)
;   0xb51c..0xb558  (60 bytes)
DATA_mensaje_B51C:
	defb 002h,07bh,084h,0a7h,0adh,0c4h,0cfh,087h,03dh,08ch,088h,0ebh,093h,08dh,0adh,08bh	; b51c  .{......=.......
	defb 0d1h,05dh,0feh,071h,034h,0e6h,094h,08fh,0ebh,08bh,0d0h,0e4h,09eh,0a8h,089h,0c2h	; b52c  .].q4...........
	defb 0c8h,038h,026h,0feh,027h,0e4h,0e4h,0e4h,05ch,02ch,071h,038h,031h,04dh,02ch,04bh	; b53c  .8&.'...\,q81M,K
	defb 026h,0e5h,026h,026h,0feh,0f8h,051h,05dh,071h,034h,05bh,0fbh	; b54c  &.&&..Q]q4[.

; ----------------------------------------------------------------------
; DATOS mensaje_B558: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (21 bytes)
;   0xb558..0xb56d  (21 bytes)
DATA_mensaje_B558:
	defb 002h,076h,094h,0e5h,094h,08fh,0ebh,08bh,0d0h,0feh,0e4h,0e4h,0e4h,09eh,0a8h,089h	; b558  .v..............
	defb 0e4h,0c2h,0c8h,0e0h,0fbh	; b568

; ----------------------------------------------------------------------
; DATOS mensaje_B56D: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (76 bytes)
;   0xb56d..0xb5b9  (76 bytes)
DATA_mensaje_B56D:
	defb 002h,07bh,01dh,018h,00bh,015h,00fh,0e0h,047h,030h,0e5h,029h,043h,028h,053h,02eh	; b56d  .{......G0.)C(S.
	defb 03dh,010h,0feh,019h,022h,03ah,02ah,037h,034h,04bh,0e4h,0e4h,084h,0a9h,03eh,01dh	; b57d  =...":*74K....>.
	defb 019h,016h,013h,0feh,00eh,000h,01dh,018h,00bh,015h,00fh,051h,0f8h,035h,0f8h,00ch	; b58d  ...........Q.5..
	defb 0ebh,03dh,0a5h,082h,09ch,081h,0feh,05dh,038h,08dh,0adh,0bbh,0adh,030h,037h,048h	; b59d  .=.....]8....07H
	defb 04fh,027h,0e0h,0fdh,0e4h,0e4h,0e4h,019h,020h,00fh,01ch,0fbh	; b5ad  O'...... ...

; ----------------------------------------------------------------------
; DATOS mensaje_B5B9: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (70 bytes)
;   0xb5b9..0xb5ff  (70 bytes)
DATA_mensaje_B5B9:
	defb 002h,07bh,00ch,013h,011h,000h,00ch,019h,01dh,01dh,0e4h,0e4h,0e4h,0fdh,082h,081h	; b5b9  .{..............
	defb 0a7h,080h,0a0h,0e4h,0a2h,0ebh,0aeh,0adh,038h,039h,04bh,064h,0bbh,0adh,0feh,08dh	; b5c9  ........89Kd....
	defb 091h,0f8h,048h,0f8h,016h,0f8h,052h,0e6h,02ah,04eh,03dh,08eh,0adh,0b3h,081h,03eh	; b5d9  ..H...R.*N=....>
	defb 0a5h,082h,0feh,0f8h,012h,034h,035h,03dh,0f8h,069h,060h,08bh,0adh,0abh,038h,0f8h	; b5e9  .....45=.i`...8.
	defb 008h,030h,037h,026h,04dh,0fbh	; b5f9

; ----------------------------------------------------------------------
; DATOS mensaje_B5FF: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (31 bytes)
;   0xb5ff..0xb61e  (31 bytes)
DATA_mensaje_B5FF:
	defb 002h,076h,033h,052h,039h,02eh,038h,03eh,026h,026h,0e0h,048h,036h,03dh,08ah,081h	; b5ff  .v3R9.8>&&.H6=..
	defb 08bh,0adh,0feh,03dh,0b4h,0d2h,082h,09dh,082h,053h,030h,04ch,034h,026h,0fbh	; b60f  ...=.....S0L4&.

; ----------------------------------------------------------------------
; DATOS mensaje_B61E: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (408 bytes)
;   0xb61e..0xb7b6  (408 bytes)
DATA_mensaje_B61E:
	defb 002h,07bh,050h,02ah,071h,034h,0e4h,0e4h,05dh,053h,02eh,04eh,03eh,034h,052h,039h	; b61e  .{P*q4..]S.N>4R9
	defb 04dh,027h,0feh,050h,02fh,05dh,05bh,0e5h,026h,026h,02ah,0e6h,004h,0f8h,053h,0f8h	; b62e  M'.P/][.&&*...S.
	defb 03eh,03dh,019h,01fh,01eh,0feh,00fh,01ch,000h,012h,00fh,00bh,020h,00fh,018h,085h	; b63e  >=.......... ...
	defb 0adh,0a6h,087h,060h,02ah,04eh,0feh,03eh,09ah,0adh,0f8h,024h,03dh,0b4h,0d1h,082h	; b64e  ...`*N.>...$=...
	defb 08bh,0d2h,082h,051h,029h,071h,034h,0fdh,0a7h,0d2h,082h,092h,0e5h,0a7h,0d2h,082h	; b65e  ...Q)q4.........
	defb 080h,08bh,0e5h,0f8h,004h,0f8h,067h,0e5h,0f8h,004h,044h,0feh,044h,051h,027h,030h	; b66e  ......g...D.DQ'0
	defb 039h,026h,039h,053h,04bh,047h,0e5h,048h,036h,03eh,02ah,04fh,0feh,027h,059h,037h	; b67e  9&9SKG.H6>*O.'Y7
	defb 0e4h,0e4h,0e4h,0f8h,038h,02bh,037h,026h,034h,0e6h,0fdh,033h,052h,039h,029h,04ch	; b68e  ....8+7&4..3R9)L
	defb 0e5h,0f8h,04ah,053h,050h,03dh,0c1h,082h,087h,0adh,053h,0f8h,05ch,0feh,0f8h,043h	; b69e  ..JSP=....S.\..C
	defb 038h,0f8h,008h,030h,034h,0a3h,091h,03ah,0f8h,067h,051h,036h,02dh,034h,0e6h,048h	; b6ae  8..04..:.gQ6-4.H
	defb 036h,0feh,03dh,0f8h,016h,0f8h,052h,038h,030h,037h,03dh,08ah,081h,098h,082h,053h	; b6be  6.=...R807=....S
	defb 09fh,0a7h,0d2h,087h,0feh,05dh,071h,034h,03dh,05dh,04fh,027h,04ah,0e6h,0fdh,048h	; b6ce  .....]q4=]O'J..H
	defb 036h,04bh,03eh,0c6h,093h,0aah,0beh,0cfh,090h,0e4h,09eh,0cfh,0bch,094h,0ebh,0feh	; b6de  6K>.............
	defb 03dh,01dh,018h,00bh,01eh,00dh,012h,00fh,01ch,088h,081h,085h,087h,051h,0feh,026h	; b6ee  =............Q.&
	defb 033h,053h,032h,0e5h,02ah,04eh,051h,033h,03dh,0b4h,0cfh,088h,0adh,0bdh,081h,0feh	; b6fe  3S2.*NQ3=.......
	defb 08fh,081h,038h,030h,037h,028h,04bh,052h,05dh,0e6h,0fdh,08ah,081h,0bdh,097h,092h	; b70e  ..807(KR].......
	defb 0c9h,0cfh,087h,08ch,0e4h,084h,0ebh,0aeh,0b5h,0a0h,038h,0feh,02ah,026h,027h,0b4h	; b71e  ..........8.*&'.
	defb 0cfh,088h,0adh,04bh,030h,026h,0e6h,036h,043h,04ch,02ah,04eh,0feh,03eh,0f8h,052h	; b72e  ...K0&.6CL*N.>.R
	defb 060h,025h,071h,037h,0f8h,052h,060h,039h,026h,0e6h,030h,052h,059h,04bh,04eh,0feh	; b73e  `%q7.R`9&.0RYKN.
	defb 03ch,06fh,053h,039h,0e4h,0e4h,0fdh,02eh,04eh,053h,0f8h,072h,0f8h,075h,05dh,038h	; b74e  <oS9....NS.r.u]8
	defb 031h,04ch,072h,0e5h,01dh,018h,00bh,015h,00fh,0feh,0e5h,029h,043h,028h,03ah,02ah	; b75e  1Lr........)C(:*
	defb 035h,0f8h,067h,03eh,03ch,028h,05ch,0e0h,048h,036h,03ah,0feh,03eh,061h,052h,039h	; b76e  5.g><(\.H6:.>aR9
	defb 093h,087h,08bh,0d1h,0afh,0b4h,0d1h,091h,047h,0f8h,07dh,0f8h,06fh,030h,0feh,03ch	; b77e  ........G.}.o0.<
	defb 028h,0e6h,0fdh,01dh,018h,00bh,015h,00fh,0e4h,0e4h,0e4h,025h,02bh,04bh,046h,04fh	; b78e  (..........%+KFO
	defb 0e4h,0e4h,0e4h,0feh,02ah,037h,03ch,06fh,05bh,0e5h,048h,036h,03ah,03eh,0e6h,0feh	; b79e  ....*7<o[.H6:>..
	defb 0e4h,0e4h,0e4h,019h,020h,00fh,01ch,0fbh	; b7ae  .... ...

; ----------------------------------------------------------------------
; DATOS mensaje_B7B6: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (18 bytes)
;   0xb7b6..0xb7c8  (18 bytes)
DATA_mensaje_B7B6:
	defb 002h,07ch,0a1h,095h,0d0h,0ebh,000h,0b3h,0c2h,0ebh,093h,000h,094h,08fh,0ebh,08bh	; b7b6  .|..............
	defb 0d0h,0fbh	; b7c6

; ----------------------------------------------------------------------
; DATOS mensaje_B7C8: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (17 bytes)
;   0xb7c8..0xb7d9  (17 bytes)
DATA_mensaje_B7C8:
	defb 002h,07dh,0a1h,095h,0d0h,0ebh,000h,0b3h,0c2h,0c9h,0ebh,093h,000h,09eh,0a8h,09bh	; b7c8  .}..............
	defb 0fbh	; b7d8

; ----------------------------------------------------------------------
; DATOS mensaje_B7D9: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (30 bytes)
;   0xb7d9..0xb7f7  (30 bytes)
DATA_mensaje_B7D9:
	defb 002h,07ch,09eh,0a8h,09bh,0e0h,085h,087h,000h,0c2h,0c9h,000h,08dh,0b4h,0d0h,0ebh	; b7d9  .|..............
	defb 0feh,08bh,0d1h,0ebh,09bh,08ch,093h,000h,0c2h,0cbh,090h,0cbh,0e1h,0fbh	; b7e9  ..............

; ----------------------------------------------------------------------
; DATOS mensaje_B7F7: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (55 bytes)
;   0xb7f7..0xb82e  (55 bytes)
DATA_mensaje_B7F7:
	defb 002h,07dh,08ch,0c3h,08bh,0ebh,0bdh,0e5h,099h,0a6h,08bh,0d2h,082h,000h,0a2h,081h	; b7f7  .}..............
	defb 000h,0feh,08fh,0bdh,0ebh,0a7h,08bh,0c9h,0e5h,094h,08fh,0ebh,08bh,0d0h,000h,080h	; b807  ................
	defb 094h,000h,0feh,08dh,0b2h,0bch,095h,0d0h,000h,080h,08eh,0c0h,0adh,094h,0feh,087h	; b817  ................
	defb 0a6h,08bh,0ebh,0c2h,0c8h,0e1h,0fbh	; b827

; ----------------------------------------------------------------------
; DATOS mensaje_B82E: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (24 bytes)
;   0xb82e..0xb846  (24 bytes)
DATA_mensaje_B82E:
	defb 002h,07ch,08ch,085h,0b4h,0c9h,0ebh,090h,0cbh,0e5h,0c3h,0b4h,0d0h,0a8h,081h,08ch	; b82e  .|..............
	defb 08fh,0e5h,0feh,09eh,0a8h,09bh,0e1h,0fbh	; b83e  ........

; ----------------------------------------------------------------------
; DATOS mensaje_B846: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (42 bytes)
;   0xb846..0xb870  (42 bytes)
DATA_mensaje_B846:
	defb 002h,07dh,08fh,0abh,0ebh,0c2h,0c9h,0a8h,0e5h,087h,0a9h,0bfh,08ch,086h,0d1h,0ebh	; b846  .}..............
	defb 0a8h,0feh,0a0h,089h,0c2h,0c8h,000h,08bh,0d1h,08bh,0d1h,098h,0abh,000h,0feh,08bh	; b856  ................
	defb 0a7h,0bdh,08bh,0d1h,000h,081h,088h,08fh,095h,0fbh	; b866  ..........

; ----------------------------------------------------------------------
; DATOS mensaje_B870: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (19 bytes)
;   0xb870..0xb883  (19 bytes)
DATA_mensaje_B870:
	defb 002h,07ch,0a0h,083h,0cbh,000h,094h,0ebh,0b8h,0feh,094h,0b8h,0b5h,08bh,000h,081h	; b870  .|..............
	defb 080h,090h,0fbh	; b880

; ----------------------------------------------------------------------
; DATOS mensaje_B883: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (22 bytes)
;   0xb883..0xb899  (22 bytes)
DATA_mensaje_B883:
	defb 002h,07dh,0a3h,000h,083h,0a0h,000h,084h,0b8h,0aeh,0b8h,0ebh,0a9h,0adh,0feh,08bh	; b883  .}..............
	defb 080h,08bh,080h,0ebh,0b8h,0fbh	; b893

; ----------------------------------------------------------------------
; DATOS mensaje_B899: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (25 bytes)
;   0xb899..0xb8b2  (25 bytes)
DATA_mensaje_B899:
	defb 002h,0deh,01dh,018h,00bh,015h,00fh,0e0h,033h,02eh,03eh,0f8h,011h,039h,026h,05ch	; b899  ........3.>..9&\
	defb 0e0h,0feh,0b4h,0a6h,081h,0b1h,0adh,05dh,0fbh	; b8a9  .......].

; ----------------------------------------------------------------------
; DATOS mensaje_B8B2: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (8 bytes)
;   0xb8b2..0xb8ba  (8 bytes)
DATA_mensaje_B8B2:
	defb 003h,076h,025h,052h,034h,03eh,0e1h,0fbh	; b8b2  .v%R4>..

; ----------------------------------------------------------------------
; DATOS mensaje_B8BA: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (21 bytes)
;   0xb8ba..0xb8cf  (21 bytes)
DATA_mensaje_B8BA:
	defb 0deh,09bh,0c8h,0adh,03dh,0ebh,0f8h,052h,02fh,0e6h,0feh,0e4h,0e4h,0e4h,027h,043h	; b8ba  ....=..R/.....'C
	defb 02ch,048h,04eh,04ah,0fbh	; b8ca

; ----------------------------------------------------------------------
; DATOS mensaje_B8CF: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (23 bytes)
;   0xb8cf..0xb8e6  (23 bytes)
DATA_mensaje_B8CF:
	defb 0deh,085h,0ebh,0bch,00ah,03eh,0c5h,0a9h,0bbh,08fh,0ebh,053h,047h,071h,037h,026h	; b8cf  .....>.....SGq7&
	defb 0feh,034h,03eh,05ah,05dh,0e0h,0fbh	; b8df

; ----------------------------------------------------------------------
; DATOS mensaje_B8E6: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (30 bytes)
;   0xb8e6..0xb904  (30 bytes)
DATA_mensaje_B8E6:
	defb 002h,076h,085h,0ebh,0bch,009h,059h,072h,039h,026h,03dh,02ah,0e1h,0a3h,091h,03eh	; b8e6  .v....Yr9&=*...>
	defb 085h,0feh,0ebh,0bch,009h,051h,047h,071h,037h,026h,034h,05ch,0e6h,0fbh	; b8f6  .....QGq7&4\..

; ----------------------------------------------------------------------
; DATOS mensaje_B904: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (83 bytes)
;   0xb904..0xb957  (83 bytes)
DATA_mensaje_B904:
	defb 0deh,026h,048h,0e5h,085h,0ebh,0bch,009h,038h,00ah,03dh,0a7h,0d2h,082h,09dh,082h	; b904  .&H.....8.=.....
	defb 0feh,051h,085h,0adh,0a7h,030h,037h,026h,034h,03eh,05ah,05dh,0e6h,0fdh,029h,033h	; b914  .Q...07&4>Z]..)3
	defb 04bh,02ch,029h,038h,030h,034h,03ah,035h,053h,026h,039h,026h,0e6h,0feh,0a3h,091h	; b924  K,)804:5S&9&....
	defb 03dh,026h,034h,083h,0a7h,080h,051h,02fh,053h,030h,037h,044h,04fh,0feh,0e0h,0f8h	; b934  =&4...Q/S07DO...
	defb 018h,036h,02ah,04dh,03eh,05ah,05dh,0e6h,0feh,0e4h,0e4h,0e4h,027h,043h,02ch,048h	; b944  .6*M>Z].....'C,H
	defb 04eh,04ah,0fbh	; b954

; ----------------------------------------------------------------------
; DATOS mensaje_B957: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (82 bytes)
;   0xb957..0xb9a9  (82 bytes)
DATA_mensaje_B957:
	defb 0deh,084h,0a9h,05dh,0e4h,0e4h,0e4h,09bh,0c8h,0adh,03dh,0ebh,0f8h,052h,05dh,0e6h	; b957  ...]......=..R].
	defb 0feh,01dh,018h,00bh,015h,00fh,0e5h,0f8h,013h,051h,036h,02dh,04fh,0e6h,0fdh,033h	; b967  .........Q6-O..3
	defb 03dh,09ch,0a3h,03ah,025h,03dh,0bbh,0adh,08dh,091h,03dh,0b1h,0a7h,0a6h,0feh,0bfh	; b977  =..:%=....=.....
	defb 08fh,081h,0e5h,082h,0c9h,08ch,0c3h,0ebh,0b5h,03dh,0f8h,038h,02bh,03dh,0feh,02eh	; b987  .........=.8+=..
	defb 04ch,0e5h,018h,013h,011h,012h,01eh,000h,01dh,013h,011h,012h,01eh,053h,0feh,026h	; b997  L............S.&
	defb 04dh,0fbh	; b9a7

; ----------------------------------------------------------------------
; DATOS mensaje_B9A9: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (17 bytes)
;   0xb9a9..0xb9ba  (17 bytes)
DATA_mensaje_B9A9:
	defb 003h,076h,018h,013h,011h,012h,01eh,000h,01dh,013h,011h,012h,01eh,0e4h,0e4h,0e4h	; b9a9  .v..............
	defb 0fbh	; b9b9

; ----------------------------------------------------------------------
; DATOS mensaje_B9BA: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (111 bytes)
;   0xb9ba..0xba29  (111 bytes)
DATA_mensaje_B9BA:
	defb 0deh,08ah,081h,08bh,0adh,03dh,085h,0a2h,09bh,0a6h,0ebh,0b4h,0d1h,0e4h,08ch,0ebh	; b9ba  .....=..........
	defb 091h,0feh,051h,02bh,037h,08ch,092h,0a8h,08ch,0e6h,0fdh,029h,043h,02dh,03ah,0f8h	; b9ca  ..Q+7......)C-:.
	defb 03fh,02ch,0b4h,0d1h,082h,08dh,081h,03dh,030h,039h,026h,0b4h,0feh,0d1h,082h,0e5h	; b9da  ?,.....=09&.....
	defb 082h,0cbh,081h,0e4h,08bh,0d2h,0adh,0e4h,08bh,0d2h,082h,0e4h,08bh,0feh,0d0h,0adh	; b9ea  ................
	defb 060h,089h,082h,0b1h,086h,030h,037h,02ch,04dh,0e6h,0fdh,0b8h,0a9h,047h,0a3h,091h	; b9fa  `....07,M....G..
	defb 03dh,08ch,0aeh,08fh,051h,0f8h,018h,034h,02eh,038h,053h,039h,0feh,026h,0e6h,050h	; ba0a  =...Q..4.8S9.&.P
	defb 02ah,04dh,02ah,0e1h,02eh,03dh,0f8h,002h,0f8h,063h,053h,0e4h,0e4h,0e4h,0fbh	; ba1a  *M*..=...cS....

; ----------------------------------------------------------------------
; DATOS mensaje_BA29: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (20 bytes)
;   0xba29..0xba3d  (20 bytes)
DATA_mensaje_BA29:
	defb 076h,08bh,0adh,08dh,091h,039h,09bh,0c8h,0adh,051h,047h,071h,037h,0feh,089h,082h	; ba29  v....9...QGq7...
	defb 083h,081h,05dh,0fbh	; ba39

; ----------------------------------------------------------------------
; DATOS mensaje_BA3D: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (28 bytes)
;   0xba3d..0xba59  (28 bytes)
DATA_mensaje_BA3D:
	defb 0deh,0f8h,006h,03ah,0f8h,047h,0f8h,002h,031h,04dh,052h,05dh,0e6h,01dh,018h,00bh	; ba3d  ...:.G..1MR]....
	defb 015h,00fh,0e0h,0feh,0e4h,0e4h,0e4h,019h,020h,00fh,01ch,0fbh	; ba4d  ........ ...

; ----------------------------------------------------------------------
; DATOS mensaje_BA59: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (9 bytes)
;   0xba59..0xba62  (9 bytes)
DATA_mensaje_BA59:
	defb 003h,07fh,01dh,018h,00bh,015h,00fh,0e0h,0fbh	; ba59  .........

; ----------------------------------------------------------------------
; DATOS mensaje_BA62: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (24 bytes)
;   0xba62..0xba7a  (24 bytes)
DATA_mensaje_BA62:
	defb 07fh,01dh,018h,00bh,015h,00fh,0e0h,0feh,0e4h,0e4h,084h,0a9h,05dh,0e6h,011h,01ch	; ba62  ............]...
	defb 00fh,023h,000h,010h,019h,022h,05dh,0fbh	; ba72  .#..."].

; ----------------------------------------------------------------------
; DATOS mensaje_BA7A: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (8 bytes)
;   0xba7a..0xba82  (8 bytes)
DATA_mensaje_BA7A:
	defb 002h,076h,010h,019h,022h,071h,0e0h,0fbh	; ba7a  .v.."q..

; ----------------------------------------------------------------------
; DATOS mensaje_BA82: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (69 bytes)
;   0xba82..0xbac7  (69 bytes)
DATA_mensaje_BA82:
	defb 07fh,061h,027h,048h,04bh,084h,0a9h,03dh,090h,0d1h,082h,089h,087h,051h,0a0h,0b8h	; ba82  .a'HK..=.....Q..
	defb 03ah,0feh,030h,034h,04bh,030h,026h,039h,0e6h,0feh,029h,0f8h,03eh,038h,03dh,0a4h	; ba92  :.04K0&9..).>8=.
	defb 082h,0b4h,0d2h,082h,047h,02eh,04eh,043h,060h,05dh,0fdh,033h,03dh,0e5h,083h,0a9h	; baa2  ....G.NC`].3=...
	defb 0c0h,0ebh,08fh,0ebh,053h,029h,0f8h,03eh,03dh,085h,0adh,084h,0feh,088h,038h,039h	; bab2  ....S).>=.....89
	defb 04dh,05dh,04fh,027h,0fbh	; bac2

; ----------------------------------------------------------------------
; DATOS mensaje_BAC7: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (8 bytes)
;   0xbac7..0xbacf  (8 bytes)
DATA_mensaje_BAC7:
	defb 002h,076h,039h,03ah,071h,0e0h,0e0h,0fbh	; bac7  .v9:q...

; ----------------------------------------------------------------------
; DATOS mensaje_BACF: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (63 bytes)
;   0xbacf..0xbb0e  (63 bytes)
DATA_mensaje_BACF:
	defb 07fh,02bh,02eh,028h,04dh,05dh,04fh,027h,0e1h,033h,03dh,0f8h,006h,0e4h,0e4h,0e4h	; bacf  .+.(M]O'.3=.....
	defb 0feh,044h,071h,0f8h,02ah,0f8h,03ch,0f8h,06ah,03dh,080h,0adh,08ah,091h,0bfh,08fh	; badf  .Dq.*.<.j=......
	defb 081h,051h,0feh,029h,02ch,04ch,02eh,052h,05dh,0e4h,0e4h,0e4h,0e4h,0fdh,032h,026h	; baef  .Q.),L.R].....2&
	defb 05bh,026h,085h,0adh,0b1h,081h,030h,037h,048h,071h,037h,02ch,0feh,04eh,0fbh	; baff  [&....07Hq7,.N.

; ----------------------------------------------------------------------
; DATOS mensaje_BB0E: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (11 bytes)
;   0xbb0e..0xbb19  (11 bytes)
DATA_mensaje_BB0E:
	defb 002h,076h,092h,0adh,0b4h,0d2h,082h,02ah,0e1h,0e0h,0fbh	; bb0e  .v.....*...

; ----------------------------------------------------------------------
; DATOS mensaje_BB19: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (35 bytes)
;   0xbb19..0xbb3c  (35 bytes)
DATA_mensaje_BB19:
	defb 07fh,01dh,018h,00bh,015h,00fh,0e5h,050h,02ah,04eh,03dh,025h,026h,02fh,036h,0feh	; bb19  .......P*N=%&/6.
	defb 053h,0f8h,019h,028h,037h,027h,04eh,030h,026h,05bh,0feh,0e4h,0e4h,0e4h,019h,020h	; bb29  S..(7'N0&[.....
	defb 00fh,01ch,0fbh	; bb39

; ----------------------------------------------------------------------
; DATOS mensaje_BB3C: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (16 bytes)
;   0xbb3c..0xbb4c  (16 bytes)
DATA_mensaje_BB3C:
	defb 002h,078h,01dh,018h,00bh,015h,00fh,0e0h,0f8h,044h,041h,052h,071h,0e0h,0e0h,0fbh	; bb3c  .x.......DARq...

; ----------------------------------------------------------------------
; DATOS sin identificar  0xbb4c..0xbb5b  (15 bytes)
DATA_BB4C:
	defb 078h,01dh,018h,00bh,015h,00fh,0e0h,0f8h,044h,041h,052h,071h,0e0h,0e0h,0fbh	; bb4c  x.......DARq...

; ----------------------------------------------------------------------
; DATOS mensaje_BB5B: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (12 bytes)
;   0xbb5b..0xbb67  (12 bytes)
DATA_mensaje_BB5B:
	defb 076h,061h,027h,030h,034h,0e0h,09dh,0ebh,0a7h,0ebh,0e1h,0fbh	; bb5b  va'04.......

; ----------------------------------------------------------------------
; DATOS mensaje_BB67: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (326 bytes)
;   0xbb67..0xbcad  (326 bytes)
DATA_mensaje_BB67:
	defb 078h,01dh,018h,00bh,015h,00fh,0e6h,0feh,0c6h,093h,0aah,0beh,0cfh,090h,03dh,02eh	; bb67  x.............=.
	defb 038h,0e4h,0e4h,0e4h,0e4h,0feh,0f8h,013h,03ah,039h,071h,034h,02ah,04bh,086h,0d2h	; bb77  8.......:9q4*K..
	defb 087h,03ah,030h,04bh,065h,037h,047h,0feh,04bh,071h,034h,03dh,0e6h,0fdh,019h,01fh	; bb87  .:0Ke7G.Kq4=....
	defb 01eh,00fh,01ch,000h,012h,00fh,00bh,020h,00fh,018h,02ah,04bh,0f8h,014h,0f8h,030h	; bb97  ....... ..*K...0
	defb 0feh,02fh,04eh,034h,025h,038h,03dh,085h,0a9h,05dh,02dh,061h,0e4h,0e4h,0e4h,0feh	; bba7  ./N4%8=..]-a....
	defb 089h,082h,09bh,087h,060h,03eh,039h,02ah,071h,034h,044h,034h,026h,0e6h,0fdh,0f8h	; bbb7  ....`>9*q4D4&...
	defb 036h,053h,050h,060h,03eh,085h,0a9h,03dh,085h,0b1h,086h,039h,086h,0d2h,087h,0aah	; bbc7  6SP`>..=...9....
	defb 0feh,0adh,03eh,027h,02dh,0f8h,049h,04eh,04bh,04eh,039h,02ah,071h,034h,03dh,04ah	; bbd7  ..>'-.INKN9*q4=J
	defb 0e6h,0fdh,085h,0a9h,03eh,086h,0d2h,082h,086h,03dh,0f8h,00fh,0f8h,01ah,038h,030h	; bbe7  ....>....=....80
	defb 037h,0f8h,00fh,0f8h,00bh,02ah,0feh,04bh,08eh,0aeh,081h,02fh,04eh,0e5h,0f8h,028h	; bbf7  7....*.K.../N..(
	defb 053h,034h,036h,03ah,036h,04eh,0e4h,0e4h,0feh,050h,031h,04eh,04bh,04eh,034h,0e6h	; bc07  S46:6N...P1NKN4.
	defb 0fdh,085h,0a9h,047h,033h,052h,039h,0f8h,00fh,0f8h,00bh,051h,04ah,02ch,029h,047h	; bc17  ...G3R9....QJ,)G
	defb 071h,037h,026h,0feh,039h,02ah,071h,034h,04bh,030h,026h,03dh,0e6h,0feh,0f8h,018h	; bc27  q7&.9*q4K0&=....
	defb 02ah,028h,030h,037h,048h,04fh,027h,038h,029h,047h,071h,034h,03ah,035h,053h,0feh	; bc37  *(07HO'8)Gq4:5S.
	defb 026h,039h,026h,050h,0e6h,0fdh,0e4h,0e4h,0e4h,033h,052h,039h,0f8h,028h,0e5h,0b3h	; bc47  &9&P.....3R9.(..
	defb 0adh,0b4h,0bdh,0ebh,0a6h,0adh,0bch,0feh,02ah,04bh,03dh,095h,0b4h,0d1h,082h,08ch	; bc57  ........*K=.....
	defb 0c3h,081h,03dh,099h,094h,08bh,053h,047h,0feh,035h,02eh,043h,04eh,034h,0e6h,0fdh	; bc67  ..=...SG.5.CN4..
	defb 0f8h,054h,0f8h,023h,03dh,0f8h,076h,0f8h,02fh,051h,0a7h,0a5h,082h,030h,037h,0f8h	; bc77  .T.#=.v./Q...07.
	defb 04ah,0f8h,036h,03dh,08ah,081h,0feh,08bh,0adh,085h,0aeh,087h,051h,0b3h,0adh,0b4h	; bc87  J.6=........Q...
	defb 0bdh,0ebh,0a6h,0adh,0bch,03ah,039h,0feh,053h,031h,038h,026h,027h,0a3h,087h,0f8h	; bc97  .....:9.S18&'...
	defb 067h,051h,0e4h,0e4h,0e4h,0fbh	; bca7

; ----------------------------------------------------------------------
; DATOS mensaje_BCAD: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (21 bytes)
;   0xbcad..0xbcc2  (21 bytes)
DATA_mensaje_BCAD:
	defb 002h,076h,031h,04dh,038h,02eh,052h,061h,03dh,09eh,0a8h,09bh,03dh,081h,0cfh,088h	; bcad  .v1M8.Ra=...=...
	defb 0adh,047h,0feh,0e1h,0fbh	; bcbd

; ----------------------------------------------------------------------
; DATOS mensaje_BCC2: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (66 bytes)
;   0xbcc2..0xbd04  (66 bytes)
DATA_mensaje_BCC2:
	defb 078h,033h,027h,03ch,0e5h,08fh,081h,09fh,0adh,0b0h,053h,04ah,031h,054h,04dh,050h	; bcc2  x3'<......SJ1TMP
	defb 0e6h,0feh,09eh,0a8h,09bh,03dh,08bh,0d2h,082h,08ah,081h,03ah,050h,034h,04dh,093h	; bcd2  .....=.....:P4M.
	defb 0c0h,081h,0feh,08ch,088h,0b4h,0d1h,0ebh,0a8h,051h,0c6h,093h,0aah,0beh,0cfh,090h	; bce2  .........Q......
	defb 053h,039h,053h,0feh,030h,037h,026h,034h,02ah,04bh,03ah,035h,053h,026h,039h,026h	; bcf2  S9S.07&4*K:5S&9&
	defb 050h,0fbh	; bd02

; ----------------------------------------------------------------------
; DATOS mensaje_BD04: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (47 bytes)
;   0xbd04..0xbd33  (47 bytes)
DATA_mensaje_BD04:
	defb 076h,08ah,081h,08bh,0d2h,02ah,04bh,0c6h,093h,0aah,0beh,0cfh,090h,03eh,019h,013h	; bd04  v....*K......>..
	defb 0feh,016h,013h,022h,051h,037h,03ah,0f8h,049h,04eh,04dh,034h,046h,03ah,09eh,0a8h	; bd14  ..."Q7:.INM4F:..
	defb 09bh,0feh,03ah,035h,02ah,05fh,02bh,0e5h,0bch,082h,089h,082h,030h,034h,0fbh	; bd24  ..:5*_+.....04.

; ----------------------------------------------------------------------
; DATOS mensaje_BD33: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (31 bytes)
;   0xbd33..0xbd52  (31 bytes)
DATA_mensaje_BD33:
	defb 002h,076h,02eh,035h,04bh,0e5h,01dh,018h,00bh,015h,00fh,0e6h,0feh,090h,0d0h,0ebh	; bd33  .v.5K...........
	defb 0a7h,0ebh,0e5h,084h,082h,093h,082h,03ch,053h,026h,043h,0feh,031h,0e1h,0fbh	; bd43  .......<S&C.1..

; ----------------------------------------------------------------------
; DATOS mensaje_BD52: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (26 bytes)
;   0xbd52..0xbd6c  (26 bytes)
DATA_mensaje_BD52:
	defb 002h,0dbh,02eh,035h,04bh,0e5h,090h,0d0h,0ebh,0a7h,0ebh,0e6h,0feh,061h,027h,05ch	; bd52  ...5K........a'\
	defb 0e5h,01dh,018h,00bh,015h,00fh,0e4h,0e4h,0e4h,0fbh	; bd62  ..........

; ----------------------------------------------------------------------
; DATOS mensaje_BD6C: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (40 bytes)
;   0xbd6c..0xbd94  (40 bytes)
DATA_mensaje_BD6C:
	defb 002h,076h,085h,0ebh,093h,0a7h,0cfh,0b4h,051h,085h,081h,08bh,0d1h,082h,0e5h,086h	; bd6c  .v......Q.......
	defb 085h,0adh,0feh,031h,04dh,0e6h,0feh,0e4h,0e4h,0e4h,0f8h,014h,0f8h,030h,0f8h,045h	; bd7c  ...1M........0.E
	defb 092h,0adh,041h,026h,033h,055h,0e0h,0fbh	; bd8c  ..A&3U..

; ----------------------------------------------------------------------
; DATOS mensaje_BD94: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (32 bytes)
;   0xbd94..0xbdb4  (32 bytes)
DATA_mensaje_BD94:
	defb 002h,0dbh,0a6h,0b4h,0d0h,0ebh,0e6h,0f8h,014h,0f8h,030h,0f8h,045h,092h,0adh,041h	; bd94  ..........0.E..A
	defb 045h,02ah,027h,0e6h,0feh,0e4h,0e4h,0e4h,086h,0d0h,087h,0b4h,0adh,03eh,0e1h,0fbh	; bda4  E*'..........>..

; ----------------------------------------------------------------------
; DATOS mensaje_BDB4: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (23 bytes)
;   0xbdb4..0xbdcb  (23 bytes)
DATA_mensaje_BDB4:
	defb 002h,076h,0e4h,0e4h,0e4h,03fh,038h,04ch,05dh,0e6h,0feh,0e4h,0e4h,0e4h,0bfh,0aah	; bdb4  .v...?8L].......
	defb 0adh,0bch,03dh,0beh,0b4h,0adh,0fbh	; bdc4

; ----------------------------------------------------------------------
; DATOS mensaje_BDCB: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (20 bytes)
;   0xbdcb..0xbddf  (20 bytes)
DATA_mensaje_BDCB:
	defb 002h,0dbh,034h,03dh,030h,044h,03ah,030h,037h,026h,04dh,0feh,0e4h,0e4h,0e4h,019h	; bdcb  ..4=0D:07&M.....
	defb 020h,00fh,01ch,0fbh	; bddb

; ----------------------------------------------------------------------
; DATOS mensaje_BDDF: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (31 bytes)
;   0xbddf..0xbdfe  (31 bytes)
DATA_mensaje_BDDF:
	defb 002h,076h,039h,03ah,051h,047h,034h,047h,034h,030h,037h,026h,04dh,0e0h,0feh,087h	; bddf  .v9:QG4G407&M...
	defb 0a7h,08ch,09eh,08ch,053h,029h,050h,071h,037h,030h,043h,027h,05ch,071h,0fbh	; bdef  ....S)Pq70C'\q.

; ----------------------------------------------------------------------
; DATOS mensaje_BDFE: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (64 bytes)
;   0xbdfe..0xbe3e  (64 bytes)
DATA_mensaje_BDFE:
	defb 002h,0dbh,02eh,035h,04bh,0e5h,090h,0d0h,0ebh,0a7h,0ebh,0e6h,0feh,0f8h,014h,0f8h	; bdfe  ...5K...........
	defb 030h,0f8h,045h,092h,0adh,043h,060h,002h,001h,086h,0aah,03dh,038h,02eh,04fh,043h	; be0e  0.E..C`....=8.OC
	defb 0feh,060h,02bh,037h,026h,04dh,0e6h,0fdh,047h,027h,031h,02eh,030h,047h,035h,02eh	; be1e  .`+7&M..G'1.0G5.
	defb 034h,028h,037h,02ch,04eh,071h,0e0h,0feh,019h,020h,00fh,01ch,0e4h,0e4h,0e4h,0fbh	; be2e  4(7,Nq... ......

; ----------------------------------------------------------------------
; DATOS mensaje_BE3E: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (12 bytes)
;   0xbe3e..0xbe4a  (12 bytes)
DATA_mensaje_BE3E:
	defb 002h,076h,03eh,048h,02ch,0e5h,034h,03dh,045h,0e0h,0e0h,0fbh	; be3e  .v>H,.4=E...

; ----------------------------------------------------------------------
; DATOS mensaje_BE4A: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (17 bytes)
;   0xbe4a..0xbe5b  (17 bytes)
DATA_mensaje_BE4A:
	defb 003h,076h,090h,089h,087h,05dh,05ch,0e4h,0e4h,0e4h,090h,0d0h,0ebh,0a7h,0ebh,0e0h	; be4a  .v...]\.........
	defb 0ffh	; be5a

; ----------------------------------------------------------------------
; DATOS mensaje_BE5B: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:60B4 (27 bytes)
;   0xbe5b..0xbe76  (27 bytes)
DATA_mensaje_BE5B:
	defb 003h,0dbh,003h,0f8h,052h,03dh,084h,0b4h,0d0h,09eh,051h,030h,035h,072h,025h,050h	; be5b  ....R=....Q05r%P
	defb 04dh,026h,02ah,0feh,038h,029h,047h,071h,037h,03ch,0ffh	; be6b  M&*.8)Gq7<.

; ----------------------------------------------------------------------
; DATOS parejas_800C: 36 parejas [C][B] que p01:6392 compara con BC: el numero
;   de la que case; lo leen p01:6392 (72 bytes)
;   0xbe76..0xbebe  (72 bytes)
DATA_parejas_800C:
	defb 0c2h,097h	; be76
	defb 04ch,085h	; be78
	defb 048h,0a5h	; be7a
	defb 0bah,0b8h	; be7c
	defb 059h,088h	; be7e
	defb 0b3h,0a4h	; be80
	defb 088h,0aah	; be82
	defb 08eh,0a3h	; be84
	defb 0afh,094h	; be86
	defb 0b3h,09dh	; be88
	defb 08ch,09fh	; be8a
	defb 0cfh,0b8h	; be8c
	defb 080h,08bh	; be8e
	defb 0fah,08ah	; be90
	defb 071h,08dh	; be92
	defb 0f4h,09eh	; be94
	defb 0edh,08ch	; be96
	defb 0b4h,096h	; be98
	defb 0cdh,099h	; be9a
	defb 077h,0aah	; be9c
	defb 032h,0ach	; be9e
	defb 0c3h,09fh	; bea0
	defb 094h,093h	; bea2
	defb 0afh,091h	; bea4
	defb 046h,0b3h	; bea6
	defb 0fah,099h	; bea8
	defb 02eh,0afh	; beaa
	defb 021h,0b0h	; beac
	defb 04eh,0b0h	; beae
	defb 024h,0a0h	; beb0
	defb 050h,09dh	; beb2
	defb 058h,09fh	; beb4
	defb 091h,0b0h	; beb6
	defb 057h,0b9h	; beb8
	defb 082h,0bah	; beba
	defb 0cfh,0bah	; bebc

; ----------------------------------------------------------------------
; DATOS sin identificar  0xbebe..0xc000  (322 bytes)
DATA_BEBE:
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
