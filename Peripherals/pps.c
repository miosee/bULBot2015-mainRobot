/*!
 * @file pps.c
 * @author Michel Osée
 * @brief Fonctions de configuration des remappable pins
 */

#include <xc.h>
#include "pps.h"


ppsStatus ppsOutConfig(ppsOutput periphOutput, int rpPin) {
#if defined(__dsPIC33FJ128MC802__) ||defined(__dsPIC33FJ128GP802__)
	if ((periphOutput < 1) || (periphOutput > 10)) {
		return PPS_PERIPH_ERROR;
	}
#elif defined(__dsPIC33FJ128MC804__) ||defined(__dsPIC33FJ128GP804__)
	if ((periphOutput < 1) || (periphOutput > 0x1B)) {
		return PPS_PERIPH_ERROR;
	}
#endif
	switch (rpPin) {
		case 0:		RPOR0bits.RP0R  = periphOutput;	break;
		case 1:		RPOR0bits.RP1R  = periphOutput;	break;
		case 2:		RPOR1bits.RP2R  = periphOutput;	break;
		case 3:		RPOR1bits.RP3R  = periphOutput;	break;
		case 4:		RPOR2bits.RP4R  = periphOutput;	break;
		case 5:		RPOR2bits.RP5R  = periphOutput;	break;
		case 6:		RPOR3bits.RP6R  = periphOutput;	break;
		case 7:		RPOR3bits.RP7R  = periphOutput;	break;
		case 8:		RPOR4bits.RP8R  = periphOutput;	break;
		case 9:		RPOR4bits.RP9R  = periphOutput;	break;
		case 10:	RPOR5bits.RP10R = periphOutput;	break;
		case 11:	RPOR5bits.RP11R = periphOutput;	break;
		case 12:	RPOR6bits.RP12R = periphOutput;	break;
		case 13:	RPOR6bits.RP13R = periphOutput;	break;
		case 14:	RPOR7bits.RP14R = periphOutput;	break;
		case 15:	RPOR7bits.RP15R = periphOutput;	break;
#if defined(__dsPIC33FJ128GP804__) ||defined(__dsPIC33FJ128MC804__)
		case 16:	RPOR8bits.RP16R  = periphOutput;	break;
		case 17:	RPOR8bits.RP17R  = periphOutput;	break;
		case 18:	RPOR9bits.RP18R  = periphOutput;	break;
		case 19:	RPOR9bits.RP19R  = periphOutput;	break;
		case 20:	RPOR10bits.RP20R = periphOutput;	break;
		case 21:	RPOR10bits.RP21R = periphOutput;	break;
		case 22:	RPOR11bits.RP22R = periphOutput;	break;
		case 23:	RPOR11bits.RP23R = periphOutput;	break;
		case 24:	RPOR12bits.RP24R = periphOutput;	break;
		case 25:	RPOR12bits.RP25R = periphOutput;	break;
#endif
		default:
			return PPS_PIN_ERROR;
			break;
	}
	return PPS_SUCCESS;
}


ppsStatus ppsInConfig(ppsInput periphInput, int rpPin) {
#if defined(__dsPIC33FJ128MC802__) ||defined(__dsPIC33FJ128GP802__)
	if ((rpPin < 0) || (rpPin > 15)) {
		return PPS_PIN_ERROR;
	}
#elif defined(__dsPIC33FJ128MC804__) ||defined(__dsPIC33FJ128GP804__)
	if ((rpPin < 0) || (rpPin > 25)) {
		return PPS_PIN_ERROR;
	}
#endif
	switch (periphInput) {
		case PPS_U1RX		: RPINR18bits.U1RXR	 = rpPin;	break;	/* Assign UART1 Receive (U1RX) to the corresponding RPn pin*/
		case PPS_U1CTS		: RPINR18bits.U1CTSR = rpPin;	break;	/* Assign UART1 Clear to Send (U1CTS) to the corresponding RPn pin*/
		case PPS_U2RX		: RPINR19bits.U2RXR  = rpPin;	break;	/* Assign UART2 Receive (U2RX) to the corresponding RPn pin*/
		case PPS_U2CTS		: RPINR19bits.U2CTSR = rpPin;	break;	/* Assign UART2 Clear to Send (U2CTS) to the corresponding RPn pin*/
		case PPS_SDI1		: RPINR20bits.SDI1R  = rpPin;	break;	/* Assign SPI1 Data Input (SDI1) to the corresponding RPn pin*/
		case PPS_IN_SCK1	: RPINR20bits.SCK1R  = rpPin;	break;	/* Assign SPI1 Clock Input (SCK1IN) to the corresponding RPn pin*/
		case PPS_IN_SS1		: RPINR21bits.SS1R  = rpPin;	break;	/* Assign SPI1 Slave Select Input (SS1IN) to the corresponding RPn pin*/
		case PPS_SDI2		: RPINR22bits.SDI2R = rpPin;	break;	/* Assign SPI2 Data Input (SDI2) to the corresponding RPn pin*/
		case PPS_IN_SCK2	: RPINR22bits.SCK2R = rpPin;	break;	/* Assign SPI2 Clock Input (SCK2IN) to the corresponding RPn pin*/
		case PPS_IN_SS2		: RPINR23bits.SS2R  = rpPin;	break;	/* Assign SPI2 Slave Select Input (SS2IN) to the corresponding RPn pin*/
		case PPS_IN_C1RX	: RPINR26bits.C1RXR = rpPin;	break;
#if defined(__dsPIC33FJ128MC802__) ||defined(__dsPIC33FJ128MC804__)
		case PPS_QEA1		: RPINR14bits.QEA1R = rpPin;	break;	/* Assign A (QEA) to the corresponding pin*/
		case PPS_QEB1		: RPINR14bits.QEB1R = rpPin;	break;	/* Assign B (QEB) to the corresponding pin*/
		case PPS_QEA2		: RPINR16bits.QEA2R = rpPin;	break;	/* Assign A (QEA) to the corresponding pin*/
		case PPS_QEB2		: RPINR16bits.QEB2R = rpPin;	break;	/* Assign B (QEB) to the corresponding pin*/
#endif
		default:
			return PPS_PERIPH_ERROR;
			break;
	}
	return PPS_SUCCESS;
}
