/* 
 * File:   CanAction.h
 * Author: michelyernaux
 *
 * Created on 9 avril 2014, 14:41
 */

#ifndef CANACTION
#define	CANACTION

#include "CanNetwork.h"
#include "CanTypes.h"

// Status de la trajectoire
#define ACTION          		 	0   // on effectue une action
#define WAIT                                    1   // on attends un ordre de l'IA
#define ERROR_LANCEUR           		 	2   // on a eu un problème avec une action


//	OBJETS CAN PRODUITS PAR LE PIC ACTIONNEUR :
//	-------------------------------------------

#define CO_ACTION_STATUS		CN_ACTIONNEUR*0x10+0
#define CO_ACTION_FRESQUE1		CN_ACTIONNEUR*0x10+1
#define CO_ACTION_FRESQUE2		CN_ACTIONNEUR*0x10+2

#define CO_CAPTEURS_MESURES CN_ACTIONNEUR*0x10+3
/**
 * @brief Présence d'un obstacle devant le robot.
 * - Longueur: 5 octets
 * Octet 1: Statut de la détection d'obstacle à l'avant (voir macros suivantes)
 * Octet 2-3: Abscisse absolue approximative de l'obstacle
 * Octet 4-5: Ordonnée absolue approximative de l'obstacle
 */
#define CO_CAPTEURS_OBSTACLE_AVANT CN_ACTIONNEUR*0x10+4

/**
 * @brief Présence d'un obstacle derrière le robot.
 * - Longueur: 5 octets
 * Octet 1: Statut de la détection d'obstacle à l'arrière (voir macros suivantes)
 * Octet 2-3: Abscisse absolue approximative de l'obstacle
 * Octet 4-5: Ordonnée absolue approximative de l'obstacle
 */
#define CO_CAPTEURS_OBSTACLE_ARRIERE CN_ACTIONNEUR*0x10+5

#define	OBSTACLE_AUCUN						0
#define	OBSTACLE_AVANT_DROITE				1
#define	OBSTACLE_AVANT_MILIEU				2
#define	OBSTACLE_AVANT_GAUCHE				3
#define	OBSTACLE_ARRIERE_DROITE				4
#define	OBSTACLE_ARRIERE_MILIEU				5
#define	OBSTACLE_ARRIERE_GAUCHE				6

//	FONCTIONS POUR INTERFACE AVEC LE PIC TRAJECTOIRE :
//	-------------------------------------------

// Renvoie 1 si fresque 1 collée au mur
int ActionGetFresque1 (void);

// Renvoie 1 si fresque 2 collée au mur
int ActionGetFresque2 (void);

void canActionEnable(void);

void ActionOrdre(char cmd, int data0, int data1 , int data2 );

/**
 * @brief Demande un tir
 */


/**
 * @brief Demande un tir (un tir par salve, 4 salves en tout (2 par mammouth)
 */
void TirMammouth (void);

/**
 * @brief Obtiens le status de la carte actionneur du petit robot
 * @return Le status
 */
char ActionGetStatus(void);


//	COMMANDES POUR INTERFACE AVEC LE PIC ACTIONNEUR :
//	-------------------------------------------


// Demande un tir sur le mamouth
//


#define PICK_FRUIT      0
#define PLACE_FRUIT     1
#define PLACE_BAD_FRUIT 2
#define PICK_FIRE       3
#define ROTATE_FIRE     4
#define PLACE_FIRE      5
#define KILL_MAMMOTH    6
#define EMPTY_TORCH     7
#define STATUS_FRESCO   8
#define TEST            9



#endif	/* CANACTION_H */

