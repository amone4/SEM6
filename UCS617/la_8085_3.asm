// H-L PAIR STORES THE BASE ADDRESS
MVI H,80H
MVI L,00H

// B STORES THE SUM
MVI B,00H

LOOP:
	MOV A,M
	ADD B
	MOV B,A

	INR L
	MOV A,L
	SUI 0AH
JNZ LOOP

HLT