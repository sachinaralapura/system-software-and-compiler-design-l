yacc -d anbn.y
lex anbn.l
cc lex.yy.c y.tab.c -ll
./a.out