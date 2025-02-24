%include        'functions.asm'
 
SECTION .data
newline db 10, 0   ; Línea nueva para imprimir después de los números

SECTION .bss
buffer resb 2      ; Buffer para almacenar el número convertido a ASCII
 
SECTION .text
global  _start
 
_start:
 
    mov     ecx, 0          ; Inicializar el contador en 0
 
nextNumber:
    inc     ecx             ; Incrementar contador
 
    mov     eax, ecx        ; Copiar el número en eax
    add     eax, 48         ; Convertir de entero a ASCII (0 -> '0', 1 -> '1', etc.)
    mov     [buffer], al    ; Almacenar el carácter en el buffer
    mov     [buffer+1], byte 0  ; Agregar terminador nulo para imprimir correctamente

    push    buffer          ; Pasar dirección del buffer a sprintLF
    call    sprintLF        ; Imprimir el número
    add     esp, 4          ; Limpiar la pila

    cmp     ecx, 10         ; ¿Llegamos a 10?
    jne     nextNumber      ; Si no, repetir el bucle
 
    push    newline         ; Imprimir una línea nueva al final
    call    sprint
    add     esp, 4

    call    quit            ; Terminar el programa
