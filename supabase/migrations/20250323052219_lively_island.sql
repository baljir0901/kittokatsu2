/*
  # Insert vocabulary items for Family lesson
  
  1. Data Population
    - Insert 36 vocabulary items for the Family lesson
    - Each item includes:
      - Kanji
      - Hiragana reading
      - Mongolian translation
      - Example sentences in Japanese and Mongolian
*/

DO $$ 
DECLARE
  lesson_id uuid;
BEGIN
  -- Get the ID of the Family lesson
  SELECT id INTO lesson_id 
  FROM lessons 
  WHERE title_mn = 'Гэр бүл' 
  AND chapter_id = (SELECT id FROM chapters WHERE order_number = 1)
  LIMIT 1;

  -- Insert vocabulary items
  INSERT INTO vocabulary_items (lesson_id, kanji, hiragana, translation, example_ja, example_mn, order_number) VALUES
    (lesson_id, '身内', 'みうち', 'Гэр бүл, хамаатан', '身内に医者がいると、何かと安心だ。', 'Хэрвээ хамаатанууд дунд эмч байвал, ямар ч асуудалд сэтгэл тайван байдаг.', 1),
    (lesson_id, '肉親', 'にくしん', 'Хамаатан садан хүмүүс', '父が他界し、肉親は兄だけになった。', 'Эцэг маань нас барж, хамаатан садан нь зөвхөн ах минь үлдсэн.', 2),
    (lesson_id, '配偶者', 'はいぐうしゃ', 'Хос, эхнэр/нөхөр', '配偶者の有無をこちらに書いてください。', 'Энд гэр бүлтэй эсэхээ бичнэ үү.', 3),
    (lesson_id, '家系', 'かけい', 'Удам угсаа', '自分のルーツを知るために、家系図を作った。', 'Би өөрийн удам угсаагаа мэдэхийн тулд ургын бичигээ хийсэн.', 4),
    (lesson_id, 'お袋', 'おふくろ', 'Ээж', '今の電話、誰から？おふくろ。', 'А: Энэ утасны дуудлага хэнээс ирсэн бэ? Б: Ээжээс.', 5),
    (lesson_id, '親父', 'おやじ', 'Аав', 'おやじ、まだ帰ってないの？今日も飲んでるんじゃない？', 'Хүү: Аав, одоо ч ирээгүй юу? Ээж: Өнөөдөр ч бас ууж байгаа байх өө.', 6),
    (lesson_id, '寄越す', 'よこす', 'Илгээх, явуулах', '週に一度は母親が電話をよこす。', 'Ээж маань долоо хоногт нэг удаа утасддаг.', 7),
    (lesson_id, '女房', 'にょうぼう', 'Эхнэр', '今日、一杯どう？女房がうるさいから、帰るよ。', 'А: Өнөөдөр нэг уухуу? Б: Эхнэр маань жаахан ядаргаатай хүн, би харинаа.', 8),
    (lesson_id, '亭主', 'ていしゅ', 'Нөхөр', 'ご主人、単身赴任なの？亭主は元気で留守がいいって言うじゃない。', 'А: Нөхөр чинь хол байдаг уу уу? Б: Нөхөр нь эрүүл саруул холын аянд явж байвал сайн гэж хэлдэг биш билүү.', 9),
    (lesson_id, '温もり', 'ぬくもり', 'Халуун дулаан', '結婚したら、温もりのある家庭を作りたい。', 'Хэрвээ би гэрлэвэл, халуун дулаан уур амьсгалтай гэр бүлтэй болохыг хүсч байна.', 10),
    (lesson_id, '授かる', 'さずかる', 'Олж авах', '姉夫婦が女の子を授かった。', 'Эгчийн гэр бүл охинтой болсон.', 11),
    (lesson_id, '名付ける', 'なづける', 'Нэр өгөх', '日本では昔、長男を太郎と名付けることが多かった。', 'Японд эрт үед, том хүүг Таро гэж нэрлэх нь түгээмэл байсан.', 12),
    (lesson_id, 'すやすや', 'すやすや', 'Сайхан унтах', '赤ちゃんがすやすや眠っている。', 'Нярай хүүхэд сайхан унтаж байна.', 13),
    (lesson_id, 'しぐさ', 'しぐさ', 'Байр байдал, хөдөлгөөн', '娘のしぐさは、私によく似ているらしい。', 'Миний охины байр байдал надтай их адилхан юм шиг санагддаг.', 14),
    (lesson_id, '愛しい', 'いとしい', 'Хайртай, дуртай', '子どもが寝ている姿が、愛しくてたまらない。', 'Хүүхэд унтаж байгаа байдал нь хайр татаад дийлдэхгүй нэрлэх.', 15),
    (lesson_id, '懐く', 'なつく', 'Дотно болох', '末っ子は父親になかなか懐かない。', 'Хамгийн бага хүүхэд маань нэг л ааваасаа бишүүрхээд байна', 16),
    (lesson_id, 'ねだる', 'ねだる', 'Гуйх, шаналгах', '妹は父に、よくおもちゃをねだっている。', 'Эмэгтэй дүү маань ааваас ихэвчлэн тоглоом гуйж шаналгадаг.', 17),
    (lesson_id, 'すねる', 'すねる', 'Гомддог (эмордог)', '妹は自分の我がままが通らないと、すぐすねる。', 'Эмэгтэй дүү маань нь биелэхгүй бол хурдан Гомддог.', 18),
    (lesson_id, '指図', 'さしず', 'Заавар, тушаал', '幼い頃から私は兄に指図されるのが嫌だった。', 'Би багаасаа л ахаараа захиргаадуулах дургүйцдэг байсан.', 19),
    (lesson_id, '横取り', 'よこどり', 'Хулгайлах, булаах', '子どもの頃、兄にいつもおもちゃを横取られた。', 'Хүүхэд байхдаа ахад тоглоомоо үргэлж булаалгаддаг байсан.', 20),
    (lesson_id, '反発', 'はんぱつ', 'Эсэргүүцэх', 'いつも兄に反発して、けんかになってしまう。', 'Үргэлж л ахыгаа эсэргүүцэж, маргалдчихдаг.', 21),
    (lesson_id, '家出', 'いえで', 'Гэрээс зугтаах', '両親がうるさくて、何回か家出したことがある。', 'Эцэг, эх маань ядаргаатай болохоор, би хэд хэдэн удаа гэрээс зугтаж байсан.', 22),
    (lesson_id, 'ぎくしゃく', 'ぎくしゃく', 'Тасрах', 'ささいなことが理由で、兄弟の関係がぎくしゃくした。', 'Багахан зүйлээс болж, ах дүүгийн харилцаа тасрасан.', 23),
    (lesson_id, '言い返す', 'いいかえす', 'хариу хэлж өөрийгөө өмөөрөх', '父親の忠告に言い返して叱られた。', 'Аавын сануулганны эсрэг өөрийгөө өмөөрсөн чинь загниулсан.', 24),
    (lesson_id, '言い張る', 'いいはる', 'Зөрүүдлэх', '姉はいつも自分が正しいと言い張る。', 'Эгч маань үргэлж өөрийнхөө зөв гэж зөрүүдлэдэг.', 25),
    (lesson_id, '門限', 'もんげん', 'Хаалга барих, гэрээс гарахгүй байх хугацаа', '大学生になっても門限は10時だ。', 'Би их сургуульд орсон ч 10 аас хойш гардаггүй.', 26),
    (lesson_id, 'さんざん', 'さんざん', 'Хатуу, хэцүү', '門限を破って、父にさんざん説教された。', 'Гэрээс гарч болохгүй хугацааг зөрчсөн тул аавд хатуу загниулсан.', 27),
    (lesson_id, '省みる', 'かえりみる', 'Эргэцүүлэж бодох', '父に叱られて、自分の行動を省みた。', 'Аавд загниулаад би өөрийнхөө үйлдлийг эргэцүүлэж бодсон.', 28),
    (lesson_id, 'さも', 'さも', 'Тийм ч', '姉は知らないことも、さも知っているかのように話す。', 'эгч маань мэдэхгүй зүйлсээ ч мэддэг юм шиг ярьдаг.', 29),
    (lesson_id, 'やまやまな', 'やまやまな', 'Оргилсон их', '仕事を続けたいのはやまやまだが、育児中は難しい。', 'Би ажиллахыг үнэхээр их хүсэж байгаа ч хүүхэд өсгөж байгаа болохоор хэцүү юм аа.', 30),
    (lesson_id, '再婚', 'さいこん', 'Дахин гэрлэлт', 'いい縁があって再婚することになった。', 'Сайхан хувь заяа тохиож, би дахин гэрлэхээр болсон.', 31),
    (lesson_id, '健在', 'けんざい', 'Эрүүл, хүчтэй энх тунх', '父と母の、どちらの両親も健在だ。', 'Эцэг, эх хоёрын аль аль нь эрүүл эрч хүчтэй энх тунх.', 32),
    (lesson_id, 'いたわる', 'いたわる', 'Хайрлах, анхаарал тавих', '息子は祖父母をいたわる、とてもやさしい子だ。', 'Хүү маань өвөө, эмээгээ хайрлаж халамжладаг маш сайхан сэтгэлтэй хүүхэд.', 33),
    (lesson_id, '他界', 'たかい', 'Нас барсан', '先月、祖父が100歳で他界した。', 'Өнгөрсөн сард өвөө 100 насандаа нас барсан.', 34),
    (lesson_id, '受け継ぐ', 'うけつぐ', 'Өвлөх', '数年後には父の事業を受け継ぐつもりだ。', 'Би хэдэн жилийн дараа аавын бизнесийг өвлөх бодолтой байна.', 35),
    (lesson_id, '遺産', 'いさん', 'Удамшил, өв хөрөнгө', '父の遺産について家族会議を開いた。', 'Аавын өв хөрөнгийн талаар гэр бүлийн хурал хийсэн.', 36);
END $$;