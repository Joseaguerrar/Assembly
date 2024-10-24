section .data
    resultado: times 24 dd 0.0  ; Espacio para el resultado de 8 productos cruz (3 componentes por vector)

section .text
global producto_cruz_packed
producto_cruz_packed:
    ; Primer conjunto de 8 vectores
    vmovaps ymm0, [rdi]        ; a1 (8 valores empaquetados)
    vmovaps ymm1, [rdi+32]     ; a2 (8 valores empaquetados)
    vmovaps ymm2, [rdi+64]     ; a3 (8 valores empaquetados)

    ; Segundo conjunto de 8 vectores
    vmovaps ymm3, [rsi]        ; b1 (8 valores empaquetados)
    vmovaps ymm4, [rsi+32]     ; b2 (8 valores empaquetados)
    vmovaps ymm5, [rsi+64]     ; b3 (8 valores empaquetados)

    ; Calcular c1 para los 8 pares de vectores
    vmulps ymm6, ymm1, ymm5    ; a2 * b3
    vmulps ymm7, ymm2, ymm4    ; a3 * b2
    vsubps ymm8, ymm6, ymm7    ; a2*b3 - a3*b2
    vmovaps [resultado], ymm8  ; Guardar c1

    ; Calcular c2 para los 8 pares de vectores
    vmulps ymm6, ymm2, ymm3    ; a3 * b1
    vmulps ymm7, ymm0, ymm5    ; a1 * b3
    vsubps ymm8, ymm6, ymm7    ; a3*b1 - a1*b3
    vmovaps [resultado+32], ymm8  ; Guardar c2

    ; Calcular c3 para los 8 pares de vectores
    vmulps ymm6, ymm0, ymm4    ; a1 * b2
    vmulps ymm7, ymm1, ymm3    ; a2 * b1
    vsubps ymm8, ymm6, ymm7    ; a1*b2 - a2*b1
    vmovaps [resultado+64], ymm8  ; Guardar c3

    mov rax, resultado
    ret
