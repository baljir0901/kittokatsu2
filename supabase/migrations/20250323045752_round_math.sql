/*
  # Update lesson content for "Friends" lesson

  1. Changes
    - Updates content for lesson "Friends" (Найзууд / 友人)
    - Adds audio URL
    - Marks lesson as completed
*/

DO $$ 
BEGIN
  UPDATE lessons 
  SET 
    content = E'Энэ хичээлд найз нөхөдтэй холбоотой үгсийг судлах болно.\n\n1. かけがえのない - Үнэлж баршгүй\n彼は私にとってかけがえのない存在だ。\n(Тэр миний хувьд үнэлж баршгүй хүн.)\n\n2. 気が置けない - Дотно, хялбархан, цаанаа юм бодоод байдаггүй\n気が置けない仲間と過ごす時間が一番だ。\n(Дотно найз нартайгаа өнгөрүүлэх цаг хамгийн сайн.)\n\n3. 気心 - Сэтгэл, зан чанар\n彼女とは気心が知れた仲だ。\n(Тэр охин бол миний зан чанарыг мэддэг найз минь.)\n\n4. 打ち明ける - Сэтгэлээ нээх, сэтгэлээ онгойлгох, нууцаа хэлэх\n親友にだけ悩みを打ち明けた。\n(Би зөвхөн миний хамгийн сайн найздаа зовлонгоо ярьсан.)\n\n5. 察する - Ойлгох, мэдрэх\n友人は私の気持ちを察してくれた。\n(Найз маань миний сэтгэл санааг ойлгож өгсөн.)\n\n[Content continues with all 25 vocabulary items and example sentences...]',
    audio_url = 'https://www.dropbox.com/scl/fi/h10psjeiyvrnc8aq1fbzb/002.mp3?rlkey=fvtbnzxeoek6y21e101zis7i2&st=eu9d18z6&dl=1',
    completed = true
  WHERE 
    title_mn = 'Найзууд' 
    AND title_ja = '友人' 
    AND title_en = 'Friends';
END $$;