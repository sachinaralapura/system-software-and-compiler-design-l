yacc -d 2.y
lex 2.l
gcc lex.yy.c y.tab.c -ll
./a.out
