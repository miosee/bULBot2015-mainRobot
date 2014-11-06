/**
 * @file propulsion.c
 * @brief Implémentation des fonctions de gestion de la propulsion.
 * @author bULBot 2010-2011
 */
 
#include "propulsion.h"

void initialisationCanPropulsion(void)
{
	CanDeclarationProduction(CN_PROPULSION, &ordrePropulsion, sizeof(ordrePropulsion));
	CanDeclarationConsommation(CO_PROP_POS, &position, sizeof(position));	
	CanDeclarationConsommation(CO_PROP_STATUS, &tmpEtatPropulsion, sizeof(tmpEtatPropulsion));
}

void propMove(int acc, int vit, int dist) {

	// Détermine si le robot avance ou recule
	robotMarcheAvant = (dist > 0) ? TRUE : FALSE; 
	// Mouvement réalisé par la propulsion
	mouvementEstPropulsion = TRUE; 

	// Remplissage de l'ordre
	ordrePropulsion[0] = PROP_TRANSLATION; 
	
	// Remplissage des données
	ordrePropulsion[1] = (unsigned char)( acc & 0x00FF );
	ordrePropulsion[2] = (unsigned char)((acc >> 8) & 0x00FF );
	ordrePropulsion[3] = (unsigned char)( vit & 0x00FF );
	ordrePropulsion[4] = (unsigned char)((vit >> 8) & 0x00FF );
	ordrePropulsion[5] = (unsigned char)( dist & 0x00FF );
	ordrePropulsion[6] = (unsigned char)((dist >> 8) & 0x00FF );
	
	CanEnvoiProduction(ordrePropulsion);
	waitxMS(3); 
}

void propMoveAlpha(int accAng, int vitAng, int angle) {

	// Remplissage de l'ordre
	ordrePropulsion[0] = PROP_ROTATION; 
	
	// Remplissage des données
	ordrePropulsion[1] = (unsigned char)( accAng & 0x00FF );
	ordrePropulsion[2] = (unsigned char)((accAng >> 8) & 0x00FF );
	ordrePropulsion[3] = (unsigned char)( vitAng & 0x00FF );
	ordrePropulsion[4] = (unsigned char)((vitAng >> 8) & 0x00FF );
	ordrePropulsion[5] = (unsigned char)( angle & 0x00FF );
	ordrePropulsion[6] = (unsigned char)((angle >> 8) & 0x00FF );
	
	CanEnvoiProduction(ordrePropulsion); 
	waitxMS(3);
}

void setPropPositionAlpha(positionInteger compo)
{
	// Remplissage de l'ordre
	ordrePropulsion[0] = PROP_SET_POS; 
	
	// Remplissage des données
	ordrePropulsion[1] = (unsigned char)( compo.x & 0x00FF );
	ordrePropulsion[2] = (unsigned char)((compo.x >> 8) & 0x00FF );
	ordrePropulsion[3] = (unsigned char)( compo.y & 0x00FF );
	ordrePropulsion[4] = (unsigned char)((compo.y >> 8) & 0x00FF );
	ordrePropulsion[5] = (unsigned char)( compo.angle & 0x00FF );
	ordrePropulsion[6] = (unsigned char)((compo.angle >> 8) & 0x00FF );
	
	CanEnvoiProduction(ordrePropulsion); 
	waitxMS(3);
}

void setPropPositionAlphaXYA(int x, int y,int angle)
{	
	// Remplissage de l'ordre
	ordrePropulsion[0] = PROP_SET_POS; 
	
	// Remplissage des données
	ordrePropulsion[1] = (unsigned char)( x & 0x00FF );
	ordrePropulsion[2] = (unsigned char)((x >> 8) & 0x00FF );
	ordrePropulsion[3] = (unsigned char)( y & 0x00FF );
	ordrePropulsion[4] = (unsigned char)((y >> 8) & 0x00FF );
	ordrePropulsion[5] = (unsigned char)( angle & 0x00FF );
	ordrePropulsion[6] = (unsigned char)((angle >> 8) & 0x00FF );
	
	CanEnvoiProduction(ordrePropulsion); 
	waitxMS(3);
}

void envoiOrdrePropulsion(int cmd, int param1,int param2,int param3)
{
	/*
	ordrePropulsion.cmd = cmd;
	ordrePropulsion.move = param1;
	ordrePropulsion.nothing0=param2;
	ordrePropulsion.nothing1=param3;
	CanEnvoiProduction(&ordrePropulsion);
	*/
	//Delay10KTCYx(50); //sure message go
}


void envoiOrdrePropulsionHold(bool setHold)
{
	ordrePropulsion[0] = PROP_SET_HOLD; 
	
	ordrePropulsion[1] = (setHold) ? PROP_HOLD_ON : PROP_HOLD_OFF; 
	
	CanEnvoiProduction(ordrePropulsion); 
	waitxMS(3);
}


void setAntipatinage(bool on_off)
{
	ordrePropulsion[0] = PROP_PATINAGE_ON_OFF; 
	
	ordrePropulsion[1] = (on_off) ? PROP_PATINAGE_ON : PROP_PATINAGE_OFF; 
	
	CanEnvoiProduction(ordrePropulsion);
	waitxMS(3); 
}

void askPropulsionData(void)
{
	ordrePropulsion[0] = PROP_GET_DATA; 
	
	CanEnvoiProduction(ordrePropulsion); 
	waitxMS(3);
}


void stopPropulsion(void) {

	ordrePropulsion[0] = PROP_STOP_NOW;
	
	CanEnvoiProduction(ordrePropulsion); 
	waitxMS(3); 
}
