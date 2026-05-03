CREATE DATABASE arco_e_cordas;
USE arco_e_cordas;

CREATE TABLE usuario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    senha VARCHAR(255),
    data_hora_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE quiz (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(100),
    descricao VARCHAR(500)
);

CREATE TABLE perguntas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    pergunta VARCHAR(500),
    fk_quiz INT,
    FOREIGN KEY (fk_quiz) REFERENCES quiz(id)
);

CREATE TABLE alternativas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    alternativa VARCHAR(500),
    correta INT NOT NULL CHECK (correta IN (0,1)),
    fk_pergunta INT,
    FOREIGN KEY (fk_pergunta) REFERENCES perguntas(id)
);

CREATE TABLE tentativa (
    id INT PRIMARY KEY AUTO_INCREMENT,
    fk_usuario INT,
    fk_quiz INT,
    pontuacao INT DEFAULT 0,
    data_hora DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (fk_usuario) REFERENCES usuario(id),
    FOREIGN KEY (fk_quiz) REFERENCES quiz(id)
);

CREATE TABLE respostas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    fk_tentativa INT,
    fk_pergunta INT,
    fk_alternativa INT,
    FOREIGN KEY (fk_tentativa) REFERENCES tentativa(id),
    FOREIGN KEY (fk_pergunta) REFERENCES perguntas(id),
    FOREIGN KEY (fk_alternativa) REFERENCES alternativas(id)
);

select * from usuario;
