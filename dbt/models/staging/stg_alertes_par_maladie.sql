{{ config(materialized='table', schema='staging') }}

WITH source AS (
    SELECT
        -- Identification maladie
        UPPER(TRIM(nom_maladie)) AS nom_maladie,
        UPPER(TRIM(code_cim10)) AS code_cim10,
        
        -- Indicateurs d'alertes
        COALESCE(nb_alertes, 0) AS nb_alertes,
        
        -- Cas et décès
        COALESCE(total_cas_confirmes, 0) AS total_cas_confirmes,
        COALESCE(total_deces, 0) AS total_deces,
        
        -- Taux de létalité (NULL remplacé par 0)
        COALESCE(TRY_CAST(letalite_moyenne AS FLOAT), 0) AS letalite_moyenne,
        
        -- Niveaux d'alerte
        COALESCE(alertes_niveau_pandemie, 0) AS alertes_niveau_pandemie,
        COALESCE(alertes_niveau_epidemie, 0) AS alertes_niveau_epidemie,
        COALESCE(alertes_niveau_alerte, 0) AS alertes_niveau_alerte,
        COALESCE(alertes_cloturees, 0) AS alertes_cloturees,
        COALESCE(notifiees_oms, 0) AS notifiees_oms,
        
        -- Calculs additionnels
        CASE 
            WHEN nb_alertes > 0 
            THEN ROUND((total_cas_confirmes * 100.0) / nb_alertes, 2)
            ELSE 0
        END AS taux_attaque,
        
        -- Taux de létalité calculé (basé sur les chiffres réels)
        CASE 
            WHEN total_cas_confirmes > 0 
            THEN ROUND((total_deces * 100.0) / total_cas_confirmes, 2)
            ELSE 0
        END AS letalite_calculee,
        
        -- Niveau d'alerte majoritaire
        CASE 
            WHEN alertes_niveau_pandemie >= alertes_niveau_epidemie 
             AND alertes_niveau_pandemie >= alertes_niveau_alerte 
            THEN 'PANDEMIE'
            WHEN alertes_niveau_epidemie >= alertes_niveau_pandemie 
             AND alertes_niveau_epidemie >= alertes_niveau_alerte 
            THEN 'EPIDEMIE'
            WHEN alertes_niveau_alerte >= alertes_niveau_pandemie 
             AND alertes_niveau_alerte >= alertes_niveau_epidemie 
            THEN 'ALERTE'
            ELSE 'INCONNU'
        END AS niveau_alerte_majoritaire,
        
        -- Taux de notification à l'OMS
        CASE 
            WHEN nb_alertes > 0 
            THEN ROUND((notifiees_oms * 100.0) / nb_alertes, 2)
            ELSE 0
        END AS taux_notification_oms,
        
        -- Taux de clôture des alertes
        CASE 
            WHEN nb_alertes > 0 
            THEN ROUND((alertes_cloturees * 100.0) / nb_alertes, 2)
            ELSE 0
        END AS taux_cloture,
        
        -- Métadonnées
        CURRENT_TIMESTAMP() AS _ingested_at
    FROM {{ source('raw', 'raw_alertes_par_maladie') }}
)

SELECT * FROM source