; imprime 9 * na tela
section .text
    global _start

_start:
    push s2
    push db
    mov edx, 24
    pop ecx
    mov ebx, 1      ;stdout
    mov eax, 4      ;sys_write
    int 0x80

    mov eax, 1      ;sys_exit
    int 0x80


section .data

msg db 'Display 9 stars', 0xa
len equ $ - msg
s2 times 9 db '*'