/*!
 * @file timer.c
 * @author Thomas Lemaire
 * @brief Initialisation des registres des timers utilisés.
 * Révision Michel Osée 2014
 */
 
#include "../Canlib/CanProp.h"
#include "timer.h"
#include <xc.h>


volatile int prMatchTimerFlag = 0;

/**
 * @brief Initialisation du deuxième timer 32 bits.
 * @details Configuration des timers 2 et 3 en timers
 * 32 bits pour calculer précisément la durée du match. 
¨*/
void matchTimerInit(void) {
	T2CONbits.TON = 0;		// On arrête les timers 2 et 3 pour les configurer
	T3CONbits.TON = 0;
	T2CONbits.T32 = 1;		// On les combine en un timer 32 bits
	T2CONbits.TCKPS = 1;	// avec un prescaler de 1:8
	T2CONbits.TCS = 0;		// avec Tcy comme horloge
	PR2 = 0x747F;			// pour déborder après 90s => PR = 90s/(8*25ns)-1 = (450E6)-1 = 0x1AD2747F
	PR3 = 0x1AD2; 
	TMR2 = 0;				// on initialise le compteur
	TMR3 = 0; 
	IFS0bits.T3IF = 0; 		// Réinitialisation du flag d'interruption
	IEC0bits.T3IE = 1; 		// Activation de l'interruption
}	


/**
 * @brief Gestion de l'interruption du timer 3.
 * @details Gestion du débordement du compteur de fin de match.
 */
void _ISR _T3Interrupt(void) {
	IFS0bits.T3IF = 0;		// Réinitialisation du flag
	T2CONbits.TON = 0;		// Arrêt du timer
	prMatchTimerFlag = 1;	// Activation du flag de fin de match
	propulsionOrdre(PROP_STOP_NOW, 0, 0, 0);
}

int getMatchTimerFlag(void) {
	return(prMatchTimerFlag);
}


void msTimerInit(void) {
	T1CONbits.TON = 0;		// on arrête le timer pour le configurer
	T1CONbits.TCKPS = 0;	// on utilise Tcy comme horloge
	T1CONbits.TCS = 0;		// avec un prescaler de 1:1
	PR1 = 39999;			//	pour déborder après 1ms => PR = 1ms/25ns-1=39999
	TMR1 = 0;				// on initialise le compteur
}


void waitXms(int x) {
	unsigned int counter = 0; 

	IFS0bits.T1IF = 0;
	T1CONbits.TON = 1;
	while(counter < x) {
		while(!IFS0bits.T1IF);
		IFS0bits.T1IF = 0;
		counter++; 
	}
	T1CONbits.TON = 0;
	TMR1 = 0;
}
