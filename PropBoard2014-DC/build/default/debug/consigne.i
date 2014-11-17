# 1 "consigne.c"
# 1 "D:\\dev\\GitHub\\bULBot2015-mainRobot\\PropBoard2014-DC//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "consigne.c"
# 1 "Configware.h" 1




void pllConfig(void);
void canPinAssign(void);
# 2 "consigne.c" 2
# 1 "Globals.h" 1



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
 TEST = 3,
 TRAJ_START_OUT = -1,
 TRAJ_END_OUT = -2,
 TRAJ_START_OBS = -3,
 TRAJ_END_OBS = -4,
 TRAJ_NO_WAY = -5
} propStateType;
# 5 "Globals.h" 2

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
# 3 "consigne.c" 2
# 1 "Constantes.h" 1
# 4 "consigne.c" 2
# 1 "consigne.h" 1




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
# 6 "consigne.h" 2

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
# 5 "consigne.c" 2





relativeCoord prCsgPos;
relativeCoord prCsgFinalPos;
relativeCoord prCsgVel;
relativeCoord prCsgNomVel;
relativeCoord prCsgNomAcc;
relativeCoord prMinDist;
csgStatusType prCsgStatus;



csgStatusType csgInit(relativeCoord nomVel, relativeCoord nomAcc) {
 prCsgPos.l = 0;
 prCsgFinalPos.l = 0;
 prCsgVel.l = 0;
 prCsgNomVel.l = nomVel.l;
 prCsgNomAcc.l = nomAcc.l;
 prMinDist.l = prCsgNomAcc.l*((1/100.0)*(1/100.0)/2);

 prCsgPos.r = 0;
 prCsgFinalPos.r = 0;
 prCsgVel.r = 0;
 prCsgNomVel.r = nomVel.r;
 prCsgNomAcc.r = nomAcc.r;
 prMinDist.r = prCsgNomAcc.r*((1/100.0)*(1/100.0)/2);
 prCsgStatus = CSG_STANDING;
 return(prCsgStatus);
}


void csgSetFinalPos(relativeCoord finalPos) {
 prCsgFinalPos.l = finalPos.l;
 prCsgFinalPos.r = finalPos.r;
 prCsgStatus = CSG_MOVING;
}


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
 prMinDist.l = prCsgNomAcc.l*((1/100.0)*(1/100.0)/2);
 prMinDist.r = prCsgNomAcc.r*((1/100.0)*(1/100.0)/2);
}


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


inline relativeCoord csgGetVel(void) {
 return(prCsgVel);
}


inline relativeCoord csgGetPos(void) {
 return(prCsgPos);
}


inline relativeCoord csgGetNomVel(void) {
 return(prCsgNomVel);
}


inline relativeCoord csgGetNomAcc(void) {
 return(prCsgNomAcc);
}


inline relativeCoord csgGetFinalPos(void) {
 return(prCsgFinalPos);
}


inline csgStatusType csgGetState(void) {
    return(prCsgStatus);
}

csgStatusType csgCompute(void) {
 float tmp;
 float acc;
 float sqrVel;
 csgStatusType state;

 state = CSG_STANDING;
 tmp = (((prCsgFinalPos.l - prCsgPos.l) < 0) ? -(prCsgFinalPos.l - prCsgPos.l) : (prCsgFinalPos.l - prCsgPos.l));
 if (tmp <= prMinDist.l) {
  prCsgVel.l = 0;
  prCsgPos.l = prCsgFinalPos.l;
 } else {
  state = CSG_MOVING;
  sqrVel = prCsgVel.l*prCsgVel.l;
  tmp = prCsgPos.l + prCsgVel.l*(1/100.0) + (((prCsgVel.l) < 0) ? -1 : 1)*sqrVel/(2*prCsgNomAcc.l);
  if (prCsgPos.l < prCsgFinalPos.l) {
   if (tmp > prCsgFinalPos.l) {
    acc = sqrVel/(2*(prCsgPos.l - prCsgFinalPos.l));
   } else if (prCsgVel.l < prCsgNomVel.l) {
    if (prCsgVel.l < prCsgNomVel.l-prCsgNomAcc.l*(1/100.0)) {
     acc = prCsgNomAcc.l;
    } else {
     acc = (prCsgNomVel.l - prCsgVel.l)*100.0;
    }
   } else {
    acc = 0;
   }
  } else {
   if (tmp < prCsgFinalPos.l) {
    acc = sqrVel/(2*(prCsgPos.l - prCsgFinalPos.l));
   } else if (prCsgVel.l > -prCsgNomVel.l) {
    if (prCsgVel.l > prCsgNomAcc.l*(1/100.0) - prCsgNomVel.l) {
     acc = -prCsgNomAcc.l;
    } else {
     acc = -(prCsgNomVel.l + prCsgVel.l)*100.0;
    }
   } else {
    acc = 0;
   }
  }
  prCsgPos.l += prCsgVel.l*(1/100.0) + acc*((1/100.0)*(1/100.0)/2);
  prCsgVel.l += acc*(1/100.0);
 }

 if ((((prCsgFinalPos.r - prCsgPos.r) < 0) ? -(prCsgFinalPos.r - prCsgPos.r) : (prCsgFinalPos.r - prCsgPos.r)) <= prMinDist.r) {
  prCsgVel.r = 0;
  prCsgPos.r = prCsgFinalPos.r;
 } else {
  state = CSG_MOVING;
  sqrVel = prCsgVel.r*prCsgVel.r;
  tmp = prCsgPos.r + prCsgVel.r*(1/100.0) + (((prCsgVel.r) < 0) ? -1 : 1)*sqrVel/(2*prCsgNomAcc.r);
  if (prCsgPos.r < prCsgFinalPos.r) {
   if (tmp > prCsgFinalPos.r) {
    acc = sqrVel/(2*(prCsgPos.r - prCsgFinalPos.r));
   } else if (prCsgVel.r < prCsgNomVel.r) {
    if (prCsgVel.r < prCsgNomVel.r-prCsgNomAcc.r*(1/100.0)) {
     acc = prCsgNomAcc.r;
    } else {
     acc = (prCsgNomVel.r - prCsgVel.r)*100.0;
    }
   } else {
    acc = 0;
   }
  } else {
   if (tmp < prCsgFinalPos.r) {
    acc = sqrVel/(2*(prCsgPos.r - prCsgFinalPos.r));
   } else if (prCsgVel.r > -prCsgNomVel.r) {
    if (prCsgVel.r > prCsgNomAcc.r*(1/100.0) - prCsgNomVel.r) {
     acc = -prCsgNomAcc.r;
    } else {
     acc = -(prCsgNomVel.r + prCsgVel.r)*100.0;
    }
   } else {
    acc = 0;
   }
  }
  prCsgPos.r += prCsgVel.r*(1/100.0) + acc*((1/100.0)*(1/100.0)/2);
  prCsgVel.r += acc*(1/100.0);
 }
 prCsgStatus = state;
 return(prCsgStatus);
}
