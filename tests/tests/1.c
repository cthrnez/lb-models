#include <time.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

void foo(unsigned long long n, char* src, int* bar)
{
  char buff[64];

  // irrelevant computation
  int m = *bar;
  if (m > 6)
    printf("m=%d (> 6)\n", m);
  else
    printf("m=%d (<= 6)\n", m);

  if (n <= 64)
    memcpy(buff, src, n);

  buff[sizeof(buff)-1] = '\0';

  printf("%s\n", buff);
}

int main(int argc, char** argv)
{
  return 0;
}
