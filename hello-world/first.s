; imprime /bin/sh na tela
segment	.text
   global _start     ;must be declared for linker (ld)
	
_start:
    xor     eax, eax
    push	eax
	push    0x68732f2f 
	push    0x6e69622f
    mov     edx, len          ;msg len
    pop     ecx
    mov     ecx, msg        ;msg to be printed
    mov     ebx, 1          ;stdout
    mov     eax, 4          ;sys_write
    int     0x80            ;call kernel

    mov     eax, 1          ;sys_exit
    int     0x80            ;call kernel

segment .data
msg     db '/bin/sh', 0xa
len     equ $ - msg

; .bss (seção que contem buffers para dados que serão declarados posteriormente no programa)
; .data (sessão que contem elementos de dados declarados e inicializados)
; O .data nao pode ser expandido (eh fixo/estatico)
; O .bss tambem nao pode ser expandida (ela eh preenchida inicialmente com zeros) (sao dados alocados mas nao inicializados)
