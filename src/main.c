#include <stdio.h>
#include <stdlib.h>

#include "./headers/lang.h"

int main(int argc, char **argv)
{

  if (argc == 1)
  {
    printf("Enter the path to the file you want to compile: ");
    char *path = malloc(sizeof(char) * 100);
    scanf("%s", path);
    yyin = fopen(path, "r");
  }
  else if (argc == 2)
  {
    yyin = fopen(argv[1], "r");
  }
  else if (argc > 2)
  {
    printf("Error: Too many arguments\n");
  }

  do
  {
    yyparse();
  } while (!feof(yyin));

  fclose(yyin);

  return 0;
}
