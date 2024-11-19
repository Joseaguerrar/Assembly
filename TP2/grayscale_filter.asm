section .data
weights:       dd 0.11, 0.59, 0.3, 0.0  ; Pesos para los canales B, G, R (escala de grises)
max_value:     dd 255.0                 ; Máximo valor permitido para saturación

section .text
global apply_grayscale_filter
apply_grayscale_filter:
    ; Argumentos:
    ; - rdi: puntero a la imagen completa (intercalado BGR)
    ; - rsi: tamaño total de la imagen en bytes

    push rsi
    push rdi
    push rcx

    mov rcx, rsi            ; Número total de bytes a procesar

    movups xmm6, [weights]  ; Pesos empaquetados para B, G, R
    movss xmm9, [max_value] ; Valor máximo permitido

.loop_start:
    cmp rcx, 3              ; Procesar bloques de 3 bytes (un píxel BGR)
    jl .end_loop

    ; Cargar BGR en registros SSE
    movzx eax, byte [rdi]        ; Azul
    cvtsi2ss xmm0, eax           ; Azul en xmm0
    movzx eax, byte [rdi + 1]    ; Verde
    cvtsi2ss xmm1, eax           ; Verde en xmm1
    movzx eax, byte [rdi + 2]    ; Rojo
    cvtsi2ss xmm2, eax           ; Rojo en xmm2

    ; Empaquetar BGR en un registro
    unpcklps xmm0, xmm1          ; Combina azul y verde
    unpcklps xmm0, xmm2          ; Combina azul, verde y rojo en xmm0

    ; Aplicar los pesos para calcular escala de grises
    mulps xmm0, xmm6             ; Multiplicar por los pesos
    haddps xmm0, xmm0            ; Sumar elementos empaquetados
    haddps xmm0, xmm0            ; Finalizar suma horizontal
    minss xmm0, xmm9             ; Saturar a 255
    cvtss2si eax, xmm0           ; Convertir a entero

    ; Asignar el mismo valor (grayscale) a los tres canales
    mov byte [rdi], al
    mov byte [rdi + 1], al
    mov byte [rdi + 2], al

    add rdi, 3                   ; Avanzar al siguiente píxel
    sub rcx, 3                   ; Reducir el contador
    jmp .loop_start

.end_loop:
    pop rcx
    pop rdi
    pop rsi
    ret
