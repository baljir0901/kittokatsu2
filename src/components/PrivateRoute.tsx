import React, { useState, useEffect } from 'react';
import { Navigate } from 'react-router-dom';
import { useAuth } from '../contexts/AuthContext';
import { supabase } from '../lib/supabase';

export default function PrivateRoute({ children }: { children: React.ReactNode }) {
  const { user, loading } = useAuth();
  const [userRole, setUserRole] = useState<string | null>(null);
  const [roleLoading, setRoleLoading] = useState(true);

  useEffect(() => {
    async function checkUserRole() {
      if (!user) {
        setRoleLoading(false);
        return;
      }

      try {
        const { data: userRoles, error } = await supabase
          .from('user_roles')
          .select(`
            roles (
              name
            )
          `)
          .eq('user_id', user.id)
          .single();

        if (error) throw error;

        if (userRoles?.roles?.name) {
          setUserRole(userRoles.roles.name);
        }
      } catch (err) {
        console.error('Error checking user role:', err);
      } finally {
        setRoleLoading(false);
      }
    }

    checkUserRole();
  }, [user]);

  if (loading || roleLoading) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-indigo-600"></div>
      </div>
    );
  }

  // If user is not logged in, redirect to login
  if (!user) {
    return <Navigate to="/login" />;
  }

  // If user has no role or pending role, redirect to contact page
  if (!userRole || userRole === 'pending') {
    return <Navigate to="/contact" />;
  }

  // If user is admin and trying to access student pages, allow it
  if (userRole === 'admin') {
    return <>{children}</>;
  }

  // If user is student and trying to access admin pages, redirect to dashboard
  if (userRole === 'student' && window.location.pathname.includes('/admin')) {
    return <Navigate to="/dashboard" />;
  }

  // Otherwise, render the protected component
  return <>{children}</>;
}