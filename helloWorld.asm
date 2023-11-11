section .data
    msg db 'Hello World', 0xa
    lenmsg equ $ - msg

section .text
global _start

_start:
        mov eax, 4 
        mov ebx, 1
        mov ecx, msg
        mov edx, lenmsg 
        int 0x80
        
exit:
    mov eax, 1
    int 0x80