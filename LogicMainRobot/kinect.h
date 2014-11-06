/**
 * @file kinect.h
 * @brief Headers pour les fonctions de gestion de la Kinect.
 * @author bULBot 2011-2012
 * @author Olivier Desenfans
 */
 
#ifndef DEF_KINECT_H
#define DEF_KINECT_H

#include "CanDspic.h"
#include "CanNetwork.h"
#include "CanPandaboard.h"
#include "CanSerial.h"
#include "globales.h"
#include "timer.h"

/**
 * @brief Initialisation de la communication avec la Pandaboard. 
 * @details D�claration de la consommation des positions des balises 
 * 			et de la production des ordres pour la Pandaboard, la librairie
 *			de gestion de la Kinect et la carte CAN-s�rie. 
 */
void initialisationCanKinect(void); 

/** 
 * @brief Reset du comptage de temps de la boite noire.
 * @note Cette fonction est utilis�e uniquement au d�but du match.
 */
void resetTempsBoiteNoire(void); 

/**
 * @brief Arr�t de la Pandaboard.
 * @details Envoi d'un ordre CAN pour arr�ter la Pandaboard "proprement". 
 */
void stopPandaboard(void); 

#endif
