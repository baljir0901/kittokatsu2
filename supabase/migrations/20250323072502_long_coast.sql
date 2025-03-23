/*
  # Fix user roles relationship and add helper functions
  
  1. Changes
    - Add RPC function to get users by IDs
    - Update RLS policies
    - Fix user roles relationship
*/

-- Create function to get users by IDs
CREATE OR REPLACE FUNCTION get_users_by_ids(user_ids uuid[])
RETURNS TABLE (
  id uuid,
  email text,
  created_at timestamptz
) SECURITY DEFINER
AS $$
BEGIN
  RETURN QUERY
  SELECT 
    u.id,
    u.email::text,
    u.created_at::timestamptz
  FROM auth.users u
  WHERE u.id = ANY(user_ids);
END;
$$ LANGUAGE plpgsql;

-- Grant execute permission on the function
GRANT EXECUTE ON FUNCTION get_users_by_ids TO authenticated;

-- Update user_roles policies
DROP POLICY IF EXISTS "View own role" ON user_roles;
DROP POLICY IF EXISTS "Admin view all roles" ON user_roles;
DROP POLICY IF EXISTS "Admin manage roles" ON user_roles;

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
  EXISTS (
    SELECT 1 FROM auth.users
    WHERE auth.users.id = auth.uid()
    AND auth.users.email = 'admin@example.com'
  )
);

CREATE POLICY "Admin manage roles"
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