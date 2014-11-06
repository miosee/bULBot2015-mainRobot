#include "CanProp.h"
#include "CanDspic.h"

positionInteger canCurrentPosition;
char canOrdrePropulsion[7];
propStateType canEtatPosition;
//int patinage;

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
   // CanDeclarationConsommation(CO_PROP_PATINAGE, &patinage, sizeof(patinage));
}

/**
 * @brief Renvoie la position actuelle mesur�e par l'odom�trie 
 * @Details Le canCurrentPosition est mis � jour d�s que la propulsion le met sur le CAN
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
 * @Details Le canEtatPosition est mis � jour d�s que la propulsion le met sur le CAN
 */
propStateType propulsionGetStatus(void) {
    return canEtatPosition;
}

/**
 * @brief Ordre CAN g�n�rique � l'odom�trie (fonction interne)
 */
void propulsionOrdre(char cmd, int data0, int data1 , int data2 )
{
    canOrdrePropulsion[0] = cmd;
    canOrdrePropulsion[1] = (unsigned char)( data0 & 0x00FF );
    canOrdrePropulsion[2] = (unsigned char)( (data0 >> 8) & 0x00FF );
    canOrdrePropulsion[3] = (unsigned char)( data1 & 0x00FF );
    canOrdrePropulsion[4] = (unsigned char)( (data1>> 8) & 0x00FF );
    canOrdrePropulsion[5] = (unsigned char)( data2 & 0x00FF );
    canOrdrePropulsion[6] = (unsigned char)( (data2>> 8) & 0x00FF );
    CanEnvoiProduction(canOrdrePropulsion);
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
void propulsionTranslation(int acc, int vit, int dist) {
    propulsionOrdre(PROP_TRANSLATION, acc, vit , dist);	// on envoie l'ordre
	while(propulsionGetStatus() == MOVING);				// on attend que le mouvement ait commenc�
}

/**
 * @brief ordonne � la propulsion d'effectuer une rotation � vitesse et 
 * acceleration donn�es
 */
void propulsionRotation(int acc, int vit, int dist) {
    propulsionOrdre(PROP_ROTATION, acc, vit , dist);	// on envoie l'ordre
	while(propulsionGetStatus() == MOVING);				// on attend que le mouvement ait commenc�

}

void propulsionStopNow(void){
    propulsionOrdre(PROP_STOP_NOW, 0,0,0);
}
