		AREA main, CODE, READONLY
		EXPORT __main
		ENTRY
__main PROC

		LDR r0, =Array1 ;initialize r0 with address of Array1
		MOV r1, #12 ;count of numbers in array
		MOV r5, #1 ;sets i variable
		MOV r6, #7 ;number of loop iterations
loop 	LDR r2, [r0]
		CMP r5, r6 ; checks if r5 and r6 are equal
		BEQ endless
		ADDS r2, r2, #5 ;adds 5 to the 'i' element in array
		ADDS r5, r5, #1 ;adds 1 to i to represent iteration
		STR r2, [r0]
		ADD r0, r0, #4 ; r1 points to next number in Array1
		BNE loop
endless B endless
		ENDP

		ALIGN
Array1 DCD 12, 17, 5, 11, -2, -1, -4, 6, -3, 0, 69, 420 ; twelve 32-bit numbers

		END