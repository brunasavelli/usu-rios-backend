CREATE DATABASE user_posts;

\c user_posts

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    content TEXT NOT NULL,
    user_id INT REFERENCES users(id) ON DELETE SET NULL
);

INSERT INTO users (name, email) VALUES 
    ('Alejandra Barros', 'alejandra@email.com'),
    ('Bruna Savelli', 'bruna@email.com'),
    ('Caio Gabriel', 'caio@email.com'),
    ('Enzo Turcovic', 'enzo@email.com'),
    ('Kevin Lima', 'kevin@email.com');

INSERT INTO posts (content, user_id) VALUES
    ('Hoje eu farei o mínimo e esse será o meu máximo.', 1),
    ('https://cdn.gazetasp.com.br/img/c/825/500/dn_arquivo/2022/05/caozinho.jpg', 2),
    ('Suave na nave.', 3),
    ('Dormir em qlq lugar tem seus benefícios.', 4),
    ('Kevinino', 5);

INSERT INTO users (name, email) VALUES
    ('Fernanda Savelli', 'fernanda@gmail.com'),
    ('Nathália Santos', 'nathalia@gmail.com'),
    ('Sara Souza', 'sara@gmail.com'),
    ('Samuel Braga', 'samuel@gmail.com'),
    ('Luciana Savelli', 'luciana@gmail.com'),
    ('Jorge Savelli', 'jorge@gmail'),
    ('Nathan Ivani', 'nathan@gmail.com'),
    ('Beatriz Ivani', 'beatriz@gmail.com'),
    ('Simone Ivani', 'simone@gmail.com'),
    ('Wagner Ivani', 'wagner@gmail.com'),
    ('Maria Conceição', 'maria@gmail.com'),
    ('Victor Nascimento', 'victor@gmail.com');