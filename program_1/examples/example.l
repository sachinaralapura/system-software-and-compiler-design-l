%{
    #include <stdio.h>
    #include "example.h"
%}

%%
:       return COLON;
"db_type"   {printf("%d",TYPE);}
"db_name"   return NAME;
"db_table"  return TABLE_PREFIX;
"db_port"   return PORT;
"exit"      return EXIT;

[a-zA-Z][_a-zA-Z0-9]* return IDENTIFIER;
[1-9][0-9]*         return INTEGER;
[ \t\n]         ;
.               printf("unexpected character");
%%

int yywrap(void){
    return 1;
}