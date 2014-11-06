/**
 * @file gestionActions.h
 * @author bULBot 2011-2012
 * @author Olivier Desenfans
 * @brief Header pour les actions du robot.  
 */
 
 
#ifndef DEF_GESTIONACTIONS_H
#define DEF_GESTIONACTIONS_H

#include "../CanLib/canProp.h"
#include "../CanLib/canAction.h"
#include "../CanLib/canTraj.h"
#include "dataTypes.h"
#include "globales.h"
#include "macros.h"
#include "timer.h"
 

basicAction demarrageJauneFct(unsigned int etape);
basicAction demarrageRougeFct(unsigned int etape);

 
#endif
