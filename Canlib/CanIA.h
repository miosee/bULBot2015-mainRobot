/* 
 * File:   CanIA.h
 * Author: Florence Yernaux
 *
 * Created on 23 mars 2014, 17:52
 */


#include "CanTypes.h"
#include "CanNetwork.h"

void IARepTime(int , int, int );

//	OBJETS CAN PRODUITS PAR LE PIC LOGIQUE :
//	-------------------------------------------

// 	Ordre pour l'alim
//		- Longueur : 	1
#define CO_LOGIQUE_ALIM		CN_ALIM

// 	Ordre pour la trajectoire
//		- Longueur : 	7
//		- byte 0: commande
//		- bytes 1-2: x en mm
//		- bytes 3-4: y en mm
//		- bytes 5-6: alpha en degre si requis par la commande
#define CO_LOGIQUE_TRAJ		CN_TRAJECTOIRE

// Ordre pour l'odométrie
//		- Longueur : 	7
//		- byte 0: commande
//		- bytes 1-2: x en mm
//		- bytes 3-4: y en mm
//		- bytes 5-6: alpha en degre si requis par la commande
#define CO_LOGIQUE_ODO      CN_ODOMETRIE

// Ordre pour la propulsion
//		- Longueur : 	3
//		- byte 0: commande
//		- bytes 1-2: distance en mm ou angle en degré
#define CO_LOGIQUE_PROP      CN_PROPULSION

//MESSAGE DE STATUT
//		longueur : 7
//		byte 0 :status
//		byte 1 :substatus
//		byte 2 :couleur
//		3-4 : destination demandée : X
//		5-6 : destination demandée : Y
#define CO_LOGIC_STATUS		(CN_LOGIQUE*0x10+0)


//	COMMANDES POUR INTERFACE AVEC LE PIC IA :
//	-------------------------------------------


// Réponse de la trajectoire à l'ordre TimeCompute (calcule le temps mis pour se déplacer entre 2 points)
//  Le temps est codé en int, 100 = 1 seconde
//
//		données : 6 octets
//			B0-B1 : next (=1 -> envoie le message suivant =0 -> temps calculé)
//			B2-B3 : time_normal (= temps calculé par la trajectoire pour aller d'un point à l'autre, en mode normal)
//                      B4-B5:  time_clotho (= temps calculé par la trajectoire pour aller d'un point à l'autre, en mode clotho)
#define IA_REP_TIME					0


