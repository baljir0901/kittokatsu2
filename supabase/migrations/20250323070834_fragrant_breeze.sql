/*
  # Add trigger for automatic pending role assignment
  
  1. Changes
    - Create function to assign pending role to new users
    - Create trigger to automatically run this function
    - Ensure proper role assignment on registration
*/

-- Create function to assign pending role
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER AS $$
DECLARE
  pending_role_id uuid;
BEGIN
  -- Get the pending role ID
  SELECT id INTO pending_role_id
  FROM public.roles
  WHERE name = 'pending'
  LIMIT 1;

  -- If pending role exists, assign it to the new user
  IF pending_role_id IS NOT NULL THEN
    INSERT INTO public.user_roles (user_id, role_id)
    VALUES (NEW.id, pending_role_id);
  END IF;

  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Drop trigger if it exists
DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;

-- Create trigger
CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();

-- Ensure existing users have roles
DO $$
DECLARE
  pending_role_id uuid;
BEGIN
  -- Get pending role ID
  SELECT id INTO pending_role_id FROM public.roles WHERE name = 'pending';

  -- Add pending role to users who don't have any role
  IF pending_role_id IS NOT NULL THEN
    INSERT INTO public.user_roles (user_id, role_id)
    SELECT users.id, pending_role_id
    FROM auth.users
    LEFT JOIN public.user_roles ON users.id = user_roles.user_id
    WHERE user_roles.id IS NULL;
  END IF;
END $$;