{{ config(materialized='table', schema='dimensions') }}

WITH structures AS (
    SELECT
        id_org_unit AS id_structure,
        code AS code_structure,
        nom AS nom_structure,
        niveau AS niveau_structure,
        type_structure,
        type_propriete,
        sous_type_prive,
        zone_eco,
        zone_inondable,
        capacite_lits,
        capacite_urgence,
        nombre_salles_consultation,
        possede_labo,
        possede_imagerie,
        possede_ambulance,
        nb_ambulances,
        longitude,
        latitude,
        convention_etat,
        telephone,
        email,
        responsable,
        actif,
        population_couverte,
        date_creation,
        _ingested_at
    FROM {{ ref('stg_structures_sante') }}
)

SELECT * FROM structures