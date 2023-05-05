%{
    #include <stdio.h>
    int n, count =0;  
%}

%token A B

%%
str:str1 B {if(count!=n) yyerror();}
|B {if(count!=n) yyerror();}
str1:str1 A {count++;}
|A {count++;}
;
%%

main(){
    printf("Enter the value of n\n");
    scanf("%d",&n);
    printf("Enter the string\n");
    yyparse();
    printf("The string is valid\n");
}

int yyerror(){
    printf("Invalid string\n");
    exit(0);
}