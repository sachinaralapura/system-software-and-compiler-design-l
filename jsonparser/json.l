%{
    #include <stdio.h>
    #include "y.tab.h"

%}

%%
\"[^"]*\"   {printf("%s",yytext); yylval.stringValue = yytext; return STRING;}
[0-9]+(\.[0-9]+)?([eE][+-]?[0-9]+)? {yylval.numberValue = atof(yytext); return NUMBER ;}
\{          {printf("{");return LBRACE;}
\}          {printf("}");return RBRACE;}
\[          {return LBRACKET; }
\]          {return RBRACKET; }
,           {return COMMA;}
:           {return COLON;}
true|false  {printf("%s",yytext);return BOOL;}
null        { return NULLVALUE; }
[ \t\n]         ; 
. { printf("Invalid character: %s\n", yytext); }
%%

int yywrap(){
    return 1;
}