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
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/LogicMainRobot.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/LogicMainRobot.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../Canlib/CanAction.c ../Canlib/CanDspic.c ../Canlib/CanInterruptsDspic.c ../Canlib/CanTraj.c ../Canlib/canProp.c main.c timer.c spio.c gestionActions.c Configware.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/2095456260/CanAction.o ${OBJECTDIR}/_ext/2095456260/CanDspic.o ${OBJECTDIR}/_ext/2095456260/CanInterruptsDspic.o ${OBJECTDIR}/_ext/2095456260/CanTraj.o ${OBJECTDIR}/_ext/2095456260/canProp.o ${OBJECTDIR}/main.o ${OBJECTDIR}/timer.o ${OBJECTDIR}/spio.o ${OBJECTDIR}/gestionActions.o ${OBJECTDIR}/Configware.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/2095456260/CanAction.o.d ${OBJECTDIR}/_ext/2095456260/CanDspic.o.d ${OBJECTDIR}/_ext/2095456260/CanInterruptsDspic.o.d ${OBJECTDIR}/_ext/2095456260/CanTraj.o.d ${OBJECTDIR}/_ext/2095456260/canProp.o.d ${OBJECTDIR}/main.o.d ${OBJECTDIR}/timer.o.d ${OBJECTDIR}/spio.o.d ${OBJECTDIR}/gestionActions.o.d ${OBJECTDIR}/Configware.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/2095456260/CanAction.o ${OBJECTDIR}/_ext/2095456260/CanDspic.o ${OBJECTDIR}/_ext/2095456260/CanInterruptsDspic.o ${OBJECTDIR}/_ext/2095456260/CanTraj.o ${OBJECTDIR}/_ext/2095456260/canProp.o ${OBJECTDIR}/main.o ${OBJECTDIR}/timer.o ${OBJECTDIR}/spio.o ${OBJECTDIR}/gestionActions.o ${OBJECTDIR}/Configware.o

# Source Files
SOURCEFILES=../Canlib/CanAction.c ../Canlib/CanDspic.c ../Canlib/CanInterruptsDspic.c ../Canlib/CanTraj.c ../Canlib/canProp.c main.c timer.c spio.c gestionActions.c Configware.c


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
	${MAKE} ${MAKE_OPTIONS} -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/LogicMainRobot.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=33FJ128MC804
MP_LINKER_FILE_OPTION=,--script=p33FJ128MC804.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/2095456260/CanAction.o: ../Canlib/CanAction.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2095456260 
	@${RM} ${OBJECTDIR}/_ext/2095456260/CanAction.o.d 
	@${RM} ${OBJECTDIR}/_ext/2095456260/CanAction.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Canlib/CanAction.c  -o ${OBJECTDIR}/_ext/2095456260/CanAction.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/2095456260/CanAction.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -O0 -I"../CanLib" -I"." -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/2095456260/CanAction.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/2095456260/CanDspic.o: ../Canlib/CanDspic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2095456260 
	@${RM} ${OBJECTDIR}/_ext/2095456260/CanDspic.o.d 
	@${RM} ${OBJECTDIR}/_ext/2095456260/CanDspic.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Canlib/CanDspic.c  -o ${OBJECTDIR}/_ext/2095456260/CanDspic.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/2095456260/CanDspic.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -O0 -I"../CanLib" -I"." -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/2095456260/CanDspic.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/2095456260/CanInterruptsDspic.o: ../Canlib/CanInterruptsDspic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2095456260 
	@${RM} ${OBJECTDIR}/_ext/2095456260/CanInterruptsDspic.o.d 
	@${RM} ${OBJECTDIR}/_ext/2095456260/CanInterruptsDspic.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Canlib/CanInterruptsDspic.c  -o ${OBJECTDIR}/_ext/2095456260/CanInterruptsDspic.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/2095456260/CanInterruptsDspic.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -O0 -I"../CanLib" -I"." -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/2095456260/CanInterruptsDspic.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/2095456260/CanTraj.o: ../Canlib/CanTraj.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2095456260 
	@${RM} ${OBJECTDIR}/_ext/2095456260/CanTraj.o.d 
	@${RM} ${OBJECTDIR}/_ext/2095456260/CanTraj.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Canlib/CanTraj.c  -o ${OBJECTDIR}/_ext/2095456260/CanTraj.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/2095456260/CanTraj.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -O0 -I"../CanLib" -I"." -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/2095456260/CanTraj.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/2095456260/canProp.o: ../Canlib/canProp.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2095456260 
	@${RM} ${OBJECTDIR}/_ext/2095456260/canProp.o.d 
	@${RM} ${OBJECTDIR}/_ext/2095456260/canProp.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Canlib/canProp.c  -o ${OBJECTDIR}/_ext/2095456260/canProp.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/2095456260/canProp.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -O0 -I"../CanLib" -I"." -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/2095456260/canProp.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main.o: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -O0 -I"../CanLib" -I"." -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/main.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/timer.o: timer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/timer.o.d 
	@${RM} ${OBJECTDIR}/timer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  timer.c  -o ${OBJECTDIR}/timer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/timer.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -O0 -I"../CanLib" -I"." -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/timer.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/spio.o: spio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/spio.o.d 
	@${RM} ${OBJECTDIR}/spio.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  spio.c  -o ${OBJECTDIR}/spio.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/spio.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -O0 -I"../CanLib" -I"." -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/spio.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/gestionActions.o: gestionActions.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/gestionActions.o.d 
	@${RM} ${OBJECTDIR}/gestionActions.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  gestionActions.c  -o ${OBJECTDIR}/gestionActions.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/gestionActions.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -O0 -I"../CanLib" -I"." -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/gestionActions.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/Configware.o: Configware.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/Configware.o.d 
	@${RM} ${OBJECTDIR}/Configware.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  Configware.c  -o ${OBJECTDIR}/Configware.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/Configware.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -O0 -I"../CanLib" -I"." -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/Configware.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
else
${OBJECTDIR}/_ext/2095456260/CanAction.o: ../Canlib/CanAction.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2095456260 
	@${RM} ${OBJECTDIR}/_ext/2095456260/CanAction.o.d 
	@${RM} ${OBJECTDIR}/_ext/2095456260/CanAction.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Canlib/CanAction.c  -o ${OBJECTDIR}/_ext/2095456260/CanAction.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/2095456260/CanAction.o.d"        -g -omf=elf -O0 -I"../CanLib" -I"." -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/2095456260/CanAction.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/2095456260/CanDspic.o: ../Canlib/CanDspic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2095456260 
	@${RM} ${OBJECTDIR}/_ext/2095456260/CanDspic.o.d 
	@${RM} ${OBJECTDIR}/_ext/2095456260/CanDspic.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Canlib/CanDspic.c  -o ${OBJECTDIR}/_ext/2095456260/CanDspic.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/2095456260/CanDspic.o.d"        -g -omf=elf -O0 -I"../CanLib" -I"." -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/2095456260/CanDspic.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/2095456260/CanInterruptsDspic.o: ../Canlib/CanInterruptsDspic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2095456260 
	@${RM} ${OBJECTDIR}/_ext/2095456260/CanInterruptsDspic.o.d 
	@${RM} ${OBJECTDIR}/_ext/2095456260/CanInterruptsDspic.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Canlib/CanInterruptsDspic.c  -o ${OBJECTDIR}/_ext/2095456260/CanInterruptsDspic.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/2095456260/CanInterruptsDspic.o.d"        -g -omf=elf -O0 -I"../CanLib" -I"." -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/2095456260/CanInterruptsDspic.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/2095456260/CanTraj.o: ../Canlib/CanTraj.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2095456260 
	@${RM} ${OBJECTDIR}/_ext/2095456260/CanTraj.o.d 
	@${RM} ${OBJECTDIR}/_ext/2095456260/CanTraj.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Canlib/CanTraj.c  -o ${OBJECTDIR}/_ext/2095456260/CanTraj.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/2095456260/CanTraj.o.d"        -g -omf=elf -O0 -I"../CanLib" -I"." -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/2095456260/CanTraj.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/2095456260/canProp.o: ../Canlib/canProp.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2095456260 
	@${RM} ${OBJECTDIR}/_ext/2095456260/canProp.o.d 
	@${RM} ${OBJECTDIR}/_ext/2095456260/canProp.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Canlib/canProp.c  -o ${OBJECTDIR}/_ext/2095456260/canProp.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/2095456260/canProp.o.d"        -g -omf=elf -O0 -I"../CanLib" -I"." -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/2095456260/canProp.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main.o: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main.o.d"        -g -omf=elf -O0 -I"../CanLib" -I"." -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/main.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/timer.o: timer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/timer.o.d 
	@${RM} ${OBJECTDIR}/timer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  timer.c  -o ${OBJECTDIR}/timer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/timer.o.d"        -g -omf=elf -O0 -I"../CanLib" -I"." -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/timer.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/spio.o: spio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/spio.o.d 
	@${RM} ${OBJECTDIR}/spio.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  spio.c  -o ${OBJECTDIR}/spio.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/spio.o.d"        -g -omf=elf -O0 -I"../CanLib" -I"." -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/spio.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/gestionActions.o: gestionActions.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/gestionActions.o.d 
	@${RM} ${OBJECTDIR}/gestionActions.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  gestionActions.c  -o ${OBJECTDIR}/gestionActions.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/gestionActions.o.d"        -g -omf=elf -O0 -I"../CanLib" -I"." -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/gestionActions.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/Configware.o: Configware.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/Configware.o.d 
	@${RM} ${OBJECTDIR}/Configware.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  Configware.c  -o ${OBJECTDIR}/Configware.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/Configware.o.d"        -g -omf=elf -O0 -I"../CanLib" -I"." -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/Configware.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
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
dist/${CND_CONF}/${IMAGE_TYPE}/LogicMainRobot.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/LogicMainRobot.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -Wl,,--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--library-path=".",--no-force-link,--smart-io,-Map="${DISTDIR}/bulbotpiclogique2011.${IMAGE_TYPE}.map",--report-mem$(MP_EXTRA_LD_POST) 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/LogicMainRobot.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/LogicMainRobot.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -Wl,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--library-path=".",--no-force-link,--smart-io,-Map="${DISTDIR}/bulbotpiclogique2011.${IMAGE_TYPE}.map",--report-mem$(MP_EXTRA_LD_POST) 
	${MP_CC_DIR}\\xc16-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/LogicMainRobot.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf 
	
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
