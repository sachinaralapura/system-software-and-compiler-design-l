yacc -d 3b.y
lex 3b.l
cc y.tab.c lex.yy.c -ll
./a.out 
rm a.out lex.yy.c y.tab.c
