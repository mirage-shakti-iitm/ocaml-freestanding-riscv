#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/time.h>
#include <sys/times.h>
#include <unistd.h>

// functions exposed to ocaml-freestanding by ocaml-boot
#include <ocaml-boot-riscv.h>

// for some reason uintptr_t is not defined
typedef unsigned long uintptr_t;
typedef long intptr_t;
/*
 * Global errno lives in this module.
 */
// newlib's libm uses __errno;
int errno;
int __errno;

/*
 * Standard output and error "streams".
 */
static size_t console_write(FILE *f __attribute__((unused)), const char *s,
        size_t l)
{
    riscv_write(s, l);
    return l;
}

size_t console_read(FILE *f __attribute__((unused)), char *s,
        size_t l)
{
    riscv_read(s, l);
    return l;
}

static FILE console = { .write = console_write; .read = console_read };
FILE *stderr = &console;
FILE *stdout = &console;

ssize_t write(int fd, const void *buf, size_t count)
{
    if (fd == 1 || fd == 2) {
        riscv_write(buf, count);
        return count;
    }
    errno = ENOSYS;
    return -1;
}

void exit(int status)
{
    riscv_poweroff(status);
}

void abort(void)
{
    riscv_write("ocaml-freestanding aborted!\n", 28);
    riscv_poweroff(-1);
}

/*
 * System time.
 * FIXME: no rtc in spike/qemu
 *        returns a fake value
 */

int gettimeofday(struct timeval *tv, struct timezone *tz)
{
    riscv_write("gettimeofday() not supported on risc-v\n", 39);
    if (tv != NULL) {
        memset(tv, 0, sizeof(*tv));
    }
    if (tz != NULL) {
        memset(tz, 0, sizeof(*tz));
    }
    return 0;
}

clock_t times(struct tms *buf)
{
    memset(buf, 0, sizeof(*buf));
    return (clock_t)riscv_clock_monotonic();
}

static uintptr_t sbrk_start;
static uintptr_t sbrk_end;
static uintptr_t sbrk_cur;

/*
 * This is to be called by the bootcode before handing of
 * control via caml_startup(char**)
 *
 * XXX: There is intentionally no public prototype for this function. There
 * should really be a caml_freestanding_startup(), but I'm lazy and don't have
 * a proper place to put it in the build system right now.
 */
void _nolibc_init(uintptr_t heap_start, size_t heap_size)
{
    sbrk_start = sbrk_cur = heap_start;
    sbrk_end = heap_start + heap_size;
}

/*
 * Called by dlmalloc to allocate or free memory.
 */
void *sbrk(intptr_t increment)
{
    uintptr_t prev, brk;
    prev = brk = sbrk_cur;

    /*
     * dlmalloc guarantees increment values less than half of size_t, so this
     * is safe from overflow.
     */
    brk += increment;
    if (brk >= sbrk_end || brk < sbrk_start)
        return (void *)-1;

    sbrk_cur = brk;
    return (void *)prev;
}

/*
 * dlmalloc configuration:
 */

/*
 * DEBUG not defined and assertions compiled out corresponds to the default
 * recommended configuration (see documentation below). If you need to debug
 * dlmalloc on Solo5 then define DEBUG to `1' here.
 */
#if defined(DEBUG) && (DEBUG)
#define ABORT_ON_ASSERT_FAILURE 0
#else
#undef assert
#define assert(x)
#define NO_MALLINFO 1
#endif

#undef WIN32
#define HAVE_MMAP 0
#define HAVE_MREMAP 0
#define MMAP_CLEARS 0
#define NO_MALLOC_STATS 1
#define LACKS_FCNTL_H
#define LACKS_SYS_PARAM_H
#define LACKS_SYS_MMAN_H
#define LACKS_STRINGS_H
#define LACKS_SYS_TYPES_H
#define LACKS_SCHED_H
#define LACKS_TIME_H
#define MALLOC_FAILURE_ACTION
#define USE_LOCKS 0

/* disable null-pointer-arithmetic warning on clang */
#if defined(__clang__) && __clang_major__ >= 6
#pragma clang diagnostic ignored "-Wnull-pointer-arithmetic"
#endif

/* inline the dlmalloc implementation into this module */
#include "dlmalloc.i"

/*
 * When adding new functions to this module, add them BEFORE the "dlmalloc
 * configuration" comment above, not here.
 */
