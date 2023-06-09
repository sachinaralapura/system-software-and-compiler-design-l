%{
#include "y.tab.h"
%}

%%
"print"         {return print;} 
"exit"          {return exit_command;}
"All"           {return All;}
[a-zA-Z]        {yylval.id = yytext[0]; dreturn identifier;}
[0-9]+          {yylval.num = atoi(yytext); return number;}
[ \t\n]         ;
[-+=*\/;]          { return yytext[0];}
.               {ECHO; yyerror("unexpected character");}

%%

int yywrap(void){
    return 1;
}