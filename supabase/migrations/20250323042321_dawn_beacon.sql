/*
  # Create lessons table for storing lesson content

  1. New Tables
    - `lessons`
      - `id` (uuid, primary key)
      - `title` (text, required)
      - `content` (text, required) - The lesson text content
      - `audio_url` (text) - URL to the audio file in Supabase storage
      - `created_at` (timestamp)
      - `updated_at` (timestamp)
      - `user_id` (uuid) - Reference to the auth.users table

  2. Security
    - Enable RLS on `lessons` table
    - Add policies for:
      - Authenticated users can read all lessons
      - Only admin users can create/update/delete lessons
*/

CREATE TABLE IF NOT EXISTS lessons (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  title text NOT NULL,
  content text NOT NULL,
  audio_url text,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now(),
  user_id uuid REFERENCES auth.users(id)
);

-- Enable RLS
ALTER TABLE lessons ENABLE ROW LEVEL SECURITY;

-- Create policies
CREATE POLICY "Anyone can view lessons"
  ON lessons
  FOR SELECT
  TO authenticated
  USING (true);

CREATE POLICY "Only admins can modify lessons"
  ON lessons
  FOR ALL
  TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM auth.users
      WHERE auth.users.id = auth.uid()
      AND auth.users.email IN ('admin@example.com') -- Replace with your admin email
    )
  );