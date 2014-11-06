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

//! D�finition de la pin du bouton de choix d'�quipe. 
#define BOUTON_EQUIPE PORTCbits.RC6
//! D�finition de la pin de la goupille de d�marrage. 
#define GOUPILLE PORTCbits.RC7

void assignSPIO(void); 

#endif
