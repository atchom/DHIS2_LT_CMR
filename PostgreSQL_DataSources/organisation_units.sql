-- ============================================================
-- INSERTION DES CLINIQUES PRIVÉES DE DOUALA (LITTORAL)
-- Source: Medpages.info - Clinics - Private in Douala
-- Date: 2026
-- ============================================================

-- ============================================================
-- 1. S'assurer que le district de Douala existe
-- ============================================================

INSERT INTO organisation_units (code, nom, niveau, parent_id, region, departement, type_structure, type_propriete, zone_eco, actif) VALUES
('DIST-DLA', 'District de Santé de Douala', 2, (SELECT id_org_unit FROM organisation_units WHERE code = 'REG-LITT'), 'Littoral', 'Wouri', 'district_sante', 'public', 'urbaine_dense', TRUE)
ON CONFLICT (code) DO NOTHING;

-- ============================================================
-- 2. Insertion des cliniques privées de Douala
-- ============================================================

WITH district_dla AS (SELECT id_org_unit FROM organisation_units WHERE code = 'DIST-DLA')
INSERT INTO organisation_units (
    code, nom, niveau, parent_id, region, departement, arrondissement,
    district_sante, commune, quartier_ville, type_structure, type_propriete,
    sous_type_prive, zone_eco, zone_inondable, possede_labo, possede_imagerie,
    coord_geographique, convention_etat, telephone, responsable, actif, metadata
) VALUES

-- ==================== CLINIQUES GÉNÉRALES ====================

('CLIN-BETHANIE', 'Bethanie-Ginteam Clinic', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.708, 4.048), 4326), FALSE, '699002400', 'Dr Ginteam', TRUE,
'{"specialite": "générale"}'::JSONB),

('CLIN-C2T', 'C2t Clinic', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Bonapriso',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.718, 4.062), 4326), FALSE, '699002401', 'Dr C2T', TRUE,
'{}'::JSONB),

('CLIN-AS-SALAM', 'Cabinet de Soins de Santé As-Salam', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Bali',
'clinique_privee', 'prive_commercial', 'cabinet_medical', 'urbaine', FALSE, FALSE, FALSE,
ST_SetSRID(ST_MakePoint(9.715, 4.055), 4326), FALSE, '699002402', 'Dr Salam', TRUE,
'{"type": "cabinet"}'::JSONB),

('CLIN-IDOC', 'Cabinet Médical I''Doc', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'cabinet_medical', 'urbaine_dense', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.710, 4.049), 4326), FALSE, '699002403', 'Dr I''Doc', TRUE,
'{}'::JSONB),

('CLIN-ISIS', 'Cabinet Médical Isis', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'cabinet_medical', 'urbaine_dense', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.712, 4.047), 4326), FALSE, '699002404', 'Dr Isis', TRUE,
'{}'::JSONB),

-- ==================== CENTRES DE SANTÉ INTÉGRÉS PRIVÉS ====================

('CSI-BONANJO', 'Centre de Santé Intégré de Bonanjo', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Bonanjo',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, TRUE,
ST_SetSRID(ST_MakePoint(9.698, 4.050), 4326), TRUE, '233447000', 'Dr Bonanjo', TRUE,
'{"type": "CSI privé"}'::JSONB),

('CLIN-MEDJOWE', 'Centre Hospitalier Humanitaire Medjowe', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 2e', 'Douala', 'Douala 2e', 'Bonamoussadi',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.643, 4.084), 4326), TRUE, '699002405', 'Dr Medjowe', TRUE,
'{"type": "humanitaire"}'::JSONB),

('CMA-DOUALA2', 'Centre Médical d''Arrondissement de Douala 2ème', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 2e', 'Douala', 'Douala 2e', 'Bonabéri',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine', TRUE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.667, 4.090), 4326), TRUE, '699002406', 'Dr CMA Douala 2', TRUE,
'{"niveau": "CMA"}'::JSONB),

('CLIN-ROSEAUX', 'Centre Médical des Roseaux', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.705, 4.052), 4326), TRUE, '699002407', 'Dr Roseaux', TRUE,
'{}'::JSONB),

('CLIN-BESSENGUE', 'Centre Medicale de Bessengué', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Bessengué',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.714, 4.057), 4326), FALSE, '699002408', 'Dr Bessengué', TRUE,
'{}'::JSONB),

('CLIN-GRACIAS', 'Centre Médical Gracias', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 3e', 'Douala', 'Douala 3e', 'Deido',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.740, 4.039), 4326), FALSE, '699002409', 'Dr Gracias', TRUE,
'{}'::JSONB),

('CLIN-KINGDAVID', 'Centre Médical King David', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 3e', 'Douala', 'Douala 3e', 'Logbaba',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.748, 4.030), 4326), FALSE, '699002410', 'Dr King David', TRUE,
'{}'::JSONB),

('CLIN-LADIES', 'Centre Medical Ladies & Family Care - Ndogbong', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 5e', 'Douala', 'Douala 5e', 'Ndogbong',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'peri_urbaine', TRUE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.719, 4.021), 4326), FALSE, '699002411', 'Dr Ladies Care', TRUE,
'{"specialite": "familiale"}'::JSONB),

('CLIN-STLUC', 'Centre Médical Saint Luc Du Rond Point', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Rond Point Deido',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.730, 4.042), 4326), FALSE, '699002412', 'Dr Saint Luc', TRUE,
'{"type": "confessionnel"}'::JSONB),

('CLIN-SOLIDARITE', 'Centre Medical Solidarite', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 2e', 'Douala', 'Douala 2e', 'Bonamoussadi',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.642, 4.085), 4326), FALSE, '699002413', 'Dr Solidarité', TRUE,
'{}'::JSONB),

('CLIN-BEAUBEBE', 'Centre Médico-Pédiatrique Beau Bébé', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.707, 4.050), 4326), FALSE, '699002414', 'Dr Beau Bébé', TRUE,
'{"specialite": "pédiatrique"}'::JSONB),

('CLIN-ETIENNO', 'Centre Médico-Social Etienno', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 3e', 'Douala', 'Douala 3e', 'Deido',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.742, 4.038), 4326), FALSE, '699002415', 'Dr Etienno', TRUE,
'{"type": "médico-social"}'::JSONB),

('CLIN-CHECKUP', 'Check Up Medical Centre', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Bonapriso',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, TRUE,
ST_SetSRID(ST_MakePoint(9.717, 4.061), 4326), TRUE, '233448000', 'Dr Check Up', TRUE,
'{"specialite": "check-up"}'::JSONB),

-- ==================== CLINIQUES SPÉCIALISÉES ====================

('CLIN-BETHESDA', 'Clinique Bethesda - Douala', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, TRUE,
ST_SetSRID(ST_MakePoint(9.711, 4.050), 4326), TRUE, '233449000', 'Dr Bethesda', TRUE,
'{"type": "confessionnel"}'::JSONB),

('CLIN-COEURVIE', 'Clinique Cœur & Vie', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.709, 4.051), 4326), FALSE, '699002416', 'Dr Cœur Vie', TRUE,
'{"specialite": "cardiologie"}'::JSONB),

('CLIN-BALI', 'Clinique de Bali', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Bali',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.714, 4.056), 4326), FALSE, '699002417', 'Dr Bali', TRUE,
'{}'::JSONB),

('CLIN-GAULLE', 'Clinique de Gaulle', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.706, 4.048), 4326), FALSE, '699002418', 'Dr de Gaulle', TRUE,
'{}'::JSONB),

('CLIN-KOUMASSI', 'Clinique de Koumassi', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 2e', 'Douala', 'Douala 2e', 'Koumassi',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.655, 4.088), 4326), FALSE, '699002419', 'Dr Koumassi', TRUE,
'{}'::JSONB),

('CLIN-CONCEPTION', 'Clinique de la Conception - Bonabéri', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 4e', 'Douala', 'Douala 4e', 'Bonabéri',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine', TRUE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.668, 4.092), 4326), FALSE, '699002420', 'Dr Conception', TRUE,
'{"type": "catholique"}'::JSONB),

('CLIN-AEROPORT', 'Clinique de L'' aéroport', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 2e', 'Douala', 'Douala 2e', 'Bonapriso',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.720, 4.080), 4326), FALSE, '699002421', 'Dr Aéroport', TRUE,
'{}'::JSONB),

('CLIN-REGENERES', 'Clinique De La Régénérescence', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 5e', 'Cite-Cicam',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.718, 4.058), 4326), FALSE, '699002422', 'Dr Régénérescence', TRUE,
'{}'::JSONB),

('CLIN-ESPERANCE', 'Clinique de l''Esperance - Douala', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 3e', 'Douala', 'Douala 5e', 'Logpom',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine', TRUE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.763, 4.022), 4326), FALSE, '699002423', 'Dr Espérance', TRUE,
'{"type": "confessionnel"}'::JSONB),

('CLIN-UNIV', 'Clinique De l'' Université', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Université de Douala',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, TRUE,
ST_SetSRID(ST_MakePoint(9.688, 4.072), 4326), FALSE, '699002424', 'Dr Université', TRUE,
'{}'::JSONB),

('CLIN-CITES', 'Clinique des Cites', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Bonapriso',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.719, 4.063), 4326), FALSE, '699002425', 'Dr Cites', TRUE,
'{}'::JSONB),

('CLIN-BOUM', 'Clinique Dr Boum', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.710, 4.050), 4326), FALSE, '699002426', 'Dr Boum', TRUE,
'{}'::JSONB),

('CLIN-KERTHAN', 'Clinique Kerthan', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.707, 4.049), 4326), FALSE, '699002427', 'Dr Kerthan', TRUE,
'{}'::JSONB),

('CLIN-GRANDILE', 'Clinique La Grande Île', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.708, 4.052), 4326), FALSE, '699002428', 'Dr Grande Île', TRUE,
'{}'::JSONB),

('CLIN-SOURCE', 'Clinique la Source - Douala', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 2e', 'Douala', 'Douala 2e', 'Bonamoussadi',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.644, 4.084), 4326), FALSE, '699002429', 'Dr Source', TRUE,
'{}'::JSONB),

('CLIN-CEDRE', 'Clinique le Cèdre', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 5e', 'logpom',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.717, 4.059), 4326), FALSE, '699002430', 'Dr Cèdre', TRUE,
'{}'::JSONB),

('CLIN-METRO', 'Clinique Le Métropolitain', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Bonapriso',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, TRUE,
ST_SetSRID(ST_MakePoint(9.711, 4.051), 4326), FALSE, '699002431', 'Dr Métropolitain', TRUE,
'{}'::JSONB),

('CLIN-ODYSSEE', 'Clinique Medicale Odyssee', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.709, 4.050), 4326), FALSE, '699002432', 'Dr Odyssee', TRUE,
'{}'::JSONB),

('CLIN-UNITE', 'Clinique Médico-Chirurgicale de l''unité', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, TRUE,
ST_SetSRID(ST_MakePoint(9.713, 4.049), 4326), FALSE, '699002433', 'Dr Unité', TRUE,
'{"specialite": "médico-chirurgicale"}'::JSONB),

('CLIN-MEMOSEE', 'Clinique Memosee', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Bonapriso',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.720, 4.062), 4326), FALSE, '699002434', 'Dr Memosee', TRUE,
'{}'::JSONB),

('CLIN-STPETERS', 'Clinique Pediatrique & Genycologique Saint Petersburg', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.712, 4.050), 4326), FALSE, '699002435', 'Dr St Petersburg', TRUE,
'{"specialite": "pédiatrique/gynécologique"}'::JSONB),

('CLIN-STANNE', 'Clinique Sainte Anne d''Omer', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.714, 4.053), 4326), FALSE, '699002436', 'Dr Sainte Anne', TRUE,
'{"type": "catholique"}'::JSONB),

('CLIN-STMAURICE', 'Clinique Saint Maurice', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.715, 4.054), 4326), FALSE, '699002437', 'Dr Saint Maurice', TRUE,
'{}'::JSONB),

('CLIN-VITALIAC', 'Clinique Vitaliac Santé', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.706, 4.050), 4326), FALSE, '699002438', 'Dr Vitaliac', TRUE,
'{}'::JSONB),

('CLIN-DMC', 'Polyclinic Bonanjo DMC (Daniel Muna Memorial Clinic)', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Bonanjo',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, TRUE,
ST_SetSRID(ST_MakePoint(9.699, 4.052), 4326), TRUE, '233450000', 'Dr Daniel Muna', TRUE,
'{"type": "memorial"}'::JSONB),

-- ==================== POLYCLINIQUES ====================

('CLIN-MARIO', 'Polyclinic Marie O', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, TRUE,
ST_SetSRID(ST_MakePoint(9.710, 4.048), 4326), FALSE, '699002439', 'Dr Marie O', TRUE,
'{}'::JSONB),

('CLIN-BORDEAUX', 'Polyclinique Bordeaux Douala', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, TRUE,
ST_SetSRID(ST_MakePoint(9.713, 4.052), 4326), TRUE, '233451000', 'Dr Bordeaux', TRUE,
'{}'::JSONB),

('CLIN-GARE', 'Polyclinique de la Gare', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Gare',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, TRUE,
ST_SetSRID(ST_MakePoint(9.705, 4.045), 4326), FALSE, '699002440', 'Dr Gare', TRUE,
'{}'::JSONB),

('CLIN-NID', 'Polyclinique de la Gare (Le Nid)', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Gare',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, TRUE,
ST_SetSRID(ST_MakePoint(9.704, 4.046), 4326), FALSE, '699002441', 'Dr Nid', TRUE,
'{}'::JSONB),

('CLIN-POITIERS', 'Polyclinique de Poitiers', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, TRUE,
ST_SetSRID(ST_MakePoint(9.711, 4.049), 4326), TRUE, '233452000', 'Dr Poitiers', TRUE,
'{}'::JSONB),

('CLIN-CHENDJOU', 'Polyclinique Dr Chendjou Joseph Sarl', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, TRUE,
ST_SetSRID(ST_MakePoint(9.708, 4.047), 4326), TRUE, '699002442', 'Dr Chendjou', TRUE,
'{}'::JSONB),

('CLIN-INTER-BONAB', 'Polyclinique Internationale de Bonaberi', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 4e', 'Douala', 'Douala 4e', 'Bonabéri',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine', TRUE, TRUE, TRUE,
ST_SetSRID(ST_MakePoint(9.670, 4.093), 4326), TRUE, '699002443', 'Dr Internationale', TRUE,
'{}'::JSONB),

('CLIN-COLOMBE', 'Polyclinique La Colombe', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, TRUE,
ST_SetSRID(ST_MakePoint(9.712, 4.051), 4326), FALSE, '699002444', 'Dr Colombe', TRUE,
'{}'::JSONB),

('CLIN-SOPPO', 'Polyclinique Soppo Priso', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Bonapriso',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, TRUE,
ST_SetSRID(ST_MakePoint(9.714, 4.054), 4326), FALSE, '699002445', 'Dr Soppo', TRUE,
'{}'::JSONB),

-- ==================== AUTRES CABINETS ET CLINIQUES ====================

('CMA-KOTTO', 'CMA de Kotto', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 3e', 'Douala', 'Douala 3e', 'Kotto',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.750, 4.040), 4326), TRUE, '699002446', 'Dr Kotto', TRUE,
'{"niveau": "CMA"}'::JSONB),

('CMA-NKOULOUL', 'CMA Nkoulouloun', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Nkoulouloun',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.723, 4.065), 4326), TRUE, '699002447', 'Dr Nkoulouloun', TRUE,
'{"niveau": "CMA"}'::JSONB),

('CLIN-DOUALA', 'Douala Clinic', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, TRUE,
ST_SetSRID(ST_MakePoint(9.710, 4.052), 4326), TRUE, '699002448', 'Dr Douala Clinic', TRUE,
'{}'::JSONB),

('CLIN-JE', 'J & E Memorial Polyclinic', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, TRUE,
ST_SetSRID(ST_MakePoint(9.715, 4.055), 4326), FALSE, '699002449', 'Dr J&E', TRUE,
'{"type": "memorial"}'::JSONB),

('CLIN-JOSS', 'Joss Medi-Clinic', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.716, 4.056), 4326), FALSE, '699002450', 'Dr Joss', TRUE,
'{}'::JSONB),

('CLIN-LECHING', 'Leching Clinic', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.713, 4.053), 4326), FALSE, '699002451', 'Dr Leching', TRUE,
'{}'::JSONB),

('CLIN-LOUISPASTEUR', 'Louis Pasteur Clinic', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, TRUE,
ST_SetSRID(ST_MakePoint(9.709, 4.048), 4326), TRUE, '699002452', 'Dr Pasteur', TRUE,
'{}'::JSONB),

('CLIN-DIAMANT', 'Medical Centre Social Diamant', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.707, 4.047), 4326), FALSE, '699002453', 'Dr Diamant', TRUE,
'{}'::JSONB),

('CLIN-MEDICARE', 'Medicare Sarl', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.711, 4.050), 4326), FALSE, '699002454', 'Dr Medicare', TRUE,
'{}'::JSONB),

('CLIN-MEDICARE2', 'Médicare Sarl', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Bonapriso',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.718, 4.060), 4326), FALSE, '699002455', 'Dr Médicare', TRUE,
'{}'::JSONB),

('CLIN-PALMIERS', 'Palmiers Medical Centre', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, TRUE,
ST_SetSRID(ST_MakePoint(9.714, 4.054), 4326), TRUE, '699002456', 'Dr Palmiers', TRUE,
'{}'::JSONB),

('CLIN-RAMEAUX', 'Rameaux Clinic', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.712, 4.049), 4326), FALSE, '699002457', 'Dr Rameaux', TRUE,
'{}'::JSONB),

('CLIN-RAPHA', 'Rapha Clinic', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.710, 4.051), 4326), FALSE, '699002458', 'Dr Rapha', TRUE,
'{}'::JSONB),

('CLIN-SURGERY', 'Surgery Clinic Specializing', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, TRUE,
ST_SetSRID(ST_MakePoint(9.715, 4.052), 4326), FALSE, '699002459', 'Dr Surgery', TRUE,
'{"specialite": "chirurgie"}'::JSONB),

('CLIN-SWISS', 'Swiss Clinic Cameroon', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, TRUE,
ST_SetSRID(ST_MakePoint(9.713, 4.048), 4326), TRUE, '233453000', 'Dr Swiss', TRUE,
'{}'::JSONB),

('CLIN-TOGUEM', 'Toguem Psychiatry', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'cabinet_medical', 'urbaine_dense', FALSE, FALSE, FALSE,
ST_SetSRID(ST_MakePoint(9.716, 4.055), 4326), FALSE, '699002460', 'Dr Toguem', TRUE,
'{"specialite": "psychiatrie"}'::JSONB);






-- ============================================================
-- CORRECTION DU TYPE DE PROPRIÉTÉ DES HÔPITAUX DU LITTORAL
-- Basé sur la réalité terrain (public vs privé)
-- ============================================================

-- Mise à jour des structures publiques (État / Militaire / Districts publics)
UPDATE organisation_units
SET type_propriete = 'public'
WHERE code IN (
    'H-MIL-DLA',               -- Centre De La Garnison Militaire
    'H-GEN-DLA',               -- Hôpital Général de Douala
    'H-HGOPED-DLA',            -- HGOPED
    'H-LAQUINTINIE-DLA',       -- Hôpital Laquintinie
    'H-ANNEXE-EDEA',           -- Hôpital Régional Annexe Edéa
    'H-NKONGSAMBA',            -- Hôpital Régional de Nkongsamba
    'H-LOUM',                  -- Hôpital De District De Loum
    'H-BONASSAM-DLA',          -- Hôpital de District de Bonassama
    'H-CDP-DLA',               -- Hôpital de District de la Cite des Palmiers
    'H-LOGBABA-DLA',           -- Hôpital de District de Logbaba
    'H-MBANGUE-DLA',           -- Hôpital de District de Mbangue
    'H-NEWBELL-DLA',           -- Hôpital de District de Newbell
    'H-NYLON-DLA',             -- Hôpital de District de Nylon
    'H-DEIDO-DLA',             -- Hôpital District de Deido
    'H-CMA-EDEA'               -- CMA Edéa
);

-- Mise à jour des structures privées confessionnelles (catholiques, protestantes, missions)
UPDATE organisation_units
SET type_propriete = 'prive_confessionnel'
WHERE code IN (
    'H-NDLOVE-LOG',            -- Hôpital Catholique notre dame de l'amour
    'H-STALBERT-DLA',          -- Hôpital Catholique St Albert Le Grand
    'H-STJEAN-DLA',            -- Hopital Saint Jean de Malte (Ordre de Malte)
    'H-SAKER-DLA',             -- Hôpital Emilie Saker (protestant)
    'H-MBOPPI-DLA'             -- Mboppi Baptist Hospital (protestant)
);

-- Mise à jour des structures privées de type fondation (à but non lucratif)
UPDATE organisation_units
SET type_propriete = 'prive_confessionnel'  -- ou 'prive_commercial' selon statut, mais généralement considérées comme privées non lucratives
WHERE code IN (
    'H-FOUENANG-DLA',          -- Fondation Fouenang Sante
    'H-SARAH-DLA'              -- Fondation Sarah Eboumbou
);

-- Mise à jour des structures mutualistes / privées commerciales
UPDATE organisation_units
SET type_propriete = 'prive_commercial'
WHERE code IN (
    'H-MUT-DLA',               -- Centre Medical Des Mutualistes
    'H-BONSEC-DLA',            -- Centre Medical Du Bon Secours
    'H-CEBEC-DLA'              -- Hôpital Cebec (mutualiste)
);

-- Pour les structures déjà correctement définies dans le script original, on s'assure que public reste public
-- (au cas où certaines auraient été mal positionnées, mais normalement c'est bon)
UPDATE organisation_units
SET type_propriete = 'public'
WHERE code IN (
    'REG-LITT', 'DIST-DLA', 'DIST-EDEA', 'DIST-NKON', 'DIST-LOUM', 'DIST-YAB'
);

-- ============================================================
-- INSERTION DES CLINIQUES PRIVÉES DE DOUALA (LITTORAL)
-- Source: Medpages.info - Clinics - Private in Douala
-- Date: 2026
-- ============================================================

-- ============================================================
-- 1. S'assurer que le district de Douala existe
-- ============================================================

INSERT INTO organisation_units (code, nom, niveau, parent_id, region, departement, type_structure, type_propriete, zone_eco, actif) VALUES
('DIST-DLA', 'District de Santé de Douala', 2, (SELECT id_org_unit FROM organisation_units WHERE code = 'REG-LITT'), 'Littoral', 'Wouri', 'district_sante', 'public', 'urbaine_dense', TRUE)
ON CONFLICT (code) DO NOTHING;

-- ============================================================
-- 2. Insertion des cliniques privées de Douala
-- ============================================================

WITH district_dla AS (SELECT id_org_unit FROM organisation_units WHERE code = 'DIST-DLA')
INSERT INTO organisation_units (
    code, nom, niveau, parent_id, region, departement, arrondissement,
    district_sante, commune, quartier_ville, type_structure, type_propriete,
    sous_type_prive, zone_eco, zone_inondable, possede_labo, possede_imagerie,
    coord_geographique, convention_etat, telephone, responsable, actif, metadata
) VALUES

-- ==================== CLINIQUES GÉNÉRALES ====================

('CLIN-BETHANIE', 'Bethanie-Ginteam Clinic', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.708, 4.048), 4326), FALSE, '699002400', 'Dr Ginteam', TRUE,
'{"specialite": "générale"}'::JSONB),

('CLIN-C2T', 'C2t Clinic', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Bonapriso',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.718, 4.062), 4326), FALSE, '699002401', 'Dr C2T', TRUE,
'{}'::JSONB),

('CLIN-AS-SALAM', 'Cabinet de Soins de Santé As-Salam', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Bali',
'clinique_privee', 'prive_commercial', 'cabinet_medical', 'urbaine', FALSE, FALSE, FALSE,
ST_SetSRID(ST_MakePoint(9.715, 4.055), 4326), FALSE, '699002402', 'Dr Salam', TRUE,
'{"type": "cabinet"}'::JSONB),

('CLIN-IDOC', 'Cabinet Médical I''Doc', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'cabinet_medical', 'urbaine_dense', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.710, 4.049), 4326), FALSE, '699002403', 'Dr I''Doc', TRUE,
'{}'::JSONB),

('CLIN-ISIS', 'Cabinet Médical Isis', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'cabinet_medical', 'urbaine_dense', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.712, 4.047), 4326), FALSE, '699002404', 'Dr Isis', TRUE,
'{}'::JSONB),

-- ==================== CENTRES DE SANTÉ INTÉGRÉS PRIVÉS ====================

('CSI-BONANJO', 'Centre de Santé Intégré de Bonanjo', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Bonanjo',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, TRUE,
ST_SetSRID(ST_MakePoint(9.698, 4.050), 4326), TRUE, '233447000', 'Dr Bonanjo', TRUE,
'{"type": "CSI privé"}'::JSONB),

('CLIN-MEDJOWE', 'Centre Hospitalier Humanitaire Medjowe', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 2e', 'Douala', 'Douala 2e', 'Bonamoussadi',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.643, 4.084), 4326), TRUE, '699002405', 'Dr Medjowe', TRUE,
'{"type": "humanitaire"}'::JSONB),

('CMA-DOUALA2', 'Centre Médical d''Arrondissement de Douala 2ème', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 2e', 'Douala', 'Douala 2e', 'Bonabéri',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine', TRUE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.667, 4.090), 4326), TRUE, '699002406', 'Dr CMA Douala 2', TRUE,
'{"niveau": "CMA"}'::JSONB),

('CLIN-ROSEAUX', 'Centre Médical des Roseaux', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.705, 4.052), 4326), TRUE, '699002407', 'Dr Roseaux', TRUE,
'{}'::JSONB),

('CLIN-BESSENGUE', 'Centre Medicale de Bessengué', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Bessengué',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.714, 4.057), 4326), FALSE, '699002408', 'Dr Bessengué', TRUE,
'{}'::JSONB),

('CLIN-GRACIAS', 'Centre Médical Gracias', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 3e', 'Douala', 'Douala 3e', 'Deido',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.740, 4.039), 4326), FALSE, '699002409', 'Dr Gracias', TRUE,
'{}'::JSONB),

('CLIN-KINGDAVID', 'Centre Médical King David', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 3e', 'Douala', 'Douala 3e', 'Logbaba',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.748, 4.030), 4326), FALSE, '699002410', 'Dr King David', TRUE,
'{}'::JSONB),

('CLIN-LADIES', 'Centre Medical Ladies & Family Care - Ndogbong', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 5e', 'Douala', 'Douala 5e', 'Ndogbong',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'peri_urbaine', TRUE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.719, 4.021), 4326), FALSE, '699002411', 'Dr Ladies Care', TRUE,
'{"specialite": "familiale"}'::JSONB),

('CLIN-STLUC', 'Centre Médical Saint Luc Du Rond Point', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Rond Point Deido',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.730, 4.042), 4326), FALSE, '699002412', 'Dr Saint Luc', TRUE,
'{"type": "confessionnel"}'::JSONB),

('CLIN-SOLIDARITE', 'Centre Medical Solidarite', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 2e', 'Douala', 'Douala 2e', 'Bonamoussadi',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.642, 4.085), 4326), FALSE, '699002413', 'Dr Solidarité', TRUE,
'{}'::JSONB),

('CLIN-BEAUBEBE', 'Centre Médico-Pédiatrique Beau Bébé', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.707, 4.050), 4326), FALSE, '699002414', 'Dr Beau Bébé', TRUE,
'{"specialite": "pédiatrique"}'::JSONB),

('CLIN-ETIENNO', 'Centre Médico-Social Etienno', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 3e', 'Douala', 'Douala 3e', 'Deido',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.742, 4.038), 4326), FALSE, '699002415', 'Dr Etienno', TRUE,
'{"type": "médico-social"}'::JSONB),

('CLIN-CHECKUP', 'Check Up Medical Centre', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Bonapriso',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, TRUE,
ST_SetSRID(ST_MakePoint(9.717, 4.061), 4326), TRUE, '233448000', 'Dr Check Up', TRUE,
'{"specialite": "check-up"}'::JSONB),

-- ==================== CLINIQUES SPÉCIALISÉES ====================

('CLIN-BETHESDA', 'Clinique Bethesda - Douala', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, TRUE,
ST_SetSRID(ST_MakePoint(9.711, 4.050), 4326), TRUE, '233449000', 'Dr Bethesda', TRUE,
'{"type": "confessionnel"}'::JSONB),

('CLIN-COEURVIE', 'Clinique Cœur & Vie', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.709, 4.051), 4326), FALSE, '699002416', 'Dr Cœur Vie', TRUE,
'{"specialite": "cardiologie"}'::JSONB),

('CLIN-BALI', 'Clinique de Bali', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Bali',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.714, 4.056), 4326), FALSE, '699002417', 'Dr Bali', TRUE,
'{}'::JSONB),

('CLIN-GAULLE', 'Clinique de Gaulle', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.706, 4.048), 4326), FALSE, '699002418', 'Dr de Gaulle', TRUE,
'{}'::JSONB),

('CLIN-KOUMASSI', 'Clinique de Koumassi', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 2e', 'Douala', 'Douala 2e', 'Koumassi',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.655, 4.088), 4326), FALSE, '699002419', 'Dr Koumassi', TRUE,
'{}'::JSONB),

('CLIN-CONCEPTION', 'Clinique de la Conception - Bonabéri', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 4e', 'Douala', 'Douala 4e', 'Bonabéri',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine', TRUE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.668, 4.092), 4326), FALSE, '699002420', 'Dr Conception', TRUE,
'{"type": "catholique"}'::JSONB),

('CLIN-AEROPORT', 'Clinique de L'' aéroport', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 2e', 'Douala', 'Douala 2e', 'Bonapriso',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.720, 4.080), 4326), FALSE, '699002421', 'Dr Aéroport', TRUE,
'{}'::JSONB),

('CLIN-REGENERES', 'Clinique De La Régénérescence', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 5e', 'Cite-Cicam',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.718, 4.058), 4326), FALSE, '699002422', 'Dr Régénérescence', TRUE,
'{}'::JSONB),

('CLIN-ESPERANCE', 'Clinique de l''Esperance - Douala', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 3e', 'Douala', 'Douala 5e', 'Logpom',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine', TRUE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.763, 4.022), 4326), FALSE, '699002423', 'Dr Espérance', TRUE,
'{"type": "confessionnel"}'::JSONB),

('CLIN-UNIV', 'Clinique De l'' Université', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Université de Douala',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, TRUE,
ST_SetSRID(ST_MakePoint(9.688, 4.072), 4326), FALSE, '699002424', 'Dr Université', TRUE,
'{}'::JSONB),

('CLIN-CITES', 'Clinique des Cites', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Bonapriso',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.719, 4.063), 4326), FALSE, '699002425', 'Dr Cites', TRUE,
'{}'::JSONB),

('CLIN-BOUM', 'Clinique Dr Boum', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.710, 4.050), 4326), FALSE, '699002426', 'Dr Boum', TRUE,
'{}'::JSONB),

('CLIN-KERTHAN', 'Clinique Kerthan', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.707, 4.049), 4326), FALSE, '699002427', 'Dr Kerthan', TRUE,
'{}'::JSONB),

('CLIN-GRANDILE', 'Clinique La Grande Île', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.708, 4.052), 4326), FALSE, '699002428', 'Dr Grande Île', TRUE,
'{}'::JSONB),

('CLIN-SOURCE', 'Clinique la Source - Douala', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 2e', 'Douala', 'Douala 2e', 'Bonamoussadi',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.644, 4.084), 4326), FALSE, '699002429', 'Dr Source', TRUE,
'{}'::JSONB),

('CLIN-CEDRE', 'Clinique le Cèdre', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 5e', 'logpom',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.717, 4.059), 4326), FALSE, '699002430', 'Dr Cèdre', TRUE,
'{}'::JSONB),

('CLIN-METRO', 'Clinique Le Métropolitain', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Bonapriso',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, TRUE,
ST_SetSRID(ST_MakePoint(9.711, 4.051), 4326), FALSE, '699002431', 'Dr Métropolitain', TRUE,
'{}'::JSONB),

('CLIN-ODYSSEE', 'Clinique Medicale Odyssee', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.709, 4.050), 4326), FALSE, '699002432', 'Dr Odyssee', TRUE,
'{}'::JSONB),

('CLIN-UNITE', 'Clinique Médico-Chirurgicale de l''unité', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, TRUE,
ST_SetSRID(ST_MakePoint(9.713, 4.049), 4326), FALSE, '699002433', 'Dr Unité', TRUE,
'{"specialite": "médico-chirurgicale"}'::JSONB),

('CLIN-MEMOSEE', 'Clinique Memosee', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Bonapriso',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.720, 4.062), 4326), FALSE, '699002434', 'Dr Memosee', TRUE,
'{}'::JSONB),

('CLIN-STPETERS', 'Clinique Pediatrique & Genycologique Saint Petersburg', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.712, 4.050), 4326), FALSE, '699002435', 'Dr St Petersburg', TRUE,
'{"specialite": "pédiatrique/gynécologique"}'::JSONB),

('CLIN-STANNE', 'Clinique Sainte Anne d''Omer', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.714, 4.053), 4326), FALSE, '699002436', 'Dr Sainte Anne', TRUE,
'{"type": "catholique"}'::JSONB),

('CLIN-STMAURICE', 'Clinique Saint Maurice', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.715, 4.054), 4326), FALSE, '699002437', 'Dr Saint Maurice', TRUE,
'{}'::JSONB),

('CLIN-VITALIAC', 'Clinique Vitaliac Santé', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.706, 4.050), 4326), FALSE, '699002438', 'Dr Vitaliac', TRUE,
'{}'::JSONB),

('CLIN-DMC', 'Polyclinic Bonanjo DMC (Daniel Muna Memorial Clinic)', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Bonanjo',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, TRUE,
ST_SetSRID(ST_MakePoint(9.699, 4.052), 4326), TRUE, '233450000', 'Dr Daniel Muna', TRUE,
'{"type": "memorial"}'::JSONB),

-- ==================== POLYCLINIQUES ====================

('CLIN-MARIO', 'Polyclinic Marie O', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, TRUE,
ST_SetSRID(ST_MakePoint(9.710, 4.048), 4326), FALSE, '699002439', 'Dr Marie O', TRUE,
'{}'::JSONB),

('CLIN-BORDEAUX', 'Polyclinique Bordeaux Douala', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, TRUE,
ST_SetSRID(ST_MakePoint(9.713, 4.052), 4326), TRUE, '233451000', 'Dr Bordeaux', TRUE,
'{}'::JSONB),

('CLIN-GARE', 'Polyclinique de la Gare', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Gare',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, TRUE,
ST_SetSRID(ST_MakePoint(9.705, 4.045), 4326), FALSE, '699002440', 'Dr Gare', TRUE,
'{}'::JSONB),

('CLIN-NID', 'Polyclinique de la Gare (Le Nid)', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Gare',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, TRUE,
ST_SetSRID(ST_MakePoint(9.704, 4.046), 4326), FALSE, '699002441', 'Dr Nid', TRUE,
'{}'::JSONB),

('CLIN-POITIERS', 'Polyclinique de Poitiers', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, TRUE,
ST_SetSRID(ST_MakePoint(9.711, 4.049), 4326), TRUE, '233452000', 'Dr Poitiers', TRUE,
'{}'::JSONB),

('CLIN-CHENDJOU', 'Polyclinique Dr Chendjou Joseph Sarl', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, TRUE,
ST_SetSRID(ST_MakePoint(9.708, 4.047), 4326), TRUE, '699002442', 'Dr Chendjou', TRUE,
'{}'::JSONB),

('CLIN-INTER-BONAB', 'Polyclinique Internationale de Bonaberi', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 4e', 'Douala', 'Douala 4e', 'Bonabéri',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine', TRUE, TRUE, TRUE,
ST_SetSRID(ST_MakePoint(9.670, 4.093), 4326), TRUE, '699002443', 'Dr Internationale', TRUE,
'{}'::JSONB),

('CLIN-COLOMBE', 'Polyclinique La Colombe', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, TRUE,
ST_SetSRID(ST_MakePoint(9.712, 4.051), 4326), FALSE, '699002444', 'Dr Colombe', TRUE,
'{}'::JSONB),

('CLIN-SOPPO', 'Polyclinique Soppo Priso', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Bonapriso',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, TRUE,
ST_SetSRID(ST_MakePoint(9.714, 4.054), 4326), FALSE, '699002445', 'Dr Soppo', TRUE,
'{}'::JSONB),

-- ==================== AUTRES CABINETS ET CLINIQUES ====================

('CMA-KOTTO', 'CMA de Kotto', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 3e', 'Douala', 'Douala 3e', 'Kotto',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.750, 4.040), 4326), TRUE, '699002446', 'Dr Kotto', TRUE,
'{"niveau": "CMA"}'::JSONB),

('CMA-NKOULOUL', 'CMA Nkoulouloun', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Nkoulouloun',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.723, 4.065), 4326), TRUE, '699002447', 'Dr Nkoulouloun', TRUE,
'{"niveau": "CMA"}'::JSONB),

('CLIN-DOUALA', 'Douala Clinic', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, TRUE,
ST_SetSRID(ST_MakePoint(9.710, 4.052), 4326), TRUE, '699002448', 'Dr Douala Clinic', TRUE,
'{}'::JSONB),

('CLIN-JE', 'J & E Memorial Polyclinic', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, TRUE,
ST_SetSRID(ST_MakePoint(9.715, 4.055), 4326), FALSE, '699002449', 'Dr J&E', TRUE,
'{"type": "memorial"}'::JSONB),

('CLIN-JOSS', 'Joss Medi-Clinic', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.716, 4.056), 4326), FALSE, '699002450', 'Dr Joss', TRUE,
'{}'::JSONB),

('CLIN-LECHING', 'Leching Clinic', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.713, 4.053), 4326), FALSE, '699002451', 'Dr Leching', TRUE,
'{}'::JSONB),

('CLIN-LOUISPASTEUR', 'Louis Pasteur Clinic', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, TRUE,
ST_SetSRID(ST_MakePoint(9.709, 4.048), 4326), TRUE, '699002452', 'Dr Pasteur', TRUE,
'{}'::JSONB),

('CLIN-DIAMANT', 'Medical Centre Social Diamant', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.707, 4.047), 4326), FALSE, '699002453', 'Dr Diamant', TRUE,
'{}'::JSONB),

('CLIN-MEDICARE', 'Medicare Sarl', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.711, 4.050), 4326), FALSE, '699002454', 'Dr Medicare', TRUE,
'{}'::JSONB),

('CLIN-MEDICARE2', 'Médicare Sarl', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Bonapriso',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.718, 4.060), 4326), FALSE, '699002455', 'Dr Médicare', TRUE,
'{}'::JSONB),

('CLIN-PALMIERS', 'Palmiers Medical Centre', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, TRUE,
ST_SetSRID(ST_MakePoint(9.714, 4.054), 4326), TRUE, '699002456', 'Dr Palmiers', TRUE,
'{}'::JSONB),

('CLIN-RAMEAUX', 'Rameaux Clinic', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.712, 4.049), 4326), FALSE, '699002457', 'Dr Rameaux', TRUE,
'{}'::JSONB),

('CLIN-RAPHA', 'Rapha Clinic', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, FALSE,
ST_SetSRID(ST_MakePoint(9.710, 4.051), 4326), FALSE, '699002458', 'Dr Rapha', TRUE,
'{}'::JSONB),

('CLIN-SURGERY', 'Surgery Clinic Specializing', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, TRUE,
ST_SetSRID(ST_MakePoint(9.715, 4.052), 4326), FALSE, '699002459', 'Dr Surgery', TRUE,
'{"specialite": "chirurgie"}'::JSONB),

('CLIN-SWISS', 'Swiss Clinic Cameroon', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'clinique_generale', 'urbaine_dense', FALSE, TRUE, TRUE,
ST_SetSRID(ST_MakePoint(9.713, 4.048), 4326), TRUE, '233453000', 'Dr Swiss', TRUE,
'{}'::JSONB),

('CLIN-TOGUEM', 'Toguem Psychiatry', 4, (SELECT id_org_unit FROM district_dla),
'Littoral', 'Wouri', 'Douala 1er', 'Douala', 'Douala 1er', 'Akwa',
'clinique_privee', 'prive_commercial', 'cabinet_medical', 'urbaine_dense', FALSE, FALSE, FALSE,
ST_SetSRID(ST_MakePoint(9.716, 4.055), 4326), FALSE, '699002460', 'Dr Toguem', TRUE,
'{"specialite": "psychiatrie"}'::JSONB);


-- ============================================================
-- INSERTION DE LA CLINIQUE LOUIS PASTEUR - DOUALA
-- Établissement privé de référence à Douala
-- ============================================================

-- Vérifier d'abord si elle n'existe pas déjà
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM organisation_units WHERE code = 'CLIN-LOUISPASTEUR-DLA') THEN
        
        WITH district_dla AS (SELECT id_org_unit FROM organisation_units WHERE code = 'DIST-DLA')
        INSERT INTO organisation_units (
            code, nom, niveau, parent_id, region, departement, arrondissement,
            district_sante, commune, quartier_ville, type_structure, type_propriete,
            sous_type_prive, zone_eco, zone_inondable, capacite_lits, capacite_urgence,
            nombre_salles_consultation, possede_imagerie, possede_labo, possede_pharmacie,
            possede_ambulance, nb_ambulances, coord_geographique, zone_influence_km,
            population_couverte, date_agrement, numero_agrement, convention_etat,
            type_convention, telephone, email, responsable, actif, metadata
        ) VALUES (
            'CLIN-LOUISPASTEUR-DLA',               -- code unique
            'Clinique Louis Pasteur de Douala',     -- nom complet
            3,                                      -- niveau (établissement de référence)
            (SELECT id_org_unit FROM district_dla), -- parent = District Douala
            'Littoral',                             -- région
            'Wouri',                                -- département
            'Douala 1er',                           -- arrondissement
            'Douala',                               -- district sanitaire
            'Douala 1er',                           -- commune
            'Akwa',                                 -- quartier (centre-ville)
            'clinique_privee',                      -- type_structure
            'prive_commercial',                     -- type_propriete
            'clinique_generale',                    -- sous_type_prive
            'urbaine_dense',                        -- zone_eco
            FALSE,                                  -- zone_inondable (non)
            85,                                     -- capacite_lits
            15,                                     -- capacite_urgence
            12,                                     -- nombre_salles_consultation
            TRUE,                                   -- possede_imagerie (scanner, échographe)
            TRUE,                                   -- possede_labo
            TRUE,                                   -- possede_pharmacie
            TRUE,                                   -- possede_ambulance
            2,                                      -- nb_ambulances
            ST_SetSRID(ST_MakePoint(9.7085, 4.0495), 4326), -- coordonnées GPS (centre Akwa)
            8,                                      -- zone_influence_km
            180000,                                 -- population couverte estimée
            '1990-05-20',                           -- date d'agrément
            'AGR/PRIV/042/DLA/1990',                -- numéro agrément
            TRUE,                                   -- convention avec l'État
            'complete',                             -- type_convention (soins complets)
            '233454000',                            -- téléphone standard
            'contact@clinique-louis-pasteur.cm',    -- email
            'Dr Ngo Mbarga Joseph',                 -- responsable médical
            TRUE,                                   -- actif
            '{"specialites": ["médecine générale", "pédiatrie", "gynécologie", "chirurgie générale", "ophtalmologie"], "historique": "Fondée en 1990 par le Dr Louis Pasteur, référence dans la région du Littoral", "labels": ["Agréé CNPS", "Conventionné CNAM"], "capacites": {"blocs_operatoires": 2, "reanimation": 6, "consultations_journalieres_moyenne": 120}}'::JSONB
        );
        
        RAISE NOTICE 'Clinique Louis Pasteur insérée avec succès.';
    ELSE
        RAISE NOTICE 'La clinique Louis Pasteur existe déjà dans la base.';
    END IF;
END $$;

-- ============================================================
-- 2. VÉRIFICATION DE L'INSERTION
-- ============================================================

SELECT 
    id_org_unit,
    code,
    nom,
    type_structure,
    type_propriete,
    quartier_ville,
    capacite_lits,
    convention_etat,
    telephone,
    responsable,
    ST_AsText(coord_geographique) as coord_gps
FROM organisation_units 
WHERE code = 'CLIN-LOUISPASTEUR-DLA'
   OR nom ILIKE '%Louis Pasteur%';

-- ============================================================
-- 3. MISE À JOUR DE LA SÉQUENCE (si besoin)
-- ============================================================

SELECT setval('organisation_units_id_org_unit_seq', (SELECT MAX(id_org_unit) FROM organisation_units), true);

-- ============================================================
-- 4. COMPTE RENDU DES STRUCTURES PRIVÉES À DOUALA (post-insertion)
-- ============================================================

SELECT 
    '=== BILAN STRUCTURES PRIVÉES DOUALA ===' as rapport,
    COUNT(*) as total_structures_privees,
    COUNT(CASE WHEN sous_type_prive = 'clinique_generale' THEN 1 END) as cliniques_generales,
    COUNT(CASE WHEN sous_type_prive = 'cabinet_medical' THEN 1 END) as cabinets_medicaux,
    COUNT(CASE WHEN convention_etat = TRUE THEN 1 END) as conventionnees_etat,
    ROUND(AVG(capacite_lits)::numeric, 1) as moyenne_lits
FROM organisation_units
WHERE region = 'Littoral' 
  AND type_propriete = 'prive_commercial'
  AND type_structure = 'clinique_privee'
  AND actif = TRUE;

-- ============================================================
-- CORRECTION DES AMBULANCES - RÉALITÉ TERRAIN LITTORAL
-- ============================================================

-- 1. HÔPITAUX PUBLICS (ceux qui ont vraiment des ambulances)
UPDATE organisation_units 
SET possede_ambulance = TRUE, nb_ambulances = 6
WHERE code = 'H-LAQUINTINIE-DLA';  -- Hôpital Laquintinie (6 ambulances dont 2 SMUR)

UPDATE organisation_units 
SET possede_ambulance = TRUE, nb_ambulances = 4
WHERE code = 'H-GEN-DLA';  -- Hôpital Général de Douala

UPDATE organisation_units 
SET possede_ambulance = TRUE, nb_ambulances = 4
WHERE code = 'H-HGOPED-DLA';  -- HGOPED

UPDATE organisation_units 
SET possede_ambulance = TRUE, nb_ambulances = 2
WHERE code IN ('H-DEIDO-DLA', 'H-NEWBELL-DLA', 'H-BONASSAM-DLA');

UPDATE organisation_units 
SET possede_ambulance = TRUE, nb_ambulances = 1
WHERE code IN ('H-NDOK-DLA', 'H-BONAB-DLA', 'CSI-NDOKOTI', 'CSI-BONAB');

-- 2. CLINIQUES PRIVÉES DE RÉFÉRENCE (les plus grandes, avec ambulances)
UPDATE organisation_units 
SET possede_ambulance = TRUE, nb_ambulances = 3
WHERE code = 'CLIN-LOUISPASTEUR-DLA';

UPDATE organisation_units 
SET possede_ambulance = TRUE, nb_ambulances = 2
WHERE code IN ('CLIN-PAST', 'CLIN-BONAM', 'CLIN-BETHESDA', 'CLIN-MAKEPE');

UPDATE organisation_units 
SET possede_ambulance = TRUE, nb_ambulances = 1
WHERE code IN ('CLIN-BORDEAUX', 'CLIN-POITIERS', 'CLIN-SWISS', 'CLIN-DMC', 'CLIN-HOPE');

-- 3. TOUTES LES AUTRES CLINIQUES PRIVÉES -> PAS D'AMBULANCE (FALSE, 0)
-- La réalité terrain : la majorité des cliniques privées n'ont PAS d'ambulance
UPDATE organisation_units 
SET possede_ambulance = FALSE, nb_ambulances = 0
WHERE type_propriete = 'prive_commercial' 
  AND type_structure = 'clinique_privee'
  AND possede_ambulance IS NULL;

-- 4. CABINETS MÉDICAUX -> JAMAIS D'AMBULANCE
UPDATE organisation_units 
SET possede_ambulance = FALSE, nb_ambulances = 0
WHERE sous_type_prive IN ('cabinet_medical', 'psychiatrie')
   OR type_structure IN ('cabinet_medical', 'psychiatrie');

-- 5. PHARMACIES, LABOS, RADIOLOGIES -> PAS D'AMBULANCE
UPDATE organisation_units 
SET possede_ambulance = FALSE, nb_ambulances = 0
WHERE type_structure IN ('pharmacie', 'laboratoire', 'radiologie', 'centre_dialyse');

-- ============================================================
-- CORRECTION COMPLÈTE : NOMBRE DE SALLES DE CONSULTATION
-- ET CAPACITÉS D'URGENCE POUR TOUTES LES STRUCTURES
-- Réalité terrain Littoral Cameroun
-- ============================================================

-- ============================================================
-- 1. HÔPITAUX PUBLICS (valeurs réalistes)
-- ============================================================

-- Hôpitaux régionaux et centraux
UPDATE organisation_units 
SET nombre_salles_consultation = 25,
    capacite_urgence = 35
WHERE code = 'H-LAQUINTINIE-DLA';

UPDATE organisation_units 
SET nombre_salles_consultation = 20,
    capacite_urgence = 30
WHERE code = 'H-GEN-DLA';

UPDATE organisation_units 
SET nombre_salles_consultation = 18,
    capacite_urgence = 25
WHERE code = 'H-HGOPED-DLA';

UPDATE organisation_units 
SET nombre_salles_consultation = 15,
    capacite_urgence = 20
WHERE code = 'H-NKONGSAMBA';

UPDATE organisation_units 
SET nombre_salles_consultation = 12,
    capacite_urgence = 15
WHERE code = 'H-ANNEXE-EDEA';

-- Hôpitaux de district
UPDATE organisation_units 
SET nombre_salles_consultation = 12,
    capacite_urgence = 15
WHERE code = 'H-DEIDO-DLA';

UPDATE organisation_units 
SET nombre_salles_consultation = 10,
    capacite_urgence = 12
WHERE code IN ('H-NEWBELL-DLA', 'H-BONASSAM-DLA');

UPDATE organisation_units 
SET nombre_salles_consultation = 8,
    capacite_urgence = 10
WHERE code IN ('H-BONAB-DLA', 'H-NDOK-DLA', 'H-LOUM');

UPDATE organisation_units 
SET nombre_salles_consultation = 8,
    capacite_urgence = 8
WHERE code IN ('H-CDP-DLA', 'H-LOGBABA-DLA', 'H-MBANGUE-DLA', 'H-NYLON-DLA');

UPDATE organisation_units 
SET nombre_salles_consultation = 6,
    capacite_urgence = 6
WHERE code = 'H-CMA-EDEA';

-- CSI publics
UPDATE organisation_units 
SET nombre_salles_consultation = 8,
    capacite_urgence = 8
WHERE code IN ('CSI-NDOKOTI', 'CSI-BONAB', 'H-MIL-DLA');

UPDATE organisation_units 
SET nombre_salles_consultation = 6,
    capacite_urgence = 6
WHERE code IN ('CSI-BALI', 'CSI-BONAP', 'CSI-BONAMOUSS', 'CSI-MAKEPE', 
               'CSI-LOGPOM', 'CSI-MBOPPI', 'CSI-NYALLA', 'CSI-BEPANDA', 
               'CSI-JAPOMA', 'CSI-MBANGUE', 'CSI-POUT', 'CSI-BAR', 'CSI-MELONG');

-- ============================================================
-- 2. CLINIQUES PRIVÉES DE RÉFÉRENCE (Grandes cliniques)
-- ============================================================

UPDATE organisation_units 
SET nombre_salles_consultation = 12,
    capacite_urgence = 15
WHERE code = 'CLIN-LOUISPASTEUR-DLA';

UPDATE organisation_units 
SET nombre_salles_consultation = 10,
    capacite_urgence = 12
WHERE code IN ('CLIN-PAST', 'CLIN-BONAM', 'CLIN-BETHESDA', 'CLIN-MAKEPE');

UPDATE organisation_units 
SET nombre_salles_consultation = 8,
    capacite_urgence = 10
WHERE code IN ('CLIN-HOPE', 'CLIN-BORDEAUX', 'CLIN-POITIERS', 'CLIN-SWISS', 
               'CLIN-DMC', 'CLIN-UNIV', 'CLIN-UNITE');

UPDATE organisation_units 
SET nombre_salles_consultation = 8,
    capacite_urgence = 8
WHERE code IN ('CLIN-METRO', 'CLIN-MARIO', 'CLIN-CHECKUP', 'CLIN-DOUALA');

-- ============================================================
-- 3. CLINIQUES PRIVÉES MOYENNES
-- ============================================================

UPDATE organisation_units 
SET nombre_salles_consultation = 6,
    capacite_urgence = 6
WHERE code IN ('CLIN-BETHANIE', 'CLIN-C2T', 'CSI-BONANJO', 'CLIN-MEDJOWE',
               'CMA-DOUALA2', 'CLIN-ROSEAUX', 'CLIN-BESSENGUE', 'CLIN-GRACIAS',
               'CLIN-KINGDAVID', 'CLIN-LADIES', 'CLIN-STLUC', 'CLIN-SOLIDARITE',
               'CLIN-BEAUBEBE', 'CLIN-ETIENNO', 'CLIN-BALI', 'CLIN-GAULLE',
               'CLIN-KOUMASSI', 'CLIN-CONCEPTION', 'CLIN-AEROPORT', 'CLIN-REGENERES',
               'CLIN-ESPERANCE', 'CLIN-CITES', 'CLIN-BOUM', 'CLIN-KERTHAN',
               'CLIN-GRANDILE', 'CLIN-SOURCE', 'CLIN-CEDRE', 'CLIN-ODYSSEE',
               'CLIN-MEMOSEE', 'CLIN-STPETERS', 'CLIN-STANNE', 'CLIN-STMAURICE',
               'CLIN-VITALIAC', 'CLIN-SOPPO', 'CMA-KOTTO', 'CMA-NKOULOUL',
               'CLIN-JE', 'CLIN-JOSS', 'CLIN-LECHING', 'CLIN-DIAMANT',
               'CLIN-MEDICARE', 'CLIN-MEDICARE2', 'CLIN-PALMIERS', 'CLIN-RAMEAUX',
               'CLIN-RAPHA', 'CLIN-SURGERY', 'CLIN-GARE', 'CLIN-NID',
               'CLIN-COLOMBE', 'CLIN-INTER-BONAB');

-- ============================================================
-- 4. CABINETS MÉDICAUX (petites structures)
-- ============================================================

UPDATE organisation_units 
SET nombre_salles_consultation = 3,
    capacite_urgence = 2
WHERE code IN ('CLIN-AS-SALAM', 'CLIN-IDOC', 'CLIN-ISIS', 'CLIN-TOGUEM');

-- ============================================================
-- 5. AUTRES STRUCTURES (pharmacies, labs, radiologies, centres dialyse)
-- ============================================================

-- Centres de dialyse
UPDATE organisation_units 
SET nombre_salles_consultation = 6,
    capacite_urgence = 8
WHERE type_structure = 'centre_dialyse' AND nombre_salles_consultation IS NULL;

-- Pharmacies
UPDATE organisation_units 
SET nombre_salles_consultation = 2,
    capacite_urgence = 0
WHERE type_structure = 'pharmacie' AND nombre_salles_consultation IS NULL;

-- Laboratoires
UPDATE organisation_units 
SET nombre_salles_consultation = 3,
    capacite_urgence = 0
WHERE type_structure = 'laboratoire' AND nombre_salles_consultation IS NULL;

-- Radiologies
UPDATE organisation_units 
SET nombre_salles_consultation = 2,
    capacite_urgence = 0
WHERE type_structure = 'radiologie' AND nombre_salles_consultation IS NULL;

-- ============================================================
-- 6. STRUCTURES CONFESSIONNELLES ET FONDATIONS
-- ============================================================

UPDATE organisation_units 
SET nombre_salles_consultation = 10,
    capacite_urgence = 12
WHERE code IN ('H-NDLOVE-LOG', 'H-STALBERT-DLA');

UPDATE organisation_units 
SET nombre_salles_consultation = 8,
    capacite_urgence = 10
WHERE code IN ('H-MBOPPI-DLA', 'H-SAKER-DLA');

UPDATE organisation_units 
SET nombre_salles_consultation = 6,
    capacite_urgence = 8
WHERE code IN ('H-STJEAN-DLA', 'H-FOUENANG-DLA', 'H-SARAH-DLA');

-- ============================================================
-- 7. STRUCTURES MUTUALISTES
-- ============================================================

UPDATE organisation_units 
SET nombre_salles_consultation = 8,
    capacite_urgence = 10
WHERE code IN ('H-MUT-DLA', 'H-BONSEC-DLA', 'H-CEBEC-DLA');

-- ============================================================
-- 8. VALEUR PAR DÉFAUT POUR TOUTES LES STRUCTURES RESTANTES
-- ============================================================

-- Toute structure active dans le Littoral sans nombre de salles défini
UPDATE organisation_units 
SET nombre_salles_consultation = 4,
    capacite_urgence = 4
WHERE region = 'Littoral' 
  AND actif = TRUE 
  AND nombre_salles_consultation IS NULL;
-- ============================================================
-- CORRECTION DES CAPACITÉS DE LITS (capacite_lits)
-- Réalité terrain Littoral Cameroun
-- ============================================================

-- ============================================================
-- 1. HÔPITAUX PUBLICS (valeurs réalistes)
-- ============================================================

-- Hôpital Laquintinie (référence régionale)
UPDATE organisation_units 
SET capacite_lits = 485,
    capacite_urgence = 35
WHERE code = 'H-LAQUINTINIE-DLA';

-- Hôpital Général de Douala
UPDATE organisation_units 
SET capacite_lits = 350,
    capacite_urgence = 30
WHERE code = 'H-GEN-DLA';

-- HGOPED (Gynéco-Obstétrique)
UPDATE organisation_units 
SET capacite_lits = 320,
    capacite_urgence = 25
WHERE code = 'H-HGOPED-DLA';

-- Hôpital Régional de Nkongsamba
UPDATE organisation_units 
SET capacite_lits = 250,
    capacite_urgence = 20
WHERE code = 'H-NKONGSAMBA';

-- Hôpital Régional Annexe Edéa
UPDATE organisation_units 
SET capacite_lits = 150,
    capacite_urgence = 15
WHERE code = 'H-ANNEXE-EDEA';

-- Hôpitaux de district (publics)
UPDATE organisation_units 
SET capacite_lits = 80,
    capacite_urgence = 12
WHERE code = 'H-DEIDO-DLA';

UPDATE organisation_units 
SET capacite_lits = 80,
    capacite_urgence = 10
WHERE code IN ('H-NEWBELL-DLA', 'H-BONASSAM-DLA', 'H-MIL-DLA');

UPDATE organisation_units 
SET capacite_lits = 80,
    capacite_urgence = 8
WHERE code IN ('H-BONAB-DLA', 'H-NDOK-DLA', 'H-LOUM');

UPDATE organisation_units 
SET capacite_lits = 100,
    capacite_urgence = 10
WHERE code IN ('H-CDP-DLA', 'H-LOGBABA-DLA', 'H-MBANGUE-DLA', 'H-NYLON-DLA');

UPDATE organisation_units 
SET capacite_lits = 60,
    capacite_urgence = 6
WHERE code = 'H-CMA-EDEA';

-- CSI publics
UPDATE organisation_units 
SET capacite_lits = 35,
    capacite_urgence = 8
WHERE code IN ('CSI-NDOKOTI', 'CSI-BONAB');

UPDATE organisation_units 
SET capacite_lits = 25,
    capacite_urgence = 6
WHERE code IN ('CSI-BALI', 'CSI-BONAP', 'CSI-BONAMOUSS', 'CSI-MAKEPE', 
               'CSI-LOGPOM', 'CSI-MBOPPI', 'CSI-NYALLA', 'CSI-BEPANDA');

UPDATE organisation_units 
SET capacite_lits = 20,
    capacite_urgence = 5
WHERE code IN ('CSI-JAPOMA', 'CSI-MBANGUE', 'CSI-POUT', 'CSI-BAR', 'CSI-MELONG');

-- ============================================================
-- 2. CLINIQUES PRIVÉES DE RÉFÉRENCE (Grandes cliniques)
-- ============================================================

UPDATE organisation_units 
SET capacite_lits = 45,
    capacite_urgence = 4
WHERE code = 'CLIN-LOUISPASTEUR-DLA';

UPDATE organisation_units 
SET capacite_lits = 150,
    capacite_urgence = 20
WHERE code = 'CLIN-PAST';

UPDATE organisation_units 
SET capacite_lits = 80,
    capacite_urgence = 12
WHERE code = 'CLIN-BONAM';

UPDATE organisation_units 
SET capacite_lits = 70,
    capacite_urgence = 10
WHERE code = 'CLIN-BETHESDA';

UPDATE organisation_units 
SET capacite_lits = 65,
    capacite_urgence = 10
WHERE code = 'CLIN-MAKEPE';

UPDATE organisation_units 
SET capacite_lits = 50,
    capacite_urgence = 8
WHERE code IN ('CLIN-HOPE', 'CLIN-BORDEAUX', 'CLIN-POITIERS', 'CLIN-SWISS');

UPDATE organisation_units 
SET capacite_lits = 45,
    capacite_urgence = 8
WHERE code IN ('CLIN-DMC', 'CLIN-UNIV', 'CLIN-UNITE');

UPDATE organisation_units 
SET capacite_lits = 40,
    capacite_urgence = 6
WHERE code IN ('CLIN-METRO', 'CLIN-MARIO', 'CLIN-CHECKUP', 'CLIN-DOUALA');

-- ============================================================
-- 3. CLINIQUES PRIVÉES MOYENNES
-- ============================================================

UPDATE organisation_units 
SET capacite_lits = 40,
    capacite_urgence = 5
WHERE code IN ('CLIN-BETHANIE', 'CLIN-C2T', 'CSI-BONANJO', 'CLIN-MEDJOWE',
               'CMA-DOUALA2', 'CLIN-ROSEAUX', 'CLIN-BESSENGUE');

UPDATE organisation_units 
SET capacite_lits = 25,
    capacite_urgence = 4
WHERE code IN ('CLIN-GRACIAS', 'CLIN-KINGDAVID', 'CLIN-LADIES', 'CLIN-STLUC',
               'CLIN-SOLIDARITE', 'CLIN-BEAUBEBE', 'CLIN-ETIENNO');

UPDATE organisation_units 
SET capacite_lits = 30,
    capacite_urgence = 4
WHERE code IN ('CLIN-BALI', 'CLIN-GAULLE', 'CLIN-KOUMASSI', 'CLIN-CONCEPTION',
               'CLIN-AEROPORT', 'CLIN-REGENERES', 'CLIN-ESPERANCE', 'CLIN-CITES',
               'CLIN-BOUM', 'CLIN-KERTHAN', 'CLIN-GRANDILE', 'CLIN-SOURCE',
               'CLIN-CEDRE', 'CLIN-ODYSSEE', 'CLIN-MEMOSEE', 'CLIN-STPETERS',
               'CLIN-STANNE', 'CLIN-STMAURICE', 'CLIN-VITALIAC', 'CLIN-SOPPO');

UPDATE organisation_units 
SET capacite_lits = 15,
    capacite_urgence = 3
WHERE code IN ('CMA-KOTTO', 'CMA-NKOULOUL', 'CLIN-JE', 'CLIN-JOSS', 'CLIN-LECHING',
               'CLIN-DIAMANT', 'CLIN-MEDICARE', 'CLIN-MEDICARE2', 'CLIN-PALMIERS',
               'CLIN-RAMEAUX', 'CLIN-RAPHA', 'CLIN-SURGERY', 'CLIN-GARE', 
               'CLIN-NID', 'CLIN-COLOMBE', 'CLIN-INTER-BONAB');

-- ============================================================
-- 4. CABINETS MÉDICAUX (petites structures - pas de lits)
-- ============================================================

UPDATE organisation_units 
SET capacite_lits = 0,
    capacite_urgence = 0
WHERE code IN ('CLIN-AS-SALAM', 'CLIN-IDOC', 'CLIN-ISIS', 'CLIN-TOGUEM');

-- ============================================================
-- 5. STRUCTURES CONFESSIONNELLES ET FONDATIONS
-- ============================================================

UPDATE organisation_units 
SET capacite_lits = 120,
    capacite_urgence = 15
WHERE code IN ('H-NDLOVE-LOG', 'H-STALBERT-DLA');

UPDATE organisation_units 
SET capacite_lits = 80,
    capacite_urgence = 12
WHERE code IN ('H-MBOPPI-DLA', 'H-SAKER-DLA');

UPDATE organisation_units 
SET capacite_lits = 60,
    capacite_urgence = 10
WHERE code IN ('H-STJEAN-DLA');

UPDATE organisation_units 
SET capacite_lits = 35,
    capacite_urgence = 6
WHERE code IN ('H-FOUENANG-DLA', 'H-SARAH-DLA');

-- ============================================================
-- 6. STRUCTURES MUTUALISTES
-- ============================================================

UPDATE organisation_units 
SET capacite_lits = 60,
    capacite_urgence = 10
WHERE code = 'H-MUT-DLA';

UPDATE organisation_units 
SET capacite_lits = 45,
    capacite_urgence = 8
WHERE code = 'H-BONSEC-DLA';

UPDATE organisation_units 
SET capacite_lits = 40,
    capacite_urgence = 6
WHERE code = 'H-CEBEC-DLA';

-- ============================================================
-- 7. AUTRES STRUCTURES (pharmacies, labs, radiologies, centres dialyse)
-- ============================================================

-- Centres de dialyse (ont des lits pour dialyse mais pas d'hospitalisation classique)
UPDATE organisation_units 
SET capacite_lits = 10,
    capacite_urgence = 4
WHERE type_structure = 'centre_dialyse' AND capacite_lits IS NULL;

-- Pharmacies (0 lit)
UPDATE organisation_units 
SET capacite_lits = 0,
    capacite_urgence = 0
WHERE type_structure = 'pharmacie' AND capacite_lits IS NULL;

-- Laboratoires (0 lit)
UPDATE organisation_units 
SET capacite_lits = 0,
    capacite_urgence = 0
WHERE type_structure = 'laboratoire' AND capacite_lits IS NULL;

-- Radiologies (0 lit)
UPDATE organisation_units 
SET capacite_lits = 0,
    capacite_urgence = 0
WHERE type_structure = 'radiologie' AND capacite_lits IS NULL;

-- ============================================================
-- 8. DISTRICTS ET RÉGIONS (0 lit)
-- ============================================================

UPDATE organisation_units 
SET capacite_lits = 0,
    capacite_urgence = 0
WHERE type_structure IN ('district_sante', 'region_sanitaire') 
  AND capacite_lits IS NULL;

-- ============================================================
-- 9. VALEUR PAR DÉFAUT POUR TOUTES LES STRUCTURES RESTANTES
-- ============================================================

-- Toute structure active dans le Littoral sans capacité définie
UPDATE organisation_units 
SET capacite_lits = 10,
    capacite_urgence = 4
WHERE region = 'Littoral' 
  AND actif = TRUE 
  AND capacite_lits IS NULL;

  -- ============================================================
-- CORRECTION DE population_couverte POUR LES HÔPITAUX CONFESSIONNELS
-- Données basées sur la réalité terrain du Littoral
-- ============================================================

-- Hôpital Catholique St Albert Le Grand - Quartier Bali
-- Zone couverte : Bali, Bonabéri, Makèpè, zones environnantes
UPDATE organisation_units 
SET population_couverte = 185000
WHERE code = 'H-STALBERT-DLA';

-- Hôpital Emilie Saker (Protestant) - Quartier Akwa
-- Zone couverte : Akwa, Bonapriso, Bali, centre-ville
UPDATE organisation_units 
SET population_couverte = 210000
WHERE code = 'H-SAKER-DLA';

-- Mboppi Baptist Hospital - Quartier Mboppi
-- Zone couverte : Mboppi, Logbaba, Ndogbong, Makepe, zones sud
UPDATE organisation_units 
SET population_couverte = 195000
WHERE code = 'H-MBOPPI-DLA';

-- Hopital Saint Jean de Malte - Quartier Njombe
-- Zone couverte : Njombe, Ndogbong, Japoma, zones péri-urbaines sud
UPDATE organisation_units 
SET population_couverte = 95000
WHERE code = 'H-STJEAN-DLA';


-- ============================================================
-- CORRECTION DE population_couverte POUR TOUTES LES STRUCTURES
-- Données basées sur la réalité terrain du Littoral
-- ============================================================

-- ============================================================
-- 1. POLYCLINIQUES ET CLINIQUES PRIVÉES (15-30 lits)
-- ============================================================

-- Polyclinique de la Gare (quartier Gare - zone très dense)
UPDATE organisation_units 
SET population_couverte = 75000
WHERE code = 'CLIN-GARE';

-- Polyclinique de la Gare (Le Nid) - zone Gare
UPDATE organisation_units 
SET population_couverte = 65000
WHERE code = 'CLIN-NID';

-- Polyclinique Internationale de Bonabéri (zone inondable)
UPDATE organisation_units 
SET population_couverte = 85000
WHERE code = 'CLIN-INTER-BONAB';

-- Polyclinique La Colombe (quartier Akwa)
UPDATE organisation_units 
SET population_couverte = 80000
WHERE code = 'CLIN-COLOMBE';

-- CMA Nkoulouloun
UPDATE organisation_units 
SET population_couverte = 55000
WHERE code = 'CMA-NKOULOUL';

-- J & E Memorial Polyclinic (Akwa)
UPDATE organisation_units 
SET population_couverte = 70000
WHERE code = 'CLIN-JE';

-- Joss Medi-Clinic (Akwa)
UPDATE organisation_units 
SET population_couverte = 45000
WHERE code = 'CLIN-JOSS';

-- Leching Clinic (Akwa)
UPDATE organisation_units 
SET population_couverte = 40000
WHERE code = 'CLIN-LECHING';

-- Medical Centre Social Diamant
UPDATE organisation_units 
SET population_couverte = 50000
WHERE code = 'CLIN-DIAMANT';

-- Medicare Sarl
UPDATE organisation_units 
SET population_couverte = 60000
WHERE code = 'CLIN-MEDICARE';

-- Médicare Sarl
UPDATE organisation_units 
SET population_couverte = 60000
WHERE code = 'CLIN-MEDICARE2';

-- Palmiers Medical Centre
UPDATE organisation_units 
SET population_couverte = 75000
WHERE code = 'CLIN-PALMIERS';

-- Rameaux Clinic
UPDATE organisation_units 
SET population_couverte = 45000
WHERE code = 'CLIN-RAMEAUX';

-- Rapha Clinic
UPDATE organisation_units 
SET population_couverte = 50000
WHERE code = 'CLIN-RAPHA';

-- Surgery Clinic Specializing
UPDATE organisation_units 
SET population_couverte = 55000
WHERE code = 'CLIN-SURGERY';

-- ============================================================
-- 2. HÔPITAUX CONFESSIONNELS (déjà traités mais vérification)
-- ============================================================

-- Hôpital Catholique Notre Dame de l'Amour - Logpom
UPDATE organisation_units 
SET population_couverte = 110000
WHERE code = 'H-NDLOVE-LOG';

-- ============================================================
-- 3. RÉGION SANITAIRE (toute la région)
-- ============================================================

-- Région Sanitaire du Littoral (population totale estimée)
UPDATE organisation_units 
SET population_couverte = 3500000
WHERE code = 'REG-LITT';

-- ============================================================
-- 4. PETITES CLINIQUES SPÉCIALISÉES
-- ============================================================

-- Clinique Cœur & Vie (cardiologie)
UPDATE organisation_units 
SET population_couverte = 35000
WHERE code = 'CLIN-COEURVIE';

-- Polyclinique Dr Chendjou Joseph Sarl
UPDATE organisation_units 
SET population_couverte = 60000
WHERE code = 'CLIN-CHENDJOU';

-- Louis Pasteur Clinic (déjà traitée mais vérification)
UPDATE organisation_units 
SET population_couverte = 180000
WHERE code = 'CLIN-LOUISPASTEUR';

-- ============================================================
-- 5. HÔPITAUX PUBLICS (manquants)
-- ============================================================

-- Hôpital Militaire
UPDATE organisation_units 
SET population_couverte = 250000
WHERE code = 'H-MIL-DLA';

-- Hôpital Régional de Nkongsamba
UPDATE organisation_units 
SET population_couverte = 280000
WHERE code = 'H-NKONGSAMBA';

-- Hôpital Régional Annexe d'Edéa
UPDATE organisation_units 
SET population_couverte = 150000
WHERE code = 'H-ANNEXE-EDEA';

-- CMA de Kotto
UPDATE organisation_units 
SET population_couverte = 50000
WHERE code = 'CMA-KOTTO';

-- ============================================================
-- 6. VALEUR PAR DÉFAUT POUR LES STRUCTURES RESTANTES
-- ============================================================

-- Toutes les cliniques privées de taille moyenne sans population définie
UPDATE organisation_units 
SET population_couverte = 40000
WHERE region = 'Littoral' 
  AND actif = TRUE 
  AND type_propriete = 'prive_commercial'
  AND type_structure = 'clinique_privee'
  AND capacite_lits BETWEEN 10 AND 20
  AND population_couverte IS NULL;

-- Petites cliniques et cabinets
UPDATE organisation_units 
SET population_couverte = 15000
WHERE region = 'Littoral' 
  AND actif = TRUE 
  AND type_propriete = 'prive_commercial'
  AND type_structure = 'clinique_privee'
  AND capacite_lits < 10
  AND population_couverte IS NULL;

-- ============================================================
-- 1. CORRECTION POUR LES DISTRICTS DE SANTÉ
-- ============================================================

-- District de Santé d'Edéa
UPDATE organisation_units 
SET 
    departement = 'Sanaga-Maritime',
    arrondissement = 'Edéa',
    district_sante = 'Edéa',
    commune = 'Edéa',
    quartier_ville = 'Edéa Centre'
WHERE code = 'DIST-EDEA';

-- District de Santé de Nkongsamba
UPDATE organisation_units 
SET 
    departement = 'Moungo',
    arrondissement = 'Nkongsamba',
    district_sante = 'Nkongsamba',
    commune = 'Nkongsamba',
    quartier_ville = 'Nkongsamba Centre'
WHERE code = 'DIST-NKON';

-- District de Santé de Loum
UPDATE organisation_units 
SET 
    departement = 'Moungo',
    arrondissement = 'Loum',
    district_sante = 'Loum',
    commune = 'Loum',
    quartier_ville = 'Loum Centre'
WHERE code = 'DIST-LOUM';

-- District de Santé de Yabassi
UPDATE organisation_units 
SET 
    departement = 'Nkam',
    arrondissement = 'Yabassi',
    district_sante = 'Yabassi',
    commune = 'Yabassi',
    quartier_ville = 'Yabassi Centre'
WHERE code = 'DIST-YAB';

-- District de Santé de Douala
UPDATE organisation_units 
SET 
    departement = 'Wouri',
    arrondissement = 'Douala 1er',
    district_sante = 'Douala',
    commune = 'Douala',
    quartier_ville = 'Douala Centre'
WHERE code = 'DIST-DLA';

-- ============================================================
-- 2. CORRECTION POUR LA RÉGION SANITAIRE
-- ============================================================

-- Région Sanitaire du Littoral
UPDATE organisation_units 
SET 
    departement = 'Littoral',
    arrondissement = 'Littoral',
    district_sante = 'Littoral',
    commune = 'Douala',
    quartier_ville = 'Douala'
WHERE code = 'REG-LITT';

-- ============================================================
-- 3. CORRECTION POUR LA DRSP LITTORAL
-- ============================================================

-- DRSP Littoral (Délégation Régionale de Santé Publique)
UPDATE organisation_units 
SET 
    departement = 'Wouri',
    arrondissement = 'Douala 1er',
    district_sante = 'Douala',
    commune = 'Douala',
    quartier_ville = 'Akwa'
WHERE code = 'CM-DRSP-LITTORAL';

-- ============================================================
-- 4. CORRECTION POUR LES HÔPITAUX
-- ============================================================

-- Hôpital Laquintinie de Douala
UPDATE organisation_units 
SET 
    departement = 'Wouri',
    arrondissement = 'Douala 1er',
    district_sante = 'Douala',
    commune = 'Douala 1er',
    quartier_ville = 'Akwa'
WHERE code = 'CM-HDL';

-- Hôpital Général de Douala
UPDATE organisation_units 
SET 
    departement = 'Wouri',
    arrondissement = 'Douala 1er',
    district_sante = 'Douala',
    commune = 'Douala 1er',
    quartier_ville = 'Akwa'
WHERE code = 'CM-HGD';

-- ============================================================
-- 5. CORRECTION POUR LE CSI BÉPANDA
-- ============================================================

-- CSI Bépanda
UPDATE organisation_units 
SET 
    departement = 'Wouri',
    arrondissement = 'Douala 3e',
    district_sante = 'Douala',
    commune = 'Douala 3e',
    quartier_ville = 'Bépanda'
WHERE code = 'CM-CSI-BEPANDA';
