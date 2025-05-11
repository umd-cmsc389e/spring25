// Fibonacci Program


// Clear number display
LDI r15 clear_number
STR r15 r0

// Set number display to unsigned mode
LDI r15 unsigned_mode
STR r15 r0

// Declare index variable
LDI r13 0 // i
LDI r14 12 // j

LDI r1 0
LDI r2 1
LDI r15 show_number
STR r15 r2 // show the number

.loop
CMP r13 r14
BRH eq .endloop // end loop if i == j

ADD r1 r2 r3 // r3 = r1 + r2
MOV r2 r1 // r1 = r2
MOV r3 r2 // r2 = r3

LDI r15 show_number
STR r15 r2 // show the number

ADI r13 1 // i++

JMP .loop
.endloop

HLT