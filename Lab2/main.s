		AREA main, CODE, READONLY
		EXPORT __main
		ENTRY
__main PROC

		LDR r1, =result ;initializes r1 with address of result
		LDR r0, =num1 ;initialize r0 with address of num1
		LDR r2, =num2 ;initialize r2 with address of num2
		LDR r3, =num3 ;initialize r3 with address of num3
		LDR r4, [r0] ;initialize r4 with value of num1
		LDR r5, [r2] ;initialize r5 with value of num2
		LDR r6, [r3] ;initialize r6 with value of num3
		CMP r4, r5 ;compares r4 to r5
		BLT part2 ;if r4 < r5, compare r4 with r6
		CMP r5, r6 ;if r4 > r5, compare r5 with r6
		BLT store5 ;if r5 < r6, store r1(result) with r5
		STR r6, [r1] ;if r5 > r6, store r1(result) with r6

part2	CMP r4, r6 ;compares r4 to r6
		BLT store4 ;if r4 < r6 store r4
		STR r6, [r1] ;if r4 > r6 store r6
		B endless
		
store4 	STR r4, [r1] ;stores r4
		B endless

store5	STR r5, [r1] ;stores r5

endless B endless
		ENDP

		ALIGN
num1 	DCD 0x03247
num2 	DCD 0x05431
num3 	DCD 0x01120
result 	DCD 0
		END