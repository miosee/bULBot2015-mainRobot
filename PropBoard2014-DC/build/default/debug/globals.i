# 1 "globals.c"
# 1 "D:\\Robotique\\codes\\mainRobot\\PropBoard2014-DC//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "globals.c"
# 1 "globals.h" 1



# 1 "../Canlib/CanTypes.h" 1
# 14 "../Canlib/CanTypes.h"
typedef struct {
 int x;
 int y;
 int alpha;
} positionInteger;




typedef struct {
    int l;
    int r;
} relativeCoordInteger;
# 39 "../Canlib/CanTypes.h"
 typedef enum {
 DISABLED = 0,
 STANDING = 1,
 MOVING = 2,
 TEST_STANDING = 3,
 TEST_MOVING = 4,
 TRAJ_START_OUT = -1,
 TRAJ_END_OUT = -2,
 TRAJ_START_OBS = -3,
 TRAJ_END_OBS = -4,
 TRAJ_NO_WAY = -5
} propStateType;
# 5 "globals.h" 2

typedef struct {
 float x;
 float y;
 float alpha;
} realPosType;

typedef struct {
    float l;
    float r;
} relativeCoord;


positionInteger positionFloatToInteger(realPosType posFl);
relativeCoordInteger relativeCoordFloatToInteger(relativeCoord posFl);
float satureAngle(float angle);
# 2 "globals.c" 2


inline positionInteger positionFloatToInteger(realPosType posFl) {
    positionInteger pos;

    pos.x = (int)(1000*posFl.x);
    pos.y = (int)(1000*posFl.y);
    pos.alpha = (int)((1800.0/(3.14159))*posFl.alpha);
    return(pos);
}


inline relativeCoordInteger relativeCoordFloatToInteger(relativeCoord posFl) {
    relativeCoordInteger pos;

    pos.l = (int)(1000*posFl.l);
    pos.r = (int)((1800.0/(3.14159))*posFl.r);
    return(pos);
}


inline float satureAngle(float angle) {
 while (angle > (3.14159)) angle -= 2*(3.14159);
 while (angle < -(3.14159)) angle += 2*(3.14159);
 return(angle);
}
