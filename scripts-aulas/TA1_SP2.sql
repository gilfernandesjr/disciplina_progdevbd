# criacão do BD atualizada com os novos nomes do charset UTF8
# Isso pois os anteriores 'utf8' e 'utf8_general_ci' foram depreciados nas novas versoes do MySQL
CREATE DATABASE IF NOT EXISTS guiatur
	DEFAULT CHARSET = utf8mb4
    DEFAULT COLLATE = utf8mb4_0900_ai_ci;
    
SHOW CREATE DATABASE guiatur;

USE guiatur;

CREATE TABLE IF NOT EXISTS pais (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(50) NOT NULL DEFAULT '',
	continente ENUM('Ásia', 'Europa', 'América', 'África',
	'Oceania', 'Antártida') NOT NULL DEFAULT 'América',
	codigo CHAR(3) NOT NULL DEFAULT ''
);

CREATE TABLE IF NOT EXISTS estado (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(50) NOT NULL DEFAULT '',
	sigla CHAR(2) NOT NULL DEFAULT ''
);

CREATE TABLE IF NOT EXISTS cidade (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(50) NOT NULL DEFAULT '',
	populacao INT NOT NULL DEFAULT '0'
);

CREATE TABLE IF NOT EXISTS ponto_tur (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(50) NOT NULL DEFAULT '',
	populacao INT NOT NULL DEFAULT '0',
	tipo ENUM('Atrativo', 'Serviço', 'Equipamento',
	'Infraestrutura', 'Instituição ou Organização'),
	publicado ENUM('Não', 'Sim') NOT NULL DEFAULT 'Não'
);

CREATE TABLE coordenada (
	latitude FLOAT,
    longitude FLOAT
);


