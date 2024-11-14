section .data
red_coef1:    dd 0.393
red_coef2:    dd 0.769
red_coef3:    dd 0.189
green_coef1:  dd 0.349
green_coef2:  dd 0.686
green_coef3:  dd 0.168
blue_coef1:   dd 0.272
blue_coef2:   dd 0.534
blue_coef3:   dd 0.131

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

    ; Cargar coeficientes en registros xmm
    movss xmm6, dword [red_coef1]
    movss xmm7, dword [red_coef2]
    movss xmm8, dword [red_coef3]
    movss xmm9, dword [green_coef1]
    movss xmm10, dword [green_coef2]
    movss xmm11, dword [green_coef3]
    movss xmm12, dword [blue_coef1]
    movss xmm13, dword [blue_coef2]
    movss xmm14, dword [blue_coef3]

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

    ; Calcular nuevo valor del canal rojo usando la fórmula de sepia con SSE
    movss xmm3, xmm2             ; xmm3 = rojo
    mulss xmm3, xmm6             ; xmm3 *= 0.393
    movss xmm4, xmm1             ; xmm4 = verde
    mulss xmm4, xmm7             ; xmm4 *= 0.769
    movss xmm5, xmm0             ; xmm5 = azul
    mulss xmm5, xmm8             ; xmm5 *= 0.189
    addss xmm3, xmm4             ; xmm3 = rojo * 0.393 + verde * 0.769
    addss xmm3, xmm5             ; xmm3 += azul * 0.189
    cvtss2si eax, xmm3           ; convertir a entero
    cmp eax, 255
    jle .skip_red_saturate
    mov eax, 255
.skip_red_saturate:
    mov byte [rdi + 2], al       ; guardar nuevo rojo

    ; Calcular nuevo valor del canal verde usando la fórmula de sepia con SSE
    movss xmm3, xmm2             ; xmm3 = rojo
    mulss xmm3, xmm9             ; xmm3 *= 0.349
    movss xmm4, xmm1             ; xmm4 = verde
    mulss xmm4, xmm10            ; xmm4 *= 0.686
    movss xmm5, xmm0             ; xmm5 = azul
    mulss xmm5, xmm11            ; xmm5 *= 0.168
    addss xmm3, xmm4             ; xmm3 = rojo * 0.349 + verde * 0.686
    addss xmm3, xmm5             ; xmm3 += azul * 0.168
    cvtss2si eax, xmm3           ; convertir a entero
    cmp eax, 255
    jle .skip_green_saturate
    mov eax, 255
.skip_green_saturate:
    mov byte [rdi + 1], al       ; guardar nuevo verde

    ; Calcular nuevo valor del canal azul usando la fórmula de sepia con SSE
    movss xmm3, xmm2             ; xmm3 = rojo
    mulss xmm3, xmm12            ; xmm3 *= 0.272
    movss xmm4, xmm1             ; xmm4 = verde
    mulss xmm4, xmm13            ; xmm4 *= 0.534
    movss xmm5, xmm0             ; xmm5 = azul
    mulss xmm5, xmm14            ; xmm5 *= 0.131
    addss xmm3, xmm4             ; xmm3 = rojo * 0.272 + verde * 0.534
    addss xmm3, xmm5             ; xmm3 += azul * 0.131
    cvtss2si eax, xmm3           ; convertir a entero
    cmp eax, 255
    jle .skip_blue_saturate
    mov eax, 255
.skip_blue_saturate:
    mov byte [rdi], al           ; guardar nuevo azul

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
