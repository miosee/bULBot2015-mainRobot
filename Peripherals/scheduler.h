/*!
 * @file scheduler.h
 * @author Kevin De Cuyper
 * @brief Header files avec les fonctions permettant d'interagir avec le scheduler
 */

#ifndef SCHEDULER_H
#define	SCHEDULER_H

/**
 * \enum schedulerStatus 
 * \brief spécifie si une erreur est apparue lors de l'exécution d'une fonction liée aux timers
 */
typedef enum {
    SCHEDULER_SUCCESS = 0, //!< Tout s'est bien passé
    SCHEDULER_TID_ERROR = 1, //!< une mauvaise ID de timer a été fournie
    SCHEDULER_PERIOD_ERROR = 2, //!< la période est trop grande ou nulle
    SCHEDULER_NOT_SETUP = 3, //<! le scheduler n'a pas été configuré
    SCHEDULER_TASK_ERROR = 4, //<! Mauvais numéro de tache passé au scheduler
    SCHEDULER_TOO_MANY_TASKS = 5 //!< Trop de tâches définies, augmenter MAX_TASKS
}schedulerStatus;

//! Nombre maximum de tâches allouées par le scheduler
#define MAX_TASKS 10


/**
 * @brief Configuration du scheduler, avec choix du timer et de la période principale
 *
 * Configuration du scheduler, avec choix du timer et de la période principale (max 419ms pour FCY=40Mips). Le lancement est une fonction séparée
 * Attention : un seul scheduler par projet !
 * Le scheduler utilise l'interruption du timer choisi, qui ne peut pas être utilisée pour autre chose.
 * @param timer numéeo du timer associé (TIMER_1 à TIMER_5 , définis dans timers.h)
 * @param periodMs periode en ms (peut etre inférieure à 1ms), le prescaler est calculé automatiquement
 * @returns indication du succès ou de l'échec (et raison de l'échec)
 */
schedulerStatus schedulerSetup(int timer, float periodMs);

/**
 * @brief Lancement du scheduler
 * @returns indication du succès ou de l'échec (et raison de l'échec)
 */
schedulerStatus schedulerStart();

/**
 * @brief Arrêt du scheduler
 * @returns indication du succès ou de l'échec (et raison de l'échec)
 */
schedulerStatus schedulerStop();

/**
 * @brief Ajout d'une tache périodique (nombre max :  MAX_TASKS)
 * Cette fonction doit être du type void maFonction(void)
 * Exemple d'appel : schedulerAddTask(&maFonction, 5)
 * @param fonction fonction à executer de manière périodique
 * @param periodMs periode en ms à laquelle dois être exécutée. Arrondi à l'inférieur si n'est pas un nombre rond de périodes du scheduler
 * @returns numéro de la tache dans le scheduler, utilisé par la suite pour reconfigurer la tache
 */
int schedulerAddTask(void (*fonction)(void), float periodMs);

/**
 * @brief Suppression d'une tâche. Son ID pourra être réutilisée si d'autres tâches sont créées.
 * @param taskID ID de la tâche à supprimer
 * @returns indication du succès ou de l'échec (et raison de l'échec)
 */
schedulerStatus schedulerRemoveTask(int taskID);

/**
 * @brief Arrêt temporaire d'une tâche. Ne supprime pas complètement la tâche, mais la met en pause
 * @param taskID ID de la tâche à geler
 * @returns indication du succès ou de l'échec (et raison de l'échec)
 */
schedulerStatus schedulerPauseTask(int taskID);

/**
 * @brief Reprise d'une tâche
 * @param taskID ID de la tâche à relancer
 * @returns indication du succès ou de l'échec (et raison de l'échec)
 */
schedulerStatus schedulerResumeTask(int taskID);


#endif	/* SCHEDULER_H */

