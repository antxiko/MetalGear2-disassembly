; ==========================================================================
; METAL GEAR 2 SOLID SNAKE - Konami (1990) - MSX2 - MegaROM RC-767 de 512 KB (Konami SCC) - banco 50 (se ejecuta en 0x8000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x08000


; ----------------------------------------------------------------------
; DATOS cabecera_50: 38 punteros del banco 50: 8000 y 8002 tablas de mensajes,
;   8004 los nombres, 8006 y 8008 letreros, 800A tabla de letreros, 800C-8040
;   secuencias (p09:A507), 8042 tabla, 8044 y 804A letreros con sitio, 8046 y
;   8048 tablas de letreros; lo leen p01:61E3 (76 bytes)
;   0x8000..0x804c  (76 bytes)
DATA_cabecera_50:
	defw 0877ch,081e1h,0b3fah,0b1d9h,0b1e4h,0b24eh,0804ch,08078h	; 8000
	defw 080b6h,080b2h,0806bh,080bdh,080c1h,080e3h,080eah,080fbh	; 8010
	defw 08102h,080f1h,08106h,0810ah,0812ch,08130h,08137h,0813eh	; 8020
	defw 08176h,0817dh,08142h,08190h,08194h,081c2h,081cch,081d3h	; 8030
	defw 081d7h,0b487h,0b4adh,0b4d9h,0b4feh,0b4c6h	; 8040

; ----------------------------------------------------------------------
; DATOS secuencia_804C: 10 mensajes de 3 bytes [mensaje lo hi][espera] y el
;   ultimo con 0xFF y su espera (p09:A4F0, p09:A537); lo leen p09:A507 (31
;   bytes)
;   0x804c..0x806b  (31 bytes)
DATA_secuencia_804C:
	defb 065h,0a7h,001h	; 804c
	defb 07bh,0a7h,001h	; 804f
	defb 087h,0a7h,001h	; 8052
	defb 09fh,0a7h,001h	; 8055
	defb 0b0h,0a7h,001h	; 8058
	defb 0ceh,0a7h,001h	; 805b
	defb 010h,0a8h,001h	; 805e
	defb 02bh,0a8h,001h	; 8061
	defb 047h,0a8h,001h	; 8064
	defb 061h,0a8h,0ffh	; 8067
	defb 001h	; 806a

; ----------------------------------------------------------------------
; DATOS secuencia_806B: 4 mensajes de 3 bytes [mensaje lo hi][espera] y el
;   ultimo con 0xFF y su espera (p09:A4F0, p09:A537); lo leen p09:A507 (13
;   bytes)
;   0x806b..0x8078  (13 bytes)
DATA_secuencia_806B:
	defb 0abh,0a2h,001h	; 806b
	defb 0cdh,0a2h,001h	; 806e
	defb 0d9h,0a2h,001h	; 8071
	defb 0f0h,0a2h,0ffh	; 8074
	defb 001h	; 8077

; ----------------------------------------------------------------------
; DATOS secuencia_8078: 19 mensajes de 3 bytes [mensaje lo hi][espera] y el
;   ultimo con 0xFF y su espera (p09:A4F0, p09:A537); lo leen p09:A507 (58
;   bytes)
;   0x8078..0x80b2  (58 bytes)
DATA_secuencia_8078:
	defb 007h,0a3h,001h	; 8078
	defb 013h,0a3h,001h	; 807b
	defb 02fh,0a3h,001h	; 807e
	defb 07bh,0a3h,001h	; 8081
	defb 086h,0a3h,001h	; 8084
	defb 05fh,0a4h,001h	; 8087
	defb 0a8h,0a4h,001h	; 808a
	defb 0d6h,0a4h,001h	; 808d
	defb 0dfh,0a4h,001h	; 8090
	defb 0f1h,0a4h,001h	; 8093
	defb 006h,0a5h,001h	; 8096
	defb 030h,0a5h,001h	; 8099
	defb 039h,0a5h,001h	; 809c
	defb 0efh,0a5h,001h	; 809f
	defb 0f8h,0a5h,001h	; 80a2
	defb 03fh,0a6h,001h	; 80a5
	defb 066h,0a6h,001h	; 80a8
	defb 0fbh,0a6h,001h	; 80ab
	defb 00ch,0a7h,0ffh	; 80ae
	defb 001h	; 80b1

; ----------------------------------------------------------------------
; DATOS secuencia_80B2: 1 mensajes de 3 bytes [mensaje lo hi][espera] y el
;   ultimo con 0xFF y su espera (p09:A4F0, p09:A537); lo leen p09:A507 (4
;   bytes)
;   0x80b2..0x80b6  (4 bytes)
DATA_secuencia_80B2:
	defb 03ah,0a7h,0ffh	; 80b2
	defb 001h	; 80b5

; ----------------------------------------------------------------------
; DATOS secuencia_80B6: 2 mensajes de 3 bytes [mensaje lo hi][espera] y el
;   ultimo con 0xFF y su espera (p09:A4F0, p09:A537); lo leen p09:A507 (7
;   bytes)
;   0x80b6..0x80bd  (7 bytes)
DATA_secuencia_80B6:
	defb 046h,0a7h,001h	; 80b6
	defb 053h,0a7h,0ffh	; 80b9
	defb 001h	; 80bc

; ----------------------------------------------------------------------
; DATOS secuencia_80BD: 1 mensajes de 3 bytes [mensaje lo hi][espera] y el
;   ultimo con 0xFF y su espera (p09:A4F0, p09:A537); lo leen p09:A507 (4
;   bytes)
;   0x80bd..0x80c1  (4 bytes)
DATA_secuencia_80BD:
	defb 078h,0a8h,0ffh	; 80bd
	defb 001h	; 80c0

; ----------------------------------------------------------------------
; DATOS secuencia_80C1: 11 mensajes de 3 bytes [mensaje lo hi][espera] y el
;   ultimo con 0xFF y su espera (p09:A4F0, p09:A537); lo leen p09:A507 (34
;   bytes)
;   0x80c1..0x80e3  (34 bytes)
DATA_secuencia_80C1:
	defb 081h,0a8h,001h	; 80c1
	defb 0a5h,0a8h,001h	; 80c4
	defb 0ddh,0a8h,001h	; 80c7
	defb 0f0h,0a8h,001h	; 80ca
	defb 013h,0a9h,001h	; 80cd
	defb 055h,0a9h,001h	; 80d0
	defb 062h,0a9h,001h	; 80d3
	defb 075h,0a9h,001h	; 80d6
	defb 089h,0a9h,001h	; 80d9
	defb 0a8h,0a9h,001h	; 80dc
	defb 0e8h,0a9h,0ffh	; 80df
	defb 001h	; 80e2

; ----------------------------------------------------------------------
; DATOS secuencia_80E3: 2 mensajes de 3 bytes [mensaje lo hi][espera] y el
;   ultimo con 0xFF y su espera (p09:A4F0, p09:A537); lo leen p09:A507 (7
;   bytes)
;   0x80e3..0x80ea  (7 bytes)
DATA_secuencia_80E3:
	defb 0f9h,0a9h,001h	; 80e3
	defb 062h,0aah,0ffh	; 80e6
	defb 001h	; 80e9

; ----------------------------------------------------------------------
; DATOS secuencia_80EA: 2 mensajes de 3 bytes [mensaje lo hi][espera] y el
;   ultimo con 0xFF y su espera (p09:A4F0, p09:A537); lo leen p09:A507 (7
;   bytes)
;   0x80ea..0x80f1  (7 bytes)
DATA_secuencia_80EA:
	defb 08dh,0aah,020h	; 80ea
	defb 0cfh,0aah,0ffh	; 80ed
	defb 001h	; 80f0

; ----------------------------------------------------------------------
; DATOS secuencia_80F1: 3 mensajes de 3 bytes [mensaje lo hi][espera] y el
;   ultimo con 0xFF y su espera (p09:A4F0, p09:A537); lo leen p09:A507 (10
;   bytes)
;   0x80f1..0x80fb  (10 bytes)
DATA_secuencia_80F1:
	defb 0a9h,09fh,001h	; 80f1
	defb 0b2h,09fh,001h	; 80f4
	defb 0c2h,09fh,0ffh	; 80f7
	defb 002h	; 80fa

; ----------------------------------------------------------------------
; DATOS secuencia_80FB: 2 mensajes de 3 bytes [mensaje lo hi][espera] y el
;   ultimo con 0xFF y su espera (p09:A4F0, p09:A537); lo leen p09:A507 (7
;   bytes)
;   0x80fb..0x8102  (7 bytes)
DATA_secuencia_80FB:
	defb 0eah,09fh,001h	; 80fb
	defb 0fch,09fh,0ffh	; 80fe
	defb 002h	; 8101

; ----------------------------------------------------------------------
; DATOS secuencia_8102: 1 mensajes de 3 bytes [mensaje lo hi][espera] y el
;   ultimo con 0xFF y su espera (p09:A4F0, p09:A537); lo leen p09:A507 (4
;   bytes)
;   0x8102..0x8106  (4 bytes)
DATA_secuencia_8102:
	defb 017h,0a0h,0ffh	; 8102
	defb 002h	; 8105

; ----------------------------------------------------------------------
; DATOS secuencia_8106: 1 mensajes de 3 bytes [mensaje lo hi][espera] y el
;   ultimo con 0xFF y su espera (p09:A4F0, p09:A537); lo leen p09:A507 (4
;   bytes)
;   0x8106..0x810a  (4 bytes)
DATA_secuencia_8106:
	defb 036h,0a0h,0ffh	; 8106
	defb 002h	; 8109

; ----------------------------------------------------------------------
; DATOS secuencia_810A: 11 mensajes de 3 bytes [mensaje lo hi][espera] y el
;   ultimo con 0xFF y su espera (p09:A4F0, p09:A537); lo leen p09:A507 (34
;   bytes)
;   0x810a..0x812c  (34 bytes)
DATA_secuencia_810A:
	defb 041h,0a0h,001h	; 810a
	defb 04eh,0a0h,001h	; 810d
	defb 059h,0a0h,001h	; 8110
	defb 0b3h,0a0h,001h	; 8113
	defb 011h,0a1h,001h	; 8116
	defb 065h,0a1h,001h	; 8119
	defb 07ch,0a1h,001h	; 811c
	defb 0b0h,0a1h,001h	; 811f
	defb 0bah,0a1h,001h	; 8122
	defb 0c6h,0a1h,0c0h	; 8125
	defb 0d3h,0a1h,0ffh	; 8128
	defb 002h	; 812b

; ----------------------------------------------------------------------
; DATOS secuencia_812C: 1 mensajes de 3 bytes [mensaje lo hi][espera] y el
;   ultimo con 0xFF y su espera (p09:A4F0, p09:A537); lo leen p09:A507 (4
;   bytes)
;   0x812c..0x8130  (4 bytes)
DATA_secuencia_812C:
	defb 0d3h,0a1h,0ffh	; 812c
	defb 002h	; 812f

; ----------------------------------------------------------------------
; DATOS secuencia_8130: 2 mensajes de 3 bytes [mensaje lo hi][espera] y el
;   ultimo con 0xFF y su espera (p09:A4F0, p09:A537); lo leen p09:A507 (7
;   bytes)
;   0x8130..0x8137  (7 bytes)
DATA_secuencia_8130:
	defb 0ddh,0a1h,001h	; 8130
	defb 0ech,0a1h,0ffh	; 8133
	defb 002h	; 8136

; ----------------------------------------------------------------------
; DATOS secuencia_8137: 2 mensajes de 3 bytes [mensaje lo hi][espera] y el
;   ultimo con 0xFF y su espera (p09:A4F0, p09:A537); lo leen p09:A507 (7
;   bytes)
;   0x8137..0x813e  (7 bytes)
DATA_secuencia_8137:
	defb 00ah,0a2h,001h	; 8137
	defb 01bh,0a2h,0ffh	; 813a
	defb 002h	; 813d

; ----------------------------------------------------------------------
; DATOS secuencia_813E: 1 mensajes de 3 bytes [mensaje lo hi][espera] y el
;   ultimo con 0xFF y su espera (p09:A4F0, p09:A537); lo leen p09:A507 (4
;   bytes)
;   0x813e..0x8142  (4 bytes)
DATA_secuencia_813E:
	defb 095h,0a2h,0ffh	; 813e
	defb 002h	; 8141

; ----------------------------------------------------------------------
; DATOS secuencia_8142: 17 mensajes de 3 bytes [mensaje lo hi][espera] y el
;   ultimo con 0xFF y su espera (p09:A4F0, p09:A537); lo leen p09:A507 (52
;   bytes)
;   0x8142..0x8176  (52 bytes)
DATA_secuencia_8142:
	defb 08dh,0ach,001h	; 8142
	defb 09ch,0ach,001h	; 8145
	defb 0a3h,0ach,001h	; 8148
	defb 0abh,0ach,001h	; 814b
	defb 0c0h,0ach,001h	; 814e
	defb 0cfh,0ach,001h	; 8151
	defb 0e4h,0ach,001h	; 8154
	defb 003h,0adh,001h	; 8157
	defb 019h,0adh,001h	; 815a
	defb 063h,0adh,001h	; 815d
	defb 072h,0adh,001h	; 8160
	defb 0b0h,0adh,001h	; 8163
	defb 0bbh,0adh,001h	; 8166
	defb 0f8h,0adh,001h	; 8169
	defb 00ch,0aeh,001h	; 816c
	defb 06ah,0aeh,001h	; 816f
	defb 07dh,0aeh,0ffh	; 8172
	defb 002h	; 8175

; ----------------------------------------------------------------------
; DATOS secuencia_8176: 2 mensajes de 3 bytes [mensaje lo hi][espera] y el
;   ultimo con 0xFF y su espera (p09:A4F0, p09:A537); lo leen p09:A507 (7
;   bytes)
;   0x8176..0x817d  (7 bytes)
DATA_secuencia_8176:
	defb 0a9h,0aeh,001h	; 8176
	defb 0cbh,0aeh,0ffh	; 8179
	defb 002h	; 817c

; ----------------------------------------------------------------------
; DATOS secuencia_817D: 6 mensajes de 3 bytes [mensaje lo hi][espera] y el
;   ultimo con 0xFF y su espera (p09:A4F0, p09:A537); lo leen p09:A507 (19
;   bytes)
;   0x817d..0x8190  (19 bytes)
DATA_secuencia_817D:
	defb 0dfh,0aeh,001h	; 817d
	defb 0e7h,0aeh,001h	; 8180
	defb 0f0h,0aeh,001h	; 8183
	defb 008h,0afh,001h	; 8186
	defb 023h,0afh,001h	; 8189
	defb 036h,0afh,0ffh	; 818c
	defb 002h	; 818f

; ----------------------------------------------------------------------
; DATOS secuencia_8190: 1 mensajes de 3 bytes [mensaje lo hi][espera] y el
;   ultimo con 0xFF y su espera (p09:A4F0, p09:A537); lo leen p09:A507 (4
;   bytes)
;   0x8190..0x8194  (4 bytes)
DATA_secuencia_8190:
	defb 0e9h,0aah,0ffh	; 8190
	defb 002h	; 8193

; ----------------------------------------------------------------------
; DATOS secuencia_8194: 15 mensajes de 3 bytes [mensaje lo hi][espera] y el
;   ultimo con 0xFF y su espera (p09:A4F0, p09:A537); lo leen p09:A507 (46
;   bytes)
;   0x8194..0x81c2  (46 bytes)
DATA_secuencia_8194:
	defb 002h,0abh,001h	; 8194
	defb 00bh,0abh,001h	; 8197
	defb 014h,0abh,001h	; 819a
	defb 03ah,0abh,001h	; 819d
	defb 056h,0abh,001h	; 81a0
	defb 05fh,0abh,001h	; 81a3
	defb 083h,0abh,001h	; 81a6
	defb 09dh,0abh,001h	; 81a9
	defb 0bah,0abh,001h	; 81ac
	defb 0cfh,0abh,001h	; 81af
	defb 0e8h,0abh,001h	; 81b2
	defb 0f3h,0abh,001h	; 81b5
	defb 001h,0ach,001h	; 81b8
	defb 015h,0ach,001h	; 81bb
	defb 02fh,0ach,0ffh	; 81be
	defb 002h	; 81c1

; ----------------------------------------------------------------------
; DATOS secuencia_81C2: 3 mensajes de 3 bytes [mensaje lo hi][espera] y el
;   ultimo con 0xFF y su espera (p09:A4F0, p09:A537); lo leen p09:A507 (10
;   bytes)
;   0x81c2..0x81cc  (10 bytes)
DATA_secuencia_81C2:
	defb 044h,0ach,001h	; 81c2
	defb 06ah,0ach,001h	; 81c5
	defb 07ch,0ach,0ffh	; 81c8
	defb 002h	; 81cb

; ----------------------------------------------------------------------
; DATOS secuencia_81CC: 2 mensajes de 3 bytes [mensaje lo hi][espera] y el
;   ultimo con 0xFF y su espera (p09:A4F0, p09:A537); lo leen p09:A507 (7
;   bytes)
;   0x81cc..0x81d3  (7 bytes)
DATA_secuencia_81CC:
	defb 0b9h,09ch,060h	; 81cc
	defb 0cfh,09ch,0ffh	; 81cf
	defb 060h	; 81d2

; ----------------------------------------------------------------------
; DATOS secuencia_81D3: 1 mensajes de 3 bytes [mensaje lo hi][espera] y el
;   ultimo con 0xFF y su espera (p09:A4F0, p09:A537); lo leen p09:A507 (4
;   bytes)
;   0x81d3..0x81d7  (4 bytes)
DATA_secuencia_81D3:
	defb 0d9h,09ch,0ffh	; 81d3
	defb 060h	; 81d6

; ----------------------------------------------------------------------
; DATOS secuencia_81D7: 3 mensajes de 3 bytes [mensaje lo hi][espera] y el
;   ultimo con 0xFF y su espera (p09:A4F0, p09:A537); lo leen p09:A507 (10
;   bytes)
;   0x81d7..0x81e1  (10 bytes)
DATA_secuencia_81D7:
	defb 0ebh,09ch,0c0h	; 81d7
	defb 0fdh,09ch,0c0h	; 81da
	defb 017h,09dh,0ffh	; 81dd
	defb 0c0h	; 81e0

; ----------------------------------------------------------------------
; DATOS tabla_81E1: 35 punteros a mensajes (cabecera 0x8002 del banco 50); lo
;   leen p01:61E6 (70 bytes)
;   0x81e1..0x8227  (70 bytes)
DATA_tabla_81E1:
	defw 08264h,08227h,08247h,082e3h,082c0h,0851bh,0856ah,083bch	; 81e1
	defw 0846ah,0846ah,08444h,0869eh,00000h,00000h,00000h,0871fh	; 81f1
	defw 085cbh,086e6h,086bah,0866fh,0863ch,085e4h,086e6h,08620h	; 8201
	defw 0828ah,08580h,085cbh,084d2h,0848fh,083bch,08366h,08347h	; 8211
	defw 083e7h,083bch,08403h	; 8221  -> DATA_mensaje_83E7 DATA_mensaje_83BC DATA_mensaje_8403

; ----------------------------------------------------------------------
; DATOS mensaje_8227: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:6504 (32 bytes)
;   0x8227..0x8247  (32 bytes)
DATA_mensaje_8227:
	defb 0dch,08ch,081h,089h,082h,03dh,0f8h,034h,03eh,036h,046h,034h,026h,02ah,04bh,039h	; 8227  .....=.4>6F4&*K9
	defb 053h,02ch,0feh,0f8h,049h,071h,037h,026h,04dh,038h,085h,0b6h,03fh,02ch,04ah,0ffh	; 8237  S,..Iq7&M8..?,J.

; ----------------------------------------------------------------------
; DATOS mensaje_8247: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:6504 (29 bytes)
;   0x8247..0x8264  (29 bytes)
DATA_mensaje_8247:
	defb 0dch,029h,03ah,026h,035h,072h,052h,0e5h,025h,03dh,0bfh,0aah,0adh,0bch,03dh,029h	; 8247  .):&5rR.%=....=)
	defb 03ch,0feh,06fh,035h,072h,052h,038h,093h,0a2h,0b8h,090h,0e1h,0ffh	; 8257  <.o5rR8......

; ----------------------------------------------------------------------
; DATOS mensaje_8264: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:6504 (38 bytes)
;   0x8264..0x828a  (38 bytes)
DATA_mensaje_8264:
	defb 0dch,02eh,03dh,08ch,081h,089h,082h,03eh,0b4h,0cbh,0cfh,093h,0f8h,034h,0a7h,0d1h	; 8264  ..=....>.....4..
	defb 082h,060h,0feh,045h,02eh,027h,03dh,0beh,0a8h,038h,036h,039h,053h,071h,037h,04dh	; 8274  .`.E.'=..869Sq7M
	defb 052h,05dh,071h,0feh,037h,0ffh	; 8284

; ----------------------------------------------------------------------
; DATOS mensaje_828A: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:6504 (54 bytes)
;   0x828a..0x82c0  (54 bytes)
DATA_mensaje_828A:
	defb 0dch,02ah,034h,0f8h,067h,03dh,029h,059h,035h,072h,052h,03ah,09fh,0bch,0a7h,03dh	; 828a  .*4.g=)Y5rR:...=
	defb 09bh,087h,0feh,03dh,0f8h,052h,053h,02bh,034h,04bh,036h,034h,028h,037h,02ch,04eh	; 829a  ...=.RS+4K64(7,N
	defb 071h,037h,0e6h,0fdh,029h,03ch,028h,035h,072h,052h,03eh,02eh,02eh,03ah,03eh,026h	; 82aa  q7..)<(5rR>..:>&
	defb 039h,026h,0feh,071h,037h,0ffh	; 82ba

; ----------------------------------------------------------------------
; DATOS mensaje_82C0: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:6504 (35 bytes)
;   0x82c0..0x82e3  (35 bytes)
DATA_mensaje_82C0:
	defb 003h,0dch,08ch,081h,089h,082h,03dh,0f8h,007h,03ah,03ch,0e4h,0e4h,0e4h,0feh,040h	; 82c0  ......=..:<....@
	defb 04dh,026h,0f8h,045h,0f8h,007h,0f8h,034h,0f8h,04bh,053h,025h,04dh,052h,05dh,071h	; 82d0  M&.E...4.KS%MR]q
	defb 037h,02fh,0ffh	; 82e0

; ----------------------------------------------------------------------
; DATOS mensaje_82E3: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:6504 (78 bytes)
;   0x82e3..0x8331  (78 bytes)
DATA_mensaje_82E3:
	defb 0dch,039h,053h,04eh,03ah,02fh,02ah,04bh,071h,037h,03eh,026h,02dh,039h,026h,0feh	; 82e3  .9SN:/*Kq7>&-9&.
	defb 071h,037h,0e5h,02ah,034h,0f8h,067h,03dh,029h,059h,035h,072h,052h,053h,0e6h,0fdh	; 82f3  q7.*4.g=)Y5rRS..
	defb 039h,053h,04eh,03ah,0f8h,033h,051h,043h,02ah,032h,04dh,038h,0f8h,018h,028h,039h	; 8303  9SN:.3QC*2M8..(9
	defb 02ah,0feh,071h,034h,047h,03dh,053h,0f8h,018h,028h,037h,02ch,04dh,071h,037h,0e4h	; 8313  *.q4G=S..(7,Mq7.
	defb 0e4h,0e4h,0feh,039h,052h,03dh,02eh,038h,02ah,050h,02ah,04dh,0e1h,0ffh	; 8323  ...9R=.8*P*M..

; ----------------------------------------------------------------------
; DATOS mensajes_8331: 2 mensajes con el formato de p01:66C4 (letras hasta
;   0xFF o 0xFB) a los que no apunta ninguna de las tablas de mensajes que lee
;   el codigo
;   0x8331..0x8347  (22 bytes)
DATA_mensajes_8331:
	defb 039h,052h,03dh,02eh,038h,02ah,050h,02ah,04dh,0e1h,0ffh,039h,052h,03dh,02eh,038h	; 8331  9R=.8*P*M..9R=.8
	defb 02ah,050h,02ah,04dh,0e1h,0ffh	; 8341

; ----------------------------------------------------------------------
; DATOS mensaje_8347: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:6504 (31 bytes)
;   0x8347..0x8366  (31 bytes)
DATA_mensaje_8347:
	defb 0dch,02eh,02eh,02ah,04bh,0e5h,0f8h,036h,0f8h,062h,03dh,038h,02eh,04fh,03ah,0f8h	; 8347  ...*K..6.b=8.O:.
	defb 057h,0f8h,05ch,03dh,08bh,0feh,081h,087h,0f8h,02dh,053h,025h,04dh,03dh,0ffh	; 8357  W.\=.....-S%M=.

; ----------------------------------------------------------------------
; DATOS mensaje_8366: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:6504 (86 bytes)
;   0x8366..0x83bc  (86 bytes)
DATA_mensaje_8366:
	defb 0dch,02eh,02eh,03eh,03ch,0e5h,0f8h,06bh,03ah,039h,04dh,038h,0b4h,085h,099h,091h	; 8366  ...><..k:9M8....
	defb 0bbh,0adh,0feh,039h,052h,05dh,0e6h,05dh,02ah,04bh,0bbh,0adh,0a7h,0d2h,087h,03dh	; 8376  ...9R].]*K.....=
	defb 026h,04dh,0a9h,0feh,0ebh,0b3h,0ebh,09bh,0cbh,0adh,08ch,03eh,02bh,028h,04dh,052h	; 8386  &M.........>+(MR
	defb 05dh,0e6h,0fdh,033h,027h,039h,071h,034h,04bh,0c1h,087h,04bh,047h,0f8h,046h,060h	; 8396  ]..3'9q4K..KG.F`
	defb 025h,033h,065h,04dh,0feh,052h,05dh,0e6h,0f8h,018h,036h,02ah,04dh,038h,029h,02eh	; 83a6  %3eM.R]...6*M8).
	defb 04bh,04eh,04dh,02dh,061h,0ffh	; 83b6

; ----------------------------------------------------------------------
; DATOS mensaje_83BC: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:6504 (43 bytes)
;   0x83bc..0x83e7  (43 bytes)
DATA_mensaje_83BC:
	defb 0dch,02ah,034h,0f8h,067h,03dh,029h,059h,035h,072h,052h,03eh,0c1h,087h,04bh,03dh	; 83bc  .*4.g=)Y5rR>..K=
	defb 029h,048h,0feh,053h,050h,04ch,02fh,0e6h,029h,059h,035h,072h,052h,03eh,0f8h,044h	; 83cc  )H.SPL/.)Y5rR>.D
	defb 0f8h,052h,053h,02bh,04bh,0feh,026h,039h,052h,05dh,0ffh	; 83dc  .RS+K.&9R].

; ----------------------------------------------------------------------
; DATOS mensaje_83E7: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:6504 (28 bytes)
;   0x83e7..0x8403  (28 bytes)
DATA_mensaje_83E7:
	defb 0dch,0f8h,06bh,0e5h,040h,02ch,04fh,027h,053h,039h,02ch,02ah,04bh,0e4h,0e4h,0e4h	; 83e7  ..k.@,O'S9,*K...
	defb 0feh,02eh,050h,02ch,037h,03ch,045h,04eh,039h,026h,03dh,0ffh	; 83f7  ..P,7<EN9&=.

; ----------------------------------------------------------------------
; DATOS mensaje_8403: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:6504 (65 bytes)
;   0x8403..0x8444  (65 bytes)
DATA_mensaje_8403:
	defb 0dch,033h,02eh,03dh,0c0h,0a6h,0adh,0b8h,03eh,0c3h,0a6h,08bh,0d1h,0ebh,093h,02eh	; 8403  .3.=....>.......
	defb 027h,0feh,02ah,0f8h,06fh,03ah,036h,02ch,04bh,04eh,034h,052h,05dh,04ah,0e6h,0fdh	; 8413  '.*.o:6,KN4R]J..
	defb 060h,047h,099h,0adh,0b0h,0a6h,081h,0b8h,0ebh,05dh,071h,034h,04bh,0e4h,0e4h,0e4h	; 8423  `G.......]q4K...
	defb 0feh,047h,071h,038h,038h,029h,02ch,041h,026h,02dh,04dh,05dh,04fh,027h,039h,06ch	; 8433  .Gq88),A&-M]O'9l
	defb 0ffh	; 8443

; ----------------------------------------------------------------------
; DATOS mensaje_8444: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:6504 (38 bytes)
;   0x8444..0x846a  (38 bytes)
DATA_mensaje_8444:
	defb 0dch,02eh,03dh,0f8h,03eh,043h,060h,02eh,03dh,0f8h,050h,03ah,0c0h,0a6h,0adh,0b8h	; 8444  ..=.>C`.=.P:....
	defb 053h,025h,071h,0feh,034h,052h,05dh,02dh,061h,0f8h,07dh,0f8h,07ch,053h,027h,046h	; 8454  S%q.4R]-a.}.|S'F
	defb 04bh,04eh,034h,052h,05dh,0ffh	; 8464

; ----------------------------------------------------------------------
; DATOS mensaje_846A: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:6504 (37 bytes)
;   0x846a..0x848f  (37 bytes)
DATA_mensaje_846A:
	defb 0dch,02eh,03dh,0f8h,050h,03ah,09fh,0bch,0a7h,03dh,0c3h,081h,094h,0cfh,0c5h,0a8h	; 846a  ..=.P:...=......
	defb 044h,0feh,034h,026h,039h,047h,03dh,053h,026h,071h,067h,026h,025h,071h,034h,052h	; 847a  D.4&9G=S&qg&%q4R
	defb 05dh,02dh,0feh,061h,0ffh	; 848a

; ----------------------------------------------------------------------
; DATOS mensaje_848F: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:6504 (60 bytes)
;   0x848f..0x84cb  (60 bytes)
DATA_mensaje_848F:
	defb 0dch,0afh,0bfh,0e4h,09fh,0ebh,0e4h,086h,0d2h,089h,0a9h,0ebh,093h,0e0h,0feh,03ah	; 848f  ...............:
	defb 026h,035h,072h,052h,0e5h,00ch,002h,0a9h,0ebh,08bh,0d2h,0adh,047h,071h,037h,0feh	; 849f  &5rR........Gq7.
	defb 039h,026h,0e1h,0fdh,00ch,002h,0a9h,0ebh,08bh,0d2h,0adh,03ah,090h,0d2h,089h,0a9h	; 84af  9&.........:....
	defb 0ebh,093h,053h,03eh,0feh,026h,071h,037h,04dh,052h,05dh,0ffh	; 84bf  ..S>.&q7MR].

; ----------------------------------------------------------------------
; DATOS mensajes_84CB: 1 mensaje con el formato de p01:66C4 (letras hasta 0xFF
;   o 0xFB) a los que no apunta ninguna de las tablas de mensajes que lee el
;   codigo
;   0x84cb..0x84d2  (7 bytes)
DATA_mensajes_84CB:
	defb 026h,071h,037h,04dh,052h,05dh,0ffh	; 84cb

; ----------------------------------------------------------------------
; DATOS mensaje_84D2: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:6504 (73 bytes)
;   0x84d2..0x851b  (73 bytes)
DATA_mensaje_84D2:
	defb 0dch,0f8h,02ch,0f8h,06eh,0f8h,02dh,03dh,0f8h,046h,03eh,097h,0b5h,09fh,053h,029h	; 84d2  ..,.n.-=.F>...S)
	defb 029h,026h,052h,05dh,0e6h,0feh,097h,0b5h,09fh,03eh,08ch,03ah,039h,052h,060h,047h	; 84e2  )&R].....>.:9R`G
	defb 047h,035h,02eh,052h,059h,072h,0feh,027h,052h,05dh,0e6h,0fdh,05dh,02ah,04bh,097h	; 84f2  G5.RYr.'R]..]*K.
	defb 0b5h,09fh,04ah,02dh,03ah,098h,082h,0a7h,0d1h,082h,08ah,0adh,0feh,051h,029h,026h	; 8502  ..J-:........Q)&
	defb 037h,025h,04dh,052h,05dh,071h,037h,02fh,0ffh	; 8512  7%MR]q7/.

; ----------------------------------------------------------------------
; DATOS mensaje_851B: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:6504 (79 bytes)
;   0x851b..0x856a  (79 bytes)
DATA_mensaje_851B:
	defb 0dch,02eh,02eh,03eh,033h,02eh,039h,030h,03bh,043h,05dh,02ah,04bh,035h,02ah,05fh	; 851b  ...>3.90.C]*K5*_
	defb 02ch,0feh,038h,0f8h,011h,039h,026h,052h,05dh,071h,037h,0e6h,0feh,02dh,061h,0e4h	; 852b  ,.8..9&R]q7..-a.
	defb 0e4h,0c1h,087h,034h,030h,02ah,03ah,0f8h,018h,034h,052h,05dh,0e6h,0fdh,0f8h,044h	; 853b  ...40*:..4R]...D
	defb 02bh,039h,093h,0a6h,0cfh,087h,053h,02eh,03dh,0f8h,02eh,051h,0f8h,07dh,071h,037h	; 854b  +9....S.=..Q.}q7
	defb 026h,0feh,02ch,03dh,051h,0e6h,030h,052h,059h,037h,02ch,04eh,04dh,0e1h,0ffh	; 855b  &.,=Q.0RY7,NM..

; ----------------------------------------------------------------------
; DATOS mensaje_856A: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:6504 (22 bytes)
;   0x856a..0x8580  (22 bytes)
DATA_mensaje_856A:
	defb 0dch,02eh,02eh,02ah,04bh,04ah,02ch,093h,0a6h,0cfh,087h,053h,060h,03eh,026h,04ch	; 856a  ...*KJ,....S`>&L
	defb 030h,0feh,037h,04dh,04ah,0ffh	; 857a

; ----------------------------------------------------------------------
; DATOS mensaje_8580: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:6504 (75 bytes)
;   0x8580..0x85cb  (75 bytes)
DATA_mensaje_8580:
	defb 0dch,08fh,081h,087h,082h,09fh,08ah,081h,0a8h,0e5h,08ch,092h,0c9h,0adh,0aeh,0ebh	; 8580  ................
	defb 0feh,05dh,04fh,071h,0e1h,0fdh,02eh,03dh,0f8h,03eh,0e5h,0f8h,03ah,08bh,0d0h,03ah	; 8590  .]Oq...=.>..:..:
	defb 08eh,082h,0beh,031h,04dh,038h,02ah,039h,0feh,052h,02ah,060h,0e5h,0b3h,0adh,0b4h	; 85a0  ...1M8*9.R*`....
	defb 0bdh,0ebh,0beh,0a8h,03dh,002h,010h,03dh,0f8h,036h,0feh,0aeh,0abh,03dh,089h,082h	; 85b0  ....=..=.6...=..
	defb 0b4h,0d2h,082h,03ah,047h,071h,037h,071h,034h,04ah,0ffh	; 85c0  ...:Gq7q4J.

; ----------------------------------------------------------------------
; DATOS mensaje_85CB: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:6504 (25 bytes)
;   0x85cb..0x85e4  (25 bytes)
DATA_mensaje_85CB:
	defb 002h,0dch,050h,034h,030h,0e5h,0b4h,0d1h,082h,051h,047h,071h,034h,0f8h,052h,0e5h	; 85cb  ..P40....QGq4.R.
	defb 0feh,0f8h,044h,02bh,04bh,026h,0e0h,0e0h,0ffh	; 85db  ..D+K&...

; ----------------------------------------------------------------------
; DATOS mensaje_85E4: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:6504 (60 bytes)
;   0x85e4..0x8620  (60 bytes)
DATA_mensaje_85E4:
	defb 0dch,09ah,09fh,091h,051h,029h,030h,028h,037h,025h,056h,04dh,0e1h,0fdh,094h,08fh	; 85e4  ....Q)0(7%VM....
	defb 0ebh,08bh,0d0h,03ch,06fh,035h,072h,052h,03dh,03ch,0e6h,0feh,0bfh,0aah,0ebh,090h	; 85f4  ...<o5rR=<......
	defb 03ch,0e4h,0e4h,08ah,082h,094h,048h,0a9h,081h,093h,082h,089h,0feh,03ah,0f8h,049h	; 8604  <.....H......:.I
	defb 04dh,038h,02ah,034h,035h,053h,02ah,050h,04dh,03dh,04ah,0ffh	; 8614  M8*45S*PM=J.

; ----------------------------------------------------------------------
; DATOS mensaje_8620: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:6504 (28 bytes)
;   0x8620..0x863c  (28 bytes)
DATA_mensaje_8620:
	defb 002h,0dch,025h,071h,0e5h,044h,036h,02ah,071h,035h,072h,071h,034h,0e0h,0feh,0e4h	; 8620  ..%q.D6*q5rq4...
	defb 0e4h,0e4h,02ah,02ch,04eh,052h,066h,030h,037h,034h,03dh,0ffh	; 8630  ..*,NRf074=.

; ----------------------------------------------------------------------
; DATOS mensaje_863C: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:6504 (51 bytes)
;   0x863c..0x866f  (51 bytes)
DATA_mensaje_863C:
	defb 0dch,094h,08fh,0ebh,08bh,0d0h,03ch,028h,035h,072h,052h,03dh,0aah,0cfh,085h,0ebh	; 863c  ......<(5rR=....
	defb 03eh,0feh,026h,035h,062h,052h,0f8h,004h,0f8h,02eh,04ah,0e6h,08ah,082h,094h,02ah	; 864c  >.&5bR....J....*
	defb 04bh,0f8h,02eh,053h,071h,0feh,037h,02bh,034h,0f8h,028h,03ah,04ah,02ch,0f8h,018h	; 865c  K..Sq.7+4.(:J,..
	defb 034h,050h,0ffh	; 866c

; ----------------------------------------------------------------------
; DATOS mensaje_866F: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:6504 (47 bytes)
;   0x866f..0x869e  (47 bytes)
DATA_mensaje_866F:
	defb 0dch,02eh,02eh,03ah,03eh,093h,081h,0a9h,053h,03fh,038h,036h,030h,02ah,039h,026h	; 866f  ...:>...S?860*9&
	defb 03dh,0feh,0e6h,02eh,03dh,02ah,026h,03dh,0f8h,050h,0f8h,04ah,03ah,025h,04dh,052h	; 867f  =...=*&=.P.J:%MR
	defb 05dh,02dh,061h,0feh,0e4h,0e4h,0e4h,0f8h,06bh,0e5h,02eh,050h,02ch,037h,0ffh	; 868f  ]-a.....k..P,7.

; ----------------------------------------------------------------------
; DATOS mensaje_869E: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:6504 (28 bytes)
;   0x869e..0x86ba  (28 bytes)
DATA_mensaje_869E:
	defb 0dch,02eh,03dh,084h,087h,03ah,09eh,097h,086h,0adh,03dh,0f8h,012h,08fh,081h,02fh	; 869e  ..=..:....=..../
	defb 052h,053h,0feh,026h,071h,067h,026h,025h,04dh,04ah,0e6h,0ffh	; 86ae  RS.&qg&%MJ..

; ----------------------------------------------------------------------
; DATOS mensaje_86BA: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:6504 (44 bytes)
;   0x86ba..0x86e6  (44 bytes)
DATA_mensaje_86BA:
	defb 0dch,02eh,02eh,03dh,0f8h,044h,0f8h,052h,034h,035h,03eh,089h,0cfh,085h,053h,02ah	; 86ba  ...=.D.R45>...S*
	defb 02ah,04dh,038h,0feh,086h,0a7h,091h,030h,037h,030h,043h,027h,052h,05dh,0e6h,0feh	; 86ca  *M8....070C'R]..
	defb 033h,04eh,053h,02bh,043h,04ch,039h,052h,05dh,071h,037h,0ffh	; 86da  3NS+CL9R]q7.

; ----------------------------------------------------------------------
; DATOS mensaje_86E6: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:6504 (32 bytes)
;   0x86e6..0x8706  (32 bytes)
DATA_mensaje_86E6:
	defb 0dch,085h,0b6h,051h,03fh,026h,034h,0f8h,028h,03eh,081h,0a0h,0f8h,02ah,03ah,026h	; 86e6  ...Q?&4.(>...*:&
	defb 071h,037h,087h,0feh,08ch,0a7h,051h,047h,04bh,028h,062h,026h,026h,052h,05dh,0ffh	; 86f6  q7....QGK(b&&R].

; ----------------------------------------------------------------------
; DATOS mensajes_8706: 1 mensaje con el formato de p01:66C4 (letras hasta 0xFF
;   o 0xFB) a los que no apunta ninguna de las tablas de mensajes que lee el
;   codigo
;   0x8706..0x871f  (25 bytes)
DATA_mensajes_8706:
	defb 0dch,0f8h,06bh,060h,047h,0f8h,018h,028h,04dh,08eh,082h,0aeh,0adh,086h,0d2h,082h	; 8706  ..k`G..(M.......
	defb 071h,037h,030h,0feh,071h,037h,04dh,0e1h,0ffh	; 8716  q70.q7M..

; ----------------------------------------------------------------------
; DATOS mensaje_871F: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:6504 (93 bytes)
;   0x871f..0x877c  (93 bytes)
DATA_mensaje_871F:
	defb 003h,076h,052h,0e1h,0e4h,0e4h,0e4h,0feh,099h,093h,03dh,0f8h,041h,03ah,085h,09fh	; 871f  .vR.......=.A:..
	defb 053h,030h,062h,071h,037h,025h,04dh,05ch,0fdh,012h,00fh,016h,01ah,0e0h,000h,021h	; 872f  S0bq7%M\.......!
	defb 013h,01dh,0e5h,001h,012h,013h,001h,0feh,015h,013h,019h,000h,017h,00bh,01ch,020h	; 873f  ...............
	defb 0e4h,0e4h,0e4h,0fdh,012h,05dh,02dh,053h,0f8h,055h,0f8h,05dh,059h,0e1h,0feh,09eh	; 874f  .....]-S.U.]Y...
	defb 0a8h,09bh,0f8h,054h,0f8h,023h,03dh,060h,052h,0f8h,019h,039h,03dh,02ah,0e1h,0feh	; 875f  ...T.#=`R..9=*..
	defb 039h,052h,03dh,0f8h,002h,0f8h,063h,05dh,04fh,027h,02ah,0e1h,0ffh	; 876f  9R=...c]O'*..

; ----------------------------------------------------------------------
; DATOS tabla_877C: 24 punteros a mensajes (cabecera 0x8000 del banco 50); lo
;   leen p01:61E6 (48 bytes)
;   0x877c..0x87ac  (48 bytes)
DATA_tabla_877C:
	defw 087ach,08807h,0887bh,08bdah,08c4eh,08c79h,08cbfh,092ffh	; 877c
	defw 08de4h,09c93h,08d27h,08d64h,08d95h,0979ah,09802h,09844h	; 878c
	defw 0990ch,092aeh,092bbh,09866h,08e35h,08e6dh,08fc4h,09182h	; 879c

; ----------------------------------------------------------------------
; DATOS mensaje_87AC: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:6504 (91 bytes)
;   0x87ac..0x8807  (91 bytes)
DATA_mensaje_87AC:
	defb 003h,07dh,040h,040h,0e4h,0e4h,0e4h,029h,04fh,02ah,039h,0e5h,0feh,010h,019h,022h	; 87ac  .}@@...)O*9...."
	defb 000h,012h,019h,01fh,018h,00eh,00fh,01ch,0e0h,0fch,07dh,09eh,0a8h,09bh,0f8h,054h	; 87bc  ..........}....T
	defb 0f8h,023h,03eh,02eh,02eh,03ah,03eh,026h,039h,026h,071h,0e0h,0feh,02eh,052h,039h	; 87cc  .#>..:>&9&q...R9
	defb 0f8h,07fh,071h,06bh,026h,099h,0cfh,08bh,0adh,086h,060h,05dh,043h,033h,0feh,027h	; 87dc  ..qk&.....`]C3.'
	defb 038h,03eh,010h,019h,022h,000h,012h,019h,01fh,018h,00eh,047h,08eh,082h,093h,0feh	; 87ec  8>.."......G....
	defb 082h,0e5h,0b4h,0b8h,081h,029h,02ch,04eh,05dh,039h,0fbh	; 87fc  .....),N]9.

; ----------------------------------------------------------------------
; DATOS mensaje_8807: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:6504 (116 bytes)
;   0x8807..0x887b  (116 bytes)
DATA_mensaje_8807:
	defb 0d5h,084h,0a9h,03eh,00ch,016h,00bh,00dh,015h,000h,00dh,019h,016h,019h,01ch,0feh	; 8807  ...>............
	defb 018h,00bh,01dh,00bh,03dh,08fh,081h,090h,086h,0d1h,082h,0f8h,00dh,085h,0adh,086h	; 8817  ....=...........
	defb 0d2h,0feh,082h,093h,087h,08bh,0d1h,0bfh,08fh,081h,0f8h,030h,0f8h,033h,0e6h,0fdh	; 8827  ...........0.3..
	defb 0f8h,035h,0f8h,00ch,0ebh,03dh,099h,081h,092h,087h,09bh,08dh,081h,086h,0f8h,03ah	; 8837  .5...=.........:
	defb 0bfh,08fh,081h,0feh,0e5h,010h,019h,022h,000h,012h,019h,01fh,018h,00eh,038h,048h	; 8847  ......."......8H
	defb 04bh,03dh,0b4h,091h,0feh,0a7h,0d2h,087h,051h,0f8h,018h,032h,037h,047h,04bh,029h	; 8857  K=......Q..27GK)
	defb 027h,02ah,0e0h,0fdh,02eh,026h,071h,0e0h,010h,019h,022h,000h,012h,019h,01fh,018h	; 8867  '*...&q...".....
	defb 00eh,00fh,01ch,0fbh	; 8877

; ----------------------------------------------------------------------
; DATOS mensaje_887B: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:6504 (863 bytes)
;   0x887b..0x8bda  (863 bytes)
DATA_mensaje_887B:
	defb 003h,0d5h,0e4h,0e4h,0e4h,01dh,018h,00bh,015h,00fh,0fch,003h,076h,05dh,04eh,05dh	; 887b  ............v]N]
	defb 0e1h,0e4h,0e4h,039h,05bh,0e5h,0f8h,066h,0f8h,03eh,051h,0fch,0d5h,084h,0e5h,084h	; 888b  ...9[..f.>Q.....
	defb 0a9h,05dh,0e4h,0e4h,0e4h,08bh,0d1h,094h,081h,0b8h,0ebh,0e6h,0feh,085h,081h,0a8h	; 889b  .]..............
	defb 0e4h,08bh,0d1h,094h,081h,0b8h,0ebh,05dh,0e6h,0feh,029h,066h,028h,037h,026h,04dh	; 88ab  .......]..)f(7&M
	defb 02ah,0e1h,0fch,076h,08bh,0d1h,094h,081h,0b8h,0ebh,0e1h,0feh,0e4h,0e4h,0e4h,025h	; 88bb  *..v...........%
	defb 03dh,019h,01fh,01eh,00fh,01ch,000h,012h,00fh,00bh,020h,00fh,0feh,018h,03dh,0a9h	; 88cb  =......... ...=.
	defb 0b4h,08ch,08fh,0adh,08ch,05dh,071h,034h,0e1h,0fdh,030h,02ah,030h,0e5h,025h,03dh	; 88db  .....]q4..0*0.%=
	defb 0f8h,028h,0e4h,0e4h,0e4h,0a3h,091h,04bh,03ah,02eh,04fh,0feh,02fh,04eh,034h,03eh	; 88eb  .(.....K:.O./N4>
	defb 05ah,0fch,0d5h,01dh,018h,00bh,015h,00fh,0e5h,0feh,029h,0f8h,03eh,047h,043h,05dh	; 88fb  Z.........).>GC]
	defb 025h,043h,026h,039h,0e6h,0fdh,084h,0a9h,053h,02eh,04fh,02fh,04eh,02ah,02dh,034h	; 890b  %C&9....S.O/N*-4
	defb 03dh,03eh,0a3h,091h,04bh,0feh,03ah,060h,03eh,039h,026h,0e5h,029h,0f8h,03eh,04bh	; 891b  =>..K.:`>9&.).>K
	defb 038h,029h,0f8h,03eh,04bh,03dh,0feh,087h,095h,03ah,05dh,0fch,003h,076h,08bh,0d1h	; 892b  8).>K=...:]..v..
	defb 094h,081h,0b8h,0ebh,0e1h,081h,09fh,053h,050h,02ah,04bh,052h,0fch,0d5h,0e4h,0e4h	; 893b  .......SP*KR....
	defb 0e4h,01dh,018h,00bh,015h,00fh,0e5h,029h,0f8h,03eh,053h,0a1h,08fh,0a8h,0e4h,0feh	; 894b  .......).>S.....
	defb 0afh,080h,051h,099h,085h,081h,030h,034h,025h,038h,0e5h,0fdh,018h,00bh,01eh,019h	; 895b  ..Q...04%8......
	defb 0f8h,016h,03ah,04ah,04dh,0f8h,044h,086h,0c1h,039h,019h,01fh,01eh,00fh,0feh,01ch	; 896b  ..:JM.D..9......
	defb 000h,012h,00fh,00bh,020h,00fh,018h,0bdh,087h,0b1h,086h,053h,029h,02eh,039h,0feh	; 897b  .... ......S).9.
	defb 050h,04eh,034h,0e6h,0fdh,0a9h,0b4h,08ch,08fh,0adh,08ch,060h,025h,071h,034h,050h	; 898b  PN4........`%q4P
	defb 04eh,050h,04eh,047h,0feh,019h,01fh,01eh,00fh,01ch,000h,012h,00fh,00bh,020h,00fh	; 899b  NPNG.......... .
	defb 018h,03dh,0f8h,051h,089h,0bch,0feh,0a2h,047h,0e4h,0e4h,0e4h,044h,052h,039h,0f8h	; 89ab  .=.Q....G...DR9.
	defb 018h,031h,037h,04bh,04eh,034h,0e6h,0fdh,085h,0a9h,04bh,03eh,0a2h,082h,085h,03dh	; 89bb  .17KN4....K>...=
	defb 0f8h,046h,060h,03ah,056h,043h,038h,026h,0feh,0e4h,0e4h,0e4h,03dh,034h,04eh,0f8h	; 89cb  .F`:VC8&....=4N.
	defb 024h,052h,060h,026h,071h,034h,0fch,003h,076h,033h,052h,039h,0e5h,062h,02ah,039h	; 89db  $R`&q4..v3R9.b*9
	defb 0e4h,0e4h,0e4h,0fch,0d5h,047h,038h,047h,038h,019h,01fh,01eh,00fh,01ch,000h,012h	; 89eb  .....G8G8.......
	defb 00fh,00bh,020h,00fh,018h,0feh,03dh,089h,0bch,0a2h,034h,035h,03eh,0f8h,035h,0f8h	; 89fb  .. ...=...45>.5.
	defb 00ch,085h,0cfh,089h,087h,02ah,04bh,025h,0feh,036h,046h,04bh,04eh,034h,0f8h,03ah	; 8a0b  .....*K%.6FKN4.:
	defb 08eh,082h,089h,0b4h,048h,094h,0adh,09fh,0adh,05dh,0feh,0e6h,0fdh,0a3h,091h,04bh	; 8a1b  ....H....].....K
	defb 03ah,038h,071h,037h,085h,0a9h,04bh,03dh,04ah,027h,039h,089h,0bch,0feh,0a2h,034h	; 8a2b  :8q7..K=J'9....4
	defb 035h,03eh,040h,04eh,034h,02ch,03eh,039h,026h,08eh,0adh,0b3h,081h,05dh,0feh,071h	; 8a3b  5>@N4,>9&....].q
	defb 034h,0e4h,0e4h,0e4h,0fch,003h,076h,0e4h,0e4h,0e4h,043h,02fh,02ah,0fch,0d5h,029h	; 8a4b  4.....v...C/*..)
	defb 0f8h,03eh,04bh,047h,0f8h,059h,059h,05dh,0e6h,0feh,026h,05ah,04eh,050h,031h,04eh	; 8a5b  .>KG.YY]..&ZNP1N
	defb 04bh,04eh,04dh,0e4h,0e4h,0e4h,0feh,030h,02ah,030h,0e5h,025h,03dh,0f8h,052h,03eh	; 8a6b  KNM....0*0.%=.R>
	defb 0e4h,0e4h,0e4h,0fch,003h,076h,025h,0e4h,03dh,0e4h,0f8h,052h,0e4h,0e4h,0e4h,0e1h	; 8a7b  .....v%.=..R....
	defb 0fch,0d5h,03ah,056h,043h,038h,027h,050h,04eh,050h,04eh,051h,0f8h,014h,071h,037h	; 8a8b  ..:VC8'PNPNQ..q7
	defb 02ch,04eh,034h,0feh,03dh,03eh,0e4h,0e4h,0e4h,025h,03dh,029h,0f8h,060h,0e6h,0fdh	; 8a9b  ,N4.=>...%=).`..
	defb 025h,03dh,0f8h,052h,03eh,050h,04eh,050h,04eh,03dh,030h,034h,02eh,038h,051h,049h	; 8aab  %=.R>PNPN=04.8QI
	defb 04dh,0feh,030h,037h,02ch,04eh,034h,0f8h,02eh,0e5h,050h,04eh,050h,04eh,03ah,025h	; 8abb  M.07,N4...PNPN:%
	defb 034h,04bh,030h,0feh,026h,093h,090h,048h,085h,0b7h,087h,051h,025h,034h,028h,037h	; 8acb  4K0.&..H...Q%4(7
	defb 02ch,04eh,034h,0feh,0e4h,0e4h,0e4h,0fch,076h,025h,03dh,0f8h,052h,0e4h,0e4h,0e4h	; 8adb  ,N4.....v%=.R...
	defb 047h,030h,048h,0e1h,0fch,0d5h,01dh,018h,00bh,015h,00fh,0e5h,0f8h,01ch,03ah,029h	; 8aeb  G0H...........:)
	defb 0f8h,03eh,047h,050h,02ah,04dh,0e6h,0feh,025h,03dh,0f8h,052h,03dh,031h,062h,04bh	; 8afb  .>GP*M..%=.R=1bK
	defb 030h,02fh,053h,0e4h,0e4h,0e4h,0fch,0d5h,01dh,018h,00bh,015h,00fh,0e4h,0e4h,0e4h	; 8b0b  0/S.............
	defb 029h,0f8h,03eh,03ah,03eh,02ah,04ch,03eh,025h,0feh,071h,037h,02eh,033h,027h,04bh	; 8b1b  ).>:>*L>%.q7.3'K
	defb 044h,03eh,039h,026h,0e6h,0feh,0f8h,054h,0f8h,023h,03dh,0f8h,02fh,0f8h,02dh,051h	; 8b2b  D>9&...T.#=./.-Q
	defb 029h,030h,028h,037h,048h,04fh,027h,0e6h,0fdh,025h,03dh,0f8h,052h,03dh,081h,08bh	; 8b3b  )0(7HO'..%=.R=..
	defb 03ah,02fh,02ah,04bh,027h,02eh,038h,060h,03eh,039h,0feh,026h,0e4h,0e4h,0e4h,0f8h	; 8b4b  :/*K'.8`>9.&....
	defb 054h,0f8h,023h,03dh,085h,0adh,086h,0adh,02fh,04eh,037h,026h,04dh,0feh,0bch,087h	; 8b5b  T.#=..../N7&M...
	defb 0c1h,082h,03dh,044h,03eh,04ch,051h,02fh,053h,031h,052h,05dh,0e6h,0fdh,033h,03dh	; 8b6b  ..=D>LQ/S1R]..3=
	defb 0f8h,04fh,051h,0beh,089h,082h,031h,04eh,062h,0e4h,0e4h,0e4h,0bch,087h,0c1h,0feh	; 8b7b  .OQ...1Nb.......
	defb 082h,041h,034h,061h,04ch,036h,02dh,04dh,0e6h,0fdh,0f8h,04fh,03dh,093h,087h,090h	; 8b8b  .A4aL6-M...O=...
	defb 0d2h,082h,03eh,0b0h,0a7h,0ebh,0adh,0c0h,0a9h,0ebh,051h,0feh,02ah,064h,071h,037h	; 8b9b  ..>.......Q.*dq7
	defb 026h,04dh,0e6h,002h,010h,03ah,026h,04dh,03eh,05ah,05dh,0e6h,0feh,026h,026h,02ah	; 8bab  &M...:&M>Z]..&&*
	defb 0e4h,0e4h,0b0h,0a7h,0ebh,0adh,0c0h,0a9h,0ebh,05dh,0e6h,0fdh,0b0h,0a7h,0ebh,0adh	; 8bbb  .........]......
	defb 0c0h,0a9h,0ebh,03dh,0f8h,04fh,051h,0beh,089h,082h,030h,04fh,0e0h,0feh,0fbh	; 8bcb  ...=.OQ...0O...

; ----------------------------------------------------------------------
; DATOS mensaje_8BDA: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:6504 (116 bytes)
;   0x8bda..0x8c4e  (116 bytes)
DATA_mensaje_8BDA:
	defb 0d7h,03fh,02fh,030h,064h,04ch,03dh,086h,0d0h,087h,0b4h,0adh,02ah,0e1h,0feh,0e4h	; 8bda  .?/0dL=.....*...
	defb 0e4h,0e4h,026h,026h,038h,02eh,04fh,03ah,0f8h,070h,034h,05bh,0e6h,0fdh,02eh,04eh	; 8bea  ..&&8.O:.p4[...N
	defb 02ah,04bh,03fh,038h,071h,067h,030h,04ch,030h,04ah,027h,038h,029h,047h,0feh,071h	; 8bfa  *K?8qg0L0J'8)G.q
	defb 037h,026h,034h,038h,02eh,04fh,05dh,0e6h,0fdh,084h,0a9h,03eh,01ch,01fh,018h,018h	; 8c0a  7&48.O]....>....
	defb 013h,018h,011h,000h,017h,00bh,018h,0feh,0f8h,035h,0f8h,00ch,0ebh,08bh,0d1h,0adh	; 8c1a  .........5......
	defb 0f8h,041h,039h,0a5h,082h,09ch,081h,05dh,0e6h,0feh,084h,0a9h,03dh,0f8h,041h,03ah	; 8c2a  .A9....]....=.A:
	defb 036h,026h,037h,02eh,04eh,04dh,02ah,039h,0e1h,0fch,002h,0d7h,0f8h,018h,037h,04fh	; 8c3a  6&7.NM*9......7O
	defb 071h,0e0h,0e0h,0ffh	; 8c4a

; ----------------------------------------------------------------------
; DATOS mensaje_8C4E: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:6504 (43 bytes)
;   0x8c4e..0x8c79  (43 bytes)
DATA_mensaje_8C4E:
	defb 003h,0d7h,0e4h,0e4h,0e4h,099h,0c8h,0e4h,0e4h,099h,0c8h,0e4h,0e4h,0e4h,061h,027h	; 8c4e  ..............a'
	defb 05dh,0e1h,0feh,03eh,048h,026h,05dh,04fh,027h,0e1h,0feh,033h,04fh,033h,04fh,09dh	; 8c5e  ]..>H&]O'..3O3O.
	defb 0adh,0bdh,0adh,038h,026h,02eh,027h,02ah,071h,0e0h,0ffh	; 8c6e  ...8&.'*q..

; ----------------------------------------------------------------------
; DATOS mensaje_8C79: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:6504 (70 bytes)
;   0x8c79..0x8cbf  (70 bytes)
DATA_mensaje_8C79:
	defb 0d7h,02bh,02eh,028h,04dh,02ah,0e4h,0e4h,0e4h,02eh,03dh,0f8h,006h,0e6h,0feh,08bh	; 8c79  .+.(M*....=.....
	defb 0adh,088h,081h,0aeh,08ch,05dh,0e6h,0feh,0aeh,08ch,03ah,029h,02ah,02fh,04eh,04dh	; 8c89  .....]....:)*/NM
	defb 0f8h,03eh,03ah,029h,04eh,051h,0feh,034h,029h,032h,062h,029h,0f8h,03eh,03eh,034h	; 8c99  .>:)NQ.4)2b).>>4
	defb 031h,02ah,04dh,0fdh,0f8h,028h,0f8h,069h,03dh,08bh,0d2h,082h,0bfh,05dh,0e4h,0e4h	; 8ca9  1*M..(.i=....]..
	defb 026h,02ch,05ch,071h,0e0h,0ffh	; 8cb9

; ----------------------------------------------------------------------
; DATOS mensaje_8CBF: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:6504 (104 bytes)
;   0x8cbf..0x8d27  (104 bytes)
DATA_mensaje_8CBF:
	defb 003h,0d7h,0e4h,0e4h,084h,0a9h,03dh,0e4h,0e4h,084h,0a9h,03dh,03eh,048h,02fh,051h	; 8cbf  ......=....=>H/Q
	defb 08ah,085h,0feh,092h,03ah,038h,04dh,038h,03eh,0e1h,0feh,029h,0f8h,03eh,03dh,0f8h	; 8ccf  ....:8M8>..).>=.
	defb 066h,03eh,0e1h,0fch,003h,076h,01dh,018h,00bh,015h,00fh,0e4h,0e4h,0e4h,0feh,01dh	; 8cdf  f>...v..........
	defb 019h,016h,013h,00eh,000h,01dh,018h,00bh,015h,00fh,0fch,0d7h,0e4h,0e4h,0e4h,01dh	; 8cef  ................
	defb 018h,00bh,015h,00fh,0e1h,0feh,090h,0ebh,08fh,053h,09ch,0beh,03ah,043h,02dh,034h	; 8cff  .........S..:C-4
	defb 0e4h,0e4h,0feh,039h,05bh,0e1h,0fch,076h,0e4h,0e4h,0e4h,0f8h,024h,03ah,026h,033h	; 8d0f  ...9[..v....$:&3
	defb 026h,05dh,052h,05dh,04fh,027h,0e1h,0ffh	; 8d1f  &]R]O'..

; ----------------------------------------------------------------------
; DATOS mensaje_8D27: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:6504 (61 bytes)
;   0x8d27..0x8d64  (61 bytes)
DATA_mensaje_8D27:
	defb 003h,076h,02eh,0e5h,02eh,04eh,03eh,0e1h,0feh,0e4h,0e4h,0e4h,0bfh,0ebh,0beh,0ebh	; 8d27  .v...N>.........
	defb 0e4h,093h,0a6h,0cfh,0c5h,0e1h,0fch,0d8h,033h,03dh,0f8h,07dh,04ch,05dh,0e6h,0feh	; 8d37  ........3=.}L]..
	defb 086h,091h,097h,051h,0f8h,038h,02dh,061h,04dh,093h,0a6h,0cfh,0c5h,02fh,0e6h,0feh	; 8d47  ...Q.8-aM..../..
	defb 010h,019h,022h,000h,012h,019h,01fh,018h,00eh,00fh,01ch,0e0h,0ffh	; 8d57  .."..........

; ----------------------------------------------------------------------
; DATOS mensaje_8D64: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:6504 (49 bytes)
;   0x8d64..0x8d95  (49 bytes)
DATA_mensaje_8D64:
	defb 0d8h,029h,04eh,03eh,01ch,00fh,00eh,000h,00ch,016h,00bh,01dh,01eh,00fh,01ch,0feh	; 8d64  .)N>............
	defb 02eh,04eh,060h,0f8h,057h,02dh,043h,026h,0e6h,029h,04eh,03dh,0b0h,0a9h,097h,0ebh	; 8d74  .N`.W-C&.)N=....
	defb 0bch,0feh,060h,049h,071h,02ch,04ch,0a7h,0d2h,082h,0a7h,030h,037h,048h,04fh,027h	; 8d84  ..`Iq,L....07HO'
	defb 0ffh	; 8d94

; ----------------------------------------------------------------------
; DATOS mensaje_8D95: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:6504 (79 bytes)
;   0x8d95..0x8de4  (79 bytes)
DATA_mensaje_8D95:
	defb 0dah,043h,071h,037h,034h,05ch,0e6h,01dh,018h,00bh,015h,00fh,0e0h,0feh,029h,04eh	; 8d95  .Cq74\........)N
	defb 03eh,01ah,01ch,00fh,00eh,00bh,01eh,019h,01ch,0e6h,0feh,0b4h,0d0h,0adh,0b0h,0a8h	; 8da5  >...............
	defb 0f8h,04eh,060h,03dh,080h,0adh,0bfh,0cfh,08bh,0d1h,060h,03eh,0feh,029h,04eh,03dh	; 8db5  .N`=......`>.)N=
	defb 0f8h,004h,03ah,060h,04dh,047h,03dh,03eh,026h,039h,026h,0e6h,0fdh,0f8h,072h,0f8h	; 8dc5  ..:`MG=>&9&...r.
	defb 05ch,03dh,09ch,0beh,02ah,061h,027h,02ah,034h,046h,030h,037h,048h,04dh,0ffh	; 8dd5  \=..*a'*4F07HM.

; ----------------------------------------------------------------------
; DATOS mensaje_8DE4: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:6504 (81 bytes)
;   0x8de4..0x8e35  (81 bytes)
DATA_mensaje_8DE4:
	defb 0d9h,029h,04eh,034h,035h,03eh,044h,071h,0f8h,02ah,0f8h,03ch,0f8h,06ah,03dh,080h	; 8de4  .)N45>Dq.*.<.j=.
	defb 0adh,08ah,0feh,091h,0bfh,08fh,081h,01fh,016h,01eh,01ch,00bh,00ch,019h,022h,0feh	; 8df4  ..............".
	defb 05dh,0e6h,0fdh,0f8h,044h,093h,082h,0a7h,0d2h,082h,029h,02ah,02ah,028h,03dh,0b2h	; 8e04  ]...D.....)**(=.
	defb 087h,09ah,0feh,090h,0ebh,0a0h,05dh,0e6h,0fdh,029h,04eh,034h,035h,03ah,0a7h,0d2h	; 8e14  ......]..)N45:..
	defb 082h,0a7h,02fh,04eh,04dh,02eh,038h,0feh,051h,09dh,089h,0a7h,03ah,029h,047h,028h	; 8e24  ../NM.8.Q...:)G(
	defb 0ffh	; 8e34

; ----------------------------------------------------------------------
; DATOS mensaje_8E35: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:6504 (56 bytes)
;   0x8e35..0x8e6d  (56 bytes)
DATA_mensaje_8E35:
	defb 07eh,025h,071h,0e0h,0e4h,0e4h,0e4h,01dh,018h,00bh,015h,00fh,0e6h,0feh,037h,029h	; 8e35  ~%q...........7)
	defb 02ch,04eh,059h,072h,0e4h,0e4h,0e4h,034h,071h,034h,0f8h,01ch,0e5h,081h,086h,0feh	; 8e45  ,NYr...4q4......
	defb 051h,03fh,02bh,038h,071h,034h,04ah,0e6h,0fdh,08bh,0adh,0b7h,082h,053h,047h,034h	; 8e55  Q?+8q4J......SG4
	defb 052h,02ah,071h,034h,052h,059h,072h,0ffh	; 8e65  R*q4RYr.

; ----------------------------------------------------------------------
; DATOS mensaje_8E6D: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:6504 (343 bytes)
;   0x8e6d..0x8fc4  (343 bytes)
DATA_mensaje_8E6D:
	defb 076h,052h,0e1h,087h,0beh,08ch,0b4h,03ah,080h,0b3h,053h,0e1h,0fch,07eh,08bh,0adh	; 8e6d  vR.....:..S..~..
	defb 0c3h,081h,032h,052h,060h,047h,026h,026h,0e5h,01dh,018h,00bh,015h,00fh,0feh,09eh	; 8e7d  ..2R`G&&........
	defb 0a8h,09bh,053h,0f8h,024h,052h,060h,047h,019h,013h,016h,013h,022h,03dh,0feh,08dh	; 8e8d  ..S.$R`G...."=..
	defb 0cfh,088h,081h,0b5h,03eh,0f8h,044h,0b4h,0d2h,082h,0bfh,059h,072h,0e6h,0fdh,09eh	; 8e9d  ....>.D....Yr...
	defb 0a8h,09bh,03eh,0f8h,06fh,0f8h,031h,064h,02ah,026h,0f8h,04fh,0e5h,09eh,0adh,081h	; 8ead  ..>.o.1d*&.O....
	defb 090h,0feh,03dh,0f8h,028h,03dh,034h,046h,03ah,08dh,0cfh,088h,081h,0b5h,051h,03dh	; 8ebd  ..=.(=4F:.....Q=
	defb 02eh,030h,038h,0feh,04dh,0e6h,0fdh,0a3h,091h,03eh,0b1h,0ebh,0a0h,0e4h,09eh,095h	; 8ecd  .08.M....>......
	defb 080h,038h,030h,037h,047h,0f8h,06dh,0f8h,066h,0feh,059h,072h,071h,034h,0e6h,0feh	; 8edd  .807G.m.f.Yrq4..
	defb 0f8h,036h,053h,050h,02ah,04bh,09eh,081h,091h,086h,0e5h,089h,0b4h,0adh,0a4h,095h	; 8eed  .6SP*K..........
	defb 0d1h,0feh,082h,030h,038h,071h,034h,09dh,0bch,059h,072h,0e6h,0fdh,0a3h,091h,03eh	; 8efd  ...08q4..Yr....>
	defb 08ch,082h,0b4h,091h,0f8h,03eh,0e5h,0b1h,0ebh,0a0h,03dh,085h,0ebh,093h,0feh,0a7h	; 8f0d  .....>....=.....
	defb 0cfh,0b4h,03dh,086h,0bdh,0adh,03ah,09eh,081h,087h,0aah,09bh,0c9h,0a8h,0a0h,0feh	; 8f1d  ..=...:.........
	defb 051h,02ah,02ch,030h,034h,04bh,030h,026h,0e6h,0fdh,089h,094h,09fh,038h,026h,027h	; 8f2d  Q*,04K0&.....8&'
	defb 095h,09dh,0adh,03dh,0b1h,0ebh,0a0h,0a1h,0ebh,085h,0feh,0ebh,03dh,017h,01dh,022h	; 8f3d  ...=........=.."
	defb 085h,0ebh,093h,0a7h,0cfh,0b4h,04bh,030h,026h,0fch,002h,076h,017h,01dh,022h,038h	; 8f4d  ......K0&..v.."8
	defb 026h,028h,062h,0f8h,035h,0f8h,00ch,0ebh,03dh,099h,0ebh,0bch,031h,027h,0feh,051h	; 8f5d  &(b.5...=...1'.Q
	defb 042h,02eh,04dh,0c3h,08eh,089h,0adh,0e4h,099h,0ebh,0bch,059h,072h,039h,026h,0feh	; 8f6d  B.M........Yr9&.
	defb 02ah,0fch,07eh,033h,03dh,085h,0ebh,093h,0a7h,0cfh,0b4h,051h,033h,02eh,03dh,0aah	; 8f7d  *.~3=......Q3.=.
	defb 0cfh,085h,0ebh,0feh,03ah,030h,043h,071h,034h,04bh,030h,026h,03dh,059h,072h,0fch	; 8f8d  ....:0Cq4K0&=Yr.
	defb 002h,076h,085h,0afh,03eh,0e1h,0fch,07eh,039h,026h,0e4h,0e4h,0e4h,0aah,051h,050h	; 8f9d  .v..>..~9&....QP
	defb 04bh,039h,02ah,071h,034h,0e6h,0feh,026h,048h,0e4h,0e4h,0e4h,039h,03ah,047h,02bh	; 8fad  K9*q4..&H...9:G+
	defb 026h,037h,029h,04bh,052h,0e0h,0ffh	; 8fbd

; ----------------------------------------------------------------------
; DATOS mensaje_8FC4: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:6504 (446 bytes)
;   0x8fc4..0x9182  (446 bytes)
DATA_mensaje_8FC4:
	defb 002h,07eh,033h,052h,039h,038h,02eh,04fh,02ah,03dh,027h,0e6h,01dh,018h,00bh,015h	; 8fc4  .~3R98.O*='.....
	defb 00fh,0fch,07eh,050h,030h,03eh,0e4h,0e4h,0e4h,02bh,044h,04bh,03dh,0f8h,035h,0f8h	; 8fd4  ..~P0>...+DK=.5.
	defb 00ch,03ah,050h,030h,03dh,0feh,031h,065h,037h,051h,02ah,02dh,037h,026h,034h,052h	; 8fe4  .:P0=.1e7Q*-7&4R
	defb 059h,072h,0e6h,0feh,033h,03dh,034h,046h,03ah,031h,044h,039h,04eh,034h,087h,095h	; 8ff4  Yr..3=4F:1D9N4..
	defb 051h,031h,037h,0fdh,059h,072h,053h,02bh,044h,04bh,03eh,050h,030h,051h,0bdh,093h	; 9004  Q17.YrS+DK>P0Q..
	defb 082h,030h,0e5h,02eh,0feh,038h,057h,038h,02ch,09ah,094h,0adh,030h,034h,0e6h,0fdh	; 9014  .0...8W8,...04..
	defb 050h,030h,03eh,0e4h,0e4h,0e4h,017h,00fh,01eh,00bh,016h,000h,011h,00fh,00bh,01ch	; 9024  P0>.............
	defb 0feh,051h,085h,0adh,08dh,081h,02fh,032h,034h,02ah,071h,034h,03dh,059h,072h,0e0h	; 9034  .Q..../24*q4=Yr.
	defb 0fdh,050h,030h,03dh,0aah,0c1h,0cfh,093h,0aah,0b4h,0ebh,03dh,031h,065h,037h,051h	; 9044  .P0=.......=1e7Q
	defb 02eh,0feh,026h,036h,03ah,0e6h,0fdh,059h,072h,053h,02bh,044h,04bh,03dh,0f8h,039h	; 9054  ..&6:..YrS+DK=.9
	defb 0f8h,029h,02ah,034h,035h,03eh,01dh,00eh,013h,0feh,048h,018h,00fh,00eh,021h,0e5h	; 9064  .)*45>....H...!.
	defb 0bfh,0a9h,081h,0adh,0c1h,0a0h,039h,052h,05ch,03ah,0feh,030h,02ah,086h,0d2h,082h	; 9074  ......9R\:.0*...
	defb 09fh,051h,030h,046h,02fh,039h,02ah,071h,034h,0e0h,0fdh,050h,030h,03eh,0f8h,04ah	; 9084  .Q0F/9*q4..P0>.J
	defb 0f8h,036h,03dh,085h,0aeh,087h,0b4h,0d2h,082h,09dh,082h,051h,039h,0feh,053h,030h	; 9094  .6=........Q9.S0
	defb 039h,053h,04bh,0e4h,0e4h,0e4h,0fdh,017h,00fh,01eh,00bh,016h,000h,011h,00fh,00bh	; 90a4  9SK.............
	defb 01ch,03dh,085h,081h,0a7h,0d2h,082h,0feh,051h,036h,05fh,02dh,034h,0e6h,0b3h,0adh	; 90b4  .=......Q6_-4...
	defb 0b4h,0bdh,0ebh,0a6h,0adh,0bch,03dh,083h,0feh,0adh,0b4h,0d2h,051h,027h,02dh,039h	; 90c4  ......=.....Q'-9
	defb 053h,04bh,0fch,002h,076h,0c6h,093h,0aah,0beh,0cfh,090h,0e6h,0feh,029h,0f8h,03eh	; 90d4  SK..v........).>
	defb 053h,09eh,0a8h,09bh,0f8h,054h,0f8h,023h,051h,0e1h,0fch,002h,07eh,033h,027h,059h	; 90e4  S....T.#Q...~3'Y
	defb 072h,0e6h,061h,027h,030h,037h,047h,019h,013h,016h,013h,022h,03dh,0feh,08dh,0cfh	; 90f4  r.a'07G...."=...
	defb 088h,081h,0b5h,051h,050h,034h,033h,027h,038h,032h,052h,02ah,04bh,059h,0feh,072h	; 9104  ...QP43'82R*KY.r
	defb 0e0h,0fdh,094h,08fh,0ebh,08bh,0d0h,053h,099h,08bh,060h,0f8h,024h,052h,05dh,03dh	; 9114  .......S..`.$R]=
	defb 047h,0e4h,0e4h,0feh,050h,030h,053h,0f8h,045h,0f8h,007h,0f8h,034h,0f8h,04bh,060h	; 9124  G...P0S.E...4.K`
	defb 010h,019h,022h,03ah,0f8h,07bh,0f8h,071h,030h,034h,0feh,02ah,04bh,059h,072h,0fch	; 9134  ..":.{.q04.*KYr.
	defb 002h,076h,025h,03dh,0f8h,028h,03dh,093h,081h,0a9h,0e0h,0e4h,0e4h,0e4h,0fch,07eh	; 9144  .v%=.(=........~
	defb 01dh,018h,00bh,015h,00fh,0e6h,09eh,0a8h,09bh,02ah,04bh,0e5h,026h,048h,094h,08fh	; 9154  .........*K.&H..
	defb 0feh,0ebh,08bh,0d0h,02ah,04bh,025h,05ah,02ah,071h,034h,09eh,0a8h,09bh,03dh,0aah	; 9164  ....*K%Z*q4...=.
	defb 0cfh,0feh,085h,0ebh,03dh,085h,0afh,051h,050h,034h,032h,0e0h,0e0h,0ffh	; 9174  ....=..QP42...

; ----------------------------------------------------------------------
; DATOS mensaje_9182: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:6504 (300 bytes)
;   0x9182..0x92ae  (300 bytes)
DATA_mensaje_9182:
	defb 07eh,08ch,0e5h,08ch,097h,0ebh,087h,0e4h,0e4h,0e4h,0e4h,0fch,003h,07eh,01dh,018h	; 9182  ~............~..
	defb 00bh,015h,00fh,0e4h,0e4h,0a3h,091h,053h,02eh,03dh,043h,043h,029h,0f8h,03eh,0feh	; 9192  .......S.=CC).>.
	defb 051h,0f8h,018h,03dh,053h,031h,03eh,05ah,03eh,039h,026h,0e6h,0fdh,025h,04eh,051h	; 91a2  Q..=S1>Z>9&..%NQ
	defb 0e4h,0e4h,017h,00fh,01eh,00bh,016h,051h,036h,02ah,027h,03eh,05ah,0feh,059h,072h	; 91b2  .......Q6*'>Z.Yr
	defb 0e6h,0fdh,0a0h,0e5h,0a0h,08ch,0a1h,03dh,083h,0a9h,0adh,041h,03dh,0e4h,0e4h,0e4h	; 91c2  .......=...A=...
	defb 0feh,0c5h,0a9h,0b6h,0adh,093h,059h,072h,0e6h,0fdh,025h,04eh,03dh,099h,085h,081h	; 91d2  ......Yr..%N=...
	defb 0f8h,060h,0f8h,061h,051h,0e4h,0e4h,029h,030h,028h,037h,048h,0feh,04dh,0fch,076h	; 91e2  .`.aQ..)0(7H.M.v
	defb 08bh,0adh,0aeh,08fh,017h,00fh,01eh,00bh,016h,000h,011h,00fh,00bh,01ch,03dh,099h	; 91f2  ..............=.
	defb 0feh,085h,081h,0f8h,060h,0f8h,061h,05dh,039h,0e1h,0fch,07eh,050h,030h,03eh,0f8h	; 9202  ....`.a]9..~P0>.
	defb 031h,03dh,0f8h,046h,03dh,0f8h,04ah,0f8h,036h,03dh,085h,0c0h,051h,02eh,028h,04dh	; 9212  1=.F=.J.6=..Q.(M
	defb 0feh,02eh,038h,03eh,060h,02bh,052h,02ah,071h,034h,0e4h,0e4h,0e4h,0fdh,059h,072h	; 9222  ..8>`+R*q4....Yr
	defb 053h,0e5h,0a0h,08ch,0a1h,03eh,035h,053h,027h,0e6h,0feh,0f8h,04ah,053h,050h,03ah	; 9232  S....>5S'...JSP:
	defb 03dh,02eh,030h,037h,02bh,034h,083h,0a9h,0adh,03dh,034h,046h,0feh,03ah,0e4h,0e4h	; 9242  =.07+4...=4F.:..
	defb 0e4h,01dh,018h,00bh,015h,00fh,0fch,002h,076h,017h,00fh,01eh,00bh,016h,000h,011h	; 9252  ........v.......
	defb 00fh,00bh,01ch,03dh,099h,085h,081h,0f8h,060h,0f8h,061h,0feh,03eh,0e1h,0fch,003h	; 9262  ...=....`.a.>...
	defb 07eh,08eh,082h,089h,082h,03dh,027h,031h,026h,086h,0d0h,087h,0bfh,03ah,0b0h,0a9h	; 9272  ~....='1&....:..
	defb 097h,0feh,0ebh,0bch,051h,0e4h,0e4h,0e4h,0feh,02eh,04eh,0f8h,003h,0f8h,00dh,03dh	; 9282  ....Q.....N....=
	defb 0f8h,060h,0f8h,061h,060h,03eh,099h,085h,081h,060h,02bh,052h,0e6h,0feh,0f8h,041h	; 9292  .`.a`>...`+R...A
	defb 03ah,0e4h,0e4h,0e4h,0b0h,0a9h,097h,0ebh,0bch,051h,0e6h,0fbh	; 92a2  :........Q..

; ----------------------------------------------------------------------
; DATOS mensaje_92AE: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:6504 (13 bytes)
;   0x92ae..0x92bb  (13 bytes)
DATA_mensaje_92AE:
	defb 0deh,02eh,071h,035h,05dh,0e5h,01dh,018h,00bh,015h,00fh,0e0h,0fbh	; 92ae  ..q5]........

; ----------------------------------------------------------------------
; DATOS mensaje_92BB: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:6504 (68 bytes)
;   0x92bb..0x92ff  (68 bytes)
DATA_mensaje_92BB:
	defb 003h,076h,00ch,013h,011h,000h,00ch,019h,01dh,01dh,0e4h,0e4h,0e4h,0f8h,038h,02bh	; 92bb  .v............8+
	defb 037h,026h,034h,03dh,02ah,0fch,0d4h,01dh,018h,00bh,015h,00fh,0e4h,0e4h,0e4h,0feh	; 92cb  7&4=*...........
	defb 04ah,027h,02eh,033h,0b3h,0adh,0b4h,0bdh,0ebh,0a6h,0adh,0bch,041h,0e4h,0e4h,0e4h	; 92db  J'.3........A...
	defb 0feh,048h,03eh,04ch,047h,061h,071h,037h,02bh,034h,039h,0e6h,050h,034h,030h,03dh	; 92eb  .H>LGaq7+49.P40=
	defb 047h,038h,041h,0fbh	; 92fb

; ----------------------------------------------------------------------
; DATOS mensaje_92FF: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:6504 (1137 bytes)
;   0x92ff..0x9770  (1137 bytes)
DATA_mensaje_92FF:
	defb 076h,084h,0a9h,03eh,004h,0f8h,053h,0f8h,069h,038h,04ch,036h,026h,037h,026h,04dh	; 92ff  v..>..S.i8L6&7&M
	defb 080h,087h,0a0h,051h,03eh,04bh,026h,03ah,0feh,02bh,034h,0e6h,0fch,0d4h,080h,087h	; 930f  ...Q>K&:.+4.....
	defb 0a0h,0e1h,03eh,04bh,028h,048h,032h,052h,04ah,0e6h,000h,01dh,018h,00bh,015h,00fh	; 931f  ..>K(H2RJ.......
	defb 0e5h,0feh,0e4h,0e4h,0e4h,026h,035h,061h,0e5h,0f8h,03ah,093h,082h,03dh,085h,081h	; 932f  .....&5a..:..=..
	defb 085h,0adh,0e5h,092h,0adh,08bh,0d2h,0adh,0feh,051h,0f8h,063h,050h,071h,034h,047h	; 933f  .........Q.cPq4G
	defb 03dh,03eh,0ebh,0f8h,038h,0e4h,0e4h,0e4h,0f8h,03ah,0f8h,02fh,03ah,0f8h,033h,051h	; 934f  =>..8....:./:.3Q
	defb 029h,02ch,02eh,0feh,038h,03ah,039h,04dh,0e6h,0fch,0d4h,026h,035h,061h,0e5h,09ah	; 935f  ),..8:9M...&5a..
	defb 0d2h,082h,08bh,0d1h,091h,030h,034h,0f8h,03ah,093h,082h,09dh,0adh,098h,082h,03eh	; 936f  .....04.:......>
	defb 003h,0feh,0bch,038h,03ch,045h,04dh,02eh,038h,03eh,039h,026h,03dh,05dh,0e6h,04ah	; 937f  ...8<EM.8>9&=].J
	defb 04ch,086h,0d2h,082h,0a9h,091h,039h,0feh,092h,0adh,08bh,0d2h,0adh,053h,042h,030h	; 938f  L.....9......SB0
	defb 02ch,039h,04dh,0e6h,0fdh,02eh,03dh,061h,027h,030h,04ah,027h,047h,039h,026h,085h	; 939f  ,9M...=a'0J'G9&.
	defb 0adh,085h,087h,0e4h,0e4h,0e4h,0a5h,082h,09ch,081h,0feh,060h,025h,04dh,029h,0f8h	; 93af  ...........`%M).
	defb 03eh,039h,04bh,04ah,02ch,050h,02ah,04dh,03eh,05ah,0e6h,0fdh,029h,043h,028h,034h	; 93bf  >9KJ,P*M>Z..)C(4
	defb 035h,03dh,0a5h,0cfh,086h,0d1h,082h,051h,0a4h,081h,081h,091h,0e5h,044h,034h,030h	; 93cf  5=.....Q.....D40
	defb 037h,0feh,02ch,04eh,04dh,047h,03dh,03eh,088h,0adh,0a7h,0d2h,087h,060h,047h,085h	; 93df  7.,NMG=>.....`G.
	defb 097h,060h,047h,0e5h,01dh,00fh,022h,0feh,060h,047h,039h,026h,0e6h,0feh,034h,05dh	; 93ef  .`G...".`G9&..4]
	defb 03fh,038h,036h,0e4h,0e4h,0e4h,021h,00bh,01ch,0e8h,0f8h,03ah,08eh,082h,0e9h,05dh	; 93ff  ?86...!....:...]
	defb 0e0h,0fdh,050h,034h,030h,03eh,029h,0f8h,03eh,04bh,03ah,033h,03dh,0f8h,02fh,051h	; 940f  ..P40>).>K:3=./Q
	defb 025h,034h,028h,037h,026h,04dh,03dh,05dh,04ah,0feh,029h,0f8h,03eh,04bh,03dh,0f8h	; 941f  %4(7&M=]J.).>K=.
	defb 038h,02bh,053h,026h,051h,039h,0e6h,0fch,002h,076h,0afh,0b6h,0adh,0f8h,01ah,02bh	; 942f  8+S&Q9...v.....+
	defb 061h,04ch,02ah,0e1h,000h,00ch,013h,011h,000h,00ch,019h,01dh,01dh,0fch,0d4h,029h	; 943f  aL*............)
	defb 0f8h,03eh,047h,025h,03dh,02eh,061h,047h,034h,035h,051h,0f8h,018h,034h,05dh,04fh	; 944f  .>G%=.aG45Q..4]O
	defb 027h,0e1h,0feh,0f8h,035h,0f8h,00ch,085h,0cfh,089h,087h,060h,0f8h,038h,043h,04eh	; 945f  '...5......`.8CN
	defb 034h,0f8h,03ah,08eh,082h,0afh,08dh,081h,0f8h,01ah,0e6h,0feh,033h,030h,037h,0f8h	; 946f  4.:.........307.
	defb 025h,03dh,0f8h,03ah,08eh,082h,051h,03ah,039h,027h,0f8h,03ah,0f8h,023h,03dh,034h	; 947f  %=.:..Q:9'.:.#=4
	defb 043h,057h,034h,035h,0fdh,0f8h,03ah,08eh,082h,051h,0a4h,082h,099h,091h,02fh,032h	; 948f  CW45..:..Q..../2
	defb 0e5h,08bh,083h,0adh,030h,0e5h,0afh,08dh,081h,0f8h,01ah,051h,0feh,0f8h,038h,044h	; 949f  ....0......Q..8D
	defb 0e4h,0e4h,0e4h,086h,0d1h,082h,0b2h,0e5h,087h,0adh,0a9h,0adh,030h,037h,0e4h,0e4h	; 94af  ............07..
	defb 0e4h,040h,034h,0feh,034h,063h,0f8h,03ah,0f8h,02fh,03ah,09bh,0c9h,0ebh,0bch,0bdh	; 94bf  .@4.4c.:./:.....
	defb 0cfh,087h,02fh,032h,04dh,0e6h,0fdh,059h,036h,03ah,0f8h,01bh,0f8h,073h,0f8h,048h	; 94cf  ../2M..Y6:...s.H
	defb 039h,08bh,08ch,092h,0a0h,05dh,0e6h,02eh,03dh,0f8h,035h,03ah,025h,04bh,033h,026h	; 94df  9....]..=.5:%K3&
	defb 0feh,03eh,034h,028h,04dh,02eh,038h,03eh,039h,026h,0e6h,000h,050h,04eh,050h,04eh	; 94ef  .>4(M.8>9&..PNPN
	defb 03dh,0a2h,087h,09ah,0d2h,082h,0feh,0e4h,0e4h,0e4h,0f8h,038h,02bh,053h,026h,047h	; 94ff  =..........8+S&G
	defb 0e6h,0fch,002h,076h,08bh,0d2h,087h,03ah,025h,064h,04eh,04dh,02eh,038h,03eh,039h	; 950f  ...v...:%dNM.8>9
	defb 026h,0e4h,0e4h,038h,060h,047h,026h,026h,034h,0feh,026h,03dh,02ah,0e0h,0fch,0d4h	; 951f  &..8`G&&4.&=*...
	defb 050h,034h,030h,047h,029h,0f8h,03eh,047h,0e5h,0f8h,03ah,0f8h,02fh,060h,02eh,033h	; 952f  P40G).>G..:./`.3
	defb 086h,08bh,0d2h,082h,085h,090h,05dh,053h,0feh,087h,095h,041h,02ah,028h,04eh,062h	; 953f  ......]S...A*(Nb
	defb 0bfh,086h,0a5h,082h,039h,0bbh,087h,05dh,0e6h,0fdh,050h,04eh,050h,04eh,03dh,086h	; 954f  ....9..]..PNPN=.
	defb 0b1h,0adh,051h,038h,04ch,03ah,02ch,04dh,03dh,03eh,0e5h,032h,026h,05bh,026h,0feh	; 955f  ..Q8L:,M=>.2&[&.
	defb 0f8h,07fh,071h,06bh,026h,08bh,0d1h,082h,085h,0adh,08bh,03dh,0b4h,0d0h,0ebh,094h	; 956f  ..qk&......=....
	defb 0a7h,08ch,093h,02ch,04bh,026h,0feh,05dh,04fh,027h,037h,0e6h,0fdh,029h,0f8h,03eh	; 957f  ...,K&.]O'7..).>
	defb 047h,050h,034h,030h,047h,0f8h,03ah,0f8h,02fh,060h,0e5h,03dh,034h,04eh,0f8h,024h	; 958f  GP40G.:./`.=4N.$
	defb 03bh,043h,060h,02eh,02eh,03ah,0feh,03dh,02eh,04dh,030h,02ah,039h,026h,03dh,05dh	; 959f  .C`..:.=.M0*9&=]
	defb 0e6h,0fch,002h,076h,0e4h,0e4h,0e4h,084h,0a9h,03dh,0f8h,03ah,026h,03eh,0e5h,034h	; 95af  ...v.....=.:&>.4
	defb 05dh,03fh,038h,036h,0e6h,086h,08ah,09eh,02ah,04bh,0feh,0b4h,0a4h,082h,03ah,039h	; 95bf  ]?86....*K....:9
	defb 04dh,034h,046h,03ah,0e5h,080h,087h,0a0h,051h,03eh,04bh,027h,034h,046h,03ah,0e5h	; 95cf  M4F:....Q>K'4F:.
	defb 0feh,0e4h,0e4h,0e4h,00ch,013h,011h,000h,00ch,019h,01dh,01dh,0e5h,086h,08ah,09eh	; 95df  ................
	defb 051h,034h,029h,031h,0e0h,0fch,0d4h,061h,035h,04bh,053h,02ah,071h,037h,047h,050h	; 95ef  Q4)1...a5KS*q7GP
	defb 04eh,050h,04eh,03dh,034h,034h,02ah,026h,03eh,029h,050h,04bh,0feh,039h,026h,0e6h	; 95ff  NPN=44*&>)PK.9&.
	defb 000h,099h,081h,0f8h,01ah,03eh,0f8h,03ah,0f8h,02fh,02ah,04bh,085h,081h,09dh,082h	; 960f  .....>.:./*K....
	defb 02fh,04eh,04dh,053h,0e5h,0feh,08bh,0d2h,082h,0f8h,01ah,03eh,0f8h,03ah,0f8h,02fh	; 961f  /NMS.......>.:./
	defb 03ah,03dh,02eh,04dh,0e6h,0fdh,033h,030h,037h,0e5h,0f8h,038h,02bh,03dh,02eh,071h	; 962f  :=.M..307..8+=.q
	defb 034h,0f8h,01ah,03eh,0f8h,024h,03bh,043h,060h,0f8h,03ah,0f8h,023h,038h,030h,037h	; 963f  4..>.$.C`.:.#807
	defb 0feh,0f8h,052h,0f8h,038h,051h,043h,071h,038h,027h,031h,04dh,03dh,05dh,0e6h,0fch	; 964f  ..R.8QCq8'1M=]..
	defb 003h,076h,0a9h,081h,0aeh,081h,047h,025h,04dh,0e6h,0feh,084h,0a9h,03eh,0e4h,0e4h	; 965f  .v....G%M....>..
	defb 0f8h,052h,0f8h,038h,051h,025h,026h,030h,037h,026h,04dh,0e6h,0fch,0d4h,01dh,018h	; 966f  .R.8Q%&07&M.....
	defb 00bh,015h,00fh,0e5h,050h,02ah,071h,034h,0e6h,0feh,050h,034h,030h,053h,086h,08ah	; 967f  ....P*q4..P40S..
	defb 09eh,051h,087h,098h,082h,02ah,04bh,085h,081h,09dh,082h,030h,037h,048h,04fh,0feh	; 968f  .Q...*K....07HO.
	defb 027h,0e6h,047h,038h,0b4h,0d2h,082h,085h,0adh,03dh,04ah,030h,044h,05dh,0feh,0e4h	; 969f  '.G8.....=J0D]..
	defb 0e4h,0e4h,04bh,02ch,03ah,030h,037h,048h,04dh,0e6h,0fch,002h,076h,047h,027h,025h	; 96af  ..K,:07HM...vG'%
	defb 052h,034h,03dh,032h,050h,03ah,03eh,039h,04bh,052h,0e0h,0fch,0d4h,042h,027h,0e1h	; 96bf  R4=2P:>9KR...B'.
	defb 0e4h,0e4h,0e4h,033h,03dh,0f8h,043h,060h,0e5h,0bfh,086h,047h,039h,030h,03ah,0e4h	; 96cf  ...3=.C`...G90:.
	defb 0e4h,0e4h,0feh,02eh,03dh,050h,034h,030h,03ah,0e1h,0feh,08bh,0d2h,082h,08ah,0adh	; 96df  ....=P40:.......
	defb 053h,025h,04dh,038h,026h,027h,03dh,02ah,0e0h,0e1h,0fch,076h,02fh,026h,057h,043h	; 96ef  S%M8&'=*...v/&WC
	defb 060h,02dh,071h,030h,037h,025h,02bh,04bh,046h,039h,026h,0e6h,000h,026h,02ah,039h	; 96ff  `-q07%+KF9&..&*9
	defb 04dh,0feh,086h,0d1h,082h,090h,060h,047h,08dh,081h,089h,082h,051h,081h,0a1h,0ebh	; 970f  M.....`G....Q...
	defb 0b4h,031h,04dh,0e6h,0feh,0e4h,0e4h,0e4h,025h,052h,034h,03dh,02eh,038h,062h,05dh	; 971f  .1M.....%R4=.8b]
	defb 0e6h,0fch,002h,0d4h,050h,034h,030h,047h,0f8h,028h,03ah,03eh,025h,048h,043h,04ch	; 972f  ....P40G.(:>%HCL
	defb 051h,029h,02ah,031h,0e6h,0fdh,01dh,018h,00bh,015h,00fh,071h,0e0h,0feh,0e4h,0e4h	; 973f  Q)*1.......q....
	defb 0e4h,02eh,052h,061h,02eh,033h,02fh,026h,057h,03dh,034h,034h,02ah,026h,05dh,0e6h	; 974f  ..Ra.3/&W=44*&].
	defb 0feh,081h,0cfh,085h,081h,02bh,04ch,03dh,0e4h,0e4h,0e4h,02eh,026h,071h,0e0h,0e0h	; 975f  .....+L=....&q..
	defb 0fbh	; 976f

; ----------------------------------------------------------------------
; DATOS mensajes_9770: 3 mensajes con el formato de p01:66C4 (letras hasta
;   0xFF o 0xFB) a los que no apunta ninguna de las tablas de mensajes que lee
;   el codigo
;   0x9770..0x979a  (42 bytes)
DATA_mensajes_9770:
	defb 003h,0d4h,01dh,018h,00bh,015h,00fh,0e0h,0e0h,0ffh,003h,0d4h,043h,05dh,05dh,0e4h	; 9770  ............C]].
	defb 0e4h,0e4h,043h,05dh,043h,05dh,0e4h,0e4h,0e4h,0ffh,003h,0d4h,01dh,018h,00bh,015h	; 9780  ..C]C]..........
	defb 00fh,0e4h,0e4h,0e4h,043h,05dh,05dh,0e4h,0e4h,0ffh	; 9790  ....C]]...

; ----------------------------------------------------------------------
; DATOS mensaje_979A: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:6504 (104 bytes)
;   0x979a..0x9802  (104 bytes)
DATA_mensaje_979A:
	defb 002h,07fh,01dh,018h,00bh,015h,00fh,0e0h,02eh,03dh,017h,00fh,01eh,00bh,016h,000h	; 979a  .........=......
	defb 011h,00fh,0feh,00bh,01ch,03ah,099h,085h,081h,0f8h,060h,0f8h,061h,039h,05ch,039h	; 97aa  .....:....`.a9\9
	defb 026h,050h,0e6h,0feh,029h,026h,066h,04eh,0f8h,00fh,0f8h,01ah,03dh,03fh,038h,04ch	; 97ba  &P..)&fN....=?8L
	defb 04ah,053h,04ch,05dh,0e0h,0fch,002h,076h,010h,019h,022h,02ah,0e1h,0e4h,0e4h,0e4h	; 97ca  JSL]...v.."*....
	defb 061h,02eh,03ah,026h,04dh,0e1h,0fch,07fh,031h,055h,0f8h,00bh,028h,04dh,02fh,0e5h	; 97da  a.:&M...1U..(M/.
	defb 01dh,018h,00bh,015h,00fh,0e6h,0feh,08bh,0d2h,082h,0a1h,0adh,03dh,0bch,080h,051h	; 97ea  ............=..Q
	defb 0f8h,07dh,071h,037h,02eh,026h,0e0h,0ffh	; 97fa  .}q7.&..

; ----------------------------------------------------------------------
; DATOS mensaje_9802: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:6504 (66 bytes)
;   0x9802..0x9844  (66 bytes)
DATA_mensaje_9802:
	defb 002h,07fh,01dh,018h,00bh,015h,00fh,0e0h,0feh,084h,0a9h,047h,0e4h,0e4h,02eh,03dh	; 9802  ...........G...=
	defb 017h,00fh,01eh,00bh,016h,000h,011h,00fh,00bh,0feh,01ch,047h,0a0h,085h,08bh,038h	; 9812  ...........G...8
	defb 03eh,035h,053h,027h,0e6h,0fdh,0f8h,072h,0f8h,05ch,03dh,086h,0d2h,082h,09bh,038h	; 9822  >5S'...r.\=....8
	defb 099h,081h,0c1h,087h,085h,0adh,051h,0f8h,063h,0feh,025h,050h,032h,037h,048h,04dh	; 9832  ......Q.c.%P27HM
	defb 0e0h,0ffh	; 9842

; ----------------------------------------------------------------------
; DATOS mensaje_9844: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:6504 (34 bytes)
;   0x9844..0x9866  (34 bytes)
DATA_mensaje_9844:
	defb 003h,076h,02eh,02eh,03eh,0e1h,0fch,07fh,088h,0cfh,090h,0d0h,087h,051h,036h,02dh	; 9844  .v..>........Q6-
	defb 04dh,03ah,03eh,08ah,081h,089h,082h,03dh,0feh,0a7h,0adh,0b0h,059h,072h,039h,026h	; 9854  M:>....=....Yr9&
	defb 02ah,0ffh	; 9864

; ----------------------------------------------------------------------
; DATOS mensaje_9866: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:6504 (166 bytes)
;   0x9866..0x990c  (166 bytes)
DATA_mensaje_9866:
	defb 07fh,01dh,018h,00bh,015h,00fh,0e6h,03fh,02fh,030h,064h,04ch,05dh,039h,0e4h,0e4h	; 9866  .......?/0dL]9..
	defb 0e4h,0feh,02eh,03dh,0b4h,0a6h,081h,0b1h,0adh,03dh,0f8h,046h,060h,0e4h,0e4h,0e4h	; 9876  ...=.....=.F`...
	defb 08ch,0bbh,060h,0feh,061h,027h,05dh,0e1h,0fch,003h,076h,090h,086h,0adh,0e4h,09bh	; 9886  ..`.a']...v.....
	defb 0c8h,081h,093h,02ah,0fch,07fh,010h,019h,022h,000h,012h,019h,01fh,018h,00eh,08ah	; 9896  ...*....".......
	defb 081h,089h,082h,03dh,0a6h,081h,0feh,0bdh,0a8h,0e6h,084h,0a9h,03eh,029h,043h,028h	; 98a6  ...=........>)C(
	defb 038h,048h,04eh,04dh,0f8h,028h,051h,0f8h,031h,0feh,043h,035h,03ah,030h,037h,026h	; 98b6  8HNM.(Q.1.C5:07&
	defb 034h,0e0h,0fch,002h,076h,010h,019h,022h,0e0h,086h,08ah,09eh,03dh,02ch,02fh,04ch	; 98c6  4...v.."....=,/L
	defb 02bh,071h,034h,08bh,0d2h,0feh,082h,097h,051h,034h,034h,02bh,02bh,039h,029h,030h	; 98d6  +q4.....Q44++9)0
	defb 037h,048h,04dh,071h,0e0h,0fch,002h,07fh,01dh,018h,00bh,015h,00fh,0e0h,0feh,010h	; 98e6  7HMq............
	defb 019h,022h,03dh,08bh,0d2h,082h,0b2h,082h,03dh,038h,027h,038h,02fh,051h,029h,0feh	; 98f6  ."=.....=8'8/Q).
	defb 047h,026h,030h,04eh,0e0h,0fbh	; 9906

; ----------------------------------------------------------------------
; DATOS mensaje_990C: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:6504 (903 bytes)
;   0x990c..0x9c93  (903 bytes)
DATA_mensaje_990C:
	defb 07fh,01dh,018h,00bh,015h,00fh,0e4h,0e4h,0e4h,0feh,061h,027h,048h,04bh,010h,019h	; 990c  ..........a'HK..
	defb 022h,03dh,08bh,0d2h,082h,0b2h,082h,051h,049h,05ah,04dh,0f8h,028h,053h,02bh,034h	; 991c  "=.....QIZM.(S+4
	defb 0feh,04bh,030h,026h,039h,0fch,003h,076h,010h,019h,022h,0e4h,0e4h,0e4h,039h,05bh	; 992c  .K0&9..v.."...9[
	defb 05dh,0e1h,0fch,07fh,084h,0a9h,03eh,0e4h,0e4h,029h,0f8h,03eh,038h,035h,053h,071h	; 993c  ].....>..).>85Sq
	defb 037h,0e5h,09bh,087h,0b3h,091h,039h,0f8h,076h,0f8h,02fh,03ah,0feh,025h,04dh,0e6h	; 994c  7.....9.v./:.%M.
	defb 0fdh,00ch,013h,011h,000h,00ch,019h,01dh,01dh,03eh,029h,0f8h,03eh,03ah,038h,071h	; 995c  .........>).>:8q
	defb 037h,03eh,034h,052h,039h,04dh,0b4h,0feh,0d2h,082h,085h,0adh,03ah,031h,054h,039h	; 996c  7>4R9M......:1T9
	defb 02ah,036h,034h,02ah,047h,030h,04eh,052h,053h,0e6h,0feh,084h,0a9h,03eh,085h,0a9h	; 997c  *64*G0NRS....>..
	defb 03ah,003h,0bch,0e5h,0f8h,065h,051h,0f8h,014h,050h,04eh,034h,0e6h,0feh,0bfh,08fh	; 998c  :....eQ..PN4....
	defb 081h,03ah,0f8h,049h,04dh,05ah,071h,038h,0f8h,003h,0f8h,03eh,03dh,02eh,038h,05dh	; 999c  .:.IMZq8...>=.8]
	defb 0e6h,0fdh,084h,0a9h,03eh,0c0h,093h,094h,0a0h,060h,03dh,003h,0f8h,035h,05dh,071h	; 99ac  ....>....`=..5]q
	defb 034h,0e4h,0e4h,0e4h,0feh,0f8h,075h,0f8h,028h,0e5h,099h,087h,0f8h,052h,038h,03dh	; 99bc  4.....u.(....R8=
	defb 003h,0f8h,035h,03eh,08bh,0d1h,082h,0f8h,03ah,0b2h,047h,099h,087h,0aeh,081h,0feh	; 99cc  ..5>....:.G.....
	defb 02fh,04eh,086h,0d2h,082h,08dh,081h,0aah,082h,0bch,082h,051h,030h,026h,04bh,04eh	; 99dc  /N.........Q0&KN
	defb 037h,026h,034h,03dh,0feh,05dh,0e6h,0fdh,025h,03dh,0f8h,052h,03eh,025h,03dh,0b4h	; 99ec  7&4=.]..%=.R>%=.
	defb 0b2h,087h,02ah,04bh,084h,0a9h,051h,0f8h,014h,071h,037h,02ch,04eh,034h,0e6h,0feh	; 99fc  ..*K..Q..q7,N4..
	defb 02eh,02eh,03dh,0f8h,03dh,0f8h,001h,034h,035h,03dh,04ah,027h,03ah,0e4h,0e4h,0e4h	; 9a0c  ..=.=..45=J':...
	defb 0fdh,003h,0bch,0f8h,067h,03eh,0a2h,0b3h,0adh,0beh,0ebh,087h,0e6h,0feh,0a9h,0a2h	; 9a1c  ....g>..........
	defb 094h,0f8h,012h,038h,030h,037h,0b2h,082h,0a2h,0adh,02fh,04eh,037h,026h,034h,038h	; 9a2c  ...807..../N7&48
	defb 02eh,04fh,051h,034h,0feh,031h,02dh,04bh,04eh,034h,0e6h,033h,03dh,0f8h,028h,0e5h	; 9a3c  .OQ4.1-KN4.3=.(.
	defb 084h,0a9h,03eh,044h,044h,047h,03eh,039h,047h,033h,053h,0feh,04eh,0e4h,0e4h,0e4h	; 9a4c  ..>DDG>9G3S.N...
	defb 03fh,061h,026h,0b4h,0d2h,082h,08fh,081h,05dh,071h,034h,0fch,002h,076h,084h,0adh	; 9a5c  ?a&.....]q4..v..
	defb 0aeh,083h,08bh,03dh,036h,047h,04ch,02ah,0e0h,0e0h,02eh,04eh,053h,0e4h,0e4h,0e4h	; 9a6c  ...=6GL*...NS...
	defb 0fch,07fh,033h,027h,060h,03eh,039h,026h,0e6h,084h,0a9h,03eh,0f8h,03ah,08eh,082h	; 9a7c  ..3'`>9&...>.:..
	defb 053h,03ah,02ch,026h,0e6h,0feh,02eh,02eh,03dh,02eh,061h,047h,034h,035h,03dh,04ah	; 9a8c  S:,&....=.aG45=J
	defb 027h,03ah,0e6h,0feh,05dh,053h,0e4h,0e4h,0e4h,084h,0a9h,03ah,03eh,0f8h,03ah,08eh	; 9a9c  ':..]S.....:>.:.
	defb 082h,053h,09ah,091h,0a5h,082h,05dh,0e6h,0fdh,084h,0a9h,034h,035h,03dh,04ah,027h	; 9aac  .S....]....45=J'
	defb 039h,0f8h,03ah,08eh,082h,048h,03eh,081h,0cfh,0c3h,0adh,0f8h,02bh,0f8h,00bh,060h	; 9abc  9.:..H>.....+..`
	defb 03eh,0feh,0f8h,038h,02bh,037h,03eh,026h,02dh,039h,026h,0e6h,084h,0a9h,034h,035h	; 9acc  >..8+7>&-9&...45
	defb 0e5h,0f8h,03ah,08eh,082h,048h,03ah,03eh,0f8h,03ah,0feh,0f8h,02fh,053h,09ah,091h	; 9adc  ..:..H:>.:../S..
	defb 0a5h,082h,039h,052h,05dh,0e6h,0fdh,00ch,019h,01dh,01dh,03eh,084h,0a9h,034h,035h	; 9aec  ..9R]......>..45
	defb 03ah,034h,034h,02ah,027h,0f8h,02fh,051h,025h,034h,028h,037h,02ch,0feh,04eh,04dh	; 9afc  :44*'./Q%4(7,.NM
	defb 0e6h,047h,071h,037h,0f8h,038h,043h,04eh,034h,093h,082h,08eh,082h,09dh,0adh,098h	; 9b0c  .Gq7.8CN4.......
	defb 082h,051h,057h,043h,0feh,02ah,031h,02eh,038h,03eh,060h,02bh,039h,026h,0e6h,0fdh	; 9b1c  .QWC.*1.8>`+9&..
	defb 0e4h,0e4h,0e4h,084h,0a9h,03eh,0f8h,03ah,0f8h,02fh,060h,0f8h,038h,043h,04eh,037h	; 9b2c  .....>.:./`.8CN7
	defb 0e4h,0e4h,0f8h,03ah,0f8h,02fh,060h,0f8h,024h,03bh,0e6h,0feh,01dh,018h,00bh,015h	; 9b3c  ...:./`.$.......
	defb 00fh,0e4h,0e4h,0e4h,084h,0a9h,034h,035h,03eh,034h,034h,02ah,027h,030h,02ah,0e4h	; 9b4c  ......45>44*'0*.
	defb 0e4h,0feh,034h,034h,02ah,027h,030h,02ah,039h,026h,0e6h,0f8h,052h,051h,0e4h,0e4h	; 9b5c  ..44*'0*9&..RQ..
	defb 043h,030h,037h,0e5h,0f8h,051h,051h,030h,025h,0feh,050h,032h,03ah,031h,04dh,02eh	; 9b6c  C07..QQ0%.P2:1M.
	defb 038h,039h,052h,05ch,0e4h,0e4h,0e4h,060h,02bh,048h,030h,03ch,06fh,0fch,003h,076h	; 9b7c  89R\...`+H0<o..v
	defb 085h,098h,0b4h,0d2h,03dh,02eh,038h,02ah,0e4h,0e4h,0e4h,0fch,07fh,084h,0a9h,03ah	; 9b8c  ....=.8*.......:
	defb 03eh,0b8h,081h,081h,0adh,0b0h,0e4h,081h,0adh,0e4h,080h,087h,08bh,0d2h,0adh,053h	; 9b9c  >..............S
	defb 03ah,0f8h,01bh,0feh,026h,05dh,0fch,076h,010h,019h,022h,0e5h,0f8h,07fh,0f8h,031h	; 9bac  :...&].v.."....1
	defb 030h,04fh,0e6h,084h,0a9h,03eh,02dh,071h,030h,037h,029h,0f8h,03eh,03dh,04ah,027h	; 9bbc  0O...>-q07).>=J'
	defb 0feh,03ah,03eh,039h,04bh,052h,0fch,003h,07fh,033h,03dh,02eh,038h,062h,0e4h,0e4h	; 9bcc  .:>9KR...3=.8b..
	defb 0e4h,025h,03dh,0f8h,035h,041h,044h,048h,056h,03ah,047h,071h,037h,026h,02ch,0feh	; 9bdc  .%=.5ADHV:Gq7&,.
	defb 0e4h,0e4h,0e4h,027h,043h,02ch,048h,04eh,04ah,0e5h,01dh,018h,00bh,015h,00fh,0e6h	; 9bec  ...'C,HNJ.......
	defb 0feh,0e4h,0e4h,0e4h,09bh,0c8h,0adh,03dh,086h,08fh,081h,051h,027h,04bh,054h,04dh	; 9bfc  .......=...Q'KTM
	defb 039h,04ah,0fch,002h,076h,09bh,0c8h,0adh,03dh,086h,08fh,081h,0e1h,0e0h,0e4h,0e4h	; 9c0c  9J..v...=.......
	defb 033h,027h,02ah,0e0h,0feh,010h,019h,022h,05dh,071h,034h,03dh,02ah,0e4h,0e4h,025h	; 9c1c  3'*...."]q4=*..%
	defb 03dh,0a0h,08dh,0adh,03eh,0fch,07fh,084h,0a9h,03dh,050h,053h,043h,043h,03dh,0b8h	; 9c2c  =...>....=PSCC=.
	defb 081h,08bh,0d2h,082h,02fh,0e4h,0e4h,0e4h,0feh,02fh,02bh,03ah,026h,02ch,05bh,0e6h	; 9c3c  ..../..../+:&,[.
	defb 01dh,018h,00bh,015h,00fh,0fch,076h,03fh,038h,04ch,059h,072h,039h,026h,05bh,0e5h	; 9c4c  ......v?8LYr9&[.
	defb 09bh,0a6h,0adh,087h,0e6h,0feh,045h,02eh,027h,060h,094h,08fh,0ebh,08bh,0d0h,053h	; 9c5c  ......E.'`.....S
	defb 043h,071h,037h,026h,04dh,0fch,003h,07fh,0e4h,0e4h,0e4h,094h,08fh,0ebh,08bh,0d0h	; 9c6c  Cq7&M...........
	defb 0e4h,0e4h,0e4h,0fch,003h,07fh,0e4h,0e4h,0e4h,025h,04ch,053h,038h,027h,0e4h,0e4h	; 9c7c  .........%LS8'..
	defb 0e4h,01dh,018h,00bh,015h,00fh,0fbh	; 9c8c

; ----------------------------------------------------------------------
; DATOS mensaje_9C93: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p01:6504 (38 bytes)
;   0x9c93..0x9cb9  (38 bytes)
DATA_mensaje_9C93:
	defb 002h,07fh,01dh,018h,00bh,015h,00fh,0e0h,0feh,085h,0ebh,093h,0a7h,0cfh,0b4h,03eh	; 9c93  ...............>
	defb 047h,04bh,071h,037h,026h,02ch,05ch,0e5h,0feh,0e4h,0e4h,0e4h,048h,02dh,0f8h,024h	; 9ca3  GKq7&,\.....H-.$
	defb 03bh,053h,026h,026h,0e0h,0ffh	; 9cb3

; ----------------------------------------------------------------------
; DATOS mensaje_9CB9: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (22 bytes)
;   0x9cb9..0x9ccf  (22 bytes)
DATA_mensaje_9CB9:
	defb 076h,030h,0e5h,030h,043h,071h,034h,0e0h,0e0h,0feh,0e4h,0e4h,0e4h,08fh,09eh,053h	; 9cb9  v0.0Cq4........S
	defb 02bh,04eh,034h,071h,0e0h,0ffh	; 9cc9

; ----------------------------------------------------------------------
; DATOS mensaje_9CCF: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (10 bytes)
;   0x9ccf..0x9cd9  (10 bytes)
DATA_mensaje_9CCF:
	defb 002h,078h,01dh,018h,00bh,015h,00fh,0e1h,0e0h,0ffh	; 9ccf  .x........

; ----------------------------------------------------------------------
; DATOS mensaje_9CD9: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (18 bytes)
;   0x9cd9..0x9ceb  (18 bytes)
DATA_mensaje_9CD9:
	defb 002h,078h,09ch,0a7h,05dh,050h,071h,0e4h,0e4h,034h,031h,02ah,071h,034h,03dh,04ah	; 9cd9  .x..]Pq..41*q4=J
	defb 0e0h,0ffh	; 9ce9

; ----------------------------------------------------------------------
; DATOS mensaje_9CEB: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (18 bytes)
;   0x9ceb..0x9cfd  (18 bytes)
DATA_mensaje_9CEB:
	defb 003h,076h,087h,0a7h,08ch,09eh,08ch,03ah,0f8h,069h,03ah,0f8h,01bh,027h,02ah,039h	; 9ceb  .v.....:.i:..'*9
	defb 0e1h,0ffh	; 9cfb

; ----------------------------------------------------------------------
; DATOS mensaje_9CFD: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (26 bytes)
;   0x9cfd..0x9d17  (26 bytes)
DATA_mensaje_9CFD:
	defb 003h,078h,043h,05dh,0a4h,082h,08bh,0d2h,087h,03ah,03eh,0f8h,069h,03ah,0f8h,01bh	; 9cfd  .xC].....:>.i:..
	defb 027h,050h,0e6h,0feh,01dh,018h,00bh,015h,00fh,0ffh	; 9d0d  'P........

; ----------------------------------------------------------------------
; DATOS mensaje_9D17: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (21 bytes)
;   0x9d17..0x9d2c  (21 bytes)
DATA_mensaje_9D17:
	defb 003h,076h,026h,02eh,027h,02ah,0e4h,0e4h,0e4h,0feh,086h,0a7h,08ch,093h,03eh,03ah	; 9d17  .v&.'*........>:
	defb 056h,039h,026h,02fh,0ffh	; 9d27

; ----------------------------------------------------------------------
; DATOS mensajes_9D2C: 19 mensajes con el formato de p01:66C4 (letras hasta
;   0xFF o 0xFB) a los que no apunta ninguna de las tablas de mensajes que lee
;   el codigo
;   0x9d2c..0x9fa9  (637 bytes)
DATA_mensajes_9D2C:
	defb 077h,057h,02ch,04fh,027h,05dh,071h,034h,039h,0e5h,01dh,018h,00bh,015h,00fh,0e4h	; 9d2c  wW,O']q49.......
	defb 0e4h,0e4h,0feh,061h,027h,05dh,0e1h,0feh,047h,027h,026h,035h,061h,0e4h,0e4h,0bfh	; 9d3c  ...a']..G'&5a...
	defb 08fh,081h,041h,047h,061h,04bh,039h,026h,02ah,0e1h,0ffh,003h,076h,0e4h,0e4h,0e4h	; 9d4c  ..AGaK9&*...v...
	defb 080h,087h,0a0h,03eh,03eh,04eh,034h,0e6h,084h,0a9h,03eh,0b4h,0a4h,082h,05dh,0ffh	; 9d5c  ...>>N4...>...].
	defb 077h,033h,027h,02ah,0e4h,0e4h,0e4h,0b3h,0adh,097h,0adh,05dh,0e6h,0feh,038h,02eh	; 9d6c  w3'*.......]..8.
	defb 04fh,060h,025h,03dh,085h,0ebh,093h,0a7h,0cfh,0b4h,05dh,053h,0e4h,0e4h,0e4h,0f8h	; 9d7c  O`%=......]S....
	defb 072h,0f8h,075h,03ah,09eh,0feh,0a8h,09bh,0f8h,054h,0f8h,023h,03dh,03dh,02eh,030h	; 9d8c  r.u:.....T.#==.0
	defb 034h,047h,03dh,039h,03dh,02ah,0e1h,0e1h,0ffh,078h,085h,0ebh,093h,0a7h,0cfh,0b4h	; 9d9c  4G=9=*...x......
	defb 051h,025h,02dh,037h,044h,034h,04bh,0e1h,0ffh,076h,033h,03dh,09ah,091h,0a5h,082h	; 9dac  Q%-7D4K..v3=....
	defb 03eh,039h,026h,0e6h,084h,0a9h,053h,047h,035h,02ah,028h,071h,034h,03dh,03eh,0feh	; 9dbc  >9&...SG5*(q4=>.
	defb 043h,035h,053h,026h,039h,02ch,09eh,0a8h,09bh,0f8h,054h,0f8h,023h,03dh,03dh,02eh	; 9dcc  C5S&9,....T.#==.
	defb 030h,034h,085h,0ebh,093h,0a7h,0cfh,0feh,0b4h,05dh,0e6h,0feh,033h,03dh,043h,043h	; 9ddc  04.......]..3=CC
	defb 017h,01dh,022h,03ah,02fh,030h,02eh,052h,060h,044h,04fh,0ffh,077h,050h,02ah,071h	; 9dec  ..":/0.R`DO.wP*q
	defb 034h,0e4h,0e4h,0e4h,04ah,030h,071h,0ffh,003h,078h,0e4h,0e4h,0e4h,039h,03ah,0e1h	; 9dfc  4...J0q..x...9:.
	defb 0e4h,0e4h,0e4h,039h,03ah,047h,02ah,050h,04bh,039h,026h,050h,0ffh,077h,02eh,0e5h	; 9e0c  ...9:G*PK9&P.w..
	defb 02eh,04eh,03eh,0e4h,0e4h,0e4h,0feh,033h,027h,02ah,0e5h,01dh,018h,00bh,015h,00fh	; 9e1c  .N>....3'*......
	defb 03dh,0f8h,019h,027h,0f8h,07dh,04ch,05dh,071h,0e0h,0feh,02eh,04eh,03eh,043h,054h	; 9e2c  =..'.}L]q...N>CT
	defb 04eh,047h,039h,02ch,09eh,0a8h,09bh,0f8h,054h,0f8h,023h,03dh,03dh,02eh,030h,034h	; 9e3c  NG9,....T.#==.04
	defb 085h,0ebh,0feh,093h,0a7h,0cfh,0b4h,0ffh,078h,039h,052h,03dh,0f8h,026h,0e1h,0e4h	; 9e4c  ........x9R=.&..
	defb 0e4h,050h,034h,030h,03ah,03eh,039h,03ah,047h,0f8h,018h,028h,039h,026h,050h,0ffh	; 9e5c  .P40:>9:G..(9&P.
	defb 076h,042h,04bh,071h,0e5h,04ah,02ch,0f8h,018h,04dh,052h,05dh,0e4h,0e4h,0e4h,09eh	; 9e6c  vBKq.J,..MR]....
	defb 0a8h,09bh,0f8h,054h,0f8h,023h,03dh,08ah,081h,0feh,0adh,053h,030h,04dh,02fh,04eh	; 9e7c  ...T.#=....S0M/N
	defb 037h,026h,04dh,0e4h,0e4h,0e4h,0feh,02eh,02eh,0e5h,015h,013h,019h,000h,017h,00bh	; 9e8c  7&M.............
	defb 01ch,020h,03dh,09bh,0a8h,097h,0ebh,0a0h,053h,0ffh,078h,025h,071h,0e5h,042h,052h	; 9e9c  . =.....S.x%q.BR
	defb 038h,0e4h,0e4h,02fh,02ah,02fh,043h,03ah,039h,071h,037h,026h,04dh,03dh,03ch,0ffh	; 9eac  8../*/C:9q7&M=<.
	defb 077h,02eh,04eh,060h,0f8h,035h,0f8h,00ch,03eh,0f8h,014h,050h,04eh,04dh,0e4h,0e4h	; 9ebc  w.N`.5..>..PNM..
	defb 0e4h,0ffh,003h,076h,09eh,0a8h,09bh,0f8h,054h,0f8h,023h,03dh,02fh,026h,057h,03dh	; 9ecc  ...v....T.#=/&W=
	defb 0c3h,09bh,0cch,0ebh,09eh,0adh,08ch,0ffh,078h,085h,0a9h,03eh,0f8h,031h,02ah,04bh	; 9edc  ........x..>.1*K
	defb 0b1h,0ebh,0a0h,051h,025h,026h,030h,037h,026h,034h,03dh,04ah,0e4h,0e4h,0e4h,0feh	; 9eec  ...Q%&07&4=J....
	defb 02bh,071h,038h,0ffh,077h,09eh,0a8h,09bh,0f8h,054h,0f8h,023h,03eh,0bdh,085h,056h	; 9efc  +q8.w....T.#>..V
	defb 034h,0f8h,039h,0f8h,029h,0b1h,0ebh,0a0h,03ah,043h,02bh,02eh,0feh,043h,04eh,037h	; 9f0c  4.9.)...:C+..CN7
	defb 0f8h,024h,052h,05dh,0ffh,078h,060h,047h,0e4h,0e4h,0e4h,085h,0a9h,03dh,03dh,02eh	; 9f1c  .$R].x`G.....==.
	defb 030h,034h,0b1h,0ebh,0a0h,03eh,044h,052h,039h,051h,0f8h,014h,0feh,071h,034h,050h	; 9f2c  04...>DR9Q...q4P
	defb 0e6h,03ch,0e5h,01dh,018h,00bh,015h,00fh,0e1h,0ffh,002h,078h,01dh,018h,00bh,015h	; 9f3c  .<.........x....
	defb 00fh,0e1h,0e4h,0e4h,0e4h,061h,02eh,026h,071h,034h,03dh,0e1h,0feh,03ch,06fh,0e5h	; 9f4c  .....a.&q4=..<o.
	defb 01dh,018h,00bh,015h,00fh,053h,026h,039h,026h,050h,0e0h,0ffh,077h,0e4h,0e4h,0e4h	; 9f5c  .....S&9&P..w...
	defb 01dh,018h,00bh,015h,00fh,0e1h,0e4h,0e4h,0e4h,03ah,056h,04bh,04eh,034h,02ah,0e1h	; 9f6c  .........:VKN4*.
	defb 0ffh,002h,078h,01dh,018h,00bh,015h,00fh,0e0h,01dh,018h,00bh,015h,00fh,0e0h,0feh	; 9f7c  ..x.............
	defb 0e4h,0e4h,0e4h,0a4h,082h,08bh,0d2h,087h,03dh,0a3h,087h,08eh,087h,051h,030h,037h	; 9f8c  ........=....Q07
	defb 034h,03dh,03ah,03fh,061h,0feh,026h,050h,0e4h,0e4h,0e4h,0e4h,0ffh	; 9f9c  4=:?a.&P.....

; ----------------------------------------------------------------------
; DATOS mensaje_9FA9: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (9 bytes)
;   0x9fa9..0x9fb2  (9 bytes)
DATA_mensaje_9FA9:
	defb 002h,076h,099h,08bh,05dh,071h,0e0h,0e0h,0fbh	; 9fa9  .v..]q...

; ----------------------------------------------------------------------
; DATOS mensaje_9FB2: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (16 bytes)
;   0x9fb2..0x9fc2  (16 bytes)
DATA_mensaje_9FB2:
	defb 002h,07ch,0ebh,0f8h,052h,05ah,036h,030h,02ah,050h,034h,04eh,039h,026h,050h,0fbh	; 9fb2  .|..RZ60*P4N9&P.

; ----------------------------------------------------------------------
; DATOS mensaje_9FC2: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (40 bytes)
;   0x9fc2..0x9fea  (40 bytes)
DATA_mensaje_9FC2:
	defb 002h,07eh,050h,030h,02ah,04bh,026h,02eh,027h,0e6h,084h,081h,08ah,086h,044h,059h	; 9fc2  .~P0*K&.'.....DY
	defb 02ah,026h,0feh,047h,03dh,0e5h,061h,027h,039h,071h,037h,047h,0b8h,0a9h,047h,02ah	; 9fd2  *&.G=.a'9q7G..G*
	defb 039h,030h,043h,0feh,052h,050h,026h,0fbh	; 9fe2  90C.RP&.

; ----------------------------------------------------------------------
; DATOS mensaje_9FEA: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina; lo leen p09:A50D (18 bytes)
;   0x9fea..0x9ffc  (18 bytes)
DATA_mensaje_9FEA:
	defb 002h,07eh,0f8h,044h,0b4h,0d2h,082h,0bfh,059h,072h,0e0h,050h,034h,071h,037h,02eh	; 9fea  .~.D....Yr.P4q7.
	defb 026h,0fbh	; 9ffa

; ----------------------------------------------------------------------
; DATOS mensaje_9FFC: mensaje letra a letra (p01:66C4): letras hasta 0xFF o
;   0xFB; 0xFE linea, 0xFD/0xFC pagina, 0x76-0x7F y 0xD4-0xDF quien habla,
;   0xF8 segunda pagina (sigue en el banco 51, en 0xA000); lo leen p09:A50D (4
;   bytes)
;   0x9ffc..0xa000  (4 bytes)
DATA_mensaje_9FFC:
	defb 002h,07ch,059h,072h	; 9ffc
