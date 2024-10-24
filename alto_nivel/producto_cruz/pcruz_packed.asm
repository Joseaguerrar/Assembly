section .text
global producto_cruz_packed
producto_cruz_packed:
    ; Inicializar contador en 8 para procesar 8 pares de vectores
    mov rcx, 8                  ; Contador para 8 iteraciones

procesar_vectores:
    ; Calcular c1 = a2*b3 - a3*b2
    vmovss xmm0, [rdi+4]        ; a2
    vmovss xmm1, [rsi+8]        ; b3
    vmulss xmm2, xmm0, xmm1     ; xmm2 = a2 * b3
    vmovss [rdx], xmm2          ; Guardar a2 * b3 en resultado

    vmovss xmm0, [rdi+8]        ; a3
    vmovss xmm1, [rsi+4]        ; b2
    vmulss xmm2, xmm0, xmm1     ; xmm2 = a3 * b2
    vmovss [rdx+4], xmm2        ; Guardar a3 * b2 en resultado

    vmovss xmm0, [rdx]          ; Cargar a2 * b3
    vmovss xmm1, [rdx+4]        ; Cargar a3 * b2
    vsubss xmm2, xmm0, xmm1     ; xmm2 = a2*b3 - a3*b2
    vmovss [rdx], xmm2          ; Guardar c1 en resultado

    ; Calcular c2 = a3*b1 - a1*b3
    vmovss xmm0, [rdi+8]        ; a3
    vmovss xmm1, [rsi]          ; b1
    vmulss xmm2, xmm0, xmm1     ; xmm2 = a3 * b1
    vmovss [rdx+4], xmm2        ; Guardar a3 * b1 en resultado

    vmovss xmm0, [rdi]          ; a1
    vmovss xmm1, [rsi+8]        ; b3
    vmulss xmm2, xmm0, xmm1     ; xmm2 = a1 * b3
    vmovss [rdx+8], xmm2        ; Guardar a1 * b3 en resultado

    vmovss xmm0, [rdx+4]        ; Cargar a3 * b1
    vmovss xmm1, [rdx+8]        ; Cargar a1 * b3
    vsubss xmm2, xmm0, xmm1     ; xmm2 = a3*b1 - a1*b3
    vmovss [rdx+4], xmm2        ; Guardar c2 en resultado

    ; Calcular c3 = a1*b2 - a2*b1
    vmovss xmm0, [rdi]          ; a1
    vmovss xmm1, [rsi+4]        ; b2
    vmulss xmm2, xmm0, xmm1     ; xmm2 = a1 * b2
    vmovss [rdx+8], xmm2        ; Guardar a1 * b2 en resultado

    vmovss xmm0, [rdi+4]        ; a2
    vmovss xmm1, [rsi]          ; b1
    vmulss xmm2, xmm0, xmm1     ; xmm2 = a2 * b1
    vmovss [rdx+12], xmm2       ; Guardar a2 * b1 en resultado

    vmovss xmm0, [rdx+8]        ; Cargar a1 * b2
    vmovss xmm1, [rdx+12]       ; Cargar a2 * b1
    vsubss xmm2, xmm0, xmm1     ; xmm2 = a1*b2 - a2*b1
    vmovss [rdx+8], xmm2        ; Guardar c3 en resultado

    ; Avanzar punteros rdi, rsi y rdx para la siguiente iteración
    add rdx, 12                 ; Avanzar 12 bytes para almacenar el siguiente vector
    add rdi, 12                 ; Avanzar 12 bytes para los siguientes valores de vector1
    add rsi, 12                 ; Avanzar 12 bytes para los siguientes valores de vector2

    ; Decrementar el contador y verificar si seguimos iterando
    dec rcx                     ; Decrementar el contador
    jnz procesar_vectores        ; Si rcx no es cero, repetir el bucle

    mov rax, rdx                ; Retornar la dirección del resultado
    ret
