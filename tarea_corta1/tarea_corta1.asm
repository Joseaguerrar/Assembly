;Tarea_Corta1   Jose Guerra Rodríguez C33510: 50%   Camilo Montero Moya C25030: 50%

;Resumen del Proceso:
;Este algoritmo usa divisiones sucesivas para descomponer un número decimal en sus dígitos individuales, 
;los convierte a caracteres ASCII y luego los imprime en la consola. 
;La clave es utilizar divisores decrecientes (iniciando en 10000 y dividiéndolo entre 10 en cada paso) 
;para extraer y procesar cada dígito del número de manera secuencial.

section .data
divisor dq 10000      ; Divisor inicial (10000 en decimal)
section .bss
buffer resb 5         ; Espacio para almacenar hasta 5 dígitos
index resb 1          ; Espacio para el índice del buffer
section .text
global _start

_start:
    ; Número inicial almacenado en RAX
    mov rax, 0x4321      ; Cargar el número en RAX (decimal 17185)
    call conversion

    ; Imprimir el número completo
    call imprimir_numero

    ; Finalizar el programa
    call finalizar

; Función para la conversión y descomposición del número
conversion:
    mov rbx, [divisor]   ; Cargar divisor inicial (10000)
    mov byte [index], 0  ; Inicializar índice del buffer

ciclo:
    cmp rbx, 1           ; Comprobar si el divisor es 1 (último dígito)
    je ultimo_digito     ; Si es 1, saltar a procesar el último dígito
    cmp rbx, 0           ; Verificar si el divisor es 0
    je fin_conversion    ; Si es 0, terminar la conversión
    cmp rax, 0           ; Verificar si RAX es 0
    jz fin_conversion    ; Si es 0, terminar la conversión
    xor rdx, rdx         ; Limpiar RDX para la división
    div rbx              ; Dividir RAX entre RBX -> RAX = cociente, RDX = residuo
    add rax, '0'         ; Convertir el cociente a carácter ASCII

    ; Guardar el dígito convertido en el buffer
    mov rsi, [index]
    mov [buffer + rsi], al
    inc byte [index]

    ; Preparar para el siguiente ciclo
    mov rax, rdx         ; Mover el residuo (el número restante) a RAX
    mov rbx, 10          ; Preparar el siguiente divisor
    jmp ciclo            ; Repetir el ciclo para el siguiente dígito

ultimo_digito:
    xor rdx, rdx         ; Limpiar RDX
    div rbx              ; Dividir RAX por 1 (el último divisor)
    add rax, '0'         ; Convertir el último cociente a ASCII

    ; Guardar el último dígito convertido en el buffer
    mov rsi, [index]
    mov [buffer + rsi], al
    inc byte [index]
    ret

fin_conversion:
    ret

; Función para imprimir el número completo desde el buffer
imprimir_numero:
    mov rcx, 0           ; Inicializar índice para recorrer el buffer

imprimir_ciclo:
    cmp rcx, [index]     ; Comprobar si hemos imprimido todos los dígitos
    je fin_imprimir      ; Si es igual al índice final, terminar la impresión
    mov rax, 1           ; syscall número para sys_write
    mov rdi, 1           ; file descriptor (stdout)
    mov rdx, 1           ; Tamaño de 1 byte

    ; Imprimir el dígito actual
    mov al, [buffer + rcx] ; Obtener el dígito actual
    mov rsi, buffer        ; Establecer la dirección base del buffer en RSI
    syscall                ; Llamar a la syscall para imprimir

    ; Incrementar el índice del buffer
    inc rcx
    jmp imprimir_ciclo

fin_imprimir:
    ret

; Función para finalizar el programa
finalizar:
    mov rax, 60          ; syscall número para sys_exit
    xor rdi, rdi         ; Código de salida 0
    syscall              ; Llamar al sistema


;nasm -f elf64 -oobjeto.o tarea_corta1.asm
;ld -otarea_corta1 objeto.o
;./tarea_corta1