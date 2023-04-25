USE guiatur;
SHOW TABLES FROM guiatur;
DESCRIBE pais;

INSERT INTO pais (nome, continente, codigo)
VALUES 
('Brasil','América','BRA');

INSERT INTO pais 
VALUES 
('0','Índia','Ásia','IDN'), #inserção errado de IDN de propósito para ser corrigida depois no UPDATE
('0','China','Ásia','CHI'),
('0','Japão','Ásia','JPN');

SELECT * FROM pais;
SELECT * FROM pais;

DESCRIBE estado;

INSERT INTO estado (nome, sigla)
VALUES('Maranhão', 'MA'),
('São Paulo', 'SP'),
('Santa Catarina', 'SC'),
('Rio de Janeiro', 'RJ');

SELECT * FROM estado;

INSERT INTO cidade (nome, populacao)
values('Sorocaba', 700000),
('Déli', 26000000),
('Xangai', 22000000),
('Tóquio', 38000000);

SELECT * FROM cidade;

INSERT INTO ponto_tur (nome, tipo)
VALUES('Quinzinho de Barros', 'Instituição ou Organização'),
('Parque Estadual do Jalapão', 'Atrativo'),
('Torre Eiffel', 'Atrativo'),
('Fogo de Chão', 'Serviço');
DESCRIBE ponto_tur;
SELECT * FROM ponto_tur;


-- alterar para atrativo o primeiro ponto turístico
UPDATE ponto_tur SET tipo = 'Atrativo'
WHERE id = 1;

SELECT * FROM ponto_tur;

-- alterar o segundo país (Índia) para ter o cód. 'IND'
UPDATE pais SET codigo = 'IND' WHERE id = 2;
SELECT * FROM pais;

-- deletar a primeira cidade
SELECT * FROM cidade;
DELETE FROM cidade WHERE id = 1;


/* determinados países terem mais de
um idioma, embora um seja determinado como o idioma oficial.
Nessa relação, temos a cardinalidade de 1 para N */

CREATE TABLE IF NOT EXISTS linguagemPais (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	codigoPais INT,
	linguagem VARCHAR(30) NOT NULL DEFAULT '',
	oficial ENUM('Sim', 'Não') NOT NULL DEFAULT'Não'
);
DESCRIBE pais;

/*Criar integridade referencial antre as tebelas linguagemPais e país*/
ALTER TABLE linguagemPais ADD CONSTRAINT FK_linguagempais
FOREIGN KEY (codigoPais) REFERENCES pais(id);

DESCRIBE linguagempais;

/*Modificar o código do país para ser obrigatória a inclusão*/
ALTER TABLE linguagempais MODIFY codigoPais INT NOT NULL;

SHOW TABLES FROM guiatur;
DESCRIBE pais;
SELECT * FROM pais;



