; Jose Guerra (C33510)(50%) y Jerson Bonilla (C31225)(50%)
; Jose Guerra (C33510)(50%) and Jerson Bonilla (C31225)(50%)
section .data
align 32
resultados resb 3 * 4 * 4  ; Space for 3 components (c1, c2, c3) for 4 packed vectors (48 bytes)

section .text
global producto_cruz_packed

producto_cruz_packed:
    ; Compute c1 = (y1 * z2) - (z1 * y2)
    
    ; Multiply y1 * z2
    vmovaps xmm0, [rsi]         ; Load packed y1
    vmovaps xmm1, [r9]          ; Load packed z2
    vmulps xmm2, xmm0, xmm1     ; xmm2 = y1 * z2

    ; Multiply z1 * y2
    vmovaps xmm0, [rdx]         ; Load packed z1
    vmovaps xmm1, [r8]          ; Load packed y2
    vmulps xmm3, xmm0, xmm1     ; xmm3 = z1 * y2

    ; Subtract: (y1 * z2) - (z1 * y2)
    vsubps xmm4, xmm2, xmm3     ; xmm4 = c1 (cross product result)

    ; Store c1 in resultados[0:3]
    vmovaps [resultados], xmm4  

    ; Compute c2 = (z1 * x2) - (x1 * z2)
    
    ; Multiply z1 * x2
    vmovaps xmm0, [rdx]         ; Load packed z1
    vmovaps xmm1, [rcx]         ; Load packed x2
    vmulps xmm2, xmm0, xmm1     ; xmm2 = z1 * x2

    ; Multiply x1 * z2
    vmovaps xmm0, [rdi]         ; Load packed x1
    vmovaps xmm1, [r9]          ; Load packed z2
    vmulps xmm3, xmm0, xmm1     ; xmm3 = x1 * z2

    ; Subtract: (z1 * x2) - (x1 * z2)
    vsubps xmm4, xmm2, xmm3     ; xmm4 = c2 (cross product result)

    ; Store c2 in resultados[4:7]
    vmovaps [resultados + 16], xmm4  

    ; Compute c3 = (x1 * y2) - (y1 * x2)
    
    ; Multiply x1 * y2
    vmovaps xmm0, [rdi]         ; Load packed x1
    vmovaps xmm1, [r8]          ; Load packed y2
    vmulps xmm2, xmm0, xmm1     ; xmm2 = x1 * y2

    ; Multiply y1 * x2
    vmovaps xmm0, [rsi]         ; Load packed y1
    vmovaps xmm1, [rcx]         ; Load packed x2
    vmulps xmm3, xmm0, xmm1     ; xmm3 = y1 * x2

    ; Subtract: (x1 * y2) - (y1 * x2)
    vsubps xmm4, xmm2, xmm3     ; xmm4 = c3 (cross product result)

    ; Store c3 in resultados[8:11]
    vmovaps [resultados + 32], xmm4  

    ; Return the address of resultados
    lea rax, [resultados]       ; Load the address of resultados into rax
    ret
