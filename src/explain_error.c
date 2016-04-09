#include <stdio.h>
#include <stdlib.h>
#include <errno.h>

int main(int argc, char** argv)
{
  extern int errno;
  char buf[80] = {0};
  for(int i = 1; i < argc; i++) {
    errno = atoi(argv[i]);
    sprintf(buf, "%3d ", errno);
    perror(buf);
  }
  return 0;
}
