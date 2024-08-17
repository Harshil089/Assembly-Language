global _start
section .data
	l1	dw	"Input 1st number:",10
	len1	equ	$-l1
	l2	dw	"Input 2nd number:",10
	len2	equ	$-l2
	resu	dw	"After swapping:",10
	len3	equ	$-resu
	new	dw	"",10
	len4	equ	$-new
	l4	dw	"1st number:",10
	len5	equ	$-l4
	l5	dw	"2nd number:",10
	len6	equ	$-l5
	
section .bss
	num1	resb	4
	num2	resb	4
	r1	resb	4
	r2	resb	4

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
	
	mov eax,3
	mov ebx,0
	mov ecx,num2
	mov edx,4
	int 80h
	
	mov eax,[num2]
	sub eax,'0'
	
	mov ebx,[num1]
	sub ebx,'0'
	
	
	add eax,'0'
	mov [r1],eax
	
	add ebx,'0'
	mov [r2],ebx
	
	mov eax,4
	mov ebx,1
	mov ecx,resu
	mov edx,len3
	int 80h
	
	mov eax,4
	mov ebx,1
	mov ecx,l4
	mov edx,len5
	int 80h
	
	mov eax,4
	mov ebx,1
	mov ecx,r1
	mov edx,4
	int 80h
	
	mov eax,4
	mov ebx,1
	mov ecx,l5
	mov edx,len6
	int 80h
	
	mov eax,4
	mov ebx,1
	mov ecx,r2
	mov edx,4
	int 80h
	
	mov eax,4
	mov ebx,1
	mov ecx,new
	mov edx,len4
	int 80h
	
	mov eax,1
	xor ebx,ebx
	int 80h
