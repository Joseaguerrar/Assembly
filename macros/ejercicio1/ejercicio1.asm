%macro CreaMult 1
    ; Check that the value N is within the range [0, 100]
    %if %1 < 0 || %1 > 100
        %error "N outside the range [0, 100]. The table will not be generated."
    %else
        Tab_%1:
            %assign i 1
            %rep %1
                dw i * 8
                %assign i i + 1
            %endrep
    %endif
%endmacro

section .data
    ; Generate a table of the first 15 multiples of 8
    CreaMult 15

section .bss
    global resultado
    ; Reserve space to store results
    resultado resw 1

section .text
    global _start

_start:
    ; Example: Access the 5th multiple of 8 (40) in Tab_15
    mov rdi, 4                 ; Index 4 (5th element, since it starts at 0)
    mov ax, [Tab_15 + rdi * 2] ; Multiply rdi by 2 because each entry is a word (2 bytes)
    mov [resultado], ax        ; Store the result in the variable for inspection

    ; Terminate the program
    mov eax, 60                ; System exit code (sys_exit)
    xor edi, edi               ; Exit status (0)
    syscall
