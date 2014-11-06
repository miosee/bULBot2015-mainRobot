#ifndef GLOBALS_H
#define GLOBALS_H

#include "../Canlib/CanTypes.h"

typedef struct {
 float x;			// [m]
 float y;			// [m]
 float alpha;		// [rad]
} realPosType;

typedef struct  {
    float l;		// [m]
    float r;		// [rad]
} relativeCoord;


positionInteger positionFloatToInteger(realPosType posFl);
relativeCoordInteger relativeCoordFloatToInteger(relativeCoord posFl);
float satureAngle(float angle);		// ramène l'angle dans l'intervalle -pi -> +pi

#define PI (3.14159)
#define RAD_TO_DEG10	(1800.0/PI)
#define DEG10_TO_RAD	(PI/1800.0)

#define MAX(a, b)   ( ( (a) < (b) )?(b):(a) )
#define MIN(a, b)   ( ( (a) > (b) )?(b):(a) )
#define ABS(a)		( ( (a) > 0 )?(a):(-a) )
#define SIGN(a)		( ( (a) >= 0 )?(1):(-1) )


#endif