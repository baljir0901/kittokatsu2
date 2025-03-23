import { Heart, Github } from "lucide-react";

export function Footer() {
  return (
    <footer className="bg-white border-t border-gray-200 py-8 mt-auto">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
          <div>
            <h3 className="text-sm font-semibold text-gray-900 tracking-wider uppercase mb-4">
              Kittokatsu.pro Бидний тухай
            </h3>
            <p className="text-gray-600 text-sm">
              Япон хэлний N1 түвшиний үг цээжлэх хичээлийн вэб сайт
            </p>
          </div>
          <div>
            <h3 className="text-sm font-semibold text-gray-900 tracking-wider uppercase mb-4">
              Шуурхай линкүүд
            </h3>
            <ul className="space-y-2">
              <li>
                <a
                  href="#"
                  className="text-gray-600 hover:text-indigo-600 text-sm"
                >
                  Нүүр
                </a>
              </li>
              <li>
                <a
                  href="#"
                  className="text-gray-600 hover:text-indigo-600 text-sm"
                >
                  Курсууд
                </a>
              </li>
              <li>
                <a
                  href="#"
                  className="text-gray-600 hover:text-indigo-600 text-sm"
                >
                  Сургалтын материал
                </a>
              </li>
              <li>
                <a
                  href="https://www.facebook.com/profile.php?id=61563614079853"
                  className="text-gray-600 hover:text-indigo-600 text-sm"
                >
                  Холбоо барих
                </a>
              </li>
            </ul>
          </div>
          <div>
            <h3 className="text-sm font-semibold text-gray-900 tracking-wider uppercase mb-4">
              Connect With Us
            </h3>
            <div className="flex space-x-4">
              <a
                href="#"
                className="text-gray-400 hover:text-indigo-600 transition-colors duration-150"
              >
                <Github className="w-6 h-6" />
              </a>
            </div>
          </div>
        </div>
        <div className="mt-8 pt-8 border-t border-gray-200">
          <p className="text-center text-gray-500 text-sm flex items-center justify-center">
            Made with <Heart className="w-4 h-4 mx-1 text-red-500" /> by
            Kittokatsu Team © {new Date().getFullYear()}
          </p>
        </div>
      </div>
    </footer>
  );
}
