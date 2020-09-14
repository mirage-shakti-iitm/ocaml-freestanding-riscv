#include <stdlib.h>
#include <string.h>
#include <ocaml-boot-riscv.h>
/*
 * These functions deliberately do not call printf() or malloc() in order to
 * abort as quickly as possible without triggering further errors.
 */

static void puts_assert(const char *s)
{
    riscv_write(s, strlen(s));
}

void _assert_fail(const char *file, const char *line, const char *e)
{
    puts_assert(file);
    puts_assert(":");
    puts_assert(line);
    puts_assert(": Assertion `");
    puts_assert(e);
    puts_assert("' failed\n");
    abort();
}
