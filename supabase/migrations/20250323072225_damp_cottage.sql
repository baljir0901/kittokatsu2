/*
  # Add function for deleting users
  
  1. Changes
    - Add RPC function for deleting users
    - Update RLS policies for user management
*/

-- Create function to delete users (since we can't directly access auth.users)
CREATE OR REPLACE FUNCTION delete_user(user_id uuid)
RETURNS void AS $$
BEGIN
  -- Delete user_roles first
  DELETE FROM user_roles WHERE user_id = $1;
  
  -- The actual user deletion in auth.users will be handled by the admin
  -- through Supabase dashboard or management API
  RETURN;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Update RLS policies to allow proper user management
CREATE POLICY "Admins can read all users"
  ON user_roles
  FOR SELECT
  TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM user_roles ur
      JOIN roles r ON ur.role_id = r.id
      WHERE ur.user_id = auth.uid()
      AND r.name = 'admin'
    )
  );

-- Grant necessary permissions
GRANT EXECUTE ON FUNCTION delete_user TO authenticated;