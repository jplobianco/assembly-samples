; testa algumas syscalls
section .text
global _start

_start:
    ; print to stdout a message pushed to the stack
    mov eax, 4      ;sys_write
    mov ebx, 1      ;stdout
    push byte 0xA
    push 0x41424344
    mov ecx, esp    ;passa o ponteiro da pilha
    mov edx, 5
    int 0x80        ;kernel

    ; print to stdout a message from .data section
    mov eax, 4      ;sys_write
    mov ebx, 1      ;stdout
    mov ecx, msg    ; message from .data section
    mov edx, len
    int 0x80        ;kernel
    push edx

    ; read 5 bytes to an array in .bss section
    mov eax, 3      ;sys_read
    mov ebx, 2      ;stdin
    mov ecx, buf    ; array from .bss section
    mov edx, 5      
    int 0x80        ;kernel

    ; open a file and write the read input number to it
    mov eax, 5      ;sys_open
    xor ebx, ebx
    push ebx
    push 0x414243
    mov ebx, esp
    mov ecx, 0102o  ;O_RDWR 2 and O_CREAT 0100    
    mov edx, 0666o  ;permissions
    int 0x80        ;kernel

    ; print 5 bytes read from stdin
    push eax
    mov ebx, eax    ;eax contains the file descriptor of the open file in previews syscall
    mov eax, 4      ;sys_write
    mov ecx, buf    
    mov edx, 5      
    int 0x80        ;kernel

    ;closes opened file
    mov eax, 6      ;sys_close
    pop ebx         ;file descriptor    
    int 0x80


    mov eax, 1      ;sys_exit
    mov ebx, 0      ;return 0 (OK)
    int 0x80        ;kernel

; variaveis globais inicializadas com valor diferente de 0
section .data
msg db 'hello world!', 0xA
len equ $-msg

section .bss
buf resb 5