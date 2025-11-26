section .data
    ; Define the original matrix in the data section (4x4)
    matrix:     dw 1, 2, 3, 4
                dw 5, 6, 7, 8
                dw 9, 10, 11, 12
                dw 13, 14, 15, 16

section .text
    global _start

_start:
    ; Call the method to swap the quadrants
    call swap_quadrants

    ; Exit the program
    mov rax, 60           ; syscall: exit
    xor rdi, rdi          ; exit code 0
    syscall

swap_quadrants:
    ; Swap upper-left quadrant with lower-right quadrant
    mov ax, [matrix + 0*2]  ; ax = matrix[0]
    mov bx, [matrix + 10*2] ; bx = matrix[10]
    mov [matrix + 0*2], bx  ; matrix[0] = matrix[10]
    mov [matrix + 10*2], ax ; matrix[10] = ax

    mov ax, [matrix + 1*2]  ; ax = matrix[1]
    mov bx, [matrix + 11*2] ; bx = matrix[11]
    mov [matrix + 1*2], bx  ; matrix[1] = matrix[11]
    mov [matrix + 11*2], ax ; matrix[11] = ax

    mov ax, [matrix + 2*2]  ; ax = matrix[2]
    mov bx, [matrix + 8*2]  ; bx = matrix[8]
    mov [matrix + 2*2], bx  ; matrix[2] = matrix[8]
    mov [matrix + 8*2], ax  ; matrix[8] = ax

    mov ax, [matrix + 3*2]  ; ax = matrix[3]
    mov bx, [matrix + 9*2]  ; bx = matrix[9]
    mov [matrix + 3*2], bx  ; matrix[3] = matrix[9]
    mov [matrix + 9*2], ax  ; matrix[9] = ax

    ; Swap upper-right quadrant with lower-left quadrant
    mov ax, [matrix + 4*2]  ; ax = matrix[4]
    mov bx, [matrix + 12*2] ; bx = matrix[12]
    mov [matrix + 4*2], bx  ; matrix[4] = matrix[12]
    mov [matrix + 12*2], ax ; matrix[12] = ax

    mov ax, [matrix + 5*2]  ; ax = matrix[5]
    mov bx, [matrix + 13*2] ; bx = matrix[13]
    mov [matrix + 5*2], bx  ; matrix[5] = matrix[13]
    mov [matrix + 13*2], ax ; matrix[13] = ax

    mov ax, [matrix + 6*2]  ; ax = matrix[6]
    mov bx, [matrix + 14*2] ; bx = matrix[14]
    mov [matrix + 6*2], bx  ; matrix[6] = matrix[14]
    mov [matrix + 14*2], ax ; matrix[14] = ax

    mov ax, [matrix + 7*2]  ; ax = matrix[7]
    mov bx, [matrix + 15*2] ; bx = matrix[15]
    mov [matrix + 7*2], bx  ; matrix[7] = matrix[15]
    mov [matrix + 15*2], ax ; matrix[15] = ax

    ret
