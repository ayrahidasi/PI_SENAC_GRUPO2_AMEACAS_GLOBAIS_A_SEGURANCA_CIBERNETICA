# PROJETO INTEGRADOR

## AMEAÇAS GLOBAIS Á SEGURANÇA CIBERNÉTICA

Link para colaboração no Google Drive:  
https://docs.google.com/document/d/1QW7HildWLNksF3gwK-DW1cs8B7kDp1VU/edit

### FONTE DE DADOS
"Global Cybersecurity Threats (2015–2024)"  
https://www.kaggle.com/datasets/atharvasoundankar/global-cybersecurity-threats-2015-2024  
Arquivo da fonte de dados csv:  
01_Global_Cybersecurity_Threats_2015-2024.csv

### EXTRAÇÃO DA FONTE DE DADOS CSV PARA BD MYSQL
Arquivo obtido na importação (Table Data Import Wizard) da fonte de dados em csv:  
02_pi_grupo2_seguranca_cibernetica_global_cybersecurity_threats_2015-2024.sql

### MODELAGEM DE DADOS: MODELO ESTRELA
O modelo estrela é a arquitetura mais comum para Data Warehouses, sendo composto por uma tabela central, chamada Tabela de Fatos, que se conecta diretamente a várias Tabelas de Dimensão.

Arquivo para criação da Tabela de Fatos e das Tabelas de Dimensões:  
  03_TABELAS_FATO_E_DIMENSOES_DDL.sql

Arquivo para inserção de dados nas Tabelas de Dimensões:  
  04_INSERIR_DADOS_TABELAS_DIMENSOES_DML.sql

Arquivo para inserção de dados na Tabela de Fatos a partir do BD 'pi_grupo2_seguranca_cibernetica', tabela `global_cybersecurity_threats_2015-2024, obtidos na importação (Table Data Import Wizard) da fonte de dados em csv:  
  05_INSERIR_DADOS_TABELA_FATO_DML.sql

O Banco de Dados AmeacasGlobaisSegurancaCibernetica resultante dos scrips acima possui as seguintes tabelas:
  ameacasglobaissegurancacibernetica_dim_attack_origin.sql  
  ameacasglobaissegurancacibernetica_dim_attack_type.sql  
  ameacasglobaissegurancacibernetica_dim_country.sql  
  ameacasglobaissegurancacibernetica_dim_defense_mechanism.sql  
  ameacasglobaissegurancacibernetica_dim_target_sector.sql  
  ameacasglobaissegurancacibernetica_dim_vulnerability_type.sql  
  ameacasglobaissegurancacibernetica_dim_year.sql  
  ameacasglobaissegurancacibernetica_fact_incident.sql  

### PROCESSO ETL
