%{
    #include <stdio.h>
    int b=0 ,op = 0 , id= 0;
%}
%%
[A-Za-z][A-Za-z0-9]*    {id++;printf("\nIdentifier : ");ECHO;}
[\+\-\*\/]              {op++;printf("\nOperator : ");ECHO;}
"("                     {b++;}
")"                     {b--;}
.|\n                    {;}
%%
int main(){
    printf("Enter the expression\n");
    yylex();
    printf("\nTotal no. of identifiers : %d",id);
    printf("\nTotal no. of operators : %d",op);
    if((op+1)==id&&b==0)
        printf("\nExpression is valid\n");
    else
        printf("\nExpression is invalid\n");
}