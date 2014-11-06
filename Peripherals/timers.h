/*!
 * @file timers.h
 * @author Kevin De Cuyper
 * @brief Header file pour la gestion des timers. Les fonctions sont loin d'etre optimales du point de vue
 * du temps d'exécution, mais ce n'est généralement pas important
 */

#ifndef TIMERS_H
#define	TIMERS_H

//! Macro pour le timer 1
#define TIMER_1 1
//! Macro pour le timer 2
#define TIMER_2 2
//! Macro pour le timer 3
#define TIMER_3 3
//! Macro pour le timer 4
#define TIMER_4 4
//! Macro pour le timer 5
#define TIMER_5 5

//! Macro pour la paire de timers 2-3 en 32 bits
#define TIMER_2_3 6
//! Macro pour la paire de timers 4-5 en 32 bits
#define TIMER_4_5 7

/**
 * \enum timerStatus 
 * \brief spécifie si une erreur est apparue lors de l'exécution d'une fonction liée aux timers
 */
typedef enum {
    TIMER_SUCCESS = 0, //!< Tout s'est bien passé
    TIMER_ID_ERROR = 1, //!< une mauvaise ID de timer a été fournie
    TIMER_PERIOD_ERROR = 2, //!< la période est trop grande ou nulle
}timerStatus;

/**
 * @brief Configuration d'un timer 16bits sans le lancer, auto config du préscaler 
 * Attention : max 419ms pour FCY=40Mips, utiliser timerSetup32 si besoin d'une période plus grande
 * @param id  numero du timer (1 à 5)
 * @param periodMs periode en ms
 * @returns indication du succès ou de l'échec (et raison de l'échec)
 */
timerStatus timerSetup(int id, float periodMs);

/**
 * @brief Configuration d'un timer 32bits sans le lancer, auto config du préscaler
 * @param id  numero du timer (TIMER_2_3 ou TIMER_4_5)
 * @param periodMs  periode voulue en ms
 * @returns indication du succès ou de l'échec (et raison de l'échec)
 */
timerStatus timerSetup32(int id, float periodMs);

/**
 * @brief Lancement d'un timer
 * @param id numero du timer (1 à 5 ou TIMER_2_3 ou TIMER_4_5)
 * @returns indication du succès ou de l'échec (et raison de l'échec)
 */
timerStatus timerStart(int id);

/**
 * @brief Arret et remise à zero d'un timer 
 * @param id numero du timer (1 à 5 ou TIMER_2_3 ou TIMER_4_5)
 * @returns indication du succès ou de l'échec (et raison de l'échec)
 */
timerStatus timerStop(int id);

/**
 * @brief Activation de l'interruption du timer et définition de la fonction à appeler dans l'ISR.
 * Cette fonction doit être du type void maFonction(void)
 * Exemple d'appel : timerInterrupt(1, &maFonction)
 * @param id numero du timer (1 à 5)
 * @param fonction pointeur vers la fonction à appeler dans l'interrupt, ne doit pas remettre le flag à 0
  *@returns indication du succès ou de l'échec (et raison de l'échec)
 */
timerStatus timerInterrupt(int id, void (*fonction)(void));

#define disableIsrTimer1() IEC0bits.T1IE = 0
#define enableIsrTimer1() IEC0bits.T1IE = 1

#endif	/* TIMERS_H */

