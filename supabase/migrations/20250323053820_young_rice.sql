/*
  # Update user roles and permissions
  
  1. Changes
    - Safely create or update roles and user_roles tables
    - Add RLS policies for role-based access
    - Insert default roles if they don't exist
    - Update lessons policy for role-based access
*/

-- Create roles table if it doesn't exist
DO $$ 
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_tables WHERE schemaname = 'public' AND tablename = 'roles') THEN
    CREATE TABLE roles (
      id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
      name text NOT NULL UNIQUE,
      created_at timestamptz DEFAULT now(),
      updated_at timestamptz DEFAULT now()
    );
  END IF;
END $$;

-- Create user_roles table if it doesn't exist
DO $$ 
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_tables WHERE schemaname = 'public' AND tablename = 'user_roles') THEN
    CREATE TABLE user_roles (
      id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
      user_id uuid REFERENCES auth.users(id) ON DELETE CASCADE,
      role_id uuid REFERENCES roles(id) ON DELETE CASCADE,
      created_at timestamptz DEFAULT now(),
      updated_at timestamptz DEFAULT now(),
      UNIQUE(user_id, role_id)
    );
  END IF;
END $$;

-- Enable RLS
ALTER TABLE roles ENABLE ROW LEVEL SECURITY;
ALTER TABLE user_roles ENABLE ROW LEVEL SECURITY;

-- Drop existing policies if they exist
DO $$ 
BEGIN
  DROP POLICY IF EXISTS "Anyone can view roles" ON roles;
  DROP POLICY IF EXISTS "Only admins can modify roles" ON roles;
  DROP POLICY IF EXISTS "Users can view their roles" ON user_roles;
  DROP POLICY IF EXISTS "Only admins can modify user roles" ON user_roles;
  DROP POLICY IF EXISTS "Students and admins can view lessons" ON lessons;
EXCEPTION
  WHEN undefined_object THEN NULL;
END $$;

-- Create policies
CREATE POLICY "Anyone can view roles"
  ON roles
  FOR SELECT
  TO public
  USING (true);

CREATE POLICY "Only admins can modify roles"
  ON roles
  FOR ALL
  TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM auth.users
      WHERE auth.users.id = auth.uid()
      AND auth.users.email = 'admin@example.com'
    )
  );

CREATE POLICY "Users can view their roles"
  ON user_roles
  FOR SELECT
  TO authenticated
  USING (user_id = auth.uid());

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

-- Insert default roles if they don't exist
INSERT INTO roles (name)
SELECT unnest(ARRAY['admin', 'student', 'pending'])
WHERE NOT EXISTS (
  SELECT 1 FROM roles WHERE name IN ('admin', 'student', 'pending')
);

-- Create policy for lessons table
CREATE POLICY "Students and admins can view lessons"
  ON lessons
  FOR SELECT
  TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM user_roles
      WHERE user_roles.user_id = auth.uid()
      AND user_roles.role_id IN (
        SELECT id FROM roles WHERE name IN ('admin', 'student')
      )
    )
  );