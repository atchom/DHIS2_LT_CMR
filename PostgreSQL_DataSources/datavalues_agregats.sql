select * from datavalues_agregats
-- ============================================================
-- AJOUT DES DATA_ELEMENTS MANQUANTS
-- ============================================================

-- Ajouter PERF_TAUX_CESARIENNE s'il n'existe pas
INSERT INTO data_elements (code, nom, description, type_donnee, unite_mesure, seuil_alerte, seuil_epidemique, seuil_critique, categorie_principale, public_cible, prive_cible, actif, formule_calcul)
SELECT 'PERF_TAUX_CESARIENNE', 'Taux de césarienne (%)', 'Pourcentage d''accouchements par césarienne sur total accouchements', 'percentage', '%', 15, 20, 25, 'sexe', TRUE, TRUE, TRUE, '(HOSP_CESARIENNE / HOSP_ACCOUCHEMENT_TOTAL) * 100'
WHERE NOT EXISTS (SELECT 1 FROM data_elements WHERE code='PERF_TAUX_CESARIENNE');

-- Ajouter MAT_CPN_COUV s'il n'existe pas
INSERT INTO data_elements (code, nom, description, type_donnee, unite_mesure, seuil_alerte, seuil_epidemique, seuil_critique, categorie_principale, public_cible, prive_cible, actif, formule_calcul)
SELECT 'MAT_CPN_COUV', 'Couverture CPN4 (%)', 'Pourcentage de femmes avec CPN4 sur total accouchements', 'percentage', '%', 50, 70, 80, 'sexe', TRUE, TRUE, TRUE, '(MAT_CPN4 / MAT_CPN1) * 100'
WHERE NOT EXISTS (SELECT 1 FROM data_elements WHERE code='MAT_CPN_COUV');

-- Ajouter REMONTEE_VALIDEE s'il n'existe pas
INSERT INTO data_elements (code, nom, description, type_donnee, unite_mesure, seuil_alerte, seuil_epidemique, seuil_critique, categorie_principale, public_cible, prive_cible, actif)
SELECT 'REMONTEE_VALIDEE', 'Remontées de données validées', 'Nombre de rapports mensuels validés', 'integer', 'rapports', NULL, NULL, NULL, 'aucun', TRUE, TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM data_elements WHERE code='REMONTEE_VALIDEE');

-- Ajouter REMONTEE_DELAI s'il n'existe pas
INSERT INTO data_elements (code, nom, description, type_donnee, unite_mesure, seuil_alerte, seuil_epidemique, seuil_critique, categorie_principale, public_cible, prive_cible, actif)
SELECT 'REMONTEE_DELAI', 'Respect des délais de remontée (%)', 'Pourcentage de remontées faites avant la date limite', 'percentage', '%', 80, NULL, NULL, 'aucun', TRUE, TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM data_elements WHERE code='REMONTEE_DELAI');

-- ============================================================
-- VÉRIFICATION DES DATA_ELEMENTS EXISTANTS
-- ============================================================

-- Vérifier que tous les data_elements utilisés existent
DO $$
DECLARE
    missing_elements TEXT[];
BEGIN
    -- Liste des codes à vérifier
    WITH codes_to_check AS (
        SELECT unnest(ARRAY[
            'CONSULT_TOTAL', 'CONSULT_NEW', 'CONSULT_URGENCE', 'CONSULT_REFEREE', 'CONSULT_RECUE',
            'PALU_SIMPLE', 'PALU_GRAVE', 'PALU_DECES',
            'IRA_SIMPLE', 'IRA_GRAVE',
            'DIAR_SIMPLE', 'DIAR_DEHYD', 'CHOLERA_SUSPECT', 'CHOLERA_CONF',
            'LITT_INNONDATION', 'LITT_ZONE_PORT', 'LITT_ZONE_INDUST', 'LITT_PECHE',
            'LITT_REF_PUB_PRI', 'LITT_REF_PRI_PUB',
            'NUT_MAS', 'NUT_MAM', 'NUT_MARASME', 'NUT_KWASH', 'NUT_DEPISTE',
            'VAC_BCG', 'VAC_PENTA1', 'VAC_PENTA3', 'VAC_ROUGE', 'VAC_FIERR', 'VAC_COUV_PENTA',
            'MAT_CPN1', 'MAT_CPN4', 'MAT_DECES_MATERNEL', 'MAT_DECES_NEONATAL',
            'HOSP_ADMIS', 'HOSP_JOURNEES', 'HOSP_DECES', 'HOSP_ACCOUCHEMENT', 'HOSP_CESARIENNE', 'HOSP_ACCOUCHEMENT_TOTAL',
            'VIH_NOUVEAU', 'VIH_SUIVI', 'TUBERCULOSE_NOUVEAU', 'ART_DISPENSE', 'ACT_DISPENSE',
            'PERF_TAUX_OCC', 'PERF_DELAI_ATTENTE', 'PERF_SATISFACTION', 'PERF_TABLE_OPS', 'PERF_LABO', 'PERF_IMAGERIE',
            'PERF_TAUX_CESARIENNE', 'MAT_CPN_COUV', 'REMONTEE_VALIDEE', 'REMONTEE_DELAI',
            'STOCK_ALERTE', 'STOCK_RUPTURE', 'STOCK_PEREMPTION'
        ]) AS code
    )
    SELECT array_agg(code) INTO missing_elements
    FROM codes_to_check c
    WHERE NOT EXISTS (SELECT 1 FROM data_elements d WHERE d.code = c.code);
    
    IF array_length(missing_elements, 1) > 0 THEN
        RAISE NOTICE 'Data elements manquants: %', missing_elements;
    ELSE
        RAISE NOTICE 'Tous les data_elements existent';
    END IF;
END $$;

-- ============================================================
-- AGRÉGATIONS ANNUELLES CORRIGÉES
-- ============================================================

-- District Douala 1 - Totaux annuels
INSERT INTO datavalues_agregats (id_data_element, id_org_unit, date_debut, date_fin, type_periode, valeur_numerique, valeur_texte, id_category, source_donnee, date_saisie, commentaire, metadata) VALUES
((SELECT id_data_element FROM data_elements WHERE code='CONSULT_TOTAL'), 1, '2026-01-01', '2026-12-31', 'yearly', 34280, NULL, NULL, 'aggregation_auto', CURRENT_TIMESTAMP, 'Total consultations 2026 - District Douala 1', '{"moyenne_mensuelle": 2857}'::jsonb),
((SELECT id_data_element FROM data_elements WHERE code='PALU_SIMPLE'), 1, '2026-01-01', '2026-12-31', 'yearly', 5213, NULL, NULL, 'aggregation_auto', CURRENT_TIMESTAMP, 'Total paludisme 2026', '{"taux_attaque": 12.5, "pic_max_mai": 650}'::jsonb),
((SELECT id_data_element FROM data_elements WHERE code='PALU_GRAVE'), 1, '2026-01-01', '2026-12-31', 'yearly', 248, NULL, NULL, 'aggregation_auto', CURRENT_TIMESTAMP, 'Formes graves 2026', NULL),
((SELECT id_data_element FROM data_elements WHERE code='IRA_SIMPLE'), 1, '2026-01-01', '2026-12-31', 'yearly', 4215, NULL, NULL, 'aggregation_auto', CURRENT_TIMESTAMP, 'Total IRA 2026', NULL),
((SELECT id_data_element FROM data_elements WHERE code='DIAR_SIMPLE'), 1, '2026-01-01', '2026-12-31', 'yearly', 2862, NULL, NULL, 'aggregation_auto', CURRENT_TIMESTAMP, 'Total diarrhées 2026', NULL),
((SELECT id_data_element FROM data_elements WHERE code='HOSP_ADMIS'), 1, '2026-01-01', '2026-12-31', 'yearly', 2150, NULL, NULL, 'aggregation_auto', CURRENT_TIMESTAMP, 'Hospitalisations 2026', NULL),
((SELECT id_data_element FROM data_elements WHERE code='HOSP_DECES'), 1, '2026-01-01', '2026-12-31', 'yearly', 42, NULL, NULL, 'aggregation_auto', CURRENT_TIMESTAMP, 'Décès hospitaliers 2026', NULL);

-- Indicateurs calculés - Qualité (avec vérification que les data_elements existent)
INSERT INTO datavalues_agregats (id_data_element, id_org_unit, date_debut, date_fin, type_periode, valeur_numerique, valeur_texte, id_category, source_donnee, date_saisie, commentaire, metadata)
SELECT 
    d.id_data_element, 
    1, 
    '2026-01-01', 
    '2026-12-31', 
    'yearly', 
    CASE 
        WHEN d.code = 'PERF_TAUX_CESARIENNE' THEN 26.8
        WHEN d.code = 'MAT_CPN_COUV' THEN 65.2
        WHEN d.code = 'VAC_COUV_PENTA' THEN 78.5
        WHEN d.code = 'REMONTEE_DELAI' THEN 83.3
    END,
    NULL,
    NULL,
    'aggregation_auto',
    CURRENT_TIMESTAMP,
    CASE 
        WHEN d.code = 'PERF_TAUX_CESARIENNE' THEN 'Taux césarienne 2026'
        WHEN d.code = 'MAT_CPN_COUV' THEN 'Couverture CPN4 2026'
        WHEN d.code = 'VAC_COUV_PENTA' THEN 'Couverture Penta3 2026'
        WHEN d.code = 'REMONTEE_DELAI' THEN '10/12 mois dans délai'
    END,
    CASE 
        WHEN d.code = 'PERF_TAUX_CESARIENNE' THEN '{"national_benchmark": "15-20%"}'::jsonb
        WHEN d.code = 'VAC_COUV_PENTA' THEN '{"objectif": "95%"}'::jsonb
        ELSE NULL
    END
FROM data_elements d
WHERE d.code IN ('PERF_TAUX_CESARIENNE', 'MAT_CPN_COUV', 'VAC_COUV_PENTA', 'REMONTEE_DELAI')
AND EXISTS (SELECT 1 FROM data_elements WHERE code = d.code);

-- REMONTEE_VALIDEE (différent des autres car valeur différente)
INSERT INTO datavalues_agregats (id_data_element, id_org_unit, date_debut, date_fin, type_periode, valeur_numerique, valeur_texte, id_category, source_donnee, date_saisie, commentaire, metadata)
SELECT 
    id_data_element, 
    1, 
    '2026-01-01', 
    '2026-12-31', 
    'yearly', 
    11, 
    NULL, 
    NULL, 
    'saisie_manuelle', 
    CURRENT_TIMESTAMP, 
    '11/12 rapports validés', 
    NULL
FROM data_elements 
WHERE code = 'REMONTEE_VALIDEE'
AND EXISTS (SELECT 1 FROM data_elements WHERE code = 'REMONTEE_VALIDEE');

-- ============================================================
-- CORRECTION DE MAT_CPN_COUV DANS LA SECTION MATERNITÉ
-- ============================================================

-- Supprimer la ligne problématique de MAT_CPN_COUV si elle existe déjà
DELETE FROM datavalues_agregats 
WHERE id_data_element IN (SELECT id_data_element FROM data_elements WHERE code='MAT_CPN_COUV')
AND date_debut = '2026-01-01' AND date_fin = '2026-12-31';

-- Réinsérer avec la bonne valeur
INSERT INTO datavalues_agregats (id_data_element, id_org_unit, date_debut, date_fin, type_periode, valeur_numerique, valeur_texte, id_category, source_donnee, date_saisie, commentaire, metadata)
SELECT 
    id_data_element, 
    1, 
    '2026-01-01', 
    '2026-12-31', 
    'yearly', 
    65.2, 
    NULL, 
    NULL, 
    'aggregation_auto', 
    CURRENT_TIMESTAMP, 
    'Couverture CPN4 2026', 
    NULL
FROM data_elements 
WHERE code = 'MAT_CPN_COUV';

-- ============================================================
-- INSERTION COMPLÈTE DES VALEURS AGREGÉES (DATAVALUES_AGREGATS)
-- Littoral Cameroun - Données terrain réalistes
-- Période : Janvier à Décembre 2026
-- Structures : District Douala 1, Hôpital Laquintinie, Hôpital Général, District Nkongsamba, District Edéa
-- ============================================================

-- ============================================================
-- STRUCTURES DE SANTÉ (IDs à ajuster selon votre table)
-- 1 = District Douala 1
-- 2 = Hôpital Laquintinie
-- 3 = Hôpital Général de Douala
-- 4 = District Nkongsamba (Moungo)
-- 5 = District Edéa (Sanaga-Maritime)
-- ============================================================

-- ============================================================
-- TRIMESTRE 1 : JANVIER - MARS 2026 (Saison sèche)
-- ============================================================

-- ============================================================
-- CONSULTATIONS T1
-- ============================================================

-- District Douala 1
INSERT INTO datavalues_agregats (id_data_element, id_org_unit, date_debut, date_fin, type_periode, valeur_numerique, valeur_texte, id_category, source_donnee, date_saisie, commentaire, metadata) VALUES
-- Janvier
((SELECT id_data_element FROM data_elements WHERE code='CONSULT_TOTAL'), 1, '2026-01-01', '2026-01-31', 'monthly', 1250, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, 'Total consultations Janvier', NULL),
((SELECT id_data_element FROM data_elements WHERE code='CONSULT_NEW'), 1, '2026-01-01', '2026-01-31', 'monthly', 890, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, 'Nouveaux consultants', NULL),
((SELECT id_data_element FROM data_elements WHERE code='CONSULT_URGENCE'), 1, '2026-01-01', '2026-01-31', 'monthly', 345, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, 'Passages aux urgences', NULL),
-- Février
((SELECT id_data_element FROM data_elements WHERE code='CONSULT_TOTAL'), 1, '2026-02-01', '2026-02-28', 'monthly', 2580, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, 'Total consultations Février', NULL),
((SELECT id_data_element FROM data_elements WHERE code='CONSULT_URGENCE'), 1, '2026-02-01', '2026-02-28', 'monthly', 402, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, NULL, NULL),
-- Mars
((SELECT id_data_element FROM data_elements WHERE code='CONSULT_TOTAL'), 1, '2026-03-01', '2026-03-31', 'monthly', 2980, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, 'Hausse due aux inondations débutantes', NULL);

-- Hôpital Laquintinie
INSERT INTO datavalues_agregats (id_data_element, id_org_unit, date_debut, date_fin, type_periode, valeur_numerique, valeur_texte, id_category, source_donnee, date_saisie, commentaire, metadata) VALUES
((SELECT id_data_element FROM data_elements WHERE code='CONSULT_TOTAL'), 2, '2026-01-01', '2026-01-31', 'monthly', 3200, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, 'Hôpital Laquintinie Janvier', NULL),
((SELECT id_data_element FROM data_elements WHERE code='CONSULT_TOTAL'), 2, '2026-02-01', '2026-02-28', 'monthly', 3450, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, NULL, NULL),
((SELECT id_data_element FROM data_elements WHERE code='CONSULT_TOTAL'), 2, '2026-03-01', '2026-03-31', 'monthly', 4100, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, 'Afflux lié aux inondations', NULL);

-- Hôpital Général de Douala
INSERT INTO datavalues_agregats (id_data_element, id_org_unit, date_debut, date_fin, type_periode, valeur_numerique, valeur_texte, id_category, source_donnee, date_saisie, commentaire, metadata) VALUES
((SELECT id_data_element FROM data_elements WHERE code='CONSULT_TOTAL'), 3, '2026-01-01', '2026-01-31', 'monthly', 2800, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, 'Hôpital Général Janvier', NULL),
((SELECT id_data_element FROM data_elements WHERE code='CONSULT_TOTAL'), 3, '2026-02-01', '2026-02-28', 'monthly', 3100, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, NULL, NULL),
((SELECT id_data_element FROM data_elements WHERE code='CONSULT_TOTAL'), 3, '2026-03-01', '2026-03-31', 'monthly', 3650, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, NULL, NULL);

-- ============================================================
-- PALUDISME T1
-- ============================================================

-- District Douala 1
INSERT INTO datavalues_agregats (id_data_element, id_org_unit, date_debut, date_fin, type_periode, valeur_numerique, valeur_texte, id_category, source_donnee, date_saisie, commentaire, metadata) VALUES
-- Janvier (saison sèche - paludisme modéré)
((SELECT id_data_element FROM data_elements WHERE code='PALU_SIMPLE'), 1, '2026-01-01', '2026-01-31', 'monthly', 313, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, NULL, NULL),
((SELECT id_data_element FROM data_elements WHERE code='PALU_GRAVE'), 1, '2026-01-01', '2026-01-31', 'monthly', 12, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, NULL, NULL),
((SELECT id_data_element FROM data_elements WHERE code='PALU_DECES'), 1, '2026-01-01', '2026-01-31', 'monthly', 1, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, 'Enfant de 2 ans', NULL),
-- Février
((SELECT id_data_element FROM data_elements WHERE code='PALU_SIMPLE'), 1, '2026-02-01', '2026-02-28', 'monthly', 310, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, 'Légère hausse', NULL),
((SELECT id_data_element FROM data_elements WHERE code='PALU_GRAVE'), 1, '2026-02-01', '2026-02-28', 'monthly', 11, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, NULL, NULL),
-- Mars (début saison pluies)
((SELECT id_data_element FROM data_elements WHERE code='PALU_SIMPLE'), 1, '2026-03-01', '2026-03-31', 'monthly', 425, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, 'Pic paludique lié aux eaux stagnantes', NULL),
((SELECT id_data_element FROM data_elements WHERE code='PALU_GRAVE'), 1, '2026-03-01', '2026-03-31', 'monthly', 19, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, 'Hausse significative', NULL);

-- Hôpital Laquintinie
INSERT INTO datavalues_agregats (id_data_element, id_org_unit, date_debut, date_fin, type_periode, valeur_numerique, valeur_texte, id_category, source_donnee, date_saisie, commentaire, metadata) VALUES
((SELECT id_data_element FROM data_elements WHERE code='PALU_SIMPLE'), 2, '2026-01-01', '2026-01-31', 'monthly', 520, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, NULL, NULL),
((SELECT id_data_element FROM data_elements WHERE code='PALU_SIMPLE'), 2, '2026-02-01', '2026-02-28', 'monthly', 545, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, NULL, NULL),
((SELECT id_data_element FROM data_elements WHERE code='PALU_SIMPLE'), 2, '2026-03-01', '2026-03-31', 'monthly', 720, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, 'Hausse post-inondations', NULL),
((SELECT id_data_element FROM data_elements WHERE code='PALU_GRAVE'), 2, '2026-03-01', '2026-03-31', 'monthly', 28, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, NULL, NULL);

-- ============================================================
-- INFECTIONS RESPIRATOIRES T1
-- ============================================================

INSERT INTO datavalues_agregats (id_data_element, id_org_unit, date_debut, date_fin, type_periode, valeur_numerique, valeur_texte, id_category, source_donnee, date_saisie, commentaire, metadata) VALUES
-- District Douala 1
((SELECT id_data_element FROM data_elements WHERE code='IRA_SIMPLE'), 1, '2026-01-01', '2026-01-31', 'monthly', 395, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, NULL, NULL),
((SELECT id_data_element FROM data_elements WHERE code='IRA_SIMPLE'), 1, '2026-02-01', '2026-02-28', 'monthly', 380, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, NULL, NULL),
((SELECT id_data_element FROM data_elements WHERE code='IRA_SIMPLE'), 1, '2026-03-01', '2026-03-31', 'monthly', 420, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, NULL, NULL),
((SELECT id_data_element FROM data_elements WHERE code='IRA_GRAVE'), 1, '2026-01-01', '2026-01-31', 'monthly', 20, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, NULL, NULL),
-- Hôpital Général
((SELECT id_data_element FROM data_elements WHERE code='IRA_SIMPLE'), 3, '2026-01-01', '2026-01-31', 'monthly', 620, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, NULL, NULL),
((SELECT id_data_element FROM data_elements WHERE code='IRA_GRAVE'), 3, '2026-01-01', '2026-01-31', 'monthly', 35, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, NULL, NULL);

-- ============================================================
-- DIARRHÉES T1
-- ============================================================

INSERT INTO datavalues_agregats (id_data_element, id_org_unit, date_debut, date_fin, type_periode, valeur_numerique, valeur_texte, id_category, source_donnee, date_saisie, commentaire, metadata) VALUES
((SELECT id_data_element FROM data_elements WHERE code='DIAR_SIMPLE'), 1, '2026-01-01', '2026-01-31', 'monthly', 95, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, NULL, NULL),
((SELECT id_data_element FROM data_elements WHERE code='DIAR_SIMPLE'), 1, '2026-02-01', '2026-02-28', 'monthly', 102, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, NULL, NULL),
((SELECT id_data_element FROM data_elements WHERE code='DIAR_SIMPLE'), 1, '2026-03-01', '2026-03-31', 'monthly', 245, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, 'Augmentation post-inondations', NULL),
((SELECT id_data_element FROM data_elements WHERE code='DIAR_DEHYD'), 1, '2026-03-01', '2026-03-31', 'monthly', 28, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, 'Cas graves', NULL);

-- ============================================================
-- TRIMESTRE 2 : AVRIL - JUIN 2026 (Saison des pluies intense)
-- ============================================================

-- ============================================================
-- PALUDISME T2 (PIC ÉPIDÉMIQUE)
-- ============================================================

INSERT INTO datavalues_agregats (id_data_element, id_org_unit, date_debut, date_fin, type_periode, valeur_numerique, valeur_texte, id_category, source_donnee, date_saisie, commentaire, metadata) VALUES
-- District Douala 1 - Pic paludique
((SELECT id_data_element FROM data_elements WHERE code='PALU_SIMPLE'), 1, '2026-04-01', '2026-04-30', 'monthly', 580, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, 'Pic saisonnier - ALERTE', '{"niveau_alerte": "alerte"}'::jsonb),
((SELECT id_data_element FROM data_elements WHERE code='PALU_SIMPLE'), 1, '2026-05-01', '2026-05-31', 'monthly', 650, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, 'Pic maximum - ÉPIDÉMIE', '{"niveau_alerte": "epidemique"}'::jsonb),
((SELECT id_data_element FROM data_elements WHERE code='PALU_SIMPLE'), 1, '2026-06-01', '2026-06-30', 'monthly', 590, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, 'Légère baisse', NULL),
((SELECT id_data_element FROM data_elements WHERE code='PALU_GRAVE'), 1, '2026-04-01', '2026-04-30', 'monthly', 32, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, NULL, NULL),
((SELECT id_data_element FROM data_elements WHERE code='PALU_GRAVE'), 1, '2026-05-01', '2026-05-31', 'monthly', 45, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, 'Pic formes graves', NULL),
((SELECT id_data_element FROM data_elements WHERE code='PALU_GRAVE'), 1, '2026-06-01', '2026-06-30', 'monthly', 38, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, NULL, NULL),
((SELECT id_data_element FROM data_elements WHERE code='PALU_DECES'), 1, '2026-05-01', '2026-05-31', 'monthly', 3, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, '2 enfants 0-5, 1 adulte', NULL);

-- Hôpital Laquintinie - T2
INSERT INTO datavalues_agregats (id_data_element, id_org_unit, date_debut, date_fin, type_periode, valeur_numerique, valeur_texte, id_category, source_donnee, date_saisie, commentaire, metadata) VALUES
((SELECT id_data_element FROM data_elements WHERE code='PALU_SIMPLE'), 2, '2026-04-01', '2026-04-30', 'monthly', 980, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, 'Surcharge hospitalière', NULL),
((SELECT id_data_element FROM data_elements WHERE code='PALU_SIMPLE'), 2, '2026-05-01', '2026-05-31', 'monthly', 1120, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, 'Record de cas', '{"niveau_alerte": "critique"}'::jsonb),
((SELECT id_data_element FROM data_elements WHERE code='PALU_SIMPLE'), 2, '2026-06-01', '2026-06-30', 'monthly', 1050, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, NULL, NULL),
((SELECT id_data_element FROM data_elements WHERE code='PALU_GRAVE'), 2, '2026-05-01', '2026-05-31', 'monthly', 52, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, NULL, NULL);

-- ============================================================
-- DIARRHÉES T2 (pic maladies hydriques)
-- ============================================================

INSERT INTO datavalues_agregats (id_data_element, id_org_unit, date_debut, date_fin, type_periode, valeur_numerique, valeur_texte, id_category, source_donnee, date_saisie, commentaire, metadata) VALUES
((SELECT id_data_element FROM data_elements WHERE code='DIAR_SIMPLE'), 1, '2026-04-01', '2026-04-30', 'monthly', 310, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, 'Fortes pluies', NULL),
((SELECT id_data_element FROM data_elements WHERE code='DIAR_SIMPLE'), 1, '2026-05-01', '2026-05-31', 'monthly', 380, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, 'Inondations généralisées', NULL),
((SELECT id_data_element FROM data_elements WHERE code='DIAR_SIMPLE'), 1, '2026-06-01', '2026-06-30', 'monthly', 350, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, NULL, NULL),
((SELECT id_data_element FROM data_elements WHERE code='DIAR_DEHYD'), 1, '2026-05-01', '2026-05-31', 'monthly', 42, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, 'Déshydratation sévère', NULL),
((SELECT id_data_element FROM data_elements WHERE code='CHOLERA_SUSPECT'), 1, '2026-05-01', '2026-05-31', 'monthly', 5, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, 'Cas suspects dans zone inondable', NULL),
((SELECT id_data_element FROM data_elements WHERE code='CHOLERA_CONF'), 1, '2026-05-01', '2026-05-31', 'monthly', 2, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, 'Confirmés labo - Foyer à Bépanda', NULL);

-- ============================================================
-- LITT_INNONDATION (spécifique Littoral T2)
-- ============================================================

INSERT INTO datavalues_agregats (id_data_element, id_org_unit, date_debut, date_fin, type_periode, valeur_numerique, valeur_texte, id_category, source_donnee, date_saisie, commentaire, metadata) VALUES
((SELECT id_data_element FROM data_elements WHERE code='LITT_INNONDATION'), 1, '2026-04-01', '2026-04-30', 'monthly', 145, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, 'Traumatismes + noyades', NULL),
((SELECT id_data_element FROM data_elements WHERE code='LITT_INNONDATION'), 1, '2026-05-01', '2026-05-31', 'monthly', 230, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, 'Fortes inondations zone PK9', NULL),
((SELECT id_data_element FROM data_elements WHERE code='LITT_INNONDATION'), 2, '2026-05-01', '2026-05-31', 'monthly', 180, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, NULL, NULL),
((SELECT id_data_element FROM data_elements WHERE code='LITT_ZONE_PORT'), 1, '2026-04-01', '2026-06-30', 'quarterly', 520, NULL, (SELECT id_category FROM category_options WHERE code='PORTUAIRE' AND type_categorie='socio_pro'), 'saisie_manuelle', CURRENT_TIMESTAMP, 'Zone portuaire', NULL),
((SELECT id_data_element FROM data_elements WHERE code='LITT_ZONE_INDUST'), 1, '2026-04-01', '2026-06-30', 'quarterly', 430, NULL, (SELECT id_category FROM category_options WHERE code='OUVRIER' AND type_categorie='socio_pro'), 'saisie_manuelle', CURRENT_TIMESTAMP, 'Zone industrielle Bassa', NULL);

-- ============================================================
-- TRIMESTRE 3 : JUILLET - SEPTEMBRE 2026
-- ============================================================

INSERT INTO datavalues_agregats (id_data_element, id_org_unit, date_debut, date_fin, type_periode, valeur_numerique, valeur_texte, id_category, source_donnee, date_saisie, commentaire, metadata) VALUES
-- Paludisme T3 (baisse progressive)
((SELECT id_data_element FROM data_elements WHERE code='PALU_SIMPLE'), 1, '2026-07-01', '2026-07-31', 'monthly', 520, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, 'Baisse post-épidémie', NULL),
((SELECT id_data_element FROM data_elements WHERE code='PALU_SIMPLE'), 1, '2026-08-01', '2026-08-31', 'monthly', 420, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, NULL, NULL),
((SELECT id_data_element FROM data_elements WHERE code='PALU_SIMPLE'), 1, '2026-09-01', '2026-09-30', 'monthly', 380, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, 'Retour à niveau normal', NULL),
((SELECT id_data_element FROM data_elements WHERE code='PALU_GRAVE'), 1, '2026-07-01', '2026-07-31', 'monthly', 28, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, NULL, NULL),
((SELECT id_data_element FROM data_elements WHERE code='PALU_GRAVE'), 1, '2026-08-01', '2026-08-31', 'monthly', 18, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, NULL, NULL),

-- IRA T3 (saison froide)
((SELECT id_data_element FROM data_elements WHERE code='IRA_SIMPLE'), 1, '2026-07-01', '2026-07-31', 'monthly', 350, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, 'Pic infections respiratoires', NULL),
((SELECT id_data_element FROM data_elements WHERE code='IRA_SIMPLE'), 1, '2026-08-01', '2026-08-31', 'monthly', 380, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, NULL, NULL),
((SELECT id_data_element FROM data_elements WHERE code='IRA_SIMPLE'), 1, '2026-09-01', '2026-09-30', 'monthly', 340, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, NULL, NULL),
((SELECT id_data_element FROM data_elements WHERE code='IRA_GRAVE'), 1, '2026-08-01', '2026-08-31', 'monthly', 22, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, NULL, NULL),

-- Diarrhées T3 (baisse)
((SELECT id_data_element FROM data_elements WHERE code='DIAR_SIMPLE'), 1, '2026-07-01', '2026-07-31', 'monthly', 280, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, NULL, NULL),
((SELECT id_data_element FROM data_elements WHERE code='DIAR_SIMPLE'), 1, '2026-08-01', '2026-08-31', 'monthly', 220, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, NULL, NULL),
((SELECT id_data_element FROM data_elements WHERE code='DIAR_SIMPLE'), 1, '2026-09-01', '2026-09-30', 'monthly', 180, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, NULL, NULL);

-- ============================================================
-- TRIMESTRE 4 : OCTOBRE - DÉCEMBRE 2026
-- ============================================================

INSERT INTO datavalues_agregats (id_data_element, id_org_unit, date_debut, date_fin, type_periode, valeur_numerique, valeur_texte, id_category, source_donnee, date_saisie, commentaire, metadata) VALUES
-- Paludisme T4 (niveau bas)
((SELECT id_data_element FROM data_elements WHERE code='PALU_SIMPLE'), 1, '2026-10-01', '2026-10-31', 'monthly', 310, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, 'Saison sèche - baisse', NULL),
((SELECT id_data_element FROM data_elements WHERE code='PALU_SIMPLE'), 1, '2026-11-01', '2026-11-30', 'monthly', 280, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, NULL, NULL),
((SELECT id_data_element FROM data_elements WHERE code='PALU_SIMPLE'), 1, '2026-12-01', '2026-12-31', 'monthly', 260, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, 'Niveau annuel le plus bas', NULL),
((SELECT id_data_element FROM data_elements WHERE code='PALU_GRAVE'), 1, '2026-10-01', '2026-12-31', 'quarterly', 25, NULL, NULL, 'aggregation_auto', CURRENT_TIMESTAMP, 'Agrégation trimestrielle', NULL),

-- Consultations T4 (hausse décembre)
((SELECT id_data_element FROM data_elements WHERE code='CONSULT_TOTAL'), 1, '2026-10-01', '2026-10-31', 'monthly', 2650, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, NULL, NULL),
((SELECT id_data_element FROM data_elements WHERE code='CONSULT_TOTAL'), 1, '2026-11-01', '2026-11-30', 'monthly', 2720, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, NULL, NULL),
((SELECT id_data_element FROM data_elements WHERE code='CONSULT_TOTAL'), 1, '2026-12-01', '2026-12-31', 'monthly', 3450, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, 'Hausse accidents de la route + fêtes', NULL),
((SELECT id_data_element FROM data_elements WHERE code='CONSULT_URGENCE'), 1, '2026-12-01', '2026-12-31', 'monthly', 520, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, 'Pic des urgences', NULL);

-- ============================================================
-- NUTRITION - ANNÉE COMPLÈTE
-- ============================================================

INSERT INTO datavalues_agregats (id_data_element, id_org_unit, date_debut, date_fin, type_periode, valeur_numerique, valeur_texte, id_category, source_donnee, date_saisie, commentaire, metadata) VALUES
-- T1
((SELECT id_data_element FROM data_elements WHERE code='NUT_MAS'), 1, '2026-01-01', '2026-03-31', 'quarterly', 18, NULL, (SELECT id_category FROM category_options WHERE code='0-5' AND type_categorie='groupe_age'), 'saisie_manuelle', CURRENT_TIMESTAMP, 'Malnutrition aiguë sévère', NULL),
((SELECT id_data_element FROM data_elements WHERE code='NUT_MAM'), 1, '2026-01-01', '2026-03-31', 'quarterly', 45, NULL, (SELECT id_category FROM category_options WHERE code='0-5' AND type_categorie='groupe_age'), 'saisie_manuelle', CURRENT_TIMESTAMP, 'Malnutrition aiguë modérée', NULL),
-- T2 (pic malnutrition - période soudure)
((SELECT id_data_element FROM data_elements WHERE code='NUT_MAS'), 1, '2026-04-01', '2026-06-30', 'quarterly', 32, NULL, (SELECT id_category FROM category_options WHERE code='0-5' AND type_categorie='groupe_age'), 'saisie_manuelle', CURRENT_TIMESTAMP, 'Pic malnutrition - période de soudure', NULL),
((SELECT id_data_element FROM data_elements WHERE code='NUT_MAM'), 1, '2026-04-01', '2026-06-30', 'quarterly', 78, NULL, (SELECT id_category FROM category_options WHERE code='0-5' AND type_categorie='groupe_age'), 'saisie_manuelle', CURRENT_TIMESTAMP, NULL, NULL),
((SELECT id_data_element FROM data_elements WHERE code='NUT_MARASME'), 1, '2026-05-01', '2026-05-31', 'monthly', 12, NULL, (SELECT id_category FROM category_options WHERE code='0-5' AND type_categorie='groupe_age'), 'saisie_manuelle', CURRENT_TIMESTAMP, 'Cas graves signalés à Bépanda', NULL),
-- T3
((SELECT id_data_element FROM data_elements WHERE code='NUT_MAS'), 1, '2026-07-01', '2026-09-30', 'quarterly', 22, NULL, (SELECT id_category FROM category_options WHERE code='0-5' AND type_categorie='groupe_age'), 'saisie_manuelle', CURRENT_TIMESTAMP, 'Amélioration post-récolte', NULL),
((SELECT id_data_element FROM data_elements WHERE code='NUT_MAM'), 1, '2026-07-01', '2026-09-30', 'quarterly', 52, NULL, (SELECT id_category FROM category_options WHERE code='0-5' AND type_categorie='groupe_age'), 'saisie_manuelle', CURRENT_TIMESTAMP, NULL, NULL),
-- T4
((SELECT id_data_element FROM data_elements WHERE code='NUT_MAS'), 1, '2026-10-01', '2026-12-31', 'quarterly', 15, NULL, (SELECT id_category FROM category_options WHERE code='0-5' AND type_categorie='groupe_age'), 'saisie_manuelle', CURRENT_TIMESTAMP, 'Retour à niveau normal', NULL),
((SELECT id_data_element FROM data_elements WHERE code='NUT_MAM'), 1, '2026-10-01', '2026-12-31', 'quarterly', 40, NULL, (SELECT id_category FROM category_options WHERE code='0-5' AND type_categorie='groupe_age'), 'saisie_manuelle', CURRENT_TIMESTAMP, NULL, NULL);

-- ============================================================
-- VACCINATION - ANNÉE COMPLÈTE
-- ============================================================

INSERT INTO datavalues_agregats (id_data_element, id_org_unit, date_debut, date_fin, type_periode, valeur_numerique, valeur_texte, id_category, source_donnee, date_saisie, commentaire, metadata) VALUES
-- T1
((SELECT id_data_element FROM data_elements WHERE code='VAC_BCG'), 1, '2026-01-01', '2026-03-31', 'quarterly', 125, NULL, (SELECT id_category FROM category_options WHERE code='0-5' AND type_categorie='groupe_age'), 'saisie_manuelle', CURRENT_TIMESTAMP, NULL, NULL),
((SELECT id_data_element FROM data_elements WHERE code='VAC_PENTA1'), 1, '2026-01-01', '2026-03-31', 'quarterly', 142, NULL, (SELECT id_category FROM category_options WHERE code='0-5' AND type_categorie='groupe_age'), 'saisie_manuelle', CURRENT_TIMESTAMP, NULL, NULL),
((SELECT id_data_element FROM data_elements WHERE code='VAC_PENTA3'), 1, '2026-01-01', '2026-03-31', 'quarterly', 118, NULL, (SELECT id_category FROM category_options WHERE code='0-5' AND type_categorie='groupe_age'), 'saisie_manuelle', CURRENT_TIMESTAMP, 'Couverture 83%', NULL),
((SELECT id_data_element FROM data_elements WHERE code='VAC_ROUGE'), 1, '2026-01-01', '2026-03-31', 'quarterly', 120, NULL, (SELECT id_category FROM category_options WHERE code='0-5' AND type_categorie='groupe_age'), 'saisie_manuelle', CURRENT_TIMESTAMP, NULL, NULL),
-- T2 (baisse vaccination)
((SELECT id_data_element FROM data_elements WHERE code='VAC_PENTA3'), 1, '2026-04-01', '2026-06-30', 'quarterly', 92, NULL, (SELECT id_category FROM category_options WHERE code='0-5' AND type_categorie='groupe_age'), 'saisie_manuelle', CURRENT_TIMESTAMP, 'Baisse due aux inondations - difficultés accès', NULL),
-- T3 (rattrapage)
((SELECT id_data_element FROM data_elements WHERE code='VAC_PENTA3'), 1, '2026-07-01', '2026-09-30', 'quarterly', 115, NULL, (SELECT id_category FROM category_options WHERE code='0-5' AND type_categorie='groupe_age'), 'saisie_manuelle', CURRENT_TIMESTAMP, 'Rattrapage post-inondations', NULL),
-- T4 (campagne spéciale fièvre jaune)
((SELECT id_data_element FROM data_elements WHERE code='VAC_FIERR'), 1, '2026-10-01', '2026-12-31', 'quarterly', 5200, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, 'Campagne de masse fièvre jaune - district Douala', '{"type_campagne": "masse", "cible": "15-60 ans"}'::jsonb),
((SELECT id_data_element FROM data_elements WHERE code='VAC_COUV_PENTA'), 1, '2026-01-01', '2026-12-31', 'yearly', 82.5, NULL, NULL, 'aggregation_auto', CURRENT_TIMESTAMP, 'Couverture annuelle Penta3', NULL);

-- ============================================================
-- MATERNITÉ - ANNÉE COMPLÈTE (CORRIGÉE)
-- ============================================================

INSERT INTO datavalues_agregats (id_data_element, id_org_unit, date_debut, date_fin, type_periode, valeur_numerique, valeur_texte, id_category, source_donnee, date_saisie, commentaire, metadata) VALUES
-- T1
((SELECT id_data_element FROM data_elements WHERE code='MAT_CPN1'), 1, '2026-01-01', '2026-03-31', 'quarterly', 345, NULL, (SELECT id_category FROM category_options WHERE code='F' AND type_categorie='sexe'), 'saisie_manuelle', CURRENT_TIMESTAMP, 'Nouvelles grossesses T1', NULL),
((SELECT id_data_element FROM data_elements WHERE code='MAT_CPN4'), 1, '2026-01-01', '2026-03-31', 'quarterly', 234, NULL, (SELECT id_category FROM category_options WHERE code='F' AND type_categorie='sexe'), 'saisie_manuelle', CURRENT_TIMESTAMP, 'CPN4 - taux 67.8%', NULL),
((SELECT id_data_element FROM data_elements WHERE code='HOSP_ACCOUCHEMENT_TOTAL'), 1, '2026-01-01', '2026-03-31', 'quarterly', 267, NULL, (SELECT id_category FROM category_options WHERE code='F' AND type_categorie='sexe'), 'saisie_manuelle', CURRENT_TIMESTAMP, 'Total accouchements T1', NULL),
((SELECT id_data_element FROM data_elements WHERE code='HOSP_CESARIENNE'), 1, '2026-01-01', '2026-03-31', 'quarterly', 71, NULL, (SELECT id_category FROM category_options WHERE code='F' AND type_categorie='sexe'), 'saisie_manuelle', CURRENT_TIMESTAMP, 'Taux césarienne 26.6%', NULL),
-- T2
((SELECT id_data_element FROM data_elements WHERE code='MAT_CPN1'), 1, '2026-04-01', '2026-06-30', 'quarterly', 298, NULL, (SELECT id_category FROM category_options WHERE code='F' AND type_categorie='sexe'), 'saisie_manuelle', CURRENT_TIMESTAMP, 'Baisse CPN1 due aux inondations', NULL),
((SELECT id_data_element FROM data_elements WHERE code='MAT_CPN4'), 1, '2026-04-01', '2026-06-30', 'quarterly', 178, NULL, (SELECT id_category FROM category_options WHERE code='F' AND type_categorie='sexe'), 'saisie_manuelle', CURRENT_TIMESTAMP, 'CPN4 - taux 59.7%', NULL),
((SELECT id_data_element FROM data_elements WHERE code='MAT_DECES_MATERNEL'), 1, '2026-05-01', '2026-05-31', 'monthly', 2, NULL, (SELECT id_category FROM category_options WHERE code='F' AND type_categorie='sexe'), 'saisie_manuelle', CURRENT_TIMESTAMP, 'Décès maternels - hémorragies + toxémie', NULL),
((SELECT id_data_element FROM data_elements WHERE code='MAT_DECES_NEONATAL'), 1, '2026-05-01', '2026-05-31', 'monthly', 5, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, 'Liés aux inondations', NULL),
-- T3-T4
((SELECT id_data_element FROM data_elements WHERE code='HOSP_ACCOUCHEMENT_TOTAL'), 1, '2026-07-01', '2026-12-31', 'yearly', 598, NULL, (SELECT id_category FROM category_options WHERE code='F' AND type_categorie='sexe'), 'saisie_manuelle', CURRENT_TIMESTAMP, 'Total S2 2026', NULL),
((SELECT id_data_element FROM data_elements WHERE code='MAT_DECES_MATERNEL'), 1, '2026-01-01', '2026-12-31', 'yearly', 5, NULL, (SELECT id_category FROM category_options WHERE code='F' AND type_categorie='sexe'), 'saisie_manuelle', CURRENT_TIMESTAMP, 'Ratio: 78/100000', NULL);

-- ============================================================
-- VIH/TUBERCULOSE - ANNÉE COMPLÈTE
-- ============================================================

INSERT INTO datavalues_agregats (id_data_element, id_org_unit, date_debut, date_fin, type_periode, valeur_numerique, valeur_texte, id_category, source_donnee, date_saisie, commentaire, metadata) VALUES
((SELECT id_data_element FROM data_elements WHERE code='VIH_NOUVEAU'), 1, '2026-01-01', '2026-12-31', 'yearly', 87, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, 'Nouvelles infections VIH', NULL),
((SELECT id_data_element FROM data_elements WHERE code='VIH_SUIVI'), 1, '2026-12-01', '2026-12-31', 'monthly', 1240, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, 'Patients sous ARV', NULL),
((SELECT id_data_element FROM data_elements WHERE code='TUBERCULOSE_NOUVEAU'), 1, '2026-01-01', '2026-12-31', 'yearly', 112, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, 'Nouveaux cas TB', NULL),
((SELECT id_data_element FROM data_elements WHERE code='ART_DISPENSE'), 1, '2026-01-01', '2026-12-31', 'yearly', 15200, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, 'ARV dispensés', NULL),
((SELECT id_data_element FROM data_elements WHERE code='ACT_DISPENSE'), 1, '2026-01-01', '2026-12-31', 'yearly', 18500, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, 'Traitements ACT dispensés', NULL);

-- ============================================================
-- PERFORMANCE HOSPITALIÈRE - ANNÉE COMPLÈTE
-- ============================================================

INSERT INTO datavalues_agregats (id_data_element, id_org_unit, date_debut, date_fin, type_periode, valeur_numerique, valeur_texte, id_category, source_donnee, date_saisie, commentaire, metadata) VALUES
-- Hôpital Laquintinie
((SELECT id_data_element FROM data_elements WHERE code='PERF_TAUX_OCC'), 2, '2026-01-01', '2026-01-31', 'monthly', 85.5, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, NULL, '{"capacite_lits": 250, "lits_occupes": 214}'::jsonb),
((SELECT id_data_element FROM data_elements WHERE code='PERF_TAUX_OCC'), 2, '2026-05-01', '2026-05-31', 'monthly', 98.5, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, 'Pic épidémique - saturation', '{"capacite_lits": 250, "lits_occupes": 246}'::jsonb),
((SELECT id_data_element FROM data_elements WHERE code='PERF_DELAI_ATTENTE'), 2, '2026-01-01', '2026-01-31', 'monthly', 35.5, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, 'Délai normal', '{"unite": "minutes"}'::jsonb),
((SELECT id_data_element FROM data_elements WHERE code='PERF_DELAI_ATTENTE'), 2, '2026-05-01', '2026-05-31', 'monthly', 78.5, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, 'Délai long - surcharge', '{"unite": "minutes"}'::jsonb),
((SELECT id_data_element FROM data_elements WHERE code='PERF_TABLE_OPS'), 2, '2026-01-01', '2026-12-31', 'yearly', 1850, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, 'Total interventions 2026', NULL),
((SELECT id_data_element FROM data_elements WHERE code='PERF_LABO'), 2, '2026-01-01', '2026-12-31', 'yearly', 28500, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, 'Examens labo', NULL),
((SELECT id_data_element FROM data_elements WHERE code='PERF_IMAGERIE'), 2, '2026-01-01', '2026-12-31', 'yearly', 12200, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, 'Radiologie + échographie', NULL);

-- ============================================================
-- RÉFÉRENCES PUBLIC-PRIVÉ
-- ============================================================

INSERT INTO datavalues_agregats (id_data_element, id_org_unit, date_debut, date_fin, type_periode, valeur_numerique, valeur_texte, id_category, source_donnee, date_saisie, commentaire, metadata) VALUES
((SELECT id_data_element FROM data_elements WHERE code='LITT_REF_PUB_PRI'), 1, '2026-01-01', '2026-12-31', 'yearly', 245, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, 'Public → Privé', NULL),
((SELECT id_data_element FROM data_elements WHERE code='LITT_REF_PRI_PUB'), 1, '2026-01-01', '2026-12-31', 'yearly', 187, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, 'Privé → Public', NULL),
((SELECT id_data_element FROM data_elements WHERE code='CONSULT_REFEREE'), 1, '2026-01-01', '2026-12-31', 'yearly', 432, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, 'Total référés', NULL),
((SELECT id_data_element FROM data_elements WHERE code='CONSULT_RECUE'), 1, '2026-01-01', '2026-12-31', 'yearly', 398, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, 'Total reçus en référence', NULL);

-- ============================================================
-- STOCKS MÉDICAMENTS - ALERTES
-- ============================================================

INSERT INTO datavalues_agregats (id_data_element, id_org_unit, date_debut, date_fin, type_periode, valeur_numerique, valeur_texte, id_category, source_donnee, date_saisie, commentaire, metadata) VALUES
((SELECT id_data_element FROM data_elements WHERE code='STOCK_ALERTE'), 1, '2026-05-01', '2026-05-31', 'monthly', 8, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, 'Alertes ruptures ACT, ARV, sels réhydratation', NULL),
((SELECT id_data_element FROM data_elements WHERE code='STOCK_RUPTURE'), 1, '2026-05-01', '2026-05-31', 'monthly', 3, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, 'Ruptures ACT + sels réhydratation + antibiotiques', NULL),
((SELECT id_data_element FROM data_elements WHERE code='STOCK_ALERTE'), 1, '2026-12-01', '2026-12-31', 'monthly', 4, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, 'Alertes fin année', NULL),
((SELECT id_data_element FROM data_elements WHERE code='STOCK_RUPTURE'), 1, '2026-12-01', '2026-12-31', 'monthly', 1, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, 'Rupture ARV', NULL);

-- ============================================================
-- AUTRES STRUCTURES (synthèse annuelle) - CORRIGÉES
-- ============================================================

-- District Nkongsamba (Moungo)
INSERT INTO datavalues_agregats (id_data_element, id_org_unit, date_debut, date_fin, type_periode, valeur_numerique, valeur_texte, id_category, source_donnee, date_saisie, commentaire, metadata) VALUES
((SELECT id_data_element FROM data_elements WHERE code='CONSULT_TOTAL'), 4, '2026-01-01', '2026-12-31', 'yearly', 38500, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, 'District Nkongsamba - total annuel', NULL),
((SELECT id_data_element FROM data_elements WHERE code='PALU_SIMPLE'), 4, '2026-01-01', '2026-12-31', 'yearly', 4850, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, 'Paludisme - zone semi-urbaine', NULL),
((SELECT id_data_element FROM data_elements WHERE code='IRA_SIMPLE'), 4, '2026-01-01', '2026-12-31', 'yearly', 3200, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, 'IRA - climat plus frais', NULL),
((SELECT id_data_element FROM data_elements WHERE code='HOSP_ACCOUCHEMENT_TOTAL'), 4, '2026-01-01', '2026-12-31', 'yearly', 1850, NULL, (SELECT id_category FROM category_options WHERE code='F' AND type_categorie='sexe'), 'saisie_manuelle', CURRENT_TIMESTAMP, 'Accouchements NKONGSAMBA', NULL);

-- District Edéa (Sanaga-Maritime)
INSERT INTO datavalues_agregats (id_data_element, id_org_unit, date_debut, date_fin, type_periode, valeur_numerique, valeur_texte, id_category, source_donnee, date_saisie, commentaire, metadata) VALUES
((SELECT id_data_element FROM data_elements WHERE code='CONSULT_TOTAL'), 5, '2026-01-01', '2026-12-31', 'yearly', 28500, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, 'District Edéa - total annuel', NULL),
((SELECT id_data_element FROM data_elements WHERE code='PALU_SIMPLE'), 5, '2026-01-01', '2026-12-31', 'yearly', 5200, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, 'Paludisme - zone lagunaire très endémique', NULL),
((SELECT id_data_element FROM data_elements WHERE code='DIAR_SIMPLE'), 5, '2026-01-01', '2026-12-31', 'yearly', 2450, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, 'Diarrhées - eau non potable', NULL),
((SELECT id_data_element FROM data_elements WHERE code='LITT_PECHE'), 5, '2026-01-01', '2026-12-31', 'yearly', 890, NULL, (SELECT id_category FROM category_options WHERE code='POISSONNERIE' AND type_categorie='socio_pro'), 'saisie_manuelle', CURRENT_TIMESTAMP, 'Communauté de pêcheurs', NULL);

-- ============================================================
-- ALERTES TEXTUELLES (avec id_data_element non NULL)
-- ============================================================

INSERT INTO datavalues_agregats (id_data_element, id_org_unit, date_debut, date_fin, type_periode, valeur_numerique, valeur_texte, id_category, source_donnee, date_saisie, commentaire, metadata) VALUES
((SELECT id_data_element FROM data_elements WHERE code='STOCK_ALERTE'), 1, '2026-05-15', '2026-05-15', 'weekly', NULL, 'NIVEAU EPIDEMIQUE ATTEINT - Paludisme zone Bépanda', NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, 'Alerte envoyée au DRSP', NULL),
((SELECT id_data_element FROM data_elements WHERE code='STOCK_RUPTURE'), 1, '2026-05-20', '2026-05-20', 'weekly', NULL, 'RUPTURE STOCK ACT - Réquisition en cours', NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, 'Pharmacie centrale avisée', NULL),
((SELECT id_data_element FROM data_elements WHERE code='PERF_TAUX_OCC'), 2, '2026-05-25', '2026-05-25', 'weekly', NULL, 'SATURATION URGENCES - Activation plan blanc', NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, 'Dépassement capacité lits', NULL),
((SELECT id_data_element FROM data_elements WHERE code='VAC_FIERR'), 1, '2026-08-10', '2026-08-10', 'weekly', NULL, 'CAMPAGNE VACCINATION ROUGEOLE - Zone Ndogbong', NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, '300 enfants ciblés', NULL),
((SELECT id_data_element FROM data_elements WHERE code='VAC_FIERR'), 1, '2026-10-01', '2026-10-31', 'monthly', NULL, 'CAMPAGNE FIÈVRE JAUNE - District Douala', NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, 'Objectif: 50 000 adultes', NULL);

-- ============================================================
-- AGRÉGATIONS ANNUELLES (calculs système)
-- ============================================================

INSERT INTO datavalues_agregats (id_data_element, id_org_unit, date_debut, date_fin, type_periode, valeur_numerique, valeur_texte, id_category, source_donnee, date_saisie, commentaire, metadata) VALUES
-- District Douala 1 - Totaux annuels
((SELECT id_data_element FROM data_elements WHERE code='CONSULT_TOTAL'), 1, '2026-01-01', '2026-12-31', 'yearly', 34280, NULL, NULL, 'aggregation_auto', CURRENT_TIMESTAMP, 'Total consultations 2026 - District Douala 1', '{"moyenne_mensuelle": 2857}'::jsonb),
((SELECT id_data_element FROM data_elements WHERE code='PALU_SIMPLE'), 1, '2026-01-01', '2026-12-31', 'yearly', 5213, NULL, NULL, 'aggregation_auto', CURRENT_TIMESTAMP, 'Total paludisme 2026', '{"taux_attaque": 12.5, "pic_max_mai": 650}'::jsonb),
((SELECT id_data_element FROM data_elements WHERE code='PALU_GRAVE'), 1, '2026-01-01', '2026-12-31', 'yearly', 248, NULL, NULL, 'aggregation_auto', CURRENT_TIMESTAMP, 'Formes graves 2026', NULL),
((SELECT id_data_element FROM data_elements WHERE code='IRA_SIMPLE'), 1, '2026-01-01', '2026-12-31', 'yearly', 4215, NULL, NULL, 'aggregation_auto', CURRENT_TIMESTAMP, 'Total IRA 2026', NULL),
((SELECT id_data_element FROM data_elements WHERE code='DIAR_SIMPLE'), 1, '2026-01-01', '2026-12-31', 'yearly', 2862, NULL, NULL, 'aggregation_auto', CURRENT_TIMESTAMP, 'Total diarrhées 2026', NULL),
((SELECT id_data_element FROM data_elements WHERE code='HOSP_ADMIS'), 1, '2026-01-01', '2026-12-31', 'yearly', 2150, NULL, NULL, 'aggregation_auto', CURRENT_TIMESTAMP, 'Hospitalisations 2026', NULL),
((SELECT id_data_element FROM data_elements WHERE code='HOSP_DECES'), 1, '2026-01-01', '2026-12-31', 'yearly', 42, NULL, NULL, 'aggregation_auto', CURRENT_TIMESTAMP, 'Décès hospitaliers 2026', NULL);

-- Indicateurs calculés - Qualité
INSERT INTO datavalues_agregats (id_data_element, id_org_unit, date_debut, date_fin, type_periode, valeur_numerique, valeur_texte, id_category, source_donnee, date_saisie, commentaire, metadata) VALUES
((SELECT id_data_element FROM data_elements WHERE code='PERF_TAUX_CESARIENNE'), 1, '2026-01-01', '2026-12-31', 'yearly', 26.8, NULL, NULL, 'aggregation_auto', CURRENT_TIMESTAMP, 'Taux césarienne 2026', '{"national_benchmark": "15-20%"}'::jsonb),
((SELECT id_data_element FROM data_elements WHERE code='MAT_CPN_COUV'), 1, '2026-01-01', '2026-12-31', 'yearly', 65.2, NULL, NULL, 'aggregation_auto', CURRENT_TIMESTAMP, 'Couverture CPN4 2026', NULL),
((SELECT id_data_element FROM data_elements WHERE code='VAC_COUV_PENTA'), 1, '2026-01-01', '2026-12-31', 'yearly', 78.5, NULL, NULL, 'aggregation_auto', CURRENT_TIMESTAMP, 'Couverture Penta3 2026', '{"objectif": "95%"}'::jsonb),
((SELECT id_data_element FROM data_elements WHERE code='REMONTEE_VALIDEE'), 1, '2026-01-01', '2026-12-31', 'yearly', 11, NULL, NULL, 'saisie_manuelle', CURRENT_TIMESTAMP, '11/12 rapports validés', NULL),
((SELECT id_data_element FROM data_elements WHERE code='REMONTEE_DELAI'), 1, '2026-01-01', '2026-12-31', 'yearly', 83.3, NULL, NULL, 'aggregation_auto', CURRENT_TIMESTAMP, '10/12 mois dans délai', NULL);

