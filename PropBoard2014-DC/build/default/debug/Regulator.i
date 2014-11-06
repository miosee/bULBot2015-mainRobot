# 1 "Regulator.c"
# 1 "D:\\Robotique\\codes\\mainRobot\\PropBoard2014-DC//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "Regulator.c"
# 1 "Configware.h" 1




void pllConfig(void);
void canPinAssign(void);
# 2 "Regulator.c" 2
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
# 3 "Regulator.c" 2
# 1 "Consigne.h" 1




# 1 "../CanLib/CanProp.h" 1
# 11 "../CanLib/CanProp.h"
# 1 "../CanLib/CanTypes.h" 1
# 12 "../CanLib/CanProp.h" 2







typedef struct {
 int vi;
 int length;
 int vf;
} moveType;






typedef struct {
 char cmd;
 int data0;
 int data1;
 int data2;
} ordreProp;
# 48 "../CanLib/CanProp.h"
void canPropulsionEnable(void);




positionInteger propulsionGetPosition(void);




propStateType propulsionGetStatus(void);




void propulsionOrdre(char cmd, int data0, int data1 , int data2 );




void propulsionSetPosition(positionInteger pos);





void propulsionTranslation(int acc, int vit, int dist);





void propulsionRotation(int acc, int vit, int dist);




void propulsionStopNow(void);







void propulsionClotho(moveType newmove);







void propulsionTranslaClotho(moveType newmove);
# 6 "Consigne.h" 2

 typedef enum {
  CSG_STANDING = 0,
  CSG_MOVING = 1
 } csgStatusType;




 csgStatusType csgInit(relativeCoord nomVel, relativeCoord nomAcc);

 csgStatusType csgCompute(void);

 void csgSetNomAcc(relativeCoord nomAcc);

 void csgSetNomVel(relativeCoord nomVel);

 void csgSetFinalPos(relativeCoord finalPos);

 relativeCoord csgGetVel(void);

 relativeCoord csgGetPos(void);

 csgStatusType csgGetState(void);

 relativeCoord csgGetNomAcc(void);

 relativeCoord csgGetNomVel(void);

 relativeCoord csgGetFinalPos(void);
# 4 "Regulator.c" 2
# 1 "motors.h" 1
void motorsInit(void);
void motorsEnable(void);
void motorsDisable(void);
void motorsSetSpeed(float dcR, float dcL);
# 5 "Regulator.c" 2
# 1 "c:\\program files (x86)\\microchip\\xc16\\v1.21\\bin\\bin\\../..\\include/math.h" 1 3 4
# 38 "c:\\program files (x86)\\microchip\\xc16\\v1.21\\bin\\bin\\../..\\include/math.h" 3 4
float acosf(float);
float asinf(float);
float atanf(float);
float atan2f(float, float);
float cosf(float);
float sinf(float);
float tanf(float);
float coshf(float);
float sinhf(float);
float tanhf(float);
float expf(float);
float frexpf(float, int *);
float ldexpf(float, int);
float logf(float);
float log10f(float);





float modff(float, void *);



float powf(float, float);
float sqrtf(float);
float ceilf(float);
float fabsf(float);
float floorf(float);
float fmodf(float, float);






long double acosl(long double);
long double asinl(long double);
long double atanl(long double);
long double atan2l(long double, long double);
long double cosl(long double);
long double sinl(long double);
long double tanl(long double);
long double coshl(long double);
long double sinhl(long double);
long double tanhl(long double);
long double expl(long double);
long double frexpl(long double, int *);
long double ldexpl(long double, int);
long double logl(long double);
long double log10l(long double);
long double modfl(long double, long double *);
long double powl(long double, long double);
long double sqrtl(long double);
long double ceill(long double);
long double fabsl(long double);
long double floorl(long double);
long double fmodl(long double, long double);
# 138 "c:\\program files (x86)\\microchip\\xc16\\v1.21\\bin\\bin\\../..\\include/math.h" 3 4
unsigned long __udiv3216(unsigned long, unsigned int);
         long __div3216(long, int);
# 6 "Regulator.c" 2
# 1 "odoLibre.h" 1


void odoInit(void);


void calculeOdometrie(void);

inline relativeCoord odoGetRelVel(void);

inline relativeCoord odoGetRelPos(void);

inline realPosType odoGetAbsPos(void);


inline void odoSetAbsPos(realPosType newPos);
# 7 "Regulator.c" 2
# 1 "Regulator.h" 1
typedef enum {
 PATINAGE_DETECTED = 1,
 NO_PATINAGE = 0
} regType;

void regInit(void);
regType regCompute(void);
# 8 "Regulator.c" 2
# 18 "Regulator.c"
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


 errT = csgPos.l - odoPos.l;
 errR = csgPos.r - odoPos.r;
 errVt = csgVel.l - odoVel.l;
 errVr = csgVel.r - odoVel.r;

 dcTrans = 25*errT + 1*errVt;
 dcRot = 2.8*errR + 50E-3*errVr;


 dcRight = dcTrans + dcRot;
 dcLeft = dcTrans - dcRot;

 if ((dcRight - prRegOldDcRight) > 0.1) {
  dcRight = prRegOldDcRight + 0.1;
 } else if ((prRegOldDcRight - dcRight) > 0.1) {
  dcRight = prRegOldDcRight - 0.1;
 }
 prRegOldDcRight = dcRight;
 if ((dcLeft - prRegOldDcLeft) > 0.1) {
  dcLeft = prRegOldDcLeft + 0.1;
 } else if ((prRegOldDcLeft - dcLeft) > 0.1) {
  dcLeft = prRegOldDcLeft - 0.1;
 }
 prRegOldDcLeft = dcLeft;
 motorsSetSpeed(dcRight, dcLeft);

 if ((fabsf(errT) > 20E-3) || (fabsf(errR) > 100E-3)) {
        return(PATINAGE_DETECTED);
 } else {
  return(NO_PATINAGE);
 }
}
