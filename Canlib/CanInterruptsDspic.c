#include "CanDspic.h"
#include "xc.h"

void __attribute__((interrupt, no_auto_psv))_C1Interrupt(void)  
{    
	unsigned char iCan;
	unsigned char *prtObjet;
	CAN_MSG *receivedMessage;

	CAN_INTERRUPT_FLAG = 0;        // clear interrupt flag
 
    if(CAN_RX_BUFFER_IF)
    {   
		CAN_RX_BUFFER_IF = 0;
		
		if(CAN_RX_OBJECT_FLAG)
		{
			// On fait pointer receivedMessage vers le message CAN dans lequel doit être stocké
			// le message en fonction du filtre qui a déclenché
			receivedMessage = &consommation[receiveBufferObjects.FILHIT];
			
			// Chargement du pointeur destination vers les données du message CAN à remplir
			prtObjet = (unsigned char*)receivedMessage->ptrData;
			
			// Copie des données
			for(iCan = 0; iCan < receivedMessage->len; iCan++)
				*(prtObjet++) = receiveBufferObjects.DATA[iCan];
				
			CAN_RX_OBJECT_FLAG = 0;			// Clears the flag so that new messages can be received
		}
		else if (CAN_RX_ORDER_FLAG)
		{
			if(!canReceivedOrderFlag)			// Aucun ordre n'est en cours de traitement : on peut accepter
			{
				canReceivedCommand = receiveBufferOrders.DATA[0];	// Sauve l'ordre CAN
				canReceivedData[0] = receiveBufferOrders.DATA[1];	// Sauve les données CAN
				canReceivedData[1] = receiveBufferOrders.DATA[2];
				canReceivedData[2] = receiveBufferOrders.DATA[3];
				canReceivedData[3] = receiveBufferOrders.DATA[4];
				canReceivedData[4] = receiveBufferOrders.DATA[5];
				canReceivedData[5] = receiveBufferOrders.DATA[6];
				canReceivedData[6] = receiveBufferOrders.DATA[7];
				canReceivedOrderFlag = 1;		// Signifie au main qu'on a reçu un ordre et qu'il faut le traiter
			}
			CAN_RX_ORDER_FLAG = 0;				// Clears the flag so that new messages can be received
		}
	}
}
