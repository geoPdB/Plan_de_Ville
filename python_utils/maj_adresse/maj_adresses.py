#-----------------------------------------------------------------------------
# Outils de téléchargement et de chargement de bases adresses locales dans un BDD Postgres
# Auteur : Thibaud IDOUX
#-----------------------------------------------------------------------------
#Suivi modif :
#20240213 : Création de la première mouture du code

import os
#import gzip
from datetime import datetime

#interface
from tkinter import *
from tkinter import filedialog, messagebox

#librairie data spatial
import numpy as np
import pandas as pd
import geopandas as gpd


from sqlalchemy import create_engine,inspect, URL, ARRAY, text
from sqlalchemy.dialects.postgresql import ARRAY, TEXT
#from sqlalchemy.sql import func
import csv




#librairie web
import requests
#from bs4 import BeautifulSoup

#----------------------------------------------
#   Fonction principale
#---------------------------------------------
def main() :

    #lire le fichier csv des élements de connexions
    name_port,name_bdd,name_host,schema_bal = read_bdd_csv()
    

    #lire le fichier csv des élements de connexions
    lst_insee = ()
    lst_insee = read_insee_csv()

    #Connexion à la base de données
    engine = connect_bdd (name_port,name_bdd,name_host)

    #vérifie le MCD de la BDD si c'est ok
    formate_bdd(engine)
    
    for insee in lst_insee :
        print(insee)
        #télécharger le csv
        telecharger_data (insee)

        #Charger dans la bdd
        add_data(engine,schema_bal,insee)

    #Rafraichir les matérialized view et les créer si besoin
    is_mvw_exist(engine)

    print('fini')

    engine.dispose()

#------------------------------------------------------------------------------------------
#   Fonction :  Test si les matérialized view exists et les crée si besoins.
# réflechir à passer par une table de config ou un xml par exemple
#-----------------------------------------------------------------------------------------
def is_mvw_exist (engine):

    # Étape 1 : Lister tous les fichiers .sql dans le dossier "materialized_view\"
    sql_files = [f for f in os.listdir('materialized_view') if f.endswith('.sql')]

    # Étape 2 : Exécuter le contenu de chaque fichier SQL
    for sql_file in sql_files:
        file_path = os.path.join('materialized_view', sql_file)

        # Ouvrir et lire le contenu du fichier SQL
        with open(file_path, 'r') as file:
            sql_query = file.read()

        # Exécuter la requête SQL avec SQLAlchemy
        with engine.begin() as connection:  # Utiliser engine.begin() pour gérer la transaction
            connection.execute(text(sql_query))
            connection.commit()

        print(f'Fichier sql {file_path} exécuté !')

           
        
#------------------------------------------------------------------------------------------
#   Fonction :  Test si le schéma et la table existe sinon les créer
#-----------------------------------------------------------------------------------------
def formate_bdd (engine):
    #vérification que la structure de la BDD est conforme
    #tester si le schema ref_adresse existe, si non, on la crée
    inspector = inspect(engine)
    schemas = inspector.get_schema_names()

    # Vérifier si le schéma existe
    schema_name = 'ref_adresse'
    if schema_name not in schemas:
        # Si le schéma n'existe pas, le créer
        with engine.connect() as connection:
            connection.execute(text(f"CREATE SCHEMA {schema_name}"))
            connection.commit()
            print(f"Schéma '{schema_name}' créé.")

    #vérifier si la table bal existe, si non, on la crée
    table_name = "bal"
    tables = inspector.get_table_names(schema=schema_name)
    if table_name not in tables:
        with engine.connect() as connection:

            #Création de la sequence
            requete_sql = """CREATE TABLE IF NOT EXISTS ref_adresse.bal
                            (
                                id SERIAL,
                                geometry geometry(Point,2154),
                                uid_adresse character varying COLLATE pg_catalog."default",
                                cle_interop character varying COLLATE pg_catalog."default",
                                commune_insee integer,
                                commune_nom character varying COLLATE pg_catalog."default",
                                commune_deleguee_insee character varying COLLATE pg_catalog."default",
                                commune_deleguee_nom character varying COLLATE pg_catalog."default",
                                voie_nom character varying COLLATE pg_catalog."default",
                                lieudit_complement_nom character varying COLLATE pg_catalog."default",
                                numero integer,
                                suffixe character varying COLLATE pg_catalog."default",
                                "position" character varying COLLATE pg_catalog."default",
                                x double precision,
                                y double precision,
                                "long" double precision,
                                lat double precision,
                                cad_parcelles character varying COLLATE pg_catalog."default",
                                source character varying COLLATE pg_catalog."default",
                                date_der_maj date,
                                certification_commune integer,
                                voie_nom_bre character varying COLLATE pg_catalog."default",
                                voie_nom_fra character varying COLLATE pg_catalog."default",
                                CONSTRAINT bal_pkey PRIMARY KEY (id)
                            )
                            ;"""
            connection.execute(text(requete_sql))
            connection.commit()
            print(f"Table BAL créé.")

            
#------------------------------------------------------------------------------------------
#   Fonction :  fonctions qui injecte dans la base les données adresse d'une BAL
#-----------------------------------------------------------------------------------------
def format_array_text(value):
    if pd.isnull(value):  # Vérifier si la valeur est NaN
        return None  # Renvoyer None pour les valeurs NaN
    else:
        return "{" + value.replace('|', ',') + "}"


def add_data(engine,schema_bal,insee):

    # Lire les données GeoJSON avec geopandas et appliquer un filtre
    fichier_bal = f"telechargement/bal_{insee}.csv"
    df = pd.read_csv(fichier_bal, sep=';', header=0)

    df.to_csv(f'temp/bal_export_test_{insee}.csv', index=False)

    #transformer le listing parcelle en mode type array (pas réussi)

    #convertir en geodataframe
    gdf = gpd.GeoDataFrame(df, geometry=gpd.points_from_xy(df.x, df.y),crs="EPSG:2154")
    
    #fixe le CRS
    gdf = gdf.set_crs('epsg:2154') 
            
    try:
        # Delete les enregistrement de la table avec le même insee
        requete_sql = f"DELETE from ref_adresse.bal WHERE commune_insee = {insee} ;"
        with engine.connect() as connection:
            result = connection.execute(text(requete_sql))
            connection.commit()
        
        #importer la geodataframe dans PG
        gdf.to_postgis('bal', engine, schema="ref_adresse", if_exists="append", index=False)
    
    
        print('Chargement réussi')      
    except:
        print('Chargement échoué')

#------------------------------------------------------------------------------------------
#   Fonction :  fonctions qui télécharge le fichier BAL en 1.4 pour chaque insee
#-----------------------------------------------------------------------------------------
def telecharger_data (insee):
    # URL du fichier à télécharger
    url = f"https://plateforme.adresse.data.gouv.fr/ban/communes/{insee}/download/csv-bal/adresses?version=1.3"
    print(url)

    # Chemin complet du dossier où vous souhaitez enregistrer le fichier
    dossier_destination = "telechargement/"

    # Chemin complet du fichier local
    chemin_fichier_local = os.path.join(dossier_destination, f'bal_{insee}.csv')

    # Vérifier si le dossier de destination existe, sinon le créer
    if not os.path.exists(dossier_destination):
        os.makedirs(dossier_destination)

    # Télécharger le fichier et l'enregistrer localement
    response = requests.get(url)
    if response.status_code == 200:
        with open(chemin_fichier_local, "wb") as fichier_local:
            fichier_local.write(response.content)
        print("Téléchargement réussi.")
    else:
        print("Échec du téléchargement. Code de statut :", response.status_code)
    
#----------------------------------------------
#   Fonction :  lire le csv des connexions
#---------------------------------------------
def read_bdd_csv():
    #lire le csv de connexion database.csv
    # Chemin vers le fichier CSV
    url_database = "database.csv"

    # Initialisez la variable pour stocker la valeur de port
    port = ''
    name_bdd = ''
    host = ''
    schema_bal = ''

    # Ouvrir le fichier CSV en mode lecture
    with open(url_database, 'r') as file_bdd:
        # Lire chaque ligne du fichier
        for ligne in file_bdd:
            if 'port' in ligne :
                name_port = int(ligne.split("=")[1].replace('\n', ''))
            elif 'host' in ligne :
                name_host = ligne.split("=")[1].replace('\n', '')
            elif 'database' in ligne :
                name_bdd = ligne.split("=")[1].replace('\n', '')
            elif 'schema_bal' in ligne :
                schema_bal = ligne.split("=")[1].replace('\n', '')

    #Ajouter des vérifications si les variabkes sont bien saisies           
    return (name_port,name_bdd,name_host,schema_bal)

#----------------------------------------------
#   Fonction :  lire le csv des insee
#---------------------------------------------
def read_insee_csv():
    #lire le csv de connexion database.csv
    # Chemin vers le fichier CSV
    url_insee = "lst_insee.csv"

    # Initialisez la variable pour stocker la valeur de port
    lst_insee = ()

    # Ouvrir le fichier CSV en mode lecture
    with open(url_insee, 'r') as file_bdd:
        # Lire chaque ligne du fichier
        for ligne in file_bdd:
            ligne = ligne.replace('\n','')
            lst_insee = ligne.split(",")

    return lst_insee


    #AJouter des vérifications si les variables sont bien saisies           
    return (port,name_bdd,host,schema_bal)

#----------------------------------------------
#   Fonction :  Se connecter à une bdd selon le fichier de config
#---------------------------------------------
def connect_bdd (name_port,name_bdd,name_host):
    # Créer la connexion à la base de données stocké dans un objet engine
    
    url = URL.create(
        drivername="postgresql",
        username=txt_login.get(),
        password=txt_mdp.get(),
        host=name_host,
        database=name_bdd,
        port=name_port
    )

    engine = create_engine(url)

    return engine

#---------------------------------
#   Fonction :  procédure principale Interface graphique
#--------------------------------

root = Tk()

#Taille de la fenêtre
root.title ("MAJ adresses")
root.geometry("850x200")
root.configure(background='#ECF0F1')

i = 1       

eti_titre = Label(root, text="Mise à jour des bases adresses locales")
eti_titre.grid (row=i,column=0,columnspan=3)
i = i + 1


#user
eti_login = Label(root, text="user :")
eti_login.grid (row=i,column=0)

txt_login = Entry(root, text="",width=100)
txt_login.grid (row=i,column=1)
i = i + 1

#user
eti_mdp = Label(root, text="Mot de passe :")
eti_mdp.grid (row=i,column=0)

txt_mdp = Entry(root, text="",width=100,show='*')
txt_mdp.grid (row=i,column=1)
i = i + 1


#Bouton pour lancer le programme
btn_executer = Button(root, text="Lancer la mise à jour du cadastre", command=main)
btn_executer.grid (row=i,column=0,columnspan=3)
i = i + 1


root.mainloop ()

print('fini !')
