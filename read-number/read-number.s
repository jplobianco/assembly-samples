; lê um número do console e imprime na tela
section .data       ; initialized data
    userMsg db 'Digite um numero: '
    lenUserMsg equ $-userMsg
    dispMsg db 'Voce digitou: '
    lenDispMsg equ $-dispMsg

section .bss        ; uninitialized data
    num resb 5

section .text       ; code segment
    global _start

_start:
    mov eax, 4              ;sys_write
    mov ebx, 1              ;stdout
    mov ecx, userMsg        ;
    mov edx, lenUserMsg     ;
    int 0x80                ; call kernel

    ; Read and store the user input
    mov eax, 3              ;sys_read
    mov ebx, 2              ;stdin
    mov ecx, num            ; buffer to hold the number
    mov edx, 5              ; read 5 bytes
    int 80h

    ; Output message with the number
    mov eax, 4              ;sys_write
    mov ebx, 1              ;stdout
    mov ecx, dispMsg        ;
    mov edx, lenDispMsg     ;
    int 0x80

    ; Output the number
    mov eax, 4              ;sys_write
    mov ebx, 1              ;stdout
    mov ecx, num            ;
    mov edx, 5              ;
    int 0x80

    ; exit
    mov eax, 1
    mov ebx, 0
    int 0x80

