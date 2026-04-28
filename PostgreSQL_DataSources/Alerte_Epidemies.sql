-- ============================================================
-- ALERTE 1: ALERT-PALU-001-2026 (Paludisme - Bépanda)
-- ============================================================
INSERT INTO alertes_epidemiques (
    code_alerte, id_maladie, id_org_unit,
    date_alerte, date_debut_symptomes, date_premier_cas,
    nb_cas_suspects, nb_cas_confirmes, nb_cas_probables, nb_deces, nb_gueris,
    taux_letalite, niveau_alerte, statut_alerte,
    investigation_realisee, rapport_investigation,
    action_prise, mesures_pees,
    notifie_minsante, date_notification, notifie_oms,
    coord_alerte, rayon_alerte_km,
    population_exposee, menages_exposes,
    source_information,
    metadata
) VALUES (
    'ALERT-PALU-001-2026',
    (SELECT id_maladie FROM maladies_prioritaires WHERE code_cim10 = 'B50'),
    (SELECT id_org_unit FROM organisation_units WHERE code = 'DIST-DLA'),
    '2026-05-15 10:30:00',
    '2026-04-20',
    '2026-04-25',
    650, 520, 98, 3, 0,
    0.46, 'epidemie', 'cloturee',
    TRUE,
    'Investigation menée du 16 au 20 mai 2026. Foyer identifié dans le quartier Bépanda (zone inondable). Eaux stagnantes post-pluies favorisant la prolifération des moustiques. Taux d''utilisation des MILDA à 45% seulement.',
    'Campagne de démoustication chimique et biologique (larvicides). Distribution massive de 5000 MILDA. Intensification du dépistage et traitement ACT gratuit.',
    ARRAY['Démoustication chimique', 'Distribution MILDA', 'Dépistage de masse', 'Traitement ACT gratuit', 'Sensibilisation porte-à-porte'],
    TRUE, '2026-05-16', FALSE,
    ST_SetSRID(ST_MakePoint(9.682, 4.038), 4326),
    3.5,
    28500, 5700,
    'Système de surveillance épidémiologique - CSI Bépanda',
    '{"pic_max_cas": 1120, "transmission": "communautaire", "facteurs_risque": ["inondations", "faible_utilisation_moustiquaires"], "semaine_epidemiologique": 20}'::jsonb
);

-- ============================================================
-- ALERTE 2: ALERT-PALU-002-2026 (Paludisme - Deido)
-- ============================================================
INSERT INTO alertes_epidemiques (
    code_alerte, id_maladie, id_org_unit,
    date_alerte, date_debut_symptomes, date_premier_cas,
    nb_cas_suspects, nb_cas_confirmes, nb_cas_probables, nb_deces, nb_gueris,
    taux_letalite, niveau_alerte, statut_alerte,
    investigation_realisee, action_prise, mesures_pees,
    notifie_minsante, date_notification, notifie_oms,
    coord_alerte, rayon_alerte_km,
    population_exposee, menages_exposes,
    source_information,
    metadata
) VALUES (
    'ALERT-PALU-002-2026',
    (SELECT id_maladie FROM maladies_prioritaires WHERE code_cim10 = 'B50'),
    (SELECT id_org_unit FROM organisation_units WHERE code = 'DIST-DLA'),
    '2026-05-20 14:15:00',
    '2026-05-01',
    '2026-05-05',
    420, 345, 52, 1, 0,
    0.24, 'alerte', 'confirmee',
    TRUE,
    'Investigation terrain: zone lagunaire Deido. Forte densité de population. Présence de gîtes larvaires nombreux.',
    ARRAY['Traitement des gîtes larvaires', 'Distribution MILDA complémentaire', 'Sensibilisation en milieu scolaire'],
    TRUE, '2026-05-21', FALSE,
    ST_SetSRID(ST_MakePoint(9.720, 4.045), 4326),
    2.5,
    18500, 3700,
    'CSI Deido - Rapports consultations',
    '{"pic_max_cas": 580, "population_pecheurs": 1200, "semaine_epidemiologique": 20}'::jsonb
);

-- ============================================================
-- ALERTE 3: ALERT-FJ-001-2026 (Fièvre Jaune - Nkongsamba)
-- ============================================================
INSERT INTO alertes_epidemiques (
    code_alerte, id_maladie, id_org_unit,
    date_alerte, date_debut_symptomes, date_premier_cas,
    nb_cas_suspects, nb_cas_confirmes, nb_cas_probables, nb_deces, nb_gueris,
    taux_letalite, niveau_alerte, statut_alerte,
    investigation_realisee, rapport_investigation,
    action_prise, mesures_pees,
    notifie_minsante, date_notification, notifie_oms,
    coord_alerte, rayon_alerte_km,
    population_exposee, menages_exposes,
    source_information,
    metadata
) VALUES (
    'ALERT-FJ-001-2026',
    (SELECT id_maladie FROM maladies_prioritaires WHERE code_cim10 = 'A95'),
    (SELECT id_org_unit FROM organisation_units WHERE code = 'DIST-NKON'),
    '2026-09-05 09:30:00',
    '2026-08-20',
    '2026-08-25',
    2, 1, 1, 0, 2,
    0, 'alerte', 'cloturee',
    TRUE,
    'Cas confirmé fièvre jaune dans le district de Nkongsamba (plantations café). Couverture vaccinale insuffisante (62%). Patient de 35 ans, agriculteur. Détection par surveillance sentinelle.',
    'Campagne de vaccination massive ciblant 25000 personnes. Lutte antivectorielle. Sensibilisation communautaire.',
    ARRAY['Vaccination de masse', 'Lutte antivectorielle', 'Distribution MILDA', 'Surveillance renforcée'],
    TRUE, '2026-09-05', TRUE,
    ST_SetSRID(ST_MakePoint(9.938, 4.952), 4326),
    10.0,
    28500, 5700,
    'District Nkongsamba - Rapports sentinelle',
    '{"couverture_post": 91, "doses_administrees": 25600, "couverture_vaccinale_pre": 62}'::jsonb
);

-- ============================================================
-- ALERTE 4: ALERT-PALU-003-2026 (Paludisme - Edéa)
-- ============================================================
INSERT INTO alertes_epidemiques (
    code_alerte, id_maladie, id_org_unit,
    date_alerte, date_debut_symptomes, date_premier_cas,
    nb_cas_suspects, nb_cas_confirmes, nb_cas_probables, nb_deces, nb_gueris,
    taux_letalite, niveau_alerte, statut_alerte,
    investigation_realisee, rapport_investigation,
    action_prise, mesures_pees,
    notifie_minsante, date_notification, notifie_oms,
    coord_alerte, rayon_alerte_km,
    population_exposee, menages_exposes,
    source_information,
    metadata
) VALUES (
    'ALERT-PALU-003-2026',
    (SELECT id_maladie FROM maladies_prioritaires WHERE code_cim10 = 'B50'),
    (SELECT id_org_unit FROM organisation_units WHERE code = 'DIST-EDEA'),
    '2026-08-20 08:00:00',
    '2026-08-01',
    '2026-08-05',
    185, 142, 38, 2, 0,
    1.08, 'alerte', 'investiguee',
    TRUE,
    'Zone hautement endémique: communauté pêcheurs de Edéa. Forte prévalence paludisme chez enfants <5 ans. Difficulté accès au traitement (zone isolée, barrière fluviale).',
    'Distribution MILDA en zone lacustre. Formation agents de santé communautaire. Création poste de santé avancé.',
    ARRAY['Distribution MILDA', 'Formation ACS', 'Poste santé avancé', 'Chimioprophylaxie enfants'],
    TRUE, '2026-08-21', FALSE,
    ST_SetSRID(ST_MakePoint(10.128, 4.045), 4326),
    15.0,
    12500, 2500,
    'District Edéa - Système surveillance',
    '{"zone": "lagunaire", "acces": "fluvial", "enfants_mas": 12, "milada_utilisation": 38}'::jsonb
);

-- ============================================================
-- ALERTE 5: ALERT-CHOL-001-2026 (Choléra - Bépanda/Bonassama)
-- ============================================================
INSERT INTO alertes_epidemiques (
    code_alerte, id_maladie, id_org_unit,
    date_alerte, date_debut_symptomes, date_premier_cas,
    nb_cas_suspects, nb_cas_confirmes, nb_cas_probables, nb_deces, nb_gueris,
    taux_letalite, niveau_alerte, statut_alerte,
    investigation_realisee, rapport_investigation,
    action_prise, mesures_pees,
    notifie_minsante, date_notification, notifie_oms,
    coord_alerte, rayon_alerte_km, zone_influence,
    population_exposee, menages_exposes,
    source_information,
    metadata
) VALUES (
    'ALERT-CHOL-001-2026',
    (SELECT id_maladie FROM maladies_prioritaires WHERE code_cim10 = 'A00'),
    (SELECT id_org_unit FROM organisation_units WHERE code = 'H-BONASSAM-DLA'),
    '2026-05-25 08:45:00',
    '2026-05-18',
    '2026-05-20',
    5, 2, 3, 0, 5,
    0, 'alerte', 'cloturee',
    TRUE,
    'Foyer choléra à Bépanda suite aux inondations. Eau de puits contaminée identifiée. 2 cas confirmés par PCR au laboratoire. Tous pris en charge et guéris.',
    'Fermeture et traitement du puits contaminé. Distribution de chlore et pastilles Aquatabs. 1500 kits choléra distribués. Renforcement de la surveillance active.',
    ARRAY['Désinfection puits', 'Distribution chlore', 'Sensibilisation hygiène', 'Centre de traitement choléra', 'Surveillance active porte-à-porte'],
    TRUE, '2026-05-25', TRUE,
    ST_SetSRID(ST_MakePoint(9.680, 4.040), 4326),
    2.0,
    ST_Buffer(ST_SetSRID(ST_MakePoint(9.680, 4.040), 4326)::geography, 2000)::geometry,
    8500, 1700,
    'Hôpital Bonassama - Notifications cas suspects',
    '{"zone": "Bépanda", "traitement_effectue": "12_heures", "campagne_vaccination": "non", "source_contamination": "puits_communautaire"}'::jsonb
);

-- ============================================================
-- ALERTE 6: ALERT-ROUG-001-2026 (Rougeole - Ndogbong)
-- ============================================================
INSERT INTO alertes_epidemiques (
    code_alerte, id_maladie, id_org_unit,
    date_alerte, date_debut_symptomes, date_premier_cas,
    nb_cas_suspects, nb_cas_confirmes, nb_cas_probables, nb_deces, nb_gueris,
    taux_letalite, niveau_alerte, statut_alerte,
    investigation_realisee, rapport_investigation,
    action_prise, mesures_pees,
    notifie_minsante, date_notification, notifie_oms,
    coord_alerte, rayon_alerte_km, zone_influence,
    population_exposee, menages_exposes,
    source_information,
    metadata
) VALUES (
    'ALERT-ROUG-001-2026',
    (SELECT id_maladie FROM maladies_prioritaires WHERE code_cim10 = 'B05'),
    (SELECT id_org_unit FROM organisation_units WHERE code = 'DIST-DLA'),
    '2026-03-10 09:00:00',
    '2026-02-20',
    '2026-02-25',
    12, 10, 2, 0, 12,
    0, 'alerte', 'cloturee',
    TRUE,
    'Foyer rougeole dans l''école maternelle de Ndogbong. Couverture vaccinale Penta3 à 72%, insuffisante. 10 cas confirmés chez les enfants de 0-5 ans non vaccinés.',
    'Campagne de vaccination de rattrapage dans le quartier. 350 enfants vaccinés. Sensibilisation des parents. Renforcement du PEV.',
    ARRAY['Vaccination rattrapage', 'Sensibilisation porte-à-porte', 'Isolement cas', 'Supplémentation vitamine A'],
    TRUE, '2026-03-11', FALSE,
    ST_SetSRID(ST_MakePoint(9.735, 4.051), 4326),
    2.0,
    ST_Buffer(ST_SetSRID(ST_MakePoint(9.735, 4.051), 4326)::geography, 2000)::geometry,
    12500, 2500,
    'District Douala - Registre consultations CSI Ndogbong',
    '{"zone": "Ndogbong", "enfants_cibles": 380, "couverture_post_alerte": 89, "couverture_vaccinale_pre_alerte": 72}'::jsonb
);

-- ============================================================
-- ALERTE 7: ALERT-MEN-001-2026 (Méningite - Makepe)
-- ============================================================
INSERT INTO alertes_epidemiques (
    code_alerte, id_maladie, id_org_unit,
    date_alerte, date_debut_symptomes, date_premier_cas,
    nb_cas_suspects, nb_cas_confirmes, nb_cas_probables, nb_deces, nb_gueris,
    taux_letalite, niveau_alerte, statut_alerte,
    investigation_realisee, rapport_investigation,
    action_prise, mesures_pees,
    notifie_minsante, date_notification, notifie_oms,
    coord_alerte, rayon_alerte_km, zone_influence,
    population_exposee, menages_exposes,
    source_information,
    metadata
) VALUES (
    'ALERT-MEN-001-2026',
    (SELECT id_maladie FROM maladies_prioritaires WHERE code_cim10 = 'A39'),
    (SELECT id_org_unit FROM organisation_units WHERE code = 'DIST-DLA'),
    '2026-02-18 14:00:00',
    '2026-02-10',
    '2026-02-12',
    3, 2, 1, 1, 2,
    33.33, 'alerte', 'cloturee',
    TRUE,
    'Foyer méningite à méningocoque dans un collège de Makepe. 2 cas confirmés (enfants 12 et 14 ans), 1 décès. Chimioprophylaxie réalisée sur 150 contacts.',
    'Chemioprophylaxie massive (Ciprofloxacine). Vaccination de rattrapage. Sensibilisation en milieu scolaire.',
    ARRAY['Chemioprophylaxie contacts', 'Vaccination élèves', 'Désinfection établissement', 'Surveillance active'],
    TRUE, '2026-02-18', TRUE,
    ST_SetSRID(ST_MakePoint(9.700, 4.060), 4326),
    1.0,
    ST_Buffer(ST_SetSRID(ST_MakePoint(9.700, 4.060), 4326)::geography, 1000)::geometry,
    3200, 800,
    'District Douala - Signalement scolaire CSI Makepe',
    '{"zone": "Makepe", "classe": "4eme", "vaccination": 320, "etablissement": "College Saint Augustin", "chimioprophylaxie": 150}'::jsonb
);

-- ============================================================
-- ALERTE 8: ALERT-DIAR-001-2026 (Diarrhées - Bonabéri)
-- ============================================================
-- Nécessite d'abord d'ajouter la maladie A09
INSERT INTO maladies_prioritaires (
    code_cim10, nom_maladie, type_maladie, declaration_obligatoire, declaration_hebdomadaire,
    seuil_alerte_cas, seuil_epidemique_cas, seuil_critique,
    duree_incubation_jours, duree_contagiosite_jours,
    symptomes_caracteristiques, traitement_recommande, vaccination_existe,
    zones_risque_littoral, notification_minsante, delai_notification_heures, actif
) VALUES (
    'A09', 'Diarrhée et gastro-entérite d''origine présumée infectieuse', 'epidemique', FALSE, TRUE,
    20, 50, 100,
    3, 7,
    'Diarrhée aqueuse ou sanglante, vomissements, douleurs abdominales, fièvre modérée, déshydratation',
    'Réhydratation orale ou IV, sels de réhydratation orale, zinc pour enfants, probiotiques',
    FALSE,
    ARRAY['Zone portuaire', 'Zone inondable', 'Bonabéri', 'Bépanda'],
    FALSE, NULL, TRUE
);

-- Puis l'alerte
INSERT INTO alertes_epidemiques (
    code_alerte, id_maladie, id_org_unit,
    date_alerte, date_debut_symptomes, date_premier_cas,
    nb_cas_suspects, nb_cas_confirmes, nb_cas_probables, nb_deces, nb_gueris,
    taux_letalite, niveau_alerte, statut_alerte,
    investigation_realisee, rapport_investigation,
    action_prise, mesures_pees,
    notifie_minsante, date_notification, notifie_oms,
    coord_alerte, rayon_alerte_km, zone_influence,
    population_exposee, menages_exposes,
    source_information,
    metadata
) VALUES (
    'ALERT-DIAR-001-2026',
    (SELECT id_maladie FROM maladies_prioritaires WHERE code_cim10 = 'A09'),
    (SELECT id_org_unit FROM organisation_units WHERE code = 'CMA-DOUALA2'),
    '2026-02-15 10:00:00',
    '2026-02-01',
    '2026-02-05',
    125, 0, 125, 0, 125,
    0, 'vigilance', 'cloturee',
    TRUE,
    'Pic de diarrhées chez dockers et communauté portuaire de Bonabéri. Problème d''approvisionnement eau potable dans zone portuaire. Eau impropre à la consommation détectée.',
    'Distribution eau potable (camions-citernes). Pastilles de chlore. Sensibilisation hygiène. Réhabilitation borne fontaine.',
    ARRAY['Distribution eau potable', 'Pastilles chlore', 'Sensibilisation hygiène', 'Réhabilitation borne fontaine'],
    TRUE, '2026-02-16', FALSE,
    ST_SetSRID(ST_MakePoint(9.660, 4.080), 4326),
    2.0,
    ST_Buffer(ST_SetSRID(ST_MakePoint(9.660, 4.080), 4326)::geography, 2000)::geometry,
    8500, 1700,
    'CMA Douala 2 - Registre consultations Bonabéri',
    '{"zone": "Bonabéri_portuaire", "origine_eau": "puits_non_protege", "concentration": ">100 UFC/100ml", "type_prelevement": "Escherichia coli"}'::jsonb
);

-- ============================================================
-- ALERTE 9: ALERT-PALU-004-2026 (Paludisme scolaire - Ndogbong/Makepe)
-- ============================================================
INSERT INTO alertes_epidemiques (
    code_alerte, id_maladie, id_org_unit,
    date_alerte, date_debut_symptomes, date_premier_cas,
    nb_cas_suspects, nb_cas_confirmes, nb_cas_probables, nb_deces, nb_gueris,
    taux_letalite, niveau_alerte, statut_alerte,
    investigation_realisee, action_prise, mesures_pees,
    notifie_minsante, date_notification, notifie_oms,
    coord_alerte, rayon_alerte_km, zone_influence,
    population_exposee, menages_exposes,
    source_information,
    metadata
) VALUES (
    'ALERT-PALU-004-2026',
    (SELECT id_maladie FROM maladies_prioritaires WHERE code_cim10 = 'B50'),
    (SELECT id_org_unit FROM organisation_units WHERE code = 'DIST-DLA'),
    '2026-11-25 11:00:00',
    '2026-11-01',
    '2026-11-05',
    95, 78, 12, 0, 0,
    0, 'vigilance', 'investiguee',
    TRUE,
    'Rentrée scolaire dans le district Douala: 45 cas chez enfants de 5-14 ans (58% des cas du mois). MILDA usées ou inexistantes dans 60% des ménages.',
    ARRAY['Distribution MILDA écoles', 'Dépistage scolaire', 'Traitement gratuit', 'Éducation santé'],
    TRUE, '2026-11-26', FALSE,
    ST_SetSRID(ST_MakePoint(9.735, 4.051), 4326),
    3.0,
    ST_Buffer(ST_SetSRID(ST_MakePoint(9.735, 4.051), 4326)::geography, 3000)::geometry,
    25000, 5000,
    'District Douala - Registre scolaire',
    '{"zone": "Ndogbong_Makepe", "traitement_act": 78, "milada_scolaires": 1800, "enfants_scolarises": 3200}'::jsonb
);


-- ============================================================
-- ALERTE 10: DENGUE - Zone portuaire Bonabéri (Saison des pluies)
-- ============================================================
INSERT INTO alertes_epidemiques (
    code_alerte, id_maladie, id_org_unit, date_alerte,
    date_debut_symptomes, date_premier_cas,
    nb_cas_suspects, nb_cas_confirmes, nb_cas_probables, nb_deces, nb_gueris,
    niveau_alerte, statut_alerte, investigation_realisee,
    action_prise, mesures_pees, notifie_minsante, date_notification,
    coord_alerte, rayon_alerte_km, zone_influence,
    population_exposee, menages_exposes, source_information,
    metadata
) VALUES (
    'ALERT-DENG-001-2026',
    (SELECT id_maladie FROM maladies_prioritaires WHERE code_cim10 = 'A90'),
    (SELECT id_org_unit FROM organisation_units WHERE code = 'CMA-DOUALA2'),
    '2026-06-10 09:00:00',
    '2026-05-25',
    '2026-05-28',
    45, 28, 12, 0, 40,
    'alerte', 'cloturee', TRUE,
    'Foyer dengue à Bonabéri. Eaux stagnantes dans zone portuaire. Aedes aegypti identifiés. 28 cas confirmés par PCR.',
    ARRAY['Démoustication', 'Élimination gîtes larvaires', 'Sensibilisation', 'Distribution MILDA'],
    TRUE, '2026-06-11',
    ST_SetSRID(ST_MakePoint(9.660, 4.080), 4326), 2.0,
    ST_Buffer(ST_SetSRID(ST_MakePoint(9.660, 4.080), 4326)::geography, 2000)::geometry,
    12000, 2400,
    'CMA Douala 2 - Surveillance dengue',
    '{"vecteur": "Aedes aegypti", "type_alerte": "dengue", "zone": "Bonabéri_portuaire"}'::jsonb
);
-- ============================================================
-- ALERTE 11: SCHISTOSOMIASE - Zone Sanaga-Maritime (Edéa)
-- ============================================================
INSERT INTO alertes_epidemiques (
    code_alerte, id_maladie, id_org_unit, date_alerte,
    date_debut_symptomes, date_premier_cas,
    nb_cas_suspects, nb_cas_confirmes, nb_cas_probables, nb_deces, nb_gueris,
    niveau_alerte, statut_alerte, investigation_realisee,
    action_prise, mesures_pees,
    notifie_minsante, date_notification, notifie_oms,
    coord_alerte, rayon_alerte_km, zone_influence,
    population_exposee, menages_exposes, source_information,
    metadata
) VALUES (
    'ALERT-SCH-001-2026',
    (SELECT id_maladie FROM maladies_prioritaires WHERE code_cim10 = 'B65'),
    (SELECT id_org_unit FROM organisation_units WHERE code = 'DIST-EDEA'),
    '2026-07-15 08:30:00',
    '2026-06-20',
    '2026-06-25',
    120, 85, 25, 0, 85,
    'alerte', 'investiguee', TRUE,
    'Campagne de masse Praziquantel. Sensibilisation hygiène. Traitement eau.',
    ARRAY['Traitement masse Praziquantel', 'Sensibilisation', 'Assainissement eau'],
    TRUE, '2026-07-16', FALSE,
    ST_SetSRID(ST_MakePoint(10.128, 4.045), 4326), 15.0,
    ST_Buffer(ST_SetSRID(ST_MakePoint(10.128, 4.045), 4326)::geography, 15000)::geometry,
    18000, 3600,
    'District Edéa - Surveillance bilharziose',
    '{"type_alerte": "schistosomiase", "zone_hydromorphe": true, "population_pecheurs": 2500, "description": "Foyer de bilharziose dans communauté de pêcheurs de Dizangué. Lacs et cours d''eau contaminés. 85 cas confirmés dont 30 enfants."}'::jsonb
);
-- ============================================================
-- ALERTE 12: INONDATIONS - Zone Bépanda (Catastrophe sanitaire)
-- Version CORRIGÉE (avec niveau_alerte = 'pandemie')
-- ============================================================
INSERT INTO alertes_epidemiques (
    code_alerte, id_maladie, id_org_unit, date_alerte,
    date_debut_symptomes, date_premier_cas,
    nb_cas_suspects, nb_cas_confirmes, nb_cas_probables, nb_deces, nb_gueris,
    niveau_alerte, statut_alerte, investigation_realisee,
    action_prise, mesures_pees,
    notifie_minsante, date_notification, notifie_oms,
    coord_alerte, rayon_alerte_km, zone_influence,
    population_exposee, menages_exposes, source_information,
    metadata
) VALUES (
    'ALERT-INOND-001-2026',
    (SELECT id_maladie FROM maladies_prioritaires WHERE code_cim10 = 'A00'),
    (SELECT id_org_unit FROM organisation_units WHERE code = 'CSI-BONANJO'),
    '2026-06-01 07:00:00',
    '2026-05-28',
    '2026-05-29',
    0, 0, 0, 2, 0,
    'pandemie', 'cloturee', TRUE,
    'Installation camps déplacés. Distribution kits hygiène. Surveillance épidémiologique renforcée.',
    ARRAY['Évacuation sinistrés', 'Distribution kits hygiène', 'Eau potable', 'Surveillance renforcée'],
    TRUE, '2026-06-01', TRUE,
    ST_SetSRID(ST_MakePoint(9.680, 4.040), 4326), 3.0,
    ST_Buffer(ST_SetSRID(ST_MakePoint(9.680, 4.040), 4326)::geography, 3000)::geometry,
    45000, 9000,
    'DGPC - Gestion catastrophes',
    '{"type_alerte": "inondation", "niveau": "catastrophe_sanitaire", "deplaces": 5000, "hauteur_eau": 2.5, "duree_alerte": "168h", "description": "Inondations majeures à Bépanda suite à 72h de pluies continues. 2 noyés. 5000 déplacés. Risque maladies hydriques élevé."}'::jsonb
);

-- ============================================================
-- ALERTE 13: VIH - Zone industrielle Bassa (Nouveaux cas)
-- ============================================================
INSERT INTO alertes_epidemiques (
    code_alerte, id_maladie, id_org_unit, date_alerte,
    date_debut_symptomes, date_premier_cas,
    nb_cas_suspects, nb_cas_confirmes, nb_cas_probables, nb_deces, nb_gueris,
    niveau_alerte, statut_alerte, investigation_realisee,
    action_prise, mesures_pees,
    notifie_minsante, date_notification, notifie_oms,
    coord_alerte, rayon_alerte_km, zone_influence,
    population_exposee, menages_exposes, source_information,
    metadata
) VALUES (
    'ALERT-VIH-001-2026',
    (SELECT id_maladie FROM maladies_prioritaires WHERE code_cim10 = 'B20'),
    (SELECT id_org_unit FROM organisation_units WHERE code = 'DIST-DLA'),
    '2026-09-30 14:00:00',
    NULL,
    NULL,
    124, 87, 37, 12, 0,
    'vigilance', 'investiguee', TRUE,
    'Dépistage mobile zone industrielle. Distribution préservatifs. ARV gratuit.',
    ARRAY['Dépistage communautaire', 'Distribution préservatifs', 'ARV gratuit'],
    TRUE, '2026-10-01', FALSE,
    ST_SetSRID(ST_MakePoint(9.690, 4.035), 4326), 4.0,
    ST_Buffer(ST_SetSRID(ST_MakePoint(9.690, 4.035), 4326)::geography, 4000)::geometry,
    45000, 9000,
    'PNLS - Nouveaux cas VIH',
    '{"type_alerte": "VIH", "augmentation": 15, "population_cible": "ouvriers_industriels", "cd4_moyen": 320, "description": "Augmentation 15% nouveaux cas VIH. Zone industrielle Bassa concentre 40% des nouveaux cas. Profil: ouvriers migrants 25-40 ans."}'::jsonb
);

-- ============================================================
-- ALERTE 14: CHIKUNGUNYA - Zone urbaine dense (Akwa/Bonapriso)
-- ============================================================
INSERT INTO alertes_epidemiques (
    code_alerte, id_maladie, id_org_unit, date_alerte,
    date_debut_symptomes, date_premier_cas,
    nb_cas_suspects, nb_cas_confirmes, nb_cas_probables, nb_deces, nb_gueris,
    niveau_alerte, statut_alerte, investigation_realisee,
    action_prise, mesures_pees,
    notifie_minsante, date_notification, notifie_oms,
    coord_alerte, rayon_alerte_km, zone_influence,
    population_exposee, menages_exposes, source_information,
    metadata
) VALUES (
    'ALERT-CHIK-001-2026',
    (SELECT id_maladie FROM maladies_prioritaires WHERE code_cim10 = 'A92'),
    (SELECT id_org_unit FROM organisation_units WHERE code = 'H-LAQUINTINIE-DLA'),
    '2026-07-10 10:00:00',
    '2026-06-25',
    '2026-06-28',
    180, 95, 45, 0, 140,
    'alerte', 'cloturee', TRUE,
    'Opérations de démoustication. Distribution MILDA. Sensibilisation communautaire.',
    ARRAY['Démoustication chimique', 'Élimination gîtes', 'Sensibilisation porte-à-porte', 'Traitement symptomatique'],
    TRUE, '2026-07-11', FALSE,
    ST_SetSRID(ST_MakePoint(9.710, 4.049), 4326), 2.5,
    ST_Buffer(ST_SetSRID(ST_MakePoint(9.710, 4.049), 4326)::geography, 2500)::geometry,
    120000, 24000,
    'Hôpital Laquintinie - Surveillance arboviroses',
    '{"type_alerte": "chikungunya", "vecteur": "Aedes aegypti", "description": "Foyer de Chikungunya dans les quartiers denses d''Akwa et Bonapriso. Forte densité de population. 95 cas confirmés. Arthralgies invalidantes chez 80% des patients.", "zone": "Akwa_Bonapriso"}'::jsonb
);

-- ============================================================
-- ALERTE 15: PALUDISME GRAVE PEDIATRIQUE - Zone Ndogbong
-- ============================================================
INSERT INTO alertes_epidemiques (
    code_alerte, id_maladie, id_org_unit, date_alerte,
    date_debut_symptomes, date_premier_cas,
    nb_cas_suspects, nb_cas_confirmes, nb_cas_probables, nb_deces, nb_gueris,
    niveau_alerte, statut_alerte, investigation_realisee,
    action_prise, mesures_pees,
    notifie_minsante, date_notification, notifie_oms,
    coord_alerte, rayon_alerte_km, zone_influence,
    population_exposee, menages_exposes, source_information,
    metadata
) VALUES (
    'ALERT-PALU-PED-001-2026',
    (SELECT id_maladie FROM maladies_prioritaires WHERE code_cim10 = 'B50'),
    (SELECT id_org_unit FROM organisation_units WHERE code = 'CSI-NDOKOTI'),
    '2026-07-20 09:00:00',
    '2026-07-01',
    '2026-07-05',
    210, 165, 32, 5, 200,
    'alerte', 'investiguee', TRUE,
    'Distribution MILDA ciblée. Prise en charge pédiatrique gratuite. Sensibilisation mères.',
    ARRAY['Distribution MILDA', 'Traitement ACT gratuit', 'Prise charge pédiatrique', 'Sensibilisation'],
    TRUE, '2026-07-21', FALSE,
    ST_SetSRID(ST_MakePoint(9.735, 4.051), 4326), 1.5,
    ST_Buffer(ST_SetSRID(ST_MakePoint(9.735, 4.051), 4326)::geography, 1500)::geometry,
    8200, 1640,
    'CSI Ndogbong - Registre pédiatrique',
    '{"type_alerte": "paludisme_pediatrique", "description": "Pic de paludisme grave chez les enfants de moins de 5 ans à Ndogbong. 5 décès enregistrés en 15 jours. Anémie sévère chez 45% des cas. Zone inondable favorisant la transmission.", "tranche_age": "0-5_ans", "taux_letalite": 2.4}'::jsonb
);
-- ============================================================
-- ALERTE 15: PALUDISME GRAVE PEDIATRIQUE - Zone Ndogbong
-- Version CORRIGÉE (avec CSI-BONANJO)
-- ============================================================
INSERT INTO alertes_epidemiques (
    code_alerte, id_maladie, id_org_unit, date_alerte,
    date_debut_symptomes, date_premier_cas,
    nb_cas_suspects, nb_cas_confirmes, nb_cas_probables, nb_deces, nb_gueris,
    niveau_alerte, statut_alerte, investigation_realisee,
    action_prise, mesures_pees,
    notifie_minsante, date_notification, notifie_oms,
    coord_alerte, rayon_alerte_km, zone_influence,
    population_exposee, menages_exposes, source_information,
    metadata
) VALUES (
    'ALERT-PALU-PED-001-2026',
    (SELECT id_maladie FROM maladies_prioritaires WHERE code_cim10 = 'B50'),
    (SELECT id_org_unit FROM organisation_units WHERE code = 'CSI-BONANJO'),
    '2026-07-20 09:00:00',
    '2026-07-01',
    '2026-07-05',
    210, 165, 32, 5, 200,
    'alerte', 'investiguee', TRUE,
    'Distribution MILDA ciblée. Prise en charge pédiatrique gratuite. Sensibilisation mères.',
    ARRAY['Distribution MILDA', 'Traitement ACT gratuit', 'Prise charge pédiatrique', 'Sensibilisation'],
    TRUE, '2026-07-21', FALSE,
    ST_SetSRID(ST_MakePoint(9.735, 4.051), 4326), 1.5,
    ST_Buffer(ST_SetSRID(ST_MakePoint(9.735, 4.051), 4326)::geography, 1500)::geometry,
    8200, 1640,
    'CSI Bonanjo - Registre pédiatrique',
    '{"type_alerte": "paludisme_pediatrique", "description": "Pic de paludisme grave chez les enfants de moins de 5 ans à Ndogbong. 5 décès enregistrés en 15 jours. Anémie sévère chez 45% des cas. Zone inondable favorisant la transmission.", "tranche_age": "0-5_ans", "taux_letalite": 2.4}'::jsonb
);
-- ============================================================
-- ALERTE 16: POLIOMYÉLITE - Cas suspect (surveillance active)
-- ============================================================
INSERT INTO alertes_epidemiques (
    code_alerte, id_maladie, id_org_unit, date_alerte,
    date_debut_symptomes, date_premier_cas,
    nb_cas_suspects, nb_cas_confirmes, nb_cas_probables, nb_deces, nb_gueris,
    niveau_alerte, statut_alerte, investigation_realisee,
    action_prise, mesures_pees,
    notifie_minsante, date_notification, notifie_oms,
    coord_alerte, rayon_alerte_km, zone_influence,
    population_exposee, menages_exposes, source_information,
    metadata
) VALUES (
    'ALERT-POLIO-001-2026',
    (SELECT id_maladie FROM maladies_prioritaires WHERE code_cim10 = 'A80'),
    (SELECT id_org_unit FROM organisation_units WHERE code = 'H-GEN-DLA'),
    '2026-08-05 11:30:00',
    '2026-07-20',
    '2026-07-25',
    2, 0, 1, 0, 0,
    'alerte', 'cloturee', TRUE,
    'Investigation laboratoire. Vaccination de rattrapage zone. Surveillance active.',
    ARRAY['Investigation', 'Vaccination rattrapage', 'Surveillance active', 'Prélèvements'],
    TRUE, '2026-08-05', TRUE,
    ST_SetSRID(ST_MakePoint(9.700, 4.042), 4326), 5.0,
    ST_Buffer(ST_SetSRID(ST_MakePoint(9.700, 4.042), 4326)::geography, 5000)::geometry,
    50000, 10000,
    'Hôpital Général - Surveillance paralysies flasques',
    '{"type_alerte": "poliomyelite_suspecte", "description": "Cas suspect de poliomyélite chez enfant de 3 ans à Bali. Paralysie flasque aiguë des membres inférieurs. Investigations en cours. Prélèvements envoyés au laboratoire de référence. Vaccination de rattrapage organisée.", "statut_labo": "en_cours", "couverture_vaccinale_zone": 78}'::jsonb
);

-- ============================================================
-- ALERTE 17: IRA GRAVE - Zone industrielle (pollution)
-- ============================================================
INSERT INTO alertes_epidemiques (
    code_alerte, id_maladie, id_org_unit, date_alerte,
    date_debut_symptomes, date_premier_cas,
    nb_cas_suspects, nb_cas_confirmes, nb_cas_probables, nb_deces, nb_gueris,
    niveau_alerte, statut_alerte, investigation_realisee,
    action_prise, mesures_pees,
    notifie_minsante, date_notification, notifie_oms,
    coord_alerte, rayon_alerte_km, zone_influence,
    population_exposee, menages_exposes, source_information,
    metadata
) VALUES (
    'ALERT-IRA-001-2026',
    (SELECT id_maladie FROM maladies_prioritaires WHERE code_cim10 = 'B50'),
    (SELECT id_org_unit FROM organisation_units WHERE code = 'H-LOGBABA-DLA'),
    '2026-10-15 08:00:00',
    '2026-10-01',
    '2026-10-03',
    350, 220, 85, 8, 310,
    'alerte', 'investiguee', TRUE,
    'Distribution masques. Sensibilisation. Consultation respiratoire gratuite.',
    ARRAY['Distribution masques', 'Consultation gratuite', 'Sensibilisation', 'Mesures pollution'],
    TRUE, '2026-10-16', FALSE,
    ST_SetSRID(ST_MakePoint(9.690, 4.035), 4326), 2.0,
    ST_Buffer(ST_SetSRID(ST_MakePoint(9.690, 4.035), 4326)::geography, 2000)::geometry,
    35000, 7000,
    'Hôpital Logbaba - Surveillance respiratoire',
    '{"type_alerte": "IRA_grave", "description": "Pic d''infections respiratoires aiguës graves en zone industrielle de Logbaba. 8 décès dont 5 enfants. Forte corrélation avec pics de pollution. Antécédents de BPCO chez 60% des cas.", "facteur_risque": "pollution_industrielle", "population_ouvriere": 15000}'::jsonb
);

-- ============================================================
-- ALERTE 18: TUBERCULOSE MULTIRÉSISTANTE - Zone Logbaba
-- ============================================================
INSERT INTO alertes_epidemiques (
    code_alerte, id_maladie, id_org_unit, date_alerte,
    date_debut_symptomes, date_premier_cas,
    nb_cas_suspects, nb_cas_confirmes, nb_cas_probables, nb_deces, nb_gueris,
    niveau_alerte, statut_alerte, investigation_realisee,
    action_prise, mesures_pees,
    notifie_minsante, date_notification, notifie_oms,
    coord_alerte, rayon_alerte_km, zone_influence,
    population_exposee, menages_exposes, source_information,
    metadata
) VALUES (
    'ALERT-TB-MR-001-2026',
    (SELECT id_maladie FROM maladies_prioritaires WHERE code_cim10 = 'A15'),
    (SELECT id_org_unit FROM organisation_units WHERE code = 'H-LOGBABA-DLA'),
    '2026-11-10 09:30:00',
    NULL,
    NULL,
    45, 12, 18, 6, 0,
    'alerte', 'investiguee', TRUE,
    'Traitement TB-MR. Isolement patients. Dépistage contacts. Enquête environnementale.',
    ARRAY['Traitement TB-MR', 'Isolement strict', 'Dépistage contacts', 'Enquête'],
    TRUE, '2026-11-11', TRUE,
    ST_SetSRID(ST_MakePoint(9.695, 4.038), 4326), 1.5,
    ST_Buffer(ST_SetSRID(ST_MakePoint(9.695, 4.038), 4326)::geography, 1500)::geometry,
    15000, 3000,
    'PNLT - Surveillance TB multirésistante',
    '{"type_alerte": "tuberculose_multiresistante", "description": "Foyer de tuberculose multirésistante en zone industrielle Logbaba. 12 cas confirmés MDR-TB. Résistance à Rifampicine et Isoniazide identifiée. 6 décès. Co-infection VIH chez 50% des cas.", "taux_resistance": 35, "co_infection_VIH": 50}'::jsonb
);

-- ============================================================
-- ALERTE 19: ONCHOCERCOSE - Zone Moungo (cécité des rivières)
-- ============================================================
INSERT INTO alertes_epidemiques (
    code_alerte, id_maladie, id_org_unit, date_alerte,
    date_debut_symptomes, date_premier_cas,
    nb_cas_suspects, nb_cas_confirmes, nb_cas_probables, nb_deces, nb_gueris,
    niveau_alerte, statut_alerte, investigation_realisee,
    action_prise, mesures_pees,
    notifie_minsante, date_notification, notifie_oms,
    coord_alerte, rayon_alerte_km, zone_influence,
    population_exposee, menages_exposes, source_information,
    metadata
) VALUES (
    'ALERT-ONCHO-001-2026',
    (SELECT id_maladie FROM maladies_prioritaires WHERE code_cim10 = 'B73'),
    (SELECT id_org_unit FROM organisation_units WHERE code = 'H-NKONGSAMBA'),
    '2026-04-10 08:00:00',
    NULL,
    NULL,
    85, 52, 22, 2, 0,
    'alerte', 'cloturee', TRUE,
    'Campagne ivermectine. Lutte antivectorielle (simulies). Sensibilisation.',
    ARRAY['Distribution ivermectine', 'Lutte antivectorielle', 'Dépistage ophtalmologique', 'Sensibilisation'],
    TRUE, '2026-04-11', TRUE,
    ST_SetSRID(ST_MakePoint(9.850, 4.718), 4326), 20.0,
    ST_Buffer(ST_SetSRID(ST_MakePoint(9.850, 4.718), 4326)::geography, 20000)::geometry,
    45000, 9000,
    'District Loum - Surveillance onchocercose',
    '{"type_alerte": "onchocercose", "description": "Foyer actif d''onchocercose dans la zone rurale de Loum/Nkongsamba. 52 cas confirmés. 2 cas de cécité irréversible. Nodules sous-cutanés chez 80% des patients. Zones de cours d''eau à simulies identifiées.", "vecteur": "simulies", "traitement_masse": "ivermectine"}'::jsonb
);

-- ============================================================
-- ALERTE 20: MALNUTRITION AIGUË SÉVÈRE - Zone Ndogbong (période soudure)
-- Version CORRIGÉE (avec CSI-BONANJO)
-- ============================================================
INSERT INTO alertes_epidemiques (
    code_alerte, id_maladie, id_org_unit, date_alerte,
    date_debut_symptomes, date_premier_cas,
    nb_cas_suspects, nb_cas_confirmes, nb_cas_probables, nb_deces, nb_gueris,
    niveau_alerte, statut_alerte, investigation_realisee,
    action_prise, mesures_pees,
    notifie_minsante, date_notification, notifie_oms,
    coord_alerte, rayon_alerte_km, zone_influence,
    population_exposee, menages_exposes, source_information,
    metadata
) VALUES (
    'ALERT-NUT-001-2026',
    (SELECT id_maladie FROM maladies_prioritaires WHERE code_cim10 = 'E11'),
    (SELECT id_org_unit FROM organisation_units WHERE code = 'CSI-BONANJO'),
    '2026-05-10 10:00:00',
    '2026-04-15',
    '2026-04-20',
    95, 78, 12, 4, 0,
    'alerte', 'cloturee', TRUE,
    'Distribution PlumpyNut. Prise charge médicale. Sensibilisation nutrition.',
    ARRAY['Distribution PlumpyNut', 'Prise charge MAS', 'Sensibilisation', 'Suivi domicile'],
    TRUE, '2026-05-11', FALSE,
    ST_SetSRID(ST_MakePoint(9.735, 4.051), 4326), 1.5,
    ST_Buffer(ST_SetSRID(ST_MakePoint(9.735, 4.051), 4326)::geography, 1500)::geometry,
    8200, 1640,
    'CSI Bonanjo - Programme nutrition',
    '{"type_alerte": "malnutrition_severe", "description": "Pic de malnutrition aiguë sévère à Ndogbong en période de soudure. 78 enfants de moins de 5 ans diagnostiqués MAS. 4 décès par complications. PB moyenne 112mm. Facteurs: insécurité alimentaire, inondations.", "tranche_age": "0-5_ans", "PB_moyen": 112, "urgence": "MAS"}'::jsonb
);
-- ============================================================
-- ALERTE 21: ACCIDENT INDUSTRIEL - Zone Bassa/Logbaba
-- Version CORRIGÉE (niveau_alerte = 'pandemie')
-- ============================================================
INSERT INTO alertes_epidemiques (
    code_alerte, id_maladie, id_org_unit, date_alerte,
    date_debut_symptomes, date_premier_cas,
    nb_cas_suspects, nb_cas_confirmes, nb_cas_probables, nb_deces, nb_gueris,
    niveau_alerte, statut_alerte, investigation_realisee,
    action_prise, mesures_pees,
    notifie_minsante, date_notification, notifie_oms,
    coord_alerte, rayon_alerte_km, zone_influence,
    population_exposee, menages_exposes, source_information,
    metadata
) VALUES (
    'ALERT-INDUS-001-2026',
    (SELECT id_maladie FROM maladies_prioritaires WHERE code_cim10 = 'A00'),
    (SELECT id_org_unit FROM organisation_units WHERE code = 'H-LOGBABA-DLA'),
    '2026-09-20 14:00:00',
    '2026-09-20',
    '2026-09-20',
    35, 28, 5, 2, 25,
    'pandemie', 'cloturee', TRUE,
    'Prise charge urgences. Déclenchement plan ORSEC. Investigations environnementales.',
    ARRAY['Plan ORSEC', 'Triage blessés', 'Évacuation urgences', 'Enquête environnementale'],
    TRUE, '2026-09-20', TRUE,
    ST_SetSRID(ST_MakePoint(9.690, 4.035), 4326), 1.0,
    ST_Buffer(ST_SetSRID(ST_MakePoint(9.690, 4.035), 4326)::geography, 1000)::geometry,
    5000, 1000,
    'DGSN - Direction Générale de la Sécurité Nationale',
    '{"type_alerte": "accident_industriel", "niveau_reel": "catastrophe_sanitaire", "description": "Explosion dans une usine chimique de la zone industrielle de Bassa. 2 décès, 28 blessés dont 15 graves. Évacuation du personnel. Périmètre de sécurité établi. Risque de fuite de produits toxiques.", "type_accident": "explosion", "industrie": "produits_chimiques", "plan_orsek": "déclenché"}'::jsonb
);
-- ============================================================
-- ALERTE 22: INTOXICATION ALIMENTAIRE COLLECTIVE - Marché Deido
-- ============================================================
INSERT INTO alertes_epidemiques (
    code_alerte, id_maladie, id_org_unit, date_alerte,
    date_debut_symptomes, date_premier_cas,
    nb_cas_suspects, nb_cas_confirmes, nb_cas_probables, nb_deces, nb_gueris,
    niveau_alerte, statut_alerte, investigation_realisee,
    action_prise, mesures_pees,
    notifie_minsante, date_notification, notifie_oms,
    coord_alerte, rayon_alerte_km, zone_influence,
    population_exposee, menages_exposes, source_information,
    metadata
) VALUES (
    'ALERT-TOX-001-2026',
    (SELECT id_maladie FROM maladies_prioritaires WHERE code_cim10 = 'A09'),
    (SELECT id_org_unit FROM organisation_units WHERE code = 'H-DEIDO-DLA'),
    '2026-12-15 10:30:00',
    '2026-12-13',
    '2026-12-14',
    85, 42, 35, 1, 80,
    'alerte', 'cloturee', TRUE,
    'Retrait produit incriminé. Prise charge gratuite. Enquête vétérinaire.',
    ARRAY['Retrait produit', 'Prise charge gratuité', 'Enquête vétérinaire', 'Sensibilisation'],
    TRUE, '2026-12-16', FALSE,
    ST_SetSRID(ST_MakePoint(9.740, 4.039), 4326), 1.0,
    ST_Buffer(ST_SetSRID(ST_MakePoint(9.740, 4.039), 4326)::geography, 1000)::geometry,
    12000, 2400,
    'Hôpital Deido - Urgences',
    '{"type_alerte": "intoxication_alimentaire", "description": "Intoxication alimentaire collective au marché de Deido. 85 cas suspects, 42 confirmés. Poisson avarié contaminé par histamine. 1 décès (enfant de 3 ans). Retrait du produit du marché.", "produit_incrimine": "poisson", "toxine": "histamine", "provenance": "Deido_marché"}'::jsonb
);

-- ============================================================
-- ALERTE 23: ÉPIDÉMIE MILIEU CARCÉRAL - Prison New Bell
-- ============================================================
INSERT INTO alertes_epidemiques (
    code_alerte, id_maladie, id_org_unit, date_alerte,
    date_debut_symptomes, date_premier_cas,
    nb_cas_suspects, nb_cas_confirmes, nb_cas_probables, nb_deces, nb_gueris,
    niveau_alerte, statut_alerte, investigation_realisee,
    action_prise, mesures_pees,
    notifie_minsante, date_notification, notifie_oms,
    coord_alerte, rayon_alerte_km, zone_influence,
    population_exposee, menages_exposes, source_information,
    metadata
) VALUES (
    'ALERT-PRISON-001-2026',
    (SELECT id_maladie FROM maladies_prioritaires WHERE code_cim10 = 'A39'),
    (SELECT id_org_unit FROM organisation_units WHERE code = 'DIST-DLA'),
    '2026-03-25 13:00:00',
    '2026-03-15',
    '2026-03-18',
    45, 25, 15, 3, 20,
    'alerte', 'cloturee', TRUE,
    'Isolement cas. Chemioprophylaxie. Vaccination. Désinfection cellules.',
    ARRAY['Isolement', 'Chemioprophylaxie', 'Vaccination', 'Désinfection', 'Surveillance'],
    TRUE, '2026-03-26', TRUE,
    ST_SetSRID(ST_MakePoint(9.725, 4.055), 4326), 0.5,
    ST_Buffer(ST_SetSRID(ST_MakePoint(9.725, 4.055), 4326)::geography, 500)::geometry,
    4500, 0,
    'Administration pénitentiaire - Prison New Bell',
    '{"type_alerte": "epidemie_milieu_carceral", "description": "Foyer de méningite à méningocoque à la prison centrale de New Bell. Surpopulation carcérale (capacité 1500, effectif 4500). 45 cas suspects, 25 confirmés. 3 décès. Chimioprophylaxie de masse réalisée.", "milieu": "prison", "surpopulation": 300, "taux_attaque": 1.7}'::jsonb
);

-- ============================================================
-- ALERTE 24: ROUGEOLE - Zone rurale Nkam (Yabassi) - Faible couverture vaccinale
-- ============================================================
INSERT INTO alertes_epidemiques (
    code_alerte, id_maladie, id_org_unit, date_alerte,
    date_debut_symptomes, date_premier_cas,
    nb_cas_suspects, nb_cas_confirmes, nb_cas_probables, nb_deces, nb_gueris,
    niveau_alerte, statut_alerte, investigation_realisee,
    action_prise, mesures_pees,
    notifie_minsante, date_notification, notifie_oms,
    coord_alerte, rayon_alerte_km, zone_influence,
    population_exposee, menages_exposes, source_information,
    metadata
) VALUES (
    'ALERT-ROUG-NKAM-001-2026',
    (SELECT id_maladie FROM maladies_prioritaires WHERE code_cim10 = 'B05'),
    (SELECT id_org_unit FROM organisation_units WHERE code = 'DIST-YAB'),
    '2026-10-10 09:00:00',
    '2026-09-20',
    '2026-09-25',
    25, 22, 3, 1, 21,
    'alerte', 'cloturee', TRUE,
    'Vaccination massive. Traitement vitamine A. Sensibilisation communautaire.',
    ARRAY['Vaccination masse', 'Vitamine A', 'Sensibilisation', 'Renforcement PEV'],
    TRUE, '2026-10-11', FALSE,
    ST_SetSRID(ST_MakePoint(9.950, 4.450), 4326), 15.0,
    ST_Buffer(ST_SetSRID(ST_MakePoint(9.950, 4.450), 4326)::geography, 15000)::geometry,
    18500, 3700,
    'District Yabassi - Surveillance PEV',
    '{"type_alerte": "rougeole", "description": "Foyer rougeole dans le district sanitaire de Yabassi (Nkam). Couverture vaccinale insuffisante (68%). 22 cas confirmés, 1 décès chez enfant non vacciné. Difficulté accès aux soins en zone rurale.", "couverture_vaccinale": 68, "zone": "rurale_Nkam", "acces_soins": "difficile"}'::jsonb
);

-- ============================================================
-- ALERTE 25: PESTE - Zone rurale Moungo (surveillance)
-- ============================================================
INSERT INTO alertes_epidemiques (
    code_alerte, id_maladie, id_org_unit, date_alerte,
    date_debut_symptomes, date_premier_cas,
    nb_cas_suspects, nb_cas_confirmes, nb_cas_probables, nb_deces, nb_gueris,
    niveau_alerte, statut_alerte, investigation_realisee,
    action_prise, mesures_pees,
    notifie_minsante, date_notification, notifie_oms,
    coord_alerte, rayon_alerte_km, zone_influence,
    population_exposee, menages_exposes, source_information,
    metadata
) VALUES (
    'ALERT-PESTE-001-2026',
    (SELECT id_maladie FROM maladies_prioritaires WHERE code_cim10 = 'A20'),
    (SELECT id_org_unit FROM organisation_units WHERE code = 'H-NKONGSAMBA'),
    '2026-12-05 11:00:00',
    '2026-11-20',
    '2026-11-25',
    8, 3, 5, 2, 6,
    'alerte', 'cloturee', TRUE,
    'Traitement antibiotique. Isolement. Lutte antirongeurs. Surveillance contacts.',
    ARRAY['Traitement immédiat', 'Isolement', 'Lutte antirongeurs', 'Surveillance contacts'],
    TRUE, '2026-12-05', TRUE,
    ST_SetSRID(ST_MakePoint(9.938, 4.952), 4326), 20.0,
    ST_Buffer(ST_SetSRID(ST_MakePoint(9.938, 4.952), 4326)::geography, 20000)::geometry,
    25000, 5000,
    'District Nkongsamba - Surveillance peste',
    '{"type_alerte": "peste", "description": "Foyer de peste bubonique dans la zone rurale de Manjo (Moungo). 8 cas suspects, 3 confirmés par laboratoire (PCR positive Yersinia pestis). 2 décès. Mortalité inhabituelle de rongeurs signalée.", "forme": "bubonique", "vecteur": "puces", "reservoir": "rongeurs"}'::jsonb
);

-- ============================================================
-- ALERTE 26: DENGUE - Zone portuaire Bonabéri (complément)
-- ============================================================
INSERT INTO alertes_epidemiques (
    code_alerte, id_maladie, id_org_unit, date_alerte,
    date_debut_symptomes, date_premier_cas,
    nb_cas_suspects, nb_cas_confirmes, nb_cas_probables, nb_deces, nb_gueris,
    niveau_alerte, statut_alerte, investigation_realisee,
    action_prise, mesures_pees,
    notifie_minsante, date_notification, notifie_oms,
    coord_alerte, rayon_alerte_km, zone_influence,
    population_exposee, menages_exposes, source_information,
    metadata
) VALUES (
    'ALERT-DENG-PORT-002-2026',
    (SELECT id_maladie FROM maladies_prioritaires WHERE code_cim10 = 'A90'),
    (SELECT id_org_unit FROM organisation_units WHERE code = 'CMA-DOUALA2'),
    '2026-10-20 09:00:00',
    '2026-10-01',
    '2026-10-05',
    65, 42, 15, 1, 60,
    'alerte', 'investiguee', TRUE,
    'Campagne de démoustication portuaire. Traitement symptomatique. Surveillance.',
    ARRAY['Démoustication', 'Traitement', 'Surveillance', 'Sensibilisation'],
    TRUE, '2026-10-21', TRUE,
    ST_SetSRID(ST_MakePoint(9.660, 4.080), 4326), 2.0,
    ST_Buffer(ST_SetSRID(ST_MakePoint(9.660, 4.080), 4326)::geography, 2000)::geometry,
    15000, 3000,
    'CMA Douala 2 - Surveillance dengue portuaire',
    '{"type_alerte": "dengue_portuaire", "description": "Foyer de dengue sévère en zone portuaire de Bonabéri. 42 cas confirmés dont 8 formes hémorragiques. 1 décès par choc hypovolémique. Lien suspecté avec conteneurs en provenance de zone endémique.", "forme": "dengue_hemorragique", "zone": "portuaire", "serotype": "DENV-2"}'::jsonb
);

-- ============================================================
-- ALERTE 27: DIPTÉRIE - Zone à faible couverture vaccinale (Makepe)
-- Version CORRIGÉE (avec H-MBOPPI-DLA)
-- ============================================================
INSERT INTO alertes_epidemiques (
    code_alerte, id_maladie, id_org_unit, date_alerte,
    date_debut_symptomes, date_premier_cas,
    nb_cas_suspects, nb_cas_confirmes, nb_cas_probables, nb_deces, nb_gueris,
    niveau_alerte, statut_alerte, investigation_realisee,
    action_prise, mesures_pees,
    notifie_minsante, date_notification, notifie_oms,
    coord_alerte, rayon_alerte_km, zone_influence,
    population_exposee, menages_exposes, source_information,
    metadata
) VALUES (
    'ALERT-DIPT-001-2026',
    (SELECT id_maladie FROM maladies_prioritaires WHERE code_cim10 = 'A36'),
    (SELECT id_org_unit FROM organisation_units WHERE code = 'H-MBOPPI-DLA'),
    '2026-04-08 13:30:00',
    '2026-03-20',
    '2026-03-25',
    6, 4, 2, 1, 5,
    'alerte', 'cloturee', TRUE,
    'Isolement. Antitoxine diphtérique. Vaccination rattrapage. Chimioprophylaxie.',
    ARRAY['Isolement', 'Antitoxine', 'Vaccination', 'Chemioprophylaxie'],
    TRUE, '2026-04-09', TRUE,
    ST_SetSRID(ST_MakePoint(9.700, 4.060), 4326), 1.0,
    ST_Buffer(ST_SetSRID(ST_MakePoint(9.700, 4.060), 4326)::geography, 1000)::geometry,
    5200, 1040,
    'Hôpital Mboppi - Surveillance maladies DO',
    '{"type_alerte": "dipterie", "description": "Cas de diphtérie dans une communauté religieuse de Makepe non vaccinée. 4 cas confirmés par laboratoire, 1 décès. Couverture vaccinale DTCP dans la communauté estimée à 35%.", "couverture_vaccinale": 35, "communauté": "religieuse_non_vaccinee", "antitoxine": "administree"}'::jsonb
);
-- ============================================================
-- ALERTE 28: CHOLÉRA - Zone rurale Sanaga-Maritime (Edéa)
-- ============================================================
INSERT INTO alertes_epidemiques (
    code_alerte, id_maladie, id_org_unit, date_alerte,
    date_debut_symptomes, date_premier_cas,
    nb_cas_suspects, nb_cas_confirmes, nb_cas_probables, nb_deces, nb_gueris,
    niveau_alerte, statut_alerte, investigation_realisee,
    action_prise, mesures_pees,
    notifie_minsante, date_notification, notifie_oms,
    coord_alerte, rayon_alerte_km, zone_influence,
    population_exposee, menages_exposes, source_information,
    metadata
) VALUES (
    'ALERT-CHOL-EDEA-002-2026',
    (SELECT id_maladie FROM maladies_prioritaires WHERE code_cim10 = 'A00'),
    (SELECT id_org_unit FROM organisation_units WHERE code = 'H-ANNEXE-EDEA'),
    '2026-03-18 08:00:00',
    '2026-03-05',
    '2026-03-08',
    12, 8, 4, 1, 11,
    'alerte', 'cloturee', TRUE,
    'Centre traitement choléra. Désinfection point eau. Distribution chlore.',
    ARRAY['CTC', 'Désinfection eau', 'Distribution chlore', 'Sensibilisation'],
    TRUE, '2026-03-19', TRUE,
    ST_SetSRID(ST_MakePoint(10.128, 4.045), 4326), 8.0,
    ST_Buffer(ST_SetSRID(ST_MakePoint(10.128, 4.045), 4326)::geography, 8000)::geometry,
    18000, 3600,
    'District Edéa - Surveillance choléra',
    '{"type_alerte": "cholera_rural", "description": "Foyer de choléra dans la communauté de pêcheurs de Dizangué (Edéa). Utilisation d''eau non traitée du fleuve Sanaga. 8 cas confirmés, 1 décès. Point d''eau contaminé identifié.", "source_contamination": "fleuve_Sanaga", "population_pecheurs": 2500, "acces_eau_potable": 45}'::jsonb
);