INSERT INTO users (name, email, password)
SELECT 
    'user_' || seq, 
    'user_' || seq || '@example.com', 
    md5(random()::text)
FROM generate_series(1, 100) AS seq;

INSERT INTO projects (project_name, description, subject, user_id)
SELECT 
    'project_' || seq, 
    'Description for project ' || seq, 
    'Subject ' || (random() * 10)::int, 
    (random() * 99 + 1)::int
FROM generate_series(1, 50) AS seq;

INSERT INTO tasks (task_name, description, project_id)
SELECT 
    'task_' || seq, 
    'Description for task ' || seq, 
    (random() * 49 + 1)::int
FROM generate_series(1, 200) AS seq;

INSERT INTO collaborator_tasks (collaborator_id, task_id)
SELECT 
    (random() * 149 + 1)::int, 
    (random() * 199 + 1)::int
FROM generate_series(1, 300) AS seq
ON CONFLICT DO NOTHING;

INSERT INTO collaborators (user_id, project_id)
SELECT 
    (random() * 99 + 1)::int, 
    (random() * 49 + 1)::int
FROM generate_series(1, 150) AS seq
ON CONFLICT DO NOTHING;

INSERT INTO messages (content, sender_id, recipient_id)
SELECT 
    'Message content ' || seq, 
    (random() * 99 + 1)::int, 
    (random() * 99 + 1)::int
FROM generate_series(1, 100) AS seq
WHERE sender_id <> recipient_id;

