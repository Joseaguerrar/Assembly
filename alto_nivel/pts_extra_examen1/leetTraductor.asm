; Nombres: Jose Guerra (C33510) y Jerson Bonilla (C31225)

section .note.GNU-stack noalloc noexec nowrite progbits

section .text
global convertir_a_leet
convertir_a_leet:
    push rbx                ; Guardar todos los registros
    mov rsi, rdi            ; Obtener el puntero al primer argumento

convertir_loop:
    mov al, [rsi]           ; Cargar caracter actual a AL
    cmp al, 0               ; Verificar si es el final de la cadena
    je convertir_fin

    ; Comparar caracteres con 'a'
    cmp al, 'a'            
    jne comprobar_b
    mov al, '4'                 ; Cambiar 'a' por '4'
    jmp guardar

comprobar_b:
    ; Comparar caracteres con 'b'
    cmp al, 'b'
    jne comprobar_e
    mov al, '8'                 ; Cambiar 'b' por '8'
    jmp guardar

comprobar_e:
    ; Comparar caracteres con 'e'
    cmp al, 'e'
    jne comprobar_g
    mov al, '3'                 ; Cambiar 'e' por '3'
    jmp guardar

comprobar_g:
    ; Comparar caracteres con 'g'
    cmp al, 'g'
    jne comprobar_l
    mov al, '9'                 ; Cambiar 'g' por '9'
    jmp guardar

comprobar_l:
    ; Comparar caracteres con 'l'
    cmp al, 'l'
    jne comprobar_r
    mov al, '1'                 ; Cambiar 'l' por '1'
    jmp guardar

comprobar_r:
    ; Comparar caracteres con 'r'
    cmp al, 'r'
    jne comprobar_s
    mov al, '2'                 ; Cambiar 'r' por '2'
    jmp guardar

comprobar_s:
    ; Comparar caracteres con 's'
    cmp al, 's'
    jne comprobar_t
    mov al, '5'                 ; Cambiar 's' por '5'
    jmp guardar

comprobar_t:
    ; Comparar caracteres con 't'
    cmp al, 't'
    jne comprobar_z
    mov al, '7'                 ; Cambiar 't' por '7'
    jmp guardar

comprobar_z:
    ; Comparar caracteres con 'z'
    cmp al, 'z'
    jne comprobar_o
    mov al, '2'                 ; Cambiar 'z' por '2'
    jmp guardar

comprobar_o:
    ; Comparar caracteres con 'o'
    cmp al, 'o'
    jne comprobar_i
    mov al, '0'                 ; Cambiar 'o' por '0'
    jmp guardar

comprobar_i:
    ; Comparar caracteres con 'i'
    cmp al, 'i'
    jne guardar
    mov al, '1'                 ; Cambiar 'i' por '1'

guardar:
    mov [rsi], al               ; Guardar el valor en la cadena
    inc rsi                     ; Avanzar al siguiente caracter

    jmp convertir_loop          ; Repetir el proceso

convertir_fin:
    pop rbx                     ; Restaurar los registros
    ret