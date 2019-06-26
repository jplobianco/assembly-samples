; exemplo simples usando alguns operadores aritméticos
SYS_READ    equ 3
SYS_WRITE   equ 4
SYS_EXIT    equ 1
STDOUT      equ 1
STDIN       equ 0

section .bss
    num1 resb 2
    num2 resb 2
    res  resb 1  

section .data
    msg1 db 'Digite o primeiro dígito:', 0xA
    len1 equ $- msg1

    msg2 db 'Digite o segundo dígito:', 0xA
    len2 equ $- msg2

    msg3 db 'A soma  é: '
    len3 equ $- msg3

section .text
global _start

_start:
    ;imprimir msg1
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msg1
    mov edx, len1
    int 0x80

    ;ler num1
    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, num1
    mov edx, 2
    int 0x80

    ;imprimir msg2
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msg2
    mov edx, len2
    int 0x80

    ;ler num2
    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, num2
    mov edx, 2
    int 0x80

    ;imprimir msg3
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msg3
    mov edx, len3
    int 0x80

    ; somas os dois números e coloca a soma em res
    mov eax, [num1]
    sub eax, '0'    ;converte para decimal

    mov ebx, [num2]
    sub ebx, '0'    ;converte para decimal

    add eax, ebx
    add eax, '0'    ;converte de decimal para ascii

    mov [res], eax

    ;imprimir res
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, res
    mov edx, 1
    int 0x80    

exit:
    mov eax, SYS_EXIT
    xor ebx, ebx
    int 0x80