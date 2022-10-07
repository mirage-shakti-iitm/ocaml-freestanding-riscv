#include <stdio.h>

int puts(const char *string)
{
    int i = 0;
   while(string[i])  //standard c idiom for looping through a null-terminated string
    {
        if( putchar(string[i]) == EOF)  //if we got the EOF value from writing the char
        { 
            return EOF;
        }
        i++;
    }
   if(putchar('\n') == EOF)  //this will occur right after we quit due to the null terminated character.
   {
       return EOF;
   }
   return 1; //to meet spec.
}