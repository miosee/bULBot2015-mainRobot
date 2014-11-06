#ifndef CONSIGNE_H
#define	CONSIGNE_H


#include "../CanLib/CanProp.h"

	typedef enum {
		CSG_STANDING = 0,
		CSG_MOVING = 1
	} csgStatusType;


	// Initialise le g�n�rateur de consigne et renvoie son �tat initial (CSG_STANDING)
	// Les param�tres de la fonction sont les vitesses et acc�l�rations relatives nominales
	csgStatusType csgInit(relativeCoord nomVel, relativeCoord nomAcc);
	// Calcule les nouvelles consignes. Elle doit �tre appell�e UNE SEULE FOIS � chaque p�riode d'�chantillonnage
	csgStatusType csgCompute(void);
	// Modifie les acc�l�rations relatives nominales
	void csgSetNomAcc(relativeCoord nomAcc);
	// Modifie les vitesses relatives nominales
	void csgSetNomVel(relativeCoord nomVel);
	// D�finit une nouvelle position finale
	void csgSetFinalPos(relativeCoord finalPos);
	// Renvoie la consigne de vitesses relatives actuelle
	relativeCoord csgGetVel(void);
	// Renvoie la consigne de positions relatives actuelle
	relativeCoord csgGetPos(void);
	// Renvoie l'�tat actuel du g�n�rateur de consigne
	csgStatusType csgGetState(void);
	// Renvoie les acc�l�rations relatives nominales
	relativeCoord csgGetNomAcc(void);
	// Renvoie les vitesses relatives nominales
	relativeCoord csgGetNomVel(void);
	// Renvoie une nouvelle position finale
	relativeCoord csgGetFinalPos(void);

#endif