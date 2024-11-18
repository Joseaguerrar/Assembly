%line 15+1 ejercicio1.asm
[section .data]

%line 2+1 ejercicio1.asm

%line 6+1 ejercicio1.asm
 Tab_15:
%line 9+1 ejercicio1.asm
 dw 1 * 8
%line 9+0 ejercicio1.asm
 dw 2 * 8
 dw 3 * 8
 dw 4 * 8
 dw 5 * 8
 dw 6 * 8
 dw 7 * 8
 dw 8 * 8
 dw 9 * 8
 dw 10 * 8
 dw 11 * 8
 dw 12 * 8
 dw 13 * 8
 dw 14 * 8
 dw 15 * 8
%line 18+0 ejercicio1.asm

%line 19+1 ejercicio1.asm
[section .bss]
[global resultado]

 resultado resw 1

[section .text]
[global _start]

_start:

 mov rdi, 4
 mov ax, [Tab_15 + rdi * 2]
 mov [resultado], ax


 mov eax, 60
 xor edi, edi
 syscall
