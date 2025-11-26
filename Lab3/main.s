		INCLUDE core_cm4_constants.s
		INCLUDE stm32l476xx_constants.s

		AREA main, CODE, READONLY
		EXPORT __main
		ENTRY
__main PROC
	
		;Enables the GPIO port clock using the RCC_AHB2ENR register
		LDR r0, =(RCC_BASE + RCC_AHB2ENR)
		LDR r1, [r0]
		ORR r1, #RCC_AHB2ENR_GPIOBEN
		STR r1, [r0]
		
		;Set the pin mode to digital output using the GPOIB_MODER register
		LDR r0, =(GPIOB_BASE+GPIO_MODER)
		LDR r1, [r0]
		BIC r1, r1, #(0x03<<(2*2))
		ORR r1, r1, #(1<<(2*2))
		STR r1, [r0]
		
		;Enables the GPIO port clock using the RCC_AHB2ENR register
		LDR r0, =(RCC_BASE + RCC_AHB2ENR)
		LDR r1, [r0]
		ORR r1, #RCC_AHB2ENR_GPIOEEN
		STR r1, [r0]
		
		;Set the pin mode to digital output using the GPOIE_MODER register
		LDR r0, =(GPIOE_BASE+GPIO_MODER)
		LDR r1, [r0]
		BIC r1, r1, #(0x03<<(2*8))
		ORR r1, r1, #(1<<(2*8))
		STR r1, [r0]
		
		;Set the pin to high to turn on the green LED
endless	LDR r0, =(GPIOE_BASE+GPIO_ODR)
		LDR r1, [r0]
		ORR r1, r1, #GPIO_ODR_ODR_8
		STR r1, [r0]

		MOV r0, #0x00100010
		MOV r1, #0
loop1	ADD r1, #1
		CMP r0, r1
		BNE loop1

		;Set the pin to high to turn off the green LED
		LDR r0, =(GPIOE_BASE+GPIO_ODR)
		LDR r1, [r0]
		BIC r1, r1, #GPIO_ODR_ODR_8
		STR r1, [r0]

		;Set the pin to high to turn on the red LED
		LDR r0, =(GPIOB_BASE+GPIO_ODR)
		LDR r1, [r0]
		ORR r1, r1, #GPIO_ODR_ODR_2
		STR r1, [r0]
		
		MOV r0, #0x00100010
		MOV r1, #0
loop2	ADD r1, #1
		CMP r0, r1
		BNE loop2
		
		;Set the pin to high to turn off the red LED
		LDR r0, =(GPIOB_BASE+GPIO_ODR)
		LDR r1, [r0]
		BIC r1, r1, #GPIO_ODR_ODR_2
		STR r1, [r0]
		b endless
		
		ENDP

		ALIGN

		END