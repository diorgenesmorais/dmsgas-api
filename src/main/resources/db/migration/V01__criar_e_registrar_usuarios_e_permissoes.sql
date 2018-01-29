CREATE TABLE usuario (
    id bigint(20) UNSIGNED NOT NULL,
    nome varchar(50) NOT NULL,
    email varchar(65) NOT NULL,
    senha varchar(65) NOT NULL,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE permissao (
    id bigint(20) UNSIGNED NOT NULL,
    descricao varchar(30) NOT NULL,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE usuario_permissao (
    usuario_id bigint(20) UNSIGNED NOT NULL,
    permissao_id bigint(20) UNSIGNED NOT NULL,
    PRIMARY KEY (usuario_id, permissao_id),
    FOREIGN KEY (usuario_id) REFERENCES usuario(id),
    FOREIGN KEY (permissao_id) REFERENCES permissao(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO usuario (id, nome, email, senha) VALUES (1, 'Administrador', 'admin@dmseletronica.com', '$2a$10$X607ZPhQ4EgGNaYKt3n4SONjIv9zc.VMWdEuhCuba7oLAL5IvcL5.');
INSERT INTO usuario (id, nome, email, senha) VALUES (2, 'Maria Isabel', 'mariaisabel@dmseletronica.com', '$2a$10$Zc3w6HyuPOPXamaMhh.PQOXvDnEsadztbfi6/RyZWJDzimE8WQjaq');

INSERT INTO permissao (id, descricao) VALUES (1, 'ROLE_CADASTRAR_PRODUTO');
INSERT INTO permissao (id, descricao) VALUES (2, 'ROLE_RELATORIO_PRODUTO');
INSERT INTO permissao (id, descricao) VALUES (3, 'ROLE_PESQUISAR_PRODUTO');

-- Admin
INSERT INTO usuario_permissao (usuario_id, permissao_id) VALUES (1, 1);
INSERT INTO usuario_permissao (usuario_id, permissao_id) VALUES (1, 2);
INSERT INTO usuario_permissao (usuario_id, permissao_id) VALUES (1, 3);
-- user
INSERT INTO usuario_permissao (usuario_id, permissao_id) VALUES (2, 3);

