; SRC Assembly File:  ldst_tst.asm
;
; Tests assembling and processing of the load and store instructions
; as well as most of the pseudo-ops.  Register is initialized with a 
; value of 0x2000 and then the remaining registers are filled row-by-row
; with the row values (i.e., registers r4->r7 are filled with 2's for 
; row 2, r8-r11 are filled with 3's, etc.).
;
; Memory starting at 0x2000 is then alternately (every other word) 
; filled with values from 1 to 8.  This is followed by four empty
; words.  Then bytes are filled with values from 1 to 21 immediately
; followed by 3 bytes = 0xff7fff.  Six words are then skipped and 
; finally values from 1-10 are loaded as half-words and then offset
; by one byte and input again as half-words to test the byte-based
; memory.  Finally, string literals are stored in byte-wise, halfword-
; wise, and word-wise using various ".org" settings to space out the
; strings in memory.
;
; Warning: altering, inserting or moving any instructions will invalidate
; the comments and the validity of the tests.
	.org	0		; 0x0000 - start of ROM
	la	r31, Main	; Reset action: load addess label, Main
	br	r31		; branch to Main

	.org 4096	  	; 0x1000, to make it easy
Addr1:	.equ 32785	  	; set a constant
Main:	lar r0, OneR	  	; c1 should be 0x0ffc;  r0 should be 0x8000
    	la r1, 1	  	; c2 should be 1;       r1 should be 1
	str r1, OneR	  	; c1 should be 0x0ff4;  loc 0x8000 should be 1 
	ldr r2, OneR       	; c1 should be 0x0ff0;  r2 should be 1
	ldr r3, OneR       	; c1 should be 0x0fec;  r3 should be 1
	la r4, 2          	; c2 should be 2;       r4 should be 2
	st r4, TwoR       	; c2 should be 0x8008;  loc 0x8008 should be 2  
	ld r5, TwoR        	; c2 should be 0x8008;  r5 should be 2
	ldr r6, TwoR       	; c1 should be 0x0fe4;  r6 should be 2
	ldr r7, TwoR       	; c1 should be 0x0fe0;  r7 should be 2
	la r8, 3          	; c2 should be 3;       r8 should be 3
	st r8, ThreeR      	; c2 should be 0x8014;  loc 0x8014 should be 3  
	ldr r9, ThreeR     	; c1 should be 0x0fe0;  r9 should be 3
	ld r10, ThreeR     	; c2 should be 0x8014;  r10 should be 3
	ld r11, Addr1(r10)	; c2 should be 0x8011;  r11 should be 3
	ldr r12, Four     	; c1 should be 0x0fdc;  r12 should be 4
	la r13, 4         	; c2 should be 4;       r13 should be 4
	ld r14, 8216(r13) 	; c2 should be 0x2018;  r14 should be 4
	ldr r15, Four     	; c1 should be 0x0fd0;  r15 should be 4
	la r16, 5         	; c2 should be 5;       r16 should be 5
	la r17, 5         	; c2 should be 5;       r17 should be 5
	ld r18, 8219(r16) 	; c2 should be 0x201b;  r18 should be 5
	ld r19, 8224      	; c2 should be 0x2020;  r19 should be 5
	la r20, 6         	; c2 should be 6;       r20 should be 6
	st r20, 32808      	; c1 should be 0x8028;  loc 0x2028 should be 6 
	ld r21, 32807(r1)  	; c2 should be 0x8027;  r21 should be 6
	ld r22, 32808      	; c2 should be 0x8028;  r22 should be 6
	la r23, 6         	; c2 should be 6;       r23 should be 6
	la r24, 7         	; c2 should be 7;       r24 should be 7
	str r24, SevenR    	; c1 should be 0x0fbc;  loc 0x8034 should be 7 
	ld r25, SevenR     	; c2 should be 0x8034;  r25 should be 7
	ld r26, 32814(r22) 	; c2 should be 0x802e;  r26 should be 7
	ldr r27, SevenR    	; c1 should be 0x0fb0;  r27 should be 7
	la r28, 8         	; c2 should be 8;       r28 should be 8
	st r28, EightR     	; c1 should be 0x803c;  loc 0x803c should be 8 
	ldr r29, EightR    	; c1 should be 0x0fac;  r29 should be 8
	ld r30, EightR     	; c2 should be 0x803c;  r30 should be 8
	ld r31, 32820(r30) 	; c2 should be 0x8034;  r31 should be 8
	stop

 ORG_test1:  .org 8192   	; relocate to 0x2000
 One:        .dw 1       	; reserve one word at 0x2000, uninitialized
 DW_test1:   .dw 1       	; skip 1 word at 0x2004
 Two:        .dw 1       	; reserve one word at 0x2008, uninitialized
 DW_test2:   .dw 2       	; skip 2 words at 0x200c
 Three:      .dw 1       	; reserve one word at 0x2014, uninitialized
 Unused3:    .dw 1       	; skip 1 word 0x2018
 Four:       .dc 4       	; reserve one word at 0x201c, initialized to 4
 Five:	     .dc 5,0,0   	; reserve three words starting at 0x2020, initialized
 DH_test1:   .dh 4       	; skip 2 words as 4 halfwords at 0x202c
 Seven:      .dw 1       	; reserve one word at 0x2034, uninitialized
 DB_test1:   .db 4       	; skip 1 word as 4 bytes at 0x2038
 Eight:      .dw 1       	; reserve one word at 0x203c, uninitialized

 ORG_test2:  .org 8272   	; relocate to 0x2050 (instr at 0x2040)
 DCB_test1:  .dcb 1      	; reserve one byte at 0x2050, initialized
 DCB_test2:  .dcb 2,3    	; reserve two bytes at 0x2051, initialized
 DCB_test3:  .dcb 4,5,6  	; reserve three bytes at 0x2053, initialized
 DCB_test4:  .dcb 7,8,9,10      ; reserve four bytes at 0x2056, initialized
 DCB_test5:  .dcb 11,12,13,14,15    	; reserve five bytes at 0x205a, initialized
 DCB_test6:  .dcb 16,17,18,19,20,21 	; reserve six bytes at 0x205f, initialized
 DCB_test7:  .dcb -1       	; reserve 1 byte at 2065, initialized
 DCB_test8:  .dcb 127, -1 	; reserve 2 bytes at 2066, initialized 

 ORG_test3:  .org 8320     	; relocate to 0x2080
 DCH_test1:  .dch 1        	; reserve one halfword at 0x2080, initialized
 DCH_test2:  .dch 2,3      	; reserve two halfwords at 0x2082, initialized
 DCH_test3:  .dch 4,5,6    	; reserve three halfwords at 0x2086, initialized
 DCH_test4:  .dch 7,8,9,10 	; reserve four halfwords at 0x208c, initialized
 Skip1:      .dw 2         	; skip 2 words at 0x2094
 ;
 ; repeat initializing halfwords at off-word boundaries
 ;
 Skip2:      .db 3         	; skip 3 bytes at 0x209c
 DCH_test5:  .dch 1        	; reserve one halfword at 0x209f, initialized
 DCH_test6:  .dch 2,3      	; reserve two halfwords at 0x20a1, initialized
 DCH_test7:  .dch 4,5,6    	; reserve three halfwords at 0x20a5, initialized
 DCH_test8:  .dch 7,8,9,10 	; reserve four halfwords at 0x20ab, initialized
 ;
 ; test string literal storage
 ;
 ORG_test4:  .org 0x20c0  ; relocate to 0x20c0 (0x hex format)
 DCB_test9:  .dcb "abcdefghijklmnopqrstuvwxyz0123456789"      ; reserve a long string (byte-wise) at 0x20c0
 ORG_test5:  .org 2100H   ; relocate to 2100H (alternative hex format)
 DCB_test10: .dch "abcdefghijklmnopqrstuvwxyz0123456789"      ; reserve a long string (halfword-wise) at 0x2100
 orgconst:   .equ 0x2160  ; set const using hex value
 ORG_test6:  .org orgconst  ; relocate to 0x2160 using label
 DCB_test11: .dc "abcdefghijklmnopqrstuvwxyz0123456789"       ; reserve a long string (word-wise) at 0x2160

 ORG_testR:  	.org 32768   	; relocate to 0x8000
 OneR:        	.dw 1       	; reserve one word at 0x8000, uninitialized
 DW_test1R:   	.dw 1       	; skip 1 word at 0x8004
 TwoR:        	.dw 1       	; reserve one word at 0x8008, uninitialized
 DW_test2R:   	.dw 2       	; skip 2 words at 0x800c
 ThreeR:      	.dw 1       	; reserve one word at 0x8014, uninitialized
 Unused3R:    	.dw 1       	; skip 1 word 0x8018
 FourR:       	.dc 4       	; reserve one word at 0x801c, initialized to 4
 FiveR:	     	.dc 5,0,0   	; reserve three words starting at 0x8020, initialized
 DH_test1R:   	.dh 4       	; skip 2 words as 4 halfwords at 0x802c
 SevenR:      	.dw 1       	; reserve one word at 0x8034, uninitialized
 DB_test1R:   	.db 4       	; skip 1 word as 4 bytes at 0x8038
 EightR:      	.dw 1       	; reserve one word at 0x803c, uninitialized
				; end of file comment
