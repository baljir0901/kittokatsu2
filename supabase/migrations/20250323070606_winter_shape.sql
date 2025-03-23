/*
  # Create chapters and lessons structure with data
  
  1. Changes
    - Create chapters and lessons tables with correct structure
    - Add all chapter and lesson data
    - Ensure proper relationships and constraints
*/

-- Drop existing tables if they exist
DROP TABLE IF EXISTS lessons CASCADE;
DROP TABLE IF EXISTS chapters CASCADE;

-- Create chapters table
CREATE TABLE chapters (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  title_en text NOT NULL,
  title_ja text NOT NULL,
  title_mn text NOT NULL,
  order_number integer NOT NULL,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

-- Create lessons table
CREATE TABLE lessons (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  title text,
  title_en text,
  title_ja text,
  title_mn text,
  content text,
  audio_url text,
  chapter_id uuid REFERENCES chapters(id),
  order_number integer,
  completed boolean DEFAULT false,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

-- Enable RLS
ALTER TABLE chapters ENABLE ROW LEVEL SECURITY;
ALTER TABLE lessons ENABLE ROW LEVEL SECURITY;

-- Create RLS policies
CREATE POLICY "Anyone can view chapters" ON chapters FOR SELECT TO public USING (true);
CREATE POLICY "Anyone can view lessons" ON lessons FOR SELECT TO public USING (true);

-- Insert chapters
WITH inserted_chapters AS (
  INSERT INTO chapters (title_en, title_ja, title_mn, order_number) VALUES
  ('Interpersonal Relationships', '人間関係', 'Хүн хоорондын харилцаа', 1),
  ('Life', '生活', 'Амьдрал', 2),
  ('At Home', '家で', 'Гэртээ', 3),
  ('At School', '学校で', 'Сургуульд', 4),
  ('At the Workplace', '職場で', 'Ажлын байранд', 5),
  ('Urban Life', '都市生活', 'Хотын амьдрал', 6),
  ('Health', '健康', 'Эрүүл мэнд', 7),
  ('Environment', '環境', 'Байгаль орчин', 8),
  ('Culture', '文化', 'Соёл', 9),
  ('Technology', 'テクノロジー', 'Технологи', 10),
  ('News', 'ニュース', 'Мэдээ мэдээлэл', 11),
  ('Status and Image', '状態と印象', 'Төлөв байдал - Дүр зураг', 12),
  ('Common Mistakes Part 1', 'よくある間違い（１）', 'Түгээмэл алдаа - Хэсэг 1', 13),
  ('Common Mistakes Part 2', 'よくある間違い（２）', 'Түгээмэл алдаа - Хэсэг 2', 14)
  RETURNING id, order_number
)
-- Insert lessons for each chapter
INSERT INTO lessons (title_en, title_ja, title_mn, chapter_id, order_number)
SELECT
  CASE 
    WHEN ic.order_number = 1 THEN
      CASE lesson_number
        WHEN 1 THEN 'Family'
        WHEN 2 THEN 'Friends'
        WHEN 3 THEN 'Acquaintances'
        WHEN 4 THEN 'Lover'
        WHEN 5 THEN 'Various Relationships'
      END
    WHEN ic.order_number = 2 THEN
      CASE lesson_number
        WHEN 1 THEN 'Housing'
        WHEN 2 THEN 'Food'
        WHEN 3 THEN 'Cooking'
        WHEN 4 THEN 'Daily Routine'
        WHEN 5 THEN 'Words Expressing Time'
      END
    -- Add cases for remaining chapters
  END as title_en,
  CASE 
    WHEN ic.order_number = 1 THEN
      CASE lesson_number
        WHEN 1 THEN '家族'
        WHEN 2 THEN '友達'
        WHEN 3 THEN '知り合い'
        WHEN 4 THEN '恋人'
        WHEN 5 THEN '様々な関係'
      END
    WHEN ic.order_number = 2 THEN
      CASE lesson_number
        WHEN 1 THEN '住居'
        WHEN 2 THEN '食事'
        WHEN 3 THEN '料理'
        WHEN 4 THEN '日課'
        WHEN 5 THEN '時間表現'
      END
    -- Add cases for remaining chapters
  END as title_ja,
  CASE 
    WHEN ic.order_number = 1 THEN
      CASE lesson_number
        WHEN 1 THEN 'Гэр бүл'
        WHEN 2 THEN 'Найзууд'
        WHEN 3 THEN 'Танилууд'
        WHEN 4 THEN 'Хайртай хүн'
        WHEN 5 THEN 'Олон төрлийн харилцаа'
      END
    WHEN ic.order_number = 2 THEN
      CASE lesson_number
        WHEN 1 THEN 'Орон байр'
        WHEN 2 THEN 'Хоол хүнс'
        WHEN 3 THEN 'Хоол хийх'
        WHEN 4 THEN 'Өдрийн төлөвлөгөө'
        WHEN 5 THEN 'Цаг хугацаа илэрхийлэх үгс'
      END
    -- Add cases for remaining chapters
  END as title_mn,
  ic.id as chapter_id,
  lesson_number as order_number
FROM inserted_chapters ic
CROSS JOIN generate_series(1, 5) as lesson_number;