global _start
section .data
	subt	dw	0

section .text

_start:
	mov ax, 9
	mov bx, 2
	sub ax, bx 
	add ax, '0' 
	mov [subt], ax
	
	mov eax, 4
	mov ebx, 1
	mov ecx, subt
	mov edx, 2 
	int 80h
	
	mov eax, 1 
	int 80h
