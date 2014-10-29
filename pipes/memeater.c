#define _GNU_SOURCE
#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>

unsigned int pipe_max_size = 1048576;

int main()
{
	char buf[pipe_max_size];
	unsigned long long size = 0;

	while (1) {
		int p[2];

		if (pipe2(p, O_NONBLOCK))
			break;

		if (fcntl(p[1], F_SETPIPE_SZ, pipe_max_size) == -1)
			break;

		if (write(p[1], buf, pipe_max_size) != pipe_max_size)
			break;

		size += pipe_max_size;
	}

	printf("%lluMb\n", size >> 20);

	while (1)
		sleep(1);

	return 0;
}
