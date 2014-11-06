#include "CanDspic.h"

/********************************************************
*						DEFINITIONS						*
********************************************************/

//! Macro permettant d'assigner la valeur d'un filtre CAN et de l'activer
#define _SetRXFnValue(f, val)   		\
	C1RXF##f##SID = val << 5L;			\
	C1FEN1bits.FLTEN##f = 1		

//! Macro permettant d'assigner la valeur d'un masque CAN
#define _SetRXMnValue(m, val)           \
	C1RXM##m##SID = val <<5L

//! Macro permettant de calculer le mode opératoire courant du module CAN
# define CanGetOperationMode() 			C1CTRL1bits.OPMODE	//!< Gets current operation mode of the ECAN module 

/********************************************************
*						DECLARATIONS					*
********************************************************/

//! Vecteur contenant les objets qu'on produit
//#pragma udata can_section=0x800
CAN_MSG production[MAX_OBJETS_PRODUITS];

//! Vecteur contenant les objets qu'on consomme
CAN_MSG consommation[MAX_OBJETS_CONSOMMES];

BUFFER_CAN transmitBuffers[8] __attribute__((space(dma),address(DMA_BASE_ADDRESS+0x0000)));
BUFFER_CAN receiveBufferOrders __attribute__((space(dma),address(DMA_BASE_ADDRESS+0x0090)));
BUFFER_CAN receiveBufferObjects __attribute__((space(dma),address(DMA_BASE_ADDRESS+0x0080)));

//! Nombre d'objets produits
unsigned char nombreObjetsProduits;

//! Nombre d'objets consommes
unsigned char nombreObjetsConsommes;

//! ECAN Module baudrates
typedef enum _CAN_BAUDRATE
{
	CAN_BAUDRATE_1M		= 1000000,		/*!< 1Mbps	*/
    CAN_BAUDRATE_500k	= 500000,		/*!< 500kpbs */
	CAN_BAUDRATE_250k	= 250000,		/*!< 250kbps */
	CAN_BAUDRATE_125k	= 125000		/*!< 125kbps */
} CAN_BAUDRATE;

//! ECAN Module operation modes
typedef enum _CAN_OP_MODE
{
    CAN_OP_MODE_NORMAL  	= 0x00,		/*!< Normal mode 				*/
    CAN_OP_MODE_DISABLE 	= 0x01,		/*!< Disable mode 				*/
    CAN_OP_MODE_LOOP    	= 0x02,		/*!< Loopback mode				*/ 
    CAN_OP_MODE_LISTEN_ONLY = 0x03,		/*!< Listen-only mode			*/
    CAN_OP_MODE_CONFIG  	= 0x04,		/*!< Configuration mode			*/
    CAN_OP_MODE_LISTEN_ALL 	= 0x07		/*!< Listen all messages mode	*/
} CAN_OP_MODE;

//! Indices de boucles
unsigned char jij;
unsigned char kik;

void dma0init(void);
void dma1init(void);

unsigned char *ptrSource, *ptrDest;

unsigned char canReceivedCommand;   // Stocke l'ordre CAN reçu
unsigned char canReceivedData[7];   // Stocke les data liées à l'ordre CAN reçu
unsigned char canReceivedOrderFlag; // indique à la boucle infinie qu'on a reçu un ordre CAN à traiter

/********************************************************
*						PROTOTYPES						*
********************************************************/

//! Function to change the Can Baudrate
void CanSetBaudRate(CAN_BAUDRATE baudrate);

//! Changes the operation mode of the ECAN Module
void CanSetOperationMode(CAN_OP_MODE mode);

//! Charge un filtre de réception
void ChargerFiltre(unsigned char numero, unsigned char id);
//void ChargerFiltre(unsigned int filter_no, unsigned int sid);

//! Envoi CAN d'un CAN_MSG
void EnvoiCanMsg(CAN_MSG *source);

//! Envoi CAN d'un CAN_MSG (TxB dédicacés)
void CanEnvoi(unsigned char productionId);

/********************************************************
*						FONCTIONS						*
********************************************************/

/****************** DECLARATION PRODUCTION *******************/

void CanDeclarationProduction(unsigned char id, void *ptrData, unsigned char len)
{
	// Teste si on a pas dépassé la limite des objets produits
	if(nombreObjetsProduits <= MAX_OBJETS_PRODUITS)				
	{
		nombreObjetsProduits++;
		production[nombreObjetsProduits].id = id;
		transmitBuffers[nombreObjetsProduits].SID = id;
		production[nombreObjetsProduits].ptrData = ptrData;
		production[nombreObjetsProduits].len = len;
		transmitBuffers[nombreObjetsProduits].DLC = len;
		//TODO implémenter la verification du fait qu'on est le producteur declare dans CanNetwork.h
	}
	// ATTENTION, ON DEPASSE LE NOMBRE DE PRODUCTIONS AUTORISE
	else
		while(1);					
}

/****************** DECLARATION CONSOMMATION *****************/

void CanDeclarationConsommation(unsigned char id, void *ptrData, unsigned char len)
{
	// Teste si on a pas dépassé la limite des objets consommés
	if(nombreObjetsConsommes <= MAX_OBJETS_CONSOMMES)				
	{
		consommation[nombreObjetsConsommes].id = id;
		consommation[nombreObjetsConsommes].ptrData = ptrData;
		consommation[nombreObjetsConsommes].len = len;
		ChargerFiltre(nombreObjetsConsommes, id);
		nombreObjetsConsommes++;				
	}
	// ATTENTION, ON DEPASSE LE NOMBRE DE CONSOMMATIONS AUTORISE
	else
		while(1);
}
/****************** ENVOI PRODUCTIONS ************************/

void CanEnvoiProductions(void)
{
	// Envoi de tous les messages CAN que l'on produit
	for(kik=1; kik <= nombreObjetsProduits; kik++)
		CanEnvoi(kik);
}

/****************** ENVOI PRODUCTION *************************/

void CanEnvoiProduction(void *ptrData)
{
#ifndef DEBUG_CAN_DISABLE
	//CAN_MSG *message;

	// Recherche du message CAN produit en fonction du pointeur reçu
	for(jij=1; jij <= nombreObjetsProduits; jij++)
		if(production[jij].ptrData == ptrData)
			break;

	// Envoi impossible car incorrect
	if(jij == nombreObjetsProduits+1)	
		while(1);

	CanEnvoi(jij);
#endif
}

/****************** ENVOI ************************************/

void EnvoiCanMsg(CAN_MSG *source)
{
    #ifndef DEBUG_CAN_DISABLE
	unsigned char i;
	unsigned char *ptrSource, *ptrDest;


        // Attente de la libération du buffer de transmission
	while(C1TR01CONbits.TXREQ0);

	// Chargement des variables de travail
	ptrSource = (unsigned char*)source->ptrData;
	ptrDest = &transmitBuffers[0].DATA[0];	

	// Chargement de l'ID à envoyer
	transmitBuffers[0].SID = source->id;

	// Configuration de la longueur du message
	transmitBuffers[0].DLC = source->len;

	// Chargement des données
	for(i = 0; i < source->len; i++)
		*(ptrDest++) = *(ptrSource++);

	// Demande d'envoi
	C1TR01CONbits.TX0PRI1 = 1;
	C1TR01CONbits.TX0PRI0 = 1;	
	C1TR01CONbits.TXREQ0 = 1;
#endif
}

/****************** INITIALIZE *******************************/

void CanInitialisation(unsigned char CanID)
{
    // Put module into configuration mode
    CanSetOperationMode(CAN_OP_MODE_CONFIG);	

	// Set Bit rate values as 500k
	CanSetBaudRate(CAN_BAUDRATE_500k);
	
	// Configure first 8 TxRx Buffers as Transmit Buffers, next 8 adressable buffers automatically receive buffers
	C1TR01CON = 0x8080;
	C1TR23CON = 0x8080;
	C1TR45CON = 0x8080;
	C1TR67CON = 0x8080;
	
	// Configures the DMA buffer size to 12 buffers and makes FIFO start at buffer 16
	C1FCTRLbits.DMABS 	= 0b011;
	C1FCTRLbits.FSA 	= 0b10000;

	// Points the FIFO Write Buffer and Next FIFO Read Buffer to buffer 16
	C1FIFO = 0x1010;
		
	// Activates filter window to configure filter and mask registers
	C1CTRL1bits.WIN = 1;
	
	// Associates filters 0 -> 14 to RX buffer 8 and 15 to RX buffer 9
	C1BUFPNT1 = 0x8888;
	C1BUFPNT2 = 0x8888;
	C1BUFPNT3 = 0x8888;
	C1BUFPNT4 = 0x9888;

	// Activates acceptance filter 15, disables all the others
	C1FEN1 = 0x8000;
		
	// Associates mask 0 to all filters
	C1FMSKSEL1 = 0x0000;
	C1FMSKSEL2 = 0x0000;

	// Sets maks 1 to check all bits
	C1RXM0SID = 0b1111111111101000;

	// Set Filter 15 Value
	ChargerFiltre(15, CanID);

	// Deactivates filter window
	C1CTRL1bits.WIN = 0;

	// Enable receive interrupt only
	C1INTEbits.RBIE = 0x1;

	// Initializes DMA channels to send and receive CAN messages
	dma0init();
	dma1init();

	// Put module into normal mode
	CanSetOperationMode(CAN_OP_MODE_NORMAL);

	nombreObjetsProduits = 0;
	nombreObjetsConsommes = 0;
}

/****************** SET OPERATION MODE ***********************/

void CanSetOperationMode(CAN_OP_MODE mode)
{
	// Clear all pending transmissions
    C1CTRL1bits.ABAT = 1;    

	// Request Configuration Mode
	C1CTRL1bits.REQOP = mode;
	                
	// Wait till desired mode is set
	while(C1CTRL1bits.OPMODE != mode);  
}

/****************** SET BAUDRATE *****************************/

void CanSetBaudRate(CAN_BAUDRATE baudrate)
{
	// Saves the current operation mode
	CAN_OP_MODE currentMode = CanGetOperationMode();	
	
	// Switch to configuration mode
	CanSetOperationMode(CAN_OP_MODE_CONFIG);

	// FCAN is selected to be FCY = 40MHz
	C1CTRL1bits.CANCKS = 0x1;
		
	/*
	Bit Time = (Sync Segment + Propagation Delay + Phase Segment 1 + Phase Segment 2)=20*TQ
	Phase Segment 1 = 8TQ
	Phase Segment 2 = 6Tq
	Propagation Delay = 5Tq
	Sync Segment = 1TQ
	CiCFG1<BRP> =(FCAN /(2 ×N×FBAUD))– 1
	*/
		
	/* Synchronization Jump Width set to 4 TQ */
	C1CFG1bits.SJW = 0x3;
	
	/* Baud Rate Prescaler */
	C1CFG1bits.BRP = ((FCAN/(2*NTQ*baudrate))-1);
	
	/* Phase Segment 1 time is 8 TQ */
	C1CFG2bits.SEG1PH=0x7;
	/* Phase Segment 2 time is set to be programmable */
	C1CFG2bits.SEG2PHTS = 0x1;
	/* Phase Segment 2 time is 6 TQ */
	C1CFG2bits.SEG2PH = 0x5;
	/* Propagation Segment time is 5 TQ */
	C1CFG2bits.PRSEG = 0x4;
	/* Bus line is sampled three times at the sample point */
	C1CFG2bits.SAM = 0x1;

	// Restores the previous operation mode
	CanSetOperationMode(currentMode);					
}

/****************** CHARGER FILTRE ***************************/

void ChargerFiltre(unsigned char numero, unsigned char id)
{
	// Saves the current operation mode
	CAN_OP_MODE currentMode = CanGetOperationMode();	
	
	// Switch to configuration mode
	CanSetOperationMode(CAN_OP_MODE_CONFIG);

	// Activates filter window to configure filter and mask registers
	C1CTRL1bits.WIN = 1;

	switch (numero)
	{
		case 0 : _SetRXFnValue(0, id); break;
		case 1 : _SetRXFnValue(1, id); break;
		case 2 : _SetRXFnValue(2, id); break;
		case 3 : _SetRXFnValue(3, id); break;
		case 4 : _SetRXFnValue(4, id); break;
		case 5 : _SetRXFnValue(5, id); break;
		case 6 : _SetRXFnValue(6, id); break;
		case 7 : _SetRXFnValue(7, id); break;
		case 8 : _SetRXFnValue(8, id); break;
		case 9 : _SetRXFnValue(9, id); break;
		case 10 : _SetRXFnValue(10, id); break;
		case 11 : _SetRXFnValue(11, id); break;
		case 12 : _SetRXFnValue(12, id); break;
		case 13 : _SetRXFnValue(13, id); break;
		case 14 : _SetRXFnValue(14, id); break;			
		case 15 : _SetRXFnValue(15, id); break;
		default : break;
	}
	
	// Deactivates filter window
	C1CTRL1bits.WIN = 0;

	// Restores the previous operation mode
	CanSetOperationMode(currentMode);	
}

/****************** ENVOI ************************************/

void CanEnvoi(unsigned char productionId)
{
	unsigned char i;
	unsigned char *ptrSource, *ptrDest;
	//CAN_MSG *message;

	// Chargement des variables de travail
	ptrSource = production[productionId].ptrData;

	ptrDest = &transmitBuffers[productionId].DATA[0];
	
	// Chargement des données
	for(i = 0; i < production[productionId].len; i++)
		*(ptrDest++) = *(ptrSource++);

	switch(productionId)
	{
		case 0:

			// Attente de la libération du buffer de transmission	
			while(C1TR01CONbits.TXREQ0);

			// Demande d'envoi
			C1TR01CONbits.TX0PRI1 = 1;
			C1TR01CONbits.TX0PRI0 = 1;	
			C1TR01CONbits.TXREQ0 = 1;		
		break;

		case 1:

			// Attente de la libération du buffer de transmission	
			while(C1TR01CONbits.TXREQ1);

			// Demande d'envoi
			C1TR01CONbits.TX1PRI1 = 1;
			C1TR01CONbits.TX1PRI0 = 1;	
			C1TR01CONbits.TXREQ1 = 1;	
		break;

		case 2:
			// Attente de la libération du buffer de transmission	
			while(C1TR23CONbits.TXREQ2);

			// Demande d'envoi
			C1TR23CONbits.TX2PRI1 = 1;
			C1TR23CONbits.TX2PRI0 = 1;	
			C1TR23CONbits.TXREQ2 = 1;	
		break;

		case 3:
			// Attente de la libération du buffer de transmission	
			while(C1TR23CONbits.TXREQ3);

			// Demande d'envoi
			C1TR23CONbits.TX3PRI1 = 1;
			C1TR23CONbits.TX3PRI0 = 1;	
			C1TR23CONbits.TXREQ3 = 1;
		break;

		case 4:
			// Attente de la libération du buffer de transmission	
			while(C1TR45CONbits.TXREQ4);

			// Demande d'envoi
			C1TR45CONbits.TX4PRI1 = 1;
			C1TR45CONbits.TX4PRI0 = 1;	
			C1TR45CONbits.TXREQ4 = 1;
		break;

		case 5:
			// Attente de la libération du buffer de transmission	
			while(C1TR45CONbits.TXREQ5);

			// Demande d'envoi
			C1TR45CONbits.TX5PRI1 = 1;
			C1TR45CONbits.TX5PRI0 = 1;	
			C1TR45CONbits.TXREQ5 = 1;
		break;

		case 6:
			// Attente de la libération du buffer de transmission	
			while(C1TR67CONbits.TXREQ6);

			// Demande d'envoi
			C1TR67CONbits.TX6PRI1 = 1;
			C1TR67CONbits.TX6PRI0 = 1;	
			C1TR67CONbits.TXREQ6 = 1;
		break;

		case 7:
			// Attente de la libération du buffer de transmission	
			while(C1TR67CONbits.TXREQ7);

			// Demande d'envoi
			C1TR67CONbits.TX7PRI1 = 1;
			C1TR67CONbits.TX7PRI0 = 1;	
			C1TR67CONbits.TXREQ7 = 1;
		break;
		
		default:
		break;
	}
}

/****************** Dma Initialization for TX ****************/

void dma0init(void){

	DMACS0=0;						// Clear DMA Status
    
	DMA0CONbits.SIZE = 0x0; 		// Data Transfer Size: Word Transfer Mode
	DMA0CONbits.DIR = 0x1; 			// Data Transfer Direction: DMA RAM to Peripheral  
	DMA0CONbits.HALF = 0x0;			// Initiate interrupt when all data has been transfered	 
	DMA0CONbits.NULLW = 0x0;		// Normal operation (no NULL data write)
	DMA0CONbits.AMODE = 0x2; 		// DMA Addressing Mode: Peripheral Indirect Addressing mode
	DMA0CONbits.MODE = 0x0; 		// Operating Mode: Continuous, Ping-Pong modes disabled
	
	DMA0REQ = 70; 					// Assign ECAN1 Transmit event for DMA Channel 0 
	
	DMA0PAD = (unsigned int)&C1TXD; 				// Peripheral Address: ECAN1 Transmit Register 
	
	DMA0CNT = 7; 					// Set Number of DMA Transfer per ECAN message to 8 words  
 	 
 	DMA0STA = 0x0000;  				// Start Address Offset for ECAN1 Message Buffer 0x0000 
	//DMA0STA=  __builtin_dmaoffset(ecan1msgBuf);	
	
	DMA0CONbits.CHEN = 0x1; 		// Channel Enable: Enable DMA Channel 0 
	IEC0bits.DMA0IE = 1;			// Channel Interrupt Enable: Enable DMA Channel 0 Interrupt  

}


/****************** Dma Initialization for RX ****************/

void dma1init(void){

	DMACS1=0;						// Clear DMA Status
    
	DMA1CONbits.SIZE = 0x0; 		// Data Transfer Size: Word Transfer Mode
	DMA1CONbits.DIR = 0x0; 			// Data Transfer Direction: Peripheral to DMA RAM
	DMA1CONbits.HALF = 0x0;			// Initiate interrupt when all data has been transfered	 
	DMA1CONbits.NULLW = 0x0;		// Normal operation (no NULL data write)
	DMA1CONbits.AMODE = 0x2; 		// DMA Addressing Mode: Peripheral Indirect Addressing mode
	DMA1CONbits.MODE = 0x0; 		// Operating Mode: Continuous, Ping-Pong modes disabled
	
	DMA1REQ = 34; 					// Assign ECAN1 Receive event for DMA Channel 1 
	
	DMA1PAD = (unsigned int)&C1RXD; 				// Peripheral Address: ECAN1 Transmit Register 
	
	DMA1CNT = 7; 					// Set Number of DMA Transfer per ECAN message to 8 words  
 	 
 	DMA1STA = 0x0000;  				// Start Address Offset for ECAN1 Message Buffer 0x0000 
	// ATTENTION 80 ???
	//DMA0STA=  __builtin_dmaoffset(ecan1msgBuf);	
	
	DMA1CONbits.CHEN = 0x1; 		// Channel Enable: Enable DMA Channel 0 
	IEC0bits.DMA1IE = 1;			// Channel Interrupt Enable: Enable DMA Channel 0 Interrupt  

}

/****************** Dma Interrupt handlers *******************/

void __attribute__((interrupt, no_auto_psv)) _DMA0Interrupt(void)
{
   IFS0bits.DMA0IF = 0;          // Clear the DMA0 Interrupt Flag;
}

void __attribute__((interrupt, no_auto_psv)) _DMA1Interrupt(void)
{
   IFS0bits.DMA1IF = 0;          // Clear the DMA1 Interrupt Flag;
}
