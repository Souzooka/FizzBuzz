%include "io.inc"

section .data
fizz        db      'Fizz', 0x00
buzz        db      'Buzz', 0x00

SECTION .bss
sinput:     resb    255

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    
; # of arguments is indicated by ecx when program is loaded
; we're only going to be accessing the first argument, though
; and we're also assuming that it is a valid positive number

; the program will then loop from 0 to the number provided in STDIN (console argument)
; and print the iterator if it is not divisible by 3 or 5. If the iterator is divisible by 3,
; then Fizz will be printed instead. If the iterator is divisible by 5, then Buzz will be printed instead.
; If the iterator is divisible by both 3 and 5, then FizzBuzz will be printed instead.

; division remainders are stored in the edx register following the operation

    xor     eax, eax
    xor     ecx, ecx
    xor     edx, edx
    xor     ebx, ebx
    xor     esi, esi
    xor     edi, edi
    
    mov     eax, 92
    call    iprintLF
    mov     eax, fizz
    call    sprintLF
    mov     eax, buzz
    call    sprintLF
    
    mov     edx, 255
    mov     ecx, sinput
    mov     ebx, 0
    mov     eax, 3
    int 80h
    
    mov     eax, sinput
    call    atoi
    call    iprintLF
    
    
    call    quit

    
;-------------------------------
; void iprint(int number)
; Converts an integer to ASCII and prints it
iprint:
    push    eax
    push    ecx
    push    edx
    push    esi
    xor     ecx, ecx

divideloop:
    inc     ecx
    mov     edx, 0
    mov     esi, 10
    idiv    esi
    add     edx, 0x30
    push    edx
    cmp     eax, 0
    jnz     divideloop
    
printloop:
    dec     ecx
    mov     eax, esp
    call    sprint
    pop     eax
    cmp     ecx, 0
    jnz     printloop
    
iprintfinished:
    pop     esi
    pop     edx
    pop     ecx
    pop     eax
    ret

;------------------------------
; void iprintLF(int msg)
; Prints an integer with trailing linefeed
iprintLF:
    call    iprint
    push    eax
    mov     eax, 0Ah
    push    eax
    mov     eax, esp
    call    sprint
    pop     eax
    pop     eax
    ret
    
;-------------------------------
; int atoi(string number)
; Converts ASCII to an integer
atoi:
    push    ebx
    push    ecx
    push    edx
    push    esi
    mov     esi, eax
    xor     eax, eax
    xor     ecx, ecx
    
multiplyLoop:
    xor     ebx, ebx
    mov     bl, [esi+ecx]
    cmp     bl, 48
    jl      atoiFinished
    cmp     bl, 57
    jg      atoiFinished
    cmp     bl, 10
    je      atoiFinished
    cmp     bl, 0
    jz      atoiFinished
    
    sub     bl, 48
    add     eax, ebx
    mov     ebx, 10
    mul     ebx
    inc     ecx
    jmp     multiplyLoop
    
atoiFinished:
    mov     ebx, 10
    div     ebx
    pop     esi
    pop     edx
    pop     ecx
    pop     ebx
    ret

;------------------------------
; int strlen(string msg)
; Determines the length of a string using pointer arithmetic.
strlen:
    push    ebx
    mov     ebx, eax

nextbyte:
    cmp     byte[eax], 0
    jz      finished
    inc     eax
    jmp     nextbyte
    
finished:
    sub     eax, ebx
    pop     ebx
    ret

;------------------------------
; void sprint(string msg)
; Prints a string
sprint:
    push    eax
    push    ebx
    push    ecx
    push    edx
    mov     ecx, eax
    call    strlen
    mov     edx, eax
    mov     eax, 4
    mov     ebx, 1
    int 80h
    pop     edx
    pop     ecx
    pop     ebx
    pop     eax
    ret

;------------------------------
; void sprintLF(int msg)
; Prints a string with trailing linefeed
sprintLF:
    call    sprint
    push    eax
    mov     eax, 0Ah
    push    eax
    mov     eax, esp
    call    sprint
    pop     eax
    pop     eax
    ret

;------------------------------
; void quit(void)
; Exits program

quit:
   xor      ebx, ebx
   mov      eax, 1
   int      80h
   ret