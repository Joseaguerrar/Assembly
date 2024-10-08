;nasm -g -f elf64 -oobjASM.o miASM.asm
;g++ -g -c -no-pie -oobjCPP.o miCPP.cpp 
;g++ -g -no-pie -oexe objASM.o objCPP.o

section .data
    global resultado
    resultado: dd 0

section .text

global sumar0
sumar0:
    ;edi -> argumento 1
    ;esi -> argumento 2
    ;eax -> retorno

    push rdi

    add edi, esi
    mov eax, edi

    pop rdi
    ret

global sumar1
sumar1:
    ;rdi -> argumento 1
    ;rsi -> argumento 2
    ;eax -> retorno


    mov eax, [rdi]
    add eax, [rsi]

    ret

global sumar2
sumar2:
    ;rdi -> argumento 1
    ;rsi -> argumento 2
    ;eax -> retorno

    mov ecx, [rdi]
    add ecx, [rsi]
    mov [resultado], ecx
    lea rax, [resultado]
    ret