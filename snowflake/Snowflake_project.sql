# connexion a snowflake en remote via snowSQL:

snowsql -a acountname-xxxxxxx -u username

password:

# pour connaitre les ROLES
show ROLES
#pour connaitre le role en cours
select current_role()
#pour connaitre les warehouse creer dans ce role
show warehouse
# creation du warehouse
create warehouse jeda_dbt_wh
WAREHOUSE_SIZE = 'XSMALL'
AUTO_SUSPEND = 120
AUTO_RESUME = TRUE
INITIALLY_SUSPENDED = TRUE
COMMENT = 'Sandji Warehouse for ELT, dbt and Power BI';

Create database DHIS2_LT_CMR_DB;
use database DHIS2_LT_CMR_DB;
create schema raw;
# apres ceation des tables RAW, cf dossier raw

CREATE OR REPLACE STAGE STAGE_INTERNAL2;

# Mise en ligne du fichier
PUT 'file://C:\\CIC_Github\\DHIS2_DB\\CSV\\SRC_v_structures_sante.csv' @STAGE_INTERNAL2;

PUT 'file://C:\\CIC_Github\\DHIS2_DB\\CSV\\SRC_v_patients_par_zone.csv' @STAGE_INTERNAL2;

PUT 'file://C:\\CIC_Github\\DHIS2_DB\\CSV\\SRC_v_patients.csv' @STAGE_INTERNAL2;

PUT 'file://C:\\CIC_Github\\DHIS2_DB\\CSV\\SRC_v_alertes_par_zone.csv' @STAGE_INTERNAL2;

PUT 'file://C:\\CIC_Github\\DHIS2_DB\\CSV\\SRC_v_alertes_par_maladie.csv' @STAGE_INTERNAL2;

PUT 'file://C:\\CIC_Github\\DHIS2_DB\\CSV\\SRC_v_alertes_epidemiques.csv' @STAGE_INTERNAL2;

COPY INTO raw_structures_sante
FROM @STAGE_INTERNAL2/SRC_v_structures_sante.csv
FILE_FORMAT = (
    TYPE = 'CSV'
    FIELD_DELIMITER = ';'
    SKIP_HEADER = 1
    FIELD_OPTIONALLY_ENCLOSED_BY = '"'
    NULL_IF = ('NULL', '')
)
ON_ERROR = 'CONTINUE';

COPY INTO raw_patients_par_zone
FROM @STAGE_INTERNAL2/SRC_v_patients_par_zone.csv
FILE_FORMAT = (
    TYPE = 'CSV'
    FIELD_DELIMITER = ';'
    SKIP_HEADER = 1
    FIELD_OPTIONALLY_ENCLOSED_BY = '"'
    NULL_IF = ('NULL', '')
)
ON_ERROR = 'CONTINUE';


COPY INTO raw_patients
FROM @STAGE_INTERNAL2/SRC_v_patients.csv
FILE_FORMAT = (
    TYPE = 'CSV'
    FIELD_DELIMITER = ';'
    SKIP_HEADER = 1
    FIELD_OPTIONALLY_ENCLOSED_BY = '"'
    NULL_IF = ('NULL', '')
)
ON_ERROR = 'CONTINUE';

COPY INTO raw_alertes_par_zone
FROM @STAGE_INTERNAL2/SRC_v_alertes_par_zone.csv
FILE_FORMAT = (
    TYPE = 'CSV'
    FIELD_DELIMITER = ';'
    SKIP_HEADER = 1
    FIELD_OPTIONALLY_ENCLOSED_BY = '"'
    NULL_IF = ('NULL', '')
)
ON_ERROR = 'CONTINUE';

COPY INTO raw_alertes_par_maladie
FROM @STAGE_INTERNAL2/SRC_v_alertes_par_maladie.csv
FILE_FORMAT = (
    TYPE = 'CSV'
    FIELD_DELIMITER = ';'
    SKIP_HEADER = 1
    FIELD_OPTIONALLY_ENCLOSED_BY = '"'
    NULL_IF = ('NULL', '')
)
ON_ERROR = 'CONTINUE';

COPY INTO raw_alertes_epidemiques
FROM @STAGE_INTERNAL2/SRC_v_alertes_epidemiques.csv
FILE_FORMAT = (
    TYPE = 'CSV'
    FIELD_DELIMITER = ';'
    SKIP_HEADER = 1
    FIELD_OPTIONALLY_ENCLOSED_BY = '"'
    NULL_IF = ('NULL', '')
)
ON_ERROR = 'CONTINUE';