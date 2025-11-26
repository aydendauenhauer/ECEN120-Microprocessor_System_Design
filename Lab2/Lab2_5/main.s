		AREA main, CODE, READONLY
		EXPORT __main
		ENTRY
__main PROC

		LDR r0, =sequence ;initializes r0 with address of sequence i
		ADD r1, r0, #4 ;initializes r1 with address of sequence i + 1
		LDR r2, [r0] ;initializes r2 with value of sequence at i
		LDR r3, [r1] ;initializes r3 with value of sequence at i + 1
		MOV r4, #0 ;initializes r4 with 'i' which starts at 0
		MOV r5, #10 ;number of loop iterations
		
loop	ADD r6, r2, r3

		ADD r0, #4
		ADD r1, #4
		STR r6, [r1]
		ADD r4, #1
		LDR r2, [r0] ;initializes r2 with value of sequence at i
		LDR r3, [r1] ;initializes r3 with value of sequence at i + 1
		CMP r4, r5
		BEQ endless
		b loop

endless b endless
		ENDP

		ALIGN
sequence DCD 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
		END