#20230831 : Création de la première mouture du code
#20230920 : Refresh des 2 Materialized Views Parcelles et Batiments. Les utilisateurs sont branchés sur ces vues pour éviter toutes modifs intempestives.
#20240725 : Mise en place

import os
import gzip
import zipfile
import shutil
from datetime import datetime

#interface
from tkinter import *
from tkinter import filedialog, messagebox

#librairie data spatial
import geopandas as gpd
from sqlalchemy import create_engine, URL, select
from sqlalchemy.sql import func
from sqlalchemy import text

#librairie web
import requests
from bs4 import BeautifulSoup

#---------------------------------
#   Fonction :  procédure principale
#--------------------------------
def main():
    
    #lire le fichier csv des élements de connexions
    name_port,name_bdd,name_host,schema_bal = read_bdd_csv()
    

    #lire le fichier csv des élements de connexions
    lst_insee = ()
    lst_insee = read_insee_csv()

    #Connexion à la base de données
    engine = connect_bdd (name_port,name_bdd,name_host)

    #initilisation lors de la 1ere utilisation
    init_first_use(engine)
    
    #maj du cadastre nn
    main_cadastrenn(engine,lst_insee)

    #-------------------------------------------------- a remettre
    #maj DFI généalogie parcelle
    #print(txt_dfi.get())
    #if txt_dfi.get() != '' :
    #main_dfi(engine)

    #fermeture de la connexion
    engine.dispose()

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

#---------------------------------
#   Fonction :  recherche la date de la dernière mise à jour du cadastre
#--------------------------------

def recup_last_date ():
    # URL de la page contenant la liste d'URLs
    url = "https://cadastre.data.gouv.fr/data/etalab-cadastre/"

    # Récupérer le contenu de la page
    response = requests.get(url)
    html_content = response.content

    # Utiliser BeautifulSoup pour analyser le contenu HTML
    soup = BeautifulSoup(html_content, "html.parser")

    # Trouver tous les éléments <a> contenant des liens
    links = soup.find_all("a")

    # Créer une liste pour stocker les liens
    list_of_links = []

    # Parcourir les liens et ajouter leurs attributs href à la liste
    for link in links:
        href = link.get("href")
        if href:
            list_of_links.append(href)

    # Vérifier si la liste a au moins deux éléments avant d'afficher l'avant-dernier élément
    if len(list_of_links) >= 2:
        date_maj = str(list_of_links[-2])
        print(date_maj)
    else:
        date_maj = '01/01/1900'

    return date_maj

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
#   Fonction :  téléchargempent du fichier + dezip
#--------------------------------

def telecharger_data (url,nom_fichier):
    # URL du fichier à télécharger
    #url = "https://cadastre.data.gouv.fr/data/etalab-cadastre/latest/geojson/departements/29/" + str(nom_fichier)

    # Chemin complet du dossier où vous souhaitez enregistrer le fichier
    dossier_destination = "telechargement/"

    # Chemin complet du fichier local
    chemin_fichier_local = os.path.join(dossier_destination, nom_fichier)

    # Vérifier si le dossier de destination existe, sinon le créer
    if not os.path.exists(dossier_destination):
        os.makedirs(dossier_destination)

    # Télécharger le fichier et l'enregistrer localement
    response = requests.get(url)
    if response.status_code == 200:
        with open(chemin_fichier_local, "wb") as fichier_local:
            fichier_local.write(response.content)
        print("Téléchargement réussi.")
        return chemin_fichier_local
    else:
        print("Échec du téléchargement. Code de statut :", response.status_code)
        return 0

    
def decompress_cadastrenn(chemin_fichier_local):
    # Décompresser le fichier
    chemin_fichier_decompresse = os.path.splitext(chemin_fichier_local)[0]  # Retire l'extension .gz
    with gzip.open(chemin_fichier_local, 'rb') as fichier_gz, open(chemin_fichier_decompresse, 'wb') as fichier_decompresse:
        fichier_decompresse.write(fichier_gz.read())
    print("Décompression réussie.")



# Fonction pour remplacer les délimiteurs au-delà de la 9ème occurrence dans une ligne
def replace_delimiters(line):
    # Diviser la ligne en champs
    fields = line.split(';')
    # Si le nombre de champs est supérieur à 9, remplacer les délimiteurs restants par des virgules
    if len(fields) > 10:
        return ';'.join(fields[:10]) + ',' + ','.join(fields[10:])
    else:
        return line
#---------------------------------
#   Fonction :  initilisation des tables et schema
#--------------------------------
def init_first_use(engine):  
    # Ouvrir le fichier SQL et lire son contenu
    with open('installation.sql', 'r') as file:
        sql_script = file.read()

    # Exécuter le script SQL
    with engine.connect() as connection:
        connection.execute(text(sql_script))
        connection.commit()

#extrait uniquement le fichier du finistère plutot que de tout dezipper
def extract_file_containing_dep029(zip_file_path, dir_export):
    # Créer un objet ZipFile pour l'archive
    with zipfile.ZipFile(zip_file_path, 'r') as zip_ref:
        # Parcourir tous les fichiers de l'archive
        for file_info in zip_ref.infolist():
            # Vérifier si le nom du fichier contient 'dep029'
            if 'dep290' in file_info.filename:
                # Construire le chemin de destination complet dans le répertoire d'exportation
                destination_path = os.path.join(dir_export, os.path.basename(file_info.filename))
                
                # Extraire le fichier correspondant dans le répertoire de destination
                zip_ref.extract(file_info.filename, path=dir_export)
                return file_info.filename # retourne le nom du fichier

    # Si aucun fichier correspondant n'est trouvé
    print("Aucun fichier contenant 'dep290' n'a été trouvé dans l'archive.")
    

    
#----------------------------------------------------------------------------------------------------------------
# MISE A JOUR DU CADASTRE NN
#----------------------------------------------------------------------------------------------------------------
def main_dfi(engine):

    #définition de l'url
    url = txt_dfi.get()
    
    #télécharge les données
    nom_fichier = os.path.basename(url.rstrip('/'))
    chemin_fichier_local= telecharger_data (url,nom_fichier)
    #print(chemin_fichier_local)
    #chemin_fichier_local='telechargement/documents_de_filiations_informatises_situation_avril_2024_dept_2a0_a_dept_580_zip'

    #si le téléchargement est ok
    if chemin_fichier_local != 0 :
        #-------------------------------------------------- a remettre
        """
        # Supprimer le fichier de destination s'il existe
        if os.path.exists(chemin_fichier_local + '.zip'):
            os.remove(chemin_fichier_local + '.zip')
        os.rename(chemin_fichier_local, chemin_fichier_local + '.zip')

        #Extrait le fichier concernant le finistère de l'archive
        file_dfi_29 = extract_file_containing_dep029(chemin_fichier_local + '.zip','telechargement')
        print(file_dfi_29)

        #Dezip le fichier et le nomme dfi29
        with gzip.open('telechargement/' + file_dfi_29, 'rb') as f_in:
            with open('telechargement/dfi29.txt', 'wb') as f_out:
                shutil.copyfileobj(f_in, f_out)
        """
        #charge le fichier dans une data frame
        # Spécifiez les noms des colonnes
        column_names = ['dep', 'insee', 'prefixe', 'id_dfi', 'nature_dfi', 'date_dfi', 'nom','n_lot_dfi','type_lien','parcelles']

        # Prétraitement du fichier texte
        with open('telechargement/dfi29.txt', "r") as file:
            preprocessed_lines = [replace_delimiters(line.strip()) for line in file]

        # Supprimer le dernier point-virgule de chaque ligne
        preprocessed_lines = [line[:-1] for line in preprocessed_lines]

        # Écrire les lignes prétraitées dans un nouveau fichier texte
        with open('telechargement/dfi29_clean.txt', "w") as file:
            file.write('\n'.join(preprocessed_lines))

        
        # Chargez le fichier texte dans un DataFrame pandas
        #df_dfi = pd.read_csv('telechargement/dfi29.txt', header=None, names=column_names, delimiter=",")

        print('Dfi téléchargé')
    else:
        messagebox.showinfo(title='Travail terminé', message='Erreur lors du téléchargement du dfi - la base de données n''a pas été mise à jour. Vérifiez le lien.')

        
    
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------
#                                                MISE A JOUR DU CADASTRE NN
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------
def main_cadastrenn(engine,lst_insee):
    #---------------------------------------------------------------------
    #ETAPE 1 : VERIFICATION DE LA DATE POUR VOIR SI BESOIN DE METTRE A JOUR
    #---------------------------------------------------------------------
    
    #vérifie la dernière date de mise à jour du cadastre disponible sous data.gouv
    date_maj_datagouv = recup_last_date()
    date_maj_datagouv = date_maj_datagouv[0:-1]

    # Convertir la date à un objet date si ce n'est pas déjà fait
    date_maj_datagouv = datetime.strptime(date_maj_datagouv, "%Y-%m-%d").date()

    # Définir la requête SQL brute
    requete_sql = "Select * from ref_cadastre_nn.date_maj WHERE last_date_maj = '" + str(date_maj_datagouv) + "'"

    # Exécuter la requête SQL brute en utilisant la méthode text()
    with engine.connect() as connection:
        result = connection.execute(text(requete_sql)).scalar()

    #---------------------------------------------------------------------
    #ETAPE 2 : Met A jour
    #---------------------------------------------------------------------    
    if result is None :
        lst_data = [('cadastre-29-batiments.json.gz','batiments'),
                ('cadastre-29-parcelles.json.gz','parcelles')
                ]

        nb_err = 0
        for data in lst_data :
            #télécharger les données
            chemin_fichier_local = telecharger_data ("https://cadastre.data.gouv.fr/data/etalab-cadastre/latest/geojson/departements/29/" + str(data[0]),data[0])
            if chemin_fichier_local != 0 :
                
                #dezip les données
                decompress_cadastrenn(chemin_fichier_local)

                #prépare le fichier json en supprimant le .gz
                fichier_geojson = os.path.join("telechargement/", data[0])
                fichier_geojson = os.path.splitext(fichier_geojson)[0]

                # Lire les données GeoJSON avec geopandas et appliquer un filtre
                gdf = gpd.read_file(fichier_geojson)
                gdf_filtered =  gdf[gdf['commune'].isin(lst_insee)]
                """gdf_filtered =  gdf[(gdf['commune'] == '29177') |
                        (gdf['commune'] == '29208') |
                        (gdf['commune'] == '29178') |
                        (gdf['commune'] == '29201') |
                        (gdf['commune'] == '29076') |
                        (gdf['commune'] == '29119') |
                        (gdf['commune'] == '29130') |
                        (gdf['commune'] == '29260') |
                        (gdf['commune'] == '29190') |
                        (gdf['commune'] == '29017') |
                        (gdf['commune'] == '29040') |
                        (gdf['commune'] == '29099') |
                        (gdf['commune'] == '29109') |
                        (gdf['commune'] == '29098') |
                        (gdf['commune'] == '29282') |
                        (gdf['commune'] == '29112') |
                        (gdf['commune'] == '29221') |
                        (gdf['commune'] == '29299') 
                         ]"""

                # Reprojeter les données en CRS 2154
                crs_2154 = "EPSG:2154"
                gdf_reprojected = gdf_filtered.to_crs(crs_2154)

                # Vider des données dans les tables existantes
                requete_sql = "Truncate ref_cadastre_nn." + str(data[1]) + " RESTART IDENTITY;"


                # Exécuter la requête SQL brute en utilisant la méthode text()
                with engine.connect() as connection:
                    result = connection.execute(text(requete_sql))
                    connection.commit()
                    
                # Charger les données filtrées dans la base de données
                gdf_reprojected.to_postgis(data[1], engine, schema="ref_cadastre_nn", if_exists="append", index=False)

                #met à jour les materialized view
                requete_sql = "REFRESH MATERIALIZED VIEW ref_cadastre_nn.mvw_" + str(data[1]) + " ;"
                with engine.connect() as connection:
                    result = connection.execute(text(requete_sql))
                    connection.commit()
            else:
                nb_err = nb_err +1

        if nb_err == 0 :    
            #----- Met à jour la date
            # met à jour la date officielle de mise à jour du cadastre
            requete_sql = "Update ref_cadastre_nn.date_maj set last_date_maj = '" + str(date_maj_datagouv) + "'"
            # Exécuter la requête SQL brute en utilisant la méthode text()
            with engine.connect() as connection:
                result = connection.execute(text(requete_sql))
                connection.commit()

            #message confirmation   
            messagebox.showinfo(title='Travail terminé', message='Le cadastre a été mise à jour. Le nouveau millésime est à la date du ' + str(date_maj_datagouv))
        else:
            messagebox.showinfo(title='Travail terminé', message='Erreur lors du téléchargement du cadastre non nominatif - la base de données n''a pas été mise à jour')

    else :
        messagebox.showinfo(title='Travail terminé', message='Le cadastre est déja à jour sur le serveur. Le millésime est à la date du ' + str(date_maj_datagouv))


#----------------------------------------------------------------------------------------------------------------
# INTERFACE TKINTER
#----------------------------------------------------------------------------------------------------------------
root = Tk()

#Taille de la fenêtre
root.title ("MAJ cadastre non nominatif")
root.geometry("850x200")
root.configure(background='#ECF0F1')

i = 1       

eti_titre = Label(root, text="Mise à jour du cadastre non nominatif")
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

#DFI Généalogie des parcelles
eti_dfi = Label(root, text="URL dfi :")
eti_dfi.grid (row=i,column=0)

txt_dfi = Entry(root, text="",width=100)
txt_dfi.grid (row=i,column=1)
i = i + 1

eti_dfi = Label(root, text="Si mise à jour généalogie parcelle souhaité inscrire URL")
eti_dfi.grid (row=i,column=0,columnspan=2)
i = i + 1

eti_dfi = Label(root, text="URL pour les paquets : https://data.economie.gouv.fr/explore/dataset/documents-de-filiation-informatises-dfi-des-parcelles/information/")
eti_dfi.grid (row=i,column=0,columnspan=3)
i = i + 1

#Bouton pour lancer le programme
btn_executer = Button(root, text="Lancer la mise à jour du cadastre", command=main)
btn_executer.grid (row=i,column=0,columnspan=3)
i = i + 1


root.mainloop ()

print('fini !')
