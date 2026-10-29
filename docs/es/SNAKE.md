# Snake

## Lo que hace

Jugado por el cartucho con el mando emulado (`tools/snake.py gif`): cada
cuadro, las teclas a `0xCA08` y `0xCA07` y el bucle de la partida
(`p01:741A`), y se pinta la sala entera, como en la pantalla, al ritmo del
MSX (un cuadro del juego cada 5 del VDP, medido en openMSX). Es la sala 0 de
la zona 0, donde empieza la partida.

**Andar**, arriba, izquierda, abajo y derecha:

![Andar](../imagenes/snake_andar.gif)

**Arrastrarse** (los dos disparos a la vez para echarse):

![Arrastrarse](../imagenes/snake_arrastrarse.gif)

**El golpe** (el disparo 2, `disparo_2`, `p03:A360`: el estado 3 durante 4
cuadros), en las cuatro direcciones; el disparo 1 usa el arma:

![El golpe](../imagenes/snake_golpe.gif)

**Con la pistola** (`0xCB20` = 1):

![Con la pistola](../imagenes/snake_pistola.gif)

**Dentro de la caja de cartón** (ダンボール, `0xCB21` = 0x0A): un solo dibujo,
el 0x0B, con sus colores fijos (`p12:7AE5`), que se desliza:

![Dentro de la caja](../imagenes/snake_caja.gif)

**Bajo el cubo** (バケツ, `0xCB21` = 0x0B):

![Bajo el cubo](../imagenes/snake_cubo.gif)

## Todos sus dibujos

Cada dibujo una sola vez (los que a la vista son iguales, quitados), una fila
por número de dibujo: 0, 1, 2, 3, 4, 8, 9, 0x0A, 0x0B, 0x0C y 0x0E. El 9
(`p63:B27A`) parece el 0 pero no lo es: cada imagen cambia en 20 a 67
puntos.

![Los dibujos de Snake, sin repetir](../imagenes/snake_hoja.png)

## Cómo se pinta

Snake son **cuatro sprites de 16 x 16**: dos arriba y dos 16 puntos más
abajo, y en cada pareja el segundo lleva el bit CC, que suma sus colores a
los del primero (`dibuja_snake`, `p12:7688`). Sus patrones no son fijos:
cada cuadro se copian a la tabla de patrones de sprites (`0xF800`), desde la
página 3 de la VRAM, los cuatro del dibujo que toca (`p12:76E9`), y sus
colores salen, línea a línea, de las rachas de `p63:B282` y `p63:B620`. El
dibujo es `0xCB01`; recorriendo sus tablas (`p63:B1CC-B282`) salen 98
distintos. La partida empieza con el 0x0D, que deja los sprites fuera, hasta
que Snake llega. El 7 (darse la vuelta arrastrándose) no ha salido jugando.

## Las armas (F2)

![WEAPON SELECT](../imagenes/armas.png)

Snake lleva sus cosas en fichas de cuatro bytes: **13 armas** en `0xD600` y
**34 cosas de equipo** en `0xD638` ([la tiene] [la cuenta, en BCD] [...]).
F2 abre la pantalla de armas (`p10:AED6`) y F3 la de equipo (`p10:AF30`); el
letrero de lo que hay bajo el cursor sale de la tabla de `p50:8046` o de
`p50:8048` (`letrero_de_lo_elegido`, `p10:B8C7`). Las dos pantallas, con todo
puesto, las pinta el cartucho (`tools/equipo.py`).

Los letreros de F2, tal como los tiene la ROM:

<!-- generado:armas -->
| Casilla | | | Letrero | Traducción |
|---:|---|---|---|---|
| 0 | | | (ninguna) | |
| 1 | ![](../imagenes/equipo/f2_c01.png) | `p51:B546` | **ハンドガン ［ベレッタM92F］** アメリカ軍用セイシキピストルとしてサイヨウされているセミオートマチックピストル。サイレンサーソウチャクカ。タマホキュウカ。 | PISTOLA [Beretta M92F]. Pistola semiautomática adoptada como arma oficial del ejército de EE. UU. Admite silenciador. Se puede reponer munición. |
| 2 | ![](../imagenes/equipo/f2_c02.png) | `p51:B59A` | **サブマシンガン ［イングラムM11］** アメリカのコガタケイリョウSMG。ショットキーをおしつづけるとフルオートになる。サイレンサーソウチャクカ。タマホキュウカ。 | SUBFUSIL [Ingram M11]. Subfusil americano pequeño y ligero. Manteniendo la tecla de disparo, ráfaga. Admite silenciador. Se puede reponer munición. |
| 3 | ![](../imagenes/equipo/f2_c03.png) | `p51:B5ED` | **グレネード ［M68］** アメリカセイ、チャクハツシンカンシキハヘンシュリュウダン。ジメンにトウタツするとバクハツする。ラッカチテンはターゲット上。 | GRANADA [M68]. Granada de fragmentación americana de espoleta de impacto. Estalla al llegar al suelo. Cae sobre el objetivo. |
| 4 | | | (ninguna) | |
| 5 | ![](../imagenes/equipo/f2_c05.png) | `p51:B63B` | **タイクウミサイル ［スティンガー］** ケイタイシキ、タイクウミサイル。レーダー内のショウジュンをカーソルイドウさせ、ショットキーでハッシャする。レーダー内カノウ。 | MISIL ANTIAÉREO [Stinger]. Misil antiaéreo portátil. Se mueve el punto de mira por el radar y se dispara con la tecla de disparo. Sirve dentro del radar. |
| 6 | ![](../imagenes/equipo/f2_c06.png) | `p51:B690` | **リモコンミサイル ［M47ドラゴン］** シュ動モクシセン指令ホウシキによりハッシャゴのミサイルとモクヒョウをモクシによるカーソルソウサでホウコウをシュウセイできる。 | MISIL TELEDIRIGIDO [M47 Dragon]. Con guiado manual por línea de mira, el rumbo del misil se corrige tras el disparo moviendo un cursor a ojo. |
| 7 | ![](../imagenes/equipo/f2_c07.png) | `p51:B6E7` | **プラスチック・バクダン** ヘンケイカノウなケイリョウコウセイノウバクヤク。 | EXPLOSIVO PLÁSTICO. Explosivo ligero y potente que se puede moldear. |
| 8 | ![](../imagenes/equipo/f2_c08.png) | `p51:B70E` | **ジライ ［M 78］** ショットキーでセット、ホフクで真上を通るとカイシュウ。タンチキがあればレーダー上にうつる。レーダー内にサイダイ16コセットカ。 | MINA [M 78]. Se pone con la tecla de disparo; se recoge pasando arrastrándose justo encima. Con el detector sale en el radar. Hasta 16 dentro del radar. |
| 9 | ![](../imagenes/equipo/f2_c09.png) | `p51:B808` | **カモフラージュ・マット ［ファントム07］** あらゆるVRAMにタイオウできるカモフラージュ・マット。ショットキーでセット、真上を通るとカイシュウ。下に潜れば見えなくなる。 | MANTA DE CAMUFLAJE [Phantom 07]. Manta de camuflaje compatible con cualquier VRAM. Se pone con la tecla de disparo y se recoge pasando encima. Debajo no te ven. |
| 10 | ![](../imagenes/equipo/f2_c0A.png) | `p51:B761` | **ムリョク化ガス ［ABC M25A2］** ボウドウチンアツ用シュリュウダン。バクハツするとCN1ガスをかざ下にフンシュツする。かざ上でのシヨウはキケン。 | GAS PARALIZANTE [ABC M25A2]. Granada antidisturbios. Al estallar suelta gas CN1 a favor del viento. Usarla con el viento en contra es peligroso. |
| 11 | ![](../imagenes/equipo/f2_c0B.png) | `p51:B7B3` | **マウス ［ジェリー2］** シカケやセンサーを発見するのにつかうダミーロボット。物音モードのカイジョにもつかえる。ショットキーでプレイヤーの前方へはしる。 | RATÓN [Jerry 2]. Robot señuelo para encontrar trampas y sensores. También sirve para quitar el modo ruido. Con la tecla de disparo corre delante del jugador. |
| 12 | ![](../imagenes/equipo/f2_c0C.png) | `p51:B866` | **ライター ［JR TOKAI］。** どこにでもうっている100エンライター。シヨウホウホウはフメイ。 | MECHERO [JR TOKAI]. Un mechero de 100 yenes de los que se venden en todas partes. Modo de empleo: desconocido. |
| 13 | | | (ninguna) | |
<!-- /generado -->

## El equipo (F3)

![EQUIPMENT SELECT](../imagenes/equipo.png)

<!-- generado:equipo -->
| Casilla | | | Letrero | Traducción |
|---:|---|---|---|---|
| 0 | | | (ninguna) | |
| 1 | ![](../imagenes/equipo/f3_c01.png) | `p51:B89A` | **タバコ ［ラッキー・ストライカー］** ゼンカイにひきつづき、SNAKEアイヨウのタバコ。コドクな戦場にはイキヌキもヒツヨウ。しかし・・・真のシヨウホウホウはフメイ。 | TABACO [Lucky Striker]. El tabaco favorito de SNAKE, como la otra vez. En el solitario campo de batalla también hace falta un respiro. Pero... su verdadero uso es desconocido. |
| 2 | ![](../imagenes/equipo/f3_c02.png) | `p51:BA39` | **ソウガンキョウ ［ニコス F500］** これをつかうとプレイヤーを中心に上下左右のガメンを見ることができる。 | PRISMÁTICOS [Nikos F500]. Con ellos se ven las pantallas de arriba, abajo, izquierda y derecha del jugador. |
| 3 | ![](../imagenes/equipo/f3_c03.png) | `p51:BB19` | **ナイトビュア** クラヤミでも真ヒルのように見えるアンシゴーグル。これをソウビすればいかなるクラヤミでも見えるようになる。 | VISOR NOCTURNO. Gafas de visión nocturna que ven la oscuridad como a pleno día. Puestas, se ve en cualquier oscuridad. |
| 4 | ![](../imagenes/equipo/f3_c04.png) | `p51:B943` | **ガスマスク［ライアット・フェイス・マスク］** これをソウビするとドクガス・エリアでO2ゲージが2バイになり、へり方もおそくなりタイキュウ時間がのびる。ムリョク化ガスにもカ。 | MÁSCARA ANTIGÁS [Riot Face Mask]. Puesta, en las zonas de gas venenoso el indicador de O2 se dobla y baja más despacio: se aguanta más. También sirve contra el gas paralizante. |
| 5 | ![](../imagenes/equipo/f3_c05.png) | `p51:B8F2` | **ボディ・アーマー ［S・P・S］** テキからのダメージがハンゲンするボウダンチョッキ。サイレント・パートナー・スペシャルといわれ、ジュウダンにのみユウコウ。 | CHALECO ANTIBALAS [S.P.S.]. Chaleco que reduce a la mitad el daño enemigo. Lo llaman Silent Partner Special; solo sirve contra las balas. |
| 6 | | | (ninguna) | |
| 7 | ![](../imagenes/equipo/f3_c07.png) | `p51:B9E7` | **サンソボンベ** これをソウビすると水中でのO2ゲージが2バイになり、へり方もおそくなり潜水時間がながくなる。水上に上がればマンタンにもどる。 | BOTELLA DE OXÍGENO. Puesta, bajo el agua el indicador de O2 se dobla y baja más despacio: se bucea más rato. Se llena al salir a la superficie. |
| 8 | ![](../imagenes/equipo/f3_c08.png) | `p51:B99F` | **ジライタンチキ** これをソウビするとジライがレーダー上にしろいコウテンとなってうつる。プレイヤーのしかけたジライもドウヨウにハンノウする。 | DETECTOR DE MINAS. Puesto, las minas salen en el radar como puntos blancos. Las que pone el jugador también. |
| 9 | ![](../imagenes/equipo/f3_c09.png) | `p51:BAF4` | **ハングライダー** 戦場でのリヨウカチはなし。シヨウホウホウはフメイ。 | ALA DELTA. No vale para nada en el campo de batalla. Modo de empleo: desconocido. |
| 10 | ![](../imagenes/equipo/f3_c0A.png) | `p51:BA77` | **ダンボール** タッキュウビンのどこにでもあるようなダンボールのハコ。ザンジバーランドいきのデンピョウがはられている。シヨウホウホウはフメイ。 | CAJA DE CARTÓN. Una caja de cartón como las de cualquier mensajería. Lleva una etiqueta para Zanzíbar. Modo de empleo: desconocido. |
| 11 | ![](../imagenes/equipo/f3_c0B.png) | `p51:BABF` | **バケツ** トイレそうじ用のカネセイのゴミバケツ。かなりじょうぶなシロモノだ。シヨウホウホウはフメイ。 | CUBO. Un cubo metálico de limpiar retretes. Bastante resistente. Modo de empleo: desconocido. |
| 12 | ![](../imagenes/equipo/f3_c0C.png) | `p51:BBF4` | **カゼグスリ ［PLカル ホワイト］** エン化リゾチームハイゴウのビエン用カゼグスリ。くしゃみ、はな水、はなづまり、なみだ目にきく。15サイ以上、1かい、1カプセル。 | MEDICINA PARA EL RESFRIADO [PL Cal White]. Medicina nasal con cloruro de lisozima. Para estornudos, moqueo, nariz tapada y ojos llorosos. Mayores de 15 años: 1 cápsula cada vez. |
| 13 | ![](../imagenes/equipo/f3_c0D.png) | `p51:BB84` | **カセットテープ** ナターシャのロッカーにあったカセットテープ。ザンジバーランドのコッカがロクオンされている。 | CINTA DE CASETE. La cinta que había en la taquilla de Natasha. Lleva grabado el himno de Zanzíbar. |
| 14 | ![](../imagenes/equipo/f3_c0E.png) | `p51:BB5A` | **タマゴ** バイオラボにあったタマゴ。たべられそうにはない。シヨウホウホウはフメイ。 | HUEVO. Un huevo del laboratorio biológico. No parece comestible. Modo de empleo: desconocido. |
| 15 | ![](../imagenes/equipo/f3_c0F.png) | `p51:BB5A` | **タマゴ** (= 14) | (= 14) |
| 16 | ![](../imagenes/equipo/f3_c10.png) | `p51:BC4E` | **ブローチ** ナターシャがくれたブローチ。ザンジバーランドのマークがモチーフされている。シヨウホウホウはフメイ。ナターシャのにおいがする。 | BROCHE. El broche que le dio Natasha. Tiene por motivo el emblema de Zanzíbar. Modo de empleo: desconocido. Huele a Natasha. |
| 17 | ![](../imagenes/equipo/f3_c11.png) | `p51:BD04` | **レッド・カード** カード1から3をダイヨウするマスター・カード。 | TARJETA ROJA. Tarjeta maestra que vale por las tarjetas 1 a 3. |
| 18 | ![](../imagenes/equipo/f3_c12.png) | `p51:BD25` | **ブルー・カード** カード4から6をダイヨウするマスター・カード。 | TARJETA AZUL. Tarjeta maestra que vale por las tarjetas 4 a 6. |
| 19 | ![](../imagenes/equipo/f3_c13.png) | `p51:BD46` | **グリーン・カード** カード7から9をダイヨウするマスター・カード。 | TARJETA VERDE. Tarjeta maestra que vale por las tarjetas 7 a 9. |
| 20 | ![](../imagenes/equipo/f3_c14.png) | `p51:BCE7` | **カード** ザンジバーランドでシヨウされているICカード。 | TARJETA. Tarjeta con chip de las que se usan en Zanzíbar. |
| 21 | ![](../imagenes/equipo/f3_c15.png) | `p51:BCE7` | **カード** (= 20) | (= 20) |
| 22 | ![](../imagenes/equipo/f3_c16.png) | `p51:BCE7` | **カード** (= 20) | (= 20) |
| 23 | ![](../imagenes/equipo/f3_c17.png) | `p51:BCE7` | **カード** (= 20) | (= 20) |
| 24 | ![](../imagenes/equipo/f3_c18.png) | `p51:BCE7` | **カード** (= 20) | (= 20) |
| 25 | ![](../imagenes/equipo/f3_c19.png) | `p51:BCE7` | **カード** (= 20) | (= 20) |
| 26 | ![](../imagenes/equipo/f3_c1A.png) | `p51:BCE7` | **カード** (= 20) | (= 20) |
| 27 | ![](../imagenes/equipo/f3_c1B.png) | `p51:BCE7` | **カード** (= 20) | (= 20) |
| 28 | ![](../imagenes/equipo/f3_c1C.png) | `p51:BCE7` | **カード** (= 20) | (= 20) |
| 29 | ![](../imagenes/equipo/f3_c1D.png) | `p51:BC94` | **スプレー ［ミセス・スプレー］** ジメチエーテル、LPガスをつかったキョウネンセイのラッカー用スプレー。カキゲンキンとかかれている。イロはメタリックグレイだ。 | SPRAY [Mrs. Spray]. Spray de laca con dimetiléter y gas LP, muy inflamable. Pone «no acercar al fuego». El color es gris metalizado. |
| 30 | | | (ninguna) | |
| 31 | ![](../imagenes/equipo/f3_c1F.png) | `p51:BBBC` | **カートリッジ** マルフののこしたゲームカートリッジ。この中にOILIXのマイクロフィルムがかくされている。 | CARTUCHO. El cartucho de juego que dejó Marv. Dentro está escondido el microfilm de OILIX. |
| 32 | ![](../imagenes/equipo/f3_c20.png) | `p51:BD68` | **Cレーション ［B1ユニット］** ショットキーでタイリョクのカイフクができるギュウニク、ブタニク、ハムエッグ、ツナフィッシュ、チョコレート、クラッカーをふくむ。 | RACIÓN C [unidad B1]. Con la tecla de disparo recupera vida. Lleva ternera, cerdo, jamón con huevo, atún, chocolate y galletas. |
| 33 | ![](../imagenes/equipo/f3_c21.png) | `p51:BDBB` | **Cレーション ［B2ユニット］** ショットキーでタイリョクのカイフクができるマメとミートボールのトマトニ、マメとフランクフルト、ギュウニクのポテトニをふくむ。 | RACIÓN C [unidad B2]. Con la tecla de disparo recupera vida. Lleva alubias con albóndigas en tomate, alubias con salchichas y ternera con patatas. |
| 34 | ![](../imagenes/equipo/f3_c22.png) | `p51:BE0D` | **Cレーション ［B3ユニット］** ショットキーでタイリョクのカイフクができるスライスハム、ニワトリとシチメンチョウ、スパゲッティ、チーズ、コーヒーをふくむ。 | RACIÓN C [unidad B3]. Con la tecla de disparo recupera vida. Lleva jamón en lonchas, pollo y pavo, espaguetis, queso y café. |
<!-- /generado -->

## El radar

![El radar, jugado: barrido, puntos, la alerta 2 y la alerta 1](../imagenes/radar.gif)

El recuadro de la derecha (`pon_radar`, `p12:6F49`) dibuja las **3 x 3 salas**
de alrededor de la de Snake desde el mapa de `0xD900` (`fondo_del_radar`,
`p12:6EC8`), una raya que lo barre (`p12:6D78`) y, al acabar cada barrido, un
punto por enemigo (`p12:6CE0`).

Cuando un enemigo ve a Snake (`alerta_sin_musica`, `p04:9955`) el radar se
cambia por la alerta 2: **危険** con LEVEL y LIFE; con la alerta 1
(`p04:934C`), **回避** con LEVEL y TIME. LEVEL es la alerta más uno (tope 3); LIFE, la vida
de Snake (`0xCA53`); TIME, la cuenta `0xD42B` entre 8 (`rotulos_de_alerta`,
`p04:984C`). El GIF lo juega el cartucho (`tools/radar.py`) en la sala 2 de
la zona 6, al ritmo del MSX: el radar solo, la alerta 2 a los 200 cuadros
(como la pone un enemigo que ve a Snake, `p04:9955`) y la 1 a los 300.

Los dibujos de las salas del radar (sus mapas de bits) están en la **RAM**
de `0x8000`, no en el cartucho: al entrar en la zona el juego pone su RAM en
esa ventana (`ENASLT` con el slot de `0xC386`) y los copia ahí
(`p00:5BE0`), y `dibujo_a_7000` (`p12:6F93`) los lee igual. Pintado sin esa
RAM, el radar sale lleno de ruido, como con interferencias.
