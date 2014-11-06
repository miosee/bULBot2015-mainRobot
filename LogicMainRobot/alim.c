/**
 * @file alim.c
 * @brief Implémentation des fonctions de communication avec l'alimentation.
 * @author bULBot 2011-2012
 * @author Olivier Desenfans
 */
 
#include "alim.h"

void initialisationCanAlim(void) {

	CanDeclarationConsommation(CO_ALIM_STATUS, statutAlim, sizeof(statutAlim)); 
	CanDeclarationProduction(CN_ALIM, &ordreAlim, sizeof(ordreAlim)); 
}

void set12V(bool on) {

	ordreAlim = (on) ? SET_12V_ON : SET_12V_OFF; 
	CanEnvoiProduction(&ordreAlim); 
	waitXms(3);
}

void set24V(bool on) {

	ordreAlim = (on) ? SET_24V_ON : SET_24V_OFF;
	CanEnvoiProduction(&ordreAlim); 
	waitXms(500);
}

