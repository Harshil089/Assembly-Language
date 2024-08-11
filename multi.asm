global _start
section .data
	num1 db 0x0A 
	num2 db 0x05 
	result dw 0
	 

section .text
_start:

	mov al, [num1] 
	mov bl, [num2] 

	mul bl

	mov [result], ax 

	mov eax, 1 
	mov ebx, 0 
	int 0x80
