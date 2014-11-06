/** 
 * @file macros.h
 * @author bULBot 2011-2012
 * @author Olivier Desenfans
 * @brief Fichier header de macros pour la carte maître du robot. 
 */
 
#ifndef DEF_MACROS_H
#define DEF_MACROS_H
 
 
//! Etat booléen vrai. 
#define TRUE 1
//! Etat booléen faux. 
#define FALSE 0
//! Début d'une fonction d'action
#define BEGIN 0x00
//! Fin d'une fonction d'action
#define END 0xFF
//! Choix pour le demi-totem gauche, par le bas de la carte.
#define DEMI_TOTEM_GL 0
//! Choix pour le demi-totem gauche, par le haut de la carte.
#define DEMI_TOTEM_GH 1
//! Choix pour le demi-totem droit, par le bas de la carte.
#define DEMI_TOTEM_RL 2
//! Choix pour le demi-totem droit, par le haut de la carte.
#define DEMI_TOTEM_RH 3
//! Durée du match en secondes. 
#define MATCH_DURATION 90
//! Nombre de pièces.
#define NBRE_PIECES 38 
//! Nombre d'actions que le robot peut effectuer. 
#define NBRE_ACTIONS 4
//! Cout maximum pour une action
#define COUT_MAX 0xFFFF

#endif

