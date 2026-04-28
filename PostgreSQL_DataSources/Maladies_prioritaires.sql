-- ============================================================
-- INSERTION DES MALADIES PRIORITAIRES CAMEROUN
-- ============================================================

TRUNCATE maladies_prioritaires RESTART IDENTITY CASCADE;

-- ============================================================
-- 1. MALADIES ÉPIDÉMIQUES À DÉCLARATION OBLIGATOIRE
-- ============================================================

-- Choléra (A00)
INSERT INTO maladies_prioritaires (
    code_cim10, nom_maladie, type_maladie, declaration_obligatoire, declaration_hebdomadaire,
    seuil_alerte_cas, seuil_epidemique_cas, seuil_critique,
    duree_incubation_jours, duree_contagiosite_jours,
    symptomes_caracteristiques, traitement_recommande, vaccination_existe,
    zones_risque_littoral, notification_minsante, delai_notification_heures, actif
) VALUES (
    'A00', 'Choléra', 'epidemique', TRUE, TRUE,
    2, 5, 20,
    5, 14,
    'Diarrhée aqueuse abondante (eau de riz), vomissements, déshydratation rapide, soif intense, crampes musculaires, yeux enfoncés, absence d''urine, tachycardie, hypotension',
    'Réhydratation orale ou IV, sels de réhydratation orale, antibiotiques (Doxycycline, Azithromycine), zinc pour enfants',
    TRUE,
    ARRAY['Littoral', 'Sud-Ouest', 'Extrême-Nord', 'Nord', 'Ouest'],
    TRUE, 24, TRUE
);

-- Fièvre jaune (A95)
INSERT INTO maladies_prioritaires (
    code_cim10, nom_maladie, type_maladie, declaration_obligatoire, declaration_hebdomadaire,
    seuil_alerte_cas, seuil_epidemique_cas, seuil_critique,
    duree_incubation_jours, duree_contagiosite_jours,
    symptomes_caracteristiques, traitement_recommande, vaccination_existe,
    zones_risque_littoral, notification_minsante, delai_notification_heures, actif
) VALUES (
    'A95', 'Fièvre jaune', 'vecrorielle', TRUE, TRUE,
    1, 2, 5,
    6, 7,
    'Phase 1: Fièvre soudaine, céphalées intenses, myalgies, nausées, vomissements. Phase 2 (toxique): Ictère, hémorragies (gingivale, digestive), insuffisance rénale, vomissements noirs (café marc), oligurie, coma',
    'Traitement symptomatique, réhydratation, dialyse si nécessaire, repos absolu, monitoring hépatique',
    TRUE,
    ARRAY['Centre', 'Littoral', 'Ouest', 'Sud-Ouest', 'Sud'],
    TRUE, 24, TRUE
);

-- Méningite à méningocoque (A39)
INSERT INTO maladies_prioritaires (
    code_cim10, nom_maladie, type_maladie, declaration_obligatoire, declaration_hebdomadaire,
    seuil_alerte_cas, seuil_epidemique_cas, seuil_critique,
    duree_incubation_jours, duree_contagiosite_jours,
    symptomes_caracteristiques, traitement_recommande, vaccination_existe,
    zones_risque_littoral, notification_minsante, delai_notification_heures, actif
) VALUES (
    'A39', 'Méningite à méningocoque', 'epidemique', TRUE, TRUE,
    1, 3, 10,
    7, 14,
    'Fièvre élevée (>39°C), céphalées intenses, raideur de la nuque (méningisme), vomissements en jet, photophobie, purpura fulminans (tâches rouges non effaçables), trouble de conscience, coma, signes de Kernig et Brudzinski',
    'Antibiothérapie d''urgence (Ceftriaxone, Céfotaxime), corticothérapie, isolement, chimioprophylaxie des contacts',
    TRUE,
    ARRAY['Extrême-Nord', 'Nord', 'Adamaoua', 'Nord-Ouest'],
    TRUE, 24, TRUE
);

-- Peste (A20)
INSERT INTO maladies_prioritaires (
    code_cim10, nom_maladie, type_maladie, declaration_obligatoire, declaration_hebdomadaire,
    seuil_alerte_cas, seuil_epidemique_cas, seuil_critique,
    duree_incubation_jours, duree_contagiosite_jours,
    symptomes_caracteristiques, traitement_recommande, vaccination_existe,
    zones_risque_littoral, notification_minsante, delai_notification_heures, actif
) VALUES (
    'A20', 'Peste', 'vecrorielle', TRUE, TRUE,
    1, 2, 5,
    6, 10,
    'Forme bubonique: Adénopathie douloureuse (bubon inguinal/crural), fièvre élevée, frissons. Forme pulmonaire: toux, expectorations sanglantes, dyspnée, douleur thoracique, insuffisance respiratoire. Forme septicémique: choc septique, CIVD',
    'Antibiotiques (Streptomycine, Gentamicine, Doxycycline), isolement strict, traitement des contacts, désinfection',
    TRUE,
    ARRAY['Extrême-Nord', 'Nord', 'Adamaoua'],
    TRUE, 24, TRUE
);

-- Diptérie (A36)
INSERT INTO maladies_prioritaires (
    code_cim10, nom_maladie, type_maladie, declaration_obligatoire, declaration_hebdomadaire,
    seuil_alerte_cas, seuil_epidemique_cas, seuil_critique,
    duree_incubation_jours, duree_contagiosite_jours,
    symptomes_caracteristiques, traitement_recommande, vaccination_existe,
    zones_risque_littoral, notification_minsante, delai_notification_heures, actif
) VALUES (
    'A36', 'Diptérie', 'epidemique', TRUE, TRUE,
    1, 3, 10,
    5, 21,
    'Angine sévère avec fausses membranes blanchâtres adhérentes (pseudo-membranes), dysphagie, voix bitonale, fièvre modérée, adénopathies cervicales, cou de taureau, paralysie du voile du palais, myocardite, neuropathie',
    'Antitoxine diphtérique, antibiotiques (Pénicilline, Érythromycine), isolement respiratoire, soins de support',
    TRUE,
    ARRAY['Extrême-Nord', 'Nord', 'Nord-Ouest'],
    TRUE, 24, TRUE
);

-- ============================================================
-- 2. MALADIES VECTORIELLES (Paludisme, Dengue, etc.)
-- ============================================================

-- Paludisme grave (B50)
INSERT INTO maladies_prioritaires (
    code_cim10, nom_maladie, type_maladie, declaration_obligatoire, declaration_hebdomadaire,
    seuil_alerte_cas, seuil_epidemique_cas, seuil_critique,
    duree_incubation_jours, duree_contagiosite_jours,
    symptomes_caracteristiques, traitement_recommande, vaccination_existe,
    zones_risque_littoral, notification_minsante, delai_notification_heures, actif
) VALUES (
    'B50', 'Paludisme grave', 'vecrorielle', FALSE, TRUE,
    50, 200, 500,
    14, 0,
    'Fièvre élevée (>39°C), frissons violents, céphalées intenses, vomissements, anémie sévère (Hb<5g/dL), ictère, convulsions (neuropaludisme), trouble de conscience (score coma <11), détresse respiratoire, hypothermie, hypoglycémie, acidose métabolique',
    'Artésunate IV ou quinine IV, monitoring glycémique, antioxydants, transfusion si anémie sévère, contrôle des convulsions',
    FALSE,
    ARRAY['Toutes les régions', 'Zone forestière intense'],
    FALSE, NULL, TRUE
);

-- Fièvre de la Vallée du Rift (A90)
INSERT INTO maladies_prioritaires (
    code_cim10, nom_maladie, type_maladie, declaration_obligatoire, declaration_hebdomadaire,
    seuil_alerte_cas, seuil_epidemique_cas, seuil_critique,
    duree_incubation_jours, duree_contagiosite_jours,
    symptomes_caracteristiques, traitement_recommande, vaccination_existe,
    zones_risque_littoral, notification_minsante, delai_notification_heures, actif
) VALUES (
    'A90', 'Fièvre de la Vallée du Rift', 'vecrorielle', TRUE, TRUE,
    1, 3, 10,
    7, 0,
    'Fièvre soudaine, céphalées intenses, myalgies, douleurs lombaires, photophobie, vomissements, hépatite (ictère), hémorragies (forme sévère), méningo-encéphalite, rétinite',
    'Traitement symptomatique, repos, réhydratation, surveillance des complications hémorragiques et neurologiques, ribavirine (cas sévères)',
    FALSE,
    ARRAY['Extrême-Nord', 'Nord', 'Adamaoua', 'Nord-Ouest'],
    TRUE, 24, TRUE
);

-- Chikungunya (A92)
INSERT INTO maladies_prioritaires (
    code_cim10, nom_maladie, type_maladie, declaration_obligatoire, declaration_hebdomadaire,
    seuil_alerte_cas, seuil_epidemique_cas, seuil_critique,
    duree_incubation_jours, duree_contagiosite_jours,
    symptomes_caracteristiques, traitement_recommande, vaccination_existe,
    zones_risque_littoral, notification_minsante, delai_notification_heures, actif
) VALUES (
    'A92', 'Chikungunya', 'vecrorielle', FALSE, TRUE,
    10, 50, 200,
    7, 0,
    'Fièvre élevée, arthralgies intenses et invalidantes (surtout petites articulations), myalgies, céphalées, éruption cutanée maculopapuleuse, fatigue intense, parfois arthrite chronique',
    'Traitement symptomatique: antalgiques, anti-inflammatoires (AINS), repos, réhydratation, kinésithérapie si arthrite',
    FALSE,
    ARRAY['Littoral', 'Centre', 'Sud', 'Sud-Ouest'],
    FALSE, NULL, TRUE
);

-- ============================================================
-- 3. MALADIES À DÉCLARATION OBLIGATOIRE SPÉCIALE
-- ============================================================

-- Poliomyélite (A80)
INSERT INTO maladies_prioritaires (
    code_cim10, nom_maladie, type_maladie, declaration_obligatoire, declaration_hebdomadaire,
    seuil_alerte_cas, seuil_epidemique_cas, seuil_critique,
    duree_incubation_jours, duree_contagiosite_jours,
    symptomes_caracteristiques, traitement_recommande, vaccination_existe,
    zones_risque_littoral, notification_minsante, delai_notification_heures, actif
) VALUES (
    'A80', 'Poliomyélite', 'epidemique', TRUE, TRUE,
    1, 1, 2,
    10, 21,
    'Paralysie flasque aiguë, asymétrique, fièvre modérée, méningisme, faiblesse musculaire (plus marquée aux membres inférieurs), abolition des réflexes ostéotendineux',
    'Traitement symptomatique, réhabilitation physique, aide respiratoire si atteinte des muscles respiratoires surveillance des fonctions vitales',
    TRUE,
    ARRAY['Toutes les régions (surveillance active)'],
    TRUE, 24, TRUE
);

-- Rougeole (B05)
INSERT INTO maladies_prioritaires (
    code_cim10, nom_maladie, type_maladie, declaration_obligatoire, declaration_hebdomadaire,
    seuil_alerte_cas, seuil_epidemique_cas, seuil_critique,
    duree_incubation_jours, duree_contagiosite_jours,
    symptomes_caracteristiques, traitement_recommande, vaccination_existe,
    zones_risque_littoral, notification_minsante, delai_notification_heures, actif
) VALUES (
    'B05', 'Rougeole', 'epidemique', TRUE, TRUE,
    3, 10, 50,
    14, 21,
    'Fièvre élevée (>39°C), toux irritative, coryza (nez qui coule), conjonctivite (yeux rouges larmoyants), signe de Koplik (taches blanches dans la bouche), éruption maculopapuleuse débutant derrière les oreilles puis généralisée, adénopathies',
    'Traitement symptomatique: antipyrétiques (ibuprofène/paracétamol), hydratation, vitamine A, isolement, traitement des complications (pneumonie, encéphalite)',
    TRUE,
    ARRAY['Toutes les régions (épidémies cycliques)'],
    TRUE, 48, TRUE
);

-- ============================================================
-- 4. MALADIES CHRONIQUES (Non DO mais suivi mensuel)
-- ============================================================

-- VIH/SIDA (B20)
INSERT INTO maladies_prioritaires (
    code_cim10, nom_maladie, type_maladie, declaration_obligatoire, declaration_hebdomadaire,
    seuil_alerte_cas, seuil_epidemique_cas, seuil_critique,
    duree_incubation_jours, duree_contagiosite_jours,
    symptomes_caracteristiques, traitement_recommande, vaccination_existe,
    zones_risque_littoral, notification_minsante, delai_notification_heures, actif
) VALUES (
    'B20', 'VIH/SIDA', 'chronique', FALSE, FALSE,
    NULL, NULL, NULL,
    NULL, NULL,
    'Fièvre prolongée >1 mois, perte de poids >10% (amaigrissement), diarrhée chronique >1 mois, toux persistante >1 mois, adénopathies généralisées, infections opportunistes (tuberculose, candidose orale, zona récurrent, toxoplasmose, méningite cryptococcique), déficit immunitaire (CD4<200)',
    'Traitement antirétroviral (ARV): TLD (Ténofovir-Lamivudine-Dolutégravir) première ligne, prophylaxie des infections opportunistes (Cotrimoxazole), suivi de la charge virale et CD4, conseils nutritionnels et psychosociaux',
    FALSE,
    ARRAY['Toutes les régions (prévalence élevée: Centre, Littoral, Sud, Est)'],
    FALSE, NULL, TRUE
);

-- Tuberculose (A15-A19)
INSERT INTO maladies_prioritaires (
    code_cim10, nom_maladie, type_maladie, declaration_obligatoire, declaration_hebdomadaire,
    seuil_alerte_cas, seuil_epidemique_cas, seuil_critique,
    duree_incubation_jours, duree_contagiosite_jours,
    symptomes_caracteristiques, traitement_recommande, vaccination_existe,
    zones_risque_littoral, notification_minsante, delai_notification_heures, actif
) VALUES (
    'A15', 'Tuberculose', 'chronique', TRUE, FALSE,
    NULL, NULL, NULL,
    30, 90,
    'Toux >3 semaines (productive ou non), fièvre vespérale (38-39°C), sueurs nocturnes, amaigrissement inexpliqué, asthénie, douleurs thoraciques, hémoptysie, adénopathies cervicales',
    'Quadrithérapie pendant 6 mois (RHZE: Rifampicine, Isoniazide, Pyrazinamide, Éthambutol), traitement directement observé (DOT), contrôle à 2-5-6 mois',
    TRUE,
    ARRAY['Toutes les régions (co-infection VIH fréquente)'],
    TRUE, 48, TRUE
);

-- Hypertension artérielle (I10)
INSERT INTO maladies_prioritaires (
    code_cim10, nom_maladie, type_maladie, declaration_obligatoire, declaration_hebdomadaire,
    seuil_alerte_cas, seuil_epidemique_cas, seuil_critique,
    duree_incubation_jours, duree_contagiosite_jours,
    symptomes_caracteristiques, traitement_recommande, vaccination_existe,
    zones_risque_littoral, notification_minsante, delai_notification_heures, actif
) VALUES (
    'I10', 'Hypertension artérielle', 'chronique', FALSE, FALSE,
    NULL, NULL, NULL,
    NULL, NULL,
    'Souvent asymptomatique (tueur silencieux) - Signes tardifs: céphalées occipitales matinales, vertiges, acouphènes (bourdonnements), épistaxis (saignements du nez), dyspnée d''effort, palpitations, troubles visuels, fatigue inexpliquée',
    'Règles hygiéno-diététiques (réduction sel, arrêt alcool/tabac, activité physique), IEC/ARA, calcium-antagonistes, diurétiques, thiazidiques, suivi tensionnel mensuel',
    FALSE,
    ARRAY['Toutes les régions (prévalence >30% chez adulte)'],
    FALSE, NULL, TRUE
);

-- Diabète (E11)
INSERT INTO maladies_prioritaires (
    code_cim10, nom_maladie, type_maladie, declaration_obligatoire, declaration_hebdomadaire,
    seuil_alerte_cas, seuil_epidemique_cas, seuil_critique,
    duree_incubation_jours, duree_contagiosite_jours,
    symptomes_caracteristiques, traitement_recommande, vaccination_existe,
    zones_risque_littoral, notification_minsante, delai_notification_heures, actif
) VALUES (
    'E11', 'Diabète de type 2', 'chronique', FALSE, FALSE,
    NULL, NULL, NULL,
    NULL, NULL,
    'Polyurie (urines fréquentes), polydipsie (soif intense), polyphagie (faim excessive), amaigrissement inexpliqué, fatigue intense, vision floue (rétinopathie), infections cutanées récurrentes (furoncles, mycoses), cicatrisation lente, fourmillements membres (neuropathie)',
    'Règles hygiéno-diététiques (alimentation équilibrée, activité physique), antidiabétiques oraux (Metformine), insulinothérapie si besoin, suivi glycémie/HbA1c, surveillance complications',
    FALSE,
    ARRAY['Toutes les régions (épidémie mondiale)'],
    FALSE, NULL, TRUE
);

-- ============================================================
-- 5. MALADIES TROPICALES NÉGLIGÉES
-- ============================================================

-- Schistosomiase (B65)
INSERT INTO maladies_prioritaires (
    code_cim10, nom_maladie, type_maladie, declaration_obligatoire, declaration_hebdomadaire,
    seuil_alerte_cas, seuil_epidemique_cas, seuil_critique,
    duree_incubation_jours, duree_contagiosite_jours,
    symptomes_caracteristiques, traitement_recommande, vaccination_existe,
    zones_risque_littoral, notification_minsante, delai_notification_heures, actif
) VALUES (
    'B65', 'Schistosomiase (Bilharziose)', 'tropicale_negligee', FALSE, FALSE,
    NULL, NULL, NULL,
    30, NULL,
    'Phase invasive: dermatite du baigneur (démangeaisons). Phase aiguë (fièvre katayama): fièvre, frissons, myalgies, hépato-splénomégalie, éosinophilie. Phase chronique: hématurie (bilharziose urinaire), hématémèse (bilharziose intestinale/hépatique), fibrose hépatique, hypertension portale, hydronéphrose, cancer du col vésical',
    'Praziquantel (dose unique), traitement des complications (chirurgie pour hypertension portale), éducation sanitaire',
    FALSE,
    ARRAY['Sud, Centre, Est, Littoral (zones hydromorphes)'],
    FALSE, NULL, TRUE
);

-- Onchocercose (B73)
INSERT INTO maladies_prioritaires (
    code_cim10, nom_maladie, type_maladie, declaration_obligatoire, declaration_hebdomadaire,
    seuil_alerte_cas, seuil_epidemique_cas, seuil_critique,
    duree_incubation_jours, duree_contagiosite_jours,
    symptomes_caracteristiques, traitement_recommande, vaccination_existe,
    zones_risque_littoral, notification_minsante, delai_notification_heures, actif
) VALUES (
    'B73', 'Onchocercose (Cécité des rivières)', 'tropicale_negligee', FALSE, FALSE,
    NULL, NULL, NULL,
    365, NULL,
    'Nodules sous-cutanés (onchocercomes) palpables, prurit intense (démangeaisons généralisées), lichénification, dépigmentation (peau léopard), adénopathies inguinales (hangeur), atteinte oculaire (kératite ponctuée, sclérose, cécité irréversible)',
    'Ivermectine (Mectizan) traitement de masse annuel, traitement symptomatique des nodules (exérèse), lutte antivectorielle',
    FALSE,
    ARRAY['Nord-Ouest, Ouest, Sud-Ouest, Littoral (zones à simulies)'],
    FALSE, NULL, TRUE
);
