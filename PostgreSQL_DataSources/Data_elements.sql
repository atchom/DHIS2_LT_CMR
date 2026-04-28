-- ============================================================
-- INSERTION DES INDICATEURS (DATA ELEMENTS)
-- Littoral Cameroun - Données terrain réalistes
-- ============================================================

-- ============================================================
-- 1. INDICATEURS DE CONSULTATIONS ET ACTIVITÉS GÉNÉRALES
-- ============================================================

INSERT INTO data_elements (code, nom, description, type_donnee, unite_mesure, seuil_alerte, seuil_epidemique, seuil_critique, categorie_principale, public_cible, prive_cible, actif) VALUES
('CONSULT_NEW', 'Nouveaux consultants', 'Nombre de patients venus pour la première fois dans la structure', 'integer', 'patients', NULL, NULL, NULL, 'aucun', TRUE, TRUE, TRUE),
('CONSULT_TOTAL', 'Total consultations', 'Nombre total de consultations (nouveaux + anciens)', 'integer', 'consultations', NULL, NULL, NULL, 'aucun', TRUE, TRUE, TRUE),
('CONSULT_URGENCE', 'Consultations aux urgences', 'Nombre de passages aux urgences', 'integer', 'passages', 500, 1000, 1500, 'aucun', TRUE, TRUE, TRUE),
('CONSULT_REFEREE', 'Patients référés', 'Nombre de patients référés vers une autre structure', 'integer', 'patients', NULL, NULL, NULL, 'aucun', TRUE, TRUE, TRUE),
('CONSULT_RECUE', 'Patients reçus en référence', 'Nombre de patients reçus en référence d''une autre structure', 'integer', 'patients', NULL, NULL, NULL, 'aucun', TRUE, TRUE, TRUE);

-- ============================================================
-- 2. INDICATEURS D'HOSPITALISATION
-- ============================================================

INSERT INTO data_elements (code, nom, description, type_donnee, unite_mesure, seuil_alerte, seuil_epidemique, seuil_critique, categorie_principale, public_cible, prive_cible, actif) VALUES
('HOSP_ADMIS', 'Admissions hospitalières', 'Nombre total d''admissions à l''hôpital', 'integer', 'patients', NULL, NULL, NULL, 'aucun', TRUE, TRUE, TRUE),
('HOSP_JOURNEES', 'Journées d''hospitalisation', 'Nombre total de journées d''hospitalisation', 'integer', 'journées', NULL, NULL, NULL, 'aucun', TRUE, TRUE, TRUE),
('HOSP_DUREE_MOY', 'Durée moyenne de séjour', 'Durée moyenne d''hospitalisation en jours', 'decimal', 'jours', NULL, NULL, NULL, 'aucun', TRUE, TRUE, TRUE),
('HOSP_DECES', 'Décès hospitaliers', 'Nombre de décès survenus à l''hôpital', 'integer', 'décès', NULL, NULL, NULL, 'aucun', TRUE, TRUE, TRUE),
('HOSP_CESARIENNE', 'Césariennes réalisées', 'Nombre d''accouchements par césarienne', 'integer', 'actes', NULL, NULL, NULL, 'sexe', TRUE, TRUE, TRUE),
('HOSP_ACCOUCHEMENT', 'Accouchements normaux', 'Nombre d''accouchements par voie basse', 'integer', 'accouchements', NULL, NULL, NULL, 'sexe', TRUE, TRUE, TRUE),
('HOSP_ACCOUCHEMENT_TOTAL', 'Total accouchements', 'Nombre total d''accouchements (voie basse + césarienne)', 'integer', 'accouchements', NULL, NULL, NULL, 'aucun', TRUE, TRUE, TRUE);

-- ============================================================
-- 3. INDICATEURS DES MALADIES PRIORITAIRES (ÉPIDÉMIOLOGIE)
-- ============================================================

INSERT INTO data_elements (code, nom, description, type_donnee, unite_mesure, seuil_alerte, seuil_epidemique, seuil_critique, categorie_principale, public_cible, prive_cible, actif) VALUES
-- Paludisme
('PALU_SIMPLE', 'Paludisme simple', 'Cas de paludisme non compliqué confirmé', 'integer', 'cas', 50, 200, 500, 'groupe_age', TRUE, TRUE, TRUE),
('PALU_GRAVE', 'Paludisme sévère', 'Cas de paludisme grave avec complications', 'integer', 'cas', 10, 30, 50, 'groupe_age', TRUE, TRUE, TRUE),
('PALU_DECES', 'Décès par paludisme', 'Nombre de décès liés au paludisme', 'integer', 'décès', 1, 3, 5, 'groupe_age', TRUE, TRUE, TRUE),

-- Diarrhées et choléra
('DIAR_SIMPLE', 'Diarrhée simple', 'Cas de diarrhée sans signes de gravité', 'integer', 'cas', 100, 300, 500, 'groupe_age', TRUE, TRUE, TRUE),
('DIAR_DEHYD', 'Diarrhée avec déshydratation', 'Diarrhée sévère avec signes de déshydratation', 'integer', 'cas', 20, 50, 100, 'groupe_age', TRUE, TRUE, TRUE),
('CHOLERA_SUSPECT', 'Choléra - cas suspect', 'Cas suspect de choléra', 'integer', 'cas', 1, 3, 5, 'aucun', TRUE, TRUE, TRUE),
('CHOLERA_CONF', 'Choléra - cas confirmé', 'Cas confirmé de choléra par laboratoire', 'integer', 'cas', 1, 3, 5, 'aucun', TRUE, TRUE, TRUE),

-- Infections respiratoires
('IRA_SIMPLE', 'Infection respiratoire aiguë simple', 'IRA sans signes de gravité', 'integer', 'cas', 200, 500, 1000, 'groupe_age', TRUE, TRUE, TRUE),
('IRA_GRAVE', 'Infection respiratoire aiguë grave', 'IRA avec signes de détresse respiratoire', 'integer', 'cas', 30, 80, 150, 'groupe_age', TRUE, TRUE, TRUE),

-- Autres maladies prioritaires
('VIH_NOUVEAU', 'Nouveaux cas VIH', 'Nombre de nouvelles infections VIH diagnostiquées', 'integer', 'cas', NULL, NULL, NULL, 'sexe', TRUE, TRUE, TRUE),
('VIH_SUIVI', 'Patients sous ARV', 'Nombre de patients sous traitement antirétroviral', 'integer', 'patients', NULL, NULL, NULL, 'sexe', TRUE, TRUE, TRUE),
('TUBERCULOSE_NOUVEAU', 'Nouveaux cas de tuberculose', 'Cas de tuberculose nouvellement diagnostiqués', 'integer', 'cas', NULL, NULL, NULL, 'sexe', TRUE, TRUE, TRUE),
('ROUGEOLE_SUSPECT', 'Rougeole - cas suspect', 'Cas suspect de rougeole', 'integer', 'cas', 1, 3, 5, 'groupe_age', TRUE, TRUE, TRUE),
('MENINGITE_SUSPECT', 'Méningite - cas suspect', 'Cas suspect de méningite', 'integer', 'cas', 1, 2, 3, 'groupe_age', TRUE, TRUE, TRUE),
('FIERVE_JAUNE_SUSPECT', 'Fièvre jaune - cas suspect', 'Cas suspect de fièvre jaune', 'integer', 'cas', 1, 1, 2, 'groupe_age', TRUE, TRUE, TRUE),
('COVID19_SUSPECT', 'COVID-19 - cas suspect', 'Cas suspect de COVID-19', 'integer', 'cas', 5, 20, 50, 'groupe_age', TRUE, TRUE, TRUE);

-- ============================================================
-- 4. INDICATEURS DE VACCINATION (PEV)
-- ============================================================

INSERT INTO data_elements (code, nom, description, type_donnee, unite_mesure, seuil_alerte, seuil_epidemique, seuil_critique, categorie_principale, public_cible, prive_cible, actif) VALUES
('VAC_BCG', 'BCG - enfants vaccinés', 'Nombre d''enfants vaccinés contre la tuberculose', 'integer', 'enfants', NULL, NULL, NULL, 'groupe_age', TRUE, TRUE, TRUE),
('VAC_PENTA1', 'Penta1 - enfants vaccinés', 'Nombre d''enfants ayant reçu la 1ère dose du Penta', 'integer', 'enfants', NULL, NULL, NULL, 'groupe_age', TRUE, TRUE, TRUE),
('VAC_PENTA3', 'Penta3 - enfants vaccinés', 'Nombre d''enfants ayant reçu la 3ème dose du Penta (vaccination complète)', 'integer', 'enfants', NULL, NULL, NULL, 'groupe_age', TRUE, TRUE, TRUE),
('VAC_ROUGE', 'VAR - vaccin rougeole', 'Nombre d''enfants vaccinés contre la rougeole', 'integer', 'enfants', NULL, NULL, NULL, 'groupe_age', TRUE, TRUE, TRUE),
('VAC_FIERR', 'Vaccin fièvre jaune', 'Nombre de personnes vaccinées contre la fièvre jaune', 'integer', 'personnes', NULL, NULL, NULL, 'groupe_age', TRUE, TRUE, TRUE),
('VAC_COUV_PENTA', 'Couverture vaccinale Penta3 (%)', 'Pourcentage d''enfants avec Penta3 complet sur la cible', 'percentage', '%', 80, NULL, NULL, 'aucun', TRUE, TRUE, TRUE),
('VAC_COUV_ROUGEOLE', 'Couverture vaccinale rougeole (%)', 'Pourcentage d''enfants vaccinés contre la rougeole', 'percentage', '%', 80, NULL, NULL, 'aucun', TRUE, TRUE, TRUE),
('VAC_COUV_BCG', 'Couverture vaccinale BCG (%)', 'Pourcentage d''enfants vaccinés BCG', 'percentage', '%', 90, NULL, NULL, 'aucun', TRUE, TRUE, TRUE);

-- ============================================================
-- 5. INDICATEURS DE MATERNITÉ ET SANTÉ DE LA MÈRE
-- ============================================================

INSERT INTO data_elements (code, nom, description, type_donnee, unite_mesure, seuil_alerte, seuil_epidemique, seuil_critique, categorie_principale, public_cible, prive_cible, actif) VALUES
('MAT_CPN1', 'CPN1 - 1ère consultation prénatale', 'Nombre de femmes enceintes ayant fait la 1ère CPN', 'integer', 'femmes', NULL, NULL, NULL, 'sexe', TRUE, TRUE, TRUE),
('MAT_CPN4', 'CPN4 - 4ème consultation prénatale', 'Nombre de femmes ayant fait au moins 4 CPN', 'integer', 'femmes', NULL, NULL, NULL, 'sexe', TRUE, TRUE, TRUE),
('MAT_ACCOUCHEMENT_I', 'Accouchements assistés par personnel qualifié', 'Accouchements assistés par médecin/sage-femme/infirmier', 'integer', 'accouchements', NULL, NULL, NULL, 'sexe', TRUE, TRUE, TRUE),
('MAT_CPN_COUV', 'Taux de couverture CPN4 (%)', 'Pourcentage de femmes avec CPN4 sur total accouchements', 'percentage', '%', 50, NULL, NULL, 'aucun', TRUE, TRUE, TRUE),
('MAT_DECES_MATERNEL', 'Décès maternels', 'Nombre de décès maternels (grossesse/accouchement/post-partum)', 'integer', 'décès', 0, 1, 2, 'sexe', TRUE, TRUE, TRUE),
('MAT_DECES_NEONATAL', 'Décès néonatals', 'Nombre de décès d''enfants de moins de 28 jours', 'integer', 'décès', 2, 5, 10, 'groupe_age', TRUE, TRUE, TRUE),
('MAT_AVORTEMENT', 'Avortements (spontanés ou provoqués)', 'Nombre d''avortements pris en charge', 'integer', 'cas', NULL, NULL, NULL, 'sexe', TRUE, TRUE, TRUE);

-- ============================================================
-- 6. INDICATEURS DE NUTRITION
-- ============================================================

INSERT INTO data_elements (code, nom, description, type_donnee, unite_mesure, seuil_alerte, seuil_epidemique, seuil_critique, categorie_principale, public_cible, prive_cible, actif) VALUES
('NUT_MAS', 'Malnutrition aiguë sévère (MAS)', 'Cas de malnutrition aiguë sévère (PB < 115mm ou œdèmes)', 'integer', 'cas', 5, 15, 30, 'groupe_age', TRUE, TRUE, TRUE),
('NUT_MAM', 'Malnutrition aiguë modérée (MAM)', 'Cas de malnutrition aiguë modérée', 'integer', 'cas', 10, 30, 50, 'groupe_age', TRUE, TRUE, TRUE),
('NUT_MARASME', 'Marasme', 'Cas de marasme (insuffisance pondérale sévère)', 'integer', 'cas', 3, 10, 20, 'groupe_age', TRUE, TRUE, TRUE),
('NUT_KWASH', 'Kwashiorkor', 'Cas de kwashiorkor (œdèmes, carence protéique)', 'integer', 'cas', 2, 5, 10, 'groupe_age', TRUE, TRUE, TRUE),
('NUT_DEPISTE', 'Enfants dépistés nutritionnels', 'Nombre d''enfants dépistés pour la nutrition', 'integer', 'enfants', NULL, NULL, NULL, 'groupe_age', TRUE, TRUE, TRUE);

-- ============================================================
-- 7. INDICATEURS DE MÉDICAMENTS ET STOCKS
-- ============================================================

INSERT INTO data_elements (code, nom, description, type_donnee, unite_mesure, seuil_alerte, seuil_epidemique, seuil_critique, categorie_principale, public_cible, prive_cible, actif) VALUES
('STOCK_ALERTE', 'Alertes de rupture de stock', 'Nombre de médicaments en alerte de rupture', 'integer', 'alertes', 1, 3, 5, 'aucun', TRUE, TRUE, TRUE),
('STOCK_RUPTURE', 'Médicaments en rupture', 'Nombre de médicaments en rupture totale', 'integer', 'médicaments', 0, 1, 2, 'aucun', TRUE, TRUE, TRUE),
('STOCK_PEREMPTION', 'Médicaments périmés', 'Nombre de lots de médicaments périmés', 'integer', 'lots', 0, 1, 2, 'aucun', TRUE, TRUE, TRUE),
('ART_DISPENSE', 'Patients sous ARV dispensés', 'Nombre de patients ayant reçu leurs ARV', 'integer', 'patients', NULL, NULL, NULL, 'sexe', TRUE, TRUE, TRUE),
('ACT_DISPENSE', 'Traitements ACT dispensés', 'Nombre de traitements antipaludiques ACT dispensés', 'integer', 'traitements', NULL, NULL, NULL, 'groupe_age', TRUE, TRUE, TRUE);

-- ============================================================
-- 8. INDICATEURS DE PERFORMANCE ET QUALITÉ
-- ============================================================

INSERT INTO data_elements (code, nom, description, type_donnee, unite_mesure, seuil_alerte, seuil_epidemique, seuil_critique, categorie_principale, public_cible, prive_cible, actif) VALUES
('PERF_TAUX_OCC', 'Taux d''occupation des lits (%)', 'Pourcentage d''occupation des lits disponibles', 'percentage', '%', 85, NULL, NULL, 'aucun', TRUE, TRUE, TRUE),
('PERF_DELAI_ATTENTE', 'Délai d''attente moyen (minutes)', 'Temps d''attente moyen avant consultation', 'integer', 'minutes', 60, NULL, NULL, 'aucun', TRUE, TRUE, TRUE),
('PERF_TABLE_OPS', 'Interventions chirurgicales', 'Nombre d''interventions chirurgicales réalisées', 'integer', 'interventions', NULL, NULL, NULL, 'aucun', TRUE, TRUE, TRUE),
('PERF_IMAGERIE', 'Examens d''imagerie réalisés', 'Nombre d''examens d''imagerie (radio, écho, scanner, IRM)', 'integer', 'examens', NULL, NULL, NULL, 'aucun', TRUE, TRUE, TRUE),
('PERF_LABO', 'Examens de laboratoire', 'Nombre d''examens de laboratoire réalisés', 'integer', 'examens', NULL, NULL, NULL, 'aucun', TRUE, TRUE, TRUE),
('PERF_SATISFACTION', 'Taux de satisfaction patients (%)', 'Pourcentage de patients satisfaits des soins', 'percentage', '%', 70, NULL, NULL, 'aucun', TRUE, TRUE, TRUE),
('REMONTEE_VALIDEE', 'Remontées de données validées', 'Nombre de rapports mensuels validés', 'integer', 'rapports', NULL, NULL, NULL, 'aucun', TRUE, TRUE, TRUE),
('REMONTEE_DELAI', 'Respect des délais de remontée', 'Pourcentage de remontées faites avant la date limite', 'percentage', '%', 80, NULL, NULL, 'aucun', TRUE, TRUE, TRUE);

-- ============================================================
-- 9. INDICATEURS SPÉCIFIQUES DU LITTORAL
-- ============================================================

INSERT INTO data_elements (code, nom, description, type_donnee, unite_mesure, seuil_alerte, seuil_epidemique, seuil_critique, categorie_principale, public_cible, prive_cible, actif) VALUES
('LITT_INNONDATION', 'Consultations liées aux inondations', 'Nombre de consultations suite aux inondations (traumatismes, noyades, maladies hydriques)', 'integer', 'consultations', 50, 200, NULL, 'aucun', TRUE, TRUE, TRUE),
('LITT_ZONE_PORT', 'Patients zone portuaire', 'Nombre de consultants de la zone portuaire', 'integer', 'patients', NULL, NULL, NULL, 'quartier', TRUE, TRUE, TRUE),
('LITT_ZONE_INDUST', 'Patients zone industrielle', 'Nombre de consultants de la zone industrielle', 'integer', 'patients', NULL, NULL, NULL, 'quartier', TRUE, TRUE, TRUE),
('LITT_PECHE', 'Patients secteur pêche/poissonnerie', 'Nombre de consultants issus du secteur de la pêche', 'integer', 'patients', NULL, NULL, NULL, 'socio_pro', TRUE, TRUE, TRUE),
('LITT_REF_PUB_PRI', 'Références public vers privé', 'Nombre de patients transférés d''une structure publique vers une structure privée', 'integer', 'patients', NULL, NULL, NULL, 'aucun', TRUE, TRUE, TRUE),
('LITT_REF_PRI_PUB', 'Références privé vers public', 'Nombre de patients transférés d''une structure privée vers une structure publique', 'integer', 'patients', NULL, NULL, NULL, 'aucun', TRUE, TRUE, TRUE);

-- ============================================================
-- AJOUT DES VALEURS MANQUANTES POUR unite_mesure
-- ============================================================

UPDATE data_elements 
SET unite_mesure = CASE 
    WHEN nom ILIKE '%pourcentage%' OR nom ILIKE '%taux%' OR code ILIKE '%COUV%' THEN '%'
    WHEN code ILIKE '%CONSULT%' THEN 'consultations'
    WHEN code ILIKE '%PALU%' OR code ILIKE '%CHOLERA%' OR code ILIKE '%ROUGEOLE%' THEN 'cas'
    WHEN code ILIKE '%DECES%' OR code ILIKE '%MORT%' THEN 'décès'
    WHEN code ILIKE '%VACCIN%' OR code ILIKE '%VAC_%' THEN 'enfants vaccinés'
    WHEN code ILIKE '%HOSP_%' THEN 'patients'
    WHEN code ILIKE '%MAT_%' THEN 'femmes/accouchements'
    WHEN code ILIKE '%PERF_%' THEN 'indicateurs'
    WHEN code ILIKE '%STOCK%' THEN 'alertes'
    ELSE 'nombre'
END
WHERE unite_mesure IS NULL;

-- ============================================================
-- MISE À JOUR DES SEUILS POUR LES MALADIES PRIORITAIRES
-- ============================================================

-- Ajouter les seuils manquants pour les maladies prioritaires
UPDATE data_elements SET seuil_alerte = 10, seuil_epidemique = 30 WHERE code = 'PALU_SIMPLE';
UPDATE data_elements SET seuil_alerte = 3, seuil_epidemique = 10 WHERE code = 'PALU_GRAVE';
UPDATE data_elements SET seuil_alerte = 1, seuil_epidemique = 3 WHERE code = 'PALU_DECES';
UPDATE data_elements SET seuil_alerte = 20, seuil_epidemique = 50 WHERE code = 'DIAR_SIMPLE';
UPDATE data_elements SET seuil_alerte = 5, seuil_epidemique = 15 WHERE code = 'DIAR_DEHYD';
UPDATE data_elements SET seuil_alerte = 30, seuil_epidemique = 80 WHERE code = 'IRA_GRAVE';
UPDATE data_elements SET seuil_alerte = 2, seuil_epidemique = 5 WHERE code = 'TUBERCULOSE_NOUVEAU';

-- ============================================================
-- AJOUT DES FORMULES DE CALCUL POUR CERTAINS INDICATEURS
-- ============================================================

UPDATE data_elements 
SET formule_calcul = '(HOSP_ADMIS / capacite_lits) * 100'
WHERE code = 'PERF_TAUX_OCC';

UPDATE data_elements 
SET formule_calcul = '(MAT_CPN4 / MAT_CPN1) * 100'
WHERE code = 'MAT_CPN_COUV';

UPDATE data_elements 
SET formule_calcul = '(VAC_PENTA3 / VAC_PENTA1) * 100'
WHERE code = 'VAC_COUV_PENTA';

UPDATE data_elements 
SET formule_calcul = '(VAC_ROUGE / VAC_BCG) * 100'
WHERE code = 'VAC_COUV_ROUGEOLE';

UPDATE data_elements 
SET formule_calcul = '(HOSP_CESARIENNE / HOSP_ACCOUCHEMENT_TOTAL) * 100'
WHERE code = 'PERF_TAUX_CESARIENNE';
