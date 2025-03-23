/*
  # Insert initial lessons data
  
  1. Data Population
    - Insert 14 chapters with their respective lessons
    - Each lesson includes:
      - Title
      - Content
      - Created and updated timestamps
*/

-- Insert lessons data
INSERT INTO lessons (title, content, created_at, updated_at) VALUES
('Chapter 1: Hiragana', 'Hiragana is one of the three writing systems used in the Japanese language. It is a phonetic alphabet that represents all the sounds in the Japanese language. Each hiragana character represents a specific syllable.

Basic Rules:
1. Hiragana is used for Japanese words
2. It represents grammatical elements
3. It''s the first writing system taught to children

Common Uses:
- Writing particles (は, が, の, etc.)
- Writing verb and adjective endings
- Writing words with no kanji form', now(), now()),

('Chapter 2: Katakana', 'Katakana is another phonetic alphabet in Japanese, used primarily for foreign words and names. Like hiragana, each character represents a syllable.

Key Points:
1. Used for foreign loanwords
2. Used for emphasis (like italics in English)
3. Used for technical and scientific terms

Common Uses:
- Foreign names and places
- Modern technology terms
- Foreign food names', now(), now()),

('Chapter 3: Basic Greetings', 'Learn essential Japanese greetings used in daily life.

Key Expressions:
1. おはようございます (Ohayou gozaimasu) - Good morning
2. こんにちは (Konnichiwa) - Hello/Good afternoon
3. こんばんは (Konbanwa) - Good evening
4. さようなら (Sayounara) - Goodbye
5. ありがとうございます (Arigatou gozaimasu) - Thank you', now(), now()),

('Chapter 4: Self Introduction', 'Learn how to introduce yourself in Japanese.

Basic Pattern:
1. はじめまして (Hajimemashite) - Nice to meet you
2. [Your name]です ([Your name] desu) - I am [name]
3. どうぞよろしくお願いします (Douzo yoroshiku onegaishimasu) - Please treat me well

Additional Points:
- Adding your occupation
- Mentioning your nationality
- Stating your age (if appropriate)', now(), now()),

('Chapter 5: Numbers and Counting', 'Japanese number system and counting methods.

Basic Numbers:
1. 一 (いち) - One
2. 二 (に) - Two
3. 三 (さん) - Three
4. 四 (よん/し) - Four
5. 五 (ご) - Five

Counting Systems:
- General counting
- Counting flat objects
- Counting people
- Time and dates', now(), now()),

('Chapter 6: Basic Particles', 'Understanding essential Japanese particles.

Important Particles:
1. は (wa) - Topic marker
2. が (ga) - Subject marker
3. を (wo) - Object marker
4. に (ni) - Time/location marker
5. で (de) - Location of action marker

Usage Examples:
- Basic sentence structure
- Particle combinations
- Common mistakes to avoid', now(), now()),

('Chapter 7: Basic Verbs', 'Essential Japanese verbs and their conjugations.

Common Verbs:
1. する (suru) - To do
2. いく (iku) - To go
3. くる (kuru) - To come
4. たべる (taberu) - To eat
5. のむ (nomu) - To drink

Conjugation Patterns:
- Present tense
- Past tense
- Negative forms
- Te-form', now(), now()),

('Chapter 8: Basic Adjectives', 'Learn about Japanese adjectives and their usage.

Types of Adjectives:
1. い-adjectives (e.g., おいしい - delicious)
2. な-adjectives (e.g., きれい - beautiful)

Conjugation Rules:
- Present tense
- Past tense
- Negative forms
- Combining adjectives', now(), now()),

('Chapter 9: Basic Expressions', 'Essential Japanese expressions for daily conversation.

Common Phrases:
1. すみません (Sumimasen) - Excuse me/I''m sorry
2. わかりました (Wakarimashita) - I understand
3. いいですね (Ii desu ne) - That''s good
4. だいじょうぶです (Daijoubu desu) - It''s okay

Usage Contexts:
- Formal situations
- Casual situations
- Business settings', now(), now()),

('Chapter 10: Time and Calendar', 'Understanding time expressions and calendar terms in Japanese.

Time Expressions:
1. Days of the week
2. Months
3. Years
4. Clock time
5. Scheduling appointments

Calendar Terms:
- Traditional Japanese calendar
- Modern calendar usage
- Important dates and holidays', now(), now()),

('Chapter 11: Basic Kanji', 'Introduction to basic Japanese kanji characters.

First Kanji Set:
1. 日 (hi/nichi) - Day, sun
2. 月 (tsuki/getsu) - Month, moon
3. 火 (hi/ka) - Fire
4. 水 (mizu/sui) - Water
5. 木 (ki/moku) - Tree, wood

Learning Methods:
- Stroke order
- Radicals
- Common compounds', now(), now()),

('Chapter 12: Basic Grammar', 'Fundamental Japanese grammar patterns.

Key Grammar Points:
1. Basic sentence structure (SOV)
2. Question formation
3. Negative sentences
4. Past tense formation
5. Polite vs. casual speech

Practice Points:
- Pattern exercises
- Common mistakes
- Usage examples', now(), now()),

('Chapter 13: Daily Activities', 'Vocabulary and phrases for daily activities.

Common Activities:
1. Morning routine
2. School/Work activities
3. Shopping
4. Eating out
5. Transportation

Useful Vocabulary:
- Time-related expressions
- Location phrases
- Action verbs
- Common nouns', now(), now()),

('Chapter 14: Basic Conversation', 'Practice basic Japanese conversations.

Conversation Topics:
1. Meeting people
2. Shopping
3. Ordering food
4. Asking directions
5. Making plans

Key Points:
- Natural flow
- Proper responses
- Cultural context
- Common expressions', now(), now());