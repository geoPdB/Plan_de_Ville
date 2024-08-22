-----------------------------------------------------------------------------------------------------------------------------
MODE D'EMPLOI POUR UTILISER LES SCRIPTS PYTHON
-----------------------------------------------------------------------------------------------------------------------------


-----------------------------------
Préalable
-----------------------------------
- Installer python et les bibliothèques indispensables :
    Suivre le doc DOC_installation_python.txt

- Une bonne poratique pourrait être de copier coller les dossiers dans un autre espace que votre dossier local connecté au GIT.
Cela a pour but d'éviter que les fichiers paramètres soit poussés sur le git avec des informations propres à votre structures comme les identifiants
de connexion à votre base de données et la liste des codes insee vous concernant.

-----------------------------------
Gérer la connexion à la bdd POSTGRES/POSTGIS
-----------------------------------
Dans chacun des scripts python qui nécessitent une connexion à postgres, vous devez remplir correctement le fichier database.csv en précisant :
        - host
        - database
        - port
Pour cela remplacer les XXXX avec vos informations.

-----------------------------------
Droits dans la base de données
-----------------------------------
L'utilisateur doit avoir les droits de créer des schémas / tables avec INSERT/ UPDATE / DELETE / TRUNCATE
-----------------------------------
Appliquer le script à votre territoire en précisant les codes INSEE
-----------------------------------
Dans chacun des scripts python qui nécessitent des codes insee, vous devez remplir correctement le fichier lst_insee.csv
Chaque code insee doit être séparé par des virgules
exemple :
29177,29208,29178,29201,29076,29119

Ne pas mettre de virgule à la fin.

-----------------------------------
Ordre d'execution
-----------------------------------
1° Vous devez avoir le cadastre nominatif installé via le plugin Qgis 'cadastre' dans un schéma nommé 'ref_cadastre'
2° executer le script de mise à jour du cadastre non nominatif
3° executer le script de mise à jour des adresses de la base adresse national

-----------------------------------
UTILITAIRE : maj_cadastre_nn
-----------------------------------
Cet utilitaire python permet d'avoir le cadastre non nominatif dans une base postgres à jour.
L'intégration de la généalogie des parcelles via le DFI est en cours de développement, ne pas y preter attention pour l'instant.

Explication du process :
1° Vérifies qu'une nouvelle version du cadastre non nominatif est disponible.
    Si votre version en base est la même que la dernière version, il ne se passe rien
    Si une mise à jour est disponçbile alors le script continue :
 2° télécharges et dezip les fichiers cadastre par communes
 3° Importe dans le base les données
 4° rafraichit les materialized view

 FIN : un message apparait qui stipule quel millésime du castre a été mis à jour.

 Les données sont disponibles dans le schema nommé ref_cadastre_nn
 Vous pouvez importer sous qgis, de préférence, les materialized view, cela évite des modifcations intempestives du cadastre ;-D

 -----------------------------------
UTILITAIRE : maj_adresse
-----------------------------------

Cet utilitaire permet de charger dans une base de données postgres/postgis les adresses depuis la BAN.
Les adresses importées dépend des codes insee saisis dans le fichier lst_insee.

Depuis Qgis, ouvrir :
    - mvw_bal_localisation : contient les points adresses et lieux dits. Charger le style mvw_bal_localisation.qml afin d'avoir une présentation
    conforme. Des actions et infobulles sont paramétrés afin d'afficher une fiche adresse.
    - mvw_bal_parcelles_nn : contient les parcelles reliées à chaque point adresse. Charger le style mvw_bal_parcelles_nn.qml.

Explication du process :
1° Télécharges les données
2° Import dans la base de données
3° Création ou Rafraichissement des materialized views
    Pour ajouter de nouvelles Mviews, il suffit d'ajouter des scripts sql dans le dossier  materialized_view
    Bien penser à les numéroter afin que l'éxecution se fasse dans le bon ordre.




