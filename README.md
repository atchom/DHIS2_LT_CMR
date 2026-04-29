# 🏥 Système de Surveillance Épidémiologique du Cameroun – Région du Littoral
![Dashboard DHIS2 Littoral](https://raw.githubusercontent.com/atchom/DHIS2_LT_CMR/7974abbfee4ec77c95287bf9700a327aae5c0427/images/Dhis2_LT.png)

**Système intégré de surveillance épidémiologique, suivi des patients et pilotage des indicateurs de santé pour la région du Littoral (Douala, Nkongsamba, Edéa, Yabassi).**

---

## 📋 Table des matières

- [🎯 Objectifs](#-objectifs)
- [🗺️ Périmètre géographique](#-périmètre-géographique)
- [🦠 Maladies prioritaires](#-maladies-prioritaires)
- [📊 Architecture technique](#-architecture-technique)
- [📁 Structure du projet dbt](#-structure-du-projet-dbt)
- [📈 Export Power BI (vues)](#-export-power-bi-vues)
- [🗺️ Dashboards Power BI](#️-dashboards-power-bi)
- [🚀 Installation & Utilisation](#-installation--utilisation)
- [📅 Planning](#-planning)
- [🤝 Équipe projet](#-équipe-projet)
- [📄 Licence](#-licence)

---
## 🎯 Objectifs

| # | Objectif | Description |
|---|----------|-------------|
| 1 | **Surveillance épidémiologique** | Détection et suivi des épidémies (Paludisme, Choléra, Fièvre jaune, Rougeole, Méningite, etc.) |
| 2 | **Suivi des patients** | Gestion centralisée des patients, pathologies et antécédents |
| 3 | **Analyse des indicateurs** | Calcul des KPIs santé (consultations, hospitalisations, vaccination, nutrition) |
| 4 | **Partenariat Public-Privé** | Gestion des conventions entre structures publiques et privées |
| 5 | **Alerte précoce** | Déclenchement automatique d’alertes basé sur des seuils épidémiologiques |

---

## 🗺️ Périmètre géographique
```text
RÉGION DU LITTORAL
├── Département Wouri (Douala)
│ ├── Douala 1 (Ndogbong, Ndokoti, Akwa, Bonanjo, Bonapriso, Bali)
│ ├── Douala 2 (Deido, Cité SIC, Bonamoussadi)
│ ├── Douala 3 (Bépanda, Makepe, Logbaba, Mboppi)
│ ├── Douala 4 (Bonaberi, Nyalla, Kotto, Japoma)
│ └── Douala 5 (PK9, PK10, PK14)
├── Département Moungo (Nkongsamba, Manjo, Mbanga, Loum)
├── Département Sanaga-Maritime (Edéa)
└── Département Nkam (Yabassi)
```
🏥 **Structures couvertes :** Hôpitaux de district, CSI, cliniques privées, centres confessionnels et spécialisés.

---

## 🦠 Maladies prioritaires

### Maladies à déclaration obligatoire (épidémiques)

| Maladie | Seuil d’alerte | Seuil épidémique |
|---------|----------------|------------------|
| Choléra | 2 cas | 5 cas |
| Fièvre jaune | 1 cas | 2 cas |
| Méningite | 1 cas | 3 cas |
| Rougeole | 3 cas | 10 cas |
| Poliomyélite | 1 cas | 1 cas |
| Peste | 1 cas | 2 cas |

### Maladies vectorielles & chroniques

- **Vectorielles :** Paludisme grave (seuil alerte 50 cas), Dengue, Chikungunya.
- **Chroniques :** VIH/SIDA, Tuberculose, HTA, Diabète.

---

## 📊 Architecture technique

![Architecture Technique](https://raw.githubusercontent.com/atchom/DHIS2_LT_CMR/a26d0e11014c26e260a8ec269176c9b137de34bd/images/Architecture.png?s=100)

## 📁 Structure du Projet dbt
Ce projet dbt suit une architecture modulaire en étoile (star schema) organisée en deux couches principales :
```text
dbt_dhis2_dw/
├── dbt_project.yml
├── packages.yml
├── README.md
├── models/
│   ├── staging/
│   │   ├── stg_alertes_epidemiques.sql
│   │   ├── stg_alertes_par_maladie.sql
│   │   ├── stg_alertes_par_zone.sql
│   │   ├── stg_patients.sql
│   │   ├── stg_patients_par_zone.sql
│   │   ├── stg_structures_sante.sql
│   │   
│   ├── sources.yml
│   ├── marts/
│   │   ├── dimensions/
│   │   │   ├── dim_geographie.sql
│   │   │   ├── dim_maladie.sql
│   │   │   ├── dim_patient.sql
│   │   │   ├── dim_temps.sql
│   │   │   └── dim_structure_sante.sql
│   │   │   └── dimensions.yml
│   │   ├── facts/
│   │   │   ├── fct_alertes_epidemiques.sql
│   │   │   ├── fct_alertes_par_maladie.sql
│   │   │   └── fct_alertes_par_zone.sql
│   │   │   └── fct_patients_par_zone.sql
├──├── │   └── facts.yml
```
| Couche | Dossier | Description |
|:-------|:--------|:------------|
| **Staging** | `models/staging/` | Couche d'extraction et de normalisation des données sources (alertes, patients, structures sanitaires). Elle contient les modèles `stg_*` qui lisent directement les sources définies dans `sources.yml`. |
| **Marts** | `models/marts/` | Couche métier exposée aux outils de visualisation, structurée en deux sous-ensembles : |
| | `dimensions/` | Tables de référence (géographie, maladies, patients, temps, structures de santé) qui décrivent les entités du domaine. |
| | `facts/` | Tables de faits (alertes épidémiques, patients par zone) contenant les mesures et indicateurs clés. |

## 🗄️ Structure Snowflake – DHIS2_LT_CMR_DB
```text
DHIS2_LT_CMR_DB
├── INFORMATION_SCHEMA          # Métadonnées système
├── PUBLIC                      # Schéma public par défaut
│
├── RAW                         # Données brutes importées
│   ├── Tables (6)
│   │   ├── RAW_ALERTES_EPIDEMIQUES
│   │   ├── RAW_ALERTES_PAR_MALADIE
│   │   ├── RAW_ALERTES_PAR_ZONE
│   │   ├── RAW_PATIENTS
│   │   ├── RAW_PATIENTS_PAR_ZONE
│   │   └── RAW_STRUCTURES_SANTE
│   └── Stages (1)
│       └── STAGE_INTERNAL2
│
├── RAW_STAGING                 # Couche de staging (nettoyage)
│   └── Tables (6)
│       ├── STG_ALERTES_EPIDEMIQUES
│       ├── STG_ALERTES_PAR_MALADIE
│       ├── STG_ALERTES_PAR_ZONE
│       ├── STG_PATIENTS
│       ├── STG_PATIENTS_PAR_ZONE
│       └── STG_STRUCTURES_SANTE
│
├── RAW_DIMENSIONS              # Tables de dimensions
│   └── Tables (5)
│       ├── DIM_GEOGRAPHIE
│       ├── DIM_MALADIE
│       ├── DIM_PATIENT
│       ├── DIM_STRUCTURE_SANTE
│       └── DIM_TEMPS
│
└── RAW_FACTS                   # Tables de faits
    └── Tables (4)
        ├── FCT_ALERTES_EPIDEMIQUES
        ├── FCT_ALERTES_PAR_MALADIE
        ├── FCT_ALERTES_PAR_ZONE
        └── FCT_PATIENTS_PAR_ZONE
```

``
| Schéma Snowflake | Rôle | Nombre d'objets |
|:-----------------|:-----|:----------------|
| **RAW** | Données sources brutes (import PostgreSQL/CSV) | 6 tables + 1 stage |
| **RAW_STAGING** | Données nettoyées et standardisées par dbt (`stg_*`) | 6 tables |
| **RAW_DIMENSIONS** | Tables de dimensions métier (`dim_*`) | 5 tables |
| **RAW_FACTS** | Tables de faits avec indicateurs (`fct_*`) | 4 tables |

``
## 📊 Pipeline ETL de Données Sanitaires
![Pipeline ETL DHIS2](https://raw.githubusercontent.com/atchom/DHIS2_LT_CMR/0044ae4d3e0be4261c0fa93f1e58b98fe947aa30/images/Pipeline_Etl_DHIS2.png)

