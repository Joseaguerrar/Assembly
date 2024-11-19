section .data
max_value: dd 255                ; Valor máximo para inversión

section .text
global apply_invert_filter
apply_invert_filter:
    ; Argumentos:
    ; - rdi: puntero a la imagen completa (intercalado BGR)
    ; - rsi: tamaño total de la imagen en bytes

    push rsi
    push rdi
    push rcx

    mov rcx, rsi            ; Número total de bytes a procesar
    movss xmm6, [max_value] ; Valor máximo empaquetado (255)

.loop_start:
    cmp rcx, 0
    jle .end_loop

    ; Invertir azul
    movzx eax, byte [rdi]        ; Azul original
    cvtsi2ss xmm0, eax           ; Azul en xmm0
    movaps xmm7, xmm6            ; Copiar 255 a xmm7
    subss xmm7, xmm0             ; 255 - azul
    cvtss2si eax, xmm7           ; Convertir a entero
    mov byte [rdi], al           ; Guardar valor invertido

    ; Invertir verde
    movzx eax, byte [rdi + 1]    ; Verde original
    cvtsi2ss xmm0, eax
    movaps xmm7, xmm6            ; Copiar 255 a xmm7
    subss xmm7, xmm0             ; 255 - verde
    cvtss2si eax, xmm7
    mov byte [rdi + 1], al

    ; Invertir rojo
    movzx eax, byte [rdi + 2]    ; Rojo original
    cvtsi2ss xmm0, eax
    movaps xmm7, xmm6            ; Copiar 255 a xmm7
    subss xmm7, xmm0             ; 255 - rojo
    cvtss2si eax, xmm7
    mov byte [rdi + 2], al

    add rdi, 3                   ; Avanzar al siguiente píxel
    sub rcx, 3                   ; Reducir el contador
    jmp .loop_start

.end_loop:
    pop rcx
    pop rdi
    pop rsi
    ret
