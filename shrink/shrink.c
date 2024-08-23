#include <unistd.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <err.h>
#include <errno.h>
#include <error.h>
#include <stdio.h>
#include <libgen.h>

const size_t CHUNK_SIZE = 2 * 1024 * 1024;

int main(int argc, char *argv[]) {
    if (argc < 2)
    {
        printf("Usage: %s <FILE>\n", argv[0]);
        return 2;
    }

    const char* file = argv[1];
    char *base = basename(argv[1]);

    int fd = open(file, O_RDWR);
    if (fd == -1)
        error(1, errno, "Failed to open file `%s'", file);

    static struct stat st;
    if (fstat(fd, &st) == -1)
        error(1, errno, "Failed to get file size");

    if (lseek(fd, -1L, SEEK_END) == -1)
        error(1, errno, "Failed to seek to end of file");

    static char last_byte;
    if (read(fd, &last_byte, sizeof(char)) != 1)
        error(1, errno, "Failed to read last byte of file");

    if (last_byte != '\0')
        errx(1, "`%s' is already shrunk.", base);

    printf("%s: Shrinking `%s'\n", argv[0], base);
    off_t file_size = st.st_size;
    off_t last_non_zero_byte = file_size - 1;
    char buffer[CHUNK_SIZE];

    for (off_t pos = file_size - CHUNK_SIZE; pos >= 0; pos -= CHUNK_SIZE)
    {
        ssize_t n = pread(fd, buffer, CHUNK_SIZE, pos);
        if (n == -1)
            error(1, errno, "Failed to read file");

        for (off_t i = n - 1; i >= 0; --i)
        {
            if (buffer[i] != '\0')
            {
                last_non_zero_byte = pos + i;
                goto done;
            }
        }
    }

done:
    if (ftruncate(fd, last_non_zero_byte + 1) == -1)
        error(1, errno, "Failed to shrink `%s'", base);

    printf("%s: %s shrunk to %lld bytes.\n", argv[0], base, (long long)(last_non_zero_byte + 1));

    close(fd);
    return 0;
}
