{{ config(materialized='table', schema='facts') }}

SELECT
    pz.region,
    pz.departement,
    pz.arrondissement,
    pz.commune,
    pz.quartier,
    pz.zone_residence,
    dg.id_geographie,
    pz.nb_patients,
    pz.nb_hommes,
    pz.nb_femmes,
    pz.age_moyen,
    pz.enfants_0_5,
    pz.personnes_agees_60_plus,
    pz._ingested_at
FROM {{ ref('stg_patients_par_zone') }} pz
LEFT JOIN {{ ref('dim_geographie') }} dg 
    ON UPPER(TRIM(pz.region)) = dg.region
    AND UPPER(TRIM(pz.departement)) = dg.departement
    AND UPPER(TRIM(pz.arrondissement)) = dg.arrondissement
    AND UPPER(TRIM(pz.commune)) = dg.commune
    AND UPPER(TRIM(pz.quartier)) = dg.quartier
    AND UPPER(TRIM(pz.zone_residence)) = dg.zone_residence