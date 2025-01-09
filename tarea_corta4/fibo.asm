; Integrantes: Jose Guerra (50%) y Jerson Bonilla (50%)
section .note.GNU-stack noalloc noexec nowrite progbits

section .text
    global _fibonacci

_fibonacci:
    push rbp                 ; Guardar el frame pointer anterior
    mov rbp, rsp             ; Establecer el nuevo frame pointer
    push rbx                 ; Guardar el valor de rbx
    push rsi                 ; Guardar rsi

    ; El valor de n está en rdi
    cmp rdi, 1               ; Comparar n con 1
    jbe fib_base_case        ; Si n <= 1, ir al caso base

    ; Guardar el valor de n en rbx (temporal)
    mov rbx, rdi             ; Guardar el valor original de n en rbx

    ; Llamada recursiva fib(n-1)
    sub rdi, 1               ; n = n-1
    call _fibonacci          ; Llamada recursiva para fib(n-1)
    mov rsi, rax             ; Guardar resultado de fib(n-1) en rsi

    ; Restaurar el valor original de n desde rbx
    mov rdi, rbx
    sub rdi, 2               ; n = n-2
    call _fibonacci          ; Llamada recursiva para fib(n-2)

    ; Sumar fib(n-1) y fib(n-2)
    add rax, rsi             ; Sumar fib(n-1) (guardado en rsi) con fib(n-2)

    jmp fib_done             ; Saltar a la salida

fib_base_case:
    mov rax, rdi             ; Caso base: fib(0) = 0 o fib(1) = 1

fib_done:
    pop rsi                  ; Restaurar rsi
    pop rbx                  ; Restaurar rbx
    pop rbp                  ; Restaurar el frame pointer
    ret                      ; Retornar
