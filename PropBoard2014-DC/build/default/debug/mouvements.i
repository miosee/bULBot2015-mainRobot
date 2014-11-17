# 1 "mouvements.c"
# 1 "D:\\dev\\GitHub\\bULBot2015-mainRobot\\PropBoard2014-DC//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "mouvements.c"
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
# 2 "mouvements.c" 2
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
# 3 "mouvements.c" 2
# 1 "c:\\program files (x86)\\microchip\\xc16\\v1.21\\bin\\bin\\../..\\include/stdlib.h" 1 3 4






# 1 "c:\\program files (x86)\\microchip\\xc16\\v1.21\\bin\\bin\\../..\\include/stddef.h" 1 3 4



typedef int ptrdiff_t;
typedef unsigned int size_t;
typedef short unsigned int wchar_t;







extern int errno;
# 8 "c:\\program files (x86)\\microchip\\xc16\\v1.21\\bin\\bin\\../..\\include/stdlib.h" 2 3 4
# 24 "c:\\program files (x86)\\microchip\\xc16\\v1.21\\bin\\bin\\../..\\include/stdlib.h" 3 4
typedef struct {
 int quot;
 int rem;
} div_t;
typedef struct {
 unsigned quot;
 unsigned rem;
} udiv_t;
typedef struct {
 long quot;
 long rem;
} ldiv_t;
typedef struct {
 unsigned long quot;
 unsigned long rem;
} uldiv_t;
# 49 "c:\\program files (x86)\\microchip\\xc16\\v1.21\\bin\\bin\\../..\\include/stdlib.h" 3 4
extern double atof(const char *);
extern double strtod(const char *, char **);
# 60 "c:\\program files (x86)\\microchip\\xc16\\v1.21\\bin\\bin\\../..\\include/stdlib.h" 3 4
extern int atoi(const char *);
extern unsigned xtoi(const char *);
extern long atol(const char *);
extern long strtol(const char *, char **, int);
extern unsigned long strtoul(const char *, char **, int);

extern long long atoll(const char *);
extern long long strtoll(const char *, char **, int);
extern unsigned long long strtoull(const char *, char **, int);

extern int rand(void);
extern void srand(unsigned int);
extern void * calloc(size_t, size_t);
extern div_t div(int numer, int denom);
extern udiv_t udiv(unsigned numer, unsigned denom);
extern ldiv_t ldiv(long numer, long denom);
extern uldiv_t uldiv(unsigned long numer,unsigned long denom);




extern void * malloc(size_t);
extern void free(void *);
extern void * realloc(void *, size_t);

extern void



abort(void);

extern void



exit(int);

extern int atexit(void (*)(void));
extern char * getenv(const char *);
extern char ** environ;




extern int system(char *);


extern void qsort(void *, size_t, size_t, int (*)(const void *, const void *));
extern void * bsearch(const void *, void *, size_t, size_t, int(*)(const void *, const void *));
extern int abs(int);
extern long labs(long);

extern char * itoa(char * buf, int val, int base);
extern char * utoa(char * buf, unsigned val, int base);
extern char * ltoa(char * buf, long val, int base);


extern char * ultoa(char * buf, unsigned long val, int base);
# 4 "mouvements.c" 2
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
# 5 "mouvements.c" 2


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
 seg.l = sqrtf(x*x + y*y);
 seg.r = satureAngle(atan2f(y, x) - curPos.alpha);
 return(seg);
}
