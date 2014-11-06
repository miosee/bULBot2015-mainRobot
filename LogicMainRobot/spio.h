/**
 * @file SPIO.h
 * @author bULBot 2011-2012
 * @author Olivier Desenfans
 * @brief Header d'assignation des SPIO. 
 *
 */
 
#ifndef DEF_SPIO_H
#define DEF_SPIO_H 

#include "p33FJ128MC804.h"

//! Définition de la pin du bouton de choix d'équipe. 
#define BOUTON_EQUIPE PORTCbits.RC6
//! Définition de la pin de la goupille de démarrage. 
#define GOUPILLE PORTCbits.RC7

void assignSPIO(void); 

#endif
