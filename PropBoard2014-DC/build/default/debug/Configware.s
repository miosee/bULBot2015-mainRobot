	.file "D:\\Robotique\\codes\\mainRobot\\PropBoard2014-DC\\Configware.c"
	.section	.debug_abbrev,info
.Ldebug_abbrev0:
	.section	.debug_info,info
.Ldebug_info0:
	.section	.debug_line,info
.Ldebug_line0:
	.section	.text,code
.Ltext0:
	.global	__FICD	; export
	.section	__FICD.sec,code
	.align	2
	.type	__FICD,@object
__FICD:
	.word	-33
	.global	__FWDT	; export
	.section	__FWDT.sec,code
	.align	2
	.type	__FWDT,@object
__FWDT:
	.word	-129
	.global	__FGS	; export
	.section	__FGS.sec,code
	.align	2
	.type	__FGS,@object
__FGS:
	.word	-1
	.global	__FOSCSEL	; export
	.section	__FOSCSEL.sec,code
	.align	2
	.type	__FOSCSEL,@object
__FOSCSEL:
	.word	-8
	.global	__FOSC	; export
	.section	__FOSC.sec,code
	.align	2
	.type	__FOSC,@object
__FOSC:
	.word	-131
	.section	.text,code
	.align	2
	.global	_pllConfig	; export
	.type	_pllConfig,@function
_pllConfig:
.LFB0:
.LSM0:
	.set ___PA___,1
	lnk	#0
.LSM1:
	mov	#30,w4
	mov	w4,_PLLFBD
.LSM2:
	mov	_CLKDIVbits,w4
	bclr	w4,#6
	bclr	w4,#7
	mov	w4,_CLKDIVbits
.LSM3:
	mov	_CLKDIVbits,w5
	mov	#-32,w4
	and	w5,w4,w4
	mov	w4,_CLKDIVbits
.LSM4:
	mov	#3,w6
	mov	#120,w4
	mov	#154,w5
	mov	#_OSCCON+1,w7
	mov.b	w4,[w7]
	mov.b	w5,[w7]
	mov.b	w6,[w7]
.LSM5:
	mov	#1,w6
	mov	#70,w4
	mov	#87,w5
	mov	#_OSCCON,w7
	mov.b	w4,[w7]
	mov.b	w5,[w7]
	mov.b	w6,[w7]
.LSM6:
	nop	
.L2:
	mov	_OSCCONbits,w5
	mov	#28672,w4
	and	w5,w4,w5
	mov	#12288,w4
	sub	w5,w4,[w15]
	.set ___BP___,0
	bra	nz,.L2
.LSM7:
	ulnk	
	return	
	.set ___PA___,0
.LFE0:
	.align	2
	.global	_canPinAssign	; export
	.type	_canPinAssign,@function
_canPinAssign:
.LFB1:
.LSM8:
	.set ___PA___,1
	lnk	#0
.LSM9:
	mov	#10,w1
	mov	#11,w0
	rcall	_ppsInConfig
.LSM10:
	mov	#11,w1
	mov	#16,w0
	rcall	_ppsOutConfig
.LSM11:
	ulnk	
	return	
	.set ___PA___,0
.LFE1:
	.section	.debug_frame,info
.Lframe0:
	.4byte	.LECIE0-.LSCIE0
.LSCIE0:
	.4byte	0xffffffff
	.byte	0x1
	.byte	0
	.uleb128 0x1
	.sleb128 2
	.byte	0x25
	.byte	0x12
	.uleb128 0xf
	.sleb128 -2
	.byte	0x9
	.uleb128 0x25
	.uleb128 0xf
	.align	4
.LECIE0:
.LSFDE0:
	.4byte	.LEFDE0-.LASFDE0
.LASFDE0:
	.4byte	.Lframe0
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.align	4
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.align	4
.LEFDE2:
	.section	.text,code
.Letext0:
	.section	.debug_info,info
	.4byte	0x6dc
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.asciz	"GNU C 4.5.1 (XC16, Microchip v1_21) (A) Build date: Jan  2 2014"
	.byte	0x1
	.asciz	"Configware.c"
	.asciz	"D:\\\\Robotique\\\\codes\\\\mainRobot\\\\PropBoard2014-DC"
	.4byte	.Ltext0
	.4byte	.Letext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x2
	.byte	0x2
	.byte	0x1a
	.4byte	0x1a9
	.uleb128 0x3
	.asciz	"PPS_C1OUT"
	.sleb128 1
	.uleb128 0x3
	.asciz	"PPS_C2OUT"
	.sleb128 2
	.uleb128 0x3
	.asciz	"PPS_U1TX"
	.sleb128 3
	.uleb128 0x3
	.asciz	"PPS_U1RTS"
	.sleb128 4
	.uleb128 0x3
	.asciz	"PPS_U2TX"
	.sleb128 5
	.uleb128 0x3
	.asciz	"PPS_U2RTS"
	.sleb128 6
	.uleb128 0x3
	.asciz	"PPS_SDO1"
	.sleb128 7
	.uleb128 0x3
	.asciz	"PPS_OUT_SCK1"
	.sleb128 8
	.uleb128 0x3
	.asciz	"PPS_OUT_SS1"
	.sleb128 9
	.uleb128 0x3
	.asciz	"PPS_SDO2"
	.sleb128 10
	.uleb128 0x3
	.asciz	"PPS_OUT_SCK2"
	.sleb128 11
	.uleb128 0x3
	.asciz	"PPS_OUT_SS2"
	.sleb128 12
	.uleb128 0x3
	.asciz	"PPS_CSDO"
	.sleb128 13
	.uleb128 0x3
	.asciz	"PPS_CSCKOUT"
	.sleb128 14
	.uleb128 0x3
	.asciz	"PPS_COFSOUT"
	.sleb128 15
	.uleb128 0x3
	.asciz	"PPS_C1TX"
	.sleb128 16
	.uleb128 0x3
	.asciz	"PPS_OC1"
	.sleb128 18
	.uleb128 0x3
	.asciz	"PPS_OC2"
	.sleb128 19
	.uleb128 0x3
	.asciz	"PPS_OC3"
	.sleb128 20
	.uleb128 0x3
	.asciz	"PPS_OC4"
	.sleb128 21
	.uleb128 0x3
	.asciz	"PPS_UPDN1"
	.sleb128 26
	.uleb128 0x3
	.asciz	"PPS_UPDN2"
	.sleb128 27
	.byte	0x0
	.uleb128 0x2
	.byte	0x2
	.byte	0x2
	.byte	0x41
	.4byte	0x266
	.uleb128 0x3
	.asciz	"PPS_U1RX"
	.sleb128 1
	.uleb128 0x3
	.asciz	"PPS_U1CTS"
	.sleb128 2
	.uleb128 0x3
	.asciz	"PPS_U2RX"
	.sleb128 3
	.uleb128 0x3
	.asciz	"PPS_U2CTS"
	.sleb128 4
	.uleb128 0x3
	.asciz	"PPS_SDI1"
	.sleb128 5
	.uleb128 0x3
	.asciz	"PPS_IN_SCK1"
	.sleb128 6
	.uleb128 0x3
	.asciz	"PPS_IN_SS1"
	.sleb128 7
	.uleb128 0x3
	.asciz	"PPS_SDI2"
	.sleb128 8
	.uleb128 0x3
	.asciz	"PPS_IN_SCK2"
	.sleb128 9
	.uleb128 0x3
	.asciz	"PPS_IN_SS2"
	.sleb128 10
	.uleb128 0x3
	.asciz	"PPS_IN_C1RX"
	.sleb128 11
	.uleb128 0x3
	.asciz	"PPS_QEA1"
	.sleb128 12
	.uleb128 0x3
	.asciz	"PPS_QEB1"
	.sleb128 13
	.uleb128 0x3
	.asciz	"PPS_QEA2"
	.sleb128 14
	.uleb128 0x3
	.asciz	"PPS_QEB2"
	.sleb128 15
	.byte	0x0
	.uleb128 0x4
	.byte	0x2
	.byte	0x7
	.asciz	"unsigned int"
	.uleb128 0x5
	.byte	0x2
	.byte	0x3
	.2byte	0x1955
	.4byte	0x31f
	.uleb128 0x6
	.asciz	"OSWEN"
	.byte	0x3
	.2byte	0x1956
	.4byte	0x266
	.byte	0x2
	.byte	0x1
	.byte	0xf
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"LPOSCEN"
	.byte	0x3
	.2byte	0x1957
	.4byte	0x266
	.byte	0x2
	.byte	0x1
	.byte	0xe
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"CF"
	.byte	0x3
	.2byte	0x1959
	.4byte	0x266
	.byte	0x2
	.byte	0x1
	.byte	0xc
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"LOCK"
	.byte	0x3
	.2byte	0x195b
	.4byte	0x266
	.byte	0x2
	.byte	0x1
	.byte	0xa
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"IOLOCK"
	.byte	0x3
	.2byte	0x195c
	.4byte	0x266
	.byte	0x2
	.byte	0x1
	.byte	0x9
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"CLKLOCK"
	.byte	0x3
	.2byte	0x195d
	.4byte	0x266
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"NOSC"
	.byte	0x3
	.2byte	0x195e
	.4byte	0x266
	.byte	0x2
	.byte	0x3
	.byte	0x5
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"COSC"
	.byte	0x3
	.2byte	0x1960
	.4byte	0x266
	.byte	0x2
	.byte	0x3
	.byte	0x1
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.byte	0x3
	.2byte	0x1962
	.4byte	0x3a1
	.uleb128 0x6
	.asciz	"NOSC0"
	.byte	0x3
	.2byte	0x1964
	.4byte	0x266
	.byte	0x2
	.byte	0x1
	.byte	0x7
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"NOSC1"
	.byte	0x3
	.2byte	0x1965
	.4byte	0x266
	.byte	0x2
	.byte	0x1
	.byte	0x6
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"NOSC2"
	.byte	0x3
	.2byte	0x1966
	.4byte	0x266
	.byte	0x2
	.byte	0x1
	.byte	0x5
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"COSC0"
	.byte	0x3
	.2byte	0x1968
	.4byte	0x266
	.byte	0x2
	.byte	0x1
	.byte	0x3
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"COSC1"
	.byte	0x3
	.2byte	0x1969
	.4byte	0x266
	.byte	0x2
	.byte	0x1
	.byte	0x2
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"COSC2"
	.byte	0x3
	.2byte	0x196a
	.4byte	0x266
	.byte	0x2
	.byte	0x1
	.byte	0x1
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x7
	.byte	0x2
	.byte	0x3
	.2byte	0x1954
	.4byte	0x3b5
	.uleb128 0x8
	.4byte	0x276
	.uleb128 0x8
	.4byte	0x31f
	.byte	0x0
	.uleb128 0x9
	.asciz	"tagOSCCONBITS"
	.byte	0x2
	.byte	0x3
	.2byte	0x1953
	.4byte	0x3d5
	.uleb128 0xa
	.4byte	0x3a1
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0xb
	.asciz	"OSCCONBITS"
	.byte	0x3
	.2byte	0x196d
	.4byte	0x3b5
	.uleb128 0x5
	.byte	0x2
	.byte	0x3
	.2byte	0x1978
	.4byte	0x46b
	.uleb128 0x6
	.asciz	"PLLPRE"
	.byte	0x3
	.2byte	0x1979
	.4byte	0x266
	.byte	0x2
	.byte	0x5
	.byte	0xb
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"PLLPOST"
	.byte	0x3
	.2byte	0x197b
	.4byte	0x266
	.byte	0x2
	.byte	0x2
	.byte	0x8
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"FRCDIV"
	.byte	0x3
	.2byte	0x197c
	.4byte	0x266
	.byte	0x2
	.byte	0x3
	.byte	0x5
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"DOZEN"
	.byte	0x3
	.2byte	0x197d
	.4byte	0x266
	.byte	0x2
	.byte	0x1
	.byte	0x4
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"DOZE"
	.byte	0x3
	.2byte	0x197e
	.4byte	0x266
	.byte	0x2
	.byte	0x3
	.byte	0x1
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"ROI"
	.byte	0x3
	.2byte	0x197f
	.4byte	0x266
	.byte	0x2
	.byte	0x1
	.byte	0x10
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.byte	0x3
	.2byte	0x1981
	.4byte	0x58f
	.uleb128 0x6
	.asciz	"PLLPRE0"
	.byte	0x3
	.2byte	0x1982
	.4byte	0x266
	.byte	0x2
	.byte	0x1
	.byte	0xf
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"PLLPRE1"
	.byte	0x3
	.2byte	0x1983
	.4byte	0x266
	.byte	0x2
	.byte	0x1
	.byte	0xe
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"PLLPRE2"
	.byte	0x3
	.2byte	0x1984
	.4byte	0x266
	.byte	0x2
	.byte	0x1
	.byte	0xd
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"PLLPRE3"
	.byte	0x3
	.2byte	0x1985
	.4byte	0x266
	.byte	0x2
	.byte	0x1
	.byte	0xc
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"PLLPRE4"
	.byte	0x3
	.2byte	0x1986
	.4byte	0x266
	.byte	0x2
	.byte	0x1
	.byte	0xb
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"PLLPOST0"
	.byte	0x3
	.2byte	0x1988
	.4byte	0x266
	.byte	0x2
	.byte	0x1
	.byte	0x9
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"PLLPOST1"
	.byte	0x3
	.2byte	0x1989
	.4byte	0x266
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"FRCDIV0"
	.byte	0x3
	.2byte	0x198a
	.4byte	0x266
	.byte	0x2
	.byte	0x1
	.byte	0x7
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"FRCDIV1"
	.byte	0x3
	.2byte	0x198b
	.4byte	0x266
	.byte	0x2
	.byte	0x1
	.byte	0x6
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"FRCDIV2"
	.byte	0x3
	.2byte	0x198c
	.4byte	0x266
	.byte	0x2
	.byte	0x1
	.byte	0x5
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"DOZE0"
	.byte	0x3
	.2byte	0x198e
	.4byte	0x266
	.byte	0x2
	.byte	0x1
	.byte	0x3
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"DOZE1"
	.byte	0x3
	.2byte	0x198f
	.4byte	0x266
	.byte	0x2
	.byte	0x1
	.byte	0x2
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"DOZE2"
	.byte	0x3
	.2byte	0x1990
	.4byte	0x266
	.byte	0x2
	.byte	0x1
	.byte	0x1
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x7
	.byte	0x2
	.byte	0x3
	.2byte	0x1977
	.4byte	0x5a3
	.uleb128 0x8
	.4byte	0x3e8
	.uleb128 0x8
	.4byte	0x46b
	.byte	0x0
	.uleb128 0x9
	.asciz	"tagCLKDIVBITS"
	.byte	0x2
	.byte	0x3
	.2byte	0x1976
	.4byte	0x5c3
	.uleb128 0xa
	.4byte	0x58f
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0xb
	.asciz	"CLKDIVBITS"
	.byte	0x3
	.2byte	0x1993
	.4byte	0x5a3
	.uleb128 0xc
	.byte	0x1
	.asciz	"pllConfig"
	.byte	0x1
	.byte	0x27
	.byte	0x1
	.4byte	.LFB0
	.4byte	.LFE0
	.byte	0x1
	.byte	0x5e
	.uleb128 0xc
	.byte	0x1
	.asciz	"canPinAssign"
	.byte	0x1
	.byte	0x36
	.byte	0x1
	.4byte	.LFB1
	.4byte	.LFE1
	.byte	0x1
	.byte	0x5e
	.uleb128 0xd
	.4byte	.LASF0
	.byte	0x3
	.2byte	0x196e
	.4byte	0x619
	.byte	0x1
	.byte	0x1
	.uleb128 0xe
	.4byte	0x3d5
	.uleb128 0xd
	.4byte	.LASF1
	.byte	0x3
	.2byte	0x1994
	.4byte	0x62c
	.byte	0x1
	.byte	0x1
	.uleb128 0xe
	.4byte	0x5c3
	.uleb128 0xf
	.asciz	"PLLFBD"
	.byte	0x3
	.2byte	0x1997
	.4byte	0x642
	.byte	0x1
	.byte	0x1
	.uleb128 0xe
	.4byte	0x266
	.uleb128 0xd
	.4byte	.LASF0
	.byte	0x3
	.2byte	0x196e
	.4byte	0x619
	.byte	0x1
	.byte	0x1
	.uleb128 0xd
	.4byte	.LASF1
	.byte	0x3
	.2byte	0x1994
	.4byte	0x62c
	.byte	0x1
	.byte	0x1
	.uleb128 0xf
	.asciz	"PLLFBD"
	.byte	0x3
	.2byte	0x1997
	.4byte	0x642
	.byte	0x1
	.byte	0x1
	.uleb128 0x10
	.asciz	"_FGS"
	.byte	0x3
	.2byte	0x5ae6
	.4byte	0x266
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	__FGS
	.uleb128 0x10
	.asciz	"_FOSCSEL"
	.byte	0x3
	.2byte	0x5b0a
	.4byte	0x266
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	__FOSCSEL
	.uleb128 0x10
	.asciz	"_FOSC"
	.byte	0x3
	.2byte	0x5b34
	.4byte	0x266
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	__FOSC
	.uleb128 0x10
	.asciz	"_FWDT"
	.byte	0x3
	.2byte	0x5b66
	.4byte	0x266
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	__FWDT
	.uleb128 0x10
	.asciz	"_FICD"
	.byte	0x3
	.2byte	0x5bed
	.4byte	0x266
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	__FICD
	.byte	0x0
	.section	.debug_abbrev,info
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0x8
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1b
	.uleb128 0x8
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x2
	.uleb128 0x4
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x28
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0x0
	.byte	0x0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0x0
	.byte	0x0
	.uleb128 0x5
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x6
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xd
	.uleb128 0xb
	.uleb128 0xc
	.uleb128 0xb
	.uleb128 0x38
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x7
	.uleb128 0x17
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x8
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x9
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xa
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0xb
	.uleb128 0x16
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xc
	.uleb128 0x2e
	.byte	0x0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0xd
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.uleb128 0xe
	.uleb128 0x35
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xf
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.uleb128 0x10
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.section	.debug_pubnames,info
	.4byte	0x61
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x6e0
	.4byte	0x5d6
	.asciz	"pllConfig"
	.4byte	0x5ef
	.asciz	"canPinAssign"
	.4byte	0x674
	.asciz	"_FGS"
	.4byte	0x688
	.asciz	"_FOSCSEL"
	.4byte	0x6a0
	.asciz	"_FOSC"
	.4byte	0x6b5
	.asciz	"_FWDT"
	.4byte	0x6ca
	.asciz	"_FICD"
	.4byte	0x0
	.section	.debug_pubtypes,info
	.4byte	0x50
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x6e0
	.4byte	0x3b5
	.asciz	"tagOSCCONBITS"
	.4byte	0x3d5
	.asciz	"OSCCONBITS"
	.4byte	0x5a3
	.asciz	"tagCLKDIVBITS"
	.4byte	0x5c3
	.asciz	"CLKDIVBITS"
	.4byte	0x0
	.section	.debug_aranges,info
	.4byte	0x14
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0x0
	.2byte	0x0
	.2byte	0x0
	.4byte	0x0
	.4byte	0x0
	.section	.debug_line,info
	.4byte	.LELT0-.LSLT0
.LSLT0:
	.2byte	0x2
	.4byte	.LELTP0-.LASLTP0
.LASLTP0:
	.byte	0x1
	.byte	0x1
	.byte	0xf6
	.byte	0xf5
	.byte	0xa
	.byte	0x0
	.byte	0x1
	.byte	0x1
	.byte	0x1
	.byte	0x1
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x1
	.ascii	"../Peripherals"
	.byte 0
	.ascii	"c:\\program files (x86)\\microchip\\xc16\\v1.21\\bin\\bin\\../..\\su"
	.ascii	"pport\\dsPIC33F\\h"
	.byte 0
	.byte	0x0
	.asciz	"Configware.c"
	.uleb128 0x0
	.uleb128 0x0
	.uleb128 0x0
	.asciz	"pps.h"
	.uleb128 0x1
	.uleb128 0x0
	.uleb128 0x0
	.asciz	"p33FJ128MC804.h"
	.uleb128 0x2
	.uleb128 0x0
	.uleb128 0x0
	.byte	0x0
.LELTP0:
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.Letext0
	.byte	0x0
	.uleb128 0x1
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM0
	.byte	0x3a
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM1
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM2
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM3
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM4
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM5
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM6
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM7
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LFE0
	.byte	0x0
	.uleb128 0x1
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM8
	.byte	0x49
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM9
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM10
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM11
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LFE1
	.byte	0x0
	.uleb128 0x1
	.byte	0x1
.LELT0:
	.section	.debug_str,info
.LASF0:
	.asciz	"OSCCONbits"
.LASF1:
	.asciz	"CLKDIVbits"
	.section	.text,code

	.section __c30_signature, info, data
	.word 0x0001
	.word 0x0000
	.word 0x0000

; MCHP configuration words

	.set ___PA___,0
	.end