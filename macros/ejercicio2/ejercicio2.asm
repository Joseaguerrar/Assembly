; Archivo: ejercicio2.asm
section .data
    ; Declaración de datos
    buffer db "Alfabeto generado: ", 0
    buflen equ $ - buffer

section .bss
    alfa resb 27 ; Espacio para el alfabeto generado (máximo 26 letras + null terminator)

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

    ; Generar el alfabeto parcial
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
    db 0 ; Null-terminator para cadenas
%endmacro

; Código principal
_start:
    ; Usa la macro para generar un alfabeto parcial
    CreaAlfa 'B', 'F', 1 ; Genera letras de 'b' a 'f'

    ; Escribir mensaje en pantalla
    mov rax, 1          ; syscall: write
    mov rdi, 1          ; file descriptor: stdout
    mov rsi, buffer     ; dirección del mensaje
    mov rdx, buflen     ; longitud del mensaje
    syscall

    ; Escribir el alfabeto generado
    mov rax, 1          ; syscall: write
    mov rdi, 1          ; file descriptor: stdout
    mov rsi, alfa       ; dirección del alfabeto generado
    mov rdx, 6          ; longitud del alfabeto ('B' a 'F' = 6 caracteres)
    syscall

    ; Salir del programa
    mov rax, 60         ; syscall: exit
    xor rdi, rdi        ; exit code 0
    syscall
