; ==========================================================================
; METAL GEAR 2 SOLID SNAKE - Konami (1990) - MSX2 - MegaROM RC-767 de 512 KB (Konami SCC) - banco 24 (se ejecuta en 0x6000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x06000


; ----------------------------------------------------------------------
; DATOS zonas_salas: 20 punteros, uno por zona: las salas de la zona, de 37
;   bytes (p00:58C5); lo leen p00:58C8 (40 bytes)
;   0x6000..0x6028  (40 bytes)
DATA_zonas_salas:
	defw 074c1h,08000h,076a2h,08000h,08353h,08309h,08456h,077efh	; 6000
	defw 0a000h,07b1ch,07bd5h,0a250h,0898ah,08ad7h,08bdah,08cb8h	; 6010
	defw 08d71h,07f72h,086cbh,0a3c2h	; 6020  -> 0x8d71 DATA_salas_zona_17 0x86cb 0xa3c2

; ----------------------------------------------------------------------
; DATOS zonas_juegos_bloques: 20 punteros, uno por zona: la tabla de juegos de
;   bloques de la zona (p00:58CE); lo leen p00:58D1 (40 bytes)
;   0x6028..0x6050  (40 bytes)
DATA_zonas_juegos_bloques:
	defw 06052h,0605ah,06062h,06066h,0606ah,06056h,06070h,06078h	; 6028
	defw 0607ch,0607eh,06082h,0608ah,0608ch,0608ch,0608ch,0608ch	; 6038
	defw 0608ch,06078h,06092h,06094h	; 6048  -> DATA_juegos_bloques_608C DATA_juegos_bloques_6078 DATA_juegos_bloques_6092 DATA_juegos_bloques_6094

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6050..0x6052  (2 bytes)
DATA_6050:
	defb 096h,060h	; 6050

; ----------------------------------------------------------------------
; DATOS juegos_bloques_6052: 2 punteros a juegos de bloques (p00:58D5; las
;   salas usan hasta el 1); lo leen p00:58D5 (4 bytes)
;   0x6052..0x6056  (4 bytes)
DATA_juegos_bloques_6052:
	defw 08074h,08eb4h	; 6052

; ----------------------------------------------------------------------
; DATOS juegos_bloques_6056: 2 punteros a juegos de bloques (p00:58D5; las
;   salas usan hasta el 1); lo leen p00:58D5 (4 bytes)
;   0x6056..0x605a  (4 bytes)
DATA_juegos_bloques_6056:
	defw 06f31h,06098h	; 6056  -> DATA_bloques_6F31 DATA_bloques_6098

; ----------------------------------------------------------------------
; DATOS juegos_bloques_605A: 4 punteros a juegos de bloques (p00:58D5; las
;   salas usan hasta el 3); lo leen p00:58D5 (8 bytes)
;   0x605a..0x6062  (8 bytes)
DATA_juegos_bloques_605A:
	defw 09ca9h,0a829h,0b0a9h,06098h	; 605a  -> 0x9ca9 0xa829 0xb0a9 DATA_bloques_6098

; ----------------------------------------------------------------------
; DATOS juegos_bloques_6062: 2 punteros a juegos de bloques (p00:58D5; las
;   salas usan hasta el 1); lo leen p00:58D5 (4 bytes)
;   0x6062..0x6066  (4 bytes)
DATA_juegos_bloques_6062:
	defw 09114h,06098h	; 6062  -> 0x9114 DATA_bloques_6098

; ----------------------------------------------------------------------
; DATOS juegos_bloques_6066: 2 punteros a juegos de bloques (p00:58D5; las
;   salas usan hasta el 1); lo leen p00:58D5 (4 bytes)
;   0x6066..0x606a  (4 bytes)
DATA_juegos_bloques_6066:
	defw 08e05h,06098h	; 6066  -> 0x8e05 DATA_bloques_6098

; ----------------------------------------------------------------------
; DATOS juegos_bloques_606A: 2 punteros a juegos de bloques (p00:58D5; las
;   salas usan hasta el 1); lo leen p00:58D5 (4 bytes)
;   0x606a..0x606e  (4 bytes)
DATA_juegos_bloques_606A:
	defw 089f9h,06098h	; 606a  -> 0x89f9 DATA_bloques_6098

; ----------------------------------------------------------------------
; DATOS sin identificar  0x606e..0x6070  (2 bytes)
DATA_606E:
	defb 009h,099h	; 606e

; ----------------------------------------------------------------------
; DATOS juegos_bloques_6070: 3 punteros a juegos de bloques (p00:58D5; las
;   salas usan hasta el 2); lo leen p00:58D5 (6 bytes)
;   0x6070..0x6076  (6 bytes)
DATA_juegos_bloques_6070:
	defw 09805h,09a05h,06098h	; 6070  -> 0x9805 0x9a05 DATA_bloques_6098

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6076..0x6078  (2 bytes)
DATA_6076:
	defb 055h,0a6h	; 6076

; ----------------------------------------------------------------------
; DATOS juegos_bloques_6078: 2 punteros a juegos de bloques (p00:58D5; las
;   salas usan hasta el 1); lo leen p00:58D5 (4 bytes)
;   0x6078..0x607c  (4 bytes)
DATA_juegos_bloques_6078:
	defw 098e4h,09ee4h	; 6078

; ----------------------------------------------------------------------
; DATOS juegos_bloques_607C: 1 punteros a juegos de bloques (p00:58D5; las
;   salas usan hasta el 0); lo leen p00:58D5 (2 bytes)
;   0x607c..0x607e  (2 bytes)
DATA_juegos_bloques_607C:
	defw 0a4a0h	; 607c

; ----------------------------------------------------------------------
; DATOS juegos_bloques_607E: 2 punteros a juegos de bloques (p00:58D5; las
;   salas usan hasta el 1); lo leen p00:58D5 (4 bytes)
;   0x607e..0x6082  (4 bytes)
DATA_juegos_bloques_607E:
	defw 08074h,08eb4h	; 607e

; ----------------------------------------------------------------------
; DATOS juegos_bloques_6082: 3 punteros a juegos de bloques (p00:58D5; las
;   salas usan hasta el 2); lo leen p00:58D5 (6 bytes)
;   0x6082..0x6088  (6 bytes)
DATA_juegos_bloques_6082:
	defw 0a994h,0b334h,09ee4h	; 6082

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6088..0x608a  (2 bytes)
DATA_6088:
	defb 0c4h,0b9h	; 6088

; ----------------------------------------------------------------------
; DATOS juegos_bloques_608A: 1 punteros a juegos de bloques (p00:58D5; las
;   salas usan hasta el 0); lo leen p00:58D5 (2 bytes)
;   0x608a..0x608c  (2 bytes)
DATA_juegos_bloques_608A:
	defw 0ab80h	; 608a

; ----------------------------------------------------------------------
; DATOS juegos_bloques_608C: 3 punteros a juegos de bloques (p00:58D5; las
;   salas usan hasta el 2); lo leen p00:58D5 (6 bytes)
;   0x608c..0x6092  (6 bytes)
DATA_juegos_bloques_608C:
	defw 0a8f5h,0b0f5h,0b3f5h	; 608c

; ----------------------------------------------------------------------
; DATOS juegos_bloques_6092: 1 punteros a juegos de bloques (p00:58D5; las
;   salas usan hasta el 0); lo leen p00:58D5 (2 bytes)
;   0x6092..0x6094  (2 bytes)
DATA_juegos_bloques_6092:
	defw 0b3b9h	; 6092

; ----------------------------------------------------------------------
; DATOS juegos_bloques_6094: 1 punteros a juegos de bloques (p00:58D5; las
;   salas usan hasta el 0); lo leen p00:58D5 (2 bytes)
;   0x6094..0x6096  (2 bytes)
DATA_juegos_bloques_6094:
	defw 0b330h	; 6094

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6096..0x6098  (2 bytes)
DATA_6096:
	defb 098h,060h	; 6096

; ----------------------------------------------------------------------
; DATOS bloques_6098: 38 bloques de 4 x 4 caracteres (16 bytes cada uno,
;   p00:58EF; las salas usan hasta el 37); se solapan 7 bloques: (bloques_6098
;   6098-6318) (bloques_6098 6098-6338) (bloques_6098 6098-6358) (bloques_6098
;   6098-6368) (bloques_6098 6098-64B8) (salas_0xCA76 64B6-652A); lo leen
;   p00:58F8, p00:56C1 (1170 bytes)
;   0x6098..0x652a  (1170 bytes)
DATA_bloques_6098:
	defb 0c4h,0c5h,0c5h,0c5h,0b0h,090h,090h,090h,0b1h,090h,090h,090h,0b2h,0b9h,0b9h,0b9h	; 6098  ................
	defb 0cah,0c5h,0c5h,0c5h,0b8h,090h,090h,090h,0b8h,090h,090h,090h,0bah,0b9h,0b9h,0b9h	; 60a8  ................
	defb 0b3h,084h,081h,0cbh,0b4h,084h,081h,0cch,0b5h,084h,081h,0cdh,0bbh,084h,081h,0ceh	; 60b8  ................
	defb 0cah,0c5h,0c5h,0c6h,0b8h,090h,090h,0c7h,0b8h,090h,090h,0c8h,0bah,0b9h,0b9h,0c9h	; 60c8  ................
	defb 0beh,084h,084h,084h,0beh,084h,081h,081h,0beh,084h,081h,081h,0beh,084h,081h,081h	; 60d8  ................
	defb 084h,084h,084h,084h,081h,081h,081h,081h,081h,081h,081h,081h,081h,081h,081h,081h	; 60e8  ................
	defb 085h,084h,084h,084h,082h,081h,081h,081h,082h,081h,081h,081h,082h,081h,081h,081h	; 60f8  ................
	defb 084h,084h,084h,094h,081h,081h,081h,094h,081h,081h,081h,094h,081h,081h,081h,094h	; 6108  ................
	defb 0c1h,084h,081h,087h,0c2h,084h,081h,081h,0beh,084h,081h,081h,0a0h,0a1h,0a1h,0a1h	; 6118  ................
	defb 084h,084h,084h,084h,081h,081h,081h,081h,081h,081h,081h,081h,0a1h,0a1h,0a1h,0a1h	; 6128  ................
	defb 085h,084h,084h,084h,082h,081h,081h,081h,082h,081h,081h,081h,0a1h,0a1h,0a1h,0a1h	; 6138  ................
	defb 084h,084h,081h,0cdh,081h,081h,081h,0ceh,081h,081h,081h,094h,0a1h,0a1h,0a1h,0a2h	; 6148  ................
	defb 0b3h,084h,081h,094h,0b4h,084h,081h,094h,0b5h,084h,081h,0cbh,0bbh,084h,081h,0cch	; 6158  ................
	defb 084h,084h,081h,094h,081h,081h,081h,094h,081h,081h,081h,094h,081h,081h,081h,094h	; 6168  ................
	defb 0c3h,081h,081h,091h,0beh,088h,081h,092h,0beh,084h,081h,093h,0beh,084h,081h,0bdh	; 6178  ................
	defb 0beh,084h,081h,087h,0beh,086h,083h,083h,0beh,084h,081h,081h,0beh,084h,081h,081h	; 6188  ................
	defb 0a0h,0a1h,0a1h,0a1h,0a6h,080h,080h,080h,0a6h,080h,080h,080h,0a6h,080h,080h,080h	; 6198  ................
	defb 0a1h,0a1h,0a1h,0a1h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h	; 61a8  ................
	defb 0a1h,0a1h,0a1h,0a2h,080h,080h,080h,0a7h,080h,080h,080h,0a7h,080h,080h,080h,0a7h	; 61b8  ................
	defb 0cah,0abh,0f4h,0f0h,0b8h,0b7h,0f5h,0f1h,0b8h,0b7h,0f5h,0f1h,0bah,0bch,0f6h,0f2h	; 61c8  ................
	defb 0a6h,080h,080h,080h,0a6h,080h,080h,080h,0a6h,080h,080h,080h,0a3h,0a4h,0a4h,0a4h	; 61d8  ................
	defb 080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,0a4h,0a4h,0a4h,0a4h	; 61e8  ................
	defb 080h,080h,080h,0a7h,080h,080h,080h,0a7h,080h,080h,080h,0a7h,0a4h,0a4h,0a4h,0a5h	; 61f8  ................
	defb 0f0h,0f7h,0cah,0c5h,0fah,0f8h,0b8h,090h,0f3h,0f8h,0b8h,090h,0f2h,0f9h,0bah,0b9h	; 6208  ................
	defb 0c5h,0abh,0efh,0eeh,090h,0d9h,0d0h,0d1h,090h,0b7h,0d0h,0d1h,0b9h,0bch,0d3h,0d2h	; 6218  ................
	defb 0efh,0eeh,0cah,0c5h,0d0h,0d1h,0b8h,090h,0d0h,0d1h,0b8h,090h,0d3h,0d2h,0bah,0b9h	; 6228  ................
	defb 0c5h,0abh,0efh,0eeh,090h,0b7h,0d0h,0d1h,090h,0b7h,0d0h,0d1h,0b9h,0bch,0d3h,0d2h	; 6238  ................
	defb 0efh,0eeh,0cah,0c5h,0d0h,0d1h,0dah,090h,0d0h,0d1h,0b8h,090h,0d3h,0d2h,0bah,0b9h	; 6248  ................
	defb 0c5h,0abh,0efh,0eeh,090h,0d9h,0d0h,0d5h,090h,0b7h,0d0h,0d7h,0b9h,0bch,0d3h,0d2h	; 6258  ................
	defb 0efh,0eeh,0cah,0c5h,0d6h,0d1h,0b8h,090h,0d8h,0d1h,0b8h,090h,0d3h,0d2h,0bah,0b9h	; 6268  ................
	defb 0c5h,0abh,0efh,0eeh,090h,0b7h,0d0h,0d5h,090h,0b7h,0d0h,0d7h,0b9h,0bch,0d3h,0d2h	; 6278  ................
	defb 0efh,0eeh,0cah,0c5h,0d6h,0d1h,0dah,090h,0d8h,0d1h,0b8h,090h,0d3h,0d2h,0bah,0b9h	; 6288  ................
	defb 0c2h,084h,081h,094h,0beh,086h,083h,094h,0beh,084h,081h,094h,0beh,084h,081h,094h	; 6298  ................
	defb 0beh,084h,081h,091h,0beh,084h,081h,092h,0bfh,084h,081h,093h,0c0h,084h,081h,0bdh	; 62a8  ................
	defb 0c3h,081h,081h,094h,0beh,088h,081h,0cbh,0beh,084h,081h,0cch,0beh,084h,081h,0cdh	; 62b8  ................
	defb 0beh,084h,081h,0ceh,0beh,086h,083h,094h,0beh,084h,081h,094h,0beh,084h,081h,094h	; 62c8  ................
	defb 0b3h,084h,081h,0cfh,0b4h,084h,081h,094h,0b5h,084h,081h,094h,0bbh,084h,081h,094h	; 62d8  ................
	defb 0beh,084h,081h,0cfh,0bfh,084h,081h,094h,0c0h,084h,081h,094h,0c1h,084h,081h,094h	; 62e8  ................
	defb 0f4h,0f0h,0f0h,0f7h,0f5h,0f1h,0fah,0f8h,0f5h,0f1h,0f3h,0f8h,0f6h,0f2h,0f2h,0f9h	; 62f8  ................
	defb 084h,084h,084h,084h,081h,081h,081h,081h,081h,081h,081h,081h,0a9h,0a8h,0a8h,0aah	; 6308  ................
	defb 085h,084h,084h,084h,082h,081h,081h,081h,082h,081h,081h,081h,0a1h,0a1h,0a9h,0a8h	; 6318  ................
	defb 084h,084h,084h,084h,081h,081h,081h,081h,081h,081h,081h,081h,0a8h,0aah,0a1h,0a1h	; 6328  ................
	defb 084h,084h,081h,094h,081h,081h,081h,094h,081h,081h,081h,094h,0a1h,0a1h,0a1h,0a2h	; 6338  ................
	defb 085h,084h,084h,084h,082h,081h,081h,081h,082h,081h,081h,081h,0a9h,0a8h,0a8h,0aah	; 6348  ................
	defb 007h,008h,008h,009h,004h,005h,005h,006h,083h,083h,083h,083h,081h,081h,081h,081h	; 6358  ................
	defb 032h,081h,081h,094h,032h,081h,081h,094h,01eh,081h,081h,094h,01fh,081h,081h,094h	; 6368  2...2...........
	defb 003h,081h,081h,091h,003h,081h,081h,092h,032h,081h,081h,093h,032h,081h,081h,0bdh	; 6378  ........2...2...
	defb 0b3h,084h,081h,040h,0b4h,084h,081h,040h,0b5h,084h,081h,040h,0bbh,084h,081h,040h	; 6388  ...@...@...@...@
	defb 0beh,084h,081h,040h,0beh,084h,081h,040h,0beh,084h,081h,040h,0beh,084h,081h,040h	; 6398  ...@...@...@...@
	defb 0c3h,081h,081h,002h,0beh,088h,081h,002h,0beh,084h,081h,040h,0beh,084h,081h,040h	; 63a8  ...........@...@
	defb 032h,081h,081h,0cfh,032h,081h,081h,094h,032h,081h,081h,094h,032h,081h,081h,094h	; 63b8  2...2...2...2...
	defb 001h,001h,001h,001h,010h,010h,010h,010h,083h,083h,083h,083h,081h,081h,081h,081h	; 63c8  ................
	defb 009h,001h,001h,001h,010h,010h,010h,010h,083h,083h,083h,083h,081h,081h,081h,081h	; 63d8  ................
	defb 001h,001h,001h,01bh,010h,010h,010h,02dh,083h,083h,083h,01ch,081h,081h,081h,01dh	; 63e8  .......-........
	defb 032h,001h,001h,001h,032h,010h,010h,010h,032h,083h,083h,083h,032h,081h,081h,081h	; 63f8  2...2...2...2...
	defb 003h,002h,002h,002h,002h,002h,002h,002h,083h,083h,083h,083h,081h,081h,081h,081h	; 6408  ................
	defb 032h,081h,081h,087h,032h,081h,081h,081h,043h,047h,047h,049h,02ah,023h,023h,038h	; 6418  2...2...CGGI*##8
	defb 084h,084h,081h,040h,081h,081h,081h,040h,046h,047h,047h,044h,037h,023h,023h,02bh	; 6428  ...@...@FGGD7##+
	defb 084h,084h,084h,084h,081h,081h,081h,081h,047h,047h,047h,049h,023h,023h,023h,038h	; 6438  ........GGGI###8
	defb 084h,084h,084h,084h,081h,081h,081h,081h,046h,047h,047h,048h,037h,023h,023h,022h	; 6448  ........FGGH7##"
	defb 084h,084h,084h,084h,081h,081h,081h,081h,002h,002h,002h,002h,002h,002h,002h,002h	; 6458  ................
	defb 080h,080h,080h,031h,080h,080h,080h,031h,04eh,02eh,03ah,03bh,04fh,024h,025h,027h	; 6468  ...1...1N.:.O$%'
	defb 030h,080h,080h,080h,030h,080h,080h,080h,039h,02eh,03ah,02eh,03ch,024h,025h,024h	; 6478  0...0...9.:.<$%$
	defb 080h,080h,080h,080h,080h,080h,080h,080h,02eh,02eh,02eh,03ah,026h,024h,024h,025h	; 6488  ...........:&$$%
	defb 080h,080h,080h,080h,080h,080h,080h,080h,02eh,02eh,02eh,04ch,026h,024h,024h,04dh	; 6498  ...........L&$$M
	defb 003h,002h,002h,002h,003h,002h,002h,002h,003h,002h,002h,002h,003h,002h,002h,002h	; 64a8  ................
	defb 0a0h,065h,02ah,065h,050h,065h,06ch,065h,096h,067h,0bch,065h,0fdh,065h,0fdh,065h	; 64b8  .e*ePele.g.e.e.e
	defb 0fdh,065h,0fdh,065h,0fdh,065h,019h,066h,035h,066h,05ah,066h,076h,066h,09ch,066h	; 64c8  .e.e.e.f5fZfvf.f
	defb 0bdh,066h,0d9h,066h,0fah,066h,01bh,067h,03ch,067h,03ch,067h,03ch,067h,051h,067h	; 64d8  .f.f.f.g<g<g<gQg
	defb 0b7h,067h,0b7h,067h,0b7h,067h,0b7h,067h,096h,067h,0b7h,067h,0b7h,067h,096h,067h	; 64e8  .g.g.g.g.g.g.g.g
	defb 096h,067h,0b7h,067h,0d8h,067h,0b7h,067h,096h,067h,0f9h,067h,05ah,068h,05ah,068h	; 64f8  .g.g.g.g.g.gZhZh
	defb 07bh,068h,04fh,069h,08fh,069h,08fh,069h,0abh,069h,0f5h,069h,08fh,069h,08fh,069h	; 6508  {hOi.i.i.i.i.i.i
	defb 019h,06ah,0a1h,06ah,0fdh,065h,0fdh,065h,0fdh,065h,0fdh,065h,0fdh,065h,0c7h,06ah	; 6518  .j.j.e.e.e.e.e.j
	defb 011h,06bh	; 6528

; ----------------------------------------------------------------------
; DATOS salas_ca76_652A: salas en rachas a 0xE780 (p00:51E0: n < 0x80 repite
;   el siguiente, n > 0x80 copia n & 0x7F, 0 acaba): 36 bloques por sala, sin
;   juego; lo leen p00:56C8 (38 bytes)
;   0x652a..0x6550  (38 bytes)
DATA_salas_ca76_652A:
	defb 0a4h,000h,001h,002h,003h,010h,011h,004h,005h,006h,007h,014h,015h,008h,009h,00ah	; 652a  ................
	defb 00bh,018h,019h,00ch,00dh,00eh,00fh,01ch,01bh,00ch,009h,00ah,00bh,018h,017h,012h	; 653a  ................
	defb 013h,01dh,016h,016h,01ah,000h	; 654a

; ----------------------------------------------------------------------
; DATOS salas_ca76_6550: salas en rachas a 0xE780 (p00:51E0: n < 0x80 repite
;   el siguiente, n > 0x80 copia n & 0x7F, 0 acaba): 36 bloques por sala, sin
;   juego; lo leen p00:56C8 (28 bytes)
;   0x6550..0x656c  (28 bytes)
DATA_salas_ca76_6550:
	defb 007h,02fh,096h,030h,020h,021h,01fh,02fh,02fh,024h,025h,025h,026h,02fh,02fh,028h	; 6550  ./.0 !.//$%%&//(
	defb 029h,029h,02ah,02fh,02fh,02ch,027h,02bh,02eh,007h,02fh,000h	; 6560  ))*//,'+../.

; ----------------------------------------------------------------------
; DATOS salas_ca76_656C: salas en rachas a 0xE780 (p00:51E0: n < 0x80 repite
;   el siguiente, n > 0x80 copia n & 0x7F, 0 acaba): 36 bloques por sala, sin
;   juego; se solapan 2 bloques: (salas_ca76_65A0 65A0-65BC); lo leen p00:56C8
;   (80 bytes)
;   0x656c..0x65bc  (80 bytes)
DATA_salas_ca76_656C:
	defb 007h,02fh,096h,030h,01eh,01eh,01fh,02fh,02fh,024h,025h,025h,026h,02fh,02fh,028h	; 656c  ./.0...//$%%&//(
	defb 029h,029h,02ah,02fh,02fh,02ch,02dh,02dh,02eh,00eh,02fh,096h,030h,022h,023h,01fh	; 657c  ))*//,--../.0"#.
	defb 02fh,02fh,024h,025h,025h,026h,02fh,02fh,028h,029h,029h,02ah,02fh,02fh,02ch,027h	; 658c  //$%%&//())*//,'
	defb 02bh,02eh,007h,02fh,007h,02fh,096h,030h,01eh,01eh,01fh,02fh,02fh,024h,025h,025h	; 659c  +.././.0...//$%%
	defb 026h,02fh,02fh,028h,029h,029h,02ah,02fh,02fh,02ch,02dh,02dh,02eh,007h,02fh,000h	; 65ac  &//())*//,--../.

; ----------------------------------------------------------------------
; DATOS salas_ca76_65BC: salas en rachas a 0xE780 (p00:51E0: n < 0x80 repite
;   el siguiente, n > 0x80 copia n & 0x7F, 0 acaba): 36 bloques por sala, sin
;   juego; lo leen p00:56C8 (65 bytes)
;   0x65bc..0x65fd  (65 bytes)
DATA_salas_ca76_65BC:
	defb 081h,014h,004h,015h,099h,016h,01ah,000h,001h,001h,003h,01bh,01ah,006h,005h,005h	; 65bc  ................
	defb 007h,01bh,01ah,008h,009h,009h,00bh,01bh,018h,00ch,012h,012h,00fh,017h,006h,019h	; 65cc  ................
	defb 081h,014h,004h,015h,099h,016h,01ah,000h,001h,001h,003h,01bh,01ah,006h,005h,005h	; 65dc  ................
	defb 007h,01bh,01ah,008h,009h,009h,00bh,01bh,018h,00ch,012h,012h,00fh,017h,006h,019h	; 65ec  ................
	defb 000h	; 65fc

; ----------------------------------------------------------------------
; DATOS salas_ca76_65FD: salas en rachas a 0xE780 (p00:51E0: n < 0x80 repite
;   el siguiente, n > 0x80 copia n & 0x7F, 0 acaba): 36 bloques por sala, sin
;   juego; lo leen p00:56C8 (28 bytes)
;   0x65fd..0x6619  (28 bytes)
DATA_salas_ca76_65FD:
	defb 007h,005h,096h,033h,09bh,09bh,09ch,005h,005h,018h,019h,019h,01ah,005h,005h,01eh	; 65fd  ...3............
	defb 072h,072h,023h,005h,005h,055h,07ch,060h,024h,007h,005h,000h	; 660d  rr#..U|`$...

; ----------------------------------------------------------------------
; DATOS salas_ca76_6619: salas en rachas a 0xE780 (p00:51E0: n < 0x80 repite
;   el siguiente, n > 0x80 copia n & 0x7F, 0 acaba): 36 bloques por sala, sin
;   juego; lo leen p00:56C8 (28 bytes)
;   0x6619..0x6635  (28 bytes)
DATA_salas_ca76_6619:
	defb 007h,005h,096h,09dh,09eh,09fh,097h,005h,005h,018h,019h,019h,01ah,005h,005h,01eh	; 6619  ................
	defb 072h,072h,023h,005h,005h,055h,07ch,060h,082h,007h,005h,000h	; 6629  rr#..U|`....

; ----------------------------------------------------------------------
; DATOS salas_ca76_6635: salas en rachas a 0xE780 (p00:51E0: n < 0x80 repite
;   el siguiente, n > 0x80 copia n & 0x7F, 0 acaba): 36 bloques por sala, sin
;   juego; lo leen p00:56C8 (37 bytes)
;   0x6635..0x665a  (37 bytes)
DATA_salas_ca76_6635:
	defb 087h,078h,079h,057h,057h,079h,07bh,018h,004h,019h,099h,01ah,049h,07fh,07eh,072h	; 6635  .xyWWy{.....I.~r
	defb 07fh,048h,01eh,027h,007h,072h,027h,02ch,049h,07fh,07eh,072h,07fh,048h,055h,06fh	; 6645  .H.'.r',I.~r.HUo
	defb 05eh,060h,06fh,003h,000h	; 6655

; ----------------------------------------------------------------------
; DATOS salas_ca76_665A: salas en rachas a 0xE780 (p00:51E0: n < 0x80 repite
;   el siguiente, n > 0x80 copia n & 0x7F, 0 acaba): 36 bloques por sala, sin
;   juego; lo leen p00:56C8 (28 bytes)
;   0x665a..0x6676  (28 bytes)
DATA_salas_ca76_665A:
	defb 007h,005h,096h,033h,09bh,09bh,09ch,005h,005h,018h,019h,019h,01ah,005h,005h,01eh	; 665a  ...3............
	defb 072h,072h,023h,005h,005h,055h,056h,056h,024h,007h,005h,000h	; 666a  rr#..UVV$...

; ----------------------------------------------------------------------
; DATOS salas_ca76_6676: salas en rachas a 0xE780 (p00:51E0: n < 0x80 repite
;   el siguiente, n > 0x80 copia n & 0x7F, 0 acaba): 36 bloques por sala, sin
;   juego; lo leen p00:56C8 (38 bytes)
;   0x6676..0x669c  (38 bytes)
DATA_salas_ca76_6676:
	defb 0a4h,022h,02ah,02ah,023h,022h,023h,014h,015h,015h,016h,014h,016h,018h,019h,019h	; 6676  ."**#"#.........
	defb 01ah,018h,01ah,018h,019h,019h,01ah,018h,01ah,018h,019h,019h,01ah,018h,01ah,01ch	; 6686  ................
	defb 01dh,0edh,01eh,01ch,01eh,000h	; 6696

; ----------------------------------------------------------------------
; DATOS salas_ca76_669C: salas en rachas a 0xE780 (p00:51E0: n < 0x80 repite
;   el siguiente, n > 0x80 copia n & 0x7F, 0 acaba): 36 bloques por sala, sin
;   juego; lo leen p00:56C8 (33 bytes)
;   0x669c..0x66bd  (33 bytes)
DATA_salas_ca76_669C:
	defb 081h,00eh,004h,009h,099h,00fh,006h,020h,028h,028h,021h,004h,006h,0c0h,0c4h,0c4h	; 669c  ....... ((!.....
	defb 0d7h,004h,006h,0c2h,0a0h,0a0h,0dah,004h,006h,0bch,0bdh,0bdh,0ceh,004h,006h,005h	; 66ac  ................
	defb 000h	; 66bc

; ----------------------------------------------------------------------
; DATOS salas_ca76_66BD: salas en rachas a 0xE780 (p00:51E0: n < 0x80 repite
;   el siguiente, n > 0x80 copia n & 0x7F, 0 acaba): 36 bloques por sala, sin
;   juego; lo leen p00:56C8 (28 bytes)
;   0x66bd..0x66d9  (28 bytes)
DATA_salas_ca76_66BD:
	defb 007h,000h,096h,025h,026h,026h,027h,000h,000h,028h,029h,029h,02ah,000h,000h,02bh	; 66bd  ...%&&'..())*..+
	defb 02ch,02ch,02dh,000h,000h,02eh,02fh,02fh,030h,007h,000h,000h	; 66cd  ,,-...//0...

; ----------------------------------------------------------------------
; DATOS salas_ca76_66D9: salas en rachas a 0xE780 (p00:51E0: n < 0x80 repite
;   el siguiente, n > 0x80 copia n & 0x7F, 0 acaba): 36 bloques por sala, sin
;   juego; lo leen p00:56C8 (33 bytes)
;   0x66d9..0x66fa  (33 bytes)
DATA_salas_ca76_66D9:
	defb 081h,00eh,004h,009h,099h,00fh,006h,020h,028h,028h,021h,004h,006h,0c0h,0c4h,0c4h	; 66d9  ....... ((!.....
	defb 0d7h,004h,006h,0c2h,0a0h,0a0h,0dah,004h,006h,0bch,0bdh,0eeh,0ceh,004h,006h,005h	; 66e9  ................
	defb 000h	; 66f9

; ----------------------------------------------------------------------
; DATOS salas_ca76_66FA: salas en rachas a 0xE780 (p00:51E0: n < 0x80 repite
;   el siguiente, n > 0x80 copia n & 0x7F, 0 acaba): 36 bloques por sala, sin
;   juego; lo leen p00:56C8 (33 bytes)
;   0x66fa..0x671b  (33 bytes)
DATA_salas_ca76_66FA:
	defb 081h,00eh,004h,009h,099h,00fh,006h,03eh,0a1h,0a1h,0a4h,004h,006h,0efh,0a2h,0a2h	; 66fa  .......>........
	defb 0a5h,004h,006h,0c2h,0a0h,0a0h,0dah,004h,006h,0bch,0bdh,0eeh,0ceh,004h,006h,005h	; 670a  ................
	defb 000h	; 671a

; ----------------------------------------------------------------------
; DATOS salas_ca76_671B: salas en rachas a 0xE780 (p00:51E0: n < 0x80 repite
;   el siguiente, n > 0x80 copia n & 0x7F, 0 acaba): 36 bloques por sala, sin
;   juego; lo leen p00:56C8 (33 bytes)
;   0x671b..0x673c  (33 bytes)
DATA_salas_ca76_671B:
	defb 081h,00eh,004h,009h,099h,00fh,006h,03eh,0a1h,0a1h,0a4h,004h,006h,0efh,0a2h,0a2h	; 671b  .......>........
	defb 0a5h,004h,006h,0c2h,0a0h,0a0h,0dah,004h,006h,0bch,0bdh,0eeh,0ceh,004h,006h,005h	; 672b  ................
	defb 000h	; 673b

; ----------------------------------------------------------------------
; DATOS salas_ca76_673C: salas en rachas a 0xE780 (p00:51E0: n < 0x80 repite
;   el siguiente, n > 0x80 copia n & 0x7F, 0 acaba): 36 bloques por sala, sin
;   juego; lo leen p00:56C8 (21 bytes)
;   0x673c..0x6751  (21 bytes)
DATA_salas_ca76_673C:
	defb 007h,000h,083h,031h,032h,033h,003h,000h,083h,034h,035h,036h,003h,000h,083h,037h	; 673c  ...123...456...7
	defb 038h,039h,00eh,000h,000h	; 674c

; ----------------------------------------------------------------------
; DATOS salas_ca76_6751: salas en rachas a 0xE780 (p00:51E0: n < 0x80 repite
;   el siguiente, n > 0x80 copia n & 0x7F, 0 acaba): 36 bloques por sala, sin
;   juego; lo leen p00:56C8 (69 bytes)
;   0x6751..0x6796  (69 bytes)
DATA_salas_ca76_6751:
	defb 081h,001h,004h,002h,082h,003h,004h,004h,005h,082h,006h,007h,004h,008h,082h,022h	; 6751  ..............."
	defb 007h,004h,00ch,083h,009h,007h,00ah,003h,00bh,088h,011h,00dh,00eh,00fh,010h,012h	; 6761  ................
	defb 013h,01bh,004h,01ch,089h,01dh,014h,015h,015h,023h,016h,017h,004h,00bh,003h,018h	; 6771  .........#......
	defb 083h,020h,007h,024h,003h,019h,08dh,021h,007h,024h,01ah,01eh,01eh,01fh,00dh,00eh	; 6781  . .$...!.$......
	defb 00fh,010h,012h,013h,000h	; 6791

; ----------------------------------------------------------------------
; DATOS salas_ca76_6796: salas en rachas a 0xE780 (p00:51E0: n < 0x80 repite
;   el siguiente, n > 0x80 copia n & 0x7F, 0 acaba): 36 bloques por sala, sin
;   juego; lo leen p00:56C8 (33 bytes)
;   0x6796..0x67b7  (33 bytes)
DATA_salas_ca76_6796:
	defb 081h,014h,004h,015h,099h,016h,01ah,000h,001h,001h,003h,01bh,01ah,006h,005h,005h	; 6796  ................
	defb 007h,01bh,01ah,008h,009h,009h,00bh,01bh,018h,00ch,012h,012h,00fh,017h,006h,019h	; 67a6  ................
	defb 000h	; 67b6

; ----------------------------------------------------------------------
; DATOS salas_ca76_67B7: salas en rachas a 0xE780 (p00:51E0: n < 0x80 repite
;   el siguiente, n > 0x80 copia n & 0x7F, 0 acaba): 36 bloques por sala, sin
;   juego; lo leen p00:56C8 (33 bytes)
;   0x67b7..0x67d8  (33 bytes)
DATA_salas_ca76_67B7:
	defb 081h,014h,004h,015h,099h,016h,01ah,000h,001h,001h,003h,01bh,01ah,004h,005h,005h	; 67b7  ................
	defb 01ch,01bh,01ah,008h,009h,009h,00bh,01bh,018h,00ch,00dh,00eh,00fh,017h,006h,019h	; 67c7  ................
	defb 000h	; 67d7

; ----------------------------------------------------------------------
; DATOS salas_ca76_67D8: salas en rachas a 0xE780 (p00:51E0: n < 0x80 repite
;   el siguiente, n > 0x80 copia n & 0x7F, 0 acaba): 36 bloques por sala, sin
;   juego; lo leen p00:56C8 (33 bytes)
;   0x67d8..0x67f9  (33 bytes)
DATA_salas_ca76_67D8:
	defb 081h,014h,004h,015h,099h,016h,01ah,000h,010h,011h,003h,01bh,01ah,006h,005h,005h	; 67d8  ................
	defb 007h,01bh,01ah,008h,009h,009h,00bh,01bh,018h,00ch,012h,012h,00fh,017h,006h,019h	; 67e8  ................
	defb 000h	; 67f8

; ----------------------------------------------------------------------
; DATOS salas_ca76_67F9: salas en rachas a 0xE780 (p00:51E0: n < 0x80 repite
;   el siguiente, n > 0x80 copia n & 0x7F, 0 acaba): 36 bloques por sala, sin
;   juego; lo leen p00:56C8 (97 bytes)
;   0x67f9..0x685a  (97 bytes)
DATA_salas_ca76_67F9:
	defb 087h,000h,010h,019h,01ah,001h,002h,004h,004h,005h,082h,006h,008h,004h,009h,082h	; 67f9  ................
	defb 00ah,00ch,004h,00dh,082h,00eh,003h,004h,014h,088h,00bh,007h,018h,011h,012h,018h	; 6809  ................
	defb 00fh,021h,004h,01fh,082h,020h,01ch,004h,01dh,088h,01eh,000h,010h,019h,01ah,01bh	; 6819  .!... ..........
	defb 002h,004h,004h,005h,082h,006h,008h,004h,009h,08eh,00ah,015h,016h,026h,027h,016h	; 6829  .............&'.
	defb 017h,028h,019h,01ah,019h,010h,029h,004h,004h,005h,082h,006h,008h,004h,009h,082h	; 6839  .(....).........
	defb 00ah,00ch,004h,00dh,082h,00eh,003h,004h,014h,082h,00bh,007h,004h,018h,081h,00fh	; 6849  ................
	defb 000h	; 6859

; ----------------------------------------------------------------------
; DATOS salas_ca76_685A: salas en rachas a 0xE780 (p00:51E0: n < 0x80 repite
;   el siguiente, n > 0x80 copia n & 0x7F, 0 acaba): 36 bloques por sala, sin
;   juego; lo leen p00:56C8 (33 bytes)
;   0x685a..0x687b  (33 bytes)
DATA_salas_ca76_685A:
	defb 081h,024h,004h,01dh,099h,025h,020h,028h,01ah,01bh,002h,021h,020h,004h,005h,005h	; 685a  .$...% (...! ...
	defb 006h,021h,020h,008h,009h,009h,00ah,021h,023h,015h,026h,027h,017h,022h,006h,01fh	; 686a  .! ....!#.&'."..
	defb 000h	; 687a

; ----------------------------------------------------------------------
; DATOS salas_ca76_687B: salas en rachas a 0xE780 (p00:51E0: n < 0x80 repite
;   el siguiente, n > 0x80 copia n & 0x7F, 0 acaba): 36 bloques por sala, sin
;   juego; lo leen p00:56C8 (212 bytes)
;   0x687b..0x694f  (212 bytes)
DATA_salas_ca76_687B:
	defb 0a5h,019h,01ah,020h,021h,01bh,019h,019h,01ah,004h,007h,01eh,015h,019h,01ah,008h	; 687b  ... !...........
	defb 026h,002h,003h,019h,01ah,008h,031h,005h,01ch,019h,01ah,008h,009h,009h,00bh,019h	; 688b  &.....1.........
	defb 018h,00ch,00dh,00eh,00fh,000h,004h,001h,082h,003h,006h,004h,005h,082h,01ch,008h	; 689b  ................
	defb 004h,009h,082h,00bh,008h,004h,009h,082h,00bh,008h,004h,009h,082h,00bh,00ch,004h	; 68ab  ................
	defb 012h,08eh,00fh,008h,009h,009h,026h,03ch,01bh,008h,009h,009h,031h,01ch,01eh,008h	; 68bb  ......&<....1...
	defb 003h,009h,083h,026h,022h,008h,003h,009h,083h,031h,005h,008h,003h,009h,09ch,029h	; 68cb  ...&"....1.....)
	defb 035h,00ch,012h,00dh,00eh,00fh,017h,014h,015h,01fh,02eh,01eh,015h,01fh,02ah,024h	; 68db  5.............*$
	defb 02dh,022h,02bh,024h,037h,005h,032h,005h,01ch,005h,033h,003h,009h,083h,00bh,036h	; 68eb  -"+$7.2...3....6
	defb 028h,003h,009h,083h,00bh,018h,00ch,003h,012h,088h,00fh,02ah,025h,023h,025h,02bh	; 68fb  (..........*%#%+
	defb 01bh,006h,003h,005h,08fh,01ch,01eh,034h,038h,03bh,038h,026h,022h,004h,033h,039h	; 690b  .......48.8&".39
	defb 033h,031h,005h,008h,003h,009h,090h,029h,035h,008h,009h,009h,01dh,030h,017h,01ah	; 691b  31.....)5....0..
	defb 02ah,023h,023h,025h,02bh,01fh,006h,003h,005h,083h,007h,024h,027h,003h,009h,083h	; 692b  *##%+......$'...
	defb 00bh,005h,033h,003h,009h,083h,00bh,036h,028h,003h,009h,087h,00bh,018h,00ch,03ah	; 693b  ..3....6(......:
	defb 02ch,013h,00fh,000h	; 694b

; ----------------------------------------------------------------------
; DATOS salas_ca76_694F: salas en rachas a 0xE780 (p00:51E0: n < 0x80 repite
;   el siguiente, n > 0x80 copia n & 0x7F, 0 acaba): 36 bloques por sala, sin
;   juego; lo leen p00:56C8 (64 bytes)
;   0x694f..0x698f  (64 bytes)
DATA_salas_ca76_694F:
	defb 081h,000h,004h,001h,082h,003h,006h,004h,005h,082h,007h,008h,004h,009h,082h,00bh	; 694f  ................
	defb 008h,004h,009h,082h,00bh,008h,004h,009h,08eh,00bh,00ch,012h,00dh,00eh,012h,00fh	; 695f  ................
	defb 000h,001h,001h,03dh,001h,003h,006h,004h,005h,082h,007h,008h,004h,009h,082h,00bh	; 696f  ...=............
	defb 008h,004h,009h,082h,00bh,008h,004h,009h,082h,00bh,00ch,004h,012h,081h,00fh,000h	; 697f  ................

; ----------------------------------------------------------------------
; DATOS salas_ca76_698F: salas en rachas a 0xE780 (p00:51E0: n < 0x80 repite
;   el siguiente, n > 0x80 copia n & 0x7F, 0 acaba): 36 bloques por sala, sin
;   juego; lo leen p00:56C8 (28 bytes)
;   0x698f..0x69ab  (28 bytes)
DATA_salas_ca76_698F:
	defb 007h,054h,096h,008h,03dh,03dh,02ch,054h,054h,004h,00eh,00eh,021h,054h,054h,016h	; 698f  .T..==,TT...!TT.
	defb 00dh,00dh,00ah,054h,054h,018h,00fh,010h,014h,007h,054h,000h	; 699f  ...TT.....T.

; ----------------------------------------------------------------------
; DATOS salas_ca76_69AB: salas en rachas a 0xE780 (p00:51E0: n < 0x80 repite
;   el siguiente, n > 0x80 copia n & 0x7F, 0 acaba): 36 bloques por sala, sin
;   juego; lo leen p00:56C8 (74 bytes)
;   0x69ab..0x69f5  (74 bytes)
DATA_salas_ca76_69AB:
	defb 0c8h,03ah,02fh,016h,00ah,01ch,054h,03ah,02fh,016h,00ah,01ch,054h,03ah,02fh,016h	; 69ab  .:/...T:/...T:/.
	defb 00ah,01ch,054h,03ah,030h,016h,00ah,01bh,03fh,040h,043h,007h,03bh,043h,02ch,039h	; 69bb  ..T:0...?@C..C,9
	defb 038h,035h,036h,038h,037h,031h,02fh,033h,05ah,03dh,02ch,032h,02fh,004h,00eh,00eh	; 69cb  856871/3Z=,2/...
	defb 021h,03ah,02fh,016h,041h,048h,049h,03ah,02fh,016h,00ah,01bh,047h,03ah,02fh,016h	; 69db  !:/.AHI:/...G:/.
	defb 03bh,04ah,01ch,03ah,02fh,016h,045h,059h,046h,000h	; 69eb  .J.:/.EYF.

; ----------------------------------------------------------------------
; DATOS salas_ca76_69F5: salas en rachas a 0xE780 (p00:51E0: n < 0x80 repite
;   el siguiente, n > 0x80 copia n & 0x7F, 0 acaba): 36 bloques por sala, sin
;   juego; lo leen p00:56C8 (36 bytes)
;   0x69f5..0x6a19  (36 bytes)
DATA_salas_ca76_69F5:
	defb 087h,000h,001h,04bh,04ch,02dh,024h,004h,004h,00eh,082h,021h,04fh,003h,04dh,083h	; 69f5  ...KL-$....!O.M.
	defb 050h,00ah,004h,004h,00eh,083h,00ah,016h,053h,003h,04dh,087h,04eh,018h,020h,052h	; 6a05  P.......S.M.N. R
	defb 012h,038h,037h,000h	; 6a15

; ----------------------------------------------------------------------
; DATOS salas_ca76_6A19: salas en rachas a 0xE780 (p00:51E0: n < 0x80 repite
;   el siguiente, n > 0x80 copia n & 0x7F, 0 acaba): 36 bloques por sala, sin
;   juego; lo leen p00:56C8 (136 bytes)
;   0x6a19..0x6aa1  (136 bytes)
DATA_salas_ca76_6A19:
	defb 0abh,019h,000h,00bh,00ch,002h,01ch,019h,004h,00eh,00eh,021h,01ch,019h,016h,009h	; 6a19  ...........!....
	defb 009h,01dh,01bh,01ah,016h,017h,00eh,044h,024h,023h,007h,009h,009h,022h,021h,03ch	; 6a29  .......D$#..."!<
	defb 051h,011h,012h,028h,014h,000h,058h,001h,02dh,057h,02bh,004h,005h,00eh,09eh,055h	; 6a39  Q..(..X.-W+....U
	defb 005h,01fh,00dh,005h,027h,016h,017h,01eh,00dh,017h,025h,055h,005h,01fh,00dh,005h	; 6a49  ....'.....%U....
	defb 056h,018h,020h,028h,013h,020h,006h,02bh,02bh,02dh,02eh,003h,02bh,006h,00eh,081h	; 6a59  V. (. .++-..+...
	defb 008h,004h,029h,082h,02ch,004h,004h,00eh,082h,021h,016h,004h,00dh,08dh,00ah,018h	; 6a69  ..).,....!......
	defb 013h,00fh,010h,013h,014h,02eh,058h,001h,02dh,057h,002h,005h,00eh,099h,021h,02ah	; 6a79  ......X.-W....!*
	defb 005h,01fh,00dh,005h,056h,016h,017h,01eh,00dh,017h,025h,055h,005h,01fh,00dh,005h	; 6a89  ....V.....%U....
	defb 056h,018h,020h,028h,013h,020h,006h,000h	; 6a99  V. (. ..

; ----------------------------------------------------------------------
; DATOS salas_ca76_6AA1: salas en rachas a 0xE780 (p00:51E0: n < 0x80 repite
;   el siguiente, n > 0x80 copia n & 0x7F, 0 acaba): 36 bloques por sala, sin
;   juego; lo leen p00:56C8 (38 bytes)
;   0x6aa1..0x6ac7  (38 bytes)
DATA_salas_ca76_6AA1:
	defb 0a4h,03ch,06ch,039h,039h,05eh,03dh,070h,01eh,01dh,066h,071h,061h,06fh,077h,036h	; 6aa1  .<l99^=p..fqaow6
	defb 067h,072h,074h,06fh,077h,036h,068h,073h,074h,06fh,025h,025h,06dh,025h,078h,06eh	; 6ab1  grtow6hsto%%m%xn
	defb 069h,06ah,06bh,076h,075h,000h	; 6ac1

; ----------------------------------------------------------------------
; DATOS salas_ca76_6AC7: salas en rachas a 0xE780 (p00:51E0: n < 0x80 repite
;   el siguiente, n > 0x80 copia n & 0x7F, 0 acaba): 36 bloques por sala, sin
;   juego; lo leen p00:56C8 (74 bytes)
;   0x6ac7..0x6b11  (74 bytes)
DATA_salas_ca76_6AC7:
	defb 0c8h,008h,047h,08bh,008h,047h,009h,010h,030h,08fh,010h,030h,011h,093h,013h,092h	; 6ac7  ..G..G..0..0....
	defb 093h,013h,092h,008h,073h,009h,008h,073h,009h,010h,030h,011h,010h,030h,011h,018h	; 6ad7  ....s..s..0..0..
	defb 08eh,019h,018h,08eh,019h,008h,047h,009h,08ch,047h,009h,010h,090h,011h,08dh,035h	; 6ae7  ......G..G.....5
	defb 011h,093h,094h,092h,093h,013h,092h,008h,036h,009h,008h,036h,009h,010h,030h,011h	; 6af7  ........6..6..0.
	defb 010h,090h,011h,018h,08eh,019h,018h,091h,019h,000h	; 6b07  ..........

; ----------------------------------------------------------------------
; DATOS salas_ca76_6B11: salas en rachas a 0xE780 (p00:51E0: n < 0x80 repite
;   el siguiente, n > 0x80 copia n & 0x7F, 0 acaba): 36 bloques por sala, sin
;   juego; lo leen p00:56C8 (64 bytes)
;   0x6b11..0x6b51  (64 bytes)
DATA_salas_ca76_6B11:
	defb 007h,06eh,096h,070h,071h,072h,073h,06eh,06eh,074h,075h,076h,077h,06eh,06eh,078h	; 6b11  .n.pqrsnntuvwnnx
	defb 079h,07ah,07bh,06eh,06eh,07ch,07dh,07eh,07fh,008h,06eh,0a3h,080h,082h,082h,081h	; 6b21  yz{nn|}~..n.....
	defb 06eh,06eh,084h,083h,083h,085h,06eh,06eh,086h,08eh,08fh,087h,06eh,06eh,08ah,08fh	; 6b31  nn....nn....nn..
	defb 08eh,08bh,06eh,06eh,086h,08eh,08eh,087h,06eh,06eh,088h,08ch,08dh,089h,06eh,000h	; 6b41  ..nn....nn....n.

; ----------------------------------------------------------------------
; DATOS bloques_6B51: 62 bloques de 4 x 4 caracteres (16 bytes cada uno) de
;   las salas de 0xCA76 de la zona 2 (p00:56D4): cuantos son no sale de
;   recorrerlos, es lo que hay hasta lo siguiente; lo leen p00:58F8 (992
;   bytes)
;   0x6b51..0x6f31  (992 bytes)
DATA_bloques_6B51:
	defb 058h,038h,03dh,038h,059h,03ah,039h,03ah,05ah,03ch,037h,03eh,05bh,040h,03fh,041h	; 6b51  X8=8Y:9:Z<7>[@?A
	defb 03dh,038h,03dh,038h,039h,03ah,039h,03ah,03bh,03ch,037h,03eh,03fh,040h,03fh,041h	; 6b61  =8=89:9:.<7>?@?A
	defb 050h,038h,03dh,038h,051h,03ah,039h,03ah,052h,03ch,03bh,03eh,053h,041h,03fh,041h	; 6b71  P8=8Q:9:R<.>SA?A
	defb 03dh,038h,03dh,030h,039h,03ah,039h,031h,03bh,03ch,03bh,032h,03fh,040h,03fh,033h	; 6b81  =8=09:91.<.2?@?3
	defb 05ch,001h,001h,001h,05ch,001h,002h,002h,05ch,001h,002h,002h,05ch,001h,002h,002h	; 6b91  \...\...\...\...
	defb 001h,001h,001h,001h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h	; 6ba1  ................
	defb 05ch,001h,001h,001h,05ch,001h,009h,00ah,05ch,001h,00bh,00ch,05ch,001h,002h,002h	; 6bb1  \...\...\...\...
	defb 001h,001h,001h,034h,002h,002h,002h,034h,002h,002h,002h,034h,002h,002h,002h,034h	; 6bc1  ...4...4...4...4
	defb 05ch,007h,002h,002h,05ch,008h,002h,002h,05ch,007h,002h,002h,05ch,008h,002h,002h	; 6bd1  \...\...\...\...
	defb 002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h	; 6be1  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 6bf1  ................
	defb 002h,002h,005h,034h,002h,002h,006h,034h,002h,002h,005h,034h,002h,002h,006h,034h	; 6c01  ...4...4...4...4
	defb 05ch,007h,002h,002h,05ch,008h,002h,002h,05ch,007h,002h,002h,066h,066h,066h,066h	; 6c11  \...\...\...ffff
	defb 002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,066h,066h,069h,068h	; 6c21  ............ffih
	defb 002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,068h,06ah,066h,066h	; 6c31  ............hjff
	defb 002h,002h,005h,034h,002h,002h,006h,034h,002h,002h,005h,034h,066h,066h,066h,066h	; 6c41  ...4...4...4ffff
	defb 03dh,038h,074h,070h,039h,03ah,075h,071h,03bh,03ch,075h,07ah,03fh,040h,076h,072h	; 6c51  =8tp9:uq.<uz?@vr
	defb 070h,077h,03dh,038h,073h,078h,039h,03ah,073h,078h,037h,03eh,072h,079h,03fh,041h	; 6c61  pw=8sx9:sx7>ry?A
	defb 002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,066h,066h,066h,066h	; 6c71  ............ffff
	defb 002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,07bh,066h,066h,066h	; 6c81  ............{fff
	defb 080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,060h	; 6c91  ...............`
	defb 080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,061h,061h,061h,061h	; 6ca1  ............aaaa
	defb 080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,062h,080h,080h,080h	; 6cb1  ............b...
	defb 064h,080h,080h,080h,064h,080h,080h,080h,064h,080h,080h,080h,067h,080h,080h,080h	; 6cc1  d...d...d...g...
	defb 080h,080h,080h,063h,080h,080h,080h,063h,080h,080h,080h,063h,080h,080h,080h,065h	; 6cd1  ...c...c...c...e
	defb 080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h	; 6ce1  ................
	defb 080h,080h,080h,063h,080h,080h,080h,063h,080h,080h,080h,063h,080h,080h,080h,063h	; 6cf1  ...c...c...c...c
	defb 064h,080h,080h,080h,064h,080h,080h,080h,064h,080h,080h,080h,064h,080h,080h,080h	; 6d01  d...d...d...d...
	defb 001h,001h,001h,034h,009h,00ah,002h,034h,00bh,00ch,002h,034h,002h,002h,002h,034h	; 6d11  ...4...4...4...4
	defb 002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,02fh	; 6d21  .............../
	defb 064h,080h,080h,080h,064h,080h,080h,080h,064h,080h,080h,080h,05fh,061h,061h,061h	; 6d31  d...d...d..._aaa
	defb 080h,080h,080h,063h,080h,080h,080h,063h,080h,080h,080h,063h,061h,061h,061h,05eh	; 6d41  ...c...c...caaa^
	defb 058h,038h,074h,070h,059h,03ah,075h,071h,05ah,03ch,075h,07ah,05bh,040h,076h,072h	; 6d51  X8tpY:uqZ<uz[@vr
	defb 070h,077h,03dh,030h,073h,078h,039h,031h,073h,078h,03bh,032h,072h,079h,03fh,033h	; 6d61  pw=0sx91sx.2ry?3
	defb 050h,038h,03dh,038h,051h,03ah,039h,03ah,06fh,06dh,06bh,06dh,053h,040h,03fh,041h	; 6d71  P8=8Q:9:omkmS@?A
	defb 03dh,038h,03dh,038h,039h,03ah,039h,03ah,06dh,06ch,06dh,06ch,03fh,040h,03fh,041h	; 6d81  =8=89:9:mlml?@?A
	defb 03dh,038h,03dh,054h,039h,03ah,039h,055h,06dh,06ch,06bh,06eh,03fh,040h,03fh,053h	; 6d91  =8=T9:9Umlkn?@?S
	defb 03dh,038h,03dh,038h,039h,03ah,039h,03ah,06ch,06eh,06fh,06bh,03fh,040h,03fh,041h	; 6da1  =8=89:9:lnok?@?A
	defb 002h,002h,002h,026h,002h,002h,002h,027h,002h,002h,002h,028h,002h,002h,002h,029h	; 6db1  ...&...'...(...)
	defb 02ah,001h,002h,002h,02bh,001h,002h,002h,02ch,001h,002h,002h,02dh,001h,002h,002h	; 6dc1  *...+...,...-...
	defb 02eh,002h,002h,002h,05ch,004h,002h,002h,05ch,001h,002h,002h,05ch,001h,002h,002h	; 6dd1  ....\...\...\...
	defb 002h,002h,002h,02fh,002h,002h,002h,034h,002h,002h,002h,034h,002h,002h,002h,034h	; 6de1  .../...4...4...4
	defb 058h,038h,03dh,038h,059h,03ah,039h,03ah,05ah,06fh,06bh,06ch,05bh,041h,03fh,041h	; 6df1  X8=8Y:9:Zokl[A?A
	defb 03dh,038h,03dh,030h,039h,03ah,039h,031h,06ch,06bh,06eh,032h,03fh,041h,03fh,033h	; 6e01  =8=09:91lkn2?A?3
	defb 002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,02eh,002h,002h,02fh	; 6e11  .............../
	defb 02ah,001h,002h,026h,02bh,001h,002h,027h,02ch,001h,002h,028h,02dh,001h,002h,029h	; 6e21  *..&+..',..(-..)
	defb 05ch,001h,002h,034h,05ch,001h,002h,034h,05ch,001h,002h,034h,05ch,001h,002h,034h	; 6e31  \..4\..4\..4\..4
	defb 03dh,038h,03dh,054h,039h,03ah,039h,055h,03bh,03ch,03bh,052h,03fh,041h,03fh,053h	; 6e41  =8=T9:9U.<.R?A?S
	defb 002h,002h,002h,034h,002h,002h,002h,034h,002h,002h,002h,034h,07bh,066h,066h,066h	; 6e51  ...4...4...4{fff
	defb 002h,002h,002h,003h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h	; 6e61  ................
	defb 001h,001h,002h,003h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h	; 6e71  ................
	defb 001h,001h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h	; 6e81  ................
	defb 05ch,043h,044h,045h,02ah,04ah,04bh,04bh,05ch,04dh,04dh,04eh,02ah,047h,047h,047h	; 6e91  \CDE*JKK\MMN*GGG
	defb 07bh,066h,066h,066h,064h,080h,080h,080h,064h,080h,080h,080h,064h,080h,080h,080h	; 6ea1  {fffd...d...d...
	defb 066h,066h,066h,07ch,080h,080h,080h,063h,080h,080h,080h,063h,080h,080h,080h,063h	; 6eb1  fff|...c...c...c
	defb 02ah,001h,001h,001h,02bh,001h,002h,002h,02ch,001h,002h,002h,02dh,001h,002h,002h	; 6ec1  *...+...,...-...
	defb 046h,002h,002h,002h,04ch,002h,002h,002h,04fh,004h,002h,002h,049h,001h,002h,002h	; 6ed1  F...L...O...I...
	defb 002h,003h,001h,001h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h	; 6ee1  ................
	defb 002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,066h,066h,066h,07ch	; 6ef1  ............fff|
	defb 002h,043h,044h,045h,002h,04ah,04bh,04bh,002h,04dh,04dh,04eh,002h,047h,047h,047h	; 6f01  .CDE.JKK.MMN.GGG
	defb 050h,038h,03dh,030h,051h,03ah,039h,031h,06fh,06ch,06eh,032h,053h,040h,03fh,033h	; 6f11  P8=0Q:91oln2S@?3
	defb 07dh,07eh,07dh,07eh,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h	; 6f21  }~}~............

; ----------------------------------------------------------------------
; DATOS bloques_6F31: 89 bloques de 4 x 4 caracteres (16 bytes cada uno,
;   p00:58EF; las salas usan hasta el 88); lo leen p00:58F8 (1424 bytes)
;   0x6f31..0x74c1  (1424 bytes)
DATA_bloques_6F31:
	defb 049h,080h,080h,080h,049h,080h,080h,080h,049h,080h,080h,080h,061h,040h,040h,040h	; 6f31  I...I...I...a@@@
	defb 080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,040h,040h,040h,040h	; 6f41  ............@@@@
	defb 080h,080h,080h,047h,080h,080h,080h,047h,080h,080h,080h,047h,040h,040h,040h,062h	; 6f51  ...G...G...G@@@b
	defb 05eh,063h,063h,05fh,049h,080h,080h,047h,049h,080h,080h,047h,049h,080h,080h,047h	; 6f61  ^cc_I..GI..GI..G
	defb 05eh,063h,063h,063h,049h,080h,080h,080h,049h,080h,080h,080h,049h,080h,080h,080h	; 6f71  ^cccI...I...I...
	defb 063h,063h,063h,063h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h	; 6f81  cccc............
	defb 063h,063h,063h,05fh,080h,080h,080h,047h,080h,080h,080h,047h,080h,080h,080h,047h	; 6f91  ccc_...G...G...G
	defb 049h,080h,080h,047h,049h,080h,080h,047h,049h,080h,080h,047h,049h,080h,080h,047h	; 6fa1  I..GI..GI..GI..G
	defb 080h,080h,080h,047h,080h,080h,080h,047h,080h,080h,080h,047h,080h,080h,080h,047h	; 6fb1  ...G...G...G...G
	defb 063h,063h,063h,05fh,080h,080h,080h,047h,080h,080h,080h,047h,040h,040h,040h,062h	; 6fc1  ccc_...G...G@@@b
	defb 063h,063h,063h,063h,080h,080h,080h,080h,080h,080h,080h,080h,040h,040h,040h,040h	; 6fd1  cccc........@@@@
	defb 049h,080h,080h,047h,049h,080h,080h,047h,049h,080h,080h,047h,061h,040h,040h,062h	; 6fe1  I..GI..GI..Ga@@b
	defb 05eh,063h,063h,063h,049h,080h,080h,080h,049h,080h,080h,080h,05dh,080h,080h,080h	; 6ff1  ^cccI...I...]...
	defb 063h,063h,063h,05fh,080h,080h,080h,047h,080h,080h,080h,047h,080h,080h,080h,05ch	; 7001  ccc_...G...G...\
	defb 049h,080h,080h,047h,049h,080h,080h,047h,049h,080h,080h,047h,05dh,080h,080h,05ch	; 7011  I..GI..GI..G]..\
	defb 016h,017h,01ah,017h,016h,01dh,016h,017h,016h,017h,016h,01dh,016h,017h,01ah,017h	; 7021  ................
	defb 04ah,01bh,01ch,021h,04bh,01bh,01ah,017h,04ch,01bh,016h,01dh,063h,063h,063h,063h	; 7031  J..!K...L...cccc
	defb 01ch,01bh,016h,04eh,016h,017h,016h,04fh,016h,017h,016h,050h,063h,063h,063h,063h	; 7041  ...N...O...Pcccc
	defb 04ah,01bh,016h,020h,04bh,01bh,01ah,017h,04ch,01bh,016h,01dh,063h,063h,063h,063h	; 7051  J.. K...L...cccc
	defb 04ah,01bh,016h,04eh,04bh,01bh,016h,04fh,04ch,01bh,016h,050h,04dh,021h,016h,051h	; 7061  J..NK..OL..PM!.Q
	defb 04ah,01bh,016h,089h,04bh,01bh,019h,076h,04ch,01bh,019h,076h,04dh,021h,016h,076h	; 7071  J...K..vL..vM!.v
	defb 092h,018h,016h,04eh,041h,022h,016h,04fh,041h,01bh,01ah,050h,041h,021h,016h,051h	; 7081  ...NA".OA..PA!.Q
	defb 04ah,01bh,016h,017h,04bh,021h,01ah,017h,04ch,01bh,016h,018h,04dh,01bh,016h,017h	; 7091  J...K!..L...M...
	defb 016h,017h,016h,04eh,016h,017h,016h,04fh,016h,017h,01ah,050h,016h,01dh,016h,051h	; 70a1  ...N...O...P...Q
	defb 04ah,01bh,016h,077h,04bh,01bh,016h,078h,04ch,01bh,019h,079h,04dh,021h,016h,07ah	; 70b1  J..wK..xL..yM!.z
	defb 04ah,01bh,016h,04eh,04bh,01bh,016h,04fh,04ch,01bh,016h,050h,04dh,021h,01ah,051h	; 70c1  J..NK..OL..PM!.Q
	defb 04ah,01bh,016h,04eh,04bh,01bh,016h,04fh,04ch,01bh,019h,050h,04dh,021h,016h,051h	; 70d1  J..NK..OL..PM!.Q
	defb 04ah,01bh,01ch,021h,04bh,01bh,01ah,017h,04ch,01bh,016h,01dh,04dh,01bh,016h,018h	; 70e1  J..!K...L...M...
	defb 01ch,01bh,01ah,020h,016h,01dh,016h,017h,016h,017h,016h,01dh,016h,017h,01ah,017h	; 70f1  ... ............
	defb 01ch,01bh,01ah,04eh,016h,01dh,016h,04fh,016h,017h,016h,050h,016h,017h,01ah,051h	; 7101  ...N...O...P...Q
	defb 04ah,01bh,016h,020h,04bh,021h,01ah,017h,04ch,01bh,016h,018h,04dh,01bh,016h,017h	; 7111  J.. K!..L...M...
	defb 01ch,01bh,01ah,017h,016h,01dh,016h,017h,016h,017h,016h,01dh,016h,017h,01ah,017h	; 7121  ................
	defb 01ch,01bh,01ch,01bh,016h,01dh,016h,017h,016h,017h,016h,01dh,016h,017h,01ah,017h	; 7131  ................
	defb 01ch,021h,01ch,01bh,016h,018h,016h,017h,019h,017h,016h,01dh,016h,017h,01ah,017h	; 7141  .!..............
	defb 01ch,01bh,016h,089h,016h,017h,016h,076h,016h,01dh,015h,076h,063h,063h,063h,063h	; 7151  .......v...vcccc
	defb 016h,017h,016h,089h,016h,017h,016h,076h,016h,017h,01ah,076h,016h,01dh,016h,076h	; 7161  .......v...v...v
	defb 092h,017h,016h,077h,041h,022h,016h,078h,041h,01bh,019h,079h,041h,021h,016h,07ah	; 7171  ...wA".xA..yA!.z
	defb 04ah,01bh,016h,020h,04bh,01bh,016h,017h,04ch,01bh,016h,017h,04dh,021h,01ah,017h	; 7181  J.. K...L...M!..
	defb 04ah,01bh,016h,089h,04bh,01bh,016h,076h,04ch,01bh,016h,076h,04dh,021h,01ah,076h	; 7191  J...K..vL..vM!.v
	defb 092h,017h,016h,017h,041h,022h,01ah,017h,041h,01bh,016h,01dh,063h,063h,063h,063h	; 71a1  ....A"..A...cccc
	defb 01ch,021h,01ch,04eh,016h,017h,016h,04fh,016h,017h,01ah,050h,016h,01dh,016h,051h	; 71b1  .!.N...O...P...Q
	defb 016h,017h,016h,089h,016h,017h,016h,076h,016h,017h,01ah,076h,092h,01dh,016h,076h	; 71c1  .......v...v...v
	defb 092h,018h,016h,089h,041h,022h,016h,076h,041h,01bh,019h,076h,041h,021h,016h,076h	; 71d1  ....A".vA..vA!.v
	defb 04ah,01bh,01ch,04eh,04bh,01bh,016h,04fh,04ch,01bh,016h,050h,041h,021h,01ah,051h	; 71e1  J..NK..OL..PA!.Q
	defb 01ch,01bh,01ch,01bh,016h,01dh,016h,017h,016h,017h,016h,01dh,063h,063h,063h,063h	; 71f1  ............cccc
	defb 01ch,01bh,016h,017h,016h,01dh,016h,017h,016h,017h,016h,01dh,063h,063h,063h,063h	; 7201  ............cccc
	defb 092h,018h,016h,020h,041h,022h,01ah,017h,041h,01bh,016h,018h,041h,01bh,016h,017h	; 7211  ... A"..A...A...
	defb 01ch,01bh,01ch,04eh,016h,017h,016h,04fh,016h,017h,01ah,050h,092h,01dh,016h,051h	; 7221  ...N...O...P...Q
	defb 05eh,063h,0a0h,09bh,049h,080h,080h,080h,049h,080h,080h,080h,049h,080h,080h,080h	; 7231  ^c..I...I...I...
	defb 09bh,09fh,063h,063h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h	; 7241  ..cc............
	defb 092h,017h,016h,017h,041h,022h,016h,017h,041h,01bh,019h,017h,041h,021h,016h,017h	; 7251  ....A"..A...A!..
	defb 016h,017h,016h,020h,016h,01dh,016h,017h,016h,017h,016h,01dh,063h,063h,063h,063h	; 7261  ... ........cccc
	defb 07dh,084h,085h,06eh,07eh,086h,087h,041h,041h,041h,041h,041h,041h,0c0h,0c1h,088h	; 7271  }..n~..AAAAAA...
	defb 07bh,07ch,06dh,042h,0beh,0bfh,06fh,041h,041h,041h,071h,072h,0c0h,0c1h,073h,074h	; 7281  {|mB..oAAAqr..st
	defb 090h,042h,06dh,06dh,04bh,041h,07eh,06fh,04ch,041h,041h,041h,04dh,088h,0c0h,0c1h	; 7291  .BmmKA~oLAAAM...
	defb 07bh,07ch,06dh,068h,0beh,0bfh,06fh,069h,041h,041h,041h,06ah,0c0h,0c1h,041h,06bh	; 72a1  {|mh..oiAAAj..Ak
	defb 090h,084h,085h,07dh,04bh,086h,087h,041h,04ch,071h,072h,07eh,04dh,073h,074h,088h	; 72b1  ...}K..ALqr~Mst.
	defb 07bh,07ch,07dh,07bh,0beh,0bfh,07eh,0beh,041h,041h,041h,0c2h,0c0h,0c1h,0c4h,0c5h	; 72c1  {|}{..~.AAA.....
	defb 07ch,084h,085h,068h,0bfh,086h,087h,069h,0c3h,041h,041h,06ah,0c6h,0c7h,088h,06bh	; 72d1  |..h...i.AAj...k
	defb 090h,065h,0b5h,0b6h,04bh,066h,0b8h,09dh,04ch,066h,0bah,09ch,04dh,067h,0bch,09eh	; 72e1  .e..Kf..Lf..Mg..
	defb 042h,065h,0b5h,0b6h,041h,066h,0b8h,09dh,041h,066h,0bah,09ch,041h,067h,0bch,09eh	; 72f1  Be..Af..Af..Ag..
	defb 0b6h,0b7h,065h,06dh,09ch,0b9h,066h,06fh,09dh,0bbh,066h,041h,09eh,0bdh,067h,088h	; 7301  ..em..fo..fA..g.
	defb 090h,065h,080h,080h,04bh,066h,080h,080h,04ch,066h,080h,080h,04dh,067h,080h,080h	; 7311  .e..Kf..Lf..Mg..
	defb 080h,080h,065h,06dh,080h,080h,066h,06fh,080h,080h,066h,041h,080h,080h,067h,088h	; 7321  ..em..fo..fA..g.
	defb 080h,080h,080h,046h,080h,080h,080h,047h,080h,080h,080h,047h,080h,080h,080h,047h	; 7331  ...F...G...G...G
	defb 048h,080h,080h,046h,049h,080h,080h,047h,049h,080h,080h,047h,049h,080h,080h,047h	; 7341  H..FI..GI..GI..G
	defb 048h,080h,080h,080h,049h,080h,080h,080h,049h,080h,080h,080h,049h,080h,080h,080h	; 7351  H...I...I...I...
	defb 04ah,01bh,016h,077h,04bh,01bh,016h,078h,04ch,01bh,019h,079h,04dh,021h,016h,07ah	; 7361  J..wK..xL..yM!.z
	defb 04ah,01bh,016h,017h,04bh,021h,01ah,017h,04ch,01bh,016h,018h,04dh,01bh,016h,017h	; 7371  J...K!..L...M...
	defb 090h,084h,085h,068h,04bh,086h,087h,069h,04ch,071h,072h,06ah,04dh,073h,074h,06bh	; 7381  ...hK..iLqrjMstk
	defb 04ah,01bh,01ch,077h,04bh,01bh,016h,078h,04ch,01bh,019h,079h,04dh,021h,016h,07ah	; 7391  J..wK..xL..yM!.z
	defb 04ah,01bh,01ch,01bh,04bh,021h,01ah,017h,04ch,01bh,016h,018h,04dh,01bh,016h,017h	; 73a1  J...K!..L...M...
	defb 05eh,063h,063h,063h,049h,080h,080h,080h,049h,080h,080h,080h,061h,040h,040h,040h	; 73b1  ^cccI...I...a@@@
	defb 092h,017h,016h,020h,041h,022h,01ah,017h,041h,01bh,016h,01dh,063h,063h,063h,063h	; 73c1  ... A"..A...cccc
	defb 01ch,01bh,01ah,077h,016h,01dh,016h,078h,016h,017h,016h,079h,016h,017h,01ah,07ah	; 73d1  ...w...x...y...z
	defb 01ch,01bh,016h,089h,016h,017h,016h,076h,016h,01dh,015h,076h,016h,017h,016h,076h	; 73e1  .......v...v...v
	defb 04ah,01bh,016h,020h,04bh,021h,01ah,017h,04ch,01bh,016h,018h,04dh,01bh,016h,017h	; 73f1  J.. K!..L...M...
	defb 0b6h,0b7h,065h,068h,09ch,0b9h,066h,069h,09dh,0bbh,066h,06ah,09eh,0bdh,067h,06bh	; 7401  ..eh..fi..fj..gk
	defb 04ah,01bh,016h,017h,04bh,01bh,01ah,017h,04ch,01bh,016h,01dh,063h,063h,063h,05fh	; 7411  J...K...L...ccc_
	defb 016h,017h,016h,04eh,016h,017h,016h,04fh,016h,017h,01ah,050h,092h,01dh,016h,051h	; 7421  ...N...O...P...Q
	defb 04ah,01bh,01ch,021h,04bh,021h,01ah,017h,04ch,01bh,016h,018h,04dh,01bh,016h,089h	; 7431  J..!K!..L...M...
	defb 01ch,01bh,016h,017h,016h,01dh,016h,017h,016h,017h,016h,01dh,063h,063h,063h,05fh	; 7441  ............ccc_
	defb 016h,017h,016h,089h,016h,017h,016h,076h,016h,017h,01ah,076h,092h,01dh,016h,076h	; 7451  .......v...v...v
	defb 01ch,01bh,01ch,01bh,016h,01dh,016h,017h,016h,017h,016h,01dh,05eh,063h,063h,063h	; 7461  ............^ccc
	defb 016h,017h,01ah,077h,016h,01dh,016h,078h,016h,017h,016h,079h,016h,017h,01ah,07ah	; 7471  ...w...x...y...z
	defb 01ch,01bh,01ch,077h,016h,01dh,016h,078h,016h,017h,016h,079h,016h,017h,01ah,07ah	; 7481  ...w...x...y...z
	defb 04ah,01bh,01ch,04eh,04bh,01bh,016h,04fh,04ch,01bh,016h,050h,04dh,021h,016h,051h	; 7491  J..NK..OL..PM!.Q
	defb 042h,042h,06dh,042h,041h,041h,06fh,041h,041h,071h,072h,041h,041h,073h,074h,088h	; 74a1  BBmBAAoAAqrAAst.
	defb 01ch,01bh,01ch,01bh,016h,01dh,016h,017h,016h,017h,016h,01dh,063h,063h,063h,05fh	; 74b1  ............ccc_

; ----------------------------------------------------------------------
; DATOS salas_zona_0: 13 salas de 37 bytes: [juego de bloques] y 6 x 6 bloques
;   de 4 x 4 caracteres (p00:58DD), la zona 0; lo leen p00:58DD (481 bytes)
;   0x74c1..0x76a2  (481 bytes)
DATA_salas_zona_0:
	defb 000h,004h,008h,008h,008h,008h,014h,006h,017h,008h,008h,008h,013h,00fh,016h,008h,008h,017h,012h,005h,008h,008h,008h,016h,015h,00ah,002h,00bh,001h,003h,00ch,000h,000h,009h,009h,009h,000h	; 74c1  .....................................
	defb 000h,03dh,042h,025h,02dh,02eh,041h,034h,038h,037h,02fh,030h,04bh,033h,021h,01bh,01bh,022h,023h,032h,008h,01fh,020h,021h,036h,019h,018h,002h,00eh,008h,008h,000h,000h,000h,019h,018h,003h	; 74e6  .=B%-.A487/0K3!.."#2.. !6............
	defb 000h,023h,03dh,042h,042h,03dh,025h,037h,03eh,031h,037h,03eh,031h,025h,029h,02ah,02bh,02ch,023h,037h,03ah,03bh,03bh,03bh,03ch,008h,01ch,01eh,022h,01ch,01dh,010h,01fh,020h,021h,01fh,039h	; 750b  .#=BB=%7>17>1%)*+,#7:...<...".... !.9
	defb 000h,043h,035h,008h,008h,008h,011h,047h,035h,056h,057h,007h,00ch,025h,035h,05ah,05bh,014h,000h,037h,046h,05eh,05bh,012h,000h,01eh,022h,008h,00dh,00ch,000h,044h,045h,003h,00ch,000h,000h	; 7530  .C5....G5VW..%5Z[..7F^[..."....DE....
	defb 000h,03fh,059h,068h,068h,068h,024h,03fh,062h,06ch,06dh,06eh,031h,03fh,073h,024h,03dh,042h,058h,03fh,040h,05ch,03eh,031h,028h,03fh,063h,055h,042h,024h,048h,04eh,066h,064h,052h,053h,060h	; 7555  .?Yhhh$?blmn1?s$=BX?@\>1(?cUB$HNfdRS`
	defb 000h,042h,05fh,008h,029h,061h,042h,037h,072h,008h,09ah,065h,05ch,05fh,03fh,01ch,01eh,087h,055h,072h,03fh,01fh,020h,01ah,054h,03fh,023h,042h,026h,025h,054h,04eh,067h,069h,06ah,069h,064h	; 757a  .B_.)aB7r..e\_?...Ur?. .T?#B&%TNgijid
	defb 000h,024h,024h,024h,058h,058h,015h,037h,037h,075h,028h,049h,011h,059h,042h,024h,025h,054h,014h,062h,076h,076h,037h,08bh,013h,073h,024h,042h,024h,027h,012h,040h,05ch,037h,037h,074h,011h	; 759f  .$$$XX.77u(I.YB$%T.bvv7..s$B$'.@\77t.
	defb 000h,09eh,094h,095h,09eh,0a2h,0a4h,078h,098h,070h,078h,0a6h,0a8h,077h,071h,096h,077h,071h,096h,03fh,05fh,008h,03fh,008h,008h,03fh,072h,008h,03fh,008h,01ch,03fh,04eh,04fh,04eh,04fh,090h	; 75c4  .......x.px..wq.wq.?_.?..?r.?..?NONO.
	defb 000h,0a5h,0aah,04ch,04dh,050h,0a4h,09fh,0a9h,0abh,0a0h,0a1h,0a8h,079h,079h,079h,079h,079h,096h,008h,008h,008h,008h,008h,008h,01dh,01eh,01bh,01ch,01eh,022h,08fh,05dh,079h,07bh,08fh,07ch	; 75e9  ...LMP.......yyyyy............".]y{.|
	defb 000h,0a5h,0a2h,09eh,0a3h,09eh,0a2h,09fh,0a6h,097h,0a7h,097h,099h,088h,093h,092h,07ah,081h,083h,086h,08eh,08dh,07dh,082h,084h,085h,08ah,089h,07eh,080h,07fh,06bh,091h,06bh,08ch,091h,051h	; 760e  ................z.....}.....~..k.k..Q
	defb 001h,019h,019h,00bh,009h,019h,019h,019h,019h,00ah,009h,019h,019h,019h,019h,00ch,009h,016h,00eh,019h,016h,013h,001h,018h,014h,019h,017h,014h,005h,005h,007h,019h,00ah,009h,019h,019h,019h	; 7633  .....................................
	defb 001h,019h,019h,019h,019h,019h,019h,019h,019h,019h,016h,00eh,00dh,00fh,011h,012h,017h,014h,010h,010h,015h,009h,00ch,009h,019h,019h,000h,001h,002h,009h,019h,019h,004h,005h,006h,007h,019h	; 7658  .....................................
	defb 001h,019h,00ah,009h,019h,019h,019h,00fh,002h,003h,019h,019h,019h,010h,015h,009h,019h,019h,019h,019h,000h,001h,011h,012h,019h,019h,004h,005h,015h,009h,019h,019h,019h,019h,00ch,009h,019h	; 767d  .....................................

; ----------------------------------------------------------------------
; DATOS salas_zona_2: 9 salas de 37 bytes: [juego de bloques] y 6 x 6 bloques
;   de 4 x 4 caracteres (p00:58DD), la zona 2; lo leen p00:58DD (333 bytes)
;   0x76a2..0x77ef  (333 bytes)
DATA_salas_zona_2:
	defb 000h,048h,049h,04ah,023h,07ah,07ah,06ch,04dh,033h,023h,07ah,07ah,068h,005h,042h,00eh,024h,024h,06ch,006h,042h,078h,066h,066h,067h,070h,015h,042h,06ah,06bh,06ch,04ch,040h,06bh,041h,011h	; 76a2  .HIJ#zzlM3#zzh.B.$$l.Bxffgp.BjklL@kA.
	defb 000h,012h,020h,010h,012h,020h,010h,01bh,020h,023h,01bh,020h,023h,025h,020h,00eh,025h,020h,00eh,066h,043h,078h,066h,043h,078h,06bh,06bh,06bh,015h,042h,06ah,011h,011h,011h,073h,06bh,041h	; 76c7  .. .. .. #. #% .% .fCxfCxkkk.Bj...skA
	defb 000h,07ah,07ah,01bh,020h,04fh,02ah,07ah,07ah,01bh,046h,04fh,02eh,024h,024h,025h,047h,04fh,02ah,066h,004h,004h,074h,04fh,02eh,06bh,079h,04bh,018h,045h,02dh,011h,011h,011h,044h,04eh,02eh	; 76ec  .zz. O*zz.FO.$$%GO*f..tO.kyK.E-...DN.
	defb 000h,068h,03eh,00eh,00fh,07ah,07ah,06ch,03ch,078h,023h,07ah,07ah,034h,035h,031h,023h,07ah,07ah,034h,035h,032h,00eh,024h,024h,034h,035h,032h,071h,00bh,00bh,038h,039h,032h,010h,011h,011h	; 7711  .h>..zzl<x#zz451#zz452.$$452q..892...
	defb 001h,03dh,041h,03eh,03fh,03fh,040h,036h,037h,034h,033h,033h,035h,032h,010h,011h,011h,012h,031h,02dh,014h,015h,015h,016h,030h,02eh,018h,019h,01ah,01bh,02fh,038h,03ch,03bh,03ah,03ch,039h	; 7736  .=A>??@6743352....1-....0...../8<.:<9
	defb 000h,07ah,07ah,01bh,01dh,036h,037h,024h,024h,025h,01dh,036h,037h,00bh,00bh,055h,01fh,036h,037h,011h,011h,012h,01dh,03ah,03bh,07ah,07ah,01bh,058h,059h,057h,07ah,07ah,01bh,01eh,05ah,02ah	; 775b  .zz..67$$%.67..U.67....:.zz.XYWzz..Z*
	defb 000h,060h,061h,062h,001h,000h,001h,064h,065h,066h,003h,003h,003h,063h,008h,009h,06ah,06bh,06bh,06ch,00ch,00dh,06eh,06fh,06fh,068h,03fh,06ah,076h,00bh,00bh,06ch,03eh,010h,011h,011h,011h	; 7780  .`ab...def...c..jkkl..nooh?jv..l>....
	defb 000h,000h,001h,000h,001h,000h,001h,003h,003h,004h,004h,007h,066h,06bh,015h,02fh,017h,018h,06bh,06fh,014h,022h,010h,011h,011h,055h,077h,072h,021h,07ah,07ah,012h,022h,010h,05eh,07ah,07ah	; 77a5  ............fk./..ko."...Uwr!zz.".^zz
	defb 000h,000h,001h,000h,001h,026h,027h,066h,066h,004h,007h,075h,02bh,06bh,06bh,019h,043h,04fh,029h,011h,011h,012h,01ch,07bh,07ch,07ah,07ah,01bh,01ah,07bh,07ch,07ah,07ah,01bh,01ah,07bh,07ch	; 77ca  .....&'ff..u+kk.CO)....{|zz..{|zz..{|

; ----------------------------------------------------------------------
; DATOS salas_zona_7: 21 salas de 37 bytes: [juego de bloques] y 6 x 6 bloques
;   de 4 x 4 caracteres (p00:58DD), la zona 7; lo leen p00:58DD (777 bytes)
;   0x77ef..0x7af8  (777 bytes)
DATA_salas_zona_7:
	defb 001h,01ah,012h,01bh,000h,00fh,001h,008h,01dh,016h,017h,018h,019h,01eh,01ch,013h,014h,012h,015h,000h,001h,00fh,021h,01fh,020h,006h,007h,00eh,007h,00ah,01ch,002h,0a6h,0a5h,003h,009h,00dh	; 77ef  ......................!. ............
	defb 001h,000h,00bh,001h,00ch,00fh,000h,004h,011h,019h,000h,0a7h,019h,008h,00ch,00fh,001h,001h,00fh,008h,00bh,00fh,000h,00ch,00fh,023h,020h,00fh,001h,000h,00fh,022h,022h,025h,024h,024h,026h	; 7814  .........................# ....""%$$&
	defb 001h,056h,057h,058h,057h,058h,058h,059h,05bh,063h,05dh,060h,062h,05ah,05fh,05eh,05fh,060h,087h,086h,05dh,05fh,085h,087h,062h,086h,05fh,060h,05fh,060h,085h,084h,08eh,08dh,08eh,08ah,08eh	; 7839  .VWXWXXY[c]`bZ_^_`..]_..b._`_`.......
	defb 001h,088h,062h,085h,089h,05dh,062h,085h,060h,05eh,062h,085h,089h,05fh,062h,060h,087h,061h,05fh,089h,085h,060h,089h,05fh,062h,085h,05eh,05dh,060h,060h,085h,08dh,08ah,08eh,08dh,08ah,08eh	; 785e  ..b..]b.`^b.._b`.a_..`._b.^]``.......
	defb 001h,060h,061h,062h,093h,001h,00bh,05dh,05eh,05fh,094h,095h,096h,061h,060h,089h,062h,05fh,092h,087h,085h,05dh,05fh,05eh,092h,062h,05fh,069h,06bh,06bh,08fh,08eh,08dh,06ah,0a2h,0a6h,090h	; 7883  .`ab...]^_...a`.b_...]_^.b_ikk...j...
	defb 001h,000h,008h,00bh,001h,00fh,00fh,004h,02ah,01ch,013h,02fh,00fh,008h,000h,000h,029h,012h,015h,01eh,027h,00ch,02ch,01dh,02bh,00ch,029h,012h,015h,001h,02dh,001h,021h,01dh,02eh,013h,02fh	; 78a8  ........*../....)...'.,.+.)...-.!.../
	defb 001h,01ah,012h,012h,01bh,001h,000h,008h,01dh,01dh,031h,01ch,011h,008h,000h,00ch,008h,000h,001h,008h,001h,00bh,01eh,01ch,019h,02ah,01ch,005h,000h,001h,00fh,00ch,001h,01eh,01ch,013h,018h	; 78cd  ..........1..............*...........
	defb 001h,000h,00bh,032h,000h,00ch,001h,011h,011h,033h,001h,00bh,000h,001h,00ch,034h,036h,007h,007h,00bh,001h,032h,01dh,038h,01dh,001h,00bh,032h,00ch,037h,007h,011h,011h,035h,001h,021h,01dh	; 78f2  ...2.....3.....46....2.8...2.7...5.!.
	defb 001h,056h,058h,058h,058h,058h,057h,08bh,05bh,063h,061h,05eh,05fh,007h,070h,05dh,05eh,05fh,060h,071h,072h,089h,089h,05fh,061h,007h,070h,061h,05eh,060h,05fh,073h,072h,089h,062h,061h,05fh	; 7917  .VXXXXW.[ca^_.p]^_`qr.._a.pa^`_sr.ba_
	defb 001h,06fh,050h,03ch,03dh,03eh,048h,06dh,04ch,03fh,040h,041h,049h,0a4h,04dh,042h,043h,044h,04ah,06dh,067h,045h,066h,046h,047h,0a4h,06eh,04fh,04fh,051h,065h,06ch,068h,064h,01dh,01dh,020h	; 793c  .oP<=>HmL?@AI.MBCDJmgEfFG.nOOQelhd..
	defb 001h,000h,00ch,001h,00fh,00ch,001h,001h,00ch,01ah,015h,00bh,000h,000h,001h,03bh,02bh,00ch,000h,00ch,00bh,00bh,00fh,001h,00ch,000h,001h,00ch,0a7h,019h,000h,001h,039h,000h,00ch,00fh,03ah	; 7961  ................+...............9...:
	defb 000h,000h,001h,001h,002h,001h,003h,000h,002h,001h,002h,002h,003h,000h,002h,002h,001h,001h,003h,000h,002h,001h,002h,002h,003h,000h,001h,002h,001h,001h,003h,008h,004h,001h,005h,006h,020h	; 7986  ....................................
	defb 001h,050h,03ch,03dh,03eh,048h,000h,04ch,03fh,040h,041h,049h,03ah,04dh,042h,043h,044h,04ah,00fh,04bh,046h,045h,045h,047h,00fh,04eh,051h,04fh,04fh,052h,054h,09ch,053h,053h,010h,055h,000h	; 79ab  .P<=>H.L?@AI:MBCDJ.KFEEG.NQOORT.SS.U.
	defb 000h,000h,001h,001h,001h,001h,003h,000h,034h,034h,034h,034h,033h,028h,02ch,01fh,01fh,030h,023h,02eh,024h,034h,034h,031h,027h,02dh,01ch,01dh,01fh,032h,02bh,000h,001h,001h,001h,001h,003h	; 79d0  ........44443(,..0#.$441'-...2+......
	defb 000h,000h,002h,019h,019h,036h,037h,025h,026h,01dh,01fh,01eh,038h,029h,02ah,011h,012h,013h,035h,021h,022h,015h,016h,017h,039h,02eh,02fh,019h,01ah,01bh,03ah,02dh,01ch,01dh,01eh,01fh,038h	; 79f5  .....67%&...8)*...5!"...9./...:-....8
	defb 000h,000h,002h,001h,001h,002h,003h,03bh,014h,011h,057h,059h,05fh,03dh,018h,015h,058h,05bh,05eh,03ch,010h,019h,03eh,05ch,05dh,02eh,02fh,040h,041h,044h,042h,02dh,01ch,015h,015h,045h,043h	; 7a1a  ..........WY_=..X[^<..>\]./@ADB-...EC
	defb 000h,000h,001h,002h,002h,001h,001h,000h,001h,001h,002h,002h,002h,000h,001h,046h,001h,001h,002h,000h,002h,03fh,001h,046h,001h,000h,001h,001h,001h,03fh,002h,000h,001h,002h,001h,002h,047h	; 7a3f  ...............F.....?.F.....?......G
	defb 000h,001h,002h,001h,002h,001h,003h,001h,001h,002h,001h,001h,003h,001h,002h,001h,001h,002h,003h,001h,001h,001h,001h,002h,003h,001h,001h,001h,002h,001h,003h,00eh,00eh,00eh,00eh,00eh,00fh	; 7a64  .....................................
	defb 000h,000h,04ch,051h,051h,04fh,00ch,000h,050h,051h,051h,052h,007h,000h,04ch,053h,054h,04fh,001h,000h,055h,056h,056h,049h,002h,000h,001h,001h,001h,001h,001h,000h,001h,001h,001h,001h,002h	; 7a89  ..LQQO..PQQR..LSTO..UVVI.............
	defb 000h,006h,006h,006h,006h,006h,00ah,00dh,00dh,00dh,00dh,00dh,00bh,002h,046h,002h,001h,002h,003h,001h,03fh,002h,001h,046h,003h,002h,001h,002h,001h,03fh,003h,001h,001h,002h,001h,002h,003h	; 7aae  ..............F.....?..F.....?.......
	defb 000h,000h,001h,001h,001h,001h,003h,000h,001h,001h,001h,001h,003h,000h,001h,001h,001h,001h,003h,000h,001h,001h,001h,001h,003h,000h,048h,04ah,04ah,04bh,003h,000h,04ch,04dh,04eh,04fh,003h	; 7ad3  ..........................HJJK..LMNO.

; ----------------------------------------------------------------------
; DATOS sin identificar  0x7af8..0x7b1c  (36 bytes)
DATA_7AF8:
	defb 000h,001h,000h,00ch,00fh,00ch,00bh,03ah,00ch,01ah,015h,000h,000h,00fh,039h,03bh	; 7af8  .......:......9.
	defb 020h,000h,001h,00fh,01eh,01ch,019h,03ah,011h,02fh,01ah,012h,015h,0a7h,000h,000h	; 7b08   ......:./......
	defb 03bh,01dh,02bh,00bh	; 7b18

; ----------------------------------------------------------------------
; DATOS salas_zona_9: 5 salas de 37 bytes: [juego de bloques] y 6 x 6 bloques
;   de 4 x 4 caracteres (p00:58DD), la zona 9; lo leen p00:58DD (185 bytes)
;   0x7b1c..0x7bd5  (185 bytes)
DATA_salas_zona_9:
	defb 000h,0bdh,0bch,0bdh,0bch,0e1h,0bch,0ach,0c4h,0c5h,0c0h,0e0h,0c0h,0b0h,0c8h,0c9h,0c8h,0b1h,0dch,0b4h,0d4h,0d4h,0b2h,0b5h,0e2h,0b4h,0d8h,0d6h,0b6h,0aeh,03eh,0b8h,0b9h,0b9h,0bah,0b9h,0bah	; 7b1c  ..............................>......
	defb 000h,0bdh,0cch,0cdh,0ceh,0cfh,0bch,0c1h,0d0h,0d1h,0d2h,0d3h,0c0h,0c9h,0c8h,0d6h,0d6h,0c9h,0c8h,0e2h,0d4h,0b2h,0adh,0d4h,0d4h,03eh,0e3h,0b6h,0adh,0d8h,0d6h,0d9h,0adh,0adh,0adh,0adh,0dah	; 7b41  .........................>...........
	defb 000h,0bdh,0bch,0bdh,0bch,0bdh,0bch,0c1h,0c0h,0c1h,0beh,0bfh,0ddh,0c9h,0c8h,0c9h,0c2h,0c3h,0deh,0d4h,0b2h,0b3h,0c6h,0c7h,0d7h,0d6h,0b6h,0b7h,0cah,0cbh,0d7h,0b9h,0bah,0bbh,0afh,0dfh,0dbh	; 7b66  .....................................
	defb 001h,019h,019h,019h,019h,019h,019h,019h,019h,019h,016h,00dh,00fh,019h,01bh,01eh,018h,014h,010h,019h,021h,01dh,005h,007h,019h,019h,020h,01fh,025h,024h,00eh,019h,01ch,01ah,022h,023h,010h	; 7b8b  ....................!..... .%$...."#.
	defb 001h,019h,019h,019h,019h,019h,019h,00eh,00dh,00eh,00fh,011h,012h,010h,010h,010h,010h,015h,009h,019h,019h,019h,019h,008h,009h,00fh,00eh,00dh,00eh,002h,009h,010h,010h,010h,010h,006h,007h	; 7bb0  .....................................

; ----------------------------------------------------------------------
; DATOS salas_zona_10: 25 salas de 37 bytes: [juego de bloques] y 6 x 6
;   bloques de 4 x 4 caracteres (p00:58DD), la zona 10; lo leen p00:58DD (925
;   bytes)
;   0x7bd5..0x7f72  (925 bytes)
DATA_salas_zona_10:
	defb 000h,009h,00ah,00fh,00fh,00fh,000h,00dh,00eh,00fh,002h,003h,004h,008h,010h,003h,000h,015h,00fh,008h,090h,015h,004h,005h,00fh,008h,018h,019h,000h,000h,003h,001h,00ch,00bh,006h,011h,007h	; 7bd5  .....................................
	defb 000h,056h,03ch,03ch,03ch,03ch,024h,017h,014h,014h,014h,014h,008h,017h,020h,012h,012h,012h,008h,017h,021h,00fh,00fh,00fh,008h,01ah,026h,01ch,027h,028h,01fh,01eh,01dh,01dh,01dh,01dh,01bh	; 7bfa  .V<<<<$....... .....!.....&.'(.......
	defb 000h,022h,022h,022h,023h,043h,022h,00fh,000h,000h,003h,00fh,00fh,00fh,004h,016h,005h,00fh,000h,00fh,00fh,002h,003h,00fh,004h,00fh,000h,000h,015h,000h,003h,00ch,006h,011h,007h,006h,007h	; 7c1f  ."""#C"..............................
	defb 000h,022h,023h,043h,022h,022h,077h,00fh,069h,066h,067h,06ch,035h,000h,070h,06ah,06bh,072h,03bh,004h,071h,06eh,06fh,06dh,04ch,00fh,075h,016h,016h,040h,04ch,00ch,00ch,00ch,00ch,00ch,076h	; 7c44  ."#C""w.ifgl5.pjkr..qnomL.u..@L.....v
	defb 000h,04dh,00fh,00fh,00fh,00fh,035h,053h,037h,052h,029h,02ah,034h,092h,036h,036h,02dh,02eh,092h,092h,092h,092h,02dh,044h,092h,073h,023h,043h,02ch,02bh,048h,074h,00ah,00fh,00fh,00fh,002h	; 7c69  .M....5S7R)*4.66-.....-D.s#C,+Ht.....
	defb 000h,027h,028h,026h,01ch,027h,028h,062h,03ch,05fh,038h,038h,038h,063h,014h,015h,093h,064h,00fh,061h,065h,019h,045h,068h,03ah,060h,00fh,00fh,049h,015h,035h,053h,032h,052h,032h,052h,034h	; 7c8e  .'(&.'(b<_888c...d.ae.Eh:`..I.5S2R2R4
	defb 000h,028h,028h,028h,028h,028h,028h,038h,038h,000h,000h,05fh,038h,00fh,00fh,004h,016h,005h,03ah,033h,032h,033h,052h,037h,034h,092h,092h,092h,092h,036h,092h,092h,092h,092h,092h,092h,092h	; 7cb3  .((((((88.._8.....:323R74....6.......
	defb 000h,028h,028h,028h,028h,028h,028h,038h,038h,038h,038h,038h,038h,039h,00fh,00fh,03eh,03fh,03ah,03dh,03eh,03fh,02fh,00eh,035h,04dh,02fh,00eh,00fh,00fh,04ch,03dh,00fh,00fh,00fh,00fh,03bh	; 7cd8  .((((((8888889..>?:=>?/.5M/...L=.....
	defb 000h,028h,028h,028h,028h,028h,028h,038h,046h,047h,050h,047h,038h,039h,04ah,04bh,054h,04bh,03ah,03dh,04eh,04fh,04eh,04fh,04ch,031h,032h,033h,052h,037h,034h,092h,092h,092h,092h,036h,092h	; 7cfd  .((((((8FGPG89JKTK:=NONOL123R74....6.
	defb 000h,028h,028h,028h,028h,028h,028h,038h,038h,038h,038h,042h,095h,039h,00fh,00fh,00fh,041h,094h,03dh,00fh,00fh,00fh,045h,099h,04dh,00fh,00fh,00fh,049h,015h,053h,032h,052h,032h,032h,032h	; 7d22  .((((((8888B.9...A.=...E.M...I.S2R222
	defb 000h,028h,026h,00fh,058h,057h,05bh,096h,038h,05dh,059h,05ah,05ch,098h,00fh,00fh,010h,003h,05eh,097h,00fh,00fh,090h,015h,05eh,00fh,00fh,00fh,018h,019h,01ah,032h,052h,033h,052h,032h,033h	; 7d47  .(&.XW[.8]YZ\.....^.....^......2R3R23
	defb 000h,07ch,07eh,07fh,07dh,07dh,002h,07ch,07eh,07fh,07eh,07fh,081h,07ch,084h,083h,07dh,07eh,07dh,07ch,002h,083h,07eh,07fh,07eh,07ch,081h,082h,07fh,07dh,088h,085h,086h,08dh,08eh,08fh,087h	; 7d6c  .|~.}}.|~.~..|..}~}|..~.~|...}.......
	defb 000h,002h,083h,07dh,07fh,07dh,08ah,081h,082h,07fh,084h,083h,08ah,07eh,07eh,07dh,081h,082h,08ah,07dh,07eh,084h,083h,07dh,08ah,088h,07fh,081h,082h,07eh,08ah,087h,08ch,086h,086h,086h,089h	; 7d91  ...}.}.......~~}...}~..}.....~.......
	defb 001h,022h,012h,019h,003h,008h,009h,022h,013h,019h,00dh,00eh,00eh,022h,019h,019h,010h,023h,023h,061h,051h,050h,050h,052h,031h,04bh,04dh,032h,009h,04eh,01ah,062h,068h,067h,067h,066h,060h	; 7db6  ."....."....."...##aQPPR1KM2.N.bhggf`
	defb 001h,00ah,00bh,01dh,012h,003h,042h,017h,015h,01dh,013h,014h,016h,021h,020h,035h,019h,01eh,01fh,031h,044h,046h,019h,045h,031h,01ah,01ah,047h,019h,048h,01ah,060h,063h,019h,064h,05fh,05fh	; 7ddb  ......B......! 5...1DF.E1..G.H.`c.d__
	defb 001h,032h,009h,00bh,01dh,022h,05ch,00eh,00eh,00fh,01dh,022h,05ch,023h,023h,018h,035h,022h,05ch,031h,036h,031h,036h,049h,05ch,01ah,01ah,01ah,01ah,053h,05ch,060h,05fh,05fh,060h,05fh,05eh	; 7e00  .2..."\...."\##.5"\1616I\....S\`__`_^
	defb 000h,080h,078h,079h,07ah,07bh,078h,07ch,088h,088h,07dh,07dh,07eh,07ch,002h,002h,083h,07eh,07fh,07ch,081h,081h,082h,07fh,07dh,07ch,07dh,07eh,07dh,07fh,07eh,07ch,07dh,07fh,07eh,07dh,084h	; 7e25  ..xyz{x|..}}~|...~.|....}|}~}.~|}.~}.
	defb 000h,078h,078h,078h,078h,078h,08bh,07fh,07eh,07fh,088h,088h,08ah,07eh,07dh,07fh,002h,002h,025h,07fh,07eh,07dh,081h,002h,025h,07dh,07fh,084h,083h,081h,08ah,084h,083h,081h,082h,07dh,08ah	; 7e4a  .xxxxx..~....~}...%.~}..%}.........}.
	defb 001h,022h,019h,003h,008h,009h,00ah,022h,019h,00dh,02dh,00eh,00eh,022h,019h,010h,03eh,023h,023h,022h,011h,019h,05dh,039h,03ah,022h,012h,019h,057h,000h,001h,022h,012h,019h,00ch,004h,005h	; 7e6f  ."....."..-.."..>##"..]9:"..W..".....
	defb 001h,00bh,01dh,012h,019h,057h,004h,00fh,01dh,013h,019h,003h,02ch,018h,035h,019h,019h,00dh,00eh,03bh,01ch,04fh,019h,010h,023h,002h,055h,01dh,019h,03ch,039h,006h,007h,01dh,011h,057h,004h	; 7e94  .....W......,.5......O..#.U..<9....W.
	defb 001h,005h,006h,055h,01dh,022h,05ch,032h,033h,00bh,01dh,022h,05ch,00eh,017h,015h,01dh,04ah,05ah,023h,021h,020h,035h,04bh,05bh,03ah,03bh,01ch,04fh,022h,05ch,005h,006h,055h,01dh,022h,05ch	; 7eb9  ...U."\23.."\....JZ#! 5K[:..O"\..U."\
	defb 002h,050h,03ch,03dh,03eh,048h,000h,04ch,03fh,040h,041h,049h,03ah,04dh,042h,043h,044h,04ah,00fh,04bh,046h,045h,045h,047h,00fh,04eh,051h,04fh,04fh,0a3h,0a0h,09fh,09eh,0a8h,0aah,0a9h,0a1h	; 7ede  .P<=>H.L?@AI:MBCDJ.KFEEG.NQOO........
	defb 001h,030h,025h,026h,024h,025h,026h,034h,00eh,028h,029h,037h,02ah,038h,023h,00ch,000h,001h,002h,022h,019h,00ch,000h,001h,002h,022h,019h,00ch,000h,001h,002h,022h,019h,00ch,004h,005h,006h	; 7f03  .0%&$%&4.()7*8#....".....".....".....
	defb 001h,025h,026h,03fh,000h,001h,001h,058h,00eh,041h,004h,005h,005h,007h,043h,003h,008h,009h,02fh,056h,01dh,00dh,00eh,00eh,00eh,007h,01dh,010h,023h,023h,023h,007h,01dh,011h,019h,03ch,039h	; 7f28  .%&?...X.A....C.../V........###....<9
	defb 001h,002h,040h,025h,026h,054h,059h,006h,03dh,00eh,00eh,04bh,065h,00ah,00bh,043h,018h,022h,05ch,00eh,00fh,01dh,019h,04ah,05ah,023h,018h,035h,019h,04bh,05bh,03ah,03bh,01ch,04fh,022h,05ch	; 7f4d  ..@%&TY.=..Ke..C."\....JZ#.5.K[:..O"\

; ----------------------------------------------------------------------
; DATOS salas_zona_17: 6 salas de 37 bytes: [juego de bloques] y 6 x 6 bloques
;   de 4 x 4 caracteres (p00:58DD), la zona 17 (sigue en el banco 25, en
;   0x8000); lo leen p00:58DD (142 bytes)
;   0x7f72..0x8000  (142 bytes)
DATA_salas_zona_17:
	defb 001h,076h,03ch,03dh,03eh,079h,00ch,076h,03fh,040h,041h,097h,001h,077h,042h,074h,044h,078h,00bh,099h,075h,075h,075h,098h,007h,09bh,003h,003h,003h,09dh,01dh,001h,016h,053h,053h,055h,000h	; 7f72  .v<=>y.v?@A..wBtDx..uuu..........SSU.
	defb 001h,000h,00ch,032h,00ch,001h,00bh,001h,000h,032h,001h,00ch,001h,00bh,001h,032h,00bh,000h,001h,007h,007h,07bh,000h,00bh,001h,01dh,01dh,01dh,00bh,001h,00ch,00bh,001h,00ch,000h,001h,001h	; 7f97  ...2.....2.....2.....{...............
	defb 001h,00ch,001h,00bh,032h,001h,000h,001h,000h,00ch,032h,00ch,00bh,000h,00ch,000h,032h,001h,000h,00ch,001h,07dh,07bh,000h,00ch,001h,00ch,032h,01dh,00bh,000h,000h,001h,032h,001h,000h,000h	; 7fbc  ....2.....2.....2....}{....2.....2...
	defb 001h,00ch,000h,00ch,032h,001h,000h,000h,00ch,00bh,032h,000h,00ch,001h,000h,000h,034h,07ch,000h,00ch,00bh,000h,021h,07eh,001h,00bh,00ch,000h,07dh,07bh,00ch	; 7fe1  ....2.....2.....4|....!~....}{.
