	.file "D:\\dev\\GitHub\\bULBot2015-mainRobot\\PropBoard2014-DC\\consigne.c"
	.section	.debug_abbrev,info
.Ldebug_abbrev0:
	.section	.debug_info,info
.Ldebug_info0:
	.section	.debug_line,info
.Ldebug_line0:
	.section	.text,code
.Ltext0:
	.section	.nbss,bss,near
	.type	_prCsgPos,@object
	.global	_prCsgPos
	.align	2
_prCsgPos:	.space	8
	.type	_prCsgFinalPos,@object
	.global	_prCsgFinalPos
	.align	2
_prCsgFinalPos:	.space	8
	.type	_prCsgVel,@object
	.global	_prCsgVel
	.align	2
_prCsgVel:	.space	8
	.type	_prCsgNomVel,@object
	.global	_prCsgNomVel
	.align	2
_prCsgNomVel:	.space	8
	.type	_prCsgNomAcc,@object
	.global	_prCsgNomAcc
	.align	2
_prCsgNomAcc:	.space	8
	.type	_prMinDist,@object
	.global	_prMinDist
	.align	2
_prMinDist:	.space	8
	.type	_prCsgStatus,@object
	.global	_prCsgStatus
	.align	2
_prCsgStatus:	.space	2
	.section	.text,code
	.align	2
	.global	_csgInit	; export
	.type	_csgInit,@function
_csgInit:
.LFB0:
.LSM0:
	.set ___PA___,1
	lnk	#16
	mov.d	w0,[w14++]
	mov.d	w2,[w14--]
	mov	w4,[w14+8]
	mov	w5,[w14+10]
	mov	w6,[w14+12]
	mov	w7,[w14+14]
.LSM1:
	mov	#_prCsgPos,w6
	mul.uu	w4,#0,w4
		
	mov.d	w4,[w6]
.LSM2:
	mov	#_prCsgFinalPos,w6
	mul.uu	w4,#0,w4
		
	mov.d	w4,[w6]
.LSM3:
	mov	#_prCsgVel,w6
	mul.uu	w4,#0,w4
		
	mov.d	w4,[w6]
.LSM4:
	mov.d	[w14],w4
	mov	#_prCsgNomVel,w6
	mov.d	w4,[w6]
.LSM5:
	mov	[w14+8],w4
	mov	[w14+10],w5
	mov	#_prCsgNomAcc,w6
	mov.d	w4,[w6]
.LSM6:
	mov	#_prCsgNomAcc,w4
	mov.d	[w4],w4
	mov	#46871,w2
	mov	#14417,w3
	mov.d	w4,w0
	rcall	___mulsf3
	mov.d	w0,w4
	mov	#_prMinDist,w6
	mov.d	w4,[w6]
.LSM7:
	mov	#_prCsgPos,w6
	mul.uu	w4,#0,w4
		
	mov	w4,[w6+4]
	mov	w5,[w6+6]
.LSM8:
	mov	#_prCsgFinalPos,w6
	mul.uu	w4,#0,w4
		
	mov	w4,[w6+4]
	mov	w5,[w6+6]
.LSM9:
	mov	#_prCsgVel,w6
	mul.uu	w4,#0,w4
		
	mov	w4,[w6+4]
	mov	w5,[w6+6]
.LSM10:
	mov	[w14+4],w4
	mov	[w14+6],w5
	mov	#_prCsgNomVel,w6
	mov	w4,[w6+4]
	mov	w5,[w6+6]
.LSM11:
	mov	[w14+12],w4
	mov	[w14+14],w5
	mov	#_prCsgNomAcc,w6
	mov	w4,[w6+4]
	mov	w5,[w6+6]
.LSM12:
	mov	#_prCsgNomAcc,w4
	mov	[w4+6],w5
	mov	[w4+4],w4
	mov	#46871,w2
	mov	#14417,w3
	mov.d	w4,w0
	rcall	___mulsf3
	mov.d	w0,w4
	mov	#_prMinDist,w6
	mov	w4,[w6+4]
	mov	w5,[w6+6]
.LSM13:
	clr	w4
	mov	w4,_prCsgStatus
.LSM14:
	mov	_prCsgStatus,w4
.LSM15:
	mov	w4,w0
	ulnk	
	return	
	.set ___PA___,0
.LFE0:
	.align	2
	.global	_csgSetFinalPos	; export
	.type	_csgSetFinalPos,@function
_csgSetFinalPos:
.LFB1:
.LSM16:
	.set ___PA___,1
	lnk	#8
	mov.d	w0,[w14++]
	mov.d	w2,[w14--]
.LSM17:
	mov.d	[w14],w4
	mov	#_prCsgFinalPos,w6
	mov.d	w4,[w6]
.LSM18:
	mov	[w14+4],w4
	mov	[w14+6],w5
	mov	#_prCsgFinalPos,w6
	mov	w4,[w6+4]
	mov	w5,[w6+6]
.LSM19:
	mov	#1,w4
	mov	w4,_prCsgStatus
.LSM20:
	ulnk	
	return	
	.set ___PA___,0
.LFE1:
	.align	2
	.global	_csgSetNomAcc	; export
	.type	_csgSetNomAcc,@function
_csgSetNomAcc:
.LFB2:
.LSM21:
	.set ___PA___,1
	lnk	#8
	mov	w8,[w15++]
	mov.d	w0,[w14++]
	mov.d	w2,[w14--]
.LSM22:
	mov.d	[w14],w4
	mov.b	#1,w8
	mul.uu	w2,#0,w2
		
	mov.d	w4,w0
	rcall	___gesf2
	mov	w0,w4
	sub	w4,#0,[w15]
	.set ___BP___,0
	bra	ge,.L4
	clr.b	w8
.L4:
	sub.b	w8,#0,[w15]
	.set ___BP___,0
	bra	z,.L5
.LSM23:
	mov.d	[w14],w4
	mov	#_prCsgNomAcc,w6
	mov.d	w4,[w6]
	bra	.L6
.L5:
.LSM24:
	mov.d	[w14],w4
	btg	w5,#15
	mov	#_prCsgNomAcc,w6
	mov.d	w4,[w6]
.L6:
.LSM25:
	mov	[w14+4],w4
	mov	[w14+6],w5
	mov.b	#1,w8
	mul.uu	w2,#0,w2
		
	mov.d	w4,w0
	rcall	___gesf2
	mov	w0,w4
	sub	w4,#0,[w15]
	.set ___BP___,0
	bra	ge,.L7
	clr.b	w8
.L7:
	sub.b	w8,#0,[w15]
	.set ___BP___,0
	bra	z,.L8
.LSM26:
	mov	[w14+4],w4
	mov	[w14+6],w5
	mov	#_prCsgNomAcc,w6
	mov	w4,[w6+4]
	mov	w5,[w6+6]
	bra	.L9
.L8:
.LSM27:
	mov	[w14+4],w4
	mov	[w14+6],w5
	btg	w5,#15
	mov	#_prCsgNomAcc,w6
	mov	w4,[w6+4]
	mov	w5,[w6+6]
.L9:
.LSM28:
	mov	#_prCsgNomAcc,w4
	mov.d	[w4],w4
	mov	#46871,w2
	mov	#14417,w3
	mov.d	w4,w0
	rcall	___mulsf3
	mov.d	w0,w4
	mov	#_prMinDist,w6
	mov.d	w4,[w6]
.LSM29:
	mov	#_prCsgNomAcc,w4
	mov	[w4+6],w5
	mov	[w4+4],w4
	mov	#46871,w2
	mov	#14417,w3
	mov.d	w4,w0
	rcall	___mulsf3
	mov.d	w0,w4
	mov	#_prMinDist,w6
	mov	w4,[w6+4]
	mov	w5,[w6+6]
.LSM30:
	mov	[--w15],w8
	ulnk	
	return	
	.set ___PA___,0
.LFE2:
	.align	2
	.global	_csgSetNomVel	; export
	.type	_csgSetNomVel,@function
_csgSetNomVel:
.LFB3:
.LSM31:
	.set ___PA___,1
	lnk	#8
	mov	w8,[w15++]
	mov.d	w0,[w14++]
	mov.d	w2,[w14--]
.LSM32:
	mov.d	[w14],w4
	mov.b	#1,w8
	mul.uu	w2,#0,w2
		
	mov.d	w4,w0
	rcall	___gesf2
	mov	w0,w4
	sub	w4,#0,[w15]
	.set ___BP___,0
	bra	ge,.L11
	clr.b	w8
.L11:
	sub.b	w8,#0,[w15]
	.set ___BP___,0
	bra	z,.L12
.LSM33:
	mov.d	[w14],w4
	mov	#_prCsgNomVel,w6
	mov.d	w4,[w6]
	bra	.L13
.L12:
.LSM34:
	mov.d	[w14],w4
	btg	w5,#15
	mov	#_prCsgNomVel,w6
	mov.d	w4,[w6]
.L13:
.LSM35:
	mov	[w14+4],w4
	mov	[w14+6],w5
	mov.b	#1,w8
	mul.uu	w2,#0,w2
		
	mov.d	w4,w0
	rcall	___gesf2
	mov	w0,w4
	sub	w4,#0,[w15]
	.set ___BP___,0
	bra	ge,.L14
	clr.b	w8
.L14:
	sub.b	w8,#0,[w15]
	.set ___BP___,0
	bra	z,.L15
.LSM36:
	mov	[w14+4],w4
	mov	[w14+6],w5
	mov	#_prCsgNomVel,w6
	mov	w4,[w6+4]
	mov	w5,[w6+6]
	bra	.L10
.L15:
.LSM37:
	mov	[w14+4],w4
	mov	[w14+6],w5
	btg	w5,#15
	mov	#_prCsgNomVel,w6
	mov	w4,[w6+4]
	mov	w5,[w6+6]
.L10:
.LSM38:
	mov	[--w15],w8
	ulnk	
	return	
	.set ___PA___,0
.LFE3:
	.align	2
	.global	_csgGetVel	; export
	.type	_csgGetVel,@function
_csgGetVel:
.LFB4:
.LSM39:
	.set ___PA___,1
	lnk	#0
	mov.d	w8,[w15++]
	mov.d	w10,[w15++]
	mov	w0,w4
.LSM40:
	mov	#_prCsgVel,w5
	mov.d	[w5++],w8
	mov.d	[w5--],w10
	mov.d	w8,[w4++]
	mov.d	w10,[w4--]
.LSM41:
	mov	w4,w0
	mov.d	[--w15],w10
	mov.d	[--w15],w8
	ulnk	
	return	
	.set ___PA___,0
.LFE4:
	.align	2
	.global	_csgGetPos	; export
	.type	_csgGetPos,@function
_csgGetPos:
.LFB5:
.LSM42:
	.set ___PA___,1
	lnk	#0
	mov.d	w8,[w15++]
	mov.d	w10,[w15++]
	mov	w0,w4
.LSM43:
	mov	#_prCsgPos,w5
	mov.d	[w5++],w8
	mov.d	[w5--],w10
	mov.d	w8,[w4++]
	mov.d	w10,[w4--]
.LSM44:
	mov	w4,w0
	mov.d	[--w15],w10
	mov.d	[--w15],w8
	ulnk	
	return	
	.set ___PA___,0
.LFE5:
	.align	2
	.global	_csgGetNomVel	; export
	.type	_csgGetNomVel,@function
_csgGetNomVel:
.LFB6:
.LSM45:
	.set ___PA___,1
	lnk	#0
	mov.d	w8,[w15++]
	mov.d	w10,[w15++]
	mov	w0,w4
.LSM46:
	mov	#_prCsgNomVel,w5
	mov.d	[w5++],w8
	mov.d	[w5--],w10
	mov.d	w8,[w4++]
	mov.d	w10,[w4--]
.LSM47:
	mov	w4,w0
	mov.d	[--w15],w10
	mov.d	[--w15],w8
	ulnk	
	return	
	.set ___PA___,0
.LFE6:
	.align	2
	.global	_csgGetNomAcc	; export
	.type	_csgGetNomAcc,@function
_csgGetNomAcc:
.LFB7:
.LSM48:
	.set ___PA___,1
	lnk	#0
	mov.d	w8,[w15++]
	mov.d	w10,[w15++]
	mov	w0,w4
.LSM49:
	mov	#_prCsgNomAcc,w5
	mov.d	[w5++],w8
	mov.d	[w5--],w10
	mov.d	w8,[w4++]
	mov.d	w10,[w4--]
.LSM50:
	mov	w4,w0
	mov.d	[--w15],w10
	mov.d	[--w15],w8
	ulnk	
	return	
	.set ___PA___,0
.LFE7:
	.align	2
	.global	_csgGetFinalPos	; export
	.type	_csgGetFinalPos,@function
_csgGetFinalPos:
.LFB8:
.LSM51:
	.set ___PA___,1
	lnk	#0
	mov.d	w8,[w15++]
	mov.d	w10,[w15++]
	mov	w0,w4
.LSM52:
	mov	#_prCsgFinalPos,w5
	mov.d	[w5++],w8
	mov.d	[w5--],w10
	mov.d	w8,[w4++]
	mov.d	w10,[w4--]
.LSM53:
	mov	w4,w0
	mov.d	[--w15],w10
	mov.d	[--w15],w8
	ulnk	
	return	
	.set ___PA___,0
.LFE8:
	.align	2
	.global	_csgGetState	; export
	.type	_csgGetState,@function
_csgGetState:
.LFB9:
.LSM54:
	.set ___PA___,1
	lnk	#0
.LSM55:
	mov	_prCsgStatus,w4
.LSM56:
	mov	w4,w0
	ulnk	
	return	
	.set ___PA___,0
.LFE9:
	.align	2
	.global	_csgCompute	; export
	.type	_csgCompute,@function
_csgCompute:
.LFB10:
.LSM57:
	.set ___PA___,1
	lnk	#14
	mov.d	w8,[w15++]
	mov.d	w10,[w15++]
.LSM58:
	clr	w4
	mov	w4,[w14+4]
.LSM59:
	mov	#_prCsgFinalPos,w4
	mov.d	[w4],w6
	mov	#_prCsgPos,w4
	mov.d	[w4],w4
	mov.d	w4,w2
	mov.d	w6,w0
	rcall	___subsf3
	mov.d	w0,w4
	mov.b	#1,w8
	mul.uu	w2,#0,w2
		
	mov.d	w4,w0
	rcall	___ltsf2
	mov	w0,w4
	sub	w4,#0,[w15]
	.set ___BP___,0
	bra	lt,.L24
	clr.b	w8
.L24:
	sub.b	w8,#0,[w15]
	.set ___BP___,0
	bra	z,.L25
	mov	#_prCsgFinalPos,w4
	mov.d	[w4],w6
	mov	#_prCsgPos,w4
	mov.d	[w4],w4
	mov.d	w4,w2
	mov.d	w6,w0
	rcall	___subsf3
	mov.d	w0,w4
	btg	w5,#15
	bra	.L26
.L25:
	mov	#_prCsgFinalPos,w4
	mov.d	[w4],w6
	mov	#_prCsgPos,w4
	mov.d	[w4],w4
	mov.d	w4,w2
	mov.d	w6,w0
	rcall	___subsf3
	mov.d	w0,w4
.L26:
	mov	w4,[w14+6]
	mov	w5,[w14+8]
.LSM60:
	mov	#_prMinDist,w4
	mov.d	[w4],w4
	mov.b	#1,w8
	mov	[w14+6],w2
	mov	[w14+8],w3
	mov.d	w4,w0
	rcall	___gesf2
	mov	w0,w4
	sub	w4,#0,[w15]
	.set ___BP___,0
	bra	ge,.L27
	clr.b	w8
.L27:
	sub.b	w8,#0,[w15]
	.set ___BP___,0
	bra	z,.L28
.LSM61:
	mov	#_prCsgVel,w6
	mul.uu	w4,#0,w4
		
	mov.d	w4,[w6]
.LSM62:
	mov	#_prCsgFinalPos,w4
	mov.d	[w4],w4
	mov	#_prCsgPos,w6
	mov.d	w4,[w6]
	bra	.L29
.L28:
.LSM63:
	mov	#1,w4
	mov	w4,[w14+4]
.LSM64:
	mov	#_prCsgVel,w4
	mov.d	[w4],w6
	mov	#_prCsgVel,w4
	mov.d	[w4],w4
	mov.d	w4,w2
	mov.d	w6,w0
	rcall	___mulsf3
	mov.d	w0,w4
	mov	w4,[w14+10]
	mov	w5,[w14+12]
.LSM65:
	mov	#_prCsgPos,w4
	mov.d	[w4],w8
	mov	#_prCsgVel,w4
	mov.d	[w4],w4
	mov	#55050,w2
	mov	#15395,w3
	mov.d	w4,w0
	rcall	___mulsf3
	mov.d	w0,w4
	mov.d	w4,w2
	mov.d	w8,w0
	rcall	___addsf3
	mov.d	w0,w4
	mov.d	w4,w8
	mov	#_prCsgVel,w4
	mov.d	[w4],w4
	mov.b	#1,w10
	mul.uu	w2,#0,w2
		
	mov.d	w4,w0
	rcall	___ltsf2
	mov	w0,w4
	sub	w4,#0,[w15]
	.set ___BP___,0
	bra	lt,.L30
	clr.b	w10
.L30:
	sub.b	w10,#0,[w15]
	.set ___BP___,0
	bra	z,.L31
	mov	#0,w4
	mov	#49024,w5
	bra	.L32
.L31:
	mov	#0,w4
	mov	#16256,w5
.L32:
	mov	[w14+10],w2
	mov	[w14+12],w3
	mov.d	w4,w0
	rcall	___mulsf3
	mov.d	w0,w4
	mov.d	w4,w10
	mov	#_prCsgNomAcc,w4
	mov.d	[w4],w4
	mov.d	w4,w2
	mov.d	w4,w0
	rcall	___addsf3
	mov.d	w0,w4
	mov.d	w4,w2
	mov.d	w10,w0
	rcall	___divsf3
	mov.d	w0,w4
	mov.d	w4,w2
	mov.d	w8,w0
	rcall	___addsf3
	mov.d	w0,w4
	mov	w4,[w14+6]
	mov	w5,[w14+8]
.LSM66:
	mov	#_prCsgPos,w4
	mov.d	[w4],w6
	mov	#_prCsgFinalPos,w4
	mov.d	[w4],w4
	mov.b	#1,w8
	mov.d	w4,w2
	mov.d	w6,w0
	rcall	___ltsf2
	mov	w0,w4
	sub	w4,#0,[w15]
	.set ___BP___,0
	bra	lt,.L33
	clr.b	w8
.L33:
	sub.b	w8,#0,[w15]
	.set ___BP___,0
	bra	z,.L34
.LSM67:
	mov	#_prCsgFinalPos,w4
	mov.d	[w4],w4
	mov.b	#1,w8
	mov	[w14+6],w2
	mov	[w14+8],w3
	mov.d	w4,w0
	rcall	___ltsf2
	mov	w0,w4
	sub	w4,#0,[w15]
	.set ___BP___,0
	bra	lt,.L35
	clr.b	w8
.L35:
	sub.b	w8,#0,[w15]
	.set ___BP___,0
	bra	z,.L36
.LSM68:
	mov	#_prCsgPos,w4
	mov.d	[w4],w6
	mov	#_prCsgFinalPos,w4
	mov.d	[w4],w4
	mov.d	w4,w2
	mov.d	w6,w0
	rcall	___subsf3
	mov.d	w0,w4
	mov.d	w4,w2
	mov.d	w4,w0
	rcall	___addsf3
	mov.d	w0,w4
	mov.d	w4,w2
	mov	[w14+10],w0
	mov	[w14+12],w1
	rcall	___divsf3
	mov.d	w0,w4
	mov.d	w4,[w14]
	bra	.L37
.L36:
.LSM69:
	mov	#_prCsgVel,w4
	mov.d	[w4],w6
	mov	#_prCsgNomVel,w4
	mov.d	[w4],w4
	mov.b	#1,w8
	mov.d	w4,w2
	mov.d	w6,w0
	rcall	___ltsf2
	mov	w0,w4
	sub	w4,#0,[w15]
	.set ___BP___,0
	bra	lt,.L38
	clr.b	w8
.L38:
	sub.b	w8,#0,[w15]
	.set ___BP___,0
	bra	z,.L39
.LSM70:
	mov	#_prCsgVel,w4
	mov.d	[w4],w8
	mov	#_prCsgNomVel,w4
	mov.d	[w4],w10
	mov	#_prCsgNomAcc,w4
	mov.d	[w4],w4
	mov	#55050,w2
	mov	#15395,w3
	mov.d	w4,w0
	rcall	___mulsf3
	mov.d	w0,w4
	mov.d	w4,w2
	mov.d	w10,w0
	rcall	___subsf3
	mov.d	w0,w4
	mov.b	#1,w10
	mov.d	w4,w2
	mov.d	w8,w0
	rcall	___ltsf2
	mov	w0,w4
	sub	w4,#0,[w15]
	.set ___BP___,0
	bra	lt,.L40
	clr.b	w10
.L40:
	sub.b	w10,#0,[w15]
	.set ___BP___,0
	bra	z,.L41
.LSM71:
	mov	#_prCsgNomAcc,w4
	mov	[w4++],[w14++]
	mov	[w4--],[w14--]
	bra	.L37
.L41:
.LSM72:
	mov	#_prCsgNomVel,w4
	mov.d	[w4],w6
	mov	#_prCsgVel,w4
	mov.d	[w4],w4
	mov.d	w4,w2
	mov.d	w6,w0
	rcall	___subsf3
	mov.d	w0,w4
	mov	#0,w2
	mov	#17096,w3
	mov.d	w4,w0
	rcall	___mulsf3
	mov.d	w0,w4
	mov.d	w4,[w14]
	bra	.L37
.L39:
.LSM73:
	mul.uu	w4,#0,w4
		
	mov.d	w4,[w14]
	bra	.L37
.L34:
.LSM74:
	mov	#_prCsgFinalPos,w4
	mov.d	[w4],w4
	mov.b	#1,w8
	mov	[w14+6],w2
	mov	[w14+8],w3
	mov.d	w4,w0
	rcall	___gtsf2
	mov	w0,w4
	sub	w4,#0,[w15]
	.set ___BP___,0
	bra	gt,.L42
	clr.b	w8
.L42:
	sub.b	w8,#0,[w15]
	.set ___BP___,0
	bra	z,.L43
.LSM75:
	mov	#_prCsgPos,w4
	mov.d	[w4],w6
	mov	#_prCsgFinalPos,w4
	mov.d	[w4],w4
	mov.d	w4,w2
	mov.d	w6,w0
	rcall	___subsf3
	mov.d	w0,w4
	mov.d	w4,w2
	mov.d	w4,w0
	rcall	___addsf3
	mov.d	w0,w4
	mov.d	w4,w2
	mov	[w14+10],w0
	mov	[w14+12],w1
	rcall	___divsf3
	mov.d	w0,w4
	mov.d	w4,[w14]
	bra	.L37
.L43:
.LSM76:
	mov	#_prCsgVel,w4
	mov.d	[w4],w6
	mov	#_prCsgNomVel,w4
	mov.d	[w4],w4
	btg	w5,#15
	mov.b	#1,w8
	mov.d	w4,w2
	mov.d	w6,w0
	rcall	___gtsf2
	mov	w0,w4
	sub	w4,#0,[w15]
	.set ___BP___,0
	bra	gt,.L44
	clr.b	w8
.L44:
	sub.b	w8,#0,[w15]
	.set ___BP___,0
	bra	z,.L45
.LSM77:
	mov	#_prCsgVel,w4
	mov.d	[w4],w8
	mov	#_prCsgNomAcc,w4
	mov.d	[w4],w4
	mov	#55050,w2
	mov	#15395,w3
	mov.d	w4,w0
	rcall	___mulsf3
	mov.d	w0,w4
	mov.d	w4,w6
	mov	#_prCsgNomVel,w4
	mov.d	[w4],w4
	mov.d	w4,w2
	mov.d	w6,w0
	rcall	___subsf3
	mov.d	w0,w4
	mov.b	#1,w10
	mov.d	w4,w2
	mov.d	w8,w0
	rcall	___gtsf2
	mov	w0,w4
	sub	w4,#0,[w15]
	.set ___BP___,0
	bra	gt,.L46
	clr.b	w10
.L46:
	sub.b	w10,#0,[w15]
	.set ___BP___,0
	bra	z,.L47
.LSM78:
	mov	#_prCsgNomAcc,w4
	mov.d	[w4],w4
	btg	w5,#15
	mov.d	w4,[w14]
	bra	.L37
.L47:
.LSM79:
	mov	#_prCsgNomVel,w4
	mov.d	[w4],w6
	mov	#_prCsgVel,w4
	mov.d	[w4],w4
	mov.d	w4,w2
	mov.d	w6,w0
	rcall	___addsf3
	mov.d	w0,w4
	btg	w5,#15
	mov	#0,w2
	mov	#17096,w3
	mov.d	w4,w0
	rcall	___mulsf3
	mov.d	w0,w4
	mov.d	w4,[w14]
	bra	.L37
.L45:
.LSM80:
	mul.uu	w4,#0,w4
		
	mov.d	w4,[w14]
.L37:
.LSM81:
	mov	#_prCsgPos,w4
	mov.d	[w4],w8
	mov	#_prCsgVel,w4
	mov.d	[w4],w4
	mov	#55050,w2
	mov	#15395,w3
	mov.d	w4,w0
	rcall	___mulsf3
	mov.d	w0,w4
	mov.d	w4,w10
	mov	#46871,w2
	mov	#14417,w3
	mov.d	[w14],w0
	rcall	___mulsf3
	mov.d	w0,w4
	mov.d	w4,w2
	mov.d	w10,w0
	rcall	___addsf3
	mov.d	w0,w4
	mov.d	w4,w2
	mov.d	w8,w0
	rcall	___addsf3
	mov.d	w0,w4
	mov	#_prCsgPos,w6
	mov.d	w4,[w6]
.LSM82:
	mov	#_prCsgVel,w4
	mov.d	[w4],w8
	mov	#55050,w2
	mov	#15395,w3
	mov.d	[w14],w0
	rcall	___mulsf3
	mov.d	w0,w4
	mov.d	w4,w2
	mov.d	w8,w0
	rcall	___addsf3
	mov.d	w0,w4
	mov	#_prCsgVel,w6
	mov.d	w4,[w6]
.L29:
.LSM83:
	mov	#_prCsgFinalPos,w4
	mov	[w4+4],w6
	mov	[w4+6],w7
	mov	#_prCsgPos,w4
	mov	[w4+6],w5
	mov	[w4+4],w4
	mov.d	w4,w2
	mov.d	w6,w0
	rcall	___subsf3
	mov.d	w0,w4
	mov.b	#1,w8
	mul.uu	w2,#0,w2
		
	mov.d	w4,w0
	rcall	___ltsf2
	mov	w0,w4
	sub	w4,#0,[w15]
	.set ___BP___,0
	bra	lt,.L48
	clr.b	w8
.L48:
	sub.b	w8,#0,[w15]
	.set ___BP___,0
	bra	z,.L49
	mov	#_prCsgFinalPos,w4
	mov	[w4+4],w6
	mov	[w4+6],w7
	mov	#_prCsgPos,w4
	mov	[w4+6],w5
	mov	[w4+4],w4
	mov.d	w4,w2
	mov.d	w6,w0
	rcall	___subsf3
	mov.d	w0,w4
	btg	w5,#15
	bra	.L50
.L49:
	mov	#_prCsgFinalPos,w4
	mov	[w4+4],w6
	mov	[w4+6],w7
	mov	#_prCsgPos,w4
	mov	[w4+6],w5
	mov	[w4+4],w4
	mov.d	w4,w2
	mov.d	w6,w0
	rcall	___subsf3
	mov.d	w0,w4
.L50:
	mov	#_prMinDist,w6
	mov	[w6+6],w7
	mov	[w6+4],w6
	mov.b	#1,w8
	mov.d	w6,w2
	mov.d	w4,w0
	rcall	___lesf2
	mov	w0,w4
	sub	w4,#0,[w15]
	.set ___BP___,0
	bra	le,.L51
	clr.b	w8
.L51:
	sub.b	w8,#0,[w15]
	.set ___BP___,0
	bra	z,.L52
.LSM84:
	mov	#_prCsgVel,w6
	mul.uu	w4,#0,w4
		
	mov	w4,[w6+4]
	mov	w5,[w6+6]
.LSM85:
	mov	#_prCsgFinalPos,w4
	mov	[w4+6],w5
	mov	[w4+4],w4
	mov	#_prCsgPos,w6
	mov	w4,[w6+4]
	mov	w5,[w6+6]
	bra	.L53
.L52:
.LSM86:
	mov	#1,w4
	mov	w4,[w14+4]
.LSM87:
	mov	#_prCsgVel,w4
	mov	[w4+4],w6
	mov	[w4+6],w7
	mov	#_prCsgVel,w4
	mov	[w4+6],w5
	mov	[w4+4],w4
	mov.d	w4,w2
	mov.d	w6,w0
	rcall	___mulsf3
	mov.d	w0,w4
	mov	w4,[w14+10]
	mov	w5,[w14+12]
.LSM88:
	mov	#_prCsgPos,w4
	mov	[w4+4],w8
	mov	[w4+6],w9
	mov	#_prCsgVel,w4
	mov	[w4+6],w5
	mov	[w4+4],w4
	mov	#55050,w2
	mov	#15395,w3
	mov.d	w4,w0
	rcall	___mulsf3
	mov.d	w0,w4
	mov.d	w4,w2
	mov.d	w8,w0
	rcall	___addsf3
	mov.d	w0,w4
	mov.d	w4,w8
	mov	#_prCsgVel,w4
	mov	[w4+6],w5
	mov	[w4+4],w4
	mov.b	#1,w10
	mul.uu	w2,#0,w2
		
	mov.d	w4,w0
	rcall	___ltsf2
	mov	w0,w4
	sub	w4,#0,[w15]
	.set ___BP___,0
	bra	lt,.L54
	clr.b	w10
.L54:
	sub.b	w10,#0,[w15]
	.set ___BP___,0
	bra	z,.L55
	mov	#0,w4
	mov	#49024,w5
	bra	.L56
.L55:
	mov	#0,w4
	mov	#16256,w5
.L56:
	mov	[w14+10],w2
	mov	[w14+12],w3
	mov.d	w4,w0
	rcall	___mulsf3
	mov.d	w0,w4
	mov.d	w4,w10
	mov	#_prCsgNomAcc,w4
	mov	[w4+6],w5
	mov	[w4+4],w4
	mov.d	w4,w2
	mov.d	w4,w0
	rcall	___addsf3
	mov.d	w0,w4
	mov.d	w4,w2
	mov.d	w10,w0
	rcall	___divsf3
	mov.d	w0,w4
	mov.d	w4,w2
	mov.d	w8,w0
	rcall	___addsf3
	mov.d	w0,w4
	mov	w4,[w14+6]
	mov	w5,[w14+8]
.LSM89:
	mov	#_prCsgPos,w4
	mov	[w4+4],w6
	mov	[w4+6],w7
	mov	#_prCsgFinalPos,w4
	mov	[w4+6],w5
	mov	[w4+4],w4
	mov.b	#1,w8
	mov.d	w4,w2
	mov.d	w6,w0
	rcall	___ltsf2
	mov	w0,w4
	sub	w4,#0,[w15]
	.set ___BP___,0
	bra	lt,.L57
	clr.b	w8
.L57:
	sub.b	w8,#0,[w15]
	.set ___BP___,0
	bra	z,.L58
.LSM90:
	mov	#_prCsgFinalPos,w4
	mov	[w4+6],w5
	mov	[w4+4],w4
	mov.b	#1,w8
	mov	[w14+6],w2
	mov	[w14+8],w3
	mov.d	w4,w0
	rcall	___ltsf2
	mov	w0,w4
	sub	w4,#0,[w15]
	.set ___BP___,0
	bra	lt,.L59
	clr.b	w8
.L59:
	sub.b	w8,#0,[w15]
	.set ___BP___,0
	bra	z,.L60
.LSM91:
	mov	#_prCsgPos,w4
	mov	[w4+4],w6
	mov	[w4+6],w7
	mov	#_prCsgFinalPos,w4
	mov	[w4+6],w5
	mov	[w4+4],w4
	mov.d	w4,w2
	mov.d	w6,w0
	rcall	___subsf3
	mov.d	w0,w4
	mov.d	w4,w2
	mov.d	w4,w0
	rcall	___addsf3
	mov.d	w0,w4
	mov.d	w4,w2
	mov	[w14+10],w0
	mov	[w14+12],w1
	rcall	___divsf3
	mov.d	w0,w4
	mov.d	w4,[w14]
	bra	.L61
.L60:
.LSM92:
	mov	#_prCsgVel,w4
	mov	[w4+4],w6
	mov	[w4+6],w7
	mov	#_prCsgNomVel,w4
	mov	[w4+6],w5
	mov	[w4+4],w4
	mov.b	#1,w8
	mov.d	w4,w2
	mov.d	w6,w0
	rcall	___ltsf2
	mov	w0,w4
	sub	w4,#0,[w15]
	.set ___BP___,0
	bra	lt,.L62
	clr.b	w8
.L62:
	sub.b	w8,#0,[w15]
	.set ___BP___,0
	bra	z,.L63
.LSM93:
	mov	#_prCsgVel,w4
	mov	[w4+4],w8
	mov	[w4+6],w9
	mov	#_prCsgNomVel,w4
	mov	[w4+4],w10
	mov	[w4+6],w11
	mov	#_prCsgNomAcc,w4
	mov	[w4+6],w5
	mov	[w4+4],w4
	mov	#55050,w2
	mov	#15395,w3
	mov.d	w4,w0
	rcall	___mulsf3
	mov.d	w0,w4
	mov.d	w4,w2
	mov.d	w10,w0
	rcall	___subsf3
	mov.d	w0,w4
	mov.b	#1,w10
	mov.d	w4,w2
	mov.d	w8,w0
	rcall	___ltsf2
	mov	w0,w4
	sub	w4,#0,[w15]
	.set ___BP___,0
	bra	lt,.L64
	clr.b	w10
.L64:
	sub.b	w10,#0,[w15]
	.set ___BP___,0
	bra	z,.L65
.LSM94:
	mov	#_prCsgNomAcc,w4
	mov	[w4+4],w6
	mov	[w4+6],w7
	mov.d	w6,[w14]
	bra	.L61
.L65:
.LSM95:
	mov	#_prCsgNomVel,w4
	mov	[w4+4],w6
	mov	[w4+6],w7
	mov	#_prCsgVel,w4
	mov	[w4+6],w5
	mov	[w4+4],w4
	mov.d	w4,w2
	mov.d	w6,w0
	rcall	___subsf3
	mov.d	w0,w4
	mov	#0,w2
	mov	#17096,w3
	mov.d	w4,w0
	rcall	___mulsf3
	mov.d	w0,w4
	mov.d	w4,[w14]
	bra	.L61
.L63:
.LSM96:
	mul.uu	w4,#0,w4
		
	mov.d	w4,[w14]
	bra	.L61
.L58:
.LSM97:
	mov	#_prCsgFinalPos,w4
	mov	[w4+6],w5
	mov	[w4+4],w4
	mov.b	#1,w8
	mov	[w14+6],w2
	mov	[w14+8],w3
	mov.d	w4,w0
	rcall	___gtsf2
	mov	w0,w4
	sub	w4,#0,[w15]
	.set ___BP___,0
	bra	gt,.L66
	clr.b	w8
.L66:
	sub.b	w8,#0,[w15]
	.set ___BP___,0
	bra	z,.L67
.LSM98:
	mov	#_prCsgPos,w4
	mov	[w4+4],w6
	mov	[w4+6],w7
	mov	#_prCsgFinalPos,w4
	mov	[w4+6],w5
	mov	[w4+4],w4
	mov.d	w4,w2
	mov.d	w6,w0
	rcall	___subsf3
	mov.d	w0,w4
	mov.d	w4,w2
	mov.d	w4,w0
	rcall	___addsf3
	mov.d	w0,w4
	mov.d	w4,w2
	mov	[w14+10],w0
	mov	[w14+12],w1
	rcall	___divsf3
	mov.d	w0,w4
	mov.d	w4,[w14]
	bra	.L61
.L67:
.LSM99:
	mov	#_prCsgVel,w4
	mov	[w4+4],w6
	mov	[w4+6],w7
	mov	#_prCsgNomVel,w4
	mov	[w4+6],w5
	mov	[w4+4],w4
	btg	w5,#15
	mov.b	#1,w8
	mov.d	w4,w2
	mov.d	w6,w0
	rcall	___gtsf2
	mov	w0,w4
	sub	w4,#0,[w15]
	.set ___BP___,0
	bra	gt,.L68
	clr.b	w8
.L68:
	sub.b	w8,#0,[w15]
	.set ___BP___,0
	bra	z,.L69
.LSM100:
	mov	#_prCsgVel,w4
	mov	[w4+4],w8
	mov	[w4+6],w9
	mov	#_prCsgNomAcc,w4
	mov	[w4+6],w5
	mov	[w4+4],w4
	mov	#55050,w2
	mov	#15395,w3
	mov.d	w4,w0
	rcall	___mulsf3
	mov.d	w0,w4
	mov.d	w4,w6
	mov	#_prCsgNomVel,w4
	mov	[w4+6],w5
	mov	[w4+4],w4
	mov.d	w4,w2
	mov.d	w6,w0
	rcall	___subsf3
	mov.d	w0,w4
	mov.b	#1,w10
	mov.d	w4,w2
	mov.d	w8,w0
	rcall	___gtsf2
	mov	w0,w4
	sub	w4,#0,[w15]
	.set ___BP___,0
	bra	gt,.L70
	clr.b	w10
.L70:
	sub.b	w10,#0,[w15]
	.set ___BP___,0
	bra	z,.L71
.LSM101:
	mov	#_prCsgNomAcc,w4
	mov	[w4+6],w5
	mov	[w4+4],w4
	btg	w5,#15
	mov.d	w4,[w14]
	bra	.L61
.L71:
.LSM102:
	mov	#_prCsgNomVel,w4
	mov	[w4+4],w6
	mov	[w4+6],w7
	mov	#_prCsgVel,w4
	mov	[w4+6],w5
	mov	[w4+4],w4
	mov.d	w4,w2
	mov.d	w6,w0
	rcall	___addsf3
	mov.d	w0,w4
	btg	w5,#15
	mov	#0,w2
	mov	#17096,w3
	mov.d	w4,w0
	rcall	___mulsf3
	mov.d	w0,w4
	mov.d	w4,[w14]
	bra	.L61
.L69:
.LSM103:
	mul.uu	w4,#0,w4
		
	mov.d	w4,[w14]
.L61:
.LSM104:
	mov	#_prCsgPos,w4
	mov	[w4+4],w8
	mov	[w4+6],w9
	mov	#_prCsgVel,w4
	mov	[w4+6],w5
	mov	[w4+4],w4
	mov	#55050,w2
	mov	#15395,w3
	mov.d	w4,w0
	rcall	___mulsf3
	mov.d	w0,w4
	mov.d	w4,w10
	mov	#46871,w2
	mov	#14417,w3
	mov.d	[w14],w0
	rcall	___mulsf3
	mov.d	w0,w4
	mov.d	w4,w2
	mov.d	w10,w0
	rcall	___addsf3
	mov.d	w0,w4
	mov.d	w4,w2
	mov.d	w8,w0
	rcall	___addsf3
	mov.d	w0,w4
	mov	#_prCsgPos,w6
	mov	w4,[w6+4]
	mov	w5,[w6+6]
.LSM105:
	mov	#_prCsgVel,w4
	mov	[w4+4],w8
	mov	[w4+6],w9
	mov	#55050,w2
	mov	#15395,w3
	mov.d	[w14],w0
	rcall	___mulsf3
	mov.d	w0,w4
	mov.d	w4,w2
	mov.d	w8,w0
	rcall	___addsf3
	mov.d	w0,w4
	mov	#_prCsgVel,w6
	mov	w4,[w6+4]
	mov	w5,[w6+6]
.L53:
.LSM106:
	mov	[w14+4],w7
	mov	w7,_prCsgStatus
.LSM107:
	mov	_prCsgStatus,w4
.LSM108:
	mov	w4,w0
	mov.d	[--w15],w10
	mov.d	[--w15],w8
	ulnk	
	return	
	.set ___PA___,0
.LFE10:
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
.LSFDE12:
	.4byte	.LEFDE12-.LASFDE12
.LASFDE12:
	.4byte	.Lframe0
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.align	4
.LEFDE12:
.LSFDE14:
	.4byte	.LEFDE14-.LASFDE14
.LASFDE14:
	.4byte	.Lframe0
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.align	4
.LEFDE14:
.LSFDE16:
	.4byte	.LEFDE16-.LASFDE16
.LASFDE16:
	.4byte	.Lframe0
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.align	4
.LEFDE16:
.LSFDE18:
	.4byte	.LEFDE18-.LASFDE18
.LASFDE18:
	.4byte	.Lframe0
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.align	4
.LEFDE18:
.LSFDE20:
	.4byte	.LEFDE20-.LASFDE20
.LASFDE20:
	.4byte	.Lframe0
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.align	4
.LEFDE20:
	.section	.text,code
.Letext0:
	.section	.debug_info,info
	.4byte	0x3f1
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.asciz	"GNU C 4.5.1 (XC16, Microchip v1_21) (A) Build date: Jan  2 2014"
	.byte	0x1
	.asciz	"consigne.c"
	.asciz	"D:\\\\dev\\\\GitHub\\\\bULBot2015-mainRobot\\\\PropBoard2014-DC"
	.4byte	.Ltext0
	.4byte	.Letext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.asciz	"int"
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.asciz	"float"
	.uleb128 0x3
	.byte	0x8
	.byte	0x2
	.byte	0xc
	.4byte	0xcd
	.uleb128 0x4
	.asciz	"l"
	.byte	0x2
	.byte	0xd
	.4byte	0xa3
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x4
	.asciz	"r"
	.byte	0x2
	.byte	0xe
	.4byte	0xa3
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x5
	.asciz	"relativeCoord"
	.byte	0x2
	.byte	0xf
	.4byte	0xac
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.asciz	"char"
	.uleb128 0x6
	.byte	0x2
	.byte	0x3
	.byte	0x7
	.4byte	0x10f
	.uleb128 0x7
	.asciz	"CSG_STANDING"
	.sleb128 0
	.uleb128 0x7
	.asciz	"CSG_MOVING"
	.sleb128 1
	.byte	0x0
	.uleb128 0x5
	.asciz	"csgStatusType"
	.byte	0x3
	.byte	0xa
	.4byte	0xea
	.uleb128 0x8
	.byte	0x1
	.asciz	"csgInit"
	.byte	0x1
	.byte	0x14
	.byte	0x1
	.4byte	0x10f
	.4byte	.LFB0
	.4byte	.LFE0
	.byte	0x1
	.byte	0x5e
	.4byte	0x166
	.uleb128 0x9
	.asciz	"nomVel"
	.byte	0x1
	.byte	0x14
	.4byte	0xcd
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x9
	.asciz	"nomAcc"
	.byte	0x1
	.byte	0x14
	.4byte	0xcd
	.byte	0x2
	.byte	0x7e
	.sleb128 8
	.byte	0x0
	.uleb128 0xa
	.byte	0x1
	.asciz	"csgSetFinalPos"
	.byte	0x1
	.byte	0x27
	.byte	0x1
	.4byte	.LFB1
	.4byte	.LFE1
	.byte	0x1
	.byte	0x5e
	.4byte	0x19c
	.uleb128 0x9
	.asciz	"finalPos"
	.byte	0x1
	.byte	0x27
	.4byte	0xcd
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0xa
	.byte	0x1
	.asciz	"csgSetNomAcc"
	.byte	0x1
	.byte	0x2e
	.byte	0x1
	.4byte	.LFB2
	.4byte	.LFE2
	.byte	0x1
	.byte	0x5e
	.4byte	0x1ce
	.uleb128 0x9
	.asciz	"nomAcc"
	.byte	0x1
	.byte	0x2e
	.4byte	0xcd
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0xa
	.byte	0x1
	.asciz	"csgSetNomVel"
	.byte	0x1
	.byte	0x3e
	.byte	0x1
	.4byte	.LFB3
	.4byte	.LFE3
	.byte	0x1
	.byte	0x5e
	.4byte	0x200
	.uleb128 0x9
	.asciz	"nomVel"
	.byte	0x1
	.byte	0x3e
	.4byte	0xcd
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0xb
	.byte	0x1
	.asciz	"csgGetVel"
	.byte	0x1
	.byte	0x4c
	.byte	0x1
	.4byte	0xcd
	.4byte	.LFB4
	.4byte	.LFE4
	.byte	0x1
	.byte	0x5e
	.uleb128 0xb
	.byte	0x1
	.asciz	"csgGetPos"
	.byte	0x1
	.byte	0x51
	.byte	0x1
	.4byte	0xcd
	.4byte	.LFB5
	.4byte	.LFE5
	.byte	0x1
	.byte	0x5e
	.uleb128 0xb
	.byte	0x1
	.asciz	"csgGetNomVel"
	.byte	0x1
	.byte	0x56
	.byte	0x1
	.4byte	0xcd
	.4byte	.LFB6
	.4byte	.LFE6
	.byte	0x1
	.byte	0x5e
	.uleb128 0xb
	.byte	0x1
	.asciz	"csgGetNomAcc"
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.4byte	0xcd
	.4byte	.LFB7
	.4byte	.LFE7
	.byte	0x1
	.byte	0x5e
	.uleb128 0xb
	.byte	0x1
	.asciz	"csgGetFinalPos"
	.byte	0x1
	.byte	0x60
	.byte	0x1
	.4byte	0xcd
	.4byte	.LFB8
	.4byte	.LFE8
	.byte	0x1
	.byte	0x5e
	.uleb128 0xb
	.byte	0x1
	.asciz	"csgGetState"
	.byte	0x1
	.byte	0x65
	.byte	0x1
	.4byte	0x10f
	.4byte	.LFB9
	.4byte	.LFE9
	.byte	0x1
	.byte	0x5e
	.uleb128 0x8
	.byte	0x1
	.asciz	"csgCompute"
	.byte	0x1
	.byte	0x69
	.byte	0x1
	.4byte	0x10f
	.4byte	.LFB10
	.4byte	.LFE10
	.byte	0x1
	.byte	0x5e
	.4byte	0x31b
	.uleb128 0xc
	.asciz	"tmp"
	.byte	0x1
	.byte	0x6a
	.4byte	0xa3
	.byte	0x2
	.byte	0x7e
	.sleb128 6
	.uleb128 0xc
	.asciz	"acc"
	.byte	0x1
	.byte	0x6b
	.4byte	0xa3
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0xc
	.asciz	"sqrVel"
	.byte	0x1
	.byte	0x6c
	.4byte	0xa3
	.byte	0x2
	.byte	0x7e
	.sleb128 10
	.uleb128 0xc
	.asciz	"state"
	.byte	0x1
	.byte	0x6d
	.4byte	0x10f
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.byte	0x0
	.uleb128 0xd
	.4byte	.LASF0
	.byte	0x1
	.byte	0xa
	.4byte	0xcd
	.byte	0x1
	.byte	0x1
	.uleb128 0xd
	.4byte	.LASF1
	.byte	0x1
	.byte	0xb
	.4byte	0xcd
	.byte	0x1
	.byte	0x1
	.uleb128 0xd
	.4byte	.LASF2
	.byte	0x1
	.byte	0xc
	.4byte	0xcd
	.byte	0x1
	.byte	0x1
	.uleb128 0xd
	.4byte	.LASF3
	.byte	0x1
	.byte	0xd
	.4byte	0xcd
	.byte	0x1
	.byte	0x1
	.uleb128 0xd
	.4byte	.LASF4
	.byte	0x1
	.byte	0xe
	.4byte	0xcd
	.byte	0x1
	.byte	0x1
	.uleb128 0xd
	.4byte	.LASF5
	.byte	0x1
	.byte	0xf
	.4byte	0xcd
	.byte	0x1
	.byte	0x1
	.uleb128 0xd
	.4byte	.LASF6
	.byte	0x1
	.byte	0x10
	.4byte	0x10f
	.byte	0x1
	.byte	0x1
	.uleb128 0xe
	.4byte	.LASF0
	.byte	0x1
	.byte	0xa
	.4byte	0xcd
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	_prCsgPos
	.uleb128 0xe
	.4byte	.LASF1
	.byte	0x1
	.byte	0xb
	.4byte	0xcd
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	_prCsgFinalPos
	.uleb128 0xe
	.4byte	.LASF2
	.byte	0x1
	.byte	0xc
	.4byte	0xcd
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	_prCsgVel
	.uleb128 0xe
	.4byte	.LASF3
	.byte	0x1
	.byte	0xd
	.4byte	0xcd
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	_prCsgNomVel
	.uleb128 0xe
	.4byte	.LASF4
	.byte	0x1
	.byte	0xe
	.4byte	0xcd
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	_prCsgNomAcc
	.uleb128 0xe
	.4byte	.LASF5
	.byte	0x1
	.byte	0xf
	.4byte	0xcd
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	_prMinDist
	.uleb128 0xe
	.4byte	.LASF6
	.byte	0x1
	.byte	0x10
	.4byte	0x10f
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	_prCsgStatus
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
	.uleb128 0xb
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
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x5
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
	.uleb128 0x6
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
	.uleb128 0x7
	.uleb128 0x28
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0x0
	.byte	0x0
	.uleb128 0x8
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
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0xb
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0xc
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
	.uleb128 0xd
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
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
	.uleb128 0xe
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
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
	.4byte	0x129
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x3f5
	.4byte	0x124
	.asciz	"csgInit"
	.4byte	0x166
	.asciz	"csgSetFinalPos"
	.4byte	0x19c
	.asciz	"csgSetNomAcc"
	.4byte	0x1ce
	.asciz	"csgSetNomVel"
	.4byte	0x200
	.asciz	"csgGetVel"
	.4byte	0x21d
	.asciz	"csgGetPos"
	.4byte	0x23a
	.asciz	"csgGetNomVel"
	.4byte	0x25a
	.asciz	"csgGetNomAcc"
	.4byte	0x27a
	.asciz	"csgGetFinalPos"
	.4byte	0x29c
	.asciz	"csgGetState"
	.4byte	0x2bb
	.asciz	"csgCompute"
	.4byte	0x376
	.asciz	"prCsgPos"
	.4byte	0x388
	.asciz	"prCsgFinalPos"
	.4byte	0x39a
	.asciz	"prCsgVel"
	.4byte	0x3ac
	.asciz	"prCsgNomVel"
	.4byte	0x3be
	.asciz	"prCsgNomAcc"
	.4byte	0x3d0
	.asciz	"prMinDist"
	.4byte	0x3e2
	.asciz	"prCsgStatus"
	.4byte	0x0
	.section	.debug_pubtypes,info
	.4byte	0x32
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x3f5
	.4byte	0xcd
	.asciz	"relativeCoord"
	.4byte	0x10f
	.asciz	"csgStatusType"
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
	.byte	0x0
	.asciz	"consigne.c"
	.uleb128 0x0
	.uleb128 0x0
	.uleb128 0x0
	.asciz	"Globals.h"
	.uleb128 0x0
	.uleb128 0x0
	.uleb128 0x0
	.asciz	"consigne.h"
	.uleb128 0x0
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
	.byte	0x27
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM1
	.byte	0x15
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
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM5
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM6
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM7
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM8
	.byte	0x15
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
	.4byte	.LSM12
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM13
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM14
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM15
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
	.4byte	.LSM16
	.byte	0x3a
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM17
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM18
	.byte	0x15
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
	.4byte	.LFE1
	.byte	0x0
	.uleb128 0x1
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM21
	.byte	0x41
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM22
	.byte	0x15
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
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM26
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM27
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM28
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM29
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM30
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
	.4byte	.LSM31
	.byte	0x51
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM32
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM33
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM34
	.byte	0x16
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
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM38
	.byte	0x16
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
	.4byte	.LSM39
	.byte	0x5f
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM40
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM41
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
	.4byte	.LSM42
	.byte	0x64
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM43
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM44
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LFE5
	.byte	0x0
	.uleb128 0x1
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM45
	.byte	0x69
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM46
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM47
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LFE6
	.byte	0x0
	.uleb128 0x1
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM48
	.byte	0x6e
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM49
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM50
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LFE7
	.byte	0x0
	.uleb128 0x1
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM51
	.byte	0x73
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
	.4byte	.LFE8
	.byte	0x0
	.uleb128 0x1
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM54
	.byte	0x78
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM55
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM56
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LFE9
	.byte	0x0
	.uleb128 0x1
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM57
	.byte	0x7c
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM58
	.byte	0x1a
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM59
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM60
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM61
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM62
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM63
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM64
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM65
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM66
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM67
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM68
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM69
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM70
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM71
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM72
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM73
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM74
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM75
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM76
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM77
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM78
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM79
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM80
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM81
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM82
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM83
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM84
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM85
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM86
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM87
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM88
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM89
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM90
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM91
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM92
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM93
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM94
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM95
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM96
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM97
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM98
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM99
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM100
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM101
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM102
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM103
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM104
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM105
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM106
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM107
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM108
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LFE10
	.byte	0x0
	.uleb128 0x1
	.byte	0x1
.LELT0:
	.section	.debug_str,info
.LASF2:
	.asciz	"prCsgVel"
.LASF5:
	.asciz	"prMinDist"
.LASF0:
	.asciz	"prCsgPos"
.LASF4:
	.asciz	"prCsgNomAcc"
.LASF1:
	.asciz	"prCsgFinalPos"
.LASF6:
	.asciz	"prCsgStatus"
.LASF3:
	.asciz	"prCsgNomVel"
	.section	.text,code

	.section __c30_signature, info, data
	.word 0x0001
	.word 0x0000
	.word 0x0000

; MCHP configuration words

	.set ___PA___,0
	.end
