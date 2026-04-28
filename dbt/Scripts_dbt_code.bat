
# creation de l'environnement virtuel
python -m venv dbt_dhis2
# Activation de l'environnement virtuel 
 .\dbt_dhis2\scripts\Activate
 # une fois dans l'environnement virtuel, creer le projet
(dbt_dhis2)pip install dbt-core dbt-snowflake

# Initialisation du projet
dbt init dbt_dhis2
# 2. Installation des dépendances
dbt deps
# 3. Debug de la connexion
dbt debug
# 1. D'abord, nettoyer les anciens fichiers compilés
dbt clean
# Exécuter uniquement les modèles de staging
dbt run --select staging

# Exécuter uniquement les dimensions
dbt run --select marts.dimensions

# Exécuter uniquement les faits
dbt run --select marts.facts

# Exécuter tous les modèles marts
dbt run --select marts
# Exécuter le projet complet
dbt run
#executer un modele precis
dbt run --select stg_structures_sante

# Pour exécuter plusieurs modèles spécifiques
dbt run --select dim_patient dim_maladie dim_temps