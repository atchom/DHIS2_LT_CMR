-- ============================================================
-- INSERTION DES ZONES DE CHALANDISE - LITTORAL CAMEROUN
-- Basé sur la réalité géographique, démographique et l'accessibilité
-- ============================================================

-- ============================================================
-- 1. ZONES DE CHALANDISE - GRANDS HÔPITAUX PUBLICS
-- ============================================================

-- Hôpital Laquintinie (Akwa) - Zone centre-ville
INSERT INTO zones_chalandise (
    id_org_unit, nom_zone, zone_geographique, rayon_km,
    population_estimee, menages_estimes, quartiers_couverts,
    temps_acces_moyen_minutes, moyen_acces_principal,
    concurrence_directe, taux_couverture_estime, metadata
) VALUES (
    (SELECT id_org_unit FROM organisation_units WHERE code = 'H-LAQUINTINIE-DLA'),
    'Zone chalandise Hôpital Laquintinie - Centre Douala',
    ST_Buffer(ST_SetSRID(ST_MakePoint(9.723, 4.043), 4326)::geography, 5000)::geometry,
    5,
    350000, 70000,
    ARRAY['Akwa', 'Bonapriso', 'Bali', 'Cite des Palmiers', 'Bessengue', 'Rond Point Deido'],
    15, 'voiture',
    ARRAY['H-GEN-DLA', 'CLIN-PAST', 'CLIN-LOUISPASTEUR-DLA'],
    85.5,
    '{"type": "hopital_regional", "zone": "urbaine_dense", "population_density": "elevee"}'::JSONB
);

-- Hôpital Général de Douala (centre-ville)
INSERT INTO zones_chalandise (
    id_org_unit, nom_zone, zone_geographique, rayon_km,
    population_estimee, menages_estimes, quartiers_couverts,
    temps_acces_moyen_minutes, moyen_acces_principal,
    concurrence_directe, taux_couverture_estime, metadata
) VALUES (
    (SELECT id_org_unit FROM organisation_units WHERE code = 'H-GEN-DLA'),
    'Zone chalandise Hôpital Général - Centre Douala',
    ST_Buffer(ST_SetSRID(ST_MakePoint(9.700, 4.042), 4326)::geography, 6000)::geometry,
    6,
    420000, 84000,
    ARRAY['Akwa', 'Bonanjo', 'Gare', 'Bali', 'Cite des Palmiers', 'Bessengue', 'Makepe'],
    18, 'voiture',
    ARRAY['H-LAQUINTINIE-DLA', 'CLIN-PAST', 'CLIN-LOUISPASTEUR-DLA'],
    80.0,
    '{"type": "hopital_central", "zone": "urbaine_dense", "population_density": "tres_elevee"}'::JSONB
);

-- HGOPED - Hôpital Gynéco-Obstétrique (spécialisé)
INSERT INTO zones_chalandise (
    id_org_unit, nom_zone, zone_geographique, rayon_km,
    population_estimee, menages_estimes, quartiers_couverts,
    temps_acces_moyen_minutes, moyen_acces_principal,
    concurrence_directe, taux_couverture_estime, metadata
) VALUES (
    (SELECT id_org_unit FROM organisation_units WHERE code = 'H-HGOPED-DLA'),
    'Zone chalandise HGOPED - Spécialisé Maternité/Pédiatrie',
    ST_Buffer(ST_SetSRID(ST_MakePoint(9.704, 4.051), 4326)::geography, 8000)::geometry,
    8,
    500000, 100000,
    ARRAY['Akwa', 'Bonapriso', 'Bali', 'Bonanjo', 'Bessengue', 'Deido', 'Logpom', 'Makepe'],
    20, 'voiture',
    ARRAY['CLIN-BONAM', 'CLIN-BETHESDA'],
    75.0,
    '{"type": "specialise", "zone": "regionale", "specialites": ["gynecologie", "pediatrie", "obstetrique"]}'::JSONB
);

-- ============================================================
-- 2. ZONES DE CHALANDISE - GRANDES CLINIQUES PRIVÉES
-- ============================================================

-- Clinique Pasteur (Bastos/Akwa)
INSERT INTO zones_chalandise (
    id_org_unit, nom_zone, zone_geographique, rayon_km,
    population_estimee, menages_estimes, quartiers_couverts,
    temps_acces_moyen_minutes, moyen_acces_principal,
    concurrence_directe, taux_couverture_estime, metadata
) VALUES (
    (SELECT id_org_unit FROM organisation_units WHERE code = 'CLIN-PAST'),
    'Zone chalandise Clinique Pasteur - Bastos/Akwa',
    ST_Buffer(ST_SetSRID(ST_MakePoint(9.718, 4.058), 4326)::geography, 4000)::geometry,
    4,
    180000, 36000,
    ARRAY['Bastos', 'Akwa', 'Bonapriso', 'Bali', 'Cite des Palmiers'],
    12, 'voiture',
    ARRAY['H-LAQUINTINIE-DLA', 'H-GEN-DLA', 'CLIN-LOUISPASTEUR-DLA'],
    70.0,
    '{"type": "clinique_privee", "zone": "quartier_aisé", "clientele": "exigeante"}'::JSONB
);

-- Clinique Louis Pasteur (Akwa)
INSERT INTO zones_chalandise (
    id_org_unit, nom_zone, zone_geographique, rayon_km,
    population_estimee, menages_estimes, quartiers_couverts,
    temps_acces_moyen_minutes, moyen_acces_principal,
    concurrence_directe, taux_couverture_estime, metadata
) VALUES (
    (SELECT id_org_unit FROM organisation_units WHERE code = 'CLIN-LOUISPASTEUR-DLA'),
    'Zone chalandise Clinique Louis Pasteur - Akwa centre',
    ST_Buffer(ST_SetSRID(ST_MakePoint(9.7085, 4.0495), 4326)::geography, 3500)::geometry,
    3.5,
    150000, 30000,
    ARRAY['Akwa', 'Bonapriso', 'Bali', 'Gare'],
    10, 'voiture',
    ARRAY['H-LAQUINTINIE-DLA', 'H-GEN-DLA', 'CLIN-PAST'],
    65.0,
    '{"type": "clinique_privee", "zone": "centre_ville", "clientele": "mixte"}'::JSONB
);

-- Clinique Bethesda (Akwa)
INSERT INTO zones_chalandise (
    id_org_unit, nom_zone, zone_geographique, rayon_km,
    population_estimee, menages_estimes, quartiers_couverts,
    temps_acces_moyen_minutes, moyen_acces_principal,
    concurrence_directe, taux_couverture_estime, metadata
) VALUES (
    (SELECT id_org_unit FROM organisation_units WHERE code = 'CLIN-BETHESDA'),
    'Zone chalandise Clinique Bethesda - Akwa',
    ST_Buffer(ST_SetSRID(ST_MakePoint(9.711, 4.050), 4326)::geography, 3000)::geometry,
    3,
    120000, 24000,
    ARRAY['Akwa', 'Bonapriso', 'Gare'],
    10, 'voiture',
    ARRAY['CLIN-PAST', 'CLIN-LOUISPASTEUR-DLA', 'H-GEN-DLA'],
    60.0,
    '{"type": "clinique_confessionnelle", "zone": "centre_ville", "clientele": "fidele"}'::JSONB
);

-- ============================================================
-- 3. ZONES DE CHALANDISE - CSI PUBLICS (zones prioritaires)
-- ============================================================

-- CSI Ndogbong (zone inondable - sud de Douala)
INSERT INTO zones_chalandise (
    id_org_unit, nom_zone, zone_geographique, rayon_km,
    population_estimee, menages_estimes, quartiers_couverts,
    temps_acces_moyen_minutes, moyen_acces_principal,
    concurrence_directe, taux_couverture_estime, metadata
) VALUES (
    (SELECT id_org_unit FROM organisation_units WHERE code = 'CSI-NDOKOTI'),
    'Zone chalandise CSI Ndogbong - Zone sud inondable',
    ST_Buffer(ST_SetSRID(ST_MakePoint(9.719, 4.021), 4326)::geography, 3000)::geometry,
    3,
    58000, 11600,
    ARRAY['Ndogbong', 'Japoma', 'Mbangue', 'Njombe'],
    25, 'pied',
    ARRAY['CLIN-LADIES'],
    80.0,
    '{"type": "csi", "zone": "peri_urbaine", "risque": "inondable", "priorite": "elevee"}'::JSONB
);

-- CSI Bonabéri (zone industriel et inondable)
INSERT INTO zones_chalandise (
    id_org_unit, nom_zone, zone_geographique, rayon_km,
    population_estimee, menages_estimes, quartiers_couverts,
    temps_acces_moyen_minutes, moyen_acces_principal,
    concurrence_directe, taux_couverture_estime, metadata
) VALUES (
    (SELECT id_org_unit FROM organisation_units WHERE code = 'CSI-BONAB'),
    'Zone chalandise CSI Bonabéri - Zone industrielle',
    ST_Buffer(ST_SetSRID(ST_MakePoint(9.667, 4.091), 4326)::geography, 4000)::geometry,
    4,
    85000, 17000,
    ARRAY['Bonabéri', 'Bépanda', 'Nyalla', 'Koumassi'],
    30, 'moto',
    ARRAY['CLIN-INTER-BONAB', 'CLIN-CONCEPTION'],
    75.0,
    '{"type": "csi", "zone": "industrielle_inondable", "population": "ouvriere"}'::JSONB
);

-- CSI Makepe (zone sud-ouest)
INSERT INTO zones_chalandise (
    id_org_unit, nom_zone, zone_geographique, rayon_km,
    population_estimee, menages_estimes, quartiers_couverts,
    temps_acces_moyen_minutes, moyen_acces_principal,
    concurrence_directe, taux_couverture_estime, metadata
) VALUES (
    (SELECT id_org_unit FROM organisation_units WHERE code = 'CSI-MAKEPE'),
    'Zone chalandise CSI Makepe - Zone sud',
    ST_Buffer(ST_SetSRID(ST_MakePoint(9.753, 4.028), 4326)::geography, 3000)::geometry,
    3,
    48000, 9600,
    ARRAY['Makepe', 'Logbaba', 'Mboppi'],
    20, 'moto',
    ARRAY['H-MBOPPI-DLA', 'CLIN-MAKEPE'],
    70.0,
    '{"type": "csi", "zone": "urbaine_mixte", "population": "classe_moyenne"}'::JSONB
);

-- ============================================================
-- 4. ZONES SPÉCIALES (zones périphériques et rurales)
-- ============================================================

-- Hôpital Régional de Nkongsamba (zone rurale/urbaine)
INSERT INTO zones_chalandise (
    id_org_unit, nom_zone, zone_geographique, rayon_km,
    population_estimee, menages_estimes, quartiers_couverts,
    temps_acces_moyen_minutes, moyen_acces_principal,
    concurrence_directe, taux_couverture_estime, metadata
) VALUES (
    (SELECT id_org_unit FROM organisation_units WHERE code = 'H-NKONGSAMBA'),
    'Zone chalandise Hôpital Régional Nkongsamba - Moungo',
    ST_Buffer(ST_SetSRID(ST_MakePoint(9.940, 4.950), 4326)::geography, 25000)::geometry,
    25,
    280000, 56000,
    ARRAY['Nkongsamba centre', 'Baré', 'Melong', 'Loum', 'Manjo', 'Penja'],
    45, 'voiture',
    ARRAY['H-LOUM'],
    65.0,
    '{"type": "hopital_regional", "zone": "rurale_urbaine", "population": "agricole"}'::JSONB
);

-- Hôpital de District de Loum (zone rurale)
INSERT INTO zones_chalandise (
    id_org_unit, nom_zone, zone_geographique, rayon_km,
    population_estimee, menages_estimes, quartiers_couverts,
    temps_acces_moyen_minutes, moyen_acces_principal,
    concurrence_directe, taux_couverture_estime, metadata
) VALUES (
    (SELECT id_org_unit FROM organisation_units WHERE code = 'H-LOUM'),
    'Zone chalandise Hôpital de Loum - Zone rurale',
    ST_Buffer(ST_SetSRID(ST_MakePoint(9.850, 4.718), 4326)::geography, 15000)::geometry,
    15,
    95000, 19000,
    ARRAY['Loum centre', 'Ngambé', 'Nkondjock', 'Bareko'],
    35, 'voiture',
    ARRAY['H-NKONGSAMBA'],
    70.0,
    '{"type": "hopital_district", "zone": "rurale", "population": "agricole"}'::JSONB
);

-- ============================================================
-- 5. ZONES PRIORITAIRES - QUARTIERS SENSIBLES
-- ============================================================

-- Zone Ndogbong / Japoma (précarité, inondations)
INSERT INTO zones_chalandise (
    id_org_unit, nom_zone, zone_geographique, rayon_km,
    population_estimee, menages_estimes, quartiers_couverts,
    temps_acces_moyen_minutes, moyen_acces_principal,
    concurrence_directe, taux_couverture_estime, metadata
) VALUES (
    (SELECT id_org_unit FROM organisation_units WHERE code = 'CLIN-LADIES'),
    'Zone chalandise Ladies & Family Care - Ndogbong sud',
    ST_Buffer(ST_SetSRID(ST_MakePoint(9.719, 4.021), 4326)::geography, 2000)::geometry,
    2,
    35000, 7000,
    ARRAY['Ndogbong', 'Japoma'],
    15, 'pied',
    ARRAY['CSI-NDOKOTI'],
    65.0,
    '{"type": "clinique_privee", "zone": "precaire_inondable", "population": "vulnerable"}'::JSONB
);

-- Zone Mboppi/Logbaba (zone densément peuplée)
INSERT INTO zones_chalandise (
    id_org_unit, nom_zone, zone_geographique, rayon_km,
    population_estimee, menages_estimes, quartiers_couverts,
    temps_acces_moyen_minutes, moyen_acces_principal,
    concurrence_directe, taux_couverture_estime, metadata
) VALUES (
    (SELECT id_org_unit FROM organisation_units WHERE code = 'H-MBOPPI-DLA'),
    'Zone chalandise Mboppi Baptist - Mboppi/Logbaba',
    ST_Buffer(ST_SetSRID(ST_MakePoint(9.755, 4.034), 4326)::geography, 3000)::geometry,
    3,
    95000, 19000,
    ARRAY['Mboppi', 'Logbaba', 'Makepe', 'Deido'],
    15, 'moto',
    ARRAY['CSI-MAKEPE', 'CLIN-MAKEPE'],
    80.0,
    '{"type": "hopital_confessionnel", "zone": "densement_peuplee", "population": "mixte"}'::JSONB
);

-- ============================================================
-- 6. ZONES DE CHALANDISE - STRUCTURES RURALES
-- ============================================================

-- CSI Edéa Mbangue (zone rurale)
INSERT INTO zones_chalandise (
    id_org_unit, nom_zone, zone_geographique, rayon_km,
    population_estimee, menages_estimes, quartiers_couverts,
    temps_acces_moyen_minutes, moyen_acces_principal,
    concurrence_directe, taux_couverture_estime, metadata
) VALUES (
    (SELECT id_org_unit FROM organisation_units WHERE code = 'CSI-MBANGUE'),
    'Zone chalandise CSI Mbangue - Edéa rural',
    ST_Buffer(ST_SetSRID(ST_MakePoint(10.125, 3.795), 4326)::geography, 10000)::geometry,
    10,
    25000, 5000,
    ARRAY['Mbangue', 'Pout', 'Log Batanga', 'Dizangué'],
    40, 'moto',
    ARRAY['H-ANNEXE-EDEA'],
    60.0,
    '{"type": "csi", "zone": "rurale", "population": "agricole_peche"}'::JSONB
);

-- CSI Pout (zone rurale isolée)
INSERT INTO zones_chalandise (
    id_org_unit, nom_zone, zone_geographique, rayon_km,
    population_estimee, menages_estimes, quartiers_couverts,
    temps_acces_moyen_minutes, moyen_acces_principal,
    concurrence_directe, taux_couverture_estime, metadata
) VALUES (
    (SELECT id_org_unit FROM organisation_units WHERE code = 'CSI-POUT'),
    'Zone chalandise CSI Pout - Zone rurale isolée',
    ST_Buffer(ST_SetSRID(ST_MakePoint(10.180, 3.850), 4326)::geography, 8000)::geometry,
    8,
    18000, 3600,
    ARRAY['Pout', 'Ngambe', 'Bidou'],
    50, 'moto',
    ARRAY['CSI-MBANGUE'],
    55.0,
    '{"type": "csi", "zone": "rurale_isolee", "population": "agricole_tres_pauvre"}'::JSONB
);

-- ============================================================
-- 7. ZONES URBAINES DENSES (quartiers populaires)
-- ============================================================

-- Zone Deido (densément peuplé)
INSERT INTO zones_chalandise (
    id_org_unit, nom_zone, zone_geographique, rayon_km,
    population_estimee, menages_estimes, quartiers_couverts,
    temps_acces_moyen_minutes, moyen_acces_principal,
    concurrence_directe, taux_couverture_estime, metadata
) VALUES (
    (SELECT id_org_unit FROM organisation_units WHERE code = 'H-DEIDO-DLA'),
    'Zone chalandise Hôpital de Deido - Quartier populaire',
    ST_Buffer(ST_SetSRID(ST_MakePoint(9.740, 4.039), 4326)::geography, 2500)::geometry,
    2.5,
    85000, 17000,
    ARRAY['Deido', 'Bonamoussadi', 'Ngangue'],
    12, 'pied',
    ARRAY['CLIN-GRACIAS', 'CLIN-ETIENNO'],
    75.0,
    '{"type": "hopital_district", "zone": "urbain_dense", "population": "classe_populaire"}'::JSONB
);

-- Zone Bonamoussadi (zone résidentielle)
INSERT INTO zones_chalandise (
    id_org_unit, nom_zone, zone_geographique, rayon_km,
    population_estimee, menages_estimes, quartiers_couverts,
    temps_acces_moyen_minutes, moyen_acces_principal,
    concurrence_directe, taux_couverture_estime, metadata
) VALUES (
    (SELECT id_org_unit FROM organisation_units WHERE code = 'CLIN-BONAM'),
    'Zone chalandise Clinique Bonamoussadi - Zone résidentielle',
    ST_Buffer(ST_SetSRID(ST_MakePoint(9.642, 4.084), 4326)::geography, 3000)::geometry,
    3,
    70000, 14000,
    ARRAY['Bonamoussadi', 'Makepe', 'Logbaba'],
    10, 'voiture',
    ARRAY['H-MBOPPI-DLA', 'CLIN-MAKEPE'],
    65.0,
    '{"type": "clinique_privee", "zone": "residentielle", "clientele": "classe_moyenne"}'::JSONB
);
-- ============================================================
-- 8. ZONES DE CHALANDISE - HÔPITAUX CONFESSIONNELS
-- ============================================================

-- Hôpital Catholique St Albert Le Grand (Bali)
INSERT INTO zones_chalandise (
    id_org_unit, nom_zone, zone_geographique, rayon_km,
    population_estimee, menages_estimes, quartiers_couverts,
    temps_acces_moyen_minutes, moyen_acces_principal,
    concurrence_directe, taux_couverture_estime, metadata
) VALUES (
    (SELECT id_org_unit FROM organisation_units WHERE code = 'H-STALBERT-DLA'),
    'Zone chalandise Hôpital St Albert - Bali',
    ST_Buffer(ST_SetSRID(ST_MakePoint(9.714, 4.056), 4326)::geography, 4500)::geometry,
    4.5,
    185000, 37000,
    ARRAY['Bali', 'Bonabéri', 'Makèpè', 'Zone industrielle', 'Bessengue'],
    20, 'voiture',
    ARRAY['H-HGOPED-DLA', 'CLIN-BETHESDA', 'H-SAKER-DLA'],
    72.0,
    '{"type": "hopital_catholique", "zone": "mixte", "population": "classe_moyenne_ouvriere"}'::JSONB
);

-- Hôpital Emilie Saker (Akwa - protestant)
INSERT INTO zones_chalandise (
    id_org_unit, nom_zone, zone_geographique, rayon_km,
    population_estimee, menages_estimes, quartiers_couverts,
    temps_acces_moyen_minutes, moyen_acces_principal,
    concurrence_directe, taux_couverture_estime, metadata
) VALUES (
    (SELECT id_org_unit FROM organisation_units WHERE code = 'H-SAKER-DLA'),
    'Zone chalandise Hôpital Emilie Saker - Akwa',
    ST_Buffer(ST_SetSRID(ST_MakePoint(9.710, 4.049), 4326)::geography, 3500)::geometry,
    3.5,
    210000, 42000,
    ARRAY['Akwa', 'Bonapriso', 'Bali', 'Gare', 'Bessengue'],
    12, 'voiture',
    ARRAY['H-LAQUINTINIE-DLA', 'H-GEN-DLA', 'CLIN-PAST'],
    68.0,
    '{"type": "hopital_protestant", "zone": "centre_ville", "clientele": "mixte_fidele"}'::JSONB
);

-- Hôpital Catholique Notre Dame de l'Amour (Logpom)
INSERT INTO zones_chalandise (
    id_org_unit, nom_zone, zone_geographique, rayon_km,
    population_estimee, menages_estimes, quartiers_couverts,
    temps_acces_moyen_minutes, moyen_acces_principal,
    concurrence_directe, taux_couverture_estime, metadata
) VALUES (
    (SELECT id_org_unit FROM organisation_units WHERE code = 'H-NDLOVE-LOG'),
    'Zone chalandise Notre Dame de l''Amour - Logpom',
    ST_Buffer(ST_SetSRID(ST_MakePoint(9.763, 4.022), 4326)::geography, 3500)::geometry,
    3.5,
    110000, 22000,
    ARRAY['Logpom', 'Deido', 'Mboppi', 'Logbaba', 'Ngangue'],
    18, 'moto',
    ARRAY['H-DEIDO-DLA', 'H-MBOPPI-DLA'],
    75.0,
    '{"type": "hopital_catholique", "zone": "populaire", "population": "classe_populaire"}'::JSONB
);

-- ============================================================
-- 9. ZONES DE CHALANDISE - HÔPITAL MILITAIRE
-- ============================================================

-- Centre de la Garnison Militaire (Akwa)
INSERT INTO zones_chalandise (
    id_org_unit, nom_zone, zone_geographique, rayon_km,
    population_estimee, menages_estimes, quartiers_couverts,
    temps_acces_moyen_minutes, moyen_acces_principal,
    concurrence_directe, taux_couverture_estime, metadata
) VALUES (
    (SELECT id_org_unit FROM organisation_units WHERE code = 'H-MIL-DLA'),
    'Zone chalandise Hôpital Militaire - Akwa',
    ST_Buffer(ST_SetSRID(ST_MakePoint(9.700, 4.045), 4326)::geography, 4000)::geometry,
    4,
    250000, 50000,
    ARRAY['Akwa', 'Bonanjo', 'Gare', 'Bali', 'Bessengue', 'Cite des Palmiers'],
    15, 'voiture',
    ARRAY['H-GEN-DLA', 'H-LAQUINTINIE-DLA'],
    60.0,
    '{"type": "hopital_militaire", "zone": "centre_ville", "population": "generale_militaire"}'::JSONB
);

-- ============================================================
-- 10. ZONES DE CHALANDISE - CLINIQUES SPÉCIALISÉES
-- ============================================================

-- Clinique Cœur & Vie (cardiologie - Akwa)
INSERT INTO zones_chalandise (
    id_org_unit, nom_zone, zone_geographique, rayon_km,
    population_estimee, menages_estimes, quartiers_couverts,
    temps_acces_moyen_minutes, moyen_acces_principal,
    concurrence_directe, taux_couverture_estime, metadata
) VALUES (
    (SELECT id_org_unit FROM organisation_units WHERE code = 'CLIN-COEURVIE'),
    'Zone chalandise Clinique Cœur & Vie - Cardiologie',
    ST_Buffer(ST_SetSRID(ST_MakePoint(9.709, 4.051), 4326)::geography, 5000)::geometry,
    5,
    350000, 70000,
    ARRAY['Akwa', 'Bonapriso', 'Bali', 'Deido', 'Makepe', 'Bonamoussadi'],
    20, 'voiture',
    ARRAY['H-LAQUINTINIE-DLA', 'H-GEN-DLA', 'CLIN-PAST'],
    40.0,
    '{"type": "clinique_specialisee", "specialite": "cardiologie", "population": "patients_cardiaques"}'::JSONB
);

-- Clinique Louis Pasteur (déjà traité mais complément)
INSERT INTO zones_chalandise (
    id_org_unit, nom_zone, zone_geographique, rayon_km,
    population_estimee, menages_estimes, quartiers_couverts,
    temps_acces_moyen_minutes, moyen_acces_principal,
    concurrence_directe, taux_couverture_estime, metadata
) VALUES (
    (SELECT id_org_unit FROM organisation_units WHERE code = 'CLIN-LOUISPASTEUR-DLA'),
    'Zone chalandise Louis Pasteur - Akwa (complément)',
    ST_Buffer(ST_SetSRID(ST_MakePoint(9.7085, 4.0495), 4326)::geography, 4000)::geometry,
    4,
    180000, 36000,
    ARRAY['Akwa', 'Bonapriso', 'Bali', 'Gare', 'Bessengue'],
    12, 'voiture',
    ARRAY['H-LAQUINTINIE-DLA', 'H-GEN-DLA', 'CLIN-PAST'],
    65.0,
    '{"type": "clinique_reference", "zone": "centre_ville", "clientele": "exigeante"}'::JSONB
);

-- ============================================================
-- 11. COMPLÉMENT - AUTRES CLINIQUES PRIVÉES MOYENNES
-- ============================================================

-- CMA Nkoulouloun
INSERT INTO zones_chalandise (
    id_org_unit, nom_zone, zone_geographique, rayon_km,
    population_estimee, menages_estimes, quartiers_couverts,
    temps_acces_moyen_minutes, moyen_acces_principal,
    concurrence_directe, taux_couverture_estime, metadata
) VALUES (
    (SELECT id_org_unit FROM organisation_units WHERE code = 'CMA-NKOULOUL'),
    'Zone chalandise CMA Nkoulouloun - Quartier Nkoulouloun',
    ST_Buffer(ST_SetSRID(ST_MakePoint(9.723, 4.065), 4326)::geography, 2000)::geometry,
    2,
    55000, 11000,
    ARRAY['Nkoulouloun', 'Bonapriso', 'Bastos'],
    10, 'pied',
    ARRAY['CLIN-PAST', 'H-LAQUINTINIE-DLA'],
    55.0,
    '{"type": "cma", "zone": "residentielle", "population": "classe_moyenne"}'::JSONB
);

-- Polyclinique Bordeaux Douala
INSERT INTO zones_chalandise (
    id_org_unit, nom_zone, zone_geographique, rayon_km,
    population_estimee, menages_estimes, quartiers_couverts,
    temps_acces_moyen_minutes, moyen_acces_principal,
    concurrence_directe, taux_couverture_estime, metadata
) VALUES (
    (SELECT id_org_unit FROM organisation_units WHERE code = 'CLIN-BORDEAUX'),
    'Zone chalandise Polyclinique Bordeaux - Akwa',
    ST_Buffer(ST_SetSRID(ST_MakePoint(9.713, 4.052), 4326)::geography, 3000)::geometry,
    3,
    100000, 20000,
    ARRAY['Akwa', 'Bonapriso', 'Bali'],
    10, 'voiture',
    ARRAY['CLIN-PAST', 'CLIN-LOUISPASTEUR-DLA'],
    60.0,
    '{"type": "polyclinique", "zone": "centre_ville", "clientele": "classe_moyenne_superieure"}'::JSONB
);

-- Polyclinique de Poitiers
INSERT INTO zones_chalandise (
    id_org_unit, nom_zone, zone_geographique, rayon_km,
    population_estimee, menages_estimes, quartiers_couverts,
    temps_acces_moyen_minutes, moyen_acces_principal,
    concurrence_directe, taux_couverture_estime, metadata
) VALUES (
    (SELECT id_org_unit FROM organisation_units WHERE code = 'CLIN-POITIERS'),
    'Zone chalandise Polyclinique de Poitiers - Akwa',
    ST_Buffer(ST_SetSRID(ST_MakePoint(9.711, 4.049), 4326)::geometry, 3000)::geometry,
    3,
    95000, 19000,
    ARRAY['Akwa', 'Bonapriso', 'Gare'],
    10, 'voiture',
    ARRAY['H-GEN-DLA', 'CLIN-PAST'],
    58.0,
    '{"type": "polyclinique", "zone": "centre_ville", "clientele": "mixte"}'::JSONB
);

-- Swiss Clinic Cameroon
INSERT INTO zones_chalandise (
    id_org_unit, nom_zone, zone_geographique, rayon_km,
    population_estimee, menages_estimes, quartiers_couverts,
    temps_acces_moyen_minutes, moyen_acces_principal,
    concurrence_directe, taux_couverture_estime, metadata
) VALUES (
    (SELECT id_org_unit FROM organisation_units WHERE code = 'CLIN-SWISS'),
    'Zone chalandise Swiss Clinic - Akwa/Bastos',
    ST_Buffer(ST_SetSRID(ST_MakePoint(9.713, 4.048), 4326)::geometry, 2500)::geometry,
    2.5,
    60000, 12000,
    ARRAY['Akwa', 'Bastos', 'Bonapriso'],
    8, 'voiture',
    ARRAY['CLIN-PAST', 'CLIN-LOUISPASTEUR-DLA'],
    50.0,
    '{"type": "clinique_internationale", "zone": "quartier_aisé", "clientele": "expatries_haut_revenus"}'::JSONB
);


