global _start:
section .daata:
	name	dw	"Harshil",10
	len1	equ	$-name
	surname	dw	"Buch",10
	len2	equ	$-surname
	
section .text:
_start:
	mov eax,4
	mov ebx,1
	mov ecx,name
	mov edx,len1
	int 80h
	
	mov eax,4
	mov ebx,1
	mov ecx,surname
	mov edx,len2
	int 80h
	
	mov eax,1
	xor ebx,ebx
	int 80h
