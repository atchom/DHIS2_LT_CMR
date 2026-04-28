{{ config(materialized='table', schema='staging') }}

WITH source AS (
    SELECT
        -- Géographie
        UPPER(TRIM(region)) AS region,
        UPPER(TRIM(departement)) AS departement,
        UPPER(TRIM(arrondissement)) AS arrondissement,
        UPPER(TRIM(quartier_ville)) AS quartier_ville,
        
        -- Maladie
        UPPER(TRIM(nom_maladie)) AS nom_maladie,
        
        -- Indicateurs épidémiologiques
        COALESCE(nb_alertes, 0) AS nb_alertes,
        COALESCE(cas_confirmes, 0) AS cas_confirmes,
        COALESCE(deces, 0) AS deces,
        
        -- Calcul du taux de létalité réel
        CASE 
            WHEN cas_confirmes > 0 
            THEN ROUND((deces * 100.0) / cas_confirmes, 2)
            ELSE 0
        END AS letalite_calculee,
        
        -- Taux de létalité fourni (nettoyé)
        COALESCE(TRY_CAST(letalite_moyenne AS FLOAT), 0) AS letalite_moyenne,
        
        -- Population exposée
        population_exposee_moyenne,
        
        -- Calcul du taux d'alerte pour 1000 habitants
        CASE 
            WHEN population_exposee_moyenne > 0 
            THEN ROUND((nb_alertes * 1000.0) / population_exposee_moyenne, 2)
            ELSE 0
        END AS taux_alerte_1000,
        
        -- Indicateurs composites
        CASE 
            WHEN nb_alertes > 0 
            THEN ROUND((cas_confirmes * 100.0) / nb_alertes, 2)
            ELSE 0
        END AS taux_attaque,
        
        -- Métadonnées
        CURRENT_TIMESTAMP() AS _ingested_at
    FROM {{ source('raw', 'raw_alertes_par_zone') }}
)

SELECT * FROM source