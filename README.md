# PROJETO INTEGRADOR 
Link para colaboração no Google Drive:  
https://docs.google.com/document/d/1QW7HildWLNksF3gwK-DW1cs8B7kDp1VU/edit

## AMEAÇAS GLOBAIS Á SEGURANÇA CIBERNÉTICA: apoio decisório em segurança cibernética
O projeto visa explorar a base de dados Global Cybersecurity Threats (2015–2024) para identificar padrões de ataques, setores vulneráveis, perdas financeiras e eficácia dos mecanismos de defesa, contribuindo para estratégias mais eficazes de proteção digital.

### FONTE DE DADOS
Título: "Global Cybersecurity Threats (2015–2024)"  
Origem: Kaggle
Link: https://www.kaggle.com/datasets/atharvasoundankar/global-cybersecurity-threats-2015-2024  
Formato: CSV

Arquivo da fonte de dados csv:  
01_Global_Cybersecurity_Threats_2015-2024.csv

### DEFINIÇÃO DE TECNOLOGIAS
MySQL Workbench: Importação, modelagem e manipulação dos dados
Microsoft Excel: Apoio na exploração inicial da base
Power BI: Visualização interativa e construção de dashboards analíticos
GitHub: Compartilhamento e versionamento do projeto

### EXTRAÇÃO DA FONTE DE DADOS CSV PARA BD MYSQL
Arquivo obtido na importação (Table Data Import Wizard) da fonte de dados em csv:  
02_pi_grupo2_seguranca_cibernetica_global_cybersecurity_threats_2015-2024.sql

### PROCESSO ETL
Extração: Importação do arquivo CSV via Table Data Import Wizard no MySQL
Transformação: Dados consistentes, sem necessidade de limpeza adicional
Carga: Criação do banco AmeacasGlobaisSegurancaCibernetica com tabelas de dimensão e fato, populadas via comandos SQL

### MODELAGEM DE DADOS: MODELO ESTRELA
O modelo estrela é a arquitetura mais comum para Data Warehouses, sendo composto por uma tabela central, chamada Tabela de Fatos, que se conecta diretamente a várias Tabelas de Dimensão.

Arquivo para criação da Tabela de Fatos e das Tabelas de Dimensões:  
  03_TABELAS_FATO_E_DIMENSOES_DDL.sql

Arquivo para inserção de dados nas Tabelas de Dimensões:  
  04_INSERIR_DADOS_TABELAS_DIMENSOES_DML.sql

Arquivo para inserção de dados na Tabela de Fatos a partir do BD 'pi_grupo2_seguranca_cibernetica', tabela `global_cybersecurity_threats_2015-2024, obtidos na importação (Table Data Import Wizard) da fonte de dados em csv:  
  05_INSERIR_DADOS_TABELA_FATOS_DML.sql

O Banco de Dados AmeacasGlobaisSegurancaCibernetica resultante dos scrips acima possui as seguintes tabelas:
  ameacasglobaissegurancacibernetica_dim_attack_origin.sql  
  ameacasglobaissegurancacibernetica_dim_attack_type.sql  
  ameacasglobaissegurancacibernetica_dim_country.sql  
  ameacasglobaissegurancacibernetica_dim_defense_mechanism.sql  
  ameacasglobaissegurancacibernetica_dim_target_sector.sql  
  ameacasglobaissegurancacibernetica_dim_vulnerability_type.sql  
  ameacasglobaissegurancacibernetica_dim_year.sql  
  ameacasglobaissegurancacibernetica_fact_incident.sql  

### Atividades de Apoio Decisório e OLAP  
A partir da base de dados, foi possível definir um conjunto de análises que contribuem diretamente para a tomada de decisões em níveis estratégico e operacional.O modelo de dados é estruturado em um esquema estrela, , tendo como núcleo a tabela de fatos fact_incident, que consolida as métricas quantitativas dos incidentes. Essa tabela se conecta às tabelas de dimensão, que fornecem o contexto categórico para as análises.

Visão Estratégica: KPIs como perdas financeiras, usuários afetados, tempo médio de resolução  
Análise Multidimensional: Slicing, dicing, drill-down e pivotagem com parâmetros de campo  
Medidas DAX:  
  Total Financial Loss  
  Total Users Affected  
  Average Resolution Time  
  Number of Incidents  
  Dynamic Measure  
  Chart Title  

### Compartilhamento no GitHub
O projeto está disponível publicamente para consulta e colaboração:  
Repositório: https://github.com/ayrahidasi/PI_SENAC_GRUPO2_AMEACAS_GLOBAIS_A_SEGURANCA_CIBERNETICA

