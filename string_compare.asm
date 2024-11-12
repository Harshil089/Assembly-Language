section .data
    string1 db "Hello", 0 
    string2 db "Hello", 0 
    equal_msg db "Equal", 10  ; "Equal\n"
    equal_len equ $ - equal_msg
    not_equal_msg db "Not Equal", 10  ; "Not Equal\n"
    not_equal_len equ $ - not_equal_msg

section .text
    global _start
_start:
    lea esi, [string1]           ; Load address of string1 into esi
    lea edi, [string2]           ; Load address of string2 into edi
compare_loop:
    lodsb                        ; Load byte at [esi] into al, then increment esi
    scasb                        ; Compare byte at [edi] with al, then increment edi
    jne strings_different        ; Jump if not equal
    cmp al, 0                    ; Check if end of string (null terminator)
    je strings_equal             ; Jump if end of both strings
    jmp compare_loop             ; Repeat loop if characters match
    
strings_different:
    mov eax, 4                   ; System call number for sys_write
    mov ebx, 1                   ; File descriptor 1 (stdout)
    mov ecx, not_equal_msg       ; Message to print
    mov edx, not_equal_len       ; Length of message
    int 0x80                     ; Make system call
    jmp exit_program             ; Exit the program

strings_equal:
    mov eax, 4                   ; System call number for sys_write
    mov ebx, 1                   ; File descriptor 1 (stdout)
    mov ecx, equal_msg           ; Message to print
    mov edx, equal_len           ; Length of message
    int 0x80                     ; Make system call

exit_program:
    mov eax, 1                   ; System call number for sys_exit
    xor ebx, ebx                 ; Exit code 0
    int 0x80                     ; Make system call
