#ifndef _CANDSPIC_H
#define _CANDSPIC_H
/********************************************************
*						HEADERS							*
********************************************************/

#include "xc.h"
#include "../CanLib/CanNetwork.h"

///////////////////////////////////////////////////////////////////////////////
//						DEFINITIONS
///////////////////////////////////////////////////////////////////////////////

//#define DEBUG_CAN_DISABLE			//! Flag de compilation pour désactiver les fonctions CAN quand on veux tester en simulation


#define DMA_BASE_ADDRESS	0x4000

#define		ACTIVATE_CAN_INTERRUPTS			IEC2bits.C1IE			// Defines the bit that activates interrupts for Can
#define		CAN_INTERRUPT_FLAG				IFS2bits.C1IF
#define 	CAN_RX_BUFFER_IF				C1INTFbits.RBIF			// Defines the bit containing the reception flag of any CAN message
#define		CAN_RX_OBJECT_FLAG				C1RXFUL1bits.RXFUL8			// Defines the bit containing the reception flag of a refresh command on the CAN bus
#define 	CAN_RX_ORDER_FLAG				C1RXFUL1bits.RXFUL9			// Defines the bit containing the reception flag of a configuration command on the CAN bus

// CAN Baud Rate Configuration
#define FCAN  	40000000 
#define NTQ 	20		// 20 Time Quanta in a Bit Time

#define	MAX_OBJETS_PRODUITS				8
#define	MAX_OBJETS_CONSOMMES			15

/********************************************************
*						PROTOTYPES						*
********************************************************/

//! Message CAN
typedef struct
{
	unsigned char id;
	void *ptrData;
	unsigned char len;
} CAN_MSG;

typedef union _BUFFER_CAN
{
    unsigned int u16Words [8];
    struct{
        unsigned IDE:1;
        unsigned SRR:1;        
        unsigned SID:11;
        unsigned UNUSED0:2;
        unsigned EID17_6:12;
        unsigned UNUSED1:4;
        unsigned DLC:4;
        unsigned RB0:1;
        unsigned UNUSED2:3;
        unsigned RB1:1;
        unsigned RTR:1;
        unsigned EID5_0:6;
        unsigned char DATA[8];
        unsigned char UNUSED4;
        unsigned FILHIT:5;  
        unsigned UNUSED3:3;        
    };
} BUFFER_CAN;

//! Vecteur contenant les objets qu'on produit
extern CAN_MSG production[MAX_OBJETS_PRODUITS];

//! Vecteur contenant les objets qu'on consomme
extern CAN_MSG consommation[MAX_OBJETS_CONSOMMES];

extern BUFFER_CAN transmitBuffers[8] __attribute__((space(dma),address(DMA_BASE_ADDRESS+0x0000)));
extern BUFFER_CAN receiveBufferOrders __attribute__((space(dma),address(DMA_BASE_ADDRESS+0x0090)));
extern BUFFER_CAN receiveBufferObjects __attribute__((space(dma),address(DMA_BASE_ADDRESS+0x0080)));

extern unsigned char canReceivedCommand;   // Stocke l'ordre CAN reçu
extern unsigned char canReceivedData[7];   // Stocke les data liées à l'ordre CAN reçu
extern unsigned char canReceivedOrderFlag; // indique à la boucle infinie qu'on a reçu un ordre CAN à traiter

/********************************************************
*						PROTOTYPES						*
********************************************************/

void EnvoiCanMsg(CAN_MSG *source);

//! Initialisation du CAN
void CanInitialisation(unsigned char CanID);

//! Déclaration d'une variable comme objet que l'on produit
void CanDeclarationProduction(unsigned char id, void *ptrData, unsigned char len);

//! Déclaration d'une variable comme objet que l'on consomme
void CanDeclarationConsommation(unsigned char id, void *ptrData, unsigned char len);

//! Envoi de tous les objets que l'on produit sur CAN
void CanEnvoiProductions(void);

//! Envoi d'un objet CAN sur le bus
void CanEnvoiProduction(void *ptr);

#endif




