section.data
    ; 10x10 matrix for numbers from 2 to 101
matriz     dd  2, 3, 4, 5, 6, 7, 8, 9, 10, 11
           dd  12, 13, 14, 15, 16, 17, 18, 19, 20, 21
           dd  22, 23, 24, 25, 26, 27, 28, 29, 30, 31
           dd  32, 33, 34, 35, 36, 37, 38, 39, 40, 41
           dd  42, 43, 44, 45, 46, 47, 48, 49, 50, 51
           dd  52, 53, 54, 55, 56, 57, 58, 59, 60, 61
           dd  62, 63, 64, 65, 66, 67, 68, 69, 70, 71
           dd  72, 73, 74, 75, 76, 77, 78, 79, 80, 81
           dd  82, 83, 84, 85, 86, 87, 88, 89, 90, 91
           dd  92, 93, 94, 95, 96, 97, 98, 99, 100, 101

; Vector to store the prime numbers found
resultado resd 25    ; Enough space for primes ≤ 101

; Variable to count how many primes were found
num_primos dd 0

section .bss
; Variable for the index
idx resd 1

section .text
    global _start
_start:
    ; Call the method that runs the Sieve of Eratosthenes
    call criba_eratostenes

    ; End the program and return control to the OS
    mov eax, 60          ; sys_exit
    xor edi, edi
    syscall

criba_eratostenes:
    ; Initialize variables 
    xor ecx, ecx        ; Matrix index
    xor ebx, ebx        ; Result vector index (primes)
    xor esi, esi        ; Current number in the sieve

    ; Start the sieve
criba_loop:
    ; Load the number at the current matrix position
    mov eax, [matriz + ecx*4]

    ; If the number is 0, it has been marked as non-prime
    cmp eax, 0
    je siguiente_numero

    ; If the number is greater than the square root of 101, stop
    cmp eax, 11          ; Square root of 101 ≈ 10
    jg almacenar_primo

    ; Mark multiples of the current number as non-prime
marcar_multiplos:
    ; Increase the index to get the next multiple
    add esi, eax
    cmp esi, 99          ; Do not exceed the matrix size
    jg fin_marcar

    ; Mark the multiple as non-prime (set to 0)
    mov dword[matriz + esi*4], 0
    jmp marcar_multiplos

fin_marcar:
    ; Store the prime number found
almacenar_primo:
    mov eax, [matriz + ecx*4]
    mov [resultado + ebx*4], eax
    inc ebx                     ; Increase the index for results
    mov [num_primos], ebx       ; Update the count of primes found

    ; Go to the next number in the matrix
siguiente_numero:
    inc ecx
    cmp ecx, 100
    jl cripa_loop    ; (comment only: typo in original, left unchanged)

    ret
