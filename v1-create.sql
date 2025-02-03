CREATE TABLE users (
                       id SERIAL PRIMARY KEY,
                       name VARCHAR(100) UNIQUE NOT NULL,
                       email VARCHAR(100) UNIQUE NOT NULL,
                       password VARCHAR(255) NOT NULL,
                       registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE projects (
                          id SERIAL PRIMARY KEY,
                          project_name VARCHAR(100) UNIQUE NOT NULL,
                          description TEXT,
                          subject VARCHAR(50),
                          user_id INT REFERENCES Users(id) ON DELETE CASCADE
);


CREATE TABLE tasks (
                       id SERIAL PRIMARY KEY,
                       task_name VARCHAR(100) NOT NULL,
                       description TEXT,
                       project_id INT REFERENCES Projects(id) ON DELETE CASCADE
);


CREATE TABLE collaborators (
                               id SERIAL PRIMARY KEY,
                               user_id INT REFERENCES users(id) ON DELETE CASCADE,
                               project_id INT REFERENCES projects(id) ON DELETE CASCADE,
                               UNIQUE(user_id, project_id)
);


CREATE TABLE collaborator_tasks
(
    id              SERIAL PRIMARY KEY,
    collaborator_id INT REFERENCES collaborators (id) ON DELETE CASCADE,
    task_id         INT REFERENCES tasks (id) ON DELETE CASCADE,
    UNIQUE (collaborator_id, task_id)
);


CREATE TABLE messages
(
    id SERIAL PRIMARY KEY ,
    content TEXT,
    message_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    sender_id INT REFERENCES users(id) ON DELETE CASCADE,
    recipient_id INT REFERENCES users(id) ON DELETE CASCADE
);
