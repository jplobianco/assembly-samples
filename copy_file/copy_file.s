; Copia 100 bytes do arquivo fileA para fileB
; 
; Evita quando possível usar a section .data para forçar o uso da pilha
;
section .bss
buf resb 100

section .text
global _start

_start:
    ;opens fileA
    mov eax, 5          ;sys_open
    push 0x00000041
    push 0x656c6966     
    mov ebx, esp
    mov ecx, 0102o    ;O_RDWR 2 and O_CREAT 0100o
    mov edx, 0666o      ;permissions
    int 0x80            

    ;read content from file A to the stack
    mov ebx, eax        ;file descriptor
    mov eax, 3          ;sys_read
    push ebx
    mov ecx, buf        ;buffer
    mov edx, 100        
    int 0x80

    ;closes fileA
    mov ebx, eax        ;file descriptor
    mov eax, 6          ;sys_close
    int 0x80            

    pop ebx             ;file descriptor
    ;open fileB
    mov eax, 5          ;sys_open
    push 0x00000042
    push 0x656c6966
    mov ebx, esp
    mov ecx, 0102o      ;O_RDWR 2 and O_CREAT 0100o
    mov edx, 0666o      ;permissions
    int 0x80  

    ;write content from the stack to fileB
    mov ebx, eax        ;file descriptor
    mov eax, 4          ;sys_write
    mov ecx, buf        ;le a partir dos dados que foram colocados na pilha
    mov edx, 100        
    int 0x80

    ;closes fileB
    mov ebx, eax        ;file descriptor
    mov eax, 6          ;sys_close
    int 0x80
    
    ;exit
    mov eax, 1          ;sys_exit
    mov ebx, 0          ;success
    int 0x80            ;kernel
    