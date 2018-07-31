BEGIN;
DROP TABLE IF EXISTS todo_app;
END;

BEGIN;
DELETE FROM pg_user WHERE EXISTS (SELECT usename FROM pg_user WHERE usename='michael');
END;

BEGIN;

END;