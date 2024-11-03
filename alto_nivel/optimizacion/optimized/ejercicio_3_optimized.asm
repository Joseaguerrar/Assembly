; Ejercicio 3: Jerson Bonilla Fernández (C31225)
section .data
    ; Definimos la matriz original en la sección de datos (4x4)
    matriz:     dw 1, 2, 3, 4
                dw 5, 6, 7, 8
                dw 9, 10, 11, 12
                dw 13, 14, 15, 16

section .text
    global _start

_start:
    ; Llamar al método para intercambiar los cuadrantes
    call intercambiar_cuadrantes

    ; Salir del programa
    mov rax, 60           ; syscall: exit
    xor rdi, rdi          ; código de salida 0
    syscall

intercambiar_cuadrantes:
    ; Cargamos la dirección base de la matriz en rdx para minimizar accesos a memoria
    lea rdx, [matriz] 

    ; Intercambiar el cuadrante superior izquierdo con el inferior derecho
    mov rax, [rdx + 0*2]   ; rax en lugar de ax para evitar dependencia falsa
    mov rbx, [rdx + 10*2]  ; rbx en lugar de bx para evitar dependencia falsa
    mov [rdx + 0*2], rbx
    mov [rdx + 10*2], rax

    mov rax, [rdx + 1*2]
    mov rbx, [rdx + 11*2]
    mov [rdx + 1*2], rbx
    mov [rdx + 11*2], rax

    mov rax, [rdx + 2*2]
    mov rbx, [rdx + 8*2]
    mov [rdx + 2*2], rbx
    mov [rdx + 8*2], rax

    mov rax, [rdx + 3*2]
    mov rbx, [rdx + 9*2]
    mov [rdx + 3*2], rbx
    mov [rdx + 9*2], rax

    ; Intercambiar el cuadrante superior derecho con el inferior izquierdo
    mov rax, [rdx + 4*2]
    mov rbx, [rdx + 12*2]
    mov [rdx + 4*2], rbx
    mov [rdx + 12*2], rax

    mov rax, [rdx + 5*2]
    mov rbx, [rdx + 13*2]
    mov [rdx + 5*2], rbx
    mov [rdx + 13*2], rax

    mov rax, [rdx + 6*2]
    mov rbx, [rdx + 14*2]
    mov [rdx + 6*2], rbx
    mov [rdx + 14*2], rax

    mov rax, [rdx + 7*2]
    mov rbx, [rdx + 15*2]
    mov [rdx + 7*2], rbx
    mov [rdx + 15*2], rax

    ret
