/**
 * @file kinect.c
 * @brief Fonctions de gestion de la communication avec la Kinect.
 * @author bULBot 2011-2012
 * @author Olivier Desenfans 
 */
 
#include "kinect.h"

void initialisationCanKinect(void) {

	CanDeclarationProduction(CN_SERIAL, &ordreSerial, sizeof(ordreSerial)); 
	CanDeclarationProduction(CN_KINECT, &ordreKinect, sizeof(ordreKinect)); 
	CanDeclarationProduction(CN_PANDABOARD, &ordrePandaboard, sizeof(ordrePandaboard)); 
	CanDeclarationConsommation(CO_KINECT_BALISE_1, &positionBalise1, sizeof(positionBalise1));
	CanDeclarationConsommation(CO_KINECT_BALISE_2, &positionBalise2, sizeof(positionBalise2)); 
}


void resetTempsBoiteNoire(void) {

	ordreSerial = SERIAL_RESET_TIME; 
	
	CanEnvoiProduction(&ordreSerial); 
	waitxMS(3); 
}

void stopPandaboard(void) {

	ordrePandaboard = PANDA_STOP; 
	
	CanEnvoiProduction(&ordrePandaboard); 
	waitxMS(3); 
}
