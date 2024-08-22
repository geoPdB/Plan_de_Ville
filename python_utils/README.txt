--------------------------------------------------------------------------------------------
1° INSTALLATTION ET PARAMETRAGE DE PYTHON
--------------------------------------------------------------------------------------------

1° Installer PYTHON:
https://www.python.org/downloads/
Télécharger de préférence la version 3.10

Durant l'installation, penser à ajouter pyhton aux variables d'environnement
Si ce n'est pas fait, suiver le mode opératoire suivant :
- Trouver le chemin de Python :

    Le chemin est généralement quelque chose comme C:\PythonXX ou C:\Users\<votre_nom_utilisateur>\AppData\Local\Programs\Python\PythonXX, 
    où XX correspond à votre version de Python.

- Ajouter ce chemin aux variables d'environnement :

    Recherchez "Éditeur de variables d'environnement" dans le menu Démarrer et ouvrez-le.
    Sous "Variables système", sélectionnez "Path" puis cliquez sur "Modifier".
    Cliquez sur "Nouveau" et ajoutez le chemin vers le répertoire où Python est installé.
    Ensuite, ajoutez également le chemin vers Scripts, qui est dans le même répertoire (par exemple, C:\PythonXX\Scripts).
    Cliquez sur "OK" pour valider et fermer toutes les fenêtres.

2° Paramétrer PIP

pip est un gestionnaire de paquets pour Python, essentiel pour installer, mettre à jour et gérer des bibliothèques Python tierces. 
Il simplifie l'ajout de nouvelles fonctionnalités à vos projets en téléchargeant et installant automatiquement les paquets depuis 
le Python Package Index (PyPI).

Ajouter pip aux variables d'environnement et installer une bibliothèque

    Ajouter pip aux variables d'environnement :
        Recherchez "Éditeur de variables d'environnement" dans le menu Démarrer et ouvrez-le.
        Sous "Variables système", sélectionnez "Path" puis cliquez sur "Modifier".
        Cliquez sur "Nouveau" et ajoutez le chemin vers le répertoire de pip. C'est généralement quelque chose comme C:\PythonXX\Scripts (remplacez XX par votre version de Python).
        Cliquez sur "OK" pour valider et fermer toutes les fenêtres.

    Installer une nouvelle bibliothèque avec pip :

        Ouvrez l'invite de commandes (CMD).

        Tapez la commande suivante pour installer la bibliothèque souhaitée :

    "pip install nom_de_la_bibliothèque"

Remplacez nom_de_la_bibliothèque par le nom de la bibliothèque que vous souhaitez installer.

3° Les bibliothèques ou librairies à installer :

Dans l'invite de commande windows, tapez successivement les instructions suivantes :
pip install numpy
pip install pandas
pip install geopandas
pip install sqlalchemy
pip install bs4
pip install requests
pip install shutil
pip install gzip

