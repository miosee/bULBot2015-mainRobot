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
 * @details D�claration de la consommation et de la production des diff�rents
 * messages CAN permettant de contr�ler le fonctionnement des actionneurs. 
 */
void initialisationCanActionneurs(void);

/** 
 * @brief Allume ou coupe l'alimentation des actionneurs.
 * @details Envoi d'un message CAN correspondant � la mise en route
 * ou � l'arr�t de la carte pour les actionneurs. Lors de la mise en route, 
 * la carte principale attend le paquet de statut de la carte actionneurs
 * pour effectuer un checkup de d�marrage et d�terminer si les moteurs sont
 * d�fectueux ou non. 
 * @param[in] on Bool�en indiquant si l'on allume la carte (on = 1) ou si l'on
 * coupe l'alimentation (on = 0). 
 */
void alimentationActionneurs(bool on);

/**
 * @brief Action sur les pinces.
 * @details Envoi d'un message CAN correspondant � l'ouverture ou la fermeture
 * simultan�e des pinces en fonction du param�tre d'entr�e @p sens. 
 * @param[in] sens Sens du mouvement. Une valeur de 0 indique une ouverture, 
 * une valeur de 1 indique la fermeture. 
 */
void actionPinces(unsigned char sens); 

/**
 * @brief Action sur les moteurs de gestion du coffre.
 * @details Envoi d'un message CAN permettant d'agir sur le moteur d�sign� par
 * le param�tre @p moteur. L'action � effectuer est contenue dans la variable @p sens. 
 * @param[in] moteur Moteur � actionner (0 = moteur de lev�e, 1 = moteur d'inclinaison).
 * @param[in] sens	 Sens dans lequel le moteur doit �tre actionn� (1 = mont�e/inclinaison,
 * 0 = descente/remise � l'horizontale). 
 */
void actionCoffre(int moteur, int sens, unsigned char bangBang, unsigned char vidage);

/**
 * @brief Activation ou d�sactivation de la d�tection d'obstacles par les sharps.
 * @param[in] Bool�en indiquant si la d�tection doit �tre activ�e (1) ou d�sactiv�e (0).
 * @note La d�tection est active par d�faut. 
 */
void setDetectionObstacle(bool on); 

/**
 * @brief Demande de mise � jour du statut du module de gestion des actionneurs.
 */
void updateStatut(void); 

#endif
