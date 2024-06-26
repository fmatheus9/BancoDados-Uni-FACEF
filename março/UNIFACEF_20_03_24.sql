--CASOS PARA TREINAR 
--CRIANDO A TABELA "tb_empregados"
--RESTRIÇÕES: PK APLICADA A COLUNA "rg"
CREATE TABLE TB_EMPREGADOS (
	RG VARCHAR(11),
	NM_EMPREGADO VARCHAR(60),
	IDADE INTEGER,
	CONSTRAINT PK_TB_EMPREGADOS_RG PRIMARY KEY (RG)
);

--CRIANDO A TABELA "tb_pedidos"
--RESTRIÇÕES: PK APLICADA A COLUNA "nr_pedido"
CREATE TABLE TB_PEDIDOS (
	NR_PEDIDO INTEGER,
	DS_PEDIDO VARCHAR(20),
	DT_PEDIDO DATE,
	CONSTRAINT PK_TB_PEDIDOS_NR_PEDIDO PRIMARY KEY (NR_PEDIDO)
);

--CRIANDO A TABELA "tb_itens"
--RESTRIÇÕES: PK APLICADA A COLUNA "nr_pedido" + "nr_item" e FK aplicada a coluna "nr_item"
CREATE TABLE TB_ITENS (
	NR_PEDIDO INTEGER,
	NR_ITEM INTEGER,
	NM_PRODUTO VARCHAR(40),
	QUANTIDADE INTEGER,
	CONSTRAINT PK_TB_ITENS_NR_PEDIDO_NR_ITEM PRIMARY KEY (NR_PEDIDO, NR_ITEM),
	CONSTRAINT FK_TB_ITENS_NR_PEDIDO FOREIGN KEY (NR_PEDIDO) REFERENCES TB_PEDIDOS (NR_PEDIDO)
);

--EXCLUINDO A TABELA "tb_empregados"
DROP TABLE TB_EMPREGADOS CASCADE
--CRIANDO A TABELA "tb_empregados" EM UMA NOVA VERSÃO
--RESTRIÇÕES: PK APLICADA A COLUNA "rg"
CREATE TABLE TB_EMPREGADOS (
	RG VARCHAR(11),
	NM_EMPREGADO VARCHAR(60),
	IDADE INTEGER,
	PLANO_SAUDE VARCHAR(10),
	RUA VARCHAR(20),
	NUMERO VARCHAR(5),
	CIDADE VARCHAR(20),
	CONSTRAINT PK_TB_EMPREGADOS_RG PRIMARY KEY (RG)
);

--CRIANDO A TABELA "tb_telefones"
--RESTRIÇÕES: 
CREATE TABLE TB_TELEFONES (
	RG VARCHAR(11),
	NR_TELEFONE VARCHAR(15),
	CONSTRAINT PK_TB_TELEFONES_RG_TELEFONE PRIMARY KEY (RG, NR_TELEFONE),
	CONSTRAINT FK_TB_TELEFONES_RG FOREIGN KEY (RG) REFERENCES TB_EMPREGADOS (RG)
);

--CRIANDO TABELAS COM ENTIDADES ESPECIALIZADAS
--SERVIDORES - FUNCIONÁRIOS - PROFESSORES
--CRIANDO A TABELA "tb_servidores"
--RESTRIÇÕES: PK APLICADA A COLUNA "cpf"
CREATE TABLE TB_SERVIDORES (
	CPF VARCHAR(11),
	NM_SERVIDOR VARCHAR(60),
	CONSTRAINT PK_TB_SERVIDORES_CPF PRIMARY KEY (CPF)
);

--CRIANDO A TABELA "tb_funcionarios"
--RESTRIÇÕES: PK APLICADA A COLUNA "cpf" E FK APLICADA A COLUNA "cpf", POIS SÃO ENTIDADES HERDADAS
CREATE TABLE TB_FUNCIONARIOS (
	CPF VARCHAR(11),
	DS_FUNCAO VARCHAR(20),
	CONSTRAINT PK_TB_FUNCIONARIOS_CPF PRIMARY KEY (CPF),
	CONSTRAINT FK_TB_FUNCIONARIOS_CPF FOREIGN KEY (CPF) REFERENCES TB_SERVIDORES (CPF)
);

--CIANDO A TABELA "tb_professores"
--RESTRIÇÕES: PK APLICADA A COLUNA "cpf" E FK APLICADA A COLUNA "cpf"
CREATE TABLE TB_PROFESSORES (
	CPF VARCHAR(11),
	TITULACAO VARCHAR(15),
	CATEGORIA VARCHAR(15),
	CONSTRAINT PK_TB_PROFESSORES_CPF PRIMARY KEY (CPF),
	CONSTRAINT FK_TB_PROFESSORES_CPF FOREIGN KEY (CPF) REFERENCES TB_SERVIDORES (CPF)
);
