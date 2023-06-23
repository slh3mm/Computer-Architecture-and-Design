; SRC Assembly File:  alu_tst.asm
;
; Tests assembling and processing of the alu and shift instructions.
; ALU instructions are used to fill registers r1->r15 with the 
; values 1->15.  Then two rows of registers r16->r23 are filled
; with identifiable strings (mostly 'f') to observe proper bit
; manipulations.  Finally, registers r24->r31 are again filled with
; their values 24->31 (easily confirmed in decimal viewing mode).
;
; Warning: altering, inserting or moving any instructions will invalidate
; the comments and the validity of the tests.

		.org	0		; 0x0000 - start of ROM
		la	r31, Main	; Reset action: load addess label, Main
		br	r31		; branch to Main
	
		.org 4096
 One: 		.equ 1			; define constant for value = 1
 Main:		addi r1, r0, One	; put 1 in r1 using a constant label
 Two:		add r2, r1, r1		; add 1 and 1 for 2 in r2
 Three:		or r3, r1, r2		; OR 1 and 2 for 3 in r3
 Four:		add r4, r1, r3		; add 1 and 3 for 4 in r4
		nop			; toss in a nop
 Six:		add r6, r4, r2		; add 4 and 2 for 6 in r6
 Five:		sub r5, r6, r1		; subtract 1 from 6 for 5 in r5
 Seven:		ori r7, r4, 3		; OR 4 and 3 for 7 in r7
 Ten:		addi r10, r7, 3		; add 7 and 3 for 10 in r10
		neg r8, r2		; neg 2 for -2 in r8
 Eight:		add r8, r10, r8		; add -2 and 10 for 8 in r8
 Nine:		addi r9, r10, -1	; add 10 and -1 for 9 in r9
 TwentySeven:	addi r27, r7, 0x14	; add 7 and 20 (as hex value) for 27 in r27 (binary ...00011011)
 Fifteen:	add r15, r9, r6 	; add 9 and 6 for 15 in r15  (binary ...00001111)
 Eleven:	and r11, r15, r27	; AND 15 and 27 for 11 in r11
		nop
	; perform bit manipulations using identifiable strings
		nop
		not r16, r1		; NOT of 1 = (1111...1110) = fffffffe = -2 in r16
		shr r17, r16, r1	; shift r16 right 1 (in r1) for (0111....1111) = 7ffffff in r17
		and r18, r17, r16	; AND r16 and r17 for (0111...1110) = 7ffffffe in r18
		shc r19, r18, 16	; circular shift r18 left 16 (in c3) for fffe7fff in r19
		shl r20, r15, 28	; shift 15 left 28 (in c3) for (1111...0000) = f0000000 in r20
		shc r21, r20, r8	; circular shift r20 left 8 (in r8) for 000000f0 in r21
		shra r23, r20, 31; shift r20 right 31 (in c3) for (1111...1111) = ffffffff = -1 in r23
 MinusOne:	sub r22, r0, r1		; subtract 1 from 0 for -1 in r22 = ffffffff
		nop
	; resume filling registers with register values (i.e., 12 in r12, etc.)
		nop
 Twelve:	andi r12, r17, 12 	; AND r17 and 12 (in c3) to put 12 in r12
		shr r13, r17, 29	; shift r17 right 29 (in c3) for 3 in r13
		shl r13, r13, r2	; shift r13 left 2 (in r2) for 12 in r13
 Thirteen:	add r13, r13, r1	; add 1 to 12 for 13 in r13 
		shra r14, r18, r27	; shift r18 right 27 (in r27) arithmetic for 15 in r14
 Fourteen:	sub r14, r14, r1	; subtract 1 (in r1) from 15 in r14 for 14 in r14
 TwentyFour:	shl r24, r6, r2		; shift 6 left by 2 (in r2) multiplying by 4 for 24 in r24
 TwentyFive:	add r25, r27, r16	; 2's-complement add 27 to -2 (in r16) for 25 in r25
 TwentySix:	add r26, r24, r2	; add 24 and 2 for 26 in r26
 TwentyEight:	shl r28, r14, 1		; shift 14 left 1 (in c3) for 28 in r28
 three:		.equ 3			; define constant for value = 3
 ThirtyOne:	ori r31, r28, three	; OR 28 and 3 (in c3 as constant label) for 31 in r31
 TwentyNine:	addi r29, r31, -2	; add 31 and -2 (in c3) for 29 in r29
		shr r30, r31, 1		; shift 31 right by 1 (in c3) for 15 in r30
 Thirty:	shl r30, r30, 1		; shift 15 left by 1 (in c3) for 30 in r30	
		stop
