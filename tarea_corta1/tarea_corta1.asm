;Tarea_Corta1   Jose Guerra Rodríguez C33510: 50%   Camilo Montero Moya C25030: 50%

;Process Summary:
;This algorithm uses successive divisions to break a decimal number into its individual digits,
;converts them to ASCII characters, and then prints them to the console.
;The key is to use decreasing divisors (starting at 10000 and dividing by 10 each step)
;to extract and process each digit of the number sequentially.

section .data
divisor dq 10000      ; Initial divisor (10000 in decimal)

section .bss
buffer resb 5         ; Space to store up to 5 digits
index resb 1          ; Space for the buffer index

section .text
global _start

_start:
    ; Initial number stored in RAX
    mov rax, 0x4321      ; Load the number into RAX (decimal 17185)
    call conversion

    ; Print the full number
    call imprimir_numero

    ; Finish the program
    call finalizar

; Function for conversion and decomposition of the number
conversion:
    mov rbx, [divisor]   ; Load initial divisor (10000)
    mov byte [index], 0  ; Initialize buffer index

ciclo:
    cmp rbx, 1           ; Check if divisor is 1 (last digit)
    je ultimo_digito     ; If it is 1, process the last digit
    cmp rbx, 0           ; Check if divisor is 0
    je fin_conversion    ; If so, end the conversion
    cmp rax, 0           ; Check if RAX is 0
    jz fin_conversion    ; If so, end the conversion
    xor rdx, rdx         ; Clear RDX before division
    div rbx              ; Divide RAX by RBX -> RAX = quotient, RDX = remainder
    add rax, '0'         ; Convert quotient to ASCII character

    ; Store the converted digit in the buffer
    mov rsi, [index]
    mov [buffer + rsi], al
    inc byte [index]

    ; Prepare for next cycle
    mov rax, rdx         ; Move remainder to RAX (remaining number)
    mov rbx, 10          ; Prepare next divisor
    jmp ciclo            ; Repeat cycle for next digit

ultimo_digito:
    xor rdx, rdx         ; Clear RDX
    div rbx              ; Divide RAX by 1 (last divisor)
    add rax, '0'         ; Convert last quotient to ASCII

    ; Store the last converted digit in the buffer
    mov rsi, [index]
    mov [buffer + rsi], al
    inc byte [index]
    ret

fin_conversion:
    ret

; Function to print the full number from buffer
imprimir_numero:
    mov rcx, 0           ; Initialize index to traverse buffer

imprimir_ciclo:
    cmp rcx, [index]     ; Check if all digits were printed
    je fin_imprimir      ; If equal to final index, finish printing
    mov rax, 1           ; syscall number for sys_write
    mov rdi, 1           ; file descriptor (stdout)
    mov rdx, 1           ; size = 1 byte

    ; Print the current digit
    mov al, [buffer + rcx] ; Get current digit
    mov rsi, buffer        ; Set buffer base address in RSI
    syscall                ; Call write syscall

    ; Increment buffer index
    inc rcx
    jmp imprimir_ciclo

fin_imprimir:
    ret

; Function to end program
finalizar:
    mov rax, 60          ; syscall number for sys_exit
    xor rdi, rdi         ; Exit code 0
    syscall              ; Call OS

;nasm -f elf64 -oobjeto.o tarea_corta1.asm
;ld -otarea_corta1 objeto.o
;./tarea_corta1
