INSERT INTO category_options (code, nom, type_categorie, ordre) VALUES
-- Sexe
('M', 'Masculin', 'sexe', 1),
('F', 'Féminin', 'sexe', 2),
-- Groupes d'âge
('0-5', 'Moins de 5 ans', 'groupe_age', 1),
('5-14', '5 à 14 ans', 'groupe_age', 3),
('15-24', '15 à 24 ans (jeunes adultes)', 'groupe_age', 4),
('24-60', '24 à 60 ans (adultes actifs)', 'groupe_age', 5),
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
INSERT INTO category_options (code, nom, type_categorie, ordre) VALUES

-- ============================================================
-- 1. GROUPES D'ÂGE PLUS PRÉCIS (pour meilleure analyse)
-- ============================================================

-- ============================================================
-- 2. STATUTS SOCIO-PROFESSIONNELS COMPLÉMENTAIRES
-- ============================================================
('ETUDIANT', 'Étudiant/Élève', 'socio_pro', 7),
('MENAGERE', 'Ménagère', 'socio_pro', 8),
('RETRAITE', 'Retraité', 'socio_pro', 9),
('SECURITE', 'Force de sécurité (police, armée, gendarmerie)', 'socio_pro', 10),
('PROF_LIBERALE', 'Profession libérale (médecin, avocat, architecte)', 'socio_pro', 11),
('ARTISAN', 'Artisan', 'socio_pro', 12),
('TRANSPORTEUR', 'Transporteur (moto taxi, conducteur)', 'socio_pro', 13),

-- ============================================================
-- 3. QUARTIERS PRIORITAIRES MANQUANTS
-- ============================================================
('BONAPRISO', 'Bonapriso', 'quartier', 9),
('BALI', 'Bali', 'quartier', 10),
('BESSENGUE', 'Bessengué', 'quartier', 11),
('LOGBABA', 'Logbaba', 'quartier', 12),
('MBOPPI', 'Mboppi', 'quartier', 13),
('BONANJO', 'Bonanjo', 'quartier', 14),
('GARE', 'Gare', 'quartier', 15),
('CITE_CICAM', 'Cité CICAM', 'quartier', 16),
('JAPOMA', 'Japoma', 'quartier', 17),
('NYALLA', 'Nyalla', 'quartier', 18),
('KOTTO', 'Kotto', 'quartier', 19),
('NDOGBONG', 'Ndogbong', 'quartier', 20),
('BONAMOUSSADI', 'Bonamoussadi', 'quartier', 21),
('LOGPOM', 'Logpom', 'quartier', 22),
('BASTOS', 'Bastos', 'quartier', 23),

-- ============================================================
-- 4. TYPES DE PRISE EN CHARGE COMPLÉMENTAIRES
-- ============================================================
('CNPS_CATEG', 'CNPS catégoriel', 'type_prise_charge', 6),
('CNPS_NON_CATEG', 'CNPS non catégoriel', 'type_prise_charge', 7),
('ASSURANCE_PRIVEE', 'Assurance privée (Allianz, AXA, etc.)', 'type_prise_charge', 8),
('CNAM', 'CNAM (Couverture maladie universelle)', 'type_prise_charge', 9),
('GRATUIT', 'Soins gratuits', 'type_prise_charge', 10),
('AIDE', 'Aide humanitaire', 'type_prise_charge', 11),

-- ============================================================
-- 5. TYPES DE PATHOLOGIES (pour analyse spécifique)
-- ============================================================
('PALU', 'Paludisme', 'pathologie', 1),
('DIARRHEE', 'Diarrhée', 'pathologie', 2),
('IRA', 'Infection respiratoire', 'pathologie', 3),
('VIH', 'VIH/SIDA', 'pathologie', 4),
('HTA', 'Hypertension artérielle', 'pathologie', 5),
('DIABETE', 'Diabète', 'pathologie', 6),
('TRAUMA', 'Traumatisme/Accident', 'pathologie', 7),

-- ============================================================
-- 6. NIVEAUX DE GRAVITÉ (pour triage)
-- ============================================================
('URGENCE_1', 'Urgence absolue (immédiate)', 'gravite', 1),
('URGENCE_2', 'Urgence relative (dans l''heure)', 'gravite', 2),
('URGENCE_3', 'Urgence modérée (dans les 4h)', 'gravite', 3),
('NON_URGENT', 'Non urgent', 'gravite', 4),

-- ============================================================
-- 7. MOYENS D'ACCÈS AUX SOINS
-- ============================================================
('VOITURE', 'Voiture personnelle', 'moyen_acces', 1),
('MOTO', 'Moto', 'moyen_acces', 2),
('TAXI', 'Taxi', 'moyen_acces', 3),
('BUS', 'Bus/Transport en commun', 'moyen_acces', 4),
('PIED', 'À pied', 'moyen_acces', 5),
('AMBULANCE', 'Ambulance', 'moyen_acces', 6),
('BATEAU', 'Bateau (zone lagunaire)', 'moyen_acces', 7),

-- ============================================================
-- 8. MODES DE PAIEMENT
-- ============================================================
('ESPECES', 'Espèces', 'mode_paiement', 1),
('VIREMENT', 'Virement bancaire', 'mode_paiement', 2),
('CHEQUE', 'Chèque', 'mode_paiement', 3),
('CARTE', 'Carte bancaire', 'mode_paiement', 4),
('MOBILE', 'Mobile money (Orange Money, MTN Money)', 'mode_paiement', 5),

-- ============================================================
-- 9. ZONES GÉOGRAPHIQUES PLUS PRÉCISES
-- ============================================================
('WOURI', 'Département Wouri', 'zone_geo', 6),
('MOUNGO', 'Département Moungo', 'zone_geo', 7),
('NKAM', 'Département Nkam', 'zone_geo', 8),
('SANAGA_MARITIME', 'Département Sanaga-Maritime', 'zone_geo', 9),

-- ============================================================
-- 10. ZONES À RISQUE SPÉCIFIQUES LITTORAL
-- ============================================================
('INONDABLE', 'Zone inondable', 'zone_risque', 1),
('LAGUNAIRE_RISQUE', 'Zone lagunaire (paludisme)', 'zone_risque', 2),
('INDUSTRIELLE', 'Zone industrielle', 'zone_risque', 3),
('PORTUAIRE_RISQUE', 'Zone portuaire', 'zone_risque', 4),
('MARCHE', 'Zone de marché (promiscuité)', 'zone_risque', 5),

-- ============================================================
-- 11. PERIODES ÉPIDÉMIOLOGIQUES
-- ============================================================
('SAISON_SECHE', 'Saison sèche', 'periode', 1),
('SAISON_PLUIES', 'Saison des pluies', 'periode', 2),
('INTER_SAISON', 'Intersaison', 'periode', 3),

-- ============================================================
-- 12. ISSUES DE CONSULTATION
-- ============================================================
('GUERI', 'Guéri', 'issue', 1),
('REFERE', 'Référé', 'issue', 2),
('DECEDE', 'Décédé', 'issue', 3),
('EVADE', 'Évadé (sortie contre avis)', 'issue', 4),
('HOSPITALISE', 'Hospitalisé', 'issue', 5),

-- ============================================================
-- 13. CIBLES DE VACCINATION
-- ============================================================
('NOURRISSON', 'Nourrisson (0-11 mois)', 'cible_vaccinale', 1),
('ENFANT', 'Enfant (1-4 ans)', 'cible_vaccinale', 2),
('SCOLAIRE', 'Enfant scolarisé (5-14 ans)', 'cible_vaccinale', 3),
('ADOLESCENT', 'Adolescent (15-19 ans)', 'cible_vaccinale', 4),
('ADULTE', 'Adulte (20-59 ans)', 'cible_vaccinale', 5),
('SENIOR', 'Senior (60+ ans)', 'cible_vaccinale', 6),
('FEMME_ENCEINTE', 'Femme enceinte', 'cible_vaccinale', 7),
('PERSONNEL_SOIGNANT', 'Personnel soignant', 'cible_vaccinale', 8),

-- ============================================================
-- 14. TYPES DE CONVENTIONS PUBLIC-PRIVÉ
-- ============================================================
('PARTENARIAT_SOINS', 'Partenariat de soins', 'type_convention', 1),
('REFERENCE_EVACUATION', 'Référence/Évacuation', 'type_convention', 2),
('FORMATION', 'Formation', 'type_convention', 3),
('SUPERVISION', 'Supervision', 'type_convention', 4),
('DONNEES', 'Partage de données', 'type_convention', 5);

