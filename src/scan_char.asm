SECTION .bss
char_buffer resb 1

SECTION .text
global scan_char

; ---------------------------------
; scan_char
; Salida:
;   AL = caracter leído
; ---------------------------------

scan_char:

    push ebp ;esta funcion se basa mucho en la idea para leer un int
    mov ebp, esp

    mov eax, 3 ;se puede entender como el scan de c, es decir esto de aqui inicia el proceso de lectura
    mov ebx, 0 ;esto de aqui dice que es la entrada estandar
    mov ecx, char_buffer ;esto asigna el valor leido en memoria
    mov edx, 1 ;esto es para indicar que solo vamos a usar 1 caracter
    int 0x80

    mov al, [char_buffer] ;aqui se mueve a al para que no se pierda

    mov esp, ebp
    pop ebp
    ret