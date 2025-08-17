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
