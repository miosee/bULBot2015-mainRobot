	.file "D:\\dev\\GitHub\\bULBot2015-mainRobot\\PropBoard2014-DC\\..\\Peripherals\\pwm.c"
	.section	.debug_abbrev,info
.Ldebug_abbrev0:
	.section	.debug_info,info
.Ldebug_info0:
	.section	.debug_line,info
.Ldebug_line0:
	.section	.text,code
.Ltext0:
	.global	_OCxCON	; export
	.section	.const,psv,page
	.align	2
	.type	_OCxCON,@object
_OCxCON:
	.word	_OC1CON
	.word	_OC2CON
	.word	_OC3CON
	.word	_OC4CON
	.global	_OCxRS	; export
	.align	2
	.type	_OCxRS,@object
_OCxRS:
	.word	_OC1RS
	.word	_OC2RS
	.word	_OC3RS
	.word	_OC4RS
	.section	.text,code
	.align	2
	.global	_pwmSetup	; export
	.type	_pwmSetup,@function
_pwmSetup:
.LFB0:
.LSM0:
	.set ___PA___,1
	lnk	#10
	mov	w0,[w14+2]
	mov	w1,[w14+4]
	mov	w2,[w14+6]
	mov	w3,[w14+8]
.LSM1:
	mov	[w14+2],w4
	sub	w4,#1,[w15]
	.set ___BP___,0
	bra	z,.L2
	mov	[w14+2],w4
	sub	w4,#2,[w15]
	.set ___BP___,0
	bra	z,.L2
	mov	[w14+2],w4
	sub	w4,#3,[w15]
	.set ___BP___,0
	bra	z,.L2
	mov	[w14+2],w4
	sub	w4,#4,[w15]
	.set ___BP___,0
	bra	z,.L2
.LSM2:
	mov	#3,w4
	bra	.L3
.L2:
.LSM3:
	mov	[w14+4],w4
	sub	w4,#2,[w15]
	.set ___BP___,0
	bra	z,.L4
	mov	[w14+4],w4
	sub	w4,#3,[w15]
	.set ___BP___,0
	bra	z,.L4
.LSM4:
	mov	#1,w4
	bra	.L3
.L4:
.LSM5:
	mov	[w14+6],w2
	mov	[w14+8],w3
	mov	[w14+4],w0
	rcall	_timerSetup
	mov	w0,w4
	mov	w4,[w14]
.LSM6:
	mov	[w14],w4
	sub	w4,#2,[w15]
	.set ___BP___,0
	bra	nz,.L5
.LSM7:
	mov	#2,w4
	bra	.L3
.L5:
.LSM8:
	mov	[w14+2],w4
	dec	w4,w4
	mov	#_OCxRS,w5
	add	w4,w4,w4
	add	w5,w4,w4
	mov	[w4],w4
	clr	w5
	mov	w5,[w4]
.LSM9:
	mov	[w14+4],w4
	sub	w4,#2,[w15]
	.set ___BP___,0
	bra	nz,.L6
.LSM10:
	mov	[w14+2],w4
	dec	w4,w4
	mov	#_OCxCON,w5
	add	w4,w4,w4
	add	w5,w4,w4
	mov	[w4],w4
	mov	#6,w5
	mov	w5,[w4]
	bra	.L7
.L6:
.LSM11:
	mov	[w14+2],w4
	dec	w4,w4
	mov	#_OCxCON,w5
	add	w4,w4,w4
	add	w5,w4,w4
	mov	[w4],w4
	mov	#14,w5
	mov	w5,[w4]
.L7:
.LSM12:
	mov	[w14+4],w0
	rcall	_timerStart
.LSM13:
	clr	w4
.L3:
.LSM14:
	mov	w4,w0
	ulnk	
	return	
	.set ___PA___,0
.LFE0:
	.align	2
	.global	_pwmSetDutyCycle	; export
	.type	_pwmSetDutyCycle,@function
_pwmSetDutyCycle:
.LFB1:
.LSM15:
	.set ___PA___,1
	lnk	#6
	mov	w8,[w15++]
	mov	w0,[w14]
	mov	w2,[w14+2]
	mov	w3,[w14+4]
.LSM16:
	mov	[w14],w4
	sub	w4,#1,[w15]
	.set ___BP___,0
	bra	z,.L9
	mov	[w14],w4
	sub	w4,#2,[w15]
	.set ___BP___,0
	bra	z,.L9
	mov	[w14],w4
	sub	w4,#3,[w15]
	.set ___BP___,0
	bra	z,.L9
	mov	[w14],w4
	sub	w4,#4,[w15]
	.set ___BP___,0
	bra	z,.L9
.LSM17:
	mov	#3,w4
	bra	.L10
.L9:
.LSM18:
	mov.b	#1,w8
	mov	#0,w2
	mov	#16256,w3
	mov	[w14+2],w0
	mov	[w14+4],w1
	rcall	___gtsf2
	mov	w0,w4
	sub	w4,#0,[w15]
	.set ___BP___,0
	bra	gt,.L11
	clr.b	w8
.L11:
	sub.b	w8,#0,[w15]
	.set ___BP___,0
	bra	z,.L12
.LSM19:
	mov	#0,w4
	mov	#16256,w5
	mov	w4,[w14+2]
	mov	w5,[w14+4]
	bra	.L13
.L12:
.LSM20:
	mov.b	#1,w8
	mul.uu	w2,#0,w2
		
	mov	[w14+2],w0
	mov	[w14+4],w1
	rcall	___ltsf2
	mov	w0,w4
	sub	w4,#0,[w15]
	.set ___BP___,0
	bra	lt,.L14
	clr.b	w8
.L14:
	sub.b	w8,#0,[w15]
	.set ___BP___,0
	bra	z,.L13
.LSM21:
	mul.uu	w4,#0,w4
		
	mov	w4,[w14+2]
	mov	w5,[w14+4]
.L13:
.LSM22:
	dec	[w14],w4
	mov	#_OCxCON,w5
	add	w4,w4,w4
	add	w5,w4,w4
	mov	[w4],w4
	mov	[w4],w4
	and	w4,#8,w4
	sub	w4,#0,[w15]
	.set ___BP___,0
	bra	nz,.L15
.LSM23:
	dec	[w14],w4
	mov	#_OCxRS,w5
	add	w4,w4,w4
	add	w5,w4,w4
	mov	[w4],w8
	mov	_PR2,w4
	inc	w4,w4
	mov	#0,w5
	mov.d	w4,w0
	rcall	___floatunsisf
	mov.d	w0,w4
	mov	[w14+2],w2
	mov	[w14+4],w3
	mov.d	w4,w0
	rcall	___mulsf3
	mov.d	w0,w4
	mov.d	w4,w0
	rcall	___fixunssfsi
	mov.d	w0,w4
	mov	w4,w4
	mov	w4,[w8]
	bra	.L16
.L15:
.LSM24:
	dec	[w14],w4
	mov	#_OCxRS,w5
	add	w4,w4,w4
	add	w5,w4,w4
	mov	[w4],w8
	mov	_PR3,w4
	inc	w4,w4
	mov	#0,w5
	mov.d	w4,w0
	rcall	___floatunsisf
	mov.d	w0,w4
	mov	[w14+2],w2
	mov	[w14+4],w3
	mov.d	w4,w0
	rcall	___mulsf3
	mov.d	w0,w4
	mov.d	w4,w0
	rcall	___fixunssfsi
	mov.d	w0,w4
	mov	w4,w4
	mov	w4,[w8]
.L16:
.LSM25:
	clr	w4
.L10:
.LSM26:
	mov	w4,w0
	mov	[--w15],w8
	ulnk	
	return	
	.set ___PA___,0
.LFE1:
	.align	2
	.global	_pwmSetDuration	; export
	.type	_pwmSetDuration,@function
_pwmSetDuration:
.LFB2:
.LSM27:
	.set ___PA___,1
	lnk	#16
	mov	w0,[w14+10]
	mov	w2,[w14+12]
	mov	w3,[w14+14]
.LSM28:
	add	w14,#6,w4
	mov	#_C.3.8813,w5
	repeat	#4-1
	mov.b	[w5++],[w4++]
.LSM29:
	mov	#16384,w2
	mov	#18204,w3
	mov	[w14+12],w0
	mov	[w14+14],w1
	rcall	___mulsf3
	mov.d	w0,w4
	mov	#0,w2
	mov	#16256,w3
	mov.d	w4,w0
	rcall	___subsf3
	mov.d	w0,w4
	mov.d	w4,w0
	rcall	___fixsfsi
	mov.d	w0,w4
	mov	w4,[w14+2]
	mov	w5,[w14+4]
.LSM30:
	mov	[w14+10],w4
	sub	w4,#1,[w15]
	.set ___BP___,0
	bra	z,.L18
	mov	[w14+10],w4
	sub	w4,#2,[w15]
	.set ___BP___,0
	bra	z,.L18
	mov	[w14+10],w4
	sub	w4,#3,[w15]
	.set ___BP___,0
	bra	z,.L18
	mov	[w14+10],w4
	sub	w4,#4,[w15]
	.set ___BP___,0
	bra	z,.L18
.LSM31:
	mov	#3,w4
	bra	.L19
.L18:
.LSM32:
	mov	[w14+10],w4
	dec	w4,w4
	mov	#_OCxCON,w5
	add	w4,w4,w4
	add	w5,w4,w4
	mov	[w4],w4
	mov	[w4],w4
	and	w4,#8,w4
	sub	w4,#0,[w15]
	.set ___BP___,0
	bra	nz,.L20
.LSM33:
	mov	_PR2,w4
	mov	w4,[w14]
.LSM34:
	mov	_T2CONbits,w4
	lsr	w4,#4,w4
	and.b	w4,#3,w4
	ze	w4,w4
	add	w14,w4,w4
	mov.b	[w4+6],w4
	se	w4,w6
	mov	[w14+2],w4
	mov	[w14+4],w5
	mov	w6,w7
	.set ___BP___,0
.LB306:
	dec	w7,w7
	bra	n,.LE306
	asr	w5,w5
	rrc	w4,w4
	bra	.LB306
.LE306:
	mov	w4,[w14+2]
	mov	w5,[w14+4]
	bra	.L21
.L20:
.LSM35:
	mov	_PR3,w4
	mov	w4,[w14]
.LSM36:
	mov	_T3CONbits,w4
	lsr	w4,#4,w4
	and.b	w4,#3,w4
	ze	w4,w4
	add	w14,w4,w4
	mov.b	[w4+6],w4
	se	w4,w6
	mov	[w14+2],w4
	mov	[w14+4],w5
	mov	w6,w7
	.set ___BP___,0
.LB323:
	dec	w7,w7
	bra	n,.LE323
	asr	w5,w5
	rrc	w4,w4
	bra	.LB323
.LE323:
	mov	w4,[w14+2]
	mov	w5,[w14+4]
.L21:
.LSM37:
	mov	[w14],w4
	mul.su	w4,#1,w6
	mov	[w14+2],w4
	mov	[w14+4],w5
	sub	w6,w4,[w15]
	subb	w7,w5,[w15]
	.set ___BP___,0
	bra	ge,.L22
.LSM38:
	mov	[w14],w4
	asr	w4,#15,w5
	mov	w4,[w14+2]
	mov	w5,[w14+4]
	bra	.L23
.L22:
.LSM39:
	mov	[w14+2],w4
	mov	[w14+4],w5
	sub	w4,#0,[w15]
	subb	w5,#0,[w15]
	.set ___BP___,0
	bra	ge,.L23
.LSM40:
	mul.uu	w4,#0,w4
	mov	w4,[w14+2]
	mov	w5,[w14+4]
.L23:
.LSM41:
	mov	[w14+10],w4
	dec	w4,w4
	mov	#_OCxRS,w5
	add	w4,w4,w4
	add	w5,w4,w4
	mov	[w4],w4
	mov	[w14+2],w5
	mov	w5,[w4]
.LSM42:
	clr	w4
.L19:
.LSM43:
	mov	w4,w0
	ulnk	
	return	
	.set ___PA___,0
.LFE2:
	.align	2
	.global	_pwmSetCycle	; export
	.type	_pwmSetCycle,@function
_pwmSetCycle:
.LFB3:
.LSM44:
	.set ___PA___,1
	lnk	#10
	mov	w0,[w14+4]
	mov	w2,[w14+6]
	mov	w3,[w14+8]
.LSM45:
	mov	[w14+6],w0
	mov	[w14+8],w1
	rcall	___fixsfsi
	mov.d	w0,w4
	mov	w4,[w14+2]
.LSM46:
	mov	[w14+4],w4
	sub	w4,#1,[w15]
	.set ___BP___,0
	bra	z,.L25
	mov	[w14+4],w4
	sub	w4,#2,[w15]
	.set ___BP___,0
	bra	z,.L25
	mov	[w14+4],w4
	sub	w4,#3,[w15]
	.set ___BP___,0
	bra	z,.L25
	mov	[w14+4],w4
	sub	w4,#4,[w15]
	.set ___BP___,0
	bra	z,.L25
.LSM47:
	mov	#3,w4
	bra	.L26
.L25:
.LSM48:
	mov	[w14+4],w4
	dec	w4,w4
	mov	#_OCxCON,w5
	add	w4,w4,w4
	add	w5,w4,w4
	mov	[w4],w4
	mov	[w4],w4
	and	w4,#8,w4
	sub	w4,#0,[w15]
	.set ___BP___,0
	bra	nz,.L27
.LSM49:
	mov	_PR2,w4
	mov	w4,[w14]
	bra	.L28
.L27:
.LSM50:
	mov	_PR3,w4
	mov	w4,[w14]
.L28:
.LSM51:
	mov	[w14+2],w4
	sub	w4,[w14],[w15]
	.set ___BP___,0
	bra	le,.L29
.LSM52:
	mov	[w14],w4
	mov	w4,[w14+2]
	bra	.L30
.L29:
.LSM53:
	mov	[w14+2],w4
	sub	w4,#0,[w15]
	.set ___BP___,0
	bra	ge,.L30
.LSM54:
	clr	w4
	mov	w4,[w14+2]
.L30:
.LSM55:
	mov	[w14+4],w4
	dec	w4,w4
	mov	#_OCxRS,w5
	add	w4,w4,w4
	add	w5,w4,w4
	mov	[w4],w4
	mov	[w14+2],w5
	mov	w5,[w4]
.LSM56:
	clr	w4
.L26:
.LSM57:
	mov	w4,w0
	ulnk	
	return	
	.set ___PA___,0
.LFE3:
	.align	2
	.global	_pwmEnable	; export
	.type	_pwmEnable,@function
_pwmEnable:
.LFB4:
.LSM58:
	.set ___PA___,1
	lnk	#2
	mov	w0,[w14]
.LSM59:
	mov	[w14],w4
	sub	w4,#1,[w15]
	.set ___BP___,0
	bra	z,.L32
	mov	[w14],w4
	sub	w4,#2,[w15]
	.set ___BP___,0
	bra	z,.L32
	mov	[w14],w4
	sub	w4,#3,[w15]
	.set ___BP___,0
	bra	z,.L32
	mov	[w14],w4
	sub	w4,#4,[w15]
	.set ___BP___,0
	bra	z,.L32
.LSM60:
	mov	#3,w4
	bra	.L33
.L32:
.LSM61:
	dec	[w14],w4
	mov	#_OCxCON,w5
	add	w4,w4,w4
	add	w5,w4,w4
	mov	[w4],w5
	dec	[w14],w4
	mov	#_OCxCON,w6
	add	w4,w4,w4
	add	w6,w4,w4
	mov	[w4],w4
	mov	[w4],w4
	ior	#6,w4
	mov	w4,[w5]
.LSM62:
	clr	w4
.L33:
.LSM63:
	mov	w4,w0
	ulnk	
	return	
	.set ___PA___,0
.LFE4:
	.align	2
	.global	_pwmDisable	; export
	.type	_pwmDisable,@function
_pwmDisable:
.LFB5:
.LSM64:
	.set ___PA___,1
	lnk	#2
	mov	w0,[w14]
.LSM65:
	mov	[w14],w4
	sub	w4,#1,[w15]
	.set ___BP___,0
	bra	z,.L35
	mov	[w14],w4
	sub	w4,#2,[w15]
	.set ___BP___,0
	bra	z,.L35
	mov	[w14],w4
	sub	w4,#3,[w15]
	.set ___BP___,0
	bra	z,.L35
	mov	[w14],w4
	sub	w4,#4,[w15]
	.set ___BP___,0
	bra	z,.L35
.LSM66:
	mov	#3,w4
	bra	.L36
.L35:
.LSM67:
	dec	[w14],w4
	mov	#_OCxCON,w5
	add	w4,w4,w4
	add	w5,w4,w4
	mov	[w4],w5
	dec	[w14],w4
	mov	#_OCxCON,w6
	add	w4,w4,w4
	add	w6,w4,w4
	mov	[w4],w4
	mov	[w4],w6
	mov	#-8,w4
	and	w6,w4,w4
	mov	w4,[w5]
.LSM68:
	clr	w4
.L36:
.LSM69:
	mov	w4,w0
	ulnk	
	return	
	.set ___PA___,0
.LFE5:
	.section	.const,psv,page
	.type	_C.3.8813,@object
_C.3.8813:
	.byte 0
	.byte 3
	.byte 6
	.byte 8
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
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.align	4
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.align	4
.LEFDE6:
.LSFDE8:
	.4byte	.LEFDE8-.LASFDE8
.LASFDE8:
	.4byte	.Lframe0
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.align	4
.LEFDE8:
.LSFDE10:
	.4byte	.LEFDE10-.LASFDE10
.LASFDE10:
	.4byte	.Lframe0
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.align	4
.LEFDE10:
	.section	.text,code
.Letext0:
	.section	.debug_info,info
	.4byte	0x748
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.asciz	"GNU C 4.5.1 (XC16, Microchip v1_21) (A) Build date: Jan  2 2014"
	.byte	0x1
	.asciz	"../Peripherals/pwm.c"
	.asciz	"D:\\\\dev\\\\GitHub\\\\bULBot2015-mainRobot\\\\PropBoard2014-DC"
	.4byte	.Ltext0
	.4byte	.Letext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.asciz	"unsigned int"
	.uleb128 0x3
	.byte	0x2
	.byte	0x2
	.2byte	0x443
	.4byte	0x132
	.uleb128 0x4
	.asciz	"TCS"
	.byte	0x2
	.2byte	0x445
	.4byte	0xa6
	.byte	0x2
	.byte	0x1
	.byte	0xe
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x4
	.asciz	"T32"
	.byte	0x2
	.2byte	0x447
	.4byte	0xa6
	.byte	0x2
	.byte	0x1
	.byte	0xc
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x4
	.asciz	"TCKPS"
	.byte	0x2
	.2byte	0x448
	.4byte	0xa6
	.byte	0x2
	.byte	0x2
	.byte	0xa
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x4
	.asciz	"TGATE"
	.byte	0x2
	.2byte	0x449
	.4byte	0xa6
	.byte	0x2
	.byte	0x1
	.byte	0x9
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x4
	.asciz	"TSIDL"
	.byte	0x2
	.2byte	0x44b
	.4byte	0xa6
	.byte	0x2
	.byte	0x1
	.byte	0x2
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x4
	.asciz	"TON"
	.byte	0x2
	.2byte	0x44d
	.4byte	0xa6
	.byte	0x2
	.byte	0x1
	.byte	0x10
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x3
	.byte	0x2
	.byte	0x2
	.2byte	0x44f
	.4byte	0x166
	.uleb128 0x4
	.asciz	"TCKPS0"
	.byte	0x2
	.2byte	0x451
	.4byte	0xa6
	.byte	0x2
	.byte	0x1
	.byte	0xb
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x4
	.asciz	"TCKPS1"
	.byte	0x2
	.2byte	0x452
	.4byte	0xa6
	.byte	0x2
	.byte	0x1
	.byte	0xa
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.byte	0x2
	.2byte	0x442
	.4byte	0x17a
	.uleb128 0x6
	.4byte	0xb6
	.uleb128 0x6
	.4byte	0x132
	.byte	0x0
	.uleb128 0x7
	.asciz	"tagT2CONBITS"
	.byte	0x2
	.byte	0x2
	.2byte	0x441
	.4byte	0x199
	.uleb128 0x8
	.4byte	0x166
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x9
	.asciz	"T2CONBITS"
	.byte	0x2
	.2byte	0x455
	.4byte	0x17a
	.uleb128 0x3
	.byte	0x2
	.byte	0x2
	.2byte	0x45c
	.4byte	0x215
	.uleb128 0x4
	.asciz	"TCS"
	.byte	0x2
	.2byte	0x45e
	.4byte	0xa6
	.byte	0x2
	.byte	0x1
	.byte	0xe
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x4
	.asciz	"TCKPS"
	.byte	0x2
	.2byte	0x460
	.4byte	0xa6
	.byte	0x2
	.byte	0x2
	.byte	0xa
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x4
	.asciz	"TGATE"
	.byte	0x2
	.2byte	0x461
	.4byte	0xa6
	.byte	0x2
	.byte	0x1
	.byte	0x9
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x4
	.asciz	"TSIDL"
	.byte	0x2
	.2byte	0x463
	.4byte	0xa6
	.byte	0x2
	.byte	0x1
	.byte	0x2
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x4
	.asciz	"TON"
	.byte	0x2
	.2byte	0x465
	.4byte	0xa6
	.byte	0x2
	.byte	0x1
	.byte	0x10
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x3
	.byte	0x2
	.byte	0x2
	.2byte	0x467
	.4byte	0x249
	.uleb128 0x4
	.asciz	"TCKPS0"
	.byte	0x2
	.2byte	0x469
	.4byte	0xa6
	.byte	0x2
	.byte	0x1
	.byte	0xb
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x4
	.asciz	"TCKPS1"
	.byte	0x2
	.2byte	0x46a
	.4byte	0xa6
	.byte	0x2
	.byte	0x1
	.byte	0xa
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.byte	0x2
	.2byte	0x45b
	.4byte	0x25d
	.uleb128 0x6
	.4byte	0x1ab
	.uleb128 0x6
	.4byte	0x215
	.byte	0x0
	.uleb128 0x7
	.asciz	"tagT3CONBITS"
	.byte	0x2
	.byte	0x2
	.2byte	0x45a
	.4byte	0x27c
	.uleb128 0x8
	.4byte	0x249
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x9
	.asciz	"T3CONBITS"
	.byte	0x2
	.2byte	0x46d
	.4byte	0x25d
	.uleb128 0xa
	.byte	0x2
	.byte	0x3
	.byte	0x1f
	.4byte	0x2cd
	.uleb128 0xb
	.asciz	"TIMER_SUCCESS"
	.sleb128 0
	.uleb128 0xb
	.asciz	"TIMER_ID_ERROR"
	.sleb128 1
	.uleb128 0xb
	.asciz	"TIMER_PERIOD_ERROR"
	.sleb128 2
	.byte	0x0
	.uleb128 0xc
	.asciz	"timerStatus"
	.byte	0x3
	.byte	0x23
	.4byte	0x28e
	.uleb128 0xa
	.byte	0x2
	.byte	0x4
	.byte	0xe
	.4byte	0x329
	.uleb128 0xb
	.asciz	"PWM_SUCCESS"
	.sleb128 0
	.uleb128 0xb
	.asciz	"PWM_TID_ERROR"
	.sleb128 1
	.uleb128 0xb
	.asciz	"PWM_PERIOD_ERROR"
	.sleb128 2
	.uleb128 0xb
	.asciz	"PWM_ID_ERROR"
	.sleb128 3
	.byte	0x0
	.uleb128 0xc
	.asciz	"pwmStatus"
	.byte	0x4
	.byte	0x13
	.4byte	0x2e0
	.uleb128 0xd
	.byte	0x1
	.asciz	"pwmSetup"
	.byte	0x1
	.byte	0xe
	.byte	0x1
	.4byte	0x329
	.4byte	.LFB0
	.4byte	.LFE0
	.byte	0x1
	.byte	0x5e
	.4byte	0x399
	.uleb128 0xe
	.asciz	"id"
	.byte	0x1
	.byte	0xe
	.4byte	0x399
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0xe
	.asciz	"timer"
	.byte	0x1
	.byte	0xe
	.4byte	0x399
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0xe
	.asciz	"periodMs"
	.byte	0x1
	.byte	0xe
	.4byte	0x3a0
	.byte	0x2
	.byte	0x7e
	.sleb128 6
	.uleb128 0xf
	.asciz	"err"
	.byte	0x1
	.byte	0xf
	.4byte	0x2cd
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.asciz	"int"
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.asciz	"float"
	.uleb128 0xd
	.byte	0x1
	.asciz	"pwmSetDutyCycle"
	.byte	0x1
	.byte	0x33
	.byte	0x1
	.4byte	0x329
	.4byte	.LFB1
	.4byte	.LFE1
	.byte	0x1
	.byte	0x5e
	.4byte	0x3f2
	.uleb128 0xe
	.asciz	"id"
	.byte	0x1
	.byte	0x33
	.4byte	0x399
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0xe
	.asciz	"dutyCycle"
	.byte	0x1
	.byte	0x33
	.4byte	0x3a0
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.byte	0x0
	.uleb128 0xd
	.byte	0x1
	.asciz	"pwmSetDuration"
	.byte	0x1
	.byte	0x4a
	.byte	0x1
	.4byte	0x329
	.4byte	.LFB2
	.4byte	.LFE2
	.byte	0x1
	.byte	0x5e
	.4byte	0x46f
	.uleb128 0xe
	.asciz	"id"
	.byte	0x1
	.byte	0x4a
	.4byte	0x399
	.byte	0x2
	.byte	0x7e
	.sleb128 10
	.uleb128 0xe
	.asciz	"durationMs"
	.byte	0x1
	.byte	0x4a
	.4byte	0x3a0
	.byte	0x2
	.byte	0x7e
	.sleb128 12
	.uleb128 0xf
	.asciz	"PRx"
	.byte	0x1
	.byte	0x4c
	.4byte	0x399
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0xf
	.asciz	"prescaleShift"
	.byte	0x1
	.byte	0x4d
	.4byte	0x46f
	.byte	0x2
	.byte	0x7e
	.sleb128 6
	.uleb128 0xf
	.asciz	"OCx"
	.byte	0x1
	.byte	0x50
	.4byte	0x487
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.byte	0x0
	.uleb128 0x10
	.4byte	0x47f
	.4byte	0x47f
	.uleb128 0x11
	.4byte	0xa6
	.byte	0x3
	.byte	0x0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.asciz	"char"
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.asciz	"long int"
	.uleb128 0xd
	.byte	0x1
	.asciz	"pwmSetCycle"
	.byte	0x1
	.byte	0x6d
	.byte	0x1
	.4byte	0x329
	.4byte	.LFB3
	.4byte	.LFE3
	.byte	0x1
	.byte	0x5e
	.4byte	0x4f3
	.uleb128 0xe
	.asciz	"id"
	.byte	0x1
	.byte	0x6d
	.4byte	0x399
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0xe
	.asciz	"duration"
	.byte	0x1
	.byte	0x6d
	.4byte	0x3a0
	.byte	0x2
	.byte	0x7e
	.sleb128 6
	.uleb128 0xf
	.asciz	"PRx"
	.byte	0x1
	.byte	0x6f
	.4byte	0x399
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0xf
	.asciz	"OCx"
	.byte	0x1
	.byte	0x72
	.4byte	0x399
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.byte	0x0
	.uleb128 0xd
	.byte	0x1
	.asciz	"pwmEnable"
	.byte	0x1
	.byte	0x8d
	.byte	0x1
	.4byte	0x329
	.4byte	.LFB4
	.4byte	.LFE4
	.byte	0x1
	.byte	0x5e
	.4byte	0x522
	.uleb128 0xe
	.asciz	"id"
	.byte	0x1
	.byte	0x8d
	.4byte	0x399
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0xd
	.byte	0x1
	.asciz	"pwmDisable"
	.byte	0x1
	.byte	0x98
	.byte	0x1
	.4byte	0x329
	.4byte	.LFB5
	.4byte	.LFE5
	.byte	0x1
	.byte	0x5e
	.4byte	0x552
	.uleb128 0xe
	.asciz	"id"
	.byte	0x1
	.byte	0x98
	.4byte	0x399
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0x12
	.asciz	"PR2"
	.byte	0x2
	.2byte	0x43c
	.4byte	0x560
	.byte	0x1
	.byte	0x1
	.uleb128 0x13
	.4byte	0xa6
	.uleb128 0x12
	.asciz	"PR3"
	.byte	0x2
	.2byte	0x43e
	.4byte	0x560
	.byte	0x1
	.byte	0x1
	.uleb128 0x14
	.4byte	.LASF0
	.byte	0x2
	.2byte	0x456
	.4byte	0x581
	.byte	0x1
	.byte	0x1
	.uleb128 0x13
	.4byte	0x199
	.uleb128 0x14
	.4byte	.LASF1
	.byte	0x2
	.2byte	0x46e
	.4byte	0x594
	.byte	0x1
	.byte	0x1
	.uleb128 0x13
	.4byte	0x27c
	.uleb128 0x12
	.asciz	"OC1RS"
	.byte	0x2
	.2byte	0x54b
	.4byte	0x560
	.byte	0x1
	.byte	0x1
	.uleb128 0x12
	.asciz	"OC1CON"
	.byte	0x2
	.2byte	0x54f
	.4byte	0x560
	.byte	0x1
	.byte	0x1
	.uleb128 0x12
	.asciz	"OC2RS"
	.byte	0x2
	.2byte	0x563
	.4byte	0x560
	.byte	0x1
	.byte	0x1
	.uleb128 0x12
	.asciz	"OC2CON"
	.byte	0x2
	.2byte	0x567
	.4byte	0x560
	.byte	0x1
	.byte	0x1
	.uleb128 0x12
	.asciz	"OC3RS"
	.byte	0x2
	.2byte	0x57b
	.4byte	0x560
	.byte	0x1
	.byte	0x1
	.uleb128 0x12
	.asciz	"OC3CON"
	.byte	0x2
	.2byte	0x57f
	.4byte	0x560
	.byte	0x1
	.byte	0x1
	.uleb128 0x12
	.asciz	"OC4RS"
	.byte	0x2
	.2byte	0x593
	.4byte	0x560
	.byte	0x1
	.byte	0x1
	.uleb128 0x12
	.asciz	"OC4CON"
	.byte	0x2
	.2byte	0x597
	.4byte	0x560
	.byte	0x1
	.byte	0x1
	.uleb128 0x10
	.4byte	0x62d
	.4byte	0x62d
	.uleb128 0x11
	.4byte	0xa6
	.byte	0x3
	.byte	0x0
	.uleb128 0x15
	.byte	0x2
	.4byte	0x560
	.uleb128 0x16
	.asciz	"OCxCON"
	.byte	0x1
	.byte	0xb
	.4byte	0x643
	.byte	0x1
	.byte	0x1
	.uleb128 0x17
	.4byte	0x61d
	.uleb128 0x16
	.asciz	"OCxRS"
	.byte	0x1
	.byte	0xc
	.4byte	0x657
	.byte	0x1
	.byte	0x1
	.uleb128 0x17
	.4byte	0x61d
	.uleb128 0x12
	.asciz	"PR2"
	.byte	0x2
	.2byte	0x43c
	.4byte	0x560
	.byte	0x1
	.byte	0x1
	.uleb128 0x12
	.asciz	"PR3"
	.byte	0x2
	.2byte	0x43e
	.4byte	0x560
	.byte	0x1
	.byte	0x1
	.uleb128 0x14
	.4byte	.LASF0
	.byte	0x2
	.2byte	0x456
	.4byte	0x581
	.byte	0x1
	.byte	0x1
	.uleb128 0x14
	.4byte	.LASF1
	.byte	0x2
	.2byte	0x46e
	.4byte	0x594
	.byte	0x1
	.byte	0x1
	.uleb128 0x12
	.asciz	"OC1RS"
	.byte	0x2
	.2byte	0x54b
	.4byte	0x560
	.byte	0x1
	.byte	0x1
	.uleb128 0x12
	.asciz	"OC1CON"
	.byte	0x2
	.2byte	0x54f
	.4byte	0x560
	.byte	0x1
	.byte	0x1
	.uleb128 0x12
	.asciz	"OC2RS"
	.byte	0x2
	.2byte	0x563
	.4byte	0x560
	.byte	0x1
	.byte	0x1
	.uleb128 0x12
	.asciz	"OC2CON"
	.byte	0x2
	.2byte	0x567
	.4byte	0x560
	.byte	0x1
	.byte	0x1
	.uleb128 0x12
	.asciz	"OC3RS"
	.byte	0x2
	.2byte	0x57b
	.4byte	0x560
	.byte	0x1
	.byte	0x1
	.uleb128 0x12
	.asciz	"OC3CON"
	.byte	0x2
	.2byte	0x57f
	.4byte	0x560
	.byte	0x1
	.byte	0x1
	.uleb128 0x12
	.asciz	"OC4RS"
	.byte	0x2
	.2byte	0x593
	.4byte	0x560
	.byte	0x1
	.byte	0x1
	.uleb128 0x12
	.asciz	"OC4CON"
	.byte	0x2
	.2byte	0x597
	.4byte	0x560
	.byte	0x1
	.byte	0x1
	.uleb128 0x18
	.asciz	"OCxCON"
	.byte	0x1
	.byte	0xb
	.4byte	0x72d
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	_OCxCON
	.uleb128 0x17
	.4byte	0x61d
	.uleb128 0x18
	.asciz	"OCxRS"
	.byte	0x1
	.byte	0xc
	.4byte	0x746
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	_OCxRS
	.uleb128 0x17
	.4byte	0x61d
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
	.uleb128 0x3
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
	.uleb128 0x4
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
	.uleb128 0x5
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
	.uleb128 0x6
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x7
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
	.uleb128 0x8
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0xb
	.uleb128 0x28
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0x0
	.byte	0x0
	.uleb128 0xc
	.uleb128 0x16
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xd
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xe
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
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
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x10
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x11
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x12
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
	.uleb128 0x13
	.uleb128 0x35
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x14
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
	.uleb128 0x15
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x16
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.uleb128 0x17
	.uleb128 0x26
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x18
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
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
	.4byte	0x84
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x74c
	.4byte	0x33a
	.asciz	"pwmSetup"
	.4byte	0x3a9
	.asciz	"pwmSetDutyCycle"
	.4byte	0x3f2
	.asciz	"pwmSetDuration"
	.4byte	0x493
	.asciz	"pwmSetCycle"
	.4byte	0x4f3
	.asciz	"pwmEnable"
	.4byte	0x522
	.asciz	"pwmDisable"
	.4byte	0x718
	.asciz	"OCxCON"
	.4byte	0x732
	.asciz	"OCxRS"
	.4byte	0x0
	.section	.debug_pubtypes,info
	.4byte	0x6a
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x74c
	.4byte	0x17a
	.asciz	"tagT2CONBITS"
	.4byte	0x199
	.asciz	"T2CONBITS"
	.4byte	0x25d
	.asciz	"tagT3CONBITS"
	.4byte	0x27c
	.asciz	"T3CONBITS"
	.4byte	0x2cd
	.asciz	"timerStatus"
	.4byte	0x329
	.asciz	"pwmStatus"
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
	.asciz	"pwm.c"
	.uleb128 0x1
	.uleb128 0x0
	.uleb128 0x0
	.asciz	"p33FJ128MC804.h"
	.uleb128 0x2
	.uleb128 0x0
	.uleb128 0x0
	.asciz	"timers.h"
	.uleb128 0x1
	.uleb128 0x0
	.uleb128 0x0
	.asciz	"pwm.h"
	.uleb128 0x1
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
	.byte	0x21
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM1
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM2
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM3
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM4
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM5
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM6
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM7
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM8
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM9
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM10
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM11
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM12
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM13
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM14
	.byte	0x15
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
	.4byte	.LSM15
	.byte	0x46
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM16
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM17
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM18
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM19
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM20
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM21
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM22
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM23
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM24
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM25
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM26
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LFE1
	.byte	0x0
	.uleb128 0x1
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM27
	.byte	0x5d
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM28
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM29
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM30
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM31
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM32
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM33
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM34
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM35
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM36
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM37
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM38
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM39
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM40
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM41
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM42
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM43
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LFE2
	.byte	0x0
	.uleb128 0x1
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM44
	.byte	0x80
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM45
	.byte	0x19
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM46
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM47
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM48
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM49
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM50
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM51
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM52
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM53
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM54
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM55
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM56
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM57
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LFE3
	.byte	0x0
	.uleb128 0x1
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM58
	.byte	0xa0
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM59
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM60
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM61
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM62
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM63
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LFE4
	.byte	0x0
	.uleb128 0x1
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM64
	.byte	0xab
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM65
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM66
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM67
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM68
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM69
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LFE5
	.byte	0x0
	.uleb128 0x1
	.byte	0x1
.LELT0:
	.section	.debug_str,info
.LASF1:
	.asciz	"T3CONbits"
.LASF0:
	.asciz	"T2CONbits"
	.section	.text,code

	.section __c30_signature, info, data
	.word 0x0001
	.word 0x0000
	.word 0x0000

; MCHP configuration words

	.set ___PA___,0
	.end
