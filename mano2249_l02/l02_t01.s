/*
-------------------------------------------------------
errors1.s
-------------------------------------------------------
Author:  Ramina Manouchehri
ID:      169042249
Email:   mano2249@mylaurier.ca
Date: 2024-02-02 
-------------------------------------------------------
Assign to and add contents of registers.
-------------------------------------------------------
*/
.org 0x1000  // Start at memory location 1000
.text        // Code section
.global _start
_start:

// Copy data from memory to registers
ldr r3, =A
ldr r0, [r3]
ldr r3, =B
ldr r1, [r3]
add r2, r1, r0
// Copy data to memory
ldr r3, =Result // Assign address of Result to r3
str r2, [r3] // Store contents of r2 to address in r3
// End program
_stop:
b _stop

.data      // Initialized data section
A:
.word 4
B:
.word 8
.bss     // Uninitialized data section
Result:
.space 4 // Set aside 4 bytes for result

.end