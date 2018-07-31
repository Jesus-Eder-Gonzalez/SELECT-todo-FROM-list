DROP DATABASE IF EXISTS todo_app;

BEGIN;
DROP USER IF EXISTS michael;
END;

BEGIN;
CREATE USER michael WITH ENCRYPTED PASSWORD 'stonebreaker';
END;

CREATE DATABASE todo_app;

\c todo_app;

BEGIN;
CREATE TABLE tasks (
  id SERIAL PRIMARY KEY NOT NULL,
  title VARCHAR(255) NOT NULL,
  description TEXT,
  created_at TIMESTAMP DEFAULT now() NOT NULL,
  updated_at TIMESTAMP,
  completed BOOLEAN DEFAULT false NOT NULL
);
END;

BEGIN;
ALTER TABLE tasks 
  DROP COLUMN completed,
  ADD COLUMN completed_at TIMESTAMP DEFAULT NULL,
  ALTER COLUMN updated_at SET NOT NULL,
  ALTER COLUMN updated_at SET DEFAULT now();
END;

BEGIN;
INSERT INTO tasks VALUES (DEFAULT, 'Study SQL', 'Complete this exercise', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO tasks VALUES (DEFAULT, 'Study PostgreSQL', 'Read all the documentation', DEFAULT, DEFAULT, DEFAULT);
END;
