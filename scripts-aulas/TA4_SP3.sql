USE litoral;

CREATE TABLE vendas (
	Numero int PRIMARY KEY AUTO_INCREMENT,
    DestinoId INT,
    Embarque DATE,
    Qtd INT,
    FOREIGN KEY (DestinoId) REFERENCES destino(id)
);

SELECT * FROM destino;

INSERT INTO vendas VALUES
(0,1,20180203,3),
(0,7,20180203,2),
(0,5,20180203,1);

ALTER TABLE destino ADD COLUMN Valor DECIMAL(5,2);

SELECT * FROM  destino;

UPDATE destino SET valor = 100 WHERE id=1;
UPDATE destino SET valor = 120 WHERE id=2;
UPDATE destino SET valor = 80 WHERE id=3;
UPDATE destino SET valor = 90 WHERE id=4;
UPDATE destino SET valor = 100 WHERE id=5;
UPDATE destino SET valor = 150 WHERE id=6;
UPDATE destino SET valor = 120 WHERE id=7;
UPDATE destino SET valor = 180 WHERE id=8;
SELECT * FROM destino;

-- Criar função
CREATE FUNCTION fn_desc(x DECIMAL, y INT)
RETURNS DECIMAL DETERMINISTIC
RETURN (x*y)*0.7;

SHOW FUNCTION STATUS WHERE db = 'litoral';

SELECT * FROM vendas;

CREATE PROCEDURE proc_desc (VAR_VendaNumero INT)
	SELECT 
		(fn_desc(destino.valor, Vendas.Qtd)) AS "Valor com desconto", 
        destino.Nome AS "Destino",
		vendas.Qtd AS "Passagens", 
		vendas.Embarque
	FROM Vendas INNER JOIN destino
	ON Vendas.DestinoId = destino.Id
	WHERE vendas.Numero = var_VendaNumero;

CALL proc_desc(1);
CALL proc_desc(2);
CALL proc_desc(3);

SHOW FUNCTION STATUS WHERE db = 'litoral';

SHOW PROCEDURE STATUS WHERE db = 'litoral';

DROP FUNCTION fn_desc;

DROP PROCEDURE proc_desc;

















