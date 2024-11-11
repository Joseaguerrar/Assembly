section .text
    global random_number

random_number:
    ; Guardar los registros usados
    push rbx
    push rcx
    push rdx

    ; Llamar a RDTSC para generar un número pseudoaleatorio
    rdtsc                  ; Leer el contador de tiempo
    mov rax, rdx          ; Usar la parte alta del timestamp como base
    xor rdx, rdx          ; Limpiar RDX
    mov rbx, 3            ; Divisor (rango superior)
    div rbx               ; Dividir por 3 (RAX = cociente, RDX = residuo)
    add rdx, 1            ; Ajustar el rango a 1-3
    mov rax, rdx          ; Colocar el resultado final en RAX

    ; Restaurar los registros
    pop rdx
    pop rcx
    pop rbx

    ret
