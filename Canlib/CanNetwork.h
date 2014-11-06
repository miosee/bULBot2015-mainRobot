
/********************************************************
*						CAN NAMES						*
********************************************************/
/*!
	Liste des noms des noeuds CAN du réseau .
	Chaque carte possède son nom propre qu'elle doit définir dans son main.c
 	Exemple : 	le pic de régulation possède le nom CAN_REGULATION. Il le définit dans son main par
				# define 	CAN_NAME	CAN_REGULATION
				Les noms CAN sont définis ci-dessous et associés aux ID CAN.
	NB : CN est mis pour Can Name
*/


#define CN_LOGIQUE			0x01
#define CN_PROPULSION		0x02
#define CN_ACTIONNEUR		0x03
#define CN_TRAJECTOIRE		0x08
