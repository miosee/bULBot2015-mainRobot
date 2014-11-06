/* 
 * File:   CanTypes.h
 * Author: Yernaux
 *
 * Created on 23 mars 2014, 11:50
 */

#ifndef CANTYPES_H
#define	CANTYPES_H

/**
 * @brief Définition de la structure de données pour le codage d'une position absolue sur le bus CAN
 */
typedef struct {
	int x;		/** Position en X, en mm */
	int y;		/** Position en Y, en mm */
	int alpha;	/** Orientation par rapport à l'axe X dans le sens trigonométrique, en deg/10 */
} positionInteger;

/**
 * @brief Définition de la structure de données pour le codage d'une position[vitesse] relative sur le bus CAN
 */
typedef struct  {
    int l;		/** Position[vitesse] logitudinale, en mm[mm/s] */
    int r;		/** Position[vitesse] angulaire, en deg/10[(deg/10)/s] */
} relativeCoordInteger;


#define	NO_LENGTH	 0
#define	START_OUT	-1
#define	END_OUT		-2
#define	START_OBST	-3
#define	END_OBST	-4
#define	NO_WAY		-5

/**
 * @brief Définition des états possibles du statut la propulsion
 */
 typedef enum {
	DISABLED = 0,
	STANDING = 1,
	MOVING = 2,
	TEST = 3,
	TRAJ_START_OUT = START_OUT,
	TRAJ_END_OUT = END_OUT,
	TRAJ_START_OBS = START_OBST,
	TRAJ_END_OBS = END_OBST,
	TRAJ_NO_WAY = NO_WAY
} propStateType;


#endif	/* CANTYPES_H */

