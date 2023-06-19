#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "../headers/lang.h"

int variable_count = 0;
int label_count = 0;
int yylineno = 1;

void yyerror(const char *message)
{
  fprintf(stderr, "%s near to line %d\n", message, yylineno);
  exit(1);
}

void makeCode(const char *result, const char *arg1, const char *op, const char *arg2)
{
  fprintf(stdout, "    %s = %s %s %s\n", result, arg1, op, arg2);
}

char *newVariable()
{
  // variable_count++;
  // char *var = (char *)malloc(sizeof(char) * 10);
  // sprintf(var, "_t%d", variable_count);
  // return var;
  char *str = (char *)malloc(sizeof(char) * (2 + snprintf(NULL, 0, "%d", variable_count)));
  variable_count++;
  sprintf(str, "_t%d", variable_count);
  return str;
}

char *newLabel()
{
  // label_count++;
  // char *label = (char *)malloc(sizeof(char) * 10);
  // sprintf(label, ".L%d", label_count);
  // return label;
  char *str = (char *)malloc(sizeof(char) * (2 + snprintf(NULL, 0, "%d", label_count)));
  label_count++;
  sprintf(str, "L%d", label_count);
  return str;
}