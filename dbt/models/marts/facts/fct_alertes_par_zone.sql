{{ config(materialized='table', schema='facts') }}

WITH alertes_zone AS (
    SELECT
        az.region,
        az.departement,
        az.arrondissement,
        az.quartier_ville,
        az.nom_maladie,
        dm.id_maladie,
        az.nb_alertes,
        az.cas_confirmes,
        az.deces,
        az.letalite_calculee,
        az.taux_alerte_1000,
        az.taux_attaque,
        az.population_exposee_moyenne,
        az._ingested_at
    FROM {{ ref('stg_alertes_par_zone') }} az
    LEFT JOIN {{ ref('dim_maladie') }} dm 
        ON UPPER(TRIM(az.nom_maladie)) = dm.nom_maladie
)

SELECT * FROM alertes_zone