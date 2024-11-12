section .data
    string1 db "Hello, ", 0
    string2 db "World!", 0
    output_buffer times 20 db 0   ; Reserve 20 bytes for the concatenated result

section .text
global _start
_start:

    ; Load addresses of string1, string2, and output_buffer
    lea esi, [string1]
    lea edi, [output_buffer]

copy_string1:
    lodsb                         ; Load byte at esi into al, increment esi
    stosb                         ; Store byte from al into edi, increment edi
    cmp al, 0                     ; Check if we reached end of string1
    jne copy_string1              ; Repeat if not at the end

copy_string2:
    lea esi, [string2]            ; Load address of string2 into esi

concat_loop:
    lodsb                         ; Load byte at esi into al, increment esi
    stosb                         ; Store byte from al into edi, increment edi
    cmp al, 0                     ; Check if we reached end of string2
    jne concat_loop               ; Repeat if not at the end

    ; Prepare to print the result
    mov eax, 4                    ; Syscall number for sys_write
    mov ebx, 1                    ; File descriptor (stdout)
    lea ecx, [output_buffer]      ; Pointer to the output buffer
    sub edi, output_buffer        ; Calculate length of concatenated string
    mov edx, edi                  ; Store length in edx
    int 0x80                      ; Invoke syscall

    ; Exit program
    mov eax, 1                    ; Syscall number for sys_exit
    xor ebx, ebx                  ; Exit code 0
    int 0x80
