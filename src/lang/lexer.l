%option noyywrap

%{
#include "../headers/lang.h"
#include "parser.tab.h"

extern int yylineno;
%}

number [0-9]+
identifier [a-zA-Z][a-zA-Z0-9]*
ignored [ \t\n]

%%

{ignored} {
  if (yytext[0] == '\n') {
    yylineno++;
  }
};
{number} {yylval = strdup(yytext); return NUMBER;}
"IF" { return IF;}
"THEN" { return THEN;}
"ELSE" { return ELSE;}
"END" { return END;}
"REPEAT" { return REPEAT;}
"UNTIL" { return UNTIL;}
"READ" { return READ;}
"WRITE" { return WRITE;}
{identifier} {
    char *str = malloc(strlen(yytext) + 1);
    strcpy(str, yytext);
    yylval = str;
    return ID;
}
"+" { 
  yylval = "+";
  return ADD_OP;
}
"-" { 
  yylval = "-";
  return SUB_OP;
}
"*" { 
  yylval = "*";
  return MUL_OP;
}
"/" { 
  yylval = "/";
  return DIV_OP;
}
"=" { return EQUAL;}
"<" { return LESS;}
"(" { return LEFT_PAREN;}
")" { return RIGHT_PAREN;}
";" { return SEMICOLON;}
":=" { return ASSIGN;}
. {
    fprintf(stderr, "Unknown token: %s at line %d\n", yytext, yylineno);
    fprintf(stderr, "               ^\n");
    exit(1);
}
%%
