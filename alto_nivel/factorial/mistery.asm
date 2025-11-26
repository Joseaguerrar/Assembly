section .note.GNU-stack noalloc noexec nowrite progbits

section .text
global mistery
mistery:
    push rdi
    call _mistery
    pop rax
    ret

_mistery:
    push rbp
    mov rbp, rsp
    mov rax, [rbp+16]

    cmp rax, 0
    jle _t 

    dec rax
    push rax
    call _mistery
    mov rax, [rbp+16]
    pop rbx
    
    imul rax, rbx
    mov [rbp+16], rax
    jmp _s 

    _t:
        mov qword [rbp+16], 1

    _s:
        pop rbp

        ret

