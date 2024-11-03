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
    ; Intercambiar el cuadrante superior izquierdo con el inferior derecho
    mov rax, [matriz + 0*2]   ; Usamos rax en lugar de ax para evitar dependencia falsa
    mov rbx, [matriz + 10*2]  ; Usamos rbx en lugar de bx para evitar dependencia falsa
    mov [matriz + 0*2], rbx
    mov [matriz + 10*2], rax

    mov rax, [matriz + 1*2]
    mov rbx, [matriz + 11*2]
    mov [matriz + 1*2], rbx
    mov [matriz + 11*2], rax

    mov rax, [matriz + 2*2]
    mov rbx, [matriz + 8*2]
    mov [matriz + 2*2], rbx
    mov [matriz + 8*2], rax

    mov rax, [matriz + 3*2]
    mov rbx, [matriz + 9*2]
    mov [matriz + 3*2], rbx
    mov [matriz + 9*2], rax

    ; Intercambiar el cuadrante superior derecho con el inferior izquierdo
    mov rax, [matriz + 4*2]
    mov rbx, [matriz + 12*2]
    mov [matriz + 4*2], rbx
    mov [matriz + 12*2], rax

    mov rax, [matriz + 5*2]
    mov rbx, [matriz + 13*2]
    mov [matriz + 5*2], rbx
    mov [matriz + 13*2], rax

    mov rax, [matriz + 6*2]
    mov rbx, [matriz + 14*2]
    mov [matriz + 6*2], rbx
    mov [matriz + 14*2], rax

    mov rax, [matriz + 7*2]
    mov rbx, [matriz + 15*2]
    mov [matriz + 7*2], rbx
    mov [matriz + 15*2], rax

    ret
