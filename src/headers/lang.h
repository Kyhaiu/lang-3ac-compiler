#pragma once

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define YY_DECL int yylex()
#define YYSTYPE char *

extern int yylex();
extern int yyparse();
extern int fileno(FILE *file);
extern FILE *yyin;

void yyerror(const char *s);

void makeCode(const char *result, const char *arg1, const char *op, const char *arg2);
char *newVariable();
char *newLabel();
