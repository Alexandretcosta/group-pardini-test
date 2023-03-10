
--- CREATE TABLE DATASET_1

SELECT 
	DataCompetencia,
	IdPedido, 
	DataLaudo, 
	DataEntrada,
	DataPedido,
	ValorProducao,
	IdExame,
	Exame,
	Material,
	IdConvenio,
	CodigoConvenio,
	NomeConvenio,
	CidadeConvenio,
	UfConvenio,
	IdUnidadeNegocio,
	OrigemExame,
	SITUACAO,
	IdUnidade,
	NomeUnidade,
	EstabelecimentoERP,
	MNE_UND,
	CIDADE_UND,
	UFCAPTACAO,
	LATITUDE,
	LONGITUDE,
	UNIDADENEGOCIO,
	IdUnidadeProdutiva,
	UnidadeProdutiva
	INTO DATASET_1
	FROM DATASET


-- TYPES OF COLUMNS

SELECT 
    c.name 'Column Name',
    t.Name 'Data type',
    c.max_length 'Max Length',
    c.precision ,
    c.scale ,
    c.is_nullable,
    ISNULL(i.is_primary_key, 0) 'Primary Key'
FROM    
    sys.columns c
INNER JOIN 
    sys.types t ON c.user_type_id = t.user_type_id
LEFT OUTER JOIN 
    sys.index_columns ic ON ic.object_id = c.object_id AND ic.column_id = c.column_id
LEFT OUTER JOIN 
    sys.indexes i ON ic.object_id = i.object_id AND ic.index_id = i.index_id
WHERE
    c.object_id = OBJECT_ID('DATASET_1')


--- DIMENSAO UNIDADE

CREATE TABLE [dim_und] (
    IdUnidade float PRIMARY KEY,
    NomeUnidade nvarchar(510),
    EstabelecimentoERP float,
    MNE_UND nvarchar(510),
	CIDADE_UND nvarchar(510),
	UFCAPTACAO nvarchar(510),
	LATITUDE nvarchar(510),
	LONGITUDE nvarchar(510)
);

--- DIMENSAO EXAME 

CREATE TABLE [dim_exm] (
    IdExame float PRIMARY KEY,
    Exame nvarchar(510),
    OrigemExame float
);

--- DIMENSAO CONVENIO  

CREATE TABLE [dim_cvn] (
    IdConvenio float PRIMARY KEY,
    CodigoConvenio nvarchar(510),
    NomeConvenio nvarchar(510),
	CidadeConvenio nvarchar(510),
	UfConvenio nvarchar(510),
);

--- DIMENSAO UNIDADE PRODUTIVA

CREATE TABLE [dim_und_prd] (
    IdUnidadeProdutiva float PRIMARY KEY,
    UnidadeProdutiva nvarchar(510)
);


--- DIMENSAO UNIDADE NEGOCIO

CREATE TABLE [dim_und_neg] (
    IdUnidadeNegocio float PRIMARY KEY,
    UNIDADENEGOCIO nvarchar(510)
);

--- DIMENSAO PEDIDO

CREATE TABLE [dim_slct] (
    IdPedido float PRIMARY KEY,
    DataCompetencia float,
	DataEntrada float,
	DataPedido float,
	SITUACAO nvarchar(510)
);


--- TABELA FATO

CREATE TABLE [fato_grao] (
	DataLaudo float,
    IdPedido float,
    IdExame float,
	Material nvarchar(510),
	IdUnidade float,
	IdConvenio float,
    IdUnidadeProdutiva float,
    IdUnidadeNegocio float,
	SITUACAO nvarchar(510),
    ValorProducao float
);


