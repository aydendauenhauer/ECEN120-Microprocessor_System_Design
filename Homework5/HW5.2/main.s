			AREA    main, CODE, READONLY
			EXPORT	__main				
			ENTRY			
				
__main	PROC
	
			ldr 	r0, =data
			ldr 	r1, =eodata
			ldr		r2, =(output-data)
			mov 	r3, #0xF0000000
			mov		r6, #0
loop 		ldr		r4, [r0]
			ands	r5, r3, #0x80000000
			addne	r6, r6, r4
			strne	r6, [r0, r2]
			lsl		r3, #1
			add 	r0, #4
			cmp 	r0, r1
			bne		loop

endless		b			endless

		ENDP
		ALIGN
data	dcd			9,3,-1,0,8,-5,0,11,0x33
eodata
		ALIGN
output	dcd			0,0,0,0,0,0,0,0,0		
eooutputdata	
		END