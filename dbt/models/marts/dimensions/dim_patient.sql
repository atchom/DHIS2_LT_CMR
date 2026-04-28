{{ config(materialized='table', schema='dimensions') }}

WITH patients AS (
    SELECT
        id_patient,
        code_patient,
        nin,
        date_naissance,
        age_ans,
        sexe,
        CASE 
            WHEN age_ans < 5 THEN '0-4 ans'
            WHEN age_ans < 15 THEN '5-14 ans'
            WHEN age_ans < 30 THEN '15-29 ans'
            WHEN age_ans < 45 THEN '30-44 ans'
            WHEN age_ans < 60 THEN '45-59 ans'
            ELSE '60+ ans'
        END AS tranche_age,
        profession,
        statut_socio_pro,
        niveau_education,
        mutuelle,
        type_prise_charge_defaut,
        maladies_chroniques,
        allergies,
        groupe_sanguin,
        statut_vital,
        date_deces,
        cause_deces,
        _ingested_at
    FROM {{ ref('stg_patients') }}
)

SELECT * FROM patients