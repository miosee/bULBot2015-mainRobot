/*!
 * @file pwm.c
 * @author Kevin De Cuyper
 * @brief Fonctions pour la gestion des pwm
 */
#include <xc.h>
#include "timers.h"
#include "pwm.h"
#include "clock.h"

volatile unsigned int* const OCxCON[4] = {&OC1CON, &OC2CON, &OC3CON, &OC4CON};
volatile unsigned int* const OCxRS[4] = {&OC1RS, &OC2RS, &OC3RS, &OC4RS};

pwmStatus pwmSetup(int id, int timer, float periodMs) {
    timerStatus err;

    //on vérifie si l'ID de la pwm est correcte
    if (id != PWM_1 && id != PWM_2 && id != PWM_3 && id != PWM_4) {
        return PWM_ID_ERROR;
    }

    //on vérifie si l'ID du timer est correcte
    if (timer != TIMER_2 && timer != TIMER_3) {
        return PWM_TID_ERROR;
    }

    //création du timer associé
    err = timerSetup(timer, periodMs);


    //on vérifie si la période est correcte
    if (err == TIMER_PERIOD_ERROR) {
        return PWM_PERIOD_ERROR;
    }

    *OCxRS[id - 1] = 0; // remise à zéro du rapport cyclique

    //activation de la PWM
    if (timer == TIMER_2) {
        *OCxCON[id - 1] = 0b0110;
    } else {
        *OCxCON[id - 1] = 0b1110;
    }

    //lancement du timer
    timerStart(timer);
    
    return PWM_SUCCESS;
}

pwmStatus pwmSetDutyCycle(int id, float dutyCycle) {
    //on vérifie si l'ID de la pwm est correcte
    if (id != PWM_1 && id != PWM_2 && id != PWM_3 && id != PWM_4) {
        return PWM_ID_ERROR;
    }

    //saturation du rapport cyclique 
    if (dutyCycle > 1.0) {
        dutyCycle = 1.0;
    } else if (dutyCycle < 0) {
        dutyCycle = 0;
    }

    //si la PWM est branchée sur le timer 2
    if (0 == ((*OCxCON[id - 1])& 0b1000)) {
        *OCxRS[id - 1] = (float) (PR2+1) * dutyCycle;
    } else {
        *OCxRS[id - 1] = (float) (PR3+1) * dutyCycle;
    }

    return PWM_SUCCESS;
}

pwmStatus pwmSetDuration(int id, float durationMs) {

    int PRx;
    char prescaleShift[4] = {0,3,6,8}; //valeur de décalage à droite correspondant au prescaler

    //conversion de la durée en cycles machine
    long OCx = (float) (FCY / 1000) * durationMs - 1;

    //on vérifie si l'ID de la pwm est correcte
    if (id != PWM_1 && id != PWM_2 && id != PWM_3 && id != PWM_4) {
        return PWM_ID_ERROR;
    }

    //si la PWM est branchée sur le timer 2
    if (0 == ((*OCxCON[id - 1])& 0b1000)) {
        PRx = PR2;
        OCx >>= prescaleShift[T2CONbits.TCKPS]; //on tient compte du prescaler original
    } else {
        PRx = PR3;
        OCx >>= prescaleShift[T3CONbits.TCKPS];
    }

    //saturation du rapport cyclique
    if (OCx > PRx) {
        OCx = PRx;
    } else if (OCx < 0) {
        OCx = 0;
    }

    //modification du rapport cyclique
    *OCxRS[id - 1] = OCx;

    return PWM_SUCCESS;
}

pwmStatus pwmSetCycle(int id, float duration) {

    int PRx;

    //conversion de la durée en cycles machine
    int OCx = duration;

    //on vérifie si l'ID de la pwm est correcte
    if (id != PWM_1 && id != PWM_2 && id != PWM_3 && id != PWM_4) {
        return PWM_ID_ERROR;
    }

    //si la PWM est branchée sur le timer 2
    if (0 == ((*OCxCON[id - 1])& 0b1000)) {
        PRx = PR2;
    } else {
        PRx = PR3;
    }

    //saturation du rapport cyclique
    if (OCx > PRx) {
        OCx = PRx;
    } else if (OCx < 0) {
        OCx = 0;
    }

    //modification du rapport cyclique
    *OCxRS[id - 1] = OCx;

    return PWM_SUCCESS;
}

pwmStatus pwmEnable(int id){
        //on vérifie si l'ID de la pwm est correcte
    if (id != PWM_1 && id != PWM_2 && id != PWM_3 && id != PWM_4) {
        return PWM_ID_ERROR;
    }

    *OCxCON[id - 1] |= 0b0110;

    return PWM_SUCCESS;
}

pwmStatus pwmDisable(int id){
        //on vérifie si l'ID de la pwm est correcte
    if (id != PWM_1 && id != PWM_2 && id != PWM_3 && id != PWM_4) {
        return PWM_ID_ERROR;
    }

    *OCxCON[id - 1] &= 0xFFF8;

    return PWM_SUCCESS;
}