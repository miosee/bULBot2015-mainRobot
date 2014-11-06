/*!
 * @file main.c
 * @author Olivier Desenfans
 * @author bULBot 2011-2012
 * @brief Gestion de la carte-maitre du robot.
 * @details Implémentation de l'intelligence haut niveau du robot
 * et coordination des différents modules.
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
const positionInteger positionInitialeRouge = {160, 1525, 0};		//! Position initiale pour l'équipe rouge.
const positionInteger positionInitialeJaune = {2840, 1525, 1800};	//! Position initiale pour l'équipe mauve.


//////////////////////////////
//	Variables globales 		//
//////////////////////////////
action demarrageJaune = {ACTION_AUCUNE, 1, 0, 0, 0, demarrageJauneFct};
action demarrageRouge = {ACTION_AUCUNE, 1, 0, 0, 0, demarrageRougeFct};
unsigned int nbActions;				//<! définit le nombre total d'actions à exécuter
action *ordreActions[9];			//<! Tableau d'actions à effectuer dans l'ordre



positionInteger calculObstacle();
action* choixAction(void);

/**
 * @fn int main(void)
 * @brief Fonction main du programme.
 */
int main(void) {
	// Déclaration des variables locales.
	match matchStatus;								//<! Etat du match.
	generalStateMachine etatLogique = STRATEGIE;	//<! Machine d'état générale du robot.
	action *actionEnCours;							//<! Pointeur vers l'action en cours.
	positionInteger positionInitiale;
	int indiceEtape;
	unsigned int detObstAvantStatut[5];				//<! Statut de la détection d'obstacle à l'avant du robot.
	team equipe;						//<! Equipe actuelle.


	pllConfig();					// Configuration de la PLL de l'horloge interne pour tourner à 40MIPS
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
		// Machine d'état de la logique
		switch (matchStatus) {
			// Etat initial, phase précédant le match
			case PRE:
				// ACTIONS
				// Choix de l'équipe : définit l'équipe, la position initiale et la liste d'action
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
				if (GOUPILLE) {					// si la goupille est retirée, le match commence
					matchStatus = ONGOING;
					propulsionSetPosition(positionInitiale);
					etatLogique = STRATEGIE;
					StartMatchTimer();
					waitXms(100);
				}
				break;
			case ONGOING: // Le match est lancé
				switch (etatLogique) {
					case STRATEGIE:			// Etat où on décide de la prochaine action à effectuer
						actionEnCours = choixAction();	// Sélection de la prochaine action => c'est dans cette fonction qu'il faut mettre de l'IA
						indiceEtape = 0;				// Initialisation du compteur d'étape
						etatLogique = EXEC_ETAPE;		// on passe à l'état suivant
						break;
					case INIT_ETAPE:
						if (indiceEtape < actionEnCours->nbrEtapes) {
							// on appelle la fonction qui exécute l'étape suivante (ebvoi d'un message CAN
							// IMPORTANT : cette fonction ne peut pas être bloquante
							actionEnCours->etapeEnCours = actionEnCours->ptr2Fct(indiceEtape);
						} else {
							etatLogique = STRATEGIE;		// si on n'a plus d'étapaes à exécuter, on retourne dans l'état STRATEGIE
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
	static unsigned int indiceAction = 0;					//<! définit l'action en cours
	if (indiceAction < nbActions) {
		indiceAction++;
	}
	return(ordreActions[indiceAction-1]);
}
