; Yung Cheng, Adrian U. S15
%include "io64.inc"
section .data

inputLength db "Enter length: ", 0
inputWidth db "Enter width: ", 0
negativeNumber db "Error: Negative input is not allowed. Please try again.", 0
outputPerimeter db "Perimeter: ", 0
outputArea db "Area: ", 0

length dd 0
width dd 0
perimeter dd 0
area dd 0

section .text
global main
main:
    ; input length
    PRINT_STRING inputLength
    GET_DEC 8, length
    PRINT_DEC 8, [length]
    NEWLINE

    ; input width
    PRINT_STRING inputWidth
    GET_DEC 8, width
    PRINT_DEC 8, [width]
    NEWLINE

    ; check if length or width are negative
    cmp dword [length], 0
    jl negative
    cmp dword [width], 0
    jl negative

    ; compute perimeter and area if not
    jmp compute

negative:
    PRINT_STRING negativeNumber
    NEWLINE
    jmp main

compute:
    ; compute perimeter
    mov ebx, [length]
    add ebx, [width]
    add ebx, ebx

    ; compute area
    mov ecx, [length]
    imul ecx, [width]
    jmp output

output:
    ; output perimeter
    PRINT_STRING outputPerimeter
    PRINT_DEC 8, rbx
    NEWLINE
    PRINT_STRING outputArea
    PRINT_DEC 8, rcx
    NEWLINE

    xor rax, rax
    ret