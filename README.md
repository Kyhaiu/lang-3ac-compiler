# LANG: A Small language compiler

## Table of contents

- [Introduction](#introduction)
- [Usage](#usage)
- [Grammar (EBNF)](#ebnf)
- [Dependencies](#dependencies)
- [References](#references)

## Introduction

Lang is a small compiler built using **Flex** and **Bison** to create the lexical and syntactical parsers and convert the analyzed code into three-address code (_TAC_ or _3AC_). The objective of this project is to demonstrate the process of compiler construction and gain additional points in the compiler discipline.

## Usage

Basically to build, you need to run:

```bash
./scripts/build.sh
```

And to test, you need to run:

```bash
./scripts/test.sh
```

Or you can provide your own code, just write and save in any format (The compiler don't match the extension), and you run following command:

```bash
./bin/lang <path_to_your_file/your_file.extension>
```

Also you can run the compiler and tells where is your file, to do that you need run:

```bash
./bin/lang
```

## EBNF

```ebnf
program -> cmd-seq
cmd-seq -> cmd {’;’ cmd}
cmd -> if-cmd | repeat-cmd | assign-cmd | read-cmd | write-cmd
if-cmd-> if exp then cmd-seq [else cmd-seq] end
repeat-cmd -> repeat cmd-seq until exp
assign-cmd -> ID ’:=’ exp
read-cmd -> read ID
write-cmd -> write exp
exp -> simple-exp [rel-op simple-exp]
rel-op -> ’<’ | ’=’
simple-exp -> term {add-op term}
add-op -> ’+’ | ’-’
term -> factor {mul-op factor}
mul-op-> ’*’ | ’/’
factor -> ’(’ exp ’)’ | NUMBER | ID
```

**Note:**

> `[]` are used to optional productions  
> `{}` are used to repetitions(at least one)

## Dependencies

This project needs the [Flex](https://github.com/westes/flex) and [Bison](https://www.gnu.org/software/bison/) installed on your system.

## References

- [Flex](https://github.com/westes/flex)
- [Bison](https://www.gnu.org/software/bison/)
