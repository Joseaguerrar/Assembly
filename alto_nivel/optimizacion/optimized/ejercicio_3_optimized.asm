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
    ; Load the base address of the matrix into rdx to minimize memory accesses
    lea rdx, [matrix] 

    ; Swap the upper-left quadrant with the lower-right quadrant, using additional accumulators
    mov rax, [rdx + 0*2]     ; Load matrix[0] into rax
    mov rbx, [rdx + 10*2]    ; Load matrix[10] into rbx
    mov rcx, [rdx + 1*2]     ; Load matrix[1] into rcx
    mov rdi, [rdx + 11*2]    ; Load matrix[11] into rdi

    ; Perform the swap without long dependency chains
    mov [rdx + 0*2], rbx     ; matrix[0] = matrix[10]
    mov [rdx + 10*2], rax    ; matrix[10] = matrix[0]
    mov [rdx + 1*2], rdi     ; matrix[1] = matrix[11]
    mov [rdx + 11*2], rcx    ; matrix[11] = matrix[1]

    ; Continue with the same pattern for the next elements
    mov rax, [rdx + 2*2]
    mov rbx, [rdx + 8*2]
    mov rcx, [rdx + 3*2]
    mov rdi, [rdx + 9*2]

    mov [rdx + 2*2], rbx     ; matrix[2] = matrix[8]
    mov [rdx + 8*2], rax     ; matrix[8] = matrix[2]
    mov [rdx + 3*2], rdi     ; matrix[3] = matrix[9]
    mov [rdx + 9*2], rcx     ; matrix[9] = matrix[3]

    ; Swap the upper-right quadrant with the lower-left quadrant
    mov rax, [rdx + 4*2]
    mov rbx, [rdx + 12*2]
    mov rcx, [rdx + 5*2]
    mov rdi, [rdx + 13*2]

    mov [rdx + 4*2], rbx     ; matrix[4] = matrix[12]
    mov [rdx + 12*2], rax    ; matrix[12] = matrix[4]
    mov [rdx + 5*2], rdi     ; matrix[5] = matrix[13]
    mov [rdx + 13*2], rcx    ; matrix[13] = matrix[5]

    ; Continue with the same pattern for the last elements
    mov rax, [rdx + 6*2]
    mov rbx, [rdx + 14*2]
    mov rcx, [rdx + 7*2]
    mov rdi, [rdx + 15*2]

    mov [rdx + 6*2], rbx     ; matrix[6] = matrix[14]
    mov [rdx + 14*2], rax    ; matrix[14] = matrix[6]
    mov [rdx + 7*2], rdi     ; matrix[7] = matrix[15]
    mov [rdx + 15*2], rcx    ; matrix[15] = matrix[7]

    ret
