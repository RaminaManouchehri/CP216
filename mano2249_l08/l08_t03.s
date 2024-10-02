/*
-------------------------------------------------------
l08_t03.s
-------------------------------------------------------
Author:
ID:
Email:
Date:    2024-02-21
-------------------------------------------------------
Uses a subroutine to read strings from the UART into memory.
-------------------------------------------------------
*/
.org 0x1000   // Start at memory location 1000
.text         // Code section
.global _start
_start:

bl    EchoString

_stop:
b _stop

// Subroutine constants
.equ UART_BASE, 0xff201000  // UART base address
.equ VALID, 0x8000          // Valid data in UART mask
.equ ENTER, 0x0A            // The enter key code

EchoString:
/*
-------------------------------------------------------
Echoes a string from the UART to the UART.
-------------------------------------------------------
Uses:
  r0 - holds character to print
  r1 - address of UART
-------------------------------------------------------
*/
    // Preserve temporary registers
    stmfd sp!, {r0, r1}

    // Load UART base address
    ldr r1, =UART_BASE

EchoLoop:
    // Read character from UART
    ldr r0, [r1]
    tst r0, #VALID          // Check if there is new data
    beq _EchoString         // If no data, exit loop
    cmp r0, #ENTER          // Check if Enter key is pressed
    beq _EchoString         // If Enter key is pressed, exit loop
    
    // Echo character
    cmp   r0, #0           // Check if null terminator is found
    beq   _EchoString      // If null terminator found, exit loop

    // Write character back to UART
    str r0, [r1]          // Write the character back to UART

    b EchoLoop             // Repeat loop

_EchoString:
    // Restore temporary registers
    ldmfd sp!, {r0, r1}

    // Return from subroutine
    bx lr