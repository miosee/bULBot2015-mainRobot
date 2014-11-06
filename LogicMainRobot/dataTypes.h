/**
 * @file dataTypes.h
 * @author bULBot 2011-2012
 * @brief D�finition des structures et �num�rations.
 */

#ifndef DEF_DATATYPES_H
#define DEF_DATATYPES_H
#include "CanTypes.h"

//! D�finition d'un type bool�en
typedef enum {
	TRUE = 0,
	FALSE = 1
} bool;

//! Description d'un point sur la carte.
typedef struct {
	signed int x;		/** Abscisse. */
	signed int y;		/** Ordonn�e. */
} point;

//! Equipe actuelle.
typedef enum {
	ROUGE = 0,			/*! L'�quipe actuelle est l'�quipe rouge. */
	JAUNE = 1			/*! L'�quipe actuelle est l'�quipe mauve. */
} team;

//! Etat du match
typedef enum {
	PRE = 0,			/*! En attente du d�but du match. */
	ONGOING = 1,		/*! Match en cours. */
	OVER = 2			/*! Match termin�. */
} match;

typedef enum {
	STRATEGIE = 1,  	/*! D�termination de l'action � effectuer. */
	INIT_ETAPE = 2,		//! D�marrage de l'�tape � effectuer
	EXEC_ETAPE = 3,		/*! Etape en cours. */
	IDLE = 4, 			/*! Aucune action en cours, le robot n'a rien � faire. */
	ERR = 5 			/*! Une erreur grave s'est produite. */
}generalStateMachine;


//! Actions de base (briques pour les actionType).
typedef enum {
	ACTION_AUCUNE = 0, 			/** Aucune action de base en cours. */
	ACTION_TRAJECTOIRE = 1, 	/** Action au moyen de la trajectoire. */
	ACTION_PROPULSION = 2, 		/** Action au moyen de la propulsion seule. */
	ACTION_ACTIONNEURS = 3		/** Action au moyen du module actionneurs. */
} basicAction;



//! Structure contenant une action strat�gique.
typedef struct {
	basicAction etapeEnCours; 					/** Etape en cours (action de base en train d'�tre effectu�e). */
	unsigned int nbrEtapes; 					/** Nombre d'�tapes n�cessaires pour r�aliser l'action. */
	unsigned int cout;							/** Co�t de l'action. */
	unsigned char actionFinie; 					/** Bool�en indiquant si l'action est finie et que les mouvements restants sont optionnels. */
	unsigned char actionRemise; 				/** Bool�en indiquant que l'action n'a pu �tre compl�t�e et sera r�essay�e plus tard. */
	basicAction (*ptr2Fct)(unsigned char);		/** Pointeur vers la fonction d'ex�cution de l'action. */
} action;


//! Ordre pour la trajectoire.
typedef struct {
	char cmd;				/** Commande � envoyer. */
	positionInteger compo;		/** Position compl�te � consid�rer dans l'ordre. */
}ordreTraj;

//! Ordre pour la propulsion.


//! Ordre de mouvement pour la propulsion (translation ou rotation).
typedef struct {
	char cmd;				/** Commande � envoyer. */
	int acc; 				/** Acc�l�ration [mm/s^2 ou �/(10*s^2)]. */
	int vit; 				/** Vitesse 	 [mm/s ou �/(10*s)]. */
	int dist; 				/** Distance	 [mm ou �/10]. */
}ordreMvtProp;

#endif



