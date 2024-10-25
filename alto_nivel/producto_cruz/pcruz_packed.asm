; Jose Guerra (C33510)(50%) y Jerson Bonilla (C31225)(50%)
section .data
align 32
resultados resb 3 * 4 * 4  ; Espacio para 3 componentes (c1, c2, c3) para 4 vectores empaquetados (48 bytes)

section .text
global producto_cruz_packed

producto_cruz_packed:
    ; Calcular c1 = (y1 * z2) - (z1 * y2)
    
    ; Multiplicar y1 * z2
    vmovaps xmm0, [rsi]         ; Cargar y1 empaquetado
    vmovaps xmm1, [r9]          ; Cargar z2 empaquetado
    vmulps xmm2, xmm0, xmm1     ; xmm2 = y1 * z2

    ; Multiplicar z1 * y2
    vmovaps xmm0, [rdx]         ; Cargar z1 empaquetado
    vmovaps xmm1, [r8]          ; Cargar y2 empaquetado
    vmulps xmm3, xmm0, xmm1     ; xmm3 = z1 * y2

    ; Restar: (y1 * z2) - (z1 * y2)
    vsubps xmm4, xmm2, xmm3     ; xmm4 = c1 (resultado del producto cruz)

    ; Guardar c1 en resultados[0:3]
    vmovaps [resultados], xmm4  

    ; Calcular c2 = (z1 * x2) - (x1 * z2)
    
    ; Multiplicar z1 * x2
    vmovaps xmm0, [rdx]         ; Cargar z1 empaquetado
    vmovaps xmm1, [rcx]         ; Cargar x2 empaquetado
    vmulps xmm2, xmm0, xmm1     ; xmm2 = z1 * x2

    ; Multiplicar x1 * z2
    vmovaps xmm0, [rdi]         ; Cargar x1 empaquetado
    vmovaps xmm1, [r9]          ; Cargar z2 empaquetado
    vmulps xmm3, xmm0, xmm1     ; xmm3 = x1 * z2

    ; Restar: (z1 * x2) - (x1 * z2)
    vsubps xmm4, xmm2, xmm3     ; xmm4 = c2 (resultado del producto cruz)

    ; Guardar c2 en resultados[4:7]
    vmovaps [resultados + 16], xmm4  

    ; Calcular c3 = (x1 * y2) - (y1 * x2)
    
    ; Multiplicar x1 * y2
    vmovaps xmm0, [rdi]         ; Cargar x1 empaquetado
    vmovaps xmm1, [r8]          ; Cargar y2 empaquetado
    vmulps xmm2, xmm0, xmm1     ; xmm2 = x1 * y2

    ; Multiplicar y1 * x2
    vmovaps xmm0, [rsi]         ; Cargar y1 empaquetado
    vmovaps xmm1, [rcx]         ; Cargar x2 empaquetado
    vmulps xmm3, xmm0, xmm1     ; xmm3 = y1 * x2

    ; Restar: (x1 * y2) - (y1 * x2)
    vsubps xmm4, xmm2, xmm3     ; xmm4 = c3 (resultado del producto cruz)

    ; Guardar c3 en resultados[8:11]
    vmovaps [resultados + 32], xmm4  

    ; Devolver la dirección de resultados
    lea rax, [resultados]       ; Cargar la dirección de resultados en rax
    ret
