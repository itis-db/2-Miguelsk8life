WITH TaskCount AS (SELECT project_id, COUNT(*) AS task_count
                   FROM tasks
                   GROUP BY project_id)

SELECT p.project_name, tc.task_count
FROM projects p
         JOIN TaskCount tc ON p.id = tc.project_id
WHERE tc.task_count > 2;


SELECT u.name AS user_name, p.project_name, t.task_name
FROM users u
         JOIN projects p ON u.id = p.user_id
         JOIN tasks t ON p.id = t.project_id
         JOIN collaborators c ON p.id = c.project_id
         JOIN collaborator_tasks ct ON c.id = ct.collaborator_id AND t.id = ct.task_id;


SELECT name AS name
FROM users
UNION
SELECT project_name AS name
FROM projects;


SELECT name AS name
FROM users
UNION ALL
SELECT project_name AS name
FROM projects;
