;******************** (C) Ayden Dauenhauer *******************************************
; @file    HW7 Problem 2
; @author  Ayden Dauenhauer
; @date    2023
;*************************************************************************************

	
			AREA    main, CODE, READONLY
			EXPORT __main
			ENTRY

__main 	PROC
	
			ldr 	r0, =strarray ; Pointer to array of string pointers
			ldr 	r1, =7 ; Number of pointers in strarray
			bl	 	mysort ; Call sorting routine
endless 	b 		endless

		ENDP

mysort 		PROC
			push 	{lr} ; Stores the return address
			mov 	r2, r0 ; Copies the array address to r2 to be changed later
loop1		sub		r1, r1, #1 ; Decrements the count
			mov 	r7, r1 ; Second counter for iterating the compare
			mov 	r3, r2 ; Set the start of the range
			mov 	r4, r3 ; Set to the next address part 1
			add 	r4, r4, #4 ; Set to the next address part 2
			bl 		compare_and_swap
			bx 		lr
			ENDP

compare_and_swap 	PROC
					push {r4-r7} ; Save registers
compareloop	ldr 	r5, [r3], #4 ; Load the address of the first string and increment
			ldr 	r6, [r4], #4 ; Load the address of the next string and increment
			push 	{r3-r4} ; Save r3 and r4
			bl		 strcmp ; Call string compare function
			pop 	{r3-r4} ; Restore r3 and r4
			cmp 	r0, #0 ; Check strcmp result
			bgt 	nextsmaller ; If r5 > r6 then swap
			sub 	r7, r7, #1 ; Decrement the count
			cmp 	r7, #0 ; Check if it's at the end of the list
			bgt 	compareloop ; If not, then keep comparing
			pop 	{r4-r7} ; Restore registers
			bx 		lr

nextsmaller	mov 	r3, r4 ; Swap the smallest number into r3
			b 		compareloop ; Go back to the compare function
			ENDP

strcmp 		PROC
			push 	{r4-r7, lr}
			mov 	r4, r5 ; Move first string address to r4
			mov		r5, r6 ; Move second string address to r5
strloop		ldrb 	r6, [r4], #1 ; Load byte from first string and increment
			ldrb 	r7, [r5], #1 ; Load byte from second string and increment
			cmp 	r6, r7 ; Compare bytes
			bne 	strdone ; If different, exit loop
			cmp 	r6, #0 ; Check if end of string
			beq 	strdone ; If end, exit loop
			b 		strloop ; Repeat for next character
strdone		sub 	r0, r6, r7 ; Set result for comparison
			pop 	{r4-r7, pc} ; Restore registers and return
			bx		lr
			
			ENDP

			AREA mydata, DATA, READONLY
strarray	DCD str1, str2, str3, str4, str5, str6, str7
str1 		DCB "First string",0
str2 		DCB "Second string",0
str3 		DCB "So, do I really need a third string",0
str4 		DCB "Tetraphobia is the fear of the number 4",0
str5 		DCB "A is for apple",0
str6 		DCB "Z is called 'zed' in Canada",0
str7 		DCB "M is for middle",0
END