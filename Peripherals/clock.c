/*!
 * @file clock.h
 * @author Kevin De Cuyper
 * @brief fonction de configuration de la PLL
 */

#include <xc.h>

void pllConfig(void) {
	PLLFBD = 30; // M = 32
	CLKDIVbits.PLLPOST = 0; // N1 = 2
	CLKDIVbits.PLLPRE = 0; // N2 = 2
	// Initiate Clock Switch to Primary Oscillator with PLL
	__builtin_write_OSCCONH(3);
	__builtin_write_OSCCONL(1);
	// Wait for Clock switch to occur
	while (OSCCONbits.COSC != 0b011);
}
