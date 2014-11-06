/**
 * @file alim.h
 * @author bULBot 2011-2012
 * @author Olivier Desenfans
 * @brief Headers de gestion de l'alimentation.
 */
 
#ifndef DEF_ALIM_H
#define DEF_ALIM_H

#include "CanAlim.h"
#include "CanDspic.h"
#include "CanNetwork.h"
#include "dataTypes.h"
#include "globales.h"
#include "timer.h"

void initialisationCanAlim(void); 
void set12V(bool on); 
void set24V(bool on); 

#endif
