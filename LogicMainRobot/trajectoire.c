/**
 * @file trajectoire.c
 * @brief Implémentation des fonctions de gestion de la trajectoire.
 * @author bULBot 2010-2011
 */
 
#include "trajectoire.h"

//! Structure pour la commande d'ajout d'obstacle. 
struct
{
	char cmd;
	int obsx;
	int obsy;
	unsigned char Type;
	unsigned char controle;
} obsCmd;

void initialisationCanTrajectoire(void)
{
	CanDeclarationConsommation(CO_TRAJECTOIRE_STATUS, &tmpTrajStatus, sizeof(tmpTrajStatus));
	CanDeclarationConsommation(CO_TRAJECTOIRE_IS_OBS, &caseEstObstacle, sizeof(caseEstObstacle)); 
	CanDeclarationConsommation(CO_TRAJECTOIRE_LENGTH, &coutTrajectoire, sizeof(coutTrajectoire)); 
	
	CanDeclarationProduction(CN_TRAJECTOIRE, &ordreTrajectoire, sizeof(ordreTrajectoire));
	CanDeclarationProduction(CN_TRAJECTOIRE, &obsCmd, sizeof(obsCmd));
}	

void moveTo(const positionInteger c)
{
	// Définit que le mouvement est réalisé par la trajectoire
	mouvementEstPropulsion = FALSE; 
	
	// Le robot ne peut qu'aller en avant via la trajectoire
	robotMarcheAvant = TRUE; 
	
	// Remplissage de l'ordre
	ordreTrajectoire[0] = TRAJ_GOTO_XYALPHA; 
	
	// Remplissage des données
	ordreTrajectoire[1] = (unsigned char)( c.x & 0x00FF );
	ordreTrajectoire[2] = (unsigned char)((c.x >> 8) & 0x00FF );
	ordreTrajectoire[3] = (unsigned char)( c.y & 0x00FF );
	ordreTrajectoire[4] = (unsigned char)((c.y >> 8) & 0x00FF );
	ordreTrajectoire[5] = (unsigned char)( c.alpha & 0x00FF );
	ordreTrajectoire[6] = (unsigned char)((c.alpha >> 8) & 0x00FF );
	
	CanEnvoiProduction(ordreTrajectoire); 
	waitxMS(100);
}

void moveToXYA(int x,int y, int alpha)
{
	
	// Définit que le mouvement est réalisé par la trajectoire
	mouvementEstPropulsion = FALSE; 
	// Le robot ne peut qu'aller en avant via la trajectoire
	robotMarcheAvant = TRUE; 
	
	// Remplissage de l'ordre
	ordreTrajectoire[0] = TRAJ_GOTO_XYALPHA; 
	
	// Remplissage des données
	ordreTrajectoire[1] = (unsigned char)( x & 0x00FF );
	ordreTrajectoire[2] = (unsigned char)((x >> 8) & 0x00FF );
	ordreTrajectoire[3] = (unsigned char)( y & 0x00FF );
	ordreTrajectoire[4] = (unsigned char)((y >> 8) & 0x00FF );
	ordreTrajectoire[5] = (unsigned char)( alpha & 0x00FF );
	ordreTrajectoire[6] = (unsigned char)((alpha >> 8) & 0x00FF );
	
	CanEnvoiProduction(ordreTrajectoire); 
	waitxMS(100);
}

void AddObstacle(int x,int y,unsigned char type)
{
	obsCmd.cmd = TRAJ_ADD_OBSTACLE;
	obsCmd.obsx = x;
	obsCmd.obsy = y;
	obsCmd.Type = type;
	obsCmd.controle =0;
	CanEnvoiProduction(&obsCmd);
//	Delay10KTCYx(50); //sure message go
	waitxMS(100);
}

void moveToXY(int x,int y)
{
	// Définit que le mouvement est réalisé par la trajectoire
	mouvementEstPropulsion = FALSE; 
	
	// Le robot ne peut qu'aller en avant via la trajectoire
	robotMarcheAvant = TRUE; 
	
	// Remplissage de l'ordre
	ordreTrajectoire[0] = TRAJ_GOTO_XY; 
	
	// Remplissage des données
	ordreTrajectoire[1] = (unsigned char)( x & 0x00FF );
	ordreTrajectoire[2] = (unsigned char)((x >> 8) & 0x00FF );
	ordreTrajectoire[3] = (unsigned char)( y & 0x00FF );
	ordreTrajectoire[4] = (unsigned char)((y >> 8) & 0x00FF );
	
	CanEnvoiProduction(ordreTrajectoire);
	waitxMS(100);
}

bool estUnObstacle(unsigned char obstStatut[5]) {

	int incr;
	bool resultat; 
	
	// Remplissage de l'ordre
	ordreTrajectoire[0] = TRAJ_IS_OBSTACLE; 
	
	// Remplissage des données (en section  critique)
	
	ACTIVATE_CAN_INTERRUPTS = 0; 
	
	for(incr = 1; incr < 5; incr++) {
	
		ordreTrajectoire[incr] = obstStatut[incr]; 
	} 
	
	ACTIVATE_CAN_INTERRUPTS = 1; 
	
	caseEstObstacle = -1;
	CanEnvoiProduction(ordreTrajectoire); 
	//waitxMS(100); 
	
	while(caseEstObstacle < 0); 
	
	resultat = (caseEstObstacle) ? TRUE : FALSE; 
	return resultat; 
}

void updateTrajStatus()
{
	ordreTrajectoire[0] = TRAJ_SEND_STATUS;
	CanEnvoiProduction(ordreTrajectoire);
	waitxMS(100);
}


int distanceViaTrajectoire(const positionInteger destination) {

	// Remplissage de l'ordre
	ordreTrajectoire[0] = TRAJ_COMPUTE_LENGTH; 
	
	// Remplissage des données
	ordreTrajectoire[1] = (unsigned char)( destination.x & 0x00FF );
	ordreTrajectoire[2] = (unsigned char)((destination.x >> 8) & 0x00FF );
	ordreTrajectoire[3] = (unsigned char)( destination.y & 0x00FF );
	ordreTrajectoire[4] = (unsigned char)((destination.y >> 8) & 0x00FF );
	ordreTrajectoire[5] = (unsigned char)( destination.angle & 0x00FF );
	ordreTrajectoire[6] = (unsigned char)((destination.angle >> 8) & 0x00FF );
	
	// Envoi de l'ordre et attente de la mise à jour de la variable de cout via CAN
	CanEnvoiProduction(ordreTrajectoire); 
	waitxMS(100);
	
	// Renvoi de la variable globale mise à jour avec le coût
	return coutTrajectoire; 
}
