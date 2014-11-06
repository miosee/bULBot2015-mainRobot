/**
 * @file actionneurs.h
 * @brief Fonctions de gestion des actionneurs via CAN.
 * @author bULBot 2011-2012
 * @author Olivier Desenfans
 */

#ifndef DEF_BASICACTIONS_H
#define DEF_BASICACTIONS_H

#include "CanActionneurs.h"
#include "CanDspic.h"
#include "CanNetwork.h"
#include "globales.h"
#include "timer.h"


/**
 * @brief Initialisation de la communication avec les actionneurs.
 * @details Déclaration de la consommation et de la production des différents
 * messages CAN permettant de contrôler le fonctionnement des actionneurs. 
 */
void initialisationCanActionneurs(void);

/** 
 * @brief Allume ou coupe l'alimentation des actionneurs.
 * @details Envoi d'un message CAN correspondant à la mise en route
 * ou à l'arrêt de la carte pour les actionneurs. Lors de la mise en route, 
 * la carte principale attend le paquet de statut de la carte actionneurs
 * pour effectuer un checkup de démarrage et déterminer si les moteurs sont
 * défectueux ou non. 
 * @param[in] on Booléen indiquant si l'on allume la carte (on = 1) ou si l'on
 * coupe l'alimentation (on = 0). 
 */
void alimentationActionneurs(bool on);

/**
 * @brief Action sur les pinces.
 * @details Envoi d'un message CAN correspondant à l'ouverture ou la fermeture
 * simultanée des pinces en fonction du paramètre d'entrée @p sens. 
 * @param[in] sens Sens du mouvement. Une valeur de 0 indique une ouverture, 
 * une valeur de 1 indique la fermeture. 
 */
void actionPinces(unsigned char sens); 

/**
 * @brief Action sur les moteurs de gestion du coffre.
 * @details Envoi d'un message CAN permettant d'agir sur le moteur désigné par
 * le paramètre @p moteur. L'action à effectuer est contenue dans la variable @p sens. 
 * @param[in] moteur Moteur à actionner (0 = moteur de levée, 1 = moteur d'inclinaison).
 * @param[in] sens	 Sens dans lequel le moteur doit être actionné (1 = montée/inclinaison,
 * 0 = descente/remise à l'horizontale). 
 */
void actionCoffre(int moteur, int sens, unsigned char bangBang, unsigned char vidage);

/**
 * @brief Activation ou désactivation de la détection d'obstacles par les sharps.
 * @param[in] Booléen indiquant si la détection doit être activée (1) ou désactivée (0).
 * @note La détection est active par défaut. 
 */
void setDetectionObstacle(bool on); 

/**
 * @brief Demande de mise à jour du statut du module de gestion des actionneurs.
 */
void updateStatut(void); 

#endif
