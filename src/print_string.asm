SECTION .text
global print_string

; ---------------------------------
; print_string
; Entrada:
;   EAX = direccion de cadena
;   cadena terminada en 0
; ---------------------------------

print_string:

    push ebp
    mov ebp, esp

    push ebx
    push edi

    mov edi, eax
    xor ecx, ecx

.ciclo: 
    cmp byte [edi + ecx], 0 ;Nota, esto se supone que deberia comparar si es el caracter final de una string 
    je .escribir
    inc ecx ;cambia al siguiente
    jmp .ciclo ;continua escribiendo siempre y cuando haya algo

.escribir:
    mov edx, ecx
    mov ecx, eax ; esto es lo que le deja decir donde empieza el texto
    mov eax, 4 ;segun lo visto en clase esto deberia de escribir haciendo uso del system write
    mov ebx, 1 ;esto es la salida estandar
    int 0x80

    pop edi
    pop ebx ;reinicia la memoria para que no haya fallas

    mov esp, ebp
    pop ebp
    ret ;retorno al inicio donde se llama la funcion