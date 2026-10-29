# The transceiver

![The 12 portraits](imagenes/retratos.png)

## Who answers

The frequencies are 140.xx: the game keeps only the two figures after the
point, in BCD, in the list at `0xD7A0` (the new game's, `p09:B67E`). Each of
the first eight places in the list has its conversation (`p48:8037`):

| Place | Frequency | Who | Records |
|---:|---|---|---:|
| 0 | 140.85 | キャンベル | 16 |
| 1 | 140.38 | マスター | 15 |
| 2 | 140.40 | ノルデン | 7 |
| 3 | 140.15 | ホーリー | 10 |
| 4 | 140.93 | ケスラー | 8 |
| 5 | 140.82 | ペトロ | 5 |
| 6 | 140.51 | マルフ | 2 |
| 7 | 140.27 | FOX | 0 |

Whoever speaks in each message gives their place through `p09:BFE1`:
ナターシャ shares place 6 with マルフ, and the others who speak in the game
(BOSS, BLACK, RUNNING, RED, BOX, PREDATOR, the pilot, the children, the
soldiers) have no number.

When a saved game is continued the list is rebuilt (`p09:B62F`) according to
bits 3-6 of `0xD7E4`: place 0 becomes 140.66 or 140.24, place 1 140.98 and
place 3 140.76. And one conversation sets place 1 to 140.99 (see
[Curiosities](CURIOSITIES.html)). 140.07 belongs to nobody: it is the radio.

## The portraits

Above, the twelve the cartridge paints (`tools/retratos.py`): each one is a
mosaic of 4 x 6 characters from `p44:93FD` (`pon_mosaico_de_quien_habla`,
`p03:B814`). Number 0 is Snake, on the left; 1 to 8, whoever answers in
places 0 to 7; 9 and 11 are ナターシャ (identical dot for dot: 11 goes on the
left in a scene) and 10 is BIG BOSS.

## How what they say is chosen

Each conversation is a list of **records**: [head] [flags] [zone and room, if
the head carries bit 7] [action] [message], and behind it, with 0xFE, the
ones that follow after a wait. The game says the **first record that holds**
(`recorre_conversacion`, `p01:608B`). The flags are events of the game
(`0xD7D0`, `p03:B0F6`): without bit 4 of the head, the record holds with all
of them set; with it, with the last one set and the others not
(`mira_condiciones`, `p01:6104`). Action 0 says a message; action 1, one at
random from a list with its thresholds out of 100.

This reading is **checked against the cartridge**: with 3,000 sets of flags,
zones and rooms at random, the record `tools/prueba_conversaciones.py`
chooses is the one the game's code chooses when run, all 3,000 times.

## The conversations, whole

By frequency and in the order the records are looked at; after them, the
nine in the `p48` header that have no number (the one at `p48:800E`, with
16 records, is the calls the game makes, `p03:B108`). The texts are as the
game writes them (each line break, the window's): ▼ waits for a key, ▼▼
waits and opens another window, ▽ ends. Beside them, the translation
(`tools/traducciones.py`, made by hand from that text; each window break of
the game is a line break here too). What Marv and Natasha say in Russian is
given in Russian, with its translation in brackets.

<!-- generado:conversaciones -->
### 140.85

Speaking: キャンベル. The conversation at `p48:8047`, with 16 records.

**Record 0** (flags 53 A1, with all of them set)

| | Original | Translation |
|---|---|---|
| `p48:9636` | キャンベル『たたかうべき時はたたかう。たおす<br>べき時はたおす。戦場とシューティ<br>ングゲームの基本だ・・OVER ▽ | CAMPBELL: Fight when you must fight. Take them down when you must take them down. That is the basic rule of the battlefield and of shooting games... OVER |

**Record 1** (flags 50 7A A1, with all of them set)

| | Original | Translation |
|---|---|---|
| `p48:9DF2` | キャンベル『SNAKE！BIG　BOSSは<br>もはやきみのジョウカンではない<br>。ー人のキョウジンだ。わかるな<br>？シジョウははさむな。 ▼<br>レイセイになれ。ここできみがま<br>けることはできんのだ！そしてわ<br>れわれがきみにしてやれることも<br>ない。 ▼<br>全世界がきみにかかっているんだ<br>！こううんをいのる<br>・・・OVER ▽ | CAMPBELL: SNAKE! BIG BOSS is no longer your superior. He is a madman. Understand? Keep your feelings out of it.<br>Keep calm. You cannot lose here! And there is nothing more we can do for you.<br>The whole world is counting on you! Good luck... OVER |

**Record 2** (flags 4C 5E 2F A1, with all of them set)

| | Original | Translation |
|---|---|---|
| `p48:9DB3` | キャンベル『SNAKE！アイテムがもえてい<br>る！！すべてのソウビヒン、ブキ<br>をすてろ！時間がないぞ。スペー<br>スキーですてるんだ！ ▽ | CAMPBELL: SNAKE! Your items are burning!! Throw away all your equipment and weapons! There's no time. Throw them away with the space bar! |

**Record 3** (flags 3E 3F 62 A1, with all of them set)

| | Original | Translation |
|---|---|---|
| `p48:9BD4` | キャンベル『やつの足音に注意しろ。足音で<br>やつのイチをヨソウしろ。ヘヤもユ<br>カのザイシツも4シュルイ、足音も<br>4シュルイだ。 ▼<br>テキがハッポウしたらマズル・ブラ<br>ストをねらえ。バーストのさきにや<br>つがいる・・・OVER ▽ | CAMPBELL: Watch out for his footsteps. Work out where he is from his footsteps. There are 4 kinds of room and floor material, and 4 kinds of footsteps.<br>When the enemy fires, aim at the muzzle flash. He is where the burst comes from... OVER |

**Record 4** (flags A4 A5 35, with all of them set)

| | Original | Translation |
|---|---|---|
| `p48:9F58` | キャンベル『シュウハスウをヘンコウする。<br>シュウハスウはタップコードでお<br>くる。カイドクしろ。<br>・・・OVER ▽ | CAMPBELL: I'm changing the frequency. I'll send the frequency in tap code. Decode it... OVER |

**Record 5** (flags 21 71 5A, with all of them set)

| | Original | Translation |
|---|---|---|
| `p48:9C45`<br>at random, up to 80 out of 100 | キャンベル『WIS、OHIO・・・WISはウ<br>ィスコンシンしゅうのショウリャク<br>ケイ、OHIOはオハイオしゅう・<br>・・？ ▼<br>どちらもアメリカのしゅうめいだ。<br>マルフはアメリカにはいちどもいっ<br>たことがないはずだが？ ▼<br>マスター・ミラーならわかるかもし<br>れん・・・OVER ▽ | CAMPBELL: WIS, OHIO... WIS is the abbreviation for the state of Wisconsin, OHIO is the state of Ohio...?<br>They are both names of American states. But Marv has never been to America, has he?<br>Master Miller might know... OVER |
| `p48:9CC7`<br>at random, up to 100 out of 100 | キャンベル『こまったことがあればマクドネル・<br>ミラーに連絡してみろ。<br>もとうちのサバイバル・マスターだ<br>。じつにやくにたつ男だ。 ▼<br>アイデアマンでもある。かれにそう<br>だんしてみるといい。なにかカイケ<br>ツアンをだしてくれるだろう。 ▼<br>シュウハスウは140・38だ。<br>・・・OVER ▽ | CAMPBELL: If you're in trouble, try contacting McDonnell Miller. He used to be our survival master. A really useful man.<br>He's full of ideas too. Talk it over with him. He'll come up with some solution.<br>The frequency is 140.38... OVER |

**Record 6** (flags 08 09, with all of them set, in zone 03, room 06)

| | Original | Translation |
|---|---|---|
| `p48:9AB8` | キャンベル『よう兵やテキヘイキにかんすること<br>はヨウヘイ上がりのジョウホウヤ、<br>ジョージ・ケスラーにきいてみろ。<br>やつのしらないことはない。 ▼<br>以前、うちで軍事コモンとしてはた<br>らいていたこともある。<br>シン用して大ジョウブな男だ。<br>シュウハスウは140・93だ。 ▼<br>ジョウホウリョウはこっちもちだが<br>・・・クジラリョウリのみせのこと<br>なんかきくなよ・・・OVER ▽ | CAMPBELL: For anything about mercenaries or enemy weapons, ask the ex-mercenary informer George Kessler. There's nothing he doesn't know.<br>He used to work for us as a military adviser. He's a man you can trust. The frequency is 140.93.<br>We're paying for the information, but... don't ask him about whale restaurants... OVER |

**Record 7** (flags 0F 10 8E, with all of them set)

| | Original | Translation |
|---|---|---|
| `p48:9AB8` | キャンベル『よう兵やテキヘイキにかんすること<br>はヨウヘイ上がりのジョウホウヤ、<br>ジョージ・ケスラーにきいてみろ。<br>やつのしらないことはない。 ▼<br>以前、うちで軍事コモンとしてはた<br>らいていたこともある。<br>シン用して大ジョウブな男だ。<br>シュウハスウは140・93だ。 ▼<br>ジョウホウリョウはこっちもちだが<br>・・・クジラリョウリのみせのこと<br>なんかきくなよ・・・OVER ▽ | CAMPBELL: For anything about mercenaries or enemy weapons, ask the ex-mercenary informer George Kessler. There's nothing he doesn't know.<br>He used to work for us as a military adviser. He's a man you can trust. The frequency is 140.93.<br>We're paying for the information, but... don't ask him about whale restaurants... OVER |

**Record 8** (flags 14 15 88, with all of them set)

| | Original | Translation |
|---|---|---|
| `p48:99FA`<br>at random, up to 40 out of 100 | キャンベル『ヘリコプターの戦とうソクドはだい<br>たい250キロ。プロペラきのハン<br>ブンのスピードでシカイにとらえら<br>れている時間がながい。 ▼<br>ヘリコプターのジャクテンはセンカ<br>イ中だ。タイセイをととのえて、次<br>のコウゲキに入る前におとせ！<br>・・・OVER ▽ | CAMPBELL: A combat helicopter's speed is about 250 km/h, half that of a propeller plane, so it stays in sight a long time.<br>A helicopter's weak point is while it turns. Get set and bring it down before its next attack!... OVER |
| `p48:9A7B`<br>at random, up to 80 out of 100 | キャンベル『ヘリのインエイを気にするな。レー<br>ダー上のジツゾウをしんじろ。<br>ヘリはきみのズジョウにいるんだ。<br>・・・OVER ▽ | CAMPBELL: Don't worry about the helicopter's shadow. Trust the real image on the radar. The helicopter is right above your head... OVER |
| `p48:9AB8`<br>at random, up to 100 out of 100 | キャンベル『よう兵やテキヘイキにかんすること<br>はヨウヘイ上がりのジョウホウヤ、<br>ジョージ・ケスラーにきいてみろ。<br>やつのしらないことはない。 ▼<br>以前、うちで軍事コモンとしてはた<br>らいていたこともある。<br>シン用して大ジョウブな男だ。<br>シュウハスウは140・93だ。 ▼<br>ジョウホウリョウはこっちもちだが<br>・・・クジラリョウリのみせのこと<br>なんかきくなよ・・・OVER ▽ | CAMPBELL: For anything about mercenaries or enemy weapons, ask the ex-mercenary informer George Kessler. There's nothing he doesn't know.<br>He used to work for us as a military adviser. He's a man you can trust. The frequency is 140.93.<br>We're paying for the information, but... don't ask him about whale restaurants... OVER |

**Record 9** (flags 58, with all of them set)

| | Original | Translation |
|---|---|---|
| `p48:9EB6` | キャンベル『ジライゲンはジライタンチキをつ<br>かえばレーダー上にとうえいされ<br>るんだが。カイシュウはホフクで<br>できる・・・OVER ▽ | CAMPBELL: With a mine detector, the mines show up on the radar. You can pick them up by crawling... OVER |

**Record 10** (flags 8C, with all of them set)

| | Original | Translation |
|---|---|---|
| `p48:9B71`<br>at random, up to 50 out of 100 | キャンベル『やみの中ではシリョクのことはわす<br>れろ。はかのあらゆるカンカクをと<br>ぎすましテキのソンザイをかんじと<br>るんだ・・・OVER ▽ | CAMPBELL: In the dark, forget about your sight. Sharpen all your other senses and feel the enemy's presence... OVER |
| `p48:9BB2`<br>at random, up to 100 out of 100 | キャンベル『デントウのスイッチをさがせ。どこ<br>かにあるはずだ・・・OVER ▽ | CAMPBELL: Look for the light switch. It must be somewhere... OVER |

**Record 11** (flags 8D, with all of them set)

| | Original | Translation |
|---|---|---|
| | (no message) (at random, up to 20 out of 100) | |
| `p48:986E`<br>at random, up to 40 out of 100 | キャンベル『テキに発見される場合、そのだいい<br>ちはモクシによるもの。だいには音<br>によるものだ。 ▼<br>音はジョウオンにおいてイチビョウ<br>カンにおよそ340メートルすすむ<br>。かざむきひとつでトホウもないキ<br>ョリまでとどいてしまう。 ▼<br>音をたてずにコウドウしろ。音をた<br>てたらすぐさまオウセンのかまえに<br>はいれ・・・OVER ▽ | CAMPBELL: When the enemy spots you, it is first by sight, and second by sound.<br>At normal temperature sound travels about 340 metres a second. With the wind in the right direction it carries an amazing distance.<br>Move without making a sound. If you make a noise, get ready to fight at once... OVER |
| `p48:990F`<br>at random, up to 60 out of 100 | キャンベル『足音のしそうなゆか、ジメンに<br>は気をつけろ。いくら音キュウシュ<br>ウブーツでも足音をカンゼンにけす<br>ことはできない。 ▼<br>そういうところではホフクゼンシン<br>ですすめ・・・OVER ▽ | CAMPBELL: Careful with floors and ground that might make footsteps. Even sound-absorbing boots can't silence your steps completely.<br>In places like that, crawl forward... OVER |
| `p48:996E`<br>at random, up to 100 out of 100 | キャンベル『足音をちいさくするにはカカトか<br>らセッチし、おやゆびのつけねのと<br>ころまでゆっくりと下ろしてゆく ▼<br>この方法で足音をけすことができる<br>んだが・・・できんか？<br>・・・OVER ▽ | CAMPBELL: To make your footsteps quieter, put your heel down first and lower your foot slowly to the base of the big toe.<br>That way you can silence your footsteps... can't you do it?... OVER |

**Record 12** (flags 8B, with all of them set)

| | Original | Translation |
|---|---|---|
| `p48:9E8A` | キャンベル『ミノフスキーリュウシのノウドが<br>たかいのでレーダーがきかないは<br>ずだ・・・OVER ▽ | CAMPBELL: The concentration of Minovsky particles is high, so the radar shouldn't work... OVER |

**Record 13** (flags 6C, with all of them set, in zone 00, room 03)

| | Original | Translation |
|---|---|---|
| | (no message) (at random, up to 20 out of 100) | |
| `p48:97F0`<br>at random, up to 60 out of 100 | キャンベル『ホフクでトラックなどの下にかくれ<br>ることもタイセツだ・・OVER ▽ | CAMPBELL: It's also important to crawl and hide under lorries and the like... OVER |
| `p48:9814`<br>at random, up to 100 out of 100 | キャンベル『北むきのトラックには入ることがで<br>きる・・・OVER ▽ | CAMPBELL: You can get into the lorries facing north... OVER |

**Record 14** (flags 6C, with all of them set, in zone 00, room 09)

| | Original | Translation |
|---|---|---|
| | (no message) (at random, up to 20 out of 100) | |
| `p48:97F0`<br>at random, up to 60 out of 100 | キャンベル『ホフクでトラックなどの下にかくれ<br>ることもタイセツだ・・OVER ▽ | CAMPBELL: It's also important to crawl and hide under lorries and the like... OVER |
| `p48:9814`<br>at random, up to 100 out of 100 | キャンベル『北むきのトラックには入ることがで<br>きる・・・OVER ▽ | CAMPBELL: You can get into the lorries facing north... OVER |

**Record 15** (always)

| | Original | Translation |
|---|---|---|
| | (no message) (at random, up to 25 out of 100) | |
| `p48:9636`<br>at random, up to 35 out of 100 | キャンベル『たたかうべき時はたたかう。たおす<br>べき時はたおす。戦場とシューティ<br>ングゲームの基本だ・・OVER ▽ | CAMPBELL: Fight when you must fight. Take them down when you must take them down. That is the basic rule of the battlefield and of shooting games... OVER |
| `p48:9670`<br>at random, up to 45 out of 100 | キャンベル『ニンムはセッショクをさけることで<br>テキをハイジョすることではない。<br>これまで見たアクションエイガのこ<br>とはわすれろ・・・OVER ▽ | CAMPBELL: The mission is to avoid contact, not to eliminate the enemy. Forget the action films you've seen... OVER |
| `p48:972C`<br>at random, up to 55 out of 100 | キャンベル『テキの立場になってかんがえろ。イ<br>ッテンしてそのチイキをシュビする<br>テキの指令カンやゲームデザイナー<br>になったつもりでかんがえろ。 ▼<br>見えなかったものが見えてくるはず<br>だ・・・OVER ▽ | CAMPBELL: Think from the enemy's position. Imagine you're the enemy commander guarding the area, or the game designer.<br>You'll start seeing what you couldn't see... OVER |
| `p48:9790`<br>at random, up to 65 out of 100 | キャンベル『ホキュウがカンゼンにできないとい<br>うジョウキョウをソウテイしてケイ<br>カクをたてろ・・・OVER ▽ | CAMPBELL: Make your plans assuming you won't be able to get fully resupplied... OVER |
| `p48:986E`<br>at random, up to 75 out of 100 | キャンベル『テキに発見される場合、そのだいい<br>ちはモクシによるもの。だいには音<br>によるものだ。 ▼<br>音はジョウオンにおいてイチビョウ<br>カンにおよそ340メートルすすむ<br>。かざむきひとつでトホウもないキ<br>ョリまでとどいてしまう。 ▼<br>音をたてずにコウドウしろ。音をた<br>てたらすぐさまオウセンのかまえに<br>はいれ・・・OVER ▽ | CAMPBELL: When the enemy spots you, it is first by sight, and second by sound.<br>At normal temperature sound travels about 340 metres a second. With the wind in the right direction it carries an amazing distance.<br>Move without making a sound. If you make a noise, get ready to fight at once... OVER |
| `p48:9AB8`<br>at random, up to 85 out of 100 | キャンベル『よう兵やテキヘイキにかんすること<br>はヨウヘイ上がりのジョウホウヤ、<br>ジョージ・ケスラーにきいてみろ。<br>やつのしらないことはない。 ▼<br>以前、うちで軍事コモンとしてはた<br>らいていたこともある。<br>シン用して大ジョウブな男だ。<br>シュウハスウは140・93だ。 ▼<br>ジョウホウリョウはこっちもちだが<br>・・・クジラリョウリのみせのこと<br>なんかきくなよ・・・OVER ▽ | CAMPBELL: For anything about mercenaries or enemy weapons, ask the ex-mercenary informer George Kessler. There's nothing he doesn't know.<br>He used to work for us as a military adviser. He's a man you can trust. The frequency is 140.93.<br>We're paying for the information, but... don't ask him about whale restaurants... OVER |
| `p48:9CC7`<br>at random, up to 100 out of 100 | キャンベル『こまったことがあればマクドネル・<br>ミラーに連絡してみろ。<br>もとうちのサバイバル・マスターだ<br>。じつにやくにたつ男だ。 ▼<br>アイデアマンでもある。かれにそう<br>だんしてみるといい。なにかカイケ<br>ツアンをだしてくれるだろう。 ▼<br>シュウハスウは140・38だ。<br>・・・OVER ▽ | CAMPBELL: If you're in trouble, try contacting McDonnell Miller. He used to be our survival master. A really useful man.<br>He's full of ideas too. Talk it over with him. He'll come up with some solution.<br>The frequency is 140.38... OVER |

### 140.38

Speaking: マスター. The conversation at `p48:80AF`, with 15 records.

**Record 0** (flags 7A 52, with all of them set)

| | Original | Translation |
|---|---|---|
| `p48:95E9` | マスター『ライターとスプレーのカンがあれば<br>カエンホウシャキのかわりになるぞ<br> ▽ | MASTER: With a lighter and a can of spray you've got a stand-in for a flamethrower. |

**Record 1** (flags 7A 51, with all of them set)

| | Original | Translation |
|---|---|---|
| `p48:95E9` | マスター『ライターとスプレーのカンがあれば<br>カエンホウシャキのかわりになるぞ<br> ▽ | MASTER: With a lighter and a can of spray you've got a stand-in for a flamethrower. |

**Record 2** (flags 7B 50 7A, with all of them set)

| | Original | Translation |
|---|---|---|
| `p48:95AF` | マスター『SNAKE、やつはモンスターだ。<br>スデではかち目はない。あたまをつ<br>かえ！なにかブキになるのもがある<br>はずだ ▽ | MASTER: SNAKE, he's a monster. You can't win bare-handed. Use your head! There must be something you can use as a weapon. |

**Record 3** (flags 47 49, with all of them set)

| | Original | Translation |
|---|---|---|
| `p48:94AF` | マスター『チーズなら・・・もうわかっている<br>とおもうが、CレーションのB3ユ<br>ニットの中に入っている。 ▼<br>ネズミどもをおびきよせるにはもっ<br>てこいじゃないか。 ▼<br>カンケイないがチーズホンデューの<br>おいしいミセをしってるんだが・・<br>今ど、たべにいこうか。<br>・・・OVER ▽ | MASTER: Cheese... you probably know already, it's in the B3 unit of the C ration.<br>Just the thing to lure rats, isn't it?<br>Nothing to do with it, but I know a place with delicious cheese fondue... shall we go and eat there some time?... OVER |

**Record 4** (flags 40 7D, with all of them set, in zone 13, room 04)

| | Original | Translation |
|---|---|---|
| `p48:9447` | マスター『そうだ！チョコレートならCレーシ<br>ョンの中にあるじゃないか？Cレー<br>ションの中でもB1ユニットに注目<br>してみろ。 ▼<br>チョコレートが入っている。それで<br>リュウサンを化合できる。<br>・・・OVER ▽ | MASTER: That's it! There's chocolate in the C ration, isn't there? Look at the B1 unit of the C ration.<br>It has chocolate in it. With that you can neutralise the sulphuric acid... OVER |

**Record 5** (flags 40 7E, with all of them set, in zone 13, room 04)

| | Original | Translation |
|---|---|---|
| `p48:9394` | マスター『ノウリュウサンのタイショ法？・・<br>そうさなカセイソーダをふくむなに<br>かがあればチュウワできるが・・ ▼<br>そうだっ！・・・チョコレートをも<br>ってるか？チョコレートがあればな<br>んとかなる。 ▼<br>リュウサンはチョコレートのトウル<br>イと化合してタンソとガムジョウ物<br>になるんだ。C12H22O11・<br>・・ニトウルイ。 ▼<br>チョコレートをさがしてみろ<br>・・・OVER ▽ | MASTER: How to deal with concentrated sulphuric acid?... let me see, something with caustic soda would neutralise it...<br>That's it!... have you got chocolate? With chocolate you can manage.<br>Sulphuric acid combines with the sugar in chocolate into carbon and a gummy substance. C12H22O11... a disaccharide.<br>Look for some chocolate... OVER |

**Record 6** (flags 78 3A, with all of them set)

| | Original | Translation |
|---|---|---|
| `p48:927F` | マスター『スネークにこんなことをいうのはな<br>んだがヘビはゼッコウのショクリョ<br>ウとなる。 ▼<br>ドクヘビならトウブをおとしてナイ<br>ゾウをぬき、かわをはがしてからや<br>いてたべる。 ▼<br>キセイチュウがおおいので生やけジ<br>ョウタイでたべるのはさけた方がい<br>い。・・・OVER ▽ | MASTER: It's a funny thing to tell a Snake, but snakes make excellent food.<br>With a poisonous snake, cut off the head, take out the guts, skin it and grill it.<br>There are lots of parasites, so better not eat it half-cooked... OVER |

**Record 7** (flags 2C 81, with all of them set)

| | Original | Translation |
|---|---|---|
| `p48:9554` | マスター『クシャミをとめるにはコップいっぱ<br>いの水を7カイに分けてのみ、その<br>ご4ビュウカンいきをとめる。<br>意外ときくぞ。 ▼<br>それでもダメならカゼぐすりをのむ<br>んだな・・・OVER ▽ | MASTER: To stop sneezing, drink a full glass of water in 7 sips, then hold your breath for 4 seconds. It works better than you'd think.<br>If that doesn't do it, take some cold medicine... |

**Record 8** (flags 3B 3F, with all of them set)

| | Original | Translation |
|---|---|---|
| | (no message) (at random, up to 30 out of 100) | |
| `p48:8DEE`<br>at random, up to 40 out of 100 | マスター『エイユウとヒキョウ者のちがいはキ<br>ョウフをかんじるかどうかではない<br> ▼<br>キョウフをコクフクしてなすべきこ<br>とをするセイシン力があるかどうか<br>だ・・・OVER ▽ | MASTER: The difference between a hero and a coward isn't whether he feels fear.<br>It's whether he has the strength of mind to overcome the fear and do what has to be done... OVER |
| `p48:8E40`<br>at random, up to 50 out of 100 | マスター『ショウガイが人間のいしをつよくす<br>るのだ・・・OVER ▽ | MASTER: Obstacles make a man's will stronger... OVER |
| `p48:8E60`<br>at random, up to 55 out of 100 | マスター『さいごまであきらめず生きのびびる<br>ためにサイダイゲンのドリョクをし<br>ろ！・・・OVER ▽ | MASTER: Never give up, to the very end: do your utmost to survive!... OVER |
| `p48:8E8F`<br>at random, up to 60 out of 100 | マスター『サバイバルとはセイシン的ゲンカイ<br>のモンダイで、生きのびるイシがケ<br>ッテイヨウインとなる。<br>・・・OVER ▽ | MASTER: Survival is a matter of mental limits: the will to survive is the deciding factor... OVER |
| `p48:8EC9`<br>at random, up to 65 out of 100 | マスター『さびしさというのは心のスキマにし<br>のびこんでくるものだ。<br>その心のスキマはタイクツしたとき<br>にできる。・・・OVER ▽ | MASTER: Loneliness creeps into the gaps in your heart. And those gaps open up when you're bored... OVER |
| `p48:8F08`<br>at random, up to 70 out of 100 | マスター『戦場でのハンダンにモハンカイトウ<br>はない。<br>自分をしんじろ。・・・OVER ▽ | MASTER: There are no model answers for judgements on the battlefield. Trust yourself... OVER |
| `p48:8F34`<br>at random, up to 75 out of 100 | マスター『ショクゴの30分間はゲームをさけ<br>るべきだ。ショウカのためイへケツ<br>エキがあつまっているのであたまの<br>カイテンがにぶくなっている。 ▼<br>注意力がもっともテイカしている時<br>間だ。だからショクゴ30分はプレ<br>イをさけたほうがいい。OVER ▽ | MASTER: You should avoid games for 30 minutes after a meal. The blood gathers in the stomach for digestion, so your head works more slowly.<br>It's when your attention is at its lowest. So better not to play for 30 minutes after eating. OVER |
| `p48:8FB2`<br>at random, up to 80 out of 100 | マスター『水分をおぎなうさい、いちどに10<br>0CC以上はのまない方がいい。 ▼<br>体内に水分をキュウシュウするとき<br>に体おんと水おんのさだけエネルギ<br>ーをショウモウする。 ▼<br>とり入れた水のオンドを体おんまで<br>ひき上げるからだ。さらにケツエキ<br>がうすくなるため、あたまのはたら<br>きがその間、にぶる。 ▼<br>だからジュースをのみながらのプレ<br>イはキケンだ。・・・OVER<br> ▽ | MASTER: When you take in water, better not drink more than 100 cc at a time.<br>When the body absorbs water it uses up energy for the difference between body and water temperature,<br>because it raises the water to body temperature. And the blood gets thinner, so your head works more slowly meanwhile.<br>That's why playing while drinking juice is dangerous... OVER |
| `p48:9071`<br>at random, up to 85 out of 100 | マスター『ダエキをのむことはあってもゼッタ<br>イにはいてはいけない。 ▼<br>ジメンやハについたダエキでどのテ<br>イドのヒロウドかを見ぬかれるしツ<br>ウカした時間もスイテイされる。 ▼<br>だから、エキのプラットフォームで<br>ツバをはくのはキケンだ。<br>・・・OVER ▽ | MASTER: You may swallow your saliva, but never spit it out.<br>From saliva on the ground or on leaves they can tell how tired you are, and estimate when you passed.<br>So spitting on a station platform is dangerous... OVER |
| `p48:90EB`<br>at random, up to 90 out of 100 | マスター『やってしまうんだ、できるんだとい<br>うかんじでカクシンをもってジッコ<br>ウする。 ▼<br>セイコウした時のイメージをいだき<br>、間ちがってもGAME　OVE<br>Rになった自分をソウゾウしては<br>いけない。 ▼<br>自分をはげまし、アンジをかけるの<br>だ。・・・OVER ▽ | MASTER: Do it with conviction, feeling 'I'll do it, I can do it'.<br>Picture yourself succeeding, and never imagine yourself at GAME OVER, even by mistake.<br>Encourage yourself, hypnotise yourself... OVER |
| `p48:916C`<br>at random, up to 100 out of 100 | マスター『ながしたアセのリョウがながすチの<br>リョウをすくなくし、ながしたなみ<br>だのリョウがGAME　OVER<br>をすくなくする。・・OVER ▽ | MASTER: The more sweat you shed, the less blood you shed; and the more tears you shed, the fewer GAME OVERs... OVER |

**Record 9** (flags 21 71 80 5A, with all of them set)

| | Original | Translation |
|---|---|---|
| `p48:91F9` | マスター『WIS・OHIO・・・さかさによ<br>んでみろ。これはモジではなくてス<br>ウジだ。MARVのシュウハスウが<br>わかる。 ▼<br>ただしHが小文じなのを注意しろよ<br>。アンゴウでもなんでもなかったん<br>だ。キミはさかさにみていただけな<br>んだよ。 ▼<br>0140・51M・・・OVER ▽ | MASTER: WIS OHIO... read it upside down. These aren't letters, they're digits. You'll get MARV's frequency.<br>But mind that the H is lower case. It wasn't a code or anything. You were just looking at it upside down.<br>0140.51M... OVER |

**Record 10** (flags 21 71 7F 5A, with all of them set)

| | Original | Translation |
|---|---|---|
| `p48:91AF` | マスター『WIS・OHIO・・・<br>Hだけが小文じか？<br>なるほど！これは・・・デジタルす<br>うじだよ。 ▼<br>SNAKE。もうわかったはずだ。<br>・・・OVER ▽ | MASTER: WIS OHIO... only the H is lower case? I see! These are... digital digits.<br>SNAKE. You should have got it by now... OVER |

**Record 11** (flags 20 82 1F 5A, with all of them set)

| | Original | Translation |
|---|---|---|
| `p48:9300` | マスター『マメやこくもつならCレーションの<br>中にあるじゃないか。<br>Cレーションの中でもB2ユニット<br>の中身に注目してみろ。 ▼<br>マメとミートボールのトマトニ、マ<br>メとフランクフルトのトマトニ、ギ<br>ュウニクとポテトニがメニューの中<br>にある。 ▼<br>ハトをよびよせるにはジュウブンだ<br>。・・・OVER ▽ | MASTER: For beans or grain, there's the C ration. Look at what's in the B2 unit of the C ration.<br>On the menu there are beans and meatballs in tomato, beans and frankfurters in tomato, and beef with potatoes.<br>That's plenty to attract pigeons... OVER |

**Record 12** (flags 83, with all of them set)

| | Original | Translation |
|---|---|---|
| | (no message) (at random, up to 40 out of 100) | |
| `p48:8FB2`<br>at random, up to 70 out of 100 | マスター『水分をおぎなうさい、いちどに10<br>0CC以上はのまない方がいい。 ▼<br>体内に水分をキュウシュウするとき<br>に体おんと水おんのさだけエネルギ<br>ーをショウモウする。 ▼<br>とり入れた水のオンドを体おんまで<br>ひき上げるからだ。さらにケツエキ<br>がうすくなるため、あたまのはたら<br>きがその間、にぶる。 ▼<br>だからジュースをのみながらのプレ<br>イはキケンだ。・・・OVER<br> ▽ | MASTER: When you take in water, better not drink more than 100 cc at a time.<br>When the body absorbs water it uses up energy for the difference between body and water temperature,<br>because it raises the water to body temperature. And the blood gets thinner, so your head works more slowly meanwhile.<br>That's why playing while drinking juice is dangerous... OVER |
| `p48:9071`<br>at random, up to 100 out of 100 | マスター『ダエキをのむことはあってもゼッタ<br>イにはいてはいけない。 ▼<br>ジメンやハについたダエキでどのテ<br>イドのヒロウドかを見ぬかれるしツ<br>ウカした時間もスイテイされる。 ▼<br>だから、エキのプラットフォームで<br>ツバをはくのはキケンだ。<br>・・・OVER ▽ | MASTER: You may swallow your saliva, but never spit it out.<br>From saliva on the ground or on leaves they can tell how tired you are, and estimate when you passed.<br>So spitting on a station platform is dangerous... OVER |

**Record 13** (flags 96, with all of them set)

| | Original | Translation |
|---|---|---|
| `p48:960E` | マスター『セキガイセンセンサーはタバコのけ<br>むりで見えるようになる<br>・・・OVER ▽ | MASTER: Infrared sensors become visible with cigarette smoke... |

**Record 14** (flags 94, with all of them set)

| | Original | Translation |
|---|---|---|
| | (no message) (at random, up to 30 out of 100) | |
| `p48:8DEE`<br>at random, up to 40 out of 100 | マスター『エイユウとヒキョウ者のちがいはキ<br>ョウフをかんじるかどうかではない<br> ▼<br>キョウフをコクフクしてなすべきこ<br>とをするセイシン力があるかどうか<br>だ・・・OVER ▽ | MASTER: The difference between a hero and a coward isn't whether he feels fear.<br>It's whether he has the strength of mind to overcome the fear and do what has to be done... OVER |
| `p48:8E40`<br>at random, up to 50 out of 100 | マスター『ショウガイが人間のいしをつよくす<br>るのだ・・・OVER ▽ | MASTER: Obstacles make a man's will stronger... OVER |
| `p48:8E60`<br>at random, up to 55 out of 100 | マスター『さいごまであきらめず生きのびびる<br>ためにサイダイゲンのドリョクをし<br>ろ！・・・OVER ▽ | MASTER: Never give up, to the very end: do your utmost to survive!... OVER |
| `p48:8E8F`<br>at random, up to 60 out of 100 | マスター『サバイバルとはセイシン的ゲンカイ<br>のモンダイで、生きのびるイシがケ<br>ッテイヨウインとなる。<br>・・・OVER ▽ | MASTER: Survival is a matter of mental limits: the will to survive is the deciding factor... OVER |
| `p48:8EC9`<br>at random, up to 65 out of 100 | マスター『さびしさというのは心のスキマにし<br>のびこんでくるものだ。<br>その心のスキマはタイクツしたとき<br>にできる。・・・OVER ▽ | MASTER: Loneliness creeps into the gaps in your heart. And those gaps open up when you're bored... OVER |
| `p48:8F08`<br>at random, up to 70 out of 100 | マスター『戦場でのハンダンにモハンカイトウ<br>はない。<br>自分をしんじろ。・・・OVER ▽ | MASTER: There are no model answers for judgements on the battlefield. Trust yourself... OVER |
| `p48:8F34`<br>at random, up to 75 out of 100 | マスター『ショクゴの30分間はゲームをさけ<br>るべきだ。ショウカのためイへケツ<br>エキがあつまっているのであたまの<br>カイテンがにぶくなっている。 ▼<br>注意力がもっともテイカしている時<br>間だ。だからショクゴ30分はプレ<br>イをさけたほうがいい。OVER ▽ | MASTER: You should avoid games for 30 minutes after a meal. The blood gathers in the stomach for digestion, so your head works more slowly.<br>It's when your attention is at its lowest. So better not to play for 30 minutes after eating. OVER |
| `p48:8FB2`<br>at random, up to 80 out of 100 | マスター『水分をおぎなうさい、いちどに10<br>0CC以上はのまない方がいい。 ▼<br>体内に水分をキュウシュウするとき<br>に体おんと水おんのさだけエネルギ<br>ーをショウモウする。 ▼<br>とり入れた水のオンドを体おんまで<br>ひき上げるからだ。さらにケツエキ<br>がうすくなるため、あたまのはたら<br>きがその間、にぶる。 ▼<br>だからジュースをのみながらのプレ<br>イはキケンだ。・・・OVER<br> ▽ | MASTER: When you take in water, better not drink more than 100 cc at a time.<br>When the body absorbs water it uses up energy for the difference between body and water temperature,<br>because it raises the water to body temperature. And the blood gets thinner, so your head works more slowly meanwhile.<br>That's why playing while drinking juice is dangerous... OVER |
| `p48:9071`<br>at random, up to 85 out of 100 | マスター『ダエキをのむことはあってもゼッタ<br>イにはいてはいけない。 ▼<br>ジメンやハについたダエキでどのテ<br>イドのヒロウドかを見ぬかれるしツ<br>ウカした時間もスイテイされる。 ▼<br>だから、エキのプラットフォームで<br>ツバをはくのはキケンだ。<br>・・・OVER ▽ | MASTER: You may swallow your saliva, but never spit it out.<br>From saliva on the ground or on leaves they can tell how tired you are, and estimate when you passed.<br>So spitting on a station platform is dangerous... OVER |
| `p48:90EB`<br>at random, up to 90 out of 100 | マスター『やってしまうんだ、できるんだとい<br>うかんじでカクシンをもってジッコ<br>ウする。 ▼<br>セイコウした時のイメージをいだき<br>、間ちがってもGAME　OVE<br>Rになった自分をソウゾウしては<br>いけない。 ▼<br>自分をはげまし、アンジをかけるの<br>だ。・・・OVER ▽ | MASTER: Do it with conviction, feeling 'I'll do it, I can do it'.<br>Picture yourself succeeding, and never imagine yourself at GAME OVER, even by mistake.<br>Encourage yourself, hypnotise yourself... OVER |
| `p48:916C`<br>at random, up to 100 out of 100 | マスター『ながしたアセのリョウがながすチの<br>リョウをすくなくし、ながしたなみ<br>だのリョウがGAME　OVER<br>をすくなくする。・・OVER ▽ | MASTER: The more sweat you shed, the less blood you shed; and the more tears you shed, the fewer GAME OVERs... OVER |

### 140.40

Speaking: ノルデン. The conversation at `p48:8112`, with 7 records.

**Record 0** (flags 46 49, with all of them set)

| | Original | Translation |
|---|---|---|
| `p49:A38E` | ノルデン『それは、モウドクをもつといわれる<br>ザンジバーハムスターじゃないかな<br>ネズミは全世界に1183シュ。 ▼<br>その中でハムスターはゲッシルイ、<br>ネズミカにぞくし、タイチョウ25<br>から28センチ、西ヨーロッパから<br>シベリア、イラクにすんでいる。 ▼<br>そのヘンシュはハムスターのイエネ<br>ズミ化したものだろう。イエネズミ<br>はケイカイ心がつよく、人前ではス<br>からでることはない。 ▼<br>・・・シュショクはチーズ。<br>そうだ！？チーズだ。チーズがあれ<br>ばおびき出せるぞ！！<br>チーズをもっとらんか？？ ▼<br>ザンネンだ。わたしは今、タクハイ<br>ビンのピザを注文したところだ。<br>すまん・・・OVER ▽ | NORDEN: That must be the Zanzibar hamster, said to be deadly poisonous. There are 1,183 species of rat in the world.<br>Among them the hamster is a rodent of the rat family, 25 to 28 cm long, living from western Europe to Siberia and Iraq.<br>That variety must be a hamster that turned into a house rat. House rats are very wary and never leave their nest in front of people.<br>...Their staple food is cheese. That's it!? Cheese. With cheese you can lure it out!! Haven't you got any cheese??<br>Too bad. I've just ordered a pizza by delivery. Sorry... OVER |

**Record 1** (flags 3A 78, with all of them set)

| | Original | Translation |
|---|---|---|
| `p49:A2FD` | ノルデン『おそらくボアのイッシュだろう。ヤ<br>コウセイでセイシツはおとなしい。<br>だがヘビはおおぐらいだからな。な<br>んでもたべるぞ。 ▼<br>とくにレーションなんかはコウブツ<br>だろうな。はやくすてた方がいい。<br>スペース・キーですてるんだ。 ▼<br>ヘビがタマゴのカラのところに来た<br>時にすてろ。・・・OVER ▽ | NORDEN: Probably a kind of boa. Nocturnal and gentle by nature. But snakes are big eaters. They'll eat anything.<br>They'd especially love rations. Better throw them away quickly. Throw them away with the space key.<br>Throw them away when the snake comes to the eggshell... OVER |

**Record 2** (flags 3C 79, with all of them set)

| | Original | Translation |
|---|---|---|
| `p49:A1CD` | ノルデン『それはザンジバー・モリフクロウだ<br>よ。フクロウはしってのとうり、ヤ<br>コウセイのニクショクチョウで全世<br>界にやく120シュいる。 ▼<br>ザンジバーモリフクロウはゼンチョ<br>ウが20センチ、中央アジアだけに<br>セイソクする。 ▼<br>タマゴはしろ、2から7ニチカンカ<br>クでうみ、ホウランはメスだけがお<br>こなう。イデンシカイリョウにより<br>スウジツカンでタマゴがかえる。 ▼<br>このフクロウはヤコウセイでしかも<br>セイカクにニチボツゴ、なくことか<br>らザンジバーランドでは時計がわり<br>にしているらしい。 ▼<br>いちど、なにかのリユウでないたフ<br>クロウのコエにかんちがいして夜を<br>ひるとまちがえたことがあるくらい<br>だ・・・OVER ▽ | NORDEN: That's the Zanzibar forest owl. As you know, owls are nocturnal birds of prey, about 120 species in the world.<br>The Zanzibar forest owl is 20 cm long and lives only in central Asia.<br>The eggs are white, laid every 2 to 7 days, and only the female sits on them. Genetically modified, the eggs hatch in a few days.<br>This owl is nocturnal and hoots exactly after sunset, so in Zanzibar Land they seem to use it as a clock.<br>Once, when an owl hooted for some reason, people mistook the night for the day, that's how it is... OVER |

**Record 3** (flags 38 97, with all of them set)

| | Original | Translation |
|---|---|---|
| `p49:A13F` | ノルデン『きみのハナシだけではなんのタマゴ<br>かわからんな。ハチュウルイかチョ<br>ウルイのタマゴであることはたしか<br>だが・・・ ▼<br>あっそうそう、おでんのタマゴはキ<br>リクチはしろでなければいけないが<br>あじはしみていなければならない。<br>・・・OVER ▽ | NORDEN: From what you tell me I can't say what egg it is. It's certainly a reptile's or a bird's egg, but...<br>Oh yes, by the way, an egg in oden has to be cut clean and white, but it has to soak up the flavour... OVER |

**Record 4** (flags 39 98, with all of them set)

| | Original | Translation |
|---|---|---|
| `p49:A13F` | ノルデン『きみのハナシだけではなんのタマゴ<br>かわからんな。ハチュウルイかチョ<br>ウルイのタマゴであることはたしか<br>だが・・・ ▼<br>あっそうそう、おでんのタマゴはキ<br>リクチはしろでなければいけないが<br>あじはしみていなければならない。<br>・・・OVER ▽ | NORDEN: From what you tell me I can't say what egg it is. It's certainly a reptile's or a bird's egg, but...<br>Oh yes, by the way, an egg in oden has to be cut clean and white, but it has to soak up the flavour... OVER |

**Record 5** (flags 1F 75 5A 99, with all of them set)

| | Original | Translation |
|---|---|---|
| `p49:A024` | ノルデン『それはデンショばとにクンレンされ<br>たモリバトだ。ハトは全世界になん<br>と260シュもいる。 ▼<br>ゼンチョウはヤク40センチ、ヨー<br>ロッパから南アジアにブンプする。<br>そのハトはおそらくマルフ博士が連<br>れてきたものだろう。 ▼<br>ハトは物音にビンカンでショウシン<br>者だ。ちかづくとケハイでとび立っ<br>てしまう。そのくせ、ごうつくばり<br>の大ぐらい。 ▼<br>シュショクはこくもつ・・・<br>そうだ！マメかポテトがあればおび<br>きよせられるぞ。 ▼<br>わたしは今、ポテトのLサイズをた<br>のんだところだ。・・・わるいな。<br>戦場にハンバーガーやさんはないわ<br>な？・・・OVER ▽ | NORDEN: That's a wood pigeon trained as a carrier pigeon. There are no fewer than 260 species of pigeon in the world.<br>It's about 40 cm long and lives from Europe to southern Asia. That pigeon was probably brought by Dr Marv.<br>Pigeons are sensitive to noise and timid. They fly off when they sense you coming. And yet they're greedy gluttons.<br>Their staple food is grain... That's it! With beans or potatoes you can lure them.<br>I've just ordered a large portion of potatoes... sorry. There are no burger shops on the battlefield, are there?... OVER |

**Record 6** (flags 76 0E, with all of them set)

| | Original | Translation |
|---|---|---|
| `p48:9FC3` | ノルデン『FOX　HOUNDではどうしてコ<br>ードネームに動物の名前をつかうの<br>かね？戦場に動物がにあうというの<br>は人間のおもい上がりだ。 ▼<br>私にはリカイできんな<br>・・・OVER ▽ | NORDEN: Why does FOX HOUND use animal names for code names? Thinking animals suit the battlefield is human conceit.<br>I can't understand it... OVER |

### 140.15

Speaking: ホーリー, SNAKE. The conversation at `p48:813F`, with 10 records.

**Record 0** (flags 9A 84, with all of them set)

| | Original | Translation |
|---|---|---|
| `p48:88E1` | ホーリー『SNAKE！音・・・音がするの。<br>わたしの左から・・・エレベーター<br>の音がする。 ▼<br>それから・・・右からはポンプのよ<br>うな音がきこえるわ。前とうしろか<br>らは水のながれる音がする ▽ | HOLLY: SNAKE! Sounds... I can hear sounds. From my left... the sound of a lift.<br>And from the right... something like a pump. From in front and behind, the sound of running water. |
| `p48:8944`<br>1 frame later | SNAKE『前ごから水の音・・・右からポンプ<br>音・・・左からエレベーター音？<br>音のマップができたな ▽ | SNAKE: Water in front and behind... a pump on the right... a lift on the left? That makes a map of sounds. |
| `p48:897A`<br>1 frame later | ホーリー『SNAKE！かれらわたしのムセン<br>キに気がつかなかったみたい。<br>だけどはやくきてっ！まってるわ ▽ | HOLLY: SNAKE! It seems they didn't notice my radio. But come quickly! I'm waiting. |

**Record 1** (flags 4C 7A, with all of them set)

| | Original | Translation |
|---|---|---|
| `p48:87CC` | ホーリー『今はタイミングがわるいの！・・・<br>あとにして、ゴメン ▽ | HOLLY: It's a bad moment now!... later, sorry. |

**Record 2** (flags 85, with all of them set)

| | Original | Translation |
|---|---|---|
| `p48:8BE7` | ホーリー『収容所の中のことはわたしでもわか<br>らないわ。<br>ゴメン・・・じゃあね ▽ | HOLLY: Even I don't know what's inside the prison camp. Sorry... bye. |

**Record 3** (flags 92 86 5A, with all of them set)

| | Original | Translation |
|---|---|---|
| `p48:8A90` | ホーリー『10Fから20Fにはラセンカイダ<br>ンがあったはず。すこしきついけど<br>ウンドウになるわ・・じゃあね ▽ | HOLLY: There should be a spiral staircase from 10F to 20F. A bit tiring, but good exercise... bye. |

**Record 4** (flags 87 1C 1B, with all of them set)

| | Original | Translation |
|---|---|---|
| `p48:8DC3` | ホーリー『グレネード？<br>・・・タワービルの10かいの南に<br>あるってきいたわ・・・じゃあね ▽ | HOLLY: Grenades? ...I heard they're to the south on the 10th floor of the Tower Building... bye. |

**Record 5** (flags 14 15 88, with all of them set)

| | Original | Translation |
|---|---|---|
| `p48:8D37` | ホーリー『タイクウミサイルはハインドDにソ<br>ウビするためにぬまの北東のブキコ<br>にあるってきいたけど。 ▼<br>・・・じゃあね ▽ | HOLLY: I heard the anti-air missiles are in the weapon store north-east of the swamp, to arm the Hind D.<br>...bye. |

**Record 6** (flags 89 58, with all of them set)

| | Original | Translation |
|---|---|---|
| `p48:8AE0` | ホーリー『ジライタンチキなら3Fにあるわ<br>・・・じゃあね ▽ | HOLLY: The mine detector is on 3F... bye. |

**Record 7** (flags 0C 8A, with all of them set)

| | Original | Translation |
|---|---|---|
| `p48:8AC3` | ホーリー『まよいのモリはコンパスもつかえな<br>いわ・・・じゃあね ▽ | HOLLY: In the forest of confusion even a compass is no use... bye. |

**Record 8** (flags 5A 7A, with all of them set)

| | Original | Translation |
|---|---|---|
| | (no message) (at random, up to 25 out of 100) | |
| `p48:89AD`<br>at random, up to 30 out of 100 | ホーリー『タワービルはたかさ600メートル<br>、地下1F、地上1F、10F、<br>20F、30F、40F［R］。 ▼<br>20Fに北むきのベランダがある<br>わ・・じゃあね ▽ | HOLLY: The Tower Building is 600 metres high: B1, 1F, 10F, 20F, 30F and 40F [R].<br>On 20F there's a balcony facing north... bye. |
| `p48:89FD`<br>at random, up to 35 out of 100 | ホーリー『タワービルはザンジバーランドゼン<br>イキを見わたせるように作られた軍<br>事的なキョテンよ・・・じゃあね ▽ | HOLLY: The Tower Building is a military base built to overlook the whole of Zanzibar Land... bye. |
| `p48:8A36`<br>at random, up to 40 out of 100 | ホーリー『エレベーターは3本あるわ。北エレ<br>ベーターがB1、1F、10Fにと<br>まり。 ▼<br>中央エレベーターが1F、20F、<br>南エレベーターが1F、30Fにと<br>まるわ・・・じゃあね ▽ | HOLLY: There are 3 lifts. The north lift stops at B1, 1F and 10F.<br>The central lift at 1F and 20F, and the south lift at 1F and 30F... bye. |
| `p48:8A90`<br>at random, up to 45 out of 100 | ホーリー『10Fから20Fにはラセンカイダ<br>ンがあったはず。すこしきついけど<br>ウンドウになるわ・・じゃあね ▽ | HOLLY: There should be a spiral staircase from 10F to 20F. A bit tiring, but good exercise... bye. |
| `p48:8780`<br>at random, up to 50 out of 100 | ホーリー『ザンジバーランドには大ぜいのこど<br>もたちがいるの。世界各こくの戦ソ<br>ウコジ・・・ ▼<br>ムジャキなこどもたちだからガイは<br>ないわ・・・じゃあね ▽ | HOLLY: There are lots of children in Zanzibar Land. War orphans from all over the world...<br>They're innocent children, so they're harmless... bye. |
| `p48:87CC`<br>at random, up to 75 out of 100 | ホーリー『今はタイミングがわるいの！・・・<br>あとにして、ゴメン ▽ | HOLLY: It's a bad moment now!... later, sorry. |
| `p48:87EA`<br>at random, up to 80 out of 100 | ホーリー『ここのドアはすべてコンピュータせ<br>いぎょされてるの。 ▼<br>それぞれのICカードがないとあけ<br>られないわ・・・じゃあね ▽ | HOLLY: All the doors here are computer controlled.<br>You can't open them without the right IC card... bye. |
| `p48:8C0F`<br>at random, up to 85 out of 100 | ホーリー『ザンジバービルとタワービルのスイ<br>ゲンはおなじよ。 ▼<br>つまりふたつのビルはスイコウでつ<br>ながっているということじゃない？<br>・・・じゃあね ▽ | HOLLY: The Zanzibar Building and the Tower Building have the same water source.<br>So the two buildings are connected by a waterway, aren't they?... bye. |
| `p48:8C55`<br>at random, up to 90 out of 100 | ホーリー『アオジャシンにはのってないけど ▼<br>ザンジバービルとタワービルは地下<br>でつながっているっていうこどもた<br>ちのウワサをきいたけど<br>・・じゃあね ▽ | HOLLY: It's not in the blueprints, but<br>I heard a rumour from the children that the Zanzibar Building and the Tower Building are connected underground... bye. |
| `p48:8C9E`<br>at random, up to 100 out of 100 | ホーリー『ザンジバーランドにはおおくのこど<br>もたちがいるでしょう？ ▼<br>だから、こどもたちが出入りできる<br>小さなかくれ場所がたくさんある<br>のよ・・・じゃあね ▽ | HOLLY: There are a lot of children in Zanzibar Land, aren't there?<br>So there are lots of little hiding places the children can get in and out of... bye. |

**Record 9** (flags 59 7A, with all of them set)

| | Original | Translation |
|---|---|---|
| | (no message) (at random, up to 30 out of 100) | |
| `p48:85D3`<br>at random, up to 35 out of 100 | ホーリー『ザンジバービルのコウゾウは地下2<br>かい、地上4かいだて。 ▼<br>1かいが中央指令室、カクノウコ、<br>エ場。 ▼<br>2かいはデッキ、3かいはケンキュ<br>ウかいはつフロア、4かいは兵士た<br>ちの生かつフロア。 ▼<br>B1はブキ、ダンヤクコ、B2は水<br>コウよ・・・じゃあね ▽ | HOLLY: The Zanzibar Building has 2 floors underground and 4 above.<br>1F is the central command room, the hangar and the factory.<br>2F is the deck, 3F the research and development floor, 4F the soldiers' living floor.<br>B1 is the weapon and ammunition store, B2 the waterway... bye. |
| `p48:865D`<br>at random, up to 40 out of 100 | ホーリー『ザンジバービルにはエレベーターが<br>2本あるわ。 ▼<br>東エレベーターが4F、3F、2F<br>、1Fに止まり、西エレベーターは<br>2F、B1、B2にとまるの。 ▼<br>ここのエレベーターはOUTER<br>HEAVENとちがって自分で<br>よばないといけないのよ。 ▼<br>わかった？・・・じゃあね ▽ | HOLLY: The Zanzibar Building has 2 lifts.<br>The east lift stops at 4F, 3F, 2F and 1F, the west lift at 2F, B1 and B2.<br>Unlike OUTER HEAVEN, here you have to call the lifts yourself.<br>Got it?... bye. |
| `p48:86E7`<br>at random, up to 45 out of 100 | ホーリー『トイレなら4Fにあるわ。<br>4Fはね兵士たちの生かつ空間な<br>の ▼<br>だからサウナ、ショクドウ、ロッカ<br>ールーム、シュクシャなんかがある<br>の・・・じゃあね ▽ | HOLLY: The toilets are on 4F. 4F is the soldiers' living space.<br>So there's a sauna, a canteen, a locker room, the dormitories and so on... bye. |
| `p48:8738`<br>at random, up to 50 out of 100 | ホーリー『各かいのダストシュートはB2のゴ<br>ミショリ場へつながっているわ。 ▼<br>にげ道につかえるけどゴミショリキ<br>には気をつけてね・・・じゃあね ▽ | HOLLY: The rubbish chutes on each floor lead to the waste plant on B2.<br>You can use them as an escape route, but watch out for the waste crusher... bye. |
| `p48:8780`<br>at random, up to 55 out of 100 | ホーリー『ザンジバーランドには大ぜいのこど<br>もたちがいるの。世界各こくの戦ソ<br>ウコジ・・・ ▼<br>ムジャキなこどもたちだからガイは<br>ないわ・・・じゃあね ▽ | HOLLY: There are lots of children in Zanzibar Land. War orphans from all over the world...<br>They're innocent children, so they're harmless... bye. |
| `p48:87CC`<br>at random, up to 90 out of 100 | ホーリー『今はタイミングがわるいの！・・・<br>あとにして、ゴメン ▽ | HOLLY: It's a bad moment now!... later, sorry. |
| `p48:87EA`<br>at random, up to 95 out of 100 | ホーリー『ここのドアはすべてコンピュータせ<br>いぎょされてるの。 ▼<br>それぞれのICカードがないとあけ<br>られないわ・・・じゃあね ▽ | HOLLY: All the doors here are computer controlled.<br>You can't open them without the right IC card... bye. |
| `p48:8825`<br>at random, up to 100 out of 100 | ホーリー『指令室にはこのヨウサイのゼンボウ<br>がわかるマップがあるわ。 ▼<br>注意して見て・・・じゃあね ▽ | HOLLY: In the command room there's a map showing the whole fortress.<br>Look at it carefully... bye. |

### 140.93

Speaking: ケスラー, SNAKE. The conversation at `p48:8188`, with 8 records.

**Record 0** (flags 50 7A, with all of them set)

| | Original | Translation |
|---|---|---|
| `p49:B5B9` | ケスラー『BIG　BOSS・・・ ▼<br>ウイリアム・モーガンとならぶデン<br>セツ的軍人。かれのソンザイはヨウ<br>兵たちの間でシンワと化している ▽ | KESSLER: BIG BOSS...<br>A legendary soldier on a par with William Morgan. Among mercenaries he has become a myth. |
| `p49:B5FF`<br>1 frame later | SNAKE『そんなことはいい！やつのサイシン<br>のジョウホウがしりたい ▽ | SNAKE: Never mind that! I want his latest information. |
| `p49:B61E`<br>1 frame later | ケスラー『わかった・・だがこれはたんなるう<br>わさだぜ、いいか。3年前のOUT<br>ER　HEAVENカンラクでかれ<br>はヒン死のジュウショウをおった ▼<br>リョウテ、リョウアシ、右目、右み<br>みをうしないながらも、やつはかろ<br>うじて・・・生きていた。 ▼<br>そんなおり、東がわのボウクンが物<br>体と化したヤツに目をつけた。やつ<br>の軍人としてのサイノウがミリョク<br>だったのだろうよ。 ▼<br>やつらはペトロビッチ・マッドナー<br>のSNATCHERケイカクを<br>いそがせ、かれをそのジッケンバイ<br>タイとしてえらんだ。 ▼<br>サイバネティックス・オーガズムと<br>かいうジッケンらしい。つまりかれ<br>は人であって人でない。しんじられ<br>ねぇがな・・ ▼<br>これが本当だとすりゃ、SNAKE<br>、おまえにかち目はねえぞ！やつに<br>はどんなトクシュギジュツも通用し<br>ねえ。 ▼<br>SNAKE・・・あきらめろ・・・<br>かてねぇぜ、やつには。<br>・・・OVER ▽ | KESSLER: All right... but this is just a rumour, eh. Three years ago, at the fall of OUTER HEAVEN, he was mortally wounded.<br>He lost both hands, both legs, his right eye and his right ear, but somehow... he was still alive.<br>Then a tyrant from the East took an interest in the thing he had become. His talent as a soldier must have appealed to them.<br>They hurried on Pettrovich Madnar's SNATCHER plan and chose him as its test subject.<br>Some experiment called «cybernetic organism». So he's a man and not a man. Hard to believe...<br>If it's true, SNAKE, you don't stand a chance! No special technique will work on him.<br>SNAKE... give up... you can't beat him... OVER |

**Record 1** (flags 3F 3E 62, with all of them set)

| | Original | Translation |
|---|---|---|
| `p49:B233` | ケスラー『NIGHT　SIGHT？<br>SNAKE、今NIGHT　SI<br>GHTといったか？！おそろしい<br>やつをテキにまわしちまったな。 ▼<br>NIGHT　SIGHTは北ベ<br>トナムでグリーンベレー以上にジャ<br>ングル戦にたけたといわれるデンセ<br>ツのゲリラブタイウィスパーズ ▼<br>の生きのこりだ。サイシンのカモフ<br>ラージュスーツをまとい、ステルス<br>。やつのすがたを目にしたのはひと<br>にぎりしかいねぇ。 ▼<br>このオレでさえみたことがねぇんだ<br>！これがすがたなきアンサツ者とい<br>われるゆえんだ。 ▼<br>SNAKE、あんたのコウウンもこ<br>のあたりでおわりかな<br>・・・OVER ▽ | KESSLER: NIGHT SIGHT? SNAKE, did you just say NIGHT SIGHT?! You've made a frightening enemy.<br>NIGHT SIGHT is a survivor of the Whispers, the legendary guerrilla unit of North Vietnam said to be better at jungle warfare than the Green Berets.<br>He wears the latest camouflage suit: stealth. Only a handful of people have ever set eyes on him.<br>Even I have never seen him! That's why he's called the invisible assassin.<br>SNAKE, maybe your luck runs out about here... OVER |

**Record 2** (flags 37 36 9D, with all of them set)

| | Original | Translation |
|---|---|---|
| `p49:B1A9` | ケスラー『PREDATORか・・・<br>もとレックス・コマンド出身のハン<br>ターだ。ジャングルでのゲリラ戦を<br>もっとも得意としている。 ▼<br>ジャングルでのやつは人間ばなれし<br>ている。ベトナムの南イエメンでは<br>たったー人で2コ中タイをゼンメツ<br>させたといわれてる。OVER ▽ | KESSLER: PREDATOR, eh... a hunter, ex Rex Command. Guerrilla war in the jungle is his speciality.<br>In the jungle he's beyond human. They say in South Yemen in Vietnam he wiped out 2 companies on his own. OVER |

**Record 3** (flags 33 32, with all of them set)

| | Original | Translation |
|---|---|---|
| `p49:B11B` | ケスラー『ULTRABOXか・・・<br>SAS、GSG9、UDT出以者で<br>コンセイされたミッシツ専門のアン<br>サツブタイだ。 ▼<br>どいつも戦ソウのプロだ。やつらは<br>まばたきひとつせずに人をころす。<br>同時にあいてにしてはふりだ。 ▼<br>ー人ずつ、かたずけるのがベストだ<br>ぜ・・・OVER ▽ | KESSLER: ULTRABOX, eh... a squad of assassins specialised in closed rooms, made up of ex SAS, GSG9 and UDT men.<br>Every one of them is a war professional. They kill without blinking. Taking them on all at once is hopeless.<br>Best to deal with them one at a time... OVER |

**Record 4** (flags 87 1C 1B, with all of them set)

| | Original | Translation |
|---|---|---|
| `p49:B042` | ケスラー『RED　BLASTERか・<br>あかいバクハマとしてしられるソ<br>ビエトのルムンバ大学出のアンサ<br>ツ専門エリートだ。 ▼<br>やつのてはブービートラップをは<br>りめぐらし、あいてのあしどめを<br>しておいてからトクイのグレネー<br>ド・ランチャーでとどめをさす。 ▼<br>SNAKE、グレネードにはグレ<br>ネードでオウタイしろ！やつもま<br>た、なにかのショウヘキに身をか<br>くしているはず。 ▼<br>グレネードならそんな所でもコウ<br>ゲキできるぜ。・・・OVER ▽ | KESSLER: RED BLASTER, eh... known as the red bomber, an elite assassin from the Soviet Lumumba University.<br>His method is to lay booby traps all around to pin his target down, then finish him off with his favourite grenade launcher.<br>SNAKE, answer grenades with grenades! He'll be hiding behind some obstacle too.<br>Grenades can hit even a place like that... OVER |

**Record 5** (flags 15 14 88, with all of them set)

| | Original | Translation |
|---|---|---|
| `p49:AF2E` | ケスラー『HIND・Dか・・・<br>この名前をきいただけでだいの男た<br>ちがキモをひやす。 ▼<br>へへ・・セキサイジュウリョウ1マ<br>ン2センキロ、サイコウジソク25<br>0キロ、サイコウコウド4500メ<br>ートル。 ▼<br>ミサイル、バルカンホウをそなえ、<br>チタニウムソウコウバンでまもられ<br>た空のかい物。 ▼<br>コウドからのショウシャをされたら<br>ひとたまりもねぇ。 ▼<br>出会えばサイゴ、かち目なんぞねぇ<br>・・・と言いてぇところだが、タイ<br>クウミサイルのトウジョウでジジョ<br>ウはかわってきた。 ▼<br>タイクウミサイルがあれば、このカ<br>イチョウをおとすことができるぜ<br>・・・OVER ▽ | KESSLER: HIND D, eh... just hearing the name sends a chill through grown men.<br>Heh... maximum load 12,000 kg, top speed 250 km/h, ceiling 4,500 metres.<br>Armed with missiles and Vulcan cannon, a monster of the sky protected by titanium armour plate.<br>If it fires on you from up high, you're done for.<br>Meet it and it's the end, no chance... is what I'd like to say, but anti-air missiles have changed things.<br>With an anti-air missile you can bring this monster down... OVER |

**Record 6** (flags 10 0F 8E, with all of them set)

| | Original | Translation |
|---|---|---|
| `p49:AE2F` | ケスラー『RUNNING　MANか・・<br>もとバルセロナ・オリンピックのタ<br>ンキョリランナーだ。100メート<br>ルを9、69ビョウではしる。 ▼<br>ドーピングでリクジョウキョウカイ<br>からツイホウされ、ヨーロッパのテ<br>ロリズムにサンカした。 ▼<br>とてもあんたの足ではおいつけね<br>ぇぜ。まさにチータとヘビだ。こい<br>つをやるにはトラップをしかけてお<br>いこむしかねぇ。 ▼<br>やつのコース上にしかければ見こみ<br>はある。 ▼<br>・・・ただし、ガスがまわる前にな<br>。大事なのはよ、やつの足のはや<br>さをぎゃくにりようするんだ<br>・・・OVER ▽ | KESSLER: RUNNING MAN, eh... a former sprinter from the Barcelona Olympics. He runs 100 metres in 9.69 seconds.<br>Banned from athletics for doping, he joined European terrorism.<br>Your legs will never catch him. Cheetah against snake. The only way to get him is to set traps and drive him into them.<br>Set them on his course and you've got a chance.<br>...but before the gas spreads. The key is to turn his speed against him... OVER |

**Record 7** (flags 09 08, with all of them set, in zone 03, room 06)

| | Original | Translation |
|---|---|---|
| `p49:AD09` | ケスラー『BLACK　COLORか・・<br>2年ぐれぇ前からこの世界で有名に<br>なってきたやつだ。以前のケイレキ<br>はわからねぇ。 ▼<br>NASAのタイチキュウ外カンキ<br>ョウトクシュブタイ出身のハイテ<br>クニンジャだ。 ▼<br>フライング・スターとスピーディー<br>なコウゲキを得意としている ▼<br>いいな、やつはオレたちみてぇな<br>プロの戦ソウやじゃねぇ、エリート<br>のうちゅうやさんだ。 ▼<br>だからかえってシマツがわりい。<br>プロの動きはヨソクできるがよ、ア<br>マチュアの動きはそうはいかねぇ ▼<br>SNAKE、まずはあんたのおてな<br>みハイケンといくか・・・ ▼<br>キタイしてるぜ、<br>ローンレンジャー・・・OVER ▽ | KESSLER: BLACK COLOR, eh... he's become famous in this world in the last two years or so. Nothing's known of his past.<br>A high-tech ninja from NASA's special extraterrestrial environment unit.<br>His speciality is flying stars and fast attacks.<br>Mind you, he's not a war professional like us, he's an elite astronaut.<br>That makes him all the more trouble. A professional's moves can be predicted, but an amateur's can't.<br>SNAKE, let's see what you can do first...<br>I'm counting on you, Lone Ranger... OVER |

### 140.82

Speaking: ペトロ, SNAKE. The conversation at `p48:81CA`, with 5 records.

**Record 0** (flags 74 26 2E, with all of them set)

| | Original | Translation |
|---|---|---|
| | (no message) (at random, up to 50 out of 100) | |
| `p49:ACC8`<br>at random, up to 100 out of 100 | ペトロ『SNAKE、マルフはまだみつから<br>んか？・・・きっとせめられている<br>にちがいない。はやくたすけてやっ<br>てくれ。・・・OVER ▽ | PETRO: SNAKE, haven't you found Marv yet?... they must be torturing him. Please rescue him quickly... OVER |

**Record 1** (flags 73 23, with all of them set)

| | Original | Translation |
|---|---|---|
| `p49:AC80` | ペトロ『ナターシャは女じゃ。女しかいけな<br>い場所でまちぶせてはどうじゃ？<br>たとえば女子トイレとか・・・<br>・・・OVER ▽ | PETRO: Natasha is a woman. Why not wait for her somewhere only women can go? The women's toilets, for instance... OVER |

**Record 2** (flags 72 22 5A, with all of them set)

| | Original | Translation |
|---|---|---|
| `p49:AA88` | ペトロ『マルフはチェコごとスロバキアごし<br>かはなせん。それにケイカイ心がつ<br>よいタイプ、こんなジョウキョウで<br>はなおさらじゃ ▽ | PETRO: Marv only speaks Czech and Slovak. And he's the cautious type, all the more in a situation like this. |
| `p49:AAC6`<br>1 frame later | SNAKE『あんたは、ペトロビッチ？ ▽ | SNAKE: You are Pettrovich? |
| `p49:AAD5`<br>1 frame later | ペトロ『わしはロシアごとえいごしかはなせ<br>ん・・・<br>そうじゃ！<br>ナターシャならはなせる ▽ | PETRO: I only speak Russian and English... That's it! Natasha can speak it. |
| `p49:AAFF`<br>1 frame later | SNAKE『ナターシャ？<br>・・・あんたらをゴエイしてきたS<br>TBの女か？ ▽ | SNAKE: Natasha? ...the STB woman who was escorting you? |
| `p49:AB21`<br>1 frame later | ペトロ『カノジョならコトバもわかるし、マ<br>ルフも気をゆるしているはず ▽ | PETRO: She knows the language, and Marv should trust her. |
| `p49:AB43`<br>1 frame later | SNAKE『ぶじなのか？その女 ▽ | SNAKE: Is she safe? That woman. |
| `p49:AB50`<br>1 frame later | ペトロ『大じょうぶ、ナターシャはふつうの<br>女ではない。プロのエージェントじ<br>ゃ。 ▼<br>わしらがつかまった時、かのじょだ<br>けはなんとかテキのユニフォームを<br>ぬすんでにげることができたんじゃ<br>。 ▼<br>きっとキカイをうかがってこのザン<br>ジバーランドのどこかにセンプクし<br>ているはずじゃ。 ▽ | PETRO: Don't worry, Natasha is no ordinary woman. She's a professional agent.<br>When we were captured, she alone managed to steal an enemy uniform and escape.<br>She must be lying low somewhere in Zanzibar Land, waiting for her chance. |
| `p49:ABDA`<br>1 frame later | SNAKE『カノジョもムセンキを？ ▽ | SNAKE: Does she have a radio too? |
| `p49:ABE8`<br>1 frame later | ペトロ『いや、つかまった時に真っさきにう<br>ばわれた・・・わかるのはかのじょ<br>もテキのユニホームをきていること<br>だけじゃ ▽ | PETRO: No, it was the first thing they took when we were caught... all I know is that she is also wearing an enemy uniform. |
| `p49:AC24`<br>1 frame later | SNAKE『てがかりはなしか・・・ ▽ | SNAKE: No leads, then... |
| `p49:AC32`<br>1 frame later | ペトロ『てがかりはかのじょが女ということ<br>じゃ。たとえテキのカッコウをして<br>いようとも・・・このヨウサイに女<br>兵士はいないからの。 ▼<br>それがてがかりじゃ ▽ | PETRO: The lead is that she's a woman. Even dressed as the enemy... there are no women soldiers in this fortress.<br>That's the lead. |
| `p49:AC80`<br>1 frame later | ペトロ『ナターシャは女じゃ。女しかいけな<br>い場所でまちぶせてはどうじゃ？<br>たとえば女子トイレとか・・・<br>・・・OVER ▽ | PETRO: Natasha is a woman. Why not wait for her somewhere only women can go? The women's toilets, for instance... OVER |

**Record 3** (flags 71 0E, with all of them set)

| | Original | Translation |
|---|---|---|
| | (no message) (at random, up to 50 out of 100) | |
| `p49:ACC8`<br>at random, up to 100 out of 100 | ペトロ『SNAKE、マルフはまだみつから<br>んか？・・・きっとせめられている<br>にちがいない。はやくたすけてやっ<br>てくれ。・・・OVER ▽ | PETRO: SNAKE, haven't you found Marv yet?... they must be torturing him. Please rescue him quickly... OVER |

**Record 4** (flags 0D 70 9B, with all of them set)

| | Original | Translation |
|---|---|---|
| `p49:A548` | ペトロ『おう、わかってくれたか・・・<br>タップ・コードの意味を ▽ | PETRO: Ah, so you understood... the meaning of the tap code. |
| `p49:A567`<br>1 frame later | SNAKE『マルフ博士？ ▽ | SNAKE: Dr Marv? |
| `p49:A572`<br>1 frame later | ペトロ『ひしぶりだな、<br>SOLID　SNAKE！ ▽ | PETRO: Long time no see, SOLID SNAKE! |
| `p49:A589`<br>1 frame later | SNAKE『ペトロビッチ博士？<br>・・・どうして！ ▽ | SNAKE: Dr Pettrovich? ...How come! |
| `p49:A5A0`<br>1 frame later | ペトロ『マルフとわしはプラハの学会でよく<br>会っていた。ことばこそ通じないが<br>いっしゅの学者なかまじゃった。 ▼<br>わしもマルフといっしょにアメリカ<br>ホウモンのさい、ここの連中につか<br>まったのじゃ。 ▽ | PETRO: Marv and I often met at conferences in Prague. We can't understand each other's language, but we're fellow scholars of a sort.<br>I was caught by this lot together with Marv, on our visit to America. |
| `p49:A606`<br>1 frame later | SNAKE『マルフ博士は？ ▽ | SNAKE: And Dr Marv? |
| `p49:A612`<br>1 frame later | ペトロ『かれはすうじつ前、ここからタワー<br>ビルにうつされた。ここから北にす<br>うキロのところにあるたかいビルじ<br>ゃ ▽ | PETRO: A few days ago he was moved from here to the Tower Building. It's a tall building a few kilometres north of here. |
| `p49:A64B`<br>1 frame later | SNAKE『くそっ、またておくれかっ！<br>マルフはタワービル・・・ ▽ | SNAKE: Damn, too late again! Marv is in the Tower Building... |
| `p49:A668`<br>1 frame later | ペトロ『SNAKE、わしがいかされている<br>ケントウがつくか？ ▽ | PETRO: SNAKE, can you guess why they're keeping me alive? |
| `p49:A685`<br>1 frame later | SNAKE『・・・あんたがヒツヨウだからだ。<br>・・・すると？？ ▽ | SNAKE: ...because they need you. ...So?? |
| `p49:A6A1`<br>1 frame later | ペトロ『そう・・・METAL　GEARじ<br>ゃよ。SNAKE。<br>あるのじゃ、あれが・・・ここに。<br> ▼<br>あたらしいMETAL　GEARは<br>すでにカンセイしておる。3年前、<br>あんたがハカイしたのはたんなるシ<br>サクヒン・・・ ▼<br>今では、あのスウバイものパワーを<br>ひめたカイリョウタイプが作られ、<br>さらにそのケイリョウ化タイプのリ<br>ョウサンもすすめられている。 ▽ | PETRO: That's right... METAL GEAR, SNAKE. It exists... here.<br>The new METAL GEAR is already finished. What you destroyed three years ago was just a prototype...<br>Now an improved type with several times its power has been built, and mass production of a lighter type is under way. |
| `p49:A752`<br>1 frame later | SNAKE『すると、あのハイキ用カクチョゾウ<br>コシュウゲキはMETAL　GEA<br>Rが・・・ ▽ | SNAKE: So those attacks on the nuclear stores for dismantling were METAL GEAR... |
| `p49:A77D`<br>1 frame later | ペトロ『その通り。METAL　GEARは<br>カクトウサイホコウセンシャじゃ。<br>こいつのジツリョクはカクをトウサ<br>イしてはじめてハッキされる。 ▼<br>ザンジバーランドは世界でユイイツ<br>カクをテに入れた。その上、ダイタ<br>イエネルギーであるOILIXを<br>わがものにしようとしている。 ▼<br>SNAKE・・・ここまで言えば、<br>こいつらのクロマクが見えてきたじ<br>ゃろう？ ▽ | PETRO: Exactly. METAL GEAR is a nuclear-armed walking tank. Its real power only shows once it carries nuclear weapons.<br>Zanzibar Land is the only place in the world that has its hands on nuclear weapons. And on top of that it wants OILIX, the alternative energy, for itself.<br>SNAKE... with all I've told you, you can see who's behind them, can't you? |
| `p49:A830`<br>1 frame later | SNAKE『BIG・・・BOSS？？ ▽ | SNAKE: BIG... BOSS?? |
| `p49:A83F`<br>1 frame later | ペトロ『やつじゃ！やつはMETAL　GE<br>ARとOILIXで世界をにぎろう<br>とたくらんどる。やつらにわたして<br>はならん！OILIXを。 ▼<br>カガクは人ごろしのためだけにある<br>のではない。マルフはイシはつよい<br>がシンゾウがよわい。いそいでくれ<br>っ！ ▼<br>やつらのゴウモンにいつまでたえら<br>れるかわからん ▽ | PETRO: Him! He plans to rule the world with METAL GEAR and OILIX. They mustn't get OILIX!<br>Science isn't only for killing people. Marv is strong-willed but has a weak heart. Hurry!<br>I don't know how long he can stand their torture. |
| `p49:A8D3`<br>1 frame later | SNAKE『ヤクヒンをつかわれるとヤッカイだ<br>な ▽ | SNAKE: If they use drugs on him, it'll be bad. |
| `p49:A8E8`<br>1 frame later | ペトロ『マルフはわたしと同じ、コガタムセ<br>ンキを体内にもっているはずだ。同<br>コウしていたSTBの女エージェン<br>トがわたしてくれたものじゃ。 ▼<br>シュウハスウがわかればフツウのム<br>センキで連絡できる ▽ | PETRO: Marv, like me, should have a small radio inside his body. The STB woman agent who came with us gave it to us.<br>If you know the frequency you can reach him with an ordinary radio. |
| `p49:A94E`<br>1 frame later | SNAKE『ペトロビッチ、<br>あんたはどうする？ ▽ | SNAKE: Pettrovich, what about you? |
| `p49:A962`<br>1 frame later | ペトロ『きみとわしをへだてるカベはチョバ<br>ムプレートじゃ。バクハはフカノウ<br>じゃ。わしはほっといて、マルフを<br>たすけてくれ。SNAKE ▽ | PETRO: The wall between us is Chobham plate. It can't be blown up. Never mind me, save Marv. SNAKE. |
| `p49:A9A4`<br>1 frame later | SNAKE『わかった。あとでむかえにくる ▽ | SNAKE: All right. I'll come back for you later. |
| `p49:A9B5`<br>1 frame later | ペトロ『SNAKE？ ▽ | PETRO: SNAKE? |
| `p49:A9BE`<br>1 frame later | ペトロ『むすめのエレンがきみのファンでね<br>。なかなかケッコンせん。こまった<br>もんだ。 ▼<br>・・・それからわしのユウジンでヨ<br>ゼフ・ノルデンという動物学者がこ<br>の地方にすんでいるのじゃ。シュウ<br>ハスウ140・40ではなせる。 ▼<br>動物にかんすることなら力になって<br>くれるじゃろう・・・ ▽ | PETRO: My daughter Ellen is a fan of yours. She just won't get married. What a nuisance.<br>...And a friend of mine, a zoologist called Josef Norden, lives in this region. You can talk to him on 140.40.<br>He'll help you with anything about animals... |
| `p49:AA4F`<br>1 frame later | SNAKE『大ジョウブだ。むすめのケッコンシ<br>キには間に合うようにむかえにくる<br> ▽ | SNAKE: Don't worry. I'll be back for you in time for your daughter's wedding. |
| `p49:AA77`<br>1 frame later | ペトロ『ありがとう。SNAKE・・・ ▽ | PETRO: Thank you. SNAKE... |

### 140.51

Speaking: マルフ, SNAKE. The conversation at `p48:8296`, with 2 records.

**Record 0** (flags 72 23, with all of them set)

| | Original | Translation |
|---|---|---|
| `p49:A4B3` | マルフ『メニャー　ザビート　マルフ。<br>シュトー　ナム　ジェラーチ？ムィ<br>ハチーム　ミーラ。 ▼<br>ムィ　イスラルニャー　エム<br>スボィ　ドルト。ナジョー　<br>ユースィ、シュトー　アン<br>イリジョート。 ▼<br>モィ　タヴァーリシィ・・・ ▽ | MARV: (in Russian, written in katakana) Menya zovut Marv. Shto nam delat'? My khotim mira... (My name is Marv. What shall we do? We want peace...)<br>(the rest, words that do not make sentences)<br>Moy tovarishch... (my comrade...) |

**Record 1** (flags 72 21 5A, with all of them set)

| | Original | Translation |
|---|---|---|
| `p49:A4B3` | マルフ『メニャー　ザビート　マルフ。<br>シュトー　ナム　ジェラーチ？ムィ<br>ハチーム　ミーラ。 ▼<br>ムィ　イスラルニャー　エム<br>スボィ　ドルト。ナジョー　<br>ユースィ、シュトー　アン<br>イリジョート。 ▼<br>モィ　タヴァーリシィ・・・ ▽ | MARV: (in Russian, written in katakana) Menya zovut Marv. Shto nam delat'? My khotim mira... (My name is Marv. What shall we do? We want peace...)<br>(the rest, words that do not make sentences)<br>Moy tovarishch... (my comrade...) |
| `p49:A51E`<br>1 frame later | SNAKE『・・・なんのことだ？・・・<br>さっぱりわからん。ペトロヴィッチ<br>にきいてみようか ▽ | SNAKE: ...What's that? ...I don't understand a word. Maybe I'll ask Pettrovich. |

### 140.27

Speaking: -. The conversation at `p48:82A9`, with 0 records.

### Conversation at p48:8452

**Record 0** (always)

| | Original | Translation |
|---|---|---|
| `p49:B7B6` | ナターシャ『メニャー　ザヴート　ナターシャ ▽ | NATASHA: (in Russian) Menya zovut Natasha. (My name is Natasha.) |
| `p49:B7C8`<br>1 frame later | マルフ『メニャー　ザヴィート　マルフ ▽ | MARV: (in Russian) Menya zovut Marv. (My name is Marv.) |
| `p49:B7D9`<br>1 frame later | ナターシャ『マルフ！カク　ヴィ　セジャー<br>シューフスト　ヴェチェ？ ▽ | NATASHA: (in Russian) Marv! Kak vy sebya chuvstvuete? (Marv! How are you feeling?) |
| `p49:B7F7`<br>1 frame later | マルフ『スパシーバ、ハラショウ　モイ　<br>タバーリシィ、ナターシャ　アナ　<br>セゴドニャ　アソベンナ<br>クラシーヴァ？ ▽ | MARV: (in Russian) Spasibo, khorosho, moy tovarishch. Natasha, ona segodnya osobenno krasivaya? (Thank you, fine, my comrade. Natasha, is she especially pretty today?) |
| `p49:B82E`<br>1 frame later | ナターシャ『スカジィーチェ、パジャルイスタ、<br>マルフ？ ▽ | NATASHA: (in Russian) Skazhite, pozhaluysta, Marv? (Tell me, please, Marv?) |
| `p49:B846`<br>1 frame later | マルフ『タワーヴィル、クレブスキュール<br>ムコヴァ　シュシュノワ　<br>シリバシュ　イケタニ ▽ | MARV: (pseudo-Russian) Tower building... (the rest, words that do not make sentences) |
| `p49:B870`<br>1 frame later | ナターシャ『ムエェ　ナーダ<br>ナダズシ　イアチ ▽ | NATASHA: (pseudo-Russian, words that do not make sentences) |
| `p49:B883`<br>1 frame later | マルフ『ヤ　エム　オダガダーレン<br>シアシアーダ ▽ | MARV: (pseudo-Russian, words that do not make sentences) |

### Conversation at p48:8533

**Record 0** (always)

| | Original | Translation |
|---|---|---|
| `p49:BDDF` | SNAKE『なにをもたもたしている！<br>クリスマスがおわってしまうぞっ ▽ | SNAKE: What are you dawdling for! Christmas will be over! |
| `p49:BDFE`<br>1 frame later | パイロット『こちら、チャーリー。<br>救出地テンまで10キロのところま<br>できている。 ▼<br>もうすこしもちこたえてくれっ！<br>OVER・・・ ▽ | PILOT: Charlie here. We're 10 km from the rescue point.<br>Hold on a little longer! OVER... |
| `p49:BE3E`<br>1 frame later | SNAKE『はやく、たのむ！！ ▽ | SNAKE: Quick, please!! |

### Conversation at p48:8542

**Record 0** (always)

| | Original | Translation |
|---|---|---|
| `p49:BE4A` | SNAKE『チコクだぞ・・・チャーリー！ | SNAKE: You're late... Charlie! |
| `p49:BE5B`<br>160 frames later | パイロット『2人のオジャマをしちゃあわるいか<br>とおもってね | PILOT: I thought I'd better not interrupt you two. |

### Conversation at p48:84B1

**Record 0** (always)

| | Original | Translation |
|---|---|---|
| `p49:AF42` | きいただけでだいの男た<br>ちがキモをひやす。 ▼<br>へへ・・セキサイジュウリョウ1マ<br>ン2センキロ、サイコウジソク25<br>0キロ、サイコウコウド4500メ<br>ートル。 ▼<br>ミサイル、バルカンホウをそなえ、<br>チタニウムソウコウバンでまもられ<br>た空のかい物。 ▼<br>コウドからのショウシャをされたら<br>ひとたまりもねぇ。 ▼<br>出会えばサイゴ、かち目なんぞねぇ<br>・・・と言いてぇところだが、タイ<br>クウミサイルのトウジョウでジジョ<br>ウはかわってきた。 ▼<br>タイクウミサイルがあれば、このカ<br>イチョウをおとすことができるぜ<br>・・・OVER ▽ | (starts in the middle of `p49:AF2E`) |
| `p49:AF5F`<br>1 frame later | サイジュウリョウ1マ<br>ン2センキロ、サイコウジソク25<br>0キロ、サイコウコウド4500メ<br>ートル。 ▼<br>ミサイル、バルカンホウをそなえ、<br>チタニウムソウコウバンでまもられ<br>た空のかい物。 ▼<br>コウドからのショウシャをされたら<br>ひとたまりもねぇ。 ▼<br>出会えばサイゴ、かち目なんぞねぇ<br>・・・と言いてぇところだが、タイ<br>クウミサイルのトウジョウでジジョ<br>ウはかわってきた。 ▼<br>タイクウミサイルがあれば、このカ<br>イチョウをおとすことができるぜ<br>・・・OVER ▽ | (starts in the middle of `p49:AF2E`) |
| `p49:AF7B`<br>1 frame later | キロ、サイコウコウド4500メ<br>ートル。 ▼<br>ミサイル、バルカンホウをそなえ、<br>チタニウムソウコウバンでまもられ<br>た空のかい物。 ▼<br>コウドからのショウシャをされたら<br>ひとたまりもねぇ。 ▼<br>出会えばサイゴ、かち目なんぞねぇ<br>・・・と言いてぇところだが、タイ<br>クウミサイルのトウジョウでジジョ<br>ウはかわってきた。 ▼<br>タイクウミサイルがあれば、このカ<br>イチョウをおとすことができるぜ<br>・・・OVER ▽ | (starts in the middle of `p49:AF2E`) |
| `p49:B00F`<br>1 frame later | ウはかわってきた。 ▼<br>タイクウミサイルがあれば、このカ<br>イチョウをおとすことができるぜ<br>・・・OVER ▽ | (starts in the middle of `p49:AF2E`) |
| `p49:B021`<br>16 frames later | があれば、このカ<br>イチョウをおとすことができるぜ<br>・・・OVER ▽ | (starts in the middle of `p49:AF2E`) |
| `p49:B04E`<br>1 frame later | Rか・<br>あかいバクハマとしてしられるソ<br>ビエトのルムンバ大学出のアンサ<br>ツ専門エリートだ。 ▼<br>やつのてはブービートラップをは<br>りめぐらし、あいてのあしどめを<br>しておいてからトクイのグレネー<br>ド・ランチャーでとどめをさす。 ▼<br>SNAKE、グレネードにはグレ<br>ネードでオウタイしろ！やつもま<br>た、なにかのショウヘキに身をか<br>くしているはず。 ▼<br>グレネードならそんな所でもコウ<br>ゲキできるぜ。・・・OVER ▽ | (starts in the middle of `p49:B042`) |
| `p49:B091`<br>1 frame later | りめぐらし、あいてのあしどめを<br>しておいてからトクイのグレネー<br>ド・ランチャーでとどめをさす。 ▼<br>SNAKE、グレネードにはグレ<br>ネードでオウタイしろ！やつもま<br>た、なにかのショウヘキに身をか<br>くしているはず。 ▼<br>グレネードならそんな所でもコウ<br>ゲキできるぜ。・・・OVER ▽ | (starts in the middle of `p49:B042`) |
| `p49:B0A2`<br>1 frame later | ておいてからトクイのグレネー<br>ド・ランチャーでとどめをさす。 ▼<br>SNAKE、グレネードにはグレ<br>ネードでオウタイしろ！やつもま<br>た、なにかのショウヘキに身をか<br>くしているはず。 ▼<br>グレネードならそんな所でもコウ<br>ゲキできるぜ。・・・OVER ▽ | (starts in the middle of `p49:B042`) |
| `p49:B11F`<br>1 frame later | TRABOXか・・・<br>SAS、GSG9、UDT出以者で<br>コンセイされたミッシツ専門のアン<br>サツブタイだ。 ▼<br>どいつも戦ソウのプロだ。やつらは<br>まばたきひとつせずに人をころす。<br>同時にあいてにしてはふりだ。 ▼<br>ー人ずつ、かたずけるのがベストだ<br>ぜ・・・OVER ▽ | (starts in the middle of `p49:B11B`) |
| `p49:B137`<br>1 frame later | し以者で<br>コンセイされたミッシツ専門のアン<br>サツブタイだ。 ▼<br>どいつも戦ソウのプロだ。やつらは<br>まばたきひとつせずに人をころす。<br>同時にあいてにしてはふりだ。 ▼<br>ー人ずつ、かたずけるのがベストだ<br>ぜ・・・OVER ▽ | (starts in the middle of `p49:B11B`) |
| `p49:B182`<br>1 frame later | あいてにしてはふりだ。 ▼<br>ー人ずつ、かたずけるのがベストだ<br>ぜ・・・OVER ▽ | (starts in the middle of `p49:B11B`) |
| `p49:B19D`<br>1 frame later | トだ<br>ぜ・・・OVER ▽ | (starts in the middle of `p49:B11B`) |

### Conversation at p48:84ED

**Record 0** (always)

| | Original | Translation |
|---|---|---|
| `p49:BD33` | SNAKE『こちら、SNAKE。<br>チャーリー、オウトウねがいま<br>す？ ▽ | SNAKE: SNAKE here. Charlie, please respond? |
| `p49:BD52`<br>1 frame later | パイロット『こちら、チャーリー。<br>どうぞ、SNAKE・・・ ▽ | PILOT: Charlie here. Go ahead, SNAKE... |
| `p49:BD6C`<br>1 frame later | SNAKE『カートリッジをカイシュウ、キカン<br>する。<br>・・・救出地テンへいそぐ！ ▽ | SNAKE: Cartridge recovered, returning. ...Heading for the rescue point! |
| `p49:BD94`<br>1 frame later | パイロット『ラジャー。救出地テンへむかう。<br>・・・キャクジンは？ ▽ | PILOT: Roger. Heading for the rescue point. ...Any passengers? |
| `p49:BDB4`<br>1 frame later | SNAKE『・・・ひとりだ。<br>・・・ブロンドのビジン ▽ | SNAKE: ...One. ...A blonde beauty. |
| `p49:BDCB`<br>32 frames later | パイロット『たのしみにしている<br>・・・OVER ▽ | PILOT: Looking forward to it... OVER |

### Conversation at p48:82AA

**Record 0** (flags 4E 4F 8F, with all of them set, in zone 12, room 02)

| | Original | Translation |
|---|---|---|
| `p49:B346` | ケスラー『GREY　FOX・・・<br>本名、フランク・イェーガー。もと<br>FOX　HOUND出身。 ▼<br>BIG　BOSS時だいのFOXの<br>ショウゴウをもつさいごの男。<br>クンショウ5カイ・・・ ▽ | KESSLER: GREY FOX... real name Frank Jaeger. Ex FOX HOUND.<br>The last man to hold the title of FOX in BIG BOSS's day. Decorated five times... |
| `p49:B3A4`<br>1 frame later | SNAKE『わかっている・・・やつのユウシュ<br>ウさは。やつのことはコウハイであ<br>るオレがいちばんよくしっている ▼<br>狙ったものはかならずのがさないレ<br>イセイチンチャクなハンターだ。タ<br>イインたちのだれもがそんけいし、<br>したっていた・・・ ▽ | SNAKE: I know... how good he is. As his junior, I know him better than anyone.<br>A cool-headed hunter who never lets his target escape. Every man in the unit respected him and looked up to him... |
| `p49:B416`<br>1 frame later | ケスラー『そうだったな。SNAKE・・・じ<br>ゃ、やつのカコはどうだ？なにかの<br>たしにはなるだろうて・・・ ▼<br>10年前、やつはこの世界でハン<br>ターとよばれていた。イェーガー<br>はドイツごでハンターという意味ら<br>しい。 ▼<br>そのころ、やつは東がわの女とカン<br>ケイがあった。 ▼<br>やつは女の西がわへボウメイ、オー<br>バー・ザ・フェンスをこころみたが<br>けっきょくシッパイにおわった。 ▼<br>西がわは女にキョウミをしめさなか<br>ったらしい。やつはそのことで西が<br>わの上そう部連中をうらんでいたら<br>しい ▽ | KESSLER: That's right, SNAKE... then what about his past? It might be of some use...<br>Ten years ago he was called the Hunter in this world. Jaeger means hunter in German, it seems.<br>Back then he was involved with a woman from the East.<br>He tried to defect with her to the West, over the fence, but it ended in failure.<br>It seems the West wasn't interested in the woman. He held a grudge against the West's top brass for it. |
| `p49:B50F`<br>1 frame later | SNAKE『その女の名は？！ ▽ | SNAKE: That woman's name?! |
| `p49:B51C`<br>1 frame later | ケスラー『オリンピックのスケートセンシュだ<br>った。ナターシャ・マルコヴァとい<br>う・・・ぞくっとするくらい、いい<br>女だったぜ ▽ | KESSLER: She was an Olympic skater. Natasha Markova... a woman so good-looking it gave you shivers. |
| `p49:B558`<br>1 frame later | SNAKE『ナ、ナターシャ<br>・・・マルコ・ヴァ！ ▽ | SNAKE: Na, Natasha... Marko-va! |
| `p49:B56D`<br>1 frame later | ケスラー『SNAKE！もし、おまえがこのF<br>OXにかてたら・・オレはSOLI<br>D　SNAKEを世界ーのヨウヘイ<br>だとセンデンしてやろう！ ▼<br>・・・OVER ▽ | KESSLER: SNAKE! If you beat this FOX... I'll tell the world SOLID SNAKE is the best mercenary there is!<br>...OVER |

**Record 1** (flags 5B 4C 5E 2F A1, with all of them set)

| | Original | Translation |
|---|---|---|
| `p48:9DB3` | キャンベル『SNAKE！アイテムがもえてい<br>る！！すべてのソウビヒン、ブキ<br>をすてろ！時間がないぞ。スペー<br>スキーですてるんだ！ ▽ | CAMPBELL: SNAKE! Your items are burning!! Throw away all your equipment and weapons! There's no time. Throw them away with the space bar! |

**Record 2** (flags 5D 30 5F 49 A1 6F, with all of them set)

| | Original | Translation |
|---|---|---|
| `p48:9F8C` | キャンベル『ナターシャからもらったブローチは<br>おそらくケイジョウキオクゴウキン<br>だ。<br>ブローチのオンドをかえてみろ。 ▽ | CAMPBELL: The brooch Natasha gave you is probably a shape-memory alloy. Try changing the brooch's temperature. |

**Record 3** (flags 60 42 41 11, with all of them set, in zone 13, room 04)

| | Original | Translation |
|---|---|---|
| `p49:B8CF` | 『カード9はプレデターがもってい<br>たはずだ！ ▽ | (no name): Card 9 should have been with Predator! |
| `p49:B8E6`<br>1 frame later | SNAKE『カード8じゃないのか？ヤツはカ<br>ード8をもっていたぞ。 ▽ | SNAKE: Not card 8? He had card 8. |
| `p49:B904`<br>1 frame later | 『いや、カード8と9のリョウホウ<br>をカンリしていたはずだ。 ▼<br>おそらくおとしたにちがいない。<br>ヤツのいたエリアをさがしてみろ<br>！見つかるはずだ。<br>・・・うまくやれよ ▽ | (no name): No, he was in charge of both cards 8 and 9.<br>He must have dropped it. Search the area where he was! You'll find it... good luck. |

**Record 4** (flags 61 3E 62 3F, with all of them set)

| | Original | Translation |
|---|---|---|
| `p49:B957` | 『オレだ・・・ファンのー人だ。<br>SNAKE、気をつけろ。 ▼<br>そのヘヤにあのデンセツのゲリラ<br>ブタイ、ウィスパーズの生きの<br>こり、NIGHT　SIGHTが<br>いる ▽ | (no name): It's me... one of your fans. SNAKE, be careful.<br>In that room is NIGHT SIGHT, survivor of that legendary guerrilla unit, the Whispers. |
| `p49:B9A9`<br>1 frame later | SNAKE『NIGHT　SIGHT・・・ ▽ | SNAKE: NIGHT SIGHT... |
| `p49:B9BA`<br>1 frame later | 『サイシンのカモフラージュ・スーツ<br>をきてステルス。 ▼<br>おまけに全くジュウセイのしないジ<br>ュウ、ウェイ・ション・ショウ・シ<br>ャンでコウゲキしてくる。 ▼<br>ダレもヤツのスガタを見たことがな<br>い。わかるか？この意味が・・・ ▽ | (no name): He wears the latest camouflage suit: stealth.<br>And he attacks with a gun that makes no sound at all, the Wei Xiong Shou Shan.<br>Nobody has ever seen him. Do you understand what that means? |
| `p49:BA29`<br>1 frame later | SNAKE『シンセツなファンをもって<br>コウエイだ ▽ | SNAKE: I'm honoured to have such a kind fan. |
| `p49:BA3D`<br>1 frame later | 『音に注意するんだ。SNAKE！<br>・・・OVER ▽ | (no name): Pay attention to sound, SNAKE! ...OVER |

**Record 5** (flags 92 34 63, with all of them set, in zone 0D, room 05)

| | Original | Translation |
|---|---|---|
| `p48:8B80` | 『オレだ。ファンのー人だ。そこから<br>ダイブできるのは北むきのかぜがふ<br>いたときだけだぜ。 ▼<br>いつもは南むきだがあるシュンカン<br>だけかざむきがかわるんだ。 ▼<br>そのシュンカンをのがすな<br>・・・うまくやれよ ▽ | (no name): It's me. One of your fans. You can only dive from there when the wind blows north.<br>It usually blows south, but just for a moment the wind changes.<br>Don't miss that moment... good luck. |

**Record 6** (flags 64 2B 6D 5C, with all of them set, in zone 0A, room 00)

| | Original | Translation |
|---|---|---|
| `p48:8AFA` | ホーリー『SNAKE、タワービルにパラシュ<br>ートこうかクンレン用のベランダが<br>あったでしょ？ ▼<br>そこからハングライダーがあればク<br>レバスをとびこえられるわ。 ▼<br>ハングライダーはザンジバービルの<br>1Fの東にあるはずよ。 ▼<br>カンシャサイの時に見たことがある<br>の・・・じゃあね ▽ | HOLLY: SNAKE, there was a balcony for parachute training in the Tower Building, wasn't there?<br>From there, with a hang glider, you could fly over the crevasse.<br>The hang glider should be to the east on 1F of the Zanzibar Building.<br>I saw it at the thanksgiving festival... bye. |

**Record 7** (flags 65 1D 9E, with all of them set, in zone 0F, room 00)

| | Original | Translation |
|---|---|---|
| `p48:8D71` | ホーリー『オクジョウへのドアはシン入者をふ<br>せぐためにぬりかためられたらしい<br>わ。 ▼<br>でもオウキュウショチだからP・B<br>でカンタンにハカイできるはずよ<br>・・・じゃあね ▽ | HOLLY: It seems the door to the roof was sealed up to keep intruders out.<br>But it was an emergency job, so you should be able to break it easily with P.B... bye. |

**Record 8** (flags 19 18, with all of them set, in zone 0B, room 05)

| | Original | Translation |
|---|---|---|
| `p48:8859` | ホーリー『SNAKE！わたし・・・<br>ショウタイがばれちゃってつかまっ<br>ちゃったの！！たすけて！ ▼<br>・・・マルフ博士とセッショクがと<br>れたのに ▽ | HOLLY: SNAKE! I... they found out who I am and caught me!! Help!<br>...and I'd made contact with Dr Marv. |
| `p48:889E`<br>1 frame later | SNAKE『どこだ？！・・・場所は？ ▽ | SNAKE: Where?! ...Where are you? |
| `p48:88AF`<br>1 frame later | ホーリー『・・・わからない。目かくしされて<br>たから。タワービルのどこかだとお<br>もうけど・・・そうだわ！ ▽ | HOLLY: ...I don't know. I was blindfolded. I think it's somewhere in the Tower Building... that's it! |
| `p48:88E1`<br>1 frame later | ホーリー『SNAKE！音・・・音がするの。<br>わたしの左から・・・エレベーター<br>の音がする。 ▼<br>それから・・・右からはポンプのよ<br>うな音がきこえるわ。前とうしろか<br>らは水のながれる音がする ▽ | HOLLY: SNAKE! Sounds... I can hear sounds. From my left... the sound of a lift.<br>And from the right... something like a pump. From in front and behind, the sound of running water. |
| `p48:8944`<br>1 frame later | SNAKE『前ごから水の音・・・右からポンプ<br>音・・・左からエレベーター音？<br>音のマップができたな ▽ | SNAKE: Water in front and behind... a pump on the right... a lift on the left? That makes a map of sounds. |
| `p48:897A`<br>1 frame later | ホーリー『SNAKE！かれらわたしのムセン<br>キに気がつかなかったみたい。<br>だけどはやくきてっ！まってるわ ▽ | HOLLY: SNAKE! It seems they didn't notice my radio. But come quickly! I'm waiting. |

**Record 9** (flags 66 67, with all of them set, in zone 09, room 02)

| | Original | Translation |
|---|---|---|
| `p48:9EF4` | キャンベル『おもいきって、ニモツになってみ<br>たらどうだ？<br>トクイのダンボールで。 ▼<br>これよりさきはシュウハスウをヘ<br>ンコウする。 ▼<br>次のシュウハスウはパッケージの<br>ウラのシャシンにのっている。<br>・・・OVER ▽ | CAMPBELL: Why not be bold and turn yourself into a parcel? With your favourite cardboard box.<br>From now on I'm changing the frequency.<br>The next frequency is in the photo on the back of the package... OVER |

**Record 10** (flags 68 13, with all of them set)

| | Original | Translation |
|---|---|---|
| `p48:8CED` | ホーリー『はるばるニホンのオキナワからとり<br>よせたなりこのすならしいわ。 ▼<br>あるくとキュッ、キュッと音がして<br>見つかるわ。注意して<br>・・・じゃあね ▽ | HOLLY: It's singing sand, brought all the way from Okinawa in Japan, it seems.<br>When you walk on it, it squeaks and you're found. Careful... bye. |

**Record 11** (flags 12 58 33, with all of them set, in zone 07, room 0B)

| | Original | Translation |
|---|---|---|
| `p49:B899` | 『SNAKE！そこは危ないぞ！<br>ジライゲンだ ▽ | (no name): SNAKE! It's dangerous there! It's a minefield. |
| `p49:B8B2`<br>1 frame later | SNAKE『あんたは？ ▽ | SNAKE: Who are you? |
| `p49:B8BA`<br>1 frame later | 『ファンのー人さ。<br>・・・うまくやれよ ▽ | (no name): One of your fans... good luck. |

**Record 12** (flags 69 0D 70, with all of them set, in zone 07, room 0C)

| | Original | Translation |
|---|---|---|
| `p48:96B4` | キャンベル『タップ・コードだ。ベトナムのハノ<br>イ・ヒルトン［北ベトナムの収容所<br>］でよくつかわれたツウシン法だ ▼<br>もともとチョウセン戦ソウ中にシヨ<br>ウされていたものだ。トリセツにカ<br>イドク方法がかかれているはずだ。<br>・・・OVER ▽ | CAMPBELL: It's tap code. A way of communicating much used in the Hanoi Hilton [the North Vietnamese prison camp].<br>It was originally used during the Korean War. The manual should explain how to decode it... OVER |

**Record 13** (flags 94 6A 16, with all of them set, in zone 01, room 03)

| | Original | Translation |
|---|---|---|
| `p48:854C` | ホーリー『わたし、ホーリー・・<br>ホーリー・ホワイト。 ▼<br>ジャーナリストとしていっかげつ前<br>からザンジバーランドに潜入してい<br>るの。 ▼<br>だから、ここのだいたいのことなら<br>わかるから・・<br>おやくにたてるとおもうわ。 ▼<br>シュウハスウは140・15よ。<br>連絡して？・・・じゃあね ▽ | HOLLY: I'm Holly... Holly White.<br>I've been undercover in Zanzibar Land as a journalist for a month.<br>So I know most things about this place... I think I can help you.<br>My frequency is 140.15. Call me?... bye. |

**Record 14** (flags 04 6B 6C, with all of them set, in zone 00, room 08)

| | Original | Translation |
|---|---|---|
| `p48:99CD` | キャンベル『ショウメンからの潜入はフカノウだ<br>。ツウフウコウから潜入せよ<br>・・・OVER ▽ | CAMPBELL: Getting in from the front is impossible. Get in through the ventilation duct... OVER |

**Record 15** (flags 6E 02, with all of them set, in zone 00, room 06)

| | Original | Translation |
|---|---|---|
| `p48:97C2` | キャンベル『ホフクゼンシンをユウコウにつかい<br>、フェンスのきれ目から潜入せよ<br>・・・OVER ▽ | CAMPBELL: Make good use of crawling and get in through the gap in the fence... OVER |

### Conversation at p48:850B

**Record 0** (always)

| | Original | Translation |
|---|---|---|
| `p49:BA59` | FOX『SNAKE！ ▽ | FOX: SNAKE! |
| `p49:BA62`<br>1 frame later | FOX『SNAKE！<br>・・オレだ。GREY　FOXだ ▽ | FOX: SNAKE! ...It's me. GREY FOX. |
| `p49:BA7A`<br>1 frame later | SNAKE『FOXっ！ ▽ | SNAKE: FOX! |
| `p49:BA82`<br>1 frame later | FOX『どうやらオレのチュウコクをムダに<br>したらしいな。<br>お前とのユウジョウもこれまでだ ▼<br>その、エレベーターがお前のカンオ<br>ケとなるだろう ▽ | FOX: It seems you wasted my advice. Our friendship ends here.<br>That lift will be your coffin. |
| `p49:BAC7`<br>1 frame later | SNAKE『なにっ！！ ▽ | SNAKE: What!! |
| `p49:BACF`<br>1 frame later | FOX『きこえるだろう？その音・・・<br>みっ室専門のアンサツブタイを<br>おくりこんだ・・・・ ▼<br>せいぜいカンゲイしてやってく<br>れ ▽ | FOX: You can hear it, can't you? That sound... I've sent in the closed-room assassination squad...<br>Give them a warm welcome. |
| `p49:BB0E`<br>1 frame later | SNAKE『テンジョウか？！ ▽ | SNAKE: The ceiling?! |
| `p49:BB19`<br>1 frame later | FOX『SNAKE、わかれのあいさつ<br>が言えてうれしいぜ<br>・・・OVER ▽ | FOX: SNAKE, I'm glad I could say goodbye... OVER |

### Conversation at p48:8498

**Record 0** (always)

| | Original | Translation |
|---|---|---|
| `p49:B957` | 『オレだ・・・ファンのー人だ。<br>SNAKE、気をつけろ。 ▼<br>そのヘヤにあのデンセツのゲリラ<br>ブタイ、ウィスパーズの生きの<br>こり、NIGHT　SIGHTが<br>いる ▽ | (no name): It's me... one of your fans. SNAKE, be careful.<br>In that room is NIGHT SIGHT, survivor of that legendary guerrilla unit, the Whispers. |
| `p49:B9A9`<br>32 frames later | SNAKE『NIGHT　SIGHT・・・ ▽ | SNAKE: NIGHT SIGHT... |
| `p49:B9BA`<br>32 frames later | 『サイシンのカモフラージュ・スーツ<br>をきてステルス。 ▼<br>おまけに全くジュウセイのしないジ<br>ュウ、ウェイ・ション・ショウ・シ<br>ャンでコウゲキしてくる。 ▼<br>ダレもヤツのスガタを見たことがな<br>い。わかるか？この意味が・・・ ▽ | (no name): He wears the latest camouflage suit: stealth.<br>And he attacks with a gun that makes no sound at all, the Wei Xiong Shou Shan.<br>Nobody has ever seen him. Do you understand what that means? |
| `p49:BA29`<br>32 frames later | SNAKE『シンセツなファンをもって<br>コウエイだ ▽ | SNAKE: I'm honoured to have such a kind fan. |
| `p49:BA3D`<br>32 frames later | 『音に注意するんだ。SNAKE！<br>・・・OVER ▽ | (no name): Pay attention to sound, SNAKE! ...OVER |

### Conversation at p48:847A

**Record 0** (always)

| | Original | Translation |
|---|---|---|
| `p49:BB3C` | ホーリー『SNAKE！大へんっ！！ ▽ | HOLLY: SNAKE! Terrible!! |
| `p49:BB5B`<br>32 frames later | SNAKE『どうした！ホーリー？ ▽ | SNAKE: What is it! Holly? |
| `p49:BB67`<br>32 frames later | ホーリー『SNAKE。<br>ペトロビッチのこと・・・・<br>気になったからキョクにしらべても<br>らったの。 ▼<br>OUTER　HEAVENから救出<br>されたあとのカレだけど・・・<br>コウフクではなかったみたい。 ▼<br>西がわではカレのカゲキなキョクロ<br>ンはうけ入れられなかったのよ。 ▼<br>カレはキョウキの学者として学会か<br>らソガイされ、時がたつにつれ・・<br>わすれられた。 ▼<br>カレもそんな学会をよくおもってい<br>なかったらしいの。<br>見かえしてやろうとおもったにちが<br>いないわ。 ▼<br>・・・そんな時、ザンジバーランド<br>からのニジュウスパイのハナシがも<br>ちこまれた。 ▼<br>博士の立場をリヨウして東西のサイ<br>シンカガクをザンジバーランドにな<br>がすというヤク目を・・・ ▽ | HOLLY: SNAKE. About Pettrovich... I was worried so I had my office look into him.<br>After he was rescued from OUTER HEAVEN... it seems he wasn't happy.<br>In the West his extreme theories weren't accepted.<br>He was shunned by the academic world as a mad scientist and, as time went by... forgotten.<br>He seems to have thought little of that academic world too. He must have wanted to show them.<br>...Just then came an offer to be a double agent for Zanzibar Land.<br>The job of using his position as a doctor to pass the latest science of East and West to Zanzibar Land... |
| `p49:BCAD`<br>32 frames later | SNAKE『するとこんどのマルフのイッケンも<br>？ ▽ | SNAKE: So this business with Marv too? |
| `p49:BCC2`<br>32 frames later | ホーリー『そうね、タイミングがよすぎるわ。<br>マルフのショウサイにわたるトベイ<br>スケジュールをペトロビッチがなが<br>していたからにちがいないわ ▽ | HOLLY: Yes, the timing's too good. Pettrovich must have leaked the detailed schedule of Marv's trip to America. |
| `p49:BD04`<br>32 frames later | SNAKE『サイショからペトロビッチはOI<br>LIXをてに入れるためにマルフ<br>にちかづき、ドウコウした ▽ | SNAKE: Pettrovich got close to Marv and travelled with him from the start to get his hands on OILIX. |
<!-- /generado -->
