section .text
    global generateDayTimestamp

generateDayTimestamp:
    ; timeOfDay está en RDI y dayOfWeek en RSI
    shl rdi, 3         ; Mueve timeOfDay 3 bits a la izquierda (para dejar espacio para el día)
    or rdi, rsi        ; Combina ambos valores (timeOfDay en el bit 3, dayOfWeek en los bits 0-2)
    mov eax, edi       ; Copia el resultado combinado a EAX
    ret                ; Devuelve el resultado
