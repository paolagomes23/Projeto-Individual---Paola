CREATE DATABASE arco_e_cordas;
DROP DATABASE arco_e_cordas;
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

CREATE TABLE tentativa (
    id INT PRIMARY KEY AUTO_INCREMENT,
    fk_usuario INT,
    fk_quiz INT,
    pontuacao INT DEFAULT 0,
    data_hora DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (fk_usuario) REFERENCES usuario(id),
    FOREIGN KEY (fk_quiz) REFERENCES quiz(id)
);


INSERT INTO quiz (titulo, descricao) VALUES
('Teoria Musical', 'Quiz sobre teoria musical'),
('Prática Musical', 'Quiz sobre prática do violino'),
('História do Violino', 'Quiz sobre a história do violino'),
('Partes do Violino', 'Quiz sobre as partes do violino');

SELECT * FROM usuario;
SELECT * FROM quiz;
SELECT * FROM tentativa;