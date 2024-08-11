section .data
	dividend db 0x1A 
	divisor db 0x05 
	quotient db 0 
	remainder db 0 
	
section .bss

section .text
global _start 
_start:

	mov al, [dividend] 
	mov bl, [divisor]
	xor ah, ah 

	div bl

	mov [quotient], al 
	mov [remainder], ah 

	mov eax, 1 
	xor ebx, ebx
	int 0x80
