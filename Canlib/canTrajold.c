#include "canProp.h"
#include "CanDspic.h"

positionInteger canCurrentPosition;
ordreProp canOrdrePropulsion;
propStatusType canEtatPosition;

/**
 * @brief Initialisation de la communication avec la propulsion.
 * @details Déclaration de la consommation et de la production des
 * différents messages CAN liés au fonctionnement de la propulsion.
 * Défini la réception de la position et de l'état de propulsion.
 */
void canPropulsionEnable(void) {
    CanDeclarationProduction(CN_PROPULSION, &canOrdrePropulsion, sizeof(canOrdrePropulsion));
	CanDeclarationConsommation(CO_PROP_POS, &canCurrentPosition, sizeof(canCurrentPosition));
	CanDeclarationConsommation(CO_PROP_STATUS, &canEtatPosition, sizeof(canEtatPosition));
}

/**
 * @brief Renvoie la position actuelle mesurée par l'odométrie
 */
positionInteger propulsionGetPosition(void) {
	positionInteger tmp;

	ACTIVATE_CAN_INTERRUPTS = 0;
    tmp = canCurrentPosition;
	ACTIVATE_CAN_INTERRUPTS = 1;
	return(tmp);
}

/**
 * @brief Renvoie l'état du module propulsion
 */
propStatusType propulsionGetStatus(void) {
    return canEtatPosition;
}

/**
 * @brief Ordre CAN générique à l'odométrie
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
 * @brief Fixe la position actuelle par un envoi CAN à la propulsion
 */
void propulsionSetPosition(positionInteger pos)
{
    propulsionOrdre(PROP_SET_POS, pos.x, pos.y , pos.alpha);
}

/**
 * @brief ordonne à la propulsion d'effectuer une translation à vitesse et
 * acceleration données
 */
void propulsionTranslation(int acc, int vit, int dist)
{
    propulsionOrdre(PROP_TRANSLATION, acc, vit , dist);
}

/**
 * @brief ordonne à la propulsion d'effectuer une rotation à vitesse et 
 * acceleration données
 */
void propulsionRotation(int acc, int vit, int dist)
{
    propulsionOrdre(PROP_ROTATION, acc, vit , dist);
}

void propulsionStopNow(void)
{
    propulsionOrdre(PROP_STOP_NOW, 0,0,0);
}

