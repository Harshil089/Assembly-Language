section .data
	name	db	"Name: Harshil",10
	len1	equ	$-name
	surname	db	"Surname: Buch",10
	len2	equ	$-surname
	loc	db	"Location: Pune",10
	len3	equ	$-loc
	branch	db	"Branch: CSE",10
	len4	equ	$-branch
	uni	db	"University: MITADT",10
	len5	equ	$-uni
	
section .text
global _start
 %macro print 2
	mov eax,4
	mov ebx,1
	mov ecx, %1
	mov edx, %2
	int 80h
 %endmacro

_start:
	print name,len1
	print surname,len2
	print loc,len3
	print branch,len4
	print uni,len5
	
	mov eax,1
	xor ebx,ebx
	int 80h
