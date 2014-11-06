#include "Globals.h"
#include "consigne.h"
#include <stdlib.h>
#include <math.h>


void addTranslation(float acc, float vel, float length) {
	relativeCoord tmp;

	tmp.r = 0;
	tmp.l = acc;
	csgSetNomAcc(tmp);
	tmp.l = vel;
	csgSetNomVel(tmp);
	tmp = csgGetPos();
	tmp.l += length;
	csgSetFinalPos(tmp);
}


void addRotation(float acc, float vel, float length) {
	relativeCoord tmp;

	tmp.l = 0;
	tmp.r = acc;
	csgSetNomAcc(tmp);
	tmp.r = vel;
	csgSetNomVel(tmp);
	tmp = csgGetPos();
	tmp.r += length;
	csgSetFinalPos(tmp);
}


void stopNow(void) {
	relativeCoord vel, acc, pos;

	vel = csgGetVel();
	acc = csgGetNomAcc();
	pos = csgGetPos();
	if (vel.l >0) {
		pos.l += vel.l*vel.l/(2*acc.l);
	} else{
		pos.l -= vel.l*vel.l/(2*acc.l);
	}
	if (vel.r >0) {
		pos.r += vel.r*vel.r/(2*acc.r);
	} else{
		pos.r -= vel.r*vel.r/(2*acc.r);
	}
	csgSetFinalPos(pos);
}


relativeCoord calcSegment(realPosType curPos, realPosType newPos) {
	float x, y;
	 relativeCoord seg;

	x = newPos.x - curPos.x;
	y = newPos.y - curPos.y;
	seg.l = sqrt(x*x + y*y);
	seg.r = satureAngle(atan2(y, x) - curPos.alpha);
	return(seg);
}
