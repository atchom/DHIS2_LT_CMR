{{ config(materialized='table',
    schema='staging') }}

WITH source AS (
    SELECT
        id_org_unit,
        code,
        nom,
        niveau,
        region,
        departement,
        arrondissement,
        commune,
        quartier_ville,
        type_structure,
        type_propriete,
        sous_type_prive,
        zone_eco,
        zone_inondable,
        TRY_CAST(capacite_lits AS FLOAT) AS capacite_lits,
        TRY_CAST(capacite_urgence AS FLOAT) AS capacite_urgence,
        TRY_CAST(nombre_salles_consultation AS FLOAT) AS nombre_salles_consultation,
        UPPER(possede_labo) AS possede_labo,
        UPPER(possede_imagerie) AS possede_imagerie,
        UPPER(possede_ambulance) AS possede_ambulance,
        nb_ambulances,
        TRY_CAST(longitude AS FLOAT) AS longitude,
        TRY_CAST(latitude AS FLOAT) AS latitude,
        UPPER(convention_etat) AS convention_etat,
        telephone,
        email,
        responsable,
        UPPER(actif) AS actif,
        TRY_CAST(population_couverte AS FLOAT) AS population_couverte,
        TRY_CAST(date_creation AS DATE) AS date_creation,
        metadata,
        CURRENT_TIMESTAMP() AS _ingested_at
    FROM {{ source('raw', 'raw_structures_sante') }}
)

SELECT * FROM source