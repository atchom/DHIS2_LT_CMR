{{ config(materialized='table', schema='facts') }}

SELECT
    am.nom_maladie,
    dm.id_maladie,
    am.nb_alertes,
    am.total_cas_confirmes,
    am.total_deces,
    am.letalite_moyenne,
    am.letalite_calculee,
    am.alertes_niveau_pandemie,
    am.alertes_niveau_epidemie,
    am.alertes_niveau_alerte,
    am.alertes_cloturees,
    am.notifiees_oms,
    am.taux_attaque,
    am.niveau_alerte_majoritaire,
    am.taux_notification_oms,
    am.taux_cloture,
    am._ingested_at
FROM {{ ref('stg_alertes_par_maladie') }} am
LEFT JOIN {{ ref('dim_maladie') }} dm 
    ON UPPER(TRIM(am.nom_maladie)) = dm.nom_maladie