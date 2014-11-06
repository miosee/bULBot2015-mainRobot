#include "Configware.h"				//<! Contient la configuration globale du PIC : clock, GPIO
#include "odoLibre.h"
#include "motors.h"
#include "Regulator.h"
#include "consigne.h"
#include "mouvements.h"
#include "generTraj.h"
#include "canCommand.h"
#include "../CanLib/CanDspic.h"
#include "../CanLib/CanNetwork.h"
#include "../CanLib/CanProp.h"
#include "../Peripherals/timers.h"
#include <math.h>


//#define DEBUG_MODE		// Flag permettant de simuler le code en enlevant les parties liées au CAN
#define DBG_PIN0	(LATCbits.LATC5)
#define DBG_PIN1	(LATBbits.LATB5)

// type défini pour pouvoir manipuler efficacement les octets d'un int
union INTEG {
	int i;
	unsigned int ui;
	char b[2];
	unsigned char ub[2];
};

// variables CAN
positionInteger odoPhysPos;		//! position actuelle du robot, en mm et deg/10
propStateType state;
obsType obstacle;

// variables ISR
volatile int isrRegFlag, isrCsgFlag;

void propInterrupt(void) {
	DBG_PIN1 = 1;
	calculeOdometrie();		// on calcule la position absolue mesurée avec les encodeurs libres
	odoPhysPos = positionFloatToInteger(odoGetAbsPos());
	CanEnvoiProduction(&odoPhysPos);
	if (isrCsgFlag) {
		csgCompute();			// on calcule la nouvelle consigne
	}
	if (isrRegFlag) {
		regCompute();			// on exécute le régulateur de position+vitesse
	}
	DBG_PIN1 = 0;
}


typedef struct {
	int int0, int1, int2;
} canDataType;
canDataType getCanData(void);

inline void setPos(void) {
	canDataType canData;
	realPosType curPos;
	
	canData = getCanData();
	curPos.x = canData.int0/1000.0;
	curPos.y = canData.int1/1000.0;
	curPos.alpha = canData.int2*DEG10_TO_RAD;
	disableIsrTimer1();
	odoSetAbsPos(curPos);
	csgSetFinalPos(odoGetRelPos());
	enableIsrTimer1();
}


///////////////////////////////////////////////////////////////////////////////////////////////////
//	MAIN FUNCTION
///////////////////////////////////////////////////////////////////////////////////////////////////
int main(void) {
	propStateType oldState;			//! dernière valeur de l'état envoyée sur le CAN
	csgStatusType csgStatus;
	relativeCoord nomVel;			//! vitesse nominale initiale du robot
	relativeCoord nomAcc;			//! Accélération nominale initiale du robot
	realPosType curPos, finalPos;
	canDataType canData;
	float tmp0, tmp1, tmp2;
	relativeCoord segment;
	realPosType path[15];
	int curSeg, nbSeg, segPhase;
	enum{
		SIMPLE_MOVE,
		GOTO_XY,
		GOTO_XYALPHA
	} move;

	
	pllConfig();		// configure l'horloge de PIC
	canPinAssign();		// assigne les pattes du CAN
	TRISCbits.TRISC5 = 0;
	TRISBbits.TRISB5 = 0;
	state = DISABLED;	// initialisation de la machine d'état
	oldState = state;
	nomVel.l = 1;		// m/s
	nomVel.r = 80;		// rad/s
	nomAcc.l = 1;		// m/s^2
	nomAcc.r = 80;		// rad/s^2
	obstacle.status = OBSTACLE_AUCUN;
	obstacle.x = 0;
	obstacle.y = 0;
	csgInit(nomVel,nomAcc);
	regInit();			// initialise les régulateurs de vitesses et positions
	odoInit();			// initialise les périphériques QEI pour la mesure des encodeurs
	motorsInit();		// initialise les périphériques PWM pour le contrôle des moteurs
#ifndef DEBUG_MODE
	CanInitialisation(CN_PROPULSION);	// Initialise le périphérique CAN
	ACTIVATE_CAN_INTERRUPTS = 1;	    // Enables CAN interrupts
	// Déclare les objets CAN produits par ce PIC
	CanDeclarationProduction(CO_PROP_POS, &odoPhysPos, sizeof(odoPhysPos));
	CanDeclarationProduction(CO_PROP_STATUS, &state, sizeof(state));
	CanEnvoiProduction(&state);
#endif
	isrRegFlag = 0;
	isrCsgFlag = 0;
	timerSetup(TIMER_1, 10);		// Configuration du timer1 pour avoir une base de temps de 10ms
	timerInterrupt(TIMER_1, &propInterrupt);
	timerStart(TIMER_1);
	DBG_PIN0 = 0;
	while (1) {
//		DBG_PIN0 = !DBG_PIN0;
		switch (state) {
			case DISABLED:
				if (canReceivedOrderFlag) {
					switch (canReceivedCommand) {
						case PROP_SET_POS:
							setPos();
							break;
						case PROP_ENABLE:
							disableIsrTimer1();
							motorsEnable(); // on active les moteurs en entrant dans l'état STANDING
							isrRegFlag = 1;
							isrCsgFlag = 1;
							enableIsrTimer1();
							state = STANDING;
							break;
						case PROP_TEST:
							disableIsrTimer1();
							motorsEnable(); // on active les moteurs en entrant dans l'état TEST_STANDING
							isrRegFlag = 0;
							isrCsgFlag = 1;
							enableIsrTimer1();
							state = TEST;
							break;
						default:
							break;
					}
					canReceivedOrderFlag = 0;
				}
				break;
			case STANDING:
				if (canReceivedOrderFlag) {
					switch (canReceivedCommand) {
						case PROP_SET_POS:
							setPos();
							break;
						case PROP_DISABLE:
							disableIsrTimer1();
							motorsDisable(); // on désactive les moteurs en entrant dans l'état DISABLED
							isrRegFlag = 0;
							isrCsgFlag = 0;
							enableIsrTimer1();
							state = DISABLED;
							break;
						case PROP_TRANSLATION:
							canData = getCanData();
							tmp0 = canData.int0/1000.0;
							tmp1 = canData.int1/1000.0;
							tmp2 = canData.int2/1000.0;
							disableIsrTimer1();
							addTranslation(tmp0, tmp1, tmp2);
							enableIsrTimer1();
							move = SIMPLE_MOVE;
							state = MOVING;
							break;
						case PROP_ROTATION:
							canData = getCanData();
							tmp0 = DEG10_TO_RAD*canData.int0;
							tmp1 = DEG10_TO_RAD*canData.int1;
							tmp2 = DEG10_TO_RAD*canData.int2;
							disableIsrTimer1();
							addRotation(tmp0, tmp1, tmp2);
							enableIsrTimer1();
							move = SIMPLE_MOVE;
							state = MOVING;
							break;
						case PROP_GOTO_XY:
							DBG_PIN0 = 1;
							disableIsrTimer1();
							curPos = odoGetAbsPos();
							enableIsrTimer1();
							canData = getCanData();
							finalPos.x = canData.int0/1000.0;
							finalPos.y = canData.int1/1000.0;
							finalPos.alpha = 0;
							nbSeg = findTrajectoire(curPos, finalPos, path, obstacle);
							if (nbSeg < 0) {
								state = nbSeg;
							} else {
								curSeg = 1;
								segPhase = 0;
								move = GOTO_XY;
								state = MOVING;
							}
							DBG_PIN0 = 0;
							break;
						case PROP_GOTO_XYALPHA:
							disableIsrTimer1();
							curPos = odoGetAbsPos();
							enableIsrTimer1();
							canData = getCanData();
							finalPos.x = canData.int0/1000.0;
							finalPos.y = canData.int1/1000.0;
							finalPos.alpha = canData.int2*DEG10_TO_RAD;
							nbSeg = findTrajectoire(curPos, finalPos, path, obstacle);
							if (nbSeg < 0) {
								state = nbSeg;
							} else {
								curSeg = 1;
								segPhase = 0;
								move = GOTO_XYALPHA;
								state = MOVING;
							}
							break;
						default:
							break;
					}
					canReceivedOrderFlag = 0;
				}
				break;
			case MOVING:
				// TODO detection du patinage
				if (canReceivedOrderFlag) {
					switch (canReceivedCommand) {
						case PROP_SET_POS:
							setPos();
							break;
						case PROP_DISABLE:
							disableIsrTimer1();
							motorsDisable(); // on désactive les moteurs en entrant dans l'état DISABLED
							isrRegFlag = 0;
							isrCsgFlag = 0;
							enableIsrTimer1();
							state = DISABLED;
							break;
						case PROP_STOP_NOW:
							disableIsrTimer1();
							stopNow();
							enableIsrTimer1();
							break;
						default:
							break;
					}
					canReceivedOrderFlag = 0;
				}
				disableIsrTimer1();
				csgStatus = csgGetState();
				enableIsrTimer1();
				if (csgStatus == CSG_STANDING) {	// Si la consigne a atteint sa destination
					switch (move) {
						case SIMPLE_MOVE:
							state = STANDING;			// on passe dans l'état STANDING
							break;
						case GOTO_XY:
							if (segPhase == 0) {
								if (curSeg < nbSeg) {		// si il reste des segments à parcourir
									disableIsrTimer1();
									curPos = odoGetAbsPos();
									enableIsrTimer1();
									segment = calcSegment(curPos, path[curSeg]);
									disableIsrTimer1();
									addRotation(nomAcc.r, nomVel.r, segment.r);
									enableIsrTimer1();
									segPhase = 1;
								} else {
									state = STANDING;
								}
							} else {
								disableIsrTimer1();
								addTranslation(nomAcc.l, nomVel.l, segment.l);
								enableIsrTimer1();
								segPhase = 0;
								curSeg++;
							}
							break;
						case GOTO_XYALPHA:
							if (segPhase == 0) {
								if (curSeg < nbSeg) {		// si il reste des segments à parcourir
									disableIsrTimer1();
									curPos = odoGetAbsPos();
									enableIsrTimer1();
									segment = calcSegment(curPos, path[curSeg]);
									disableIsrTimer1();
									addRotation(nomAcc.r, nomVel.r, segment.r);
									enableIsrTimer1();
									segPhase = 1;
								} else if (curSeg == nbSeg) {
									disableIsrTimer1();
									curPos = odoGetAbsPos();
									enableIsrTimer1();
									tmp0 = finalPos.alpha-curPos.alpha;
									disableIsrTimer1();
									addRotation(nomAcc.r, nomVel.r, tmp0);
									enableIsrTimer1();
									curSeg++;
								} else {
									state = STANDING;
								}
							} else {
								disableIsrTimer1();
								addTranslation(nomAcc.l, nomVel.l, segment.l);
								enableIsrTimer1();
								segPhase = 0;
								curSeg++;
							}
							break;
						default:
							break;
					}
				}
				break;
			case TEST:
				if (canReceivedOrderFlag) {
					switch (canReceivedCommand) {
						case PROP_SET_POS:
							setPos();
							break;
						case PROP_DISABLE:
							disableIsrTimer1();
							motorsDisable(); // on désactive les moteurs en entrant dans l'état DISABLED
							isrRegFlag = 0;
							isrCsgFlag = 0;
							enableIsrTimer1();
							state = DISABLED;
							break;
						case PROP_SET_DUTY_CYCLE:
							tmp0 = canReceivedData[0]/100.0;
							tmp1 = canReceivedData[1]/100.0;
							disableIsrTimer1();
							motorsSetSpeed(tmp0, tmp1);
							enableIsrTimer1();
							break;
						default:
							break;
					}
					canReceivedOrderFlag = 0;
				}
				break;
			case TRAJ_START_OUT:
			case TRAJ_END_OUT:
			case TRAJ_START_OBS:
			case TRAJ_END_OBS:
			case TRAJ_NO_WAY:
				if (canReceivedOrderFlag)
					state = STANDING;
				break;

			default:
				break;
		}
	#ifndef DEBUG_MODE
		if (state != oldState) {
			oldState = state;
			CanEnvoiProduction(&state);
		}
	#endif
	}
	return (1);
}


canDataType getCanData(void) {
	canDataType canData;
	union INTEG tempINTEG;

	tempINTEG.ub[0] = canReceivedData[0];		tempINTEG.ub[1] = canReceivedData[1];
	canData.int0 = tempINTEG.i;
	tempINTEG.ub[0] = canReceivedData[2];		tempINTEG.ub[1] = canReceivedData[3];
	canData.int1 = tempINTEG.i;
	tempINTEG.ub[0] = canReceivedData[4];		tempINTEG.ub[1] = canReceivedData[5];
	canData.int2 = tempINTEG.i;

	return(canData);
}
