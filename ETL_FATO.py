import pyodbc
import pandas as pd
from dotenv import load_dotenv
import os
import datetime
import calendar
from datetime import date
import holidays
import numpy as np


load_dotenv("keys.env",override=True)

driver = os.environ['DRIVER']
server = os.environ['SERVER']
database = os.environ['DATABASE']

### funcoes 

def conexao(driver, server, database):
    
    cnxn_str = (f"Driver={str(driver)};"
                f"Server={str(server)};"
                f"Database={str(database)};"
                "Trusted_Connection=yes;")
    cnxn = pyodbc.connect(cnxn_str)
    return cnxn


def truncate_table(driver, server, database, tabela_destino):
    
    con = conexao(driver, server, database)
    
    truncate = f"""TRUNCATE TABLE {tabela_destino} """
    
    cursor = con.cursor()
    cursor.execute(truncate)
    
    con.commit()
    cursor.close()
    
    return

print('Driver: ',str(driver))
print('Server: ',str(server))
print('Database: ',str(database))

con = conexao(driver, server, database)
print("Conexao Feita com Sucesso")

## Tabela Fato

filename = 'fato/Fato_Grao.ipynb'
with open(filename) as fp:
    nb = load(fp)

for cell in nb['cells']:
    if cell['cell_type'] == 'code':
        source = ''.join(line for line in cell['source'] if not line.startswith('%'))
        exec(source, globals(), locals())
        

## Tabela Dimensao Unidade       
filename = 'dimensao/Unidade.ipynb'
with open(filename) as fp:
    nb = load(fp)

for cell in nb['cells']:
    if cell['cell_type'] == 'code':
        source = ''.join(line for line in cell['source'] if not line.startswith('%'))
        exec(source, globals(), locals())

## Tabela Dimensao Exame
filename = 'dimensao/Exame.ipynb'
with open(filename) as fp:
    nb = load(fp)

for cell in nb['cells']:
    if cell['cell_type'] == 'code':
        source = ''.join(line for line in cell['source'] if not line.startswith('%'))
        exec(source, globals(), locals())

        
## Tabela Dimensao Convenio
filename = 'dimensao/Convenio.ipynb'
with open(filename) as fp:
    nb = load(fp)

for cell in nb['cells']:
    if cell['cell_type'] == 'code':
        source = ''.join(line for line in cell['source'] if not line.startswith('%'))
        exec(source, globals(), locals())

        
## Tabela Dimensao Unidade Produtiva
filename = 'dimensao/Unidade_Produtiva.ipynb'
with open(filename) as fp:
    nb = load(fp)

for cell in nb['cells']:
    if cell['cell_type'] == 'code':
        source = ''.join(line for line in cell['source'] if not line.startswith('%'))
        exec(source, globals(), locals())


## Tabela Dimensao Unidade Negocio
filename = 'dimensao/Unidade_Negocio.ipynb'
with open(filename) as fp:
    nb = load(fp)

for cell in nb['cells']:
    if cell['cell_type'] == 'code':
        source = ''.join(line for line in cell['source'] if not line.startswith('%'))
        exec(source, globals(), locals())
        
## Tabela Dimensao Material
filename = 'dimensao/Material.ipynb'
with open(filename) as fp:
    nb = load(fp)

for cell in nb['cells']:
    if cell['cell_type'] == 'code':
        source = ''.join(line for line in cell['source'] if not line.startswith('%'))
        exec(source, globals(), locals())


## Tabela Dimensao Situacao
filename = 'dimensao/Situacao.ipynb'
with open(filename) as fp:
    nb = load(fp)

for cell in nb['cells']:
    if cell['cell_type'] == 'code':
        source = ''.join(line for line in cell['source'] if not line.startswith('%'))
        exec(source, globals(), locals())
