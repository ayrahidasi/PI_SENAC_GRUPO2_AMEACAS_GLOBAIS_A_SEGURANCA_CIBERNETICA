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
