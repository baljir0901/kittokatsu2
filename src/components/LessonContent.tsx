import { useState, useEffect } from "react";
import { supabase } from "../lib/supabase";
import { Header } from "./Header";
import { Footer } from "./Footer";
import type { Chapter, Lesson, VocabularyItem } from "../lib/supabase";
import { ChevronLeft, ChevronRight, Book } from "lucide-react";

export default function LessonContent() {
  const [chapters, setChapters] = useState<Chapter[]>([]);
  const [lessons, setLessons] = useState<Record<string, Lesson[]>>({});
  const [selectedLesson, setSelectedLesson] = useState<Lesson | null>(null);
  const [vocabularyItems, setVocabularyItems] = useState<VocabularyItem[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [sidebarOpen, setSidebarOpen] = useState(false);
  const [showHiragana, setShowHiragana] = useState(true);
  const [showTranslation, setShowTranslation] = useState(true);

  useEffect(() => {
    async function fetchData() {
      try {
        const { data: chaptersData, error: chaptersError } = await supabase
          .from("chapters")
          .select("*")
          .order("order_number");

        if (chaptersError) throw chaptersError;

        const { data: lessonsData, error: lessonsError } = await supabase
          .from("lessons")
          .select("*")
          .order("order_number");

        if (lessonsError) throw lessonsError;

        const lessonsByChapter: Record<string, Lesson[]> = {};
        lessonsData?.forEach((lesson: Lesson) => {
          if (lesson.chapter_id) {
            if (!lessonsByChapter[lesson.chapter_id]) {
              lessonsByChapter[lesson.chapter_id] = [];
            }
            lessonsByChapter[lesson.chapter_id].push(lesson);
          }
        });

        setChapters(chaptersData || []);
        setLessons(lessonsByChapter);

        if (lessonsData && lessonsData.length > 0) {
          const firstLesson = lessonsData[0];
          setSelectedLesson(firstLesson);

          const { data: vocabData, error: vocabError } = await supabase
            .from("vocabulary_items")
            .select("*")
            .eq("lesson_id", firstLesson.id)
            .order("order_number");

          if (vocabError) throw vocabError;
          setVocabularyItems(vocabData || []);
        }
      } catch (err) {
        console.error("Error fetching data:", err);
        setError(err instanceof Error ? err.message : "Failed to fetch data");
      } finally {
        setLoading(false);
      }
    }

    fetchData();
  }, []);

  const handleLessonChange = async (lesson: Lesson) => {
    setSelectedLesson(lesson);
    try {
      const { data: vocabData, error: vocabError } = await supabase
        .from("vocabulary_items")
        .select("*")
        .eq("lesson_id", lesson.id)
        .order("order_number");

      if (vocabError) throw vocabError;
      setVocabularyItems(vocabData || []);
    } catch (err) {
      console.error("Error fetching vocabulary items:", err);
    }
  };

  if (loading) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center">
        <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-indigo-600"></div>
      </div>
    );
  }

  if (error) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center">
        <div className="text-red-600 bg-red-50 p-4 rounded-lg">
          <p>Error: {error}</p>
        </div>
      </div>
    );
  }

  return (
    <div className="min-h-screen flex flex-col bg-[#f8f9fa]">
      <Header
        sidebarOpen={sidebarOpen}
        setSidebarOpen={setSidebarOpen}
        showHiragana={showHiragana}
        setShowHiragana={setShowHiragana}
        showTranslation={showTranslation}
        setShowTranslation={setShowTranslation}
      />

      <div className="flex-1 pt-16">
        <div className="flex">
          {/* Sidebar */}
          <div
            className={`fixed inset-y-0 left-0 transform ${
              sidebarOpen ? "translate-x-0" : "-translate-x-full"
            } lg:translate-x-0 lg:relative lg:inset-auto z-50 w-64 bg-white shadow-lg transition duration-200 ease-in-out lg:shadow-none border-r border-gray-200`}
          >
            <div className="h-full overflow-y-auto">
              <nav className="px-4 py-6">
                {chapters.map((chapter) => (
                  <div key={chapter.id} className="mb-6">
                    <h3 className="text-sm font-semibold text-[#495057] uppercase tracking-wider mb-3 flex items-center">
                      <Book className="w-4 h-4 mr-2" />
                      {chapter.title_mn}
                    </h3>
                    <ul className="space-y-1">
                      {lessons[chapter.id]?.map((lesson) => (
                        <li key={lesson.id}>
                          <button
                            onClick={() => handleLessonChange(lesson)}
                            className={`w-full text-left px-3 py-2 rounded-md text-sm transition-colors duration-150 ${
                              selectedLesson?.id === lesson.id
                                ? "bg-[#4263eb] text-white"
                                : "text-[#495057] hover:bg-gray-50"
                            }`}
                          >
                            {lesson.title_mn}
                          </button>
                        </li>
                      ))}
                    </ul>
                  </div>
                ))}
              </nav>
            </div>
          </div>

          {/* Main content */}
          <div className="flex-1 min-w-0">
            <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
              {selectedLesson && (
                <div>
                  <div className="bg-white rounded-lg shadow-sm border border-gray-200 overflow-hidden mb-8">
                    <div className="p-6 border-b border-gray-200">
                      <div className="flex items-center justify-between mb-6">
                        <div>
                          <h1 className="text-2xl font-bold text-[#495057] mb-2">
                            {selectedLesson.title_mn}
                          </h1>
                          <div className="text-[#868e96]">
                            <p className="text-lg">{selectedLesson.title_ja}</p>
                            <p>{selectedLesson.title_en}</p>
                          </div>
                        </div>
                        {selectedLesson.audio_url && (
                          <audio controls className="w-96">
                            <source
                              src={selectedLesson.audio_url}
                              type="audio/mpeg"
                            />
                          </audio>
                        )}
                      </div>

                      <div className="flex space-x-4">
                        <button
                          onClick={() => setShowHiragana(!showHiragana)}
                          className={`px-4 py-2 rounded-md text-sm font-medium transition-colors duration-150 ${
                            showHiragana
                              ? "bg-[#4263eb] text-white"
                              : "bg-gray-100 text-gray-700 hover:bg-gray-200"
                          }`}
                        >
                          Хирагана
                        </button>
                        <button
                          onClick={() => setShowTranslation(!showTranslation)}
                          className={`px-4 py-2 rounded-md text-sm font-medium transition-colors duration-150 ${
                            showTranslation
                              ? "bg-[#4263eb] text-white"
                              : "bg-gray-100 text-gray-700 hover:bg-gray-200"
                          }`}
                        >
                          Орчуулга
                        </button>
                      </div>
                    </div>

                    {vocabularyItems.length > 0 && (
                      <div className="overflow-x-auto">
                        <table className="min-w-full divide-y divide-gray-200">
                          <thead className="bg-gray-50">
                            <tr>
                              <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider w-16">
                                #
                              </th>
                              <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                漢字
                              </th>
                              {showHiragana && (
                                <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                  ひらがな
                                </th>
                              )}
                              {showTranslation && (
                                <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                  Монгол
                                </th>
                              )}
                              <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                例文
                              </th>
                              <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider w-16">
                                Audio
                              </th>
                            </tr>
                          </thead>
                          <tbody className="bg-white divide-y divide-gray-200">
                            {vocabularyItems.map((item) => (
                              <tr
                                key={item.id}
                                className="hover:bg-gray-50 transition-colors duration-150"
                              >
                                <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                                  {item.order_number}
                                </td>
                                <td className="px-6 py-4 whitespace-nowrap">
                                  <span className="text-lg font-medium text-[#495057]">
                                    {item.kanji}
                                  </span>
                                </td>
                                {showHiragana && (
                                  <td className="px-6 py-4 whitespace-nowrap">
                                    <span className="text-sm text-[#495057]">
                                      {item.hiragana}
                                    </span>
                                  </td>
                                )}
                                {showTranslation && (
                                  <td className="px-6 py-4 whitespace-nowrap">
                                    <span className="text-sm text-[#495057]">
                                      {item.translation}
                                    </span>
                                  </td>
                                )}
                                <td className="px-6 py-4">
                                  <div className="space-y-1">
                                    <p className="text-[#495057]">
                                      {item.example_ja}
                                    </p>
                                    {showTranslation && (
                                      <p className="text-[#868e96]">
                                        {item.example_mn}
                                      </p>
                                    )}
                                  </div>
                                </td>
                                <td className="px-6 py-4 whitespace-nowrap"></td>
                              </tr>
                            ))}
                          </tbody>
                        </table>
                      </div>
                    )}
                  </div>

                  <div className="flex justify-between">
                    <button className="inline-flex items-center px-4 py-2 border border-gray-300 rounded-md shadow-sm text-sm font-medium text-gray-700 bg-white hover:bg-gray-50 transition-colors duration-150">
                      <ChevronLeft className="w-5 h-5 mr-2" />
                      Өмнөх хичээл
                    </button>
                    <button className="inline-flex items-center px-4 py-2 border border-gray-300 rounded-md shadow-sm text-sm font-medium text-gray-700 bg-white hover:bg-gray-50 transition-colors duration-150">
                      Дараагийн хичээл
                      <ChevronRight className="w-5 h-5 ml-2" />
                    </button>
                  </div>
                </div>
              )}
            </div>
          </div>
        </div>
      </div>

      <Footer />
    </div>
  );
}
