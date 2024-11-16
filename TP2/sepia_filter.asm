section .data
; Coeficientes empaquetados para los canales (rojo, verde, azul)
coefficients_red:    dd 0.393, 0.769, 0.189, 0.0  ; Coeficientes para el canal rojo
coefficients_green:  dd 0.349, 0.686, 0.168, 0.0  ; Coeficientes para el canal verde
coefficients_blue:   dd 0.272, 0.534, 0.131, 0.0  ; Coeficientes para el canal azul
max_value:           dd 255.0                     ; Máximo valor permitido para saturación

section .text
global apply_sepia_filter
apply_sepia_filter:
    ; Argumentos:
    ; - rdi: puntero a la imagen completa (intercalado BGR)
    ; - rsi: tamaño total de la imagen en bytes (debería ser image.data.size())

    ; Guardar registros usados
    push rsi
    push rdi
    push rcx

    mov rcx, rsi             ; rcx = número total de bytes a procesar

    ; Cargar coeficientes empaquetados en registros xmm
    movaps xmm6, [coefficients_red]    ; Coeficientes del canal rojo
    movaps xmm7, [coefficients_green]  ; Coeficientes del canal verde
    movaps xmm8, [coefficients_blue]   ; Coeficientes del canal azul
    movss xmm9, [max_value]            ; Máximo valor para saturación

.loop_start:
    cmp rcx, 0
    jle .end_loop

    ; Cargar los valores originales de azul, verde, rojo en SSE
    movzx eax, byte [rdi]        ; azul
    cvtsi2ss xmm0, eax           ; azul en xmm0
    movzx eax, byte [rdi + 1]    ; verde
    cvtsi2ss xmm1, eax           ; verde en xmm1
    movzx eax, byte [rdi + 2]    ; rojo
    cvtsi2ss xmm2, eax           ; rojo en xmm2

    ; Empaquetar los valores BGR en un registro para procesamiento paralelo
    unpcklps xmm0, xmm1          ; Combina azul y verde
    unpcklps xmm0, xmm2          ; Combina azul, verde y rojo en xmm0

    ; Calcular el nuevo valor para el canal rojo
    movaps xmm3, xmm0            ; Copiar valores originales
    mulps xmm3, xmm6             ; Multiplicar por los coeficientes del canal rojo
    haddps xmm3, xmm3            ; Sumar elementos empaquetados
    haddps xmm3, xmm3            ; Finalizar suma
    minss xmm3, xmm9             ; Limitar al valor máximo de 255
    cvtss2si eax, xmm3           ; Convertir a entero
    mov byte [rdi + 2], al       ; Guardar nuevo valor rojo

    ; Calcular el nuevo valor para el canal verde
    movaps xmm3, xmm0            ; Copiar valores originales
    mulps xmm3, xmm7             ; Multiplicar por los coeficientes del canal verde
    haddps xmm3, xmm3            ; Sumar elementos empaquetados
    haddps xmm3, xmm3            ; Finalizar suma
    minss xmm3, xmm9             ; Limitar al valor máximo de 255
    cvtss2si eax, xmm3           ; Convertir a entero
    mov byte [rdi + 1], al       ; Guardar nuevo valor verde

    ; Calcular el nuevo valor para el canal azul
    movaps xmm3, xmm0            ; Copiar valores originales
    mulps xmm3, xmm8             ; Multiplicar por los coeficientes del canal azul
    haddps xmm3, xmm3            ; Sumar elementos empaquetados
    haddps xmm3, xmm3            ; Finalizar suma
    minss xmm3, xmm9             ; Limitar al valor máximo de 255
    cvtss2si eax, xmm3           ; Convertir a entero
    mov byte [rdi], al           ; Guardar nuevo valor azul

    ; Avanzar al siguiente conjunto de canales (BGR)
    add rdi, 3                   ; avanzar 3 bytes para el siguiente píxel
    sub rcx, 3                   ; reducir el contador de bytes en 3
    jmp .loop_start

.end_loop:
    ; Restaurar registros
    pop rcx
    pop rdi
    pop rsi
    ret
