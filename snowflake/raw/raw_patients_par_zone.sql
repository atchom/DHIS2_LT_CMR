CREATE OR REPLACE TABLE raw_patients_par_zone (
    region VARCHAR(50),
    departement VARCHAR(50),
    arrondissement VARCHAR(50),
    commune VARCHAR(50),
    quartier VARCHAR(100),
    zone_residence VARCHAR(30),
    nb_patients INT,
    nb_hommes INT,
    nb_femmes INT,
    age_moyen FLOAT,
    enfants_0_5 INT,
    personnes_agees_60_plus INT
);