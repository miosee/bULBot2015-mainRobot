/**
 * @file SPIO.c
 * @author bULBot 2011-2012
 * @author Olivier Desenfans
 * @brief Assigne les fonctions sp�ciales aux pattes d'I/O. 
 * @details Configuration des registres d'assignation des fonctions sp�ciales (UART, CAN) 
 * aux pattes d'entr�es sorties (Special Purpose I/O).
 */

#include "spio.h"

//! Fonction d'assignation des I/O. 
void assignSPIO(void) {

	// Pin RC6: entr�e digitale (bouton choix d'�quipe)
	TRISCbits.TRISC6 = 1; 
	// Pin RC7: entr�e digitale (goupille de d�marrage)
	TRISCbits.TRISC7 = 1; 
	// Activation du pull-up interne sur la pin RC7. 
	//CNPU2bits.CN17PUE = 1; 
	
	// CAN 
	RPINR26bits.C1RXR = 20; // Assign CAN1RX To Pin RP6
	RPOR9bits.RP19R = 16; 	// Assign CAN1TX To Pin RP7
}

