all:
	lex json.l 
	yacc -d json.y 
	cc lex.yy.c y.tab.c -ll
	