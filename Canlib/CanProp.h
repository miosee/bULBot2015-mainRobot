/**
 * @file CanProp.h
 * @brief Header pour la communication CAN avec la carte propulsion.
 */

#ifndef CANPROP_H
#define CANPROP_H


//#include "CanNetwork.h"
#include "CanTypes.h"


//remarque : les donn�es cod�es sur plusieurs octets sont envoy�s
//en commencant l'octet de poids fort !!



typedef struct {
	int vi; // mm/s
	int length;  // mm
	int vf; // mm/s
} moveType;



/**
 * @brief D�finition de la structure de donn�es pour l'envoi des ordres � la propulsion
 */
typedef struct {
	char cmd;				/** Commande � envoyer. */
	int data0; 				/** */
	int data1; 			/** Remplissage pour avoir la m�me taille que ordreTraj. */
	int data2; 			/** Remplissage pour avoir la m�me taille que ordreTraj. */
} ordreProp;



//	FONCTIONS POUR INTERFACE AVEC LE PIC PROPULSION :
//	-------------------------------------------

/**
 * @brief Initialisation de la communication avec la propulsion.
 * @details D�claration de la consommation et de la production des
 * diff�rents messages CAN li�s au fonctionnement de la propulsion.
 * D�fini la r�ception de la position et de l'�tat de propulsion.
 */
void canPropulsionEnable(void);

/**
 * @brief Renvoie la position actuelle mesur�e par l'odom�trie
 */
positionInteger propulsionGetPosition(void);

/**
 * @brief Renvoie l'�tat du module propulsion: STANDING (0), MOVING (1), MOVE_CLOTHO (2), MOVE_TRANSLA (3), NEXT_MOVE (4)
 */
propStateType propulsionGetStatus(void);

/**
 * @brief Ordre CAN g�n�rique � l'odom�trie (fonction interne)
 */
void propulsionOrdre(char cmd, int data0, int data1 , int data2 );

/**
 * @brief Fixe la position actuelle par un envoi CAN � la propulsion
 */
void propulsionSetPosition(positionInteger pos);

/**
 * @brief ordonne � la propulsion d'effectuer une translation � vitesse et
 * acceleration donn�es (distance en mm)
 */
void propulsionTranslation(int acc, int vit, int dist);

/**
 * @brief ordonne � la propulsion d'effectuer une rotation � vitesse et
 * acceleration donn�es (rotation en deg/10)
 */
void propulsionRotation(int acc, int vit, int dist);

/**
 * @brief ordonne � la propulsion de s'arreter imm�diatement
 */
void propulsionStopNow(void);

/**
 * @brief ordonne � la propulsion d'effectuer une portion de clotho�de
 * @param[in] move.vi = vitesse d'entr�e de la clotho�de (mm/s)
 * @param[in] movevf = vitesse de sortie de la clotho�de (mm/s)
 * @param[in] move.length = angle � effectuer, en deg/10
 */
void propulsionClotho(moveType newmove);

/**
 * @brief ordonne � la propulsion d'effectuer une translation
 * @param[in] move.vi = vitesse d'entr�e (mm/s)
 * @param[in] movevf = vitesse de sortie (mm/s)
 * @param[in] move.length = longueur � parcourir  (0.1 mm)
 */
void propulsionTranslaClotho(moveType newmove);


//	COMMANDES POUR INTERFACE AVEC LE PIC PROPULSION :
//	-------------------------------------------

// commande de changement de mode
//////////////////////////////////////////////////////////////////////
// passe dans le mode acttif
#define PROP_ENABLE				3
// passe dans le mode inactif
#define PROP_DISABLE			4
// passe en mode test
#define PROP_TEST				5


// Commande du mode actif
//////////////////////////////////////////////////////////////////////
//configure un mouvement de translation
// octet 1-2 : acc�l�ration [mm/s�]
// octet 2-3 : vitesse de croisi�re [mm/s]
// octet 4-5 : longueur [mm]
#define PROP_TRANSLATION		0
//configure un mouvement de translation
// octet 1-2 : acc�l�ration [1/10 deg/s�]
// octet 2-3 : vitesse de croisi�re [1/10 deg/s]
// octet 4-5 : longueur [1/10 deg]
#define PROP_ROTATION			1
//ordonne d'arreter immediatement le robot en utilisant la pente de deceleration normale
#define PROP_STOP_NOW			2

#define PROP_GOTO_XY			7

#define PROP_GOTO_XYALPHA		8
// commandes du mode test
//////////////////////////////////////////////////////////////////////
// impose le rapport cyclique sur les 2 moteurs
// donn�es :
//    B0 : rapport cyclique du moteur droit (en %)
//    B1 : rapport cyclique du moteur gauche (en %)
#define PROP_SET_DUTY_CYCLE		6


// Commandes ind�pendantes du mode
//////////////////////////////////////////////////////////////////////
// REMARQUE : Les 4 cmmandes suivantes ne sont pas prises en compte si le robot est en mouvement
// impose la position en x,y,alpha actuelle du robot, en mm, et en degr� cod� sur 6 octets au total
#define PROP_SET_POS				0x12
//impose la position en x actuelle du robot, en mm, cod� sur 2 octets
#define PROP_SET_POS_X				0x0A
//impose la position en y actuelle du robot, en mm, cod� sur 2 octets
#define PROP_SET_POS_Y				0x0B
//impose l'orientation actuelle du robot, en degre, cod� sur 2 octets
#define PROP_SET_POS_ALPHA			0x0C
// ordonne � la propulsion d'activer ou de d�sactiver la d�tection de patinage.
// Par d�faut, elle est activ�e
#define PROP_PATINAGE_ON_OFF		0x0D
#define PROP_PATINAGE_OFF	0
#define PROP_PATINAGE_ON	1


//	OBJETS CAN PRODUITS PAR LE PIC PROPULSION :
//	-------------------------------------------

//////////////////////////////////////////////////////////////////////
#define CO_PROP_STATUS                  CN_PROPULSION*0x10+0

//flag indiquant qu'on a d�tect� un patinage
// le PIC propulsion coupe les moteurs de lui-m�me
//		- Longueur : 	1
//		l'octet vaut toujours 1
#define CO_PROP_PATINAGE                CN_PROPULSION*0x10+1

//	Position du robot :
//		- Longueur : 	6
//		- B1-B0 : x, en mm
//		- B3-B2 : y, en mm
//		- B5-B4 : alpha, en degr�
#define CO_PROP_POS                     CN_PROPULSION*0x10+2 // 22

/* OLD
// position command�e du moteur gauche (un long sur 4 octets)
#define CO_PROP_LEFT_COM_POS		CN_PROPULSION*0x10+3
// position mesur�e du moteur gauche (un long sur 4 octets)
#define CO_PROP_LEFT_MES_POS		CN_PROPULSION*0x10+4
*/

// TEST 2014
#define CO_PROP_VEL_CSG                 CN_PROPULSION*0x10+3 // 23

#define CO_PROP_VEL                     CN_PROPULSION*0x10+4  //24

// position command�e du moteur droit (un long sur 4 octets)
#define CO_PROP_RIGHT_COM_POS		CN_PROPULSION*0x10+5
// position mesur�e du moteur droit (un long sur 4 octets)
#define CO_PROP_RIGHT_MES_POS		CN_PROPULSION*0x10+6

//	Position du robot selon l'odom�trie moteurs :
//		- Longueur : 	6
//		- B1-B0 : x, en mm
//		- B3-B2 : y, en mm
//		- B5-B4 : alpha, en degr�
#define CO_PROP_POS_MOT			CN_PROPULSION*0x10+7
//	Position du robot selon l'odom�trie consigne :
//		- Longueur : 	6
//		- B1-B0 : x, en mm
//		- B3-B2 : y, en mm
//		- B5-B4 : alpha, en degr�
#define CO_PROP_POS_CSG			CN_PROPULSION*0x10+8 // 28

#define CO_PROP_MOT_VT			CN_PROPULSION*0x10+9
#define CO_PROP_MOT_VR			CN_PROPULSION*0x10+10

#define CO_PROP_ODO_VT			CN_PROPULSION*0x10+11
#define CO_PROP_ODO_VR			CN_PROPULSION*0x10+12


#endif