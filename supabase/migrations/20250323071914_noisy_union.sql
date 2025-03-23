/*
  # Add simple IDs and management views
  
  1. Changes
    - Add simple sequential IDs for chapters, lessons, and vocabulary items
    - Create views for easier content management
    - Fix GROUP BY clauses to include all necessary columns
*/

-- Add sequence for generating simple IDs
CREATE SEQUENCE IF NOT EXISTS chapter_number_seq;
CREATE SEQUENCE IF NOT EXISTS lesson_number_seq;
CREATE SEQUENCE IF NOT EXISTS vocabulary_number_seq;

-- Add simple_id column to chapters
ALTER TABLE chapters 
ADD COLUMN IF NOT EXISTS simple_id text GENERATED ALWAYS AS (
  'C' || LPAD(order_number::text, 2, '0')
) STORED;

-- Add simple_id column to lessons
ALTER TABLE lessons 
ADD COLUMN IF NOT EXISTS simple_id text GENERATED ALWAYS AS (
  'L' || LPAD(order_number::text, 3, '0')
) STORED;

-- Add simple_id column to vocabulary_items
ALTER TABLE vocabulary_items 
ADD COLUMN IF NOT EXISTS simple_id text GENERATED ALWAYS AS (
  'V' || LPAD(order_number::text, 3, '0')
) STORED;

-- Create indexes for better performance
CREATE INDEX IF NOT EXISTS idx_chapters_simple_id ON chapters(simple_id);
CREATE INDEX IF NOT EXISTS idx_lessons_simple_id ON lessons(simple_id);
CREATE INDEX IF NOT EXISTS idx_vocabulary_simple_id ON vocabulary_items(simple_id);

-- Create view for easy chapter management
CREATE OR REPLACE VIEW chapter_overview AS
SELECT 
  c.simple_id as chapter_id,
  c.title_mn as chapter_title,
  COUNT(l.id) as lesson_count,
  COUNT(v.id) as vocabulary_count,
  c.order_number
FROM chapters c
LEFT JOIN lessons l ON c.id = l.chapter_id
LEFT JOIN vocabulary_items v ON l.id = v.lesson_id
GROUP BY c.id, c.simple_id, c.title_mn, c.order_number
ORDER BY c.order_number;

-- Create view for easy lesson management
CREATE OR REPLACE VIEW lesson_overview AS
SELECT 
  l.simple_id as lesson_id,
  c.simple_id as chapter_id,
  l.title_mn as lesson_title,
  COUNT(v.id) as vocabulary_count,
  l.completed,
  c.order_number as chapter_order,
  l.order_number as lesson_order
FROM lessons l
LEFT JOIN chapters c ON l.chapter_id = c.id
LEFT JOIN vocabulary_items v ON l.id = v.lesson_id
GROUP BY 
  l.id, 
  l.simple_id, 
  c.simple_id, 
  l.title_mn, 
  l.completed, 
  c.order_number,
  l.order_number
ORDER BY c.order_number, l.order_number;

-- Create view for student progress
CREATE OR REPLACE VIEW student_progress AS
SELECT 
  u.email as student_email,
  COUNT(DISTINCT c.id) as chapters_started,
  COUNT(DISTINCT CASE WHEN l.completed THEN l.id END) as lessons_completed,
  COUNT(DISTINCT v.id) as vocabulary_learned
FROM auth.users u
JOIN user_roles ur ON u.id = ur.user_id
JOIN roles r ON ur.role_id = r.id
LEFT JOIN lessons l ON true
LEFT JOIN chapters c ON l.chapter_id = c.id
LEFT JOIN vocabulary_items v ON l.id = v.lesson_id
WHERE r.name = 'student'
GROUP BY u.id, u.email
ORDER BY u.email;

-- Create function to add new chapter
CREATE OR REPLACE FUNCTION add_chapter(
  title_en text,
  title_ja text,
  title_mn text
) RETURNS text AS $$
DECLARE
  next_order int;
  new_chapter_id text;
BEGIN
  -- Get next order number
  SELECT COALESCE(MAX(order_number), 0) + 1 
  INTO next_order 
  FROM chapters;
  
  -- Insert new chapter
  INSERT INTO chapters (title_en, title_ja, title_mn, order_number)
  VALUES (title_en, title_ja, title_mn, next_order);
  
  -- Return the simple_id
  SELECT 'C' || LPAD(next_order::text, 2, '0') INTO new_chapter_id;
  RETURN new_chapter_id;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Create function to add new lesson
CREATE OR REPLACE FUNCTION add_lesson(
  chapter_simple_id text,
  title_en text,
  title_ja text,
  title_mn text
) RETURNS text AS $$
DECLARE
  chapter_id uuid;
  next_order int;
  new_lesson_id text;
BEGIN
  -- Get chapter ID
  SELECT id INTO chapter_id
  FROM chapters
  WHERE simple_id = chapter_simple_id;
  
  IF NOT FOUND THEN
    RAISE EXCEPTION 'Chapter % not found', chapter_simple_id;
  END IF;
  
  -- Get next order number for this chapter
  SELECT COALESCE(MAX(order_number), 0) + 1 
  INTO next_order 
  FROM lessons 
  WHERE chapter_id = chapter_id;
  
  -- Insert new lesson
  INSERT INTO lessons (
    chapter_id, 
    title_en, 
    title_ja, 
    title_mn, 
    order_number
  )
  VALUES (
    chapter_id, 
    title_en, 
    title_ja, 
    title_mn, 
    next_order
  );
  
  -- Return the simple_id
  SELECT 'L' || LPAD(next_order::text, 3, '0') INTO new_lesson_id;
  RETURN new_lesson_id;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;