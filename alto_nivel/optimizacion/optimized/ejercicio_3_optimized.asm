section .data
    matriz:     dw 1, 2, 3, 4
                dw 5, 6, 7, 8
                dw 9, 10, 11, 12
                dw 13, 14, 15, 16

section .text
    global _start

_start:
    call intercambiar_cuadrantes

    mov rax, 60           ; syscall: exit
    xor rdi, rdi          ; código de salida 0
    syscall

intercambiar_cuadrantes:
    mov rcx, 4            ; Iterar 4 veces para los elementos a intercambiar
    mov rsi, matriz       ; rsi apunta al inicio de matriz
    mov rdi, matriz + 10*2 ; rdi apunta al inicio del cuadrante inferior derecho

swap_upper_left_lower_right:
    mov ax, [rsi]         ; Cargar valor del cuadrante superior izquierdo en ax
    mov bx, [rdi]         ; Cargar valor del cuadrante inferior derecho en bx
    mov [rsi], bx         ; Escribir valor del inferior derecho en superior izquierdo
    mov [rdi], ax         ; Escribir valor del superior izquierdo en inferior derecho

    add rsi, 2            ; Avanzar al siguiente elemento en el cuadrante superior izquierdo
    add rdi, 2            ; Avanzar al siguiente elemento en el cuadrante inferior derecho
    loop swap_upper_left_lower_right

    ; Reiniciar punteros para el siguiente cuadrante
    mov rcx, 4            ; Otra vez 4 intercambios para los siguientes elementos
    mov rsi, matriz + 4*2 ; Apuntar al inicio del cuadrante superior derecho
    mov rdi, matriz + 12*2 ; Apuntar al inicio del cuadrante inferior izquierdo

swap_upper_right_lower_left:
    mov ax, [rsi]         ; Cargar valor del cuadrante superior derecho en ax
    mov bx, [rdi]         ; Cargar valor del cuadrante inferior izquierdo en bx
    mov [rsi], bx         ; Escribir valor del inferior izquierdo en superior derecho
    mov [rdi], ax         ; Escribir valor del superior derecho en inferior izquierdo

    add rsi, 2            ; Avanzar al siguiente elemento en el cuadrante superior derecho
    add rdi, 2            ; Avanzar al siguiente elemento en el cuadrante inferior izquierdo
    loop swap_upper_right_lower_left

    ret

; Ejemplo 3: Intercambiar cuadrantes de una matriz
; Uso de bucles: En lugar de repetir el intercambio para cada elemento, se usaron bucles para reducir la repetición de código y aumentar la eficiencia.
; Uso de punteros para acceso a cuadrantes: Registros (rsi y rdi) se emplearon para apuntar a los elementos de cada cuadrante, avanzando de manera uniforme en cada iteración sin necesidad de cálculos de índice, reduciendo así el número de instrucciones.