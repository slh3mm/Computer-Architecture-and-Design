data1:	.equ	64		; first data
data2:	.equ	32		; second data

	.org	0		; 0x0000 - start of ROM
	la	r1, data1	; Load first data
	la	r2, data2	; Load second data
	add 	r3, r1, r2	; add tow data items together
	st	r3, Result	; store result
	ld	r4,Result	; load result back into r4 for memory test
	stop

	.org	32772		; 0x8004 - location in RAM
Result:	.dw	1		; storage for result
