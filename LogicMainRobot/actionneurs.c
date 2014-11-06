/**
 * @file basicActions.c
 * @brief Implémentation des fonctions de communication avec les actionneurs.
 * @author bULBot 2011-2012
 * @author Olivier Desenfans
 */
 
#include "actionneurs.h"

void initialisationCanActionneurs(void) {

	CanDeclarationProduction(CN_ACTIONNEURS, ordreActionneurs, sizeof(ordreActionneurs)); 
	CanDeclarationConsommation(CO_ACTUATOR_STATUS, tmpEtatActionneurs, sizeof(tmpEtatActionneurs));
	CanDeclarationConsommation(CO_CAPTEURS_OBSTACLE_AVANT, detObstAvantStatut, sizeof(detObstAvantStatut));
	CanDeclarationConsommation(CO_CAPTEURS_OBSTACLE_ARRIERE, detObstArriereStatut, sizeof(detObstArriereStatut)); 
}

void alimentationActionneurs(bool on) {

	if(on)
		ordreActionneurs[0] = ACT_POWER_ON;
	
	else 
		ordreActionneurs[0] = ACT_POWER_OFF; 
		
	CanEnvoiProduction(ordreActionneurs);
	waitxMS(3); 
}

void actionPinces(unsigned char sens) {

	if(sens >= 1) {
		ordreActionneurs[0] = ACT_FERMETURE_PINCES; 
	}
	else 
		ordreActionneurs[0] = ACT_OUVERTURE_PINCES; 
	
	CanEnvoiProduction(ordreActionneurs); 
	waitxMS(3);
}

void actionCoffre(int moteur, int sens, unsigned char bangBang, unsigned char vidage) {

	if(moteur == 0 && sens == 1) {
		ordreActionneurs[0] = ACT_MONTEE_PLANCHER; 
	}	
	else if(moteur == 0 && sens == 0) {
		ordreActionneurs[0] = ACT_DESCENTE_PLANCHER; 
	}
	
	if(moteur == 1 && sens == 1) {
		ordreActionneurs[0] = ACT_INCLINAISON_PLANCHER;
		ordreActionneurs[1] = bangBang; 
		ordreActionneurs[2] = vidage; 
	}
	else if(moteur == 1 && sens == 0) {
		ordreActionneurs[0] = ACT_DESINCLINAISON_PLANCHER; 
	}
	
	CanEnvoiProduction(ordreActionneurs); 
	waitxMS(3);
}

void setDetectionObstacle(bool on) {

	ordreActionneurs[0] = CAPTEURS_SET_DETECTION; 
	ordreActionneurs[1] = on;
	
	CanEnvoiProduction(ordreActionneurs); 
	waitxMS(3);  
}

void updateStatut(void) {

	ordreActionneurs[0] = ACT_GET_DATA; 
	CanEnvoiProduction(ordreActionneurs);
	waitxMS(3);
}
