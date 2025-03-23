/*
  # Fix RLS policies to avoid infinite recursion
  
  1. Changes
    - Drop existing problematic policies
    - Create new policies without self-referencing
    - Add admin check function for cleaner policies
*/

-- Create admin check function
CREATE OR REPLACE FUNCTION is_admin(user_id uuid)
RETURNS boolean AS $$
BEGIN
  RETURN EXISTS (
    SELECT 1 FROM auth.users
    WHERE id = user_id
    AND email = 'admin@example.com'
  );
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Drop existing policies
DROP POLICY IF EXISTS "Users can view their roles" ON user_roles;
DROP POLICY IF EXISTS "Only admins can modify user roles" ON user_roles;
DROP POLICY IF EXISTS "Admins can read all users" ON user_roles;

-- Create new policies without recursion
CREATE POLICY "View own role"
ON user_roles
FOR SELECT
TO authenticated
USING (
  user_id = auth.uid()
);

CREATE POLICY "Admin view all roles"
ON user_roles
FOR SELECT
TO authenticated
USING (
  is_admin(auth.uid())
);

CREATE POLICY "Admin manage roles"
ON user_roles
FOR ALL
TO authenticated
USING (
  is_admin(auth.uid())
);

-- Grant necessary permissions
GRANT EXECUTE ON FUNCTION is_admin TO authenticated;
GRANT EXECUTE ON FUNCTION is_admin TO anon;