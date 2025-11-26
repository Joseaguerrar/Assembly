section .note.GNU-stack noalloc noexec nowrite progbits

section .data
    four: dd 4.0
    two: dd 2.0

section .text
global cuadratic
cuadratic:
    ; xmm0 a
    ; xmm1 b
    ; xmm2 c
    vmulss xmm3, xmm1, xmm1           ; b^2 xmm3
    vmulss xmm4, xmm0, xmm2           ; a*c xmm4
    vmulss xmm4, xmm4, [four]       ; 4*ac xmm4
    vsubss xmm3, xmm3, xmm4           ; b^2 - 4ac xmm3

    vsqrtss xmm3, xmm3                ; square root xmm3
    vsubss xmm3, xmm3, xmm1           ; sqrt(b^2 - 4ac) - b xmm3

    vmulss xmm5, xmm0, [two]          ; 2a
    vdivss xmm3, xmm3, xmm5           ; sqrt(b^2 - 4ac) - b / 2a
    vmovss xmm0, xmm3                 ;move

    ret
