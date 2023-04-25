USE litoral;
SELECT * FROM destino;

/* Configurar o ambiente para que as alterações não sejam gravadas automaticamente 
Controle transacional MANUAL (SET AUTOCOMMIT = 0;) 
Controle transacional AUTOMÁTICO (SET AUTOCOMMIT = 1;) */
SET AUTOCOMMIT = 0;

/* Para criar um ponto de restauração no banco*/
SAVEPOINT ponto1;


/* Para fins de teste, o script a seguir visará gerar o mesmo
erro cometido pelo colaborador:*/
/* atencao que, em versoes atuais do mysql, este UPDATE sem WHERE só irá funcionar
se você desabilitar a opção de safedelete/update nas configurações do workbench */
UPDATE destino SET Nome = "Pequena Ilha do Mar"; 

SELECT * FROM destino; -- consulta exibe a tabela após o "erro" cometido no UPDATE


/* Utilizar o ponto de restauração criado e testá-lo */
ROLLBACK TO SAVEPOINT ponto1;

SELECT * FROM destino; -- consulta exibe a tabela como estava antes do "erro" cometido no UPDATE


/* Agora alterando corretamente, somente o registro 5.
E para GRAVAR as alterações feitas, deve ser utilizado o comando COMMIT após o Update (já que o AUTOCOMMIT = 0)*/
UPDATE destino SET Nome = "Pequena Ilha do Mar"
WHERE id = 5;

COMMIT;

SELECT * FROM destino;

/* Crie um novo ponto de restauração, pois o COMMIT apaga os pontos de restauração anteriores */

SAVEPOINT ponto2;

