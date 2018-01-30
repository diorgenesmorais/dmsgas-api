CREATE TABLE categoria (
	id bigint(20) UNSIGNED not null auto_increment,
	nome varchar(20) not null,
	PRIMARY KEY (id)
) engine=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO categoria VALUES (0, "Liquigás");
INSERT INTO categoria VALUES (0, "Comércio");
INSERT INTO categoria VALUES (0, "Instalação");

CREATE TABLE produto (
	id bigint(20) UNSIGNED PRIMARY KEY auto_increment,
	nome varchar(30) not null,
	categoria_id bigint(20) UNSIGNED not null,
	descricao varchar(150),
	preco decimal(10,2) not null,
	custo decimal(10,2) not null default '0.01',
	FOREIGN KEY (categoria_id) REFERENCES categoria(id)
) engine=InnoDB DEFAULT CHARSET=utf8;
