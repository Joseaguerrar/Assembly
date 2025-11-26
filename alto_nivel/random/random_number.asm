; Declaration of the assembly function
; extern "C" int random_number()
section .text
    global random_number

random_number:
    ; Save used registers
    push rbx
    push rcx
    push rdx

    ; Call RDTSC to generate a pseudo-random number
    rdtsc                  ; Read the time-stamp counter
    mov rax, rdx          ; Use the high part of the timestamp as base
    xor rdx, rdx          ; Clear RDX
    mov rbx, 3            ; Divisor (upper range)
    div rbx               ; Divide by 3 (RAX = quotient, RDX = remainder)
    add rdx, 1            ; Adjust range to 1-3
    mov rax, rdx          ; Move final result into RAX

    ; Restore registers
    pop rdx
    pop rcx
    pop rbx

    ret
