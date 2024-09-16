; 
section .data
vector1: dw 2, -3, 5         ; Vectores de entrada
vector2: dw 1, 2, 3
respuesta: dd 0              ; Espacio para almacenar el resultado del producto punto
buffer: db '00000000', 0     ; Buffer para convertir el número a ASCII (para imprimirlo)
newline: db 0xA              ; Salto de línea
negativo: db '-'             ; Símbolo negativo

section .text
global _start

_start:
    ; Inicialización
    mov rdi, 0                ; Inicializamos el índice del bucle en 0
    mov dword [respuesta], 0  ; Limpiar la variable respuesta antes de usarla, para eliminar basura.

producto_punto:
    cmp rdi, 3                ; Verificar si ya hemos procesado 3 elementos (x, y, z)
    je fin_producto_punto     ; Si es así, terminar el bucle

    ; Cargar valores de los vectores
    movsx eax, word [vector1 + rdi*2] ; Cargar valor de vector1 en eax con signo (x, y, z) en cada iteración.
    movsx ebx, word [vector2 + rdi*2] ; Cargar valor de vector2 en ebx con signo (x, y, z) en cada iteración.

    ; Multiplicar los valores
    imul eax, ebx            ; Multiplicar eax por ebx (resultado en eax)

    ; Sumar el resultado parcial a la respuesta.
    add dword [respuesta], eax

    ; Incrementar el índice para procesar el siguiente elemento
    inc rdi
    jmp producto_punto        ; Repetir el proceso hasta que todos los elementos sean procesados

fin_producto_punto:
    ; Cargar el resultado final en eax y llamamos a la función de impresión
    mov eax, [respuesta]      ; Cargar el valor de 'respuesta' en eax
    call print_num            ; Imprimir el resultado

    ; Imprimir el salto de línea
    mov rax, 1                ; Syscall de write
    mov rdi, 1                ; File descriptor (stdout)
    mov rsi, newline          ; Dirección del salto de línea
    mov rdx, 1                ; Tamaño de 1 byte
    syscall                   ; Imprimir salto de línea

    ; Salida del programa
    mov rax, 60               ; Syscall de salida
    xor rdi, rdi              ; Código de salida 0
    syscall                   ; Salir

; Función para convertir número a cadena decimal
print_num:
    test eax, eax             ; Verificar si el número es negativo
    jns convertir             ; Si no es negativo, saltar a la conversión (jns: jump if not sign)

    ; Imprimir el signo negativo
    neg eax                   ; Cambiar a positivo
    mov rax, 1                ; Syscall de write
    mov rdi, 1                ; Salida estándar
    mov rsi, negativo         ; Dirección del símbolo negativo
    mov rdx, 1                ; Tamaño de 1 byte
    syscall                   ; Imprimir el signo negativo al comienzo

convertir:
    mov rsi, buffer           ; Apuntar al buffer
    mov rbx, 10               ; Divisor de la base decimal
    mov rdi, buffer + 7       ; Comenzar desde el final del buffer
    mov byte [rdi], 0         ; Terminador del string

convertir_loop:
    xor rdx, rdx              ; Limpiar rdx (div usa rdx para el residuo)
    div rbx                   ; Dividir rax entre 10, cociente en rax, residuo en rdx
    add dl, '0'               ; Convertir el residuo a ASCII
    dec rdi                   ; Mover hacia un espacio hacia atrás en el buffer
    mov [rdi], dl             ; Almacenar el dígito
    test rax, rax             ; Verificar si el cociente es cero
    jnz convertir_loop        ; Si el cociente no es cero, seguir convirtiendo

print_buffer:
    ; Calcular el tamaño de la cadena
    mov rdx, buffer + 8       ; Cargar la dirección del final del buffer
    sub rdx, rdi              ; Restar el puntero rdi para obtener el tamaño de la cadena
    mov rsi, rdi              ; Apuntar al inicio de la cadena
    mov rax, 1                ; Syscall de write
    mov rdi, 1                ; Salida estándar
    syscall                   ; Imprimir en pantalla
    ret                       ; Retornar