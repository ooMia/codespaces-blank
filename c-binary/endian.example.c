#include <stdio.h>
#include <stdlib.h>

int is_little_endian()
{
    short num = 0x0100;     // 00000001 00000000
    char n1 = 0x01;         // 00000001
    char n2 = 0x00;         //          00000000
    char *p = (char *)&num; // p points to the first byte of num
    return *p == n2 && *(p + 1) == n1;
}

void print_as_binary(unsigned char binary_data)
{
    for (int i = 7; i >= 0; i--)
    {
        printf("| %d ", (binary_data & (1 << i)) >> i);
    }
    printf("|\n");
    return;
}

int main(int argc, char *argv[])
{

// https://sourceforge.net/p/predef/wiki/Architectures/
#if defined(__x86_64__)
    printf("CPU: Intel x86-64\n");
#elif defined(__aarch64__)
    printf("CPU: ARM 64-bit\n");
#elif defined(__i386__)
    printf("CPU: Intel x86\n");
#else
    printf("CPU: Unknown\n");
#endif

    if (is_little_endian())
    {
        printf("Endian: Little Endian\n\n");
    }
    else
    {
        printf("Endian: Big Endian\n\n");
    }

    unsigned char binary_data = 0b10010100;
    unsigned char msb = (binary_data & 0b10000000) >> 7;
    unsigned char lsb = binary_data & 0b00000001;

    printf("Binary Data: %d\n", binary_data);
    printf("| 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |\n");
    printf("|---|---|---|---|---|---|---|---|\n");
    print_as_binary(binary_data);
    printf("| M |   |   |   |   |   |   | L |\n\n");
    printf("*M: MSB **L: LSB\n\n");

    char *str = "ABCD"; // 16진수: 41424344
    puts(str);          // 문자열 출력 결과: ABCD

    unsigned int num = 0x41424344;
    char *ptr = (char *)&num;
    for (int i = 0; i < 4; i++)
    {
        printf("%c", *(ptr + i));
    }
    printf("\n\n");

    return 0;
}
