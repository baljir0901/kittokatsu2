import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { supabase } from '../lib/supabase';
import { useAuth } from '../contexts/AuthContext';
import { UserCheck, UserX, Loader } from 'lucide-react';

interface PendingUser {
  id: string;
  email: string;
  created_at: string;
}

export default function AdminDashboard() {
  const [pendingUsers, setPendingUsers] = useState<PendingUser[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const { user } = useAuth();
  const navigate = useNavigate();

  useEffect(() => {
    checkAdminAndFetchUsers();
  }, []);

  const checkAdminAndFetchUsers = async () => {
    try {
      // Check if current user is admin
      const { data: adminCheck } = await supabase
        .from('user_roles')
        .select(`
          roles (
            name
          )
        `)
        .eq('user_id', user?.id)
        .single();

      if (!adminCheck || adminCheck.roles.name !== 'admin') {
        navigate('/dashboard');
        return;
      }

      // Get pending role id first
      const { data: pendingRole } = await supabase
        .from('roles')
        .select('id')
        .eq('name', 'pending')
        .single();

      if (!pendingRole) throw new Error('Pending role not found');

      // Get users with pending role
      const { data: pendingUserRoles, error: usersError } = await supabase
        .from('user_roles')
        .select('user_id')
        .eq('role_id', pendingRole.id);

      if (usersError) throw usersError;

      // Get user details from auth.users using RPC
      const userIds = pendingUserRoles?.map(ur => ur.user_id) || [];
      
      if (userIds.length > 0) {
        const { data: users, error: authError } = await supabase
          .rpc('get_users_by_ids', { user_ids: userIds });

        if (authError) throw authError;

        setPendingUsers(users || []);
      } else {
        setPendingUsers([]);
      }
    } catch (err) {
      console.error('Error fetching pending users:', err);
      setError('Хүлээгдэж буй хэрэглэгчдийг ачаалахад алдаа гарлаа');
    } finally {
      setLoading(false);
    }
  };

  const handleApprove = async (userId: string) => {
    try {
      // Get role IDs
      const { data: roles } = await supabase
        .from('roles')
        .select('id, name')
        .in('name', ['pending', 'student']);

      if (!roles) throw new Error('Roles not found');

      const pendingRole = roles.find(r => r.name === 'pending');
      const studentRole = roles.find(r => r.name === 'student');

      if (!pendingRole || !studentRole) throw new Error('Required roles not found');

      // Update role from pending to student
      const { error: updateError } = await supabase
        .from('user_roles')
        .update({ role_id: studentRole.id })
        .eq('user_id', userId)
        .eq('role_id', pendingRole.id);

      if (updateError) throw updateError;

      // Update local state
      setPendingUsers(prev => prev.filter(user => user.id !== userId));
    } catch (err) {
      console.error('Error approving user:', err);
      setError('Хэрэглэгчийг зөвшөөрөхөд алдаа гарлаа');
    }
  };

  const handleReject = async (userId: string) => {
    try {
      // Delete user role first
      const { error: roleError } = await supabase
        .from('user_roles')
        .delete()
        .eq('user_id', userId);

      if (roleError) throw roleError;

      // Then delete user through RPC function
      const { error: userError } = await supabase
        .rpc('delete_user', { user_id: userId });

      if (userError) throw userError;

      setPendingUsers(prev => prev.filter(user => user.id !== userId));
    } catch (err) {
      console.error('Error rejecting user:', err);
      setError('Хэрэглэгчийг устгахад алдаа гарлаа');
    }
  };

  if (loading) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center">
        <Loader className="w-8 h-8 animate-spin text-[#2D3648]" />
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-gray-50 py-8">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <h1 className="text-3xl font-bold text-gray-900 mb-8">Админ удирдлага</h1>

        {error && (
          <div className="mb-4 bg-red-50 border-l-4 border-red-400 p-4">
            <div className="flex">
              <div className="ml-3">
                <p className="text-sm text-red-700">{error}</p>
              </div>
            </div>
          </div>
        )}

        <div className="bg-white shadow-sm rounded-lg overflow-hidden">
          <div className="px-4 py-5 border-b border-gray-200 sm:px-6">
            <h2 className="text-lg font-medium text-gray-900">
              Хүлээгдэж буй хэрэглэгчид
            </h2>
          </div>
          
          {pendingUsers.length === 0 ? (
            <div className="p-6 text-center text-gray-500">
              Хүлээгдэж буй хэрэглэгч байхгүй байна
            </div>
          ) : (
            <ul className="divide-y divide-gray-200">
              {pendingUsers.map((user) => (
                <li key={user.id} className="px-4 py-4 sm:px-6">
                  <div className="flex items-center justify-between">
                    <div>
                      <p className="text-sm font-medium text-[#2D3648]">{user.email}</p>
                      <p className="text-sm text-gray-500">
                        Бүртгүүлсэн: {new Date(user.created_at).toLocaleDateString('mn-MN')}
                      </p>
                    </div>
                    <div className="flex space-x-3">
                      <button
                        onClick={() => handleApprove(user.id)}
                        className="inline-flex items-center px-3 py-2 border border-transparent text-sm leading-4 font-medium rounded-md text-white bg-green-600 hover:bg-green-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-green-500"
                      >
                        <UserCheck className="w-4 h-4 mr-2" />
                        Зөвшөөрөх
                      </button>
                      <button
                        onClick={() => handleReject(user.id)}
                        className="inline-flex items-center px-3 py-2 border border-transparent text-sm leading-4 font-medium rounded-md text-white bg-red-600 hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-red-500"
                      >
                        <UserX className="w-4 h-4 mr-2" />
                        Татгалзах
                      </button>
                    </div>
                  </div>
                </li>
              ))}
            </ul>
          )}
        </div>
      </div>
    </div>
  );
}