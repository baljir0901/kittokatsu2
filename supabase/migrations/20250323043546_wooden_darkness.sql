/*
  # Add Japanese Learning Lessons

  1. Content Addition
    - Adds 14 chapters of Japanese learning content
    - Each lesson includes title and content
    - Preserves line breaks and formatting for proper display

  2. Security
    - Content is publicly readable
    - Only admin can modify
*/

-- Insert lessons
INSERT INTO lessons (title, content) VALUES
('Chapter 1: Introduction to Japanese Writing System', 'The Japanese writing system consists of three different character sets: Hiragana, Katakana, and Kanji.

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
- Multiple readings per character'),

('Chapter 2: Hiragana Basics', 'Hiragana is the most basic Japanese writing system.

Basic Vowels:
あ (a) - like "a" in "father"
い (i) - like "ee" in "see"
う (u) - like "oo" in "boot"
え (e) - like "e" in "bed"
お (o) - like "o" in "go"

K-Series:
か (ka) - like "ka" in "karma"
き (ki) - like "key"
く (ku) - like "coo"
け (ke) - like "ke" in "kept"
こ (ko) - like "ko" in "koko"'),

('Chapter 3: Katakana Introduction', 'Katakana is used primarily for foreign loanwords.

Basic Vowels:
ア (a) - like "a" in "father"
イ (i) - like "ee" in "see"
ウ (u) - like "oo" in "boot"
エ (e) - like "e" in "bed"
オ (o) - like "o" in "go"

Common Usage:
- Foreign names
- Foreign places
- Technical terms
- Sound effects in manga'),

('Chapter 4: Basic Greetings', 'Essential Japanese greetings for daily use.

Morning Greetings:
おはようございます (Ohayou gozaimasu) - Good morning (formal)
おはよう (Ohayou) - Good morning (casual)

Daytime Greetings:
こんにちは (Konnichiwa) - Good afternoon/Hello
こんばんは (Konbanwa) - Good evening

Other Common Greetings:
さようなら (Sayounara) - Goodbye (formal)
じゃあね (Jaa ne) - See you (casual)
おやすみなさい (Oyasumi nasai) - Good night (formal)'),

('Chapter 5: Numbers and Counting', 'Basic numbers in Japanese:

1-10:
一 (いち) - 1
二 (に) - 2
三 (さん) - 3
四 (よん/し) - 4
五 (ご) - 5
六 (ろく) - 6
七 (なな/しち) - 7
八 (はち) - 8
九 (きゅう/く) - 9
十 (じゅう) - 10

Counting Objects:
Different counters are used for different types of objects:
- ～つ (tsu) - General counter for small objects
- ～人 (nin) - Counter for people
- ～枚 (mai) - Counter for flat objects'),

('Chapter 6: Basic Particles', 'Essential Japanese particles and their uses:

は (wa) - Topic marker
- Marks the topic of the sentence
- Example: 私は学生です (Watashi wa gakusei desu) - I am a student

が (ga) - Subject marker
- Marks the subject of the action
- Example: 雨が降っています (Ame ga futte imasu) - Rain is falling

を (wo) - Object marker
- Marks the direct object
- Example: 本を読みます (Hon wo yomimasu) - I read a book'),

('Chapter 7: Basic Verbs', 'Common Japanese verbs and their conjugations:

する (suru) - To do
します (shimasu) - Present/Future
しました (shimashita) - Past
しています (shite imasu) - Present continuous

食べる (taberu) - To eat
食べます (tabemasu) - Present/Future
食べました (tabemashita) - Past
食べています (tabete imasu) - Present continuous'),

('Chapter 8: Adjectives', 'Two types of Japanese adjectives:

い-Adjectives:
高い (takai) - Expensive/Tall
安い (yasui) - Cheap
新しい (atarashii) - New
古い (furui) - Old

な-Adjectives:
きれい (kirei) - Beautiful/Clean
静か (shizuka) - Quiet
便利 (benri) - Convenient
有名 (yuumei) - Famous'),

('Chapter 9: Basic Sentence Structure', 'Japanese basic sentence patterns:

Subject + は + Object + を + Verb
私は本を読みます
(Watashi wa hon wo yomimasu)
I read a book

Subject + は + Adjective + です
この本は面白いです
(Kono hon wa omoshiroi desu)
This book is interesting'),

('Chapter 10: Time and Calendar', 'Expressing time in Japanese:

Days of the Week:
月曜日 (げつようび) - Monday
火曜日 (かようび) - Tuesday
水曜日 (すいようび) - Wednesday
木曜日 (もくようび) - Thursday
金曜日 (きんようび) - Friday
土曜日 (どようび) - Saturday
日曜日 (にちようび) - Sunday

Months:
一月 (いちがつ) - January
二月 (にがつ) - February
三月 (さんがつ) - March'),

('Chapter 11: Basic Expressions', 'Useful everyday expressions:

ありがとうございます
(Arigatou gozaimasu)
Thank you (formal)

すみません
(Sumimasen)
Excuse me/Im sorry

お願いします
(Onegai shimasu)
Please

どういたしまして
(Dou itashimashite)
Youre welcome'),

('Chapter 12: Family Terms', 'Family members in Japanese:

Immediate Family:
父 (ちち) - My father
母 (はは) - My mother
兄 (あに) - My older brother
姉 (あね) - My older sister
弟 (おとうと) - My younger brother
妹 (いもうと) - My younger sister

Other''s Family:
お父さん (おとうさん) - Someone else''s father
お母さん (おかあさん) - Someone else''s mother'),

('Chapter 13: Places and Directions', 'Common locations and direction words:

Basic Locations:
学校 (がっこう) - School
図書館 (としょかん) - Library
駅 (えき) - Station
病院 (びょういん) - Hospital

Directions:
上 (うえ) - Up/Above
下 (した) - Down/Below
左 (ひだり) - Left
右 (みぎ) - Right'),

('Chapter 14: Basic Kanji', 'Essential Kanji characters:

人 (ひと) - Person
日 (ひ) - Day/Sun
月 (つき) - Month/Moon
火 (ひ) - Fire
水 (みず) - Water
木 (き) - Tree
金 (かね) - Money/Gold
土 (つち) - Earth

Common Compounds:
日本 (にほん) - Japan
中国 (ちゅうごく) - China
火曜日 (かようび) - Tuesday');