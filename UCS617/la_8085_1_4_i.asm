MVI B,35H
MVI C,00H
MVI D,35H
MVI E,01H

LDAX B
MOV H,A
LDAX D
ADD H
HLT