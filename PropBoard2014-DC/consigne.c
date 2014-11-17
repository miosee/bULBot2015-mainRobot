#include "Configware.h"
#include "Globals.h"
#include "Constantes.h"
#include "consigne.h"


#define TS (1/SAMPLE_FREQ)
#define SQR_TS_DEMI		(TS*TS/2)

relativeCoord	prCsgPos;       // Position actuelle
relativeCoord	prCsgFinalPos;	// Position finale
relativeCoord	prCsgVel;		// Vitesse actuelle
relativeCoord	prCsgNomVel;	// Vitesse nominale
relativeCoord	prCsgNomAcc;	// Accélération nominale
relativeCoord	prMinDist;		// Distance minimum parcourue en 1 période
csgStatusType	prCsgStatus;	// Statut du générateur de consigne



csgStatusType csgInit(relativeCoord nomVel, relativeCoord nomAcc) {
	prCsgPos.l = 0;
	prCsgFinalPos.l = 0;
	prCsgVel.l = 0;
	prCsgNomVel.l = nomVel.l;
	prCsgNomAcc.l = nomAcc.l;
	prMinDist.l = prCsgNomAcc.l*SQR_TS_DEMI;

	prCsgPos.r = 0;
	prCsgFinalPos.r = 0;
	prCsgVel.r = 0;
	prCsgNomVel.r = nomVel.r;
	prCsgNomAcc.r = nomAcc.r;
	prMinDist.r = prCsgNomAcc.r*SQR_TS_DEMI;
	prCsgStatus = CSG_STANDING;
	return(prCsgStatus);
}


void csgSetFinalPos(relativeCoord finalPos) {
	prCsgFinalPos.l = finalPos.l;
	prCsgFinalPos.r = finalPos.r;
	prCsgStatus = CSG_MOVING;
}

// Modifie les accélérations polaires nominales
inline void csgSetNomAcc(relativeCoord nomAcc) {
	if (nomAcc.l >=0) {
		prCsgNomAcc.l = nomAcc.l;
	} else {
		prCsgNomAcc.l = -nomAcc.l;
	}
	if (nomAcc.r >= 0) {
		prCsgNomAcc.r = nomAcc.r;
	} else {
		prCsgNomAcc.r = -nomAcc.r;
	}
	prMinDist.l = prCsgNomAcc.l*SQR_TS_DEMI;
	prMinDist.r = prCsgNomAcc.r*SQR_TS_DEMI;
}

// Modifie les vitesses polaires nominales
inline void csgSetNomVel(relativeCoord nomVel) {
	if (nomVel.l >= 0) {
		prCsgNomVel.l = nomVel.l;
	} else {
		prCsgNomVel.l = -nomVel.l;
	}
	if (nomVel.r >= 0) {
		prCsgNomVel.r = nomVel.r;
	} else {
		prCsgNomVel.r = -nomVel.r;
	}
}

// Renvoie la consigne de vitesse polaire actuelle
inline relativeCoord csgGetVel(void) {
	return(prCsgVel);
}

// Renvoie la consigne de position polaire actuelle
inline relativeCoord csgGetPos(void) {
	return(prCsgPos);
}

// Renvoie la consigne de vitesse polaire actuelle
inline relativeCoord csgGetNomVel(void) {
	return(prCsgNomVel);
}

// Renvoie la consigne de vitesse polaire actuelle
inline relativeCoord csgGetNomAcc(void) {
	return(prCsgNomAcc);
}

// Renvoie la consigne de position polaire actuelle
inline relativeCoord csgGetFinalPos(void) {
	return(prCsgFinalPos);
}

// Renvoie l'état actuel du générateur de consigne
inline csgStatusType csgGetState(void) {
    return(prCsgStatus);
}

csgStatusType csgCompute(void) {
	float tmp;
	float acc;
	float sqrVel;
	csgStatusType state;

	state = CSG_STANDING;
	tmp = ABS(prCsgFinalPos.l - prCsgPos.l);
	if (tmp <= prMinDist.l) {			// si a distance qu'il reste a parcourir est négligeable
		prCsgVel.l = 0;
		prCsgPos.l = prCsgFinalPos.l;
	} else {
		state = CSG_MOVING;
		sqrVel = prCsgVel.l*prCsgVel.l;
		tmp = prCsgPos.l + prCsgVel.l*TS + SIGN(prCsgVel.l)*sqrVel/(2*prCsgNomAcc.l);
		if (prCsgPos.l < prCsgFinalPos.l) {
			if (tmp > prCsgFinalPos.l) {
				acc = sqrVel/(2*(prCsgPos.l - prCsgFinalPos.l));
			} else if (prCsgVel.l < prCsgNomVel.l) {
				if (prCsgVel.l < prCsgNomVel.l-prCsgNomAcc.l*TS) {
					acc = prCsgNomAcc.l;
				} else {
					acc = (prCsgNomVel.l - prCsgVel.l)*SAMPLE_FREQ;
				}
			} else {
				acc = 0;
			}
		} else {
			if (tmp < prCsgFinalPos.l) {
				acc = sqrVel/(2*(prCsgPos.l - prCsgFinalPos.l));
			} else if (prCsgVel.l > -prCsgNomVel.l) {
				if (prCsgVel.l > prCsgNomAcc.l*TS - prCsgNomVel.l) {
					acc = -prCsgNomAcc.l;
				} else {
					acc = -(prCsgNomVel.l + prCsgVel.l)*SAMPLE_FREQ;
				}
			} else {
				acc = 0;
			}
		}
		prCsgPos.l += prCsgVel.l*TS + acc*SQR_TS_DEMI;
		prCsgVel.l += acc*TS;
	}

	if (ABS(prCsgFinalPos.r - prCsgPos.r) <= prMinDist.r) {			// si la distance qu'il reste a parcourir est négligeable
		prCsgVel.r = 0;
		prCsgPos.r = prCsgFinalPos.r;
	} else {
		state = CSG_MOVING;
		sqrVel = prCsgVel.r*prCsgVel.r;
		tmp = prCsgPos.r + prCsgVel.r*TS + SIGN(prCsgVel.r)*sqrVel/(2*prCsgNomAcc.r);
		if (prCsgPos.r < prCsgFinalPos.r) {
			if (tmp > prCsgFinalPos.r) {
				acc = sqrVel/(2*(prCsgPos.r - prCsgFinalPos.r));
			} else if (prCsgVel.r < prCsgNomVel.r) {
				if (prCsgVel.r < prCsgNomVel.r-prCsgNomAcc.r*TS) {
					acc = prCsgNomAcc.r;
				} else {
					acc = (prCsgNomVel.r - prCsgVel.r)*SAMPLE_FREQ;
				}
			} else {
				acc = 0;
			}
		} else {
			if (tmp < prCsgFinalPos.r) {
				acc = sqrVel/(2*(prCsgPos.r - prCsgFinalPos.r));
			} else if (prCsgVel.r > -prCsgNomVel.r) {
				if (prCsgVel.r > prCsgNomAcc.r*TS - prCsgNomVel.r) {
					acc = -prCsgNomAcc.r;
				} else {
					acc = -(prCsgNomVel.r + prCsgVel.r)*SAMPLE_FREQ;
				}
			} else {
				acc = 0;
			}
		}
		prCsgPos.r += prCsgVel.r*TS + acc*SQR_TS_DEMI;
		prCsgVel.r += acc*TS;
	}
	prCsgStatus = state;
	return(prCsgStatus);
}
