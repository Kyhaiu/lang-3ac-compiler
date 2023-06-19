%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "../headers/lang.h"

extern int yylineno;
extern int label_count;
%}

%token SEMICOLON ASSIGN LESS EQUAL ADD_OP SUB_OP MUL_OP DIV_OP LEFT_PAREN RIGHT_PAREN
%token IF THEN ELSE END REPEAT UNTIL READ WRITE ID NUMBER

%%

program: cmd_seq;
cmd_seq: cmd | cmd_seq SEMICOLON cmd;
cmd: if_cmd | repeat_cmd | assign_cmd | read_cmd | write_cmd;

if_cmd:
    IF _exp_then cmd_seq END { 
        fprintf(stdout, "%s:\n", $2);
    }
    | IF _exp_then cmd_seq _else cmd_seq END {
        fprintf(stdout, "%s:\n", $4);
    }
    ;

_exp_then:
    exp THEN {
        char* label = newLabel();
        fprintf(stdout, "    if %s goto %s\n", $1, label);
        $$ = label;
    }
    ;

_else:
    ELSE {
        char* label_anterior = (char*)malloc(sizeof(char) * 10);
        sprintf(label_anterior, ".L%d", label_count);
        char* label = newLabel();
        fprintf(stdout, "    goto %s\n", label);
        fprintf(stdout, "%s:\n", label_anterior);
        $$ = label;
    }
    ;

repeat_cmd:
    _repeat cmd_seq UNTIL exp {
        char* label = newLabel();
        fprintf(stdout, "    if %s goto %s\n", $4, label);
        fprintf(stdout, "    goto %s\n", $1);
        fprintf(stdout, "%s:\n", label);
    }
    ;

_repeat:
    REPEAT {
        char* label = newLabel();
        fprintf(stdout, "%s:\n", label);
        $$ = label;
    }
    ;

assign_cmd:
    ID ASSIGN exp {
        fprintf(stdout, "    %s = %s\n", $1, $3);
    }
    ;

read_cmd:
    READ ID {
        fprintf(stdout, "    read %s\n", $2);
    }
    ;

write_cmd:
    WRITE exp {
        fprintf(stdout, "    write %s\n", $2);
    }
    ;

exp:
    simple_exp
    | simple_exp rel_op exp {
        char* var = newVariable();
        makeCode(var, $1, $2, $3);
        $$ = var;
    }
    ;

simple_exp:
    term
    | term add_op simple_exp {
        char* var = newVariable();
        makeCode(var, $1, $2, $3);
        $$ = var;
    }
    ;

term:
    factor
    | factor mul_op term {
        char* var = newVariable();
        makeCode(var, $1, $2, $3);
        $$ = var;
    }
    ;

rel_op:
    LESS {
        char* str = (char*)malloc(sizeof(char) * 10);
        sprintf(str, ">=");
        $$ = str;
    }
    | EQUAL {
        char* str = (char*)malloc(sizeof(char) * 10);
        sprintf(str, "!=");
        $$ = str;
    }
    ;

factor:
    LEFT_PAREN exp RIGHT_PAREN {
        $$ = $2;
    }
    | NUMBER
    | ID
    ;

add_op: ADD_OP | SUB_OP;
mul_op: MUL_OP | DIV_OP;

%%