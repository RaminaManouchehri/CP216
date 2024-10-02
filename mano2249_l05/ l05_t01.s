/*
-------------------------------------------------------
l05_t01.s
-------------------------------------------------------
Author:
ID:
Email:
Date:    2024-02-21
-------------------------------------------------------
Does a running total of an integer list.
-------------------------------------------------------
*/
.org 0x1000  // Start at memory location 1000
.text        // Code section
.global _start
_start:

ldr    r1, =Data    // Store address of start of list
ldr    r2, =_Data   // Store address of end of list
bl     list_total   // Call subroutine - total returned in r0

_stop:
b      _stop

//-------------------------------------------------------
list_total:
/*
-------------------------------------------------------
Totals values in a list.
Equivalent of: int total(*start, *end)
-------------------------------------------------------
Parameters:
  r1 - start address of list
  r2 - end address of list
Uses:
  r3 - temporary value
Returns:
  r0 - total of values in list
-------------------------------------------------------
*/

// your code here 
stmfd   sp!, {r1-r3} 
Loop:  
ldr r3, [r1], #4
add r0, r0, r3
cmp r2, r1
bne Loop 
ldmfd   sp!, {r1-r3}
bx lr
.data
.align
Data:
.word   4,5,-9,0,3,0,8,-7,12    // The list of data
_Data: // End of list address

.end