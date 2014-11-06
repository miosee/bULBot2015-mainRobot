/*!
 * @file pwm.h
 * @author Kevin De Cuyper
 * @brief Header files avec les fonctions de gestion des PWM du module Output Compare
 */

#ifndef PWM_H
#define	PWM_H

/**
 * \enum pwmStatus
 * \brief spécifie si une erreur est apparue lors de l'exécution d'une fonction liée aux pwm
 */
typedef enum {
    PWM_SUCCESS = 0, //!< tout s'est bien passé
    PWM_TID_ERROR = 1, //!< une mauvaise ID de timer a été fournie (doit être TIMER_2 ou TIMER_3)
    PWM_PERIOD_ERROR = 2, //!< la période est trop grande ou nulle
    PWM_ID_ERROR = 3 //!< une mauvaise ID de PWM a été fournie
} pwmStatus;

//! Macro définissant la PWM1
#define PWM_1 1
//! Macro définissant la PWM2
#define PWM_2 2
//! Macro définissant la PWM3
#define PWM_3 3
//! Macro définissant la PWM4
#define PWM_4 4

/**
 * @brief Configuration d'un canal pwm basé sur un timer 16bits, la PWM est directement activée avec un rapport cyclique nul
 * Attention à ne pas oublier de configurer la borne via le PPS
 * @param id  numero de la pwm (1 -> 4)
 * @param timer numéeo du timer associé (2 ou 3), le prescaler est calculé automatiquement
 * @param periodMs periode en ms (peut etre inférieure à 1ms)
 * @returns indication du succès ou de l'échec (et raison de l'échec)
 */
pwmStatus pwmSetup(int id, int timer, float periodMs);

/**
 * @brief Modification du rapport cyclique d'une PWM (utile pour les moteurs), avec saturation
 * @param id  numero de la pwm (1 -> 4)
 * @param dutyCycle rapport cyclique (entre 0 et 1)
 * @returns indication du succès ou de l'échec (et raison de l'échec)
 */
pwmStatus pwmSetDutyCycle(int id, float dutyCycle);

/**
 * @brief Modification de la durée de l'état haut d'une PWM (utile pour les servos), avec saturation
 * @param id  numero de la pwm (1 -> 4)
 * @param durationMs durée de l'état haut en ms
 * @returns indication du succès ou de l'échec (et raison de l'échec)
 */
pwmStatus pwmSetDuration(int id, float durationMs);

/**
 * @brief Assignation directe du registre de longueur de la PWM, avec saturation
 * @param id  numero de la pwm (1 -> 4)
 * @param duration durée de l'état haut en cycles machine
 * @returns indication du succès ou de l'échec (et raison de l'échec)
 */
pwmStatus pwmSetCycle(int id, float duration);

/**
 * @brief (Ré)activation de la PWM, déja fait lors du setup
 * @param id  numero de la pwm (1 -> 4)
 * @returns indication du succès ou de l'échec (et raison de l'échec)
 */
pwmStatus pwmEnable(int id);

/**
 * @brief Désactivation de la PWM
 * @param id  numero de la pwm (1 -> 4)
 * @returns indication du succès ou de l'échec (et raison de l'échec)
 */
pwmStatus pwmDisable(int id);

#endif	/* PWM_H */

