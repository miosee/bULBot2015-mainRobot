#ifndef DEF_GLOBALES_H
#define DEF_GLOBALES_H

#include "dataTypes.h"
#include "macros.h"

extern unsigned char flagMilliseconde; 

extern point positionRobotAdv1;
extern point positionRobotAdv2;
extern point positionPieces[NBRE_PIECES];

// Alimentation
extern unsigned char statutAlim[2];
extern unsigned char ordreAlim; 

// Actionneurs
extern unsigned char ordreActionneurs[3]; 
extern unsigned char tmpEtatActionneurs[3]; 
extern unsigned char detObstAvantStatut[5]; 
extern unsigned char detObstArriereStatut[5];  
extern char caseEstObstacle; 
extern int coutTrajectoire; 

// Trajectoire
extern unsigned char ordreTrajectoire[7];
extern unsigned char tmpTrajStatus; 

// Propulsion
extern unsigned char ordrePropulsion[7]; 
extern unsigned char tmpEtatPropulsion; 
extern positionInteger position; 
extern unsigned char robotMarcheAvant;
extern unsigned char mouvementEstPropulsion; 

// Kinect
extern point positionBalise1;
extern point positionBalise2;
extern unsigned char ordrePandaboard; 
extern unsigned char ordreSerial; 
extern unsigned char ordreKinect;

// Stratégie
extern generalStateMachine etatLogique; 
extern match matchStatus; 
extern team equipe;

extern const positionInteger trajectoireBateauRouge; 
extern const positionInteger trajectoireBateauMauve; 

extern action actionDemiTotemGL;
extern action actionDemiTotemRL;
extern action actionDemiTotemGH;
extern action actionDemiTotemRH;
extern action actionViderCoffre;  

extern action *actionsPossibles[NBRE_ACTIONS];   
extern action *ordreTotems[4];  
extern action *actionEnCours; 

extern unsigned char statutDemiTotem[4]; 
extern unsigned char cabineEstPleine; 
extern positionInteger trajectoireRangement;
extern positionInteger trajectoireBateauAdverse; 
extern unsigned char coffreEstPlein; 

#endif
