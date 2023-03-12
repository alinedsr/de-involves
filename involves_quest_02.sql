/*2) Crie uma query, considerando o SGBD MySQL, para exibir todos os dados de
uma tabela de Pontos de Venda (tabela origem PONTO_VENDA_UNIDADE) e
restringir apenas os pontos de venda que possuem sell in maior que 20.000
(campo SELLIN) e ainda ordená-los por nome do ponto de venda (campo
NOME_PDV)*/

SELECT 
	*
FROM PONTO_VENDA_UNIDADE
WHERE SELLIN > 20000
ORDER BY NOME_PDV

/*Utilizado o comando * para seleção de todos os campos,
embora não seja indicado por consumir mais recursos do
que o necessário para a execução da query. O ideal seria
restringir apenas os campos necessários.*/