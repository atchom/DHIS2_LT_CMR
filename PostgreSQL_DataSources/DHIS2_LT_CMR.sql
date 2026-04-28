-- ============================================================
-- SYSTEME DHIS2 COMPLET POUR LE LITTORAL CAMEROUN
-- Version terrain - Intégration Public/Privé
-- Auteur: DHIS2 Cameroun
-- Date: 2026
-- ============================================================

-- ============================================================
-- 1. CRÉATION DE LA BASE ET EXTENSIONS
-- ============================================================

DROP DATABASE IF EXISTS dhis2_littoral_cameroun;
CREATE DATABASE dhis2_littoral_cameroun;
\c dhis2_littoral_cameroun;

CREATE EXTENSION IF NOT EXISTS postgis;
CREATE EXTENSION IF NOT EXISTS postgis_topology;
CREATE EXTENSION IF NOT EXISTS pg_cron;
CREATE EXTENSION IF NOT EXISTS hstore;
CREATE EXTENSION IF NOT EXISTS btree_gist;

-- ============================================================
-- 2. RÉFÉRENTIELS DE BASE AVEC SPÉCIFICITÉS LITTORAL
-- ============================================================

-- 2.1 Unités organisationnelles enrichies pour le Littoral
CREATE TABLE organisation_units (
    id_org_unit SERIAL PRIMARY KEY,
    code VARCHAR(50) UNIQUE NOT NULL,
    nom VARCHAR(200) NOT NULL,
    niveau INTEGER NOT NULL CHECK (niveau BETWEEN 1 AND 6),
    parent_id INTEGER REFERENCES organisation_units(id_org_unit),
    
    -- Découpage administratif sanitaire du Littoral
    region VARCHAR(50) DEFAULT 'Littoral',
    departement VARCHAR(50),
    arrondissement VARCHAR(50),
    district_sante VARCHAR(100),
    commune VARCHAR(100),
    quartier_ville VARCHAR(100),
    
    -- Types de structures (public/privé)
    type_structure VARCHAR(50),
    type_propriete VARCHAR(30) CHECK (type_propriete IN ('public', 'prive_confessionnel', 'prive_commercial', 'ppp', 'ong')),
    sous_type_prive VARCHAR(50) CHECK (sous_type_prive IN (
        'clinique_generale', 'cabinet_medical', 'pharmacie', 'laboratoire', 
        'radiologie', 'centre_dialyse', 'clinique_dentaire', 'center_maternite'
    )),
    
    -- Spécificités géographiques Littoral
    zone_eco VARCHAR(20) CHECK (zone_eco IN ('urbaine_dense', 'urbaine', 'peri_urbaine', 'rurale', 'lagunaire', 'inondable')),
    zone_inondable BOOLEAN DEFAULT FALSE,
    altitude_moyenne DECIMAL(6,2),
    accessibilite_saison VARCHAR(50) CHECK (accessibilite_saison IN ('toujours_accessible', 'saison_seche', 'saison_pluies', 'bateau')),
    
    -- Infrastructure
    capacite_lits INTEGER,
    capacite_urgence INTEGER,
    nombre_salles_consultation INTEGER,
    possede_imagerie BOOLEAN DEFAULT FALSE,
    possede_labo BOOLEAN DEFAULT FALSE,
    possede_pharmacie BOOLEAN DEFAULT FALSE,
    possede_ambulance BOOLEAN DEFAULT FALSE,
    nb_ambulances INTEGER DEFAULT 0,
    
    -- Géolocalisation
    coord_geographique GEOMETRY(POINT, 4326),
    zone_influence_km INTEGER DEFAULT 5,
    population_couverte INTEGER,
    
    -- Gestion
    date_agrement DATE,
    numero_agrement VARCHAR(50),
    convention_etat BOOLEAN DEFAULT FALSE,
    type_convention VARCHAR(30) CHECK (type_convention IN ('soins_curatifs', 'VIH_palu', 'maternite', 'urgencies', 'complete')),
    date_convention DATE,
    fin_convention DATE,
    
    -- Contact
    telephone VARCHAR(20),
    email VARCHAR(100),
    responsable VARCHAR(200),
    
    date_creation DATE DEFAULT CURRENT_DATE,
    actif BOOLEAN DEFAULT TRUE,
    metadata JSONB,
    
    FOREIGN KEY (parent_id) REFERENCES organisation_units(id_org_unit)
);

-- Index spécifiques Littoral
CREATE INDEX idx_org_units_geo ON organisation_units USING GIST (coord_geographique);
CREATE INDEX idx_org_units_district ON organisation_units(district_sante);
CREATE INDEX idx_org_units_propriete ON organisation_units(type_propriete, type_structure);
CREATE INDEX idx_org_units_inondable ON organisation_units(zone_inondable);
CREATE INDEX idx_org_units_convention ON organisation_units(convention_etat, type_convention);

-- 2.2 Agents de santé avec spécialisations
CREATE TABLE agents_sante (
    id_agent SERIAL PRIMARY KEY,
    matricule VARCHAR(50) UNIQUE NOT NULL,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    date_naissance DATE,
    sexe CHAR(1) CHECK (sexe IN ('M', 'F')),
    
    fonction VARCHAR(100),
    specialisation VARCHAR(100),
    grade VARCHAR(50),
    
    id_org_unit_affectation INTEGER REFERENCES organisation_units(id_org_unit),
    id_org_unit_principal INTEGER REFERENCES organisation_units(id_org_unit),
    
    telephone VARCHAR(20),
    telephone_urgence VARCHAR(20),
    email VARCHAR(100),
    
    type_contrat VARCHAR(30) CHECK (type_contrat IN ('fonctionnaire', 'contractuel', 'volontaire', 'prive')),
    date_embauche DATE,
    date_fin_contrat DATE,
    
    actif BOOLEAN DEFAULT TRUE,
    disponible_urgence BOOLEAN DEFAULT FALSE,
    
    CONSTRAINT fk_agent_affectation FOREIGN KEY (id_org_unit_affectation) REFERENCES organisation_units(id_org_unit),
    CONSTRAINT fk_agent_principal FOREIGN KEY (id_org_unit_principal) REFERENCES organisation_units(id_org_unit)
);

CREATE INDEX idx_agents_org ON agents_sante(id_org_unit_affectation);
CREATE INDEX idx_agents_fonction ON agents_sante(fonction);

-- 2.3 Partenaires et conventions public-privé
CREATE TABLE conventions_public_prive (
    id_convention SERIAL PRIMARY KEY,
    code_convention VARCHAR(50) UNIQUE NOT NULL,
    nom_convention VARCHAR(200) NOT NULL,
    
    id_org_public INTEGER REFERENCES organisation_units(id_org_unit),
    id_org_prive INTEGER REFERENCES organisation_units(id_org_unit),
    
    date_debut DATE NOT NULL,
    date_fin DATE,
    date_signature DATE,
    
    type_convention VARCHAR(50) CHECK (type_convention IN ('partenariat_soins', 'reference_evacuation', 'formation', 'supervision', 'donnees')),
    
    services_concernes TEXT[],
    tarifs_conventionnes JSONB,
    indicateurs_suivi JSONB,
    
    montant_annuel DECIMAL(15,2),
    modalites_paiement TEXT,
    
    responsable_public VARCHAR(200),
    responsable_prive VARCHAR(200),
    
    document_convention TEXT,
    actif BOOLEAN DEFAULT TRUE,
    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    UNIQUE(id_org_public, id_org_prive, type_convention)
);

-- 2.4 Zones de chalandise pour analyse concurrence/accès
CREATE TABLE zones_chalandise (
    id_zone SERIAL PRIMARY KEY,
    id_org_unit INTEGER REFERENCES organisation_units(id_org_unit),
    nom_zone VARCHAR(200),
    
    zone_geographique GEOMETRY(POLYGON, 4326),
    rayon_km INTEGER,
    
    population_estimee INTEGER,
    menages_estimes INTEGER,
    
    quartiers_couverts TEXT[],
    
    temps_acces_moyen_minutes INTEGER,
    moyen_acces_principal VARCHAR(50) CHECK (moyen_acces_principal IN ('voiture', 'moto', 'bateau', 'pied', 'transport_commun')),
    
    concurrence_directe TEXT[], -- IDs des structures concurrentes
    taux_couverture_estime DECIMAL(5,2),
    
    date_analyse DATE DEFAULT CURRENT_DATE,
    metadata JSONB,
    
    CONSTRAINT fk_chalandise_org FOREIGN KEY (id_org_unit) REFERENCES organisation_units(id_org_unit)
);

CREATE INDEX idx_chalandise_geo ON zones_chalandise USING GIST (zone_geographique);
CREATE INDEX idx_chalandise_org ON zones_chalandise(id_org_unit);

-- 2.5 Indicateurs avec désagrégation Littoral
CREATE TABLE data_elements (
    id_data_element SERIAL PRIMARY KEY,
    code VARCHAR(100) UNIQUE NOT NULL,
    nom VARCHAR(255) NOT NULL,
    description TEXT,
    type_donnee VARCHAR(20) CHECK (type_donnee IN ('integer', 'decimal', 'boolean', 'text', 'percentage')),
    unite_mesure VARCHAR(50),
    
    formule_calcul TEXT,
    seuil_alerte INTEGER,
    seuil_epidemique INTEGER,
    seuil_critique INTEGER,
    
    categorie_principale VARCHAR(20) CHECK (categorie_principale IN ('sexe', 'groupe_age', 'socio_pro', 'quartier', 'aucun')),
    
    public_cible BOOLEAN DEFAULT TRUE,
    prive_cible BOOLEAN DEFAULT TRUE,
    
    actif BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2.6 Options de catégories enrichies
CREATE TABLE category_options (
    id_category SERIAL PRIMARY KEY,
    code VARCHAR(50) UNIQUE NOT NULL,
    nom VARCHAR(100) NOT NULL,
    type_categorie VARCHAR(50) CHECK (type_categorie IN ('sexe', 'groupe_age', 'socio_pro', 'quartier', 'type_prise_charge', 'zone_geo')),
    ordre INTEGER DEFAULT 0
);

-- Insertion des catégories pour Littoral
INSERT INTO category_options (code, nom, type_categorie, ordre) VALUES
-- Sexe
('M', 'Masculin', 'sexe', 1),
('F', 'Féminin', 'sexe', 2),
-- Groupes d'âge
('0-5', 'Moins de 5 ans', 'groupe_age', 1),
('5-15', '5 à 15 ans', 'groupe_age', 2),
('15-60', '15 à 60 ans', 'groupe_age', 3),
('60+', '60 ans et plus', 'groupe_age', 4),
-- Statut socio-professionnel spécifique Littoral
('OUVRIER', 'Ouvrier zone industrielle', 'socio_pro', 1),
('PORTUAIRE', 'Travailleur portuaire', 'socio_pro', 2),
('COMMERCANT', 'Commerçant', 'socio_pro', 3),
('FONCTIONNAIRE', 'Fonctionnaire', 'socio_pro', 4),
('SANS_EMPLOI', 'Sans emploi', 'socio_pro', 5),
('POISSONNERIE', 'Secteur pêche/poissonnerie', 'socio_pro', 6),
-- Quartiers prioritaires Douala
('NDOKOTI', 'Ndogbong', 'quartier', 1),
('BONABERI', 'Bonabéri', 'quartier', 2),
('BONGO', 'Bongo', 'quartier', 3),
('MAKEPE', 'Makepe', 'quartier', 4),
('AKWA', 'Akwa', 'quartier', 5),
('DEIDO', 'Deido', 'quartier', 6),
('BEPANDA', 'Bépanda', 'quartier', 7),
('CITE_SIC', 'Cité SIC', 'quartier', 8),
-- Prise en charge
('CNPS', 'CNPS', 'type_prise_charge', 1),
('MUTUELLE', 'Mutuelle', 'type_prise_charge', 2),
('PRIVE', 'Privé direct', 'type_prise_charge', 3),
('ETAT', 'Prise en charge Etat', 'type_prise_charge', 4),
('ONG', 'ONG', 'type_prise_charge', 5),
-- Zones géographiques Littoral
('URBAIN_DENSE', 'Urbain dense', 'zone_geo', 1),
('URBAIN', 'Urbain', 'zone_geo', 2),
('PERI_URBAIN', 'Péri-urbain', 'zone_geo', 3),
('LAGUNAIRE', 'Zone lagunaire', 'zone_geo', 4),
('RURAL', 'Rural', 'zone_geo', 5);

-- 2.7 Liaison data_elements-catégories
CREATE TABLE data_element_categories (
    id_data_element INTEGER REFERENCES data_elements(id_data_element),
    id_category INTEGER REFERENCES category_options(id_category),
    obligatoire BOOLEAN DEFAULT FALSE,
    PRIMARY KEY (id_data_element, id_category)
);

-- ============================================================
-- 3. CIRCUIT AGRÉGÉ POUR REMONTÉES MENSUELLES
-- ============================================================

CREATE TABLE datavalues_agregats (
    id_datavalue SERIAL PRIMARY KEY,
    id_data_element INTEGER NOT NULL REFERENCES data_elements(id_data_element),
    id_org_unit INTEGER NOT NULL REFERENCES organisation_units(id_org_unit),
    date_debut DATE NOT NULL,
    date_fin DATE NOT NULL,
    type_periode VARCHAR(20) CHECK (type_periode IN ('weekly', 'monthly', 'quarterly', 'yearly')),
    valeur_numerique DECIMAL(15,2),
    valeur_texte TEXT,
    id_category INTEGER REFERENCES category_options(id_category),
    
    source_donnee VARCHAR(30) CHECK (source_donnee IN ('saisie_manuelle', 'aggregation_auto', 'import_csv', 'api')),
    utilisateur_saisie INTEGER REFERENCES agents_sante(id_agent),
    date_saisie TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    valide_superviseur BOOLEAN DEFAULT FALSE,
    id_superviseur_validateur INTEGER REFERENCES agents_sante(id_agent),
    date_validation DATE,
    niveau_validation INTEGER CHECK (niveau_validation BETWEEN 1 AND 4),
    
    commentaire TEXT,
    metadata JSONB,
    
    CONSTRAINT unique_agregat UNIQUE (id_data_element, id_org_unit, date_debut, date_fin, id_category)
);

CREATE INDEX idx_agregats_element ON datavalues_agregats(id_data_element);
CREATE INDEX idx_agregats_org ON datavalues_agregats(id_org_unit);
CREATE INDEX idx_agregats_periode ON datavalues_agregats(date_debut, date_fin);
CREATE INDEX idx_agregats_validation ON datavalues_agregats(valide_superviseur, niveau_validation);

-- ============================================================
-- 4. CIRCUIT ÉVÉNEMENTIEL AVEC GESTION FINANCIÈRE (HÔPITAUX)
-- ============================================================

-- 4.1 Patients avec infos socio-économiques Littoral
CREATE TABLE patients (
    id_patient SERIAL PRIMARY KEY,
    code_patient VARCHAR(50) UNIQUE NOT NULL,
   -- nom VARCHAR(100) NOT NULL,
   -- prenom VARCHAR(100) NOT NULL,
    nin VARCHAR(20) UNIQUE,
    
    date_naissance DATE,
    age_ans INTEGER,
    sexe CHAR(1) CHECK (sexe IN ('M', 'F')),
    
  --  telephone VARCHAR(20),
   -- telephone_urgence VARCHAR(20),
    email VARCHAR(100),
    personne_a_contacter VARCHAR(200),
    
    -- Adresse Littoral
    region VARCHAR(50) DEFAULT 'Littoral',
    departement VARCHAR(50),
    arrondissement VARCHAR(50),
    commune VARCHAR(50),
    quartier VARCHAR(50),
    adresse_detail TEXT,
    
    profession VARCHAR(100),
    statut_socio_pro VARCHAR(50),
    niveau_education VARCHAR(50),
    
    mutuelle VARCHAR(100),
    numero_mutuelle VARCHAR(50),
    type_prise_charge_defaut VARCHAR(30),
    
    id_org_unit_attachement INTEGER REFERENCES organisation_units(id_org_unit),
    
    maladies_chroniques TEXT[],
    allergies TEXT[],
    groupe_sanguin VARCHAR(3),
    
    coord_domicile GEOMETRY(POINT, 4326),
    zone_residence VARCHAR(50),
    distance_csi_km DECIMAL(5,2),
    
    statut_vital BOOLEAN DEFAULT TRUE,
    date_deces DATE,
    cause_deces VARCHAR(255),
    
    date_enregistrement TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    date_derniere_modification TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    metadata JSONB
);

CREATE INDEX idx_patients_geo ON patients USING GIST (coord_domicile);
CREATE INDEX idx_patients_attachement ON patients(id_org_unit_attachement);
CREATE INDEX idx_patients_quartier ON patients(quartier);
CREATE INDEX idx_patients_mutuelle ON patients(mutuelle, numero_mutuelle);

-- 4.2 Prises en charge financières
CREATE TABLE prises_en_charge_financieres (
    id_prise_charge SERIAL PRIMARY KEY,
    code_prise_charge VARCHAR(50) UNIQUE NOT NULL,
    
    id_patient INTEGER NOT NULL REFERENCES patients(id_patient),
    id_event INTEGER, -- Sera lié après création de events_cliniques
    
    type_prise_charge VARCHAR(30) CHECK (type_prise_charge IN ('CNPS', 'MUTUELLE', 'PRIVE', 'ETAT', 'ONG', 'AIDE_HUMANITAIRE')),
    organisme_prise_charge VARCHAR(200),
    numero_autorisation VARCHAR(100),
    
    date_autorisation DATE,
    date_debut_validite DATE,
    date_fin_validite DATE,
    
    montant_total_estime DECIMAL(15,2),
    montant_pris_en_charge DECIMAL(15,2),
    montant_restant_pris_charge DECIMAL(15,2) GENERATED ALWAYS AS (montant_total_estime - montant_pris_en_charge) STORED,
    pourcentage_prise_charge DECIMAL(5,2),
    
    reste_charge_patient DECIMAL(15,2),
    statut_paiement VARCHAR(30) DEFAULT 'en_attente' CHECK (statut_paiement IN ('en_attente', 'partiel', 'complet', 'impaye', 'rembourse')),
    
    conditions_particulieres TEXT,
    fichier_convention TEXT,
    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    valide_par INTEGER REFERENCES agents_sante(id_agent)
);

-- 4.3 Facturation hospitalière
CREATE TABLE factures_hopital (
    id_facture SERIAL PRIMARY KEY,
    numero_facture VARCHAR(50) UNIQUE NOT NULL,
    numero_dossier VARCHAR(50),
    
    id_patient INTEGER REFERENCES patients(id_patient),
    id_org_unit INTEGER REFERENCES organisation_units(id_org_unit),
    id_prise_charge INTEGER REFERENCES prises_en_charge_financieres(id_prise_charge),
    
    date_emission DATE NOT NULL,
    date_echeance DATE,
    date_paiement DATE,
    
    sous_total DECIMAL(15,2) NOT NULL,
    remise DECIMAL(15,2) DEFAULT 0,
    taxe DECIMAL(15,2) DEFAULT 0,
    montant_total DECIMAL(15,2) GENERATED ALWAYS AS (sous_total - remise + taxe) STORED,
    
    montant_paye DECIMAL(15,2) DEFAULT 0,
    montant_restant DECIMAL(15,2) GENERATED ALWAYS AS (montant_total - montant_paye) STORED,
    
    etat_facture VARCHAR(30) DEFAULT 'emise' CHECK (etat_facture IN ('emise', 'partielle', 'payee', 'impayee', 'annulee', 'contentieuse')),
    mode_paiement VARCHAR(30) CHECK (mode_paiement IN ('especes', 'carte', 'virement', 'cheque', 'CNPS', 'mutuelle')),
    
    lignes_facture JSONB,
    
    created_by INTEGER REFERENCES agents_sante(id_agent),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_factures_patient ON factures_hopital(id_patient);
CREATE INDEX idx_factures_date ON factures_hopital(date_emission, date_echeance);
CREATE INDEX idx_factures_etat ON factures_hopital(etat_facture);

-- 4.4 Événements cliniques avec données terrain
CREATE TABLE events_cliniques (
    id_event SERIAL PRIMARY KEY,
    numero_dossier VARCHAR(50),
    
    id_patient INTEGER NOT NULL REFERENCES patients(id_patient),
    id_org_unit INTEGER NOT NULL REFERENCES organisation_units(id_org_unit),
    id_prise_charge INTEGER REFERENCES prises_en_charge_financieres(id_prise_charge),
    
    date_event TIMESTAMP NOT NULL,
    date_fin_event TIMESTAMP, -- Pour hospitalisations
    
    type_event VARCHAR(50) CHECK (type_event IN (
        'consultation', 'consultation_urgence', 'hospitalisation', 
        'vaccination', 'dispensation', 'examen_labo', 'alerte', 
        'transfert', 'accouchement', 'chirurgie'
    )),
    
    motif_consultation TEXT,
    symptomes TEXT,
    temperature DECIMAL(3,1),
    pression_arterielle VARCHAR(20),
    poids DECIMAL(5,2),
    taille DECIMAL(3,2),
    imc DECIMAL(4,1),
    rythme_cardiaque INTEGER,
    saturation_oxygene INTEGER,
    
    diagnostic_principal VARCHAR(255),
    diagnostic_cim10 VARCHAR(10),
    diagnostics_secondaires TEXT[],
    
    traitement_prescrit TEXT,
    medicaments_prescrits JSONB,
    
    medecin_responsable INTEGER REFERENCES agents_sante(id_agent),
    infirmier_prise_en_charge INTEGER REFERENCES agents_sante(id_agent),
    
    statut_event VARCHAR(20) DEFAULT 'enregistre' CHECK (statut_event IN ('enregistre', 'confirme', 'en_cours', 'cloture', 'annule', 'transfere')),
    
    date_saisie TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    utilisateur_saisie INTEGER REFERENCES agents_sante(id_agent),
    
    coord_event GEOMETRY(POINT, 4326),
    zone_geo_intervention VARCHAR(50),
    
    -- Pour transferts entre structures (public-privé)
    id_event_transfert_source INTEGER REFERENCES events_cliniques(id_event),
    id_org_unit_destination INTEGER REFERENCES organisation_units(id_org_unit),
    motif_transfert TEXT,
    accord_transfert BOOLEAN DEFAULT FALSE,
    date_transfert TIMESTAMP,
    
    cout_total_estime DECIMAL(15,2),
    cout_reel DECIMAL(15,2),
    
    metadata JSONB,
    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Mise à jour de la référence dans prises_en_charge après création de events_cliniques
ALTER TABLE prises_en_charge_financieres ADD CONSTRAINT fk_pc_event FOREIGN KEY (id_event) REFERENCES events_cliniques(id_event);

CREATE INDEX idx_events_patient ON events_cliniques(id_patient);
CREATE INDEX idx_events_date ON events_cliniques(date_event);
CREATE INDEX idx_events_type ON events_cliniques(type_event);
CREATE INDEX idx_events_diagnostic ON events_cliniques(diagnostic_cim10, date_event);
CREATE INDEX idx_events_geo ON events_cliniques USING GIST (coord_event);
CREATE INDEX idx_events_org ON events_cliniques(id_org_unit);
CREATE INDEX idx_events_transfert ON events_cliniques(id_event_transfert_source);
CREATE INDEX idx_events_statut ON events_cliniques(statut_event);

-- 4.5 Détails des actes par événement
CREATE TABLE event_actes (
    id_acte SERIAL PRIMARY KEY,
    id_event INTEGER REFERENCES events_cliniques(id_event),
    code_acte VARCHAR(50),
    libelle_acte VARCHAR(200),
    quantite INTEGER DEFAULT 1,
    prix_unitaire DECIMAL(10,2),
    montant_total DECIMAL(10,2),
    remboursable BOOLEAN DEFAULT TRUE,
    code_CCAM VARCHAR(20), -- Classification Commune des Actes Médicaux
    metadata JSONB
);

-- 4.6 Mesures spécifiques (data elements en événementiel)
CREATE TABLE event_measures (
    id_event INTEGER REFERENCES events_cliniques(id_event),
    id_data_element INTEGER REFERENCES data_elements(id_data_element),
    valeur_numerique DECIMAL(10,2),
    valeur_texte TEXT,
    date_mesure TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id_event, id_data_element)
);

-- ============================================================
-- 5. MALADIES PRIORITAIRES ET ALERTES ÉPIDÉMIQUES LITTORAL
-- ============================================================

CREATE TABLE maladies_prioritaires (
    id_maladie SERIAL PRIMARY KEY,
    code_cim10 VARCHAR(10) UNIQUE NOT NULL,
    nom_maladie VARCHAR(150) NOT NULL,
    type_maladie VARCHAR(50) CHECK (type_maladie IN ('epidemique', 'chronique', 'tropicale_negligee', 'vecrorielle')),
    
    declaration_obligatoire BOOLEAN DEFAULT TRUE,
    declaration_hebdomadaire BOOLEAN DEFAULT FALSE,
    
    seuil_alerte_cas INTEGER,
    seuil_epidemique_cas INTEGER,
    seuil_critique INTEGER,
    
    duree_incubation_jours INTEGER,
    duree_contagiosite_jours INTEGER,
    
    symptomes_caracteristiques TEXT,
    traitement_recommande TEXT,
    vaccination_existe BOOLEAN DEFAULT FALSE,
    
    zones_risque_littoral TEXT[],
    
    notification_minsante BOOLEAN DEFAULT TRUE,
    delai_notification_heures INTEGER DEFAULT 24,
    
    actif BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insertion des maladies prioritaires pour Littoral
INSERT INTO maladies_prioritaires (code_cim10, nom_maladie, type_maladie, seuil_alerte_cas, seuil_epidemique_cas, zones_risque_littoral) VALUES
('A00', 'Choléra', 'epidemique', 1, 3, ARRAY['Bonabéri', 'Ndogbong', 'Zone portuaire']),
('A90', 'Dengue', 'vecrorielle', 2, 10, ARRAY['Bépanda', 'Deido', 'Makepe']),
('B50', 'Paludisme sévère', 'vecrorielle', 15, 50, ARRAY['Zone lagunaire', 'Ndogbong', 'Bongo']),
('U07', 'COVID-19', 'epidemique', 5, 20, ARRAY['Tous quartiers']),
('B20', 'VIH/SIDA', 'chronique', NULL, NULL, ARRAY['Zone industrielle', 'Port']),
('A95', 'Fièvre jaune', 'vecrorielle', 1, 1, ARRAY['Zone rurale Littoral']);

CREATE TABLE alertes_epidemiques (
    id_alerte SERIAL PRIMARY KEY,
    code_alerte VARCHAR(50) UNIQUE,
    
    id_maladie INTEGER NOT NULL REFERENCES maladies_prioritaires(id_maladie),
    id_org_unit INTEGER NOT NULL REFERENCES organisation_units(id_org_unit),
    
    date_alerte TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    date_debut_symptomes DATE,
    date_premier_cas DATE,
    
    nb_cas_suspects INTEGER NOT NULL DEFAULT 0,
    nb_cas_confirmes INTEGER DEFAULT 0,
    nb_cas_probables INTEGER DEFAULT 0,
    nb_deces INTEGER DEFAULT 0,
    nb_gueris INTEGER DEFAULT 0,
    
    taux_letalite DECIMAL(5,2),
    
    niveau_alerte VARCHAR(20) CHECK (niveau_alerte IN ('vigilance', 'alerte', 'epidemie', 'pandemie', 'catastrophe_sanitaire')),
    
    statut_alerte VARCHAR(20) DEFAULT 'active' CHECK (statut_alerte IN ('active', 'investiguee', 'cloturee', 'confirmee')),
    
    investigation_realisee BOOLEAN DEFAULT FALSE,
    rapport_investigation TEXT,
    
    action_prise TEXT,
    mesures_pees TEXT[],
    
    date_cloture DATE,
    rapport_final TEXT,
    
    notifie_minsante BOOLEAN DEFAULT FALSE,
    date_notification DATE,
    notifie_oms BOOLEAN DEFAULT FALSE,
    
    coord_alerte GEOMETRY(POINT, 4326),
    rayon_alerte_km DECIMAL(8,2),
    zone_influence GEOMETRY(POLYGON, 4326),
    
    population_exposee INTEGER,
    menages_exposes INTEGER,
    
    source_information VARCHAR(100),
    declare_par INTEGER REFERENCES agents_sante(id_agent),
    
    metadata JSONB,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE alertes_events_trigger (
    id_alerte INTEGER REFERENCES alertes_epidemiques(id_alerte),
    id_event INTEGER REFERENCES events_cliniques(id_event),
    date_liaison TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id_alerte, id_event)
);

CREATE INDEX idx_alertes_maladie ON alertes_epidemiques(id_maladie, date_alerte);
CREATE INDEX idx_alertes_geo ON alertes_epidemiques USING GIST (coord_alerte);
CREATE INDEX idx_alertes_zone ON alertes_epidemiques USING GIST (zone_influence);
CREATE INDEX idx_alertes_statut ON alertes_epidemiques(statut_alerte, niveau_alerte);

-- ============================================================
-- 6. CIRCUIT DU MÉDICAMENT AVEC SUIVI RUPTURES
-- ============================================================

CREATE TABLE medicaments (
    id_medicament SERIAL PRIMARY KEY,
    code_cip VARCHAR(20) UNIQUE NOT NULL,
    code_atc VARCHAR(20),
    nom_commercial VARCHAR(150) NOT NULL,
    dci VARCHAR(150),
    forme VARCHAR(50),
    dosage VARCHAR(50),
    presentation VARCHAR(100),
    
    prix_unitaire DECIMAL(10,2),
    prix_CNPS DECIMAL(10,2),
    remboursable BOOLEAN DEFAULT TRUE,
    taux_remboursement DECIMAL(3,2),
    
    stock_seuil_alerte INTEGER,
    stock_seuil_rupture INTEGER,
    stock_seuil_securite INTEGER,
    delai_approvisionnement_jours INTEGER,
    
    fabricant VARCHAR(200),
    pays_origine VARCHAR(100),
    
    liste_essentielle_oms BOOLEAN DEFAULT FALSE,
    liste_essentielle_cameroun BOOLEAN DEFAULT TRUE,
    
    temperature_stockage_min DECIMAL(4,1),
    temperature_stockage_max DECIMAL(4,1),
    
    actif BOOLEAN DEFAULT TRUE,
    metadata JSONB,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE inventaires_medicaments (
    id_inventaire SERIAL PRIMARY KEY,
    id_medicament INTEGER REFERENCES medicaments(id_medicament),
    id_org_unit INTEGER REFERENCES organisation_units(id_org_unit),
    
    date_inventaire DATE NOT NULL,
    date_peremption DATE,
    
    quantite_disponible INTEGER NOT NULL DEFAULT 0,
    quantite_theorique INTEGER,
    ecart_quantite INTEGER,
    
    quantite_utilisee_mois INTEGER,
    quantite_perdue INTEGER,
    quantite_retournee INTEGER,
    quantite_transferee INTEGER,
    
    lot VARCHAR(50),
    numero_facture_achat VARCHAR(100),
    
    prix_achat DECIMAL(10,2),
    prix_vente DECIMAL(10,2),
    
    fournisseur VARCHAR(200),
    
    utilisateur_saisie INTEGER REFERENCES agents_sante(id_agent),
    controle_par INTEGER REFERENCES agents_sante(id_agent),
    
    statut_inventaire VARCHAR(30) DEFAULT 'brouillon',
    valide BOOLEAN DEFAULT FALSE,
    
    commentaire TEXT,
    metadata JSONB,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT fk_inventaire_medicament FOREIGN KEY (id_medicament) REFERENCES medicaments(id_medicament),
    CONSTRAINT fk_inventaire_org FOREIGN KEY (id_org_unit) REFERENCES organisation_units(id_org_unit)
);

CREATE INDEX idx_inventaires_org ON inventaires_medicaments(id_org_unit, date_inventaire);
CREATE INDEX idx_inventaires_medicament ON inventaires_medicaments(id_medicament);
CREATE INDEX idx_inventaires_peremption ON inventaires_medicaments(date_peremption);

-- 6.1 Alertes de rupture de stock
CREATE TABLE alertes_rupture_stock (
    id_alerte_rupture SERIAL PRIMARY KEY,
    id_medicament INTEGER REFERENCES medicaments(id_medicament),
    id_org_unit INTEGER REFERENCES organisation_units(id_org_unit),
    date_alerte TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    quantite_actuelle INTEGER,
    seuil_alerte INTEGER,
    niveau_urgence VARCHAR(20) CHECK (niveau_urgence IN ('alerte', 'rupture_imminente', 'rupture')),
    statut VARCHAR(20) DEFAULT 'active',
    date_resolution DATE,
    action_prise TEXT,
    notifie_district BOOLEAN DEFAULT FALSE,
    CONSTRAINT fk_alerte_medicament FOREIGN KEY (id_medicament) REFERENCES medicaments(id_medicament)
);

-- ============================================================
-- 7. REMONTÉES TERRAIN ET SUPERVISION
-- ============================================================

CREATE TABLE remontees_terrain (
    id_remontee SERIAL PRIMARY KEY,
    code_remontee VARCHAR(50) UNIQUE,
    
    id_org_unit INTEGER NOT NULL REFERENCES organisation_units(id_org_unit),
    
    date_remontee DATE NOT NULL,
    type_rapport VARCHAR(50) CHECK (type_rapport IN ('hebdomadaire', 'mensuel', 'trimestriel', 'urgence', 'flash', 'epidemiologique')),
    semaine_epidemiologique INTEGER,
    
    resume TEXT,
    
    nb_consultations INTEGER DEFAULT 0,
    nb_consultations_urgence INTEGER DEFAULT 0,
    nb_hospitalisations INTEGER DEFAULT 0,
    nb_accouchements INTEGER DEFAULT 0,
    nb_deces_hopital INTEGER DEFAULT 0,
    duree_sejour_moyenne DECIMAL(4,1),
    
    nb_cesariennes INTEGER DEFAULT 0,
    nb_evacuations_referees INTEGER DEFAULT 0,
    nb_evacuations_recues INTEGER DEFAULT 0,
    
    rupture_stock TEXT[],
    defis_rencontres TEXT,
    besoins_ressources TEXT,
    recommandations TEXT,
    
    id_agent_rapporteur INTEGER REFERENCES agents_sante(id_agent),
    date_saisie TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    valide_chef_service BOOLEAN DEFAULT FALSE,
    id_validateur INTEGER REFERENCES agents_sante(id_agent),
    date_validation DATE,
    niveau_validation INTEGER,
    
    coord_remontee GEOMETRY(POINT, 4326),
    id_alerte_associee INTEGER REFERENCES alertes_epidemiques(id_alerte),
    
    partage_public_prive BOOLEAN DEFAULT FALSE,
    id_org_partage_dest INTEGER REFERENCES organisation_units(id_org_unit),
    
    metadata JSONB,
    
    CONSTRAINT fk_remontee_org FOREIGN KEY (id_org_unit) REFERENCES organisation_units(id_org_unit)
);

CREATE INDEX idx_remontees_org ON remontees_terrain(id_org_unit, date_remontee);
CREATE INDEX idx_remontees_type ON remontees_terrain(type_rapport, date_remontee);
CREATE INDEX idx_remontees_validation ON remontees_terrain(valide_chef_service);

-- ============================================================
-- 8. PARTAGE DE DONNÉES PUBLIC-PRIVÉ
-- ============================================================

CREATE TABLE flux_donnees_public_prive (
    id_flux SERIAL PRIMARY KEY,
    code_flux VARCHAR(50) UNIQUE,
    
    id_donnee_source INTEGER, -- Peut être id_event, id_agregat, etc.
    type_donnee VARCHAR(30) CHECK (type_donnee IN ('event_clinique', 'agregat', 'alerte', 'inventaire', 'patient')),
    
    id_org_source INTEGER REFERENCES organisation_units(id_org_unit),
    id_org_dest INTEGER REFERENCES organisation_units(id_org_unit),
    
    date_flux TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    perimetre_donnees JSONB,
    
    base_convention INTEGER REFERENCES conventions_public_prive(id_convention),
    autorise BOOLEAN DEFAULT FALSE,
    date_autorisation DATE,
    autorisation_par INTEGER REFERENCES agents_sante(id_agent),
    
    duree_validite_jours INTEGER DEFAULT 30,
    date_expiration DATE,
    
    requete_sql TEXT,
    resultat_hash VARCHAR(64),
    taille_donnees INTEGER,
    
    statut_flux VARCHAR(30) DEFAULT 'demande',
    date_transfert DATE,
    accord_ciline BOOLEAN DEFAULT FALSE,
    
    commentaire TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================
-- 9. WORKFLOW DE VALIDATION MULTI-NIVEAUX
-- ============================================================

CREATE TABLE workflow_validation (
    id_validation SERIAL PRIMARY KEY,
    id_datavalue INTEGER REFERENCES datavalues_agregats(id_datavalue),
    id_remontee INTEGER REFERENCES remontees_terrain(id_remontee),
    
    niveau_validation INTEGER CHECK (niveau_validation IN (1,2,3,4)),
    -- 1: CSI, 2: District, 3: Région, 4: National
    
    id_validateur INTEGER REFERENCES agents_sante(id_agent),
    statut VARCHAR(20) CHECK (statut IN ('soumis', 'valide', 'rejete', 'corrige', 'en_attente')),
    commentaire VARCHAR(500),
    
    date_soumission TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    date_validation TIMESTAMP,
    
    metadata JSONB
);

CREATE INDEX idx_workflow_datavalue ON workflow_validation(id_datavalue);
CREATE INDEX idx_workflow_remontee ON workflow_validation(id_remontee);
CREATE INDEX idx_workflow_statut ON workflow_validation(statut, niveau_validation);

-- ============================================================
-- 10. FONCTIONS ET TRIGGERS AUTOMATISÉS
-- ============================================================

-- 10.1 Mise à jour automatique de l'âge des patients
CREATE OR REPLACE FUNCTION update_patient_age()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.date_naissance IS NOT NULL THEN
        NEW.age_ans := EXTRACT(YEAR FROM age(CURRENT_DATE, NEW.date_naissance));
    END IF;
    NEW.date_derniere_modification := CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_patient_age
BEFORE INSERT OR UPDATE ON patients
FOR EACH ROW
EXECUTE FUNCTION update_patient_age();

-- 10.2 Calcul automatique des montants de facture
CREATE OR REPLACE FUNCTION calculate_invoice_total()
RETURNS TRIGGER AS $$
BEGIN
    NEW.montant_total := NEW.sous_total - NEW.remise + NEW.taxe;
    IF NEW.montant_paye >= NEW.montant_total THEN
        NEW.etat_facture := 'payee';
    ELSIF NEW.montant_paye > 0 THEN
        NEW.etat_facture := 'partielle';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_invoice_calculation
BEFORE INSERT OR UPDATE ON factures_hopital
FOR EACH ROW
EXECUTE FUNCTION calculate_invoice_total();

-- 10.3 Aggrégation automatique des événements
CREATE OR REPLACE FUNCTION agreguer_events_vers_datavalues()
RETURNS TRIGGER AS $$
DECLARE
    v_debut DATE;
    v_fin DATE;
    v_data_element RECORD;
    v_valeur INTEGER;
BEGIN
    v_debut := date_trunc('month', NEW.date_event)::DATE;
    v_fin := (date_trunc('month', NEW.date_event) + INTERVAL '1 month - 1 day')::DATE;
    
    FOR v_data_element IN 
        SELECT DISTINCT id_data_element FROM event_measures WHERE id_event = NEW.id_event
    LOOP
        SELECT COUNT(*) INTO v_valeur
        FROM events_cliniques e
        JOIN event_measures em ON e.id_event = em.id_event
        WHERE e.id_org_unit = NEW.id_org_unit
          AND e.date_event BETWEEN v_debut AND v_fin
          AND em.id_data_element = v_data_element.id_data_element;
        
        INSERT INTO datavalues_agregats (
            id_data_element, id_org_unit, date_debut, date_fin, type_periode,
            valeur_numerique, utilisateur_saisie, source_donnee
        ) VALUES (
            v_data_element.id_data_element, NEW.id_org_unit, v_debut, v_fin, 'monthly',
            v_valeur, NEW.utilisateur_saisie, 'aggregation_auto'
        ) ON CONFLICT (id_data_element, id_org_unit, date_debut, date_fin, id_category)
        DO UPDATE SET valeur_numerique = EXCLUDED.valeur_numerique;
    END LOOP;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_aggregation_events
AFTER INSERT ON events_cliniques
FOR EACH ROW
EXECUTE FUNCTION agreguer_events_vers_datavalues();

-- 10.4 Détection automatique des alertes de rupture de stock
CREATE OR REPLACE FUNCTION check_stock_rupture()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.quantite_disponible <= (
        SELECT stock_seuil_alerte FROM medicaments WHERE id_medicament = NEW.id_medicament
    ) THEN
        INSERT INTO alertes_rupture_stock (
            id_medicament, id_org_unit, quantite_actuelle, seuil_alerte,
            niveau_urgence, notifie_district
        ) VALUES (
            NEW.id_medicament, NEW.id_org_unit, NEW.quantite_disponible,
            (SELECT stock_seuil_alerte FROM medicaments WHERE id_medicament = NEW.id_medicament),
            CASE 
                WHEN NEW.quantite_disponible <= (SELECT stock_seuil_rupture FROM medicaments WHERE id_medicament = NEW.id_medicament) 
                THEN 'rupture'
                ELSE 'alerte'
            END,
            TRUE
        );
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_stock_alerte
AFTER INSERT OR UPDATE ON inventaires_medicaments
FOR EACH ROW
WHEN (NEW.quantite_disponible <= (SELECT stock_seuil_alerte FROM medicaments WHERE id_medicament = NEW.id_medicament))
EXECUTE FUNCTION check_stock_rupture();

-- 10.5 Détection épidémique planifiée (horaire)
CREATE OR REPLACE FUNCTION detecter_alertes_epidemiques_littoral()
RETURNS void AS $$
DECLARE
    v_maladie RECORD;
    v_org RECORD;
    v_nb_cas INTEGER;
    v_alerte_id INTEGER;
BEGIN
    FOR v_maladie IN 
        SELECT id_maladie, code_cim10, nom_maladie, seuil_alerte_cas, seuil_epidemique_cas
        FROM maladies_prioritaires
        WHERE actif = TRUE AND declaration_obligatoire = TRUE
    LOOP
        FOR v_org IN
            SELECT id_org_unit, district_sante, zone_inondable, coord_geographique
            FROM organisation_units 
            WHERE actif = TRUE AND region = 'Littoral'
        LOOP
            SELECT COUNT(*) INTO v_nb_cas
            FROM events_cliniques
            WHERE diagnostic_cim10 = v_maladie.code_cim10
              AND date_event >= CURRENT_DATE - INTERVAL '7 days'
              AND id_org_unit = v_org.id_org_unit;
            
            IF v_nb_cas >= v_maladie.seuil_alerte_cas THEN
                INSERT INTO alertes_epidemiques (
                    code_alerte, id_maladie, id_org_unit, nb_cas_suspects,
                    niveau_alerte, coord_alerte, rayon_alerte_km, 
                    notifie_minsante, zone_influence
                ) VALUES (
                    'ALERT-' || v_maladie.code_cim10 || '-' || v_org.id_org_unit || '-' || to_char(CURRENT_DATE, 'YYYYMMDD'),
                    v_maladie.id_maladie, v_org.id_org_unit, v_nb_cas,
                    CASE 
                        WHEN v_nb_cas >= v_maladie.seuil_epidemique_cas THEN 'epidemie'
                        WHEN v_nb_cas >= v_maladie.seuil_alerte_cas THEN 'alerte'
                        ELSE 'vigilance'
                    END,
                    v_org.coord_geographique, 
                    CASE WHEN v_org.zone_inondable THEN 15 ELSE 10 END,
                    TRUE,
                    ST_Buffer(v_org.coord_geographique::geography, 5000)::geometry
                ) ON CONFLICT DO NOTHING;
            END IF;
        END LOOP;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

-- Planification toutes les heures pour le Littoral
SELECT cron.schedule('detect-epidemics-littoral', '0 * * * *', 'SELECT detecter_alertes_epidemiques_littoral();');

-- ============================================================
-- 11. VUES DE SYNTHÈSE POUR LE LITTORAL
-- ============================================================

-- 11.1 Vue tableau de bord districts Littoral
CREATE OR REPLACE VIEW vue_suivi_district_littoral AS
SELECT 
    ou.district_sante,
    ou.commune,
    ou.nom AS structure_nom,
    ou.type_propriete,
    ou.type_structure,
    ou.convention_etat,
    COUNT(DISTINCT p.id_patient) as total_patients_actifs,
    COUNT(DISTINCT ec.id_event) as total_consultations_mois,
    SUM(CASE WHEN ec.type_event = 'hospitalisation' THEN 1 ELSE 0 END) as hospitalisations,
    AVG(f.montant_total) as panier_moyen,
    SUM(CASE WHEN ec.diagnostic_cim10 IN ('B50', 'A00') THEN 1 ELSE 0 END) as cas_maladies_prioritaires
FROM organisation_units ou
LEFT JOIN patients p ON p.id_org_unit_attachement = ou.id_org_unit
LEFT JOIN events_cliniques ec ON ec.id_org_unit = ou.id_org_unit 
    AND ec.date_event >= date_trunc('month', CURRENT_DATE)
LEFT JOIN factures_hopital f ON f.id_org_unit = ou.id_org_unit
    AND f.date_emission >= date_trunc('month', CURRENT_DATE)
WHERE ou.region = 'Littoral' AND ou.actif = TRUE
GROUP BY ou.id_org_unit, ou.district_sante, ou.commune, ou.nom, ou.type_propriete, ou.type_structure, ou.convention_etat
ORDER BY ou.district_sante, total_consultations_mois DESC;

-- 11.2 Vue alertes actives par zone
CREATE OR REPLACE VIEW vue_alertes_actives_littoral AS
SELECT 
    m.nom_maladie,
    ou.arrondissement,
    ou.commune,
    ou.quartier_ville,
    ou.type_propriete,
    a.nb_cas_suspects,
    a.nb_cas_confirmes,
    a.niveau_alerte,
    a.date_alerte,
    ST_Distance(a.coord_alerte, ou.coord_geographique) as distance_cas_structure,
    a.zone_influence
FROM alertes_epidemiques a
JOIN maladies_prioritaires m ON a.id_maladie = m.id_maladie
JOIN organisation_units ou ON a.id_org_unit = ou.id_org_unit
WHERE a.statut_alerte = 'active'
  AND ou.region = 'Littoral'
ORDER BY a.niveau_alerte DESC, a.date_alerte DESC;

-- 11.3 Vue performance public-privé
CREATE OR REPLACE VIEW vue_comparaison_public_prive AS
SELECT 
    CASE WHEN type_propriete = 'public' THEN 'Public' ELSE 'Privé' END as secteur,
    COUNT(DISTINCT ou.id_org_unit) as nb_structures,
    COUNT(DISTINCT p.id_patient) as patients_actifs,
    COUNT(DISTINCT ec.id_event) as total_actes,
    ROUND(AVG(ec.cout_total_estime), 0) as cout_moyen_estime,
    ROUND(AVG(f.montant_total), 0) as panier_moyen,
    SUM(CASE WHEN c.id_convention IS NOT NULL THEN 1 ELSE 0 END) as conventions_actives,
    SUM(CASE WHEN ec.type_event = 'transfert' THEN 1 ELSE 0 END) as transferts
FROM organisation_units ou
LEFT JOIN patients p ON p.id_org_unit_attachement = ou.id_org_unit
LEFT JOIN events_cliniques ec ON ec.id_org_unit = ou.id_org_unit
    AND ec.date_event >= date_trunc('year', CURRENT_DATE)
LEFT JOIN factures_hopital f ON f.id_org_unit = ou.id_org_unit
LEFT JOIN conventions_public_prive c ON (c.id_org_public = ou.id_org_unit OR c.id_org_prive = ou.id_org_unit)
    AND c.actif = TRUE
WHERE ou.region = 'Littoral' AND ou.actif = TRUE
GROUP BY secteur;

-- 11.4 Vue suivi zones inondables (spécifique Douala)
CREATE OR REPLACE VIEW vue_zones_inondables_suivi AS
SELECT 
    ou.quartier_ville,
    ou.zone_inondable,
    ou.accessibilite_saison,
    COUNT(DISTINCT p.id_patient) as patients_impactes,
    COUNT(DISTINCT ec.id_event) as consultations,
    COUNT(CASE WHEN ec.diagnostic_cim10 = 'A00' THEN 1 END) as cas_cholera,
    COUNT(CASE WHEN ec.diagnostic_cim10 LIKE 'B50%' THEN 1 END) as cas_paludisme
FROM organisation_units ou
LEFT JOIN patients p ON p.quartier = ou.quartier_ville
LEFT JOIN events_cliniques ec ON ec.id_org_unit = ou.id_org_unit
    AND ec.date_event >= CURRENT_DATE - INTERVAL '30 days'
WHERE ou.region = 'Littoral' AND ou.zone_inondable = TRUE
GROUP BY ou.quartier_ville, ou.zone_inondable, ou.accessibilite_saison
ORDER BY consultations DESC;

-- ============================================================
-- 12. DONNÉES DE TEST TERRAIN (LITTORAL)
-- ============================================================

-- Insertion structures sanitaires du Littoral
INSERT INTO organisation_units (code, nom, niveau, type_structure, type_propriete, departement, arrondissement, district_sante, commune, quartier_ville, zone_eco, zone_inondable, capacite_lits, coord_geographique, convention_etat, type_convention) VALUES
-- Hôpitaux publics
('HGYN_DLA', 'Hôpital Gynéco-Obstétrique de Douala', 2, 'hopital_regional', 'public', 'Wouri', 'Douala 1er', 'Douala 1er', 'Douala 1er', 'Akwa', 'urbaine_dense', FALSE, 250, ST_SetSRID(ST_MakePoint(9.704, 4.051), 4326), TRUE, 'complete'),
('HDLA_LAQ', 'Hôpital Laquintinie', 2, 'hopital_regional', 'public', 'Wouri', 'Douala 1er', 'Douala 1er', 'Douala 1er', 'Akwa', 'urbaine_dense', FALSE, 380, ST_SetSRID(ST_MakePoint(9.723, 4.043), 4326), TRUE, 'complete'),
('CSI_NDOK', 'CSI Ndogbong', 4, 'csi', 'public', 'Wouri', 'Douala 5e', 'Douala 5e', 'Douala 5e', 'Ndogbong', 'peri_urbaine', TRUE, 40, ST_SetSRID(ST_MakePoint(9.719, 4.025), 4326), TRUE, 'soins_curatifs'),

-- Cliniques privées
('CLIN_PAST', 'Clinique Pasteur', 2, 'clinique_privee', 'prive_commercial', 'Wouri', 'Douala 1er', 'Douala 1er', 'Douala 1er', 'Bastos', 'urbaine_dense', FALSE, 120, ST_SetSRID(ST_MakePoint(9.718, 4.058), 4326), TRUE, 'complete'),
('CLIN_BON', 'Clinique Bonamoussadi', 3, 'clinique_privee', 'prive_commercial', 'Wouri', 'Douala 2e', 'Douala 2e', 'Douala 2e', 'Bonamoussadi', 'urbaine', FALSE, 80, ST_SetSRID(ST_MakePoint(9.642, 4.084), 4326), TRUE, 'maternite'),
('CAB_MED_DLA', 'Cabinet Médical Deido', 4, 'clinique_privee', 'prive_commercial', 'Wouri', 'Douala 3e', 'Douala 3e', 'Douala 3e', 'Deido', 'urbaine', FALSE, 15, ST_SetSRID(ST_MakePoint(9.741, 4.038), 4326), FALSE, NULL),

-- Zones inondables spécifiques
('CSI_BONAB', 'CSI Bonabéri', 4, 'csi', 'public', 'Wouri', 'Douala 4e', 'Douala 4e', 'Douala 4e', 'Bonabéri', 'inondable', TRUE, 30, ST_SetSRID(ST_MakePoint(9.669, 4.089), 4326), TRUE, 'soins_curatifs'),
('CLIN_MBO', 'Clinique Mboppi', 3, 'clinique_privee', 'prive_commercial', 'Wouri', 'Douala 3e', 'Douala 3e', 'Douala 3e', 'Mboppi', 'inondable', TRUE, 45, ST_SetSRID(ST_MakePoint(9.752, 4.035), 4326), TRUE, 'urgencies'),

-- CSI ruraux Littoral
('CSI_EDEA', 'CSI Edea', 4, 'csi', 'public', 'Sanaga-Maritime', 'Edea', 'Edea', 'Edea', 'Centre ville', 'rurale', FALSE, 60, ST_SetSRID(ST_MakePoint(10.133, 3.800), 4326), TRUE, 'soins_curatifs');

-- Conventions public-privé
INSERT INTO conventions_public_prive (code_convention, nom_convention, id_org_public, id_org_prive, date_debut, type_convention, services_concernes, tarifs_conventionnes, actif) VALUES
('CONV-LITT-001', 'Partenariat Soins Maternité', (SELECT id_org_unit FROM organisation_units WHERE code = 'HGYN_DLA'), (SELECT id_org_unit FROM organisation_units WHERE code = 'CLIN_BON'), '2025-01-01', 'reference_evacuation', ARRAY['maternite', 'cesarienne', 'neonatologie'], '{"cesarienne": 150000, "accouchement_normal": 75000}'::JSONB, TRUE),
('CONV-LITT-002', 'Convention Données VIH', (SELECT id_org_unit FROM organisation_units WHERE code = 'CSI_NDOK'), (SELECT id_org_unit FROM organisation_units WHERE code = 'CLIN_PAST'), '2025-01-01', 'donnees', ARRAY['VIH', 'depistage', 'ARV'], '{"partage": "hebdomadaire"}'::JSONB, TRUE);

-- Insertion zones de chalandise
INSERT INTO zones_chalandise (id_org_unit, nom_zone, zone_geographique, rayon_km, population_estimee, quartiers_couverts, temps_acces_moyen_minutes, moyen_acces_principal)
SELECT 
    ou.id_org_unit,
    'Zone chalandise ' || ou.nom,
    ST_Buffer(ou.coord_geographique::geography, 5000)::geometry,
    5,
    45000,
    ARRAY['Akwa', 'Bonapriso', 'Bali'],
    15,
    'voiture'
FROM organisation_units ou
WHERE ou.code = 'HDLA_LAQ';

-- Insertion agents de santé
INSERT INTO agents_sante (matricule, nom, prenom, fonction, specialisation, id_org_unit_affectation, telephone, email, type_contrat) VALUES
('MED-CHEF-001', 'Manga', 'Dr Paul', 'medecin_chef_csi', 'Médecine Générale', (SELECT id_org_unit FROM organisation_units WHERE code = 'CSI_NDOK'), '699123456', 'dr.manga@csi-ndok.cm', 'fonctionnaire'),
('INF-SUP-001', 'Ngo', 'Marie', 'infirmier_titulaire', 'Soins Intensifs', (SELECT id_org_unit FROM organisation_units WHERE code = 'HDLA_LAQ'), '677987654', 'marie.ngo@hlaq.cm', 'fonctionnaire'),
('MED-PRIV-001', 'Fouda', 'Dr Alain', 'medecin_hopital', 'Chirurgie', (SELECT id_org_unit FROM organisation_units WHERE code = 'CLIN_PAST'), '699555888', 'dr.fouda@clinique-pasteur.com', 'prive');

-- Insertion patients de test
INSERT INTO patients (code_patient, nom, prenom, nin, date_naissance, sexe, telephone, quartier, profession, statut_socio_pro, mutuelle, id_org_unit_attachement, coord_domicile, zone_residence) VALUES
('PAT-DLA-001', 'Djomo', 'Jean', '1234567890123', '1985-03-15', 'M', '699111222', 'Akwa', 'Commerçant', 'COMMERCANT', 'CNPS', (SELECT id_org_unit FROM organisation_units WHERE code = 'HDLA_LAQ'), ST_SetSRID(ST_MakePoint(9.711, 4.049), 4326), 'urbaine_dense'),
('PAT-DLA-002', 'Ndom', 'Catherine', '9876543210987', '2021-06-10', 'F', '677333444', 'Ndogbong', NULL, 'SANS_EMPLOI', NULL, (SELECT id_org_unit FROM organisation_units WHERE code = 'CSI_NDOK'), ST_SetSRID(ST_MakePoint(9.718, 4.024), 4326), 'peri_urbain');

-- Insertion événements cliniques avec facturation
INSERT INTO events_cliniques (id_patient, id_org_unit, date_event, type_event, diagnostic_principal, diagnostic_cim10, medecin_responsable, statut_event, cout_total_estime)
VALUES 
(1, (SELECT id_org_unit FROM organisation_units WHERE code = 'HDLA_LAQ'), CURRENT_TIMESTAMP, 'consultation', 'Paludisme simple', 'B50', (SELECT id_agent FROM agents_sante WHERE matricule = 'INF-SUP-001'), 'cloture', 25000),
(2, (SELECT id_org_unit FROM organisation_units WHERE code = 'CSI_NDOK'), CURRENT_TIMESTAMP - INTERVAL '2 days', 'consultation', 'Diarrhée aqueuse', 'A09', (SELECT id_agent FROM agents_sante WHERE matricule = 'MED-CHEF-001'), 'cloture', 8000);

-- Création des factures
INSERT INTO factures_hopital (numero_facture, id_patient, id_org_unit, date_emission, sous_total, remise, taxe, montant_paye, mode_paiement, created_by)
SELECT 
    'FACT-' || ec.id_event,
    ec.id_patient,
    ec.id_org_unit,
    CURRENT_DATE,
    ec.cout_total_estime,
    CASE WHEN ou.type_propriete = 'public' THEN ec.cout_total_estime * 0.1 ELSE 0 END,
    0,
    ec.cout_total_estime,
    'especes',
    (SELECT id_agent FROM agents_sante WHERE id_org_unit_affectation = ec.id_org_unit LIMIT 1)
FROM events_cliniques ec
JOIN organisation_units ou ON ec.id_org_unit = ou.id_org_unit;

-- Insertion indicateurs spécifiques Littoral
INSERT INTO data_elements (code, nom, description, type_donnee, seuil_alerte, seuil_epidemique, public_cible, prive_cible) VALUES
('LITT_PALU_LAG_01', 'Paludisme lagunaire', 'Cas de paludisme diagnostiqués en zone lagunaire', 'integer', 20, 50, TRUE, TRUE),
('LITT_INOND_ACC', 'Accessibilité en saison des pluies', 'Nombre de jours d''inaccessibilité pour inondation', 'integer', 3, 7, TRUE, FALSE),
('LITT_PUB_PRI_PART', 'Patients orientés vers privé', 'Patients référés du public vers structure privée', 'integer', NULL, NULL, TRUE, TRUE),
('LITT_FAUX_MED', 'Alertes faux médicaments', 'Signalements de médicaments suspects', 'integer', 1, 3, TRUE, TRUE),
('LITT_COUV_CNPS', 'Couverture CNPS', 'Patients avec prise en charge CNPS', 'percentage', NULL, NULL, TRUE, TRUE);

-- ============================================================
-- 13. PERMISSIONS ET RÔLES (Application directe)
-- ============================================================

CREATE ROLE public_structure LOGIN;
CREATE ROLE private_structure LOGIN;
CREATE ROLE district_manager LOGIN;
CREATE ROLE regional_coordinator LOGIN;
CREATE ROLE minsante_supervisor LOGIN;

-- Permissions pour les structures publiques
GRANT SELECT, INSERT, UPDATE ON patients, events_cliniques, datavalues_agregats TO public_structure;
GRANT SELECT ON vue_suivi_district_littoral TO public_structure;

-- Permissions pour les structures privées (limitées)
GRANT INSERT ON patients, events_cliniques TO private_structure;
GRANT SELECT ON vue_alertes_actives_littoral TO private_structure;

-- Permissions districts
GRANT ALL ON ALL TABLES IN SCHEMA public TO district_manager;
GRANT SELECT, UPDATE ON alertes_epidemiques, conventions_public_prive TO district_manager;

-- ============================================================
-- 14. MAINTENANCE ET STATISTIQUES
-- ============================================================

-- Mise à jour des statistiques quotidiennes
ANALYZE organisation_units;
ANALYZE patients;
ANALYZE events_cliniques;
ANALYZE factures_hopital;
ANALYZE alertes_epidemiques;

-- Nettoyage planifié des logs (pg_cron)
SELECT cron.schedule('cleanup-logs', '0 2 * * *', 'DELETE FROM workflow_validation WHERE date_validation < CURRENT_DATE - INTERVAL ''365 days'';');
SELECT cron.schedule('refresh-views', '0 3 * * *', 'REFRESH MATERIALIZED VIEW CONCURRENTLY vue_suivi_district_littoral;');

-- ============================================================
-- FIN DU SCRIPT - BASE PRÊTE POUR LE LITTORAL CAMEROUN
-- ============================================================