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

    ; Intercambio del cuadrante superior izquierdo con el inferior derecho, usando acumuladores adicionales
    mov rax, [rdx + 0*2]     ; Cargamos matriz[0] en rax
    mov rbx, [rdx + 10*2]    ; Cargamos matriz[10] en rbx
    mov rcx, [rdx + 1*2]     ; Cargamos matriz[1] en rcx
    mov rdi, [rdx + 11*2]    ; Cargamos matriz[11] en rdi

    ; Realizamos el intercambio sin cadenas largas de dependencia
    mov [rdx + 0*2], rbx     ; matriz[0] = matriz[10]
    mov [rdx + 10*2], rax    ; matriz[10] = matriz[0]
    mov [rdx + 1*2], rdi     ; matriz[1] = matriz[11]
    mov [rdx + 11*2], rcx    ; matriz[11] = matriz[1]

    ; Continuamos con el mismo patrón para los siguientes elementos
    mov rax, [rdx + 2*2]
    mov rbx, [rdx + 8*2]
    mov rcx, [rdx + 3*2]
    mov rdi, [rdx + 9*2]

    mov [rdx + 2*2], rbx     ; matriz[2] = matriz[8]
    mov [rdx + 8*2], rax     ; matriz[8] = matriz[2]
    mov [rdx + 3*2], rdi     ; matriz[3] = matriz[9]
    mov [rdx + 9*2], rcx     ; matriz[9] = matriz[3]

    ; Intercambio del cuadrante superior derecho con el inferior izquierdo
    mov rax, [rdx + 4*2]
    mov rbx, [rdx + 12*2]
    mov rcx, [rdx + 5*2]
    mov rdi, [rdx + 13*2]

    mov [rdx + 4*2], rbx     ; matriz[4] = matriz[12]
    mov [rdx + 12*2], rax    ; matriz[12] = matriz[4]
    mov [rdx + 5*2], rdi     ; matriz[5] = matriz[13]
    mov [rdx + 13*2], rcx    ; matriz[13] = matriz[5]

    ; Continuamos con el mismo patrón para los últimos elementos
    mov rax, [rdx + 6*2]
    mov rbx, [rdx + 14*2]
    mov rcx, [rdx + 7*2]
    mov rdi, [rdx + 15*2]

    mov [rdx + 6*2], rbx     ; matriz[6] = matriz[14]
    mov [rdx + 14*2], rax    ; matriz[14] = matriz[6]
    mov [rdx + 7*2], rdi     ; matriz[7] = matriz[15]
    mov [rdx + 15*2], rcx    ; matriz[15] = matriz[7]

    ret
