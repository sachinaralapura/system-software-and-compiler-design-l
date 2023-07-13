%{
  #include <stdio.h>
  #include <stdlib.h>  
%}

%token A B NL

%%
stmt : S NL {printf("valid string\n");}
S:A S B | 
;
%%
void main(){
    printf("ENTER STRING\n");
    yyparse();
}

int yyerror(){
    printf("invalid string");
    return 0;
}