/**
 * @file strategie.h
 * @author bULBot 2011-2012
 * @author Olivier Desenfans
 * @brief Module strat�gique: intelligence du robot. 
 * @details D�termination des actions � effectuer en fonction
 * de la situation actuelle du robot. 
 */
 
#ifndef DEF_STRATEGIE_H
#define DEF_STRATEGIE_H

#include "CanDspic.h"
#include "dataTypes.h"
#include "globales.h"
#include "macros.h"
#include "math.h"
 

/**
 * @brief Calcul de l'action la plus appropri�e � effectuer.
 */
action* calculStrategie(void); 

/**
 * @brief Calcul de strat�gie simplifi�e. 
 */
action *calculStrategieSimple(void); 

/**
 * @brief Actualisation des co�ts des diff�rentes actions. 
 */
void actualisationCouts(void); 

#endif
