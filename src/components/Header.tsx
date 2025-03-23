import { useState } from "react";
import { Link, useNavigate } from "react-router-dom";
import { GraduationCap, Menu, Eye, EyeOff, LogOut, User } from "lucide-react";
import { useAuth } from "../contexts/AuthContext";

interface HeaderProps {
  sidebarOpen: boolean;
  setSidebarOpen: (open: boolean) => void;
  showHiragana: boolean;
  setShowHiragana: (show: boolean) => void;
  showTranslation: boolean;
  setShowTranslation: (show: boolean) => void;
}

export function Header({
  sidebarOpen,
  setSidebarOpen,
  showHiragana,
  setShowHiragana,
  showTranslation,
  setShowTranslation,
}: HeaderProps) {
  const { user, signOut } = useAuth();
  const navigate = useNavigate();
  const [userMenuOpen, setUserMenuOpen] = useState(false);

  const handleSignOut = async () => {
    try {
      await signOut();
      navigate("/login");
    } catch (error) {
      console.error("Error signing out:", error);
    }
  };

  return (
    <nav className="bg-gradient-to-r from-[#2D3648] to-[#141E30] text-white fixed w-full z-10">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="flex justify-between h-16">
          <div className="flex items-center">
            <button
              onClick={() => setSidebarOpen(!sidebarOpen)}
              className="p-2 rounded-md text-gray-200 hover:text-white hover:bg-[#1F2937] focus:outline-none focus:ring-2 focus:ring-inset focus:ring-white lg:hidden"
            >
              <Menu className="h-6 w-6" />
            </button>
            <Link to="/" className="flex items-center space-x-4">
              <GraduationCap className="w-8 h-8 text-[#F0B341]" />
              <div>
                <h1 className="text-xl font-bold">Kittokatsu</h1>
                <p className="text-xs text-gray-300">Япон хэлний сургалт</p>
              </div>
            </Link>
          </div>

          <div className="flex items-center space-x-4">
            {user ? (
              <>
                <button
                  onClick={() => setShowHiragana(!showHiragana)}
                  className={`flex items-center px-3 py-2 rounded-md text-sm font-medium ${
                    showHiragana
                      ? "bg-[#1F2937] text-white"
                      : "text-gray-300 hover:bg-[#1F2937]"
                  } transition-colors duration-150`}
                >
                  {showHiragana ? (
                    <Eye className="w-4 h-4 mr-2" />
                  ) : (
                    <EyeOff className="w-4 h-4 mr-2" />
                  )}
                  Хирагана
                </button>
                <button
                  onClick={() => setShowTranslation(!showTranslation)}
                  className={`flex items-center px-3 py-2 rounded-md text-sm font-medium ${
                    showTranslation
                      ? "bg-[#1F2937] text-white"
                      : "text-gray-300 hover:bg-[#1F2937]"
                  } transition-colors duration-150`}
                >
                  {showTranslation ? (
                    <Eye className="w-4 h-4 mr-2" />
                  ) : (
                    <EyeOff className="w-4 h-4 mr-2" />
                  )}
                  Орчуулга
                </button>
                <div className="relative">
                  <button
                    onClick={() => setUserMenuOpen(!userMenuOpen)}
                    className="flex items-center space-x-2 p-2 rounded-md hover:bg-[#1F2937] focus:outline-none focus:ring-2 focus:ring-white"
                  >
                    <User className="w-5 h-5" />
                    <span className="text-sm">{user.email}</span>
                  </button>
                  {userMenuOpen && (
                    <div className="absolute right-0 mt-2 w-48 rounded-md shadow-lg bg-white ring-1 ring-black ring-opacity-5">
                      <div className="py-1">
                        <button
                          onClick={handleSignOut}
                          className="w-full text-left px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 flex items-center"
                        >
                          <LogOut className="w-4 h-4 mr-2" />
                          Гарах
                        </button>
                      </div>
                    </div>
                  )}
                </div>
              </>
            ) : (
              <div className="flex items-center space-x-4">
                <Link
                  to="/login"
                  className="text-gray-300 hover:bg-[#1F2937] px-3 py-2 rounded-md text-sm font-medium"
                >
                  Нэвтрэх
                </Link>
                <Link
                  to="/register"
                  className="bg-[#F0B341] text-[#2D3648] hover:bg-[#E5A93C] px-3 py-2 rounded-md text-sm font-medium"
                >
                  Бүртгүүлэх
                </Link>
              </div>
            )}
          </div>
        </div>
      </div>
    </nav>
  );
}
