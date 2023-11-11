
section .data
	
	msg1 db "Enter the first number: "
	lenmsg1 equ $ - msg1

	msg2 db "Enter the second number: "
	lenmsg2 equ $ - msg2
	
	msg3 db "Division result: "
	lenmsg3 equ $ - msg3
	
	msg4 db "Multiplication result: "
	lenmsg4 equ $ - msg4
	
	msg5 db "Sum result: "
	lenmsg5 equ $ - msg5
	
	msg6 db "Subtraction result: "
	lenmsg6 equ $ - msg6

section .bss
	
	n1 resb 1
	n2 resb 1
	rd resb 1
	rm resb 1
	rs resb 1
	rsub resb 1

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
	div bl
	add al, '0'
	mov [rd], al
	int 0x80
	
	mov eax, [n1]
	mov ebx, [n2]
	sub eax, '0'
	sub ebx, '0'
	mul ebx
	add eax, '0'
	mov [rm], eax
	int 0x80
	
	mov al, [n1]
	mov bl, [n2]
	sub al, '0'
	sub bl, '0'
	add al, bl
	add al, '0'
	mov [rs], al
	int 0x80
	
	mov al, [n1]
	mov bl, [n2]
	sub al, '0'
	sub bl, '0'
	sub al, bl
	add al, '0'
	mov [rsub], al
	
	
	mov eax, 4
	mov ebx, 1
	mov ecx, msg3
	mov edx, lenmsg3
	int 0x80

	mov eax, 4
	mov ebx, 1
	mov ecx, rd
	mov edx, 1
	int 0x80
	
	mov eax, 4
	mov ebx, 1
	mov [ecx], byte 0xa
	mov edx, 1
	int 0x80
	
	mov eax, 4
	mov ebx, 1
	mov ecx, msg4
	mov edx, lenmsg4
	int 0x80

	mov eax, 4
	mov ebx, 1
	mov ecx, rm
	mov edx, 1
	int 0x80
	
	mov eax, 4
	mov ebx, 1
	mov [ecx], byte 0xa
	mov edx, 1
	int 0x80
	
	mov eax, 4
	mov ebx, 1
	mov ecx, msg5
	mov edx, lenmsg5
	int 0x80

	mov eax, 4
	mov ebx, 1
	mov ecx, rs
	mov edx, 1
	int 0x80
	
	mov eax, 4
	mov ebx, 1
	mov [ecx], byte 0xa
	mov edx, 1
	int 0x80
	
	mov eax, 4
	mov ebx, 1
	mov ecx, msg6
	mov edx, lenmsg6
	int 0x80

	mov eax, 4
	mov ebx, 1
	mov ecx, rsub
	mov edx, 1
	int 0x80

exit:
	mov eax, 1
	int 0x80


	