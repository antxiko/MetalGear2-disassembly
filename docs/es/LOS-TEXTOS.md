# Los textos

Todo lo que se lee en el juego: las conversaciones del transceptor, las escenas en el orden de la historia y los letreros, cada mensaje con su traducción; y al final la fuente y cómo se escriben.

## El transceptor

![Los 12 retratos](../imagenes/retratos.png)

### Quién contesta

Las frecuencias son 140.xx: el juego guarda solo las dos cifras de detrás, en
BCD, en la lista de `0xD7A0` (la de la partida nueva, `p09:B67E`). Cada uno de
los ocho primeros sitios de la lista tiene su conversación (`p48:8037`):

| Sitio | Frecuencia | Quién | Fichas |
|---:|---|---|---:|
| 0 | 140.85 | キャンベル | 16 |
| 1 | 140.38 | マスター | 15 |
| 2 | 140.40 | ノルデン | 7 |
| 3 | 140.15 | ホーリー | 10 |
| 4 | 140.93 | ケスラー | 8 |
| 5 | 140.82 | ペトロ | 5 |
| 6 | 140.51 | マルフ | 2 |
| 7 | 140.27 | FOX | 0 |

Quién habla en cada mensaje da su sitio por
`p09:BFE1`: ナターシャ comparte el 6 con マルフ, y los demás que hablan en el
juego (BOSS, BLACK, RUNNING, RED, BOX, PREDATOR, el piloto, los niños, los
soldados) no tienen número.

Al seguir una partida guardada la lista se rehace (`p09:B62F`) según los
bits 3-6 de `0xD7E4`: el sitio 0 pasa a 140.66 o 140.24, el 1 a 140.98 y el 3
a 140.76. Y una conversación pone el 1 en 140.99 (ver
[Curiosidades](CURIOSIDADES.html)). El 140.07 no es de nadie: es la radio.

### Los retratos

Arriba, los doce que pinta el cartucho (`tools/retratos.py`): cada uno es un
mosaico de 4 x 6 caracteres de `p44:93FD` (`pon_mosaico_de_quien_habla`,
`p03:B814`). El 0 es Snake, a la izquierda; del 1 al 8, el que contesta en el
sitio 0 a 7; el 9 y el 11 son ナターシャ (iguales punto por punto: el 11 va a la
izquierda en una escena) y el 10 BIG BOSS.

### Cómo se elige lo que dice

Cada conversación es una lista de **fichas**: [cabeza] [banderas] [zona y
sala, si la cabeza lleva el bit 7] [acción] [mensaje], y detrás, con 0xFE,
las que siguen tras una espera. El juego dice la **primera ficha que vale**
(`recorre_conversacion`, `p01:608B`). Las banderas son sucesos de la partida
(`0xD7D0`, `p03:B0F6`): sin el bit 4 de la cabeza, la ficha vale con todas
puestas; con él, con la última puesta y las demás no (`mira_condiciones`,
`p01:6104`). La acción 0 dice un mensaje; la 1, uno al azar de una lista con
sus umbrales sobre 100.

Esta lectura está **contrastada con el cartucho**: con 3.000 juegos de
banderas, zonas y salas al azar, la ficha que elige `tools/prueba_conversaciones.py`
es la que elige el código del juego ejecutado, las 3.000 veces.

### Las conversaciones, enteras

Por frecuencia y en el orden en que se miran las fichas; detrás, las nueve
de la cabecera de `p48` que no tienen número (la de `p48:800E`, con 16
fichas, son las llamadas que hace el juego, `p03:B108`). Los textos van
como los escribe el juego (cada salto de línea, el de la ventana): ▼ espera
una tecla, ▼▼ espera y abre otra ventana, ▽ acaba. Al lado, la traducción
(`tools/traducciones.py`, hecha a mano desde ese texto; una barra de la
ventana del juego es un salto de línea aquí también). Lo que Marv y Natasha
dicen en ruso va en ruso, con su traducción entre paréntesis.

<!-- generado:conversaciones -->
#### 140.85

Hablan: キャンベル. La conversación de `p48:8047`, con 16 fichas.

**Ficha 0** (banderas 53 A1, con todas puestas)

| | Original | Traducción |
|---|---|---|
| `p48:9636` | キャンベル『たたかうべき時はたたかう。たおす<br>べき時はたおす。戦場とシューティ<br>ングゲームの基本だ・・OVER ▽ | CAMPBELL: Lucha cuando haya que luchar. Derriba cuando haya que derribar. Es lo básico del campo de batalla y de los juegos de disparos... CAMBIO |

**Ficha 1** (banderas 50 7A A1, con todas puestas)

| | Original | Traducción |
|---|---|---|
| `p48:9DF2` | キャンベル『SNAKE！BIG　BOSSは<br>もはやきみのジョウカンではない<br>。ー人のキョウジンだ。わかるな<br>？シジョウははさむな。 ▼<br>レイセイになれ。ここできみがま<br>けることはできんのだ！そしてわ<br>れわれがきみにしてやれることも<br>ない。 ▼<br>全世界がきみにかかっているんだ<br>！こううんをいのる<br>・・・OVER ▽ | CAMPBELL: ¡SNAKE! BIG BOSS ya no es tu superior. Es un loco. ¿Entendido? Deja los sentimientos aparte.<br>Mantén la calma. ¡Aquí no puedes perder! Y nosotros ya no podemos hacer nada por ti.<br>¡El mundo entero depende de ti! Buena suerte... CAMBIO |

**Ficha 2** (banderas 4C 5E 2F A1, con todas puestas)

| | Original | Traducción |
|---|---|---|
| `p48:9DB3` | キャンベル『SNAKE！アイテムがもえてい<br>る！！すべてのソウビヒン、ブキ<br>をすてろ！時間がないぞ。スペー<br>スキーですてるんだ！ ▽ | CAMPBELL: ¡SNAKE! ¡Tus objetos están ardiendo! ¡Tira todo el equipo y las armas! No hay tiempo. ¡Tíralos con la barra espaciadora! |

**Ficha 3** (banderas 3E 3F 62 A1, con todas puestas)

| | Original | Traducción |
|---|---|---|
| `p48:9BD4` | キャンベル『やつの足音に注意しろ。足音で<br>やつのイチをヨソウしろ。ヘヤもユ<br>カのザイシツも4シュルイ、足音も<br>4シュルイだ。 ▼<br>テキがハッポウしたらマズル・ブラ<br>ストをねらえ。バーストのさきにや<br>つがいる・・・OVER ▽ | CAMPBELL: Atento a sus pasos. Adivina dónde está por sus pasos. Hay 4 clases de habitación y de suelo, y 4 clases de pasos.<br>Cuando el enemigo dispare, apunta al fogonazo. Está donde sale la ráfaga... CAMBIO |

**Ficha 4** (banderas A4 A5 35, con todas puestas)

| | Original | Traducción |
|---|---|---|
| `p48:9F58` | キャンベル『シュウハスウをヘンコウする。<br>シュウハスウはタップコードでお<br>くる。カイドクしろ。<br>・・・OVER ▽ | CAMPBELL: Cambio de frecuencia. Te la mando en código de golpes. Descífrala... CAMBIO |

**Ficha 5** (banderas 21 71 5A, con todas puestas)

| | Original | Traducción |
|---|---|---|
| `p48:9C45`<br>al azar, hasta 80 de 100 | キャンベル『WIS、OHIO・・・WISはウ<br>ィスコンシンしゅうのショウリャク<br>ケイ、OHIOはオハイオしゅう・<br>・・？ ▼<br>どちらもアメリカのしゅうめいだ。<br>マルフはアメリカにはいちどもいっ<br>たことがないはずだが？ ▼<br>マスター・ミラーならわかるかもし<br>れん・・・OVER ▽ | CAMPBELL: WIS, OHIO... WIS es la abreviatura del estado de Wisconsin, OHIO es el estado de Ohio...?<br>Los dos son nombres de estados de América. ¿Pero Marv no ha estado nunca en América?<br>Quizá lo sepa Master Miller... CAMBIO |
| `p48:9CC7`<br>al azar, hasta 100 de 100 | キャンベル『こまったことがあればマクドネル・<br>ミラーに連絡してみろ。<br>もとうちのサバイバル・マスターだ<br>。じつにやくにたつ男だ。 ▼<br>アイデアマンでもある。かれにそう<br>だんしてみるといい。なにかカイケ<br>ツアンをだしてくれるだろう。 ▼<br>シュウハスウは140・38だ。<br>・・・OVER ▽ | CAMPBELL: Si tienes un problema, llama a McDonnell Miller. Era nuestro maestro de supervivencia. Un hombre muy útil.<br>También tiene ideas. Consúltale. Te dará alguna solución.<br>La frecuencia es 140.38... CAMBIO |

**Ficha 6** (banderas 08 09, con todas puestas, en la zona 03, sala 06)

| | Original | Traducción |
|---|---|---|
| `p48:9AB8` | キャンベル『よう兵やテキヘイキにかんすること<br>はヨウヘイ上がりのジョウホウヤ、<br>ジョージ・ケスラーにきいてみろ。<br>やつのしらないことはない。 ▼<br>以前、うちで軍事コモンとしてはた<br>らいていたこともある。<br>シン用して大ジョウブな男だ。<br>シュウハスウは140・93だ。 ▼<br>ジョウホウリョウはこっちもちだが<br>・・・クジラリョウリのみせのこと<br>なんかきくなよ・・・OVER ▽ | CAMPBELL: Para lo de mercenarios y armas enemigas, pregunta al informador ex mercenario George Kessler. No hay nada que no sepa.<br>Trabajó con nosotros de asesor militar. Es de fiar. La frecuencia es 140.93.<br>La información la pagamos nosotros, pero... no le preguntes por restaurantes de ballena... CAMBIO |

**Ficha 7** (banderas 0F 10 8E, con todas puestas)

| | Original | Traducción |
|---|---|---|
| `p48:9AB8` | キャンベル『よう兵やテキヘイキにかんすること<br>はヨウヘイ上がりのジョウホウヤ、<br>ジョージ・ケスラーにきいてみろ。<br>やつのしらないことはない。 ▼<br>以前、うちで軍事コモンとしてはた<br>らいていたこともある。<br>シン用して大ジョウブな男だ。<br>シュウハスウは140・93だ。 ▼<br>ジョウホウリョウはこっちもちだが<br>・・・クジラリョウリのみせのこと<br>なんかきくなよ・・・OVER ▽ | CAMPBELL: Para lo de mercenarios y armas enemigas, pregunta al informador ex mercenario George Kessler. No hay nada que no sepa.<br>Trabajó con nosotros de asesor militar. Es de fiar. La frecuencia es 140.93.<br>La información la pagamos nosotros, pero... no le preguntes por restaurantes de ballena... CAMBIO |

**Ficha 8** (banderas 14 15 88, con todas puestas)

| | Original | Traducción |
|---|---|---|
| `p48:99FA`<br>al azar, hasta 40 de 100 | キャンベル『ヘリコプターの戦とうソクドはだい<br>たい250キロ。プロペラきのハン<br>ブンのスピードでシカイにとらえら<br>れている時間がながい。 ▼<br>ヘリコプターのジャクテンはセンカ<br>イ中だ。タイセイをととのえて、次<br>のコウゲキに入る前におとせ！<br>・・・OVER ▽ | CAMPBELL: La velocidad de combate de un helicóptero es de unos 250 km/h, la mitad que un avión de hélice, así que está mucho tiempo a la vista.<br>Su punto débil es cuando gira. ¡Prepárate y derríbalo antes del siguiente ataque!... CAMBIO |
| `p48:9A7B`<br>al azar, hasta 80 de 100 | キャンベル『ヘリのインエイを気にするな。レー<br>ダー上のジツゾウをしんじろ。<br>ヘリはきみのズジョウにいるんだ。<br>・・・OVER ▽ | CAMPBELL: No hagas caso de la sombra del helicóptero. Fíate de la imagen real del radar. El helicóptero está encima de tu cabeza... CAMBIO |
| `p48:9AB8`<br>al azar, hasta 100 de 100 | キャンベル『よう兵やテキヘイキにかんすること<br>はヨウヘイ上がりのジョウホウヤ、<br>ジョージ・ケスラーにきいてみろ。<br>やつのしらないことはない。 ▼<br>以前、うちで軍事コモンとしてはた<br>らいていたこともある。<br>シン用して大ジョウブな男だ。<br>シュウハスウは140・93だ。 ▼<br>ジョウホウリョウはこっちもちだが<br>・・・クジラリョウリのみせのこと<br>なんかきくなよ・・・OVER ▽ | CAMPBELL: Para lo de mercenarios y armas enemigas, pregunta al informador ex mercenario George Kessler. No hay nada que no sepa.<br>Trabajó con nosotros de asesor militar. Es de fiar. La frecuencia es 140.93.<br>La información la pagamos nosotros, pero... no le preguntes por restaurantes de ballena... CAMBIO |

**Ficha 9** (banderas 58, con todas puestas)

| | Original | Traducción |
|---|---|---|
| `p48:9EB6` | キャンベル『ジライゲンはジライタンチキをつ<br>かえばレーダー上にとうえいされ<br>るんだが。カイシュウはホフクで<br>できる・・・OVER ▽ | CAMPBELL: Con el detector de minas, las minas salen en el radar. Se recogen arrastrándose... CAMBIO |

**Ficha 10** (banderas 8C, con todas puestas)

| | Original | Traducción |
|---|---|---|
| `p48:9B71`<br>al azar, hasta 50 de 100 | キャンベル『やみの中ではシリョクのことはわす<br>れろ。はかのあらゆるカンカクをと<br>ぎすましテキのソンザイをかんじと<br>るんだ・・・OVER ▽ | CAMPBELL: En la oscuridad olvídate de la vista. Agudiza todos los demás sentidos y siente al enemigo... CAMBIO |
| `p48:9BB2`<br>al azar, hasta 100 de 100 | キャンベル『デントウのスイッチをさがせ。どこ<br>かにあるはずだ・・・OVER ▽ | CAMPBELL: Busca el interruptor de la luz. Tiene que estar en alguna parte... CAMBIO |

**Ficha 11** (banderas 8D, con todas puestas)

| | Original | Traducción |
|---|---|---|
| | (sin mensaje) (al azar, hasta 20 de 100) | |
| `p48:986E`<br>al azar, hasta 40 de 100 | キャンベル『テキに発見される場合、そのだいい<br>ちはモクシによるもの。だいには音<br>によるものだ。 ▼<br>音はジョウオンにおいてイチビョウ<br>カンにおよそ340メートルすすむ<br>。かざむきひとつでトホウもないキ<br>ョリまでとどいてしまう。 ▼<br>音をたてずにコウドウしろ。音をた<br>てたらすぐさまオウセンのかまえに<br>はいれ・・・OVER ▽ | CAMPBELL: Cuando el enemigo te descubre, es primero por la vista y luego por el oído.<br>A temperatura normal, el sonido recorre unos 340 metros por segundo. Con el viento a favor llega lejísimos.<br>Muévete sin hacer ruido. Si haces ruido, prepárate para luchar enseguida... CAMBIO |
| `p48:990F`<br>al azar, hasta 60 de 100 | キャンベル『足音のしそうなゆか、ジメンに<br>は気をつけろ。いくら音キュウシュ<br>ウブーツでも足音をカンゼンにけす<br>ことはできない。 ▼<br>そういうところではホフクゼンシン<br>ですすめ・・・OVER ▽ | CAMPBELL: Cuidado con los suelos y el terreno que hagan ruido. Ni con botas que absorben el sonido se borran del todo los pasos.<br>Ahí, avanza arrastrándote... CAMBIO |
| `p48:996E`<br>al azar, hasta 100 de 100 | キャンベル『足音をちいさくするにはカカトか<br>らセッチし、おやゆびのつけねのと<br>ころまでゆっくりと下ろしてゆく ▼<br>この方法で足音をけすことができる<br>んだが・・・できんか？<br>・・・OVER ▽ | CAMPBELL: Para que los pasos suenen menos, apoya primero el talón y baja el pie despacio hasta la base del dedo gordo.<br>Así se pueden apagar los pasos... ¿no puedes?... CAMBIO |

**Ficha 12** (banderas 8B, con todas puestas)

| | Original | Traducción |
|---|---|---|
| `p48:9E8A` | キャンベル『ミノフスキーリュウシのノウドが<br>たかいのでレーダーがきかないは<br>ずだ・・・OVER ▽ | CAMPBELL: La concentración de partículas Minovsky es alta, así que el radar no debería funcionar... CAMBIO |

**Ficha 13** (banderas 6C, con todas puestas, en la zona 00, sala 03)

| | Original | Traducción |
|---|---|---|
| | (sin mensaje) (al azar, hasta 20 de 100) | |
| `p48:97F0`<br>al azar, hasta 60 de 100 | キャンベル『ホフクでトラックなどの下にかくれ<br>ることもタイセツだ・・OVER ▽ | CAMPBELL: También es importante esconderse arrastrándose debajo de los camiones... CAMBIO |
| `p48:9814`<br>al azar, hasta 100 de 100 | キャンベル『北むきのトラックには入ることがで<br>きる・・・OVER ▽ | CAMPBELL: En los camiones que miran al norte se puede entrar... CAMBIO |

**Ficha 14** (banderas 6C, con todas puestas, en la zona 00, sala 09)

| | Original | Traducción |
|---|---|---|
| | (sin mensaje) (al azar, hasta 20 de 100) | |
| `p48:97F0`<br>al azar, hasta 60 de 100 | キャンベル『ホフクでトラックなどの下にかくれ<br>ることもタイセツだ・・OVER ▽ | CAMPBELL: También es importante esconderse arrastrándose debajo de los camiones... CAMBIO |
| `p48:9814`<br>al azar, hasta 100 de 100 | キャンベル『北むきのトラックには入ることがで<br>きる・・・OVER ▽ | CAMPBELL: En los camiones que miran al norte se puede entrar... CAMBIO |

**Ficha 15** (siempre)

| | Original | Traducción |
|---|---|---|
| | (sin mensaje) (al azar, hasta 25 de 100) | |
| `p48:9636`<br>al azar, hasta 35 de 100 | キャンベル『たたかうべき時はたたかう。たおす<br>べき時はたおす。戦場とシューティ<br>ングゲームの基本だ・・OVER ▽ | CAMPBELL: Lucha cuando haya que luchar. Derriba cuando haya que derribar. Es lo básico del campo de batalla y de los juegos de disparos... CAMBIO |
| `p48:9670`<br>al azar, hasta 45 de 100 | キャンベル『ニンムはセッショクをさけることで<br>テキをハイジョすることではない。<br>これまで見たアクションエイガのこ<br>とはわすれろ・・・OVER ▽ | CAMPBELL: La misión es evitar el contacto, no eliminar al enemigo. Olvídate de las películas de acción que hayas visto... CAMBIO |
| `p48:972C`<br>al azar, hasta 55 de 100 | キャンベル『テキの立場になってかんがえろ。イ<br>ッテンしてそのチイキをシュビする<br>テキの指令カンやゲームデザイナー<br>になったつもりでかんがえろ。 ▼<br>見えなかったものが見えてくるはず<br>だ・・・OVER ▽ | CAMPBELL: Ponte en el lugar del enemigo. Piensa como el comandante que vigila la zona, o como el diseñador del juego.<br>Verás lo que no veías... CAMBIO |
| `p48:9790`<br>al azar, hasta 65 de 100 | キャンベル『ホキュウがカンゼンにできないとい<br>うジョウキョウをソウテイしてケイ<br>カクをたてろ・・・OVER ▽ | CAMPBELL: Haz tus planes contando con que no podrás reabastecerte del todo... CAMBIO |
| `p48:986E`<br>al azar, hasta 75 de 100 | キャンベル『テキに発見される場合、そのだいい<br>ちはモクシによるもの。だいには音<br>によるものだ。 ▼<br>音はジョウオンにおいてイチビョウ<br>カンにおよそ340メートルすすむ<br>。かざむきひとつでトホウもないキ<br>ョリまでとどいてしまう。 ▼<br>音をたてずにコウドウしろ。音をた<br>てたらすぐさまオウセンのかまえに<br>はいれ・・・OVER ▽ | CAMPBELL: Cuando el enemigo te descubre, es primero por la vista y luego por el oído.<br>A temperatura normal, el sonido recorre unos 340 metros por segundo. Con el viento a favor llega lejísimos.<br>Muévete sin hacer ruido. Si haces ruido, prepárate para luchar enseguida... CAMBIO |
| `p48:9AB8`<br>al azar, hasta 85 de 100 | キャンベル『よう兵やテキヘイキにかんすること<br>はヨウヘイ上がりのジョウホウヤ、<br>ジョージ・ケスラーにきいてみろ。<br>やつのしらないことはない。 ▼<br>以前、うちで軍事コモンとしてはた<br>らいていたこともある。<br>シン用して大ジョウブな男だ。<br>シュウハスウは140・93だ。 ▼<br>ジョウホウリョウはこっちもちだが<br>・・・クジラリョウリのみせのこと<br>なんかきくなよ・・・OVER ▽ | CAMPBELL: Para lo de mercenarios y armas enemigas, pregunta al informador ex mercenario George Kessler. No hay nada que no sepa.<br>Trabajó con nosotros de asesor militar. Es de fiar. La frecuencia es 140.93.<br>La información la pagamos nosotros, pero... no le preguntes por restaurantes de ballena... CAMBIO |
| `p48:9CC7`<br>al azar, hasta 100 de 100 | キャンベル『こまったことがあればマクドネル・<br>ミラーに連絡してみろ。<br>もとうちのサバイバル・マスターだ<br>。じつにやくにたつ男だ。 ▼<br>アイデアマンでもある。かれにそう<br>だんしてみるといい。なにかカイケ<br>ツアンをだしてくれるだろう。 ▼<br>シュウハスウは140・38だ。<br>・・・OVER ▽ | CAMPBELL: Si tienes un problema, llama a McDonnell Miller. Era nuestro maestro de supervivencia. Un hombre muy útil.<br>También tiene ideas. Consúltale. Te dará alguna solución.<br>La frecuencia es 140.38... CAMBIO |

#### 140.38

Hablan: マスター. La conversación de `p48:80AF`, con 15 fichas.

**Ficha 0** (banderas 7A 52, con todas puestas)

| | Original | Traducción |
|---|---|---|
| `p48:95E9` | マスター『ライターとスプレーのカンがあれば<br>カエンホウシャキのかわりになるぞ<br> ▽ | MASTER: Con un mechero y un bote de spray tienes un lanzallamas de recambio. |

**Ficha 1** (banderas 7A 51, con todas puestas)

| | Original | Traducción |
|---|---|---|
| `p48:95E9` | マスター『ライターとスプレーのカンがあれば<br>カエンホウシャキのかわりになるぞ<br> ▽ | MASTER: Con un mechero y un bote de spray tienes un lanzallamas de recambio. |

**Ficha 2** (banderas 7B 50 7A, con todas puestas)

| | Original | Traducción |
|---|---|---|
| `p48:95AF` | マスター『SNAKE、やつはモンスターだ。<br>スデではかち目はない。あたまをつ<br>かえ！なにかブキになるのもがある<br>はずだ ▽ | MASTER: SNAKE, es un monstruo. Con las manos no tienes nada que hacer. ¡Usa la cabeza! Tiene que haber algo que sirva de arma. |

**Ficha 3** (banderas 47 49, con todas puestas)

| | Original | Traducción |
|---|---|---|
| `p48:94AF` | マスター『チーズなら・・・もうわかっている<br>とおもうが、CレーションのB3ユ<br>ニットの中に入っている。 ▼<br>ネズミどもをおびきよせるにはもっ<br>てこいじゃないか。 ▼<br>カンケイないがチーズホンデューの<br>おいしいミセをしってるんだが・・<br>今ど、たべにいこうか。<br>・・・OVER ▽ | MASTER: El queso... ya lo sabrás, está en la unidad B3 de la ración C.<br>Perfecto para atraer a las ratas, ¿no?<br>No tiene nada que ver, pero conozco un sitio con una fondue de queso buenísima... ¿vamos a comer un día?... CAMBIO |

**Ficha 4** (banderas 40 7D, con todas puestas, en la zona 13, sala 04)

| | Original | Traducción |
|---|---|---|
| `p48:9447` | マスター『そうだ！チョコレートならCレーシ<br>ョンの中にあるじゃないか？Cレー<br>ションの中でもB1ユニットに注目<br>してみろ。 ▼<br>チョコレートが入っている。それで<br>リュウサンを化合できる。<br>・・・OVER ▽ | MASTER: ¡Eso es! En la ración C hay chocolate, ¿no? Mira la unidad B1 de la ración C.<br>Lleva chocolate. Con eso puedes combinar el ácido sulfúrico... CAMBIO |

**Ficha 5** (banderas 40 7E, con todas puestas, en la zona 13, sala 04)

| | Original | Traducción |
|---|---|---|
| `p48:9394` | マスター『ノウリュウサンのタイショ法？・・<br>そうさなカセイソーダをふくむなに<br>かがあればチュウワできるが・・ ▼<br>そうだっ！・・・チョコレートをも<br>ってるか？チョコレートがあればな<br>んとかなる。 ▼<br>リュウサンはチョコレートのトウル<br>イと化合してタンソとガムジョウ物<br>になるんだ。C12H22O11・<br>・・ニトウルイ。 ▼<br>チョコレートをさがしてみろ<br>・・・OVER ▽ | MASTER: ¿Cómo tratar el ácido sulfúrico concentrado?... a ver, algo con sosa cáustica lo neutralizaría...<br>¡Eso es!... ¿tienes chocolate? Con chocolate te apañas.<br>El ácido sulfúrico se combina con el azúcar del chocolate y da carbono y una sustancia gomosa. C12H22O11... un disacárido.<br>Busca chocolate... CAMBIO |

**Ficha 6** (banderas 78 3A, con todas puestas)

| | Original | Traducción |
|---|---|---|
| `p48:927F` | マスター『スネークにこんなことをいうのはな<br>んだがヘビはゼッコウのショクリョ<br>ウとなる。 ▼<br>ドクヘビならトウブをおとしてナイ<br>ゾウをぬき、かわをはがしてからや<br>いてたべる。 ▼<br>キセイチュウがおおいので生やけジ<br>ョウタイでたべるのはさけた方がい<br>い。・・・OVER ▽ | MASTER: Es raro decírselo a un Snake, pero las serpientes son un alimento excelente.<br>Si es venenosa, córtale la cabeza, sácale las tripas, quítale la piel y ásala.<br>Tiene muchos parásitos: mejor no comerla poco hecha... CAMBIO |

**Ficha 7** (banderas 2C 81, con todas puestas)

| | Original | Traducción |
|---|---|---|
| `p48:9554` | マスター『クシャミをとめるにはコップいっぱ<br>いの水を7カイに分けてのみ、その<br>ご4ビュウカンいきをとめる。<br>意外ときくぞ。 ▼<br>それでもダメならカゼぐすりをのむ<br>んだな・・・OVER ▽ | MASTER: Para dejar de estornudar, bebe un vaso de agua en 7 tragos y luego aguanta la respiración 4 segundos. Funciona más de lo que parece.<br>Si ni así, tómate el medicamento para el resfriado... |

**Ficha 8** (banderas 3B 3F, con todas puestas)

| | Original | Traducción |
|---|---|---|
| | (sin mensaje) (al azar, hasta 30 de 100) | |
| `p48:8DEE`<br>al azar, hasta 40 de 100 | マスター『エイユウとヒキョウ者のちがいはキ<br>ョウフをかんじるかどうかではない<br> ▼<br>キョウフをコクフクしてなすべきこ<br>とをするセイシン力があるかどうか<br>だ・・・OVER ▽ | MASTER: La diferencia entre un héroe y un cobarde no es si siente miedo.<br>Es si tiene la fuerza de ánimo para vencer el miedo y hacer lo que hay que hacer... CAMBIO |
| `p48:8E40`<br>al azar, hasta 50 de 100 | マスター『ショウガイが人間のいしをつよくす<br>るのだ・・・OVER ▽ | MASTER: Los obstáculos hacen más fuerte la voluntad del hombre... CAMBIO |
| `p48:8E60`<br>al azar, hasta 55 de 100 | マスター『さいごまであきらめず生きのびびる<br>ためにサイダイゲンのドリョクをし<br>ろ！・・・OVER ▽ | MASTER: ¡No te rindas hasta el final: haz todo lo posible por sobrevivir!... CAMBIO |
| `p48:8E8F`<br>al azar, hasta 60 de 100 | マスター『サバイバルとはセイシン的ゲンカイ<br>のモンダイで、生きのびるイシがケ<br>ッテイヨウインとなる。<br>・・・OVER ▽ | MASTER: La supervivencia es cuestión de límites mentales: la voluntad de sobrevivir es lo que decide... CAMBIO |
| `p48:8EC9`<br>al azar, hasta 65 de 100 | マスター『さびしさというのは心のスキマにし<br>のびこんでくるものだ。<br>その心のスキマはタイクツしたとき<br>にできる。・・・OVER ▽ | MASTER: La soledad se cuela por los huecos del corazón. Y esos huecos se abren cuando te aburres... CAMBIO |
| `p48:8F08`<br>al azar, hasta 70 de 100 | マスター『戦場でのハンダンにモハンカイトウ<br>はない。<br>自分をしんじろ。・・・OVER ▽ | MASTER: En el campo de batalla no hay respuestas modelo. Confía en ti... CAMBIO |
| `p48:8F34`<br>al azar, hasta 75 de 100 | マスター『ショクゴの30分間はゲームをさけ<br>るべきだ。ショウカのためイへケツ<br>エキがあつまっているのであたまの<br>カイテンがにぶくなっている。 ▼<br>注意力がもっともテイカしている時<br>間だ。だからショクゴ30分はプレ<br>イをさけたほうがいい。OVER ▽ | MASTER: Después de comer hay que evitar los juegos durante 30 minutos. La sangre se va al estómago para la digestión y la cabeza va más lenta.<br>Es cuando la atención está más baja. Así que mejor no jugar en los 30 minutos de después de comer. CAMBIO |
| `p48:8FB2`<br>al azar, hasta 80 de 100 | マスター『水分をおぎなうさい、いちどに10<br>0CC以上はのまない方がいい。 ▼<br>体内に水分をキュウシュウするとき<br>に体おんと水おんのさだけエネルギ<br>ーをショウモウする。 ▼<br>とり入れた水のオンドを体おんまで<br>ひき上げるからだ。さらにケツエキ<br>がうすくなるため、あたまのはたら<br>きがその間、にぶる。 ▼<br>だからジュースをのみながらのプレ<br>イはキケンだ。・・・OVER<br> ▽ | MASTER: Al beber, mejor no tomar más de 100 cc de una vez.<br>Al absorber el agua, el cuerpo gasta energía por la diferencia entre su temperatura y la del agua,<br>porque la sube hasta la del cuerpo. Y la sangre se aclara, así que mientras tanto la cabeza va más lenta.<br>Por eso es peligroso jugar bebiendo zumo... CAMBIO |
| `p48:9071`<br>al azar, hasta 85 de 100 | マスター『ダエキをのむことはあってもゼッタ<br>イにはいてはいけない。 ▼<br>ジメンやハについたダエキでどのテ<br>イドのヒロウドかを見ぬかれるしツ<br>ウカした時間もスイテイされる。 ▼<br>だから、エキのプラットフォームで<br>ツバをはくのはキケンだ。<br>・・・OVER ▽ | MASTER: La saliva puedes tragarla, pero nunca escupirla.<br>Por la saliva en el suelo o en las hojas se sabe lo cansado que estás y se calcula cuándo pasaste.<br>Así que escupir en el andén de una estación es peligroso... CAMBIO |
| `p48:90EB`<br>al azar, hasta 90 de 100 | マスター『やってしまうんだ、できるんだとい<br>うかんじでカクシンをもってジッコ<br>ウする。 ▼<br>セイコウした時のイメージをいだき<br>、間ちがってもGAME　OVE<br>Rになった自分をソウゾウしては<br>いけない。 ▼<br>自分をはげまし、アンジをかけるの<br>だ。・・・OVER ▽ | MASTER: Hazlo convencido, pensando «lo voy a hacer, puedo hacerlo».<br>Imagínate cuando lo consigas, y nunca, ni por error, te imagines en GAME OVER.<br>Anímate, sugestiónate... CAMBIO |
| `p48:916C`<br>al azar, hasta 100 de 100 | マスター『ながしたアセのリョウがながすチの<br>リョウをすくなくし、ながしたなみ<br>だのリョウがGAME　OVER<br>をすくなくする。・・OVER ▽ | MASTER: Cuanto más sudor derramas, menos sangre derramas; y cuantas más lágrimas, menos GAME OVER... CAMBIO |

**Ficha 9** (banderas 21 71 80 5A, con todas puestas)

| | Original | Traducción |
|---|---|---|
| `p48:91F9` | マスター『WIS・OHIO・・・さかさによ<br>んでみろ。これはモジではなくてス<br>ウジだ。MARVのシュウハスウが<br>わかる。 ▼<br>ただしHが小文じなのを注意しろよ<br>。アンゴウでもなんでもなかったん<br>だ。キミはさかさにみていただけな<br>んだよ。 ▼<br>0140・51M・・・OVER ▽ | MASTER: WIS OHIO... léelo del revés. No son letras, son cifras. Te dará la frecuencia de MARV.<br>Pero fíjate en que la H es minúscula. No era una clave ni nada. Solo lo estabas mirando del revés.<br>0140.51M... CAMBIO |

**Ficha 10** (banderas 21 71 7F 5A, con todas puestas)

| | Original | Traducción |
|---|---|---|
| `p48:91AF` | マスター『WIS・OHIO・・・<br>Hだけが小文じか？<br>なるほど！これは・・・デジタルす<br>うじだよ。 ▼<br>SNAKE。もうわかったはずだ。<br>・・・OVER ▽ | MASTER: WIS OHIO... ¿solo la H en minúscula? ¡Ya veo! Esto son... cifras digitales.<br>SNAKE. Ya deberías haberlo pillado... CAMBIO |

**Ficha 11** (banderas 20 82 1F 5A, con todas puestas)

| | Original | Traducción |
|---|---|---|
| `p48:9300` | マスター『マメやこくもつならCレーションの<br>中にあるじゃないか。<br>Cレーションの中でもB2ユニット<br>の中身に注目してみろ。 ▼<br>マメとミートボールのトマトニ、マ<br>メとフランクフルトのトマトニ、ギ<br>ュウニクとポテトニがメニューの中<br>にある。 ▼<br>ハトをよびよせるにはジュウブンだ<br>。・・・OVER ▽ | MASTER: Judías o grano: en la ración C los tienes. Mira lo que lleva la unidad B2 de la ración C.<br>En el menú hay judías con albóndigas en tomate, judías con salchichas en tomate y ternera con patatas.<br>Basta para atraer a las palomas... CAMBIO |

**Ficha 12** (banderas 83, con todas puestas)

| | Original | Traducción |
|---|---|---|
| | (sin mensaje) (al azar, hasta 40 de 100) | |
| `p48:8FB2`<br>al azar, hasta 70 de 100 | マスター『水分をおぎなうさい、いちどに10<br>0CC以上はのまない方がいい。 ▼<br>体内に水分をキュウシュウするとき<br>に体おんと水おんのさだけエネルギ<br>ーをショウモウする。 ▼<br>とり入れた水のオンドを体おんまで<br>ひき上げるからだ。さらにケツエキ<br>がうすくなるため、あたまのはたら<br>きがその間、にぶる。 ▼<br>だからジュースをのみながらのプレ<br>イはキケンだ。・・・OVER<br> ▽ | MASTER: Al beber, mejor no tomar más de 100 cc de una vez.<br>Al absorber el agua, el cuerpo gasta energía por la diferencia entre su temperatura y la del agua,<br>porque la sube hasta la del cuerpo. Y la sangre se aclara, así que mientras tanto la cabeza va más lenta.<br>Por eso es peligroso jugar bebiendo zumo... CAMBIO |
| `p48:9071`<br>al azar, hasta 100 de 100 | マスター『ダエキをのむことはあってもゼッタ<br>イにはいてはいけない。 ▼<br>ジメンやハについたダエキでどのテ<br>イドのヒロウドかを見ぬかれるしツ<br>ウカした時間もスイテイされる。 ▼<br>だから、エキのプラットフォームで<br>ツバをはくのはキケンだ。<br>・・・OVER ▽ | MASTER: La saliva puedes tragarla, pero nunca escupirla.<br>Por la saliva en el suelo o en las hojas se sabe lo cansado que estás y se calcula cuándo pasaste.<br>Así que escupir en el andén de una estación es peligroso... CAMBIO |

**Ficha 13** (banderas 96, con todas puestas)

| | Original | Traducción |
|---|---|---|
| `p48:960E` | マスター『セキガイセンセンサーはタバコのけ<br>むりで見えるようになる<br>・・・OVER ▽ | MASTER: Los sensores de infrarrojos se ven con el humo del tabaco... |

**Ficha 14** (banderas 94, con todas puestas)

| | Original | Traducción |
|---|---|---|
| | (sin mensaje) (al azar, hasta 30 de 100) | |
| `p48:8DEE`<br>al azar, hasta 40 de 100 | マスター『エイユウとヒキョウ者のちがいはキ<br>ョウフをかんじるかどうかではない<br> ▼<br>キョウフをコクフクしてなすべきこ<br>とをするセイシン力があるかどうか<br>だ・・・OVER ▽ | MASTER: La diferencia entre un héroe y un cobarde no es si siente miedo.<br>Es si tiene la fuerza de ánimo para vencer el miedo y hacer lo que hay que hacer... CAMBIO |
| `p48:8E40`<br>al azar, hasta 50 de 100 | マスター『ショウガイが人間のいしをつよくす<br>るのだ・・・OVER ▽ | MASTER: Los obstáculos hacen más fuerte la voluntad del hombre... CAMBIO |
| `p48:8E60`<br>al azar, hasta 55 de 100 | マスター『さいごまであきらめず生きのびびる<br>ためにサイダイゲンのドリョクをし<br>ろ！・・・OVER ▽ | MASTER: ¡No te rindas hasta el final: haz todo lo posible por sobrevivir!... CAMBIO |
| `p48:8E8F`<br>al azar, hasta 60 de 100 | マスター『サバイバルとはセイシン的ゲンカイ<br>のモンダイで、生きのびるイシがケ<br>ッテイヨウインとなる。<br>・・・OVER ▽ | MASTER: La supervivencia es cuestión de límites mentales: la voluntad de sobrevivir es lo que decide... CAMBIO |
| `p48:8EC9`<br>al azar, hasta 65 de 100 | マスター『さびしさというのは心のスキマにし<br>のびこんでくるものだ。<br>その心のスキマはタイクツしたとき<br>にできる。・・・OVER ▽ | MASTER: La soledad se cuela por los huecos del corazón. Y esos huecos se abren cuando te aburres... CAMBIO |
| `p48:8F08`<br>al azar, hasta 70 de 100 | マスター『戦場でのハンダンにモハンカイトウ<br>はない。<br>自分をしんじろ。・・・OVER ▽ | MASTER: En el campo de batalla no hay respuestas modelo. Confía en ti... CAMBIO |
| `p48:8F34`<br>al azar, hasta 75 de 100 | マスター『ショクゴの30分間はゲームをさけ<br>るべきだ。ショウカのためイへケツ<br>エキがあつまっているのであたまの<br>カイテンがにぶくなっている。 ▼<br>注意力がもっともテイカしている時<br>間だ。だからショクゴ30分はプレ<br>イをさけたほうがいい。OVER ▽ | MASTER: Después de comer hay que evitar los juegos durante 30 minutos. La sangre se va al estómago para la digestión y la cabeza va más lenta.<br>Es cuando la atención está más baja. Así que mejor no jugar en los 30 minutos de después de comer. CAMBIO |
| `p48:8FB2`<br>al azar, hasta 80 de 100 | マスター『水分をおぎなうさい、いちどに10<br>0CC以上はのまない方がいい。 ▼<br>体内に水分をキュウシュウするとき<br>に体おんと水おんのさだけエネルギ<br>ーをショウモウする。 ▼<br>とり入れた水のオンドを体おんまで<br>ひき上げるからだ。さらにケツエキ<br>がうすくなるため、あたまのはたら<br>きがその間、にぶる。 ▼<br>だからジュースをのみながらのプレ<br>イはキケンだ。・・・OVER<br> ▽ | MASTER: Al beber, mejor no tomar más de 100 cc de una vez.<br>Al absorber el agua, el cuerpo gasta energía por la diferencia entre su temperatura y la del agua,<br>porque la sube hasta la del cuerpo. Y la sangre se aclara, así que mientras tanto la cabeza va más lenta.<br>Por eso es peligroso jugar bebiendo zumo... CAMBIO |
| `p48:9071`<br>al azar, hasta 85 de 100 | マスター『ダエキをのむことはあってもゼッタ<br>イにはいてはいけない。 ▼<br>ジメンやハについたダエキでどのテ<br>イドのヒロウドかを見ぬかれるしツ<br>ウカした時間もスイテイされる。 ▼<br>だから、エキのプラットフォームで<br>ツバをはくのはキケンだ。<br>・・・OVER ▽ | MASTER: La saliva puedes tragarla, pero nunca escupirla.<br>Por la saliva en el suelo o en las hojas se sabe lo cansado que estás y se calcula cuándo pasaste.<br>Así que escupir en el andén de una estación es peligroso... CAMBIO |
| `p48:90EB`<br>al azar, hasta 90 de 100 | マスター『やってしまうんだ、できるんだとい<br>うかんじでカクシンをもってジッコ<br>ウする。 ▼<br>セイコウした時のイメージをいだき<br>、間ちがってもGAME　OVE<br>Rになった自分をソウゾウしては<br>いけない。 ▼<br>自分をはげまし、アンジをかけるの<br>だ。・・・OVER ▽ | MASTER: Hazlo convencido, pensando «lo voy a hacer, puedo hacerlo».<br>Imagínate cuando lo consigas, y nunca, ni por error, te imagines en GAME OVER.<br>Anímate, sugestiónate... CAMBIO |
| `p48:916C`<br>al azar, hasta 100 de 100 | マスター『ながしたアセのリョウがながすチの<br>リョウをすくなくし、ながしたなみ<br>だのリョウがGAME　OVER<br>をすくなくする。・・OVER ▽ | MASTER: Cuanto más sudor derramas, menos sangre derramas; y cuantas más lágrimas, menos GAME OVER... CAMBIO |

#### 140.40

Hablan: ノルデン. La conversación de `p48:8112`, con 7 fichas.

**Ficha 0** (banderas 46 49, con todas puestas)

| | Original | Traducción |
|---|---|---|
| `p49:A38E` | ノルデン『それは、モウドクをもつといわれる<br>ザンジバーハムスターじゃないかな<br>ネズミは全世界に1183シュ。 ▼<br>その中でハムスターはゲッシルイ、<br>ネズミカにぞくし、タイチョウ25<br>から28センチ、西ヨーロッパから<br>シベリア、イラクにすんでいる。 ▼<br>そのヘンシュはハムスターのイエネ<br>ズミ化したものだろう。イエネズミ<br>はケイカイ心がつよく、人前ではス<br>からでることはない。 ▼<br>・・・シュショクはチーズ。<br>そうだ！？チーズだ。チーズがあれ<br>ばおびき出せるぞ！！<br>チーズをもっとらんか？？ ▼<br>ザンネンだ。わたしは今、タクハイ<br>ビンのピザを注文したところだ。<br>すまん・・・OVER ▽ | NORDEN: Eso será el hámster de Zanzíbar, del que dicen que es muy venenoso. Hay 1.183 especies de ratas en el mundo.<br>El hámster es un roedor de la familia de las ratas, de 25 a 28 cm, que vive desde Europa occidental hasta Siberia e Irak.<br>Esa variedad será un hámster convertido en rata doméstica. Las ratas domésticas son muy desconfiadas y no salen de su nido delante de la gente.<br>...Su comida principal es el queso. ¡¿Eso es?! Queso. ¡¡Con queso lo puedes hacer salir!! ¿¿No tienes queso??<br>Qué pena. Yo acabo de pedir una pizza a domicilio. Lo siento... CAMBIO |

**Ficha 1** (banderas 3A 78, con todas puestas)

| | Original | Traducción |
|---|---|---|
| `p49:A2FD` | ノルデン『おそらくボアのイッシュだろう。ヤ<br>コウセイでセイシツはおとなしい。<br>だがヘビはおおぐらいだからな。な<br>んでもたべるぞ。 ▼<br>とくにレーションなんかはコウブツ<br>だろうな。はやくすてた方がいい。<br>スペース・キーですてるんだ。 ▼<br>ヘビがタマゴのカラのところに来た<br>時にすてろ。・・・OVER ▽ | NORDEN: Seguramente una especie de boa. Nocturna y mansa. Pero las serpientes comen muchísimo. Se comen de todo.<br>Las raciones, sobre todo, les encantarán. Mejor tíralas cuanto antes. Tíralas con la barra espaciadora.<br>Tíralas cuando la serpiente llegue a la cáscara del huevo... CAMBIO |

**Ficha 2** (banderas 3C 79, con todas puestas)

| | Original | Traducción |
|---|---|---|
| `p49:A1CD` | ノルデン『それはザンジバー・モリフクロウだ<br>よ。フクロウはしってのとうり、ヤ<br>コウセイのニクショクチョウで全世<br>界にやく120シュいる。 ▼<br>ザンジバーモリフクロウはゼンチョ<br>ウが20センチ、中央アジアだけに<br>セイソクする。 ▼<br>タマゴはしろ、2から7ニチカンカ<br>クでうみ、ホウランはメスだけがお<br>こなう。イデンシカイリョウにより<br>スウジツカンでタマゴがかえる。 ▼<br>このフクロウはヤコウセイでしかも<br>セイカクにニチボツゴ、なくことか<br>らザンジバーランドでは時計がわり<br>にしているらしい。 ▼<br>いちど、なにかのリユウでないたフ<br>クロウのコエにかんちがいして夜を<br>ひるとまちがえたことがあるくらい<br>だ・・・OVER ▽ | NORDEN: Es el búho de los bosques de Zanzíbar. Como sabes, los búhos son rapaces nocturnas, hay unas 120 especies en el mundo.<br>El búho de Zanzíbar mide 20 cm y solo vive en Asia central.<br>Los huevos son blancos, los pone cada 2 a 7 días y solo los incuba la hembra. Con la modificación genética, salen del huevo en pocos días.<br>Es nocturno y ulula justo después de la puesta del sol, así que en Zanzibar Land parece que lo usan de reloj.<br>Una vez, porque un búho ululó por algo, confundieron la noche con el día, fíjate... CAMBIO |

**Ficha 3** (banderas 38 97, con todas puestas)

| | Original | Traducción |
|---|---|---|
| `p49:A13F` | ノルデン『きみのハナシだけではなんのタマゴ<br>かわからんな。ハチュウルイかチョ<br>ウルイのタマゴであることはたしか<br>だが・・・ ▼<br>あっそうそう、おでんのタマゴはキ<br>リクチはしろでなければいけないが<br>あじはしみていなければならない。<br>・・・OVER ▽ | NORDEN: Con lo que me cuentas no sé de qué es el huevo. De reptil o de ave, seguro, pero...<br>Ah, por cierto: el huevo del oden tiene que estar cortado bien blanco, pero empapado de sabor... CAMBIO |

**Ficha 4** (banderas 39 98, con todas puestas)

| | Original | Traducción |
|---|---|---|
| `p49:A13F` | ノルデン『きみのハナシだけではなんのタマゴ<br>かわからんな。ハチュウルイかチョ<br>ウルイのタマゴであることはたしか<br>だが・・・ ▼<br>あっそうそう、おでんのタマゴはキ<br>リクチはしろでなければいけないが<br>あじはしみていなければならない。<br>・・・OVER ▽ | NORDEN: Con lo que me cuentas no sé de qué es el huevo. De reptil o de ave, seguro, pero...<br>Ah, por cierto: el huevo del oden tiene que estar cortado bien blanco, pero empapado de sabor... CAMBIO |

**Ficha 5** (banderas 1F 75 5A 99, con todas puestas)

| | Original | Traducción |
|---|---|---|
| `p49:A024` | ノルデン『それはデンショばとにクンレンされ<br>たモリバトだ。ハトは全世界になん<br>と260シュもいる。 ▼<br>ゼンチョウはヤク40センチ、ヨー<br>ロッパから南アジアにブンプする。<br>そのハトはおそらくマルフ博士が連<br>れてきたものだろう。 ▼<br>ハトは物音にビンカンでショウシン<br>者だ。ちかづくとケハイでとび立っ<br>てしまう。そのくせ、ごうつくばり<br>の大ぐらい。 ▼<br>シュショクはこくもつ・・・<br>そうだ！マメかポテトがあればおび<br>きよせられるぞ。 ▼<br>わたしは今、ポテトのLサイズをた<br>のんだところだ。・・・わるいな。<br>戦場にハンバーガーやさんはないわ<br>な？・・・OVER ▽ | NORDEN: Es una paloma torcaz amaestrada como mensajera. Hay nada menos que 260 especies de palomas en el mundo.<br>Mide unos 40 cm y vive desde Europa hasta el sur de Asia. Esa paloma la trajo seguramente el doctor Marv.<br>Las palomas son sensibles al ruido y miedosas. En cuanto te notan, echan a volar. Y aun así son glotonas.<br>Comen sobre todo grano... ¡Eso es! Con judías o patatas las puedes atraer.<br>Yo acabo de pedir unas patatas grandes... perdona. ¿En el campo de batalla no hay hamburgueserías, verdad?... CAMBIO |

**Ficha 6** (banderas 76 0E, con todas puestas)

| | Original | Traducción |
|---|---|---|
| `p48:9FC3` | ノルデン『FOX　HOUNDではどうしてコ<br>ードネームに動物の名前をつかうの<br>かね？戦場に動物がにあうというの<br>は人間のおもい上がりだ。 ▼<br>私にはリカイできんな<br>・・・OVER ▽ | NORDEN: ¿Por qué en FOX HOUND usan nombres de animales para las claves? Creer que los animales pegan con el campo de batalla es soberbia humana.<br>No lo entiendo... CAMBIO |

#### 140.15

Hablan: ホーリー, SNAKE. La conversación de `p48:813F`, con 10 fichas.

**Ficha 0** (banderas 9A 84, con todas puestas)

| | Original | Traducción |
|---|---|---|
| `p48:88E1` | ホーリー『SNAKE！音・・・音がするの。<br>わたしの左から・・・エレベーター<br>の音がする。 ▼<br>それから・・・右からはポンプのよ<br>うな音がきこえるわ。前とうしろか<br>らは水のながれる音がする ▽ | HOLLY: ¡SNAKE! Ruidos... oigo ruidos. A mi izquierda... el ruido de un ascensor.<br>Y a la derecha... algo como una bomba de agua. Delante y detrás, el ruido de agua corriendo. |
| `p48:8944`<br>1 cuadro después | SNAKE『前ごから水の音・・・右からポンプ<br>音・・・左からエレベーター音？<br>音のマップができたな ▽ | SNAKE: Agua delante y detrás... una bomba a la derecha... ¿un ascensor a la izquierda? Ya tengo un mapa de ruidos. |
| `p48:897A`<br>1 cuadro después | ホーリー『SNAKE！かれらわたしのムセン<br>キに気がつかなかったみたい。<br>だけどはやくきてっ！まってるわ ▽ | HOLLY: ¡SNAKE! Parece que no se han dado cuenta de mi radio. ¡Pero ven rápido! Te espero. |

**Ficha 1** (banderas 4C 7A, con todas puestas)

| | Original | Traducción |
|---|---|---|
| `p48:87CC` | ホーリー『今はタイミングがわるいの！・・・<br>あとにして、ゴメン ▽ | HOLLY: ¡Ahora es mal momento!... luego, perdona. |

**Ficha 2** (banderas 85, con todas puestas)

| | Original | Traducción |
|---|---|---|
| `p48:8BE7` | ホーリー『収容所の中のことはわたしでもわか<br>らないわ。<br>ゴメン・・・じゃあね ▽ | HOLLY: Ni yo sé lo que hay dentro del campo de prisioneros. Perdona... adiós. |

**Ficha 3** (banderas 92 86 5A, con todas puestas)

| | Original | Traducción |
|---|---|---|
| `p48:8A90` | ホーリー『10Fから20Fにはラセンカイダ<br>ンがあったはず。すこしきついけど<br>ウンドウになるわ・・じゃあね ▽ | HOLLY: De la 10F a la 20F tiene que haber una escalera de caracol. Cansa un poco, pero es buen ejercicio... adiós. |

**Ficha 4** (banderas 87 1C 1B, con todas puestas)

| | Original | Traducción |
|---|---|---|
| `p48:8DC3` | ホーリー『グレネード？<br>・・・タワービルの10かいの南に<br>あるってきいたわ・・・じゃあね ▽ | HOLLY: ¿Granadas?... me han dicho que están al sur de la planta 10 de la Torre... adiós. |

**Ficha 5** (banderas 14 15 88, con todas puestas)

| | Original | Traducción |
|---|---|---|
| `p48:8D37` | ホーリー『タイクウミサイルはハインドDにソ<br>ウビするためにぬまの北東のブキコ<br>にあるってきいたけど。 ▼<br>・・・じゃあね ▽ | HOLLY: Me dijeron que los misiles antiaéreos están en el almacén de armas al nordeste del pantano, para armar el Hind D.<br>...adiós. |

**Ficha 6** (banderas 89 58, con todas puestas)

| | Original | Traducción |
|---|---|---|
| `p48:8AE0` | ホーリー『ジライタンチキなら3Fにあるわ<br>・・・じゃあね ▽ | HOLLY: El detector de minas está en la 3F... adiós. |

**Ficha 7** (banderas 0C 8A, con todas puestas)

| | Original | Traducción |
|---|---|---|
| `p48:8AC3` | ホーリー『まよいのモリはコンパスもつかえな<br>いわ・・・じゃあね ▽ | HOLLY: En el bosque del extravío ni la brújula sirve... adiós. |

**Ficha 8** (banderas 5A 7A, con todas puestas)

| | Original | Traducción |
|---|---|---|
| | (sin mensaje) (al azar, hasta 25 de 100) | |
| `p48:89AD`<br>al azar, hasta 30 de 100 | ホーリー『タワービルはたかさ600メートル<br>、地下1F、地上1F、10F、<br>20F、30F、40F［R］。 ▼<br>20Fに北むきのベランダがある<br>わ・・じゃあね ▽ | HOLLY: La Torre mide 600 metros: B1, 1F, 10F, 20F, 30F y 40F [R].<br>En la 20F hay un balcón que mira al norte... adiós. |
| `p48:89FD`<br>al azar, hasta 35 de 100 | ホーリー『タワービルはザンジバーランドゼン<br>イキを見わたせるように作られた軍<br>事的なキョテンよ・・・じゃあね ▽ | HOLLY: La Torre es una base militar hecha para dominar toda Zanzibar Land... adiós. |
| `p48:8A36`<br>al azar, hasta 40 de 100 | ホーリー『エレベーターは3本あるわ。北エレ<br>ベーターがB1、1F、10Fにと<br>まり。 ▼<br>中央エレベーターが1F、20F、<br>南エレベーターが1F、30Fにと<br>まるわ・・・じゃあね ▽ | HOLLY: Hay 3 ascensores. El del norte para en B1, 1F y 10F.<br>El central en 1F y 20F, y el del sur en 1F y 30F... adiós. |
| `p48:8A90`<br>al azar, hasta 45 de 100 | ホーリー『10Fから20Fにはラセンカイダ<br>ンがあったはず。すこしきついけど<br>ウンドウになるわ・・じゃあね ▽ | HOLLY: De la 10F a la 20F tiene que haber una escalera de caracol. Cansa un poco, pero es buen ejercicio... adiós. |
| `p48:8780`<br>al azar, hasta 50 de 100 | ホーリー『ザンジバーランドには大ぜいのこど<br>もたちがいるの。世界各こくの戦ソ<br>ウコジ・・・ ▼<br>ムジャキなこどもたちだからガイは<br>ないわ・・・じゃあね ▽ | HOLLY: En Zanzibar Land hay muchos niños. Huérfanos de guerra de todo el mundo...<br>Son niños inocentes, no hacen daño... adiós. |
| `p48:87CC`<br>al azar, hasta 75 de 100 | ホーリー『今はタイミングがわるいの！・・・<br>あとにして、ゴメン ▽ | HOLLY: ¡Ahora es mal momento!... luego, perdona. |
| `p48:87EA`<br>al azar, hasta 80 de 100 | ホーリー『ここのドアはすべてコンピュータせ<br>いぎょされてるの。 ▼<br>それぞれのICカードがないとあけ<br>られないわ・・・じゃあね ▽ | HOLLY: Todas las puertas de aquí las controla un ordenador.<br>Sin la tarjeta IC de cada una no se abren... adiós. |
| `p48:8C0F`<br>al azar, hasta 85 de 100 | ホーリー『ザンジバービルとタワービルのスイ<br>ゲンはおなじよ。 ▼<br>つまりふたつのビルはスイコウでつ<br>ながっているということじゃない？<br>・・・じゃあね ▽ | HOLLY: El edificio Zanzíbar y la Torre tienen el mismo origen del agua.<br>¿O sea que los dos edificios están unidos por un canal, no?... adiós. |
| `p48:8C55`<br>al azar, hasta 90 de 100 | ホーリー『アオジャシンにはのってないけど ▼<br>ザンジバービルとタワービルは地下<br>でつながっているっていうこどもた<br>ちのウワサをきいたけど<br>・・じゃあね ▽ | HOLLY: No sale en los planos, pero<br>los niños dicen que el edificio Zanzíbar y la Torre están unidos por debajo de tierra... adiós. |
| `p48:8C9E`<br>al azar, hasta 100 de 100 | ホーリー『ザンジバーランドにはおおくのこど<br>もたちがいるでしょう？ ▼<br>だから、こどもたちが出入りできる<br>小さなかくれ場所がたくさんある<br>のよ・・・じゃあね ▽ | HOLLY: En Zanzibar Land hay muchos niños, ¿verdad?<br>Por eso hay muchos escondites pequeños por los que pueden entrar y salir los niños... adiós. |

**Ficha 9** (banderas 59 7A, con todas puestas)

| | Original | Traducción |
|---|---|---|
| | (sin mensaje) (al azar, hasta 30 de 100) | |
| `p48:85D3`<br>al azar, hasta 35 de 100 | ホーリー『ザンジバービルのコウゾウは地下2<br>かい、地上4かいだて。 ▼<br>1かいが中央指令室、カクノウコ、<br>エ場。 ▼<br>2かいはデッキ、3かいはケンキュ<br>ウかいはつフロア、4かいは兵士た<br>ちの生かつフロア。 ▼<br>B1はブキ、ダンヤクコ、B2は水<br>コウよ・・・じゃあね ▽ | HOLLY: El edificio Zanzíbar tiene 2 plantas bajo tierra y 4 encima.<br>La 1 es la sala de mando central, el hangar y la fábrica.<br>La 2 es la cubierta, la 3 la planta de investigación y desarrollo, la 4 la planta donde viven los soldados.<br>B1 es el almacén de armas y munición, B2 el canal... adiós. |
| `p48:865D`<br>al azar, hasta 40 de 100 | ホーリー『ザンジバービルにはエレベーターが<br>2本あるわ。 ▼<br>東エレベーターが4F、3F、2F<br>、1Fに止まり、西エレベーターは<br>2F、B1、B2にとまるの。 ▼<br>ここのエレベーターはOUTER<br>HEAVENとちがって自分で<br>よばないといけないのよ。 ▼<br>わかった？・・・じゃあね ▽ | HOLLY: El edificio Zanzíbar tiene 2 ascensores.<br>El del este para en 4F, 3F, 2F y 1F, el del oeste en 2F, B1 y B2.<br>Aquí, al contrario que en OUTER HEAVEN, al ascensor hay que llamarlo uno mismo.<br>¿Entendido?... adiós. |
| `p48:86E7`<br>al azar, hasta 45 de 100 | ホーリー『トイレなら4Fにあるわ。<br>4Fはね兵士たちの生かつ空間な<br>の ▼<br>だからサウナ、ショクドウ、ロッカ<br>ールーム、シュクシャなんかがある<br>の・・・じゃあね ▽ | HOLLY: Los aseos están en la 4F. La 4F es donde viven los soldados.<br>Por eso hay sauna, comedor, vestuario, dormitorios y demás... adiós. |
| `p48:8738`<br>al azar, hasta 50 de 100 | ホーリー『各かいのダストシュートはB2のゴ<br>ミショリ場へつながっているわ。 ▼<br>にげ道につかえるけどゴミショリキ<br>には気をつけてね・・・じゃあね ▽ | HOLLY: Los conductos de basura de cada planta llevan a la planta de residuos de B2.<br>Sirven para escapar, pero cuidado con la trituradora... adiós. |
| `p48:8780`<br>al azar, hasta 55 de 100 | ホーリー『ザンジバーランドには大ぜいのこど<br>もたちがいるの。世界各こくの戦ソ<br>ウコジ・・・ ▼<br>ムジャキなこどもたちだからガイは<br>ないわ・・・じゃあね ▽ | HOLLY: En Zanzibar Land hay muchos niños. Huérfanos de guerra de todo el mundo...<br>Son niños inocentes, no hacen daño... adiós. |
| `p48:87CC`<br>al azar, hasta 90 de 100 | ホーリー『今はタイミングがわるいの！・・・<br>あとにして、ゴメン ▽ | HOLLY: ¡Ahora es mal momento!... luego, perdona. |
| `p48:87EA`<br>al azar, hasta 95 de 100 | ホーリー『ここのドアはすべてコンピュータせ<br>いぎょされてるの。 ▼<br>それぞれのICカードがないとあけ<br>られないわ・・・じゃあね ▽ | HOLLY: Todas las puertas de aquí las controla un ordenador.<br>Sin la tarjeta IC de cada una no se abren... adiós. |
| `p48:8825`<br>al azar, hasta 100 de 100 | ホーリー『指令室にはこのヨウサイのゼンボウ<br>がわかるマップがあるわ。 ▼<br>注意して見て・・・じゃあね ▽ | HOLLY: En la sala de mando hay un mapa de toda la fortaleza.<br>Míralo bien... adiós. |

#### 140.93

Hablan: ケスラー, SNAKE. La conversación de `p48:8188`, con 8 fichas.

**Ficha 0** (banderas 50 7A, con todas puestas)

| | Original | Traducción |
|---|---|---|
| `p49:B5B9` | ケスラー『BIG　BOSS・・・ ▼<br>ウイリアム・モーガンとならぶデン<br>セツ的軍人。かれのソンザイはヨウ<br>兵たちの間でシンワと化している ▽ | KESSLER: BIG BOSS...<br>Un soldado legendario, a la altura de William Morgan. Entre los mercenarios es ya un mito. |
| `p49:B5FF`<br>1 cuadro después | SNAKE『そんなことはいい！やつのサイシン<br>のジョウホウがしりたい ▽ | SNAKE: ¡Eso da igual! Quiero lo último que se sepa de él. |
| `p49:B61E`<br>1 cuadro después | ケスラー『わかった・・だがこれはたんなるう<br>わさだぜ、いいか。3年前のOUT<br>ER　HEAVENカンラクでかれ<br>はヒン死のジュウショウをおった ▼<br>リョウテ、リョウアシ、右目、右み<br>みをうしないながらも、やつはかろ<br>うじて・・・生きていた。 ▼<br>そんなおり、東がわのボウクンが物<br>体と化したヤツに目をつけた。やつ<br>の軍人としてのサイノウがミリョク<br>だったのだろうよ。 ▼<br>やつらはペトロビッチ・マッドナー<br>のSNATCHERケイカクを<br>いそがせ、かれをそのジッケンバイ<br>タイとしてえらんだ。 ▼<br>サイバネティックス・オーガズムと<br>かいうジッケンらしい。つまりかれ<br>は人であって人でない。しんじられ<br>ねぇがな・・ ▼<br>これが本当だとすりゃ、SNAKE<br>、おまえにかち目はねえぞ！やつに<br>はどんなトクシュギジュツも通用し<br>ねえ。 ▼<br>SNAKE・・・あきらめろ・・・<br>かてねぇぜ、やつには。<br>・・・OVER ▽ | KESSLER: Vale... pero esto es solo un rumor, ¿eh? Hace tres años, en la caída de OUTER HEAVEN, quedó herido de muerte.<br>Perdió las dos manos, las dos piernas, el ojo derecho y la oreja derecha, pero de algún modo... seguía vivo.<br>Entonces un tirano del Este se fijó en lo que había quedado de él. Les atraería su talento de soldado.<br>Metieron prisa al plan SNATCHER de Pettrovich Madnar y lo eligieron para el experimento.<br>Algo llamado «organismo cibernético». O sea, que es un hombre y no lo es. Cuesta creerlo...<br>Si es verdad, SNAKE, ¡no tienes nada que hacer! Con él no vale ninguna técnica especial.<br>SNAKE... ríndete... no puedes con él... CAMBIO |

**Ficha 1** (banderas 3F 3E 62, con todas puestas)

| | Original | Traducción |
|---|---|---|
| `p49:B233` | ケスラー『NIGHT　SIGHT？<br>SNAKE、今NIGHT　SI<br>GHTといったか？！おそろしい<br>やつをテキにまわしちまったな。 ▼<br>NIGHT　SIGHTは北ベ<br>トナムでグリーンベレー以上にジャ<br>ングル戦にたけたといわれるデンセ<br>ツのゲリラブタイウィスパーズ ▼<br>の生きのこりだ。サイシンのカモフ<br>ラージュスーツをまとい、ステルス<br>。やつのすがたを目にしたのはひと<br>にぎりしかいねぇ。 ▼<br>このオレでさえみたことがねぇんだ<br>！これがすがたなきアンサツ者とい<br>われるゆえんだ。 ▼<br>SNAKE、あんたのコウウンもこ<br>のあたりでおわりかな<br>・・・OVER ▽ | KESSLER: ¿NIGHT SIGHT? SNAKE, ¿¡has dicho NIGHT SIGHT!? Te has buscado un enemigo terrible.<br>NIGHT SIGHT es un superviviente de los Whispers, la legendaria guerrilla de Vietnam del Norte, que dicen que en la selva era mejor que los boinas verdes.<br>Lleva el último traje de camuflaje: invisible. Solo un puñado de gente lo ha visto.<br>¡Ni yo lo he visto nunca! Por eso lo llaman el asesino sin figura.<br>SNAKE, puede que tu suerte se acabe por aquí... CAMBIO |

**Ficha 2** (banderas 37 36 9D, con todas puestas)

| | Original | Traducción |
|---|---|---|
| `p49:B1A9` | ケスラー『PREDATORか・・・<br>もとレックス・コマンド出身のハン<br>ターだ。ジャングルでのゲリラ戦を<br>もっとも得意としている。 ▼<br>ジャングルでのやつは人間ばなれし<br>ている。ベトナムの南イエメンでは<br>たったー人で2コ中タイをゼンメツ<br>させたといわれてる。OVER ▽ | KESSLER: PREDATOR... un cazador, antes del Rex Command. Su especialidad es la guerrilla en la selva.<br>En la selva no parece humano. Dicen que en Yemen del Sur de Vietnam aniquiló él solo 2 compañías. CAMBIO |

**Ficha 3** (banderas 33 32, con todas puestas)

| | Original | Traducción |
|---|---|---|
| `p49:B11B` | ケスラー『ULTRABOXか・・・<br>SAS、GSG9、UDT出以者で<br>コンセイされたミッシツ専門のアン<br>サツブタイだ。 ▼<br>どいつも戦ソウのプロだ。やつらは<br>まばたきひとつせずに人をころす。<br>同時にあいてにしてはふりだ。 ▼<br>ー人ずつ、かたずけるのがベストだ<br>ぜ・・・OVER ▽ | KESSLER: ULTRABOX... un comando de asesinos especialistas en espacios cerrados, hecho con gente de las SAS, el GSG9 y los UDT.<br>Todos son profesionales de la guerra. Matan sin pestañear. Enfrentarse a todos a la vez es imposible.<br>Lo mejor es acabar con ellos uno a uno... CAMBIO |

**Ficha 4** (banderas 87 1C 1B, con todas puestas)

| | Original | Traducción |
|---|---|---|
| `p49:B042` | ケスラー『RED　BLASTERか・<br>あかいバクハマとしてしられるソ<br>ビエトのルムンバ大学出のアンサ<br>ツ専門エリートだ。 ▼<br>やつのてはブービートラップをは<br>りめぐらし、あいてのあしどめを<br>しておいてからトクイのグレネー<br>ド・ランチャーでとどめをさす。 ▼<br>SNAKE、グレネードにはグレ<br>ネードでオウタイしろ！やつもま<br>た、なにかのショウヘキに身をか<br>くしているはず。 ▼<br>グレネードならそんな所でもコウ<br>ゲキできるぜ。・・・OVER ▽ | KESSLER: RED BLASTER... conocido como el bombardero rojo, un asesino de élite salido de la Universidad Lumumba soviética.<br>Su método: llena todo de trampas para inmovilizarte y luego te remata con su lanzagranadas.<br>SNAKE, ¡a las granadas, con granadas! Él también estará escondido detrás de algún obstáculo.<br>Con granadas se le puede atacar hasta ahí... CAMBIO |

**Ficha 5** (banderas 15 14 88, con todas puestas)

| | Original | Traducción |
|---|---|---|
| `p49:AF2E` | ケスラー『HIND・Dか・・・<br>この名前をきいただけでだいの男た<br>ちがキモをひやす。 ▼<br>へへ・・セキサイジュウリョウ1マ<br>ン2センキロ、サイコウジソク25<br>0キロ、サイコウコウド4500メ<br>ートル。 ▼<br>ミサイル、バルカンホウをそなえ、<br>チタニウムソウコウバンでまもられ<br>た空のかい物。 ▼<br>コウドからのショウシャをされたら<br>ひとたまりもねぇ。 ▼<br>出会えばサイゴ、かち目なんぞねぇ<br>・・・と言いてぇところだが、タイ<br>クウミサイルのトウジョウでジジョ<br>ウはかわってきた。 ▼<br>タイクウミサイルがあれば、このカ<br>イチョウをおとすことができるぜ<br>・・・OVER ▽ | KESSLER: HIND D... con solo oír el nombre, a los hombres hechos y derechos se les hiela la sangre.<br>Je... carga máxima 12.000 kg, velocidad máxima 250 km/h, techo 4.500 metros.<br>Con misiles y cañón Vulcan, un monstruo del cielo protegido con blindaje de titanio.<br>Si te dispara desde arriba, estás perdido.<br>Si te lo encuentras, se acabó, no hay nada que hacer... eso diría, pero los misiles antiaéreos lo han cambiado todo.<br>Con un misil antiaéreo puedes derribar a este monstruo... CAMBIO |

**Ficha 6** (banderas 10 0F 8E, con todas puestas)

| | Original | Traducción |
|---|---|---|
| `p49:AE2F` | ケスラー『RUNNING　MANか・・<br>もとバルセロナ・オリンピックのタ<br>ンキョリランナーだ。100メート<br>ルを9、69ビョウではしる。 ▼<br>ドーピングでリクジョウキョウカイ<br>からツイホウされ、ヨーロッパのテ<br>ロリズムにサンカした。 ▼<br>とてもあんたの足ではおいつけね<br>ぇぜ。まさにチータとヘビだ。こい<br>つをやるにはトラップをしかけてお<br>いこむしかねぇ。 ▼<br>やつのコース上にしかければ見こみ<br>はある。 ▼<br>・・・ただし、ガスがまわる前にな<br>。大事なのはよ、やつの足のはや<br>さをぎゃくにりようするんだ<br>・・・OVER ▽ | KESSLER: RUNNING MAN... un velocista de los Juegos de Barcelona. Corre los 100 metros en 9,69 segundos.<br>Lo echaron del atletismo por dopaje y se unió al terrorismo europeo.<br>Con tus piernas no lo alcanzas. Guepardo contra serpiente. Solo puedes cogerlo poniéndole trampas y llevándolo a ellas.<br>Si las pones en su recorrido, tienes alguna posibilidad.<br>...pero antes de que se extienda el gas. Lo importante es usar su velocidad en su contra... CAMBIO |

**Ficha 7** (banderas 09 08, con todas puestas, en la zona 03, sala 06)

| | Original | Traducción |
|---|---|---|
| `p49:AD09` | ケスラー『BLACK　COLORか・・<br>2年ぐれぇ前からこの世界で有名に<br>なってきたやつだ。以前のケイレキ<br>はわからねぇ。 ▼<br>NASAのタイチキュウ外カンキ<br>ョウトクシュブタイ出身のハイテ<br>クニンジャだ。 ▼<br>フライング・スターとスピーディー<br>なコウゲキを得意としている ▼<br>いいな、やつはオレたちみてぇな<br>プロの戦ソウやじゃねぇ、エリート<br>のうちゅうやさんだ。 ▼<br>だからかえってシマツがわりい。<br>プロの動きはヨソクできるがよ、ア<br>マチュアの動きはそうはいかねぇ ▼<br>SNAKE、まずはあんたのおてな<br>みハイケンといくか・・・ ▼<br>キタイしてるぜ、<br>ローンレンジャー・・・OVER ▽ | KESSLER: BLACK COLOR... se ha hecho famoso en este mundillo hace unos dos años. De su pasado no se sabe nada.<br>Un ninja de alta tecnología salido de la unidad especial de entornos extraterrestres de la NASA.<br>Su especialidad son las estrellas voladoras y los ataques rápidos.<br>Ojo, no es un profesional de la guerra como nosotros, es un astronauta de élite.<br>Por eso es más difícil. Lo que hace un profesional se puede prever; lo de un aficionado, no.<br>SNAKE, primero veamos de qué eres capaz...<br>Cuento contigo, Llanero Solitario... CAMBIO |

#### 140.82

Hablan: ペトロ, SNAKE. La conversación de `p48:81CA`, con 5 fichas.

**Ficha 0** (banderas 74 26 2E, con todas puestas)

| | Original | Traducción |
|---|---|---|
| | (sin mensaje) (al azar, hasta 50 de 100) | |
| `p49:ACC8`<br>al azar, hasta 100 de 100 | ペトロ『SNAKE、マルフはまだみつから<br>んか？・・・きっとせめられている<br>にちがいない。はやくたすけてやっ<br>てくれ。・・・OVER ▽ | PETRO: SNAKE, ¿aún no has encontrado a Marv?... seguro que lo están torturando. Rescátalo pronto, por favor... CAMBIO |

**Ficha 1** (banderas 73 23, con todas puestas)

| | Original | Traducción |
|---|---|---|
| `p49:AC80` | ペトロ『ナターシャは女じゃ。女しかいけな<br>い場所でまちぶせてはどうじゃ？<br>たとえば女子トイレとか・・・<br>・・・OVER ▽ | PETRO: Natasha es una mujer. ¿Por qué no la esperas donde solo pueden ir mujeres? En los aseos de mujeres, por ejemplo... CAMBIO |

**Ficha 2** (banderas 72 22 5A, con todas puestas)

| | Original | Traducción |
|---|---|---|
| `p49:AA88` | ペトロ『マルフはチェコごとスロバキアごし<br>かはなせん。それにケイカイ心がつ<br>よいタイプ、こんなジョウキョウで<br>はなおさらじゃ ▽ | PETRO: Marv solo habla checo y eslovaco. Y es muy desconfiado, y más en una situación así. |
| `p49:AAC6`<br>1 cuadro después | SNAKE『あんたは、ペトロビッチ？ ▽ | SNAKE: ¿Usted es Pettrovich? |
| `p49:AAD5`<br>1 cuadro después | ペトロ『わしはロシアごとえいごしかはなせ<br>ん・・・<br>そうじゃ！<br>ナターシャならはなせる ▽ | PETRO: Yo solo hablo ruso e inglés... ¡Eso es! Natasha sí lo habla. |
| `p49:AAFF`<br>1 cuadro después | SNAKE『ナターシャ？<br>・・・あんたらをゴエイしてきたS<br>TBの女か？ ▽ | SNAKE: ¿Natasha?... ¿la mujer del STB que les escoltaba? |
| `p49:AB21`<br>1 cuadro después | ペトロ『カノジョならコトバもわかるし、マ<br>ルフも気をゆるしているはず ▽ | PETRO: Ella conoce el idioma, y Marv debe de fiarse de ella. |
| `p49:AB43`<br>1 cuadro después | SNAKE『ぶじなのか？その女 ▽ | SNAKE: ¿Está a salvo? Esa mujer. |
| `p49:AB50`<br>1 cuadro después | ペトロ『大じょうぶ、ナターシャはふつうの<br>女ではない。プロのエージェントじ<br>ゃ。 ▼<br>わしらがつかまった時、かのじょだ<br>けはなんとかテキのユニフォームを<br>ぬすんでにげることができたんじゃ<br>。 ▼<br>きっとキカイをうかがってこのザン<br>ジバーランドのどこかにセンプクし<br>ているはずじゃ。 ▽ | PETRO: Tranquilo, Natasha no es una mujer cualquiera. Es una agente profesional.<br>Cuando nos cogieron, solo ella consiguió robar un uniforme enemigo y escapar.<br>Seguro que está escondida en algún sitio de Zanzibar Land, esperando su ocasión. |
| `p49:ABDA`<br>1 cuadro después | SNAKE『カノジョもムセンキを？ ▽ | SNAKE: ¿Ella también tiene radio? |
| `p49:ABE8`<br>1 cuadro después | ペトロ『いや、つかまった時に真っさきにう<br>ばわれた・・・わかるのはかのじょ<br>もテキのユニホームをきていること<br>だけじゃ ▽ | PETRO: No, fue lo primero que le quitaron al cogernos... lo único que sé es que ella también lleva uniforme enemigo. |
| `p49:AC24`<br>1 cuadro después | SNAKE『てがかりはなしか・・・ ▽ | SNAKE: O sea, ninguna pista... |
| `p49:AC32`<br>1 cuadro después | ペトロ『てがかりはかのじょが女ということ<br>じゃ。たとえテキのカッコウをして<br>いようとも・・・このヨウサイに女<br>兵士はいないからの。 ▼<br>それがてがかりじゃ ▽ | PETRO: La pista es que es una mujer. Aunque vaya vestida de enemigo... en esta fortaleza no hay mujeres soldado.<br>Esa es la pista. |
| `p49:AC80`<br>1 cuadro después | ペトロ『ナターシャは女じゃ。女しかいけな<br>い場所でまちぶせてはどうじゃ？<br>たとえば女子トイレとか・・・<br>・・・OVER ▽ | PETRO: Natasha es una mujer. ¿Por qué no la esperas donde solo pueden ir mujeres? En los aseos de mujeres, por ejemplo... CAMBIO |

**Ficha 3** (banderas 71 0E, con todas puestas)

| | Original | Traducción |
|---|---|---|
| | (sin mensaje) (al azar, hasta 50 de 100) | |
| `p49:ACC8`<br>al azar, hasta 100 de 100 | ペトロ『SNAKE、マルフはまだみつから<br>んか？・・・きっとせめられている<br>にちがいない。はやくたすけてやっ<br>てくれ。・・・OVER ▽ | PETRO: SNAKE, ¿aún no has encontrado a Marv?... seguro que lo están torturando. Rescátalo pronto, por favor... CAMBIO |

**Ficha 4** (banderas 0D 70 9B, con todas puestas)

| | Original | Traducción |
|---|---|---|
| `p49:A548` | ペトロ『おう、わかってくれたか・・・<br>タップ・コードの意味を ▽ | PETRO: Ah, lo has entendido... lo que quería decir el código de golpes. |
| `p49:A567`<br>1 cuadro después | SNAKE『マルフ博士？ ▽ | SNAKE: ¿Doctor Marv? |
| `p49:A572`<br>1 cuadro después | ペトロ『ひしぶりだな、<br>SOLID　SNAKE！ ▽ | PETRO: ¡Cuánto tiempo, SOLID SNAKE! |
| `p49:A589`<br>1 cuadro después | SNAKE『ペトロビッチ博士？<br>・・・どうして！ ▽ | SNAKE: ¿Doctor Pettrovich?... ¿¡Cómo es posible!? |
| `p49:A5A0`<br>1 cuadro después | ペトロ『マルフとわしはプラハの学会でよく<br>会っていた。ことばこそ通じないが<br>いっしゅの学者なかまじゃった。 ▼<br>わしもマルフといっしょにアメリカ<br>ホウモンのさい、ここの連中につか<br>まったのじゃ。 ▽ | PETRO: Marv y yo nos veíamos a menudo en los congresos de Praga. No hablamos el mismo idioma, pero somos colegas, a nuestra manera.<br>A mí también me cogió esta gente junto con Marv, en la visita a América. |
| `p49:A606`<br>1 cuadro después | SNAKE『マルフ博士は？ ▽ | SNAKE: ¿Y el doctor Marv? |
| `p49:A612`<br>1 cuadro después | ペトロ『かれはすうじつ前、ここからタワー<br>ビルにうつされた。ここから北にす<br>うキロのところにあるたかいビルじ<br>ゃ ▽ | PETRO: Hace unos días lo trasladaron de aquí a la Torre. Es un edificio alto, a unos kilómetros al norte. |
| `p49:A64B`<br>1 cuadro después | SNAKE『くそっ、またておくれかっ！<br>マルフはタワービル・・・ ▽ | SNAKE: Maldita sea, ¡otra vez tarde! Marv está en la Torre... |
| `p49:A668`<br>1 cuadro después | ペトロ『SNAKE、わしがいかされている<br>ケントウがつくか？ ▽ | PETRO: SNAKE, ¿te imaginas por qué me tienen con vida? |
| `p49:A685`<br>1 cuadro después | SNAKE『・・・あんたがヒツヨウだからだ。<br>・・・すると？？ ▽ | SNAKE: ...porque le necesitan. ...¿Entonces?? |
| `p49:A6A1`<br>1 cuadro después | ペトロ『そう・・・METAL　GEARじ<br>ゃよ。SNAKE。<br>あるのじゃ、あれが・・・ここに。<br> ▼<br>あたらしいMETAL　GEARは<br>すでにカンセイしておる。3年前、<br>あんたがハカイしたのはたんなるシ<br>サクヒン・・・ ▼<br>今では、あのスウバイものパワーを<br>ひめたカイリョウタイプが作られ、<br>さらにそのケイリョウ化タイプのリ<br>ョウサンもすすめられている。 ▽ | PETRO: Eso es... METAL GEAR, SNAKE. Existe... aquí.<br>El nuevo METAL GEAR ya está terminado. Lo que destruiste hace tres años era solo un prototipo...<br>Ahora han hecho un modelo mejorado con varias veces su potencia, y ya se fabrica en serie uno más ligero. |
| `p49:A752`<br>1 cuadro después | SNAKE『すると、あのハイキ用カクチョゾウ<br>コシュウゲキはMETAL　GEA<br>Rが・・・ ▽ | SNAKE: Entonces, los ataques a los almacenes nucleares de desguace fueron cosa de METAL GEAR... |
| `p49:A77D`<br>1 cuadro después | ペトロ『その通り。METAL　GEARは<br>カクトウサイホコウセンシャじゃ。<br>こいつのジツリョクはカクをトウサ<br>イしてはじめてハッキされる。 ▼<br>ザンジバーランドは世界でユイイツ<br>カクをテに入れた。その上、ダイタ<br>イエネルギーであるOILIXを<br>わがものにしようとしている。 ▼<br>SNAKE・・・ここまで言えば、<br>こいつらのクロマクが見えてきたじ<br>ゃろう？ ▽ | PETRO: Así es. METAL GEAR es un tanque andante con armas nucleares. Su fuerza de verdad solo aparece cuando las lleva.<br>Zanzibar Land es el único sitio del mundo que tiene armas nucleares. Y encima quiere quedarse con OILIX, la energía alternativa.<br>SNAKE... con todo lo que te he dicho, ya ves quién mueve los hilos, ¿no? |
| `p49:A830`<br>1 cuadro después | SNAKE『BIG・・・BOSS？？ ▽ | SNAKE: ¿¿BIG... BOSS?? |
| `p49:A83F`<br>1 cuadro después | ペトロ『やつじゃ！やつはMETAL　GE<br>ARとOILIXで世界をにぎろう<br>とたくらんどる。やつらにわたして<br>はならん！OILIXを。 ▼<br>カガクは人ごろしのためだけにある<br>のではない。マルフはイシはつよい<br>がシンゾウがよわい。いそいでくれ<br>っ！ ▼<br>やつらのゴウモンにいつまでたえら<br>れるかわからん ▽ | PETRO: ¡Él! Quiere dominar el mundo con METAL GEAR y OILIX. ¡No pueden quedarse con OILIX!<br>La ciencia no es solo para matar gente. Marv tiene mucha voluntad pero el corazón débil. ¡Date prisa!<br>No sé cuánto aguantará sus torturas. |
| `p49:A8D3`<br>1 cuadro después | SNAKE『ヤクヒンをつかわれるとヤッカイだ<br>な ▽ | SNAKE: Si le dan drogas, la cosa se pone fea. |
| `p49:A8E8`<br>1 cuadro después | ペトロ『マルフはわたしと同じ、コガタムセ<br>ンキを体内にもっているはずだ。同<br>コウしていたSTBの女エージェン<br>トがわたしてくれたものじゃ。 ▼<br>シュウハスウがわかればフツウのム<br>センキで連絡できる ▽ | PETRO: Marv, como yo, debe de llevar una radio pequeña dentro del cuerpo. Nos la dio la agente del STB que venía con nosotros.<br>Si sabes la frecuencia, puedes hablar con él con una radio normal. |
| `p49:A94E`<br>1 cuadro después | SNAKE『ペトロビッチ、<br>あんたはどうする？ ▽ | SNAKE: Pettrovich, ¿y usted? |
| `p49:A962`<br>1 cuadro después | ペトロ『きみとわしをへだてるカベはチョバ<br>ムプレートじゃ。バクハはフカノウ<br>じゃ。わしはほっといて、マルフを<br>たすけてくれ。SNAKE ▽ | PETRO: La pared entre los dos es de placa Chobham. No se puede volar. Olvídate de mí y salva a Marv. SNAKE. |
| `p49:A9A4`<br>1 cuadro después | SNAKE『わかった。あとでむかえにくる ▽ | SNAKE: De acuerdo. Luego vengo a buscarle. |
| `p49:A9B5`<br>1 cuadro después | ペトロ『SNAKE？ ▽ | PETRO: ¿SNAKE? |
| `p49:A9BE`<br>1 cuadro después | ペトロ『むすめのエレンがきみのファンでね<br>。なかなかケッコンせん。こまった<br>もんだ。 ▼<br>・・・それからわしのユウジンでヨ<br>ゼフ・ノルデンという動物学者がこ<br>の地方にすんでいるのじゃ。シュウ<br>ハスウ140・40ではなせる。 ▼<br>動物にかんすることなら力になって<br>くれるじゃろう・・・ ▽ | PETRO: Mi hija Ellen es admiradora tuya. No hay manera de que se case. Qué fastidio.<br>...Y un amigo mío, un zoólogo que se llama Josef Norden, vive por esta zona. Puedes hablar con él en el 140.40.<br>Te ayudará en todo lo que tenga que ver con animales... |
| `p49:AA4F`<br>1 cuadro después | SNAKE『大ジョウブだ。むすめのケッコンシ<br>キには間に合うようにむかえにくる<br> ▽ | SNAKE: Tranquilo. Vendré a buscarle a tiempo para la boda de su hija. |
| `p49:AA77`<br>1 cuadro después | ペトロ『ありがとう。SNAKE・・・ ▽ | PETRO: Gracias. SNAKE... |

#### 140.51

Hablan: マルフ, SNAKE. La conversación de `p48:8296`, con 2 fichas.

**Ficha 0** (banderas 72 23, con todas puestas)

| | Original | Traducción |
|---|---|---|
| `p49:A4B3` | マルフ『メニャー　ザビート　マルフ。<br>シュトー　ナム　ジェラーチ？ムィ<br>ハチーム　ミーラ。 ▼<br>ムィ　イスラルニャー　エム<br>スボィ　ドルト。ナジョー　<br>ユースィ、シュトー　アン<br>イリジョート。 ▼<br>モィ　タヴァーリシィ・・・ ▽ | MARV: (en ruso, escrito en katakana) Menya zovut Marv. Shto nam delat'? My khotim mira... (Me llamo Marv. ¿Qué hacemos? Queremos la paz...)<br>(lo demás, palabras que no forman frases)<br>Moy tovarishch... (camarada mío...) |

**Ficha 1** (banderas 72 21 5A, con todas puestas)

| | Original | Traducción |
|---|---|---|
| `p49:A4B3` | マルフ『メニャー　ザビート　マルフ。<br>シュトー　ナム　ジェラーチ？ムィ<br>ハチーム　ミーラ。 ▼<br>ムィ　イスラルニャー　エム<br>スボィ　ドルト。ナジョー　<br>ユースィ、シュトー　アン<br>イリジョート。 ▼<br>モィ　タヴァーリシィ・・・ ▽ | MARV: (en ruso, escrito en katakana) Menya zovut Marv. Shto nam delat'? My khotim mira... (Me llamo Marv. ¿Qué hacemos? Queremos la paz...)<br>(lo demás, palabras que no forman frases)<br>Moy tovarishch... (camarada mío...) |
| `p49:A51E`<br>1 cuadro después | SNAKE『・・・なんのことだ？・・・<br>さっぱりわからん。ペトロヴィッチ<br>にきいてみようか ▽ | SNAKE: ...¿Qué dice?... No entiendo nada. Se lo preguntaré a Pettrovich. |

#### 140.27

Hablan: -. La conversación de `p48:82A9`, con 0 fichas.

#### Conversación de p48:8452

**Ficha 0** (siempre)

| | Original | Traducción |
|---|---|---|
| `p49:B7B6` | ナターシャ『メニャー　ザヴート　ナターシャ ▽ | NATASHA: (en ruso) Menya zovut Natasha. (Me llamo Natasha.) |
| `p49:B7C8`<br>1 cuadro después | マルフ『メニャー　ザヴィート　マルフ ▽ | MARV: (en ruso) Menya zovut Marv. (Me llamo Marv.) |
| `p49:B7D9`<br>1 cuadro después | ナターシャ『マルフ！カク　ヴィ　セジャー<br>シューフスト　ヴェチェ？ ▽ | NATASHA: (en ruso) ¡Marv! Kak vy sebya chuvstvuete? (¡Marv! ¿Cómo se encuentra?) |
| `p49:B7F7`<br>1 cuadro después | マルフ『スパシーバ、ハラショウ　モイ　<br>タバーリシィ、ナターシャ　アナ　<br>セゴドニャ　アソベンナ<br>クラシーヴァ？ ▽ | MARV: (en ruso) Spasibo, khorosho, moy tovarishch. Natasha, ona segodnya osobenno krasivaya? (Gracias, bien, camarada. Natasha, ¿está especialmente guapa hoy?) |
| `p49:B82E`<br>1 cuadro después | ナターシャ『スカジィーチェ、パジャルイスタ、<br>マルフ？ ▽ | NATASHA: (en ruso) Skazhite, pozhaluysta, Marv? (Dígame, por favor, Marv.) |
| `p49:B846`<br>1 cuadro después | マルフ『タワーヴィル、クレブスキュール<br>ムコヴァ　シュシュノワ　<br>シリバシュ　イケタニ ▽ | MARV: (seudorruso) Tower building... (lo demás, palabras que no forman frases) |
| `p49:B870`<br>1 cuadro después | ナターシャ『ムエェ　ナーダ<br>ナダズシ　イアチ ▽ | NATASHA: (seudorruso, palabras que no forman frases) |
| `p49:B883`<br>1 cuadro después | マルフ『ヤ　エム　オダガダーレン<br>シアシアーダ ▽ | MARV: (seudorruso, palabras que no forman frases) |

#### Conversación de p48:8533

**Ficha 0** (siempre)

| | Original | Traducción |
|---|---|---|
| `p49:BDDF` | SNAKE『なにをもたもたしている！<br>クリスマスがおわってしまうぞっ ▽ | SNAKE: ¿¡A qué esperas!? ¡Se va a acabar la Navidad! |
| `p49:BDFE`<br>1 cuadro después | パイロット『こちら、チャーリー。<br>救出地テンまで10キロのところま<br>できている。 ▼<br>もうすこしもちこたえてくれっ！<br>OVER・・・ ▽ | PILOTO: Aquí Charlie. Estamos a 10 km del punto de rescate.<br>¡Aguanta un poco más! CAMBIO... |
| `p49:BE3E`<br>1 cuadro después | SNAKE『はやく、たのむ！！ ▽ | SNAKE: ¡¡Rápido, por favor!! |

#### Conversación de p48:8542

**Ficha 0** (siempre)

| | Original | Traducción |
|---|---|---|
| `p49:BE4A` | SNAKE『チコクだぞ・・・チャーリー！ | SNAKE: Llegas tarde... ¡Charlie! |
| `p49:BE5B`<br>160 cuadros después | パイロット『2人のオジャマをしちゃあわるいか<br>とおもってね | PILOTO: Pensé que mejor no os interrumpía a los dos. |

#### Conversación de p48:84B1

**Ficha 0** (siempre)

| | Original | Traducción |
|---|---|---|
| `p49:AF42` | きいただけでだいの男た<br>ちがキモをひやす。 ▼<br>へへ・・セキサイジュウリョウ1マ<br>ン2センキロ、サイコウジソク25<br>0キロ、サイコウコウド4500メ<br>ートル。 ▼<br>ミサイル、バルカンホウをそなえ、<br>チタニウムソウコウバンでまもられ<br>た空のかい物。 ▼<br>コウドからのショウシャをされたら<br>ひとたまりもねぇ。 ▼<br>出会えばサイゴ、かち目なんぞねぇ<br>・・・と言いてぇところだが、タイ<br>クウミサイルのトウジョウでジジョ<br>ウはかわってきた。 ▼<br>タイクウミサイルがあれば、このカ<br>イチョウをおとすことができるぜ<br>・・・OVER ▽ | (empieza a media frase de `p49:AF2E`) |
| `p49:AF5F`<br>1 cuadro después | サイジュウリョウ1マ<br>ン2センキロ、サイコウジソク25<br>0キロ、サイコウコウド4500メ<br>ートル。 ▼<br>ミサイル、バルカンホウをそなえ、<br>チタニウムソウコウバンでまもられ<br>た空のかい物。 ▼<br>コウドからのショウシャをされたら<br>ひとたまりもねぇ。 ▼<br>出会えばサイゴ、かち目なんぞねぇ<br>・・・と言いてぇところだが、タイ<br>クウミサイルのトウジョウでジジョ<br>ウはかわってきた。 ▼<br>タイクウミサイルがあれば、このカ<br>イチョウをおとすことができるぜ<br>・・・OVER ▽ | (empieza a media frase de `p49:AF2E`) |
| `p49:AF7B`<br>1 cuadro después | キロ、サイコウコウド4500メ<br>ートル。 ▼<br>ミサイル、バルカンホウをそなえ、<br>チタニウムソウコウバンでまもられ<br>た空のかい物。 ▼<br>コウドからのショウシャをされたら<br>ひとたまりもねぇ。 ▼<br>出会えばサイゴ、かち目なんぞねぇ<br>・・・と言いてぇところだが、タイ<br>クウミサイルのトウジョウでジジョ<br>ウはかわってきた。 ▼<br>タイクウミサイルがあれば、このカ<br>イチョウをおとすことができるぜ<br>・・・OVER ▽ | (empieza a media frase de `p49:AF2E`) |
| `p49:B00F`<br>1 cuadro después | ウはかわってきた。 ▼<br>タイクウミサイルがあれば、このカ<br>イチョウをおとすことができるぜ<br>・・・OVER ▽ | (empieza a media frase de `p49:AF2E`) |
| `p49:B021`<br>16 cuadros después | があれば、このカ<br>イチョウをおとすことができるぜ<br>・・・OVER ▽ | (empieza a media frase de `p49:AF2E`) |
| `p49:B04E`<br>1 cuadro después | Rか・<br>あかいバクハマとしてしられるソ<br>ビエトのルムンバ大学出のアンサ<br>ツ専門エリートだ。 ▼<br>やつのてはブービートラップをは<br>りめぐらし、あいてのあしどめを<br>しておいてからトクイのグレネー<br>ド・ランチャーでとどめをさす。 ▼<br>SNAKE、グレネードにはグレ<br>ネードでオウタイしろ！やつもま<br>た、なにかのショウヘキに身をか<br>くしているはず。 ▼<br>グレネードならそんな所でもコウ<br>ゲキできるぜ。・・・OVER ▽ | (empieza a media frase de `p49:B042`) |
| `p49:B091`<br>1 cuadro después | りめぐらし、あいてのあしどめを<br>しておいてからトクイのグレネー<br>ド・ランチャーでとどめをさす。 ▼<br>SNAKE、グレネードにはグレ<br>ネードでオウタイしろ！やつもま<br>た、なにかのショウヘキに身をか<br>くしているはず。 ▼<br>グレネードならそんな所でもコウ<br>ゲキできるぜ。・・・OVER ▽ | (empieza a media frase de `p49:B042`) |
| `p49:B0A2`<br>1 cuadro después | ておいてからトクイのグレネー<br>ド・ランチャーでとどめをさす。 ▼<br>SNAKE、グレネードにはグレ<br>ネードでオウタイしろ！やつもま<br>た、なにかのショウヘキに身をか<br>くしているはず。 ▼<br>グレネードならそんな所でもコウ<br>ゲキできるぜ。・・・OVER ▽ | (empieza a media frase de `p49:B042`) |
| `p49:B11F`<br>1 cuadro después | TRABOXか・・・<br>SAS、GSG9、UDT出以者で<br>コンセイされたミッシツ専門のアン<br>サツブタイだ。 ▼<br>どいつも戦ソウのプロだ。やつらは<br>まばたきひとつせずに人をころす。<br>同時にあいてにしてはふりだ。 ▼<br>ー人ずつ、かたずけるのがベストだ<br>ぜ・・・OVER ▽ | (empieza a media frase de `p49:B11B`) |
| `p49:B137`<br>1 cuadro después | し以者で<br>コンセイされたミッシツ専門のアン<br>サツブタイだ。 ▼<br>どいつも戦ソウのプロだ。やつらは<br>まばたきひとつせずに人をころす。<br>同時にあいてにしてはふりだ。 ▼<br>ー人ずつ、かたずけるのがベストだ<br>ぜ・・・OVER ▽ | (empieza a media frase de `p49:B11B`) |
| `p49:B182`<br>1 cuadro después | あいてにしてはふりだ。 ▼<br>ー人ずつ、かたずけるのがベストだ<br>ぜ・・・OVER ▽ | (empieza a media frase de `p49:B11B`) |
| `p49:B19D`<br>1 cuadro después | トだ<br>ぜ・・・OVER ▽ | (empieza a media frase de `p49:B11B`) |

#### Conversación de p48:84ED

**Ficha 0** (siempre)

| | Original | Traducción |
|---|---|---|
| `p49:BD33` | SNAKE『こちら、SNAKE。<br>チャーリー、オウトウねがいま<br>す？ ▽ | SNAKE: Aquí SNAKE. Charlie, ¿me recibes? |
| `p49:BD52`<br>1 cuadro después | パイロット『こちら、チャーリー。<br>どうぞ、SNAKE・・・ ▽ | PILOTO: Aquí Charlie. Adelante, SNAKE... |
| `p49:BD6C`<br>1 cuadro después | SNAKE『カートリッジをカイシュウ、キカン<br>する。<br>・・・救出地テンへいそぐ！ ▽ | SNAKE: Cartucho recuperado, vuelvo. ...¡Voy al punto de rescate! |
| `p49:BD94`<br>1 cuadro después | パイロット『ラジャー。救出地テンへむかう。<br>・・・キャクジンは？ ▽ | PILOTO: Recibido. Voy al punto de rescate. ...¿Algún pasajero? |
| `p49:BDB4`<br>1 cuadro después | SNAKE『・・・ひとりだ。<br>・・・ブロンドのビジン ▽ | SNAKE: ...Uno. ...Una rubia guapísima. |
| `p49:BDCB`<br>32 cuadros después | パイロット『たのしみにしている<br>・・・OVER ▽ | PILOTO: Estoy deseando verla... CAMBIO |

#### Conversación de p48:82AA

**Ficha 0** (banderas 4E 4F 8F, con todas puestas, en la zona 12, sala 02)

| | Original | Traducción |
|---|---|---|
| `p49:B346` | ケスラー『GREY　FOX・・・<br>本名、フランク・イェーガー。もと<br>FOX　HOUND出身。 ▼<br>BIG　BOSS時だいのFOXの<br>ショウゴウをもつさいごの男。<br>クンショウ5カイ・・・ ▽ | KESSLER: GREY FOX... nombre real, Frank Jaeger. Antes en FOX HOUND.<br>El último que tuvo el título de FOX en los tiempos de BIG BOSS. Cinco veces condecorado... |
| `p49:B3A4`<br>1 cuadro después | SNAKE『わかっている・・・やつのユウシュ<br>ウさは。やつのことはコウハイであ<br>るオレがいちばんよくしっている ▼<br>狙ったものはかならずのがさないレ<br>イセイチンチャクなハンターだ。タ<br>イインたちのだれもがそんけいし、<br>したっていた・・・ ▽ | SNAKE: Ya sé... lo bueno que es. Como compañero más joven suyo, lo conozco mejor que nadie.<br>Un cazador de sangre fría al que nunca se le escapa una presa. Todos en la unidad lo respetaban y lo admiraban... |
| `p49:B416`<br>1 cuadro después | ケスラー『そうだったな。SNAKE・・・じ<br>ゃ、やつのカコはどうだ？なにかの<br>たしにはなるだろうて・・・ ▼<br>10年前、やつはこの世界でハン<br>ターとよばれていた。イェーガー<br>はドイツごでハンターという意味ら<br>しい。 ▼<br>そのころ、やつは東がわの女とカン<br>ケイがあった。 ▼<br>やつは女の西がわへボウメイ、オー<br>バー・ザ・フェンスをこころみたが<br>けっきょくシッパイにおわった。 ▼<br>西がわは女にキョウミをしめさなか<br>ったらしい。やつはそのことで西が<br>わの上そう部連中をうらんでいたら<br>しい ▽ | KESSLER: Así es, SNAKE... ¿y su pasado? Algo te servirá...<br>Hace diez años, en este mundillo lo llamaban el Cazador. Jaeger quiere decir cazador en alemán, parece.<br>Por entonces tenía algo con una mujer del Este.<br>Intentó pasarse con ella al Oeste, saltar la valla, pero salió mal.<br>Parece que al Oeste no le interesaba la mujer. Por eso les guarda rencor a los de arriba del Oeste. |
| `p49:B50F`<br>1 cuadro después | SNAKE『その女の名は？！ ▽ | SNAKE: ¡¿Cómo se llamaba esa mujer?! |
| `p49:B51C`<br>1 cuadro después | ケスラー『オリンピックのスケートセンシュだ<br>った。ナターシャ・マルコヴァとい<br>う・・・ぞくっとするくらい、いい<br>女だったぜ ▽ | KESSLER: Era patinadora olímpica. Natasha Markova... una mujer de escalofrío, de lo guapa que era. |
| `p49:B558`<br>1 cuadro después | SNAKE『ナ、ナターシャ<br>・・・マルコ・ヴァ！ ▽ | SNAKE: Na, Natasha... ¡Marko-va! |
| `p49:B56D`<br>1 cuadro después | ケスラー『SNAKE！もし、おまえがこのF<br>OXにかてたら・・オレはSOLI<br>D　SNAKEを世界ーのヨウヘイ<br>だとセンデンしてやろう！ ▼<br>・・・OVER ▽ | KESSLER: ¡SNAKE! Si le ganas a este FOX... ¡le diré al mundo que SOLID SNAKE es el mejor mercenario que hay!<br>...CAMBIO |

**Ficha 1** (banderas 5B 4C 5E 2F A1, con todas puestas)

| | Original | Traducción |
|---|---|---|
| `p48:9DB3` | キャンベル『SNAKE！アイテムがもえてい<br>る！！すべてのソウビヒン、ブキ<br>をすてろ！時間がないぞ。スペー<br>スキーですてるんだ！ ▽ | CAMPBELL: ¡SNAKE! ¡Tus objetos están ardiendo! ¡Tira todo el equipo y las armas! No hay tiempo. ¡Tíralos con la barra espaciadora! |

**Ficha 2** (banderas 5D 30 5F 49 A1 6F, con todas puestas)

| | Original | Traducción |
|---|---|---|
| `p48:9F8C` | キャンベル『ナターシャからもらったブローチは<br>おそらくケイジョウキオクゴウキン<br>だ。<br>ブローチのオンドをかえてみろ。 ▽ | CAMPBELL: El broche que te dio Natasha será seguramente de una aleación con memoria de forma. Prueba a cambiarle la temperatura. |

**Ficha 3** (banderas 60 42 41 11, con todas puestas, en la zona 13, sala 04)

| | Original | Traducción |
|---|---|---|
| `p49:B8CF` | 『カード9はプレデターがもってい<br>たはずだ！ ▽ | (sin nombre): ¡La tarjeta 9 tendría que tenerla Predator! |
| `p49:B8E6`<br>1 cuadro después | SNAKE『カード8じゃないのか？ヤツはカ<br>ード8をもっていたぞ。 ▽ | SNAKE: ¿No será la 8? Llevaba la tarjeta 8. |
| `p49:B904`<br>1 cuadro después | 『いや、カード8と9のリョウホウ<br>をカンリしていたはずだ。 ▼<br>おそらくおとしたにちがいない。<br>ヤツのいたエリアをさがしてみろ<br>！見つかるはずだ。<br>・・・うまくやれよ ▽ | (sin nombre): No, se encargaba de las dos, la 8 y la 9.<br>Se le habrá caído. ¡Busca por la zona donde estaba! La encontrarás... suerte. |

**Ficha 4** (banderas 61 3E 62 3F, con todas puestas)

| | Original | Traducción |
|---|---|---|
| `p49:B957` | 『オレだ・・・ファンのー人だ。<br>SNAKE、気をつけろ。 ▼<br>そのヘヤにあのデンセツのゲリラ<br>ブタイ、ウィスパーズの生きの<br>こり、NIGHT　SIGHTが<br>いる ▽ | (sin nombre): Soy yo... uno de tus admiradores. SNAKE, ten cuidado.<br>En esa habitación está NIGHT SIGHT, superviviente de aquella guerrilla legendaria, los Whispers. |
| `p49:B9A9`<br>1 cuadro después | SNAKE『NIGHT　SIGHT・・・ ▽ | SNAKE: NIGHT SIGHT... |
| `p49:B9BA`<br>1 cuadro después | 『サイシンのカモフラージュ・スーツ<br>をきてステルス。 ▼<br>おまけに全くジュウセイのしないジ<br>ュウ、ウェイ・ション・ショウ・シ<br>ャンでコウゲキしてくる。 ▼<br>ダレもヤツのスガタを見たことがな<br>い。わかるか？この意味が・・・ ▽ | (sin nombre): Lleva el último traje de camuflaje: invisible.<br>Y encima ataca con una pistola que no hace ningún ruido, la Wei Xiong Shou Shan.<br>Nadie lo ha visto nunca. ¿Entiendes lo que quiere decir? |
| `p49:BA29`<br>1 cuadro después | SNAKE『シンセツなファンをもって<br>コウエイだ ▽ | SNAKE: Es un honor tener un admirador tan amable. |
| `p49:BA3D`<br>1 cuadro después | 『音に注意するんだ。SNAKE！<br>・・・OVER ▽ | (sin nombre): ¡Atento a los ruidos, SNAKE! ...CAMBIO |

**Ficha 5** (banderas 92 34 63, con todas puestas, en la zona 0D, sala 05)

| | Original | Traducción |
|---|---|---|
| `p48:8B80` | 『オレだ。ファンのー人だ。そこから<br>ダイブできるのは北むきのかぜがふ<br>いたときだけだぜ。 ▼<br>いつもは南むきだがあるシュンカン<br>だけかざむきがかわるんだ。 ▼<br>そのシュンカンをのがすな<br>・・・うまくやれよ ▽ | (sin nombre): Soy yo. Uno de tus admiradores. Desde ahí solo se puede saltar cuando el viento sopla hacia el norte.<br>Normalmente sopla hacia el sur, pero en un momento cambia.<br>No lo dejes pasar... suerte. |

**Ficha 6** (banderas 64 2B 6D 5C, con todas puestas, en la zona 0A, sala 00)

| | Original | Traducción |
|---|---|---|
| `p48:8AFA` | ホーリー『SNAKE、タワービルにパラシュ<br>ートこうかクンレン用のベランダが<br>あったでしょ？ ▼<br>そこからハングライダーがあればク<br>レバスをとびこえられるわ。 ▼<br>ハングライダーはザンジバービルの<br>1Fの東にあるはずよ。 ▼<br>カンシャサイの時に見たことがある<br>の・・・じゃあね ▽ | HOLLY: SNAKE, en la Torre había un balcón para practicar saltos en paracaídas, ¿verdad?<br>Desde ahí, con un ala delta, se puede cruzar la grieta.<br>El ala delta tiene que estar al este de la 1F del edificio Zanzíbar.<br>La vi en la fiesta de acción de gracias... adiós. |

**Ficha 7** (banderas 65 1D 9E, con todas puestas, en la zona 0F, sala 00)

| | Original | Traducción |
|---|---|---|
| `p48:8D71` | ホーリー『オクジョウへのドアはシン入者をふ<br>せぐためにぬりかためられたらしい<br>わ。 ▼<br>でもオウキュウショチだからP・B<br>でカンタンにハカイできるはずよ<br>・・・じゃあね ▽ | HOLLY: Parece que la puerta de la azotea la taparon para que no entre nadie.<br>Pero fue un apaño de urgencia, así que con P.B. se tiene que romper fácil... adiós. |

**Ficha 8** (banderas 19 18, con todas puestas, en la zona 0B, sala 05)

| | Original | Traducción |
|---|---|---|
| `p48:8859` | ホーリー『SNAKE！わたし・・・<br>ショウタイがばれちゃってつかまっ<br>ちゃったの！！たすけて！ ▼<br>・・・マルフ博士とセッショクがと<br>れたのに ▽ | HOLLY: ¡SNAKE! Me... ¡¡me han descubierto y me han cogido!! ¡Ayúdame!<br>...y eso que había contactado con el doctor Marv. |
| `p48:889E`<br>1 cuadro después | SNAKE『どこだ？！・・・場所は？ ▽ | SNAKE: ¡¿Dónde?!... ¿Dónde estás? |
| `p48:88AF`<br>1 cuadro después | ホーリー『・・・わからない。目かくしされて<br>たから。タワービルのどこかだとお<br>もうけど・・・そうだわ！ ▽ | HOLLY: ...No lo sé. Me vendaron los ojos. Creo que en algún sitio de la Torre... ¡eso es! |
| `p48:88E1`<br>1 cuadro después | ホーリー『SNAKE！音・・・音がするの。<br>わたしの左から・・・エレベーター<br>の音がする。 ▼<br>それから・・・右からはポンプのよ<br>うな音がきこえるわ。前とうしろか<br>らは水のながれる音がする ▽ | HOLLY: ¡SNAKE! Ruidos... oigo ruidos. A mi izquierda... el ruido de un ascensor.<br>Y a la derecha... algo como una bomba de agua. Delante y detrás, el ruido de agua corriendo. |
| `p48:8944`<br>1 cuadro después | SNAKE『前ごから水の音・・・右からポンプ<br>音・・・左からエレベーター音？<br>音のマップができたな ▽ | SNAKE: Agua delante y detrás... una bomba a la derecha... ¿un ascensor a la izquierda? Ya tengo un mapa de ruidos. |
| `p48:897A`<br>1 cuadro después | ホーリー『SNAKE！かれらわたしのムセン<br>キに気がつかなかったみたい。<br>だけどはやくきてっ！まってるわ ▽ | HOLLY: ¡SNAKE! Parece que no se han dado cuenta de mi radio. ¡Pero ven rápido! Te espero. |

**Ficha 9** (banderas 66 67, con todas puestas, en la zona 09, sala 02)

| | Original | Traducción |
|---|---|---|
| `p48:9EF4` | キャンベル『おもいきって、ニモツになってみ<br>たらどうだ？<br>トクイのダンボールで。 ▼<br>これよりさきはシュウハスウをヘ<br>ンコウする。 ▼<br>次のシュウハスウはパッケージの<br>ウラのシャシンにのっている。<br>・・・OVER ▽ | CAMPBELL: ¿Y si te atreves y te conviertes en un paquete? Con tu caja de cartón de siempre.<br>A partir de aquí cambio de frecuencia.<br>La siguiente está en la foto de detrás del paquete... CAMBIO |

**Ficha 10** (banderas 68 13, con todas puestas)

| | Original | Traducción |
|---|---|---|
| `p48:8CED` | ホーリー『はるばるニホンのオキナワからとり<br>よせたなりこのすならしいわ。 ▼<br>あるくとキュッ、キュッと音がして<br>見つかるわ。注意して<br>・・・じゃあね ▽ | HOLLY: Parece que es arena que canta, traída nada menos que de Okinawa, en Japón.<br>Al andar hace ñic, ñic, y te descubren. Cuidado... adiós. |

**Ficha 11** (banderas 12 58 33, con todas puestas, en la zona 07, sala 0B)

| | Original | Traducción |
|---|---|---|
| `p49:B899` | 『SNAKE！そこは危ないぞ！<br>ジライゲンだ ▽ | (sin nombre): ¡SNAKE! ¡Ahí es peligroso! Es un campo de minas. |
| `p49:B8B2`<br>1 cuadro después | SNAKE『あんたは？ ▽ | SNAKE: ¿Quién eres? |
| `p49:B8BA`<br>1 cuadro después | 『ファンのー人さ。<br>・・・うまくやれよ ▽ | (sin nombre): Uno de tus admiradores... suerte. |

**Ficha 12** (banderas 69 0D 70, con todas puestas, en la zona 07, sala 0C)

| | Original | Traducción |
|---|---|---|
| `p48:96B4` | キャンベル『タップ・コードだ。ベトナムのハノ<br>イ・ヒルトン［北ベトナムの収容所<br>］でよくつかわれたツウシン法だ ▼<br>もともとチョウセン戦ソウ中にシヨ<br>ウされていたものだ。トリセツにカ<br>イドク方法がかかれているはずだ。<br>・・・OVER ▽ | CAMPBELL: Es código de golpes. Una forma de comunicarse muy usada en el Hanoi Hilton [el campo de prisioneros de Vietnam del Norte].<br>Se usaba ya en la guerra de Corea. En el manual debe de explicar cómo descifrarlo... CAMBIO |

**Ficha 13** (banderas 94 6A 16, con todas puestas, en la zona 01, sala 03)

| | Original | Traducción |
|---|---|---|
| `p48:854C` | ホーリー『わたし、ホーリー・・<br>ホーリー・ホワイト。 ▼<br>ジャーナリストとしていっかげつ前<br>からザンジバーランドに潜入してい<br>るの。 ▼<br>だから、ここのだいたいのことなら<br>わかるから・・<br>おやくにたてるとおもうわ。 ▼<br>シュウハスウは140・15よ。<br>連絡して？・・・じゃあね ▽ | HOLLY: Soy Holly... Holly White.<br>Llevo un mes infiltrada en Zanzibar Land como periodista.<br>Así que sé casi todo de este sitio... creo que te puedo ayudar.<br>Mi frecuencia es la 140.15. ¿Me llamas?... adiós. |

**Ficha 14** (banderas 04 6B 6C, con todas puestas, en la zona 00, sala 08)

| | Original | Traducción |
|---|---|---|
| `p48:99CD` | キャンベル『ショウメンからの潜入はフカノウだ<br>。ツウフウコウから潜入せよ<br>・・・OVER ▽ | CAMPBELL: Entrar por delante es imposible. Entra por el conducto de ventilación... CAMBIO |

**Ficha 15** (banderas 6E 02, con todas puestas, en la zona 00, sala 06)

| | Original | Traducción |
|---|---|---|
| `p48:97C2` | キャンベル『ホフクゼンシンをユウコウにつかい<br>、フェンスのきれ目から潜入せよ<br>・・・OVER ▽ | CAMPBELL: Aprovecha el arrastrarte y entra por el hueco de la valla... CAMBIO |

#### Conversación de p48:850B

**Ficha 0** (siempre)

| | Original | Traducción |
|---|---|---|
| `p49:BA59` | FOX『SNAKE！ ▽ | FOX: ¡SNAKE! |
| `p49:BA62`<br>1 cuadro después | FOX『SNAKE！<br>・・オレだ。GREY　FOXだ ▽ | FOX: ¡SNAKE!... Soy yo. GREY FOX. |
| `p49:BA7A`<br>1 cuadro después | SNAKE『FOXっ！ ▽ | SNAKE: ¡FOX! |
| `p49:BA82`<br>1 cuadro después | FOX『どうやらオレのチュウコクをムダに<br>したらしいな。<br>お前とのユウジョウもこれまでだ ▼<br>その、エレベーターがお前のカンオ<br>ケとなるだろう ▽ | FOX: Parece que no has hecho caso de mi consejo. Aquí se acaba nuestra amistad.<br>Ese ascensor será tu ataúd. |
| `p49:BAC7`<br>1 cuadro después | SNAKE『なにっ！！ ▽ | SNAKE: ¡¡Qué!! |
| `p49:BACF`<br>1 cuadro después | FOX『きこえるだろう？その音・・・<br>みっ室専門のアンサツブタイを<br>おくりこんだ・・・・ ▼<br>せいぜいカンゲイしてやってく<br>れ ▽ | FOX: Lo oyes, ¿verdad? Ese ruido... te he mandado al comando de asesinos de espacios cerrados...<br>Dales una buena bienvenida. |
| `p49:BB0E`<br>1 cuadro después | SNAKE『テンジョウか？！ ▽ | SNAKE: ¡¿El techo?! |
| `p49:BB19`<br>1 cuadro después | FOX『SNAKE、わかれのあいさつ<br>が言えてうれしいぜ<br>・・・OVER ▽ | FOX: SNAKE, me alegro de haber podido despedirme... CAMBIO |

#### Conversación de p48:8498

**Ficha 0** (siempre)

| | Original | Traducción |
|---|---|---|
| `p49:B957` | 『オレだ・・・ファンのー人だ。<br>SNAKE、気をつけろ。 ▼<br>そのヘヤにあのデンセツのゲリラ<br>ブタイ、ウィスパーズの生きの<br>こり、NIGHT　SIGHTが<br>いる ▽ | (sin nombre): Soy yo... uno de tus admiradores. SNAKE, ten cuidado.<br>En esa habitación está NIGHT SIGHT, superviviente de aquella guerrilla legendaria, los Whispers. |
| `p49:B9A9`<br>32 cuadros después | SNAKE『NIGHT　SIGHT・・・ ▽ | SNAKE: NIGHT SIGHT... |
| `p49:B9BA`<br>32 cuadros después | 『サイシンのカモフラージュ・スーツ<br>をきてステルス。 ▼<br>おまけに全くジュウセイのしないジ<br>ュウ、ウェイ・ション・ショウ・シ<br>ャンでコウゲキしてくる。 ▼<br>ダレもヤツのスガタを見たことがな<br>い。わかるか？この意味が・・・ ▽ | (sin nombre): Lleva el último traje de camuflaje: invisible.<br>Y encima ataca con una pistola que no hace ningún ruido, la Wei Xiong Shou Shan.<br>Nadie lo ha visto nunca. ¿Entiendes lo que quiere decir? |
| `p49:BA29`<br>32 cuadros después | SNAKE『シンセツなファンをもって<br>コウエイだ ▽ | SNAKE: Es un honor tener un admirador tan amable. |
| `p49:BA3D`<br>32 cuadros después | 『音に注意するんだ。SNAKE！<br>・・・OVER ▽ | (sin nombre): ¡Atento a los ruidos, SNAKE! ...CAMBIO |

#### Conversación de p48:847A

**Ficha 0** (siempre)

| | Original | Traducción |
|---|---|---|
| `p49:BB3C` | ホーリー『SNAKE！大へんっ！！ ▽ | HOLLY: ¡SNAKE! ¡¡Es terrible!! |
| `p49:BB5B`<br>32 cuadros después | SNAKE『どうした！ホーリー？ ▽ | SNAKE: ¡¿Qué pasa?! ¿Holly? |
| `p49:BB67`<br>32 cuadros después | ホーリー『SNAKE。<br>ペトロビッチのこと・・・・<br>気になったからキョクにしらべても<br>らったの。 ▼<br>OUTER　HEAVENから救出<br>されたあとのカレだけど・・・<br>コウフクではなかったみたい。 ▼<br>西がわではカレのカゲキなキョクロ<br>ンはうけ入れられなかったのよ。 ▼<br>カレはキョウキの学者として学会か<br>らソガイされ、時がたつにつれ・・<br>わすれられた。 ▼<br>カレもそんな学会をよくおもってい<br>なかったらしいの。<br>見かえしてやろうとおもったにちが<br>いないわ。 ▼<br>・・・そんな時、ザンジバーランド<br>からのニジュウスパイのハナシがも<br>ちこまれた。 ▼<br>博士の立場をリヨウして東西のサイ<br>シンカガクをザンジバーランドにな<br>がすというヤク目を・・・ ▽ | HOLLY: SNAKE. Lo de Pettrovich... me tenía preocupada y pedí en la cadena que lo investigaran.<br>Después de que lo rescataran de OUTER HEAVEN... parece que no fue feliz.<br>En el Oeste no aceptaron sus teorías extremas.<br>Lo apartaron del mundo académico por científico loco y, con el tiempo... lo olvidaron.<br>Él tampoco tenía en buena estima a ese mundo académico. Seguro que quiso demostrarles algo.<br>...Y entonces le llegó la propuesta de ser agente doble para Zanzibar Land.<br>El papel de aprovechar su puesto de doctor para pasar a Zanzibar Land la ciencia más nueva del Este y del Oeste... |
| `p49:BCAD`<br>32 cuadros después | SNAKE『するとこんどのマルフのイッケンも<br>？ ▽ | SNAKE: ¿Entonces lo de Marv también? |
| `p49:BCC2`<br>32 cuadros después | ホーリー『そうね、タイミングがよすぎるわ。<br>マルフのショウサイにわたるトベイ<br>スケジュールをペトロビッチがなが<br>していたからにちがいないわ ▽ | HOLLY: Sí, todo encaja demasiado bien. Seguro que Pettrovich filtró el programa detallado del viaje de Marv a América. |
| `p49:BD04`<br>32 cuadros después | SNAKE『サイショからペトロビッチはOI<br>LIXをてに入れるためにマルフ<br>にちかづき、ドウコウした ▽ | SNAKE: Pettrovich se acercó a Marv y viajó con él desde el principio para hacerse con OILIX. |
<!-- /generado -->

## Las escenas

Lo que se dice fuera del transceptor: las escenas, los avisos y los niños. Van por la historia: el orden de las peleas ([Los jefes](LOS-JEFES.html)) y, entre ellas, el que cuentan los propios mensajes; el momento exacto de cada escena no está medido jugando. Al lado, la traducción (`tools/traducciones_textos.py`, hecha a mano; cada salto de línea, el de la ventana del juego).

<!-- generado:escenas -->
### La llegada

| | Original | Traducción |
|---|---|---|
| `p48:8018` | SNAKE『こちらSOLID　SNAKE。<br>オウトウねがいます・・・ | SNAKE: Aquí SOLID SNAKE. Responded, por favor... |

### BLACK COLOR

Donde debería estar Marv, una voz firmada «マルフ» se ríe de Snake; luego BLACK COLOR.

| | Original | Traducción |
|---|---|---|
| `p50:87AC` | マルフ『ふふ・・・おろかな、<br>FOX　HOUNDER！ ▼▼<br><br>マルフ『マルフ博士はここにはいないっ！<br>こんな安っぽいハッシンキでだまそ<br>うとはFOX　HOUNDもソウト<br>ウ、ジダイおくれだな ▽ | MARV: Je, je... ¡necio, FOX HOUNDER!<br>MARV: ¡El doctor Marv no está aquí! Querer engañarnos con un transmisor tan barato... FOX HOUND se ha quedado anticuado. |
| `p50:8807` | BLACK『オレはBLACK　COLOR<br>NASAのタイチキュウ外カンキョ<br>ウトクシュブタイ出身。 ▼<br>世界ーのハイテクフセイキ戦ブタイ<br>、FOX　HOUNDとやらのジツ<br>リョクを見せてもらおうか！ ▼<br>こいっ！FOX　HOUNDER ▽ | BLACK: Soy BLACK COLOR, de las fuerzas especiales de entornos extraterrestres de la NASA.<br>¡A ver de qué es capaz la mejor unidad de guerra irregular de alta tecnología del mundo, esa FOX HOUND!<br>¡Vamos, FOX HOUNDER! |
| `p50:887B` | BLACK『・・・SNAKE ▼▼<br><br>SNAKE『だれだ？・・なぜ、名前を ▼▼<br><br>BLACK『オ、オレだ・・・シュナイダー。<br>カイル・シュナイダーだ。<br>おぼえているか？ ▼▼<br><br>SNAKE『シュナイダー？<br>・・・あのOUTER　HEAVE<br>Nのレジスタンスだった？ ▼<br>しかし、あの時・・・ヤツらにころ<br>されたはず ▼▼<br><br>BLACK『SNAKE、<br>お前もまだあまいな。 ▼<br>オレがころされかけたのはヤツら<br>にではない、お前らとお前らの<br>クニにだ ▼▼<br><br>SNAKE『シュナイダー？イミがわからん ▼▼<br><br>BLACK『・・・SNAKE、お前がメタル・<br>ギアをハカイしたあと、 ▼<br>NATO軍による大キボなOUTE<br>R　HEAVENバクゲキがおこな<br>われた。 ▼<br>レジスタンスであったわれわれも<br>OUTER　HEAVENの女コド<br>モも・・・みんな見すてられた。 ▼<br>カレらはモウカの中でにげまとい<br>・・・のたれ死んでいった ▼▼<br><br>SNAKE『そんな、ばかな・・・ ▼▼<br><br>BLACK『もともとOUTER　HEAVEN<br>のコドモたちは世界カッコクからあ<br>つめられた戦ソウコジやナンミンだ<br>。 ▼<br>ヤツらにとってカレらのようなコド<br>モたちはふれたくはないソンザイだ<br>った・・・ ▼▼<br><br>SNAKE『・・・まさか ▼▼<br><br>BLACK『お前らも同じだ。<br>いずれわすれられる・・・<br>しかし、あの人は・・・ ▼▼<br><br>SNAKE『あ・の・人・・・？ ▼▼<br><br>BLACK『にげまとうわれわれを救ってくれた<br>のは・・・あのお方。 ▼<br>あの人はわれわれのしたことをゆる<br>してくれた上、われわれにあたらし<br>いトチやカゾクをあたえてくれた<br>・・・ ▼▼<br><br>SNAKE『あの人・・・もしや？ ▼▼<br><br>BLACK『SNAKE、今にお前もわかる。<br>あの人のすばらしさが・・・ ▼▼<br><br>BLACK『SNAKE・・・お前にはかりはあ<br>ってこそうらみはない。<br>博士の場所をおしえてやろう。 ▼<br>あの人のイシにさからうことではな<br>い・・・博士のカンキンされている<br>ドクボウのみはりをさがすんだ。 ▼<br>その男をビコウすれば・・・ドクボ<br>ウへたどりつける。 ▼<br>男のトクチョウはグリーンベレーを<br>かぶっている。1Fにいるはずだ。<br>いいか・・グリーンベレーだ。 ▼<br>グリーンベレーの男をビコウしろ！<br> ▽ | BLACK: ...SNAKE<br>SNAKE: ¿Quién eres? ...¿Cómo sabes mi nombre?<br>BLACK: S-soy yo... Schneider. Kyle Schneider. ¿Te acuerdas?<br>SNAKE: ¿Schneider? ...¿El de la resistencia de OUTER HEAVEN? Pero entonces... te tuvieron que matar.<br>BLACK: SNAKE, sigues siendo un ingenuo. No fueron ellos los que casi me matan: fuisteis vosotros y vuestro país.<br>SNAKE: ¿Schneider? No lo entiendo.<br>BLACK: ...SNAKE, después de que destruyeras Metal Gear, la OTAN bombardeó OUTER HEAVEN a lo grande. Nosotros, la resistencia, y las mujeres y los niños de OUTER HEAVEN... nos abandonaron a todos. Corrían entre las llamas... y murieron como perros.<br>SNAKE: No puede ser...<br>BLACK: Los niños de OUTER HEAVEN eran huérfanos de guerra y refugiados traídos de todo el mundo. Para ellos, niños así eran algo que preferían no tocar...<br>SNAKE: ...No será...<br>BLACK: Vosotros sois iguales. Tarde o temprano os olvidarán... Pero aquel hombre...<br>SNAKE: ¿Aquel... hombre...?<br>BLACK: El que nos salvó mientras huíamos... fue él. Nos perdonó lo que habíamos hecho y nos dio tierra y familias nuevas...<br>SNAKE: Aquel hombre... ¿será...?<br>BLACK: SNAKE, pronto lo entenderás. Lo grande que es...<br>BLACK: SNAKE... a ti te debo un favor, no te guardo rencor. Te diré dónde está el doctor. No va contra su voluntad... Busca al guardia de la celda donde tienen al doctor. Sigue a ese hombre... y llegarás a la celda. Lleva una boina verde. Estará en el 1F. Recuerda... una boina verde. ¡Sigue al hombre de la boina verde! |

### RUNNING MAN

| | Original | Traducción |
|---|---|---|
| `p50:8BDA` | ランニング『ひさしぶりのキャクジンか？<br>・・・いいところに来たぜ。 ▼<br>これからひとっぱしりしようとおも<br>っていたところだ。 ▼<br>オレはRUNNING　MAN<br>世界ーシュン足なヨウヘイだ。<br>オレの足についてこれるかな？ ▼▼<br><br>ランニング『見てろっ！！ | RUNNING: ¿Una visita, después de tanto tiempo? ...Llegas en buen momento. Iba a echar una carrera. Soy RUNNING MAN, el mercenario más rápido del mundo. ¿Podrás seguirme?<br>RUNNING: ¡¡Mira!! |
| `p50:8C4E` | ランニング『・・・ハァ・・ハァ・・・どうだ？<br>はやいだろう？<br>そろそろホンバンといこうかっ！ | RUNNING: ...Uf... uf... ¿qué? Rápido, ¿eh? ¡Ahora vamos en serio! |
| `p50:8C79` | ランニング『きこえるか・・・この音。<br>シンケイガスだ。<br>ガスにおかされる前におれを<br>たおせばお前はたすかる ▼<br>時間のショウブだ・・いくぞっ！ | RUNNING: ¿Oyes... ese ruido? Es gas nervioso. Si me tumbas antes de que te alcance el gas, te salvas. Es una carrera contra el tiempo... ¡allá voy! |
| `p50:8CBF` | ランニング『・・オレの・・オレのはやさをサカ<br>テにとるとは？<br>お前の名は？ ▼▼<br><br>SNAKE『SNAKE・・・<br>SOLID　SNAKE ▼▼<br><br>ランニング『・・・SNAKE？<br>チータがヘビにまけた・・<br>なぜ？ ▼▼<br><br>SNAKE『・・・死にいそいだんだろう？ | RUNNING: ...¿Has... has vuelto mi velocidad contra mí? ¿Cómo te llamas?<br>SNAKE: SNAKE... SOLID SNAKE<br>RUNNING: ...¿SNAKE? Un guepardo vencido por una serpiente... ¿por qué?<br>SNAKE: ...Tenías prisa por morir. |

### Holly

| | Original | Traducción |
|---|---|---|
| `p51:AAE9` | ホーリー『・・・ごめん。<br>大ジョウブ・・・わ・た・し ▽ | HOLLY: ...Perdona. Tranquilo... soy y-o. |
| `p51:AB02` | SNAKE『ホーリー！？ ▽ | SNAKE: ¡¿Holly?! |
| `p51:AB0B` | ホーリー『おどろいた？ ▽ | HOLLY: ¿Te he sorprendido? |
| `p51:AB14` | SNAKE『フウーッ・・・命びろいした。<br>で、どうした？・・・こんなところまで？ ▽ | SNAKE: Uf... me he salvado por poco. ¿Y qué haces?... ¿Hasta aquí? |
| `p51:AB3A` | ホーリー『ヤクソクしたでしょ？<br>生きていたらいつでも会える ▽ | HOLLY: Te lo prometí, ¿no? Si seguimos vivos, siempre podemos vernos. |
| `p51:AB56` | SNAKE『・・・そうか ▽ | SNAKE: ...Ya. |
| `p51:AB5F` | ホーリー『あぁー・・・このセイフク、<br>ムネの所がくるしくて・・・すっとしたわ ▽ | HOLLY: Aaah... este uniforme me aprieta en el pecho... qué alivio. |
| `p51:AB83` | ホーリー『これ、テキからうばったジュウよ。<br>つかって・・・ ▽ | HOLLY: Toma, un arma que le quité al enemigo. Úsala... |
| `p51:AB9D` | SNAKE『たしかに・・・女にはつかいにくいジュウだ。<br>たすかる ▽ | SNAKE: Es verdad... un arma difícil para una mujer. Gracias. |
| `p51:ABBA` | ホーリー『・・・みんな、すんだのね。SNAKE？ ▽ | HOLLY: ...Se acabó todo, ¿no, SNAKE? |
| `p51:ABCF` | SNAKE『いや・・・<br>まだやらなければいけないことがある ▽ | SNAKE: No... todavía me queda algo por hacer. |
| `p51:ABE8` | ホーリー『・・・ま・さ・か ▽ | HOLLY: ...No s-e-r-á... |
| `p51:ABF3` | SNAKE『そうだ・・・ホーリー？ ▽ | SNAKE: Eso es... ¿Holly? |
| `p51:AC01` | ホーリー『SNAKE？まさか・・・わたしを？ ▽ | HOLLY: ¿SNAKE? ¿No será... yo? |
| `p51:AC15` | SNAKE『・・・フフフ<br>・・・むかえのクルマをよぼうか？ ▽ | SNAKE: ...Je, je... ¿te pido un coche? |
| `p51:AC2F` | ホーリー『・・・なんだぁ・・・ジョウダンきつい ▽ | HOLLY: ...Anda ya... qué broma más pesada. |
| `p51:AC44` | SNAKE『ホーリー、救出地テンまでー気にはしる。<br>・・・ついてこれるか？ ▽ | SNAKE: Holly, corremos de un tirón hasta el punto de rescate. ...¿Podrás seguirme? |
| `p51:AC6A` | ホーリー『・・・それっ、プロポーズなの？ ▽ | HOLLY: ...¿Eso es una proposición? |
| `p51:AC7C` | SNAKE『そのヨウスだと大ジョウブだな ▽ | SNAKE: Si dices eso, estás bien. |
| `p51:AC8D` | ホーリー『たすかったわ、SNAKE ▽ | HOLLY: Me has salvado, SNAKE. |
| `p51:AC9C` | SNAKE『・・・・ ▽ | SNAKE: .... |
| `p51:ACA3` | ホーリー『どうしたの？ ▽ | HOLLY: ¿Qué pasa? |
| `p51:ACAB` | SNAKE『いや、キミがこんなにビジンだとは・・・ ▽ | SNAKE: Nada, no pensaba que fueras tan guapa... |
| `p51:ACC0` | ホーリー『まぁ、イメージがちがって？ ▽ | HOLLY: Vaya, ¿no me imaginabas así? |
| `p51:ACCF` | SNAKE『もっとはやくゴウリュウすればよかった ▽ | SNAKE: Tendría que haberme reunido contigo antes. |
| `p51:ACE4` | ホーリー『SNAKE、マルフ博士のことだけど・・・<br>ブジらしいわ ▽ | HOLLY: SNAKE, sobre el doctor Marv... parece que está bien. |
| `p51:AD03` | SNAKE『らしい？<br>セッショクがとれたって・・・ ▽ | SNAKE: ¿Parece? Has contactado... |
| `p51:AD19` | ホーリー『あったわけじゃないのよ。<br>・・・カレどこかにカンキンされてるんだけど<br>・・・デンショバトをとばしたらしいの。<br>なにかてがかりがかかれているはずよ ▽ | HOLLY: No es que lo haya visto. ...Lo tienen encerrado en algún sitio... pero parece que ha soltado una paloma mensajera. Tiene que llevar alguna pista. |
| `p51:AD63` | SNAKE『ハト？・・・今どこに？ ▽ | SNAKE: ¿Una paloma? ...¿Dónde está ahora? |
| `p51:AD72` | ホーリー『それが見つけたんだけどもうちょっとのところ<br>でにげられちゃって・・・<br>タワービルのエレベーターこうをのぼっていっ<br>たわ ▽ | HOLLY: La encontré, pero se me escapó en el último momento... subió por el hueco del ascensor de la torre. |
| `p51:ADB0` | SNAKE『オクジョウか？！ ▽ | SNAKE: ¡¿A la azotea?! |
| `p51:ADBB` | ホーリー『ここの連中もヒッシになってさがしているわ。<br>カレらよりはやくつかまえないと、マルフ博士<br>のユイイツのてがかりよ ▽ | HOLLY: Los de aquí también la buscan como locos. Hay que cogerla antes que ellos; es la única pista del doctor Marv. |
| `p51:ADF8` | SNAKE『ハトさがしか？・・・キミはどうする？ ▽ | SNAKE: ¿A cazar palomas? ...¿Y tú qué harás? |
| `p51:AE0C` | ホーリー『わたし、足でまといになるわ。<br>もうすこしジョウホウをあつめたいしね。<br>ヒョウカ下がってるのよ。ここんとこ・・・<br>それに、こんな目にあったんですもの。 ▼<br>このままではおさまらないわ！ ▽ | HOLLY: Solo te estorbaría. Y quiero reunir algo más de información. Últimamente me ha bajado la audiencia... Además, después de lo que me han hecho... ¡no puedo dejarlo así! |
| `p51:AE6A` | SNAKE『こころづよいな・・・ムリはするなよ ▽ | SNAKE: Eso me tranquiliza... no te pases. |
| `p51:AE7D` | ホーリー『トウチョウされるといけないからシュウハスウ<br>かえるわね。<br>140・76ね。SNAKE ▽ | HOLLY: Cambio de frecuencia, por si nos escuchan. La 140.76, SNAKE. |
| `p51:AEA9` | ホーリー『それから、カードをコピーしておいたわ。<br>カード4、つかって・・・ ▽ | HOLLY: Y he copiado una tarjeta. La tarjeta 4, úsala... |
| `p51:AECB` | ホーリー『じゃあね、SNAKE・・・またあとで ▽ | HOLLY: Adiós, SNAKE... hasta luego. |
| `p51:AEDF` | SNAKE『ホーリー！ ▽ | SNAKE: ¡Holly! |
| `p51:AEE7` | ホーリー『えっ？・・・ ▽ | HOLLY: ¿Eh?... |
| `p51:AEF0` | SNAKE『今のは、恋人同士のわかれのコトバだ ▽ | SNAKE: Eso es lo que se dicen los enamorados al despedirse. |
| `p51:AF08` | ホーリー『・・・じゃあ、私たちは？<br>・・・なんて言うの？ ▽ | HOLLY: ...Entonces, ¿nosotros... qué nos decimos? |
| `p51:AF23` | SNAKE『いきていればいつでもあえる・・・ ▽ | SNAKE: Si seguimos vivos, siempre podemos vernos... |
| `p51:AF36` | ホーリー『・・・・わかったわ ▽ | HOLLY: ....De acuerdo. |

### La paloma de Marv

| | Original | Traducción |
|---|---|---|
| `p50:871F` | SNAKE『ん？・・・<br>ハトの足にカミがしばってあるぞ ▼<br>HELP！　WIS、0HI0<br>KIO　MARV・・・ ▼<br>Hだけが小文じ？<br>マルフ博士のでん言なのか？<br>なんの意味だろうか？ | SNAKE: ¿Eh?... La paloma lleva un papel atado a la pata. HELP! WIS, 0HI0 KIO MARV... ¿Solo la H en minúscula? ¿Es un mensaje del doctor Marv? ¿Qué querrá decir? |

### RED BLASTER

| | Original | Traducción |
|---|---|---|
| `p50:8D27` | SNAKE『こ、これは？<br>・・・ブービー・トラップ？ ▼▼<br><br>RED『その通りだ。<br>キツネを生けどるトラップさ。<br>FOX　HOUNDER！ | SNAKE: ¿Q-qué es esto? ...¿Una trampa?<br>RED: Exacto. Una trampa para cazar zorros vivos. ¡FOX HOUNDER! |
| `p50:8D64` | RED『おれはRED　BLASTER<br>これで動けまい。おれのグレネード<br>でゆっくりリョウリしてやろう | RED: Soy RED BLASTER. Ahora no puedes moverte. Te voy a cocinar despacito con mis granadas. |

### ULTRABOX

| | Original | Traducción |
|---|---|---|
| `p50:8DE4` | BOX『おれたちはみっ室専門のアンサ<br>ツブタイULTRABOX<br>だ。 ▼<br>大トウリョウおかかえのゴクヒ<br>チームだ。 ▼<br>おれたちにリョウリされること<br>をホコリにおもえ | BOX: Somos ULTRABOX, el comando de asesinos especialista en cuartos cerrados.<br>El equipo secretísimo del propio Gran Jefe.<br>Siéntete orgulloso de que te cocinemos nosotros. |

### PREDATOR

| | Original | Traducción |
|---|---|---|
| `p50:8D95` | プレデター『まってたぞ。SNAKE！<br>おれはPREDATOR。<br>ジャングル内でのアンブッシュでは<br>おれの右にでるものはいない。 ▼<br>本物のヘビかどうかためしてやる | PREDATOR: Te esperaba, SNAKE. Soy PREDATOR. En las emboscadas en la selva nadie me gana.<br>A ver si eres una serpiente de verdad. |

### Natasha

| | Original | Traducción |
|---|---|---|
| `p51:A878` | SNAKE『ナターシャ？ ▽ | SNAKE: ¿Natasha? |
| `p51:A881` | ナターシャ『・・・そうよ、私・・・<br>STBキョクインのナターシャ・マルコヴァ ▽ | NATASHA: ...Así es, soy... Natasha Markova, agente del STB. |
| `p51:A8A5` | ナターシャ『SOLID　SNAKEね・・・<br>おたがいおうものは同じ。キョウリョクして<br>マルフ博士をたすけましょう ▽ | NATASHA: SOLID SNAKE, ¿no?... buscamos lo mismo. Colaboremos y rescatemos al doctor Marv. |
| `p51:A8DD` | SNAKE『・・・どこかであったことがある？ ▽ | SNAKE: ...¿Nos hemos visto en algún sitio? |
| `p51:A8F0` | ナターシャ『それっ？西がわの男たちのダイヒョウ的な<br>くどきモンクでしょ ▽ | NATASHA: ¿Eso? La frase típica de los hombres del Oeste para ligar, ¿no? |
| `p51:A913` | SNAKE『そうだっ！・・・おもいだしたぞ。<br>ナターシャ・マルコヴァ、氷のヨウセイ・・・<br>カルガリー・オリンピックのゴールドメダリス<br>ト ▽ | SNAKE: ¡Eso es!... ya me acuerdo. Natasha Markova, el hada del hielo... la medalla de oro de los Juegos de Calgary. |
| `p51:A955` | ナターシャ『・・・人ちがいだわ ▽ | NATASHA: ...Te confundes de persona. |
| `p51:A962` | SNAKE『そんなはずはない。たしかに・・・ ▽ | SNAKE: No puede ser. Estoy seguro... |
| `p51:A975` | ナターシャ『そんなことより、マルフ博士は？ ▽ | NATASHA: Déjate de eso, ¿y el doctor Marv? |
| `p51:A989` | SNAKE『ムセンキでコンタクトしたんだが・・・<br>コトバが通じない ▽ | SNAKE: Contacté con él por radio... pero no nos entendíamos. |
| `p51:A9A8` | ナターシャ『ブジなのね・・・よかった。<br>コガタムセンキのうめこみシュジュツをして<br>おいてよかったわ。<br>SNAKE、ムセンキかして・・・ ▽ | NATASHA: Entonces está bien... menos mal. Qué bien que le implantáramos una radio pequeña. SNAKE, déjame la radio... |
| `p51:A9E8` | SNAKE『シュウハスウは140・51だ ▽ | SNAKE: La frecuencia es la 140.51. |
| `p51:A9F9` | ナターシャ『SNAKE、今のところマルフはブジよ。<br>タワービルの北に大きなクレバスがあるんだけ<br>ど・・・そのさきの収容所にいるらしいわ。 ▼<br>マルフ博士はペトロヴィッチ博士のことを<br>シンパイしていたわ ▽ | NATASHA: SNAKE, de momento Marv está bien. Al norte de la torre hay una grieta grande... parece que está en el campo de prisioneros del otro lado. El doctor Marv estaba preocupado por el doctor Pettrovich. |
| `p51:AA62` | SNAKE『ペトロヴィッチはブジだ。シンパイない。<br>さきにマルフを救出する。・・・いいな ▽ | SNAKE: Pettrovich está bien. No te preocupes. Primero rescatamos a Marv... ¿de acuerdo? |
| `p51:AA8D` | ナターシャ『クレバスへならチカミチがあるわ。<br>この下にふるい地下水道があるの。<br>そのエレベーターでおりれるわ・・・<br>いきましょう ▽ | NATASHA: Hay un atajo a la grieta. Aquí abajo hay unas alcantarillas viejas. Se baja con ese ascensor... vamos. |
| `p51:AACF` | SNAKE『ヒューッ！こんなところに・・・<br>エレベーターが ▽ | SNAKE: ¡Vaya! En un sitio así... un ascensor. |

### Pettrovich en el ascensor

| | Original | Traducción |
|---|---|---|
| `p51:A765` | ペトロ『おう！・・・ナターシャ、<br>SNAKE！ ▽ | PETRO: ¡Oh!... ¡Natasha, SNAKE! |
| `p51:A77B` | ナターシャ『よくゴブジで・・・ ▽ | NATASHA: Estás sano y salvo... |
| `p51:A787` | SNAKE『・・・すこしやせたな<br>・・・ペトロヴィッチ ▽ | SNAKE: ...Has adelgazado un poco... Pettrovich. |
| `p51:A79F` | ペトロ『きみはかわらんな、SNAKE ▽ | PETRO: Tú no has cambiado, SNAKE. |
| `p51:A7B0` | ナターシャ『SNAKE、いそぎましょう！<br>マルフ博士のところへ ▽ | NATASHA: SNAKE, ¡deprisa! A por el doctor Marv. |
| `p51:A7CE` | ペトロ『なにっ、マルフはブジか。 ▼<br>わしもここからなんとかダッシュツ<br>しようとしたんじゃがこのエレベー<br>ターは内がわからひらかんのじゃ ▽ | PETRO: ¿Qué, Marv está bien? Yo intenté escapar de aquí como fuera, pero este ascensor no se abre desde dentro. |
| `p51:A810` | SNAKE『ナターシャ、3人でいちれつになっ<br>てすすもう！ ▽ | SNAKE: Natasha, ¡sigamos los tres en fila! |
| `p51:A82B` | ペトロ『まってくれ！SNAKE、<br>あんたにわたすもんがある ▽ | PETRO: ¡Espera! SNAKE, tengo algo para ti. |
| `p51:A847` | ペトロ『ミハリからくすねておいたんじゃ<br>・・・カード5 ▽ | PETRO: Se la birlé al guardia... la tarjeta 5. |
| `p51:A861` | ナターシャ『あなたのあとについていくわ、<br>SNAKE ▽ | NATASHA: Te sigo, SNAKE. |

### Las alcantarillas

| | Original | Traducción |
|---|---|---|
| `p51:A2AB` | ペトロ『おーい！SNAKE<br>・・・もうだめじゃ！<br>すこしやすませてくれ ▽ | PETRO: ¡Eh! SNAKE... ¡no puedo más! Déjame descansar un poco. |
| `p51:A2CD` | ナターシャ『SNAKE・・・？ ▽ | NATASHA: ¿SNAKE...? |
| `p51:A2D9` | SNAKE『わかった・・・<br>すこしキュウケイしようか ▽ | SNAKE: De acuerdo... descansemos un poco. |
| `p51:A2F0` | ペトロ『わしは・・・<br>ちょっと用を足してくる ▽ | PETRO: Voy un momento... a hacer mis necesidades. |
| `p51:A307` | ナターシャ『・・・おかしいわね ▽ | NATASHA: ...Qué curioso. |
| `p51:A313` | SNAKE『シカタない、<br>ペトロヴィッチはああ見えても年だ ▽ | SNAKE: Qué le vamos a hacer, Pettrovich es mayor, aunque no lo parezca. |
| `p51:A32F` | ナターシャ『ちがうわよ。わたしたち・・・<br>世界的なテンサイ学者、もとオリンピックセ<br>ンシュ、もとトクシュブタイタイインがこん<br>な下水道で・・・ ▽ | NATASHA: No es eso. Nosotros... un científico genial famoso en el mundo entero, una antigua atleta olímpica, un antiguo miembro de las fuerzas especiales, en unas alcantarillas como estas... |
| `p51:A37B` | SNAKE『・・・ウンメイさ ▽ | SNAKE: ...Es el destino. |
| `p51:A386` | ナターシャ『ウンメイ？そうね、そうかもしれないわ・・・<br>わたしね、コドモのころ・・<br>よくきかされたの。 ▼<br>わたしのハハに・・・だい2次世界大戦中のポ<br>ーランド、ワルシャワほうきのハナシ。<br>わたしのハハは地下水道をナンニチもはしって<br>ナチスのてからにげのびたの。 ▼<br>ドロまみれになって・・真っクロになって・・<br>カオも見わけがつかないくらいにね。<br>・・・オヤコね。わたしもハハも・・・<br>戦そうにとりつかれているのよ。きっと ▽ | NATASHA: ¿El destino? Sí, puede que sí... De pequeña... me contaban mucho una historia. Mi madre... la de Polonia en la Segunda Guerra Mundial, el levantamiento de Varsovia. Mi madre corrió días enteros por las alcantarillas y escapó de los nazis. Cubierta de barro... negra entera... no se le reconocía ni la cara. ...De tal madre, tal hija. Mi madre y yo... estamos poseídas por la guerra. Seguro. |
| `p51:A45F` | SNAKE『・・・ナターシャ。スケートをやめてどうして<br>STBなんかに？<br>いくら東がわでもオリンピックセンシュともな<br>るとタイグウがいいんじゃないのか ▽ | SNAKE: ...Natasha. ¿Por qué dejaste el patinaje para entrar en el STB? Aunque sea en el Este, a una atleta olímpica la tratan bien, ¿no? |
| `p51:A4A8` | ナターシャ『・・・そうでもないわ。<br>なんていうか・・・そう、氷が・・氷が冷たく<br>かんじたから ▽ | NATASHA: ...No tanto. Cómo decirlo... sí, el hielo... porque el hielo se me hizo frío. |
| `p51:A4D6` | SNAKE『氷・・・？ ▽ | SNAKE: ¿El hielo...? |
| `p51:A4DF` | ナターシャ『SNAKE、おくさんはいるの？ ▽ | NATASHA: SNAKE, ¿estás casado? |
| `p51:A4F1` | SNAKE『・・・いや、カゾクはいない。キミは？ ▽ | SNAKE: ...No, no tengo familia. ¿Y tú? |
| `p51:A506` | ナターシャ『ひとりよ・・・べつにドクシンシュギシャ<br>でもないわ。チャンスがなかったのかしら ▽ | NATASHA: Sola... no es que esté en contra de casarme. Supongo que no tuve ocasión. |
| `p51:A530` | SNAKE『恋人は？ ▽ | SNAKE: ¿Y algún amor? |
| `p51:A539` | ナターシャ『・・・いちどだけ、<br>いちどだけケッコンをかんがえたことがあった<br>。わたしがまだ氷の上をはしっていたころ。 ▼<br>今でもくるしくなるような大恋あいだった・・<br>フランク・ハンターっていう西がわの男。<br>ハンサムでシンシで・・・インテリで。<br>でもいつもなにかにおびえていた。 ▼<br>わたし、カゾクもスケートもなにもかもすてて<br>・・・どこまでもおいかけていきたかった ▽ | NATASHA: ...Una sola vez, una sola vez pensé en casarme. Cuando aún corría sobre el hielo. Fue un gran amor que todavía duele... un hombre del Oeste llamado Frank Hunter. Guapo, un caballero... un intelectual. Pero siempre tenía miedo de algo. Yo quería dejar a mi familia, el patinaje, todo... e irme tras él adonde fuera. |
| `p51:A5EF` | SNAKE『ボウメイを？ ▽ | SNAKE: ¿Desertar? |
| `p51:A5F8` | ナターシャ『そう・・・でもだめだった。<br>西がわはわたしのうけ入れをサイゴになって<br>キョヒしたの。<br>よくわからないけど、政治的なリユウで・・ ▽ | NATASHA: Sí... pero no salió. El Oeste se negó a acogerme en el último momento. No sé bien por qué, por razones políticas... |
| `p51:A63F` | SNAKE『レセプション・コミュニティーがととのってい<br>なかったんだ。よくあることだ ▽ | SNAKE: La comunidad de acogida no estaba preparada. Pasa a menudo. |
| `p51:A666` | ナターシャ『それ以来、わたしやカゾクはひどいセイカツを<br>・・・わたしたちはセンシュケンをうばわれ、<br>リフューズニクにされ・・・<br>STBに入るしかなかったのよ。 ▼<br>でも、コウカイはしてないわ。<br>以前の氷の上しかしらなかったわたしとちがっ<br>て今ではいろんな事をしったわ。<br>・・・人もころした ▽ | NATASHA: Desde entonces mi familia y yo hemos llevado una vida horrible... nos quitaron el derecho a competir, nos hicieron refuseniks... no tuve más remedio que entrar en el STB. Pero no me arrepiento. Al contrario que antes, cuando solo conocía el hielo, ahora he aprendido muchas cosas. ...Hasta he matado. |
| `p51:A6FB` | SNAKE『カレには・・・それ以来？ ▽ | SNAKE: ¿Y a él... desde entonces? |
| `p51:A70C` | ナターシャ『会ってないわ。・・・わたしたちの中のベルリ<br>ンのカべはいつまでものこっていたのね。 ▽ | NATASHA: No lo he vuelto a ver. ...El muro de Berlín que llevábamos dentro se quedó en pie para siempre. |
| `p51:A73A` | ペトロ『おーい！！おまたせ ▽ | PETRO: ¡¡Eh!! Perdonad la espera. |
| `p51:A746` | SNAKE『・・・ながいトイレだ ▽ | SNAKE: ...Mucho rato en el retrete. |
| `p51:A753` | ナターシャ『・・・いきましょう。SNAKE ▽ | NATASHA: ...Vamos, SNAKE. |

### El puente

| | Original | Traducción |
|---|---|---|
| `p50:9FA9` | SNAKE『ハシだっ！！ ▽ | SNAKE: ¡¡Un puente!! |
| `p50:9FB2` | ナターシャ『ー人ずつしかわたれないわ ▽ | NATASHA: Solo se puede cruzar de uno en uno. |
| `p50:9FC2` | ペトロ『わしからいこう。オイサキみじかい<br>もの、どうなってもダレもかなしま<br>んわい ▽ | PETRO: Voy yo primero. Me queda poco; nadie llorará me pase lo que me pase. |
| `p50:9FEA` | ペトロ『大ジョウブじゃ！わたってこい ▽ | PETRO: ¡Aguanta! Cruzad. |
| `p50:9FFC` | ナターシャ『じゃ、次はわたしね・・・<br>おさきに、SNAKE ▽ | NATASHA: Pues ahora yo... me adelanto, SNAKE. |
| `p51:A017` | ナターシャ『大ジョウブみたいよ。SNAKE、<br>はやくわたってきて！ ▽ | NATASHA: Parece que aguanta. SNAKE, ¡cruza rápido! |
| `p51:A036` | SNAKE『ナターシャっ！！ ▽ | SNAKE: ¡¡Natasha!! |
| `p51:A041` | SNAKE『・・・ナ、ナターシャ ▽ | SNAKE: ...N-Natasha |
| `p51:A04E` | ナターシャ『・・・あ、わたし ▽ | NATASHA: ...Ay, yo... |
| `p51:A059` | ナターシャ『わたし、やっぱり・・・<br>氷の上しかあるけなかったみたい。 ▼<br>すべることばかりで・・・<br>リョウアシで、ちゃんとリョウアシでジメンを<br>ふみしめてあるくことをしなかったわ・・・<br> ▽ | NATASHA: Yo... parece que al final solo sabía andar sobre el hielo. Siempre resbalando... nunca anduve con los dos pies, con los dos pies bien firmes en el suelo... |
| `p51:A0B3` | SNAKE『東西の氷はとけはじめているんだ。<br>ナターシャ？<br>こんどこそジメンの上をしっかりと・・<br>自分の人生の上をふみしめて味わう時だ。 ▼<br>ナターシャ？<br>まだだ、まだだ・・・ ▽ | SNAKE: El hielo entre el Este y el Oeste empieza a derretirse. ¿Natasha? Ahora sí es el momento de pisar firme en el suelo... de pisar tu propia vida y disfrutarla. ¿Natasha? Aún no, aún no... |
| `p51:A111` | ナターシャ『もういいのよ・・・わたし、なん人もの死を見<br>てきているわ。<br>自分がどんなジョウタイか・・・わかる。 ▼<br>・・・ザンネンだわ。<br>またいい人にめぐりあえたのに ▽ | NATASHA: Ya está... he visto morir a mucha gente. Sé... cómo estoy. ...Qué pena. Justo cuando había vuelto a dar con un buen hombre. |
| `p51:A165` | SNAKE『キミのスケートをもういちど、見たかった ▽ | SNAKE: Quería verte patinar otra vez. |
| `p51:A17C` | ナターシャ『あ、ありがとう・・・<br>これ・・ドアをあけるカード6よ。それから<br>・・・ブローチ、つかい方は・・・ ▽ | NATASHA: G-gracias... esto... es la tarjeta 6, abre puertas. Y... el broche, se usa así... |
| `p51:A1B0` | SNAKE『つかい方は？ ▽ | SNAKE: ¿Cómo se usa? |
| `p51:A1BA` | ナターシャ『・・・あ、もうだめ ▽ | NATASHA: ...Ay, ya no puedo... |
| `p51:A1C6` | ナターシャ『・・・フランク・・・ | NATASHA: ...Frank... |
| `p51:A1D3` | ペトロ『SNAKE！！ ▽ | PETRO: ¡¡SNAKE!! |
| `p51:A1DD` | SNAKE『・・・・メタル・・ギア？ ▽ | SNAKE: ....¿Metal... Gear? |
| `p51:A1EC` | FOX『SNAKEっ！！オレだ。<br>・・・・GREY　FOXだ！ ▽ | FOX: ¡¡SNAKE!! Soy yo. ....¡GREY FOX! |
| `p51:A20A` | SNAKE『GREY・・　FOX・・・・ ▽ | SNAKE: GREY... FOX.... |
| `p51:A21B` | FOX『きさまにこのハシはわたらせん！！<br>ペトロビッチは連れていく。 ▼<br>どうだ、SNAKE？ムカシのよしみだ。<br>ここは見のがしてやってもいい。<br>さっさとここから立ちされっ！<br>いいか・・いますぐに・・くにへかえれ！ ▼<br>わかったな・・・ハハハァ・・・ ▽ | FOX: ¡¡No te dejaré cruzar este puente!! Me llevo a Pettrovich. ¿Qué me dices, SNAKE? Por los viejos tiempos, te puedo dejar ir. ¡Lárgate de aquí ya! Escucha... ahora mismo... ¡vuelve a casa! ¿Entendido?... ja, ja, ja... |
| `p51:A295` | SNAKE『FOX！・・・・オレはあきらめんぞっ！ ▽ | SNAKE: ¡FOX!.... ¡No me rendiré! |

### Marv y Pettrovich

| | Original | Traducción |
|---|---|---|
| `p50:8E35` | ペトロ『あっ！・・・SNAKE。<br>ておくれじゃ・・・たった今、イキ<br>をひきとったよ。 ▼<br>シンゾウがもたんかったんじゃ | PETRO: ¡Ah!... SNAKE. Demasiado tarde... acaba de expirar.<br>El corazón no le aguantó. |
| `p50:8E6D` | SNAKE『ん？クビスジにアザが？ ▼▼<br><br>ペトロ『シンパイせんでもいい、SNAKE<br>マルフが死んでもOILIXの<br>セッケイズは大ジョウブじゃ。 ▼<br>マルフは用心ぶかい男、マンイチ<br>の時のためにセッケイズをのこしと<br>る。 ▼<br>ヤツはゲーム・マニアとしても有名<br>じゃった。<br>西がわからマイツキ、コジンユニュ<br>ウしとったホドじゃ。 ▼<br>ヤツはスウジツ前、ゲームのカート<br>リッジのキバンにマイクロフィルム<br>をかくしたらしい。 ▼<br>コナミというニホンのゲームメーカ<br>ーのMSXカートリッジらしい ▼▼<br><br>SNAKE『MSXといえば世界ーのハードすう<br>をほこるパソコン・ハードじゃない<br>か ▼▼<br><br>ペトロ『そのカートリッジをそこのロッカー<br>にしまったらしいのじゃ ▼▼<br><br>SNAKE『カギは？ ▼▼<br><br>ペトロ『ない・・・ロをわらなかった。<br>いや・・・なにもきいておらん！ | SNAKE: ¿Eh? ¿Un moratón en el cuello?<br>PETRO: No te preocupes, SNAKE: aunque Marv haya muerto, los planos de OILIX están a salvo. Marv era un hombre precavido; dejó los planos por si acaso. También era famoso por maniático de los juegos; los importaba del Oeste cada mes. Hace unos días escondió un microfilm en la placa de un cartucho de juego. Un cartucho de MSX de una empresa japonesa de juegos llamada Konami, parece.<br>SNAKE: El MSX... ¿no es el ordenador con más máquinas del mundo?<br>PETRO: Guardó ese cartucho en esa taquilla, parece.<br>SNAKE: ¿Y la llave?<br>PETRO: No hay... no habló. No... ¡no he oído nada! |
| `p50:8FC4` | ペトロ『そんなところかのう。SNAKE ▼▼<br><br>ペトロ『わしは・・・きみらの世界にわしの<br>すべてをかけていたんじゃ。<br>そのためにすみなれたクニをすて ▼<br>じゃがきみらはわしをバトウし、こ<br>とごとくヒナンした。 ▼<br>わしは・・・METAL　GEAR<br>をカンセイさせたかったのじゃ！ ▼<br>わしのロボットロジーのすべてをこ<br>いつに。 ▼<br>じゃがきみらの政治かたちはSDI<br>やNEDW、ブレインボムなんぞに<br>しかキョウミをしめさなかった！ ▼<br>わしは東西のカガクジョウホウをな<br>がしながら・・・ ▼<br>METAL　GEARのカイリョウ<br>をつづけた。ザンジバーランドのエ<br>ンジョをうけながら ▼▼<br><br>SNAKE『ペトロビッチ。<br>お前がマルフ博士を？ ▼▼<br><br>ペトロ『そうじゃ。どうしてもOILIXの<br>セッケイズをわたそうとせんからじ<br>ゃ！ ▼<br>ナターシャがハシで死んだのも・・<br>わしが地下水道でFOXに連絡した<br>からじゃ ▼▼<br><br>SNAKE『あの時のトイレ！・・・ ▼▼<br><br>ペトロ『SNAKE。マルフから、いやナタ<br>ーシャからあずかったマルフのロッ<br>カーのカギをわたせ！！ | PETRO: Algo así, SNAKE.<br>PETRO: Yo... yo lo aposté todo por vuestro mundo. Por él dejé el país en el que vivía. Pero me insultasteis y condenasteis todo lo que hacía. Yo... ¡yo quería acabar METAL GEAR! Toda mi robótica en él. ¡Pero a vuestros políticos solo les interesaban la SDI, las NEDW y las bombas cerebrales! Mientras pasaba información científica al Este y al Oeste... seguí mejorando METAL GEAR, con la ayuda de Zanzíbar.<br>SNAKE: Pettrovich. ¿Mataste tú al doctor Marv?<br>PETRO: Sí. ¡Porque no quería darme los planos de OILIX! Natasha murió en el puente también... porque avisé a FOX desde las alcantarillas.<br>SNAKE: ¡Aquella vez en el retrete!...<br>PETRO: SNAKE. ¡¡Dame la llave de la taquilla de Marv que te dio Natasha!! |
| `p50:9182` | ペトロ『ス、スネーク・・・・ ▼▼<br><br>ペトロ『SNAKE・・ヤツがこのままお前<br>を見のがすはずはない。 ▼<br>あれを・・METALをつかうはず<br>じゃ。 ▼<br>ム、ムスメのエレンへの・・・<br>プレゼントじゃ。 ▼<br>あれのハカイ方法を・・おしえてや<br>る ▼▼<br><br>SNAKE『シンガタMETAL　GEARのハ<br>カイ方法だな？ ▼▼<br><br>ペトロ『わしは心の中の東西のカベをこえる<br>ことはできんかった・・・ ▼<br>じゃが、ムスメはちがう。<br>東がわにのこしてきたエレンのため<br>に・・・SNAKE ▼▼<br><br>SNAKE『METAL　GEARのハカイ方法<br>は？ ▼▼<br><br>ペトロ『ソウコウのうすいキャクブにグレネ<br>ードを・・・<br>これ以外の方法ではハカイできん。<br>足に・・・グレネードを。 ▽ | PETRO: S-Snake...<br>PETRO: SNAKE... no te dejará escapar así. Usará eso... METAL.<br>Un regalo... para mi hija Ellen...<br>Te diré... cómo destruirlo.<br>SNAKE: ¿Cómo destruir el nuevo METAL GEAR?<br>PETRO: Yo no pude saltar el muro entre el Este y el Oeste que llevaba dentro... Pero mi hija es distinta. Por Ellen, a la que dejé en el Este... SNAKE<br>SNAKE: ¿Cómo se destruye METAL GEAR?<br>PETRO: Granadas en las piernas, que tienen poco blindaje... No hay otra forma de destruirlo. En las piernas... granadas. |

### METAL GEAR y GREY FOX

| | Original | Traducción |
|---|---|---|
| `p50:979A` | FOX『SNAKE！このMETAL　GE<br>ARにハカイ方法なぞないわ。<br>おいぼれ学者のひとりよがりだ！ ▼▼<br><br>SNAKE『FOXか？・・・どこにいる？ ▼▼<br><br>FOX『すぐ会えるさ、SNAKE。<br>ショウメンのドアを通ってこい！ | FOX: ¡SNAKE! Este METAL GEAR no se puede destruir. ¡Eso son fantasías del viejo científico!<br>SNAKE: ¿FOX? ...¿Dónde estás?<br>FOX: Pronto me verás, SNAKE. ¡Pasa por la puerta de enfrente! |
| `p50:9802` | FOX『SNAKE！<br>オレも・・このMETAL　GEA<br>Rもムカシとはちがう。 ▼<br>本物のキョウフとハイボクカンを味<br>あわせてやる！ | FOX: ¡SNAKE! Yo... y este METAL GEAR no somos los de antes. ¡Te haré probar el miedo y la derrota de verdad! |
| `p50:9C93` | FOX『SNAKE！<br>カートリッジはもらっていくぞ、<br>・・・やけ死ぬがいい！ | FOX: ¡SNAKE! Me llevo el cartucho... ¡muérete quemado! |
| `p50:9844` | SNAKE『ここは？ ▼▼<br><br>FOX『ケッチャクをつけるにはサイコウの<br>リングじゃないか | SNAKE: ¿Dónde estamos?<br>FOX: El mejor ring para ajustar cuentas, ¿no? |
| `p50:9866` | FOX『SNAKE。ひさしぶりだな・・・<br>このジライゲンの中で・・・スデで<br>どうだ？ ▼▼<br><br>SNAKE『チキン・ファイトか ▼▼<br><br>FOX『FOX　HOUNDサイコウのライ<br>バル。オレはおまえとやれる時を心<br>まちにしていた！ ▼▼<br><br>SNAKE『FOX！キサマのくさりきったショ<br>ウネをたたききなおしてやるっ！ ▼▼<br><br>FOX『SNAKE！<br>FOXのショウゴウのとうとさをお<br>もいしれ！ ▽ | FOX: SNAKE. Cuánto tiempo... en este campo de minas... a mano limpia, ¿qué te parece?<br>SNAKE: Una pelea de gallos, ¿eh?<br>FOX: El mejor rival de FOX HOUND. ¡Llevaba tiempo esperando el momento de pelear contigo!<br>SNAKE: ¡FOX! ¡Te voy a quitar a golpes esa podredumbre!<br>FOX: ¡SNAKE! ¡Aprende lo que vale el título de FOX! |
| `p50:990C` | FOX『SNAKE・・・<br>どうやらFOXのショウゴウをゆずる時がきた<br>らしいな ▼▼<br><br>SNAKE『FOX・・・なぜだ？ ▼▼<br><br>FOX『オレは・・お前とちがって、フクザツな立場に<br>ある。 ▼<br>BIG　BOSSはお前にとってはたんなるジ<br>ョウカンにすぎなかつたかもしれんが。<br>オレはカレに2ド、命を救われた。<br>ブタイに入るずっと以前のことだ。 ▼<br>オレはベトナムでの2世だった・・・<br>当時、ハク人との2世はシュウ戦ゴもハクガイ<br>されキョウセイロウドウをしいられていたの<br>だ。 ▼<br>あの人はあのジゴクからオレを救ってくれた。<br>ここの子供たちのように・・・ ▼<br>2ド目はモザンビーク。<br>レモナ兵としてゴウモンされていたところをた<br>すけられた。その時、オレはみみもはなもそが<br>れ・・・ひどいジョウタイだった ▼▼<br><br>SNAKE『オンガエシのつもりか！！これが・・・ ▼▼<br><br>FOX『そうではない。オレは戦ソウがにくい。<br>ここのこどもたちのように。<br>だが・・・オレには戦ソウがヒツヨウだ。 ▼<br>オレたちのような戦ソウやはイッパン社会では<br>生きてはいけない。オレたち、戦ソウやには戦<br>場がヒツヨウなんだ。 ▼<br>BOSSはオレたちにたたかう場をあたえてく<br>れる。もって生まれたトウソウホンノウをごま<br>かすことはできない。 ▼<br>・・・オレは戦場で生まれて・・戦場で死ぬ。<br>SNAKE・・・オレたちはたたかうしか・・<br>たたかうしかない。人を・・まして、女をしあ<br>わせにすることなんぞ・・・できやしねぇ ▼▼<br><br>SNAKE『カノジョのことか・・・ ▼▼<br><br>FOX『オレにはダイイング・イン・アクションがに合<br>いだ ▼▼<br><br>SNAKE『FOX、安心しろ。オレはけっしてお前のよう<br>にはならん ▼▼<br><br>FOX『そのことば・・・あの世へみやげにもっていく<br>・・・うまくやれよ、SNAKE。<br>・・・ファンのキタイをうらぎるなよ ▼▼<br><br>SNAKE『ファンのキタイ？！・・そうか！<br>FOXだったのか・・あのムセンは ▼▼<br><br>FOX『オレのわがままのダイショウさ・・・<br>さきにいくぜ。SNAKE ▼▼<br><br>SNAKE『ひとりじゃないぜ、フランク。<br>むこうでナターシャがまっている ▼▼<br><br>FOX『・・・ナターシャ・・・ ▼▼<br><br>FOX『・・・ありがとう・・・SNAKE ▽ | FOX: SNAKE... parece que ha llegado la hora de cederte el título de FOX.<br>SNAKE: FOX... ¿por qué?<br>FOX: Yo... al contrario que tú, estoy en una posición complicada. Para ti BIG BOSS quizá solo era un jefe, pero a mí me salvó la vida dos veces. Mucho antes de entrar en la unidad. Yo era mestizo en Vietnam... entonces, a los hijos de blancos los perseguían aun después de la guerra y los obligaban a trabajos forzados. Él me sacó de aquel infierno. Como a los niños de aquí... La segunda vez fue en Mozambique. Me rescató cuando me torturaban como soldado de Lemona. Me habían cortado las orejas y la nariz... estaba hecho una pena.<br>SNAKE: ¡¿Así se lo pagas?! ¿Esto...?<br>FOX: No es eso. Yo odio la guerra. Como los niños de aquí. Pero... yo necesito la guerra. La gente de guerra como nosotros no puede vivir en la sociedad normal. Los que vivimos de la guerra necesitamos un campo de batalla. BOSS nos da un sitio para luchar. No se puede engañar al instinto de lucha con el que naces. ...Nací en el campo de batalla... y moriré en el campo de batalla. SNAKE... solo podemos luchar... solo luchar. Hacer feliz a alguien... y más a una mujer... no podemos.<br>SNAKE: Lo dices por ella...<br>FOX: A mí me va morir en acción.<br>SNAKE: FOX, tranquilo. Yo nunca seré como tú.<br>FOX: Esas palabras... me las llevo al otro mundo de recuerdo... Suerte, SNAKE. ...No defraudes a tus admiradores.<br>SNAKE: ¡¿Mis admiradores?! ...¡Claro! Eras tú, FOX... aquella radio.<br>FOX: El precio de mi egoísmo... Me adelanto, SNAKE.<br>SNAKE: No estarás solo, Frank. Allí te espera Natasha.<br>FOX: ...Natasha...<br>FOX: ...Gracias... SNAKE |

### BIG BOSS

| | Original | Traducción |
|---|---|---|
| `p50:92AE` | 『こっちだ、SNAKE！ ▽ | ¡Por aquí, SNAKE! |
| `p50:92BB` | SNAKE『BIG　BOSS・・・生きていたのか ▼▼<br><br>BOSS『SNAKE・・・<br>ようこそザンジバーランドへ・・・<br>やはりもどってきたな。わたしのもとへ ▽ | SNAKE: BIG BOSS... estabas vivo.<br>BOSS: SNAKE... bienvenido a Zanzíbar... Así que has vuelto. A mí. |
| `p50:92FF` | SNAKE『オレは3年間とりついているアクムをはらいに<br>きた。 ▼▼<br><br>BOSS『アクム？はらえやせんよ。　SNAKE、<br>・・・いちど、戦トウのカイカン、テンション<br>を味わったものはー生・・・戦場に身をおくこ<br>とになる。 ▼▼<br><br>BOSS『いちど、ヒョウシュツした戦トウホンノウは2<br>ドとねむることはないのだ。よりキョウレツな<br>テンションがほしくなる。 ▼<br>このどうしようもないカンカク・・・ヨウヘイ<br>であるお前ならよくわかるはず。 ▼<br>おまえたちのヨッキュウをユイイツ、みたして<br>くれるものはケンリョクでもカネでも、SEX<br>でもない。<br>ただひとつ・・・WAR［戦ソウ］だ！ ▼<br>わたしはお前らにその場をあたえているのだよ<br>お前らの生きがいをな。 ▼▼<br><br>SNAKE『ギゼン者きどりか？　BIG　BOSS ▼▼<br><br>BOSS『お前もあのこどもたちを見ただろう？<br>世界カッコクで生まれた戦ソウギセイ者。<br>そして次の戦ソウをになう戦士のたまごたち ▼<br>戦ソウをユウハツさせ、シエンし、ギセイ者を<br>生み・・・キュウゴ、クンレンして・・・ふた<br>たび戦場にフィードバックさせる。 ▼<br>じつに合理的なシステムだ。この世にあらそい<br>はたえることはない。　われわれのモクヒョウ<br>・・・生きがいも。 ▼▼<br><br>SNAKE『ショクにあぶれることはない・・とでもいいた<br>いのか！ ▼▼<br><br>BOSS『わたしもお前も、戦場でこそキショウカチだが<br>クニへかえればブキヨウなデクだ。 ▼<br>われわれのキゲンをとりにくるのは、せいぜい<br>安っぽいシュウカンシのジャーナリストくらい<br>だろうて。 ▼<br>お前もわたしも戦場で、のたれ死ぬまでここに<br>のこるしかないのだ。 ▼▼<br><br>SNAKE『・・・オレの戦いは、ただひとつ。キサマから<br>ジユウになるために、アクムをはらうために、<br>・・・BIG　BOSS、キサマをたおす！ ▼▼<br><br>BOSS『どちらがかってもわれわれのたたかいはおわら<br>ない。　ハイ者は戦場からカイホウされるが、<br>ショウ者は戦場にのこる。 ▼<br>そして、生きのこった者は死ぬまで戦士として<br>人生をまっとうするのだ。 ▼▼<br><br>SNAKE『レイガイもある。<br>オレは・・人生をあいしている。 ▼▼<br><br>BOSS『SNAKE、わかった。<br>わたしがキサマをクノウからカイホウしてやろ<br>う。もとジョウカンのよしみだ<br>・・・らくにしてやる。 ▼▼<br><br>SNAKE『もうあんたのせわにはならん！ ▼▼<br><br>BOSS『ほう？・・・その体で、ブキもなしに・・・<br>このわたしに？<br>ショウサンがあるというのか！？ ▼▼<br><br>SNAKE『さいごまでけっしてあきらめない。　いかなる<br>キュウチでもセイコウをイメージする。<br>・・・あんたのことばだ。 ▼▼<br><br>BOSS『わたしも時にはあやまりをおかす。 ▼<br>SNAKEっ！<br>・・・こんどこそさいごのたたかいだ。<br>イッカイきりの・・・こいっ！！ ▽ | SNAKE: He venido a quitarme la pesadilla que me persigue desde hace tres años.<br>BOSS: ¿Una pesadilla? No te la quitarás, SNAKE... quien ha probado una vez el gusto y la tensión del combate se queda en el campo de batalla de por vida.<br>BOSS: Cuando el instinto del combate sale una vez, ya no vuelve a dormirse. Quieres una tensión cada vez más fuerte. Tú, que eres mercenario, conoces bien esa sensación sin remedio. Lo único que colma vuestro deseo no es el poder, ni el dinero, ni el SEXO. Solo una cosa... ¡la GUERRA! Yo os doy el sitio para ella. Vuestra razón de vivir.<br>SNAKE: ¿Te las das de santo, BIG BOSS?<br>BOSS: Tú también has visto a esos niños, ¿no? Víctimas de la guerra nacidas en todo el mundo. Y los huevos de los guerreros que harán la próxima guerra. Provocar la guerra, apoyarla, hacer víctimas... rescatarlas, entrenarlas... y devolverlas al campo de batalla. Un sistema de lo más racional. En este mundo nunca se acabarán las peleas. Ni nuestro objetivo... nuestra razón de vivir.<br>SNAKE: ¡Vamos, que nunca nos faltará trabajo!<br>BOSS: Tú y yo valemos mucho en el campo de batalla, pero en casa somos unos muñecos torpes. Los únicos que vienen a hacernos la pelota son periodistas de revistas baratas. Tú y yo solo podemos quedarnos aquí, en el campo de batalla, hasta morir como perros.<br>SNAKE: ...Mi lucha es una sola. Para librarme de ti, para quitarme la pesadilla... ¡BIG BOSS, te venceré!<br>BOSS: Gane quien gane, nuestra lucha no se acaba. El que pierde queda libre del campo de batalla; el que gana se queda en él. Y el que sobrevive vive su vida como guerrero hasta la muerte.<br>SNAKE: Hay excepciones. Yo... amo la vida.<br>BOSS: SNAKE, de acuerdo. Te libraré de tu sufrimiento. Por los viejos tiempos, como tu antiguo jefe... te lo haré fácil.<br>SNAKE: ¡Ya no necesito tus favores!<br>BOSS: ¿Ah, no?... ¿En ese estado, sin armas... contra mí? ¿Crees que puedes ganar?<br>SNAKE: No rendirse nunca hasta el final. Imaginar el éxito en cualquier apuro... son tus palabras.<br>BOSS: Hasta yo me equivoco a veces. ¡SNAKE! ...Esta vez es la última pelea. Una sola vez... ¡¡ven!! |
| `p50:9770` | BOSS『SNAKE！！ | BOSS: ¡¡SNAKE!! |
| `p50:977A` | BOSS『まだだ・・・まだまだ・・・ | BOSS: Aún no... aún no... |
| `p50:978A` | BOSS『SNAKE・・・まだだ・・ | BOSS: SNAKE... aún no... |
| `p50:9CB9` | SNAKE『し、しまった！！<br>・・・タマがきれたっ！ | SNAKE: ¡¡M-mierda!! ...¡Sin munición! |

### La huida

| | Original | Traducción |
|---|---|---|
| `p50:9CCF` | ホーリー『SNAKE？！ | HOLLY: ¡¿SNAKE?! |
| `p50:9CD9` | ホーリー『ヘリだわっ・・たすかったのよ！ | HOLLY: Un helicóptero... ¡estamos salvados! |
| `p50:9CEB` | SNAKE『クリスマスに間に合うかな？ | SNAKE: ¿Llegaremos para Navidad? |
| `p50:9CFD` | ホーリー『まだユウショクには間に合うわ。<br>SNAKE | HOLLY: Aún llegamos a la cena, SNAKE. |
| `p50:9D17` | SNAKE『いこうか・・・<br>キリストはにげないさ | SNAKE: Vamos... Cristo no se va a escapar. |

### El final

La charla del final, con la pantalla del MSX de [Curiosidades](CURIOSIDADES.html).

| | Original | Traducción |
|---|---|---|
| `p50:9D2C` | キャンベル『ごくろうだったな、SNAKE・・・<br>どうだ？<br>もういちど・・ブタイへもどらないか？ | CAMPBELL: Buen trabajo, SNAKE... ¿qué me dices? ¿Vuelves otra vez a la unidad? |
| `p50:9D57` | SNAKE『・・・アクムははれた。オレはジユウだ | SNAKE: ...La pesadilla se ha ido. Soy libre. |
| `p50:9D6C` | キャンベル『そうか・・・ザンネンだ。<br>ところであのカートリッジだが・・・本当にマ<br>ルフ博士ののこしたものなのか？？ | CAMPBELL: Ya veo... qué pena. Por cierto, ese cartucho... ¿de verdad es el que dejó el doctor Marv? |
| `p50:9DA5` | ホーリー『カートリッジをあけてみたら？ | HOLLY: ¿Y si abres el cartucho? |
| `p50:9DB5` | SNAKE『そのヒツヨウはない。オレがもちかえったのは<br>まちがいなくマルフ博士ののこしたカートリッ<br>ジだ。<br>そのままMSXにさしこんでみろ | SNAKE: No hace falta. Lo que he traído es sin duda el cartucho que dejó el doctor Marv. Mételo tal cual en un MSX. |
| `p50:9DF8` | キャンベル『わかった・・・よしっ | CAMPBELL: De acuerdo... allá va. |
| `p50:9E04` | ホーリー『・・・なに？・・・なにもかわらないわ | HOLLY: ...¿Qué? ...No cambia nada. |
| `p50:9E19` | キャンベル『こ、これは・・・<br>そうか、SNAKEの言う通りだっ！<br>これはまぎれもなくマルフ博士ののこしたカー<br>トリッジ | CAMPBELL: E-esto es... ¡claro, es lo que decía SNAKE! Es sin duda el cartucho que dejó el doctor Marv. |
| `p50:9E54` | ホーリー『なんの事？・・わたしにはなにも見えないわ | HOLLY: ¿Qué pasa? ...Yo no veo nada. |
| `p50:9E6C` | SNAKE『ほらっ、よく見るんだ・・・マルフ博士のサイ<br>ンがしるされている・・・<br>ここ、KIO　MARVのフルネームが | SNAKE: Mira, fíjate bien... ahí está la firma del doctor Marv... aquí, el nombre completo de KIO MARV. |
| `p50:9EA6` | ホーリー『あっ、ほんと・・さかさまになっているのね | HOLLY: Ah, es verdad... está al revés. |
| `p50:9EBC` | キャンベル『これで世界は救われる・・・ | CAMPBELL: Con esto el mundo está salvado... |
| `p50:9ECE` | SNAKE『マルフ博士のさいごのパフォーマンス | SNAKE: La última actuación del doctor Marv. |
| `p50:9EE4` | ホーリー『カレは心からゲームをあいしていたのよ・・・<br>きっと | HOLLY: Él quería de verdad los juegos... seguro. |
| `p50:9F00` | キャンベル『マルフ博士はバカげた政治ゲームにまきこ<br>まれて死んだ | CAMPBELL: El doctor Marv murió metido en un estúpido juego político. |
| `p50:9F21` | ホーリー『でも・・・カレののこしたゲームはみんなを救<br>ったわ。ね、SNAKE？ | HOLLY: Pero... el juego que dejó nos ha salvado a todos. ¿Verdad, SNAKE? |
| `p50:9F46` | ホーリー『SNAKE？・・・どこいったの？<br>ねぇ、SNAKEがいないわ！ | HOLLY: ¿SNAKE? ...¿Dónde se ha metido? ¡Eh, SNAKE no está! |
| `p50:9F68` | キャンベル『・・・SNAKE？・・・にげられたか？ | CAMPBELL: ...¿SNAKE? ...¿Se nos ha escapado? |
| `p50:9F7D` | ホーリー『SNAKE！SNAKE！<br>・・・ユウショクのヤクソクをしてたのにひど<br>いわ・・・・ | HOLLY: ¡SNAKE! ¡SNAKE! ...Habíamos quedado para cenar, qué feo... |

### Los niños

Lo que dicen los niños de Zanzíbar, en la sala en que estén ([Los enemigos](LOS-ENEMIGOS.html)).

| | Original | Traducción |
|---|---|---|
| `p50:8227` | こども『スイコウの水はつめたいからながく<br>入っているとカゼひくよ | NIÑO: El agua del canal está fría, si te quedas mucho rato te vas a resfriar. |
| `p50:8247` | こども『おにいちゃん、あのブロンドのおね<br>ぇちゃんとトモダチ？ | NIÑO: Oye, ¿eres amigo de esa chica rubia? |
| `p50:8264` | こども『このスイコウはジェット水リュウで<br>むこうのビルとつながってるんだっ<br>て | NIÑO: Dicen que este canal está unido al edificio de enfrente por un chorro de agua. |
| `p50:828A` | こども『かた目のおじちゃんにミドリのフク<br>の人がきたらつたえてくれって。 ▼<br>おねえちゃんはここにはいない<br>って | NIÑO: El tuerto me dijo que si venía el del traje verde se lo dijera. Que la chica no está aquí. |
| `p50:82C0` | こども『スイコウの下にね・・・<br>ふるい地下水道があるんだってさ | NIÑO: Debajo del canal... dicen que hay un acueducto subterráneo viejo. |
| `p50:82E3` | こども『ながれにさからってはいけない<br>って、かた目のおじちゃんが。 ▼<br>ながれに身をまかせると見えなか<br>ったものが見えてくるって・・・<br>なんのことかわかる？ | NIÑO: El tuerto dice que no hay que ir contra la corriente. Que si te dejas llevar por la corriente verás lo que no veías... ¿sabes qué quiere decir? |
| `p50:8347` | こども『ここから、西北のところに動物のシ<br>イク所があるの | NIÑO: Al noroeste de aquí hay un sitio donde tienen animales. |
| `p50:8366` | こども『ここはね、夜になるとジカハツデン<br>なんだ。だからデンリョクのいるレ<br>ーザーフェンスはきえるんだ。 ▼<br>そうなったらボクらも中であそべる<br>んだ。見つかるとおこられるけど | NIÑO: Por la noche aquí hacen su propia electricidad. Así que la valla láser, que gasta corriente, se apaga. Entonces podemos jugar dentro. Si nos pillan, nos riñen. |
| `p50:83BC` | こども『かた目のおじちゃんはボクらのおや<br>がわりさ。おじちゃんは大人がきら<br>いなんだ | NIÑO: El tuerto es como un padre para nosotros. Odia a los mayores. |
| `p50:83E7` | こども『夜、ふくろうがなくから・・・<br>こわくてねむれないの | NIÑO: Por la noche ulula el búho... y me da miedo dormir. |
| `p50:8403` | こども『そこのベランダはパラシュートこう<br>か用につくられたんだよ。 ▼<br>でもハングライダーだったら・・・<br>もっととおくへいけるだろうなぁ | NIÑO: Ese balcón lo hicieron para tirarse en paracaídas. Pero con un ala delta... se llegaría mucho más lejos. |
| `p50:8444` | こども『この前までこの南にベランダがあっ<br>たんだけど通路がうめられたんだ | NIÑO: Hasta hace poco había un balcón al sur de aquí, pero taparon el pasillo. |
| `p50:846A` | こども『この南にミドリのパイナップルみ<br>たいなものがいっぱいあったんだけ<br>ど | NIÑO: Al sur de aquí había muchas cosas como piñas verdes, pero... |
| `p50:848F` | こども『ギブ・ミー・キョコレート！<br>にいちゃん、B1レーションもって<br>ない？ ▼<br>B1レーションにチョコレートがは<br>いってるんだ | NIÑO: ¡Dame chocolate! Oye, ¿tienes una ración B1? La ración B1 lleva chocolate. |
| `p50:84D2` | こども『収容所の中はネズミがおおいんだ。<br>ネズミはスになんでももちこんじゃ<br>うんだ。 ▼<br>だからネズミよけにノウリュウサン<br>をおいてあるんだってさ | NIÑO: En el campo de prisioneros hay muchas ratas. Las ratas se llevan cualquier cosa al nido. Por eso han puesto ácido sulfúrico para espantarlas. |
| `p50:851B` | こども『ここはそこなしぬまだからちかづく<br>と危ないんだって。<br>けど・・ボクたしかに見たんだ。 ▼<br>大きなトラックがこの上を通ってい<br>くのを。しんじてくれる？ | NIÑO: Esto es una ciénaga sin fondo, así que es peligroso acercarse. Pero... yo lo vi de verdad. Un camión grande pasando por encima. ¿Me crees? |
| `p50:856A` | こども『ここからよくトラックがではいりし<br>てるよ | NIÑO: Por aquí entran y salen camiones a menudo. |
| `p50:8580` | こども『タイクウミサイル、スティンガー<br>だろっ？ ▼<br>この前、戦シャにソウビするとかな<br>んかで、ザンジバービルの1Fの西<br>ガワのコウジョウにもってったよ | NIÑO: Un misil antiaéreo, un Stinger, ¿no? El otro día los llevaron a la fábrica del lado oeste del 1F del edificio de Zanzíbar, para ponérselos a un tanque o algo así. |
| `p50:85CB` | こども『わたし、ジュウをもった人、<br>大きらい！！ | NIÑO: ¡¡Odio a la gente con armas!! |
| `p50:85E4` | こども『ヒミツをおしえてあげる？ ▼<br>ナターシャねぇちゃんのね。<br>ブローチね・・サウナやレイトウコ<br>に入るとかたちがかわるのよ | NIÑO: ¿Te cuento un secreto? Del broche de Natasha. Cambia de forma si entras en la sauna o en la cámara frigorífica. |
| `p50:8620` | こども『あっ、みつかっちゃった！<br>・・・かくれんぼしてたの | NIÑO: ¡Ay, me has pillado! ...Estábamos jugando al escondite. |
| `p50:863C` | こども『ナターシャねえちゃんのロッカーは<br>いちばん右上よ。サウナから上がっ<br>てきた時によく見たわ | NIÑO: La taquilla de Natasha es la de arriba a la derecha. La veía mucho cuando subía de la sauna. |
| `p50:866F` | こども『ここにはトイレがひとつしかないの<br>。このかいの南東にあるんだけど<br>・・・夜、こわくて | NIÑO: Aquí solo hay un retrete. Está al sureste de esta planta... pero de noche me da miedo. |
| `p50:869E` | こども『このオクにマネキンの兵タイさんが<br>いっぱいあるよ。 | NIÑO: Al fondo hay muchos soldados maniquí. |
| `p50:86BA` | こども『ここの大人たちはコッカがかかると<br>キリツしてしまうんだ。<br>それがきまりなんだって | NIÑO: Los mayores de aquí se ponen firmes cuando suena el himno. Es la norma, dicen. |
| `p50:86E6` | こども『カゼをひいた時はイム室にいってク<br>スリをもらえばいいんだ | NIÑO: Cuando te resfrías vas a la enfermería y te dan medicinas. |
| `p50:8706` | こども『夜でも見えるソウガンキョウってし<br>ってる？ | NIÑO: ¿Conoces unos prismáticos que ven hasta de noche? |

### Sueltos y colas

Mensajes de los bancos 48-49 fuera de las conversaciones, y las colas que el listado lee como mensajes sueltos («・・・OVER», «なんのことかわかる？»): son el final del de antes.

| | Original | Traducción |
|---|---|---|
| `p48:9534` | マスター『タバコでカザムキきがわかるぞ。<br>うまくつかえ・・・OVER ▽ | MASTER: El tabaco te dice de dónde sopla el viento. Úsalo bien... CAMBIO |
| `p48:9833` | キャンベル『サーチライトは動きをよみとり、タ<br>イミングをはかってモノカゲからモ<br>ノカゲへすばやくイドウしろ<br>・・・OVER ▽ | CAMPBELL: Los reflectores detectan el movimiento; mide el tiempo y pasa rápido de un escondite a otro... CAMBIO |
| `p48:9D50` | キャンベル『おじちゃん、スネークさん？・・<br>わたし、キャリー。<br>パパはつりにいっちゃったの。 ▼<br>大ジョウブ・・・ムセンキ、もっ<br>ていったから。<br>シュウハスウは140・99・・<br>こんどあそびにきてね。バーイ ▽ | CAMPBELL: ¿Señor, señor Snake?... Soy Carrie. Papá se ha ido a pescar. No pasa nada... se ha llevado la radio. La frecuencia es la 140.99... ven a jugar un día. Adiós |
| `p49:BB4C` | ホーリー『SNAKE！大へんっ！！ ▽ | HOLLY: ¡SNAKE! ¡¡Un desastre!! |
| `p49:A1B5` | ・・・OVER ▽ | ...CAMBIO |
| `p49:A1BD` | ・・・OVER ▽ | ...CAMBIO |
| `p49:A1C5` | ・・・OVER ▽ | ...CAMBIO |
| `p49:ACC0` | ・・・OVER ▽ | ...CAMBIO |
| `p50:8331` | なんのことかわかる？ | ¿Sabes qué quiere decir? |
| `p50:833C` | なんのことかわかる？ | ¿Sabes qué quiere decir? |
| `p50:84CB` | いってるんだ | ...lleva |
<!-- /generado -->

## Los letreros

Las frases cortas que se pintan de una vez (`letrero`, `p00:4950`; los de
`p00:4918` llevan la fila y la columna de cada línea): lo que Snake recoge y
tira, los nombres de las armas y el equipo, los de quien habla y las
cabeceras de F2 y F3. Las descripciones de las armas y el equipo van en
[Snake](SNAKE.html).

<!-- generado:letreros -->
| | Original | Traducción |
|---|---|---|
| `p51:B1D9` | を、ニュウシュした。 | ...recogido. |
| `p51:B1E4` | しかし、つかいみちが / ないのですてよう！ | pero no sirve para nada, ¡lo tiro! |
| `p51:B1F9` | サカナのホネ | espinas de pescado |
| `p51:B200` | ハトのフン | caca de paloma |
| `p51:B206` | ヘビのヌケガラ | piel de serpiente |
| `p51:B20E` | マネキンのみぎうで | el brazo derecho de un maniquí |
| `p51:B218` | ネズミのしがい | una rata muerta |
| `p51:B220` | バグチェックリスト | una lista de fallos |
| `p51:B22A` | タバコのすいがら | una colilla |
| `p51:B233` | バナナのかわ | una piel de plátano |
| `p51:B23A` | コナミ　パラダイム | Konami Paradigm |
| `p51:B244` | ドリンクのアキビン | una botella vacía |
| `p51:B2C4` | ハンドガン | pistola |
| `p51:B2CA` | サブマシンガン | subfusil |
| `p51:B2D2` | グレネード | granada |
| `p51:B2D8` | タイクウミサイル | misil antiaéreo |
| `p51:B2E1` | リモコンミサイル | misil teledirigido |
| `p51:B2EA` | プラスチック・バクダン | explosivo plástico |
| `p51:B2F6` | ジライ | mina |
| `p51:B2FA` | カモフラージュ・マット | manta de camuflaje |
| `p51:B306` | ムリョクカガス | gas paralizante |
| `p51:B30E` | マウス | ratón |
| `p51:B312` | ライター | mechero |
| `p51:B317` | ワイヤー | cable |
| `p51:B31C` | サイレンサー | silenciador |
| `p51:B323` | タバコ | tabaco |
| `p51:B327` | ソウガンキョウ | prismáticos |
| `p51:B32F` | ナイトビュア | visor nocturno |
| `p51:B336` | ガスマスク | máscara antigás |
| `p51:B33C` | ボデイ・アーマー | chaleco antibalas (escrito ボデイ) |
| `p51:B345` | サンソボンベ | botella de oxígeno |
| `p51:B34C` | ジライタンチキ | detector de minas |
| `p51:B354` | ハングライダー | ala delta |
| `p51:B35C` | ダンボール | caja de cartón |
| `p51:B362` | バケツ | cubo |
| `p51:B366` | カゼグスリ | medicina para el resfriado |
| `p51:B36C` | カセットテープ | cinta de casete |
| `p51:B374` | タマゴ　？ | huevo ? |
| `p51:B37A` | ブローチ | broche |
| `p51:B37F` | レッド　カード | tarjeta roja |
| `p51:B387` | ブルー　カード | tarjeta azul |
| `p51:B38F` | グレーン　カード | tarjeta «verdre» (sic) |
| `p51:B398` | カード　1 | tarjeta 1 |
| `p51:B39E` | カード　2 | tarjeta 2 |
| `p51:B3A4` | カード　3 | tarjeta 3 |
| `p51:B3AA` | カード　4 | tarjeta 4 |
| `p51:B3B0` | カード　5 | tarjeta 5 |
| `p51:B3B6` | カード　6 | tarjeta 6 |
| `p51:B3BC` | カード　7 | tarjeta 7 |
| `p51:B3C2` | カード　8 | tarjeta 8 |
| `p51:B3C8` | カード　9 | tarjeta 9 |
| `p51:B3CE` | スプレー | spray |
| `p51:B3D3` | カートリッジ | cartucho |
| `p51:B3DA` | B1　レーション | ración B1 |
| `p51:B3E3` | B2　レーション | ración B2 |
| `p51:B3EC` | B3　レーション | ración B3 |
| `p51:B3F5` | ダンヤク | munición |
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
| `p51:B479` | パイロット | piloto |
| `p51:B47F` | こども | niño |
| `p51:B483` | へいし | soldado |
| `p51:B4AD` | WEAPON　SELECT / OPTION | WEAPON SELECT / OPTION |
| `p51:B4C6` | EQUIPMENT　SELECT | EQUIPMENT SELECT |
<!-- /generado -->

## La fuente

Las letras están dibujadas en la **página 3 de la VRAM**, en caracteres de
8 x 8: la letra c está en ((c & 0x1F) x 8, (c >> 5) x 8) (`p00:4AEA`). Hay dos
franjas: la de arriba con las cifras, las letras, el hiragana, el katakana y
los signos, y la de 0xF8 delante, con **128 kanji** y las piezas del marcador.
Volcadas tras el arranque y leídas carácter a carácter (`tools/textos.py fuente`):

![La franja 0: cifras, letras, kana y signos](../imagenes/fuente_f0.png)

![La franja 0xF8: los 128 kanji y las piezas del marcador](../imagenes/fuente_f8.png)

De los 128 kanji, **114** salen en algún texto y **14 nunca**: 火 面 国 制 多 特
表 武 歩 保 民 百 野 略.

## Cómo se escriben

Los mensajes están en los bancos **48-49** (`0x8000-0xBFFF`) y **50-51**
(`bancos_del_mensaje`, `p01:666A`); uno que acaba un banco sigue en el otro.
`siguiente_letra` (`p01:66C4`) los escribe letra a letra:

| Byte | Qué hace |
|---|---|
| < 4 al principio | la velocidad (`p01:654F`) |
| 0xFF | el final |
| 0xFE | salto de línea |
| 0xFD | espera una tecla y sigue (▼) |
| 0xFC | espera, abre otra ventana y, detrás, una velocidad nueva (▼▼, `p01:65E9`) |
| 0xFB | espera y acaba (▽) |
| 0x76-0x7F, 0xD4-0xDF | quién habla: su nombre (`p50:8004`) y 『 |
| 0xF8 | la letra siguiente es un kanji |

Los **397 mensajes** del listado salen así, sin ninguna letra desconocida;
todos están arriba, en el transceptor y en las escenas.
