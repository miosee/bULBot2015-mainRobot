/**
 * @file dataTypes.h
 * @author bULBot 2011-2012
 * @brief Définition des structures et énumérations.
 */

#ifndef DEF_DATATYPES_H
#define DEF_DATATYPES_H
#include "CanTypes.h"

//! Définition d'un type booléen
typedef enum {
	TRUE = 0,
	FALSE = 1
} bool;

//! Description d'un point sur la carte.
typedef struct {
	signed int x;		/** Abscisse. */
	signed int y;		/** Ordonnée. */
} point;

//! Equipe actuelle.
typedef enum {
	ROUGE = 0,			/*! L'équipe actuelle est l'équipe rouge. */
	JAUNE = 1			/*! L'équipe actuelle est l'équipe mauve. */
} team;

//! Etat du match
typedef enum {
	PRE = 0,			/*! En attente du début du match. */
	ONGOING = 1,		/*! Match en cours. */
	OVER = 2			/*! Match terminé. */
} match;

typedef enum {
	STRATEGIE = 1,  	/*! Détermination de l'action à effectuer. */
	INIT_ETAPE = 2,		//! Démarrage de l'étape à effectuer
	EXEC_ETAPE = 3,		/*! Etape en cours. */
	IDLE = 4, 			/*! Aucune action en cours, le robot n'a rien à faire. */
	ERR = 5 			/*! Une erreur grave s'est produite. */
}generalStateMachine;


//! Actions de base (briques pour les actionType).
typedef enum {
	ACTION_AUCUNE = 0, 			/** Aucune action de base en cours. */
	ACTION_TRAJECTOIRE = 1, 	/** Action au moyen de la trajectoire. */
	ACTION_PROPULSION = 2, 		/** Action au moyen de la propulsion seule. */
	ACTION_ACTIONNEURS = 3		/** Action au moyen du module actionneurs. */
} basicAction;



//! Structure contenant une action stratégique.
typedef struct {
	basicAction etapeEnCours; 					/** Etape en cours (action de base en train d'être effectuée). */
	unsigned int nbrEtapes; 					/** Nombre d'étapes nécessaires pour réaliser l'action. */
	unsigned int cout;							/** Coût de l'action. */
	unsigned char actionFinie; 					/** Booléen indiquant si l'action est finie et que les mouvements restants sont optionnels. */
	unsigned char actionRemise; 				/** Booléen indiquant que l'action n'a pu être complétée et sera réessayée plus tard. */
	basicAction (*ptr2Fct)(unsigned char);		/** Pointeur vers la fonction d'exécution de l'action. */
} action;


//! Ordre pour la trajectoire.
typedef struct {
	char cmd;				/** Commande à envoyer. */
	positionInteger compo;		/** Position complète à considérer dans l'ordre. */
}ordreTraj;

//! Ordre pour la propulsion.


//! Ordre de mouvement pour la propulsion (translation ou rotation).
typedef struct {
	char cmd;				/** Commande à envoyer. */
	int acc; 				/** Accélération [mm/s^2 ou °/(10*s^2)]. */
	int vit; 				/** Vitesse 	 [mm/s ou °/(10*s)]. */
	int dist; 				/** Distance	 [mm ou °/10]. */
}ordreMvtProp;

#endif



