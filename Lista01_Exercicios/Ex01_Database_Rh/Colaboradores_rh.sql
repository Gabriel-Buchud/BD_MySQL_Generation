
create database db_ecommerce;
use db_ecommerce;

create table tb_produtos(
	id bigint auto_increment,
	nome varchar(255),
	tipo varchar(255),
	preco decimal(8,2),
    estoque int,
    cor varchar(255),
	garantia boolean,
	primary key (id) 
);


insert into tb_produtos (nome, tipo, preco, estoque, cor, garantia) 
values ("Fogão", "eletro", 1000.00, 20, "branco", true), 
("Geladeira", "eletro", 1500.00, 15, "prata", true),
("Celular", "eletro", 450.00, 10, "preto", False),
("Video game", "eletro", 2000.00, 8, "branco", true),
("Armário", "decor", 1200.00, 18, "mogno", true),
("Sofá", "decor", 480.00, 21, "bege", true),
("Mesa de jantar", "decor", 350.00, 20, "marrom", true),
("cama king size", "decor", 1800.00, 04, "azul", false);

select * from tb_produtos where preco > 500.00;
select * from tb_produtos where preco < 500.00;

update tb_produtos set cor = "preto" WHERE Id = 8;
