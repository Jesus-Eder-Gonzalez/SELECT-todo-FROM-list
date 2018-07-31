DROP DATABASE IF EXISTS todo_app;

BEGIN;
DROP USER IF EXISTS michael;
END;

BEGIN;
CREATE USER michael WITH ENCRYPTED PASSWORD 'stonebreaker';
END;

CREATE DATABASE todo_app;

\c todo_app;

CREATE TABLE tasks (
  id integer PRIMARY KEY NOT NULL,
  title varchar(255) NOT NULL,
  description text,
  created_at timestamp DEFAULT now() NOT NULL,
  updated_at timestamp,
  completed boolean DEFAULT false NOT NULL
);
