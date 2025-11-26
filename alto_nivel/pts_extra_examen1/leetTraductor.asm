; Names: Jose Guerra (C33510) and Jerson Bonilla (C31225)

section .note.GNU-stack noalloc noexec nowrite progbits

section .text
global convert_to_leet
convert_to_leet:
    push rbx                ; Save all registers
    mov rsi, rdi            ; Get pointer to the first argument

convert_loop:
    mov al, [rsi]           ; Load current character into AL
    cmp al, 0               ; Check if it's the end of the string
    je convert_end

    ; Compare character with 'a'
    cmp al, 'a'            
    jne check_b
    mov al, '4'                 ; Change 'a' to '4'
    jmp save

check_b:
    ; Compare character with 'b'
    cmp al, 'b'
    jne check_e
    mov al, '8'                 ; Change 'b' to '8'
    jmp save

check_e:
    ; Compare character with 'e'
    cmp al, 'e'
    jne check_g
    mov al, '3'                 ; Change 'e' to '3'
    jmp save

check_g:
    ; Compare character with 'g'
    cmp al, 'g'
    jne check_l
    mov al, '9'                 ; Change 'g' to '9'
    jmp save

check_l:
    ; Compare character with 'l'
    cmp al, 'l'
    jne check_r
    mov al, '1'                 ; Change 'l' to '1'
    jmp save

check_r:
    ; Compare character with 'r'
    cmp al, 'r'
    jne check_s
    mov al, '2'                 ; Change 'r' to '2'
    jmp save

check_s:
    ; Compare character with 's'
    cmp al, 's'
    jne check_t
    mov al, '5'                 ; Change 's' to '5'
    jmp save

check_t:
    ; Compare character with 't'
    cmp al, 't'
    jne check_z
    mov al, '7'                 ; Change 't' to '7'
    jmp save

check_z:
    ; Compare character with 'z'
    cmp al, 'z'
    jne check_o
    mov al, '2'                 ; Change 'z' to '2'
    jmp save

check_o:
    ; Compare character with 'o'
    cmp al, 'o'
    jne check_i
    mov al, '0'                 ; Change 'o' to '0'
    jmp save

check_i:
    ; Compare character with 'i'
    cmp al, 'i'
    jne save
    mov al, '1'                 ; Change 'i' to '1'

save:
    mov [rsi], al               ; Store the value in the string
    inc rsi                     ; Move to the next character

    jmp convert_loop          ; Repeat the process

convert_end:
    pop rbx                     ; Restore registers
    ret
