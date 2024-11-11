section .text
global subtract_life

; La función subtract_life recibe tres parámetros:
; - Primer parámetro (rdi): vida del jugador
; - Segundo parámetro (rsi): cantidad a modificar (puede ser daño o curación)
; - Tercer parámetro (rdx): indicador (1 = resta, 2 = suma)
; Devuelve:
; - Resultado (rax): nueva vida del jugador

subtract_life:
    ; Comprueba el tercer argumento (rdx)
    cmp rdx, 1          ; ¿Es igual a 1? (restar)
    je do_subtract      ; Si es igual a 1, salta a do_subtract

    cmp rdx, 2          ; ¿Es igual a 2? (sumar)
    je do_add           ; Si es igual a 2, salta a do_add

    ; Caso por defecto: no hace nada, regresa la vida original
    mov rax, rdi
    ret

do_subtract:
    sub rdi, rsi        ; Resta el segundo parámetro al primero
    mov rax, rdi        ; Mueve el resultado a rax
    ret

do_add:
    add rdi, rsi        ; Suma el segundo parámetro al primero
    mov rax, rdi        ; Mueve el resultado a rax
    ret
