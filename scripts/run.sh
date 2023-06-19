#!/bin/bash

# Generate the lexical analyzer
# idk why this command is not working
rm -rf ./src/lang/lex.yy.c
flex ./src/lang/lexer.l

# Move the generated file to the src/lang folder
# idk why it's not generated there in the first place
mv ./lex.yy.c ./src/lang/lex.yy.c

# Generate the syntax analyzer
rm -rf ./src/lang/parser.tab.c
rm -rf ./src/lang/parser.tab.h
bison -d ./src/lang/parser.y -o ./src/lang/parser.tab.c # Syntax analysis

rm -rf ./bin
mkdir ./bin

gcc ./src/lang/lex.yy.c ./src/lang/parser.tab.c ./src/lang/lang.c ./src/main.c -o ./bin/lang