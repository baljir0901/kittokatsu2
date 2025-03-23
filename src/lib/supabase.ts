import { createClient } from "@supabase/supabase-js";

const supabaseUrl = import.meta.env.VITE_SUPABASE_URL;
const supabaseAnonKey = import.meta.env.VITE_SUPABASE_ANON_KEY;

if (!supabaseUrl || !supabaseAnonKey) {
  throw new Error("Missing Supabase environment variables");
}

export const supabase = createClient(supabaseUrl, supabaseAnonKey);

export type Chapter = {
  id: string;
  title_en: string;
  title_ja: string;
  title_mn: string;
  order_number: number;
  created_at: string;
  updated_at: string;
};

export type Lesson = {
  id: string;
  title: string;
  title_en: string | null;
  title_ja: string | null;
  title_mn: string | null;
  description: string | null;
  chapter_id: string | null;
  audio_url: string;
  order_number: number | null;
  completed: boolean;
  created_at: string;
  updated_at: string;
};

export type VocabularyItem = {
  id: string;
  lesson_id: string;
  kanji: string;
  hiragana: string;
  translation: string;
  example_ja: string | null;
  example_mn: string | null;
  order_number: number;
  created_at: string;
  updated_at: string;
};
