import psycopg2
import pandas as pd
import psycopg2
import pandas as pd

# Configuration de connexion PostgreSQL
conn = psycopg2.connect(
    host="localhost",
    port=5432,
    database="DHIS2_LT_CMR",
    user="postgres",
    password="Ida1982@#"
)
# Supprimez cette ligne qui cause l'erreur
# conn = psycopg2.connect(conn)

cursor = conn.cursor()

# cursor.execute(open("create_view.sql", "r", encoding="utf-8").read())
df = pd.read_sql("SELECT * FROM v_structures_sante where region='Littoral'", conn)

print(df.head())
conn.commit()
cursor.close()
conn.close()

df.to_csv(r"C:\\CIC_Github\\DHIS2_DB\\CSV\\SRC_v_structures_sante.csv", index=False, encoding='utf-8-sig')