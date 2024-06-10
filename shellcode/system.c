#include <stdlib.h>

/**
 * @file system.c
 * @brief Executes a command in the system shell.
 * @param None
 * @return None
 */
int main(void)
{
    system("/bin/sh");
    return 0;
}