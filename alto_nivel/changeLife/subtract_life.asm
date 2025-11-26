section .text
global subtract_life

; The function subtract_life recieves 3 parameters:
; - First parameter (rdi): players life
; - Second parameter (rsi): amount of life to modify (it can be damage or healing)
; - Third parameter (rdx): indicator (1 = subtraction, 2 = addition)
; Returns:
; - Result (rax): new players life

subtract_life:
    ; Checks third argument (rdx)
    cmp rdx, 1          ; ¿Is equal to 1? (subtract)
    je do_subtract      ; If it is equal to 1, jumps to do_subtract

    cmp rdx, 2          ; ¿Is equal to 2? (Add)
    je do_add           ; If its equal to 2, jumps to do_add

    ; Default case: does not do anything, returns original life
    mov rax, rdi
    ret

do_subtract:
    sub rdi, rsi        ; Subtracts second parameter to first one
    mov rax, rdi        ; Moves result to  rax
    ret

do_add:
    add rdi, rsi        ; Adds second parameter to first one
    mov rax, rdi        ; Moves result to  rax
    ret
