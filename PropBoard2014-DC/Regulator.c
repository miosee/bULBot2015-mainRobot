#include "Configware.h"
#include "globals.h"
#include "Consigne.h"
#include "motors.h"
#include <math.h>
#include "odoLibre.h"
#include "Regulator.h"

#define MAXT				20E-3
#define MAXR				100E-3
#define KV_T			 	1		// gain du rÈgulateur de vitesse linÈaire=> terme dÈrivÈ en l
#define KV_R				50E-3	// gain du rÈgulateur de vitesse angulaire=> terme dÈrivÈ en r
#define KP_T				25		// gain du rÈgulateur de position longitudinal=> terme proportionnel en l
#define KP_R				2.8		// gain du rÈgulateur de position transversal=> terme proportionnel en r
#define DC_MAX_DELTA		0.1		// variation maximale du rapport cyclique des moteurs pour une pÈriode


float prRegOldDcLeft, prRegOldDcRight;


void regInit(void) {
	prRegOldDcLeft = 0;
	prRegOldDcRight = 0;
}

regType regCompute(void) {
	relativeCoord odoPos = odoGetRelPos();
	relativeCoord csgPos = csgGetPos();
	relativeCoord odoVel = odoGetRelVel();
	relativeCoord csgVel = csgGetVel();
	float errT, errR, errVt, errVr;
	float dcTrans, dcRot, dcLeft, dcRight;

	// On calcule les erreurs
	errT = csgPos.l - odoPos.l;
	errR = csgPos.r - odoPos.r;
	errVt = csgVel.l - odoVel.l;
	errVr = csgVel.r - odoVel.r;
	// on calcule la sortie des rÈgulateurs de vitesse
	dcTrans = KP_T*errT + KV_T*errVt;
	dcRot = KP_R*errR + KV_R*errVr;
	// on fait le changement de variables entre les rapports cycliques en translation/rotation
	// et ceux en droite/gauche
	dcRight = dcTrans + dcRot;
	dcLeft = dcTrans - dcRot;
	// on limite la variation des rapports cycliques
	if ((dcRight - prRegOldDcRight) > DC_MAX_DELTA) {
		dcRight = prRegOldDcRight + DC_MAX_DELTA;
	} else if ((prRegOldDcRight - dcRight) > DC_MAX_DELTA) {
		dcRight = prRegOldDcRight - DC_MAX_DELTA;
	}
	prRegOldDcRight = dcRight;
	if ((dcLeft - prRegOldDcLeft) > DC_MAX_DELTA) {
		dcLeft = prRegOldDcLeft + DC_MAX_DELTA;
	} else if ((prRegOldDcLeft - dcLeft) > DC_MAX_DELTA) {
		dcLeft = prRegOldDcLeft - DC_MAX_DELTA;
	}
	prRegOldDcLeft = dcLeft;
	motorsSetSpeed(dcRight, dcLeft); // on applique les nouvelles commandes aux moteurs
	// détecte le patinage sur base des erreurs de position
	if ((fabs(errT) > MAXT) || (fabs(errR) > MAXR)) {
        return(PATINAGE_DETECTED);
	} else {
		return(NO_PATINAGE);
	}
}

