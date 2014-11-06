/**
 * @file trajectoire.h
 * @brief Fonctions de gestion de la trajectoire via CAN. 
 * @author bULBot 2010-2011
 */
 
#ifndef DEF_TRAJECTOIRE_H
#define DEF_TRAJECTOIRE_H

#include "CanTrajectoire.h"
#include "CanDspic.h"
#include "dataTypes.h"
#include "globales.h"
#include "propulsion.h"
#include "timer.h"

//! Renvoi du statut de la trajectoire. 
#define GetTrajectoireStatus() tmpTrajStatus;

/**
 * @brief Initialisation de la communication avec la trajectoire. 
 * @details D�claration de la consommation et de la production des 
 * diff�rents messages CAN li�s au fonctionnement de la trajectoire. 
 */
void initialisationCanTrajectoire(void);

/**
 * @brief D�placement jusqu'� la position donn�e.
 * @param[in] c positionInteger du point d'arriv�e.
 */
void moveTo(const positionInteger c);

/**
 * @brief D�placement jusqu'� la position et l'angle donn�s.
 * @param[in] x 	Abscisse du point d'arriv�e. 
 * @param[in] y 	Ordonn�e du point d'arriv�e.
 * @param[in] alpha Angle d'arriv�e du robot. 
 */
void moveToXYA(int x,int y, int alpha);


/**
 * @brief D�placement jusqu'� la position donn�e.
 * @param[in] x		Abscisse du point d'arriv�e.
 * @param[in] y		Ordonn�e du point d'arriv�e. 
 */
void moveToXY(int x,int y);

/** 
 * @brief Fonction qui d�finit si l'obstacle d�tect� par les sharps fait partie des obstacles du terrain.
 * @details Envoi d'un message CAN � la trajectoire pour comparer les coordonn�es de l'obstacle
 * 			d�tect� � celles des obstacles pr�sents sur la carte. 
 * @param[in] obstStatut Obstacle d�tect� via les sharps.
 * @returns   Bool�en d�finissant si l'obstacle @obstStatut est effectivement un obstacle fixe.
 */
bool estUnObstacle(unsigned char obstStatut[5]);

/**
 * @brief Fonction renvoyant le co�t estim� par la trajectoire pour le d�placement vers la @p destination.
 * @param[in] destination Destination consid�r�e.
 * @note Cette fonction renvoie un entier qui repr�sente le co�t estim� par la trajectoire. Cette valeur
 * 		 n'a pas d'unit�s explicites et doit seulement �tre utilis�e pour comparer deux trajectoires entre 
 *		 elles. 
 */
int distanceViaTrajectoire(const positionInteger destination);

#endif
