#include <stdio.h>

int putchar(int ch)
{	char* s = (char*)&ch;
	int ret;
	ret = stdout->write(stdout, s, 1);
	return ret;
}