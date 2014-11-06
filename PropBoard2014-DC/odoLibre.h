#include "globals.h"

void odoInit(void);

//met à jour les positions et vitesses
void calculeOdometrie(void);
// Cette fonction renvoie la vitesse polaire actuelle
inline relativeCoord odoGetRelVel(void);
// Cette fonction renvoie l'intégrale de la vitesse polaire
inline relativeCoord odoGetRelPos(void);
// Cette fonction renvoie la position absolue actuelle
inline realPosType odoGetAbsPos(void);

// Cette fonction modifie la position absolue
inline void odoSetAbsPos(realPosType newPos);
