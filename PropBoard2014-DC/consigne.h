#ifndef CONSIGNE_H
#define	CONSIGNE_H


#include "../CanLib/CanProp.h"

	typedef enum {
		CSG_STANDING = 0,
		CSG_MOVING = 1
	} csgStatusType;


	// Initialise le générateur de consigne et renvoie son état initial (CSG_STANDING)
	// Les paramètres de la fonction sont les vitesses et accélérations relatives nominales
	csgStatusType csgInit(relativeCoord nomVel, relativeCoord nomAcc);
	// Calcule les nouvelles consignes. Elle doit être appellée UNE SEULE FOIS à chaque période d'échantillonnage
	csgStatusType csgCompute(void);
	// Modifie les accélérations relatives nominales
	void csgSetNomAcc(relativeCoord nomAcc);
	// Modifie les vitesses relatives nominales
	void csgSetNomVel(relativeCoord nomVel);
	// Définit une nouvelle position finale
	void csgSetFinalPos(relativeCoord finalPos);
	// Renvoie la consigne de vitesses relatives actuelle
	relativeCoord csgGetVel(void);
	// Renvoie la consigne de positions relatives actuelle
	relativeCoord csgGetPos(void);
	// Renvoie l'état actuel du générateur de consigne
	csgStatusType csgGetState(void);
	// Renvoie les accélérations relatives nominales
	relativeCoord csgGetNomAcc(void);
	// Renvoie les vitesses relatives nominales
	relativeCoord csgGetNomVel(void);
	// Renvoie une nouvelle position finale
	relativeCoord csgGetFinalPos(void);

#endif