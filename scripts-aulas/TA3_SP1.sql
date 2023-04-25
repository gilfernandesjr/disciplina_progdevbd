create database SuperGames;
use SuperGames;

CREATE TABLE localizacao (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Secao VARCHAR(50) NOT NULL,
    Prateleira INT ZEROFILL NOT NULL
);

CREATE TABLE jogo (
    Cod INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(50) NOT NULL,
    Valor DECIMAL(6,2) NOT NULL,
    Localizacao_Id INT NOT NULL,
    FOREIGN KEY (Localizacao_Id)
        REFERENCES Localizacao (Id)
);

INSERT localizacao VALUES 
(0, "Guerra", "001"),
(0, "Guerra", "002"),
(0, "Aventura", "100"),
(0, "Aventura", "101"),
(0, "RPG", "150"),
(0, "RPG", "151"),
(0, "Plataforma 2D", "200"),
(0, "Plataforma 2D", "201");


INSERT jogo VALUES 
(0, "COD 3", 125.00, 1),
(0, "BF 1", 150.00, 2),
(0, "Zelda BotW", 200.00, 3),
(0, "Zelda OoT", 99.00, 4),
(0, "Chrono T", 205.00, 5);


SELECT * FROM localizacao;
SELECT * FROM jogo;



-- Identificar o nome do jogo e a prateleira
SELECT jogo.nome, localizacao.prateleira
FROM jogo INNER JOIN localizacao
ON localizacao.id = jogo.localizacao_id;

-- Identificar o nome dos jogos da seção de jogos de Aventura.
SELECT jogo.nome, localizacao.prateleira, localizacao.secao
FROM jogo INNER JOIN localizacao
ON localizacao.id = jogo.localizacao_id
WHERE secao = 'Aventura';


-- Identificar TODAS as seções e os respectivos nomes dos
-- jogos, ordenando as seleções em ordem crescente pelo nome dos jogos.
SELECT jogo.nome, localizacao.prateleira, localizacao.secao
FROM localizacao LEFT JOIN jogo
ON localizacao.id = jogo.localizacao_id
ORDER BY jogo.nome ASC;





-- AGREGAÇÃO ---------------------------------------------------

-- Desenvolver uma função de agregação que retorne a quantidade
-- de registros na tabela jogo.
SELECT COUNT(*) FROM jogo;


-- Desenvolver uma função de agregação que retorne o
-- valor do jogo de maior preço (valor).
SELECT MAX(valor) AS "Maior valor" FROM jogo;


-- Desenvolver uma função de agregação que retorne o valor
-- do jogo de menor preço (valor). 
SELECT MIN(valor) AS "Menor valor" FROM jogo;


-- Desenvolver uma função de agregação que retorne o valor
-- e o nome do jogo de menor preço. 
-- Aqui, adiantamos as subconsultas que serão estudadas na aula seguinte
SELECT jogo.nome, valor 
FROM jogo
WHERE jogo.valor = (SELECT MIN(valor) FROM jogo);


-- Desenvolver uma função de agregação que retorne o valor
-- médio dos jogos de guerra
SELECT AVG(valor) AS "Media guerra" 
FROM jogo INNER JOIN localizacao
ON localizacao.id = jogo.localizacao_id
WHERE localizacao.secao = "Guerra";


-- Desenvolver uma função de agregação que retorne o
-- valor total em estoque na loja.
SELECT SUM(valor) AS "Total" FROM jogo;

