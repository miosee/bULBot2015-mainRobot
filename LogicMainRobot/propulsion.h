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
 * @details D�claration de la consommation et de la production des 
 * diff�rents messages CAN li�s au fonctionnement de la trajectoire. 
 */
void initialisationCanPropulsion(void);

/**
 * @brief D�placement avec les param�tres indiqu�s.
 * @param[in] acc  Acc�l�ration [mm/s^2].
 * @param[in] vit  Vitesse de croisi�re [mm/s].
 * @param[in] dist Distance � parcourir [mm].
 * @param[in] y Ordonn�e d'arriv�e. 
 */
void propMove(int acc, int vit, int dist); 


void propMoveAlpha(int accAng, int vitAng, int angle);
/**
 * @brief Remplace la position actuelle par la position donn�e. 
 * @param[in] compo Nouvelles coordonn�es du robot. 
 */
void setPropPositionAlpha(positionInteger compo);

/**
 * @brief D�placement jusqu'� la position indiqu�e.
 * @param[in] x	Abscisse de la position finale.
 * @param[in] y	Ordonn�e de la position finale.
 * @param[in] angle Angle du robot � l'arriv�e. 
 */
void setPropPositionAlphaXYA(int x, int y, int angle);


/**
 * @brief Envoi d'un ordre quelconque au module de propulsion. 
 * @param[in] cmd	 Ordre � envoyer. 
 * @param[in] param1 Premier param�tre de la commande. 
 * @param[in] param2 Deuxi�me param�tre de la commande.
 * @param[in] param3 Troisi�me param�tre de la commande.
 */
void envoiOrdrePropulsion(int cmd, int param1,int param2,int param3);

/**
 * @brief Configuration du blocage des roues lorsque le robot est � l'arr�t.
 * @param[in] setHold Bool�en indiquant si l'on doit ou non bloquer les roues
 * lorsque le robot est en position stationnaire. 
 */
void envoiOrdrePropulsionHold(bool setHold);

/**
 * @brief Configuration de l'anti-patinage (actif par d�faut).
 * @param[in] on_off Bool�en indiquant s'il faut activer ou non l'anti-patinage. 
 */
void setAntipatinage(bool on_off);

/**
 * @brief Demande de renvoi des productions CAN du module de propulsion. 
 */
void askPropulsionData(void);

/**
 * @brief Ordre d'arr�t imm�diat de la propulsion.
 */
void stopPropulsion(void);


#endif
