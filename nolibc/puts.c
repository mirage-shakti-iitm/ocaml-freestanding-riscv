#include <stdio.h>
#include <errno.h>
#include <ctype.h>
#include <limits.h>
#include <string.h>
#include <stdarg.h>
#include <math.h>
#include <float.h>
#include <stdint.h>

int puts(const char *string)
{
    int len = strlen(string);

    int ret = stdout->write(stdout, string, len);

   //  while(string[i])  //standard c idiom for looping through a null-terminated string
   //  {
   //      if( putchar(string[i]) == EOF)  //if we got the EOF value from writing the char
   //      { 
   //          return EOF;
   //      }
   //      i++;
   //  }
   // if(putchar('\n') == EOF)  //this will occur right after we quit due to the null terminated character.
   // {
   //     return EOF;
   // }
   return ret; //to meet spec.
}
