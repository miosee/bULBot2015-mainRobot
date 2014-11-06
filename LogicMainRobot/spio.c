/**
 * @file SPIO.c
 * @author bULBot 2011-2012
 * @author Olivier Desenfans
 * @brief Assigne les fonctions spéciales aux pattes d'I/O. 
 * @details Configuration des registres d'assignation des fonctions spéciales (UART, CAN) 
 * aux pattes d'entrées sorties (Special Purpose I/O).
 */

#include "spio.h"

//! Fonction d'assignation des I/O. 
void assignSPIO(void) {

	// Pin RC6: entrée digitale (bouton choix d'équipe)
	TRISCbits.TRISC6 = 1; 
	// Pin RC7: entrée digitale (goupille de démarrage)
	TRISCbits.TRISC7 = 1; 
	// Activation du pull-up interne sur la pin RC7. 
	//CNPU2bits.CN17PUE = 1; 
	
	// CAN 
	RPINR26bits.C1RXR = 20; // Assign CAN1RX To Pin RP6
	RPOR9bits.RP19R = 16; 	// Assign CAN1TX To Pin RP7
}

