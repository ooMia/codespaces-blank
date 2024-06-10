"""
This script converts a given string into assembly code that writes the string to standard output.
@Author: oomia
@Date: 2024/06/07
@Usage: python3 sh-write-string.py > sh-write-string.asm
@Input: A string to convert to assembly code
@Output: Assembly code that writes the given string to standard output
@Note: try `./shell-code.sh sh-write-string.asm 23754` for testing
"""


def convert_string_to_assembly_code(string):
    # 1. 널 문자 추가
    string_with_null = string + "\0"

    # 2. 문자열 8바이트 단위로 분할하되, 청크 순서는 역순으로
    # 8로 나누어 떨어지지 않는 경우도 고려
    chunks = [string_with_null[i : i + 8] for i in range(0, len(string_with_null), 8)][
        ::-1
    ]

    # 3. 어셈블리 코드 초기화
    assembly_code = "section .text\nglobal _start\n_start:\n"

    # 4. 각 청크를 어셈블리 코드로 변환
    for chunk in chunks:
        annotation = f"    ; {chunk}"  # 주석 추가
        # 8바이트를 64비트 정수로 변환
        hex_value = "0x" + "".join(f"{ord(c):02x}" for c in chunk[::-1])
        # hex_value zero padding after 0x
        if len(hex_value) < 18:
            hex_value = hex_value[:2] + "0" * (18 - len(hex_value)) + hex_value[2:]
        assembly_code += f"    mov rax, {hex_value}{annotation}\n    push rax\n"

    # 5. 나머지 어셈블리 코드 추가
    assembly_code += f"""
    mov rsi, rsp
    mov rdi, 1
    mov rdx, {len(string_with_null) + 1}
    mov rax, 1
    syscall
    """

    return assembly_code


if __name__ == "__main__":
    # 0. 주어진 문자열
    string = "/home/shell_basic/flag_name_is_loooooong"

    assembly_code = convert_string_to_assembly_code(string)
    print(assembly_code)
