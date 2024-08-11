global _start
section .data
	sum	dw	0

section .text

_start:
	mov ax, 6
	mov bx, 3
	add ax, bx 
	add ax, '0' 
	mov [sum], ax
	
	mov eax, 4
	mov ebx, 1
	mov ecx, sum
	mov edx, 2 
	int 80h
	
	mov eax, 1 
	int 80h
