/**
 * @file halConfig.h
 * @author bULBot 2011-2012
 * @author Olivier Desenfans
 * @brief D�finition des p�riph�riques utilis�s dans le programme. 
 * @details Fichier de macros d�finissant l'utilisation ou non des divers 
 * p�riph�riques du dSPic. 
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