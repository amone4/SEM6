// MEMORY BLOCK 1 POINTED BY D-E
// MEMORY BLOCK 2 POINTED BY H-L
// DATA TRANSFER FROM H-L TO D-E

MVI H,80H
MVI L,00H

MVI D,90H
MVI E,00H

LOOP:
	MOV A,M
	STAX D

	INR L
	INR E
	MOV A,L
	SUI 0AH
JNZ LOOP

HLT