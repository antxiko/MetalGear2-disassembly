# Curiosidades de los textos y el transceptor (fase 4)

Cada una con lo que la prueba. Herramientas: `tools/textos.py` (todos, letreros,
transceptor), `tools/prueba_conversaciones.py`, `tools/retratos.py`.

## El 140.99 que al cargar es 140.98

- Tras el mensaje p48:9D50, el juego ejecuta la conversacion 30 de la lista
  p48:800C (p06:B054): la bandera 0xA2 (bit 5 de 0xD7E4) y el sitio 1 de la
  lista de numeros, el de マスター (140.38), a 0x99: 140.99.
- Al seguir la partida desde lo guardado (sigue_la_partida p01:7595 ->
  empieza_la_partida p02:9E94 -> d790_al_empezar p09:B62F) la lista se rehace
  y, con esa bandera, el sitio 1 pasa a 0x98 (p09:B66D): 140.98.
- Ejecutado en el cartucho (tools/mg2run.py): 0x38 -> p06:B054 -> 0x99 ->
  p09:B62F -> 0x98.
- Pero el mensaje p48:9D50 (firmado キャンベル; dice ser キャリー: «papa se ha
  ido a pescar... se llevo la radio... la frecuencia es 140.99») no lo nombra
  ningun puntero de la ROM (barrido de los 64 bancos: solo la lista de 36 de
  p48:800C, que sirve para reconocerlo, no para ponerlo), y ninguna ficha de
  conversacion mira la bandera 0xA2. Todo apunta a un texto que el juego no
  ensena; no esta contrastado jugando.

## Erratas del propio cartucho

- El objeto se llama «グレーン　カード» (p51:B38F) y su ficha dice «グリーン・カード»
  (p51:BD46).
- «ボデイ・アーマー» (p51:B33C) y en su ficha «ボディ・アーマー» (p51:B8F2).

## La basura que Snake recoge y tira

«を、ニュウシュした。 / しかし、つかいみちが ないのですてよう！» (p51:B1D9, B1E4):
espinas de pescado, cacas de paloma, una piel de serpiente, el brazo derecho de
un maniqui, una rata muerta, una «バグチェックリスト» (lista de fallos), una
colilla, una piel de platano, «コナミ　パラダイム» y una botella vacia (p51:B1F9-B244).

## El cartucho dentro del juego

Pettrovich (p50:8E6D): los planos de OILIX van en un microfilm escondido en la
placa de un cartucho de juego MSX de una empresa japonesa llamada Konami; Snake
contesta que el MSX es el ordenador con mas maquinas vendidas del mundo.

## Quienes son

- BLACK COLOR es Kyle Schneider, el de la resistencia de OUTER HEAVEN (p50:887B).
- Los once jefes, con el mensaje que los nombra: tools/jefes_web.py (NOMBRES).

## La fuente

128 kanji en la pagina 3 (franja 0xF8); 114 salen en algun texto y 14 nunca:
火 面 国 制 多 特 表 武 歩 保 民 百 野 略 (de 面 国 表 百 la lectura no la confirma
ninguna frase).

## Las fichas de conversacion

mira_condiciones (p01:6104): sin el bit 4 de la cabeza, la ficha vale con todas
sus banderas puestas; con el bit 4, con la ultima puesta y las demas no. Ninguna
ficha de p48 usa el bit 4. Contrastado: 3000 de 3000 iguales al cartucho.
