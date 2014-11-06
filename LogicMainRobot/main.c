/*!
 * @file main.c
 * @author Olivier Desenfans
 * @author bULBot 2011-2012
 * @brief Gestion de la carte-maitre du robot.
 * @details Impl�mentation de l'intelligence haut niveau du robot
 * et coordination des diff�rents modules.
 */

#include "../CanLib/CanProp.h"
#include "../CanLib/CanTraj.h"
#include "../CanLib/CanTypes.h"
#include "../CanLib/CanDspic.h"
#include "../CanLib/CanAction.h"
#include "configware.h"
#include "dataTypes.h"
#include "gestionActions.h"
#include "interruption.h"
#include "macros.h"
#include "spio.h"
#include "strategie.h"
#include "timer.h"
#include <math.h>

#define SHARPS_ENABLE 0

//////////////////////////////
//	Constantes				//
//////////////////////////////
const positionInteger positionInitialeRouge = {160, 1525, 0};		//! Position initiale pour l'�quipe rouge.
const positionInteger positionInitialeJaune = {2840, 1525, 1800};	//! Position initiale pour l'�quipe mauve.


//////////////////////////////
//	Variables globales 		//
//////////////////////////////
action demarrageJaune = {ACTION_AUCUNE, 1, 0, 0, 0, demarrageJauneFct};
action demarrageRouge = {ACTION_AUCUNE, 1, 0, 0, 0, demarrageRougeFct};
unsigned int nbActions;				//<! d�finit le nombre total d'actions � ex�cuter
action *ordreActions[9];			//<! Tableau d'actions � effectuer dans l'ordre



positionInteger calculObstacle();
action* choixAction(void);

/**
 * @fn int main(void)
 * @brief Fonction main du programme.
 */
int main(void) {
	// D�claration des variables locales.
	match matchStatus;								//<! Etat du match.
	generalStateMachine etatLogique = STRATEGIE;	//<! Machine d'�tat g�n�rale du robot.
	action *actionEnCours;							//<! Pointeur vers l'action en cours.
	positionInteger positionInitiale;
	int indiceEtape;
	unsigned int detObstAvantStatut[5];				//<! Statut de la d�tection d'obstacle � l'avant du robot.
	team equipe;						//<! Equipe actuelle.


	pllConfig();					// Configuration de la PLL de l'horloge interne pour tourner � 40MIPS
	assignSPIO();					// Assignation des pins du dSPIC.
	matchTimerInit();				// Initialisation du timer de match
	msTimerInit();
	// Initialisation du CAN
	CanInitialisation(CN_LOGIQUE);
	canPropulsionEnable();
	canTrajEnable();
	canActionEnable();
	ACTIVATE_CAN_INTERRUPTS = 1;
	matchStatus = PRE;

	while(TRUE) {
		if (getMatchTimerFlag()) {
			matchStatus = OVER;
		}
		// Machine d'�tat de la logique
		switch (matchStatus) {
			// Etat initial, phase pr�c�dant le match
			case PRE:
				// ACTIONS
				// Choix de l'�quipe : d�finit l'�quipe, la position initiale et la liste d'action
				if (BOUTON_EQUIPE == JAUNE) {
					equipe = JAUNE;
					positionInitiale = positionInitialeJaune;
					ordreActions[0] = &demarrageJaune;
					nbActions = 1;
				} else {
					equipe = ROUGE;
					positionInitiale = positionInitialeRouge;
					ordreActions[0] = &demarrageRouge;
					nbActions = 1;
					nbActions = 3;
				}
				// TRANSITIONS
				if (GOUPILLE) {					// si la goupille est retir�e, le match commence
					matchStatus = ONGOING;
					propulsionSetPosition(positionInitiale);
					etatLogique = STRATEGIE;
					StartMatchTimer();
					waitXms(100);
				}
				break;
			case ONGOING: // Le match est lanc�
				switch (etatLogique) {
					case STRATEGIE:			// Etat o� on d�cide de la prochaine action � effectuer
						actionEnCours = choixAction();	// S�lection de la prochaine action => c'est dans cette fonction qu'il faut mettre de l'IA
						indiceEtape = 0;				// Initialisation du compteur d'�tape
						etatLogique = EXEC_ETAPE;		// on passe � l'�tat suivant
						break;
					case INIT_ETAPE:
						if (indiceEtape < actionEnCours->nbrEtapes) {
							// on appelle la fonction qui ex�cute l'�tape suivante (ebvoi d'un message CAN
							// IMPORTANT : cette fonction ne peut pas �tre bloquante
							actionEnCours->etapeEnCours = actionEnCours->ptr2Fct(indiceEtape);
						} else {
							etatLogique = STRATEGIE;		// si on n'a plus d'�tapaes � ex�cuter, on retourne dans l'�tat STRATEGIE
						}
						break;
					case EXEC_ETAPE:
						switch (actionEnCours->etapeEnCours) {
							case ACTION_PROPULSION:
									if (propulsionGetStatus() == STANDING) {
										indiceEtape++;
										etatLogique = INIT_ETAPE;
									}
								break;
							case ACTION_TRAJECTOIRE:
								switch (TrajGetStatus()) {
									case TRAJECTOIRE_ARRIVED:
										indiceEtape++;
										etatLogique = INIT_ETAPE;
										break;
									case TRAJECTOIRE_MOVING:
										break;
									case TRAJECTOIRE_LOST:
									case TRAJECTOIRE_END_OUT:
									case TRAJECTOIRE_START_OBS:
									case TRAJECTOIRE_STOP_OBS:
									case TRAJECTOIRE_STOP_PAT:
										matchStatus = OVER;
										break;
									default:
										break;
								}
								if (detObstAvantStatut[0] && SHARPS_ENABLE) {
									propulsionStopNow();
									etatLogique = INIT_ETAPE;
								}
								break;
							case ACTION_ACTIONNEURS:
								if (ActionGetStatus() == WAIT) {
									indiceEtape++;
									etatLogique = INIT_ETAPE;
								}
								break;
							default:
								indiceEtape++;
								etatLogique = INIT_ETAPE;
								break;
						}
						break;
					case IDLE:
						break;
					default:
						break;
				}
				break;
			case OVER:
				propulsionOrdre(PROP_STOP_NOW, 0, 0, 0);
				break;
			default:
				break;
		}
	}
	return 0;
}


action* choixAction(void) {
	static unsigned int indiceAction = 0;					//<! d�finit l'action en cours
	if (indiceAction < nbActions) {
		indiceAction++;
	}
	return(ordreActions[indiceAction-1]);
}
