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
 * @details Déclaration de la consommation et de la production des 
 * différents messages CAN liés au fonctionnement de la trajectoire. 
 */
void initialisationCanTrajectoire(void);

/**
 * @brief Déplacement jusqu'à la position donnée.
 * @param[in] c positionInteger du point d'arrivée.
 */
void moveTo(const positionInteger c);

/**
 * @brief Déplacement jusqu'à la position et l'angle donnés.
 * @param[in] x 	Abscisse du point d'arrivée. 
 * @param[in] y 	Ordonnée du point d'arrivée.
 * @param[in] alpha Angle d'arrivée du robot. 
 */
void moveToXYA(int x,int y, int alpha);


/**
 * @brief Déplacement jusqu'à la position donnée.
 * @param[in] x		Abscisse du point d'arrivée.
 * @param[in] y		Ordonnée du point d'arrivée. 
 */
void moveToXY(int x,int y);

/** 
 * @brief Fonction qui définit si l'obstacle détecté par les sharps fait partie des obstacles du terrain.
 * @details Envoi d'un message CAN à la trajectoire pour comparer les coordonnées de l'obstacle
 * 			détecté à celles des obstacles présents sur la carte. 
 * @param[in] obstStatut Obstacle détecté via les sharps.
 * @returns   Booléen définissant si l'obstacle @obstStatut est effectivement un obstacle fixe.
 */
bool estUnObstacle(unsigned char obstStatut[5]);

/**
 * @brief Fonction renvoyant le coût estimé par la trajectoire pour le déplacement vers la @p destination.
 * @param[in] destination Destination considérée.
 * @note Cette fonction renvoie un entier qui représente le coût estimé par la trajectoire. Cette valeur
 * 		 n'a pas d'unités explicites et doit seulement être utilisée pour comparer deux trajectoires entre 
 *		 elles. 
 */
int distanceViaTrajectoire(const positionInteger destination);

#endif
