BEGIN;  


ALTER TABLE users
DROP CONSTRAINT users_pkey,
ADD PRIMARY KEY (email);

ALTER TABLE projects
DROP CONSTRAINT projects_pkey,
ADD PRIMARY KEY (project_name);

ALTER TABLE tasks
DROP CONSTRAINT tasks_pkey,
ADD PRIMARY KEY (task_name, project_id);

ALTER TABLE collaborators
DROP CONSTRAINT collaborators_pkey,
ADD PRIMARY KEY (user_id, project_id);

ALTER TABLE collaborator_tasks
DROP CONSTRAINT collaborator_tasks_pkey,
ADD PRIMARY KEY (collaborator_id, task_id);

ALTER TABLE messages
DROP CONSTRAINT messages_pkey,
ADD PRIMARY KEY (sender_id, recipient_id, message_date);


ALTER TABLE projects
DROP CONSTRAINT projects_user_id_fkey,
ADD FOREIGN KEY (user_id) REFERENCES users(email);

ALTER TABLE tasks
DROP CONSTRAINT tasks_project_id_fkey,
ADD FOREIGN KEY (project_id) REFERENCES projects(project_name);

ALTER TABLE collaborators
DROP CONSTRAINT collaborators_user_id_fkey,
DROP CONSTRAINT collaborators_project_id_fkey,
ADD FOREIGN KEY (user_id) REFERENCES users(email),
ADD FOREIGN KEY (project_id) REFERENCES projects(project_name);

ALTER TABLE collaborator_tasks
DROP CONSTRAINT collaborator_tasks_collaborator_id_fkey,
DROP CONSTRAINT collaborator_tasks_task_id_fkey,
ADD FOREIGN KEY (collaborator_id) REFERENCES collaborators(user_id, project_id),
ADD FOREIGN KEY (task_id) REFERENCES tasks(task_name, project_id);

ALTER TABLE messages
DROP CONSTRAINT messages_sender_id_fkey,
DROP CONSTRAINT messages_recipient_id_fkey,
ADD FOREIGN KEY (sender_id) REFERENCES users(email),
ADD FOREIGN KEY (recipient_id) REFERENCES users(email);


COMMIT;
