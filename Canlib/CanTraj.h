/* 
 * File:   CanTraj.h
 * Author: Kevin
 *
 * Created on 3 novembre 2013, 11:20
 */

#ifndef CANTRAJ_H
#define	CANTRAJ_H

#include "CanNetwork.h"
#include "CanProp.h"
#include "CanTypes.h"

// Status de la trajectoire
#define TRAJECTOIRE_ARRIVED		 	0   // on est arriv� � destination
#define TRAJECTOIRE_BLOCKED		 	1   //! on informe la logique qu'il n'y a pas de chemin possible
#define TRAJECTOIRE_MOVING		 	2   // on est en mouvement
#define TRAJECTOIRE_LOST		 	3   // on est perdus (balise ou odom�trie HS)
#define TRAJECTOIRE_IMPOSSIBLE		4   //! on est dans une zone interdite de la carte, on dit � la logique qu'on est perdu
#define TRAJECTOIRE_END_OUT		 	5   //! la destination est hors de la table, on dit � la logique qu'on est bloqu�
#define TRAJECTOIRE_START_OBS		6   // TODO : calcul du segment pour sortie de l'obstacle
#define TRAJECTOIRE_STOP_OBS		7   //! la destination est dans un obstacle, on dit � la logique qu'on est bloqu�
#define TRAJECTOIRE_STOP_PAT		8   // trajectoire arr�t�e apr�s un patinage



//	OBJETS CAN PRODUITS PAR LE PIC TRAJECTOIRE :
//	-------------------------------------------

//	Statut
//		- Longueur : 1
//		- B0:
//			0 : on est arriv� o� on voulait
//			1 : on est bloqu�
//			2 : on est en mouvement
//			3 : on est perdu (balises HS et odom�trie dans les choux)
//			4 : le trajet demand� est impossible
#define CO_TRAJECTOIRE_STATUS		CN_TRAJECTOIRE*0x10+0

// R�ponse � l'ordre TRAJ_IS_OBSTACLE.
// Bool�en indiquant si le point d�fini par les coordonn�es envoy�es avec l'ordre est dans un osbtacle fixe (1) ou non (0)
#define CO_TRAJECTOIRE_IS_OBS		CN_TRAJECTOIRE*0x10+1
// R�ponse � l'ordre TRAJ_COMPUTE_LENGTH
// Nombre de cases de la trajectoire depuis la position actuelle du robot jusqu'� la destination donn�e dans l'ordre
// Si le r�sultat est n�gatif, c'est que le calcul de trajectoire est impossible :
//		-1 : la position actuelle du robot est en dehors de la table
//		-2 : la destination est en dehors de la table
//		-3 : la position actuelle du robot est dans un obstacle
//		-4 : la destination est dans un obstacle
//		-5 :  il n'existe pas de trajet possible entre les 2 points
#define CO_TRAJECTOIRE_LENGTH           CN_TRAJECTOIRE*0x10+2

// r�ponse � l'ordre TRAJ_COMPUTE_TIME_PART1, attends le message suivant
#define CO_TRAJECTOIRE_NEXT          CN_TRAJECTOIRE*0x10+3
// r�ponse � l'ordre TRAJ_COMPUTE_TIME_PART2
#define CO_TRAJECTOIRE_TIME           CN_TRAJECTOIRE*0x10+4




//	FONCTIONS POUR INTERFACE AVEC LE PIC TRAJECTOIRE :
//	-------------------------------------------

void canTrajEnable(void);
void TrajectoireOrdre(char cmd, int data0, int data1 , int data2 );

/**
 * @brief D�finition le mode de mouvement
 * @param[in] mode = 1 -> clotho�de; =0-> normal
 * ! Arr�te le mouvement en cours
 */
void SetMode (int mode);

/**
 * @brief Demande � la trajectoire de se rendre en x,y
 * @param[in] position finale (x,y)
 */
void GoToXY (positionInteger pos);

/**
 * @brief Demande � la trajectoire de se rendre en x,y, alpha
 * @param[in] position finale (x,y,alpha) x,y en mm, alpha en deg/10
 */
void GoToXYAlpha (positionInteger pos);

/**
 * @brief Demande � la trajectoire de passer par un point pour le prochain trajet (prochain GOTOXY ou GOTOXYALPHA)
 * @param[in] position passage (x,y)
 */
void Add_Passage_Point_1(positionInteger pas1);

/**
 * @brief Demande � la trajectoire de passer par deux points pour le prochain trajet (prochain GOTOXY ou GOTOXYALPHA)
 * @param[in] pas1 = premi�re position passage (x,y)
 * @param[in] pas2 = deuxi�me position passage (x,y)
 */
void Add_Passage_Point_2(positionInteger pas1, positionInteger pas2);


/**
 * @brief Obtiens le status de la trajectoire
 * @param[in] pas1 = premi�re position passage (x,y)
 * @return Le status de la trajectoire
 */
char TrajGetStatus(void);


void Traj_Marche_Arriere(void);


//	COMMANDES POUR INTERFACE AVEC LE PIC PROPULSION :
//	-------------------------------------------


// demande au g�n�rateur de trajectoire d'aller en x,y
// l'orientation du robot � la fin du mouvement n'a pas d'importance
//		donn�es : 4 octets
//			B0-B1 : x, en mm
//			B2-B3 : y, en mm
#define TRAJ_GOTO_XY					0

// demande au g�n�rateur de trajectoire d'aller en x,y, alpha
// dans ce cas, on donne l'orientation d�sir�e du robot � la fin de mouvement
//		donn�es : 6 octets
//			B0-B1 : x, en mm
//			B2-B3 : y, en mm
//			B4-B5 : alpha, en degr�/10
#define TRAJ_GOTO_XYALPHA				1

// 2014

//Envoie un point de passage pour la trajectoire (feu � retourner)
//			B0-B1 : x, en mm
//			B2-B3 : y, en mm
//			B4: =1 si un seul point de passage, =2 si on attends un autre point de passage
#define TRAJ_PASSAGE_1      2

//Envoie un point de passage pour la trajectoire (feu � retourner)
//			B0-B1 : x, en mm
//			B2-B3 : y, en mm
#define TRAJ_PASSAGE_2      3
// IA DEVRA ENVOYER TRAJ_PASSAGE_1 puis TRAJ_PASSAGE_2 puis TRAJ_GOTO_XY si trajectoire avec point de passage

// fin 2014


// demande au g�n�rateur de trajectoire d'ajouter un obstacle (la taille de l'obstacle d�pend du type
//		donn�es : 6 octets
//			B0-B1 : x, en mm
//			B2-B3 : y, en mm
//			B4	: type
#define TRAJ_ADD_OBSTACLE				4


#define TRAJ_MARCHE_ARRIERE				5

// choisi le mode de mouvement, 0= mode normal; 1=mode clotho�de
//              B0-B1 : mode
#define TRAJ_MODE_SELECT                                 6


#define TRAJ_SEND_STATUS				7

// demande si le point d�fini par les coordonn�es x,y fournies est dans un obstacle fixe
//		donn�es : 4 octets
//			B0-B1 : x, en mm
//			B2-B3 : y, en mm
#define TRAJ_IS_OBSTACLE				8

// demande au g�n�rateur de trajectoire de calculer la longueur d'un trajet, depuis la position
// actuelle du robot, jusqu'� la position fournie. Le calcul tient compte de la pr�sence �ventuelle
// d'un obstacle. Le r�sultat est donn� dans les unit�s utilis�es par le Dijkstra, qui est un
// m�lange de distance entre les cases et de co�t pour les rotations. Cet ordre est donc uniquement
// utile pour comparer 2 trajets et trouver celui qui prendra le moins de temps
//		donn�es : 6 octets : destination du trajet
//			B0-B1 : x, en mm
//			B2-B3 : y, en mm
//			B4-B5 : alpha, en degr�
#define TRAJ_COMPUTE_LENGTH				9

/**
 * @brief Renvoie le temps n�c�ssaire pour aller d'un point x � un point y, 1�re partie du message
 */
#define TRAJ_COMPUTE_TIME_PART1				10
/**
 * @brief Renvoie le temps n�c�ssaire pour aller d'un point x � un point y, 2�re partie du message
 */
#define TRAJ_COMPUTE_TIME_PART2				11


#endif	/* CANTRAJ_H */