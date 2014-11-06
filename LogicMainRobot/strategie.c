/**
 * @file strategie.c
 * @author bULBot 2011-2012
 * @author Olivier Desenfans
 * @brief Module stratégique: intelligence du robot. 
 * @details Détermination des actions à effectuer en fonction
 * de la situation actuelle du robot. 
 */
 
#include "strategie.h" 

int distance(positionInteger posAct, positionInteger goal) {

	float xStart = posAct.x, yStart = posAct.y, xGoal = goal.x, yGoal = goal.y;	
	
	float result = sqrt((xStart-xGoal)*(xStart-xGoal) + (yStart-yGoal)*(yStart-yGoal)); 
	
	return (int)result; 
}


action* calculStrategie(void) {

	// Actualisation des coûts
	actualisationCouts(); 

	unsigned int incr, coutMin = COUT_MAX; 
	action* meilleureAction; 
	for (incr = 0; incr < NBRE_ACTIONS; incr++) {
	
		if(actionsPossibles[incr]->cout < coutMin) {
			coutMin = actionsPossibles[incr]->cout; 
			meilleureAction = actionsPossibles[incr]; 
		}
	}
	
	return meilleureAction; 
}

action* calculStrategieSimple(void) {

	int incr; 
	action* meilleureAction; 
	
	if(!coffreEstPlein) {
		for(incr = 0; incr < 4; incr++) {
		
			if(!ordreTotems[incr]->actionFinie && !ordreTotems[incr]->actionRemise) {
				
				meilleureAction = ordreTotems[incr];
				break; 			  
			}
			
			ordreTotems[incr]->actionRemise = FALSE;
		}
	}
	
	else
		meilleureAction = &actionViderCoffre; 
	
	return meilleureAction; 
}

void actualisationCouts (void){
	
	int incr = 0; 
	
	// Section critique: récupération de la position du robot
	ACTIVATE_CAN_INTERRUPTS = 0; 
	positionInteger positionActuelle = position; 
	ACTIVATE_CAN_INTERRUPTS = 1; 
	
	// Si le coffre est plein, il faut aller le vider
	if(coffreEstPlein) {
		
		for(incr = 0; incr < NBRE_ACTIONS; incr++) {
			
			if(actionsPossibles[incr]->type != VIDER_COFFRE)
				actionsPossibles[incr]->cout = COUT_MAX; 
			else 
				actionsPossibles[incr]->cout = 0; 
		}
	}
	
	else {
	
		for(incr = 0; incr < NBRE_ACTIONS; incr++) {
		
			switch(actionsPossibles[incr]->type) {
			
				case VIDER_COFFRE:
					actionsPossibles[incr]->cout = COUT_MAX; 
					break; 
				
				// Evaluation du cout en fonction de la distance	
				case VIDER_DEMI_TOTEM:
					// Si le totem n'est pas déjà vidé
					if(!actionsPossibles[incr]->actionFinie)
						actionsPossibles[incr]->cout = distance(positionActuelle, actionsPossibles[incr]->destination); 
					else 
						actionsPossibles[incr]->cout = COUT_MAX; 
					break; 
				
				default: 
					actionsPossibles[incr]->cout = COUT_MAX; 
					break; 
			}
		}
	}	
}

