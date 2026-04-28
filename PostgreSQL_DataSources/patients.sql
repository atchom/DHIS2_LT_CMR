-- ============================================================
-- INSERTION DES PATIENTS - LITTORAL CAMEROUN
-- Population réaliste pour le système de santé
-- ============================================================

-- ============================================================
-- PATIENTS DU DISTRICT DOUALA 1 (id_org_unit = 1)
-- ============================================================

INSERT INTO patients (code_patient, nin, date_naissance, age_ans, sexe, region, departement, arrondissement, commune, quartier, adresse_detail, profession, statut_socio_pro, niveau_education, mutuelle, numero_mutuelle, type_prise_charge_defaut, id_org_unit_attachement, maladies_chroniques, allergies, groupe_sanguin, coord_domicile, zone_residence, distance_csi_km, statut_vital, metadata) VALUES
-- Quartier Ndogbong
('PAT-NDO-001', '1234567890123', '1985-03-15', 41, 'M', 'Littoral', 'Wouri', 'Douala 1', 'Douala', 'NDOKOTI', 'Rue Ndogbong, près du marché', 'Commerçant', 'COMMERCANT', 'Secondaire', 'CNPS', 'CNPS987654', 'CNPS', 1, ARRAY['HTA'], NULL, 'A+', ST_SetSRID(ST_MakePoint(9.735, 4.051), 4326), 'URBAIN_DENSE', 1.2, TRUE, '{"fumeur": false, "diabete_familial": true}'::jsonb),
('PAT-NDO-002', '9876543210987', '1990-07-22', 35, 'F', 'Littoral', 'Wouri', 'Douala 1', 'Douala', 'NDOKOTI', 'Derrière l''église', 'Enseignante', 'FONCTIONNAIRE', 'Universitaire', 'MUTUELLE', 'MUT456789', 'MUTUELLE', 1, NULL, ARRAY['Pénicilline'], 'O+', ST_SetSRID(ST_MakePoint(9.738, 4.053), 4326), 'URBAIN_DENSE', 0.8, TRUE, '{"profession": "professeur"}'::jsonb),
('PAT-NDO-003', '4567890123456', '2020-01-10', 6, 'M', 'Littoral', 'Wouri', 'Douala 1', 'Douala', 'NDOKOTI', 'Rue des écoles', NULL, NULL, 'Primaire', NULL, NULL, 'ETAT', 1, NULL, NULL, 'B+', ST_SetSRID(ST_MakePoint(9.732, 4.048), 4326), 'URBAIN_DENSE', 1.5, TRUE, '{"vaccins_a_jour": true}'::jsonb),
('PAT-NDO-004', '5678901234567', '1975-12-05', 50, 'F', 'Littoral', 'Wouri', 'Douala 1', 'Douala', 'NDOKOTI', 'Camp Ndogbong', 'Ménagère', 'MENAGERE', 'Primaire', NULL, NULL, 'GRATUIT', 1, ARRAY['Diabète type 2'], ARRAY['Aspirine'], 'AB+', ST_SetSRID(ST_MakePoint(9.740, 4.055), 4326), 'URBAIN_DENSE', 2.0, TRUE, '{"observations": "Patient suivie en diabétologie"}'::jsonb),

-- Quartier Bonabéri
('PAT-BON-005', '6789012345678', '2005-09-18', 20, 'F', 'Littoral', 'Wouri', 'Douala 5', 'Douala', 'BONABERI', 'Zone industrielle', 'Ouvrière', 'OUVRIER', 'Secondaire', 'CNPS', 'CNPS123456', 'CNPS', 1, NULL, NULL, 'O-', ST_SetSRID(ST_MakePoint(9.652, 4.087), 4326), 'PERI_URBAIN', 3.5, TRUE, NULL),
('PAT-BON-006', '7890123456789', '1995-03-27', 31, 'M', 'Littoral', 'Wouri', 'Douala 5', 'Douala', 'BONABERI', 'Quartier portuaire', 'Travailleur portuaire', 'PORTUAIRE', 'Secondaire', 'CNPS', 'CNPS789012', 'CNPS', 1, NULL, NULL, 'A-', ST_SetSRID(ST_MakePoint(9.655, 4.085), 4326), 'PERI_URBAIN', 2.8, TRUE, '{"poste": "docker"}'::jsonb),
('PAT-BON-007', '8901234567890', '2018-11-30', 7, 'M', 'Littoral', 'Wouri', 'Douala 5', 'Douala', 'BONABERI', 'Cité Bonabéri', NULL, NULL, 'Maternel', NULL, NULL, 'ETAT', 1, ARRAY['Asthme infantile'], NULL, 'A+', ST_SetSRID(ST_MakePoint(9.648, 4.090), 4326), 'PERI_URBAIN', 4.0, TRUE, '{"asma_declencheurs": "poussiere"}'::jsonb),

-- Quartier Makepe
('PAT-MAK-008', '9012345678901', '1988-06-12', 37, 'F', 'Littoral', 'Wouri', 'Douala 4', 'Douala', 'MAKEPE', 'Rue des palmiers', 'Infirmière', 'FONCTIONNAIRE', 'Universitaire', 'MUTUELLE', 'MUT987654', 'MUTUELLE', 1, NULL, ARRAY['Latex'], 'B+', ST_SetSRID(ST_MakePoint(9.700, 4.060), 4326), 'URBAIN', 0.5, TRUE, '{"personnel_soignant": true}'::jsonb),
('PAT-MAK-009', '0123456789012', '1960-04-08', 66, 'M', 'Littoral', 'Wouri', 'Douala 4', 'Douala', 'MAKEPE', 'Quartier résidentiel', 'Retraité', 'RETRAITE', 'Universitaire', 'CNPS', 'CNPS456789', 'CNPS', 1, ARRAY['HTA', 'Diabète', 'Arthrose'], ARRAY['Ibuprofène'], 'AB-', ST_SetSRID(ST_MakePoint(9.705, 4.065), 4326), 'URBAIN', 1.0, TRUE, '{"ancien_fonctionnaire": true}'::jsonb),

-- Quartier Deido
('PAT-DEI-010', '1234509876543', '1998-12-25', 27, 'M', 'Littoral', 'Wouri', 'Douala 2', 'Douala', 'DEIDO', 'Rue de la pêche', 'Pêcheur', 'POISSONNERIE', 'Primaire', NULL, NULL, 'AIDE', 1, NULL, NULL, 'O+', ST_SetSRID(ST_MakePoint(9.720, 4.045), 4326), 'LAGUNAIRE', 1.8, TRUE, '{"exposition": "milieu lagunaire"}'::jsonb),
('PAT-DEI-011', '2345610987654', '2000-08-14', 25, 'F', 'Littoral', 'Wouri', 'Douala 2', 'Douala', 'DEIDO', 'Marché Deido', 'Poissonnière', 'POISSONNERIE', 'Primaire', NULL, NULL, 'GRATUIT', 1, NULL, ARRAY['Crustacés'], 'B-', ST_SetSRID(ST_MakePoint(9.718, 4.043), 4326), 'LAGUNAIRE', 2.0, TRUE, NULL),

-- Quartier Bépanda
('PAT-BEP-012', '3456721098765', '1992-09-30', 33, 'M', 'Littoral', 'Wouri', 'Douala 3', 'Douala', 'BEPANDA', 'Zone inondable', 'Sans emploi', 'SANS_EMPLOI', 'Primaire', NULL, NULL, 'ETAT', 1, ARRAY['VIH'], NULL, 'A+', ST_SetSRID(ST_MakePoint(9.680, 4.040), 4326), 'INONDABLE', 1.5, TRUE, '{"arv": true, "date_debut_traitement": "2020-03-15"}'::jsonb),

-- Quartier Akwa
('PAT-AKW-013', '4567832109876', '1970-02-20', 56, 'F', 'Littoral', 'Wouri', 'Douala 1', 'Douala', 'AKWA', 'Avenue de Gaulle', 'Commerçante', 'COMMERCANT', 'Secondaire', 'PRIVE', 'ASS123456', 'PRIVE', 1, ARRAY['HTA'], ARRAY['Codéine'], 'A+', ST_SetSRID(ST_MakePoint(9.705, 4.045), 4326), 'URBAIN_DENSE', 0.3, TRUE, '{"commerce": "habillement"}'::jsonb),

-- Quartier Cité SIC
('PAT-SIC-014', '5678943210987', '2015-05-17', 11, 'M', 'Littoral', 'Wouri', 'Douala 2', 'Douala', 'CITE_SIC', 'Cité SIC', 'Élève', 'ETUDIANT', 'Primaire', NULL, NULL, 'FAMILLE', 1, NULL, NULL, 'O+', ST_SetSRID(ST_MakePoint(9.745, 4.058), 4326), 'URBAIN', 1.2, TRUE, NULL),

-- Quartier Ndogbong (supplément)
('PAT-NDO-015', '6789054321098', '1982-11-11', 43, 'F', 'Littoral', 'Wouri', 'Douala 1', 'Douala', 'NDOKOTI', 'Rue des commerces', 'Boutiquière', 'COMMERCANT', 'Secondaire', NULL, NULL, 'PRIVE', 1, NULL, NULL, 'B+', ST_SetSRID(ST_MakePoint(9.736, 4.052), 4326), 'URBAIN_DENSE', 1.0, TRUE, NULL);

-- ============================================================
-- PATIENTS HÔPITAL LAQUINTINIE (id_org_unit = 2)
-- ============================================================

INSERT INTO patients (code_patient, nin, date_naissance, age_ans, sexe, region, departement, arrondissement, commune, quartier, adresse_detail, profession, statut_socio_pro, niveau_education, mutuelle, numero_mutuelle, type_prise_charge_defaut, id_org_unit_attachement, maladies_chroniques, allergies, groupe_sanguin, coord_domicile, zone_residence, distance_csi_km, statut_vital, metadata) VALUES
('PAT-LAQ-016', '7890165432109', '2023-01-15', 3, 'F', 'Littoral', 'Wouri', 'Douala 1', 'Douala', 'BONANJO', 'Rue Joss', NULL, NULL, NULL, NULL, NULL, 'ETAT', 2, NULL, NULL, 'A+', ST_SetSRID(ST_MakePoint(9.708, 4.042), 4326), 'URBAIN_DENSE', 0.5, TRUE, NULL),
('PAT-LAQ-017', '8901276543210', '1978-06-23', 47, 'M', 'Littoral', 'Wouri', 'Douala 1', 'Douala', 'BONAPRISO', 'Boulevard de la Liberté', 'Médecin', 'PROF_LIBERALE', 'Doctorat', 'ASSURANCE_PRIVEE', 'AXA789456', 'ASSURANCE_PRIVEE', 2, NULL, NULL, 'AB+', ST_SetSRID(ST_MakePoint(9.710, 4.048), 4326), 'URBAIN_DENSE', 0.8, TRUE, '{"specialite": "cardiologue"}'::jsonb),
('PAT-LAQ-018', '9012387654321', '1995-09-09', 30, 'F', 'Littoral', 'Wouri', 'Douala 3', 'Douala', 'DEIDO', 'Rue de la paix', 'Chauffeuse taxi', 'TRANSPORTEUR', 'Secondaire', NULL, NULL, 'PRIVE', 2, NULL, NULL, 'O-', ST_SetSRID(ST_MakePoint(9.722, 4.043), 4326), 'URBAIN', 2.5, TRUE, '{"vehicule": "taxi"}'::jsonb),
('PAT-LAQ-019', '0123498765432', '1965-03-03', 61, 'M', 'Littoral', 'Wouri', 'Douala 4', 'Douala', 'LOGBABA', 'Quartier industriel', 'Ouvrier retraité', 'RETRAITE', 'Primaire', 'CNPS', 'CNPS111222', 'CNPS', 2, ARRAY['BPCO', 'Diabète'], NULL, 'B+', ST_SetSRID(ST_MakePoint(9.695, 4.038), 4326), 'INDUSTRIELLE', 3.0, TRUE, NULL),

-- Cas VIH suivi à Laquintinie
('PAT-LAQ-020', '1234987654321', '1990-04-18', 36, 'F', 'Littoral', 'Wouri', 'Douala 3', 'Douala', 'MAKEPE', NULL, 'Ménagère', 'MENAGERE', 'Primaire', NULL, NULL, 'ETAT', 2, ARRAY['VIH'], NULL, 'A-', ST_SetSRID(ST_MakePoint(9.702, 4.062), 4326), 'URBAIN', 1.2, TRUE, '{"arv": "TLD", "cd4": 450, "charge_virale": "indetectable"}'::jsonb);

-- ============================================================
-- PATIENTS HÔPITAL GÉNÉRAL (id_org_unit = 3)
-- ============================================================

INSERT INTO patients (code_patient, nin, date_naissance, age_ans, sexe, region, departement, arrondissement, commune, quartier, adresse_detail, profession, statut_socio_pro, niveau_education, mutuelle, numero_mutuelle, type_prise_charge_defaut, id_org_unit_attachement, maladies_chroniques, allergies, groupe_sanguin, coord_domicile, zone_residence, distance_csi_km, statut_vital, metadata) VALUES
('PAT-HGD-021', '2345098765432', '2010-07-07', 15, 'M', 'Littoral', 'Wouri', 'Douala 2', 'Douala', 'BALI', 'Rue des écoliers', 'Élève', 'ETUDIANT', 'Secondaire', 'FAMILLE', 'FAM123789', 'FAMILLE', 3, NULL, ARRAY['Arachide'], 'O+', ST_SetSRID(ST_MakePoint(9.728, 4.050), 4326), 'URBAIN', 1.5, TRUE, NULL),
('PAT-HGD-022', '3456210987654', '1987-12-12', 38, 'M', 'Littoral', 'Wouri', 'Douala 2', 'Douala', 'BONAMOUSSADI', 'Rue des ambassades', 'Architecte', 'PROF_LIBERALE', 'Doctorat', 'ASSURANCE_PRIVEE', 'ALLIANZ456', 'ASSURANCE_PRIVEE', 3, NULL, NULL, 'AB-', ST_SetSRID(ST_MakePoint(9.742, 4.065), 4326), 'URBAIN_DENSE', 0.5, TRUE, NULL),
('PAT-HGD-023', '4567321098765', '1945-08-20', 80, 'F', 'Littoral', 'Wouri', 'Douala 1', 'Douala', 'AKWA', 'Rue Koloko', 'Retraitée', 'RETRAITE', 'Primaire', 'CNPS_CATEG', 'CNPS555666', 'CNPS_CATEG', 3, ARRAY['HTA', 'Démence'], ARRAY['Paracétamol'], 'A+', ST_SetSRID(ST_MakePoint(9.706, 4.044), 4326), 'URBAIN_DENSE', 0.3, TRUE, '{"aide_menagere": true}'::jsonb),
('PAT-HGD-024', '5678432109876', '1998-02-28', 28, 'F', 'Littoral', 'Wouri', 'Douala 5', 'Douala', 'BONABERI', 'Zone portuaire', 'Manutentionnaire', 'OUVRIER', 'Primaire', NULL, NULL, 'ETAT', 3, NULL, NULL, 'B-', ST_SetSRID(ST_MakePoint(9.658, 4.088), 4326), 'PORTUAIRE_RISQUE', 4.0, TRUE, NULL),

-- Patient décédé
('PAT-HGD-025', '6789543210987', '1970-06-15', 55, 'M', 'Littoral', 'Wouri', 'Douala 4', 'Douala', 'MAKEPE', NULL, 'Chauffeur', 'TRANSPORTEUR', 'Secondaire', NULL, NULL, 'ETAT', 3, ARRAY['HTA', 'Cardiopathie'], NULL, 'A+', ST_SetSRID(ST_MakePoint(9.704, 4.063), 4326), 'URBAIN', 1.0, FALSE, '{"date_deces": "2025-03-20", "cause_deces": "AVC"}'::jsonb);

-- ============================================================
-- PATIENTS DISTRICT NKONGSAMBA (id_org_unit = 4)
-- ============================================================

INSERT INTO patients (code_patient, nin, date_naissance, age_ans, sexe, region, departement, arrondissement, commune, quartier, adresse_detail, profession, statut_socio_pro, niveau_education, mutuelle, numero_mutuelle, type_prise_charge_defaut, id_org_unit_attachement, maladies_chroniques, allergies, groupe_sanguin, coord_domicile, zone_residence, distance_csi_km, statut_vital, metadata) VALUES
('PAT-NKO-026', '7890654321098', '1980-09-09', 45, 'F', 'Littoral', 'Moungo', 'Nkongsamba', 'Nkongsamba', 'NKO-01', 'Centre ville', 'Commerçante', 'COMMERCANT', 'Secondaire', 'MUTUELLE', 'MUT888999', 'MUTUELLE', 4, NULL, NULL, 'O+', ST_SetSRID(ST_MakePoint(9.935, 4.950), 4326), 'URBAIN', 1.0, TRUE, NULL),
('PAT-NKO-027', '8901765432109', '2019-11-11', 6, 'M', 'Littoral', 'Moungo', 'Nkongsamba', 'Nkongsamba', 'NKO-02', NULL, NULL, NULL, NULL, NULL, NULL, 'ETAT', 4, ARRAY['Malnutrition'], NULL, 'A+', ST_SetSRID(ST_MakePoint(9.938, 4.952), 4326), 'URBAIN', 2.0, TRUE, '{"peso": 12, "PB": 12.5}'::jsonb),
('PAT-NKO-028', '9012876543210', '1975-04-04', 51, 'M', 'Littoral', 'Moungo', 'Manjo', 'Manjo', 'MAN-01', 'Plantation', 'Agriculteur', 'ARTISAN', 'Primaire', NULL, NULL, 'ETAT', 4, ARRAY['Paludisme récurrent'], ARRAY['Quinine'], 'B+', ST_SetSRID(ST_MakePoint(9.810, 4.850), 4326), 'RURAL', 15.0, TRUE, '{"exposition": "zone rizicole"}'::jsonb);

-- ============================================================
-- PATIENTS DISTRICT EDÉA (id_org_unit = 5)
-- ============================================================

INSERT INTO patients (code_patient, nin, date_naissance, age_ans, sexe, region, departement, arrondissement, commune, quartier, adresse_detail, profession, statut_socio_pro, niveau_education, mutuelle, numero_mutuelle, type_prise_charge_defaut, id_org_unit_attachement, maladies_chroniques, allergies, groupe_sanguin, coord_domicile, zone_residence, distance_csi_km, statut_vital, metadata) VALUES
('PAT-EDE-029', '0123987654321', '1992-06-06', 33, 'M', 'Littoral', 'Sanaga-Maritime', 'Edéa', 'Edéa', 'EDA-01', 'Zone industrielle Edéa', 'Ouvrier ALUCAM', 'OUVRIER', 'Secondaire', 'CNPS', 'CNPS333444', 'CNPS', 5, ARRAY['Asthme professionnel'], NULL, 'O-', ST_SetSRID(ST_MakePoint(10.135, 4.050), 4326), 'INDUSTRIELLE', 3.0, TRUE, '{"entreprise": "ALUCAM"}'::jsonb),
('PAT-EDE-030', '1234098765432', '2000-10-10', 25, 'F', 'Littoral', 'Sanaga-Maritime', 'Edéa', 'Edéa', 'EDA-02', 'Camp des pêcheurs', 'Pêcheuse', 'POISSONNERIE', 'Primaire', NULL, NULL, 'AIDE', 5, NULL, ARRAY['Poisson'], 'B+', ST_SetSRID(ST_MakePoint(10.128, 4.045), 4326), 'LAGUNAIRE_RISQUE', 4.0, TRUE, NULL),
('PAT-EDE-031', '2345109876543', '1988-03-03', 38, 'F', 'Littoral', 'Sanaga-Maritime', 'Edéa', 'Edéa', 'EDA-03', NULL, 'Vendeuse', 'COMMERCANT', 'Secondaire', NULL, NULL, 'PRIVE', 5, NULL, NULL, 'A+', ST_SetSRID(ST_MakePoint(10.132, 4.048), 4326), 'URBAIN', 1.5, TRUE, NULL);

-- ============================================================
-- PATIENTS SUPPLÉMENTAIRES - ZONES À RISQUE SPÉCIFIQUE
-- ============================================================

INSERT INTO patients (code_patient, nin, date_naissance, age_ans, sexe, region, departement, arrondissement, commune, quartier, adresse_detail, profession, statut_socio_pro, niveau_education, mutuelle, numero_mutuelle, type_prise_charge_defaut, id_org_unit_attachement, maladies_chroniques, allergies, groupe_sanguin, coord_domicile, zone_residence, distance_csi_km, statut_vital, metadata) VALUES
-- Zone portuaire - risque spécifique
('PAT-POR-032', '3456219876543', '1995-01-15', 31, 'M', 'Littoral', 'Wouri', 'Douala 5', 'Douala', 'BONABERI', 'Zone portuaire', 'Douanier', 'SECURITE', 'Universitaire', 'ETAT', 'ETAT123456', 'ETAT', 1, NULL, NULL, 'AB+', ST_SetSRID(ST_MakePoint(9.660, 4.080), 4326), 'PORTUAIRE_RISQUE', 3.5, TRUE, '{"exposition": "marchandises variees"}'::jsonb),

-- Zone inondable - paludisme
('PAT-ZIN-033', '4567321987654', '2021-07-20', 4, 'F', 'Littoral', 'Wouri', 'Douala 3', 'Douala', 'BEPANDA', 'Zone basse', NULL, NULL, NULL, NULL, NULL, 'ETAT', 1, ARRAY['Anémie'], NULL, 'O+', ST_SetSRID(ST_MakePoint(9.682, 4.038), 4326), 'INONDABLE', 2.0, TRUE, '{"paludisme_frequence": "mensuel"}'::jsonb),

-- Zone industrielle - pollution
('PAT-ZIN-034', '5678432198765', '1987-11-25', 38, 'M', 'Littoral', 'Wouri', 'Douala 4', 'Douala', 'LOGBABA', 'Zone industrielle Bassa', 'Ouvrier chimiste', 'OUVRIER', 'Secondaire', 'CNPS', 'CNPS777888', 'CNPS', 1, ARRAY['BPCO', 'Asthme'], ARRAY['Chlore'], 'A-', ST_SetSRID(ST_MakePoint(9.690, 4.035), 4326), 'INDUSTRIELLE', 2.5, TRUE, '{"exposition": "produits_chimiques"}'::jsonb);

-- ============================================================
-- MISE À JOUR DE L'ÂGE POUR LES PATIENTS SANS DATE DE NAISSANCE
-- ============================================================

UPDATE patients SET age_ans = DATE_PART('year', AGE(date_naissance)) WHERE age_ans IS NULL AND date_naissance IS NOT NULL;

-- ============================================================
-- MISE À JOUR DES ZONES DE RÉSIDENCE BASÉE SUR LE QUARTIER
-- ============================================================
select * from patients
UPDATE patients SET zone_residence = 'URBAIN_DENSE' WHERE quartier IN ('AKWA', 'BONANJO', 'BONAPRISO', 'CITE_SIC');
UPDATE patients SET zone_residence = 'INONDABLE' WHERE quartier = 'BEPANDA';
UPDATE patients SET zone_residence = 'LAGUNAIRE' WHERE quartier IN ('DEIDO', 'NDOKOTI');
UPDATE patients SET zone_residence = 'PERI_URBAIN' WHERE quartier = 'BONABERI';
UPDATE patients SET zone_residence = 'RURAL' WHERE id_org_unit_attachement = 4 AND zone_residence IS NULL;

-- ============================================================
-- INSERTIONS COMPLÉMENTAIRES POUR LE LITTORAL
-- ============================================================

-- 1. Ajout des catégories manquantes pour socio_pro
INSERT INTO category_options (code, nom, type_categorie, ordre) VALUES
('SAGE_FEMME', 'Sage-femme', 'socio_pro', 14),
('AGENT_ENTRETIEN', 'Agent d''entretien', 'socio_pro', 15),
('GARDIEN', 'Gardien', 'socio_pro', 16),
('COUTURIER', 'Couturier', 'socio_pro', 17),
('MECANICIEN', 'Mécanicien', 'socio_pro', 18),
('PLOMBIER', 'Plombier/Cimentier', 'socio_pro', 19),
('BURALISTE', 'Buraliste', 'socio_pro', 20)
ON CONFLICT (code) DO NOTHING;

-- 2. Ajout des zones géographiques manquantes
INSERT INTO category_options (code, nom, type_categorie, ordre) VALUES
('DOUALA_1', 'Douala 1 (Ndogbong/PK9)', 'zone_geo', 10),
('DOUALA_2', 'Douala 2 (Deido/Bonabéri)', 'zone_geo', 11),
('DOUALA_3', 'Douala 3 (Makepe/Bépanda)', 'zone_geo', 12),
('DOUALA_4', 'Douala 4 (Logbaba/Japoma)', 'zone_geo', 13),
('DOUALA_5', 'Douala 5 (PK10/PK14)', 'zone_geo', 14),
('NKAM', 'Département Nkam (Yabassi)', 'zone_geo', 15),
('SANAGA_MARITIME', 'Département Sanaga-Maritime', 'zone_geo', 16)
ON CONFLICT (code) DO NOTHING;

-- 3. Ajout des quartiers manquants
INSERT INTO category_options (code, nom, type_categorie, ordre) VALUES
('JAPOMA', 'Japoma', 'quartier', 24),
('KOTTO', 'Kotto', 'quartier', 25),
('NYALLA', 'Nyalla', 'quartier', 26),
('LOGPOM', 'Logpom', 'quartier', 27),
('BONAMOUSSADI', 'Bonamoussadi', 'quartier', 28),
('PK9', 'PK9', 'quartier', 29),
('PK10', 'PK10', 'quartier', 30),
('PK14', 'PK14', 'quartier', 31)
ON CONFLICT (code) DO NOTHING;

-- 4. Patients supplémentaires - Quartiers Est de Douala
INSERT INTO patients (code_patient, nin, date_naissance, age_ans, sexe, region, departement, arrondissement, commune, quartier, adresse_detail, profession, statut_socio_pro, niveau_education, mutuelle, numero_mutuelle, type_prise_charge_defaut, id_org_unit_attachement, maladies_chroniques, allergies, groupe_sanguin, zone_residence, distance_csi_km, statut_vital, metadata) VALUES
('PAT-JAP-035', '6789654321098', '1993-05-20', 33, 'M', 'Littoral', 'Wouri', 'Douala 4', 'Douala', 'JAPOMA', 'Zone industrielle', 'Mécanicien', 'MECANICIEN', 'Secondaire', NULL, NULL, 'PRIVE', 1, NULL, NULL, 'O+', 'URBAIN', 8.5, TRUE, NULL),
('PAT-KOT-036', '7890765432109', '1985-08-14', 40, 'F', 'Littoral', 'Wouri', 'Douala 4', 'Douala', 'KOTTO', 'Rue des commerces', 'Buraliste', 'BURALISTE', 'Secondaire', NULL, NULL, 'PRIVE', 1, NULL, NULL, 'B+', 'URBAIN', 6.0, TRUE, NULL),
('PAT-NYA-037', '8901876543210', '2022-02-10', 4, 'M', 'Littoral', 'Wouri', 'Douala 4', 'Douala', 'NYALLA', 'Quartier populaire', NULL, NULL, NULL, NULL, NULL, 'ETAT', 1, NULL, NULL, 'A+', 'URBAIN', 4.5, TRUE, '{"vaccins": "BCG+Penta1+Penta2"}'::jsonb),
('PAT-LOG-038', '9012987654321', '1978-11-30', 47, 'M', 'Littoral', 'Wouri', 'Douala 4', 'Douala', 'LOGPOM', 'Près du fleuve', 'Pêcheur', 'POISSONNERIE', 'Primaire', NULL, NULL, 'AIDE', 1, NULL, ARRAY['Moustiques'], 'O-', 'LAGUNAIRE', 3.0, TRUE, NULL),
('PAT-BON-039', '0123098765432', '1998-03-25', 28, 'F', 'Littoral', 'Wouri', 'Douala 5', 'Douala', 'BONAMOUSSADI', 'Rue résidentielle', 'Sage-femme', 'SAGE_FEMME', 'Universitaire', 'MUTUELLE', 'MUT456123', 'MUTUELLE', 2, NULL, NULL, 'AB+', 'URBAIN_DENSE', 1.0, TRUE, '{"structure": "mat_Laquintinie"}'::jsonb);

-- 5. Patients zone rurale - Moungo (Nkongsamba, Manjo, Mbanga)
INSERT INTO patients (code_patient, nin, date_naissance, age_ans, sexe, region, departement, arrondissement, commune, quartier, adresse_detail, profession, statut_socio_pro, niveau_education, mutuelle, numero_mutuelle, type_prise_charge_defaut, id_org_unit_attachement, maladies_chroniques, allergies, groupe_sanguin, zone_residence, distance_csi_km, statut_vital, metadata) VALUES
('PAT-MOU-040', '1234109876543', '1982-07-12', 43, 'F', 'Littoral', 'Moungo', 'Manjo', 'Manjo', 'MANJO-01', 'Plantation banane', 'Agricultrice', 'ARTISAN', 'Primaire', NULL, NULL, 'GRATUIT', 4, ARRAY['Paludisme'], NULL, 'A+', 'RURAL', 12.0, TRUE, NULL),
('PAT-MOU-041', '2345210987654', '2019-09-05', 6, 'M', 'Littoral', 'Moungo', 'Mbanga', 'Mbanga', 'MBANGA-01', NULL, NULL, NULL, 'Maternel', NULL, NULL, 'ETAT', 4, ARRAY['Malnutrition modérée'], NULL, 'O+', 'RURAL', 8.0, TRUE, '{"PB": 12.2}'::jsonb),
('PAT-MOU-042', '3456321098765', '1970-12-18', 55, 'M', 'Littoral', 'Moungo', 'Nkongsamba', 'Nkongsamba', 'NKO-03', 'Centre ville', 'Plombier', 'PLOMBIER', 'Secondaire', 'CNPS', 'CNPS444555', 'CNPS', 4, ARRAY['Rhumatisme'], ARRAY['Diclofenac'], 'B-', 'URBAIN', 1.2, TRUE, NULL),
('PAT-MOU-043', '4567432109876', '1995-04-22', 31, 'F', 'Littoral', 'Moungo', 'Manjo', 'Manjo', 'MANJO-02', 'Boutique centre ville', 'Couturière', 'COUTURIER', 'Secondaire', NULL, NULL, 'PRIVE', 4, NULL, NULL, 'AB-', 'URBAIN', 1.5, TRUE, NULL);

-- 6. Patients zone rurale - Nkam (Yabassi)
INSERT INTO patients (code_patient, nin, date_naissance, age_ans, sexe, region, departement, arrondissement, commune, quartier, adresse_detail, profession, statut_socio_pro, niveau_education, mutuelle, numero_mutuelle, type_prise_charge_defaut, id_org_unit_attachement, maladies_chroniques, allergies, groupe_sanguin, zone_residence, distance_csi_km, statut_vital, metadata) VALUES
('PAT-NKA-044', '5678543210987', '1988-02-28', 38, 'M', 'Littoral', 'Nkam', 'Yabassi', 'Yabassi', 'YAB-01', 'Bord de route', 'Chauffeur', 'TRANSPORTEUR', 'Primaire', NULL, NULL, 'ETAT', 1, NULL, NULL, 'O+', 'RURAL', 25.0, TRUE, '{"axe": "Douala-Yabassi"}'::jsonb),
('PAT-NKA-045', '6789654321099', '2000-08-15', 25, 'F', 'Littoral', 'Nkam', 'Nkondjock', 'Nkondjock', 'NKO-04', 'Marché central', 'Vendeuse', 'COMMERCANT', 'Primaire', NULL, NULL, 'AIDE', 1, NULL, NULL, 'B+', 'RURAL', 30.0, TRUE, NULL);

-- 7. Femmes enceintes (suivi maternité)
INSERT INTO patients (code_patient, nin, date_naissance, age_ans, sexe, region, departement, arrondissement, commune, quartier, adresse_detail, profession, statut_socio_pro, niveau_education, mutuelle, numero_mutuelle, type_prise_charge_defaut, id_org_unit_attachement, maladies_chroniques, allergies, groupe_sanguin, zone_residence, distance_csi_km, statut_vital, metadata) VALUES
('PAT-MAT-046', '7890765432110', '1996-06-10', 29, 'F', 'Littoral', 'Wouri', 'Douala 1', 'Douala', 'NDOKOTI', 'Rue des femmes', 'Ménagère', 'MENAGERE', 'Primaire', NULL, NULL, 'ETAT', 1, NULL, NULL, 'A+', 'URBAIN_DENSE', 1.0, TRUE, '{"gestite": 3, "parite": 2, "DDR": "2025-10-15", "terme": 32, "cpn": 3}'::jsonb),
('PAT-MAT-047', '8901876543211', '1993-03-18', 33, 'F', 'Littoral', 'Wouri', 'Douala 3', 'Douala', 'MAKEPE', NULL, 'Secrétaire', 'FONCTIONNAIRE', 'Universitaire', 'CNPS', 'CNPS999000', 'CNPS', 2, NULL, NULL, 'O+', 'URBAIN', 0.8, TRUE, '{"gestite": 1, "parite": 0, "DDR": "2025-12-20", "terme": 24, "cpn": 2}'::jsonb),
('PAT-MAT-048', '9012987654322', '2000-01-25', 26, 'F', 'Littoral', 'Wouri', 'Douala 5', 'Douala', 'BONABERI', 'Zone portuaire', 'Poissonnière', 'POISSONNERIE', 'Primaire', NULL, NULL, 'ETAT', 3, ARRAY['Anémie'], NULL, 'B-', 'PERI_URBAIN', 3.0, TRUE, '{"gestite": 2, "parite": 1, "DDR": "2026-01-05", "terme": 20, "cpn": 1, "hemoglobine": 9.5}'::jsonb);

-- 8. Enfants 0-5 ans (PEV)
INSERT INTO patients (code_patient, nin, date_naissance, age_ans, sexe, region, departement, arrondissement, commune, quartier, adresse_detail, profession, statut_socio_pro, niveau_education, mutuelle, numero_mutuelle, type_prise_charge_defaut, id_org_unit_attachement, maladies_chroniques, allergies, groupe_sanguin, zone_residence, distance_csi_km, statut_vital, metadata) VALUES
('PAT-PEV-049', '0123098765433', '2025-06-20', 0, 'M', 'Littoral', 'Wouri', 'Douala 1', 'Douala', 'AKWA', 'Avenue de Gaulle', NULL, NULL, NULL, NULL, NULL, 'FAMILLE', 1, NULL, NULL, 'O+', 'URBAIN_DENSE', 0.5, TRUE, '{"vaccins": "BCG+0"}'::jsonb),
('PAT-PEV-050', '1234109876544', '2024-10-12', 1, 'F', 'Littoral', 'Wouri', 'Douala 4', 'Douala', 'LOGBABA', NULL, NULL, NULL, NULL, NULL, NULL, 'ETAT', 2, NULL, ARRAY['Oeuf'], 'A-', 'INDUSTRIELLE', 2.0, TRUE, '{"vaccins": "BCG+Penta1+Penta2", "carnet": "A1234"}'::jsonb),
('PAT-PEV-051', '2345210987655', '2023-12-05', 2, 'M', 'Littoral', 'Moungo', 'Nkongsamba', 'Nkongsamba', 'NKO-04', 'Quartier populaire', NULL, NULL, NULL, NULL, NULL, 'AIDE', 4, NULL, NULL, 'B+', 'URBAIN', 1.5, TRUE, '{"vaccins": "BCG+Penta1+Penta2+Penta3+VAR", "carnet_complet": true}'::jsonb);

-- ============================================================
-- AJOUT DE 100 PATIENTS SUPPLÉMENTAIRES POUR LE LITTORAL
-- Répartition géographique et socio-démographique réaliste
-- ============================================================

-- ============================================================
-- PATIENTS ZONE URBAINE DENSE - DOUALA CENTRE (Akwa, Bonanjo, Bonapriso)
INSERT INTO patients (code_patient, nin, date_naissance, age_ans, sexe, region, departement, arrondissement, commune, quartier, adresse_detail, profession, statut_socio_pro, niveau_education, mutuelle, numero_mutuelle, type_prise_charge_defaut, id_org_unit_attachement, maladies_chroniques, allergies, groupe_sanguin, zone_residence, distance_csi_km, statut_vital, metadata) VALUES
('PAT-URB-052', '3456321987654', '1975-03-20', 51, 'M', 'Littoral', 'Wouri', 'Douala 1', 'Douala', 'AKWA', 'Rue Koloko', 'Avocat', 'PROF_LIBERALE', 'Doctorat', 'ASSURANCE_PRIVEE', 'AXA123789', 'ASSURANCE_PRIVEE', 2, ARRAY['HTA'], NULL, 'A+', 'URBAIN_DENSE', 0.3, TRUE, NULL),
('PAT-URB-053', '4567432098765', '1982-07-15', 43, 'F', 'Littoral', 'Wouri', 'Douala 1', 'Douala', 'BONANJO', 'Rue Joss', 'Banquière', 'FONCTIONNAIRE', 'Universitaire', 'CNPS', 'CNPS111333', 'CNPS', 2, NULL, NULL, 'O+', 'URBAIN_DENSE', 0.5, TRUE, NULL),
('PAT-URB-054', '5678543109876', '1990-11-05', 35, 'M', 'Littoral', 'Wouri', 'Douala 1', 'Douala', 'BONAPRISO', 'Boulevard de la Liberté', 'Commercial', 'COMMERCANT', 'Universitaire', 'PRIVE', 'PRIV123456', 'PRIVE', 3, NULL, ARRAY['Arachide'], 'B+', 'URBAIN_DENSE', 0.4, TRUE, NULL),
('PAT-URB-055', '6789654210987', '1988-04-18', 38, 'F', 'Littoral', 'Wouri', 'Douala 1', 'Douala', 'AKWA', 'Rue Prince', 'Pharmacienne', 'PROF_LIBERALE', 'Doctorat', 'MUTUELLE', 'MUT789123', 'MUTUELLE', 2, NULL, NULL, 'AB+', 'URBAIN_DENSE', 0.2, TRUE, '{"personnel_soignant": true}'::jsonb),
('PAT-URB-056', '7890765321098', '2001-09-22', 24, 'F', 'Littoral', 'Wouri', 'Douala 1', 'Douala', 'BONANJO', 'Rue des palmiers', 'Étudiante', 'ETUDIANT', 'Universitaire', 'FAMILLE', 'FAM789456', 'FAMILLE', 3, NULL, NULL, 'A-', 'URBAIN_DENSE', 0.6, TRUE, NULL),
('PAT-URB-057', '8901876432109', '1995-12-12', 30, 'M', 'Littoral', 'Wouri', 'Douala 1', 'Douala', 'BONAPRISO', 'Avenue Manga Ndoumbe', 'Ingénieur', 'PROF_LIBERALE', 'Doctorat', 'ASSURANCE_PRIVEE', 'ALLIANZ789', 'ASSURANCE_PRIVEE', 2, NULL, NULL, 'O-', 'URBAIN_DENSE', 0.3, TRUE, NULL),
('PAT-URB-058', '9012987543210', '1968-06-28', 57, 'M', 'Littoral', 'Wouri', 'Douala 1', 'Douala', 'AKWA', 'Marché central', 'Commerçant', 'COMMERCANT', 'Secondaire', NULL, NULL, 'PRIVE', 1, ARRAY['Diabète'], NULL, 'B-', 'URBAIN_DENSE', 0.5, TRUE, NULL),
('PAT-URB-059', '0123098654321', '1985-02-14', 41, 'F', 'Littoral', 'Wouri', 'Douala 1', 'Douala', 'BONANJO', 'Rue de l''hôpital', 'Infirmière', 'FONCTIONNAIRE', 'Universitaire', 'CNPS', 'CNPS222444', 'CNPS', 2, NULL, ARRAY['Latex'], 'A+', 'URBAIN_DENSE', 0.2, TRUE, '{"personnel_soignant": true}'::jsonb);

-- ============================================================
-- PATIENTS ZONE NDOGBONG / PK9 (District Douala 1)
-- ============================================================

INSERT INTO patients (code_patient, nin, date_naissance, age_ans, sexe, region, departement, arrondissement, commune, quartier, adresse_detail, profession, statut_socio_pro, niveau_education, mutuelle, numero_mutuelle, type_prise_charge_defaut, id_org_unit_attachement, maladies_chroniques, allergies, groupe_sanguin, zone_residence, distance_csi_km, statut_vital, metadata) VALUES
('PAT-NDO-060', '1234109765432', '1992-08-21', 33, 'M', 'Littoral', 'Wouri', 'Douala 1', 'Douala', 'NDOKOTI', 'Rue des commerces', 'Boulanger', 'ARTISAN', 'Primaire', NULL, NULL, 'PRIVE', 1, NULL, NULL, 'O+', 'URBAIN_DENSE', 1.0, TRUE, NULL),
('PAT-NDO-061', '2345210876543', '1978-03-30', 48, 'F', 'Littoral', 'Wouri', 'Douala 1', 'Douala', 'NDOKOTI', 'Camp des femmes', 'Couturière', 'COUTURIER', 'Secondaire', NULL, NULL, 'ETAT', 1, NULL, NULL, 'B+', 'URBAIN_DENSE', 1.2, TRUE, NULL),
('PAT-NDO-062', '3456321987655', '2005-10-10', 20, 'M', 'Littoral', 'Wouri', 'Douala 1', 'Douala', 'NDOKOTI', 'Rue des écoles', 'Étudiant', 'ETUDIANT', 'Secondaire', 'MUTUELLE', 'MUT456789', 'MUTUELLE', 1, NULL, NULL, 'A-', 'URBAIN_DENSE', 0.8, TRUE, NULL),
('PAT-NDO-063', '4567432098766', '1983-11-19', 42, 'M', 'Littoral', 'Wouri', 'Douala 1', 'Douala', 'PK9', 'Zone PK9', 'Mécanicien', 'MECANICIEN', 'Primaire', NULL, NULL, 'PRIVE', 1, ARRAY['Asthme'], NULL, 'O-', 'PERI_URBAIN', 2.0, TRUE, NULL),
('PAT-NDO-064', '5678543109877', '1997-05-06', 28, 'F', 'Littoral', 'Wouri', 'Douala 1', 'Douala', 'PK9', 'Quartier populaire', 'Vendeuse', 'COMMERCANT', 'Secondaire', NULL, NULL, 'GRATUIT', 1, NULL, NULL, 'AB+', 'PERI_URBAIN', 1.8, TRUE, NULL),
('PAT-NDO-065', '6789654210988', '1970-12-15', 55, 'M', 'Littoral', 'Wouri', 'Douala 1', 'Douala', 'NDOKOTI', 'Rue des sables', 'Gardien', 'GARDIEN', 'Primaire', NULL, NULL, 'ETAT', 1, ARRAY['HTA'], NULL, 'B-', 'URBAIN_DENSE', 1.5, TRUE, NULL),
('PAT-NDO-066', '7890765321099', '1993-03-08', 33, 'F', 'Littoral', 'Wouri', 'Douala 1', 'Douala', 'PK9', 'Rue du marché', 'Coiffeuse', 'ARTISAN', 'Primaire', NULL, NULL, 'PRIVE', 1, NULL, ARRAY['Teinture'], 'A+', 'PERI_URBAIN', 2.2, TRUE, NULL),
('PAT-NDO-067', '8901876432110', '2015-07-17', 10, 'M', 'Littoral', 'Wouri', 'Douala 1', 'Douala', 'NDOKOTI', 'Rue des enfants', 'Élève', 'ETUDIANT', 'Primaire', NULL, NULL, 'FAMILLE', 1, NULL, NULL, 'O+', 'URBAIN_DENSE', 1.0, TRUE, NULL);

-- ============================================================
-- PATIENTS ZONE BONABÉRI / PORTUAIRE
-- ============================================================

INSERT INTO patients (code_patient, nin, date_naissance, age_ans, sexe, region, departement, arrondissement, commune, quartier, adresse_detail, profession, statut_socio_pro, niveau_education, mutuelle, numero_mutuelle, type_prise_charge_defaut, id_org_unit_attachement, maladies_chroniques, allergies, groupe_sanguin, zone_residence, distance_csi_km, statut_vital, metadata) VALUES
('PAT-BON-068', '9012987654323', '1989-09-25', 36, 'M', 'Littoral', 'Wouri', 'Douala 5', 'Douala', 'BONABERI', 'Quartier portuaire', 'Docker', 'PORTUAIRE', 'Primaire', 'CNPS', 'CNPS555777', 'CNPS', 1, NULL, NULL, 'O+', 'PORTUAIRE_RISQUE', 3.0, TRUE, NULL),
('PAT-BON-069', '0123098765434', '1998-04-12', 27, 'M', 'Littoral', 'Wouri', 'Douala 5', 'Douala', 'BONABERI', 'Zone industrielle', 'Ouvrier', 'OUVRIER', 'Secondaire', NULL, NULL, 'ETAT', 1, NULL, ARRAY['Poussière'], 'B+', 'INDUSTRIELLE', 2.5, TRUE, NULL),
('PAT-BON-070', '1234109876545', '1985-06-18', 40, 'F', 'Littoral', 'Wouri', 'Douala 5', 'Douala', 'BONABERI', 'Camp des femmes', 'Boutiquière', 'COMMERCANT', 'Secondaire', NULL, NULL, 'PRIVE', 1, NULL, NULL, 'A-', 'PERI_URBAIN', 2.8, TRUE, NULL),
('PAT-BON-071', '2345210987656', '1995-11-03', 30, 'M', 'Littoral', 'Wouri', 'Douala 5', 'Douala', 'BONABERI', 'Rue des douanes', 'Douanier', 'SECURITE', 'Universitaire', 'ETAT', 'ETAT789123', 'ETAT', 1, NULL, NULL, 'AB-', 'PORTUAIRE_RISQUE', 2.0, TRUE, NULL),
('PAT-BON-072', '3456321098766', '2000-02-28', 26, 'F', 'Littoral', 'Wouri', 'Douala 5', 'Douala', 'BONABERI', 'Marché de Bonabéri', 'Poissonnière', 'POISSONNERIE', 'Primaire', NULL, NULL, 'AIDE', 1, NULL, ARRAY['Crustacés'], 'O-', 'PERI_URBAIN', 3.0, TRUE, NULL);

-- ============================================================
-- PATIENTS ZONE BÉPANDA / INONDABLE
-- ============================================================

INSERT INTO patients (code_patient, nin, date_naissance, age_ans, sexe, region, departement, arrondissement, commune, quartier, adresse_detail, profession, statut_socio_pro, niveau_education, mutuelle, numero_mutuelle, type_prise_charge_defaut, id_org_unit_attachement, maladies_chroniques, allergies, groupe_sanguin, zone_residence, distance_csi_km, statut_vital, metadata) VALUES
('PAT-BEP-073', '4567432109877', '1987-10-14', 38, 'M', 'Littoral', 'Wouri', 'Douala 3', 'Douala', 'BEPANDA', 'Zone basse', 'Plombier', 'PLOMBIER', 'Primaire', NULL, NULL, 'ETAT', 1, ARRAY['Paludisme récurrent'], NULL, 'B+', 'INONDABLE', 1.5, TRUE, NULL),
('PAT-BEP-074', '5678543210988', '1992-03-22', 34, 'F', 'Littoral', 'Wouri', 'Douala 3', 'Douala', 'BEPANDA', 'Rue des inondations', 'Ménagère', 'MENAGERE', 'Primaire', NULL, NULL, 'GRATUIT', 1, NULL, NULL, 'A+', 'INONDABLE', 1.8, TRUE, NULL),
('PAT-BEP-075', '6789654321090', '1975-08-09', 50, 'M', 'Littoral', 'Wouri', 'Douala 3', 'Douala', 'BEPANDA', 'Quartier populaire', 'Chauffeur', 'TRANSPORTEUR', 'Secondaire', NULL, NULL, 'PRIVE', 1, ARRAY['HTA', 'Diabète'], NULL, 'O+', 'INONDABLE', 2.0, TRUE, NULL),
('PAT-BEP-076', '7890765432100', '2019-12-19', 6, 'F', 'Littoral', 'Wouri', 'Douala 3', 'Douala', 'BEPANDA', 'Rue des écoliers', NULL, NULL, 'Maternel', NULL, NULL, 'ETAT', 1, ARRAY['Malnutrition'], NULL, 'B-', 'INONDABLE', 1.2, TRUE, '{"PB": 11.5, "MAS": true}'::jsonb),
('PAT-BEP-077', '89018765432100', '1998-05-30', 27, 'F', 'Littoral', 'Wouri', 'Douala 3', 'Douala', 'BEPANDA', 'Marché Bépanda', 'Vendeuse', 'COMMERCANT', 'Primaire', NULL, NULL, 'ETAT', 1, NULL, NULL, 'AB+', 'INONDABLE', 1.0, TRUE, NULL);

-- ============================================================
-- PATIENTS ZONE MAKEPE / BONAMOUSSADI
-- ============================================================

INSERT INTO patients (code_patient, nin, date_naissance, age_ans, sexe, region, departement, arrondissement, commune, quartier, adresse_detail, profession, statut_socio_pro, niveau_education, mutuelle, numero_mutuelle, type_prise_charge_defaut, id_org_unit_attachement, maladies_chroniques, allergies, groupe_sanguin, zone_residence, distance_csi_km, statut_vital, metadata) VALUES
('PAT-MAK-078', '9012987654324', '1983-04-05', 43, 'F', 'Littoral', 'Wouri', 'Douala 4', 'Douala', 'MAKEPE', 'Rue des palmiers', 'Agent de santé', 'FONCTIONNAIRE', 'Universitaire', 'MUTUELLE', 'MUT123789', 'MUTUELLE', 2, NULL, NULL, 'O+', 'URBAIN', 0.5, TRUE, '{"personnel_soignant": true}'::jsonb),
('PAT-MAK-079', '0123098765435', '1990-07-26', 35, 'M', 'Littoral', 'Wouri', 'Douala 4', 'Douala', 'MAKEPE', 'Rue résidentielle', 'Enseignant', 'FONCTIONNAIRE', 'Universitaire', 'CNPS', 'CNPS888999', 'CNPS', 2, NULL, NULL, 'A-', 'URBAIN', 0.8, TRUE, NULL),
('PAT-MAK-080', '1234109876546', '2002-09-15', 23, 'F', 'Littoral', 'Wouri', 'Douala 4', 'Douala', 'BONAMOUSSADI', 'Cité des ambassades', 'Étudiante', 'ETUDIANT', 'Universitaire', 'FAMILLE', 'FAM456789', 'FAMILLE', 3, NULL, ARRAY['Pollen'], 'B+', 'URBAIN_DENSE', 0.3, TRUE, NULL),
('PAT-MAK-081', '2345210987657', '1978-01-31', 48, 'M', 'Littoral', 'Wouri', 'Douala 4', 'Douala', 'BONAMOUSSADI', 'Avenue des fleurs', 'Architecte', 'PROF_LIBERALE', 'Doctorat', 'ASSURANCE_PRIVEE', 'AXA456789', 'ASSURANCE_PRIVEE', 3, ARRAY['HTA'], NULL, 'AB-', 'URBAIN_DENSE', 0.5, TRUE, NULL),
('PAT-MAK-082', '3456321098767', '1995-12-01', 30, 'F', 'Littoral', 'Wouri', 'Douala 4', 'Douala', 'MAKEPE', 'Quartier résidentiel', 'Esthéticienne', 'ARTISAN', 'Secondaire', NULL, NULL, 'PRIVE', 2, NULL, NULL, 'O-', 'URBAIN', 0.6, TRUE, NULL);

-- ============================================================
-- PATIENTS ZONE DEIDO / LOGPOM / LAGUNAIRE
-- ============================================================

INSERT INTO patients (code_patient, nin, date_naissance, age_ans, sexe, region, departement, arrondissement, commune, quartier, adresse_detail, profession, statut_socio_pro, niveau_education, mutuelle, numero_mutuelle, type_prise_charge_defaut, id_org_unit_attachement, maladies_chroniques, allergies, groupe_sanguin, zone_residence, distance_csi_km, statut_vital, metadata) VALUES
('PAT-DEI-083', '4567432109878', '1986-06-17', 39, 'M', 'Littoral', 'Wouri', 'Douala 2', 'Douala', 'DEIDO', 'Bord du fleuve', 'Pêcheur', 'POISSONNERIE', 'Primaire', NULL, NULL, 'AIDE', 1, NULL, ARRAY['Poisson'], 'B-', 'LAGUNAIRE', 1.5, TRUE, NULL),
('PAT-DEI-084', '5678543210989', '1993-09-09', 32, 'F', 'Littoral', 'Wouri', 'Douala 2', 'Douala', 'DEIDO', 'Marché Deido', 'Poissonnière', 'POISSONNERIE', 'Primaire', NULL, NULL, 'ETAT', 1, NULL, NULL, 'A+', 'LAGUNAIRE', 1.2, TRUE, NULL),
('PAT-DEI-085', '6789654321100', '2005-02-20', 21, 'M', 'Littoral', 'Wouri', 'Douala 2', 'Douala', 'LOGPOM', 'Zone lagunaire', 'Pêcheur', 'POISSONNERIE', 'Primaire', NULL, NULL, 'GRATUIT', 1, NULL, NULL, 'O+', 'LAGUNAIRE', 2.0, TRUE, NULL),
('PAT-DEI-086', '7890765432111', '1980-11-28', 45, 'F', 'Littoral', 'Wouri', 'Douala 2', 'Douala', 'DEIDO', 'Camp des femmes', 'Transformatrice de poisson', 'ARTISAN', 'Primaire', NULL, NULL, 'AIDE', 1, NULL, NULL, 'AB+', 'LAGUNAIRE', 1.3, TRUE, NULL);

-- ============================================================
-- PATIENTS ZONE LOGPOM / JAPOMA / KOTTO
-- ============================================================

INSERT INTO patients (code_patient, nin, date_naissance, age_ans, sexe, region, departement, arrondissement, commune, quartier, adresse_detail, profession, statut_socio_pro, niveau_education, mutuelle, numero_mutuelle, type_prise_charge_defaut, id_org_unit_attachement, maladies_chroniques, allergies, groupe_sanguin, zone_residence, distance_csi_km, statut_vital, metadata) VALUES
('PAT-LOG-087', '8901876543212', '1988-12-13', 37, 'M', 'Littoral', 'Wouri', 'Douala 4', 'Douala', 'LOGBABA', 'Zone industrielle', 'Ouvrier', 'OUVRIER', 'Secondaire', 'CNPS', 'CNPS321654', 'CNPS', 1, ARRAY['BPCO'], NULL, 'B+', 'INDUSTRIELLE', 2.5, TRUE, NULL),
('PAT-LOG-088', '9012987654325', '1996-04-08', 30, 'F', 'Littoral', 'Wouri', 'Douala 4', 'Douala', 'LOGBABA', 'Rue des usines', 'Agent de nettoyage', 'AGENT_ENTRETIEN', 'Primaire', NULL, NULL, 'ETAT', 1, NULL, ARRAY['Chlore'], 'A-', 'INDUSTRIELLE', 2.0, TRUE, NULL),
('PAT-JAP-089', '0123098765436', '1999-08-19', 26, 'M', 'Littoral', 'Wouri', 'Douala 4', 'Douala', 'JAPOMA', 'Zone industrielle', 'Mécanicien', 'MECANICIEN', 'Secondaire', NULL, NULL, 'PRIVE', 1, NULL, NULL, 'O-', 'INDUSTRIELLE', 5.0, TRUE, NULL),
('PAT-KOT-090', '1234109876547', '1991-03-25', 35, 'F', 'Littoral', 'Wouri', 'Douala 4', 'Douala', 'KOTTO', 'Rue des commerces', 'Buraliste', 'BURALISTE', 'Secondaire', NULL, NULL, 'PRIVE', 1, NULL, NULL, 'AB-', 'URBAIN', 4.0, TRUE, NULL);

-- ============================================================
-- PATIENTS ZONE RURALE - MOUNGO (complet)
-- ============================================================

INSERT INTO patients (code_patient, nin, date_naissance, age_ans, sexe, region, departement, arrondissement, commune, quartier, adresse_detail, profession, statut_socio_pro, niveau_education, mutuelle, numero_mutuelle, type_prise_charge_defaut, id_org_unit_attachement, maladies_chroniques, allergies, groupe_sanguin, zone_residence, distance_csi_km, statut_vital, metadata) VALUES
('PAT-MOU-091', '2345210987658', '1972-05-12', 53, 'M', 'Littoral', 'Moungo', 'Nkongsamba', 'Nkongsamba', 'NKO-05', 'Plantation café', 'Agriculteur', 'ARTISAN', 'Primaire', NULL, NULL, 'ETAT', 4, ARRAY['HTA'], NULL, 'A+', 'RURAL', 10.0, TRUE, NULL),
('PAT-MOU-092', '3456321098768', '1984-10-30', 41, 'F', 'Littoral', 'Moungo', 'Manjo', 'Manjo', 'MANJO-03', 'Marché centrale', 'Commerçante', 'COMMERCANT', 'Secondaire', NULL, NULL, 'PRIVE', 4, NULL, NULL, 'O+', 'URBAIN', 2.0, TRUE, NULL),
('PAT-MOU-093', '4567432109879', '1997-02-14', 29, 'M', 'Littoral', 'Moungo', 'Mbanga', 'Mbanga', 'MBANGA-02', 'Rue principale', 'Chauffeur taxi', 'TRANSPORTEUR', 'Secondaire', NULL, NULL, 'ETAT', 4, NULL, NULL, 'B-', 'URBAIN', 1.5, TRUE, NULL),
('PAT-MOU-094', '5678543210990', '2004-07-22', 21, 'F', 'Littoral', 'Moungo', 'Nkongsamba', 'Nkongsamba', 'NKO-06', 'Quartier universitaire', 'Étudiante', 'ETUDIANT', 'Universitaire', 'MUTUELLE', 'MUT951753', 'MUTUELLE', 4, NULL, NULL, 'AB+', 'URBAIN', 1.0, TRUE, NULL),
('PAT-MOU-095', '6789654321101', '1977-09-03', 48, 'M', 'Littoral', 'Moungo', 'Manjo', 'Manjo', 'MANJO-04', 'Zone rurale', 'Cultivateur', 'ARTISAN', 'Primaire', NULL, NULL, 'GRATUIT', 4, ARRAY['Paludisme'], ARRAY['Quinine'], 'O-', 'RURAL', 15.0, TRUE, NULL),
('PAT-MOU-096', '7890765432112', '1990-01-27', 36, 'F', 'Littoral', 'Moungo', 'Mbanga', 'Loum', 'LOUM-01', 'Marché', 'Vendeuse', 'COMMERCANT', 'Secondaire', NULL, NULL, 'PRIVE', 4, NULL, NULL, 'A-', 'URBAIN', 3.0, TRUE, NULL);

-- ============================================================
-- PATIENTS ZONE RURALE - NKAM (Yabassi, Nkondjock)
-- ============================================================

INSERT INTO patients (code_patient, nin, date_naissance, age_ans, sexe, region, departement, arrondissement, commune, quartier, adresse_detail, profession, statut_socio_pro, niveau_education, mutuelle, numero_mutuelle, type_prise_charge_defaut, id_org_unit_attachement, maladies_chroniques, allergies, groupe_sanguin, zone_residence, distance_csi_km, statut_vital, metadata) VALUES
('PAT-NKA-097', '8901876543213', '1980-11-11', 45, 'M', 'Littoral', 'Nkam', 'Yabassi', 'Yabassi', 'YAB-02', 'Centre village', 'Boucher', 'ARTISAN', 'Primaire', NULL, NULL, 'ETAT', 1, NULL, NULL, 'B+', 'RURAL', 20.0, TRUE, NULL),
('PAT-NKA-098', '9012987654326', '1992-08-08', 33, 'F', 'Littoral', 'Nkam', 'Nkondjock', 'Nkondjock', 'NKO-07', 'Marché', 'Couturière', 'COUTURIER', 'Primaire', NULL, NULL, 'AIDE', 1, NULL, NULL, 'O+', 'RURAL', 25.0, TRUE, NULL),
('PAT-NKA-099', '0123098765437', '2000-12-25', 25, 'M', 'Littoral', 'Nkam', 'Yabassi', 'Yabassi', 'YAB-03', 'Bord de route', 'Mécanicien', 'MECANICIEN', 'Secondaire', NULL, NULL, 'PRIVE', 1, NULL, NULL, 'A+', 'RURAL', 18.0, TRUE, NULL);

-- ============================================================
-- PATIENTS ZONE RURALE - SANAGA-MARITIME (Edéa, Dizangué)
-- ============================================================
-- ============================================================
-- PATIENTS SUPPLÉMENTAIRES - ENFANTS 0-5 ANS (PEV)
-- ============================================================

INSERT INTO patients (code_patient, nin, date_naissance, age_ans, sexe, region, departement, arrondissement, commune, quartier, adresse_detail, profession, statut_socio_pro, niveau_education, mutuelle, numero_mutuelle, type_prise_charge_defaut, id_org_unit_attachement, maladies_chroniques, allergies, groupe_sanguin, zone_residence, distance_csi_km, statut_vital, metadata) VALUES
('PAT-PEV-103', '4567432109880', '2024-03-10', 2, 'F', 'Littoral', 'Wouri', 'Douala 1', 'Douala', 'AKWA', 'Rue des mamans', NULL, NULL, NULL, NULL, NULL, 'FAMILLE', 2, NULL, NULL, 'O+', 'URBAIN_DENSE', 0.5, TRUE, '{"vaccins": "BCG+Penta1+Penta2+Penta3+VAR"}'::jsonb),
('PAT-PEV-104', '5678543210991', '2025-01-15', 1, 'M', 'Littoral', 'Wouri', 'Douala 3', 'Douala', 'BEPANDA', 'Zone inondable', NULL, NULL, NULL, NULL, NULL, 'ETAT', 1, NULL, NULL, 'B+', 'INONDABLE', 1.5, TRUE, '{"vaccins": "BCG+Penta1+Penta2"}'::jsonb),
('PAT-PEV-105', '6789654321102', '2023-08-22', 2, 'M', 'Littoral', 'Wouri', 'Douala 5', 'Douala', 'BONABERI', 'Zone portuaire', NULL, NULL, NULL, NULL, NULL, 'ETAT', 1, ARRAY['Anémie'], NULL, 'A-', 'PERI_URBAIN', 3.0, TRUE, '{"hemoglobine": 9.8}'::jsonb),
('PAT-PEV-106', '7890765432113', '2024-11-07', 1, 'F', 'Littoral', 'Moungo', 'Nkongsamba', 'Nkongsamba', 'NKO-08', 'Centre ville', NULL, NULL, NULL, NULL, NULL, 'AIDE', 4, NULL, NULL, 'O-', 'URBAIN', 1.0, TRUE, '{"vaccins": "BCG+Penta1"}'::jsonb);

-- ============================================================
-- PATIENTS SUPPLÉMENTAIRES - FEMMES ENCEINTES
-- ============================================================

INSERT INTO patients (code_patient, nin, date_naissance, age_ans, sexe, region, departement, arrondissement, commune, quartier, adresse_detail, profession, statut_socio_pro, niveau_education, mutuelle, numero_mutuelle, type_prise_charge_defaut, id_org_unit_attachement, maladies_chroniques, allergies, groupe_sanguin, zone_residence, distance_csi_km, statut_vital, metadata) VALUES
('PAT-MAT-107', '8901876543214', '1994-07-29', 31, 'F', 'Littoral', 'Wouri', 'Douala 2', 'Douala', 'DEIDO', 'Zone lagunaire', 'Pêcheuse', 'POISSONNERIE', 'Primaire', NULL, NULL, 'ETAT', 1, NULL, NULL, 'B-', 'LAGUNAIRE', 1.5, TRUE, '{"gestite": 4, "parite": 3, "DDR": "2025-11-10", "terme": 28, "cpn": 2}'::jsonb),
('PAT-MAT-108', '9012987654327', '1998-05-21', 27, 'F', 'Littoral', 'Wouri', 'Douala 4', 'Douala', 'MAKEPE', 'Rue des palmiers', 'Agent commercial', 'FONCTIONNAIRE', 'Universitaire', 'CNPS', 'CNPS369258', 'CNPS', 2, NULL, NULL, 'A+', 'URBAIN', 0.8, TRUE, '{"gestite": 2, "parite": 1, "DDR": "2026-01-15", "terme": 18, "cpn": 3}'::jsonb),
('PAT-MAT-109', '0123098765438', '1990-11-20', 35, 'F', 'Littoral', 'Wouri', 'Douala 1', 'Douala', 'NDOKOTI', 'Marché central', 'Commerçante', 'COMMERCANT', 'Secondaire', NULL, NULL, 'PRIVE', 1, ARRAY['Anémie drépanocytaire'], NULL, 'AS', 'URBAIN_DENSE', 1.0, TRUE, '{"gestite": 3, "parite": 2, "DDR": "2025-09-10", "terme": 34, "cpn": 4, "hemoglobine": 8.5}'::jsonb);

-- ============================================================
-- PATIENTS SUPPLÉMENTAIRES - PERSONNES ÂGÉES (60+)
-- ============================================================

INSERT INTO patients (code_patient, nin, date_naissance, age_ans, sexe, region, departement, arrondissement, commune, quartier, adresse_detail, profession, statut_socio_pro, niveau_education, mutuelle, numero_mutuelle, type_prise_charge_defaut, id_org_unit_attachement, maladies_chroniques, allergies, groupe_sanguin, zone_residence, distance_csi_km, statut_vital, metadata) VALUES
('PAT-SEN-110', '1234109876549', '1952-04-11', 74, 'M', 'Littoral', 'Wouri', 'Douala 1', 'Douala', 'AKWA', 'Vieux quartier', 'Retraité', 'RETRAITE', 'Secondaire', 'CNPS_CATEG', 'CNPS741852', 'CNPS_CATEG', 2, ARRAY['HTA', 'Diabète', 'Arthrose'], ARRAY['AINS'], 'A+', 'URBAIN_DENSE', 0.5, TRUE, NULL),
('PAT-SEN-111', '2345210987660', '1958-09-23', 67, 'F', 'Littoral', 'Wouri', 'Douala 3', 'Douala', 'BEPANDA', 'Zone inondable', 'Ménagère', 'MENAGERE', 'Primaire', NULL, NULL, 'GRATUIT', 1, ARRAY['HTA', 'Insuffisance cardiaque'], NULL, 'O-', 'INONDABLE', 2.0, TRUE, NULL),
('PAT-SEN-112', '3456321098770', '1955-12-05', 70, 'M', 'Littoral', 'Moungo', 'Nkongsamba', 'Nkongsamba', 'NKO-09', 'Centre ville', 'Retraité', 'RETRAITE', 'Secondaire', 'CNPS', 'CNPS951753', 'CNPS', 4, ARRAY['BPCO', 'HTA'], NULL, 'B+', 'URBAIN', 1.2, TRUE, NULL);

-- ============================================================
-- MISE À JOUR DE L'ÂGE POUR LES PATIENTS SANS DATE DE NAISSANCE
-- ============================================================

UPDATE patients SET age_ans = DATE_PART('year', AGE(date_naissance)) WHERE age_ans IS NULL AND date_naissance IS NOT NULL;

-- ============================================================
-- MISE À JOUR DES ZONES DE RÉSIDENCE
-- ============================================================

UPDATE patients SET zone_residence = 'URBAIN_DENSE' WHERE quartier IN ('AKWA', 'BONANJO', 'BONAPRISO', 'CITE_SIC', 'BONAMOUSSADI');
UPDATE patients SET zone_residence = 'INONDABLE' WHERE quartier IN ('BEPANDA');
UPDATE patients SET zone_residence = 'LAGUNAIRE' WHERE quartier IN ('DEIDO', 'LOGPOM');
UPDATE patients SET zone_residence = 'PERI_URBAIN' WHERE quartier IN ('BONABERI', 'PK9', 'PK10');
UPDATE patients SET zone_residence = 'INDUSTRIELLE' WHERE quartier IN ('LOGBABA', 'JAPOMA');
UPDATE patients SET zone_residence = 'PORTUAIRE_RISQUE' WHERE quartier = 'BONABERI' AND profession IN ('Travailleur portuaire', 'Docker', 'Douanier');
UPDATE patients SET zone_residence = 'LAGUNAIRE_RISQUE' WHERE departement = 'Sanaga-Maritime' AND (profession = 'Pêcheur' OR profession = 'Pêcheuse');
UPDATE patients SET zone_residence = 'RURAL' WHERE zone_residence IS NULL AND departement IN ('Nkam', 'Sanaga-Maritime', 'Moungo');



-- 1. MALADIES CHRONIQUES PAR ZONE GÉOGRAPHIQUE

-- Zone INONDABLE (Bépanda) - Forte prévalence paludisme, choléra, maladies hydriques
UPDATE patients 
SET maladies_chroniques = ARRAY['Paludisme récurrent', 'Anémie']
WHERE zone_residence = 'INONDABLE' 
  AND maladies_chroniques IS NULL 
  AND age_ans BETWEEN 0 AND 15;

UPDATE patients 
SET maladies_chroniques = ARRAY['Paludisme récurrent', 'HTA']
WHERE zone_residence = 'INONDABLE' 
  AND maladies_chroniques IS NULL 
  AND age_ans BETWEEN 30 AND 60;

UPDATE patients 
SET maladies_chroniques = ARRAY['Paludisme récurrent', 'HTA', 'Diabète']
WHERE zone_residence = 'INONDABLE' 
  AND maladies_chroniques IS NULL 
  AND age_ans > 60;

-- Zone LAGUNAIRE (Deido, Ndogbong, Logpom) - Paludisme, bilharziose, HTA
UPDATE patients 
SET maladies_chroniques = ARRAY['Paludisme récurrent']
WHERE zone_residence = 'LAGUNAIRE' 
  AND maladies_chroniques IS NULL 
  AND age_ans BETWEEN 0 AND 18;

UPDATE patients 
SET maladies_chroniques = ARRAY['Paludisme récurrent', 'HTA']
WHERE zone_residence = 'LAGUNAIRE' 
  AND maladies_chroniques IS NULL 
  AND age_ans BETWEEN 19 AND 50;

UPDATE patients 
SET maladies_chroniques = ARRAY['Paludisme récurrent', 'HTA', 'Diabète']
WHERE zone_residence = 'LAGUNAIRE' 
  AND maladies_chroniques IS NULL 
  AND age_ans > 50;

-- Zone INDUSTRIELLE (Logbaba, Japoma) - BPCO, asthme, maladies respiratoires
UPDATE patients 
SET maladies_chroniques = ARRAY['Asthme professionnel', 'BPCO']
WHERE zone_residence = 'INDUSTRIELLE' 
  AND maladies_chroniques IS NULL 
  AND profession IN ('Ouvrier', 'Ouvrier chimiste', 'Mécanicien', 'Ouvrière', 'Manutentionnaire');

UPDATE patients 
SET maladies_chroniques = ARRAY['BPCO', 'Cardiopathie']
WHERE zone_residence = 'INDUSTRIELLE' 
  AND maladies_chroniques IS NULL 
  AND age_ans > 50;

UPDATE patients 
SET maladies_chroniques = ARRAY['Asthme allergique']
WHERE zone_residence = 'INDUSTRIELLE' 
  AND maladies_chroniques IS NULL 
  AND age_ans BETWEEN 0 AND 18;

-- Zone PORTUAIRE RISQUE (Bonabéri) - Paludisme, MST/VIH, HTA
UPDATE patients 
SET maladies_chroniques = ARRAY['Paludisme', 'HTA']
WHERE zone_residence = 'PORTUAIRE_RISQUE' 
  AND maladies_chroniques IS NULL 
  AND age_ans > 40;

UPDATE patients 
SET maladies_chroniques = ARRAY['VIH']
WHERE zone_residence = 'PORTUAIRE_RISQUE' 
  AND maladies_chroniques IS NULL 
  AND profession IN ('Travailleur portuaire', 'Docker', 'Douanier')
  AND age_ans BETWEEN 25 AND 45;

-- Zone LAGUNAIRE RISQUE (Edéa, pêcheurs) - Bilharziose, paludisme
UPDATE patients 
SET maladies_chroniques = ARRAY['Bilharziose', 'Paludisme récurrent']
WHERE zone_residence = 'LAGUNAIRE_RISQUE' 
  AND maladies_chroniques IS NULL 
  AND profession IN ('Pêcheur', 'Pêcheuse', 'Poissonnière');

-- Zone RURALE (Moungo, Nkam) - Paludisme, malnutrition, HTA
UPDATE patients 
SET maladies_chroniques = ARRAY['Paludisme récurrent', 'Malnutrition']
WHERE zone_residence = 'RURAL' 
  AND maladies_chroniques IS NULL 
  AND age_ans BETWEEN 0 AND 10;

UPDATE patients 
SET maladies_chroniques = ARRAY['Paludisme récurrent', 'Anémie']
WHERE zone_residence = 'RURAL' 
  AND maladies_chroniques IS NULL 
  AND sexe = 'F' 
  AND age_ans BETWEEN 15 AND 49;

UPDATE patients 
SET maladies_chroniques = ARRAY['HTA', 'Paludisme']
WHERE zone_residence = 'RURAL' 
  AND maladies_chroniques IS NULL 
  AND age_ans > 50;

-- Zone URBAIN et URBAIN DENSE - HTA, diabète, obésité
UPDATE patients 
SET maladies_chroniques = ARRAY['HTA']
WHERE zone_residence IN ('URBAIN', 'URBAIN_DENSE') 
  AND maladies_chroniques IS NULL 
  AND age_ans BETWEEN 40 AND 60;

UPDATE patients 
SET maladies_chroniques = ARRAY['HTA', 'Diabète']
WHERE zone_residence IN ('URBAIN', 'URBAIN_DENSE') 
  AND maladies_chroniques IS NULL 
  AND age_ans > 60;

UPDATE patients 
SET maladies_chroniques = ARRAY['Diabète']
WHERE zone_residence IN ('URBAIN', 'URBAIN_DENSE') 
  AND maladies_chroniques IS NULL 
  AND profession IN ('Commerçant', 'Commerçante', 'Boutiquière', 'Buraliste')
  AND age_ans > 45;

-- 2. ALLERGIES PAR ZONE ET PROFESSION

-- Zone industrielle - allergies respiratoires
UPDATE patients 
SET allergies = ARRAY['Poussière industrielle', 'Chlore']
WHERE zone_residence = 'INDUSTRIELLE' 
  AND allergies IS NULL 
  AND profession IN ('Ouvrier', 'Ouvrier chimiste', 'Agent de nettoyage');

UPDATE patients 
SET allergies = ARRAY['Pollens', 'Acariens']
WHERE zone_residence = 'INDUSTRIELLE' 
  AND allergies IS NULL 
  AND age_ans BETWEEN 0 AND 18;

-- Zone lagunaire - allergies alimentaires (poisson, crustacés)
UPDATE patients 
SET allergies = ARRAY['Poisson', 'Crustacés']
WHERE zone_residence IN ('LAGUNAIRE', 'LAGUNAIRE_RISQUE') 
  AND allergies IS NULL 
  AND profession IN ('Pêcheur', 'Pêcheuse', 'Poissonnière');

-- Zone inondable - allergies aux moustiques, moisissures
UPDATE patients 
SET allergies = ARRAY['Piqûres de moustiques', 'Moisissures']
WHERE zone_residence = 'INONDABLE' 
  AND allergies IS NULL;

-- Zone RURALE - allergies alimentaires et pollens
UPDATE patients 
SET allergies = ARRAY['Arachide', 'Manioc']
WHERE zone_residence = 'RURAL' 
  AND allergies IS NULL 
  AND age_ans BETWEEN 0 AND 15;

UPDATE patients 
SET allergies = ARRAY['Pollens', 'Acariens', 'Poussière']
WHERE zone_residence = 'RURAL' 
  AND allergies IS NULL;

-- Zone URBAINE - allergies alimentaires et médicamenteuses
UPDATE patients 
SET allergies = ARRAY['Arachide', 'Latex']
WHERE zone_residence IN ('URBAIN', 'URBAIN_DENSE') 
  AND allergies IS NULL 
  AND profession IN ('Infirmière', 'Médecin', 'Personnel soignant');

UPDATE patients 
SET allergies = ARRAY['Pénicilline', 'Aspirine']
WHERE zone_residence IN ('URBAIN', 'URBAIN_DENSE') 
  AND allergies IS NULL 
  AND age_ans > 60;

UPDATE patients 
SET allergies = ARRAY['Arachide', 'Oeuf', 'Latex']
WHERE zone_residence IN ('URBAIN', 'URBAIN_DENSE') 
  AND allergies IS NULL 
  AND age_ans BETWEEN 0 AND 18;

-- 3. CAS SPÉCIFIQUES PAR PROFESSION

-- Personnel soignant - latex
UPDATE patients 
SET allergies = ARRAY['Latex', 'Pénicilline']
WHERE profession IN ('Infirmière', 'Médecin', 'Sage-femme', 'Agent de santé') 
  AND allergies IS NULL;

-- Chauffeurs/taxis - pollution
UPDATE patients 
SET maladies_chroniques = ARRAY['BPCO', 'Asthme']
WHERE profession IN ('Chauffeur', 'Chauffeur taxi', 'Transporteur') 
  AND maladies_chroniques IS NULL 
  AND age_ans > 40;

-- Commerçants - stress, HTA
UPDATE patients 
SET maladies_chroniques = ARRAY['HTA', 'Anxiété']
WHERE profession IN ('Commerçant', 'Commerçante', 'Vendeuse', 'Boutiquière') 
  AND maladies_chroniques IS NULL 
  AND age_ans > 45;

-- 4. TABLEAU RÉCAPITULATIF PAR DÉPARTEMENT

-- Département Wouri (Douala) - HTA, diabète
UPDATE patients 
SET maladies_chroniques = ARRAY['HTA']
WHERE departement = 'Wouri' 
  AND maladies_chroniques IS NULL 
  AND age_ans BETWEEN 45 AND 65;

-- Département Moungo - Paludisme, onchocercose
UPDATE patients 
SET maladies_chroniques = ARRAY['Paludisme', 'Onchocercose']
WHERE departement = 'Moungo' 
  AND maladies_chroniques IS NULL 
  AND zone_residence = 'RURAL';

-- Département Sanaga-Maritime - Bilharziose, paludisme
UPDATE patients 
SET maladies_chroniques = ARRAY['Bilharziose', 'Paludisme']
WHERE departement = 'Sanaga-Maritime' 
  AND maladies_chroniques IS NULL;

-- 5. MISE À JOUR DES ENFANTS (0-5 ans) - Maladies infantiles
UPDATE patients 
SET maladies_chroniques = ARRAY['Anémie', 'Paludisme infantile']
WHERE age_ans < 5 
  AND maladies_chroniques IS NULL 
  AND zone_residence IN ('INONDABLE', 'LAGUNAIRE', 'RURAL');

UPDATE patients 
SET allergies = ARRAY['Acariens', 'Poussière']
WHERE age_ans < 5 
  AND allergies IS NULL;

-- 6. FEMMES ENCEINTES - Anémie
UPDATE patients 
SET maladies_chroniques = ARRAY['Anémie gravidique']
WHERE metadata->>'gestite' IS NOT NULL 
  AND maladies_chroniques IS NULL;

-- 7. PERSONNES ÂGÉES (60+) - Multimorbidité
UPDATE patients 
SET maladies_chroniques = ARRAY['HTA', 'Diabète', 'Arthrose', 'BPCO']
WHERE age_ans >= 70 
  AND maladies_chroniques IS NULL;

UPDATE patients 
SET maladies_chroniques = ARRAY['HTA', 'Diabète']
WHERE age_ans BETWEEN 60 AND 69 
  AND maladies_chroniques IS NULL;

UPDATE patients 
SET allergies = ARRAY['Aspirine', 'AINS']
WHERE age_ans >= 65 
  AND allergies IS NULL;


-- ============================================================
-- CORRECTIONS SPÉCIFIQUES DES NULL RESTANTS
-- ============================================================

-- 1. PAT-BON-071 (a déjà VIH et AB-, pas de NULL mais vérifier)
UPDATE patients SET 
    niveau_education = COALESCE(niveau_education, 'Universitaire'),
    groupe_sanguin = COALESCE(groupe_sanguin, 'AB-')
WHERE code_patient = 'PAT-BON-071';

-- 2. PAT-NKO-026 (45F commerçante à Nkongsamba) - HTA, pas de NULL
-- OK, pas de correction

-- 3. PAT-URB-053 (43F banquière Bonanjo) - HTA, pas de NULL
-- OK

-- 4. PAT-LOG-087 (37M ouvrier Logbaba) - BPCO + allergies
UPDATE patients SET 
    zone_residence = COALESCE(zone_residence, 'INDUSTRIELLE')
WHERE code_patient = 'PAT-LOG-087';

-- 5. PAT-DEI-084 (32F poissonnière Deido)
-- OK

-- 6. PAT-DEI-085 (21M pêcheur Logpom)
-- OK

-- 7. PAT-MAT-107 (31F pêcheuse Deido enceinte)
-- OK

-- 8. PAT-BEP-074 (34F ménagère Bépanda)
-- OK

-- 9. PAT-BEP-075 (50M chauffeur Bépanda) - HTA + Diabète
-- OK

-- 10. PAT-BEP-077 (27F vendeuse Bépanda)
UPDATE patients SET 
    maladies_chroniques = COALESCE(maladies_chroniques, '{"Paludisme récurrent", "HTA"}'::text[]),
    allergies = COALESCE(allergies, '{"Piqûres de moustiques", "Moisissures"}'::text[])
WHERE code_patient = 'PAT-BEP-077';

-- 11. PAT-SEN-111 (67F ménagère Bépanda)
-- OK

-- 12. PAT-BEP-076 (6F enfant Bépanda)
-- OK

-- 13. PAT-PEV-104 (1M bébé Bépanda)
-- OK

-- 14. PAT-MOU-041 (6M enfant rural)
UPDATE patients SET 
    zone_residence = COALESCE(zone_residence, 'RURAL')
WHERE code_patient = 'PAT-MOU-041';

-- 15. PAT-NKA-097 (45M boucher rural)
UPDATE patients SET 
    maladies_chroniques = COALESCE(maladies_chroniques, '{}'::text[]),
    niveau_education = COALESCE(niveau_education, 'Primaire')
WHERE code_patient = 'PAT-NKA-097';

-- 16. PAT-NKA-099 (25M mécanicien rural)
UPDATE patients SET 
    maladies_chroniques = COALESCE(maladies_chroniques, '{"Asthme professionnel"}'::text[]),
    niveau_education = COALESCE(niveau_education, 'Secondaire')
WHERE code_patient = 'PAT-NKA-099';

-- 17. PAT-NKA-098 (33F couturière rurale)
UPDATE patients SET 
    niveau_education = COALESCE(niveau_education, 'Primaire')
WHERE code_patient = 'PAT-NKA-098';

-- 18. PAT-SEN-112 (70M retraité Nkongsamba) - BPCO+HTA
-- OK

-- 19. PT-CM-010 (70M Centre) - HTA+Diabète
UPDATE patients SET 
    type_prise_charge_defaut = COALESCE(type_prise_charge_defaut, 'ETAT'),
    groupe_sanguin = COALESCE(groupe_sanguin, 'O+')
WHERE code_patient = 'PT-CM-010';

-- 20. PAT-MAK-008 (37F infirmière) - allergies latex
-- OK

-- 21. PAT-MAK-009 (66M retraité) - HTA+Diabète+Arthrose
-- OK

-- 22. PAT-HGD-021 (15M élève) - allergie arachide
UPDATE patients SET 
    zone_residence = COALESCE(zone_residence, 'URBAIN')
WHERE code_patient = 'PAT-HGD-021';

-- 23. PAT-NKO-028 (51M agriculteur) - Paludisme récurrent
-- OK

-- 24. PAT-EDE-029 (33M ouvrier ALUCAM) - Asthme pro
-- OK

-- 25. PAT-NDO-003 (6M enfant Ndogbong)
UPDATE patients SET 
    zone_residence = COALESCE(zone_residence, 'LAGUNAIRE'),
    statut_socio_pro = COALESCE(statut_socio_pro, 'ETUDIANT')
WHERE code_patient = 'PAT-NDO-003';

-- 26. PAT-NDO-002 (35F enseignante) - Paludisme+HTA + allergie pénicilline
UPDATE patients SET 
    niveau_education = COALESCE(niveau_education, 'Universitaire')
WHERE code_patient = 'PAT-NDO-002';

-- 27. PAT-NDO-015 (43F boutiquière)
UPDATE patients SET 
    zone_residence = COALESCE(zone_residence, 'LAGUNAIRE')
WHERE code_patient = 'PAT-NDO-015';

-- 28. PAT-NKO-027 (6M enfant Nkongsamba) - Malnutrition
UPDATE patients SET 
    statut_socio_pro = COALESCE(statut_socio_pro, 'ETUDIANT'),
    niveau_education = COALESCE(niveau_education, 'Maternel')
WHERE code_patient = 'PAT-NKO-027';

-- 29. PAT-PEV-049 (0M nouveau-né Akwa)
UPDATE patients SET 
    statut_socio_pro = COALESCE(statut_socio_pro, 'ETUDIANT'),
    niveau_education = COALESCE(niveau_education, 'Maternel'),
    type_prise_charge_defaut = COALESCE(type_prise_charge_defaut, 'ETAT'),
    zone_residence = COALESCE(zone_residence, 'URBAIN_DENSE'),
    allergies = COALESCE(allergies, '{"Arachide", "Oeuf", "Latex"}'::text[])
WHERE code_patient = 'PAT-PEV-049';

-- 30. PAT-NYA-037 (4M enfant Nyalla)
UPDATE patients SET 
    statut_socio_pro = COALESCE(statut_socio_pro, 'ETUDIANT'),
    niveau_education = COALESCE(niveau_education, 'Maternel'),
    type_prise_charge_defaut = COALESCE(type_prise_charge_defaut, 'ETAT'),
    zone_residence = COALESCE(zone_residence, 'URBAIN')
WHERE code_patient = 'PAT-NYA-037';

-- 31. PAT-PEV-051 (2M enfant Nkongsamba)
UPDATE patients SET 
    statut_socio_pro = COALESCE(statut_socio_pro, 'ETUDIANT'),
    niveau_education = COALESCE(niveau_education, 'Maternel'),
    type_prise_charge_defaut = COALESCE(type_prise_charge_defaut, 'ETAT')
WHERE code_patient = 'PAT-PEV-051';

-- 32. PAT-LAQ-016 (3F enfant Bonanjo)
UPDATE patients SET 
    statut_socio_pro = COALESCE(statut_socio_pro, 'ETUDIANT'),
    niveau_education = COALESCE(niveau_education, 'Maternel'),
    type_prise_charge_defaut = COALESCE(type_prise_charge_defaut, 'ETAT')
WHERE code_patient = 'PAT-LAQ-016';

-- 33. PAT-PEV-103 (2F enfant Akwa)
UPDATE patients SET 
    statut_socio_pro = COALESCE(statut_socio_pro, 'ETUDIANT'),
    niveau_education = COALESCE(niveau_education, 'Maternel'),
    type_prise_charge_defaut = COALESCE(type_prise_charge_defaut, 'ETAT')
WHERE code_patient = 'PAT-PEV-103';

-- 34. PAT-PEV-106 (1F enfant Nkongsamba)
UPDATE patients SET 
    statut_socio_pro = COALESCE(statut_socio_pro, 'ETUDIANT'),
    niveau_education = COALESCE(niveau_education, 'Maternel'),
    type_prise_charge_defaut = COALESCE(type_prise_charge_defaut, 'ETAT')
WHERE code_patient = 'PAT-PEV-106';

-- 35. PAT-EDE-031 (38F vendeuse Edéa) - Bilharziose+Paludisme
UPDATE patients SET 
    zone_residence = COALESCE(zone_residence, 'URBAIN'),
    adresse_detail = COALESCE(adresse_detail, 'Centre ville Edéa')
WHERE code_patient = 'PAT-EDE-031';

-- 36. PAT-PEV-105 (2M enfant Bonabéri) - Anémie
UPDATE patients SET 
    statut_socio_pro = COALESCE(statut_socio_pro, 'ETUDIANT'),
    niveau_education = COALESCE(niveau_education, 'Maternel'),
    type_prise_charge_defaut = COALESCE(type_prise_charge_defaut, 'ETAT')
WHERE code_patient = 'PAT-PEV-105';

-- 37. PAT-MAT-047 (33F secrétaire Makepe) - Anémie gravidique
UPDATE patients SET 
    adresse_detail = COALESCE(adresse_detail, 'Quartier Makepe')
WHERE code_patient = 'PAT-MAT-047';

-- 38. patients du Centre (Yaoundé) avec données manquantes
UPDATE patients SET 
    zone_residence = COALESCE(zone_residence, 'URBAIN_DENSE'),
    type_prise_charge_defaut = COALESCE(type_prise_charge_defaut, 'ETAT'),
    groupe_sanguin = COALESCE(groupe_sanguin, 'O+'),
    niveau_education = COALESCE(niveau_education, 'Secondaire'),
    statut_socio_pro = COALESCE(statut_socio_pro, 'SANS_EMPLOI')
WHERE region = 'Centre' AND (zone_residence IS NULL OR type_prise_charge_defaut IS NULL);

-- 39. patients de l'Extrême-Nord
UPDATE patients SET 
    zone_residence = COALESCE(zone_residence, 'URBAIN'),
    type_prise_charge_defaut = COALESCE(type_prise_charge_defaut, 'ETAT'),
    groupe_sanguin = COALESCE(groupe_sanguin, 'O+'),
    niveau_education = COALESCE(niveau_education, 'Primaire'),
    statut_socio_pro = COALESCE(statut_socio_pro, 'ARTISAN')
WHERE region = 'Extreme-Nord' AND (zone_residence IS NULL OR type_prise_charge_defaut IS NULL);

-- 40. patients de l'Ouest
UPDATE patients SET 
    zone_residence = COALESCE(zone_residence, 'URBAIN'),
    type_prise_charge_defaut = COALESCE(type_prise_charge_defaut, 'ETAT'),
    groupe_sanguin = COALESCE(groupe_sanguin, 'O+'),
    niveau_education = COALESCE(niveau_education, 'Secondaire'),
    statut_socio_pro = COALESCE(statut_socio_pro, 'COMMERCANT')
WHERE region = 'Ouest' AND (zone_residence IS NULL OR type_prise_charge_defaut IS NULL);

-- 41. patients du Nord-Ouest
UPDATE patients SET 
    zone_residence = COALESCE(zone_residence, 'URBAIN'),
    type_prise_charge_defaut = COALESCE(type_prise_charge_defaut, 'ETAT'),
    groupe_sanguin = COALESCE(groupe_sanguin, 'O+'),
    niveau_education = COALESCE(niveau_education, 'Secondaire'),
    statut_socio_pro = COALESCE(statut_socio_pro, 'ARTISAN')
WHERE region = 'Nord-Ouest' AND (zone_residence IS NULL OR type_prise_charge_defaut IS NULL);

-- 42. PT-LT-001 et PT-LT-002 (Littoral inconnu)
UPDATE patients SET 
    departement = COALESCE(departement, 'Wouri'),
    arrondissement = COALESCE(arrondissement, 'Douala 1'),
    quartier = COALESCE(quartier, 'AKWA'),
    zone_residence = COALESCE(zone_residence, 'URBAIN_DENSE'),
    type_prise_charge_defaut = COALESCE(type_prise_charge_defaut, 'ETAT'),
    statut_socio_pro = COALESCE(statut_socio_pro, 'SANS_EMPLOI'),
    niveau_education = COALESCE(niveau_education, 'Primaire')
WHERE code_patient IN ('PT-LT-001', 'PT-LT-002');

-- 43. PAT-PEV-050 (1F enfant Logbaba) - Asthme allergique
UPDATE patients SET 
    statut_socio_pro = COALESCE(statut_socio_pro, 'ETUDIANT'),
    niveau_education = COALESCE(niveau_education, 'Maternel'),
    type_prise_charge_defaut = COALESCE(type_prise_charge_defaut, 'ETAT')
WHERE code_patient = 'PAT-PEV-050';

-- 44. PAT-ZIN-033 (4F enfant Bépanda) - Anémie
UPDATE patients SET 
    statut_socio_pro = COALESCE(statut_socio_pro, 'ETUDIANT'),
    niveau_education = COALESCE(niveau_education, 'Maternel')
WHERE code_patient = 'PAT-ZIN-033';

-- 45. Mise à jour des groupes sanguins pour tous les NULL restants
UPDATE patients SET groupe_sanguin = 'O+' WHERE groupe_sanguin IS NULL;

-- 46. Mise à jour des maladies_chroniques vides pour adultes en bonne santé
UPDATE patients SET maladies_chroniques = '{}'::text[] WHERE maladies_chroniques IS NULL;

-- 47. Mise à jour des allergies vides
UPDATE patients SET allergies = '{}'::text[] WHERE allergies IS NULL;

-- 48. Mise à jour de la zone_residence pour tous les NULL restants
UPDATE patients SET zone_residence = 
    CASE 
        WHEN region = 'Littoral' AND quartier IN ('AKWA', 'BONANJO', 'BONAPRISO', 'CITE_SIC') THEN 'URBAIN_DENSE'
        WHEN region = 'Littoral' AND quartier IN ('MAKEPE', 'BALI', 'KOTTO') THEN 'URBAIN'
        WHEN region = 'Littoral' AND quartier = 'BEPANDA' THEN 'INONDABLE'
        WHEN region = 'Littoral' AND quartier IN ('DEIDO', 'NDOKOTI', 'LOGPOM') THEN 'LAGUNAIRE'
        WHEN region = 'Littoral' AND quartier IN ('BONABERI', 'PK9') THEN 'PERI_URBAIN'
        WHEN region = 'Littoral' AND quartier IN ('LOGBABA', 'JAPOMA') THEN 'INDUSTRIELLE'
        WHEN region = 'Centre' THEN 'URBAIN_DENSE'
        WHEN region = 'Extreme-Nord' THEN 'URBAIN'
        WHEN region = 'Ouest' THEN 'URBAIN'
        WHEN region = 'Nord-Ouest' THEN 'URBAIN'
        ELSE 'URBAIN'
    END
WHERE zone_residence IS NULL;

-- ============================================================
-- REMPLACEMENT DES TABLEAUX VIDES {} PAR DES DONNÉES RÉALISTES
-- Basé sur la zone, la profession, l'âge et le quartier
-- ============================================================

-- 1. PATIENTS DE LA ZONE LAGUNAIRE (NDOKOTI, DEIDO, LOGPOM)
UPDATE patients SET 
    maladies_chroniques = ARRAY['Paludisme récurrent', 'Anémie']
WHERE zone_residence = 'LAGUNAIRE' 
  AND maladies_chroniques = '{}'::text[]
  AND age_ans < 15;

UPDATE patients SET 
    maladies_chroniques = ARRAY['Paludisme récurrent', 'HTA']
WHERE zone_residence = 'LAGUNAIRE' 
  AND maladies_chroniques = '{}'::text[]
  AND age_ans BETWEEN 15 AND 50;

UPDATE patients SET 
    maladies_chroniques = ARRAY['Paludisme récurrent', 'HTA', 'Diabète']
WHERE zone_residence = 'LAGUNAIRE' 
  AND maladies_chroniques = '{}'::text[]
  AND age_ans > 50;

-- 2. PATIENTS DE LA ZONE INONDABLE (BEPANDA)
UPDATE patients SET 
    maladies_chroniques = ARRAY['Paludisme récurrent', 'Anémie']
WHERE zone_residence = 'INONDABLE' 
  AND maladies_chroniques = '{}'::text[]
  AND age_ans < 15;

UPDATE patients SET 
    maladies_chroniques = ARRAY['Paludisme récurrent', 'HTA']
WHERE zone_residence = 'INONDABLE' 
  AND maladies_chroniques = '{}'::text[]
  AND age_ans BETWEEN 15 AND 50;

UPDATE patients SET 
    maladies_chroniques = ARRAY['HTA', 'Diabète']
WHERE zone_residence = 'INONDABLE' 
  AND maladies_chroniques = '{}'::text[]
  AND age_ans > 50;

-- 3. PATIENTS DE LA ZONE INDUSTRIELLE (LOGBABA, JAPOMA)
UPDATE patients SET 
    maladies_chroniques = ARRAY['Asthme', 'Allergies respiratoires']
WHERE zone_residence = 'INDUSTRIELLE' 
  AND maladies_chroniques = '{}'::text[]
  AND age_ans < 18;

UPDATE patients SET 
    maladies_chroniques = ARRAY['Asthme professionnel', 'BPCO']
WHERE zone_residence = 'INDUSTRIELLE' 
  AND maladies_chroniques = '{}'::text[]
  AND profession IN ('Ouvrier', 'Mécanicien', 'Ouvrier chimiste');

UPDATE patients SET 
    maladies_chroniques = ARRAY['BPCO', 'Cardiopathie']
WHERE zone_residence = 'INDUSTRIELLE' 
  AND maladies_chroniques = '{}'::text[]
  AND age_ans > 50;

-- 4. PATIENTS DE LA ZONE URBAINE DENSE (AKWA, BONANJO, BONAPRISO)
UPDATE patients SET 
    maladies_chroniques = ARRAY['Asthme']
WHERE zone_residence = 'URBAIN_DENSE' 
  AND maladies_chroniques = '{}'::text[]
  AND age_ans < 15;

UPDATE patients SET 
    maladies_chroniques = ARRAY['HTA']
WHERE zone_residence = 'URBAIN_DENSE' 
  AND maladies_chroniques = '{}'::text[]
  AND age_ans BETWEEN 15 AND 50
  AND sexe = 'M';

UPDATE patients SET 
    maladies_chroniques = ARRAY['Diabète']
WHERE zone_residence = 'URBAIN_DENSE' 
  AND maladies_chroniques = '{}'::text[]
  AND age_ans BETWEEN 15 AND 50
  AND sexe = 'F';

UPDATE patients SET 
    maladies_chroniques = ARRAY['HTA', 'Diabète', 'Arthrose']
WHERE zone_residence = 'URBAIN_DENSE' 
  AND maladies_chroniques = '{}'::text[]
  AND age_ans > 50;

-- 5. PATIENTS DE LA ZONE URBAIN (MAKEPE, BALI, KOTTO)
UPDATE patients SET 
    maladies_chroniques = ARRAY['Paludisme']
WHERE zone_residence = 'URBAIN' 
  AND maladies_chroniques = '{}'::text[]
  AND age_ans < 15;

UPDATE patients SET 
    maladies_chroniques = ARRAY['HTA']
WHERE zone_residence = 'URBAIN' 
  AND maladies_chroniques = '{}'::text[]
  AND age_ans BETWEEN 40 AND 60;

-- 6. PATIENTS DE LA ZONE RURALE
UPDATE patients SET 
    maladies_chroniques = ARRAY['Paludisme', 'Malnutrition']
WHERE zone_residence = 'RURAL' 
  AND maladies_chroniques = '{}'::text[]
  AND age_ans < 15;

UPDATE patients SET 
    maladies_chroniques = ARRAY['Paludisme récurrent', 'Anémie']
WHERE zone_residence = 'RURAL' 
  AND maladies_chroniques = '{}'::text[]
  AND sexe = 'F'
  AND age_ans BETWEEN 15 AND 49;

UPDATE patients SET 
    maladies_chroniques = ARRAY['HTA', 'Paludisme']
WHERE zone_residence = 'RURAL' 
  AND maladies_chroniques = '{}'::text[]
  AND age_ans > 50;

-- 7. PATIENTS DE LA ZONE PERI_URBAIN (BONABERI, PK9)
UPDATE patients SET 
    maladies_chroniques = ARRAY['Paludisme', 'Anémie']
WHERE zone_residence = 'PERI_URBAIN' 
  AND maladies_chroniques = '{}'::text[]
  AND age_ans < 15;

UPDATE patients SET 
    maladies_chroniques = ARRAY['Paludisme récurrent', 'HTA']
WHERE zone_residence = 'PERI_URBAIN' 
  AND maladies_chroniques = '{}'::text[]
  AND age_ans BETWEEN 15 AND 50;

-- 8. PATIENTS DE LA ZONE PORTUAIRE RISQUE
UPDATE patients SET 
    maladies_chroniques = ARRAY['VIH']
WHERE zone_residence = 'PORTUAIRE_RISQUE' 
  AND maladies_chroniques = '{}'::text[]
  AND profession IN ('Travailleur portuaire', 'Docker', 'Douanier');

UPDATE patients SET 
    maladies_chroniques = ARRAY['Paludisme']
WHERE zone_residence = 'PORTUAIRE_RISQUE' 
  AND maladies_chroniques = '{}'::text[]
  AND age_ans < 15;

-- 9. CORRECTION DES ALLERGIES VIDES {}

-- Zone LAGUNAIRE - allergies aux poissons et crustacés
UPDATE patients SET 
    allergies = ARRAY['Poisson', 'Crustacés']
WHERE zone_residence = 'LAGUNAIRE' 
  AND allergies = '{}'::text[]
  AND profession IN ('Pêcheur', 'Pêcheuse', 'Poissonnière');

UPDATE patients SET 
    allergies = ARRAY['Piqûres de moustiques']
WHERE zone_residence = 'LAGUNAIRE' 
  AND allergies = '{}'::text[]
  AND age_ans < 15;

-- Zone INONDABLE - allergies aux moustiques et moisissures
UPDATE patients SET 
    allergies = ARRAY['Piqûres de moustiques', 'Moisissures']
WHERE zone_residence = 'INONDABLE' 
  AND allergies = '{}'::text[];

-- Zone INDUSTRIELLE - allergies industrielles
UPDATE patients SET 
    allergies = ARRAY['Poussière industrielle', 'Chlore', 'Produits chimiques']
WHERE zone_residence = 'INDUSTRIELLE' 
  AND allergies = '{}'::text[]
  AND profession IN ('Ouvrier', 'Ouvrier chimiste', 'Mécanicien');

UPDATE patients SET 
    allergies = ARRAY['Acariens', 'Poussière']
WHERE zone_residence = 'INDUSTRIELLE' 
  AND allergies = '{}'::text[]
  AND age_ans < 15;

-- Zone URBAIN_DENSE - allergies alimentaires et médicamenteuses
UPDATE patients SET 
    allergies = ARRAY['Arachide', 'Oeuf', 'Latex']
WHERE zone_residence = 'URBAIN_DENSE' 
  AND allergies = '{}'::text[]
  AND age_ans < 15;

UPDATE patients SET 
    allergies = ARRAY['Arachide', 'Fruits de mer']
WHERE zone_residence = 'URBAIN_DENSE' 
  AND allergies = '{}'::text[]
  AND age_ans BETWEEN 15 AND 40;

UPDATE patients SET 
    allergies = ARRAY['Pénicilline', 'Aspirine', 'AINS']
WHERE zone_residence = 'URBAIN_DENSE' 
  AND allergies = '{}'::text[]
  AND age_ans > 50;

-- Zone URBAIN - allergies variées
UPDATE patients SET 
    allergies = ARRAY['Arachide', 'Oeuf']
WHERE zone_residence = 'URBAIN' 
  AND allergies = '{}'::text[]
  AND age_ans < 15;

UPDATE patients SET 
    allergies = ARRAY['Poussière', 'Acariens']
WHERE zone_residence = 'URBAIN' 
  AND allergies = '{}'::text[]
  AND age_ans BETWEEN 15 AND 50;

-- Zone RURALE - allergies aux pollens et aliments locaux
UPDATE patients SET 
    allergies = ARRAY['Arachide', 'Manioc', 'Pollens']
WHERE zone_residence = 'RURAL' 
  AND allergies = '{}'::text[]
  AND age_ans < 15;

UPDATE patients SET 
    allergies = ARRAY['Pollens', 'Acariens', 'Poussière']
WHERE zone_residence = 'RURAL' 
  AND allergies = '{}'::text[]
  AND age_ans BETWEEN 15 AND 50;

UPDATE patients SET 
    allergies = ARRAY['Pénicilline', 'AINS']
WHERE zone_residence = 'RURAL' 
  AND allergies = '{}'::text[]
  AND age_ans > 50;

-- Zone PERI_URBAIN
UPDATE patients SET 
    allergies = ARRAY['Poussière', 'Acariens']
WHERE zone_residence = 'PERI_URBAIN' 
  AND allergies = '{}'::text[];

-- Zone PORTUAIRE_RISQUE
UPDATE patients SET 
    allergies = ARRAY['Acariens', 'Poussière']
WHERE zone_residence = 'PORTUAIRE_RISQUE' 
  AND allergies = '{}'::text[];

-- 10. CORRECTION POUR LES PATIENTS DE LA RÉGION CENTRE
UPDATE patients SET 
    maladies_chroniques = ARRAY['HTA']
WHERE region = 'Centre' 
  AND maladies_chroniques = '{}'::text[]
  AND age_ans > 40;

UPDATE patients SET 
    allergies = ARRAY['Arachide', 'Poussière']
WHERE region = 'Centre' 
  AND allergies = '{}'::text[];

-- 11. CORRECTION POUR LES PATIENTS DE L'EXTRÊME-NORD
UPDATE patients SET 
    maladies_chroniques = ARRAY['Paludisme']
WHERE region = 'Extreme-Nord' 
  AND maladies_chroniques = '{}'::text[];

UPDATE patients SET 
    allergies = ARRAY['Poussière', 'Acariens']
WHERE region = 'Extreme-Nord' 
  AND allergies = '{}'::text[];

-- 12. CORRECTION POUR LES PATIENTS DE L'OUEST
UPDATE patients SET 
    maladies_chroniques = ARRAY['HTA']
WHERE region = 'Ouest' 
  AND maladies_chroniques = '{}'::text[]
  AND age_ans > 40;

-- 13. CORRECTION POUR LES PATIENTS DU NORD-OUEST
UPDATE patients SET 
    maladies_chroniques = ARRAY['HTA']
WHERE region = 'Nord-Ouest' 
  AND maladies_chroniques = '{}'::text[]
  AND age_ans > 40;

-- 14. CAS SPÉCIFIQUES PAR CODE PATIENT

-- PAT-MAK-008 (Infirmière) - déjà correct
-- PAT-MAK-009 (Retraité) - déjà correct
-- PAT-NKO-026 (Commerçante) - déjà correct (HTA seule)
-- PAT-URB-053 (Banquière) - déjà correct (HTA seule)
-- PAT-KOT-036 (Buraliste) - déjà correct (HTA seule)
-- PAT-EDE-031 (Vendeuse Bilharziose+Paludisme) - déjà correct
-- PAT-MAT-047 (Secrétaire Anémie gravidique) - déjà correct
-- PAT-MOU-043 (Couturière) - jeune femme en bonne santé
UPDATE patients SET 
    maladies_chroniques = ARRAY['Paludisme']
WHERE code_patient = 'PAT-MOU-043' 
  AND maladies_chroniques = '{}'::text[];

-- PAT-MAK-082 (Esthéticienne) - jeune femme
UPDATE patients SET 
    maladies_chroniques = ARRAY['Paludisme']
WHERE code_patient = 'PAT-MAK-082' 
  AND maladies_chroniques = '{}'::text[];

-- PAT-KOT-090 (Buraliste)
UPDATE patients SET 
    maladies_chroniques = ARRAY['HTA']
WHERE code_patient = 'PAT-KOT-090' 
  AND maladies_chroniques = '{}'::text[];

-- PAT-MOU-093 (Chauffeur taxi)
UPDATE patients SET 
    maladies_chroniques = ARRAY['Paludisme']
WHERE code_patient = 'PAT-MOU-093' 
  AND maladies_chroniques = '{}'::text[];

-- PAT-MOU-096 (Vendeuse)
UPDATE patients SET 
    maladies_chroniques = ARRAY['Paludisme']
WHERE code_patient = 'PAT-MOU-096' 
  AND maladies_chroniques = '{}'::text[];

-- PAT-URB-055 (Pharmacienne)
UPDATE patients SET 
    allergies = ARRAY['Latex']
WHERE code_patient = 'PAT-URB-055' 
  AND allergies = '{}'::text[];

-- PAT-URB-056 (Étudiante)
UPDATE patients SET 
    allergies = ARRAY['Pollen']
WHERE code_patient = 'PAT-URB-056' 
  AND allergies = '{}'::text[];

-- PAT-URB-057 (Ingénieur)
UPDATE patients SET 
    maladies_chroniques = ARRAY['HTA']
WHERE code_patient = 'PAT-URB-057' 
  AND maladies_chroniques = '{}'::text[];

-- PAT-BON-070 (Boutiquière)
UPDATE patients SET 
    maladies_chroniques = ARRAY['HTA']
WHERE code_patient = 'PAT-BON-070' 
  AND maladies_chroniques = '{}'::text[];

-- PAT-HGD-022 (Architecte)
UPDATE patients SET 
    maladies_chroniques = ARRAY['HTA']
WHERE code_patient = 'PAT-HGD-022' 
  AND maladies_chroniques = '{}'::text[];

-- PAT-MAK-079 (Enseignant)
UPDATE patients SET 
    maladies_chroniques = ARRAY['HTA']
WHERE code_patient = 'PAT-MAK-079' 
  AND maladies_chroniques = '{}'::text[];

-- PAT-MOU-092 (Commerçante)
-- déjà correct (HTA)

-- PAT-MOU-094 (Étudiante)
UPDATE patients SET 
    allergies = ARRAY['Pollen']
WHERE code_patient = 'PAT-MOU-094' 
  AND allergies = '{}'::text[];

-- PAT-NDO-064 (Vendeuse)
UPDATE patients SET 
    maladies_chroniques = ARRAY['Paludisme récurrent']
WHERE code_patient = 'PAT-NDO-064' 
  AND maladies_chroniques = '{}'::text[];

-- PAT-LOG-088 (Agent de nettoyage)
UPDATE patients SET 
    maladies_chroniques = ARRAY['Asthme']
WHERE code_patient = 'PAT-LOG-088' 
  AND maladies_chroniques = '{}'::text[];

-- PAT-BON-005 (Ouvrière)
UPDATE patients SET 
    maladies_chroniques = ARRAY['Paludisme']
WHERE code_patient = 'PAT-BON-005' 
  AND maladies_chroniques = '{}'::text[];

-- PAT-HGD-024 (Manutentionnaire)
UPDATE patients SET 
    maladies_chroniques = ARRAY['Paludisme']
WHERE code_patient = 'PAT-HGD-024' 
  AND maladies_chroniques = '{}'::text[];



