SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE DATABASE db_pizzaria_legal;
USE db_pizzaria_legal;

CREATE TABLE tb_categorias (
  id_categoria BIGINT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  descricao VARCHAR(255) NULL,
  PRIMARY KEY (id_categoria))
ENGINE = InnoDB;

INSERT INTO tb_categorias (nome, descricao) VALUES
('Tradicional', 'Pizzas com sabores tradicionais'),
('Especial', 'Pizzas com ingredientes especiais'),
('Vegetariana', 'Pizzas sem carne'),
('Doce', 'Pizzas doces'),
('Vegana', 'Pizzas sem ingredientes de origem animal');

CREATE TABLE tb_pizzas (
  id_pizza BIGINT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  descricao VARCHAR(255) NULL,
  preco DECIMAL(10,2) NOT NULL,
  tamanho VARCHAR(255) NULL,
  id_categoria BIGINT NOT NULL,
  PRIMARY KEY (id_pizza),
  INDEX fk_tb_pizzas_tb_categoria_idx (id_categoria ASC) VISIBLE,
  CONSTRAINT fk_tb_pizzas_tb_categoria
    FOREIGN KEY (id_categoria)
    REFERENCES tb_categorias (id_categoria)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO tb_pizzas (nome, descricao, preco, tamanho, id_categoria) VALUES
('Margherita', 'Molho de tomate, mussarela e manjericão', 35.00, 'Média', 1),
('Pepperoni', 'Molho de tomate, mussarela e pepperoni', 42.00, 'Grande', 1),
('Quatro Queijos', 'Molho de tomate, mussarela, parmesão, provolone e gorgonzola', 50.00, 'Grande', 2),
('Portuguesa', 'Molho de tomate, mussarela, presunto, ovos e cebola', 47.00, 'Média', 1),
('Calabresa', 'Molho de tomate, mussarela e calabresa', 45.00, 'Média', 1),
('Chocolate', 'Chocolate ao leite e granulado', 38.00, 'Pequena', 4),
('Romeu e Julieta', 'Queijo e goiabada', 55.00, 'Pequena', 4),
('Vegetariana', 'Molho de tomate, mussarela, pimentão, cebola, azeitonas e champignon', 48.00, 'Grande', 3);

SELECT * FROM tb_pizzas WHERE preco > 45.00;

SELECT * FROM tb_pizzas WHERE preco BETWEEN 50.00 AND 100.00;

SELECT * FROM tb_pizzas WHERE nome LIKE '%M%';

SELECT p.*, c.nome AS categoria_nome, c.descricao AS categoria_descricao
FROM tb_pizzas p
INNER JOIN tb_categorias c ON p.id_categoria = c.id_categoria;

SELECT p.*, c.nome AS categoria_nome, c.descricao AS categoria_descricao
FROM tb_pizzas p
INNER JOIN tb_categorias c ON p.id_categoria = c.id_categoria
WHERE c.nome = 'Doce';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
