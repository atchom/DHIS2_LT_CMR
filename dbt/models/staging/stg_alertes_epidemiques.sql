{{ config(materialized='table', schema='staging') }}

WITH source AS (
    SELECT
        -- Identifiants
        id_alerte,
        UPPER(TRIM(code_alerte)) AS code_alerte,
        
        -- Information maladie
        UPPER(TRIM(nom_maladie)) AS nom_maladie,
        UPPER(TRIM(code_cim10)) AS code_cim10,
        UPPER(TRIM(type_maladie)) AS type_maladie,
        
        -- Structure source
        UPPER(TRIM(structure_nom)) AS structure_nom,
        UPPER(TRIM(structure_code)) AS structure_code,
        UPPER(TRIM(structure_quartier)) AS structure_quartier,
        
        -- Dates
        TRY_CAST(date_alerte AS DATE) AS date_alerte,
        TRY_CAST(date_debut_symptomes AS DATE) AS date_debut_symptomes,
        TRY_CAST(date_premier_cas AS DATE) AS date_premier_cas,
        
        -- Calcul du délai entre premiers symptômes et alerte
        CASE 
            WHEN TRY_CAST(date_debut_symptomes AS DATE) IS NOT NULL 
             AND TRY_CAST(date_alerte AS DATE) IS NOT NULL
            THEN DATEDIFF(DAY, TRY_CAST(date_debut_symptomes AS DATE), TRY_CAST(date_alerte AS DATE))
            ELSE NULL
        END AS delai_alerte_jours,
        
        -- Cas (avec valeurs par défaut)
        COALESCE(nb_cas_suspects, 0) AS nb_cas_suspects,
        COALESCE(nb_cas_confirmes, 0) AS nb_cas_confirmes,
        COALESCE(nb_cas_probables, 0) AS nb_cas_probables,
        COALESCE(nb_deces, 0) AS nb_deces,
        COALESCE(nb_gueris, 0) AS nb_gueris,
        
        -- Taux de létalité (NULL remplacé par 0)
        COALESCE(TRY_CAST(taux_letalite AS FLOAT), 0) AS taux_letalite,
        
        -- Statistiques calculées
        CASE 
            WHEN nb_cas_confirmes > 0 
            THEN ROUND((nb_deces * 100.0) / nb_cas_confirmes, 2)
            ELSE 0
        END AS letalite_calculee,
        
        -- Taux de guérison
        CASE 
            WHEN nb_cas_confirmes > 0 
            THEN ROUND((nb_gueris * 100.0) / nb_cas_confirmes, 2)
            ELSE 0
        END AS taux_guerison,
        
        -- Taux de confirmation (confirmés / suspects)
        CASE 
            WHEN nb_cas_suspects > 0 
            THEN ROUND((nb_cas_confirmes * 100.0) / nb_cas_suspects, 2)
            ELSE 0
        END AS taux_confirmation,
        
        -- Niveau et statut
        UPPER(TRIM(niveau_alerte)) AS niveau_alerte,
        UPPER(TRIM(statut_alerte)) AS statut_alerte,
        
        -- Investigation
        UPPER(TRIM(investigation_realisee)) AS investigation_realisee,
        rapport_investigation,
        action_prise,
        mesures_pees,
        
        -- Notifications
        UPPER(TRIM(notifie_minsante)) AS notifie_minsante,
        TRY_CAST(date_notification AS DATE) AS date_notification,
        UPPER(TRIM(notifie_oms)) AS notifie_oms,
        
        -- Délai de notification
        CASE 
            WHEN TRY_CAST(date_alerte AS DATE) IS NOT NULL 
             AND TRY_CAST(date_notification AS DATE) IS NOT NULL
            THEN DATEDIFF(DAY, TRY_CAST(date_alerte AS DATE), TRY_CAST(date_notification AS DATE))
            ELSE NULL
        END AS delai_notification_jours,
        
        -- Géolocalisation
        alerte_longitude,
        alerte_latitude,
        rayon_alerte_km,
        
        -- Population exposée
        COALESCE(population_exposee, 0) AS population_exposee,
        COALESCE(menages_exposes, 0) AS menages_exposes,
        
        -- Densité estimée (personnes/ménage)
        CASE 
            WHEN menages_exposes > 0 AND population_exposee > 0
            THEN ROUND(population_exposee / menages_exposes, 2)
            ELSE NULL
        END AS personnes_par_menage,
        
        -- Source information
        source_information,
        
        -- Métadonnées
        metadata,
        CURRENT_TIMESTAMP() AS _ingested_at
    FROM {{ source('raw', 'raw_alertes_epidemiques') }}
)

SELECT * FROM source