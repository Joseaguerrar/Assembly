%macro CreaMult 1
    ; Verifica que el valor N esté en el rango [0, 100]
    %if %1 < 0 || %1 > 100
        %error "N fuera del rango [0, 100]. No se generará la tabla."
    %else
        Tab_%1:
            %assign i 1
            %rep %1
                dw i * 8
                %assign i i + 1
            %endrep
    %endif
%endmacro

section .data
    ; Generar una tabla de los primeros 15 múltiplos de 8
    CreaMult 15

section .bss
    global resultado
    ; Reservar espacio para guardar resultados
    resultado resw 1

section .text
    global _start

_start:
    ; Ejemplo: Acceder al 5° múltiplo de 8 (40) en Tab_15
    mov rdi, 4                 ; Índice 4 (5° elemento, ya que comienza en 0)
    mov ax, [Tab_15 + rdi * 2] ; Multiplicamos rdi por 2 porque es un word (2 bytes)
    mov [resultado], ax        ; Guardar el resultado en la variable para inspección

    ; Terminar el programa
    mov eax, 60                ; Código de salida del sistema (sys_exit)
    xor edi, edi               ; Estado de salida (0)
    syscall
