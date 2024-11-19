section .data
weights:       dd 0.11, 0.59, 0.3, 0.0  ; Pesos para los canales B, G, R (escala de grises)
threshold:     dd 128.0                 ; Umbral de intensidad para binarización
white_value:   db 255                   ; Valor para píxeles blancos
black_value:   db 0                     ; Valor para píxeles negros

section .text
global apply_binarize_filter
apply_binarize_filter:
    ; Argumentos:
    ; - rdi: puntero a la imagen completa (intercalado BGR)
    ; - rsi: tamaño total de la imagen en bytes

    push rsi
    push rdi
    push rcx

    mov rcx, rsi            ; Número total de bytes a procesar

    movups xmm6, [weights]  ; Pesos empaquetados para B, G, R
    movss xmm7, [threshold] ; Umbral para comparar

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

    ; Calcular intensidad en escala de grises
    mulps xmm0, xmm6             ; Multiplicar por los pesos
    haddps xmm0, xmm0            ; Sumar elementos empaquetados
    haddps xmm0, xmm0            ; Finalizar suma horizontal

    ; Comparar con el umbral
    comiss xmm0, xmm7            ; Comparar intensidad con el umbral
    jae .set_white               ; Si >= umbral, píxel blanco

.set_black:
    mov al, [black_value]        ; Establecer píxel negro
    mov byte [rdi], al
    mov byte [rdi + 1], al
    mov byte [rdi + 2], al
    jmp .next_pixel

.set_white:
    mov al, [white_value]        ; Establecer píxel blanco
    mov byte [rdi], al
    mov byte [rdi + 1], al
    mov byte [rdi + 2], al

.next_pixel:
    add rdi, 3                   ; Avanzar al siguiente píxel
    sub rcx, 3                   ; Reducir el contador
    jmp .loop_start

.end_loop:
    pop rcx
    pop rdi
    pop rsi
    ret
