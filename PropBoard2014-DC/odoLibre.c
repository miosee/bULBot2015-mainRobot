#include "Configware.h"
#include "globals.h"
#include "constantes.h"
#include "odoLibre.h"
#include "../Peripherals/pps.h"
#include "../Peripherals/timers.h"
#include <math.h>
#include <xc.h>


//#define TEST

#define ODO_POS_TICK_TO_M		(PI*ODO_WHEEL_DIAMETER/ODO_PULSES_PER_WHEEL_REVOLUTION/2)
#define ODO_POS_TICK_TO_RAD		(PI*ODO_WHEEL_DIAMETER/ODO_PULSES_PER_WHEEL_REVOLUTION/ODO_AXLE_LENGTH)
#define ODO_REG_R				(POS1CNT)
#define ODO_REG_L				(POS2CNT)


volatile realPosType prOdoAbsPos;					// position calculée par odométrie libre
volatile relativeCoord prOdoRelVel, prOdoRelPos;


void odoInit(void) {
	// assignation des I/Os du QEI1 (encodeur de droite)
	ppsInConfig(PPS_QEA1, 19);	// RP19 -> QEIA1 (ODO_RA)
	ppsInConfig(PPS_QEB1, 20);	// RP20 -> QEIB1 (ODO_RB)
	// assignation des I/Os du QEI2 (encodeur de gauche)
	ppsInConfig(PPS_QEA2, 6);	// RP6 -> QEIA2  (ODO_LA)
	ppsInConfig(PPS_QEB2, 7);	// RP7 -> QEIB2  (ODO_LB)
	prOdoRelVel.l = 0;
	prOdoRelVel.r = 0;
	prOdoRelPos.l = 0;
	prOdoRelPos.r = 0;
	// right
	QEI1CONbits.CNTERR = 0;
	QEI1CONbits.QEIM2 = 1;		// configure le module encodeur en mode 4x, interruption par l'entrée index
	QEI1CONbits.QEIM1 = 1;
	QEI1CONbits.QEIM0 = 0;
	QEI1CONbits.POSRES = 0;		// reset par l'entrée index désactivée
	QEI1CONbits.SWPAB = 1;		// définit le sens positif de comptage
	ODO_REG_R = 0;				// initialise le compteur du QEI
	// left
	QEI2CONbits.CNTERR = 0;
	QEI2CONbits.QEIM2 = 1;		// configure le module encodeur en mode 4x, interruption par l'entrée index
	QEI2CONbits.QEIM1 = 1;
	QEI2CONbits.QEIM0 = 0;
	QEI2CONbits.POSRES = 0;		// reset par l'entrée index désactivée
	QEI2CONbits.SWPAB = 0;		// définit le sens positif de comptage
	ODO_REG_L = 0;				// initialise le compteur du QEI
	prOdoAbsPos.x = 0;
	prOdoAbsPos.y = 0;
	prOdoAbsPos.alpha = 0;
}


void calculeOdometrie(void) {
	static int prOdoOldLeftCnt = 0, prOdoOldRightcnt = 0;
	int leftVel, rightVel;
	int tmpLeft, tmpRight;
	float tmpFloat, dT, dR;

#ifndef TEST
	// on commence par lire les nouvelles valeurs des encodeurs, pour obtenir le meilleur
	// synchronisme possible ; on fera les calculs après
	tmpLeft = ODO_REG_L;
	tmpRight = ODO_REG_R;
	leftVel = tmpLeft - prOdoOldLeftCnt;
	rightVel = tmpRight - prOdoOldRightcnt;
	prOdoOldLeftCnt = tmpLeft;
	prOdoOldRightcnt = tmpRight;
	//on mesure les delta d'avance et d'angle
	dT = (ODO_CORRECTION_DROITE*rightVel + ODO_CORRECTION_GAUCHE*leftVel)*ODO_POS_TICK_TO_M;
	dR = (ODO_CORRECTION_DROITE*rightVel - ODO_CORRECTION_GAUCHE*leftVel)*ODO_POS_TICK_TO_RAD;
#else
	dT = (float)(((int)OC1RS-(int)OC2RS)+((int)OC3RS-(int)OC4RS));
	dT /= (PR2+1);
	dT *= (1.2/SAMPLE_FREQ);
	dR = (float)(((int)OC1RS-(int)OC2RS)-((int)OC3RS-(int)OC4RS));
	dR /= (PR2+1);
	dR *= (1.2/SAMPLE_FREQ)/0.075;
#endif	// Compute new position version 3 (corde de l'arc de cercle)
	tmpFloat = prOdoAbsPos.alpha + dR/2;
	prOdoAbsPos.x += dT*cos(tmpFloat);
	prOdoAbsPos.y += dT*sin(tmpFloat);
	prOdoAbsPos.alpha = satureAngle(prOdoAbsPos.alpha + dR);
	prOdoRelPos.l += dT;
	prOdoRelPos.r += dR;
	prOdoRelVel.l = dT * SAMPLE_FREQ;
	prOdoRelVel.r = dR * SAMPLE_FREQ;
}


relativeCoord odoGetRelVel(void) {
    return prOdoRelVel;
}

relativeCoord odoGetRelPos(void) {
    return prOdoRelPos;
}

realPosType odoGetAbsPos(void) {
    return prOdoAbsPos;
}

void odoSetAbsPos(realPosType newPos) {
    prOdoAbsPos.x = newPos.x;
    prOdoAbsPos.y = newPos.y;
	prOdoAbsPos.alpha = satureAngle(newPos.alpha);
}
