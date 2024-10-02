/*
-------------------------------------------------------
l08_t02.s
-------------------------------------------------------
Author:
ID:
Email:
Date:    2024-02-21
-------------------------------------------------------
Uses a subroutine to read strings from the UART into memory.
-------------------------------------------------------
*/
// Constants
.equ SIZE, 20 // Size of string buffer storage (bytes)

.org 0x1000   // Start at memory location 1000
.text         // Code section
.global _start
_start:

//=======================================================

// your code here
mov r5, #SIZE

//=======================================================

ldr    r4, =First
bl    ReadString
ldr    r4, =Second
bl    ReadString
ldr    r4, =Third
bl     ReadString
ldr    r4, =Last
bl     ReadString

_stop:
b _stop

// Subroutine constants
.equ UART_BASE, 0xff201000  // UART base address
.equ ENTER, 0x0A            // The enter key code
.equ VALID, 0x8000          // Valid data in UART mask

ReadString:
/*
-------------------------------------------------------
Reads an ENTER terminated string from the UART.
-------------------------------------------------------
Parameters:
  r4 - address of string buffer
  r5 - size of string buffer
Uses:
  r0 - holds character to print
  r1 - address of UART
-------------------------------------------------------
*/

//=======================================================

// your code here
stmfd sp!, {r0, r1, r4, r5}
ldr r1, =UART_BASE
add r5, r4, #SIZE //store address of the end of string buffer

ReadLoop:
ldr r0, [r1] //read the UART data register
tst r0, #VALID //check if there is new data
beq _ReadString
cmp r0, #ENTER //check if enter is found
beq _ReadString //if enter is found return
strb r0, [r4] //store the character in memory
add r4, r4, #1 // move to next bye of storage buffer
cmp r4, r5 //check if buffer is full
beq _ReadString //return if bufferfull
b ReadLoop

_ReadString:
ldmfd sp!, {r0, r1, r4, r5} //recover temporary registers

//=======================================================

bx    lr                    // return from subroutine

.data
.align
// The list of strings
First:
.space  SIZE
Second:
.space SIZE
Third:
.space SIZE
Last:
.space SIZE
_Last:    // End of list address

.end