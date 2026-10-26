; ==========================================================================
; METAL GEAR 2 SOLID SNAKE - Konami (1990) - MSX2 - MegaROM RC-767 de 512 KB (Konami SCC) - banco 52 (se ejecuta en 0x8000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x08000


; ----------------------------------------------------------------------
; DATOS tabla_colores_8000: 53 punteros a colores de dibujo (los usa hasta el
;   indice 52; p00:4DA0); lo leen p00:4DA0 (106 bytes)
;   0x8000..0x806a  (106 bytes)
DATA_tabla_colores_8000:
	defw 0806ah,0806ch,0806eh,08070h,08072h,08074h,08076h,08078h	; 8000
	defw 0807ah,0807ch,0807eh,08080h,08081h,08083h,08085h,08087h	; 8010
	defw 08089h,0808bh,0808fh,08093h,08097h,0809bh,0809fh,080a3h	; 8020
	defw 080a7h,080abh,080afh,080b3h,080b7h,080bbh,080bfh,080c3h	; 8030
	defw 080c7h,080cbh,080cfh,080d3h,080d7h,080dbh,080dfh,080e3h	; 8040
	defw 080e7h,080ebh,080efh,080f3h,080f7h,080fbh,080ffh,08103h	; 8050
	defw 08107h,0810bh,0810fh,08111h,08113h	; 8060

; ----------------------------------------------------------------------
; DATOS colores_806A: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6CEF, p01:6CF5 (2
;   bytes)
;   0x806a..0x806c  (2 bytes)
DATA_colores_806A:
	defb 001h,025h	; 806a

; ----------------------------------------------------------------------
; DATOS colores_806C: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6CEF, p01:6CF5,
;   p01:6CFB (2 bytes)
;   0x806c..0x806e  (2 bytes)
DATA_colores_806C:
	defb 002h,034h	; 806c

; ----------------------------------------------------------------------
; DATOS colores_806E: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6CF5 (2 bytes)
;   0x806e..0x8070  (2 bytes)
DATA_colores_806E:
	defb 002h,035h	; 806e

; ----------------------------------------------------------------------
; DATOS colores_8070: 2 colores de 4 bits, dos por byte, para un dibujo de 1
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6CF5, p01:6CFB (1
;   bytes)
;   0x8070..0x8071  (1 bytes)
DATA_colores_8070:
	defb 006h	; 8070

; ----------------------------------------------------------------------
; DATOS byte_8071: un byte (0x13) entre colores_8070 y colores_8072; ningun
;   lector del listado llega a ellos ni los apunta ninguna tabla declarada
;   0x8071..0x8072  (1 bytes)
DATA_byte_8071:
	defb 013h	; 8071

; ----------------------------------------------------------------------
; DATOS colores_8072: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6CF5 (2 bytes)
;   0x8072..0x8074  (2 bytes)
DATA_colores_8072:
	defb 002h,056h	; 8072

; ----------------------------------------------------------------------
; DATOS colores_8074: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6CF5 (2 bytes)
;   0x8074..0x8076  (2 bytes)
DATA_colores_8074:
	defb 002h,045h	; 8074

; ----------------------------------------------------------------------
; DATOS colores_8076: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6CF5 (2 bytes)
;   0x8076..0x8078  (2 bytes)
DATA_colores_8076:
	defb 002h,056h	; 8076

; ----------------------------------------------------------------------
; DATOS colores_8078: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6CEF, p01:6CF5 (2
;   bytes)
;   0x8078..0x807a  (2 bytes)
DATA_colores_8078:
	defb 003h,045h	; 8078

; ----------------------------------------------------------------------
; DATOS colores_807A: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6CFB (2 bytes)
;   0x807a..0x807c  (2 bytes)
DATA_colores_807A:
	defb 006h,0ach	; 807a

; ----------------------------------------------------------------------
; DATOS colores_807C: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6CEF (2 bytes)
;   0x807c..0x807e  (2 bytes)
DATA_colores_807C:
	defb 001h,0bch	; 807c

; ----------------------------------------------------------------------
; DATOS colores_807E: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6CEF (2 bytes)
;   0x807e..0x8080  (2 bytes)
DATA_colores_807E:
	defb 001h,03ah	; 807e

; ----------------------------------------------------------------------
; DATOS colores_8080: 2 colores de 4 bits, dos por byte, para un dibujo de 1
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6CEF (1 bytes)
;   0x8080..0x8081  (1 bytes)
DATA_colores_8080:
	defb 00ah	; 8080

; ----------------------------------------------------------------------
; DATOS colores_8081: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6CEF (2 bytes)
;   0x8081..0x8083  (2 bytes)
DATA_colores_8081:
	defb 009h,0adh	; 8081

; ----------------------------------------------------------------------
; DATOS colores_8083: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6CEF (2 bytes)
;   0x8083..0x8085  (2 bytes)
DATA_colores_8083:
	defb 009h,0ach	; 8083

; ----------------------------------------------------------------------
; DATOS colores_8085: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6CEF, p01:6DCA (2
;   bytes)
;   0x8085..0x8087  (2 bytes)
DATA_colores_8085:
	defb 005h,07fh	; 8085

; ----------------------------------------------------------------------
; DATOS colores_8087: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6CEF (2 bytes)
;   0x8087..0x8089  (2 bytes)
DATA_colores_8087:
	defb 001h,034h	; 8087

; ----------------------------------------------------------------------
; DATOS colores_8089: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6CFB (2 bytes)
;   0x8089..0x808b  (2 bytes)
DATA_colores_8089:
	defb 001h,026h	; 8089

; ----------------------------------------------------------------------
; DATOS colores_808B: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6CEF, p01:6CF5 (4
;   bytes)
;   0x808b..0x808f  (4 bytes)
DATA_colores_808B:
	defb 001h,023h,045h,068h	; 808b

; ----------------------------------------------------------------------
; DATOS colores_808F: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6CF5, p01:6CFB (4
;   bytes)
;   0x808f..0x8093  (4 bytes)
DATA_colores_808F:
	defb 001h,024h,036h,07fh	; 808f

; ----------------------------------------------------------------------
; DATOS colores_8093: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6CF5, p01:6CFB (4
;   bytes)
;   0x8093..0x8097  (4 bytes)
DATA_colores_8093:
	defb 002h,036h,07bh,0cfh	; 8093

; ----------------------------------------------------------------------
; DATOS colores_8097: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6CFB (4 bytes)
;   0x8097..0x809b  (4 bytes)
DATA_colores_8097:
	defb 012h,06fh,008h,0cdh	; 8097

; ----------------------------------------------------------------------
; DATOS colores_809B: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6CFB (4 bytes)
;   0x809b..0x809f  (4 bytes)
DATA_colores_809B:
	defb 001h,024h,068h,0dfh	; 809b

; ----------------------------------------------------------------------
; DATOS colores_809F: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6CFB (4 bytes)
;   0x809f..0x80a3  (4 bytes)
DATA_colores_809F:
	defb 015h,06fh,027h,0adh	; 809f

; ----------------------------------------------------------------------
; DATOS colores_80A3: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6CFB (4 bytes)
;   0x80a3..0x80a7  (4 bytes)
DATA_colores_80A3:
	defb 024h,067h,08ch,0dfh	; 80a3

; ----------------------------------------------------------------------
; DATOS colores_80A7: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6CFB (4 bytes)
;   0x80a7..0x80ab  (4 bytes)
DATA_colores_80A7:
	defb 068h,0dfh,012h,045h	; 80a7

; ----------------------------------------------------------------------
; DATOS colores_80AB: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6CFB (4 bytes)
;   0x80ab..0x80af  (4 bytes)
DATA_colores_80AB:
	defb 015h,06dh,083h,0cfh	; 80ab

; ----------------------------------------------------------------------
; DATOS colores_80AF: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6CFB (4 bytes)
;   0x80af..0x80b3  (4 bytes)
DATA_colores_80AF:
	defb 001h,06fh,048h,0cdh	; 80af

; ----------------------------------------------------------------------
; DATOS colores_80B3: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6CEF, p01:6CFB,
;   p01:6F22 (4 bytes)
;   0x80b3..0x80b7  (4 bytes)
DATA_colores_80B3:
	defb 007h,0dfh,046h,08ah	; 80b3

; ----------------------------------------------------------------------
; DATOS colores_80B7: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6CFB (4 bytes)
;   0x80b7..0x80bb  (4 bytes)
DATA_colores_80B7:
	defb 046h,078h,0ach,0dfh	; 80b7

; ----------------------------------------------------------------------
; DATOS colores_80BB: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6CFB (4 bytes)
;   0x80bb..0x80bf  (4 bytes)
DATA_colores_80BB:
	defb 016h,08fh,02bh,0cdh	; 80bb

; ----------------------------------------------------------------------
; DATOS colores_80BF: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6CFB (4 bytes)
;   0x80bf..0x80c3  (4 bytes)
DATA_colores_80BF:
	defb 07ah,0efh,008h,0cdh	; 80bf

; ----------------------------------------------------------------------
; DATOS colores_80C3: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6CFB (4 bytes)
;   0x80c3..0x80c7  (4 bytes)
DATA_colores_80C3:
	defb 008h,0efh,04ah,0cdh	; 80c3

; ----------------------------------------------------------------------
; DATOS colores_80C7: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6CEF, p01:6CFB (4
;   bytes)
;   0x80c7..0x80cb  (4 bytes)
DATA_colores_80C7:
	defb 00dh,0efh,047h,0bch	; 80c7

; ----------------------------------------------------------------------
; DATOS colores_80CB: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6CFB (4 bytes)
;   0x80cb..0x80cf  (4 bytes)
DATA_colores_80CB:
	defb 0ach,0efh,007h,0bdh	; 80cb

; ----------------------------------------------------------------------
; DATOS colores_80CF: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6CFB (4 bytes)
;   0x80cf..0x80d3  (4 bytes)
DATA_colores_80CF:
	defb 08ch,0efh,004h,07dh	; 80cf

; ----------------------------------------------------------------------
; DATOS colores_80D3: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6CFB (4 bytes)
;   0x80d3..0x80d7  (4 bytes)
DATA_colores_80D3:
	defb 08dh,0efh,004h,07ah	; 80d3

; ----------------------------------------------------------------------
; DATOS colores_80D7: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6CEF (4 bytes)
;   0x80d7..0x80db  (4 bytes)
DATA_colores_80D7:
	defb 001h,0abh,03ch,0deh	; 80d7

; ----------------------------------------------------------------------
; DATOS colores_80DB: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6CEF (4 bytes)
;   0x80db..0x80df  (4 bytes)
DATA_colores_80DB:
	defb 004h,09ch,07ah,0dfh	; 80db

; ----------------------------------------------------------------------
; DATOS colores_80DF: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6CEF (4 bytes)
;   0x80df..0x80e3  (4 bytes)
DATA_colores_80DF:
	defb 001h,023h,045h,06fh	; 80df

; ----------------------------------------------------------------------
; DATOS colores_80E3: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6CF5, p01:6CFB (4
;   bytes)
;   0x80e3..0x80e7  (4 bytes)
DATA_colores_80E3:
	defb 001h,056h,08dh,0efh	; 80e3

; ----------------------------------------------------------------------
; DATOS colores_80E7: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6CFB (4 bytes)
;   0x80e7..0x80eb  (4 bytes)
DATA_colores_80E7:
	defb 002h,06fh,01ah,0cdh	; 80e7

; ----------------------------------------------------------------------
; DATOS colores_80EB: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6CFB (4 bytes)
;   0x80eb..0x80ef  (4 bytes)
DATA_colores_80EB:
	defb 056h,0dfh,018h,0ceh	; 80eb

; ----------------------------------------------------------------------
; DATOS colores_80EF: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6CFB (4 bytes)
;   0x80ef..0x80f3  (4 bytes)
DATA_colores_80EF:
	defb 008h,0deh,014h,0afh	; 80ef

; ----------------------------------------------------------------------
; DATOS colores_80F3: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6CFB (4 bytes)
;   0x80f3..0x80f7  (4 bytes)
DATA_colores_80F3:
	defb 008h,0abh,0cdh,0efh	; 80f3

; ----------------------------------------------------------------------
; DATOS colores_80F7: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6CEF, p01:6CFB (4
;   bytes)
;   0x80f7..0x80fb  (4 bytes)
DATA_colores_80F7:
	defb 001h,02ch,06ah,0bfh	; 80f7

; ----------------------------------------------------------------------
; DATOS colores_80FB: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6CFB (4 bytes)
;   0x80fb..0x80ff  (4 bytes)
DATA_colores_80FB:
	defb 056h,0cfh,024h,08dh	; 80fb

; ----------------------------------------------------------------------
; DATOS colores_80FF: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6CFB (4 bytes)
;   0x80ff..0x8103  (4 bytes)
DATA_colores_80FF:
	defb 004h,08ah,0bch,0dfh	; 80ff

; ----------------------------------------------------------------------
; DATOS colores_8103: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6CFB (4 bytes)
;   0x8103..0x8107  (4 bytes)
DATA_colores_8103:
	defb 002h,046h,08ch,0dfh	; 8103

; ----------------------------------------------------------------------
; DATOS colores_8107: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6CFB (4 bytes)
;   0x8107..0x810b  (4 bytes)
DATA_colores_8107:
	defb 068h,0efh,014h,05dh	; 8107

; ----------------------------------------------------------------------
; DATOS colores_810B: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6CFB (4 bytes)
;   0x810b..0x810f  (4 bytes)
DATA_colores_810B:
	defb 005h,06fh,014h,08eh	; 810b

; ----------------------------------------------------------------------
; DATOS colores_810F: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6CF5 (2 bytes)
;   0x810f..0x8111  (2 bytes)
DATA_colores_810F:
	defb 002h,013h	; 810f

; ----------------------------------------------------------------------
; DATOS colores_8111: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6CEF, p01:6CF5 (2
;   bytes)
;   0x8111..0x8113  (2 bytes)
DATA_colores_8111:
	defb 001h,036h	; 8111

; ----------------------------------------------------------------------
; DATOS colores_8113: 2 colores de 4 bits, dos por byte, para un dibujo de 1
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p01:6DE3 (1 bytes)
;   0x8113..0x8114  (1 bytes)
DATA_colores_8113:
	defb 097h	; 8113

; ----------------------------------------------------------------------
; DATOS lista_8114: 2 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x8000); lo leen p01:6F22 (11 bytes)
;   0x8114..0x811f  (11 bytes)
DATA_lista_8114:
	defb 03fh,01bh,001h,04ah,087h	; 8114
	defb 005h,01bh,040h,042h,089h	; 8119
	defb 0ffh	; 811e

; ----------------------------------------------------------------------
; DATOS lista_811F: 2 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x8000); lo leen p01:6DCA (11 bytes)
;   0x811f..0x812a  (11 bytes)
DATA_lista_811F:
	defb 03fh,00eh,001h,04ah,087h	; 811f
	defb 005h,00eh,040h,042h,089h	; 8124
	defb 0ffh	; 8129

; ----------------------------------------------------------------------
; DATOS lista_812A: 2 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x8000); lo leen p01:6DE3 (11 bytes)
;   0x812a..0x8135  (11 bytes)
DATA_lista_812A:
	defb 03fh,034h,001h,04ah,087h	; 812a
	defb 005h,034h,040h,042h,089h	; 812f
	defb 0ffh	; 8134

; ----------------------------------------------------------------------
; DATOS lista_8135: 19 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x8000); lo leen p01:6CF5 (96 bytes)
;   0x8135..0x8195  (96 bytes)
DATA_lista_8135:
	defb 001h,000h,001h,00ah,0a9h	; 8135
	defb 007h,001h,002h,012h,0a9h	; 813a
	defb 005h,003h,009h,04ah,0a9h	; 813f
	defb 042h,027h,00eh,072h,0a9h	; 8144
	defb 053h,032h,010h,092h,0a9h	; 8149
	defb 043h,000h,023h,0c2h,0aah	; 814e
	defb 042h,001h,026h,0f2h,0aah	; 8153
	defb 043h,002h,028h,012h,0abh	; 8158
	defb 041h,033h,02bh,042h,0abh	; 815d
	defb 041h,004h,02ch,052h,0abh	; 8162
	defb 043h,004h,02dh,062h,0abh	; 8167
	defb 043h,005h,030h,092h,0abh	; 816c
	defb 041h,006h,033h,0c2h,0abh	; 8171
	defb 041h,007h,034h,0d2h,0abh	; 8176
	defb 041h,013h,035h,0e2h,0abh	; 817b
	defb 043h,012h,036h,0f2h,0abh	; 8180
	defb 0b7h,011h,039h,022h,0ach	; 8185
	defb 0bfh,011h,070h,04ah,0b1h	; 818a
	defb 0b1h,011h,0afh,032h,0b7h	; 818f
	defb 0ffh	; 8194

; ----------------------------------------------------------------------
; DATOS lista_8195: 58 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x8000); lo leen p01:6CFB (291 bytes)
;   0x8195..0x82b8  (291 bytes)
DATA_lista_8195:
	defb 001h,001h,001h,00ah,094h	; 8195
	defb 001h,003h,002h,012h,094h	; 819a
	defb 041h,012h,003h,01ah,094h	; 819f
	defb 041h,008h,004h,02ah,094h	; 81a4
	defb 041h,01eh,005h,03ah,094h	; 81a9
	defb 043h,021h,006h,04ah,094h	; 81ae
	defb 085h,012h,009h,07ah,094h	; 81b3
	defb 081h,013h,00eh,0f2h,094h	; 81b8
	defb 088h,014h,00fh,00ah,095h	; 81bd
	defb 081h,015h,017h,0cah,095h	; 81c2
	defb 081h,016h,018h,0e2h,095h	; 81c7
	defb 082h,017h,019h,0fah,095h	; 81cc
	defb 081h,018h,01bh,02ah,096h	; 81d1
	defb 081h,019h,01ch,042h,096h	; 81d6
	defb 081h,012h,01dh,05ah,096h	; 81db
	defb 082h,01ah,01eh,072h,096h	; 81e0
	defb 084h,01bh,020h,0a2h,096h	; 81e5
	defb 081h,01ch,024h,002h,097h	; 81ea
	defb 081h,01dh,025h,01ah,097h	; 81ef
	defb 08fh,01eh,026h,032h,097h	; 81f4
	defb 086h,01fh,035h,09ah,098h	; 81f9
	defb 085h,020h,03bh,02ah,099h	; 81fe
	defb 085h,021h,040h,0a2h,099h	; 8203
	defb 001h,01bh,045h,01ah,09ah	; 8208
	defb 041h,01bh,046h,022h,09ah	; 820d
	defb 042h,02ah,047h,032h,09ah	; 8212
	defb 042h,01fh,049h,052h,09ah	; 8217
	defb 0bch,022h,04bh,072h,09ah	; 821c
	defb 086h,023h,087h,012h,0a0h	; 8221
	defb 001h,008h,08dh,0a2h,0a0h	; 8226
	defb 04ch,014h,08eh,0aah,0a0h	; 822b
	defb 041h,01ah,099h,05ah,0a1h	; 8230
	defb 041h,028h,09ah,06ah,0a1h	; 8235
	defb 043h,01ah,09bh,07ah,0a1h	; 823a
	defb 048h,023h,09eh,0aah,0a1h	; 823f
	defb 042h,01dh,0a6h,02ah,0a2h	; 8244
	defb 043h,016h,0a8h,04ah,0a2h	; 8249
	defb 041h,019h,0abh,07ah,0a2h	; 824e
	defb 041h,02dh,0ach,08ah,0a2h	; 8253
	defb 042h,010h,0adh,09ah,0a2h	; 8258
	defb 043h,031h,0afh,0bah,0a2h	; 825d
	defb 043h,01fh,0b2h,0eah,0a2h	; 8262
	defb 041h,020h,0b5h,01ah,0a3h	; 8267
	defb 041h,018h,0b6h,02ah,0a3h	; 826c
	defb 041h,029h,0b7h,03ah,0a3h	; 8271
	defb 041h,030h,0b8h,04ah,0a3h	; 8276
	defb 041h,022h,0b9h,05ah,0a3h	; 827b
	defb 08ch,027h,0bah,06ah,0a3h	; 8280
	defb 089h,028h,0c6h,08ah,0a4h	; 8285
	defb 086h,029h,0cfh,062h,0a5h	; 828a
	defb 08eh,02ah,0d5h,0f2h,0a5h	; 828f
	defb 088h,02bh,0e3h,042h,0a7h	; 8294
	defb 083h,02ch,0ebh,002h,0a8h	; 8299
	defb 082h,02dh,0eeh,04ah,0a8h	; 829e
	defb 082h,02eh,0f0h,07ah,0a8h	; 82a3
	defb 081h,02fh,0f2h,0aah,0a8h	; 82a8
	defb 082h,030h,0f3h,0c2h,0a8h	; 82ad
	defb 081h,031h,0f5h,0f2h,0a8h	; 82b2
	defb 0ffh	; 82b7

; ----------------------------------------------------------------------
; DATOS lista_82B8: 25 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x8000); lo leen p01:6CEF (126 bytes)
;   0x82b8..0x8336  (126 bytes)
DATA_lista_82B8:
	defb 001h,00eh,045h,06ah,089h	; 82b8
	defb 00ch,01bh,046h,072h,089h	; 82bd
	defb 044h,00eh,052h,0d2h,089h	; 82c2
	defb 002h,020h,056h,012h,08ah	; 82c7
	defb 002h,00ch,058h,022h,08ah	; 82cc
	defb 002h,00bh,05ah,032h,08ah	; 82d1
	defb 003h,000h,05ch,042h,08ah	; 82d6
	defb 043h,00ch,05fh,05ah,08ah	; 82db
	defb 042h,025h,062h,08ah,08ah	; 82e0
	defb 043h,00dh,064h,0aah,08ah	; 82e5
	defb 043h,02ch,067h,0dah,08ah	; 82ea
	defb 082h,025h,06ah,00ah,08bh	; 82ef
	defb 00eh,000h,06ch,03ah,08bh	; 82f4
	defb 006h,007h,07ah,0aah,08bh	; 82f9
	defb 008h,01bh,080h,0dah,08bh	; 82fe
	defb 044h,009h,088h,01ah,08ch	; 8303
	defb 048h,00ah,08ch,05ah,08ch	; 8308
	defb 042h,024h,094h,0dah,08ch	; 830d
	defb 087h,024h,096h,0fah,08ch	; 8312
	defb 002h,007h,09dh,0a2h,08dh	; 8317
	defb 041h,00fh,09fh,0b2h,08dh	; 831c
	defb 045h,001h,0a0h,0c2h,08dh	; 8321
	defb 045h,011h,0a5h,012h,08eh	; 8326
	defb 042h,033h,0aah,062h,08eh	; 832b
	defb 0bbh,026h,0ach,082h,08eh	; 8330
	defb 0ffh	; 8335

; ----------------------------------------------------------------------
; DATOS lista_mosaicos_8336: 8 fichas [VRAM lo hi][filas][columnas][puntero] y
;   un 0xFF (p01:6D65); lo leen p01:6D69 (49 bytes)
;   0x8336..0x8367  (49 bytes)
DATA_lista_mosaicos_8336:
	defb 000h,0e0h,008h,004h,0e0h,086h	; 8336
	defb 048h,0e0h,00ah,004h,009h,087h	; 833c
	defb 070h,0c0h,005h,004h,031h,087h	; 8342
	defb 038h,080h,002h,007h,0fdh,084h	; 8348
	defb 060h,080h,001h,007h,00ch,085h	; 834e
	defb 068h,080h,008h,006h,0c1h,084h	; 8354
	defb 038h,0b8h,006h,002h,0f0h,084h	; 835a
	defb 000h,080h,007h,00bh,08dh,084h	; 8360
	defb 0ffh	; 8366

; ----------------------------------------------------------------------
; DATOS lista_mosaicos_8367: 6 fichas [VRAM lo hi][filas][columnas][puntero] y
;   un 0xFF (p01:6D65); lo leen p01:6D69 (37 bytes)
;   0x8367..0x838c  (37 bytes)
DATA_lista_mosaicos_8367:
	defb 000h,000h,015h,010h,0c2h,085h	; 8367
	defb 068h,0e0h,001h,003h,046h,087h	; 836d
	defb 090h,0e0h,001h,003h,046h,087h	; 8373
	defb 090h,0c0h,001h,003h,046h,087h	; 8379
	defb 000h,0e0h,004h,003h,001h,087h	; 837f
	defb 020h,0e0h,004h,003h,001h,087h	; 8385
	defb 0ffh	; 838b

; ----------------------------------------------------------------------
; DATOS lista_mosaicos_838C: 12 fichas [VRAM lo hi][filas][columnas][puntero]
;   y un 0xFF (p01:6D65); lo leen p01:6D69 (73 bytes)
;   0x838c..0x83d5  (73 bytes)
DATA_lista_mosaicos_838C:
	defb 0a8h,000h,008h,00ah,014h,085h	; 838c
	defb 0d0h,050h,004h,008h,062h,085h	; 8392
	defb 098h,0c0h,001h,008h,082h,085h	; 8398
	defb 0a0h,0c8h,004h,006h,08bh,085h	; 839e
	defb 0c0h,098h,002h,005h,0a4h,085h	; 83a4
	defb 0e8h,030h,003h,001h,0afh,085h	; 83aa
	defb 0f0h,058h,002h,007h,0b3h,085h	; 83b0
	defb 0a8h,050h,005h,009h,0d5h,083h	; 83b6
	defb 0e8h,000h,003h,006h,002h,084h	; 83bc
	defb 0a8h,098h,003h,006h,015h,084h	; 83c2
	defb 0d0h,090h,006h,006h,028h,084h	; 83c8
	defb 0c0h,0c0h,008h,008h,04ch,084h	; 83ce
	defb 0ffh	; 83d4

; ----------------------------------------------------------------------
; DATOS mosaico_f7_83D5: mosaico de 5 x 9 caracteres comprimido (p01:6DA5:
;   0xF7-0xFE repite el siguiente, 0xFF acaba); lo leen p01:6D7B (45 bytes)
;   0x83d5..0x8402  (45 bytes)
DATA_mosaico_f7_83D5:
	defb 000h,000h,046h,04bh,04ch,08ch,04dh,04eh,000h,047h,000h,04fh,087h,050h,051h,052h	; 83d5  ..FKL.MN.G.O.PQR
	defb 088h,053h,054h,055h,056h,057h,058h,059h,05ah,089h,05bh,05ch,05dh,05eh,05fh,060h	; 83e5  .STUVWXYZ.[\]^_`
	defb 061h,062h,063h,064h,0fah,000h,04ah,065h,086h,066h,067h,048h,0ffh	; 83f5  abcd..Je.fgH.

; ----------------------------------------------------------------------
; DATOS mosaico_f7_8402: mosaico de 3 x 6 caracteres comprimido (p01:6DA5:
;   0xF7-0xFE repite el siguiente, 0xFF acaba); lo leen p01:6D7B (19 bytes)
;   0x8402..0x8415  (19 bytes)
DATA_mosaico_f7_8402:
	defb 077h,049h,078h,08bh,079h,051h,07ah,07bh,07ch,07dh,07eh,07fh,080h,081h,082h,083h	; 8402  wIx.yQz{|}~.....
	defb 084h,085h,0ffh	; 8412

; ----------------------------------------------------------------------
; DATOS mosaico_f7_8415: mosaico de 3 x 6 caracteres comprimido (p01:6DA5:
;   0xF7-0xFE repite el siguiente, 0xFF acaba); lo leen p01:6D7B (19 bytes)
;   0x8415..0x8428  (19 bytes)
DATA_mosaico_f7_8415:
	defb 045h,068h,069h,08ah,06ah,051h,06bh,06ch,06dh,06eh,06fh,070h,071h,072h,073h,074h	; 8415  Ehi.jQklmnopqrst
	defb 075h,076h,0ffh	; 8425

; ----------------------------------------------------------------------
; DATOS mosaico_f7_8428: mosaico de 6 x 6 caracteres comprimido (p01:6DA5:
;   0xF7-0xFE repite el siguiente, 0xFF acaba); lo leen p01:6D7B (36 bytes)
;   0x8428..0x844c  (36 bytes)
DATA_mosaico_f7_8428:
	defb 0fah,000h,001h,009h,003h,000h,00eh,017h,00ah,00bh,015h,016h,018h,019h,00ch,00fh	; 8428  ................
	defb 010h,011h,01bh,01ch,00dh,01ah,01eh,020h,024h,025h,012h,021h,01fh,002h,013h,01dh	; 8438  ....... $%.!....
	defb 014h,004h,026h,0ffh	; 8448

; ----------------------------------------------------------------------
; DATOS mosaico_f7_844C: mosaico de 8 x 8 caracteres comprimido (p01:6DA5:
;   0xF7-0xFE repite el siguiente, 0xFF acaba); lo leen p01:6D7B (65 bytes)
;   0x844c..0x848d  (65 bytes)
DATA_mosaico_f7_844C:
	defb 027h,028h,035h,022h,027h,028h,035h,022h,029h,02ah,040h,02bh,029h,005h,032h,02bh	; 844c  '(5"'(5")*@+).2+
	defb 036h,02ch,02dh,02eh,036h,033h,007h,02eh,023h,03bh,03ch,03fh,023h,03bh,03ch,03fh	; 845c  6,-.63..#.<?#.<?
	defb 027h,028h,037h,022h,027h,028h,039h,022h,029h,042h,043h,02bh,029h,041h,008h,02bh	; 846c  '(7"'(9")BC+)A.+
	defb 038h,02fh,030h,031h,03ah,044h,006h,034h,023h,03bh,03dh,03fh,023h,03bh,03eh,03fh	; 847c  8/01:D.4#.=?#.>?
	defb 0ffh	; 848c

; ----------------------------------------------------------------------
; DATOS mosaico_f7_848D: mosaico de 7 x 11 caracteres comprimido (p01:6DA5:
;   0xF7-0xFE repite el siguiente, 0xFF acaba); lo leen p01:6D7B (52 bytes)
;   0x848d..0x84c1  (52 bytes)
DATA_mosaico_f7_848D:
	defb 04ch,0fbh,046h,047h,052h,0fah,046h,053h,04ah,0fbh,000h,04bh,0fbh,000h,054h,04ah	; 848d  L.FGR.FSJ..K..TJ
	defb 0fbh,000h,04bh,0fbh,000h,055h,04ah,0fbh,000h,04bh,0fbh,000h,04ah,04ah,0fbh,000h	; 849d  ..K..UJ..K..JJ..
	defb 04bh,0fbh,000h,04ah,04ah,0fbh,000h,04bh,0fbh,000h,04ah,04dh,0fch,04eh,04fh,050h	; 84ad  K..JJ..K..JM.NOP
	defb 051h,048h,049h,0ffh	; 84bd

; ----------------------------------------------------------------------
; DATOS mosaico_f7_84C1: mosaico de 8 x 6 caracteres comprimido (p01:6DA5:
;   0xF7-0xFE repite el siguiente, 0xFF acaba); lo leen p01:6D7B (47 bytes)
;   0x84c1..0x84f0  (47 bytes)
DATA_mosaico_f7_84C1:
	defb 000h,06ch,06dh,06eh,06fh,070h,071h,088h,096h,097h,08ch,072h,073h,089h,094h,08ah	; 84c1  .lmnopq....rs...
	defb 098h,074h,075h,08dh,08bh,095h,099h,072h,077h,08eh,09ah,09bh,09ch,08fh,078h,079h	; 84d1  .tu....rw.....xy
	defb 090h,091h,07ah,07bh,092h,093h,07ch,07dh,000h,000h,07eh,07fh,0fbh,000h,0ffh	; 84e1  ..z{..|}..~....

; ----------------------------------------------------------------------
; DATOS mosaico_f7_84F0: mosaico de 6 x 2 caracteres comprimido (p01:6DA5:
;   0xF7-0xFE repite el siguiente, 0xFF acaba); lo leen p01:6D7B (13 bytes)
;   0x84f0..0x84fd  (13 bytes)
DATA_mosaico_f7_84F0:
	defb 080h,081h,082h,083h,084h,085h,086h,087h,080h,081h,082h,083h,0ffh	; 84f0  .............

; ----------------------------------------------------------------------
; DATOS mosaico_f7_84FD: mosaico de 2 x 7 caracteres comprimido (p01:6DA5:
;   0xF7-0xFE repite el siguiente, 0xFF acaba); lo leen p01:6D7B (15 bytes)
;   0x84fd..0x850c  (15 bytes)
DATA_mosaico_f7_84FD:
	defb 056h,05fh,060h,061h,058h,059h,000h,057h,06bh,062h,063h,064h,066h,05ah,0ffh	; 84fd  V_`aXY.WkbcdfZ.

; ----------------------------------------------------------------------
; DATOS mosaico_f7_850C: mosaico de 1 x 7 caracteres comprimido (p01:6DA5:
;   0xF7-0xFE repite el siguiente, 0xFF acaba); lo leen p01:6D7B (8 bytes)
;   0x850c..0x8514  (8 bytes)
DATA_mosaico_f7_850C:
	defb 069h,067h,068h,05ch,05dh,05eh,06ah,0ffh	; 850c  igh\]^j.

; ----------------------------------------------------------------------
; DATOS mosaico_f7_8514: mosaico de 8 x 10 caracteres comprimido (p01:6DA5:
;   0xF7-0xFE repite el siguiente, 0xFF acaba); lo leen p01:6D7B (78 bytes)
;   0x8514..0x8562  (78 bytes)
DATA_mosaico_f7_8514:
	defb 000h,000h,0bah,0b4h,0e3h,0e4h,0e5h,0fah,000h,0c6h,09ah,0efh,09eh,09fh,0e9h,0eah	; 8514  ................
	defb 099h,0bbh,0b1h,08eh,08fh,090h,0a0h,0a1h,0b9h,0a2h,0bch,0c7h,0aeh,091h,0c8h,092h	; 8524  ................
	defb 0bdh,0cfh,0d0h,0beh,0a6h,0a8h,09dh,094h,0cdh,095h,0ach,0c2h,0c3h,0a3h,0b6h,0a9h	; 8534  ................
	defb 08dh,096h,0c9h,097h,0abh,0b8h,0d5h,0d6h,0a7h,0aah,09bh,0cbh,098h,093h,0b7h,0d4h	; 8544  ................
	defb 0a4h,0d1h,0c5h,0afh,09ch,000h,0adh,0cah,0b0h,0c4h,0b2h,0fbh,000h,0ffh	; 8554  ..............

; ----------------------------------------------------------------------
; DATOS mosaico_f7_8562: mosaico de 4 x 8 caracteres comprimido (p01:6DA5:
;   0xF7-0xFE repite el siguiente, 0xFF acaba); se solapan 2 bloques:
;   (mosaico_f7_8582 8582-858B); lo leen p01:6D7B (41 bytes)
;   0x8562..0x858b  (41 bytes)
DATA_mosaico_f7_8562:
	defb 0f0h,0f1h,0dah,0b5h,0d7h,0b3h,0dbh,0dch,09ah,0efh,09eh,0e6h,0e7h,0e8h,099h,0bbh	; 8562  ................
	defb 08fh,090h,0a0h,0a5h,0d3h,0d8h,0bch,0c7h,0c8h,092h,0bdh,0c0h,0d2h,0bfh,0a6h,0a8h	; 8572  ................
	defb 0f2h,0eeh,0d9h,09fh,0e9h,0eah,0dfh,0f5h,0ffh	; 8582  .........

; ----------------------------------------------------------------------
; DATOS mosaico_f7_858B: mosaico de 4 x 6 caracteres comprimido (p01:6DA5:
;   0xF7-0xFE repite el siguiente, 0xFF acaba); lo leen p01:6D7B (25 bytes)
;   0x858b..0x85a4  (25 bytes)
DATA_mosaico_f7_858B:
	defb 0b4h,0b5h,0d7h,0b3h,000h,000h,09eh,0e6h,0e7h,0e8h,099h,0bbh,0e1h,0a5h,0d3h,0d8h	; 858b  ................
	defb 0e2h,0c7h,0bdh,0c0h,0d2h,0bfh,0a6h,0a8h,0ffh	; 859b  .........

; ----------------------------------------------------------------------
; DATOS mosaico_f7_85A4: mosaico de 2 x 5 caracteres comprimido (p01:6DA5:
;   0xF7-0xFE repite el siguiente, 0xFF acaba); lo leen p01:6D7B (11 bytes)
;   0x85a4..0x85af  (11 bytes)
DATA_mosaico_f7_85A4:
	defb 0f3h,0c0h,0d2h,0bfh,0c1h,0ddh,0a5h,0d3h,0d8h,0e0h,0ffh	; 85a4  ...........

; ----------------------------------------------------------------------
; DATOS mosaico_f7_85AF: mosaico de 3 x 1 caracteres comprimido (p01:6DA5:
;   0xF7-0xFE repite el siguiente, 0xFF acaba); lo leen p01:6D7B (4 bytes)
;   0x85af..0x85b3  (4 bytes)
DATA_mosaico_f7_85AF:
	defb 0edh,0ech,0ceh,0ffh	; 85af

; ----------------------------------------------------------------------
; DATOS mosaico_f7_85B3: mosaico de 2 x 7 caracteres comprimido (p01:6DA5:
;   0xF7-0xFE repite el siguiente, 0xFF acaba); lo leen p01:6D7B (15 bytes)
;   0x85b3..0x85c2  (15 bytes)
DATA_mosaico_f7_85B3:
	defb 0ebh,090h,0deh,0a5h,0d3h,0d8h,0f4h,0cch,092h,0bdh,0c0h,0d2h,0bfh,0a6h,0ffh	; 85b3  ...............

; ----------------------------------------------------------------------
; DATOS mosaico_f7_85C2: mosaico de 21 x 16 caracteres comprimido (p01:6DA5:
;   0xF7-0xFE repite el siguiente, 0xFF acaba); lo leen p01:6D7B (286 bytes)
;   0x85c2..0x86e0  (286 bytes)
DATA_mosaico_f7_85C2:
	defb 051h,039h,03ah,03bh,000h,000h,00eh,000h,000h,001h,00fh,0fch,000h,010h,03ch,03dh	; 85c2  Q9:...........<=
	defb 03eh,03fh,000h,012h,011h,000h,013h,0fah,000h,040h,002h,000h,010h,014h,041h,042h	; 85d2  >?.......@....AB
	defb 043h,009h,044h,045h,046h,015h,000h,000h,023h,047h,016h,000h,010h,017h,048h,049h	; 85e2  C.DEF...#G....HI
	defb 04ah,00ah,04bh,04ch,04dh,04eh,04fh,018h,050h,008h,000h,000h,010h,038h,052h,053h	; 85f2  J.KLMNO.P....8RS
	defb 054h,055h,056h,057h,058h,059h,05ah,05bh,008h,0fah,000h,026h,05ch,05dh,05eh,05fh	; 8602  TUVWXYZ[...&\]^_
	defb 060h,061h,062h,063h,064h,065h,008h,0fbh,000h,066h,067h,068h,069h,06ah,06bh,06ch	; 8612  `abcde...fghijkl
	defb 06dh,06eh,06fh,070h,071h,072h,073h,027h,000h,003h,019h,004h,028h,074h,075h,076h	; 8622  mnopqrs'....(tuv
	defb 077h,078h,079h,07ah,07bh,07ch,07dh,07eh,0fah,000h,029h,07fh,0dfh,081h,082h,083h	; 8632  wxyz{|}~..).....
	defb 084h,085h,086h,087h,088h,089h,08ah,0fah,000h,025h,08bh,08ch,08dh,08eh,08fh,090h	; 8642  .........%......
	defb 091h,092h,093h,094h,095h,02bh,0fbh,000h,096h,097h,098h,099h,09ah,09bh,09ch,09dh	; 8652  .....+..........
	defb 09eh,09fh,01ah,0a0h,0fbh,000h,0a1h,0a2h,0a3h,0a4h,0a5h,0a6h,0a7h,0a8h,0a9h,0aah	; 8662  ................
	defb 0fdh,000h,0abh,0ach,0adh,0aeh,0afh,0b0h,0b1h,0b2h,0b3h,0b4h,0fdh,000h,0b5h,0b6h	; 8672  ................
	defb 0b7h,0b8h,0b9h,0bah,0bbh,0bch,0bdh,0beh,0fdh,000h,0bfh,0c0h,0c1h,02ch,0c2h,0c3h	; 8682  .............,..
	defb 00bh,0c4h,0c5h,0c6h,0fdh,000h,0c7h,0c8h,02dh,000h,02fh,031h,000h,02eh,033h,02ah	; 8692  ........-./1..3*
	defb 0fch,000h,034h,0c9h,0cah,00ch,0fbh,000h,00dh,0cbh,0cch,0fch,000h,0cdh,0ceh,0cfh	; 86a2  ..4.............
	defb 0d0h,0fbh,000h,024h,0d1h,0d2h,035h,000h,000h,004h,01bh,0d3h,0d4h,01ch,0fdh,000h	; 86b2  ...$..5.........
	defb 01dh,0d5h,0d6h,01eh,005h,01fh,0d7h,0d8h,0d9h,030h,0fdh,000h,020h,0dah,0dbh,0dch	; 86c2  .........0.. ...
	defb 021h,0ddh,006h,000h,036h,007h,0fdh,000h,032h,037h,000h,022h,0deh,0ffh	; 86d2  !...6...27."..

; ----------------------------------------------------------------------
; DATOS mosaico_f7_86E0: mosaico de 8 x 4 caracteres comprimido (p01:6DA5:
;   0xF7-0xFE repite el siguiente, 0xFF acaba); lo leen p01:6D7B (33 bytes)
;   0x86e0..0x8701  (33 bytes)
DATA_mosaico_f7_86E0:
	defb 000h,000h,0adh,0aeh,000h,0afh,0b0h,0b1h,0b2h,0b3h,0b4h,0b5h,0ach,0b6h,000h,0b7h	; 86e0  ................
	defb 000h,000h,0b8h,0b9h,000h,0bah,0bbh,0bch,0bdh,0beh,0bfh,0c0h,0ach,0b6h,000h,0c1h	; 86f0  ................
	defb 0ffh	; 8700

; ----------------------------------------------------------------------
; DATOS mosaico_f7_8701: mosaico de 4 x 3 caracteres comprimido (p01:6DA5:
;   0xF7-0xFE repite el siguiente, 0xFF acaba); lo leen p01:6D7B (8 bytes)
;   0x8701..0x8709  (8 bytes)
DATA_mosaico_f7_8701:
	defb 053h,054h,000h,05eh,0feh,000h,075h,0ffh	; 8701  ST.^..u.

; ----------------------------------------------------------------------
; DATOS mosaico_f7_8709: mosaico de 10 x 4 caracteres comprimido (p01:6DA5:
;   0xF7-0xFE repite el siguiente, 0xFF acaba); se solapan 2 bloques:
;   (mosaico_f7_8731 8731-8746); lo leen p01:6D7B (61 bytes)
;   0x8709..0x8746  (61 bytes)
DATA_mosaico_f7_8709:
	defb 0c2h,0c3h,0c4h,0a0h,0c5h,0c6h,0c7h,0c8h,0c9h,0a5h,0cah,0aah,0cbh,0cch,0cdh,0abh	; 8709  ................
	defb 000h,0ceh,000h,09fh,0cfh,0d0h,0d1h,0a1h,0d2h,0d3h,0d4h,0d5h,0d6h,0a6h,0d7h,0a7h	; 8719  ................
	defb 0d8h,0d9h,0dah,0a7h,000h,0dbh,000h,0a2h,0dch,0ddh,0deh,0a3h,0a8h,0dfh,0e0h,0a4h	; 8729  ................
	defb 0e1h,0a9h,0e2h,09dh,0e3h,0e4h,0e5h,09dh,000h,0e6h,000h,09eh,0ffh	; 8739  .............

; ----------------------------------------------------------------------
; DATOS mosaico_f7_8746: mosaico de 1 x 3 caracteres comprimido (p01:6DA5:
;   0xF7-0xFE repite el siguiente, 0xFF acaba); lo leen p01:6D7B (4 bytes)
;   0x8746..0x874a  (4 bytes)
DATA_mosaico_f7_8746:
	defb 09eh,000h,01ah,0ffh	; 8746

; ----------------------------------------------------------------------
; DATOS dibujo_874A: 63 caracteres de 8x8 a 1 bit por punto (8 bytes cada
;   uno), ficha 0 de la lista 0x812A (p00:4D92, p00:4DF5); lo leen p01:6DE3,
;   p01:6F22, p01:6DCA (504 bytes)
;   0x874a..0x8942  (504 bytes)
DATA_dibujo_874A:
	defb 030h,030h,030h,030h,030h,078h,078h,048h	; 874a  00000xxH
	defb 048h,048h,0cch,0cch,0fch,0fch,0cch,0cch	; 8752  HH......
	defb 0f8h,0fch,0cch,0cch,0cch,0cch,0cch,0f8h	; 875a  ........
	defb 0fch,0cch,0cch,0cch,0cch,0cch,0fch,0f8h	; 8762  ........
	defb 078h,0fch,0cch,0cch,0cch,0c0h,0c0h,0c0h	; 876a  x.......
	defb 0c0h,0c0h,0cch,0cch,0cch,0cch,0fch,078h	; 8772  .......x
	defb 0f8h,0fch,0cch,0cch,0cch,0cch,0cch,0cch	; 877a  ........
	defb 0cch,0cch,0cch,0cch,0cch,0cch,0fch,0f8h	; 8782  ........
	defb 0fch,0fch,0c0h,0c0h,0c0h,0c0h,0f8h,0f8h	; 878a  ........
	defb 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0fch,0fch	; 8792  ........
	defb 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h	; 879a  ........
	defb 078h,0fch,0cch,0cch,0cch,0c0h,0c0h,0dch	; 87a2  x.......
	defb 0dch,0cch,0cch,0cch,0cch,0cch,0fch,074h	; 87aa  .......t
	defb 0cch,0cch,0cch,0cch,0cch,0cch,0fch,0fch	; 87b2  ........
	defb 0cch,0cch,0cch,0cch,0cch,0cch,0cch,0cch	; 87ba  ........
	defb 00ch,00ch,00ch,00ch,00ch,00ch,00ch,00ch	; 87c2  ........
	defb 00ch,00ch,0cch,0cch,0cch,0cch,0fch,078h	; 87ca  .......x
	defb 0cch,0cch,0d8h,0d8h,0f0h,0f0h,0e0h,0f0h	; 87d2  ........
	defb 0f0h,0f0h,0d8h,0d8h,0d8h,0cch,0cch,0cch	; 87da  ........
	defb 0c3h,0c3h,0c3h,0e7h,0e7h,0e7h,0ffh,0dbh	; 87e2  ........
	defb 0dbh,0dbh,0dbh,0c3h,0c3h,0c3h,0c3h,0c3h	; 87ea  ........
	defb 0cch,0cch,0cch,0ech,0ech,0ech,0fch,0fch	; 87f2  ........
	defb 0fch,0dch,0dch,0dch,0cch,0cch,0cch,0cch	; 87fa  ........
	defb 078h,0fch,0cch,0cch,0cch,0cch,0cch,0cch	; 8802  x.......
	defb 0cch,0cch,0cch,0cch,0cch,0cch,0fch,078h	; 880a  .......x
	defb 0f8h,0fch,0cch,0cch,0cch,0cch,0cch,0fch	; 8812  ........
	defb 0f8h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h	; 881a  ........
	defb 0f8h,0cch,0cch,0cch,0cch,0cch,0cch,0cch	; 8822  ........
	defb 078h,0fch,0cch,0cch,0cch,0e0h,070h,038h	; 882a  x.....p8
	defb 01ch,00ch,0cch,0cch,0cch,0cch,0fch,078h	; 8832  .......x
	defb 0fch,0fch,030h,030h,030h,030h,030h,030h	; 883a  ..000000
	defb 030h,030h,030h,030h,030h,030h,030h,030h	; 8842  00000000
	defb 0c3h,0c3h,0c3h,0c3h,066h,066h,066h,066h	; 884a  ....ffff
	defb 03ch,03ch,03ch,03ch,018h,018h,018h,018h	; 8852  <<<<....
	defb 0c3h,0c3h,0c3h,0c3h,0c3h,0dbh,0dbh,0dbh	; 885a  ........
	defb 0dbh,0dbh,07eh,07eh,07eh,066h,066h,066h	; 8862  ..~~~fff
	defb 0cch,0cch,0cch,0cch,078h,078h,078h,078h	; 886a  ....xxxx
	defb 040h,040h,0a0h,0a0h,0a0h,0e0h,0a0h,0a0h	; 8872  @@......
	defb 0c0h,0a0h,0a0h,0c0h,0a0h,0a0h,0a0h,0c0h	; 887a  ........
	defb 040h,0a0h,0a0h,080h,080h,0a0h,0a0h,040h	; 8882  @......@
	defb 0c0h,0a0h,0a0h,0a0h,0a0h,0a0h,0a0h,0c0h	; 888a  ........
	defb 0e0h,080h,080h,0c0h,080h,080h,080h,0e0h	; 8892  ........
	defb 0e0h,080h,080h,0c0h,080h,080h,080h,080h	; 889a  ........
	defb 040h,0a0h,0a0h,080h,0e0h,0a0h,0a0h,060h	; 88a2  @......`
	defb 0a0h,0a0h,0a0h,0e0h,0a0h,0a0h,0a0h,0a0h	; 88aa  ........
	defb 080h,080h,080h,080h,080h,080h,080h,080h	; 88b2  ........
	defb 080h,080h,080h,080h,080h,080h,080h,0e0h	; 88ba  ........
	defb 088h,088h,0d8h,0f8h,0a8h,0a8h,088h,088h	; 88c2  ........
	defb 090h,0d0h,0d0h,0b0h,0b0h,090h,090h,090h	; 88ca  ........
	defb 040h,0a0h,0a0h,0a0h,0a0h,0a0h,0a0h,040h	; 88d2  @......@
	defb 0c0h,0a0h,0a0h,0a0h,0c0h,080h,080h,080h	; 88da  ........
	defb 0c0h,0a0h,0a0h,0a0h,0c0h,0a0h,0a0h,0a0h	; 88e2  ........
	defb 040h,0a0h,080h,040h,020h,0a0h,0a0h,040h	; 88ea  @..@ ..@
	defb 0e0h,040h,040h,040h,040h,040h,040h,040h	; 88f2  .@@@@@@@
	defb 0a0h,0a0h,0a0h,0a0h,0a0h,0a0h,0a0h,040h	; 88fa  .......@
	defb 088h,088h,0a8h,0a8h,0a8h,070h,050h,050h	; 8902  .....pPP
	defb 0a0h,0a0h,0a0h,040h,040h,040h,040h,040h	; 890a  ...@@@@@
	defb 0c0h,040h,040h,040h,040h,040h,040h,040h	; 8912  .@@@@@@@
	defb 0e0h,0a0h,0a0h,0a0h,0e0h,020h,020h,0e0h	; 891a  .....  .
	defb 0e0h,0a0h,0a0h,0a0h,0a0h,0a0h,0a0h,0e0h	; 8922  ........
	defb 090h,0a0h,0c0h,0c0h,0a0h,0a0h,090h,090h	; 892a  ........
	defb 020h,020h,020h,020h,020h,0a0h,0a0h,040h	; 8932       ..@
	defb 0fch,0fch,00ch,00ch,018h,018h,018h,030h	; 893a  .......0

; ----------------------------------------------------------------------
; DATOS dibujo_8942: 5 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 1 de la lista 0x812A (p00:4D92, p00:4DF5); lo leen p01:6DE3,
;   p01:6F22, p01:6DCA (40 bytes)
;   0x8942..0x896a  (40 bytes)
DATA_dibujo_8942:
	defb 030h,060h,060h,060h,0c0h,0c0h,0fch,0fch	; 8942  0```....
	defb 0c6h,0c6h,0c6h,0c6h,06ch,06ch,06ch,038h	; 894a  ....lll8
	defb 038h,06ch,06ch,06ch,0c6h,0c6h,0c6h,0c6h	; 8952  8lll....
	defb 03ch,042h,099h,0a1h,0a1h,099h,042h,03ch	; 895a  <B....B<
	defb 040h,0a0h,0a0h,020h,040h,080h,080h,0e0h	; 8962  @.. @...

; ----------------------------------------------------------------------
; DATOS dibujo_896A: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 0 de la lista 0x82B8 (p00:4D92, p00:4DF5); lo leen p01:6CEF (8
;   bytes)
;   0x896a..0x8972  (8 bytes)
DATA_dibujo_896A:
	defb 000h,0c0h,000h,0c0h,000h,0c0h,000h,0c0h	; 896a  ........

; ----------------------------------------------------------------------
; DATOS dibujo_8972: 12 caracteres de 8x8 a 1 bit por punto (8 bytes cada
;   uno), ficha 1 de la lista 0x82B8 (p00:4D92, p00:4DF5); lo leen p01:6CEF
;   (96 bytes)
;   0x8972..0x89d2  (96 bytes)
DATA_dibujo_8972:
	defb 0ffh,000h,000h,000h,000h,000h,000h,000h	; 8972  ........
	defb 0ffh,080h,0bdh,0bdh,081h,08dh,081h,08dh	; 897a  ........
	defb 0ffh,000h,000h,09ah,09ah,09ah,000h,0ffh	; 8982  ........
	defb 0ffh,001h,001h,0b5h,091h,0d5h,001h,0ffh	; 898a  ........
	defb 081h,081h,081h,081h,081h,081h,081h,081h	; 8992  ........
	defb 081h,08dh,081h,08dh,081h,08dh,081h,0bdh	; 899a  ........
	defb 0ffh,081h,081h,081h,081h,081h,081h,081h	; 89a2  ........
	defb 0feh,080h,080h,0b4h,0a4h,0b6h,080h,0ffh	; 89aa  ........
	defb 0ffh,000h,000h,080h,0aah,0ffh,000h,0ffh	; 89b2  ........
	defb 0ffh,000h,01eh,09eh,09eh,09eh,000h,0ffh	; 89ba  ........
	defb 0ffh,000h,0edh,0edh,0edh,0edh,000h,0ffh	; 89c2  ........
	defb 0ffh,000h,050h,052h,050h,052h,000h,0ffh	; 89ca  ..PRPR..

; ----------------------------------------------------------------------
; DATOS dibujo_89D2: 4 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 2 de la lista 0x82B8 (p00:4D92, p00:4DF5); lo leen p01:6CEF
;   (64 bytes)
;   0x89d2..0x8a12  (64 bytes)
DATA_dibujo_89D2:
	defb 000h,0ffh,0c0h,000h,000h,000h,0c0h,000h,000h,000h,0c0h,000h,000h,000h,0c0h,000h	; 89d2  ................
	defb 000h,0ffh,000h,081h,05ah,081h,000h,081h,05eh,081h,000h,081h,056h,081h,000h,081h	; 89e2  ....Z...^...V...
	defb 04ch,081h,000h,081h,04ch,081h,000h,081h,04ch,081h,000h,081h,05ch,081h,000h,081h	; 89f2  L...L...L...\...
	defb 05eh,081h,000h,081h,058h,081h,000h,081h,058h,081h,000h,081h,05ch,081h,000h,081h	; 8a02  ^...X...X...\...

; ----------------------------------------------------------------------
; DATOS dibujo_8A12: 2 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 3 de la lista 0x82B8 (p00:4D92, p00:4DF5); lo leen p01:6CEF (16
;   bytes)
;   0x8a12..0x8a22  (16 bytes)
DATA_dibujo_8A12:
	defb 000h,000h,000h,000h,000h,000h,000h,00fh	; 8a12  ........
	defb 00fh,00fh,00fh,00fh,00fh,00fh,003h,000h	; 8a1a  ........

; ----------------------------------------------------------------------
; DATOS dibujo_8A22: 2 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 4 de la lista 0x82B8 (p00:4D92, p00:4DF5); lo leen p01:6CEF (16
;   bytes)
;   0x8a22..0x8a32  (16 bytes)
DATA_dibujo_8A22:
	defb 000h,000h,000h,000h,000h,0ffh,0ffh,0e0h	; 8a22  ........
	defb 000h,000h,000h,000h,000h,0f0h,0f0h,000h	; 8a2a  ........

; ----------------------------------------------------------------------
; DATOS dibujo_8A32: 2 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 5 de la lista 0x82B8 (p00:4D92, p00:4DF5); lo leen p01:6CEF (16
;   bytes)
;   0x8a32..0x8a42  (16 bytes)
DATA_dibujo_8A32:
	defb 0fch,0fch,000h,0c0h,0c0h,0c0h,000h,000h	; 8a32  ........
	defb 000h,000h,000h,0ffh,0ffh,0ffh,000h,000h	; 8a3a  ........

; ----------------------------------------------------------------------
; DATOS dibujo_8A42: 3 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 6 de la lista 0x82B8 (p00:4D92, p00:4DF5); lo leen p01:6CEF (24
;   bytes)
;   0x8a42..0x8a5a  (24 bytes)
DATA_dibujo_8A42:
	defb 000h,000h,008h,0f8h,008h,000h,000h,000h	; 8a42  ........
	defb 000h,000h,080h,0ffh,080h,000h,000h,000h	; 8a4a  ........
	defb 000h,000h,004h,0fch,004h,000h,000h,000h	; 8a52  ........

; ----------------------------------------------------------------------
; DATOS dibujo_8A5A: 3 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 7 de la lista 0x82B8 (p00:4D92, p00:4DF5); lo leen p01:6CEF
;   (48 bytes)
;   0x8a5a..0x8a8a  (48 bytes)
DATA_dibujo_8A5A:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,07dh,07ch,07dh,07ch,0fdh,0fch	; 8a5a  ..........}|}|..
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0ffh,000h,000h,0ffh,0ffh,000h	; 8a6a  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0ffh,000h,0c3h,03ch,0ffh,000h	; 8a7a  .............<..

; ----------------------------------------------------------------------
; DATOS dibujo_8A8A: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 8 de la lista 0x82B8 (p00:4D92, p00:4DF5); lo leen p01:6CEF
;   (32 bytes)
;   0x8a8a..0x8aaa  (32 bytes)
DATA_dibujo_8A8A:
	defb 087h,078h,085h,07ah,0b5h,000h,0ffh,078h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fch,0fch	; 8a8a  .x.z...x........
	defb 077h,088h,055h,0aah,022h,000h,0ffh,088h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h	; 8a9a  w.U."...........

; ----------------------------------------------------------------------
; DATOS dibujo_8AAA: 3 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 9 de la lista 0x82B8 (p00:4D92, p00:4DF5); lo leen p01:6CEF
;   (48 bytes)
;   0x8aaa..0x8ada  (48 bytes)
DATA_dibujo_8AAA:
	defb 0dfh,01fh,0bfh,03fh,000h,000h,080h,09fh,080h,09fh,000h,03fh,000h,000h,000h,000h	; 8aaa  ...?.......?....
	defb 0ffh,0ffh,0ffh,0ffh,000h,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,000h,000h,000h	; 8aba  ................
	defb 0f8h,0f8h,0f8h,0f8h,000h,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,000h,000h,000h	; 8aca  ................

; ----------------------------------------------------------------------
; DATOS dibujo_8ADA: 3 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 10 de la lista 0x82B8 (p00:4D92, p00:4DF5); lo leen p01:6CEF
;   (48 bytes)
;   0x8ada..0x8b0a  (48 bytes)
DATA_dibujo_8ADA:
	defb 000h,000h,000h,000h,000h,000h,0ffh,000h,000h,000h,0c0h,0dah,0c0h,0d2h,0c0h,0c0h	; 8ada  ................
	defb 000h,000h,000h,000h,000h,000h,0ffh,000h,000h,000h,000h,0beh,000h,0b4h,000h,000h	; 8aea  ................
	defb 000h,000h,000h,000h,008h,000h,00fh,000h,008h,000h,003h,003h,003h,003h,003h,003h	; 8afa  ................

; ----------------------------------------------------------------------
; DATOS dibujo_8B0A: 2 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 11 de la lista 0x82B8 (p00:4D92, p00:4DF5); lo leen p01:6CEF
;   (48 bytes)
;   0x8b0a..0x8b3a  (48 bytes)
DATA_dibujo_8B0A:
	defb 0e7h,0e7h,000h,081h,081h,000h,006h,000h,036h,000h,000h,000h,034h,000h,034h,081h,081h,000h,0e7h,0e7h,000h,000h,000h,000h	; 8b0a  ........6...4.4.........
	defb 074h,089h,088h,026h,0d9h,0d8h,025h,0d8h,0d8h,025h,0d9h,0d8h,001h,0fdh,0fch,001h,0fdh,0fch,001h,0fdh,0fch,001h,00dh,00ch	; 8b22  t..&..%..%..............

; ----------------------------------------------------------------------
; DATOS dibujo_8B3A: 14 caracteres de 8x8 a 1 bit por punto (8 bytes cada
;   uno), ficha 12 de la lista 0x82B8 (p00:4D92, p00:4DF5); lo leen p01:6CEF
;   (112 bytes)
;   0x8b3a..0x8baa  (112 bytes)
DATA_dibujo_8B3A:
	defb 000h,000h,000h,000h,000h,000h,000h,01fh	; 8b3a  ........
	defb 000h,000h,000h,000h,000h,007h,0fah,002h	; 8b42  ........
	defb 000h,000h,000h,001h,03eh,0c2h,002h,002h	; 8b4a  ....>...
	defb 000h,000h,00fh,0f8h,008h,008h,008h,008h	; 8b52  ........
	defb 000h,07ch,0c4h,044h,044h,044h,044h,044h	; 8b5a  .|.DDDDD
	defb 003h,03ch,020h,020h,020h,020h,020h,020h	; 8b62  .<
	defb 044h,044h,044h,044h,044h,044h,044h,044h	; 8b6a  DDDDDDDD
	defb 020h,03fh,020h,020h,020h,020h,020h,020h	; 8b72   ?
	defb 044h,0fch,0e4h,044h,044h,044h,044h,044h	; 8b7a  D..DDDDD
	defb 020h,020h,020h,021h,03eh,020h,020h,020h	; 8b82     !>
	defb 044h,044h,044h,044h,044h,044h,044h,044h	; 8b8a  DDDDDDDD
	defb 020h,020h,020h,03fh,020h,020h,020h,020h	; 8b92     ?
	defb 020h,020h,020h,020h,020h,020h,020h,020h	; 8b9a
	defb 004h,004h,004h,004h,004h,004h,004h,007h	; 8ba2  ........

; ----------------------------------------------------------------------
; DATOS dibujo_8BAA: 6 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 13 de la lista 0x82B8 (p00:4D92, p00:4DF5); lo leen p01:6CEF (48
;   bytes)
;   0x8baa..0x8bda  (48 bytes)
DATA_dibujo_8BAA:
	defb 038h,0c0h,000h,000h,003h,00ch,030h,0c0h	; 8baa  8.....0.
	defb 004h,00ch,030h,0c0h,000h,000h,000h,000h	; 8bb2  ..0.....
	defb 0c0h,000h,000h,000h,003h,00ch,030h,0c0h	; 8bba  ......0.
	defb 003h,00ch,030h,0c0h,000h,000h,000h,000h	; 8bc2  ..0.....
	defb 020h,020h,020h,020h,023h,02ch,030h,000h	; 8bca      #,0.
	defb 003h,00ch,030h,0c0h,000h,000h,000h,000h	; 8bd2  ..0.....

; ----------------------------------------------------------------------
; DATOS dibujo_8BDA: 8 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 14 de la lista 0x82B8 (p00:4D92, p00:4DF5); lo leen p01:6CEF (64
;   bytes)
;   0x8bda..0x8c1a  (64 bytes)
DATA_dibujo_8BDA:
	defb 000h,000h,027h,021h,023h,021h,027h,000h	; 8bda  ..'!#!'.
	defb 000h,000h,077h,041h,071h,051h,071h,000h	; 8be2  ..wAqQq.
	defb 000h,000h,077h,045h,077h,011h,077h,000h	; 8bea  ..wEw.w.
	defb 000h,000h,067h,065h,071h,022h,027h,000h	; 8bf2  ..geq"'.
	defb 000h,000h,027h,025h,027h,025h,027h,000h	; 8bfa  ..'%'%'.
	defb 000h,000h,077h,015h,035h,015h,077h,000h	; 8c02  ..w.5.w.
	defb 000h,000h,072h,012h,032h,012h,072h,000h	; 8c0a  ..r.2.r.
	defb 000h,000h,077h,055h,055h,055h,077h,000h	; 8c12  ..wUUUw.

; ----------------------------------------------------------------------
; DATOS dibujo_8C1A: 4 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 15 de la lista 0x82B8 (p00:4D92, p00:4DF5); lo leen p01:6CEF
;   (64 bytes)
;   0x8c1a..0x8c5a  (64 bytes)
DATA_dibujo_8C1A:
	defb 0e4h,000h,004h,000h,004h,000h,004h,000h,004h,000h,004h,000h,005h,001h,004h,001h	; 8c1a  ................
	defb 006h,003h,0feh,003h,006h,003h,006h,003h,006h,002h,005h,001h,005h,001h,005h,001h	; 8c2a  ................
	defb 018h,01ah,0feh,005h,002h,002h,003h,001h,003h,000h,00eh,000h,0f2h,000h,002h,000h	; 8c3a  ................
	defb 0bah,0c0h,082h,0a0h,042h,060h,042h,050h,022h,028h,012h,014h,008h,00ah,006h,005h	; 8c4a  ....B`BP"(......

; ----------------------------------------------------------------------
; DATOS dibujo_8C5A: 8 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 16 de la lista 0x82B8 (p00:4D92, p00:4DF5); lo leen p01:6CEF
;   (128 bytes)
;   0x8c5a..0x8cda  (128 bytes)
DATA_dibujo_8C5A:
	defb 008h,000h,008h,000h,078h,070h,08eh,086h,00ah,002h,009h,001h,009h,001h,009h,001h	; 8c5a  ....xp..........
	defb 005h,001h,007h,001h,03eh,002h,0c6h,002h,004h,004h,004h,004h,004h,004h,00ch,008h	; 8c6a  ....>...........
	defb 00ch,008h,00ch,008h,00ch,008h,0ffh,004h,006h,006h,005h,001h,004h,000h,004h,000h	; 8c7a  ................
	defb 044h,000h,044h,000h,04ch,000h,0f0h,000h,0c0h,00ch,000h,034h,000h,0c4h,000h,004h	; 8c8a  D.D.L......4....
	defb 002h,000h,002h,000h,002h,000h,003h,000h,00eh,000h,030h,001h,0c0h,00eh,000h,030h	; 8c9a  ..........0....0
	defb 003h,000h,01ch,000h,060h,003h,080h,01ch,000h,060h,000h,080h,000h,000h,000h,000h	; 8caa  ....`....`......
	defb 020h,000h,020h,000h,023h,000h,02ch,000h,030h,003h,000h,00ch,000h,030h,000h,020h	; 8cba   . .#.,.0....0.
	defb 018h,000h,060h,007h,080h,018h,000h,060h,000h,080h,000h,000h,000h,000h,000h,000h	; 8cca  ..`....`........

; ----------------------------------------------------------------------
; DATOS dibujo_8CDA: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 17 de la lista 0x82B8 (p00:4D92, p00:4DF5); lo leen p01:6CEF
;   (32 bytes)
;   0x8cda..0x8cfa  (32 bytes)
DATA_dibujo_8CDA:
	defb 000h,002h,0fbh,004h,002h,008h,002h,010h,082h,0a0h,082h,0a0h,082h,0c0h,047h,0c0h	; 8cda  ..............G.
	defb 002h,000h,002h,000h,002h,000h,002h,000h,002h,000h,002h,001h,000h,002h,082h,084h	; 8cea  ................

; ----------------------------------------------------------------------
; DATOS dibujo_8CFA: 7 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 18 de la lista 0x82B8 (p00:4D92, p00:4DF5); lo leen p01:6CEF
;   (168 bytes)
;   0x8cfa..0x8da2  (168 bytes)
DATA_dibujo_8CFA:
	defb 002h,000h,000h,002h,000h,000h,002h,000h,000h,002h,000h,000h,03eh,03eh,000h,0ffh,0c1h,03ch,083h,080h,003h,002h,001h,000h	; 8cfa  ............>>...<......
	defb 002h,000h,000h,002h,000h,000h,002h,000h,000h,000h,003h,000h,002h,00ch,000h,0c2h,0f0h,000h,0b2h,070h,080h,06eh,08ch,060h	; 8d12  ...................p.n.`
	defb 008h,001h,000h,0fdh,002h,000h,089h,082h,000h,05ch,042h,000h,0e8h,024h,080h,068h,024h,040h,050h,018h,040h,030h,018h,020h	; 8d2a  .........\B..$.h$@P.@0.
	defb 028h,018h,020h,018h,028h,010h,018h,028h,010h,01ch,044h,010h,00ch,084h,008h,00ch,004h,008h,00ch,004h,008h,00ch,004h,008h	; 8d42  (. .(..(..D.............
	defb 003h,000h,003h,002h,000h,000h,002h,000h,000h,0fch,003h,000h,002h,01ch,000h,002h,0e0h,000h,002h,000h,000h,002h,000h,000h	; 8d5a  ........................
	defb 062h,078h,000h,0deh,03ch,0c0h,03bh,0c3h,038h,0ffh,000h,007h,002h,000h,000h,002h,000h,000h,002h,000h,000h,002h,000h,000h	; 8d72  bx..<...8...............
	defb 008h,008h,000h,018h,018h,000h,0f8h,0e0h,010h,0ffh,000h,0c0h,009h,000h,000h,00eh,000h,000h,038h,000h,001h,0c0h,000h,006h	; 8d8a  ..................8.....

; ----------------------------------------------------------------------
; DATOS dibujo_8DA2: 2 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 19 de la lista 0x82B8 (p00:4D92, p00:4DF5); lo leen p01:6CEF (16
;   bytes)
;   0x8da2..0x8db2  (16 bytes)
DATA_dibujo_8DA2:
	defb 040h,040h,040h,040h,040h,040h,040h,040h	; 8da2  @@@@@@@@
	defb 040h,040h,0c0h,000h,000h,000h,000h,000h	; 8daa  @@......

; ----------------------------------------------------------------------
; DATOS dibujo_8DB2: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 20 de la lista 0x82B8 (p00:4D92, p00:4DF5); lo leen p01:6CEF
;   (16 bytes)
;   0x8db2..0x8dc2  (16 bytes)
DATA_dibujo_8DB2:
	defb 090h,050h,010h,010h,070h,0f0h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 8db2  .P..p...........

; ----------------------------------------------------------------------
; DATOS dibujo_8DC2: 5 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 21 de la lista 0x82B8 (p00:4D92, p00:4DF5); lo leen p01:6CEF
;   (80 bytes)
;   0x8dc2..0x8e12  (80 bytes)
DATA_dibujo_8DC2:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0c0h,000h,070h,0f0h	; 8dc2  ..............p.
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0c0h,000h,0e0h,0e0h	; 8dd2  ................
	defb 020h,0a0h,020h,020h,0e0h,0e0h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 8de2   .  ............
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,080h,000h,0c0h,0c0h	; 8df2  ................
	defb 040h,040h,000h,040h,000h,040h,000h,040h,000h,040h,000h,040h,000h,040h,000h,040h	; 8e02  @@.@.@.@.@.@.@.@

; ----------------------------------------------------------------------
; DATOS dibujo_8E12: 5 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 22 de la lista 0x82B8 (p00:4D92, p00:4DF5); lo leen p01:6CEF
;   (80 bytes)
;   0x8e12..0x8e62  (80 bytes)
DATA_dibujo_8E12:
	defb 028h,020h,0ffh,020h,028h,020h,020h,0ffh,068h,020h,03fh,020h,028h,020h,028h,020h	; 8e12  ( . (  .h ? ( (
	defb 050h,040h,0ffh,040h,050h,040h,040h,0ffh,0d0h,040h,07fh,040h,050h,040h,050h,040h	; 8e22  P@.@P@@..@.@P@P@
	defb 0a0h,020h,0a0h,020h,0a0h,020h,0a0h,020h,0a0h,020h,0a0h,020h,0a0h,020h,0a0h,020h	; 8e32  . . . . . . . .
	defb 0a0h,005h,03eh,041h,032h,045h,032h,085h,03eh,081h,0a0h,005h,0a0h,005h,05ch,0a1h	; 8e42  ..>A2E2.>.....\.
	defb 0a0h,081h,0ffh,080h,0a0h,080h,0a0h,0dfh,0a0h,080h,0ffh,080h,0a0h,080h,0a0h,080h	; 8e52  ................

; ----------------------------------------------------------------------
; DATOS dibujo_8E62: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 23 de la lista 0x82B8 (p00:4D92, p00:4DF5); lo leen p01:6CEF
;   (32 bytes)
;   0x8e62..0x8e82  (32 bytes)
DATA_dibujo_8E62:
	defb 0c0h,090h,0c0h,090h,0c0h,090h,0c0h,090h,0c0h,010h,0e0h,010h,0c0h,090h,0c0h,090h	; 8e62  ................
	defb 0c0h,090h,0c0h,090h,0c0h,090h,0c0h,090h,0c0h,090h,0c0h,090h,0c0h,090h,0c0h,090h	; 8e72  ................

; ----------------------------------------------------------------------
; DATOS dibujo_8E82: 59 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 24 de la lista 0x82B8 (p00:4D92, p00:4DF5); lo leen p01:6CEF
;   (1416 bytes)
;   0x8e82..0x940a  (1416 bytes)
DATA_dibujo_8E82:
	defb 000h,003h,000h,000h,001h,000h,000h,004h,000h,000h,00ah,000h,00ah,03fh,000h,000h,0c0h,000h,01fh,004h,01bh,060h,004h,060h	; 8e82  .............?.......`.`
	defb 000h,002h,002h,000h,002h,002h,000h,002h,002h,000h,002h,002h,000h,002h,002h,000h,002h,001h,040h,07ch,002h,0a8h,0bah,006h	; 8e9a  ..................@|....
	defb 014h,089h,080h,004h,091h,080h,004h,091h,080h,004h,091h,080h,003h,0a4h,080h,002h,028h,0c8h,002h,0d8h,0b8h,022h,065h,095h	; 8eb2  ................(...."e.
	defb 011h,0a5h,010h,012h,0e6h,050h,015h,0a5h,010h,01ah,0aeh,010h,055h,0b5h,040h,07bh,0aeh,010h,056h,0fdh,001h,0ach,0aah,002h	; 8eca  .....P......U.@{..V.....
	defb 050h,05ah,007h,0a0h,0aah,006h,070h,045h,003h,098h,0e2h,061h,007h,0d0h,0d0h,01bh,0eeh,000h,001h,01ah,010h,001h,08ah,070h	; 8ee2  PZ....pE...a...........p
	defb 022h,0a1h,0d1h,021h,060h,090h,001h,0dfh,0beh,063h,060h,080h,0a5h,03ah,09ah,065h,020h,000h,068h,0a2h,002h,068h,0b7h,015h	; 8efa  "..!`....c`..:.e .h..h..
	defb 055h,035h,080h,001h,07fh,080h,0dch,003h,0cch,0f0h,003h,020h,051h,083h,080h,0c5h,013h,004h,009h,013h,008h,001h,0e3h,010h	; 8f12  U5......... Q...........
	defb 058h,055h,004h,0b0h,0aeh,009h,060h,0cah,009h,0c0h,092h,011h,000h,001h,070h,000h,007h,0cfh,000h,000h,0c8h,08fh,000h,070h	; 8f2a  XU....`.......p........p
	defb 001h,002h,088h,041h,052h,024h,001h,002h,056h,041h,050h,024h,001h,008h,096h,000h,090h,069h,040h,010h,049h,0f1h,008h,006h	; 8f42  ...AR$..VAP$.....i@.I...
	defb 0b0h,0a2h,002h,031h,063h,002h,068h,062h,002h,028h,032h,002h,034h,033h,003h,024h,029h,001h,03ah,0adh,085h,032h,0a4h,080h	; 8f5a  ...1c.hb.(2.43.$).:..2..
	defb 081h,080h,001h,0ffh,0ffh,000h,003h,008h,000h,000h,00bh,000h,003h,0cfh,000h,000h,032h,000h,000h,00ah,000h,000h,0feh,0f8h	; 8f72  ................2.......
	defb 02dh,0b6h,092h,0e2h,0fah,000h,001h,0ffh,0dah,000h,0c2h,098h,001h,0dah,0bch,042h,0c2h,080h,042h,0e7h,0bdh,066h,0dah,080h	; 8f8a  -..............B..B..f..
	defb 000h,002h,002h,000h,002h,002h,000h,002h,002h,000h,002h,002h,000h,002h,002h,000h,003h,002h,060h,07eh,001h,0a0h,0bch,002h	; 8fa2  ..................`~....
	defb 014h,089h,080h,004h,091h,080h,004h,091h,080h,004h,091h,080h,003h,0a4h,080h,002h,008h,0e8h,022h,0e8h,098h,022h,0a5h,0cdh	; 8fba  ..................".."..
	defb 011h,0a5h,010h,012h,0e6h,050h,015h,0a5h,010h,01ah,0afh,010h,054h,0b6h,040h,079h,0adh,010h,052h,0fbh,001h,0a4h,0b6h,002h	; 8fd2  .....P......T.@y..R.....
	defb 048h,06ch,002h,090h,0d4h,002h,030h,0a2h,001h,050h,061h,020h,08eh,0d1h,050h,014h,0fch,000h,000h,014h,000h,080h,044h,0b8h	; 8fea  Hl....0..Pa ..P.......D.
	defb 002h,041h,0a9h,021h,0a0h,0c8h,021h,0efh,09eh,013h,010h,0e0h,095h,01ah,00ah,055h,010h,000h,058h,092h,002h,058h,097h,005h	; 9002  .A.!..!........U..X..X..
	defb 055h,035h,080h,001h,07fh,080h,0dch,003h,0cch,0f0h,007h,020h,050h,086h,080h,0c2h,015h,002h,008h,015h,008h,000h,0e5h,010h	; 901a  U5......... P...........
	defb 049h,06ch,005h,092h,09dh,00eh,022h,0a9h,00ah,042h,071h,032h,081h,080h,039h,080h,083h,067h,080h,080h,064h,087h,080h,038h	; 9032  Il...."..Bq2..9..g..d..8
	defb 000h,080h,044h,000h,00ch,092h,000h,004h,0aah,000h,00ch,092h,000h,08ch,043h,080h,042h,0bch,040h,01ah,044h,0f0h,00ch,003h	; 904a  ..D...........C.B.@.D...
	defb 0b0h,092h,002h,031h,053h,002h,058h,052h,002h,018h,032h,002h,034h,033h,003h,014h,019h,081h,01ah,01dh,085h,012h,094h,080h	; 9062  ...1S.XR..2.43..........
	defb 01dh,096h,082h,0f2h,0fah,000h,001h,0ffh,0dah,000h,0c2h,098h,001h,0dah,0bch,042h,0c2h,080h,042h,0e7h,0bdh,066h,0dah,080h	; 907a  ...............B..B..f..
	defb 000h,000h,000h,080h,000h,000h,0c0h,000h,000h,07fh,010h,00fh,0b0h,00fh,010h,030h,00bh,010h,0b0h,009h,010h,0f0h,009h,010h	; 9092  ...............0........
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,000h,000h,000h,000h,0ffh,000h,007h,007h,038h	; 90aa  .......................8
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,0e0h,020h,0c0h,000h,0fch,000h,000h,0a3h,0a0h,000h,0ffh,000h,0ffh,0ffh,000h	; 90c2  .......... .............
	defb 0b0h,009h,010h,037h,048h,010h,034h,049h,010h,034h,089h,010h,037h,088h,010h,0b0h,009h,010h,0b0h,009h,010h,05ch,0a1h,000h	; 90da  ...7H.4I.4..7........\..
	defb 000h,008h,028h,08fh,008h,020h,0a8h,020h,000h,0a8h,021h,000h,0a8h,021h,000h,028h,021h,000h,028h,021h,000h,028h,020h,000h	; 90f2  ..(.. . ..!..!.(!.(!.( .
	defb 000h,0a0h,0a0h,0ffh,000h,000h,000h,0e0h,000h,078h,080h,078h,080h,034h,0a0h,080h,034h,0a0h,080h,064h,080h,000h,0a4h,020h	; 910a  .........x.x.4..4..d...
	defb 000h,040h,050h,0c0h,040h,010h,050h,090h,080h,050h,090h,080h,050h,090h,080h,050h,090h,080h,050h,090h,080h,050h,090h,080h	; 9122  .@P.@.P..P..P..P..P..P..
	defb 0b0h,00bh,012h,080h,0bbh,044h,0beh,045h,082h,024h,0dfh,09ah,0a4h,04fh,002h,088h,0bbh,044h,0b0h,009h,010h,0b0h,009h,010h	; 913a  .....D.E.$...O...D......
	defb 010h,0e8h,090h,0f6h,000h,006h,01eh,0a0h,0b2h,01fh,0e0h,000h,012h,0a0h,0b2h,0ffh,000h,000h,01ah,0a0h,0bah,006h,0a0h,0a6h	; 9152  ........................
	defb 0b0h,009h,000h,0b0h,009h,000h,0b0h,08fh,006h,030h,09fh,006h,000h,0a9h,000h,000h,0a5h,000h,000h,0e3h,040h,000h,0a1h,000h	; 916a  .........0..........@...
	defb 028h,020h,000h,028h,021h,000h,028h,0f7h,0d6h,028h,0f7h,0d6h,028h,020h,000h,028h,020h,000h,028h,020h,000h,028h,0f7h,0d7h	; 9182  ( .(!.(..(..( .( .( .(..
	defb 000h,0e0h,000h,078h,080h,078h,080h,034h,0a0h,080h,034h,0a0h,080h,064h,080h,000h,08ch,008h,000h,07bh,003h,000h,0ffh,0ffh	; 919a  ...x.x.4..4..d.....{....
	defb 00fh,088h,020h,080h,040h,0a0h,003h,003h,03ch,014h,0e0h,064h,012h,0c0h,042h,010h,0aah,028h,010h,0a6h,0a4h,000h,0e2h,010h	; 91b2  .. .@...<..d..B..(......
	defb 000h,000h,000h,080h,000h,000h,0c0h,000h,000h,06fh,008h,007h,0a0h,00fh,000h,024h,00bh,004h,0a4h,009h,004h,0e4h,009h,004h	; 91ca  .........o.....$........
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,000h,000h,000h,000h,0ffh,000h,00fh,00fh,070h	; 91e2  .......................p
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,0f0h,010h,0e0h,000h,0fch,000h,000h,023h,020h,000h,0ffh,000h,0ffh,0ffh,000h	; 91fa  ................# ......
	defb 0a4h,009h,004h,02fh,040h,000h,02dh,040h,004h,02dh,080h,004h,02fh,080h,000h,0a4h,009h,004h,0a4h,009h,004h,05ch,0a1h,000h	; 9212  .../@.-@.-../........\..
	defb 000h,000h,040h,01fh,010h,040h,050h,040h,000h,050h,041h,000h,051h,040h,001h,051h,040h,001h,051h,040h,001h,050h,041h,000h	; 922a  ..@..@P@.PA.Q@.Q@.Q@.PA.
	defb 000h,020h,020h,0ffh,000h,000h,000h,0e1h,001h,0f0h,001h,0f1h,000h,039h,021h,000h,039h,021h,000h,0e9h,001h,000h,029h,021h	; 9242  .  ..........9!.9!....)!
	defb 000h,040h,060h,080h,080h,020h,0a0h,020h,000h,0a0h,020h,000h,0a0h,020h,000h,0a0h,020h,000h,0a0h,020h,000h,0a0h,020h,000h	; 925a  .@`.. . .. .. .. .. .. .
	defb 0b4h,00bh,016h,080h,0bbh,044h,0beh,045h,082h,024h,0dfh,09ah,0a4h,04fh,002h,088h,0bbh,044h,0a4h,009h,004h,0a4h,009h,004h	; 9272  .....D.E.$...O...D......
	defb 020h,0d1h,021h,0fch,001h,00dh,03ch,001h,031h,03fh,0c0h,000h,024h,001h,025h,0ffh,000h,000h,034h,001h,035h,00ch,021h,02dh	; 928a   .!...<.1?..$.%...4.5.!-
	defb 0a4h,009h,004h,0a4h,009h,004h,0a4h,08bh,006h,024h,08bh,006h,004h,0a9h,004h,004h,0a9h,004h,000h,0e5h,040h,000h,0a3h,000h	; 92a2  .........$..........@...
	defb 050h,040h,000h,050h,041h,000h,051h,0eeh,0afh,051h,0eeh,0afh,051h,040h,001h,050h,041h,000h,050h,040h,000h,050h,0cfh,08fh	; 92ba  P@.PA.Q..Q..Q@.PA.P@.P..
	defb 000h,0e1h,001h,0f0h,001h,0f1h,000h,0f9h,0e1h,000h,0f9h,0e1h,000h,0e9h,001h,000h,00dh,005h,000h,0f3h,003h,000h,0ffh,0ffh	; 92d2  ........................
	defb 01fh,010h,040h,000h,080h,040h,007h,007h,078h,014h,0e0h,064h,012h,0c0h,042h,010h,0aah,028h,010h,0a6h,0a4h,000h,0e2h,010h	; 92ea  ..@..@..x..d..B..(......
	defb 000h,000h,000h,080h,000h,000h,0c0h,000h,000h,067h,004h,003h,0a0h,007h,000h,020h,007h,000h,0a0h,005h,000h,0e0h,005h,000h	; 9302  .........g..... ........
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,000h,000h,000h,000h,0ffh,000h,00fh,00fh,0f0h	; 931a  ........................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,0fch,004h,0f8h,000h,0feh,000h,000h,009h,008h,000h,0ffh,000h,0ffh,0ffh,000h	; 9332  ........................
	defb 080h,080h,000h,0bfh,0a0h,000h,0a0h,081h,000h,0a0h,083h,000h,0a2h,080h,002h,0a2h,080h,002h,0a2h,081h,002h,0a0h,082h,000h	; 934a  ........................
	defb 000h,008h,008h,0ffh,001h,000h,001h,0c8h,008h,0c1h,028h,0c8h,001h,038h,008h,001h,038h,008h,001h,0f8h,028h,001h,038h,028h	; 9362  ..........(..8..8...(.8(
	defb 0b4h,00bh,016h,080h,0bbh,044h,0beh,045h,082h,024h,0dfh,09ah,0a4h,04fh,002h,080h,0bbh,044h,0a0h,005h,000h,0a0h,005h,000h	; 937a  .....D.E.$...O...D......
	defb 041h,0a8h,048h,0f9h,000h,018h,06dh,080h,0e8h,0ffh,000h,000h,049h,0a0h,0e8h,0ffh,000h,000h,069h,080h,0e8h,019h,0a0h,0b8h	; 9392  A.H...m.....I.....i.....
	defb 0a0h,005h,000h,0a0h,005h,000h,0a0h,087h,002h,020h,087h,002h,000h,0a5h,000h,000h,0a5h,000h,000h,0e5h,040h,000h,0a5h,000h	; 93aa  ......... ..........@...
	defb 0a0h,081h,000h,0a0h,083h,000h,0a2h,0dch,05eh,0a2h,0dch,05eh,0a2h,081h,002h,0a0h,082h,000h,0a0h,0c1h,040h,0a0h,09fh,01fh	; 93c2  ........^..^........@...
	defb 001h,0e8h,028h,0c1h,028h,0c8h,001h,0b8h,088h,001h,0b8h,088h,001h,0f8h,028h,001h,0b4h,0a4h,001h,0e2h,002h,001h,0feh,0feh	; 93da  ..(.(.........(.........
	defb 0bfh,0a0h,000h,080h,080h,000h,087h,087h,078h,014h,0e0h,064h,012h,0c0h,042h,010h,0aah,028h,010h,0a6h,0a4h,000h,0e2h,010h	; 93f2  ........x..d..B..(......

; ----------------------------------------------------------------------
; DATOS dibujo_940A: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 0 de la lista 0x8195 (p00:4D92, p00:4DF5); lo leen p01:6CFB (8
;   bytes)
;   0x940a..0x9412  (8 bytes)
DATA_dibujo_940A:
	defb 000h,000h,000h,000h,000h,000h,030h,0f8h	; 940a  ......0.

; ----------------------------------------------------------------------
; DATOS dibujo_9412: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 1 de la lista 0x8195 (p00:4D92, p00:4DF5); lo leen p01:6CFB (8
;   bytes)
;   0x9412..0x941a  (8 bytes)
DATA_dibujo_9412:
	defb 007h,000h,000h,000h,000h,000h,000h,000h	; 9412  ........

; ----------------------------------------------------------------------
; DATOS dibujo_941A: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 2 de la lista 0x8195 (p00:4D92, p00:4DF5); lo leen p01:6CFB
;   (16 bytes)
;   0x941a..0x942a  (16 bytes)
DATA_dibujo_941A:
	defb 000h,000h,000h,000h,000h,000h,060h,0f0h,0e0h,0f8h,08ch,0f0h,03ch,0c0h,0fch,000h	; 941a  ......`.....<...

; ----------------------------------------------------------------------
; DATOS dibujo_942A: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 3 de la lista 0x8195 (p00:4D92, p00:4DF5); lo leen p01:6CFB
;   (16 bytes)
;   0x942a..0x943a  (16 bytes)
DATA_dibujo_942A:
	defb 080h,018h,008h,018h,018h,018h,00ch,01ch,006h,00eh,003h,007h,000h,003h,000h,000h	; 942a  ................

; ----------------------------------------------------------------------
; DATOS dibujo_943A: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 4 de la lista 0x8195 (p00:4D92, p00:4DF5); lo leen p01:6CFB
;   (16 bytes)
;   0x943a..0x944a  (16 bytes)
DATA_dibujo_943A:
	defb 0a0h,0c3h,040h,081h,0c1h,001h,080h,041h,081h,063h,016h,0ffh,015h,09fh,00ah,09eh	; 943a  ..@....A.c......

; ----------------------------------------------------------------------
; DATOS dibujo_944A: 3 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 5 de la lista 0x8195 (p00:4D92, p00:4DF5); lo leen p01:6CFB
;   (48 bytes)
;   0x944a..0x947a  (48 bytes)
DATA_dibujo_944A:
	defb 055h,0fdh,0d5h,0d5h,03fh,0adh,0ffh,0cbh,0feh,03bh,0fch,0e7h,079h,01eh,0e3h,0fdh	; 944a  U...?.......y...
	defb 0aah,0abh,02ah,0ebh,0dch,0d5h,03ch,037h,0fch,0cbh,0f8h,037h,0e1h,0deh,003h,0fch	; 945a  ..*...<7...7....
	defb 000h,0f1h,0e1h,0fdh,018h,0feh,0e4h,0ffh,03ah,0ffh,0dah,0ffh,02dh,0ffh,0d5h,0ffh	; 946a  ........:...-...

; ----------------------------------------------------------------------
; DATOS dibujo_947A: 5 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 6 de la lista 0x8195 (p00:4D92, p00:4DF5); lo leen p01:6CFB
;   (120 bytes)
;   0x947a..0x94f2  (120 bytes)
DATA_dibujo_947A:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,001h,003h,000h,007h,00fh,000h,00eh,03dh,000h,068h,0ffh,010h	; 947a  ...................=.h..
	defb 08ch,0f3h,08ch,0b3h,0cfh,0b0h,06fh,093h,060h,0afh,07ch,090h,059h,0feh,020h,021h,0feh,0c0h,0efh,0d0h,028h,05fh,0e0h,004h	; 9492  ......o.`.|.Y. !....(_..
	defb 0a1h,0feh,040h,04fh,0f0h,088h,00fh,0f0h,000h,03fh,0c0h,005h,07fh,080h,007h,0ffh,000h,08fh,0ffh,000h,09fh,0ffh,000h,0ffh	; 94aa  ..@O.....?..............
	defb 07fh,0c0h,004h,0bfh,040h,003h,0ffh,040h,086h,0ffh,0c0h,09eh,0ffh,0c0h,09ch,0ffh,0c0h,09eh,0ffh,0d0h,09fh,0ffh,0d0h,0bfh	; 94c2  ....@..@................
	defb 0ffh,0d0h,0bfh,0bfh,050h,0bfh,0bfh,040h,0bfh,0ffh,040h,09fh,0ffh,040h,087h,0ffh,040h,00fh,0bfh,040h,00fh,03fh,0c0h,01fh	; 94da  ....P..@..@..@..@..@.?..

; ----------------------------------------------------------------------
; DATOS dibujo_94F2: 1 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 7 de la lista 0x8195 (p00:4D92, p00:4DF5); lo leen p01:6CFB
;   (24 bytes)
;   0x94f2..0x950a  (24 bytes)
DATA_dibujo_94F2:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,003h,003h,000h,00fh,008h,000h,01fh,000h,000h,031h,00ch,002h,074h,00eh,01dh	; 94f2  ..................1..t..

; ----------------------------------------------------------------------
; DATOS dibujo_950A: 8 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 8 de la lista 0x8195 (p00:4D92, p00:4DF5); lo leen p01:6CFB
;   (192 bytes)
;   0x950a..0x95ca  (192 bytes)
DATA_dibujo_950A:
	defb 080h,0ffh,000h,081h,0f9h,000h,082h,0f3h,000h,08ch,0efh,000h,090h,0ffh,000h,0e0h,0efh,000h,080h,09fh,000h,001h,0dfh,001h	; 950a  ........................
	defb 040h,0ebh,000h,080h,0dbh,000h,000h,0dbh,000h,000h,0fbh,000h,000h,0f2h,001h,000h,0f8h,003h,060h,098h,023h,0e0h,0d0h,0a3h	; 9522  @.................`.#...
	defb 038h,005h,084h,079h,003h,000h,033h,006h,080h,007h,00ch,0c0h,00ch,018h,0e0h,019h,010h,0e0h,03ch,020h,0c0h,030h,000h,0c0h	; 953a  8..y..3...........< .0..
	defb 0c0h,01fh,000h,0c0h,00fh,000h,040h,01fh,000h,040h,01fh,000h,040h,01fh,000h,0c0h,01fh,000h,0d2h,01fh,002h,0d6h,03fh,006h	; 9552  ......@..@..@.........?.
	defb 003h,03eh,001h,001h,0ffh,000h,000h,01fh,0e0h,000h,003h,0fch,000h,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh	; 956a  .>......................
	defb 056h,03fh,006h,056h,03fh,006h,0c4h,0bch,007h,0c0h,098h,007h,0c0h,090h,00fh,000h,040h,03fh,000h,000h,0ffh,000h,000h,0ffh	; 9582  V?.V?...........@?......
	defb 000h,0a8h,003h,000h,039h,000h,000h,07bh,010h,000h,0fbh,070h,000h,0fbh,0e0h,000h,0ffh,080h,008h,0fbh,000h,010h,0fbh,000h	; 959a  ....9..{...p............
	defb 000h,000h,0ffh,001h,000h,0feh,003h,000h,0fch,002h,004h,0f8h,000h,00eh,0f0h,000h,007h,0e0h,00ch,003h,0c0h,016h,009h,088h	; 95b2  ........................

; ----------------------------------------------------------------------
; DATOS dibujo_95CA: 1 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 9 de la lista 0x8195 (p00:4D92, p00:4DF5); lo leen p01:6CFB
;   (24 bytes)
;   0x95ca..0x95e2  (24 bytes)
DATA_dibujo_95CA:
	defb 003h,000h,003h,001h,00eh,00fh,006h,039h,03eh,098h,066h,0f9h,0e0h,0d9h,0e6h,041h,0a7h,058h,003h,0dfh,020h,01ah,0a1h,044h	; 95ca  .......9>.f....A.X.. ..D

; ----------------------------------------------------------------------
; DATOS dibujo_95E2: 1 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 10 de la lista 0x8195 (p00:4D92, p00:4DF5); lo leen p01:6CFB
;   (24 bytes)
;   0x95e2..0x95fa  (24 bytes)
DATA_dibujo_95E2:
	defb 024h,03ch,0dah,018h,019h,0e4h,000h,002h,079h,001h,005h,033h,003h,008h,007h,006h,013h,00ch,00fh,0aeh,019h,04dh,0ceh,028h	; 95e2  $<......y..3.........M.(

; ----------------------------------------------------------------------
; DATOS dibujo_95FA: 2 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 11 de la lista 0x8195 (p00:4D92, p00:4DF5); lo leen p01:6CFB
;   (48 bytes)
;   0x95fa..0x962a  (48 bytes)
DATA_dibujo_95FA:
	defb 004h,087h,03ch,01ah,07fh,066h,011h,097h,0ffh,0e8h,05bh,01fh,0c4h,0b5h,03fh,0bch,0c5h,0dfh,0d4h,0e4h,0ffh,0c5h,0e5h,0ffh	; 95fa  ..<..f....[...?.........
	defb 000h,0ffh,003h,002h,0ddh,00fh,00ch,0f3h,01fh,000h,0fdh,07fh,002h,072h,07fh,084h,0c7h,0ffh,019h,0a0h,0e7h,006h,088h,0f9h	; 9612  .............r..........

; ----------------------------------------------------------------------
; DATOS dibujo_962A: 1 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 12 de la lista 0x8195 (p00:4D92, p00:4DF5); lo leen p01:6CFB
;   (24 bytes)
;   0x962a..0x9642  (24 bytes)
DATA_dibujo_962A:
	defb 0e7h,08fh,071h,083h,007h,0f0h,085h,006h,0f0h,023h,003h,0f8h,00fh,001h,0f0h,003h,03ch,0cch,005h,07ah,090h,002h,0fdh,070h	; 962a  ..q......#......<..z...p

; ----------------------------------------------------------------------
; DATOS dibujo_9642: 1 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 13 de la lista 0x8195 (p00:4D92, p00:4DF5); lo leen p01:6CFB
;   (24 bytes)
;   0x9642..0x965a  (24 bytes)
DATA_dibujo_9642:
	defb 0afh,06fh,01fh,09eh,09fh,0feh,03ch,03fh,0fch,0f8h,0ffh,0f8h,0e0h,0ffh,0e0h,0c0h,0ffh,0cch,060h,07eh,0ech,020h,03ch,0ech	; 9642  .o....<?..........`~. <.

; ----------------------------------------------------------------------
; DATOS dibujo_965A: 1 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 14 de la lista 0x8195 (p00:4D92, p00:4DF5); lo leen p01:6CFB
;   (24 bytes)
;   0x965a..0x9672  (24 bytes)
DATA_dibujo_965A:
	defb 0ffh,0f0h,0feh,0ffh,0e3h,0ffh,0fdh,004h,0efh,0ffh,004h,0ddh,07fh,007h,04fh,00fh,000h,00fh,000h,000h,000h,000h,000h,000h	; 965a  ..............O.........

; ----------------------------------------------------------------------
; DATOS dibujo_9672: 2 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 15 de la lista 0x8195 (p00:4D92, p00:4DF5); lo leen p01:6CFB
;   (48 bytes)
;   0x9672..0x96a2  (48 bytes)
DATA_dibujo_9672:
	defb 0ech,0d0h,0e0h,0e4h,0d8h,0e0h,0e4h,018h,0e0h,024h,018h,0e0h,0c0h,05ch,0e0h,0e0h,068h,0b0h,070h,0a0h,0d8h,03ch,0d4h,0ech	; 9672  .........$...\..h.p..<..
	defb 0fch,074h,0ech,0fch,07ch,0b4h,0fch,058h,0bch,0f8h,048h,0b0h,0f8h,058h,0a8h,0f4h,0f4h,014h,01ah,09ah,08ah,00ch,08ch,084h	; 968a  .t..|..X..H..X..........

; ----------------------------------------------------------------------
; DATOS dibujo_96A2: 4 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 16 de la lista 0x8195 (p00:4D92, p00:4DF5); lo leen p01:6CFB
;   (96 bytes)
;   0x96a2..0x9702  (96 bytes)
DATA_dibujo_96A2:
	defb 07fh,000h,07fh,047h,00ch,073h,0b3h,03eh,0c1h,0bbh,05eh,081h,0bbh,07eh,0f1h,0bbh,07eh,0c1h,047h,07ch,033h,01fh,018h,007h	; 96a2  ...G.s.>..^..~..~.G|3...
	defb 080h,0feh,03dh,000h,0ffh,07eh,00ch,0ffh,062h,00ch,0efh,072h,000h,0ffh,063h,081h,0ffh,03eh,007h,0ffh,079h,039h,0f9h,001h	; 96ba  ..=..~..b..r..c..>..y9..
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0c0h,000h,080h,0e0h,000h,040h,0f0h,080h,020h,0f8h,0c0h,090h,0fch,070h	; 96d2  ...............@.. ....p
	defb 001h,01fh,008h,004h,01eh,001h,002h,00fh,000h,001h,007h,000h,000h,003h,000h,000h,001h,000h,000h,000h,000h,000h,000h,000h	; 96ea  ........................

; ----------------------------------------------------------------------
; DATOS dibujo_9702: 1 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 17 de la lista 0x8195 (p00:4D92, p00:4DF5); lo leen p01:6CFB
;   (24 bytes)
;   0x9702..0x971a  (24 bytes)
DATA_dibujo_9702:
	defb 069h,0ebh,0b2h,0cdh,0dfh,06ah,0fdh,0dfh,07ah,0f7h,0e7h,078h,0ffh,0ffh,0b1h,0ffh,0ffh,0c6h,0ffh,07fh,07dh,0feh,03eh,03ch	; 9702  i....j..z..x........}.><

; ----------------------------------------------------------------------
; DATOS dibujo_971A: 1 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 18 de la lista 0x8195 (p00:4D92, p00:4DF5); lo leen p01:6CFB
;   (24 bytes)
;   0x971a..0x9732  (24 bytes)
DATA_dibujo_971A:
	defb 034h,0e8h,08dh,03ch,0e0h,08ch,078h,0f0h,000h,09ch,0f8h,000h,06ch,0fch,060h,0beh,0fch,0b0h,0ceh,0fch,040h,0deh,0f8h,040h	; 971a  4..<..x.....l.`.....@..@

; ----------------------------------------------------------------------
; DATOS dibujo_9732: 15 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 19 de la lista 0x8195 (p00:4D92, p00:4DF5); lo leen p01:6CFB
;   (360 bytes)
;   0x9732..0x989a  (360 bytes)
DATA_dibujo_9732:
	defb 080h,040h,07fh,040h,020h,0bfh,030h,000h,0cfh,00ch,014h,0fch,01fh,020h,0efh,02ch,0cch,0d3h,0cch,004h,03fh,008h,000h,0fbh	; 9732  .@.@ .0...... .,....?...
	defb 000h,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh,000h,000h,0feh,001h,001h,0fdh,003h,003h,0fah,005h,006h,0f7h,00fh,00ch,0ebh	; 974a  ........................
	defb 000h,000h,0ffh,009h,009h,0f9h,01fh,01fh,098h,05fh,079h,066h,07fh,0c0h,0bfh,0ffh,00fh,0f0h,0f0h,03fh,0c0h,0cfh,0f0h,000h	; 9762  ........._yf.......?....
	defb 01fh,011h,0feh,01fh,011h,0deh,01eh,007h,0dch,03eh,02fh,0fch,07dh,06eh,0f8h,07dh,05eh,0f8h,07dh,05eh,0f8h,07dh,05eh,0f8h	; 977a  .........>/.}n.}^.}^.}^.
	defb 0a0h,0c3h,000h,040h,0c1h,040h,0c1h,000h,000h,080h,041h,000h,081h,063h,000h,017h,0efh,000h,017h,08fh,000h,00eh,09eh,000h	; 9792  ...@.@....A..c..........
	defb 0fch,0c4h,037h,07eh,0c6h,03fh,0beh,072h,01fh,0beh,07ah,01fh,0dfh,03bh,00fh,05fh,0bdh,00fh,05fh,0bdh,00fh,05fh,0bdh,00fh	; 97aa  ..7~.?.r..z...._.._.._..
	defb 026h,0d6h,000h,02fh,0dfh,000h,036h,0cfh,000h,007h,0ffh,010h,009h,0ffh,090h,000h,0ffh,08eh,000h,0ffh,0c3h,000h,0ffh,060h	; 97c2  &../..6................`
	defb 07ah,05dh,000h,098h,0ffh,022h,090h,07fh,046h,030h,0ffh,004h,0c8h,0ffh,00ch,000h,0fbh,038h,000h,0fdh,0e1h,001h,0ffh,003h	; 97da  z]..."..F0.......8......
	defb 05fh,0fdh,00fh,01fh,0fdh,04fh,01fh,0fdh,04fh,017h,0f5h,047h,01fh,0fbh,0cfh,02eh,0eah,08fh,02eh,0eah,08fh,05eh,0d6h,01fh	; 97f2  _....O..O..G.........^..
	defb 037h,0f7h,001h,037h,0dfh,000h,03ah,0cfh,000h,00dh,0ffh,010h,006h,0ffh,098h,001h,0ffh,08eh,000h,0ffh,0c3h,040h,0ffh,020h	; 980a  7..7..:..............@.
	defb 0d6h,0bfh,000h,09eh,075h,040h,03ah,0edh,004h,0f8h,0cfh,004h,0f0h,03fh,00ch,0c0h,0ffh,038h,000h,07fh,061h,001h,07fh,002h	; 9822  ....u@:......?...8..a...
	defb 05fh,0bdh,00fh,01fh,0fdh,04fh,01fh,0fdh,04fh,017h,0f5h,047h,01fh,0fbh,0cfh,02eh,0eah,08fh,02eh,0eah,08fh,05eh,0d6h,01fh	; 983a  _....O..O..G.........^..
	defb 00eh,0f1h,000h,003h,0fdh,001h,0e3h,0deh,002h,03ch,0f7h,004h,0cch,0fbh,000h,034h,0ffh,000h,0d6h,0fdh,000h,0eah,0ffh,000h	; 9852  .........<.....4........
	defb 023h,0f7h,000h,02bh,0ffh,000h,035h,0dfh,000h,016h,0ffh,000h,00fh,0f9h,090h,016h,0ffh,099h,021h,0ffh,0e2h,040h,0ffh,060h	; 986a  #..+..5...........!..@.`
	defb 0ffh,0fdh,0efh,01fh,0fdh,04fh,01fh,0fdh,04fh,017h,0f5h,047h,01fh,0fbh,0cfh,02eh,0eah,08fh,02eh,0eah,08fh,05eh,0d6h,01fh	; 9882  .....O..O..G.........^..

; ----------------------------------------------------------------------
; DATOS dibujo_989A: 6 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 20 de la lista 0x8195 (p00:4D92, p00:4DF5); lo leen p01:6CFB
;   (144 bytes)
;   0x989a..0x992a  (144 bytes)
DATA_dibujo_989A:
	defb 000h,000h,000h,0f8h,0f8h,0f8h,07fh,07fh,08fh,0ffh,0c7h,081h,0ffh,001h,000h,0ffh,0f8h,000h,007h,0feh,000h,0f9h,087h,078h	; 989a  .......................x
	defb 07dh,05fh,058h,07ch,05fh,059h,074h,057h,059h,074h,057h,059h,07ch,06fh,069h,03ah,02bh,02ch,03ah,02bh,02ch,03fh,037h,036h	; 98b2  }_X|_YtWYtWY|oi:+,:+,?76
	defb 000h,000h,000h,0f8h,0f8h,0f8h,07fh,07fh,08fh,0ffh,0c7h,081h,0ffh,001h,000h,0ffh,0f8h,000h,087h,0feh,080h,0f9h,087h,0f8h	; 98ca  ........................
	defb 07dh,05eh,059h,07ch,05fh,059h,074h,057h,059h,074h,057h,059h,07ch,06fh,069h,03ah,02bh,02ch,03ah,02bh,02ch,03fh,037h,036h	; 98e2  }^Y|_YtWYtWY|oi:+,:+,?76
	defb 000h,000h,000h,0f8h,0f8h,0f8h,07fh,07fh,08fh,0ffh,0c7h,081h,0ffh,001h,000h,0ffh,0f8h,000h,007h,0feh,000h,0f9h,007h,0f8h	; 98fa  ........................
	defb 07fh,05fh,05bh,07ch,05fh,059h,074h,057h,059h,074h,057h,059h,07ch,06fh,069h,03ah,02bh,02ch,03ah,02bh,02ch,03fh,037h,036h	; 9912  ._[|_YtWYtWY|oi:+,:+,?76

; ----------------------------------------------------------------------
; DATOS dibujo_992A: 5 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 21 de la lista 0x8195 (p00:4D92, p00:4DF5); lo leen p01:6CFB
;   (120 bytes)
;   0x992a..0x99a2  (120 bytes)
DATA_dibujo_992A:
	defb 0b8h,0ffh,038h,0cfh,0ffh,00fh,070h,03fh,0c0h,0ffh,00fh,020h,0f8h,0c0h,007h,0ffh,038h,000h,07fh,007h,000h,00fh,000h,000h	; 992a  ..8...p?... ....8.......
	defb 00eh,0ffh,00eh,0f9h,0ffh,078h,007h,0feh,001h,0ffh,0f8h,006h,03fh,001h,0f8h,0ffh,00eh,000h,0ffh,0f0h,000h,0f8h,000h,000h	; 9942  .....x......?...........
	defb 08eh,07fh,00eh,0f9h,07fh,078h,087h,07eh,001h,0ffh,0f8h,006h,03fh,001h,0f8h,0ffh,00eh,000h,0ffh,0f0h,000h,0f8h,000h,000h	; 995a  .....x.~....?...........
	defb 00eh,0ffh,00eh,0f9h,0ffh,0f8h,007h,0feh,001h,0ffh,0f8h,006h,03fh,001h,0f8h,0ffh,00eh,000h,0ffh,0f0h,000h,0f8h,000h,000h	; 9972  ............?...........
	defb 0f8h,0cch,024h,0fch,090h,040h,0e8h,030h,090h,0d0h,060h,020h,0e0h,080h,000h,040h,080h,080h,000h,000h,000h,000h,000h,000h	; 998a  ..$..@.0..` ...@........

; ----------------------------------------------------------------------
; DATOS dibujo_99A2: 5 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 22 de la lista 0x8195 (p00:4D92, p00:4DF5); lo leen p01:6CFB
;   (120 bytes)
;   0x99a2..0x9a1a  (120 bytes)
DATA_dibujo_99A2:
	defb 000h,0f1h,000h,000h,0fch,004h,000h,01eh,002h,000h,0c7h,000h,0c8h,0fbh,000h,0f0h,0fbh,000h,0f0h,0f9h,000h,0d8h,07dh,080h	; 99a2  ......................}.
	defb 09ch,0c3h,01ch,07fh,0c1h,03eh,03eh,001h,03eh,03fh,041h,03eh,03eh,063h,01ch,029h,0ffh,000h,07ah,09fh,060h,075h,09fh,0e1h	; 99ba  .....>>.>?A>>c.)..z.`u..
	defb 09ch,0c3h,01dh,07eh,0c1h,03eh,03eh,000h,03eh,03fh,041h,03eh,01eh,063h,01ch,009h,0efh,000h,06bh,08fh,060h,077h,09eh,061h	; 99d2  ...~.>>.>?A>.c....k.`w.a
	defb 080h,0f1h,0c0h,081h,07dh,080h,080h,01eh,080h,0c0h,0c7h,000h,030h,0f3h,000h,0d8h,0fbh,000h,0e8h,0f9h,000h,0f4h,0fdh,080h	; 99ea  ....}.......0...........
	defb 0ddh,0f7h,088h,055h,0ffh,080h,05ah,0ffh,000h,02dh,0fdh,000h,0aeh,07eh,000h,093h,073h,000h,0cch,03ch,000h,063h,0dfh,000h	; 9a02  ...U..Z..-...~..s..<.c..

; ----------------------------------------------------------------------
; DATOS dibujo_9A1A: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 23 de la lista 0x8195 (p00:4D92, p00:4DF5); lo leen p01:6CFB (8
;   bytes)
;   0x9a1a..0x9a22  (8 bytes)
DATA_dibujo_9A1A:
	defb 000h,000h,000h,000h,000h,000h,000h,001h	; 9a1a  ........

; ----------------------------------------------------------------------
; DATOS dibujo_9A22: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 24 de la lista 0x8195 (p00:4D92, p00:4DF5); lo leen p01:6CFB
;   (16 bytes)
;   0x9a22..0x9a32  (16 bytes)
DATA_dibujo_9A22:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,001h,000h,001h,003h	; 9a22  ................

; ----------------------------------------------------------------------
; DATOS dibujo_9A32: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 25 de la lista 0x8195 (p00:4D92, p00:4DF5); lo leen p01:6CFB
;   (32 bytes)
;   0x9a32..0x9a52  (32 bytes)
DATA_dibujo_9A32:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,00ch,038h	; 9a32  ...............8
	defb 080h,000h,080h,000h,0c0h,000h,040h,0c0h,080h,080h,000h,000h,000h,000h,000h,000h	; 9a42  ......@.........

; ----------------------------------------------------------------------
; DATOS dibujo_9A52: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 26 de la lista 0x8195 (p00:4D92, p00:4DF5); lo leen p01:6CFB
;   (32 bytes)
;   0x9a52..0x9a72  (32 bytes)
DATA_dibujo_9A52:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0c0h,040h,060h,0bfh	; 9a52  .............@`.
	defb 03fh,024h,01fh,013h,00fh,00ch,003h,003h,000h,000h,000h,000h,000h,000h,000h,000h	; 9a62  ?$..............

; ----------------------------------------------------------------------
; DATOS dibujo_9A72: 60 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 27 de la lista 0x8195 (p00:4D92, p00:4DF5) (sigue en el banco
;   53, en 0xA000); lo leen p01:6CFB (1422 bytes)
;   0x9a72..0xa000  (1422 bytes)
DATA_dibujo_9A72:
	defb 000h,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh,014h,01dh,0fch,0c2h,062h,0c2h,0e5h,0f7h,021h	; 9a72  ...................b...!
	defb 000h,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh,0d9h,0d8h,0deh,001h,0edh,002h,011h,03dh,003h	; 9a8a  ......................=.
	defb 000h,000h,0ffh,071h,0ddh,070h,070h,070h,070h,000h,00fh,000h,009h,0f9h,000h,007h,0ffh,081h,0a3h,0dfh,0e1h,0f1h,0ffh,070h	; 9aa2  ...q.pppp..............p
	defb 000h,000h,0ffh,000h,000h,0ffh,080h,080h,07fh,080h,080h,07fh,0a4h,0eeh,085h,04eh,0dfh,008h,04ah,0dfh,002h,05ah,0dfh,002h	; 9aba  ...............N..J..Z..
	defb 003h,003h,0feh,001h,003h,0fch,000h,002h,0fch,000h,001h,0feh,000h,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh,0e4h,0f4h,0e3h	; 9ad2  ........................
	defb 0dah,0dah,000h,0ffh,0ffh,0feh,00fh,00fh,000h,0dfh,0abh,0ffh,003h,003h,000h,0cfh,0b1h,0ffh,081h,0ffh,080h,07eh,0ffh,07eh	; 9aea  .....................~.~
	defb 03dh,03dh,018h,0fdh,0ffh,038h,09dh,0ffh,018h,0e7h,0ffh,084h,0fbh,0feh,063h,09dh,0ffh,099h,0eeh,0ffh,064h,07fh,0ffh,01ah	; 9b02  ==...8........c.....d...
	defb 031h,0f1h,030h,0b1h,0f1h,0b0h,0a1h,0f1h,0a0h,0e3h,0a3h,060h,0c3h,063h,0c0h,0c6h,0c6h,0c0h,085h,0c6h,081h,00ch,08fh,000h	; 9b1a  1.0........`.c..........
	defb 0d0h,0f0h,04fh,0c8h,0f8h,047h,0cah,0feh,083h,070h,0f2h,031h,036h,0b6h,001h,008h,0c8h,007h,010h,070h,00fh,0f8h,0f8h,01fh	; 9b32  ..O..G...p.16......p....
	defb 059h,06dh,0f8h,07ah,03eh,0c8h,03ah,07eh,0c8h,014h,034h,0f0h,000h,001h,0c0h,000h,01eh,0e0h,00dh,00dh,0fdh,005h,005h,0fdh	; 9b4a  Ym.z>.:~..4.............
	defb 006h,0ffh,007h,0ffh,08dh,0feh,0fdh,0ffh,0feh,08ch,08fh,08dh,060h,072h,060h,0f0h,0b9h,0e0h,0bbh,07fh,0d1h,0ebh,0efh,081h	; 9b62  ............`r`.........
	defb 0e2h,06ah,0c0h,0d2h,0f3h,040h,0d2h,0f2h,040h,0a7h,0a7h,080h,004h,004h,003h,008h,0cbh,000h,091h,0d7h,081h,020h,0a0h,000h	; 9b7a  .j...@..@............ ..
	defb 000h,0ffh,000h,0c4h,0bbh,0ffh,000h,000h,000h,0ffh,0ffh,000h,0beh,0f7h,01eh,000h,0feh,000h,0fch,0ffh,0fch,000h,000h,000h	; 9b92  ........................
	defb 011h,0f1h,010h,07ch,0beh,0f4h,008h,008h,000h,0efh,0efh,000h,010h,073h,010h,018h,019h,008h,0cah,0efh,040h,08ah,08fh,000h	; 9baa  ...|.........s......@...
	defb 01fh,0ffh,00ah,097h,0ffh,005h,0abh,0efh,001h,029h,06fh,000h,055h,0dfh,010h,0d5h,0dfh,090h,0e5h,0efh,0c0h,0e5h,0efh,0c0h	; 9bc2  .........)o.U...........
	defb 070h,0f0h,040h,0c0h,0cfh,000h,0cfh,0cfh,000h,0deh,0dfh,08ch,065h,0ffh,001h,075h,0f7h,001h,07eh,0ffh,070h,07fh,0ffh,048h	; 9bda  p.@.........e..u..~.p..H
	defb 0fch,0f8h,0afh,0fch,0fch,023h,0c0h,0e0h,04fh,080h,0e0h,00fh,080h,0c0h,09fh,000h,0c0h,01fh,038h,078h,03fh,088h,080h,00fh	; 9bf2  .....#..O.........8x?...
	defb 004h,006h,0fch,002h,003h,0feh,003h,003h,0ffh,001h,001h,0ffh,000h,000h,0feh,001h,000h,0ffh,000h,001h,0ffh,000h,000h,0ffh	; 9c0a  ........................
	defb 097h,09fh,081h,00eh,07eh,002h,0beh,0beh,08eh,0fdh,0fdh,0fch,075h,0b5h,0e4h,0e9h,0f9h,020h,0e9h,0f9h,020h,053h,0d3h,0c0h	; 9c22  ....~.......u.... .. S..
	defb 07fh,07fh,000h,0c0h,0c0h,03fh,080h,080h,07fh,080h,080h,07fh,000h,07fh,000h,03fh,070h,03fh,000h,000h,000h,0ffh,0ffh,000h	; 9c3a  .....?.........?p?......
	defb 0ffh,0ffh,000h,0ach,0b6h,00ch,0aeh,0b7h,00eh,0afh,0bbh,00fh,000h,0ffh,000h,0ffh,033h,0ffh,000h,000h,000h,0ffh,0ffh,000h	; 9c52  ................3.......
	defb 0f6h,0ffh,000h,04dh,07fh,041h,033h,0bfh,003h,00fh,0ffh,00fh,010h,01ch,000h,0cbh,0efh,040h,08ah,08eh,000h,0f2h,0feh,000h	; 9c6a  ...M.A3..........@......
	defb 0e5h,0efh,0c0h,0a5h,0efh,080h,0b5h,0fdh,090h,059h,0d9h,010h,0aah,0bah,020h,052h,0f2h,040h,095h,0f5h,080h,07fh,0ffh,000h	; 9c82  .........Y.... R.@......
	defb 015h,0ddh,000h,00bh,0fbh,000h,072h,077h,000h,043h,05fh,001h,09dh,0bfh,019h,084h,0bdh,000h,008h,009h,000h,0f9h,0f9h,000h	; 9c9a  ......rw.C_.............
	defb 000h,000h,000h,0ffh,0ffh,000h,020h,0bch,020h,0d6h,0c7h,054h,0c6h,0d7h,044h,08fh,0afh,08eh,001h,041h,000h,07eh,07eh,000h	; 9cb2  ...... . ..T..D....A.~~.
	defb 0f0h,0f8h,007h,080h,080h,07fh,020h,020h,03fh,090h,0c0h,01fh,090h,0d0h,01fh,000h,0a0h,01fh,000h,040h,03fh,000h,080h,07fh	; 9cca  ......  ?..........@?...
	defb 005h,08fh,000h,038h,039h,000h,0ffh,0ffh,000h,000h,007h,000h,0c1h,0cdh,000h,029h,02dh,0e0h,021h,025h,0e0h,012h,01ah,0f1h	; 9ce2  ...89..........)-.!%....
	defb 012h,0f2h,000h,0fch,0fch,070h,088h,0f8h,000h,089h,0f9h,000h,08ah,08ah,000h,0fch,0fch,000h,0e1h,0e1h,005h,000h,000h,0ffh	; 9cfa  .....p..................
	defb 06eh,0eeh,04ch,07fh,0ffh,07fh,080h,09ch,000h,03fh,07fh,03fh,05fh,05fh,040h,08fh,08fh,081h,002h,0feh,003h,000h,000h,0ffh	; 9d12  n.L......?.?__@.........
	defb 000h,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh,070h,070h,0f3h,05ah,09ah,0c8h,0edh,0fdh,024h	; 9d2a  ...............pp.Z....$
	defb 003h,003h,0feh,001h,003h,0fch,000h,002h,0fch,000h,001h,0feh,000h,000h,0ffh,000h,000h,0ffh,000h,0ffh,000h,078h,067h,07fh	; 9d42  .....................xg.
	defb 0dah,0dah,000h,0ffh,0ffh,0feh,0ffh,0ffh,000h,0dfh,0abh,0ffh,0ffh,0ffh,000h,0cfh,0b1h,0ffh,021h,0afh,000h,096h,0d7h,082h	; 9d5a  ..................!.....
	defb 001h,000h,0ffh,000h,000h,0feh,000h,001h,0feh,001h,003h,0fdh,002h,003h,0feh,004h,006h,0fch,005h,005h,0fdh,00dh,00dh,0fdh	; 9d72  ........................
	defb 0e9h,0fdh,020h,0d1h,071h,0c0h,001h,0e3h,000h,08eh,08eh,08eh,062h,073h,062h,0f1h,0b9h,0e1h,0bbh,07fh,0d1h,0ebh,0efh,081h	; 9d8a  .. .q.......bsb.........
	defb 000h,000h,000h,0ffh,0ffh,000h,080h,080h,07fh,080h,080h,07fh,0c0h,0c0h,03fh,040h,05fh,000h,021h,0afh,001h,0b0h,0b0h,080h	; 9da2  ..............?@_.!.....
	defb 001h,001h,000h,0fdh,0fdh,000h,00eh,02bh,08eh,01fh,053h,01fh,0beh,0f7h,01eh,000h,0feh,000h,0fch,0ffh,0fch,000h,000h,000h	; 9dba  .......+..S.............
	defb 017h,017h,003h,0e4h,0ech,000h,003h,09bh,000h,002h,08fh,002h,011h,073h,011h,019h,019h,009h,0cah,0efh,040h,08ah,08fh,000h	; 9dd2  .............s......@...
	defb 09fh,0ffh,08ah,0dfh,0ffh,0cdh,06bh,07fh,061h,0a9h,0bfh,020h,015h,0bfh,010h,095h,09fh,090h,0d5h,0dfh,090h,0d5h,0dfh,090h	; 9dea  ......k.a.. ............
	defb 01ch,01eh,0fch,028h,031h,0f8h,01ch,03eh,0e4h,03dh,01fh,0e4h,01ah,02eh,0d8h,000h,008h,0c0h,000h,000h,0ffh,000h,000h,0ffh	; 9e02  ...(1..>.=..............
	defb 096h,09fh,080h,00ch,07eh,000h,0bch,0bfh,08dh,07dh,0ffh,07eh,007h,085h,006h,0fdh,0fch,001h,000h,000h,0ffh,000h,000h,0ffh	; 9e1a  ....~....}.~............
	defb 01fh,0dfh,000h,008h,068h,007h,0a4h,027h,080h,0d5h,0f5h,041h,0d4h,0f4h,040h,0a7h,0e7h,080h,008h,008h,007h,000h,000h,0ffh	; 9e32  ....h..'...A..@.........
	defb 0ffh,0ffh,000h,0aeh,0b7h,00eh,000h,0ffh,000h,0ffh,088h,0ffh,000h,000h,000h,0ffh,0ffh,000h,05bh,05bh,080h,04eh,04fh,080h	; 9e4a  ..................[[.NO.
	defb 0f6h,0ffh,000h,04dh,07fh,041h,008h,0f8h,008h,0feh,03fh,0fah,004h,004h,000h,0ffh,0ffh,000h,003h,003h,000h,07ch,07fh,000h	; 9e62  ...M.A....?..........|..
	defb 0d5h,0dfh,090h,0c5h,0dfh,080h,0a5h,0bdh,000h,059h,059h,000h,04ah,04ah,000h,082h,0a2h,000h,015h,0d5h,000h,0ffh,0ffh,000h	; 9e7a  .........YY.JJ..........
	defb 000h,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh,00ch,00fh,0fch,014h,018h,0fch	; 9e92  ........................
	defb 003h,003h,0feh,001h,003h,0fch,000h,002h,0fch,000h,001h,0feh,000h,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh,000h,0ffh,000h	; 9eaa  ........................
	defb 0dah,0dah,000h,0ffh,0ffh,0feh,0ffh,0ffh,000h,0dfh,0abh,0ffh,0ffh,0ffh,000h,04fh,031h,07fh,001h,03fh,000h,0c6h,0dfh,006h	; 9ec2  ...............O1..?....
	defb 01eh,00eh,0f2h,00eh,01eh,0f2h,017h,01fh,0fch,000h,008h,0f0h,008h,00fh,0f8h,006h,006h,0feh,005h,005h,0fdh,005h,005h,0fdh	; 9eda  ........................
	defb 08fh,0ach,007h,086h,0b6h,000h,039h,07dh,038h,00eh,08fh,00eh,063h,073h,063h,0f1h,0b9h,0e1h,0bbh,07fh,0d1h,0ebh,0efh,081h	; 9ef2  ......9}8...csc.........
	defb 00bh,0f4h,0ffh,000h,000h,000h,0ffh,0ffh,000h,000h,000h,01fh,088h,0e8h,087h,022h,0cbh,060h,0fah,07eh,090h,07bh,0fbh,090h	; 9f0a  ...............".`.~.{..
	defb 0ffh,07fh,0f6h,009h,009h,000h,0feh,0feh,000h,030h,079h,010h,0b8h,0f7h,018h,000h,0ffh,000h,0e1h,09eh,0ffh,000h,000h,000h	; 9f22  .........0y.............
	defb 019h,05bh,001h,006h,07eh,000h,01ch,0ffh,01ch,007h,08fh,007h,011h,073h,011h,002h,0ffh,002h,0bfh,047h,0feh,001h,001h,000h	; 9f3a  .[..~........s.....G....
	defb 09fh,0ffh,08ah,05fh,0ffh,04dh,02bh,07fh,021h,0a9h,0bfh,020h,025h,03fh,000h,00dh,0cfh,000h,0e5h,0e7h,0c0h,025h,027h,000h	; 9f52  ..._.M+.!.. %?.......%'.
	defb 004h,006h,0fch,006h,007h,0feh,008h,00fh,0f8h,014h,018h,0fch,01eh,00eh,0f2h,00eh,01eh,0f2h,005h,00dh,0ech,006h,006h,0f0h	; 9f6a  ........................
	defb 097h,09fh,081h,00fh,07fh,003h,0bch,0bfh,08ch,070h,0fch,070h,083h,0a3h,000h,08ch,0cch,000h,03fh,03fh,000h,040h,040h,03fh	; 9f82  .........p.p......??.@@?
	defb 037h,077h,060h,01ch,09ch,003h,070h,070h,00fh,0c0h,0ffh,000h,03fh,070h,03fh,000h,000h,000h,0ffh,0ffh,000h,000h,000h,0ffh	; 9f9a  7w`...pp....?p?.........
	defb 0ffh,0ffh,000h,0a8h,0b6h,008h,0aah,0bfh,00ah,008h,0ffh,008h,0ffh,09fh,0fbh,004h,004h,000h,0ffh,0ffh,000h,04bh,04bh,080h	; 9fb2  .....................KK.
	defb 0ffh,0ffh,000h,04ch,07eh,040h,031h,0bfh,001h,007h,0ffh,007h,0beh,0bfh,03eh,091h,0bfh,010h,038h,079h,000h,022h,027h,002h	; 9fca  ...L~@1.......>...8y."'.
	defb 0cdh,0cfh,000h,035h,03fh,000h,045h,07dh,000h,029h,079h,020h,0aah,0fah,020h,052h,0f2h,040h,095h,0f5h,080h,07fh,0ffh,000h	; 9fe2  ...5?.E}.)y .. R.@......
	defb 0a1h,0e1h,000h,040h,0dch,000h	; 9ffa
