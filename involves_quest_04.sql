/*Considerando a tabela de origem da questão 2 e uma segunda tabela
VISITAS_PONTO_VENDA, crie uma query que calcule a quantidade de visitas
do ponto de venda de nome INVOLVES, sabendo-se que a tabela de visitas
possui um campo que identifica se o ponto de venda foi visitado ou não
chamado FL_VISITADO (Se 1 = Ponto de venda visitado / Se 0 = Ponto de
venda não visitado). O campo chave que liga as duas tabelas é ID_PDV (na
tabela PONTO_VENDA_UNIDADE) e FK_PDV(na tabela
VISITAS_PONTO_VENDA). A query deve mostrar apenas as informações de
nome do ponto de venda e quantidade de visitas realizadas.*/

SELECT 
	NOME_PDV,
	COUNT(DISTINCT FL_VISITADO)
FROM PONTO_VENDA_UNIDADE
INNER JOIN VISITAS_PONTO_VENDA
	ON PONTO_VENDA_UNIDADE.ID_PDV = VISITAS_PONTO_VENDA.FK_PDV
WHERE NOME_PDV = "INVOLVES" AND FL_VISITADO = 1
ORDER BY NOME_PDV

/*Utilizado um contador distinto de vezes em que o campo FL_VISITADO recebe o valor 1*/