/*!
 * @file interruption.c
 * @author Thomas Lemaire
 * @brief Impl�mentation des interruptions.
 * @details Impl�mentation de la base de temps via le timer T1. 
 * Impl�mentation de la r�ception de messages via UART. 
*/

#include <xc.h>
#include "globales.h"
#include "CanProp.h"

/*!
@brief Fonction d'initialisation des interruptions. 
@details Initialise les interruptions pour le Timer 1, l'UART1 et l'UART2. 
*/
void interruptInit(void){
	INTCON1bits.NSTDIS=1;//nesting disabled

	//Interruption li�e au d�bordement du timer 1
	IEC0bits.T1IE=0;		//disable
	IFS0bits.T1IF=0;		//R�initialisation du flag
	IEC0bits.T1IE=1;		//active l'interruption
	
	// Interruption li�e au timer 32 bits (timers 2 et 3)
	IEC0bits.T3IE = 0; 		// disable
}


//Routine d'interruption pour le d�bordement du timer 1
void _ISR _T1Interrupt(void){	
	 
	flagMilliseconde = 1; 
	IFS0bits.T1IF=0;	//R�initialisation du flag
	
}
