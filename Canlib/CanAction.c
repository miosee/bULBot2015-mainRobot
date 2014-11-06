#include "../CanLib/CanDspic.h"
#include "../CanLib/CanAction.h"
#include "../Canlib/CanNetwork.h"
#define FCY 40000000
#include "libpic30.h"

char canOrdreAction[7];

char tmpStatusA;
int fresque1, fresque2;

/**
 * @brief Initialisation de la communication avec la propulsion.
 * @details Déclaration de la consommation et de la production des
 * différents messages CAN liés au fonctionnement de la propulsion.
 * Défini la réception de la position et de l'état de propulsion.
 */
void canActionEnable(void) {
	CanDeclarationProduction(CN_ACTIONNEUR, &canOrdreAction, sizeof(canOrdreAction)); // peut envoyer des ordres à la trajectoire
	//CanDeclarationConsommation(CO_CAPTEURS_OBSTACLE_AVANT, &tmpObstacle, sizeof(tmpObstacle));
	CanDeclarationConsommation(CO_ACTION_STATUS, &tmpStatusA, sizeof(tmpStatusA));
	CanDeclarationConsommation(CO_ACTION_FRESQUE1, &fresque1, sizeof(fresque1));
	CanDeclarationConsommation(CO_ACTION_FRESQUE2, &fresque2, sizeof(fresque2));
}

char ActionGetStatus(void) {
    return tmpStatusA;
}

// si fresque=1, elle est collée sur le mur
// si fresque=0, elle est toujours collée au robot
int ActionGetFresque1 (void) {
	return(fresque1);
}

int ActionGetFresque2 (void) {
	return(fresque2);
}


void ActionOrdre(char cmd, int data0, int data1 , int data2) {
    canOrdreAction[0] = cmd;
    canOrdreAction[1] = (unsigned char)( data0 & 0x00FF );
    canOrdreAction[2] = (unsigned char)( (data0 >> 8) & 0x00FF );
    canOrdreAction[3] = (unsigned char)( data1 & 0x00FF );
    canOrdreAction[4] = (unsigned char)( (data1>> 8) & 0x00FF );
    canOrdreAction[5] = (unsigned char)( data2 & 0x00FF );
    canOrdreAction[6] = (unsigned char)( (data2>> 8) & 0x00FF );
    CanEnvoiProduction(canOrdreAction);
}


void TirMammouth(void) {
    ActionOrdre(KILL_MAMMOTH,0,0,0);
}

// Demande que la carte action mette à jour la valeur des status des fresques
void StatusFresque(void) {
    ActionOrdre(STATUS_FRESCO,0,0,0);
}


