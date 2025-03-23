/*
  # Update RLS policies for admin access
  
  1. Changes
    - Add policies for admin to view and manage users
    - Update user_roles policies for better admin control
*/

-- Enable RLS on all tables if not already enabled
ALTER TABLE roles ENABLE ROW LEVEL SECURITY;
ALTER TABLE user_roles ENABLE ROW LEVEL SECURITY;

-- Drop existing policies
DROP POLICY IF EXISTS "Users can view their roles" ON user_roles;
DROP POLICY IF EXISTS "Only admins can modify user roles" ON user_roles;

-- Create new policies
CREATE POLICY "Users can view their roles"
ON user_roles
FOR SELECT
TO authenticated
USING (
  auth.uid() = user_id OR
  EXISTS (
    SELECT 1 FROM auth.users
    WHERE auth.users.id = auth.uid()
    AND auth.users.email = 'admin@example.com'
  )
);

CREATE POLICY "Only admins can modify user roles"
ON user_roles
FOR ALL
TO authenticated
USING (
  EXISTS (
    SELECT 1 FROM auth.users
    WHERE auth.users.id = auth.uid()
    AND auth.users.email = 'admin@example.com'
  )
);

-- Grant necessary permissions
GRANT SELECT ON auth.users TO authenticated;
GRANT SELECT ON auth.users TO anon;

-- Create admin function to manage users
CREATE OR REPLACE FUNCTION approve_user(user_id uuid)
RETURNS void AS $$
DECLARE
  student_role_id uuid;
BEGIN
  -- Get student role ID
  SELECT id INTO student_role_id FROM roles WHERE name = 'student';
  
  -- Update user role from pending to student
  UPDATE user_roles
  SET role_id = student_role_id
  WHERE user_id = $1;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;