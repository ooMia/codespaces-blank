#include <unistd.h>

int main()
{
    const char message[] = "/home/shell_basic/flag_name_is_loooooong";
    write(STDOUT_FILENO, message, sizeof(message) - 1);
    return 0;
}