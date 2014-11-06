#include "../CanLib/CanDspic.h"
#include "../CanLib/CanIA.h"


char canOrdreIA[7];


//int tmpIsObs, tmpNext, tmpTime;
//int tmpCoTrajLength;
//char tmpStatus;

/**
 * @brief Initialisation de la communication avec la propulsion.
 * @details D�claration de la consommation et de la production des
 * diff�rents messages CAN li�s au fonctionnement de la propulsion.
 * D�fini la r�ception de la position et de l'�tat de propulsion.
 
void canTrajEnable(void) {
        CanDeclarationProduction(CN_TRAJECTOIRE, &canOrdreTrajectoire, sizeof(canOrdreTrajectoire)); // peut envoyer des ordres � la trajectoire
    //CanDeclarationConsommation(CO_CAPTEURS_OBSTACLE_AVANT, &tmpObstacle, sizeof(tmpObstacle));
	CanDeclarationConsommation(CO_TRAJECTOIRE_STATUS, &tmpStatus, sizeof(tmpStatus));
	CanDeclarationConsommation(CO_TRAJECTOIRE_IS_OBS, &tmpIsObs, sizeof(tmpIsObs));
	CanDeclarationConsommation(CO_TRAJECTOIRE_LENGTH, &tmpCoTrajLength, sizeof(tmpCoTrajLength));
        CanDeclarationConsommation(CO_TRAJECTOIRE_NEXT, &tmpNext, sizeof(tmpNext));
        CanDeclarationConsommation(CO_TRAJECTOIRE_TIME, &tmpTime, sizeof(tmpTime));
}

*/

/**
 * @brief Renvoie la position actuelle mesur�e par l'odom�trie
 */
//positionInteger TrajGetPosition(void) {
//	positionInteger tmp;

//	ACTIVATE_CAN_INTERRUPTS = 0;
//    tmp = canCurrentPosition;
//	ACTIVATE_CAN_INTERRUPTS = 1;
//	return(tmp);
//}

/**
 * @brief Renvoie l'�tat du module propulsion
 */
//propStatusType TrajGetStatus(void) {
  //  return canEtatPosition;
//}

/**
 * @brief Ordre CAN g�n�rique � l'odom�trie
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
 * @brief ordonne � la propulsion d'effectuer une translation � vitesse et
 * acceleration donn�es

void TrajTranslation(int acc, int vit, int dist)
{
    propulsionOrdre(PROP_TRANSLATION, acc, vit , dist);
}
*/

void IARepTime(int next, int time_normal, int time_clotho)
{
    IAOrdre(IA_REP_TIME,next, time_normal, time_clotho);
    
}

