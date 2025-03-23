/*
  # Update RLS policies for user roles and auth tables
  
  1. Changes
    - Add policies to allow users to view their own roles
    - Add policies to allow joining with auth.users table
    - Update existing policies for better security
*/

-- Enable RLS
ALTER TABLE user_roles ENABLE ROW LEVEL SECURITY;

-- Drop existing policies to recreate them
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