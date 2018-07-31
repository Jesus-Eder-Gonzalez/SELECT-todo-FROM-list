DROP DATABASE IF EXISTS todo_app;

DROP USER IF EXISTS michael;

CREATE USER michael WITH ENCRYPTED PASSWORD 'stonebreaker';

CREATE DATABASE todo_app;

\c todo_app;

CREATE TABLE tasks (
  id SERIAL PRIMARY KEY NOT NULL,
  title VARCHAR(255) NOT NULL,
  description TEXT,
  created_at TIMESTAMP DEFAULT now() NOT NULL,
  updated_at TIMESTAMP,
  completed BOOLEAN DEFAULT false NOT NULL
);

ALTER TABLE tasks 
  DROP COLUMN completed,
  ADD COLUMN completed_at TIMESTAMP DEFAULT NULL,
  ALTER COLUMN updated_at SET NOT NULL,
  ALTER COLUMN updated_at SET DEFAULT now();

INSERT INTO tasks VALUES (DEFAULT, 'Study SQL', 'Complete this exercise', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO tasks VALUES (DEFAULT, 'Study PostgreSQL', 'Read all the documentation', DEFAULT, DEFAULT, DEFAULT);

SELECT title FROM tasks WHERE completed_at IS NULL;

UPDATE tasks SET completed_at = now() WHERE title='Study SQL';

