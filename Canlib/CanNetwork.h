
/********************************************************
*						CAN NAMES						*
********************************************************/
/*!
	Liste des noms des noeuds CAN du r�seau .
	Chaque carte poss�de son nom propre qu'elle doit d�finir dans son main.c
 	Exemple : 	le pic de r�gulation poss�de le nom CAN_REGULATION. Il le d�finit dans son main par
				# define 	CAN_NAME	CAN_REGULATION
				Les noms CAN sont d�finis ci-dessous et associ�s aux ID CAN.
	NB : CN est mis pour Can Name
*/


#define CN_LOGIQUE			0x01
#define CN_PROPULSION		0x02
#define CN_ACTIONNEUR		0x03
#define CN_TRAJECTOIRE		0x08
