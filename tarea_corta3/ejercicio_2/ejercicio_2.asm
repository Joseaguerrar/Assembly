section.data
    ;Matriz de 10x10 para números del 2 al 101
matriz     dd  2, 3, 4, 5, 6, 7, 8, 9, 10, 11
           dd  12, 13, 14, 15, 16, 17, 18, 19, 20, 21
           dd  22, 23, 24, 25, 26, 27, 28, 29, 30, 31
           dd  32, 33, 34, 35, 36, 37, 38, 39, 40, 41
           dd  42, 43, 44, 45, 46, 47, 48, 49, 50, 51
           dd  52, 53, 54, 55, 56, 57, 58, 59, 60, 61
           dd  62, 63, 64, 65, 66, 67, 68, 69, 70, 71
           dd  72, 73, 74, 75, 76, 77, 78, 79, 80, 81
           dd  82, 83, 84, 85, 86, 87, 88, 89, 90, 91
           dd  92, 93, 94, 95, 96, 97, 98, 99, 100, 101
; Vector para almacenar los números primos encontrados
resultado resd 25 ;que es suficiente para los primos menores o iguales a 101

;variable para contar la cantidad de primos encontrados
num_primos dd 0

section .bss
; Variable para el índice
idx resd 1

section .text
    global _start
_start:
    ; Llamar al método para ejecutar la criba de Eratóstenes
    call criba_eratostenes

    ; Finalizar el programa y devolver control al SO
    mov eax, 60 ; sys_exit
    xor edi, edi
    syscall

criba_eratostenes:
    ;Inicializar variables 
    xor ecx, ecx    ;índice de la matriz
    xor ebx, ebx    ;índice del resultado de primos
    xor esi, esi    ;Número actual en la criba

    ; Empezar la criba
criba_loop:
    ; Cargar el número en la posición actual de la matriz
    mov eax, [matriz + ecx*4]

    ; Si el número es 0, ha sido marcado como no primo, continuar con el siguiente
    cmp eax, 0
    je siguiente_numero

    ; Si el número es mayor que la raíz de 101, paramos

    cmp eax, 11 ;la raíz de 101 es aprox 10
    jg almacenar_primo


    ;Marcar los múltiplos del número actual como no primos mov esi, ecx
marcar_multiplos:
    ;Incrementar el índice para obtener el múltiplo
    add esi, eax
    cmp esi, 99 ;No sobrepasar el tamaño de la matriz
    jg fin_marcar

    ;Marcar el múltiplo como no primo(poner a 0)
    mov dword[matriz + esi*4], 0
    jmp marcar_multiplos

fin_marcar:
    ;Almacenar el número primo encontrado
almacenar_primo:
    mov eax, [matriz + ecx*4]
    mov [resultado + ebx*4], eax
    inc ebx     ;Incrementar índice del resultado
    mov [num_primos], ebx   ;Actualizar primos encontrados

    ;siguiente número en la matriz
siguiente_numero:
    inc ecx
    cmp ecx, 100
    jl cripa_loop

    ret