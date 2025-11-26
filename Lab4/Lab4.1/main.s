		AREA main, CODE, READONLY
		EXPORT __main
		ENTRY

__main PROC
		
		LDR r1, =list ;Address of list in r1
		MOV r2, #7 ;Number of elements in list, n
		LDR r3, [r1]
		BL store
		MOV r2, #7
		MOV r0, #0
		BL sum
		
endless B endless

store	PUSH {r3}
		ADD r1, #4 ;Goes next
		LDR r3, [r1]
		SUB r2, #1 ;Decrements
		CMP r2, #0 ;Compares
		BNE store
		BX lr
		
sum		POP {r3}
		ADD r0, r3 ;Add current to r0 for total sum
		SUB r2, #1 ;Decrements
		CMP r2, #0 ;Compares
		BNE sum
		BX lr

		ENDP
		ALIGN

list	DCD 69,420,6,9,-4,2,0 ;Array of n 32 bit ints

END