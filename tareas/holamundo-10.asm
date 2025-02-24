%include        'functions.asm'
 
SECTION .data
newline db 10, 0   ; L�nea nueva para imprimir despu�s de los n�meros

SECTION .bss
buffer resb 2      ; Buffer para almacenar el n�mero convertido a ASCII
 
SECTION .text
global  _start
 
_start:
 
    mov     ecx, 0          ; Inicializar el contador en 0
 
nextNumber:
    inc     ecx             ; Incrementar contador
 
    mov     eax, ecx        ; Copiar el n�mero en eax
    add     eax, 48         ; Convertir de entero a ASCII (0 -> '0', 1 -> '1', etc.)
    mov     [buffer], al    ; Almacenar el car�cter en el buffer
    mov     [buffer+1], byte 0  ; Agregar terminador nulo para imprimir correctamente

    push    buffer          ; Pasar direcci�n del buffer a sprintLF
    call    sprintLF        ; Imprimir el n�mero
    add     esp, 4          ; Limpiar la pila

    cmp     ecx, 10         ; �Llegamos a 10?
    jne     nextNumber      ; Si no, repetir el bucle
 
    push    newline         ; Imprimir una l�nea nueva al final
    call    sprint
    add     esp, 4

    call    quit            ; Terminar el programa
