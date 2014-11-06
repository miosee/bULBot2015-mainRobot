
Le dossier peripherals contient des librairies de fonctions facilitant l'usage des périphériques classiques (timer, uart,...) ainsi que celui des capteurs et actionneurs souvent utilisés.
Le projet MPLABX défini permet de tester les périphériques en interne, et montre également des examples d'usage des fonctions

NE PAS COPIER CES FICHIERS DANS VOTRE PROJET ! Sinon on va de nouveau se retrouver avec 50 versions du meme fichier. 
Le mieux est de les référencer directement en les incluant dans la liste des fichiers.
Pour référencer les .h , ajouter un en-tete du type 
	            #include "../peripherals/timers.h"