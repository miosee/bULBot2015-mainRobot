#include "canProp.h"
#include "CanDspic.h"

positionInteger canCurrentPosition;
ordreProp canOrdrePropulsion;
propStatusType canEtatPosition;

/**
 * @brief Initialisation de la communication avec la propulsion.
 * @details D�claration de la consommation et de la production des
 * diff�rents messages CAN li�s au fonctionnement de la propulsion.
 * D�fini la r�ception de la position et de l'�tat de propulsion.
 */
void canPropulsionEnable(void) {
    CanDeclarationProduction(CN_PROPULSION, &canOrdrePropulsion, sizeof(canOrdrePropulsion));
	CanDeclarationConsommation(CO_PROP_POS, &canCurrentPosition, sizeof(canCurrentPosition));
	CanDeclarationConsommation(CO_PROP_STATUS, &canEtatPosition, sizeof(canEtatPosition));
}

/**
 * @brief Renvoie la position actuelle mesur�e par l'odom�trie
 */
positionInteger propulsionGetPosition(void) {
	positionInteger tmp;

	ACTIVATE_CAN_INTERRUPTS = 0;
    tmp = canCurrentPosition;
	ACTIVATE_CAN_INTERRUPTS = 1;
	return(tmp);
}

/**
 * @brief Renvoie l'�tat du module propulsion
 */
propStatusType propulsionGetStatus(void) {
    return canEtatPosition;
}

/**
 * @brief Ordre CAN g�n�rique � l'odom�trie
 */
void propulsionOrdre(char cmd, int data0, int data1 , int data2 )
{
    canOrdrePropulsion.cmd = cmd;
    canOrdrePropulsion.data0 = data0;
    canOrdrePropulsion.data1 = data1;
    canOrdrePropulsion.data2 = data2;
    CanEnvoiProduction(&canOrdrePropulsion);
}

/**
 * @brief Fixe la position actuelle par un envoi CAN � la propulsion
 */
void propulsionSetPosition(positionInteger pos)
{
    propulsionOrdre(PROP_SET_POS, pos.x, pos.y , pos.alpha);
}

/**
 * @brief ordonne � la propulsion d'effectuer une translation � vitesse et
 * acceleration donn�es
 */
void propulsionTranslation(int acc, int vit, int dist)
{
    propulsionOrdre(PROP_TRANSLATION, acc, vit , dist);
}

/**
 * @brief ordonne � la propulsion d'effectuer une rotation � vitesse et 
 * acceleration donn�es
 */
void propulsionRotation(int acc, int vit, int dist)
{
    propulsionOrdre(PROP_ROTATION, acc, vit , dist);
}

void propulsionStopNow(void)
{
    propulsionOrdre(PROP_STOP_NOW, 0,0,0);
}

