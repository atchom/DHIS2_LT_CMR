{{ config(materialized='table', schema='dimensions') }}

WITH zones AS (
    -- Union des différentes sources géographiques
    SELECT DISTINCT
        region,
        departement,
        arrondissement,
        commune,
        quartier_ville AS quartier,
        NULL AS zone_residence
    FROM {{ ref('stg_structures_sante') }}
    WHERE region IS NOT NULL
    
    UNION
    
    SELECT DISTINCT
        region,
        departement,
        arrondissement,
        commune,
        quartier,
        NULL AS zone_residence
    FROM {{ ref('stg_patients') }}
    WHERE region IS NOT NULL
    
    UNION
    
    SELECT DISTINCT
        region,
        departement,
        arrondissement,
        quartier_ville AS quartier,
        NULL AS commune,
        NULL AS zone_residence
    FROM {{ ref('stg_alertes_par_zone') }}
    WHERE region IS NOT NULL
    
    UNION
    
    -- Ajout de stg_patients_par_zone qui contient zone_residence
    SELECT DISTINCT
        region,
        departement,
        arrondissement,
        commune,
        quartier,
        zone_residence
    FROM {{ ref('stg_patients_par_zone') }}
    WHERE region IS NOT NULL
),

geo_clean AS (
    SELECT
        ROW_NUMBER() OVER (ORDER BY region, departement, arrondissement, commune, quartier, zone_residence) AS id_geographie,
        UPPER(TRIM(region)) AS region,
        UPPER(TRIM(departement)) AS departement,
        UPPER(TRIM(arrondissement)) AS arrondissement,
        UPPER(TRIM(commune)) AS commune,
        UPPER(TRIM(quartier)) AS quartier,
        zone_residence,
        CURRENT_TIMESTAMP() AS _ingested_at
    FROM zones
)

SELECT * FROM geo_clean