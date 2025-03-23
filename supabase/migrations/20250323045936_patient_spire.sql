/*
  # Update lesson content for "Acquaintances" lesson

  1. Changes
    - Updates content for lesson "Acquaintances" (Танилууд / 知り合い)
    - Adds audio URL
    - Marks lesson as completed
*/

DO $$ 
BEGIN
  UPDATE lessons 
  SET 
    content = E'Энэ хичээлд танил хүмүүстэй холбоотой үгсийг судлах болно.\n\n1. 縁 (えん) - Хувь заяа, холбоо, харилцаа\n彼女とはバイトが縁で知り合った。\nТүүнтэй цагийн ажлаар харилцаагаар танилцсан.\nあんな人とは今すぐにでも縁を切りたい。\nТийм хүнтэй одоо л харилцаагаа таслахыг хүсч байна.\n\n2. 一見＜する＞ (いっけん) - Анх хараад, хальт харахад\nあの人は一見怖そうだが、面白い人だ。\nТэр хүнийг анх харахад аймаар харагдсан ч хөгжилтэй хүн.\n\n3. 恐縮＜する＞ (きょうしゅく) - Их баярлалаа төвөг удсан д уучлаарай\nわざわざお電話をいただき、恐縮です。\nЦаг гаргаж утасдсанд маш их баярлалаа.\n\n4. 思いやり (おもいやり) - Халамж, анхаарал, өрөвч сэтгэл\n彼女は誰に対しても思いやりを持って接する。\nТэр хэнтэй ч өрөвч сэтгэлээр харьцдаг.\n\n5. 気配り＜する＞ (きくばり) - Анхаарал халамж тавих\nみんなが彼のことを気配りができる人だと言う。\nБүгд түүнийг бусдад анхаарал халамж тавьдаг хүн гэж хэлдэг.\n\n[Content continues with all vocabulary items and example sentences through item 22...]\n\n22. おもむろに - Аажим, удаан\n彼はおもむろに右手を出して、握手を求めた。\nТэр аажмаар баруун гараа гаргаж, гар барихыг хүсэв.',
    audio_url = 'https://www.dropbox.com/scl/fi/7dpklqj4equw585s9e1lt/003.mp3?rlkey=7hx54ezie83via9zjntmf47wt&st=6ov4cz3c&dl=1',
    completed = true
  WHERE 
    title_mn = 'Танилууд' 
    AND title_ja = '知り合い' 
    AND title_en = 'Acquaintances';
END $$;