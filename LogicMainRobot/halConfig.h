/**
 * @file halConfig.h
 * @author bULBot 2011-2012
 * @author Olivier Desenfans
 * @brief Définition des périphériques utilisés dans le programme. 
 * @details Fichier de macros définissant l'utilisation ou non des divers 
 * périphériques du dSPic. 
 */

/////////////////////////// 
// Timers				 //
///////////////////////////

// Utilisation en timer simple
#define HAL_USE_TIMER1 TRUE
#define HAL_USE_TIMER2 FALSE
#define HAL_USE_TIMER3 FALSE
#define HAL_USE_TIMER4 FALSE
#define HAL_USE_TIMER5 FALSE

// Utilisation en timer double 
#define HAL_USETIMER23 TRUE
#define HAL_USETIMER45 FALSE