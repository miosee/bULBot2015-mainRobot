
Le dossier peripherals contient des librairies de fonctions facilitant l'usage des p�riph�riques classiques (timer, uart,...) ainsi que celui des capteurs et actionneurs souvent utilis�s.
Le projet MPLABX d�fini permet de tester les p�riph�riques en interne, et montre �galement des examples d'usage des fonctions

NE PAS COPIER CES FICHIERS DANS VOTRE PROJET ! Sinon on va de nouveau se retrouver avec 50 versions du meme fichier. 
Le mieux est de les r�f�rencer directement en les incluant dans la liste des fichiers.
Pour r�f�rencer les .h , ajouter un en-tete du type 
	            #include "../peripherals/timers.h"