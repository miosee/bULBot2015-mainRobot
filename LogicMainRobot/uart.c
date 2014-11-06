#include "p33FJ128MC804.h"
#include "globales.h"
#include "uart.h"

/*!
 * @brief Initialise les modules UART
 * @details Initialise les registres liés aux deux modules UART. 
 *
*/
void uartInit(void)
{
	U1MODEbits.UARTEN=0; 		//Disable UART
	U1MODEbits.BRGH=0; 			//Mode lent surréchantillonnage de 16
	U1BRG=29; 					//Baudrate de 
	U1MODEbits.PDSEL=0b01; 		//Mots de 8 bits, bit de parité paire
	U1STAbits.URXISEL=0b00;		//Déclenche une interruption quand on reçoit un caractère
	U1MODEbits.UARTEN=1; 		//Enable UART
	U1STAbits.UTXEN=1; 			//Enable la transmission

	U2MODEbits.UARTEN = 0;		//Disable UART2
	U2MODEbits.BRGH = 0; 		//Mode lent, suréchantillonnage de 16
	U2BRG = 249;				//Baudrate de 10 Kb/s
	U2MODEbits.PDSEL=0b01;		//Mots de 8 bits, bit de parité paire
	U2STAbits.URXISEL = 0b00;	//Déclenche une interruption quand on reçoit un caractère
	U2MODEbits.UARTEN = 1; 		//Enable UART
	U2STAbits.UTXEN = 1; 		//Enable la transmission
	
}

/*!
 * @brief Envoi d'un message via l'UART.
 * @details Envoie le message @p message sur l'UART sur le canal @p canal. La fonction envoie 
 * d'abord la taille du message, puis l'ID du message CAN (@p id) associé et enfin le message en tant que tel. 
 * @param[in] message Message CAN à transmettre.
 * @param[in] taille Taille du message.
 * @param[in] id ID du message.
 * @param[in] canal Canal UART sur lequel doit s'effectuer la transmission. 
 */

void uartEnvoiMessage(unsigned char* message, unsigned char taille, unsigned char id, int canal)
{
	int i;
	unsigned char caractere;

	if (canal == UART1) {
		while(U1STAbits.UTXBF);	//Envoi de la taille du message via l'UART
		U1TXREG=2+(taille*3);	//= 2 caractère d'id 
								//+ taille du message CAN *(2 caractères + 1 espacement)

		uartEnvoiHexa(id, UART1); //Envoi de l'id	

		for(i=0;i<taille;i++)
		{	
			while(U1STAbits.UTXBF);//Envoi d'un caractère d'espacement
			U1TXREG=' ';
			caractere=message[i];
			uartEnvoiHexa(caractere, UART1);	//Envoi du message via l'UART
		}
	}
	
	else if (canal == UART2) {

		while(U2STAbits.UTXBF);	//Envoi de la taille du message via l'UART
		U2TXREG=2+(taille*3);	//= 2 caractère d'id 
							//+ taille du message CAN *(2 caractères + 1 espacement)

		uartEnvoiHexa(id, UART2); //Envoi de l'id	

		for(i=0;i<taille;i++)
		{	
			while(U2STAbits.UTXBF);//Envoi d'un caractère d'espacement
			U2TXREG=' ';
			caractere=message[i];
			uartEnvoiHexa(caractere, UART2);	//Envoi du message via l'UART
		}				
	}
}


/*!
 * @brief Envoi d'un chiffre hexadécimal via l'UART.
 * @details Convertit l'entier @p nombre en deux octets et l'envoie via l'UART.
 * @param[in] nombre Nombre hexadécimal (inférieur à 256) à envoyer.
 * @param[in] canal Canal à utiliser pour l'envoi. 
 */
void uartEnvoiHexa(unsigned char nombre, int canal)
{
	char hex1;
	char hex2;

	hex1=nombre/16;	//Calcul des deux chiffres hexadécimaux
	hex2=nombre%16;

	if (canal == UART1) {
		if(hex1<10)
		{
			while(U1STAbits.UTXBF);	//Envoi du premier chiffre
			U1TXREG='0'+hex1;
		}
		else
		{
			while(U1STAbits.UTXBF);
			U1TXREG='A'+hex1-10;
	
		}
	
		if(hex2<10)
		{
			while(U1STAbits.UTXBF);	//Envoi du deuxième chiffre
			U1TXREG='0'+hex2;
		}
		else
		{
			while(U1STAbits.UTXBF);
			U1TXREG='A'+hex2-10;
		}
	}

	else if (canal == UART2) {
		if(hex1<10)
		{
			while(U2STAbits.UTXBF);	//Envoi du premier chiffre
			U2TXREG='0'+hex1;
		}
		else
		{
			while(U2STAbits.UTXBF);
			U2TXREG='A'+hex1-10;
	
		}
	
		if(hex2<10)
		{
			while(U2STAbits.UTXBF);	//Envoi du deuxième chiffre
			U2TXREG='0'+hex2;
		}
		else
		{
			while(U2STAbits.UTXBF);
			U2TXREG='A'+hex2-10;
		}
	}


}

/*!
 * @brief Envoi du temps courant via l'UART1.
 * @details Fonction permettant de fournir le temps courant à la boite noire. 
*/
void uartEnvoiTemps()
{
	int mult;
	int j,k;
	int save_millisecondes;
	int save_secondes;
	int save_minutes;

	save_millisecondes=compteur_millisecondes;
	save_secondes=compteur_secondes;
	save_minutes=compteur_minutes;

	while(U1STAbits.UTXBF);	//Envoi de la taille de la chaine
	U1TXREG=5;

	for(j=0;j<2;j++)
	{
		mult=1;
		for(k=1;k<2-j;k++)	//Conversion du nombre de minutes
			mult *= 10;
		while(U1STAbits.UTXBF);
		U1TXREG='0'+save_minutes/mult;
		save_minutes=save_minutes%mult;
	}

	while(U1STAbits.UTXBF);
	U1TXREG=':';	//Séparateur

	for(j=0;j<2;j++)
	{
		mult=1;
		for(k=1;k<2-j;k++)	//Conversion du nombre de secondes
			mult *= 10;
		while(U1STAbits.UTXBF);
		U1TXREG='0'+save_secondes/mult;
		save_secondes=save_secondes%mult;
	}
/*
	while(U1STAbits.UTXBF);
	U1TXREG=':';	//Séparateur

	for(j=0;j<3;j++)
	{
		mult=1;
		for(k=1;k<3-j;k++)	//Conversion du nombre de millisecondes
			mult *= 10;
		while(U1STAbits.UTXBF);
		U1TXREG=='0'+save_millisecondes/mult;
		save_millisecondes=save_millisecondes%mult;
	}
*/
}

