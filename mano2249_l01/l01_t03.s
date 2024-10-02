/*
-------------------------------------------------------
intro.s
-------------------------------------------------------
Author: Ramina Manouchehri  
ID:    169042249  
Email:  mano2249@mylaurier.ca 
Date:    Tuesday Jan 23
-------------------------------------------------------
Assign to and add contents of registers.
-------------------------------------------------------
*/
.org 0x1000  // Start at memory location 1000
.text        // Code section
.global _start
_start:

mov r0, #9       // Store decimal 9 in register r0
mov r1, #14    // Store hex E (decimal 14) in register r1
mov r3, #8     // Store value 8 in register r3
add r3, r3, r3   // Add the contents of r3 and r3 and put result in r3
add r4, r0, #5   // Add the contents of r0 and 5 and put result in r4
add r2, r1, r0  // Add the contents of r0 and r1 and put result in r2

// End program
_stop:
b _stop