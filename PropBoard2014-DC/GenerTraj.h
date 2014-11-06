#include "globals.h"


// structure permettant de stocker les coordonnées des points de passage,
// dans le systèmes de coordonnées de la carte de la table
typedef struct {
	char a;
	char b;
	char dir;
} mapPosType;


#define OBSTACLE_AUCUN	0
typedef struct {
	char status;
	int x;
	int y;
} obsType;

//calculate trajectory, return the number of sub segment necessary to go to the selected point
//return the number of point in the vector used to go to the selected point
int findTrajectoire(realPosType rpStart, realPosType rpEnd, realPosType rpPath[], obsType obstacle);

realPosType MPtoRP(mapPosType mpPos);
mapPosType RPtoMP(realPosType rpPos);
int isObsInMap(int s16X, int s16Y);
