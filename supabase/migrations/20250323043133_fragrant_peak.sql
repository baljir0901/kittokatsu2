/*
  # Add initial Japanese lessons

  1. Changes
    - Insert 14 chapters of Japanese lessons into the lessons table
    - Each lesson includes:
      - Title
      - Content from the original Kittokatsu repository
      - Audio URL (where applicable)
*/

INSERT INTO lessons (title, content, audio_url) VALUES
('Lesson 1-1: Basic Greetings', 
'こんにちは (Konnichiwa) - Hello/Good afternoon
おはようございます (Ohayou gozaimasu) - Good morning
こんばんは (Konbanwa) - Good evening
さようなら (Sayounara) - Goodbye
ありがとうございます (Arigatou gozaimasu) - Thank you very much
どういたしまして (Douitashimashite) - You''re welcome

These are the most basic and commonly used greetings in Japanese. Practice them daily to become familiar with Japanese pronunciation and politeness levels.

Remember:
- Japanese greetings change based on the time of day
- The suffix ございます (gozaimasu) makes expressions more polite
- Proper pronunciation and timing are important in Japanese culture', 
'https://audio.oxforddictionaries.com/en/mp3/konnichiwa_1_jp.mp3'),

('Lesson 1-2: Self Introduction', 
'はじめまして (Hajimemashite) - Nice to meet you
私の名前は___です (Watashi no namae wa ___ desu) - My name is ___
どうぞよろしく (Douzo yoroshiku) - Please treat me well/Nice to meet you

When introducing yourself in Japanese:
1. Start with はじめまして
2. State your name using 私の名前は or 私は
3. End with どうぞよろしく

This is the standard format for self-introductions in Japanese. It''s polite and widely used in both formal and casual situations.', 
'https://audio.oxforddictionaries.com/en/mp3/hajimemashite_1_jp.mp3'),

('Lesson 1-3: Basic Questions', 
'お名前は何ですか？ (Onamae wa nan desu ka?) - What is your name?
どこから来ましたか？ (Doko kara kimashita ka?) - Where did you come from?
お仕事は何ですか？ (Oshigoto wa nan desu ka?) - What is your occupation?

Question words in Japanese:
- 何 (nani/nan) - what
- どこ (doko) - where
- いつ (itsu) - when
- だれ (dare) - who
- どうして (doushite) - why

Remember to end questions with か (ka) to indicate it''s a question.', 
'https://audio.oxforddictionaries.com/en/mp3/namae_1_jp.mp3'),

('Lesson 2-1: Numbers and Counting', 
'Basic numbers in Japanese:
1 - いち (ichi)
2 - に (ni)
3 - さん (san)
4 - よん/し (yon/shi)
5 - ご (go)
6 - ろく (roku)
7 - なな/しち (nana/shichi)
8 - はち (hachi)
9 - きゅう/く (kyuu/ku)
10 - じゅう (juu)

Japanese uses different counting systems depending on what you''re counting:
- Flat objects: まい (mai)
- Small animals: ひき (hiki)
- People: にん (nin)
- Long objects: ほん (hon)', 
'https://audio.oxforddictionaries.com/en/mp3/numbers_1_jp.mp3'),

('Lesson 2-2: Days of the Week', 
'日曜日 (nichiyoubi) - Sunday
月曜日 (getsuyoubi) - Monday
火曜日 (kayoubi) - Tuesday
水曜日 (suiyoubi) - Wednesday
木曜日 (mokuyoubi) - Thursday
金曜日 (kinyoubi) - Friday
土曜日 (doyoubi) - Saturday

Each day is named after celestial bodies:
日 (nichi) - sun
月 (getsu) - moon
火 (ka) - fire/Mars
水 (sui) - water/Mercury
木 (moku) - wood/Jupiter
金 (kin) - gold/Venus
土 (do) - earth/Saturn', 
'https://audio.oxforddictionaries.com/en/mp3/days_1_jp.mp3'),

('Lesson 3-1: Basic Verbs', 
'Common verbs in present tense:
行きます (ikimasu) - to go
来ます (kimasu) - to come
食べます (tabemasu) - to eat
飲みます (nomimasu) - to drink
見ます (mimasu) - to see/watch
聞きます (kikimasu) - to hear/listen
話します (hanashimasu) - to speak
寝ます (nemasu) - to sleep

Verb conjugation basics:
- ます (masu) form is polite present/future
- ません (masen) is negative
- ました (mashita) is past tense
- ませんでした (masendeshita) is negative past', 
'https://audio.oxforddictionaries.com/en/mp3/verbs_1_jp.mp3'),

('Lesson 3-2: Basic Adjectives', 
'い-adjectives (い-けいようし):
大きい (ookii) - big
小さい (chiisai) - small
高い (takai) - tall/expensive
安い (yasui) - cheap
暑い (atsui) - hot
寒い (samui) - cold
良い (yoi/ii) - good
悪い (warui) - bad

な-adjectives (な-けいようし):
きれい (kirei) - beautiful/clean
静か (shizuka) - quiet
便利 (benri) - convenient
有名 (yuumei) - famous
元気 (genki) - healthy/energetic

Adjective conjugation:
- Add です (desu) after な-adjectives
- い-adjectives don''t need です
- Change い to くない for negative
- Change い to かった for past tense', 
'https://audio.oxforddictionaries.com/en/mp3/adjectives_1_jp.mp3'),

('Lesson 4-1: Basic Particles', 
'は (wa) - topic marker
が (ga) - subject marker
を (wo) - object marker
に (ni) - time/target marker
で (de) - location/means marker
へ (e) - direction marker
の (no) - possession marker
と (to) - and/with

Example sentences:
私は学生です。(Watashi wa gakusei desu) - I am a student
本を読みます。(Hon wo yomimasu) - I read a book
学校に行きます。(Gakkou ni ikimasu) - I go to school
公園で遊びます。(Kouen de asobimasu) - I play in the park', 
'https://audio.oxforddictionaries.com/en/mp3/particles_1_jp.mp3'),

('Lesson 4-2: Basic Sentence Structure', 
'Japanese basic sentence structure: Subject + Object + Verb

Example patterns:
[Topic]は [Object]が [Adjective]です
私は犬が好きです。(Watashi wa inu ga suki desu) - I like dogs

[Subject]は [Location]に [Verb]
私は東京に住んでいます。(Watashi wa Tokyo ni sunde imasu) - I live in Tokyo

[Subject]は [Object]を [Verb]
私はご飯を食べます。(Watashi wa gohan wo tabemasu) - I eat rice

Remember:
- Verbs always come at the end
- Particles connect words and show their roles
- Subject can be omitted if clear from context', 
'https://audio.oxforddictionaries.com/en/mp3/structure_1_jp.mp3'),

('Lesson 5-1: Time Expressions', 
'Basic time words:
今 (ima) - now
今日 (kyou) - today
明日 (ashita) - tomorrow
昨日 (kinou) - yesterday
朝 (asa) - morning
昼 (hiru) - noon/afternoon
夜 (yoru) - night
週 (shuu) - week
月 (tsuki) - month
年 (toshi/nen) - year

Time expressions:
___時 (ji) - o''clock
___分 (fun/pun) - minutes
半 (han) - half
午前 (gozen) - AM
午後 (gogo) - PM', 
'https://audio.oxforddictionaries.com/en/mp3/time_1_jp.mp3'),

('Lesson 5-2: Calendar and Dates', 
'Months:
1月 (ichigatsu) - January
2月 (nigatsu) - February
3月 (sangatsu) - March
4月 (shigatsu) - April
5月 (gogatsu) - May
6月 (rokugatsu) - June
7月 (shichigatsu) - July
8月 (hachigatsu) - August
9月 (kugatsu) - September
10月 (juugatsu) - October
11月 (juuichigatsu) - November
12月 (juunigatsu) - December

Dates:
___日 (nichi/ka) - day of the month
Example: 3月15日 (san-gatsu juugo-nichi) - March 15th', 
'https://audio.oxforddictionaries.com/en/mp3/dates_1_jp.mp3'),

('Lesson 6-1: Basic Expressions', 
'すみません (sumimasen) - Excuse me/I''m sorry
お願いします (onegai shimasu) - Please
分かりました (wakarimashita) - I understand
分かりません (wakarimasen) - I don''t understand
大丈夫です (daijoubu desu) - It''s okay/I''m fine
いいですよ (ii desu yo) - That''s good/That''s fine
ちょっと待ってください (chotto matte kudasai) - Please wait a moment
もう一度お願いします (mou ichido onegai shimasu) - Please one more time

These expressions are essential for daily communication in Japanese.', 
'https://audio.oxforddictionaries.com/en/mp3/expressions_1_jp.mp3'),

('Lesson 6-2: Making Requests', 
'Basic request patterns:
___てください (te kudasai) - Please do ___
___ていただけませんか (te itadakemasen ka) - Could you please do ___
___てもいいですか (te mo ii desu ka) - May I ___?

Examples:
見てください (mite kudasai) - Please look
教えていただけませんか (oshiete itadakemasen ka) - Could you please teach me?
入ってもいいですか (haitte mo ii desu ka) - May I enter?

Remember:
- てください is casual but polite
- ていただけませんか is very polite
- てもいいですか is asking for permission', 
'https://audio.oxforddictionaries.com/en/mp3/requests_1_jp.mp3'),

('Lesson 7: Review and Practice', 
'This lesson reviews key points from previous lessons:

1. Greetings and Introduction
- Time-specific greetings
- Self-introduction format
- Basic questions

2. Numbers and Time
- Counting systems
- Days of the week
- Time expressions

3. Basic Grammar
- Verb conjugation
- Adjective types
- Particle usage

4. Practical Expressions
- Making requests
- Common phrases
- Asking permission

Practice these points regularly to build a strong foundation in Japanese.', 
'https://audio.oxforddictionaries.com/en/mp3/review_1_jp.mp3');