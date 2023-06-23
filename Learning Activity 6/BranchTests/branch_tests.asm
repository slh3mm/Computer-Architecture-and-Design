; SRC Assembly File:  br_tst.asm
;
; Tests assembling and processing of the branching instructions.
; This test is best done with breakpoints and stepping.
; The program loads a number of addresses into registers r1->r11
; and then uses all of the branching instructions to perform
; simple looping actions.  Branch and link addresses are loaded
; into registers r12->r16.  The tester must monitor the statements
; executed to confirm that control is properly passed based on 
; the register values used.  
;
; Warning: altering, inserting or moving any instructions will invalidate
; the comments and the validity of the tests.
		.org	0		; 0x0000 - start of ROM
		la	r31, Main	; Reset action: load addess label, Main
		br	r31		; branch to Main

		.org 4096
; load a bunch of branch addresses for branch tests:
Main:		la r1, Jump1	; put address of Jump1 (0x1040) in r1
		la r2, Jump2		; put address of Jump2 (0x1050) in r2
		la r3, Jump3		; put address of Jump3 (0x105c) in r3
		la r4, Jump4		; put address of Jump4 (0x1068) in r4
		la r5, Jump5		; put address of Jump5 (0x1074) in r5
		la r6, Jump6		; put address of Jump6 (0x1080) in r6
		la r7, Jump7		; put address of Jump7 (0x1094) in r7
		la r8, Jump8		; put address of Jump8 (0x10b8) in r8
		la r9, Jump9		; put address of Jump9 (0x10c4) in r9
		la r10, Jump10		; put address of Jump10 (0x10d0) in r10
		la r11, Jump11		; put address of Jump11 (0x10dc) in r11
		la r20, Stop		; put address of Stop (0x10e8) in r20
		nop			; 
 Loop5:		addi r31, r0, 5		; put 5 in r31 for loop control
		br r1			; branch unconditionally to Jump1
		addi r31, r31, 1	; r31 value should NOT change (remains 5)
 Jump1: 	addi r31, r31, -1	; decrement r31 (loop counter)
		brzr r2, r31		; branch to Jump2 when counter r31 is zero
		brnv			; don't branch
		br r1			; otherwise loop back to Jump1
 Jump2:		la r30, 7		; set a new loop counter in r30 to 7
		brmi r3, r30		; branch to Jump3 should NOT occur, r30 is not negative
		nop			; no-op
 Jump3:		addi r30, r30, -1	; decrement r30
		brmi r4, r30		; branch to Jump4 when r30 is negative
		br r3			; otherwise loop back to Jump3
 Jump4:		la r29, -6		; set a new loop counter in r29 to -6
		brpl r5, r29		; branch to Jump5 should NOT occur, r29 is not positive
		nop			;
 Jump5:		addi r29, r29, 1	; incremement r29
		brpl r6, r29		; branch to Jump6 if loop counter r29 is positive (>=0)
		br r5			; otherwise loop back to Jump5
 Jump6:		brnz r7, r28		; branch to Jump7 should NOT occur, r28 is zero
		sub r28, r28, r30	; subtract -1 (add 1) from r28
		brnz r7, r28		; branch to Jump7 should now occur
		add r28, r28, r30	; r28 should NOT be decremented by this command
		nop			; this nop should also be skipped
 Jump7:		la r24, 5		; set a new loop counter in r24 to 5
		brl r12, r8		; save PC in r12 and branch to Jump8
		brlzr r13, r9, r24	; then save PC in r13 and branch to Jump9 (r24 should be 0)
		add r30, r30, r30	; decrement r30 to -2
		brlmi r14, r10, r30	; then save PC in r14 and branch to Jump10 (r30 should be -2)
		brlnv r15		; no branch, just save PC in r15
		brlnz r16, r11, r28	; then save PC in r16 and branch to Jump11 (r28 should be 1)
		nop			; continue after brl
		br r20			; branch to stop
 Jump8:		addi r24, r24, -1	; decrement r24
		brzr r12, r24		; return to original loop when r24 is zero
		br r8
 Jump9:		addi r24, r24, 1	; increment r24
		brnz r13, r24		; return to original loop when r24 is nonzero
		br r9
 Jump10:	addi r30, r30, 1	; increment r30
		brpl r14, r30		; return to original loop when r30 is >=0
		br r10
 Jump11:	addi r28, r28, -1	; decrement r28
		brmi r16, r28		; return to original loop when r28 is <0
		br r11
 Stop:		stop
	
