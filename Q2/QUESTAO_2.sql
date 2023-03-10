-- CRIACAO DO DATASET_COM O JOIN ENTRE PRE_ANALITICO E GLOBAL_PRODUCAO

SELECT pa.ID_PEDIDO, -- (LIGACAO)
	pa.ID_UNIDADE, -- (LIGACAO)
	pa.MNEMONICO, -- (LIGACAO)
	pa.TIPO_MATERIAL, -- (LIGACAO)
	pa.DATA_ENTREGA_STC,
	pa.DATA_PEDIDO,
	pa.SEXO_PACIENTE,
	pa.DESTINO_AMOSTRA,
	gp.DATA_LIBERACAO,
	gp.QTDE_DE_AMOSTRA,
	gp.UF_DO_CLIENTE,
	gp.CIDADE_DO_CLIENTE,
	gp.IDADE_DO_CLIENTE,
	gp.C�D_CENTRO_DE_CUSTO,
	gp.QTDE_REMARCACAO,
	gp.QTDE_RECOLETA,
	gp.QTDE_RESET,
	gp.QTDE_RETIFICACAO
INTO QUESTAO_2
FROM PRE_ANALITICO pa
INNER JOIN GLOBAL_PRODUCAO gp
ON (pa.ID_PEDIDO = gp.ID_PEDIDO 
AND pa.ID_UNIDADE = gp.ID_UNIDADE
AND pa.MNEMONICO = gp.MNEMONICO
AND pa.TIPO_MATERIAL = gp.TIPO_MATERIAL)

-- CHECK DUPLICIDADE 

SELECT COUNT(*) FROM QUESTAO_2

SELECT COUNT(*) FROM (
SELECT DISTINCT ID_PEDIDO, -- (LIGACAO)
				ID_UNIDADE, -- (LIGACAO)
				MNEMONICO, -- (LIGACAO)
				TIPO_MATERIAL, -- (LIGACAO)
				DATA_ENTREGA_STC,
				DATA_PEDIDO,
				SEXO_PACIENTE,
				DESTINO_AMOSTRA,
				DATA_LIBERACAO,
				QTDE_DE_AMOSTRA,
				UF_DO_CLIENTE,
				CIDADE_DO_CLIENTE,
				IDADE_DO_CLIENTE,
				C�D_CENTRO_DE_CUSTO,
				QTDE_REMARCACAO,
				QTDE_RECOLETA,
				QTDE_RESET,
				QTDE_RETIFICACAO  FROM QUESTAO_2) QTD


