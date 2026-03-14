extern print_char ;la añado para que sea menos redundante el imprimir de nuevo un caracter
global newline

SECTION .text

newline:

    push ebp
    mov ebp, esp

    mov al, 10
    call print_char

    mov esp, ebp
    pop ebp
    ret