; Integrantes: Jose Guerra (C33510) y Jerson Bonilla (C31225)
section .data
max_value:     dd 255.0, 255.0, 255.0, 0.0  ; Máximo valor para inversión (255 - valor actual)

section .text
global apply_invert_filter
apply_invert_filter:
    ; Argumentos:
    ; 1. rdi: puntero a la imagen completa (intercalado BGR)
    ; 2. rsi: tamaño total de la imagen en bytes

    push rsi
    push rdi
    push rcx

    mov rcx, rsi  ; Número total de bytes a procesar a RCX
    movups xmm9, [max_value]  ; Cargar el valor máximo (255) en xmm9

.loop_start:
    cmp rcx, 3  ; Procesar bloques de 3 bytes (un pixel BGR)
    jl .end_loop

    ; Cargar valores B, G, R y convertir a flotantes
    movzx eax, byte [rdi]  ; Azul
    cvtsi2ss xmm0, eax  ; Azul en xmm0
    movzx eax, byte [rdi + 1]  ; Verde
    cvtsi2ss xmm1, eax  ; Verde en xmm1
    movzx eax, byte [rdi + 2]  ; Rojo
    cvtsi2ss xmm2, eax  ; Rojo en xmm2

    ; Empaquetar valores en xmm0
    unpcklps xmm0, xmm1  ; Combina azul y verde
    unpcklps xmm0, xmm2  ; Combina azul, verde y rojo

    ; Calcular el negativo (255 - valor)
    movaps xmm1, xmm9  ; Copiar 255 a xmm1
    subps xmm1, xmm0  ; Calcular negativo

    ; Convertir flotantes a enteros y almacenar en memoria
    cvtss2si eax, xmm1  ; Convertir el valor de azul (B)
    mov byte [rdi], al  ; Escribir el canal azul (B)

    shufps xmm1, xmm1, 0x92  ; Rotar para obtener el siguiente canal (G)
    cvtss2si eax, xmm1  ; Convertir el valor de verde (G)
    mov byte [rdi + 1], al  ; Escribir el canal verde (G)

    shufps xmm1, xmm1, 0x92  ; Rotar para obtener el siguiente canal (R)
    cvtss2si eax, xmm1  ; Convertir el valor de rojo (R)
    mov byte [rdi + 2], al  ; Escribir el canal rojo (R)

    ; Avanzar al siguiente píxel
    add rdi, 3                 ; Avanzar 3 bytes (un píxel)
    sub rcx, 3                 ; Reducir el contador
    jmp .loop_start

.end_loop:
    pop rcx
    pop rdi
    pop rsi
    ret
