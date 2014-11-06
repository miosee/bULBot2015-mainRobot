#include "Configware.h"
#include "Motors.h"
#include "../Peripherals/pps.h"
#include "../Peripherals/pwm.h"
#include "../Peripherals/timers.h"
#include <xc.h>


#define PWM_PERIOD	50E-3	// période de la pwm, en  ms
// limitation du DC max nécessaire pour les bootstraps du driver
#define MAX_DC		1980
#define MIN_DC		20

// Pattes du driver moteurs
#define EN_R1		LATAbits.LATA8
#define EN_R2		LATCbits.LATC1		// /!\ c'est AN7
#define EN_L1		LATBbits.LATB15
#define EN_L2		LATAbits.LATA7
#define PWM_R1		(1)
#define PWM_R2		(2)
#define PWM_L1		(3)
#define PWM_L2		(4)


void motorsInit(void) {
	// assignation des pattes des PWM
	ppsOutConfig(PPS_OC1, 18);	// OC1 -> RP18	(PWM_R1)
	AD1PCFGLbits.PCFG8 = 1;		// AN8/RP18 en numérique
	ppsOutConfig(PPS_OC2, 16);	// OC2 -> RP16	(PWM_R2)
	AD1PCFGLbits.PCFG6 = 1;		// AN6/RP16 en numérique
	ppsOutConfig(PPS_OC3, 14);	// OC3 -> RP14	(PWM_L1)
	ppsOutConfig(PPS_OC4, 13);	// OC4 -> RP13	(PWM_L2)
	// désactivation des enable tant qu'on n'a pas besoin du driver
	// recommandé quand les alim sont activées
	EN_R1 = 0;
	EN_R2 = 0;
	EN_L1 = 0;
	EN_L2 = 0;
	// assignation des pattes des EN
	TRISAbits.TRISA8 = 0;
	TRISCbits.TRISC1 = 0;
	AD1PCFGLbits.PCFG7 = 1;	// AN7/RC1 en numérique
	TRISBbits.TRISB15 = 0;
	TRISAbits.TRISA7 = 0;
	// configuration des pwm
	 pwmSetup(PWM_R1, 2, PWM_PERIOD);		// active la pwmR1, couplée au timer2, avec une période de 50us
	 pwmSetup(PWM_R2, 2, PWM_PERIOD);		// active la pwmR2, couplée au timer2, avec une période de 50us
	 pwmSetup(PWM_L1, 2, PWM_PERIOD);		// active la pwmL1, couplée au timer2, avec une période de 50us
	 pwmSetup(PWM_L2, 2, PWM_PERIOD);		// active la pwmL2, couplée au timer2, avec une période de 50us
}


void motorsEnable(void) {
	pwmSetDutyCycle(PWM_R1, 0);
	pwmSetDutyCycle(PWM_R2, 0);
	pwmSetDutyCycle(PWM_L1, 0);
	pwmSetDutyCycle(PWM_L2, 0);
	EN_R1 = 1;
	EN_R2 = 1;
	EN_L1 = 1;
	EN_L2 = 1;
}


void motorsDisable(void) {
	EN_R1 = 0;
	EN_R2 = 0;
	EN_L1 = 0;
	EN_L2 = 0;
	pwmSetDutyCycle(PWM_R1, 0);
	pwmSetDutyCycle(PWM_R2, 0);
	pwmSetDutyCycle(PWM_L1, 0);
	pwmSetDutyCycle(PWM_L2, 0);
}


void motorsSetSpeed(float dcR, float dcL) {
	if (dcR > 0) {
		pwmSetDutyCycle(PWM_R1, dcR);
		pwmSetDutyCycle(PWM_R2, 0);
	} else {
		pwmSetDutyCycle(PWM_R1, 0);
		pwmSetDutyCycle(PWM_R2, -dcR);
	}
	if (dcL > 0) {
		pwmSetDutyCycle(PWM_L1, dcL);
		pwmSetDutyCycle(PWM_L2, 0);
	} else {
		pwmSetDutyCycle(PWM_L1, 0);
		pwmSetDutyCycle(PWM_L2, -dcL);
	}
}
