//////////////////////////////////////////////////////////////////////////////
//								HEADERS										//
//////////////////////////////////////////////////////////////////////////////
#include <math.h>
#include "GenerTraj.h"
#include "globals.h"
//#include "../Canlib/CanNetwork.h"



//////////////////////////////////////////////////////////////////////////////
//								DEFINE										//
//////////////////////////////////////////////////////////////////////////////
// Paramètres de conversion entre les axes (x,y) et les axes (a,b)
// Ici, on suppose que les axes (a,b) sont orthogonaux et parallèles aux
// axes (x,y).
// Il est possible d'utiliser des axes (a,b) non-orthogonaux (voir en 2010)
#define ORIG_X	0		// coordonnée x du point d'origine du repère (a,b)
#define ORIG_Y	0		// coordonnée y du point d'origine du repère (a,b)
#define DAX		0.1		// rapport entre  x et  a : l[x] = DAX*l[a]
#define DBY		0.1		// rapport entre  y et  b : l[y] = DBY*l[b]

#define MAP_SIZE_A		30
#define MAP_SIZE_B		20
#define MAP_SIZE		(MAP_SIZE_A*MAP_SIZE_B)
#define MAX_PATHPOINTS	200
#define TABLE_SIZE_X	3.0
#define TABLE_SIZE_Y	2.0

#define TOL_INTERSECT	2 // tolérance sur le calcul d'intersection pour simplifyPath2 (en mm)

#define DIR_UNDEF 127
#define DIR_E	0
#define DIR_NE	1
#define DIR_N	2
#define DIR_NO	3
#define DIR_O	4
#define DIR_SE	-1
#define DIR_S	-2
#define DIR_SO	-3


//////////////////////////////////////////////////////////////////////////////
//									TYPES									//
//////////////////////////////////////////////////////////////////////////////
typedef struct {
  int	d;		// Distance du noeud au noeud d'origine (35000 si pas encore traité)
  char	dir;		// Direction de la trajectoire en ce noeud
  char  done;		// 0 si noeud pas traité, 1 sinon
  int	prec;	// noeud précédent dans la trajectoire
} dijkstra_st;


dijkstra_st  dkNodes[MAP_SIZE];		// Vecteur de recherche

#define OBST	2
#define DONE	1
#define UNPR	0
//////////////////////////////////////////////////////////////////////////////
//								CONSTANTS									//
//////////////////////////////////////////////////////////////////////////////
const signed char initialMap[MAP_SIZE] =
{	UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR,
 	UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR,
 	UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, // supérieur droit
 	UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR,
 	UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR,
 	UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR,
 	UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR,
 	UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR,
 	UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR,
 	UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR,
 	UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR,
 	UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR,
 	UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR,
 	UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR,
    UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR,
 	UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR,
 	UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR,
    UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR,
 	UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR,
 	UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR,
 	UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR,
 	UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR,
 	UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR,
 	UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR,
 	UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR,
 	UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR,
 	UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR,
 	UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR,
 	UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR,
 	UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR, UNPR
};

//////////////////////////////////////////////////////////////////////////////
//								FUNCTIONS									//
//////////////////////////////////////////////////////////////////////////////
// convertit des coordonnées robotPosition en coordonées mapPosition
inline mapPosType RPtoMP(realPosType rpPos) {
	mapPosType mpPos;

	mpPos.a = (rpPos.x - ORIG_X) / DAX;
	mpPos.b = (rpPos.y - ORIG_Y) / DBY;
	if (rpPos.alpha >= 0) {
		mpPos.dir = (rpPos.alpha + PI/8) / (PI/4);
	} else {
		mpPos.dir = (rpPos.alpha - PI/8) / (PI/4);
	}
	return (mpPos);
}

// convertit des coordonnées mapPosition en coordonées robotPosition
inline realPosType MPtoRP(mapPosType mpPos) {
	realPosType rpPos;

	rpPos.x = ORIG_X + DAX * mpPos.a;
	rpPos.y = ORIG_Y + DBY * mpPos.b;
	rpPos.alpha = mpPos.dir * PI/4;
	return (rpPos);
}


inline float computeSegAngle(realPosType rpP0, realPosType rpP1) {
	return (satureAngle(atan2(rpP1.y-rpP0.y,rpP1.x-rpP0.x)));
}


// initialise le vecteur des noeuds pour l'algorithme de Dijkstra
inline void initDijkstraVect(void) {
	unsigned int i;
	for (i=0; i<MAP_SIZE; i++) {
		dkNodes[i].d = 30000;
		dkNodes[i].dir = 0;
		dkNodes[i].done = initialMap[i];		// les obstacles ne seront pas considérés comme voisins
		dkNodes[i].prec = -1;
	}
}


inline void deleteNode(int curNode) {
	dkNodes[curNode].done = DONE;
}


inline void addObstacle(obsType obstacle, mapPosType mpStart) {
	int a, b, a1, a2, b1, b2;
	mapPosType mpObs;
	realPosType rpObs;

	rpObs.x = obstacle.x;			// on calcule les coordonnées de l'obstacle dans la carte
	rpObs.y = obstacle.y;			// obstacle contient les coordonnées du point vu par le sharp
	mpObs = RPtoMP(rpObs);			// On suppose qu'il s'agit de la surface du robot adverse, qui est un cylindre de 30cm de diamètre
	// on ajoute l'obstacle dans la carte sous la forme d'un carré de
	// 5 cases de côté, placé autour des coordonnées reçues en fonction de l'orientation du robot
	switch(mpStart.dir) {
		case DIR_E:		a1=-1; a2=3; b1=-2; b2=2;	break;
		case DIR_NE:	a1=-1; a2=3; b1=-1; b2=3;	break;
		case DIR_N:		a1=-2; a2=2; b1=-1; b2=3;	break;
		case DIR_NO:	a1=-3; a2=1; b1=-1; b2=3;	break;
		case DIR_O:		a1=-3; a2=1; b1=-2; b2=2;	break;
		case DIR_SO:	a1=-3; a2=1; b1=-3; b2=1;	break;
		case DIR_S:		a1=-2; a2=2; b1=-3; b2=1;	break;
		case DIR_SE:	a1=-1; a2=3; b1=-3; b2=1;	break;
	}
	for (a=a1; a<=a2; a++) {
		for (b=b1; b<=b2; b++) {
			dkNodes[MAP_SIZE_B*mpObs.a + mpObs.b].done = 1;
		}
	}
}


inline int findNeigbours(int curNode, int *neigbours) {
	int a, b, i, minA, maxA, minB, maxB, dA, dB, nb;

	// on commence par vérifier si le noeud courant est au bord de la table
	// si oui, il a moins de voisins
	a = curNode/MAP_SIZE_B;
	b = curNode - MAP_SIZE_B*a;
	nb = 0;
	if(a==0)				minA=0;		else	minA=-1;
	if(a==MAP_SIZE_A-1)		maxA=0;		else	maxA=1;
	if(b==0)				minB=0;		else	minB=-1;
	if(b==MAP_SIZE_B-1)		maxB=0;		else	maxB=1;
	for (dA=minA; dA<=maxA; dA++) {
		for (dB=minB; dB<=maxB; dB++) {
			i = curNode + MAP_SIZE_B*dA + dB;	// on calcule l'index du voisin potentiel
			if (dkNodes[i].done == UNPR) {		// si il n'a pas encore été traité et que ce n'est pas un obstacle,
				neigbours[nb] = i;				// c'est un voisin
				nb++;
			}
		}
	}
	return(nb);
}


inline int findNextNode(void) {
	int i, j;

	i = 0;
	while ((dkNodes[i].done != UNPR) && (i < MAP_SIZE)) {
		i++;	// on commence par trouver le 1er noeud non traité, qui devient notre 1er candidat
	}
	if (i >= MAP_SIZE) {
		return(-1);		// Si on a atteint la fin du vecteur, c'est qu'il y a un problème
	}
	for (j=i; j<MAP_SIZE; j++) {	// Sinon, on vérifie si on n'a pas un meilleur candidat
		if ((dkNodes[j].done == UNPR) && (dkNodes[j].d<dkNodes[i].d)) {		// Si un noeud non encore traité est plus proche de noeud initial
			i = j;															//  que le candidat actuel, il devient le nouveau candidat
		}
	}
	return(i);
}


inline int atanMP(int b, int a) {
	switch(a) {
		case -1 :
			switch(b) {
				case -1:	return(DIR_SO);		break;
				case 0 :	return(DIR_O);		break;
				case 1 :	return(DIR_NO);		break;
			}
		break;
		case 0 :
			switch(b) {
				case -1:	return(DIR_S);		break;
				case 0 :	return(DIR_UNDEF);	break;
				case 1 :	return(DIR_N);		break;
			}
		break;
		case 1 :
			switch(b) {
				case -1:	return(DIR_SE);		break;
				case 0 :	return(DIR_E);		break;
				case 1 :	return(DIR_NE);		break;
			}
		break;
	}
	return(DIR_UNDEF);
}


inline void updateDistance(int neigbour, int curNode, int endNode) {
	int a1, b1, a2, b2, dir, dist;

	a1 = curNode / MAP_SIZE_B;			// on calcule les coordonnées des 2 noeuds
	b1 = curNode - MAP_SIZE_B*a1;
	a2 = neigbour / MAP_SIZE_B;
	b2 = neigbour - MAP_SIZE_B*a2;
	dir = atanMP( b2-b1, a2-a1 );	// on calcule l'orientation du segment
// on calcule la distance du noeud voisin au noeud initial, en passant par le noeud courant
	dist = 2*(ABS(a1-a2)+ABS(b1-b2));	// on calcule d'abord la distance entre le noeud courant et son voisin		3|2|3
	if (dist > 3) {		// on utilise une pseudo-distance euclidienne, pour favoriser les diagonales, par rapport	2|0|2
		dist = 3;		// à un chemin de type Manhattan; mais sans devoir calculer une racine carrée				3|2|3
	}
	dist += dkNodes[curNode].d;			// on ajoute la distance du noeud courant au noeud initial
	if (dir != dkNodes[curNode].dir) {	// on ajoute encore une pseudo distance pour les virages, et privilégier les lignes droites
		dist++;							// on ajoute une distance constante, quelque soit l'amplitude du virage
	}
	if ((neigbour == endNode) && (dir != dkNodes[endNode].dir))	// si le voisin est le noeud final, on ajoute l'éventuel dernier virage
		dist++;	// on ajoute une distance constante, quelque soit l'amplitude du virage
// on vérifie maintenant si cette distance est plus petite que la distance actuelle du voisin
// si elles sont égales, on privilégie la trajectoire qui est bien orientée
	if ((dist < dkNodes[neigbour].d) || ((dist == dkNodes[neigbour].d) && (dir == dkNodes[endNode].dir))) {
		dkNodes[neigbour].d = dist;				// on met à jour la distance
		dkNodes[neigbour].prec = curNode;		// on change le chemin pour arriver au voisin
		dkNodes[neigbour].dir = dir;			// on met à jour l'orientation
	}
}


/////////////////// S16FindPath ///////////////////
//find path from startpoint to endpoint using costMap
//return results in pathpoints
//result char trajStatus=1 si ok
//result char trajStatus=NO_LENGTH si origine=arrivee
//result char trajStatus=START_OUT si impossible: startpoint is outside map
//result char trajStatus=END_OUT si impossible: endpoint is outside map
//result char trajStatus=START_OBST si impossible: startpoint is obstacle
//result char trajStatus=END_OBST si impossible: endpoint is obstacle
//result char trajStatus=NO_WAY si impossible: cost generation failed (inconsistent map, no possible way)
inline int findPath(mapPosType mpStart, mapPosType mpEnd, mapPosType mpPath[], obsType obstacle) {
	int  curNode;			// Index du noeud courant
	int  startNode;			// Index du noeud initial
	int  endNode;			// Index du noeud qu'on veut atteindre
	int  neigbours[8];		// liste des voisins du noeud courant
	int  a, b, i, nb;		// variables de travail
	mapPosType mpTmp;		// variable de travail
	
	
	initDijkstraVect();		// on initialise le vecteur de recherche, vierge d'obstacles mobiles
	if (obstacle.status != OBSTACLE_AUCUN) {		// si on a détecté l'adversaire, on l'ajoute à la carte
		addObstacle(obstacle, mpStart);}
// On vérifie les cas spéciaux détectables dans les axes (a,b)
	// On vérifie que les points de départ et d'arrivée ne sont pas dans un obstacle
	if (dkNodes[MAP_SIZE_B*mpStart.a + mpStart.b].done == 1) {
		return START_OBST;
	} else if (dkNodes[MAP_SIZE_B*mpEnd.a + mpEnd.b].done == 1) {
		return END_OBST;
	}
	// On vérifie que les points de départ et d'arrivée ne sont pas dans la même case de la carte.
	if ((mpStart.a == mpEnd.a) && (mpStart.b == mpEnd.b)) {
		// Si c'est le cas, la trajectoire est triviale 
		mpPath[0].a = mpStart.a;
		mpPath[0].b = mpStart.b;
		mpPath[1].b = mpEnd.a;
		mpPath[1].b = mpEnd.b;
		return(2);
	}
// Sinon, on sort l'artillerie lourde
	startNode = MAP_SIZE_B*mpStart.a + mpStart.b;		// on initialise le noeud final au noeud de départ
	// le noeud initial est le noeud d'arrivée ( voir théorie )
	endNode = MAP_SIZE_B*mpEnd.a + mpEnd.b;
	dkNodes[startNode].d = 0;	// distance nulle avec lui-même
	curNode = startNode;
// On calcule les distances au noeud initial, jusqu'à arriver au noeud final
	while (curNode != endNode) {
		deleteNode(curNode);									// on élimine le noeud courant des noeuds à traiter
		nb = findNeigbours(curNode, neigbours);					// on fait la liste de ses voisins
		for (i=0; i<nb; i++) {									// on met à jour la distance de ses voisins avec le noeud initial
			updateDistance(neigbours[i], curNode, endNode);
		}
		curNode = findNextNode();	// on choisit un nouveau noeud courant
		if (curNode == -1)	{
			return(NO_WAY);		// Si on n'a pas trouvé de nouveau noeud, il n'y a pas de chemin possible
		}
	}
// une fois arrivé au point désiré, on retourne sur nos pas pour trouver le chemin
	a = curNode / MAP_SIZE_B;			// la trajectoire commence par son point de départ
	b = curNode - MAP_SIZE_B*a;
	mpPath[0].a = a;
	mpPath[0].b = b;
	mpPath[0].dir = dkNodes[curNode].dir;
	nb = 1;
	while(curNode != startNode)	{			// tant qu'on n'est pas arrivé
		curNode = dkNodes[curNode].prec;	// on remonte la trajectoire d'un noeud
		if (curNode == -1) {				// test qui ne doit jamais être vrai, mais on ne sait jamais
			return( NO_WAY );
		}
		a = curNode / MAP_SIZE_B;
		b = curNode - MAP_SIZE_B*a;
		mpPath[nb].a = a;
		mpPath[nb].b = b;
		mpPath[nb].dir = dkNodes[curNode].dir;
		nb++;
	}
// on doit maintenant retourner le vecteur, puisqu'on a calculé le chemin, du point d'arrivée vers le point de départ
	for (i=0; i<nb/2; i++) {
		mpTmp.a = mpPath[i].a;					// on copie le i-eme élément dans une variable temporaire
		mpTmp.b = mpPath[i].b;
		mpTmp.dir = mpPath[i].dir;
		mpPath[i].a = mpPath[nb-i-1].a;			// on copie le (Nb-i)-eme élément dans le i-eme élément
		mpPath[i].b = mpPath[nb-i-1].b;
		mpPath[i].dir = mpPath[nb-i-1].dir;
		mpPath[nb-i-1].a = mpTmp.a;				// on copie la variable temporaire dans le (Nb-i)-eme élément
		mpPath[nb-i-1].b = mpTmp.b;
		mpPath[nb-i-1].dir = mpTmp.dir;
	}
	return(nb);
}


inline int convertPath(realPosType rpStart, realPosType rpEnd, int pathSize, mapPosType mpPath[], realPosType rpPath[]) {
	unsigned int i;
	signed int length;
	signed int curDir, newDir;

// 1) la trajectoire commence par le point de départ réel
	rpPath[0].x = rpStart.x;
	rpPath[0].y = rpStart.y;
	length = 1;
	// on calculera son angle plus tard. Il faut en effet connaitre le 2ème point de la trajectoire pour cela.
// 2) on cherche maintenant le 1er point dans la trajectoire où la direction change
	// on détermine la direction initiale (la direction pour aller vers le 2ème point de la trajectoire, pas l'orientation initiale du robot)
	curDir = atanMP(mpPath[1].b-mpPath[0].b, mpPath[1].a-mpPath[0].a);
	for (i=1; i<pathSize-1; i++) { // on parcourt tout le chemin fourni par le Dijkstra, en ne retenant que les points où la direction change.
		newDir = atanMP(mpPath[i].b-mpPath[i-1].b, mpPath[i].a-mpPath[i-1].a);
		if (mpPath[i].dir != curDir) {				// quand on arrive en un point où on tourne,
			rpPath[length] = MPtoRP(mpPath[i-1]);	// on l'ajoute à la trajectoire et on prend note de la nouvelle direction
			length++;
			curDir = newDir;
		}	
	}
// 3) on peut maintenant calculer l'angle du 1er segment
	rpPath[0].alpha = computeSegAngle(rpPath[0], rpPath[1]);
// 4) on ajoute le point d'arrivée
	rpPath[length].x = rpEnd.x;
	rpPath[length].y = rpEnd.y;
	rpPath[length].alpha = rpEnd.alpha;
	length++;
// 5) on calcule l'angle de l'avant-dernier point de passage pour arriver au vrai point d'arrivée
	rpPath[length-2].alpha = computeSegAngle(rpPath[length-2], rpPath[length-1]);
// 6) on retourne le nombre de points de la trajectoire
	return(length);
}


int isObsInMap(int s16X, int s16Y) {
	mapPosType mpObs;
	realPosType rpObs;

	// on calcule les coordonnées de l'obstacle dans la carte
	// obstacle contient les coordonnées du point vu par le sharp
	// On suppose qu'il s'agit de la surface du robot adverse, qui est un cylindre de 30cm de diamètre
	rpObs.x = s16X;
	rpObs.y = s16Y;
	mpObs = RPtoMP(rpObs);
	return(initialMap[MAP_SIZE_B*mpObs.a + mpObs.b] == OBST);
}


// calcule la trajectoire ooptimale pour aller du point rpStart au point rpEnd,
// en tenant compte des obstacles sur la table. La carte de la table doit être
// initialisée et les obstacles éventuels ajoutés avant d'appeler cette fonction.
int findTrajectoire(realPosType rpStart, realPosType rpEnd, realPosType rpPath[], obsType obstacle){
	mapPosType mpStart, mpEnd;			// Coordonnées des points de départ et d'arrivée dans la carte
	mapPosType mpPath[MAX_PATHPOINTS];	// Coordonnées des points de passage de la trajectoire dans la carte
	int trajLength;						// nombre de points de passage de la trajectoire, ou code d'erreur


	// On commence par vérifier les cas spéciaux détectables dans les coordonnées (x,y)
	// On vérifie que les points de départ et d'arrivée ne sont pas en dehors de la table
	if ((rpStart.x < 0) || (rpStart.x > TABLE_SIZE_X) || (rpStart.y < 0) || (rpStart.y > TABLE_SIZE_Y)) {
		return START_OUT;
	} else if ((rpEnd.x < 0) || (rpEnd.x > TABLE_SIZE_X) || (rpEnd.y < 0) || (rpEnd.y > TABLE_SIZE_Y)) {
		return END_OUT;
	}
	// On vérifie que les points de départ et d'arrivée ne sont pas confondus
	if ((rpStart.x == rpEnd.x) && (rpStart.y == rpEnd.y)) {
		return(NO_LENGTH);
	}
	mpStart = RPtoMP(rpStart);		// Si on est dans le cas nominal, on calcule la trajectoire optimale dans les coordonnées (a,b)
	mpEnd = RPtoMP(rpEnd);			// On convertit les points de départs et d'arrivée dans les coordonnées (a,b)
	trajLength = findPath(mpStart, mpEnd, mpPath, obstacle);		// On utilise l'algorithme de pathfinding
	// Si une trajectoire a été trouvée (au moins 2 points), on convertit la trajectoire dans les coordonnées (x,y)
	if (trajLength > 1) {
		trajLength = convertPath(rpStart, rpEnd, trajLength, mpPath, rpPath);
	}
	// Retourne le nombre de points de passage de la trajectoire,
	// ou le code d'erreur renvoyé par S16FindPath ou S16ConvertPath
	return trajLength;
}
