#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/PropBoard2014-DC.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/PropBoard2014-DC.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../CanLib/CanDspic.c ../CanLib/CanInterruptsDspic.c ../Peripherals/pps.c ../Peripherals/pwm.c ../Peripherals/timers.c main.c Configware.c Regulator.c globals.c consigne.c odoLibre.c Motors.c GenerTraj.c mouvements.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/2095425508/CanDspic.o ${OBJECTDIR}/_ext/2095425508/CanInterruptsDspic.o ${OBJECTDIR}/_ext/1094685832/pps.o ${OBJECTDIR}/_ext/1094685832/pwm.o ${OBJECTDIR}/_ext/1094685832/timers.o ${OBJECTDIR}/main.o ${OBJECTDIR}/Configware.o ${OBJECTDIR}/Regulator.o ${OBJECTDIR}/globals.o ${OBJECTDIR}/consigne.o ${OBJECTDIR}/odoLibre.o ${OBJECTDIR}/Motors.o ${OBJECTDIR}/GenerTraj.o ${OBJECTDIR}/mouvements.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/2095425508/CanDspic.o.d ${OBJECTDIR}/_ext/2095425508/CanInterruptsDspic.o.d ${OBJECTDIR}/_ext/1094685832/pps.o.d ${OBJECTDIR}/_ext/1094685832/pwm.o.d ${OBJECTDIR}/_ext/1094685832/timers.o.d ${OBJECTDIR}/main.o.d ${OBJECTDIR}/Configware.o.d ${OBJECTDIR}/Regulator.o.d ${OBJECTDIR}/globals.o.d ${OBJECTDIR}/consigne.o.d ${OBJECTDIR}/odoLibre.o.d ${OBJECTDIR}/Motors.o.d ${OBJECTDIR}/GenerTraj.o.d ${OBJECTDIR}/mouvements.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/2095425508/CanDspic.o ${OBJECTDIR}/_ext/2095425508/CanInterruptsDspic.o ${OBJECTDIR}/_ext/1094685832/pps.o ${OBJECTDIR}/_ext/1094685832/pwm.o ${OBJECTDIR}/_ext/1094685832/timers.o ${OBJECTDIR}/main.o ${OBJECTDIR}/Configware.o ${OBJECTDIR}/Regulator.o ${OBJECTDIR}/globals.o ${OBJECTDIR}/consigne.o ${OBJECTDIR}/odoLibre.o ${OBJECTDIR}/Motors.o ${OBJECTDIR}/GenerTraj.o ${OBJECTDIR}/mouvements.o

# Source Files
SOURCEFILES=../CanLib/CanDspic.c ../CanLib/CanInterruptsDspic.c ../Peripherals/pps.c ../Peripherals/pwm.c ../Peripherals/timers.c main.c Configware.c Regulator.c globals.c consigne.c odoLibre.c Motors.c GenerTraj.c mouvements.c


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
	${MAKE} ${MAKE_OPTIONS} -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/PropBoard2014-DC.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=33FJ128MC804
MP_LINKER_FILE_OPTION=,--script=p33FJ128MC804.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/2095425508/CanDspic.o: ../CanLib/CanDspic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2095425508 
	@${RM} ${OBJECTDIR}/_ext/2095425508/CanDspic.o.d 
	@${RM} ${OBJECTDIR}/_ext/2095425508/CanDspic.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CanLib/CanDspic.c  -o ${OBJECTDIR}/_ext/2095425508/CanDspic.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/2095425508/CanDspic.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -fast-math -save-temps=obj -O0 -I"CanLib" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/2095425508/CanDspic.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/2095425508/CanInterruptsDspic.o: ../CanLib/CanInterruptsDspic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2095425508 
	@${RM} ${OBJECTDIR}/_ext/2095425508/CanInterruptsDspic.o.d 
	@${RM} ${OBJECTDIR}/_ext/2095425508/CanInterruptsDspic.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CanLib/CanInterruptsDspic.c  -o ${OBJECTDIR}/_ext/2095425508/CanInterruptsDspic.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/2095425508/CanInterruptsDspic.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -fast-math -save-temps=obj -O0 -I"CanLib" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/2095425508/CanInterruptsDspic.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1094685832/pps.o: ../Peripherals/pps.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1094685832 
	@${RM} ${OBJECTDIR}/_ext/1094685832/pps.o.d 
	@${RM} ${OBJECTDIR}/_ext/1094685832/pps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Peripherals/pps.c  -o ${OBJECTDIR}/_ext/1094685832/pps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1094685832/pps.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -fast-math -save-temps=obj -O0 -I"CanLib" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1094685832/pps.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1094685832/pwm.o: ../Peripherals/pwm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1094685832 
	@${RM} ${OBJECTDIR}/_ext/1094685832/pwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/1094685832/pwm.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Peripherals/pwm.c  -o ${OBJECTDIR}/_ext/1094685832/pwm.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1094685832/pwm.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -fast-math -save-temps=obj -O0 -I"CanLib" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1094685832/pwm.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1094685832/timers.o: ../Peripherals/timers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1094685832 
	@${RM} ${OBJECTDIR}/_ext/1094685832/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1094685832/timers.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Peripherals/timers.c  -o ${OBJECTDIR}/_ext/1094685832/timers.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1094685832/timers.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -fast-math -save-temps=obj -O0 -I"CanLib" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1094685832/timers.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main.o: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -fast-math -save-temps=obj -O0 -I"CanLib" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/main.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/Configware.o: Configware.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/Configware.o.d 
	@${RM} ${OBJECTDIR}/Configware.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  Configware.c  -o ${OBJECTDIR}/Configware.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/Configware.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -fast-math -save-temps=obj -O0 -I"CanLib" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/Configware.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/Regulator.o: Regulator.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/Regulator.o.d 
	@${RM} ${OBJECTDIR}/Regulator.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  Regulator.c  -o ${OBJECTDIR}/Regulator.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/Regulator.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -fast-math -save-temps=obj -O0 -I"CanLib" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/Regulator.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/globals.o: globals.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/globals.o.d 
	@${RM} ${OBJECTDIR}/globals.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  globals.c  -o ${OBJECTDIR}/globals.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/globals.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -fast-math -save-temps=obj -O0 -I"CanLib" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/globals.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/consigne.o: consigne.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/consigne.o.d 
	@${RM} ${OBJECTDIR}/consigne.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  consigne.c  -o ${OBJECTDIR}/consigne.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/consigne.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -fast-math -save-temps=obj -O0 -I"CanLib" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/consigne.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/odoLibre.o: odoLibre.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/odoLibre.o.d 
	@${RM} ${OBJECTDIR}/odoLibre.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  odoLibre.c  -o ${OBJECTDIR}/odoLibre.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/odoLibre.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -fast-math -save-temps=obj -O0 -I"CanLib" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/odoLibre.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/Motors.o: Motors.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/Motors.o.d 
	@${RM} ${OBJECTDIR}/Motors.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  Motors.c  -o ${OBJECTDIR}/Motors.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/Motors.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -fast-math -save-temps=obj -O0 -I"CanLib" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/Motors.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/GenerTraj.o: GenerTraj.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/GenerTraj.o.d 
	@${RM} ${OBJECTDIR}/GenerTraj.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  GenerTraj.c  -o ${OBJECTDIR}/GenerTraj.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/GenerTraj.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -fast-math -save-temps=obj -O0 -I"CanLib" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/GenerTraj.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mouvements.o: mouvements.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/mouvements.o.d 
	@${RM} ${OBJECTDIR}/mouvements.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mouvements.c  -o ${OBJECTDIR}/mouvements.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mouvements.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -fast-math -save-temps=obj -O0 -I"CanLib" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/mouvements.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
else
${OBJECTDIR}/_ext/2095425508/CanDspic.o: ../CanLib/CanDspic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2095425508 
	@${RM} ${OBJECTDIR}/_ext/2095425508/CanDspic.o.d 
	@${RM} ${OBJECTDIR}/_ext/2095425508/CanDspic.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CanLib/CanDspic.c  -o ${OBJECTDIR}/_ext/2095425508/CanDspic.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/2095425508/CanDspic.o.d"        -g -omf=elf -fast-math -save-temps=obj -O0 -I"CanLib" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/2095425508/CanDspic.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/2095425508/CanInterruptsDspic.o: ../CanLib/CanInterruptsDspic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2095425508 
	@${RM} ${OBJECTDIR}/_ext/2095425508/CanInterruptsDspic.o.d 
	@${RM} ${OBJECTDIR}/_ext/2095425508/CanInterruptsDspic.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CanLib/CanInterruptsDspic.c  -o ${OBJECTDIR}/_ext/2095425508/CanInterruptsDspic.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/2095425508/CanInterruptsDspic.o.d"        -g -omf=elf -fast-math -save-temps=obj -O0 -I"CanLib" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/2095425508/CanInterruptsDspic.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1094685832/pps.o: ../Peripherals/pps.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1094685832 
	@${RM} ${OBJECTDIR}/_ext/1094685832/pps.o.d 
	@${RM} ${OBJECTDIR}/_ext/1094685832/pps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Peripherals/pps.c  -o ${OBJECTDIR}/_ext/1094685832/pps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1094685832/pps.o.d"        -g -omf=elf -fast-math -save-temps=obj -O0 -I"CanLib" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1094685832/pps.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1094685832/pwm.o: ../Peripherals/pwm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1094685832 
	@${RM} ${OBJECTDIR}/_ext/1094685832/pwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/1094685832/pwm.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Peripherals/pwm.c  -o ${OBJECTDIR}/_ext/1094685832/pwm.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1094685832/pwm.o.d"        -g -omf=elf -fast-math -save-temps=obj -O0 -I"CanLib" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1094685832/pwm.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1094685832/timers.o: ../Peripherals/timers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1094685832 
	@${RM} ${OBJECTDIR}/_ext/1094685832/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1094685832/timers.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Peripherals/timers.c  -o ${OBJECTDIR}/_ext/1094685832/timers.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1094685832/timers.o.d"        -g -omf=elf -fast-math -save-temps=obj -O0 -I"CanLib" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1094685832/timers.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main.o: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main.o.d"        -g -omf=elf -fast-math -save-temps=obj -O0 -I"CanLib" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/main.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/Configware.o: Configware.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/Configware.o.d 
	@${RM} ${OBJECTDIR}/Configware.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  Configware.c  -o ${OBJECTDIR}/Configware.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/Configware.o.d"        -g -omf=elf -fast-math -save-temps=obj -O0 -I"CanLib" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/Configware.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/Regulator.o: Regulator.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/Regulator.o.d 
	@${RM} ${OBJECTDIR}/Regulator.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  Regulator.c  -o ${OBJECTDIR}/Regulator.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/Regulator.o.d"        -g -omf=elf -fast-math -save-temps=obj -O0 -I"CanLib" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/Regulator.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/globals.o: globals.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/globals.o.d 
	@${RM} ${OBJECTDIR}/globals.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  globals.c  -o ${OBJECTDIR}/globals.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/globals.o.d"        -g -omf=elf -fast-math -save-temps=obj -O0 -I"CanLib" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/globals.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/consigne.o: consigne.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/consigne.o.d 
	@${RM} ${OBJECTDIR}/consigne.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  consigne.c  -o ${OBJECTDIR}/consigne.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/consigne.o.d"        -g -omf=elf -fast-math -save-temps=obj -O0 -I"CanLib" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/consigne.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/odoLibre.o: odoLibre.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/odoLibre.o.d 
	@${RM} ${OBJECTDIR}/odoLibre.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  odoLibre.c  -o ${OBJECTDIR}/odoLibre.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/odoLibre.o.d"        -g -omf=elf -fast-math -save-temps=obj -O0 -I"CanLib" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/odoLibre.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/Motors.o: Motors.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/Motors.o.d 
	@${RM} ${OBJECTDIR}/Motors.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  Motors.c  -o ${OBJECTDIR}/Motors.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/Motors.o.d"        -g -omf=elf -fast-math -save-temps=obj -O0 -I"CanLib" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/Motors.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/GenerTraj.o: GenerTraj.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/GenerTraj.o.d 
	@${RM} ${OBJECTDIR}/GenerTraj.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  GenerTraj.c  -o ${OBJECTDIR}/GenerTraj.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/GenerTraj.o.d"        -g -omf=elf -fast-math -save-temps=obj -O0 -I"CanLib" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/GenerTraj.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mouvements.o: mouvements.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/mouvements.o.d 
	@${RM} ${OBJECTDIR}/mouvements.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mouvements.c  -o ${OBJECTDIR}/mouvements.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mouvements.o.d"        -g -omf=elf -fast-math -save-temps=obj -O0 -I"CanLib" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/mouvements.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/PropBoard2014-DC.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/PropBoard2014-DC.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -fast-math -save-temps=obj -Wl,,--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem$(MP_EXTRA_LD_POST) 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/PropBoard2014-DC.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/PropBoard2014-DC.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -fast-math -save-temps=obj -Wl,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem$(MP_EXTRA_LD_POST) 
	${MP_CC_DIR}\\xc16-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/PropBoard2014-DC.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf 
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
