%{
#include "y.tab.h"
extern int yylval;
%}
%%
[0-9]+  {yylval=atoi(yytext);return NUM;}
[ \n\t]  ;
.       {return yytext[0];}

%%