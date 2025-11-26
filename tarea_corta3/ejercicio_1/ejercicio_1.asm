; Jerson Bonilla and Jose Guerra
section .data
vector1: dw 2, -3, 5         ; Input vectors
vector2: dw 1, 2, 3
respuesta: dd 0              ; Space to store the dot product result
buffer: db '00000000', 0     ; Buffer to convert the number to ASCII (for printing)
newline: db 0xA              ; Newline
negativo: db '-'             ; Negative symbol

section .text
global _start

_start:
    ; Initialization
    mov rdi, 0                ; Initialize loop index at 0
    mov dword [respuesta], 0  ; Clear the respuesta variable before using it to remove garbage.

producto_punto:
    cmp rdi, 3                ; Check if we have processed 3 elements (x, y, z)
    je fin_producto_punto     ; If yes, finish the loop

    ; Load vector values
    movsx eax, word [vector1 + rdi*2] ; Load value from vector1 into eax with sign
    movsx ebx, word [vector2 + rdi*2] ; Load value from vector2 into ebx with sign

    ; Multiply the values
    imul eax, ebx            ; Multiply eax by ebx (result in eax)

    ; Add the partial result to respuesta
    add dword [respuesta], eax

    ; Increment index to process next element
    inc rdi
    jmp producto_punto        ; Repeat process until all elements are done

fin_producto_punto:
    ; Load final result into eax and call print function
    mov eax, [respuesta]      ; Load 'respuesta' value into eax
    call print_num            ; Print result

    ; Print newline
    mov rax, 1                ; Syscall write
    mov rdi, 1                ; File descriptor (stdout)
    mov rsi, newline          ; Address of newline
    mov rdx, 1                ; Size = 1 byte
    syscall                   ; Print newline

    ; Exit program
    mov rax, 60               ; Exit syscall
    xor rdi, rdi              ; Exit code 0
    syscall                   ; Exit

; Function to convert number to decimal string
print_num:
    test eax, eax             ; Check if number is negative
    jns convertir             ; If not negative, jump to conversion

    ; Print negative sign
    neg eax                   ; Make number positive
    mov rax, 1                ; Syscall write
    mov rdi, 1                ; Stdout
    mov rsi, negativo         ; Address of negative symbol
    mov rdx, 1                ; Size = 1 byte
    syscall                   ; Print negative sign at start

convertir:
    mov rsi, buffer           ; Point to buffer
    mov rbx, 10               ; Decimal base divisor
    mov rdi, buffer + 7       ; Start from end of buffer
    mov byte [rdi], 0         ; String terminator

convertir_loop:
    xor rdx, rdx              ; Clear rdx (div uses rdx for remainder)
    div rbx                   ; Divide rax by 10, quotient in rax, remainder in rdx
    add dl, '0'               ; Convert remainder to ASCII
    dec rdi                   ; Move back one position in buffer
    mov [rdi], dl             ; Store digit
    test rax, rax             ; Check if quotient is zero
    jnz convertir_loop        ; If not zero, keep converting

print_buffer:
    ; Calculate string size
    mov rdx, buffer + 8       ; Load end of buffer address
    sub rdx, rdi              ; Subtract rdi pointer to get string size
    mov rsi, rdi              ; Point to string start
    mov rax, 1                ; Syscall write
    mov rdi, 1                ; Stdout
    syscall                   ; Print to screen
    ret                       ; Return
