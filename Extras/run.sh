yacc -d test.y
lex test.l
cc lex.yy.c y.tab.c -ll
./a.out
