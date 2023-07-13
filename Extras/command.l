%{
#include <stdio.h>
%}

%%
[ \t]+ ;
-?(([0-9]+)|([0-9]+\.[0-9]+)([eE][+-]?[0-9]+)|\.[0-9]+) {printf("floating point number:");ECHO;}
[0-9]+|[0-9]+\.[0-9]+|\.[0-9]+ {printf("Number:");ECHO;}
#.* {printf("Comment:"); ECHO;}
\"[^\"\n]*\" {printf("Text:");ECHO;}
[a-zA-Z][a-zA-Z0-9]+ {printf("Command:"); ECHO;}
\n;
%%
void main(){
    yylex();
}