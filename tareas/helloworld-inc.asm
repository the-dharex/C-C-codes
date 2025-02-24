; Hello World Program (External file include)
; Compile with: nasm -f elf helloworld-inc.asm
; Link with (64-bit systems require elf_i386 option): ld -m elf_i386 helloworld-inc.o -o helloworld-inc
; Run with: ./helloworld-inc
 
%include        'functions.asm'                            ; Include our external file
 
SECTION .data
msg1    db      'Hello, brave new world!', 0Ah, 0         ; First message string
msg2    db      'This is how we recycle in NASM.', 0Ah, 0 ; Second message string
 
SECTION .text
global  _start
 
_start:

    push    msg1        ; Push the address of msg1 onto the stack
    call    sprint      ; Call the string printing function
    add     esp, 4      ; Clean up stack

    push    msg2        ; Push the address of msg2 onto the stack
    call    sprint      ; Call the string printing function
    add     esp, 4      ; Clean up stack

    call    quit        ; Call the quit function to exit properly
