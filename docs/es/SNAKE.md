# Snake

## Sus dibujos

![Los 98 dibujos de Snake](../imagenes/snake.png)

Snake son **cuatro sprites de 16 x 16**: dos arriba y dos 16 puntos más
abajo, y en cada pareja el segundo lleva el bit CC, que suma sus colores a
los del primero (`dibuja_snake`, `p12:7688`). Sus patrones no son fijos:
cada cuadro se copian a la tabla de patrones de sprites (`0xF800`), desde la
página 3 de la VRAM, los cuatro del dibujo que toca (`p12:76E9`), y sus colores salen, línea a
línea, de las rachas de `p63:B282` y `p63:B620`.

El dibujo es `0xCB01` y cada uno elige dentro según la dirección y el paso
(`tools/snake.py`, con las tablas de `p63:B1CC-B282`). Aquí van los **98
distintos** que salen de recorrer esas tablas, una fila por dibujo: 0-4, 7-0x0C
y 0x0E (los 5 y 6 no dan ninguna imagen que no esté ya en otro, y el 0x0D deja
los sprites fuera). Entre ellos están andar, darse la vuelta,
el golpe y arrastrarse, el 0x0B con sus colores fijos (`p12:7AE5`) y la
llegada (el 0x0E, `p11:A090`). Jugando con el mando emulado salen 47, todos
entre estos; el 7 no ha salido jugando (ver [Curiosidades](CURIOSIDADES.html)).

Pintados por el cartucho ejecutado (`tools/mg2run.py`) en la sala 0 de la
zona 0, con su paleta, cotejada con openMSX.

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
| Casilla | | Letrero |
|---:|---|---|
| 0 | | (ninguna) |
| 1 | `p51:B546` | **ハンドガン ［ベレッタM92F］** アメリカ軍用セイシキピストルとしてサイヨウされているセミオートマチックピストル。サイレンサーソウチャクカ。タマホキュウカ。 |
| 2 | `p51:B59A` | **サブマシンガン ［イングラムM11］** アメリカのコガタケイリョウSMG。ショットキーをおしつづけるとフルオートになる。サイレンサーソウチャクカ。タマホキュウカ。 |
| 3 | `p51:B5ED` | **グレネード ［M68］** アメリカセイ、チャクハツシンカンシキハヘンシュリュウダン。ジメンにトウタツするとバクハツする。ラッカチテンはターゲット上。 |
| 4 | | (ninguna) |
| 5 | `p51:B63B` | **タイクウミサイル ［スティンガー］** ケイタイシキ、タイクウミサイル。レーダー内のショウジュンをカーソルイドウさせ、ショットキーでハッシャする。レーダー内カノウ。 |
| 6 | `p51:B690` | **リモコンミサイル ［M47ドラゴン］** シュ動モクシセン指令ホウシキによりハッシャゴのミサイルとモクヒョウをモクシによるカーソルソウサでホウコウをシュウセイできる。 |
| 7 | `p51:B6E7` | **プラスチック・バクダン** ヘンケイカノウなケイリョウコウセイノウバクヤク。 |
| 8 | `p51:B70E` | **ジライ ［M 78］** ショットキーでセット、ホフクで真上を通るとカイシュウ。タンチキがあればレーダー上にうつる。レーダー内にサイダイ16コセットカ。 |
| 9 | `p51:B808` | **カモフラージュ・マット ［ファントム07］** あらゆるVRAMにタイオウできるカモフラージュ・マット。ショットキーでセット、真上を通るとカイシュウ。下に潜れば見えなくなる。 |
| 10 | `p51:B761` | **ムリョク化ガス ［ABC M25A2］** ボウドウチンアツ用シュリュウダン。バクハツするとCN1ガスをかざ下にフンシュツする。かざ上でのシヨウはキケン。 |
| 11 | `p51:B7B3` | **マウス ［ジェリー2］** シカケやセンサーを発見するのにつかうダミーロボット。物音モードのカイジョにもつかえる。ショットキーでプレイヤーの前方へはしる。 |
| 12 | `p51:B866` | **ライター ［JR TOKAI］。** どこにでもうっている100エンライター。シヨウホウホウはフメイ。 |
| 13 | | (ninguna) |
<!-- /generado -->

## El equipo (F3)

![EQUIPMENT SELECT](../imagenes/equipo.png)

<!-- generado:equipo -->
| Casilla | | Letrero |
|---:|---|---|
| 0 | | (ninguna) |
| 1 | `p51:B89A` | **タバコ ［ラッキー・ストライカー］** ゼンカイにひきつづき、SNAKEアイヨウのタバコ。コドクな戦場にはイキヌキもヒツヨウ。しかし・・・真のシヨウホウホウはフメイ。 |
| 2 | `p51:BA39` | **ソウガンキョウ ［ニコス F500］** これをつかうとプレイヤーを中心に上下左右のガメンを見ることができる。 |
| 3 | `p51:BB19` | **ナイトビュア** クラヤミでも真ヒルのように見えるアンシゴーグル。これをソウビすればいかなるクラヤミでも見えるようになる。 |
| 4 | `p51:B943` | **ガスマスク［ライアット・フェイス・マスク］** これをソウビするとドクガス・エリアでO2ゲージが2バイになり、へり方もおそくなりタイキュウ時間がのびる。ムリョク化ガスにもカ。 |
| 5 | `p51:B8F2` | **ボディ・アーマー ［S・P・S］** テキからのダメージがハンゲンするボウダンチョッキ。サイレント・パートナー・スペシャルといわれ、ジュウダンにのみユウコウ。 |
| 6 | | (ninguna) |
| 7 | `p51:B9E7` | **サンソボンベ** これをソウビすると水中でのO2ゲージが2バイになり、へり方もおそくなり潜水時間がながくなる。水上に上がればマンタンにもどる。 |
| 8 | `p51:B99F` | **ジライタンチキ** これをソウビするとジライがレーダー上にしろいコウテンとなってうつる。プレイヤーのしかけたジライもドウヨウにハンノウする。 |
| 9 | `p51:BAF4` | **ハングライダー** 戦場でのリヨウカチはなし。シヨウホウホウはフメイ。 |
| 10 | `p51:BA77` | **ダンボール** タッキュウビンのどこにでもあるようなダンボールのハコ。ザンジバーランドいきのデンピョウがはられている。シヨウホウホウはフメイ。 |
| 11 | `p51:BABF` | **バケツ** トイレそうじ用のカネセイのゴミバケツ。かなりじょうぶなシロモノだ。シヨウホウホウはフメイ。 |
| 12 | `p51:BBF4` | **カゼグスリ ［PLカル ホワイト］** エン化リゾチームハイゴウのビエン用カゼグスリ。くしゃみ、はな水、はなづまり、なみだ目にきく。15サイ以上、1かい、1カプセル。 |
| 13 | `p51:BB84` | **カセットテープ** ナターシャのロッカーにあったカセットテープ。ザンジバーランドのコッカがロクオンされている。 |
| 14 | `p51:BB5A` | **タマゴ** バイオラボにあったタマゴ。たべられそうにはない。シヨウホウホウはフメイ。 |
| 15 | `p51:BB5A` | **タマゴ** (= 14) |
| 16 | `p51:BC4E` | **ブローチ** ナターシャがくれたブローチ。ザンジバーランドのマークがモチーフされている。シヨウホウホウはフメイ。ナターシャのにおいがする。 |
| 17 | `p51:BD04` | **レッド・カード** カード1から3をダイヨウするマスター・カード。 |
| 18 | `p51:BD25` | **ブルー・カード** カード4から6をダイヨウするマスター・カード。 |
| 19 | `p51:BD46` | **グリーン・カード** カード7から9をダイヨウするマスター・カード。 |
| 20 | `p51:BCE7` | **カード** ザンジバーランドでシヨウされているICカード。 |
| 21 | `p51:BCE7` | **カード** (= 20) |
| 22 | `p51:BCE7` | **カード** (= 20) |
| 23 | `p51:BCE7` | **カード** (= 20) |
| 24 | `p51:BCE7` | **カード** (= 20) |
| 25 | `p51:BCE7` | **カード** (= 20) |
| 26 | `p51:BCE7` | **カード** (= 20) |
| 27 | `p51:BCE7` | **カード** (= 20) |
| 28 | `p51:BCE7` | **カード** (= 20) |
| 29 | `p51:BC94` | **スプレー ［ミセス・スプレー］** ジメチエーテル、LPガスをつかったキョウネンセイのラッカー用スプレー。カキゲンキンとかかれている。イロはメタリックグレイだ。 |
| 30 | | (ninguna) |
| 31 | `p51:BBBC` | **カートリッジ** マルフののこしたゲームカートリッジ。この中にOILIXのマイクロフィルムがかくされている。 |
| 32 | `p51:BD68` | **Cレーション ［B1ユニット］** ショットキーでタイリョクのカイフクができるギュウニク、ブタニク、ハムエッグ、ツナフィッシュ、チョコレート、クラッカーをふくむ。 |
| 33 | `p51:BDBB` | **Cレーション ［B2ユニット］** ショットキーでタイリョクのカイフクができるマメとミートボールのトマトニ、マメとフランクフルト、ギュウニクのポテトニをふくむ。 |
| 34 | `p51:BE0D` | **Cレーション ［B3ユニット］** ショットキーでタイリョクのカイフクができるスライスハム、ニワトリとシチメンチョウ、スパゲッティ、チーズ、コーヒーをふくむ。 |
| 35 | | (ninguna) |
| 36 | `p51:AD99` | **ービルのエレベーターこうをのぼっていっ** たわ{FB}1{76}オクジョウか？！{FB}{78}ここの連中もヒッシになってさがしているわ。カレらよりはやくつかまえないと、マルフ博士のユイイツのてがかりよ{FB}{76}ハトさがしか？・・・キミはどうする？{FB}{78}わたし、足でまといになるわ。もうすこしジョウホウをあつめたいしね。ヒョウカ下がってるのよ。ここんとこ・・・それに、こんな目にあったんですもの。{FD}このままではおさまらないわ！{FB}{76}こころづよいな・・・ムリはするなよ{FB}{78}トウチョウされるといけないからシュウハスウかえるわね。140・76ね。SNAKE{FB}{78}それから、カードをコピーしておいたわ。カード4、つかって・・・{FB}{78}じゃあね、SNAKE・・・またあとで{FB}1{76}ホーリー！{FB}2{78}えっ？・・・{FB}{76}今のは、恋人同士のわかれのコトバだ{FB}{78}・・・じゃあ、私たちは？・・・なんて言うの？{FB}2{76}いきていればいつでもあえる・・・{FB}2{78}・・・・わかったわ{FB}2{76}こちらSNAKE・・・潜入ポイントにトウチャク{FB}2{77}SNAKE・・・あいかわらず、時間通りだな{FB}2{77}よし・・・OPERATIONINTRUDE　F014カイシ{FD}もういちど、カクニンする。きみのニンムはザンジバーランドに潜入、ラチされているチェコの生物学者キオ・マルフをダッシュすること{FD}SNAKE、コンカイのシンヘイキ動体はんのうセンサーのスイッチを入れてみろ{FB}2{76}ラジャー・・・スイッチをいれる |
| 37 | `p51:AEBC` | **。** カード4、つかって・・・{FB}{78}じゃあね、SNAKE・・・またあとで{FB}1{76}ホーリー！{FB}2{78}えっ？・・・{FB}{76}今のは、恋人同士のわかれのコトバだ{FB}{78}・・・じゃあ、私たちは？・・・なんて言うの？{FB}2{76}いきていればいつでもあえる・・・{FB}2{78}・・・・わかったわ{FB}2{76}こちらSNAKE・・・潜入ポイントにトウチャク{FB}2{77}SNAKE・・・あいかわらず、時間通りだな{FB}2{77}よし・・・OPERATIONINTRUDE　F014カイシ{FD}もういちど、カクニンする。きみのニンムはザンジバーランドに潜入、ラチされているチェコの生物学者キオ・マルフをダッシュすること{FD}SNAKE、コンカイのシンヘイキ動体はんのうセンサーのスイッチを入れてみろ{FB}2{76}ラジャー・・・スイッチをいれる |
<!-- /generado -->

## El radar

![El radar: sin alerta, con la alerta de nivel 3 y con la de nivel 2](../imagenes/radar.png)

El recuadro de la derecha (`pon_radar`, `p12:6F49`) dibuja las **3 x 3 salas**
de alrededor de la de Snake desde el mapa de `0xD900` (`fondo_del_radar`,
`p12:6EC8`), una raya que lo barre (`p12:6D78`) y, al acabar cada barrido, un
punto por enemigo (`p12:6CE0`).

Cuando un enemigo ve a Snake (`alerta_sin_musica`, `p04:9955`) el radar se
cambia por la alerta 2: **危険** con LEVEL y LIFE; con la alerta 1
(`p04:934C`), **回避** con LEVEL y TIME. LEVEL es la alerta más uno (tope 3); LIFE, la vida
de Snake (`0xCA53`); TIME, la cuenta `0xD42B` entre 8 (`rotulos_de_alerta`,
`p04:984C`). Las cuatro imágenes de arriba las pinta el cartucho
(`tools/radar.py`) en la sala 2 de la zona 6.
