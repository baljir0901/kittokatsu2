/*
  # Create vocabulary items table for structured lesson content
  
  1. New Tables
    - `vocabulary_items` table for storing individual vocabulary entries
      - `id` (uuid, primary key)
      - `lesson_id` (uuid, foreign key to lessons)
      - `kanji` (text) - Japanese word in kanji
      - `hiragana` (text) - Reading in hiragana
      - `translation` (text) - Mongolian translation
      - `example_ja` (text) - Example sentence in Japanese
      - `example_mn` (text) - Example sentence translation in Mongolian
      - `audio_url` (text) - URL to pronunciation audio
      - `order_number` (integer) - Order within lesson
  
  2. Security
    - Enable RLS
    - Add policies for public read access and admin write access
*/

CREATE TABLE vocabulary_items (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  lesson_id uuid REFERENCES lessons(id) ON DELETE CASCADE,
  kanji text NOT NULL,
  hiragana text NOT NULL,
  translation text NOT NULL,
  example_ja text,
  example_mn text,
  audio_url text,
  order_number integer NOT NULL,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

-- Enable RLS
ALTER TABLE vocabulary_items ENABLE ROW LEVEL SECURITY;

-- Create policies
CREATE POLICY "Anyone can view vocabulary items"
  ON vocabulary_items
  FOR SELECT
  TO public
  USING (true);

CREATE POLICY "Only admins can modify vocabulary items"
  ON vocabulary_items
  FOR ALL
  TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM auth.users
      WHERE auth.users.id = auth.uid()
      AND auth.users.email = 'admin@example.com'
    )
  );