/*
  # Update lesson content for Family lesson
  
  1. Changes
    - Update content for the first lesson about family
    - Preserve existing lesson structure while updating content
*/

UPDATE lessons 
SET content = '<!DOCTYPE html>
<html lang="mn">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Гэр бүл / 家族 / Family-Lesson1</title>
    <style>
        body {
            font-family: ''Segoe UI'', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
            padding-top: 150px;
        }
        h1 {
            text-align: center;
            color: #004080;
            margin-bottom: 20px;
        }
        h2 {
            color: #333;
            margin-top: 30px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: white;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        th, td {
            border: 1px solid #ccc;
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #e0e0e0;
            font-weight: bold;
        }
        footer {
            text-align: center;
            margin-top: 20px;
            padding: 10px;
            font-size: 0.9rem;
            color: #666;
            background: #eee;
            border-top: 1px solid #ccc;
        }
        audio {
            margin-bottom: 10px;
            width: 100%;
        }
        .turn-back, .next-lesson {
            position: fixed;
            top: 20px;
            padding: 12px 24px;
            background-color: #0056b3;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            transition: background-color 0.3s, transform 0.2s;
            z-index: 1000;
        }
        .turn-back {
            left: 20px;
        }
        .next-lesson {
            left: 150px;
        }
        .turn-back:hover, .next-lesson:hover {
            background-color: #004494;
            transform: translateY(-2px);
        }
        .fixed-h1 {
            position: fixed;    
            top: 10px;
            left: 0;
            right: 0;
            background-color: #f9f9f9;
            padding: 00px;
            z-index: 999;
        }
        .fixed-audio {
            position: fixed;
            top: 80px;
            left: 0;
            right: 0;
            background-color: #f9f9f9;
            padding: 00px;
            z-index: 999;
        }
    </style>
</head>
<body>

<div class="fixed-h1">
    <h1>Гэр бүл / 家族 / Family</h1>
</div>

<a href="index.html" class="turn-back">Буцах</a>
<a href="lesson1-2.html" class="next-lesson">Дараагийн хичээл</a>

<div class="fixed-audio">
    <audio controls>
        <source src="https://www.dropbox.com/scl/fi/vyfoxefnujb3xobsk8ti3/001.mp3?rlkey=xyabwe6blvq8f69se7zn1hdbz&st=xe00lsvs&raw=1" type="audio/mpeg">
        Your browser does not support the audio element.
    </audio>
</div>

<p>Энэ хичээлд гэр бүлтэй холбоотой үгсийг судлах болно.</p>

<h2>Түлхүүр үгс:</h2>
<table>
    <thead>
        <tr>
            <th>#</th>
            <th>Шинэ үгс</th>
            <th>Жишээ өгүүлбэр</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>1</td>
            <td>身内 (みうち) - Гэр бүл, хамаатан</td>
            <td>身内に医者がいると、何かと安心だ。<br>(Хэрвээ хамаатанууд дунд эмч байвал, ямар ч асуудалд сэтгэл тайван байдаг.)</td>
        </tr>
        <tr>
            <td>2</td>
            <td>肉親 (にくしん) - Хамаатан садан хүмүүс</td>
            <td>父が他界し、肉親は兄だけになった。<br>(Эцэг маань нас барж, хамаатан садан нь зөвхөн ах минь үлдсэн.)</td>
        </tr>
        <tr>
            <td>3</td>
            <td>配偶者 (はいぐうしゃ) - Хос, эхнэр/нөхөр</td>
            <td>配偶者の有無をこちらに書いてください。<br>(Энд гэр бүлтэй эсэхээ бичнэ үү.)</td>
        </tr>
        <tr>
            <td>4</td>
            <td>家系 (かけい) - Удам угсаа</td>
            <td>自分のルーツを知るために、家系図を作った。<br>(Би өөрийн удам угсаагаа мэдэхийн тулд ургын бичигээ хийсэн.)</td>
        </tr>
        <tr>
            <td>5</td>
            <td>お袋 (おふくろ) - Ээж</td>
            <td>A「今の電話、誰から？」 B「おふくろ。」<br>(А: Энэ утасны дуудлага хэнээс ирсэн бэ? Б: Ээжээс.)</td>
        </tr>
        <tr>
            <td>6</td>
            <td>親父 (おやじ) - Аав</td>
            <td>息子「おやじ、まだ帰ってないの？」 母「今日も飲んでるんじゃない？」<br>(Хүү: Аав, одоо ч ирээгүй юу? Ээж: Өнөөдөр ч бас ууж байгаа байх өө.)</td>
        </tr>
        <tr>
            <td>7</td>
            <td>寄越す (よこす) - Илгээх, явуулах</td>
            <td>週に一度は母親が電話をよこす。<br>(Ээж маань долоо хоногт нэг удаа утасддаг.)</td>
        </tr>
        <tr>
            <td>8</td>
            <td>女房 (にょうぼう) - Эхнэр</td>
            <td>A「今日、一杯どう？」 B「女房がうるさいから、帰るよ。」<br>(А: Өнөөдөр нэг уухуу? Б: Эхнэр маань жаахан ядаргаатай хүн, би харинаа.)</td>
        </tr>
        <tr>
            <td>9</td>
            <td>亭主 (ていしゅ) - Нөхөр</td>
            <td>A「ご主人、単身赴任なの？」 B「亭主は元気で留守がいいって言うじゃない。」<br>(А: Нөхөр чинь хол байдаг уу уу? Б: Нөхөр нь эрүүл саруул холын аянд явж байвал сайн гэж хэлдэг биш билүү.)</td>
        </tr>
        <tr>
            <td>10</td>
            <td>温もり (ぬくもり) - Халуун дулаан</td>
            <td>結婚したら、温もりのある家庭を作りたい。<br>(Хэрвээ би гэрлэвэл, халуун дулаан уур амьсгалтай гэр бүлтэй болохыг хүсч байна.)</td>
        </tr>
        <tr>
            <td>11</td>
            <td>授かる (さずかる) - Олж авах</td>
            <td>姉夫婦が女の子を授かった。<br>(Эгчийн гэр бүл охинтой болсон.)</td>
        </tr>
        <tr>
            <td>12</td>
            <td>名付ける (なづける) - Нэр өгөх</td>
            <td>日本では昔、長男を太郎と名付けることが多かった。<br>(Японд эрт үед, том хүүг Таро гэж нэрлэх нь түгээмэл байсан.)</td>
        </tr>
        <tr>
            <td>13</td>
            <td>すやすや - Сайхан унтах</td>
            <td>赤ちゃんがすやすや眠っている。<br>(Нярай хүүхэд сайхан унтаж байна.)</td>
        </tr>
        <tr>
            <td>14</td>
            <td>しぐさ - Байр байдал, хөдөлгөөн</td>
            <td>娘のしぐさは、私によく似ているらしい。<br>(Миний охины байр байдал надтай их адилхан юм шиг санагддаг.)</td>
        </tr>
        <tr>
            <td>15</td>
            <td>愛しい (いとしい) - Хайртай, дуртай</td>
            <td>子どもが寝ている姿が、愛しくてたまらない。<br>(Хүүхэд унтаж байгаа байдал нь хайр татаад дийлдэхгүй нэрлэх.)</td>
        </tr>
        <tr>
            <td>16</td>
            <td>懐く (なつく) - Дотно болох</td>
            <td>末っ子は父親になかなか懐かない。<br>(Хамгийн бага хүүхэд маань нэг л ааваасаа бишүүрхээд байна)</td>
        </tr>
        <tr>
            <td>17</td>
            <td>ねだる - Гуйх, шаналгах</td>
            <td>妹は父に、よくおもちゃをねだっている。<br>(Эмэгтэй дүү маань ааваас ихэвчлэн тоглоом гуйж шаналгадаг.)</td>
        </tr>
        <tr>
            <td>18</td>
            <td>すねる - Гомддог (эмордог)</td>
            <td>妹は自分の我がままが通らないと、すぐすねる。<br>(Эмэгтэй дүү маань нь биелэхгүй бол хурдан Гомддог.)</td>
        </tr>
        <tr>
            <td>19</td>
            <td>指図 (さしず) - Заавар, тушаал</td>
            <td>幼い頃から私は兄に指図されるのが嫌だった。<br>(Би багаасаа л ахаараа захиргаадуулах дургүйцдэг байсан.)</td>
        </tr>
        <tr>
            <td>20</td>
            <td>横取り (よこどり) - Хулгайлах, булаах</td>
            <td>子どもの頃、兄にいつもおもちゃを横取られた。<br>(Хүүхэд байхдаа ахад тоглоомоо үргэлж булаалгаддаг байсан.)</td>
        </tr>
        <tr>
            <td>21</td>
            <td>反発 (はんぱつ) - Эсэргүүцэх</td>
            <td>いつも兄に反発して、けんかになってしまう。<br>(Үргэлж л ахыгаа эсэргүүцэж, маргалдчихдаг.)</td>
        </tr>
        <tr>
            <td>22</td>
            <td>家出 (いえで) - Гэрээс зугтаах</td>
            <td>両親がうるさくて、何回か家出したことがある。<br>(Эцэг, эх маань ядаргаатай болохоор, би хэд хэдэн удаа гэрээс зугтаж байсан.)</td>
        </tr>
        <tr>
            <td>23</td>
            <td>ぎくしゃく - Тасрах</td>
            <td>ささいなことが理由で、兄弟の関係がぎくしゃくした。<br>(Багахан зүйлээс болж, ах дүүгийн харилцаа тасрасан.)</td>
        </tr>
        <tr>
            <td>24</td>
            <td>言い返す (いいかえす) - хариу хэлж өөрийгөө өмөөрөх</td>
            <td>父親の忠告に言い返して叱られた。<br>(Аавын сануулганны эсрэг өөрийгөө өмөөрсөн чинь загниулсан.)</td>
        </tr>
        <tr>
            <td>25</td>
            <td>言い張る (いいはる) - Зөрүүдлэх</td>
            <td>姉はいつも自分が正しいと言い張る。<br>(Эгч маань үргэлж өөрийнхөө зөв гэж зөрүүдлэдэг.)</td>
        </tr>
        <tr>
            <td>26</td>
            <td>門限 (もんげん) - Хаалга барих, гэрээс гарахгүй байх хугацаа</td>
            <td>大学生になっても門限は10時だ。<br>(Би их сургуульд орсон ч 10 аас хойш гардаггүй.)</td>
        </tr>
        <tr>
            <td>27</td>
            <td>さんざん - Хатуу, хэцүү</td>
            <td>門限を破って、父にさんざん説教された。<br>(Гэрээс гарч болохгүй хугацааг зөрчсөн тул аавд хатуу загниулсан.)</td>
        </tr>
        <tr>
            <td>28</td>
            <td>省みる (かえりみる) - Эргэцүүлэж бодох</td>
            <td>父に叱られて、自分の行動を省みた。<br>(Аавд загниулаад би өөрийнхөө үйлдлийг эргэцүүлэж бодсон.)</td>
        </tr>
        <tr>
            <td>29</td>
            <td>さも - Тийм ч</td>
            <td>姉は知らないことも、さも知っているかのように話す。<br>(эгч маань мэдэхгүй зүйлсээ ч мэддэг юм шиг ярьдаг.)</td>
        </tr>
        <tr>
            <td>30</td>
            <td>やまやまな - Оргилсон их</td>
            <td>仕事を続けたいのはやまやまだが、育児中は難しい。<br>(Би ажиллахыг үнэхээр их хүсэж байгаа ч хүүхэд өсгөж байгаа болохоор хэцүү юм аа.)</td>
        </tr>
        <tr>
            <td>31</td>
            <td>再婚 (さいこん) - Дахин гэрлэлт</td>
            <td>いい縁があって再婚することになった。<br>(Сайхан хувь заяа тохиож, би дахин гэрлэхээр болсон.)</td>
        </tr>
        <tr>
            <td>32</td>
            <td>健在 (けんざい) - Эрүүл, хүчтэй энх тунх</td>
            <td>父と母の、どちらの両親も健在だ。<br>(Эцэг, эх хоёрын аль аль нь эрүүл эрч хүчтэй энх тунх.)</td>
        </tr>
        <tr>
            <td>33</td>
            <td>いたわる - Хайрлах, анхаарал тавих</td>
            <td>息子は祖父母をいたわる、とてもやさしい子だ。<br>(Хүү маань өвөө, эмээгээ хайрлаж халамжладаг маш сайхан сэтгэлтэй хүүхэд.)</td>
        </tr>
        <tr>
            <td>34</td>
            <td>他界 (たかい) - Нас барсан</td>
            <td>先月、祖父が100歳で他界した。<br>(Өнгөрсөн сард өвөө 100 насандаа нас барсан.)</td>
        </tr>
        <tr>
            <td>35</td>
            <td>受け継ぐ (うけつぐ) - Өвлөх</td>
            <td>数年後には父の事業を受け継ぐつもりだ。<br>(Би хэдэн жилийн дараа аавын бизнесийг өвлөх бодолтой байна.)</td>
        </tr>
        <tr>
            <td>36</td>
            <td>遺産 (いさん) - Удамшил, өв хөрөнгө</td>
            <td>父の遺産について家族会議を開いた。<br>(Аавын өв хөрөнгийн талаар гэр бүлийн хурал хийсэн.)</td>
        </tr>
    </tbody>
</table>

<footer>
    &copy; 2025 Kitto Katsu. Бүх эрх хуулиар хамгаалагдсан.
</footer>

</body>
</html>',
    audio_url = 'https://www.dropbox.com/scl/fi/vyfoxefnujb3xobsk8ti3/001.mp3?rlkey=xyabwe6blvq8f69se7zn1hdbz&st=xe00lsvs&raw=1'
WHERE chapter_id = (SELECT id FROM chapters WHERE order_number = 1)
AND order_number = 1;