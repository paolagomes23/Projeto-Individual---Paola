CREATE DATABASE arco_e_cordas;
USE arco_e_cordas;


CREATE TABLE usuario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    senha VARCHAR(20),
    data_hora_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE quiz (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(100),
    descricao VARCHAR(500)
);


CREATE TABLE pergunta (
    id INT PRIMARY KEY AUTO_INCREMENT,
    a_pergunta VARCHAR(500),
    fk_quiz INT,
    FOREIGN KEY (fk_quiz) REFERENCES quiz(id)
);


CREATE TABLE alternativa (
    id INT PRIMARY KEY AUTO_INCREMENT,
    a_alternativa VARCHAR(500),
    correta INT NOT NULL CHECK (correta IN (0,1)),
    fk_pergunta INT,
    FOREIGN KEY (fk_pergunta) REFERENCES pergunta(id)
);


CREATE TABLE tentativa (
    id INT PRIMARY KEY AUTO_INCREMENT,
    fk_usuario INT,
    fk_quiz INT,
    data_hora DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (fk_usuario) REFERENCES usuario(id),
    FOREIGN KEY (fk_quiz) REFERENCES quiz(id)
);


CREATE TABLE resultado (
    id INT PRIMARY KEY AUTO_INCREMENT,
    fk_usuario INT,
    fk_quiz INT,
    fk_tentativa INT,
    pontuacao INT,
    FOREIGN KEY (fk_usuario) REFERENCES usuario(id),
    FOREIGN KEY (fk_quiz) REFERENCES quiz(id),
    FOREIGN KEY (fk_tentativa) REFERENCES tentativa(id)
);


CREATE TABLE guardar_resposta_usuario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    fk_usuario INT,
    fk_quiz INT,
    fk_pergunta INT,
    fk_alternativa INT,
    fk_tentativa INT,
    FOREIGN KEY (fk_usuario) REFERENCES usuario(id),
    FOREIGN KEY (fk_quiz) REFERENCES quiz(id),
    FOREIGN KEY (fk_pergunta) REFERENCES pergunta(id),
    FOREIGN KEY (fk_alternativa) REFERENCES alternativa(id),
    FOREIGN KEY (fk_tentativa) REFERENCES tentativa(id)
);

-- insert 1

insert into usuario (nome, email, senha)
values ('paola', 'paola@email.com', '123456');

insert into quiz (titulo, descricao)
values ('basico de violino', 'teste de teoria musical');

insert into pergunta (a_pergunta, fk_quiz)
values ('Qual é a nota emitida ao tocar a corda Sol solta no violino?', 1);

insert into alternativa (a_alternativa, correta, fk_pergunta) values
('la', 0, 1),
('si', 0, 1),
('sol', 1, 1),
('re', 0, 1);

insert into tentativa (fk_usuario, fk_quiz)
values (1, 1);

insert into guardar_resposta_usuario (fk_pergunta, fk_alternativa, fk_tentativa)
values (1, 3, 1);

insert into resultado (fk_usuario, fk_quiz, fk_tentativa, pontuacao)
values (1, 1, 1, 10);


-- insert 2

insert into guardar_resposta_usuario (fk_pergunta, fk_alternativa, fk_tentativa)
values (1, 2, 2);

insert into resultado (fk_usuario, fk_quiz, fk_tentativa, pontuacao)
values (1, 1, 2, 0);
