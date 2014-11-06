/*!
 * @file scheduler.c
 * @author Kevin De Cuyper
 * @brief Fonctions pour la gestion du scheduler
 */

#include <xc.h>
#include "timers.h"
#include "scheduler.h"

//! période du scheduler
float schedulerPeriodMs;

//! Pointeurs de fonction vers les fonctions à appeler dans le scheduler
void (*Tasks[MAX_TASKS])(void);

//! Tableau indiquant si une tache a été assignée à chaque ID
char TasksAssigned[MAX_TASKS];

//! Tableau indiquant si une tâche donnée est en train de tourner ou est en pause
char TasksRunning[MAX_TASKS];

//! Tableau avec la période (en nombre de débordements) de chaque tâche
unsigned int TasksPeriod[MAX_TASKS];

//! Compteur interne de débordements de timer
int periodCounts;

//! ID du timer associé
int timerInternal;

/**
 * @brief Fonction principale du scheduler, assignée à l'interruption du timer
 **/
void schedulerHandler(void);


schedulerStatus schedulerSetup(int timer, float periodMs) {
    int i;
    timerStatus tStatus;

    //Remise à zéro de tous les vecteurs
    for (i = 0; i < MAX_TASKS; i++) {
        Tasks[i] = 0;
        TasksAssigned[i] = 0;
        TasksRunning[i] = 0;
        TasksPeriod[i] = 1;
    }
    periodCounts = 0;
    // Définition du timer
    tStatus = timerSetup(timer, periodMs);

    // Gestion des erreurs de timer
    if (tStatus == TIMER_PERIOD_ERROR) {
        return SCHEDULER_PERIOD_ERROR;
    }

    if (tStatus == TIMER_ID_ERROR) {
        return SCHEDULER_TID_ERROR;
    }

    // création de la routine d'interruption
    timerInterrupt(timer, &schedulerHandler);
    schedulerPeriodMs = periodMs;
    timerInternal = timer;

    return SCHEDULER_SUCCESS;
}

schedulerStatus schedulerStart() {
    timerStart(timerInternal);
    return SCHEDULER_SUCCESS;
}

schedulerStatus schedulerStop() {
    timerStop(timerInternal);
    return SCHEDULER_SUCCESS;
}

int schedulerAddTask(void (*fonction)(void), float periodMs) {
    int tID = 0;
    // période, comptée en nombre de débordements
    if (periodMs <= schedulerPeriodMs) {
        return SCHEDULER_PERIOD_ERROR;
    }
    // on cherche une ID de libre
    for (tID = 0; tID < MAX_TASKS; tID++) {
        // on a trouvé une ID de libre
        if (TasksAssigned[tID] == 0) {

            //Configuration de la tâche
            TasksPeriod[tID] = periodMs / schedulerPeriodMs;
            Tasks[tID] = fonction;
            TasksAssigned[tID] = 1;
            TasksRunning[tID] = 1;
            return tID;
        }
    }

    //Pas d'ID disponible
    return SCHEDULER_TOO_MANY_TASKS;

}

schedulerStatus schedulerRemoveTask(int taskID){

    //on vérifie si l'ID est dans les limites acceptables
    if (taskID >= MAX_TASKS || taskID < 0){
        return SCHEDULER_TASK_ERROR;
    }

    //remise à zéro de la tache
    TasksRunning[taskID] = 0;
    TasksAssigned[taskID] = 0;
    Tasks[taskID] = 0;
    TasksPeriod[taskID] = 1;

    return SCHEDULER_SUCCESS;
}

schedulerStatus schedulerPauseTask(int taskID){
        //on vérifie si l'ID est dans les limites acceptables
    if (taskID >= MAX_TASKS || taskID < 0){
        return SCHEDULER_TASK_ERROR;
    }

    //remise à zéro de la tache
    TasksRunning[taskID] = 0;

    return SCHEDULER_SUCCESS;
}

schedulerStatus schedulerResumeTask(int taskID){
        //on vérifie si l'ID est dans les limites acceptables
    if (taskID >= MAX_TASKS || taskID < 0){
        return SCHEDULER_TASK_ERROR;
    }

    //remise à zéro de la tache
    TasksRunning[taskID] = 1;

    return SCHEDULER_SUCCESS;
}

void schedulerHandler(void) {
    int i = 0;

    periodCounts++;
    // On boucle sur les tâches
    for (i = 0; i < MAX_TASKS; i++) {
        // Si la tâche est active et que sa période est révolue
        if (TasksRunning[i] && ((periodCounts % TasksPeriod[i]) == 0)) {
            (*Tasks[i])(); //appel à la tâche en question
        }
    }
}
