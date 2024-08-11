global _start:
section .data
	l1	dw	"Input 1st number:",10
	len1	equ	$-l1
	l2	dw	"Input 2nd number:",10
	len2	equ	$-l2
	resu	dw	"The sum is:",10
	len3	equ	$-resu
	
section .bss
	num1	resb	4
	num2	resb	4
	result	resb	4

section .text
_start:
	mov eax,4
	mov ebx,1
	mov ecx,l1
	mov edx,len1
	int 80h
	
	mov eax,3
	mov ebx,0
	mov ecx,num1
	mov edx,4
	int 80h
	
	mov eax,4
	mov ebx,1
	mov ecx,l2
	mov edx,len2
	int 80h
