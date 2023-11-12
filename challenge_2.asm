section .data

    msg1 db "Enter a first number: "
    lenmsg1 equ $ - msg1
    
    msg2 db "Enter a second number: ", 
    lenmsg2 equ $ - msg2
    
    msg3 db "Enter 1(sum), 2(sub), 3(mul), 4(div): "
    lenmsg3 equ $ - msg3

    msg4 db "Result: "
    lenmsg4 equ $ - msg4

section .bss

    n1 resb 1
    n2 resb 1
    type resb 1
    resul resb 1
    

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

        mov eax, 4
        mov ebx, 1
        mov ecx, msg3
        mov edx, lenmsg3
        int 0x80

        mov eax, 3
        mov ebx, 0
        mov ecx, type
        mov edx, 2
        int 0x80

number1:

        mov al, [type]
        mov bl, '1'
        cmp al, bl
        je sum_
        
        
number2:

        mov al, [type]
        mov bl, '2'
        cmp al, bl
        je sub_
       

number3:

        mov al, [type]
        mov bl, '3'
        cmp al, bl
        je mul_
        

number4:

        mov al, [type]
        mov bl, '4'
        cmp al, bl
        je div_


sum_:

        mov al, [n1]
        mov bl, [n2]
        sub al, '0'
        sub bl, '0'
        add al, bl
        add al, '0'
        mov [resul], al
        jmp msg

sub_:

        mov al, [n1]
        mov bl, [n2]
        sub al, '0'
        sub bl, '0'
        sub al, bl
        add al, '0'
        mov [resul], al
        jmp msg


mul_:

        mov eax, [n1]
        mov ebx, [n2]
        sub eax, '0'
        sub ebx, '0'
        mul ebx
        add eax, '0'
        mov [resul], eax
        jmp msg


div_:

        mov al, [n1]
        mov bl, [n2]
        sub al, '0'
        sub bl, '0'
        div bl
        add al, '0'
        add ah, '0'
        mov [resul], al
        jmp msg


msg:

        mov eax, 4
        mov ebx, 1
        mov ecx, msg4
        mov edx, lenmsg4
        int 0x80
        
        mov eax, 4
        mov ebx, 1
        mov ecx, resul
        mov edx, 1
        int 0x80
        
        mov eax, 4
        mov ebx, 1
        mov [ecx], byte 0xa
        mov edx, 1
        int 0x80
        
        
        jmp exit         


exit:
        mov eax, 1
        int 0x80