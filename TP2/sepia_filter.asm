section .data
    sepia_r_coeff dq 393, 769, 189  ; Coeficientes para el canal R en formato entero (ej.: 0.393 -> 393)
    sepia_g_coeff dq 349, 686, 168  ; Coeficientes para el canal G en formato entero
    sepia_b_coeff dq 272, 534, 131  ; Coeficientes para el canal B en formato entero
    max_value dd 255                ; Valor máximo de un canal de color

section .text
global apply_sepia_filter
apply_sepia_filter:
    ; Argumentos:
    ; - rdi: puntero a los datos de la imagen
    ; - rsi: ancho de la imagen
    ; - rdx: alto de la imagen

    ; Guardar registros usados
    push rsi
    push rdi
    push rdx
    push rbx
    push rcx
    push r8
    push r9
    push r10
    push r11

    ; Desplazar el puntero 54 bytes para saltar el encabezado BMP
    add rdi, 54

    ; Calcular el total de píxeles
    mov rcx, rsi
    imul rcx, rdx            ; rcx = ancho * alto, total de píxeles
    mov r8, rcx              ; r8 = número total de píxeles

.loop_start:
    ; Comprobar si hemos terminado de procesar todos los píxeles
    test r8, r8
    jz .end_loop

    ; Cargar los valores BGR del píxel actual en enteros
    movzx eax, byte [rdi]       ; cargar B en eax
    mov edx, eax                ; Copiar B a edx para usar después
    movzx ebx, byte [rdi + 1]   ; cargar G en ebx
    mov ecx, ebx                ; Copiar G a ecx para usar después
    movzx esi, byte [rdi + 2]   ; cargar R en esi

    ; Calcular el nuevo valor R' para el canal rojo
    mov eax, esi                ; Cargar R
    imul eax, dword [sepia_r_coeff]   ; R * 393
    mov r9d, eax                ; Guardar resultado temporal en r9d
    mov eax, ebx                ; Cargar G
    imul eax, dword [sepia_r_coeff + 4] ; G * 769
    add r9d, eax                ; Acumular en r9d
    mov eax, edx                ; Cargar B
    imul eax, dword [sepia_r_coeff + 8] ; B * 189
    add r9d, eax                ; Acumular en r9d
    shr r9d, 10                 ; Dividir entre 1024 para aproximar el decimal
    cmp r9d, dword [max_value]
    jle .skip_saturate_r
    mov r9d, dword [max_value]
.skip_saturate_r:
    mov byte [rdi + 2], r9b     ; Guardar el nuevo R en la imagen

    ; Calcular el nuevo valor G' para el canal verde
    mov eax, esi                ; Cargar R
    imul eax, dword [sepia_g_coeff]   ; R * 349
    mov r10d, eax               ; Guardar resultado temporal en r10d
    mov eax, ebx                ; Cargar G
    imul eax, dword [sepia_g_coeff + 4] ; G * 686
    add r10d, eax               ; Acumular en r10d
    mov eax, edx                ; Cargar B
    imul eax, dword [sepia_g_coeff + 8] ; B * 168
    add r10d, eax               ; Acumular en r10d
    shr r10d, 10                ; Dividir entre 1024 para aproximar el decimal
    cmp r10d, dword [max_value]
    jle .skip_saturate_g
    mov r10d, dword [max_value]
.skip_saturate_g:
    mov byte [rdi + 1], r10b    ; Guardar el nuevo G en la imagen

    ; Calcular el nuevo valor B' para el canal azul
    mov eax, esi                ; Cargar R
    imul eax, dword [sepia_b_coeff]   ; R * 272
    mov r11d, eax               ; Guardar resultado temporal en r11d
    mov eax, ebx                ; Cargar G
    imul eax, dword [sepia_b_coeff + 4] ; G * 534
    add r11d, eax               ; Acumular en r11d
    mov eax, edx                ; Cargar B
    imul eax, dword [sepia_b_coeff + 8] ; B * 131
    add r11d, eax               ; Acumular en r11d
    shr r11d, 10                ; Dividir entre 1024 para aproximar el decimal
    cmp r11d, dword [max_value]
    jle .skip_saturate_b
    mov r11d, dword [max_value]
.skip_saturate_b:
    mov byte [rdi], r11b        ; Guardar el nuevo B en la imagen

    ; Avanzar al siguiente píxel
    add rdi, 3
    dec r8
    jmp .loop_start

.end_loop:
    ; Restaurar registros
    pop r11
    pop r10
    pop r9
    pop r8
    pop rcx
    pop rbx
    pop rdx
    pop rsi
    pop rdi
    ret
