<h1 align="center">🎧 Involves</h3>
<h2 align="center">🎤 Aline da Silveira Rosa</h1>
<h3 align="center">🎶 Teste Técnico: Pessoa Engenheira de Dados</h3>

<hr>

<h3>1)	Descreva com suas palavras os principais conceitos abaixo:</h2>

<h4>a) O que é um Data Warehouse?</h4>

<p align="justify">
Um Data Warehouse, ou armazém de dados, como também é chamado, é uma estrutura de banco de dados relacionais utilizada para análise de dados em formato estruturado, utilizando dos conceitos de OLAP para a segregação de dados em silos de informação, onde cada data Warehouse armazena dados de determinado setor, projeto ou cliente. Em um exemplo mais claro, em uma empresa que conta com os setores “Recursos Humanos”, “Marketing” e “Vendas”, cada setor tem um Data Warehouse com dados pertinentes relativos ao seu dia a dia para que analistas possam gerar conhecimento e informação por meio das análises efetuadas. Dessa forma, os mesmos dados podem ser analisados por diferentes perspectivas, enquanto o setor “Vendas” pode analisar valores totais de vendas, o setor “Marketing” pode analisar o alcance de uma campanha realizada dentro do período, enquanto “Recursos Humanos” pode analisar a eficiência de determinado vendedor durante a campanha realizada.</p>

<h4>b) Quais características possuem as tabelas do tipo Fato e Dimensão?</h4>

<p align="justify">
Os conceitos de tabelas dimensão e fato vêm da utilização da modelagem de dados em formato de estrela, amplamente utilizado por data warehouses relacionais, onde tabelas fato armazenam eventos, tais como uma venda, uma compra, uma contratação ou demissão, enquanto as tabelas dimensão armazenam as descrições (nome, endereço, descrição, categorias etc) das entidades. Tais tabelas se relacionam por chaves de identificação únicas. Uma tabela dimensão precisa, necessariamente, conter um registro único para cada entrada, enquanto uma tabela fato pode conter mais de uma entrada por identificador. Por exemplo, em uma tabela fato, um cliente (id_cliente) pode realizar mais de uma compra (id_compra), mas em uma tabela dimensão, uma compra (id_compra) só pode ser efetuada por um cliente (id_cliente).</p>

<h4>c) O que é ETL?</h4>
<p align="justify">
De forma bastante resumida, ETL é o processo de Extração, Transformação e Carga de dados, onde extração se refere à coleta dos dados na fonte, podendo ser um banco de dados transacional (OLTP), arquivos como json, cvs, mídias ou demais arquivos não relacionais; transformação se refere ao tratamento necessário para que os dados sejam normalizados, como limpeza de campos numéricos, padronização, alteração de tipagem de dados; e carga se refere à disponibilização dos dados para análise, podendo ser a gravação dos dados em um data warehouse, a entrega de um cubo de dados modelado para aplicação de análises, a disponibilização de arquivos csv ou demais necessidades pertinentes ao cliente.</p>

<h4>d) Quais são as principais atribuições de um Engenheiro de Dados?</h4>
<p align="justify">
As principais atribuições de um Engenheiro de Dados estão em construir e sustentar pipelines de extração de dados (ETL) automatizados e confiáveis que entreguem aos analistas e cientistas de dados os dados necessários para utilização no desenvolvimento de suas atividades, nos diversos formatos possíveis, com o devido cuidado para que as extrações não causem impactos negativos nos sistemas transacionais de forma a prejudicar a atividade de produção.</p>

<h4>e) O que é Trade Marketing?</h4>
<p align="justify">
Trade Marketing é a estratégia de marketing que utiliza uma série de metodologias e técnicas para potencializar a comercialização de produtos em pontos de vendas, pensando na relação entre produtor (empresa, marca), ponto de venda (presencial ou digital), e consumidor (direto ou indireto), indo desde análise de estoque e eficiência de reposição de mercadorias até o estudo do comportamento do consumidor final.</p>

<hr>

<h3 align="center">Questões 08, 09 e 10</h3>

<h4>Para as questões envolvendo o Pentaho, seguem as justificativas:</h4>

<p>Primeiramente, criei uma instância do MySQL na nuvem Azure, como forma de poder testar corretamente as transformações e conexões solicitadas.</p>
	<p>Dentro do Pentaho, utilizei uma transformação que lê um arquivo json onde estão salvos os parâmetros utilizados para a conexão com o banco de dados, dessa forma os dados de conexão não ficam expostos dentro dos arquivos ktr. Por padrão, adiciono a extensão .json ao .gitignore, com isso posso salvar usuário e senha dentro do arquivo e ele não será disponibilizado junto com os commits. Utilizo também um step de envio de e-mail notificando o administrador do pipeline quando há erro em algum dos steps, para isso os valores de login do e-mail estão adicionados no mesmo arquivo de parâmetros.</p>
	<p>Utilizei o “dummy” para preenchimento dos parâmetros de conexão automaticamente quando estou realizando testes nas transformações e, para não precisar subir alterações nas branches todas as vezes em que modifico o hop, deixo na transformação por padrão, facilitando testes.</p>
	<p>Em seguida, utilizei uma transformação para inserir no banco de dados algumas informações de log com o horário de início do job (horário do sistema), ID de execução (campo incremental) e nome do job (preenchido manualmente no data grid).</p>
	<p>A seguir, separei o que foi solicitado em quatro jobs:</p>
<p>a)	Extraction: neste job, separo as fontes em pastas como forma de organização dos arquivos, mesmo sendo apenas um csv quis deixar organizado pra manter um padrão. Aqui, faço a leitura do csv e insiro os dados em uma tabela temporária, que será truncada em todas as execuções para realizar uma carga completa dos arquivos no diretório.</p>
<p>b)	Merge: usando os dados da tabela temporária (stg.temp_data_import), comparo o ID fornecido com a tabela que armazenará todos os dados em stage, pensando nos conceitos de data lake, para não perder informações com as transformações que serão realizadas. Os dados já existentes na tabela stg.data_import serão atualizados, e os novos dados serão inseridos.</p>
<p>c)	Transformation: a partir daqui, utilizei como fonte a tabela stg.data_import, onde estão inseridos os dados sem tratamento, para a construção das tabelas dimensão e fato. Não costumo utilizar as ferramentas datawarehouse fornecida pelo pentaho por costume de trabalhar com altos volumes de dados e já haver reparado que existe uma queda de performance, então utilizei os steps de script SQL para realizar as transformações necessárias. Caso fossem tabelas maiores, o indicado seria salvar os aquivos .sql em um diretório e realizar a leitura dos mesmos via pentaho, para que a execução não seja por dentro do programa e sim em background, o que gera aumento de performance significativo. Entretanto, encontrei alguns erros de sintaxe com o MySQL (estou mais habituada ao SQL Server no dia a dia) e, como estava com pouco tempo hábil para a execução do pipeline, resolvi manter a leitura via pentaho.</p>
<p>d)	Load: esta etapa não foi solicitada, mas pensando no padrão de integração e produto de dados, achei interessante criar um exemplo de dataset com a carga final utilizando as tabelas dimensão e fato criadas anteriormente.</p>
<p>Por último, utilizei uma transformação para atualizar a tabela de logs, inserindo novamente o horário do sistema, agora no campo end_time, gerando assim um controle tanto do horário em que a extração começou, quanto do momento em que a carga foi finalizada.</p>
