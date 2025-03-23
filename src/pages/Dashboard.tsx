import React from 'react';
import { useAuth } from '../contexts/AuthContext';
import LessonContent from '../components/LessonContent';

export default function Dashboard() {
  const { user } = useAuth();

  return (
    <div className="min-h-screen bg-gray-50">
      <LessonContent />
    </div>
  );
}