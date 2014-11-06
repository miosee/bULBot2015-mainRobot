/**
 * @file gestionActions.c
 * @author bULBot 2011-2012
 * @author Olivier Desenfans
 * @brief Implémentation du module d'actions du robot.  
 */

#include "gestionActions.h"
#include "CanDspic.h"


basicAction demarrageJauneFct(unsigned int etape) {
	basicAction etapeEnCours;
	positionInteger pos = {1000, 1000, 0};

	switch(etape) {
		case 0:
			GoToXYAlpha(pos);
			etapeEnCours = ACTION_TRAJECTOIRE;
			break;
		default:
			etapeEnCours = ACTION_AUCUNE;
			break;
	}
	return etapeEnCours;
}


basicAction demarrageRougeFct(unsigned int etape) {
	basicAction etapeEnCours;
	positionInteger pos = {2500, 1000, 1800};

	switch(etape) {
		case 0:
			GoToXYAlpha(pos);
			etapeEnCours = ACTION_TRAJECTOIRE;
			break;
		default:
			etapeEnCours = ACTION_AUCUNE;
			break;
	}
	return etapeEnCours;
}
