#include "globals.h"


inline positionInteger positionFloatToInteger(realPosType posFl) {
    positionInteger pos;

    pos.x = (int)(1000*posFl.x);
    pos.y = (int)(1000*posFl.y);
    pos.alpha = (int)(RAD_TO_DEG10*posFl.alpha);
    return(pos);
}


inline relativeCoordInteger relativeCoordFloatToInteger(relativeCoord posFl) {
    relativeCoordInteger pos;
	
    pos.l = (int)(1000*posFl.l);
    pos.r = (int)(RAD_TO_DEG10*posFl.r);
    return(pos);
}


inline float satureAngle(float angle) {
	while (angle > PI)		angle -= 2*PI;
	while (angle < -PI)		angle += 2*PI;
	return(angle);
}
