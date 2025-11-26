		AREA main, CODE, READONLY
		EXPORT __main
		ENTRY
__main PROC

		LDR r0, =array ;initialize r0 with address of array
		LDR r1, =result ;initializes r1 with the address of result
		MOV r5, #0 ;sets i variable
		MOV r6, #10 ;number of loop iterations
loop 	LDR r2, [r0]
		CMP r5, r6
		BEQ endless
		MUL r3, r2, r2 ;square of r2
		ADD r4, r4, r3 ;summation
		ADDS r5, r5, #1 ;adds 1 to i to represent iteration
		STR r3, [r0]
		STR r4, [r1]
		ADD r0, r0, #4 ; r1 points to next number in Array1
		BNE loop
endless B endless
		ENDP

		ALIGN
array 	DCD 1, -5, 2, 1, 1, 0, 10, 0, -2, -1
result 	DCD 0

		END