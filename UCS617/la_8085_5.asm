// NUMBERS TO MULTIPLY ARE IN B-C
// RESULT OF MULTIPLICATION STORED IN A

MVI A,00H
MVI B,12H
MVI C,06H

LOOP:
	ADD B
	DCR C
JNZ LOOP

HLT