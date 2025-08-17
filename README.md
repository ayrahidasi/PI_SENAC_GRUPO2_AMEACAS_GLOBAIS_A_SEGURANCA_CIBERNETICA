# PROJETO INTEGRADOR

## AMEAÇAS GLOBAIS Á SEGURANÇA CIBERNÉTICA

Link para colaboração no Google Drive:
https://docs.google.com/document/d/1QW7HildWLNksF3gwK-DW1cs8B7kDp1VU/edit

### FONTE DE DADOS
"Global Cybersecurity Threats (2015–2024)"
https://www.kaggle.com/datasets/atharvasoundankar/global-cybersecurity-threats-2015-2024

### EXTRAÇÃO DA FONTE DE DADOS CSV PARA BD MYSQL
Arquivo obtido na importação (Table Data Import Wizard) da fonte de dados em csv:
pi_grupo2_seguranca_cibernetica_global_cybersecurity_threats_2015-2024.sql

### MODELAGEM DE DADOS: MODELO ESTRELA
O modelo estrela é a arquitetura mais comum para Data Warehouses, sendo composto por uma tabela central, chamada Tabela de Fatos, que se conecta diretamente a várias Tabelas de Dimensão.

Arquivo para criação da Tabela de Fatos e das Tabelas de Dimensões:  
TABELAS_FATO_E_DIMENSOES_DDL.sql

Arquivo para inserção de dados nas Tabelas de Dimensões:  
INSERIR_DADOS_TABELAS_DIMENSOES_DML.sql

Arquivo para inserção de dados na Tabela de Fatos a partir do BD 'pi_grupo2_seguranca_cibernetica', tabela `global_cybersecurity_threats_2015-2024, obtidos na importação (Table Data Import Wizard) da fonte de dados em csv:  
INSERIR_DADOS_TABELA_FATO_DML.sql

### PROCESSO ETL
