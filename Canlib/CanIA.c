#include "../CanLib/CanDspic.h"
#include "../CanLib/CanIA.h"


char canOrdreIA[7];


//int tmpIsObs, tmpNext, tmpTime;
//int tmpCoTrajLength;
//char tmpStatus;

/**
 * @brief Initialisation de la communication avec la propulsion.
 * @details Déclaration de la consommation et de la production des
 * différents messages CAN liés au fonctionnement de la propulsion.
 * Défini la réception de la position et de l'état de propulsion.
 
void canTrajEnable(void) {
        CanDeclarationProduction(CN_TRAJECTOIRE, &canOrdreTrajectoire, sizeof(canOrdreTrajectoire)); // peut envoyer des ordres à la trajectoire
    //CanDeclarationConsommation(CO_CAPTEURS_OBSTACLE_AVANT, &tmpObstacle, sizeof(tmpObstacle));
	CanDeclarationConsommation(CO_TRAJECTOIRE_STATUS, &tmpStatus, sizeof(tmpStatus));
	CanDeclarationConsommation(CO_TRAJECTOIRE_IS_OBS, &tmpIsObs, sizeof(tmpIsObs));
	CanDeclarationConsommation(CO_TRAJECTOIRE_LENGTH, &tmpCoTrajLength, sizeof(tmpCoTrajLength));
        CanDeclarationConsommation(CO_TRAJECTOIRE_NEXT, &tmpNext, sizeof(tmpNext));
        CanDeclarationConsommation(CO_TRAJECTOIRE_TIME, &tmpTime, sizeof(tmpTime));
}

*/

/**
 * @brief Renvoie la position actuelle mesurée par l'odométrie
 */
//positionInteger TrajGetPosition(void) {
//	positionInteger tmp;

//	ACTIVATE_CAN_INTERRUPTS = 0;
//    tmp = canCurrentPosition;
//	ACTIVATE_CAN_INTERRUPTS = 1;
//	return(tmp);
//}

/**
 * @brief Renvoie l'état du module propulsion
 */
//propStatusType TrajGetStatus(void) {
  //  return canEtatPosition;
//}

/**
 * @brief Ordre CAN générique à l'odométrie
 */


void IAOrdre(char cmd, int data0, int data1 , int data2 )
{
    canOrdreIA[0] = cmd;
    canOrdreIA[1] = (unsigned char)( data0 & 0x00FF );
    canOrdreIA[2] = (unsigned char)( (data0 >> 8) & 0x00FF );
    canOrdreIA[3] = (unsigned char)( data1 & 0x00FF );
    canOrdreIA[4] = (unsigned char)( (data1>> 8) & 0x00FF );
    canOrdreIA[5] = (unsigned char)( data2 & 0x00FF );
    canOrdreIA[6] = (unsigned char)( (data2>> 8) & 0x00FF );
    CanEnvoiProduction(canOrdreIA);
}


/**
 * @brief ordonne à la propulsion d'effectuer une translation à vitesse et
 * acceleration données

void TrajTranslation(int acc, int vit, int dist)
{
    propulsionOrdre(PROP_TRANSLATION, acc, vit , dist);
}
*/

void IARepTime(int next, int time_normal, int time_clotho)
{
    IAOrdre(IA_REP_TIME,next, time_normal, time_clotho);
    
}

