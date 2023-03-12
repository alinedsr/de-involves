/*Considerando a query abaixo, a pessoa engenheira de dados identificou que a
performance da query está muito abaixo do esperado. Imaginando que um dos
problemas possa estar relacionado aos índices das tabelas do banco de
dados, a pessoa resolveu criar os índices nas tabelas. Liste quais possíveis
campos devem ser indexados nas tabelas do banco de dados para que a query
criada possa performar melhor. Leve em consideração que nenhum campo no
banco de dados está indexado.*/

select
	FT.CICLO,
	FT.ID_DIM_PDV,
	FT.ID_BLOCO_ITEM,
	SUM(FT.QTD_PONTO_EXTRA),
	SUM(FTPI.TOTAL_NOTA_ITEM)
from FT_DOMINANCIA_PONTO_EXTRA_COMPLIANCE FT
inner join TABREF_PAINEL_LOJAS_LP TPLL
	on FT.ID_DIM_PDV = TPLL.ID_DIM_PDV
	and FT.CICLO = TPLL.CICLO
inner join FT_PERFECTSTORE_ITEM FTPI
	on FT.CICLO = FTPI.CICLO
	and FT.ID_DIM_PDV = FTPI.ID_DIM_PDV
	and FT.ID_BLOCO_ITEM = FTPI.ID_BLOCO_ITEM
	and FT.SEMANA_LP = FTPI.SEMANA_LP
where FT.CICLO = 202009
	and FT.ID_DIM_PDV = 223459792
group by
	FT.CICLO,
	FT.ID_DIM_PDV
    
/*Campos que devem ser indexados:
Tabela FT_DOMINANCIA_PONTO_EXTRA_COMPLIANCE
	Campos:
		ID_DIM_PDV
        CICLO
        ID_BLOCO_ITEM
        SEMANA_LP

Tabela: TABREF_PAINEL_LOJAS_LP
	Campos:
		ID_DIM_PDV
        CICLO
        
Tabela: FT_PERFECTSTORE_ITEM
	Campos:
		CICLO
        ID_DIM_PDV
        ID_BLOCO_ITEM
        SEMANA_LP
        
Justificativa: Como forma de otimizar consultas por meio da utilização de index,
costuma-se aplicá-los aos campos que são utilizados para ligação de tabelas, ou seja,
aqueles que são referenciados nos joins, uma vez que devem referenciar registros únicos
nas tabelas dimensão. A utilização de index precisa ser analisada caso a caso, por vezes
a aplicação de index em colunas acionadas múltiplas vezes pode causar o efeito contrário,
por exemplo, em um campo utilizado para soma, a leitura seria comprometida pela utilização
do index. Devemos considerar estes como um sumário da tabela, portanto utilizar nas colunas
de chaves primária e estrangeira.*/