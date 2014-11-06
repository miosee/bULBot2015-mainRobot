#include "../Canlib/CanDspic.h"
#include "../CanLib/CanProp.h"
#include "../Peripherals/timers.h"
#include "globals.h"
#include "motors.h"
#include "odoLibre.h"
#include "mouvements.h"


// type défini pour pouvoir manipuler efficacement les octets d'un int
union INTEG {
	int i;
	unsigned int ui;
	char b[2];
	unsigned char ub[2];
};


realPosType canDataGetPos(void);

#define MAX_PASSAGEPOINTS	15
positionInteger rpPathG[MAX_PASSAGEPOINTS];


propStateType  canCommand(propStateType state) {
	union INTEG tempINTEG;
	propStateType newState;
	moveParamsType moveParams;
	float dcR, dcL;					//! Variables de travail pour les ordres de l'état TEST
	realPosType curPos;

	if (canReceivedOrderFlag == 1) {
		switch (canReceivedCommand) {
			case PROP_TRANSLATION:
				if ((state == STANDING) || (state == TEST_STANDING)) {
					tempINTEG.ub[0] = canReceivedData[0];		tempINTEG.ub[1] = canReceivedData[1];
					moveParams.acc = tempINTEG.i;
					tempINTEG.ub[0] = canReceivedData[2];		tempINTEG.ub[1] = canReceivedData[3];
					moveParams.vel = tempINTEG.i;
					tempINTEG.ub[0] = canReceivedData[4];		tempINTEG.ub[1] = canReceivedData[5];
					moveParams.length = tempINTEG.i;
					disableIsrTimer1();
					addTranslation(moveParams);
					enableIsrTimer1();
					newState = MOVING;
				}
				break;
			case PROP_ROTATION:
				if ((state == STANDING) || (state == TEST_STANDING)) {
					tempINTEG.ub[0] = canReceivedData[0];
					tempINTEG.ub[1] = canReceivedData[1];
					moveParams.acc = tempINTEG.i;
					tempINTEG.ub[0] = canReceivedData[2];
					tempINTEG.ub[1] = canReceivedData[3];
					moveParams.vel = tempINTEG.i;
					tempINTEG.ub[0] = canReceivedData[4];
					tempINTEG.ub[1] = canReceivedData[5];
					moveParams.length = tempINTEG.i;
					disableIsrTimer1();
					addRotation(moveParams);
					enableIsrTimer1();
					newState = MOVING;
				}
				break;
			case PROP_STOP_NOW:
				disableIsrTimer1();
				stopNow();
				enableIsrTimer1();
				break;
			case PROP_SET_DUTY_CYCLE:
					dcR = ((float) canReceivedData[0]) / 100;
					dcL = ((float) canReceivedData[1]) / 100;
					disableIsrTimer1();
					motorsSetSpeed(dcR, dcL);
					enableIsrTimer1();
				break;
			case PROP_GOTO_XY:
				disableIsrTimer1();
				curPos = odoGetAbsPos();
				enableIsrTimer1();
				nbSeg = findTrajectoire(curPos, canDataGetPos(), rpPathG, obstacle);
				move = GOTO_XY;
				break;
			case PROP_GOTO_XYALPHA:
				rpFinalPos.x = canReceivedData[0] + ((int) (canReceivedData[1]) << 8);
				rpFinalPos.y = canReceivedData[2] + ((int) (canReceivedData[3]) << 8);
				rpFinalPos.alpha = canReceivedData[4] + ((int) (canReceivedData[5]) << 8);
				move = GOTO_XYALPHA;
				break;
			default:
				break;
		}
	}
	canReceivedOrderFlag = 0;
	return(newState);
}


realPosType canDataGetPos(void) {
	union INTEG tempINTEG;
	realPosType pos;

	tempINTEG.ub[0] = canReceivedData[0];		tempINTEG.ub[1] = canReceivedData[1];
	pos.x = tempINTEG.i;
	tempINTEG.ub[0] = canReceivedData[2];		tempINTEG.ub[1] = canReceivedData[3];
	pos.y = tempINTEG.i;
	tempINTEG.ub[0] = canReceivedData[4];		tempINTEG.ub[1] = canReceivedData[5];
	pos.alpha = tempINTEG.i;
	return(pos);
}
