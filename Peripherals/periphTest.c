/* 
 * File:   main.c
 * Author: Kevin
 *
 * Created on 15 avril 2014, 22:20
 */

#include <xc.h>
#include "timers.h"
#include "clock.h"
#include "pwm.h"
#include "pps.h"
#include "scheduler.h"

_FOSC(FCKSM_CSECMD & OSCIOFNC_OFF & POSCMD_XT);
_FGS(GSS_OFF & //
        GCP_OFF & //
        GWRP_OFF); //
_FICD(ICS_PGD1);
/*
 * 
 */

//fonction qui sera appel�e � chaque interruption du timer
int n, m;

#define TEST_TIMER 0
#define TEST_PWM 0
#define TEST_SCHEDULER 1

void incrN(void) {
    n = n + 1;
}

void incrM(void) {
    m = m + 1;
}

int main(int argc, char** argv) {

    int ret;

    PllConfig();



#if TEST_TIMER
    //Test des fonctions de configuration des timers, ici le timer 1
    //configuration du timer 1 pour une période de 1ms
    timerSetup(TIMER_1, 1);
    //on active l'interruption du timer 1, et on lie incrN � cette interruption, de sorte qu'elle soit appel�e � chaque d�bordement du timer.
    // DOIT etre une fonction de la forme void maFonction(void) !!
    timerInterrupt(TIMER_1, &incrN);
    //lancement du timer 1
    timerStart(TIMER_1);
#endif

#if TEST_PWM
    // connecte la sortie de OC1 à la patte RP0
    ppsOutConfig(PPS_OC1, 0);
    //Test de la configuration de la PWM
    //configuration de la PWM 1 , sur le timer 3, avec une fréquence de 20kHz
    pwmSetup(PWM_1, TIMER_3, 0.05);
    //modification du rapport cyclique à 30%
    pwmSetDutyCycle(PWM_1, 0.3);
    //configuration de la PWM 2 , sur le timer 2, avec une période de 5ms
    pwmSetup(PWM_2, TIMER_2, 5);
    //modification du rapport cyclique à 2ms
    ret = pwmSetDuration(PWM_2, 2);
#endif

#if TEST_SCHEDULER
    //Test du scheduler
    int task1, task2;
    schedulerSetup(TIMER_4, 1);
    task1 = schedulerAddTask(&incrN, 2);
    task2 = schedulerAddTask(&incrM, 200);
    schedulerStart();
#endif
    while (1);

}



