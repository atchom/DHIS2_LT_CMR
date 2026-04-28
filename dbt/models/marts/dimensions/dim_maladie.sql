{{ config(materialized='table', schema='dimensions') }}

WITH maladies AS (
    SELECT DISTINCT
        nom_maladie,
        code_cim10,
        type_maladie
    FROM {{ ref('stg_alertes_epidemiques') }}
    
    UNION
    
    SELECT DISTINCT
        nom_maladie,
        code_cim10,
        NULL AS type_maladie
    FROM {{ ref('stg_alertes_par_maladie') }}
    
    UNION
    
    SELECT DISTINCT
        nom_maladie,
        NULL AS code_cim10,
        NULL AS type_maladie
    FROM {{ ref('stg_alertes_par_zone') }}
),

maladies_clean AS (
    SELECT
        ROW_NUMBER() OVER (ORDER BY nom_maladie) AS id_maladie,
        UPPER(TRIM(nom_maladie)) AS nom_maladie,
        UPPER(TRIM(code_cim10)) AS code_cim10,
        UPPER(TRIM(type_maladie)) AS type_maladie,
        CURRENT_TIMESTAMP() AS _ingested_at
    FROM maladies
    WHERE nom_maladie IS NOT NULL
)

SELECT * FROM maladies_clean