/**
 * @file strategie.h
 * @author bULBot 2011-2012
 * @author Olivier Desenfans
 * @brief Module stratégique: intelligence du robot. 
 * @details Détermination des actions à effectuer en fonction
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
 * @brief Calcul de l'action la plus appropriée à effectuer.
 */
action* calculStrategie(void); 

/**
 * @brief Calcul de stratégie simplifiée. 
 */
action *calculStrategieSimple(void); 

/**
 * @brief Actualisation des coûts des différentes actions. 
 */
void actualisationCouts(void); 

#endif
