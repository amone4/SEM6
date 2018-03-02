// PROGRAM WILL SORT 10 NUMBERS
MVI D,09H
LOOP:

	MVI H,80
	MVI L,00

	SORT:

		// LOADING THE TWO NUMBERS IN B AND A
		MOV A,M
		MOV B,A
		INR L
		MOV A,M
		DCR L

		CMP B
		JP NOTSWAP

		// SWAPPING NUMBERS IN B AND A
		MOV C,B
		MOV B,A
		JMP AFTERSWAP

		NOTSWAP:
			MOV C,A

		AFTERSWAP:
			// STORING B
			MOV M,B
			// STORING C
			INR L
			MOV M,C

		MOV A,L
		CMP D
	JM SORT

	DCR D
	MOV A,D
	CPI 00H
JP LOOP

HLT