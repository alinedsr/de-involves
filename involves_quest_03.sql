/*Considerando a tabela de origem da questão anterior, crie uma query que
some o valor de sell in de acordo com cada ponto de venda e agrupe os
resultados por mês (campo MES) e ano (campo ANO). Ordene os registros por
um período cronológico de forma crescente e por nome do ponto de venda.*/

SELECT 
	NOME_PDV, 
	SUM(SELLIN) AS SOMA_SELLIN, 
    MES, 
    ANO
FROM PONTO_VENDA_UNIDADE
GROUP BY NOME_PDV, MES, ANO
ORDER BY MES, ANO, NOME_PDV