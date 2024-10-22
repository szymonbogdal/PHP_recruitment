CREATE TABLE IF NOT EXISTS users (
  id SERIAL PRIMARY KEY,
  account_type VARCHAR(50) CHECK (account_type IN ('individual', 'company')) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL CHECK (email ~ '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'),
  name VARCHAR(255) NOT NULL,

  birth_date DATE,
  nip CHAR(10),

  --validate if required data for account type is provided
  CONSTRAINT valid_account_data CHECK (
    (account_type = 'individual' AND birth_date IS NOT NULL AND nip IS NULL)
    OR
    (account_type = 'company' AND birth_date IS NULL AND nip IS NOT NULL)
  ),

  --validate birth date
  CONSTRAINT birth_date_check CHECK (
    birth_date IS NULL OR
    (birth_date <= CURRENT_DATE AND birth_date >= CURRENT_DATE - INTERVAL '120 years')
  )
);

--function to validate nip
CREATE OR REPLACE FUNCTION validate_nip(nip TEXT) 
RETURNS BOOLEAN AS $$
DECLARE
  weights INTEGER[] := ARRAY[6,5,7,2,3,4,5,6,7];
  sum INTEGER := 0;
  i INTEGER;
BEGIN
  --check nip length
  IF length(nip) != 10 THEN
    RETURN FALSE;
  END IF;
  
  --check if there is only numbers
  IF nip !~ '^\d{10}$' THEN
    RETURN FALSE;
  END IF;
  
  --checksum
  FOR i IN 1..9 LOOP
    sum := sum + (substr(nip, i, 1)::INTEGER * weights[i]);
  END LOOP;
  
  RETURN (sum % 11) = substr(nip, 10, 1)::INTEGER;
END;

--valdiate nip function trigger
CREATE OR REPLACE FUNCTION validate_nip_trigger()
RETURNS TRIGGER AS $$
BEGIN
  IF NEW.nip IS NOT NULL AND NOT validate_nip(NEW.nip) THEN
    RAISE EXCEPTION 'Invalid NIP number';
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_nip
BEFORE INSERT OR UPDATE ON users
FOR EACH ROW
EXECUTE FUNCTION validate_nip_trigger();