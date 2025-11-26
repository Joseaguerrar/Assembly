; Members: Jose Guerra (50%) and Jerson Bonilla (50%)
section .note.GNU-stack noalloc noexec nowrite progbits

section .text
    global _fibonacci

_fibonacci:
    push rbp                 ; Save previous frame pointer
    mov rbp, rsp             ; Set new frame pointer
    push rbx                 ; Save rbx
    push rsi                 ; Save rsi

    ; The value of n is in rdi
    cmp rdi, 1               ; Compare n with 1
    jbe fib_base_case        ; If n <= 1, go to base case

    ; Save n in rbx (temporary)
    mov rbx, rdi             ; Save original value of n in rbx

    ; Recursive call fib(n-1)
    sub rdi, 1               ; n = n - 1
    call _fibonacci          ; Recursive call for fib(n-1)
    mov rsi, rax             ; Store result of fib(n-1) in rsi

    ; Restore original n from rbx
    mov rdi, rbx
    sub rdi, 2               ; n = n - 2
    call _fibonacci          ; Recursive call for fib(n-2)

    ; Add fib(n-1) and fib(n-2)
    add rax, rsi             ; Add fib(n-1) (stored in rsi) with fib(n-2)

    jmp fib_done             ; Jump to exit

fib_base_case:
    mov rax, rdi             ; Base case: fib(0) = 0 or fib(1) = 1

fib_done:
    pop rsi                  ; Restore rsi
    pop rbx                  ; Restore rbx
    pop rbp                  ; Restore frame pointer
    ret                      ; Return
