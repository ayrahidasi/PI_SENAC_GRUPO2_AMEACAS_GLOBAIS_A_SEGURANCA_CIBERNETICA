# PROJETO INTEGRADOR

## AMEAÇAS GLOBAIS Á SEGURANÇA CIBERNÉTICA

Link para colaboração no Google Drive:
https://docs.google.com/document/d/1QW7HildWLNksF3gwK-DW1cs8B7kDp1VU/edit

### FONTE DE DADOS
"Global Cybersecurity Threats (2015–2024)"
https://www.kaggle.com/datasets/atharvasoundankar/global-cybersecurity-threats-2015-2024

### MODELAGEM DE DADOS: MODELO ESTRELA

#### SCRIPT DDL – CRIAÇÃO DAS TABELA
  
  CREATE DATABASE AmeacasGlobaisSegurancaCibernetica;
  USE AmeacasGlobaisSegurancaCibernetica;
  
  -- Tabelas de Dimensão
  CREATE TABLE dim_country (
     id_country INT AUTO_INCREMENT PRIMARY KEY,
      country VARCHAR(100)
  );
  CREATE TABLE dim_year (
      id_year INT AUTO_INCREMENT PRIMARY KEY,
      year INT
  );
  CREATE TABLE dim_attack_type (
      id_attack_type INT AUTO_INCREMENT PRIMARY KEY,
      attack_type VARCHAR(100)
  );
  CREATE TABLE dim_target_sector (
      id_target_sector INT AUTO_INCREMENT PRIMARY KEY,
      target_sector VARCHAR(100)
  );
  CREATE TABLE dim_attack_origin (
      id_attack_origin INT AUTO_INCREMENT PRIMARY KEY,
      attack_origin VARCHAR(100)
  );
  CREATE TABLE dim_vulnerability_type (
      id_vulnerability_type INT AUTO_INCREMENT PRIMARY KEY,
      vulnerability_type VARCHAR(100)
  );
  CREATE TABLE dim_defense_mechanism (
      id_defense_mechanism INT AUTO_INCREMENT PRIMARY KEY,
      defense_mechanism VARCHAR(100)
  );
  
  -- Tabela de Fatos
  CREATE TABLE fact_incident(
      id_incidente INT AUTO_INCREMENT PRIMARY KEY,
      id_country INT,
      id_year INT,
      id_attack_type INT,
      id_target_sector INT,
      id_attack_origin INT,
      id_vulnerability_type INT,
      id_defense_mechanism INT,
      financial_loss FLOAT,
      users_affected INT,
      resolution_time INT,
      FOREIGN KEY (id_country) REFERENCES dim_country(id_country),
      FOREIGN KEY (id_year) REFERENCES dim_year(id_year),
      FOREIGN KEY (id_attack_type) REFERENCES dim_attack_type(id_attack_type),
      FOREIGN KEY (id_target_sector) REFERENCES dim_target_sector(id_target_sector),
      FOREIGN KEY (id_attack_origin) REFERENCES dim_attack_origin(id_attack_origin),
      FOREIGN KEY (id_vulnerability_type) REFERENCES dim_vulnerability_type(id_vulnerability_type),
      FOREIGN KEY (id_defense_mechanism) REFERENCES dim_defense_mechanism(id_defense_mechanism)
  );

#### SCRIPT DML – INSERÇÃO DOS DADOS

  -- Inserir dados nas Tabelas Dimensão
  USE ameacasglobaissegurancacibernetica;
  INSERT INTO dim_country (country) VALUES ('Australia');
  INSERT INTO dim_country (country) VALUES ('Brazil');
  INSERT INTO dim_country (country) VALUES ('China');
  INSERT INTO dim_country (country) VALUES ('France');
  INSERT INTO dim_country (country) VALUES ('Germany');
  INSERT INTO dim_country (country) VALUES ('India');
  INSERT INTO dim_country (country) VALUES ('Japan');
  INSERT INTO dim_country (country) VALUES ('Russia');
  INSERT INTO dim_country (country) VALUES ('UK');
  INSERT INTO dim_country (country) VALUES ('USA');
  INSERT INTO dim_year (year) VALUES ('2015');
  INSERT INTO dim_year (year) VALUES ('2016');
  INSERT INTO dim_year (year) VALUES ('2017');
  INSERT INTO dim_year (year) VALUES ('2018');
  INSERT INTO dim_year (year) VALUES ('2019');
  INSERT INTO dim_year (year) VALUES ('2020');
  INSERT INTO dim_year (year) VALUES ('2021');
  INSERT INTO dim_year (year) VALUES ('2022');
  INSERT INTO dim_year (year) VALUES ('2023');
  INSERT INTO dim_year (year) VALUES ('2024');
  INSERT INTO dim_attack_type (attack_type) VALUES ('DDoS');
  INSERT INTO dim_attack_type (attack_type) VALUES ('Malware');
  INSERT INTO dim_attack_type (attack_type) VALUES ('Man-in-the-Middle');
  INSERT INTO dim_attack_type (attack_type) VALUES ('Phishing');
  INSERT INTO dim_attack_type (attack_type) VALUES ('Ransomware');
  INSERT INTO dim_attack_type (attack_type) VALUES ('SQL Injection');
  INSERT INTO dim_target_sector (target_sector) VALUES ('Banking');
  INSERT INTO dim_target_sector (target_sector) VALUES ('Education');
  INSERT INTO dim_target_sector (target_sector) VALUES ('Government');
  INSERT INTO dim_target_sector (target_sector) VALUES ('Healthcare');
  INSERT INTO dim_target_sector (target_sector) VALUES ('IT');
  INSERT INTO dim_target_sector (target_sector) VALUES ('Retail');
  INSERT INTO dim_target_sector (target_sector) VALUES ('Telecommunications');
  INSERT INTO dim_attack_origin (attack_origin) VALUES ('Hacker Group');
  INSERT INTO dim_attack_origin (attack_origin) VALUES ('Insider');
  INSERT INTO dim_attack_origin (attack_origin) VALUES ('Nation-state');
  INSERT INTO dim_attack_origin (attack_origin) VALUES ('Unknown');
  INSERT INTO dim_vulnerability_type (vulnerability_type) VALUES ('Social Engineering');
  INSERT INTO dim_vulnerability_type (vulnerability_type) VALUES ('Unpatched Software');
  INSERT INTO dim_vulnerability_type (vulnerability_type) VALUES ('Weak Passwords');
  INSERT INTO dim_vulnerability_type (vulnerability_type) VALUES ('Zero-day');
  INSERT INTO dim_defense_mechanism (defense_mechanism) VALUES ('AI-based Detection');
  INSERT INTO dim_defense_mechanism (defense_mechanism) VALUES ('Antivirus');
  INSERT INTO dim_defense_mechanism (defense_mechanism) VALUES ('Encryption');
  INSERT INTO dim_defense_mechanism (defense_mechanism) VALUES ('Firewall');
  INSERT INTO dim_defense_mechanism (defense_mechanism) VALUES ('VPN');
  
  -- Inserir dados na Tabela Fatos
  USE ameacasglobaissegurancacibernetica;
  INSERT INTO fact_incident(
      id_country, id_year, id_attack_type, id_target_sector,
      id_attack_origin, id_vulnerability_type, id_defense_mechanism,
      financial_loss, users_affected, resolution_time
  )
  SELECT
      c.id_country,
      y.id_year,
      a.id_attack_type,
      s.id_target_sector,
      o.id_attack_origin,
      v.id_vulnerability_type,
      d.id_defense_mechanism,
      g.`Financial Loss (in Million $)` AS financial_loss,
      g.`Number of Affected Users` AS users_affected,
      g.`Incident Resolution Time (in Hours)` AS resolution_time
  
  FROM pi_grupo2_seguranca_cibernetica.`global_cybersecurity_threats_2015-2024` g
  JOIN dim_country c ON g.Country = c.country
  JOIN dim_year y ON g.Year = y.year
  JOIN dim_attack_type a ON g.`Attack Type` = a.attack_type
  JOIN dim_target_sector s ON g.`Target Industry` = s.target_sector
  JOIN dim_attack_origin o ON g.`Attack Source` = o.attack_origin
  JOIN dim_vulnerability_type v ON g.`Security Vulnerability Type` = v.vulnerability_type
  JOIN dim_defense_mechanism d ON g.`Defense Mechanism Used` = d.defense_mechanism;

### PROCESSO ETL
