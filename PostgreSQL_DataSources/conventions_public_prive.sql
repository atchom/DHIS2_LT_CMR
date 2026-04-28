-- ============================================================
-- INSERTION DES CONVENTIONS PUBLIC-PRIVÉ - LITTORAL
-- Partenariats réels et stratégiques entre structures
-- ============================================================

-- ============================================================
-- 1. PARTENARIATS DE SOINS (référencement patients)
-- ============================================================

-- Convention HGOPED (public) ←→ Clinique Bonamoussadi (privé) - Maternité
INSERT INTO conventions_public_prive (
    code_convention, nom_convention, id_org_public, id_org_prive,
    date_debut, date_fin, date_signature, type_convention,
    services_concernes, tarifs_conventionnes, indicateurs_suivi,
    montant_annuel, modalites_paiement,
    responsable_public, responsable_prive, actif
) VALUES (
    'CONV-PUB-PRV-001',
    'Partenariat Maternité HGOPED - Clinique Bonamoussadi',
    (SELECT id_org_unit FROM organisation_units WHERE code = 'H-HGOPED-DLA'),
    (SELECT id_org_unit FROM organisation_units WHERE code = 'CLIN-BONAM'),
    '2024-01-01', '2026-12-31', '2023-12-15',
    'reference_evacuation',
    ARRAY['accouchement_normal', 'cesarienne', 'soins_neonatals', 'consultation_post_natale'],
    '{"consultation": 5000, "accouchement_normal": 75000, "cesarienne": 150000, "soins_neonatals": 25000}'::JSONB,
    '{"nb_references_mensuelles": 0, "delai_prise_en_charge_minutes": 30, "taux_satisfaction": 0}'::JSONB,
    25000000.00,
    'Paiement trimestriel après facturation CNPS',
    'Pr Mbu Rémy', 'Dr Ngo Nyamsi', TRUE
);

-- Convention Hôpital Général Douala (public) ←→ Clinique Pasteur (privé) - Soins généraux
INSERT INTO conventions_public_prive (
    code_convention, nom_convention, id_org_public, id_org_prive,
    date_debut, date_fin, date_signature, type_convention,
    services_concernes, tarifs_conventionnes, indicateurs_suivi,
    montant_annuel, modalites_paiement,
    responsable_public, responsable_prive, actif
) VALUES (
    'CONV-PUB-PRV-002',
    'Partenariat Soins Généraux HGD - Clinique Pasteur',
    (SELECT id_org_unit FROM organisation_units WHERE code = 'H-GEN-DLA'),
    (SELECT id_org_unit FROM organisation_units WHERE code = 'CLIN-PAST'),
    '2024-03-01', '2027-02-28', '2024-02-20',
    'partenariat_soins',
    ARRAY['imagerie', 'laboratoire', 'consultations_specialisees', 'chirurgie_ambulatoire'],
    '{"consultation_specialisee": 15000, "scanner": 75000, "irm": 120000, "bilan_sanguin": 8000}'::JSONB,
    '{"temps_attente_moyen": 0, "nb_patients_orientes_mois": 0, "qualite_rapports": 0}'::JSONB,
    50000000.00,
    'Paiement mensuel sur facture',
    'Pr Essame Oyono', 'Dr Kameni Alain', TRUE
);

-- Convention Hôpital Laquintinie (public) ←→ Clinique Bethesda (privé) - Urgences
INSERT INTO conventions_public_prive (
    code_convention, nom_convention, id_org_public, id_org_prive,
    date_debut, date_fin, date_signature, type_convention,
    services_concernes, tarifs_conventionnes, indicateurs_suivi,
    montant_annuel, modalites_paiement,
    responsable_public, responsable_prive, actif
) VALUES (
    'CONV-PUB-PRV-003',
    'Convention Urgences Laquintinie - Bethesda',
    (SELECT id_org_unit FROM organisation_units WHERE code = 'H-LAQUINTINIE-DLA'),
    (SELECT id_org_unit FROM organisation_units WHERE code = 'CLIN-BETHESDA'),
    '2024-06-01', '2026-05-31', '2024-05-15',
    'reference_evacuation',
    ARRAY['reanimation', 'traumatologie', 'neurochirurgie', 'soins_intensifs'],
    '{"journee_hopitalisation": 75000, "reanimation_jour": 150000, "intervention_chirurgicale": 250000}'::JSONB,
    '{"nb_evacuations_urge_mois": 0, "deces_evacues": 0, "delai_prise_contact": 0}'::JSONB,
        35000000.00,
    'Paiement mensuel + prime urgence',
    'Dr Ndom Paul', 'Dr Ntone', TRUE
);

-- ============================================================
-- 2. CONVENTIONS DE PARTAGE DE DONNÉES (VIH, paludisme)
-- ============================================================

-- Convention CSI Ndogbong (public) ←→ Clinique Bethesda (privé) - Données VIH
INSERT INTO conventions_public_prive (
    code_convention, nom_convention, id_org_public, id_org_prive,
    date_debut, date_fin, date_signature, type_convention,
    services_concernes, tarifs_conventionnes, indicateurs_suivi,
    montant_annuel, modalites_paiement,
    responsable_public, responsable_prive, actif
) VALUES (
    'CONV-PUB-PRV-004',
    'Partenariat Données VIH/SIDA - District Douala 5e',
    (SELECT id_org_unit FROM organisation_units WHERE code = 'CSI-NDOKOTI'),
    (SELECT id_org_unit FROM organisation_units WHERE code = 'CLIN-BETHESDA'),
    '2024-01-10', '2025-12-31', '2024-01-05',
    'donnees',
    ARRAY['depistage_VIH', 'suivi_charge_virale', 'dispensation_ARV', 'CPN'],
    '{"remontees": "hebdomadaire", "format": "DHIS2", "securite": "confidentiel"}'::JSONB,
    '{"nb_depistages_mois": 0, "nb_nouveaux_cas": 0, "taux_adherence": 0}'::JSONB,
    15000000.00,
    'Forfait annuel + prime performance',
    'Dr Ndo', 'Dr Ntone', TRUE
);

-- Convention Mboppi Baptist (confessionnel) ←→ CSI Makepe (public) - Données paludisme
INSERT INTO conventions_public_prive (
    code_convention, nom_convention, id_org_public, id_org_prive,
    date_debut, date_fin, date_signature, type_convention,
    services_concernes, tarifs_conventionnes, indicateurs_suivi,
    montant_annuel, modalites_paiement,
    responsable_public, responsable_prive, actif
) VALUES (
    'CONV-PUB-PRV-005',
    'Surveillance Paludisme Makepe - Mboppi',
    (SELECT id_org_unit FROM organisation_units WHERE code = 'CSI-MAKEPE'),
    (SELECT id_org_unit FROM organisation_units WHERE code = 'H-MBOPPI-DLA'),
    '2024-02-01', '2026-01-31', '2024-01-25',
    'donnees',
    ARRAY['cas_paludisme', 'traitement_ACT', 'distribution_MILDA', 'chimioprophylaxie'],
    '{"frequence": "quotidienne", "alerte_seuil": 10, "notifications": "SMS+Email"}'::JSONB,
    '{"nb_cas_semaine": 0, "nb_deces": 0, "nb_moustiquaires_distribuees": 0}'::JSONB,
    8000000.00,
    'Paiement semestriel',
    'Dr Kamga', 'Dr Njoya', TRUE
);

-- ============================================================
-- 3. CONVENTIONS DE SUPERVISION ET FORMATION
-- ============================================================

-- Supervision technique des cliniques privées par le district
INSERT INTO conventions_public_prive (
    code_convention, nom_convention, id_org_public, id_org_prive,
    date_debut, date_fin, date_signature, type_convention,
    services_concernes, tarifs_conventionnes, indicateurs_suivi,
    montant_annuel, modalites_paiement,
    responsable_public, responsable_prive, actif
) VALUES (
    'CONV-PUB-PRV-006',
    'Supervision Techniques Médicales - District Douala 1er',
    (SELECT id_org_unit FROM organisation_units WHERE code = 'DIST-DLA'),
    NULL, -- Supervision de plusieurs privés
    '2024-01-01', '2025-12-31', '2023-12-10',
    'supervision',
    ARRAY['controle_qualite', 'audit_medical', 'formation_continue', 'certification'],
    '{"cout_audit": 250000, "formation_par_agent": 50000, "certification": 500000}'::JSONB,
    '{"nb_visites_an": 0, "nb_agents_formes": 0, "taux_conformite": 0}'::JSONB,
    30000000.00,
    'Paiement par prestation',
    'Dr Nguélé Pierre', 'Représentants cliniques privées', TRUE
);

-- Formation des agents privés par les hôpitaux publics
INSERT INTO conventions_public_prive (
    code_convention, nom_convention, id_org_public, id_org_prive,
    date_debut, date_fin, date_signature, type_convention,
    services_concernes, tarifs_conventionnes, indicateurs_suivi,
    montant_annuel, modalites_paiement,
    responsable_public, responsable_prive, actif
) VALUES (
    'CONV-PUB-PRV-007',
    'Formation Continue - HGOPED pour Cliniques Privées',
    (SELECT id_org_unit FROM organisation_units WHERE code = 'H-HGOPED-DLA'),
    NULL, -- Formation ouverte à toutes les cliniques privées partenaires
    '2024-03-01', '2026-02-28', '2024-02-10',
    'formation',
    ARRAY['formation_accouchement', 'reanimation_neonatale', 'allaitement_maternel', 'detection_precoce'],
    '{"session_formation": 150000, "kit_didactique": 25000, "certificat": 5000}'::JSONB,
    '{"nb_agents_formes": 0, "nb_sessions_an": 0, "taux_reussite": 0}'::JSONB,
    12000000.00,
    'Paiement par session',
    'Pr Mbu Rémy', 'Représentants cliniques privées', TRUE
);

-- ============================================================
-- 4. CONVENTIONS SPÉCIFIQUES PAR QUARTIER/ZONE
-- ============================================================

-- Convention zone inondable - Bonabéri (public CSI ←→ privé)
INSERT INTO conventions_public_prive (
    code_convention, nom_convention, id_org_public, id_org_prive,
    date_debut, date_fin, date_signature, type_convention,
    services_concernes, tarifs_conventionnes, indicateurs_suivi,
    montant_annuel, modalites_paiement,
    responsable_public, responsable_prive, actif
) VALUES (
    'CONV-PUB-PRV-008',
    'Partenariat Zone Inondable - Bonabéri',
    (SELECT id_org_unit FROM organisation_units WHERE code = 'CSI-BONAB'),
    (SELECT id_org_unit FROM organisation_units WHERE code = 'CLIN-INTER-BONAB'),
    '2024-05-01', '2025-04-30', '2024-04-15',
    'partenariat_soins',
    ARRAY['urgences_inondation', 'maladies_hydriques', 'consultations_mobiles', 'vaccination'],
    '{"consultation_urgence": 10000, "kit_cholera": 15000, "vaccination": 2000}'::JSONB,
    '{"nb_patients_saison_pluies": 0, "nb_cas_cholera": 0, "interventions_mobiles": 0}'::JSONB,
    20000000.00,
    'Paiement trimestriel + fonds d''urgence',
    'Dr Mbarga', 'Dr Internationale', TRUE
);

-- Convention Louis Pasteur (privé) avec District Douala - Référence patients
INSERT INTO conventions_public_prive (
    code_convention, nom_convention, id_org_public, id_org_prive,
    date_debut, date_fin, date_signature, type_convention,
    services_concernes, tarifs_conventionnes, indicateurs_suivi,
    montant_annuel, modalites_paiement,
    responsable_public, responsable_prive, actif
) VALUES (
    'CONV-PUB-PRV-009',
    'Convention Référence Patients - Clinique Louis Pasteur',
    (SELECT id_org_unit FROM organisation_units WHERE code = 'DIST-DLA'),
    (SELECT id_org_unit FROM organisation_units WHERE code = 'CLIN-LOUISPASTEUR-DLA'),
    '2024-01-15', '2026-01-14', '2024-01-10',
    'reference_evacuation',
    ARRAY['chirurgie', 'ophtalmologie', 'imagerie', 'laboratoire_reference'],
    '{"consultation": 8000, "chirurgie_ambulatoire": 200000, "cataracte": 350000, "scanner": 85000}'::JSONB,
    '{"nb_references_mois": 0, "nb_interventions_lourdes": 0, "delai_prise_rdv": 0}'::JSONB,
    40000000.00,
    'Paiement mensuel + convention CNPS',
    'Dr Ngo Mbarga', 'Dr Ngo Mbarga Joseph', TRUE
);

-- ============================================================
-- 5. CONVENTION POUR LABORATOIRES ET EXAMENS
-- ============================================================

-- Convention laboratoire public ←→ cliniques privées
INSERT INTO conventions_public_prive (
    code_convention, nom_convention, id_org_public, id_org_prive,
    date_debut, date_fin, date_signature, type_convention,
    services_concernes, tarifs_conventionnes, indicateurs_suivi,
    montant_annuel, modalites_paiement,
    responsable_public, responsable_prive, actif
) VALUES (
    'CONV-PUB-PRV-010',
    'Laboratoire de Référence - HGOPED',
    (SELECT id_org_unit FROM organisation_units WHERE code = 'H-HGOPED-DLA'),
    NULL, -- Service à plusieurs cliniques
    '2024-02-01', '2025-01-31', '2024-01-20',
    'partenariat_soins',
    ARRAY['analyses_specialisees', 'anatomopathologie', 'bacteriologie', 'hormonologie'],
    '{"anapath": 50000, "bacteriologie": 25000, "hormones": 15000, "urgence_labo": 10000}'::JSONB,
    '{"nb_analyses_mois": 0, "delai_rendu": 0, "taux_satisfaction": 0}'::JSONB,
    25000000.00,
    'Paiement par analyse',
    'Pr Mbu Rémy', 'Responsables labos cliniques privées', TRUE
);

