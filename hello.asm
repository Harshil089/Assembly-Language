global _start:
section .data:
	name	dw	"Hello World!",10
	len	equ	$-name
	
section .text:

_start:
	mov eax,4
	mov ebx,1
	mov ecx,name
	mov edx,len
	int 80h
	
	mov eax,1
	xor ebx,ebx
	int 80h
