CREATE OR REPLACE TABLE raw_alertes_par_zone (
    region VARCHAR(50),
    departement VARCHAR(50),
    arrondissement VARCHAR(50),
    quartier_ville VARCHAR(100),
    nom_maladie VARCHAR(100),
    nb_alertes INT,
    cas_confirmes INT,
    deces INT,
    letalite_moyenne VARCHAR(20),
    population_exposee_moyenne FLOAT
);