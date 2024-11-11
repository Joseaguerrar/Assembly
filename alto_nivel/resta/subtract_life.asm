section .text
global subtract_life

; La función subtract_life recibe dos parámetros:
; - Primer parámetro (rdi): vida del jugador
; - Segundo parámetro (rsi): puntos de vida que pierde
; Devuelve:
; - Resultado (rax): nueva vida del jugador

subtract_life:
    ; Resta el segundo parámetro al primero
    sub rdi, rsi
    ; Mueve el resultado a rax (valor de retorno)
    mov rax, rdi
    ret
