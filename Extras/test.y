%{
#include <stdio.h>
extern FILE *yyin;
%}

%token NOUN PRONOUN VERB ADVERB ADJECTIVE PREPOSITION CONJUNCTION

%%
sentence:subject VERB object {printf("sentence is valid\n");}
        ;
subject : NOUN
        | PRONOUN
        ;
object  : NOUN
        ;
%%

int main(){
    yyparse();
    return 0;
}

yyerror(){
    printf("error\n");
}