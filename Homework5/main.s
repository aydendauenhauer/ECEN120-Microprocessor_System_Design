			AREA    main, CODE, READONLY
			EXPORT	__main				
			ENTRY	

__main PROC
		LDR R0, =samplelist  ;Loads the address of samplelist into R0
		LDR R1, =resultlist  ;Loads the address of resultlist into R1
		MOV R2, #4           ;Number of 32-bit words in samplelist

loop	LDR R3, [R0], #4     ;Loads the next 32-bit word from samplelist into R3
		MOV R4, #0           ;Initializes the count to 0
		MOV R5, #31          ;Initializes the bit position (MSB to LSB)

bitloop LSL R6, R3, R5       ;Shifts R3 left by R5 bits and store in R6
		AND R6, R6, #0x80000000  ;Mask to check the MSB
		LSR R7, R3, R5       	 ;Shifts R3 right by R5 bits and store in R7
		AND R7, R7, #0x40000000  ;Mask to check the next bit
		CMP R6, R7           ;Compares the two bits
		BEQ no_increment     ;If equal, no increment
		ADD R4, R4, #1       ;Increments the count

no_increment	SUBS R5, R5, #1      ;Decrements the bit position
				BPL bitloop          ;Continues until all bits are checked
				STR R4, [R1], #4     ;Stores the count in resultlist and move to the next result
				SUBS R2, R2, #1      ;Decrements the word count
				BNE loop             ;Continues for the remaining words

endless b endless

ENDP
ALIGN

samplelist dcd 0x12345678, 0xbeeffeed, 0x55555555, 0xa5a5a5a5
eol1
resultlist dcd 0, 0, 0, 0
eol2