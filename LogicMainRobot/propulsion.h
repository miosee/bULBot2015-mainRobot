/**
 * @file propulsion.h
 * @brief Fonctions de gestion de la propulsion via CAN.
 * @author bULBot 2010-2011
 */
 
#ifndef DEF_PROPULSION_H
#define DEF_PROPULSION_H

#include "CanDspic.h"
#include "CanProp.h"
#include "dataTypes.h"
#include "globales.h"
#include "timer.h"
#include "trajectoire.h"

#define MAX_VELOCITY 		950 //950
#define MIN_VELOCITY 		350
#define AVERAGE_VELOCITY 	600 //((MAX_VELOCITY+MIN_VELOCITY)/2)

#define ORDRETRAJ2ORDREPROP(t,p)	p.cmd  = t.cmd;\
									p.move = t.compo.x;\
									p.nothing0 = t.compo.y;\
									p.nothing1 = t.compo.angle;

#define ORDRETRAJ2ORDREPROP2(t,p)	p.cmd  = t.cmd+((t.compo.x%256)<<8);\
									p.move = (t.compo.x>>8)+((t.compo.y%256)<<8);\
									p.nothing0 = (t.compo.y>>8)+((t.compo.angle%256)<<8);\
									p.nothing1 = t.compo.angle>>8;
									
#define ORDREMVT2ORDREPROP(m, p)    p.cmd 	   = m.cmd; 		\
									p.move 	   = m.acc; 		\
									p.nothing0 = m.vit; 		\
									p.nothing1 = m.dist; 		

//! Retourne la position actuelle du robot.
#define GetCurrentPosition()	position;
//! Retourne le statut du module de gestion de la propulsion. 
#define GetPropulsionStatus()	tmpEtatPropulsion;

/**
 * @brief Initialisation de la communication avec la trajectoire. 
 * @details Déclaration de la consommation et de la production des 
 * différents messages CAN liés au fonctionnement de la trajectoire. 
 */
void initialisationCanPropulsion(void);

/**
 * @brief Déplacement avec les paramètres indiqués.
 * @param[in] acc  Accélération [mm/s^2].
 * @param[in] vit  Vitesse de croisière [mm/s].
 * @param[in] dist Distance à parcourir [mm].
 * @param[in] y Ordonnée d'arrivée. 
 */
void propMove(int acc, int vit, int dist); 


void propMoveAlpha(int accAng, int vitAng, int angle);
/**
 * @brief Remplace la position actuelle par la position donnée. 
 * @param[in] compo Nouvelles coordonnées du robot. 
 */
void setPropPositionAlpha(positionInteger compo);

/**
 * @brief Déplacement jusqu'à la position indiquée.
 * @param[in] x	Abscisse de la position finale.
 * @param[in] y	Ordonnée de la position finale.
 * @param[in] angle Angle du robot à l'arrivée. 
 */
void setPropPositionAlphaXYA(int x, int y, int angle);


/**
 * @brief Envoi d'un ordre quelconque au module de propulsion. 
 * @param[in] cmd	 Ordre à envoyer. 
 * @param[in] param1 Premier paramètre de la commande. 
 * @param[in] param2 Deuxième paramètre de la commande.
 * @param[in] param3 Troisième paramètre de la commande.
 */
void envoiOrdrePropulsion(int cmd, int param1,int param2,int param3);

/**
 * @brief Configuration du blocage des roues lorsque le robot est à l'arrêt.
 * @param[in] setHold Booléen indiquant si l'on doit ou non bloquer les roues
 * lorsque le robot est en position stationnaire. 
 */
void envoiOrdrePropulsionHold(bool setHold);

/**
 * @brief Configuration de l'anti-patinage (actif par défaut).
 * @param[in] on_off Booléen indiquant s'il faut activer ou non l'anti-patinage. 
 */
void setAntipatinage(bool on_off);

/**
 * @brief Demande de renvoi des productions CAN du module de propulsion. 
 */
void askPropulsionData(void);

/**
 * @brief Ordre d'arrêt immédiat de la propulsion.
 */
void stopPropulsion(void);


#endif
