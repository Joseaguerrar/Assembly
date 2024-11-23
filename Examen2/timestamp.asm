section .text
    global generateTimestamp

generateTimestamp:
    ; timeOfDay está en RDI
    ; dayOfWeek está en RSI
    ; month está en RDX

    shl rdi, 7         ; Mueve el momento del día al bit 7
    shl rdx, 4         ; Mueve el mes a los bits 6-4
    or rdi, rdx        ; Combina el momento del día y el mes
    or rdi, rsi        ; Combina el día de la semana

    mov eax, edi       ; Copia el resultado combinado a EAX
    ret                ; Devuelve el resultado
