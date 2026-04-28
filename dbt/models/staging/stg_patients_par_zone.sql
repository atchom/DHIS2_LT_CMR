{{ config(
    materialized='table',
    schema='staging'
) }}

WITH source AS (
    SELECT
        region,
        departement,
        arrondissement,
        commune,
        quartier,
        zone_residence,
        nb_patients,
        nb_hommes,
        nb_femmes,
        age_moyen,
        enfants_0_5,
        personnes_agees_60_plus,
        CURRENT_TIMESTAMP() AS _ingested_at
    FROM {{ source('raw', 'raw_patients_par_zone') }}
    WHERE UPPER(TRIM(region)) = 'LITTORAL'
)

SELECT * FROM source