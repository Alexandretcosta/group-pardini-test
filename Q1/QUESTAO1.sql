---- QUERY PARA RETORNAR O DATA ORIGINAL

SELECT fg.IdData,
	dat.Data as DataLaudo,
	dat.Dia_Semana,
	dat.Nome_Dia_Semana,
	dat.Semana_Ano,
	dat.Semestre,
	dat.Trimestre,
	dat.InFeriado,
	dat.InFds,
	fg.IdPedido, 
	fg.IdExame,
	exm.Exame,
	exm.OrigemExame,
	fg.IdMaterial, 
	fg.IdUnidade,
	du.NomeUnidade,
	du.EstabelecimentoERP,
	du.MNE_UND,
	du.CIDADE_UND,
	du.UFCAPTACAO,
	du.LATITUDE,
	du.LONGITUDE,
	fg.ValorProducao,
	fg.Qtd_Exame,
	fg.Qtd_Material
FROM fato_grao fg 
LEFT JOIN dim_und du
ON fg.IdUnidade = du.IdUnidade
LEFT JOIN dim_exm exm
ON fg.IdExame = exm.IdExame
LEFT JOIN dim_data dat
ON fg.IdData = dat.IdData


---- QUERYS ANALITICAS PARA CIENTISTA DE DADOS

-- MEDIA VALOR PRODUÇÃO POR PEDIDO

SELECT AVG(convert(float,[ValorProducao])) AS MEDIA_VALOR_PRODUCAO,
		MAX(convert(float,[ValorProducao])) AS MAX_VALOR_PRODUCAO,
		MIN(convert(float,[ValorProducao])) AS MIN_VALOR_PRODUCAO FROM (
SELECT DISTINCT [IdPedido],
       [ValorProducao]
	   FROM [pardiniteste].[dbo].[DATASET_1] ) PED

-- CONVENIO MAIS RECORRENTES 

--SELECT [IdConvenio]
--	   ,[CodigoConvenio]
--       ,[NomeConvenio]
--	   ,COUNT(*) AS QTD FROM (
--SELECT DISTINCT [IdPedido]
--       ,[IdConvenio]
--	   ,[CodigoConvenio]
--       ,[NomeConvenio]
--	   FROM [pardiniteste].[dbo].[DATASET_1] ) PED
--	   GROUP BY [IdConvenio]
--	   ,[CodigoConvenio]
--       ,[NomeConvenio]
--	   ORDER BY QTD DESC
--
---- LUGARES MAIS RECORRENTES DOS CONVENIOS:
--
--SELECT [CidadeConvenio]
--      ,[UfConvenio]
--	   ,COUNT(*) AS QTD FROM (
--SELECT DISTINCT [IdPedido]
--       ,[CidadeConvenio]
--      ,[UfConvenio]
--	   FROM [pardiniteste].[dbo].[DATASET_1] ) PED
--	   GROUP BY [CidadeConvenio]
--      ,[UfConvenio]
--	   ORDER BY QTD DESC

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

-- VALOR PRODUCAO POR UNIDADE

SELECT [IdUnidade],
		SUM(convert(float,[ValorProducao])) AS MEDIA_VALOR_PRODUCAO,
		AVG(convert(float,[ValorProducao])) AS MEDIA_VALOR_PRODUCAO,
		MAX(convert(float,[ValorProducao])) AS MAX_VALOR_PRODUCAO,
		MIN(convert(float,[ValorProducao])) AS MIN_VALOR_PRODUCAO FROM (
SELECT DISTINCT [DataLaudo], 
	   [IdPedido],
	   [IdExame],
	   [IdUnidade],
	   [Material],
       [ValorProducao]
	   FROM [pardiniteste].[dbo].[DATASET_1] ) PED
	   GROUP BY [IdUnidade]
