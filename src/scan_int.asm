SECTION .bss ;codigo realizado en la clase
buffer_int resb 12

SECTION .text
global scan_int


; -------------------------
; scan_int
; Lee entero del teclado y devuelve en EAX
; -------------------------
scan_int:

    push ebp
    mov ebp, esp

    ; Linux syscall read: eax=3, ebx=0(stdin), ecx=buffer, edx=len
    mov eax, 3
    mov ebx, 0
    mov ecx, buffer_int
    mov edx, 12
    int 0x80

    ; convertir ASCII -> entero
    mov esi, buffer_int
    xor eax, eax            ; acumulador
    xor ebx, ebx           ; signo 0=positivo, 1=negativo
    
    cmp byte [esi], '-'
    jne .loop_chars
    
    inc esi
    mov bl, 1

.loop_chars:

    mov cl, [esi]
    cmp cl, 10            ; compara con salto de línea
    je .done
    cmp cl, 0             ; termina en caso de encontrar nulo
    je .done

    sub cl, '0'
    movzx ecx, cl

    imul eax, eax, 10
    add eax, ecx

    inc esi
    jmp .loop_chars

.done:

    cmp bl, 0
    je .exit
    
    neg eax

.exit:

    mov esp, ebp
    pop ebp
    ret