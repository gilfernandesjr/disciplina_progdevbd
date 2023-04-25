USE supergames;

SELECT * FROM localizacao;

INSERT jogo VALUES
(0, "Super Metroid", 205.00, 7),
(0, "DKC 2", 100.00, 8),
(0, "FF XV", 120.00, 5),
(0, "Xenoblade 2", 199.00, 6);

SELECT * FROM jogo;

/* Alterar valor dos jogos em promoção */

UPDATE jogo SET valor = valor * 0.5
WHERE cod = 2;

UPDATE jogo SET valor = valor * 0.5
WHERE cod = 1;

SELECT * FROM jogo;

/* Criar uma tabela 'Promoção'*/

CREATE TABLE promocao (
    Promo INT PRIMARY KEY AUTO_INCREMENT,
    Cod_Jogo INT NOT NULL,
    FOREIGN KEY (Cod_Jogo)
        REFERENCES Jogo (Cod)
);

/* inserção dos jogos em promoção */
INSERT promocao VALUES (0,1),(0,2);


SELECT * FROM promocao;

/* Selecionar os jogos em promoção */
SELECT jogo.nome, jogo.valor
FROM jogo
WHERE jogo.cod IN (SELECT cod_jogo FROM promocao);

    
    
/* ...ou utilizando JOIN.... */    
    
SELECT 
    jogo.nome AS 'Título',
    jogo.valor AS 'Preço'
FROM
    jogo INNER JOIN promocao ON jogo.cod = promocao.cod_jogo;



/* Selecionar os jogos que NÃO estão em promoção */
SELECT jogo.nome, jogo.valor
FROM jogo
WHERE jogo.cod NOT IN (SELECT cod_jogo FROM promocao);
            
/* selecionar o jogo mais barato utilizando subconsultas e funções de agregação*/
SELECT nome AS 'mais barato!' 
FROM jogo WHERE valor = SOME (SELECT MIN(valor) FROM jogo);
























            