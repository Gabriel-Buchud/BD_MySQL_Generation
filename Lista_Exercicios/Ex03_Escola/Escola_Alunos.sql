
CREATE DATABASE Escola;
USE Escola;

CREATE TABLE Estudantes (
    id BIGINT AUTO_INCREMENT,
    nome VARCHAR(255),
    idade INT,
    turma VARCHAR(10),
    nota FLOAT,
    PRIMARY KEY (id)
);

INSERT INTO Estudantes (nome, idade, turma, nota) VALUES 
('Ana Silva', 15, '9A', 8.5),
('Carlos Souza', 14, '9B', 6.7),
('Mariana Oliveira', 16, '9A', 9.0),
('João Lima', 15, '9B', 5.5),
('Beatriz Almeida', 14, '9C', 7.2),
('Rafael Santos', 16, '9C', 8.0),
('Luiza Pereira', 15, '9A', 6.0),
('Guilherme Ferreira', 14, '9B', 7.8);

SELECT * FROM Estudantes WHERE nota > 7.0;

SELECT * FROM Estudantes WHERE nota < 7.0;
