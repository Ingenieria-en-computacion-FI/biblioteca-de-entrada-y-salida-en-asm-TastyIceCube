SECTION .text
global scan_string

; ---------------------------------
; scan_string
; Entrada:
;   EAX = buffer destino
;   EBX = tamaño máximo
; ---------------------------------

scan_string:

    push ebp
    mov ebp, esp

    push ebx ;estas 3 lineas de codigo cargan la informacion a la memoria
    push ecx
    push edx

    mov ecx, eax ;esto almacena el texto
    mov edx, ebx
    mov eax, 3 ;esto llama al sistema para que lea la informacion 
    mov ebx, 0 ; se usa la entrada estandar
    int 0x80

    mov byte [ecx + eax - 1], 0 ;esto es un truco que vi, resulta que si se da enter este cuenta como un elemento mas, por eso se reduce en 1

    pop edx
    pop ecx
    pop ebx

    mov esp, ebp
    pop ebp
    ret