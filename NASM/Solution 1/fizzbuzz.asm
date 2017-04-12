%include "io.inc"

section .data
fizz        db      'Fizz', 0x00
buzz        db      'Buzz', 0x00

section .text
global CMAIN
CMAIN:
    
; # of arguments is indicated by ecx when program is loaded
; we're only going to be accessing the first argument, though
; and we're also assuming that it is a valid positive number

; the program will then loop from 0 to the number provided in STDIN (console argument)
; and print the iterator if it is not divisible by 3 or 5. If the iterator is divisible by 3,
; then Fizz will be printed instead. If the iterator is divisible by 5, then Buzz will be printed instead.
; If the iterator is divisible by both 3 and 5, then FizzBuzz will be printed instead.

; division remainders are stored in the edx register following the operation


    call    quit

    
;-------------------------------
; string itoa(int number)
; Converts an integer to ASCII
    
;-------------------------------
; int atoi(string number)
; Converts ASCII to an integer

;------------------------------
; void iprint(int msg)
; Prints an integer

;------------------------------
; void iprintLF(int msg)
; Prints an integer with trailing linefeed

;------------------------------
; void sprint(string msg)
; Prints a string

;------------------------------
; void sprintLF(int msg)
; Prints a string with trailing linefeed

;------------------------------
; void quit(void)
; Exits program

quit:
   xor      ebx, ebx
   mov      eax, 1
   int      80h
   ret