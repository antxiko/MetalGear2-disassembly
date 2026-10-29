# The texts

Everything you read in the game: the transceiver conversations, the scenes in story order and the signs, each message with its translation; and at the end the font and how they are written.

## The transceiver

![The 12 portraits](imagenes/retratos.png)

### Who answers

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

### The portraits

Above, the twelve the cartridge paints (`tools/retratos.py`): each one is a
mosaic of 4 x 6 characters from `p44:93FD` (`pon_mosaico_de_quien_habla`,
`p03:B814`). Number 0 is Snake, on the left; 1 to 8, whoever answers in
places 0 to 7; 9 and 11 are ナターシャ (identical dot for dot: 11 goes on the
left in a scene) and 10 is BIG BOSS.

### How what they say is chosen

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

### The conversations, whole

By frequency and in the order the records are looked at; after them, the
nine in the `p48` header that have no number (the one at `p48:800E`, with
16 records, is the calls the game makes, `p03:B108`). The texts are as the
game writes them (each line break, the window's): ▼ waits for a key, ▼▼
waits and opens another window, ▽ ends. Beside them, the translation
(`tools/traducciones.py`, made by hand from that text; each window break of
the game is a line break here too). What Marv and Natasha say in Russian is
given in Russian, with its translation in brackets.

<!-- generado:conversaciones -->
#### 140.85

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

#### 140.38

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

#### 140.40

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

#### 140.15

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

#### 140.93

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

#### 140.82

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

#### 140.51

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

#### 140.27

Speaking: -. The conversation at `p48:82A9`, with 0 records.

#### Conversation at p48:8452

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

#### Conversation at p48:8533

**Record 0** (always)

| | Original | Translation |
|---|---|---|
| `p49:BDDF` | SNAKE『なにをもたもたしている！<br>クリスマスがおわってしまうぞっ ▽ | SNAKE: What are you dawdling for! Christmas will be over! |
| `p49:BDFE`<br>1 frame later | パイロット『こちら、チャーリー。<br>救出地テンまで10キロのところま<br>できている。 ▼<br>もうすこしもちこたえてくれっ！<br>OVER・・・ ▽ | PILOT: Charlie here. We're 10 km from the rescue point.<br>Hold on a little longer! OVER... |
| `p49:BE3E`<br>1 frame later | SNAKE『はやく、たのむ！！ ▽ | SNAKE: Quick, please!! |

#### Conversation at p48:8542

**Record 0** (always)

| | Original | Translation |
|---|---|---|
| `p49:BE4A` | SNAKE『チコクだぞ・・・チャーリー！ | SNAKE: You're late... Charlie! |
| `p49:BE5B`<br>160 frames later | パイロット『2人のオジャマをしちゃあわるいか<br>とおもってね | PILOT: I thought I'd better not interrupt you two. |

#### Conversation at p48:84B1

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

#### Conversation at p48:84ED

**Record 0** (always)

| | Original | Translation |
|---|---|---|
| `p49:BD33` | SNAKE『こちら、SNAKE。<br>チャーリー、オウトウねがいま<br>す？ ▽ | SNAKE: SNAKE here. Charlie, please respond? |
| `p49:BD52`<br>1 frame later | パイロット『こちら、チャーリー。<br>どうぞ、SNAKE・・・ ▽ | PILOT: Charlie here. Go ahead, SNAKE... |
| `p49:BD6C`<br>1 frame later | SNAKE『カートリッジをカイシュウ、キカン<br>する。<br>・・・救出地テンへいそぐ！ ▽ | SNAKE: Cartridge recovered, returning. ...Heading for the rescue point! |
| `p49:BD94`<br>1 frame later | パイロット『ラジャー。救出地テンへむかう。<br>・・・キャクジンは？ ▽ | PILOT: Roger. Heading for the rescue point. ...Any passengers? |
| `p49:BDB4`<br>1 frame later | SNAKE『・・・ひとりだ。<br>・・・ブロンドのビジン ▽ | SNAKE: ...One. ...A blonde beauty. |
| `p49:BDCB`<br>32 frames later | パイロット『たのしみにしている<br>・・・OVER ▽ | PILOT: Looking forward to it... OVER |

#### Conversation at p48:82AA

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

#### Conversation at p48:850B

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

#### Conversation at p48:8498

**Record 0** (always)

| | Original | Translation |
|---|---|---|
| `p49:B957` | 『オレだ・・・ファンのー人だ。<br>SNAKE、気をつけろ。 ▼<br>そのヘヤにあのデンセツのゲリラ<br>ブタイ、ウィスパーズの生きの<br>こり、NIGHT　SIGHTが<br>いる ▽ | (no name): It's me... one of your fans. SNAKE, be careful.<br>In that room is NIGHT SIGHT, survivor of that legendary guerrilla unit, the Whispers. |
| `p49:B9A9`<br>32 frames later | SNAKE『NIGHT　SIGHT・・・ ▽ | SNAKE: NIGHT SIGHT... |
| `p49:B9BA`<br>32 frames later | 『サイシンのカモフラージュ・スーツ<br>をきてステルス。 ▼<br>おまけに全くジュウセイのしないジ<br>ュウ、ウェイ・ション・ショウ・シ<br>ャンでコウゲキしてくる。 ▼<br>ダレもヤツのスガタを見たことがな<br>い。わかるか？この意味が・・・ ▽ | (no name): He wears the latest camouflage suit: stealth.<br>And he attacks with a gun that makes no sound at all, the Wei Xiong Shou Shan.<br>Nobody has ever seen him. Do you understand what that means? |
| `p49:BA29`<br>32 frames later | SNAKE『シンセツなファンをもって<br>コウエイだ ▽ | SNAKE: I'm honoured to have such a kind fan. |
| `p49:BA3D`<br>32 frames later | 『音に注意するんだ。SNAKE！<br>・・・OVER ▽ | (no name): Pay attention to sound, SNAKE! ...OVER |

#### Conversation at p48:847A

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

## The scenes

What is said outside the transceiver: the scenes, the warnings and the children. They follow the story: the order of the fights ([The bosses](THE-BOSSES.html)) and, between them, the one the messages themselves tell; the exact moment of each scene is not measured by playing. Next to them, the translation (`tools/traducciones_textos.py`, done by hand; each line break is the game window's).

<!-- generado:escenas -->
### Arriving

| | Original | Translation |
|---|---|---|
| `p48:8018` | SNAKE『こちらSOLID　SNAKE。<br>オウトウねがいます・・・ | SNAKE: This is SOLID SNAKE. Please respond... |

### BLACK COLOR

Where Marv should be, a voice signed «マルフ» laughs at Snake; then BLACK COLOR.

| | Original | Translation |
|---|---|---|
| `p50:87AC` | マルフ『ふふ・・・おろかな、<br>FOX　HOUNDER！ ▼▼<br><br>マルフ『マルフ博士はここにはいないっ！<br>こんな安っぽいハッシンキでだまそ<br>うとはFOX　HOUNDもソウト<br>ウ、ジダイおくれだな ▽ | MARV: Heh heh... fool, FOX HOUNDER!<br>MARV: Dr. Marv is not here! Trying to fool us with a cheap transmitter like that... FOX HOUND is behind the times. |
| `p50:8807` | BLACK『オレはBLACK　COLOR<br>NASAのタイチキュウ外カンキョ<br>ウトクシュブタイ出身。 ▼<br>世界ーのハイテクフセイキ戦ブタイ<br>、FOX　HOUNDとやらのジツ<br>リョクを見せてもらおうか！ ▼<br>こいっ！FOX　HOUNDER ▽ | BLACK: I am BLACK COLOR, from NASA's extraterrestrial environment special forces.<br>Let me see what the world's best high-tech irregular warfare unit, this FOX HOUND, can do!<br>Come on, FOX HOUNDER! |
| `p50:887B` | BLACK『・・・SNAKE ▼▼<br><br>SNAKE『だれだ？・・なぜ、名前を ▼▼<br><br>BLACK『オ、オレだ・・・シュナイダー。<br>カイル・シュナイダーだ。<br>おぼえているか？ ▼▼<br><br>SNAKE『シュナイダー？<br>・・・あのOUTER　HEAVE<br>Nのレジスタンスだった？ ▼<br>しかし、あの時・・・ヤツらにころ<br>されたはず ▼▼<br><br>BLACK『SNAKE、<br>お前もまだあまいな。 ▼<br>オレがころされかけたのはヤツら<br>にではない、お前らとお前らの<br>クニにだ ▼▼<br><br>SNAKE『シュナイダー？イミがわからん ▼▼<br><br>BLACK『・・・SNAKE、お前がメタル・<br>ギアをハカイしたあと、 ▼<br>NATO軍による大キボなOUTE<br>R　HEAVENバクゲキがおこな<br>われた。 ▼<br>レジスタンスであったわれわれも<br>OUTER　HEAVENの女コド<br>モも・・・みんな見すてられた。 ▼<br>カレらはモウカの中でにげまとい<br>・・・のたれ死んでいった ▼▼<br><br>SNAKE『そんな、ばかな・・・ ▼▼<br><br>BLACK『もともとOUTER　HEAVEN<br>のコドモたちは世界カッコクからあ<br>つめられた戦ソウコジやナンミンだ<br>。 ▼<br>ヤツらにとってカレらのようなコド<br>モたちはふれたくはないソンザイだ<br>った・・・ ▼▼<br><br>SNAKE『・・・まさか ▼▼<br><br>BLACK『お前らも同じだ。<br>いずれわすれられる・・・<br>しかし、あの人は・・・ ▼▼<br><br>SNAKE『あ・の・人・・・？ ▼▼<br><br>BLACK『にげまとうわれわれを救ってくれた<br>のは・・・あのお方。 ▼<br>あの人はわれわれのしたことをゆる<br>してくれた上、われわれにあたらし<br>いトチやカゾクをあたえてくれた<br>・・・ ▼▼<br><br>SNAKE『あの人・・・もしや？ ▼▼<br><br>BLACK『SNAKE、今にお前もわかる。<br>あの人のすばらしさが・・・ ▼▼<br><br>BLACK『SNAKE・・・お前にはかりはあ<br>ってこそうらみはない。<br>博士の場所をおしえてやろう。 ▼<br>あの人のイシにさからうことではな<br>い・・・博士のカンキンされている<br>ドクボウのみはりをさがすんだ。 ▼<br>その男をビコウすれば・・・ドクボ<br>ウへたどりつける。 ▼<br>男のトクチョウはグリーンベレーを<br>かぶっている。1Fにいるはずだ。<br>いいか・・グリーンベレーだ。 ▼<br>グリーンベレーの男をビコウしろ！<br> ▽ | BLACK: ...SNAKE<br>SNAKE: Who are you? ...How do you know my name?<br>BLACK: It's, it's me... Schneider. Kyle Schneider. Remember?<br>SNAKE: Schneider? ...The one from the OUTER HEAVEN resistance? But back then... they should have killed you.<br>BLACK: SNAKE, you're still naive. It wasn't them who nearly killed me: it was you and your country.<br>SNAKE: Schneider? I don't understand.<br>BLACK: ...SNAKE, after you destroyed Metal Gear, NATO carried out a massive bombing of OUTER HEAVEN. We of the resistance, and the women and children of OUTER HEAVEN... were all abandoned. They ran about in the flames... and died like dogs.<br>SNAKE: That can't be...<br>BLACK: The children of OUTER HEAVEN were war orphans and refugees gathered from all over the world. For them, children like these were something they'd rather not touch...<br>SNAKE: ...You don't mean...<br>BLACK: You're the same. Sooner or later you'll be forgotten... But that man...<br>SNAKE: That... man...?<br>BLACK: The one who saved us as we fled... was him. He forgave what we had done, and gave us new land and families...<br>SNAKE: That man... could it be?<br>BLACK: SNAKE, you'll understand soon enough. How great he is...<br>BLACK: SNAKE... I owe you a debt, not a grudge. I'll tell you where the doctor is. It doesn't go against his will... Look for the guard of the cell where the doctor is held. Tail that man... and you'll reach the cell. The man wears a green beret. He should be on 1F. Remember... a green beret. Tail the man in the green beret! |

### RUNNING MAN

| | Original | Translation |
|---|---|---|
| `p50:8BDA` | ランニング『ひさしぶりのキャクジンか？<br>・・・いいところに来たぜ。 ▼<br>これからひとっぱしりしようとおも<br>っていたところだ。 ▼<br>オレはRUNNING　MAN<br>世界ーシュン足なヨウヘイだ。<br>オレの足についてこれるかな？ ▼▼<br><br>ランニング『見てろっ！！ | RUNNING: A visitor, after so long? ...You came at the right time. I was just about to go for a run. I'm RUNNING MAN, the fastest mercenary in the world. Can you keep up with me?<br>RUNNING: Watch this!! |
| `p50:8C4E` | ランニング『・・・ハァ・・ハァ・・・どうだ？<br>はやいだろう？<br>そろそろホンバンといこうかっ！ | RUNNING: ...Huff... huff... well? Fast, aren't I? Now let's do it for real! |
| `p50:8C79` | ランニング『きこえるか・・・この音。<br>シンケイガスだ。<br>ガスにおかされる前におれを<br>たおせばお前はたすかる ▼<br>時間のショウブだ・・いくぞっ！ | RUNNING: Hear that... that sound? It's nerve gas. Beat me before the gas gets you and you'll live. It's a race against time... here I come! |
| `p50:8CBF` | ランニング『・・オレの・・オレのはやさをサカ<br>テにとるとは？<br>お前の名は？ ▼▼<br><br>SNAKE『SNAKE・・・<br>SOLID　SNAKE ▼▼<br><br>ランニング『・・・SNAKE？<br>チータがヘビにまけた・・<br>なぜ？ ▼▼<br><br>SNAKE『・・・死にいそいだんだろう？ | RUNNING: ...You... you turned my speed against me? What's your name?<br>SNAKE: SNAKE... SOLID SNAKE<br>RUNNING: ...SNAKE? A cheetah beaten by a snake... why?<br>SNAKE: ...You were in a hurry to die. |

### Holly

| | Original | Translation |
|---|---|---|
| `p51:AAE9` | ホーリー『・・・ごめん。<br>大ジョウブ・・・わ・た・し ▽ | HOLLY: ...Sorry. It's all right... it's m-e. |
| `p51:AB02` | SNAKE『ホーリー！？ ▽ | SNAKE: Holly!? |
| `p51:AB0B` | ホーリー『おどろいた？ ▽ | HOLLY: Surprised? |
| `p51:AB14` | SNAKE『フウーッ・・・命びろいした。<br>で、どうした？・・・こんなところまで？ ▽ | SNAKE: Phew... that saved my life. So, what's up?... Coming all the way here? |
| `p51:AB3A` | ホーリー『ヤクソクしたでしょ？<br>生きていたらいつでも会える ▽ | HOLLY: I promised, didn't I? If we're alive, we can always meet. |
| `p51:AB56` | SNAKE『・・・そうか ▽ | SNAKE: ...I see. |
| `p51:AB5F` | ホーリー『あぁー・・・このセイフク、<br>ムネの所がくるしくて・・・すっとしたわ ▽ | HOLLY: Aah... this uniform is so tight around the chest... what a relief. |
| `p51:AB83` | ホーリー『これ、テキからうばったジュウよ。<br>つかって・・・ ▽ | HOLLY: Here, a gun I took from the enemy. Use it... |
| `p51:AB9D` | SNAKE『たしかに・・・女にはつかいにくいジュウだ。<br>たすかる ▽ | SNAKE: True... a hard gun for a woman to use. Thanks. |
| `p51:ABBA` | ホーリー『・・・みんな、すんだのね。SNAKE？ ▽ | HOLLY: ...It's all over, isn't it, SNAKE? |
| `p51:ABCF` | SNAKE『いや・・・<br>まだやらなければいけないことがある ▽ | SNAKE: No... there's still something I have to do. |
| `p51:ABE8` | ホーリー『・・・ま・さ・か ▽ | HOLLY: ...You d-o-n't... |
| `p51:ABF3` | SNAKE『そうだ・・・ホーリー？ ▽ | SNAKE: That's right... Holly? |
| `p51:AC01` | ホーリー『SNAKE？まさか・・・わたしを？ ▽ | HOLLY: SNAKE? You don't mean... me? |
| `p51:AC15` | SNAKE『・・・フフフ<br>・・・むかえのクルマをよぼうか？ ▽ | SNAKE: ...Heh heh... shall I call you a car? |
| `p51:AC2F` | ホーリー『・・・なんだぁ・・・ジョウダンきつい ▽ | HOLLY: ...Oh, come on... that's a nasty joke. |
| `p51:AC44` | SNAKE『ホーリー、救出地テンまでー気にはしる。<br>・・・ついてこれるか？ ▽ | SNAKE: Holly, we run all the way to the rescue point. ...Can you keep up? |
| `p51:AC6A` | ホーリー『・・・それっ、プロポーズなの？ ▽ | HOLLY: ...Is that a proposal? |
| `p51:AC7C` | SNAKE『そのヨウスだと大ジョウブだな ▽ | SNAKE: If you can say that, you're fine. |
| `p51:AC8D` | ホーリー『たすかったわ、SNAKE ▽ | HOLLY: You saved me, SNAKE. |
| `p51:AC9C` | SNAKE『・・・・ ▽ | SNAKE: .... |
| `p51:ACA3` | ホーリー『どうしたの？ ▽ | HOLLY: What's the matter? |
| `p51:ACAB` | SNAKE『いや、キミがこんなにビジンだとは・・・ ▽ | SNAKE: Nothing, I just didn't think you'd be such a beauty... |
| `p51:ACC0` | ホーリー『まぁ、イメージがちがって？ ▽ | HOLLY: Oh, not what you imagined? |
| `p51:ACCF` | SNAKE『もっとはやくゴウリュウすればよかった ▽ | SNAKE: I should have joined up with you sooner. |
| `p51:ACE4` | ホーリー『SNAKE、マルフ博士のことだけど・・・<br>ブジらしいわ ▽ | HOLLY: SNAKE, about Dr. Marv... it seems he's all right. |
| `p51:AD03` | SNAKE『らしい？<br>セッショクがとれたって・・・ ▽ | SNAKE: It seems? You made contact... |
| `p51:AD19` | ホーリー『あったわけじゃないのよ。<br>・・・カレどこかにカンキンされてるんだけど<br>・・・デンショバトをとばしたらしいの。<br>なにかてがかりがかかれているはずよ ▽ | HOLLY: Not that I've met him. ...He's held somewhere... but it seems he let a carrier pigeon fly. It must carry some clue. |
| `p51:AD63` | SNAKE『ハト？・・・今どこに？ ▽ | SNAKE: A pigeon? ...Where is it now? |
| `p51:AD72` | ホーリー『それが見つけたんだけどもうちょっとのところ<br>でにげられちゃって・・・<br>タワービルのエレベーターこうをのぼっていっ<br>たわ ▽ | HOLLY: I found it, but it got away from me just at the last moment... it flew up the lift shaft of the tower building. |
| `p51:ADB0` | SNAKE『オクジョウか？！ ▽ | SNAKE: To the roof?! |
| `p51:ADBB` | ホーリー『ここの連中もヒッシになってさがしているわ。<br>カレらよりはやくつかまえないと、マルフ博士<br>のユイイツのてがかりよ ▽ | HOLLY: The people here are looking for it desperately too. We have to catch it before them; it's Dr. Marv's only clue. |
| `p51:ADF8` | SNAKE『ハトさがしか？・・・キミはどうする？ ▽ | SNAKE: Hunting pigeons? ...What will you do? |
| `p51:AE0C` | ホーリー『わたし、足でまといになるわ。<br>もうすこしジョウホウをあつめたいしね。<br>ヒョウカ下がってるのよ。ここんとこ・・・<br>それに、こんな目にあったんですもの。 ▼<br>このままではおさまらないわ！ ▽ | HOLLY: I'd only get in your way. And I want to gather a bit more information. My ratings have been falling lately... Besides, after what they did to me... I can't leave it like this! |
| `p51:AE6A` | SNAKE『こころづよいな・・・ムリはするなよ ▽ | SNAKE: That's reassuring... don't overdo it. |
| `p51:AE7D` | ホーリー『トウチョウされるといけないからシュウハスウ<br>かえるわね。<br>140・76ね。SNAKE ▽ | HOLLY: I'll change frequency in case they listen in. It's 140.76, SNAKE. |
| `p51:AEA9` | ホーリー『それから、カードをコピーしておいたわ。<br>カード4、つかって・・・ ▽ | HOLLY: And I copied a card. Card 4, use it... |
| `p51:AECB` | ホーリー『じゃあね、SNAKE・・・またあとで ▽ | HOLLY: Bye, SNAKE... see you later. |
| `p51:AEDF` | SNAKE『ホーリー！ ▽ | SNAKE: Holly! |
| `p51:AEE7` | ホーリー『えっ？・・・ ▽ | HOLLY: Hm?... |
| `p51:AEF0` | SNAKE『今のは、恋人同士のわかれのコトバだ ▽ | SNAKE: That's how lovers say goodbye. |
| `p51:AF08` | ホーリー『・・・じゃあ、私たちは？<br>・・・なんて言うの？ ▽ | HOLLY: ...Then, what do we... say? |
| `p51:AF23` | SNAKE『いきていればいつでもあえる・・・ ▽ | SNAKE: If we're alive, we can always meet... |
| `p51:AF36` | ホーリー『・・・・わかったわ ▽ | HOLLY: ....All right. |

### Marv's pigeon

| | Original | Translation |
|---|---|---|
| `p50:871F` | SNAKE『ん？・・・<br>ハトの足にカミがしばってあるぞ ▼<br>HELP！　WIS、0HI0<br>KIO　MARV・・・ ▼<br>Hだけが小文じ？<br>マルフ博士のでん言なのか？<br>なんの意味だろうか？ | SNAKE: Hm?... There's a paper tied to the pigeon's leg. HELP! WIS, 0HI0 KIO MARV... Only the H in small letters? Is it a message from Dr. Marv? What can it mean? |

### RED BLASTER

| | Original | Translation |
|---|---|---|
| `p50:8D27` | SNAKE『こ、これは？<br>・・・ブービー・トラップ？ ▼▼<br><br>RED『その通りだ。<br>キツネを生けどるトラップさ。<br>FOX　HOUNDER！ | SNAKE: Wh-what's this? ...A booby trap?<br>RED: That's right. A trap to catch a fox alive. FOX HOUNDER! |
| `p50:8D64` | RED『おれはRED　BLASTER<br>これで動けまい。おれのグレネード<br>でゆっくりリョウリしてやろう | RED: I'm RED BLASTER. Now you can't move. I'll cook you slowly with my grenades. |

### ULTRABOX

| | Original | Translation |
|---|---|---|
| `p50:8DE4` | BOX『おれたちはみっ室専門のアンサ<br>ツブタイULTRABOX<br>だ。 ▼<br>大トウリョウおかかえのゴクヒ<br>チームだ。 ▼<br>おれたちにリョウリされること<br>をホコリにおもえ | BOX: We are ULTRABOX, the assassination squad specialised in closed rooms.<br>The top-secret team of the Supreme Leader himself.<br>Be proud to be cooked by us. |

### PREDATOR

| | Original | Translation |
|---|---|---|
| `p50:8D95` | プレデター『まってたぞ。SNAKE！<br>おれはPREDATOR。<br>ジャングル内でのアンブッシュでは<br>おれの右にでるものはいない。 ▼<br>本物のヘビかどうかためしてやる | PREDATOR: I've been waiting, SNAKE! I'm PREDATOR. Nobody beats me at ambushes in the jungle.<br>Let's see if you're a real snake. |

### Natasha

| | Original | Translation |
|---|---|---|
| `p51:A878` | SNAKE『ナターシャ？ ▽ | SNAKE: Natasha? |
| `p51:A881` | ナターシャ『・・・そうよ、私・・・<br>STBキョクインのナターシャ・マルコヴァ ▽ | NATASHA: ...That's right, I'm... Natasha Markova, STB agent. |
| `p51:A8A5` | ナターシャ『SOLID　SNAKEね・・・<br>おたがいおうものは同じ。キョウリョクして<br>マルフ博士をたすけましょう ▽ | NATASHA: SOLID SNAKE, isn't it... we're after the same thing. Let's work together and rescue Dr. Marv. |
| `p51:A8DD` | SNAKE『・・・どこかであったことがある？ ▽ | SNAKE: ...Have we met somewhere? |
| `p51:A8F0` | ナターシャ『それっ？西がわの男たちのダイヒョウ的な<br>くどきモンクでしょ ▽ | NATASHA: That? The typical chat-up line of Western men, isn't it? |
| `p51:A913` | SNAKE『そうだっ！・・・おもいだしたぞ。<br>ナターシャ・マルコヴァ、氷のヨウセイ・・・<br>カルガリー・オリンピックのゴールドメダリス<br>ト ▽ | SNAKE: That's it!... I remember. Natasha Markova, the ice fairy... the gold medallist of the Calgary Olympics. |
| `p51:A955` | ナターシャ『・・・人ちがいだわ ▽ | NATASHA: ...You've got the wrong person. |
| `p51:A962` | SNAKE『そんなはずはない。たしかに・・・ ▽ | SNAKE: It can't be. I'm sure... |
| `p51:A975` | ナターシャ『そんなことより、マルフ博士は？ ▽ | NATASHA: Never mind that, what about Dr. Marv? |
| `p51:A989` | SNAKE『ムセンキでコンタクトしたんだが・・・<br>コトバが通じない ▽ | SNAKE: I contacted him by radio... but we couldn't understand each other. |
| `p51:A9A8` | ナターシャ『ブジなのね・・・よかった。<br>コガタムセンキのうめこみシュジュツをして<br>おいてよかったわ。<br>SNAKE、ムセンキかして・・・ ▽ | NATASHA: So he's all right... good. I'm glad we had a small radio implanted in him. SNAKE, lend me the radio... |
| `p51:A9E8` | SNAKE『シュウハスウは140・51だ ▽ | SNAKE: The frequency is 140.51. |
| `p51:A9F9` | ナターシャ『SNAKE、今のところマルフはブジよ。<br>タワービルの北に大きなクレバスがあるんだけ<br>ど・・・そのさきの収容所にいるらしいわ。 ▼<br>マルフ博士はペトロヴィッチ博士のことを<br>シンパイしていたわ ▽ | NATASHA: SNAKE, Marv is all right for now. North of the tower building there's a big crevasse... he seems to be in the prison camp beyond it. Dr. Marv was worried about Dr. Pettrovich. |
| `p51:AA62` | SNAKE『ペトロヴィッチはブジだ。シンパイない。<br>さきにマルフを救出する。・・・いいな ▽ | SNAKE: Pettrovich is all right. Don't worry. We rescue Marv first... all right? |
| `p51:AA8D` | ナターシャ『クレバスへならチカミチがあるわ。<br>この下にふるい地下水道があるの。<br>そのエレベーターでおりれるわ・・・<br>いきましょう ▽ | NATASHA: There's a shortcut to the crevasse. Down below there's an old sewer. We can go down in that lift... let's go. |
| `p51:AACF` | SNAKE『ヒューッ！こんなところに・・・<br>エレベーターが ▽ | SNAKE: Whew! In a place like this... a lift. |

### Pettrovich in the lift

| | Original | Translation |
|---|---|---|
| `p51:A765` | ペトロ『おう！・・・ナターシャ、<br>SNAKE！ ▽ | PETRO: Oh!... Natasha, SNAKE! |
| `p51:A77B` | ナターシャ『よくゴブジで・・・ ▽ | NATASHA: You're safe... |
| `p51:A787` | SNAKE『・・・すこしやせたな<br>・・・ペトロヴィッチ ▽ | SNAKE: ...You've lost a bit of weight... Pettrovich. |
| `p51:A79F` | ペトロ『きみはかわらんな、SNAKE ▽ | PETRO: You haven't changed, SNAKE. |
| `p51:A7B0` | ナターシャ『SNAKE、いそぎましょう！<br>マルフ博士のところへ ▽ | NATASHA: SNAKE, let's hurry! To Dr. Marv. |
| `p51:A7CE` | ペトロ『なにっ、マルフはブジか。 ▼<br>わしもここからなんとかダッシュツ<br>しようとしたんじゃがこのエレベー<br>ターは内がわからひらかんのじゃ ▽ | PETRO: What, Marv is safe? I tried to escape from here somehow, but this lift doesn't open from the inside. |
| `p51:A810` | SNAKE『ナターシャ、3人でいちれつになっ<br>てすすもう！ ▽ | SNAKE: Natasha, let's go on, the three of us in a line! |
| `p51:A82B` | ペトロ『まってくれ！SNAKE、<br>あんたにわたすもんがある ▽ | PETRO: Wait! SNAKE, I have something to give you. |
| `p51:A847` | ペトロ『ミハリからくすねておいたんじゃ<br>・・・カード5 ▽ | PETRO: I pinched it from the guard... card 5. |
| `p51:A861` | ナターシャ『あなたのあとについていくわ、<br>SNAKE ▽ | NATASHA: I'll follow you, SNAKE. |

### The sewers

| | Original | Translation |
|---|---|---|
| `p51:A2AB` | ペトロ『おーい！SNAKE<br>・・・もうだめじゃ！<br>すこしやすませてくれ ▽ | PETRO: Hey! SNAKE... I can't go on! Let me rest a bit. |
| `p51:A2CD` | ナターシャ『SNAKE・・・？ ▽ | NATASHA: SNAKE...? |
| `p51:A2D9` | SNAKE『わかった・・・<br>すこしキュウケイしようか ▽ | SNAKE: All right... let's take a short break. |
| `p51:A2F0` | ペトロ『わしは・・・<br>ちょっと用を足してくる ▽ | PETRO: I'll... just go and relieve myself. |
| `p51:A307` | ナターシャ『・・・おかしいわね ▽ | NATASHA: ...It's funny. |
| `p51:A313` | SNAKE『シカタない、<br>ペトロヴィッチはああ見えても年だ ▽ | SNAKE: Can't be helped, Pettrovich is old, though he doesn't look it. |
| `p51:A32F` | ナターシャ『ちがうわよ。わたしたち・・・<br>世界的なテンサイ学者、もとオリンピックセ<br>ンシュ、もとトクシュブタイタイインがこん<br>な下水道で・・・ ▽ | NATASHA: That's not what I mean. Us... a world-famous genius scientist, a former Olympic athlete, a former special forces man, in a sewer like this... |
| `p51:A37B` | SNAKE『・・・ウンメイさ ▽ | SNAKE: ...It's fate. |
| `p51:A386` | ナターシャ『ウンメイ？そうね、そうかもしれないわ・・・<br>わたしね、コドモのころ・・<br>よくきかされたの。 ▼<br>わたしのハハに・・・だい2次世界大戦中のポ<br>ーランド、ワルシャワほうきのハナシ。<br>わたしのハハは地下水道をナンニチもはしって<br>ナチスのてからにげのびたの。 ▼<br>ドロまみれになって・・真っクロになって・・<br>カオも見わけがつかないくらいにね。<br>・・・オヤコね。わたしもハハも・・・<br>戦そうにとりつかれているのよ。きっと ▽ | NATASHA: Fate? Yes, maybe so... When I was a child... I was often told a story. By my mother... about Poland in the Second World War, the Warsaw uprising. My mother ran through the sewers for days and escaped from the Nazis. Covered in mud... black all over... you couldn't even recognise her face. ...Like mother, like daughter. My mother and I... are both possessed by war. Surely. |
| `p51:A45F` | SNAKE『・・・ナターシャ。スケートをやめてどうして<br>STBなんかに？<br>いくら東がわでもオリンピックセンシュともな<br>るとタイグウがいいんじゃないのか ▽ | SNAKE: ...Natasha. Why did you give up skating and join the STB? Even in the East, an Olympic athlete gets good treatment, doesn't she? |
| `p51:A4A8` | ナターシャ『・・・そうでもないわ。<br>なんていうか・・・そう、氷が・・氷が冷たく<br>かんじたから ▽ | NATASHA: ...Not really. How shall I put it... yes, the ice... because the ice felt cold. |
| `p51:A4D6` | SNAKE『氷・・・？ ▽ | SNAKE: The ice...? |
| `p51:A4DF` | ナターシャ『SNAKE、おくさんはいるの？ ▽ | NATASHA: SNAKE, are you married? |
| `p51:A4F1` | SNAKE『・・・いや、カゾクはいない。キミは？ ▽ | SNAKE: ...No, I have no family. And you? |
| `p51:A506` | ナターシャ『ひとりよ・・・べつにドクシンシュギシャ<br>でもないわ。チャンスがなかったのかしら ▽ | NATASHA: Alone... not that I'm against marriage. I suppose I never had the chance. |
| `p51:A530` | SNAKE『恋人は？ ▽ | SNAKE: A lover? |
| `p51:A539` | ナターシャ『・・・いちどだけ、<br>いちどだけケッコンをかんがえたことがあった<br>。わたしがまだ氷の上をはしっていたころ。 ▼<br>今でもくるしくなるような大恋あいだった・・<br>フランク・ハンターっていう西がわの男。<br>ハンサムでシンシで・・・インテリで。<br>でもいつもなにかにおびえていた。 ▼<br>わたし、カゾクもスケートもなにもかもすてて<br>・・・どこまでもおいかけていきたかった ▽ | NATASHA: ...Just once, just once I thought about marrying. When I was still racing on the ice. It was a great love that still hurts... a Western man called Frank Hunter. Handsome, a gentleman... an intellectual. But he was always afraid of something. I wanted to leave my family, skating, everything... and follow him anywhere. |
| `p51:A5EF` | SNAKE『ボウメイを？ ▽ | SNAKE: Defect? |
| `p51:A5F8` | ナターシャ『そう・・・でもだめだった。<br>西がわはわたしのうけ入れをサイゴになって<br>キョヒしたの。<br>よくわからないけど、政治的なリユウで・・ ▽ | NATASHA: Yes... but it didn't work. The West refused to take me in at the last moment. I don't really know why, for political reasons... |
| `p51:A63F` | SNAKE『レセプション・コミュニティーがととのってい<br>なかったんだ。よくあることだ ▽ | SNAKE: The reception community wasn't ready. It happens a lot. |
| `p51:A666` | ナターシャ『それ以来、わたしやカゾクはひどいセイカツを<br>・・・わたしたちはセンシュケンをうばわれ、<br>リフューズニクにされ・・・<br>STBに入るしかなかったのよ。 ▼<br>でも、コウカイはしてないわ。<br>以前の氷の上しかしらなかったわたしとちがっ<br>て今ではいろんな事をしったわ。<br>・・・人もころした ▽ | NATASHA: Since then my family and I have had a terrible life... they took away our right to compete, made us refuseniks... I had no choice but to join the STB. But I don't regret it. Unlike before, when all I knew was the ice, now I've learned many things. ...I've even killed people. |
| `p51:A6FB` | SNAKE『カレには・・・それ以来？ ▽ | SNAKE: And him... since then? |
| `p51:A70C` | ナターシャ『会ってないわ。・・・わたしたちの中のベルリ<br>ンのカべはいつまでものこっていたのね。 ▽ | NATASHA: I haven't seen him. ...The Berlin Wall inside us stayed up for ever. |
| `p51:A73A` | ペトロ『おーい！！おまたせ ▽ | PETRO: Hey!! Sorry to keep you waiting. |
| `p51:A746` | SNAKE『・・・ながいトイレだ ▽ | SNAKE: ...A long time in the toilet. |
| `p51:A753` | ナターシャ『・・・いきましょう。SNAKE ▽ | NATASHA: ...Let's go, SNAKE. |

### The bridge

| | Original | Translation |
|---|---|---|
| `p50:9FA9` | SNAKE『ハシだっ！！ ▽ | SNAKE: A bridge!! |
| `p50:9FB2` | ナターシャ『ー人ずつしかわたれないわ ▽ | NATASHA: Only one at a time can cross. |
| `p50:9FC2` | ペトロ『わしからいこう。オイサキみじかい<br>もの、どうなってもダレもかなしま<br>んわい ▽ | PETRO: I'll go first. I haven't long to live; nobody will be sad whatever happens to me. |
| `p50:9FEA` | ペトロ『大ジョウブじゃ！わたってこい ▽ | PETRO: It's fine! Come across. |
| `p50:9FFC` | ナターシャ『じゃ、次はわたしね・・・<br>おさきに、SNAKE ▽ | NATASHA: Then I'm next... after you, SNAKE. |
| `p51:A017` | ナターシャ『大ジョウブみたいよ。SNAKE、<br>はやくわたってきて！ ▽ | NATASHA: It seems fine. SNAKE, come across quickly! |
| `p51:A036` | SNAKE『ナターシャっ！！ ▽ | SNAKE: Natasha!! |
| `p51:A041` | SNAKE『・・・ナ、ナターシャ ▽ | SNAKE: ...N-Natasha |
| `p51:A04E` | ナターシャ『・・・あ、わたし ▽ | NATASHA: ...Oh, me... |
| `p51:A059` | ナターシャ『わたし、やっぱり・・・<br>氷の上しかあるけなかったみたい。 ▼<br>すべることばかりで・・・<br>リョウアシで、ちゃんとリョウアシでジメンを<br>ふみしめてあるくことをしなかったわ・・・<br> ▽ | NATASHA: I... it seems I could only walk on ice after all. Always sliding... I never walked with both feet, both feet firmly on the ground... |
| `p51:A0B3` | SNAKE『東西の氷はとけはじめているんだ。<br>ナターシャ？<br>こんどこそジメンの上をしっかりと・・<br>自分の人生の上をふみしめて味わう時だ。 ▼<br>ナターシャ？<br>まだだ、まだだ・・・ ▽ | SNAKE: The ice between East and West is starting to melt. Natasha? Now is the time to walk firmly on the ground... to tread on your own life and enjoy it. Natasha? Not yet, not yet... |
| `p51:A111` | ナターシャ『もういいのよ・・・わたし、なん人もの死を見<br>てきているわ。<br>自分がどんなジョウタイか・・・わかる。 ▼<br>・・・ザンネンだわ。<br>またいい人にめぐりあえたのに ▽ | NATASHA: It's all right... I've seen many people die. I know... what state I'm in. ...What a pity. Just when I'd met a good man again. |
| `p51:A165` | SNAKE『キミのスケートをもういちど、見たかった ▽ | SNAKE: I wanted to see you skate once more. |
| `p51:A17C` | ナターシャ『あ、ありがとう・・・<br>これ・・ドアをあけるカード6よ。それから<br>・・・ブローチ、つかい方は・・・ ▽ | NATASHA: Th-thank you... this... is card 6, it opens doors. And... the brooch, how to use it is... |
| `p51:A1B0` | SNAKE『つかい方は？ ▽ | SNAKE: How to use it? |
| `p51:A1BA` | ナターシャ『・・・あ、もうだめ ▽ | NATASHA: ...Oh, I can't... |
| `p51:A1C6` | ナターシャ『・・・フランク・・・ | NATASHA: ...Frank... |
| `p51:A1D3` | ペトロ『SNAKE！！ ▽ | PETRO: SNAKE!! |
| `p51:A1DD` | SNAKE『・・・・メタル・・ギア？ ▽ | SNAKE: ....Metal... Gear? |
| `p51:A1EC` | FOX『SNAKEっ！！オレだ。<br>・・・・GREY　FOXだ！ ▽ | FOX: SNAKE!! It's me. ....GREY FOX! |
| `p51:A20A` | SNAKE『GREY・・　FOX・・・・ ▽ | SNAKE: GREY... FOX.... |
| `p51:A21B` | FOX『きさまにこのハシはわたらせん！！<br>ペトロビッチは連れていく。 ▼<br>どうだ、SNAKE？ムカシのよしみだ。<br>ここは見のがしてやってもいい。<br>さっさとここから立ちされっ！<br>いいか・・いますぐに・・くにへかえれ！ ▼<br>わかったな・・・ハハハァ・・・ ▽ | FOX: I won't let you cross this bridge!! I'm taking Pettrovich. How about it, SNAKE? For old times' sake, I can let you go. Get out of here now! Listen... right now... go home! Understood... hahaha... |
| `p51:A295` | SNAKE『FOX！・・・・オレはあきらめんぞっ！ ▽ | SNAKE: FOX!.... I won't give up! |

### Marv and Pettrovich

| | Original | Translation |
|---|---|---|
| `p50:8E35` | ペトロ『あっ！・・・SNAKE。<br>ておくれじゃ・・・たった今、イキ<br>をひきとったよ。 ▼<br>シンゾウがもたんかったんじゃ | PETRO: Ah!... SNAKE. Too late... he has just breathed his last.<br>His heart couldn't take it. |
| `p50:8E6D` | SNAKE『ん？クビスジにアザが？ ▼▼<br><br>ペトロ『シンパイせんでもいい、SNAKE<br>マルフが死んでもOILIXの<br>セッケイズは大ジョウブじゃ。 ▼<br>マルフは用心ぶかい男、マンイチ<br>の時のためにセッケイズをのこしと<br>る。 ▼<br>ヤツはゲーム・マニアとしても有名<br>じゃった。<br>西がわからマイツキ、コジンユニュ<br>ウしとったホドじゃ。 ▼<br>ヤツはスウジツ前、ゲームのカート<br>リッジのキバンにマイクロフィルム<br>をかくしたらしい。 ▼<br>コナミというニホンのゲームメーカ<br>ーのMSXカートリッジらしい ▼▼<br><br>SNAKE『MSXといえば世界ーのハードすう<br>をほこるパソコン・ハードじゃない<br>か ▼▼<br><br>ペトロ『そのカートリッジをそこのロッカー<br>にしまったらしいのじゃ ▼▼<br><br>SNAKE『カギは？ ▼▼<br><br>ペトロ『ない・・・ロをわらなかった。<br>いや・・・なにもきいておらん！ | SNAKE: Hm? A bruise on his neck?<br>PETRO: Don't worry, SNAKE: even with Marv dead, the OILIX blueprints are safe. Marv was a careful man; he left the blueprints just in case. He was also known as a game maniac; he imported games privately from the West every month. A few days ago he hid a microfilm in the board of a game cartridge. An MSX cartridge from a Japanese game maker called Konami, it seems.<br>SNAKE: The MSX... isn't that the computer with the most machines in the world?<br>PETRO: He put that cartridge away in that locker, it seems.<br>SNAKE: And the key?<br>PETRO: There's none... he wouldn't talk. No... I heard nothing! |
| `p50:8FC4` | ペトロ『そんなところかのう。SNAKE ▼▼<br><br>ペトロ『わしは・・・きみらの世界にわしの<br>すべてをかけていたんじゃ。<br>そのためにすみなれたクニをすて ▼<br>じゃがきみらはわしをバトウし、こ<br>とごとくヒナンした。 ▼<br>わしは・・・METAL　GEAR<br>をカンセイさせたかったのじゃ！ ▼<br>わしのロボットロジーのすべてをこ<br>いつに。 ▼<br>じゃがきみらの政治かたちはSDI<br>やNEDW、ブレインボムなんぞに<br>しかキョウミをしめさなかった！ ▼<br>わしは東西のカガクジョウホウをな<br>がしながら・・・ ▼<br>METAL　GEARのカイリョウ<br>をつづけた。ザンジバーランドのエ<br>ンジョをうけながら ▼▼<br><br>SNAKE『ペトロビッチ。<br>お前がマルフ博士を？ ▼▼<br><br>ペトロ『そうじゃ。どうしてもOILIXの<br>セッケイズをわたそうとせんからじ<br>ゃ！ ▼<br>ナターシャがハシで死んだのも・・<br>わしが地下水道でFOXに連絡した<br>からじゃ ▼▼<br><br>SNAKE『あの時のトイレ！・・・ ▼▼<br><br>ペトロ『SNAKE。マルフから、いやナタ<br>ーシャからあずかったマルフのロッ<br>カーのカギをわたせ！！ | PETRO: Something like that, SNAKE.<br>PETRO: I... I staked everything I had on your world. For it I left the country I had lived in. But you insulted me and condemned everything I did. I... I wanted to finish METAL GEAR! All my robotology in it. But your politicians only cared about SDI, NEDW and brain bombs! While leaking scientific information to East and West... I went on improving METAL GEAR, with the backing of Zanzibar Land.<br>SNAKE: Pettrovich. You killed Dr. Marv?<br>PETRO: Yes. Because he would not hand over the OILIX blueprints! Natasha died on the bridge too... because I told FOX from the sewers.<br>SNAKE: That time in the toilet!...<br>PETRO: SNAKE. Give me the key to Marv's locker that Natasha gave you!! |
| `p50:9182` | ペトロ『ス、スネーク・・・・ ▼▼<br><br>ペトロ『SNAKE・・ヤツがこのままお前<br>を見のがすはずはない。 ▼<br>あれを・・METALをつかうはず<br>じゃ。 ▼<br>ム、ムスメのエレンへの・・・<br>プレゼントじゃ。 ▼<br>あれのハカイ方法を・・おしえてや<br>る ▼▼<br><br>SNAKE『シンガタMETAL　GEARのハ<br>カイ方法だな？ ▼▼<br><br>ペトロ『わしは心の中の東西のカベをこえる<br>ことはできんかった・・・ ▼<br>じゃが、ムスメはちがう。<br>東がわにのこしてきたエレンのため<br>に・・・SNAKE ▼▼<br><br>SNAKE『METAL　GEARのハカイ方法<br>は？ ▼▼<br><br>ペトロ『ソウコウのうすいキャクブにグレネ<br>ードを・・・<br>これ以外の方法ではハカイできん。<br>足に・・・グレネードを。 ▽ | PETRO: S-Snake...<br>PETRO: SNAKE... he won't let you get away like this. He'll use it... METAL.<br>A present... for my daughter Ellen...<br>I'll tell you... how to destroy it.<br>SNAKE: How to destroy the new METAL GEAR?<br>PETRO: I couldn't get over the wall between East and West in my heart... But my daughter is different. For Ellen, whom I left in the East... SNAKE<br>SNAKE: How do I destroy METAL GEAR?<br>PETRO: Grenades on its thinly armoured legs... There is no other way to destroy it. On the legs... grenades. |

### METAL GEAR and GREY FOX

| | Original | Translation |
|---|---|---|
| `p50:979A` | FOX『SNAKE！このMETAL　GE<br>ARにハカイ方法なぞないわ。<br>おいぼれ学者のひとりよがりだ！ ▼▼<br><br>SNAKE『FOXか？・・・どこにいる？ ▼▼<br><br>FOX『すぐ会えるさ、SNAKE。<br>ショウメンのドアを通ってこい！ | FOX: SNAKE! There's no way to destroy this METAL GEAR. That's the old scientist's conceit!<br>SNAKE: FOX? ...Where are you?<br>FOX: You'll see me soon, SNAKE. Come through the door in front! |
| `p50:9802` | FOX『SNAKE！<br>オレも・・このMETAL　GEA<br>Rもムカシとはちがう。 ▼<br>本物のキョウフとハイボクカンを味<br>あわせてやる！ | FOX: SNAKE! I... and this METAL GEAR are not what we were. I'll make you taste real fear and defeat! |
| `p50:9C93` | FOX『SNAKE！<br>カートリッジはもらっていくぞ、<br>・・・やけ死ぬがいい！ | FOX: SNAKE! I'll take the cartridge... burn to death! |
| `p50:9844` | SNAKE『ここは？ ▼▼<br><br>FOX『ケッチャクをつけるにはサイコウの<br>リングじゃないか | SNAKE: Where's this?<br>FOX: The best ring to settle things, isn't it? |
| `p50:9866` | FOX『SNAKE。ひさしぶりだな・・・<br>このジライゲンの中で・・・スデで<br>どうだ？ ▼▼<br><br>SNAKE『チキン・ファイトか ▼▼<br><br>FOX『FOX　HOUNDサイコウのライ<br>バル。オレはおまえとやれる時を心<br>まちにしていた！ ▼▼<br><br>SNAKE『FOX！キサマのくさりきったショ<br>ウネをたたききなおしてやるっ！ ▼▼<br><br>FOX『SNAKE！<br>FOXのショウゴウのとうとさをお<br>もいしれ！ ▽ | FOX: SNAKE. It's been a while... in this minefield... bare-handed, how about it?<br>SNAKE: A chicken fight, eh?<br>FOX: The best rival in FOX HOUND. I've been longing for the moment I could fight you!<br>SNAKE: FOX! I'll beat that rotten nature out of you!<br>FOX: SNAKE! Learn how much the FOX title is worth! |
| `p50:990C` | FOX『SNAKE・・・<br>どうやらFOXのショウゴウをゆずる時がきた<br>らしいな ▼▼<br><br>SNAKE『FOX・・・なぜだ？ ▼▼<br><br>FOX『オレは・・お前とちがって、フクザツな立場に<br>ある。 ▼<br>BIG　BOSSはお前にとってはたんなるジ<br>ョウカンにすぎなかつたかもしれんが。<br>オレはカレに2ド、命を救われた。<br>ブタイに入るずっと以前のことだ。 ▼<br>オレはベトナムでの2世だった・・・<br>当時、ハク人との2世はシュウ戦ゴもハクガイ<br>されキョウセイロウドウをしいられていたの<br>だ。 ▼<br>あの人はあのジゴクからオレを救ってくれた。<br>ここの子供たちのように・・・ ▼<br>2ド目はモザンビーク。<br>レモナ兵としてゴウモンされていたところをた<br>すけられた。その時、オレはみみもはなもそが<br>れ・・・ひどいジョウタイだった ▼▼<br><br>SNAKE『オンガエシのつもりか！！これが・・・ ▼▼<br><br>FOX『そうではない。オレは戦ソウがにくい。<br>ここのこどもたちのように。<br>だが・・・オレには戦ソウがヒツヨウだ。 ▼<br>オレたちのような戦ソウやはイッパン社会では<br>生きてはいけない。オレたち、戦ソウやには戦<br>場がヒツヨウなんだ。 ▼<br>BOSSはオレたちにたたかう場をあたえてく<br>れる。もって生まれたトウソウホンノウをごま<br>かすことはできない。 ▼<br>・・・オレは戦場で生まれて・・戦場で死ぬ。<br>SNAKE・・・オレたちはたたかうしか・・<br>たたかうしかない。人を・・まして、女をしあ<br>わせにすることなんぞ・・・できやしねぇ ▼▼<br><br>SNAKE『カノジョのことか・・・ ▼▼<br><br>FOX『オレにはダイイング・イン・アクションがに合<br>いだ ▼▼<br><br>SNAKE『FOX、安心しろ。オレはけっしてお前のよう<br>にはならん ▼▼<br><br>FOX『そのことば・・・あの世へみやげにもっていく<br>・・・うまくやれよ、SNAKE。<br>・・・ファンのキタイをうらぎるなよ ▼▼<br><br>SNAKE『ファンのキタイ？！・・そうか！<br>FOXだったのか・・あのムセンは ▼▼<br><br>FOX『オレのわがままのダイショウさ・・・<br>さきにいくぜ。SNAKE ▼▼<br><br>SNAKE『ひとりじゃないぜ、フランク。<br>むこうでナターシャがまっている ▼▼<br><br>FOX『・・・ナターシャ・・・ ▼▼<br><br>FOX『・・・ありがとう・・・SNAKE ▽ | FOX: SNAKE... looks like the time has come to hand over the FOX title.<br>SNAKE: FOX... why?<br>FOX: I... unlike you, am in a complicated position. BIG BOSS may have been just a commander to you, but he saved my life twice. Long before I joined the unit. I was a half-caste in Vietnam... back then, the children of white men were persecuted even after the war and made to do forced labour. He saved me from that hell. Like the children here... The second time was Mozambique. He rescued me when I was being tortured as a Lemona soldier. They had cut off my ears and nose... I was in a terrible state.<br>SNAKE: Is this how you repay him?! This...?<br>FOX: It isn't that. I hate war. Like the children here. But... I need war. People of war like us can't live in normal society. We people of war need a battlefield. BOSS gives us a place to fight. You can't cheat the fighting instinct you're born with. ...I was born on the battlefield... and I'll die on the battlefield. SNAKE... all we can do is fight... just fight. Making someone happy... let alone a woman... we can't do it.<br>SNAKE: You mean her...<br>FOX: Dying in action suits me.<br>SNAKE: FOX, don't worry. I'll never become like you.<br>FOX: Those words... I'll take them to the other world as a souvenir... Good luck, SNAKE. ...Don't let your fans down.<br>SNAKE: My fans?! ...I see! It was you, FOX... that radio.<br>FOX: The price of my selfishness... I'll go first, SNAKE.<br>SNAKE: You won't be alone, Frank. Natasha is waiting for you over there.<br>FOX: ...Natasha...<br>FOX: ...Thank you... SNAKE |

### BIG BOSS

| | Original | Translation |
|---|---|---|
| `p50:92AE` | 『こっちだ、SNAKE！ ▽ | This way, SNAKE! |
| `p50:92BB` | SNAKE『BIG　BOSS・・・生きていたのか ▼▼<br><br>BOSS『SNAKE・・・<br>ようこそザンジバーランドへ・・・<br>やはりもどってきたな。わたしのもとへ ▽ | SNAKE: BIG BOSS... you were alive.<br>BOSS: SNAKE... welcome to Zanzibar Land... So you came back. Back to me. |
| `p50:92FF` | SNAKE『オレは3年間とりついているアクムをはらいに<br>きた。 ▼▼<br><br>BOSS『アクム？はらえやせんよ。　SNAKE、<br>・・・いちど、戦トウのカイカン、テンション<br>を味わったものはー生・・・戦場に身をおくこ<br>とになる。 ▼▼<br><br>BOSS『いちど、ヒョウシュツした戦トウホンノウは2<br>ドとねむることはないのだ。よりキョウレツな<br>テンションがほしくなる。 ▼<br>このどうしようもないカンカク・・・ヨウヘイ<br>であるお前ならよくわかるはず。 ▼<br>おまえたちのヨッキュウをユイイツ、みたして<br>くれるものはケンリョクでもカネでも、SEX<br>でもない。<br>ただひとつ・・・WAR［戦ソウ］だ！ ▼<br>わたしはお前らにその場をあたえているのだよ<br>お前らの生きがいをな。 ▼▼<br><br>SNAKE『ギゼン者きどりか？　BIG　BOSS ▼▼<br><br>BOSS『お前もあのこどもたちを見ただろう？<br>世界カッコクで生まれた戦ソウギセイ者。<br>そして次の戦ソウをになう戦士のたまごたち ▼<br>戦ソウをユウハツさせ、シエンし、ギセイ者を<br>生み・・・キュウゴ、クンレンして・・・ふた<br>たび戦場にフィードバックさせる。 ▼<br>じつに合理的なシステムだ。この世にあらそい<br>はたえることはない。　われわれのモクヒョウ<br>・・・生きがいも。 ▼▼<br><br>SNAKE『ショクにあぶれることはない・・とでもいいた<br>いのか！ ▼▼<br><br>BOSS『わたしもお前も、戦場でこそキショウカチだが<br>クニへかえればブキヨウなデクだ。 ▼<br>われわれのキゲンをとりにくるのは、せいぜい<br>安っぽいシュウカンシのジャーナリストくらい<br>だろうて。 ▼<br>お前もわたしも戦場で、のたれ死ぬまでここに<br>のこるしかないのだ。 ▼▼<br><br>SNAKE『・・・オレの戦いは、ただひとつ。キサマから<br>ジユウになるために、アクムをはらうために、<br>・・・BIG　BOSS、キサマをたおす！ ▼▼<br><br>BOSS『どちらがかってもわれわれのたたかいはおわら<br>ない。　ハイ者は戦場からカイホウされるが、<br>ショウ者は戦場にのこる。 ▼<br>そして、生きのこった者は死ぬまで戦士として<br>人生をまっとうするのだ。 ▼▼<br><br>SNAKE『レイガイもある。<br>オレは・・人生をあいしている。 ▼▼<br><br>BOSS『SNAKE、わかった。<br>わたしがキサマをクノウからカイホウしてやろ<br>う。もとジョウカンのよしみだ<br>・・・らくにしてやる。 ▼▼<br><br>SNAKE『もうあんたのせわにはならん！ ▼▼<br><br>BOSS『ほう？・・・その体で、ブキもなしに・・・<br>このわたしに？<br>ショウサンがあるというのか！？ ▼▼<br><br>SNAKE『さいごまでけっしてあきらめない。　いかなる<br>キュウチでもセイコウをイメージする。<br>・・・あんたのことばだ。 ▼▼<br><br>BOSS『わたしも時にはあやまりをおかす。 ▼<br>SNAKEっ！<br>・・・こんどこそさいごのたたかいだ。<br>イッカイきりの・・・こいっ！！ ▽ | SNAKE: I've come to get rid of the nightmare that has haunted me for three years.<br>BOSS: A nightmare? You won't get rid of it, SNAKE... once you've tasted the thrill and the tension of battle, you stay on the battlefield for life.<br>BOSS: Once the instinct for battle has come out, it never sleeps again. You want ever stronger tension. You, a mercenary, should know that feeling you can't help. The only thing that fulfils your desire is not power, nor money, nor SEX. Only one thing... WAR! I give you the place for it. Your reason for living.<br>SNAKE: Playing the hypocrite, BIG BOSS?<br>BOSS: You've seen those children too, haven't you? Victims of war born all over the world. And the eggs of the warriors who will carry the next war. Stir up war, back it, make victims... rescue them, train them... and feed them back to the battlefield. A very rational system. There will never be an end to fighting in this world. Nor to our goal... our reason for living.<br>SNAKE: You mean we'll never be out of a job!<br>BOSS: You and I are rare on the battlefield, but back home we're clumsy puppets. The only ones who come to flatter us are cheap weekly-magazine journalists. You and I can only stay here, on the battlefield, until we die like dogs.<br>SNAKE: ...My fight is only one. To be free of you, to get rid of the nightmare... BIG BOSS, I'll beat you!<br>BOSS: Whoever wins, our fight won't end. The loser is freed from the battlefield, the winner stays on it. And the survivor lives out his life as a warrior until he dies.<br>SNAKE: There are exceptions. I... love life.<br>BOSS: SNAKE, very well. I'll free you from your suffering. For old times' sake, as your former commander... I'll make it easy.<br>SNAKE: I won't need your help any more!<br>BOSS: Oh?... In that state, without weapons... against me? You think you can win!?<br>SNAKE: Never give up until the end. Picture success in any tight spot... your own words.<br>BOSS: Even I make mistakes sometimes. SNAKE! ...This time it's the last fight. Just once... come on!! |
| `p50:9770` | BOSS『SNAKE！！ | BOSS: SNAKE!! |
| `p50:977A` | BOSS『まだだ・・・まだまだ・・・ | BOSS: Not yet... not yet... |
| `p50:978A` | BOSS『SNAKE・・・まだだ・・ | BOSS: SNAKE... not yet... |
| `p50:9CB9` | SNAKE『し、しまった！！<br>・・・タマがきれたっ！ | SNAKE: D-damn!! ...Out of ammo! |

### The escape

| | Original | Translation |
|---|---|---|
| `p50:9CCF` | ホーリー『SNAKE？！ | HOLLY: SNAKE?! |
| `p50:9CD9` | ホーリー『ヘリだわっ・・たすかったのよ！ | HOLLY: A helicopter... we're saved! |
| `p50:9CEB` | SNAKE『クリスマスに間に合うかな？ | SNAKE: Will we make it for Christmas? |
| `p50:9CFD` | ホーリー『まだユウショクには間に合うわ。<br>SNAKE | HOLLY: We'll still make it for dinner, SNAKE. |
| `p50:9D17` | SNAKE『いこうか・・・<br>キリストはにげないさ | SNAKE: Let's go... Christ won't run away. |

### The ending

The talk of the ending, with the MSX screen of [Curiosities](CURIOSITIES.html).

| | Original | Translation |
|---|---|---|
| `p50:9D2C` | キャンベル『ごくろうだったな、SNAKE・・・<br>どうだ？<br>もういちど・・ブタイへもどらないか？ | CAMPBELL: Well done, SNAKE... how about it? Will you come back to the unit once more? |
| `p50:9D57` | SNAKE『・・・アクムははれた。オレはジユウだ | SNAKE: ...The nightmare is gone. I'm free. |
| `p50:9D6C` | キャンベル『そうか・・・ザンネンだ。<br>ところであのカートリッジだが・・・本当にマ<br>ルフ博士ののこしたものなのか？？ | CAMPBELL: I see... a pity. By the way, that cartridge... is it really the one Dr. Marv left?? |
| `p50:9DA5` | ホーリー『カートリッジをあけてみたら？ | HOLLY: Why don't you open the cartridge? |
| `p50:9DB5` | SNAKE『そのヒツヨウはない。オレがもちかえったのは<br>まちがいなくマルフ博士ののこしたカートリッ<br>ジだ。<br>そのままMSXにさしこんでみろ | SNAKE: No need. What I brought back is definitely the cartridge Dr. Marv left. Just plug it into an MSX. |
| `p50:9DF8` | キャンベル『わかった・・・よしっ | CAMPBELL: All right... here goes. |
| `p50:9E04` | ホーリー『・・・なに？・・・なにもかわらないわ | HOLLY: ...What? ...Nothing's changed. |
| `p50:9E19` | キャンベル『こ、これは・・・<br>そうか、SNAKEの言う通りだっ！<br>これはまぎれもなくマルフ博士ののこしたカー<br>トリッジ | CAMPBELL: Th-this is... I see, it's as SNAKE said! This is without doubt the cartridge Dr. Marv left. |
| `p50:9E54` | ホーリー『なんの事？・・わたしにはなにも見えないわ | HOLLY: What do you mean? ...I can't see anything. |
| `p50:9E6C` | SNAKE『ほらっ、よく見るんだ・・・マルフ博士のサイ<br>ンがしるされている・・・<br>ここ、KIO　MARVのフルネームが | SNAKE: Look, look closely... Dr. Marv's signature is there... here, KIO MARV's full name. |
| `p50:9EA6` | ホーリー『あっ、ほんと・・さかさまになっているのね | HOLLY: Oh, it's true... it's back to front. |
| `p50:9EBC` | キャンベル『これで世界は救われる・・・ | CAMPBELL: With this the world is saved... |
| `p50:9ECE` | SNAKE『マルフ博士のさいごのパフォーマンス | SNAKE: Dr. Marv's last performance. |
| `p50:9EE4` | ホーリー『カレは心からゲームをあいしていたのよ・・・<br>きっと | HOLLY: He truly loved games... I'm sure. |
| `p50:9F00` | キャンベル『マルフ博士はバカげた政治ゲームにまきこ<br>まれて死んだ | CAMPBELL: Dr. Marv died caught up in a stupid political game. |
| `p50:9F21` | ホーリー『でも・・・カレののこしたゲームはみんなを救<br>ったわ。ね、SNAKE？ | HOLLY: But... the game he left saved everyone. Right, SNAKE? |
| `p50:9F46` | ホーリー『SNAKE？・・・どこいったの？<br>ねぇ、SNAKEがいないわ！ | HOLLY: SNAKE? ...Where did he go? Hey, SNAKE's gone! |
| `p50:9F68` | キャンベル『・・・SNAKE？・・・にげられたか？ | CAMPBELL: ...SNAKE? ...He got away from us? |
| `p50:9F7D` | ホーリー『SNAKE！SNAKE！<br>・・・ユウショクのヤクソクをしてたのにひど<br>いわ・・・・ | HOLLY: SNAKE! SNAKE! ...We had a date for dinner, that's mean... |

### The children

What the children of Zanzibar say, in whichever room they are ([The enemies](THE-ENEMIES.html)).

| | Original | Translation |
|---|---|---|
| `p50:8227` | こども『スイコウの水はつめたいからながく<br>入っているとカゼひくよ | CHILD: The water in the canal is cold, if you stay in long you'll catch a cold. |
| `p50:8247` | こども『おにいちゃん、あのブロンドのおね<br>ぇちゃんとトモダチ？ | CHILD: Mister, are you friends with that blonde lady? |
| `p50:8264` | こども『このスイコウはジェット水リュウで<br>むこうのビルとつながってるんだっ<br>て | CHILD: They say this canal is joined to the building over there by a water jet. |
| `p50:828A` | こども『かた目のおじちゃんにミドリのフク<br>の人がきたらつたえてくれって。 ▼<br>おねえちゃんはここにはいない<br>って | CHILD: The one-eyed man told me to tell the man in green if he came. That the lady isn't here. |
| `p50:82C0` | こども『スイコウの下にね・・・<br>ふるい地下水道があるんだってさ | CHILD: Under the canal... they say there's an old underground waterway. |
| `p50:82E3` | こども『ながれにさからってはいけない<br>って、かた目のおじちゃんが。 ▼<br>ながれに身をまかせると見えなか<br>ったものが見えてくるって・・・<br>なんのことかわかる？ | CHILD: The one-eyed man says you mustn't go against the current. That if you let the current carry you, you'll see what you couldn't see... do you know what he means? |
| `p50:8347` | こども『ここから、西北のところに動物のシ<br>イク所があるの | CHILD: North-west of here there's a place where they keep animals. |
| `p50:8366` | こども『ここはね、夜になるとジカハツデン<br>なんだ。だからデンリョクのいるレ<br>ーザーフェンスはきえるんだ。 ▼<br>そうなったらボクらも中であそべる<br>んだ。見つかるとおこられるけど | CHILD: At night they make their own electricity here. So the laser fence, which needs power, goes off. Then we can play inside too. We get told off if they catch us. |
| `p50:83BC` | こども『かた目のおじちゃんはボクらのおや<br>がわりさ。おじちゃんは大人がきら<br>いなんだ | CHILD: The one-eyed man is like a parent to us. He hates grown-ups. |
| `p50:83E7` | こども『夜、ふくろうがなくから・・・<br>こわくてねむれないの | CHILD: At night the owl hoots... and I'm too scared to sleep. |
| `p50:8403` | こども『そこのベランダはパラシュートこう<br>か用につくられたんだよ。 ▼<br>でもハングライダーだったら・・・<br>もっととおくへいけるだろうなぁ | CHILD: That balcony was built for parachute drops. But with a hang glider... you could go much further. |
| `p50:8444` | こども『この前までこの南にベランダがあっ<br>たんだけど通路がうめられたんだ | CHILD: Until recently there was a balcony south of here, but they blocked the passage. |
| `p50:846A` | こども『この南にミドリのパイナップルみ<br>たいなものがいっぱいあったんだけ<br>ど | CHILD: South of here there used to be lots of things like green pineapples, but... |
| `p50:848F` | こども『ギブ・ミー・キョコレート！<br>にいちゃん、B1レーションもって<br>ない？ ▼<br>B1レーションにチョコレートがは<br>いってるんだ | CHILD: Give me chocolate! Mister, have you got a B1 ration? There's chocolate in the B1 ration. |
| `p50:84D2` | こども『収容所の中はネズミがおおいんだ。<br>ネズミはスになんでももちこんじゃ<br>うんだ。 ▼<br>だからネズミよけにノウリュウサン<br>をおいてあるんだってさ | CHILD: There are lots of rats in the prison camp. Rats carry anything into their nests. So they put sulphuric acid there to keep the rats away. |
| `p50:851B` | こども『ここはそこなしぬまだからちかづく<br>と危ないんだって。<br>けど・・ボクたしかに見たんだ。 ▼<br>大きなトラックがこの上を通ってい<br>くのを。しんじてくれる？ | CHILD: This is a bottomless swamp, so it's dangerous to get close. But... I really saw it. A big lorry driving over it. Do you believe me? |
| `p50:856A` | こども『ここからよくトラックがではいりし<br>てるよ | CHILD: Lorries often come and go from here. |
| `p50:8580` | こども『タイクウミサイル、スティンガー<br>だろっ？ ▼<br>この前、戦シャにソウビするとかな<br>んかで、ザンジバービルの1Fの西<br>ガワのコウジョウにもってったよ | CHILD: An anti-air missile, a Stinger, right? The other day they took them to the factory on the west side of 1F of the Zanzibar building, to fit them to a tank or something. |
| `p50:85CB` | こども『わたし、ジュウをもった人、<br>大きらい！！ | CHILD: I hate people with guns!! |
| `p50:85E4` | こども『ヒミツをおしえてあげる？ ▼<br>ナターシャねぇちゃんのね。<br>ブローチね・・サウナやレイトウコ<br>に入るとかたちがかわるのよ | CHILD: Shall I tell you a secret? About Natasha's brooch. It changes shape when you go into the sauna or the freezer. |
| `p50:8620` | こども『あっ、みつかっちゃった！<br>・・・かくれんぼしてたの | CHILD: Oh, you found me! ...We were playing hide-and-seek. |
| `p50:863C` | こども『ナターシャねえちゃんのロッカーは<br>いちばん右上よ。サウナから上がっ<br>てきた時によく見たわ | CHILD: Natasha's locker is the top right one. I often saw it when she came up from the sauna. |
| `p50:866F` | こども『ここにはトイレがひとつしかないの<br>。このかいの南東にあるんだけど<br>・・・夜、こわくて | CHILD: There's only one toilet here. It's in the south-east of this floor... but at night I'm scared. |
| `p50:869E` | こども『このオクにマネキンの兵タイさんが<br>いっぱいあるよ。 | CHILD: At the back there are lots of mannequin soldiers. |
| `p50:86BA` | こども『ここの大人たちはコッカがかかると<br>キリツしてしまうんだ。<br>それがきまりなんだって | CHILD: The grown-ups here stand up when the national anthem plays. That's the rule, they say. |
| `p50:86E6` | こども『カゼをひいた時はイム室にいってク<br>スリをもらえばいいんだ | CHILD: When you catch a cold you go to the sick bay and they give you medicine. |
| `p50:8706` | こども『夜でも見えるソウガンキョウってし<br>ってる？ | CHILD: Do you know about binoculars that see even at night? |

### Loose ones and tails

Messages of banks 48-49 outside the conversations, and the tails that the listing reads as messages of their own («・・・OVER», «なんのことかわかる？»): they are the end of the one before.

| | Original | Translation |
|---|---|---|
| `p48:9534` | マスター『タバコでカザムキきがわかるぞ。<br>うまくつかえ・・・OVER ▽ | MASTER: Cigarettes tell you which way the wind blows. Use them well... OVER |
| `p48:9833` | キャンベル『サーチライトは動きをよみとり、タ<br>イミングをはかってモノカゲからモ<br>ノカゲへすばやくイドウしろ<br>・・・OVER ▽ | CAMPBELL: The searchlights read movement; time it and move quickly from cover to cover... OVER |
| `p48:9D50` | キャンベル『おじちゃん、スネークさん？・・<br>わたし、キャリー。<br>パパはつりにいっちゃったの。 ▼<br>大ジョウブ・・・ムセンキ、もっ<br>ていったから。<br>シュウハスウは140・99・・<br>こんどあそびにきてね。バーイ ▽ | CAMPBELL: Mister, Mister Snake?... I'm Carrie. Daddy's gone fishing. Don't worry... he took the radio. The frequency is 140.99... come and play some time. Bye-bye |
| `p49:BB4C` | ホーリー『SNAKE！大へんっ！！ ▽ | HOLLY: SNAKE! Big trouble!! |
| `p49:A1B5` | ・・・OVER ▽ | ...OVER |
| `p49:A1BD` | ・・・OVER ▽ | ...OVER |
| `p49:A1C5` | ・・・OVER ▽ | ...OVER |
| `p49:ACC0` | ・・・OVER ▽ | ...OVER |
| `p50:8331` | なんのことかわかる？ | Do you know what it means? |
| `p50:833C` | なんのことかわかる？ | Do you know what it means? |
| `p50:84CB` | いってるんだ | ...is in it |
<!-- /generado -->

## The signs

The short phrases painted all at once (`letrero`, `p00:4950`; those of
`p00:4918` carry the row and column of each line): what Snake picks up and
throws away, the names of the weapons and the equipment, those of whoever
speaks and the headers of F2 and F3. The descriptions of the weapons and the
equipment are in [Snake](SNAKE.html).

<!-- generado:letreros -->
| | Original | Translation |
|---|---|---|
| `p51:B1D9` | を、ニュウシュした。 | ...picked up. |
| `p51:B1E4` | しかし、つかいみちが / ないのですてよう！ | but it's no use, so I'll throw it away! |
| `p51:B1F9` | サカナのホネ | fish bones |
| `p51:B200` | ハトのフン | pigeon droppings |
| `p51:B206` | ヘビのヌケガラ | snake skin |
| `p51:B20E` | マネキンのみぎうで | a mannequin's right arm |
| `p51:B218` | ネズミのしがい | a dead rat |
| `p51:B220` | バグチェックリスト | a bug checklist |
| `p51:B22A` | タバコのすいがら | a cigarette butt |
| `p51:B233` | バナナのかわ | a banana skin |
| `p51:B23A` | コナミ　パラダイム | Konami Paradigm |
| `p51:B244` | ドリンクのアキビン | an empty drink bottle |
| `p51:B2C4` | ハンドガン | handgun |
| `p51:B2CA` | サブマシンガン | submachine gun |
| `p51:B2D2` | グレネード | grenade |
| `p51:B2D8` | タイクウミサイル | anti-air missile |
| `p51:B2E1` | リモコンミサイル | remote-controlled missile |
| `p51:B2EA` | プラスチック・バクダン | plastic explosive |
| `p51:B2F6` | ジライ | mine |
| `p51:B2FA` | カモフラージュ・マット | camouflage mat |
| `p51:B306` | ムリョクカガス | disabling gas |
| `p51:B30E` | マウス | mouse |
| `p51:B312` | ライター | lighter |
| `p51:B317` | ワイヤー | wire |
| `p51:B31C` | サイレンサー | silencer |
| `p51:B323` | タバコ | cigarettes |
| `p51:B327` | ソウガンキョウ | binoculars |
| `p51:B32F` | ナイトビュア | night viewer |
| `p51:B336` | ガスマスク | gas mask |
| `p51:B33C` | ボデイ・アーマー | body armour (spelt ボデイ) |
| `p51:B345` | サンソボンベ | oxygen tank |
| `p51:B34C` | ジライタンチキ | mine detector |
| `p51:B354` | ハングライダー | hang glider |
| `p51:B35C` | ダンボール | cardboard box |
| `p51:B362` | バケツ | bucket |
| `p51:B366` | カゼグスリ | cold medicine |
| `p51:B36C` | カセットテープ | cassette tape |
| `p51:B374` | タマゴ　？ | egg ? |
| `p51:B37A` | ブローチ | brooch |
| `p51:B37F` | レッド　カード | red card |
| `p51:B387` | ブルー　カード | blue card |
| `p51:B38F` | グレーン　カード | «grean» card (sic) |
| `p51:B398` | カード　1 | card 1 |
| `p51:B39E` | カード　2 | card 2 |
| `p51:B3A4` | カード　3 | card 3 |
| `p51:B3AA` | カード　4 | card 4 |
| `p51:B3B0` | カード　5 | card 5 |
| `p51:B3B6` | カード　6 | card 6 |
| `p51:B3BC` | カード　7 | card 7 |
| `p51:B3C2` | カード　8 | card 8 |
| `p51:B3C8` | カード　9 | card 9 |
| `p51:B3CE` | スプレー | spray |
| `p51:B3D3` | カートリッジ | cartridge |
| `p51:B3DA` | B1　レーション | B1 ration |
| `p51:B3E3` | B2　レーション | B2 ration |
| `p51:B3EC` | B3　レーション | B3 ration |
| `p51:B3F5` | ダンヤク | ammunition |
| `p51:B424` | SNAKE | SNAKE |
| `p51:B42A` | キャンベル | Campbell |
| `p51:B430` | ホーリー | Holly |
| `p51:B435` | マスター | Master |
| `p51:B43A` | ノルデン | Norden |
| `p51:B43F` | ケスラー | Kessler |
| `p51:B444` | ナターシャ | Natasha |
| `p51:B44A` | マルフ | Marv |
| `p51:B44E` | ペトロ | Petro |
| `p51:B452` | FOX | FOX |
| `p51:B456` | BOSS | BOSS |
| `p51:B45B` | BLACK | BLACK |
| `p51:B461` | COP | COP |
| `p51:B465` | ランニング | Running |
| `p51:B46B` | RED | RED |
| `p51:B46F` | BOX | BOX |
| `p51:B473` | プレデター | Predator |
| `p51:B479` | パイロット | pilot |
| `p51:B47F` | こども | child |
| `p51:B483` | へいし | soldier |
| `p51:B4AD` | WEAPON　SELECT / OPTION | WEAPON SELECT / OPTION |
| `p51:B4C6` | EQUIPMENT　SELECT | EQUIPMENT SELECT |
<!-- /generado -->

## The font

The letters are drawn on **page 3 of the VRAM**, in 8 x 8 characters: letter
c is at ((c & 0x1F) x 8, (c >> 5) x 8) (`p00:4AEA`). There are two strips:
the top one with the figures, the letters, hiragana, katakana and the signs,
and the one with 0xF8 in front, with **128 kanji** and the pieces of the
status panel. Dumped after start-up and read character by character
(`tools/textos.py fuente`):

![Strip 0: figures, letters, kana and signs](imagenes/fuente_f0.png)

![Strip 0xF8: the 128 kanji and the pieces of the status panel](imagenes/fuente_f8.png)

Of the 128 kanji, **114** appear in some text and **14 never** do: 火 面 国 制
多 特 表 武 歩 保 民 百 野 略.

## How they are written

The messages are in banks **48-49** (`0x8000-0xBFFF`) and **50-51**
(`bancos_del_mensaje`, `p01:666A`); one that ends a bank goes on in the
other. `siguiente_letra` (`p01:66C4`) writes them letter by letter:

| Byte | What it does |
|---|---|
| < 4 at the start | the speed (`p01:654F`) |
| 0xFF | the end |
| 0xFE | new line |
| 0xFD | waits for a key and goes on (▼) |
| 0xFC | waits, opens another window and, behind it, a new speed (▼▼, `p01:65E9`) |
| 0xFB | waits and ends (▽) |
| 0x76-0x7F, 0xD4-0xDF | who speaks: their name (`p50:8004`) and 『 |
| 0xF8 | the next letter is a kanji |

The **397 messages** in the listing come out like this, without a single
unknown letter; they are all above, in the transceiver and in the scenes.
