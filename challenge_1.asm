; Assembly program to implement a number counting system.
; The user is prompted to enter a number from 1 to 5, and the system counts up to 9.
; For example, if the user enters the number 4, the system displays the numbers
; 4, 5, 6, 7, 8, 9, and then closes the application. If the entered number is not valid,
; the system notifies the user that the number is invalid and prompts them to enter
; the number again.




section .data

    msg1 db "Enter a number: "
    lenmsg1 equ $ - msg1
    
    msg2 db "Invalid number!!!", 0xa
    lenmsg2 equ $ - msg2

section .bss

    n1 resb 1

section .text

global _start

_start:

        mov eax, 4
        mov ebx, 1
        mov ecx, msg1
        mov edx, lenmsg1
        int 0x80

        mov eax, 3
        mov ebx, 0
        mov ecx, n1
        mov edx, 2
        int 0x80

less:

        mov al, [n1]
        mov bl, '1'
        cmp al, bl
        jl msg
        jmp greate  
    
greate: 

        mov al, [n1]
        mov bl, '5'
        cmp al, bl
        jg msg
        jmp loop
    
    
msg:
    
        mov eax, 4
        mov ebx, 1
        mov ecx, msg2
        mov edx, lenmsg2
        int 0x80
        
        jmp _start
    
    
loop:
        mov al, [n1]
        mov bl, '9'
        cmp al, bl
        jle increment
        jmp exit



increment:
    
        mov eax, 4
        mov ebx, 1
        mov ecx, n1
        mov edx, 2
        int 0x80

        mov al, [n1]
        inc al
        mov [n1], al

        jmp loop



exit:
        mov eax, 1
        int 0x80