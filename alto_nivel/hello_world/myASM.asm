;nasm -g -f elf64 -oobjASM.o myASM.asm
;g++ -g -c -no-pie -oobjCPP.o myCPP.cpp 
;g++ -g -no-pie -oexe objASM.o objCPP.o

section .data
    global result
    result: dd 0

section .text

global Add0
Add0:
    ;edi -> arg 1
    ;esi -> arg 2
    ;eax -> return

    push rdi

    add edi, esi
    mov eax, edi

    pop rdi
    ret

global Add1
Add1:
    ;rdi -> arg 1
    ;rsi -> arg2
    ;eax -> return


    mov eax, [rdi]
    add eax, [rsi]

    ret

global Add2
Add2:
    ;rdi -> arg 1
    ;rsi -> arg 2
    ;eax -> return

    mov ecx, [rdi]
    add ecx, [rsi]
    mov [result], ecx
    lea rax, [result]
    ret
