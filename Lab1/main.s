				AREA main, CODE, READONLY
				EXPORT __main
				ENTRY
__main PROC

		LDR r1, =num1		
		LDR r2, =num2		
		LDR r3, [r1]		
		LDR r4, [r2]		
		MUL r5, r3, r3		
		MUL r6, r4, r4		
		ADD r7, r5, r6	
		STR r7, [r2, #4]
		
endless B endless

		ENDP

		ALIGN
num1 DCD 0x05
num2 DCD 0x03
result DCD 0x22

		END