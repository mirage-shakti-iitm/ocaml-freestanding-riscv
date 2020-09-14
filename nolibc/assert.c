#include <stdlib.h>
#include <string.h>
#include <ocaml-boot-riscv.h>
/*
 * These functions deliberately do not call printf() or malloc() in order to
 * abort as quickly as possible without triggering further errors.
 */

static void puts(const char *s)
{
    riscv_write(s, strlen(s));
}

void _assert_fail(const char *file, const char *line, const char *e)
{
    puts(file);
    puts(":");
    puts(line);
    puts(": Assertion `");
    puts(e);
    puts("' failed\n");
    abort();
}
