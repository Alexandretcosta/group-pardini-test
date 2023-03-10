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

