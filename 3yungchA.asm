; Yung Cheng, Adrian U. | S15
%include "io64.inc"
section .data
address1 dd 0
address2 dd 0
offset dd 0

inputAddress1 dd "Input (1st address): ", 0
inputAddress2 dd "Input (2nd address): ", 0

printInvalid dd "Error: invalid input; please try again.", 0
outputOffset dd "Offset: ", 0

section .text
global main
main:
    PRINT_STRING inputAddress1
    GET_HEX 4, [address1]
    ; PRINT_HEX 4, [address1]
    NEWLINE
    
    PRINT_STRING inputAddress2
    GET_HEX 4, [address2]
    ; PRINT_HEX 4, [address2]
    NEWLINE
    
    mov rax, [address1]
    mov rcx, 4
    mov rdx, 0
    
    idiv rcx
    
    cmp rdx, 0
    jne invalid_input
    
    mov rax, [address2]
    mov rcx, 4
    mov rdx, 0
    
    idiv rcx
    
    cmp rdx, 0
    jne invalid_input
    
    call compute_offset
    
    NEWLINE
    GET_CHAR al
    PRINT_STRING "Press enter key to exit..."
    GET_CHAR al
    
    xor rax, rax
    ret
    
compute_offset:
    mov rax, [address2]
    sub rax, [address1]
    mov rcx, 4
    mov rdx, 0
    
    idiv rcx
    
    mov qword [offset], rax
    
    PRINT_STRING outputOffset
    PRINT_DEC 4, [offset]
    ret
    

invalid_input:
    PRINT_STRING printInvalid
    NEWLINE
    jmp main
   