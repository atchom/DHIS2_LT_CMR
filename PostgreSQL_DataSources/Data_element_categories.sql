-- ============================================================
-- DATA_ELEMENT_CATEGORIES INSERTS
-- Liaison entre les indicateurs et les catégories de désagrégation
-- ============================================================

-- ============================================================
-- 1. INDICATEURS DE CONSULTATIONS ET ACTIVITÉS GÉNÉRALES
-- ============================================================

-- CONSULT_NEW, CONSULT_TOTAL, CONSULT_URGENCE, CONSULT_REFEREE, CONSULT_RECUE
-- Ces indicateurs peuvent être désagrégés par sexe, groupe d'âge, quartier, zone géo
INSERT INTO data_element_categories (id_data_element, id_category, obligatoire) VALUES
-- Pour CONSULT_NEW (supposons id=1, à ajuster selon vos IDs réels)
((SELECT id_data_element FROM data_elements WHERE code='CONSULT_NEW'), (SELECT id_category FROM category_options WHERE code='M' AND type_categorie='sexe'), FALSE),
((SELECT id_data_element FROM data_elements WHERE code='CONSULT_NEW'), (SELECT id_category FROM category_options WHERE code='F' AND type_categorie='sexe'), FALSE),
((SELECT id_data_element FROM data_elements WHERE code='CONSULT_NEW'), (SELECT id_category FROM category_options WHERE code='0-5' AND type_categorie='groupe_age'), FALSE),
((SELECT id_data_element FROM data_elements WHERE code='CONSULT_NEW'), (SELECT id_category FROM category_options WHERE code='5-14' AND type_categorie='groupe_age'), FALSE),
((SELECT id_data_element FROM data_elements WHERE code='CONSULT_NEW'), (SELECT id_category FROM category_options WHERE code='15-24' AND type_categorie='groupe_age'), FALSE),
((SELECT id_data_element FROM data_elements WHERE code='CONSULT_NEW'), (SELECT id_category FROM category_options WHERE code='24-60' AND type_categorie='groupe_age'), FALSE),
((SELECT id_data_element FROM data_elements WHERE code='CONSULT_NEW'), (SELECT id_category FROM category_options WHERE code='60+' AND type_categorie='groupe_age'), FALSE);

-- Pour CONSULT_TOTAL - mêmes catégories
INSERT INTO data_element_categories (id_data_element, id_category, obligatoire)
SELECT de.id_data_element, cat.id_category, FALSE
FROM data_elements de, category_options cat
WHERE de.code IN ('CONSULT_TOTAL', 'CONSULT_URGENCE', 'CONSULT_REFEREE', 'CONSULT_RECUE')
AND cat.type_categorie IN ('sexe', 'groupe_age', 'quartier', 'zone_geo');

-- ============================================================
-- 2. INDICATEURS D'HOSPITALISATION
-- ============================================================

-- Hospitalisation par sexe et groupe d'âge
INSERT INTO data_element_categories (id_data_element, id_category, obligatoire)
SELECT de.id_data_element, cat.id_category, FALSE
FROM data_elements de, category_options cat
WHERE de.code IN ('HOSP_ADMIS', 'HOSP_JOURNEES', 'HOSP_DECES')
AND cat.type_categorie IN ('sexe', 'groupe_age');

-- Accouchements et césariennes - sexe obligatoire (car c'est féminin)
INSERT INTO data_element_categories (id_data_element, id_category, obligatoire) VALUES
((SELECT id_data_element FROM data_elements WHERE code='HOSP_CESARIENNE'), (SELECT id_category FROM category_options WHERE code='F' AND type_categorie='sexe'), TRUE),
((SELECT id_data_element FROM data_elements WHERE code='HOSP_ACCOUCHEMENT'), (SELECT id_category FROM category_options WHERE code='F' AND type_categorie='sexe'), TRUE),
((SELECT id_data_element FROM data_elements WHERE code='HOSP_ACCOUCHEMENT_TOTAL'), (SELECT id_category FROM category_options WHERE code='F' AND type_categorie='sexe'), TRUE);

-- ============================================================
-- 3. INDICATEURS DES MALADIES PRIORITAIRES (ÉPIDÉMIOLOGIE)
-- ============================================================

-- Paludisme - toutes les catégories sont importantes
INSERT INTO data_element_categories (id_data_element, id_category, obligatoire)
SELECT de.id_data_element, cat.id_category, FALSE
FROM data_elements de, category_options cat
WHERE de.code IN ('PALU_SIMPLE', 'PALU_GRAVE', 'PALU_DECES')
AND cat.type_categorie IN ('sexe', 'groupe_age', 'quartier', 'zone_geo', 'zone_risque', 'socio_pro');

-- Diarrhées et choléra
INSERT INTO data_element_categories (id_data_element, id_category, obligatoire)
SELECT de.id_data_element, cat.id_category, FALSE
FROM data_elements de, category_options cat
WHERE de.code IN ('DIAR_SIMPLE', 'DIAR_DEHYD', 'CHOLERA_SUSPECT', 'CHOLERA_CONF')
AND cat.type_categorie IN ('sexe', 'groupe_age', 'quartier', 'zone_risque');

-- IRA
INSERT INTO data_element_categories (id_data_element, id_category, obligatoire)
SELECT de.id_data_element, cat.id_category, FALSE
FROM data_elements de, category_options cat
WHERE de.code IN ('IRA_SIMPLE', 'IRA_GRAVE')
AND cat.type_categorie IN ('sexe', 'groupe_age', 'quartier');

-- VIH, Tuberculose, Rougeole, Méningite, Fièvre jaune, COVID-19
INSERT INTO data_element_categories (id_data_element, id_category, obligatoire)
SELECT de.id_data_element, cat.id_category, FALSE
FROM data_elements de, category_options cat
WHERE de.code IN ('VIH_NOUVEAU', 'VIH_SUIVI', 'TUBERCULOSE_NOUVEAU', 
                  'ROUGEOLE_SUSPECT', 'MENINGITE_SUSPECT', 
                  'FIERVE_JAUNE_SUSPECT', 'COVID19_SUSPECT')
AND cat.type_categorie IN ('sexe', 'groupe_age', 'quartier', 'zone_geo');

-- ============================================================
-- 4. INDICATEURS DE VACCINATION (PEV)
-- ============================================================

-- Vaccins par groupe d'âge et sexe
INSERT INTO data_element_categories (id_data_element, id_category, obligatoire)
SELECT de.id_data_element, cat.id_category, FALSE
FROM data_elements de, category_options cat
WHERE de.code IN ('VAC_BCG', 'VAC_PENTA1', 'VAC_PENTA3', 'VAC_ROUGE')
AND cat.type_categorie IN ('sexe', 'groupe_age');

-- Vaccin fièvre jaune - adultes aussi
INSERT INTO data_element_categories (id_data_element, id_category, obligatoire)
SELECT de.id_data_element, cat.id_category, FALSE
FROM data_elements de, category_options cat
WHERE de.code = 'VAC_FIERR'
AND cat.type_categorie IN ('sexe', 'groupe_age', 'cible_vaccinale');

-- Couvertures vaccinales (pourcentages)
INSERT INTO data_element_categories (id_data_element, id_category, obligatoire)
SELECT de.id_data_element, cat.id_category, FALSE
FROM data_elements de, category_options cat
WHERE de.code IN ('VAC_COUV_PENTA', 'VAC_COUV_ROUGEOLE', 'VAC_COUV_BCG')
AND cat.type_categorie IN ('zone_geo', 'quartier');

-- ============================================================
-- 5. INDICATEURS DE MATERNITÉ ET SANTÉ DE LA MÈRE
-- ============================================================

-- Indicateurs maternels - sexe féminin obligatoire
INSERT INTO data_element_categories (id_data_element, id_category, obligatoire) VALUES
-- CPN1 avec désagrégation par quartier et zone
((SELECT id_data_element FROM data_elements WHERE code='MAT_CPN1'), (SELECT id_category FROM category_options WHERE code='F' AND type_categorie='sexe'), TRUE),
((SELECT id_data_element FROM data_elements WHERE code='MAT_CPN1'), (SELECT id_category FROM category_options WHERE code='15-24' AND type_categorie='groupe_age'), FALSE),
((SELECT id_data_element FROM data_elements WHERE code='MAT_CPN1'), (SELECT id_category FROM category_options WHERE code='24-60' AND type_categorie='groupe_age'), FALSE),
((SELECT id_data_element FROM data_elements WHERE code='MAT_CPN1'), (SELECT id_category FROM category_options WHERE code='NDOKOTI' AND type_categorie='quartier'), FALSE),

((SELECT id_data_element FROM data_elements WHERE code='MAT_CPN4'), (SELECT id_category FROM category_options WHERE code='F' AND type_categorie='sexe'), TRUE),

((SELECT id_data_element FROM data_elements WHERE code='MAT_ACCOUCHEMENT_I'), (SELECT id_category FROM category_options WHERE code='F' AND type_categorie='sexe'), TRUE),

((SELECT id_data_element FROM data_elements WHERE code='MAT_DECES_MATERNEL'), (SELECT id_category FROM category_options WHERE code='F' AND type_categorie='sexe'), TRUE),

((SELECT id_data_element FROM data_elements WHERE code='MAT_DECES_NEONATAL'), (SELECT id_category FROM category_options WHERE code='0-5' AND type_categorie='groupe_age'), TRUE),

-- Décès néonatal par sexe aussi
((SELECT id_data_element FROM data_elements WHERE code='MAT_DECES_NEONATAL'), (SELECT id_category FROM category_options WHERE code='M' AND type_categorie='sexe'), FALSE),
((SELECT id_data_element FROM data_elements WHERE code='MAT_DECES_NEONATAL'), (SELECT id_category FROM category_options WHERE code='F' AND type_categorie='sexe'), FALSE);

-- ============================================================
-- 6. INDICATEURS DE NUTRITION
-- ============================================================

-- Indicateurs nutritionnels - principalement enfants (groupe d'âge)
INSERT INTO data_element_categories (id_data_element, id_category, obligatoire)
SELECT de.id_data_element, cat.id_category, FALSE
FROM data_elements de, category_options cat
WHERE de.code IN ('NUT_MAS', 'NUT_MAM', 'NUT_MARASME', 'NUT_KWASH', 'NUT_DEPISTE')
AND cat.type_categorie IN ('sexe', 'groupe_age', 'quartier', 'zone_geo');

-- Pour MAS/MAM, groupe 0-5 ans obligatoire
UPDATE data_element_categories 
SET obligatoire = TRUE 
WHERE id_data_element IN (SELECT id_data_element FROM data_elements WHERE code IN ('NUT_MAS', 'NUT_MAM'))
AND id_category = (SELECT id_category FROM category_options WHERE code='0-5' AND type_categorie='groupe_age');

-- ============================================================
-- 7. INDICATEURS DE MÉDICAMENTS ET STOCKS
-- ============================================================

-- Indicateurs de stock - général, pas de désagrégation spécifique
-- (insertion minimale, juste pour la structure, pas obligatoire)

-- ART et ACT par sexe/groupe d'âge
INSERT INTO data_element_categories (id_data_element, id_category, obligatoire)
SELECT de.id_data_element, cat.id_category, FALSE
FROM data_elements de, category_options cat
WHERE de.code IN ('ART_DISPENSE', 'ACT_DISPENSE')
AND cat.type_categorie IN ('sexe', 'groupe_age');

-- ============================================================
-- 8. INDICATEURS DE PERFORMANCE ET QUALITÉ
-- ============================================================

-- Indicateurs performance - désagrégation par type_structure
INSERT INTO data_element_categories (id_data_element, id_category, obligatoire)
SELECT de.id_data_element, cat.id_category, FALSE
FROM data_elements de, category_options cat
WHERE de.code IN ('PERF_TAUX_OCC', 'PERF_DELAI_ATTENTE', 'PERF_SATISFACTION', 
                  'REMONTEE_VALIDEE', 'REMONTEE_DELAI')
AND cat.type_categorie = 'type_structure';

-- Actes par spécialité
INSERT INTO data_element_categories (id_data_element, id_category, obligatoire)
SELECT de.id_data_element, cat.id_category, FALSE
FROM data_elements de, category_options cat
WHERE de.code IN ('PERF_TABLE_OPS', 'PERF_IMAGERIE', 'PERF_LABO')
AND cat.type_categorie IN ('specialite', 'type_structure');

-- ============================================================
-- 9. INDICATEURS SPÉCIFIQUES DU LITTORAL
-- ============================================================

-- Littoral - par quartier, zone_geo, zone_risque, socio_pro
INSERT INTO data_element_categories (id_data_element, id_category, obligatoire)
SELECT de.id_data_element, cat.id_category, FALSE
FROM data_elements de, category_options cat
WHERE de.code IN ('LITT_INNONDATION', 'LITT_ZONE_PORT', 'LITT_ZONE_INDUST', 
                  'LITT_PECHE', 'LITT_REF_PUB_PRI', 'LITT_REF_PRI_PUB')
AND cat.type_categorie IN ('quartier', 'zone_geo', 'zone_risque', 'socio_pro');

-- Zone inondable obligatoire pour LITT_INNONDATION
UPDATE data_element_categories 
SET obligatoire = TRUE 
WHERE id_data_element = (SELECT id_data_element FROM data_elements WHERE code='LITT_INNONDATION')
AND id_category = (SELECT id_category FROM category_options WHERE code='INONDABLE' AND type_categorie='zone_risque');

-- Secteur pêche obligatoire pour LITT_PECHE
UPDATE data_element_categories 
SET obligatoire = TRUE 
WHERE id_data_element = (SELECT id_data_element FROM data_elements WHERE code='LITT_PECHE')
AND id_category = (SELECT id_category FROM category_options WHERE code='POISSONNERIE' AND type_categorie='socio_pro');