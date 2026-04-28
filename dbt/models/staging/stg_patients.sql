{{ config(materialized='table', schema='staging') }}

WITH source AS (
    SELECT
        id_patient,
        code_patient,
        nin,
        TRY_CAST(date_naissance AS DATE) AS date_naissance,
        age_ans,
        UPPER(TRIM(sexe)) AS sexe,
        UPPER(TRIM(region)) AS region,
        UPPER(TRIM(departement)) AS departement,
        UPPER(TRIM(arrondissement)) AS arrondissement,
        UPPER(TRIM(commune)) AS commune,
        UPPER(TRIM(quartier)) AS quartier,
        adresse_detail,
        UPPER(TRIM(zone_residence)) AS zone_residence,
        domicile_longitude,
        domicile_latitude,
        distance_csi_km,
        UPPER(TRIM(profession)) AS profession,
        UPPER(TRIM(statut_socio_pro)) AS statut_socio_pro,
        UPPER(TRIM(niveau_education)) AS niveau_education,
        UPPER(TRIM(mutuelle)) AS mutuelle,
        numero_mutuelle,
        UPPER(TRIM(type_prise_charge_defaut)) AS type_prise_charge_defaut,
        id_org_unit_attachement,
        maladies_chroniques,
        allergies,
        UPPER(TRIM(groupe_sanguin)) AS groupe_sanguin,
        UPPER(TRIM(statut_vital)) AS statut_vital,
        TRY_CAST(date_deces AS DATE) AS date_deces,
        cause_deces,
        metadata,
        CURRENT_TIMESTAMP() AS _ingested_at
    FROM {{ source('raw', 'raw_patients') }}
)

SELECT * FROM source