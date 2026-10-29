# Snake

## What he does

Played by the cartridge with the emulated joystick (`tools/snake.py gif`):
every frame, the keys to `0xCA08` and `0xCA07` and the game loop
(`p01:741A`), and the whole room is painted, as on screen, at the MSX's pace
(one game frame every 5 of the VDP, measured in openMSX). It is room 0 of
zone 0, where the game starts.

**Walking**, up, left, down and right:

![Walking](imagenes/snake_andar.gif)

**Crawling** (both triggers at once to lie down):

![Crawling](imagenes/snake_arrastrarse.gif)

**The punch** (trigger 2, `disparo_2`, `p03:A360`: state 3 for 4 frames), in
the four directions; trigger 1 uses the weapon:

![The punch](imagenes/snake_golpe.gif)

**With the handgun** (`0xCB20` = 1):

![With the handgun](imagenes/snake_pistola.gif)

**Inside the cardboard box** (ダンボール, `0xCB21` = 0x0A): a single drawing,
0x0B, with its fixed colours (`p12:7AE5`), which slides along:

![Inside the box](imagenes/snake_caja.gif)

**Under the bucket** (バケツ, `0xCB21` = 0x0B):

![Under the bucket](imagenes/snake_cubo.gif)

## All his drawings

Each drawing only once (those that look the same, removed), one row per
drawing number: 0, 1, 2, 3, 4, 8, 9, 0x0A, 0x0B, 0x0C and 0x0E. Number 9
(`p63:B27A`) looks like 0 but is not: each picture differs in 20 to 67
dots.

![Snake's drawings, no repeats](imagenes/snake_hoja.png)

## How he is painted

Snake is **four 16 x 16 sprites**: two on top and two 16 dots lower, and in
each pair the second carries the CC bit, which adds its colours to those of
the first (`dibuja_snake`, `p12:7688`). His patterns are not fixed: every
frame the four of the drawing in use are copied into the sprite pattern table
(`0xF800`) from page 3 of the VRAM (`p12:76E9`), and his colours come, line by
line, from the runs at `p63:B282` and `p63:B620`. The drawing is `0xCB01`;
going through its tables (`p63:B1CC-B282`) gives 98 different ones. The game
starts with 0x0D, which puts the sprites away, until Snake arrives. Number 7
(turning round while crawling) has not come out playing.

## The weapons (F2)

![WEAPON SELECT](imagenes/armas.png)

Snake carries his things in four-byte records: **13 weapons** at `0xD600`
and **34 pieces of equipment** at `0xD638` ([has it] [the count, in BCD]
[...]). F2 opens the weapon screen (`p10:AED6`) and F3 the equipment one
(`p10:AF30`); the sign of whatever is under the cursor comes from the table
at `p50:8046` or `p50:8048` (`letrero_de_lo_elegido`, `p10:B8C7`). Both
screens, with everything in them, are painted by the cartridge
(`tools/equipo.py`).

The F2 signs, as the ROM has them:

<!-- generado:armas -->
| Slot | | | Sign |
|---:|---|---|---|
| 0 | | | (none) |
| 1 | ![](imagenes/equipo/f2_c01.png) | `p51:B546` | **ハンドガン ［ベレッタM92F］** アメリカ軍用セイシキピストルとしてサイヨウされているセミオートマチックピストル。サイレンサーソウチャクカ。タマホキュウカ。 |
| 2 | ![](imagenes/equipo/f2_c02.png) | `p51:B59A` | **サブマシンガン ［イングラムM11］** アメリカのコガタケイリョウSMG。ショットキーをおしつづけるとフルオートになる。サイレンサーソウチャクカ。タマホキュウカ。 |
| 3 | ![](imagenes/equipo/f2_c03.png) | `p51:B5ED` | **グレネード ［M68］** アメリカセイ、チャクハツシンカンシキハヘンシュリュウダン。ジメンにトウタツするとバクハツする。ラッカチテンはターゲット上。 |
| 4 | | | (none) |
| 5 | ![](imagenes/equipo/f2_c05.png) | `p51:B63B` | **タイクウミサイル ［スティンガー］** ケイタイシキ、タイクウミサイル。レーダー内のショウジュンをカーソルイドウさせ、ショットキーでハッシャする。レーダー内カノウ。 |
| 6 | ![](imagenes/equipo/f2_c06.png) | `p51:B690` | **リモコンミサイル ［M47ドラゴン］** シュ動モクシセン指令ホウシキによりハッシャゴのミサイルとモクヒョウをモクシによるカーソルソウサでホウコウをシュウセイできる。 |
| 7 | ![](imagenes/equipo/f2_c07.png) | `p51:B6E7` | **プラスチック・バクダン** ヘンケイカノウなケイリョウコウセイノウバクヤク。 |
| 8 | ![](imagenes/equipo/f2_c08.png) | `p51:B70E` | **ジライ ［M 78］** ショットキーでセット、ホフクで真上を通るとカイシュウ。タンチキがあればレーダー上にうつる。レーダー内にサイダイ16コセットカ。 |
| 9 | ![](imagenes/equipo/f2_c09.png) | `p51:B808` | **カモフラージュ・マット ［ファントム07］** あらゆるVRAMにタイオウできるカモフラージュ・マット。ショットキーでセット、真上を通るとカイシュウ。下に潜れば見えなくなる。 |
| 10 | ![](imagenes/equipo/f2_c0A.png) | `p51:B761` | **ムリョク化ガス ［ABC M25A2］** ボウドウチンアツ用シュリュウダン。バクハツするとCN1ガスをかざ下にフンシュツする。かざ上でのシヨウはキケン。 |
| 11 | ![](imagenes/equipo/f2_c0B.png) | `p51:B7B3` | **マウス ［ジェリー2］** シカケやセンサーを発見するのにつかうダミーロボット。物音モードのカイジョにもつかえる。ショットキーでプレイヤーの前方へはしる。 |
| 12 | ![](imagenes/equipo/f2_c0C.png) | `p51:B866` | **ライター ［JR TOKAI］。** どこにでもうっている100エンライター。シヨウホウホウはフメイ。 |
| 13 | | | (none) |
<!-- /generado -->

## The equipment (F3)

![EQUIPMENT SELECT](imagenes/equipo.png)

<!-- generado:equipo -->
| Slot | | | Sign |
|---:|---|---|---|
| 0 | | | (none) |
| 1 | ![](imagenes/equipo/f3_c01.png) | `p51:B89A` | **タバコ ［ラッキー・ストライカー］** ゼンカイにひきつづき、SNAKEアイヨウのタバコ。コドクな戦場にはイキヌキもヒツヨウ。しかし・・・真のシヨウホウホウはフメイ。 |
| 2 | ![](imagenes/equipo/f3_c02.png) | `p51:BA39` | **ソウガンキョウ ［ニコス F500］** これをつかうとプレイヤーを中心に上下左右のガメンを見ることができる。 |
| 3 | ![](imagenes/equipo/f3_c03.png) | `p51:BB19` | **ナイトビュア** クラヤミでも真ヒルのように見えるアンシゴーグル。これをソウビすればいかなるクラヤミでも見えるようになる。 |
| 4 | ![](imagenes/equipo/f3_c04.png) | `p51:B943` | **ガスマスク［ライアット・フェイス・マスク］** これをソウビするとドクガス・エリアでO2ゲージが2バイになり、へり方もおそくなりタイキュウ時間がのびる。ムリョク化ガスにもカ。 |
| 5 | ![](imagenes/equipo/f3_c05.png) | `p51:B8F2` | **ボディ・アーマー ［S・P・S］** テキからのダメージがハンゲンするボウダンチョッキ。サイレント・パートナー・スペシャルといわれ、ジュウダンにのみユウコウ。 |
| 6 | | | (none) |
| 7 | ![](imagenes/equipo/f3_c07.png) | `p51:B9E7` | **サンソボンベ** これをソウビすると水中でのO2ゲージが2バイになり、へり方もおそくなり潜水時間がながくなる。水上に上がればマンタンにもどる。 |
| 8 | ![](imagenes/equipo/f3_c08.png) | `p51:B99F` | **ジライタンチキ** これをソウビするとジライがレーダー上にしろいコウテンとなってうつる。プレイヤーのしかけたジライもドウヨウにハンノウする。 |
| 9 | ![](imagenes/equipo/f3_c09.png) | `p51:BAF4` | **ハングライダー** 戦場でのリヨウカチはなし。シヨウホウホウはフメイ。 |
| 10 | ![](imagenes/equipo/f3_c0A.png) | `p51:BA77` | **ダンボール** タッキュウビンのどこにでもあるようなダンボールのハコ。ザンジバーランドいきのデンピョウがはられている。シヨウホウホウはフメイ。 |
| 11 | ![](imagenes/equipo/f3_c0B.png) | `p51:BABF` | **バケツ** トイレそうじ用のカネセイのゴミバケツ。かなりじょうぶなシロモノだ。シヨウホウホウはフメイ。 |
| 12 | ![](imagenes/equipo/f3_c0C.png) | `p51:BBF4` | **カゼグスリ ［PLカル ホワイト］** エン化リゾチームハイゴウのビエン用カゼグスリ。くしゃみ、はな水、はなづまり、なみだ目にきく。15サイ以上、1かい、1カプセル。 |
| 13 | ![](imagenes/equipo/f3_c0D.png) | `p51:BB84` | **カセットテープ** ナターシャのロッカーにあったカセットテープ。ザンジバーランドのコッカがロクオンされている。 |
| 14 | ![](imagenes/equipo/f3_c0E.png) | `p51:BB5A` | **タマゴ** バイオラボにあったタマゴ。たべられそうにはない。シヨウホウホウはフメイ。 |
| 15 | ![](imagenes/equipo/f3_c0F.png) | `p51:BB5A` | **タマゴ** (= 14) |
| 16 | ![](imagenes/equipo/f3_c10.png) | `p51:BC4E` | **ブローチ** ナターシャがくれたブローチ。ザンジバーランドのマークがモチーフされている。シヨウホウホウはフメイ。ナターシャのにおいがする。 |
| 17 | ![](imagenes/equipo/f3_c11.png) | `p51:BD04` | **レッド・カード** カード1から3をダイヨウするマスター・カード。 |
| 18 | ![](imagenes/equipo/f3_c12.png) | `p51:BD25` | **ブルー・カード** カード4から6をダイヨウするマスター・カード。 |
| 19 | ![](imagenes/equipo/f3_c13.png) | `p51:BD46` | **グリーン・カード** カード7から9をダイヨウするマスター・カード。 |
| 20 | ![](imagenes/equipo/f3_c14.png) | `p51:BCE7` | **カード** ザンジバーランドでシヨウされているICカード。 |
| 21 | ![](imagenes/equipo/f3_c15.png) | `p51:BCE7` | **カード** (= 20) |
| 22 | ![](imagenes/equipo/f3_c16.png) | `p51:BCE7` | **カード** (= 20) |
| 23 | ![](imagenes/equipo/f3_c17.png) | `p51:BCE7` | **カード** (= 20) |
| 24 | ![](imagenes/equipo/f3_c18.png) | `p51:BCE7` | **カード** (= 20) |
| 25 | ![](imagenes/equipo/f3_c19.png) | `p51:BCE7` | **カード** (= 20) |
| 26 | ![](imagenes/equipo/f3_c1A.png) | `p51:BCE7` | **カード** (= 20) |
| 27 | ![](imagenes/equipo/f3_c1B.png) | `p51:BCE7` | **カード** (= 20) |
| 28 | ![](imagenes/equipo/f3_c1C.png) | `p51:BCE7` | **カード** (= 20) |
| 29 | ![](imagenes/equipo/f3_c1D.png) | `p51:BC94` | **スプレー ［ミセス・スプレー］** ジメチエーテル、LPガスをつかったキョウネンセイのラッカー用スプレー。カキゲンキンとかかれている。イロはメタリックグレイだ。 |
| 30 | | | (none) |
| 31 | ![](imagenes/equipo/f3_c1F.png) | `p51:BBBC` | **カートリッジ** マルフののこしたゲームカートリッジ。この中にOILIXのマイクロフィルムがかくされている。 |
| 32 | ![](imagenes/equipo/f3_c20.png) | `p51:BD68` | **Cレーション ［B1ユニット］** ショットキーでタイリョクのカイフクができるギュウニク、ブタニク、ハムエッグ、ツナフィッシュ、チョコレート、クラッカーをふくむ。 |
| 33 | ![](imagenes/equipo/f3_c21.png) | `p51:BDBB` | **Cレーション ［B2ユニット］** ショットキーでタイリョクのカイフクができるマメとミートボールのトマトニ、マメとフランクフルト、ギュウニクのポテトニをふくむ。 |
| 34 | ![](imagenes/equipo/f3_c22.png) | `p51:BE0D` | **Cレーション ［B3ユニット］** ショットキーでタイリョクのカイフクができるスライスハム、ニワトリとシチメンチョウ、スパゲッティ、チーズ、コーヒーをふくむ。 |
<!-- /generado -->

## The radar

![The radar, played: sweep, dots, alert 2 and alert 1](imagenes/radar.gif)

The box on the right (`pon_radar`, `p12:6F49`) draws the **3 x 3 rooms**
around Snake's from the map at `0xD900` (`fondo_del_radar`, `p12:6EC8`), a
line that sweeps it (`p12:6D78`) and, at the end of each sweep, a dot for each
enemy (`p12:6CE0`).

When an enemy sees Snake (`alerta_sin_musica`, `p04:9955`) the radar is
replaced by alert 2: **危険** with LEVEL and LIFE; with alert 1 (`p04:934C`),
**回避** with LEVEL and TIME. LEVEL is the alert plus one (at most 3); LIFE,
Snake's life (`0xCA53`); TIME, the count `0xD42B` divided by 8
(`rotulos_de_alerta`, `p04:984C`). The GIF is played by the cartridge
(`tools/radar.py`) in room 2 of zone 6, at the MSX's pace: the radar alone,
alert 2 at frame 200 (as an enemy who sees Snake sets it, `p04:9955`) and
alert 1 at frame 300.

The radar's room drawings (their bitmaps) are in the **RAM** at `0x8000`,
not in the cartridge: on entering the zone the game puts its RAM in that
window (`ENASLT` with the slot at `0xC386`) and copies them there
(`p00:5BE0`), and `dibujo_a_7000` (`p12:6F93`) reads them the same way.
Painted without that RAM, the radar comes out full of noise, as if jammed.
