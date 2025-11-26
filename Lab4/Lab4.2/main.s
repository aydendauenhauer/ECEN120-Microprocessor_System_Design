		AREA main, CODE, READONLY
		EXPORT __main
		ENTRY

__main PROC
		MOV r0, #3 ; p = 3
		BL fib	
endless B endless


fib		PUSH {lr}	;push load register to save position
		cmp r0, #0	;check if value is 0
		BEQ endif0	;break if 0
		b next		;continue if not 0
		
endif0 	mov r0, #0	;return 0
		b out		;leave
		
next	cmp r0, #1	;check if value is 1
		BEQ endif1	;break if 1
		b cont		;continue if not 1
		
endif1	add r2, #1	;return 1
		b out		;leave

cont	push {r0}	;stores our p value
		sub r0, #1	;gets p-1
		BL fib		;fib p-1
		pop {r0}	;gets p again
		sub r0, #2	;gets p-2
		BL fib		;fib p-2
		
		
		
out		pop{lr}		;gets return possition
		mov r0, r2
		bx lr		;returns

		ENDP
		ALIGN

END