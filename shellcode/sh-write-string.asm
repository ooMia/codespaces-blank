section .text
global _start
_start:
    mov rax, 0x0000000000000000    ;  
    push rax
    mov rax, 0x676e6f6f6f6f6f6f    ; oooooong
    push rax
    mov rax, 0x6c5f73695f656d61    ; ame_is_l
    push rax
    mov rax, 0x6e5f67616c662f63    ; c/flag_n
    push rax
    mov rax, 0x697361625f6c6c65    ; ell_basi
    push rax
    mov rax, 0x68732f656d6f682f    ; /home/sh
    push rax

    mov rsi, rsp
    mov rdi, 1
    mov rdx, 42
    mov rax, 1
    syscall
