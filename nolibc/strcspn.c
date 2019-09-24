/* 
 * strcspn.c --
 *
 *  Source code for the "strcspn" library routine.
 *
 * Copyright 1988 Regents of the University of California
 * Permission to use, copy, modify, and distribute this
 * software and its documentation for any purpose and without
 * fee is hereby granted, provided that the above copyright
 * notice appear in all copies.  The University of California
 * makes no representations about the suitability of this
 * software for any purpose.  It is provided "as is" without
 * express or implied warranty.
 */
#include <string.h>

/*
 *----------------------------------------------------------------------
 *
 * strcspn --
 *
 *  Count how many of the leading characters there are in "string"
 *  before there's one that's also in "chars".
 *
 * Results:
 *  The return value is the index of the first character in "string"
 *  that is also in "chars".  If there is no such character, then
 *  the return value is the length of "string".
 *
 * Side effects:
 *  None.
 *
 *----------------------------------------------------------------------
 */

size_t strcspn(const char* string, const char* chars)
{   
    const char *p, *s;
    for (s = string; *s != 0; s++) {
      for (p = chars; *p != 0; p++) {
        if (*s == *p) {
          return s-string;
        }
      }
    }
    return s-string;
}