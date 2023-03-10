---- QUERY PARA RETORNAR O DATA ORIGINAL

SELECT fg.DataLaudo, 
	fg.IdPedido, 
	fg.IdExame, 
	fg.Material, 
	fg.IdUnidade, 
	fg.IdConvenio, 
	fg.IdUnidadeProdutiva, 
	fg.IdUnidadeNegocio,  
	fg.ValorProducao, 
	du.NomeUnidade,
	du.EstabelecimentoERP,
	du.MNE_UND,
	du.CIDADE_UND,
	du.UFCAPTACAO,
	du.LATITUDE,
	du.LONGITUDE,
	exm.Exame,
	exm.OrigemExame,
	cvn.CodigoConvenio,
	cvn.NomeConvenio, 
	cvn.CidadeConvenio,
	cvn.UfConvenio,
	prd.UnidadeProdutiva,
	neg.UNIDADENEGOCIO,
	slct.DataCompetencia,
	slct.DataEntrada,
	slct.DataPedido,
	slct.SITUACAO	   
FROM fato_grao fg 
LEFT JOIN dim_und du
ON fg.IdUnidade = du.IdUnidade
LEFT JOIN dim_exm exm
ON fg.IdExame = exm.IdExame
LEFT JOIN dim_cvn cvn
ON fg.IdConvenio = cvn.IdConvenio
LEFT JOIN dim_und_prd as prd
ON fg.IdUnidadeProdutiva = prd.IdUnidadeProdutiva
LEFT JOIN dim_und_neg neg
ON fg.IdUnidadeNegocio = neg.IdUnidadeNegocio
LEFT JOIN dim_slct slct
ON fg.IdPedido = slct.IdPedido

-- ORDER BY IdPedido
-- OFFSET 10 ROWS
-- FETCH NEXT 10 ROWS ONLY

---- QUERYS ANALITICAS PARA CIENTISTA DE DADOS

-- MEDIA VALOR PRODUÇÃO POR PEDIDO

SELECT AVG(convert(float,[ValorProducao])) AS MEDIA_VALOR_PRODUCAO,
		MAX(convert(float,[ValorProducao])) AS MAX_VALOR_PRODUCAO,
		MIN(convert(float,[ValorProducao])) AS MIN_VALOR_PRODUCAO FROM (
SELECT DISTINCT [IdPedido],
       [ValorProducao]
	   FROM [pardiniteste].[dbo].[DATASET_1] ) PED

-- CONVENIO MAIS RECORRENTES 

SELECT [IdConvenio]
	   ,[CodigoConvenio]
       ,[NomeConvenio]
	   ,COUNT(*) AS QTD FROM (
SELECT DISTINCT [IdPedido]
       ,[IdConvenio]
	   ,[CodigoConvenio]
       ,[NomeConvenio]
	   FROM [pardiniteste].[dbo].[DATASET_1] ) PED
	   GROUP BY [IdConvenio]
	   ,[CodigoConvenio]
       ,[NomeConvenio]
	   ORDER BY QTD DESC

-- LUGARES MAIS RECORRENTES DOS CONVENIOS:

SELECT [CidadeConvenio]
      ,[UfConvenio]
	   ,COUNT(*) AS QTD FROM (
SELECT DISTINCT [IdPedido]
       ,[CidadeConvenio]
      ,[UfConvenio]
	   FROM [pardiniteste].[dbo].[DATASET_1] ) PED
	   GROUP BY [CidadeConvenio]
      ,[UfConvenio]
	   ORDER BY QTD DESC

-- EXAME MAIS RECORRENTE 

SELECT [IdExame]
      ,[Exame]
	   ,COUNT(*) AS QTD FROM (
SELECT DISTINCT [IdPedido]
       ,[IdExame]
      ,[Exame]
	   FROM [pardiniteste].[dbo].[DATASET_1] ) PED
	   GROUP BY [IdExame]
      ,[Exame]
	   ORDER BY QTD DESC
