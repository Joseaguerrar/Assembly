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
    mov ax, [matriz + 0*2]  ; ax = matriz[0]
    mov bx, [matriz + 10*2] ; bx = matriz[10]
    mov [matriz + 0*2], bx  ; matriz[0] = matriz[10]
    mov [matriz + 10*2], ax ; matriz[10] = ax

    mov ax, [matriz + 1*2]  ; ax = matriz[1]
    mov bx, [matriz + 11*2] ; bx = matriz[11]
    mov [matriz + 1*2], bx  ; matriz[1] = matriz[11]
    mov [matriz + 11*2], ax ; matriz[11] = ax

    mov ax, [matriz + 2*2]  ; ax = matriz[2]
    mov bx, [matriz + 8*2]  ; bx = matriz[8]
    mov [matriz + 2*2], bx  ; matriz[2] = matriz[8]
    mov [matriz + 8*2], ax  ; matriz[8] = ax

    mov ax, [matriz + 3*2]  ; ax = matriz[3]
    mov bx, [matriz + 9*2]  ; bx = matriz[9]
    mov [matriz + 3*2], bx  ; matriz[3] = matriz[9]
    mov [matriz + 9*2], ax  ; matriz[9] = ax

    ; Intercambiar el cuadrante superior derecho con el inferior izquierdo
    mov ax, [matriz + 4*2]  ; ax = matriz[4]
    mov bx, [matriz + 12*2] ; bx = matriz[12]
    mov [matriz + 4*2], bx  ; matriz[4] = matriz[12]
    mov [matriz + 12*2], ax ; matriz[12] = ax

    mov ax, [matriz + 5*2]  ; ax = matriz[5]
    mov bx, [matriz + 13*2] ; bx = matriz[13]
    mov [matriz + 5*2], bx  ; matriz[5] = matriz[13]
    mov [matriz + 13*2], ax ; matriz[13] = ax

    mov ax, [matriz + 6*2]  ; ax = matriz[6]
    mov bx, [matriz + 14*2] ; bx = matriz[14]
    mov [matriz + 6*2], bx  ; matriz[6] = matriz[14]
    mov [matriz + 14*2], ax ; matriz[14] = ax

    mov ax, [matriz + 7*2]  ; ax = matriz[7]
    mov bx, [matriz + 15*2] ; bx = matriz[15]
    mov [matriz + 7*2], bx  ; matriz[7] = matriz[15]
    mov [matriz + 15*2], ax ; matriz[15] = ax

    ret