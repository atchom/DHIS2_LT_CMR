CREATE OR REPLACE TABLE raw_alertes_par_maladie (
    nom_maladie VARCHAR(100),
    code_cim10 VARCHAR(10),
    nb_alertes INT,
    total_cas_confirmes INT,
    total_deces INT,
    letalite_moyenne VARCHAR(20),
    alertes_niveau_pandemie INT,
    alertes_niveau_epidemie INT,
    alertes_niveau_alerte INT,
    alertes_cloturees INT,
    notifiees_oms INT
);