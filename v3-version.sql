ALTER TABLE projects
    ALTER COLUMN subject TYPE TEXT;

ALTER TABLE tasks
    ADD COLUMN status VARCHAR(50) DEFAULT 'pending';

ALTER TABLE tasks
    ADD CONSTRAINT status_check CHECK (status IN ('pending', 'in_progress', 'completed'));

ALTER TABLE tasks
    DROP CONSTRAINT status_check;

ALTER TABLE tasks
    DROP COLUMN status;

ALTER TABLE projects
    ALTER COLUMN subject TYPE VARCHAR(50);
