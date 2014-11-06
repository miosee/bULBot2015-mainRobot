/*!
 * @file timers.c
 * @author Kevin De Cuyper
 * @brief Fonctions pour la gestion des timers et pour la définition des ISR
 */

#include <xc.h>
#include "timers.h"
#include "clock.h"

//! Vecteur avec les pointeurs vers les registres de configuration
volatile unsigned int* const TxCON[5] = {&T1CON, &T2CON, &T3CON, &T4CON, &T5CON};
//! Vecteur avec les pointeurs vers les registres de période
volatile unsigned int* const PRx[5] = {&PR1, &PR2, &PR3, &PR4, &PR5};
//! Vecteur avec les pointeurs vers les registres de comptage
volatile unsigned int* const TMRx[5] = {&TMR1, &TMR2, &TMR3, &TMR4, &TMR5};
//! Vecteur avec les pointeurs vers les registres d'activation des interruptions
volatile unsigned int* const ISRENx[5] = {&IEC0, &IEC0, &IEC0, &IEC1, &IEC1};
//! Bit masks pour isoler le bon bit à activer 
unsigned int const ISRMaskx[5] = {0x0008, 0x0080, 0x0100, 0x0800, 0x1000};

//! Pointeurs de fonction vers les fonctions à appeler lors de l'interruption du timer
void (*TxISR[5])(void) = {0,0,0,0,0};



timerStatus timerSetup(int id, float periodMs){
    
    long PRval;
    int prescale;
    
    //élimination des cas indésirables
    if( id < 1 || id > 5)
        return TIMER_ID_ERROR;
    
    PRval = (float)(FCY/1000)*periodMs-1;
    if(PRval <= 0)
        return TIMER_PERIOD_ERROR;

    //calcul du prescale éventuel
    if(PRval  <= 65535)
        prescale = 0;
    else if(PRval <= 65535*8){
        prescale = 0x10;
        PRval /=8;
    }    
    else if(PRval <= 65535*64){
        prescale = 0x20;
        PRval /= 64;
    }
    else if(PRval <= 65535*256){
        prescale = 0x30;
        PRval /=256;
    }
    else return TIMER_PERIOD_ERROR;

    // modification des registres
    *TxCON[id-1] = prescale;
    *PRx[id-1] = PRval;
    *TMRx[id-1] = 0; //remise à zéro du compteur

    return TIMER_SUCCESS;
}


timerStatus timerSetup32(int id, float periodMs){

    float PRval;
    int prescale;
    int x;
    //élimination des cas indésirables
    if( id != TIMER_2_3 && id != TIMER_4_5)
        return TIMER_ID_ERROR;

    PRval = (float)(FCY/1000)*periodMs-1;
    if(PRval <= 0)
        return TIMER_PERIOD_ERROR;

    //calcul du prescale éventuel
    if(PRval  <= 4294967295.0)
        prescale = 0;
    else if(PRval <= 4294967295.0*8){
        prescale = 0x10;
        PRval /=8;
    }
    else if(PRval <= 4294967295.0*64){
        prescale = 0x20;
        PRval /= 64;
    }
    else if(PRval <= 4294967295.0*256){
        prescale = 0x30;
        PRval /=256;
    }
    else return TIMER_PERIOD_ERROR;

    // modification des registres
    if(id == TIMER_2_3) x = 2;
    else x = 4;
    *TxCON[x-1] = prescale+0x8; //modification du prescaler + passage en 32bits
    *PRx[x] = ((unsigned long)PRval)>>16;
    *PRx[x-1] = (unsigned long)PRval;
    *TMRx[x-1] = 0; //remise à zéro du compteur
    *TMRx[x] = 0; //remise à zéro du compteur

    return TIMER_SUCCESS;
}


timerStatus timerStart(int id)
{
    int x;
    if(id < 1 || (id > 5 && (id != TIMER_2_3) && (id !=TIMER_4_5)))
        return TIMER_ID_ERROR;

    if(id <= 5){
        x = id;
    }
    else{
        if(id == TIMER_2_3) x = 2;
        else x = 4;

        
    }
    *TxCON[x-1] |= 0x8000; //lancement du timer
    return TIMER_SUCCESS;
}


timerStatus timerStop(int id)
{
    int x;
    if(id < 1 || (id > 5 && (id != TIMER_2_3) && (id !=TIMER_4_5)))
        return TIMER_ID_ERROR;

    if(id <= 5) x = id;
    else{
        if(id == TIMER_2_3) x = 2;
        else x = 4;
    }
    *TxCON[x-1] &= 0x7FFF; //arret du timer
    return TIMER_SUCCESS;
}


timerStatus timerInterrupt(int id, void (*fonction)(void)){
    int x;

    if(id < 1 || (id > 5 && (id != TIMER_2_3) && (id !=TIMER_4_5)))
        return TIMER_ID_ERROR;
    if(id <= 5) x = id;
    else{
        if(id == TIMER_2_3) x = 3;
        else x = 5;
    }
    *ISRENx[x-1] |= ISRMaskx[x-1];
    TxISR[x-1] = fonction;
    
    return TIMER_SUCCESS;
}


void __attribute__((interrupt, auto_psv)) _T1Interrupt(void){
    IFS0bits.T1IF = 0;
    if(TxISR[0]) //si une fonction a été définie
        (*TxISR[0])(); //appel à la fonction en question
}

void __attribute__((interrupt, auto_psv)) _T2Interrupt(void){
    IFS0bits.T2IF = 0;
    if(TxISR[1]) //si une fonction a été définie
        (*TxISR[1])(); //appel à la fonction en question
}

void __attribute__((interrupt, auto_psv)) _T3Interrupt(void){
    IFS0bits.T3IF = 0;
    if(TxISR[2]) //si une fonction a été définie
        (*TxISR[2])(); //appel à la fonction en question
}

void __attribute__((interrupt, auto_psv)) _T4Interrupt(void){
    IFS1bits.T4IF = 0;
    if(TxISR[3]) //si une fonction a été définie
        (*TxISR[3])(); //appel à la fonction en question
}

void __attribute__((interrupt, auto_psv)) _T5Interrupt(void){
    IFS1bits.T5IF = 0;
    if(TxISR[4]) //si une fonction a été définie
        (*TxISR[4])(); //appel à la fonction en question
}
