import React from 'react';
import { Link } from 'react-router-dom';
import { Facebook, GraduationCap } from 'lucide-react';

export default function Contact() {
  return (
    <div className="min-h-screen bg-gray-50 flex flex-col justify-center py-12 sm:px-6 lg:px-8">
      <div className="sm:mx-auto sm:w-full sm:max-w-md">
        <div className="flex justify-center">
          <GraduationCap className="w-12 h-12 text-indigo-600" />
        </div>
        <h2 className="mt-6 text-center text-3xl font-extrabold text-gray-900">
          Contact Admin
        </h2>
        <p className="mt-2 text-center text-sm text-gray-600">
          Please contact the admin to get access to the lessons
        </p>
      </div>

      <div className="mt-8 sm:mx-auto sm:w-full sm:max-w-md">
        <div className="bg-white py-8 px-4 shadow sm:rounded-lg sm:px-10">
          <div className="text-center">
            <p className="text-gray-700 mb-6">
              To get access to all lessons, please contact the admin through Facebook:
            </p>
            
            <a
              href="https://www.facebook.com/profile.php?id=61563614079853"
              target="_blank"
              rel="noopener noreferrer"
              className="inline-flex items-center justify-center px-4 py-2 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-[#1877F2] hover:bg-[#166FE5] focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-[#1877F2]"
            >
              <Facebook className="w-5 h-5 mr-2" />
              Contact on Facebook
            </a>

            <div className="mt-6">
              <p className="text-gray-600 text-sm">
                After contacting the admin, they will review your request and grant you access to the lessons.
              </p>
            </div>

            <div className="mt-6 pt-6 border-t border-gray-200">
              <Link
                to="/login"
                className="text-indigo-600 hover:text-indigo-500 font-medium"
              >
                Return to login
              </Link>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}