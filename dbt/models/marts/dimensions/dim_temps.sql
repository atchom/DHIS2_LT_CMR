{{ config(materialized='table', schema='dimensions') }}

WITH dates AS (
    -- Génération des dates à partir des différentes sources
    SELECT DISTINCT date_alerte AS date_evt FROM {{ ref('stg_alertes_epidemiques') }} WHERE date_alerte IS NOT NULL
    UNION
    SELECT DISTINCT date_notification FROM {{ ref('stg_alertes_epidemiques') }} WHERE date_notification IS NOT NULL
    UNION
    SELECT DISTINCT date_debut_symptomes FROM {{ ref('stg_alertes_epidemiques') }} WHERE date_debut_symptomes IS NOT NULL
    UNION
    SELECT DISTINCT date_creation FROM {{ ref('stg_structures_sante') }} WHERE date_creation IS NOT NULL
),

date_dim AS (
    SELECT
        TO_NUMBER(TO_VARCHAR(date_evt, 'YYYYMMDD')) AS id_temps,
        date_evt AS date_complete,
        EXTRACT(YEAR FROM date_evt) AS annee,
        EXTRACT(MONTH FROM date_evt) AS mois,
        EXTRACT(DAY FROM date_evt) AS jour,
        EXTRACT(QUARTER FROM date_evt) AS trimestre,
        TO_VARCHAR(date_evt, 'MMMM') AS nom_mois,
        TO_VARCHAR(date_evt, 'DAY') AS nom_jour,
        CASE 
            WHEN EXTRACT(MONTH FROM date_evt) IN (12, 1, 2) THEN 'HIVER'
            WHEN EXTRACT(MONTH FROM date_evt) IN (3, 4, 5) THEN 'PRINTEMPS'
            WHEN EXTRACT(MONTH FROM date_evt) IN (6, 7, 8) THEN 'ETE'
            ELSE 'AUTOMNE'
        END AS saison,
        EXTRACT(WEEK FROM date_evt) AS semaine_annee,
        DATEDIFF(YEAR, date_evt, CURRENT_DATE()) AS nb_annees_ecoulees
    FROM dates
)

SELECT * FROM date_dim
ORDER BY date_complete