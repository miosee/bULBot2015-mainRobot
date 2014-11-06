#include "../CanLib/CanDspic.h"
#include "../CanLib/CanTraj.h"
#define FCY 40000000
#include "libpic30.h"

char canOrdreTrajectoire[7];


int tmpCoTrajLength, tmpIsObs;
char tmpStatus;

/**
 * @brief Initialisation de la communication avec la propulsion.
 * @details Déclaration de la consommation et de la production des
 * différents messages CAN liés au fonctionnement de la propulsion.
 * Défini la réception de la position et de l'état de propulsion.
 */
void canTrajEnable(void) {
        CanDeclarationProduction(CN_TRAJECTOIRE, &canOrdreTrajectoire, sizeof(canOrdreTrajectoire)); // peut envoyer des ordres à la trajectoire
    //CanDeclarationConsommation(CO_CAPTEURS_OBSTACLE_AVANT, &tmpObstacle, sizeof(tmpObstacle));
	CanDeclarationConsommation(CO_TRAJECTOIRE_STATUS, &tmpStatus, sizeof(tmpStatus));
	CanDeclarationConsommation(CO_TRAJECTOIRE_IS_OBS, &tmpIsObs, sizeof(tmpIsObs));
	CanDeclarationConsommation(CO_TRAJECTOIRE_LENGTH, &tmpCoTrajLength, sizeof(tmpCoTrajLength));

}

char TrajGetStatus(void) {
    return tmpStatus;
}



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


void TrajectoireOrdre(char cmd, int data0, int data1 , int data2 )
{
    canOrdreTrajectoire[0] = cmd;
    canOrdreTrajectoire[1] = (unsigned char)( data0 & 0x00FF );
    canOrdreTrajectoire[2] = (unsigned char)( (data0 >> 8) & 0x00FF );
    canOrdreTrajectoire[3] = (unsigned char)( data1 & 0x00FF );
    canOrdreTrajectoire[4] = (unsigned char)( (data1>> 8) & 0x00FF );
    canOrdreTrajectoire[5] = (unsigned char)( data2 & 0x00FF );
    canOrdreTrajectoire[6] = (unsigned char)( (data2>> 8) & 0x00FF );
    CanEnvoiProduction(canOrdreTrajectoire);
}


/**
 * @brief ordonne à la propulsion d'effectuer une translation à vitesse et
 * acceleration données

void TrajTranslation(int acc, int vit, int dist)
{
    propulsionOrdre(PROP_TRANSLATION, acc, vit , dist);
}
*/

//int IATimeCompute(positionInteger posi, positionInteger posf)
//{
//    TrajectoireOrdre(TRAJ_COMPUTE_TIME_PART1, posi.x, posi.y, posi.alpha);
//    if(canReceivedOrderFlag) {
//    if(canReceivedCommand==IA_REP_TIME)
//	next = canReceivedData[0] + ((int)(canReceivedData[1]) << 8);
//		time_normal = canReceivedData[2] + ((int)(canReceivedData[3]) << 8);
//		time_clotho = canReceivedData[4] + ((int)(canReceivedData[5]) << 8);
//        canReceivedOrderFlag = 0;
//		}
//    TrajectoireOrdre(TRAJ_COMPUTE_TIME_PART2, posf.x, posf.y, posf.alpha);
//
//}


/**
 * @brief ordonne à la trajectoire de se mettre dans le mode voulu (clothoïde ou normal)
 *    0= mode normal;    1=mode clothoïde
 */

void SetMode (int mode)
{
TrajectoireOrdre(TRAJ_MODE_SELECT, mode, 0,0);
}

void GoToXY (positionInteger pos)
{
    TrajectoireOrdre(TRAJ_GOTO_XY, pos.x, pos.y,0);
}

void GoToXYAlpha (positionInteger pos)
{
    TrajectoireOrdre(TRAJ_GOTO_XYALPHA, pos.x, pos.y, pos.alpha);
}

void Add_Passage_Point_1(positionInteger pas1)
{
    TrajectoireOrdre(TRAJ_PASSAGE_1, pas1.x, pas1.y, 1);
}

void Add_Passage_Point_2(positionInteger pas1, positionInteger pas2)
{
    TrajectoireOrdre(TRAJ_PASSAGE_1, pas1.x, pas1.y, 2);
    __delay_ms(500); // Obligé d'attendre ???
    TrajectoireOrdre(TRAJ_PASSAGE_2, pas2.x, pas2.y, 0);
}

void Traj_Marche_Arriere()
{
TrajectoireOrdre(TRAJ_MARCHE_ARRIERE,0,0,0);
}

/*
void TrajLen(positionInteger pos)
{
    TrajectoireOrdre(TRAJ_COMPUTE_LENGTH, pos.x, pos.y, pos.alpha);
    
}
*/