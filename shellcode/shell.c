#include <unistd.h>

/**
 * @file shell.c
 * @brief Echoes a string to stdout
 * @return 0 if the shellcode executes successfully, non-zero otherwise.
 */
int main()
{
    const char message[] = "/home/shell_basic/flag_name_is_loooooong";
    write(STDOUT_FILENO, message, sizeof(message) - 1);
    return 0;
}
