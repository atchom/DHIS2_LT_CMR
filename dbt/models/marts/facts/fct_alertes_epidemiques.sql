{{ config(materialized='table', schema='facts') }}

WITH alertes AS (
    SELECT
        a.id_alerte,
        dg.id_geographie,
        dm.id_maladie,
        dt_alerte.id_temps AS id_temps_alerte,
        dt_notif.id_temps AS id_temps_notification,
        a.structure_nom,
        a.structure_code,
        a.nb_cas_suspects,
        a.nb_cas_confirmes,
        a.nb_cas_probables,
        a.nb_deces,
        a.nb_gueris,
        a.letalite_calculee,
        a.taux_guerison,
        a.taux_confirmation,
        a.niveau_alerte,
        a.statut_alerte,
        a.investigation_realisee,
        a.notifie_minsante,
        a.notifie_oms,
        a.delai_alerte_jours,
        a.delai_notification_jours,
        a.rayon_alerte_km,
        a.population_exposee,
        a.menages_exposes,
        a.personnes_par_menage,
        a._ingested_at
    FROM {{ ref('stg_alertes_epidemiques') }} a
    LEFT JOIN {{ ref('dim_geographie') }} dg 
        ON UPPER(TRIM(a.structure_quartier)) = dg.quartier 
    LEFT JOIN {{ ref('dim_maladie') }} dm 
        ON UPPER(TRIM(a.nom_maladie)) = dm.nom_maladie
    LEFT JOIN {{ ref('dim_temps') }} dt_alerte 
        ON a.date_alerte = dt_alerte.date_complete
    LEFT JOIN {{ ref('dim_temps') }} dt_notif 
        ON a.date_notification = dt_notif.date_complete
)

SELECT * FROM alertes