section .text
    global generateTimestamp
    global decodeTimestamp

; Function to generate the timestamp
generateTimestamp:
    shl rdi, 7           ; Shift `timeOfDay` into bit 7.
    shl rsi, 4           ; Shift `dayOfWeek` into bits 4–6.
    or rdi, rsi          ; Combine `dayOfWeek` (bits 4–6) into rdi.
    or rdi, rdx          ; Combine previous result (bits 4–7) with `month` (bits 0–3).
                         ; Final result is the timestamp.
    mov eax, edi         ; Move the resulting timestamp into eax.
    ret                  ; Return the timestamp (in eax).

; Function to decode the timestamp
decodeTimestamp:
    ; Mask and shift for timeOfDay (bit 7)
    mov eax, edi         ; Copy timestamp from edi to eax.
    and eax, 0x80        ; Mask for bit 7 (10000000)
    shr eax, 7           ; Shift bit 7 into position 0
    mov dword [rsi], eax ; Store result in *timeOfDay

    ; Mask for dayOfWeek (bits 4–6)
    mov eax, edi         ; Copy timestamp from edi to eax.
    and eax, 0x70        ; Mask for bits 4–6 (01110000)
    shr eax, 4           ; Shift bits 4–6 into positions 0–2
    cmp eax, 7
    jge invalid          ; If result is >= 7, the timestamp is invalid.
    mov dword [rdx], eax ; Store result in *dayOfWeek

    ; Mask for month (bits 0–3)
    mov eax, edi         ; Copy timestamp from edi to eax.
    and eax, 0x0F        ; Mask for bits 0–3 (00001111)
    cmp eax, 12          ; Compare with 12
    jg invalid           ; If greater than 12, invalid timestamp.
    cmp eax, 1           ; Compare with 1
    jl invalid           ; If less than 1, invalid timestamp.
    mov dword [rcx], eax ; Store result in *month

    ; Full validation
    mov eax, 1           ; Everything valid
    ret
invalid:
    xor eax, eax         ; Entire timestamp invalid
    ret
