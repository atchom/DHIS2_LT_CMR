-- ============================================================
-- VUE 1: v_structures_sante - Liste des structures sanitaires
-- ============================================================
CREATE OR REPLACE VIEW v_structures_sante AS
SELECT 
    id_org_unit,
    code,
    nom,
    niveau,
    region,
    departement,
    arrondissement,
    commune,
    quartier_ville,
    type_structure,
    type_propriete,
    sous_type_prive,
    zone_eco,
    zone_inondable,
    capacite_lits,
    capacite_urgence,
    nombre_salles_consultation,
    possede_labo,
    possede_imagerie,
    possede_ambulance,
    nb_ambulances,
    ST_X(coord_geographique::geometry) as longitude,
    ST_Y(coord_geographique::geometry) as latitude,
    convention_etat,
    telephone,
    email,
    responsable,
    actif,
    population_couverte,
    date_creation,
    metadata
FROM organisation_units
WHERE actif = TRUE;