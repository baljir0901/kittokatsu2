/*
  # Add chapters and lessons structure
  
  1. New Tables
    - `chapters` table for organizing lessons into chapters
    - Update `lessons` table to include chapter relationship and completion status
  
  2. Changes
    - Add foreign key relationship between lessons and chapters
    - Add completion status tracking for lessons
    - Preserve existing title column while adding new language-specific columns
    
  3. Security
    - Enable RLS on new tables
    - Update policies for public access
*/

-- Create chapters table
CREATE TABLE IF NOT EXISTS chapters (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  title_en text NOT NULL,
  title_ja text NOT NULL,
  title_mn text NOT NULL,
  order_number integer NOT NULL,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

-- Update lessons table structure
ALTER TABLE lessons ADD COLUMN IF NOT EXISTS chapter_id uuid REFERENCES chapters(id);
ALTER TABLE lessons ADD COLUMN IF NOT EXISTS title_en text;
ALTER TABLE lessons ADD COLUMN IF NOT EXISTS title_ja text;
ALTER TABLE lessons ADD COLUMN IF NOT EXISTS title_mn text;
ALTER TABLE lessons ADD COLUMN IF NOT EXISTS order_number integer;
ALTER TABLE lessons ADD COLUMN IF NOT EXISTS completed boolean DEFAULT false;

-- Enable RLS
ALTER TABLE chapters ENABLE ROW LEVEL SECURITY;

-- Create policies
CREATE POLICY "Anyone can view chapters"
ON chapters
FOR SELECT
TO public
USING (true);

CREATE POLICY "Only admins can modify chapters"
ON chapters
FOR ALL
TO authenticated
USING (
  EXISTS (
    SELECT 1 FROM auth.users
    WHERE auth.users.id = auth.uid()
    AND auth.users.email = 'admin@example.com'
  )
);

-- Insert chapters
INSERT INTO chapters (title_en, title_ja, title_mn, order_number) VALUES
('Interpersonal Relationships', '人間関係', 'Хүн хоорондын харилцаа', 1),
('Life', '生活', 'Амьдрал', 2),
('At Home', '家で', 'Гэртээ', 3),
('At School', '学校で', 'Сургуульд', 4),
('At Work', '職場で', 'Ажлын байранд', 5),
('City Life', '都市生活', 'Хотын амьдрал', 6),
('Health', '健康', 'Эрүүл мэнд', 7),
('Environment', '環境', 'Байгаль орчин', 8),
('Culture', '文化', 'Соёл', 9),
('Technology', 'テクノロジー', 'Технологи', 10),
('Sports', 'スポーツ', 'Спорт', 11),
('Travel', '旅行', 'Аялал', 12),
('Family', '家族', 'Гэр бүл', 13),
('Hobbies', '趣味', 'Хобби', 14);

-- Insert lessons for Chapter 1 as an example
DO $$
DECLARE
  chapter_id uuid;
BEGIN
  -- Get the ID for Chapter 1
  SELECT id INTO chapter_id FROM chapters WHERE order_number = 1;
  
  -- Insert first lesson
  INSERT INTO lessons (
    title,
    title_en,
    title_ja,
    title_mn,
    chapter_id,
    order_number,
    content,
    completed
  ) VALUES (
    'Family',  -- Preserve the title column
    'Family',
    '家族',
    'Гэр бүл',
    chapter_id,
    1,
    'Introduction to family terms in Japanese...',
    true
  );

  -- Insert second lesson
  INSERT INTO lessons (
    title,
    title_en,
    title_ja,
    title_mn,
    chapter_id,
    order_number,
    content,
    completed
  ) VALUES (
    'Friends',  -- Preserve the title column
    'Friends',
    '友人',
    'Найзууд',
    chapter_id,
    2,
    'Learning about friendship and relationships...',
    true
  );
END $$;