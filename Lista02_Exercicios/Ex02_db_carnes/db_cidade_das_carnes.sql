-- Desabilitar checagens temporariamente
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_cidade_das_carnes
-- -----------------------------------------------------

CREATE DATABASE db_cidade_das_carnes;
USE db_cidade_das_carnes;

-- -----------------------------------------------------
-- Table `db_cidade_das_carnes`.`tb_categorias`
-- -----------------------------------------------------
CREATE TABLE tb_categorias (
  id BIGINT NOT NULL AUTO_INCREMENT,
  nome_categoria VARCHAR(100) NOT NULL,
  descricao VARCHAR(255) NULL,
  PRIMARY KEY (id)
) ENGINE = InnoDB;

INSERT INTO tb_categorias (nome_categoria, descricao) VALUES
('Carnes Bovina', 'Produtos derivados de carne de boi'),
('Carnes Suína', 'Produtos derivados de carne de porco'),
('Carnes de Frango', 'Produtos derivados de carne de frango'),
('Carnes de Peixe', 'Produtos derivados de carne de peixe'),
('Carnes Exóticas', 'Produtos derivados de carnes exóticas');

-- -----------------------------------------------------
-- Table `db_cidade_das_carnes`.`tb_produtos`
-- -----------------------------------------------------
CREATE TABLE tb_produtos (
  id BIGINT NOT NULL AUTO_INCREMENT,
  nome_produto VARCHAR(100) NOT NULL,
  descricao VARCHAR(255) NULL,
  preco DECIMAL(10,2) NOT NULL,
  quantidade INT NULL,
  id_categoria BIGINT NOT NULL,
  PRIMARY KEY (id),
  INDEX fk_tb_produtos_tb_categorias_idx (id_categoria ASC) VISIBLE,
  CONSTRAINT fk_tb_produtos_tb_categorias
    FOREIGN KEY (id_categoria)
    REFERENCES tb_categorias (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

INSERT INTO tb_produtos (nome_produto, descricao, preco, quantidade, id_categoria) VALUES
('Picanha', 'Corte nobre de carne bovina', 79.90, 20, 1),
('Costela de Porco', 'Costela de porco', 45.00, 15, 2),
('Peito de Frango', 'Peito de frango desossado', 25.00, 30, 3),
('Salmão', 'Filé de salmão fresco', 120.00, 10, 4),
('Carne de Javali', 'Carne exótica de javali', 200.00, 5, 5),
('Alcatra', 'Corte de carne bovina', 65.00, 25, 1),
('Linguiça de Frango', 'Linguiça artesanal de frango', 20.00, 30, 3),
('Tilápia', 'Filé de tilápia', 30.00, 20, 4);

SELECT * FROM tb_produtos WHERE preco > 50.00;

SELECT * FROM tb_produtos WHERE preco BETWEEN 50.00 AND 150.00;

SELECT * FROM tb_produtos WHERE nome_produto LIKE '%C%';

SELECT p.*, c.nome_categoria, c.descricao AS descricao_categoria
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.id_categoria = c.id;

SELECT p.*, c.nome_categoria, c.descricao AS descricao_categoria
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.id_categoria = c.id
WHERE c.nome_categoria = 'Carnes de Frango';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
