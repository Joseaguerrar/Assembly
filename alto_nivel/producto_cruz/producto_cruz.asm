section .note.GNU-stack noalloc noexec nowrite progbits

section .data
    result: dd 0.0, 0.0, 0.0

section .text
global producto_cruz
producto_cruz:
    ; First vector
    movups xmm0, [rdi]         ; a1
    movups xmm1, [rdi+4]       ; a2
    movups xmm2, [rdi+8]       ; a3

    ; Second vector
    movups xmm3, [rsi]         ; b1
    movups xmm4, [rsi+4]       ; b2
    movups xmm5, [rsi+8]       ; b3

    ; c1
    vmulss xmm6, xmm1, xmm5    ; a2*b3
    vmulss xmm7, xmm2, xmm4    ; a3*b2
    vsubss xmm8, xmm6, xmm7    ; a2*b3-a3*b2 
    movups [result], xmm8

    ; c2
    vmulss xmm6, xmm2, xmm3    ; a3*b1
    vmulss xmm7, xmm0, xmm5    ; a1*b3
    vsubss xmm8, xmm6, xmm7    ; a3*b1-a1*b3 
    movups [result+4], xmm8

    ; c3
    vmulss xmm6, xmm0, xmm4    ; a1*b2
    vmulss xmm7, xmm1, xmm3    ; a2*b1
    vsubss xmm8, xmm6, xmm7    ; a1*b2-a2*b1 
    movups [result+8], xmm8

    mov rax, result

    ret
