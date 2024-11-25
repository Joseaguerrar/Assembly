section .text
    global generateTimestamp
    global decodeTimestamp

; Función para generar el timestamp
generateTimestamp:
    shl rdi, 7           ; Desplaza `timeOfDay` al bit 7.
    shl rsi, 4           ; Desplaza `dayOfWeek` a los bits 4-6.
    or rdi, rsi          ; Combina `dayOfWeek` (bits 4-6) en rdi.
    or rdi, rdx          ; Combina el resultado anterior (bit 4-7) y `month` (bits 0-3) en rdi.
                         ; El resultado es el timestamp.
    mov eax, edi         ; Mueve el timestamp resultante a eax.
    ret                  ; Retorna el timestamp (en eax).

; Función para decodificar el timestamp
decodeTimestamp:
    ; Máscara y desplazamiento para timeOfDay (bit 7)
    mov eax, edi         ; Copia el timestamp de edi a eax.
    and eax, 0x80        ; Máscara para el bit 7 (10000000)
    shr eax, 7           ; Desplaza el bit 7 a la posición 0
    mov dword [rsi], eax ; Guarda el resultado en *timeOfDay

    ; Máscara para dayOfWeek (bits 4-6)
    mov eax, edi         ; Copia el timestamp de edi a eax.
    and eax, 0x70        ; Máscara para los bits 4-6 (01110000)
    shr eax, 4           ; Desplaza los bits 4-6 a las posiciones 0-2
    cmp eax, 7
    jge invalid           ; Si el resultado es mayor que 7, el timestamp es inválido.
    mov dword [rdx], eax ; Guarda el resultado en *dayOfWeek

    ; Máscara para month (bits 0-3)
    mov eax, edi         ; Copia el timestamp de edi a eax.
    and eax, 0x0F        ; Máscara para los bits 0-3 (00001111)
    cmp eax, 12          ; Compara con 12 
    jg invalid           ; Si el resultado es mayor que 12, el timestamp es inválido.
    cmp eax, 1           ; Compara con 1
    jl invalid           ; Si el resultado es menor que 1, el timestamp es inválido.
    mov dword [rcx], eax ; Guarda el resultado en *month

    ; Validación completa
    mov eax, 1           ; Todo válido
    ret
invalid:
    xor eax, eax         ; Todo inválido
    ret