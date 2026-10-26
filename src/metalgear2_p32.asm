; ==========================================================================
; METAL GEAR 2 SOLID SNAKE - Konami (1990) - MSX2 - MegaROM RC-767 de 512 KB (Konami SCC) - banco 32 (se ejecuta en 0x6000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x06000


; ----------------------------------------------------------------------
; DATOS zonas_dibujos: 20 punteros, uno por zona (0xCA4A): la cabecera de
;   p00:4D5A con los dibujos de la zona (p00:4C05); lo leen p00:4C08 (40
;   bytes)
;   0x6000..0x6028  (40 bytes)
DATA_zonas_dibujos:
	defw 06028h,0603ah,0604ch,0605eh,06070h,06082h,06094h,060a6h	; 6000
	defw 060b8h,06028h,060cah,060dch,060dch,060dch,060dch,060dch	; 6010
	defw 060dch,060a6h,060eeh,06100h	; 6020  -> DATA_juego_60DC DATA_juego_60A6 DATA_juego_60EE DATA_juego_6100

; ----------------------------------------------------------------------
; DATOS juego_6028: la direccion de VRAM y 8 punteros a listas de dibujos (0 =
;   ninguna), uno por cada tercio de las tablas de patrones (p00:4D5A); lo
;   leen p00:4C0C (18 bytes)
;   0x6028..0x603a  (18 bytes)
DATA_juego_6028:
	defw 06112h,0702dh,0705bh,07098h,070cbh,070f9h,00000h,07118h,07146h	; 6028

; ----------------------------------------------------------------------
; DATOS juego_603A: la direccion de VRAM y 8 punteros a listas de dibujos (0 =
;   ninguna), uno por cada tercio de las tablas de patrones (p00:4D5A); lo
;   leen p00:4C0C (18 bytes)
;   0x603a..0x604c  (18 bytes)
DATA_juego_603A:
	defw 0619ah,08000h,08056h,080d4h,08157h,0819eh,08217h,08286h,00000h	; 603a

; ----------------------------------------------------------------------
; DATOS juego_604C: la direccion de VRAM y 8 punteros a listas de dibujos (0 =
;   ninguna), uno por cada tercio de las tablas de patrones (p00:4D5A); lo
;   leen p00:4C0C (18 bytes)
;   0x604c..0x605e  (18 bytes)
DATA_juego_604C:
	defw 0625ah,0a1fah,0a282h,0a2bfh,0a306h,0a348h,00000h,00000h,00000h	; 604c

; ----------------------------------------------------------------------
; DATOS juego_605E: la direccion de VRAM y 8 punteros a listas de dibujos (0 =
;   ninguna), uno por cada tercio de las tablas de patrones (p00:4D5A); lo
;   leen p00:4C0C (18 bytes)
;   0x605e..0x6070  (18 bytes)
DATA_juego_605E:
	defw 062d1h,08000h,080b6h,00000h,00000h,00000h,00000h,00000h,00000h	; 605e

; ----------------------------------------------------------------------
; DATOS juego_6070: la direccion de VRAM y 8 punteros a listas de dibujos (0 =
;   ninguna), uno por cada tercio de las tablas de patrones (p00:4D5A); lo
;   leen p00:4C0C (18 bytes)
;   0x6070..0x6082  (18 bytes)
DATA_juego_6070:
	defw 062d1h,08000h,08f35h,0902bh,09068h,090a0h,090f6h,00000h,00000h	; 6070

; ----------------------------------------------------------------------
; DATOS juego_6082: la direccion de VRAM y 8 punteros a listas de dibujos (0 =
;   ninguna), uno por cada tercio de las tablas de patrones (p00:4D5A); lo
;   leen p00:4C0C (18 bytes)
;   0x6082..0x6094  (18 bytes)
DATA_juego_6082:
	defw 06433h,00000h,00000h,08000h,00000h,00000h,00000h,00000h,00000h	; 6082

; ----------------------------------------------------------------------
; DATOS juego_6094: la direccion de VRAM y 8 punteros a listas de dibujos (0 =
;   ninguna), uno por cada tercio de las tablas de patrones (p00:4D5A); lo
;   leen p00:4C0C (18 bytes)
;   0x6094..0x60a6  (18 bytes)
DATA_juego_6094:
	defw 0863eh,0870ah,08797h,00000h,0880bh,0870ah,088ach,00000h,00000h	; 6094

; ----------------------------------------------------------------------
; DATOS juego_60A6: la direccion de VRAM y 8 punteros a listas de dibujos (0 =
;   ninguna), uno por cada tercio de las tablas de patrones (p00:4D5A); lo
;   leen p00:4C0C (18 bytes)
;   0x60a6..0x60b8  (18 bytes)
DATA_juego_60A6:
	defw 0649ch,0a203h,0a27ch,0a2ebh,0a34bh,0a38dh,00000h,00000h,00000h	; 60a6

; ----------------------------------------------------------------------
; DATOS juego_60B8: la direccion de VRAM y 8 punteros a listas de dibujos (0 =
;   ninguna), uno por cada tercio de las tablas de patrones (p00:4D5A); lo
;   leen p00:4C0C (18 bytes)
;   0x60b8..0x60ca  (18 bytes)
DATA_juego_60B8:
	defw 08000h,08014h,0803dh,00000h,00000h,00000h,00000h,00000h,00000h	; 60b8

; ----------------------------------------------------------------------
; DATOS juego_60CA: la direccion de VRAM y 8 punteros a listas de dibujos (0 =
;   ninguna), uno por cada tercio de las tablas de patrones (p00:4D5A); lo
;   leen p00:4C0C (18 bytes)
;   0x60ca..0x60dc  (18 bytes)
DATA_juego_60CA:
	defw 06535h,0a333h,00000h,00000h,0a398h,00000h,0a3dfh,00000h,00000h	; 60ca

; ----------------------------------------------------------------------
; DATOS juego_60DC: la direccion de VRAM y 8 punteros a listas de dibujos (0 =
;   ninguna), uno por cada tercio de las tablas de patrones (p00:4D5A); lo
;   leen p00:4C0C (18 bytes)
;   0x60dc..0x60ee  (18 bytes)
DATA_juego_60DC:
	defw 065b7h,0ad66h,0adbch,00000h,00000h,00000h,0adfeh,00000h,00000h	; 60dc

; ----------------------------------------------------------------------
; DATOS juego_60EE: la direccion de VRAM y 8 punteros a listas de dibujos (0 =
;   ninguna), uno por cada tercio de las tablas de patrones (p00:4D5A); lo
;   leen p00:4C0C (18 bytes)
;   0x60ee..0x6100  (18 bytes)
DATA_juego_60EE:
	defw 06648h,0addch,00000h,0ae19h,00000h,00000h,00000h,00000h,00000h	; 60ee

; ----------------------------------------------------------------------
; DATOS juego_6100: la direccion de VRAM y 8 punteros a listas de dibujos (0 =
;   ninguna), uno por cada tercio de las tablas de patrones (p00:4D5A); lo
;   leen p00:4C0C (18 bytes)
;   0x6100..0x6112  (18 bytes)
DATA_juego_6100:
	defw 06648h,08f4fh,00000h,00000h,00000h,00000h,00000h,08f6eh,00000h	; 6100

; ----------------------------------------------------------------------
; DATOS tabla_colores_6112: 30 punteros a colores de dibujo (los usa hasta el
;   indice 29; p00:4DA0); lo leen p00:4DA0 (60 bytes)
;   0x6112..0x614e  (60 bytes)
DATA_tabla_colores_6112:
	defw 0614eh,06150h,06152h,06156h,06158h,0615ah,0615eh,06152h	; 6112
	defw 06162h,06166h,06150h,0614eh,0616ah,0616ch,06170h,06174h	; 6122
	defw 0614eh,06178h,0617ch,06180h,06184h,0617dh,06186h,06188h	; 6132
	defw 0618ch,0618eh,06190h,06194h,06196h,06198h	; 6142

; ----------------------------------------------------------------------
; DATOS colores_sin_uso_614E: 34 bytes de colores de dibujo (dos colores de 4
;   bits por byte) a los que apuntan tabla_colores_6112 (entrada 0),
;   tabla_colores_6112 (entrada 1), tabla_colores_6112 (entrada 2): indices
;   que no pide ninguna lista de dibujos
;   0x614e..0x6170  (34 bytes)
DATA_colores_sin_uso_614E:
	defb 014h,058h,014h,080h,014h,056h,078h,080h,014h,050h,027h,080h,012h,045h,067h,08fh	; 614e  .X...Vx..P'..Eg.
	defb 012h,045h,067h,0cfh,012h,034h,056h,0cfh,012h,045h,078h,0cfh,012h,05fh,012h,034h	; 615e  .Eg..4V..Ex.._.4
	defb 078h,0cfh	; 616e

; ----------------------------------------------------------------------
; DATOS colores_6170: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4D34 (4 bytes)
;   0x6170..0x6174  (4 bytes)
DATA_colores_6170:
	defb 045h,08fh,061h,079h	; 6170

; ----------------------------------------------------------------------
; DATOS colores_sin_uso_6174: 4 bytes de colores de dibujo (dos colores de 4
;   bits por byte) a los que apuntan tabla_colores_6112 (entrada 15): indices
;   que no pide ninguna lista de dibujos
;   0x6174..0x6178  (4 bytes)
DATA_colores_sin_uso_6174:
	defb 023h,045h,067h,08fh	; 6174

; ----------------------------------------------------------------------
; DATOS colores_6178: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4D25 (2 bytes)
;   0x6178..0x617a  (2 bytes)
DATA_colores_6178:
	defb 014h,05fh	; 6178

; ----------------------------------------------------------------------
; DATOS colores_sueltos_617A: 2 bytes con forma de colores de dibujo (dos de 4
;   bits por byte) entre dos listas: no los apunta ninguna entrada de las
;   tablas de colores de p32 ni llega a ellos ningun lector del listado
;   0x617a..0x617c  (2 bytes)
DATA_colores_sueltos_617A:
	defb 026h,078h	; 617a

; ----------------------------------------------------------------------
; DATOS colores_617C: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); se solapan 2 bloques:
;   (colores_617D 617D-617E); lo leen p00:4D25, p00:4D34 (2 bytes)
;   0x617c..0x617e  (2 bytes)
DATA_colores_617C:
	defb 045h,06fh	; 617c

; ----------------------------------------------------------------------
; DATOS colores_sueltos_617E: 2 bytes con forma de colores de dibujo (dos de 4
;   bits por byte) entre dos listas: no los apunta ninguna entrada de las
;   tablas de colores de p32 ni llega a ellos ningun lector del listado
;   0x617e..0x6180  (2 bytes)
DATA_colores_sueltos_617E:
	defb 017h,0c0h	; 617e

; ----------------------------------------------------------------------
; DATOS colores_6180: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4D25 (4 bytes)
;   0x6180..0x6184  (4 bytes)
DATA_colores_6180:
	defb 015h,06fh,07ch,0deh	; 6180

; ----------------------------------------------------------------------
; DATOS colores_6184: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4D25 (2 bytes)
;   0x6184..0x6186  (2 bytes)
DATA_colores_6184:
	defb 056h,07fh	; 6184

; ----------------------------------------------------------------------
; DATOS colores_sin_uso_6186: 2 bytes de colores de dibujo (dos colores de 4
;   bits por byte) a los que apuntan tabla_colores_6112 (entrada 22): indices
;   que no pide ninguna lista de dibujos
;   0x6186..0x6188  (2 bytes)
DATA_colores_sin_uso_6186:
	defb 01fh,048h	; 6186

; ----------------------------------------------------------------------
; DATOS colores_6188: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4D25 (4 bytes)
;   0x6188..0x618c  (4 bytes)
DATA_colores_6188:
	defb 056h,04fh,017h,08ch	; 6188

; ----------------------------------------------------------------------
; DATOS colores_sin_uso_618C: 8 bytes de colores de dibujo (dos colores de 4
;   bits por byte) a los que apuntan tabla_colores_6112 (entrada 24),
;   tabla_colores_6112 (entrada 25), tabla_colores_6112 (entrada 26): indices
;   que no pide ninguna lista de dibujos
;   0x618c..0x6194  (8 bytes)
DATA_colores_sin_uso_618C:
	defb 01fh,046h,078h,0cfh,057h,08fh,0a3h,0c0h	; 618c  .Fx.W...

; ----------------------------------------------------------------------
; DATOS colores_6194: 2 colores de 4 bits, dos por byte, para un dibujo de 1
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4D25 (1 bytes)
;   0x6194..0x6195  (1 bytes)
DATA_colores_6194:
	defb 056h	; 6194

; ----------------------------------------------------------------------
; DATOS colores_sin_uso_6195: 3 bytes de colores de dibujo (dos colores de 4
;   bits por byte) a los que apuntan tabla_colores_6112 (entrada 28): indices
;   que no pide ninguna lista de dibujos
;   0x6195..0x6198  (3 bytes)
DATA_colores_sin_uso_6195:
	defb 0cfh,047h,08fh	; 6195

; ----------------------------------------------------------------------
; DATOS colores_6198: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4D34 (2 bytes)
;   0x6198..0x619a  (2 bytes)
DATA_colores_6198:
	defb 045h,068h	; 6198

; ----------------------------------------------------------------------
; DATOS tabla_colores_619A: 31 punteros a colores de dibujo (los usa hasta el
;   indice 30; p00:4DA0); lo leen p00:4DA0 (62 bytes)
;   0x619a..0x61d8  (62 bytes)
DATA_tabla_colores_619A:
	defw 061e6h,061eah,061f1h,06227h,061f5h,061f9h,061fdh,061edh	; 619a
	defw 06201h,06206h,0620ah,0620ch,06210h,06214h,06218h,0621ch	; 61aa
	defw 06220h,06224h,0622bh,0622dh,06231h,061e9h,06232h,06243h	; 61ba
	defw 06234h,06238h,0623ah,0623eh,06240h,06244h,06248h	; 61ca

; ----------------------------------------------------------------------
; DATOS colores_sin_uso_61D8: 102 bytes de colores de dibujo (dos colores de 4
;   bits por byte) a los que apuntan tabla_colores_619A (entrada 0),
;   tabla_colores_619A (entrada 1), tabla_colores_619A (entrada 2): indices
;   que no pide ninguna lista de dibujos
;   0x61d8..0x623e  (102 bytes)
DATA_colores_sin_uso_61D8:
	defb 04ah,062h,04eh,062h,005h,062h,052h,062h,0e6h,061h,056h,062h,058h,062h,014h,056h	; 61d8  JbNb.bRb.aVbXb.V
	defb 07dh,0efh,04fh,015h,026h,078h,03fh,0bch,0deh,03fh,012h,045h,07ch,0cfh,018h,035h	; 61e8  }.O.&x?..?.E|..5
	defb 06bh,045h,067h,012h,03fh,018h,04fh,035h,0bch,028h,07bh,01ch,045h,06fh,012h,045h	; 61f8  kEg.?.O5.({.Eo.E
	defb 06bh,0c8h,045h,0afh,015h,067h,04fh,0bch,05dh,0efh,014h,076h,045h,06fh,078h,0bch	; 6208  k.E..gO.]..vEox.
	defb 04fh,013h,056h,0abh,045h,067h,0f1h,0bch,024h,05bh,0cdh,0efh,045h,016h,078h,0cfh	; 6218  O.V.Eg..$[..E.x.
	defb 013h,082h,074h,0afh,09eh,02fh,045h,067h,089h,09fh,07fh,08dh,07fh,056h,014h,08dh	; 6228  ..t../Eg.....V..
	defb 015h,089h,04fh,015h,067h,08ah	; 6238

; ----------------------------------------------------------------------
; DATOS colores_623E: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (2 bytes)
;   0x623e..0x6240  (2 bytes)
DATA_colores_623E:
	defb 014h,050h	; 623e

; ----------------------------------------------------------------------
; DATOS colores_6240: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0x6240..0x6244  (4 bytes)
DATA_colores_6240:
	defb 012h,045h,067h,08fh	; 6240

; ----------------------------------------------------------------------
; DATOS colores_6244: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0x6244..0x6248  (4 bytes)
DATA_colores_6244:
	defb 012h,045h,067h,0cfh	; 6244

; ----------------------------------------------------------------------
; DATOS colores_6248: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (2 bytes)
;   0x6248..0x624a  (2 bytes)
DATA_colores_6248:
	defb 047h,08fh	; 6248

; ----------------------------------------------------------------------
; DATOS colores_sueltos_624A: 16 bytes con forma de colores de dibujo (dos de
;   4 bits por byte) entre dos listas: no los apunta ninguna entrada de las
;   tablas de colores de p32 ni llega a ellos ningun lector del listado
;   0x624a..0x625a  (16 bytes)
DATA_colores_sueltos_624A:
	defb 01fh,045h,067h,0deh,00fh,014h,056h,07dh,0dfh,012h,045h,069h,025h,06fh,014h,06fh	; 624a  .Eg...V}..Ei%o.o

; ----------------------------------------------------------------------
; DATOS tabla_colores_625A: 24 punteros a colores de dibujo (los usa hasta el
;   indice 23; p00:4DA0); lo leen p00:4DA0 (48 bytes)
;   0x625a..0x628a  (48 bytes)
DATA_tabla_colores_625A:
	defw 0628ah,0628eh,06292h,06296h,0629ah,0629eh,062a0h,062a2h	; 625a
	defw 062a4h,062a6h,062a8h,062aah,062aeh,062b2h,062b6h,062b8h	; 626a
	defw 062bch,062c0h,062c4h,062c8h,062cah,062cdh,062cbh,062a1h	; 627a

; ----------------------------------------------------------------------
; DATOS colores_628A: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0x628a..0x628e  (4 bytes)
DATA_colores_628A:
	defb 014h,06fh,025h,08ch	; 628a

; ----------------------------------------------------------------------
; DATOS colores_628E: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0x628e..0x6292  (4 bytes)
DATA_colores_628E:
	defb 014h,05fh,023h,0c6h	; 628e

; ----------------------------------------------------------------------
; DATOS colores_6292: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0x6292..0x6296  (4 bytes)
DATA_colores_6292:
	defb 015h,06fh,078h,0adh	; 6292

; ----------------------------------------------------------------------
; DATOS colores_sin_uso_6296: 4 bytes de colores de dibujo (dos colores de 4
;   bits por byte) a los que apuntan tabla_colores_625A (entrada 3): indices
;   que no pide ninguna lista de dibujos
;   0x6296..0x629a  (4 bytes)
DATA_colores_sin_uso_6296:
	defb 013h,046h,078h,0cfh	; 6296

; ----------------------------------------------------------------------
; DATOS colores_629A: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0x629a..0x629e  (4 bytes)
DATA_colores_629A:
	defb 014h,0cfh,037h,08bh	; 629a

; ----------------------------------------------------------------------
; DATOS colores_629E: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (2 bytes)
;   0x629e..0x62a0  (2 bytes)
DATA_colores_629E:
	defb 01fh,02ch	; 629e

; ----------------------------------------------------------------------
; DATOS colores_sin_uso_62A0: 1 bytes de colores de dibujo (dos colores de 4
;   bits por byte) a los que apuntan tabla_colores_625A (entrada 6): indices
;   que no pide ninguna lista de dibujos
;   0x62a0..0x62a1  (1 bytes)
DATA_colores_sin_uso_62A0:
	defb 01bh	; 62a0

; ----------------------------------------------------------------------
; DATOS colores_62A1: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (2 bytes)
;   0x62a1..0x62a3  (2 bytes)
DATA_colores_62A1:
	defb 0cfh,013h	; 62a1

; ----------------------------------------------------------------------
; DATOS colores_sin_uso_62A3: 5 bytes de colores de dibujo (dos colores de 4
;   bits por byte) a los que apuntan tabla_colores_625A (entrada 8),
;   tabla_colores_625A (entrada 9): indices que no pide ninguna lista de
;   dibujos
;   0x62a3..0x62a8  (5 bytes)
DATA_colores_sin_uso_62A3:
	defb 04fh,014h,056h,015h,0cfh	; 62a3

; ----------------------------------------------------------------------
; DATOS colores_62A8: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (2 bytes)
;   0x62a8..0x62aa  (2 bytes)
DATA_colores_62A8:
	defb 02fh,078h	; 62a8

; ----------------------------------------------------------------------
; DATOS colores_62AA: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0x62aa..0x62ae  (4 bytes)
DATA_colores_62AA:
	defb 02fh,08bh,014h,07ch	; 62aa

; ----------------------------------------------------------------------
; DATOS colores_62AE: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0x62ae..0x62b2  (4 bytes)
DATA_colores_62AE:
	defb 024h,016h,078h,0cfh	; 62ae

; ----------------------------------------------------------------------
; DATOS colores_62B2: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (2 bytes)
;   0x62b2..0x62b4  (2 bytes)
DATA_colores_62B2:
	defb 03bh,0cfh	; 62b2

; ----------------------------------------------------------------------
; DATOS colores_sueltos_62B4: 2 bytes con forma de colores de dibujo (dos de 4
;   bits por byte) entre dos listas: no los apunta ninguna entrada de las
;   tablas de colores de p32 ni llega a ellos ningun lector del listado
;   0x62b4..0x62b6  (2 bytes)
DATA_colores_sueltos_62B4:
	defb 014h,056h	; 62b4

; ----------------------------------------------------------------------
; DATOS colores_62B6: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (2 bytes)
;   0x62b6..0x62b8  (2 bytes)
DATA_colores_62B6:
	defb 045h,06fh	; 62b6

; ----------------------------------------------------------------------
; DATOS colores_sin_uso_62B8: 4 bytes de colores de dibujo (dos colores de 4
;   bits por byte) a los que apuntan tabla_colores_625A (entrada 15): indices
;   que no pide ninguna lista de dibujos
;   0x62b8..0x62bc  (4 bytes)
DATA_colores_sin_uso_62B8:
	defb 045h,0cfh,016h,08bh	; 62b8

; ----------------------------------------------------------------------
; DATOS colores_62BC: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0x62bc..0x62c0  (4 bytes)
DATA_colores_62BC:
	defb 045h,08fh,016h,07ch	; 62bc

; ----------------------------------------------------------------------
; DATOS colores_sin_uso_62C0: 17 bytes de colores de dibujo (dos colores de 4
;   bits por byte) a los que apuntan tabla_colores_625A (entrada 17),
;   tabla_colores_625A (entrada 18), tabla_colores_625A (entrada 19): indices
;   que no pide ninguna lista de dibujos
;   0x62c0..0x62d1  (17 bytes)
DATA_colores_sin_uso_62C0:
	defb 045h,01fh,07ah,0cdh,047h,056h,018h,0afh,056h,0cfh,056h,08fh,07ah,078h,03fh,0abh	; 62c0  E.z.GV..V.V.zx?.
	defb 0cdh	; 62d0

; ----------------------------------------------------------------------
; DATOS tabla_colores_62D1: 68 punteros a colores de dibujo (los usa hasta el
;   indice 67; p00:4DA0); lo leen p00:4DA0 (136 bytes)
;   0x62d1..0x6359  (136 bytes)
DATA_tabla_colores_62D1:
	defw 06359h,0635bh,0635dh,06361h,06365h,06369h,0636dh,06371h	; 62d1
	defw 06375h,06379h,0637dh,06381h,06383h,06387h,0638bh,0638fh	; 62e1
	defw 06393h,06397h,0639bh,0639fh,06364h,063ffh,063a3h,063a7h	; 62f1
	defw 063abh,063adh,063afh,063b1h,063b3h,063b7h,063b9h,063bdh	; 6301
	defw 063bfh,063c3h,063c7h,063c9h,063cbh,063cfh,063d3h,063d7h	; 6311
	defw 063dbh,063dfh,063e3h,063e7h,063ebh,063efh,063f4h,063f6h	; 6321
	defw 063fah,063feh,06402h,06404h,06408h,0640ch,06410h,06414h	; 6331
	defw 06418h,0641ch,0641eh,06420h,06422h,06424h,06426h,063f2h	; 6341
	defw 06428h,0642bh,0642fh,06429h	; 6351  -> DATA_colores_sin_uso_6428 DATA_colores_sin_uso_642B DATA_colores_642F DATA_colores_6429

; ----------------------------------------------------------------------
; DATOS colores_6359: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (2 bytes)
;   0x6359..0x635b  (2 bytes)
DATA_colores_6359:
	defb 012h,04fh	; 6359

; ----------------------------------------------------------------------
; DATOS colores_635B: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (2 bytes)
;   0x635b..0x635d  (2 bytes)
DATA_colores_635B:
	defb 01fh,046h	; 635b

; ----------------------------------------------------------------------
; DATOS colores_635D: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0x635d..0x6361  (4 bytes)
DATA_colores_635D:
	defb 016h,045h,07fh,083h	; 635d

; ----------------------------------------------------------------------
; DATOS colores_6361: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); se solapan 2 bloques:
;   (colores_6364 6364-6365); lo leen p00:4C26 (4 bytes)
;   0x6361..0x6365  (4 bytes)
DATA_colores_6361:
	defb 04fh,015h,067h,08ah	; 6361

; ----------------------------------------------------------------------
; DATOS colores_6365: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0x6365..0x6369  (4 bytes)
DATA_colores_6365:
	defb 012h,08fh,04bh,0c5h	; 6365

; ----------------------------------------------------------------------
; DATOS colores_6369: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0x6369..0x636d  (4 bytes)
DATA_colores_6369:
	defb 067h,045h,083h,0fah	; 6369

; ----------------------------------------------------------------------
; DATOS colores_636D: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0x636d..0x6371  (4 bytes)
DATA_colores_636D:
	defb 046h,05fh,0c3h,07bh	; 636d

; ----------------------------------------------------------------------
; DATOS colores_sin_uso_6371: 4 bytes de colores de dibujo (dos colores de 4
;   bits por byte) a los que apuntan tabla_colores_62D1 (entrada 7): indices
;   que no pide ninguna lista de dibujos
;   0x6371..0x6375  (4 bytes)
DATA_colores_sin_uso_6371:
	defb 034h,057h,08bh,0cfh	; 6371

; ----------------------------------------------------------------------
; DATOS colores_6375: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0x6375..0x6379  (4 bytes)
DATA_colores_6375:
	defb 012h,045h,067h,0ceh	; 6375

; ----------------------------------------------------------------------
; DATOS colores_6379: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (2 bytes)
;   0x6379..0x637b  (2 bytes)
DATA_colores_6379:
	defb 014h,067h	; 6379

; ----------------------------------------------------------------------
; DATOS colores_sueltos_637B: 2 bytes con forma de colores de dibujo (dos de 4
;   bits por byte) entre dos listas: no los apunta ninguna entrada de las
;   tablas de colores de p32 ni llega a ellos ningun lector del listado
;   0x637b..0x637d  (2 bytes)
DATA_colores_sueltos_637B:
	defb 0cfh,053h	; 637b

; ----------------------------------------------------------------------
; DATOS colores_637D: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0x637d..0x6381  (4 bytes)
DATA_colores_637D:
	defb 015h,07fh,028h,0b6h	; 637d

; ----------------------------------------------------------------------
; DATOS colores_6381: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (2 bytes)
;   0x6381..0x6383  (2 bytes)
DATA_colores_6381:
	defb 078h,03fh	; 6381

; ----------------------------------------------------------------------
; DATOS colores_6383: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0x6383..0x6387  (4 bytes)
DATA_colores_6383:
	defb 056h,078h,024h,0ceh	; 6383

; ----------------------------------------------------------------------
; DATOS colores_6387: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (2 bytes)
;   0x6387..0x6389  (2 bytes)
DATA_colores_6387:
	defb 015h,067h	; 6387

; ----------------------------------------------------------------------
; DATOS colores_sueltos_6389: 2 bytes con forma de colores de dibujo (dos de 4
;   bits por byte) entre dos listas: no los apunta ninguna entrada de las
;   tablas de colores de p32 ni llega a ellos ningun lector del listado
;   0x6389..0x638b  (2 bytes)
DATA_colores_sueltos_6389:
	defb 023h,04ch	; 6389

; ----------------------------------------------------------------------
; DATOS colores_638B: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0x638b..0x638f  (4 bytes)
DATA_colores_638B:
	defb 015h,06fh,034h,07ch	; 638b

; ----------------------------------------------------------------------
; DATOS colores_638F: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0x638f..0x6393  (4 bytes)
DATA_colores_638F:
	defb 012h,056h,074h,0c8h	; 638f

; ----------------------------------------------------------------------
; DATOS colores_6393: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (2 bytes)
;   0x6393..0x6395  (2 bytes)
DATA_colores_6393:
	defb 014h,08fh	; 6393

; ----------------------------------------------------------------------
; DATOS colores_sueltos_6395: 2 bytes con forma de colores de dibujo (dos de 4
;   bits por byte) entre dos listas: no los apunta ninguna entrada de las
;   tablas de colores de p32 ni llega a ellos ningun lector del listado
;   0x6395..0x6397  (2 bytes)
DATA_colores_sueltos_6395:
	defb 056h,0ceh	; 6395

; ----------------------------------------------------------------------
; DATOS colores_6397: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0x6397..0x639b  (4 bytes)
DATA_colores_6397:
	defb 016h,07ah,04dh,0efh	; 6397

; ----------------------------------------------------------------------
; DATOS colores_639B: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (2 bytes)
;   0x639b..0x639d  (2 bytes)
DATA_colores_639B:
	defb 034h,078h	; 639b

; ----------------------------------------------------------------------
; DATOS colores_sueltos_639D: 2 bytes con forma de colores de dibujo (dos de 4
;   bits por byte) entre dos listas: no los apunta ninguna entrada de las
;   tablas de colores de p32 ni llega a ellos ningun lector del listado
;   0x639d..0x639f  (2 bytes)
DATA_colores_sueltos_639D:
	defb 015h,06ch	; 639d

; ----------------------------------------------------------------------
; DATOS colores_639F: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0x639f..0x63a3  (4 bytes)
DATA_colores_639F:
	defb 012h,056h,047h,0f0h	; 639f

; ----------------------------------------------------------------------
; DATOS colores_63A3: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0x63a3..0x63a7  (4 bytes)
DATA_colores_63A3:
	defb 07ah,015h,062h,04fh	; 63a3

; ----------------------------------------------------------------------
; DATOS colores_63A7: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0x63a7..0x63ab  (4 bytes)
DATA_colores_63A7:
	defb 04fh,015h,026h,0deh	; 63a7

; ----------------------------------------------------------------------
; DATOS colores_63AB: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (2 bytes)
;   0x63ab..0x63ad  (2 bytes)
DATA_colores_63AB:
	defb 056h,07fh	; 63ab

; ----------------------------------------------------------------------
; DATOS colores_63AD: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (2 bytes)
;   0x63ad..0x63af  (2 bytes)
DATA_colores_63AD:
	defb 067h,024h	; 63ad

; ----------------------------------------------------------------------
; DATOS colores_63AF: 2 colores de 4 bits, dos por byte, para un dibujo de 1
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (1 bytes)
;   0x63af..0x63b0  (1 bytes)
DATA_colores_63AF:
	defb 046h	; 63af

; ----------------------------------------------------------------------
; DATOS colores_sueltos_63B0: 1 bytes con forma de colores de dibujo (dos de 4
;   bits por byte) entre dos listas: no los apunta ninguna entrada de las
;   tablas de colores de p32 ni llega a ellos ningun lector del listado
;   0x63b0..0x63b1  (1 bytes)
DATA_colores_sueltos_63B0:
	defb 02fh	; 63b0

; ----------------------------------------------------------------------
; DATOS colores_63B1: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (2 bytes)
;   0x63b1..0x63b3  (2 bytes)
DATA_colores_63B1:
	defb 06fh,047h	; 63b1

; ----------------------------------------------------------------------
; DATOS colores_63B3: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0x63b3..0x63b7  (4 bytes)
DATA_colores_63B3:
	defb 014h,067h,058h,0afh	; 63b3

; ----------------------------------------------------------------------
; DATOS colores_63B7: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (2 bytes)
;   0x63b7..0x63b9  (2 bytes)
DATA_colores_63B7:
	defb 01fh,046h	; 63b7

; ----------------------------------------------------------------------
; DATOS colores_63B9: 2 colores de 4 bits, dos por byte, para un dibujo de 1
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (1 bytes)
;   0x63b9..0x63ba  (1 bytes)
DATA_colores_63B9:
	defb 018h	; 63b9

; ----------------------------------------------------------------------
; DATOS colores_sueltos_63BA: 3 bytes con forma de colores de dibujo (dos de 4
;   bits por byte) entre dos listas: no los apunta ninguna entrada de las
;   tablas de colores de p32 ni llega a ellos ningun lector del listado
;   0x63ba..0x63bd  (3 bytes)
DATA_colores_sueltos_63BA:
	defb 047h,0bfh,056h	; 63ba

; ----------------------------------------------------------------------
; DATOS colores_63BD: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (2 bytes)
;   0x63bd..0x63bf  (2 bytes)
DATA_colores_63BD:
	defb 056h,078h	; 63bd

; ----------------------------------------------------------------------
; DATOS colores_63BF: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0x63bf..0x63c3  (4 bytes)
DATA_colores_63BF:
	defb 078h,03fh,015h,0bch	; 63bf

; ----------------------------------------------------------------------
; DATOS colores_63C3: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0x63c3..0x63c7  (4 bytes)
DATA_colores_63C3:
	defb 0cfh,08bh,014h,057h	; 63c3

; ----------------------------------------------------------------------
; DATOS colores_63C7: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (2 bytes)
;   0x63c7..0x63c9  (2 bytes)
DATA_colores_63C7:
	defb 015h,078h	; 63c7

; ----------------------------------------------------------------------
; DATOS colores_sin_uso_63C9: 2 bytes de colores de dibujo (dos colores de 4
;   bits por byte) a los que apuntan tabla_colores_62D1 (entrada 35): indices
;   que no pide ninguna lista de dibujos
;   0x63c9..0x63cb  (2 bytes)
DATA_colores_sin_uso_63C9:
	defb 0cfh,03bh	; 63c9

; ----------------------------------------------------------------------
; DATOS colores_63CB: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0x63cb..0x63cf  (4 bytes)
DATA_colores_63CB:
	defb 078h,09fh,046h,05bh	; 63cb

; ----------------------------------------------------------------------
; DATOS colores_63CF: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0x63cf..0x63d3  (4 bytes)
DATA_colores_63CF:
	defb 016h,045h,08fh,02ch	; 63cf

; ----------------------------------------------------------------------
; DATOS colores_63D3: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (2 bytes)
;   0x63d3..0x63d5  (2 bytes)
DATA_colores_63D3:
	defb 078h,0efh	; 63d3

; ----------------------------------------------------------------------
; DATOS colores_sueltos_63D5: 2 bytes con forma de colores de dibujo (dos de 4
;   bits por byte) entre dos listas: no los apunta ninguna entrada de las
;   tablas de colores de p32 ni llega a ellos ningun lector del listado
;   0x63d5..0x63d7  (2 bytes)
DATA_colores_sueltos_63D5:
	defb 0bch,0d0h	; 63d5

; ----------------------------------------------------------------------
; DATOS colores_63D7: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0x63d7..0x63db  (4 bytes)
DATA_colores_63D7:
	defb 078h,01fh,024h,056h	; 63d7

; ----------------------------------------------------------------------
; DATOS colores_63DB: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (2 bytes)
;   0x63db..0x63dd  (2 bytes)
DATA_colores_63DB:
	defb 015h,06fh	; 63db

; ----------------------------------------------------------------------
; DATOS colores_sueltos_63DD: 2 bytes con forma de colores de dibujo (dos de 4
;   bits por byte) entre dos listas: no los apunta ninguna entrada de las
;   tablas de colores de p32 ni llega a ellos ningun lector del listado
;   0x63dd..0x63df  (2 bytes)
DATA_colores_sueltos_63DD:
	defb 034h,08ah	; 63dd

; ----------------------------------------------------------------------
; DATOS colores_63DF: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0x63df..0x63e3  (4 bytes)
DATA_colores_63DF:
	defb 027h,08bh,014h,09fh	; 63df

; ----------------------------------------------------------------------
; DATOS colores_sin_uso_63E3: 4 bytes de colores de dibujo (dos colores de 4
;   bits por byte) a los que apuntan tabla_colores_62D1 (entrada 42): indices
;   que no pide ninguna lista de dibujos
;   0x63e3..0x63e7  (4 bytes)
DATA_colores_sin_uso_63E3:
	defb 015h,0cfh,047h,08eh	; 63e3

; ----------------------------------------------------------------------
; DATOS colores_63E7: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0x63e7..0x63eb  (4 bytes)
DATA_colores_63E7:
	defb 045h,07fh,013h,06ah	; 63e7

; ----------------------------------------------------------------------
; DATOS colores_63EB: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (2 bytes)
;   0x63eb..0x63ed  (2 bytes)
DATA_colores_63EB:
	defb 046h,08fh	; 63eb

; ----------------------------------------------------------------------
; DATOS colores_sueltos_63ED: 2 bytes con forma de colores de dibujo (dos de 4
;   bits por byte) entre dos listas: no los apunta ninguna entrada de las
;   tablas de colores de p32 ni llega a ellos ningun lector del listado
;   0x63ed..0x63ef  (2 bytes)
DATA_colores_sueltos_63ED:
	defb 01bh,0ceh	; 63ed

; ----------------------------------------------------------------------
; DATOS colores_63EF: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); se solapan 2 bloques:
;   (colores_63F2 63F2-63F4); lo leen p00:4C26 (5 bytes)
;   0x63ef..0x63f4  (5 bytes)
DATA_colores_63EF:
	defb 03bh,0cfh,067h,0deh	; 63ef
	defb 0fch	; 63f3

; ----------------------------------------------------------------------
; DATOS colores_63F4: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (2 bytes)
;   0x63f4..0x63f6  (2 bytes)
DATA_colores_63F4:
	defb 05dh,0efh	; 63f4

; ----------------------------------------------------------------------
; DATOS colores_sin_uso_63F6: 4 bytes de colores de dibujo (dos colores de 4
;   bits por byte) a los que apuntan tabla_colores_62D1 (entrada 47): indices
;   que no pide ninguna lista de dibujos
;   0x63f6..0x63fa  (4 bytes)
DATA_colores_sin_uso_63F6:
	defb 034h,056h,07dh,0efh	; 63f6

; ----------------------------------------------------------------------
; DATOS colores_63FA: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0x63fa..0x63fe  (4 bytes)
DATA_colores_63FA:
	defb 024h,05bh,0cdh,0efh	; 63fa

; ----------------------------------------------------------------------
; DATOS colores_sin_uso_63FE: 1 bytes de colores de dibujo (dos colores de 4
;   bits por byte) a los que apuntan tabla_colores_62D1 (entrada 49): indices
;   que no pide ninguna lista de dibujos
;   0x63fe..0x63ff  (1 bytes)
DATA_colores_sin_uso_63FE:
	defb 037h	; 63fe

; ----------------------------------------------------------------------
; DATOS colores_63FF: 2 colores de 4 bits, dos por byte, para un dibujo de 1
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (1 bytes)
;   0x63ff..0x6400  (1 bytes)
DATA_colores_63FF:
	defb 089h	; 63ff

; ----------------------------------------------------------------------
; DATOS colores_sueltos_6400: 2 bytes con forma de colores de dibujo (dos de 4
;   bits por byte) entre dos listas: no los apunta ninguna entrada de las
;   tablas de colores de p32 ni llega a ellos ningun lector del listado
;   0x6400..0x6402  (2 bytes)
DATA_colores_sueltos_6400:
	defb 0ach,0efh	; 6400

; ----------------------------------------------------------------------
; DATOS colores_6402: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (2 bytes)
;   0x6402..0x6404  (2 bytes)
DATA_colores_6402:
	defb 046h,05fh	; 6402

; ----------------------------------------------------------------------
; DATOS colores_6404: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0x6404..0x6408  (4 bytes)
DATA_colores_6404:
	defb 012h,046h,03ch,0f0h	; 6404

; ----------------------------------------------------------------------
; DATOS colores_sin_uso_6408: 16 bytes de colores de dibujo (dos colores de 4
;   bits por byte) a los que apuntan tabla_colores_62D1 (entrada 52),
;   tabla_colores_62D1 (entrada 53), tabla_colores_62D1 (entrada 54): indices
;   que no pide ninguna lista de dibujos
;   0x6408..0x6418  (16 bytes)
DATA_colores_sin_uso_6408:
	defb 0cfh,013h,047h,0abh,0cfh,0b3h,012h,06ah,0cfh,0a3h,026h,0b7h,012h,036h,0abh,0cfh	; 6408  ..G....j..&..6..

; ----------------------------------------------------------------------
; DATOS colores_6418: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (2 bytes)
;   0x6418..0x641a  (2 bytes)
DATA_colores_6418:
	defb 045h,067h	; 6418

; ----------------------------------------------------------------------
; DATOS colores_sin_uso_641A: 6 bytes de colores de dibujo (dos colores de 4
;   bits por byte) a los que apuntan tabla_colores_62D1 (entrada 57),
;   tabla_colores_62D1 (entrada 58): indices que no pide ninguna lista de
;   dibujos
;   0x641a..0x6420  (6 bytes)
DATA_colores_sin_uso_641A:
	defb 0abh,0cfh,015h,067h,078h,0afh	; 641a

; ----------------------------------------------------------------------
; DATOS colores_6420: 2 colores de 4 bits, dos por byte, para un dibujo de 1
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (1 bytes)
;   0x6420..0x6421  (1 bytes)
DATA_colores_6420:
	defb 08fh	; 6420

; ----------------------------------------------------------------------
; DATOS colores_sin_uso_6421: 5 bytes de colores de dibujo (dos colores de 4
;   bits por byte) a los que apuntan tabla_colores_62D1 (entrada 60),
;   tabla_colores_62D1 (entrada 61): indices que no pide ninguna lista de
;   dibujos
;   0x6421..0x6426  (5 bytes)
DATA_colores_sin_uso_6421:
	defb 07ah,014h,057h,014h,0afh	; 6421

; ----------------------------------------------------------------------
; DATOS colores_6426: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (2 bytes)
;   0x6426..0x6428  (2 bytes)
DATA_colores_6426:
	defb 012h,05fh	; 6426

; ----------------------------------------------------------------------
; DATOS colores_sin_uso_6428: 1 bytes de colores de dibujo (dos colores de 4
;   bits por byte) a los que apuntan tabla_colores_62D1 (entrada 64): indices
;   que no pide ninguna lista de dibujos
;   0x6428..0x6429  (1 bytes)
DATA_colores_sin_uso_6428:
	defb 02fh	; 6428

; ----------------------------------------------------------------------
; DATOS colores_6429: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (2 bytes)
;   0x6429..0x642b  (2 bytes)
DATA_colores_6429:
	defb 014h,056h	; 6429

; ----------------------------------------------------------------------
; DATOS colores_sin_uso_642B: 4 bytes de colores de dibujo (dos colores de 4
;   bits por byte) a los que apuntan tabla_colores_62D1 (entrada 65): indices
;   que no pide ninguna lista de dibujos
;   0x642b..0x642f  (4 bytes)
DATA_colores_sin_uso_642B:
	defb 012h,045h,067h,08fh	; 642b

; ----------------------------------------------------------------------
; DATOS colores_642F: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0x642f..0x6433  (4 bytes)
DATA_colores_642F:
	defb 015h,06fh,078h,0adh	; 642f

; ----------------------------------------------------------------------
; DATOS tabla_colores_6433: 21 punteros a colores de dibujo (los usa hasta el
;   indice 20; p00:4DA0); lo leen p00:4DA0 (42 bytes)
;   0x6433..0x645d  (42 bytes)
DATA_tabla_colores_6433:
	defw 0645fh,06463h,06464h,06465h,06467h,06469h,06498h,0646bh	; 6433
	defw 0646dh,0646fh,06470h,06474h,06478h,0647ah,0647eh,06482h	; 6443
	defw 06486h,0648ah,0648eh,06490h,06494h	; 6453

; ----------------------------------------------------------------------
; DATOS colores_sin_uso_645D: 10 bytes de colores de dibujo (dos colores de 4
;   bits por byte) a los que apuntan tabla_colores_62D1 (entrada 19),
;   tabla_colores_6433 (entrada 0), tabla_colores_6433 (entrada 1): indices
;   que no pide ninguna lista de dibujos
;   0x645d..0x6467  (10 bytes)
DATA_colores_sin_uso_645D:
	defb 098h,064h,013h,06fh,045h,022h,052h,04fh,042h,0afh	; 645d  .d.oE"ROB.

; ----------------------------------------------------------------------
; DATOS colores_6467: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (2 bytes)
;   0x6467..0x6469  (2 bytes)
DATA_colores_6467:
	defb 015h,06fh	; 6467

; ----------------------------------------------------------------------
; DATOS colores_6469: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (2 bytes)
;   0x6469..0x646b  (2 bytes)
DATA_colores_6469:
	defb 01fh,068h	; 6469

; ----------------------------------------------------------------------
; DATOS colores_646B: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (2 bytes)
;   0x646b..0x646d  (2 bytes)
DATA_colores_646B:
	defb 014h,056h	; 646b

; ----------------------------------------------------------------------
; DATOS colores_646D: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (2 bytes)
;   0x646d..0x646f  (2 bytes)
DATA_colores_646D:
	defb 015h,04fh	; 646d

; ----------------------------------------------------------------------
; DATOS colores_sin_uso_646F: 1 bytes de colores de dibujo (dos colores de 4
;   bits por byte) a los que apuntan tabla_colores_6433 (entrada 9): indices
;   que no pide ninguna lista de dibujos
;   0x646f..0x6470  (1 bytes)
DATA_colores_sin_uso_646F:
	defb 02fh	; 646f

; ----------------------------------------------------------------------
; DATOS colores_6470: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0x6470..0x6474  (4 bytes)
DATA_colores_6470:
	defb 03fh,078h,045h,061h	; 6470

; ----------------------------------------------------------------------
; DATOS colores_6474: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0x6474..0x6478  (4 bytes)
DATA_colores_6474:
	defb 03fh,078h,0abh,0cdh	; 6474

; ----------------------------------------------------------------------
; DATOS colores_6478: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (2 bytes)
;   0x6478..0x647a  (2 bytes)
DATA_colores_6478:
	defb 04fh,056h	; 6478

; ----------------------------------------------------------------------
; DATOS colores_647A: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (2 bytes)
;   0x647a..0x647c  (2 bytes)
DATA_colores_647A:
	defb 015h,067h	; 647a

; ----------------------------------------------------------------------
; DATOS colores_sueltos_647C: 2 bytes con forma de colores de dibujo (dos de 4
;   bits por byte) entre dos listas: no los apunta ninguna entrada de las
;   tablas de colores de p32 ni llega a ellos ningun lector del listado
;   0x647c..0x647e  (2 bytes)
DATA_colores_sueltos_647C:
	defb 04fh,0bch	; 647c

; ----------------------------------------------------------------------
; DATOS colores_647E: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (2 bytes)
;   0x647e..0x6480  (2 bytes)
DATA_colores_647E:
	defb 05dh,0efh	; 647e

; ----------------------------------------------------------------------
; DATOS colores_sueltos_6480: 2 bytes con forma de colores de dibujo (dos de 4
;   bits por byte) entre dos listas: no los apunta ninguna entrada de las
;   tablas de colores de p32 ni llega a ellos ningun lector del listado
;   0x6480..0x6482  (2 bytes)
DATA_colores_sueltos_6480:
	defb 014h,076h	; 6480

; ----------------------------------------------------------------------
; DATOS colores_6482: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0x6482..0x6486  (4 bytes)
DATA_colores_6482:
	defb 024h,05bh,0cdh,0efh	; 6482

; ----------------------------------------------------------------------
; DATOS colores_sin_uso_6486: 8 bytes de colores de dibujo (dos colores de 4
;   bits por byte) a los que apuntan tabla_colores_6433 (entrada 16),
;   tabla_colores_6433 (entrada 17): indices que no pide ninguna lista de
;   dibujos
;   0x6486..0x648e  (8 bytes)
DATA_colores_sin_uso_6486:
	defb 034h,057h,08bh,0cfh,046h,05fh,0c3h,07bh	; 6486  4W..F_.{

; ----------------------------------------------------------------------
; DATOS colores_648E: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (2 bytes)
;   0x648e..0x6490  (2 bytes)
DATA_colores_648E:
	defb 046h,01fh	; 648e

; ----------------------------------------------------------------------
; DATOS colores_6490: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0x6490..0x6494  (4 bytes)
DATA_colores_6490:
	defb 04fh,015h,067h,08ah	; 6490

; ----------------------------------------------------------------------
; DATOS colores_6494: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0x6494..0x6498  (4 bytes)
DATA_colores_6494:
	defb 015h,07fh,028h,0b6h	; 6494

; ----------------------------------------------------------------------
; DATOS colores_sin_uso_6498: 4 bytes de colores de dibujo (dos colores de 4
;   bits por byte) a los que apuntan tabla_colores_6433 (entrada 6): indices
;   que no pide ninguna lista de dibujos
;   0x6498..0x649c  (4 bytes)
DATA_colores_sin_uso_6498:
	defb 012h,045h,067h,0cfh	; 6498

; ----------------------------------------------------------------------
; DATOS tabla_colores_649C: 31 punteros a colores de dibujo (los usa hasta el
;   indice 30; p00:4DA0); lo leen p00:4DA0 (62 bytes)
;   0x649c..0x64da  (62 bytes)
DATA_tabla_colores_649C:
	defw 064dah,064dch,064deh,064e0h,064e4h,064e7h,064eah,064eeh	; 649c
	defw 064f2h,064f6h,064f8h,064fbh,064ffh,06501h,06505h,06509h	; 64ac
	defw 0650dh,06511h,06515h,06517h,06519h,0651dh,06521h,064e8h	; 64bc
	defw 06525h,064e5h,06527h,064f9h,0652bh,0652dh,06531h	; 64cc

; ----------------------------------------------------------------------
; DATOS colores_64DA: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (2 bytes)
;   0x64da..0x64dc  (2 bytes)
DATA_colores_64DA:
	defb 01eh,03fh	; 64da

; ----------------------------------------------------------------------
; DATOS colores_64DC: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (2 bytes)
;   0x64dc..0x64de  (2 bytes)
DATA_colores_64DC:
	defb 013h,04ch	; 64dc

; ----------------------------------------------------------------------
; DATOS colores_64DE: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (2 bytes)
;   0x64de..0x64e0  (2 bytes)
DATA_colores_64DE:
	defb 016h,0efh	; 64de

; ----------------------------------------------------------------------
; DATOS colores_64E0: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0x64e0..0x64e4  (4 bytes)
DATA_colores_64E0:
	defb 012h,08fh,073h,0abh	; 64e0

; ----------------------------------------------------------------------
; DATOS colores_64E4: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (2 bytes)
;   0x64e4..0x64e6  (2 bytes)
DATA_colores_64E4:
	defb 012h,078h	; 64e4

; ----------------------------------------------------------------------
; DATOS colores_sin_uso_64E6: 2 bytes de colores de dibujo (dos colores de 4
;   bits por byte) a los que apuntan tabla_colores_649C (entrada 5): indices
;   que no pide ninguna lista de dibujos
;   0x64e6..0x64e8  (2 bytes)
DATA_colores_sin_uso_64E6:
	defb 02ch,013h	; 64e6

; ----------------------------------------------------------------------
; DATOS colores_64E8: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4CB2 (2 bytes)
;   0x64e8..0x64ea  (2 bytes)
DATA_colores_64E8:
	defb 04fh,018h	; 64e8

; ----------------------------------------------------------------------
; DATOS colores_sin_uso_64EA: 4 bytes de colores de dibujo (dos colores de 4
;   bits por byte) a los que apuntan tabla_colores_649C (entrada 6): indices
;   que no pide ninguna lista de dibujos
;   0x64ea..0x64ee  (4 bytes)
DATA_colores_sin_uso_64EA:
	defb 013h,08fh,045h,067h	; 64ea

; ----------------------------------------------------------------------
; DATOS colores_64EE: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4CB2 (4 bytes)
;   0x64ee..0x64f2  (4 bytes)
DATA_colores_64EE:
	defb 014h,056h,078h,0efh	; 64ee

; ----------------------------------------------------------------------
; DATOS colores_64F2: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26, p00:4CB2 (4
;   bytes)
;   0x64f2..0x64f6  (4 bytes)
DATA_colores_64F2:
	defb 014h,05fh,067h,089h	; 64f2

; ----------------------------------------------------------------------
; DATOS colores_64F6: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (2 bytes)
;   0x64f6..0x64f8  (2 bytes)
DATA_colores_64F6:
	defb 016h,07eh	; 64f6

; ----------------------------------------------------------------------
; DATOS colores_64F8: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); se solapan 2 bloques:
;   (colores_64F9 64F9-64FB); lo leen p00:4CB2 (3 bytes)
;   0x64f8..0x64fb  (3 bytes)
DATA_colores_64F8:
	defb 017h,08fh	; 64f8
	defb 047h	; 64fa

; ----------------------------------------------------------------------
; DATOS colores_64FB: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26, p00:4CB2 (4
;   bytes)
;   0x64fb..0x64ff  (4 bytes)
DATA_colores_64FB:
	defb 01fh,05eh,034h,06ch	; 64fb

; ----------------------------------------------------------------------
; DATOS colores_sin_uso_64FF: 2 bytes de colores de dibujo (dos colores de 4
;   bits por byte) a los que apuntan tabla_colores_649C (entrada 12): indices
;   que no pide ninguna lista de dibujos
;   0x64ff..0x6501  (2 bytes)
DATA_colores_sin_uso_64FF:
	defb 024h,056h	; 64ff

; ----------------------------------------------------------------------
; DATOS colores_6501: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0x6501..0x6505  (4 bytes)
DATA_colores_6501:
	defb 028h,07fh,015h,06eh	; 6501

; ----------------------------------------------------------------------
; DATOS colores_sin_uso_6505: 4 bytes de colores de dibujo (dos colores de 4
;   bits por byte) a los que apuntan tabla_colores_649C (entrada 14): indices
;   que no pide ninguna lista de dibujos
;   0x6505..0x6509  (4 bytes)
DATA_colores_sin_uso_6505:
	defb 02fh,08ch,073h,0bch	; 6505

; ----------------------------------------------------------------------
; DATOS colores_6509: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0x6509..0x650d  (4 bytes)
DATA_colores_6509:
	defb 024h,08fh,037h,0bch	; 6509

; ----------------------------------------------------------------------
; DATOS colores_650D: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0x650d..0x6511  (4 bytes)
DATA_colores_650D:
	defb 034h,0bch,015h,0efh	; 650d

; ----------------------------------------------------------------------
; DATOS colores_6511: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0x6511..0x6515  (4 bytes)
DATA_colores_6511:
	defb 03bh,0cfh,014h,07eh	; 6511

; ----------------------------------------------------------------------
; DATOS colores_sin_uso_6515: 8 bytes de colores de dibujo (dos colores de 4
;   bits por byte) a los que apuntan tabla_colores_649C (entrada 18),
;   tabla_colores_649C (entrada 19), tabla_colores_649C (entrada 20): indices
;   que no pide ninguna lista de dibujos
;   0x6515..0x651d  (8 bytes)
DATA_colores_sin_uso_6515:
	defb 034h,07ch,034h,056h,034h,06fh,017h,08ah	; 6515  4|4V4o..

; ----------------------------------------------------------------------
; DATOS colores_651D: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0x651d..0x6521  (4 bytes)
DATA_colores_651D:
	defb 03fh,04ch,012h,07bh	; 651d

; ----------------------------------------------------------------------
; DATOS colores_6521: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (2 bytes)
;   0x6521..0x6523  (2 bytes)
DATA_colores_6521:
	defb 04ch,01bh	; 6521

; ----------------------------------------------------------------------
; DATOS colores_sin_uso_6523: 4 bytes de colores de dibujo (dos colores de 4
;   bits por byte) a los que apuntan tabla_colores_649C (entrada 24): indices
;   que no pide ninguna lista de dibujos
;   0x6523..0x6527  (4 bytes)
DATA_colores_sin_uso_6523:
	defb 023h,05fh,068h,025h	; 6523

; ----------------------------------------------------------------------
; DATOS colores_6527: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4CB2 (4 bytes)
;   0x6527..0x652b  (4 bytes)
DATA_colores_6527:
	defb 078h,0afh,014h,056h	; 6527

; ----------------------------------------------------------------------
; DATOS colores_sin_uso_652B: 2 bytes de colores de dibujo (dos colores de 4
;   bits por byte) a los que apuntan tabla_colores_649C (entrada 28): indices
;   que no pide ninguna lista de dibujos
;   0x652b..0x652d  (2 bytes)
DATA_colores_sin_uso_652B:
	defb 014h,050h	; 652b

; ----------------------------------------------------------------------
; DATOS colores_652D: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0x652d..0x6531  (4 bytes)
DATA_colores_652D:
	defb 012h,045h,067h,08fh	; 652d

; ----------------------------------------------------------------------
; DATOS colores_6531: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0x6531..0x6535  (4 bytes)
DATA_colores_6531:
	defb 012h,045h,067h,0cfh	; 6531

; ----------------------------------------------------------------------
; DATOS tabla_colores_6535: 24 punteros a colores de dibujo (los usa hasta el
;   indice 23; p00:4DA0); lo leen p00:4DA0 (48 bytes)
;   0x6535..0x6565  (48 bytes)
DATA_tabla_colores_6535:
	defw 0656bh,0656fh,06573h,06575h,06579h,0657dh,0657fh,06581h	; 6535
	defw 06585h,06586h,0658ah,0658eh,06592h,06596h,06598h,0659ah	; 6545
	defw 0659ch,0659dh,0659fh,065a3h,065a5h,065a9h,0659ch,065abh	; 6555

; ----------------------------------------------------------------------
; DATOS colores_sin_uso_6565: 24 bytes de colores de dibujo (dos colores de 4
;   bits por byte) a los que apuntan tabla_colores_6535 (entrada 0),
;   tabla_colores_6535 (entrada 1), tabla_colores_6535 (entrada 2): indices
;   que no pide ninguna lista de dibujos
;   0x6565..0x657d  (24 bytes)
DATA_colores_sin_uso_6565:
	defb 0afh,065h,0b3h,065h,0b5h,065h,012h,048h,035h,06fh,012h,078h,04ah,0f5h,012h,08fh	; 6565  .e.e.e.H5o.xJ...
	defb 013h,046h,07bh,0cfh,014h,056h,08bh,0cfh	; 6575  .F{..V..

; ----------------------------------------------------------------------
; DATOS colores_657D: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (2 bytes)
;   0x657d..0x657f  (2 bytes)
DATA_colores_657D:
	defb 014h,058h	; 657d

; ----------------------------------------------------------------------
; DATOS colores_sin_uso_657F: 25 bytes de colores de dibujo (dos colores de 4
;   bits por byte) a los que apuntan tabla_colores_6535 (entrada 6),
;   tabla_colores_6535 (entrada 7), tabla_colores_6535 (entrada 8): indices
;   que no pide ninguna lista de dibujos
;   0x657f..0x6598  (25 bytes)
DATA_colores_sin_uso_657F:
	defb 014h,05fh,012h,034h,0bch,0efh,02fh,023h,05bh,0f1h,04ch,034h,0bch,012h,05fh,034h	; 657f  ._.4../#[.L4.._4
	defb 0cfh,016h,07eh,034h,07ch,028h,0abh,03bh,0cfh	; 658f  ..~4|(...

; ----------------------------------------------------------------------
; DATOS colores_6598: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (2 bytes)
;   0x6598..0x659a  (2 bytes)
DATA_colores_6598:
	defb 047h,08fh	; 6598

; ----------------------------------------------------------------------
; DATOS colores_sin_uso_659A: 3 bytes de colores de dibujo (dos colores de 4
;   bits por byte) a los que apuntan tabla_colores_6535 (entrada 15),
;   tabla_colores_6535 (entrada 16), tabla_colores_6535 (entrada 22): indices
;   que no pide ninguna lista de dibujos
;   0x659a..0x659d  (3 bytes)
DATA_colores_sin_uso_659A:
	defb 048h,056h,068h	; 659a

; ----------------------------------------------------------------------
; DATOS colores_659D: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (2 bytes)
;   0x659d..0x659f  (2 bytes)
DATA_colores_659D:
	defb 014h,080h	; 659d

; ----------------------------------------------------------------------
; DATOS colores_659F: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0x659f..0x65a3  (4 bytes)
DATA_colores_659F:
	defb 014h,056h,078h,080h	; 659f

; ----------------------------------------------------------------------
; DATOS colores_65A3: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (2 bytes)
;   0x65a3..0x65a5  (2 bytes)
DATA_colores_65A3:
	defb 014h,050h	; 65a3

; ----------------------------------------------------------------------
; DATOS colores_65A5: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0x65a5..0x65a9  (4 bytes)
DATA_colores_65A5:
	defb 012h,045h,067h,0cfh	; 65a5

; ----------------------------------------------------------------------
; DATOS colores_65A9: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (2 bytes)
;   0x65a9..0x65ab  (2 bytes)
DATA_colores_65A9:
	defb 012h,05fh	; 65a9

; ----------------------------------------------------------------------
; DATOS colores_65AB: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0x65ab..0x65af  (4 bytes)
DATA_colores_65AB:
	defb 012h,045h,067h,08fh	; 65ab

; ----------------------------------------------------------------------
; DATOS colores_sueltos_65AF: 8 bytes con forma de colores de dibujo (dos de 4
;   bits por byte) entre dos listas: no los apunta ninguna entrada de las
;   tablas de colores de p32 ni llega a ellos ningun lector del listado
;   0x65af..0x65b7  (8 bytes)
DATA_colores_sueltos_65AF:
	defb 012h,034h,056h,0afh,014h,058h,023h,045h	; 65af  .4V..X#E

; ----------------------------------------------------------------------
; DATOS tabla_colores_65B7: 29 punteros a colores de dibujo (los usa hasta el
;   indice 28; p00:4DA0); lo leen p00:4DA0 (58 bytes)
;   0x65b7..0x65f1  (58 bytes)
DATA_tabla_colores_65B7:
	defw 065f1h,065f3h,065f5h,06622h,065f9h,065fdh,06601h,06603h	; 65b7
	defw 06607h,0660bh,0660fh,06613h,06616h,06618h,0661ch,06620h	; 65c7
	defw 06622h,06626h,0662ah,0662ch,06630h,06632h,06636h,0663ah	; 65d7
	defw 0663ch,06614h,0663eh,06640h,06644h	; 65e7

; ----------------------------------------------------------------------
; DATOS colores_sin_uso_65F1: 2 bytes de colores de dibujo (dos colores de 4
;   bits por byte) a los que apuntan tabla_colores_65B7 (entrada 0): indices
;   que no pide ninguna lista de dibujos
;   0x65f1..0x65f3  (2 bytes)
DATA_colores_sin_uso_65F1:
	defb 014h,067h	; 65f1

; ----------------------------------------------------------------------
; DATOS colores_65F3: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (2 bytes)
;   0x65f3..0x65f5  (2 bytes)
DATA_colores_65F3:
	defb 015h,067h	; 65f3

; ----------------------------------------------------------------------
; DATOS colores_sin_uso_65F5: 18 bytes de colores de dibujo (dos colores de 4
;   bits por byte) a los que apuntan tabla_colores_65B7 (entrada 2),
;   tabla_colores_65B7 (entrada 4), tabla_colores_65B7 (entrada 5): indices
;   que no pide ninguna lista de dibujos
;   0x65f5..0x6607  (18 bytes)
DATA_colores_sin_uso_65F5:
	defb 014h,056h,07ah,0bfh,03ch,0bfh,027h,08ah,045h,06fh,017h,0ach,045h,0bfh,04fh,015h	; 65f5  .Vz.<.'.Eo..E.O.
	defb 026h,07bh	; 6605

; ----------------------------------------------------------------------
; DATOS colores_6607: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (2 bytes)
;   0x6607..0x6609  (2 bytes)
DATA_colores_6607:
	defb 014h,056h	; 6607

; ----------------------------------------------------------------------
; DATOS colores_sueltos_6609: 2 bytes con forma de colores de dibujo (dos de 4
;   bits por byte) entre dos listas: no los apunta ninguna entrada de las
;   tablas de colores de p32 ni llega a ellos ningun lector del listado
;   0x6609..0x660b  (2 bytes)
DATA_colores_sueltos_6609:
	defb 03bh,0cfh	; 6609

; ----------------------------------------------------------------------
; DATOS colores_660B: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (2 bytes)
;   0x660b..0x660d  (2 bytes)
DATA_colores_660B:
	defb 04fh,015h	; 660b

; ----------------------------------------------------------------------
; DATOS colores_sueltos_660D: 2 bytes con forma de colores de dibujo (dos de 4
;   bits por byte) entre dos listas: no los apunta ninguna entrada de las
;   tablas de colores de p32 ni llega a ellos ningun lector del listado
;   0x660d..0x660f  (2 bytes)
DATA_colores_sueltos_660D:
	defb 026h,078h	; 660d

; ----------------------------------------------------------------------
; DATOS colores_660F: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0x660f..0x6613  (4 bytes)
DATA_colores_660F:
	defb 012h,045h,067h,0cfh	; 660f

; ----------------------------------------------------------------------
; DATOS colores_6613: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); se solapan 2 bloques:
;   (colores_6614 6614-6616); lo leen p00:4C26 (3 bytes)
;   0x6613..0x6616  (3 bytes)
DATA_colores_6613:
	defb 047h,08fh	; 6613
	defb 07ah	; 6615

; ----------------------------------------------------------------------
; DATOS colores_6616: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (2 bytes)
;   0x6616..0x6618  (2 bytes)
DATA_colores_6616:
	defb 014h,05fh	; 6616

; ----------------------------------------------------------------------
; DATOS colores_6618: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0x6618..0x661c  (4 bytes)
DATA_colores_6618:
	defb 012h,045h,067h,08fh	; 6618

; ----------------------------------------------------------------------
; DATOS colores_sin_uso_661C: 4 bytes de colores de dibujo (dos colores de 4
;   bits por byte) a los que apuntan tabla_colores_65B7 (entrada 14): indices
;   que no pide ninguna lista de dibujos
;   0x661c..0x6620  (4 bytes)
DATA_colores_sin_uso_661C:
	defb 015h,067h,04fh,0bch	; 661c

; ----------------------------------------------------------------------
; DATOS colores_6620: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (2 bytes)
;   0x6620..0x6622  (2 bytes)
DATA_colores_6620:
	defb 05dh,0efh	; 6620

; ----------------------------------------------------------------------
; DATOS colores_6622: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0x6622..0x6626  (4 bytes)
DATA_colores_6622:
	defb 024h,05bh,0cdh,0efh	; 6622

; ----------------------------------------------------------------------
; DATOS colores_6626: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0x6626..0x662a  (4 bytes)
DATA_colores_6626:
	defb 045h,06fh,078h,0bch	; 6626

; ----------------------------------------------------------------------
; DATOS colores_662A: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (2 bytes)
;   0x662a..0x662c  (2 bytes)
DATA_colores_662A:
	defb 078h,03fh	; 662a

; ----------------------------------------------------------------------
; DATOS colores_662C: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0x662c..0x6630  (4 bytes)
DATA_colores_662C:
	defb 037h,08fh,0bch,045h	; 662c

; ----------------------------------------------------------------------
; DATOS colores_6630: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (2 bytes)
;   0x6630..0x6632  (2 bytes)
DATA_colores_6630:
	defb 078h,0afh	; 6630

; ----------------------------------------------------------------------
; DATOS colores_6632: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0x6632..0x6636  (4 bytes)
DATA_colores_6632:
	defb 045h,067h,012h,03fh	; 6632

; ----------------------------------------------------------------------
; DATOS colores_6636: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0x6636..0x663a  (4 bytes)
DATA_colores_6636:
	defb 0cfh,013h,082h,074h	; 6636

; ----------------------------------------------------------------------
; DATOS colores_sin_uso_663A: 10 bytes de colores de dibujo (dos colores de 4
;   bits por byte) a los que apuntan tabla_colores_65B7 (entrada 23),
;   tabla_colores_65B7 (entrada 24), tabla_colores_65B7 (entrada 26): indices
;   que no pide ninguna lista de dibujos
;   0x663a..0x6644  (10 bytes)
DATA_colores_sin_uso_663A:
	defb 014h,0afh,014h,0adh,014h,050h,01fh,036h,07ah,0bch	; 663a  .....P.6z.

; ----------------------------------------------------------------------
; DATOS colores_6644: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0x6644..0x6648  (4 bytes)
DATA_colores_6644:
	defb 04fh,015h,067h,08ah	; 6644

; ----------------------------------------------------------------------
; DATOS tabla_colores_6648: 48 punteros a colores de dibujo (los usa hasta el
;   indice 47; p00:4DA0); lo leen p00:4DA0 (96 bytes)
;   0x6648..0x66a8  (96 bytes)
DATA_tabla_colores_6648:
	defw 066a9h,066b0h,066b7h,066a8h,066bbh,066bfh,066c4h,066c7h	; 6648
	defw 066cbh,066c6h,066cfh,066d3h,066d7h,066ach,066dbh,066dfh	; 6658
	defw 066e1h,066e5h,066e9h,066eeh,066edh,066f2h,066f4h,066c3h	; 6668
	defw 066f9h,066fbh,066fch,066ffh,066fdh,06703h,06707h,06709h	; 6678
	defw 066f6h,0670bh,066b3h,0670dh,0670fh,06711h,0672bh,06715h	; 6688
	defw 066c6h,06719h,0671bh,0671fh,06721h,06725h,06727h,0672ch	; 6698

; ----------------------------------------------------------------------
; DATOS colores_66A8: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); se solapan 3 bloques:
;   (colores_66A9 66A9-66AD) (colores_66AC 66AC-66B0); lo leen p00:4C26 (8
;   bytes)
;   0x66a8..0x66b0  (8 bytes)
DATA_colores_66A8:
	defb 013h,04fh	; 66a8
	defb 015h,026h	; 66aa
	defb 078h,03fh	; 66ac
	defb 0bch,0deh	; 66ae

; ----------------------------------------------------------------------
; DATOS colores_66B0: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); se solapan 2 bloques:
;   (colores_66B3 66B3-66B7); lo leen p00:4C26, p00:4CA0 (7 bytes)
;   0x66b0..0x66b7  (7 bytes)
DATA_colores_66B0:
	defb 027h,0bch,014h,056h	; 66b0
	defb 00fh,014h,07ch	; 66b4

; ----------------------------------------------------------------------
; DATOS colores_66B7: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0x66b7..0x66bb  (4 bytes)
DATA_colores_66B7:
	defb 013h,045h,02bh,0cfh	; 66b7

; ----------------------------------------------------------------------
; DATOS colores_sin_uso_66BB: 9 bytes de colores de dibujo (dos colores de 4
;   bits por byte) a los que apuntan tabla_colores_6648 (entrada 4),
;   tabla_colores_6648 (entrada 5), tabla_colores_6648 (entrada 23): indices
;   que no pide ninguna lista de dibujos
;   0x66bb..0x66c4  (9 bytes)
DATA_colores_sin_uso_66BB:
	defb 028h,07bh,01ch,04fh,01fh,045h,067h,08ah,012h	; 66bb  ({.O.Eg..

; ----------------------------------------------------------------------
; DATOS colores_66C4: 2 colores de 4 bits, dos por byte, para un dibujo de 1
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (1 bytes)
;   0x66c4..0x66c5  (1 bytes)
DATA_colores_66C4:
	defb 08fh	; 66c4

; ----------------------------------------------------------------------
; DATOS colores_sueltos_66C5: 1 bytes con forma de colores de dibujo (dos de 4
;   bits por byte) entre dos listas: no los apunta ninguna entrada de las
;   tablas de colores de p32 ni llega a ellos ningun lector del listado
;   0x66c5..0x66c6  (1 bytes)
DATA_colores_sueltos_66C5:
	defb 037h	; 66c5

; ----------------------------------------------------------------------
; DATOS colores_66C6: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4CA0 (2 bytes)
;   0x66c6..0x66c8  (2 bytes)
DATA_colores_66C6:
	defb 003h,0cfh	; 66c6

; ----------------------------------------------------------------------
; DATOS colores_sin_uso_66C8: 7 bytes de colores de dibujo (dos colores de 4
;   bits por byte) a los que apuntan tabla_colores_6648 (entrada 8): indices
;   que no pide ninguna lista de dibujos
;   0x66c8..0x66cf  (7 bytes)
DATA_colores_sin_uso_66C8:
	defb 013h,045h,067h,007h,08fh,03bh,0ceh	; 66c8

; ----------------------------------------------------------------------
; DATOS colores_66CF: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (2 bytes)
;   0x66cf..0x66d1  (2 bytes)
DATA_colores_66CF:
	defb 014h,056h	; 66cf

; ----------------------------------------------------------------------
; DATOS colores_sueltos_66D1: 2 bytes con forma de colores de dibujo (dos de 4
;   bits por byte) entre dos listas: no los apunta ninguna entrada de las
;   tablas de colores de p32 ni llega a ellos ningun lector del listado
;   0x66d1..0x66d3  (2 bytes)
DATA_colores_sueltos_66D1:
	defb 078h,09fh	; 66d1

; ----------------------------------------------------------------------
; DATOS colores_66D3: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0x66d3..0x66d7  (4 bytes)
DATA_colores_66D3:
	defb 045h,067h,012h,03fh	; 66d3

; ----------------------------------------------------------------------
; DATOS colores_66D7: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0x66d7..0x66db  (4 bytes)
DATA_colores_66D7:
	defb 012h,045h,06bh,0c8h	; 66d7

; ----------------------------------------------------------------------
; DATOS colores_66DB: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (2 bytes)
;   0x66db..0x66dd  (2 bytes)
DATA_colores_66DB:
	defb 015h,067h	; 66db

; ----------------------------------------------------------------------
; DATOS colores_sueltos_66DD: 2 bytes con forma de colores de dibujo (dos de 4
;   bits por byte) entre dos listas: no los apunta ninguna entrada de las
;   tablas de colores de p32 ni llega a ellos ningun lector del listado
;   0x66dd..0x66df  (2 bytes)
DATA_colores_sueltos_66DD:
	defb 04fh,0bch	; 66dd

; ----------------------------------------------------------------------
; DATOS colores_66DF: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (2 bytes)
;   0x66df..0x66e1  (2 bytes)
DATA_colores_66DF:
	defb 05dh,0efh	; 66df

; ----------------------------------------------------------------------
; DATOS colores_66E1: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0x66e1..0x66e5  (4 bytes)
DATA_colores_66E1:
	defb 024h,05bh,0cdh,0efh	; 66e1

; ----------------------------------------------------------------------
; DATOS colores_66E5: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0x66e5..0x66e9  (4 bytes)
DATA_colores_66E5:
	defb 045h,06fh,078h,0bch	; 66e5

; ----------------------------------------------------------------------
; DATOS colores_66E9: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0x66e9..0x66ed  (4 bytes)
DATA_colores_66E9:
	defb 0cfh,013h,082h,074h	; 66e9

; ----------------------------------------------------------------------
; DATOS colores_sin_uso_66ED: 9 bytes de colores de dibujo (dos colores de 4
;   bits por byte) a los que apuntan tabla_colores_6648 (entrada 19),
;   tabla_colores_6648 (entrada 20), tabla_colores_6648 (entrada 21): indices
;   que no pide ninguna lista de dibujos
;   0x66ed..0x66f6  (9 bytes)
DATA_colores_sin_uso_66ED:
	defb 016h,045h,0cfh,067h,0abh,01fh,046h,012h,04fh	; 66ed  .E.g..F.O

; ----------------------------------------------------------------------
; DATOS colores_66F6: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0x66f6..0x66fa  (4 bytes)
DATA_colores_66F6:
	defb 037h,08fh,0bch,045h	; 66f6

; ----------------------------------------------------------------------
; DATOS colores_sin_uso_66FA: 13 bytes de colores de dibujo (dos colores de 4
;   bits por byte) a los que apuntan tabla_colores_6648 (entrada 25),
;   tabla_colores_6648 (entrada 26), tabla_colores_6648 (entrada 27): indices
;   que no pide ninguna lista de dibujos
;   0x66fa..0x6707  (13 bytes)
DATA_colores_sin_uso_66FA:
	defb 061h,015h,04fh,056h,07fh,03fh,078h,045h,061h,014h,067h,058h,0afh	; 66fa  a.OV.?xEa.gX.

; ----------------------------------------------------------------------
; DATOS colores_6707: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (2 bytes)
;   0x6707..0x6709  (2 bytes)
DATA_colores_6707:
	defb 014h,0afh	; 6707

; ----------------------------------------------------------------------
; DATOS colores_6709: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (2 bytes)
;   0x6709..0x670b  (2 bytes)
DATA_colores_6709:
	defb 078h,0afh	; 6709

; ----------------------------------------------------------------------
; DATOS colores_670B: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (2 bytes)
;   0x670b..0x670d  (2 bytes)
DATA_colores_670B:
	defb 014h,0adh	; 670b

; ----------------------------------------------------------------------
; DATOS colores_670D: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4CA0 (2 bytes)
;   0x670d..0x670f  (2 bytes)
DATA_colores_670D:
	defb 010h,05fh	; 670d

; ----------------------------------------------------------------------
; DATOS colores_670F: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4CA0 (2 bytes)
;   0x670f..0x6711  (2 bytes)
DATA_colores_670F:
	defb 014h,05fh	; 670f

; ----------------------------------------------------------------------
; DATOS colores_6711: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4CA0 (4 bytes)
;   0x6711..0x6715  (4 bytes)
DATA_colores_6711:
	defb 010h,056h,047h,08fh	; 6711

; ----------------------------------------------------------------------
; DATOS colores_6715: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4CA0 (4 bytes)
;   0x6715..0x6719  (4 bytes)
DATA_colores_6715:
	defb 010h,045h,067h,0afh	; 6715

; ----------------------------------------------------------------------
; DATOS colores_6719: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4CA0 (2 bytes)
;   0x6719..0x671b  (2 bytes)
DATA_colores_6719:
	defb 010h,03ah	; 6719

; ----------------------------------------------------------------------
; DATOS colores_671B: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4CA0 (4 bytes)
;   0x671b..0x671f  (4 bytes)
DATA_colores_671B:
	defb 015h,067h,008h,0afh	; 671b

; ----------------------------------------------------------------------
; DATOS colores_671F: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4CA0 (2 bytes)
;   0x671f..0x6721  (2 bytes)
DATA_colores_671F:
	defb 015h,06ch	; 671f

; ----------------------------------------------------------------------
; DATOS colores_6721: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4CA0 (4 bytes)
;   0x6721..0x6725  (4 bytes)
DATA_colores_6721:
	defb 010h,03fh,045h,06ch	; 6721

; ----------------------------------------------------------------------
; DATOS colores_6725: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4CA0 (2 bytes)
;   0x6725..0x6727  (2 bytes)
DATA_colores_6725:
	defb 004h,05fh	; 6725

; ----------------------------------------------------------------------
; DATOS colores_6727: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4CA0 (4 bytes)
;   0x6727..0x672b  (4 bytes)
DATA_colores_6727:
	defb 013h,04fh,057h,08ch	; 6727

; ----------------------------------------------------------------------
; DATOS colores_672B: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); se solapan 2 bloques:
;   (colores_672C 672C-6730); lo leen p00:4CA0, p00:4C26 (5 bytes)
;   0x672b..0x6730  (5 bytes)
DATA_colores_672B:
	defb 010h,04fh	; 672b
	defb 015h,067h	; 672d
	defb 08ah	; 672f

; ----------------------------------------------------------------------
; DATOS lista_6730: 3 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x62D1); lo leen p00:4C26 (16 bytes)
;   0x6730..0x6740  (16 bytes)
DATA_lista_6730:
	defb 001h,020h,0dch,05dh,06bh	; 6730
	defb 001h,03bh,0ddh,065h,06bh	; 6735
	defb 042h,020h,0deh,06dh,06bh	; 673a
	defb 0ffh	; 673f

; ----------------------------------------------------------------------
; DATOS lista_6740: 3 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x65B7); lo leen p00:4C26 (16 bytes)
;   0x6740..0x6750  (16 bytes)
DATA_lista_6740:
	defb 001h,012h,0a0h,05dh,06bh	; 6740
	defb 001h,019h,0a1h,065h,06bh	; 6745
	defb 042h,012h,0a2h,06dh,06bh	; 674a
	defb 0ffh	; 674f

; ----------------------------------------------------------------------
; DATOS lista_6750: 4 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x65B7); lo leen p00:4C26 (21 bytes)
;   0x6750..0x6765  (21 bytes)
DATA_lista_6750:
	defb 001h,012h,0f0h,05dh,06bh	; 6750
	defb 001h,019h,0f1h,065h,06bh	; 6755
	defb 042h,012h,0f2h,06dh,06bh	; 675a
	defb 044h,019h,0f5h,08dh,06bh	; 675f
	defb 0ffh	; 6764

; ----------------------------------------------------------------------
; DATOS lista_6765: 3 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x6648); lo leen p00:4C26 (16 bytes)
;   0x6765..0x6775  (16 bytes)
DATA_lista_6765:
	defb 001h,00dh,0a0h,05dh,06bh	; 6765
	defb 001h,006h,0a1h,065h,06bh	; 676a
	defb 042h,00dh,0a2h,06dh,06bh	; 676f
	defb 0ffh	; 6774

; ----------------------------------------------------------------------
; DATOS tabla_colores_6775: 8 punteros a colores de dibujo (los usa hasta el
;   indice 7; p00:4DA0); lo leen p00:4DA0 (16 bytes)
;   0x6775..0x6785  (16 bytes)
DATA_tabla_colores_6775:
	defw 06785h,06789h,0678ch,06790h,06794h,0678ah,06786h,06796h	; 6775

; ----------------------------------------------------------------------
; DATOS colores_6785: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0x6785..0x6789  (4 bytes)
DATA_colores_6785:
	defb 045h,01fh,07ah,0cdh	; 6785

; ----------------------------------------------------------------------
; DATOS colores_6789: 2 colores de 4 bits, dos por byte, para un dibujo de 1
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (1 bytes)
;   0x6789..0x678a  (1 bytes)
DATA_colores_6789:
	defb 056h	; 6789

; ----------------------------------------------------------------------
; DATOS colores_678A: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (2 bytes)
;   0x678a..0x678c  (2 bytes)
DATA_colores_678A:
	defb 08fh,07ah	; 678a

; ----------------------------------------------------------------------
; DATOS colores_678C: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0x678c..0x6790  (4 bytes)
DATA_colores_678C:
	defb 047h,056h,018h,0afh	; 678c

; ----------------------------------------------------------------------
; DATOS colores_6790: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0x6790..0x6794  (4 bytes)
DATA_colores_6790:
	defb 078h,03fh,0abh,0cdh	; 6790

; ----------------------------------------------------------------------
; DATOS colores_6794: 4 colores de 4 bits, dos por byte, para un dibujo de 2
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (2 bytes)
;   0x6794..0x6796  (2 bytes)
DATA_colores_6794:
	defb 014h,056h	; 6794

; ----------------------------------------------------------------------
; DATOS colores_6796: 8 colores de 4 bits, dos por byte, para un dibujo de 3
;   bits por punto (p00:4DB3 los pasa a 0xE800); lo leen p00:4C26 (4 bytes)
;   0x6796..0x679a  (4 bytes)
DATA_colores_6796:
	defb 045h,06fh,017h,08ah	; 6796

; ----------------------------------------------------------------------
; DATOS lista_679A: 18 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x6775); lo leen p00:4C26 (91 bytes)
;   0x679a..0x67f5  (91 bytes)
DATA_lista_679A:
	defb 048h,000h,081h,0f5h,067h	; 679a
	defb 004h,000h,090h,075h,068h	; 679f
	defb 001h,001h,094h,095h,068h	; 67a4
	defb 006h,002h,095h,09dh,068h	; 67a9
	defb 048h,007h,0a0h,0cdh,068h	; 67ae
	defb 041h,003h,0a8h,04dh,069h	; 67b3
	defb 054h,000h,0b0h,05dh,069h	; 67b8
	defb 04ch,004h,0c4h,09dh,06ah	; 67bd
	defb 001h,003h,0d0h,05dh,06bh	; 67c2
	defb 001h,005h,0d1h,065h,06bh	; 67c7
	defb 042h,003h,0d2h,06dh,06bh	; 67cc
	defb 044h,005h,0d5h,08dh,06bh	; 67d1
	defb 084h,000h,0d9h,0cdh,06bh	; 67d6
	defb 089h,002h,0e0h,02dh,06ch	; 67db
	defb 045h,003h,0efh,005h,06dh	; 67e0
	defb 087h,003h,0f4h,055h,06dh	; 67e5
	defb 083h,007h,0a9h,0fdh,06dh	; 67ea
	defb 001h,005h,0eeh,045h,06eh	; 67ef
	defb 0ffh	; 67f4

; ----------------------------------------------------------------------
; DATOS dibujo_67F5: 8 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 0 de la lista 0x679A (p00:4D92, p00:4DF5); lo leen p00:4C26
;   (128 bytes)
;   0x67f5..0x6875  (128 bytes)
DATA_dibujo_67F5:
	defb 022h,000h,066h,022h,0cch,044h,044h,000h,022h,000h,066h,022h,0cch,044h,000h,000h	; 67f5  ".f".DD.".f".D..
	defb 062h,080h,066h,0a2h,04ch,084h,044h,080h,062h,080h,066h,0a2h,04ch,084h,040h,080h	; 6805  b.f.L.D.b.f.L.@.
	defb 000h,0ffh,0ffh,000h,0cch,044h,044h,000h,022h,000h,066h,022h,0cch,044h,000h,000h	; 6815  .....DD.".f".D..
	defb 000h,0ddh,022h,0bbh,044h,077h,000h,0bbh,000h,0ddh,022h,0bbh,044h,077h,000h,0ffh	; 6825  ..".Dw....".Dw..
	defb 080h,09dh,0a2h,0bbh,084h,0b7h,080h,0bbh,080h,09dh,0a2h,0bbh,084h,0b7h,080h,0bfh	; 6835  ................
	defb 0ffh,0ffh,000h,000h,044h,077h,000h,0bbh,000h,0ddh,022h,0bbh,044h,077h,000h,0ffh	; 6845  ....Dw....".Dw..
	defb 000h,0ddh,022h,03bh,0c4h,077h,040h,01bh,020h,00dh,066h,023h,0cch,047h,000h,001h	; 6855  .."..w@. .f#.G..
	defb 022h,080h,066h,0a2h,04ch,064h,004h,0b0h,002h,0d8h,022h,0bah,044h,076h,000h,0ffh	; 6865  ".f.Ld....".Dv..

; ----------------------------------------------------------------------
; DATOS dibujo_6875: 4 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 1 de la lista 0x679A (p00:4D92, p00:4DF5); lo leen p00:4C26 (32
;   bytes)
;   0x6875..0x6895  (32 bytes)
DATA_dibujo_6875:
	defb 000h,000h,000h,000h,000h,000h,000h,000h	; 6875  ........
	defb 0ffh,0ffh,0ffh,0ffh,0feh,0feh,0feh,0feh	; 687d  ........
	defb 0fch,0fch,0fch,0fch,0f8h,0f8h,0f8h,0f8h	; 6885  ........
	defb 0f0h,0f0h,0f0h,0f0h,0e0h,0e0h,0e0h,0e0h	; 688d  ........

; ----------------------------------------------------------------------
; DATOS dibujo_6895: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 2 de la lista 0x679A (p00:4D92, p00:4DF5); lo leen p00:4C26 (8
;   bytes)
;   0x6895..0x689d  (8 bytes)
DATA_dibujo_6895:
	defb 001h,001h,001h,001h,001h,001h,001h,001h	; 6895  ........

; ----------------------------------------------------------------------
; DATOS dibujo_689D: 6 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 3 de la lista 0x679A (p00:4D92, p00:4DF5); lo leen p00:4C26 (48
;   bytes)
;   0x689d..0x68cd  (48 bytes)
DATA_dibujo_689D:
	defb 000h,0eeh,060h,060h,06ch,060h,060h,0f0h	; 689d  ..``l``.
	defb 000h,0ech,046h,046h,06ch,046h,046h,0ech	; 68a5  ..FFlFF.
	defb 000h,00ch,02ch,00ch,00ch,00ch,00ch,02eh	; 68ad  ..,.....
	defb 000h,02ch,066h,006h,00ch,020h,060h,06eh	; 68b5  .,f.. `n
	defb 000h,02ch,066h,006h,00ch,006h,066h,02ch	; 68bd  .,f...f,
	defb 000h,00ch,00ch,02ch,06ch,06ch,06eh,00ch	; 68c5  ...,lln.

; ----------------------------------------------------------------------
; DATOS dibujo_68CD: 8 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 4 de la lista 0x679A (p00:4D92, p00:4DF5); lo leen p00:4C26
;   (128 bytes)
;   0x68cd..0x694d  (128 bytes)
DATA_dibujo_68CD:
	defb 000h,0ffh,080h,000h,080h,000h,09fh,01fh,090h,010h,097h,017h,097h,017h,097h,017h	; 68cd  ................
	defb 000h,0ffh,000h,000h,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 68dd  ................
	defb 000h,0ffh,001h,000h,001h,000h,0f9h,0f8h,009h,008h,0e9h,0e8h,0e9h,0e8h,0e9h,0e8h	; 68ed  ................
	defb 097h,017h,097h,017h,097h,017h,090h,010h,09fh,01fh,080h,000h,080h,000h,0ffh,000h	; 68fd  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,000h,000h,0ffh,000h	; 690d  ................
	defb 0e9h,0e8h,0e9h,0e8h,0e9h,0e8h,009h,008h,0f9h,0f8h,001h,000h,001h,000h,0ffh,000h	; 691d  ................
	defb 097h,017h,097h,017h,097h,017h,097h,017h,097h,017h,097h,017h,097h,017h,097h,017h	; 692d  ................
	defb 0e9h,0e8h,0e9h,0e8h,0e9h,0e8h,0e9h,0e8h,0e9h,0e8h,0e9h,0e8h,0e9h,0e8h,0e9h,0e8h	; 693d  ................

; ----------------------------------------------------------------------
; DATOS dibujo_694D: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 5 de la lista 0x679A (p00:4D92, p00:4DF5); lo leen p00:4C26
;   (16 bytes)
;   0x694d..0x695d  (16 bytes)
DATA_dibujo_694D:
	defb 0ffh,0ffh,0ffh,000h,000h,000h,000h,000h,0ffh,000h,0ffh,0ffh,0ffh,000h,0ffh,0ffh	; 694d  ................

; ----------------------------------------------------------------------
; DATOS dibujo_695D: 20 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 6 de la lista 0x679A (p00:4D92, p00:4DF5); lo leen p00:4C26
;   (320 bytes)
;   0x695d..0x6a9d  (320 bytes)
DATA_dibujo_695D:
	defb 060h,040h,060h,040h,060h,040h,060h,040h,030h,060h,030h,060h,030h,060h,030h,060h	; 695d  `@`@`@`@0`0`0`0`
	defb 018h,070h,018h,070h,018h,070h,018h,070h,00ch,078h,00ch,078h,00ch,078h,00ch,078h	; 696d  .p.p.p.p.x.x.x.x
	defb 006h,07ch,006h,07ch,006h,07ch,006h,07ch,003h,07eh,003h,07eh,002h,07fh,003h,07fh	; 697d  .|.|.|.|.~.~....
	defb 001h,0ffh,001h,0ffh,001h,0ffh,001h,0ffh,001h,07fh,001h,07fh,001h,07fh,001h,07fh	; 698d  ................
	defb 001h,03fh,001h,03fh,001h,03fh,001h,03fh,001h,01fh,001h,01fh,001h,01fh,001h,01fh	; 699d  .?.?.?.?........
	defb 001h,00fh,001h,00fh,001h,00fh,001h,00fh,001h,007h,001h,007h,001h,007h,001h,007h	; 69ad  ................
	defb 001h,001h,0fdh,003h,001h,003h,001h,003h,001h,01bh,009h,013h,001h,003h,001h,003h	; 69bd  ................
	defb 001h,003h,001h,003h,001h,003h,001h,003h,001h,003h,001h,003h,001h,003h,001h,003h	; 69cd  ................
	defb 040h,080h,040h,080h,040h,080h,040h,080h,040h,080h,040h,080h,040h,080h,040h,080h	; 69dd  @.@.@.@.@.@.@.@.
	defb 000h,000h,000h,000h,000h,018h,008h,010h,000h,000h,000h,000h,000h,0ffh,0ffh,0ffh	; 69ed  ................
	defb 040h,080h,040h,080h,040h,098h,048h,090h,040h,080h,040h,080h,000h,0ffh,0ffh,0ffh	; 69fd  @.@.@.H.@.@.....
	defb 001h,003h,001h,003h,001h,01bh,009h,013h,001h,001h,001h,001h,001h,0ffh,0ffh,0ffh	; 6a0d  ................
	defb 001h,003h,001h,003h,001h,01bh,009h,013h,001h,003h,001h,003h,001h,0ffh,0ffh,0ffh	; 6a1d  ................
	defb 0c0h,000h,0c0h,000h,0c0h,018h,0c8h,010h,080h,000h,080h,000h,000h,0ffh,0ffh,0ffh	; 6a2d  ................
	defb 001h,07fh,001h,07fh,001h,07fh,001h,07fh,001h,07fh,001h,07fh,001h,07fh,001h,07fh	; 6a3d  ................
	defb 001h,07fh,001h,07fh,001h,07fh,001h,07fh,081h,0bfh,081h,0bfh,081h,0bfh,081h,0bfh	; 6a4d  ................
	defb 041h,05fh,041h,05fh,041h,05fh,041h,05fh,021h,06fh,021h,06fh,021h,06fh,021h,06fh	; 6a5d  A_A_A_A_!o!o!o!o
	defb 011h,077h,011h,077h,011h,077h,011h,073h,009h,07bh,009h,07bh,009h,07bh,009h,07bh	; 6a6d  .w.w.w.s.{.{.{.{
	defb 005h,07dh,005h,07dh,005h,07dh,005h,07dh,002h,07eh,002h,07eh,002h,07eh,002h,07eh	; 6a7d  .}.}.}.}.~.~.~.~
	defb 062h,040h,026h,022h,01ch,054h,00ch,068h,006h,074h,002h,07ah,001h,07dh,001h,07fh	; 6a8d  b@&".T.h.t.z.}..

; ----------------------------------------------------------------------
; DATOS dibujo_6A9D: 12 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 7 de la lista 0x679A (p00:4D92, p00:4DF5); lo leen p00:4C26
;   (192 bytes)
;   0x6a9d..0x6b5d  (192 bytes)
DATA_dibujo_6A9D:
	defb 0ffh,0ffh,000h,0ffh,07fh,080h,07fh,080h,0a7h,040h,0a7h,048h,0bfh,040h,0bfh,040h	; 6a9d  .........@.H.@.@
	defb 0ffh,0ffh,000h,0ffh,0ffh,000h,0ffh,000h,0e7h,000h,0e7h,008h,0ffh,000h,0ffh,000h	; 6aad  ................
	defb 0ffh,0ffh,001h,0ffh,0ffh,001h,0ffh,001h,0e5h,001h,0e5h,009h,0fdh,001h,0fdh,001h	; 6abd  ................
	defb 0f9h,003h,0f9h,003h,0f9h,003h,0f9h,003h,0f1h,007h,0f1h,007h,0f1h,007h,0f1h,007h	; 6acd  ................
	defb 0e1h,00fh,0e1h,00fh,0e1h,00fh,0e1h,00fh,0c1h,01fh,0c1h,01fh,0c1h,01fh,0c1h,01fh	; 6add  ................
	defb 081h,03fh,081h,03fh,081h,03fh,081h,03fh,001h,07fh,001h,07fh,001h,07fh,001h,07fh	; 6aed  .?.?.?.?........
	defb 07fh,07fh,000h,07fh,03fh,040h,03fh,040h,027h,040h,027h,048h,03fh,040h,03fh,040h	; 6afd  ....?@?@'@'H?@?@
	defb 002h,0ffh,002h,0ffh,002h,0ffh,002h,0ffh,007h,0fdh,007h,0fdh,007h,0fdh,007h,0fdh	; 6b0d  ................
	defb 00dh,0fbh,00dh,0fbh,00dh,0fbh,00dh,0fbh,019h,0f7h,019h,0f7h,019h,0f7h,019h,0f7h	; 6b1d  ................
	defb 031h,0efh,031h,0efh,031h,0efh,031h,0efh,061h,0dfh,061h,0dfh,061h,0dfh,061h,0dfh	; 6b2d  1.1.1.1.a.a.a.a.
	defb 0c1h,0bfh,0c1h,0bfh,0c1h,0bfh,0c1h,0bfh,081h,07fh,081h,07fh,081h,07fh,081h,07fh	; 6b3d  ................
	defb 0ddh,021h,09bh,043h,035h,087h,0a9h,04fh,0d1h,01fh,0a1h,03fh,041h,07fh,081h,0ffh	; 6b4d  .!.C5..O...?A...

; ----------------------------------------------------------------------
; DATOS dibujo_6B5D: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 8 de la lista 0x679A (p00:4D92, p00:4DF5); lo leen p00:4C26 (8
;   bytes)
;   0x6b5d..0x6b65  (8 bytes)
DATA_dibujo_6B5D:
	defb 0bfh,0bfh,0bfh,0bfh,0bfh,0bfh,0bfh,0bfh	; 6b5d  ........

; ----------------------------------------------------------------------
; DATOS dibujo_6B65: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 9 de la lista 0x679A (p00:4D92, p00:4DF5); lo leen p00:4C26 (8
;   bytes)
;   0x6b65..0x6b6d  (8 bytes)
DATA_dibujo_6B65:
	defb 001h,001h,001h,001h,001h,001h,001h,001h	; 6b65  ........

; ----------------------------------------------------------------------
; DATOS dibujo_6B6D: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 10 de la lista 0x679A (p00:4D92, p00:4DF5); lo leen p00:4C26
;   (32 bytes)
;   0x6b6d..0x6b8d  (32 bytes)
DATA_dibujo_6B6D:
	defb 0ffh,001h,0ffh,001h,0ffh,0ffh,001h,0ffh,0ffh,0ffh,0ffh,001h,0ffh,0ffh,0ffh,0ffh	; 6b6d  ................
	defb 0bfh,000h,0bfh,000h,0ffh,0bfh,040h,0bfh,0ffh,0bfh,0bfh,000h,0ffh,0ffh,0ffh,0ffh	; 6b7d  ......@.........

; ----------------------------------------------------------------------
; DATOS dibujo_6B8D: 4 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 11 de la lista 0x679A (p00:4D92, p00:4DF5); lo leen p00:4C26
;   (64 bytes)
;   0x6b8d..0x6bcd  (64 bytes)
DATA_dibujo_6B8D:
	defb 001h,000h,07fh,07fh,052h,07fh,064h,07fh,049h,07fh,052h,07fh,06fh,070h,048h,070h	; 6b8d  ....R.d.I.R.opHp
	defb 000h,040h,0fch,0fch,04ch,0fch,096h,0fch,026h,0fch,04eh,0fch,0f6h,01ch,006h,01ch	; 6b9d  .@..L...&.N.....
	defb 058h,077h,068h,070h,049h,07fh,052h,07fh,064h,07fh,07fh,07fh,03fh,000h,001h,000h	; 6bad  XwhpI.R.d...?...
	defb 00eh,0dch,016h,01ch,026h,0fch,04eh,0fch,096h,0fch,0feh,0fch,0feh,000h,000h,040h	; 6bbd  ....&.N........@

; ----------------------------------------------------------------------
; DATOS dibujo_6BCD: 4 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 12 de la lista 0x679A (p00:4D92, p00:4DF5); lo leen p00:4C26
;   (96 bytes)
;   0x6bcd..0x6c2d  (96 bytes)
DATA_dibujo_6BCD:
	defb 0f9h,0dbh,020h,0f9h,08bh,070h,0f9h,0fbh,000h,001h,003h,000h,0f9h,0fbh,000h,0f9h,08bh,070h,0f9h,0dbh,020h,001h,0fbh,000h	; 6bcd  .. ..p...........p.. ...
	defb 07eh,0b6h,008h,07eh,0a2h,01ch,07eh,0beh,000h,040h,080h,000h,07eh,0beh,000h,07eh,0a2h,01ch,07eh,0b6h,008h,040h,0beh,000h	; 6be5  ~..~..~..@..~..~..~..@..
	defb 0f9h,0dbh,0f8h,0f9h,08bh,0f8h,0f9h,0fbh,0f8h,001h,003h,000h,0f9h,0fbh,0f8h,0f9h,08bh,0f8h,0f9h,0dbh,0f8h,001h,0fbh,000h	; 6bfd  ........................
	defb 07eh,0b6h,03eh,07eh,0a2h,03eh,07eh,0beh,03eh,040h,080h,000h,07eh,0beh,03eh,07eh,0a2h,03eh,07eh,0b6h,03eh,040h,0beh,000h	; 6c15  ~.>~.>~.>@..~.>~.>~.>@..

; ----------------------------------------------------------------------
; DATOS dibujo_6C2D: 9 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 13 de la lista 0x679A (p00:4D92, p00:4DF5); lo leen p00:4C26
;   (216 bytes)
;   0x6c2d..0x6d05  (216 bytes)
DATA_dibujo_6C2D:
	defb 0ffh,0ffh,0ffh,000h,000h,000h,000h,000h,000h,000h,0ffh,000h,0ffh,000h,000h,0ffh,07fh,00eh,08eh,0ffh,00eh,000h,080h,000h	; 6c2d  ........................
	defb 0ffh,0ffh,0ffh,000h,000h,000h,000h,000h,000h,000h,0ffh,000h,0ffh,000h,000h,0ffh,0ffh,0eeh,0eeh,0ffh,0eeh,000h,000h,000h	; 6c45  ........................
	defb 0ffh,0ffh,0ffh,000h,000h,000h,000h,000h,000h,000h,0ffh,000h,0feh,000h,001h,0feh,0feh,0e1h,0e0h,0feh,0e1h,000h,000h,001h	; 6c5d  ........................
	defb 0ffh,0ffh,0ffh,000h,000h,000h,000h,000h,000h,000h,0ffh,000h,0ffh,000h,000h,0fbh,07fh,00eh,08ah,0ffh,00eh,000h,080h,000h	; 6c75  ........................
	defb 0ffh,0ffh,0ffh,000h,000h,000h,000h,000h,000h,000h,0ffh,000h,0ffh,000h,000h,0bfh,0ffh,0eeh,0aeh,0ffh,0eeh,000h,000h,000h	; 6c8d  ........................
	defb 0ffh,0ffh,0ffh,000h,000h,000h,000h,000h,000h,000h,0ffh,000h,0ffh,000h,000h,0fbh,0ffh,0eeh,0eah,0ffh,0eeh,000h,000h,000h	; 6ca5  ........................
	defb 0ffh,0ffh,0ffh,000h,000h,000h,000h,000h,000h,000h,0ffh,000h,0ffh,000h,000h,0bfh,0ffh,0eeh,0aeh,0ffh,0eeh,000h,000h,000h	; 6cbd  ........................
	defb 0ffh,0ffh,0ffh,000h,000h,000h,000h,000h,000h,000h,0ffh,000h,0ffh,000h,000h,0fbh,0ffh,0eeh,0eah,0ffh,0eeh,000h,000h,000h	; 6cd5  ........................
	defb 000h,000h,0ffh,000h,000h,000h,000h,000h,000h,000h,0ffh,000h,0feh,000h,001h,0beh,0feh,0e1h,0a0h,0feh,0e1h,000h,000h,001h	; 6ced  ........................

; ----------------------------------------------------------------------
; DATOS dibujo_6D05: 5 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 14 de la lista 0x679A (p00:4D92, p00:4DF5); lo leen p00:4C26
;   (80 bytes)
;   0x6d05..0x6d55  (80 bytes)
DATA_dibujo_6D05:
	defb 0ffh,0bfh,0ffh,0bfh,0ffh,0bfh,0ffh,0bfh,0ffh,0bfh,0ffh,0bfh,0ffh,0bfh,0bfh,000h	; 6d05  ................
	defb 0ffh,0ffh,0ffh,000h,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 6d15  ................
	defb 0bfh,076h,0ffh,000h,0bfh,076h,0ffh,000h,0bfh,076h,0ffh,000h,0bfh,076h,0ffh,000h	; 6d25  .v...v...v...v..
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,000h,0ffh,0ffh,0ffh	; 6d35  ................
	defb 0bfh,001h,0ffh,07fh,0efh,004h,0efh,004h,0efh,004h,0ffh,01ch,0ffh,000h,0ffh,000h	; 6d45  ................

; ----------------------------------------------------------------------
; DATOS dibujo_6D55: 7 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 15 de la lista 0x679A (p00:4D92, p00:4DF5); lo leen p00:4C26
;   (168 bytes)
;   0x6d55..0x6dfd  (168 bytes)
DATA_dibujo_6D55:
	defb 08fh,07fh,0e0h,08dh,078h,0e0h,0ach,078h,0c0h,0edh,078h,080h,0edh,078h,000h,0edh,078h,000h,0cdh,078h,020h,08dh,078h,060h	; 6d55  ....x..x..x..x..x..x .x`
	defb 08dh,078h,0e0h,08dh,078h,0e0h,0adh,078h,0c0h,0edh,078h,080h,0edh,078h,000h,0edh,078h,000h,0cdh,078h,020h,08dh,078h,060h	; 6d6d  .x..x..x..x..x..x..x .x`
	defb 08dh,078h,0e0h,08dh,078h,0e0h,0adh,078h,0c0h,0edh,078h,080h,0edh,078h,000h,0edh,078h,000h,0e8h,07fh,000h,0ffh,0ffh,000h	; 6d85  .x..x..x..x..x..x.......
	defb 0f9h,0f7h,00eh,0d9h,037h,00eh,01bh,037h,00ch,0dfh,037h,008h,0dfh,037h,000h,01fh,017h,000h,07dh,017h,002h,0f9h,0f7h,006h	; 6d9d  ....7..7..7..7....}.....
	defb 0d9h,037h,00eh,0d9h,037h,00eh,0dbh,037h,00ch,0dfh,037h,008h,0dfh,037h,000h,0dfh,037h,000h,0ddh,037h,002h,0d9h,037h,006h	; 6db5  .7..7..7..7..7..7..7..7.
	defb 0d9h,037h,00eh,0d9h,037h,00eh,01bh,017h,00ch,07fh,017h,008h,0ffh,0f7h,000h,0dfh,037h,000h,01fh,0f7h,000h,0ffh,0ffh,000h	; 6dcd  .7..7...........7.......
	defb 081h,001h,000h,0bfh,001h,000h,083h,001h,03ch,083h,03dh,000h,0bfh,001h,000h,0bfh,03dh,000h,0bfh,001h,000h,0bfh,03dh,000h	; 6de5  ........<.=.....=.....=.

; ----------------------------------------------------------------------
; DATOS dibujo_6DFD: 3 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 16 de la lista 0x679A (p00:4D92, p00:4DF5); lo leen p00:4C26
;   (72 bytes)
;   0x6dfd..0x6e45  (72 bytes)
DATA_dibujo_6DFD:
	defb 007h,0f7h,008h,010h,007h,00fh,013h,004h,00fh,0d3h,0c4h,00fh,050h,047h,00fh,053h,047h,00ch,050h,047h,00fh,057h,047h,008h	; 6dfd  ............PG.SG.PG.WG.
	defb 0e0h,0efh,010h,008h,0e0h,0f0h,0c8h,020h,0f0h,0cbh,023h,0f0h,00ah,0e2h,0f0h,0cah,0e2h,030h,00ah,0e2h,0f0h,0eah,0e2h,015h	; 6e15  ....... ..#......0......
	defb 001h,0fdh,000h,0fdh,001h,002h,001h,001h,002h,001h,001h,002h,001h,001h,01ah,009h,001h,012h,001h,001h,002h,001h,001h,002h	; 6e2d  ........................

; ----------------------------------------------------------------------
; DATOS dibujo_6E45: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 17 de la lista 0x679A (p00:4D92, p00:4DF5); lo leen p00:4C26 (8
;   bytes)
;   0x6e45..0x6e4d  (8 bytes)
DATA_dibujo_6E45:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,001h	; 6e45  ........

; ----------------------------------------------------------------------
; DATOS zonas_piezas: 20 punteros, uno por zona (0xCA4A): las piezas de la
;   zona (p00:4C15); lo leen p00:4C18 (40 bytes)
;   0x6e4d..0x6e75  (40 bytes)
DATA_zonas_piezas:
	defw 06e75h,06e76h,06e89h,06e82h,06e96h,06eafh,06e82h,06eceh	; 6e4d
	defw 06e88h,06e88h,06ee7h,06f24h,06f24h,06f24h,06f24h,06f24h	; 6e5d
	defw 06f24h,06e88h,06f5bh,06f74h	; 6e6d  -> DATA_piezas_zona_11 0x6e88 DATA_piezas_zona_18 DATA_piezas_zona_19

; ----------------------------------------------------------------------
; DATOS piezas_zona_0: 0 fichas de 6 bytes [bancos][colores lo hi][lista lo
;   hi][sitio] y un 0xFF: las piezas de la zona 0 (p00:4C0F; los bancos con
;   p00:4C6B); lo leen p00:4C1B (1 bytes)
;   0x6e75..0x6e76  (1 bytes)
DATA_piezas_zona_0:
	defb 0ffh	; 6e75

; ----------------------------------------------------------------------
; DATOS piezas_zona_1: 3 fichas de 6 bytes [bancos][colores lo hi][lista lo
;   hi][sitio] y un 0xFF: las piezas de la zona 1 (p00:4C0F; los bancos con
;   p00:4C6B); se solapan 6 bloques: (piezas_zona_3 6E82-6E89) (piezas_zona_6
;   6E82-6E89) (piezas_zona_8 6E88-6E89) (piezas_zona_9 6E88-6E89)
;   (piezas_zona_17 6E88-6E89); lo leen p00:4C1B (19 bytes)
;   0x6e76..0x6e89  (19 bytes)
DATA_piezas_zona_1:
	defb 000h,09ah,061h,06fh,071h,001h	; 6e76
	defb 004h,028h,0bdh,02eh,0bdh,003h	; 6e7c
	defb 000h,075h,067h,09ah,067h,003h	; 6e82
	defb 0ffh	; 6e88

; ----------------------------------------------------------------------
; DATOS piezas_zona_2: 2 fichas de 6 bytes [bancos][colores lo hi][lista lo
;   hi][sitio] y un 0xFF: las piezas de la zona 2 (p00:4C0F; los bancos con
;   p00:4C6B); lo leen p00:4C1B (13 bytes)
;   0x6e89..0x6e96  (13 bytes)
DATA_piezas_zona_2:
	defb 004h,033h,064h,000h,080h,003h	; 6e89
	defb 000h,075h,067h,09ah,067h,003h	; 6e8f
	defb 0ffh	; 6e95

; ----------------------------------------------------------------------
; DATOS piezas_zona_4: 4 fichas de 6 bytes [bancos][colores lo hi][lista lo
;   hi][sitio] y un 0xFF: las piezas de la zona 4 (p00:4C0F; los bancos con
;   p00:4C6B); lo leen p00:4C1B (25 bytes)
;   0x6e96..0x6eaf  (25 bytes)
DATA_piezas_zona_4:
	defb 004h,028h,0bdh,02eh,0bdh,001h	; 6e96
	defb 003h,0d1h,062h,024h,091h,002h	; 6e9c
	defb 000h,075h,067h,09ah,067h,003h	; 6ea2
	defb 002h,026h,0beh,032h,0beh,003h	; 6ea8
	defb 0ffh	; 6eae

; ----------------------------------------------------------------------
; DATOS piezas_zona_5: 5 fichas de 6 bytes [bancos][colores lo hi][lista lo
;   hi][sitio] y un 0xFF: las piezas de la zona 5 (p00:4C0F; los bancos con
;   p00:4C6B); lo leen p00:4C1B (31 bytes)
;   0x6eaf..0x6ece  (31 bytes)
DATA_piezas_zona_5:
	defb 005h,000h,080h,014h,080h,000h	; 6eaf
	defb 005h,000h,080h,03dh,080h,000h	; 6eb5
	defb 002h,033h,064h,08ch,082h,001h	; 6ebb
	defb 003h,033h,064h,02fh,081h,001h	; 6ec1
	defb 000h,075h,067h,09ah,067h,003h	; 6ec7
	defb 0ffh	; 6ecd

; ----------------------------------------------------------------------
; DATOS piezas_zona_7: 4 fichas de 6 bytes [bancos][colores lo hi][lista lo
;   hi][sitio] y un 0xFF: las piezas de la zona 7 (p00:4C0F; los bancos con
;   p00:4C6B); lo leen p00:4C1B (25 bytes)
;   0x6ece..0x6ee7  (25 bytes)
DATA_piezas_zona_7:
	defb 000h,09ch,064h,08eh,071h,002h	; 6ece
	defb 004h,033h,064h,000h,080h,003h	; 6ed4
	defb 002h,033h,064h,08ch,082h,003h	; 6eda
	defb 003h,033h,064h,02fh,081h,003h	; 6ee0
	defb 0ffh	; 6ee6

; ----------------------------------------------------------------------
; DATOS piezas_zona_10: 10 fichas de 6 bytes [bancos][colores lo hi][lista lo
;   hi][sitio] y un 0xFF: las piezas de la zona 10 (p00:4C0F; los bancos con
;   p00:4C6B); lo leen p00:4C1B (61 bytes)
;   0x6ee7..0x6f24  (61 bytes)
DATA_piezas_zona_10:
	defb 004h,09ch,064h,07ch,0a2h,000h	; 6ee7
	defb 000h,035h,065h,0cch,071h,001h	; 6eed
	defb 000h,035h,065h,0fah,071h,001h	; 6ef3
	defb 004h,09ch,064h,003h,0a2h,002h	; 6ef9
	defb 000h,035h,065h,000h,072h,002h	; 6eff
	defb 003h,0d1h,062h,000h,080h,003h	; 6f05
	defb 003h,0d1h,062h,0b6h,080h,003h	; 6f0b
	defb 002h,0d1h,062h,0b7h,06fh,003h	; 6f11
	defb 000h,0d1h,062h,030h,067h,003h	; 6f17
	defb 002h,0d1h,062h,0f8h,0a3h,003h	; 6f1d
	defb 0ffh	; 6f23

; ----------------------------------------------------------------------
; DATOS piezas_zona_11: 9 fichas de 6 bytes [bancos][colores lo hi][lista lo
;   hi][sitio] y un 0xFF: las piezas de la zona 11 (p00:4C0F; los bancos con
;   p00:4C6B); se solapan 6 bloques: (piezas_zona_12 6F24-6F5B)
;   (piezas_zona_13 6F24-6F5B) (piezas_zona_14 6F24-6F5B) (piezas_zona_15
;   6F24-6F5B) (piezas_zona_16 6F24-6F5B); lo leen p00:4C1B (55 bytes)
;   0x6f24..0x6f5b  (55 bytes)
DATA_piezas_zona_11:
	defb 003h,0d1h,062h,000h,080h,001h	; 6f24
	defb 002h,05ah,062h,0fah,0a1h,081h	; 6f2a
	defb 000h,0b7h,065h,050h,067h,001h	; 6f30
	defb 000h,0b7h,065h,0adh,071h,002h	; 6f36
	defb 002h,0b7h,065h,0d6h,06fh,002h	; 6f3c
	defb 002h,0b7h,065h,0e1h,06fh,002h	; 6f42
	defb 004h,0b7h,065h,0f3h,088h,002h	; 6f48
	defb 000h,0b7h,065h,040h,067h,002h	; 6f4e
	defb 002h,05ah,062h,0fah,0a1h,003h	; 6f54
	defb 0ffh	; 6f5a

; ----------------------------------------------------------------------
; DATOS piezas_zona_18: 4 fichas de 6 bytes [bancos][colores lo hi][lista lo
;   hi][sitio] y un 0xFF: las piezas de la zona 18 (p00:4C0F; los bancos con
;   p00:4C6B); lo leen p00:4C1B (25 bytes)
;   0x6f5b..0x6f74  (25 bytes)
DATA_piezas_zona_18:
	defb 002h,048h,066h,0abh,082h,000h	; 6f5b
	defb 004h,048h,066h,003h,089h,000h	; 6f61
	defb 003h,048h,066h,018h,0aeh,000h	; 6f67
	defb 000h,048h,066h,065h,067h,000h	; 6f6d
	defb 0ffh	; 6f73

; ----------------------------------------------------------------------
; DATOS piezas_zona_19: 11 fichas de 6 bytes [bancos][colores lo hi][lista lo
;   hi][sitio] y un 0xFF: las piezas de la zona 19 (p00:4C0F; los bancos con
;   p00:4C6B); lo leen p00:4C1B (67 bytes)
;   0x6f74..0x6fb7  (67 bytes)
DATA_piezas_zona_19:
	defb 002h,048h,066h,01fh,083h,000h	; 6f74
	defb 000h,048h,066h,083h,0aeh,000h	; 6f7a
	defb 002h,048h,066h,0d3h,082h,000h	; 6f80
	defb 004h,048h,066h,003h,089h,000h	; 6f86
	defb 003h,048h,066h,018h,0aeh,000h	; 6f8c
	defb 000h,048h,066h,065h,067h,000h	; 6f92
	defb 004h,033h,064h,000h,080h,001h	; 6f98
	defb 003h,0d1h,062h,035h,08fh,001h	; 6f9e
	defb 005h,000h,080h,014h,080h,002h	; 6fa4
	defb 005h,000h,080h,03dh,080h,002h	; 6faa
	defb 003h,0d1h,062h,0f6h,090h,003h	; 6fb0
	defb 0ffh	; 6fb6

; ----------------------------------------------------------------------
; DATOS lista_6FB7: 6 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x62D1); lo leen p00:4C26 (31 bytes)
;   0x6fb7..0x6fd6  (31 bytes)
DATA_lista_6FB7:
	defb 041h,00dh,0f3h,00ah,092h	; 6fb7
	defb 083h,003h,0f4h,01ah,092h	; 6fbc
	defb 043h,02eh,0f7h,062h,092h	; 6fc1
	defb 042h,00dh,0fah,092h,092h	; 6fc6
	defb 081h,003h,0fch,0aah,093h	; 6fcb
	defb 083h,030h,0fdh,0c2h,093h	; 6fd0
	defb 0ffh	; 6fd5

; ----------------------------------------------------------------------
; DATOS lista_6FD6: 2 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x65B7); lo leen p00:4C26 (11 bytes)
;   0x6fd6..0x6fe1  (11 bytes)
DATA_lista_6FD6:
	defb 063h,008h,001h,02ah,083h	; 6fd6
	defb 048h,009h,024h,05ah,085h	; 6fdb
	defb 0ffh	; 6fe0

; ----------------------------------------------------------------------
; DATOS lista_6FE1: 15 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x65B7); lo leen p00:4C26 (76 bytes)
;   0x6fe1..0x702d  (76 bytes)
DATA_lista_6FE1:
	defb 04ch,009h,081h,0f2h,08ch	; 6fe1
	defb 041h,001h,0e0h,00ah,092h	; 6fe6
	defb 083h,01ch,0e1h,01ah,092h	; 6feb
	defb 043h,00fh,0e4h,062h,092h	; 6ff0
	defb 042h,001h,0e7h,092h,092h	; 6ff5
	defb 081h,01ch,0e9h,0aah,093h	; 6ffa
	defb 083h,010h,0eah,0c2h,093h	; 6fff
	defb 001h,009h,0f0h,0b2h,092h	; 7004
	defb 049h,011h,0f1h,0bah,092h	; 7009
	defb 082h,011h,0fah,04ah,093h	; 700e
	defb 043h,012h,0fch,07ah,093h	; 7013
	defb 04fh,009h,0b1h,08ah,09ah	; 7018
	defb 091h,015h,0c0h,07ah,09bh	; 701d
	defb 081h,016h,0d1h,02ah,09dh	; 7022
	defb 041h,009h,0d2h,042h,09dh	; 7027
	defb 0ffh	; 702c

; ----------------------------------------------------------------------
; DATOS lista_702D: 9 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x0000); lo leen p00:4C0C (46 bytes)
;   0x702d..0x705b  (46 bytes)
DATA_lista_702D:
	defb 043h,000h,001h,033h,072h	; 702d
	defb 043h,001h,004h,063h,072h	; 7032
	defb 045h,000h,007h,093h,072h	; 7037
	defb 099h,002h,00ch,0e3h,072h	; 703c
	defb 045h,000h,025h,03bh,075h	; 7041
	defb 05ah,001h,02bh,08bh,075h	; 7046
	defb 045h,003h,045h,02bh,077h	; 704b
	defb 0b0h,002h,04ah,07bh,077h	; 7050
	defb 043h,004h,07ah,0fbh,07bh	; 7055
	defb 0ffh	; 705a

; ----------------------------------------------------------------------
; DATOS lista_705B: 12 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x0000); lo leen p00:4C0C (61 bytes)
;   0x705b..0x7098  (61 bytes)
DATA_lista_705B:
	defb 04ah,00ah,081h,0abh,088h	; 705b
	defb 044h,00bh,08bh,04bh,089h	; 7060
	defb 043h,00ch,090h,08bh,089h	; 7065
	defb 092h,005h,093h,0bbh,089h	; 706a
	defb 084h,005h,0a1h,00bh,08bh	; 706f
	defb 0b0h,006h,0a5h,06bh,08bh	; 7074
	defb 090h,006h,0dfh,0ebh,08fh	; 7079
	defb 08ch,00dh,0efh,06bh,091h	; 707e
	defb 044h,01ch,0fch,08bh,092h	; 7083
	defb 045h,003h,0bfh,02bh,07ch	; 7088
	defb 091h,005h,0c4h,07bh,07ch	; 708d
	defb 08bh,006h,0d4h,0fbh,07dh	; 7092
	defb 0ffh	; 7097

; ----------------------------------------------------------------------
; DATOS lista_7098: 10 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x0000); lo leen p00:4C0C (51 bytes)
;   0x7098..0x70cb  (51 bytes)
DATA_lista_7098:
	defb 043h,000h,001h,033h,072h	; 7098
	defb 043h,001h,004h,063h,072h	; 709d
	defb 045h,000h,007h,093h,072h	; 70a2
	defb 087h,002h,009h,003h,07fh	; 70a7
	defb 046h,007h,010h,0abh,07fh	; 70ac
	defb 0a4h,002h,016h,00bh,080h	; 70b1
	defb 067h,003h,03ah,06bh,083h	; 70b6
	defb 085h,006h,061h,0dbh,085h	; 70bb
	defb 082h,008h,066h,053h,086h	; 70c0
	defb 097h,009h,068h,083h,086h	; 70c5
	defb 0ffh	; 70ca

; ----------------------------------------------------------------------
; DATOS lista_70CB: 9 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x0000); lo leen p00:4C0C (46 bytes)
;   0x70cb..0x70f9  (46 bytes)
DATA_lista_70CB:
	defb 04ah,00ah,081h,0abh,088h	; 70cb
	defb 044h,00bh,08bh,04bh,089h	; 70d0
	defb 043h,00ch,090h,08bh,089h	; 70d5
	defb 08eh,005h,093h,0bbh,089h	; 70da
	defb 084h,005h,0a1h,00bh,08bh	; 70df
	defb 0b0h,006h,0a5h,06bh,08bh	; 70e4
	defb 090h,006h,0dfh,0ebh,08fh	; 70e9
	defb 08ch,00dh,0efh,06bh,091h	; 70ee
	defb 044h,01ch,0fch,08bh,092h	; 70f3
	defb 0ffh	; 70f8

; ----------------------------------------------------------------------
; DATOS lista_70F9: 6 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x0000); lo leen p00:4C0C, p00:4D34 (31 bytes)
;   0x70f9..0x7118  (31 bytes)
DATA_lista_70F9:
	defb 058h,00eh,001h,0cbh,092h	; 70f9
	defb 051h,01dh,019h,04bh,094h	; 70fe
	defb 098h,00eh,02ah,05bh,095h	; 7103
	defb 04bh,00eh,050h,09bh,097h	; 7108
	defb 046h,012h,05bh,04bh,098h	; 710d
	defb 09bh,00eh,061h,0abh,098h	; 7112
	defb 0ffh	; 7117

; ----------------------------------------------------------------------
; DATOS lista_7118: 9 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x0000); lo leen p00:4C0C, p00:4D25 (46 bytes)
;   0x7118..0x7146  (46 bytes)
DATA_lista_7118:
	defb 043h,013h,001h,033h,09bh	; 7118
	defb 043h,012h,004h,063h,09bh	; 711d
	defb 046h,011h,007h,093h,09bh	; 7122
	defb 042h,014h,00dh,0f3h,09bh	; 7127
	defb 083h,013h,00fh,013h,09ch	; 712c
	defb 005h,015h,020h,05bh,09ch	; 7131
	defb 003h,01bh,025h,083h,09ch	; 7136
	defb 06bh,017h,028h,09bh,09ch	; 713b
	defb 085h,017h,053h,04bh,09fh	; 7140
	defb 0ffh	; 7145

; ----------------------------------------------------------------------
; DATOS lista_7146: 8 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x0000); lo leen p00:4C0C (41 bytes)
;   0x7146..0x716f  (41 bytes)
DATA_lista_7146:
	defb 003h,016h,081h,0c3h,09fh	; 7146
	defb 002h,011h,084h,0dbh,09fh	; 714b
	defb 058h,010h,086h,0ebh,09fh	; 7150
	defb 048h,012h,0a0h,06bh,0a1h	; 7155
	defb 044h,018h,0a8h,0ebh,0a1h	; 715a
	defb 042h,019h,0b0h,02bh,0a2h	; 715f
	defb 04dh,01ah,0b2h,04bh,0a2h	; 7164
	defb 081h,01ah,0bfh,01bh,0a3h	; 7169
	defb 0ffh	; 716e

; ----------------------------------------------------------------------
; DATOS lista_716F: 6 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x619A); lo leen p00:4C26 (31 bytes)
;   0x716f..0x718e  (31 bytes)
DATA_lista_716F:
	defb 045h,01bh,09fh,02bh,07ch	; 716f
	defb 091h,01ch,0a4h,07bh,07ch	; 7174
	defb 08bh,01dh,0b4h,0fbh,07dh	; 7179
	defb 084h,01ch,081h,00bh,08bh	; 717e
	defb 044h,01eh,0c0h,08bh,092h	; 7183
	defb 09ah,01dh,085h,06bh,08bh	; 7188
	defb 0ffh	; 718d

; ----------------------------------------------------------------------
; DATOS lista_718E: 6 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x649C); lo leen p00:4C26 (31 bytes)
;   0x718e..0x71ad  (31 bytes)
DATA_lista_718E:
	defb 045h,008h,02fh,02bh,07ch	; 718e
	defb 091h,01dh,034h,07bh,07ch	; 7193
	defb 08bh,01eh,044h,0fbh,07dh	; 7198
	defb 084h,01dh,071h,00bh,08bh	; 719d
	defb 09ah,01eh,015h,06bh,08bh	; 71a2
	defb 090h,01eh,050h,0ebh,08fh	; 71a7
	defb 0ffh	; 71ac

; ----------------------------------------------------------------------
; DATOS lista_71AD: 6 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x65B7); lo leen p00:4C26 (31 bytes)
;   0x71ad..0x71cc  (31 bytes)
DATA_lista_71AD:
	defb 045h,00ch,04fh,02bh,07ch	; 71ad
	defb 091h,00dh,054h,07bh,07ch	; 71b2
	defb 08bh,00ah,064h,0fbh,07dh	; 71b7
	defb 084h,00dh,031h,00bh,08bh	; 71bc
	defb 044h,00bh,070h,08bh,092h	; 71c1
	defb 09ah,00ah,035h,06bh,08bh	; 71c6
	defb 0ffh	; 71cb

; ----------------------------------------------------------------------
; DATOS lista_71CC: 9 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x6535); lo leen p00:4C26 (46 bytes)
;   0x71cc..0x71fa  (46 bytes)
DATA_lista_71CC:
	defb 043h,005h,001h,033h,072h	; 71cc
	defb 043h,011h,004h,063h,072h	; 71d1
	defb 045h,005h,007h,093h,072h	; 71d6
	defb 099h,012h,00ch,0e3h,072h	; 71db
	defb 045h,005h,025h,03bh,075h	; 71e0
	defb 05ah,011h,02bh,08bh,075h	; 71e5
	defb 045h,013h,045h,02bh,077h	; 71ea
	defb 0b0h,012h,04ah,07bh,077h	; 71ef
	defb 044h,00eh,07ah,08bh,092h	; 71f4
	defb 0ffh	; 71f9

; ----------------------------------------------------------------------
; DATOS lista_71FA: 1 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x6535); lo leen p00:4C26 (6 bytes)
;   0x71fa..0x7200  (6 bytes)
DATA_lista_71FA:
	defb 090h,014h,0dfh,0ebh,08fh	; 71fa
	defb 0ffh	; 71ff

; ----------------------------------------------------------------------
; DATOS lista_7200: 10 fichas de dibujo de 5 bytes
;   [tipo-cuantos][colores][sitio][puntero lo hi] y un 0xFF (p00:4D92; colores
;   en la tabla 0x6535); lo leen p00:4C26 (51 bytes)
;   0x7200..0x7233  (51 bytes)
DATA_lista_7200:
	defb 04ah,011h,081h,0abh,088h	; 7200
	defb 044h,005h,08bh,04bh,089h	; 7205
	defb 043h,015h,090h,08bh,089h	; 720a
	defb 092h,017h,093h,0bbh,089h	; 720f
	defb 084h,017h,0a1h,00bh,08bh	; 7214
	defb 0b0h,014h,0a5h,06bh,08bh	; 7219
	defb 090h,014h,0dfh,0ebh,08fh	; 721e
	defb 045h,013h,0bfh,02bh,07ch	; 7223
	defb 091h,017h,0c4h,07bh,07ch	; 7228
	defb 08bh,014h,0d4h,0fbh,07dh	; 722d
	defb 0ffh	; 7232

; ----------------------------------------------------------------------
; DATOS dibujo_7233: 3 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 0 de la lista 0x702D (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (48 bytes)
;   0x7233..0x7263  (48 bytes)
DATA_dibujo_7233:
	defb 0ffh,002h,0f7h,008h,0ffh,000h,0cfh,030h,0ceh,041h,0ffh,000h,0efh,010h,0fdh,002h	; 7233  .......0.A......
	defb 0ffh,000h,0bdh,042h,0ffh,000h,0ffh,000h,0dfh,020h,0feh,001h,0ffh,000h,0ffh,008h	; 7243  ...B..... ......
	defb 0ffh,000h,0f7h,008h,0ffh,000h,0fbh,044h,0ffh,000h,0ffh,000h,0dfh,022h,0ffh,000h	; 7253  .......D....."..

; ----------------------------------------------------------------------
; DATOS dibujo_7263: 3 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 1 de la lista 0x702D (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (48 bytes)
;   0x7263..0x7293  (48 bytes)
DATA_dibujo_7263:
	defb 002h,000h,040h,008h,000h,000h,012h,020h,040h,000h,000h,000h,010h,002h,080h,000h	; 7263  ..@.... @.......
	defb 000h,000h,040h,000h,000h,000h,00ah,000h,040h,020h,004h,000h,000h,000h,008h,000h	; 7273  ..@.....@ ......
	defb 000h,000h,022h,008h,000h,000h,044h,000h,000h,000h,008h,000h,022h,000h,000h,000h	; 7283  .."...D....."...

; ----------------------------------------------------------------------
; DATOS dibujo_7293: 5 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 2 de la lista 0x702D (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (80 bytes)
;   0x7293..0x72e3  (80 bytes)
DATA_dibujo_7293:
	defb 080h,000h,080h,048h,0e0h,000h,0fah,000h,0f8h,040h,0fch,004h,0feh,000h,0ffh,008h	; 7293  ...H.....@......
	defb 07fh,000h,077h,008h,01fh,000h,00fh,00ah,047h,000h,007h,000h,001h,000h,008h,000h	; 72a3  ..w.....G.......
	defb 0ffh,000h,0ffh,040h,0efh,010h,0ffh,00ah,0ffh,040h,0ffh,064h,0ffh,020h,03fh,008h	; 72b3  ...@.....@.d. ?.
	defb 0fah,004h,0fch,040h,0fch,000h,0fch,008h,0dch,060h,0ffh,004h,0ffh,000h,0ffh,008h	; 72c3  ...@.....`......
	defb 03fh,040h,077h,048h,07fh,000h,07fh,00ah,0ffh,040h,0efh,014h,07fh,000h,03fh,008h	; 72d3  ?@wH.....@....?.

; ----------------------------------------------------------------------
; DATOS dibujo_72E3: 25 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 3 de la lista 0x702D (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (600 bytes)
;   0x72e3..0x753b  (600 bytes)
DATA_dibujo_72E3:
	defb 0ffh,000h,000h,0ffh,000h,040h,0efh,010h,000h,0f7h,000h,002h,0feh,000h,040h,0fbh,002h,002h,0fch,004h,004h,0fdh,004h,00ch	; 72e3  .....@........@.........
	defb 0ffh,000h,000h,0ffh,000h,040h,0ffh,000h,000h,0ffh,000h,0cah,0bfh,080h,088h,047h,000h,005h,0fch,000h,000h,0ffh,000h,009h	; 72fb  .....@.........G........
	defb 0fch,000h,000h,0f6h,008h,040h,0ffh,001h,001h,0fch,000h,008h,0d3h,020h,000h,0fbh,000h,000h,0b8h,040h,000h,0feh,002h,012h	; 7313  .....@....... .....@....
	defb 0fdh,000h,000h,0ffh,000h,040h,0feh,000h,000h,0f6h,008h,002h,0feh,000h,040h,0eah,014h,000h,0fdh,001h,001h,0fch,000h,008h	; 732b  .....@........@.........
	defb 0fdh,001h,001h,0ffh,001h,041h,0feh,000h,000h,0fdh,000h,008h,0dch,020h,000h,0beh,040h,000h,0ffh,000h,000h,0fah,004h,010h	; 7343  .....A....... ..@.......
	defb 09fh,0a0h,080h,07fh,000h,020h,0ffh,000h,020h,07fh,000h,04ah,05fh,020h,000h,0bfh,000h,004h,09fh,020h,000h,03fh,000h,008h	; 735b  ..... .. ..J_ ..... .?..
	defb 03fh,040h,000h,0ffh,080h,080h,0ffh,000h,000h,07fh,080h,00ah,05fh,080h,000h,0ffh,020h,0a4h,05fh,040h,040h,09fh,0a0h,088h	; 7373  ?@.........._... ._@@...
	defb 0ffh,000h,080h,0fdh,002h,040h,0ffh,000h,080h,0ffh,000h,08ah,0dfh,020h,0c0h,0ffh,000h,004h,03fh,040h,000h,0ffh,080h,088h	; 738b  .....@....... ....?@....
	defb 0ffh,000h,0b0h,07bh,004h,022h,05fh,020h,011h,06fh,050h,048h,09fh,080h,082h,0bfh,080h,0a0h,097h,0a0h,082h,0dbh,080h,092h	; 73a3  ...{."_ .oPH............
	defb 03fh,000h,000h,07fh,000h,000h,03fh,000h,000h,06fh,040h,04ah,097h,080h,080h,0cbh,090h,080h,067h,000h,000h,003h,000h,000h	; 73bb  ?.....?..o@J......g.....
	defb 05ch,0eeh,044h,029h,045h,001h,031h,0bbh,011h,054h,055h,044h,04ch,0eeh,044h,0ffh,0ffh,0ffh,0cfh,030h,000h,018h,000h,000h	; 73d3  \.D)E.1..TUDL.D....0....
	defb 000h,0ffh,000h,0ffh,000h,000h,07fh,0bbh,011h,0bbh,011h,000h,05fh,0eeh,044h,08eh,044h,000h,017h,0bbh,011h,023h,011h,000h	; 73eb  ............_.D.D....#..
	defb 000h,0ffh,000h,0ffh,000h,000h,0ffh,0bbh,011h,0bbh,011h,000h,0ffh,0eeh,044h,0eeh,044h,000h,0ffh,0bbh,011h,0bbh,011h,000h	; 7403  ..............D.D.......
	defb 044h,0eeh,044h,001h,045h,001h,031h,0bbh,011h,054h,055h,044h,04ch,0eeh,044h,091h,055h,011h,031h,0bbh,011h,054h,055h,044h	; 741b  D.D.E.1..TUDL.D.U.1..TUD
	defb 05ch,0eeh,044h,029h,045h,001h,031h,0bbh,011h,054h,055h,044h,08ch,0aeh,084h,0d1h,095h,091h,0dbh,09bh,09bh,0ffh,0bfh,0bfh	; 7433  \.D)E.1..TUD............
	defb 0ffh,0eeh,044h,0eeh,044h,000h,0ffh,0bbh,011h,0bbh,011h,000h,0f7h,0eeh,044h,0bah,054h,010h,0b7h,0bbh,0a3h,0f7h,0f7h,0f7h	; 744b  ..D.D.........D.T.......
	defb 0ffh,0eeh,044h,0eeh,044h,000h,0ffh,0bbh,011h,0bbh,011h,000h,0ffh,0eeh,044h,0eeh,044h,000h,0ffh,0bbh,011h,0bbh,011h,000h	; 7463  ..D.D.........D.D.......
	defb 044h,0eeh,044h,010h,054h,010h,013h,0bbh,011h,043h,051h,040h,04fh,0eeh,044h,000h,000h,000h,000h,0ffh,000h,0ffh,000h,000h	; 747b  D.D.T....CQ@O.D.........
	defb 0ffh,0eeh,044h,0eeh,044h,000h,0ffh,0bbh,011h,0bbh,011h,000h,0ffh,0eeh,044h,000h,000h,000h,000h,0ffh,000h,0ffh,000h,000h	; 7493  ..D.D.........D.........
	defb 07fh,0ffh,07fh,0f8h,07ah,038h,0f7h,0bbh,011h,0bbh,011h,000h,0ffh,0eeh,044h,0eeh,044h,000h,0ffh,0bbh,011h,0bbh,011h,000h	; 74ab  ....z8........D.D.......
	defb 0dfh,09fh,09fh,0ddh,091h,091h,0bfh,0bdh,0bdh,0b4h,0b5h,0b4h,0ach,086h,084h,091h,055h,011h,031h,0bbh,011h,054h,055h,044h	; 74c3  ................U.1..TUD
	defb 0a1h,040h,000h,083h,000h,000h,087h,000h,000h,08fh,000h,00ah,0ffh,060h,060h,0ffh,000h,004h,0ffh,000h,000h,0ffh,000h,008h	; 74db  .@...........``.........
	defb 000h,000h,000h,0c6h,040h,040h,013h,010h,010h,0c1h,040h,040h,030h,010h,010h,0cch,044h,044h,030h,010h,010h,000h,000h,000h	; 74f3  ....@@....@@0...DD0.....
	defb 000h,000h,000h,026h,000h,000h,013h,000h,000h,081h,008h,000h,044h,000h,000h,000h,000h,000h,000h,000h,000h,0f7h,008h,000h	; 750b  ...&........D...........
	defb 012h,010h,010h,029h,009h,009h,014h,004h,004h,082h,00ah,002h,045h,001h,001h,000h,000h,000h,000h,000h,000h,0f7h,008h,000h	; 7523  ...)........E...........

; ----------------------------------------------------------------------
; DATOS dibujo_753B: 5 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 4 de la lista 0x702D (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (80 bytes)
;   0x753b..0x758b  (80 bytes)
DATA_dibujo_753B:
	defb 080h,000h,0c0h,048h,0e0h,000h,0fah,000h,0ffh,040h,0efh,014h,0ffh,000h,0ffh,008h	; 753b  ...H.....@......
	defb 000h,000h,040h,000h,000h,004h,00ah,000h,040h,000h,0ffh,000h,0ffh,004h,0bfh,040h	; 754b  ..@.....@......@
	defb 007h,000h,04fh,000h,007h,000h,00fh,002h,05fh,000h,0fbh,004h,0ffh,048h,0ffh,002h	; 755b  ..O....._....H..
	defb 007h,000h,047h,008h,007h,000h,00fh,000h,047h,001h,007h,000h,007h,000h,003h,004h	; 756b  ..G.....G.......
	defb 080h,000h,0c6h,000h,0e3h,000h,0f1h,080h,0f8h,010h,0bch,040h,09eh,008h,0ffh,000h	; 757b  ...........@....

; ----------------------------------------------------------------------
; DATOS dibujo_758B: 26 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 5 de la lista 0x702D (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (416 bytes)
;   0x758b..0x772b  (416 bytes)
DATA_dibujo_758B:
	defb 09dh,01dh,0dbh,09bh,037h,037h,067h,063h,0edh,0e1h,0d3h,0c3h,0b9h,081h,01bh,003h	; 758b  ....77gc........
	defb 01ah,01ah,09eh,09eh,0feh,0feh,0fdh,0fdh,0ffh,0ffh,0fbh,0f9h,0f5h,0f1h,0feh,0feh	; 759b  ................
	defb 0cbh,083h,0b2h,0d2h,03fh,00fh,097h,087h,0adh,08dh,0cbh,0cbh,0efh,0efh,0fdh,0fdh	; 75ab  ....?...........
	defb 079h,079h,0feh,0fch,0e5h,0e4h,0dch,0dch,0feh,0feh,0f6h,0f6h,0afh,0afh,07fh,07fh	; 75bb  yy..............
	defb 00eh,0b2h,0c9h,001h,03bh,03bh,07dh,07dh,0dfh,0dfh,09fh,09fh,058h,018h,0bch,03ch	; 75cb  ......}}....X..<
	defb 0cbh,083h,0b2h,0d2h,03fh,00fh,097h,087h,0aeh,08eh,0c9h,0c9h,0efh,0efh,0fdh,0fdh	; 75db  ....?...........
	defb 0feh,0fch,0f5h,0f1h,0e3h,0e3h,0f7h,0f7h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 75eb  ................
	defb 0afh,08fh,0deh,0ceh,0c7h,0c7h,0f7h,0e7h,0e7h,0e7h,0f7h,0f7h,0ebh,0ebh,0f7h,0f7h	; 75fb  ................
	defb 091h,091h,0fbh,0dbh,0afh,0afh,0d6h,0d6h,05bh,05bh,079h,079h,07ch,07ch,07ah,07ah	; 760b  ........[[yy||zz
	defb 07fh,07fh,07fh,03fh,01fh,01fh,0d7h,0d7h,067h,067h,02bh,02bh,03dh,03dh,09eh,09eh	; 761b  ...?....gg++==..
	defb 0bdh,0bdh,02eh,026h,0d7h,0d7h,07fh,07fh,067h,067h,037h,037h,09bh,09bh,06bh,06bh	; 762b  ...&....gg77..kk
	defb 01dh,01dh,04fh,00fh,00fh,00fh,0d3h,0d3h,063h,063h,029h,029h,03ch,03ch,09eh,09eh	; 763b  ..O.....cc))<<..
	defb 017h,017h,0dbh,05bh,049h,049h,0a9h,0a9h,01ch,01ch,0c6h,0c6h,027h,027h,093h,093h	; 764b  ...[II......''..
	defb 011h,011h,09eh,09eh,0ceh,0ceh,0efh,0efh,0b7h,0b7h,0b7h,0b7h,0dbh,0dbh,0efh,0efh	; 765b  ................
	defb 0feh,000h,0bdh,041h,0ebh,002h,0d4h,004h,088h,008h,08ch,00ch,0f3h,073h,09dh,09dh	; 766b  ...A.........s..
	defb 0f2h,000h,0a5h,041h,092h,012h,09ch,09ch,029h,009h,08fh,08fh,073h,073h,09dh,09dh	; 767b  ...A....)...ss..
	defb 0dch,0dch,0d8h,098h,0b8h,0b8h,031h,031h,06ah,06ah,07ch,06ch,0f4h,0e4h,0cah,0c2h	; 768b  ......11jj|l....
	defb 0ffh,0ffh,0feh,0feh,0fdh,0fch,0f8h,0f8h,0f4h,0f0h,0f3h,0f2h,0f2h,0e0h,0d5h,0c4h	; 769b  ................
	defb 0c5h,0c5h,0cbh,0cbh,09eh,09eh,0bdh,0bch,07eh,07ch,07ch,078h,0eah,0eah,0e9h,0e9h	; 76ab  ........~||x....
	defb 0f5h,0f1h,0f9h,0f9h,0fbh,0fbh,0dah,0dah,0f1h,0f1h,0fbh,0fbh,0f6h,0e6h,0d5h,0c4h	; 76bb  ................
	defb 0dfh,0deh,0dah,0d8h,0bbh,0b8h,099h,098h,054h,050h,0bah,0bah,03bh,02bh,075h,075h	; 76cb  ........TP...+uu
	defb 09eh,09eh,0b9h,0b9h,07bh,07bh,0bdh,03dh,05fh,05fh,09fh,09fh,058h,018h,0bch,03ch	; 76db  ....{{.=__..X..<
	defb 0f7h,0e7h,0f7h,0c7h,0cfh,0cfh,0dfh,0dfh,0bfh,0bfh,0bfh,0bfh,07fh,07fh,0ffh,0ffh	; 76eb  ................
	defb 0afh,08fh,0d2h,0c2h,0c7h,0c7h,0e7h,0e7h,0e7h,0e7h,0f7h,0f7h,0ebh,0ebh,0f7h,0f7h	; 76fb  ................
	defb 0dbh,0c3h,0e3h,0e3h,0f7h,0f7h,0bbh,0bbh,0afh,0afh,04dh,00dh,057h,007h,0afh,08fh	; 770b  ..........M.W...
	defb 0f2h,000h,0e5h,001h,092h,012h,09ch,09ch,029h,009h,08fh,08fh,073h,073h,09dh,09dh	; 771b  ........)...ss..

; ----------------------------------------------------------------------
; DATOS dibujo_772B: 5 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 6 de la lista 0x702D (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (80 bytes)
;   0x772b..0x777b  (80 bytes)
DATA_dibujo_772B:
	defb 0bdh,0bdh,02eh,026h,097h,017h,0cfh,00fh,095h,025h,0f2h,002h,0c9h,001h,0f4h,000h	; 772b  ...&.....%......
	defb 0dbh,001h,0b7h,00bh,0adh,011h,033h,023h,07ch,018h,096h,004h,0a7h,027h,093h,093h	; 773b  ......3#|....'..
	defb 0c5h,0c5h,0cbh,0cbh,09eh,09eh,03dh,03ch,07eh,07ch,07ch,078h,0eah,0eah,0e9h,0e9h	; 774b  ......=<~||x....
	defb 0d5h,0d5h,0dbh,0dbh,0ffh,0f7h,0bbh,0b2h,0a4h,0a5h,0efh,0ech,0fah,0f8h,0fdh,0f9h	; 775b  ................
	defb 03eh,000h,0ebh,084h,0a6h,029h,03fh,020h,067h,040h,0e3h,0c0h,082h,080h,0a4h,0a0h	; 776b  >....)? g@......

; ----------------------------------------------------------------------
; DATOS dibujo_777B: 48 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 7 de la lista 0x702D (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (1152 bytes)
;   0x777b..0x7bfb  (1152 bytes)
DATA_dibujo_777B:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,087h,047h,047h,040h,0b0h,0b0h	; 777b  ...................GG@..
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0feh,0fch,0fch,0fdh,0f9h,0f9h,0fah,0f2h,0f2h,0fdh,0f5h,0f5h,0f7h,0e7h,0e7h	; 7793  ........................
	defb 00bh,004h,000h,0c4h,0c3h,0c2h,022h,021h,021h,07bh,042h,042h,053h,04dh,045h,0a8h,020h,020h,0d1h,011h,011h,02fh,00fh,00fh	; 77ab  ......"!!{BBSME.  .../..
	defb 09fh,060h,020h,0a6h,019h,008h,0d4h,000h,000h,0a0h,040h,000h,078h,008h,008h,026h,006h,006h,08bh,00bh,00bh,065h,005h,005h	; 77c3  .` .......@.x..&.....e..
	defb 0fbh,004h,004h,0efh,010h,010h,042h,081h,001h,0bbh,002h,002h,033h,00dh,005h,098h,000h,000h,0c1h,001h,001h,02bh,00bh,00bh	; 77db  ......B.....3........+..
	defb 00fh,0b0h,0b0h,0c9h,006h,002h,032h,031h,031h,074h,070h,070h,0d7h,0d0h,0d0h,09bh,098h,098h,058h,018h,018h,0bch,03ch,03ch	; 77f3  ......211tpp......X...<<
	defb 0f1h,000h,000h,0e3h,010h,010h,044h,080h,000h,0bah,002h,002h,033h,00dh,005h,098h,000h,000h,081h,001h,001h,02bh,00bh,00bh	; 780b  ......D.....3........+..
	defb 03fh,000h,000h,02fh,010h,010h,09fh,0e0h,0a0h,0bfh,0c0h,0c0h,013h,004h,004h,019h,01ah,01ah,034h,031h,031h,02ah,028h,028h	; 7823  ?../..............411*((
	defb 0dch,0dch,0dch,0d8h,098h,098h,0b1h,0b0h,0b0h,031h,030h,030h,06ah,069h,069h,0c9h,0ceh,0cah,0a3h,0ach,0a4h,0c7h,0d8h,0d8h	; 783b  .........100jii.........
	defb 09fh,060h,020h,0a6h,019h,008h,0d2h,000h,000h,0a0h,040h,000h,078h,008h,008h,026h,006h,006h,08bh,00bh,00bh,065h,005h,005h	; 7853  .` .......@.x..&.....e..
	defb 0c8h,08bh,08bh,026h,005h,004h,075h,004h,004h,094h,084h,084h,0aah,082h,082h,0c6h,0c6h,0c6h,0c9h,0c9h,0c9h,0bdh,0b9h,0b9h	; 786b  ...&..u.................
	defb 0feh,0fch,0fch,0fch,0f8h,0f8h,0fch,0f8h,0f8h,0fbh,0f3h,0f3h,0f3h,0fbh,0f3h,0fbh,0f3h,0f3h,0fdh,0f9h,0f9h,0ffh,0ffh,0ffh	; 7883  ........................
	defb 0fah,0fch,0f8h,0fah,0fch,0f8h,0fah,0fch,0f8h,0fah,0fch,0f8h,0fah,0fch,0f8h,0fah,0fch,0f8h,0fah,0fch,0f8h,0fah,0fch,0f8h	; 789b  ........................
	defb 0fah,0fch,0f8h,0fah,0fch,0f8h,0fah,0fch,0f8h,0fah,0fch,0f8h,0fah,0fch,0f8h,0fah,0fch,0f8h,022h,01ch,000h,00ah,0f4h,030h	; 78b3  .................."....0
	defb 0bfh,05fh,01fh,0bfh,05fh,01fh,0bfh,05fh,01fh,0bfh,05fh,01fh,0bfh,05fh,01fh,0bfh,05fh,01fh,0bfh,05fh,01fh,0bfh,05fh,01fh	; 78cb  ._.._.._.._.._.._.._.._.
	defb 0bfh,05fh,01fh,0bfh,05fh,01fh,0bfh,05fh,01fh,0bfh,05fh,01fh,0bfh,05fh,01fh,0b8h,058h,018h,0a0h,040h,000h,0a0h,040h,000h	; 78e3  ._.._.._.._.._..X..@..@.
	defb 0efh,0cfh,0cfh,0efh,0cfh,0cfh,09fh,0dfh,09fh,03fh,0bfh,03fh,07fh,07fh,07fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 78fb  .........?.?............
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0e7h,0e7h,0e7h,0fbh,0e3h,0e3h,0fdh,0f9h,0f9h,0feh,0fch,0fch,0fah,0fch,0f0h,0fch,0feh,0f8h	; 7913  ........................
	defb 0ffh,0ffh,0ffh,0fdh,0f9h,0f9h,0fbh,0f3h,0f3h,0f3h,0fbh,0f3h,0fbh,0f3h,0f3h,0e7h,0f7h,0e7h,0c7h,0e7h,0c7h,0efh,0cfh,0cfh	; 792b  ........................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0c1h,0c6h,0c0h,060h,014h,004h	; 7943  .....................`..
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,007h,004h,045h,0bah,032h	; 795b  .....................E.2
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0f8h,0f8h,0f8h,020h,01fh,004h,00dh,0f2h,032h	; 7973  .................. ....2
	defb 09bh,082h,082h,063h,000h,000h,025h,018h,000h,055h,028h,000h,01dh,060h,040h,0bbh,080h,080h,0c7h,0c0h,0c0h,077h,008h,008h	; 798b  ...c..%..U(..`@......w..
	defb 0efh,0cdh,0cdh,0dfh,0ddh,0ddh,0fdh,0f9h,0f9h,0fah,0b2h,0b2h,06dh,06ch,06ch,0f2h,0f1h,0f0h,091h,086h,080h,097h,068h,008h	; 79a3  ............mll.......h.
	defb 07fh,07fh,07fh,07fh,0ffh,07fh,0bfh,03fh,03fh,0bfh,03fh,03fh,09fh,05fh,05fh,0dfh,01fh,01fh,043h,023h,003h,0f4h,008h,008h	; 79bb  .......??.??.__...C#....
	defb 09fh,09fh,09fh,08fh,00fh,00fh,037h,0b7h,037h,0c9h,009h,009h,0a7h,047h,007h,0f9h,001h,001h,0a5h,05ah,040h,07dh,082h,002h	; 79d3  ......7.7....G.....Z@}..
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0efh,0ffh,0ffh,0efh,0efh,0ffh,0cfh,0dfh,0ffh,09fh,0dfh,0ffh,09fh,0dfh,07fh,01fh	; 79eb  ........................
	defb 0fch,0feh,0f8h,0fch,0feh,0f8h,0fch,0feh,0f8h,0fch,0feh,0f8h,0fch,0feh,0f8h,0fdh,0fdh,0f9h,0f9h,0fdh,0f1h,0f1h,0f9h,0e1h	; 7a03  ........................
	defb 09eh,066h,020h,0a6h,01eh,008h,0d4h,006h,000h,0a4h,046h,000h,07ch,00eh,008h,024h,006h,000h,08ch,00eh,008h,064h,006h,000h	; 7a1b  .f .......F.|..$.....d..
	defb 0cch,086h,080h,0b4h,0d6h,0d0h,03ch,00eh,008h,094h,086h,080h,0ach,08eh,088h,0cch,0ceh,0c8h,0ech,0eeh,0e8h,0fch,0feh,0f8h	; 7a33  ......<.................
	defb 08ch,08eh,088h,0d4h,0c6h,0c0h,0c4h,0c6h,0c0h,0e4h,0e6h,0e0h,0e4h,0e6h,0e0h,0f4h,0f6h,0f0h,0ech,0eeh,0e8h,0f4h,0f6h,0f0h	; 7a4b  ........................
	defb 0fch,0feh,0f8h,0fch,0feh,0f8h,0fch,0feh,0f8h,0fch,0feh,0f8h,0fch,0feh,0f8h,0fch,0feh,0f8h,0fch,0feh,0f8h,0fch,0feh,0f8h	; 7a63  ........................
	defb 0ffh,060h,000h,0e6h,079h,008h,0d4h,060h,000h,0c0h,060h,000h,0d8h,068h,008h,0c6h,066h,006h,0cbh,06bh,00bh,0c5h,065h,005h	; 7a7b  .`..y..`..`..h..f..k..e.
	defb 0cbh,063h,003h,0d2h,072h,012h,0dfh,06fh,00fh,0d7h,067h,007h,0cdh,06dh,00dh,0cbh,06bh,00bh,0cfh,06fh,00fh,0ddh,07dh,01dh	; 7a93  .c..r..o..g..m..k..o..}.
	defb 0cfh,06fh,00fh,0d2h,062h,002h,0c7h,067h,007h,0c7h,067h,007h,0c7h,067h,007h,0d7h,077h,017h,0cbh,06bh,00bh,0d7h,077h,017h	; 7aab  .o..b..g..g..g..w..k..w.
	defb 0dfh,07fh,01fh,0dfh,07fh,01fh,0dfh,07fh,01fh,0dfh,07fh,01fh,0dfh,07fh,01fh,0dfh,07fh,01fh,0dfh,07fh,01fh,0dfh,07fh,01fh	; 7ac3  ........................
	defb 0ffh,000h,000h,000h,000h,000h,0ffh,0ffh,000h,080h,0ffh,000h,0b0h,0f0h,030h,080h,0ffh,000h,0bfh,0c0h,000h,0b0h,0f0h,030h	; 7adb  ..............0........0
	defb 0ffh,000h,000h,000h,000h,000h,0ffh,0ffh,000h,000h,0ffh,000h,000h,000h,000h,000h,0ffh,000h,0ffh,000h,000h,000h,000h,000h	; 7af3  ........................
	defb 080h,0ffh,000h,0bfh,0c0h,000h,080h,0c0h,000h,01bh,0c3h,003h,08ah,0d0h,000h,04bh,090h,000h,05ah,091h,000h,04ah,091h,000h	; 7b0b  ...............K..Z..J..
	defb 000h,0ffh,000h,0ffh,000h,000h,000h,000h,000h,0fbh,0e3h,0e3h,02ah,010h,000h,0abh,010h,000h,0bah,011h,000h,0aah,011h,000h	; 7b23  ............*...........
	defb 04ah,091h,000h,04ah,091h,000h,04ah,091h,000h,048h,093h,002h,048h,091h,000h,04bh,094h,000h,06eh,0b0h,020h,06bh,0b0h,020h	; 7b3b  J..J..J..H..H..K..n. k.
	defb 0aah,011h,000h,0aah,011h,000h,0aah,011h,000h,0a8h,013h,002h,088h,011h,000h,08fh,010h,000h,00ch,012h,000h,08bh,090h,080h	; 7b53  ........................
	defb 048h,090h,000h,04ah,092h,002h,049h,091h,001h,059h,082h,002h,000h,0ffh,000h,0ffh,000h,000h,000h,000h,000h,0ffh,0ffh,0ffh	; 7b6b  H..J..I..Y..............
	defb 088h,010h,000h,08ah,052h,002h,049h,011h,001h,059h,082h,002h,000h,0ffh,000h,0ffh,000h,000h,000h,000h,000h,0ffh,0ffh,0ffh	; 7b83  ....R.I..Y..............
	defb 0a0h,05fh,000h,05fh,0ffh,000h,028h,0ffh,000h,040h,0ffh,000h,000h,0ffh,000h,042h,0bdh,000h,0bfh,040h,000h,0b8h,000h,000h	; 7b9b  ._._..(..@.....B...@....
	defb 015h,0e8h,000h,052h,0fch,000h,002h,0fch,000h,002h,0fch,000h,006h,0f8h,000h,099h,065h,001h,0fah,002h,002h,0adh,009h,009h	; 7bb3  ...R............e.......
	defb 04fh,040h,040h,0bfh,0bfh,0bfh,068h,000h,000h,0bfh,040h,000h,054h,020h,000h,07fh,040h,040h,01fh,01fh,01fh,080h,000h,000h	; 7bcb  O@@...h...@.T ..@@......
	defb 05bh,003h,003h,0feh,0feh,0feh,005h,001h,001h,0fbh,002h,002h,085h,001h,001h,06bh,003h,003h,0feh,0feh,0feh,000h,000h,000h	; 7be3  [..............k........

; ----------------------------------------------------------------------
; DATOS dibujo_7BFB: 3 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 8 de la lista 0x702D (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (48 bytes)
;   0x7bfb..0x7c2b  (48 bytes)
DATA_dibujo_7BFB:
	defb 0ffh,000h,080h,07fh,01ch,0ddh,008h,0c9h,036h,0f7h,014h,0f7h,000h,0ffh,000h,0ffh	; 7bfb  ........6.......
	defb 0ffh,000h,000h,0ffh,0ffh,0ffh,000h,0ffh,000h,0cah,000h,0ffh,055h,0ffh,000h,0ffh	; 7c0b  ............U...
	defb 0ffh,000h,000h,0ffh,0fch,0ffh,000h,0ffh,000h,0bfh,000h,0ffh,0a0h,0ffh,000h,0ffh	; 7c1b  ................

; ----------------------------------------------------------------------
; DATOS dibujo_7C2B: 5 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 9 de la lista 0x705B (p00:4D92, p00:4DF5); lo leen p00:4C0C,
;   p00:4C26 (80 bytes)
;   0x7c2b..0x7c7b  (80 bytes)
DATA_dibujo_7C2B:
	defb 000h,0ffh,018h,0f8h,000h,0ffh,018h,0f8h,000h,0ffh,018h,0f8h,000h,0ffh,018h,0f8h	; 7c2b  ................
	defb 02eh,0c4h,02eh,0c4h,016h,0e4h,098h,060h,0c8h,0a0h,076h,00ah,0eeh,042h,0f6h,04ah	; 7c3b  .......`..v..B.J
	defb 0b5h,0e1h,03eh,00ch,0ffh,0ffh,0aah,0aah,000h,000h,000h,000h,000h,000h,025h,000h	; 7c4b  ..>...........%.
	defb 0bdh,097h,07ch,030h,0ffh,0ffh,0aah,0aah,000h,000h,000h,000h,020h,000h,005h,000h	; 7c5b  ..|0........ ...
	defb 00ch,0f0h,06ch,010h,00ah,0f4h,06ah,014h,00ah,0f4h,06ah,014h,00ah,0f4h,06ah,014h	; 7c6b  ..l...j...j...j.

; ----------------------------------------------------------------------
; DATOS dibujo_7C7B: 17 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 10 de la lista 0x705B (p00:4D92, p00:4DF5); se solapan 12
;   bloques: (dibujo_7DFB 7DFB-7F03) (dibujo_7DFB 7DFB-7F03) (dibujo_7DFB
;   7DFB-7F03) (dibujo_7DFB 7DFB-7F03) (dibujo_7DFB 7DFB-7F03) (dibujo_7DFB
;   7DFB-7F03) (dibujo_7DFB 7DFB-7F03) (dibujo_7DFB 7DFB-7F03) (dibujo_7DFB
;   7DFB-7F03) (dibujo_7DFB 7DFB-7F03) (dibujo_7DFB 7DFB-7F03); lo leen
;   p00:4C0C, p00:4C26 (648 bytes)
;   0x7c7b..0x7f03  (648 bytes)
DATA_dibujo_7C7B:
	defb 087h,0ffh,000h,0bdh,0f9h,006h,0bbh,0fbh,014h,0abh,0ebh,004h,0abh,0fbh,004h,0abh,0fbh,004h,0bbh,0fbh,004h,0bbh,0fbh,004h	; 7c7b  ........................
	defb 083h,083h,004h,0bbh,0fbh,004h,0bbh,0fbh,014h,0abh,0ebh,004h,0abh,0fbh,004h,0abh,0fbh,004h,0bbh,0fbh,004h,0bbh,0fbh,004h	; 7c93  ........................
	defb 0ffh,0ffh,000h,0ffh,0ffh,000h,000h,0ffh,000h,055h,055h,0aah,0aah,0ffh,000h,000h,0aah,000h,0ffh,0ffh,0ffh,0dfh,0dfh,080h	; 7cab  .........UU.............
	defb 0f4h,0feh,000h,0f4h,0feh,000h,004h,0feh,000h,050h,056h,0a8h,0a8h,0feh,000h,000h,0aah,000h,0f8h,0feh,0f8h,06ch,0feh,00ch	; 7cc3  .........PV..........l..
	defb 057h,0ffh,000h,041h,0d7h,001h,06ah,0ebh,002h,042h,0ebh,002h,06ah,0ffh,002h,002h,0d7h,02ah,02ah,0ffh,002h,028h,0d7h,028h	; 7cdb  W..A..j..B..j....**..(.(
	defb 0fdh,0ffh,001h,0ffh,0ffh,0ffh,07ah,07bh,082h,07ah,07bh,082h,07ah,07bh,082h,082h,003h,0fah,0c2h,0fbh,002h,0bah,0bbh,042h	; 7cf3  ......z{.z{.z{.........B
	defb 0a0h,0a7h,040h,0bfh,0bfh,040h,0d2h,092h,06dh,080h,0bfh,040h,000h,052h,080h,01ah,063h,09ch,0beh,0e7h,018h,09dh,0ffh,000h	; 7d0b  ..@..@..m..@.R..c.......
	defb 0c2h,0eeh,042h,0cah,0feh,0c2h,042h,0eeh,042h,04ah,0feh,042h,0c2h,0eeh,042h,04ah,0feh,042h,0c2h,0eeh,042h,04ah,07eh,0c2h	; 7d23  ..B...B.BJ.B..BJ.B..BJ~.
	defb 082h,0beh,001h,0c1h,0c1h,040h,0cch,0deh,040h,0e1h,0e1h,061h,0cch,0deh,040h,0c1h,0cdh,041h,0ceh,0deh,04eh,0d0h,0d1h,050h	; 7d3b  .....@..@..a..@..A..N..P
	defb 002h,0d7h,02ah,042h,0d7h,028h,040h,0d7h,028h,042h,0cbh,024h,040h,0d7h,020h,048h,0c9h,010h,062h,0e3h,00ch,000h,0ffh,000h	; 7d53  ..*B.(@.(B.$@. H..b.....
	defb 000h,0d5h,000h,054h,0fdh,000h,000h,095h,000h,03eh,0ffh,03eh,06bh,0ffh,07fh,0d5h,0ffh,0ffh,041h,0ffh,07fh,069h,057h,0ffh	; 7d6b  ...T.....>.>k.....A..iW.
	defb 0d5h,0ffh,07fh,055h,0ffh,07fh,0dfh,0ffh,0ffh,0ffh,0ffh,0ffh,06bh,0ffh,07fh,055h,0ffh,07fh,0c1h,0ffh,0ffh,069h,0d7h,07fh	; 7d83  ...U........k..U.....i..
	defb 0e1h,0dfh,07fh,055h,07fh,0ffh,0d5h,0ffh,07fh,055h,0ffh,07fh,07fh,0ffh,07fh,0dfh,0ffh,0ffh,07fh,0ffh,07fh,03eh,0beh,03eh	; 7d9b  ...U.....U...........>.>
	defb 0c3h,0bfh,0feh,0aah,0feh,0ffh,0abh,0ffh,0feh,0aah,0ffh,0feh,0feh,0ffh,0feh,0bfh,0ffh,0ffh,0feh,0feh,0feh,07eh,07eh,07eh	; 7db3  .....................~~~
	defb 0abh,0ffh,0feh,0aah,0ffh,0feh,0beh,0ffh,0feh,0ffh,0ffh,0ffh,056h,07eh,07eh,0aah,0feh,0feh,083h,0ffh,0ffh,0d2h,0afh,0feh	; 7dcb  ............V~~.........
	defb 0c2h,0eeh,042h,0cah,0eeh,082h,086h,0eeh,006h,07eh,0feh,07eh,0d6h,0feh,0feh,0abh,0ffh,0ffh,082h,0ffh,0feh,0d3h,0afh,0feh	; 7de3  ..B......~.~............
	defb 06ah,07bh,082h,082h,0fbh,002h,083h,0fbh,003h,082h,0fah,002h,08bh,0fbh,002h,072h,0fbh,002h,086h,0f6h,086h,089h,089h,089h	; 7dfb  j{.............r........
	defb 0e2h,0eeh,061h,07fh,0ffh,03fh,03fh,0ffh,000h,080h,0ffh,080h,07fh,07fh,07fh,0c0h,0c0h,000h,02eh,0eeh,010h,09fh,09fh,09fh	; 7e13  ..a..??.................
	defb 024h,02fh,020h,026h,0efh,020h,0e3h,0fbh,0a4h,042h,06bh,004h,002h,02bh,044h,065h,06fh,021h,022h,067h,020h,045h,06fh,041h	; 7e2b  $/ &. ...Bk..+Deo!"g EoA
	defb 044h,074h,004h,064h,0f7h,004h,0a7h,0bfh,045h,022h,0b6h,040h,020h,0b4h,042h,026h,076h,004h,044h,0e6h,004h,022h,076h,002h	; 7e43  Dt.d....E".@ .B&v.D.."v.
	defb 03fh,0ffh,000h,072h,0e2h,01dh,077h,0d7h,028h,057h,0d7h,028h,057h,0d7h,028h,057h,0d7h,028h,057h,0d7h,028h,057h,0d7h,028h	; 7e5b  ?..r..w.(W.(W.(W.(W.(W.(
	defb 057h,0d7h,028h,057h,0d7h,028h,041h,0dfh,020h,061h,0e0h,01fh,01eh,0deh,021h,040h,0deh,021h,060h,0e0h,01fh,017h,0d7h,028h	; 7e73  W.(W.(A. a....!@.!`....(
	defb 0ffh,0ffh,000h,0ffh,0ffh,000h,000h,000h,002h,044h,085h,07ah,03ch,0bdh,042h,000h,0fdh,002h,040h,000h,0ffh,0ebh,0d5h,014h	; 7e8b  .........D.z<.B...@.....
	defb 057h,0d7h,028h,057h,0d7h,028h,057h,0d7h,028h,057h,0d7h,028h,05fh,099h,03dh,07fh,0b3h,03bh,07fh,0e6h,066h,04ch,0ffh,07fh	; 7ea3  W.(W.(W.(W.(_.=.....fL..
	defb 0bbh,0fbh,004h,083h,0c3h,03ch,0feh,0ffh,000h,0feh,0ffh,000h,0feh,09bh,0dch,0feh,033h,0b8h,0feh,067h,064h,0ceh,0ffh,0fch	; 7ebb  .....<..........3..gd...
	defb 0f4h,0feh,000h,0f4h,0feh,000h,004h,006h,004h,086h,006h,0fah,0fah,0feh,000h,004h,0feh,004h,006h,006h,0fah,0f6h,03eh,000h	; 7ed3  ......................>.
	defb 0bah,0bbh,042h,082h,083h,07ah,07ah,07bh,082h,07ah,05bh,092h,05ah,07bh,0b2h,07ah,07bh,0b2h,07ah,07bh,082h,082h,0fbh,002h	; 7eeb  ..B..zz{.z[.Z{.z{.z{....

; ----------------------------------------------------------------------
; DATOS dibujo_7F03: 7 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 3 de la lista 0x7098 (p00:4D92, p00:4DF5); lo leen p00:4C0C
;   (168 bytes)
;   0x7f03..0x7fab  (168 bytes)
DATA_dibujo_7F03:
	defb 09fh,09fh,09fh,090h,090h,090h,0a0h,0a0h,0a0h,0e4h,0e0h,0e0h,0c0h,0c0h,0c0h,0d0h,0c0h,0c0h,082h,080h,080h,080h,080h,080h	; 7f03  ........................
	defb 000h,000h,000h,023h,008h,008h,003h,000h,000h,043h,004h,004h,00fh,000h,000h,017h,008h,008h,01dh,022h,022h,07fh,000h,000h	; 7f1b  ...#.....C.........""...
	defb 0fdh,0feh,0fch,00dh,00eh,00ch,025h,006h,004h,007h,004h,004h,003h,002h,002h,043h,002h,002h,009h,001h,001h,001h,001h,001h	; 7f33  ......%........C........
	defb 000h,000h,000h,004h,000h,000h,041h,001h,000h,001h,003h,001h,010h,002h,000h,042h,003h,002h,005h,021h,021h,000h,000h,000h	; 7f4b  ......A........B...!!...
	defb 028h,008h,000h,008h,05ch,008h,054h,0f7h,054h,083h,0a3h,083h,020h,03fh,020h,01fh,0dfh,01fh,0c0h,0ffh,0c0h,03eh,03eh,03eh	; 7f63  (...\.T.T... ? ......>>>
	defb 0fah,0deh,0dah,07bh,06fh,06bh,01bh,00ah,008h,0f0h,092h,090h,0e1h,0e2h,0e0h,002h,006h,002h,0c6h,0bfh,087h,078h,078h,078h	; 7f7b  ...{ok...............xxx
	defb 000h,000h,000h,080h,000h,000h,000h,000h,000h,03ah,000h,000h,0bfh,040h,040h,0fbh,004h,004h,0bfh,040h,000h,0f7h,008h,008h	; 7f93  .........:...@@....@....

; ----------------------------------------------------------------------
; DATOS dibujo_7FAB: 6 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 4 de la lista 0x7098 (p00:4D92, p00:4DF5) (sigue en el banco
;   33, en 0x8000); lo leen p00:4C0C (85 bytes)
;   0x7fab..0x8000  (85 bytes)
DATA_dibujo_7FAB:
	defb 0fbh,0fdh,083h,0fdh,083h,0fdh,083h,0fdh,083h,0fdh,083h,0fdh,002h,0fdh,0ffh,000h	; 7fab  ................
	defb 012h,03ch,052h,0bch,092h,03ch,052h,0bch,092h,03ch,052h,0bch,092h,03ch,052h,0bch	; 7fbb  .<R..<R..<R..<R.
	defb 0ffh,000h,0fdh,0feh,0fdh,0feh,0f9h,0feh,002h,0fch,002h,0fch,002h,0fch,0feh,000h	; 7fcb  ................
	defb 0ffh,000h,0ffh,07fh,0ffh,07fh,0ffh,07fh,000h,06ah,000h,06ah,000h,07fh,07fh,000h	; 7fdb  .........j.j....
	defb 080h,0ffh,080h,0ffh,080h,0d4h,083h,0d5h,0aah,0d5h,0abh,0d4h,080h,0ffh,0ffh,000h	; 7feb  ................
	defb 000h,0ffh,000h,0ffh,000h	; 7ffb
