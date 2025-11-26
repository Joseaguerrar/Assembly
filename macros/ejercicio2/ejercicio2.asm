; File: ejercicio2.asm
section .data
    ; Data declarations
    buffer db "Generated alphabet: ", 0
    buflen equ $ - buffer

section .bss
    alfa resb 27 ; Space for the generated alphabet (max 26 letters + null terminator)

section .text
global _start

; Macro CreaAlfa
%macro CreaAlfa 3-3+
    %if %1 =
        %define LetraInicial 'A'
    %else
        %define LetraInicial %1
    %endif

    %if %2 =
        %define LetraFinal 'Z'
    %else
        %define LetraFinal %2
    %endif

    %if %3 =
        %define LetraTipo 0
    %else
        %define LetraTipo %3
    %endif

    ; Generate the partial alphabet
    section .data
    alfa db
    %assign i LetraInicial
    %if LetraTipo = 1
        %assign offset 32
    %else
        %assign offset 0
    %endif

    %rep LetraFinal - LetraInicial + 1
        db i + offset
        %assign i i + 1
    %endrep
    db 0 ; Null terminator for strings
%endmacro

; Main code
_start:
    ; Use the macro to generate a partial alphabet
    CreaAlfa 'B', 'F', 1 ; Generates letters from 'b' to 'f'

    ; Write message to screen
    mov rax, 1          ; syscall: write
    mov rdi, 1          ; file descriptor: stdout
    mov rsi, buffer     ; message address
    mov rdx, buflen     ; message length
    syscall

    ; Write the generated alphabet
    mov rax, 1          ; syscall: write
    mov rdi, 1          ; file descriptor: stdout
    mov rsi, alfa       ; generated alphabet address
    mov rdx, 6          ; alphabet length ('B' to 'F' = 6 characters)
    syscall

    ; Exit the program
    mov rax, 60         ; syscall: exit
    xor rdi, rdi        ; exit code 0
    syscall
