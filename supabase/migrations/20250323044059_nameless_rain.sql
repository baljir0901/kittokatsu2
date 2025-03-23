/*
  # Verify lessons setup and policies

  1. Security
    - Verify and update RLS policies for lessons table
  
  2. Changes
    - Simplify policies to ensure public read access
    - Ensure lessons are accessible
*/

-- Enable RLS
ALTER TABLE lessons ENABLE ROW LEVEL SECURITY;

-- Drop existing policies to start fresh
DROP POLICY IF EXISTS "Anyone can view lessons" ON lessons;
DROP POLICY IF EXISTS "Only admins can modify lessons" ON lessons;

-- Create simplified read policy
CREATE POLICY "Anyone can view lessons"
ON lessons
FOR SELECT
TO public
USING (true);

-- Create admin modification policy
CREATE POLICY "Only admins can modify lessons"
ON lessons
FOR ALL
TO authenticated
USING (
  EXISTS (
    SELECT 1 FROM auth.users
    WHERE auth.users.id = auth.uid()
    AND auth.users.email = 'admin@example.com'
  )
);

-- Verify lessons exist, insert if empty
INSERT INTO lessons (title, content)
SELECT 'Chapter 1: Introduction to Japanese Writing System',
       'The Japanese writing system consists of three different character sets: Hiragana, Katakana, and Kanji.

Hiragana (ひらがな):
- Basic phonetic alphabet
- Used for native Japanese words
- First writing system taught to children

Katakana (カタカナ):
- Angular phonetic alphabet
- Used for foreign loanwords
- Also used for emphasis and technical terms

Kanji (漢字):
- Chinese characters adapted for Japanese
- Used for content words
- Multiple readings per character'
WHERE NOT EXISTS (SELECT 1 FROM lessons LIMIT 1);