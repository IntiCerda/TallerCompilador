flex lexer.l
bison -d parser.y
gcc lex.yy.c parser.tab.c main.c -o compilador -lm