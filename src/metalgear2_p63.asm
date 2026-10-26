; ==========================================================================
; METAL GEAR 2 SOLID SNAKE - Konami (1990) - MSX2 - MegaROM RC-767 de 512 KB (Konami SCC) - banco 63 (se ejecuta en 0xa000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x0a000


; ----------------------------------------------------------------------
; DATOS mapa_de_bits_8000_cola: mapa de bits de 112 filas de 80 bytes (dos
;   puntos por byte) que p01:6ED6 copia a la VRAM, 128 bytes por fila
;   (p00:4486) (sigue del banco 62); lo leen p01:6E54 (768 bytes)
;   0xa000..0xa300  (768 bytes)
DATA_mapa_de_bits_8000_cola:
	defb 026h,066h,066h,066h,066h,066h,066h,067h,071h,011h,011h,012h,022h,022h,023h,022h	; a000  &ffffffgq...""#"
	defb 023h,033h,022h,022h,022h,022h,021h,000h,011h,000h,000h,000h,006h,011h,042h,020h	; a010  #3""""!.......B
	defb 000h,000h,066h,066h,066h,000h,012h,011h,031h,022h,022h,022h,022h,011h,011h,011h	; a020  ..fff...1""""...
	defb 000h,000h,000h,000h,001h,011h,088h,028h,088h,098h,08dh,0eeh,099h,0aah,0aah,09dh	; a030  .......(........
	defb 0aah,0aah,0aah,0a9h,0dah,0a9h,008h,021h,011h,000h,001h,012h,022h,022h,022h,022h	; a040  .......!....""""
	defb 026h,066h,066h,066h,066h,066h,066h,067h,077h,011h,011h,022h,022h,033h,033h,033h	; a050  &ffffffgw..""333
	defb 033h,033h,033h,022h,022h,022h,020h,000h,001h,010h,000h,000h,000h,033h,013h,000h	; a060  333""" ......3..
	defb 000h,000h,066h,066h,066h,060h,001h,021h,003h,012h,022h,022h,021h,011h,011h,011h	; a070  ..fff`.!..""!...
	defb 000h,010h,000h,000h,000h,011h,018h,082h,088h,089h,088h,0deh,0e9h,09ah,0aah,0a9h	; a080  ................
	defb 0aah,0aah,0aah,09dh,0aah,090h,088h,021h,010h,000h,011h,022h,022h,022h,022h,022h	; a090  .......!..."""""
	defb 026h,066h,066h,066h,066h,066h,066h,067h,077h,072h,023h,033h,033h,033h,033h,033h	; a0a0  &ffffffgwr#33333
	defb 033h,033h,033h,033h,022h,022h,020h,000h,001h,011h,000h,000h,003h,034h,030h,000h	; a0b0  3333"" ......40.
	defb 000h,000h,006h,066h,066h,066h,000h,012h,010h,011h,022h,022h,011h,011h,011h,011h	; a0c0  ...fff....""....
	defb 001h,000h,010h,000h,000h,001h,011h,088h,022h,088h,099h,08dh,0eeh,099h,0aah,0aah	; a0d0  ........".......
	defb 0aah,0aah,0a9h,0dah,0a9h,020h,081h,022h,000h,001h,011h,022h,022h,022h,022h,022h	; a0e0  ..... ."..."""""
	defb 022h,066h,066h,066h,066h,066h,066h,077h,077h,077h,022h,033h,033h,033h,033h,033h	; a0f0  "ffffffwww"33333
	defb 033h,033h,033h,033h,032h,022h,000h,000h,000h,000h,000h,000h,000h,044h,000h,006h	; a100  33332".......D..
	defb 000h,000h,006h,066h,066h,066h,060h,001h,022h,013h,012h,021h,011h,011h,011h,011h	; a110  ...fff`."..!....
	defb 010h,011h,000h,020h,011h,000h,001h,011h,082h,028h,088h,098h,0deh,0e9h,09ah,0aah	; a120  ... .....(......
	defb 0aah,0aah,09dh,0aah,090h,028h,011h,020h,000h,011h,011h,012h,022h,022h,022h,022h	; a130  .....(. ....""""
	defb 022h,066h,066h,066h,066h,066h,066h,077h,077h,077h,072h,022h,033h,033h,033h,033h	; a140  "ffffffwwwr"3333
	defb 033h,033h,033h,033h,032h,022h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a150  33332"..........
	defb 066h,000h,000h,066h,066h,060h,000h,000h,012h,020h,031h,021h,011h,012h,022h,011h	; a160  f..ff`... 1!..".
	defb 011h,010h,002h,001h,011h,010h,000h,011h,011h,082h,088h,089h,08dh,0deh,099h,0aah	; a170  ................
	defb 0aah,0a9h,0dah,0a9h,080h,021h,012h,000h,001h,011h,011h,011h,022h,022h,022h,022h	; a180  .....!......""""
	defb 022h,026h,066h,066h,066h,066h,067h,077h,077h,077h,066h,062h,022h,033h,033h,033h	; a190  "&ffffgwwwfb"333
	defb 033h,033h,033h,033h,022h,020h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a1a0  3333" ..........
	defb 006h,066h,000h,066h,066h,000h,000h,000h,001h,022h,001h,011h,012h,022h,022h,022h	; a1b0  .f.ff...."..."""
	defb 011h,000h,020h,012h,021h,011h,000h,000h,011h,018h,022h,088h,098h,08dh,0eeh,099h	; a1c0  .. .!.....".....
	defb 0aah,09dh,0aah,098h,008h,021h,010h,000h,011h,011h,011h,011h,022h,022h,022h,022h	; a1d0  .....!......""""
	defb 022h,037h,076h,066h,066h,066h,077h,077h,077h,077h,066h,066h,022h,033h,033h,033h	; a1e0  "7vfffwwwwff"333
	defb 033h,033h,033h,032h,022h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a1f0  3332"...........
	defb 000h,006h,060h,006h,000h,000h,000h,000h,000h,012h,010h,030h,000h,012h,022h,022h	; a200  ..`........0..""
	defb 000h,011h,002h,012h,011h,011h,000h,000h,001h,011h,082h,022h,089h,088h,0deh,0e9h	; a210  ..........."....
	defb 0a9h,0dah,0a9h,080h,081h,021h,000h,001h,011h,011h,011h,011h,012h,022h,022h,022h	; a220  .....!......."""
	defb 022h,033h,077h,077h,077h,077h,077h,077h,077h,077h,066h,066h,062h,023h,033h,033h	; a230  "3wwwwwwwwffb#33
	defb 033h,033h,032h,022h,022h,000h,000h,000h,000h,006h,060h,000h,000h,000h,000h,000h	; a240  332"".....`.....
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,001h,000h,003h,000h,000h,012h,022h	; a250  ..............."
	defb 001h,020h,021h,011h,011h,020h,011h,010h,000h,011h,018h,082h,022h,099h,08dh,0eeh	; a260  . !.. ......"...
	defb 09dh,0aah,098h,008h,021h,010h,000h,011h,011h,011h,011h,011h,012h,022h,022h,022h	; a270  ....!........"""
	defb 023h,033h,037h,077h,077h,077h,077h,077h,077h,076h,066h,066h,062h,022h,033h,033h	; a280  #37wwwwwwvffb"33
	defb 033h,033h,033h,022h,020h,000h,000h,000h,006h,066h,066h,000h,000h,000h,000h,000h	; a290  333" ....ff.....
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,010h,000h,010h,000h,000h,011h	; a2a0  ................
	defb 012h,001h,022h,011h,012h,001h,016h,011h,000h,001h,011h,088h,082h,029h,098h,0deh	; a2b0  .."..........)..
	defb 0eah,099h,080h,082h,021h,000h,001h,011h,011h,011h,011h,011h,012h,022h,022h,022h	; a2c0  ....!........"""
	defb 033h,033h,033h,077h,077h,077h,077h,077h,077h,066h,066h,066h,066h,022h,023h,033h	; a2d0  333wwwwwwffff"#3
	defb 033h,033h,033h,022h,010h,000h,000h,000h,006h,066h,066h,060h,000h,011h,010h,000h	; a2e0  333".....ff`....
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,001h,000h,003h,000h,000h,001h	; a2f0  ................

; ----------------------------------------------------------------------
; DATOS rachas_A300: rachas de p00:51E0 (n < 0x80 repite, n > 0x80 copia n &
;   0x7F, 0 acaba) que p01:6EC9 deshace en 0xD000 y copia como 0x80 filas de
;   0x40 bytes; lo leen p01:6ED0 (3788 bytes)
;   0xa300..0xb1cc  (3788 bytes)
DATA_rachas_A300:
	defb 07fh,0cch,02ah,0cch,084h,0c4h,045h,055h,054h,03bh,0cch,086h,0c3h,044h,056h,066h	; a300  ..*...EUT....DVf
	defb 065h,05ch,03ah,0cch,086h,035h,055h,066h,065h,055h,045h,039h,0cch,088h,0c3h,054h	; a310  e\:..5UfeUE9...T
	defb 011h,033h,036h,065h,054h,03ch,038h,0cch,088h,0c4h,011h,022h,044h,043h,036h,044h	; a320  .36eT<8...."DC6D
	defb 032h,039h,0cch,087h,012h,034h,044h,033h,013h,062h,043h,038h,0cch,088h,0c1h,023h	; a330  29...4D3.bC8...#
	defb 045h,043h,032h,021h,035h,022h,038h,0cch,088h,011h,023h,054h,043h,032h,012h,0c4h	; a340  EC2!5"8...#TC2..
	defb 042h,037h,0cch,089h,0c1h,012h,034h,054h,033h,021h,011h,0c3h,022h,037h,0cch,089h	; a350  B7....4T3!.."7..
	defb 0c1h,023h,045h,043h,032h,021h,01ch,01ch,02ch,037h,0cch,089h,011h,023h,054h,043h	; a360  .#EC2!..,7...#TC
	defb 032h,011h,0cch,0cch,02ch,036h,0cch,08ah,0c1h,012h,034h,064h,033h,022h,011h,0cch	; a370  2...,6....4d3"..
	defb 0cch,01ch,036h,0cch,08ah,0c1h,023h,045h,043h,032h,021h,01ch,0cch,0cch,01ch,036h	; a380  ..6...#EC2!....6
	defb 0cch,089h,011h,023h,064h,043h,032h,011h,0cch,0cch,0c1h,036h,0cch,08ah,0c1h,012h	; a390  ...#dC2....6....
	defb 034h,054h,033h,022h,011h,0cch,0cch,01ch,022h,0cch,083h,0a2h,072h,0a3h,011h,0cch	; a3a0  4T3"...."...r...
	defb 08ah,0c1h,023h,046h,043h,032h,021h,01ch,0cch,0cch,01ch,021h,0cch,081h,073h,003h	; a3b0  ..#FC2!....!..s.
	defb 041h,081h,073h,010h,0cch,089h,011h,023h,054h,043h,032h,011h,0cch,0cch,0c1h,021h	; a3c0  A.s....#TC2....!
	defb 0cch,082h,073h,041h,003h,0cch,086h,041h,0a3h,042h,0c7h,03ch,073h,00ah,0cch,08ah	; a3d0  ..sA...A.B.<s...
	defb 0c1h,012h,034h,064h,033h,022h,011h,0cch,0cch,01ch,020h,0cch,082h,0c1h,041h,004h	; a3e0  ..4d3".... ...A.
	defb 0cch,088h,072h,041h,073h,022h,011h,041h,017h,03ch,008h,0cch,08ah,0c1h,013h,045h	; a3f0  ..rAs".A.<.....E
	defb 043h,032h,021h,01ch,0cch,0cch,01ch,020h,0cch,081h,073h,003h,0cch,09bh,0c7h,031h	; a400  C2!.... ..s....1
	defb 041h,0cch,041h,073h,0cch,0cch,0c4h,011h,073h,0c7h,027h,027h,03ch,0b2h,0b3h,0cch	; a410  A.As....s.''<...
	defb 011h,023h,064h,043h,032h,011h,0cch,0cch,0c1h,021h,0cch,086h,021h,0cch,0cch,073h	; a420  .#dC2....!..!..s
	defb 014h,01ch,003h,0cch,082h,041h,073h,003h,0cch,081h,041h,003h,014h,08dh,011h,041h	; a430  .....As...A....A
	defb 04ch,0c1h,011h,034h,064h,033h,022h,011h,0cch,0cch,01ch,020h,0cch,085h,0c7h,03ch	; a440  L..4d3".... ...<
	defb 0c7h,031h,041h,006h,0cch,083h,041h,017h,03ch,005h,0cch,08dh,0b3h,0cbh,03ch,0c1h	; a450  .1A...A.<.....<.
	defb 023h,035h,043h,032h,021h,01ch,0cch,0cch,01ch,020h,0cch,084h,0c2h,01ch,014h,01ch	; a460  #5C2!.... ......
	defb 008h,0cch,093h,0c4h,017h,027h,03ch,073h,0cbh,031h,041h,014h,0cch,011h,023h,054h	; a470  .....'<s.1A...#T
	defb 043h,032h,011h,0cch,0cch,0c1h,021h,0cch,002h,073h,00bh,0cch,086h,0c4h,014h,011h	; a480  C2....!..s......
	defb 041h,014h,01ch,003h,0cch,089h,012h,033h,054h,033h,022h,011h,0cch,0cch,01ch,020h	; a490  A......3T3"....
	defb 0cch,083h,0c7h,041h,041h,013h,0cch,08ah,0c1h,023h,045h,043h,032h,021h,01ch,0cch	; a4a0  ...AA....#EC2!..
	defb 0cch,01ch,020h,0cch,082h,0c1h,01ch,00bh,0cch,082h,0c1h,011h,006h,0cch,002h,011h	; a4b0  .. .............
	defb 088h,024h,044h,043h,032h,011h,0cch,0cch,0c1h,020h,0cch,083h,0c7h,037h,03ch,00ah	; a4c0  .$DC2.... ...7<.
	defb 0cch,085h,0c1h,012h,022h,025h,043h,003h,0cch,08bh,013h,022h,011h,011h,033h,032h	; a4d0  ...."%C...."..32
	defb 022h,011h,0cch,0cch,01ch,01fh,0cch,084h,0c7h,024h,014h,01ch,00bh,0cch,002h,011h	; a4e0  "........$......
	defb 089h,024h,044h,044h,042h,021h,034h,054h,043h,033h,003h,011h,085h,01ch,0cch,0cch	; a4f0  .$DDB!4TC3......
	defb 01ch,0b3h,01eh,0cch,083h,0c4h,01ch,073h,00dh,0cch,092h,011h,01ch,0c3h,033h,022h	; a500  .......s......3"
	defb 013h,045h,045h,044h,044h,043h,031h,011h,0cch,0cch,0c1h,0cch,041h,00bh,0cch,083h	; a510  .EEDDC1.....A...
	defb 0b3h,0c7h,03ch,00fh,0cch,084h,073h,01ch,0cch,041h,012h,0cch,09bh,0c2h,022h,033h	; a520  ..<...s..A...."3
	defb 045h,045h,044h,042h,01ch,0cch,0cch,01ch,0cch,0cch,073h,0c7h,03ch,0cch,0cch,073h	; a530  EEDB......s.<..s
	defb 0cbh,03ch,0cch,0c7h,031h,041h,014h,01ch,00fh,0cch,084h,041h,0cch,0cch,01ch,00dh	; a540  .<..1A.....A....
	defb 0cch,002h,0c2h,081h,04ch,004h,0cch,09ah,0c2h,022h,023h,045h,042h,021h,0cch,0cch	; a550  ....L...."#EB!..
	defb 01ch,0cch,0cch,041h,014h,011h,072h,073h,041h,014h,01ch,0c7h,022h,0a3h,0cch,0cch	; a560  ...A..rsA..."...
	defb 0c7h,03ch,00ch,0cch,086h,0c7h,031h,0cch,0cch,0c7h,03ch,00dh,0cch,083h,0c1h,034h	; a570  .<....1...<....4
	defb 02ch,006h,0cch,086h,0c2h,022h,022h,033h,01ch,0c1h,004h,0cch,08eh,073h,0cch,021h	; a580  ,....""3.....s.!
	defb 041h,0cch,0cch,073h,014h,01ch,041h,0cch,0cch,0c4h,01ch,00ch,0cch,086h,0c4h,01ch	; a590  A..s..A.........
	defb 0cch,0cch,0c2h,01ch,018h,0cch,083h,012h,034h,041h,005h,0cch,087h,041h,037h,03ch	; a5a0  ........4A...A7<
	defb 0cch,0cch,072h,041h,003h,0cch,085h,063h,0cch,0cch,0c7h,03ch,00ah,0cch,082h,073h	; a5b0  ..rA...c...<...s
	defb 01ch,003h,0cch,081h,073h,019h,0cch,084h,0c1h,023h,044h,011h,005h,0cch,08eh,0c4h	; a5c0  ....s....#D.....
	defb 017h,04ch,0cch,021h,0cch,0cch,0c7h,03ch,042h,0cch,0cch,0c4h,01ch,00ah,0cch,081h	; a5d0  .L.!...<B.......
	defb 041h,004h,0cch,081h,021h,010h,0cch,003h,011h,081h,01ch,006h,0cch,084h,012h,035h	; a5e0  A...!..........5
	defb 044h,011h,005h,0cch,08dh,0c4h,01ch,0c7h,04ch,0cch,073h,014h,01bh,02ah,03ch,0cch	; a5f0  D.......L.s..*<.
	defb 0cch,01ch,009h,0cch,081h,073h,004h,0cch,082h,0c7h,03ch,00fh,0cch,087h,0c1h,012h	; a600  .....s....<.....
	defb 022h,022h,021h,011h,011h,004h,0cch,086h,0c1h,023h,055h,044h,011h,01ch,004h,0cch	; a610  ""!......#UD....
	defb 08ch,0b4h,0c4h,01ch,0cch,021h,0cch,0c4h,014h,01ch,0cch,0cch,073h,009h,0cch,081h	; a620  .....!......s...
	defb 041h,004h,0cch,082h,0c2h,01ch,00fh,0cch,084h,0c1h,022h,012h,012h,003h,022h,002h	; a630  A........."...".
	defb 011h,003h,0cch,086h,011h,033h,055h,044h,041h,01ch,003h,0cch,08ch,041h,072h,0cch	; a640  .....3UDA....Ar.
	defb 0c7h,03ch,0cch,0cch,0cah,03ch,0cch,0cch,041h,008h,0cch,081h,073h,005h,0cch,081h	; a650  .<...<..A...s...
	defb 0a3h,010h,0cch,085h,012h,022h,031h,041h,021h,004h,022h,089h,011h,01ch,0cch,0cch	; a660  ....."1A!.".....
	defb 011h,033h,055h,064h,041h,003h,0cch,08ch,0c1h,021h,0cch,0c4h,01ch,0cch,0c7h,024h	; a670  .3UdA....!.....$
	defb 01ch,0cch,0cch,0c1h,008h,0cch,081h,041h,005h,0cch,081h,021h,00fh,0cch,09eh,0c1h	; a680  .......A...!....
	defb 012h,022h,023h,024h,024h,011h,021h,012h,022h,022h,021h,01ch,0cch,0cch,011h,013h	; a690  ."#$$.!.""!.....
	defb 035h,053h,01ch,0cch,0cch,0c7h,03ch,0cch,0c1h,0cch,0cch,0c4h,011h,003h,0cch,082h	; a6a0  5S....<.........
	defb 0c7h,03ch,006h,0cch,081h,073h,005h,0cch,082h,0c7h,03ch,00fh,0cch,083h,0c2h,033h	; a6b0  .<...s....<....3
	defb 033h,003h,022h,087h,044h,021h,041h,022h,033h,032h,021h,003h,0cch,08eh,0c1h,013h	; a6c0  3.".D!A"32!.....
	defb 033h,031h,0cch,0cch,0c4h,01ch,0cch,0c7h,027h,02bh,02ch,0a3h,003h,0cch,082h,0c4h	; a6d0  31......'+,.....
	defb 01ch,006h,0cch,081h,021h,005h,0cch,082h,0c2h,01ch,00fh,0cch,08dh,023h,022h,022h	; a6e0  ....!........#""
	defb 023h,033h,033h,022h,023h,024h,023h,033h,044h,054h,005h,0cch,08ch,011h,013h,0cch	; a6f0  #33"#$#3DT......
	defb 0cch,0c1h,0a3h,0c7h,034h,014h,014h,01ch,041h,004h,0cch,081h,01ch,005h,0cch,082h	; a700  ....4...A.......
	defb 0c7h,03ch,005h,0cch,081h,073h,00fh,0cch,084h,0c3h,045h,055h,052h,003h,022h,08bh	; a710  .<...s....EUR.".
	defb 034h,044h,033h,033h,034h,045h,042h,0cch,0cch,01ch,014h,004h,0cch,088h,0cbh,03ch	; a720  4D334EB........<
	defb 041h,0c4h,01ch,072h,0cch,0a4h,004h,0cch,082h,0c7h,03ch,005h,0cch,082h,0c4h,01ch	; a730  A..r......<.....
	defb 005h,0cch,081h,021h,00fh,0cch,084h,0c3h,065h,065h,022h,003h,033h,08ch,022h,021h	; a740  ...!....ee".3."!
	defb 044h,043h,044h,054h,021h,0cch,0cch,0c2h,053h,02ch,003h,0cch,088h,0c4h,01ch,0cah	; a750  DCDT!...S,......
	defb 03ch,0cch,021h,0a2h,041h,004h,0cch,082h,0c2h,01ch,005h,0cch,081h,0c1h,005h,0cch	; a760  <.!.A...........
	defb 082h,0cah,03ch,00fh,0cch,08eh,0c2h,046h,065h,023h,034h,013h,033h,033h,034h,022h	; a770  ..<....Fe#4.334"
	defb 014h,045h,044h,02ch,003h,0cch,081h,02ch,003h,0cch,088h,0c7h,03ch,0cch,0c2h,016h	; a780  .ED,...,....<...
	defb 03ch,0a3h,041h,005h,0cch,081h,073h,006h,0cch,081h,073h,005h,0cch,082h,0c2h,01ch	; a790  <.A...s...s.....
	defb 00eh,0cch,08fh,0c4h,05ch,026h,052h,033h,043h,032h,033h,033h,043h,044h,032h,024h	; a7a0  ....\&R3C233CD2$
	defb 042h,01ch,007h,0cch,088h,0c4h,01ch,0cch,073h,0c4h,01ch,041h,01ch,005h,0cch,081h	; a7b0  B.......s..A....
	defb 021h,006h,0cch,081h,021h,004h,0cch,082h,0cah,03ch,00fh,0cch,088h,0c5h,065h,065h	; a7c0  !...!....<....ee
	defb 022h,033h,031h,033h,033h,003h,034h,083h,043h,064h,042h,006h,0cch,086h,0c1h,017h	; a7d0  "3133.4.CdB.....
	defb 03ch,0cch,0cch,041h,003h,0cch,082h,0cbh,03ch,003h,0cch,082h,0c7h,03ch,006h,0cch	; a7e0  <..A....<....<..
	defb 081h,073h,004h,0cch,082h,0c4h,01ch,00fh,0cch,08eh,0c2h,046h,065h,023h,034h,033h	; a7f0  .s.........Fe#43
	defb 023h,033h,043h,043h,034h,043h,054h,021h,006h,0cch,085h,0a3h,014h,01ch,0cch,073h	; a800  #3CC4CT!.......s
	defb 004h,0cch,082h,0c4h,01ch,003h,0cch,082h,0c4h,01ch,006h,0cch,081h,041h,003h,0cch	; a810  .............A..
	defb 082h,0c7h,03ch,00fh,0cch,08fh,0c4h,05ch,026h,052h,033h,033h,023h,033h,034h,034h	; a820  ..<....\&R33#344
	defb 033h,034h,034h,065h,03ch,004h,0cch,083h,0c6h,031h,041h,003h,0cch,081h,041h,005h	; a830  344e<....1A...A.
	defb 0cch,085h,0c7h,03ch,0cch,0c7h,03ch,007h,0cch,086h,0c7h,03ch,0cch,0cah,024h,01ch	; a840  ...<..<....<..$.
	defb 00fh,0cch,08fh,0c5h,065h,065h,023h,033h,041h,032h,033h,043h,043h,033h,044h,035h	; a850  ....ee#3A23CC3D5
	defb 066h,04ch,004h,0cch,082h,0c4h,01ch,003h,0cch,081h,073h,006h,0cch,085h,0c4h,017h	; a860  fL........s.....
	defb 027h,024h,01ch,007h,0cch,085h,0c4h,017h,027h,024h,01ch,010h,0cch,08fh,0c2h,046h	; a870  '$......'$.....F
	defb 065h,023h,033h,032h,033h,034h,034h,033h,034h,043h,056h,066h,05ch,003h,0cch,087h	; a880  e#3234434CVf\...
	defb 0cah,03ch,0cch,0c7h,03ch,072h,041h,007h,0cch,083h,0c4h,014h,01ch,009h,0cch,083h	; a890  .<..<rA.........
	defb 0c4h,014h,01ch,010h,0cch,084h,0c4h,05ch,026h,052h,004h,033h,088h,043h,033h,033h	; a8a0  .......\&R.3.C33
	defb 034h,034h,066h,066h,05ch,003h,0cch,089h,0c4h,01ch,073h,014h,011h,041h,0c9h,099h	; a8b0  44ff\.....s..A..
	defb 09ch,024h,0cch,086h,0c5h,065h,065h,023h,034h,023h,005h,033h,085h,044h,035h,066h	; a8c0  .$...ee#4#.3.D5f
	defb 065h,02ch,003h,0cch,08ah,0c1h,0cch,041h,0cch,0cch,019h,098h,088h,089h,099h,023h	; a8d0  e,.....A.......#
	defb 0cch,086h,0c2h,046h,065h,023h,042h,012h,004h,033h,086h,034h,043h,056h,066h,065h	; a8e0  ...Fe#B..3.4CVfe
	defb 01ch,003h,0cch,086h,073h,0c7h,0cch,0cch,019h,098h,004h,088h,082h,099h,09ch,020h	; a8f0  ....s..........
	defb 0cch,087h,0c4h,05ch,026h,052h,033h,021h,014h,004h,033h,085h,044h,034h,066h,066h	; a900  ...\&R3!..3.D4ff
	defb 051h,004h,0cch,08dh,021h,0c1h,0cch,03ch,088h,0ddh,0d8h,088h,0d9h,099h,088h,099h	; a910  Q...!..<........
	defb 09ch,01fh,0cch,087h,0c5h,065h,065h,023h,034h,011h,024h,003h,033h,086h,034h,044h	; a920  .....ee#4.$.3.4D
	defb 035h,066h,065h,01ch,003h,0cch,08fh,0c7h,031h,073h,0a3h,0cch,08dh,0cch,0cdh,088h	; a930  5fe.....1s......
	defb 0d1h,011h,099h,088h,099h,09ch,01eh,0cch,087h,0c2h,046h,065h,023h,042h,012h,043h	; a940  ..........Fe#B.C
	defb 003h,033h,086h,044h,043h,056h,066h,064h,01ch,003h,0cch,090h,024h,01ch,051h,041h	; a950  .3.DCVfd....$.QA
	defb 063h,0a4h,025h,0cch,088h,0d1h,022h,011h,099h,088h,099h,09ch,01ch,0cch,087h,0c4h	; a960  c.%...".........
	defb 05ch,026h,052h,033h,021h,014h,003h,033h,003h,034h,002h,066h,081h,051h,003h,0cch	; a970  \&R3!..3.4.f.Q..
	defb 092h,0c7h,03ch,0cch,0cch,032h,08eh,052h,071h,06ch,088h,0d1h,022h,042h,011h,099h	; a980  ..<..2.Rql.."B..
	defb 088h,099h,09ch,01bh,0cch,087h,0c5h,065h,065h,023h,034h,021h,024h,003h,033h,086h	; a990  .......ee#4!$.3.
	defb 043h,034h,035h,066h,065h,01ch,003h,0cch,093h,014h,01ch,0cch,0cch,028h,0e1h,011h	; a9a0  C45fe........(..
	defb 04ch,051h,088h,0d1h,021h,014h,033h,011h,099h,088h,099h,09ch,01ah,0cch,094h,0c2h	; a9b0  LQ..!.3.........
	defb 046h,065h,023h,042h,012h,043h,033h,033h,034h,033h,043h,056h,066h,064h,01ch,0cch	; a9c0  Fe#B.C3343CVfd..
	defb 0cch,0c7h,03ch,003h,0cch,090h,018h,0e1h,054h,0c4h,011h,08dh,012h,014h,041h,043h	; a9d0  ..<.....T.....AC
	defb 022h,011h,099h,088h,099h,09ch,018h,0cch,087h,0c4h,05ch,026h,052h,033h,021h,014h	; a9e0  ".........\&R3!.
	defb 003h,033h,086h,043h,034h,034h,066h,066h,051h,003h,0cch,082h,0c2h,01ch,003h,0cch	; a9f0  .3.C44ffQ.......
	defb 091h,098h,0e1h,031h,011h,021h,08eh,012h,014h,033h,032h,032h,022h,011h,099h,088h	; aa00  ...1.!...322"...
	defb 099h,09ch,017h,0cch,090h,0c5h,065h,065h,023h,034h,021h,024h,033h,033h,034h,033h	; aa10  ......ee#4!$3343
	defb 034h,035h,066h,065h,01ch,003h,0cch,081h,0a3h,003h,0cch,093h,0c1h,099h,0e1h,053h	; aa20  45fe...........S
	defb 031h,01dh,08eh,012h,05ch,061h,053h,032h,031h,032h,011h,099h,088h,099h,09ch,016h	; aa30  1...\aS212......
	defb 0cch,087h,0c2h,046h,065h,023h,042h,012h,043h,004h,033h,085h,043h,056h,066h,064h	; aa40  ...Fe#B.C.3.CVfd
	defb 01ch,003h,0cch,081h,041h,003h,0cch,094h,0c1h,089h,08eh,011h,01dh,0d8h,0e1h,024h	; aa50  ....A..........$
	defb 033h,05ch,0c3h,0c3h,031h,043h,032h,021h,099h,088h,099h,09ch,014h,0cch,087h,0c4h	; aa60  3\..1C2!........
	defb 05ch,026h,052h,033h,021h,014h,004h,033h,002h,034h,002h,066h,081h,051h,004h,0cch	; aa70  \&R3!..3.4.f.Q..
	defb 081h,01ch,003h,0cch,094h,0c1h,089h,098h,0eeh,0e8h,088h,0e1h,051h,013h,035h,033h	; aa80  ............Q.53
	defb 0c3h,0c5h,041h,043h,032h,011h,099h,089h,099h,014h,0cch,087h,0c5h,065h,065h,023h	; aa90  ..AC2........ee#
	defb 034h,021h,024h,004h,033h,085h,044h,035h,066h,065h,01ch,003h,0cch,082h,0cah,03ch	; aaa0  4!$.3.D5fe.....<
	defb 003h,0cch,081h,0c8h,003h,099h,084h,098h,0eeh,012h,071h,003h,033h,08ah,053h,0c3h	; aab0  ..........q.3.S.
	defb 014h,0c4h,023h,031h,011h,098h,099h,09ch,013h,0cch,087h,0c2h,046h,065h,023h,042h	; aac0  ..#1........Fe#B
	defb 012h,043h,003h,033h,086h,034h,043h,056h,066h,064h,01ch,003h,0cch,082h,0c4h,01ch	; aad0  .C.3.4CVfd......
	defb 003h,0cch,095h,0c8h,099h,099h,098h,088h,0e1h,024h,061h,0c3h,031h,033h,033h,063h	; aae0  .........$a.133c
	defb 07ch,033h,042h,022h,011h,019h,089h,099h,012h,0cch,087h,0c4h,05ch,026h,052h,033h	; aaf0  |3B"........\&R3
	defb 021h,014h,004h,033h,085h,044h,034h,066h,066h,051h,005h,0cch,099h,01ch,0cch,0cch	; ab00  !..3.D4ffQ......
	defb 099h,0c8h,099h,098h,088h,0eeh,012h,044h,056h,053h,013h,031h,033h,033h,035h,033h	; ab10  .......DVS.13353
	defb 011h,032h,021h,011h,098h,099h,012h,0cch,087h,0c5h,065h,066h,023h,034h,021h,024h	; ab20  .2!.......ef#4!$
	defb 003h,033h,002h,034h,084h,035h,066h,065h,01ch,005h,0cch,09ah,063h,0c9h,099h,099h	; ab30  .3.4.5fe....c...
	defb 0c8h,099h,09eh,0eeh,011h,024h,044h,044h,043h,053h,0c4h,013h,013h,033h,033h,055h	; ab40  .....$DDCS...33U
	defb 032h,011h,011h,098h,099h,09ch,011h,0cch,087h,0c2h,046h,065h,023h,042h,012h,043h	; ab50  2.........Fe#B.C
	defb 004h,033h,085h,043h,056h,066h,064h,01ch,005h,0cch,09ah,041h,0c8h,099h,09ch,0c8h	; ab60  .3.CVfd....A....
	defb 099h,09dh,011h,022h,044h,044h,043h,033h,034h,05ch,033h,0c3h,013h,033h,032h,022h	; ab70  ..."DDC34\3..32"
	defb 011h,011h,019h,089h,09ch,010h,0cch,087h,0c4h,05ch,026h,052h,033h,021h,014h,003h	; ab80  .........\&R3!..
	defb 033h,003h,034h,002h,066h,081h,051h,006h,0cch,09ah,0c1h,07ch,011h,02ch,0cch,089h	; ab90  3.4.f.Q....|.,..
	defb 099h,082h,044h,044h,045h,064h,033h,033h,045h,03ch,035h,013h,033h,043h,022h,022h	; aba0  ..DDEd33E<5.3C""
	defb 011h,019h,089h,09ch,010h,0cch,087h,0c5h,045h,055h,023h,034h,021h,024h,003h,033h	; abb0  ........EU#4!$.3
	defb 086h,043h,044h,035h,066h,065h,01ch,005h,0cch,09bh,0c9h,0d8h,0c1h,033h,01ch,0cch	; abc0  .CD5fe.......3..
	defb 0d8h,099h,098h,022h,044h,044h,036h,063h,033h,033h,036h,036h,0cch,041h,013h,022h	; abd0  ..."DD6c3366.A."
	defb 022h,011h,019h,089h,09ch,010h,0cch,090h,0c2h,044h,054h,023h,032h,012h,053h,033h	; abe0  "........DT#2.S3
	defb 033h,034h,034h,043h,056h,066h,064h,01ch,005h,0cch,002h,09dh,092h,0c3h,05ch,052h	; abf0  344CVfd.......\R
	defb 0cch,0cdh,089h,099h,088h,022h,043h,044h,035h,063h,033h,033h,034h,073h,051h,003h	; ac00  ....."CD5c334sQ.
	defb 022h,084h,011h,019h,089h,09ch,010h,0cch,086h,042h,024h,052h,033h,035h,044h,003h	; ac10  "........B$R35D.
	defb 033h,086h,043h,044h,034h,066h,066h,051h,005h,0cch,091h,0c9h,0d9h,0dch,0c3h,0cch	; ac20  3.CD4ffQ........
	defb 052h,01ch,0cch,0d8h,089h,099h,088h,022h,033h,033h,035h,053h,003h,033h,081h,035h	; ac30  R......"335S.3.5
	defb 003h,022h,084h,011h,019h,089h,09ch,00fh,0cch,084h,0c2h,054h,044h,042h,006h,033h	; ac40  .".........TDB.3
	defb 086h,034h,044h,035h,066h,065h,01ch,005h,0cch,090h,0c9h,0d9h,0dch,011h,034h,022h	; ac50  .4D5fe........4"
	defb 01ch,099h,0cdh,0d8h,089h,099h,088h,022h,033h,034h,004h,033h,088h,023h,022h,011h	; ac60  ......."34.3.#".
	defb 012h,021h,018h,099h,09ch,00fh,0cch,084h,0c2h,045h,044h,023h,006h,033h,086h,044h	; ac70  .!.......ED#.3.D
	defb 043h,056h,066h,064h,01ch,005h,0cch,002h,09dh,099h,0c1h,031h,012h,023h,019h,099h	; ac80  CVfd.......1.#..
	defb 01ch,0cdh,0d8h,089h,099h,088h,022h,033h,043h,033h,043h,0c3h,032h,022h,011h,011h	; ac90  ......"3C3C.2"..
	defb 021h,09dh,099h,011h,0cch,083h,035h,044h,023h,005h,033h,086h,034h,044h,034h,066h	; aca0  !.....5D#.3.4D4f
	defb 066h,051h,006h,0cch,002h,09dh,08fh,011h,013h,033h,011h,099h,081h,011h,01ch,0cdh	; acb0  fQ.......3......
	defb 0d8h,089h,099h,088h,022h,033h,003h,043h,087h,0c3h,031h,021h,022h,011h,089h,099h	; acc0  ...."3.C..1!"...
	defb 010h,0cch,084h,0c4h,024h,044h,023h,005h,033h,086h,044h,034h,035h,066h,065h,01ch	; acd0  ....$D#.3.D45fe.
	defb 005h,0cch,09ch,0c9h,0d9h,08ch,0d1h,011h,011h,089h,099h,014h,0cch,011h,01ch,0cdh	; ace0  ................
	defb 0d8h,089h,099h,088h,022h,034h,0c3h,035h,053h,0c3h,031h,022h,019h,0d9h,099h,010h	; acf0  ...."4.5S.1"....
	defb 0cch,084h,025h,044h,044h,023h,004h,033h,002h,034h,085h,043h,056h,066h,064h,01ch	; ad00  ..%DD#.3.4.CVfd.
	defb 005h,0cch,09ch,0c9h,0d9h,088h,0cch,088h,088h,099h,091h,04ch,011h,0c1h,011h,01ch	; ad10  ...........L....
	defb 0cdh,0d8h,089h,099h,088h,022h,043h,041h,034h,052h,012h,022h,01dh,099h,09ch,010h	; ad20  ....."CA4R."....
	defb 0cch,084h,024h,054h,044h,023h,004h,033h,086h,043h,034h,034h,066h,066h,051h,006h	; ad30  ..$TD#.3.C44ffQ.
	defb 0cch,089h,0c9h,0d9h,088h,088h,089h,099h,011h,011h,04ch,004h,011h,08eh,01ch,0cdh	; ad40  ..........L.....
	defb 0d8h,089h,099h,088h,0cch,013h,013h,023h,022h,021h,0d9h,099h,011h,0cch,083h,023h	; ad50  .......#"!.....#
	defb 054h,042h,004h,033h,087h,034h,033h,044h,035h,066h,065h,01ch,006h,0cch,09bh,0c9h	; ad60  TB.3.43D5fe.....
	defb 0d9h,089h,099h,091h,011h,011h,022h,026h,0c2h,01ch,011h,011h,019h,09ch,0cdh,0d8h	; ad70  ......"&........
	defb 089h,099h,088h,022h,023h,022h,021h,01dh,099h,099h,011h,0cch,083h,0c2h,044h,042h	; ad80  ..."#"!.......DB
	defb 004h,033h,087h,043h,034h,043h,056h,066h,064h,01ch,006h,0cch,09bh,0c9h,0d9h,081h	; ad90  .3.C4CVfd.......
	defb 011h,012h,013h,022h,04ch,022h,024h,0c1h,0c1h,012h,029h,099h,09ch,0cdh,0d8h,089h	; ada0  ..."L"$...).....
	defb 099h,088h,082h,021h,018h,0d9h,099h,08ch,011h,0cch,083h,04ch,044h,042h,003h,033h	; adb0  ...!.......LDB.3
	defb 087h,034h,033h,044h,034h,066h,066h,051h,007h,0cch,09ah,0c9h,0d9h,089h,011h,013h	; adc0  .43D4ffQ........
	defb 022h,024h,0c2h,0c2h,024h,0cch,011h,011h,029h,089h,099h,0cch,0cdh,0d8h,089h,099h	; add0  "$..$...).......
	defb 098h,088h,089h,099h,098h,011h,0cch,084h,0c2h,054h,044h,042h,004h,033h,002h,034h	; ade0  .........TDB.3.4
	defb 084h,035h,066h,065h,01ch,007h,0cch,095h,0c9h,0d9h,089h,091h,011h,021h,014h,0c2h	; adf0  .5fe.........!..
	defb 022h,022h,042h,0cch,011h,012h,098h,099h,09ch,0cch,0cdh,0d8h,088h,003h,099h,082h	; ae00  ""B.............
	defb 098h,08ch,011h,0cch,084h,0c2h,045h,044h,023h,004h,033h,002h,043h,084h,056h,066h	; ae10  ......ED#.3.C.Vf
	defb 064h,01ch,008h,0cch,083h,09dh,098h,091h,003h,011h,08eh,06ch,022h,0c2h,05ch,011h	; ae20  d..........l".\.
	defb 011h,022h,098h,099h,09ch,0cch,0cch,0cdh,0ddh,003h,088h,081h,08dh,012h,0cch,084h	; ae30  ."..............
	defb 0c2h,035h,044h,023h,003h,033h,003h,034h,002h,066h,081h,051h,009h,0cch,090h,09dh	; ae40  .5D#.3.4.f.Q....
	defb 098h,099h,011h,012h,021h,022h,02ch,0c2h,022h,0c2h,011h,022h,029h,089h,099h,004h	; ae50  ....!",."..")...
	defb 0cch,003h,0ddh,013h,0cch,084h,04ch,024h,044h,023h,003h,033h,086h,043h,034h,035h	; ae60  ......L$D#.3.C45
	defb 066h,065h,01ch,009h,0cch,090h,0c9h,0d9h,089h,011h,022h,022h,026h,0c2h,02ch,026h	; ae70  fe........""&.,&
	defb 0c2h,01ch,022h,029h,089h,099h,019h,0cch,084h,0c2h,054h,044h,042h,005h,033h,087h	; ae80  ..")......TDB.3.
	defb 043h,056h,066h,064h,01ch,0cch,00ch,007h,0cch,084h,0c9h,0d9h,089h,092h,003h,022h	; ae90  CVfd..........."
	defb 08ah,043h,0c2h,022h,02ch,0c2h,023h,033h,098h,099h,09ch,018h,0cch,084h,0c2h,045h	; aea0  .C.",.#3.......E
	defb 044h,042h,003h,033h,086h,043h,034h,034h,066h,066h,051h,00bh,0cch,090h,09dh,098h	; aeb0  DB.3.C44ffQ.....
	defb 092h,022h,022h,032h,06ch,0cch,033h,02ch,044h,043h,033h,098h,099h,09ch,018h,0cch	; aec0  .""2l.3,DC3.....
	defb 08dh,0c2h,035h,044h,023h,033h,033h,034h,033h,034h,035h,066h,065h,01ch,00bh,0cch	; aed0  ..5D#334345fe...
	defb 084h,09dh,098h,099h,022h,003h,033h,089h,036h,0c4h,036h,0c4h,0c3h,033h,039h,089h	; aee0  ....".3.6.6..39.
	defb 099h,018h,0cch,08dh,04ch,024h,044h,023h,033h,033h,043h,033h,043h,056h,066h,064h	; aef0  ....L$D#33C3CVfd
	defb 01ch,00bh,0cch,090h,0c9h,0d9h,089h,022h,033h,033h,036h,06ch,044h,032h,02ch,0c3h	; af00  ......."336lD2,.
	defb 034h,039h,089h,099h,017h,0cch,08dh,0c2h,054h,044h,042h,033h,033h,034h,033h,034h	; af10  49......TDB33434
	defb 035h,066h,066h,051h,00ch,0cch,091h,0c9h,0d9h,089h,092h,033h,033h,044h,0c5h,04ch	; af20  5ffQ.......33D.L
	defb 044h,02ch,04ch,014h,042h,098h,099h,09ch,016h,0cch,08dh,0c2h,045h,044h,042h,033h	; af30  D,L.B.......EDB3
	defb 033h,043h,033h,043h,056h,066h,065h,01ch,00dh,0cch,090h,09dh,098h,092h,033h,044h	; af40  3C3CVfe.......3D
	defb 055h,047h,0c5h,0c4h,032h,0cch,014h,042h,098h,099h,09ch,017h,0cch,08ch,035h,044h	; af50  UG..2..B......5D
	defb 023h,033h,034h,033h,033h,043h,056h,066h,064h,01ch,00dh,0cch,090h,09dh,098h,099h	; af60  #3433CVfd.......
	defb 022h,045h,056h,066h,055h,0c4h,043h,022h,034h,044h,029h,089h,099h,015h,0cch,08dh	; af70  "EVfU.C"4D).....
	defb 0c2h,04ch,024h,044h,023h,033h,043h,033h,034h,035h,066h,066h,051h,00eh,0cch,090h	; af80  .L$D#3C345ffQ...
	defb 0c9h,0d9h,089h,024h,055h,066h,067h,0cch,055h,044h,033h,034h,044h,029h,089h,099h	; af90  ...$Ufg.UD34D)..
	defb 015h,0cch,084h,0c2h,044h,044h,042h,004h,033h,085h,043h,056h,066h,065h,01ch,00eh	; afa0  ....DDB.3.CVfe..
	defb 0cch,089h,0c9h,0d9h,089h,092h,045h,066h,074h,055h,06ch,004h,044h,083h,042h,098h	; afb0  ......EftUl.D.B.
	defb 099h,015h,0cch,084h,024h,054h,044h,052h,003h,033h,085h,034h,035h,066h,066h,051h	; afc0  ....$TDR.3.45ffQ
	defb 010h,0cch,08fh,09dh,098h,092h,034h,056h,067h,066h,0c5h,054h,044h,033h,044h,042h	; afd0  ......4Vgf.TD3DB
	defb 098h,099h,015h,0cch,08ch,024h,054h,045h,023h,034h,033h,033h,034h,035h,066h,065h	; afe0  .....$TE#43345fe
	defb 01ch,010h,0cch,08fh,09dh,098h,099h,026h,0cch,056h,067h,0c5h,044h,043h,033h,044h	; aff0  .......&.Vg.DC3D
	defb 042h,098h,099h,014h,0cch,08ch,0c2h,045h,044h,052h,033h,043h,033h,033h,043h,056h	; b000  B......EDR3C33CV
	defb 066h,051h,011h,0cch,088h,0c9h,0d9h,089h,02ch,054h,0c5h,055h,07ch,004h,044h,083h	; b010  fQ......,T.U|.D.
	defb 042h,098h,099h,014h,0cch,084h,0c2h,044h,044h,052h,003h,033h,085h,034h,035h,066h	; b020  B......DDR.3.45f
	defb 065h,041h,011h,0cch,08fh,0c9h,0d9h,089h,092h,045h,0c3h,054h,044h,044h,055h,054h	; b030  eA.......E.TDDUT
	defb 044h,029h,089h,089h,014h,0cch,084h,023h,054h,045h,023h,003h,033h,085h,043h,056h	; b040  D).....#TE#.3.CV
	defb 066h,054h,01ch,012h,0cch,08eh,09dh,098h,092h,0c4h,055h,033h,044h,055h,054h,044h	; b050  fT........U3DUTD
	defb 044h,029h,089h,089h,013h,0cch,084h,0c2h,034h,044h,052h,003h,033h,085h,044h,035h	; b060  D)......4DR.3.D5
	defb 066h,065h,041h,013h,0cch,086h,09dh,098h,099h,02ch,0cch,043h,004h,044h,084h,042h	; b070  feA......,.C.D.B
	defb 029h,089h,08ch,013h,0cch,08ch,0c2h,045h,045h,023h,033h,033h,034h,033h,046h,066h	; b080  )......EE#3343Ff
	defb 051h,01ch,013h,0cch,08eh,0c9h,0d9h,089h,025h,04ch,043h,034h,044h,044h,055h,032h	; b090  Q.......%LC4DDU2
	defb 098h,09dh,09ch,013h,0cch,08bh,023h,044h,045h,023h,033h,033h,043h,045h,066h,065h	; b0a0  ......#DE#33CEfe
	defb 01ch,014h,0cch,08eh,0c9h,0d9h,089h,092h,0c4h,033h,033h,034h,045h,033h,029h,088h	; b0b0  .........334E3).
	defb 09dh,09ch,012h,0cch,08bh,0c2h,034h,044h,052h,033h,033h,034h,034h,066h,065h,041h	; b0c0  ......4DR3344feA
	defb 016h,0cch,08ch,09dh,098h,092h,033h,034h,044h,034h,043h,022h,098h,089h,0d9h,013h	; b0d0  ......34D4C"....
	defb 0cch,08bh,0c2h,044h,045h,023h,033h,034h,043h,046h,066h,054h,01ch,016h,0cch,08ch	; b0e0  ...DE#34CFfT....
	defb 09dh,098h,089h,022h,034h,034h,043h,022h,099h,088h,09dh,089h,013h,0cch,08ah,023h	; b0f0  ..."44C".......#
	defb 044h,052h,033h,034h,043h,034h,066h,065h,011h,017h,0cch,084h,0c9h,0d9h,088h,099h	; b100  DR34C4fe........
	defb 003h,022h,085h,099h,088h,089h,0d8h,09ch,012h,0cch,08ah,0c2h,034h,045h,022h,033h	; b110  ."..........4E"3
	defb 043h,034h,056h,065h,041h,018h,0cch,084h,0c9h,08dh,099h,088h,003h,099h,084h,088h	; b120  C4VeA...........
	defb 089h,09dh,089h,013h,0cch,08ah,023h,044h,052h,023h,033h,032h,056h,065h,054h,01ch	; b130  ......#DR#32VeT.
	defb 019h,0cch,083h,098h,0ddh,099h,003h,088h,084h,099h,09dh,0d9h,09ch,013h,0cch,089h	; b140  ................
	defb 024h,045h,022h,033h,032h,055h,065h,054h,011h,01ah,0cch,083h,0c9h,098h,0ddh,003h	; b150  $E"32UeT........
	defb 099h,083h,0ddh,0d8h,09ch,013h,0cch,089h,0c2h,034h,052h,033h,022h,055h,066h,055h	; b160  .........4R3"UfU
	defb 041h,01ch,0cch,082h,0c9h,098h,003h,0ddh,082h,089h,099h,014h,0cch,089h,023h,045h	; b170  A.............#E
	defb 023h,022h,055h,066h,055h,041h,01ch,01dh,0cch,081h,0c9h,003h,099h,081h,09ch,014h	; b180  #"UfUA..........
	defb 0cch,089h,0c2h,034h,052h,022h,055h,066h,055h,041h,01ch,037h,0cch,088h,023h,045h	; b190  ...4R"UfUA.7..#E
	defb 022h,056h,066h,055h,041h,01ch,038h,0cch,087h,024h,055h,066h,066h,054h,031h,01ch	; b1a0  "VfUA.8..$UffT1.
	defb 038h,0cch,086h,0c2h,045h,055h,054h,043h,011h,03ah,0cch,085h,024h,054h,043h,031h	; b1b0  8...EUTC.:..$TC1
	defb 01ch,03bh,0cch,083h,013h,031h,01ch,07fh,0cch,03bh,0cch,000h	; b1c0  .....1......

; ----------------------------------------------------------------------
; DATOS resto_B1CC: lo apuntan con el banco puesto p12:77BB (0xB1CC), p12:78EE
;   (0xB1D2), p12:7B4D (0xB1D8), p12:7A79 (0xB242), p12:7B10 (0xB242),
;   p12:78BB (0xB25A); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p12:77BB, p12:78EE, p12:7B4D, p12:7A79, p12:7B10,
;   p12:78BB (1588 bytes)
;   0xb1cc..0xb800  (1588 bytes)
DATA_resto_B1CC:
	defb 0e2h,0b1h,002h,0b2h,022h,0b2h,0fah,0b1h,01ah,0b2h,03ah,0b2h,010h,01ah,010h,01ah	; b1cc  ....".....:.....
	defb 011h,01ah,012h,01ah,013h,019h,000h,000h,001h,001h,000h,000h,002h,000h,003h,001h	; b1dc  ................
	defb 002h,000h,004h,002h,005h,001h,006h,003h,004h,002h,005h,001h,006h,003h,001h,001h	; b1ec  ................
	defb 003h,001h,005h,001h,005h,001h,007h,000h,008h,003h,007h,000h,009h,004h,00ah,005h	; b1fc  ................
	defb 009h,004h,00bh,002h,00ch,001h,00bh,003h,00dh,002h,00eh,001h,00dh,003h,008h,003h	; b20c  ................
	defb 00ah,005h,00ch,001h,00eh,001h,00fh,006h,010h,006h,00fh,006h,012h,014h,012h,015h	; b21c  ................
	defb 012h,014h,013h,008h,014h,008h,015h,008h,023h,016h,023h,017h,023h,018h,010h,006h	; b22c  ........#.#.#...
	defb 012h,015h,014h,008h,008h,014h,024h,000h,024h,001h,024h,000h,024h,000h,024h,001h	; b23c  ......$.$.$.$.$.
	defb 024h,000h,024h,002h,024h,001h,024h,003h,024h,002h,024h,001h,024h,003h,016h,009h	; b24c  $.$.$.$.$.$.$...
	defb 017h,00ah,018h,00bh,018h,00bh,025h,00dh,026h,00eh,027h,00fh,027h,00fh,019h,003h	; b25c  ......%.&.'.'...
	defb 01ah,00ch,01bh,00ch,01ch,00ch,01dh,003h,01eh,00ch,01fh,00ch,020h,00ch,021h,001h	; b26c  ............ .!.
	defb 022h,001h,011h,001h,011h,001h,0d2h,0b2h,0e9h,0b2h,000h,0b3h,016h,0b3h,031h,0b3h	; b27c  ".............1.
	defb 04ch,0b3h,066h,0b3h,07eh,0b3h,090h,0b3h,0a2h,0b3h,0bch,0b3h,0d8h,0b3h,0f4h,0b3h	; b28c  L.f.~...........
	defb 011h,0b4h,02dh,0b4h,049h,0b4h,056h,0b4h,063h,0b4h,07ch,0b4h,089h,0b4h,09eh,0b4h	; b29c  ..-.I.V.c.|.....
	defb 0b3h,0b4h,0c8h,0b4h,0d6h,0b4h,0e5h,0b4h,0f4h,0b4h,004h,0b5h,01bh,0b5h,033h,0b5h	; b2ac  ..............3.
	defb 04eh,0b5h,065h,0b5h,07dh,0b5h,099h,0b5h,0b6h,0b5h,0cdh,0b5h,0aah,0b6h,0e6h,0b5h	; b2bc  N.e.}...........
	defb 0ebh,0b5h,0fah,0b5h,00dh,0b6h,005h,003h,08bh,00dh,00bh,00dh,00dh,003h,00bh,00bh	; b2cc  ................
	defb 003h,003h,00dh,00dh,005h,04ch,007h,04eh,002h,04ch,002h,04eh,000h,004h,003h,082h	; b2dc  .....L.N.L.N....
	defb 00dh,003h,004h,00dh,086h,003h,00bh,003h,003h,00dh,00dh,004h,04ch,007h,04eh,002h	; b2ec  ............L.N.
	defb 04ch,003h,04eh,000h,005h,003h,084h,00dh,00bh,00bh,00dh,004h,00bh,083h,003h,00dh	; b2fc  L.N.............
	defb 00dh,005h,04ch,008h,04eh,083h,04ch,04eh,04eh,000h,004h,003h,08ch,00dh,00bh,00bh	; b30c  ..L.N.LNN.......
	defb 00dh,00bh,00dh,00dh,003h,00bh,003h,00bh,00bh,004h,04ch,082h,04eh,04ch,007h,04eh	; b31c  ..........L.NL.N
	defb 002h,04ch,081h,04eh,000h,005h,003h,086h,00dh,00bh,00bh,003h,00dh,00dh,003h,00bh	; b32c  .L.N............
	defb 082h,003h,00dh,005h,04ch,003h,04eh,081h,04ch,004h,04eh,002h,04ch,081h,04eh,000h	; b33c  ....L.N.L.N.L.N.
	defb 004h,003h,084h,00dh,00bh,00bh,003h,003h,00dh,081h,003h,004h,00bh,004h,04ch,003h	; b34c  ..............L.
	defb 04eh,081h,04ch,005h,04eh,002h,04ch,081h,04eh,000h,005h,003h,086h,00dh,00bh,00bh	; b35c  N.L.N.L.N.......
	defb 003h,00dh,00dh,005h,00bh,005h,04ch,003h,04eh,081h,04ch,004h,04eh,002h,04ch,081h	; b36c  ......L.N.L.N.L.
	defb 04eh,000h,005h,003h,005h,00dh,082h,00bh,003h,004h,00dh,005h,04ch,006h,04eh,081h	; b37c  N...........L.N.
	defb 04ch,004h,04eh,000h,004h,003h,005h,00dh,082h,00bh,003h,005h,00dh,004h,04ch,006h	; b38c  L.N...........L.
	defb 04eh,081h,04ch,005h,04eh,000h,004h,003h,087h,00dh,00bh,00bh,00dh,00dh,009h,009h	; b39c  N.L.N...........
	defb 003h,00bh,002h,009h,004h,04ch,082h,04eh,04ch,005h,04eh,003h,04ch,002h,04eh,000h	; b3ac  .....L.NL.N.L.N.
	defb 003h,003h,087h,00dh,00bh,00bh,00dh,00dh,009h,009h,003h,00bh,002h,009h,081h,00dh	; b3bc  ................
	defb 003h,04ch,082h,04eh,04ch,005h,04eh,003h,04ch,003h,04eh,000h,004h,003h,08ch,00dh	; b3cc  .L.NL.N.L.N.....
	defb 00bh,00bh,00dh,003h,00dh,00dh,009h,00bh,00bh,003h,00dh,004h,04ch,004h,04eh,081h	; b3dc  ............L.N.
	defb 04ch,003h,04eh,003h,04ch,081h,04eh,000h,003h,003h,08dh,00dh,00bh,00bh,00dh,003h	; b3ec  L.N.L.N.........
	defb 00dh,00dh,009h,00bh,00bh,003h,00dh,00dh,003h,04ch,004h,04eh,081h,04ch,003h,04eh	; b3fc  .........L.N.L.N
	defb 003h,04ch,002h,04eh,000h,004h,003h,084h,00dh,00bh,00bh,003h,003h,00dh,081h,009h	; b40c  .L.N............
	defb 003h,00bh,081h,00dh,004h,04ch,003h,04eh,081h,04ch,004h,04eh,003h,04ch,081h,04eh	; b41c  .....L.N.L.N.L.N
	defb 000h,003h,003h,084h,00dh,00bh,00bh,003h,003h,00dh,081h,009h,003h,00bh,002h,00dh	; b42c  ................
	defb 003h,04ch,003h,04eh,081h,04ch,004h,04eh,003h,04ch,002h,04eh,000h,006h,003h,004h	; b43c  .L.N.L.N.L.N....
	defb 00dh,002h,003h,004h,00dh,006h,04ch,00ah,04eh,000h,007h,003h,004h,00dh,002h,003h	; b44c  ......L.N.......
	defb 003h,00dh,007h,04ch,009h,04eh,000h,004h,003h,084h,00dh,00bh,00bh,003h,005h,00bh	; b45c  ...L.N..........
	defb 083h,00dh,003h,00dh,004h,04ch,003h,04eh,081h,04ch,006h,04eh,082h,04ch,04eh,000h	; b46c  .....L.N.L.N.LN.
	defb 004h,00dh,005h,003h,003h,00dh,002h,003h,002h,00dh,010h,04eh,000h,005h,003h,081h	; b47c  ...........N....
	defb 00dh,003h,00bh,003h,00dh,003h,00bh,081h,00dh,005h,04ch,007h,04eh,003h,04ch,081h	; b48c  ..........L.N.L.
	defb 04eh,000h,005h,003h,081h,00dh,003h,00bh,003h,00dh,003h,00bh,081h,00dh,005h,04ch	; b49c  N..............L
	defb 007h,04eh,003h,04ch,081h,04eh,000h,005h,003h,087h,00dh,00bh,00bh,00dh,00bh,00dh	; b4ac  .N.L.N..........
	defb 003h,004h,00dh,005h,04ch,005h,04eh,081h,04bh,005h,04eh,000h,00ch,00dh,002h,003h	; b4bc  ....L.N.K.N.....
	defb 082h,00dh,003h,00ch,04eh,002h,04ch,002h,04eh,000h,00ch,00dh,084h,003h,00dh,00ch	; b4cc  ....N.L.N.......
	defb 00bh,00ch,04eh,084h,04ch,04eh,04bh,04eh,000h,00ch,00dh,084h,003h,00dh,00ch,00ch	; b4dc  ..N.LNKN........
	defb 00ch,04eh,084h,04ch,04eh,04bh,04bh,000h,005h,00bh,082h,00dh,003h,006h,00dh,083h	; b4ec  .N.LNKK.........
	defb 00bh,003h,00dh,005h,04ch,00bh,04eh,000h,005h,003h,08bh,00dh,00bh,00bh,00dh,00dh	; b4fc  ....L.N.........
	defb 00bh,00bh,00ch,00ch,00bh,00dh,005h,04ch,007h,04eh,002h,04bh,002h,04eh,000h,004h	; b50c  .......L.N.K.N..
	defb 003h,081h,00dh,003h,00bh,088h,00dh,003h,00bh,00bh,003h,003h,00dh,00dh,004h,04ch	; b51c  ...............L
	defb 009h,04eh,083h,04ch,04eh,04eh,000h,004h,003h,085h,00dh,00bh,003h,00bh,00bh,004h	; b52c  .N.LNN..........
	defb 00dh,083h,003h,00dh,00dh,004h,04ch,002h,04eh,081h,04ch,006h,04eh,083h,04ch,04eh	; b53c  ......L.N.L.N.LN
	defb 04eh,000h,005h,003h,081h,00bh,003h,00dh,002h,00bh,085h,003h,00dh,003h,00dh,00dh	; b54c  N...............
	defb 006h,04ch,007h,04eh,083h,04ch,04eh,04eh,000h,002h,00bh,002h,003h,084h,00dh,00bh	; b55c  .L.N.LNN........
	defb 00bh,00dh,004h,00bh,081h,003h,003h,00dh,004h,04ch,008h,04eh,081h,04ch,003h,04eh	; b56c  .........L.N.L.N
	defb 000h,003h,00bh,087h,003h,00dh,00bh,00dh,003h,00bh,00bh,003h,00dh,083h,003h,00dh	; b57c  ................
	defb 00dh,004h,04ch,006h,04eh,086h,043h,04eh,04eh,04ch,04eh,04eh,000h,003h,00bh,08dh	; b58c  ..L.N.CNNLNN....
	defb 003h,00dh,00bh,00bh,00dh,00bh,00dh,00bh,00dh,00dh,003h,00dh,00dh,004h,04ch,005h	; b59c  ..............L.
	defb 04eh,081h,04bh,003h,04eh,083h,04ch,04eh,04eh,000h,004h,003h,089h,00dh,003h,00dh	; b5ac  N.K.N.LNN.......
	defb 00dh,003h,003h,00bh,003h,003h,003h,00dh,004h,04ch,007h,04eh,002h,04ch,003h,04eh	; b5bc  .........L.N.L.N
	defb 000h,004h,003h,084h,00dh,00bh,00bh,00dh,005h,00bh,083h,003h,00dh,00dh,004h,04ch	; b5cc  ...............L
	defb 082h,04eh,04ch,007h,04eh,083h,04ch,04eh,04eh,000h,010h,007h,010h,048h,000h,00ah	; b5dc  .NL.N.LNN....H..
	defb 00dh,003h,003h,083h,00dh,003h,00dh,00ah,04eh,003h,04ch,003h,04eh,000h,00ah,00dh	; b5ec  ........N.L.N...
	defb 002h,003h,084h,00dh,00bh,00bh,00dh,00ah,04eh,002h,04ch,084h,04eh,04ch,04eh,04eh	; b5fc  ........N.L.NLNN
	defb 000h,00ah,00dh,002h,003h,084h,00dh,00bh,00bh,00dh,00ah,04eh,002h,04ch,084h,04eh	; b60c  ...........N.L.N
	defb 04ch,04ch,04eh,000h,056h,0b6h,063h,0b6h,06ch,0b6h,075h,0b6h,07eh,0b6h,08bh,0b6h	; b61c  LLN.V.c.l.u.~...
	defb 094h,0b6h,09dh,0b6h,0aah,0b6h,0bbh,0b6h,0d3h,0b6h,0e9h,0b6h,0fch,0b6h,005h,0b7h	; b62c  ................
	defb 01bh,0b7h,030h,0b7h,041h,0b7h,050h,0b7h,062h,0b7h,076h,0b7h,084h,0b7h,09bh,0b7h	; b63c  ..0.A.P.b.v.....
	defb 089h,0b4h,09eh,0b4h,0b3h,0b4h,0b1h,0b7h,0bch,0b7h,004h,00dh,003h,003h,004h,00dh	; b64c  ................
	defb 005h,003h,00bh,04eh,005h,04ch,000h,00ah,00dh,006h,003h,00ah,04eh,006h,04ch,000h	; b65c  ...N.L......N.L.
	defb 008h,00dh,008h,003h,009h,04eh,007h,04ch,000h,008h,00dh,008h,003h,00ah,04eh,006h	; b66c  .....N.L......N.
	defb 04ch,000h,006h,00dh,081h,003h,004h,00dh,005h,003h,00bh,04eh,005h,04ch,000h,007h	; b67c  L..........N.L..
	defb 00dh,009h,003h,009h,04eh,007h,04ch,000h,005h,00dh,00bh,003h,007h,04eh,009h,04ch	; b68c  ....N.L......N.L
	defb 000h,004h,00dh,005h,003h,003h,00dh,002h,003h,002h,00dh,010h,04eh,000h,008h,003h	; b69c  ............N...
	defb 085h,00dh,00dh,003h,00dh,00bh,003h,00dh,00bh,04eh,081h,043h,004h,04eh,000h,002h	; b6ac  .........N.C.N..
	defb 00dh,086h,00bh,00dh,003h,00bh,00bh,00dh,008h,003h,005h,04eh,002h,04ch,081h,043h	; b6bc  ...........N.L.C
	defb 005h,04eh,083h,04ch,04eh,04eh,000h,088h,00dh,00bh,00dh,003h,00bh,00bh,00dh,003h	; b6cc  .N.LNN..........
	defb 003h,00dh,005h,003h,006h,04eh,081h,04bh,004h,04eh,005h,04ch,000h,005h,00dh,085h	; b6dc  .....N.K.N.L....
	defb 00bh,00dh,00bh,003h,00dh,006h,003h,004h,04eh,083h,043h,04eh,04bh,009h,04eh,000h	; b6ec  ........N.CNK.N.
	defb 006h,00dh,00ah,003h,009h,04eh,007h,04ch,000h,088h,00dh,00bh,00dh,003h,00bh,00bh	; b6fc  .....N.L........
	defb 00dh,00dh,008h,003h,004h,04eh,002h,04ch,083h,043h,04eh,04eh,007h,04ch,000h,002h	; b70c  .....N.L.CNN.L..
	defb 00dh,085h,003h,00bh,00bh,00dh,003h,003h,00dh,006h,003h,005h,04eh,081h,04bh,004h	; b71c  ............N.K.
	defb 04eh,006h,04ch,000h,003h,00dh,081h,003h,003h,00bh,083h,003h,00dh,00dh,006h,003h	; b72c  N.L.............
	defb 00bh,04eh,005h,04ch,000h,008h,003h,081h,00bh,007h,003h,005h,04ch,004h,04eh,081h	; b73c  .N.L........L.N.
	defb 04ch,006h,04eh,000h,003h,00bh,086h,003h,00dh,00bh,00bh,003h,003h,004h,00bh,003h	; b74c  L.N.............
	defb 00dh,004h,04ch,00ch,04eh,000h,002h,003h,088h,00dh,00bh,00bh,003h,00bh,00bh,00dh	; b75c  ..L.N...........
	defb 00dh,003h,00bh,003h,00dh,002h,04ch,00eh,04eh,000h,00ah,003h,086h,00dh,00bh,00bh	; b76c  ......L.N.......
	defb 003h,00dh,00bh,00ah,04ch,006h,04eh,000h,084h,00dh,003h,003h,00dh,004h,00bh,084h	; b77c  ....L.N.........
	defb 003h,00bh,00bh,00ch,004h,003h,008h,04eh,003h,04ch,081h,043h,004h,04ch,000h,002h	; b78c  .......N.L.C.L..
	defb 003h,085h,00dh,00bh,00bh,00dh,003h,003h,00bh,006h,00dh,006h,04eh,002h,04ch,082h	; b79c  ............N.L.
	defb 04eh,04ch,006h,04eh,000h,083h,00bh,00dh,00dh,005h,00bh,008h,003h,010h,04eh,000h	; b7ac  NL.N..........N.
	defb 020h,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b7bc   ...............
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b7cc  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b7dc  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b7ec  ................
	defb 0ffh,0ffh,0ffh,0ffh	; b7fc

; ======================================================================
; CODIGO 0xb800..0xba77  (631 bytes)
; ======================================================================


depuracion_apagada:		; lo que la interrupcion llama cada cuadro (p03:A12F): vuelve sin acarreo (el juego corre) y lo de detras, un monitor de depuracion, no llega a correr nunca
	or a			;b800   ; sin acarreo...
	ret			;b801   ; ...y vuelve: lo de 0xB802 no corre
monitor:		; NUNCA CORRE (p63:B800 vuelve antes). El monitor de depuracion de cada cuadro: las teclas de trampa (Z, X, R, INS/DEL, BS, T, ^, P y el punto del teclado numerico); en la pausa (0xCA3E), sus teclas (p63:B95B); con STOP, la pausa (acarreo: el juego no corre); si no, el cambio de sala o de zona (p63:B837)
	call tecla_z		;b802   ; Z: todo el equipo
	call tecla_x		;b805   ; X: 0xD678-0xD6A7 a 1
	call tecla_r		;b808   ; R: 0xD6B4-0xD6BD
	call teclas_ins_del		;b80b   ; INS/DEL: 0xCA3C
	call tecla_bs		;b80e   ; BS: 0xD430 y 0xD7D1
	call tecla_t		;b811   ; T: 0xCA8E
	call tecla_circunflejo		;b814   ; ^: 0xD700 a 0 y 0xCAAF
	call tecla_p		;b817   ; P: la Y y la X de Snake
	call tecla_punto		;b81a   ; el punto: 0xE257
	ld a,(0ca3eh)		;b81d   ; en la pausa, sus teclas
	and a			;b820
	jp nz,teclas_de_pausa		;b821   ; teclas_de_pausa: en la pausa: ESC sale (p63:B9C4); en el modo 2 (TAB), el visor de sprites; en el 3 (HOME), el cursor; TAB y HOME los ponen; 0-3 enseñan esa pagina de la VRAM; arriba y abajo mueven la pantalla (R#23); acarreo: el juego sigue parado
	ld a,007h		;b824   ; la fila 7 del teclado...
	call 00141h		;b826   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;b829
	and 010h		;b82a   ; ...STOP (bit 4)?
	jp z,cambia_de_sala		;b82c   ; cambia_de_sala: sin pausa: las teclas 0-9 y A-J ponen esa zona encima de la sala en el mapa de 0xD900 y sale por arriba (p63:B8F9); ; y ] suben y bajan la fase (0xCA22, 0-8); 8, 2, 4 y 6 del teclado numerico salen por arriba, abajo, izquierda o derecha si hay sala alli
	ld hl,00001h		;b82f   ; la pausa: 0xCA3E = 1 (y 0xCA3F = 0)...
	ld (0ca3eh),hl		;b832   ; guarda el monitor de depuracion de p63:B802 (nunca corre): 0 nada, 1 pausa, 2 visor de sprites, 3 cursor y el byte siguiente (16 bits)
	scf			;b835   ; ...con acarreo: el juego no corre
	ret			;b836
cambia_de_sala:		; sin pausa: las teclas 0-9 y A-J ponen esa zona encima de la sala en el mapa de 0xD900 y sale por arriba (p63:B8F9); ; y ] suben y bajan la fase (0xCA22, 0-8); 8, 2, 4 y 6 del teclado numerico salen por arriba, abajo, izquierda o derecha si hay sala alli
	ld hl,0ca41h		;b837   ; la salida de la sala...
	ld de,0d900h		;b83a   ; ...el mapa de salas...
	ld bc,(0ca50h)		;b83d   ; ...C = la fila, B = la columna
	ld a,000h		;b841   ; la fila 0: 0-7
	push bc			;b843
	call 00141h		;b844   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	pop bc			;b847
	cpl			;b848   ; pulsadas a 1
	and a			;b849   ; alguna?
	jp nz,tecla_de_zona		;b84a   ; tecla_de_zona: la tecla pulsada de la fila (el primer bit a 0 desde el 0): su numero en C
	ld a,001h		;b84d   ; la fila 1: 8 y 9
	push bc			;b84f
	call 00141h		;b850   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	pop bc			;b853
	cpl			;b854   ; pulsadas a 1
	and 003h		;b855   ; 8 o 9?
	jp nz,teclas_8_9		;b857   ; teclas_8_9: 8 o 9
	ld a,002h		;b85a   ; la fila 2: A y B
	push bc			;b85c
	call 00141h		;b85d   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	pop bc			;b860
	cpl			;b861   ; pulsadas a 1
	and 0c0h		;b862   ; A o B?
	jp nz,teclas_a_b		;b864   ; teclas_a_b: B (0x0B) o A (0x0A)
	ld a,003h		;b867   ; la fila 3: C-J
	push bc			;b869
	call 00141h		;b86a   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	pop bc			;b86d
	cpl			;b86e   ; pulsadas a 1
	and a			;b86f   ; alguna?
	jp nz,teclas_c_j		;b870   ; teclas_c_j: C-J: 0x0C-0x13
	ld a,001h		;b873   ; la fila 1, bit 7 (;)
	push bc			;b875
	call 00141h		;b876   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	pop bc			;b879
	rla			;b87a   ; ;: la fase uno mas
	jp nc,fase_mas		;b87b   ; fase_mas: la fase uno mas, hasta 8
	ld a,002h		;b87e   ; la fila 2, bit 0 (])
	push bc			;b880
	call 00141h		;b881   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	pop bc			;b884
	rra			;b885   ; ]: la fase uno menos
	jp nc,fase_menos		;b886   ; fase_menos: la fase uno menos, desde 0
	ld a,009h		;b889   ; la fila 9 del teclado numerico
	push bc			;b88b
	call 00141h		;b88c   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	pop bc			;b88f
	cpl			;b890   ; pulsadas a 1
	rla			;b891   ; 4: a la izquierda
	jr c,sala_de_la_izquierda		;b892
	rla			;b894   ; 2: abajo
	rla			;b895
	jr c,sala_de_abajo		;b896
	ld a,00ah		;b898   ; la fila 10 del teclado numerico
	push bc			;b89a
	call 00141h		;b89b   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	pop bc			;b89e
	cpl			;b89f   ; pulsadas a 1
	rra			;b8a0   ; 6: a la derecha
	rra			;b8a1
	jr c,sala_de_la_derecha		;b8a2
	rra			;b8a4   ; 8: arriba...
	rra			;b8a5
	ret nc			;b8a6
	inc c			;b8a7   ; ...la fila de encima
	call casilla_del_mapa		;b8a8   ; hay sala?
	ret z			;b8ab
	ld (hl),001h		;b8ac   ; sale por arriba
	or a			;b8ae   ; el juego corre
	ret			;b8af
sala_de_abajo:		; la fila de debajo
	dec c			;b8b0
	call casilla_del_mapa		;b8b1   ; casilla_del_mapa: DE = la casilla (C * 16 + B) del mapa de 0xD900; Z si es 0xFF (no hay sala)
	ret z			;b8b4
	ld (hl),002h		;b8b5   ; sale por abajo
	or a			;b8b7
	ret			;b8b8
sala_de_la_izquierda:		; la columna de la izquierda
	dec b			;b8b9
	call casilla_del_mapa		;b8ba   ; casilla_del_mapa: DE = la casilla (C * 16 + B) del mapa de 0xD900; Z si es 0xFF (no hay sala)
	ret z			;b8bd
	ld (hl),003h		;b8be   ; sale por la izquierda
	or a			;b8c0
	ret			;b8c1
sala_de_la_derecha:		; la columna de la derecha
	inc b			;b8c2
	call casilla_del_mapa		;b8c3   ; casilla_del_mapa: DE = la casilla (C * 16 + B) del mapa de 0xD900; Z si es 0xFF (no hay sala)
	ret z			;b8c6
	ld (hl),004h		;b8c7   ; sale por la derecha
	or a			;b8c9
	ret			;b8ca
fase_mas:		; la fase uno mas, hasta 8
	ld hl,0ca22h		;b8cb   ; apunta a la fase de la partida (indice de las listas de p06:B40C)
	ld a,(hl)			;b8ce   ; hasta 8
	cp 008h		;b8cf
	ret nc			;b8d1
	inc (hl)			;b8d2   ; uno mas
	ret			;b8d3
fase_menos:		; la fase uno menos, desde 0
	ld hl,0ca22h		;b8d4   ; apunta a la fase de la partida (indice de las listas de p06:B40C)
	ld a,(hl)			;b8d7   ; desde 0
	and a			;b8d8
	ret z			;b8d9
	dec (hl)			;b8da   ; uno menos
	ret			;b8db
llegada_a_zona:		; la sala de llegada a la zona puesta (fila, columna): la 7 (1, 5), la 6 (2, 7), la 0x0F (2, 6), las demas (1, 7)
	ld a,(de)			;b8dc   ; la zona puesta
	cp 087h		;b8dd   ; la zona 7
	ld hl,00501h		;b8df   ; (1, 5)
	jr z,L_B8F5		;b8e2
	cp 086h		;b8e4   ; la 6
	ld hl,00702h		;b8e6   ; (2, 7)
	jr z,L_B8F5		;b8e9
	cp 08fh		;b8eb   ; la 0x0F
	ld hl,00602h		;b8ed   ; (2, 6)
	jr z,L_B8F5		;b8f0
	ld hl,00701h		;b8f2   ; las demas
L_B8F5:
	ld (0ca50h),hl		;b8f5   ; a 0xCA50-0xCA51
	ret			;b8f8
tecla_de_zona:		; la tecla pulsada de la fila (el primer bit a 0 desde el 0): su numero en C
	push bc			;b8f9
	ld b,007h		;b8fa   ; hasta 7 bits
	ld c,000h		;b8fc   ; desde 0
bit_de_tecla:		; el bit siguiente
	rra			;b8fe   ; el bit a 0 es la tecla
	jr c,numero_de_tecla		;b8ff
	inc c			;b901   ; una mas
	djnz bit_de_tecla		;b902   ; el siguiente
numero_de_tecla:		; A = el numero
	ld a,c			;b904
	pop bc			;b905
pon_zona:		; la casilla de encima en el mapa (fila + 1) * 16 + columna...
	push af			;b906
	ld a,c			;b907   ; la fila...
	inc a			;b908   ; ...+ 1...
	add a,a			;b909   ; ...* 16...
	add a,a			;b90a
	add a,a			;b90b
	add a,a			;b90c
	add a,b			;b90d   ; ...+ la columna
	call de_mas_a		;b90e   ; de_mas_a: DE = DE + A
	pop af			;b911   ; la zona...
	set 7,a		;b912   ; ...= la zona con el bit 7...
	ld (de),a			;b914   ; ...en la casilla
	ld a,001h		;b915   ; ...sale por arriba...
	ld (hl),a			;b917   ; sale por arriba
	jp llegada_a_zona		;b918   ; ...y la sala de llegada
teclas_8_9:		; 8 o 9
	rra			;b91b
	ld a,008h		;b91c   ; 8
	jr c,pon_zona_a		;b91e
	ld a,009h		;b920   ; 9
pon_zona_a:
	jr pon_zona		;b922
teclas_a_b:		; B (0x0B) o A (0x0A)
	rla			;b924
	ld a,00bh		;b925   ; B
	jr c,pon_zona_b		;b927
	ld a,00ah		;b929   ; A
pon_zona_b:
	jr pon_zona		;b92b
teclas_c_j:		; C-J: 0x0C-0x13
	push bc			;b92d
	ld b,007h		;b92e   ; hasta 7 bits
	ld c,00ch		;b930   ; desde 0x0C (C)
	rra			;b932
	jr c,numero_de_tecla		;b933
	inc c			;b935
	djnz bit_de_tecla		;b936
	ld a,c			;b938
	pop bc			;b939
	jr pon_zona		;b93a
casilla_del_mapa:		; DE = la casilla (C * 16 + B) del mapa de 0xD900; Z si es 0xFF (no hay sala)
	ld a,c			;b93c   ; la fila * 16...
	add a,a			;b93d
	add a,a			;b93e
	add a,a			;b93f
	add a,a			;b940
	add a,b			;b941   ; ...+ la columna
	call de_mas_a		;b942   ; de_mas_a: DE = DE + A
	ld a,(de)			;b945   ; 0xFF: Z
	inc a			;b946
	ret			;b947
de_mas_a:		; DE = DE + A
	add a,e			;b948   ; + A
	ld e,a			;b949
	ret nc			;b94a   ; con acarreo...
	inc d			;b94b   ; ...el alto
	ret			;b94c
tecla_punto:		; con el punto del teclado numerico (fila 10, bit 7), 0xE257 = 1
	ld a,00ah		;b94d   ; la fila 10
	call 00141h		;b94f   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	bit 7,a		;b952   ; el punto (bit 7)?
	ret nz			;b954
	ld a,001h		;b955   ; 0xE257 = 1
	ld (0e257h),a		;b957   ; guarda 1 con el punto del teclado numerico en el monitor de p63
	ret			;b95a
teclas_de_pausa:		; en la pausa: ESC sale (p63:B9C4); en el modo 2 (TAB), el visor de sprites; en el 3 (HOME), el cursor; TAB y HOME los ponen; 0-3 enseñan esa pagina de la VRAM; arriba y abajo mueven la pantalla (R#23); acarreo: el juego sigue parado
	ld a,007h		;b95b   ; la fila 7...
	call 00141h		;b95d   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;b960
	and 004h		;b961   ; ...ESC: sale
	jp nz,sale_de_la_pausa		;b963   ; sale_de_la_pausa: R#23 = 0; desde el modo 2, R#1 = 0x62, los colores y atributos de los sprites 0-1 de vuelta y el cuadro de (0xC0, 0x60) copiado de la otra pagina; 0xCA3E = 0 y la pagina de dibujar en pantalla
	ld a,(0ca3eh)		;b966   ; el modo 2...
	cp 002h		;b969
	jp z,visor_cada_cuadro		;b96b   ; visor_cada_cuadro: el modo 2 de cada cuadro: las tablas de sprites cambiadas, el teclado como mando; arriba los patrones de los dos sprites 8 mas, abajo 8 menos, y escritos en (0xEC, 0x74) y (0xEC, 0x9C); los sprites a la VRAM
	cp 003h		;b96e   ; ...o el 3
	jp z,cursor_cada_cuadro		;b970   ; cursor_cada_cuadro: el modo 3 de cada cuadro: el patron 0x18, las flechas lo mueven, su color cambia de 0 a 15 y su Y + 1 y su X escritas
	ld a,007h		;b973   ; TAB...
	call 00141h		;b975   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;b978
	and 008h		;b979   ; ...el modo 2
	jp nz,visor_de_sprites		;b97b   ; visor_de_sprites: TAB, el modo 2: R#1 = 0x63 (sprites de 16 x 16 al doble), los colores y atributos de los sprites 0-1 guardados en 0xE800 y 0xE820, sus colores a 7, los dos sprites de p63:BA77 en (0xC8, 0x68) y (0xC8, 0x90), el cuadro de (0xC0, 0x60) de 0x40 x 0x60 a 0xFF con dos marcos de 0x20 x 0x20 y sus patrones escritos
	ld a,008h		;b97e   ; la fila 8: HOME...
	call 00141h		;b980   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	bit 1,a		;b983   ; ...el modo 3
	jp z,cursor_de_depuracion		;b985   ; cursor_de_depuracion: HOME, el modo 3: el sprite 4 en (0x60, 0x60) con el color 0
	xor a			;b988   ; la fila 0: 0-3
	call 00141h		;b989   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;b98c
	rra			;b98d   ; 0
	jp c,pagina_0		;b98e   ; pagina_0:
	rra			;b991   ; 1
	jp c,pagina_1		;b992   ; pagina_1:
	rra			;b995   ; 2
	jp c,pagina_2		;b996   ; pagina_2:
	rra			;b999   ; 3
	jp c,pagina_3		;b99a   ; pagina_3:
	ld a,008h		;b99d   ; la fila 8: arriba y abajo
	call 00141h		;b99f   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;b9a2
	rla			;b9a3
	rla			;b9a4
	ld hl,0ca3fh		;b9a5   ; la cuenta de R#23
	jr c,baja_pantalla		;b9a8   ; abajo
	rla			;b9aa
	jr c,sube_pantalla		;b9ab   ; arriba
	scf			;b9ad   ; parado
	ret			;b9ae
pagina_3:
	ld a,003h		;b9af   ; 3
	jp ensena_pagina		;b9b1   ; ensena_pagina: esa pagina en pantalla
pagina_0:
	xor a			;b9b4   ; 0
	jp ensena_pagina		;b9b5   ; ensena_pagina: esa pagina en pantalla
pagina_1:
	ld a,001h		;b9b8   ; 1
	jp ensena_pagina		;b9ba   ; ensena_pagina: esa pagina en pantalla
pagina_2:
	ld a,002h		;b9bd   ; 2
ensena_pagina:		; esa pagina en pantalla
	call pagina_en_pantalla		;b9bf   ; pagina_en_pantalla: la pagina A en pantalla: 0xFAF5, R#2 y R#4 desde sus copias de la BIOS (0xF3E1, 0xF3E3)
	scf			;b9c2   ; el juego sigue parado
	ret			;b9c3
sale_de_la_pausa:		; R#23 = 0; desde el modo 2, R#1 = 0x62, los colores y atributos de los sprites 0-1 de vuelta y el cuadro de (0xC0, 0x60) copiado de la otra pagina; 0xCA3E = 0 y la pagina de dibujar en pantalla
	ld b,000h		;b9c4   ; R#23 = 0
	ld c,017h		;b9c6
	call 00047h		;b9c8   ; BIOS WRTVDP - Writes data in the VDP-register
	ld a,(0ca3eh)		;b9cb   ; desde el modo 2...
	cp 002h		;b9ce
	jr nz,fuera_pausa		;b9d0
	ld bc,06201h		;b9d2   ; ...R#1 = 0x62...
	call 00047h		;b9d5   ; BIOS WRTVDP - Writes data in the VDP-register
	ld de,0da00h		;b9d8   ; ...los colores de vuelta...
	ld hl,0e800h		;b9db   ; apunta a los colores de la lista de dibujos en curso (p00:4DB3)
	ld bc,00020h		;b9de
	ldir		;b9e1
	ld de,0dc00h		;b9e3   ; ...los atributos...
	ld hl,0e820h		;b9e6
	ld bc,00009h		;b9e9
	ldir		;b9ec
	ld hl,0c060h		;b9ee   ; ...y el cuadro de 0x40 x 0x60 de la otra pagina
	ld de,0c060h		;b9f1
	ld bc,04060h		;b9f4
	call copia_de_la_otra		;b9f7   ; copia_de_la_otra: B x C de (H, L) de la otra pagina a (D, E) de la de dibujar
fuera_pausa:		; sin pausa
	xor a			;b9fa
	ld (0ca3eh),a		;b9fb   ; guarda el monitor de depuracion de p63:B802 (nunca corre): 0 nada, 1 pausa, 2 visor de sprites, 3 cursor
	ld a,(0ca42h)		;b9fe   ; la pagina de dibujar en pantalla
	call pagina_en_pantalla		;ba01   ; pagina_en_pantalla: la pagina A en pantalla: 0xFAF5, R#2 y R#4 desde sus copias de la BIOS (0xF3E1, 0xF3E3)
	or a			;ba04   ; el juego corre
	ret			;ba05
sube_pantalla:		; uno menos
	dec (hl)			;ba06   ; R#23 uno menos
	jr pon_r23		;ba07
baja_pantalla:		; uno mas
	inc (hl)			;ba09   ; R#23 uno mas
pon_r23:		; R#23 = 0xCA3F
	ld b,(hl)			;ba0a
	ld c,017h		;ba0b
	call 00047h		;ba0d   ; BIOS WRTVDP - Writes data in the VDP-register
	scf			;ba10   ; el juego sigue parado
	ret			;ba11
visor_de_sprites:		; TAB, el modo 2: R#1 = 0x63 (sprites de 16 x 16 al doble), los colores y atributos de los sprites 0-1 guardados en 0xE800 y 0xE820, sus colores a 7, los dos sprites de p63:BA77 en (0xC8, 0x68) y (0xC8, 0x90), el cuadro de (0xC0, 0x60) de 0x40 x 0x60 a 0xFF con dos marcos de 0x20 x 0x20 y sus patrones escritos
	ld a,002h		;ba12   ; el modo 2
	ld (0ca3eh),a		;ba14   ; guarda el monitor de depuracion de p63:B802 (nunca corre): 0 nada, 1 pausa, 2 visor de sprites, 3 cursor
	ld bc,06301h		;ba17   ; R#1 = 0x63
	call 00047h		;ba1a   ; BIOS WRTVDP - Writes data in the VDP-register
	ld hl,0da00h		;ba1d   ; los colores de los sprites 0-1...
	ld de,0e800h		;ba20   ; apunta a los colores de la lista de dibujos en curso (p00:4DB3)
	ld bc,00020h		;ba23
	ldir		;ba26
	ld hl,0dc00h		;ba28   ; ...y sus atributos, guardados
	ld de,0e820h		;ba2b
	ld bc,00009h		;ba2e
	ldir		;ba31
	ld hl,0da00h		;ba33   ; sus colores a 7
	ld de,0da01h		;ba36
	ld bc,0001fh		;ba39
	ld (hl),007h		;ba3c
	ldir		;ba3e
	ld de,0dc00h		;ba40   ; los dos sprites de p63:BA77
	ld hl,0ba77h		;ba43   ; desde p63:BA77
	ld bc,00009h		;ba46
	ldir		;ba49
	ld hl,0c060h		;ba4b   ; el cuadro...
	ld bc,04060h		;ba4e
	ld a,(0ca42h)		;ba51   ; ...en la pagina de dibujar...
	ld d,a			;ba54
	ld a,0ffh		;ba55   ; ...a 0xFF
	call rellena_hmmv		;ba57   ; rellena_hmmv: orden HMMV del VDP: B x C desde (H, L) de la pagina D con el byte A (B o C = 0: 256)
	ld hl,0c868h		;ba5a   ; un marco en (0xC8, 0x68)...
	call marco_de_sprite		;ba5d   ; marco_de_sprite: un marco de 0x20 x 0x20 de color 0x0D en HL
	ld hl,0c890h		;ba60   ; ...y otro en (0xC8, 0x90)
	call marco_de_sprite		;ba63   ; marco_de_sprite: un marco de 0x20 x 0x20 de color 0x0D en HL
	ld hl,0dc03h		;ba66   ; y sus patrones escritos (p63:BAB9)
	jr $+80		;ba69
marco_de_sprite:		; un marco de 0x20 x 0x20 de color 0x0D en HL
	ld de,02020h		;ba6b   ; 0x20 x 0x20
	ld c,00dh		;ba6e   ; color 0x0D
	ld a,(0ca42h)		;ba70   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	call marco_63		;ba73   ; marco_63: un marco de D x E de color C desde (H, L) en la pagina A: dos lineas verticales de E y dos horizontales de D
	ret			;ba76

; ----------------------------------------------------------------------
; DATOS resto_BA77: lo apuntan con el banco puesto p63:BA43 (0xBA77); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p63:BA43 (9 bytes)
;   0xba77..0xba80  (9 bytes)
DATA_resto_BA77:
	defb 068h,0c8h,000h,000h,090h,0c8h,004h,000h,0d8h	; ba77  h........

; ======================================================================
; CODIGO 0xba80..0xbe1d  (925 bytes)
; ======================================================================


cursor_de_depuracion:		; HOME, el modo 3: el sprite 4 en (0x60, 0x60) con el color 0
	ld a,003h		;ba80   ; el modo 3
	ld (0ca3eh),a		;ba82   ; guarda el monitor de depuracion de p63:B802 (nunca corre): 0 nada, 1 pausa, 2 visor de sprites, 3 cursor
	ld a,060h		;ba85   ; Y = X = 0x60
	ld (0dc10h),a		;ba87   ; la X
	ld (0dc11h),a		;ba8a
	xor a			;ba8d   ; el color 0
	ld (0dc13h),a		;ba8e   ; el color
	ret			;ba91
visor_cada_cuadro:		; el modo 2 de cada cuadro: las tablas de sprites cambiadas, el teclado como mando; arriba los patrones de los dos sprites 8 mas, abajo 8 menos, y escritos en (0xEC, 0x74) y (0xEC, 0x9C); los sprites a la VRAM
	call tablas_de_sprites_63		;ba92   ; las tablas cambiadas
	call teclado_como_mando		;ba95   ; el teclado como mando
	ld hl,0dc02h		;ba98   ; el patron del sprite 0...
	ld de,0dc06h		;ba9b   ; ...y el del 1
	ld a,(0ca07h)		;ba9e   ; lo recien pulsado: arriba...
	rra			;baa1
	jr c,patrones_mas		;baa2
	rra			;baa4   ; ...abajo
	jr nc,sprites_a_vram		;baa5
	ld a,(hl)			;baa7   ; 8 menos
	sub 008h		;baa8   ; el sprite 0...
	ld (hl),a			;baaa
	ld a,(de)			;baab   ; ...y el 1
	sub 008h		;baac
	ld (de),a			;baae
	jr escribe_dos		;baaf
patrones_mas:		; 8 mas
	ld a,(hl)			;bab1
	add a,008h		;bab2   ; el sprite 0...
	ld (hl),a			;bab4
	ld a,(de)			;bab5   ; ...y el 1
	add a,008h		;bab6
	ld (de),a			;bab8
escribe_dos:		; (HL) en hexadecimal en (0xEC, 0x74) y (DE) en (0xEC, 0x9C)
	ld b,001h		;bab9   ; un byte...
	push de			;babb
	ld de,0ec74h		;babc   ; ...en (0xEC, 0x74)
	call escribe_hexa		;babf   ; escribe_hexa: B bytes desde HL hacia atras en hexadecimal en (D, E), sin los ceros de la izquierda (salvo el ultimo byte)
	pop hl			;bac2
	ld b,001h		;bac3   ; un byte
	ld de,0ec9ch		;bac5   ; el otro en (0xEC, 0x9C)
	call escribe_hexa		;bac8   ; escribe_hexa: B bytes desde HL hacia atras en hexadecimal en (D, E), sin los ceros de la izquierda (salvo el ultimo byte)
sprites_a_vram:		; los sprites a la VRAM
	call sprites_a_vram_63		;bacb   ; sprites_a_vram_63: la copia de 0xDA00 (colores y atributos, 0x280 bytes) a la VRAM de 0xCA0C
	scf			;bace   ; el juego sigue parado
	ret			;bacf
tecla_p:		; con 0xE25F (lo pone la P), cada cuadro la Y y la X de Snake en hexadecimal en (0xEC, 0x74) y (0xEC, 0x9C)
	ld a,(0e25fh)		;bad0   ; ya puesto?
	or a			;bad3   ; sin 0xE25F...
	jr z,mira_tecla_p		;bad4   ; ...mira la tecla
	call tablas_de_sprites_63		;bad6   ; las tablas cambiadas
	ld hl,0cb03h		;bad9   ; la Y...
	ld de,0cb05h		;badc   ; ...y la X de Snake
	jp escribe_dos		;badf   ; escribe_dos: (HL) en hexadecimal en (0xEC, 0x74) y (DE) en (0xEC, 0x9C)
mira_tecla_p:		; la fila 4, bit 5: P
	ld a,004h		;bae2
	call 00141h		;bae4   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	bit 5,a		;bae7   ; la P?
	ret nz			;bae9
	ld a,001h		;baea   ; 0xE25F = 1
	ld (0e25fh),a		;baec   ; guarda 1: el monitor de p63 escribe la Y y la X de Snake (tecla P)
	ret			;baef
cursor_cada_cuadro:		; el modo 3 de cada cuadro: el patron 0x18, las flechas lo mueven, su color cambia de 0 a 15 y su Y + 1 y su X escritas
	call tablas_de_sprites_63		;baf0   ; tablas_de_sprites_63: alterna las tablas de sprites: 0xF400/0xF600 o 0xF000/0xF200 en 0xCA0C-0xCA0F y R#5
	ld a,018h		;baf3   ; el patron 0x18
	ld (0dc12h),a		;baf5
	call flechas_del_cursor		;baf8   ; las flechas
	call color_del_cursor		;bafb   ; el color
	ld hl,0dc10h		;bafe   ; la Y + 1...
	inc (hl)			;bb01   ; + 1 mientras se escribe
	ld de,0dc11h		;bb02   ; ...y la X escritas
	call escribe_dos		;bb05   ; escribe_dos: (HL) en hexadecimal en (0xEC, 0x74) y (DE) en (0xEC, 0x9C)
	ld hl,0dc10h		;bb08   ; la Y de vuelta
	dec (hl)			;bb0b   ; de vuelta
	ret			;bb0c
color_del_cursor:		; el color del sprite 4 uno mas (0-15) en sus 16 lineas
	ld a,(0dc13h)		;bb0d   ; el color...
	inc a			;bb10
	and 00fh		;bb11   ; ...de 0 a 15
	ld (0dc13h),a		;bb13
	ld hl,0da40h		;bb16   ; las 16 lineas del sprite 4
	ld de,0da41h		;bb19
	ld (hl),a			;bb1c   ; a las 16 lineas
	ld bc,0000fh		;bb1d
	ldir		;bb20
	ret			;bb22
flechas_del_cursor:		; la fila 8: las flechas mueven la Y o la X
	ld a,008h		;bb23   ; la fila 8
	call 00141h		;bb25   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;bb28   ; pulsadas a 1
	and 0f0h		;bb29   ; sin flechas, nada
	ret z			;bb2b   ; ninguna flecha
	call flecha_pulsada		;bb2c   ; flecha_pulsada: HL y B por la flecha: arriba Y - 1, abajo Y + 1, izquierda X - 1, derecha X + 1
	ld a,(hl)			;bb2f   ; la Y o la X...
	add a,b			;bb30   ; ...+ B
	ld (hl),a			;bb31
	ret			;bb32
flecha_pulsada:		; HL y B por la flecha: arriba Y - 1, abajo Y + 1, izquierda X - 1, derecha X + 1
	ld hl,0dc10h		;bb33   ; la Y
	ld b,0ffh		;bb36   ; - 1
	bit 5,a		;bb38   ; arriba
	ret nz			;bb3a
	ld b,001h		;bb3b   ; + 1
	bit 6,a		;bb3d   ; abajo
	ret nz			;bb3f
	ld hl,0dc11h		;bb40   ; la X
	ld b,0ffh		;bb43   ; - 1
	bit 4,a		;bb45   ; izquierda
	ret nz			;bb47
	ld b,001h		;bb48   ; + 1
	ret			;bb4a
pagina_en_pantalla:		; la pagina A en pantalla: 0xFAF5, R#2 y R#4 desde sus copias de la BIOS (0xF3E1, 0xF3E3)
	ld (0faf5h),a		;bb4b   ; la copia de la BIOS
	add a,a			;bb4e   ; la pagina * 16...
	add a,a			;bb4f
	add a,a			;bb50
	add a,a			;bb51
	ld e,a			;bb52   ; ...en E
	add a,a			;bb53   ; la pagina * 32...
	ld h,a			;bb54   ; ...en H
	ld a,(0f3e1h)		;bb55   ; R#2...
	and 01fh		;bb58   ; R#2 sin la pagina...
	or h			;bb5a   ; ...con la nueva
	ld b,a			;bb5b
	ld c,002h		;bb5c   ; ...con la pagina
	call escribe_registro		;bb5e   ; escribe_registro: R#C = B por el puerto del VDP de la BIOS (0x0007) + 1
	ld a,(0f3e3h)		;bb61   ; R#4...
	and 00fh		;bb64   ; R#4 sin la pagina...
	or e			;bb66   ; ...con la nueva
	ld b,a			;bb67
	ld c,004h		;bb68   ; ...con la pagina
	call escribe_registro		;bb6a   ; escribe_registro: R#C = B por el puerto del VDP de la BIOS (0x0007) + 1
	ret			;bb6d
escribe_registro:		; R#C = B por el puerto del VDP de la BIOS (0x0007) + 1
	ld a,c			;bb6e
	ex af,af'			;bb6f   ; el registro, aparte
	ld a,(00007h)		;bb70   ; el puerto
	inc a			;bb73   ; el puerto de control
	ld c,a			;bb74
	ld a,b			;bb75
	di			;bb76   ; sin interrupciones
	out (c),a		;bb77   ; el dato...
	ex af,af'			;bb79
	or 080h		;bb7a   ; el registro + 0x80
	ei			;bb7c
	out (c),a		;bb7d   ; ...y el registro
	ret			;bb7f
espera_al_vdp:		; espera a que el VDP acabe su orden (S#2, bit 0)
	push af			;bb80
mira_s2:		; S#2
	ld a,002h		;bb81   ; S#2...
	call lee_estado		;bb83   ; lee_estado: A = el registro de estado A del VDP (R#15) y de vuelta al 0
	rra			;bb86   ; ...con la orden en marcha (CE)...
	jp c,mira_s2		;bb87   ; ...espera
	pop af			;bb8a
	ret			;bb8b
copia_de_la_otra:		; B x C de (H, L) de la otra pagina a (D, E) de la de dibujar
	push bc			;bb8c
	ld a,(0ca42h)		;bb8d   ; lee la pagina de la VRAM en la que se dibuja (0/1, se alterna)
	xor 001h		;bb90   ; la otra pagina...
	ld b,a			;bb92   ; ...de origen
	xor 001h		;bb93   ; la de dibujar...
	rlca			;bb95   ; ...de destino (bits 2-3)
	rlca			;bb96
	or b			;bb97
	pop bc			;bb98
copia_hmmm:		; orden HMMM del VDP: B x C de (H, L) a (D, E); A: pagina de origen (bits 0-1) y de destino (2-3)
	ex af,af'			;bb99
	call espera_al_vdp		;bb9a   ; espera
	push bc			;bb9d
	ld a,(00007h)		;bb9e   ; el puerto + 1
	inc a			;bba1
	ld c,a			;bba2
	ld a,020h		;bba3   ; desde R#32...
	di			;bba5
	out (c),a		;bba6   ; R#17 = 32...
	ld a,091h		;bba8   ; ...con autoincremento
	out (c),a		;bbaa
	inc c			;bbac   ; el puerto + 3
	inc c			;bbad
	out (c),h		;bbae   ; SX = H
	xor a			;bbb0   ; SX alto 0
	out (c),a		;bbb1
	out (c),l		;bbb3   ; SY = L
	ex af,af'			;bbb5   ; la pagina de origen
	ld l,a			;bbb6   ; las paginas
	and 003h		;bbb7
	out (c),a		;bbb9
	out (c),d		;bbbb   ; DX = D
	xor a			;bbbd   ; DX alto 0
	out (c),a		;bbbe
	out (c),e		;bbc0   ; DY = E
	ld a,l			;bbc2   ; la pagina de destino
	rra			;bbc3   ; la de destino
	rra			;bbc4
	and 003h		;bbc5
	out (c),a		;bbc7
	pop hl			;bbc9   ; HL = BC
	out (c),h		;bbca   ; NX = B
	xor a			;bbcc   ; NX alto 0
	out (c),a		;bbcd
	out (c),l		;bbcf   ; NY = C
	out (c),a		;bbd1   ; NY alto 0
	out (c),a		;bbd3   ; el color 0
	out (c),a		;bbd5   ; ARG 0
	ld a,0d0h		;bbd7   ; HMMM
	out (c),a		;bbd9
	ei			;bbdb
	ret			;bbdc
rellena_hmmv:		; orden HMMV del VDP: B x C desde (H, L) de la pagina D con el byte A (B o C = 0: 256)
	ex af,af'			;bbdd   ; el byte, aparte
	call espera_al_vdp		;bbde   ; espera
	push bc			;bbe1
	ld a,(00007h)		;bbe2   ; el puerto de control
	inc a			;bbe5
	ld c,a			;bbe6
	ld a,024h		;bbe7   ; desde R#36
	di			;bbe9
	out (c),a		;bbea   ; R#17 = 36...
	ld a,091h		;bbec
	out (c),a		;bbee
	inc c			;bbf0   ; el puerto de registros
	inc c			;bbf1
	out (c),h		;bbf2   ; DX = H
	xor a			;bbf4   ; DX alto 0
	out (c),a		;bbf5
	out (c),l		;bbf7   ; DY = L
	out (c),d		;bbf9   ; la pagina
	pop hl			;bbfb   ; HL = BC
	out (c),h		;bbfc   ; NX = B
	cp h			;bbfe   ; con NX = 0...
	jr nz,L_BC02		;bbff
	inc a			;bc01   ; ...256
L_BC02:
	out (c),a		;bc02
	xor a			;bc04
	out (c),l		;bc05   ; NY = C
	cp l			;bc07   ; con NY = 0...
	jr nz,L_BC0B		;bc08
	inc a			;bc0a   ; ...256
L_BC0B:
	out (c),a		;bc0b
	ex af,af'			;bc0d
	out (c),a		;bc0e   ; el byte
	xor a			;bc10   ; ARG 0
	out (c),a		;bc11
	ld a,0c0h		;bc13   ; HMMV
	out (c),a		;bc15
	ei			;bc17
	ret			;bc18
linea_horizontal_63:		; orden LINE del VDP: B puntos en horizontal desde (H, L) de la pagina A con el color C
	ex af,af'			;bc19   ; la pagina, aparte
	call espera_al_vdp		;bc1a   ; espera
	push bc			;bc1d
	ld a,(00007h)		;bc1e   ; el puerto de control
	inc a			;bc21
	ld c,a			;bc22
	ld a,024h		;bc23
	di			;bc25
	out (c),a		;bc26   ; R#17 = 36...
	ld a,091h		;bc28
	out (c),a		;bc2a
	inc c			;bc2c   ; el puerto de registros
	inc c			;bc2d
	out (c),h		;bc2e   ; DX = H
	xor a			;bc30   ; DX alto 0
	out (c),a		;bc31
	out (c),l		;bc33   ; DY = L
	ex af,af'			;bc35
	out (c),a		;bc36   ; la pagina
	pop hl			;bc38   ; HL = BC
	out (c),h		;bc39   ; B de largo
	xor a			;bc3b   ; con B = 0...
	cp h			;bc3c
	jr nz,L_BC40		;bc3d
	inc a			;bc3f   ; ...256
L_BC40:
	out (c),a		;bc40
	xor a			;bc42   ; NY = 0
	out (c),a		;bc43
	out (c),a		;bc45
	out (c),l		;bc47   ; el color
	out (c),a		;bc49   ; ARG = 0: horizontal
	ld a,070h		;bc4b   ; LINE
	out (c),a		;bc4d
	ei			;bc4f   ; con interrupciones
	ret			;bc50
linea_vertical_63:		; la misma en vertical (ARG = 1)
	ex af,af'			;bc51   ; la pagina, aparte
	call espera_al_vdp		;bc52   ; espera
	push bc			;bc55
	ld a,(00007h)		;bc56   ; el puerto de control
	inc a			;bc59
	ld c,a			;bc5a
	ld a,024h		;bc5b
	di			;bc5d
	out (c),a		;bc5e   ; R#17 = 36...
	ld a,091h		;bc60
	out (c),a		;bc62
	inc c			;bc64   ; el puerto de registros
	inc c			;bc65
	out (c),h		;bc66   ; DX = H
	xor a			;bc68   ; DX alto 0
	out (c),a		;bc69
	out (c),l		;bc6b   ; DY = L
	ex af,af'			;bc6d
	out (c),a		;bc6e   ; la pagina
	pop hl			;bc70   ; HL = BC
	out (c),h		;bc71   ; B de largo
	xor a			;bc73   ; con B = 0...
	cp h			;bc74
	jr nz,L_BC78		;bc75
	inc a			;bc77   ; ...256
L_BC78:
	out (c),a		;bc78
	xor a			;bc7a   ; NY = 0
	out (c),a		;bc7b
	out (c),a		;bc7d
	out (c),l		;bc7f   ; el color
	inc a			;bc81   ; ARG = 1: vertical
	out (c),a		;bc82
	ld a,070h		;bc84   ; LINE
	out (c),a		;bc86
	ei			;bc88   ; con interrupciones
	ret			;bc89
marco_63:		; un marco de D x E de color C desde (H, L) en la pagina A: dos lineas verticales de E y dos horizontales de D
	ld b,e			;bc8a   ; la izquierda
	call vertical_guarda		;bc8b   ; vertical_guarda: p63:BC51 guardando todo
	ld b,d			;bc8e   ; arriba
	call horizontal_guarda		;bc8f   ; horizontal_guarda: p63:BC19 guardando todo
	push hl			;bc92   ; la Y + el alto
	push af			;bc93
	ld a,l			;bc94   ; abajo
	add a,e			;bc95
	ld l,a			;bc96
	ld b,d			;bc97   ; D de largo
	pop af			;bc98
	call horizontal_guarda		;bc99   ; horizontal_guarda: p63:BC19 guardando todo
	pop hl			;bc9c
	push af			;bc9d   ; la X + el ancho
	ld a,h			;bc9e   ; la derecha
	add a,d			;bc9f
	ld h,a			;bca0
	ld b,e			;bca1   ; E de largo
	pop af			;bca2
	jp vertical_guarda		;bca3   ; vertical_guarda: p63:BC51 guardando todo
vertical_guarda:		; p63:BC51 guardando todo
	push af			;bca6
	push hl			;bca7
	push de			;bca8
	push bc			;bca9
	call linea_vertical_63		;bcaa   ; linea_vertical_63: la misma en vertical (ARG = 1)
	pop bc			;bcad
	pop de			;bcae
	pop hl			;bcaf
	pop af			;bcb0
	ret			;bcb1
horizontal_guarda:		; p63:BC19 guardando todo
	push af			;bcb2
	push hl			;bcb3
	push de			;bcb4
	push bc			;bcb5
	call linea_horizontal_63		;bcb6   ; linea_horizontal_63: orden LINE del VDP: B puntos en horizontal desde (H, L) de la pagina A con el color C
	pop bc			;bcb9
	pop de			;bcba
	pop hl			;bcbb
	pop af			;bcbc
	ret			;bcbd
tablas_de_sprites_63:		; alterna las tablas de sprites: 0xF400/0xF600 o 0xF000/0xF200 en 0xCA0C-0xCA0F y R#5
	ld hl,(0ca0ch)		;bcbe   ; la de ahora
	bit 2,h		;bcc1   ; la de ahora es la 0xF4xx?
	ld hl,0f600h		;bcc3   ; la otra: atributos 0xF600...
	ld de,0f400h		;bcc6   ; ...colores 0xF400...
	ld bc,0e705h		;bcc9   ; ...R#5 = 0xE7
	jr z,pon_tablas_63		;bccc
	ld hl,0f200h		;bcce   ; o atributos 0xF200, colores 0xF000...
	ld de,0f000h		;bcd1   ; colores 0xF000
	ld b,0efh		;bcd4   ; ...R#5 = 0xEF
pon_tablas_63:
	ld (0ca0eh),hl		;bcd6   ; guarda la direccion en la VRAM de la tabla de atributos de sprites (16 bits)
	ld (0ca0ch),de		;bcd9   ; guarda la direccion en la VRAM de la tabla de colores de sprites (16 bits)
	jp escribe_registro		;bcdd   ; escribe_registro: R#C = B por el puerto del VDP de la BIOS (0x0007) + 1
sprites_a_vram_63:		; la copia de 0xDA00 (colores y atributos, 0x280 bytes) a la VRAM de 0xCA0C
	ld hl,0da00h		;bce0   ; apunta a la copia de la tabla de colores de sprites: 32 x 16 lineas (va con 0xDC00 detras)
	ld de,(0ca0ch)		;bce3   ; lee la direccion en la VRAM de la tabla de colores de sprites (16 bits)
	ld bc,00280h		;bce7   ; 0x280 bytes
	xor a			;bcea
	jp escribe_vram_63		;bceb   ; escribe_vram_63: BC bytes de HL a la VRAM de DE con otir
escribe_hexa:		; B bytes desde HL hacia atras en hexadecimal en (D, E), sin los ceros de la izquierda (salvo el ultimo byte)
	ld c,000h		;bcee   ; sin escribir ceros
byte_hexa:		; en el ultimo byte...
	dec b			;bcf0   ; el ultimo byte?
	jr nz,L_BCF5		;bcf1
	ld c,0ffh		;bcf3   ; ...ya se escriben
L_BCF5:
	inc b			;bcf5
	ld a,(hl)			;bcf6   ; la cifra alta...
	rra			;bcf7   ; la cifra alta
	rra			;bcf8
	rra			;bcf9
	rra			;bcfa
	call cifra_hexa		;bcfb   ; cifra_hexa: la cifra A en (D, E) y D 8 mas: el caracter A + 1 (0 en blanco si C = 0)
	ld a,(hl)			;bcfe   ; ...y la baja
	call cifra_hexa		;bcff   ; cifra_hexa: la cifra A en (D, E) y D 8 mas: el caracter A + 1 (0 en blanco si C = 0)
	dec hl			;bd02   ; el byte anterior
	djnz byte_hexa		;bd03   ; B bytes
	ret			;bd05
cifra_hexa:		; la cifra A en (D, E) y D 8 mas: el caracter A + 1 (0 en blanco si C = 0)
	and 00fh		;bd06   ; la cifra
	jr z,pon_cifra		;bd08   ; distinta de 0: ya se escriben
	ld c,0ffh		;bd0a   ; con cifra, ya se escriben
pon_cifra:		; el caracter A + 1...
	inc a			;bd0c
	and c			;bd0d   ; ...0 en blanco
	call caracter_63		;bd0e   ; caracter_63: el caracter A (8 x 8) de la pagina 3 a (D, E) de la pagina de dibujar
	ld a,d			;bd11   ; 8 a la derecha
	add a,008h		;bd12   ; 8 a la derecha
	ld d,a			;bd14
	ret			;bd15
caracter_63:		; el caracter A (8 x 8) de la pagina 3 a (D, E) de la pagina de dibujar
	push bc			;bd16
	push hl			;bd17
	push de			;bd18
	call sitio_de_caracter		;bd19   ; su sitio
	ld bc,00808h		;bd1c   ; 8 x 8
	ld a,(0ca42h)		;bd1f   ; de la 3 a la 0...
	and a			;bd22   ; la pagina de dibujar
	ld a,003h		;bd23
	jr z,L_BD29		;bd25
	ld a,007h		;bd27   ; ...o a la 1
L_BD29:
	call copia_hmmm		;bd29   ; copia_hmmm: orden HMMM del VDP: B x C de (H, L) a (D, E); A: pagina de origen (bits 0-1) y de destino (2-3)
	pop de			;bd2c
	pop hl			;bd2d
	pop bc			;bd2e
	ret			;bd2f
sitio_de_caracter:		; HL = el sitio del caracter A en la pagina 3: X = (A & 0x1F) * 8, Y = (A & 0xE0) / 4
	ld c,000h		;bd30
	ld b,a			;bd32   ; A aparte
	and 01fh		;bd33   ; la columna...
	add a,a			;bd35
	add a,a			;bd36
	add a,a			;bd37
	ld h,a			;bd38   ; ...* 8
	ld a,b			;bd39
	and 0e0h		;bd3a   ; la fila...
	rrca			;bd3c   ; / 4
	rrca			;bd3d
	add a,c			;bd3e
	ld l,a			;bd3f   ; ...* 8
	ret			;bd40
teclado_como_mando:		; el teclado como mando: 0xCA07-0xCA08 (flechas y espacio, p63:BD59) y 0xCA09-0xCA0A (p63:BD80) con lo recien pulsado
	call flechas_de_teclado		;bd41   ; las flechas y el espacio
	call mando_de_teclado		;bd44   ; mando_de_teclado:
	call teclas_de_funcion_63		;bd47   ; las otras teclas
	ld hl,0ca0ah		;bd4a   ; apunta a las teclas de funcion pulsadas: bit 0 F1, 1 F2, 2 F3, 3 F4, 4 F5, 5 RETURN
	jr recien_pulsado		;bd4d
mando_de_teclado:
	ld hl,0ca08h		;bd4f   ; apunta a el mando: joystick y teclado juntos (bits 0-3 las direcciones, 4-5 los disparos)
recien_pulsado:		; (HL) = A y en (HL - 1) los bits que no estaban
	ld c,(hl)			;bd52   ; lo de antes
	ld (hl),a			;bd53   ; lo de ahora
	xor c			;bd54   ; lo que cambia...
	and (hl)			;bd55   ; ...y esta pulsado
	dec hl			;bd56
	ld (hl),a			;bd57   ; lo recien pulsado
	ret			;bd58
flechas_de_teclado:		; A = las flechas (bits 0-3: arriba, abajo, izquierda, derecha) y el espacio (bit 4) de la fila 8, y la M (bit 5) de la fila 4
	ld a,004h		;bd59   ; la fila 4
	call 00141h		;bd5b   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;bd5e   ; pulsadas a 1
	rlca			;bd5f
	rlca			;bd60
	rlca			;bd61
	and 020h		;bd62   ; la M al bit 5
	ld e,a			;bd64
	ld a,008h		;bd65   ; la fila 8
	call 00141h		;bd67   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;bd6a   ; pulsadas a 1
	rrca			;bd6b
	rrca			;bd6c
	ld b,a			;bd6d
	and 004h		;bd6e   ; izquierda al bit 2
	or e			;bd70
	ld c,a			;bd71
	ld a,b			;bd72
	rrca			;bd73
	rrca			;bd74
	ld b,a			;bd75
	and 018h		;bd76   ; la derecha y el espacio a los bits 3-4
	or c			;bd78
	ld c,a			;bd79
	ld a,b			;bd7a
	rrca			;bd7b
	and 003h		;bd7c   ; arriba y abajo a los bits 0-1
	or c			;bd7e
	ret			;bd7f
teclas_de_funcion_63:		; A = las teclas F1-F3 (fila 6) y F4-F5 y RETURN (fila 7), como 0xCA0A
	ld a,006h		;bd80   ; la fila 6
	call 00141h		;bd82   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;bd85   ; pulsadas a 1
	and 0e0h		;bd86   ; F1-F3
	ld e,a			;bd88
	ld a,007h		;bd89   ; la fila 7
	call 00141h		;bd8b   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;bd8e   ; pulsadas a 1
	ld b,a			;bd8f
	and 003h		;bd90   ; F4 y F5
	or e			;bd92
	rlca			;bd93   ; a los bits 0-4
	rlca			;bd94
	rlca			;bd95
	ld e,a			;bd96
	ld a,b			;bd97
	and 080h		;bd98   ; RETURN...
	rrca			;bd9a   ; ...al bit 5
	rrca			;bd9b
	or e			;bd9c
	and 03fh		;bd9d
	ret			;bd9f
escribe_vram_63:		; BC bytes de HL a la VRAM de DE con otir
	call espera_al_vdp		;bda0   ; espera_al_vdp: espera a que el VDP acabe su orden (S#2, bit 0)
	ex de,hl			;bda3
	call direccion_vram_63		;bda4   ; la direccion
	call vueltas_de_otir		;bda7   ; las vueltas
	ex af,af'			;bdaa
	ld a,(00007h)		;bdab   ; el puerto de datos
	ld c,a			;bdae
	ex af,af'			;bdaf
escribe_bloque:		; B bytes, A veces
	otir		;bdb0   ; B bytes a la VRAM
	dec a			;bdb2   ; A veces
	jr nz,escribe_bloque		;bdb3
	ret			;bdb5
direccion_vram_63:		; la direccion HL de la VRAM para escribir: R#14 y el puerto
	push bc			;bdb6
	rra			;bdb7
	ld a,(00007h)		;bdb8   ; el puerto de control
	inc a			;bdbb
	ld c,a			;bdbc
	ld a,h			;bdbd   ; los bits 14-16 a R#14
	rla			;bdbe
	rla			;bdbf
	rla			;bdc0
	and 007h		;bdc1
	di			;bdc3   ; sin interrupciones
	out (c),a		;bdc4
	ld a,08eh		;bdc6   ; R#14
	out (c),a		;bdc8
	ld a,l			;bdca   ; el byte bajo...
	out (c),a		;bdcb
	ld a,h			;bdcd   ; ...y el alto para escribir
	and 03fh		;bdce   ; para escribir (bit 6)
	or 040h		;bdd0
	out (c),a		;bdd2
	pop bc			;bdd4
	ei			;bdd5
	ret			;bdd6
vueltas_de_otir:		; B = C, A = B (+1 con C distinto de 0)
	ex de,hl			;bdd7
	ld a,c			;bdd8   ; C = 0?
	or a			;bdd9
	ld a,b			;bdda
	ld b,c			;bddb   ; B = C
	ret z			;bddc   ; con C = 0, A vueltas de 256
	inc a			;bddd   ; si no, una mas
	ret			;bdde
lee_estado:		; A = el registro de estado A del VDP (R#15) y de vuelta al 0
	push bc			;bddf
	push hl			;bde0
	ld hl,(00006h)		;bde1   ; los puertos de la BIOS
	inc h			;bde4   ; el puerto de control (0x99)
	inc l			;bde5
	ld c,h			;bde6
	di			;bde7
	out (c),a		;bde8   ; R#15 = A
	ld a,08fh		;bdea
	out (c),a		;bdec
	ld c,l			;bdee
	in a,(c)		;bdef   ; lee el estado
	push af			;bdf1
	xor a			;bdf2   ; R#15 = 0
	ld c,h			;bdf3   ; R#15 = 0...
	out (c),a		;bdf4
	ld a,08fh		;bdf6
	out (c),a		;bdf8
	pop af			;bdfa
	pop hl			;bdfb
	pop bc			;bdfc
	ei			;bdfd
	ret			;bdfe
tecla_z:		; Z (fila 5, bit 7): todo el equipo (p63:BE1D a 0xD600) y 0xCA61 = 1
	ld a,005h		;bdff
	call 00141h		;be01   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;be04   ; pulsadas a 1
	and 080h		;be05   ; Z?
	ret z			;be07
	call todo_el_equipo		;be08   ; el equipo
	ld a,001h		;be0b   ; 0xCA61 = 1
	ld (0ca61h),a		;be0d   ; guarda 1-4: elige las rachas de p01:6F27 y la caja de p07:B889 (al azar cada 0xF0 cuadros en la mayoria de salas, p10:A0BB)
	ret			;be10
todo_el_equipo:		; los 0xC4 bytes de p63:BE1D a 0xD600: fichas [la tiene][cuenta en BCD] con 999 en las que cuentan
	ld hl,0be1dh		;be11   ; desde p63:BE1D...
	ld de,0d600h		;be14   ; ...al equipo
	ld bc,000c4h		;be17   ; 0xC4 bytes
	ldir		;be1a
	ret			;be1c

; ----------------------------------------------------------------------
; DATOS resto_BE1D: lo apuntan con el banco puesto p63:BE11 (0xBE1D); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p63:BE11 (196 bytes)
;   0xbe1d..0xbee1  (196 bytes)
DATA_resto_BE1D:
	defb 001h,099h,009h,000h,001h,099h,009h,000h,001h,099h,009h,000h,000h,000h,000h,000h	; be1d  ................
	defb 001h,099h,009h,000h,001h,099h,009h,000h,001h,099h,009h,000h,001h,099h,009h,000h	; be2d  ................
	defb 001h,001h,000h,000h,001h,099h,009h,000h,001h,010h,000h,000h,001h,001h,000h,000h	; be3d  ................
	defb 000h,000h,000h,000h,001h,001h,000h,000h,001h,001h,000h,000h,001h,001h,000h,000h	; be4d  ................
	defb 001h,001h,000h,000h,001h,001h,000h,000h,001h,001h,000h,000h,000h,000h,000h,000h	; be5d  ................
	defb 001h,001h,000h,000h,001h,001h,000h,000h,001h,001h,000h,000h,001h,001h,000h,000h	; be6d  ................
	defb 001h,001h,000h,000h,001h,001h,000h,000h,001h,001h,000h,000h,001h,001h,000h,000h	; be7d  ................
	defb 001h,001h,000h,000h,001h,001h,000h,000h,001h,001h,000h,000h,001h,001h,000h,000h	; be8d  ................
	defb 001h,001h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; be9d  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; bead  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,001h,001h,000h,000h,000h,000h,000h,000h	; bebd  ................
	defb 001h,001h,000h,000h,001h,010h,000h,000h,001h,010h,000h,000h,001h,010h,000h,000h	; becd  ................
	defb 001h,099h,000h,000h	; bedd

; ======================================================================
; CODIGO 0xbee1..0xbf6b  (138 bytes)
; ======================================================================


tecla_x:		; X (fila 5, bit 5): 0xD678-0xD6A7 a 1
	ld a,005h		;bee1
	call 00141h		;bee3   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;bee6   ; pulsadas a 1
	and 020h		;bee7   ; X?
	ret z			;bee9
	ld hl,0d678h		;beea   ; 0xD678...
	ld de,0d679h		;beed
	ld (hl),001h		;bef0   ; ...a 1...
	ld bc,0002fh		;bef2   ; ...0x30 bytes
	ldir		;bef5
	ret			;bef7
teclas_ins_del:		; la fila 8: INS, 0xCA3C = 1; DEL, 0xCA3C = 0
	ld a,008h		;bef8
	call 00141h		;befa   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;befd   ; pulsadas a 1
	rra			;befe   ; INS?
	rra			;beff
	rra			;bf00
	ld c,001h		;bf01   ; 1 con INS
	jr c,pon_ca3c		;bf03
	rra			;bf05   ; DEL?
	ret nc			;bf06
	ld c,000h		;bf07   ; 0 con DEL
pon_ca3c:
	ld a,c			;bf09
	ld (0ca3ch),a		;bf0a   ; a 0xCA3C
	ret			;bf0d
tecla_bs:		; BS (fila 7, bit 5): 0xD430 = 2 y el bit 4 de 0xD7D1
	ld a,007h		;bf0e
	call 00141h		;bf10   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	bit 5,a		;bf13   ; BS?
	ret nz			;bf15
	ld a,002h		;bf16   ; 0xD430 = 2...
	ld (0d430h),a		;bf18
	ld hl,0d7d1h		;bf1b   ; ...y el bit 4 de 0xD7D1
	set 4,(hl)		;bf1e
	ret			;bf20
tecla_t:		; T (fila 5, bit 1): 0xCA8E = 1
	ld a,005h		;bf21
	call 00141h		;bf23   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	bit 1,a		;bf26   ; T?
	ret nz			;bf28
	ld a,001h		;bf29   ; 0xCA8E = 1
	ld (0ca8eh),a		;bf2b   ; guarda 1-2: hacia donde va 0xCA89 (0 o 4; p10:A0DB)
	ret			;bf2e
tecla_r:		; R (fila 4, bit 7): 0xD6B4, 0xD6B8 y 0xD6BC a 1 con 0x20, 0x40 y 0x60 detras
	ld a,004h		;bf2f
	call 00141h		;bf31   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	bit 7,a		;bf34   ; R?
	ret nz			;bf36
	ld hl,0d6b4h		;bf37   ; 0xD6B4 = 1...
	ld (hl),001h		;bf3a
	inc hl			;bf3c
	ld (hl),020h		;bf3d   ; ...0xD6B5 = 0x20
	ld hl,0d6b8h		;bf3f   ; 0xD6B8 = 1...
	ld (hl),001h		;bf42
	inc hl			;bf44
	ld (hl),040h		;bf45   ; ...0xD6B9 = 0x40
	ld hl,0d6bch		;bf47   ; 0xD6BC = 1...
	ld (hl),001h		;bf4a
	inc hl			;bf4c
	ld (hl),060h		;bf4d   ; ...0xD6BD = 0x60
	ret			;bf4f
tecla_circunflejo:		; ^ (fila 1, bit 3): 0xD700-0xD71F a 0 y 0xCAAF = 1
	ld a,001h		;bf50
	call 00141h		;bf52   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	bit 3,a		;bf55   ; ^?
	ret nz			;bf57
	ld hl,0d700h		;bf58   ; 0xD700...
	ld de,0d701h		;bf5b   ; apunta a 1 con la pantalla de F2/F3 ya montada (cada cuadro, p10:AED6); en el estado 7, su paso (p13:9555)
	ld (hl),000h		;bf5e   ; ...0x20 bytes a 0
	ld bc,0001fh		;bf60
	ldir		;bf63
	ld a,001h		;bf65   ; 0xCAAF = 1
	ld (0caafh),a		;bf67
	ret			;bf6a

; ----------------------------------------------------------------------
; DATOS relleno_ff: 149 bytes a 0xFF hasta el final del banco: relleno; lo
;   leen nadie (149 bytes)
;   0xbf6b..0xc000  (149 bytes)
DATA_relleno_ff:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf6b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf7b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf8b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf9b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfab  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfbb  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfcb  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfdb  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfeb  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh	; bffb
