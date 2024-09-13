section .data
	input_prompt	db 	"Enter a 1-digit hexadecimal number: ", 0
	invalid_input 	db 	"Invalid input! Please enter a valid hex digit (0-9, A-F).", 10, 0
	result_prompt 	db 	"The BCD equivalent is: ", 0
	hex_input 	db 	0 ; 	To store the input hex digit
	bcd_result 	db 	0 ; To store the BCD result
	result_display 	db 	"BCD: 00", 10, 0 ; To display the result
	
section .bss
	; Uninitialized data
	
section .text
global _start ; Entry point for the program
_start:
	; Display input prompt
	mov eax, 4 ; syscall number for sys_write
	mov ebx, 1 ; file descriptor 1 (stdout)
	lea ecx, [input_prompt] ; address of input prompt
	mov edx, 34 ; length of input prompt
	int 0x80 ; invoke syscall
	
	; Read user input
	mov eax, 3 ; syscall number for sys_read
	mov ebx, 0 ; file descriptor 0 (stdin)
	lea ecx, [hex_input] ; address of input buffer
	mov edx, 1 ; number of bytes to read
	int 0x80 ; invoke syscall
	sub byte [hex_input], '0' ; Convert ASCII to number
	
	; Validate input (0-9, A-F)
	cmp byte [hex_input], 9
	jbe valid_hex
	sub byte [hex_input], 7 ; Convert 'A'-'F' to 10-15
	cmp byte [hex_input], 15
	ja invalid_hex
	jmp convert_hex
	
	invalid_hex:
	; Display invalid input message
	mov eax, 4 ; syscall number for sys_write
	mov ebx, 1 ; file descriptor 1 (stdout)
	lea ecx, [invalid_input] ; address of invalid input message
	mov edx, 47 ; length of invalid input message
	int 0x80 ; invoke syscall
	jmp _start ; Restart input
	
	valid_hex:
	; Continue with valid hex input
	convert_hex:
	; Convert hex to BCD
	mov al, [hex_input] ; Load input hex digit
	mov ah, 0 ; Clear high byte
	aam ; Convert to BCD
	mov [bcd_result], ax ; Store BCD result
	
	; Display result prompt
	mov eax, 4 ; syscall number for sys_write
	mov ebx, 1 ; file descriptor 1 (stdout)
	lea ecx, [result_prompt] ; address of result prompt
	mov edx, 23 ; length of result prompt
	int 0x80 ; invoke syscall
	
	; Display result
	mov ax, [bcd_result]
	;aam ; Adjust AX for display
	add al, '0' ; Convert to ASCII
	add ah, '0'
	mov [result_display + 4], ah ; Store tens digit
	mov [result_display + 5], al ; Store ones digit
	mov eax, 4 ; syscall number for sys_write
	mov ebx, 1 ; file descriptor 1 (stdout)
	lea ecx, [result_display] ; address of result display
	mov edx, 9 ; length of result display
	int 0x80 ; invoke syscall
	
	; Exit program
	mov eax, 1 ; syscall number for sys_exit
	xor ebx, ebx ; exit code 0
	int 0x80 ; invoke syscall
