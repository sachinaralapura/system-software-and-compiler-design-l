%{
#include <stdio.h>
#include <stdlib.h>

%}
%token NUM
%left '+''-'
%left '*''/'
%%
input:exp {printf("%d\n",$1);exit(0);}
exp:exp'+'exp {$$=$1+$3;}
|exp'-'exp {$$=$1-$3;}
|exp'*'exp {$$=$1*$3;}
|exp'/'exp {if($3==0){printf("Divide by zero error\n");exit(0);}
else
$$=$1/$3;}
|'('exp')' {$$=$2;}
|NUM {$$=$1;}
;
%%
int main()
{
printf("Enter the expression\n");
yyparse();
}
int yyerror()
{
printf("\nInvalid Expression");
exit(0);
}