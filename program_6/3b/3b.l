%{
    #include <stdio.h>
    #include "y.tab.h"
%}

%%
"/*"[^*/]*"*/"    ;
"//".*             ;
[\t]    ;
[+|-|*|/|=|<|>] {printf("operator: %s\n",yytext); return OP;}
[0-9]+       {printf("Nummber:%s\n",yytext);return NUM;}
int|char|bool|float|void|for|do|while|if|else|return {printf("keywords : %s\n",yytext); return KEY;}
[a-zA-Z][a-zA-Z0-9]*    {printf("Identifiers : %s\n",yytext); return ID;}
\"[^"]*\"       {;}
.               {;}

%%

