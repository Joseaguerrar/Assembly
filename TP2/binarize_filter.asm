; Integrantes: Jose Guerra (C33510) y Jerson Bonilla (C31225)
section .data
; Pesos para los canales B, G, R (escala de grises), necesitamos usarlos
; para encontrar la intensidad de cada pixel (su nivel de gris)
; Si usaramos escala de grises la comparación con el umbral podría no ser precisa,
; puesto que los valores RGB por si solos no reflejan el brillo real
weights:       dd 0.11, 0.59, 0.3, 0.0 

threshold:     dd 128.0  ; Umbral de intensidad para determinar blanco o negro
white_value:   db 255  ; Valor pixeles blancos
black_value:   db 0  ; Valor pixeles negros

section .text
global apply_binarize_filter
apply_binarize_filter:
    ; Argumentos:
    ; 1. rdi: puntero a la imagen completa (intercalado BGR)
    ; 2. rsi: tamaño total de la imagen en bytes 

    push rsi
    push rdi
    push rcx

    mov rcx, rsi  ; Número total de bytes a procesar a RCX

    movups xmm6, [weights]  ; Pesos empaquetados para B, G, R
    movss xmm7, [threshold] ; Umbral para comparar

.loop_start:
    cmp rcx, 3  ; Procesar bloques de 3 bytes (un pixel BGR)
    jl .end_loop

    ; Cargar BGR en registros SSE
    movzx eax, byte [rdi]  ; Azul
    cvtsi2ss xmm0, eax  ; Azul en xmm0
    movzx eax, byte [rdi + 1]  ; Verde
    cvtsi2ss xmm1, eax  ; Verde en xmm1
    movzx eax, byte [rdi + 2]  ; Rojo
    cvtsi2ss xmm2, eax  ; Rojo en xmm2

    ; Empaquetar BGR en un solo registro SSE
    unpcklps xmm0, xmm1  ; Combina azul y verde
    unpcklps xmm0, xmm2  ; Combina azul, verde y rojo en xmm0

    ; Calcular intensidad en escala de grises
    mulps xmm0, xmm6  ; Multiplicar por los pesos
    haddps xmm0, xmm0  ; Sumar elementos empaquetados
    haddps xmm0, xmm0  ; Finalizar suma horizontal

    ; Comparar con el umbral
    comiss xmm0, xmm7  ; Comparar intensidad con el umbral
    jae .set_white  ; Si >= umbral, pixel blanco

; Si no es pixel blanco, por descarte es negro
.set_black:
    mov al, [black_value]  ; Establecer pixel negro
    mov byte [rdi], al
    mov byte [rdi + 1], al
    mov byte [rdi + 2], al
    jmp .next_pixel

.set_white:
    mov al, [white_value]  ; Establecer pixel blanco
    mov byte [rdi], al
    mov byte [rdi + 1], al
    mov byte [rdi + 2], al

.next_pixel:
    add rdi, 3  ; Avanzar al siguiente pixel
    sub rcx, 3  ; Reducir el contador de bytes restantes
    jmp .loop_start

.end_loop:
    pop rcx
    pop rdi
    pop rsi
    ret
