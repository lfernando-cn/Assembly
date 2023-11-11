section .data
	msg1 db "Enter first number: "
	lenmsg1 equ $ - msg1

	msg2 db "Enter second number: "
	lenmsg2 equ $ - msg2

    msg3 db "Result: "
    lenmsg3 equ $ - msg3

section .bss
	n1 resb 1
	n2 resb 1
	r resb 1
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

        mov eax, 4
        mov ebx, 1
        mov ecx, msg2
        mov edx, lenmsg2
        int 0x80

        mov eax, 3
        mov ebx, 0
        mov ecx, n2
        mov edx, 2
        int 0x80

        mov al, [n1]
        mov bl, [n2]
        sub al, '0'
        sub bl, '0'
        add al, bl
        add al, '0'
        mov [r], al
        int 0x80

        mov eax, 4
        mov ebx, 1
        mov ecx, msg3
        mov edx, lenmsg3
        int 0x80

        mov eax, 4
        mov ebx, 1
        mov ecx, r
        mov edx, 2
        int 0x80

	
exit:
	mov eax, 1
	int 0x80