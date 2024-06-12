#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>

int main()
{
    int randomData = open("/dev/urandom", O_RDONLY);
    char myRandomData[8];
    ssize_t result = read(randomData, myRandomData, sizeof myRandomData);
    if (result < 0)
    {
        // error, unable to read /dev/urandom
    }
    // print bytes as hex
    for (int i = 0; i < sizeof myRandomData; i++)
    {
        printf("%02x ", myRandomData[i]);
    }
    puts("");
    close(randomData);
    return 0;
}
