

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

--- DIMENSAO MATERIAL

CREATE TABLE [dim_mat] (
    IdMaterial float PRIMARY KEY,
	Material nvarchar(510)
);

--- DIMENSAO SITUACAO

CREATE TABLE [dim_sit] (
    IdSituacao float PRIMARY KEY,
	SITUACAO nvarchar(510)
);


--- DIMENSAO DATA 

CREATE TABLE [dim_data] ( IdData integer PRIMARY KEY,
 Data date,
 Dia smallint,
 Mes smallint,
 Ano smallint,
 Ano_Mes integer,
 Dia_Semana smallint,
 Nome_Dia_Semana nvarchar(10),
 Semana_Ano smallint,
 Semestre smallint,
 Trimestre smallint,
 InFeriado smallint,
 InFds smallint )

--- TABELA FATO

CREATE TABLE [fato_grao] (
	IdData float,
    IdPedido float,
    IdExame float,
	IdMaterial float,
	IdUnidade float,
    ValorProducao float,
	Qtd_Exame int,
	Qtd_Material int
);




